/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R006:u=v:R006, term block 27:300-322

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R006UeqvR006TermShards

/-- Generator polynomial 27 for relaxed split surplus certificate `R006:u=v:R006`. -/
def rs_R006_ueqv_R006_generator_27_0300_0322 : Poly :=
[
  term (-2 : Rat) [(0, 1), (12, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (13, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(12, 1), (14, 1)],
  term (2 : Rat) [(13, 1), (15, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 300 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0300 : Poly :=
[
  term ((288 : Rat) / 5) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 300 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0300 : Poly :=
[
  term ((-576 : Rat) / 5) [(0, 1), (11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((288 : Rat) / 5) [(0, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-576 : Rat) / 5) [(1, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((288 : Rat) / 5) [(1, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-288 : Rat) / 5) [(11, 1), (12, 1), (13, 1), (14, 3), (16, 1)],
  term ((576 : Rat) / 5) [(11, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((576 : Rat) / 5) [(11, 1), (12, 2), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 300 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0300_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0300
        rs_R006_ueqv_R006_generator_27_0300_0322 =
      rs_R006_ueqv_R006_partial_27_0300 := by
  native_decide

/-- Coefficient term 301 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0301 : Poly :=
[
  term ((-144 : Rat) / 5) [(11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 301 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0301 : Poly :=
[
  term ((288 : Rat) / 5) [(0, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-144 : Rat) / 5) [(0, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((288 : Rat) / 5) [(1, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-144 : Rat) / 5) [(1, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((144 : Rat) / 5) [(11, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((144 : Rat) / 5) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-288 : Rat) / 5) [(11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(11, 1), (12, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 301 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0301_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0301
        rs_R006_ueqv_R006_generator_27_0300_0322 =
      rs_R006_ueqv_R006_partial_27_0301 := by
  native_decide

/-- Coefficient term 302 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0302 : Poly :=
[
  term ((4062 : Rat) / 25) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 302 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0302 : Poly :=
[
  term ((-8124 : Rat) / 25) [(0, 1), (11, 1), (12, 2), (15, 1)],
  term ((4062 : Rat) / 25) [(0, 2), (11, 1), (12, 1), (15, 1)],
  term ((-8124 : Rat) / 25) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((4062 : Rat) / 25) [(1, 2), (11, 1), (12, 1), (15, 1)],
  term ((8124 : Rat) / 25) [(11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-4062 : Rat) / 25) [(11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-4062 : Rat) / 25) [(11, 1), (12, 1), (15, 3)],
  term ((8124 : Rat) / 25) [(11, 1), (12, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 302 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0302_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0302
        rs_R006_ueqv_R006_generator_27_0300_0322 =
      rs_R006_ueqv_R006_partial_27_0302 := by
  native_decide

/-- Coefficient term 303 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0303 : Poly :=
[
  term ((-1284 : Rat) / 25) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 303 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0303 : Poly :=
[
  term ((2568 : Rat) / 25) [(0, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1284 : Rat) / 25) [(0, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((2568 : Rat) / 25) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1284 : Rat) / 25) [(1, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2568 : Rat) / 25) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((1284 : Rat) / 25) [(11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((1284 : Rat) / 25) [(11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-2568 : Rat) / 25) [(11, 1), (12, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 303 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0303_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0303
        rs_R006_ueqv_R006_generator_27_0300_0322 =
      rs_R006_ueqv_R006_partial_27_0303 := by
  native_decide

/-- Coefficient term 304 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0304 : Poly :=
[
  term ((1698 : Rat) / 7) [(11, 1), (13, 1)]
]

/-- Partial product 304 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0304 : Poly :=
[
  term ((-3396 : Rat) / 7) [(0, 1), (11, 1), (12, 1), (13, 1)],
  term ((1698 : Rat) / 7) [(0, 2), (11, 1), (13, 1)],
  term ((-3396 : Rat) / 7) [(1, 1), (11, 1), (13, 2)],
  term ((1698 : Rat) / 7) [(1, 2), (11, 1), (13, 1)],
  term ((3396 : Rat) / 7) [(11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-1698 : Rat) / 7) [(11, 1), (13, 1), (14, 2)],
  term ((-1698 : Rat) / 7) [(11, 1), (13, 1), (15, 2)],
  term ((3396 : Rat) / 7) [(11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 304 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0304_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0304
        rs_R006_ueqv_R006_generator_27_0300_0322 =
      rs_R006_ueqv_R006_partial_27_0304 := by
  native_decide

/-- Coefficient term 305 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0305 : Poly :=
[
  term ((-1056 : Rat) / 5) [(11, 1), (13, 1), (14, 1)]
]

/-- Partial product 305 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0305 : Poly :=
[
  term ((2112 : Rat) / 5) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-1056 : Rat) / 5) [(0, 2), (11, 1), (13, 1), (14, 1)],
  term ((2112 : Rat) / 5) [(1, 1), (11, 1), (13, 2), (14, 1)],
  term ((-1056 : Rat) / 5) [(1, 2), (11, 1), (13, 1), (14, 1)],
  term ((-2112 : Rat) / 5) [(11, 1), (12, 1), (13, 1), (14, 2)],
  term ((1056 : Rat) / 5) [(11, 1), (13, 1), (14, 1), (15, 2)],
  term ((1056 : Rat) / 5) [(11, 1), (13, 1), (14, 3)],
  term ((-2112 : Rat) / 5) [(11, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 305 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0305_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0305
        rs_R006_ueqv_R006_generator_27_0300_0322 =
      rs_R006_ueqv_R006_partial_27_0305 := by
  native_decide

/-- Coefficient term 306 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0306 : Poly :=
[
  term ((48 : Rat) / 5) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 306 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0306 : Poly :=
[
  term ((-96 : Rat) / 5) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((48 : Rat) / 5) [(0, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-96 : Rat) / 5) [(1, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((48 : Rat) / 5) [(1, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((96 : Rat) / 5) [(11, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-48 : Rat) / 5) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-48 : Rat) / 5) [(11, 1), (13, 1), (14, 3), (16, 1)],
  term ((96 : Rat) / 5) [(11, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 306 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0306_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0306
        rs_R006_ueqv_R006_generator_27_0300_0322 =
      rs_R006_ueqv_R006_partial_27_0306 := by
  native_decide

/-- Coefficient term 307 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0307 : Poly :=
[
  term ((-24 : Rat) / 5) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 307 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0307 : Poly :=
[
  term ((48 : Rat) / 5) [(0, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-24 : Rat) / 5) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term ((48 : Rat) / 5) [(1, 1), (11, 1), (13, 2), (16, 1)],
  term ((-24 : Rat) / 5) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term ((-48 : Rat) / 5) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((24 : Rat) / 5) [(11, 1), (13, 1), (14, 2), (16, 1)],
  term ((24 : Rat) / 5) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-48 : Rat) / 5) [(11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 307 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0307_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0307
        rs_R006_ueqv_R006_generator_27_0300_0322 =
      rs_R006_ueqv_R006_partial_27_0307 := by
  native_decide

/-- Coefficient term 308 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0308 : Poly :=
[
  term ((1107 : Rat) / 25) [(11, 1), (15, 1)]
]

/-- Partial product 308 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0308 : Poly :=
[
  term ((-2214 : Rat) / 25) [(0, 1), (11, 1), (12, 1), (15, 1)],
  term ((1107 : Rat) / 25) [(0, 2), (11, 1), (15, 1)],
  term ((-2214 : Rat) / 25) [(1, 1), (11, 1), (13, 1), (15, 1)],
  term ((1107 : Rat) / 25) [(1, 2), (11, 1), (15, 1)],
  term ((2214 : Rat) / 25) [(11, 1), (12, 1), (14, 1), (15, 1)],
  term ((2214 : Rat) / 25) [(11, 1), (13, 1), (15, 2)],
  term ((-1107 : Rat) / 25) [(11, 1), (14, 2), (15, 1)],
  term ((-1107 : Rat) / 25) [(11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 308 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0308_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0308
        rs_R006_ueqv_R006_generator_27_0300_0322 =
      rs_R006_ueqv_R006_partial_27_0308 := by
  native_decide

/-- Coefficient term 309 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0309 : Poly :=
[
  term ((-474 : Rat) / 25) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 309 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0309 : Poly :=
[
  term ((948 : Rat) / 25) [(0, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-474 : Rat) / 25) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((948 : Rat) / 25) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-474 : Rat) / 25) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-948 : Rat) / 25) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-948 : Rat) / 25) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((474 : Rat) / 25) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((474 : Rat) / 25) [(11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 309 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0309_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0309
        rs_R006_ueqv_R006_generator_27_0300_0322 =
      rs_R006_ueqv_R006_partial_27_0309 := by
  native_decide

/-- Coefficient term 310 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0310 : Poly :=
[
  term ((-954 : Rat) / 5) [(11, 2)]
]

/-- Partial product 310 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0310 : Poly :=
[
  term ((1908 : Rat) / 5) [(0, 1), (11, 2), (12, 1)],
  term ((-954 : Rat) / 5) [(0, 2), (11, 2)],
  term ((1908 : Rat) / 5) [(1, 1), (11, 2), (13, 1)],
  term ((-954 : Rat) / 5) [(1, 2), (11, 2)],
  term ((-1908 : Rat) / 5) [(11, 2), (12, 1), (14, 1)],
  term ((-1908 : Rat) / 5) [(11, 2), (13, 1), (15, 1)],
  term ((954 : Rat) / 5) [(11, 2), (14, 2)],
  term ((954 : Rat) / 5) [(11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 310 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0310_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0310
        rs_R006_ueqv_R006_generator_27_0300_0322 =
      rs_R006_ueqv_R006_partial_27_0310 := by
  native_decide

/-- Coefficient term 311 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0311 : Poly :=
[
  term ((726 : Rat) / 5) [(11, 2), (14, 1)]
]

/-- Partial product 311 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0311 : Poly :=
[
  term ((-1452 : Rat) / 5) [(0, 1), (11, 2), (12, 1), (14, 1)],
  term ((726 : Rat) / 5) [(0, 2), (11, 2), (14, 1)],
  term ((-1452 : Rat) / 5) [(1, 1), (11, 2), (13, 1), (14, 1)],
  term ((726 : Rat) / 5) [(1, 2), (11, 2), (14, 1)],
  term ((1452 : Rat) / 5) [(11, 2), (12, 1), (14, 2)],
  term ((1452 : Rat) / 5) [(11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-726 : Rat) / 5) [(11, 2), (14, 1), (15, 2)],
  term ((-726 : Rat) / 5) [(11, 2), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 311 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0311_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0311
        rs_R006_ueqv_R006_generator_27_0300_0322 =
      rs_R006_ueqv_R006_partial_27_0311 := by
  native_decide

/-- Coefficient term 312 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0312 : Poly :=
[
  term (2 : Rat) [(11, 2), (16, 1)]
]

/-- Partial product 312 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0312 : Poly :=
[
  term (-4 : Rat) [(0, 1), (11, 2), (12, 1), (16, 1)],
  term (2 : Rat) [(0, 2), (11, 2), (16, 1)],
  term (-4 : Rat) [(1, 1), (11, 2), (13, 1), (16, 1)],
  term (2 : Rat) [(1, 2), (11, 2), (16, 1)],
  term (4 : Rat) [(11, 2), (12, 1), (14, 1), (16, 1)],
  term (4 : Rat) [(11, 2), (13, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(11, 2), (14, 2), (16, 1)],
  term (-2 : Rat) [(11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 312 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0312_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0312
        rs_R006_ueqv_R006_generator_27_0300_0322 =
      rs_R006_ueqv_R006_partial_27_0312 := by
  native_decide

/-- Coefficient term 313 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0313 : Poly :=
[
  term ((-288 : Rat) / 5) [(12, 1)]
]

/-- Partial product 313 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0313 : Poly :=
[
  term ((576 : Rat) / 5) [(0, 1), (12, 2)],
  term ((-288 : Rat) / 5) [(0, 2), (12, 1)],
  term ((576 : Rat) / 5) [(1, 1), (12, 1), (13, 1)],
  term ((-288 : Rat) / 5) [(1, 2), (12, 1)],
  term ((-576 : Rat) / 5) [(12, 1), (13, 1), (15, 1)],
  term ((288 : Rat) / 5) [(12, 1), (14, 2)],
  term ((288 : Rat) / 5) [(12, 1), (15, 2)],
  term ((-576 : Rat) / 5) [(12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 313 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0313_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0313
        rs_R006_ueqv_R006_generator_27_0300_0322 =
      rs_R006_ueqv_R006_partial_27_0313 := by
  native_decide

/-- Coefficient term 314 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0314 : Poly :=
[
  term ((228 : Rat) / 5) [(12, 1), (14, 1)]
]

/-- Partial product 314 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0314 : Poly :=
[
  term ((-456 : Rat) / 5) [(0, 1), (12, 2), (14, 1)],
  term ((228 : Rat) / 5) [(0, 2), (12, 1), (14, 1)],
  term ((-456 : Rat) / 5) [(1, 1), (12, 1), (13, 1), (14, 1)],
  term ((228 : Rat) / 5) [(1, 2), (12, 1), (14, 1)],
  term ((456 : Rat) / 5) [(12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-228 : Rat) / 5) [(12, 1), (14, 1), (15, 2)],
  term ((-228 : Rat) / 5) [(12, 1), (14, 3)],
  term ((456 : Rat) / 5) [(12, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 314 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0314_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0314
        rs_R006_ueqv_R006_generator_27_0300_0322 =
      rs_R006_ueqv_R006_partial_27_0314 := by
  native_decide

/-- Coefficient term 315 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0315 : Poly :=
[
  term ((-2259 : Rat) / 25) [(13, 1), (15, 1)]
]

/-- Partial product 315 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0315 : Poly :=
[
  term ((4518 : Rat) / 25) [(0, 1), (12, 1), (13, 1), (15, 1)],
  term ((-2259 : Rat) / 25) [(0, 2), (13, 1), (15, 1)],
  term ((4518 : Rat) / 25) [(1, 1), (13, 2), (15, 1)],
  term ((-2259 : Rat) / 25) [(1, 2), (13, 1), (15, 1)],
  term ((-4518 : Rat) / 25) [(12, 1), (13, 1), (14, 1), (15, 1)],
  term ((2259 : Rat) / 25) [(13, 1), (14, 2), (15, 1)],
  term ((2259 : Rat) / 25) [(13, 1), (15, 3)],
  term ((-4518 : Rat) / 25) [(13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 315 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0315_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0315
        rs_R006_ueqv_R006_generator_27_0300_0322 =
      rs_R006_ueqv_R006_partial_27_0315 := by
  native_decide

/-- Coefficient term 316 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0316 : Poly :=
[
  term ((738 : Rat) / 25) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 316 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0316 : Poly :=
[
  term ((-1476 : Rat) / 25) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((738 : Rat) / 25) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1476 : Rat) / 25) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((738 : Rat) / 25) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((1476 : Rat) / 25) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-738 : Rat) / 25) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-738 : Rat) / 25) [(13, 1), (15, 3), (16, 1)],
  term ((1476 : Rat) / 25) [(13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 316 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0316_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0316
        rs_R006_ueqv_R006_generator_27_0300_0322 =
      rs_R006_ueqv_R006_partial_27_0316 := by
  native_decide

/-- Coefficient term 317 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0317 : Poly :=
[
  term ((-1566 : Rat) / 35) [(13, 2)]
]

/-- Partial product 317 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0317 : Poly :=
[
  term ((3132 : Rat) / 35) [(0, 1), (12, 1), (13, 2)],
  term ((-1566 : Rat) / 35) [(0, 2), (13, 2)],
  term ((3132 : Rat) / 35) [(1, 1), (13, 3)],
  term ((-1566 : Rat) / 35) [(1, 2), (13, 2)],
  term ((-3132 : Rat) / 35) [(12, 1), (13, 2), (14, 1)],
  term ((1566 : Rat) / 35) [(13, 2), (14, 2)],
  term ((1566 : Rat) / 35) [(13, 2), (15, 2)],
  term ((-3132 : Rat) / 35) [(13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 317 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0317_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0317
        rs_R006_ueqv_R006_generator_27_0300_0322 =
      rs_R006_ueqv_R006_partial_27_0317 := by
  native_decide

/-- Coefficient term 318 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0318 : Poly :=
[
  term ((432 : Rat) / 5) [(13, 2), (14, 1)]
]

/-- Partial product 318 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0318 : Poly :=
[
  term ((-864 : Rat) / 5) [(0, 1), (12, 1), (13, 2), (14, 1)],
  term ((432 : Rat) / 5) [(0, 2), (13, 2), (14, 1)],
  term ((-864 : Rat) / 5) [(1, 1), (13, 3), (14, 1)],
  term ((432 : Rat) / 5) [(1, 2), (13, 2), (14, 1)],
  term ((864 : Rat) / 5) [(12, 1), (13, 2), (14, 2)],
  term ((-432 : Rat) / 5) [(13, 2), (14, 1), (15, 2)],
  term ((-432 : Rat) / 5) [(13, 2), (14, 3)],
  term ((864 : Rat) / 5) [(13, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 318 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0318_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0318
        rs_R006_ueqv_R006_generator_27_0300_0322 =
      rs_R006_ueqv_R006_partial_27_0318 := by
  native_decide

/-- Coefficient term 319 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0319 : Poly :=
[
  term ((-144 : Rat) / 5) [(13, 2), (14, 1), (16, 1)]
]

/-- Partial product 319 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0319 : Poly :=
[
  term ((288 : Rat) / 5) [(0, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-144 : Rat) / 5) [(0, 2), (13, 2), (14, 1), (16, 1)],
  term ((288 : Rat) / 5) [(1, 1), (13, 3), (14, 1), (16, 1)],
  term ((-144 : Rat) / 5) [(1, 2), (13, 2), (14, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(12, 1), (13, 2), (14, 2), (16, 1)],
  term ((144 : Rat) / 5) [(13, 2), (14, 1), (15, 2), (16, 1)],
  term ((144 : Rat) / 5) [(13, 2), (14, 3), (16, 1)],
  term ((-288 : Rat) / 5) [(13, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 319 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0319_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0319
        rs_R006_ueqv_R006_generator_27_0300_0322 =
      rs_R006_ueqv_R006_partial_27_0319 := by
  native_decide

/-- Coefficient term 320 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0320 : Poly :=
[
  term ((72 : Rat) / 5) [(13, 2), (16, 1)]
]

/-- Partial product 320 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0320 : Poly :=
[
  term ((-144 : Rat) / 5) [(0, 1), (12, 1), (13, 2), (16, 1)],
  term ((72 : Rat) / 5) [(0, 2), (13, 2), (16, 1)],
  term ((-144 : Rat) / 5) [(1, 1), (13, 3), (16, 1)],
  term ((72 : Rat) / 5) [(1, 2), (13, 2), (16, 1)],
  term ((144 : Rat) / 5) [(12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-72 : Rat) / 5) [(13, 2), (14, 2), (16, 1)],
  term ((-72 : Rat) / 5) [(13, 2), (15, 2), (16, 1)],
  term ((144 : Rat) / 5) [(13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 320 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0320_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0320
        rs_R006_ueqv_R006_generator_27_0300_0322 =
      rs_R006_ueqv_R006_partial_27_0320 := by
  native_decide

/-- Coefficient term 321 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0321 : Poly :=
[
  term ((-168 : Rat) / 5) [(14, 1)]
]

/-- Partial product 321 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0321 : Poly :=
[
  term ((336 : Rat) / 5) [(0, 1), (12, 1), (14, 1)],
  term ((-168 : Rat) / 5) [(0, 2), (14, 1)],
  term ((336 : Rat) / 5) [(1, 1), (13, 1), (14, 1)],
  term ((-168 : Rat) / 5) [(1, 2), (14, 1)],
  term ((-336 : Rat) / 5) [(12, 1), (14, 2)],
  term ((-336 : Rat) / 5) [(13, 1), (14, 1), (15, 1)],
  term ((168 : Rat) / 5) [(14, 1), (15, 2)],
  term ((168 : Rat) / 5) [(14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 321 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0321_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0321
        rs_R006_ueqv_R006_generator_27_0300_0322 =
      rs_R006_ueqv_R006_partial_27_0321 := by
  native_decide

/-- Coefficient term 322 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0322 : Poly :=
[
  term ((-6 : Rat) / 5) [(15, 2)]
]

/-- Partial product 322 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0322 : Poly :=
[
  term ((12 : Rat) / 5) [(0, 1), (12, 1), (15, 2)],
  term ((-6 : Rat) / 5) [(0, 2), (15, 2)],
  term ((12 : Rat) / 5) [(1, 1), (13, 1), (15, 2)],
  term ((-6 : Rat) / 5) [(1, 2), (15, 2)],
  term ((-12 : Rat) / 5) [(12, 1), (14, 1), (15, 2)],
  term ((-12 : Rat) / 5) [(13, 1), (15, 3)],
  term ((6 : Rat) / 5) [(14, 2), (15, 2)],
  term ((6 : Rat) / 5) [(15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 322 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0322_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0322
        rs_R006_ueqv_R006_generator_27_0300_0322 =
      rs_R006_ueqv_R006_partial_27_0322 := by
  native_decide

/-- Partial products in this block. -/
def rs_R006_ueqv_R006_partials_27_0300_0322 : List Poly :=
[
  rs_R006_ueqv_R006_partial_27_0300,
  rs_R006_ueqv_R006_partial_27_0301,
  rs_R006_ueqv_R006_partial_27_0302,
  rs_R006_ueqv_R006_partial_27_0303,
  rs_R006_ueqv_R006_partial_27_0304,
  rs_R006_ueqv_R006_partial_27_0305,
  rs_R006_ueqv_R006_partial_27_0306,
  rs_R006_ueqv_R006_partial_27_0307,
  rs_R006_ueqv_R006_partial_27_0308,
  rs_R006_ueqv_R006_partial_27_0309,
  rs_R006_ueqv_R006_partial_27_0310,
  rs_R006_ueqv_R006_partial_27_0311,
  rs_R006_ueqv_R006_partial_27_0312,
  rs_R006_ueqv_R006_partial_27_0313,
  rs_R006_ueqv_R006_partial_27_0314,
  rs_R006_ueqv_R006_partial_27_0315,
  rs_R006_ueqv_R006_partial_27_0316,
  rs_R006_ueqv_R006_partial_27_0317,
  rs_R006_ueqv_R006_partial_27_0318,
  rs_R006_ueqv_R006_partial_27_0319,
  rs_R006_ueqv_R006_partial_27_0320,
  rs_R006_ueqv_R006_partial_27_0321,
  rs_R006_ueqv_R006_partial_27_0322
]

/-- Sum of partial products in this block. -/
def rs_R006_ueqv_R006_block_27_0300_0322 : Poly :=
[
  term ((-3396 : Rat) / 7) [(0, 1), (11, 1), (12, 1), (13, 1)],
  term ((2112 : Rat) / 5) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-96 : Rat) / 5) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((48 : Rat) / 5) [(0, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-2214 : Rat) / 25) [(0, 1), (11, 1), (12, 1), (15, 1)],
  term ((948 : Rat) / 25) [(0, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-576 : Rat) / 5) [(0, 1), (11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((288 : Rat) / 5) [(0, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-8124 : Rat) / 25) [(0, 1), (11, 1), (12, 2), (15, 1)],
  term ((2568 : Rat) / 25) [(0, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((1908 : Rat) / 5) [(0, 1), (11, 2), (12, 1)],
  term ((-1452 : Rat) / 5) [(0, 1), (11, 2), (12, 1), (14, 1)],
  term (-4 : Rat) [(0, 1), (11, 2), (12, 1), (16, 1)],
  term ((4518 : Rat) / 25) [(0, 1), (12, 1), (13, 1), (15, 1)],
  term ((-1476 : Rat) / 25) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((3132 : Rat) / 35) [(0, 1), (12, 1), (13, 2)],
  term ((-864 : Rat) / 5) [(0, 1), (12, 1), (13, 2), (14, 1)],
  term ((288 : Rat) / 5) [(0, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-144 : Rat) / 5) [(0, 1), (12, 1), (13, 2), (16, 1)],
  term ((336 : Rat) / 5) [(0, 1), (12, 1), (14, 1)],
  term ((12 : Rat) / 5) [(0, 1), (12, 1), (15, 2)],
  term ((576 : Rat) / 5) [(0, 1), (12, 2)],
  term ((-456 : Rat) / 5) [(0, 1), (12, 2), (14, 1)],
  term ((288 : Rat) / 5) [(0, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-144 : Rat) / 5) [(0, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((4062 : Rat) / 25) [(0, 2), (11, 1), (12, 1), (15, 1)],
  term ((-1284 : Rat) / 25) [(0, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1698 : Rat) / 7) [(0, 2), (11, 1), (13, 1)],
  term ((-1056 : Rat) / 5) [(0, 2), (11, 1), (13, 1), (14, 1)],
  term ((48 : Rat) / 5) [(0, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-24 : Rat) / 5) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term ((1107 : Rat) / 25) [(0, 2), (11, 1), (15, 1)],
  term ((-474 : Rat) / 25) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((-954 : Rat) / 5) [(0, 2), (11, 2)],
  term ((726 : Rat) / 5) [(0, 2), (11, 2), (14, 1)],
  term (2 : Rat) [(0, 2), (11, 2), (16, 1)],
  term ((-288 : Rat) / 5) [(0, 2), (12, 1)],
  term ((228 : Rat) / 5) [(0, 2), (12, 1), (14, 1)],
  term ((-2259 : Rat) / 25) [(0, 2), (13, 1), (15, 1)],
  term ((738 : Rat) / 25) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1566 : Rat) / 35) [(0, 2), (13, 2)],
  term ((432 : Rat) / 5) [(0, 2), (13, 2), (14, 1)],
  term ((-144 : Rat) / 5) [(0, 2), (13, 2), (14, 1), (16, 1)],
  term ((72 : Rat) / 5) [(0, 2), (13, 2), (16, 1)],
  term ((-168 : Rat) / 5) [(0, 2), (14, 1)],
  term ((-6 : Rat) / 5) [(0, 2), (15, 2)],
  term ((-8124 : Rat) / 25) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((2568 : Rat) / 25) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-576 : Rat) / 5) [(1, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((288 : Rat) / 5) [(1, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-2214 : Rat) / 25) [(1, 1), (11, 1), (13, 1), (15, 1)],
  term ((948 : Rat) / 25) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3396 : Rat) / 7) [(1, 1), (11, 1), (13, 2)],
  term ((2112 : Rat) / 5) [(1, 1), (11, 1), (13, 2), (14, 1)],
  term ((-96 : Rat) / 5) [(1, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((48 : Rat) / 5) [(1, 1), (11, 1), (13, 2), (16, 1)],
  term ((1908 : Rat) / 5) [(1, 1), (11, 2), (13, 1)],
  term ((-1452 : Rat) / 5) [(1, 1), (11, 2), (13, 1), (14, 1)],
  term (-4 : Rat) [(1, 1), (11, 2), (13, 1), (16, 1)],
  term ((576 : Rat) / 5) [(1, 1), (12, 1), (13, 1)],
  term ((-456 : Rat) / 5) [(1, 1), (12, 1), (13, 1), (14, 1)],
  term ((336 : Rat) / 5) [(1, 1), (13, 1), (14, 1)],
  term ((12 : Rat) / 5) [(1, 1), (13, 1), (15, 2)],
  term ((4518 : Rat) / 25) [(1, 1), (13, 2), (15, 1)],
  term ((-1476 : Rat) / 25) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((3132 : Rat) / 35) [(1, 1), (13, 3)],
  term ((-864 : Rat) / 5) [(1, 1), (13, 3), (14, 1)],
  term ((288 : Rat) / 5) [(1, 1), (13, 3), (14, 1), (16, 1)],
  term ((-144 : Rat) / 5) [(1, 1), (13, 3), (16, 1)],
  term ((288 : Rat) / 5) [(1, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-144 : Rat) / 5) [(1, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((4062 : Rat) / 25) [(1, 2), (11, 1), (12, 1), (15, 1)],
  term ((-1284 : Rat) / 25) [(1, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1698 : Rat) / 7) [(1, 2), (11, 1), (13, 1)],
  term ((-1056 : Rat) / 5) [(1, 2), (11, 1), (13, 1), (14, 1)],
  term ((48 : Rat) / 5) [(1, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-24 : Rat) / 5) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term ((1107 : Rat) / 25) [(1, 2), (11, 1), (15, 1)],
  term ((-474 : Rat) / 25) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-954 : Rat) / 5) [(1, 2), (11, 2)],
  term ((726 : Rat) / 5) [(1, 2), (11, 2), (14, 1)],
  term (2 : Rat) [(1, 2), (11, 2), (16, 1)],
  term ((-288 : Rat) / 5) [(1, 2), (12, 1)],
  term ((228 : Rat) / 5) [(1, 2), (12, 1), (14, 1)],
  term ((-2259 : Rat) / 25) [(1, 2), (13, 1), (15, 1)],
  term ((738 : Rat) / 25) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1566 : Rat) / 35) [(1, 2), (13, 2)],
  term ((432 : Rat) / 5) [(1, 2), (13, 2), (14, 1)],
  term ((-144 : Rat) / 5) [(1, 2), (13, 2), (14, 1), (16, 1)],
  term ((72 : Rat) / 5) [(1, 2), (13, 2), (16, 1)],
  term ((-168 : Rat) / 5) [(1, 2), (14, 1)],
  term ((-6 : Rat) / 5) [(1, 2), (15, 2)],
  term ((3396 : Rat) / 7) [(11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-288 : Rat) / 5) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-48 : Rat) / 5) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2112 : Rat) / 5) [(11, 1), (12, 1), (13, 1), (14, 2)],
  term (48 : Rat) [(11, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-288 : Rat) / 5) [(11, 1), (12, 1), (13, 1), (14, 3), (16, 1)],
  term ((8124 : Rat) / 25) [(11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-1848 : Rat) / 25) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((576 : Rat) / 5) [(11, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((2214 : Rat) / 25) [(11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-948 : Rat) / 25) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4062 : Rat) / 25) [(11, 1), (12, 1), (14, 2), (15, 1)],
  term ((1284 : Rat) / 25) [(11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-4062 : Rat) / 25) [(11, 1), (12, 1), (15, 3)],
  term ((1284 : Rat) / 25) [(11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-288 : Rat) / 5) [(11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((576 : Rat) / 5) [(11, 1), (12, 2), (13, 1), (14, 2), (16, 1)],
  term ((8124 : Rat) / 25) [(11, 1), (12, 2), (14, 1), (15, 1)],
  term ((-2568 : Rat) / 25) [(11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((1056 : Rat) / 5) [(11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-48 : Rat) / 5) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1698 : Rat) / 7) [(11, 1), (13, 1), (14, 2)],
  term ((24 : Rat) / 5) [(11, 1), (13, 1), (14, 2), (16, 1)],
  term ((1056 : Rat) / 5) [(11, 1), (13, 1), (14, 3)],
  term ((-48 : Rat) / 5) [(11, 1), (13, 1), (14, 3), (16, 1)],
  term ((-26952 : Rat) / 175) [(11, 1), (13, 1), (15, 2)],
  term ((-828 : Rat) / 25) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2112 : Rat) / 5) [(11, 1), (13, 2), (14, 1), (15, 1)],
  term ((96 : Rat) / 5) [(11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((3396 : Rat) / 7) [(11, 1), (13, 2), (15, 1)],
  term ((-48 : Rat) / 5) [(11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1107 : Rat) / 25) [(11, 1), (14, 2), (15, 1)],
  term ((474 : Rat) / 25) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1107 : Rat) / 25) [(11, 1), (15, 3)],
  term ((474 : Rat) / 25) [(11, 1), (15, 3), (16, 1)],
  term ((-1908 : Rat) / 5) [(11, 2), (12, 1), (14, 1)],
  term (4 : Rat) [(11, 2), (12, 1), (14, 1), (16, 1)],
  term ((1452 : Rat) / 5) [(11, 2), (12, 1), (14, 2)],
  term ((1452 : Rat) / 5) [(11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-1908 : Rat) / 5) [(11, 2), (13, 1), (15, 1)],
  term (4 : Rat) [(11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-726 : Rat) / 5) [(11, 2), (14, 1), (15, 2)],
  term ((954 : Rat) / 5) [(11, 2), (14, 2)],
  term (-2 : Rat) [(11, 2), (14, 2), (16, 1)],
  term ((-726 : Rat) / 5) [(11, 2), (14, 3)],
  term ((954 : Rat) / 5) [(11, 2), (15, 2)],
  term (-2 : Rat) [(11, 2), (15, 2), (16, 1)],
  term ((-2238 : Rat) / 25) [(12, 1), (13, 1), (14, 1), (15, 1)],
  term ((1476 : Rat) / 25) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-576 : Rat) / 5) [(12, 1), (13, 1), (15, 1)],
  term ((-3132 : Rat) / 35) [(12, 1), (13, 2), (14, 1)],
  term ((144 : Rat) / 5) [(12, 1), (13, 2), (14, 1), (16, 1)],
  term ((864 : Rat) / 5) [(12, 1), (13, 2), (14, 2)],
  term ((-288 : Rat) / 5) [(12, 1), (13, 2), (14, 2), (16, 1)],
  term (-48 : Rat) [(12, 1), (14, 1), (15, 2)],
  term ((-48 : Rat) / 5) [(12, 1), (14, 2)],
  term ((-228 : Rat) / 5) [(12, 1), (14, 3)],
  term ((288 : Rat) / 5) [(12, 1), (15, 2)],
  term ((-576 : Rat) / 5) [(12, 2), (14, 1)],
  term ((456 : Rat) / 5) [(12, 2), (14, 2)],
  term ((-336 : Rat) / 5) [(13, 1), (14, 1), (15, 1)],
  term ((2259 : Rat) / 25) [(13, 1), (14, 2), (15, 1)],
  term ((-738 : Rat) / 25) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((2199 : Rat) / 25) [(13, 1), (15, 3)],
  term ((-738 : Rat) / 25) [(13, 1), (15, 3), (16, 1)],
  term ((-432 : Rat) / 5) [(13, 2), (14, 1), (15, 2)],
  term ((144 : Rat) / 5) [(13, 2), (14, 1), (15, 2), (16, 1)],
  term ((1566 : Rat) / 35) [(13, 2), (14, 2)],
  term ((-72 : Rat) / 5) [(13, 2), (14, 2), (16, 1)],
  term ((-432 : Rat) / 5) [(13, 2), (14, 3)],
  term ((144 : Rat) / 5) [(13, 2), (14, 3), (16, 1)],
  term ((-23796 : Rat) / 175) [(13, 2), (15, 2)],
  term ((1116 : Rat) / 25) [(13, 2), (15, 2), (16, 1)],
  term ((864 : Rat) / 5) [(13, 3), (14, 1), (15, 1)],
  term ((-288 : Rat) / 5) [(13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-3132 : Rat) / 35) [(13, 3), (15, 1)],
  term ((144 : Rat) / 5) [(13, 3), (15, 1), (16, 1)],
  term ((168 : Rat) / 5) [(14, 1), (15, 2)],
  term ((6 : Rat) / 5) [(14, 2), (15, 2)],
  term ((168 : Rat) / 5) [(14, 3)],
  term ((6 : Rat) / 5) [(15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 27, terms 300 through 322. -/
theorem rs_R006_ueqv_R006_block_27_0300_0322_valid :
    checkProductSumEq rs_R006_ueqv_R006_partials_27_0300_0322
      rs_R006_ueqv_R006_block_27_0300_0322 = true := by
  native_decide

end R006UeqvR006TermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
