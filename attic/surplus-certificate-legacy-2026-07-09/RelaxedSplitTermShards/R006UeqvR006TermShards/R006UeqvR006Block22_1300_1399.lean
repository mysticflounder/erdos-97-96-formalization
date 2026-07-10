/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R006:u=v:R006, term block 22:1300-1399

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R006UeqvR006TermShards

/-- Generator polynomial 22 for relaxed split surplus certificate `R006:u=v:R006`. -/
def rs_R006_ueqv_R006_generator_22_1300_1399 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(10, 1)]
]

/-- Coefficient term 1300 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1300 : Poly :=
[
  term ((576 : Rat) / 5) [(3, 1), (7, 1), (9, 2), (10, 1), (16, 1)]
]

/-- Partial product 1300 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1300 : Poly :=
[
  term ((-576 : Rat) / 5) [(3, 1), (7, 1), (9, 2), (10, 1), (16, 1)],
  term ((1152 : Rat) / 5) [(3, 1), (7, 1), (9, 2), (10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1300 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1300_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1300
        rs_R006_ueqv_R006_generator_22_1300_1399 =
      rs_R006_ueqv_R006_partial_22_1300 := by
  native_decide

/-- Coefficient term 1301 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1301 : Poly :=
[
  term ((-432 : Rat) / 5) [(3, 1), (7, 1), (9, 2), (14, 1)]
]

/-- Partial product 1301 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1301 : Poly :=
[
  term ((-864 : Rat) / 5) [(3, 1), (7, 1), (9, 2), (10, 1), (14, 1)],
  term ((432 : Rat) / 5) [(3, 1), (7, 1), (9, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1301 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1301_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1301
        rs_R006_ueqv_R006_generator_22_1300_1399 =
      rs_R006_ueqv_R006_partial_22_1301 := by
  native_decide

/-- Coefficient term 1302 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1302 : Poly :=
[
  term ((144 : Rat) / 5) [(3, 1), (7, 1), (9, 2), (14, 1), (16, 1)]
]

/-- Partial product 1302 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1302 : Poly :=
[
  term ((288 : Rat) / 5) [(3, 1), (7, 1), (9, 2), (10, 1), (14, 1), (16, 1)],
  term ((-144 : Rat) / 5) [(3, 1), (7, 1), (9, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1302 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1302_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1302
        rs_R006_ueqv_R006_generator_22_1300_1399 =
      rs_R006_ueqv_R006_partial_22_1302 := by
  native_decide

/-- Coefficient term 1303 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1303 : Poly :=
[
  term ((288 : Rat) / 5) [(3, 1), (7, 1), (9, 2), (16, 1)]
]

/-- Partial product 1303 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1303 : Poly :=
[
  term ((576 : Rat) / 5) [(3, 1), (7, 1), (9, 2), (10, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(3, 1), (7, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1303 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1303_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1303
        rs_R006_ueqv_R006_generator_22_1300_1399 =
      rs_R006_ueqv_R006_partial_22_1303 := by
  native_decide

/-- Coefficient term 1304 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1304 : Poly :=
[
  term (342 : Rat) [(3, 1), (7, 1), (10, 1)]
]

/-- Partial product 1304 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1304 : Poly :=
[
  term (-342 : Rat) [(3, 1), (7, 1), (10, 1)],
  term (684 : Rat) [(3, 1), (7, 1), (10, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1304 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1304_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1304
        rs_R006_ueqv_R006_generator_22_1300_1399 =
      rs_R006_ueqv_R006_partial_22_1304 := by
  native_decide

/-- Coefficient term 1305 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1305 : Poly :=
[
  term ((-2436 : Rat) / 5) [(3, 1), (7, 1), (10, 1), (12, 1)]
]

/-- Partial product 1305 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1305 : Poly :=
[
  term ((2436 : Rat) / 5) [(3, 1), (7, 1), (10, 1), (12, 1)],
  term ((-4872 : Rat) / 5) [(3, 1), (7, 1), (10, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1305 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1305_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1305
        rs_R006_ueqv_R006_generator_22_1300_1399 =
      rs_R006_ueqv_R006_partial_22_1305 := by
  native_decide

/-- Coefficient term 1306 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1306 : Poly :=
[
  term ((-1044 : Rat) / 5) [(3, 1), (7, 1), (10, 1), (12, 1), (14, 1)]
]

/-- Partial product 1306 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1306 : Poly :=
[
  term ((1044 : Rat) / 5) [(3, 1), (7, 1), (10, 1), (12, 1), (14, 1)],
  term ((-2088 : Rat) / 5) [(3, 1), (7, 1), (10, 2), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1306 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1306_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1306
        rs_R006_ueqv_R006_generator_22_1300_1399 =
      rs_R006_ueqv_R006_partial_22_1306 := by
  native_decide

/-- Coefficient term 1307 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1307 : Poly :=
[
  term ((384 : Rat) / 5) [(3, 1), (7, 1), (10, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 1307 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1307 : Poly :=
[
  term ((-384 : Rat) / 5) [(3, 1), (7, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((768 : Rat) / 5) [(3, 1), (7, 1), (10, 2), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1307 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1307_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1307
        rs_R006_ueqv_R006_generator_22_1300_1399 =
      rs_R006_ueqv_R006_partial_22_1307 := by
  native_decide

/-- Coefficient term 1308 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1308 : Poly :=
[
  term ((772 : Rat) / 5) [(3, 1), (7, 1), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 1308 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1308 : Poly :=
[
  term ((-772 : Rat) / 5) [(3, 1), (7, 1), (10, 1), (12, 1), (16, 1)],
  term ((1544 : Rat) / 5) [(3, 1), (7, 1), (10, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1308 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1308_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1308
        rs_R006_ueqv_R006_generator_22_1300_1399 =
      rs_R006_ueqv_R006_partial_22_1308 := by
  native_decide

/-- Coefficient term 1309 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1309 : Poly :=
[
  term ((594 : Rat) / 5) [(3, 1), (7, 1), (10, 1), (14, 1)]
]

/-- Partial product 1309 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1309 : Poly :=
[
  term ((-594 : Rat) / 5) [(3, 1), (7, 1), (10, 1), (14, 1)],
  term ((1188 : Rat) / 5) [(3, 1), (7, 1), (10, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1309 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1309_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1309
        rs_R006_ueqv_R006_generator_22_1300_1399 =
      rs_R006_ueqv_R006_partial_22_1309 := by
  native_decide

/-- Coefficient term 1310 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1310 : Poly :=
[
  term ((-258 : Rat) / 5) [(3, 1), (7, 1), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 1310 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1310 : Poly :=
[
  term ((258 : Rat) / 5) [(3, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term ((-516 : Rat) / 5) [(3, 1), (7, 1), (10, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1310 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1310_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1310
        rs_R006_ueqv_R006_generator_22_1300_1399 =
      rs_R006_ueqv_R006_partial_22_1310 := by
  native_decide

/-- Coefficient term 1311 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1311 : Poly :=
[
  term ((-522 : Rat) / 5) [(3, 1), (7, 1), (10, 1), (16, 1)]
]

/-- Partial product 1311 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1311 : Poly :=
[
  term ((522 : Rat) / 5) [(3, 1), (7, 1), (10, 1), (16, 1)],
  term ((-1044 : Rat) / 5) [(3, 1), (7, 1), (10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1311 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1311_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1311
        rs_R006_ueqv_R006_generator_22_1300_1399 =
      rs_R006_ueqv_R006_partial_22_1311 := by
  native_decide

/-- Coefficient term 1312 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1312 : Poly :=
[
  term (-588 : Rat) [(3, 1), (7, 1), (12, 1)]
]

/-- Partial product 1312 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1312 : Poly :=
[
  term (-1176 : Rat) [(3, 1), (7, 1), (10, 1), (12, 1)],
  term (588 : Rat) [(3, 1), (7, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1312 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1312_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1312
        rs_R006_ueqv_R006_generator_22_1300_1399 =
      rs_R006_ueqv_R006_partial_22_1312 := by
  native_decide

/-- Coefficient term 1313 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1313 : Poly :=
[
  term ((-1404 : Rat) / 5) [(3, 1), (7, 1), (12, 1), (14, 1)]
]

/-- Partial product 1313 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1313 : Poly :=
[
  term ((-2808 : Rat) / 5) [(3, 1), (7, 1), (10, 1), (12, 1), (14, 1)],
  term ((1404 : Rat) / 5) [(3, 1), (7, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1313 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1313_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1313
        rs_R006_ueqv_R006_generator_22_1300_1399 =
      rs_R006_ueqv_R006_partial_22_1313 := by
  native_decide

/-- Coefficient term 1314 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1314 : Poly :=
[
  term (96 : Rat) [(3, 1), (7, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 1314 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1314 : Poly :=
[
  term (192 : Rat) [(3, 1), (7, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term (-96 : Rat) [(3, 1), (7, 1), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1314 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1314_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1314
        rs_R006_ueqv_R006_generator_22_1300_1399 =
      rs_R006_ueqv_R006_partial_22_1314 := by
  native_decide

/-- Coefficient term 1315 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1315 : Poly :=
[
  term ((952 : Rat) / 5) [(3, 1), (7, 1), (12, 1), (16, 1)]
]

/-- Partial product 1315 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1315 : Poly :=
[
  term ((1904 : Rat) / 5) [(3, 1), (7, 1), (10, 1), (12, 1), (16, 1)],
  term ((-952 : Rat) / 5) [(3, 1), (7, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1315 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1315_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1315
        rs_R006_ueqv_R006_generator_22_1300_1399 =
      rs_R006_ueqv_R006_partial_22_1315 := by
  native_decide

/-- Coefficient term 1316 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1316 : Poly :=
[
  term ((996 : Rat) / 5) [(3, 1), (7, 1), (12, 2)]
]

/-- Partial product 1316 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1316 : Poly :=
[
  term ((1992 : Rat) / 5) [(3, 1), (7, 1), (10, 1), (12, 2)],
  term ((-996 : Rat) / 5) [(3, 1), (7, 1), (12, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1316 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1316_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1316
        rs_R006_ueqv_R006_generator_22_1300_1399 =
      rs_R006_ueqv_R006_partial_22_1316 := by
  native_decide

/-- Coefficient term 1317 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1317 : Poly :=
[
  term ((324 : Rat) / 5) [(3, 1), (7, 1), (12, 2), (14, 1)]
]

/-- Partial product 1317 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1317 : Poly :=
[
  term ((648 : Rat) / 5) [(3, 1), (7, 1), (10, 1), (12, 2), (14, 1)],
  term ((-324 : Rat) / 5) [(3, 1), (7, 1), (12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1317 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1317_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1317
        rs_R006_ueqv_R006_generator_22_1300_1399 =
      rs_R006_ueqv_R006_partial_22_1317 := by
  native_decide

/-- Coefficient term 1318 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1318 : Poly :=
[
  term ((-144 : Rat) / 5) [(3, 1), (7, 1), (12, 2), (14, 1), (16, 1)]
]

/-- Partial product 1318 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1318 : Poly :=
[
  term ((-288 : Rat) / 5) [(3, 1), (7, 1), (10, 1), (12, 2), (14, 1), (16, 1)],
  term ((144 : Rat) / 5) [(3, 1), (7, 1), (12, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1318 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1318_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1318
        rs_R006_ueqv_R006_generator_22_1300_1399 =
      rs_R006_ueqv_R006_partial_22_1318 := by
  native_decide

/-- Coefficient term 1319 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1319 : Poly :=
[
  term ((-292 : Rat) / 5) [(3, 1), (7, 1), (12, 2), (16, 1)]
]

/-- Partial product 1319 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1319 : Poly :=
[
  term ((-584 : Rat) / 5) [(3, 1), (7, 1), (10, 1), (12, 2), (16, 1)],
  term ((292 : Rat) / 5) [(3, 1), (7, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1319 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1319_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1319
        rs_R006_ueqv_R006_generator_22_1300_1399 =
      rs_R006_ueqv_R006_partial_22_1319 := by
  native_decide

/-- Coefficient term 1320 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1320 : Poly :=
[
  term (33 : Rat) [(3, 1), (7, 1), (14, 1)]
]

/-- Partial product 1320 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1320 : Poly :=
[
  term (66 : Rat) [(3, 1), (7, 1), (10, 1), (14, 1)],
  term (-33 : Rat) [(3, 1), (7, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1320 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1320_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1320
        rs_R006_ueqv_R006_generator_22_1300_1399 =
      rs_R006_ueqv_R006_partial_22_1320 := by
  native_decide

/-- Coefficient term 1321 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1321 : Poly :=
[
  term ((-81 : Rat) / 5) [(3, 1), (7, 1), (14, 1), (16, 1)]
]

/-- Partial product 1321 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1321 : Poly :=
[
  term ((-162 : Rat) / 5) [(3, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term ((81 : Rat) / 5) [(3, 1), (7, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1321 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1321_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1321
        rs_R006_ueqv_R006_generator_22_1300_1399 =
      rs_R006_ueqv_R006_partial_22_1321 := by
  native_decide

/-- Coefficient term 1322 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1322 : Poly :=
[
  term ((-179 : Rat) / 5) [(3, 1), (7, 1), (16, 1)]
]

/-- Partial product 1322 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1322 : Poly :=
[
  term ((-358 : Rat) / 5) [(3, 1), (7, 1), (10, 1), (16, 1)],
  term ((179 : Rat) / 5) [(3, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1322 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1322_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1322
        rs_R006_ueqv_R006_generator_22_1300_1399 =
      rs_R006_ueqv_R006_partial_22_1322 := by
  native_decide

/-- Coefficient term 1323 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1323 : Poly :=
[
  term (432 : Rat) [(3, 1), (8, 1), (9, 1)]
]

/-- Partial product 1323 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1323 : Poly :=
[
  term (-432 : Rat) [(3, 1), (8, 1), (9, 1)],
  term (864 : Rat) [(3, 1), (8, 1), (9, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1323 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1323_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1323
        rs_R006_ueqv_R006_generator_22_1300_1399 =
      rs_R006_ueqv_R006_partial_22_1323 := by
  native_decide

/-- Coefficient term 1324 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1324 : Poly :=
[
  term ((-432 : Rat) / 5) [(3, 1), (8, 1), (9, 1), (10, 1)]
]

/-- Partial product 1324 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1324 : Poly :=
[
  term ((432 : Rat) / 5) [(3, 1), (8, 1), (9, 1), (10, 1)],
  term ((-864 : Rat) / 5) [(3, 1), (8, 1), (9, 1), (10, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1324 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1324_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1324
        rs_R006_ueqv_R006_generator_22_1300_1399 =
      rs_R006_ueqv_R006_partial_22_1324 := by
  native_decide

/-- Coefficient term 1325 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1325 : Poly :=
[
  term ((-216 : Rat) / 5) [(3, 1), (8, 1), (9, 1), (10, 1), (14, 1)]
]

/-- Partial product 1325 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1325 : Poly :=
[
  term ((216 : Rat) / 5) [(3, 1), (8, 1), (9, 1), (10, 1), (14, 1)],
  term ((-432 : Rat) / 5) [(3, 1), (8, 1), (9, 1), (10, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1325 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1325_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1325
        rs_R006_ueqv_R006_generator_22_1300_1399 =
      rs_R006_ueqv_R006_partial_22_1325 := by
  native_decide

/-- Coefficient term 1326 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1326 : Poly :=
[
  term ((72 : Rat) / 5) [(3, 1), (8, 1), (9, 1), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 1326 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1326 : Poly :=
[
  term ((-72 : Rat) / 5) [(3, 1), (8, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((144 : Rat) / 5) [(3, 1), (8, 1), (9, 1), (10, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1326 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1326_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1326
        rs_R006_ueqv_R006_generator_22_1300_1399 =
      rs_R006_ueqv_R006_partial_22_1326 := by
  native_decide

/-- Coefficient term 1327 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1327 : Poly :=
[
  term ((144 : Rat) / 5) [(3, 1), (8, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 1327 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1327 : Poly :=
[
  term ((-144 : Rat) / 5) [(3, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((288 : Rat) / 5) [(3, 1), (8, 1), (9, 1), (10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1327 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1327_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1327
        rs_R006_ueqv_R006_generator_22_1300_1399 =
      rs_R006_ueqv_R006_partial_22_1327 := by
  native_decide

/-- Coefficient term 1328 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1328 : Poly :=
[
  term ((-1728 : Rat) / 5) [(3, 1), (8, 1), (9, 1), (11, 1), (13, 1)]
]

/-- Partial product 1328 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1328 : Poly :=
[
  term ((-3456 : Rat) / 5) [(3, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 1)],
  term ((1728 : Rat) / 5) [(3, 1), (8, 1), (9, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1328 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1328_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1328
        rs_R006_ueqv_R006_generator_22_1300_1399 =
      rs_R006_ueqv_R006_partial_22_1328 := by
  native_decide

/-- Coefficient term 1329 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1329 : Poly :=
[
  term ((-864 : Rat) / 5) [(3, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 1329 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1329 : Poly :=
[
  term ((-1728 : Rat) / 5) [(3, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((864 : Rat) / 5) [(3, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1329 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1329_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1329
        rs_R006_ueqv_R006_generator_22_1300_1399 =
      rs_R006_ueqv_R006_partial_22_1329 := by
  native_decide

/-- Coefficient term 1330 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1330 : Poly :=
[
  term ((288 : Rat) / 5) [(3, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1330 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1330 : Poly :=
[
  term ((576 : Rat) / 5) [(3, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(3, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1330 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1330_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1330
        rs_R006_ueqv_R006_generator_22_1300_1399 =
      rs_R006_ueqv_R006_partial_22_1330 := by
  native_decide

/-- Coefficient term 1331 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1331 : Poly :=
[
  term ((576 : Rat) / 5) [(3, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 1331 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1331 : Poly :=
[
  term ((1152 : Rat) / 5) [(3, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-576 : Rat) / 5) [(3, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1331 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1331_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1331
        rs_R006_ueqv_R006_generator_22_1300_1399 =
      rs_R006_ueqv_R006_partial_22_1331 := by
  native_decide

/-- Coefficient term 1332 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1332 : Poly :=
[
  term ((864 : Rat) / 5) [(3, 1), (8, 1), (9, 1), (12, 1)]
]

/-- Partial product 1332 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1332 : Poly :=
[
  term ((1728 : Rat) / 5) [(3, 1), (8, 1), (9, 1), (10, 1), (12, 1)],
  term ((-864 : Rat) / 5) [(3, 1), (8, 1), (9, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1332 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1332_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1332
        rs_R006_ueqv_R006_generator_22_1300_1399 =
      rs_R006_ueqv_R006_partial_22_1332 := by
  native_decide

/-- Coefficient term 1333 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1333 : Poly :=
[
  term ((432 : Rat) / 5) [(3, 1), (8, 1), (9, 1), (12, 1), (14, 1)]
]

/-- Partial product 1333 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1333 : Poly :=
[
  term ((864 : Rat) / 5) [(3, 1), (8, 1), (9, 1), (10, 1), (12, 1), (14, 1)],
  term ((-432 : Rat) / 5) [(3, 1), (8, 1), (9, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1333 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1333_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1333
        rs_R006_ueqv_R006_generator_22_1300_1399 =
      rs_R006_ueqv_R006_partial_22_1333 := by
  native_decide

/-- Coefficient term 1334 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1334 : Poly :=
[
  term ((-144 : Rat) / 5) [(3, 1), (8, 1), (9, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 1334 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1334 : Poly :=
[
  term ((-288 : Rat) / 5) [(3, 1), (8, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((144 : Rat) / 5) [(3, 1), (8, 1), (9, 1), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1334 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1334_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1334
        rs_R006_ueqv_R006_generator_22_1300_1399 =
      rs_R006_ueqv_R006_partial_22_1334 := by
  native_decide

/-- Coefficient term 1335 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1335 : Poly :=
[
  term ((-288 : Rat) / 5) [(3, 1), (8, 1), (9, 1), (12, 1), (16, 1)]
]

/-- Partial product 1335 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1335 : Poly :=
[
  term ((-576 : Rat) / 5) [(3, 1), (8, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((288 : Rat) / 5) [(3, 1), (8, 1), (9, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1335 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1335_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1335
        rs_R006_ueqv_R006_generator_22_1300_1399 =
      rs_R006_ueqv_R006_partial_22_1335 := by
  native_decide

/-- Coefficient term 1336 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1336 : Poly :=
[
  term (216 : Rat) [(3, 1), (8, 1), (9, 1), (14, 1)]
]

/-- Partial product 1336 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1336 : Poly :=
[
  term (432 : Rat) [(3, 1), (8, 1), (9, 1), (10, 1), (14, 1)],
  term (-216 : Rat) [(3, 1), (8, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1336 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1336_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1336
        rs_R006_ueqv_R006_generator_22_1300_1399 =
      rs_R006_ueqv_R006_partial_22_1336 := by
  native_decide

/-- Coefficient term 1337 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1337 : Poly :=
[
  term (-72 : Rat) [(3, 1), (8, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 1337 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1337 : Poly :=
[
  term (-144 : Rat) [(3, 1), (8, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term (72 : Rat) [(3, 1), (8, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1337 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1337_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1337
        rs_R006_ueqv_R006_generator_22_1300_1399 =
      rs_R006_ueqv_R006_partial_22_1337 := by
  native_decide

/-- Coefficient term 1338 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1338 : Poly :=
[
  term (-144 : Rat) [(3, 1), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 1338 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1338 : Poly :=
[
  term (-288 : Rat) [(3, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term (144 : Rat) [(3, 1), (8, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1338 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1338_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1338
        rs_R006_ueqv_R006_generator_22_1300_1399 =
      rs_R006_ueqv_R006_partial_22_1338 := by
  native_decide

/-- Coefficient term 1339 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1339 : Poly :=
[
  term ((2736 : Rat) / 5) [(3, 1), (8, 1), (10, 1), (13, 1)]
]

/-- Partial product 1339 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1339 : Poly :=
[
  term ((-2736 : Rat) / 5) [(3, 1), (8, 1), (10, 1), (13, 1)],
  term ((5472 : Rat) / 5) [(3, 1), (8, 1), (10, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1339 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1339_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1339
        rs_R006_ueqv_R006_generator_22_1300_1399 =
      rs_R006_ueqv_R006_partial_22_1339 := by
  native_decide

/-- Coefficient term 1340 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1340 : Poly :=
[
  term ((1368 : Rat) / 5) [(3, 1), (8, 1), (10, 1), (13, 1), (14, 1)]
]

/-- Partial product 1340 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1340 : Poly :=
[
  term ((-1368 : Rat) / 5) [(3, 1), (8, 1), (10, 1), (13, 1), (14, 1)],
  term ((2736 : Rat) / 5) [(3, 1), (8, 1), (10, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1340 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1340_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1340
        rs_R006_ueqv_R006_generator_22_1300_1399 =
      rs_R006_ueqv_R006_partial_22_1340 := by
  native_decide

/-- Coefficient term 1341 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1341 : Poly :=
[
  term ((-456 : Rat) / 5) [(3, 1), (8, 1), (10, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1341 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1341 : Poly :=
[
  term ((456 : Rat) / 5) [(3, 1), (8, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-912 : Rat) / 5) [(3, 1), (8, 1), (10, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1341 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1341_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1341
        rs_R006_ueqv_R006_generator_22_1300_1399 =
      rs_R006_ueqv_R006_partial_22_1341 := by
  native_decide

/-- Coefficient term 1342 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1342 : Poly :=
[
  term ((-912 : Rat) / 5) [(3, 1), (8, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 1342 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1342 : Poly :=
[
  term ((912 : Rat) / 5) [(3, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((-1824 : Rat) / 5) [(3, 1), (8, 1), (10, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1342 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1342_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1342
        rs_R006_ueqv_R006_generator_22_1300_1399 =
      rs_R006_ueqv_R006_partial_22_1342 := by
  native_decide

/-- Coefficient term 1343 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1343 : Poly :=
[
  term ((-1368 : Rat) / 5) [(3, 1), (8, 1), (11, 1)]
]

/-- Partial product 1343 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1343 : Poly :=
[
  term ((-2736 : Rat) / 5) [(3, 1), (8, 1), (10, 1), (11, 1)],
  term ((1368 : Rat) / 5) [(3, 1), (8, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1343 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1343_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1343
        rs_R006_ueqv_R006_generator_22_1300_1399 =
      rs_R006_ueqv_R006_partial_22_1343 := by
  native_decide

/-- Coefficient term 1344 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1344 : Poly :=
[
  term ((-4608 : Rat) / 5) [(3, 1), (8, 1), (11, 1), (12, 1)]
]

/-- Partial product 1344 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1344 : Poly :=
[
  term ((-9216 : Rat) / 5) [(3, 1), (8, 1), (10, 1), (11, 1), (12, 1)],
  term ((4608 : Rat) / 5) [(3, 1), (8, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1344 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1344_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1344
        rs_R006_ueqv_R006_generator_22_1300_1399 =
      rs_R006_ueqv_R006_partial_22_1344 := by
  native_decide

/-- Coefficient term 1345 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1345 : Poly :=
[
  term ((-2304 : Rat) / 5) [(3, 1), (8, 1), (11, 1), (12, 1), (14, 1)]
]

/-- Partial product 1345 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1345 : Poly :=
[
  term ((-4608 : Rat) / 5) [(3, 1), (8, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((2304 : Rat) / 5) [(3, 1), (8, 1), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1345 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1345_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1345
        rs_R006_ueqv_R006_generator_22_1300_1399 =
      rs_R006_ueqv_R006_partial_22_1345 := by
  native_decide

/-- Coefficient term 1346 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1346 : Poly :=
[
  term ((768 : Rat) / 5) [(3, 1), (8, 1), (11, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 1346 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1346 : Poly :=
[
  term ((1536 : Rat) / 5) [(3, 1), (8, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-768 : Rat) / 5) [(3, 1), (8, 1), (11, 1), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1346 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1346_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1346
        rs_R006_ueqv_R006_generator_22_1300_1399 =
      rs_R006_ueqv_R006_partial_22_1346 := by
  native_decide

/-- Coefficient term 1347 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1347 : Poly :=
[
  term ((1536 : Rat) / 5) [(3, 1), (8, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 1347 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1347 : Poly :=
[
  term ((3072 : Rat) / 5) [(3, 1), (8, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-1536 : Rat) / 5) [(3, 1), (8, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1347 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1347_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1347
        rs_R006_ueqv_R006_generator_22_1300_1399 =
      rs_R006_ueqv_R006_partial_22_1347 := by
  native_decide

/-- Coefficient term 1348 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1348 : Poly :=
[
  term ((-684 : Rat) / 5) [(3, 1), (8, 1), (11, 1), (14, 1)]
]

/-- Partial product 1348 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1348 : Poly :=
[
  term ((-1368 : Rat) / 5) [(3, 1), (8, 1), (10, 1), (11, 1), (14, 1)],
  term ((684 : Rat) / 5) [(3, 1), (8, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1348 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1348_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1348
        rs_R006_ueqv_R006_generator_22_1300_1399 =
      rs_R006_ueqv_R006_partial_22_1348 := by
  native_decide

/-- Coefficient term 1349 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1349 : Poly :=
[
  term ((228 : Rat) / 5) [(3, 1), (8, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 1349 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1349 : Poly :=
[
  term ((456 : Rat) / 5) [(3, 1), (8, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-228 : Rat) / 5) [(3, 1), (8, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1349 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1349_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1349
        rs_R006_ueqv_R006_generator_22_1300_1399 =
      rs_R006_ueqv_R006_partial_22_1349 := by
  native_decide

/-- Coefficient term 1350 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1350 : Poly :=
[
  term ((456 : Rat) / 5) [(3, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 1350 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1350 : Poly :=
[
  term ((912 : Rat) / 5) [(3, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((-456 : Rat) / 5) [(3, 1), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1350 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1350_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1350
        rs_R006_ueqv_R006_generator_22_1300_1399 =
      rs_R006_ueqv_R006_partial_22_1350 := by
  native_decide

/-- Coefficient term 1351 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1351 : Poly :=
[
  term ((1872 : Rat) / 5) [(3, 1), (8, 1), (13, 1)]
]

/-- Partial product 1351 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1351 : Poly :=
[
  term ((3744 : Rat) / 5) [(3, 1), (8, 1), (10, 1), (13, 1)],
  term ((-1872 : Rat) / 5) [(3, 1), (8, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1351 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1351_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1351
        rs_R006_ueqv_R006_generator_22_1300_1399 =
      rs_R006_ueqv_R006_partial_22_1351 := by
  native_decide

/-- Coefficient term 1352 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1352 : Poly :=
[
  term ((936 : Rat) / 5) [(3, 1), (8, 1), (13, 1), (14, 1)]
]

/-- Partial product 1352 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1352 : Poly :=
[
  term ((1872 : Rat) / 5) [(3, 1), (8, 1), (10, 1), (13, 1), (14, 1)],
  term ((-936 : Rat) / 5) [(3, 1), (8, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1352 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1352_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1352
        rs_R006_ueqv_R006_generator_22_1300_1399 =
      rs_R006_ueqv_R006_partial_22_1352 := by
  native_decide

/-- Coefficient term 1353 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1353 : Poly :=
[
  term ((-312 : Rat) / 5) [(3, 1), (8, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1353 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1353 : Poly :=
[
  term ((-624 : Rat) / 5) [(3, 1), (8, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((312 : Rat) / 5) [(3, 1), (8, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1353 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1353_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1353
        rs_R006_ueqv_R006_generator_22_1300_1399 =
      rs_R006_ueqv_R006_partial_22_1353 := by
  native_decide

/-- Coefficient term 1354 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1354 : Poly :=
[
  term ((-624 : Rat) / 5) [(3, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 1354 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1354 : Poly :=
[
  term ((-1248 : Rat) / 5) [(3, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((624 : Rat) / 5) [(3, 1), (8, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1354 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1354_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1354
        rs_R006_ueqv_R006_generator_22_1300_1399 =
      rs_R006_ueqv_R006_partial_22_1354 := by
  native_decide

/-- Coefficient term 1355 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1355 : Poly :=
[
  term ((432 : Rat) / 5) [(3, 1), (8, 2), (11, 1)]
]

/-- Partial product 1355 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1355 : Poly :=
[
  term ((864 : Rat) / 5) [(3, 1), (8, 2), (10, 1), (11, 1)],
  term ((-432 : Rat) / 5) [(3, 1), (8, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1355 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1355_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1355
        rs_R006_ueqv_R006_generator_22_1300_1399 =
      rs_R006_ueqv_R006_partial_22_1355 := by
  native_decide

/-- Coefficient term 1356 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1356 : Poly :=
[
  term ((216 : Rat) / 5) [(3, 1), (8, 2), (11, 1), (14, 1)]
]

/-- Partial product 1356 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1356 : Poly :=
[
  term ((432 : Rat) / 5) [(3, 1), (8, 2), (10, 1), (11, 1), (14, 1)],
  term ((-216 : Rat) / 5) [(3, 1), (8, 2), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1356 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1356_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1356
        rs_R006_ueqv_R006_generator_22_1300_1399 =
      rs_R006_ueqv_R006_partial_22_1356 := by
  native_decide

/-- Coefficient term 1357 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1357 : Poly :=
[
  term ((-72 : Rat) / 5) [(3, 1), (8, 2), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 1357 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1357 : Poly :=
[
  term ((-144 : Rat) / 5) [(3, 1), (8, 2), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((72 : Rat) / 5) [(3, 1), (8, 2), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1357 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1357_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1357
        rs_R006_ueqv_R006_generator_22_1300_1399 =
      rs_R006_ueqv_R006_partial_22_1357 := by
  native_decide

/-- Coefficient term 1358 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1358 : Poly :=
[
  term ((-144 : Rat) / 5) [(3, 1), (8, 2), (11, 1), (16, 1)]
]

/-- Partial product 1358 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1358 : Poly :=
[
  term ((-288 : Rat) / 5) [(3, 1), (8, 2), (10, 1), (11, 1), (16, 1)],
  term ((144 : Rat) / 5) [(3, 1), (8, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1358 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1358_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1358
        rs_R006_ueqv_R006_generator_22_1300_1399 =
      rs_R006_ueqv_R006_partial_22_1358 := by
  native_decide

/-- Coefficient term 1359 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1359 : Poly :=
[
  term ((-864 : Rat) / 5) [(3, 1), (8, 2), (13, 1)]
]

/-- Partial product 1359 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1359 : Poly :=
[
  term ((-1728 : Rat) / 5) [(3, 1), (8, 2), (10, 1), (13, 1)],
  term ((864 : Rat) / 5) [(3, 1), (8, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1359 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1359_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1359
        rs_R006_ueqv_R006_generator_22_1300_1399 =
      rs_R006_ueqv_R006_partial_22_1359 := by
  native_decide

/-- Coefficient term 1360 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1360 : Poly :=
[
  term ((-432 : Rat) / 5) [(3, 1), (8, 2), (13, 1), (14, 1)]
]

/-- Partial product 1360 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1360 : Poly :=
[
  term ((-864 : Rat) / 5) [(3, 1), (8, 2), (10, 1), (13, 1), (14, 1)],
  term ((432 : Rat) / 5) [(3, 1), (8, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1360 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1360_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1360
        rs_R006_ueqv_R006_generator_22_1300_1399 =
      rs_R006_ueqv_R006_partial_22_1360 := by
  native_decide

/-- Coefficient term 1361 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1361 : Poly :=
[
  term ((144 : Rat) / 5) [(3, 1), (8, 2), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1361 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1361 : Poly :=
[
  term ((288 : Rat) / 5) [(3, 1), (8, 2), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-144 : Rat) / 5) [(3, 1), (8, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1361 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1361_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1361
        rs_R006_ueqv_R006_generator_22_1300_1399 =
      rs_R006_ueqv_R006_partial_22_1361 := by
  native_decide

/-- Coefficient term 1362 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1362 : Poly :=
[
  term ((288 : Rat) / 5) [(3, 1), (8, 2), (13, 1), (16, 1)]
]

/-- Partial product 1362 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1362 : Poly :=
[
  term ((576 : Rat) / 5) [(3, 1), (8, 2), (10, 1), (13, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(3, 1), (8, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1362 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1362_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1362
        rs_R006_ueqv_R006_generator_22_1300_1399 =
      rs_R006_ueqv_R006_partial_22_1362 := by
  native_decide

/-- Coefficient term 1363 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1363 : Poly :=
[
  term ((-2052 : Rat) / 5) [(3, 1), (9, 1)]
]

/-- Partial product 1363 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1363 : Poly :=
[
  term ((2052 : Rat) / 5) [(3, 1), (9, 1)],
  term ((-4104 : Rat) / 5) [(3, 1), (9, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1363 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1363_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1363
        rs_R006_ueqv_R006_generator_22_1300_1399 =
      rs_R006_ueqv_R006_partial_22_1363 := by
  native_decide

/-- Coefficient term 1364 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1364 : Poly :=
[
  term ((-1368 : Rat) / 5) [(3, 1), (9, 1), (10, 1)]
]

/-- Partial product 1364 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1364 : Poly :=
[
  term ((1368 : Rat) / 5) [(3, 1), (9, 1), (10, 1)],
  term ((-2736 : Rat) / 5) [(3, 1), (9, 1), (10, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1364 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1364_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1364
        rs_R006_ueqv_R006_generator_22_1300_1399 =
      rs_R006_ueqv_R006_partial_22_1364 := by
  native_decide

/-- Coefficient term 1365 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1365 : Poly :=
[
  term ((6624 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (11, 1), (13, 1)]
]

/-- Partial product 1365 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1365 : Poly :=
[
  term ((-6624 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (11, 1), (13, 1)],
  term ((13248 : Rat) / 5) [(3, 1), (9, 1), (10, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1365 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1365_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1365
        rs_R006_ueqv_R006_generator_22_1300_1399 =
      rs_R006_ueqv_R006_partial_22_1365 := by
  native_decide

/-- Coefficient term 1366 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1366 : Poly :=
[
  term ((3312 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 1366 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1366 : Poly :=
[
  term ((-3312 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((6624 : Rat) / 5) [(3, 1), (9, 1), (10, 2), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1366 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1366_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1366
        rs_R006_ueqv_R006_generator_22_1300_1399 =
      rs_R006_ueqv_R006_partial_22_1366 := by
  native_decide

/-- Coefficient term 1367 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1367 : Poly :=
[
  term ((-1104 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1367 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1367 : Poly :=
[
  term ((1104 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2208 : Rat) / 5) [(3, 1), (9, 1), (10, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1367 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1367_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1367
        rs_R006_ueqv_R006_generator_22_1300_1399 =
      rs_R006_ueqv_R006_partial_22_1367 := by
  native_decide

/-- Coefficient term 1368 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1368 : Poly :=
[
  term ((-2208 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 1368 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1368 : Poly :=
[
  term ((2208 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-4416 : Rat) / 5) [(3, 1), (9, 1), (10, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1368 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1368_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1368
        rs_R006_ueqv_R006_generator_22_1300_1399 =
      rs_R006_ueqv_R006_partial_22_1368 := by
  native_decide

/-- Coefficient term 1369 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1369 : Poly :=
[
  term ((1872 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (12, 1)]
]

/-- Partial product 1369 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1369 : Poly :=
[
  term ((-1872 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (12, 1)],
  term ((3744 : Rat) / 5) [(3, 1), (9, 1), (10, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1369 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1369_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1369
        rs_R006_ueqv_R006_generator_22_1300_1399 =
      rs_R006_ueqv_R006_partial_22_1369 := by
  native_decide

/-- Coefficient term 1370 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1370 : Poly :=
[
  term ((936 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (12, 1), (14, 1)]
]

/-- Partial product 1370 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1370 : Poly :=
[
  term ((-936 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (12, 1), (14, 1)],
  term ((1872 : Rat) / 5) [(3, 1), (9, 1), (10, 2), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1370 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1370_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1370
        rs_R006_ueqv_R006_generator_22_1300_1399 =
      rs_R006_ueqv_R006_partial_22_1370 := by
  native_decide

/-- Coefficient term 1371 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1371 : Poly :=
[
  term ((-312 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 1371 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1371 : Poly :=
[
  term ((312 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-624 : Rat) / 5) [(3, 1), (9, 1), (10, 2), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1371 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1371_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1371
        rs_R006_ueqv_R006_generator_22_1300_1399 =
      rs_R006_ueqv_R006_partial_22_1371 := by
  native_decide

/-- Coefficient term 1372 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1372 : Poly :=
[
  term ((-624 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 1372 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1372 : Poly :=
[
  term ((624 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((-1248 : Rat) / 5) [(3, 1), (9, 1), (10, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1372 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1372_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1372
        rs_R006_ueqv_R006_generator_22_1300_1399 =
      rs_R006_ueqv_R006_partial_22_1372 := by
  native_decide

/-- Coefficient term 1373 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1373 : Poly :=
[
  term ((-5184 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (13, 2)]
]

/-- Partial product 1373 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1373 : Poly :=
[
  term ((5184 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (13, 2)],
  term ((-10368 : Rat) / 5) [(3, 1), (9, 1), (10, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1373 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1373_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1373
        rs_R006_ueqv_R006_generator_22_1300_1399 =
      rs_R006_ueqv_R006_partial_22_1373 := by
  native_decide

/-- Coefficient term 1374 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1374 : Poly :=
[
  term ((-2592 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (13, 2), (14, 1)]
]

/-- Partial product 1374 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1374 : Poly :=
[
  term ((2592 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (13, 2), (14, 1)],
  term ((-5184 : Rat) / 5) [(3, 1), (9, 1), (10, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1374 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1374_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1374
        rs_R006_ueqv_R006_generator_22_1300_1399 =
      rs_R006_ueqv_R006_partial_22_1374 := by
  native_decide

/-- Coefficient term 1375 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1375 : Poly :=
[
  term ((864 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 1375 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1375 : Poly :=
[
  term ((-864 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((1728 : Rat) / 5) [(3, 1), (9, 1), (10, 2), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1375 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1375_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1375
        rs_R006_ueqv_R006_generator_22_1300_1399 =
      rs_R006_ueqv_R006_partial_22_1375 := by
  native_decide

/-- Coefficient term 1376 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1376 : Poly :=
[
  term ((1728 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (13, 2), (16, 1)]
]

/-- Partial product 1376 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1376 : Poly :=
[
  term ((-1728 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (13, 2), (16, 1)],
  term ((3456 : Rat) / 5) [(3, 1), (9, 1), (10, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1376 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1376_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1376
        rs_R006_ueqv_R006_generator_22_1300_1399 =
      rs_R006_ueqv_R006_partial_22_1376 := by
  native_decide

/-- Coefficient term 1377 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1377 : Poly :=
[
  term ((-684 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (14, 1)]
]

/-- Partial product 1377 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1377 : Poly :=
[
  term ((684 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (14, 1)],
  term ((-1368 : Rat) / 5) [(3, 1), (9, 1), (10, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1377 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1377_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1377
        rs_R006_ueqv_R006_generator_22_1300_1399 =
      rs_R006_ueqv_R006_partial_22_1377 := by
  native_decide

/-- Coefficient term 1378 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1378 : Poly :=
[
  term ((228 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 1378 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1378 : Poly :=
[
  term ((-228 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((456 : Rat) / 5) [(3, 1), (9, 1), (10, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1378 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1378_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1378
        rs_R006_ueqv_R006_generator_22_1300_1399 =
      rs_R006_ueqv_R006_partial_22_1378 := by
  native_decide

/-- Coefficient term 1379 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1379 : Poly :=
[
  term ((456 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 1379 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1379 : Poly :=
[
  term ((-456 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (16, 1)],
  term ((912 : Rat) / 5) [(3, 1), (9, 1), (10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1379 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1379_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1379
        rs_R006_ueqv_R006_generator_22_1300_1399 =
      rs_R006_ueqv_R006_partial_22_1379 := by
  native_decide

/-- Coefficient term 1380 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1380 : Poly :=
[
  term ((5184 : Rat) / 5) [(3, 1), (9, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 1380 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1380 : Poly :=
[
  term ((10368 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((-5184 : Rat) / 5) [(3, 1), (9, 1), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1380 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1380_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1380
        rs_R006_ueqv_R006_generator_22_1300_1399 =
      rs_R006_ueqv_R006_partial_22_1380 := by
  native_decide

/-- Coefficient term 1381 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1381 : Poly :=
[
  term ((2592 : Rat) / 5) [(3, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 1381 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1381 : Poly :=
[
  term ((5184 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-2592 : Rat) / 5) [(3, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1381 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1381_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1381
        rs_R006_ueqv_R006_generator_22_1300_1399 =
      rs_R006_ueqv_R006_partial_22_1381 := by
  native_decide

/-- Coefficient term 1382 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1382 : Poly :=
[
  term ((-864 : Rat) / 5) [(3, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1382 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1382 : Poly :=
[
  term ((-1728 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((864 : Rat) / 5) [(3, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1382 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1382_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1382
        rs_R006_ueqv_R006_generator_22_1300_1399 =
      rs_R006_ueqv_R006_partial_22_1382 := by
  native_decide

/-- Coefficient term 1383 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1383 : Poly :=
[
  term ((-1728 : Rat) / 5) [(3, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 1383 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1383 : Poly :=
[
  term ((-3456 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((1728 : Rat) / 5) [(3, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1383 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1383_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1383
        rs_R006_ueqv_R006_generator_22_1300_1399 =
      rs_R006_ueqv_R006_partial_22_1383 := by
  native_decide

/-- Coefficient term 1384 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1384 : Poly :=
[
  term ((61392 : Rat) / 35) [(3, 1), (9, 1), (11, 1), (13, 1)]
]

/-- Partial product 1384 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1384 : Poly :=
[
  term ((122784 : Rat) / 35) [(3, 1), (9, 1), (10, 1), (11, 1), (13, 1)],
  term ((-61392 : Rat) / 35) [(3, 1), (9, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1384 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1384_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1384
        rs_R006_ueqv_R006_generator_22_1300_1399 =
      rs_R006_ueqv_R006_partial_22_1384 := by
  native_decide

/-- Coefficient term 1385 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1385 : Poly :=
[
  term ((3672 : Rat) / 5) [(3, 1), (9, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 1385 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1385 : Poly :=
[
  term ((7344 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-3672 : Rat) / 5) [(3, 1), (9, 1), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1385 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1385_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1385
        rs_R006_ueqv_R006_generator_22_1300_1399 =
      rs_R006_ueqv_R006_partial_22_1385 := by
  native_decide

/-- Coefficient term 1386 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1386 : Poly :=
[
  term ((-1224 : Rat) / 5) [(3, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1386 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1386 : Poly :=
[
  term ((-2448 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((1224 : Rat) / 5) [(3, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1386 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1386_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1386
        rs_R006_ueqv_R006_generator_22_1300_1399 =
      rs_R006_ueqv_R006_partial_22_1386 := by
  native_decide

/-- Coefficient term 1387 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1387 : Poly :=
[
  term ((-2928 : Rat) / 5) [(3, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 1387 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1387 : Poly :=
[
  term ((-5856 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((2928 : Rat) / 5) [(3, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1387 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1387_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1387
        rs_R006_ueqv_R006_generator_22_1300_1399 =
      rs_R006_ueqv_R006_partial_22_1387 := by
  native_decide

/-- Coefficient term 1388 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1388 : Poly :=
[
  term ((576 : Rat) / 5) [(3, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 1388 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1388 : Poly :=
[
  term ((1152 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((-576 : Rat) / 5) [(3, 1), (9, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1388 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1388_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1388
        rs_R006_ueqv_R006_generator_22_1300_1399 =
      rs_R006_ueqv_R006_partial_22_1388 := by
  native_decide

/-- Coefficient term 1389 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1389 : Poly :=
[
  term ((-192 : Rat) / 5) [(3, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1389 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1389 : Poly :=
[
  term ((-384 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((192 : Rat) / 5) [(3, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1389 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1389_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1389
        rs_R006_ueqv_R006_generator_22_1300_1399 =
      rs_R006_ueqv_R006_partial_22_1389 := by
  native_decide

/-- Coefficient term 1390 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1390 : Poly :=
[
  term ((-6624 : Rat) / 5) [(3, 1), (9, 1), (11, 2)]
]

/-- Partial product 1390 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1390 : Poly :=
[
  term ((-13248 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (11, 2)],
  term ((6624 : Rat) / 5) [(3, 1), (9, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1390 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1390_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1390
        rs_R006_ueqv_R006_generator_22_1300_1399 =
      rs_R006_ueqv_R006_partial_22_1390 := by
  native_decide

/-- Coefficient term 1391 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1391 : Poly :=
[
  term ((-6624 : Rat) / 5) [(3, 1), (9, 1), (11, 2), (12, 1)]
]

/-- Partial product 1391 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1391 : Poly :=
[
  term ((-13248 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (11, 2), (12, 1)],
  term ((6624 : Rat) / 5) [(3, 1), (9, 1), (11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1391 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1391_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1391
        rs_R006_ueqv_R006_generator_22_1300_1399 =
      rs_R006_ueqv_R006_partial_22_1391 := by
  native_decide

/-- Coefficient term 1392 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1392 : Poly :=
[
  term ((-3312 : Rat) / 5) [(3, 1), (9, 1), (11, 2), (12, 1), (14, 1)]
]

/-- Partial product 1392 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1392 : Poly :=
[
  term ((-6624 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (11, 2), (12, 1), (14, 1)],
  term ((3312 : Rat) / 5) [(3, 1), (9, 1), (11, 2), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1392 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1392_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1392
        rs_R006_ueqv_R006_generator_22_1300_1399 =
      rs_R006_ueqv_R006_partial_22_1392 := by
  native_decide

/-- Coefficient term 1393 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1393 : Poly :=
[
  term ((1104 : Rat) / 5) [(3, 1), (9, 1), (11, 2), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 1393 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1393 : Poly :=
[
  term ((2208 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-1104 : Rat) / 5) [(3, 1), (9, 1), (11, 2), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1393 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1393_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1393
        rs_R006_ueqv_R006_generator_22_1300_1399 =
      rs_R006_ueqv_R006_partial_22_1393 := by
  native_decide

/-- Coefficient term 1394 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1394 : Poly :=
[
  term ((2208 : Rat) / 5) [(3, 1), (9, 1), (11, 2), (12, 1), (16, 1)]
]

/-- Partial product 1394 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1394 : Poly :=
[
  term ((4416 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (11, 2), (12, 1), (16, 1)],
  term ((-2208 : Rat) / 5) [(3, 1), (9, 1), (11, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1394 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1394_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1394
        rs_R006_ueqv_R006_generator_22_1300_1399 =
      rs_R006_ueqv_R006_partial_22_1394 := by
  native_decide

/-- Coefficient term 1395 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1395 : Poly :=
[
  term ((-3312 : Rat) / 5) [(3, 1), (9, 1), (11, 2), (14, 1)]
]

/-- Partial product 1395 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1395 : Poly :=
[
  term ((-6624 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (11, 2), (14, 1)],
  term ((3312 : Rat) / 5) [(3, 1), (9, 1), (11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1395 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1395_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1395
        rs_R006_ueqv_R006_generator_22_1300_1399 =
      rs_R006_ueqv_R006_partial_22_1395 := by
  native_decide

/-- Coefficient term 1396 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1396 : Poly :=
[
  term ((1104 : Rat) / 5) [(3, 1), (9, 1), (11, 2), (14, 1), (16, 1)]
]

/-- Partial product 1396 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1396 : Poly :=
[
  term ((2208 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (11, 2), (14, 1), (16, 1)],
  term ((-1104 : Rat) / 5) [(3, 1), (9, 1), (11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1396 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1396_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1396
        rs_R006_ueqv_R006_generator_22_1300_1399 =
      rs_R006_ueqv_R006_partial_22_1396 := by
  native_decide

/-- Coefficient term 1397 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1397 : Poly :=
[
  term ((2208 : Rat) / 5) [(3, 1), (9, 1), (11, 2), (16, 1)]
]

/-- Partial product 1397 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1397 : Poly :=
[
  term ((4416 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (11, 2), (16, 1)],
  term ((-2208 : Rat) / 5) [(3, 1), (9, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1397 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1397_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1397
        rs_R006_ueqv_R006_generator_22_1300_1399 =
      rs_R006_ueqv_R006_partial_22_1397 := by
  native_decide

/-- Coefficient term 1398 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1398 : Poly :=
[
  term ((1152 : Rat) / 5) [(3, 1), (9, 1), (12, 1)]
]

/-- Partial product 1398 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1398 : Poly :=
[
  term ((2304 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (12, 1)],
  term ((-1152 : Rat) / 5) [(3, 1), (9, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1398 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1398_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1398
        rs_R006_ueqv_R006_generator_22_1300_1399 =
      rs_R006_ueqv_R006_partial_22_1398 := by
  native_decide

/-- Coefficient term 1399 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1399 : Poly :=
[
  term ((-288 : Rat) / 5) [(3, 1), (9, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 1399 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1399 : Poly :=
[
  term ((-576 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((288 : Rat) / 5) [(3, 1), (9, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1399 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1399_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1399
        rs_R006_ueqv_R006_generator_22_1300_1399 =
      rs_R006_ueqv_R006_partial_22_1399 := by
  native_decide

/-- Partial products in this block. -/
def rs_R006_ueqv_R006_partials_22_1300_1399 : List Poly :=
[
  rs_R006_ueqv_R006_partial_22_1300,
  rs_R006_ueqv_R006_partial_22_1301,
  rs_R006_ueqv_R006_partial_22_1302,
  rs_R006_ueqv_R006_partial_22_1303,
  rs_R006_ueqv_R006_partial_22_1304,
  rs_R006_ueqv_R006_partial_22_1305,
  rs_R006_ueqv_R006_partial_22_1306,
  rs_R006_ueqv_R006_partial_22_1307,
  rs_R006_ueqv_R006_partial_22_1308,
  rs_R006_ueqv_R006_partial_22_1309,
  rs_R006_ueqv_R006_partial_22_1310,
  rs_R006_ueqv_R006_partial_22_1311,
  rs_R006_ueqv_R006_partial_22_1312,
  rs_R006_ueqv_R006_partial_22_1313,
  rs_R006_ueqv_R006_partial_22_1314,
  rs_R006_ueqv_R006_partial_22_1315,
  rs_R006_ueqv_R006_partial_22_1316,
  rs_R006_ueqv_R006_partial_22_1317,
  rs_R006_ueqv_R006_partial_22_1318,
  rs_R006_ueqv_R006_partial_22_1319,
  rs_R006_ueqv_R006_partial_22_1320,
  rs_R006_ueqv_R006_partial_22_1321,
  rs_R006_ueqv_R006_partial_22_1322,
  rs_R006_ueqv_R006_partial_22_1323,
  rs_R006_ueqv_R006_partial_22_1324,
  rs_R006_ueqv_R006_partial_22_1325,
  rs_R006_ueqv_R006_partial_22_1326,
  rs_R006_ueqv_R006_partial_22_1327,
  rs_R006_ueqv_R006_partial_22_1328,
  rs_R006_ueqv_R006_partial_22_1329,
  rs_R006_ueqv_R006_partial_22_1330,
  rs_R006_ueqv_R006_partial_22_1331,
  rs_R006_ueqv_R006_partial_22_1332,
  rs_R006_ueqv_R006_partial_22_1333,
  rs_R006_ueqv_R006_partial_22_1334,
  rs_R006_ueqv_R006_partial_22_1335,
  rs_R006_ueqv_R006_partial_22_1336,
  rs_R006_ueqv_R006_partial_22_1337,
  rs_R006_ueqv_R006_partial_22_1338,
  rs_R006_ueqv_R006_partial_22_1339,
  rs_R006_ueqv_R006_partial_22_1340,
  rs_R006_ueqv_R006_partial_22_1341,
  rs_R006_ueqv_R006_partial_22_1342,
  rs_R006_ueqv_R006_partial_22_1343,
  rs_R006_ueqv_R006_partial_22_1344,
  rs_R006_ueqv_R006_partial_22_1345,
  rs_R006_ueqv_R006_partial_22_1346,
  rs_R006_ueqv_R006_partial_22_1347,
  rs_R006_ueqv_R006_partial_22_1348,
  rs_R006_ueqv_R006_partial_22_1349,
  rs_R006_ueqv_R006_partial_22_1350,
  rs_R006_ueqv_R006_partial_22_1351,
  rs_R006_ueqv_R006_partial_22_1352,
  rs_R006_ueqv_R006_partial_22_1353,
  rs_R006_ueqv_R006_partial_22_1354,
  rs_R006_ueqv_R006_partial_22_1355,
  rs_R006_ueqv_R006_partial_22_1356,
  rs_R006_ueqv_R006_partial_22_1357,
  rs_R006_ueqv_R006_partial_22_1358,
  rs_R006_ueqv_R006_partial_22_1359,
  rs_R006_ueqv_R006_partial_22_1360,
  rs_R006_ueqv_R006_partial_22_1361,
  rs_R006_ueqv_R006_partial_22_1362,
  rs_R006_ueqv_R006_partial_22_1363,
  rs_R006_ueqv_R006_partial_22_1364,
  rs_R006_ueqv_R006_partial_22_1365,
  rs_R006_ueqv_R006_partial_22_1366,
  rs_R006_ueqv_R006_partial_22_1367,
  rs_R006_ueqv_R006_partial_22_1368,
  rs_R006_ueqv_R006_partial_22_1369,
  rs_R006_ueqv_R006_partial_22_1370,
  rs_R006_ueqv_R006_partial_22_1371,
  rs_R006_ueqv_R006_partial_22_1372,
  rs_R006_ueqv_R006_partial_22_1373,
  rs_R006_ueqv_R006_partial_22_1374,
  rs_R006_ueqv_R006_partial_22_1375,
  rs_R006_ueqv_R006_partial_22_1376,
  rs_R006_ueqv_R006_partial_22_1377,
  rs_R006_ueqv_R006_partial_22_1378,
  rs_R006_ueqv_R006_partial_22_1379,
  rs_R006_ueqv_R006_partial_22_1380,
  rs_R006_ueqv_R006_partial_22_1381,
  rs_R006_ueqv_R006_partial_22_1382,
  rs_R006_ueqv_R006_partial_22_1383,
  rs_R006_ueqv_R006_partial_22_1384,
  rs_R006_ueqv_R006_partial_22_1385,
  rs_R006_ueqv_R006_partial_22_1386,
  rs_R006_ueqv_R006_partial_22_1387,
  rs_R006_ueqv_R006_partial_22_1388,
  rs_R006_ueqv_R006_partial_22_1389,
  rs_R006_ueqv_R006_partial_22_1390,
  rs_R006_ueqv_R006_partial_22_1391,
  rs_R006_ueqv_R006_partial_22_1392,
  rs_R006_ueqv_R006_partial_22_1393,
  rs_R006_ueqv_R006_partial_22_1394,
  rs_R006_ueqv_R006_partial_22_1395,
  rs_R006_ueqv_R006_partial_22_1396,
  rs_R006_ueqv_R006_partial_22_1397,
  rs_R006_ueqv_R006_partial_22_1398,
  rs_R006_ueqv_R006_partial_22_1399
]

/-- Sum of partial products in this block. -/
def rs_R006_ueqv_R006_block_22_1300_1399 : Poly :=
[
  term ((-864 : Rat) / 5) [(3, 1), (7, 1), (9, 2), (10, 1), (14, 1)],
  term ((288 : Rat) / 5) [(3, 1), (7, 1), (9, 2), (10, 1), (14, 1), (16, 1)],
  term ((1152 : Rat) / 5) [(3, 1), (7, 1), (9, 2), (10, 2), (16, 1)],
  term ((432 : Rat) / 5) [(3, 1), (7, 1), (9, 2), (14, 1)],
  term ((-144 : Rat) / 5) [(3, 1), (7, 1), (9, 2), (14, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(3, 1), (7, 1), (9, 2), (16, 1)],
  term (-342 : Rat) [(3, 1), (7, 1), (10, 1)],
  term ((-3444 : Rat) / 5) [(3, 1), (7, 1), (10, 1), (12, 1)],
  term ((-1764 : Rat) / 5) [(3, 1), (7, 1), (10, 1), (12, 1), (14, 1)],
  term ((576 : Rat) / 5) [(3, 1), (7, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((1132 : Rat) / 5) [(3, 1), (7, 1), (10, 1), (12, 1), (16, 1)],
  term ((1992 : Rat) / 5) [(3, 1), (7, 1), (10, 1), (12, 2)],
  term ((648 : Rat) / 5) [(3, 1), (7, 1), (10, 1), (12, 2), (14, 1)],
  term ((-288 : Rat) / 5) [(3, 1), (7, 1), (10, 1), (12, 2), (14, 1), (16, 1)],
  term ((-584 : Rat) / 5) [(3, 1), (7, 1), (10, 1), (12, 2), (16, 1)],
  term ((-264 : Rat) / 5) [(3, 1), (7, 1), (10, 1), (14, 1)],
  term ((96 : Rat) / 5) [(3, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term ((164 : Rat) / 5) [(3, 1), (7, 1), (10, 1), (16, 1)],
  term (684 : Rat) [(3, 1), (7, 1), (10, 2)],
  term ((-4872 : Rat) / 5) [(3, 1), (7, 1), (10, 2), (12, 1)],
  term ((-2088 : Rat) / 5) [(3, 1), (7, 1), (10, 2), (12, 1), (14, 1)],
  term ((768 : Rat) / 5) [(3, 1), (7, 1), (10, 2), (12, 1), (14, 1), (16, 1)],
  term ((1544 : Rat) / 5) [(3, 1), (7, 1), (10, 2), (12, 1), (16, 1)],
  term ((1188 : Rat) / 5) [(3, 1), (7, 1), (10, 2), (14, 1)],
  term ((-516 : Rat) / 5) [(3, 1), (7, 1), (10, 2), (14, 1), (16, 1)],
  term ((-1044 : Rat) / 5) [(3, 1), (7, 1), (10, 2), (16, 1)],
  term (588 : Rat) [(3, 1), (7, 1), (12, 1)],
  term ((1404 : Rat) / 5) [(3, 1), (7, 1), (12, 1), (14, 1)],
  term (-96 : Rat) [(3, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((-952 : Rat) / 5) [(3, 1), (7, 1), (12, 1), (16, 1)],
  term ((-996 : Rat) / 5) [(3, 1), (7, 1), (12, 2)],
  term ((-324 : Rat) / 5) [(3, 1), (7, 1), (12, 2), (14, 1)],
  term ((144 : Rat) / 5) [(3, 1), (7, 1), (12, 2), (14, 1), (16, 1)],
  term ((292 : Rat) / 5) [(3, 1), (7, 1), (12, 2), (16, 1)],
  term (-33 : Rat) [(3, 1), (7, 1), (14, 1)],
  term ((81 : Rat) / 5) [(3, 1), (7, 1), (14, 1), (16, 1)],
  term ((179 : Rat) / 5) [(3, 1), (7, 1), (16, 1)],
  term (-432 : Rat) [(3, 1), (8, 1), (9, 1)],
  term ((4752 : Rat) / 5) [(3, 1), (8, 1), (9, 1), (10, 1)],
  term ((-3456 : Rat) / 5) [(3, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 1)],
  term ((-1728 : Rat) / 5) [(3, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((576 : Rat) / 5) [(3, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((1152 : Rat) / 5) [(3, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((1728 : Rat) / 5) [(3, 1), (8, 1), (9, 1), (10, 1), (12, 1)],
  term ((864 : Rat) / 5) [(3, 1), (8, 1), (9, 1), (10, 1), (12, 1), (14, 1)],
  term ((-288 : Rat) / 5) [(3, 1), (8, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-576 : Rat) / 5) [(3, 1), (8, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((2376 : Rat) / 5) [(3, 1), (8, 1), (9, 1), (10, 1), (14, 1)],
  term ((-792 : Rat) / 5) [(3, 1), (8, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-1584 : Rat) / 5) [(3, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((-864 : Rat) / 5) [(3, 1), (8, 1), (9, 1), (10, 2)],
  term ((-432 : Rat) / 5) [(3, 1), (8, 1), (9, 1), (10, 2), (14, 1)],
  term ((144 : Rat) / 5) [(3, 1), (8, 1), (9, 1), (10, 2), (14, 1), (16, 1)],
  term ((288 : Rat) / 5) [(3, 1), (8, 1), (9, 1), (10, 2), (16, 1)],
  term ((1728 : Rat) / 5) [(3, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((864 : Rat) / 5) [(3, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((-288 : Rat) / 5) [(3, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-576 : Rat) / 5) [(3, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-864 : Rat) / 5) [(3, 1), (8, 1), (9, 1), (12, 1)],
  term ((-432 : Rat) / 5) [(3, 1), (8, 1), (9, 1), (12, 1), (14, 1)],
  term ((144 : Rat) / 5) [(3, 1), (8, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((288 : Rat) / 5) [(3, 1), (8, 1), (9, 1), (12, 1), (16, 1)],
  term (-216 : Rat) [(3, 1), (8, 1), (9, 1), (14, 1)],
  term (72 : Rat) [(3, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term (144 : Rat) [(3, 1), (8, 1), (9, 1), (16, 1)],
  term ((-2736 : Rat) / 5) [(3, 1), (8, 1), (10, 1), (11, 1)],
  term ((-9216 : Rat) / 5) [(3, 1), (8, 1), (10, 1), (11, 1), (12, 1)],
  term ((-4608 : Rat) / 5) [(3, 1), (8, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((1536 : Rat) / 5) [(3, 1), (8, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((3072 : Rat) / 5) [(3, 1), (8, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-1368 : Rat) / 5) [(3, 1), (8, 1), (10, 1), (11, 1), (14, 1)],
  term ((456 : Rat) / 5) [(3, 1), (8, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((912 : Rat) / 5) [(3, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((1008 : Rat) / 5) [(3, 1), (8, 1), (10, 1), (13, 1)],
  term ((504 : Rat) / 5) [(3, 1), (8, 1), (10, 1), (13, 1), (14, 1)],
  term ((-168 : Rat) / 5) [(3, 1), (8, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-336 : Rat) / 5) [(3, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((5472 : Rat) / 5) [(3, 1), (8, 1), (10, 2), (13, 1)],
  term ((2736 : Rat) / 5) [(3, 1), (8, 1), (10, 2), (13, 1), (14, 1)],
  term ((-912 : Rat) / 5) [(3, 1), (8, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((-1824 : Rat) / 5) [(3, 1), (8, 1), (10, 2), (13, 1), (16, 1)],
  term ((1368 : Rat) / 5) [(3, 1), (8, 1), (11, 1)],
  term ((4608 : Rat) / 5) [(3, 1), (8, 1), (11, 1), (12, 1)],
  term ((2304 : Rat) / 5) [(3, 1), (8, 1), (11, 1), (12, 1), (14, 1)],
  term ((-768 : Rat) / 5) [(3, 1), (8, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1536 : Rat) / 5) [(3, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((684 : Rat) / 5) [(3, 1), (8, 1), (11, 1), (14, 1)],
  term ((-228 : Rat) / 5) [(3, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-456 : Rat) / 5) [(3, 1), (8, 1), (11, 1), (16, 1)],
  term ((-1872 : Rat) / 5) [(3, 1), (8, 1), (13, 1)],
  term ((-936 : Rat) / 5) [(3, 1), (8, 1), (13, 1), (14, 1)],
  term ((312 : Rat) / 5) [(3, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((624 : Rat) / 5) [(3, 1), (8, 1), (13, 1), (16, 1)],
  term ((864 : Rat) / 5) [(3, 1), (8, 2), (10, 1), (11, 1)],
  term ((432 : Rat) / 5) [(3, 1), (8, 2), (10, 1), (11, 1), (14, 1)],
  term ((-144 : Rat) / 5) [(3, 1), (8, 2), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(3, 1), (8, 2), (10, 1), (11, 1), (16, 1)],
  term ((-1728 : Rat) / 5) [(3, 1), (8, 2), (10, 1), (13, 1)],
  term ((-864 : Rat) / 5) [(3, 1), (8, 2), (10, 1), (13, 1), (14, 1)],
  term ((288 : Rat) / 5) [(3, 1), (8, 2), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((576 : Rat) / 5) [(3, 1), (8, 2), (10, 1), (13, 1), (16, 1)],
  term ((-432 : Rat) / 5) [(3, 1), (8, 2), (11, 1)],
  term ((-216 : Rat) / 5) [(3, 1), (8, 2), (11, 1), (14, 1)],
  term ((72 : Rat) / 5) [(3, 1), (8, 2), (11, 1), (14, 1), (16, 1)],
  term ((144 : Rat) / 5) [(3, 1), (8, 2), (11, 1), (16, 1)],
  term ((864 : Rat) / 5) [(3, 1), (8, 2), (13, 1)],
  term ((432 : Rat) / 5) [(3, 1), (8, 2), (13, 1), (14, 1)],
  term ((-144 : Rat) / 5) [(3, 1), (8, 2), (13, 1), (14, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(3, 1), (8, 2), (13, 1), (16, 1)],
  term ((2052 : Rat) / 5) [(3, 1), (9, 1)],
  term ((-2736 : Rat) / 5) [(3, 1), (9, 1), (10, 1)],
  term ((10368 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((5184 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-1728 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3456 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((76416 : Rat) / 35) [(3, 1), (9, 1), (10, 1), (11, 1), (13, 1)],
  term ((4032 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-1344 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3648 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((1152 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((-384 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-13248 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (11, 2)],
  term ((-13248 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (11, 2), (12, 1)],
  term ((-6624 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (11, 2), (12, 1), (14, 1)],
  term ((2208 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((4416 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (11, 2), (12, 1), (16, 1)],
  term ((-6624 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (11, 2), (14, 1)],
  term ((2208 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (11, 2), (14, 1), (16, 1)],
  term ((4416 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (11, 2), (16, 1)],
  term ((432 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (12, 1)],
  term ((-576 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-936 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (12, 1), (14, 1)],
  term ((312 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((624 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((5184 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (13, 2)],
  term ((2592 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (13, 2), (14, 1)],
  term ((-864 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((-1728 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (13, 2), (16, 1)],
  term ((684 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (14, 1)],
  term ((-228 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-456 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (16, 1)],
  term ((-2736 : Rat) / 5) [(3, 1), (9, 1), (10, 2)],
  term ((13248 : Rat) / 5) [(3, 1), (9, 1), (10, 2), (11, 1), (13, 1)],
  term ((6624 : Rat) / 5) [(3, 1), (9, 1), (10, 2), (11, 1), (13, 1), (14, 1)],
  term ((-2208 : Rat) / 5) [(3, 1), (9, 1), (10, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-4416 : Rat) / 5) [(3, 1), (9, 1), (10, 2), (11, 1), (13, 1), (16, 1)],
  term ((3744 : Rat) / 5) [(3, 1), (9, 1), (10, 2), (12, 1)],
  term ((1872 : Rat) / 5) [(3, 1), (9, 1), (10, 2), (12, 1), (14, 1)],
  term ((-624 : Rat) / 5) [(3, 1), (9, 1), (10, 2), (12, 1), (14, 1), (16, 1)],
  term ((-1248 : Rat) / 5) [(3, 1), (9, 1), (10, 2), (12, 1), (16, 1)],
  term ((-10368 : Rat) / 5) [(3, 1), (9, 1), (10, 2), (13, 2)],
  term ((-5184 : Rat) / 5) [(3, 1), (9, 1), (10, 2), (13, 2), (14, 1)],
  term ((1728 : Rat) / 5) [(3, 1), (9, 1), (10, 2), (13, 2), (14, 1), (16, 1)],
  term ((3456 : Rat) / 5) [(3, 1), (9, 1), (10, 2), (13, 2), (16, 1)],
  term ((-1368 : Rat) / 5) [(3, 1), (9, 1), (10, 2), (14, 1)],
  term ((456 : Rat) / 5) [(3, 1), (9, 1), (10, 2), (14, 1), (16, 1)],
  term ((912 : Rat) / 5) [(3, 1), (9, 1), (10, 2), (16, 1)],
  term ((-5184 : Rat) / 5) [(3, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((-2592 : Rat) / 5) [(3, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((864 : Rat) / 5) [(3, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((1728 : Rat) / 5) [(3, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-61392 : Rat) / 35) [(3, 1), (9, 1), (11, 1), (13, 1)],
  term ((-3672 : Rat) / 5) [(3, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((1224 : Rat) / 5) [(3, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((2928 : Rat) / 5) [(3, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-576 : Rat) / 5) [(3, 1), (9, 1), (11, 1), (15, 1)],
  term ((192 : Rat) / 5) [(3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((6624 : Rat) / 5) [(3, 1), (9, 1), (11, 2)],
  term ((6624 : Rat) / 5) [(3, 1), (9, 1), (11, 2), (12, 1)],
  term ((3312 : Rat) / 5) [(3, 1), (9, 1), (11, 2), (12, 1), (14, 1)],
  term ((-1104 : Rat) / 5) [(3, 1), (9, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-2208 : Rat) / 5) [(3, 1), (9, 1), (11, 2), (12, 1), (16, 1)],
  term ((3312 : Rat) / 5) [(3, 1), (9, 1), (11, 2), (14, 1)],
  term ((-1104 : Rat) / 5) [(3, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((-2208 : Rat) / 5) [(3, 1), (9, 1), (11, 2), (16, 1)],
  term ((-1152 : Rat) / 5) [(3, 1), (9, 1), (12, 1)],
  term ((288 : Rat) / 5) [(3, 1), (9, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 22, terms 1300 through 1399. -/
theorem rs_R006_ueqv_R006_block_22_1300_1399_valid :
    checkProductSumEq rs_R006_ueqv_R006_partials_22_1300_1399
      rs_R006_ueqv_R006_block_22_1300_1399 = true := by
  native_decide

end R006UeqvR006TermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
