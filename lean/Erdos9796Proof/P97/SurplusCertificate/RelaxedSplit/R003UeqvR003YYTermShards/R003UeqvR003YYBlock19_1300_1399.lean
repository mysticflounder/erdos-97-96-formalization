/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R003:u=v:R003YY, term block 19:1300-1399

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R003UeqvR003YYTermShards

/-- Generator polynomial 19 for relaxed split surplus certificate `R003:u=v:R003YY`. -/
def rs_R003_ueqv_R003YY_generator_19_1300_1399 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(8, 1)]
]

/-- Coefficient term 1300 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1300 : Poly :=
[
  term ((3744 : Rat) / 35) [(2, 1), (9, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 1300 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1300 : Poly :=
[
  term ((7488 : Rat) / 35) [(2, 1), (8, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-3744 : Rat) / 35) [(2, 1), (9, 1), (10, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1300 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1300_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1300
        rs_R003_ueqv_R003YY_generator_19_1300_1399 =
      rs_R003_ueqv_R003YY_partial_19_1300 := by
  native_decide

/-- Coefficient term 1301 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1301 : Poly :=
[
  term ((-1248 : Rat) / 35) [(2, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1301 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1301 : Poly :=
[
  term ((-2496 : Rat) / 35) [(2, 1), (8, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((1248 : Rat) / 35) [(2, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1301 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1301_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1301
        rs_R003_ueqv_R003YY_generator_19_1300_1399 =
      rs_R003_ueqv_R003YY_partial_19_1301 := by
  native_decide

/-- Coefficient term 1302 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1302 : Poly :=
[
  term ((1467 : Rat) / 70) [(2, 1), (9, 1), (10, 1), (15, 1)]
]

/-- Partial product 1302 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1302 : Poly :=
[
  term ((1467 : Rat) / 35) [(2, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((-1467 : Rat) / 70) [(2, 1), (9, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1302 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1302_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1302
        rs_R003_ueqv_R003YY_generator_19_1300_1399 =
      rs_R003_ueqv_R003YY_partial_19_1302 := by
  native_decide

/-- Coefficient term 1303 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1303 : Poly :=
[
  term ((-867 : Rat) / 70) [(2, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 1303 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1303 : Poly :=
[
  term ((-867 : Rat) / 35) [(2, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((867 : Rat) / 70) [(2, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1303 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1303_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1303
        rs_R003_ueqv_R003YY_generator_19_1300_1399 =
      rs_R003_ueqv_R003YY_partial_19_1303 := by
  native_decide

/-- Coefficient term 1304 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1304 : Poly :=
[
  term ((1152 : Rat) / 35) [(2, 1), (9, 1), (10, 2), (15, 1)]
]

/-- Partial product 1304 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1304 : Poly :=
[
  term ((2304 : Rat) / 35) [(2, 1), (8, 1), (9, 1), (10, 2), (15, 1)],
  term ((-1152 : Rat) / 35) [(2, 1), (9, 1), (10, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1304 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1304_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1304
        rs_R003_ueqv_R003YY_generator_19_1300_1399 =
      rs_R003_ueqv_R003YY_partial_19_1304 := by
  native_decide

/-- Coefficient term 1305 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1305 : Poly :=
[
  term ((-384 : Rat) / 35) [(2, 1), (9, 1), (10, 2), (15, 1), (16, 1)]
]

/-- Partial product 1305 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1305 : Poly :=
[
  term ((-768 : Rat) / 35) [(2, 1), (8, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((384 : Rat) / 35) [(2, 1), (9, 1), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1305 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1305_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1305
        rs_R003_ueqv_R003YY_generator_19_1300_1399 =
      rs_R003_ueqv_R003YY_partial_19_1305 := by
  native_decide

/-- Coefficient term 1306 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1306 : Poly :=
[
  term ((2304 : Rat) / 35) [(2, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 1306 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1306 : Poly :=
[
  term ((4608 : Rat) / 35) [(2, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-2304 : Rat) / 35) [(2, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1306 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1306_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1306
        rs_R003_ueqv_R003YY_generator_19_1300_1399 =
      rs_R003_ueqv_R003YY_partial_19_1306 := by
  native_decide

/-- Coefficient term 1307 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1307 : Poly :=
[
  term ((-768 : Rat) / 35) [(2, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1307 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1307 : Poly :=
[
  term ((-1536 : Rat) / 35) [(2, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((768 : Rat) / 35) [(2, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1307 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1307_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1307
        rs_R003_ueqv_R003YY_generator_19_1300_1399 =
      rs_R003_ueqv_R003YY_partial_19_1307 := by
  native_decide

/-- Coefficient term 1308 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1308 : Poly :=
[
  term ((2304 : Rat) / 5) [(2, 1), (9, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 1308 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1308 : Poly :=
[
  term ((4608 : Rat) / 5) [(2, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-2304 : Rat) / 5) [(2, 1), (9, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1308 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1308_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1308
        rs_R003_ueqv_R003YY_generator_19_1300_1399 =
      rs_R003_ueqv_R003YY_partial_19_1308 := by
  native_decide

/-- Coefficient term 1309 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1309 : Poly :=
[
  term ((-768 : Rat) / 5) [(2, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1309 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1309 : Poly :=
[
  term ((-1536 : Rat) / 5) [(2, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((768 : Rat) / 5) [(2, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1309 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1309_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1309
        rs_R003_ueqv_R003YY_generator_19_1300_1399 =
      rs_R003_ueqv_R003YY_partial_19_1309 := by
  native_decide

/-- Coefficient term 1310 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1310 : Poly :=
[
  term ((5184 : Rat) / 35) [(2, 1), (9, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 1310 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1310 : Poly :=
[
  term ((10368 : Rat) / 35) [(2, 1), (8, 1), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((-5184 : Rat) / 35) [(2, 1), (9, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1310 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1310_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1310
        rs_R003_ueqv_R003YY_generator_19_1300_1399 =
      rs_R003_ueqv_R003YY_partial_19_1310 := by
  native_decide

/-- Coefficient term 1311 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1311 : Poly :=
[
  term ((-1728 : Rat) / 35) [(2, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1311 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1311 : Poly :=
[
  term ((-3456 : Rat) / 35) [(2, 1), (8, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((1728 : Rat) / 35) [(2, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1311 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1311_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1311
        rs_R003_ueqv_R003YY_generator_19_1300_1399 =
      rs_R003_ueqv_R003YY_partial_19_1311 := by
  native_decide

/-- Coefficient term 1312 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1312 : Poly :=
[
  term ((5184 : Rat) / 35) [(2, 1), (9, 1), (11, 2), (15, 1)]
]

/-- Partial product 1312 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1312 : Poly :=
[
  term ((10368 : Rat) / 35) [(2, 1), (8, 1), (9, 1), (11, 2), (15, 1)],
  term ((-5184 : Rat) / 35) [(2, 1), (9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1312 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1312_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1312
        rs_R003_ueqv_R003YY_generator_19_1300_1399 =
      rs_R003_ueqv_R003YY_partial_19_1312 := by
  native_decide

/-- Coefficient term 1313 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1313 : Poly :=
[
  term ((-1728 : Rat) / 35) [(2, 1), (9, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 1313 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1313 : Poly :=
[
  term ((-3456 : Rat) / 35) [(2, 1), (8, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((1728 : Rat) / 35) [(2, 1), (9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1313 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1313_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1313
        rs_R003_ueqv_R003YY_generator_19_1300_1399 =
      rs_R003_ueqv_R003YY_partial_19_1313 := by
  native_decide

/-- Coefficient term 1314 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1314 : Poly :=
[
  term ((7254 : Rat) / 175) [(2, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 1314 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1314 : Poly :=
[
  term ((14508 : Rat) / 175) [(2, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-7254 : Rat) / 175) [(2, 1), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1314 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1314_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1314
        rs_R003_ueqv_R003YY_generator_19_1300_1399 =
      rs_R003_ueqv_R003YY_partial_19_1314 := by
  native_decide

/-- Coefficient term 1315 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1315 : Poly :=
[
  term ((-702 : Rat) / 35) [(2, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1315 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1315 : Poly :=
[
  term ((-1404 : Rat) / 35) [(2, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((702 : Rat) / 35) [(2, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1315 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1315_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1315
        rs_R003_ueqv_R003YY_generator_19_1300_1399 =
      rs_R003_ueqv_R003YY_partial_19_1315 := by
  native_decide

/-- Coefficient term 1316 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1316 : Poly :=
[
  term ((3456 : Rat) / 35) [(2, 1), (9, 1), (12, 2), (15, 1)]
]

/-- Partial product 1316 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1316 : Poly :=
[
  term ((6912 : Rat) / 35) [(2, 1), (8, 1), (9, 1), (12, 2), (15, 1)],
  term ((-3456 : Rat) / 35) [(2, 1), (9, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1316 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1316_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1316
        rs_R003_ueqv_R003YY_generator_19_1300_1399 =
      rs_R003_ueqv_R003YY_partial_19_1316 := by
  native_decide

/-- Coefficient term 1317 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1317 : Poly :=
[
  term ((-1152 : Rat) / 35) [(2, 1), (9, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 1317 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1317 : Poly :=
[
  term ((-2304 : Rat) / 35) [(2, 1), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((1152 : Rat) / 35) [(2, 1), (9, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1317 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1317_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1317
        rs_R003_ueqv_R003YY_generator_19_1300_1399 =
      rs_R003_ueqv_R003YY_partial_19_1317 := by
  native_decide

/-- Coefficient term 1318 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1318 : Poly :=
[
  term ((-1233 : Rat) / 35) [(2, 1), (9, 1), (15, 1)]
]

/-- Partial product 1318 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1318 : Poly :=
[
  term ((-2466 : Rat) / 35) [(2, 1), (8, 1), (9, 1), (15, 1)],
  term ((1233 : Rat) / 35) [(2, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1318 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1318_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1318
        rs_R003_ueqv_R003YY_generator_19_1300_1399 =
      rs_R003_ueqv_R003YY_partial_19_1318 := by
  native_decide

/-- Coefficient term 1319 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1319 : Poly :=
[
  term ((33 : Rat) / 35) [(2, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 1319 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1319 : Poly :=
[
  term ((66 : Rat) / 35) [(2, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-33 : Rat) / 35) [(2, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1319 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1319_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1319
        rs_R003_ueqv_R003YY_generator_19_1300_1399 =
      rs_R003_ueqv_R003YY_partial_19_1319 := by
  native_decide

/-- Coefficient term 1320 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1320 : Poly :=
[
  term ((-27648 : Rat) / 35) [(2, 1), (9, 2), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 1320 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1320 : Poly :=
[
  term ((-55296 : Rat) / 35) [(2, 1), (8, 1), (9, 2), (11, 1), (12, 1), (15, 1)],
  term ((27648 : Rat) / 35) [(2, 1), (9, 2), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1320 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1320_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1320
        rs_R003_ueqv_R003YY_generator_19_1300_1399 =
      rs_R003_ueqv_R003YY_partial_19_1320 := by
  native_decide

/-- Coefficient term 1321 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1321 : Poly :=
[
  term ((9216 : Rat) / 35) [(2, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1321 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1321 : Poly :=
[
  term ((18432 : Rat) / 35) [(2, 1), (8, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-9216 : Rat) / 35) [(2, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1321 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1321_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1321
        rs_R003_ueqv_R003YY_generator_19_1300_1399 =
      rs_R003_ueqv_R003YY_partial_19_1321 := by
  native_decide

/-- Coefficient term 1322 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1322 : Poly :=
[
  term ((-27648 : Rat) / 35) [(2, 1), (9, 2), (11, 1), (15, 1)]
]

/-- Partial product 1322 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1322 : Poly :=
[
  term ((-55296 : Rat) / 35) [(2, 1), (8, 1), (9, 2), (11, 1), (15, 1)],
  term ((27648 : Rat) / 35) [(2, 1), (9, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1322 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1322_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1322
        rs_R003_ueqv_R003YY_generator_19_1300_1399 =
      rs_R003_ueqv_R003YY_partial_19_1322 := by
  native_decide

/-- Coefficient term 1323 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1323 : Poly :=
[
  term ((9216 : Rat) / 35) [(2, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1323 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1323 : Poly :=
[
  term ((18432 : Rat) / 35) [(2, 1), (8, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-9216 : Rat) / 35) [(2, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1323 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1323_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1323
        rs_R003_ueqv_R003YY_generator_19_1300_1399 =
      rs_R003_ueqv_R003YY_partial_19_1323 := by
  native_decide

/-- Coefficient term 1324 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1324 : Poly :=
[
  term ((-576 : Rat) / 7) [(2, 1), (10, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 1324 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1324 : Poly :=
[
  term ((-1152 : Rat) / 7) [(2, 1), (8, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((576 : Rat) / 7) [(2, 1), (10, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1324 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1324_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1324
        rs_R003_ueqv_R003YY_generator_19_1300_1399 =
      rs_R003_ueqv_R003YY_partial_19_1324 := by
  native_decide

/-- Coefficient term 1325 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1325 : Poly :=
[
  term ((192 : Rat) / 7) [(2, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1325 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1325 : Poly :=
[
  term ((384 : Rat) / 7) [(2, 1), (8, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-192 : Rat) / 7) [(2, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1325 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1325_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1325
        rs_R003_ueqv_R003YY_generator_19_1300_1399 =
      rs_R003_ueqv_R003YY_partial_19_1325 := by
  native_decide

/-- Coefficient term 1326 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1326 : Poly :=
[
  term ((1152 : Rat) / 7) [(2, 1), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 1326 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1326 : Poly :=
[
  term ((2304 : Rat) / 7) [(2, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-1152 : Rat) / 7) [(2, 1), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1326 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1326_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1326
        rs_R003_ueqv_R003YY_generator_19_1300_1399 =
      rs_R003_ueqv_R003YY_partial_19_1326 := by
  native_decide

/-- Coefficient term 1327 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1327 : Poly :=
[
  term ((-384 : Rat) / 7) [(2, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1327 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1327 : Poly :=
[
  term ((-768 : Rat) / 7) [(2, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((384 : Rat) / 7) [(2, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1327 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1327_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1327
        rs_R003_ueqv_R003YY_generator_19_1300_1399 =
      rs_R003_ueqv_R003YY_partial_19_1327 := by
  native_decide

/-- Coefficient term 1328 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1328 : Poly :=
[
  term ((117 : Rat) / 35) [(2, 1), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 1328 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1328 : Poly :=
[
  term ((234 : Rat) / 35) [(2, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((-117 : Rat) / 35) [(2, 1), (10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1328 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1328_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1328
        rs_R003_ueqv_R003YY_generator_19_1300_1399 =
      rs_R003_ueqv_R003YY_partial_19_1328 := by
  native_decide

/-- Coefficient term 1329 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1329 : Poly :=
[
  term ((339 : Rat) / 35) [(2, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1329 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1329 : Poly :=
[
  term ((678 : Rat) / 35) [(2, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-339 : Rat) / 35) [(2, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1329 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1329_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1329
        rs_R003_ueqv_R003YY_generator_19_1300_1399 =
      rs_R003_ueqv_R003YY_partial_19_1329 := by
  native_decide

/-- Coefficient term 1330 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1330 : Poly :=
[
  term ((288 : Rat) / 35) [(2, 1), (10, 2), (13, 1), (15, 1)]
]

/-- Partial product 1330 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1330 : Poly :=
[
  term ((576 : Rat) / 35) [(2, 1), (8, 1), (10, 2), (13, 1), (15, 1)],
  term ((-288 : Rat) / 35) [(2, 1), (10, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1330 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1330_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1330
        rs_R003_ueqv_R003YY_generator_19_1300_1399 =
      rs_R003_ueqv_R003YY_partial_19_1330 := by
  native_decide

/-- Coefficient term 1331 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1331 : Poly :=
[
  term ((-96 : Rat) / 35) [(2, 1), (10, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1331 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1331 : Poly :=
[
  term ((-192 : Rat) / 35) [(2, 1), (8, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((96 : Rat) / 35) [(2, 1), (10, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1331 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1331_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1331
        rs_R003_ueqv_R003YY_generator_19_1300_1399 =
      rs_R003_ueqv_R003YY_partial_19_1331 := by
  native_decide

/-- Coefficient term 1332 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1332 : Poly :=
[
  term ((-549 : Rat) / 35) [(2, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 1332 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1332 : Poly :=
[
  term ((-1098 : Rat) / 35) [(2, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((549 : Rat) / 35) [(2, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1332 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1332_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1332
        rs_R003_ueqv_R003YY_generator_19_1300_1399 =
      rs_R003_ueqv_R003YY_partial_19_1332 := by
  native_decide

/-- Coefficient term 1333 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1333 : Poly :=
[
  term ((-39 : Rat) / 7) [(2, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1333 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1333 : Poly :=
[
  term ((-78 : Rat) / 7) [(2, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((39 : Rat) / 7) [(2, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1333 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1333_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1333
        rs_R003_ueqv_R003YY_generator_19_1300_1399 =
      rs_R003_ueqv_R003YY_partial_19_1333 := by
  native_decide

/-- Coefficient term 1334 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1334 : Poly :=
[
  term ((-12672 : Rat) / 35) [(2, 1), (11, 1), (12, 2), (15, 1)]
]

/-- Partial product 1334 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1334 : Poly :=
[
  term ((-25344 : Rat) / 35) [(2, 1), (8, 1), (11, 1), (12, 2), (15, 1)],
  term ((12672 : Rat) / 35) [(2, 1), (11, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1334 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1334_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1334
        rs_R003_ueqv_R003YY_generator_19_1300_1399 =
      rs_R003_ueqv_R003YY_partial_19_1334 := by
  native_decide

/-- Coefficient term 1335 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1335 : Poly :=
[
  term ((4224 : Rat) / 35) [(2, 1), (11, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 1335 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1335 : Poly :=
[
  term ((8448 : Rat) / 35) [(2, 1), (8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-4224 : Rat) / 35) [(2, 1), (11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1335 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1335_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1335
        rs_R003_ueqv_R003YY_generator_19_1300_1399 =
      rs_R003_ueqv_R003YY_partial_19_1335 := by
  native_decide

/-- Coefficient term 1336 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1336 : Poly :=
[
  term ((286392 : Rat) / 10675) [(2, 1), (11, 1), (13, 1)]
]

/-- Partial product 1336 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1336 : Poly :=
[
  term ((572784 : Rat) / 10675) [(2, 1), (8, 1), (11, 1), (13, 1)],
  term ((-286392 : Rat) / 10675) [(2, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1336 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1336_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1336
        rs_R003_ueqv_R003YY_generator_19_1300_1399 =
      rs_R003_ueqv_R003YY_partial_19_1336 := by
  native_decide

/-- Coefficient term 1337 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1337 : Poly :=
[
  term ((-1152 : Rat) / 35) [(2, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 1337 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1337 : Poly :=
[
  term ((-2304 : Rat) / 35) [(2, 1), (8, 1), (11, 1), (13, 1), (14, 1)],
  term ((1152 : Rat) / 35) [(2, 1), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1337 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1337_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1337
        rs_R003_ueqv_R003YY_generator_19_1300_1399 =
      rs_R003_ueqv_R003YY_partial_19_1337 := by
  native_decide

/-- Coefficient term 1338 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1338 : Poly :=
[
  term ((384 : Rat) / 35) [(2, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1338 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1338 : Poly :=
[
  term ((768 : Rat) / 35) [(2, 1), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-384 : Rat) / 35) [(2, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1338 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1338_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1338
        rs_R003_ueqv_R003YY_generator_19_1300_1399 =
      rs_R003_ueqv_R003YY_partial_19_1338 := by
  native_decide

/-- Coefficient term 1339 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1339 : Poly :=
[
  term ((-312 : Rat) / 35) [(2, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 1339 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1339 : Poly :=
[
  term ((-624 : Rat) / 35) [(2, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((312 : Rat) / 35) [(2, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1339 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1339_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1339
        rs_R003_ueqv_R003YY_generator_19_1300_1399 =
      rs_R003_ueqv_R003YY_partial_19_1339 := by
  native_decide

/-- Coefficient term 1340 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1340 : Poly :=
[
  term ((-1152 : Rat) / 35) [(2, 1), (11, 1), (13, 2), (15, 1)]
]

/-- Partial product 1340 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1340 : Poly :=
[
  term ((-2304 : Rat) / 35) [(2, 1), (8, 1), (11, 1), (13, 2), (15, 1)],
  term ((1152 : Rat) / 35) [(2, 1), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1340 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1340_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1340
        rs_R003_ueqv_R003YY_generator_19_1300_1399 =
      rs_R003_ueqv_R003YY_partial_19_1340 := by
  native_decide

/-- Coefficient term 1341 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1341 : Poly :=
[
  term ((384 : Rat) / 35) [(2, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 1341 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1341 : Poly :=
[
  term ((768 : Rat) / 35) [(2, 1), (8, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-384 : Rat) / 35) [(2, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1341 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1341_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1341
        rs_R003_ueqv_R003YY_generator_19_1300_1399 =
      rs_R003_ueqv_R003YY_partial_19_1341 := by
  native_decide

/-- Coefficient term 1342 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1342 : Poly :=
[
  term ((31613 : Rat) / 140) [(2, 1), (11, 1), (15, 1)]
]

/-- Partial product 1342 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1342 : Poly :=
[
  term ((31613 : Rat) / 70) [(2, 1), (8, 1), (11, 1), (15, 1)],
  term ((-31613 : Rat) / 140) [(2, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1342 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1342_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1342
        rs_R003_ueqv_R003YY_generator_19_1300_1399 =
      rs_R003_ueqv_R003YY_partial_19_1342 := by
  native_decide

/-- Coefficient term 1343 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1343 : Poly :=
[
  term ((-11157 : Rat) / 140) [(2, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1343 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1343 : Poly :=
[
  term ((-11157 : Rat) / 70) [(2, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((11157 : Rat) / 140) [(2, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1343 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1343_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1343
        rs_R003_ueqv_R003YY_generator_19_1300_1399 =
      rs_R003_ueqv_R003YY_partial_19_1343 := by
  native_decide

/-- Coefficient term 1344 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1344 : Poly :=
[
  term ((-288 : Rat) / 35) [(2, 1), (11, 2), (13, 1), (15, 1)]
]

/-- Partial product 1344 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1344 : Poly :=
[
  term ((-576 : Rat) / 35) [(2, 1), (8, 1), (11, 2), (13, 1), (15, 1)],
  term ((288 : Rat) / 35) [(2, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1344 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1344_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1344
        rs_R003_ueqv_R003YY_generator_19_1300_1399 =
      rs_R003_ueqv_R003YY_partial_19_1344 := by
  native_decide

/-- Coefficient term 1345 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1345 : Poly :=
[
  term ((96 : Rat) / 35) [(2, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1345 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1345 : Poly :=
[
  term ((192 : Rat) / 35) [(2, 1), (8, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-96 : Rat) / 35) [(2, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1345 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1345_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1345
        rs_R003_ueqv_R003YY_generator_19_1300_1399 =
      rs_R003_ueqv_R003YY_partial_19_1345 := by
  native_decide

/-- Coefficient term 1346 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1346 : Poly :=
[
  term ((3 : Rat) / 5) [(2, 1), (12, 1)]
]

/-- Partial product 1346 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1346 : Poly :=
[
  term ((6 : Rat) / 5) [(2, 1), (8, 1), (12, 1)],
  term ((-3 : Rat) / 5) [(2, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1346 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1346_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1346
        rs_R003_ueqv_R003YY_generator_19_1300_1399 =
      rs_R003_ueqv_R003YY_partial_19_1346 := by
  native_decide

/-- Coefficient term 1347 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1347 : Poly :=
[
  term ((-28341 : Rat) / 350) [(2, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 1347 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1347 : Poly :=
[
  term ((-28341 : Rat) / 175) [(2, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((28341 : Rat) / 350) [(2, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1347 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1347_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1347
        rs_R003_ueqv_R003YY_generator_19_1300_1399 =
      rs_R003_ueqv_R003YY_partial_19_1347 := by
  native_decide

/-- Coefficient term 1348 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1348 : Poly :=
[
  term ((2049 : Rat) / 70) [(2, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1348 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1348 : Poly :=
[
  term ((2049 : Rat) / 35) [(2, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2049 : Rat) / 70) [(2, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1348 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1348_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1348
        rs_R003_ueqv_R003YY_generator_19_1300_1399 =
      rs_R003_ueqv_R003YY_partial_19_1348 := by
  native_decide

/-- Coefficient term 1349 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1349 : Poly :=
[
  term ((-12 : Rat) / 5) [(2, 1), (12, 1), (14, 1)]
]

/-- Partial product 1349 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1349 : Poly :=
[
  term ((-24 : Rat) / 5) [(2, 1), (8, 1), (12, 1), (14, 1)],
  term ((12 : Rat) / 5) [(2, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1349 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1349_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1349
        rs_R003_ueqv_R003YY_generator_19_1300_1399 =
      rs_R003_ueqv_R003YY_partial_19_1349 := by
  native_decide

/-- Coefficient term 1350 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1350 : Poly :=
[
  term ((-3 : Rat) / 5) [(2, 1), (12, 1), (16, 1)]
]

/-- Partial product 1350 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1350 : Poly :=
[
  term ((-6 : Rat) / 5) [(2, 1), (8, 1), (12, 1), (16, 1)],
  term ((3 : Rat) / 5) [(2, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1350 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1350_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1350
        rs_R003_ueqv_R003YY_generator_19_1300_1399 =
      rs_R003_ueqv_R003YY_partial_19_1350 := by
  native_decide

/-- Coefficient term 1351 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1351 : Poly :=
[
  term ((-207 : Rat) / 70) [(2, 1), (13, 1), (15, 1)]
]

/-- Partial product 1351 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1351 : Poly :=
[
  term ((-207 : Rat) / 35) [(2, 1), (8, 1), (13, 1), (15, 1)],
  term ((207 : Rat) / 70) [(2, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1351 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1351_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1351
        rs_R003_ueqv_R003YY_generator_19_1300_1399 =
      rs_R003_ueqv_R003YY_partial_19_1351 := by
  native_decide

/-- Coefficient term 1352 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1352 : Poly :=
[
  term ((447 : Rat) / 70) [(2, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1352 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1352 : Poly :=
[
  term ((447 : Rat) / 35) [(2, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-447 : Rat) / 70) [(2, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1352 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1352_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1352
        rs_R003_ueqv_R003YY_generator_19_1300_1399 =
      rs_R003_ueqv_R003YY_partial_19_1352 := by
  native_decide

/-- Coefficient term 1353 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1353 : Poly :=
[
  term ((-76 : Rat) / 5) [(2, 1), (14, 1)]
]

/-- Partial product 1353 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1353 : Poly :=
[
  term ((-152 : Rat) / 5) [(2, 1), (8, 1), (14, 1)],
  term ((76 : Rat) / 5) [(2, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1353 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1353_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1353
        rs_R003_ueqv_R003YY_generator_19_1300_1399 =
      rs_R003_ueqv_R003YY_partial_19_1353 := by
  native_decide

/-- Coefficient term 1354 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1354 : Poly :=
[
  term ((-1 : Rat) / 5) [(2, 1), (16, 1)]
]

/-- Partial product 1354 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1354 : Poly :=
[
  term ((-2 : Rat) / 5) [(2, 1), (8, 1), (16, 1)],
  term ((1 : Rat) / 5) [(2, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1354 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1354_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1354
        rs_R003_ueqv_R003YY_generator_19_1300_1399 =
      rs_R003_ueqv_R003YY_partial_19_1354 := by
  native_decide

/-- Coefficient term 1355 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1355 : Poly :=
[
  term ((-864 : Rat) / 35) [(2, 2), (11, 1), (15, 1)]
]

/-- Partial product 1355 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1355 : Poly :=
[
  term ((-1728 : Rat) / 35) [(2, 2), (8, 1), (11, 1), (15, 1)],
  term ((864 : Rat) / 35) [(2, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1355 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1355_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1355
        rs_R003_ueqv_R003YY_generator_19_1300_1399 =
      rs_R003_ueqv_R003YY_partial_19_1355 := by
  native_decide

/-- Coefficient term 1356 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1356 : Poly :=
[
  term ((288 : Rat) / 35) [(2, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1356 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1356 : Poly :=
[
  term ((576 : Rat) / 35) [(2, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-288 : Rat) / 35) [(2, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1356 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1356_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1356
        rs_R003_ueqv_R003YY_generator_19_1300_1399 =
      rs_R003_ueqv_R003YY_partial_19_1356 := by
  native_decide

/-- Coefficient term 1357 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1357 : Poly :=
[
  term ((9216 : Rat) / 7625) [(3, 1), (4, 1), (5, 1), (6, 1), (7, 1), (13, 1)]
]

/-- Partial product 1357 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1357 : Poly :=
[
  term ((18432 : Rat) / 7625) [(3, 1), (4, 1), (5, 1), (6, 1), (7, 1), (8, 1), (13, 1)],
  term ((-9216 : Rat) / 7625) [(3, 1), (4, 1), (5, 1), (6, 1), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1357 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1357_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1357
        rs_R003_ueqv_R003YY_generator_19_1300_1399 =
      rs_R003_ueqv_R003YY_partial_19_1357 := by
  native_decide

/-- Coefficient term 1358 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1358 : Poly :=
[
  term ((-18432 : Rat) / 7625) [(3, 1), (4, 1), (5, 1), (6, 1), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 1358 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1358 : Poly :=
[
  term ((-36864 : Rat) / 7625) [(3, 1), (4, 1), (5, 1), (6, 1), (8, 1), (9, 1), (12, 1), (13, 1)],
  term ((18432 : Rat) / 7625) [(3, 1), (4, 1), (5, 1), (6, 1), (9, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1358 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1358_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1358
        rs_R003_ueqv_R003YY_generator_19_1300_1399 =
      rs_R003_ueqv_R003YY_partial_19_1358 := by
  native_decide

/-- Coefficient term 1359 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1359 : Poly :=
[
  term ((27648 : Rat) / 7625) [(3, 1), (4, 1), (5, 1), (6, 1), (9, 1), (13, 1)]
]

/-- Partial product 1359 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1359 : Poly :=
[
  term ((55296 : Rat) / 7625) [(3, 1), (4, 1), (5, 1), (6, 1), (8, 1), (9, 1), (13, 1)],
  term ((-27648 : Rat) / 7625) [(3, 1), (4, 1), (5, 1), (6, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1359 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1359_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1359
        rs_R003_ueqv_R003YY_generator_19_1300_1399 =
      rs_R003_ueqv_R003YY_partial_19_1359 := by
  native_decide

/-- Coefficient term 1360 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1360 : Poly :=
[
  term ((18432 : Rat) / 7625) [(3, 1), (4, 1), (5, 1), (7, 1), (8, 1), (12, 1), (13, 1)]
]

/-- Partial product 1360 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1360 : Poly :=
[
  term ((-18432 : Rat) / 7625) [(3, 1), (4, 1), (5, 1), (7, 1), (8, 1), (12, 1), (13, 1)],
  term ((36864 : Rat) / 7625) [(3, 1), (4, 1), (5, 1), (7, 1), (8, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1360 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1360_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1360
        rs_R003_ueqv_R003YY_generator_19_1300_1399 =
      rs_R003_ueqv_R003YY_partial_19_1360 := by
  native_decide

/-- Coefficient term 1361 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1361 : Poly :=
[
  term ((-27648 : Rat) / 7625) [(3, 1), (4, 1), (5, 1), (7, 1), (8, 1), (13, 1)]
]

/-- Partial product 1361 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1361 : Poly :=
[
  term ((27648 : Rat) / 7625) [(3, 1), (4, 1), (5, 1), (7, 1), (8, 1), (13, 1)],
  term ((-55296 : Rat) / 7625) [(3, 1), (4, 1), (5, 1), (7, 1), (8, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1361 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1361_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1361
        rs_R003_ueqv_R003YY_generator_19_1300_1399 =
      rs_R003_ueqv_R003YY_partial_19_1361 := by
  native_decide

/-- Coefficient term 1362 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1362 : Poly :=
[
  term ((18432 : Rat) / 7625) [(3, 1), (4, 1), (5, 1), (7, 1), (12, 1), (13, 1)]
]

/-- Partial product 1362 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1362 : Poly :=
[
  term ((36864 : Rat) / 7625) [(3, 1), (4, 1), (5, 1), (7, 1), (8, 1), (12, 1), (13, 1)],
  term ((-18432 : Rat) / 7625) [(3, 1), (4, 1), (5, 1), (7, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1362 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1362_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1362
        rs_R003_ueqv_R003YY_generator_19_1300_1399 =
      rs_R003_ueqv_R003YY_partial_19_1362 := by
  native_decide

/-- Coefficient term 1363 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1363 : Poly :=
[
  term ((-18432 : Rat) / 7625) [(3, 1), (4, 1), (5, 1), (7, 1), (12, 2), (13, 1)]
]

/-- Partial product 1363 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1363 : Poly :=
[
  term ((-36864 : Rat) / 7625) [(3, 1), (4, 1), (5, 1), (7, 1), (8, 1), (12, 2), (13, 1)],
  term ((18432 : Rat) / 7625) [(3, 1), (4, 1), (5, 1), (7, 1), (12, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1363 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1363_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1363
        rs_R003_ueqv_R003YY_generator_19_1300_1399 =
      rs_R003_ueqv_R003YY_partial_19_1363 := by
  native_decide

/-- Coefficient term 1364 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1364 : Poly :=
[
  term ((4608 : Rat) / 7625) [(3, 1), (4, 1), (5, 1), (7, 1), (13, 1)]
]

/-- Partial product 1364 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1364 : Poly :=
[
  term ((9216 : Rat) / 7625) [(3, 1), (4, 1), (5, 1), (7, 1), (8, 1), (13, 1)],
  term ((-4608 : Rat) / 7625) [(3, 1), (4, 1), (5, 1), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1364 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1364_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1364
        rs_R003_ueqv_R003YY_generator_19_1300_1399 =
      rs_R003_ueqv_R003YY_partial_19_1364 := by
  native_decide

/-- Coefficient term 1365 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1365 : Poly :=
[
  term ((18432 : Rat) / 7625) [(3, 1), (4, 1), (5, 1), (9, 1), (13, 1)]
]

/-- Partial product 1365 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1365 : Poly :=
[
  term ((36864 : Rat) / 7625) [(3, 1), (4, 1), (5, 1), (8, 1), (9, 1), (13, 1)],
  term ((-18432 : Rat) / 7625) [(3, 1), (4, 1), (5, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1365 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1365_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1365
        rs_R003_ueqv_R003YY_generator_19_1300_1399 =
      rs_R003_ueqv_R003YY_partial_19_1365 := by
  native_decide

/-- Coefficient term 1366 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1366 : Poly :=
[
  term ((-9216 : Rat) / 7625) [(3, 1), (4, 1), (5, 1), (12, 1), (13, 2)]
]

/-- Partial product 1366 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1366 : Poly :=
[
  term ((-18432 : Rat) / 7625) [(3, 1), (4, 1), (5, 1), (8, 1), (12, 1), (13, 2)],
  term ((9216 : Rat) / 7625) [(3, 1), (4, 1), (5, 1), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1366 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1366_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1366
        rs_R003_ueqv_R003YY_generator_19_1300_1399 =
      rs_R003_ueqv_R003YY_partial_19_1366 := by
  native_decide

/-- Coefficient term 1367 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1367 : Poly :=
[
  term ((-9216 : Rat) / 7625) [(3, 1), (4, 1), (5, 1), (13, 2)]
]

/-- Partial product 1367 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1367 : Poly :=
[
  term ((-18432 : Rat) / 7625) [(3, 1), (4, 1), (5, 1), (8, 1), (13, 2)],
  term ((9216 : Rat) / 7625) [(3, 1), (4, 1), (5, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1367 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1367_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1367
        rs_R003_ueqv_R003YY_generator_19_1300_1399 =
      rs_R003_ueqv_R003YY_partial_19_1367 := by
  native_decide

/-- Coefficient term 1368 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1368 : Poly :=
[
  term ((9216 : Rat) / 10675) [(3, 1), (4, 1), (6, 1), (7, 1), (11, 1), (13, 1)]
]

/-- Partial product 1368 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1368 : Poly :=
[
  term ((18432 : Rat) / 10675) [(3, 1), (4, 1), (6, 1), (7, 1), (8, 1), (11, 1), (13, 1)],
  term ((-9216 : Rat) / 10675) [(3, 1), (4, 1), (6, 1), (7, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1368 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1368_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1368
        rs_R003_ueqv_R003YY_generator_19_1300_1399 =
      rs_R003_ueqv_R003YY_partial_19_1368 := by
  native_decide

/-- Coefficient term 1369 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1369 : Poly :=
[
  term ((-18432 : Rat) / 10675) [(3, 1), (4, 1), (6, 1), (9, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 1369 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1369 : Poly :=
[
  term ((-36864 : Rat) / 10675) [(3, 1), (4, 1), (6, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((18432 : Rat) / 10675) [(3, 1), (4, 1), (6, 1), (9, 1), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1369 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1369_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1369
        rs_R003_ueqv_R003YY_generator_19_1300_1399 =
      rs_R003_ueqv_R003YY_partial_19_1369 := by
  native_decide

/-- Coefficient term 1370 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1370 : Poly :=
[
  term ((27648 : Rat) / 10675) [(3, 1), (4, 1), (6, 1), (9, 1), (11, 1), (13, 1)]
]

/-- Partial product 1370 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1370 : Poly :=
[
  term ((55296 : Rat) / 10675) [(3, 1), (4, 1), (6, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((-27648 : Rat) / 10675) [(3, 1), (4, 1), (6, 1), (9, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1370 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1370_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1370
        rs_R003_ueqv_R003YY_generator_19_1300_1399 =
      rs_R003_ueqv_R003YY_partial_19_1370 := by
  native_decide

/-- Coefficient term 1371 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1371 : Poly :=
[
  term ((18432 : Rat) / 10675) [(3, 1), (4, 1), (7, 1), (8, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 1371 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1371 : Poly :=
[
  term ((-18432 : Rat) / 10675) [(3, 1), (4, 1), (7, 1), (8, 1), (11, 1), (12, 1), (13, 1)],
  term ((36864 : Rat) / 10675) [(3, 1), (4, 1), (7, 1), (8, 2), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1371 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1371_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1371
        rs_R003_ueqv_R003YY_generator_19_1300_1399 =
      rs_R003_ueqv_R003YY_partial_19_1371 := by
  native_decide

/-- Coefficient term 1372 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1372 : Poly :=
[
  term ((-27648 : Rat) / 10675) [(3, 1), (4, 1), (7, 1), (8, 1), (11, 1), (13, 1)]
]

/-- Partial product 1372 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1372 : Poly :=
[
  term ((27648 : Rat) / 10675) [(3, 1), (4, 1), (7, 1), (8, 1), (11, 1), (13, 1)],
  term ((-55296 : Rat) / 10675) [(3, 1), (4, 1), (7, 1), (8, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1372 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1372_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1372
        rs_R003_ueqv_R003YY_generator_19_1300_1399 =
      rs_R003_ueqv_R003YY_partial_19_1372 := by
  native_decide

/-- Coefficient term 1373 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1373 : Poly :=
[
  term ((18432 : Rat) / 10675) [(3, 1), (4, 1), (7, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 1373 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1373 : Poly :=
[
  term ((36864 : Rat) / 10675) [(3, 1), (4, 1), (7, 1), (8, 1), (11, 1), (12, 1), (13, 1)],
  term ((-18432 : Rat) / 10675) [(3, 1), (4, 1), (7, 1), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1373 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1373_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1373
        rs_R003_ueqv_R003YY_generator_19_1300_1399 =
      rs_R003_ueqv_R003YY_partial_19_1373 := by
  native_decide

/-- Coefficient term 1374 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1374 : Poly :=
[
  term ((-18432 : Rat) / 10675) [(3, 1), (4, 1), (7, 1), (11, 1), (12, 2), (13, 1)]
]

/-- Partial product 1374 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1374 : Poly :=
[
  term ((-36864 : Rat) / 10675) [(3, 1), (4, 1), (7, 1), (8, 1), (11, 1), (12, 2), (13, 1)],
  term ((18432 : Rat) / 10675) [(3, 1), (4, 1), (7, 1), (11, 1), (12, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1374 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1374_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1374
        rs_R003_ueqv_R003YY_generator_19_1300_1399 =
      rs_R003_ueqv_R003YY_partial_19_1374 := by
  native_decide

/-- Coefficient term 1375 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1375 : Poly :=
[
  term ((4608 : Rat) / 10675) [(3, 1), (4, 1), (7, 1), (11, 1), (13, 1)]
]

/-- Partial product 1375 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1375 : Poly :=
[
  term ((9216 : Rat) / 10675) [(3, 1), (4, 1), (7, 1), (8, 1), (11, 1), (13, 1)],
  term ((-4608 : Rat) / 10675) [(3, 1), (4, 1), (7, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1375 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1375_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1375
        rs_R003_ueqv_R003YY_generator_19_1300_1399 =
      rs_R003_ueqv_R003YY_partial_19_1375 := by
  native_decide

/-- Coefficient term 1376 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1376 : Poly :=
[
  term ((18432 : Rat) / 10675) [(3, 1), (4, 1), (9, 1), (11, 1), (13, 1)]
]

/-- Partial product 1376 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1376 : Poly :=
[
  term ((36864 : Rat) / 10675) [(3, 1), (4, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((-18432 : Rat) / 10675) [(3, 1), (4, 1), (9, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1376 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1376_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1376
        rs_R003_ueqv_R003YY_generator_19_1300_1399 =
      rs_R003_ueqv_R003YY_partial_19_1376 := by
  native_decide

/-- Coefficient term 1377 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1377 : Poly :=
[
  term ((-9216 : Rat) / 10675) [(3, 1), (4, 1), (11, 1), (12, 1), (13, 2)]
]

/-- Partial product 1377 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1377 : Poly :=
[
  term ((-18432 : Rat) / 10675) [(3, 1), (4, 1), (8, 1), (11, 1), (12, 1), (13, 2)],
  term ((9216 : Rat) / 10675) [(3, 1), (4, 1), (11, 1), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1377 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1377_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1377
        rs_R003_ueqv_R003YY_generator_19_1300_1399 =
      rs_R003_ueqv_R003YY_partial_19_1377 := by
  native_decide

/-- Coefficient term 1378 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1378 : Poly :=
[
  term ((-9216 : Rat) / 10675) [(3, 1), (4, 1), (11, 1), (13, 2)]
]

/-- Partial product 1378 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1378 : Poly :=
[
  term ((-18432 : Rat) / 10675) [(3, 1), (4, 1), (8, 1), (11, 1), (13, 2)],
  term ((9216 : Rat) / 10675) [(3, 1), (4, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1378 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1378_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1378
        rs_R003_ueqv_R003YY_generator_19_1300_1399 =
      rs_R003_ueqv_R003YY_partial_19_1378 := by
  native_decide

/-- Coefficient term 1379 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1379 : Poly :=
[
  term ((-1824 : Rat) / 7625) [(3, 1), (5, 1), (6, 1), (7, 1), (13, 1)]
]

/-- Partial product 1379 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1379 : Poly :=
[
  term ((-3648 : Rat) / 7625) [(3, 1), (5, 1), (6, 1), (7, 1), (8, 1), (13, 1)],
  term ((1824 : Rat) / 7625) [(3, 1), (5, 1), (6, 1), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1379 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1379_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1379
        rs_R003_ueqv_R003YY_generator_19_1300_1399 =
      rs_R003_ueqv_R003YY_partial_19_1379 := by
  native_decide

/-- Coefficient term 1380 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1380 : Poly :=
[
  term ((3648 : Rat) / 7625) [(3, 1), (5, 1), (6, 1), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 1380 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1380 : Poly :=
[
  term ((7296 : Rat) / 7625) [(3, 1), (5, 1), (6, 1), (8, 1), (9, 1), (12, 1), (13, 1)],
  term ((-3648 : Rat) / 7625) [(3, 1), (5, 1), (6, 1), (9, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1380 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1380_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1380
        rs_R003_ueqv_R003YY_generator_19_1300_1399 =
      rs_R003_ueqv_R003YY_partial_19_1380 := by
  native_decide

/-- Coefficient term 1381 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1381 : Poly :=
[
  term ((-5472 : Rat) / 7625) [(3, 1), (5, 1), (6, 1), (9, 1), (13, 1)]
]

/-- Partial product 1381 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1381 : Poly :=
[
  term ((-10944 : Rat) / 7625) [(3, 1), (5, 1), (6, 1), (8, 1), (9, 1), (13, 1)],
  term ((5472 : Rat) / 7625) [(3, 1), (5, 1), (6, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1381 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1381_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1381
        rs_R003_ueqv_R003YY_generator_19_1300_1399 =
      rs_R003_ueqv_R003YY_partial_19_1381 := by
  native_decide

/-- Coefficient term 1382 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1382 : Poly :=
[
  term ((-3648 : Rat) / 7625) [(3, 1), (5, 1), (7, 1), (8, 1), (12, 1), (13, 1)]
]

/-- Partial product 1382 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1382 : Poly :=
[
  term ((3648 : Rat) / 7625) [(3, 1), (5, 1), (7, 1), (8, 1), (12, 1), (13, 1)],
  term ((-7296 : Rat) / 7625) [(3, 1), (5, 1), (7, 1), (8, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1382 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1382_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1382
        rs_R003_ueqv_R003YY_generator_19_1300_1399 =
      rs_R003_ueqv_R003YY_partial_19_1382 := by
  native_decide

/-- Coefficient term 1383 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1383 : Poly :=
[
  term ((5472 : Rat) / 7625) [(3, 1), (5, 1), (7, 1), (8, 1), (13, 1)]
]

/-- Partial product 1383 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1383 : Poly :=
[
  term ((-5472 : Rat) / 7625) [(3, 1), (5, 1), (7, 1), (8, 1), (13, 1)],
  term ((10944 : Rat) / 7625) [(3, 1), (5, 1), (7, 1), (8, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1383 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1383_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1383
        rs_R003_ueqv_R003YY_generator_19_1300_1399 =
      rs_R003_ueqv_R003YY_partial_19_1383 := by
  native_decide

/-- Coefficient term 1384 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1384 : Poly :=
[
  term ((-3648 : Rat) / 7625) [(3, 1), (5, 1), (7, 1), (12, 1), (13, 1)]
]

/-- Partial product 1384 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1384 : Poly :=
[
  term ((-7296 : Rat) / 7625) [(3, 1), (5, 1), (7, 1), (8, 1), (12, 1), (13, 1)],
  term ((3648 : Rat) / 7625) [(3, 1), (5, 1), (7, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1384 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1384_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1384
        rs_R003_ueqv_R003YY_generator_19_1300_1399 =
      rs_R003_ueqv_R003YY_partial_19_1384 := by
  native_decide

/-- Coefficient term 1385 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1385 : Poly :=
[
  term ((3648 : Rat) / 7625) [(3, 1), (5, 1), (7, 1), (12, 2), (13, 1)]
]

/-- Partial product 1385 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1385 : Poly :=
[
  term ((7296 : Rat) / 7625) [(3, 1), (5, 1), (7, 1), (8, 1), (12, 2), (13, 1)],
  term ((-3648 : Rat) / 7625) [(3, 1), (5, 1), (7, 1), (12, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1385 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1385_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1385
        rs_R003_ueqv_R003YY_generator_19_1300_1399 =
      rs_R003_ueqv_R003YY_partial_19_1385 := by
  native_decide

/-- Coefficient term 1386 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1386 : Poly :=
[
  term ((-912 : Rat) / 7625) [(3, 1), (5, 1), (7, 1), (13, 1)]
]

/-- Partial product 1386 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1386 : Poly :=
[
  term ((-1824 : Rat) / 7625) [(3, 1), (5, 1), (7, 1), (8, 1), (13, 1)],
  term ((912 : Rat) / 7625) [(3, 1), (5, 1), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1386 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1386_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1386
        rs_R003_ueqv_R003YY_generator_19_1300_1399 =
      rs_R003_ueqv_R003YY_partial_19_1386 := by
  native_decide

/-- Coefficient term 1387 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1387 : Poly :=
[
  term ((-3648 : Rat) / 7625) [(3, 1), (5, 1), (9, 1), (13, 1)]
]

/-- Partial product 1387 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1387 : Poly :=
[
  term ((-7296 : Rat) / 7625) [(3, 1), (5, 1), (8, 1), (9, 1), (13, 1)],
  term ((3648 : Rat) / 7625) [(3, 1), (5, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1387 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1387_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1387
        rs_R003_ueqv_R003YY_generator_19_1300_1399 =
      rs_R003_ueqv_R003YY_partial_19_1387 := by
  native_decide

/-- Coefficient term 1388 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1388 : Poly :=
[
  term ((1824 : Rat) / 7625) [(3, 1), (5, 1), (12, 1), (13, 2)]
]

/-- Partial product 1388 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1388 : Poly :=
[
  term ((3648 : Rat) / 7625) [(3, 1), (5, 1), (8, 1), (12, 1), (13, 2)],
  term ((-1824 : Rat) / 7625) [(3, 1), (5, 1), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1388 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1388_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1388
        rs_R003_ueqv_R003YY_generator_19_1300_1399 =
      rs_R003_ueqv_R003YY_partial_19_1388 := by
  native_decide

/-- Coefficient term 1389 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1389 : Poly :=
[
  term ((1824 : Rat) / 7625) [(3, 1), (5, 1), (13, 2)]
]

/-- Partial product 1389 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1389 : Poly :=
[
  term ((3648 : Rat) / 7625) [(3, 1), (5, 1), (8, 1), (13, 2)],
  term ((-1824 : Rat) / 7625) [(3, 1), (5, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1389 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1389_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1389
        rs_R003_ueqv_R003YY_generator_19_1300_1399 =
      rs_R003_ueqv_R003YY_partial_19_1389 := by
  native_decide

/-- Coefficient term 1390 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1390 : Poly :=
[
  term ((-120 : Rat) / 7) [(3, 1), (6, 1), (7, 1)]
]

/-- Partial product 1390 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1390 : Poly :=
[
  term ((120 : Rat) / 7) [(3, 1), (6, 1), (7, 1)],
  term ((-240 : Rat) / 7) [(3, 1), (6, 1), (7, 1), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1390 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1390_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1390
        rs_R003_ueqv_R003YY_generator_19_1300_1399 =
      rs_R003_ueqv_R003YY_partial_19_1390 := by
  native_decide

/-- Coefficient term 1391 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1391 : Poly :=
[
  term ((576 : Rat) / 7) [(3, 1), (6, 1), (7, 1), (9, 1), (11, 1)]
]

/-- Partial product 1391 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1391 : Poly :=
[
  term ((1152 : Rat) / 7) [(3, 1), (6, 1), (7, 1), (8, 1), (9, 1), (11, 1)],
  term ((-576 : Rat) / 7) [(3, 1), (6, 1), (7, 1), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1391 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1391_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1391
        rs_R003_ueqv_R003YY_generator_19_1300_1399 =
      rs_R003_ueqv_R003YY_partial_19_1391 := by
  native_decide

/-- Coefficient term 1392 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1392 : Poly :=
[
  term ((288 : Rat) / 7) [(3, 1), (6, 1), (7, 1), (9, 1), (11, 1), (14, 1)]
]

/-- Partial product 1392 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1392 : Poly :=
[
  term ((576 : Rat) / 7) [(3, 1), (6, 1), (7, 1), (8, 1), (9, 1), (11, 1), (14, 1)],
  term ((-288 : Rat) / 7) [(3, 1), (6, 1), (7, 1), (9, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1392 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1392_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1392
        rs_R003_ueqv_R003YY_generator_19_1300_1399 =
      rs_R003_ueqv_R003YY_partial_19_1392 := by
  native_decide

/-- Coefficient term 1393 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1393 : Poly :=
[
  term ((-96 : Rat) / 7) [(3, 1), (6, 1), (7, 1), (9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 1393 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1393 : Poly :=
[
  term ((-192 : Rat) / 7) [(3, 1), (6, 1), (7, 1), (8, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((96 : Rat) / 7) [(3, 1), (6, 1), (7, 1), (9, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1393 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1393_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1393
        rs_R003_ueqv_R003YY_generator_19_1300_1399 =
      rs_R003_ueqv_R003YY_partial_19_1393 := by
  native_decide

/-- Coefficient term 1394 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1394 : Poly :=
[
  term ((-192 : Rat) / 7) [(3, 1), (6, 1), (7, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 1394 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1394 : Poly :=
[
  term ((-384 : Rat) / 7) [(3, 1), (6, 1), (7, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((192 : Rat) / 7) [(3, 1), (6, 1), (7, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1394 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1394_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1394
        rs_R003_ueqv_R003YY_generator_19_1300_1399 =
      rs_R003_ueqv_R003YY_partial_19_1394 := by
  native_decide

/-- Coefficient term 1395 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1395 : Poly :=
[
  term ((-2329584 : Rat) / 10675) [(3, 1), (6, 1), (7, 1), (11, 1), (13, 1)]
]

/-- Partial product 1395 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1395 : Poly :=
[
  term ((-4659168 : Rat) / 10675) [(3, 1), (6, 1), (7, 1), (8, 1), (11, 1), (13, 1)],
  term ((2329584 : Rat) / 10675) [(3, 1), (6, 1), (7, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1395 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1395_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1395
        rs_R003_ueqv_R003YY_generator_19_1300_1399 =
      rs_R003_ueqv_R003YY_partial_19_1395 := by
  native_decide

/-- Coefficient term 1396 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1396 : Poly :=
[
  term ((-576 : Rat) / 35) [(3, 1), (6, 1), (7, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 1396 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1396 : Poly :=
[
  term ((-1152 : Rat) / 35) [(3, 1), (6, 1), (7, 1), (8, 1), (11, 1), (13, 1), (14, 1)],
  term ((576 : Rat) / 35) [(3, 1), (6, 1), (7, 1), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1396 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1396_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1396
        rs_R003_ueqv_R003YY_generator_19_1300_1399 =
      rs_R003_ueqv_R003YY_partial_19_1396 := by
  native_decide

/-- Coefficient term 1397 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1397 : Poly :=
[
  term ((192 : Rat) / 35) [(3, 1), (6, 1), (7, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1397 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1397 : Poly :=
[
  term ((384 : Rat) / 35) [(3, 1), (6, 1), (7, 1), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-192 : Rat) / 35) [(3, 1), (6, 1), (7, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1397 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1397_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1397
        rs_R003_ueqv_R003YY_generator_19_1300_1399 =
      rs_R003_ueqv_R003YY_partial_19_1397 := by
  native_decide

/-- Coefficient term 1398 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1398 : Poly :=
[
  term ((2544 : Rat) / 35) [(3, 1), (6, 1), (7, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 1398 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1398 : Poly :=
[
  term ((5088 : Rat) / 35) [(3, 1), (6, 1), (7, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-2544 : Rat) / 35) [(3, 1), (6, 1), (7, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1398 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1398_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1398
        rs_R003_ueqv_R003YY_generator_19_1300_1399 =
      rs_R003_ueqv_R003YY_partial_19_1398 := by
  native_decide

/-- Coefficient term 1399 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1399 : Poly :=
[
  term ((-1222 : Rat) / 35) [(3, 1), (6, 1), (7, 1), (11, 1), (15, 1)]
]

/-- Partial product 1399 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1399 : Poly :=
[
  term ((-2444 : Rat) / 35) [(3, 1), (6, 1), (7, 1), (8, 1), (11, 1), (15, 1)],
  term ((1222 : Rat) / 35) [(3, 1), (6, 1), (7, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1399 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1399_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1399
        rs_R003_ueqv_R003YY_generator_19_1300_1399 =
      rs_R003_ueqv_R003YY_partial_19_1399 := by
  native_decide

/-- Partial products in this block. -/
def rs_R003_ueqv_R003YY_partials_19_1300_1399 : List Poly :=
[
  rs_R003_ueqv_R003YY_partial_19_1300,
  rs_R003_ueqv_R003YY_partial_19_1301,
  rs_R003_ueqv_R003YY_partial_19_1302,
  rs_R003_ueqv_R003YY_partial_19_1303,
  rs_R003_ueqv_R003YY_partial_19_1304,
  rs_R003_ueqv_R003YY_partial_19_1305,
  rs_R003_ueqv_R003YY_partial_19_1306,
  rs_R003_ueqv_R003YY_partial_19_1307,
  rs_R003_ueqv_R003YY_partial_19_1308,
  rs_R003_ueqv_R003YY_partial_19_1309,
  rs_R003_ueqv_R003YY_partial_19_1310,
  rs_R003_ueqv_R003YY_partial_19_1311,
  rs_R003_ueqv_R003YY_partial_19_1312,
  rs_R003_ueqv_R003YY_partial_19_1313,
  rs_R003_ueqv_R003YY_partial_19_1314,
  rs_R003_ueqv_R003YY_partial_19_1315,
  rs_R003_ueqv_R003YY_partial_19_1316,
  rs_R003_ueqv_R003YY_partial_19_1317,
  rs_R003_ueqv_R003YY_partial_19_1318,
  rs_R003_ueqv_R003YY_partial_19_1319,
  rs_R003_ueqv_R003YY_partial_19_1320,
  rs_R003_ueqv_R003YY_partial_19_1321,
  rs_R003_ueqv_R003YY_partial_19_1322,
  rs_R003_ueqv_R003YY_partial_19_1323,
  rs_R003_ueqv_R003YY_partial_19_1324,
  rs_R003_ueqv_R003YY_partial_19_1325,
  rs_R003_ueqv_R003YY_partial_19_1326,
  rs_R003_ueqv_R003YY_partial_19_1327,
  rs_R003_ueqv_R003YY_partial_19_1328,
  rs_R003_ueqv_R003YY_partial_19_1329,
  rs_R003_ueqv_R003YY_partial_19_1330,
  rs_R003_ueqv_R003YY_partial_19_1331,
  rs_R003_ueqv_R003YY_partial_19_1332,
  rs_R003_ueqv_R003YY_partial_19_1333,
  rs_R003_ueqv_R003YY_partial_19_1334,
  rs_R003_ueqv_R003YY_partial_19_1335,
  rs_R003_ueqv_R003YY_partial_19_1336,
  rs_R003_ueqv_R003YY_partial_19_1337,
  rs_R003_ueqv_R003YY_partial_19_1338,
  rs_R003_ueqv_R003YY_partial_19_1339,
  rs_R003_ueqv_R003YY_partial_19_1340,
  rs_R003_ueqv_R003YY_partial_19_1341,
  rs_R003_ueqv_R003YY_partial_19_1342,
  rs_R003_ueqv_R003YY_partial_19_1343,
  rs_R003_ueqv_R003YY_partial_19_1344,
  rs_R003_ueqv_R003YY_partial_19_1345,
  rs_R003_ueqv_R003YY_partial_19_1346,
  rs_R003_ueqv_R003YY_partial_19_1347,
  rs_R003_ueqv_R003YY_partial_19_1348,
  rs_R003_ueqv_R003YY_partial_19_1349,
  rs_R003_ueqv_R003YY_partial_19_1350,
  rs_R003_ueqv_R003YY_partial_19_1351,
  rs_R003_ueqv_R003YY_partial_19_1352,
  rs_R003_ueqv_R003YY_partial_19_1353,
  rs_R003_ueqv_R003YY_partial_19_1354,
  rs_R003_ueqv_R003YY_partial_19_1355,
  rs_R003_ueqv_R003YY_partial_19_1356,
  rs_R003_ueqv_R003YY_partial_19_1357,
  rs_R003_ueqv_R003YY_partial_19_1358,
  rs_R003_ueqv_R003YY_partial_19_1359,
  rs_R003_ueqv_R003YY_partial_19_1360,
  rs_R003_ueqv_R003YY_partial_19_1361,
  rs_R003_ueqv_R003YY_partial_19_1362,
  rs_R003_ueqv_R003YY_partial_19_1363,
  rs_R003_ueqv_R003YY_partial_19_1364,
  rs_R003_ueqv_R003YY_partial_19_1365,
  rs_R003_ueqv_R003YY_partial_19_1366,
  rs_R003_ueqv_R003YY_partial_19_1367,
  rs_R003_ueqv_R003YY_partial_19_1368,
  rs_R003_ueqv_R003YY_partial_19_1369,
  rs_R003_ueqv_R003YY_partial_19_1370,
  rs_R003_ueqv_R003YY_partial_19_1371,
  rs_R003_ueqv_R003YY_partial_19_1372,
  rs_R003_ueqv_R003YY_partial_19_1373,
  rs_R003_ueqv_R003YY_partial_19_1374,
  rs_R003_ueqv_R003YY_partial_19_1375,
  rs_R003_ueqv_R003YY_partial_19_1376,
  rs_R003_ueqv_R003YY_partial_19_1377,
  rs_R003_ueqv_R003YY_partial_19_1378,
  rs_R003_ueqv_R003YY_partial_19_1379,
  rs_R003_ueqv_R003YY_partial_19_1380,
  rs_R003_ueqv_R003YY_partial_19_1381,
  rs_R003_ueqv_R003YY_partial_19_1382,
  rs_R003_ueqv_R003YY_partial_19_1383,
  rs_R003_ueqv_R003YY_partial_19_1384,
  rs_R003_ueqv_R003YY_partial_19_1385,
  rs_R003_ueqv_R003YY_partial_19_1386,
  rs_R003_ueqv_R003YY_partial_19_1387,
  rs_R003_ueqv_R003YY_partial_19_1388,
  rs_R003_ueqv_R003YY_partial_19_1389,
  rs_R003_ueqv_R003YY_partial_19_1390,
  rs_R003_ueqv_R003YY_partial_19_1391,
  rs_R003_ueqv_R003YY_partial_19_1392,
  rs_R003_ueqv_R003YY_partial_19_1393,
  rs_R003_ueqv_R003YY_partial_19_1394,
  rs_R003_ueqv_R003YY_partial_19_1395,
  rs_R003_ueqv_R003YY_partial_19_1396,
  rs_R003_ueqv_R003YY_partial_19_1397,
  rs_R003_ueqv_R003YY_partial_19_1398,
  rs_R003_ueqv_R003YY_partial_19_1399
]

/-- Sum of partial products in this block. -/
def rs_R003_ueqv_R003YY_block_19_1300_1399 : Poly :=
[
  term ((7488 : Rat) / 35) [(2, 1), (8, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-2496 : Rat) / 35) [(2, 1), (8, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((1467 : Rat) / 35) [(2, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((-867 : Rat) / 35) [(2, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((2304 : Rat) / 35) [(2, 1), (8, 1), (9, 1), (10, 2), (15, 1)],
  term ((-768 : Rat) / 35) [(2, 1), (8, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((4608 : Rat) / 35) [(2, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-1536 : Rat) / 35) [(2, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((4608 : Rat) / 5) [(2, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1536 : Rat) / 5) [(2, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((10368 : Rat) / 35) [(2, 1), (8, 1), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((-3456 : Rat) / 35) [(2, 1), (8, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((10368 : Rat) / 35) [(2, 1), (8, 1), (9, 1), (11, 2), (15, 1)],
  term ((-3456 : Rat) / 35) [(2, 1), (8, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((14508 : Rat) / 175) [(2, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-1404 : Rat) / 35) [(2, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((6912 : Rat) / 35) [(2, 1), (8, 1), (9, 1), (12, 2), (15, 1)],
  term ((-2304 : Rat) / 35) [(2, 1), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-2466 : Rat) / 35) [(2, 1), (8, 1), (9, 1), (15, 1)],
  term ((66 : Rat) / 35) [(2, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-55296 : Rat) / 35) [(2, 1), (8, 1), (9, 2), (11, 1), (12, 1), (15, 1)],
  term ((18432 : Rat) / 35) [(2, 1), (8, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-55296 : Rat) / 35) [(2, 1), (8, 1), (9, 2), (11, 1), (15, 1)],
  term ((18432 : Rat) / 35) [(2, 1), (8, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1152 : Rat) / 7) [(2, 1), (8, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((384 : Rat) / 7) [(2, 1), (8, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((2304 : Rat) / 7) [(2, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-768 : Rat) / 7) [(2, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((234 : Rat) / 35) [(2, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((678 : Rat) / 35) [(2, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((576 : Rat) / 35) [(2, 1), (8, 1), (10, 2), (13, 1), (15, 1)],
  term ((-192 : Rat) / 35) [(2, 1), (8, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1098 : Rat) / 35) [(2, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-78 : Rat) / 7) [(2, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-25344 : Rat) / 35) [(2, 1), (8, 1), (11, 1), (12, 2), (15, 1)],
  term ((8448 : Rat) / 35) [(2, 1), (8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((572784 : Rat) / 10675) [(2, 1), (8, 1), (11, 1), (13, 1)],
  term ((-2304 : Rat) / 35) [(2, 1), (8, 1), (11, 1), (13, 1), (14, 1)],
  term ((768 : Rat) / 35) [(2, 1), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-624 : Rat) / 35) [(2, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-2304 : Rat) / 35) [(2, 1), (8, 1), (11, 1), (13, 2), (15, 1)],
  term ((768 : Rat) / 35) [(2, 1), (8, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((31613 : Rat) / 70) [(2, 1), (8, 1), (11, 1), (15, 1)],
  term ((-11157 : Rat) / 70) [(2, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-576 : Rat) / 35) [(2, 1), (8, 1), (11, 2), (13, 1), (15, 1)],
  term ((192 : Rat) / 35) [(2, 1), (8, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((6 : Rat) / 5) [(2, 1), (8, 1), (12, 1)],
  term ((-28341 : Rat) / 175) [(2, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((2049 : Rat) / 35) [(2, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-24 : Rat) / 5) [(2, 1), (8, 1), (12, 1), (14, 1)],
  term ((-6 : Rat) / 5) [(2, 1), (8, 1), (12, 1), (16, 1)],
  term ((-207 : Rat) / 35) [(2, 1), (8, 1), (13, 1), (15, 1)],
  term ((447 : Rat) / 35) [(2, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-152 : Rat) / 5) [(2, 1), (8, 1), (14, 1)],
  term ((-2 : Rat) / 5) [(2, 1), (8, 1), (16, 1)],
  term ((-3744 : Rat) / 35) [(2, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((1248 : Rat) / 35) [(2, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1467 : Rat) / 70) [(2, 1), (9, 1), (10, 1), (15, 1)],
  term ((867 : Rat) / 70) [(2, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1152 : Rat) / 35) [(2, 1), (9, 1), (10, 2), (15, 1)],
  term ((384 : Rat) / 35) [(2, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-2304 : Rat) / 35) [(2, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((768 : Rat) / 35) [(2, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2304 : Rat) / 5) [(2, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((768 : Rat) / 5) [(2, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5184 : Rat) / 35) [(2, 1), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((1728 : Rat) / 35) [(2, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-5184 : Rat) / 35) [(2, 1), (9, 1), (11, 2), (15, 1)],
  term ((1728 : Rat) / 35) [(2, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-7254 : Rat) / 175) [(2, 1), (9, 1), (12, 1), (15, 1)],
  term ((702 : Rat) / 35) [(2, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3456 : Rat) / 35) [(2, 1), (9, 1), (12, 2), (15, 1)],
  term ((1152 : Rat) / 35) [(2, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((1233 : Rat) / 35) [(2, 1), (9, 1), (15, 1)],
  term ((-33 : Rat) / 35) [(2, 1), (9, 1), (15, 1), (16, 1)],
  term ((27648 : Rat) / 35) [(2, 1), (9, 2), (11, 1), (12, 1), (15, 1)],
  term ((-9216 : Rat) / 35) [(2, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((27648 : Rat) / 35) [(2, 1), (9, 2), (11, 1), (15, 1)],
  term ((-9216 : Rat) / 35) [(2, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((576 : Rat) / 7) [(2, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-192 : Rat) / 7) [(2, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1152 : Rat) / 7) [(2, 1), (10, 1), (11, 1), (15, 1)],
  term ((384 : Rat) / 7) [(2, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-117 : Rat) / 35) [(2, 1), (10, 1), (13, 1), (15, 1)],
  term ((-339 : Rat) / 35) [(2, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-288 : Rat) / 35) [(2, 1), (10, 2), (13, 1), (15, 1)],
  term ((96 : Rat) / 35) [(2, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((549 : Rat) / 35) [(2, 1), (11, 1), (12, 1), (15, 1)],
  term ((39 : Rat) / 7) [(2, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((12672 : Rat) / 35) [(2, 1), (11, 1), (12, 2), (15, 1)],
  term ((-4224 : Rat) / 35) [(2, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-286392 : Rat) / 10675) [(2, 1), (11, 1), (13, 1)],
  term ((1152 : Rat) / 35) [(2, 1), (11, 1), (13, 1), (14, 1)],
  term ((-384 : Rat) / 35) [(2, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((312 : Rat) / 35) [(2, 1), (11, 1), (13, 1), (16, 1)],
  term ((1152 : Rat) / 35) [(2, 1), (11, 1), (13, 2), (15, 1)],
  term ((-384 : Rat) / 35) [(2, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-31613 : Rat) / 140) [(2, 1), (11, 1), (15, 1)],
  term ((11157 : Rat) / 140) [(2, 1), (11, 1), (15, 1), (16, 1)],
  term ((288 : Rat) / 35) [(2, 1), (11, 2), (13, 1), (15, 1)],
  term ((-96 : Rat) / 35) [(2, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-3 : Rat) / 5) [(2, 1), (12, 1)],
  term ((28341 : Rat) / 350) [(2, 1), (12, 1), (13, 1), (15, 1)],
  term ((-2049 : Rat) / 70) [(2, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((12 : Rat) / 5) [(2, 1), (12, 1), (14, 1)],
  term ((3 : Rat) / 5) [(2, 1), (12, 1), (16, 1)],
  term ((207 : Rat) / 70) [(2, 1), (13, 1), (15, 1)],
  term ((-447 : Rat) / 70) [(2, 1), (13, 1), (15, 1), (16, 1)],
  term ((76 : Rat) / 5) [(2, 1), (14, 1)],
  term ((1 : Rat) / 5) [(2, 1), (16, 1)],
  term ((-1728 : Rat) / 35) [(2, 2), (8, 1), (11, 1), (15, 1)],
  term ((576 : Rat) / 35) [(2, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((864 : Rat) / 35) [(2, 2), (11, 1), (15, 1)],
  term ((-288 : Rat) / 35) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((18432 : Rat) / 7625) [(3, 1), (4, 1), (5, 1), (6, 1), (7, 1), (8, 1), (13, 1)],
  term ((-9216 : Rat) / 7625) [(3, 1), (4, 1), (5, 1), (6, 1), (7, 1), (13, 1)],
  term ((-36864 : Rat) / 7625) [(3, 1), (4, 1), (5, 1), (6, 1), (8, 1), (9, 1), (12, 1), (13, 1)],
  term ((55296 : Rat) / 7625) [(3, 1), (4, 1), (5, 1), (6, 1), (8, 1), (9, 1), (13, 1)],
  term ((18432 : Rat) / 7625) [(3, 1), (4, 1), (5, 1), (6, 1), (9, 1), (12, 1), (13, 1)],
  term ((-27648 : Rat) / 7625) [(3, 1), (4, 1), (5, 1), (6, 1), (9, 1), (13, 1)],
  term ((18432 : Rat) / 7625) [(3, 1), (4, 1), (5, 1), (7, 1), (8, 1), (12, 1), (13, 1)],
  term ((-36864 : Rat) / 7625) [(3, 1), (4, 1), (5, 1), (7, 1), (8, 1), (12, 2), (13, 1)],
  term ((36864 : Rat) / 7625) [(3, 1), (4, 1), (5, 1), (7, 1), (8, 1), (13, 1)],
  term ((36864 : Rat) / 7625) [(3, 1), (4, 1), (5, 1), (7, 1), (8, 2), (12, 1), (13, 1)],
  term ((-55296 : Rat) / 7625) [(3, 1), (4, 1), (5, 1), (7, 1), (8, 2), (13, 1)],
  term ((-18432 : Rat) / 7625) [(3, 1), (4, 1), (5, 1), (7, 1), (12, 1), (13, 1)],
  term ((18432 : Rat) / 7625) [(3, 1), (4, 1), (5, 1), (7, 1), (12, 2), (13, 1)],
  term ((-4608 : Rat) / 7625) [(3, 1), (4, 1), (5, 1), (7, 1), (13, 1)],
  term ((36864 : Rat) / 7625) [(3, 1), (4, 1), (5, 1), (8, 1), (9, 1), (13, 1)],
  term ((-18432 : Rat) / 7625) [(3, 1), (4, 1), (5, 1), (8, 1), (12, 1), (13, 2)],
  term ((-18432 : Rat) / 7625) [(3, 1), (4, 1), (5, 1), (8, 1), (13, 2)],
  term ((-18432 : Rat) / 7625) [(3, 1), (4, 1), (5, 1), (9, 1), (13, 1)],
  term ((9216 : Rat) / 7625) [(3, 1), (4, 1), (5, 1), (12, 1), (13, 2)],
  term ((9216 : Rat) / 7625) [(3, 1), (4, 1), (5, 1), (13, 2)],
  term ((18432 : Rat) / 10675) [(3, 1), (4, 1), (6, 1), (7, 1), (8, 1), (11, 1), (13, 1)],
  term ((-9216 : Rat) / 10675) [(3, 1), (4, 1), (6, 1), (7, 1), (11, 1), (13, 1)],
  term ((-36864 : Rat) / 10675) [(3, 1), (4, 1), (6, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((55296 : Rat) / 10675) [(3, 1), (4, 1), (6, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((18432 : Rat) / 10675) [(3, 1), (4, 1), (6, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((-27648 : Rat) / 10675) [(3, 1), (4, 1), (6, 1), (9, 1), (11, 1), (13, 1)],
  term ((18432 : Rat) / 10675) [(3, 1), (4, 1), (7, 1), (8, 1), (11, 1), (12, 1), (13, 1)],
  term ((-36864 : Rat) / 10675) [(3, 1), (4, 1), (7, 1), (8, 1), (11, 1), (12, 2), (13, 1)],
  term ((36864 : Rat) / 10675) [(3, 1), (4, 1), (7, 1), (8, 1), (11, 1), (13, 1)],
  term ((36864 : Rat) / 10675) [(3, 1), (4, 1), (7, 1), (8, 2), (11, 1), (12, 1), (13, 1)],
  term ((-55296 : Rat) / 10675) [(3, 1), (4, 1), (7, 1), (8, 2), (11, 1), (13, 1)],
  term ((-18432 : Rat) / 10675) [(3, 1), (4, 1), (7, 1), (11, 1), (12, 1), (13, 1)],
  term ((18432 : Rat) / 10675) [(3, 1), (4, 1), (7, 1), (11, 1), (12, 2), (13, 1)],
  term ((-4608 : Rat) / 10675) [(3, 1), (4, 1), (7, 1), (11, 1), (13, 1)],
  term ((36864 : Rat) / 10675) [(3, 1), (4, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((-18432 : Rat) / 10675) [(3, 1), (4, 1), (8, 1), (11, 1), (12, 1), (13, 2)],
  term ((-18432 : Rat) / 10675) [(3, 1), (4, 1), (8, 1), (11, 1), (13, 2)],
  term ((-18432 : Rat) / 10675) [(3, 1), (4, 1), (9, 1), (11, 1), (13, 1)],
  term ((9216 : Rat) / 10675) [(3, 1), (4, 1), (11, 1), (12, 1), (13, 2)],
  term ((9216 : Rat) / 10675) [(3, 1), (4, 1), (11, 1), (13, 2)],
  term ((-3648 : Rat) / 7625) [(3, 1), (5, 1), (6, 1), (7, 1), (8, 1), (13, 1)],
  term ((1824 : Rat) / 7625) [(3, 1), (5, 1), (6, 1), (7, 1), (13, 1)],
  term ((7296 : Rat) / 7625) [(3, 1), (5, 1), (6, 1), (8, 1), (9, 1), (12, 1), (13, 1)],
  term ((-10944 : Rat) / 7625) [(3, 1), (5, 1), (6, 1), (8, 1), (9, 1), (13, 1)],
  term ((-3648 : Rat) / 7625) [(3, 1), (5, 1), (6, 1), (9, 1), (12, 1), (13, 1)],
  term ((5472 : Rat) / 7625) [(3, 1), (5, 1), (6, 1), (9, 1), (13, 1)],
  term ((-3648 : Rat) / 7625) [(3, 1), (5, 1), (7, 1), (8, 1), (12, 1), (13, 1)],
  term ((7296 : Rat) / 7625) [(3, 1), (5, 1), (7, 1), (8, 1), (12, 2), (13, 1)],
  term ((-7296 : Rat) / 7625) [(3, 1), (5, 1), (7, 1), (8, 1), (13, 1)],
  term ((-7296 : Rat) / 7625) [(3, 1), (5, 1), (7, 1), (8, 2), (12, 1), (13, 1)],
  term ((10944 : Rat) / 7625) [(3, 1), (5, 1), (7, 1), (8, 2), (13, 1)],
  term ((3648 : Rat) / 7625) [(3, 1), (5, 1), (7, 1), (12, 1), (13, 1)],
  term ((-3648 : Rat) / 7625) [(3, 1), (5, 1), (7, 1), (12, 2), (13, 1)],
  term ((912 : Rat) / 7625) [(3, 1), (5, 1), (7, 1), (13, 1)],
  term ((-7296 : Rat) / 7625) [(3, 1), (5, 1), (8, 1), (9, 1), (13, 1)],
  term ((3648 : Rat) / 7625) [(3, 1), (5, 1), (8, 1), (12, 1), (13, 2)],
  term ((3648 : Rat) / 7625) [(3, 1), (5, 1), (8, 1), (13, 2)],
  term ((3648 : Rat) / 7625) [(3, 1), (5, 1), (9, 1), (13, 1)],
  term ((-1824 : Rat) / 7625) [(3, 1), (5, 1), (12, 1), (13, 2)],
  term ((-1824 : Rat) / 7625) [(3, 1), (5, 1), (13, 2)],
  term ((120 : Rat) / 7) [(3, 1), (6, 1), (7, 1)],
  term ((-240 : Rat) / 7) [(3, 1), (6, 1), (7, 1), (8, 1)],
  term ((1152 : Rat) / 7) [(3, 1), (6, 1), (7, 1), (8, 1), (9, 1), (11, 1)],
  term ((576 : Rat) / 7) [(3, 1), (6, 1), (7, 1), (8, 1), (9, 1), (11, 1), (14, 1)],
  term ((-192 : Rat) / 7) [(3, 1), (6, 1), (7, 1), (8, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-384 : Rat) / 7) [(3, 1), (6, 1), (7, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-4659168 : Rat) / 10675) [(3, 1), (6, 1), (7, 1), (8, 1), (11, 1), (13, 1)],
  term ((-1152 : Rat) / 35) [(3, 1), (6, 1), (7, 1), (8, 1), (11, 1), (13, 1), (14, 1)],
  term ((384 : Rat) / 35) [(3, 1), (6, 1), (7, 1), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((5088 : Rat) / 35) [(3, 1), (6, 1), (7, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-2444 : Rat) / 35) [(3, 1), (6, 1), (7, 1), (8, 1), (11, 1), (15, 1)],
  term ((-576 : Rat) / 7) [(3, 1), (6, 1), (7, 1), (9, 1), (11, 1)],
  term ((-288 : Rat) / 7) [(3, 1), (6, 1), (7, 1), (9, 1), (11, 1), (14, 1)],
  term ((96 : Rat) / 7) [(3, 1), (6, 1), (7, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((192 : Rat) / 7) [(3, 1), (6, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((2329584 : Rat) / 10675) [(3, 1), (6, 1), (7, 1), (11, 1), (13, 1)],
  term ((576 : Rat) / 35) [(3, 1), (6, 1), (7, 1), (11, 1), (13, 1), (14, 1)],
  term ((-192 : Rat) / 35) [(3, 1), (6, 1), (7, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2544 : Rat) / 35) [(3, 1), (6, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((1222 : Rat) / 35) [(3, 1), (6, 1), (7, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 19, terms 1300 through 1399. -/
theorem rs_R003_ueqv_R003YY_block_19_1300_1399_valid :
    checkProductSumEq rs_R003_ueqv_R003YY_partials_19_1300_1399
      rs_R003_ueqv_R003YY_block_19_1300_1399 = true := by
  native_decide

end R003UeqvR003YYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
