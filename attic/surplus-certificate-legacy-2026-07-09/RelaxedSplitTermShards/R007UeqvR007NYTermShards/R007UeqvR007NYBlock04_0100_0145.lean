/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R007:u=v:R007NY, term block 4:100-145

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R007UeqvR007NYTermShards

/-- Generator polynomial 4 for relaxed split surplus certificate `R007:u=v:R007NY`. -/
def rs_R007_ueqv_R007NY_generator_04_0100_0145 : Poly :=
[
  term (-2 : Rat) [(6, 1)],
  term (1 : Rat) [(6, 2)],
  term (1 : Rat) [(7, 2)],
  term (2 : Rat) [(12, 1)],
  term (-1 : Rat) [(12, 2)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0100 : Poly :=
[
  term ((1898047485413392423609117 : Rat) / 3779172868318576719228) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 100 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0100 : Poly :=
[
  term ((-1898047485413392423609117 : Rat) / 1889586434159288359614) [(6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((1898047485413392423609117 : Rat) / 3779172868318576719228) [(6, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((1898047485413392423609117 : Rat) / 3779172868318576719228) [(7, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((1898047485413392423609117 : Rat) / 1889586434159288359614) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1898047485413392423609117 : Rat) / 3779172868318576719228) [(8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1898047485413392423609117 : Rat) / 3779172868318576719228) [(8, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0100_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0100
        rs_R007_ueqv_R007NY_generator_04_0100_0145 =
      rs_R007_ueqv_R007NY_partial_04_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0101 : Poly :=
[
  term ((-887650382017012259584195 : Rat) / 3779172868318576719228) [(8, 1), (11, 2), (16, 1)]
]

/-- Partial product 101 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0101 : Poly :=
[
  term ((887650382017012259584195 : Rat) / 1889586434159288359614) [(6, 1), (8, 1), (11, 2), (16, 1)],
  term ((-887650382017012259584195 : Rat) / 3779172868318576719228) [(6, 2), (8, 1), (11, 2), (16, 1)],
  term ((-887650382017012259584195 : Rat) / 3779172868318576719228) [(7, 2), (8, 1), (11, 2), (16, 1)],
  term ((-887650382017012259584195 : Rat) / 1889586434159288359614) [(8, 1), (11, 2), (12, 1), (16, 1)],
  term ((887650382017012259584195 : Rat) / 3779172868318576719228) [(8, 1), (11, 2), (12, 2), (16, 1)],
  term ((887650382017012259584195 : Rat) / 3779172868318576719228) [(8, 1), (11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0101_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0101
        rs_R007_ueqv_R007NY_generator_04_0100_0145 =
      rs_R007_ueqv_R007NY_partial_04_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0102 : Poly :=
[
  term ((13360050452631149533271 : Rat) / 74101428790560327828) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 102 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0102 : Poly :=
[
  term ((-13360050452631149533271 : Rat) / 37050714395280163914) [(6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((13360050452631149533271 : Rat) / 74101428790560327828) [(6, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((13360050452631149533271 : Rat) / 74101428790560327828) [(7, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((13360050452631149533271 : Rat) / 37050714395280163914) [(8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-13360050452631149533271 : Rat) / 74101428790560327828) [(8, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-13360050452631149533271 : Rat) / 74101428790560327828) [(8, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0102_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0102
        rs_R007_ueqv_R007NY_generator_04_0100_0145 =
      rs_R007_ueqv_R007NY_partial_04_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0103 : Poly :=
[
  term ((-9753266115737036198990 : Rat) / 44990153194268770467) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 103 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0103 : Poly :=
[
  term ((19506532231474072397980 : Rat) / 44990153194268770467) [(6, 1), (8, 1), (15, 2), (16, 1)],
  term ((-9753266115737036198990 : Rat) / 44990153194268770467) [(6, 2), (8, 1), (15, 2), (16, 1)],
  term ((-9753266115737036198990 : Rat) / 44990153194268770467) [(7, 2), (8, 1), (15, 2), (16, 1)],
  term ((-19506532231474072397980 : Rat) / 44990153194268770467) [(8, 1), (12, 1), (15, 2), (16, 1)],
  term ((9753266115737036198990 : Rat) / 44990153194268770467) [(8, 1), (12, 2), (15, 2), (16, 1)],
  term ((9753266115737036198990 : Rat) / 44990153194268770467) [(8, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0103_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0103
        rs_R007_ueqv_R007NY_generator_04_0100_0145 =
      rs_R007_ueqv_R007NY_partial_04_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0104 : Poly :=
[
  term ((-51655647831130571026885 : Rat) / 3779172868318576719228) [(9, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 104 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0104 : Poly :=
[
  term ((51655647831130571026885 : Rat) / 1889586434159288359614) [(6, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-51655647831130571026885 : Rat) / 3779172868318576719228) [(6, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-51655647831130571026885 : Rat) / 3779172868318576719228) [(7, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-51655647831130571026885 : Rat) / 1889586434159288359614) [(9, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((51655647831130571026885 : Rat) / 3779172868318576719228) [(9, 1), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((51655647831130571026885 : Rat) / 3779172868318576719228) [(9, 1), (10, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0104_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0104
        rs_R007_ueqv_R007NY_generator_04_0100_0145 =
      rs_R007_ueqv_R007NY_partial_04_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0105 : Poly :=
[
  term ((10331129566226114205377 : Rat) / 1259724289439525573076) [(9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 105 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0105 : Poly :=
[
  term ((-10331129566226114205377 : Rat) / 629862144719762786538) [(6, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((10331129566226114205377 : Rat) / 1259724289439525573076) [(6, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((10331129566226114205377 : Rat) / 1259724289439525573076) [(7, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((10331129566226114205377 : Rat) / 629862144719762786538) [(9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-10331129566226114205377 : Rat) / 1259724289439525573076) [(9, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-10331129566226114205377 : Rat) / 1259724289439525573076) [(9, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0105_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0105
        rs_R007_ueqv_R007NY_generator_04_0100_0145 =
      rs_R007_ueqv_R007NY_partial_04_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0106 : Poly :=
[
  term ((66800252263155747666355 : Rat) / 222304286371680983484) [(9, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 106 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0106 : Poly :=
[
  term ((-66800252263155747666355 : Rat) / 111152143185840491742) [(6, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((66800252263155747666355 : Rat) / 222304286371680983484) [(6, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((66800252263155747666355 : Rat) / 222304286371680983484) [(7, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-66800252263155747666355 : Rat) / 222304286371680983484) [(9, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((66800252263155747666355 : Rat) / 111152143185840491742) [(9, 1), (11, 1), (12, 2), (16, 1)],
  term ((-66800252263155747666355 : Rat) / 222304286371680983484) [(9, 1), (11, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0106_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0106
        rs_R007_ueqv_R007NY_generator_04_0100_0145 =
      rs_R007_ueqv_R007NY_partial_04_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0107 : Poly :=
[
  term ((-48766330578685180994950 : Rat) / 134970459582806311401) [(9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 107 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0107 : Poly :=
[
  term ((97532661157370361989900 : Rat) / 134970459582806311401) [(6, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-48766330578685180994950 : Rat) / 134970459582806311401) [(6, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-48766330578685180994950 : Rat) / 134970459582806311401) [(7, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-97532661157370361989900 : Rat) / 134970459582806311401) [(9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((48766330578685180994950 : Rat) / 134970459582806311401) [(9, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((48766330578685180994950 : Rat) / 134970459582806311401) [(9, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0107_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0107
        rs_R007_ueqv_R007NY_generator_04_0100_0145 =
      rs_R007_ueqv_R007NY_partial_04_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0108 : Poly :=
[
  term ((98952967647642976565 : Rat) / 521121465570680739) [(9, 1), (11, 1), (16, 1)]
]

/-- Partial product 108 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0108 : Poly :=
[
  term ((-197905935295285953130 : Rat) / 521121465570680739) [(6, 1), (9, 1), (11, 1), (16, 1)],
  term ((98952967647642976565 : Rat) / 521121465570680739) [(6, 2), (9, 1), (11, 1), (16, 1)],
  term ((98952967647642976565 : Rat) / 521121465570680739) [(7, 2), (9, 1), (11, 1), (16, 1)],
  term ((197905935295285953130 : Rat) / 521121465570680739) [(9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-98952967647642976565 : Rat) / 521121465570680739) [(9, 1), (11, 1), (12, 2), (16, 1)],
  term ((-98952967647642976565 : Rat) / 521121465570680739) [(9, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0108_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0108
        rs_R007_ueqv_R007NY_generator_04_0100_0145 =
      rs_R007_ueqv_R007NY_partial_04_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0109 : Poly :=
[
  term ((-13360050452631149533271 : Rat) / 74101428790560327828) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 109 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0109 : Poly :=
[
  term ((13360050452631149533271 : Rat) / 37050714395280163914) [(6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-13360050452631149533271 : Rat) / 74101428790560327828) [(6, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-13360050452631149533271 : Rat) / 74101428790560327828) [(7, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((13360050452631149533271 : Rat) / 74101428790560327828) [(9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-13360050452631149533271 : Rat) / 37050714395280163914) [(9, 1), (12, 2), (15, 1), (16, 1)],
  term ((13360050452631149533271 : Rat) / 74101428790560327828) [(9, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0109_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0109
        rs_R007_ueqv_R007NY_generator_04_0100_0145 =
      rs_R007_ueqv_R007NY_partial_04_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0110 : Poly :=
[
  term ((9753266115737036198990 : Rat) / 44990153194268770467) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 110 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0110 : Poly :=
[
  term ((-19506532231474072397980 : Rat) / 44990153194268770467) [(6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((9753266115737036198990 : Rat) / 44990153194268770467) [(6, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((9753266115737036198990 : Rat) / 44990153194268770467) [(7, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((19506532231474072397980 : Rat) / 44990153194268770467) [(9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9753266115737036198990 : Rat) / 44990153194268770467) [(9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-9753266115737036198990 : Rat) / 44990153194268770467) [(9, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0110_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0110
        rs_R007_ueqv_R007NY_generator_04_0100_0145 =
      rs_R007_ueqv_R007NY_partial_04_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0111 : Poly :=
[
  term ((-19790593529528595313 : Rat) / 173707155190226913) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 111 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0111 : Poly :=
[
  term ((39581187059057190626 : Rat) / 173707155190226913) [(6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-19790593529528595313 : Rat) / 173707155190226913) [(6, 2), (9, 1), (15, 1), (16, 1)],
  term ((-19790593529528595313 : Rat) / 173707155190226913) [(7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-39581187059057190626 : Rat) / 173707155190226913) [(9, 1), (12, 1), (15, 1), (16, 1)],
  term ((19790593529528595313 : Rat) / 173707155190226913) [(9, 1), (12, 2), (15, 1), (16, 1)],
  term ((19790593529528595313 : Rat) / 173707155190226913) [(9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0111_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0111
        rs_R007_ueqv_R007NY_generator_04_0100_0145 =
      rs_R007_ueqv_R007NY_partial_04_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0112 : Poly :=
[
  term ((17750441376303607592000 : Rat) / 134970459582806311401) [(10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 112 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0112 : Poly :=
[
  term ((-35500882752607215184000 : Rat) / 134970459582806311401) [(6, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((17750441376303607592000 : Rat) / 134970459582806311401) [(6, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((17750441376303607592000 : Rat) / 134970459582806311401) [(7, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((35500882752607215184000 : Rat) / 134970459582806311401) [(10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-17750441376303607592000 : Rat) / 134970459582806311401) [(10, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-17750441376303607592000 : Rat) / 134970459582806311401) [(10, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0112_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0112
        rs_R007_ueqv_R007NY_generator_04_0100_0145 =
      rs_R007_ueqv_R007NY_partial_04_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0113 : Poly :=
[
  term ((-325586003024876154797465 : Rat) / 3779172868318576719228) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 113 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0113 : Poly :=
[
  term ((325586003024876154797465 : Rat) / 1889586434159288359614) [(6, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-325586003024876154797465 : Rat) / 3779172868318576719228) [(6, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-325586003024876154797465 : Rat) / 3779172868318576719228) [(7, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-325586003024876154797465 : Rat) / 1889586434159288359614) [(10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((325586003024876154797465 : Rat) / 3779172868318576719228) [(10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((325586003024876154797465 : Rat) / 3779172868318576719228) [(10, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0113_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0113
        rs_R007_ueqv_R007NY_generator_04_0100_0145 =
      rs_R007_ueqv_R007NY_partial_04_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0114 : Poly :=
[
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 114 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0114 : Poly :=
[
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(6, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(7, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(10, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0114_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0114
        rs_R007_ueqv_R007NY_generator_04_0100_0145 =
      rs_R007_ueqv_R007NY_partial_04_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0115 : Poly :=
[
  term ((2 : Rat) / 3) [(10, 1), (14, 1), (16, 1)]
]

/-- Partial product 115 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0115 : Poly :=
[
  term ((-4 : Rat) / 3) [(6, 1), (10, 1), (14, 1), (16, 1)],
  term ((2 : Rat) / 3) [(6, 2), (10, 1), (14, 1), (16, 1)],
  term ((2 : Rat) / 3) [(7, 2), (10, 1), (14, 1), (16, 1)],
  term ((4 : Rat) / 3) [(10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(10, 1), (12, 2), (14, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(10, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0115_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0115
        rs_R007_ueqv_R007NY_generator_04_0100_0145 =
      rs_R007_ueqv_R007NY_partial_04_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0116 : Poly :=
[
  term ((65117200604975230959493 : Rat) / 1259724289439525573076) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 116 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0116 : Poly :=
[
  term ((-65117200604975230959493 : Rat) / 629862144719762786538) [(6, 1), (10, 1), (15, 2), (16, 1)],
  term ((65117200604975230959493 : Rat) / 1259724289439525573076) [(6, 2), (10, 1), (15, 2), (16, 1)],
  term ((65117200604975230959493 : Rat) / 1259724289439525573076) [(7, 2), (10, 1), (15, 2), (16, 1)],
  term ((65117200604975230959493 : Rat) / 629862144719762786538) [(10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-65117200604975230959493 : Rat) / 1259724289439525573076) [(10, 1), (12, 2), (15, 2), (16, 1)],
  term ((-65117200604975230959493 : Rat) / 1259724289439525573076) [(10, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0116_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0116
        rs_R007_ueqv_R007NY_generator_04_0100_0145 =
      rs_R007_ueqv_R007NY_partial_04_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0117 : Poly :=
[
  term ((5 : Rat) / 6) [(10, 1), (16, 1)]
]

/-- Partial product 117 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0117 : Poly :=
[
  term ((-5 : Rat) / 3) [(6, 1), (10, 1), (16, 1)],
  term ((5 : Rat) / 6) [(6, 2), (10, 1), (16, 1)],
  term ((5 : Rat) / 6) [(7, 2), (10, 1), (16, 1)],
  term ((5 : Rat) / 3) [(10, 1), (12, 1), (16, 1)],
  term ((-5 : Rat) / 6) [(10, 1), (12, 2), (16, 1)],
  term ((-5 : Rat) / 6) [(10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0117_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0117
        rs_R007_ueqv_R007NY_generator_04_0100_0145 =
      rs_R007_ueqv_R007NY_partial_04_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0118 : Poly :=
[
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 118 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0118 : Poly :=
[
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(6, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(6, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(7, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(11, 1), (12, 1), (13, 3), (14, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(11, 1), (12, 3), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0118_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0118
        rs_R007_ueqv_R007NY_generator_04_0100_0145 =
      rs_R007_ueqv_R007NY_partial_04_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0119 : Poly :=
[
  term ((-1775044137630360759200 : Rat) / 44990153194268770467) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 119 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0119 : Poly :=
[
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(6, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1775044137630360759200 : Rat) / 44990153194268770467) [(6, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1775044137630360759200 : Rat) / 44990153194268770467) [(7, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1775044137630360759200 : Rat) / 44990153194268770467) [(11, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((1775044137630360759200 : Rat) / 44990153194268770467) [(11, 1), (12, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0119_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0119
        rs_R007_ueqv_R007NY_generator_04_0100_0145 =
      rs_R007_ueqv_R007NY_partial_04_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0120 : Poly :=
[
  term ((-402834872261434844838755 : Rat) / 629862144719762786538) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 120 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0120 : Poly :=
[
  term ((402834872261434844838755 : Rat) / 314931072359881393269) [(6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-402834872261434844838755 : Rat) / 629862144719762786538) [(6, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-402834872261434844838755 : Rat) / 629862144719762786538) [(7, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((402834872261434844838755 : Rat) / 629862144719762786538) [(11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-402834872261434844838755 : Rat) / 314931072359881393269) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((402834872261434844838755 : Rat) / 629862144719762786538) [(11, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0120_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0120
        rs_R007_ueqv_R007NY_generator_04_0100_0145 =
      rs_R007_ueqv_R007NY_partial_04_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0121 : Poly :=
[
  term ((157822401603209717350525 : Rat) / 629862144719762786538) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 121 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0121 : Poly :=
[
  term ((-157822401603209717350525 : Rat) / 314931072359881393269) [(6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((157822401603209717350525 : Rat) / 629862144719762786538) [(6, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((157822401603209717350525 : Rat) / 629862144719762786538) [(7, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((157822401603209717350525 : Rat) / 314931072359881393269) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-157822401603209717350525 : Rat) / 629862144719762786538) [(11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-157822401603209717350525 : Rat) / 629862144719762786538) [(11, 1), (13, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0121_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0121
        rs_R007_ueqv_R007NY_generator_04_0100_0145 =
      rs_R007_ueqv_R007NY_partial_04_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0122 : Poly :=
[
  term ((-1775044137630360759200 : Rat) / 44990153194268770467) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 122 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0122 : Poly :=
[
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1775044137630360759200 : Rat) / 44990153194268770467) [(6, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1775044137630360759200 : Rat) / 44990153194268770467) [(7, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((1775044137630360759200 : Rat) / 44990153194268770467) [(11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((1775044137630360759200 : Rat) / 44990153194268770467) [(11, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0122_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0122
        rs_R007_ueqv_R007NY_generator_04_0100_0145 =
      rs_R007_ueqv_R007NY_partial_04_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0123 : Poly :=
[
  term ((9631978763963075063305 : Rat) / 111152143185840491742) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 123 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0123 : Poly :=
[
  term ((-9631978763963075063305 : Rat) / 55576071592920245871) [(6, 1), (11, 1), (13, 1), (16, 1)],
  term ((9631978763963075063305 : Rat) / 111152143185840491742) [(6, 2), (11, 1), (13, 1), (16, 1)],
  term ((9631978763963075063305 : Rat) / 111152143185840491742) [(7, 2), (11, 1), (13, 1), (16, 1)],
  term ((9631978763963075063305 : Rat) / 55576071592920245871) [(11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-9631978763963075063305 : Rat) / 111152143185840491742) [(11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-9631978763963075063305 : Rat) / 111152143185840491742) [(11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0123_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0123
        rs_R007_ueqv_R007NY_generator_04_0100_0145 =
      rs_R007_ueqv_R007NY_partial_04_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0124 : Poly :=
[
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 124 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0124 : Poly :=
[
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(6, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(6, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(7, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(11, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(11, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0124_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0124
        rs_R007_ueqv_R007NY_generator_04_0100_0145 =
      rs_R007_ueqv_R007NY_partial_04_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0125 : Poly :=
[
  term ((379087785813094629698521 : Rat) / 3779172868318576719228) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 125 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0125 : Poly :=
[
  term ((-379087785813094629698521 : Rat) / 1889586434159288359614) [(6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((379087785813094629698521 : Rat) / 3779172868318576719228) [(6, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((379087785813094629698521 : Rat) / 3779172868318576719228) [(7, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((379087785813094629698521 : Rat) / 1889586434159288359614) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-379087785813094629698521 : Rat) / 3779172868318576719228) [(11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-379087785813094629698521 : Rat) / 3779172868318576719228) [(11, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0125_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0125
        rs_R007_ueqv_R007NY_generator_04_0100_0145 =
      rs_R007_ueqv_R007NY_partial_04_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0126 : Poly :=
[
  term ((-2411086853374908321800 : Rat) / 314931072359881393269) [(11, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 126 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0126 : Poly :=
[
  term ((4822173706749816643600 : Rat) / 314931072359881393269) [(6, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2411086853374908321800 : Rat) / 314931072359881393269) [(6, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2411086853374908321800 : Rat) / 314931072359881393269) [(7, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-4822173706749816643600 : Rat) / 314931072359881393269) [(11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((2411086853374908321800 : Rat) / 314931072359881393269) [(11, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((2411086853374908321800 : Rat) / 314931072359881393269) [(11, 1), (13, 2), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0126_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0126
        rs_R007_ueqv_R007NY_generator_04_0100_0145 =
      rs_R007_ueqv_R007NY_partial_04_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0127 : Poly :=
[
  term ((-3163459781875540676382853 : Rat) / 7558345736637153438456) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 127 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0127 : Poly :=
[
  term ((3163459781875540676382853 : Rat) / 3779172868318576719228) [(6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3163459781875540676382853 : Rat) / 7558345736637153438456) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-3163459781875540676382853 : Rat) / 7558345736637153438456) [(7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-3163459781875540676382853 : Rat) / 3779172868318576719228) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term ((3163459781875540676382853 : Rat) / 7558345736637153438456) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((3163459781875540676382853 : Rat) / 7558345736637153438456) [(11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0127_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0127
        rs_R007_ueqv_R007NY_generator_04_0100_0145 =
      rs_R007_ueqv_R007NY_partial_04_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0128 : Poly :=
[
  term ((-2411086853374908321800 : Rat) / 314931072359881393269) [(11, 1), (15, 3), (16, 1)]
]

/-- Partial product 128 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0128 : Poly :=
[
  term ((4822173706749816643600 : Rat) / 314931072359881393269) [(6, 1), (11, 1), (15, 3), (16, 1)],
  term ((-2411086853374908321800 : Rat) / 314931072359881393269) [(6, 2), (11, 1), (15, 3), (16, 1)],
  term ((-2411086853374908321800 : Rat) / 314931072359881393269) [(7, 2), (11, 1), (15, 3), (16, 1)],
  term ((-4822173706749816643600 : Rat) / 314931072359881393269) [(11, 1), (12, 1), (15, 3), (16, 1)],
  term ((2411086853374908321800 : Rat) / 314931072359881393269) [(11, 1), (12, 2), (15, 3), (16, 1)],
  term ((2411086853374908321800 : Rat) / 314931072359881393269) [(11, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0128_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0128
        rs_R007_ueqv_R007NY_generator_04_0100_0145 =
      rs_R007_ueqv_R007NY_partial_04_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0129 : Poly :=
[
  term ((7100176550521443036800 : Rat) / 134970459582806311401) [(11, 2), (12, 1), (16, 1)]
]

/-- Partial product 129 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0129 : Poly :=
[
  term ((-14200353101042886073600 : Rat) / 134970459582806311401) [(6, 1), (11, 2), (12, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 134970459582806311401) [(6, 2), (11, 2), (12, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 134970459582806311401) [(7, 2), (11, 2), (12, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(11, 2), (12, 1), (13, 2), (16, 1)],
  term ((14200353101042886073600 : Rat) / 134970459582806311401) [(11, 2), (12, 2), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(11, 2), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0129_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0129
        rs_R007_ueqv_R007NY_generator_04_0100_0145 =
      rs_R007_ueqv_R007NY_partial_04_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0130 : Poly :=
[
  term ((60088292745643637742265 : Rat) / 3779172868318576719228) [(11, 2), (14, 1), (16, 1)]
]

/-- Partial product 130 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0130 : Poly :=
[
  term ((-60088292745643637742265 : Rat) / 1889586434159288359614) [(6, 1), (11, 2), (14, 1), (16, 1)],
  term ((60088292745643637742265 : Rat) / 3779172868318576719228) [(6, 2), (11, 2), (14, 1), (16, 1)],
  term ((60088292745643637742265 : Rat) / 3779172868318576719228) [(7, 2), (11, 2), (14, 1), (16, 1)],
  term ((60088292745643637742265 : Rat) / 1889586434159288359614) [(11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-60088292745643637742265 : Rat) / 3779172868318576719228) [(11, 2), (12, 2), (14, 1), (16, 1)],
  term ((-60088292745643637742265 : Rat) / 3779172868318576719228) [(11, 2), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0130_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0130
        rs_R007_ueqv_R007NY_generator_04_0100_0145 =
      rs_R007_ueqv_R007NY_partial_04_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0131 : Poly :=
[
  term ((128523290761687895656405 : Rat) / 539881838331225245604) [(11, 2), (16, 1)]
]

/-- Partial product 131 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0131 : Poly :=
[
  term ((-128523290761687895656405 : Rat) / 269940919165612622802) [(6, 1), (11, 2), (16, 1)],
  term ((128523290761687895656405 : Rat) / 539881838331225245604) [(6, 2), (11, 2), (16, 1)],
  term ((128523290761687895656405 : Rat) / 539881838331225245604) [(7, 2), (11, 2), (16, 1)],
  term ((128523290761687895656405 : Rat) / 269940919165612622802) [(11, 2), (12, 1), (16, 1)],
  term ((-128523290761687895656405 : Rat) / 539881838331225245604) [(11, 2), (12, 2), (16, 1)],
  term ((-128523290761687895656405 : Rat) / 539881838331225245604) [(11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0131_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0131
        rs_R007_ueqv_R007NY_generator_04_0100_0145 =
      rs_R007_ueqv_R007NY_partial_04_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0132 : Poly :=
[
  term ((-710017655052144303680 : Rat) / 14996717731422923489) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 132 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0132 : Poly :=
[
  term ((1420035310104288607360 : Rat) / 14996717731422923489) [(6, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-710017655052144303680 : Rat) / 14996717731422923489) [(6, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-710017655052144303680 : Rat) / 14996717731422923489) [(7, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((710017655052144303680 : Rat) / 14996717731422923489) [(12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 14996717731422923489) [(12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((710017655052144303680 : Rat) / 14996717731422923489) [(12, 3), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0132_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0132
        rs_R007_ueqv_R007NY_generator_04_0100_0145 =
      rs_R007_ueqv_R007NY_partial_04_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0133 : Poly :=
[
  term ((355008827526072151840 : Rat) / 14996717731422923489) [(12, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 133 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0133 : Poly :=
[
  term ((-710017655052144303680 : Rat) / 14996717731422923489) [(6, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((355008827526072151840 : Rat) / 14996717731422923489) [(6, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((355008827526072151840 : Rat) / 14996717731422923489) [(7, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-355008827526072151840 : Rat) / 14996717731422923489) [(12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((710017655052144303680 : Rat) / 14996717731422923489) [(12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-355008827526072151840 : Rat) / 14996717731422923489) [(12, 3), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0133_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0133
        rs_R007_ueqv_R007NY_generator_04_0100_0145 =
      rs_R007_ueqv_R007NY_partial_04_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0134 : Poly :=
[
  term ((1 : Rat) / 6) [(12, 1), (14, 1), (16, 1)]
]

/-- Partial product 134 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0134 : Poly :=
[
  term ((-1 : Rat) / 3) [(6, 1), (12, 1), (14, 1), (16, 1)],
  term ((1 : Rat) / 6) [(6, 2), (12, 1), (14, 1), (16, 1)],
  term ((1 : Rat) / 6) [(7, 2), (12, 1), (14, 1), (16, 1)],
  term ((-1 : Rat) / 6) [(12, 1), (13, 2), (14, 1), (16, 1)],
  term ((1 : Rat) / 3) [(12, 2), (14, 1), (16, 1)],
  term ((-1 : Rat) / 6) [(12, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0134_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0134
        rs_R007_ueqv_R007NY_generator_04_0100_0145 =
      rs_R007_ueqv_R007NY_partial_04_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0135 : Poly :=
[
  term ((76590875583994960867143 : Rat) / 209954048239920928846) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 135 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0135 : Poly :=
[
  term ((-76590875583994960867143 : Rat) / 104977024119960464423) [(6, 1), (12, 1), (15, 2), (16, 1)],
  term ((76590875583994960867143 : Rat) / 209954048239920928846) [(6, 2), (12, 1), (15, 2), (16, 1)],
  term ((76590875583994960867143 : Rat) / 209954048239920928846) [(7, 2), (12, 1), (15, 2), (16, 1)],
  term ((-76590875583994960867143 : Rat) / 209954048239920928846) [(12, 1), (13, 2), (15, 2), (16, 1)],
  term ((76590875583994960867143 : Rat) / 104977024119960464423) [(12, 2), (15, 2), (16, 1)],
  term ((-76590875583994960867143 : Rat) / 209954048239920928846) [(12, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0135_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0135
        rs_R007_ueqv_R007NY_generator_04_0100_0145 =
      rs_R007_ueqv_R007NY_partial_04_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0136 : Poly :=
[
  term ((-31564480320641943470105 : Rat) / 209954048239920928846) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 136 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0136 : Poly :=
[
  term ((31564480320641943470105 : Rat) / 104977024119960464423) [(6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-31564480320641943470105 : Rat) / 209954048239920928846) [(6, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-31564480320641943470105 : Rat) / 209954048239920928846) [(7, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-31564480320641943470105 : Rat) / 104977024119960464423) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((31564480320641943470105 : Rat) / 209954048239920928846) [(12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((31564480320641943470105 : Rat) / 209954048239920928846) [(13, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0136_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0136
        rs_R007_ueqv_R007NY_generator_04_0100_0145 =
      rs_R007_ueqv_R007NY_partial_04_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0137 : Poly :=
[
  term ((-960110316863367492671 : Rat) / 18525357197640081957) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 137 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0137 : Poly :=
[
  term ((1920220633726734985342 : Rat) / 18525357197640081957) [(6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-960110316863367492671 : Rat) / 18525357197640081957) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-960110316863367492671 : Rat) / 18525357197640081957) [(7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1920220633726734985342 : Rat) / 18525357197640081957) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((960110316863367492671 : Rat) / 18525357197640081957) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((960110316863367492671 : Rat) / 18525357197640081957) [(13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0137_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0137
        rs_R007_ueqv_R007NY_generator_04_0100_0145 =
      rs_R007_ueqv_R007NY_partial_04_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0138 : Poly :=
[
  term ((355008827526072151840 : Rat) / 14996717731422923489) [(13, 1), (15, 3), (16, 1)]
]

/-- Partial product 138 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0138 : Poly :=
[
  term ((-710017655052144303680 : Rat) / 14996717731422923489) [(6, 1), (13, 1), (15, 3), (16, 1)],
  term ((355008827526072151840 : Rat) / 14996717731422923489) [(6, 2), (13, 1), (15, 3), (16, 1)],
  term ((355008827526072151840 : Rat) / 14996717731422923489) [(7, 2), (13, 1), (15, 3), (16, 1)],
  term ((710017655052144303680 : Rat) / 14996717731422923489) [(12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-355008827526072151840 : Rat) / 14996717731422923489) [(12, 2), (13, 1), (15, 3), (16, 1)],
  term ((-355008827526072151840 : Rat) / 14996717731422923489) [(13, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0138_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0138
        rs_R007_ueqv_R007NY_generator_04_0100_0145 =
      rs_R007_ueqv_R007NY_partial_04_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0139 : Poly :=
[
  term ((-710017655052144303680 : Rat) / 14996717731422923489) [(13, 2), (15, 2), (16, 1)]
]

/-- Partial product 139 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0139 : Poly :=
[
  term ((1420035310104288607360 : Rat) / 14996717731422923489) [(6, 1), (13, 2), (15, 2), (16, 1)],
  term ((-710017655052144303680 : Rat) / 14996717731422923489) [(6, 2), (13, 2), (15, 2), (16, 1)],
  term ((-710017655052144303680 : Rat) / 14996717731422923489) [(7, 2), (13, 2), (15, 2), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 14996717731422923489) [(12, 1), (13, 2), (15, 2), (16, 1)],
  term ((710017655052144303680 : Rat) / 14996717731422923489) [(12, 2), (13, 2), (15, 2), (16, 1)],
  term ((710017655052144303680 : Rat) / 14996717731422923489) [(13, 4), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0139_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0139
        rs_R007_ueqv_R007NY_generator_04_0100_0145 =
      rs_R007_ueqv_R007NY_partial_04_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0140 : Poly :=
[
  term ((-20757038073024040617194 : Rat) / 314931072359881393269) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 140 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0140 : Poly :=
[
  term ((41514076146048081234388 : Rat) / 314931072359881393269) [(6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-20757038073024040617194 : Rat) / 314931072359881393269) [(6, 2), (14, 1), (15, 2), (16, 1)],
  term ((-20757038073024040617194 : Rat) / 314931072359881393269) [(7, 2), (14, 1), (15, 2), (16, 1)],
  term ((-41514076146048081234388 : Rat) / 314931072359881393269) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((20757038073024040617194 : Rat) / 314931072359881393269) [(12, 2), (14, 1), (15, 2), (16, 1)],
  term ((20757038073024040617194 : Rat) / 314931072359881393269) [(13, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0140_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0140
        rs_R007_ueqv_R007NY_generator_04_0100_0145 =
      rs_R007_ueqv_R007NY_partial_04_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0141 : Poly :=
[
  term ((-1 : Rat) / 6) [(14, 1), (16, 1)]
]

/-- Partial product 141 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0141 : Poly :=
[
  term ((1 : Rat) / 3) [(6, 1), (14, 1), (16, 1)],
  term ((-1 : Rat) / 6) [(6, 2), (14, 1), (16, 1)],
  term ((-1 : Rat) / 6) [(7, 2), (14, 1), (16, 1)],
  term ((-1 : Rat) / 3) [(12, 1), (14, 1), (16, 1)],
  term ((1 : Rat) / 6) [(12, 2), (14, 1), (16, 1)],
  term ((1 : Rat) / 6) [(13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0141_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0141
        rs_R007_ueqv_R007NY_generator_04_0100_0145 =
      rs_R007_ueqv_R007NY_partial_04_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0142 : Poly :=
[
  term ((482217370674981664360 : Rat) / 104977024119960464423) [(14, 2), (15, 2), (16, 1)]
]

/-- Partial product 142 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0142 : Poly :=
[
  term ((-964434741349963328720 : Rat) / 104977024119960464423) [(6, 1), (14, 2), (15, 2), (16, 1)],
  term ((482217370674981664360 : Rat) / 104977024119960464423) [(6, 2), (14, 2), (15, 2), (16, 1)],
  term ((482217370674981664360 : Rat) / 104977024119960464423) [(7, 2), (14, 2), (15, 2), (16, 1)],
  term ((964434741349963328720 : Rat) / 104977024119960464423) [(12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-482217370674981664360 : Rat) / 104977024119960464423) [(12, 2), (14, 2), (15, 2), (16, 1)],
  term ((-482217370674981664360 : Rat) / 104977024119960464423) [(13, 2), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0142_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0142
        rs_R007_ueqv_R007NY_generator_04_0100_0145 =
      rs_R007_ueqv_R007NY_partial_04_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0143 : Poly :=
[
  term ((417780607327024091032271 : Rat) / 2519448578879051146152) [(15, 2), (16, 1)]
]

/-- Partial product 143 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0143 : Poly :=
[
  term ((-417780607327024091032271 : Rat) / 1259724289439525573076) [(6, 1), (15, 2), (16, 1)],
  term ((417780607327024091032271 : Rat) / 2519448578879051146152) [(6, 2), (15, 2), (16, 1)],
  term ((417780607327024091032271 : Rat) / 2519448578879051146152) [(7, 2), (15, 2), (16, 1)],
  term ((417780607327024091032271 : Rat) / 1259724289439525573076) [(12, 1), (15, 2), (16, 1)],
  term ((-417780607327024091032271 : Rat) / 2519448578879051146152) [(12, 2), (15, 2), (16, 1)],
  term ((-417780607327024091032271 : Rat) / 2519448578879051146152) [(13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0143_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0143
        rs_R007_ueqv_R007NY_generator_04_0100_0145 =
      rs_R007_ueqv_R007NY_partial_04_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0144 : Poly :=
[
  term ((482217370674981664360 : Rat) / 104977024119960464423) [(15, 4), (16, 1)]
]

/-- Partial product 144 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0144 : Poly :=
[
  term ((-964434741349963328720 : Rat) / 104977024119960464423) [(6, 1), (15, 4), (16, 1)],
  term ((482217370674981664360 : Rat) / 104977024119960464423) [(6, 2), (15, 4), (16, 1)],
  term ((482217370674981664360 : Rat) / 104977024119960464423) [(7, 2), (15, 4), (16, 1)],
  term ((964434741349963328720 : Rat) / 104977024119960464423) [(12, 1), (15, 4), (16, 1)],
  term ((-482217370674981664360 : Rat) / 104977024119960464423) [(12, 2), (15, 4), (16, 1)],
  term ((-482217370674981664360 : Rat) / 104977024119960464423) [(13, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0144_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0144
        rs_R007_ueqv_R007NY_generator_04_0100_0145 =
      rs_R007_ueqv_R007NY_partial_04_0144 := by
  native_decide

/-- Coefficient term 145 from coefficient polynomial 4. -/
def rs_R007_ueqv_R007NY_coefficient_04_0145 : Poly :=
[
  term ((-1 : Rat) / 3) [(16, 1)]
]

/-- Partial product 145 for generator 4. -/
def rs_R007_ueqv_R007NY_partial_04_0145 : Poly :=
[
  term ((2 : Rat) / 3) [(6, 1), (16, 1)],
  term ((-1 : Rat) / 3) [(6, 2), (16, 1)],
  term ((-1 : Rat) / 3) [(7, 2), (16, 1)],
  term ((-2 : Rat) / 3) [(12, 1), (16, 1)],
  term ((1 : Rat) / 3) [(12, 2), (16, 1)],
  term ((1 : Rat) / 3) [(13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 145 for generator 4. -/
theorem rs_R007_ueqv_R007NY_partial_04_0145_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_04_0145
        rs_R007_ueqv_R007NY_generator_04_0100_0145 =
      rs_R007_ueqv_R007NY_partial_04_0145 := by
  native_decide

/-- Partial products in this block. -/
def rs_R007_ueqv_R007NY_partials_04_0100_0145 : List Poly :=
[
  rs_R007_ueqv_R007NY_partial_04_0100,
  rs_R007_ueqv_R007NY_partial_04_0101,
  rs_R007_ueqv_R007NY_partial_04_0102,
  rs_R007_ueqv_R007NY_partial_04_0103,
  rs_R007_ueqv_R007NY_partial_04_0104,
  rs_R007_ueqv_R007NY_partial_04_0105,
  rs_R007_ueqv_R007NY_partial_04_0106,
  rs_R007_ueqv_R007NY_partial_04_0107,
  rs_R007_ueqv_R007NY_partial_04_0108,
  rs_R007_ueqv_R007NY_partial_04_0109,
  rs_R007_ueqv_R007NY_partial_04_0110,
  rs_R007_ueqv_R007NY_partial_04_0111,
  rs_R007_ueqv_R007NY_partial_04_0112,
  rs_R007_ueqv_R007NY_partial_04_0113,
  rs_R007_ueqv_R007NY_partial_04_0114,
  rs_R007_ueqv_R007NY_partial_04_0115,
  rs_R007_ueqv_R007NY_partial_04_0116,
  rs_R007_ueqv_R007NY_partial_04_0117,
  rs_R007_ueqv_R007NY_partial_04_0118,
  rs_R007_ueqv_R007NY_partial_04_0119,
  rs_R007_ueqv_R007NY_partial_04_0120,
  rs_R007_ueqv_R007NY_partial_04_0121,
  rs_R007_ueqv_R007NY_partial_04_0122,
  rs_R007_ueqv_R007NY_partial_04_0123,
  rs_R007_ueqv_R007NY_partial_04_0124,
  rs_R007_ueqv_R007NY_partial_04_0125,
  rs_R007_ueqv_R007NY_partial_04_0126,
  rs_R007_ueqv_R007NY_partial_04_0127,
  rs_R007_ueqv_R007NY_partial_04_0128,
  rs_R007_ueqv_R007NY_partial_04_0129,
  rs_R007_ueqv_R007NY_partial_04_0130,
  rs_R007_ueqv_R007NY_partial_04_0131,
  rs_R007_ueqv_R007NY_partial_04_0132,
  rs_R007_ueqv_R007NY_partial_04_0133,
  rs_R007_ueqv_R007NY_partial_04_0134,
  rs_R007_ueqv_R007NY_partial_04_0135,
  rs_R007_ueqv_R007NY_partial_04_0136,
  rs_R007_ueqv_R007NY_partial_04_0137,
  rs_R007_ueqv_R007NY_partial_04_0138,
  rs_R007_ueqv_R007NY_partial_04_0139,
  rs_R007_ueqv_R007NY_partial_04_0140,
  rs_R007_ueqv_R007NY_partial_04_0141,
  rs_R007_ueqv_R007NY_partial_04_0142,
  rs_R007_ueqv_R007NY_partial_04_0143,
  rs_R007_ueqv_R007NY_partial_04_0144,
  rs_R007_ueqv_R007NY_partial_04_0145
]

/-- Sum of partial products in this block. -/
def rs_R007_ueqv_R007NY_block_04_0100_0145 : Poly :=
[
  term ((-1898047485413392423609117 : Rat) / 1889586434159288359614) [(6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((887650382017012259584195 : Rat) / 1889586434159288359614) [(6, 1), (8, 1), (11, 2), (16, 1)],
  term ((-13360050452631149533271 : Rat) / 37050714395280163914) [(6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((19506532231474072397980 : Rat) / 44990153194268770467) [(6, 1), (8, 1), (15, 2), (16, 1)],
  term ((51655647831130571026885 : Rat) / 1889586434159288359614) [(6, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-10331129566226114205377 : Rat) / 629862144719762786538) [(6, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-66800252263155747666355 : Rat) / 111152143185840491742) [(6, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((97532661157370361989900 : Rat) / 134970459582806311401) [(6, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-197905935295285953130 : Rat) / 521121465570680739) [(6, 1), (9, 1), (11, 1), (16, 1)],
  term ((13360050452631149533271 : Rat) / 37050714395280163914) [(6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-19506532231474072397980 : Rat) / 44990153194268770467) [(6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((39581187059057190626 : Rat) / 173707155190226913) [(6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-35500882752607215184000 : Rat) / 134970459582806311401) [(6, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((325586003024876154797465 : Rat) / 1889586434159288359614) [(6, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(6, 1), (10, 1), (14, 1), (16, 1)],
  term ((-65117200604975230959493 : Rat) / 629862144719762786538) [(6, 1), (10, 1), (15, 2), (16, 1)],
  term ((-5 : Rat) / 3) [(6, 1), (10, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(6, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(6, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((402834872261434844838755 : Rat) / 314931072359881393269) [(6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-157822401603209717350525 : Rat) / 314931072359881393269) [(6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-9631978763963075063305 : Rat) / 55576071592920245871) [(6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(6, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-379087785813094629698521 : Rat) / 1889586434159288359614) [(6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((4822173706749816643600 : Rat) / 314931072359881393269) [(6, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((3163459781875540676382853 : Rat) / 3779172868318576719228) [(6, 1), (11, 1), (15, 1), (16, 1)],
  term ((4822173706749816643600 : Rat) / 314931072359881393269) [(6, 1), (11, 1), (15, 3), (16, 1)],
  term ((-14200353101042886073600 : Rat) / 134970459582806311401) [(6, 1), (11, 2), (12, 1), (16, 1)],
  term ((-60088292745643637742265 : Rat) / 1889586434159288359614) [(6, 1), (11, 2), (14, 1), (16, 1)],
  term ((-128523290761687895656405 : Rat) / 269940919165612622802) [(6, 1), (11, 2), (16, 1)],
  term ((1420035310104288607360 : Rat) / 14996717731422923489) [(6, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-710017655052144303680 : Rat) / 14996717731422923489) [(6, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1 : Rat) / 3) [(6, 1), (12, 1), (14, 1), (16, 1)],
  term ((-76590875583994960867143 : Rat) / 104977024119960464423) [(6, 1), (12, 1), (15, 2), (16, 1)],
  term ((31564480320641943470105 : Rat) / 104977024119960464423) [(6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1920220633726734985342 : Rat) / 18525357197640081957) [(6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-710017655052144303680 : Rat) / 14996717731422923489) [(6, 1), (13, 1), (15, 3), (16, 1)],
  term ((1420035310104288607360 : Rat) / 14996717731422923489) [(6, 1), (13, 2), (15, 2), (16, 1)],
  term ((41514076146048081234388 : Rat) / 314931072359881393269) [(6, 1), (14, 1), (15, 2), (16, 1)],
  term ((1 : Rat) / 3) [(6, 1), (14, 1), (16, 1)],
  term ((-964434741349963328720 : Rat) / 104977024119960464423) [(6, 1), (14, 2), (15, 2), (16, 1)],
  term ((-417780607327024091032271 : Rat) / 1259724289439525573076) [(6, 1), (15, 2), (16, 1)],
  term ((-964434741349963328720 : Rat) / 104977024119960464423) [(6, 1), (15, 4), (16, 1)],
  term ((2 : Rat) / 3) [(6, 1), (16, 1)],
  term ((1898047485413392423609117 : Rat) / 3779172868318576719228) [(6, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-887650382017012259584195 : Rat) / 3779172868318576719228) [(6, 2), (8, 1), (11, 2), (16, 1)],
  term ((13360050452631149533271 : Rat) / 74101428790560327828) [(6, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-9753266115737036198990 : Rat) / 44990153194268770467) [(6, 2), (8, 1), (15, 2), (16, 1)],
  term ((-51655647831130571026885 : Rat) / 3779172868318576719228) [(6, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((10331129566226114205377 : Rat) / 1259724289439525573076) [(6, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((66800252263155747666355 : Rat) / 222304286371680983484) [(6, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-48766330578685180994950 : Rat) / 134970459582806311401) [(6, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((98952967647642976565 : Rat) / 521121465570680739) [(6, 2), (9, 1), (11, 1), (16, 1)],
  term ((-13360050452631149533271 : Rat) / 74101428790560327828) [(6, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((9753266115737036198990 : Rat) / 44990153194268770467) [(6, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-19790593529528595313 : Rat) / 173707155190226913) [(6, 2), (9, 1), (15, 1), (16, 1)],
  term ((17750441376303607592000 : Rat) / 134970459582806311401) [(6, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-325586003024876154797465 : Rat) / 3779172868318576719228) [(6, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(6, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((2 : Rat) / 3) [(6, 2), (10, 1), (14, 1), (16, 1)],
  term ((65117200604975230959493 : Rat) / 1259724289439525573076) [(6, 2), (10, 1), (15, 2), (16, 1)],
  term ((5 : Rat) / 6) [(6, 2), (10, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(6, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1775044137630360759200 : Rat) / 44990153194268770467) [(6, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-402834872261434844838755 : Rat) / 629862144719762786538) [(6, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((157822401603209717350525 : Rat) / 629862144719762786538) [(6, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1775044137630360759200 : Rat) / 44990153194268770467) [(6, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((9631978763963075063305 : Rat) / 111152143185840491742) [(6, 2), (11, 1), (13, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(6, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((379087785813094629698521 : Rat) / 3779172868318576719228) [(6, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2411086853374908321800 : Rat) / 314931072359881393269) [(6, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3163459781875540676382853 : Rat) / 7558345736637153438456) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-2411086853374908321800 : Rat) / 314931072359881393269) [(6, 2), (11, 1), (15, 3), (16, 1)],
  term ((7100176550521443036800 : Rat) / 134970459582806311401) [(6, 2), (11, 2), (12, 1), (16, 1)],
  term ((60088292745643637742265 : Rat) / 3779172868318576719228) [(6, 2), (11, 2), (14, 1), (16, 1)],
  term ((128523290761687895656405 : Rat) / 539881838331225245604) [(6, 2), (11, 2), (16, 1)],
  term ((-710017655052144303680 : Rat) / 14996717731422923489) [(6, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((355008827526072151840 : Rat) / 14996717731422923489) [(6, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((1 : Rat) / 6) [(6, 2), (12, 1), (14, 1), (16, 1)],
  term ((76590875583994960867143 : Rat) / 209954048239920928846) [(6, 2), (12, 1), (15, 2), (16, 1)],
  term ((-31564480320641943470105 : Rat) / 209954048239920928846) [(6, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-960110316863367492671 : Rat) / 18525357197640081957) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((355008827526072151840 : Rat) / 14996717731422923489) [(6, 2), (13, 1), (15, 3), (16, 1)],
  term ((-710017655052144303680 : Rat) / 14996717731422923489) [(6, 2), (13, 2), (15, 2), (16, 1)],
  term ((-20757038073024040617194 : Rat) / 314931072359881393269) [(6, 2), (14, 1), (15, 2), (16, 1)],
  term ((-1 : Rat) / 6) [(6, 2), (14, 1), (16, 1)],
  term ((482217370674981664360 : Rat) / 104977024119960464423) [(6, 2), (14, 2), (15, 2), (16, 1)],
  term ((417780607327024091032271 : Rat) / 2519448578879051146152) [(6, 2), (15, 2), (16, 1)],
  term ((482217370674981664360 : Rat) / 104977024119960464423) [(6, 2), (15, 4), (16, 1)],
  term ((-1 : Rat) / 3) [(6, 2), (16, 1)],
  term ((1898047485413392423609117 : Rat) / 3779172868318576719228) [(7, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-887650382017012259584195 : Rat) / 3779172868318576719228) [(7, 2), (8, 1), (11, 2), (16, 1)],
  term ((13360050452631149533271 : Rat) / 74101428790560327828) [(7, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-9753266115737036198990 : Rat) / 44990153194268770467) [(7, 2), (8, 1), (15, 2), (16, 1)],
  term ((-51655647831130571026885 : Rat) / 3779172868318576719228) [(7, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((10331129566226114205377 : Rat) / 1259724289439525573076) [(7, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((66800252263155747666355 : Rat) / 222304286371680983484) [(7, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-48766330578685180994950 : Rat) / 134970459582806311401) [(7, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((98952967647642976565 : Rat) / 521121465570680739) [(7, 2), (9, 1), (11, 1), (16, 1)],
  term ((-13360050452631149533271 : Rat) / 74101428790560327828) [(7, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((9753266115737036198990 : Rat) / 44990153194268770467) [(7, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-19790593529528595313 : Rat) / 173707155190226913) [(7, 2), (9, 1), (15, 1), (16, 1)],
  term ((17750441376303607592000 : Rat) / 134970459582806311401) [(7, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-325586003024876154797465 : Rat) / 3779172868318576719228) [(7, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(7, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((2 : Rat) / 3) [(7, 2), (10, 1), (14, 1), (16, 1)],
  term ((65117200604975230959493 : Rat) / 1259724289439525573076) [(7, 2), (10, 1), (15, 2), (16, 1)],
  term ((5 : Rat) / 6) [(7, 2), (10, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(7, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1775044137630360759200 : Rat) / 44990153194268770467) [(7, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-402834872261434844838755 : Rat) / 629862144719762786538) [(7, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((157822401603209717350525 : Rat) / 629862144719762786538) [(7, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1775044137630360759200 : Rat) / 44990153194268770467) [(7, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((9631978763963075063305 : Rat) / 111152143185840491742) [(7, 2), (11, 1), (13, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(7, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((379087785813094629698521 : Rat) / 3779172868318576719228) [(7, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2411086853374908321800 : Rat) / 314931072359881393269) [(7, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3163459781875540676382853 : Rat) / 7558345736637153438456) [(7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-2411086853374908321800 : Rat) / 314931072359881393269) [(7, 2), (11, 1), (15, 3), (16, 1)],
  term ((7100176550521443036800 : Rat) / 134970459582806311401) [(7, 2), (11, 2), (12, 1), (16, 1)],
  term ((60088292745643637742265 : Rat) / 3779172868318576719228) [(7, 2), (11, 2), (14, 1), (16, 1)],
  term ((128523290761687895656405 : Rat) / 539881838331225245604) [(7, 2), (11, 2), (16, 1)],
  term ((-710017655052144303680 : Rat) / 14996717731422923489) [(7, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((355008827526072151840 : Rat) / 14996717731422923489) [(7, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((1 : Rat) / 6) [(7, 2), (12, 1), (14, 1), (16, 1)],
  term ((76590875583994960867143 : Rat) / 209954048239920928846) [(7, 2), (12, 1), (15, 2), (16, 1)],
  term ((-31564480320641943470105 : Rat) / 209954048239920928846) [(7, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-960110316863367492671 : Rat) / 18525357197640081957) [(7, 2), (13, 1), (15, 1), (16, 1)],
  term ((355008827526072151840 : Rat) / 14996717731422923489) [(7, 2), (13, 1), (15, 3), (16, 1)],
  term ((-710017655052144303680 : Rat) / 14996717731422923489) [(7, 2), (13, 2), (15, 2), (16, 1)],
  term ((-20757038073024040617194 : Rat) / 314931072359881393269) [(7, 2), (14, 1), (15, 2), (16, 1)],
  term ((-1 : Rat) / 6) [(7, 2), (14, 1), (16, 1)],
  term ((482217370674981664360 : Rat) / 104977024119960464423) [(7, 2), (14, 2), (15, 2), (16, 1)],
  term ((417780607327024091032271 : Rat) / 2519448578879051146152) [(7, 2), (15, 2), (16, 1)],
  term ((482217370674981664360 : Rat) / 104977024119960464423) [(7, 2), (15, 4), (16, 1)],
  term ((-1 : Rat) / 3) [(7, 2), (16, 1)],
  term ((1898047485413392423609117 : Rat) / 1889586434159288359614) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1898047485413392423609117 : Rat) / 3779172868318576719228) [(8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1898047485413392423609117 : Rat) / 3779172868318576719228) [(8, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-887650382017012259584195 : Rat) / 1889586434159288359614) [(8, 1), (11, 2), (12, 1), (16, 1)],
  term ((887650382017012259584195 : Rat) / 3779172868318576719228) [(8, 1), (11, 2), (12, 2), (16, 1)],
  term ((887650382017012259584195 : Rat) / 3779172868318576719228) [(8, 1), (11, 2), (13, 2), (16, 1)],
  term ((13360050452631149533271 : Rat) / 37050714395280163914) [(8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-19506532231474072397980 : Rat) / 44990153194268770467) [(8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-13360050452631149533271 : Rat) / 74101428790560327828) [(8, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((9753266115737036198990 : Rat) / 44990153194268770467) [(8, 1), (12, 2), (15, 2), (16, 1)],
  term ((9753266115737036198990 : Rat) / 44990153194268770467) [(8, 1), (13, 2), (15, 2), (16, 1)],
  term ((-13360050452631149533271 : Rat) / 74101428790560327828) [(8, 1), (13, 3), (15, 1), (16, 1)],
  term ((-51655647831130571026885 : Rat) / 1889586434159288359614) [(9, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((51655647831130571026885 : Rat) / 3779172868318576719228) [(9, 1), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((51655647831130571026885 : Rat) / 3779172868318576719228) [(9, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((10331129566226114205377 : Rat) / 629862144719762786538) [(9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-10331129566226114205377 : Rat) / 1259724289439525573076) [(9, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-10331129566226114205377 : Rat) / 1259724289439525573076) [(9, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-66800252263155747666355 : Rat) / 222304286371680983484) [(9, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-97532661157370361989900 : Rat) / 134970459582806311401) [(9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((197905935295285953130 : Rat) / 521121465570680739) [(9, 1), (11, 1), (12, 1), (16, 1)],
  term ((48766330578685180994950 : Rat) / 134970459582806311401) [(9, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((776800827783294277303345 : Rat) / 1889586434159288359614) [(9, 1), (11, 1), (12, 2), (16, 1)],
  term ((-66800252263155747666355 : Rat) / 222304286371680983484) [(9, 1), (11, 1), (12, 3), (16, 1)],
  term ((48766330578685180994950 : Rat) / 134970459582806311401) [(9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-98952967647642976565 : Rat) / 521121465570680739) [(9, 1), (11, 1), (13, 2), (16, 1)],
  term ((13360050452631149533271 : Rat) / 74101428790560327828) [(9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((19506532231474072397980 : Rat) / 44990153194268770467) [(9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-39581187059057190626 : Rat) / 173707155190226913) [(9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-9753266115737036198990 : Rat) / 44990153194268770467) [(9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-155360165556658855460669 : Rat) / 629862144719762786538) [(9, 1), (12, 2), (15, 1), (16, 1)],
  term ((13360050452631149533271 : Rat) / 74101428790560327828) [(9, 1), (12, 3), (15, 1), (16, 1)],
  term ((-9753266115737036198990 : Rat) / 44990153194268770467) [(9, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((19790593529528595313 : Rat) / 173707155190226913) [(9, 1), (13, 2), (15, 1), (16, 1)],
  term ((35500882752607215184000 : Rat) / 134970459582806311401) [(10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-325586003024876154797465 : Rat) / 1889586434159288359614) [(10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-17750441376303607592000 : Rat) / 134970459582806311401) [(10, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((325586003024876154797465 : Rat) / 3779172868318576719228) [(10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((325586003024876154797465 : Rat) / 3779172868318576719228) [(10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-17750441376303607592000 : Rat) / 134970459582806311401) [(10, 1), (11, 1), (13, 3), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((4 : Rat) / 3) [(10, 1), (12, 1), (14, 1), (16, 1)],
  term ((65117200604975230959493 : Rat) / 629862144719762786538) [(10, 1), (12, 1), (15, 2), (16, 1)],
  term ((5 : Rat) / 3) [(10, 1), (12, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(10, 1), (12, 2), (14, 1), (16, 1)],
  term ((-65117200604975230959493 : Rat) / 1259724289439525573076) [(10, 1), (12, 2), (15, 2), (16, 1)],
  term ((-5 : Rat) / 6) [(10, 1), (12, 2), (16, 1)],
  term ((-2 : Rat) / 3) [(10, 1), (13, 2), (14, 1), (16, 1)],
  term ((-65117200604975230959493 : Rat) / 1259724289439525573076) [(10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-5 : Rat) / 6) [(10, 1), (13, 2), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(10, 1), (13, 3), (15, 1), (16, 1)],
  term ((157822401603209717350525 : Rat) / 314931072359881393269) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((9631978763963075063305 : Rat) / 55576071592920245871) [(11, 1), (12, 1), (13, 1), (16, 1)],
  term ((1775044137630360759200 : Rat) / 44990153194268770467) [(11, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((167412447989578349117985 : Rat) / 209954048239920928846) [(11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(11, 1), (12, 1), (13, 3), (14, 1), (16, 1)],
  term ((379087785813094629698521 : Rat) / 1889586434159288359614) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4822173706749816643600 : Rat) / 314931072359881393269) [(11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3163459781875540676382853 : Rat) / 3779172868318576719228) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4822173706749816643600 : Rat) / 314931072359881393269) [(11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-526305674737923557075 : Rat) / 5674433736214079158) [(11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((1775044137630360759200 : Rat) / 44990153194268770467) [(11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-9631978763963075063305 : Rat) / 111152143185840491742) [(11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(11, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-677295200934995237244121 : Rat) / 3779172868318576719228) [(11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((2411086853374908321800 : Rat) / 314931072359881393269) [(11, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((-6504577152398895599747267 : Rat) / 7558345736637153438456) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((2411086853374908321800 : Rat) / 314931072359881393269) [(11, 1), (12, 2), (15, 3), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(11, 1), (12, 3), (13, 1), (14, 1), (16, 1)],
  term ((1775044137630360759200 : Rat) / 44990153194268770467) [(11, 1), (12, 3), (14, 1), (15, 1), (16, 1)],
  term ((402834872261434844838755 : Rat) / 629862144719762786538) [(11, 1), (12, 3), (15, 1), (16, 1)],
  term ((-379087785813094629698521 : Rat) / 3779172868318576719228) [(11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((2411086853374908321800 : Rat) / 314931072359881393269) [(11, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((3163459781875540676382853 : Rat) / 7558345736637153438456) [(11, 1), (13, 2), (15, 1), (16, 1)],
  term ((2411086853374908321800 : Rat) / 314931072359881393269) [(11, 1), (13, 2), (15, 3), (16, 1)],
  term ((-157822401603209717350525 : Rat) / 629862144719762786538) [(11, 1), (13, 3), (14, 1), (16, 1)],
  term ((1775044137630360759200 : Rat) / 44990153194268770467) [(11, 1), (13, 3), (15, 2), (16, 1)],
  term ((-9631978763963075063305 : Rat) / 111152143185840491742) [(11, 1), (13, 3), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(11, 1), (13, 4), (15, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(11, 2), (12, 1), (13, 2), (16, 1)],
  term ((60088292745643637742265 : Rat) / 1889586434159288359614) [(11, 2), (12, 1), (14, 1), (16, 1)],
  term ((128523290761687895656405 : Rat) / 269940919165612622802) [(11, 2), (12, 1), (16, 1)],
  term ((-60088292745643637742265 : Rat) / 3779172868318576719228) [(11, 2), (12, 2), (14, 1), (16, 1)],
  term ((-23907292785838783787335 : Rat) / 179960612777075081868) [(11, 2), (12, 2), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(11, 2), (12, 3), (16, 1)],
  term ((-60088292745643637742265 : Rat) / 3779172868318576719228) [(11, 2), (13, 2), (14, 1), (16, 1)],
  term ((-128523290761687895656405 : Rat) / 539881838331225245604) [(11, 2), (13, 2), (16, 1)],
  term ((-31564480320641943470105 : Rat) / 104977024119960464423) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1920220633726734985342 : Rat) / 18525357197640081957) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((710017655052144303680 : Rat) / 14996717731422923489) [(12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-355008827526072151840 : Rat) / 14996717731422923489) [(12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-1 : Rat) / 6) [(12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-96471369925455001370183 : Rat) / 209954048239920928846) [(12, 1), (13, 2), (15, 2), (16, 1)],
  term ((710017655052144303680 : Rat) / 14996717731422923489) [(12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-41514076146048081234388 : Rat) / 314931072359881393269) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1 : Rat) / 3) [(12, 1), (14, 1), (16, 1)],
  term ((964434741349963328720 : Rat) / 104977024119960464423) [(12, 1), (14, 2), (15, 2), (16, 1)],
  term ((417780607327024091032271 : Rat) / 1259724289439525573076) [(12, 1), (15, 2), (16, 1)],
  term ((964434741349963328720 : Rat) / 104977024119960464423) [(12, 1), (15, 4), (16, 1)],
  term ((-2 : Rat) / 3) [(12, 1), (16, 1)],
  term ((315783404842754134245 : Rat) / 5674433736214079158) [(12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((960110316863367492671 : Rat) / 18525357197640081957) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-355008827526072151840 : Rat) / 14996717731422923489) [(12, 2), (13, 1), (15, 3), (16, 1)],
  term ((710017655052144303680 : Rat) / 14996717731422923489) [(12, 2), (13, 2), (15, 2), (16, 1)],
  term ((35667408829119070994474 : Rat) / 314931072359881393269) [(12, 2), (14, 1), (15, 2), (16, 1)],
  term ((1 : Rat) / 2) [(12, 2), (14, 1), (16, 1)],
  term ((-482217370674981664360 : Rat) / 104977024119960464423) [(12, 2), (14, 2), (15, 2), (16, 1)],
  term ((1420400406688854969779161 : Rat) / 2519448578879051146152) [(12, 2), (15, 2), (16, 1)],
  term ((-482217370674981664360 : Rat) / 104977024119960464423) [(12, 2), (15, 4), (16, 1)],
  term ((1 : Rat) / 3) [(12, 2), (16, 1)],
  term ((710017655052144303680 : Rat) / 14996717731422923489) [(12, 3), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-355008827526072151840 : Rat) / 14996717731422923489) [(12, 3), (14, 1), (15, 2), (16, 1)],
  term ((-1 : Rat) / 6) [(12, 3), (14, 1), (16, 1)],
  term ((-76590875583994960867143 : Rat) / 209954048239920928846) [(12, 3), (15, 2), (16, 1)],
  term ((20757038073024040617194 : Rat) / 314931072359881393269) [(13, 2), (14, 1), (15, 2), (16, 1)],
  term ((1 : Rat) / 6) [(13, 2), (14, 1), (16, 1)],
  term ((-482217370674981664360 : Rat) / 104977024119960464423) [(13, 2), (14, 2), (15, 2), (16, 1)],
  term ((-417780607327024091032271 : Rat) / 2519448578879051146152) [(13, 2), (15, 2), (16, 1)],
  term ((-482217370674981664360 : Rat) / 104977024119960464423) [(13, 2), (15, 4), (16, 1)],
  term ((1 : Rat) / 3) [(13, 2), (16, 1)],
  term ((31564480320641943470105 : Rat) / 209954048239920928846) [(13, 3), (14, 1), (15, 1), (16, 1)],
  term ((960110316863367492671 : Rat) / 18525357197640081957) [(13, 3), (15, 1), (16, 1)],
  term ((-355008827526072151840 : Rat) / 14996717731422923489) [(13, 3), (15, 3), (16, 1)],
  term ((710017655052144303680 : Rat) / 14996717731422923489) [(13, 4), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 4, terms 100 through 145. -/
theorem rs_R007_ueqv_R007NY_block_04_0100_0145_valid :
    checkProductSumEq rs_R007_ueqv_R007NY_partials_04_0100_0145
      rs_R007_ueqv_R007NY_block_04_0100_0145 = true := by
  native_decide

end R007UeqvR007NYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
