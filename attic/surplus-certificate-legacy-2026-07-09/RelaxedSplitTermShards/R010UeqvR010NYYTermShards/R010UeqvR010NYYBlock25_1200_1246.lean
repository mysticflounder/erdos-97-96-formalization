/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010NYY, term block 25:1200-1246

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010NYYTermShards

/-- Generator polynomial 25 for relaxed split surplus certificate `R010:u=v:R010NYY`. -/
def rs_R010_ueqv_R010NYY_generator_25_1200_1246 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(12, 1)]
]

/-- Coefficient term 1200 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1200 : Poly :=
[
  term ((-475978823129930696075 : Rat) / 6317650508872988544) [(10, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1200 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1200 : Poly :=
[
  term ((-475978823129930696075 : Rat) / 3158825254436494272) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((475978823129930696075 : Rat) / 6317650508872988544) [(10, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1200 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1200_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1200
        rs_R010_ueqv_R010NYY_generator_25_1200_1246 =
      rs_R010_ueqv_R010NYY_partial_25_1200 := by
  native_decide

/-- Coefficient term 1201 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1201 : Poly :=
[
  term ((-29843229626409921277 : Rat) / 8423534011830651392) [(10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 1201 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1201 : Poly :=
[
  term ((-29843229626409921277 : Rat) / 4211767005915325696) [(10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((29843229626409921277 : Rat) / 8423534011830651392) [(10, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1201 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1201_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1201
        rs_R010_ueqv_R010NYY_generator_25_1200_1246 =
      rs_R010_ueqv_R010NYY_partial_25_1201 := by
  native_decide

/-- Coefficient term 1202 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1202 : Poly :=
[
  term ((-39023555492874908592505 : Rat) / 303247224425903450112) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1202 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1202 : Poly :=
[
  term ((-39023555492874908592505 : Rat) / 151623612212951725056) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((39023555492874908592505 : Rat) / 303247224425903450112) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1202 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1202_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1202
        rs_R010_ueqv_R010NYY_generator_25_1200_1246 =
      rs_R010_ueqv_R010NYY_partial_25_1202 := by
  native_decide

/-- Coefficient term 1203 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1203 : Poly :=
[
  term ((17133306291180657379 : Rat) / 4211767005915325696) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1203 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1203 : Poly :=
[
  term ((17133306291180657379 : Rat) / 2105883502957662848) [(10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-17133306291180657379 : Rat) / 4211767005915325696) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1203 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1203_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1203
        rs_R010_ueqv_R010NYY_generator_25_1200_1246 =
      rs_R010_ueqv_R010NYY_partial_25_1203 := by
  native_decide

/-- Coefficient term 1204 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1204 : Poly :=
[
  term ((69556067785407573619 : Rat) / 6317650508872988544) [(10, 1), (11, 2), (14, 1), (16, 1)]
]

/-- Partial product 1204 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1204 : Poly :=
[
  term ((69556067785407573619 : Rat) / 3158825254436494272) [(10, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 6317650508872988544) [(10, 1), (11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1204 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1204_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1204
        rs_R010_ueqv_R010NYY_generator_25_1200_1246 =
      rs_R010_ueqv_R010NYY_partial_25_1204 := by
  native_decide

/-- Coefficient term 1205 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1205 : Poly :=
[
  term ((-3249908850494927 : Rat) / 1704478755934976) [(10, 1), (11, 2), (16, 1)]
]

/-- Partial product 1205 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1205 : Poly :=
[
  term ((-3249908850494927 : Rat) / 852239377967488) [(10, 1), (11, 2), (12, 1), (16, 1)],
  term ((3249908850494927 : Rat) / 1704478755934976) [(10, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1205 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1205_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1205
        rs_R010_ueqv_R010NYY_generator_25_1200_1246 =
      rs_R010_ueqv_R010NYY_partial_25_1205 := by
  native_decide

/-- Coefficient term 1206 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1206 : Poly :=
[
  term ((537094894195411751 : Rat) / 35794053874634496) [(10, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1206 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1206 : Poly :=
[
  term ((-537094894195411751 : Rat) / 35794053874634496) [(10, 1), (12, 1), (15, 2), (16, 1)],
  term ((537094894195411751 : Rat) / 17897026937317248) [(10, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1206 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1206_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1206
        rs_R010_ueqv_R010NYY_generator_25_1200_1246 =
      rs_R010_ueqv_R010NYY_partial_25_1206 := by
  native_decide

/-- Coefficient term 1207 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1207 : Poly :=
[
  term ((-526625011812271235 : Rat) / 35794053874634496) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1207 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1207 : Poly :=
[
  term ((-526625011812271235 : Rat) / 17897026937317248) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((526625011812271235 : Rat) / 35794053874634496) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1207 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1207_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1207
        rs_R010_ueqv_R010NYY_generator_25_1200_1246 =
      rs_R010_ueqv_R010NYY_partial_25_1207 := by
  native_decide

/-- Coefficient term 1208 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1208 : Poly :=
[
  term ((-923014401522365 : Rat) / 1883897572349184) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1208 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1208 : Poly :=
[
  term ((-923014401522365 : Rat) / 941948786174592) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((923014401522365 : Rat) / 1883897572349184) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1208 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1208_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1208
        rs_R010_ueqv_R010NYY_generator_25_1200_1246 =
      rs_R010_ueqv_R010NYY_partial_25_1208 := by
  native_decide

/-- Coefficient term 1209 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1209 : Poly :=
[
  term ((-1367279684903888737 : Rat) / 47725405166179328) [(10, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1209 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1209 : Poly :=
[
  term ((-1367279684903888737 : Rat) / 23862702583089664) [(10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((1367279684903888737 : Rat) / 47725405166179328) [(10, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1209 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1209_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1209
        rs_R010_ueqv_R010NYY_generator_25_1200_1246 =
      rs_R010_ueqv_R010NYY_partial_25_1209 := by
  native_decide

/-- Coefficient term 1210 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1210 : Poly :=
[
  term ((-6423966019096967 : Rat) / 1460981790801408) [(10, 1), (14, 1), (16, 1)]
]

/-- Partial product 1210 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1210 : Poly :=
[
  term ((-6423966019096967 : Rat) / 730490895400704) [(10, 1), (12, 1), (14, 1), (16, 1)],
  term ((6423966019096967 : Rat) / 1460981790801408) [(10, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1210 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1210_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1210
        rs_R010_ueqv_R010NYY_generator_25_1200_1246 =
      rs_R010_ueqv_R010NYY_partial_25_1210 := by
  native_decide

/-- Coefficient term 1211 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1211 : Poly :=
[
  term ((-724990340615301 : Rat) / 426119688983744) [(10, 1), (14, 2), (16, 1)]
]

/-- Partial product 1211 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1211 : Poly :=
[
  term ((-724990340615301 : Rat) / 213059844491872) [(10, 1), (12, 1), (14, 2), (16, 1)],
  term ((724990340615301 : Rat) / 426119688983744) [(10, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1211 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1211_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1211
        rs_R010_ueqv_R010NYY_generator_25_1200_1246 =
      rs_R010_ueqv_R010NYY_partial_25_1211 := by
  native_decide

/-- Coefficient term 1212 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1212 : Poly :=
[
  term ((-144406172790263525 : Rat) / 35794053874634496) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 1212 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1212 : Poly :=
[
  term ((-144406172790263525 : Rat) / 17897026937317248) [(10, 1), (12, 1), (15, 2), (16, 1)],
  term ((144406172790263525 : Rat) / 35794053874634496) [(10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1212 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1212_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1212
        rs_R010_ueqv_R010NYY_generator_25_1200_1246 =
      rs_R010_ueqv_R010NYY_partial_25_1212 := by
  native_decide

/-- Coefficient term 1213 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1213 : Poly :=
[
  term ((1892829473632371 : Rat) / 426119688983744) [(10, 1), (16, 1)]
]

/-- Partial product 1213 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1213 : Poly :=
[
  term ((1892829473632371 : Rat) / 213059844491872) [(10, 1), (12, 1), (16, 1)],
  term ((-1892829473632371 : Rat) / 426119688983744) [(10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1213 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1213_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1213
        rs_R010_ueqv_R010NYY_generator_25_1200_1246 =
      rs_R010_ueqv_R010NYY_partial_25_1213 := by
  native_decide

/-- Coefficient term 1214 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1214 : Poly :=
[
  term ((14849754300339743 : Rat) / 3408957511869952) [(10, 2), (14, 1), (16, 1)]
]

/-- Partial product 1214 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1214 : Poly :=
[
  term ((14849754300339743 : Rat) / 1704478755934976) [(10, 2), (12, 1), (14, 1), (16, 1)],
  term ((-14849754300339743 : Rat) / 3408957511869952) [(10, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1214 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1214_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1214
        rs_R010_ueqv_R010NYY_generator_25_1200_1246 =
      rs_R010_ueqv_R010NYY_partial_25_1214 := by
  native_decide

/-- Coefficient term 1215 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1215 : Poly :=
[
  term ((6118903222396731 : Rat) / 6817915023739904) [(10, 2), (16, 1)]
]

/-- Partial product 1215 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1215 : Poly :=
[
  term ((6118903222396731 : Rat) / 3408957511869952) [(10, 2), (12, 1), (16, 1)],
  term ((-6118903222396731 : Rat) / 6817915023739904) [(10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1215 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1215_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1215
        rs_R010_ueqv_R010NYY_generator_25_1200_1246 =
      rs_R010_ueqv_R010NYY_partial_25_1215 := by
  native_decide

/-- Coefficient term 1216 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1216 : Poly :=
[
  term ((-3249908850494927 : Rat) / 1704478755934976) [(10, 3), (16, 1)]
]

/-- Partial product 1216 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1216 : Poly :=
[
  term ((-3249908850494927 : Rat) / 852239377967488) [(10, 3), (12, 1), (16, 1)],
  term ((3249908850494927 : Rat) / 1704478755934976) [(10, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1216 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1216_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1216
        rs_R010_ueqv_R010NYY_generator_25_1200_1246 =
      rs_R010_ueqv_R010NYY_partial_25_1216 := by
  native_decide

/-- Coefficient term 1217 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1217 : Poly :=
[
  term ((-35250774842988083047 : Rat) / 902521501267569792) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1217 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1217 : Poly :=
[
  term ((35250774842988083047 : Rat) / 902521501267569792) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-35250774842988083047 : Rat) / 451260750633784896) [(11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1217 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1217_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1217
        rs_R010_ueqv_R010NYY_generator_25_1200_1246 =
      rs_R010_ueqv_R010NYY_partial_25_1217 := by
  native_decide

/-- Coefficient term 1218 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1218 : Poly :=
[
  term ((9484796920091569 : Rat) / 1491418911443104) [(11, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 1218 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1218 : Poly :=
[
  term ((-9484796920091569 : Rat) / 1491418911443104) [(11, 1), (12, 1), (15, 3), (16, 1)],
  term ((9484796920091569 : Rat) / 745709455721552) [(11, 1), (12, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1218 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1218_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1218
        rs_R010_ueqv_R010NYY_generator_25_1200_1246 =
      rs_R010_ueqv_R010NYY_partial_25_1218 := by
  native_decide

/-- Coefficient term 1219 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1219 : Poly :=
[
  term ((-51619328980384169 : Rat) / 11931351291544832) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1219 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1219 : Poly :=
[
  term ((-51619328980384169 : Rat) / 5965675645772416) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((51619328980384169 : Rat) / 11931351291544832) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1219 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1219_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1219
        rs_R010_ueqv_R010NYY_generator_25_1200_1246 =
      rs_R010_ueqv_R010NYY_partial_25_1219 := by
  native_decide

/-- Coefficient term 1220 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1220 : Poly :=
[
  term ((914508332195847855763 : Rat) / 37905903053237931264) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1220 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1220 : Poly :=
[
  term ((914508332195847855763 : Rat) / 18952951526618965632) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-914508332195847855763 : Rat) / 37905903053237931264) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1220 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1220_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1220
        rs_R010_ueqv_R010NYY_generator_25_1200_1246 =
      rs_R010_ueqv_R010NYY_partial_25_1220 := by
  native_decide

/-- Coefficient term 1221 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1221 : Poly :=
[
  term ((35784179868088744383709 : Rat) / 303247224425903450112) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1221 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1221 : Poly :=
[
  term ((35784179868088744383709 : Rat) / 151623612212951725056) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-35784179868088744383709 : Rat) / 303247224425903450112) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1221 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1221_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1221
        rs_R010_ueqv_R010NYY_generator_25_1200_1246 =
      rs_R010_ueqv_R010NYY_partial_25_1221 := by
  native_decide

/-- Coefficient term 1222 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1222 : Poly :=
[
  term ((-518893604425934233781 : Rat) / 12635301017745977088) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 1222 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1222 : Poly :=
[
  term ((-518893604425934233781 : Rat) / 6317650508872988544) [(11, 1), (12, 1), (13, 1), (16, 1)],
  term ((518893604425934233781 : Rat) / 12635301017745977088) [(11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1222 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1222_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1222
        rs_R010_ueqv_R010NYY_generator_25_1200_1246 =
      rs_R010_ueqv_R010NYY_partial_25_1222 := by
  native_decide

/-- Coefficient term 1223 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1223 : Poly :=
[
  term ((-3318463411741278334769 : Rat) / 33694136047322605568) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1223 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1223 : Poly :=
[
  term ((-3318463411741278334769 : Rat) / 16847068023661302784) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((3318463411741278334769 : Rat) / 33694136047322605568) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1223 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1223_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1223
        rs_R010_ueqv_R010NYY_generator_25_1200_1246 =
      rs_R010_ueqv_R010NYY_partial_25_1223 := by
  native_decide

/-- Coefficient term 1224 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1224 : Poly :=
[
  term ((-24259046380348383 : Rat) / 11931351291544832) [(11, 1), (14, 1), (15, 3), (16, 1)]
]

/-- Partial product 1224 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1224 : Poly :=
[
  term ((-24259046380348383 : Rat) / 5965675645772416) [(11, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((24259046380348383 : Rat) / 11931351291544832) [(11, 1), (14, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1224 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1224_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1224
        rs_R010_ueqv_R010NYY_generator_25_1200_1246 =
      rs_R010_ueqv_R010NYY_partial_25_1224 := by
  native_decide

/-- Coefficient term 1225 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1225 : Poly :=
[
  term ((39023555492874908592505 : Rat) / 303247224425903450112) [(11, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 1225 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1225 : Poly :=
[
  term ((39023555492874908592505 : Rat) / 151623612212951725056) [(11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-39023555492874908592505 : Rat) / 303247224425903450112) [(11, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1225 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1225_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1225
        rs_R010_ueqv_R010NYY_generator_25_1200_1246 =
      rs_R010_ueqv_R010NYY_partial_25_1225 := by
  native_decide

/-- Coefficient term 1226 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1226 : Poly :=
[
  term ((55604647232384278190465 : Rat) / 202164816283935633408) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1226 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1226 : Poly :=
[
  term ((55604647232384278190465 : Rat) / 101082408141967816704) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-55604647232384278190465 : Rat) / 202164816283935633408) [(11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1226 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1226_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1226
        rs_R010_ueqv_R010NYY_generator_25_1200_1246 =
      rs_R010_ueqv_R010NYY_partial_25_1226 := by
  native_decide

/-- Coefficient term 1227 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1227 : Poly :=
[
  term ((1341088964953954347 : Rat) / 47725405166179328) [(11, 1), (15, 3), (16, 1)]
]

/-- Partial product 1227 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1227 : Poly :=
[
  term ((1341088964953954347 : Rat) / 23862702583089664) [(11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-1341088964953954347 : Rat) / 47725405166179328) [(11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1227 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1227_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1227
        rs_R010_ueqv_R010NYY_generator_25_1200_1246 =
      rs_R010_ueqv_R010NYY_partial_25_1227 := by
  native_decide

/-- Coefficient term 1228 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1228 : Poly :=
[
  term ((132252197491173267009 : Rat) / 4211767005915325696) [(11, 2), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1228 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1228 : Poly :=
[
  term ((-132252197491173267009 : Rat) / 4211767005915325696) [(11, 2), (12, 1), (15, 2), (16, 1)],
  term ((132252197491173267009 : Rat) / 2105883502957662848) [(11, 2), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1228 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1228_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1228
        rs_R010_ueqv_R010NYY_generator_25_1200_1246 =
      rs_R010_ueqv_R010NYY_partial_25_1228 := by
  native_decide

/-- Coefficient term 1229 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1229 : Poly :=
[
  term ((-276328771070420855 : Rat) / 11982267442148864) [(11, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1229 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1229 : Poly :=
[
  term ((-276328771070420855 : Rat) / 5991133721074432) [(11, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((276328771070420855 : Rat) / 11982267442148864) [(11, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1229 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1229_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1229
        rs_R010_ueqv_R010NYY_generator_25_1200_1246 =
      rs_R010_ueqv_R010NYY_partial_25_1229 := by
  native_decide

/-- Coefficient term 1230 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1230 : Poly :=
[
  term ((-2806946967484502872129 : Rat) / 50541204070983908352) [(11, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1230 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1230 : Poly :=
[
  term ((-2806946967484502872129 : Rat) / 25270602035491954176) [(11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((2806946967484502872129 : Rat) / 50541204070983908352) [(11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1230 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1230_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1230
        rs_R010_ueqv_R010NYY_generator_25_1200_1246 =
      rs_R010_ueqv_R010NYY_partial_25_1230 := by
  native_decide

/-- Coefficient term 1231 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1231 : Poly :=
[
  term ((-70245268919840672953 : Rat) / 8423534011830651392) [(11, 2), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1231 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1231 : Poly :=
[
  term ((-70245268919840672953 : Rat) / 4211767005915325696) [(11, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((70245268919840672953 : Rat) / 8423534011830651392) [(11, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1231 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1231_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1231
        rs_R010_ueqv_R010NYY_generator_25_1200_1246 =
      rs_R010_ueqv_R010NYY_partial_25_1231 := by
  native_decide

/-- Coefficient term 1232 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1232 : Poly :=
[
  term ((937933039902755378815 : Rat) / 12635301017745977088) [(11, 2), (14, 1), (16, 1)]
]

/-- Partial product 1232 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1232 : Poly :=
[
  term ((937933039902755378815 : Rat) / 6317650508872988544) [(11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-937933039902755378815 : Rat) / 12635301017745977088) [(11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1232 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1232_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1232
        rs_R010_ueqv_R010NYY_generator_25_1200_1246 =
      rs_R010_ueqv_R010NYY_partial_25_1232 := by
  native_decide

/-- Coefficient term 1233 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1233 : Poly :=
[
  term ((-69556067785407573619 : Rat) / 6317650508872988544) [(11, 2), (14, 2), (16, 1)]
]

/-- Partial product 1233 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1233 : Poly :=
[
  term ((-69556067785407573619 : Rat) / 3158825254436494272) [(11, 2), (12, 1), (14, 2), (16, 1)],
  term ((69556067785407573619 : Rat) / 6317650508872988544) [(11, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1233 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1233_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1233
        rs_R010_ueqv_R010NYY_generator_25_1200_1246 =
      rs_R010_ueqv_R010NYY_partial_25_1233 := by
  native_decide

/-- Coefficient term 1234 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1234 : Poly :=
[
  term ((40100382523260458570707 : Rat) / 303247224425903450112) [(11, 2), (15, 2), (16, 1)]
]

/-- Partial product 1234 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1234 : Poly :=
[
  term ((40100382523260458570707 : Rat) / 151623612212951725056) [(11, 2), (12, 1), (15, 2), (16, 1)],
  term ((-40100382523260458570707 : Rat) / 303247224425903450112) [(11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1234 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1234_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1234
        rs_R010_ueqv_R010NYY_generator_25_1200_1246 =
      rs_R010_ueqv_R010NYY_partial_25_1234 := by
  native_decide

/-- Coefficient term 1235 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1235 : Poly :=
[
  term ((-312569147990625553337 : Rat) / 33694136047322605568) [(11, 2), (16, 1)]
]

/-- Partial product 1235 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1235 : Poly :=
[
  term ((-312569147990625553337 : Rat) / 16847068023661302784) [(11, 2), (12, 1), (16, 1)],
  term ((312569147990625553337 : Rat) / 33694136047322605568) [(11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1235 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1235_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1235
        rs_R010_ueqv_R010NYY_generator_25_1200_1246 =
      rs_R010_ueqv_R010NYY_partial_25_1235 := by
  native_decide

/-- Coefficient term 1236 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1236 : Poly :=
[
  term ((-69556067785407573619 : Rat) / 6317650508872988544) [(11, 3), (15, 1), (16, 1)]
]

/-- Partial product 1236 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1236 : Poly :=
[
  term ((-69556067785407573619 : Rat) / 3158825254436494272) [(11, 3), (12, 1), (15, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 6317650508872988544) [(11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1236 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1236_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1236
        rs_R010_ueqv_R010NYY_generator_25_1200_1246 =
      rs_R010_ueqv_R010NYY_partial_25_1236 := by
  native_decide

/-- Coefficient term 1237 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1237 : Poly :=
[
  term ((-247413013719587831 : Rat) / 20453745071219712) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1237 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1237 : Poly :=
[
  term ((247413013719587831 : Rat) / 20453745071219712) [(12, 1), (15, 2), (16, 1)],
  term ((-247413013719587831 : Rat) / 10226872535609856) [(12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1237 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1237_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1237
        rs_R010_ueqv_R010NYY_generator_25_1200_1246 =
      rs_R010_ueqv_R010NYY_partial_25_1237 := by
  native_decide

/-- Coefficient term 1238 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1238 : Poly :=
[
  term ((2048809516216074139 : Rat) / 214764323247806976) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1238 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1238 : Poly :=
[
  term ((2048809516216074139 : Rat) / 107382161623903488) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2048809516216074139 : Rat) / 214764323247806976) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1238 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1238_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1238
        rs_R010_ueqv_R010NYY_generator_25_1200_1246 =
      rs_R010_ueqv_R010NYY_partial_25_1238 := by
  native_decide

/-- Coefficient term 1239 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1239 : Poly :=
[
  term ((-1286262501909907511 : Rat) / 143176215498537984) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1239 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1239 : Poly :=
[
  term ((-1286262501909907511 : Rat) / 71588107749268992) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1286262501909907511 : Rat) / 143176215498537984) [(13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1239 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1239_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1239
        rs_R010_ueqv_R010NYY_generator_25_1200_1246 =
      rs_R010_ueqv_R010NYY_partial_25_1239 := by
  native_decide

/-- Coefficient term 1240 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1240 : Poly :=
[
  term ((1353319841726368049 : Rat) / 47725405166179328) [(13, 1), (15, 3), (16, 1)]
]

/-- Partial product 1240 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1240 : Poly :=
[
  term ((1353319841726368049 : Rat) / 23862702583089664) [(12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-1353319841726368049 : Rat) / 47725405166179328) [(13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1240 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1240_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1240
        rs_R010_ueqv_R010NYY_generator_25_1200_1246 =
      rs_R010_ueqv_R010NYY_partial_25_1240 := by
  native_decide

/-- Coefficient term 1241 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1241 : Poly :=
[
  term ((-2770456079964529067 : Rat) / 107382161623903488) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1241 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1241 : Poly :=
[
  term ((-2770456079964529067 : Rat) / 53691080811951744) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((2770456079964529067 : Rat) / 107382161623903488) [(14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1241 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1241_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1241
        rs_R010_ueqv_R010NYY_generator_25_1200_1246 =
      rs_R010_ueqv_R010NYY_partial_25_1241 := by
  native_decide

/-- Coefficient term 1242 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1242 : Poly :=
[
  term ((-14924693652329431 : Rat) / 1704478755934976) [(14, 1), (16, 1)]
]

/-- Partial product 1242 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1242 : Poly :=
[
  term ((-14924693652329431 : Rat) / 852239377967488) [(12, 1), (14, 1), (16, 1)],
  term ((14924693652329431 : Rat) / 1704478755934976) [(14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1242 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1242_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1242
        rs_R010_ueqv_R010NYY_generator_25_1200_1246 =
      rs_R010_ueqv_R010NYY_partial_25_1242 := by
  native_decide

/-- Coefficient term 1243 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1243 : Poly :=
[
  term ((1353319841726368049 : Rat) / 47725405166179328) [(14, 2), (15, 2), (16, 1)]
]

/-- Partial product 1243 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1243 : Poly :=
[
  term ((1353319841726368049 : Rat) / 23862702583089664) [(12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-1353319841726368049 : Rat) / 47725405166179328) [(14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1243 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1243_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1243
        rs_R010_ueqv_R010NYY_generator_25_1200_1246 =
      rs_R010_ueqv_R010NYY_partial_25_1243 := by
  native_decide

/-- Coefficient term 1244 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1244 : Poly :=
[
  term ((11986614995996003 : Rat) / 2556718133902464) [(14, 2), (16, 1)]
]

/-- Partial product 1244 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1244 : Poly :=
[
  term ((11986614995996003 : Rat) / 1278359066951232) [(12, 1), (14, 2), (16, 1)],
  term ((-11986614995996003 : Rat) / 2556718133902464) [(14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1244 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1244_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1244
        rs_R010_ueqv_R010NYY_generator_25_1200_1246 =
      rs_R010_ueqv_R010NYY_partial_25_1244 := by
  native_decide

/-- Coefficient term 1245 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1245 : Poly :=
[
  term ((59154715661547336461 : Rat) / 859057292991227904) [(15, 2), (16, 1)]
]

/-- Partial product 1245 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1245 : Poly :=
[
  term ((59154715661547336461 : Rat) / 429528646495613952) [(12, 1), (15, 2), (16, 1)],
  term ((-59154715661547336461 : Rat) / 859057292991227904) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1245 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1245_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1245
        rs_R010_ueqv_R010NYY_generator_25_1200_1246 =
      rs_R010_ueqv_R010NYY_partial_25_1245 := by
  native_decide

/-- Coefficient term 1246 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1246 : Poly :=
[
  term ((682526322749577527 : Rat) / 122722470427318272) [(16, 1)]
]

/-- Partial product 1246 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1246 : Poly :=
[
  term ((682526322749577527 : Rat) / 61361235213659136) [(12, 1), (16, 1)],
  term ((-682526322749577527 : Rat) / 122722470427318272) [(16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1246 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1246_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1246
        rs_R010_ueqv_R010NYY_generator_25_1200_1246 =
      rs_R010_ueqv_R010NYY_partial_25_1246 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010NYY_partials_25_1200_1246 : List Poly :=
[
  rs_R010_ueqv_R010NYY_partial_25_1200,
  rs_R010_ueqv_R010NYY_partial_25_1201,
  rs_R010_ueqv_R010NYY_partial_25_1202,
  rs_R010_ueqv_R010NYY_partial_25_1203,
  rs_R010_ueqv_R010NYY_partial_25_1204,
  rs_R010_ueqv_R010NYY_partial_25_1205,
  rs_R010_ueqv_R010NYY_partial_25_1206,
  rs_R010_ueqv_R010NYY_partial_25_1207,
  rs_R010_ueqv_R010NYY_partial_25_1208,
  rs_R010_ueqv_R010NYY_partial_25_1209,
  rs_R010_ueqv_R010NYY_partial_25_1210,
  rs_R010_ueqv_R010NYY_partial_25_1211,
  rs_R010_ueqv_R010NYY_partial_25_1212,
  rs_R010_ueqv_R010NYY_partial_25_1213,
  rs_R010_ueqv_R010NYY_partial_25_1214,
  rs_R010_ueqv_R010NYY_partial_25_1215,
  rs_R010_ueqv_R010NYY_partial_25_1216,
  rs_R010_ueqv_R010NYY_partial_25_1217,
  rs_R010_ueqv_R010NYY_partial_25_1218,
  rs_R010_ueqv_R010NYY_partial_25_1219,
  rs_R010_ueqv_R010NYY_partial_25_1220,
  rs_R010_ueqv_R010NYY_partial_25_1221,
  rs_R010_ueqv_R010NYY_partial_25_1222,
  rs_R010_ueqv_R010NYY_partial_25_1223,
  rs_R010_ueqv_R010NYY_partial_25_1224,
  rs_R010_ueqv_R010NYY_partial_25_1225,
  rs_R010_ueqv_R010NYY_partial_25_1226,
  rs_R010_ueqv_R010NYY_partial_25_1227,
  rs_R010_ueqv_R010NYY_partial_25_1228,
  rs_R010_ueqv_R010NYY_partial_25_1229,
  rs_R010_ueqv_R010NYY_partial_25_1230,
  rs_R010_ueqv_R010NYY_partial_25_1231,
  rs_R010_ueqv_R010NYY_partial_25_1232,
  rs_R010_ueqv_R010NYY_partial_25_1233,
  rs_R010_ueqv_R010NYY_partial_25_1234,
  rs_R010_ueqv_R010NYY_partial_25_1235,
  rs_R010_ueqv_R010NYY_partial_25_1236,
  rs_R010_ueqv_R010NYY_partial_25_1237,
  rs_R010_ueqv_R010NYY_partial_25_1238,
  rs_R010_ueqv_R010NYY_partial_25_1239,
  rs_R010_ueqv_R010NYY_partial_25_1240,
  rs_R010_ueqv_R010NYY_partial_25_1241,
  rs_R010_ueqv_R010NYY_partial_25_1242,
  rs_R010_ueqv_R010NYY_partial_25_1243,
  rs_R010_ueqv_R010NYY_partial_25_1244,
  rs_R010_ueqv_R010NYY_partial_25_1245,
  rs_R010_ueqv_R010NYY_partial_25_1246
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010NYY_block_25_1200_1246 : Poly :=
[
  term ((-475978823129930696075 : Rat) / 3158825254436494272) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-29843229626409921277 : Rat) / 4211767005915325696) [(10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-39023555492874908592505 : Rat) / 151623612212951725056) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((17133306291180657379 : Rat) / 2105883502957662848) [(10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((475978823129930696075 : Rat) / 6317650508872988544) [(10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((29843229626409921277 : Rat) / 8423534011830651392) [(10, 1), (11, 1), (13, 1), (16, 1)],
  term ((39023555492874908592505 : Rat) / 303247224425903450112) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-17133306291180657379 : Rat) / 4211767005915325696) [(10, 1), (11, 1), (15, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 3158825254436494272) [(10, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-3249908850494927 : Rat) / 852239377967488) [(10, 1), (11, 2), (12, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 6317650508872988544) [(10, 1), (11, 2), (14, 1), (16, 1)],
  term ((3249908850494927 : Rat) / 1704478755934976) [(10, 1), (11, 2), (16, 1)],
  term ((-526625011812271235 : Rat) / 17897026937317248) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-923014401522365 : Rat) / 941948786174592) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1367279684903888737 : Rat) / 23862702583089664) [(10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-6423966019096967 : Rat) / 730490895400704) [(10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-724990340615301 : Rat) / 213059844491872) [(10, 1), (12, 1), (14, 2), (16, 1)],
  term ((-275302413258646267 : Rat) / 11931351291544832) [(10, 1), (12, 1), (15, 2), (16, 1)],
  term ((1892829473632371 : Rat) / 213059844491872) [(10, 1), (12, 1), (16, 1)],
  term ((537094894195411751 : Rat) / 17897026937317248) [(10, 1), (12, 2), (15, 2), (16, 1)],
  term ((526625011812271235 : Rat) / 35794053874634496) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((923014401522365 : Rat) / 1883897572349184) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term ((1367279684903888737 : Rat) / 47725405166179328) [(10, 1), (14, 1), (15, 2), (16, 1)],
  term ((6423966019096967 : Rat) / 1460981790801408) [(10, 1), (14, 1), (16, 1)],
  term ((724990340615301 : Rat) / 426119688983744) [(10, 1), (14, 2), (16, 1)],
  term ((144406172790263525 : Rat) / 35794053874634496) [(10, 1), (15, 2), (16, 1)],
  term ((-1892829473632371 : Rat) / 426119688983744) [(10, 1), (16, 1)],
  term ((14849754300339743 : Rat) / 1704478755934976) [(10, 2), (12, 1), (14, 1), (16, 1)],
  term ((6118903222396731 : Rat) / 3408957511869952) [(10, 2), (12, 1), (16, 1)],
  term ((-14849754300339743 : Rat) / 3408957511869952) [(10, 2), (14, 1), (16, 1)],
  term ((-6118903222396731 : Rat) / 6817915023739904) [(10, 2), (16, 1)],
  term ((-3249908850494927 : Rat) / 852239377967488) [(10, 3), (12, 1), (16, 1)],
  term ((3249908850494927 : Rat) / 1704478755934976) [(10, 3), (16, 1)],
  term ((-51619328980384169 : Rat) / 5965675645772416) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((914508332195847855763 : Rat) / 18952951526618965632) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((35784179868088744383709 : Rat) / 151623612212951725056) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-518893604425934233781 : Rat) / 6317650508872988544) [(11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-3318463411741278334769 : Rat) / 16847068023661302784) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-24259046380348383 : Rat) / 5965675645772416) [(11, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((39023555492874908592505 : Rat) / 151623612212951725056) [(11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((19850911338266314497243 : Rat) / 33694136047322605568) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term ((169904602033212749 : Rat) / 3408957511869952) [(11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-35250774842988083047 : Rat) / 451260750633784896) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((9484796920091569 : Rat) / 745709455721552) [(11, 1), (12, 2), (15, 3), (16, 1)],
  term ((51619328980384169 : Rat) / 11931351291544832) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-914508332195847855763 : Rat) / 37905903053237931264) [(11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-35784179868088744383709 : Rat) / 303247224425903450112) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((518893604425934233781 : Rat) / 12635301017745977088) [(11, 1), (13, 1), (16, 1)],
  term ((3318463411741278334769 : Rat) / 33694136047322605568) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term ((24259046380348383 : Rat) / 11931351291544832) [(11, 1), (14, 1), (15, 3), (16, 1)],
  term ((-39023555492874908592505 : Rat) / 303247224425903450112) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-55604647232384278190465 : Rat) / 202164816283935633408) [(11, 1), (15, 1), (16, 1)],
  term ((-1341088964953954347 : Rat) / 47725405166179328) [(11, 1), (15, 3), (16, 1)],
  term ((-276328771070420855 : Rat) / 5991133721074432) [(11, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2806946967484502872129 : Rat) / 25270602035491954176) [(11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-70245268919840672953 : Rat) / 4211767005915325696) [(11, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((937933039902755378815 : Rat) / 6317650508872988544) [(11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 3158825254436494272) [(11, 2), (12, 1), (14, 2), (16, 1)],
  term ((35339303413578220958383 : Rat) / 151623612212951725056) [(11, 2), (12, 1), (15, 2), (16, 1)],
  term ((-312569147990625553337 : Rat) / 16847068023661302784) [(11, 2), (12, 1), (16, 1)],
  term ((132252197491173267009 : Rat) / 2105883502957662848) [(11, 2), (12, 2), (15, 2), (16, 1)],
  term ((276328771070420855 : Rat) / 11982267442148864) [(11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2806946967484502872129 : Rat) / 50541204070983908352) [(11, 2), (13, 1), (15, 1), (16, 1)],
  term ((70245268919840672953 : Rat) / 8423534011830651392) [(11, 2), (14, 1), (15, 2), (16, 1)],
  term ((-937933039902755378815 : Rat) / 12635301017745977088) [(11, 2), (14, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 6317650508872988544) [(11, 2), (14, 2), (16, 1)],
  term ((-40100382523260458570707 : Rat) / 303247224425903450112) [(11, 2), (15, 2), (16, 1)],
  term ((312569147990625553337 : Rat) / 33694136047322605568) [(11, 2), (16, 1)],
  term ((-69556067785407573619 : Rat) / 3158825254436494272) [(11, 3), (12, 1), (15, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 6317650508872988544) [(11, 3), (15, 1), (16, 1)],
  term ((2048809516216074139 : Rat) / 107382161623903488) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1286262501909907511 : Rat) / 71588107749268992) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1353319841726368049 : Rat) / 23862702583089664) [(12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-2770456079964529067 : Rat) / 53691080811951744) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-14924693652329431 : Rat) / 852239377967488) [(12, 1), (14, 1), (16, 1)],
  term ((1353319841726368049 : Rat) / 23862702583089664) [(12, 1), (14, 2), (15, 2), (16, 1)],
  term ((11986614995996003 : Rat) / 1278359066951232) [(12, 1), (14, 2), (16, 1)],
  term ((4021899309353667557 : Rat) / 26845540405975872) [(12, 1), (15, 2), (16, 1)],
  term ((682526322749577527 : Rat) / 61361235213659136) [(12, 1), (16, 1)],
  term ((-247413013719587831 : Rat) / 10226872535609856) [(12, 2), (15, 2), (16, 1)],
  term ((-2048809516216074139 : Rat) / 214764323247806976) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1286262501909907511 : Rat) / 143176215498537984) [(13, 1), (15, 1), (16, 1)],
  term ((-1353319841726368049 : Rat) / 47725405166179328) [(13, 1), (15, 3), (16, 1)],
  term ((2770456079964529067 : Rat) / 107382161623903488) [(14, 1), (15, 2), (16, 1)],
  term ((14924693652329431 : Rat) / 1704478755934976) [(14, 1), (16, 1)],
  term ((-1353319841726368049 : Rat) / 47725405166179328) [(14, 2), (15, 2), (16, 1)],
  term ((-11986614995996003 : Rat) / 2556718133902464) [(14, 2), (16, 1)],
  term ((-59154715661547336461 : Rat) / 859057292991227904) [(15, 2), (16, 1)],
  term ((-682526322749577527 : Rat) / 122722470427318272) [(16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 25, terms 1200 through 1246. -/
theorem rs_R010_ueqv_R010NYY_block_25_1200_1246_valid :
    checkProductSumEq rs_R010_ueqv_R010NYY_partials_25_1200_1246
      rs_R010_ueqv_R010NYY_block_25_1200_1246 = true := by
  native_decide

end R010UeqvR010NYYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
