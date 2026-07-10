/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R006:u=v:R006, term block 5:300-366

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R006UeqvR006TermShards

/-- Generator polynomial 5 for relaxed split surplus certificate `R006:u=v:R006`. -/
def rs_R006_ueqv_R006_generator_05_0300_0366 : Poly :=
[
  term (-2 : Rat) [(4, 1)],
  term (1 : Rat) [(4, 2)],
  term (1 : Rat) [(5, 2)],
  term (2 : Rat) [(14, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 300 from coefficient polynomial 5. -/
def rs_R006_ueqv_R006_coefficient_05_0300 : Poly :=
[
  term ((-612 : Rat) / 7) [(8, 1), (11, 1), (13, 1)]
]

/-- Partial product 300 for generator 5. -/
def rs_R006_ueqv_R006_partial_05_0300 : Poly :=
[
  term ((1224 : Rat) / 7) [(4, 1), (8, 1), (11, 1), (13, 1)],
  term ((-612 : Rat) / 7) [(4, 2), (8, 1), (11, 1), (13, 1)],
  term ((-612 : Rat) / 7) [(5, 2), (8, 1), (11, 1), (13, 1)],
  term ((-1224 : Rat) / 7) [(8, 1), (11, 1), (13, 1), (14, 1)],
  term ((612 : Rat) / 7) [(8, 1), (11, 1), (13, 1), (14, 2)],
  term ((612 : Rat) / 7) [(8, 1), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 300 for generator 5. -/
theorem rs_R006_ueqv_R006_partial_05_0300_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_05_0300
        rs_R006_ueqv_R006_generator_05_0300_0366 =
      rs_R006_ueqv_R006_partial_05_0300 := by
  native_decide

/-- Coefficient term 301 from coefficient polynomial 5. -/
def rs_R006_ueqv_R006_coefficient_05_0301 : Poly :=
[
  term ((864 : Rat) / 5) [(8, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 301 for generator 5. -/
def rs_R006_ueqv_R006_partial_05_0301 : Poly :=
[
  term ((-1728 : Rat) / 5) [(4, 1), (8, 1), (11, 1), (13, 1), (14, 1)],
  term ((864 : Rat) / 5) [(4, 2), (8, 1), (11, 1), (13, 1), (14, 1)],
  term ((864 : Rat) / 5) [(5, 2), (8, 1), (11, 1), (13, 1), (14, 1)],
  term ((-864 : Rat) / 5) [(8, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((1728 : Rat) / 5) [(8, 1), (11, 1), (13, 1), (14, 2)],
  term ((-864 : Rat) / 5) [(8, 1), (11, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 301 for generator 5. -/
theorem rs_R006_ueqv_R006_partial_05_0301_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_05_0301
        rs_R006_ueqv_R006_generator_05_0300_0366 =
      rs_R006_ueqv_R006_partial_05_0301 := by
  native_decide

/-- Coefficient term 302 from coefficient polynomial 5. -/
def rs_R006_ueqv_R006_coefficient_05_0302 : Poly :=
[
  term ((-288 : Rat) / 5) [(8, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 302 for generator 5. -/
def rs_R006_ueqv_R006_partial_05_0302 : Poly :=
[
  term ((576 : Rat) / 5) [(4, 1), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(4, 2), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(5, 2), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((288 : Rat) / 5) [(8, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-576 : Rat) / 5) [(8, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((288 : Rat) / 5) [(8, 1), (11, 1), (13, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 302 for generator 5. -/
theorem rs_R006_ueqv_R006_partial_05_0302_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_05_0302
        rs_R006_ueqv_R006_generator_05_0300_0366 =
      rs_R006_ueqv_R006_partial_05_0302 := by
  native_decide

/-- Coefficient term 303 from coefficient polynomial 5. -/
def rs_R006_ueqv_R006_coefficient_05_0303 : Poly :=
[
  term ((144 : Rat) / 5) [(8, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 303 for generator 5. -/
def rs_R006_ueqv_R006_partial_05_0303 : Poly :=
[
  term ((-288 : Rat) / 5) [(4, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((144 : Rat) / 5) [(4, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((144 : Rat) / 5) [(5, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((288 : Rat) / 5) [(8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-144 : Rat) / 5) [(8, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-144 : Rat) / 5) [(8, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 303 for generator 5. -/
theorem rs_R006_ueqv_R006_partial_05_0303_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_05_0303
        rs_R006_ueqv_R006_generator_05_0300_0366 =
      rs_R006_ueqv_R006_partial_05_0303 := by
  native_decide

/-- Coefficient term 304 from coefficient polynomial 5. -/
def rs_R006_ueqv_R006_coefficient_05_0304 : Poly :=
[
  term ((-864 : Rat) / 5) [(8, 1), (11, 1), (15, 1)]
]

/-- Partial product 304 for generator 5. -/
def rs_R006_ueqv_R006_partial_05_0304 : Poly :=
[
  term ((1728 : Rat) / 5) [(4, 1), (8, 1), (11, 1), (15, 1)],
  term ((-864 : Rat) / 5) [(4, 2), (8, 1), (11, 1), (15, 1)],
  term ((-864 : Rat) / 5) [(5, 2), (8, 1), (11, 1), (15, 1)],
  term ((-1728 : Rat) / 5) [(8, 1), (11, 1), (14, 1), (15, 1)],
  term ((864 : Rat) / 5) [(8, 1), (11, 1), (14, 2), (15, 1)],
  term ((864 : Rat) / 5) [(8, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 304 for generator 5. -/
theorem rs_R006_ueqv_R006_partial_05_0304_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_05_0304
        rs_R006_ueqv_R006_generator_05_0300_0366 =
      rs_R006_ueqv_R006_partial_05_0304 := by
  native_decide

/-- Coefficient term 305 from coefficient polynomial 5. -/
def rs_R006_ueqv_R006_coefficient_05_0305 : Poly :=
[
  term ((288 : Rat) / 5) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 305 for generator 5. -/
def rs_R006_ueqv_R006_partial_05_0305 : Poly :=
[
  term ((-576 : Rat) / 5) [(4, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((288 : Rat) / 5) [(4, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((288 : Rat) / 5) [(5, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((576 : Rat) / 5) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(8, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(8, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 305 for generator 5. -/
theorem rs_R006_ueqv_R006_partial_05_0305_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_05_0305
        rs_R006_ueqv_R006_generator_05_0300_0366 =
      rs_R006_ueqv_R006_partial_05_0305 := by
  native_decide

/-- Coefficient term 306 from coefficient polynomial 5. -/
def rs_R006_ueqv_R006_coefficient_05_0306 : Poly :=
[
  term ((72 : Rat) / 35) [(8, 1), (13, 2)]
]

/-- Partial product 306 for generator 5. -/
def rs_R006_ueqv_R006_partial_05_0306 : Poly :=
[
  term ((-144 : Rat) / 35) [(4, 1), (8, 1), (13, 2)],
  term ((72 : Rat) / 35) [(4, 2), (8, 1), (13, 2)],
  term ((72 : Rat) / 35) [(5, 2), (8, 1), (13, 2)],
  term ((144 : Rat) / 35) [(8, 1), (13, 2), (14, 1)],
  term ((-72 : Rat) / 35) [(8, 1), (13, 2), (14, 2)],
  term ((-72 : Rat) / 35) [(8, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 306 for generator 5. -/
theorem rs_R006_ueqv_R006_partial_05_0306_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_05_0306
        rs_R006_ueqv_R006_generator_05_0300_0366 =
      rs_R006_ueqv_R006_partial_05_0306 := by
  native_decide

/-- Coefficient term 307 from coefficient polynomial 5. -/
def rs_R006_ueqv_R006_coefficient_05_0307 : Poly :=
[
  term ((216 : Rat) / 5) [(8, 1), (14, 1)]
]

/-- Partial product 307 for generator 5. -/
def rs_R006_ueqv_R006_partial_05_0307 : Poly :=
[
  term ((-432 : Rat) / 5) [(4, 1), (8, 1), (14, 1)],
  term ((216 : Rat) / 5) [(4, 2), (8, 1), (14, 1)],
  term ((216 : Rat) / 5) [(5, 2), (8, 1), (14, 1)],
  term ((-216 : Rat) / 5) [(8, 1), (14, 1), (15, 2)],
  term ((432 : Rat) / 5) [(8, 1), (14, 2)],
  term ((-216 : Rat) / 5) [(8, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 307 for generator 5. -/
theorem rs_R006_ueqv_R006_partial_05_0307_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_05_0307
        rs_R006_ueqv_R006_generator_05_0300_0366 =
      rs_R006_ueqv_R006_partial_05_0307 := by
  native_decide

/-- Coefficient term 308 from coefficient polynomial 5. -/
def rs_R006_ueqv_R006_coefficient_05_0308 : Poly :=
[
  term ((-552 : Rat) / 5) [(9, 1), (11, 1)]
]

/-- Partial product 308 for generator 5. -/
def rs_R006_ueqv_R006_partial_05_0308 : Poly :=
[
  term ((1104 : Rat) / 5) [(4, 1), (9, 1), (11, 1)],
  term ((-552 : Rat) / 5) [(4, 2), (9, 1), (11, 1)],
  term ((-552 : Rat) / 5) [(5, 2), (9, 1), (11, 1)],
  term ((-1104 : Rat) / 5) [(9, 1), (11, 1), (14, 1)],
  term ((552 : Rat) / 5) [(9, 1), (11, 1), (14, 2)],
  term ((552 : Rat) / 5) [(9, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 308 for generator 5. -/
theorem rs_R006_ueqv_R006_partial_05_0308_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_05_0308
        rs_R006_ueqv_R006_generator_05_0300_0366 =
      rs_R006_ueqv_R006_partial_05_0308 := by
  native_decide

/-- Coefficient term 309 from coefficient polynomial 5. -/
def rs_R006_ueqv_R006_coefficient_05_0309 : Poly :=
[
  term ((10368 : Rat) / 5) [(9, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 309 for generator 5. -/
def rs_R006_ueqv_R006_partial_05_0309 : Poly :=
[
  term ((-20736 : Rat) / 5) [(4, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((10368 : Rat) / 5) [(4, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((10368 : Rat) / 5) [(5, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((20736 : Rat) / 5) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-10368 : Rat) / 5) [(9, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((-10368 : Rat) / 5) [(9, 1), (11, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 309 for generator 5. -/
theorem rs_R006_ueqv_R006_partial_05_0309_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_05_0309
        rs_R006_ueqv_R006_generator_05_0300_0366 =
      rs_R006_ueqv_R006_partial_05_0309 := by
  native_decide

/-- Coefficient term 310 from coefficient polynomial 5. -/
def rs_R006_ueqv_R006_coefficient_05_0310 : Poly :=
[
  term ((-3456 : Rat) / 5) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 310 for generator 5. -/
def rs_R006_ueqv_R006_partial_05_0310 : Poly :=
[
  term ((6912 : Rat) / 5) [(4, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3456 : Rat) / 5) [(4, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3456 : Rat) / 5) [(5, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6912 : Rat) / 5) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3456 : Rat) / 5) [(9, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((3456 : Rat) / 5) [(9, 1), (11, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 310 for generator 5. -/
theorem rs_R006_ueqv_R006_partial_05_0310_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_05_0310
        rs_R006_ueqv_R006_generator_05_0300_0366 =
      rs_R006_ueqv_R006_partial_05_0310 := by
  native_decide

/-- Coefficient term 311 from coefficient polynomial 5. -/
def rs_R006_ueqv_R006_coefficient_05_0311 : Poly :=
[
  term ((34848 : Rat) / 35) [(9, 1), (11, 1), (13, 2)]
]

/-- Partial product 311 for generator 5. -/
def rs_R006_ueqv_R006_partial_05_0311 : Poly :=
[
  term ((-69696 : Rat) / 35) [(4, 1), (9, 1), (11, 1), (13, 2)],
  term ((34848 : Rat) / 35) [(4, 2), (9, 1), (11, 1), (13, 2)],
  term ((34848 : Rat) / 35) [(5, 2), (9, 1), (11, 1), (13, 2)],
  term ((69696 : Rat) / 35) [(9, 1), (11, 1), (13, 2), (14, 1)],
  term ((-34848 : Rat) / 35) [(9, 1), (11, 1), (13, 2), (14, 2)],
  term ((-34848 : Rat) / 35) [(9, 1), (11, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 311 for generator 5. -/
theorem rs_R006_ueqv_R006_partial_05_0311_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_05_0311
        rs_R006_ueqv_R006_generator_05_0300_0366 =
      rs_R006_ueqv_R006_partial_05_0311 := by
  native_decide

/-- Coefficient term 312 from coefficient polynomial 5. -/
def rs_R006_ueqv_R006_coefficient_05_0312 : Poly :=
[
  term ((-10368 : Rat) / 5) [(9, 1), (11, 1), (13, 2), (14, 1)]
]

/-- Partial product 312 for generator 5. -/
def rs_R006_ueqv_R006_partial_05_0312 : Poly :=
[
  term ((20736 : Rat) / 5) [(4, 1), (9, 1), (11, 1), (13, 2), (14, 1)],
  term ((-10368 : Rat) / 5) [(4, 2), (9, 1), (11, 1), (13, 2), (14, 1)],
  term ((-10368 : Rat) / 5) [(5, 2), (9, 1), (11, 1), (13, 2), (14, 1)],
  term ((10368 : Rat) / 5) [(9, 1), (11, 1), (13, 2), (14, 1), (15, 2)],
  term ((-20736 : Rat) / 5) [(9, 1), (11, 1), (13, 2), (14, 2)],
  term ((10368 : Rat) / 5) [(9, 1), (11, 1), (13, 2), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 312 for generator 5. -/
theorem rs_R006_ueqv_R006_partial_05_0312_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_05_0312
        rs_R006_ueqv_R006_generator_05_0300_0366 =
      rs_R006_ueqv_R006_partial_05_0312 := by
  native_decide

/-- Coefficient term 313 from coefficient polynomial 5. -/
def rs_R006_ueqv_R006_coefficient_05_0313 : Poly :=
[
  term ((3456 : Rat) / 5) [(9, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 313 for generator 5. -/
def rs_R006_ueqv_R006_partial_05_0313 : Poly :=
[
  term ((-6912 : Rat) / 5) [(4, 1), (9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((3456 : Rat) / 5) [(4, 2), (9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((3456 : Rat) / 5) [(5, 2), (9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-3456 : Rat) / 5) [(9, 1), (11, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((6912 : Rat) / 5) [(9, 1), (11, 1), (13, 2), (14, 2), (16, 1)],
  term ((-3456 : Rat) / 5) [(9, 1), (11, 1), (13, 2), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 313 for generator 5. -/
theorem rs_R006_ueqv_R006_partial_05_0313_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_05_0313
        rs_R006_ueqv_R006_generator_05_0300_0366 =
      rs_R006_ueqv_R006_partial_05_0313 := by
  native_decide

/-- Coefficient term 314 from coefficient polynomial 5. -/
def rs_R006_ueqv_R006_coefficient_05_0314 : Poly :=
[
  term ((-1728 : Rat) / 5) [(9, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 314 for generator 5. -/
def rs_R006_ueqv_R006_partial_05_0314 : Poly :=
[
  term ((3456 : Rat) / 5) [(4, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-1728 : Rat) / 5) [(4, 2), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-1728 : Rat) / 5) [(5, 2), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-3456 : Rat) / 5) [(9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((1728 : Rat) / 5) [(9, 1), (11, 1), (13, 2), (14, 2), (16, 1)],
  term ((1728 : Rat) / 5) [(9, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 314 for generator 5. -/
theorem rs_R006_ueqv_R006_partial_05_0314_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_05_0314
        rs_R006_ueqv_R006_generator_05_0300_0366 =
      rs_R006_ueqv_R006_partial_05_0314 := by
  native_decide

/-- Coefficient term 315 from coefficient polynomial 5. -/
def rs_R006_ueqv_R006_coefficient_05_0315 : Poly :=
[
  term ((432 : Rat) / 5) [(9, 1), (11, 1), (14, 1)]
]

/-- Partial product 315 for generator 5. -/
def rs_R006_ueqv_R006_partial_05_0315 : Poly :=
[
  term ((-864 : Rat) / 5) [(4, 1), (9, 1), (11, 1), (14, 1)],
  term ((432 : Rat) / 5) [(4, 2), (9, 1), (11, 1), (14, 1)],
  term ((432 : Rat) / 5) [(5, 2), (9, 1), (11, 1), (14, 1)],
  term ((-432 : Rat) / 5) [(9, 1), (11, 1), (14, 1), (15, 2)],
  term ((864 : Rat) / 5) [(9, 1), (11, 1), (14, 2)],
  term ((-432 : Rat) / 5) [(9, 1), (11, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 315 for generator 5. -/
theorem rs_R006_ueqv_R006_partial_05_0315_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_05_0315
        rs_R006_ueqv_R006_generator_05_0300_0366 =
      rs_R006_ueqv_R006_partial_05_0315 := by
  native_decide

/-- Coefficient term 316 from coefficient polynomial 5. -/
def rs_R006_ueqv_R006_coefficient_05_0316 : Poly :=
[
  term ((-22152 : Rat) / 35) [(9, 1), (11, 2), (13, 1)]
]

/-- Partial product 316 for generator 5. -/
def rs_R006_ueqv_R006_partial_05_0316 : Poly :=
[
  term ((44304 : Rat) / 35) [(4, 1), (9, 1), (11, 2), (13, 1)],
  term ((-22152 : Rat) / 35) [(4, 2), (9, 1), (11, 2), (13, 1)],
  term ((-22152 : Rat) / 35) [(5, 2), (9, 1), (11, 2), (13, 1)],
  term ((-44304 : Rat) / 35) [(9, 1), (11, 2), (13, 1), (14, 1)],
  term ((22152 : Rat) / 35) [(9, 1), (11, 2), (13, 1), (14, 2)],
  term ((22152 : Rat) / 35) [(9, 1), (11, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 316 for generator 5. -/
theorem rs_R006_ueqv_R006_partial_05_0316_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_05_0316
        rs_R006_ueqv_R006_generator_05_0300_0366 =
      rs_R006_ueqv_R006_partial_05_0316 := by
  native_decide

/-- Coefficient term 317 from coefficient polynomial 5. -/
def rs_R006_ueqv_R006_coefficient_05_0317 : Poly :=
[
  term ((6624 : Rat) / 5) [(9, 1), (11, 2), (13, 1), (14, 1)]
]

/-- Partial product 317 for generator 5. -/
def rs_R006_ueqv_R006_partial_05_0317 : Poly :=
[
  term ((-13248 : Rat) / 5) [(4, 1), (9, 1), (11, 2), (13, 1), (14, 1)],
  term ((6624 : Rat) / 5) [(4, 2), (9, 1), (11, 2), (13, 1), (14, 1)],
  term ((6624 : Rat) / 5) [(5, 2), (9, 1), (11, 2), (13, 1), (14, 1)],
  term ((-6624 : Rat) / 5) [(9, 1), (11, 2), (13, 1), (14, 1), (15, 2)],
  term ((13248 : Rat) / 5) [(9, 1), (11, 2), (13, 1), (14, 2)],
  term ((-6624 : Rat) / 5) [(9, 1), (11, 2), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 317 for generator 5. -/
theorem rs_R006_ueqv_R006_partial_05_0317_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_05_0317
        rs_R006_ueqv_R006_generator_05_0300_0366 =
      rs_R006_ueqv_R006_partial_05_0317 := by
  native_decide

/-- Coefficient term 318 from coefficient polynomial 5. -/
def rs_R006_ueqv_R006_coefficient_05_0318 : Poly :=
[
  term ((-2208 : Rat) / 5) [(9, 1), (11, 2), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 318 for generator 5. -/
def rs_R006_ueqv_R006_partial_05_0318 : Poly :=
[
  term ((4416 : Rat) / 5) [(4, 1), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-2208 : Rat) / 5) [(4, 2), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-2208 : Rat) / 5) [(5, 2), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((2208 : Rat) / 5) [(9, 1), (11, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4416 : Rat) / 5) [(9, 1), (11, 2), (13, 1), (14, 2), (16, 1)],
  term ((2208 : Rat) / 5) [(9, 1), (11, 2), (13, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 318 for generator 5. -/
theorem rs_R006_ueqv_R006_partial_05_0318_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_05_0318
        rs_R006_ueqv_R006_generator_05_0300_0366 =
      rs_R006_ueqv_R006_partial_05_0318 := by
  native_decide

/-- Coefficient term 319 from coefficient polynomial 5. -/
def rs_R006_ueqv_R006_coefficient_05_0319 : Poly :=
[
  term ((1104 : Rat) / 5) [(9, 1), (11, 2), (13, 1), (16, 1)]
]

/-- Partial product 319 for generator 5. -/
def rs_R006_ueqv_R006_partial_05_0319 : Poly :=
[
  term ((-2208 : Rat) / 5) [(4, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((1104 : Rat) / 5) [(4, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((1104 : Rat) / 5) [(5, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((2208 : Rat) / 5) [(9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-1104 : Rat) / 5) [(9, 1), (11, 2), (13, 1), (14, 2), (16, 1)],
  term ((-1104 : Rat) / 5) [(9, 1), (11, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 319 for generator 5. -/
theorem rs_R006_ueqv_R006_partial_05_0319_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_05_0319
        rs_R006_ueqv_R006_generator_05_0300_0366 =
      rs_R006_ueqv_R006_partial_05_0319 := by
  native_decide

/-- Coefficient term 320 from coefficient polynomial 5. -/
def rs_R006_ueqv_R006_coefficient_05_0320 : Poly :=
[
  term ((-6624 : Rat) / 5) [(9, 1), (11, 2), (15, 1)]
]

/-- Partial product 320 for generator 5. -/
def rs_R006_ueqv_R006_partial_05_0320 : Poly :=
[
  term ((13248 : Rat) / 5) [(4, 1), (9, 1), (11, 2), (15, 1)],
  term ((-6624 : Rat) / 5) [(4, 2), (9, 1), (11, 2), (15, 1)],
  term ((-6624 : Rat) / 5) [(5, 2), (9, 1), (11, 2), (15, 1)],
  term ((-13248 : Rat) / 5) [(9, 1), (11, 2), (14, 1), (15, 1)],
  term ((6624 : Rat) / 5) [(9, 1), (11, 2), (14, 2), (15, 1)],
  term ((6624 : Rat) / 5) [(9, 1), (11, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 320 for generator 5. -/
theorem rs_R006_ueqv_R006_partial_05_0320_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_05_0320
        rs_R006_ueqv_R006_generator_05_0300_0366 =
      rs_R006_ueqv_R006_partial_05_0320 := by
  native_decide

/-- Coefficient term 321 from coefficient polynomial 5. -/
def rs_R006_ueqv_R006_coefficient_05_0321 : Poly :=
[
  term ((2208 : Rat) / 5) [(9, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 321 for generator 5. -/
def rs_R006_ueqv_R006_partial_05_0321 : Poly :=
[
  term ((-4416 : Rat) / 5) [(4, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((2208 : Rat) / 5) [(4, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((2208 : Rat) / 5) [(5, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((4416 : Rat) / 5) [(9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-2208 : Rat) / 5) [(9, 1), (11, 2), (14, 2), (15, 1), (16, 1)],
  term ((-2208 : Rat) / 5) [(9, 1), (11, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 321 for generator 5. -/
theorem rs_R006_ueqv_R006_partial_05_0321_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_05_0321
        rs_R006_ueqv_R006_generator_05_0300_0366 =
      rs_R006_ueqv_R006_partial_05_0321 := by
  native_decide

/-- Coefficient term 322 from coefficient polynomial 5. -/
def rs_R006_ueqv_R006_coefficient_05_0322 : Poly :=
[
  term ((888 : Rat) / 35) [(9, 1), (12, 1), (13, 1)]
]

/-- Partial product 322 for generator 5. -/
def rs_R006_ueqv_R006_partial_05_0322 : Poly :=
[
  term ((-1776 : Rat) / 35) [(4, 1), (9, 1), (12, 1), (13, 1)],
  term ((888 : Rat) / 35) [(4, 2), (9, 1), (12, 1), (13, 1)],
  term ((888 : Rat) / 35) [(5, 2), (9, 1), (12, 1), (13, 1)],
  term ((1776 : Rat) / 35) [(9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-888 : Rat) / 35) [(9, 1), (12, 1), (13, 1), (14, 2)],
  term ((-888 : Rat) / 35) [(9, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 322 for generator 5. -/
theorem rs_R006_ueqv_R006_partial_05_0322_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_05_0322
        rs_R006_ueqv_R006_generator_05_0300_0366 =
      rs_R006_ueqv_R006_partial_05_0322 := by
  native_decide

/-- Coefficient term 323 from coefficient polynomial 5. -/
def rs_R006_ueqv_R006_coefficient_05_0323 : Poly :=
[
  term ((-288 : Rat) / 5) [(9, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 323 for generator 5. -/
def rs_R006_ueqv_R006_partial_05_0323 : Poly :=
[
  term ((576 : Rat) / 5) [(4, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-288 : Rat) / 5) [(4, 2), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-288 : Rat) / 5) [(5, 2), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((288 : Rat) / 5) [(9, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-576 : Rat) / 5) [(9, 1), (12, 1), (13, 1), (14, 2)],
  term ((288 : Rat) / 5) [(9, 1), (12, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 323 for generator 5. -/
theorem rs_R006_ueqv_R006_partial_05_0323_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_05_0323
        rs_R006_ueqv_R006_generator_05_0300_0366 =
      rs_R006_ueqv_R006_partial_05_0323 := by
  native_decide

/-- Coefficient term 324 from coefficient polynomial 5. -/
def rs_R006_ueqv_R006_coefficient_05_0324 : Poly :=
[
  term ((96 : Rat) / 5) [(9, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 324 for generator 5. -/
def rs_R006_ueqv_R006_partial_05_0324 : Poly :=
[
  term ((-192 : Rat) / 5) [(4, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((96 : Rat) / 5) [(4, 2), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((96 : Rat) / 5) [(5, 2), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-96 : Rat) / 5) [(9, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((192 : Rat) / 5) [(9, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-96 : Rat) / 5) [(9, 1), (12, 1), (13, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 324 for generator 5. -/
theorem rs_R006_ueqv_R006_partial_05_0324_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_05_0324
        rs_R006_ueqv_R006_generator_05_0300_0366 =
      rs_R006_ueqv_R006_partial_05_0324 := by
  native_decide

/-- Coefficient term 325 from coefficient polynomial 5. -/
def rs_R006_ueqv_R006_coefficient_05_0325 : Poly :=
[
  term ((-48 : Rat) / 5) [(9, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 325 for generator 5. -/
def rs_R006_ueqv_R006_partial_05_0325 : Poly :=
[
  term ((96 : Rat) / 5) [(4, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-48 : Rat) / 5) [(4, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-48 : Rat) / 5) [(5, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-96 : Rat) / 5) [(9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((48 : Rat) / 5) [(9, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((48 : Rat) / 5) [(9, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 325 for generator 5. -/
theorem rs_R006_ueqv_R006_partial_05_0325_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_05_0325
        rs_R006_ueqv_R006_generator_05_0300_0366 =
      rs_R006_ueqv_R006_partial_05_0325 := by
  native_decide

/-- Coefficient term 326 from coefficient polynomial 5. -/
def rs_R006_ueqv_R006_coefficient_05_0326 : Poly :=
[
  term ((288 : Rat) / 5) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 326 for generator 5. -/
def rs_R006_ueqv_R006_partial_05_0326 : Poly :=
[
  term ((-576 : Rat) / 5) [(4, 1), (9, 1), (12, 1), (15, 1)],
  term ((288 : Rat) / 5) [(4, 2), (9, 1), (12, 1), (15, 1)],
  term ((288 : Rat) / 5) [(5, 2), (9, 1), (12, 1), (15, 1)],
  term ((576 : Rat) / 5) [(9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-288 : Rat) / 5) [(9, 1), (12, 1), (14, 2), (15, 1)],
  term ((-288 : Rat) / 5) [(9, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 326 for generator 5. -/
theorem rs_R006_ueqv_R006_partial_05_0326_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_05_0326
        rs_R006_ueqv_R006_generator_05_0300_0366 =
      rs_R006_ueqv_R006_partial_05_0326 := by
  native_decide

/-- Coefficient term 327 from coefficient polynomial 5. -/
def rs_R006_ueqv_R006_coefficient_05_0327 : Poly :=
[
  term ((-96 : Rat) / 5) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 327 for generator 5. -/
def rs_R006_ueqv_R006_partial_05_0327 : Poly :=
[
  term ((192 : Rat) / 5) [(4, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-96 : Rat) / 5) [(4, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-96 : Rat) / 5) [(5, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-192 : Rat) / 5) [(9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((96 : Rat) / 5) [(9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((96 : Rat) / 5) [(9, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 327 for generator 5. -/
theorem rs_R006_ueqv_R006_partial_05_0327_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_05_0327
        rs_R006_ueqv_R006_generator_05_0300_0366 =
      rs_R006_ueqv_R006_partial_05_0327 := by
  native_decide

/-- Coefficient term 328 from coefficient polynomial 5. -/
def rs_R006_ueqv_R006_coefficient_05_0328 : Poly :=
[
  term ((-594 : Rat) / 7) [(9, 1), (13, 1)]
]

/-- Partial product 328 for generator 5. -/
def rs_R006_ueqv_R006_partial_05_0328 : Poly :=
[
  term ((1188 : Rat) / 7) [(4, 1), (9, 1), (13, 1)],
  term ((-594 : Rat) / 7) [(4, 2), (9, 1), (13, 1)],
  term ((-594 : Rat) / 7) [(5, 2), (9, 1), (13, 1)],
  term ((-1188 : Rat) / 7) [(9, 1), (13, 1), (14, 1)],
  term ((594 : Rat) / 7) [(9, 1), (13, 1), (14, 2)],
  term ((594 : Rat) / 7) [(9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 328 for generator 5. -/
theorem rs_R006_ueqv_R006_partial_05_0328_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_05_0328
        rs_R006_ueqv_R006_generator_05_0300_0366 =
      rs_R006_ueqv_R006_partial_05_0328 := by
  native_decide

/-- Coefficient term 329 from coefficient polynomial 5. -/
def rs_R006_ueqv_R006_coefficient_05_0329 : Poly :=
[
  term ((864 : Rat) / 5) [(9, 1), (13, 1), (14, 1)]
]

/-- Partial product 329 for generator 5. -/
def rs_R006_ueqv_R006_partial_05_0329 : Poly :=
[
  term ((-1728 : Rat) / 5) [(4, 1), (9, 1), (13, 1), (14, 1)],
  term ((864 : Rat) / 5) [(4, 2), (9, 1), (13, 1), (14, 1)],
  term ((864 : Rat) / 5) [(5, 2), (9, 1), (13, 1), (14, 1)],
  term ((-864 : Rat) / 5) [(9, 1), (13, 1), (14, 1), (15, 2)],
  term ((1728 : Rat) / 5) [(9, 1), (13, 1), (14, 2)],
  term ((-864 : Rat) / 5) [(9, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 329 for generator 5. -/
theorem rs_R006_ueqv_R006_partial_05_0329_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_05_0329
        rs_R006_ueqv_R006_generator_05_0300_0366 =
      rs_R006_ueqv_R006_partial_05_0329 := by
  native_decide

/-- Coefficient term 330 from coefficient polynomial 5. -/
def rs_R006_ueqv_R006_coefficient_05_0330 : Poly :=
[
  term ((-288 : Rat) / 5) [(9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 330 for generator 5. -/
def rs_R006_ueqv_R006_partial_05_0330 : Poly :=
[
  term ((576 : Rat) / 5) [(4, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(4, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(5, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((288 : Rat) / 5) [(9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-576 : Rat) / 5) [(9, 1), (13, 1), (14, 2), (16, 1)],
  term ((288 : Rat) / 5) [(9, 1), (13, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 330 for generator 5. -/
theorem rs_R006_ueqv_R006_partial_05_0330_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_05_0330
        rs_R006_ueqv_R006_generator_05_0300_0366 =
      rs_R006_ueqv_R006_partial_05_0330 := by
  native_decide

/-- Coefficient term 331 from coefficient polynomial 5. -/
def rs_R006_ueqv_R006_coefficient_05_0331 : Poly :=
[
  term ((144 : Rat) / 5) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 331 for generator 5. -/
def rs_R006_ueqv_R006_partial_05_0331 : Poly :=
[
  term ((-288 : Rat) / 5) [(4, 1), (9, 1), (13, 1), (16, 1)],
  term ((144 : Rat) / 5) [(4, 2), (9, 1), (13, 1), (16, 1)],
  term ((144 : Rat) / 5) [(5, 2), (9, 1), (13, 1), (16, 1)],
  term ((288 : Rat) / 5) [(9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-144 : Rat) / 5) [(9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-144 : Rat) / 5) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 331 for generator 5. -/
theorem rs_R006_ueqv_R006_partial_05_0331_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_05_0331
        rs_R006_ueqv_R006_generator_05_0300_0366 =
      rs_R006_ueqv_R006_partial_05_0331 := by
  native_decide

/-- Coefficient term 332 from coefficient polynomial 5. -/
def rs_R006_ueqv_R006_coefficient_05_0332 : Poly :=
[
  term ((-864 : Rat) / 5) [(9, 1), (15, 1)]
]

/-- Partial product 332 for generator 5. -/
def rs_R006_ueqv_R006_partial_05_0332 : Poly :=
[
  term ((1728 : Rat) / 5) [(4, 1), (9, 1), (15, 1)],
  term ((-864 : Rat) / 5) [(4, 2), (9, 1), (15, 1)],
  term ((-864 : Rat) / 5) [(5, 2), (9, 1), (15, 1)],
  term ((-1728 : Rat) / 5) [(9, 1), (14, 1), (15, 1)],
  term ((864 : Rat) / 5) [(9, 1), (14, 2), (15, 1)],
  term ((864 : Rat) / 5) [(9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 332 for generator 5. -/
theorem rs_R006_ueqv_R006_partial_05_0332_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_05_0332
        rs_R006_ueqv_R006_generator_05_0300_0366 =
      rs_R006_ueqv_R006_partial_05_0332 := by
  native_decide

/-- Coefficient term 333 from coefficient polynomial 5. -/
def rs_R006_ueqv_R006_coefficient_05_0333 : Poly :=
[
  term ((288 : Rat) / 5) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 333 for generator 5. -/
def rs_R006_ueqv_R006_partial_05_0333 : Poly :=
[
  term ((-576 : Rat) / 5) [(4, 1), (9, 1), (15, 1), (16, 1)],
  term ((288 : Rat) / 5) [(4, 2), (9, 1), (15, 1), (16, 1)],
  term ((288 : Rat) / 5) [(5, 2), (9, 1), (15, 1), (16, 1)],
  term ((576 : Rat) / 5) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 333 for generator 5. -/
theorem rs_R006_ueqv_R006_partial_05_0333_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_05_0333
        rs_R006_ueqv_R006_generator_05_0300_0366 =
      rs_R006_ueqv_R006_partial_05_0333 := by
  native_decide

/-- Coefficient term 334 from coefficient polynomial 5. -/
def rs_R006_ueqv_R006_coefficient_05_0334 : Poly :=
[
  term ((1152 : Rat) / 7) [(9, 2), (11, 1), (13, 1)]
]

/-- Partial product 334 for generator 5. -/
def rs_R006_ueqv_R006_partial_05_0334 : Poly :=
[
  term ((-2304 : Rat) / 7) [(4, 1), (9, 2), (11, 1), (13, 1)],
  term ((1152 : Rat) / 7) [(4, 2), (9, 2), (11, 1), (13, 1)],
  term ((1152 : Rat) / 7) [(5, 2), (9, 2), (11, 1), (13, 1)],
  term ((2304 : Rat) / 7) [(9, 2), (11, 1), (13, 1), (14, 1)],
  term ((-1152 : Rat) / 7) [(9, 2), (11, 1), (13, 1), (14, 2)],
  term ((-1152 : Rat) / 7) [(9, 2), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 334 for generator 5. -/
theorem rs_R006_ueqv_R006_partial_05_0334_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_05_0334
        rs_R006_ueqv_R006_generator_05_0300_0366 =
      rs_R006_ueqv_R006_partial_05_0334 := by
  native_decide

/-- Coefficient term 335 from coefficient polynomial 5. -/
def rs_R006_ueqv_R006_coefficient_05_0335 : Poly :=
[
  term ((-1728 : Rat) / 5) [(9, 2), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 335 for generator 5. -/
def rs_R006_ueqv_R006_partial_05_0335 : Poly :=
[
  term ((3456 : Rat) / 5) [(4, 1), (9, 2), (11, 1), (13, 1), (14, 1)],
  term ((-1728 : Rat) / 5) [(4, 2), (9, 2), (11, 1), (13, 1), (14, 1)],
  term ((-1728 : Rat) / 5) [(5, 2), (9, 2), (11, 1), (13, 1), (14, 1)],
  term ((1728 : Rat) / 5) [(9, 2), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-3456 : Rat) / 5) [(9, 2), (11, 1), (13, 1), (14, 2)],
  term ((1728 : Rat) / 5) [(9, 2), (11, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 335 for generator 5. -/
theorem rs_R006_ueqv_R006_partial_05_0335_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_05_0335
        rs_R006_ueqv_R006_generator_05_0300_0366 =
      rs_R006_ueqv_R006_partial_05_0335 := by
  native_decide

/-- Coefficient term 336 from coefficient polynomial 5. -/
def rs_R006_ueqv_R006_coefficient_05_0336 : Poly :=
[
  term ((576 : Rat) / 5) [(9, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 336 for generator 5. -/
def rs_R006_ueqv_R006_partial_05_0336 : Poly :=
[
  term ((-1152 : Rat) / 5) [(4, 1), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((576 : Rat) / 5) [(4, 2), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((576 : Rat) / 5) [(5, 2), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-576 : Rat) / 5) [(9, 2), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1152 : Rat) / 5) [(9, 2), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-576 : Rat) / 5) [(9, 2), (11, 1), (13, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 336 for generator 5. -/
theorem rs_R006_ueqv_R006_partial_05_0336_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_05_0336
        rs_R006_ueqv_R006_generator_05_0300_0366 =
      rs_R006_ueqv_R006_partial_05_0336 := by
  native_decide

/-- Coefficient term 337 from coefficient polynomial 5. -/
def rs_R006_ueqv_R006_coefficient_05_0337 : Poly :=
[
  term ((-288 : Rat) / 5) [(9, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 337 for generator 5. -/
def rs_R006_ueqv_R006_partial_05_0337 : Poly :=
[
  term ((576 : Rat) / 5) [(4, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(4, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(5, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-576 : Rat) / 5) [(9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((288 : Rat) / 5) [(9, 2), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((288 : Rat) / 5) [(9, 2), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 337 for generator 5. -/
theorem rs_R006_ueqv_R006_partial_05_0337_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_05_0337
        rs_R006_ueqv_R006_generator_05_0300_0366 =
      rs_R006_ueqv_R006_partial_05_0337 := by
  native_decide

/-- Coefficient term 338 from coefficient polynomial 5. -/
def rs_R006_ueqv_R006_coefficient_05_0338 : Poly :=
[
  term ((1728 : Rat) / 5) [(9, 2), (11, 1), (15, 1)]
]

/-- Partial product 338 for generator 5. -/
def rs_R006_ueqv_R006_partial_05_0338 : Poly :=
[
  term ((-3456 : Rat) / 5) [(4, 1), (9, 2), (11, 1), (15, 1)],
  term ((1728 : Rat) / 5) [(4, 2), (9, 2), (11, 1), (15, 1)],
  term ((1728 : Rat) / 5) [(5, 2), (9, 2), (11, 1), (15, 1)],
  term ((3456 : Rat) / 5) [(9, 2), (11, 1), (14, 1), (15, 1)],
  term ((-1728 : Rat) / 5) [(9, 2), (11, 1), (14, 2), (15, 1)],
  term ((-1728 : Rat) / 5) [(9, 2), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 338 for generator 5. -/
theorem rs_R006_ueqv_R006_partial_05_0338_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_05_0338
        rs_R006_ueqv_R006_generator_05_0300_0366 =
      rs_R006_ueqv_R006_partial_05_0338 := by
  native_decide

/-- Coefficient term 339 from coefficient polynomial 5. -/
def rs_R006_ueqv_R006_coefficient_05_0339 : Poly :=
[
  term ((-576 : Rat) / 5) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 339 for generator 5. -/
def rs_R006_ueqv_R006_partial_05_0339 : Poly :=
[
  term ((1152 : Rat) / 5) [(4, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-576 : Rat) / 5) [(4, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-576 : Rat) / 5) [(5, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1152 : Rat) / 5) [(9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((576 : Rat) / 5) [(9, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((576 : Rat) / 5) [(9, 2), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 339 for generator 5. -/
theorem rs_R006_ueqv_R006_partial_05_0339_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_05_0339
        rs_R006_ueqv_R006_generator_05_0300_0366 =
      rs_R006_ueqv_R006_partial_05_0339 := by
  native_decide

/-- Coefficient term 340 from coefficient polynomial 5. -/
def rs_R006_ueqv_R006_coefficient_05_0340 : Poly :=
[
  term ((-2988 : Rat) / 35) [(11, 1), (12, 1), (13, 1)]
]

/-- Partial product 340 for generator 5. -/
def rs_R006_ueqv_R006_partial_05_0340 : Poly :=
[
  term ((5976 : Rat) / 35) [(4, 1), (11, 1), (12, 1), (13, 1)],
  term ((-2988 : Rat) / 35) [(4, 2), (11, 1), (12, 1), (13, 1)],
  term ((-2988 : Rat) / 35) [(5, 2), (11, 1), (12, 1), (13, 1)],
  term ((-5976 : Rat) / 35) [(11, 1), (12, 1), (13, 1), (14, 1)],
  term ((2988 : Rat) / 35) [(11, 1), (12, 1), (13, 1), (14, 2)],
  term ((2988 : Rat) / 35) [(11, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 340 for generator 5. -/
theorem rs_R006_ueqv_R006_partial_05_0340_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_05_0340
        rs_R006_ueqv_R006_generator_05_0300_0366 =
      rs_R006_ueqv_R006_partial_05_0340 := by
  native_decide

/-- Coefficient term 341 from coefficient polynomial 5. -/
def rs_R006_ueqv_R006_coefficient_05_0341 : Poly :=
[
  term ((864 : Rat) / 5) [(11, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 341 for generator 5. -/
def rs_R006_ueqv_R006_partial_05_0341 : Poly :=
[
  term ((-1728 : Rat) / 5) [(4, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((864 : Rat) / 5) [(4, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((864 : Rat) / 5) [(5, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-864 : Rat) / 5) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((1728 : Rat) / 5) [(11, 1), (12, 1), (13, 1), (14, 2)],
  term ((-864 : Rat) / 5) [(11, 1), (12, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 341 for generator 5. -/
theorem rs_R006_ueqv_R006_partial_05_0341_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_05_0341
        rs_R006_ueqv_R006_generator_05_0300_0366 =
      rs_R006_ueqv_R006_partial_05_0341 := by
  native_decide

/-- Coefficient term 342 from coefficient polynomial 5. -/
def rs_R006_ueqv_R006_coefficient_05_0342 : Poly :=
[
  term ((-288 : Rat) / 5) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 342 for generator 5. -/
def rs_R006_ueqv_R006_partial_05_0342 : Poly :=
[
  term ((576 : Rat) / 5) [(4, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(4, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(5, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((288 : Rat) / 5) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-576 : Rat) / 5) [(11, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((288 : Rat) / 5) [(11, 1), (12, 1), (13, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 342 for generator 5. -/
theorem rs_R006_ueqv_R006_partial_05_0342_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_05_0342
        rs_R006_ueqv_R006_generator_05_0300_0366 =
      rs_R006_ueqv_R006_partial_05_0342 := by
  native_decide

/-- Coefficient term 343 from coefficient polynomial 5. -/
def rs_R006_ueqv_R006_coefficient_05_0343 : Poly :=
[
  term ((144 : Rat) / 5) [(11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 343 for generator 5. -/
def rs_R006_ueqv_R006_partial_05_0343 : Poly :=
[
  term ((-288 : Rat) / 5) [(4, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((144 : Rat) / 5) [(4, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((144 : Rat) / 5) [(5, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((288 : Rat) / 5) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-144 : Rat) / 5) [(11, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-144 : Rat) / 5) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 343 for generator 5. -/
theorem rs_R006_ueqv_R006_partial_05_0343_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_05_0343
        rs_R006_ueqv_R006_generator_05_0300_0366 =
      rs_R006_ueqv_R006_partial_05_0343 := by
  native_decide

/-- Coefficient term 344 from coefficient polynomial 5. -/
def rs_R006_ueqv_R006_coefficient_05_0344 : Poly :=
[
  term ((-4062 : Rat) / 25) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 344 for generator 5. -/
def rs_R006_ueqv_R006_partial_05_0344 : Poly :=
[
  term ((8124 : Rat) / 25) [(4, 1), (11, 1), (12, 1), (15, 1)],
  term ((-4062 : Rat) / 25) [(4, 2), (11, 1), (12, 1), (15, 1)],
  term ((-4062 : Rat) / 25) [(5, 2), (11, 1), (12, 1), (15, 1)],
  term ((-8124 : Rat) / 25) [(11, 1), (12, 1), (14, 1), (15, 1)],
  term ((4062 : Rat) / 25) [(11, 1), (12, 1), (14, 2), (15, 1)],
  term ((4062 : Rat) / 25) [(11, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 344 for generator 5. -/
theorem rs_R006_ueqv_R006_partial_05_0344_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_05_0344
        rs_R006_ueqv_R006_generator_05_0300_0366 =
      rs_R006_ueqv_R006_partial_05_0344 := by
  native_decide

/-- Coefficient term 345 from coefficient polynomial 5. -/
def rs_R006_ueqv_R006_coefficient_05_0345 : Poly :=
[
  term ((1284 : Rat) / 25) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 345 for generator 5. -/
def rs_R006_ueqv_R006_partial_05_0345 : Poly :=
[
  term ((-2568 : Rat) / 25) [(4, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1284 : Rat) / 25) [(4, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1284 : Rat) / 25) [(5, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((2568 : Rat) / 25) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1284 : Rat) / 25) [(11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1284 : Rat) / 25) [(11, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 345 for generator 5. -/
theorem rs_R006_ueqv_R006_partial_05_0345_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_05_0345
        rs_R006_ueqv_R006_generator_05_0300_0366 =
      rs_R006_ueqv_R006_partial_05_0345 := by
  native_decide

/-- Coefficient term 346 from coefficient polynomial 5. -/
def rs_R006_ueqv_R006_coefficient_05_0346 : Poly :=
[
  term ((-8538 : Rat) / 35) [(11, 1), (13, 1)]
]

/-- Partial product 346 for generator 5. -/
def rs_R006_ueqv_R006_partial_05_0346 : Poly :=
[
  term ((17076 : Rat) / 35) [(4, 1), (11, 1), (13, 1)],
  term ((-8538 : Rat) / 35) [(4, 2), (11, 1), (13, 1)],
  term ((-8538 : Rat) / 35) [(5, 2), (11, 1), (13, 1)],
  term ((-17076 : Rat) / 35) [(11, 1), (13, 1), (14, 1)],
  term ((8538 : Rat) / 35) [(11, 1), (13, 1), (14, 2)],
  term ((8538 : Rat) / 35) [(11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 346 for generator 5. -/
theorem rs_R006_ueqv_R006_partial_05_0346_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_05_0346
        rs_R006_ueqv_R006_generator_05_0300_0366 =
      rs_R006_ueqv_R006_partial_05_0346 := by
  native_decide

/-- Coefficient term 347 from coefficient polynomial 5. -/
def rs_R006_ueqv_R006_coefficient_05_0347 : Poly :=
[
  term ((1152 : Rat) / 5) [(11, 1), (13, 1), (14, 1)]
]

/-- Partial product 347 for generator 5. -/
def rs_R006_ueqv_R006_partial_05_0347 : Poly :=
[
  term ((-2304 : Rat) / 5) [(4, 1), (11, 1), (13, 1), (14, 1)],
  term ((1152 : Rat) / 5) [(4, 2), (11, 1), (13, 1), (14, 1)],
  term ((1152 : Rat) / 5) [(5, 2), (11, 1), (13, 1), (14, 1)],
  term ((-1152 : Rat) / 5) [(11, 1), (13, 1), (14, 1), (15, 2)],
  term ((2304 : Rat) / 5) [(11, 1), (13, 1), (14, 2)],
  term ((-1152 : Rat) / 5) [(11, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 347 for generator 5. -/
theorem rs_R006_ueqv_R006_partial_05_0347_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_05_0347
        rs_R006_ueqv_R006_generator_05_0300_0366 =
      rs_R006_ueqv_R006_partial_05_0347 := by
  native_decide

/-- Coefficient term 348 from coefficient polynomial 5. -/
def rs_R006_ueqv_R006_coefficient_05_0348 : Poly :=
[
  term ((-48 : Rat) / 5) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 348 for generator 5. -/
def rs_R006_ueqv_R006_partial_05_0348 : Poly :=
[
  term ((96 : Rat) / 5) [(4, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-48 : Rat) / 5) [(4, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-48 : Rat) / 5) [(5, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((48 : Rat) / 5) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-96 : Rat) / 5) [(11, 1), (13, 1), (14, 2), (16, 1)],
  term ((48 : Rat) / 5) [(11, 1), (13, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 348 for generator 5. -/
theorem rs_R006_ueqv_R006_partial_05_0348_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_05_0348
        rs_R006_ueqv_R006_generator_05_0300_0366 =
      rs_R006_ueqv_R006_partial_05_0348 := by
  native_decide

/-- Coefficient term 349 from coefficient polynomial 5. -/
def rs_R006_ueqv_R006_coefficient_05_0349 : Poly :=
[
  term ((36 : Rat) / 5) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 349 for generator 5. -/
def rs_R006_ueqv_R006_partial_05_0349 : Poly :=
[
  term ((-72 : Rat) / 5) [(4, 1), (11, 1), (13, 1), (16, 1)],
  term ((36 : Rat) / 5) [(4, 2), (11, 1), (13, 1), (16, 1)],
  term ((36 : Rat) / 5) [(5, 2), (11, 1), (13, 1), (16, 1)],
  term ((72 : Rat) / 5) [(11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-36 : Rat) / 5) [(11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-36 : Rat) / 5) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 349 for generator 5. -/
theorem rs_R006_ueqv_R006_partial_05_0349_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_05_0349
        rs_R006_ueqv_R006_generator_05_0300_0366 =
      rs_R006_ueqv_R006_partial_05_0349 := by
  native_decide

/-- Coefficient term 350 from coefficient polynomial 5. -/
def rs_R006_ueqv_R006_coefficient_05_0350 : Poly :=
[
  term ((-711 : Rat) / 25) [(11, 1), (15, 1)]
]

/-- Partial product 350 for generator 5. -/
def rs_R006_ueqv_R006_partial_05_0350 : Poly :=
[
  term ((1422 : Rat) / 25) [(4, 1), (11, 1), (15, 1)],
  term ((-711 : Rat) / 25) [(4, 2), (11, 1), (15, 1)],
  term ((-711 : Rat) / 25) [(5, 2), (11, 1), (15, 1)],
  term ((-1422 : Rat) / 25) [(11, 1), (14, 1), (15, 1)],
  term ((711 : Rat) / 25) [(11, 1), (14, 2), (15, 1)],
  term ((711 : Rat) / 25) [(11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 350 for generator 5. -/
theorem rs_R006_ueqv_R006_partial_05_0350_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_05_0350
        rs_R006_ueqv_R006_generator_05_0300_0366 =
      rs_R006_ueqv_R006_partial_05_0350 := by
  native_decide

/-- Coefficient term 351 from coefficient polynomial 5. -/
def rs_R006_ueqv_R006_coefficient_05_0351 : Poly :=
[
  term ((432 : Rat) / 25) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 351 for generator 5. -/
def rs_R006_ueqv_R006_partial_05_0351 : Poly :=
[
  term ((-864 : Rat) / 25) [(4, 1), (11, 1), (15, 1), (16, 1)],
  term ((432 : Rat) / 25) [(4, 2), (11, 1), (15, 1), (16, 1)],
  term ((432 : Rat) / 25) [(5, 2), (11, 1), (15, 1), (16, 1)],
  term ((864 : Rat) / 25) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-432 : Rat) / 25) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-432 : Rat) / 25) [(11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 351 for generator 5. -/
theorem rs_R006_ueqv_R006_partial_05_0351_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_05_0351
        rs_R006_ueqv_R006_generator_05_0300_0366 =
      rs_R006_ueqv_R006_partial_05_0351 := by
  native_decide

/-- Coefficient term 352 from coefficient polynomial 5. -/
def rs_R006_ueqv_R006_coefficient_05_0352 : Poly :=
[
  term ((954 : Rat) / 5) [(11, 2)]
]

/-- Partial product 352 for generator 5. -/
def rs_R006_ueqv_R006_partial_05_0352 : Poly :=
[
  term ((-1908 : Rat) / 5) [(4, 1), (11, 2)],
  term ((954 : Rat) / 5) [(4, 2), (11, 2)],
  term ((954 : Rat) / 5) [(5, 2), (11, 2)],
  term ((1908 : Rat) / 5) [(11, 2), (14, 1)],
  term ((-954 : Rat) / 5) [(11, 2), (14, 2)],
  term ((-954 : Rat) / 5) [(11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 352 for generator 5. -/
theorem rs_R006_ueqv_R006_partial_05_0352_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_05_0352
        rs_R006_ueqv_R006_generator_05_0300_0366 =
      rs_R006_ueqv_R006_partial_05_0352 := by
  native_decide

/-- Coefficient term 353 from coefficient polynomial 5. -/
def rs_R006_ueqv_R006_coefficient_05_0353 : Poly :=
[
  term ((-726 : Rat) / 5) [(11, 2), (14, 1)]
]

/-- Partial product 353 for generator 5. -/
def rs_R006_ueqv_R006_partial_05_0353 : Poly :=
[
  term ((1452 : Rat) / 5) [(4, 1), (11, 2), (14, 1)],
  term ((-726 : Rat) / 5) [(4, 2), (11, 2), (14, 1)],
  term ((-726 : Rat) / 5) [(5, 2), (11, 2), (14, 1)],
  term ((726 : Rat) / 5) [(11, 2), (14, 1), (15, 2)],
  term ((-1452 : Rat) / 5) [(11, 2), (14, 2)],
  term ((726 : Rat) / 5) [(11, 2), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 353 for generator 5. -/
theorem rs_R006_ueqv_R006_partial_05_0353_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_05_0353
        rs_R006_ueqv_R006_generator_05_0300_0366 =
      rs_R006_ueqv_R006_partial_05_0353 := by
  native_decide

/-- Coefficient term 354 from coefficient polynomial 5. -/
def rs_R006_ueqv_R006_coefficient_05_0354 : Poly :=
[
  term (-2 : Rat) [(11, 2), (16, 1)]
]

/-- Partial product 354 for generator 5. -/
def rs_R006_ueqv_R006_partial_05_0354 : Poly :=
[
  term (4 : Rat) [(4, 1), (11, 2), (16, 1)],
  term (-2 : Rat) [(4, 2), (11, 2), (16, 1)],
  term (-2 : Rat) [(5, 2), (11, 2), (16, 1)],
  term (-4 : Rat) [(11, 2), (14, 1), (16, 1)],
  term (2 : Rat) [(11, 2), (14, 2), (16, 1)],
  term (2 : Rat) [(11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 354 for generator 5. -/
theorem rs_R006_ueqv_R006_partial_05_0354_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_05_0354
        rs_R006_ueqv_R006_generator_05_0300_0366 =
      rs_R006_ueqv_R006_partial_05_0354 := by
  native_decide

/-- Coefficient term 355 from coefficient polynomial 5. -/
def rs_R006_ueqv_R006_coefficient_05_0355 : Poly :=
[
  term (9 : Rat) [(12, 1)]
]

/-- Partial product 355 for generator 5. -/
def rs_R006_ueqv_R006_partial_05_0355 : Poly :=
[
  term (-18 : Rat) [(4, 1), (12, 1)],
  term (9 : Rat) [(4, 2), (12, 1)],
  term (9 : Rat) [(5, 2), (12, 1)],
  term (18 : Rat) [(12, 1), (14, 1)],
  term (-9 : Rat) [(12, 1), (14, 2)],
  term (-9 : Rat) [(12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 355 for generator 5. -/
theorem rs_R006_ueqv_R006_partial_05_0355_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_05_0355
        rs_R006_ueqv_R006_generator_05_0300_0366 =
      rs_R006_ueqv_R006_partial_05_0355 := by
  native_decide

/-- Coefficient term 356 from coefficient polynomial 5. -/
def rs_R006_ueqv_R006_coefficient_05_0356 : Poly :=
[
  term ((-24 : Rat) / 5) [(12, 1), (14, 1)]
]

/-- Partial product 356 for generator 5. -/
def rs_R006_ueqv_R006_partial_05_0356 : Poly :=
[
  term ((48 : Rat) / 5) [(4, 1), (12, 1), (14, 1)],
  term ((-24 : Rat) / 5) [(4, 2), (12, 1), (14, 1)],
  term ((-24 : Rat) / 5) [(5, 2), (12, 1), (14, 1)],
  term ((24 : Rat) / 5) [(12, 1), (14, 1), (15, 2)],
  term ((-48 : Rat) / 5) [(12, 1), (14, 2)],
  term ((24 : Rat) / 5) [(12, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 356 for generator 5. -/
theorem rs_R006_ueqv_R006_partial_05_0356_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_05_0356
        rs_R006_ueqv_R006_generator_05_0300_0366 =
      rs_R006_ueqv_R006_partial_05_0356 := by
  native_decide

/-- Coefficient term 357 from coefficient polynomial 5. -/
def rs_R006_ueqv_R006_coefficient_05_0357 : Poly :=
[
  term ((-4 : Rat) / 5) [(12, 1), (16, 1)]
]

/-- Partial product 357 for generator 5. -/
def rs_R006_ueqv_R006_partial_05_0357 : Poly :=
[
  term ((8 : Rat) / 5) [(4, 1), (12, 1), (16, 1)],
  term ((-4 : Rat) / 5) [(4, 2), (12, 1), (16, 1)],
  term ((-4 : Rat) / 5) [(5, 2), (12, 1), (16, 1)],
  term ((-8 : Rat) / 5) [(12, 1), (14, 1), (16, 1)],
  term ((4 : Rat) / 5) [(12, 1), (14, 2), (16, 1)],
  term ((4 : Rat) / 5) [(12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 357 for generator 5. -/
theorem rs_R006_ueqv_R006_partial_05_0357_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_05_0357
        rs_R006_ueqv_R006_generator_05_0300_0366 =
      rs_R006_ueqv_R006_partial_05_0357 := by
  native_decide

/-- Coefficient term 358 from coefficient polynomial 5. -/
def rs_R006_ueqv_R006_coefficient_05_0358 : Poly :=
[
  term ((-24 : Rat) / 5) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 358 for generator 5. -/
def rs_R006_ueqv_R006_partial_05_0358 : Poly :=
[
  term ((48 : Rat) / 5) [(4, 1), (13, 1), (14, 1), (15, 1)],
  term ((-24 : Rat) / 5) [(4, 2), (13, 1), (14, 1), (15, 1)],
  term ((-24 : Rat) / 5) [(5, 2), (13, 1), (14, 1), (15, 1)],
  term ((24 : Rat) / 5) [(13, 1), (14, 1), (15, 3)],
  term ((-48 : Rat) / 5) [(13, 1), (14, 2), (15, 1)],
  term ((24 : Rat) / 5) [(13, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 358 for generator 5. -/
theorem rs_R006_ueqv_R006_partial_05_0358_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_05_0358
        rs_R006_ueqv_R006_generator_05_0300_0366 =
      rs_R006_ueqv_R006_partial_05_0358 := by
  native_decide

/-- Coefficient term 359 from coefficient polynomial 5. -/
def rs_R006_ueqv_R006_coefficient_05_0359 : Poly :=
[
  term ((2193 : Rat) / 25) [(13, 1), (15, 1)]
]

/-- Partial product 359 for generator 5. -/
def rs_R006_ueqv_R006_partial_05_0359 : Poly :=
[
  term ((-4386 : Rat) / 25) [(4, 1), (13, 1), (15, 1)],
  term ((2193 : Rat) / 25) [(4, 2), (13, 1), (15, 1)],
  term ((2193 : Rat) / 25) [(5, 2), (13, 1), (15, 1)],
  term ((4386 : Rat) / 25) [(13, 1), (14, 1), (15, 1)],
  term ((-2193 : Rat) / 25) [(13, 1), (14, 2), (15, 1)],
  term ((-2193 : Rat) / 25) [(13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 359 for generator 5. -/
theorem rs_R006_ueqv_R006_partial_05_0359_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_05_0359
        rs_R006_ueqv_R006_generator_05_0300_0366 =
      rs_R006_ueqv_R006_partial_05_0359 := by
  native_decide

/-- Coefficient term 360 from coefficient polynomial 5. -/
def rs_R006_ueqv_R006_coefficient_05_0360 : Poly :=
[
  term ((-726 : Rat) / 25) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 360 for generator 5. -/
def rs_R006_ueqv_R006_partial_05_0360 : Poly :=
[
  term ((1452 : Rat) / 25) [(4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-726 : Rat) / 25) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term ((-726 : Rat) / 25) [(5, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1452 : Rat) / 25) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((726 : Rat) / 25) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((726 : Rat) / 25) [(13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 360 for generator 5. -/
theorem rs_R006_ueqv_R006_partial_05_0360_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_05_0360
        rs_R006_ueqv_R006_generator_05_0300_0366 =
      rs_R006_ueqv_R006_partial_05_0360 := by
  native_decide

/-- Coefficient term 361 from coefficient polynomial 5. -/
def rs_R006_ueqv_R006_coefficient_05_0361 : Poly :=
[
  term ((1194 : Rat) / 35) [(13, 2)]
]

/-- Partial product 361 for generator 5. -/
def rs_R006_ueqv_R006_partial_05_0361 : Poly :=
[
  term ((-2388 : Rat) / 35) [(4, 1), (13, 2)],
  term ((1194 : Rat) / 35) [(4, 2), (13, 2)],
  term ((1194 : Rat) / 35) [(5, 2), (13, 2)],
  term ((2388 : Rat) / 35) [(13, 2), (14, 1)],
  term ((-1194 : Rat) / 35) [(13, 2), (14, 2)],
  term ((-1194 : Rat) / 35) [(13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 361 for generator 5. -/
theorem rs_R006_ueqv_R006_partial_05_0361_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_05_0361
        rs_R006_ueqv_R006_generator_05_0300_0366 =
      rs_R006_ueqv_R006_partial_05_0361 := by
  native_decide

/-- Coefficient term 362 from coefficient polynomial 5. -/
def rs_R006_ueqv_R006_coefficient_05_0362 : Poly :=
[
  term ((-384 : Rat) / 5) [(13, 2), (14, 1)]
]

/-- Partial product 362 for generator 5. -/
def rs_R006_ueqv_R006_partial_05_0362 : Poly :=
[
  term ((768 : Rat) / 5) [(4, 1), (13, 2), (14, 1)],
  term ((-384 : Rat) / 5) [(4, 2), (13, 2), (14, 1)],
  term ((-384 : Rat) / 5) [(5, 2), (13, 2), (14, 1)],
  term ((384 : Rat) / 5) [(13, 2), (14, 1), (15, 2)],
  term ((-768 : Rat) / 5) [(13, 2), (14, 2)],
  term ((384 : Rat) / 5) [(13, 2), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 362 for generator 5. -/
theorem rs_R006_ueqv_R006_partial_05_0362_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_05_0362
        rs_R006_ueqv_R006_generator_05_0300_0366 =
      rs_R006_ueqv_R006_partial_05_0362 := by
  native_decide

/-- Coefficient term 363 from coefficient polynomial 5. -/
def rs_R006_ueqv_R006_coefficient_05_0363 : Poly :=
[
  term ((144 : Rat) / 5) [(13, 2), (14, 1), (16, 1)]
]

/-- Partial product 363 for generator 5. -/
def rs_R006_ueqv_R006_partial_05_0363 : Poly :=
[
  term ((-288 : Rat) / 5) [(4, 1), (13, 2), (14, 1), (16, 1)],
  term ((144 : Rat) / 5) [(4, 2), (13, 2), (14, 1), (16, 1)],
  term ((144 : Rat) / 5) [(5, 2), (13, 2), (14, 1), (16, 1)],
  term ((-144 : Rat) / 5) [(13, 2), (14, 1), (15, 2), (16, 1)],
  term ((288 : Rat) / 5) [(13, 2), (14, 2), (16, 1)],
  term ((-144 : Rat) / 5) [(13, 2), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 363 for generator 5. -/
theorem rs_R006_ueqv_R006_partial_05_0363_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_05_0363
        rs_R006_ueqv_R006_generator_05_0300_0366 =
      rs_R006_ueqv_R006_partial_05_0363 := by
  native_decide

/-- Coefficient term 364 from coefficient polynomial 5. -/
def rs_R006_ueqv_R006_coefficient_05_0364 : Poly :=
[
  term ((-72 : Rat) / 5) [(13, 2), (16, 1)]
]

/-- Partial product 364 for generator 5. -/
def rs_R006_ueqv_R006_partial_05_0364 : Poly :=
[
  term ((144 : Rat) / 5) [(4, 1), (13, 2), (16, 1)],
  term ((-72 : Rat) / 5) [(4, 2), (13, 2), (16, 1)],
  term ((-72 : Rat) / 5) [(5, 2), (13, 2), (16, 1)],
  term ((-144 : Rat) / 5) [(13, 2), (14, 1), (16, 1)],
  term ((72 : Rat) / 5) [(13, 2), (14, 2), (16, 1)],
  term ((72 : Rat) / 5) [(13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 364 for generator 5. -/
theorem rs_R006_ueqv_R006_partial_05_0364_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_05_0364
        rs_R006_ueqv_R006_generator_05_0300_0366 =
      rs_R006_ueqv_R006_partial_05_0364 := by
  native_decide

/-- Coefficient term 365 from coefficient polynomial 5. -/
def rs_R006_ueqv_R006_coefficient_05_0365 : Poly :=
[
  term (12 : Rat) [(14, 1)]
]

/-- Partial product 365 for generator 5. -/
def rs_R006_ueqv_R006_partial_05_0365 : Poly :=
[
  term (-24 : Rat) [(4, 1), (14, 1)],
  term (12 : Rat) [(4, 2), (14, 1)],
  term (12 : Rat) [(5, 2), (14, 1)],
  term (-12 : Rat) [(14, 1), (15, 2)],
  term (24 : Rat) [(14, 2)],
  term (-12 : Rat) [(14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 365 for generator 5. -/
theorem rs_R006_ueqv_R006_partial_05_0365_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_05_0365
        rs_R006_ueqv_R006_generator_05_0300_0366 =
      rs_R006_ueqv_R006_partial_05_0365 := by
  native_decide

/-- Coefficient term 366 from coefficient polynomial 5. -/
def rs_R006_ueqv_R006_coefficient_05_0366 : Poly :=
[
  term ((3 : Rat) / 10) [(16, 1)]
]

/-- Partial product 366 for generator 5. -/
def rs_R006_ueqv_R006_partial_05_0366 : Poly :=
[
  term ((-3 : Rat) / 5) [(4, 1), (16, 1)],
  term ((3 : Rat) / 10) [(4, 2), (16, 1)],
  term ((3 : Rat) / 10) [(5, 2), (16, 1)],
  term ((3 : Rat) / 5) [(14, 1), (16, 1)],
  term ((-3 : Rat) / 10) [(14, 2), (16, 1)],
  term ((-3 : Rat) / 10) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 366 for generator 5. -/
theorem rs_R006_ueqv_R006_partial_05_0366_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_05_0366
        rs_R006_ueqv_R006_generator_05_0300_0366 =
      rs_R006_ueqv_R006_partial_05_0366 := by
  native_decide

/-- Partial products in this block. -/
def rs_R006_ueqv_R006_partials_05_0300_0366 : List Poly :=
[
  rs_R006_ueqv_R006_partial_05_0300,
  rs_R006_ueqv_R006_partial_05_0301,
  rs_R006_ueqv_R006_partial_05_0302,
  rs_R006_ueqv_R006_partial_05_0303,
  rs_R006_ueqv_R006_partial_05_0304,
  rs_R006_ueqv_R006_partial_05_0305,
  rs_R006_ueqv_R006_partial_05_0306,
  rs_R006_ueqv_R006_partial_05_0307,
  rs_R006_ueqv_R006_partial_05_0308,
  rs_R006_ueqv_R006_partial_05_0309,
  rs_R006_ueqv_R006_partial_05_0310,
  rs_R006_ueqv_R006_partial_05_0311,
  rs_R006_ueqv_R006_partial_05_0312,
  rs_R006_ueqv_R006_partial_05_0313,
  rs_R006_ueqv_R006_partial_05_0314,
  rs_R006_ueqv_R006_partial_05_0315,
  rs_R006_ueqv_R006_partial_05_0316,
  rs_R006_ueqv_R006_partial_05_0317,
  rs_R006_ueqv_R006_partial_05_0318,
  rs_R006_ueqv_R006_partial_05_0319,
  rs_R006_ueqv_R006_partial_05_0320,
  rs_R006_ueqv_R006_partial_05_0321,
  rs_R006_ueqv_R006_partial_05_0322,
  rs_R006_ueqv_R006_partial_05_0323,
  rs_R006_ueqv_R006_partial_05_0324,
  rs_R006_ueqv_R006_partial_05_0325,
  rs_R006_ueqv_R006_partial_05_0326,
  rs_R006_ueqv_R006_partial_05_0327,
  rs_R006_ueqv_R006_partial_05_0328,
  rs_R006_ueqv_R006_partial_05_0329,
  rs_R006_ueqv_R006_partial_05_0330,
  rs_R006_ueqv_R006_partial_05_0331,
  rs_R006_ueqv_R006_partial_05_0332,
  rs_R006_ueqv_R006_partial_05_0333,
  rs_R006_ueqv_R006_partial_05_0334,
  rs_R006_ueqv_R006_partial_05_0335,
  rs_R006_ueqv_R006_partial_05_0336,
  rs_R006_ueqv_R006_partial_05_0337,
  rs_R006_ueqv_R006_partial_05_0338,
  rs_R006_ueqv_R006_partial_05_0339,
  rs_R006_ueqv_R006_partial_05_0340,
  rs_R006_ueqv_R006_partial_05_0341,
  rs_R006_ueqv_R006_partial_05_0342,
  rs_R006_ueqv_R006_partial_05_0343,
  rs_R006_ueqv_R006_partial_05_0344,
  rs_R006_ueqv_R006_partial_05_0345,
  rs_R006_ueqv_R006_partial_05_0346,
  rs_R006_ueqv_R006_partial_05_0347,
  rs_R006_ueqv_R006_partial_05_0348,
  rs_R006_ueqv_R006_partial_05_0349,
  rs_R006_ueqv_R006_partial_05_0350,
  rs_R006_ueqv_R006_partial_05_0351,
  rs_R006_ueqv_R006_partial_05_0352,
  rs_R006_ueqv_R006_partial_05_0353,
  rs_R006_ueqv_R006_partial_05_0354,
  rs_R006_ueqv_R006_partial_05_0355,
  rs_R006_ueqv_R006_partial_05_0356,
  rs_R006_ueqv_R006_partial_05_0357,
  rs_R006_ueqv_R006_partial_05_0358,
  rs_R006_ueqv_R006_partial_05_0359,
  rs_R006_ueqv_R006_partial_05_0360,
  rs_R006_ueqv_R006_partial_05_0361,
  rs_R006_ueqv_R006_partial_05_0362,
  rs_R006_ueqv_R006_partial_05_0363,
  rs_R006_ueqv_R006_partial_05_0364,
  rs_R006_ueqv_R006_partial_05_0365,
  rs_R006_ueqv_R006_partial_05_0366
]

/-- Sum of partial products in this block. -/
def rs_R006_ueqv_R006_block_05_0300_0366 : Poly :=
[
  term ((1224 : Rat) / 7) [(4, 1), (8, 1), (11, 1), (13, 1)],
  term ((-1728 : Rat) / 5) [(4, 1), (8, 1), (11, 1), (13, 1), (14, 1)],
  term ((576 : Rat) / 5) [(4, 1), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(4, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((1728 : Rat) / 5) [(4, 1), (8, 1), (11, 1), (15, 1)],
  term ((-576 : Rat) / 5) [(4, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-144 : Rat) / 35) [(4, 1), (8, 1), (13, 2)],
  term ((-432 : Rat) / 5) [(4, 1), (8, 1), (14, 1)],
  term ((1104 : Rat) / 5) [(4, 1), (9, 1), (11, 1)],
  term ((-20736 : Rat) / 5) [(4, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((6912 : Rat) / 5) [(4, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-69696 : Rat) / 35) [(4, 1), (9, 1), (11, 1), (13, 2)],
  term ((20736 : Rat) / 5) [(4, 1), (9, 1), (11, 1), (13, 2), (14, 1)],
  term ((-6912 : Rat) / 5) [(4, 1), (9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((3456 : Rat) / 5) [(4, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-864 : Rat) / 5) [(4, 1), (9, 1), (11, 1), (14, 1)],
  term ((44304 : Rat) / 35) [(4, 1), (9, 1), (11, 2), (13, 1)],
  term ((-13248 : Rat) / 5) [(4, 1), (9, 1), (11, 2), (13, 1), (14, 1)],
  term ((4416 : Rat) / 5) [(4, 1), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-2208 : Rat) / 5) [(4, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((13248 : Rat) / 5) [(4, 1), (9, 1), (11, 2), (15, 1)],
  term ((-4416 : Rat) / 5) [(4, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-1776 : Rat) / 35) [(4, 1), (9, 1), (12, 1), (13, 1)],
  term ((576 : Rat) / 5) [(4, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-192 : Rat) / 5) [(4, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((96 : Rat) / 5) [(4, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-576 : Rat) / 5) [(4, 1), (9, 1), (12, 1), (15, 1)],
  term ((192 : Rat) / 5) [(4, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((1188 : Rat) / 7) [(4, 1), (9, 1), (13, 1)],
  term ((-1728 : Rat) / 5) [(4, 1), (9, 1), (13, 1), (14, 1)],
  term ((576 : Rat) / 5) [(4, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(4, 1), (9, 1), (13, 1), (16, 1)],
  term ((1728 : Rat) / 5) [(4, 1), (9, 1), (15, 1)],
  term ((-576 : Rat) / 5) [(4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-2304 : Rat) / 7) [(4, 1), (9, 2), (11, 1), (13, 1)],
  term ((3456 : Rat) / 5) [(4, 1), (9, 2), (11, 1), (13, 1), (14, 1)],
  term ((-1152 : Rat) / 5) [(4, 1), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((576 : Rat) / 5) [(4, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-3456 : Rat) / 5) [(4, 1), (9, 2), (11, 1), (15, 1)],
  term ((1152 : Rat) / 5) [(4, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((5976 : Rat) / 35) [(4, 1), (11, 1), (12, 1), (13, 1)],
  term ((-1728 : Rat) / 5) [(4, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((576 : Rat) / 5) [(4, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(4, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((8124 : Rat) / 25) [(4, 1), (11, 1), (12, 1), (15, 1)],
  term ((-2568 : Rat) / 25) [(4, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((17076 : Rat) / 35) [(4, 1), (11, 1), (13, 1)],
  term ((-2304 : Rat) / 5) [(4, 1), (11, 1), (13, 1), (14, 1)],
  term ((96 : Rat) / 5) [(4, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-72 : Rat) / 5) [(4, 1), (11, 1), (13, 1), (16, 1)],
  term ((1422 : Rat) / 25) [(4, 1), (11, 1), (15, 1)],
  term ((-864 : Rat) / 25) [(4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1908 : Rat) / 5) [(4, 1), (11, 2)],
  term ((1452 : Rat) / 5) [(4, 1), (11, 2), (14, 1)],
  term (4 : Rat) [(4, 1), (11, 2), (16, 1)],
  term (-18 : Rat) [(4, 1), (12, 1)],
  term ((48 : Rat) / 5) [(4, 1), (12, 1), (14, 1)],
  term ((8 : Rat) / 5) [(4, 1), (12, 1), (16, 1)],
  term ((48 : Rat) / 5) [(4, 1), (13, 1), (14, 1), (15, 1)],
  term ((-4386 : Rat) / 25) [(4, 1), (13, 1), (15, 1)],
  term ((1452 : Rat) / 25) [(4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2388 : Rat) / 35) [(4, 1), (13, 2)],
  term ((768 : Rat) / 5) [(4, 1), (13, 2), (14, 1)],
  term ((-288 : Rat) / 5) [(4, 1), (13, 2), (14, 1), (16, 1)],
  term ((144 : Rat) / 5) [(4, 1), (13, 2), (16, 1)],
  term (-24 : Rat) [(4, 1), (14, 1)],
  term ((-3 : Rat) / 5) [(4, 1), (16, 1)],
  term ((-612 : Rat) / 7) [(4, 2), (8, 1), (11, 1), (13, 1)],
  term ((864 : Rat) / 5) [(4, 2), (8, 1), (11, 1), (13, 1), (14, 1)],
  term ((-288 : Rat) / 5) [(4, 2), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((144 : Rat) / 5) [(4, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-864 : Rat) / 5) [(4, 2), (8, 1), (11, 1), (15, 1)],
  term ((288 : Rat) / 5) [(4, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((72 : Rat) / 35) [(4, 2), (8, 1), (13, 2)],
  term ((216 : Rat) / 5) [(4, 2), (8, 1), (14, 1)],
  term ((-552 : Rat) / 5) [(4, 2), (9, 1), (11, 1)],
  term ((10368 : Rat) / 5) [(4, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-3456 : Rat) / 5) [(4, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((34848 : Rat) / 35) [(4, 2), (9, 1), (11, 1), (13, 2)],
  term ((-10368 : Rat) / 5) [(4, 2), (9, 1), (11, 1), (13, 2), (14, 1)],
  term ((3456 : Rat) / 5) [(4, 2), (9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-1728 : Rat) / 5) [(4, 2), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((432 : Rat) / 5) [(4, 2), (9, 1), (11, 1), (14, 1)],
  term ((-22152 : Rat) / 35) [(4, 2), (9, 1), (11, 2), (13, 1)],
  term ((6624 : Rat) / 5) [(4, 2), (9, 1), (11, 2), (13, 1), (14, 1)],
  term ((-2208 : Rat) / 5) [(4, 2), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((1104 : Rat) / 5) [(4, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-6624 : Rat) / 5) [(4, 2), (9, 1), (11, 2), (15, 1)],
  term ((2208 : Rat) / 5) [(4, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((888 : Rat) / 35) [(4, 2), (9, 1), (12, 1), (13, 1)],
  term ((-288 : Rat) / 5) [(4, 2), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((96 : Rat) / 5) [(4, 2), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-48 : Rat) / 5) [(4, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((288 : Rat) / 5) [(4, 2), (9, 1), (12, 1), (15, 1)],
  term ((-96 : Rat) / 5) [(4, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-594 : Rat) / 7) [(4, 2), (9, 1), (13, 1)],
  term ((864 : Rat) / 5) [(4, 2), (9, 1), (13, 1), (14, 1)],
  term ((-288 : Rat) / 5) [(4, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((144 : Rat) / 5) [(4, 2), (9, 1), (13, 1), (16, 1)],
  term ((-864 : Rat) / 5) [(4, 2), (9, 1), (15, 1)],
  term ((288 : Rat) / 5) [(4, 2), (9, 1), (15, 1), (16, 1)],
  term ((1152 : Rat) / 7) [(4, 2), (9, 2), (11, 1), (13, 1)],
  term ((-1728 : Rat) / 5) [(4, 2), (9, 2), (11, 1), (13, 1), (14, 1)],
  term ((576 : Rat) / 5) [(4, 2), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(4, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((1728 : Rat) / 5) [(4, 2), (9, 2), (11, 1), (15, 1)],
  term ((-576 : Rat) / 5) [(4, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-2988 : Rat) / 35) [(4, 2), (11, 1), (12, 1), (13, 1)],
  term ((864 : Rat) / 5) [(4, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-288 : Rat) / 5) [(4, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((144 : Rat) / 5) [(4, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-4062 : Rat) / 25) [(4, 2), (11, 1), (12, 1), (15, 1)],
  term ((1284 : Rat) / 25) [(4, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-8538 : Rat) / 35) [(4, 2), (11, 1), (13, 1)],
  term ((1152 : Rat) / 5) [(4, 2), (11, 1), (13, 1), (14, 1)],
  term ((-48 : Rat) / 5) [(4, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((36 : Rat) / 5) [(4, 2), (11, 1), (13, 1), (16, 1)],
  term ((-711 : Rat) / 25) [(4, 2), (11, 1), (15, 1)],
  term ((432 : Rat) / 25) [(4, 2), (11, 1), (15, 1), (16, 1)],
  term ((954 : Rat) / 5) [(4, 2), (11, 2)],
  term ((-726 : Rat) / 5) [(4, 2), (11, 2), (14, 1)],
  term (-2 : Rat) [(4, 2), (11, 2), (16, 1)],
  term (9 : Rat) [(4, 2), (12, 1)],
  term ((-24 : Rat) / 5) [(4, 2), (12, 1), (14, 1)],
  term ((-4 : Rat) / 5) [(4, 2), (12, 1), (16, 1)],
  term ((-24 : Rat) / 5) [(4, 2), (13, 1), (14, 1), (15, 1)],
  term ((2193 : Rat) / 25) [(4, 2), (13, 1), (15, 1)],
  term ((-726 : Rat) / 25) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term ((1194 : Rat) / 35) [(4, 2), (13, 2)],
  term ((-384 : Rat) / 5) [(4, 2), (13, 2), (14, 1)],
  term ((144 : Rat) / 5) [(4, 2), (13, 2), (14, 1), (16, 1)],
  term ((-72 : Rat) / 5) [(4, 2), (13, 2), (16, 1)],
  term (12 : Rat) [(4, 2), (14, 1)],
  term ((3 : Rat) / 10) [(4, 2), (16, 1)],
  term ((-612 : Rat) / 7) [(5, 2), (8, 1), (11, 1), (13, 1)],
  term ((864 : Rat) / 5) [(5, 2), (8, 1), (11, 1), (13, 1), (14, 1)],
  term ((-288 : Rat) / 5) [(5, 2), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((144 : Rat) / 5) [(5, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-864 : Rat) / 5) [(5, 2), (8, 1), (11, 1), (15, 1)],
  term ((288 : Rat) / 5) [(5, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((72 : Rat) / 35) [(5, 2), (8, 1), (13, 2)],
  term ((216 : Rat) / 5) [(5, 2), (8, 1), (14, 1)],
  term ((-552 : Rat) / 5) [(5, 2), (9, 1), (11, 1)],
  term ((10368 : Rat) / 5) [(5, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-3456 : Rat) / 5) [(5, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((34848 : Rat) / 35) [(5, 2), (9, 1), (11, 1), (13, 2)],
  term ((-10368 : Rat) / 5) [(5, 2), (9, 1), (11, 1), (13, 2), (14, 1)],
  term ((3456 : Rat) / 5) [(5, 2), (9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-1728 : Rat) / 5) [(5, 2), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((432 : Rat) / 5) [(5, 2), (9, 1), (11, 1), (14, 1)],
  term ((-22152 : Rat) / 35) [(5, 2), (9, 1), (11, 2), (13, 1)],
  term ((6624 : Rat) / 5) [(5, 2), (9, 1), (11, 2), (13, 1), (14, 1)],
  term ((-2208 : Rat) / 5) [(5, 2), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((1104 : Rat) / 5) [(5, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-6624 : Rat) / 5) [(5, 2), (9, 1), (11, 2), (15, 1)],
  term ((2208 : Rat) / 5) [(5, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((888 : Rat) / 35) [(5, 2), (9, 1), (12, 1), (13, 1)],
  term ((-288 : Rat) / 5) [(5, 2), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((96 : Rat) / 5) [(5, 2), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-48 : Rat) / 5) [(5, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((288 : Rat) / 5) [(5, 2), (9, 1), (12, 1), (15, 1)],
  term ((-96 : Rat) / 5) [(5, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-594 : Rat) / 7) [(5, 2), (9, 1), (13, 1)],
  term ((864 : Rat) / 5) [(5, 2), (9, 1), (13, 1), (14, 1)],
  term ((-288 : Rat) / 5) [(5, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((144 : Rat) / 5) [(5, 2), (9, 1), (13, 1), (16, 1)],
  term ((-864 : Rat) / 5) [(5, 2), (9, 1), (15, 1)],
  term ((288 : Rat) / 5) [(5, 2), (9, 1), (15, 1), (16, 1)],
  term ((1152 : Rat) / 7) [(5, 2), (9, 2), (11, 1), (13, 1)],
  term ((-1728 : Rat) / 5) [(5, 2), (9, 2), (11, 1), (13, 1), (14, 1)],
  term ((576 : Rat) / 5) [(5, 2), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(5, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((1728 : Rat) / 5) [(5, 2), (9, 2), (11, 1), (15, 1)],
  term ((-576 : Rat) / 5) [(5, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-2988 : Rat) / 35) [(5, 2), (11, 1), (12, 1), (13, 1)],
  term ((864 : Rat) / 5) [(5, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-288 : Rat) / 5) [(5, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((144 : Rat) / 5) [(5, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-4062 : Rat) / 25) [(5, 2), (11, 1), (12, 1), (15, 1)],
  term ((1284 : Rat) / 25) [(5, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-8538 : Rat) / 35) [(5, 2), (11, 1), (13, 1)],
  term ((1152 : Rat) / 5) [(5, 2), (11, 1), (13, 1), (14, 1)],
  term ((-48 : Rat) / 5) [(5, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((36 : Rat) / 5) [(5, 2), (11, 1), (13, 1), (16, 1)],
  term ((-711 : Rat) / 25) [(5, 2), (11, 1), (15, 1)],
  term ((432 : Rat) / 25) [(5, 2), (11, 1), (15, 1), (16, 1)],
  term ((954 : Rat) / 5) [(5, 2), (11, 2)],
  term ((-726 : Rat) / 5) [(5, 2), (11, 2), (14, 1)],
  term (-2 : Rat) [(5, 2), (11, 2), (16, 1)],
  term (9 : Rat) [(5, 2), (12, 1)],
  term ((-24 : Rat) / 5) [(5, 2), (12, 1), (14, 1)],
  term ((-4 : Rat) / 5) [(5, 2), (12, 1), (16, 1)],
  term ((-24 : Rat) / 5) [(5, 2), (13, 1), (14, 1), (15, 1)],
  term ((2193 : Rat) / 25) [(5, 2), (13, 1), (15, 1)],
  term ((-726 : Rat) / 25) [(5, 2), (13, 1), (15, 1), (16, 1)],
  term ((1194 : Rat) / 35) [(5, 2), (13, 2)],
  term ((-384 : Rat) / 5) [(5, 2), (13, 2), (14, 1)],
  term ((144 : Rat) / 5) [(5, 2), (13, 2), (14, 1), (16, 1)],
  term ((-72 : Rat) / 5) [(5, 2), (13, 2), (16, 1)],
  term (12 : Rat) [(5, 2), (14, 1)],
  term ((3 : Rat) / 10) [(5, 2), (16, 1)],
  term ((-1224 : Rat) / 7) [(8, 1), (11, 1), (13, 1), (14, 1)],
  term ((-864 : Rat) / 5) [(8, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((288 : Rat) / 5) [(8, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((288 : Rat) / 5) [(8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((15156 : Rat) / 35) [(8, 1), (11, 1), (13, 1), (14, 2)],
  term (-144 : Rat) [(8, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-864 : Rat) / 5) [(8, 1), (11, 1), (13, 1), (14, 3)],
  term ((288 : Rat) / 5) [(8, 1), (11, 1), (13, 1), (14, 3), (16, 1)],
  term ((612 : Rat) / 7) [(8, 1), (11, 1), (13, 1), (15, 2)],
  term ((-144 : Rat) / 5) [(8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1728 : Rat) / 5) [(8, 1), (11, 1), (14, 1), (15, 1)],
  term ((576 : Rat) / 5) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((864 : Rat) / 5) [(8, 1), (11, 1), (14, 2), (15, 1)],
  term ((-288 : Rat) / 5) [(8, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((864 : Rat) / 5) [(8, 1), (11, 1), (15, 3)],
  term ((-288 : Rat) / 5) [(8, 1), (11, 1), (15, 3), (16, 1)],
  term ((144 : Rat) / 35) [(8, 1), (13, 2), (14, 1)],
  term ((-72 : Rat) / 35) [(8, 1), (13, 2), (14, 2)],
  term ((-72 : Rat) / 35) [(8, 1), (13, 2), (15, 2)],
  term ((-216 : Rat) / 5) [(8, 1), (14, 1), (15, 2)],
  term ((432 : Rat) / 5) [(8, 1), (14, 2)],
  term ((-216 : Rat) / 5) [(8, 1), (14, 3)],
  term ((20736 : Rat) / 5) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-6912 : Rat) / 5) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10368 : Rat) / 5) [(9, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((3456 : Rat) / 5) [(9, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-10368 : Rat) / 5) [(9, 1), (11, 1), (13, 1), (15, 3)],
  term ((3456 : Rat) / 5) [(9, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((69696 : Rat) / 35) [(9, 1), (11, 1), (13, 2), (14, 1)],
  term ((10368 : Rat) / 5) [(9, 1), (11, 1), (13, 2), (14, 1), (15, 2)],
  term ((-3456 : Rat) / 5) [(9, 1), (11, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-3456 : Rat) / 5) [(9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-36000 : Rat) / 7) [(9, 1), (11, 1), (13, 2), (14, 2)],
  term (1728 : Rat) [(9, 1), (11, 1), (13, 2), (14, 2), (16, 1)],
  term ((10368 : Rat) / 5) [(9, 1), (11, 1), (13, 2), (14, 3)],
  term ((-3456 : Rat) / 5) [(9, 1), (11, 1), (13, 2), (14, 3), (16, 1)],
  term ((-34848 : Rat) / 35) [(9, 1), (11, 1), (13, 2), (15, 2)],
  term ((1728 : Rat) / 5) [(9, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-1104 : Rat) / 5) [(9, 1), (11, 1), (14, 1)],
  term ((-432 : Rat) / 5) [(9, 1), (11, 1), (14, 1), (15, 2)],
  term ((1416 : Rat) / 5) [(9, 1), (11, 1), (14, 2)],
  term ((-432 : Rat) / 5) [(9, 1), (11, 1), (14, 3)],
  term ((552 : Rat) / 5) [(9, 1), (11, 1), (15, 2)],
  term ((-44304 : Rat) / 35) [(9, 1), (11, 2), (13, 1), (14, 1)],
  term ((-6624 : Rat) / 5) [(9, 1), (11, 2), (13, 1), (14, 1), (15, 2)],
  term ((2208 : Rat) / 5) [(9, 1), (11, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((2208 : Rat) / 5) [(9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((114888 : Rat) / 35) [(9, 1), (11, 2), (13, 1), (14, 2)],
  term (-1104 : Rat) [(9, 1), (11, 2), (13, 1), (14, 2), (16, 1)],
  term ((-6624 : Rat) / 5) [(9, 1), (11, 2), (13, 1), (14, 3)],
  term ((2208 : Rat) / 5) [(9, 1), (11, 2), (13, 1), (14, 3), (16, 1)],
  term ((22152 : Rat) / 35) [(9, 1), (11, 2), (13, 1), (15, 2)],
  term ((-1104 : Rat) / 5) [(9, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-13248 : Rat) / 5) [(9, 1), (11, 2), (14, 1), (15, 1)],
  term ((4416 : Rat) / 5) [(9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((6624 : Rat) / 5) [(9, 1), (11, 2), (14, 2), (15, 1)],
  term ((-2208 : Rat) / 5) [(9, 1), (11, 2), (14, 2), (15, 1), (16, 1)],
  term ((6624 : Rat) / 5) [(9, 1), (11, 2), (15, 3)],
  term ((-2208 : Rat) / 5) [(9, 1), (11, 2), (15, 3), (16, 1)],
  term ((1776 : Rat) / 35) [(9, 1), (12, 1), (13, 1), (14, 1)],
  term ((288 : Rat) / 5) [(9, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-96 : Rat) / 5) [(9, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-96 : Rat) / 5) [(9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-984 : Rat) / 7) [(9, 1), (12, 1), (13, 1), (14, 2)],
  term (48 : Rat) [(9, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((288 : Rat) / 5) [(9, 1), (12, 1), (13, 1), (14, 3)],
  term ((-96 : Rat) / 5) [(9, 1), (12, 1), (13, 1), (14, 3), (16, 1)],
  term ((-888 : Rat) / 35) [(9, 1), (12, 1), (13, 1), (15, 2)],
  term ((48 : Rat) / 5) [(9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((576 : Rat) / 5) [(9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-192 : Rat) / 5) [(9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(9, 1), (12, 1), (14, 2), (15, 1)],
  term ((96 : Rat) / 5) [(9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(9, 1), (12, 1), (15, 3)],
  term ((96 : Rat) / 5) [(9, 1), (12, 1), (15, 3), (16, 1)],
  term ((-1188 : Rat) / 7) [(9, 1), (13, 1), (14, 1)],
  term ((-864 : Rat) / 5) [(9, 1), (13, 1), (14, 1), (15, 2)],
  term ((288 : Rat) / 5) [(9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((288 : Rat) / 5) [(9, 1), (13, 1), (14, 1), (16, 1)],
  term ((15066 : Rat) / 35) [(9, 1), (13, 1), (14, 2)],
  term (-144 : Rat) [(9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-864 : Rat) / 5) [(9, 1), (13, 1), (14, 3)],
  term ((288 : Rat) / 5) [(9, 1), (13, 1), (14, 3), (16, 1)],
  term ((594 : Rat) / 7) [(9, 1), (13, 1), (15, 2)],
  term ((-144 : Rat) / 5) [(9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1728 : Rat) / 5) [(9, 1), (14, 1), (15, 1)],
  term ((576 : Rat) / 5) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term ((864 : Rat) / 5) [(9, 1), (14, 2), (15, 1)],
  term ((-288 : Rat) / 5) [(9, 1), (14, 2), (15, 1), (16, 1)],
  term ((864 : Rat) / 5) [(9, 1), (15, 3)],
  term ((-288 : Rat) / 5) [(9, 1), (15, 3), (16, 1)],
  term ((2304 : Rat) / 7) [(9, 2), (11, 1), (13, 1), (14, 1)],
  term ((1728 : Rat) / 5) [(9, 2), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-576 : Rat) / 5) [(9, 2), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-576 : Rat) / 5) [(9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-29952 : Rat) / 35) [(9, 2), (11, 1), (13, 1), (14, 2)],
  term (288 : Rat) [(9, 2), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((1728 : Rat) / 5) [(9, 2), (11, 1), (13, 1), (14, 3)],
  term ((-576 : Rat) / 5) [(9, 2), (11, 1), (13, 1), (14, 3), (16, 1)],
  term ((-1152 : Rat) / 7) [(9, 2), (11, 1), (13, 1), (15, 2)],
  term ((288 : Rat) / 5) [(9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((3456 : Rat) / 5) [(9, 2), (11, 1), (14, 1), (15, 1)],
  term ((-1152 : Rat) / 5) [(9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1728 : Rat) / 5) [(9, 2), (11, 1), (14, 2), (15, 1)],
  term ((576 : Rat) / 5) [(9, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1728 : Rat) / 5) [(9, 2), (11, 1), (15, 3)],
  term ((576 : Rat) / 5) [(9, 2), (11, 1), (15, 3), (16, 1)],
  term ((-5976 : Rat) / 35) [(11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-864 : Rat) / 5) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((288 : Rat) / 5) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((288 : Rat) / 5) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((15084 : Rat) / 35) [(11, 1), (12, 1), (13, 1), (14, 2)],
  term (-144 : Rat) [(11, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-864 : Rat) / 5) [(11, 1), (12, 1), (13, 1), (14, 3)],
  term ((288 : Rat) / 5) [(11, 1), (12, 1), (13, 1), (14, 3), (16, 1)],
  term ((2988 : Rat) / 35) [(11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-144 : Rat) / 5) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-8124 : Rat) / 25) [(11, 1), (12, 1), (14, 1), (15, 1)],
  term ((2568 : Rat) / 25) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((4062 : Rat) / 25) [(11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-1284 : Rat) / 25) [(11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((4062 : Rat) / 25) [(11, 1), (12, 1), (15, 3)],
  term ((-1284 : Rat) / 25) [(11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-17076 : Rat) / 35) [(11, 1), (13, 1), (14, 1)],
  term ((-1152 : Rat) / 5) [(11, 1), (13, 1), (14, 1), (15, 2)],
  term ((48 : Rat) / 5) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((72 : Rat) / 5) [(11, 1), (13, 1), (14, 1), (16, 1)],
  term ((24666 : Rat) / 35) [(11, 1), (13, 1), (14, 2)],
  term ((-132 : Rat) / 5) [(11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-1152 : Rat) / 5) [(11, 1), (13, 1), (14, 3)],
  term ((48 : Rat) / 5) [(11, 1), (13, 1), (14, 3), (16, 1)],
  term ((8538 : Rat) / 35) [(11, 1), (13, 1), (15, 2)],
  term ((-36 : Rat) / 5) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1422 : Rat) / 25) [(11, 1), (14, 1), (15, 1)],
  term ((864 : Rat) / 25) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term ((711 : Rat) / 25) [(11, 1), (14, 2), (15, 1)],
  term ((-432 : Rat) / 25) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((711 : Rat) / 25) [(11, 1), (15, 3)],
  term ((-432 : Rat) / 25) [(11, 1), (15, 3), (16, 1)],
  term ((1908 : Rat) / 5) [(11, 2), (14, 1)],
  term ((726 : Rat) / 5) [(11, 2), (14, 1), (15, 2)],
  term (-4 : Rat) [(11, 2), (14, 1), (16, 1)],
  term ((-2406 : Rat) / 5) [(11, 2), (14, 2)],
  term (2 : Rat) [(11, 2), (14, 2), (16, 1)],
  term ((726 : Rat) / 5) [(11, 2), (14, 3)],
  term ((-954 : Rat) / 5) [(11, 2), (15, 2)],
  term (2 : Rat) [(11, 2), (15, 2), (16, 1)],
  term (18 : Rat) [(12, 1), (14, 1)],
  term ((24 : Rat) / 5) [(12, 1), (14, 1), (15, 2)],
  term ((-8 : Rat) / 5) [(12, 1), (14, 1), (16, 1)],
  term ((-93 : Rat) / 5) [(12, 1), (14, 2)],
  term ((4 : Rat) / 5) [(12, 1), (14, 2), (16, 1)],
  term ((24 : Rat) / 5) [(12, 1), (14, 3)],
  term (-9 : Rat) [(12, 1), (15, 2)],
  term ((4 : Rat) / 5) [(12, 1), (15, 2), (16, 1)],
  term ((4386 : Rat) / 25) [(13, 1), (14, 1), (15, 1)],
  term ((-1452 : Rat) / 25) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((24 : Rat) / 5) [(13, 1), (14, 1), (15, 3)],
  term ((-2433 : Rat) / 25) [(13, 1), (14, 2), (15, 1)],
  term ((726 : Rat) / 25) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((24 : Rat) / 5) [(13, 1), (14, 3), (15, 1)],
  term ((-2193 : Rat) / 25) [(13, 1), (15, 3)],
  term ((726 : Rat) / 25) [(13, 1), (15, 3), (16, 1)],
  term ((2388 : Rat) / 35) [(13, 2), (14, 1)],
  term ((384 : Rat) / 5) [(13, 2), (14, 1), (15, 2)],
  term ((-144 : Rat) / 5) [(13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-144 : Rat) / 5) [(13, 2), (14, 1), (16, 1)],
  term ((-1314 : Rat) / 7) [(13, 2), (14, 2)],
  term (72 : Rat) [(13, 2), (14, 2), (16, 1)],
  term ((384 : Rat) / 5) [(13, 2), (14, 3)],
  term ((-144 : Rat) / 5) [(13, 2), (14, 3), (16, 1)],
  term ((-1194 : Rat) / 35) [(13, 2), (15, 2)],
  term ((72 : Rat) / 5) [(13, 2), (15, 2), (16, 1)],
  term (-12 : Rat) [(14, 1), (15, 2)],
  term ((3 : Rat) / 5) [(14, 1), (16, 1)],
  term (24 : Rat) [(14, 2)],
  term ((-3 : Rat) / 10) [(14, 2), (16, 1)],
  term (-12 : Rat) [(14, 3)],
  term ((-3 : Rat) / 10) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 5, terms 300 through 366. -/
theorem rs_R006_ueqv_R006_block_05_0300_0366_valid :
    checkProductSumEq rs_R006_ueqv_R006_partials_05_0300_0366
      rs_R006_ueqv_R006_block_05_0300_0366 = true := by
  native_decide

end R006UeqvR006TermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
