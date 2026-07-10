/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009YNNNN, term block 4:300-384

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009YNNNNTermShards

/-- Generator polynomial 4 for relaxed split surplus certificate `R009:u=v:R009YNNNN`. -/
def rs_R009_ueqv_R009YNNNN_generator_04_0300_0384 : Poly :=
[
  term (-2 : Rat) [(4, 1)],
  term (1 : Rat) [(4, 2)],
  term (1 : Rat) [(5, 2)],
  term (2 : Rat) [(12, 1)],
  term (-1 : Rat) [(12, 2)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 300 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0300 : Poly :=
[
  term ((95 : Rat) / 42) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 300 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0300 : Poly :=
[
  term ((-95 : Rat) / 21) [(4, 1), (9, 1), (15, 1), (16, 1)],
  term ((95 : Rat) / 42) [(4, 2), (9, 1), (15, 1), (16, 1)],
  term ((95 : Rat) / 42) [(5, 2), (9, 1), (15, 1), (16, 1)],
  term ((95 : Rat) / 21) [(9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-95 : Rat) / 42) [(9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-95 : Rat) / 42) [(9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 300 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0300_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0300
        rs_R009_ueqv_R009YNNNN_generator_04_0300_0384 =
      rs_R009_ueqv_R009YNNNN_partial_04_0300 := by
  native_decide

/-- Coefficient term 301 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0301 : Poly :=
[
  term ((3366906314273 : Rat) / 59205535956) [(9, 1), (15, 3)]
]

/-- Partial product 301 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0301 : Poly :=
[
  term ((-3366906314273 : Rat) / 29602767978) [(4, 1), (9, 1), (15, 3)],
  term ((3366906314273 : Rat) / 59205535956) [(4, 2), (9, 1), (15, 3)],
  term ((3366906314273 : Rat) / 59205535956) [(5, 2), (9, 1), (15, 3)],
  term ((3366906314273 : Rat) / 29602767978) [(9, 1), (12, 1), (15, 3)],
  term ((-3366906314273 : Rat) / 59205535956) [(9, 1), (12, 2), (15, 3)],
  term ((-3366906314273 : Rat) / 59205535956) [(9, 1), (13, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 301 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0301_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0301
        rs_R009_ueqv_R009YNNNN_generator_04_0300_0384 =
      rs_R009_ueqv_R009YNNNN_partial_04_0301 := by
  native_decide

/-- Coefficient term 302 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0302 : Poly :=
[
  term ((-65 : Rat) / 14) [(9, 1), (15, 3), (16, 1)]
]

/-- Partial product 302 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0302 : Poly :=
[
  term ((65 : Rat) / 7) [(4, 1), (9, 1), (15, 3), (16, 1)],
  term ((-65 : Rat) / 14) [(4, 2), (9, 1), (15, 3), (16, 1)],
  term ((-65 : Rat) / 14) [(5, 2), (9, 1), (15, 3), (16, 1)],
  term ((-65 : Rat) / 7) [(9, 1), (12, 1), (15, 3), (16, 1)],
  term ((65 : Rat) / 14) [(9, 1), (12, 2), (15, 3), (16, 1)],
  term ((65 : Rat) / 14) [(9, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 302 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0302_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0302
        rs_R009_ueqv_R009YNNNN_generator_04_0300_0384 =
      rs_R009_ueqv_R009YNNNN_partial_04_0302 := by
  native_decide

/-- Coefficient term 303 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0303 : Poly :=
[
  term ((-13697682239527 : Rat) / 202990408992) [(9, 2)]
]

/-- Partial product 303 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0303 : Poly :=
[
  term ((13697682239527 : Rat) / 101495204496) [(4, 1), (9, 2)],
  term ((-13697682239527 : Rat) / 202990408992) [(4, 2), (9, 2)],
  term ((-13697682239527 : Rat) / 202990408992) [(5, 2), (9, 2)],
  term ((-13697682239527 : Rat) / 101495204496) [(9, 2), (12, 1)],
  term ((13697682239527 : Rat) / 202990408992) [(9, 2), (12, 2)],
  term ((13697682239527 : Rat) / 202990408992) [(9, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 303 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0303_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0303
        rs_R009_ueqv_R009YNNNN_generator_04_0300_0384 =
      rs_R009_ueqv_R009YNNNN_partial_04_0303 := by
  native_decide

/-- Coefficient term 304 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0304 : Poly :=
[
  term ((-10861008665 : Rat) / 2569498848) [(9, 2), (10, 1)]
]

/-- Partial product 304 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0304 : Poly :=
[
  term ((10861008665 : Rat) / 1284749424) [(4, 1), (9, 2), (10, 1)],
  term ((-10861008665 : Rat) / 2569498848) [(4, 2), (9, 2), (10, 1)],
  term ((-10861008665 : Rat) / 2569498848) [(5, 2), (9, 2), (10, 1)],
  term ((-10861008665 : Rat) / 1284749424) [(9, 2), (10, 1), (12, 1)],
  term ((10861008665 : Rat) / 2569498848) [(9, 2), (10, 1), (12, 2)],
  term ((10861008665 : Rat) / 2569498848) [(9, 2), (10, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 304 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0304_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0304
        rs_R009_ueqv_R009YNNNN_generator_04_0300_0384 =
      rs_R009_ueqv_R009YNNNN_partial_04_0304 := by
  native_decide

/-- Coefficient term 305 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0305 : Poly :=
[
  term ((67338253723 : Rat) / 4496622984) [(9, 2), (10, 1), (12, 1)]
]

/-- Partial product 305 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0305 : Poly :=
[
  term ((-67338253723 : Rat) / 2248311492) [(4, 1), (9, 2), (10, 1), (12, 1)],
  term ((67338253723 : Rat) / 4496622984) [(4, 2), (9, 2), (10, 1), (12, 1)],
  term ((67338253723 : Rat) / 4496622984) [(5, 2), (9, 2), (10, 1), (12, 1)],
  term ((-67338253723 : Rat) / 4496622984) [(9, 2), (10, 1), (12, 1), (13, 2)],
  term ((67338253723 : Rat) / 2248311492) [(9, 2), (10, 1), (12, 2)],
  term ((-67338253723 : Rat) / 4496622984) [(9, 2), (10, 1), (12, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 305 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0305_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0305
        rs_R009_ueqv_R009YNNNN_generator_04_0300_0384 =
      rs_R009_ueqv_R009YNNNN_partial_04_0305 := by
  native_decide

/-- Coefficient term 306 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0306 : Poly :=
[
  term ((-2172201733 : Rat) / 333083184) [(9, 2), (10, 1), (14, 1)]
]

/-- Partial product 306 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0306 : Poly :=
[
  term ((2172201733 : Rat) / 166541592) [(4, 1), (9, 2), (10, 1), (14, 1)],
  term ((-2172201733 : Rat) / 333083184) [(4, 2), (9, 2), (10, 1), (14, 1)],
  term ((-2172201733 : Rat) / 333083184) [(5, 2), (9, 2), (10, 1), (14, 1)],
  term ((-2172201733 : Rat) / 166541592) [(9, 2), (10, 1), (12, 1), (14, 1)],
  term ((2172201733 : Rat) / 333083184) [(9, 2), (10, 1), (12, 2), (14, 1)],
  term ((2172201733 : Rat) / 333083184) [(9, 2), (10, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 306 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0306_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0306
        rs_R009_ueqv_R009YNNNN_generator_04_0300_0384 =
      rs_R009_ueqv_R009YNNNN_partial_04_0306 := by
  native_decide

/-- Coefficient term 307 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0307 : Poly :=
[
  term ((-997316410233 : Rat) / 8771190512) [(9, 2), (12, 1)]
]

/-- Partial product 307 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0307 : Poly :=
[
  term ((997316410233 : Rat) / 4385595256) [(4, 1), (9, 2), (12, 1)],
  term ((-997316410233 : Rat) / 8771190512) [(4, 2), (9, 2), (12, 1)],
  term ((-997316410233 : Rat) / 8771190512) [(5, 2), (9, 2), (12, 1)],
  term ((997316410233 : Rat) / 8771190512) [(9, 2), (12, 1), (13, 2)],
  term ((-997316410233 : Rat) / 4385595256) [(9, 2), (12, 2)],
  term ((997316410233 : Rat) / 8771190512) [(9, 2), (12, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 307 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0307_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0307
        rs_R009_ueqv_R009YNNNN_generator_04_0300_0384 =
      rs_R009_ueqv_R009YNNNN_partial_04_0307 := by
  native_decide

/-- Coefficient term 308 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0308 : Poly :=
[
  term ((656584494318343 : Rat) / 17406427571064) [(9, 2), (14, 1)]
]

/-- Partial product 308 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0308 : Poly :=
[
  term ((-656584494318343 : Rat) / 8703213785532) [(4, 1), (9, 2), (14, 1)],
  term ((656584494318343 : Rat) / 17406427571064) [(4, 2), (9, 2), (14, 1)],
  term ((656584494318343 : Rat) / 17406427571064) [(5, 2), (9, 2), (14, 1)],
  term ((656584494318343 : Rat) / 8703213785532) [(9, 2), (12, 1), (14, 1)],
  term ((-656584494318343 : Rat) / 17406427571064) [(9, 2), (12, 2), (14, 1)],
  term ((-656584494318343 : Rat) / 17406427571064) [(9, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 308 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0308_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0308
        rs_R009_ueqv_R009YNNNN_generator_04_0300_0384 =
      rs_R009_ueqv_R009YNNNN_partial_04_0308 := by
  native_decide

/-- Coefficient term 309 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0309 : Poly :=
[
  term ((210703568101 : Rat) / 5995497312) [(9, 2), (14, 2)]
]

/-- Partial product 309 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0309 : Poly :=
[
  term ((-210703568101 : Rat) / 2997748656) [(4, 1), (9, 2), (14, 2)],
  term ((210703568101 : Rat) / 5995497312) [(4, 2), (9, 2), (14, 2)],
  term ((210703568101 : Rat) / 5995497312) [(5, 2), (9, 2), (14, 2)],
  term ((210703568101 : Rat) / 2997748656) [(9, 2), (12, 1), (14, 2)],
  term ((-210703568101 : Rat) / 5995497312) [(9, 2), (12, 2), (14, 2)],
  term ((-210703568101 : Rat) / 5995497312) [(9, 2), (13, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 309 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0309_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0309
        rs_R009_ueqv_R009YNNNN_generator_04_0300_0384 =
      rs_R009_ueqv_R009YNNNN_partial_04_0309 := by
  native_decide

/-- Coefficient term 310 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0310 : Poly :=
[
  term ((210703568101 : Rat) / 5995497312) [(9, 2), (15, 2)]
]

/-- Partial product 310 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0310 : Poly :=
[
  term ((-210703568101 : Rat) / 2997748656) [(4, 1), (9, 2), (15, 2)],
  term ((210703568101 : Rat) / 5995497312) [(4, 2), (9, 2), (15, 2)],
  term ((210703568101 : Rat) / 5995497312) [(5, 2), (9, 2), (15, 2)],
  term ((210703568101 : Rat) / 2997748656) [(9, 2), (12, 1), (15, 2)],
  term ((-210703568101 : Rat) / 5995497312) [(9, 2), (12, 2), (15, 2)],
  term ((-210703568101 : Rat) / 5995497312) [(9, 2), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 310 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0310_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0310
        rs_R009_ueqv_R009YNNNN_generator_04_0300_0384 =
      rs_R009_ueqv_R009YNNNN_partial_04_0310 := by
  native_decide

/-- Coefficient term 311 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0311 : Poly :=
[
  term ((20 : Rat) / 21) [(10, 1)]
]

/-- Partial product 311 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0311 : Poly :=
[
  term ((-40 : Rat) / 21) [(4, 1), (10, 1)],
  term ((20 : Rat) / 21) [(4, 2), (10, 1)],
  term ((20 : Rat) / 21) [(5, 2), (10, 1)],
  term ((40 : Rat) / 21) [(10, 1), (12, 1)],
  term ((-20 : Rat) / 21) [(10, 1), (12, 2)],
  term ((-20 : Rat) / 21) [(10, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 311 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0311_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0311
        rs_R009_ueqv_R009YNNNN_generator_04_0300_0384 =
      rs_R009_ueqv_R009YNNNN_partial_04_0311 := by
  native_decide

/-- Coefficient term 312 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0312 : Poly :=
[
  term ((74880 : Rat) / 553) [(10, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 312 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0312 : Poly :=
[
  term ((-149760 : Rat) / 553) [(4, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((74880 : Rat) / 553) [(4, 2), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((74880 : Rat) / 553) [(5, 2), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-74880 : Rat) / 553) [(10, 1), (11, 1), (12, 1), (13, 2), (15, 1)],
  term ((149760 : Rat) / 553) [(10, 1), (11, 1), (12, 2), (15, 1)],
  term ((-74880 : Rat) / 553) [(10, 1), (11, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 312 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0312_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0312
        rs_R009_ueqv_R009YNNNN_generator_04_0300_0384 =
      rs_R009_ueqv_R009YNNNN_partial_04_0312 := by
  native_decide

/-- Coefficient term 313 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0313 : Poly :=
[
  term ((-2496 : Rat) / 553) [(10, 1), (11, 1), (13, 1)]
]

/-- Partial product 313 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0313 : Poly :=
[
  term ((4992 : Rat) / 553) [(4, 1), (10, 1), (11, 1), (13, 1)],
  term ((-2496 : Rat) / 553) [(4, 2), (10, 1), (11, 1), (13, 1)],
  term ((-2496 : Rat) / 553) [(5, 2), (10, 1), (11, 1), (13, 1)],
  term ((-4992 : Rat) / 553) [(10, 1), (11, 1), (12, 1), (13, 1)],
  term ((2496 : Rat) / 553) [(10, 1), (11, 1), (12, 2), (13, 1)],
  term ((2496 : Rat) / 553) [(10, 1), (11, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 313 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0313_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0313
        rs_R009_ueqv_R009YNNNN_generator_04_0300_0384 =
      rs_R009_ueqv_R009YNNNN_partial_04_0313 := by
  native_decide

/-- Coefficient term 314 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0314 : Poly :=
[
  term ((-74880 : Rat) / 553) [(10, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 314 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0314 : Poly :=
[
  term ((149760 : Rat) / 553) [(4, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-74880 : Rat) / 553) [(4, 2), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-74880 : Rat) / 553) [(5, 2), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-149760 : Rat) / 553) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((74880 : Rat) / 553) [(10, 1), (11, 1), (12, 2), (13, 1), (14, 1)],
  term ((74880 : Rat) / 553) [(10, 1), (11, 1), (13, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 314 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0314_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0314
        rs_R009_ueqv_R009YNNNN_generator_04_0300_0384 =
      rs_R009_ueqv_R009YNNNN_partial_04_0314 := by
  native_decide

/-- Coefficient term 315 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0315 : Poly :=
[
  term ((-119808 : Rat) / 553) [(10, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 315 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0315 : Poly :=
[
  term ((239616 : Rat) / 553) [(4, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-119808 : Rat) / 553) [(4, 2), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-119808 : Rat) / 553) [(5, 2), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-239616 : Rat) / 553) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((119808 : Rat) / 553) [(10, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((119808 : Rat) / 553) [(10, 1), (11, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 315 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0315_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0315
        rs_R009_ueqv_R009YNNNN_generator_04_0300_0384 =
      rs_R009_ueqv_R009YNNNN_partial_04_0315 := by
  native_decide

/-- Coefficient term 316 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0316 : Poly :=
[
  term ((22464 : Rat) / 553) [(10, 1), (11, 1), (15, 1)]
]

/-- Partial product 316 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0316 : Poly :=
[
  term ((-44928 : Rat) / 553) [(4, 1), (10, 1), (11, 1), (15, 1)],
  term ((22464 : Rat) / 553) [(4, 2), (10, 1), (11, 1), (15, 1)],
  term ((22464 : Rat) / 553) [(5, 2), (10, 1), (11, 1), (15, 1)],
  term ((44928 : Rat) / 553) [(10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-22464 : Rat) / 553) [(10, 1), (11, 1), (12, 2), (15, 1)],
  term ((-22464 : Rat) / 553) [(10, 1), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 316 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0316_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0316
        rs_R009_ueqv_R009YNNNN_generator_04_0300_0384 =
      rs_R009_ueqv_R009YNNNN_partial_04_0316 := by
  native_decide

/-- Coefficient term 317 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0317 : Poly :=
[
  term ((40 : Rat) / 21) [(10, 1), (12, 1)]
]

/-- Partial product 317 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0317 : Poly :=
[
  term ((-80 : Rat) / 21) [(4, 1), (10, 1), (12, 1)],
  term ((40 : Rat) / 21) [(4, 2), (10, 1), (12, 1)],
  term ((40 : Rat) / 21) [(5, 2), (10, 1), (12, 1)],
  term ((-40 : Rat) / 21) [(10, 1), (12, 1), (13, 2)],
  term ((80 : Rat) / 21) [(10, 1), (12, 2)],
  term ((-40 : Rat) / 21) [(10, 1), (12, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 317 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0317_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0317
        rs_R009_ueqv_R009YNNNN_generator_04_0300_0384 =
      rs_R009_ueqv_R009YNNNN_partial_04_0317 := by
  native_decide

/-- Coefficient term 318 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0318 : Poly :=
[
  term ((2926995536123 : Rat) / 532849823604) [(10, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 318 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0318 : Poly :=
[
  term ((-2926995536123 : Rat) / 266424911802) [(4, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((2926995536123 : Rat) / 532849823604) [(4, 2), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((2926995536123 : Rat) / 532849823604) [(5, 2), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-2926995536123 : Rat) / 532849823604) [(10, 1), (12, 1), (13, 3), (15, 1)],
  term ((2926995536123 : Rat) / 266424911802) [(10, 1), (12, 2), (13, 1), (15, 1)],
  term ((-2926995536123 : Rat) / 532849823604) [(10, 1), (12, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 318 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0318_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0318
        rs_R009_ueqv_R009YNNNN_generator_04_0300_0384 =
      rs_R009_ueqv_R009YNNNN_partial_04_0318 := by
  native_decide

/-- Coefficient term 319 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0319 : Poly :=
[
  term ((55 : Rat) / 14) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 319 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0319 : Poly :=
[
  term ((-55 : Rat) / 7) [(4, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((55 : Rat) / 14) [(4, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((55 : Rat) / 14) [(5, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-55 : Rat) / 14) [(10, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((55 : Rat) / 7) [(10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-55 : Rat) / 14) [(10, 1), (12, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 319 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0319_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0319
        rs_R009_ueqv_R009YNNNN_generator_04_0300_0384 =
      rs_R009_ueqv_R009YNNNN_partial_04_0319 := by
  native_decide

/-- Coefficient term 320 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0320 : Poly :=
[
  term ((-122667682763 : Rat) / 44404151967) [(10, 1), (12, 1), (15, 2)]
]

/-- Partial product 320 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0320 : Poly :=
[
  term ((245335365526 : Rat) / 44404151967) [(4, 1), (10, 1), (12, 1), (15, 2)],
  term ((-122667682763 : Rat) / 44404151967) [(4, 2), (10, 1), (12, 1), (15, 2)],
  term ((-122667682763 : Rat) / 44404151967) [(5, 2), (10, 1), (12, 1), (15, 2)],
  term ((122667682763 : Rat) / 44404151967) [(10, 1), (12, 1), (13, 2), (15, 2)],
  term ((-245335365526 : Rat) / 44404151967) [(10, 1), (12, 2), (15, 2)],
  term ((122667682763 : Rat) / 44404151967) [(10, 1), (12, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 320 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0320_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0320
        rs_R009_ueqv_R009YNNNN_generator_04_0300_0384 =
      rs_R009_ueqv_R009YNNNN_partial_04_0320 := by
  native_decide

/-- Coefficient term 321 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0321 : Poly :=
[
  term ((-24 : Rat) / 7) [(10, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 321 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0321 : Poly :=
[
  term ((48 : Rat) / 7) [(4, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-24 : Rat) / 7) [(4, 2), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-24 : Rat) / 7) [(5, 2), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((24 : Rat) / 7) [(10, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-48 : Rat) / 7) [(10, 1), (12, 2), (15, 2), (16, 1)],
  term ((24 : Rat) / 7) [(10, 1), (12, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 321 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0321_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0321
        rs_R009_ueqv_R009YNNNN_generator_04_0300_0384 =
      rs_R009_ueqv_R009YNNNN_partial_04_0321 := by
  native_decide

/-- Coefficient term 322 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0322 : Poly :=
[
  term ((27567777768901 : Rat) / 355233215736) [(10, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 322 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0322 : Poly :=
[
  term ((-27567777768901 : Rat) / 177616607868) [(4, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((27567777768901 : Rat) / 355233215736) [(4, 2), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((27567777768901 : Rat) / 355233215736) [(5, 2), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((27567777768901 : Rat) / 177616607868) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-27567777768901 : Rat) / 355233215736) [(10, 1), (12, 2), (13, 1), (14, 1), (15, 1)],
  term ((-27567777768901 : Rat) / 355233215736) [(10, 1), (13, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 322 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0322_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0322
        rs_R009_ueqv_R009YNNNN_generator_04_0300_0384 =
      rs_R009_ueqv_R009YNNNN_partial_04_0322 := by
  native_decide

/-- Coefficient term 323 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0323 : Poly :=
[
  term ((-209 : Rat) / 28) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 323 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0323 : Poly :=
[
  term ((209 : Rat) / 14) [(4, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-209 : Rat) / 28) [(4, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-209 : Rat) / 28) [(5, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-209 : Rat) / 14) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((209 : Rat) / 28) [(10, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((209 : Rat) / 28) [(10, 1), (13, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 323 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0323_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0323
        rs_R009_ueqv_R009YNNNN_generator_04_0300_0384 =
      rs_R009_ueqv_R009YNNNN_partial_04_0323 := by
  native_decide

/-- Coefficient term 324 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0324 : Poly :=
[
  term ((-14652110343103 : Rat) / 304485613488) [(10, 1), (13, 1), (15, 1)]
]

/-- Partial product 324 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0324 : Poly :=
[
  term ((14652110343103 : Rat) / 152242806744) [(4, 1), (10, 1), (13, 1), (15, 1)],
  term ((-14652110343103 : Rat) / 304485613488) [(4, 2), (10, 1), (13, 1), (15, 1)],
  term ((-14652110343103 : Rat) / 304485613488) [(5, 2), (10, 1), (13, 1), (15, 1)],
  term ((-14652110343103 : Rat) / 152242806744) [(10, 1), (12, 1), (13, 1), (15, 1)],
  term ((14652110343103 : Rat) / 304485613488) [(10, 1), (12, 2), (13, 1), (15, 1)],
  term ((14652110343103 : Rat) / 304485613488) [(10, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 324 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0324_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0324
        rs_R009_ueqv_R009YNNNN_generator_04_0300_0384 =
      rs_R009_ueqv_R009YNNNN_partial_04_0324 := by
  native_decide

/-- Coefficient term 325 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0325 : Poly :=
[
  term ((229 : Rat) / 168) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 325 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0325 : Poly :=
[
  term ((-229 : Rat) / 84) [(4, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((229 : Rat) / 168) [(4, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((229 : Rat) / 168) [(5, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((229 : Rat) / 84) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-229 : Rat) / 168) [(10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-229 : Rat) / 168) [(10, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 325 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0325_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0325
        rs_R009_ueqv_R009YNNNN_generator_04_0300_0384 =
      rs_R009_ueqv_R009YNNNN_partial_04_0325 := by
  native_decide

/-- Coefficient term 326 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0326 : Poly :=
[
  term ((6090608323475 : Rat) / 1065699647208) [(10, 1), (13, 2)]
]

/-- Partial product 326 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0326 : Poly :=
[
  term ((-6090608323475 : Rat) / 532849823604) [(4, 1), (10, 1), (13, 2)],
  term ((6090608323475 : Rat) / 1065699647208) [(4, 2), (10, 1), (13, 2)],
  term ((6090608323475 : Rat) / 1065699647208) [(5, 2), (10, 1), (13, 2)],
  term ((6090608323475 : Rat) / 532849823604) [(10, 1), (12, 1), (13, 2)],
  term ((-6090608323475 : Rat) / 1065699647208) [(10, 1), (12, 2), (13, 2)],
  term ((-6090608323475 : Rat) / 1065699647208) [(10, 1), (13, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 326 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0326_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0326
        rs_R009_ueqv_R009YNNNN_generator_04_0300_0384 =
      rs_R009_ueqv_R009YNNNN_partial_04_0326 := by
  native_decide

/-- Coefficient term 327 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0327 : Poly :=
[
  term ((-2926995536123 : Rat) / 532849823604) [(10, 1), (13, 2), (14, 1)]
]

/-- Partial product 327 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0327 : Poly :=
[
  term ((2926995536123 : Rat) / 266424911802) [(4, 1), (10, 1), (13, 2), (14, 1)],
  term ((-2926995536123 : Rat) / 532849823604) [(4, 2), (10, 1), (13, 2), (14, 1)],
  term ((-2926995536123 : Rat) / 532849823604) [(5, 2), (10, 1), (13, 2), (14, 1)],
  term ((-2926995536123 : Rat) / 266424911802) [(10, 1), (12, 1), (13, 2), (14, 1)],
  term ((2926995536123 : Rat) / 532849823604) [(10, 1), (12, 2), (13, 2), (14, 1)],
  term ((2926995536123 : Rat) / 532849823604) [(10, 1), (13, 4), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 327 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0327_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0327
        rs_R009_ueqv_R009YNNNN_generator_04_0300_0384 =
      rs_R009_ueqv_R009YNNNN_partial_04_0327 := by
  native_decide

/-- Coefficient term 328 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0328 : Poly :=
[
  term ((-55 : Rat) / 14) [(10, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 328 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0328 : Poly :=
[
  term ((55 : Rat) / 7) [(4, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((-55 : Rat) / 14) [(4, 2), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((-55 : Rat) / 14) [(5, 2), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((-55 : Rat) / 7) [(10, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((55 : Rat) / 14) [(10, 1), (12, 2), (13, 2), (14, 1), (16, 1)],
  term ((55 : Rat) / 14) [(10, 1), (13, 4), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 328 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0328_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0328
        rs_R009_ueqv_R009YNNNN_generator_04_0300_0384 =
      rs_R009_ueqv_R009YNNNN_partial_04_0328 := by
  native_decide

/-- Coefficient term 329 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0329 : Poly :=
[
  term ((-5 : Rat) / 12) [(10, 1), (13, 2), (16, 1)]
]

/-- Partial product 329 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0329 : Poly :=
[
  term ((5 : Rat) / 6) [(4, 1), (10, 1), (13, 2), (16, 1)],
  term ((-5 : Rat) / 12) [(4, 2), (10, 1), (13, 2), (16, 1)],
  term ((-5 : Rat) / 12) [(5, 2), (10, 1), (13, 2), (16, 1)],
  term ((-5 : Rat) / 6) [(10, 1), (12, 1), (13, 2), (16, 1)],
  term ((5 : Rat) / 12) [(10, 1), (12, 2), (13, 2), (16, 1)],
  term ((5 : Rat) / 12) [(10, 1), (13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 329 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0329_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0329
        rs_R009_ueqv_R009YNNNN_generator_04_0300_0384 =
      rs_R009_ueqv_R009YNNNN_partial_04_0329 := by
  native_decide

/-- Coefficient term 330 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0330 : Poly :=
[
  term ((5516346701922065 : Rat) / 9946530040608) [(10, 1), (14, 1)]
]

/-- Partial product 330 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0330 : Poly :=
[
  term ((-5516346701922065 : Rat) / 4973265020304) [(4, 1), (10, 1), (14, 1)],
  term ((5516346701922065 : Rat) / 9946530040608) [(4, 2), (10, 1), (14, 1)],
  term ((5516346701922065 : Rat) / 9946530040608) [(5, 2), (10, 1), (14, 1)],
  term ((5516346701922065 : Rat) / 4973265020304) [(10, 1), (12, 1), (14, 1)],
  term ((-5516346701922065 : Rat) / 9946530040608) [(10, 1), (12, 2), (14, 1)],
  term ((-5516346701922065 : Rat) / 9946530040608) [(10, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 330 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0330_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0330
        rs_R009_ueqv_R009YNNNN_generator_04_0300_0384 =
      rs_R009_ueqv_R009YNNNN_partial_04_0330 := by
  native_decide

/-- Coefficient term 331 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0331 : Poly :=
[
  term ((-3366906314273 : Rat) / 29602767978) [(10, 1), (14, 1), (15, 2)]
]

/-- Partial product 331 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0331 : Poly :=
[
  term ((3366906314273 : Rat) / 14801383989) [(4, 1), (10, 1), (14, 1), (15, 2)],
  term ((-3366906314273 : Rat) / 29602767978) [(4, 2), (10, 1), (14, 1), (15, 2)],
  term ((-3366906314273 : Rat) / 29602767978) [(5, 2), (10, 1), (14, 1), (15, 2)],
  term ((-3366906314273 : Rat) / 14801383989) [(10, 1), (12, 1), (14, 1), (15, 2)],
  term ((3366906314273 : Rat) / 29602767978) [(10, 1), (12, 2), (14, 1), (15, 2)],
  term ((3366906314273 : Rat) / 29602767978) [(10, 1), (13, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 331 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0331_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0331
        rs_R009_ueqv_R009YNNNN_generator_04_0300_0384 =
      rs_R009_ueqv_R009YNNNN_partial_04_0331 := by
  native_decide

/-- Coefficient term 332 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0332 : Poly :=
[
  term ((65 : Rat) / 7) [(10, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 332 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0332 : Poly :=
[
  term ((-130 : Rat) / 7) [(4, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((65 : Rat) / 7) [(4, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((65 : Rat) / 7) [(5, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((130 : Rat) / 7) [(10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-65 : Rat) / 7) [(10, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-65 : Rat) / 7) [(10, 1), (13, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 332 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0332_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0332
        rs_R009_ueqv_R009YNNNN_generator_04_0300_0384 =
      rs_R009_ueqv_R009YNNNN_partial_04_0332 := by
  native_decide

/-- Coefficient term 333 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0333 : Poly :=
[
  term ((-7183625070497 : Rat) / 73444842072) [(10, 1), (14, 2)]
]

/-- Partial product 333 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0333 : Poly :=
[
  term ((7183625070497 : Rat) / 36722421036) [(4, 1), (10, 1), (14, 2)],
  term ((-7183625070497 : Rat) / 73444842072) [(4, 2), (10, 1), (14, 2)],
  term ((-7183625070497 : Rat) / 73444842072) [(5, 2), (10, 1), (14, 2)],
  term ((-7183625070497 : Rat) / 36722421036) [(10, 1), (12, 1), (14, 2)],
  term ((7183625070497 : Rat) / 73444842072) [(10, 1), (12, 2), (14, 2)],
  term ((7183625070497 : Rat) / 73444842072) [(10, 1), (13, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 333 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0333_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0333
        rs_R009_ueqv_R009YNNNN_generator_04_0300_0384 =
      rs_R009_ueqv_R009YNNNN_partial_04_0333 := by
  native_decide

/-- Coefficient term 334 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0334 : Poly :=
[
  term ((2118317057335 : Rat) / 25373801124) [(10, 1), (15, 2)]
]

/-- Partial product 334 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0334 : Poly :=
[
  term ((-2118317057335 : Rat) / 12686900562) [(4, 1), (10, 1), (15, 2)],
  term ((2118317057335 : Rat) / 25373801124) [(4, 2), (10, 1), (15, 2)],
  term ((2118317057335 : Rat) / 25373801124) [(5, 2), (10, 1), (15, 2)],
  term ((2118317057335 : Rat) / 12686900562) [(10, 1), (12, 1), (15, 2)],
  term ((-2118317057335 : Rat) / 25373801124) [(10, 1), (12, 2), (15, 2)],
  term ((-2118317057335 : Rat) / 25373801124) [(10, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 334 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0334_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0334
        rs_R009_ueqv_R009YNNNN_generator_04_0300_0384 =
      rs_R009_ueqv_R009YNNNN_partial_04_0334 := by
  native_decide

/-- Coefficient term 335 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0335 : Poly :=
[
  term ((-13 : Rat) / 14) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 335 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0335 : Poly :=
[
  term ((13 : Rat) / 7) [(4, 1), (10, 1), (15, 2), (16, 1)],
  term ((-13 : Rat) / 14) [(4, 2), (10, 1), (15, 2), (16, 1)],
  term ((-13 : Rat) / 14) [(5, 2), (10, 1), (15, 2), (16, 1)],
  term ((-13 : Rat) / 7) [(10, 1), (12, 1), (15, 2), (16, 1)],
  term ((13 : Rat) / 14) [(10, 1), (12, 2), (15, 2), (16, 1)],
  term ((13 : Rat) / 14) [(10, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 335 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0335_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0335
        rs_R009_ueqv_R009YNNNN_generator_04_0300_0384 =
      rs_R009_ueqv_R009YNNNN_partial_04_0335 := by
  native_decide

/-- Coefficient term 336 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0336 : Poly :=
[
  term ((59904 : Rat) / 553) [(11, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 336 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0336 : Poly :=
[
  term ((-119808 : Rat) / 553) [(4, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((59904 : Rat) / 553) [(4, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((59904 : Rat) / 553) [(5, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-59904 : Rat) / 553) [(11, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((119808 : Rat) / 553) [(11, 1), (12, 2), (14, 1), (15, 1)],
  term ((-59904 : Rat) / 553) [(11, 1), (12, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 336 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0336_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0336
        rs_R009_ueqv_R009YNNNN_generator_04_0300_0384 =
      rs_R009_ueqv_R009YNNNN_partial_04_0336 := by
  native_decide

/-- Coefficient term 337 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0337 : Poly :=
[
  term ((-19010145608882 : Rat) / 133212455901) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 337 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0337 : Poly :=
[
  term ((38020291217764 : Rat) / 133212455901) [(4, 1), (11, 1), (12, 1), (15, 1)],
  term ((-19010145608882 : Rat) / 133212455901) [(4, 2), (11, 1), (12, 1), (15, 1)],
  term ((-19010145608882 : Rat) / 133212455901) [(5, 2), (11, 1), (12, 1), (15, 1)],
  term ((19010145608882 : Rat) / 133212455901) [(11, 1), (12, 1), (13, 2), (15, 1)],
  term ((-38020291217764 : Rat) / 133212455901) [(11, 1), (12, 2), (15, 1)],
  term ((19010145608882 : Rat) / 133212455901) [(11, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 337 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0337_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0337
        rs_R009_ueqv_R009YNNNN_generator_04_0300_0384 =
      rs_R009_ueqv_R009YNNNN_partial_04_0337 := by
  native_decide

/-- Coefficient term 338 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0338 : Poly :=
[
  term ((82604286814447 : Rat) / 1420932862944) [(11, 1), (13, 1)]
]

/-- Partial product 338 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0338 : Poly :=
[
  term ((-82604286814447 : Rat) / 710466431472) [(4, 1), (11, 1), (13, 1)],
  term ((82604286814447 : Rat) / 1420932862944) [(4, 2), (11, 1), (13, 1)],
  term ((82604286814447 : Rat) / 1420932862944) [(5, 2), (11, 1), (13, 1)],
  term ((82604286814447 : Rat) / 710466431472) [(11, 1), (12, 1), (13, 1)],
  term ((-82604286814447 : Rat) / 1420932862944) [(11, 1), (12, 2), (13, 1)],
  term ((-82604286814447 : Rat) / 1420932862944) [(11, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 338 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0338_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0338
        rs_R009_ueqv_R009YNNNN_generator_04_0300_0384 =
      rs_R009_ueqv_R009YNNNN_partial_04_0338 := by
  native_decide

/-- Coefficient term 339 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0339 : Poly :=
[
  term ((17223128934131 : Rat) / 118411071912) [(11, 1), (13, 1), (14, 1)]
]

/-- Partial product 339 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0339 : Poly :=
[
  term ((-17223128934131 : Rat) / 59205535956) [(4, 1), (11, 1), (13, 1), (14, 1)],
  term ((17223128934131 : Rat) / 118411071912) [(4, 2), (11, 1), (13, 1), (14, 1)],
  term ((17223128934131 : Rat) / 118411071912) [(5, 2), (11, 1), (13, 1), (14, 1)],
  term ((17223128934131 : Rat) / 59205535956) [(11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-17223128934131 : Rat) / 118411071912) [(11, 1), (12, 2), (13, 1), (14, 1)],
  term ((-17223128934131 : Rat) / 118411071912) [(11, 1), (13, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 339 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0339_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0339
        rs_R009_ueqv_R009YNNNN_generator_04_0300_0384 =
      rs_R009_ueqv_R009YNNNN_partial_04_0339 := by
  native_decide

/-- Coefficient term 340 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0340 : Poly :=
[
  term ((55 : Rat) / 28) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 340 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0340 : Poly :=
[
  term ((-55 : Rat) / 14) [(4, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((55 : Rat) / 28) [(4, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((55 : Rat) / 28) [(5, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((55 : Rat) / 14) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-55 : Rat) / 28) [(11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-55 : Rat) / 28) [(11, 1), (13, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 340 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0340_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0340
        rs_R009_ueqv_R009YNNNN_generator_04_0300_0384 =
      rs_R009_ueqv_R009YNNNN_partial_04_0340 := by
  native_decide

/-- Coefficient term 341 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0341 : Poly :=
[
  term ((-59904 : Rat) / 553) [(11, 1), (13, 1), (14, 2)]
]

/-- Partial product 341 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0341 : Poly :=
[
  term ((119808 : Rat) / 553) [(4, 1), (11, 1), (13, 1), (14, 2)],
  term ((-59904 : Rat) / 553) [(4, 2), (11, 1), (13, 1), (14, 2)],
  term ((-59904 : Rat) / 553) [(5, 2), (11, 1), (13, 1), (14, 2)],
  term ((-119808 : Rat) / 553) [(11, 1), (12, 1), (13, 1), (14, 2)],
  term ((59904 : Rat) / 553) [(11, 1), (12, 2), (13, 1), (14, 2)],
  term ((59904 : Rat) / 553) [(11, 1), (13, 3), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 341 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0341_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0341
        rs_R009_ueqv_R009YNNNN_generator_04_0300_0384 =
      rs_R009_ueqv_R009YNNNN_partial_04_0341 := by
  native_decide

/-- Coefficient term 342 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0342 : Poly :=
[
  term ((2954048478533 : Rat) / 39470357304) [(11, 1), (13, 1), (15, 2)]
]

/-- Partial product 342 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0342 : Poly :=
[
  term ((-2954048478533 : Rat) / 19735178652) [(4, 1), (11, 1), (13, 1), (15, 2)],
  term ((2954048478533 : Rat) / 39470357304) [(4, 2), (11, 1), (13, 1), (15, 2)],
  term ((2954048478533 : Rat) / 39470357304) [(5, 2), (11, 1), (13, 1), (15, 2)],
  term ((2954048478533 : Rat) / 19735178652) [(11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-2954048478533 : Rat) / 39470357304) [(11, 1), (12, 2), (13, 1), (15, 2)],
  term ((-2954048478533 : Rat) / 39470357304) [(11, 1), (13, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 342 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0342_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0342
        rs_R009_ueqv_R009YNNNN_generator_04_0300_0384 =
      rs_R009_ueqv_R009YNNNN_partial_04_0342 := by
  native_decide

/-- Coefficient term 343 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0343 : Poly :=
[
  term ((-305 : Rat) / 28) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 343 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0343 : Poly :=
[
  term ((305 : Rat) / 14) [(4, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-305 : Rat) / 28) [(4, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-305 : Rat) / 28) [(5, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-305 : Rat) / 14) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((305 : Rat) / 28) [(11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((305 : Rat) / 28) [(11, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 343 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0343_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0343
        rs_R009_ueqv_R009YNNNN_generator_04_0300_0384 =
      rs_R009_ueqv_R009YNNNN_partial_04_0343 := by
  native_decide

/-- Coefficient term 344 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0344 : Poly :=
[
  term ((-425 : Rat) / 336) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 344 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0344 : Poly :=
[
  term ((425 : Rat) / 168) [(4, 1), (11, 1), (13, 1), (16, 1)],
  term ((-425 : Rat) / 336) [(4, 2), (11, 1), (13, 1), (16, 1)],
  term ((-425 : Rat) / 336) [(5, 2), (11, 1), (13, 1), (16, 1)],
  term ((-425 : Rat) / 168) [(11, 1), (12, 1), (13, 1), (16, 1)],
  term ((425 : Rat) / 336) [(11, 1), (12, 2), (13, 1), (16, 1)],
  term ((425 : Rat) / 336) [(11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 344 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0344_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0344
        rs_R009_ueqv_R009YNNNN_generator_04_0300_0384 =
      rs_R009_ueqv_R009YNNNN_partial_04_0344 := by
  native_decide

/-- Coefficient term 345 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0345 : Poly :=
[
  term ((158997915105415 : Rat) / 17406427571064) [(11, 1), (14, 1), (15, 1)]
]

/-- Partial product 345 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0345 : Poly :=
[
  term ((-158997915105415 : Rat) / 8703213785532) [(4, 1), (11, 1), (14, 1), (15, 1)],
  term ((158997915105415 : Rat) / 17406427571064) [(4, 2), (11, 1), (14, 1), (15, 1)],
  term ((158997915105415 : Rat) / 17406427571064) [(5, 2), (11, 1), (14, 1), (15, 1)],
  term ((158997915105415 : Rat) / 8703213785532) [(11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-158997915105415 : Rat) / 17406427571064) [(11, 1), (12, 2), (14, 1), (15, 1)],
  term ((-158997915105415 : Rat) / 17406427571064) [(11, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 345 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0345_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0345
        rs_R009_ueqv_R009YNNNN_generator_04_0300_0384 =
      rs_R009_ueqv_R009YNNNN_partial_04_0345 := by
  native_decide

/-- Coefficient term 346 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0346 : Poly :=
[
  term ((-12 : Rat) / 7) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 346 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0346 : Poly :=
[
  term ((24 : Rat) / 7) [(4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12 : Rat) / 7) [(4, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12 : Rat) / 7) [(5, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-24 : Rat) / 7) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((12 : Rat) / 7) [(11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((12 : Rat) / 7) [(11, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 346 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0346_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0346
        rs_R009_ueqv_R009YNNNN_generator_04_0300_0384 =
      rs_R009_ueqv_R009YNNNN_partial_04_0346 := by
  native_decide

/-- Coefficient term 347 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0347 : Poly :=
[
  term ((16750397217974951 : Rat) / 29839590121824) [(11, 1), (15, 1)]
]

/-- Partial product 347 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0347 : Poly :=
[
  term ((-16750397217974951 : Rat) / 14919795060912) [(4, 1), (11, 1), (15, 1)],
  term ((16750397217974951 : Rat) / 29839590121824) [(4, 2), (11, 1), (15, 1)],
  term ((16750397217974951 : Rat) / 29839590121824) [(5, 2), (11, 1), (15, 1)],
  term ((16750397217974951 : Rat) / 14919795060912) [(11, 1), (12, 1), (15, 1)],
  term ((-16750397217974951 : Rat) / 29839590121824) [(11, 1), (12, 2), (15, 1)],
  term ((-16750397217974951 : Rat) / 29839590121824) [(11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 347 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0347_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0347
        rs_R009_ueqv_R009YNNNN_generator_04_0300_0384 =
      rs_R009_ueqv_R009YNNNN_partial_04_0347 := by
  native_decide

/-- Coefficient term 348 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0348 : Poly :=
[
  term ((95 : Rat) / 84) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 348 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0348 : Poly :=
[
  term ((-95 : Rat) / 42) [(4, 1), (11, 1), (15, 1), (16, 1)],
  term ((95 : Rat) / 84) [(4, 2), (11, 1), (15, 1), (16, 1)],
  term ((95 : Rat) / 84) [(5, 2), (11, 1), (15, 1), (16, 1)],
  term ((95 : Rat) / 42) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-95 : Rat) / 84) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-95 : Rat) / 84) [(11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 348 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0348_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0348
        rs_R009_ueqv_R009YNNNN_generator_04_0300_0384 =
      rs_R009_ueqv_R009YNNNN_partial_04_0348 := by
  native_decide

/-- Coefficient term 349 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0349 : Poly :=
[
  term ((-3366906314273 : Rat) / 29602767978) [(11, 1), (15, 3)]
]

/-- Partial product 349 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0349 : Poly :=
[
  term ((3366906314273 : Rat) / 14801383989) [(4, 1), (11, 1), (15, 3)],
  term ((-3366906314273 : Rat) / 29602767978) [(4, 2), (11, 1), (15, 3)],
  term ((-3366906314273 : Rat) / 29602767978) [(5, 2), (11, 1), (15, 3)],
  term ((-3366906314273 : Rat) / 14801383989) [(11, 1), (12, 1), (15, 3)],
  term ((3366906314273 : Rat) / 29602767978) [(11, 1), (12, 2), (15, 3)],
  term ((3366906314273 : Rat) / 29602767978) [(11, 1), (13, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 349 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0349_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0349
        rs_R009_ueqv_R009YNNNN_generator_04_0300_0384 =
      rs_R009_ueqv_R009YNNNN_partial_04_0349 := by
  native_decide

/-- Coefficient term 350 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0350 : Poly :=
[
  term ((65 : Rat) / 7) [(11, 1), (15, 3), (16, 1)]
]

/-- Partial product 350 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0350 : Poly :=
[
  term ((-130 : Rat) / 7) [(4, 1), (11, 1), (15, 3), (16, 1)],
  term ((65 : Rat) / 7) [(4, 2), (11, 1), (15, 3), (16, 1)],
  term ((65 : Rat) / 7) [(5, 2), (11, 1), (15, 3), (16, 1)],
  term ((130 : Rat) / 7) [(11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-65 : Rat) / 7) [(11, 1), (12, 2), (15, 3), (16, 1)],
  term ((-65 : Rat) / 7) [(11, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 350 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0350_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0350
        rs_R009_ueqv_R009YNNNN_generator_04_0300_0384 =
      rs_R009_ueqv_R009YNNNN_partial_04_0350 := by
  native_decide

/-- Coefficient term 351 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0351 : Poly :=
[
  term ((-28704 : Rat) / 553) [(11, 2)]
]

/-- Partial product 351 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0351 : Poly :=
[
  term ((57408 : Rat) / 553) [(4, 1), (11, 2)],
  term ((-28704 : Rat) / 553) [(4, 2), (11, 2)],
  term ((-28704 : Rat) / 553) [(5, 2), (11, 2)],
  term ((-57408 : Rat) / 553) [(11, 2), (12, 1)],
  term ((28704 : Rat) / 553) [(11, 2), (12, 2)],
  term ((28704 : Rat) / 553) [(11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 351 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0351_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0351
        rs_R009_ueqv_R009YNNNN_generator_04_0300_0384 =
      rs_R009_ueqv_R009YNNNN_partial_04_0351 := by
  native_decide

/-- Coefficient term 352 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0352 : Poly :=
[
  term ((37440 : Rat) / 553) [(11, 2), (14, 1)]
]

/-- Partial product 352 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0352 : Poly :=
[
  term ((-74880 : Rat) / 553) [(4, 1), (11, 2), (14, 1)],
  term ((37440 : Rat) / 553) [(4, 2), (11, 2), (14, 1)],
  term ((37440 : Rat) / 553) [(5, 2), (11, 2), (14, 1)],
  term ((74880 : Rat) / 553) [(11, 2), (12, 1), (14, 1)],
  term ((-37440 : Rat) / 553) [(11, 2), (12, 2), (14, 1)],
  term ((-37440 : Rat) / 553) [(11, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 352 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0352_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0352
        rs_R009_ueqv_R009YNNNN_generator_04_0300_0384 =
      rs_R009_ueqv_R009YNNNN_partial_04_0352 := by
  native_decide

/-- Coefficient term 353 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0353 : Poly :=
[
  term ((-119808 : Rat) / 553) [(11, 2), (15, 2)]
]

/-- Partial product 353 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0353 : Poly :=
[
  term ((239616 : Rat) / 553) [(4, 1), (11, 2), (15, 2)],
  term ((-119808 : Rat) / 553) [(4, 2), (11, 2), (15, 2)],
  term ((-119808 : Rat) / 553) [(5, 2), (11, 2), (15, 2)],
  term ((-239616 : Rat) / 553) [(11, 2), (12, 1), (15, 2)],
  term ((119808 : Rat) / 553) [(11, 2), (12, 2), (15, 2)],
  term ((119808 : Rat) / 553) [(11, 2), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 353 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0353_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0353
        rs_R009_ueqv_R009YNNNN_generator_04_0300_0384 =
      rs_R009_ueqv_R009YNNNN_partial_04_0353 := by
  native_decide

/-- Coefficient term 354 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0354 : Poly :=
[
  term ((2444668745291 : Rat) / 266424911802) [(12, 1)]
]

/-- Partial product 354 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0354 : Poly :=
[
  term ((-2444668745291 : Rat) / 133212455901) [(4, 1), (12, 1)],
  term ((2444668745291 : Rat) / 266424911802) [(4, 2), (12, 1)],
  term ((2444668745291 : Rat) / 266424911802) [(5, 2), (12, 1)],
  term ((-2444668745291 : Rat) / 266424911802) [(12, 1), (13, 2)],
  term ((2444668745291 : Rat) / 133212455901) [(12, 2)],
  term ((-2444668745291 : Rat) / 266424911802) [(12, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 354 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0354_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0354
        rs_R009_ueqv_R009YNNNN_generator_04_0300_0384 =
      rs_R009_ueqv_R009YNNNN_partial_04_0354 := by
  native_decide

/-- Coefficient term 355 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0355 : Poly :=
[
  term ((2629582380889 : Rat) / 236822143824) [(12, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 355 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0355 : Poly :=
[
  term ((-2629582380889 : Rat) / 118411071912) [(4, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((2629582380889 : Rat) / 236822143824) [(4, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((2629582380889 : Rat) / 236822143824) [(5, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-2629582380889 : Rat) / 236822143824) [(12, 1), (13, 3), (14, 1), (15, 1)],
  term ((2629582380889 : Rat) / 118411071912) [(12, 2), (13, 1), (14, 1), (15, 1)],
  term ((-2629582380889 : Rat) / 236822143824) [(12, 3), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 355 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0355_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0355
        rs_R009_ueqv_R009YNNNN_generator_04_0300_0384 =
      rs_R009_ueqv_R009YNNNN_partial_04_0355 := by
  native_decide

/-- Coefficient term 356 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0356 : Poly :=
[
  term ((345 : Rat) / 56) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 356 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0356 : Poly :=
[
  term ((-345 : Rat) / 28) [(4, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((345 : Rat) / 56) [(4, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((345 : Rat) / 56) [(5, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-345 : Rat) / 56) [(12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((345 : Rat) / 28) [(12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-345 : Rat) / 56) [(12, 3), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 356 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0356_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0356
        rs_R009_ueqv_R009YNNNN_generator_04_0300_0384 =
      rs_R009_ueqv_R009YNNNN_partial_04_0356 := by
  native_decide

/-- Coefficient term 357 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0357 : Poly :=
[
  term ((-389178307824539 : Rat) / 4262798588832) [(12, 1), (13, 1), (15, 1)]
]

/-- Partial product 357 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0357 : Poly :=
[
  term ((389178307824539 : Rat) / 2131399294416) [(4, 1), (12, 1), (13, 1), (15, 1)],
  term ((-389178307824539 : Rat) / 4262798588832) [(4, 2), (12, 1), (13, 1), (15, 1)],
  term ((-389178307824539 : Rat) / 4262798588832) [(5, 2), (12, 1), (13, 1), (15, 1)],
  term ((389178307824539 : Rat) / 4262798588832) [(12, 1), (13, 3), (15, 1)],
  term ((-389178307824539 : Rat) / 2131399294416) [(12, 2), (13, 1), (15, 1)],
  term ((389178307824539 : Rat) / 4262798588832) [(12, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 357 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0357_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0357
        rs_R009_ueqv_R009YNNNN_generator_04_0300_0384 =
      rs_R009_ueqv_R009YNNNN_partial_04_0357 := by
  native_decide

/-- Coefficient term 358 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0358 : Poly :=
[
  term ((45 : Rat) / 112) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 358 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0358 : Poly :=
[
  term ((-45 : Rat) / 56) [(4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((45 : Rat) / 112) [(4, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((45 : Rat) / 112) [(5, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-45 : Rat) / 112) [(12, 1), (13, 3), (15, 1), (16, 1)],
  term ((45 : Rat) / 56) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-45 : Rat) / 112) [(12, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 358 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0358_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0358
        rs_R009_ueqv_R009YNNNN_generator_04_0300_0384 =
      rs_R009_ueqv_R009YNNNN_partial_04_0358 := by
  native_decide

/-- Coefficient term 359 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0359 : Poly :=
[
  term ((-2991533456192 : Rat) / 133212455901) [(12, 1), (14, 1)]
]

/-- Partial product 359 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0359 : Poly :=
[
  term ((5983066912384 : Rat) / 133212455901) [(4, 1), (12, 1), (14, 1)],
  term ((-2991533456192 : Rat) / 133212455901) [(4, 2), (12, 1), (14, 1)],
  term ((-2991533456192 : Rat) / 133212455901) [(5, 2), (12, 1), (14, 1)],
  term ((2991533456192 : Rat) / 133212455901) [(12, 1), (13, 2), (14, 1)],
  term ((-5983066912384 : Rat) / 133212455901) [(12, 2), (14, 1)],
  term ((2991533456192 : Rat) / 133212455901) [(12, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 359 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0359_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0359
        rs_R009_ueqv_R009YNNNN_generator_04_0300_0384 =
      rs_R009_ueqv_R009YNNNN_partial_04_0359 := by
  native_decide

/-- Coefficient term 360 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0360 : Poly :=
[
  term ((-2187255370987 : Rat) / 19735178652) [(12, 1), (14, 1), (15, 2)]
]

/-- Partial product 360 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0360 : Poly :=
[
  term ((2187255370987 : Rat) / 9867589326) [(4, 1), (12, 1), (14, 1), (15, 2)],
  term ((-2187255370987 : Rat) / 19735178652) [(4, 2), (12, 1), (14, 1), (15, 2)],
  term ((-2187255370987 : Rat) / 19735178652) [(5, 2), (12, 1), (14, 1), (15, 2)],
  term ((2187255370987 : Rat) / 19735178652) [(12, 1), (13, 2), (14, 1), (15, 2)],
  term ((-2187255370987 : Rat) / 9867589326) [(12, 2), (14, 1), (15, 2)],
  term ((2187255370987 : Rat) / 19735178652) [(12, 3), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 360 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0360_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0360
        rs_R009_ueqv_R009YNNNN_generator_04_0300_0384 =
      rs_R009_ueqv_R009YNNNN_partial_04_0360 := by
  native_decide

/-- Coefficient term 361 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0361 : Poly :=
[
  term ((-73 : Rat) / 14) [(12, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 361 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0361 : Poly :=
[
  term ((73 : Rat) / 7) [(4, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-73 : Rat) / 14) [(4, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-73 : Rat) / 14) [(5, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((73 : Rat) / 14) [(12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-73 : Rat) / 7) [(12, 2), (14, 1), (15, 2), (16, 1)],
  term ((73 : Rat) / 14) [(12, 3), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 361 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0361_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0361
        rs_R009_ueqv_R009YNNNN_generator_04_0300_0384 =
      rs_R009_ueqv_R009YNNNN_partial_04_0361 := by
  native_decide

/-- Coefficient term 362 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0362 : Poly :=
[
  term ((2001591001496153 : Rat) / 8703213785532) [(12, 1), (15, 2)]
]

/-- Partial product 362 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0362 : Poly :=
[
  term ((-2001591001496153 : Rat) / 4351606892766) [(4, 1), (12, 1), (15, 2)],
  term ((2001591001496153 : Rat) / 8703213785532) [(4, 2), (12, 1), (15, 2)],
  term ((2001591001496153 : Rat) / 8703213785532) [(5, 2), (12, 1), (15, 2)],
  term ((-2001591001496153 : Rat) / 8703213785532) [(12, 1), (13, 2), (15, 2)],
  term ((2001591001496153 : Rat) / 4351606892766) [(12, 2), (15, 2)],
  term ((-2001591001496153 : Rat) / 8703213785532) [(12, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 362 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0362_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0362
        rs_R009_ueqv_R009YNNNN_generator_04_0300_0384 =
      rs_R009_ueqv_R009YNNNN_partial_04_0362 := by
  native_decide

/-- Coefficient term 363 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0363 : Poly :=
[
  term ((-155 : Rat) / 84) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 363 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0363 : Poly :=
[
  term ((155 : Rat) / 42) [(4, 1), (12, 1), (15, 2), (16, 1)],
  term ((-155 : Rat) / 84) [(4, 2), (12, 1), (15, 2), (16, 1)],
  term ((-155 : Rat) / 84) [(5, 2), (12, 1), (15, 2), (16, 1)],
  term ((155 : Rat) / 84) [(12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-155 : Rat) / 42) [(12, 2), (15, 2), (16, 1)],
  term ((155 : Rat) / 84) [(12, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 363 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0363_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0363
        rs_R009_ueqv_R009YNNNN_generator_04_0300_0384 =
      rs_R009_ueqv_R009YNNNN_partial_04_0363 := by
  native_decide

/-- Coefficient term 364 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0364 : Poly :=
[
  term ((-7619815395993929 : Rat) / 34812855142128) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 364 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0364 : Poly :=
[
  term ((7619815395993929 : Rat) / 17406427571064) [(4, 1), (13, 1), (14, 1), (15, 1)],
  term ((-7619815395993929 : Rat) / 34812855142128) [(4, 2), (13, 1), (14, 1), (15, 1)],
  term ((-7619815395993929 : Rat) / 34812855142128) [(5, 2), (13, 1), (14, 1), (15, 1)],
  term ((-7619815395993929 : Rat) / 17406427571064) [(12, 1), (13, 1), (14, 1), (15, 1)],
  term ((7619815395993929 : Rat) / 34812855142128) [(12, 2), (13, 1), (14, 1), (15, 1)],
  term ((7619815395993929 : Rat) / 34812855142128) [(13, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 364 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0364_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0364
        rs_R009_ueqv_R009YNNNN_generator_04_0300_0384 =
      rs_R009_ueqv_R009YNNNN_partial_04_0364 := by
  native_decide

/-- Coefficient term 365 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0365 : Poly :=
[
  term ((1345 : Rat) / 168) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 365 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0365 : Poly :=
[
  term ((-1345 : Rat) / 84) [(4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1345 : Rat) / 168) [(4, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1345 : Rat) / 168) [(5, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1345 : Rat) / 84) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1345 : Rat) / 168) [(12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1345 : Rat) / 168) [(13, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 365 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0365_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0365
        rs_R009_ueqv_R009YNNNN_generator_04_0300_0384 =
      rs_R009_ueqv_R009YNNNN_partial_04_0365 := by
  native_decide

/-- Coefficient term 366 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0366 : Poly :=
[
  term ((2187255370987 : Rat) / 19735178652) [(13, 1), (14, 2), (15, 1)]
]

/-- Partial product 366 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0366 : Poly :=
[
  term ((-2187255370987 : Rat) / 9867589326) [(4, 1), (13, 1), (14, 2), (15, 1)],
  term ((2187255370987 : Rat) / 19735178652) [(4, 2), (13, 1), (14, 2), (15, 1)],
  term ((2187255370987 : Rat) / 19735178652) [(5, 2), (13, 1), (14, 2), (15, 1)],
  term ((2187255370987 : Rat) / 9867589326) [(12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-2187255370987 : Rat) / 19735178652) [(12, 2), (13, 1), (14, 2), (15, 1)],
  term ((-2187255370987 : Rat) / 19735178652) [(13, 3), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 366 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0366_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0366
        rs_R009_ueqv_R009YNNNN_generator_04_0300_0384 =
      rs_R009_ueqv_R009YNNNN_partial_04_0366 := by
  native_decide

/-- Coefficient term 367 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0367 : Poly :=
[
  term ((73 : Rat) / 14) [(13, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 367 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0367 : Poly :=
[
  term ((-73 : Rat) / 7) [(4, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((73 : Rat) / 14) [(4, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((73 : Rat) / 14) [(5, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((73 : Rat) / 7) [(12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-73 : Rat) / 14) [(12, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-73 : Rat) / 14) [(13, 3), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 367 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0367_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0367
        rs_R009_ueqv_R009YNNNN_generator_04_0300_0384 =
      rs_R009_ueqv_R009YNNNN_partial_04_0367 := by
  native_decide

/-- Coefficient term 368 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0368 : Poly :=
[
  term ((4647325625945039 : Rat) / 69625710284256) [(13, 1), (15, 1)]
]

/-- Partial product 368 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0368 : Poly :=
[
  term ((-4647325625945039 : Rat) / 34812855142128) [(4, 1), (13, 1), (15, 1)],
  term ((4647325625945039 : Rat) / 69625710284256) [(4, 2), (13, 1), (15, 1)],
  term ((4647325625945039 : Rat) / 69625710284256) [(5, 2), (13, 1), (15, 1)],
  term ((4647325625945039 : Rat) / 34812855142128) [(12, 1), (13, 1), (15, 1)],
  term ((-4647325625945039 : Rat) / 69625710284256) [(12, 2), (13, 1), (15, 1)],
  term ((-4647325625945039 : Rat) / 69625710284256) [(13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 368 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0368_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0368
        rs_R009_ueqv_R009YNNNN_generator_04_0300_0384 =
      rs_R009_ueqv_R009YNNNN_partial_04_0368 := by
  native_decide

/-- Coefficient term 369 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0369 : Poly :=
[
  term ((-353 : Rat) / 336) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 369 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0369 : Poly :=
[
  term ((353 : Rat) / 168) [(4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-353 : Rat) / 336) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term ((-353 : Rat) / 336) [(5, 2), (13, 1), (15, 1), (16, 1)],
  term ((-353 : Rat) / 168) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((353 : Rat) / 336) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((353 : Rat) / 336) [(13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 369 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0369_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0369
        rs_R009_ueqv_R009YNNNN_generator_04_0300_0384 =
      rs_R009_ueqv_R009YNNNN_partial_04_0369 := by
  native_decide

/-- Coefficient term 370 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0370 : Poly :=
[
  term ((-97923607474811 : Rat) / 2131399294416) [(13, 2)]
]

/-- Partial product 370 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0370 : Poly :=
[
  term ((97923607474811 : Rat) / 1065699647208) [(4, 1), (13, 2)],
  term ((-97923607474811 : Rat) / 2131399294416) [(4, 2), (13, 2)],
  term ((-97923607474811 : Rat) / 2131399294416) [(5, 2), (13, 2)],
  term ((-97923607474811 : Rat) / 1065699647208) [(12, 1), (13, 2)],
  term ((97923607474811 : Rat) / 2131399294416) [(12, 2), (13, 2)],
  term ((97923607474811 : Rat) / 2131399294416) [(13, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 370 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0370_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0370
        rs_R009_ueqv_R009YNNNN_generator_04_0300_0384 =
      rs_R009_ueqv_R009YNNNN_partial_04_0370 := by
  native_decide

/-- Coefficient term 371 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0371 : Poly :=
[
  term ((389178307824539 : Rat) / 4262798588832) [(13, 2), (14, 1)]
]

/-- Partial product 371 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0371 : Poly :=
[
  term ((-389178307824539 : Rat) / 2131399294416) [(4, 1), (13, 2), (14, 1)],
  term ((389178307824539 : Rat) / 4262798588832) [(4, 2), (13, 2), (14, 1)],
  term ((389178307824539 : Rat) / 4262798588832) [(5, 2), (13, 2), (14, 1)],
  term ((389178307824539 : Rat) / 2131399294416) [(12, 1), (13, 2), (14, 1)],
  term ((-389178307824539 : Rat) / 4262798588832) [(12, 2), (13, 2), (14, 1)],
  term ((-389178307824539 : Rat) / 4262798588832) [(13, 4), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 371 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0371_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0371
        rs_R009_ueqv_R009YNNNN_generator_04_0300_0384 =
      rs_R009_ueqv_R009YNNNN_partial_04_0371 := by
  native_decide

/-- Coefficient term 372 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0372 : Poly :=
[
  term ((-45 : Rat) / 112) [(13, 2), (14, 1), (16, 1)]
]

/-- Partial product 372 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0372 : Poly :=
[
  term ((45 : Rat) / 56) [(4, 1), (13, 2), (14, 1), (16, 1)],
  term ((-45 : Rat) / 112) [(4, 2), (13, 2), (14, 1), (16, 1)],
  term ((-45 : Rat) / 112) [(5, 2), (13, 2), (14, 1), (16, 1)],
  term ((-45 : Rat) / 56) [(12, 1), (13, 2), (14, 1), (16, 1)],
  term ((45 : Rat) / 112) [(12, 2), (13, 2), (14, 1), (16, 1)],
  term ((45 : Rat) / 112) [(13, 4), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 372 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0372_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0372
        rs_R009_ueqv_R009YNNNN_generator_04_0300_0384 =
      rs_R009_ueqv_R009YNNNN_partial_04_0372 := by
  native_decide

/-- Coefficient term 373 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0373 : Poly :=
[
  term ((-2629582380889 : Rat) / 236822143824) [(13, 2), (14, 2)]
]

/-- Partial product 373 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0373 : Poly :=
[
  term ((2629582380889 : Rat) / 118411071912) [(4, 1), (13, 2), (14, 2)],
  term ((-2629582380889 : Rat) / 236822143824) [(4, 2), (13, 2), (14, 2)],
  term ((-2629582380889 : Rat) / 236822143824) [(5, 2), (13, 2), (14, 2)],
  term ((-2629582380889 : Rat) / 118411071912) [(12, 1), (13, 2), (14, 2)],
  term ((2629582380889 : Rat) / 236822143824) [(12, 2), (13, 2), (14, 2)],
  term ((2629582380889 : Rat) / 236822143824) [(13, 4), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 373 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0373_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0373
        rs_R009_ueqv_R009YNNNN_generator_04_0300_0384 =
      rs_R009_ueqv_R009YNNNN_partial_04_0373 := by
  native_decide

/-- Coefficient term 374 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0374 : Poly :=
[
  term ((-345 : Rat) / 56) [(13, 2), (14, 2), (16, 1)]
]

/-- Partial product 374 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0374 : Poly :=
[
  term ((345 : Rat) / 28) [(4, 1), (13, 2), (14, 2), (16, 1)],
  term ((-345 : Rat) / 56) [(4, 2), (13, 2), (14, 2), (16, 1)],
  term ((-345 : Rat) / 56) [(5, 2), (13, 2), (14, 2), (16, 1)],
  term ((-345 : Rat) / 28) [(12, 1), (13, 2), (14, 2), (16, 1)],
  term ((345 : Rat) / 56) [(12, 2), (13, 2), (14, 2), (16, 1)],
  term ((345 : Rat) / 56) [(13, 4), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 374 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0374_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0374
        rs_R009_ueqv_R009YNNNN_generator_04_0300_0384 =
      rs_R009_ueqv_R009YNNNN_partial_04_0374 := by
  native_decide

/-- Coefficient term 375 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0375 : Poly :=
[
  term ((475 : Rat) / 168) [(13, 2), (16, 1)]
]

/-- Partial product 375 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0375 : Poly :=
[
  term ((-475 : Rat) / 84) [(4, 1), (13, 2), (16, 1)],
  term ((475 : Rat) / 168) [(4, 2), (13, 2), (16, 1)],
  term ((475 : Rat) / 168) [(5, 2), (13, 2), (16, 1)],
  term ((475 : Rat) / 84) [(12, 1), (13, 2), (16, 1)],
  term ((-475 : Rat) / 168) [(12, 2), (13, 2), (16, 1)],
  term ((-475 : Rat) / 168) [(13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 375 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0375_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0375
        rs_R009_ueqv_R009YNNNN_generator_04_0300_0384 =
      rs_R009_ueqv_R009YNNNN_partial_04_0375 := by
  native_decide

/-- Coefficient term 376 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0376 : Poly :=
[
  term ((-956271586230683 : Rat) / 104438565426384) [(14, 1)]
]

/-- Partial product 376 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0376 : Poly :=
[
  term ((956271586230683 : Rat) / 52219282713192) [(4, 1), (14, 1)],
  term ((-956271586230683 : Rat) / 104438565426384) [(4, 2), (14, 1)],
  term ((-956271586230683 : Rat) / 104438565426384) [(5, 2), (14, 1)],
  term ((-956271586230683 : Rat) / 52219282713192) [(12, 1), (14, 1)],
  term ((956271586230683 : Rat) / 104438565426384) [(12, 2), (14, 1)],
  term ((956271586230683 : Rat) / 104438565426384) [(13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 376 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0376_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0376
        rs_R009_ueqv_R009YNNNN_generator_04_0300_0384 =
      rs_R009_ueqv_R009YNNNN_partial_04_0376 := by
  native_decide

/-- Coefficient term 377 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0377 : Poly :=
[
  term ((5672111551053023 : Rat) / 29839590121824) [(14, 1), (15, 2)]
]

/-- Partial product 377 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0377 : Poly :=
[
  term ((-5672111551053023 : Rat) / 14919795060912) [(4, 1), (14, 1), (15, 2)],
  term ((5672111551053023 : Rat) / 29839590121824) [(4, 2), (14, 1), (15, 2)],
  term ((5672111551053023 : Rat) / 29839590121824) [(5, 2), (14, 1), (15, 2)],
  term ((5672111551053023 : Rat) / 14919795060912) [(12, 1), (14, 1), (15, 2)],
  term ((-5672111551053023 : Rat) / 29839590121824) [(12, 2), (14, 1), (15, 2)],
  term ((-5672111551053023 : Rat) / 29839590121824) [(13, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 377 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0377_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0377
        rs_R009_ueqv_R009YNNNN_generator_04_0300_0384 =
      rs_R009_ueqv_R009YNNNN_partial_04_0377 := by
  native_decide

/-- Coefficient term 378 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0378 : Poly :=
[
  term ((-73 : Rat) / 14) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 378 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0378 : Poly :=
[
  term ((73 : Rat) / 7) [(4, 1), (14, 1), (15, 2), (16, 1)],
  term ((-73 : Rat) / 14) [(4, 2), (14, 1), (15, 2), (16, 1)],
  term ((-73 : Rat) / 14) [(5, 2), (14, 1), (15, 2), (16, 1)],
  term ((-73 : Rat) / 7) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((73 : Rat) / 14) [(12, 2), (14, 1), (15, 2), (16, 1)],
  term ((73 : Rat) / 14) [(13, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 378 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0378_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0378
        rs_R009_ueqv_R009YNNNN_generator_04_0300_0384 =
      rs_R009_ueqv_R009YNNNN_partial_04_0378 := by
  native_decide

/-- Coefficient term 379 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0379 : Poly :=
[
  term ((-16 : Rat) / 21) [(14, 1), (16, 1)]
]

/-- Partial product 379 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0379 : Poly :=
[
  term ((32 : Rat) / 21) [(4, 1), (14, 1), (16, 1)],
  term ((-16 : Rat) / 21) [(4, 2), (14, 1), (16, 1)],
  term ((-16 : Rat) / 21) [(5, 2), (14, 1), (16, 1)],
  term ((-32 : Rat) / 21) [(12, 1), (14, 1), (16, 1)],
  term ((16 : Rat) / 21) [(12, 2), (14, 1), (16, 1)],
  term ((16 : Rat) / 21) [(13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 379 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0379_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0379
        rs_R009_ueqv_R009YNNNN_generator_04_0300_0384 =
      rs_R009_ueqv_R009YNNNN_partial_04_0379 := by
  native_decide

/-- Coefficient term 380 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0380 : Poly :=
[
  term ((35854195703665523 : Rat) / 417754261705536) [(14, 2)]
]

/-- Partial product 380 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0380 : Poly :=
[
  term ((-35854195703665523 : Rat) / 208877130852768) [(4, 1), (14, 2)],
  term ((35854195703665523 : Rat) / 417754261705536) [(4, 2), (14, 2)],
  term ((35854195703665523 : Rat) / 417754261705536) [(5, 2), (14, 2)],
  term ((35854195703665523 : Rat) / 208877130852768) [(12, 1), (14, 2)],
  term ((-35854195703665523 : Rat) / 417754261705536) [(12, 2), (14, 2)],
  term ((-35854195703665523 : Rat) / 417754261705536) [(13, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 380 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0380_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0380
        rs_R009_ueqv_R009YNNNN_generator_04_0300_0384 =
      rs_R009_ueqv_R009YNNNN_partial_04_0380 := by
  native_decide

/-- Coefficient term 381 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0381 : Poly :=
[
  term ((16 : Rat) / 21) [(14, 2), (16, 1)]
]

/-- Partial product 381 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0381 : Poly :=
[
  term ((-32 : Rat) / 21) [(4, 1), (14, 2), (16, 1)],
  term ((16 : Rat) / 21) [(4, 2), (14, 2), (16, 1)],
  term ((16 : Rat) / 21) [(5, 2), (14, 2), (16, 1)],
  term ((32 : Rat) / 21) [(12, 1), (14, 2), (16, 1)],
  term ((-16 : Rat) / 21) [(12, 2), (14, 2), (16, 1)],
  term ((-16 : Rat) / 21) [(13, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 381 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0381_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0381
        rs_R009_ueqv_R009YNNNN_generator_04_0300_0384 =
      rs_R009_ueqv_R009YNNNN_partial_04_0381 := by
  native_decide

/-- Coefficient term 382 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0382 : Poly :=
[
  term ((8979241671985367 : Rat) / 29839590121824) [(14, 3)]
]

/-- Partial product 382 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0382 : Poly :=
[
  term ((-8979241671985367 : Rat) / 14919795060912) [(4, 1), (14, 3)],
  term ((8979241671985367 : Rat) / 29839590121824) [(4, 2), (14, 3)],
  term ((8979241671985367 : Rat) / 29839590121824) [(5, 2), (14, 3)],
  term ((8979241671985367 : Rat) / 14919795060912) [(12, 1), (14, 3)],
  term ((-8979241671985367 : Rat) / 29839590121824) [(12, 2), (14, 3)],
  term ((-8979241671985367 : Rat) / 29839590121824) [(13, 2), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 382 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0382_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0382
        rs_R009_ueqv_R009YNNNN_generator_04_0300_0384 =
      rs_R009_ueqv_R009YNNNN_partial_04_0382 := by
  native_decide

/-- Coefficient term 383 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0383 : Poly :=
[
  term ((-157351447131873349 : Rat) / 417754261705536) [(15, 2)]
]

/-- Partial product 383 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0383 : Poly :=
[
  term ((157351447131873349 : Rat) / 208877130852768) [(4, 1), (15, 2)],
  term ((-157351447131873349 : Rat) / 417754261705536) [(4, 2), (15, 2)],
  term ((-157351447131873349 : Rat) / 417754261705536) [(5, 2), (15, 2)],
  term ((-157351447131873349 : Rat) / 208877130852768) [(12, 1), (15, 2)],
  term ((157351447131873349 : Rat) / 417754261705536) [(12, 2), (15, 2)],
  term ((157351447131873349 : Rat) / 417754261705536) [(13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 383 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0383_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0383
        rs_R009_ueqv_R009YNNNN_generator_04_0300_0384 =
      rs_R009_ueqv_R009YNNNN_partial_04_0383 := by
  native_decide

/-- Coefficient term 384 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0384 : Poly :=
[
  term ((-53 : Rat) / 28) [(15, 2), (16, 1)]
]

/-- Partial product 384 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0384 : Poly :=
[
  term ((53 : Rat) / 14) [(4, 1), (15, 2), (16, 1)],
  term ((-53 : Rat) / 28) [(4, 2), (15, 2), (16, 1)],
  term ((-53 : Rat) / 28) [(5, 2), (15, 2), (16, 1)],
  term ((-53 : Rat) / 14) [(12, 1), (15, 2), (16, 1)],
  term ((53 : Rat) / 28) [(12, 2), (15, 2), (16, 1)],
  term ((53 : Rat) / 28) [(13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 384 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0384_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0384
        rs_R009_ueqv_R009YNNNN_generator_04_0300_0384 =
      rs_R009_ueqv_R009YNNNN_partial_04_0384 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_partials_04_0300_0384 : List Poly :=
[
  rs_R009_ueqv_R009YNNNN_partial_04_0300,
  rs_R009_ueqv_R009YNNNN_partial_04_0301,
  rs_R009_ueqv_R009YNNNN_partial_04_0302,
  rs_R009_ueqv_R009YNNNN_partial_04_0303,
  rs_R009_ueqv_R009YNNNN_partial_04_0304,
  rs_R009_ueqv_R009YNNNN_partial_04_0305,
  rs_R009_ueqv_R009YNNNN_partial_04_0306,
  rs_R009_ueqv_R009YNNNN_partial_04_0307,
  rs_R009_ueqv_R009YNNNN_partial_04_0308,
  rs_R009_ueqv_R009YNNNN_partial_04_0309,
  rs_R009_ueqv_R009YNNNN_partial_04_0310,
  rs_R009_ueqv_R009YNNNN_partial_04_0311,
  rs_R009_ueqv_R009YNNNN_partial_04_0312,
  rs_R009_ueqv_R009YNNNN_partial_04_0313,
  rs_R009_ueqv_R009YNNNN_partial_04_0314,
  rs_R009_ueqv_R009YNNNN_partial_04_0315,
  rs_R009_ueqv_R009YNNNN_partial_04_0316,
  rs_R009_ueqv_R009YNNNN_partial_04_0317,
  rs_R009_ueqv_R009YNNNN_partial_04_0318,
  rs_R009_ueqv_R009YNNNN_partial_04_0319,
  rs_R009_ueqv_R009YNNNN_partial_04_0320,
  rs_R009_ueqv_R009YNNNN_partial_04_0321,
  rs_R009_ueqv_R009YNNNN_partial_04_0322,
  rs_R009_ueqv_R009YNNNN_partial_04_0323,
  rs_R009_ueqv_R009YNNNN_partial_04_0324,
  rs_R009_ueqv_R009YNNNN_partial_04_0325,
  rs_R009_ueqv_R009YNNNN_partial_04_0326,
  rs_R009_ueqv_R009YNNNN_partial_04_0327,
  rs_R009_ueqv_R009YNNNN_partial_04_0328,
  rs_R009_ueqv_R009YNNNN_partial_04_0329,
  rs_R009_ueqv_R009YNNNN_partial_04_0330,
  rs_R009_ueqv_R009YNNNN_partial_04_0331,
  rs_R009_ueqv_R009YNNNN_partial_04_0332,
  rs_R009_ueqv_R009YNNNN_partial_04_0333,
  rs_R009_ueqv_R009YNNNN_partial_04_0334,
  rs_R009_ueqv_R009YNNNN_partial_04_0335,
  rs_R009_ueqv_R009YNNNN_partial_04_0336,
  rs_R009_ueqv_R009YNNNN_partial_04_0337,
  rs_R009_ueqv_R009YNNNN_partial_04_0338,
  rs_R009_ueqv_R009YNNNN_partial_04_0339,
  rs_R009_ueqv_R009YNNNN_partial_04_0340,
  rs_R009_ueqv_R009YNNNN_partial_04_0341,
  rs_R009_ueqv_R009YNNNN_partial_04_0342,
  rs_R009_ueqv_R009YNNNN_partial_04_0343,
  rs_R009_ueqv_R009YNNNN_partial_04_0344,
  rs_R009_ueqv_R009YNNNN_partial_04_0345,
  rs_R009_ueqv_R009YNNNN_partial_04_0346,
  rs_R009_ueqv_R009YNNNN_partial_04_0347,
  rs_R009_ueqv_R009YNNNN_partial_04_0348,
  rs_R009_ueqv_R009YNNNN_partial_04_0349,
  rs_R009_ueqv_R009YNNNN_partial_04_0350,
  rs_R009_ueqv_R009YNNNN_partial_04_0351,
  rs_R009_ueqv_R009YNNNN_partial_04_0352,
  rs_R009_ueqv_R009YNNNN_partial_04_0353,
  rs_R009_ueqv_R009YNNNN_partial_04_0354,
  rs_R009_ueqv_R009YNNNN_partial_04_0355,
  rs_R009_ueqv_R009YNNNN_partial_04_0356,
  rs_R009_ueqv_R009YNNNN_partial_04_0357,
  rs_R009_ueqv_R009YNNNN_partial_04_0358,
  rs_R009_ueqv_R009YNNNN_partial_04_0359,
  rs_R009_ueqv_R009YNNNN_partial_04_0360,
  rs_R009_ueqv_R009YNNNN_partial_04_0361,
  rs_R009_ueqv_R009YNNNN_partial_04_0362,
  rs_R009_ueqv_R009YNNNN_partial_04_0363,
  rs_R009_ueqv_R009YNNNN_partial_04_0364,
  rs_R009_ueqv_R009YNNNN_partial_04_0365,
  rs_R009_ueqv_R009YNNNN_partial_04_0366,
  rs_R009_ueqv_R009YNNNN_partial_04_0367,
  rs_R009_ueqv_R009YNNNN_partial_04_0368,
  rs_R009_ueqv_R009YNNNN_partial_04_0369,
  rs_R009_ueqv_R009YNNNN_partial_04_0370,
  rs_R009_ueqv_R009YNNNN_partial_04_0371,
  rs_R009_ueqv_R009YNNNN_partial_04_0372,
  rs_R009_ueqv_R009YNNNN_partial_04_0373,
  rs_R009_ueqv_R009YNNNN_partial_04_0374,
  rs_R009_ueqv_R009YNNNN_partial_04_0375,
  rs_R009_ueqv_R009YNNNN_partial_04_0376,
  rs_R009_ueqv_R009YNNNN_partial_04_0377,
  rs_R009_ueqv_R009YNNNN_partial_04_0378,
  rs_R009_ueqv_R009YNNNN_partial_04_0379,
  rs_R009_ueqv_R009YNNNN_partial_04_0380,
  rs_R009_ueqv_R009YNNNN_partial_04_0381,
  rs_R009_ueqv_R009YNNNN_partial_04_0382,
  rs_R009_ueqv_R009YNNNN_partial_04_0383,
  rs_R009_ueqv_R009YNNNN_partial_04_0384
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_block_04_0300_0384 : Poly :=
[
  term ((-95 : Rat) / 21) [(4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-3366906314273 : Rat) / 29602767978) [(4, 1), (9, 1), (15, 3)],
  term ((65 : Rat) / 7) [(4, 1), (9, 1), (15, 3), (16, 1)],
  term ((13697682239527 : Rat) / 101495204496) [(4, 1), (9, 2)],
  term ((10861008665 : Rat) / 1284749424) [(4, 1), (9, 2), (10, 1)],
  term ((-67338253723 : Rat) / 2248311492) [(4, 1), (9, 2), (10, 1), (12, 1)],
  term ((2172201733 : Rat) / 166541592) [(4, 1), (9, 2), (10, 1), (14, 1)],
  term ((997316410233 : Rat) / 4385595256) [(4, 1), (9, 2), (12, 1)],
  term ((-656584494318343 : Rat) / 8703213785532) [(4, 1), (9, 2), (14, 1)],
  term ((-210703568101 : Rat) / 2997748656) [(4, 1), (9, 2), (14, 2)],
  term ((-210703568101 : Rat) / 2997748656) [(4, 1), (9, 2), (15, 2)],
  term ((-40 : Rat) / 21) [(4, 1), (10, 1)],
  term ((-149760 : Rat) / 553) [(4, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((4992 : Rat) / 553) [(4, 1), (10, 1), (11, 1), (13, 1)],
  term ((149760 : Rat) / 553) [(4, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((239616 : Rat) / 553) [(4, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-44928 : Rat) / 553) [(4, 1), (10, 1), (11, 1), (15, 1)],
  term ((-80 : Rat) / 21) [(4, 1), (10, 1), (12, 1)],
  term ((-2926995536123 : Rat) / 266424911802) [(4, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-55 : Rat) / 7) [(4, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((245335365526 : Rat) / 44404151967) [(4, 1), (10, 1), (12, 1), (15, 2)],
  term ((48 : Rat) / 7) [(4, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-27567777768901 : Rat) / 177616607868) [(4, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((209 : Rat) / 14) [(4, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((14652110343103 : Rat) / 152242806744) [(4, 1), (10, 1), (13, 1), (15, 1)],
  term ((-229 : Rat) / 84) [(4, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6090608323475 : Rat) / 532849823604) [(4, 1), (10, 1), (13, 2)],
  term ((2926995536123 : Rat) / 266424911802) [(4, 1), (10, 1), (13, 2), (14, 1)],
  term ((55 : Rat) / 7) [(4, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((5 : Rat) / 6) [(4, 1), (10, 1), (13, 2), (16, 1)],
  term ((-5516346701922065 : Rat) / 4973265020304) [(4, 1), (10, 1), (14, 1)],
  term ((3366906314273 : Rat) / 14801383989) [(4, 1), (10, 1), (14, 1), (15, 2)],
  term ((-130 : Rat) / 7) [(4, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((7183625070497 : Rat) / 36722421036) [(4, 1), (10, 1), (14, 2)],
  term ((-2118317057335 : Rat) / 12686900562) [(4, 1), (10, 1), (15, 2)],
  term ((13 : Rat) / 7) [(4, 1), (10, 1), (15, 2), (16, 1)],
  term ((-119808 : Rat) / 553) [(4, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((38020291217764 : Rat) / 133212455901) [(4, 1), (11, 1), (12, 1), (15, 1)],
  term ((-82604286814447 : Rat) / 710466431472) [(4, 1), (11, 1), (13, 1)],
  term ((-17223128934131 : Rat) / 59205535956) [(4, 1), (11, 1), (13, 1), (14, 1)],
  term ((-55 : Rat) / 14) [(4, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((119808 : Rat) / 553) [(4, 1), (11, 1), (13, 1), (14, 2)],
  term ((-2954048478533 : Rat) / 19735178652) [(4, 1), (11, 1), (13, 1), (15, 2)],
  term ((305 : Rat) / 14) [(4, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((425 : Rat) / 168) [(4, 1), (11, 1), (13, 1), (16, 1)],
  term ((-158997915105415 : Rat) / 8703213785532) [(4, 1), (11, 1), (14, 1), (15, 1)],
  term ((24 : Rat) / 7) [(4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-16750397217974951 : Rat) / 14919795060912) [(4, 1), (11, 1), (15, 1)],
  term ((-95 : Rat) / 42) [(4, 1), (11, 1), (15, 1), (16, 1)],
  term ((3366906314273 : Rat) / 14801383989) [(4, 1), (11, 1), (15, 3)],
  term ((-130 : Rat) / 7) [(4, 1), (11, 1), (15, 3), (16, 1)],
  term ((57408 : Rat) / 553) [(4, 1), (11, 2)],
  term ((-74880 : Rat) / 553) [(4, 1), (11, 2), (14, 1)],
  term ((239616 : Rat) / 553) [(4, 1), (11, 2), (15, 2)],
  term ((-2444668745291 : Rat) / 133212455901) [(4, 1), (12, 1)],
  term ((-2629582380889 : Rat) / 118411071912) [(4, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-345 : Rat) / 28) [(4, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((389178307824539 : Rat) / 2131399294416) [(4, 1), (12, 1), (13, 1), (15, 1)],
  term ((-45 : Rat) / 56) [(4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((5983066912384 : Rat) / 133212455901) [(4, 1), (12, 1), (14, 1)],
  term ((2187255370987 : Rat) / 9867589326) [(4, 1), (12, 1), (14, 1), (15, 2)],
  term ((73 : Rat) / 7) [(4, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2001591001496153 : Rat) / 4351606892766) [(4, 1), (12, 1), (15, 2)],
  term ((155 : Rat) / 42) [(4, 1), (12, 1), (15, 2), (16, 1)],
  term ((7619815395993929 : Rat) / 17406427571064) [(4, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1345 : Rat) / 84) [(4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2187255370987 : Rat) / 9867589326) [(4, 1), (13, 1), (14, 2), (15, 1)],
  term ((-73 : Rat) / 7) [(4, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-4647325625945039 : Rat) / 34812855142128) [(4, 1), (13, 1), (15, 1)],
  term ((353 : Rat) / 168) [(4, 1), (13, 1), (15, 1), (16, 1)],
  term ((97923607474811 : Rat) / 1065699647208) [(4, 1), (13, 2)],
  term ((-389178307824539 : Rat) / 2131399294416) [(4, 1), (13, 2), (14, 1)],
  term ((45 : Rat) / 56) [(4, 1), (13, 2), (14, 1), (16, 1)],
  term ((2629582380889 : Rat) / 118411071912) [(4, 1), (13, 2), (14, 2)],
  term ((345 : Rat) / 28) [(4, 1), (13, 2), (14, 2), (16, 1)],
  term ((-475 : Rat) / 84) [(4, 1), (13, 2), (16, 1)],
  term ((956271586230683 : Rat) / 52219282713192) [(4, 1), (14, 1)],
  term ((-5672111551053023 : Rat) / 14919795060912) [(4, 1), (14, 1), (15, 2)],
  term ((73 : Rat) / 7) [(4, 1), (14, 1), (15, 2), (16, 1)],
  term ((32 : Rat) / 21) [(4, 1), (14, 1), (16, 1)],
  term ((-35854195703665523 : Rat) / 208877130852768) [(4, 1), (14, 2)],
  term ((-32 : Rat) / 21) [(4, 1), (14, 2), (16, 1)],
  term ((-8979241671985367 : Rat) / 14919795060912) [(4, 1), (14, 3)],
  term ((157351447131873349 : Rat) / 208877130852768) [(4, 1), (15, 2)],
  term ((53 : Rat) / 14) [(4, 1), (15, 2), (16, 1)],
  term ((95 : Rat) / 42) [(4, 2), (9, 1), (15, 1), (16, 1)],
  term ((3366906314273 : Rat) / 59205535956) [(4, 2), (9, 1), (15, 3)],
  term ((-65 : Rat) / 14) [(4, 2), (9, 1), (15, 3), (16, 1)],
  term ((-13697682239527 : Rat) / 202990408992) [(4, 2), (9, 2)],
  term ((-10861008665 : Rat) / 2569498848) [(4, 2), (9, 2), (10, 1)],
  term ((67338253723 : Rat) / 4496622984) [(4, 2), (9, 2), (10, 1), (12, 1)],
  term ((-2172201733 : Rat) / 333083184) [(4, 2), (9, 2), (10, 1), (14, 1)],
  term ((-997316410233 : Rat) / 8771190512) [(4, 2), (9, 2), (12, 1)],
  term ((656584494318343 : Rat) / 17406427571064) [(4, 2), (9, 2), (14, 1)],
  term ((210703568101 : Rat) / 5995497312) [(4, 2), (9, 2), (14, 2)],
  term ((210703568101 : Rat) / 5995497312) [(4, 2), (9, 2), (15, 2)],
  term ((20 : Rat) / 21) [(4, 2), (10, 1)],
  term ((74880 : Rat) / 553) [(4, 2), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-2496 : Rat) / 553) [(4, 2), (10, 1), (11, 1), (13, 1)],
  term ((-74880 : Rat) / 553) [(4, 2), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-119808 : Rat) / 553) [(4, 2), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((22464 : Rat) / 553) [(4, 2), (10, 1), (11, 1), (15, 1)],
  term ((40 : Rat) / 21) [(4, 2), (10, 1), (12, 1)],
  term ((2926995536123 : Rat) / 532849823604) [(4, 2), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((55 : Rat) / 14) [(4, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-122667682763 : Rat) / 44404151967) [(4, 2), (10, 1), (12, 1), (15, 2)],
  term ((-24 : Rat) / 7) [(4, 2), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((27567777768901 : Rat) / 355233215736) [(4, 2), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-209 : Rat) / 28) [(4, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-14652110343103 : Rat) / 304485613488) [(4, 2), (10, 1), (13, 1), (15, 1)],
  term ((229 : Rat) / 168) [(4, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((6090608323475 : Rat) / 1065699647208) [(4, 2), (10, 1), (13, 2)],
  term ((-2926995536123 : Rat) / 532849823604) [(4, 2), (10, 1), (13, 2), (14, 1)],
  term ((-55 : Rat) / 14) [(4, 2), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((-5 : Rat) / 12) [(4, 2), (10, 1), (13, 2), (16, 1)],
  term ((5516346701922065 : Rat) / 9946530040608) [(4, 2), (10, 1), (14, 1)],
  term ((-3366906314273 : Rat) / 29602767978) [(4, 2), (10, 1), (14, 1), (15, 2)],
  term ((65 : Rat) / 7) [(4, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-7183625070497 : Rat) / 73444842072) [(4, 2), (10, 1), (14, 2)],
  term ((2118317057335 : Rat) / 25373801124) [(4, 2), (10, 1), (15, 2)],
  term ((-13 : Rat) / 14) [(4, 2), (10, 1), (15, 2), (16, 1)],
  term ((59904 : Rat) / 553) [(4, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-19010145608882 : Rat) / 133212455901) [(4, 2), (11, 1), (12, 1), (15, 1)],
  term ((82604286814447 : Rat) / 1420932862944) [(4, 2), (11, 1), (13, 1)],
  term ((17223128934131 : Rat) / 118411071912) [(4, 2), (11, 1), (13, 1), (14, 1)],
  term ((55 : Rat) / 28) [(4, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-59904 : Rat) / 553) [(4, 2), (11, 1), (13, 1), (14, 2)],
  term ((2954048478533 : Rat) / 39470357304) [(4, 2), (11, 1), (13, 1), (15, 2)],
  term ((-305 : Rat) / 28) [(4, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-425 : Rat) / 336) [(4, 2), (11, 1), (13, 1), (16, 1)],
  term ((158997915105415 : Rat) / 17406427571064) [(4, 2), (11, 1), (14, 1), (15, 1)],
  term ((-12 : Rat) / 7) [(4, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((16750397217974951 : Rat) / 29839590121824) [(4, 2), (11, 1), (15, 1)],
  term ((95 : Rat) / 84) [(4, 2), (11, 1), (15, 1), (16, 1)],
  term ((-3366906314273 : Rat) / 29602767978) [(4, 2), (11, 1), (15, 3)],
  term ((65 : Rat) / 7) [(4, 2), (11, 1), (15, 3), (16, 1)],
  term ((-28704 : Rat) / 553) [(4, 2), (11, 2)],
  term ((37440 : Rat) / 553) [(4, 2), (11, 2), (14, 1)],
  term ((-119808 : Rat) / 553) [(4, 2), (11, 2), (15, 2)],
  term ((2444668745291 : Rat) / 266424911802) [(4, 2), (12, 1)],
  term ((2629582380889 : Rat) / 236822143824) [(4, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((345 : Rat) / 56) [(4, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-389178307824539 : Rat) / 4262798588832) [(4, 2), (12, 1), (13, 1), (15, 1)],
  term ((45 : Rat) / 112) [(4, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2991533456192 : Rat) / 133212455901) [(4, 2), (12, 1), (14, 1)],
  term ((-2187255370987 : Rat) / 19735178652) [(4, 2), (12, 1), (14, 1), (15, 2)],
  term ((-73 : Rat) / 14) [(4, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((2001591001496153 : Rat) / 8703213785532) [(4, 2), (12, 1), (15, 2)],
  term ((-155 : Rat) / 84) [(4, 2), (12, 1), (15, 2), (16, 1)],
  term ((-7619815395993929 : Rat) / 34812855142128) [(4, 2), (13, 1), (14, 1), (15, 1)],
  term ((1345 : Rat) / 168) [(4, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2187255370987 : Rat) / 19735178652) [(4, 2), (13, 1), (14, 2), (15, 1)],
  term ((73 : Rat) / 14) [(4, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((4647325625945039 : Rat) / 69625710284256) [(4, 2), (13, 1), (15, 1)],
  term ((-353 : Rat) / 336) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term ((-97923607474811 : Rat) / 2131399294416) [(4, 2), (13, 2)],
  term ((389178307824539 : Rat) / 4262798588832) [(4, 2), (13, 2), (14, 1)],
  term ((-45 : Rat) / 112) [(4, 2), (13, 2), (14, 1), (16, 1)],
  term ((-2629582380889 : Rat) / 236822143824) [(4, 2), (13, 2), (14, 2)],
  term ((-345 : Rat) / 56) [(4, 2), (13, 2), (14, 2), (16, 1)],
  term ((475 : Rat) / 168) [(4, 2), (13, 2), (16, 1)],
  term ((-956271586230683 : Rat) / 104438565426384) [(4, 2), (14, 1)],
  term ((5672111551053023 : Rat) / 29839590121824) [(4, 2), (14, 1), (15, 2)],
  term ((-73 : Rat) / 14) [(4, 2), (14, 1), (15, 2), (16, 1)],
  term ((-16 : Rat) / 21) [(4, 2), (14, 1), (16, 1)],
  term ((35854195703665523 : Rat) / 417754261705536) [(4, 2), (14, 2)],
  term ((16 : Rat) / 21) [(4, 2), (14, 2), (16, 1)],
  term ((8979241671985367 : Rat) / 29839590121824) [(4, 2), (14, 3)],
  term ((-157351447131873349 : Rat) / 417754261705536) [(4, 2), (15, 2)],
  term ((-53 : Rat) / 28) [(4, 2), (15, 2), (16, 1)],
  term ((95 : Rat) / 42) [(5, 2), (9, 1), (15, 1), (16, 1)],
  term ((3366906314273 : Rat) / 59205535956) [(5, 2), (9, 1), (15, 3)],
  term ((-65 : Rat) / 14) [(5, 2), (9, 1), (15, 3), (16, 1)],
  term ((-13697682239527 : Rat) / 202990408992) [(5, 2), (9, 2)],
  term ((-10861008665 : Rat) / 2569498848) [(5, 2), (9, 2), (10, 1)],
  term ((67338253723 : Rat) / 4496622984) [(5, 2), (9, 2), (10, 1), (12, 1)],
  term ((-2172201733 : Rat) / 333083184) [(5, 2), (9, 2), (10, 1), (14, 1)],
  term ((-997316410233 : Rat) / 8771190512) [(5, 2), (9, 2), (12, 1)],
  term ((656584494318343 : Rat) / 17406427571064) [(5, 2), (9, 2), (14, 1)],
  term ((210703568101 : Rat) / 5995497312) [(5, 2), (9, 2), (14, 2)],
  term ((210703568101 : Rat) / 5995497312) [(5, 2), (9, 2), (15, 2)],
  term ((20 : Rat) / 21) [(5, 2), (10, 1)],
  term ((74880 : Rat) / 553) [(5, 2), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-2496 : Rat) / 553) [(5, 2), (10, 1), (11, 1), (13, 1)],
  term ((-74880 : Rat) / 553) [(5, 2), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-119808 : Rat) / 553) [(5, 2), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((22464 : Rat) / 553) [(5, 2), (10, 1), (11, 1), (15, 1)],
  term ((40 : Rat) / 21) [(5, 2), (10, 1), (12, 1)],
  term ((2926995536123 : Rat) / 532849823604) [(5, 2), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((55 : Rat) / 14) [(5, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-122667682763 : Rat) / 44404151967) [(5, 2), (10, 1), (12, 1), (15, 2)],
  term ((-24 : Rat) / 7) [(5, 2), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((27567777768901 : Rat) / 355233215736) [(5, 2), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-209 : Rat) / 28) [(5, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-14652110343103 : Rat) / 304485613488) [(5, 2), (10, 1), (13, 1), (15, 1)],
  term ((229 : Rat) / 168) [(5, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((6090608323475 : Rat) / 1065699647208) [(5, 2), (10, 1), (13, 2)],
  term ((-2926995536123 : Rat) / 532849823604) [(5, 2), (10, 1), (13, 2), (14, 1)],
  term ((-55 : Rat) / 14) [(5, 2), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((-5 : Rat) / 12) [(5, 2), (10, 1), (13, 2), (16, 1)],
  term ((5516346701922065 : Rat) / 9946530040608) [(5, 2), (10, 1), (14, 1)],
  term ((-3366906314273 : Rat) / 29602767978) [(5, 2), (10, 1), (14, 1), (15, 2)],
  term ((65 : Rat) / 7) [(5, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-7183625070497 : Rat) / 73444842072) [(5, 2), (10, 1), (14, 2)],
  term ((2118317057335 : Rat) / 25373801124) [(5, 2), (10, 1), (15, 2)],
  term ((-13 : Rat) / 14) [(5, 2), (10, 1), (15, 2), (16, 1)],
  term ((59904 : Rat) / 553) [(5, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-19010145608882 : Rat) / 133212455901) [(5, 2), (11, 1), (12, 1), (15, 1)],
  term ((82604286814447 : Rat) / 1420932862944) [(5, 2), (11, 1), (13, 1)],
  term ((17223128934131 : Rat) / 118411071912) [(5, 2), (11, 1), (13, 1), (14, 1)],
  term ((55 : Rat) / 28) [(5, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-59904 : Rat) / 553) [(5, 2), (11, 1), (13, 1), (14, 2)],
  term ((2954048478533 : Rat) / 39470357304) [(5, 2), (11, 1), (13, 1), (15, 2)],
  term ((-305 : Rat) / 28) [(5, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-425 : Rat) / 336) [(5, 2), (11, 1), (13, 1), (16, 1)],
  term ((158997915105415 : Rat) / 17406427571064) [(5, 2), (11, 1), (14, 1), (15, 1)],
  term ((-12 : Rat) / 7) [(5, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((16750397217974951 : Rat) / 29839590121824) [(5, 2), (11, 1), (15, 1)],
  term ((95 : Rat) / 84) [(5, 2), (11, 1), (15, 1), (16, 1)],
  term ((-3366906314273 : Rat) / 29602767978) [(5, 2), (11, 1), (15, 3)],
  term ((65 : Rat) / 7) [(5, 2), (11, 1), (15, 3), (16, 1)],
  term ((-28704 : Rat) / 553) [(5, 2), (11, 2)],
  term ((37440 : Rat) / 553) [(5, 2), (11, 2), (14, 1)],
  term ((-119808 : Rat) / 553) [(5, 2), (11, 2), (15, 2)],
  term ((2444668745291 : Rat) / 266424911802) [(5, 2), (12, 1)],
  term ((2629582380889 : Rat) / 236822143824) [(5, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((345 : Rat) / 56) [(5, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-389178307824539 : Rat) / 4262798588832) [(5, 2), (12, 1), (13, 1), (15, 1)],
  term ((45 : Rat) / 112) [(5, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2991533456192 : Rat) / 133212455901) [(5, 2), (12, 1), (14, 1)],
  term ((-2187255370987 : Rat) / 19735178652) [(5, 2), (12, 1), (14, 1), (15, 2)],
  term ((-73 : Rat) / 14) [(5, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((2001591001496153 : Rat) / 8703213785532) [(5, 2), (12, 1), (15, 2)],
  term ((-155 : Rat) / 84) [(5, 2), (12, 1), (15, 2), (16, 1)],
  term ((-7619815395993929 : Rat) / 34812855142128) [(5, 2), (13, 1), (14, 1), (15, 1)],
  term ((1345 : Rat) / 168) [(5, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2187255370987 : Rat) / 19735178652) [(5, 2), (13, 1), (14, 2), (15, 1)],
  term ((73 : Rat) / 14) [(5, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((4647325625945039 : Rat) / 69625710284256) [(5, 2), (13, 1), (15, 1)],
  term ((-353 : Rat) / 336) [(5, 2), (13, 1), (15, 1), (16, 1)],
  term ((-97923607474811 : Rat) / 2131399294416) [(5, 2), (13, 2)],
  term ((389178307824539 : Rat) / 4262798588832) [(5, 2), (13, 2), (14, 1)],
  term ((-45 : Rat) / 112) [(5, 2), (13, 2), (14, 1), (16, 1)],
  term ((-2629582380889 : Rat) / 236822143824) [(5, 2), (13, 2), (14, 2)],
  term ((-345 : Rat) / 56) [(5, 2), (13, 2), (14, 2), (16, 1)],
  term ((475 : Rat) / 168) [(5, 2), (13, 2), (16, 1)],
  term ((-956271586230683 : Rat) / 104438565426384) [(5, 2), (14, 1)],
  term ((5672111551053023 : Rat) / 29839590121824) [(5, 2), (14, 1), (15, 2)],
  term ((-73 : Rat) / 14) [(5, 2), (14, 1), (15, 2), (16, 1)],
  term ((-16 : Rat) / 21) [(5, 2), (14, 1), (16, 1)],
  term ((35854195703665523 : Rat) / 417754261705536) [(5, 2), (14, 2)],
  term ((16 : Rat) / 21) [(5, 2), (14, 2), (16, 1)],
  term ((8979241671985367 : Rat) / 29839590121824) [(5, 2), (14, 3)],
  term ((-157351447131873349 : Rat) / 417754261705536) [(5, 2), (15, 2)],
  term ((-53 : Rat) / 28) [(5, 2), (15, 2), (16, 1)],
  term ((95 : Rat) / 21) [(9, 1), (12, 1), (15, 1), (16, 1)],
  term ((3366906314273 : Rat) / 29602767978) [(9, 1), (12, 1), (15, 3)],
  term ((-65 : Rat) / 7) [(9, 1), (12, 1), (15, 3), (16, 1)],
  term ((-95 : Rat) / 42) [(9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-3366906314273 : Rat) / 59205535956) [(9, 1), (12, 2), (15, 3)],
  term ((65 : Rat) / 14) [(9, 1), (12, 2), (15, 3), (16, 1)],
  term ((-95 : Rat) / 42) [(9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-3366906314273 : Rat) / 59205535956) [(9, 1), (13, 2), (15, 3)],
  term ((65 : Rat) / 14) [(9, 1), (13, 2), (15, 3), (16, 1)],
  term ((-10861008665 : Rat) / 1284749424) [(9, 2), (10, 1), (12, 1)],
  term ((-67338253723 : Rat) / 4496622984) [(9, 2), (10, 1), (12, 1), (13, 2)],
  term ((-2172201733 : Rat) / 166541592) [(9, 2), (10, 1), (12, 1), (14, 1)],
  term ((614733090439 : Rat) / 17986491936) [(9, 2), (10, 1), (12, 2)],
  term ((2172201733 : Rat) / 333083184) [(9, 2), (10, 1), (12, 2), (14, 1)],
  term ((-67338253723 : Rat) / 4496622984) [(9, 2), (10, 1), (12, 3)],
  term ((10861008665 : Rat) / 2569498848) [(9, 2), (10, 1), (13, 2)],
  term ((2172201733 : Rat) / 333083184) [(9, 2), (10, 1), (13, 2), (14, 1)],
  term ((-13697682239527 : Rat) / 101495204496) [(9, 2), (12, 1)],
  term ((997316410233 : Rat) / 8771190512) [(9, 2), (12, 1), (13, 2)],
  term ((656584494318343 : Rat) / 8703213785532) [(9, 2), (12, 1), (14, 1)],
  term ((210703568101 : Rat) / 2997748656) [(9, 2), (12, 1), (14, 2)],
  term ((210703568101 : Rat) / 2997748656) [(9, 2), (12, 1), (15, 2)],
  term ((-227246741238803 : Rat) / 1420932862944) [(9, 2), (12, 2)],
  term ((-656584494318343 : Rat) / 17406427571064) [(9, 2), (12, 2), (14, 1)],
  term ((-210703568101 : Rat) / 5995497312) [(9, 2), (12, 2), (14, 2)],
  term ((-210703568101 : Rat) / 5995497312) [(9, 2), (12, 2), (15, 2)],
  term ((997316410233 : Rat) / 8771190512) [(9, 2), (12, 3)],
  term ((13697682239527 : Rat) / 202990408992) [(9, 2), (13, 2)],
  term ((-656584494318343 : Rat) / 17406427571064) [(9, 2), (13, 2), (14, 1)],
  term ((-210703568101 : Rat) / 5995497312) [(9, 2), (13, 2), (14, 2)],
  term ((-210703568101 : Rat) / 5995497312) [(9, 2), (13, 2), (15, 2)],
  term ((-4992 : Rat) / 553) [(10, 1), (11, 1), (12, 1), (13, 1)],
  term ((-149760 : Rat) / 553) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-74880 : Rat) / 553) [(10, 1), (11, 1), (12, 1), (13, 2), (15, 1)],
  term ((-239616 : Rat) / 553) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((44928 : Rat) / 553) [(10, 1), (11, 1), (12, 1), (15, 1)],
  term ((2496 : Rat) / 553) [(10, 1), (11, 1), (12, 2), (13, 1)],
  term ((74880 : Rat) / 553) [(10, 1), (11, 1), (12, 2), (13, 1), (14, 1)],
  term ((119808 : Rat) / 553) [(10, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((127296 : Rat) / 553) [(10, 1), (11, 1), (12, 2), (15, 1)],
  term ((-74880 : Rat) / 553) [(10, 1), (11, 1), (12, 3), (15, 1)],
  term ((119808 : Rat) / 553) [(10, 1), (11, 1), (13, 2), (14, 1), (15, 1)],
  term ((-22464 : Rat) / 553) [(10, 1), (11, 1), (13, 2), (15, 1)],
  term ((2496 : Rat) / 553) [(10, 1), (11, 1), (13, 3)],
  term ((74880 : Rat) / 553) [(10, 1), (11, 1), (13, 3), (14, 1)],
  term ((40 : Rat) / 21) [(10, 1), (12, 1)],
  term ((27567777768901 : Rat) / 177616607868) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-209 : Rat) / 14) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-14652110343103 : Rat) / 152242806744) [(10, 1), (12, 1), (13, 1), (15, 1)],
  term ((229 : Rat) / 84) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((5075656278515 : Rat) / 532849823604) [(10, 1), (12, 1), (13, 2)],
  term ((-2926995536123 : Rat) / 266424911802) [(10, 1), (12, 1), (13, 2), (14, 1)],
  term ((-55 : Rat) / 7) [(10, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((122667682763 : Rat) / 44404151967) [(10, 1), (12, 1), (13, 2), (15, 2)],
  term ((24 : Rat) / 7) [(10, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-5 : Rat) / 6) [(10, 1), (12, 1), (13, 2), (16, 1)],
  term ((-2926995536123 : Rat) / 532849823604) [(10, 1), (12, 1), (13, 3), (15, 1)],
  term ((-55 : Rat) / 14) [(10, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((5516346701922065 : Rat) / 4973265020304) [(10, 1), (12, 1), (14, 1)],
  term ((-3366906314273 : Rat) / 14801383989) [(10, 1), (12, 1), (14, 1), (15, 2)],
  term ((130 : Rat) / 7) [(10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-7183625070497 : Rat) / 36722421036) [(10, 1), (12, 1), (14, 2)],
  term ((2118317057335 : Rat) / 12686900562) [(10, 1), (12, 1), (15, 2)],
  term ((-13 : Rat) / 7) [(10, 1), (12, 1), (15, 2), (16, 1)],
  term ((20 : Rat) / 7) [(10, 1), (12, 2)],
  term ((-27567777768901 : Rat) / 355233215736) [(10, 1), (12, 2), (13, 1), (14, 1), (15, 1)],
  term ((209 : Rat) / 28) [(10, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((125980736690705 : Rat) / 2131399294416) [(10, 1), (12, 2), (13, 1), (15, 1)],
  term ((1091 : Rat) / 168) [(10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-6090608323475 : Rat) / 1065699647208) [(10, 1), (12, 2), (13, 2)],
  term ((2926995536123 : Rat) / 532849823604) [(10, 1), (12, 2), (13, 2), (14, 1)],
  term ((55 : Rat) / 14) [(10, 1), (12, 2), (13, 2), (14, 1), (16, 1)],
  term ((5 : Rat) / 12) [(10, 1), (12, 2), (13, 2), (16, 1)],
  term ((-5516346701922065 : Rat) / 9946530040608) [(10, 1), (12, 2), (14, 1)],
  term ((3366906314273 : Rat) / 29602767978) [(10, 1), (12, 2), (14, 1), (15, 2)],
  term ((-65 : Rat) / 7) [(10, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((7183625070497 : Rat) / 73444842072) [(10, 1), (12, 2), (14, 2)],
  term ((-15809560863449 : Rat) / 177616607868) [(10, 1), (12, 2), (15, 2)],
  term ((-83 : Rat) / 14) [(10, 1), (12, 2), (15, 2), (16, 1)],
  term ((-40 : Rat) / 21) [(10, 1), (12, 3)],
  term ((-2926995536123 : Rat) / 532849823604) [(10, 1), (12, 3), (13, 1), (15, 1)],
  term ((-55 : Rat) / 14) [(10, 1), (12, 3), (13, 1), (15, 1), (16, 1)],
  term ((122667682763 : Rat) / 44404151967) [(10, 1), (12, 3), (15, 2)],
  term ((24 : Rat) / 7) [(10, 1), (12, 3), (15, 2), (16, 1)],
  term ((-20 : Rat) / 21) [(10, 1), (13, 2)],
  term ((-5516346701922065 : Rat) / 9946530040608) [(10, 1), (13, 2), (14, 1)],
  term ((3366906314273 : Rat) / 29602767978) [(10, 1), (13, 2), (14, 1), (15, 2)],
  term ((-65 : Rat) / 7) [(10, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((7183625070497 : Rat) / 73444842072) [(10, 1), (13, 2), (14, 2)],
  term ((-2118317057335 : Rat) / 25373801124) [(10, 1), (13, 2), (15, 2)],
  term ((13 : Rat) / 14) [(10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-27567777768901 : Rat) / 355233215736) [(10, 1), (13, 3), (14, 1), (15, 1)],
  term ((209 : Rat) / 28) [(10, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((14652110343103 : Rat) / 304485613488) [(10, 1), (13, 3), (15, 1)],
  term ((-229 : Rat) / 168) [(10, 1), (13, 3), (15, 1), (16, 1)],
  term ((-6090608323475 : Rat) / 1065699647208) [(10, 1), (13, 4)],
  term ((2926995536123 : Rat) / 532849823604) [(10, 1), (13, 4), (14, 1)],
  term ((55 : Rat) / 14) [(10, 1), (13, 4), (14, 1), (16, 1)],
  term ((5 : Rat) / 12) [(10, 1), (13, 4), (16, 1)],
  term ((82604286814447 : Rat) / 710466431472) [(11, 1), (12, 1), (13, 1)],
  term ((17223128934131 : Rat) / 59205535956) [(11, 1), (12, 1), (13, 1), (14, 1)],
  term ((55 : Rat) / 14) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-119808 : Rat) / 553) [(11, 1), (12, 1), (13, 1), (14, 2)],
  term ((2954048478533 : Rat) / 19735178652) [(11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-305 : Rat) / 14) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-425 : Rat) / 168) [(11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-59904 : Rat) / 553) [(11, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((19010145608882 : Rat) / 133212455901) [(11, 1), (12, 1), (13, 2), (15, 1)],
  term ((158997915105415 : Rat) / 8703213785532) [(11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-24 : Rat) / 7) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((16750397217974951 : Rat) / 14919795060912) [(11, 1), (12, 1), (15, 1)],
  term ((95 : Rat) / 42) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3366906314273 : Rat) / 14801383989) [(11, 1), (12, 1), (15, 3)],
  term ((130 : Rat) / 7) [(11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-82604286814447 : Rat) / 1420932862944) [(11, 1), (12, 2), (13, 1)],
  term ((-17223128934131 : Rat) / 118411071912) [(11, 1), (12, 2), (13, 1), (14, 1)],
  term ((-55 : Rat) / 28) [(11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((59904 : Rat) / 553) [(11, 1), (12, 2), (13, 1), (14, 2)],
  term ((-2954048478533 : Rat) / 39470357304) [(11, 1), (12, 2), (13, 1), (15, 2)],
  term ((305 : Rat) / 28) [(11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((425 : Rat) / 336) [(11, 1), (12, 2), (13, 1), (16, 1)],
  term ((3612121930164089 : Rat) / 17406427571064) [(11, 1), (12, 2), (14, 1), (15, 1)],
  term ((12 : Rat) / 7) [(11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-25266942450754087 : Rat) / 29839590121824) [(11, 1), (12, 2), (15, 1)],
  term ((-95 : Rat) / 84) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((3366906314273 : Rat) / 29602767978) [(11, 1), (12, 2), (15, 3)],
  term ((-65 : Rat) / 7) [(11, 1), (12, 2), (15, 3), (16, 1)],
  term ((-59904 : Rat) / 553) [(11, 1), (12, 3), (14, 1), (15, 1)],
  term ((19010145608882 : Rat) / 133212455901) [(11, 1), (12, 3), (15, 1)],
  term ((-158997915105415 : Rat) / 17406427571064) [(11, 1), (13, 2), (14, 1), (15, 1)],
  term ((12 : Rat) / 7) [(11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-16750397217974951 : Rat) / 29839590121824) [(11, 1), (13, 2), (15, 1)],
  term ((-95 : Rat) / 84) [(11, 1), (13, 2), (15, 1), (16, 1)],
  term ((3366906314273 : Rat) / 29602767978) [(11, 1), (13, 2), (15, 3)],
  term ((-65 : Rat) / 7) [(11, 1), (13, 2), (15, 3), (16, 1)],
  term ((-82604286814447 : Rat) / 1420932862944) [(11, 1), (13, 3)],
  term ((-17223128934131 : Rat) / 118411071912) [(11, 1), (13, 3), (14, 1)],
  term ((-55 : Rat) / 28) [(11, 1), (13, 3), (14, 1), (16, 1)],
  term ((59904 : Rat) / 553) [(11, 1), (13, 3), (14, 2)],
  term ((-2954048478533 : Rat) / 39470357304) [(11, 1), (13, 3), (15, 2)],
  term ((305 : Rat) / 28) [(11, 1), (13, 3), (15, 2), (16, 1)],
  term ((425 : Rat) / 336) [(11, 1), (13, 3), (16, 1)],
  term ((-57408 : Rat) / 553) [(11, 2), (12, 1)],
  term ((74880 : Rat) / 553) [(11, 2), (12, 1), (14, 1)],
  term ((-239616 : Rat) / 553) [(11, 2), (12, 1), (15, 2)],
  term ((28704 : Rat) / 553) [(11, 2), (12, 2)],
  term ((-37440 : Rat) / 553) [(11, 2), (12, 2), (14, 1)],
  term ((119808 : Rat) / 553) [(11, 2), (12, 2), (15, 2)],
  term ((28704 : Rat) / 553) [(11, 2), (13, 2)],
  term ((-37440 : Rat) / 553) [(11, 2), (13, 2), (14, 1)],
  term ((119808 : Rat) / 553) [(11, 2), (13, 2), (15, 2)],
  term ((-7619815395993929 : Rat) / 17406427571064) [(12, 1), (13, 1), (14, 1), (15, 1)],
  term ((1345 : Rat) / 84) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2187255370987 : Rat) / 9867589326) [(12, 1), (13, 1), (14, 2), (15, 1)],
  term ((73 : Rat) / 7) [(12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((4647325625945039 : Rat) / 34812855142128) [(12, 1), (13, 1), (15, 1)],
  term ((-353 : Rat) / 168) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-107702282455975 : Rat) / 1065699647208) [(12, 1), (13, 2)],
  term ((437042843123611 : Rat) / 2131399294416) [(12, 1), (13, 2), (14, 1)],
  term ((2187255370987 : Rat) / 19735178652) [(12, 1), (13, 2), (14, 1), (15, 2)],
  term ((73 : Rat) / 14) [(12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-45 : Rat) / 56) [(12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-2629582380889 : Rat) / 118411071912) [(12, 1), (13, 2), (14, 2)],
  term ((-345 : Rat) / 28) [(12, 1), (13, 2), (14, 2), (16, 1)],
  term ((-2001591001496153 : Rat) / 8703213785532) [(12, 1), (13, 2), (15, 2)],
  term ((155 : Rat) / 84) [(12, 1), (13, 2), (15, 2), (16, 1)],
  term ((475 : Rat) / 84) [(12, 1), (13, 2), (16, 1)],
  term ((-2629582380889 : Rat) / 236822143824) [(12, 1), (13, 3), (14, 1), (15, 1)],
  term ((-345 : Rat) / 56) [(12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((389178307824539 : Rat) / 4262798588832) [(12, 1), (13, 3), (15, 1)],
  term ((-45 : Rat) / 112) [(12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-956271586230683 : Rat) / 52219282713192) [(12, 1), (14, 1)],
  term ((5672111551053023 : Rat) / 14919795060912) [(12, 1), (14, 1), (15, 2)],
  term ((-73 : Rat) / 7) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-32 : Rat) / 21) [(12, 1), (14, 1), (16, 1)],
  term ((35854195703665523 : Rat) / 208877130852768) [(12, 1), (14, 2)],
  term ((32 : Rat) / 21) [(12, 1), (14, 2), (16, 1)],
  term ((8979241671985367 : Rat) / 14919795060912) [(12, 1), (14, 3)],
  term ((-157351447131873349 : Rat) / 208877130852768) [(12, 1), (15, 2)],
  term ((-53 : Rat) / 14) [(12, 1), (15, 2), (16, 1)],
  term ((2444668745291 : Rat) / 133212455901) [(12, 2)],
  term ((8392912615975295 : Rat) / 34812855142128) [(12, 2), (13, 1), (14, 1), (15, 1)],
  term ((725 : Rat) / 168) [(12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2187255370987 : Rat) / 19735178652) [(12, 2), (13, 1), (14, 2), (15, 1)],
  term ((-73 : Rat) / 14) [(12, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-52081451044639939 : Rat) / 208877130852768) [(12, 2), (13, 1), (15, 1)],
  term ((89 : Rat) / 48) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((97923607474811 : Rat) / 2131399294416) [(12, 2), (13, 2)],
  term ((-389178307824539 : Rat) / 4262798588832) [(12, 2), (13, 2), (14, 1)],
  term ((45 : Rat) / 112) [(12, 2), (13, 2), (14, 1), (16, 1)],
  term ((2629582380889 : Rat) / 236822143824) [(12, 2), (13, 2), (14, 2)],
  term ((345 : Rat) / 56) [(12, 2), (13, 2), (14, 2), (16, 1)],
  term ((-475 : Rat) / 168) [(12, 2), (13, 2), (16, 1)],
  term ((-3734452873078373 : Rat) / 104438565426384) [(12, 2), (14, 1)],
  term ((-12286371792917711 : Rat) / 29839590121824) [(12, 2), (14, 1), (15, 2)],
  term ((-73 : Rat) / 14) [(12, 2), (14, 1), (15, 2), (16, 1)],
  term ((16 : Rat) / 21) [(12, 2), (14, 1), (16, 1)],
  term ((-35854195703665523 : Rat) / 417754261705536) [(12, 2), (14, 2)],
  term ((-16 : Rat) / 21) [(12, 2), (14, 2), (16, 1)],
  term ((-8979241671985367 : Rat) / 29839590121824) [(12, 2), (14, 3)],
  term ((349504183275504037 : Rat) / 417754261705536) [(12, 2), (15, 2)],
  term ((-151 : Rat) / 84) [(12, 2), (15, 2), (16, 1)],
  term ((-2444668745291 : Rat) / 266424911802) [(12, 3)],
  term ((-2629582380889 : Rat) / 236822143824) [(12, 3), (13, 1), (14, 1), (15, 1)],
  term ((-345 : Rat) / 56) [(12, 3), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((389178307824539 : Rat) / 4262798588832) [(12, 3), (13, 1), (15, 1)],
  term ((-45 : Rat) / 112) [(12, 3), (13, 1), (15, 1), (16, 1)],
  term ((2991533456192 : Rat) / 133212455901) [(12, 3), (14, 1)],
  term ((2187255370987 : Rat) / 19735178652) [(12, 3), (14, 1), (15, 2)],
  term ((73 : Rat) / 14) [(12, 3), (14, 1), (15, 2), (16, 1)],
  term ((-2001591001496153 : Rat) / 8703213785532) [(12, 3), (15, 2)],
  term ((155 : Rat) / 84) [(12, 3), (15, 2), (16, 1)],
  term ((956271586230683 : Rat) / 104438565426384) [(13, 2), (14, 1)],
  term ((-5672111551053023 : Rat) / 29839590121824) [(13, 2), (14, 1), (15, 2)],
  term ((73 : Rat) / 14) [(13, 2), (14, 1), (15, 2), (16, 1)],
  term ((16 : Rat) / 21) [(13, 2), (14, 1), (16, 1)],
  term ((-35854195703665523 : Rat) / 417754261705536) [(13, 2), (14, 2)],
  term ((-16 : Rat) / 21) [(13, 2), (14, 2), (16, 1)],
  term ((-8979241671985367 : Rat) / 29839590121824) [(13, 2), (14, 3)],
  term ((157351447131873349 : Rat) / 417754261705536) [(13, 2), (15, 2)],
  term ((53 : Rat) / 28) [(13, 2), (15, 2), (16, 1)],
  term ((7619815395993929 : Rat) / 34812855142128) [(13, 3), (14, 1), (15, 1)],
  term ((-1345 : Rat) / 168) [(13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-2187255370987 : Rat) / 19735178652) [(13, 3), (14, 2), (15, 1)],
  term ((-73 : Rat) / 14) [(13, 3), (14, 2), (15, 1), (16, 1)],
  term ((-4647325625945039 : Rat) / 69625710284256) [(13, 3), (15, 1)],
  term ((353 : Rat) / 336) [(13, 3), (15, 1), (16, 1)],
  term ((97923607474811 : Rat) / 2131399294416) [(13, 4)],
  term ((-389178307824539 : Rat) / 4262798588832) [(13, 4), (14, 1)],
  term ((45 : Rat) / 112) [(13, 4), (14, 1), (16, 1)],
  term ((2629582380889 : Rat) / 236822143824) [(13, 4), (14, 2)],
  term ((345 : Rat) / 56) [(13, 4), (14, 2), (16, 1)],
  term ((-475 : Rat) / 168) [(13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 4, terms 300 through 384. -/
theorem rs_R009_ueqv_R009YNNNN_block_04_0300_0384_valid :
    checkProductSumEq rs_R009_ueqv_R009YNNNN_partials_04_0300_0384
      rs_R009_ueqv_R009YNNNN_block_04_0300_0384 = true := by
  native_decide

end R009UeqvR009YNNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
