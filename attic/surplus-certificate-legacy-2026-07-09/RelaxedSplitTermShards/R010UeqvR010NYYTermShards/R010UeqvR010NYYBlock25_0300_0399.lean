/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010NYY, term block 25:300-399

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010NYYTermShards

/-- Generator polynomial 25 for relaxed split surplus certificate `R010:u=v:R010NYY`. -/
def rs_R010_ueqv_R010NYY_generator_25_0300_0399 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(12, 1)]
]

/-- Coefficient term 300 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0300 : Poly :=
[
  term ((10925110817965791 : Rat) / 4700632819101926) [(1, 1), (3, 1), (5, 1), (8, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 300 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0300 : Poly :=
[
  term ((10925110817965791 : Rat) / 2350316409550963) [(1, 1), (3, 1), (5, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-10925110817965791 : Rat) / 4700632819101926) [(1, 1), (3, 1), (5, 1), (8, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 300 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0300_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0300
        rs_R010_ueqv_R010NYY_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_25_0300 := by
  native_decide

/-- Coefficient term 301 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0301 : Poly :=
[
  term ((-445809356405963151255 : Rat) / 16847068023661302784) [(1, 1), (3, 1), (5, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 301 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0301 : Poly :=
[
  term ((-445809356405963151255 : Rat) / 8423534011830651392) [(1, 1), (3, 1), (5, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((445809356405963151255 : Rat) / 16847068023661302784) [(1, 1), (3, 1), (5, 1), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 301 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0301_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0301
        rs_R010_ueqv_R010NYY_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_25_0301 := by
  native_decide

/-- Coefficient term 302 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0302 : Poly :=
[
  term ((-32775332453897373 : Rat) / 37605062552815408) [(1, 1), (3, 1), (5, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 302 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0302 : Poly :=
[
  term ((-32775332453897373 : Rat) / 18802531276407704) [(1, 1), (3, 1), (5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((32775332453897373 : Rat) / 37605062552815408) [(1, 1), (3, 1), (5, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 302 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0302_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0302
        rs_R010_ueqv_R010NYY_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_25_0302 := by
  native_decide

/-- Coefficient term 303 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0303 : Poly :=
[
  term ((-3641703605988597 : Rat) / 9401265638203852) [(1, 1), (3, 1), (5, 1), (9, 1), (12, 1), (16, 1)]
]

/-- Partial product 303 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0303 : Poly :=
[
  term ((3641703605988597 : Rat) / 9401265638203852) [(1, 1), (3, 1), (5, 1), (9, 1), (12, 1), (16, 1)],
  term ((-3641703605988597 : Rat) / 4700632819101926) [(1, 1), (3, 1), (5, 1), (9, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 303 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0303_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0303
        rs_R010_ueqv_R010NYY_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_25_0303 := by
  native_decide

/-- Coefficient term 304 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0304 : Poly :=
[
  term ((13941655304926345515 : Rat) / 2105883502957662848) [(1, 1), (3, 1), (5, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 304 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0304 : Poly :=
[
  term ((13941655304926345515 : Rat) / 1052941751478831424) [(1, 1), (3, 1), (5, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-13941655304926345515 : Rat) / 2105883502957662848) [(1, 1), (3, 1), (5, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 304 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0304_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0304
        rs_R010_ueqv_R010NYY_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_25_0304 := by
  native_decide

/-- Coefficient term 305 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0305 : Poly :=
[
  term ((13125913697184899787 : Rat) / 4211767005915325696) [(1, 1), (3, 1), (5, 1), (9, 1), (16, 1)]
]

/-- Partial product 305 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0305 : Poly :=
[
  term ((13125913697184899787 : Rat) / 2105883502957662848) [(1, 1), (3, 1), (5, 1), (9, 1), (12, 1), (16, 1)],
  term ((-13125913697184899787 : Rat) / 4211767005915325696) [(1, 1), (3, 1), (5, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 305 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0305_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0305
        rs_R010_ueqv_R010NYY_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_25_0305 := by
  native_decide

/-- Coefficient term 306 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0306 : Poly :=
[
  term ((10925110817965791 : Rat) / 9401265638203852) [(1, 1), (3, 1), (5, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 306 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0306 : Poly :=
[
  term ((-10925110817965791 : Rat) / 9401265638203852) [(1, 1), (3, 1), (5, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 4700632819101926) [(1, 1), (3, 1), (5, 1), (10, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 306 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0306_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0306
        rs_R010_ueqv_R010NYY_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_25_0306 := by
  native_decide

/-- Coefficient term 307 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0307 : Poly :=
[
  term ((-10925110817965791 : Rat) / 4700632819101926) [(1, 1), (3, 1), (5, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 307 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0307 : Poly :=
[
  term ((-10925110817965791 : Rat) / 2350316409550963) [(1, 1), (3, 1), (5, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 4700632819101926) [(1, 1), (3, 1), (5, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 307 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0307_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0307
        rs_R010_ueqv_R010NYY_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_25_0307 := by
  native_decide

/-- Coefficient term 308 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0308 : Poly :=
[
  term ((-10925110817965791 : Rat) / 4700632819101926) [(1, 1), (3, 1), (5, 1), (11, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 308 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0308 : Poly :=
[
  term ((-10925110817965791 : Rat) / 2350316409550963) [(1, 1), (3, 1), (5, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 4700632819101926) [(1, 1), (3, 1), (5, 1), (11, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 308 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0308_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0308
        rs_R010_ueqv_R010NYY_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_25_0308 := by
  native_decide

/-- Coefficient term 309 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0309 : Poly :=
[
  term ((462805582251370797171 : Rat) / 16847068023661302784) [(1, 1), (3, 1), (5, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 309 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0309 : Poly :=
[
  term ((462805582251370797171 : Rat) / 8423534011830651392) [(1, 1), (3, 1), (5, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-462805582251370797171 : Rat) / 16847068023661302784) [(1, 1), (3, 1), (5, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 309 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0309_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0309
        rs_R010_ueqv_R010NYY_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_25_0309 := by
  native_decide

/-- Coefficient term 310 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0310 : Poly :=
[
  term ((4249056461351911479 : Rat) / 8423534011830651392) [(1, 1), (3, 1), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 310 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0310 : Poly :=
[
  term ((4249056461351911479 : Rat) / 4211767005915325696) [(1, 1), (3, 1), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((-4249056461351911479 : Rat) / 8423534011830651392) [(1, 1), (3, 1), (5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 310 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0310_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0310
        rs_R010_ueqv_R010NYY_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_25_0310 := by
  native_decide

/-- Coefficient term 311 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0311 : Poly :=
[
  term ((200328279759090787245 : Rat) / 33694136047322605568) [(1, 1), (3, 1), (5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 311 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0311 : Poly :=
[
  term ((-200328279759090787245 : Rat) / 33694136047322605568) [(1, 1), (3, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((200328279759090787245 : Rat) / 16847068023661302784) [(1, 1), (3, 1), (5, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 311 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0311_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0311
        rs_R010_ueqv_R010NYY_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_25_0311 := by
  native_decide

/-- Coefficient term 312 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0312 : Poly :=
[
  term ((33667549837364579265 : Rat) / 33694136047322605568) [(1, 1), (3, 1), (5, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 312 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0312 : Poly :=
[
  term ((33667549837364579265 : Rat) / 16847068023661302784) [(1, 1), (3, 1), (5, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-33667549837364579265 : Rat) / 33694136047322605568) [(1, 1), (3, 1), (5, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 312 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0312_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0312
        rs_R010_ueqv_R010NYY_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_25_0312 := by
  native_decide

/-- Coefficient term 313 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0313 : Poly :=
[
  term ((33667549837364579265 : Rat) / 67388272094645211136) [(1, 1), (3, 1), (5, 1), (13, 1), (16, 1)]
]

/-- Partial product 313 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0313 : Poly :=
[
  term ((33667549837364579265 : Rat) / 33694136047322605568) [(1, 1), (3, 1), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((-33667549837364579265 : Rat) / 67388272094645211136) [(1, 1), (3, 1), (5, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 313 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0313_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0313
        rs_R010_ueqv_R010NYY_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_25_0313 := by
  native_decide

/-- Coefficient term 314 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0314 : Poly :=
[
  term ((-250161351903438748593 : Rat) / 67388272094645211136) [(1, 1), (3, 1), (5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 314 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0314 : Poly :=
[
  term ((-250161351903438748593 : Rat) / 33694136047322605568) [(1, 1), (3, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((250161351903438748593 : Rat) / 67388272094645211136) [(1, 1), (3, 1), (5, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 314 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0314_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0314
        rs_R010_ueqv_R010NYY_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_25_0314 := by
  native_decide

/-- Coefficient term 315 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0315 : Poly :=
[
  term ((879497942912447125641 : Rat) / 134776544189290422272) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 315 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0315 : Poly :=
[
  term ((879497942912447125641 : Rat) / 67388272094645211136) [(1, 1), (3, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-879497942912447125641 : Rat) / 134776544189290422272) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 315 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0315_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0315
        rs_R010_ueqv_R010NYY_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_25_0315 := by
  native_decide

/-- Coefficient term 316 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0316 : Poly :=
[
  term ((363534495967615059 : Rat) / 4700632819101926) [(1, 1), (3, 1), (7, 1), (8, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 316 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0316 : Poly :=
[
  term ((363534495967615059 : Rat) / 2350316409550963) [(1, 1), (3, 1), (7, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-363534495967615059 : Rat) / 4700632819101926) [(1, 1), (3, 1), (7, 1), (8, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 316 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0316_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0316
        rs_R010_ueqv_R010NYY_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_25_0316 := by
  native_decide

/-- Coefficient term 317 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0317 : Poly :=
[
  term ((-2647720545115526336833 : Rat) / 8423534011830651392) [(1, 1), (3, 1), (7, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 317 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0317 : Poly :=
[
  term ((-2647720545115526336833 : Rat) / 4211767005915325696) [(1, 1), (3, 1), (7, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((2647720545115526336833 : Rat) / 8423534011830651392) [(1, 1), (3, 1), (7, 1), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 317 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0317_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0317
        rs_R010_ueqv_R010NYY_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_25_0317 := by
  native_decide

/-- Coefficient term 318 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0318 : Poly :=
[
  term ((-921238143868634625 : Rat) / 11931351291544832) [(1, 1), (3, 1), (7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 318 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0318 : Poly :=
[
  term ((-921238143868634625 : Rat) / 5965675645772416) [(1, 1), (3, 1), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((921238143868634625 : Rat) / 11931351291544832) [(1, 1), (3, 1), (7, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 318 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0318_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0318
        rs_R010_ueqv_R010NYY_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_25_0318 := by
  native_decide

/-- Coefficient term 319 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0319 : Poly :=
[
  term ((-333796423576923 : Rat) / 53264961122968) [(1, 1), (3, 1), (7, 1), (8, 1), (15, 3), (16, 1)]
]

/-- Partial product 319 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0319 : Poly :=
[
  term ((-333796423576923 : Rat) / 26632480561484) [(1, 1), (3, 1), (7, 1), (8, 1), (12, 1), (15, 3), (16, 1)],
  term ((333796423576923 : Rat) / 53264961122968) [(1, 1), (3, 1), (7, 1), (8, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 319 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0319_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0319
        rs_R010_ueqv_R010NYY_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_25_0319 := by
  native_decide

/-- Coefficient term 320 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0320 : Poly :=
[
  term ((-363534495967615059 : Rat) / 4700632819101926) [(1, 1), (3, 1), (7, 1), (11, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 320 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0320 : Poly :=
[
  term ((-363534495967615059 : Rat) / 2350316409550963) [(1, 1), (3, 1), (7, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((363534495967615059 : Rat) / 4700632819101926) [(1, 1), (3, 1), (7, 1), (11, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 320 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0320_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0320
        rs_R010_ueqv_R010NYY_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_25_0320 := by
  native_decide

/-- Coefficient term 321 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0321 : Poly :=
[
  term ((2647720545115526336833 : Rat) / 8423534011830651392) [(1, 1), (3, 1), (7, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 321 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0321 : Poly :=
[
  term ((2647720545115526336833 : Rat) / 4211767005915325696) [(1, 1), (3, 1), (7, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-2647720545115526336833 : Rat) / 8423534011830651392) [(1, 1), (3, 1), (7, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 321 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0321_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0321
        rs_R010_ueqv_R010NYY_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_25_0321 := by
  native_decide

/-- Coefficient term 322 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0322 : Poly :=
[
  term ((363534495967615059 : Rat) / 9401265638203852) [(1, 1), (3, 1), (7, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 322 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0322 : Poly :=
[
  term ((363534495967615059 : Rat) / 4700632819101926) [(1, 1), (3, 1), (7, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(1, 1), (3, 1), (7, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 322 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0322_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0322
        rs_R010_ueqv_R010NYY_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_25_0322 := by
  native_decide

/-- Coefficient term 323 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0323 : Poly :=
[
  term ((-2647720545115526336833 : Rat) / 16847068023661302784) [(1, 1), (3, 1), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 323 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0323 : Poly :=
[
  term ((-2647720545115526336833 : Rat) / 8423534011830651392) [(1, 1), (3, 1), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((2647720545115526336833 : Rat) / 16847068023661302784) [(1, 1), (3, 1), (7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 323 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0323_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0323
        rs_R010_ueqv_R010NYY_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_25_0323 := by
  native_decide

/-- Coefficient term 324 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0324 : Poly :=
[
  term ((921238143868634625 : Rat) / 11931351291544832) [(1, 1), (3, 1), (7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 324 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0324 : Poly :=
[
  term ((921238143868634625 : Rat) / 5965675645772416) [(1, 1), (3, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-921238143868634625 : Rat) / 11931351291544832) [(1, 1), (3, 1), (7, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 324 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0324_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0324
        rs_R010_ueqv_R010NYY_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_25_0324 := by
  native_decide

/-- Coefficient term 325 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0325 : Poly :=
[
  term ((333796423576923 : Rat) / 53264961122968) [(1, 1), (3, 1), (7, 1), (14, 1), (15, 3), (16, 1)]
]

/-- Partial product 325 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0325 : Poly :=
[
  term ((333796423576923 : Rat) / 26632480561484) [(1, 1), (3, 1), (7, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-333796423576923 : Rat) / 53264961122968) [(1, 1), (3, 1), (7, 1), (14, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 325 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0325_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0325
        rs_R010_ueqv_R010NYY_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_25_0325 := by
  native_decide

/-- Coefficient term 326 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0326 : Poly :=
[
  term ((-921238143868634625 : Rat) / 23862702583089664) [(1, 1), (3, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 326 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0326 : Poly :=
[
  term ((-921238143868634625 : Rat) / 11931351291544832) [(1, 1), (3, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((921238143868634625 : Rat) / 23862702583089664) [(1, 1), (3, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 326 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0326_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0326
        rs_R010_ueqv_R010NYY_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_25_0326 := by
  native_decide

/-- Coefficient term 327 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0327 : Poly :=
[
  term ((-333796423576923 : Rat) / 106529922245936) [(1, 1), (3, 1), (7, 1), (15, 3), (16, 1)]
]

/-- Partial product 327 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0327 : Poly :=
[
  term ((-333796423576923 : Rat) / 53264961122968) [(1, 1), (3, 1), (7, 1), (12, 1), (15, 3), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(1, 1), (3, 1), (7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 327 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0327_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0327
        rs_R010_ueqv_R010NYY_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_25_0327 := by
  native_decide

/-- Coefficient term 328 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0328 : Poly :=
[
  term ((447344655430746682449 : Rat) / 4211767005915325696) [(1, 1), (3, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 328 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0328 : Poly :=
[
  term ((447344655430746682449 : Rat) / 2105883502957662848) [(1, 1), (3, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-447344655430746682449 : Rat) / 4211767005915325696) [(1, 1), (3, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 328 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0328_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0328
        rs_R010_ueqv_R010NYY_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_25_0328 := by
  native_decide

/-- Coefficient term 329 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0329 : Poly :=
[
  term ((333796423576923 : Rat) / 53264961122968) [(1, 1), (3, 1), (8, 1), (11, 1), (15, 3), (16, 1)]
]

/-- Partial product 329 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0329 : Poly :=
[
  term ((333796423576923 : Rat) / 26632480561484) [(1, 1), (3, 1), (8, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-333796423576923 : Rat) / 53264961122968) [(1, 1), (3, 1), (8, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 329 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0329_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0329
        rs_R010_ueqv_R010NYY_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_25_0329 := by
  native_decide

/-- Coefficient term 330 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0330 : Poly :=
[
  term ((-363534495967615059 : Rat) / 4700632819101926) [(1, 1), (3, 1), (8, 1), (11, 2), (15, 2), (16, 1)]
]

/-- Partial product 330 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0330 : Poly :=
[
  term ((-363534495967615059 : Rat) / 2350316409550963) [(1, 1), (3, 1), (8, 1), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((363534495967615059 : Rat) / 4700632819101926) [(1, 1), (3, 1), (8, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 330 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0330_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0330
        rs_R010_ueqv_R010NYY_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_25_0330 := by
  native_decide

/-- Coefficient term 331 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0331 : Poly :=
[
  term ((2647720545115526336833 : Rat) / 8423534011830651392) [(1, 1), (3, 1), (8, 1), (11, 2), (16, 1)]
]

/-- Partial product 331 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0331 : Poly :=
[
  term ((2647720545115526336833 : Rat) / 4211767005915325696) [(1, 1), (3, 1), (8, 1), (11, 2), (12, 1), (16, 1)],
  term ((-2647720545115526336833 : Rat) / 8423534011830651392) [(1, 1), (3, 1), (8, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 331 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0331_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0331
        rs_R010_ueqv_R010NYY_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_25_0331 := by
  native_decide

/-- Coefficient term 332 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0332 : Poly :=
[
  term ((-1001389270730769 : Rat) / 426119688983744) [(1, 1), (3, 1), (8, 1), (15, 2), (16, 1)]
]

/-- Partial product 332 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0332 : Poly :=
[
  term ((-1001389270730769 : Rat) / 213059844491872) [(1, 1), (3, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((1001389270730769 : Rat) / 426119688983744) [(1, 1), (3, 1), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 332 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0332_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0332
        rs_R010_ueqv_R010NYY_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_25_0332 := by
  native_decide

/-- Coefficient term 333 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0333 : Poly :=
[
  term ((121178165322538353 : Rat) / 9401265638203852) [(1, 1), (3, 1), (9, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 333 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0333 : Poly :=
[
  term ((-121178165322538353 : Rat) / 9401265638203852) [(1, 1), (3, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((121178165322538353 : Rat) / 4700632819101926) [(1, 1), (3, 1), (9, 1), (11, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 333 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0333_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0333
        rs_R010_ueqv_R010NYY_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_25_0333 := by
  native_decide

/-- Coefficient term 334 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0334 : Poly :=
[
  term ((-59564980477189561005 : Rat) / 1052941751478831424) [(1, 1), (3, 1), (9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 334 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0334 : Poly :=
[
  term ((-59564980477189561005 : Rat) / 526470875739415712) [(1, 1), (3, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((59564980477189561005 : Rat) / 1052941751478831424) [(1, 1), (3, 1), (9, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 334 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0334_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0334
        rs_R010_ueqv_R010NYY_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_25_0334 := by
  native_decide

/-- Coefficient term 335 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0335 : Poly :=
[
  term ((-45993025961065265469 : Rat) / 2105883502957662848) [(1, 1), (3, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 335 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0335 : Poly :=
[
  term ((-45993025961065265469 : Rat) / 1052941751478831424) [(1, 1), (3, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((45993025961065265469 : Rat) / 2105883502957662848) [(1, 1), (3, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 335 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0335_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0335
        rs_R010_ueqv_R010NYY_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_25_0335 := by
  native_decide

/-- Coefficient term 336 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0336 : Poly :=
[
  term ((-111265474525641 : Rat) / 106529922245936) [(1, 1), (3, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 336 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0336 : Poly :=
[
  term ((111265474525641 : Rat) / 106529922245936) [(1, 1), (3, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-111265474525641 : Rat) / 53264961122968) [(1, 1), (3, 1), (9, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 336 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0336_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0336
        rs_R010_ueqv_R010NYY_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_25_0336 := by
  native_decide

/-- Coefficient term 337 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0337 : Poly :=
[
  term ((-21011082738268809 : Rat) / 1491418911443104) [(1, 1), (3, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 337 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0337 : Poly :=
[
  term ((-21011082738268809 : Rat) / 745709455721552) [(1, 1), (3, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((21011082738268809 : Rat) / 1491418911443104) [(1, 1), (3, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 337 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0337_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0337
        rs_R010_ueqv_R010NYY_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_25_0337 := by
  native_decide

/-- Coefficient term 338 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0338 : Poly :=
[
  term ((-22568799381627783 : Rat) / 2982837822886208) [(1, 1), (3, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 338 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0338 : Poly :=
[
  term ((-22568799381627783 : Rat) / 1491418911443104) [(1, 1), (3, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((22568799381627783 : Rat) / 2982837822886208) [(1, 1), (3, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 338 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0338_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0338
        rs_R010_ueqv_R010NYY_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_25_0338 := by
  native_decide

/-- Coefficient term 339 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0339 : Poly :=
[
  term ((-363534495967615059 : Rat) / 9401265638203852) [(1, 1), (3, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 339 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0339 : Poly :=
[
  term ((363534495967615059 : Rat) / 9401265638203852) [(1, 1), (3, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 4700632819101926) [(1, 1), (3, 1), (10, 1), (11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 339 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0339_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0339
        rs_R010_ueqv_R010NYY_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_25_0339 := by
  native_decide

/-- Coefficient term 340 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0340 : Poly :=
[
  term ((363534495967615059 : Rat) / 4700632819101926) [(1, 1), (3, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 340 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0340 : Poly :=
[
  term ((363534495967615059 : Rat) / 2350316409550963) [(1, 1), (3, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 4700632819101926) [(1, 1), (3, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 340 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0340_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0340
        rs_R010_ueqv_R010NYY_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_25_0340 := by
  native_decide

/-- Coefficient term 341 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0341 : Poly :=
[
  term ((333796423576923 : Rat) / 106529922245936) [(1, 1), (3, 1), (10, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 341 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0341 : Poly :=
[
  term ((-333796423576923 : Rat) / 106529922245936) [(1, 1), (3, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((333796423576923 : Rat) / 53264961122968) [(1, 1), (3, 1), (10, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 341 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0341_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0341
        rs_R010_ueqv_R010NYY_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_25_0341 := by
  native_decide

/-- Coefficient term 342 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0342 : Poly :=
[
  term ((-333796423576923 : Rat) / 53264961122968) [(1, 1), (3, 1), (10, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 342 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0342 : Poly :=
[
  term ((-333796423576923 : Rat) / 26632480561484) [(1, 1), (3, 1), (10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((333796423576923 : Rat) / 53264961122968) [(1, 1), (3, 1), (10, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 342 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0342_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0342
        rs_R010_ueqv_R010NYY_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_25_0342 := by
  native_decide

/-- Coefficient term 343 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0343 : Poly :=
[
  term ((281075062940540186709 : Rat) / 16847068023661302784) [(1, 1), (3, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 343 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0343 : Poly :=
[
  term ((-281075062940540186709 : Rat) / 16847068023661302784) [(1, 1), (3, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((281075062940540186709 : Rat) / 8423534011830651392) [(1, 1), (3, 1), (11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 343 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0343_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0343
        rs_R010_ueqv_R010NYY_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_25_0343 := by
  native_decide

/-- Coefficient term 344 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0344 : Poly :=
[
  term ((-42975396270325727655 : Rat) / 16847068023661302784) [(1, 1), (3, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 344 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0344 : Poly :=
[
  term ((-42975396270325727655 : Rat) / 8423534011830651392) [(1, 1), (3, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((42975396270325727655 : Rat) / 16847068023661302784) [(1, 1), (3, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 344 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0344_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0344
        rs_R010_ueqv_R010NYY_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_25_0344 := by
  native_decide

/-- Coefficient term 345 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0345 : Poly :=
[
  term ((-42975396270325727655 : Rat) / 33694136047322605568) [(1, 1), (3, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 345 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0345 : Poly :=
[
  term ((-42975396270325727655 : Rat) / 16847068023661302784) [(1, 1), (3, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((42975396270325727655 : Rat) / 33694136047322605568) [(1, 1), (3, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 345 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0345_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0345
        rs_R010_ueqv_R010NYY_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_25_0345 := by
  native_decide

/-- Coefficient term 346 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0346 : Poly :=
[
  term ((-628037636247657646743 : Rat) / 4813448006760372224) [(1, 1), (3, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 346 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0346 : Poly :=
[
  term ((-628037636247657646743 : Rat) / 2406724003380186112) [(1, 1), (3, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((628037636247657646743 : Rat) / 4813448006760372224) [(1, 1), (3, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 346 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0346_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0346
        rs_R010_ueqv_R010NYY_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_25_0346 := by
  native_decide

/-- Coefficient term 347 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0347 : Poly :=
[
  term ((-333796423576923 : Rat) / 53264961122968) [(1, 1), (3, 1), (11, 1), (14, 1), (15, 3), (16, 1)]
]

/-- Partial product 347 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0347 : Poly :=
[
  term ((-333796423576923 : Rat) / 26632480561484) [(1, 1), (3, 1), (11, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((333796423576923 : Rat) / 53264961122968) [(1, 1), (3, 1), (11, 1), (14, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 347 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0347_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0347
        rs_R010_ueqv_R010NYY_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_25_0347 := by
  native_decide

/-- Coefficient term 348 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0348 : Poly :=
[
  term ((-2118782434089019980815 : Rat) / 67388272094645211136) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 348 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0348 : Poly :=
[
  term ((-2118782434089019980815 : Rat) / 33694136047322605568) [(1, 1), (3, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((2118782434089019980815 : Rat) / 67388272094645211136) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 348 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0348_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0348
        rs_R010_ueqv_R010NYY_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_25_0348 := by
  native_decide

/-- Coefficient term 349 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0349 : Poly :=
[
  term ((363534495967615059 : Rat) / 4700632819101926) [(1, 1), (3, 1), (11, 2), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 349 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0349 : Poly :=
[
  term ((363534495967615059 : Rat) / 2350316409550963) [(1, 1), (3, 1), (11, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-363534495967615059 : Rat) / 4700632819101926) [(1, 1), (3, 1), (11, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 349 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0349_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0349
        rs_R010_ueqv_R010NYY_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_25_0349 := by
  native_decide

/-- Coefficient term 350 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0350 : Poly :=
[
  term ((-2928701620794889028645 : Rat) / 8423534011830651392) [(1, 1), (3, 1), (11, 2), (14, 1), (16, 1)]
]

/-- Partial product 350 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0350 : Poly :=
[
  term ((-2928701620794889028645 : Rat) / 4211767005915325696) [(1, 1), (3, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((2928701620794889028645 : Rat) / 8423534011830651392) [(1, 1), (3, 1), (11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 350 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0350_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0350
        rs_R010_ueqv_R010NYY_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_25_0350 := by
  native_decide

/-- Coefficient term 351 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0351 : Poly :=
[
  term ((-70245268919840672953 : Rat) / 4211767005915325696) [(1, 1), (3, 1), (11, 2), (16, 1)]
]

/-- Partial product 351 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0351 : Poly :=
[
  term ((-70245268919840672953 : Rat) / 2105883502957662848) [(1, 1), (3, 1), (11, 2), (12, 1), (16, 1)],
  term ((70245268919840672953 : Rat) / 4211767005915325696) [(1, 1), (3, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 351 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0351_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0351
        rs_R010_ueqv_R010NYY_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_25_0351 := by
  native_decide

/-- Coefficient term 352 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0352 : Poly :=
[
  term ((-284822328003726725 : Rat) / 23862702583089664) [(1, 1), (3, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 352 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0352 : Poly :=
[
  term ((284822328003726725 : Rat) / 23862702583089664) [(1, 1), (3, 1), (12, 1), (15, 2), (16, 1)],
  term ((-284822328003726725 : Rat) / 11931351291544832) [(1, 1), (3, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 352 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0352_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0352
        rs_R010_ueqv_R010NYY_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_25_0352 := by
  native_decide

/-- Coefficient term 353 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0353 : Poly :=
[
  term ((-78610414648396167 : Rat) / 23862702583089664) [(1, 1), (3, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 353 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0353 : Poly :=
[
  term ((-78610414648396167 : Rat) / 11931351291544832) [(1, 1), (3, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((78610414648396167 : Rat) / 23862702583089664) [(1, 1), (3, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 353 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0353_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0353
        rs_R010_ueqv_R010NYY_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_25_0353 := by
  native_decide

/-- Coefficient term 354 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0354 : Poly :=
[
  term ((-78610414648396167 : Rat) / 47725405166179328) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 354 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0354 : Poly :=
[
  term ((-78610414648396167 : Rat) / 23862702583089664) [(1, 1), (3, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((78610414648396167 : Rat) / 47725405166179328) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 354 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0354_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0354
        rs_R010_ueqv_R010NYY_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_25_0354 := by
  native_decide

/-- Coefficient term 355 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0355 : Poly :=
[
  term ((761266517506644689 : Rat) / 47725405166179328) [(1, 1), (3, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 355 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0355 : Poly :=
[
  term ((761266517506644689 : Rat) / 23862702583089664) [(1, 1), (3, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-761266517506644689 : Rat) / 47725405166179328) [(1, 1), (3, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 355 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0355_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0355
        rs_R010_ueqv_R010NYY_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_25_0355 := by
  native_decide

/-- Coefficient term 356 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0356 : Poly :=
[
  term ((9184513182051 : Rat) / 7609280160424) [(1, 1), (3, 1), (14, 1), (16, 1)]
]

/-- Partial product 356 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0356 : Poly :=
[
  term ((9184513182051 : Rat) / 3804640080212) [(1, 1), (3, 1), (12, 1), (14, 1), (16, 1)],
  term ((-9184513182051 : Rat) / 7609280160424) [(1, 1), (3, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 356 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0356_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0356
        rs_R010_ueqv_R010NYY_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_25_0356 := by
  native_decide

/-- Coefficient term 357 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0357 : Poly :=
[
  term ((-1266575408171823209 : Rat) / 95450810332358656) [(1, 1), (3, 1), (15, 2), (16, 1)]
]

/-- Partial product 357 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0357 : Poly :=
[
  term ((-1266575408171823209 : Rat) / 47725405166179328) [(1, 1), (3, 1), (12, 1), (15, 2), (16, 1)],
  term ((1266575408171823209 : Rat) / 95450810332358656) [(1, 1), (3, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 357 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0357_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0357
        rs_R010_ueqv_R010NYY_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_25_0357 := by
  native_decide

/-- Coefficient term 358 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0358 : Poly :=
[
  term ((9184513182051 : Rat) / 15218560320848) [(1, 1), (3, 1), (16, 1)]
]

/-- Partial product 358 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0358 : Poly :=
[
  term ((9184513182051 : Rat) / 7609280160424) [(1, 1), (3, 1), (12, 1), (16, 1)],
  term ((-9184513182051 : Rat) / 15218560320848) [(1, 1), (3, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 358 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0358_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0358
        rs_R010_ueqv_R010NYY_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_25_0358 := by
  native_decide

/-- Coefficient term 359 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0359 : Poly :=
[
  term ((36930516268330362177 : Rat) / 33694136047322605568) [(1, 1), (3, 2), (5, 1), (12, 1), (16, 1)]
]

/-- Partial product 359 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0359 : Poly :=
[
  term ((-36930516268330362177 : Rat) / 33694136047322605568) [(1, 1), (3, 2), (5, 1), (12, 1), (16, 1)],
  term ((36930516268330362177 : Rat) / 16847068023661302784) [(1, 1), (3, 2), (5, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 359 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0359_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0359
        rs_R010_ueqv_R010NYY_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_25_0359 := by
  native_decide

/-- Coefficient term 360 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0360 : Poly :=
[
  term ((-39377741091554699361 : Rat) / 16847068023661302784) [(1, 1), (3, 2), (5, 1), (14, 1), (16, 1)]
]

/-- Partial product 360 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0360 : Poly :=
[
  term ((-39377741091554699361 : Rat) / 8423534011830651392) [(1, 1), (3, 2), (5, 1), (12, 1), (14, 1), (16, 1)],
  term ((39377741091554699361 : Rat) / 16847068023661302784) [(1, 1), (3, 2), (5, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 360 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0360_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0360
        rs_R010_ueqv_R010NYY_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_25_0360 := by
  native_decide

/-- Coefficient term 361 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0361 : Poly :=
[
  term ((-41824965914779036545 : Rat) / 67388272094645211136) [(1, 1), (3, 2), (5, 1), (16, 1)]
]

/-- Partial product 361 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0361 : Poly :=
[
  term ((-41824965914779036545 : Rat) / 33694136047322605568) [(1, 1), (3, 2), (5, 1), (12, 1), (16, 1)],
  term ((41824965914779036545 : Rat) / 67388272094645211136) [(1, 1), (3, 2), (5, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 361 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0361_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0361
        rs_R010_ueqv_R010NYY_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_25_0361 := by
  native_decide

/-- Coefficient term 362 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0362 : Poly :=
[
  term ((-97263214334822909799 : Rat) / 16847068023661302784) [(1, 1), (3, 2), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 362 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0362 : Poly :=
[
  term ((97263214334822909799 : Rat) / 16847068023661302784) [(1, 1), (3, 2), (11, 1), (12, 1), (16, 1)],
  term ((-97263214334822909799 : Rat) / 8423534011830651392) [(1, 1), (3, 2), (11, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 362 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0362_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0362
        rs_R010_ueqv_R010NYY_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_25_0362 := by
  native_decide

/-- Coefficient term 363 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0363 : Poly :=
[
  term ((137979077883195796407 : Rat) / 8423534011830651392) [(1, 1), (3, 2), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 363 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0363 : Poly :=
[
  term ((137979077883195796407 : Rat) / 4211767005915325696) [(1, 1), (3, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-137979077883195796407 : Rat) / 8423534011830651392) [(1, 1), (3, 2), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 363 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0363_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0363
        rs_R010_ueqv_R010NYY_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_25_0363 := by
  native_decide

/-- Coefficient term 364 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0364 : Poly :=
[
  term ((178694941431568683015 : Rat) / 33694136047322605568) [(1, 1), (3, 2), (11, 1), (16, 1)]
]

/-- Partial product 364 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0364 : Poly :=
[
  term ((178694941431568683015 : Rat) / 16847068023661302784) [(1, 1), (3, 2), (11, 1), (12, 1), (16, 1)],
  term ((-178694941431568683015 : Rat) / 33694136047322605568) [(1, 1), (3, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 364 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0364_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0364
        rs_R010_ueqv_R010NYY_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_25_0364 := by
  native_decide

/-- Coefficient term 365 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0365 : Poly :=
[
  term ((-72379548074960271 : Rat) / 23862702583089664) [(1, 1), (3, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 365 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0365 : Poly :=
[
  term ((72379548074960271 : Rat) / 23862702583089664) [(1, 1), (3, 2), (12, 1), (15, 1), (16, 1)],
  term ((-72379548074960271 : Rat) / 11931351291544832) [(1, 1), (3, 2), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 365 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0365_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0365
        rs_R010_ueqv_R010NYY_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_25_0365 := by
  native_decide

/-- Coefficient term 366 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0366 : Poly :=
[
  term ((67706398144883349 : Rat) / 11931351291544832) [(1, 1), (3, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 366 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0366 : Poly :=
[
  term ((67706398144883349 : Rat) / 5965675645772416) [(1, 1), (3, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-67706398144883349 : Rat) / 11931351291544832) [(1, 1), (3, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 366 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0366_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0366
        rs_R010_ueqv_R010NYY_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_25_0366 := by
  native_decide

/-- Coefficient term 367 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0367 : Poly :=
[
  term ((63033248214806427 : Rat) / 47725405166179328) [(1, 1), (3, 2), (15, 1), (16, 1)]
]

/-- Partial product 367 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0367 : Poly :=
[
  term ((63033248214806427 : Rat) / 23862702583089664) [(1, 1), (3, 2), (12, 1), (15, 1), (16, 1)],
  term ((-63033248214806427 : Rat) / 47725405166179328) [(1, 1), (3, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 367 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0367_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0367
        rs_R010_ueqv_R010NYY_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_25_0367 := by
  native_decide

/-- Coefficient term 368 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0368 : Poly :=
[
  term ((1008537553329180587481 : Rat) / 67388272094645211136) [(1, 1), (5, 1), (6, 1), (8, 1), (16, 1)]
]

/-- Partial product 368 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0368 : Poly :=
[
  term ((1008537553329180587481 : Rat) / 33694136047322605568) [(1, 1), (5, 1), (6, 1), (8, 1), (12, 1), (16, 1)],
  term ((-1008537553329180587481 : Rat) / 67388272094645211136) [(1, 1), (5, 1), (6, 1), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 368 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0368_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0368
        rs_R010_ueqv_R010NYY_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_25_0368 := by
  native_decide

/-- Coefficient term 369 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0369 : Poly :=
[
  term ((-614669487801636391401 : Rat) / 67388272094645211136) [(1, 1), (5, 1), (6, 1), (14, 1), (16, 1)]
]

/-- Partial product 369 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0369 : Poly :=
[
  term ((-614669487801636391401 : Rat) / 33694136047322605568) [(1, 1), (5, 1), (6, 1), (12, 1), (14, 1), (16, 1)],
  term ((614669487801636391401 : Rat) / 67388272094645211136) [(1, 1), (5, 1), (6, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 369 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0369_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0369
        rs_R010_ueqv_R010NYY_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_25_0369 := by
  native_decide

/-- Coefficient term 370 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0370 : Poly :=
[
  term ((23839805706003352161 : Rat) / 2105883502957662848) [(1, 1), (5, 1), (7, 1), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 370 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0370 : Poly :=
[
  term ((23839805706003352161 : Rat) / 1052941751478831424) [(1, 1), (5, 1), (7, 1), (8, 1), (9, 1), (12, 1), (16, 1)],
  term ((-23839805706003352161 : Rat) / 2105883502957662848) [(1, 1), (5, 1), (7, 1), (8, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 370 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0370_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0370
        rs_R010_ueqv_R010NYY_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_25_0370 := by
  native_decide

/-- Coefficient term 371 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0371 : Poly :=
[
  term ((10438388056155907935 : Rat) / 2105883502957662848) [(1, 1), (5, 1), (7, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 371 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0371 : Poly :=
[
  term ((10438388056155907935 : Rat) / 1052941751478831424) [(1, 1), (5, 1), (7, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 2105883502957662848) [(1, 1), (5, 1), (7, 1), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 371 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0371_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0371
        rs_R010_ueqv_R010NYY_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_25_0371 := by
  native_decide

/-- Coefficient term 372 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0372 : Poly :=
[
  term ((-521908533233466982311 : Rat) / 33694136047322605568) [(1, 1), (5, 1), (7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 372 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0372 : Poly :=
[
  term ((-521908533233466982311 : Rat) / 16847068023661302784) [(1, 1), (5, 1), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((521908533233466982311 : Rat) / 33694136047322605568) [(1, 1), (5, 1), (7, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 372 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0372_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0372
        rs_R010_ueqv_R010NYY_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_25_0372 := by
  native_decide

/-- Coefficient term 373 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0373 : Poly :=
[
  term ((-1514267493796089513 : Rat) / 65808859467426964) [(1, 1), (5, 1), (7, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 373 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0373 : Poly :=
[
  term ((-1514267493796089513 : Rat) / 32904429733713482) [(1, 1), (5, 1), (7, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((1514267493796089513 : Rat) / 65808859467426964) [(1, 1), (5, 1), (7, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 373 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0373_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0373
        rs_R010_ueqv_R010NYY_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_25_0373 := by
  native_decide

/-- Coefficient term 374 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0374 : Poly :=
[
  term ((-388474194734080047 : Rat) / 2105883502957662848) [(1, 1), (5, 1), (7, 1), (9, 1), (16, 1)]
]

/-- Partial product 374 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0374 : Poly :=
[
  term ((-388474194734080047 : Rat) / 1052941751478831424) [(1, 1), (5, 1), (7, 1), (9, 1), (12, 1), (16, 1)],
  term ((388474194734080047 : Rat) / 2105883502957662848) [(1, 1), (5, 1), (7, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 374 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0374_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0374
        rs_R010_ueqv_R010NYY_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_25_0374 := by
  native_decide

/-- Coefficient term 375 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0375 : Poly :=
[
  term ((-10438388056155907935 : Rat) / 2105883502957662848) [(1, 1), (5, 1), (7, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 375 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0375 : Poly :=
[
  term ((-10438388056155907935 : Rat) / 1052941751478831424) [(1, 1), (5, 1), (7, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 2105883502957662848) [(1, 1), (5, 1), (7, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 375 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0375_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0375
        rs_R010_ueqv_R010NYY_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_25_0375 := by
  native_decide

/-- Coefficient term 376 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0376 : Poly :=
[
  term ((10438388056155907935 : Rat) / 4211767005915325696) [(1, 1), (5, 1), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 376 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0376 : Poly :=
[
  term ((10438388056155907935 : Rat) / 2105883502957662848) [(1, 1), (5, 1), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 4211767005915325696) [(1, 1), (5, 1), (7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 376 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0376_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0376
        rs_R010_ueqv_R010NYY_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_25_0376 := by
  native_decide

/-- Coefficient term 377 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0377 : Poly :=
[
  term ((915776598761011178391 : Rat) / 33694136047322605568) [(1, 1), (5, 1), (7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 377 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0377 : Poly :=
[
  term ((915776598761011178391 : Rat) / 16847068023661302784) [(1, 1), (5, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-915776598761011178391 : Rat) / 33694136047322605568) [(1, 1), (5, 1), (7, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 377 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0377_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0377
        rs_R010_ueqv_R010NYY_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_25_0377 := by
  native_decide

/-- Coefficient term 378 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0378 : Poly :=
[
  term ((-18291495386560398033 : Rat) / 9626896013520744448) [(1, 1), (5, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 378 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0378 : Poly :=
[
  term ((-18291495386560398033 : Rat) / 4813448006760372224) [(1, 1), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((18291495386560398033 : Rat) / 9626896013520744448) [(1, 1), (5, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 378 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0378_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0378
        rs_R010_ueqv_R010NYY_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_25_0378 := by
  native_decide

/-- Coefficient term 379 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0379 : Poly :=
[
  term ((-23839805706003352161 : Rat) / 2105883502957662848) [(1, 1), (5, 1), (8, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 379 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0379 : Poly :=
[
  term ((-23839805706003352161 : Rat) / 1052941751478831424) [(1, 1), (5, 1), (8, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((23839805706003352161 : Rat) / 2105883502957662848) [(1, 1), (5, 1), (8, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 379 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0379_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0379
        rs_R010_ueqv_R010NYY_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_25_0379 := by
  native_decide

/-- Coefficient term 380 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0380 : Poly :=
[
  term ((12310172089443454059 : Rat) / 2105883502957662848) [(1, 1), (5, 1), (8, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 380 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0380 : Poly :=
[
  term ((12310172089443454059 : Rat) / 1052941751478831424) [(1, 1), (5, 1), (8, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-12310172089443454059 : Rat) / 2105883502957662848) [(1, 1), (5, 1), (8, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 380 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0380_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0380
        rs_R010_ueqv_R010NYY_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_25_0380 := by
  native_decide

/-- Coefficient term 381 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0381 : Poly :=
[
  term ((-12310172089443454059 : Rat) / 1052941751478831424) [(1, 1), (5, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 381 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0381 : Poly :=
[
  term ((-12310172089443454059 : Rat) / 526470875739415712) [(1, 1), (5, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((12310172089443454059 : Rat) / 1052941751478831424) [(1, 1), (5, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 381 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0381_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0381
        rs_R010_ueqv_R010NYY_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_25_0381 := by
  native_decide

/-- Coefficient term 382 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0382 : Poly :=
[
  term ((-24616754095471512255 : Rat) / 4211767005915325696) [(1, 1), (5, 1), (8, 1), (10, 1), (16, 1)]
]

/-- Partial product 382 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0382 : Poly :=
[
  term ((-24616754095471512255 : Rat) / 2105883502957662848) [(1, 1), (5, 1), (8, 1), (10, 1), (12, 1), (16, 1)],
  term ((24616754095471512255 : Rat) / 4211767005915325696) [(1, 1), (5, 1), (8, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 382 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0382_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0382
        rs_R010_ueqv_R010NYY_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_25_0382 := by
  native_decide

/-- Coefficient term 383 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0383 : Poly :=
[
  term ((453923629851836398647 : Rat) / 33694136047322605568) [(1, 1), (5, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 383 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0383 : Poly :=
[
  term ((453923629851836398647 : Rat) / 16847068023661302784) [(1, 1), (5, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-453923629851836398647 : Rat) / 33694136047322605568) [(1, 1), (5, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 383 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0383_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0383
        rs_R010_ueqv_R010NYY_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_25_0383 := by
  native_decide

/-- Coefficient term 384 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0384 : Poly :=
[
  term ((-10438388056155907935 : Rat) / 2105883502957662848) [(1, 1), (5, 1), (8, 1), (11, 2), (16, 1)]
]

/-- Partial product 384 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0384 : Poly :=
[
  term ((-10438388056155907935 : Rat) / 1052941751478831424) [(1, 1), (5, 1), (8, 1), (11, 2), (12, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 2105883502957662848) [(1, 1), (5, 1), (8, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 384 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0384_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0384
        rs_R010_ueqv_R010NYY_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_25_0384 := by
  native_decide

/-- Coefficient term 385 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0385 : Poly :=
[
  term ((-68325355880159966655 : Rat) / 8423534011830651392) [(1, 1), (5, 1), (8, 1), (12, 1), (16, 1)]
]

/-- Partial product 385 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0385 : Poly :=
[
  term ((68325355880159966655 : Rat) / 8423534011830651392) [(1, 1), (5, 1), (8, 1), (12, 1), (16, 1)],
  term ((-68325355880159966655 : Rat) / 4211767005915325696) [(1, 1), (5, 1), (8, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 385 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0385_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0385
        rs_R010_ueqv_R010NYY_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_25_0385 := by
  native_decide

/-- Coefficient term 386 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0386 : Poly :=
[
  term ((219906078344885484717 : Rat) / 16847068023661302784) [(1, 1), (5, 1), (8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 386 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0386 : Poly :=
[
  term ((219906078344885484717 : Rat) / 8423534011830651392) [(1, 1), (5, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-219906078344885484717 : Rat) / 16847068023661302784) [(1, 1), (5, 1), (8, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 386 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0386_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0386
        rs_R010_ueqv_R010NYY_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_25_0386 := by
  native_decide

/-- Coefficient term 387 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0387 : Poly :=
[
  term ((161952341328208551819 : Rat) / 9626896013520744448) [(1, 1), (5, 1), (8, 1), (14, 1), (16, 1)]
]

/-- Partial product 387 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0387 : Poly :=
[
  term ((161952341328208551819 : Rat) / 4813448006760372224) [(1, 1), (5, 1), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((-161952341328208551819 : Rat) / 9626896013520744448) [(1, 1), (5, 1), (8, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 387 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0387_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0387
        rs_R010_ueqv_R010NYY_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_25_0387 := by
  native_decide

/-- Coefficient term 388 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0388 : Poly :=
[
  term ((-219906078344885484717 : Rat) / 8423534011830651392) [(1, 1), (5, 1), (8, 1), (15, 2), (16, 1)]
]

/-- Partial product 388 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0388 : Poly :=
[
  term ((-219906078344885484717 : Rat) / 4211767005915325696) [(1, 1), (5, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((219906078344885484717 : Rat) / 8423534011830651392) [(1, 1), (5, 1), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 388 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0388_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0388
        rs_R010_ueqv_R010NYY_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_25_0388 := by
  native_decide

/-- Coefficient term 389 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0389 : Poly :=
[
  term ((242440248911070481863 : Rat) / 134776544189290422272) [(1, 1), (5, 1), (8, 1), (16, 1)]
]

/-- Partial product 389 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0389 : Poly :=
[
  term ((242440248911070481863 : Rat) / 67388272094645211136) [(1, 1), (5, 1), (8, 1), (12, 1), (16, 1)],
  term ((-242440248911070481863 : Rat) / 134776544189290422272) [(1, 1), (5, 1), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 389 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0389_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0389
        rs_R010_ueqv_R010NYY_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_25_0389 := by
  native_decide

/-- Coefficient term 390 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0390 : Poly :=
[
  term ((11215336445624068029 : Rat) / 4211767005915325696) [(1, 1), (5, 1), (8, 2), (16, 1)]
]

/-- Partial product 390 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0390 : Poly :=
[
  term ((11215336445624068029 : Rat) / 2105883502957662848) [(1, 1), (5, 1), (8, 2), (12, 1), (16, 1)],
  term ((-11215336445624068029 : Rat) / 4211767005915325696) [(1, 1), (5, 1), (8, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 390 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0390_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0390
        rs_R010_ueqv_R010NYY_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_25_0390 := by
  native_decide

/-- Coefficient term 391 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0391 : Poly :=
[
  term ((-33646009336872204087 : Rat) / 8423534011830651392) [(1, 1), (5, 1), (9, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 391 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0391 : Poly :=
[
  term ((33646009336872204087 : Rat) / 8423534011830651392) [(1, 1), (5, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-33646009336872204087 : Rat) / 4211767005915325696) [(1, 1), (5, 1), (9, 1), (11, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 391 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0391_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0391
        rs_R010_ueqv_R010NYY_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_25_0391 := by
  native_decide

/-- Coefficient term 392 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0392 : Poly :=
[
  term ((130559128939821932919 : Rat) / 4211767005915325696) [(1, 1), (5, 1), (9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 392 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0392 : Poly :=
[
  term ((130559128939821932919 : Rat) / 2105883502957662848) [(1, 1), (5, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-130559128939821932919 : Rat) / 4211767005915325696) [(1, 1), (5, 1), (9, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 392 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0392_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0392
        rs_R010_ueqv_R010NYY_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_25_0392 := by
  native_decide

/-- Coefficient term 393 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0393 : Poly :=
[
  term ((132113025718758253107 : Rat) / 16847068023661302784) [(1, 1), (5, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 393 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0393 : Poly :=
[
  term ((132113025718758253107 : Rat) / 8423534011830651392) [(1, 1), (5, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-132113025718758253107 : Rat) / 16847068023661302784) [(1, 1), (5, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 393 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0393_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0393
        rs_R010_ueqv_R010NYY_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_25_0393 := by
  native_decide

/-- Coefficient term 394 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0394 : Poly :=
[
  term ((12310172089443454059 : Rat) / 8423534011830651392) [(1, 1), (5, 1), (9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 394 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0394 : Poly :=
[
  term ((12310172089443454059 : Rat) / 4211767005915325696) [(1, 1), (5, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-12310172089443454059 : Rat) / 8423534011830651392) [(1, 1), (5, 1), (9, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 394 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0394_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0394
        rs_R010_ueqv_R010NYY_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_25_0394 := by
  native_decide

/-- Coefficient term 395 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0395 : Poly :=
[
  term ((61550860447217270295 : Rat) / 16847068023661302784) [(1, 1), (5, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 395 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0395 : Poly :=
[
  term ((61550860447217270295 : Rat) / 8423534011830651392) [(1, 1), (5, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-61550860447217270295 : Rat) / 16847068023661302784) [(1, 1), (5, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 395 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0395_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0395
        rs_R010_ueqv_R010NYY_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_25_0395 := by
  native_decide

/-- Coefficient term 396 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0396 : Poly :=
[
  term ((-12310172089443454059 : Rat) / 2105883502957662848) [(1, 1), (5, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 396 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0396 : Poly :=
[
  term ((-12310172089443454059 : Rat) / 1052941751478831424) [(1, 1), (5, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((12310172089443454059 : Rat) / 2105883502957662848) [(1, 1), (5, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 396 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0396_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0396
        rs_R010_ueqv_R010NYY_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_25_0396 := by
  native_decide

/-- Coefficient term 397 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0397 : Poly :=
[
  term ((-38018171745318956481 : Rat) / 2105883502957662848) [(1, 1), (5, 1), (9, 2), (12, 1), (16, 1)]
]

/-- Partial product 397 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0397 : Poly :=
[
  term ((38018171745318956481 : Rat) / 2105883502957662848) [(1, 1), (5, 1), (9, 2), (12, 1), (16, 1)],
  term ((-38018171745318956481 : Rat) / 1052941751478831424) [(1, 1), (5, 1), (9, 2), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 397 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0397_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0397
        rs_R010_ueqv_R010NYY_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_25_0397 := by
  native_decide

/-- Coefficient term 398 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0398 : Poly :=
[
  term ((38018171745318956481 : Rat) / 1052941751478831424) [(1, 1), (5, 1), (9, 2), (14, 1), (16, 1)]
]

/-- Partial product 398 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0398 : Poly :=
[
  term ((38018171745318956481 : Rat) / 526470875739415712) [(1, 1), (5, 1), (9, 2), (12, 1), (14, 1), (16, 1)],
  term ((-38018171745318956481 : Rat) / 1052941751478831424) [(1, 1), (5, 1), (9, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 398 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0398_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0398
        rs_R010_ueqv_R010NYY_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_25_0398 := by
  native_decide

/-- Coefficient term 399 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0399 : Poly :=
[
  term ((38018171745318956481 : Rat) / 4211767005915325696) [(1, 1), (5, 1), (9, 2), (16, 1)]
]

/-- Partial product 399 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0399 : Poly :=
[
  term ((38018171745318956481 : Rat) / 2105883502957662848) [(1, 1), (5, 1), (9, 2), (12, 1), (16, 1)],
  term ((-38018171745318956481 : Rat) / 4211767005915325696) [(1, 1), (5, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 399 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0399_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0399
        rs_R010_ueqv_R010NYY_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYY_partial_25_0399 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010NYY_partials_25_0300_0399 : List Poly :=
[
  rs_R010_ueqv_R010NYY_partial_25_0300,
  rs_R010_ueqv_R010NYY_partial_25_0301,
  rs_R010_ueqv_R010NYY_partial_25_0302,
  rs_R010_ueqv_R010NYY_partial_25_0303,
  rs_R010_ueqv_R010NYY_partial_25_0304,
  rs_R010_ueqv_R010NYY_partial_25_0305,
  rs_R010_ueqv_R010NYY_partial_25_0306,
  rs_R010_ueqv_R010NYY_partial_25_0307,
  rs_R010_ueqv_R010NYY_partial_25_0308,
  rs_R010_ueqv_R010NYY_partial_25_0309,
  rs_R010_ueqv_R010NYY_partial_25_0310,
  rs_R010_ueqv_R010NYY_partial_25_0311,
  rs_R010_ueqv_R010NYY_partial_25_0312,
  rs_R010_ueqv_R010NYY_partial_25_0313,
  rs_R010_ueqv_R010NYY_partial_25_0314,
  rs_R010_ueqv_R010NYY_partial_25_0315,
  rs_R010_ueqv_R010NYY_partial_25_0316,
  rs_R010_ueqv_R010NYY_partial_25_0317,
  rs_R010_ueqv_R010NYY_partial_25_0318,
  rs_R010_ueqv_R010NYY_partial_25_0319,
  rs_R010_ueqv_R010NYY_partial_25_0320,
  rs_R010_ueqv_R010NYY_partial_25_0321,
  rs_R010_ueqv_R010NYY_partial_25_0322,
  rs_R010_ueqv_R010NYY_partial_25_0323,
  rs_R010_ueqv_R010NYY_partial_25_0324,
  rs_R010_ueqv_R010NYY_partial_25_0325,
  rs_R010_ueqv_R010NYY_partial_25_0326,
  rs_R010_ueqv_R010NYY_partial_25_0327,
  rs_R010_ueqv_R010NYY_partial_25_0328,
  rs_R010_ueqv_R010NYY_partial_25_0329,
  rs_R010_ueqv_R010NYY_partial_25_0330,
  rs_R010_ueqv_R010NYY_partial_25_0331,
  rs_R010_ueqv_R010NYY_partial_25_0332,
  rs_R010_ueqv_R010NYY_partial_25_0333,
  rs_R010_ueqv_R010NYY_partial_25_0334,
  rs_R010_ueqv_R010NYY_partial_25_0335,
  rs_R010_ueqv_R010NYY_partial_25_0336,
  rs_R010_ueqv_R010NYY_partial_25_0337,
  rs_R010_ueqv_R010NYY_partial_25_0338,
  rs_R010_ueqv_R010NYY_partial_25_0339,
  rs_R010_ueqv_R010NYY_partial_25_0340,
  rs_R010_ueqv_R010NYY_partial_25_0341,
  rs_R010_ueqv_R010NYY_partial_25_0342,
  rs_R010_ueqv_R010NYY_partial_25_0343,
  rs_R010_ueqv_R010NYY_partial_25_0344,
  rs_R010_ueqv_R010NYY_partial_25_0345,
  rs_R010_ueqv_R010NYY_partial_25_0346,
  rs_R010_ueqv_R010NYY_partial_25_0347,
  rs_R010_ueqv_R010NYY_partial_25_0348,
  rs_R010_ueqv_R010NYY_partial_25_0349,
  rs_R010_ueqv_R010NYY_partial_25_0350,
  rs_R010_ueqv_R010NYY_partial_25_0351,
  rs_R010_ueqv_R010NYY_partial_25_0352,
  rs_R010_ueqv_R010NYY_partial_25_0353,
  rs_R010_ueqv_R010NYY_partial_25_0354,
  rs_R010_ueqv_R010NYY_partial_25_0355,
  rs_R010_ueqv_R010NYY_partial_25_0356,
  rs_R010_ueqv_R010NYY_partial_25_0357,
  rs_R010_ueqv_R010NYY_partial_25_0358,
  rs_R010_ueqv_R010NYY_partial_25_0359,
  rs_R010_ueqv_R010NYY_partial_25_0360,
  rs_R010_ueqv_R010NYY_partial_25_0361,
  rs_R010_ueqv_R010NYY_partial_25_0362,
  rs_R010_ueqv_R010NYY_partial_25_0363,
  rs_R010_ueqv_R010NYY_partial_25_0364,
  rs_R010_ueqv_R010NYY_partial_25_0365,
  rs_R010_ueqv_R010NYY_partial_25_0366,
  rs_R010_ueqv_R010NYY_partial_25_0367,
  rs_R010_ueqv_R010NYY_partial_25_0368,
  rs_R010_ueqv_R010NYY_partial_25_0369,
  rs_R010_ueqv_R010NYY_partial_25_0370,
  rs_R010_ueqv_R010NYY_partial_25_0371,
  rs_R010_ueqv_R010NYY_partial_25_0372,
  rs_R010_ueqv_R010NYY_partial_25_0373,
  rs_R010_ueqv_R010NYY_partial_25_0374,
  rs_R010_ueqv_R010NYY_partial_25_0375,
  rs_R010_ueqv_R010NYY_partial_25_0376,
  rs_R010_ueqv_R010NYY_partial_25_0377,
  rs_R010_ueqv_R010NYY_partial_25_0378,
  rs_R010_ueqv_R010NYY_partial_25_0379,
  rs_R010_ueqv_R010NYY_partial_25_0380,
  rs_R010_ueqv_R010NYY_partial_25_0381,
  rs_R010_ueqv_R010NYY_partial_25_0382,
  rs_R010_ueqv_R010NYY_partial_25_0383,
  rs_R010_ueqv_R010NYY_partial_25_0384,
  rs_R010_ueqv_R010NYY_partial_25_0385,
  rs_R010_ueqv_R010NYY_partial_25_0386,
  rs_R010_ueqv_R010NYY_partial_25_0387,
  rs_R010_ueqv_R010NYY_partial_25_0388,
  rs_R010_ueqv_R010NYY_partial_25_0389,
  rs_R010_ueqv_R010NYY_partial_25_0390,
  rs_R010_ueqv_R010NYY_partial_25_0391,
  rs_R010_ueqv_R010NYY_partial_25_0392,
  rs_R010_ueqv_R010NYY_partial_25_0393,
  rs_R010_ueqv_R010NYY_partial_25_0394,
  rs_R010_ueqv_R010NYY_partial_25_0395,
  rs_R010_ueqv_R010NYY_partial_25_0396,
  rs_R010_ueqv_R010NYY_partial_25_0397,
  rs_R010_ueqv_R010NYY_partial_25_0398,
  rs_R010_ueqv_R010NYY_partial_25_0399
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010NYY_block_25_0300_0399 : Poly :=
[
  term ((10925110817965791 : Rat) / 2350316409550963) [(1, 1), (3, 1), (5, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-445809356405963151255 : Rat) / 8423534011830651392) [(1, 1), (3, 1), (5, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 4700632819101926) [(1, 1), (3, 1), (5, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((445809356405963151255 : Rat) / 16847068023661302784) [(1, 1), (3, 1), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((-32775332453897373 : Rat) / 18802531276407704) [(1, 1), (3, 1), (5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((32775332453897373 : Rat) / 37605062552815408) [(1, 1), (3, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((13941655304926345515 : Rat) / 1052941751478831424) [(1, 1), (3, 1), (5, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((13941655304926345515 : Rat) / 2105883502957662848) [(1, 1), (3, 1), (5, 1), (9, 1), (12, 1), (16, 1)],
  term ((-3641703605988597 : Rat) / 4700632819101926) [(1, 1), (3, 1), (5, 1), (9, 1), (12, 2), (16, 1)],
  term ((-13941655304926345515 : Rat) / 2105883502957662848) [(1, 1), (3, 1), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((-13125913697184899787 : Rat) / 4211767005915325696) [(1, 1), (3, 1), (5, 1), (9, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 2350316409550963) [(1, 1), (3, 1), (5, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 9401265638203852) [(1, 1), (3, 1), (5, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 4700632819101926) [(1, 1), (3, 1), (5, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 4700632819101926) [(1, 1), (3, 1), (5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 2350316409550963) [(1, 1), (3, 1), (5, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((462805582251370797171 : Rat) / 8423534011830651392) [(1, 1), (3, 1), (5, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((4249056461351911479 : Rat) / 4211767005915325696) [(1, 1), (3, 1), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 4700632819101926) [(1, 1), (3, 1), (5, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-462805582251370797171 : Rat) / 16847068023661302784) [(1, 1), (3, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-4249056461351911479 : Rat) / 8423534011830651392) [(1, 1), (3, 1), (5, 1), (11, 1), (16, 1)],
  term ((33667549837364579265 : Rat) / 16847068023661302784) [(1, 1), (3, 1), (5, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((33667549837364579265 : Rat) / 33694136047322605568) [(1, 1), (3, 1), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((-250161351903438748593 : Rat) / 33694136047322605568) [(1, 1), (3, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((25202178073382397429 : Rat) / 3546751162876063744) [(1, 1), (3, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((200328279759090787245 : Rat) / 16847068023661302784) [(1, 1), (3, 1), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((-33667549837364579265 : Rat) / 33694136047322605568) [(1, 1), (3, 1), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((-33667549837364579265 : Rat) / 67388272094645211136) [(1, 1), (3, 1), (5, 1), (13, 1), (16, 1)],
  term ((250161351903438748593 : Rat) / 67388272094645211136) [(1, 1), (3, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-879497942912447125641 : Rat) / 134776544189290422272) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 2350316409550963) [(1, 1), (3, 1), (7, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-2647720545115526336833 : Rat) / 4211767005915325696) [(1, 1), (3, 1), (7, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 4700632819101926) [(1, 1), (3, 1), (7, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((2647720545115526336833 : Rat) / 8423534011830651392) [(1, 1), (3, 1), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((-921238143868634625 : Rat) / 5965675645772416) [(1, 1), (3, 1), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 26632480561484) [(1, 1), (3, 1), (7, 1), (8, 1), (12, 1), (15, 3), (16, 1)],
  term ((921238143868634625 : Rat) / 11931351291544832) [(1, 1), (3, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 53264961122968) [(1, 1), (3, 1), (7, 1), (8, 1), (15, 3), (16, 1)],
  term ((-363534495967615059 : Rat) / 2350316409550963) [(1, 1), (3, 1), (7, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((2647720545115526336833 : Rat) / 4211767005915325696) [(1, 1), (3, 1), (7, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 4700632819101926) [(1, 1), (3, 1), (7, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-2647720545115526336833 : Rat) / 8423534011830651392) [(1, 1), (3, 1), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 4700632819101926) [(1, 1), (3, 1), (7, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2647720545115526336833 : Rat) / 8423534011830651392) [(1, 1), (3, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(1, 1), (3, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((2647720545115526336833 : Rat) / 16847068023661302784) [(1, 1), (3, 1), (7, 1), (11, 1), (16, 1)],
  term ((921238143868634625 : Rat) / 5965675645772416) [(1, 1), (3, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 26632480561484) [(1, 1), (3, 1), (7, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-921238143868634625 : Rat) / 11931351291544832) [(1, 1), (3, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 53264961122968) [(1, 1), (3, 1), (7, 1), (12, 1), (15, 3), (16, 1)],
  term ((-921238143868634625 : Rat) / 11931351291544832) [(1, 1), (3, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 53264961122968) [(1, 1), (3, 1), (7, 1), (14, 1), (15, 3), (16, 1)],
  term ((921238143868634625 : Rat) / 23862702583089664) [(1, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(1, 1), (3, 1), (7, 1), (15, 3), (16, 1)],
  term ((447344655430746682449 : Rat) / 2105883502957662848) [(1, 1), (3, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 26632480561484) [(1, 1), (3, 1), (8, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-447344655430746682449 : Rat) / 4211767005915325696) [(1, 1), (3, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 53264961122968) [(1, 1), (3, 1), (8, 1), (11, 1), (15, 3), (16, 1)],
  term ((-363534495967615059 : Rat) / 2350316409550963) [(1, 1), (3, 1), (8, 1), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((2647720545115526336833 : Rat) / 4211767005915325696) [(1, 1), (3, 1), (8, 1), (11, 2), (12, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 4700632819101926) [(1, 1), (3, 1), (8, 1), (11, 2), (15, 2), (16, 1)],
  term ((-2647720545115526336833 : Rat) / 8423534011830651392) [(1, 1), (3, 1), (8, 1), (11, 2), (16, 1)],
  term ((-1001389270730769 : Rat) / 213059844491872) [(1, 1), (3, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((1001389270730769 : Rat) / 426119688983744) [(1, 1), (3, 1), (8, 1), (15, 2), (16, 1)],
  term ((-59564980477189561005 : Rat) / 526470875739415712) [(1, 1), (3, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-59564980477189561005 : Rat) / 1052941751478831424) [(1, 1), (3, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((121178165322538353 : Rat) / 4700632819101926) [(1, 1), (3, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((59564980477189561005 : Rat) / 1052941751478831424) [(1, 1), (3, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((45993025961065265469 : Rat) / 2105883502957662848) [(1, 1), (3, 1), (9, 1), (11, 1), (16, 1)],
  term ((-21011082738268809 : Rat) / 745709455721552) [(1, 1), (3, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-21011082738268809 : Rat) / 1491418911443104) [(1, 1), (3, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-111265474525641 : Rat) / 53264961122968) [(1, 1), (3, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((21011082738268809 : Rat) / 1491418911443104) [(1, 1), (3, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((22568799381627783 : Rat) / 2982837822886208) [(1, 1), (3, 1), (9, 1), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 2350316409550963) [(1, 1), (3, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(1, 1), (3, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 4700632819101926) [(1, 1), (3, 1), (10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 4700632819101926) [(1, 1), (3, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 26632480561484) [(1, 1), (3, 1), (10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(1, 1), (3, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((333796423576923 : Rat) / 53264961122968) [(1, 1), (3, 1), (10, 1), (12, 2), (15, 2), (16, 1)],
  term ((333796423576923 : Rat) / 53264961122968) [(1, 1), (3, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-42975396270325727655 : Rat) / 8423534011830651392) [(1, 1), (3, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-42975396270325727655 : Rat) / 16847068023661302784) [(1, 1), (3, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-628037636247657646743 : Rat) / 2406724003380186112) [(1, 1), (3, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 26632480561484) [(1, 1), (3, 1), (11, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-382990365710014336319 : Rat) / 4813448006760372224) [(1, 1), (3, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((281075062940540186709 : Rat) / 8423534011830651392) [(1, 1), (3, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((42975396270325727655 : Rat) / 16847068023661302784) [(1, 1), (3, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((42975396270325727655 : Rat) / 33694136047322605568) [(1, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((628037636247657646743 : Rat) / 4813448006760372224) [(1, 1), (3, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 53264961122968) [(1, 1), (3, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((2118782434089019980815 : Rat) / 67388272094645211136) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 2350316409550963) [(1, 1), (3, 1), (11, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2928701620794889028645 : Rat) / 4211767005915325696) [(1, 1), (3, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-70245268919840672953 : Rat) / 2105883502957662848) [(1, 1), (3, 1), (11, 2), (12, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 4700632819101926) [(1, 1), (3, 1), (11, 2), (14, 1), (15, 2), (16, 1)],
  term ((2928701620794889028645 : Rat) / 8423534011830651392) [(1, 1), (3, 1), (11, 2), (14, 1), (16, 1)],
  term ((70245268919840672953 : Rat) / 4211767005915325696) [(1, 1), (3, 1), (11, 2), (16, 1)],
  term ((-78610414648396167 : Rat) / 11931351291544832) [(1, 1), (3, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-78610414648396167 : Rat) / 23862702583089664) [(1, 1), (3, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((761266517506644689 : Rat) / 23862702583089664) [(1, 1), (3, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((9184513182051 : Rat) / 3804640080212) [(1, 1), (3, 1), (12, 1), (14, 1), (16, 1)],
  term ((-696930752164369759 : Rat) / 47725405166179328) [(1, 1), (3, 1), (12, 1), (15, 2), (16, 1)],
  term ((9184513182051 : Rat) / 7609280160424) [(1, 1), (3, 1), (12, 1), (16, 1)],
  term ((-284822328003726725 : Rat) / 11931351291544832) [(1, 1), (3, 1), (12, 2), (15, 2), (16, 1)],
  term ((78610414648396167 : Rat) / 23862702583089664) [(1, 1), (3, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((78610414648396167 : Rat) / 47725405166179328) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((-761266517506644689 : Rat) / 47725405166179328) [(1, 1), (3, 1), (14, 1), (15, 2), (16, 1)],
  term ((-9184513182051 : Rat) / 7609280160424) [(1, 1), (3, 1), (14, 1), (16, 1)],
  term ((1266575408171823209 : Rat) / 95450810332358656) [(1, 1), (3, 1), (15, 2), (16, 1)],
  term ((-9184513182051 : Rat) / 15218560320848) [(1, 1), (3, 1), (16, 1)],
  term ((-39377741091554699361 : Rat) / 8423534011830651392) [(1, 1), (3, 2), (5, 1), (12, 1), (14, 1), (16, 1)],
  term ((-39377741091554699361 : Rat) / 16847068023661302784) [(1, 1), (3, 2), (5, 1), (12, 1), (16, 1)],
  term ((36930516268330362177 : Rat) / 16847068023661302784) [(1, 1), (3, 2), (5, 1), (12, 2), (16, 1)],
  term ((39377741091554699361 : Rat) / 16847068023661302784) [(1, 1), (3, 2), (5, 1), (14, 1), (16, 1)],
  term ((41824965914779036545 : Rat) / 67388272094645211136) [(1, 1), (3, 2), (5, 1), (16, 1)],
  term ((137979077883195796407 : Rat) / 4211767005915325696) [(1, 1), (3, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((137979077883195796407 : Rat) / 8423534011830651392) [(1, 1), (3, 2), (11, 1), (12, 1), (16, 1)],
  term ((-97263214334822909799 : Rat) / 8423534011830651392) [(1, 1), (3, 2), (11, 1), (12, 2), (16, 1)],
  term ((-137979077883195796407 : Rat) / 8423534011830651392) [(1, 1), (3, 2), (11, 1), (14, 1), (16, 1)],
  term ((-178694941431568683015 : Rat) / 33694136047322605568) [(1, 1), (3, 2), (11, 1), (16, 1)],
  term ((67706398144883349 : Rat) / 5965675645772416) [(1, 1), (3, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((67706398144883349 : Rat) / 11931351291544832) [(1, 1), (3, 2), (12, 1), (15, 1), (16, 1)],
  term ((-72379548074960271 : Rat) / 11931351291544832) [(1, 1), (3, 2), (12, 2), (15, 1), (16, 1)],
  term ((-67706398144883349 : Rat) / 11931351291544832) [(1, 1), (3, 2), (14, 1), (15, 1), (16, 1)],
  term ((-63033248214806427 : Rat) / 47725405166179328) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((1008537553329180587481 : Rat) / 33694136047322605568) [(1, 1), (5, 1), (6, 1), (8, 1), (12, 1), (16, 1)],
  term ((-1008537553329180587481 : Rat) / 67388272094645211136) [(1, 1), (5, 1), (6, 1), (8, 1), (16, 1)],
  term ((-614669487801636391401 : Rat) / 33694136047322605568) [(1, 1), (5, 1), (6, 1), (12, 1), (14, 1), (16, 1)],
  term ((614669487801636391401 : Rat) / 67388272094645211136) [(1, 1), (5, 1), (6, 1), (14, 1), (16, 1)],
  term ((23839805706003352161 : Rat) / 1052941751478831424) [(1, 1), (5, 1), (7, 1), (8, 1), (9, 1), (12, 1), (16, 1)],
  term ((-23839805706003352161 : Rat) / 2105883502957662848) [(1, 1), (5, 1), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 1052941751478831424) [(1, 1), (5, 1), (7, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 2105883502957662848) [(1, 1), (5, 1), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((-521908533233466982311 : Rat) / 16847068023661302784) [(1, 1), (5, 1), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((521908533233466982311 : Rat) / 33694136047322605568) [(1, 1), (5, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-1514267493796089513 : Rat) / 32904429733713482) [(1, 1), (5, 1), (7, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-388474194734080047 : Rat) / 1052941751478831424) [(1, 1), (5, 1), (7, 1), (9, 1), (12, 1), (16, 1)],
  term ((1514267493796089513 : Rat) / 65808859467426964) [(1, 1), (5, 1), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((388474194734080047 : Rat) / 2105883502957662848) [(1, 1), (5, 1), (7, 1), (9, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 1052941751478831424) [(1, 1), (5, 1), (7, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 2105883502957662848) [(1, 1), (5, 1), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 2105883502957662848) [(1, 1), (5, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 4211767005915325696) [(1, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((915776598761011178391 : Rat) / 16847068023661302784) [(1, 1), (5, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-18291495386560398033 : Rat) / 4813448006760372224) [(1, 1), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-915776598761011178391 : Rat) / 33694136047322605568) [(1, 1), (5, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((18291495386560398033 : Rat) / 9626896013520744448) [(1, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-23839805706003352161 : Rat) / 1052941751478831424) [(1, 1), (5, 1), (8, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((23839805706003352161 : Rat) / 2105883502957662848) [(1, 1), (5, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((12310172089443454059 : Rat) / 1052941751478831424) [(1, 1), (5, 1), (8, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-12310172089443454059 : Rat) / 526470875739415712) [(1, 1), (5, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-12310172089443454059 : Rat) / 2105883502957662848) [(1, 1), (5, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((12310172089443454059 : Rat) / 1052941751478831424) [(1, 1), (5, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-24616754095471512255 : Rat) / 2105883502957662848) [(1, 1), (5, 1), (8, 1), (10, 1), (12, 1), (16, 1)],
  term ((24616754095471512255 : Rat) / 4211767005915325696) [(1, 1), (5, 1), (8, 1), (10, 1), (16, 1)],
  term ((453923629851836398647 : Rat) / 16847068023661302784) [(1, 1), (5, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-453923629851836398647 : Rat) / 33694136047322605568) [(1, 1), (5, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 1052941751478831424) [(1, 1), (5, 1), (8, 1), (11, 2), (12, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 2105883502957662848) [(1, 1), (5, 1), (8, 1), (11, 2), (16, 1)],
  term ((219906078344885484717 : Rat) / 8423534011830651392) [(1, 1), (5, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((161952341328208551819 : Rat) / 4813448006760372224) [(1, 1), (5, 1), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((-219906078344885484717 : Rat) / 4211767005915325696) [(1, 1), (5, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((789043095952350215103 : Rat) / 67388272094645211136) [(1, 1), (5, 1), (8, 1), (12, 1), (16, 1)],
  term ((-68325355880159966655 : Rat) / 4211767005915325696) [(1, 1), (5, 1), (8, 1), (12, 2), (16, 1)],
  term ((-219906078344885484717 : Rat) / 16847068023661302784) [(1, 1), (5, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-161952341328208551819 : Rat) / 9626896013520744448) [(1, 1), (5, 1), (8, 1), (14, 1), (16, 1)],
  term ((219906078344885484717 : Rat) / 8423534011830651392) [(1, 1), (5, 1), (8, 1), (15, 2), (16, 1)],
  term ((-242440248911070481863 : Rat) / 134776544189290422272) [(1, 1), (5, 1), (8, 1), (16, 1)],
  term ((11215336445624068029 : Rat) / 2105883502957662848) [(1, 1), (5, 1), (8, 2), (12, 1), (16, 1)],
  term ((-11215336445624068029 : Rat) / 4211767005915325696) [(1, 1), (5, 1), (8, 2), (16, 1)],
  term ((130559128939821932919 : Rat) / 2105883502957662848) [(1, 1), (5, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((82879517527815228597 : Rat) / 4211767005915325696) [(1, 1), (5, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-33646009336872204087 : Rat) / 4211767005915325696) [(1, 1), (5, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((-130559128939821932919 : Rat) / 4211767005915325696) [(1, 1), (5, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-132113025718758253107 : Rat) / 16847068023661302784) [(1, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((12310172089443454059 : Rat) / 4211767005915325696) [(1, 1), (5, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((61550860447217270295 : Rat) / 8423534011830651392) [(1, 1), (5, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-12310172089443454059 : Rat) / 1052941751478831424) [(1, 1), (5, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-12310172089443454059 : Rat) / 8423534011830651392) [(1, 1), (5, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-61550860447217270295 : Rat) / 16847068023661302784) [(1, 1), (5, 1), (9, 1), (13, 1), (16, 1)],
  term ((12310172089443454059 : Rat) / 2105883502957662848) [(1, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((38018171745318956481 : Rat) / 526470875739415712) [(1, 1), (5, 1), (9, 2), (12, 1), (14, 1), (16, 1)],
  term ((38018171745318956481 : Rat) / 1052941751478831424) [(1, 1), (5, 1), (9, 2), (12, 1), (16, 1)],
  term ((-38018171745318956481 : Rat) / 1052941751478831424) [(1, 1), (5, 1), (9, 2), (12, 2), (16, 1)],
  term ((-38018171745318956481 : Rat) / 1052941751478831424) [(1, 1), (5, 1), (9, 2), (14, 1), (16, 1)],
  term ((-38018171745318956481 : Rat) / 4211767005915325696) [(1, 1), (5, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 25, terms 300 through 399. -/
theorem rs_R010_ueqv_R010NYY_block_25_0300_0399_valid :
    checkProductSumEq rs_R010_ueqv_R010NYY_partials_25_0300_0399
      rs_R010_ueqv_R010NYY_block_25_0300_0399 = true := by
  native_decide

end R010UeqvR010NYYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
