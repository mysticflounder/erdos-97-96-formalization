/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R013:u=v:R013YNNN, term block 19:300-341

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R013UeqvR013YNNNTermShards

/-- Generator polynomial 19 for relaxed split surplus certificate `R013:u=v:R013YNNN`. -/
def rs_R013_ueqv_R013YNNN_generator_19_0300_0341 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(8, 1)]
]

/-- Coefficient term 300 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0300 : Poly :=
[
  term (-20 : Rat) [(8, 1)]
]

/-- Partial product 300 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0300 : Poly :=
[
  term (20 : Rat) [(8, 1)],
  term (-40 : Rat) [(8, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 300 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0300_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0300
        rs_R013_ueqv_R013YNNN_generator_19_0300_0341 =
      rs_R013_ueqv_R013YNNN_partial_19_0300 := by
  native_decide

/-- Coefficient term 301 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0301 : Poly :=
[
  term (80 : Rat) [(8, 1), (9, 1), (11, 1)]
]

/-- Partial product 301 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0301 : Poly :=
[
  term (-80 : Rat) [(8, 1), (9, 1), (11, 1)],
  term (160 : Rat) [(8, 2), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 301 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0301_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0301
        rs_R013_ueqv_R013YNNN_generator_19_0300_0341 =
      rs_R013_ueqv_R013YNNN_partial_19_0301 := by
  native_decide

/-- Coefficient term 302 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0302 : Poly :=
[
  term (40 : Rat) [(8, 1), (10, 1)]
]

/-- Partial product 302 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0302 : Poly :=
[
  term (-40 : Rat) [(8, 1), (10, 1)],
  term (80 : Rat) [(8, 2), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 302 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0302_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0302
        rs_R013_ueqv_R013YNNN_generator_19_0300_0341 =
      rs_R013_ueqv_R013YNNN_partial_19_0302 := by
  native_decide

/-- Coefficient term 303 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0303 : Poly :=
[
  term ((-3853613921 : Rat) / 17156138) [(8, 1), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 303 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0303 : Poly :=
[
  term ((3853613921 : Rat) / 17156138) [(8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-3853613921 : Rat) / 8578069) [(8, 2), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 303 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0303_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0303
        rs_R013_ueqv_R013YNNN_generator_19_0300_0341 =
      rs_R013_ueqv_R013YNNN_partial_19_0303 := by
  native_decide

/-- Coefficient term 304 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0304 : Poly :=
[
  term ((-2032075936 : Rat) / 25734207) [(8, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 304 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0304 : Poly :=
[
  term ((2032075936 : Rat) / 25734207) [(8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-4064151872 : Rat) / 25734207) [(8, 2), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 304 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0304_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0304
        rs_R013_ueqv_R013YNNN_generator_19_0300_0341 =
      rs_R013_ueqv_R013YNNN_partial_19_0304 := by
  native_decide

/-- Coefficient term 305 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0305 : Poly :=
[
  term ((1386479552 : Rat) / 25734207) [(8, 1), (11, 1), (15, 1)]
]

/-- Partial product 305 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0305 : Poly :=
[
  term ((-1386479552 : Rat) / 25734207) [(8, 1), (11, 1), (15, 1)],
  term ((2772959104 : Rat) / 25734207) [(8, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 305 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0305_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0305
        rs_R013_ueqv_R013YNNN_generator_19_0300_0341 =
      rs_R013_ueqv_R013YNNN_partial_19_0305 := by
  native_decide

/-- Coefficient term 306 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0306 : Poly :=
[
  term ((9041041090 : Rat) / 150171761) [(8, 1), (11, 2)]
]

/-- Partial product 306 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0306 : Poly :=
[
  term ((-9041041090 : Rat) / 150171761) [(8, 1), (11, 2)],
  term ((18082082180 : Rat) / 150171761) [(8, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 306 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0306_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0306
        rs_R013_ueqv_R013YNNN_generator_19_0300_0341 =
      rs_R013_ueqv_R013YNNN_partial_19_0306 := by
  native_decide

/-- Coefficient term 307 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0307 : Poly :=
[
  term ((-164460800 : Rat) / 150171761) [(8, 1), (11, 2), (12, 1)]
]

/-- Partial product 307 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0307 : Poly :=
[
  term ((164460800 : Rat) / 150171761) [(8, 1), (11, 2), (12, 1)],
  term ((-328921600 : Rat) / 150171761) [(8, 2), (11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 307 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0307_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0307
        rs_R013_ueqv_R013YNNN_generator_19_0300_0341 =
      rs_R013_ueqv_R013YNNN_partial_19_0307 := by
  native_decide

/-- Coefficient term 308 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0308 : Poly :=
[
  term ((-7922105354234960 : Rat) / 1288183727709509) [(8, 1), (11, 3), (12, 1), (15, 1)]
]

/-- Partial product 308 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0308 : Poly :=
[
  term ((7922105354234960 : Rat) / 1288183727709509) [(8, 1), (11, 3), (12, 1), (15, 1)],
  term ((-15844210708469920 : Rat) / 1288183727709509) [(8, 2), (11, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 308 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0308_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0308
        rs_R013_ueqv_R013YNNN_generator_19_0300_0341 =
      rs_R013_ueqv_R013YNNN_partial_19_0308 := by
  native_decide

/-- Coefficient term 309 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0309 : Poly :=
[
  term ((3484068180475701389 : Rat) / 10305469821676072) [(8, 1), (11, 3), (15, 1)]
]

/-- Partial product 309 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0309 : Poly :=
[
  term ((-3484068180475701389 : Rat) / 10305469821676072) [(8, 1), (11, 3), (15, 1)],
  term ((3484068180475701389 : Rat) / 5152734910838036) [(8, 2), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 309 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0309_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0309
        rs_R013_ueqv_R013YNNN_generator_19_0300_0341 =
      rs_R013_ueqv_R013YNNN_partial_19_0309 := by
  native_decide

/-- Coefficient term 310 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0310 : Poly :=
[
  term ((-9041041090 : Rat) / 150171761) [(9, 1), (10, 1), (11, 1)]
]

/-- Partial product 310 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0310 : Poly :=
[
  term ((-18082082180 : Rat) / 150171761) [(8, 1), (9, 1), (10, 1), (11, 1)],
  term ((9041041090 : Rat) / 150171761) [(9, 1), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 310 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0310_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0310
        rs_R013_ueqv_R013YNNN_generator_19_0300_0341 =
      rs_R013_ueqv_R013YNNN_partial_19_0310 := by
  native_decide

/-- Coefficient term 311 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0311 : Poly :=
[
  term ((164460800 : Rat) / 150171761) [(9, 1), (10, 1), (11, 1), (12, 1)]
]

/-- Partial product 311 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0311 : Poly :=
[
  term ((328921600 : Rat) / 150171761) [(8, 1), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((-164460800 : Rat) / 150171761) [(9, 1), (10, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 311 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0311_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0311
        rs_R013_ueqv_R013YNNN_generator_19_0300_0341 =
      rs_R013_ueqv_R013YNNN_partial_19_0311 := by
  native_decide

/-- Coefficient term 312 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0312 : Poly :=
[
  term ((7922105354234960 : Rat) / 1288183727709509) [(9, 1), (10, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 312 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0312 : Poly :=
[
  term ((15844210708469920 : Rat) / 1288183727709509) [(8, 1), (9, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((-7922105354234960 : Rat) / 1288183727709509) [(9, 1), (10, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 312 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0312_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0312
        rs_R013_ueqv_R013YNNN_generator_19_0300_0341 =
      rs_R013_ueqv_R013YNNN_partial_19_0312 := by
  native_decide

/-- Coefficient term 313 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0313 : Poly :=
[
  term ((-3484068180475701389 : Rat) / 10305469821676072) [(9, 1), (10, 1), (11, 2), (15, 1)]
]

/-- Partial product 313 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0313 : Poly :=
[
  term ((-3484068180475701389 : Rat) / 5152734910838036) [(8, 1), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((3484068180475701389 : Rat) / 10305469821676072) [(9, 1), (10, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 313 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0313_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0313
        rs_R013_ueqv_R013YNNN_generator_19_0300_0341 =
      rs_R013_ueqv_R013YNNN_partial_19_0313 := by
  native_decide

/-- Coefficient term 314 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0314 : Poly :=
[
  term ((2032075936 : Rat) / 25734207) [(9, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 314 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0314 : Poly :=
[
  term ((4064151872 : Rat) / 25734207) [(8, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-2032075936 : Rat) / 25734207) [(9, 1), (10, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 314 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0314_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0314
        rs_R013_ueqv_R013YNNN_generator_19_0300_0341 =
      rs_R013_ueqv_R013YNNN_partial_19_0314 := by
  native_decide

/-- Coefficient term 315 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0315 : Poly :=
[
  term ((-1386479552 : Rat) / 25734207) [(9, 1), (10, 1), (15, 1)]
]

/-- Partial product 315 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0315 : Poly :=
[
  term ((-2772959104 : Rat) / 25734207) [(8, 1), (9, 1), (10, 1), (15, 1)],
  term ((1386479552 : Rat) / 25734207) [(9, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 315 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0315_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0315
        rs_R013_ueqv_R013YNNN_generator_19_0300_0341 =
      rs_R013_ueqv_R013YNNN_partial_19_0315 := by
  native_decide

/-- Coefficient term 316 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0316 : Poly :=
[
  term ((3853613921 : Rat) / 17156138) [(9, 1), (10, 2), (15, 1)]
]

/-- Partial product 316 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0316 : Poly :=
[
  term ((3853613921 : Rat) / 8578069) [(8, 1), (9, 1), (10, 2), (15, 1)],
  term ((-3853613921 : Rat) / 17156138) [(9, 1), (10, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 316 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0316_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0316
        rs_R013_ueqv_R013YNNN_generator_19_0300_0341 =
      rs_R013_ueqv_R013YNNN_partial_19_0316 := by
  native_decide

/-- Coefficient term 317 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0317 : Poly :=
[
  term (40 : Rat) [(9, 1), (11, 1)]
]

/-- Partial product 317 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0317 : Poly :=
[
  term (80 : Rat) [(8, 1), (9, 1), (11, 1)],
  term (-40 : Rat) [(9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 317 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0317_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0317
        rs_R013_ueqv_R013YNNN_generator_19_0300_0341 =
      rs_R013_ueqv_R013YNNN_partial_19_0317 := by
  native_decide

/-- Coefficient term 318 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0318 : Poly :=
[
  term (-80 : Rat) [(9, 2), (10, 1)]
]

/-- Partial product 318 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0318 : Poly :=
[
  term (-160 : Rat) [(8, 1), (9, 2), (10, 1)],
  term (80 : Rat) [(9, 2), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 318 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0318_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0318
        rs_R013_ueqv_R013YNNN_generator_19_0300_0341 =
      rs_R013_ueqv_R013YNNN_partial_19_0318 := by
  native_decide

/-- Coefficient term 319 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0319 : Poly :=
[
  term ((15440524200 : Rat) / 150171761) [(10, 1)]
]

/-- Partial product 319 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0319 : Poly :=
[
  term ((30881048400 : Rat) / 150171761) [(8, 1), (10, 1)],
  term ((-15440524200 : Rat) / 150171761) [(10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 319 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0319_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0319
        rs_R013_ueqv_R013YNNN_generator_19_0300_0341 =
      rs_R013_ueqv_R013YNNN_partial_19_0319 := by
  native_decide

/-- Coefficient term 320 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0320 : Poly :=
[
  term ((608910087499491392 : Rat) / 1288183727709509) [(10, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 320 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0320 : Poly :=
[
  term ((1217820174998982784 : Rat) / 1288183727709509) [(8, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-608910087499491392 : Rat) / 1288183727709509) [(10, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 320 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0320_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0320
        rs_R013_ueqv_R013YNNN_generator_19_0300_0341 =
      rs_R013_ueqv_R013YNNN_partial_19_0320 := by
  native_decide

/-- Coefficient term 321 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0321 : Poly :=
[
  term ((-105349992610495515 : Rat) / 303102053578708) [(10, 1), (11, 1), (15, 1)]
]

/-- Partial product 321 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0321 : Poly :=
[
  term ((-105349992610495515 : Rat) / 151551026789354) [(8, 1), (10, 1), (11, 1), (15, 1)],
  term ((105349992610495515 : Rat) / 303102053578708) [(10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 321 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0321_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0321
        rs_R013_ueqv_R013YNNN_generator_19_0300_0341 =
      rs_R013_ueqv_R013YNNN_partial_19_0321 := by
  native_decide

/-- Coefficient term 322 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0322 : Poly :=
[
  term ((-40700204940 : Rat) / 150171761) [(10, 1), (11, 2)]
]

/-- Partial product 322 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0322 : Poly :=
[
  term ((-81400409880 : Rat) / 150171761) [(8, 1), (10, 1), (11, 2)],
  term ((40700204940 : Rat) / 150171761) [(10, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 322 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0322_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0322
        rs_R013_ueqv_R013YNNN_generator_19_0300_0341 =
      rs_R013_ueqv_R013YNNN_partial_19_0322 := by
  native_decide

/-- Coefficient term 323 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0323 : Poly :=
[
  term ((986764800 : Rat) / 150171761) [(10, 1), (11, 2), (12, 1)]
]

/-- Partial product 323 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0323 : Poly :=
[
  term ((1973529600 : Rat) / 150171761) [(8, 1), (10, 1), (11, 2), (12, 1)],
  term ((-986764800 : Rat) / 150171761) [(10, 1), (11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 323 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0323_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0323
        rs_R013_ueqv_R013YNNN_generator_19_0300_0341 =
      rs_R013_ueqv_R013YNNN_partial_19_0323 := by
  native_decide

/-- Coefficient term 324 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0324 : Poly :=
[
  term ((-7922105354234960 : Rat) / 1288183727709509) [(10, 1), (11, 2), (12, 1), (15, 2)]
]

/-- Partial product 324 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0324 : Poly :=
[
  term ((-15844210708469920 : Rat) / 1288183727709509) [(8, 1), (10, 1), (11, 2), (12, 1), (15, 2)],
  term ((7922105354234960 : Rat) / 1288183727709509) [(10, 1), (11, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 324 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0324_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0324
        rs_R013_ueqv_R013YNNN_generator_19_0300_0341 =
      rs_R013_ueqv_R013YNNN_partial_19_0324 := by
  native_decide

/-- Coefficient term 325 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0325 : Poly :=
[
  term ((3484068180475701389 : Rat) / 10305469821676072) [(10, 1), (11, 2), (15, 2)]
]

/-- Partial product 325 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0325 : Poly :=
[
  term ((3484068180475701389 : Rat) / 5152734910838036) [(8, 1), (10, 1), (11, 2), (15, 2)],
  term ((-3484068180475701389 : Rat) / 10305469821676072) [(10, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 325 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0325_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0325
        rs_R013_ueqv_R013YNNN_generator_19_0300_0341 =
      rs_R013_ueqv_R013YNNN_partial_19_0325 := by
  native_decide

/-- Coefficient term 326 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0326 : Poly :=
[
  term ((47532632125409760 : Rat) / 1288183727709509) [(10, 1), (11, 3), (12, 1), (15, 1)]
]

/-- Partial product 326 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0326 : Poly :=
[
  term ((95065264250819520 : Rat) / 1288183727709509) [(8, 1), (10, 1), (11, 3), (12, 1), (15, 1)],
  term ((-47532632125409760 : Rat) / 1288183727709509) [(10, 1), (11, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 326 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0326_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0326
        rs_R013_ueqv_R013YNNN_generator_19_0300_0341 =
      rs_R013_ueqv_R013YNNN_partial_19_0326 := by
  native_decide

/-- Coefficient term 327 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0327 : Poly :=
[
  term ((-7842143817216848487 : Rat) / 5152734910838036) [(10, 1), (11, 3), (15, 1)]
]

/-- Partial product 327 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0327 : Poly :=
[
  term ((-7842143817216848487 : Rat) / 2576367455419018) [(8, 1), (10, 1), (11, 3), (15, 1)],
  term ((7842143817216848487 : Rat) / 5152734910838036) [(10, 1), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 327 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0327_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0327
        rs_R013_ueqv_R013YNNN_generator_19_0300_0341 =
      rs_R013_ueqv_R013YNNN_partial_19_0327 := by
  native_decide

/-- Coefficient term 328 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0328 : Poly :=
[
  term ((-2032075936 : Rat) / 25734207) [(10, 1), (12, 1), (15, 2)]
]

/-- Partial product 328 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0328 : Poly :=
[
  term ((-4064151872 : Rat) / 25734207) [(8, 1), (10, 1), (12, 1), (15, 2)],
  term ((2032075936 : Rat) / 25734207) [(10, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 328 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0328_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0328
        rs_R013_ueqv_R013YNNN_generator_19_0300_0341 =
      rs_R013_ueqv_R013YNNN_partial_19_0328 := by
  native_decide

/-- Coefficient term 329 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0329 : Poly :=
[
  term ((1386479552 : Rat) / 25734207) [(10, 1), (15, 2)]
]

/-- Partial product 329 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0329 : Poly :=
[
  term ((2772959104 : Rat) / 25734207) [(8, 1), (10, 1), (15, 2)],
  term ((-1386479552 : Rat) / 25734207) [(10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 329 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0329_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0329
        rs_R013_ueqv_R013YNNN_generator_19_0300_0341 =
      rs_R013_ueqv_R013YNNN_partial_19_0329 := by
  native_decide

/-- Coefficient term 330 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0330 : Poly :=
[
  term ((-1973529600 : Rat) / 150171761) [(10, 2), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 330 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0330 : Poly :=
[
  term ((-3947059200 : Rat) / 150171761) [(8, 1), (10, 2), (11, 1), (12, 1), (15, 1)],
  term ((1973529600 : Rat) / 150171761) [(10, 2), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 330 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0330_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0330
        rs_R013_ueqv_R013YNNN_generator_19_0300_0341 =
      rs_R013_ueqv_R013YNNN_partial_19_0330 := by
  native_decide

/-- Coefficient term 331 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0331 : Poly :=
[
  term ((81400409880 : Rat) / 150171761) [(10, 2), (11, 1), (15, 1)]
]

/-- Partial product 331 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0331 : Poly :=
[
  term ((162800819760 : Rat) / 150171761) [(8, 1), (10, 2), (11, 1), (15, 1)],
  term ((-81400409880 : Rat) / 150171761) [(10, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 331 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0331_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0331
        rs_R013_ueqv_R013YNNN_generator_19_0300_0341 =
      rs_R013_ueqv_R013YNNN_partial_19_0331 := by
  native_decide

/-- Coefficient term 332 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0332 : Poly :=
[
  term ((-95065264250819520 : Rat) / 1288183727709509) [(10, 2), (11, 2), (12, 1), (15, 2)]
]

/-- Partial product 332 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0332 : Poly :=
[
  term ((-190130528501639040 : Rat) / 1288183727709509) [(8, 1), (10, 2), (11, 2), (12, 1), (15, 2)],
  term ((95065264250819520 : Rat) / 1288183727709509) [(10, 2), (11, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 332 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0332_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0332
        rs_R013_ueqv_R013YNNN_generator_19_0300_0341 =
      rs_R013_ueqv_R013YNNN_partial_19_0332 := by
  native_decide

/-- Coefficient term 333 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0333 : Poly :=
[
  term ((7842143817216848487 : Rat) / 2576367455419018) [(10, 2), (11, 2), (15, 2)]
]

/-- Partial product 333 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0333 : Poly :=
[
  term ((7842143817216848487 : Rat) / 1288183727709509) [(8, 1), (10, 2), (11, 2), (15, 2)],
  term ((-7842143817216848487 : Rat) / 2576367455419018) [(10, 2), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 333 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0333_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0333
        rs_R013_ueqv_R013YNNN_generator_19_0300_0341 =
      rs_R013_ueqv_R013YNNN_partial_19_0333 := by
  native_decide

/-- Coefficient term 334 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0334 : Poly :=
[
  term ((-8128303744 : Rat) / 8578069) [(10, 2), (12, 1), (15, 2)]
]

/-- Partial product 334 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0334 : Poly :=
[
  term ((-16256607488 : Rat) / 8578069) [(8, 1), (10, 2), (12, 1), (15, 2)],
  term ((8128303744 : Rat) / 8578069) [(10, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 334 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0334_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0334
        rs_R013_ueqv_R013YNNN_generator_19_0300_0341 =
      rs_R013_ueqv_R013YNNN_partial_19_0334 := by
  native_decide

/-- Coefficient term 335 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0335 : Poly :=
[
  term ((26095795363 : Rat) / 17156138) [(10, 2), (15, 2)]
]

/-- Partial product 335 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0335 : Poly :=
[
  term ((26095795363 : Rat) / 8578069) [(8, 1), (10, 2), (15, 2)],
  term ((-26095795363 : Rat) / 17156138) [(10, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 335 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0335_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0335
        rs_R013_ueqv_R013YNNN_generator_19_0300_0341 =
      rs_R013_ueqv_R013YNNN_partial_19_0335 := by
  native_decide

/-- Coefficient term 336 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0336 : Poly :=
[
  term ((-1016037968 : Rat) / 25734207) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 336 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0336 : Poly :=
[
  term ((-2032075936 : Rat) / 25734207) [(8, 1), (11, 1), (12, 1), (15, 1)],
  term ((1016037968 : Rat) / 25734207) [(11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 336 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0336_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0336
        rs_R013_ueqv_R013YNNN_generator_19_0300_0341 =
      rs_R013_ueqv_R013YNNN_partial_19_0336 := by
  native_decide

/-- Coefficient term 337 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0337 : Poly :=
[
  term ((693239776 : Rat) / 25734207) [(11, 1), (15, 1)]
]

/-- Partial product 337 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0337 : Poly :=
[
  term ((1386479552 : Rat) / 25734207) [(8, 1), (11, 1), (15, 1)],
  term ((-693239776 : Rat) / 25734207) [(11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 337 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0337_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0337
        rs_R013_ueqv_R013YNNN_generator_19_0300_0341 =
      rs_R013_ueqv_R013YNNN_partial_19_0337 := by
  native_decide

/-- Coefficient term 338 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0338 : Poly :=
[
  term ((4520520545 : Rat) / 150171761) [(11, 2)]
]

/-- Partial product 338 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0338 : Poly :=
[
  term ((9041041090 : Rat) / 150171761) [(8, 1), (11, 2)],
  term ((-4520520545 : Rat) / 150171761) [(11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 338 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0338_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0338
        rs_R013_ueqv_R013YNNN_generator_19_0300_0341 =
      rs_R013_ueqv_R013YNNN_partial_19_0338 := by
  native_decide

/-- Coefficient term 339 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0339 : Poly :=
[
  term ((-82230400 : Rat) / 150171761) [(11, 2), (12, 1)]
]

/-- Partial product 339 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0339 : Poly :=
[
  term ((-164460800 : Rat) / 150171761) [(8, 1), (11, 2), (12, 1)],
  term ((82230400 : Rat) / 150171761) [(11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 339 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0339_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0339
        rs_R013_ueqv_R013YNNN_generator_19_0300_0341 =
      rs_R013_ueqv_R013YNNN_partial_19_0339 := by
  native_decide

/-- Coefficient term 340 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0340 : Poly :=
[
  term ((-3961052677117480 : Rat) / 1288183727709509) [(11, 3), (12, 1), (15, 1)]
]

/-- Partial product 340 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0340 : Poly :=
[
  term ((-7922105354234960 : Rat) / 1288183727709509) [(8, 1), (11, 3), (12, 1), (15, 1)],
  term ((3961052677117480 : Rat) / 1288183727709509) [(11, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 340 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0340_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0340
        rs_R013_ueqv_R013YNNN_generator_19_0300_0341 =
      rs_R013_ueqv_R013YNNN_partial_19_0340 := by
  native_decide

/-- Coefficient term 341 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0341 : Poly :=
[
  term ((3484068180475701389 : Rat) / 20610939643352144) [(11, 3), (15, 1)]
]

/-- Partial product 341 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0341 : Poly :=
[
  term ((3484068180475701389 : Rat) / 10305469821676072) [(8, 1), (11, 3), (15, 1)],
  term ((-3484068180475701389 : Rat) / 20610939643352144) [(11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 341 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0341_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0341
        rs_R013_ueqv_R013YNNN_generator_19_0300_0341 =
      rs_R013_ueqv_R013YNNN_partial_19_0341 := by
  native_decide

/-- Partial products in this block. -/
def rs_R013_ueqv_R013YNNN_partials_19_0300_0341 : List Poly :=
[
  rs_R013_ueqv_R013YNNN_partial_19_0300,
  rs_R013_ueqv_R013YNNN_partial_19_0301,
  rs_R013_ueqv_R013YNNN_partial_19_0302,
  rs_R013_ueqv_R013YNNN_partial_19_0303,
  rs_R013_ueqv_R013YNNN_partial_19_0304,
  rs_R013_ueqv_R013YNNN_partial_19_0305,
  rs_R013_ueqv_R013YNNN_partial_19_0306,
  rs_R013_ueqv_R013YNNN_partial_19_0307,
  rs_R013_ueqv_R013YNNN_partial_19_0308,
  rs_R013_ueqv_R013YNNN_partial_19_0309,
  rs_R013_ueqv_R013YNNN_partial_19_0310,
  rs_R013_ueqv_R013YNNN_partial_19_0311,
  rs_R013_ueqv_R013YNNN_partial_19_0312,
  rs_R013_ueqv_R013YNNN_partial_19_0313,
  rs_R013_ueqv_R013YNNN_partial_19_0314,
  rs_R013_ueqv_R013YNNN_partial_19_0315,
  rs_R013_ueqv_R013YNNN_partial_19_0316,
  rs_R013_ueqv_R013YNNN_partial_19_0317,
  rs_R013_ueqv_R013YNNN_partial_19_0318,
  rs_R013_ueqv_R013YNNN_partial_19_0319,
  rs_R013_ueqv_R013YNNN_partial_19_0320,
  rs_R013_ueqv_R013YNNN_partial_19_0321,
  rs_R013_ueqv_R013YNNN_partial_19_0322,
  rs_R013_ueqv_R013YNNN_partial_19_0323,
  rs_R013_ueqv_R013YNNN_partial_19_0324,
  rs_R013_ueqv_R013YNNN_partial_19_0325,
  rs_R013_ueqv_R013YNNN_partial_19_0326,
  rs_R013_ueqv_R013YNNN_partial_19_0327,
  rs_R013_ueqv_R013YNNN_partial_19_0328,
  rs_R013_ueqv_R013YNNN_partial_19_0329,
  rs_R013_ueqv_R013YNNN_partial_19_0330,
  rs_R013_ueqv_R013YNNN_partial_19_0331,
  rs_R013_ueqv_R013YNNN_partial_19_0332,
  rs_R013_ueqv_R013YNNN_partial_19_0333,
  rs_R013_ueqv_R013YNNN_partial_19_0334,
  rs_R013_ueqv_R013YNNN_partial_19_0335,
  rs_R013_ueqv_R013YNNN_partial_19_0336,
  rs_R013_ueqv_R013YNNN_partial_19_0337,
  rs_R013_ueqv_R013YNNN_partial_19_0338,
  rs_R013_ueqv_R013YNNN_partial_19_0339,
  rs_R013_ueqv_R013YNNN_partial_19_0340,
  rs_R013_ueqv_R013YNNN_partial_19_0341
]

/-- Sum of partial products in this block. -/
def rs_R013_ueqv_R013YNNN_block_19_0300_0341 : Poly :=
[
  term (20 : Rat) [(8, 1)],
  term ((-18082082180 : Rat) / 150171761) [(8, 1), (9, 1), (10, 1), (11, 1)],
  term ((328921600 : Rat) / 150171761) [(8, 1), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((15844210708469920 : Rat) / 1288183727709509) [(8, 1), (9, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((-3484068180475701389 : Rat) / 5152734910838036) [(8, 1), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((4064151872 : Rat) / 25734207) [(8, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-2772959104 : Rat) / 25734207) [(8, 1), (9, 1), (10, 1), (15, 1)],
  term ((3853613921 : Rat) / 8578069) [(8, 1), (9, 1), (10, 2), (15, 1)],
  term (-160 : Rat) [(8, 1), (9, 2), (10, 1)],
  term ((24874177960 : Rat) / 150171761) [(8, 1), (10, 1)],
  term ((1217820174998982784 : Rat) / 1288183727709509) [(8, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-35654290754345261 : Rat) / 75775513394677) [(8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-81400409880 : Rat) / 150171761) [(8, 1), (10, 1), (11, 2)],
  term ((1973529600 : Rat) / 150171761) [(8, 1), (10, 1), (11, 2), (12, 1)],
  term ((-15844210708469920 : Rat) / 1288183727709509) [(8, 1), (10, 1), (11, 2), (12, 1), (15, 2)],
  term ((3484068180475701389 : Rat) / 5152734910838036) [(8, 1), (10, 1), (11, 2), (15, 2)],
  term ((95065264250819520 : Rat) / 1288183727709509) [(8, 1), (10, 1), (11, 3), (12, 1), (15, 1)],
  term ((-7842143817216848487 : Rat) / 2576367455419018) [(8, 1), (10, 1), (11, 3), (15, 1)],
  term ((-4064151872 : Rat) / 25734207) [(8, 1), (10, 1), (12, 1), (15, 2)],
  term ((2772959104 : Rat) / 25734207) [(8, 1), (10, 1), (15, 2)],
  term ((-3947059200 : Rat) / 150171761) [(8, 1), (10, 2), (11, 1), (12, 1), (15, 1)],
  term ((162800819760 : Rat) / 150171761) [(8, 1), (10, 2), (11, 1), (15, 1)],
  term ((-190130528501639040 : Rat) / 1288183727709509) [(8, 1), (10, 2), (11, 2), (12, 1), (15, 2)],
  term ((7842143817216848487 : Rat) / 1288183727709509) [(8, 1), (10, 2), (11, 2), (15, 2)],
  term ((-16256607488 : Rat) / 8578069) [(8, 1), (10, 2), (12, 1), (15, 2)],
  term ((26095795363 : Rat) / 8578069) [(8, 1), (10, 2), (15, 2)],
  term (-40 : Rat) [(8, 2)],
  term (160 : Rat) [(8, 2), (9, 1), (11, 1)],
  term (80 : Rat) [(8, 2), (10, 1)],
  term ((-3853613921 : Rat) / 8578069) [(8, 2), (10, 1), (11, 1), (15, 1)],
  term ((-4064151872 : Rat) / 25734207) [(8, 2), (11, 1), (12, 1), (15, 1)],
  term ((2772959104 : Rat) / 25734207) [(8, 2), (11, 1), (15, 1)],
  term ((18082082180 : Rat) / 150171761) [(8, 2), (11, 2)],
  term ((-328921600 : Rat) / 150171761) [(8, 2), (11, 2), (12, 1)],
  term ((-15844210708469920 : Rat) / 1288183727709509) [(8, 2), (11, 3), (12, 1), (15, 1)],
  term ((3484068180475701389 : Rat) / 5152734910838036) [(8, 2), (11, 3), (15, 1)],
  term ((9041041090 : Rat) / 150171761) [(9, 1), (10, 1), (11, 1)],
  term ((-164460800 : Rat) / 150171761) [(9, 1), (10, 1), (11, 1), (12, 1)],
  term ((-7922105354234960 : Rat) / 1288183727709509) [(9, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((3484068180475701389 : Rat) / 10305469821676072) [(9, 1), (10, 1), (11, 2), (15, 1)],
  term ((-2032075936 : Rat) / 25734207) [(9, 1), (10, 1), (12, 1), (15, 1)],
  term ((1386479552 : Rat) / 25734207) [(9, 1), (10, 1), (15, 1)],
  term ((-3853613921 : Rat) / 17156138) [(9, 1), (10, 2), (15, 1)],
  term (-40 : Rat) [(9, 1), (11, 1)],
  term (80 : Rat) [(9, 2), (10, 1)],
  term ((-15440524200 : Rat) / 150171761) [(10, 1)],
  term ((-608910087499491392 : Rat) / 1288183727709509) [(10, 1), (11, 1), (12, 1), (15, 1)],
  term ((105349992610495515 : Rat) / 303102053578708) [(10, 1), (11, 1), (15, 1)],
  term ((40700204940 : Rat) / 150171761) [(10, 1), (11, 2)],
  term ((-986764800 : Rat) / 150171761) [(10, 1), (11, 2), (12, 1)],
  term ((7922105354234960 : Rat) / 1288183727709509) [(10, 1), (11, 2), (12, 1), (15, 2)],
  term ((-3484068180475701389 : Rat) / 10305469821676072) [(10, 1), (11, 2), (15, 2)],
  term ((-47532632125409760 : Rat) / 1288183727709509) [(10, 1), (11, 3), (12, 1), (15, 1)],
  term ((7842143817216848487 : Rat) / 5152734910838036) [(10, 1), (11, 3), (15, 1)],
  term ((2032075936 : Rat) / 25734207) [(10, 1), (12, 1), (15, 2)],
  term ((-1386479552 : Rat) / 25734207) [(10, 1), (15, 2)],
  term ((1973529600 : Rat) / 150171761) [(10, 2), (11, 1), (12, 1), (15, 1)],
  term ((-81400409880 : Rat) / 150171761) [(10, 2), (11, 1), (15, 1)],
  term ((95065264250819520 : Rat) / 1288183727709509) [(10, 2), (11, 2), (12, 1), (15, 2)],
  term ((-7842143817216848487 : Rat) / 2576367455419018) [(10, 2), (11, 2), (15, 2)],
  term ((8128303744 : Rat) / 8578069) [(10, 2), (12, 1), (15, 2)],
  term ((-26095795363 : Rat) / 17156138) [(10, 2), (15, 2)],
  term ((1016037968 : Rat) / 25734207) [(11, 1), (12, 1), (15, 1)],
  term ((-693239776 : Rat) / 25734207) [(11, 1), (15, 1)],
  term ((-4520520545 : Rat) / 150171761) [(11, 2)],
  term ((82230400 : Rat) / 150171761) [(11, 2), (12, 1)],
  term ((3961052677117480 : Rat) / 1288183727709509) [(11, 3), (12, 1), (15, 1)],
  term ((-3484068180475701389 : Rat) / 20610939643352144) [(11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 19, terms 300 through 341. -/
theorem rs_R013_ueqv_R013YNNN_block_19_0300_0341_valid :
    checkProductSumEq rs_R013_ueqv_R013YNNN_partials_19_0300_0341
      rs_R013_ueqv_R013YNNN_block_19_0300_0341 = true := by
  native_decide

end R013UeqvR013YNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
