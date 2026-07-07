/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010YNN, term block 25:1300-1399

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010YNNTermShards

/-- Generator polynomial 25 for relaxed split surplus certificate `R010:u=v:R010YNN`. -/
def rs_R010_ueqv_R010YNN_generator_25_1300_1399 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(12, 1)]
]

/-- Coefficient term 1300 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1300 : Poly :=
[
  term ((36438665092662494464 : Rat) / 269491324728529755) [(3, 1), (5, 3), (8, 1), (9, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 1300 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1300 : Poly :=
[
  term ((-36438665092662494464 : Rat) / 269491324728529755) [(3, 1), (5, 3), (8, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((72877330185324988928 : Rat) / 269491324728529755) [(3, 1), (5, 3), (8, 1), (9, 1), (11, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1300 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1300_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1300
        rs_R010_ueqv_R010YNN_generator_25_1300_1399 =
      rs_R010_ueqv_R010YNN_partial_25_1300 := by
  native_decide

/-- Coefficient term 1301 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1301 : Poly :=
[
  term ((-72877330185324988928 : Rat) / 269491324728529755) [(3, 1), (5, 3), (8, 1), (9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 1301 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1301 : Poly :=
[
  term ((-145754660370649977856 : Rat) / 269491324728529755) [(3, 1), (5, 3), (8, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((72877330185324988928 : Rat) / 269491324728529755) [(3, 1), (5, 3), (8, 1), (9, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1301 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1301_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1301
        rs_R010_ueqv_R010YNN_generator_25_1300_1399 =
      rs_R010_ueqv_R010YNN_partial_25_1301 := by
  native_decide

/-- Coefficient term 1302 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1302 : Poly :=
[
  term ((-18219332546331247232 : Rat) / 269491324728529755) [(3, 1), (5, 3), (8, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 1302 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1302 : Poly :=
[
  term ((-36438665092662494464 : Rat) / 269491324728529755) [(3, 1), (5, 3), (8, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((18219332546331247232 : Rat) / 269491324728529755) [(3, 1), (5, 3), (8, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1302 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1302_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1302
        rs_R010_ueqv_R010YNN_generator_25_1300_1399 =
      rs_R010_ueqv_R010YNN_partial_25_1302 := by
  native_decide

/-- Coefficient term 1303 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1303 : Poly :=
[
  term ((226631849902565358592 : Rat) / 53898264945705951) [(3, 1), (5, 3), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1303 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1303 : Poly :=
[
  term ((-226631849902565358592 : Rat) / 53898264945705951) [(3, 1), (5, 3), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((453263699805130717184 : Rat) / 53898264945705951) [(3, 1), (5, 3), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1303 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1303_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1303
        rs_R010_ueqv_R010YNN_generator_25_1300_1399 =
      rs_R010_ueqv_R010YNN_partial_25_1303 := by
  native_decide

/-- Coefficient term 1304 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1304 : Poly :=
[
  term ((-453263699805130717184 : Rat) / 53898264945705951) [(3, 1), (5, 3), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1304 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1304 : Poly :=
[
  term ((-906527399610261434368 : Rat) / 53898264945705951) [(3, 1), (5, 3), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((453263699805130717184 : Rat) / 53898264945705951) [(3, 1), (5, 3), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1304 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1304_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1304
        rs_R010_ueqv_R010YNN_generator_25_1300_1399 =
      rs_R010_ueqv_R010YNN_partial_25_1304 := by
  native_decide

/-- Coefficient term 1305 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1305 : Poly :=
[
  term ((-113315924951282679296 : Rat) / 53898264945705951) [(3, 1), (5, 3), (8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 1305 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1305 : Poly :=
[
  term ((-226631849902565358592 : Rat) / 53898264945705951) [(3, 1), (5, 3), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((113315924951282679296 : Rat) / 53898264945705951) [(3, 1), (5, 3), (8, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1305 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1305_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1305
        rs_R010_ueqv_R010YNN_generator_25_1300_1399 =
      rs_R010_ueqv_R010YNN_partial_25_1305 := by
  native_decide

/-- Coefficient term 1306 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1306 : Poly :=
[
  term ((11535545852957006848 : Rat) / 89830441576176585) [(3, 1), (5, 3), (8, 1), (9, 2), (12, 1), (16, 1)]
]

/-- Partial product 1306 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1306 : Poly :=
[
  term ((-11535545852957006848 : Rat) / 89830441576176585) [(3, 1), (5, 3), (8, 1), (9, 2), (12, 1), (16, 1)],
  term ((23071091705914013696 : Rat) / 89830441576176585) [(3, 1), (5, 3), (8, 1), (9, 2), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1306 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1306_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1306
        rs_R010_ueqv_R010YNN_generator_25_1300_1399 =
      rs_R010_ueqv_R010YNN_partial_25_1306 := by
  native_decide

/-- Coefficient term 1307 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1307 : Poly :=
[
  term ((-23071091705914013696 : Rat) / 89830441576176585) [(3, 1), (5, 3), (8, 1), (9, 2), (14, 1), (16, 1)]
]

/-- Partial product 1307 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1307 : Poly :=
[
  term ((-46142183411828027392 : Rat) / 89830441576176585) [(3, 1), (5, 3), (8, 1), (9, 2), (12, 1), (14, 1), (16, 1)],
  term ((23071091705914013696 : Rat) / 89830441576176585) [(3, 1), (5, 3), (8, 1), (9, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1307 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1307_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1307
        rs_R010_ueqv_R010YNN_generator_25_1300_1399 =
      rs_R010_ueqv_R010YNN_partial_25_1307 := by
  native_decide

/-- Coefficient term 1308 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1308 : Poly :=
[
  term ((-5767772926478503424 : Rat) / 89830441576176585) [(3, 1), (5, 3), (8, 1), (9, 2), (16, 1)]
]

/-- Partial product 1308 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1308 : Poly :=
[
  term ((-11535545852957006848 : Rat) / 89830441576176585) [(3, 1), (5, 3), (8, 1), (9, 2), (12, 1), (16, 1)],
  term ((5767772926478503424 : Rat) / 89830441576176585) [(3, 1), (5, 3), (8, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1308 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1308_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1308
        rs_R010_ueqv_R010YNN_generator_25_1300_1399 =
      rs_R010_ueqv_R010YNN_partial_25_1308 := by
  native_decide

/-- Coefficient term 1309 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1309 : Poly :=
[
  term ((-4110804065241036160 : Rat) / 53898264945705951) [(3, 1), (5, 3), (8, 1), (12, 1), (16, 1)]
]

/-- Partial product 1309 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1309 : Poly :=
[
  term ((4110804065241036160 : Rat) / 53898264945705951) [(3, 1), (5, 3), (8, 1), (12, 1), (16, 1)],
  term ((-8221608130482072320 : Rat) / 53898264945705951) [(3, 1), (5, 3), (8, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1309 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1309_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1309
        rs_R010_ueqv_R010YNN_generator_25_1300_1399 =
      rs_R010_ueqv_R010YNN_partial_25_1309 := by
  native_decide

/-- Coefficient term 1310 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1310 : Poly :=
[
  term ((8221608130482072320 : Rat) / 53898264945705951) [(3, 1), (5, 3), (8, 1), (14, 1), (16, 1)]
]

/-- Partial product 1310 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1310 : Poly :=
[
  term ((16443216260964144640 : Rat) / 53898264945705951) [(3, 1), (5, 3), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((-8221608130482072320 : Rat) / 53898264945705951) [(3, 1), (5, 3), (8, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1310 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1310_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1310
        rs_R010_ueqv_R010YNN_generator_25_1300_1399 =
      rs_R010_ueqv_R010YNN_partial_25_1310 := by
  native_decide

/-- Coefficient term 1311 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1311 : Poly :=
[
  term ((2055402032620518080 : Rat) / 53898264945705951) [(3, 1), (5, 3), (8, 1), (16, 1)]
]

/-- Partial product 1311 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1311 : Poly :=
[
  term ((4110804065241036160 : Rat) / 53898264945705951) [(3, 1), (5, 3), (8, 1), (12, 1), (16, 1)],
  term ((-2055402032620518080 : Rat) / 53898264945705951) [(3, 1), (5, 3), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1311 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1311_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1311
        rs_R010_ueqv_R010YNN_generator_25_1300_1399 =
      rs_R010_ueqv_R010YNN_partial_25_1311 := by
  native_decide

/-- Coefficient term 1312 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1312 : Poly :=
[
  term ((-1999635241693123584 : Rat) / 29943480525392195) [(3, 1), (5, 3), (9, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 1312 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1312 : Poly :=
[
  term ((1999635241693123584 : Rat) / 29943480525392195) [(3, 1), (5, 3), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-3999270483386247168 : Rat) / 29943480525392195) [(3, 1), (5, 3), (9, 1), (11, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1312 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1312_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1312
        rs_R010_ueqv_R010YNN_generator_25_1300_1399 =
      rs_R010_ueqv_R010YNN_partial_25_1312 := by
  native_decide

/-- Coefficient term 1313 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1313 : Poly :=
[
  term ((3999270483386247168 : Rat) / 29943480525392195) [(3, 1), (5, 3), (9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 1313 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1313 : Poly :=
[
  term ((7998540966772494336 : Rat) / 29943480525392195) [(3, 1), (5, 3), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-3999270483386247168 : Rat) / 29943480525392195) [(3, 1), (5, 3), (9, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1313 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1313_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1313
        rs_R010_ueqv_R010YNN_generator_25_1300_1399 =
      rs_R010_ueqv_R010YNN_partial_25_1313 := by
  native_decide

/-- Coefficient term 1314 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1314 : Poly :=
[
  term ((999817620846561792 : Rat) / 29943480525392195) [(3, 1), (5, 3), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 1314 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1314 : Poly :=
[
  term ((1999635241693123584 : Rat) / 29943480525392195) [(3, 1), (5, 3), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-999817620846561792 : Rat) / 29943480525392195) [(3, 1), (5, 3), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1314 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1314_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1314
        rs_R010_ueqv_R010YNN_generator_25_1300_1399 =
      rs_R010_ueqv_R010YNN_partial_25_1314 := by
  native_decide

/-- Coefficient term 1315 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1315 : Poly :=
[
  term ((-423643182443139514528 : Rat) / 269491324728529755) [(3, 1), (5, 3), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1315 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1315 : Poly :=
[
  term ((423643182443139514528 : Rat) / 269491324728529755) [(3, 1), (5, 3), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-847286364886279029056 : Rat) / 269491324728529755) [(3, 1), (5, 3), (9, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1315 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1315_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1315
        rs_R010_ueqv_R010YNN_generator_25_1300_1399 =
      rs_R010_ueqv_R010YNN_partial_25_1315 := by
  native_decide

/-- Coefficient term 1316 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1316 : Poly :=
[
  term ((847286364886279029056 : Rat) / 269491324728529755) [(3, 1), (5, 3), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1316 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1316 : Poly :=
[
  term ((1694572729772558058112 : Rat) / 269491324728529755) [(3, 1), (5, 3), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-847286364886279029056 : Rat) / 269491324728529755) [(3, 1), (5, 3), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1316 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1316_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1316
        rs_R010_ueqv_R010YNN_generator_25_1300_1399 =
      rs_R010_ueqv_R010YNN_partial_25_1316 := by
  native_decide

/-- Coefficient term 1317 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1317 : Poly :=
[
  term ((211821591221569757264 : Rat) / 269491324728529755) [(3, 1), (5, 3), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 1317 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1317 : Poly :=
[
  term ((423643182443139514528 : Rat) / 269491324728529755) [(3, 1), (5, 3), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-211821591221569757264 : Rat) / 269491324728529755) [(3, 1), (5, 3), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1317 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1317_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1317
        rs_R010_ueqv_R010YNN_generator_25_1300_1399 =
      rs_R010_ueqv_R010YNN_partial_25_1317 := by
  native_decide

/-- Coefficient term 1318 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1318 : Poly :=
[
  term ((-27910621157975494400 : Rat) / 53898264945705951) [(3, 1), (5, 3), (9, 2), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 1318 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1318 : Poly :=
[
  term ((27910621157975494400 : Rat) / 53898264945705951) [(3, 1), (5, 3), (9, 2), (10, 1), (12, 1), (16, 1)],
  term ((-55821242315950988800 : Rat) / 53898264945705951) [(3, 1), (5, 3), (9, 2), (10, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1318 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1318_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1318
        rs_R010_ueqv_R010YNN_generator_25_1300_1399 =
      rs_R010_ueqv_R010YNN_partial_25_1318 := by
  native_decide

/-- Coefficient term 1319 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1319 : Poly :=
[
  term ((55821242315950988800 : Rat) / 53898264945705951) [(3, 1), (5, 3), (9, 2), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 1319 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1319 : Poly :=
[
  term ((111642484631901977600 : Rat) / 53898264945705951) [(3, 1), (5, 3), (9, 2), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-55821242315950988800 : Rat) / 53898264945705951) [(3, 1), (5, 3), (9, 2), (10, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1319 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1319_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1319
        rs_R010_ueqv_R010YNN_generator_25_1300_1399 =
      rs_R010_ueqv_R010YNN_partial_25_1319 := by
  native_decide

/-- Coefficient term 1320 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1320 : Poly :=
[
  term ((6895907067232796800 : Rat) / 53898264945705951) [(3, 1), (5, 3), (9, 2), (10, 1), (16, 1)]
]

/-- Partial product 1320 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1320 : Poly :=
[
  term ((13791814134465593600 : Rat) / 53898264945705951) [(3, 1), (5, 3), (9, 2), (10, 1), (12, 1), (16, 1)],
  term ((-6895907067232796800 : Rat) / 53898264945705951) [(3, 1), (5, 3), (9, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1320 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1320_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1320
        rs_R010_ueqv_R010YNN_generator_25_1300_1399 =
      rs_R010_ueqv_R010YNN_partial_25_1320 := by
  native_decide

/-- Coefficient term 1321 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1321 : Poly :=
[
  term ((475721833237504000 : Rat) / 17966088315235317) [(3, 1), (5, 3), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1321 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1321 : Poly :=
[
  term ((-475721833237504000 : Rat) / 17966088315235317) [(3, 1), (5, 3), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((951443666475008000 : Rat) / 17966088315235317) [(3, 1), (5, 3), (9, 2), (11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1321 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1321_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1321
        rs_R010_ueqv_R010YNN_generator_25_1300_1399 =
      rs_R010_ueqv_R010YNN_partial_25_1321 := by
  native_decide

/-- Coefficient term 1322 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1322 : Poly :=
[
  term ((-951443666475008000 : Rat) / 17966088315235317) [(3, 1), (5, 3), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1322 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1322 : Poly :=
[
  term ((-1902887332950016000 : Rat) / 17966088315235317) [(3, 1), (5, 3), (9, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((951443666475008000 : Rat) / 17966088315235317) [(3, 1), (5, 3), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1322 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1322_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1322
        rs_R010_ueqv_R010YNN_generator_25_1300_1399 =
      rs_R010_ueqv_R010YNN_partial_25_1322 := by
  native_decide

/-- Coefficient term 1323 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1323 : Poly :=
[
  term ((-237860916618752000 : Rat) / 17966088315235317) [(3, 1), (5, 3), (9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1323 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1323 : Poly :=
[
  term ((-475721833237504000 : Rat) / 17966088315235317) [(3, 1), (5, 3), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((237860916618752000 : Rat) / 17966088315235317) [(3, 1), (5, 3), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1323 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1323_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1323
        rs_R010_ueqv_R010YNN_generator_25_1300_1399 =
      rs_R010_ueqv_R010YNN_partial_25_1323 := by
  native_decide

/-- Coefficient term 1324 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1324 : Poly :=
[
  term ((9412538015673267200 : Rat) / 17966088315235317) [(3, 1), (5, 3), (9, 2), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1324 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1324 : Poly :=
[
  term ((-9412538015673267200 : Rat) / 17966088315235317) [(3, 1), (5, 3), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((18825076031346534400 : Rat) / 17966088315235317) [(3, 1), (5, 3), (9, 2), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1324 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1324_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1324
        rs_R010_ueqv_R010YNN_generator_25_1300_1399 =
      rs_R010_ueqv_R010YNN_partial_25_1324 := by
  native_decide

/-- Coefficient term 1325 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1325 : Poly :=
[
  term ((-18939358745034804736 : Rat) / 53898264945705951) [(3, 1), (5, 3), (9, 2), (12, 1), (16, 1)]
]

/-- Partial product 1325 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1325 : Poly :=
[
  term ((18939358745034804736 : Rat) / 53898264945705951) [(3, 1), (5, 3), (9, 2), (12, 1), (16, 1)],
  term ((-37878717490069609472 : Rat) / 53898264945705951) [(3, 1), (5, 3), (9, 2), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1325 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1325_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1325
        rs_R010_ueqv_R010YNN_generator_25_1300_1399 =
      rs_R010_ueqv_R010YNN_partial_25_1325 := by
  native_decide

/-- Coefficient term 1326 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1326 : Poly :=
[
  term ((-18825076031346534400 : Rat) / 17966088315235317) [(3, 1), (5, 3), (9, 2), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1326 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1326 : Poly :=
[
  term ((-37650152062693068800 : Rat) / 17966088315235317) [(3, 1), (5, 3), (9, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((18825076031346534400 : Rat) / 17966088315235317) [(3, 1), (5, 3), (9, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1326 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1326_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1326
        rs_R010_ueqv_R010YNN_generator_25_1300_1399 =
      rs_R010_ueqv_R010YNN_partial_25_1326 := by
  native_decide

/-- Coefficient term 1327 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1327 : Poly :=
[
  term ((37878717490069609472 : Rat) / 53898264945705951) [(3, 1), (5, 3), (9, 2), (14, 1), (16, 1)]
]

/-- Partial product 1327 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1327 : Poly :=
[
  term ((75757434980139218944 : Rat) / 53898264945705951) [(3, 1), (5, 3), (9, 2), (12, 1), (14, 1), (16, 1)],
  term ((-37878717490069609472 : Rat) / 53898264945705951) [(3, 1), (5, 3), (9, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1327 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1327_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1327
        rs_R010_ueqv_R010YNN_generator_25_1300_1399 =
      rs_R010_ueqv_R010YNN_partial_25_1327 := by
  native_decide

/-- Coefficient term 1328 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1328 : Poly :=
[
  term ((-4706269007836633600 : Rat) / 17966088315235317) [(3, 1), (5, 3), (9, 2), (15, 2), (16, 1)]
]

/-- Partial product 1328 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1328 : Poly :=
[
  term ((-9412538015673267200 : Rat) / 17966088315235317) [(3, 1), (5, 3), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((4706269007836633600 : Rat) / 17966088315235317) [(3, 1), (5, 3), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1328 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1328_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1328
        rs_R010_ueqv_R010YNN_generator_25_1300_1399 =
      rs_R010_ueqv_R010YNN_partial_25_1328 := by
  native_decide

/-- Coefficient term 1329 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1329 : Poly :=
[
  term ((9469679372517402368 : Rat) / 53898264945705951) [(3, 1), (5, 3), (9, 2), (16, 1)]
]

/-- Partial product 1329 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1329 : Poly :=
[
  term ((18939358745034804736 : Rat) / 53898264945705951) [(3, 1), (5, 3), (9, 2), (12, 1), (16, 1)],
  term ((-9469679372517402368 : Rat) / 53898264945705951) [(3, 1), (5, 3), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1329 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1329_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1329
        rs_R010_ueqv_R010YNN_generator_25_1300_1399 =
      rs_R010_ueqv_R010YNN_partial_25_1329 := by
  native_decide

/-- Coefficient term 1330 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1330 : Poly :=
[
  term ((272584152539074975744 : Rat) / 89830441576176585) [(3, 1), (5, 3), (9, 3), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1330 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1330 : Poly :=
[
  term ((-272584152539074975744 : Rat) / 89830441576176585) [(3, 1), (5, 3), (9, 3), (12, 1), (15, 1), (16, 1)],
  term ((545168305078149951488 : Rat) / 89830441576176585) [(3, 1), (5, 3), (9, 3), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1330 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1330_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1330
        rs_R010_ueqv_R010YNN_generator_25_1300_1399 =
      rs_R010_ueqv_R010YNN_partial_25_1330 := by
  native_decide

/-- Coefficient term 1331 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1331 : Poly :=
[
  term ((-545168305078149951488 : Rat) / 89830441576176585) [(3, 1), (5, 3), (9, 3), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1331 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1331 : Poly :=
[
  term ((-1090336610156299902976 : Rat) / 89830441576176585) [(3, 1), (5, 3), (9, 3), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((545168305078149951488 : Rat) / 89830441576176585) [(3, 1), (5, 3), (9, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1331 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1331_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1331
        rs_R010_ueqv_R010YNN_generator_25_1300_1399 =
      rs_R010_ueqv_R010YNN_partial_25_1331 := by
  native_decide

/-- Coefficient term 1332 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1332 : Poly :=
[
  term ((-136292076269537487872 : Rat) / 89830441576176585) [(3, 1), (5, 3), (9, 3), (15, 1), (16, 1)]
]

/-- Partial product 1332 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1332 : Poly :=
[
  term ((-272584152539074975744 : Rat) / 89830441576176585) [(3, 1), (5, 3), (9, 3), (12, 1), (15, 1), (16, 1)],
  term ((136292076269537487872 : Rat) / 89830441576176585) [(3, 1), (5, 3), (9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1332 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1332_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1332
        rs_R010_ueqv_R010YNN_generator_25_1300_1399 =
      rs_R010_ueqv_R010YNN_partial_25_1332 := by
  native_decide

/-- Coefficient term 1333 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1333 : Poly :=
[
  term ((3794058785229976960 : Rat) / 53898264945705951) [(3, 1), (5, 3), (12, 1), (16, 1)]
]

/-- Partial product 1333 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1333 : Poly :=
[
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(3, 1), (5, 3), (12, 1), (16, 1)],
  term ((7588117570459953920 : Rat) / 53898264945705951) [(3, 1), (5, 3), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1333 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1333_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1333
        rs_R010_ueqv_R010YNN_generator_25_1300_1399 =
      rs_R010_ueqv_R010YNN_partial_25_1333 := by
  native_decide

/-- Coefficient term 1334 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1334 : Poly :=
[
  term ((-7588117570459953920 : Rat) / 53898264945705951) [(3, 1), (5, 3), (14, 1), (16, 1)]
]

/-- Partial product 1334 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1334 : Poly :=
[
  term ((-15176235140919907840 : Rat) / 53898264945705951) [(3, 1), (5, 3), (12, 1), (14, 1), (16, 1)],
  term ((7588117570459953920 : Rat) / 53898264945705951) [(3, 1), (5, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1334 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1334_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1334
        rs_R010_ueqv_R010YNN_generator_25_1300_1399 =
      rs_R010_ueqv_R010YNN_partial_25_1334 := by
  native_decide

/-- Coefficient term 1335 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1335 : Poly :=
[
  term ((-1897029392614988480 : Rat) / 53898264945705951) [(3, 1), (5, 3), (16, 1)]
]

/-- Partial product 1335 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1335 : Poly :=
[
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(3, 1), (5, 3), (12, 1), (16, 1)],
  term ((1897029392614988480 : Rat) / 53898264945705951) [(3, 1), (5, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1335 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1335_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1335
        rs_R010_ueqv_R010YNN_generator_25_1300_1399 =
      rs_R010_ueqv_R010YNN_partial_25_1335 := by
  native_decide

/-- Coefficient term 1336 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1336 : Poly :=
[
  term ((-9412538015673267200 : Rat) / 17966088315235317) [(3, 1), (5, 4), (9, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1336 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1336 : Poly :=
[
  term ((9412538015673267200 : Rat) / 17966088315235317) [(3, 1), (5, 4), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-18825076031346534400 : Rat) / 17966088315235317) [(3, 1), (5, 4), (9, 2), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1336 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1336_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1336
        rs_R010_ueqv_R010YNN_generator_25_1300_1399 =
      rs_R010_ueqv_R010YNN_partial_25_1336 := by
  native_decide

/-- Coefficient term 1337 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1337 : Poly :=
[
  term ((18825076031346534400 : Rat) / 17966088315235317) [(3, 1), (5, 4), (9, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1337 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1337 : Poly :=
[
  term ((37650152062693068800 : Rat) / 17966088315235317) [(3, 1), (5, 4), (9, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-18825076031346534400 : Rat) / 17966088315235317) [(3, 1), (5, 4), (9, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1337 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1337_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1337
        rs_R010_ueqv_R010YNN_generator_25_1300_1399 =
      rs_R010_ueqv_R010YNN_partial_25_1337 := by
  native_decide

/-- Coefficient term 1338 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1338 : Poly :=
[
  term ((4706269007836633600 : Rat) / 17966088315235317) [(3, 1), (5, 4), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 1338 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1338 : Poly :=
[
  term ((9412538015673267200 : Rat) / 17966088315235317) [(3, 1), (5, 4), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-4706269007836633600 : Rat) / 17966088315235317) [(3, 1), (5, 4), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1338 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1338_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1338
        rs_R010_ueqv_R010YNN_generator_25_1300_1399 =
      rs_R010_ueqv_R010YNN_partial_25_1338 := by
  native_decide

/-- Coefficient term 1339 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1339 : Poly :=
[
  term (-4 : Rat) [(3, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1339 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1339 : Poly :=
[
  term (4 : Rat) [(3, 1), (12, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(3, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1339 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1339_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1339
        rs_R010_ueqv_R010YNN_generator_25_1300_1399 =
      rs_R010_ueqv_R010YNN_partial_25_1339 := by
  native_decide

/-- Coefficient term 1340 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1340 : Poly :=
[
  term (8 : Rat) [(3, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1340 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1340 : Poly :=
[
  term (16 : Rat) [(3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(3, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1340 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1340_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1340
        rs_R010_ueqv_R010YNN_generator_25_1300_1399 =
      rs_R010_ueqv_R010YNN_partial_25_1340 := by
  native_decide

/-- Coefficient term 1341 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1341 : Poly :=
[
  term (2 : Rat) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 1341 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1341 : Poly :=
[
  term (4 : Rat) [(3, 1), (12, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(3, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1341 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1341_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1341
        rs_R010_ueqv_R010YNN_generator_25_1300_1399 =
      rs_R010_ueqv_R010YNN_partial_25_1341 := by
  native_decide

/-- Coefficient term 1342 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1342 : Poly :=
[
  term ((-157900501949335040 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1342 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1342 : Poly :=
[
  term ((-315801003898670080 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((157900501949335040 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1342 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1342_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1342
        rs_R010_ueqv_R010YNN_generator_25_1300_1399 =
      rs_R010_ueqv_R010YNN_partial_25_1342 := by
  native_decide

/-- Coefficient term 1343 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1343 : Poly :=
[
  term ((-34813341908172800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 1), (11, 2), (16, 1)]
]

/-- Partial product 1343 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1343 : Poly :=
[
  term ((-69626683816345600 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 1), (11, 2), (12, 1), (16, 1)],
  term ((34813341908172800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1343 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1343_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1343
        rs_R010_ueqv_R010YNN_generator_25_1300_1399 =
      rs_R010_ueqv_R010YNN_partial_25_1343 := by
  native_decide

/-- Coefficient term 1344 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1344 : Poly :=
[
  term ((197502913207570024 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 1), (16, 1)]
]

/-- Partial product 1344 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1344 : Poly :=
[
  term ((395005826415140048 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 1), (12, 1), (16, 1)],
  term ((-197502913207570024 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1344 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1344_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1344
        rs_R010_ueqv_R010YNN_generator_25_1300_1399 =
      rs_R010_ueqv_R010YNN_partial_25_1344 := by
  native_decide

/-- Coefficient term 1345 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1345 : Poly :=
[
  term ((95736690247475200 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 1), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 1345 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1345 : Poly :=
[
  term ((191473380494950400 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 1), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((-95736690247475200 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 1), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1345 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1345_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1345
        rs_R010_ueqv_R010YNN_generator_25_1300_1399 =
      rs_R010_ueqv_R010YNN_partial_25_1345 := by
  native_decide

/-- Coefficient term 1346 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1346 : Poly :=
[
  term ((157900501949335040 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 1346 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1346 : Poly :=
[
  term ((315801003898670080 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-157900501949335040 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1346 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1346_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1346
        rs_R010_ueqv_R010YNN_generator_25_1300_1399 =
      rs_R010_ueqv_R010YNN_partial_25_1346 := by
  native_decide

/-- Coefficient term 1347 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1347 : Poly :=
[
  term ((-278506735265382400 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 3), (16, 1)]
]

/-- Partial product 1347 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1347 : Poly :=
[
  term ((-557013470530764800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 3), (12, 1), (16, 1)],
  term ((278506735265382400 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1347 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1347_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1347
        rs_R010_ueqv_R010YNN_generator_25_1300_1399 =
      rs_R010_ueqv_R010YNN_partial_25_1347 := by
  native_decide

/-- Coefficient term 1348 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1348 : Poly :=
[
  term ((-501864870846469474 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (11, 1), (16, 1)]
]

/-- Partial product 1348 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1348 : Poly :=
[
  term ((-1003729741692938948 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (11, 1), (12, 1), (16, 1)],
  term ((501864870846469474 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1348 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1348_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1348
        rs_R010_ueqv_R010YNN_generator_25_1300_1399 =
      rs_R010_ueqv_R010YNN_partial_25_1348 := by
  native_decide

/-- Coefficient term 1349 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1349 : Poly :=
[
  term ((43015651415744000 : Rat) / 17966088315235317) [(4, 1), (5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 1349 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1349 : Poly :=
[
  term ((86031302831488000 : Rat) / 17966088315235317) [(4, 1), (5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-43015651415744000 : Rat) / 17966088315235317) [(4, 1), (5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1349 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1349_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1349
        rs_R010_ueqv_R010YNN_generator_25_1300_1399 =
      rs_R010_ueqv_R010YNN_partial_25_1349 := by
  native_decide

/-- Coefficient term 1350 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1350 : Poly :=
[
  term ((78950250974667520 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 1350 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1350 : Poly :=
[
  term ((157900501949335040 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-78950250974667520 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1350 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1350_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1350
        rs_R010_ueqv_R010YNN_generator_25_1300_1399 =
      rs_R010_ueqv_R010YNN_partial_25_1350 := by
  native_decide

/-- Coefficient term 1351 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1351 : Poly :=
[
  term ((53805300728811520 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 1), (8, 1), (9, 2), (16, 1)]
]

/-- Partial product 1351 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1351 : Poly :=
[
  term ((107610601457623040 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 1), (8, 1), (9, 2), (12, 1), (16, 1)],
  term ((-53805300728811520 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 1), (8, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1351 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1351_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1351
        rs_R010_ueqv_R010YNN_generator_25_1300_1399 =
      rs_R010_ueqv_R010YNN_partial_25_1351 := by
  native_decide

/-- Coefficient term 1352 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1352 : Poly :=
[
  term ((54089442643181184454 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (7, 1), (8, 1), (16, 1)]
]

/-- Partial product 1352 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1352 : Poly :=
[
  term ((108178885286362368908 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (7, 1), (8, 1), (12, 1), (16, 1)],
  term ((-54089442643181184454 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (7, 1), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1352 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1352_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1352
        rs_R010_ueqv_R010YNN_generator_25_1300_1399 =
      rs_R010_ueqv_R010YNN_partial_25_1352 := by
  native_decide

/-- Coefficient term 1353 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1353 : Poly :=
[
  term ((-20140774123276800 : Rat) / 5988696105078439) [(4, 1), (5, 1), (7, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 1353 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1353 : Poly :=
[
  term ((-40281548246553600 : Rat) / 5988696105078439) [(4, 1), (5, 1), (7, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((20140774123276800 : Rat) / 5988696105078439) [(4, 1), (5, 1), (7, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1353 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1353_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1353
        rs_R010_ueqv_R010YNN_generator_25_1300_1399 =
      rs_R010_ueqv_R010YNN_partial_25_1353 := by
  native_decide

/-- Coefficient term 1354 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1354 : Poly :=
[
  term ((275324410686073549124 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 1354 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1354 : Poly :=
[
  term ((550648821372147098248 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-275324410686073549124 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1354 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1354_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1354
        rs_R010_ueqv_R010YNN_generator_25_1300_1399 =
      rs_R010_ueqv_R010YNN_partial_25_1354 := by
  native_decide

/-- Coefficient term 1355 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1355 : Poly :=
[
  term ((16404619015142400 : Rat) / 5988696105078439) [(4, 1), (5, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1355 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1355 : Poly :=
[
  term ((32809238030284800 : Rat) / 5988696105078439) [(4, 1), (5, 1), (7, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-16404619015142400 : Rat) / 5988696105078439) [(4, 1), (5, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1355 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1355_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1355
        rs_R010_ueqv_R010YNN_generator_25_1300_1399 =
      rs_R010_ueqv_R010YNN_partial_25_1355 := by
  native_decide

/-- Coefficient term 1356 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1356 : Poly :=
[
  term ((-789502509746675200 : Rat) / 17966088315235317) [(4, 1), (5, 1), (7, 1), (9, 2), (15, 2), (16, 1)]
]

/-- Partial product 1356 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1356 : Poly :=
[
  term ((-1579005019493350400 : Rat) / 17966088315235317) [(4, 1), (5, 1), (7, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((789502509746675200 : Rat) / 17966088315235317) [(4, 1), (5, 1), (7, 1), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1356 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1356_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1356
        rs_R010_ueqv_R010YNN_generator_25_1300_1399 =
      rs_R010_ueqv_R010YNN_partial_25_1356 := by
  native_decide

/-- Coefficient term 1357 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1357 : Poly :=
[
  term ((102854737857966080 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 1), (9, 2), (16, 1)]
]

/-- Partial product 1357 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1357 : Poly :=
[
  term ((205709475715932160 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 1), (9, 2), (12, 1), (16, 1)],
  term ((-102854737857966080 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1357 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1357_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1357
        rs_R010_ueqv_R010YNN_generator_25_1300_1399 =
      rs_R010_ueqv_R010YNN_partial_25_1357 := by
  native_decide

/-- Coefficient term 1358 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1358 : Poly :=
[
  term ((525370704355696640 : Rat) / 17966088315235317) [(4, 1), (5, 1), (7, 1), (9, 3), (15, 1), (16, 1)]
]

/-- Partial product 1358 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1358 : Poly :=
[
  term ((1050741408711393280 : Rat) / 17966088315235317) [(4, 1), (5, 1), (7, 1), (9, 3), (12, 1), (15, 1), (16, 1)],
  term ((-525370704355696640 : Rat) / 17966088315235317) [(4, 1), (5, 1), (7, 1), (9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1358 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1358_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1358
        rs_R010_ueqv_R010YNN_generator_25_1300_1399 =
      rs_R010_ueqv_R010YNN_partial_25_1358 := by
  native_decide

/-- Coefficient term 1359 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1359 : Poly :=
[
  term ((653580947326739038 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 1), (10, 1), (16, 1)]
]

/-- Partial product 1359 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1359 : Poly :=
[
  term ((1307161894653478076 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 1), (10, 1), (12, 1), (16, 1)],
  term ((-653580947326739038 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1359 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1359_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1359
        rs_R010_ueqv_R010YNN_generator_25_1300_1399 =
      rs_R010_ueqv_R010YNN_partial_25_1359 := by
  native_decide

/-- Coefficient term 1360 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1360 : Poly :=
[
  term ((-25750420151416369018 : Rat) / 449152207880882925) [(4, 1), (5, 1), (7, 1), (16, 1)]
]

/-- Partial product 1360 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1360 : Poly :=
[
  term ((-51500840302832738036 : Rat) / 449152207880882925) [(4, 1), (5, 1), (7, 1), (12, 1), (16, 1)],
  term ((25750420151416369018 : Rat) / 449152207880882925) [(4, 1), (5, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1360 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1360_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1360
        rs_R010_ueqv_R010YNN_generator_25_1300_1399 =
      rs_R010_ueqv_R010YNN_partial_25_1360 := by
  native_decide

/-- Coefficient term 1361 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1361 : Poly :=
[
  term ((-3601397804737080320 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1361 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1361 : Poly :=
[
  term ((-7202795609474160640 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((3601397804737080320 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1361 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1361_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1361
        rs_R010_ueqv_R010YNN_generator_25_1300_1399 =
      rs_R010_ueqv_R010YNN_partial_25_1361 := by
  native_decide

/-- Coefficient term 1362 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1362 : Poly :=
[
  term ((14108298115340800 : Rat) / 17966088315235317) [(4, 1), (5, 1), (8, 1), (9, 1), (11, 2), (16, 1)]
]

/-- Partial product 1362 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1362 : Poly :=
[
  term ((28216596230681600 : Rat) / 17966088315235317) [(4, 1), (5, 1), (8, 1), (9, 1), (11, 2), (12, 1), (16, 1)],
  term ((-14108298115340800 : Rat) / 17966088315235317) [(4, 1), (5, 1), (8, 1), (9, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1362 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1362_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1362
        rs_R010_ueqv_R010YNN_generator_25_1300_1399 =
      rs_R010_ueqv_R010YNN_partial_25_1362 := by
  native_decide

/-- Coefficient term 1363 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1363 : Poly :=
[
  term ((-434226380360671360 : Rat) / 17966088315235317) [(4, 1), (5, 1), (8, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 1363 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1363 : Poly :=
[
  term ((-868452760721342720 : Rat) / 17966088315235317) [(4, 1), (5, 1), (8, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((434226380360671360 : Rat) / 17966088315235317) [(4, 1), (5, 1), (8, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1363 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1363_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1363
        rs_R010_ueqv_R010YNN_generator_25_1300_1399 =
      rs_R010_ueqv_R010YNN_partial_25_1363 := by
  native_decide

/-- Coefficient term 1364 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1364 : Poly :=
[
  term ((-319753838178160960 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 1364 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1364 : Poly :=
[
  term ((-639507676356321920 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 1), (9, 1), (12, 1), (16, 1)],
  term ((319753838178160960 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1364 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1364_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1364
        rs_R010_ueqv_R010YNN_generator_25_1300_1399 =
      rs_R010_ueqv_R010YNN_partial_25_1364 := by
  native_decide

/-- Coefficient term 1365 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1365 : Poly :=
[
  term ((-547256325277204480 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 1), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 1365 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1365 : Poly :=
[
  term ((-1094512650554408960 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 1), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((547256325277204480 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 1), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1365 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1365_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1365
        rs_R010_ueqv_R010YNN_generator_25_1300_1399 =
      rs_R010_ueqv_R010YNN_partial_25_1365 := by
  native_decide

/-- Coefficient term 1366 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1366 : Poly :=
[
  term ((-2603240659710960640 : Rat) / 17966088315235317) [(4, 1), (5, 1), (8, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 1366 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1366 : Poly :=
[
  term ((-5206481319421921280 : Rat) / 17966088315235317) [(4, 1), (5, 1), (8, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((2603240659710960640 : Rat) / 17966088315235317) [(4, 1), (5, 1), (8, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1366 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1366_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1366
        rs_R010_ueqv_R010YNN_generator_25_1300_1399 =
      rs_R010_ueqv_R010YNN_partial_25_1366 := by
  native_decide

/-- Coefficient term 1367 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1367 : Poly :=
[
  term ((2073473227303986622 : Rat) / 269491324728529755) [(4, 1), (5, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 1367 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1367 : Poly :=
[
  term ((4146946454607973244 : Rat) / 269491324728529755) [(4, 1), (5, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((-2073473227303986622 : Rat) / 269491324728529755) [(4, 1), (5, 1), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1367 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1367_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1367
        rs_R010_ueqv_R010YNN_generator_25_1300_1399 =
      rs_R010_ueqv_R010YNN_partial_25_1367 := by
  native_decide

/-- Coefficient term 1368 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1368 : Poly :=
[
  term ((-263626917938296795372 : Rat) / 149717402626960975) [(4, 1), (5, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 1368 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1368 : Poly :=
[
  term ((-527253835876593590744 : Rat) / 149717402626960975) [(4, 1), (5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((263626917938296795372 : Rat) / 149717402626960975) [(4, 1), (5, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1368 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1368_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1368
        rs_R010_ueqv_R010YNN_generator_25_1300_1399 =
      rs_R010_ueqv_R010YNN_partial_25_1368 := by
  native_decide

/-- Coefficient term 1369 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1369 : Poly :=
[
  term ((-33705759814361600 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 1369 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1369 : Poly :=
[
  term ((-67411519628723200 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((33705759814361600 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1369 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1369_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1369
        rs_R010_ueqv_R010YNN_generator_25_1300_1399 =
      rs_R010_ueqv_R010YNN_partial_25_1369 := by
  native_decide

/-- Coefficient term 1370 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1370 : Poly :=
[
  term ((107521249787123200 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1370 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1370 : Poly :=
[
  term ((215042499574246400 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-107521249787123200 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1370 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1370_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1370
        rs_R010_ueqv_R010YNN_generator_25_1300_1399 =
      rs_R010_ueqv_R010YNN_partial_25_1370 := by
  native_decide

/-- Coefficient term 1371 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1371 : Poly :=
[
  term ((2114322739200 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 1), (10, 1), (11, 2), (16, 1)]
]

/-- Partial product 1371 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1371 : Poly :=
[
  term ((4228645478400 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 1), (10, 1), (11, 2), (12, 1), (16, 1)],
  term ((-2114322739200 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 1), (10, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1371 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1371_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1371
        rs_R010_ueqv_R010YNN_generator_25_1300_1399 =
      rs_R010_ueqv_R010YNN_partial_25_1371 := by
  native_decide

/-- Coefficient term 1372 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1372 : Poly :=
[
  term ((50499591809568681826 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 1372 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1372 : Poly :=
[
  term ((100999183619137363652 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((-50499591809568681826 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (9, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1372 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1372_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1372
        rs_R010_ueqv_R010YNN_generator_25_1300_1399 =
      rs_R010_ueqv_R010YNN_partial_25_1372 := by
  native_decide

/-- Coefficient term 1373 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1373 : Poly :=
[
  term ((-3388955906470400 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1373 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1373 : Poly :=
[
  term ((-6777911812940800 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((3388955906470400 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1373 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1373_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1373
        rs_R010_ueqv_R010YNN_generator_25_1300_1399 =
      rs_R010_ueqv_R010YNN_partial_25_1373 := by
  native_decide

/-- Coefficient term 1374 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1374 : Poly :=
[
  term ((-27295446502105600 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1374 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1374 : Poly :=
[
  term ((-54590893004211200 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((27295446502105600 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1374 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1374_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1374
        rs_R010_ueqv_R010YNN_generator_25_1300_1399 =
      rs_R010_ueqv_R010YNN_partial_25_1374 := by
  native_decide

/-- Coefficient term 1375 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1375 : Poly :=
[
  term ((3171136473519271040 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1375 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1375 : Poly :=
[
  term ((6342272947038542080 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3171136473519271040 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1375 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1375_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1375
        rs_R010_ueqv_R010YNN_generator_25_1300_1399 =
      rs_R010_ueqv_R010YNN_partial_25_1375 := by
  native_decide

/-- Coefficient term 1376 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1376 : Poly :=
[
  term ((-25387534520320000 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 2), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1376 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1376 : Poly :=
[
  term ((25387534520320000 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((-50775069040640000 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 2), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1376 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1376_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1376
        rs_R010_ueqv_R010YNN_generator_25_1300_1399 =
      rs_R010_ueqv_R010YNN_partial_25_1376 := by
  native_decide

/-- Coefficient term 1377 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1377 : Poly :=
[
  term ((33724788719014400 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 2), (12, 1), (16, 1)]
]

/-- Partial product 1377 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1377 : Poly :=
[
  term ((-33724788719014400 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 2), (12, 1), (16, 1)],
  term ((67449577438028800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 2), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1377 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1377_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1377
        rs_R010_ueqv_R010YNN_generator_25_1300_1399 =
      rs_R010_ueqv_R010YNN_partial_25_1377 := by
  native_decide

/-- Coefficient term 1378 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1378 : Poly :=
[
  term ((25387534520320000 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1378 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1378 : Poly :=
[
  term ((50775069040640000 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-25387534520320000 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1378 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1378_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1378
        rs_R010_ueqv_R010YNN_generator_25_1300_1399 =
      rs_R010_ueqv_R010YNN_partial_25_1378 := by
  native_decide

/-- Coefficient term 1379 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1379 : Poly :=
[
  term ((12693767260160000 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1379 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1379 : Poly :=
[
  term ((25387534520320000 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-12693767260160000 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1379 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1379_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1379
        rs_R010_ueqv_R010YNN_generator_25_1300_1399 =
      rs_R010_ueqv_R010YNN_partial_25_1379 := by
  native_decide

/-- Coefficient term 1380 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1380 : Poly :=
[
  term ((12693767260160000 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 2), (14, 1), (16, 1)]
]

/-- Partial product 1380 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1380 : Poly :=
[
  term ((25387534520320000 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-12693767260160000 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1380 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1380_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1380
        rs_R010_ueqv_R010YNN_generator_25_1300_1399 =
      rs_R010_ueqv_R010YNN_partial_25_1380 := by
  native_decide

/-- Coefficient term 1381 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1381 : Poly :=
[
  term ((-12693767260160000 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 2), (15, 2), (16, 1)]
]

/-- Partial product 1381 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1381 : Poly :=
[
  term ((-25387534520320000 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((12693767260160000 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1381 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1381_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1381
        rs_R010_ueqv_R010YNN_generator_25_1300_1399 =
      rs_R010_ueqv_R010YNN_partial_25_1381 := by
  native_decide

/-- Coefficient term 1382 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1382 : Poly :=
[
  term ((-182538595197683200 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 2), (16, 1)]
]

/-- Partial product 1382 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1382 : Poly :=
[
  term ((-365077190395366400 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 2), (12, 1), (16, 1)],
  term ((182538595197683200 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1382 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1382_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1382
        rs_R010_ueqv_R010YNN_generator_25_1300_1399 =
      rs_R010_ueqv_R010YNN_partial_25_1382 := by
  native_decide

/-- Coefficient term 1383 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1383 : Poly :=
[
  term ((-125384932858721492512 : Rat) / 269491324728529755) [(4, 1), (5, 1), (9, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1383 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1383 : Poly :=
[
  term ((125384932858721492512 : Rat) / 269491324728529755) [(4, 1), (5, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-250769865717442985024 : Rat) / 269491324728529755) [(4, 1), (5, 1), (9, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1383 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1383_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1383
        rs_R010_ueqv_R010YNN_generator_25_1300_1399 =
      rs_R010_ueqv_R010YNN_partial_25_1383 := by
  native_decide

/-- Coefficient term 1384 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1384 : Poly :=
[
  term ((125384932858721492512 : Rat) / 269491324728529755) [(4, 1), (5, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1384 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1384 : Poly :=
[
  term ((250769865717442985024 : Rat) / 269491324728529755) [(4, 1), (5, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-125384932858721492512 : Rat) / 269491324728529755) [(4, 1), (5, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1384 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1384_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1384
        rs_R010_ueqv_R010YNN_generator_25_1300_1399 =
      rs_R010_ueqv_R010YNN_partial_25_1384 := by
  native_decide

/-- Coefficient term 1385 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1385 : Poly :=
[
  term ((62692466429360746256 : Rat) / 269491324728529755) [(4, 1), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1385 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1385 : Poly :=
[
  term ((125384932858721492512 : Rat) / 269491324728529755) [(4, 1), (5, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-62692466429360746256 : Rat) / 269491324728529755) [(4, 1), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1385 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1385_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1385
        rs_R010_ueqv_R010YNN_generator_25_1300_1399 =
      rs_R010_ueqv_R010YNN_partial_25_1385 := by
  native_decide

/-- Coefficient term 1386 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1386 : Poly :=
[
  term ((842739098357336253736 : Rat) / 4042369870927946325) [(4, 1), (5, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 1386 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1386 : Poly :=
[
  term ((1685478196714672507472 : Rat) / 4042369870927946325) [(4, 1), (5, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-842739098357336253736 : Rat) / 4042369870927946325) [(4, 1), (5, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1386 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1386_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1386
        rs_R010_ueqv_R010YNN_generator_25_1300_1399 =
      rs_R010_ueqv_R010YNN_partial_25_1386 := by
  native_decide

/-- Coefficient term 1387 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1387 : Poly :=
[
  term ((-6329841470410816784 : Rat) / 29943480525392195) [(4, 1), (5, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 1387 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1387 : Poly :=
[
  term ((-12659682940821633568 : Rat) / 29943480525392195) [(4, 1), (5, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((6329841470410816784 : Rat) / 29943480525392195) [(4, 1), (5, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1387 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1387_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1387
        rs_R010_ueqv_R010YNN_generator_25_1300_1399 =
      rs_R010_ueqv_R010YNN_partial_25_1387 := by
  native_decide

/-- Coefficient term 1388 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1388 : Poly :=
[
  term ((1911961484083051676 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (9, 1), (16, 1)]
]

/-- Partial product 1388 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1388 : Poly :=
[
  term ((3823922968166103352 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (9, 1), (12, 1), (16, 1)],
  term ((-1911961484083051676 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1388 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1388_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1388
        rs_R010_ueqv_R010YNN_generator_25_1300_1399 =
      rs_R010_ueqv_R010YNN_partial_25_1388 := by
  native_decide

/-- Coefficient term 1389 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1389 : Poly :=
[
  term ((26119389717137920 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 1389 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1389 : Poly :=
[
  term ((52238779434275840 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-26119389717137920 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1389 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1389_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1389
        rs_R010_ueqv_R010YNN_generator_25_1300_1399 =
      rs_R010_ueqv_R010YNN_partial_25_1389 := by
  native_decide

/-- Coefficient term 1390 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1390 : Poly :=
[
  term ((-6132894591810560 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 1390 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1390 : Poly :=
[
  term ((-12265789183621120 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((6132894591810560 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1390 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1390_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1390
        rs_R010_ueqv_R010YNN_generator_25_1300_1399 =
      rs_R010_ueqv_R010YNN_partial_25_1390 := by
  native_decide

/-- Coefficient term 1391 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1391 : Poly :=
[
  term ((-359842299571256320 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 1391 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1391 : Poly :=
[
  term ((-719684599142512640 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((359842299571256320 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1391 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1391_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1391
        rs_R010_ueqv_R010YNN_generator_25_1300_1399 =
      rs_R010_ueqv_R010YNN_partial_25_1391 := by
  native_decide

/-- Coefficient term 1392 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1392 : Poly :=
[
  term ((1143047210942443520 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (11, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1392 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1392 : Poly :=
[
  term ((-1143047210942443520 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((2286094421884887040 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (11, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1392 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1392_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1392
        rs_R010_ueqv_R010YNN_generator_25_1300_1399 =
      rs_R010_ueqv_R010YNN_partial_25_1392 := by
  native_decide

/-- Coefficient term 1393 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1393 : Poly :=
[
  term ((51214519275745280 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 1393 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1393 : Poly :=
[
  term ((-51214519275745280 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((102429038551490560 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (11, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1393 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1393_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1393
        rs_R010_ueqv_R010YNN_generator_25_1300_1399 =
      rs_R010_ueqv_R010YNN_partial_25_1393 := by
  native_decide

/-- Coefficient term 1394 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1394 : Poly :=
[
  term ((-1143047210942443520 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1394 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1394 : Poly :=
[
  term ((-2286094421884887040 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1143047210942443520 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1394 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1394_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1394
        rs_R010_ueqv_R010YNN_generator_25_1300_1399 =
      rs_R010_ueqv_R010YNN_partial_25_1394 := by
  native_decide

/-- Coefficient term 1395 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1395 : Poly :=
[
  term ((-571523605471221760 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1395 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1395 : Poly :=
[
  term ((-1143047210942443520 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((571523605471221760 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1395 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1395_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1395
        rs_R010_ueqv_R010YNN_generator_25_1300_1399 =
      rs_R010_ueqv_R010YNN_partial_25_1395 := by
  native_decide

/-- Coefficient term 1396 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1396 : Poly :=
[
  term ((-71173322646307840 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 2), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 1396 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1396 : Poly :=
[
  term ((-142346645292615680 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((71173322646307840 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 2), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1396 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1396_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1396
        rs_R010_ueqv_R010YNN_generator_25_1300_1399 =
      rs_R010_ueqv_R010YNN_partial_25_1396 := by
  native_decide

/-- Coefficient term 1397 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1397 : Poly :=
[
  term ((571523605471221760 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 1397 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1397 : Poly :=
[
  term ((1143047210942443520 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-571523605471221760 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1397 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1397_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1397
        rs_R010_ueqv_R010YNN_generator_25_1300_1399 =
      rs_R010_ueqv_R010YNN_partial_25_1397 := by
  native_decide

/-- Coefficient term 1398 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1398 : Poly :=
[
  term ((433668147767733760 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 1398 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1398 : Poly :=
[
  term ((867336295535467520 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((-433668147767733760 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1398 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1398_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1398
        rs_R010_ueqv_R010YNN_generator_25_1300_1399 =
      rs_R010_ueqv_R010YNN_partial_25_1398 := by
  native_decide

/-- Coefficient term 1399 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1399 : Poly :=
[
  term ((-29839280201830400 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1399 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1399 : Poly :=
[
  term ((-59678560403660800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((29839280201830400 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1399 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1399_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1399
        rs_R010_ueqv_R010YNN_generator_25_1300_1399 =
      rs_R010_ueqv_R010YNN_partial_25_1399 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010YNN_partials_25_1300_1399 : List Poly :=
[
  rs_R010_ueqv_R010YNN_partial_25_1300,
  rs_R010_ueqv_R010YNN_partial_25_1301,
  rs_R010_ueqv_R010YNN_partial_25_1302,
  rs_R010_ueqv_R010YNN_partial_25_1303,
  rs_R010_ueqv_R010YNN_partial_25_1304,
  rs_R010_ueqv_R010YNN_partial_25_1305,
  rs_R010_ueqv_R010YNN_partial_25_1306,
  rs_R010_ueqv_R010YNN_partial_25_1307,
  rs_R010_ueqv_R010YNN_partial_25_1308,
  rs_R010_ueqv_R010YNN_partial_25_1309,
  rs_R010_ueqv_R010YNN_partial_25_1310,
  rs_R010_ueqv_R010YNN_partial_25_1311,
  rs_R010_ueqv_R010YNN_partial_25_1312,
  rs_R010_ueqv_R010YNN_partial_25_1313,
  rs_R010_ueqv_R010YNN_partial_25_1314,
  rs_R010_ueqv_R010YNN_partial_25_1315,
  rs_R010_ueqv_R010YNN_partial_25_1316,
  rs_R010_ueqv_R010YNN_partial_25_1317,
  rs_R010_ueqv_R010YNN_partial_25_1318,
  rs_R010_ueqv_R010YNN_partial_25_1319,
  rs_R010_ueqv_R010YNN_partial_25_1320,
  rs_R010_ueqv_R010YNN_partial_25_1321,
  rs_R010_ueqv_R010YNN_partial_25_1322,
  rs_R010_ueqv_R010YNN_partial_25_1323,
  rs_R010_ueqv_R010YNN_partial_25_1324,
  rs_R010_ueqv_R010YNN_partial_25_1325,
  rs_R010_ueqv_R010YNN_partial_25_1326,
  rs_R010_ueqv_R010YNN_partial_25_1327,
  rs_R010_ueqv_R010YNN_partial_25_1328,
  rs_R010_ueqv_R010YNN_partial_25_1329,
  rs_R010_ueqv_R010YNN_partial_25_1330,
  rs_R010_ueqv_R010YNN_partial_25_1331,
  rs_R010_ueqv_R010YNN_partial_25_1332,
  rs_R010_ueqv_R010YNN_partial_25_1333,
  rs_R010_ueqv_R010YNN_partial_25_1334,
  rs_R010_ueqv_R010YNN_partial_25_1335,
  rs_R010_ueqv_R010YNN_partial_25_1336,
  rs_R010_ueqv_R010YNN_partial_25_1337,
  rs_R010_ueqv_R010YNN_partial_25_1338,
  rs_R010_ueqv_R010YNN_partial_25_1339,
  rs_R010_ueqv_R010YNN_partial_25_1340,
  rs_R010_ueqv_R010YNN_partial_25_1341,
  rs_R010_ueqv_R010YNN_partial_25_1342,
  rs_R010_ueqv_R010YNN_partial_25_1343,
  rs_R010_ueqv_R010YNN_partial_25_1344,
  rs_R010_ueqv_R010YNN_partial_25_1345,
  rs_R010_ueqv_R010YNN_partial_25_1346,
  rs_R010_ueqv_R010YNN_partial_25_1347,
  rs_R010_ueqv_R010YNN_partial_25_1348,
  rs_R010_ueqv_R010YNN_partial_25_1349,
  rs_R010_ueqv_R010YNN_partial_25_1350,
  rs_R010_ueqv_R010YNN_partial_25_1351,
  rs_R010_ueqv_R010YNN_partial_25_1352,
  rs_R010_ueqv_R010YNN_partial_25_1353,
  rs_R010_ueqv_R010YNN_partial_25_1354,
  rs_R010_ueqv_R010YNN_partial_25_1355,
  rs_R010_ueqv_R010YNN_partial_25_1356,
  rs_R010_ueqv_R010YNN_partial_25_1357,
  rs_R010_ueqv_R010YNN_partial_25_1358,
  rs_R010_ueqv_R010YNN_partial_25_1359,
  rs_R010_ueqv_R010YNN_partial_25_1360,
  rs_R010_ueqv_R010YNN_partial_25_1361,
  rs_R010_ueqv_R010YNN_partial_25_1362,
  rs_R010_ueqv_R010YNN_partial_25_1363,
  rs_R010_ueqv_R010YNN_partial_25_1364,
  rs_R010_ueqv_R010YNN_partial_25_1365,
  rs_R010_ueqv_R010YNN_partial_25_1366,
  rs_R010_ueqv_R010YNN_partial_25_1367,
  rs_R010_ueqv_R010YNN_partial_25_1368,
  rs_R010_ueqv_R010YNN_partial_25_1369,
  rs_R010_ueqv_R010YNN_partial_25_1370,
  rs_R010_ueqv_R010YNN_partial_25_1371,
  rs_R010_ueqv_R010YNN_partial_25_1372,
  rs_R010_ueqv_R010YNN_partial_25_1373,
  rs_R010_ueqv_R010YNN_partial_25_1374,
  rs_R010_ueqv_R010YNN_partial_25_1375,
  rs_R010_ueqv_R010YNN_partial_25_1376,
  rs_R010_ueqv_R010YNN_partial_25_1377,
  rs_R010_ueqv_R010YNN_partial_25_1378,
  rs_R010_ueqv_R010YNN_partial_25_1379,
  rs_R010_ueqv_R010YNN_partial_25_1380,
  rs_R010_ueqv_R010YNN_partial_25_1381,
  rs_R010_ueqv_R010YNN_partial_25_1382,
  rs_R010_ueqv_R010YNN_partial_25_1383,
  rs_R010_ueqv_R010YNN_partial_25_1384,
  rs_R010_ueqv_R010YNN_partial_25_1385,
  rs_R010_ueqv_R010YNN_partial_25_1386,
  rs_R010_ueqv_R010YNN_partial_25_1387,
  rs_R010_ueqv_R010YNN_partial_25_1388,
  rs_R010_ueqv_R010YNN_partial_25_1389,
  rs_R010_ueqv_R010YNN_partial_25_1390,
  rs_R010_ueqv_R010YNN_partial_25_1391,
  rs_R010_ueqv_R010YNN_partial_25_1392,
  rs_R010_ueqv_R010YNN_partial_25_1393,
  rs_R010_ueqv_R010YNN_partial_25_1394,
  rs_R010_ueqv_R010YNN_partial_25_1395,
  rs_R010_ueqv_R010YNN_partial_25_1396,
  rs_R010_ueqv_R010YNN_partial_25_1397,
  rs_R010_ueqv_R010YNN_partial_25_1398,
  rs_R010_ueqv_R010YNN_partial_25_1399
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010YNN_block_25_1300_1399 : Poly :=
[
  term ((-145754660370649977856 : Rat) / 269491324728529755) [(3, 1), (5, 3), (8, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-72877330185324988928 : Rat) / 269491324728529755) [(3, 1), (5, 3), (8, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((72877330185324988928 : Rat) / 269491324728529755) [(3, 1), (5, 3), (8, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((72877330185324988928 : Rat) / 269491324728529755) [(3, 1), (5, 3), (8, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((18219332546331247232 : Rat) / 269491324728529755) [(3, 1), (5, 3), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-906527399610261434368 : Rat) / 53898264945705951) [(3, 1), (5, 3), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-453263699805130717184 : Rat) / 53898264945705951) [(3, 1), (5, 3), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((453263699805130717184 : Rat) / 53898264945705951) [(3, 1), (5, 3), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((453263699805130717184 : Rat) / 53898264945705951) [(3, 1), (5, 3), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((113315924951282679296 : Rat) / 53898264945705951) [(3, 1), (5, 3), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-46142183411828027392 : Rat) / 89830441576176585) [(3, 1), (5, 3), (8, 1), (9, 2), (12, 1), (14, 1), (16, 1)],
  term ((-23071091705914013696 : Rat) / 89830441576176585) [(3, 1), (5, 3), (8, 1), (9, 2), (12, 1), (16, 1)],
  term ((23071091705914013696 : Rat) / 89830441576176585) [(3, 1), (5, 3), (8, 1), (9, 2), (12, 2), (16, 1)],
  term ((23071091705914013696 : Rat) / 89830441576176585) [(3, 1), (5, 3), (8, 1), (9, 2), (14, 1), (16, 1)],
  term ((5767772926478503424 : Rat) / 89830441576176585) [(3, 1), (5, 3), (8, 1), (9, 2), (16, 1)],
  term ((16443216260964144640 : Rat) / 53898264945705951) [(3, 1), (5, 3), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((8221608130482072320 : Rat) / 53898264945705951) [(3, 1), (5, 3), (8, 1), (12, 1), (16, 1)],
  term ((-8221608130482072320 : Rat) / 53898264945705951) [(3, 1), (5, 3), (8, 1), (12, 2), (16, 1)],
  term ((-8221608130482072320 : Rat) / 53898264945705951) [(3, 1), (5, 3), (8, 1), (14, 1), (16, 1)],
  term ((-2055402032620518080 : Rat) / 53898264945705951) [(3, 1), (5, 3), (8, 1), (16, 1)],
  term ((7998540966772494336 : Rat) / 29943480525392195) [(3, 1), (5, 3), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((3999270483386247168 : Rat) / 29943480525392195) [(3, 1), (5, 3), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-3999270483386247168 : Rat) / 29943480525392195) [(3, 1), (5, 3), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((-3999270483386247168 : Rat) / 29943480525392195) [(3, 1), (5, 3), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-999817620846561792 : Rat) / 29943480525392195) [(3, 1), (5, 3), (9, 1), (11, 1), (16, 1)],
  term ((1694572729772558058112 : Rat) / 269491324728529755) [(3, 1), (5, 3), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((847286364886279029056 : Rat) / 269491324728529755) [(3, 1), (5, 3), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-847286364886279029056 : Rat) / 269491324728529755) [(3, 1), (5, 3), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-847286364886279029056 : Rat) / 269491324728529755) [(3, 1), (5, 3), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-211821591221569757264 : Rat) / 269491324728529755) [(3, 1), (5, 3), (9, 1), (15, 1), (16, 1)],
  term ((111642484631901977600 : Rat) / 53898264945705951) [(3, 1), (5, 3), (9, 2), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((41702435292441088000 : Rat) / 53898264945705951) [(3, 1), (5, 3), (9, 2), (10, 1), (12, 1), (16, 1)],
  term ((-55821242315950988800 : Rat) / 53898264945705951) [(3, 1), (5, 3), (9, 2), (10, 1), (12, 2), (16, 1)],
  term ((-55821242315950988800 : Rat) / 53898264945705951) [(3, 1), (5, 3), (9, 2), (10, 1), (14, 1), (16, 1)],
  term ((-6895907067232796800 : Rat) / 53898264945705951) [(3, 1), (5, 3), (9, 2), (10, 1), (16, 1)],
  term ((-1902887332950016000 : Rat) / 17966088315235317) [(3, 1), (5, 3), (9, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-951443666475008000 : Rat) / 17966088315235317) [(3, 1), (5, 3), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((951443666475008000 : Rat) / 17966088315235317) [(3, 1), (5, 3), (9, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((951443666475008000 : Rat) / 17966088315235317) [(3, 1), (5, 3), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((237860916618752000 : Rat) / 17966088315235317) [(3, 1), (5, 3), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-37650152062693068800 : Rat) / 17966088315235317) [(3, 1), (5, 3), (9, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((75757434980139218944 : Rat) / 53898264945705951) [(3, 1), (5, 3), (9, 2), (12, 1), (14, 1), (16, 1)],
  term ((-18825076031346534400 : Rat) / 17966088315235317) [(3, 1), (5, 3), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((37878717490069609472 : Rat) / 53898264945705951) [(3, 1), (5, 3), (9, 2), (12, 1), (16, 1)],
  term ((18825076031346534400 : Rat) / 17966088315235317) [(3, 1), (5, 3), (9, 2), (12, 2), (15, 2), (16, 1)],
  term ((-37878717490069609472 : Rat) / 53898264945705951) [(3, 1), (5, 3), (9, 2), (12, 2), (16, 1)],
  term ((18825076031346534400 : Rat) / 17966088315235317) [(3, 1), (5, 3), (9, 2), (14, 1), (15, 2), (16, 1)],
  term ((-37878717490069609472 : Rat) / 53898264945705951) [(3, 1), (5, 3), (9, 2), (14, 1), (16, 1)],
  term ((4706269007836633600 : Rat) / 17966088315235317) [(3, 1), (5, 3), (9, 2), (15, 2), (16, 1)],
  term ((-9469679372517402368 : Rat) / 53898264945705951) [(3, 1), (5, 3), (9, 2), (16, 1)],
  term ((-1090336610156299902976 : Rat) / 89830441576176585) [(3, 1), (5, 3), (9, 3), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-545168305078149951488 : Rat) / 89830441576176585) [(3, 1), (5, 3), (9, 3), (12, 1), (15, 1), (16, 1)],
  term ((545168305078149951488 : Rat) / 89830441576176585) [(3, 1), (5, 3), (9, 3), (12, 2), (15, 1), (16, 1)],
  term ((545168305078149951488 : Rat) / 89830441576176585) [(3, 1), (5, 3), (9, 3), (14, 1), (15, 1), (16, 1)],
  term ((136292076269537487872 : Rat) / 89830441576176585) [(3, 1), (5, 3), (9, 3), (15, 1), (16, 1)],
  term ((-15176235140919907840 : Rat) / 53898264945705951) [(3, 1), (5, 3), (12, 1), (14, 1), (16, 1)],
  term ((-7588117570459953920 : Rat) / 53898264945705951) [(3, 1), (5, 3), (12, 1), (16, 1)],
  term ((7588117570459953920 : Rat) / 53898264945705951) [(3, 1), (5, 3), (12, 2), (16, 1)],
  term ((7588117570459953920 : Rat) / 53898264945705951) [(3, 1), (5, 3), (14, 1), (16, 1)],
  term ((1897029392614988480 : Rat) / 53898264945705951) [(3, 1), (5, 3), (16, 1)],
  term ((37650152062693068800 : Rat) / 17966088315235317) [(3, 1), (5, 4), (9, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((18825076031346534400 : Rat) / 17966088315235317) [(3, 1), (5, 4), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-18825076031346534400 : Rat) / 17966088315235317) [(3, 1), (5, 4), (9, 2), (12, 2), (15, 1), (16, 1)],
  term ((-18825076031346534400 : Rat) / 17966088315235317) [(3, 1), (5, 4), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-4706269007836633600 : Rat) / 17966088315235317) [(3, 1), (5, 4), (9, 2), (15, 1), (16, 1)],
  term (16 : Rat) [(3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(3, 1), (12, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(3, 1), (12, 2), (15, 1), (16, 1)],
  term (-8 : Rat) [(3, 1), (14, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(3, 1), (15, 1), (16, 1)],
  term ((-315801003898670080 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((157900501949335040 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-69626683816345600 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 1), (11, 2), (12, 1), (16, 1)],
  term ((34813341908172800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 1), (11, 2), (16, 1)],
  term ((395005826415140048 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 1), (12, 1), (16, 1)],
  term ((-197502913207570024 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((191473380494950400 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 1), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((-95736690247475200 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 1), (9, 2), (11, 1), (16, 1)],
  term ((315801003898670080 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-157900501949335040 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((-557013470530764800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 3), (12, 1), (16, 1)],
  term ((278506735265382400 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 3), (16, 1)],
  term ((-1003729741692938948 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (11, 1), (12, 1), (16, 1)],
  term ((501864870846469474 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((86031302831488000 : Rat) / 17966088315235317) [(4, 1), (5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-43015651415744000 : Rat) / 17966088315235317) [(4, 1), (5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((157900501949335040 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-78950250974667520 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((107610601457623040 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 1), (8, 1), (9, 2), (12, 1), (16, 1)],
  term ((-53805300728811520 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 1), (8, 1), (9, 2), (16, 1)],
  term ((108178885286362368908 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (7, 1), (8, 1), (12, 1), (16, 1)],
  term ((-54089442643181184454 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (7, 1), (8, 1), (16, 1)],
  term ((-40281548246553600 : Rat) / 5988696105078439) [(4, 1), (5, 1), (7, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((20140774123276800 : Rat) / 5988696105078439) [(4, 1), (5, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((550648821372147098248 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-275324410686073549124 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((32809238030284800 : Rat) / 5988696105078439) [(4, 1), (5, 1), (7, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-16404619015142400 : Rat) / 5988696105078439) [(4, 1), (5, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1579005019493350400 : Rat) / 17966088315235317) [(4, 1), (5, 1), (7, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((205709475715932160 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 1), (9, 2), (12, 1), (16, 1)],
  term ((789502509746675200 : Rat) / 17966088315235317) [(4, 1), (5, 1), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((-102854737857966080 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 1), (9, 2), (16, 1)],
  term ((1050741408711393280 : Rat) / 17966088315235317) [(4, 1), (5, 1), (7, 1), (9, 3), (12, 1), (15, 1), (16, 1)],
  term ((-525370704355696640 : Rat) / 17966088315235317) [(4, 1), (5, 1), (7, 1), (9, 3), (15, 1), (16, 1)],
  term ((1307161894653478076 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 1), (10, 1), (12, 1), (16, 1)],
  term ((-653580947326739038 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 1), (10, 1), (16, 1)],
  term ((-51500840302832738036 : Rat) / 449152207880882925) [(4, 1), (5, 1), (7, 1), (12, 1), (16, 1)],
  term ((25750420151416369018 : Rat) / 449152207880882925) [(4, 1), (5, 1), (7, 1), (16, 1)],
  term ((-7202795609474160640 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((3601397804737080320 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((28216596230681600 : Rat) / 17966088315235317) [(4, 1), (5, 1), (8, 1), (9, 1), (11, 2), (12, 1), (16, 1)],
  term ((-14108298115340800 : Rat) / 17966088315235317) [(4, 1), (5, 1), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((-868452760721342720 : Rat) / 17966088315235317) [(4, 1), (5, 1), (8, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-639507676356321920 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 1), (9, 1), (12, 1), (16, 1)],
  term ((434226380360671360 : Rat) / 17966088315235317) [(4, 1), (5, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((319753838178160960 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 1), (9, 1), (16, 1)],
  term ((-1094512650554408960 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 1), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((547256325277204480 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((-5206481319421921280 : Rat) / 17966088315235317) [(4, 1), (5, 1), (8, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((2603240659710960640 : Rat) / 17966088315235317) [(4, 1), (5, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((4146946454607973244 : Rat) / 269491324728529755) [(4, 1), (5, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((-2073473227303986622 : Rat) / 269491324728529755) [(4, 1), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((-527253835876593590744 : Rat) / 149717402626960975) [(4, 1), (5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((263626917938296795372 : Rat) / 149717402626960975) [(4, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-67411519628723200 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((215042499574246400 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((33705759814361600 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-107521249787123200 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((4228645478400 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 1), (10, 1), (11, 2), (12, 1), (16, 1)],
  term ((-2114322739200 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 1), (10, 1), (11, 2), (16, 1)],
  term ((100999183619137363652 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((-50499591809568681826 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (9, 1), (10, 1), (16, 1)],
  term ((-6777911812940800 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-54590893004211200 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((6342272947038542080 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((3388955906470400 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((27295446502105600 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3171136473519271040 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((50775069040640000 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((25387534520320000 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((25387534520320000 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-398801979114380800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 2), (12, 1), (16, 1)],
  term ((-50775069040640000 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 2), (12, 2), (15, 2), (16, 1)],
  term ((67449577438028800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 2), (12, 2), (16, 1)],
  term ((-25387534520320000 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12693767260160000 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-12693767260160000 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((12693767260160000 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((182538595197683200 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((250769865717442985024 : Rat) / 269491324728529755) [(4, 1), (5, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((125384932858721492512 : Rat) / 269491324728529755) [(4, 1), (5, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1685478196714672507472 : Rat) / 4042369870927946325) [(4, 1), (5, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((2289557278265358080 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((3823922968166103352 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (9, 1), (12, 1), (16, 1)],
  term ((-250769865717442985024 : Rat) / 269491324728529755) [(4, 1), (5, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((-125384932858721492512 : Rat) / 269491324728529755) [(4, 1), (5, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-62692466429360746256 : Rat) / 269491324728529755) [(4, 1), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-842739098357336253736 : Rat) / 4042369870927946325) [(4, 1), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((6329841470410816784 : Rat) / 29943480525392195) [(4, 1), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-1911961484083051676 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (9, 1), (16, 1)],
  term ((52238779434275840 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-26119389717137920 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((-12265789183621120 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-719684599142512640 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((6132894591810560 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((359842299571256320 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-2286094421884887040 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1143047210942443520 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-142346645292615680 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((90680197362191360 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((2286094421884887040 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((102429038551490560 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (11, 1), (12, 2), (16, 1)],
  term ((1143047210942443520 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((571523605471221760 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((71173322646307840 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((-571523605471221760 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((-433668147767733760 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((-59678560403660800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((29839280201830400 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 25, terms 1300 through 1399. -/
theorem rs_R010_ueqv_R010YNN_block_25_1300_1399_valid :
    checkProductSumEq rs_R010_ueqv_R010YNN_partials_25_1300_1399
      rs_R010_ueqv_R010YNN_block_25_1300_1399 = true := by
  native_decide

end R010UeqvR010YNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
