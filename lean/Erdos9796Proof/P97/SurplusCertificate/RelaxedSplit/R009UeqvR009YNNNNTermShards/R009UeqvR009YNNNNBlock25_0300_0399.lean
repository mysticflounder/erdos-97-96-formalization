/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009YNNNN, term block 25:300-399

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009YNNNNTermShards

/-- Generator polynomial 25 for relaxed split surplus certificate `R009:u=v:R009YNNNN`. -/
def rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 : Poly :=
[
  term (-2 : Rat) [(0, 1), (12, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (13, 1)],
  term (1 : Rat) [(1, 2)]
]

/-- Coefficient term 300 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0300 : Poly :=
[
  term ((-2172201733 : Rat) / 666166368) [(9, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 300 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0300 : Poly :=
[
  term ((2172201733 : Rat) / 333083184) [(0, 1), (9, 1), (12, 2), (14, 1), (15, 1)],
  term ((-2172201733 : Rat) / 666166368) [(0, 2), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((2172201733 : Rat) / 333083184) [(1, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-2172201733 : Rat) / 666166368) [(1, 2), (9, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 300 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0300_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0300
        rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_25_0300 := by
  native_decide

/-- Coefficient term 301 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0301 : Poly :=
[
  term ((10110568816218515 : Rat) / 139251420568512) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 301 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0301 : Poly :=
[
  term ((-10110568816218515 : Rat) / 69625710284256) [(0, 1), (9, 1), (12, 2), (15, 1)],
  term ((10110568816218515 : Rat) / 139251420568512) [(0, 2), (9, 1), (12, 1), (15, 1)],
  term ((-10110568816218515 : Rat) / 69625710284256) [(1, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((10110568816218515 : Rat) / 139251420568512) [(1, 2), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 301 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0301_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0301
        rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_25_0301 := by
  native_decide

/-- Coefficient term 302 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0302 : Poly :=
[
  term ((-32 : Rat) / 7) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 302 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0302 : Poly :=
[
  term ((64 : Rat) / 7) [(0, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-32 : Rat) / 7) [(0, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((64 : Rat) / 7) [(1, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 7) [(1, 2), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 302 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0302_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0302
        rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_25_0302 := by
  native_decide

/-- Coefficient term 303 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0303 : Poly :=
[
  term ((-143321015097247 : Rat) / 1217942453952) [(9, 1), (13, 1)]
]

/-- Partial product 303 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0303 : Poly :=
[
  term ((143321015097247 : Rat) / 608971226976) [(0, 1), (9, 1), (12, 1), (13, 1)],
  term ((-143321015097247 : Rat) / 1217942453952) [(0, 2), (9, 1), (13, 1)],
  term ((143321015097247 : Rat) / 608971226976) [(1, 1), (9, 1), (13, 2)],
  term ((-143321015097247 : Rat) / 1217942453952) [(1, 2), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 303 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0303_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0303
        rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_25_0303 := by
  native_decide

/-- Coefficient term 304 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0304 : Poly :=
[
  term ((22981248325897669 : Rat) / 25576791532992) [(9, 1), (13, 1), (14, 1)]
]

/-- Partial product 304 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0304 : Poly :=
[
  term ((-22981248325897669 : Rat) / 12788395766496) [(0, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((22981248325897669 : Rat) / 25576791532992) [(0, 2), (9, 1), (13, 1), (14, 1)],
  term ((-22981248325897669 : Rat) / 12788395766496) [(1, 1), (9, 1), (13, 2), (14, 1)],
  term ((22981248325897669 : Rat) / 25576791532992) [(1, 2), (9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 304 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0304_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0304
        rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_25_0304 := by
  native_decide

/-- Coefficient term 305 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0305 : Poly :=
[
  term ((415 : Rat) / 84) [(9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 305 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0305 : Poly :=
[
  term ((-415 : Rat) / 42) [(0, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((415 : Rat) / 84) [(0, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-415 : Rat) / 42) [(1, 1), (9, 1), (13, 2), (14, 1), (16, 1)],
  term ((415 : Rat) / 84) [(1, 2), (9, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 305 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0305_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0305
        rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_25_0305 := by
  native_decide

/-- Coefficient term 306 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0306 : Poly :=
[
  term ((6422908767787 : Rat) / 157881429216) [(9, 1), (13, 1), (14, 2)]
]

/-- Partial product 306 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0306 : Poly :=
[
  term ((-6422908767787 : Rat) / 78940714608) [(0, 1), (9, 1), (12, 1), (13, 1), (14, 2)],
  term ((6422908767787 : Rat) / 157881429216) [(0, 2), (9, 1), (13, 1), (14, 2)],
  term ((-6422908767787 : Rat) / 78940714608) [(1, 1), (9, 1), (13, 2), (14, 2)],
  term ((6422908767787 : Rat) / 157881429216) [(1, 2), (9, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 306 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0306_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0306
        rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_25_0306 := by
  native_decide

/-- Coefficient term 307 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0307 : Poly :=
[
  term ((-305 : Rat) / 56) [(9, 1), (13, 1), (14, 2), (16, 1)]
]

/-- Partial product 307 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0307 : Poly :=
[
  term ((305 : Rat) / 28) [(0, 1), (9, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-305 : Rat) / 56) [(0, 2), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((305 : Rat) / 28) [(1, 1), (9, 1), (13, 2), (14, 2), (16, 1)],
  term ((-305 : Rat) / 56) [(1, 2), (9, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 307 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0307_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0307
        rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_25_0307 := by
  native_decide

/-- Coefficient term 308 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0308 : Poly :=
[
  term ((-2954048478533 : Rat) / 78940714608) [(9, 1), (13, 1), (15, 2)]
]

/-- Partial product 308 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0308 : Poly :=
[
  term ((2954048478533 : Rat) / 39470357304) [(0, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((-2954048478533 : Rat) / 78940714608) [(0, 2), (9, 1), (13, 1), (15, 2)],
  term ((2954048478533 : Rat) / 39470357304) [(1, 1), (9, 1), (13, 2), (15, 2)],
  term ((-2954048478533 : Rat) / 78940714608) [(1, 2), (9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 308 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0308_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0308
        rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_25_0308 := by
  native_decide

/-- Coefficient term 309 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0309 : Poly :=
[
  term ((305 : Rat) / 56) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 309 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0309 : Poly :=
[
  term ((-305 : Rat) / 28) [(0, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((305 : Rat) / 56) [(0, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-305 : Rat) / 28) [(1, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((305 : Rat) / 56) [(1, 2), (9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 309 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0309_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0309
        rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_25_0309 := by
  native_decide

/-- Coefficient term 310 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0310 : Poly :=
[
  term ((2465 : Rat) / 336) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 310 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0310 : Poly :=
[
  term ((-2465 : Rat) / 168) [(0, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((2465 : Rat) / 336) [(0, 2), (9, 1), (13, 1), (16, 1)],
  term ((-2465 : Rat) / 168) [(1, 1), (9, 1), (13, 2), (16, 1)],
  term ((2465 : Rat) / 336) [(1, 2), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 310 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0310_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0310
        rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_25_0310 := by
  native_decide

/-- Coefficient term 311 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0311 : Poly :=
[
  term ((-2029318579405679 : Rat) / 11604285047376) [(9, 1), (14, 1), (15, 1)]
]

/-- Partial product 311 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0311 : Poly :=
[
  term ((2029318579405679 : Rat) / 5802142523688) [(0, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-2029318579405679 : Rat) / 11604285047376) [(0, 2), (9, 1), (14, 1), (15, 1)],
  term ((2029318579405679 : Rat) / 5802142523688) [(1, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((-2029318579405679 : Rat) / 11604285047376) [(1, 2), (9, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 311 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0311_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0311
        rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_25_0311 := by
  native_decide

/-- Coefficient term 312 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0312 : Poly :=
[
  term ((-89 : Rat) / 21) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 312 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0312 : Poly :=
[
  term ((178 : Rat) / 21) [(0, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-89 : Rat) / 21) [(0, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((178 : Rat) / 21) [(1, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-89 : Rat) / 21) [(1, 2), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 312 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0312_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0312
        rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_25_0312 := by
  native_decide

/-- Coefficient term 313 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0313 : Poly :=
[
  term ((-3366906314273 : Rat) / 59205535956) [(9, 1), (14, 2), (15, 1)]
]

/-- Partial product 313 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0313 : Poly :=
[
  term ((3366906314273 : Rat) / 29602767978) [(0, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((-3366906314273 : Rat) / 59205535956) [(0, 2), (9, 1), (14, 2), (15, 1)],
  term ((3366906314273 : Rat) / 29602767978) [(1, 1), (9, 1), (13, 1), (14, 2), (15, 1)],
  term ((-3366906314273 : Rat) / 59205535956) [(1, 2), (9, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 313 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0313_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0313
        rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_25_0313 := by
  native_decide

/-- Coefficient term 314 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0314 : Poly :=
[
  term ((65 : Rat) / 14) [(9, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 314 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0314 : Poly :=
[
  term ((-65 : Rat) / 7) [(0, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((65 : Rat) / 14) [(0, 2), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-65 : Rat) / 7) [(1, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((65 : Rat) / 14) [(1, 2), (9, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 314 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0314_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0314
        rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_25_0314 := by
  native_decide

/-- Coefficient term 315 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0315 : Poly :=
[
  term ((326074777948363 : Rat) / 15472380063168) [(9, 1), (15, 1)]
]

/-- Partial product 315 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0315 : Poly :=
[
  term ((-326074777948363 : Rat) / 7736190031584) [(0, 1), (9, 1), (12, 1), (15, 1)],
  term ((326074777948363 : Rat) / 15472380063168) [(0, 2), (9, 1), (15, 1)],
  term ((-326074777948363 : Rat) / 7736190031584) [(1, 1), (9, 1), (13, 1), (15, 1)],
  term ((326074777948363 : Rat) / 15472380063168) [(1, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 315 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0315_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0315
        rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_25_0315 := by
  native_decide

/-- Coefficient term 316 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0316 : Poly :=
[
  term ((-481 : Rat) / 84) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 316 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0316 : Poly :=
[
  term ((481 : Rat) / 42) [(0, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-481 : Rat) / 84) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((481 : Rat) / 42) [(1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-481 : Rat) / 84) [(1, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 316 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0316_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0316
        rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_25_0316 := by
  native_decide

/-- Coefficient term 317 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0317 : Poly :=
[
  term ((3366906314273 : Rat) / 59205535956) [(9, 1), (15, 3)]
]

/-- Partial product 317 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0317 : Poly :=
[
  term ((-3366906314273 : Rat) / 29602767978) [(0, 1), (9, 1), (12, 1), (15, 3)],
  term ((3366906314273 : Rat) / 59205535956) [(0, 2), (9, 1), (15, 3)],
  term ((-3366906314273 : Rat) / 29602767978) [(1, 1), (9, 1), (13, 1), (15, 3)],
  term ((3366906314273 : Rat) / 59205535956) [(1, 2), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 317 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0317_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0317
        rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_25_0317 := by
  native_decide

/-- Coefficient term 318 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0318 : Poly :=
[
  term ((-65 : Rat) / 14) [(9, 1), (15, 3), (16, 1)]
]

/-- Partial product 318 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0318 : Poly :=
[
  term ((65 : Rat) / 7) [(0, 1), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((-65 : Rat) / 14) [(0, 2), (9, 1), (15, 3), (16, 1)],
  term ((65 : Rat) / 7) [(1, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((-65 : Rat) / 14) [(1, 2), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 318 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0318_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0318
        rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_25_0318 := by
  native_decide

/-- Coefficient term 319 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0319 : Poly :=
[
  term ((-46590317010445 : Rat) / 2841865725888) [(9, 2)]
]

/-- Partial product 319 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0319 : Poly :=
[
  term ((46590317010445 : Rat) / 1420932862944) [(0, 1), (9, 2), (12, 1)],
  term ((-46590317010445 : Rat) / 2841865725888) [(0, 2), (9, 2)],
  term ((46590317010445 : Rat) / 1420932862944) [(1, 1), (9, 2), (13, 1)],
  term ((-46590317010445 : Rat) / 2841865725888) [(1, 2), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 319 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0319_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0319
        rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_25_0319 := by
  native_decide

/-- Coefficient term 320 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0320 : Poly :=
[
  term ((10861008665 : Rat) / 2569498848) [(9, 2), (10, 1)]
]

/-- Partial product 320 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0320 : Poly :=
[
  term ((-10861008665 : Rat) / 1284749424) [(0, 1), (9, 2), (10, 1), (12, 1)],
  term ((10861008665 : Rat) / 2569498848) [(0, 2), (9, 2), (10, 1)],
  term ((-10861008665 : Rat) / 1284749424) [(1, 1), (9, 2), (10, 1), (13, 1)],
  term ((10861008665 : Rat) / 2569498848) [(1, 2), (9, 2), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 320 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0320_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0320
        rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_25_0320 := by
  native_decide

/-- Coefficient term 321 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0321 : Poly :=
[
  term ((-67338253723 : Rat) / 4496622984) [(9, 2), (10, 1), (12, 1)]
]

/-- Partial product 321 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0321 : Poly :=
[
  term ((67338253723 : Rat) / 2248311492) [(0, 1), (9, 2), (10, 1), (12, 2)],
  term ((-67338253723 : Rat) / 4496622984) [(0, 2), (9, 2), (10, 1), (12, 1)],
  term ((67338253723 : Rat) / 2248311492) [(1, 1), (9, 2), (10, 1), (12, 1), (13, 1)],
  term ((-67338253723 : Rat) / 4496622984) [(1, 2), (9, 2), (10, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 321 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0321_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0321
        rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_25_0321 := by
  native_decide

/-- Coefficient term 322 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0322 : Poly :=
[
  term ((2172201733 : Rat) / 333083184) [(9, 2), (10, 1), (14, 1)]
]

/-- Partial product 322 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0322 : Poly :=
[
  term ((-2172201733 : Rat) / 166541592) [(0, 1), (9, 2), (10, 1), (12, 1), (14, 1)],
  term ((2172201733 : Rat) / 333083184) [(0, 2), (9, 2), (10, 1), (14, 1)],
  term ((-2172201733 : Rat) / 166541592) [(1, 1), (9, 2), (10, 1), (13, 1), (14, 1)],
  term ((2172201733 : Rat) / 333083184) [(1, 2), (9, 2), (10, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 322 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0322_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0322
        rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_25_0322 := by
  native_decide

/-- Coefficient term 323 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0323 : Poly :=
[
  term ((997316410233 : Rat) / 8771190512) [(9, 2), (12, 1)]
]

/-- Partial product 323 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0323 : Poly :=
[
  term ((-997316410233 : Rat) / 4385595256) [(0, 1), (9, 2), (12, 2)],
  term ((997316410233 : Rat) / 8771190512) [(0, 2), (9, 2), (12, 1)],
  term ((-997316410233 : Rat) / 4385595256) [(1, 1), (9, 2), (12, 1), (13, 1)],
  term ((997316410233 : Rat) / 8771190512) [(1, 2), (9, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 323 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0323_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0323
        rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_25_0323 := by
  native_decide

/-- Coefficient term 324 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0324 : Poly :=
[
  term ((2327751740719133 : Rat) / 34812855142128) [(9, 2), (14, 1)]
]

/-- Partial product 324 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0324 : Poly :=
[
  term ((-2327751740719133 : Rat) / 17406427571064) [(0, 1), (9, 2), (12, 1), (14, 1)],
  term ((2327751740719133 : Rat) / 34812855142128) [(0, 2), (9, 2), (14, 1)],
  term ((-2327751740719133 : Rat) / 17406427571064) [(1, 1), (9, 2), (13, 1), (14, 1)],
  term ((2327751740719133 : Rat) / 34812855142128) [(1, 2), (9, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 324 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0324_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0324
        rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_25_0324 := by
  native_decide

/-- Coefficient term 325 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0325 : Poly :=
[
  term ((-210703568101 : Rat) / 5995497312) [(9, 2), (14, 2)]
]

/-- Partial product 325 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0325 : Poly :=
[
  term ((210703568101 : Rat) / 2997748656) [(0, 1), (9, 2), (12, 1), (14, 2)],
  term ((-210703568101 : Rat) / 5995497312) [(0, 2), (9, 2), (14, 2)],
  term ((210703568101 : Rat) / 2997748656) [(1, 1), (9, 2), (13, 1), (14, 2)],
  term ((-210703568101 : Rat) / 5995497312) [(1, 2), (9, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 325 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0325_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0325
        rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_25_0325 := by
  native_decide

/-- Coefficient term 326 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0326 : Poly :=
[
  term ((210703568101 : Rat) / 5995497312) [(9, 2), (15, 2)]
]

/-- Partial product 326 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0326 : Poly :=
[
  term ((-210703568101 : Rat) / 2997748656) [(0, 1), (9, 2), (12, 1), (15, 2)],
  term ((210703568101 : Rat) / 5995497312) [(0, 2), (9, 2), (15, 2)],
  term ((-210703568101 : Rat) / 2997748656) [(1, 1), (9, 2), (13, 1), (15, 2)],
  term ((210703568101 : Rat) / 5995497312) [(1, 2), (9, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 326 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0326_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0326
        rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_25_0326 := by
  native_decide

/-- Coefficient term 327 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0327 : Poly :=
[
  term ((315513675695 : Rat) / 12686900562) [(10, 1)]
]

/-- Partial product 327 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0327 : Poly :=
[
  term ((-315513675695 : Rat) / 6343450281) [(0, 1), (10, 1), (12, 1)],
  term ((315513675695 : Rat) / 12686900562) [(0, 2), (10, 1)],
  term ((-315513675695 : Rat) / 6343450281) [(1, 1), (10, 1), (13, 1)],
  term ((315513675695 : Rat) / 12686900562) [(1, 2), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 327 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0327_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0327
        rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_25_0327 := by
  native_decide

/-- Coefficient term 328 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0328 : Poly :=
[
  term ((-74880 : Rat) / 553) [(10, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 328 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0328 : Poly :=
[
  term ((149760 : Rat) / 553) [(0, 1), (10, 1), (11, 1), (12, 2), (15, 1)],
  term ((-74880 : Rat) / 553) [(0, 2), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((149760 : Rat) / 553) [(1, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-74880 : Rat) / 553) [(1, 2), (10, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 328 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0328_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0328
        rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_25_0328 := by
  native_decide

/-- Coefficient term 329 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0329 : Poly :=
[
  term ((-77376 : Rat) / 553) [(10, 1), (11, 1), (13, 1)]
]

/-- Partial product 329 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0329 : Poly :=
[
  term ((154752 : Rat) / 553) [(0, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((-77376 : Rat) / 553) [(0, 2), (10, 1), (11, 1), (13, 1)],
  term ((154752 : Rat) / 553) [(1, 1), (10, 1), (11, 1), (13, 2)],
  term ((-77376 : Rat) / 553) [(1, 2), (10, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 329 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0329_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0329
        rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_25_0329 := by
  native_decide

/-- Coefficient term 330 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0330 : Poly :=
[
  term ((74880 : Rat) / 553) [(10, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 330 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0330 : Poly :=
[
  term ((-149760 : Rat) / 553) [(0, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((74880 : Rat) / 553) [(0, 2), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-149760 : Rat) / 553) [(1, 1), (10, 1), (11, 1), (13, 2), (14, 1)],
  term ((74880 : Rat) / 553) [(1, 2), (10, 1), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 330 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0330_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0330
        rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_25_0330 := by
  native_decide

/-- Coefficient term 331 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0331 : Poly :=
[
  term ((119808 : Rat) / 553) [(10, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 331 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0331 : Poly :=
[
  term ((-239616 : Rat) / 553) [(0, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((119808 : Rat) / 553) [(0, 2), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-239616 : Rat) / 553) [(1, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((119808 : Rat) / 553) [(1, 2), (10, 1), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 331 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0331_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0331
        rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_25_0331 := by
  native_decide

/-- Coefficient term 332 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0332 : Poly :=
[
  term ((-22464 : Rat) / 553) [(10, 1), (11, 1), (15, 1)]
]

/-- Partial product 332 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0332 : Poly :=
[
  term ((44928 : Rat) / 553) [(0, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-22464 : Rat) / 553) [(0, 2), (10, 1), (11, 1), (15, 1)],
  term ((44928 : Rat) / 553) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-22464 : Rat) / 553) [(1, 2), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 332 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0332_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0332
        rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_25_0332 := by
  native_decide

/-- Coefficient term 333 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0333 : Poly :=
[
  term ((-40 : Rat) / 21) [(10, 1), (12, 1)]
]

/-- Partial product 333 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0333 : Poly :=
[
  term ((80 : Rat) / 21) [(0, 1), (10, 1), (12, 2)],
  term ((-40 : Rat) / 21) [(0, 2), (10, 1), (12, 1)],
  term ((80 : Rat) / 21) [(1, 1), (10, 1), (12, 1), (13, 1)],
  term ((-40 : Rat) / 21) [(1, 2), (10, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 333 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0333_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0333
        rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_25_0333 := by
  native_decide

/-- Coefficient term 334 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0334 : Poly :=
[
  term ((-2926995536123 : Rat) / 532849823604) [(10, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 334 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0334 : Poly :=
[
  term ((2926995536123 : Rat) / 266424911802) [(0, 1), (10, 1), (12, 2), (13, 1), (15, 1)],
  term ((-2926995536123 : Rat) / 532849823604) [(0, 2), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((2926995536123 : Rat) / 266424911802) [(1, 1), (10, 1), (12, 1), (13, 2), (15, 1)],
  term ((-2926995536123 : Rat) / 532849823604) [(1, 2), (10, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 334 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0334_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0334
        rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_25_0334 := by
  native_decide

/-- Coefficient term 335 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0335 : Poly :=
[
  term ((-55 : Rat) / 14) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 335 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0335 : Poly :=
[
  term ((55 : Rat) / 7) [(0, 1), (10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-55 : Rat) / 14) [(0, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((55 : Rat) / 7) [(1, 1), (10, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-55 : Rat) / 14) [(1, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 335 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0335_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0335
        rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_25_0335 := by
  native_decide

/-- Coefficient term 336 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0336 : Poly :=
[
  term ((122667682763 : Rat) / 44404151967) [(10, 1), (12, 1), (15, 2)]
]

/-- Partial product 336 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0336 : Poly :=
[
  term ((-245335365526 : Rat) / 44404151967) [(0, 1), (10, 1), (12, 2), (15, 2)],
  term ((122667682763 : Rat) / 44404151967) [(0, 2), (10, 1), (12, 1), (15, 2)],
  term ((-245335365526 : Rat) / 44404151967) [(1, 1), (10, 1), (12, 1), (13, 1), (15, 2)],
  term ((122667682763 : Rat) / 44404151967) [(1, 2), (10, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 336 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0336_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0336
        rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_25_0336 := by
  native_decide

/-- Coefficient term 337 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0337 : Poly :=
[
  term ((24 : Rat) / 7) [(10, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 337 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0337 : Poly :=
[
  term ((-48 : Rat) / 7) [(0, 1), (10, 1), (12, 2), (15, 2), (16, 1)],
  term ((24 : Rat) / 7) [(0, 2), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-48 : Rat) / 7) [(1, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((24 : Rat) / 7) [(1, 2), (10, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 337 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0337_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0337
        rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_25_0337 := by
  native_decide

/-- Coefficient term 338 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0338 : Poly :=
[
  term ((-27567777768901 : Rat) / 355233215736) [(10, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 338 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0338 : Poly :=
[
  term ((27567777768901 : Rat) / 177616607868) [(0, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-27567777768901 : Rat) / 355233215736) [(0, 2), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((27567777768901 : Rat) / 177616607868) [(1, 1), (10, 1), (13, 2), (14, 1), (15, 1)],
  term ((-27567777768901 : Rat) / 355233215736) [(1, 2), (10, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 338 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0338_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0338
        rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_25_0338 := by
  native_decide

/-- Coefficient term 339 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0339 : Poly :=
[
  term ((209 : Rat) / 28) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 339 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0339 : Poly :=
[
  term ((-209 : Rat) / 14) [(0, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((209 : Rat) / 28) [(0, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-209 : Rat) / 14) [(1, 1), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((209 : Rat) / 28) [(1, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 339 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0339_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0339
        rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_25_0339 := by
  native_decide

/-- Coefficient term 340 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0340 : Poly :=
[
  term ((-59046730683383 : Rat) / 2131399294416) [(10, 1), (13, 1), (15, 1)]
]

/-- Partial product 340 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0340 : Poly :=
[
  term ((59046730683383 : Rat) / 1065699647208) [(0, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-59046730683383 : Rat) / 2131399294416) [(0, 2), (10, 1), (13, 1), (15, 1)],
  term ((59046730683383 : Rat) / 1065699647208) [(1, 1), (10, 1), (13, 2), (15, 1)],
  term ((-59046730683383 : Rat) / 2131399294416) [(1, 2), (10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 340 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0340_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0340
        rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_25_0340 := by
  native_decide

/-- Coefficient term 341 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0341 : Poly :=
[
  term ((811 : Rat) / 168) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 341 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0341 : Poly :=
[
  term ((-811 : Rat) / 84) [(0, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((811 : Rat) / 168) [(0, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-811 : Rat) / 84) [(1, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((811 : Rat) / 168) [(1, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 341 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0341_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0341
        rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_25_0341 := by
  native_decide

/-- Coefficient term 342 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0342 : Poly :=
[
  term ((47082264290119 : Rat) / 1065699647208) [(10, 1), (13, 2)]
]

/-- Partial product 342 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0342 : Poly :=
[
  term ((-47082264290119 : Rat) / 532849823604) [(0, 1), (10, 1), (12, 1), (13, 2)],
  term ((47082264290119 : Rat) / 1065699647208) [(0, 2), (10, 1), (13, 2)],
  term ((-47082264290119 : Rat) / 532849823604) [(1, 1), (10, 1), (13, 3)],
  term ((47082264290119 : Rat) / 1065699647208) [(1, 2), (10, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 342 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0342_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0342
        rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_25_0342 := by
  native_decide

/-- Coefficient term 343 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0343 : Poly :=
[
  term ((2926995536123 : Rat) / 532849823604) [(10, 1), (13, 2), (14, 1)]
]

/-- Partial product 343 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0343 : Poly :=
[
  term ((-2926995536123 : Rat) / 266424911802) [(0, 1), (10, 1), (12, 1), (13, 2), (14, 1)],
  term ((2926995536123 : Rat) / 532849823604) [(0, 2), (10, 1), (13, 2), (14, 1)],
  term ((-2926995536123 : Rat) / 266424911802) [(1, 1), (10, 1), (13, 3), (14, 1)],
  term ((2926995536123 : Rat) / 532849823604) [(1, 2), (10, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 343 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0343_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0343
        rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_25_0343 := by
  native_decide

/-- Coefficient term 344 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0344 : Poly :=
[
  term ((55 : Rat) / 14) [(10, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 344 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0344 : Poly :=
[
  term ((-55 : Rat) / 7) [(0, 1), (10, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((55 : Rat) / 14) [(0, 2), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((-55 : Rat) / 7) [(1, 1), (10, 1), (13, 3), (14, 1), (16, 1)],
  term ((55 : Rat) / 14) [(1, 2), (10, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 344 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0344_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0344
        rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_25_0344 := by
  native_decide

/-- Coefficient term 345 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0345 : Poly :=
[
  term ((-575 : Rat) / 84) [(10, 1), (13, 2), (16, 1)]
]

/-- Partial product 345 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0345 : Poly :=
[
  term ((575 : Rat) / 42) [(0, 1), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((-575 : Rat) / 84) [(0, 2), (10, 1), (13, 2), (16, 1)],
  term ((575 : Rat) / 42) [(1, 1), (10, 1), (13, 3), (16, 1)],
  term ((-575 : Rat) / 84) [(1, 2), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 345 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0345_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0345
        rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_25_0345 := by
  native_decide

/-- Coefficient term 346 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0346 : Poly :=
[
  term ((-45424503480285611 : Rat) / 69625710284256) [(10, 1), (14, 1)]
]

/-- Partial product 346 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0346 : Poly :=
[
  term ((45424503480285611 : Rat) / 34812855142128) [(0, 1), (10, 1), (12, 1), (14, 1)],
  term ((-45424503480285611 : Rat) / 69625710284256) [(0, 2), (10, 1), (14, 1)],
  term ((45424503480285611 : Rat) / 34812855142128) [(1, 1), (10, 1), (13, 1), (14, 1)],
  term ((-45424503480285611 : Rat) / 69625710284256) [(1, 2), (10, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 346 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0346_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0346
        rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_25_0346 := by
  native_decide

/-- Coefficient term 347 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0347 : Poly :=
[
  term ((3366906314273 : Rat) / 29602767978) [(10, 1), (14, 1), (15, 2)]
]

/-- Partial product 347 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0347 : Poly :=
[
  term ((-3366906314273 : Rat) / 14801383989) [(0, 1), (10, 1), (12, 1), (14, 1), (15, 2)],
  term ((3366906314273 : Rat) / 29602767978) [(0, 2), (10, 1), (14, 1), (15, 2)],
  term ((-3366906314273 : Rat) / 14801383989) [(1, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((3366906314273 : Rat) / 29602767978) [(1, 2), (10, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 347 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0347_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0347
        rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_25_0347 := by
  native_decide

/-- Coefficient term 348 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0348 : Poly :=
[
  term ((-65 : Rat) / 7) [(10, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 348 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0348 : Poly :=
[
  term ((130 : Rat) / 7) [(0, 1), (10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-65 : Rat) / 7) [(0, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((130 : Rat) / 7) [(1, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-65 : Rat) / 7) [(1, 2), (10, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 348 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0348_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0348
        rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_25_0348 := by
  native_decide

/-- Coefficient term 349 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0349 : Poly :=
[
  term ((7183625070497 : Rat) / 73444842072) [(10, 1), (14, 2)]
]

/-- Partial product 349 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0349 : Poly :=
[
  term ((-7183625070497 : Rat) / 36722421036) [(0, 1), (10, 1), (12, 1), (14, 2)],
  term ((7183625070497 : Rat) / 73444842072) [(0, 2), (10, 1), (14, 2)],
  term ((-7183625070497 : Rat) / 36722421036) [(1, 1), (10, 1), (13, 1), (14, 2)],
  term ((7183625070497 : Rat) / 73444842072) [(1, 2), (10, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 349 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0349_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0349
        rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_25_0349 := by
  native_decide

/-- Coefficient term 350 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0350 : Poly :=
[
  term ((-2118317057335 : Rat) / 25373801124) [(10, 1), (15, 2)]
]

/-- Partial product 350 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0350 : Poly :=
[
  term ((2118317057335 : Rat) / 12686900562) [(0, 1), (10, 1), (12, 1), (15, 2)],
  term ((-2118317057335 : Rat) / 25373801124) [(0, 2), (10, 1), (15, 2)],
  term ((2118317057335 : Rat) / 12686900562) [(1, 1), (10, 1), (13, 1), (15, 2)],
  term ((-2118317057335 : Rat) / 25373801124) [(1, 2), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 350 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0350_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0350
        rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_25_0350 := by
  native_decide

/-- Coefficient term 351 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0351 : Poly :=
[
  term ((13 : Rat) / 14) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 351 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0351 : Poly :=
[
  term ((-13 : Rat) / 7) [(0, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((13 : Rat) / 14) [(0, 2), (10, 1), (15, 2), (16, 1)],
  term ((-13 : Rat) / 7) [(1, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((13 : Rat) / 14) [(1, 2), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 351 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0351_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0351
        rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_25_0351 := by
  native_decide

/-- Coefficient term 352 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0352 : Poly :=
[
  term ((-59904 : Rat) / 553) [(11, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 352 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0352 : Poly :=
[
  term ((119808 : Rat) / 553) [(0, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((-59904 : Rat) / 553) [(0, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((119808 : Rat) / 553) [(1, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-59904 : Rat) / 553) [(1, 2), (11, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 352 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0352_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0352
        rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_25_0352 := by
  native_decide

/-- Coefficient term 353 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0353 : Poly :=
[
  term ((19010145608882 : Rat) / 133212455901) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 353 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0353 : Poly :=
[
  term ((-38020291217764 : Rat) / 133212455901) [(0, 1), (11, 1), (12, 2), (15, 1)],
  term ((19010145608882 : Rat) / 133212455901) [(0, 2), (11, 1), (12, 1), (15, 1)],
  term ((-38020291217764 : Rat) / 133212455901) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((19010145608882 : Rat) / 133212455901) [(1, 2), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 353 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0353_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0353
        rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_25_0353 := by
  native_decide

/-- Coefficient term 354 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0354 : Poly :=
[
  term ((-7118147447591 : Rat) / 157881429216) [(11, 1), (13, 1)]
]

/-- Partial product 354 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0354 : Poly :=
[
  term ((7118147447591 : Rat) / 78940714608) [(0, 1), (11, 1), (12, 1), (13, 1)],
  term ((-7118147447591 : Rat) / 157881429216) [(0, 2), (11, 1), (13, 1)],
  term ((7118147447591 : Rat) / 78940714608) [(1, 1), (11, 1), (13, 2)],
  term ((-7118147447591 : Rat) / 157881429216) [(1, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 354 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0354_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0354
        rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_25_0354 := by
  native_decide

/-- Coefficient term 355 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0355 : Poly :=
[
  term ((-58397805814300313 : Rat) / 78328924069788) [(11, 1), (13, 1), (14, 1)]
]

/-- Partial product 355 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0355 : Poly :=
[
  term ((58397805814300313 : Rat) / 39164462034894) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-58397805814300313 : Rat) / 78328924069788) [(0, 2), (11, 1), (13, 1), (14, 1)],
  term ((58397805814300313 : Rat) / 39164462034894) [(1, 1), (11, 1), (13, 2), (14, 1)],
  term ((-58397805814300313 : Rat) / 78328924069788) [(1, 2), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 355 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0355_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0355
        rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_25_0355 := by
  native_decide

/-- Coefficient term 356 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0356 : Poly :=
[
  term ((3575 : Rat) / 126) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 356 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0356 : Poly :=
[
  term ((-3575 : Rat) / 63) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((3575 : Rat) / 126) [(0, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3575 : Rat) / 63) [(1, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((3575 : Rat) / 126) [(1, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 356 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0356_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0356
        rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_25_0356 := by
  native_decide

/-- Coefficient term 357 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0357 : Poly :=
[
  term ((59904 : Rat) / 553) [(11, 1), (13, 1), (14, 2)]
]

/-- Partial product 357 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0357 : Poly :=
[
  term ((-119808 : Rat) / 553) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 2)],
  term ((59904 : Rat) / 553) [(0, 2), (11, 1), (13, 1), (14, 2)],
  term ((-119808 : Rat) / 553) [(1, 1), (11, 1), (13, 2), (14, 2)],
  term ((59904 : Rat) / 553) [(1, 2), (11, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 357 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0357_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0357
        rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_25_0357 := by
  native_decide

/-- Coefficient term 358 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0358 : Poly :=
[
  term ((2954048478533 : Rat) / 39470357304) [(11, 1), (13, 1), (15, 2)]
]

/-- Partial product 358 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0358 : Poly :=
[
  term ((-2954048478533 : Rat) / 19735178652) [(0, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((2954048478533 : Rat) / 39470357304) [(0, 2), (11, 1), (13, 1), (15, 2)],
  term ((-2954048478533 : Rat) / 19735178652) [(1, 1), (11, 1), (13, 2), (15, 2)],
  term ((2954048478533 : Rat) / 39470357304) [(1, 2), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 358 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0358_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0358
        rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_25_0358 := by
  native_decide

/-- Coefficient term 359 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0359 : Poly :=
[
  term ((-305 : Rat) / 28) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 359 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0359 : Poly :=
[
  term ((305 : Rat) / 14) [(0, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-305 : Rat) / 28) [(0, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((305 : Rat) / 14) [(1, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-305 : Rat) / 28) [(1, 2), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 359 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0359_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0359
        rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_25_0359 := by
  native_decide

/-- Coefficient term 360 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0360 : Poly :=
[
  term ((-5735 : Rat) / 336) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 360 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0360 : Poly :=
[
  term ((5735 : Rat) / 168) [(0, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-5735 : Rat) / 336) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term ((5735 : Rat) / 168) [(1, 1), (11, 1), (13, 2), (16, 1)],
  term ((-5735 : Rat) / 336) [(1, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 360 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0360_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0360
        rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_25_0360 := by
  native_decide

/-- Coefficient term 361 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0361 : Poly :=
[
  term ((17059573676625329 : Rat) / 52219282713192) [(11, 1), (14, 1), (15, 1)]
]

/-- Partial product 361 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0361 : Poly :=
[
  term ((-17059573676625329 : Rat) / 26109641356596) [(0, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((17059573676625329 : Rat) / 52219282713192) [(0, 2), (11, 1), (14, 1), (15, 1)],
  term ((-17059573676625329 : Rat) / 26109641356596) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((17059573676625329 : Rat) / 52219282713192) [(1, 2), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 361 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0361_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0361
        rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_25_0361 := by
  native_decide

/-- Coefficient term 362 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0362 : Poly :=
[
  term ((-211 : Rat) / 9) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 362 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0362 : Poly :=
[
  term ((422 : Rat) / 9) [(0, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-211 : Rat) / 9) [(0, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((422 : Rat) / 9) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-211 : Rat) / 9) [(1, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 362 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0362_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0362
        rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_25_0362 := by
  native_decide

/-- Coefficient term 363 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0363 : Poly :=
[
  term ((-1532199782809 : Rat) / 26861770943) [(11, 1), (14, 2), (15, 1)]
]

/-- Partial product 363 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0363 : Poly :=
[
  term ((3064399565618 : Rat) / 26861770943) [(0, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(0, 2), (11, 1), (14, 2), (15, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(1, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(1, 2), (11, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 363 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0363_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0363
        rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_25_0363 := by
  native_decide

/-- Coefficient term 364 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0364 : Poly :=
[
  term ((-507140382207476813 : Rat) / 208877130852768) [(11, 1), (15, 1)]
]

/-- Partial product 364 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0364 : Poly :=
[
  term ((507140382207476813 : Rat) / 104438565426384) [(0, 1), (11, 1), (12, 1), (15, 1)],
  term ((-507140382207476813 : Rat) / 208877130852768) [(0, 2), (11, 1), (15, 1)],
  term ((507140382207476813 : Rat) / 104438565426384) [(1, 1), (11, 1), (13, 1), (15, 1)],
  term ((-507140382207476813 : Rat) / 208877130852768) [(1, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 364 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0364_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0364
        rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_25_0364 := by
  native_decide

/-- Coefficient term 365 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0365 : Poly :=
[
  term ((1241 : Rat) / 84) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 365 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0365 : Poly :=
[
  term ((-1241 : Rat) / 42) [(0, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1241 : Rat) / 84) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1241 : Rat) / 42) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1241 : Rat) / 84) [(1, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 365 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0365_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0365
        rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_25_0365 := by
  native_decide

/-- Coefficient term 366 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0366 : Poly :=
[
  term ((-3366906314273 : Rat) / 29602767978) [(11, 1), (15, 3)]
]

/-- Partial product 366 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0366 : Poly :=
[
  term ((3366906314273 : Rat) / 14801383989) [(0, 1), (11, 1), (12, 1), (15, 3)],
  term ((-3366906314273 : Rat) / 29602767978) [(0, 2), (11, 1), (15, 3)],
  term ((3366906314273 : Rat) / 14801383989) [(1, 1), (11, 1), (13, 1), (15, 3)],
  term ((-3366906314273 : Rat) / 29602767978) [(1, 2), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 366 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0366_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0366
        rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_25_0366 := by
  native_decide

/-- Coefficient term 367 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0367 : Poly :=
[
  term ((65 : Rat) / 7) [(11, 1), (15, 3), (16, 1)]
]

/-- Partial product 367 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0367 : Poly :=
[
  term ((-130 : Rat) / 7) [(0, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((65 : Rat) / 7) [(0, 2), (11, 1), (15, 3), (16, 1)],
  term ((-130 : Rat) / 7) [(1, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((65 : Rat) / 7) [(1, 2), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 367 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0367_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0367
        rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_25_0367 := by
  native_decide

/-- Coefficient term 368 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0368 : Poly :=
[
  term ((-33696 : Rat) / 79) [(11, 2)]
]

/-- Partial product 368 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0368 : Poly :=
[
  term ((67392 : Rat) / 79) [(0, 1), (11, 2), (12, 1)],
  term ((-33696 : Rat) / 79) [(0, 2), (11, 2)],
  term ((67392 : Rat) / 79) [(1, 1), (11, 2), (13, 1)],
  term ((-33696 : Rat) / 79) [(1, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 368 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0368_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0368
        rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_25_0368 := by
  native_decide

/-- Coefficient term 369 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0369 : Poly :=
[
  term ((1886891351860279 : Rat) / 6527410339149) [(11, 2), (14, 1)]
]

/-- Partial product 369 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0369 : Poly :=
[
  term ((-3773782703720558 : Rat) / 6527410339149) [(0, 1), (11, 2), (12, 1), (14, 1)],
  term ((1886891351860279 : Rat) / 6527410339149) [(0, 2), (11, 2), (14, 1)],
  term ((-3773782703720558 : Rat) / 6527410339149) [(1, 1), (11, 2), (13, 1), (14, 1)],
  term ((1886891351860279 : Rat) / 6527410339149) [(1, 2), (11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 369 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0369_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0369
        rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_25_0369 := by
  native_decide

/-- Coefficient term 370 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0370 : Poly :=
[
  term ((-119808 : Rat) / 553) [(11, 2), (15, 2)]
]

/-- Partial product 370 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0370 : Poly :=
[
  term ((239616 : Rat) / 553) [(0, 1), (11, 2), (12, 1), (15, 2)],
  term ((-119808 : Rat) / 553) [(0, 2), (11, 2), (15, 2)],
  term ((239616 : Rat) / 553) [(1, 1), (11, 2), (13, 1), (15, 2)],
  term ((-119808 : Rat) / 553) [(1, 2), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 370 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0370_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0370
        rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_25_0370 := by
  native_decide

/-- Coefficient term 371 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0371 : Poly :=
[
  term ((15287449859748859 : Rat) / 29839590121824) [(12, 1)]
]

/-- Partial product 371 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0371 : Poly :=
[
  term ((-15287449859748859 : Rat) / 14919795060912) [(0, 1), (12, 2)],
  term ((15287449859748859 : Rat) / 29839590121824) [(0, 2), (12, 1)],
  term ((-15287449859748859 : Rat) / 14919795060912) [(1, 1), (12, 1), (13, 1)],
  term ((15287449859748859 : Rat) / 29839590121824) [(1, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 371 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0371_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0371
        rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_25_0371 := by
  native_decide

/-- Coefficient term 372 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0372 : Poly :=
[
  term ((-2629582380889 : Rat) / 236822143824) [(12, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 372 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0372 : Poly :=
[
  term ((2629582380889 : Rat) / 118411071912) [(0, 1), (12, 2), (13, 1), (14, 1), (15, 1)],
  term ((-2629582380889 : Rat) / 236822143824) [(0, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((2629582380889 : Rat) / 118411071912) [(1, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((-2629582380889 : Rat) / 236822143824) [(1, 2), (12, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 372 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0372_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0372
        rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_25_0372 := by
  native_decide

/-- Coefficient term 373 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0373 : Poly :=
[
  term ((-345 : Rat) / 56) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 373 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0373 : Poly :=
[
  term ((345 : Rat) / 28) [(0, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-345 : Rat) / 56) [(0, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((345 : Rat) / 28) [(1, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-345 : Rat) / 56) [(1, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 373 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0373_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0373
        rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_25_0373 := by
  native_decide

/-- Coefficient term 374 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0374 : Poly :=
[
  term ((389178307824539 : Rat) / 4262798588832) [(12, 1), (13, 1), (15, 1)]
]

/-- Partial product 374 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0374 : Poly :=
[
  term ((-389178307824539 : Rat) / 2131399294416) [(0, 1), (12, 2), (13, 1), (15, 1)],
  term ((389178307824539 : Rat) / 4262798588832) [(0, 2), (12, 1), (13, 1), (15, 1)],
  term ((-389178307824539 : Rat) / 2131399294416) [(1, 1), (12, 1), (13, 2), (15, 1)],
  term ((389178307824539 : Rat) / 4262798588832) [(1, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 374 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0374_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0374
        rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_25_0374 := by
  native_decide

/-- Coefficient term 375 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0375 : Poly :=
[
  term ((-45 : Rat) / 112) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 375 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0375 : Poly :=
[
  term ((45 : Rat) / 56) [(0, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-45 : Rat) / 112) [(0, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((45 : Rat) / 56) [(1, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-45 : Rat) / 112) [(1, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 375 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0375_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0375
        rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_25_0375 := by
  native_decide

/-- Coefficient term 376 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0376 : Poly :=
[
  term ((2991533456192 : Rat) / 133212455901) [(12, 1), (14, 1)]
]

/-- Partial product 376 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0376 : Poly :=
[
  term ((-5983066912384 : Rat) / 133212455901) [(0, 1), (12, 2), (14, 1)],
  term ((2991533456192 : Rat) / 133212455901) [(0, 2), (12, 1), (14, 1)],
  term ((-5983066912384 : Rat) / 133212455901) [(1, 1), (12, 1), (13, 1), (14, 1)],
  term ((2991533456192 : Rat) / 133212455901) [(1, 2), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 376 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0376_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0376
        rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_25_0376 := by
  native_decide

/-- Coefficient term 377 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0377 : Poly :=
[
  term ((2187255370987 : Rat) / 19735178652) [(12, 1), (14, 1), (15, 2)]
]

/-- Partial product 377 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0377 : Poly :=
[
  term ((-2187255370987 : Rat) / 9867589326) [(0, 1), (12, 2), (14, 1), (15, 2)],
  term ((2187255370987 : Rat) / 19735178652) [(0, 2), (12, 1), (14, 1), (15, 2)],
  term ((-2187255370987 : Rat) / 9867589326) [(1, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((2187255370987 : Rat) / 19735178652) [(1, 2), (12, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 377 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0377_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0377
        rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_25_0377 := by
  native_decide

/-- Coefficient term 378 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0378 : Poly :=
[
  term ((73 : Rat) / 14) [(12, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 378 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0378 : Poly :=
[
  term ((-73 : Rat) / 7) [(0, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((73 : Rat) / 14) [(0, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-73 : Rat) / 7) [(1, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((73 : Rat) / 14) [(1, 2), (12, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 378 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0378_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0378
        rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_25_0378 := by
  native_decide

/-- Coefficient term 379 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0379 : Poly :=
[
  term ((-2001591001496153 : Rat) / 8703213785532) [(12, 1), (15, 2)]
]

/-- Partial product 379 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0379 : Poly :=
[
  term ((2001591001496153 : Rat) / 4351606892766) [(0, 1), (12, 2), (15, 2)],
  term ((-2001591001496153 : Rat) / 8703213785532) [(0, 2), (12, 1), (15, 2)],
  term ((2001591001496153 : Rat) / 4351606892766) [(1, 1), (12, 1), (13, 1), (15, 2)],
  term ((-2001591001496153 : Rat) / 8703213785532) [(1, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 379 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0379_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0379
        rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_25_0379 := by
  native_decide

/-- Coefficient term 380 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0380 : Poly :=
[
  term ((155 : Rat) / 84) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 380 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0380 : Poly :=
[
  term ((-155 : Rat) / 42) [(0, 1), (12, 2), (15, 2), (16, 1)],
  term ((155 : Rat) / 84) [(0, 2), (12, 1), (15, 2), (16, 1)],
  term ((-155 : Rat) / 42) [(1, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((155 : Rat) / 84) [(1, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 380 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0380_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0380
        rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_25_0380 := by
  native_decide

/-- Coefficient term 381 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0381 : Poly :=
[
  term ((59635504015286267 : Rat) / 52219282713192) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 381 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0381 : Poly :=
[
  term ((-59635504015286267 : Rat) / 26109641356596) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((59635504015286267 : Rat) / 52219282713192) [(0, 2), (13, 1), (14, 1), (15, 1)],
  term ((-59635504015286267 : Rat) / 26109641356596) [(1, 1), (13, 2), (14, 1), (15, 1)],
  term ((59635504015286267 : Rat) / 52219282713192) [(1, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 381 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0381_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0381
        rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_25_0381 := by
  native_decide

/-- Coefficient term 382 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0382 : Poly :=
[
  term ((-4313 : Rat) / 126) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 382 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0382 : Poly :=
[
  term ((4313 : Rat) / 63) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4313 : Rat) / 126) [(0, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((4313 : Rat) / 63) [(1, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-4313 : Rat) / 126) [(1, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 382 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0382_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0382
        rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_25_0382 := by
  native_decide

/-- Coefficient term 383 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0383 : Poly :=
[
  term ((-162334705359487 : Rat) / 967023753948) [(13, 1), (14, 2), (15, 1)]
]

/-- Partial product 383 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0383 : Poly :=
[
  term ((162334705359487 : Rat) / 483511876974) [(0, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-162334705359487 : Rat) / 967023753948) [(0, 2), (13, 1), (14, 2), (15, 1)],
  term ((162334705359487 : Rat) / 483511876974) [(1, 1), (13, 2), (14, 2), (15, 1)],
  term ((-162334705359487 : Rat) / 967023753948) [(1, 2), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 383 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0383_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0383
        rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_25_0383 := by
  native_decide

/-- Coefficient term 384 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0384 : Poly :=
[
  term ((-73 : Rat) / 14) [(13, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 384 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0384 : Poly :=
[
  term ((73 : Rat) / 7) [(0, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-73 : Rat) / 14) [(0, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((73 : Rat) / 7) [(1, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-73 : Rat) / 14) [(1, 2), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 384 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0384_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0384
        rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_25_0384 := by
  native_decide

/-- Coefficient term 385 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0385 : Poly :=
[
  term ((-120131844123840737 : Rat) / 208877130852768) [(13, 1), (15, 1)]
]

/-- Partial product 385 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0385 : Poly :=
[
  term ((120131844123840737 : Rat) / 104438565426384) [(0, 1), (12, 1), (13, 1), (15, 1)],
  term ((-120131844123840737 : Rat) / 208877130852768) [(0, 2), (13, 1), (15, 1)],
  term ((120131844123840737 : Rat) / 104438565426384) [(1, 1), (13, 2), (15, 1)],
  term ((-120131844123840737 : Rat) / 208877130852768) [(1, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 385 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0385_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0385
        rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_25_0385 := by
  native_decide

/-- Coefficient term 386 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0386 : Poly :=
[
  term ((2549 : Rat) / 336) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 386 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0386 : Poly :=
[
  term ((-2549 : Rat) / 168) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((2549 : Rat) / 336) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2549 : Rat) / 168) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((2549 : Rat) / 336) [(1, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 386 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0386_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0386
        rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_25_0386 := by
  native_decide

/-- Coefficient term 387 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0387 : Poly :=
[
  term ((77523682154173 : Rat) / 608971226976) [(13, 2)]
]

/-- Partial product 387 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0387 : Poly :=
[
  term ((-77523682154173 : Rat) / 304485613488) [(0, 1), (12, 1), (13, 2)],
  term ((77523682154173 : Rat) / 608971226976) [(0, 2), (13, 2)],
  term ((-77523682154173 : Rat) / 304485613488) [(1, 1), (13, 3)],
  term ((77523682154173 : Rat) / 608971226976) [(1, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 387 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0387_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0387
        rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_25_0387 := by
  native_decide

/-- Coefficient term 388 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0388 : Poly :=
[
  term ((-148700660223895 : Rat) / 161878427424) [(13, 2), (14, 1)]
]

/-- Partial product 388 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0388 : Poly :=
[
  term ((148700660223895 : Rat) / 80939213712) [(0, 1), (12, 1), (13, 2), (14, 1)],
  term ((-148700660223895 : Rat) / 161878427424) [(0, 2), (13, 2), (14, 1)],
  term ((148700660223895 : Rat) / 80939213712) [(1, 1), (13, 3), (14, 1)],
  term ((-148700660223895 : Rat) / 161878427424) [(1, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 388 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0388_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0388
        rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_25_0388 := by
  native_decide

/-- Coefficient term 389 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0389 : Poly :=
[
  term ((20605 : Rat) / 1008) [(13, 2), (14, 1), (16, 1)]
]

/-- Partial product 389 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0389 : Poly :=
[
  term ((-20605 : Rat) / 504) [(0, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((20605 : Rat) / 1008) [(0, 2), (13, 2), (14, 1), (16, 1)],
  term ((-20605 : Rat) / 504) [(1, 1), (13, 3), (14, 1), (16, 1)],
  term ((20605 : Rat) / 1008) [(1, 2), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 389 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0389_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0389
        rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_25_0389 := by
  native_decide

/-- Coefficient term 390 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0390 : Poly :=
[
  term ((2629582380889 : Rat) / 236822143824) [(13, 2), (14, 2)]
]

/-- Partial product 390 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0390 : Poly :=
[
  term ((-2629582380889 : Rat) / 118411071912) [(0, 1), (12, 1), (13, 2), (14, 2)],
  term ((2629582380889 : Rat) / 236822143824) [(0, 2), (13, 2), (14, 2)],
  term ((-2629582380889 : Rat) / 118411071912) [(1, 1), (13, 3), (14, 2)],
  term ((2629582380889 : Rat) / 236822143824) [(1, 2), (13, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 390 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0390_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0390
        rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_25_0390 := by
  native_decide

/-- Coefficient term 391 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0391 : Poly :=
[
  term ((345 : Rat) / 56) [(13, 2), (14, 2), (16, 1)]
]

/-- Partial product 391 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0391 : Poly :=
[
  term ((-345 : Rat) / 28) [(0, 1), (12, 1), (13, 2), (14, 2), (16, 1)],
  term ((345 : Rat) / 56) [(0, 2), (13, 2), (14, 2), (16, 1)],
  term ((-345 : Rat) / 28) [(1, 1), (13, 3), (14, 2), (16, 1)],
  term ((345 : Rat) / 56) [(1, 2), (13, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 391 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0391_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0391
        rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_25_0391 := by
  native_decide

/-- Coefficient term 392 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0392 : Poly :=
[
  term ((-2255 : Rat) / 336) [(13, 2), (16, 1)]
]

/-- Partial product 392 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0392 : Poly :=
[
  term ((2255 : Rat) / 168) [(0, 1), (12, 1), (13, 2), (16, 1)],
  term ((-2255 : Rat) / 336) [(0, 2), (13, 2), (16, 1)],
  term ((2255 : Rat) / 168) [(1, 1), (13, 3), (16, 1)],
  term ((-2255 : Rat) / 336) [(1, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 392 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0392_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0392
        rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_25_0392 := by
  native_decide

/-- Coefficient term 393 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0393 : Poly :=
[
  term ((52608741422052079 : Rat) / 104438565426384) [(14, 1)]
]

/-- Partial product 393 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0393 : Poly :=
[
  term ((-52608741422052079 : Rat) / 52219282713192) [(0, 1), (12, 1), (14, 1)],
  term ((52608741422052079 : Rat) / 104438565426384) [(0, 2), (14, 1)],
  term ((-52608741422052079 : Rat) / 52219282713192) [(1, 1), (13, 1), (14, 1)],
  term ((52608741422052079 : Rat) / 104438565426384) [(1, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 393 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0393_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0393
        rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_25_0393 := by
  native_decide

/-- Coefficient term 394 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0394 : Poly :=
[
  term ((-155412207188559905 : Rat) / 208877130852768) [(14, 1), (15, 2)]
]

/-- Partial product 394 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0394 : Poly :=
[
  term ((155412207188559905 : Rat) / 104438565426384) [(0, 1), (12, 1), (14, 1), (15, 2)],
  term ((-155412207188559905 : Rat) / 208877130852768) [(0, 2), (14, 1), (15, 2)],
  term ((155412207188559905 : Rat) / 104438565426384) [(1, 1), (13, 1), (14, 1), (15, 2)],
  term ((-155412207188559905 : Rat) / 208877130852768) [(1, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 394 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0394_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0394
        rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_25_0394 := by
  native_decide

/-- Coefficient term 395 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0395 : Poly :=
[
  term ((97 : Rat) / 7) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 395 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0395 : Poly :=
[
  term ((-194 : Rat) / 7) [(0, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((97 : Rat) / 7) [(0, 2), (14, 1), (15, 2), (16, 1)],
  term ((-194 : Rat) / 7) [(1, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((97 : Rat) / 7) [(1, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 395 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0395_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0395
        rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_25_0395 := by
  native_decide

/-- Coefficient term 396 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0396 : Poly :=
[
  term ((32 : Rat) / 21) [(14, 1), (16, 1)]
]

/-- Partial product 396 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0396 : Poly :=
[
  term ((-64 : Rat) / 21) [(0, 1), (12, 1), (14, 1), (16, 1)],
  term ((32 : Rat) / 21) [(0, 2), (14, 1), (16, 1)],
  term ((-64 : Rat) / 21) [(1, 1), (13, 1), (14, 1), (16, 1)],
  term ((32 : Rat) / 21) [(1, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 396 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0396_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0396
        rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_25_0396 := by
  native_decide

/-- Coefficient term 397 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0397 : Poly :=
[
  term ((89855187704129615 : Rat) / 417754261705536) [(14, 2)]
]

/-- Partial product 397 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0397 : Poly :=
[
  term ((-89855187704129615 : Rat) / 208877130852768) [(0, 1), (12, 1), (14, 2)],
  term ((89855187704129615 : Rat) / 417754261705536) [(0, 2), (14, 2)],
  term ((-89855187704129615 : Rat) / 208877130852768) [(1, 1), (13, 1), (14, 2)],
  term ((89855187704129615 : Rat) / 417754261705536) [(1, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 397 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0397_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0397
        rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_25_0397 := by
  native_decide

/-- Coefficient term 398 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0398 : Poly :=
[
  term ((-16 : Rat) / 21) [(14, 2), (16, 1)]
]

/-- Partial product 398 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0398 : Poly :=
[
  term ((32 : Rat) / 21) [(0, 1), (12, 1), (14, 2), (16, 1)],
  term ((-16 : Rat) / 21) [(0, 2), (14, 2), (16, 1)],
  term ((32 : Rat) / 21) [(1, 1), (13, 1), (14, 2), (16, 1)],
  term ((-16 : Rat) / 21) [(1, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 398 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0398_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0398
        rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_25_0398 := by
  native_decide

/-- Coefficient term 399 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0399 : Poly :=
[
  term ((-8979241671985367 : Rat) / 29839590121824) [(14, 3)]
]

/-- Partial product 399 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0399 : Poly :=
[
  term ((8979241671985367 : Rat) / 14919795060912) [(0, 1), (12, 1), (14, 3)],
  term ((-8979241671985367 : Rat) / 29839590121824) [(0, 2), (14, 3)],
  term ((8979241671985367 : Rat) / 14919795060912) [(1, 1), (13, 1), (14, 3)],
  term ((-8979241671985367 : Rat) / 29839590121824) [(1, 2), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 399 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0399_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0399
        rs_R009_ueqv_R009YNNNN_generator_25_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_25_0399 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_partials_25_0300_0399 : List Poly :=
[
  rs_R009_ueqv_R009YNNNN_partial_25_0300,
  rs_R009_ueqv_R009YNNNN_partial_25_0301,
  rs_R009_ueqv_R009YNNNN_partial_25_0302,
  rs_R009_ueqv_R009YNNNN_partial_25_0303,
  rs_R009_ueqv_R009YNNNN_partial_25_0304,
  rs_R009_ueqv_R009YNNNN_partial_25_0305,
  rs_R009_ueqv_R009YNNNN_partial_25_0306,
  rs_R009_ueqv_R009YNNNN_partial_25_0307,
  rs_R009_ueqv_R009YNNNN_partial_25_0308,
  rs_R009_ueqv_R009YNNNN_partial_25_0309,
  rs_R009_ueqv_R009YNNNN_partial_25_0310,
  rs_R009_ueqv_R009YNNNN_partial_25_0311,
  rs_R009_ueqv_R009YNNNN_partial_25_0312,
  rs_R009_ueqv_R009YNNNN_partial_25_0313,
  rs_R009_ueqv_R009YNNNN_partial_25_0314,
  rs_R009_ueqv_R009YNNNN_partial_25_0315,
  rs_R009_ueqv_R009YNNNN_partial_25_0316,
  rs_R009_ueqv_R009YNNNN_partial_25_0317,
  rs_R009_ueqv_R009YNNNN_partial_25_0318,
  rs_R009_ueqv_R009YNNNN_partial_25_0319,
  rs_R009_ueqv_R009YNNNN_partial_25_0320,
  rs_R009_ueqv_R009YNNNN_partial_25_0321,
  rs_R009_ueqv_R009YNNNN_partial_25_0322,
  rs_R009_ueqv_R009YNNNN_partial_25_0323,
  rs_R009_ueqv_R009YNNNN_partial_25_0324,
  rs_R009_ueqv_R009YNNNN_partial_25_0325,
  rs_R009_ueqv_R009YNNNN_partial_25_0326,
  rs_R009_ueqv_R009YNNNN_partial_25_0327,
  rs_R009_ueqv_R009YNNNN_partial_25_0328,
  rs_R009_ueqv_R009YNNNN_partial_25_0329,
  rs_R009_ueqv_R009YNNNN_partial_25_0330,
  rs_R009_ueqv_R009YNNNN_partial_25_0331,
  rs_R009_ueqv_R009YNNNN_partial_25_0332,
  rs_R009_ueqv_R009YNNNN_partial_25_0333,
  rs_R009_ueqv_R009YNNNN_partial_25_0334,
  rs_R009_ueqv_R009YNNNN_partial_25_0335,
  rs_R009_ueqv_R009YNNNN_partial_25_0336,
  rs_R009_ueqv_R009YNNNN_partial_25_0337,
  rs_R009_ueqv_R009YNNNN_partial_25_0338,
  rs_R009_ueqv_R009YNNNN_partial_25_0339,
  rs_R009_ueqv_R009YNNNN_partial_25_0340,
  rs_R009_ueqv_R009YNNNN_partial_25_0341,
  rs_R009_ueqv_R009YNNNN_partial_25_0342,
  rs_R009_ueqv_R009YNNNN_partial_25_0343,
  rs_R009_ueqv_R009YNNNN_partial_25_0344,
  rs_R009_ueqv_R009YNNNN_partial_25_0345,
  rs_R009_ueqv_R009YNNNN_partial_25_0346,
  rs_R009_ueqv_R009YNNNN_partial_25_0347,
  rs_R009_ueqv_R009YNNNN_partial_25_0348,
  rs_R009_ueqv_R009YNNNN_partial_25_0349,
  rs_R009_ueqv_R009YNNNN_partial_25_0350,
  rs_R009_ueqv_R009YNNNN_partial_25_0351,
  rs_R009_ueqv_R009YNNNN_partial_25_0352,
  rs_R009_ueqv_R009YNNNN_partial_25_0353,
  rs_R009_ueqv_R009YNNNN_partial_25_0354,
  rs_R009_ueqv_R009YNNNN_partial_25_0355,
  rs_R009_ueqv_R009YNNNN_partial_25_0356,
  rs_R009_ueqv_R009YNNNN_partial_25_0357,
  rs_R009_ueqv_R009YNNNN_partial_25_0358,
  rs_R009_ueqv_R009YNNNN_partial_25_0359,
  rs_R009_ueqv_R009YNNNN_partial_25_0360,
  rs_R009_ueqv_R009YNNNN_partial_25_0361,
  rs_R009_ueqv_R009YNNNN_partial_25_0362,
  rs_R009_ueqv_R009YNNNN_partial_25_0363,
  rs_R009_ueqv_R009YNNNN_partial_25_0364,
  rs_R009_ueqv_R009YNNNN_partial_25_0365,
  rs_R009_ueqv_R009YNNNN_partial_25_0366,
  rs_R009_ueqv_R009YNNNN_partial_25_0367,
  rs_R009_ueqv_R009YNNNN_partial_25_0368,
  rs_R009_ueqv_R009YNNNN_partial_25_0369,
  rs_R009_ueqv_R009YNNNN_partial_25_0370,
  rs_R009_ueqv_R009YNNNN_partial_25_0371,
  rs_R009_ueqv_R009YNNNN_partial_25_0372,
  rs_R009_ueqv_R009YNNNN_partial_25_0373,
  rs_R009_ueqv_R009YNNNN_partial_25_0374,
  rs_R009_ueqv_R009YNNNN_partial_25_0375,
  rs_R009_ueqv_R009YNNNN_partial_25_0376,
  rs_R009_ueqv_R009YNNNN_partial_25_0377,
  rs_R009_ueqv_R009YNNNN_partial_25_0378,
  rs_R009_ueqv_R009YNNNN_partial_25_0379,
  rs_R009_ueqv_R009YNNNN_partial_25_0380,
  rs_R009_ueqv_R009YNNNN_partial_25_0381,
  rs_R009_ueqv_R009YNNNN_partial_25_0382,
  rs_R009_ueqv_R009YNNNN_partial_25_0383,
  rs_R009_ueqv_R009YNNNN_partial_25_0384,
  rs_R009_ueqv_R009YNNNN_partial_25_0385,
  rs_R009_ueqv_R009YNNNN_partial_25_0386,
  rs_R009_ueqv_R009YNNNN_partial_25_0387,
  rs_R009_ueqv_R009YNNNN_partial_25_0388,
  rs_R009_ueqv_R009YNNNN_partial_25_0389,
  rs_R009_ueqv_R009YNNNN_partial_25_0390,
  rs_R009_ueqv_R009YNNNN_partial_25_0391,
  rs_R009_ueqv_R009YNNNN_partial_25_0392,
  rs_R009_ueqv_R009YNNNN_partial_25_0393,
  rs_R009_ueqv_R009YNNNN_partial_25_0394,
  rs_R009_ueqv_R009YNNNN_partial_25_0395,
  rs_R009_ueqv_R009YNNNN_partial_25_0396,
  rs_R009_ueqv_R009YNNNN_partial_25_0397,
  rs_R009_ueqv_R009YNNNN_partial_25_0398,
  rs_R009_ueqv_R009YNNNN_partial_25_0399
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_block_25_0300_0399 : Poly :=
[
  term ((143321015097247 : Rat) / 608971226976) [(0, 1), (9, 1), (12, 1), (13, 1)],
  term ((-22981248325897669 : Rat) / 12788395766496) [(0, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-415 : Rat) / 42) [(0, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-6422908767787 : Rat) / 78940714608) [(0, 1), (9, 1), (12, 1), (13, 1), (14, 2)],
  term ((305 : Rat) / 28) [(0, 1), (9, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((2954048478533 : Rat) / 39470357304) [(0, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((-305 : Rat) / 28) [(0, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2465 : Rat) / 168) [(0, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((2029318579405679 : Rat) / 5802142523688) [(0, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((178 : Rat) / 21) [(0, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((3366906314273 : Rat) / 29602767978) [(0, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((-65 : Rat) / 7) [(0, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-326074777948363 : Rat) / 7736190031584) [(0, 1), (9, 1), (12, 1), (15, 1)],
  term ((481 : Rat) / 42) [(0, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3366906314273 : Rat) / 29602767978) [(0, 1), (9, 1), (12, 1), (15, 3)],
  term ((65 : Rat) / 7) [(0, 1), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((2172201733 : Rat) / 333083184) [(0, 1), (9, 1), (12, 2), (14, 1), (15, 1)],
  term ((-10110568816218515 : Rat) / 69625710284256) [(0, 1), (9, 1), (12, 2), (15, 1)],
  term ((64 : Rat) / 7) [(0, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-10861008665 : Rat) / 1284749424) [(0, 1), (9, 2), (10, 1), (12, 1)],
  term ((-2172201733 : Rat) / 166541592) [(0, 1), (9, 2), (10, 1), (12, 1), (14, 1)],
  term ((67338253723 : Rat) / 2248311492) [(0, 1), (9, 2), (10, 1), (12, 2)],
  term ((46590317010445 : Rat) / 1420932862944) [(0, 1), (9, 2), (12, 1)],
  term ((-2327751740719133 : Rat) / 17406427571064) [(0, 1), (9, 2), (12, 1), (14, 1)],
  term ((210703568101 : Rat) / 2997748656) [(0, 1), (9, 2), (12, 1), (14, 2)],
  term ((-210703568101 : Rat) / 2997748656) [(0, 1), (9, 2), (12, 1), (15, 2)],
  term ((-997316410233 : Rat) / 4385595256) [(0, 1), (9, 2), (12, 2)],
  term ((154752 : Rat) / 553) [(0, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((-149760 : Rat) / 553) [(0, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-239616 : Rat) / 553) [(0, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((44928 : Rat) / 553) [(0, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((149760 : Rat) / 553) [(0, 1), (10, 1), (11, 1), (12, 2), (15, 1)],
  term ((-315513675695 : Rat) / 6343450281) [(0, 1), (10, 1), (12, 1)],
  term ((27567777768901 : Rat) / 177616607868) [(0, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-209 : Rat) / 14) [(0, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((59046730683383 : Rat) / 1065699647208) [(0, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-811 : Rat) / 84) [(0, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-47082264290119 : Rat) / 532849823604) [(0, 1), (10, 1), (12, 1), (13, 2)],
  term ((-2926995536123 : Rat) / 266424911802) [(0, 1), (10, 1), (12, 1), (13, 2), (14, 1)],
  term ((-55 : Rat) / 7) [(0, 1), (10, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((575 : Rat) / 42) [(0, 1), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((45424503480285611 : Rat) / 34812855142128) [(0, 1), (10, 1), (12, 1), (14, 1)],
  term ((-3366906314273 : Rat) / 14801383989) [(0, 1), (10, 1), (12, 1), (14, 1), (15, 2)],
  term ((130 : Rat) / 7) [(0, 1), (10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-7183625070497 : Rat) / 36722421036) [(0, 1), (10, 1), (12, 1), (14, 2)],
  term ((2118317057335 : Rat) / 12686900562) [(0, 1), (10, 1), (12, 1), (15, 2)],
  term ((-13 : Rat) / 7) [(0, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((80 : Rat) / 21) [(0, 1), (10, 1), (12, 2)],
  term ((2926995536123 : Rat) / 266424911802) [(0, 1), (10, 1), (12, 2), (13, 1), (15, 1)],
  term ((55 : Rat) / 7) [(0, 1), (10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-245335365526 : Rat) / 44404151967) [(0, 1), (10, 1), (12, 2), (15, 2)],
  term ((-48 : Rat) / 7) [(0, 1), (10, 1), (12, 2), (15, 2), (16, 1)],
  term ((7118147447591 : Rat) / 78940714608) [(0, 1), (11, 1), (12, 1), (13, 1)],
  term ((58397805814300313 : Rat) / 39164462034894) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-3575 : Rat) / 63) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-119808 : Rat) / 553) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 2)],
  term ((-2954048478533 : Rat) / 19735178652) [(0, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((305 : Rat) / 14) [(0, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((5735 : Rat) / 168) [(0, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-17059573676625329 : Rat) / 26109641356596) [(0, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((422 : Rat) / 9) [(0, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(0, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((507140382207476813 : Rat) / 104438565426384) [(0, 1), (11, 1), (12, 1), (15, 1)],
  term ((-1241 : Rat) / 42) [(0, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((3366906314273 : Rat) / 14801383989) [(0, 1), (11, 1), (12, 1), (15, 3)],
  term ((-130 : Rat) / 7) [(0, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((119808 : Rat) / 553) [(0, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((-38020291217764 : Rat) / 133212455901) [(0, 1), (11, 1), (12, 2), (15, 1)],
  term ((67392 : Rat) / 79) [(0, 1), (11, 2), (12, 1)],
  term ((-3773782703720558 : Rat) / 6527410339149) [(0, 1), (11, 2), (12, 1), (14, 1)],
  term ((239616 : Rat) / 553) [(0, 1), (11, 2), (12, 1), (15, 2)],
  term ((-59635504015286267 : Rat) / 26109641356596) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((4313 : Rat) / 63) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((162334705359487 : Rat) / 483511876974) [(0, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((73 : Rat) / 7) [(0, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((120131844123840737 : Rat) / 104438565426384) [(0, 1), (12, 1), (13, 1), (15, 1)],
  term ((-2549 : Rat) / 168) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-77523682154173 : Rat) / 304485613488) [(0, 1), (12, 1), (13, 2)],
  term ((148700660223895 : Rat) / 80939213712) [(0, 1), (12, 1), (13, 2), (14, 1)],
  term ((-20605 : Rat) / 504) [(0, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-2629582380889 : Rat) / 118411071912) [(0, 1), (12, 1), (13, 2), (14, 2)],
  term ((-345 : Rat) / 28) [(0, 1), (12, 1), (13, 2), (14, 2), (16, 1)],
  term ((2255 : Rat) / 168) [(0, 1), (12, 1), (13, 2), (16, 1)],
  term ((-52608741422052079 : Rat) / 52219282713192) [(0, 1), (12, 1), (14, 1)],
  term ((155412207188559905 : Rat) / 104438565426384) [(0, 1), (12, 1), (14, 1), (15, 2)],
  term ((-194 : Rat) / 7) [(0, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-64 : Rat) / 21) [(0, 1), (12, 1), (14, 1), (16, 1)],
  term ((-89855187704129615 : Rat) / 208877130852768) [(0, 1), (12, 1), (14, 2)],
  term ((32 : Rat) / 21) [(0, 1), (12, 1), (14, 2), (16, 1)],
  term ((8979241671985367 : Rat) / 14919795060912) [(0, 1), (12, 1), (14, 3)],
  term ((-15287449859748859 : Rat) / 14919795060912) [(0, 1), (12, 2)],
  term ((2629582380889 : Rat) / 118411071912) [(0, 1), (12, 2), (13, 1), (14, 1), (15, 1)],
  term ((345 : Rat) / 28) [(0, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-389178307824539 : Rat) / 2131399294416) [(0, 1), (12, 2), (13, 1), (15, 1)],
  term ((45 : Rat) / 56) [(0, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-5983066912384 : Rat) / 133212455901) [(0, 1), (12, 2), (14, 1)],
  term ((-2187255370987 : Rat) / 9867589326) [(0, 1), (12, 2), (14, 1), (15, 2)],
  term ((-73 : Rat) / 7) [(0, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((2001591001496153 : Rat) / 4351606892766) [(0, 1), (12, 2), (15, 2)],
  term ((-155 : Rat) / 42) [(0, 1), (12, 2), (15, 2), (16, 1)],
  term ((-2172201733 : Rat) / 666166368) [(0, 2), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((10110568816218515 : Rat) / 139251420568512) [(0, 2), (9, 1), (12, 1), (15, 1)],
  term ((-32 : Rat) / 7) [(0, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-143321015097247 : Rat) / 1217942453952) [(0, 2), (9, 1), (13, 1)],
  term ((22981248325897669 : Rat) / 25576791532992) [(0, 2), (9, 1), (13, 1), (14, 1)],
  term ((415 : Rat) / 84) [(0, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((6422908767787 : Rat) / 157881429216) [(0, 2), (9, 1), (13, 1), (14, 2)],
  term ((-305 : Rat) / 56) [(0, 2), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-2954048478533 : Rat) / 78940714608) [(0, 2), (9, 1), (13, 1), (15, 2)],
  term ((305 : Rat) / 56) [(0, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((2465 : Rat) / 336) [(0, 2), (9, 1), (13, 1), (16, 1)],
  term ((-2029318579405679 : Rat) / 11604285047376) [(0, 2), (9, 1), (14, 1), (15, 1)],
  term ((-89 : Rat) / 21) [(0, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3366906314273 : Rat) / 59205535956) [(0, 2), (9, 1), (14, 2), (15, 1)],
  term ((65 : Rat) / 14) [(0, 2), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((326074777948363 : Rat) / 15472380063168) [(0, 2), (9, 1), (15, 1)],
  term ((-481 : Rat) / 84) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((3366906314273 : Rat) / 59205535956) [(0, 2), (9, 1), (15, 3)],
  term ((-65 : Rat) / 14) [(0, 2), (9, 1), (15, 3), (16, 1)],
  term ((-46590317010445 : Rat) / 2841865725888) [(0, 2), (9, 2)],
  term ((10861008665 : Rat) / 2569498848) [(0, 2), (9, 2), (10, 1)],
  term ((-67338253723 : Rat) / 4496622984) [(0, 2), (9, 2), (10, 1), (12, 1)],
  term ((2172201733 : Rat) / 333083184) [(0, 2), (9, 2), (10, 1), (14, 1)],
  term ((997316410233 : Rat) / 8771190512) [(0, 2), (9, 2), (12, 1)],
  term ((2327751740719133 : Rat) / 34812855142128) [(0, 2), (9, 2), (14, 1)],
  term ((-210703568101 : Rat) / 5995497312) [(0, 2), (9, 2), (14, 2)],
  term ((210703568101 : Rat) / 5995497312) [(0, 2), (9, 2), (15, 2)],
  term ((315513675695 : Rat) / 12686900562) [(0, 2), (10, 1)],
  term ((-74880 : Rat) / 553) [(0, 2), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-77376 : Rat) / 553) [(0, 2), (10, 1), (11, 1), (13, 1)],
  term ((74880 : Rat) / 553) [(0, 2), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((119808 : Rat) / 553) [(0, 2), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-22464 : Rat) / 553) [(0, 2), (10, 1), (11, 1), (15, 1)],
  term ((-40 : Rat) / 21) [(0, 2), (10, 1), (12, 1)],
  term ((-2926995536123 : Rat) / 532849823604) [(0, 2), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-55 : Rat) / 14) [(0, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((122667682763 : Rat) / 44404151967) [(0, 2), (10, 1), (12, 1), (15, 2)],
  term ((24 : Rat) / 7) [(0, 2), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-27567777768901 : Rat) / 355233215736) [(0, 2), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((209 : Rat) / 28) [(0, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-59046730683383 : Rat) / 2131399294416) [(0, 2), (10, 1), (13, 1), (15, 1)],
  term ((811 : Rat) / 168) [(0, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((47082264290119 : Rat) / 1065699647208) [(0, 2), (10, 1), (13, 2)],
  term ((2926995536123 : Rat) / 532849823604) [(0, 2), (10, 1), (13, 2), (14, 1)],
  term ((55 : Rat) / 14) [(0, 2), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((-575 : Rat) / 84) [(0, 2), (10, 1), (13, 2), (16, 1)],
  term ((-45424503480285611 : Rat) / 69625710284256) [(0, 2), (10, 1), (14, 1)],
  term ((3366906314273 : Rat) / 29602767978) [(0, 2), (10, 1), (14, 1), (15, 2)],
  term ((-65 : Rat) / 7) [(0, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((7183625070497 : Rat) / 73444842072) [(0, 2), (10, 1), (14, 2)],
  term ((-2118317057335 : Rat) / 25373801124) [(0, 2), (10, 1), (15, 2)],
  term ((13 : Rat) / 14) [(0, 2), (10, 1), (15, 2), (16, 1)],
  term ((-59904 : Rat) / 553) [(0, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((19010145608882 : Rat) / 133212455901) [(0, 2), (11, 1), (12, 1), (15, 1)],
  term ((-7118147447591 : Rat) / 157881429216) [(0, 2), (11, 1), (13, 1)],
  term ((-58397805814300313 : Rat) / 78328924069788) [(0, 2), (11, 1), (13, 1), (14, 1)],
  term ((3575 : Rat) / 126) [(0, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((59904 : Rat) / 553) [(0, 2), (11, 1), (13, 1), (14, 2)],
  term ((2954048478533 : Rat) / 39470357304) [(0, 2), (11, 1), (13, 1), (15, 2)],
  term ((-305 : Rat) / 28) [(0, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-5735 : Rat) / 336) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term ((17059573676625329 : Rat) / 52219282713192) [(0, 2), (11, 1), (14, 1), (15, 1)],
  term ((-211 : Rat) / 9) [(0, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(0, 2), (11, 1), (14, 2), (15, 1)],
  term ((-507140382207476813 : Rat) / 208877130852768) [(0, 2), (11, 1), (15, 1)],
  term ((1241 : Rat) / 84) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((-3366906314273 : Rat) / 29602767978) [(0, 2), (11, 1), (15, 3)],
  term ((65 : Rat) / 7) [(0, 2), (11, 1), (15, 3), (16, 1)],
  term ((-33696 : Rat) / 79) [(0, 2), (11, 2)],
  term ((1886891351860279 : Rat) / 6527410339149) [(0, 2), (11, 2), (14, 1)],
  term ((-119808 : Rat) / 553) [(0, 2), (11, 2), (15, 2)],
  term ((15287449859748859 : Rat) / 29839590121824) [(0, 2), (12, 1)],
  term ((-2629582380889 : Rat) / 236822143824) [(0, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-345 : Rat) / 56) [(0, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((389178307824539 : Rat) / 4262798588832) [(0, 2), (12, 1), (13, 1), (15, 1)],
  term ((-45 : Rat) / 112) [(0, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((2991533456192 : Rat) / 133212455901) [(0, 2), (12, 1), (14, 1)],
  term ((2187255370987 : Rat) / 19735178652) [(0, 2), (12, 1), (14, 1), (15, 2)],
  term ((73 : Rat) / 14) [(0, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2001591001496153 : Rat) / 8703213785532) [(0, 2), (12, 1), (15, 2)],
  term ((155 : Rat) / 84) [(0, 2), (12, 1), (15, 2), (16, 1)],
  term ((59635504015286267 : Rat) / 52219282713192) [(0, 2), (13, 1), (14, 1), (15, 1)],
  term ((-4313 : Rat) / 126) [(0, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-162334705359487 : Rat) / 967023753948) [(0, 2), (13, 1), (14, 2), (15, 1)],
  term ((-73 : Rat) / 14) [(0, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-120131844123840737 : Rat) / 208877130852768) [(0, 2), (13, 1), (15, 1)],
  term ((2549 : Rat) / 336) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((77523682154173 : Rat) / 608971226976) [(0, 2), (13, 2)],
  term ((-148700660223895 : Rat) / 161878427424) [(0, 2), (13, 2), (14, 1)],
  term ((20605 : Rat) / 1008) [(0, 2), (13, 2), (14, 1), (16, 1)],
  term ((2629582380889 : Rat) / 236822143824) [(0, 2), (13, 2), (14, 2)],
  term ((345 : Rat) / 56) [(0, 2), (13, 2), (14, 2), (16, 1)],
  term ((-2255 : Rat) / 336) [(0, 2), (13, 2), (16, 1)],
  term ((52608741422052079 : Rat) / 104438565426384) [(0, 2), (14, 1)],
  term ((-155412207188559905 : Rat) / 208877130852768) [(0, 2), (14, 1), (15, 2)],
  term ((97 : Rat) / 7) [(0, 2), (14, 1), (15, 2), (16, 1)],
  term ((32 : Rat) / 21) [(0, 2), (14, 1), (16, 1)],
  term ((89855187704129615 : Rat) / 417754261705536) [(0, 2), (14, 2)],
  term ((-16 : Rat) / 21) [(0, 2), (14, 2), (16, 1)],
  term ((-8979241671985367 : Rat) / 29839590121824) [(0, 2), (14, 3)],
  term ((2172201733 : Rat) / 333083184) [(1, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-10110568816218515 : Rat) / 69625710284256) [(1, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((64 : Rat) / 7) [(1, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((2029318579405679 : Rat) / 5802142523688) [(1, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((178 : Rat) / 21) [(1, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3366906314273 : Rat) / 29602767978) [(1, 1), (9, 1), (13, 1), (14, 2), (15, 1)],
  term ((-65 : Rat) / 7) [(1, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-326074777948363 : Rat) / 7736190031584) [(1, 1), (9, 1), (13, 1), (15, 1)],
  term ((481 : Rat) / 42) [(1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3366906314273 : Rat) / 29602767978) [(1, 1), (9, 1), (13, 1), (15, 3)],
  term ((65 : Rat) / 7) [(1, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((143321015097247 : Rat) / 608971226976) [(1, 1), (9, 1), (13, 2)],
  term ((-22981248325897669 : Rat) / 12788395766496) [(1, 1), (9, 1), (13, 2), (14, 1)],
  term ((-415 : Rat) / 42) [(1, 1), (9, 1), (13, 2), (14, 1), (16, 1)],
  term ((-6422908767787 : Rat) / 78940714608) [(1, 1), (9, 1), (13, 2), (14, 2)],
  term ((305 : Rat) / 28) [(1, 1), (9, 1), (13, 2), (14, 2), (16, 1)],
  term ((2954048478533 : Rat) / 39470357304) [(1, 1), (9, 1), (13, 2), (15, 2)],
  term ((-305 : Rat) / 28) [(1, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((-2465 : Rat) / 168) [(1, 1), (9, 1), (13, 2), (16, 1)],
  term ((67338253723 : Rat) / 2248311492) [(1, 1), (9, 2), (10, 1), (12, 1), (13, 1)],
  term ((-10861008665 : Rat) / 1284749424) [(1, 1), (9, 2), (10, 1), (13, 1)],
  term ((-2172201733 : Rat) / 166541592) [(1, 1), (9, 2), (10, 1), (13, 1), (14, 1)],
  term ((-997316410233 : Rat) / 4385595256) [(1, 1), (9, 2), (12, 1), (13, 1)],
  term ((46590317010445 : Rat) / 1420932862944) [(1, 1), (9, 2), (13, 1)],
  term ((-2327751740719133 : Rat) / 17406427571064) [(1, 1), (9, 2), (13, 1), (14, 1)],
  term ((210703568101 : Rat) / 2997748656) [(1, 1), (9, 2), (13, 1), (14, 2)],
  term ((-210703568101 : Rat) / 2997748656) [(1, 1), (9, 2), (13, 1), (15, 2)],
  term ((149760 : Rat) / 553) [(1, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-239616 : Rat) / 553) [(1, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((44928 : Rat) / 553) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((154752 : Rat) / 553) [(1, 1), (10, 1), (11, 1), (13, 2)],
  term ((-149760 : Rat) / 553) [(1, 1), (10, 1), (11, 1), (13, 2), (14, 1)],
  term ((80 : Rat) / 21) [(1, 1), (10, 1), (12, 1), (13, 1)],
  term ((-245335365526 : Rat) / 44404151967) [(1, 1), (10, 1), (12, 1), (13, 1), (15, 2)],
  term ((-48 : Rat) / 7) [(1, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((2926995536123 : Rat) / 266424911802) [(1, 1), (10, 1), (12, 1), (13, 2), (15, 1)],
  term ((55 : Rat) / 7) [(1, 1), (10, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-315513675695 : Rat) / 6343450281) [(1, 1), (10, 1), (13, 1)],
  term ((45424503480285611 : Rat) / 34812855142128) [(1, 1), (10, 1), (13, 1), (14, 1)],
  term ((-3366906314273 : Rat) / 14801383989) [(1, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((130 : Rat) / 7) [(1, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-7183625070497 : Rat) / 36722421036) [(1, 1), (10, 1), (13, 1), (14, 2)],
  term ((2118317057335 : Rat) / 12686900562) [(1, 1), (10, 1), (13, 1), (15, 2)],
  term ((-13 : Rat) / 7) [(1, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((27567777768901 : Rat) / 177616607868) [(1, 1), (10, 1), (13, 2), (14, 1), (15, 1)],
  term ((-209 : Rat) / 14) [(1, 1), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((59046730683383 : Rat) / 1065699647208) [(1, 1), (10, 1), (13, 2), (15, 1)],
  term ((-811 : Rat) / 84) [(1, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-47082264290119 : Rat) / 532849823604) [(1, 1), (10, 1), (13, 3)],
  term ((-2926995536123 : Rat) / 266424911802) [(1, 1), (10, 1), (13, 3), (14, 1)],
  term ((-55 : Rat) / 7) [(1, 1), (10, 1), (13, 3), (14, 1), (16, 1)],
  term ((575 : Rat) / 42) [(1, 1), (10, 1), (13, 3), (16, 1)],
  term ((119808 : Rat) / 553) [(1, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-38020291217764 : Rat) / 133212455901) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-17059573676625329 : Rat) / 26109641356596) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((422 : Rat) / 9) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(1, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((507140382207476813 : Rat) / 104438565426384) [(1, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1241 : Rat) / 42) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((3366906314273 : Rat) / 14801383989) [(1, 1), (11, 1), (13, 1), (15, 3)],
  term ((-130 : Rat) / 7) [(1, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((7118147447591 : Rat) / 78940714608) [(1, 1), (11, 1), (13, 2)],
  term ((58397805814300313 : Rat) / 39164462034894) [(1, 1), (11, 1), (13, 2), (14, 1)],
  term ((-3575 : Rat) / 63) [(1, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-119808 : Rat) / 553) [(1, 1), (11, 1), (13, 2), (14, 2)],
  term ((-2954048478533 : Rat) / 19735178652) [(1, 1), (11, 1), (13, 2), (15, 2)],
  term ((305 : Rat) / 14) [(1, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((5735 : Rat) / 168) [(1, 1), (11, 1), (13, 2), (16, 1)],
  term ((67392 : Rat) / 79) [(1, 1), (11, 2), (13, 1)],
  term ((-3773782703720558 : Rat) / 6527410339149) [(1, 1), (11, 2), (13, 1), (14, 1)],
  term ((239616 : Rat) / 553) [(1, 1), (11, 2), (13, 1), (15, 2)],
  term ((-15287449859748859 : Rat) / 14919795060912) [(1, 1), (12, 1), (13, 1)],
  term ((-5983066912384 : Rat) / 133212455901) [(1, 1), (12, 1), (13, 1), (14, 1)],
  term ((-2187255370987 : Rat) / 9867589326) [(1, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-73 : Rat) / 7) [(1, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((2001591001496153 : Rat) / 4351606892766) [(1, 1), (12, 1), (13, 1), (15, 2)],
  term ((-155 : Rat) / 42) [(1, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((2629582380889 : Rat) / 118411071912) [(1, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((345 : Rat) / 28) [(1, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-389178307824539 : Rat) / 2131399294416) [(1, 1), (12, 1), (13, 2), (15, 1)],
  term ((45 : Rat) / 56) [(1, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-52608741422052079 : Rat) / 52219282713192) [(1, 1), (13, 1), (14, 1)],
  term ((155412207188559905 : Rat) / 104438565426384) [(1, 1), (13, 1), (14, 1), (15, 2)],
  term ((-194 : Rat) / 7) [(1, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-64 : Rat) / 21) [(1, 1), (13, 1), (14, 1), (16, 1)],
  term ((-89855187704129615 : Rat) / 208877130852768) [(1, 1), (13, 1), (14, 2)],
  term ((32 : Rat) / 21) [(1, 1), (13, 1), (14, 2), (16, 1)],
  term ((8979241671985367 : Rat) / 14919795060912) [(1, 1), (13, 1), (14, 3)],
  term ((-59635504015286267 : Rat) / 26109641356596) [(1, 1), (13, 2), (14, 1), (15, 1)],
  term ((4313 : Rat) / 63) [(1, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((162334705359487 : Rat) / 483511876974) [(1, 1), (13, 2), (14, 2), (15, 1)],
  term ((73 : Rat) / 7) [(1, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((120131844123840737 : Rat) / 104438565426384) [(1, 1), (13, 2), (15, 1)],
  term ((-2549 : Rat) / 168) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((-77523682154173 : Rat) / 304485613488) [(1, 1), (13, 3)],
  term ((148700660223895 : Rat) / 80939213712) [(1, 1), (13, 3), (14, 1)],
  term ((-20605 : Rat) / 504) [(1, 1), (13, 3), (14, 1), (16, 1)],
  term ((-2629582380889 : Rat) / 118411071912) [(1, 1), (13, 3), (14, 2)],
  term ((-345 : Rat) / 28) [(1, 1), (13, 3), (14, 2), (16, 1)],
  term ((2255 : Rat) / 168) [(1, 1), (13, 3), (16, 1)],
  term ((-2172201733 : Rat) / 666166368) [(1, 2), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((10110568816218515 : Rat) / 139251420568512) [(1, 2), (9, 1), (12, 1), (15, 1)],
  term ((-32 : Rat) / 7) [(1, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-143321015097247 : Rat) / 1217942453952) [(1, 2), (9, 1), (13, 1)],
  term ((22981248325897669 : Rat) / 25576791532992) [(1, 2), (9, 1), (13, 1), (14, 1)],
  term ((415 : Rat) / 84) [(1, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((6422908767787 : Rat) / 157881429216) [(1, 2), (9, 1), (13, 1), (14, 2)],
  term ((-305 : Rat) / 56) [(1, 2), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-2954048478533 : Rat) / 78940714608) [(1, 2), (9, 1), (13, 1), (15, 2)],
  term ((305 : Rat) / 56) [(1, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((2465 : Rat) / 336) [(1, 2), (9, 1), (13, 1), (16, 1)],
  term ((-2029318579405679 : Rat) / 11604285047376) [(1, 2), (9, 1), (14, 1), (15, 1)],
  term ((-89 : Rat) / 21) [(1, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3366906314273 : Rat) / 59205535956) [(1, 2), (9, 1), (14, 2), (15, 1)],
  term ((65 : Rat) / 14) [(1, 2), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((326074777948363 : Rat) / 15472380063168) [(1, 2), (9, 1), (15, 1)],
  term ((-481 : Rat) / 84) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((3366906314273 : Rat) / 59205535956) [(1, 2), (9, 1), (15, 3)],
  term ((-65 : Rat) / 14) [(1, 2), (9, 1), (15, 3), (16, 1)],
  term ((-46590317010445 : Rat) / 2841865725888) [(1, 2), (9, 2)],
  term ((10861008665 : Rat) / 2569498848) [(1, 2), (9, 2), (10, 1)],
  term ((-67338253723 : Rat) / 4496622984) [(1, 2), (9, 2), (10, 1), (12, 1)],
  term ((2172201733 : Rat) / 333083184) [(1, 2), (9, 2), (10, 1), (14, 1)],
  term ((997316410233 : Rat) / 8771190512) [(1, 2), (9, 2), (12, 1)],
  term ((2327751740719133 : Rat) / 34812855142128) [(1, 2), (9, 2), (14, 1)],
  term ((-210703568101 : Rat) / 5995497312) [(1, 2), (9, 2), (14, 2)],
  term ((210703568101 : Rat) / 5995497312) [(1, 2), (9, 2), (15, 2)],
  term ((315513675695 : Rat) / 12686900562) [(1, 2), (10, 1)],
  term ((-74880 : Rat) / 553) [(1, 2), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-77376 : Rat) / 553) [(1, 2), (10, 1), (11, 1), (13, 1)],
  term ((74880 : Rat) / 553) [(1, 2), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((119808 : Rat) / 553) [(1, 2), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-22464 : Rat) / 553) [(1, 2), (10, 1), (11, 1), (15, 1)],
  term ((-40 : Rat) / 21) [(1, 2), (10, 1), (12, 1)],
  term ((-2926995536123 : Rat) / 532849823604) [(1, 2), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-55 : Rat) / 14) [(1, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((122667682763 : Rat) / 44404151967) [(1, 2), (10, 1), (12, 1), (15, 2)],
  term ((24 : Rat) / 7) [(1, 2), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-27567777768901 : Rat) / 355233215736) [(1, 2), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((209 : Rat) / 28) [(1, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-59046730683383 : Rat) / 2131399294416) [(1, 2), (10, 1), (13, 1), (15, 1)],
  term ((811 : Rat) / 168) [(1, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((47082264290119 : Rat) / 1065699647208) [(1, 2), (10, 1), (13, 2)],
  term ((2926995536123 : Rat) / 532849823604) [(1, 2), (10, 1), (13, 2), (14, 1)],
  term ((55 : Rat) / 14) [(1, 2), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((-575 : Rat) / 84) [(1, 2), (10, 1), (13, 2), (16, 1)],
  term ((-45424503480285611 : Rat) / 69625710284256) [(1, 2), (10, 1), (14, 1)],
  term ((3366906314273 : Rat) / 29602767978) [(1, 2), (10, 1), (14, 1), (15, 2)],
  term ((-65 : Rat) / 7) [(1, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((7183625070497 : Rat) / 73444842072) [(1, 2), (10, 1), (14, 2)],
  term ((-2118317057335 : Rat) / 25373801124) [(1, 2), (10, 1), (15, 2)],
  term ((13 : Rat) / 14) [(1, 2), (10, 1), (15, 2), (16, 1)],
  term ((-59904 : Rat) / 553) [(1, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((19010145608882 : Rat) / 133212455901) [(1, 2), (11, 1), (12, 1), (15, 1)],
  term ((-7118147447591 : Rat) / 157881429216) [(1, 2), (11, 1), (13, 1)],
  term ((-58397805814300313 : Rat) / 78328924069788) [(1, 2), (11, 1), (13, 1), (14, 1)],
  term ((3575 : Rat) / 126) [(1, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((59904 : Rat) / 553) [(1, 2), (11, 1), (13, 1), (14, 2)],
  term ((2954048478533 : Rat) / 39470357304) [(1, 2), (11, 1), (13, 1), (15, 2)],
  term ((-305 : Rat) / 28) [(1, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-5735 : Rat) / 336) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term ((17059573676625329 : Rat) / 52219282713192) [(1, 2), (11, 1), (14, 1), (15, 1)],
  term ((-211 : Rat) / 9) [(1, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(1, 2), (11, 1), (14, 2), (15, 1)],
  term ((-507140382207476813 : Rat) / 208877130852768) [(1, 2), (11, 1), (15, 1)],
  term ((1241 : Rat) / 84) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-3366906314273 : Rat) / 29602767978) [(1, 2), (11, 1), (15, 3)],
  term ((65 : Rat) / 7) [(1, 2), (11, 1), (15, 3), (16, 1)],
  term ((-33696 : Rat) / 79) [(1, 2), (11, 2)],
  term ((1886891351860279 : Rat) / 6527410339149) [(1, 2), (11, 2), (14, 1)],
  term ((-119808 : Rat) / 553) [(1, 2), (11, 2), (15, 2)],
  term ((15287449859748859 : Rat) / 29839590121824) [(1, 2), (12, 1)],
  term ((-2629582380889 : Rat) / 236822143824) [(1, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-345 : Rat) / 56) [(1, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((389178307824539 : Rat) / 4262798588832) [(1, 2), (12, 1), (13, 1), (15, 1)],
  term ((-45 : Rat) / 112) [(1, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((2991533456192 : Rat) / 133212455901) [(1, 2), (12, 1), (14, 1)],
  term ((2187255370987 : Rat) / 19735178652) [(1, 2), (12, 1), (14, 1), (15, 2)],
  term ((73 : Rat) / 14) [(1, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2001591001496153 : Rat) / 8703213785532) [(1, 2), (12, 1), (15, 2)],
  term ((155 : Rat) / 84) [(1, 2), (12, 1), (15, 2), (16, 1)],
  term ((59635504015286267 : Rat) / 52219282713192) [(1, 2), (13, 1), (14, 1), (15, 1)],
  term ((-4313 : Rat) / 126) [(1, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-162334705359487 : Rat) / 967023753948) [(1, 2), (13, 1), (14, 2), (15, 1)],
  term ((-73 : Rat) / 14) [(1, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-120131844123840737 : Rat) / 208877130852768) [(1, 2), (13, 1), (15, 1)],
  term ((2549 : Rat) / 336) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((77523682154173 : Rat) / 608971226976) [(1, 2), (13, 2)],
  term ((-148700660223895 : Rat) / 161878427424) [(1, 2), (13, 2), (14, 1)],
  term ((20605 : Rat) / 1008) [(1, 2), (13, 2), (14, 1), (16, 1)],
  term ((2629582380889 : Rat) / 236822143824) [(1, 2), (13, 2), (14, 2)],
  term ((345 : Rat) / 56) [(1, 2), (13, 2), (14, 2), (16, 1)],
  term ((-2255 : Rat) / 336) [(1, 2), (13, 2), (16, 1)],
  term ((52608741422052079 : Rat) / 104438565426384) [(1, 2), (14, 1)],
  term ((-155412207188559905 : Rat) / 208877130852768) [(1, 2), (14, 1), (15, 2)],
  term ((97 : Rat) / 7) [(1, 2), (14, 1), (15, 2), (16, 1)],
  term ((32 : Rat) / 21) [(1, 2), (14, 1), (16, 1)],
  term ((89855187704129615 : Rat) / 417754261705536) [(1, 2), (14, 2)],
  term ((-16 : Rat) / 21) [(1, 2), (14, 2), (16, 1)],
  term ((-8979241671985367 : Rat) / 29839590121824) [(1, 2), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 25, terms 300 through 399. -/
theorem rs_R009_ueqv_R009YNNNN_block_25_0300_0399_valid :
    checkProductSumEq rs_R009_ueqv_R009YNNNN_partials_25_0300_0399
      rs_R009_ueqv_R009YNNNN_block_25_0300_0399 = true := by
  native_decide

end R009UeqvR009YNNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
