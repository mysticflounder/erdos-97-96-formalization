/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NYYNY, term block 26:300-366

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NYYNYTermShards

/-- Generator polynomial 26 for relaxed split surplus certificate `R009:u=v:R009NYYNY`. -/
def rs_R009_ueqv_R009NYYNY_generator_26_0300_0366 : Poly :=
[
  term (2 : Rat) [(10, 1), (12, 1)],
  term (-1 : Rat) [(10, 2)],
  term (2 : Rat) [(11, 1), (13, 1)],
  term (-1 : Rat) [(11, 2)]
]

/-- Coefficient term 300 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NYYNY_coefficient_26_0300 : Poly :=
[
  term ((-57 : Rat) / 16) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 300 for generator 26. -/
def rs_R009_ueqv_R009NYYNY_partial_26_0300 : Poly :=
[
  term ((-57 : Rat) / 8) [(5, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((57 : Rat) / 16) [(5, 1), (10, 2), (15, 1), (16, 1)],
  term ((-57 : Rat) / 8) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((57 : Rat) / 16) [(5, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 300 for generator 26. -/
theorem rs_R009_ueqv_R009NYYNY_partial_26_0300_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_26_0300
        rs_R009_ueqv_R009NYYNY_generator_26_0300_0366 =
      rs_R009_ueqv_R009NYYNY_partial_26_0300 := by
  native_decide

/-- Coefficient term 301 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NYYNY_coefficient_26_0301 : Poly :=
[
  term (-6 : Rat) [(7, 1), (8, 1), (10, 1), (15, 1)]
]

/-- Partial product 301 for generator 26. -/
def rs_R009_ueqv_R009NYYNY_partial_26_0301 : Poly :=
[
  term (-12 : Rat) [(7, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term (6 : Rat) [(7, 1), (8, 1), (10, 1), (11, 2), (15, 1)],
  term (-12 : Rat) [(7, 1), (8, 1), (10, 2), (12, 1), (15, 1)],
  term (6 : Rat) [(7, 1), (8, 1), (10, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 301 for generator 26. -/
theorem rs_R009_ueqv_R009NYYNY_partial_26_0301_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_26_0301
        rs_R009_ueqv_R009NYYNY_generator_26_0300_0366 =
      rs_R009_ueqv_R009NYYNY_partial_26_0301 := by
  native_decide

/-- Coefficient term 302 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NYYNY_coefficient_26_0302 : Poly :=
[
  term (3 : Rat) [(7, 1), (8, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 302 for generator 26. -/
def rs_R009_ueqv_R009NYYNY_partial_26_0302 : Poly :=
[
  term (6 : Rat) [(7, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(7, 1), (8, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term (6 : Rat) [(7, 1), (8, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(7, 1), (8, 1), (10, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 302 for generator 26. -/
theorem rs_R009_ueqv_R009NYYNY_partial_26_0302_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_26_0302
        rs_R009_ueqv_R009NYYNY_generator_26_0300_0366 =
      rs_R009_ueqv_R009NYYNY_partial_26_0302 := by
  native_decide

/-- Coefficient term 303 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NYYNY_coefficient_26_0303 : Poly :=
[
  term (-8 : Rat) [(7, 1), (8, 1), (14, 1), (15, 1)]
]

/-- Partial product 303 for generator 26. -/
def rs_R009_ueqv_R009NYYNY_partial_26_0303 : Poly :=
[
  term (-16 : Rat) [(7, 1), (8, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term (8 : Rat) [(7, 1), (8, 1), (10, 2), (14, 1), (15, 1)],
  term (-16 : Rat) [(7, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term (8 : Rat) [(7, 1), (8, 1), (11, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 303 for generator 26. -/
theorem rs_R009_ueqv_R009NYYNY_partial_26_0303_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_26_0303
        rs_R009_ueqv_R009NYYNY_generator_26_0300_0366 =
      rs_R009_ueqv_R009NYYNY_partial_26_0303 := by
  native_decide

/-- Coefficient term 304 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NYYNY_coefficient_26_0304 : Poly :=
[
  term ((27 : Rat) / 2) [(7, 1), (8, 1), (15, 1)]
]

/-- Partial product 304 for generator 26. -/
def rs_R009_ueqv_R009NYYNY_partial_26_0304 : Poly :=
[
  term (27 : Rat) [(7, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((-27 : Rat) / 2) [(7, 1), (8, 1), (10, 2), (15, 1)],
  term (27 : Rat) [(7, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-27 : Rat) / 2) [(7, 1), (8, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 304 for generator 26. -/
theorem rs_R009_ueqv_R009NYYNY_partial_26_0304_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_26_0304
        rs_R009_ueqv_R009NYYNY_generator_26_0300_0366 =
      rs_R009_ueqv_R009NYYNY_partial_26_0304 := by
  native_decide

/-- Coefficient term 305 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NYYNY_coefficient_26_0305 : Poly :=
[
  term ((-19 : Rat) / 4) [(7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 305 for generator 26. -/
def rs_R009_ueqv_R009NYYNY_partial_26_0305 : Poly :=
[
  term ((-19 : Rat) / 2) [(7, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((19 : Rat) / 4) [(7, 1), (8, 1), (10, 2), (15, 1), (16, 1)],
  term ((-19 : Rat) / 2) [(7, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((19 : Rat) / 4) [(7, 1), (8, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 305 for generator 26. -/
theorem rs_R009_ueqv_R009NYYNY_partial_26_0305_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_26_0305
        rs_R009_ueqv_R009NYYNY_generator_26_0300_0366 =
      rs_R009_ueqv_R009NYYNY_partial_26_0305 := by
  native_decide

/-- Coefficient term 306 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NYYNY_coefficient_26_0306 : Poly :=
[
  term (3 : Rat) [(7, 1), (10, 1), (15, 1)]
]

/-- Partial product 306 for generator 26. -/
def rs_R009_ueqv_R009NYYNY_partial_26_0306 : Poly :=
[
  term (6 : Rat) [(7, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term (-3 : Rat) [(7, 1), (10, 1), (11, 2), (15, 1)],
  term (6 : Rat) [(7, 1), (10, 2), (12, 1), (15, 1)],
  term (-3 : Rat) [(7, 1), (10, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 306 for generator 26. -/
theorem rs_R009_ueqv_R009NYYNY_partial_26_0306_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_26_0306
        rs_R009_ueqv_R009NYYNY_generator_26_0300_0366 =
      rs_R009_ueqv_R009NYYNY_partial_26_0306 := by
  native_decide

/-- Coefficient term 307 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NYYNY_coefficient_26_0307 : Poly :=
[
  term (16 : Rat) [(7, 1), (14, 1), (15, 1)]
]

/-- Partial product 307 for generator 26. -/
def rs_R009_ueqv_R009NYYNY_partial_26_0307 : Poly :=
[
  term (32 : Rat) [(7, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term (-16 : Rat) [(7, 1), (10, 2), (14, 1), (15, 1)],
  term (32 : Rat) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term (-16 : Rat) [(7, 1), (11, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 307 for generator 26. -/
theorem rs_R009_ueqv_R009NYYNY_partial_26_0307_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_26_0307
        rs_R009_ueqv_R009NYYNY_generator_26_0300_0366 =
      rs_R009_ueqv_R009NYYNY_partial_26_0307 := by
  native_decide

/-- Coefficient term 308 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NYYNY_coefficient_26_0308 : Poly :=
[
  term ((-47 : Rat) / 4) [(7, 1), (15, 1)]
]

/-- Partial product 308 for generator 26. -/
def rs_R009_ueqv_R009NYYNY_partial_26_0308 : Poly :=
[
  term ((-47 : Rat) / 2) [(7, 1), (10, 1), (12, 1), (15, 1)],
  term ((47 : Rat) / 4) [(7, 1), (10, 2), (15, 1)],
  term ((-47 : Rat) / 2) [(7, 1), (11, 1), (13, 1), (15, 1)],
  term ((47 : Rat) / 4) [(7, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 308 for generator 26. -/
theorem rs_R009_ueqv_R009NYYNY_partial_26_0308_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_26_0308
        rs_R009_ueqv_R009NYYNY_generator_26_0300_0366 =
      rs_R009_ueqv_R009NYYNY_partial_26_0308 := by
  native_decide

/-- Coefficient term 309 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NYYNY_coefficient_26_0309 : Poly :=
[
  term (-3 : Rat) [(8, 1), (10, 1), (11, 1), (13, 1)]
]

/-- Partial product 309 for generator 26. -/
def rs_R009_ueqv_R009NYYNY_partial_26_0309 : Poly :=
[
  term (-6 : Rat) [(8, 1), (10, 1), (11, 2), (13, 2)],
  term (3 : Rat) [(8, 1), (10, 1), (11, 3), (13, 1)],
  term (-6 : Rat) [(8, 1), (10, 2), (11, 1), (12, 1), (13, 1)],
  term (3 : Rat) [(8, 1), (10, 3), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 309 for generator 26. -/
theorem rs_R009_ueqv_R009NYYNY_partial_26_0309_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_26_0309
        rs_R009_ueqv_R009NYYNY_generator_26_0300_0366 =
      rs_R009_ueqv_R009NYYNY_partial_26_0309 := by
  native_decide

/-- Coefficient term 310 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NYYNY_coefficient_26_0310 : Poly :=
[
  term (21 : Rat) [(8, 1), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 310 for generator 26. -/
def rs_R009_ueqv_R009NYYNY_partial_26_0310 : Poly :=
[
  term (42 : Rat) [(8, 1), (10, 1), (11, 2), (13, 1), (15, 1)],
  term (-21 : Rat) [(8, 1), (10, 1), (11, 3), (15, 1)],
  term (42 : Rat) [(8, 1), (10, 2), (11, 1), (12, 1), (15, 1)],
  term (-21 : Rat) [(8, 1), (10, 3), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 310 for generator 26. -/
theorem rs_R009_ueqv_R009NYYNY_partial_26_0310_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_26_0310
        rs_R009_ueqv_R009NYYNY_generator_26_0300_0366 =
      rs_R009_ueqv_R009NYYNY_partial_26_0310 := by
  native_decide

/-- Coefficient term 311 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NYYNY_coefficient_26_0311 : Poly :=
[
  term ((-9 : Rat) / 2) [(8, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 311 for generator 26. -/
def rs_R009_ueqv_R009NYYNY_partial_26_0311 : Poly :=
[
  term (-9 : Rat) [(8, 1), (10, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((9 : Rat) / 2) [(8, 1), (10, 1), (11, 3), (15, 1), (16, 1)],
  term (-9 : Rat) [(8, 1), (10, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((9 : Rat) / 2) [(8, 1), (10, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 311 for generator 26. -/
theorem rs_R009_ueqv_R009NYYNY_partial_26_0311_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_26_0311
        rs_R009_ueqv_R009NYYNY_generator_26_0300_0366 =
      rs_R009_ueqv_R009NYYNY_partial_26_0311 := by
  native_decide

/-- Coefficient term 312 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NYYNY_coefficient_26_0312 : Poly :=
[
  term (9 : Rat) [(8, 1), (10, 1), (11, 2)]
]

/-- Partial product 312 for generator 26. -/
def rs_R009_ueqv_R009NYYNY_partial_26_0312 : Poly :=
[
  term (18 : Rat) [(8, 1), (10, 1), (11, 3), (13, 1)],
  term (-9 : Rat) [(8, 1), (10, 1), (11, 4)],
  term (18 : Rat) [(8, 1), (10, 2), (11, 2), (12, 1)],
  term (-9 : Rat) [(8, 1), (10, 3), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 312 for generator 26. -/
theorem rs_R009_ueqv_R009NYYNY_partial_26_0312_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_26_0312
        rs_R009_ueqv_R009NYYNY_generator_26_0300_0366 =
      rs_R009_ueqv_R009NYYNY_partial_26_0312 := by
  native_decide

/-- Coefficient term 313 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NYYNY_coefficient_26_0313 : Poly :=
[
  term (9 : Rat) [(8, 1), (11, 1), (13, 1)]
]

/-- Partial product 313 for generator 26. -/
def rs_R009_ueqv_R009NYYNY_partial_26_0313 : Poly :=
[
  term (18 : Rat) [(8, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term (-9 : Rat) [(8, 1), (10, 2), (11, 1), (13, 1)],
  term (18 : Rat) [(8, 1), (11, 2), (13, 2)],
  term (-9 : Rat) [(8, 1), (11, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 313 for generator 26. -/
theorem rs_R009_ueqv_R009NYYNY_partial_26_0313_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_26_0313
        rs_R009_ueqv_R009NYYNY_generator_26_0300_0366 =
      rs_R009_ueqv_R009NYYNY_partial_26_0313 := by
  native_decide

/-- Coefficient term 314 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NYYNY_coefficient_26_0314 : Poly :=
[
  term (40 : Rat) [(8, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 314 for generator 26. -/
def rs_R009_ueqv_R009NYYNY_partial_26_0314 : Poly :=
[
  term (80 : Rat) [(8, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term (-40 : Rat) [(8, 1), (10, 2), (11, 1), (14, 1), (15, 1)],
  term (80 : Rat) [(8, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term (-40 : Rat) [(8, 1), (11, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 314 for generator 26. -/
theorem rs_R009_ueqv_R009NYYNY_partial_26_0314_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_26_0314
        rs_R009_ueqv_R009NYYNY_generator_26_0300_0366 =
      rs_R009_ueqv_R009NYYNY_partial_26_0314 := by
  native_decide

/-- Coefficient term 315 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NYYNY_coefficient_26_0315 : Poly :=
[
  term ((-437 : Rat) / 12) [(8, 1), (11, 1), (15, 1)]
]

/-- Partial product 315 for generator 26. -/
def rs_R009_ueqv_R009NYYNY_partial_26_0315 : Poly :=
[
  term ((-437 : Rat) / 6) [(8, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((437 : Rat) / 12) [(8, 1), (10, 2), (11, 1), (15, 1)],
  term ((-437 : Rat) / 6) [(8, 1), (11, 2), (13, 1), (15, 1)],
  term ((437 : Rat) / 12) [(8, 1), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 315 for generator 26. -/
theorem rs_R009_ueqv_R009NYYNY_partial_26_0315_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_26_0315
        rs_R009_ueqv_R009NYYNY_generator_26_0300_0366 =
      rs_R009_ueqv_R009NYYNY_partial_26_0315 := by
  native_decide

/-- Coefficient term 316 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NYYNY_coefficient_26_0316 : Poly :=
[
  term ((69 : Rat) / 8) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 316 for generator 26. -/
def rs_R009_ueqv_R009NYYNY_partial_26_0316 : Poly :=
[
  term ((69 : Rat) / 4) [(8, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-69 : Rat) / 8) [(8, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((69 : Rat) / 4) [(8, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-69 : Rat) / 8) [(8, 1), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 316 for generator 26. -/
theorem rs_R009_ueqv_R009NYYNY_partial_26_0316_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_26_0316
        rs_R009_ueqv_R009NYYNY_generator_26_0300_0366 =
      rs_R009_ueqv_R009NYYNY_partial_26_0316 := by
  native_decide

/-- Coefficient term 317 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NYYNY_coefficient_26_0317 : Poly :=
[
  term (-42 : Rat) [(8, 1), (11, 2)]
]

/-- Partial product 317 for generator 26. -/
def rs_R009_ueqv_R009NYYNY_partial_26_0317 : Poly :=
[
  term (-84 : Rat) [(8, 1), (10, 1), (11, 2), (12, 1)],
  term (42 : Rat) [(8, 1), (10, 2), (11, 2)],
  term (-84 : Rat) [(8, 1), (11, 3), (13, 1)],
  term (42 : Rat) [(8, 1), (11, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 317 for generator 26. -/
theorem rs_R009_ueqv_R009NYYNY_partial_26_0317_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_26_0317
        rs_R009_ueqv_R009NYYNY_generator_26_0300_0366 =
      rs_R009_ueqv_R009NYYNY_partial_26_0317 := by
  native_decide

/-- Coefficient term 318 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NYYNY_coefficient_26_0318 : Poly :=
[
  term ((-8 : Rat) / 3) [(8, 1), (13, 1), (15, 1)]
]

/-- Partial product 318 for generator 26. -/
def rs_R009_ueqv_R009NYYNY_partial_26_0318 : Poly :=
[
  term ((-16 : Rat) / 3) [(8, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((8 : Rat) / 3) [(8, 1), (10, 2), (13, 1), (15, 1)],
  term ((-16 : Rat) / 3) [(8, 1), (11, 1), (13, 2), (15, 1)],
  term ((8 : Rat) / 3) [(8, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 318 for generator 26. -/
theorem rs_R009_ueqv_R009NYYNY_partial_26_0318_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_26_0318
        rs_R009_ueqv_R009NYYNY_generator_26_0300_0366 =
      rs_R009_ueqv_R009NYYNY_partial_26_0318 := by
  native_decide

/-- Coefficient term 319 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NYYNY_coefficient_26_0319 : Poly :=
[
  term ((4 : Rat) / 3) [(8, 1), (14, 1)]
]

/-- Partial product 319 for generator 26. -/
def rs_R009_ueqv_R009NYYNY_partial_26_0319 : Poly :=
[
  term ((8 : Rat) / 3) [(8, 1), (10, 1), (12, 1), (14, 1)],
  term ((-4 : Rat) / 3) [(8, 1), (10, 2), (14, 1)],
  term ((8 : Rat) / 3) [(8, 1), (11, 1), (13, 1), (14, 1)],
  term ((-4 : Rat) / 3) [(8, 1), (11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 319 for generator 26. -/
theorem rs_R009_ueqv_R009NYYNY_partial_26_0319_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_26_0319
        rs_R009_ueqv_R009NYYNY_generator_26_0300_0366 =
      rs_R009_ueqv_R009NYYNY_partial_26_0319 := by
  native_decide

/-- Coefficient term 320 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NYYNY_coefficient_26_0320 : Poly :=
[
  term ((165 : Rat) / 2) [(9, 1), (10, 1), (11, 1)]
]

/-- Partial product 320 for generator 26. -/
def rs_R009_ueqv_R009NYYNY_partial_26_0320 : Poly :=
[
  term (165 : Rat) [(9, 1), (10, 1), (11, 2), (13, 1)],
  term ((-165 : Rat) / 2) [(9, 1), (10, 1), (11, 3)],
  term (165 : Rat) [(9, 1), (10, 2), (11, 1), (12, 1)],
  term ((-165 : Rat) / 2) [(9, 1), (10, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 320 for generator 26. -/
theorem rs_R009_ueqv_R009NYYNY_partial_26_0320_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_26_0320
        rs_R009_ueqv_R009NYYNY_generator_26_0300_0366 =
      rs_R009_ueqv_R009NYYNY_partial_26_0320 := by
  native_decide

/-- Coefficient term 321 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NYYNY_coefficient_26_0321 : Poly :=
[
  term (-45 : Rat) [(9, 1), (10, 1), (13, 1)]
]

/-- Partial product 321 for generator 26. -/
def rs_R009_ueqv_R009NYYNY_partial_26_0321 : Poly :=
[
  term (-90 : Rat) [(9, 1), (10, 1), (11, 1), (13, 2)],
  term (45 : Rat) [(9, 1), (10, 1), (11, 2), (13, 1)],
  term (-90 : Rat) [(9, 1), (10, 2), (12, 1), (13, 1)],
  term (45 : Rat) [(9, 1), (10, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 321 for generator 26. -/
theorem rs_R009_ueqv_R009NYYNY_partial_26_0321_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_26_0321
        rs_R009_ueqv_R009NYYNY_generator_26_0300_0366 =
      rs_R009_ueqv_R009NYYNY_partial_26_0321 := by
  native_decide

/-- Coefficient term 322 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NYYNY_coefficient_26_0322 : Poly :=
[
  term (-80 : Rat) [(9, 1), (10, 1), (14, 1), (15, 1)]
]

/-- Partial product 322 for generator 26. -/
def rs_R009_ueqv_R009NYYNY_partial_26_0322 : Poly :=
[
  term (-160 : Rat) [(9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term (80 : Rat) [(9, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term (-160 : Rat) [(9, 1), (10, 2), (12, 1), (14, 1), (15, 1)],
  term (80 : Rat) [(9, 1), (10, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 322 for generator 26. -/
theorem rs_R009_ueqv_R009NYYNY_partial_26_0322_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_26_0322
        rs_R009_ueqv_R009NYYNY_generator_26_0300_0366 =
      rs_R009_ueqv_R009NYYNY_partial_26_0322 := by
  native_decide

/-- Coefficient term 323 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NYYNY_coefficient_26_0323 : Poly :=
[
  term ((170 : Rat) / 3) [(9, 1), (10, 1), (15, 1)]
]

/-- Partial product 323 for generator 26. -/
def rs_R009_ueqv_R009NYYNY_partial_26_0323 : Poly :=
[
  term ((340 : Rat) / 3) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-170 : Rat) / 3) [(9, 1), (10, 1), (11, 2), (15, 1)],
  term ((340 : Rat) / 3) [(9, 1), (10, 2), (12, 1), (15, 1)],
  term ((-170 : Rat) / 3) [(9, 1), (10, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 323 for generator 26. -/
theorem rs_R009_ueqv_R009NYYNY_partial_26_0323_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_26_0323
        rs_R009_ueqv_R009NYYNY_generator_26_0300_0366 =
      rs_R009_ueqv_R009NYYNY_partial_26_0323 := by
  native_decide

/-- Coefficient term 324 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NYYNY_coefficient_26_0324 : Poly :=
[
  term ((-15 : Rat) / 2) [(9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 324 for generator 26. -/
def rs_R009_ueqv_R009NYYNY_partial_26_0324 : Poly :=
[
  term (-15 : Rat) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((15 : Rat) / 2) [(9, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term (-15 : Rat) [(9, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((15 : Rat) / 2) [(9, 1), (10, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 324 for generator 26. -/
theorem rs_R009_ueqv_R009NYYNY_partial_26_0324_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_26_0324
        rs_R009_ueqv_R009NYYNY_generator_26_0300_0366 =
      rs_R009_ueqv_R009NYYNY_partial_26_0324 := by
  native_decide

/-- Coefficient term 325 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NYYNY_coefficient_26_0325 : Poly :=
[
  term (-18 : Rat) [(9, 1), (10, 2), (11, 1)]
]

/-- Partial product 325 for generator 26. -/
def rs_R009_ueqv_R009NYYNY_partial_26_0325 : Poly :=
[
  term (-36 : Rat) [(9, 1), (10, 2), (11, 2), (13, 1)],
  term (18 : Rat) [(9, 1), (10, 2), (11, 3)],
  term (-36 : Rat) [(9, 1), (10, 3), (11, 1), (12, 1)],
  term (18 : Rat) [(9, 1), (10, 4), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 325 for generator 26. -/
theorem rs_R009_ueqv_R009NYYNY_partial_26_0325_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_26_0325
        rs_R009_ueqv_R009NYYNY_generator_26_0300_0366 =
      rs_R009_ueqv_R009NYYNY_partial_26_0325 := by
  native_decide

/-- Coefficient term 326 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NYYNY_coefficient_26_0326 : Poly :=
[
  term (12 : Rat) [(9, 1), (10, 2), (13, 1)]
]

/-- Partial product 326 for generator 26. -/
def rs_R009_ueqv_R009NYYNY_partial_26_0326 : Poly :=
[
  term (24 : Rat) [(9, 1), (10, 2), (11, 1), (13, 2)],
  term (-12 : Rat) [(9, 1), (10, 2), (11, 2), (13, 1)],
  term (24 : Rat) [(9, 1), (10, 3), (12, 1), (13, 1)],
  term (-12 : Rat) [(9, 1), (10, 4), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 326 for generator 26. -/
theorem rs_R009_ueqv_R009NYYNY_partial_26_0326_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_26_0326
        rs_R009_ueqv_R009NYYNY_generator_26_0300_0366 =
      rs_R009_ueqv_R009NYYNY_partial_26_0326 := by
  native_decide

/-- Coefficient term 327 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NYYNY_coefficient_26_0327 : Poly :=
[
  term (-12 : Rat) [(9, 1), (10, 2), (15, 1)]
]

/-- Partial product 327 for generator 26. -/
def rs_R009_ueqv_R009NYYNY_partial_26_0327 : Poly :=
[
  term (-24 : Rat) [(9, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term (12 : Rat) [(9, 1), (10, 2), (11, 2), (15, 1)],
  term (-24 : Rat) [(9, 1), (10, 3), (12, 1), (15, 1)],
  term (12 : Rat) [(9, 1), (10, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 327 for generator 26. -/
theorem rs_R009_ueqv_R009NYYNY_partial_26_0327_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_26_0327
        rs_R009_ueqv_R009NYYNY_generator_26_0300_0366 =
      rs_R009_ueqv_R009NYYNY_partial_26_0327 := by
  native_decide

/-- Coefficient term 328 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NYYNY_coefficient_26_0328 : Poly :=
[
  term ((7 : Rat) / 2) [(9, 1), (11, 1)]
]

/-- Partial product 328 for generator 26. -/
def rs_R009_ueqv_R009NYYNY_partial_26_0328 : Poly :=
[
  term (7 : Rat) [(9, 1), (10, 1), (11, 1), (12, 1)],
  term ((-7 : Rat) / 2) [(9, 1), (10, 2), (11, 1)],
  term (7 : Rat) [(9, 1), (11, 2), (13, 1)],
  term ((-7 : Rat) / 2) [(9, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 328 for generator 26. -/
theorem rs_R009_ueqv_R009NYYNY_partial_26_0328_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_26_0328
        rs_R009_ueqv_R009NYYNY_generator_26_0300_0366 =
      rs_R009_ueqv_R009NYYNY_partial_26_0328 := by
  native_decide

/-- Coefficient term 329 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NYYNY_coefficient_26_0329 : Poly :=
[
  term ((-35 : Rat) / 3) [(9, 1), (13, 1)]
]

/-- Partial product 329 for generator 26. -/
def rs_R009_ueqv_R009NYYNY_partial_26_0329 : Poly :=
[
  term ((-70 : Rat) / 3) [(9, 1), (10, 1), (12, 1), (13, 1)],
  term ((35 : Rat) / 3) [(9, 1), (10, 2), (13, 1)],
  term ((-70 : Rat) / 3) [(9, 1), (11, 1), (13, 2)],
  term ((35 : Rat) / 3) [(9, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 329 for generator 26. -/
theorem rs_R009_ueqv_R009NYYNY_partial_26_0329_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_26_0329
        rs_R009_ueqv_R009NYYNY_generator_26_0300_0366 =
      rs_R009_ueqv_R009NYYNY_partial_26_0329 := by
  native_decide

/-- Coefficient term 330 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NYYNY_coefficient_26_0330 : Poly :=
[
  term ((-4 : Rat) / 3) [(9, 1), (13, 1), (14, 1)]
]

/-- Partial product 330 for generator 26. -/
def rs_R009_ueqv_R009NYYNY_partial_26_0330 : Poly :=
[
  term ((-8 : Rat) / 3) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((4 : Rat) / 3) [(9, 1), (10, 2), (13, 1), (14, 1)],
  term ((-8 : Rat) / 3) [(9, 1), (11, 1), (13, 2), (14, 1)],
  term ((4 : Rat) / 3) [(9, 1), (11, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 330 for generator 26. -/
theorem rs_R009_ueqv_R009NYYNY_partial_26_0330_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_26_0330
        rs_R009_ueqv_R009NYYNY_generator_26_0300_0366 =
      rs_R009_ueqv_R009NYYNY_partial_26_0330 := by
  native_decide

/-- Coefficient term 331 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NYYNY_coefficient_26_0331 : Poly :=
[
  term ((-28 : Rat) / 3) [(9, 1), (14, 1), (15, 1)]
]

/-- Partial product 331 for generator 26. -/
def rs_R009_ueqv_R009NYYNY_partial_26_0331 : Poly :=
[
  term ((-56 : Rat) / 3) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((28 : Rat) / 3) [(9, 1), (10, 2), (14, 1), (15, 1)],
  term ((-56 : Rat) / 3) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((28 : Rat) / 3) [(9, 1), (11, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 331 for generator 26. -/
theorem rs_R009_ueqv_R009NYYNY_partial_26_0331_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_26_0331
        rs_R009_ueqv_R009NYYNY_generator_26_0300_0366 =
      rs_R009_ueqv_R009NYYNY_partial_26_0331 := by
  native_decide

/-- Coefficient term 332 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NYYNY_coefficient_26_0332 : Poly :=
[
  term ((-29 : Rat) / 12) [(9, 1), (15, 1)]
]

/-- Partial product 332 for generator 26. -/
def rs_R009_ueqv_R009NYYNY_partial_26_0332 : Poly :=
[
  term ((-29 : Rat) / 6) [(9, 1), (10, 1), (12, 1), (15, 1)],
  term ((29 : Rat) / 12) [(9, 1), (10, 2), (15, 1)],
  term ((-29 : Rat) / 6) [(9, 1), (11, 1), (13, 1), (15, 1)],
  term ((29 : Rat) / 12) [(9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 332 for generator 26. -/
theorem rs_R009_ueqv_R009NYYNY_partial_26_0332_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_26_0332
        rs_R009_ueqv_R009NYYNY_generator_26_0300_0366 =
      rs_R009_ueqv_R009NYYNY_partial_26_0332 := by
  native_decide

/-- Coefficient term 333 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NYYNY_coefficient_26_0333 : Poly :=
[
  term ((19 : Rat) / 2) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 333 for generator 26. -/
def rs_R009_ueqv_R009NYYNY_partial_26_0333 : Poly :=
[
  term (19 : Rat) [(9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-19 : Rat) / 2) [(9, 1), (10, 2), (15, 1), (16, 1)],
  term (19 : Rat) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-19 : Rat) / 2) [(9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 333 for generator 26. -/
theorem rs_R009_ueqv_R009NYYNY_partial_26_0333_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_26_0333
        rs_R009_ueqv_R009NYYNY_generator_26_0300_0366 =
      rs_R009_ueqv_R009NYYNY_partial_26_0333 := by
  native_decide

/-- Coefficient term 334 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NYYNY_coefficient_26_0334 : Poly :=
[
  term ((4 : Rat) / 3) [(9, 2)]
]

/-- Partial product 334 for generator 26. -/
def rs_R009_ueqv_R009NYYNY_partial_26_0334 : Poly :=
[
  term ((8 : Rat) / 3) [(9, 2), (10, 1), (12, 1)],
  term ((-4 : Rat) / 3) [(9, 2), (10, 2)],
  term ((8 : Rat) / 3) [(9, 2), (11, 1), (13, 1)],
  term ((-4 : Rat) / 3) [(9, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 334 for generator 26. -/
theorem rs_R009_ueqv_R009NYYNY_partial_26_0334_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_26_0334
        rs_R009_ueqv_R009NYYNY_generator_26_0300_0366 =
      rs_R009_ueqv_R009NYYNY_partial_26_0334 := by
  native_decide

/-- Coefficient term 335 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NYYNY_coefficient_26_0335 : Poly :=
[
  term ((-39 : Rat) / 4) [(10, 1)]
]

/-- Partial product 335 for generator 26. -/
def rs_R009_ueqv_R009NYYNY_partial_26_0335 : Poly :=
[
  term ((-39 : Rat) / 2) [(10, 1), (11, 1), (13, 1)],
  term ((39 : Rat) / 4) [(10, 1), (11, 2)],
  term ((-39 : Rat) / 2) [(10, 2), (12, 1)],
  term ((39 : Rat) / 4) [(10, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 335 for generator 26. -/
theorem rs_R009_ueqv_R009NYYNY_partial_26_0335_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_26_0335
        rs_R009_ueqv_R009NYYNY_generator_26_0300_0366 =
      rs_R009_ueqv_R009NYYNY_partial_26_0335 := by
  native_decide

/-- Coefficient term 336 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NYYNY_coefficient_26_0336 : Poly :=
[
  term (423 : Rat) [(10, 1), (11, 1), (13, 1)]
]

/-- Partial product 336 for generator 26. -/
def rs_R009_ueqv_R009NYYNY_partial_26_0336 : Poly :=
[
  term (846 : Rat) [(10, 1), (11, 2), (13, 2)],
  term (-423 : Rat) [(10, 1), (11, 3), (13, 1)],
  term (846 : Rat) [(10, 2), (11, 1), (12, 1), (13, 1)],
  term (-423 : Rat) [(10, 3), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 336 for generator 26. -/
theorem rs_R009_ueqv_R009NYYNY_partial_26_0336_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_26_0336
        rs_R009_ueqv_R009NYYNY_generator_26_0300_0366 =
      rs_R009_ueqv_R009NYYNY_partial_26_0336 := by
  native_decide

/-- Coefficient term 337 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NYYNY_coefficient_26_0337 : Poly :=
[
  term (80 : Rat) [(10, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 337 for generator 26. -/
def rs_R009_ueqv_R009NYYNY_partial_26_0337 : Poly :=
[
  term (160 : Rat) [(10, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term (-80 : Rat) [(10, 1), (11, 3), (14, 1), (15, 1)],
  term (160 : Rat) [(10, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term (-80 : Rat) [(10, 3), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 337 for generator 26. -/
theorem rs_R009_ueqv_R009NYYNY_partial_26_0337_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_26_0337
        rs_R009_ueqv_R009NYYNY_generator_26_0300_0366 =
      rs_R009_ueqv_R009NYYNY_partial_26_0337 := by
  native_decide

/-- Coefficient term 338 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NYYNY_coefficient_26_0338 : Poly :=
[
  term ((-457 : Rat) / 6) [(10, 1), (11, 1), (15, 1)]
]

/-- Partial product 338 for generator 26. -/
def rs_R009_ueqv_R009NYYNY_partial_26_0338 : Poly :=
[
  term ((-457 : Rat) / 3) [(10, 1), (11, 2), (13, 1), (15, 1)],
  term ((457 : Rat) / 6) [(10, 1), (11, 3), (15, 1)],
  term ((-457 : Rat) / 3) [(10, 2), (11, 1), (12, 1), (15, 1)],
  term ((457 : Rat) / 6) [(10, 3), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 338 for generator 26. -/
theorem rs_R009_ueqv_R009NYYNY_partial_26_0338_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_26_0338
        rs_R009_ueqv_R009NYYNY_generator_26_0300_0366 =
      rs_R009_ueqv_R009NYYNY_partial_26_0338 := by
  native_decide

/-- Coefficient term 339 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NYYNY_coefficient_26_0339 : Poly :=
[
  term ((33 : Rat) / 4) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 339 for generator 26. -/
def rs_R009_ueqv_R009NYYNY_partial_26_0339 : Poly :=
[
  term ((33 : Rat) / 2) [(10, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-33 : Rat) / 4) [(10, 1), (11, 3), (15, 1), (16, 1)],
  term ((33 : Rat) / 2) [(10, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-33 : Rat) / 4) [(10, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 339 for generator 26. -/
theorem rs_R009_ueqv_R009NYYNY_partial_26_0339_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_26_0339
        rs_R009_ueqv_R009NYYNY_generator_26_0300_0366 =
      rs_R009_ueqv_R009NYYNY_partial_26_0339 := by
  native_decide

/-- Coefficient term 340 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NYYNY_coefficient_26_0340 : Poly :=
[
  term (-102 : Rat) [(10, 1), (11, 2)]
]

/-- Partial product 340 for generator 26. -/
def rs_R009_ueqv_R009NYYNY_partial_26_0340 : Poly :=
[
  term (-204 : Rat) [(10, 1), (11, 3), (13, 1)],
  term (102 : Rat) [(10, 1), (11, 4)],
  term (-204 : Rat) [(10, 2), (11, 2), (12, 1)],
  term (102 : Rat) [(10, 3), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 340 for generator 26. -/
theorem rs_R009_ueqv_R009NYYNY_partial_26_0340_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_26_0340
        rs_R009_ueqv_R009NYYNY_generator_26_0300_0366 =
      rs_R009_ueqv_R009NYYNY_partial_26_0340 := by
  native_decide

/-- Coefficient term 341 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NYYNY_coefficient_26_0341 : Poly :=
[
  term (-320 : Rat) [(10, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 341 for generator 26. -/
def rs_R009_ueqv_R009NYYNY_partial_26_0341 : Poly :=
[
  term (-640 : Rat) [(10, 1), (11, 1), (13, 2), (14, 1), (15, 1)],
  term (320 : Rat) [(10, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term (-640 : Rat) [(10, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term (320 : Rat) [(10, 3), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 341 for generator 26. -/
theorem rs_R009_ueqv_R009NYYNY_partial_26_0341_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_26_0341
        rs_R009_ueqv_R009NYYNY_generator_26_0300_0366 =
      rs_R009_ueqv_R009NYYNY_partial_26_0341 := by
  native_decide

/-- Coefficient term 342 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NYYNY_coefficient_26_0342 : Poly :=
[
  term ((909 : Rat) / 4) [(10, 1), (13, 1), (15, 1)]
]

/-- Partial product 342 for generator 26. -/
def rs_R009_ueqv_R009NYYNY_partial_26_0342 : Poly :=
[
  term ((909 : Rat) / 2) [(10, 1), (11, 1), (13, 2), (15, 1)],
  term ((-909 : Rat) / 4) [(10, 1), (11, 2), (13, 1), (15, 1)],
  term ((909 : Rat) / 2) [(10, 2), (12, 1), (13, 1), (15, 1)],
  term ((-909 : Rat) / 4) [(10, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 342 for generator 26. -/
theorem rs_R009_ueqv_R009NYYNY_partial_26_0342_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_26_0342
        rs_R009_ueqv_R009NYYNY_generator_26_0300_0366 =
      rs_R009_ueqv_R009NYYNY_partial_26_0342 := by
  native_decide

/-- Coefficient term 343 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NYYNY_coefficient_26_0343 : Poly :=
[
  term ((-171 : Rat) / 8) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 343 for generator 26. -/
def rs_R009_ueqv_R009NYYNY_partial_26_0343 : Poly :=
[
  term ((-171 : Rat) / 4) [(10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((171 : Rat) / 8) [(10, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-171 : Rat) / 4) [(10, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((171 : Rat) / 8) [(10, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 343 for generator 26. -/
theorem rs_R009_ueqv_R009NYYNY_partial_26_0343_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_26_0343
        rs_R009_ueqv_R009NYYNY_generator_26_0300_0366 =
      rs_R009_ueqv_R009NYYNY_partial_26_0343 := by
  native_decide

/-- Coefficient term 344 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NYYNY_coefficient_26_0344 : Poly :=
[
  term (-192 : Rat) [(10, 1), (13, 2)]
]

/-- Partial product 344 for generator 26. -/
def rs_R009_ueqv_R009NYYNY_partial_26_0344 : Poly :=
[
  term (-384 : Rat) [(10, 1), (11, 1), (13, 3)],
  term (192 : Rat) [(10, 1), (11, 2), (13, 2)],
  term (-384 : Rat) [(10, 2), (12, 1), (13, 2)],
  term (192 : Rat) [(10, 3), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 344 for generator 26. -/
theorem rs_R009_ueqv_R009NYYNY_partial_26_0344_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_26_0344
        rs_R009_ueqv_R009NYYNY_generator_26_0300_0366 =
      rs_R009_ueqv_R009NYYNY_partial_26_0344 := by
  native_decide

/-- Coefficient term 345 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NYYNY_coefficient_26_0345 : Poly :=
[
  term ((9 : Rat) / 4) [(10, 2)]
]

/-- Partial product 345 for generator 26. -/
def rs_R009_ueqv_R009NYYNY_partial_26_0345 : Poly :=
[
  term ((9 : Rat) / 2) [(10, 2), (11, 1), (13, 1)],
  term ((-9 : Rat) / 4) [(10, 2), (11, 2)],
  term ((9 : Rat) / 2) [(10, 3), (12, 1)],
  term ((-9 : Rat) / 4) [(10, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 345 for generator 26. -/
theorem rs_R009_ueqv_R009NYYNY_partial_26_0345_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_26_0345
        rs_R009_ueqv_R009NYYNY_generator_26_0300_0366 =
      rs_R009_ueqv_R009NYYNY_partial_26_0345 := by
  native_decide

/-- Coefficient term 346 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NYYNY_coefficient_26_0346 : Poly :=
[
  term (-252 : Rat) [(10, 2), (11, 1), (13, 1)]
]

/-- Partial product 346 for generator 26. -/
def rs_R009_ueqv_R009NYYNY_partial_26_0346 : Poly :=
[
  term (-504 : Rat) [(10, 2), (11, 2), (13, 2)],
  term (252 : Rat) [(10, 2), (11, 3), (13, 1)],
  term (-504 : Rat) [(10, 3), (11, 1), (12, 1), (13, 1)],
  term (252 : Rat) [(10, 4), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 346 for generator 26. -/
theorem rs_R009_ueqv_R009NYYNY_partial_26_0346_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_26_0346
        rs_R009_ueqv_R009NYYNY_generator_26_0300_0366 =
      rs_R009_ueqv_R009NYYNY_partial_26_0346 := by
  native_decide

/-- Coefficient term 347 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NYYNY_coefficient_26_0347 : Poly :=
[
  term (12 : Rat) [(10, 2), (11, 1), (15, 1)]
]

/-- Partial product 347 for generator 26. -/
def rs_R009_ueqv_R009NYYNY_partial_26_0347 : Poly :=
[
  term (24 : Rat) [(10, 2), (11, 2), (13, 1), (15, 1)],
  term (-12 : Rat) [(10, 2), (11, 3), (15, 1)],
  term (24 : Rat) [(10, 3), (11, 1), (12, 1), (15, 1)],
  term (-12 : Rat) [(10, 4), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 347 for generator 26. -/
theorem rs_R009_ueqv_R009NYYNY_partial_26_0347_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_26_0347
        rs_R009_ueqv_R009NYYNY_generator_26_0300_0366 =
      rs_R009_ueqv_R009NYYNY_partial_26_0347 := by
  native_decide

/-- Coefficient term 348 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NYYNY_coefficient_26_0348 : Poly :=
[
  term (18 : Rat) [(10, 2), (11, 2)]
]

/-- Partial product 348 for generator 26. -/
def rs_R009_ueqv_R009NYYNY_partial_26_0348 : Poly :=
[
  term (36 : Rat) [(10, 2), (11, 3), (13, 1)],
  term (-18 : Rat) [(10, 2), (11, 4)],
  term (36 : Rat) [(10, 3), (11, 2), (12, 1)],
  term (-18 : Rat) [(10, 4), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 348 for generator 26. -/
theorem rs_R009_ueqv_R009NYYNY_partial_26_0348_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_26_0348
        rs_R009_ueqv_R009NYYNY_generator_26_0300_0366 =
      rs_R009_ueqv_R009NYYNY_partial_26_0348 := by
  native_decide

/-- Coefficient term 349 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NYYNY_coefficient_26_0349 : Poly :=
[
  term (160 : Rat) [(10, 2), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 349 for generator 26. -/
def rs_R009_ueqv_R009NYYNY_partial_26_0349 : Poly :=
[
  term (320 : Rat) [(10, 2), (11, 1), (13, 2), (14, 1), (15, 1)],
  term (-160 : Rat) [(10, 2), (11, 2), (13, 1), (14, 1), (15, 1)],
  term (320 : Rat) [(10, 3), (12, 1), (13, 1), (14, 1), (15, 1)],
  term (-160 : Rat) [(10, 4), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 349 for generator 26. -/
theorem rs_R009_ueqv_R009NYYNY_partial_26_0349_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_26_0349
        rs_R009_ueqv_R009NYYNY_generator_26_0300_0366 =
      rs_R009_ueqv_R009NYYNY_partial_26_0349 := by
  native_decide

/-- Coefficient term 350 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NYYNY_coefficient_26_0350 : Poly :=
[
  term ((-439 : Rat) / 3) [(10, 2), (13, 1), (15, 1)]
]

/-- Partial product 350 for generator 26. -/
def rs_R009_ueqv_R009NYYNY_partial_26_0350 : Poly :=
[
  term ((-878 : Rat) / 3) [(10, 2), (11, 1), (13, 2), (15, 1)],
  term ((439 : Rat) / 3) [(10, 2), (11, 2), (13, 1), (15, 1)],
  term ((-878 : Rat) / 3) [(10, 3), (12, 1), (13, 1), (15, 1)],
  term ((439 : Rat) / 3) [(10, 4), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 350 for generator 26. -/
theorem rs_R009_ueqv_R009NYYNY_partial_26_0350_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_26_0350
        rs_R009_ueqv_R009NYYNY_generator_26_0300_0366 =
      rs_R009_ueqv_R009NYYNY_partial_26_0350 := by
  native_decide

/-- Coefficient term 351 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NYYNY_coefficient_26_0351 : Poly :=
[
  term ((15 : Rat) / 2) [(10, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 351 for generator 26. -/
def rs_R009_ueqv_R009NYYNY_partial_26_0351 : Poly :=
[
  term (15 : Rat) [(10, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-15 : Rat) / 2) [(10, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term (15 : Rat) [(10, 3), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-15 : Rat) / 2) [(10, 4), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 351 for generator 26. -/
theorem rs_R009_ueqv_R009NYYNY_partial_26_0351_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_26_0351
        rs_R009_ueqv_R009NYYNY_generator_26_0300_0366 =
      rs_R009_ueqv_R009NYYNY_partial_26_0351 := by
  native_decide

/-- Coefficient term 352 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NYYNY_coefficient_26_0352 : Poly :=
[
  term (141 : Rat) [(10, 2), (13, 2)]
]

/-- Partial product 352 for generator 26. -/
def rs_R009_ueqv_R009NYYNY_partial_26_0352 : Poly :=
[
  term (282 : Rat) [(10, 2), (11, 1), (13, 3)],
  term (-141 : Rat) [(10, 2), (11, 2), (13, 2)],
  term (282 : Rat) [(10, 3), (12, 1), (13, 2)],
  term (-141 : Rat) [(10, 4), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 352 for generator 26. -/
theorem rs_R009_ueqv_R009NYYNY_partial_26_0352_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_26_0352
        rs_R009_ueqv_R009NYYNY_generator_26_0300_0366 =
      rs_R009_ueqv_R009NYYNY_partial_26_0352 := by
  native_decide

/-- Coefficient term 353 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NYYNY_coefficient_26_0353 : Poly :=
[
  term (36 : Rat) [(10, 3), (11, 1), (13, 1)]
]

/-- Partial product 353 for generator 26. -/
def rs_R009_ueqv_R009NYYNY_partial_26_0353 : Poly :=
[
  term (72 : Rat) [(10, 3), (11, 2), (13, 2)],
  term (-36 : Rat) [(10, 3), (11, 3), (13, 1)],
  term (72 : Rat) [(10, 4), (11, 1), (12, 1), (13, 1)],
  term (-36 : Rat) [(10, 5), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 353 for generator 26. -/
theorem rs_R009_ueqv_R009NYYNY_partial_26_0353_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_26_0353
        rs_R009_ueqv_R009NYYNY_generator_26_0300_0366 =
      rs_R009_ueqv_R009NYYNY_partial_26_0353 := by
  native_decide

/-- Coefficient term 354 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NYYNY_coefficient_26_0354 : Poly :=
[
  term (24 : Rat) [(10, 3), (13, 1), (15, 1)]
]

/-- Partial product 354 for generator 26. -/
def rs_R009_ueqv_R009NYYNY_partial_26_0354 : Poly :=
[
  term (48 : Rat) [(10, 3), (11, 1), (13, 2), (15, 1)],
  term (-24 : Rat) [(10, 3), (11, 2), (13, 1), (15, 1)],
  term (48 : Rat) [(10, 4), (12, 1), (13, 1), (15, 1)],
  term (-24 : Rat) [(10, 5), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 354 for generator 26. -/
theorem rs_R009_ueqv_R009NYYNY_partial_26_0354_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_26_0354
        rs_R009_ueqv_R009NYYNY_generator_26_0300_0366 =
      rs_R009_ueqv_R009NYYNY_partial_26_0354 := by
  native_decide

/-- Coefficient term 355 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NYYNY_coefficient_26_0355 : Poly :=
[
  term (-24 : Rat) [(10, 3), (13, 2)]
]

/-- Partial product 355 for generator 26. -/
def rs_R009_ueqv_R009NYYNY_partial_26_0355 : Poly :=
[
  term (-48 : Rat) [(10, 3), (11, 1), (13, 3)],
  term (24 : Rat) [(10, 3), (11, 2), (13, 2)],
  term (-48 : Rat) [(10, 4), (12, 1), (13, 2)],
  term (24 : Rat) [(10, 5), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 355 for generator 26. -/
theorem rs_R009_ueqv_R009NYYNY_partial_26_0355_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_26_0355
        rs_R009_ueqv_R009NYYNY_generator_26_0300_0366 =
      rs_R009_ueqv_R009NYYNY_partial_26_0355 := by
  native_decide

/-- Coefficient term 356 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NYYNY_coefficient_26_0356 : Poly :=
[
  term (-174 : Rat) [(11, 1), (13, 1)]
]

/-- Partial product 356 for generator 26. -/
def rs_R009_ueqv_R009NYYNY_partial_26_0356 : Poly :=
[
  term (-348 : Rat) [(10, 1), (11, 1), (12, 1), (13, 1)],
  term (174 : Rat) [(10, 2), (11, 1), (13, 1)],
  term (-348 : Rat) [(11, 2), (13, 2)],
  term (174 : Rat) [(11, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 356 for generator 26. -/
theorem rs_R009_ueqv_R009NYYNY_partial_26_0356_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_26_0356
        rs_R009_ueqv_R009NYYNY_generator_26_0300_0366 =
      rs_R009_ueqv_R009NYYNY_partial_26_0356 := by
  native_decide

/-- Coefficient term 357 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NYYNY_coefficient_26_0357 : Poly :=
[
  term (-80 : Rat) [(11, 1), (14, 1), (15, 1)]
]

/-- Partial product 357 for generator 26. -/
def rs_R009_ueqv_R009NYYNY_partial_26_0357 : Poly :=
[
  term (-160 : Rat) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term (80 : Rat) [(10, 2), (11, 1), (14, 1), (15, 1)],
  term (-160 : Rat) [(11, 2), (13, 1), (14, 1), (15, 1)],
  term (80 : Rat) [(11, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 357 for generator 26. -/
theorem rs_R009_ueqv_R009NYYNY_partial_26_0357_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_26_0357
        rs_R009_ueqv_R009NYYNY_generator_26_0300_0366 =
      rs_R009_ueqv_R009NYYNY_partial_26_0357 := by
  native_decide

/-- Coefficient term 358 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NYYNY_coefficient_26_0358 : Poly :=
[
  term ((1489 : Rat) / 24) [(11, 1), (15, 1)]
]

/-- Partial product 358 for generator 26. -/
def rs_R009_ueqv_R009NYYNY_partial_26_0358 : Poly :=
[
  term ((1489 : Rat) / 12) [(10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-1489 : Rat) / 24) [(10, 2), (11, 1), (15, 1)],
  term ((1489 : Rat) / 12) [(11, 2), (13, 1), (15, 1)],
  term ((-1489 : Rat) / 24) [(11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 358 for generator 26. -/
theorem rs_R009_ueqv_R009NYYNY_partial_26_0358_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_26_0358
        rs_R009_ueqv_R009NYYNY_generator_26_0300_0366 =
      rs_R009_ueqv_R009NYYNY_partial_26_0358 := by
  native_decide

/-- Coefficient term 359 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NYYNY_coefficient_26_0359 : Poly :=
[
  term ((-177 : Rat) / 16) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 359 for generator 26. -/
def rs_R009_ueqv_R009NYYNY_partial_26_0359 : Poly :=
[
  term ((-177 : Rat) / 8) [(10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((177 : Rat) / 16) [(10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-177 : Rat) / 8) [(11, 2), (13, 1), (15, 1), (16, 1)],
  term ((177 : Rat) / 16) [(11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 359 for generator 26. -/
theorem rs_R009_ueqv_R009NYYNY_partial_26_0359_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_26_0359
        rs_R009_ueqv_R009NYYNY_generator_26_0300_0366 =
      rs_R009_ueqv_R009NYYNY_partial_26_0359 := by
  native_decide

/-- Coefficient term 360 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NYYNY_coefficient_26_0360 : Poly :=
[
  term (96 : Rat) [(11, 2)]
]

/-- Partial product 360 for generator 26. -/
def rs_R009_ueqv_R009NYYNY_partial_26_0360 : Poly :=
[
  term (192 : Rat) [(10, 1), (11, 2), (12, 1)],
  term (-96 : Rat) [(10, 2), (11, 2)],
  term (192 : Rat) [(11, 3), (13, 1)],
  term (-96 : Rat) [(11, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 360 for generator 26. -/
theorem rs_R009_ueqv_R009NYYNY_partial_26_0360_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_26_0360
        rs_R009_ueqv_R009NYYNY_generator_26_0300_0366 =
      rs_R009_ueqv_R009NYYNY_partial_26_0360 := by
  native_decide

/-- Coefficient term 361 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NYYNY_coefficient_26_0361 : Poly :=
[
  term ((472 : Rat) / 3) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 361 for generator 26. -/
def rs_R009_ueqv_R009NYYNY_partial_26_0361 : Poly :=
[
  term ((944 : Rat) / 3) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-472 : Rat) / 3) [(10, 2), (13, 1), (14, 1), (15, 1)],
  term ((944 : Rat) / 3) [(11, 1), (13, 2), (14, 1), (15, 1)],
  term ((-472 : Rat) / 3) [(11, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 361 for generator 26. -/
theorem rs_R009_ueqv_R009NYYNY_partial_26_0361_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_26_0361
        rs_R009_ueqv_R009NYYNY_generator_26_0300_0366 =
      rs_R009_ueqv_R009NYYNY_partial_26_0361 := by
  native_decide

/-- Coefficient term 362 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NYYNY_coefficient_26_0362 : Poly :=
[
  term ((-1241 : Rat) / 12) [(13, 1), (15, 1)]
]

/-- Partial product 362 for generator 26. -/
def rs_R009_ueqv_R009NYYNY_partial_26_0362 : Poly :=
[
  term ((-1241 : Rat) / 6) [(10, 1), (12, 1), (13, 1), (15, 1)],
  term ((1241 : Rat) / 12) [(10, 2), (13, 1), (15, 1)],
  term ((-1241 : Rat) / 6) [(11, 1), (13, 2), (15, 1)],
  term ((1241 : Rat) / 12) [(11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 362 for generator 26. -/
theorem rs_R009_ueqv_R009NYYNY_partial_26_0362_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_26_0362
        rs_R009_ueqv_R009NYYNY_generator_26_0300_0366 =
      rs_R009_ueqv_R009NYYNY_partial_26_0362 := by
  native_decide

/-- Coefficient term 363 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NYYNY_coefficient_26_0363 : Poly :=
[
  term (15 : Rat) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 363 for generator 26. -/
def rs_R009_ueqv_R009NYYNY_partial_26_0363 : Poly :=
[
  term (30 : Rat) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (-15 : Rat) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term (30 : Rat) [(11, 1), (13, 2), (15, 1), (16, 1)],
  term (-15 : Rat) [(11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 363 for generator 26. -/
theorem rs_R009_ueqv_R009NYYNY_partial_26_0363_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_26_0363
        rs_R009_ueqv_R009NYYNY_generator_26_0300_0366 =
      rs_R009_ueqv_R009NYYNY_partial_26_0363 := by
  native_decide

/-- Coefficient term 364 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NYYNY_coefficient_26_0364 : Poly :=
[
  term ((163 : Rat) / 3) [(13, 2)]
]

/-- Partial product 364 for generator 26. -/
def rs_R009_ueqv_R009NYYNY_partial_26_0364 : Poly :=
[
  term ((326 : Rat) / 3) [(10, 1), (12, 1), (13, 2)],
  term ((-163 : Rat) / 3) [(10, 2), (13, 2)],
  term ((326 : Rat) / 3) [(11, 1), (13, 3)],
  term ((-163 : Rat) / 3) [(11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 364 for generator 26. -/
theorem rs_R009_ueqv_R009NYYNY_partial_26_0364_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_26_0364
        rs_R009_ueqv_R009NYYNY_generator_26_0300_0366 =
      rs_R009_ueqv_R009NYYNY_partial_26_0364 := by
  native_decide

/-- Coefficient term 365 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NYYNY_coefficient_26_0365 : Poly :=
[
  term ((-13 : Rat) / 6) [(14, 1)]
]

/-- Partial product 365 for generator 26. -/
def rs_R009_ueqv_R009NYYNY_partial_26_0365 : Poly :=
[
  term ((-13 : Rat) / 3) [(10, 1), (12, 1), (14, 1)],
  term ((13 : Rat) / 6) [(10, 2), (14, 1)],
  term ((-13 : Rat) / 3) [(11, 1), (13, 1), (14, 1)],
  term ((13 : Rat) / 6) [(11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 365 for generator 26. -/
theorem rs_R009_ueqv_R009NYYNY_partial_26_0365_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_26_0365
        rs_R009_ueqv_R009NYYNY_generator_26_0300_0366 =
      rs_R009_ueqv_R009NYYNY_partial_26_0365 := by
  native_decide

/-- Coefficient term 366 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NYYNY_coefficient_26_0366 : Poly :=
[
  term ((-16 : Rat) / 3) [(15, 2)]
]

/-- Partial product 366 for generator 26. -/
def rs_R009_ueqv_R009NYYNY_partial_26_0366 : Poly :=
[
  term ((-32 : Rat) / 3) [(10, 1), (12, 1), (15, 2)],
  term ((16 : Rat) / 3) [(10, 2), (15, 2)],
  term ((-32 : Rat) / 3) [(11, 1), (13, 1), (15, 2)],
  term ((16 : Rat) / 3) [(11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 366 for generator 26. -/
theorem rs_R009_ueqv_R009NYYNY_partial_26_0366_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_26_0366
        rs_R009_ueqv_R009NYYNY_generator_26_0300_0366 =
      rs_R009_ueqv_R009NYYNY_partial_26_0366 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NYYNY_partials_26_0300_0366 : List Poly :=
[
  rs_R009_ueqv_R009NYYNY_partial_26_0300,
  rs_R009_ueqv_R009NYYNY_partial_26_0301,
  rs_R009_ueqv_R009NYYNY_partial_26_0302,
  rs_R009_ueqv_R009NYYNY_partial_26_0303,
  rs_R009_ueqv_R009NYYNY_partial_26_0304,
  rs_R009_ueqv_R009NYYNY_partial_26_0305,
  rs_R009_ueqv_R009NYYNY_partial_26_0306,
  rs_R009_ueqv_R009NYYNY_partial_26_0307,
  rs_R009_ueqv_R009NYYNY_partial_26_0308,
  rs_R009_ueqv_R009NYYNY_partial_26_0309,
  rs_R009_ueqv_R009NYYNY_partial_26_0310,
  rs_R009_ueqv_R009NYYNY_partial_26_0311,
  rs_R009_ueqv_R009NYYNY_partial_26_0312,
  rs_R009_ueqv_R009NYYNY_partial_26_0313,
  rs_R009_ueqv_R009NYYNY_partial_26_0314,
  rs_R009_ueqv_R009NYYNY_partial_26_0315,
  rs_R009_ueqv_R009NYYNY_partial_26_0316,
  rs_R009_ueqv_R009NYYNY_partial_26_0317,
  rs_R009_ueqv_R009NYYNY_partial_26_0318,
  rs_R009_ueqv_R009NYYNY_partial_26_0319,
  rs_R009_ueqv_R009NYYNY_partial_26_0320,
  rs_R009_ueqv_R009NYYNY_partial_26_0321,
  rs_R009_ueqv_R009NYYNY_partial_26_0322,
  rs_R009_ueqv_R009NYYNY_partial_26_0323,
  rs_R009_ueqv_R009NYYNY_partial_26_0324,
  rs_R009_ueqv_R009NYYNY_partial_26_0325,
  rs_R009_ueqv_R009NYYNY_partial_26_0326,
  rs_R009_ueqv_R009NYYNY_partial_26_0327,
  rs_R009_ueqv_R009NYYNY_partial_26_0328,
  rs_R009_ueqv_R009NYYNY_partial_26_0329,
  rs_R009_ueqv_R009NYYNY_partial_26_0330,
  rs_R009_ueqv_R009NYYNY_partial_26_0331,
  rs_R009_ueqv_R009NYYNY_partial_26_0332,
  rs_R009_ueqv_R009NYYNY_partial_26_0333,
  rs_R009_ueqv_R009NYYNY_partial_26_0334,
  rs_R009_ueqv_R009NYYNY_partial_26_0335,
  rs_R009_ueqv_R009NYYNY_partial_26_0336,
  rs_R009_ueqv_R009NYYNY_partial_26_0337,
  rs_R009_ueqv_R009NYYNY_partial_26_0338,
  rs_R009_ueqv_R009NYYNY_partial_26_0339,
  rs_R009_ueqv_R009NYYNY_partial_26_0340,
  rs_R009_ueqv_R009NYYNY_partial_26_0341,
  rs_R009_ueqv_R009NYYNY_partial_26_0342,
  rs_R009_ueqv_R009NYYNY_partial_26_0343,
  rs_R009_ueqv_R009NYYNY_partial_26_0344,
  rs_R009_ueqv_R009NYYNY_partial_26_0345,
  rs_R009_ueqv_R009NYYNY_partial_26_0346,
  rs_R009_ueqv_R009NYYNY_partial_26_0347,
  rs_R009_ueqv_R009NYYNY_partial_26_0348,
  rs_R009_ueqv_R009NYYNY_partial_26_0349,
  rs_R009_ueqv_R009NYYNY_partial_26_0350,
  rs_R009_ueqv_R009NYYNY_partial_26_0351,
  rs_R009_ueqv_R009NYYNY_partial_26_0352,
  rs_R009_ueqv_R009NYYNY_partial_26_0353,
  rs_R009_ueqv_R009NYYNY_partial_26_0354,
  rs_R009_ueqv_R009NYYNY_partial_26_0355,
  rs_R009_ueqv_R009NYYNY_partial_26_0356,
  rs_R009_ueqv_R009NYYNY_partial_26_0357,
  rs_R009_ueqv_R009NYYNY_partial_26_0358,
  rs_R009_ueqv_R009NYYNY_partial_26_0359,
  rs_R009_ueqv_R009NYYNY_partial_26_0360,
  rs_R009_ueqv_R009NYYNY_partial_26_0361,
  rs_R009_ueqv_R009NYYNY_partial_26_0362,
  rs_R009_ueqv_R009NYYNY_partial_26_0363,
  rs_R009_ueqv_R009NYYNY_partial_26_0364,
  rs_R009_ueqv_R009NYYNY_partial_26_0365,
  rs_R009_ueqv_R009NYYNY_partial_26_0366
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NYYNY_block_26_0300_0366 : Poly :=
[
  term ((-57 : Rat) / 8) [(5, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((57 : Rat) / 16) [(5, 1), (10, 2), (15, 1), (16, 1)],
  term ((-57 : Rat) / 8) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((57 : Rat) / 16) [(5, 1), (11, 2), (15, 1), (16, 1)],
  term (-12 : Rat) [(7, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term (6 : Rat) [(7, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(7, 1), (8, 1), (10, 1), (11, 2), (15, 1)],
  term (-3 : Rat) [(7, 1), (8, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term (-16 : Rat) [(7, 1), (8, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term (27 : Rat) [(7, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((-19 : Rat) / 2) [(7, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(7, 1), (8, 1), (10, 2), (12, 1), (15, 1)],
  term (6 : Rat) [(7, 1), (8, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(7, 1), (8, 1), (10, 2), (14, 1), (15, 1)],
  term ((-27 : Rat) / 2) [(7, 1), (8, 1), (10, 2), (15, 1)],
  term ((19 : Rat) / 4) [(7, 1), (8, 1), (10, 2), (15, 1), (16, 1)],
  term (6 : Rat) [(7, 1), (8, 1), (10, 3), (15, 1)],
  term (-3 : Rat) [(7, 1), (8, 1), (10, 3), (15, 1), (16, 1)],
  term (-16 : Rat) [(7, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term (27 : Rat) [(7, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-19 : Rat) / 2) [(7, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(7, 1), (8, 1), (11, 2), (14, 1), (15, 1)],
  term ((-27 : Rat) / 2) [(7, 1), (8, 1), (11, 2), (15, 1)],
  term ((19 : Rat) / 4) [(7, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term (6 : Rat) [(7, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term (-3 : Rat) [(7, 1), (10, 1), (11, 2), (15, 1)],
  term (32 : Rat) [(7, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-47 : Rat) / 2) [(7, 1), (10, 1), (12, 1), (15, 1)],
  term (6 : Rat) [(7, 1), (10, 2), (12, 1), (15, 1)],
  term (-16 : Rat) [(7, 1), (10, 2), (14, 1), (15, 1)],
  term ((47 : Rat) / 4) [(7, 1), (10, 2), (15, 1)],
  term (-3 : Rat) [(7, 1), (10, 3), (15, 1)],
  term (32 : Rat) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-47 : Rat) / 2) [(7, 1), (11, 1), (13, 1), (15, 1)],
  term (-16 : Rat) [(7, 1), (11, 2), (14, 1), (15, 1)],
  term ((47 : Rat) / 4) [(7, 1), (11, 2), (15, 1)],
  term (18 : Rat) [(8, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term (80 : Rat) [(8, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-437 : Rat) / 6) [(8, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((69 : Rat) / 4) [(8, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term (-84 : Rat) [(8, 1), (10, 1), (11, 2), (12, 1)],
  term (42 : Rat) [(8, 1), (10, 1), (11, 2), (13, 1), (15, 1)],
  term (-9 : Rat) [(8, 1), (10, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(8, 1), (10, 1), (11, 2), (13, 2)],
  term (21 : Rat) [(8, 1), (10, 1), (11, 3), (13, 1)],
  term (-21 : Rat) [(8, 1), (10, 1), (11, 3), (15, 1)],
  term ((9 : Rat) / 2) [(8, 1), (10, 1), (11, 3), (15, 1), (16, 1)],
  term (-9 : Rat) [(8, 1), (10, 1), (11, 4)],
  term ((-16 : Rat) / 3) [(8, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((8 : Rat) / 3) [(8, 1), (10, 1), (12, 1), (14, 1)],
  term (-6 : Rat) [(8, 1), (10, 2), (11, 1), (12, 1), (13, 1)],
  term (42 : Rat) [(8, 1), (10, 2), (11, 1), (12, 1), (15, 1)],
  term (-9 : Rat) [(8, 1), (10, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term (-9 : Rat) [(8, 1), (10, 2), (11, 1), (13, 1)],
  term (-40 : Rat) [(8, 1), (10, 2), (11, 1), (14, 1), (15, 1)],
  term ((437 : Rat) / 12) [(8, 1), (10, 2), (11, 1), (15, 1)],
  term ((-69 : Rat) / 8) [(8, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term (42 : Rat) [(8, 1), (10, 2), (11, 2)],
  term (18 : Rat) [(8, 1), (10, 2), (11, 2), (12, 1)],
  term ((8 : Rat) / 3) [(8, 1), (10, 2), (13, 1), (15, 1)],
  term ((-4 : Rat) / 3) [(8, 1), (10, 2), (14, 1)],
  term (3 : Rat) [(8, 1), (10, 3), (11, 1), (13, 1)],
  term (-21 : Rat) [(8, 1), (10, 3), (11, 1), (15, 1)],
  term ((9 : Rat) / 2) [(8, 1), (10, 3), (11, 1), (15, 1), (16, 1)],
  term (-9 : Rat) [(8, 1), (10, 3), (11, 2)],
  term ((8 : Rat) / 3) [(8, 1), (11, 1), (13, 1), (14, 1)],
  term ((-16 : Rat) / 3) [(8, 1), (11, 1), (13, 2), (15, 1)],
  term (80 : Rat) [(8, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-421 : Rat) / 6) [(8, 1), (11, 2), (13, 1), (15, 1)],
  term ((69 : Rat) / 4) [(8, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term (18 : Rat) [(8, 1), (11, 2), (13, 2)],
  term ((-4 : Rat) / 3) [(8, 1), (11, 2), (14, 1)],
  term (-93 : Rat) [(8, 1), (11, 3), (13, 1)],
  term (-40 : Rat) [(8, 1), (11, 3), (14, 1), (15, 1)],
  term ((437 : Rat) / 12) [(8, 1), (11, 3), (15, 1)],
  term ((-69 : Rat) / 8) [(8, 1), (11, 3), (15, 1), (16, 1)],
  term (42 : Rat) [(8, 1), (11, 4)],
  term (7 : Rat) [(9, 1), (10, 1), (11, 1), (12, 1)],
  term (-160 : Rat) [(9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((340 : Rat) / 3) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term (-15 : Rat) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term (-90 : Rat) [(9, 1), (10, 1), (11, 1), (13, 2)],
  term (210 : Rat) [(9, 1), (10, 1), (11, 2), (13, 1)],
  term (80 : Rat) [(9, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((-170 : Rat) / 3) [(9, 1), (10, 1), (11, 2), (15, 1)],
  term ((15 : Rat) / 2) [(9, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((-165 : Rat) / 2) [(9, 1), (10, 1), (11, 3)],
  term ((-70 : Rat) / 3) [(9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-8 : Rat) / 3) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((-56 : Rat) / 3) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-29 : Rat) / 6) [(9, 1), (10, 1), (12, 1), (15, 1)],
  term (19 : Rat) [(9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-7 : Rat) / 2) [(9, 1), (10, 2), (11, 1)],
  term (165 : Rat) [(9, 1), (10, 2), (11, 1), (12, 1)],
  term (-24 : Rat) [(9, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term (24 : Rat) [(9, 1), (10, 2), (11, 1), (13, 2)],
  term (-48 : Rat) [(9, 1), (10, 2), (11, 2), (13, 1)],
  term (12 : Rat) [(9, 1), (10, 2), (11, 2), (15, 1)],
  term (18 : Rat) [(9, 1), (10, 2), (11, 3)],
  term (-90 : Rat) [(9, 1), (10, 2), (12, 1), (13, 1)],
  term (-160 : Rat) [(9, 1), (10, 2), (12, 1), (14, 1), (15, 1)],
  term ((340 : Rat) / 3) [(9, 1), (10, 2), (12, 1), (15, 1)],
  term (-15 : Rat) [(9, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((35 : Rat) / 3) [(9, 1), (10, 2), (13, 1)],
  term ((4 : Rat) / 3) [(9, 1), (10, 2), (13, 1), (14, 1)],
  term ((28 : Rat) / 3) [(9, 1), (10, 2), (14, 1), (15, 1)],
  term ((29 : Rat) / 12) [(9, 1), (10, 2), (15, 1)],
  term ((-19 : Rat) / 2) [(9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-165 : Rat) / 2) [(9, 1), (10, 3), (11, 1)],
  term (-36 : Rat) [(9, 1), (10, 3), (11, 1), (12, 1)],
  term (24 : Rat) [(9, 1), (10, 3), (12, 1), (13, 1)],
  term (-24 : Rat) [(9, 1), (10, 3), (12, 1), (15, 1)],
  term (45 : Rat) [(9, 1), (10, 3), (13, 1)],
  term (80 : Rat) [(9, 1), (10, 3), (14, 1), (15, 1)],
  term ((-170 : Rat) / 3) [(9, 1), (10, 3), (15, 1)],
  term ((15 : Rat) / 2) [(9, 1), (10, 3), (15, 1), (16, 1)],
  term (18 : Rat) [(9, 1), (10, 4), (11, 1)],
  term (-12 : Rat) [(9, 1), (10, 4), (13, 1)],
  term (12 : Rat) [(9, 1), (10, 4), (15, 1)],
  term ((-56 : Rat) / 3) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-29 : Rat) / 6) [(9, 1), (11, 1), (13, 1), (15, 1)],
  term (19 : Rat) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-70 : Rat) / 3) [(9, 1), (11, 1), (13, 2)],
  term ((-8 : Rat) / 3) [(9, 1), (11, 1), (13, 2), (14, 1)],
  term ((56 : Rat) / 3) [(9, 1), (11, 2), (13, 1)],
  term ((4 : Rat) / 3) [(9, 1), (11, 2), (13, 1), (14, 1)],
  term ((28 : Rat) / 3) [(9, 1), (11, 2), (14, 1), (15, 1)],
  term ((29 : Rat) / 12) [(9, 1), (11, 2), (15, 1)],
  term ((-19 : Rat) / 2) [(9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-7 : Rat) / 2) [(9, 1), (11, 3)],
  term ((8 : Rat) / 3) [(9, 2), (10, 1), (12, 1)],
  term ((-4 : Rat) / 3) [(9, 2), (10, 2)],
  term ((8 : Rat) / 3) [(9, 2), (11, 1), (13, 1)],
  term ((-4 : Rat) / 3) [(9, 2), (11, 2)],
  term (-348 : Rat) [(10, 1), (11, 1), (12, 1), (13, 1)],
  term (-160 : Rat) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((1489 : Rat) / 12) [(10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-177 : Rat) / 8) [(10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-39 : Rat) / 2) [(10, 1), (11, 1), (13, 1)],
  term (-640 : Rat) [(10, 1), (11, 1), (13, 2), (14, 1), (15, 1)],
  term ((909 : Rat) / 2) [(10, 1), (11, 1), (13, 2), (15, 1)],
  term ((-171 : Rat) / 4) [(10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term (-384 : Rat) [(10, 1), (11, 1), (13, 3)],
  term ((39 : Rat) / 4) [(10, 1), (11, 2)],
  term (192 : Rat) [(10, 1), (11, 2), (12, 1)],
  term (480 : Rat) [(10, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-4555 : Rat) / 12) [(10, 1), (11, 2), (13, 1), (15, 1)],
  term ((303 : Rat) / 8) [(10, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term (1038 : Rat) [(10, 1), (11, 2), (13, 2)],
  term (-627 : Rat) [(10, 1), (11, 3), (13, 1)],
  term (-80 : Rat) [(10, 1), (11, 3), (14, 1), (15, 1)],
  term ((457 : Rat) / 6) [(10, 1), (11, 3), (15, 1)],
  term ((-33 : Rat) / 4) [(10, 1), (11, 3), (15, 1), (16, 1)],
  term (102 : Rat) [(10, 1), (11, 4)],
  term ((944 : Rat) / 3) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1241 : Rat) / 6) [(10, 1), (12, 1), (13, 1), (15, 1)],
  term (30 : Rat) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((326 : Rat) / 3) [(10, 1), (12, 1), (13, 2)],
  term ((-13 : Rat) / 3) [(10, 1), (12, 1), (14, 1)],
  term ((-32 : Rat) / 3) [(10, 1), (12, 1), (15, 2)],
  term (846 : Rat) [(10, 2), (11, 1), (12, 1), (13, 1)],
  term (160 : Rat) [(10, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-457 : Rat) / 3) [(10, 2), (11, 1), (12, 1), (15, 1)],
  term ((33 : Rat) / 2) [(10, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((357 : Rat) / 2) [(10, 2), (11, 1), (13, 1)],
  term (320 : Rat) [(10, 2), (11, 1), (13, 2), (14, 1), (15, 1)],
  term ((-878 : Rat) / 3) [(10, 2), (11, 1), (13, 2), (15, 1)],
  term (15 : Rat) [(10, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term (282 : Rat) [(10, 2), (11, 1), (13, 3)],
  term (80 : Rat) [(10, 2), (11, 1), (14, 1), (15, 1)],
  term ((-1489 : Rat) / 24) [(10, 2), (11, 1), (15, 1)],
  term ((177 : Rat) / 16) [(10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-393 : Rat) / 4) [(10, 2), (11, 2)],
  term (-204 : Rat) [(10, 2), (11, 2), (12, 1)],
  term (-160 : Rat) [(10, 2), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((511 : Rat) / 3) [(10, 2), (11, 2), (13, 1), (15, 1)],
  term ((-15 : Rat) / 2) [(10, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term (-645 : Rat) [(10, 2), (11, 2), (13, 2)],
  term (288 : Rat) [(10, 2), (11, 3), (13, 1)],
  term (-12 : Rat) [(10, 2), (11, 3), (15, 1)],
  term (-18 : Rat) [(10, 2), (11, 4)],
  term ((-39 : Rat) / 2) [(10, 2), (12, 1)],
  term (-640 : Rat) [(10, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((909 : Rat) / 2) [(10, 2), (12, 1), (13, 1), (15, 1)],
  term ((-171 : Rat) / 4) [(10, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (-384 : Rat) [(10, 2), (12, 1), (13, 2)],
  term ((-472 : Rat) / 3) [(10, 2), (13, 1), (14, 1), (15, 1)],
  term ((1241 : Rat) / 12) [(10, 2), (13, 1), (15, 1)],
  term (-15 : Rat) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-163 : Rat) / 3) [(10, 2), (13, 2)],
  term ((13 : Rat) / 6) [(10, 2), (14, 1)],
  term ((16 : Rat) / 3) [(10, 2), (15, 2)],
  term ((39 : Rat) / 4) [(10, 3)],
  term (-504 : Rat) [(10, 3), (11, 1), (12, 1), (13, 1)],
  term (24 : Rat) [(10, 3), (11, 1), (12, 1), (15, 1)],
  term (-423 : Rat) [(10, 3), (11, 1), (13, 1)],
  term (48 : Rat) [(10, 3), (11, 1), (13, 2), (15, 1)],
  term (-48 : Rat) [(10, 3), (11, 1), (13, 3)],
  term (-80 : Rat) [(10, 3), (11, 1), (14, 1), (15, 1)],
  term ((457 : Rat) / 6) [(10, 3), (11, 1), (15, 1)],
  term ((-33 : Rat) / 4) [(10, 3), (11, 1), (15, 1), (16, 1)],
  term (102 : Rat) [(10, 3), (11, 2)],
  term (36 : Rat) [(10, 3), (11, 2), (12, 1)],
  term (-24 : Rat) [(10, 3), (11, 2), (13, 1), (15, 1)],
  term (96 : Rat) [(10, 3), (11, 2), (13, 2)],
  term (-36 : Rat) [(10, 3), (11, 3), (13, 1)],
  term ((9 : Rat) / 2) [(10, 3), (12, 1)],
  term (320 : Rat) [(10, 3), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-878 : Rat) / 3) [(10, 3), (12, 1), (13, 1), (15, 1)],
  term (15 : Rat) [(10, 3), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (282 : Rat) [(10, 3), (12, 1), (13, 2)],
  term (320 : Rat) [(10, 3), (13, 1), (14, 1), (15, 1)],
  term ((-909 : Rat) / 4) [(10, 3), (13, 1), (15, 1)],
  term ((171 : Rat) / 8) [(10, 3), (13, 1), (15, 1), (16, 1)],
  term (192 : Rat) [(10, 3), (13, 2)],
  term ((-9 : Rat) / 4) [(10, 4)],
  term (72 : Rat) [(10, 4), (11, 1), (12, 1), (13, 1)],
  term (252 : Rat) [(10, 4), (11, 1), (13, 1)],
  term (-12 : Rat) [(10, 4), (11, 1), (15, 1)],
  term (-18 : Rat) [(10, 4), (11, 2)],
  term (48 : Rat) [(10, 4), (12, 1), (13, 1), (15, 1)],
  term (-48 : Rat) [(10, 4), (12, 1), (13, 2)],
  term (-160 : Rat) [(10, 4), (13, 1), (14, 1), (15, 1)],
  term ((439 : Rat) / 3) [(10, 4), (13, 1), (15, 1)],
  term ((-15 : Rat) / 2) [(10, 4), (13, 1), (15, 1), (16, 1)],
  term (-141 : Rat) [(10, 4), (13, 2)],
  term (-36 : Rat) [(10, 5), (11, 1), (13, 1)],
  term (-24 : Rat) [(10, 5), (13, 1), (15, 1)],
  term (24 : Rat) [(10, 5), (13, 2)],
  term ((-13 : Rat) / 3) [(11, 1), (13, 1), (14, 1)],
  term ((-32 : Rat) / 3) [(11, 1), (13, 1), (15, 2)],
  term ((944 : Rat) / 3) [(11, 1), (13, 2), (14, 1), (15, 1)],
  term ((-1241 : Rat) / 6) [(11, 1), (13, 2), (15, 1)],
  term (30 : Rat) [(11, 1), (13, 2), (15, 1), (16, 1)],
  term ((326 : Rat) / 3) [(11, 1), (13, 3)],
  term ((-952 : Rat) / 3) [(11, 2), (13, 1), (14, 1), (15, 1)],
  term ((455 : Rat) / 2) [(11, 2), (13, 1), (15, 1)],
  term ((-297 : Rat) / 8) [(11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1207 : Rat) / 3) [(11, 2), (13, 2)],
  term ((13 : Rat) / 6) [(11, 2), (14, 1)],
  term ((16 : Rat) / 3) [(11, 2), (15, 2)],
  term (366 : Rat) [(11, 3), (13, 1)],
  term (80 : Rat) [(11, 3), (14, 1), (15, 1)],
  term ((-1489 : Rat) / 24) [(11, 3), (15, 1)],
  term ((177 : Rat) / 16) [(11, 3), (15, 1), (16, 1)],
  term (-96 : Rat) [(11, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 26, terms 300 through 366. -/
theorem rs_R009_ueqv_R009NYYNY_block_26_0300_0366_valid :
    checkProductSumEq rs_R009_ueqv_R009NYYNY_partials_26_0300_0366
      rs_R009_ueqv_R009NYYNY_block_26_0300_0366 = true := by
  native_decide

end R009UeqvR009NYYNYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
