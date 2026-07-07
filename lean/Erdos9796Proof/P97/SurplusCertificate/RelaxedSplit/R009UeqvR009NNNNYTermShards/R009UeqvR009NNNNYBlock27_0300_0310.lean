/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NNNNY, term block 27:300-310

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NNNNYTermShards

/-- Generator polynomial 27 for relaxed split surplus certificate `R009:u=v:R009NNNNY`. -/
def rs_R009_ueqv_R009NNNNY_generator_27_0300_0310 : Poly :=
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
def rs_R009_ueqv_R009NNNNY_coefficient_27_0300 : Poly :=
[
  term ((3 : Rat) / 4) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 300 for generator 27. -/
def rs_R009_ueqv_R009NNNNY_partial_27_0300 : Poly :=
[
  term ((-3 : Rat) / 2) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((3 : Rat) / 4) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((3 : Rat) / 4) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((3 : Rat) / 2) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3 : Rat) / 4) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3 : Rat) / 4) [(13, 1), (15, 3), (16, 1)],
  term ((3 : Rat) / 2) [(13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 300 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNY_partial_27_0300_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_27_0300
        rs_R009_ueqv_R009NNNNY_generator_27_0300_0310 =
      rs_R009_ueqv_R009NNNNY_partial_27_0300 := by
  native_decide

/-- Coefficient term 301 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNY_coefficient_27_0301 : Poly :=
[
  term ((-16 : Rat) / 31) [(13, 1), (15, 3), (16, 1)]
]

/-- Partial product 301 for generator 27. -/
def rs_R009_ueqv_R009NNNNY_partial_27_0301 : Poly :=
[
  term ((32 : Rat) / 31) [(0, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-16 : Rat) / 31) [(0, 2), (13, 1), (15, 3), (16, 1)],
  term ((32 : Rat) / 31) [(1, 1), (13, 2), (15, 3), (16, 1)],
  term ((-16 : Rat) / 31) [(1, 2), (13, 1), (15, 3), (16, 1)],
  term ((-32 : Rat) / 31) [(12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((16 : Rat) / 31) [(13, 1), (14, 2), (15, 3), (16, 1)],
  term ((16 : Rat) / 31) [(13, 1), (15, 5), (16, 1)],
  term ((-32 : Rat) / 31) [(13, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 301 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNY_partial_27_0301_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_27_0301
        rs_R009_ueqv_R009NNNNY_generator_27_0300_0310 =
      rs_R009_ueqv_R009NNNNY_partial_27_0301 := by
  native_decide

/-- Coefficient term 302 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNY_coefficient_27_0302 : Poly :=
[
  term ((-100 : Rat) / 93) [(13, 2), (14, 1), (16, 1)]
]

/-- Partial product 302 for generator 27. -/
def rs_R009_ueqv_R009NNNNY_partial_27_0302 : Poly :=
[
  term ((200 : Rat) / 93) [(0, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-100 : Rat) / 93) [(0, 2), (13, 2), (14, 1), (16, 1)],
  term ((200 : Rat) / 93) [(1, 1), (13, 3), (14, 1), (16, 1)],
  term ((-100 : Rat) / 93) [(1, 2), (13, 2), (14, 1), (16, 1)],
  term ((-200 : Rat) / 93) [(12, 1), (13, 2), (14, 2), (16, 1)],
  term ((100 : Rat) / 93) [(13, 2), (14, 1), (15, 2), (16, 1)],
  term ((100 : Rat) / 93) [(13, 2), (14, 3), (16, 1)],
  term ((-200 : Rat) / 93) [(13, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 302 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNY_partial_27_0302_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_27_0302
        rs_R009_ueqv_R009NNNNY_generator_27_0300_0310 =
      rs_R009_ueqv_R009NNNNY_partial_27_0302 := by
  native_decide

/-- Coefficient term 303 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNY_coefficient_27_0303 : Poly :=
[
  term ((76 : Rat) / 93) [(13, 2), (16, 1)]
]

/-- Partial product 303 for generator 27. -/
def rs_R009_ueqv_R009NNNNY_partial_27_0303 : Poly :=
[
  term ((-152 : Rat) / 93) [(0, 1), (12, 1), (13, 2), (16, 1)],
  term ((76 : Rat) / 93) [(0, 2), (13, 2), (16, 1)],
  term ((-152 : Rat) / 93) [(1, 1), (13, 3), (16, 1)],
  term ((76 : Rat) / 93) [(1, 2), (13, 2), (16, 1)],
  term ((152 : Rat) / 93) [(12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-76 : Rat) / 93) [(13, 2), (14, 2), (16, 1)],
  term ((-76 : Rat) / 93) [(13, 2), (15, 2), (16, 1)],
  term ((152 : Rat) / 93) [(13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 303 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNY_partial_27_0303_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_27_0303
        rs_R009_ueqv_R009NNNNY_generator_27_0300_0310 =
      rs_R009_ueqv_R009NNNNY_partial_27_0303 := by
  native_decide

/-- Coefficient term 304 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNY_coefficient_27_0304 : Poly :=
[
  term ((-12 : Rat) / 31) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 304 for generator 27. -/
def rs_R009_ueqv_R009NNNNY_partial_27_0304 : Poly :=
[
  term ((24 : Rat) / 31) [(0, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-12 : Rat) / 31) [(0, 2), (14, 1), (15, 2), (16, 1)],
  term ((24 : Rat) / 31) [(1, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-12 : Rat) / 31) [(1, 2), (14, 1), (15, 2), (16, 1)],
  term ((-24 : Rat) / 31) [(12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-24 : Rat) / 31) [(13, 1), (14, 1), (15, 3), (16, 1)],
  term ((12 : Rat) / 31) [(14, 1), (15, 4), (16, 1)],
  term ((12 : Rat) / 31) [(14, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 304 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNY_partial_27_0304_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_27_0304
        rs_R009_ueqv_R009NNNNY_generator_27_0300_0310 =
      rs_R009_ueqv_R009NNNNY_partial_27_0304 := by
  native_decide

/-- Coefficient term 305 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNY_coefficient_27_0305 : Poly :=
[
  term ((1307 : Rat) / 93) [(14, 1), (16, 1)]
]

/-- Partial product 305 for generator 27. -/
def rs_R009_ueqv_R009NNNNY_partial_27_0305 : Poly :=
[
  term ((-2614 : Rat) / 93) [(0, 1), (12, 1), (14, 1), (16, 1)],
  term ((1307 : Rat) / 93) [(0, 2), (14, 1), (16, 1)],
  term ((-2614 : Rat) / 93) [(1, 1), (13, 1), (14, 1), (16, 1)],
  term ((1307 : Rat) / 93) [(1, 2), (14, 1), (16, 1)],
  term ((2614 : Rat) / 93) [(12, 1), (14, 2), (16, 1)],
  term ((2614 : Rat) / 93) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1307 : Rat) / 93) [(14, 1), (15, 2), (16, 1)],
  term ((-1307 : Rat) / 93) [(14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 305 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNY_partial_27_0305_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_27_0305
        rs_R009_ueqv_R009NNNNY_generator_27_0300_0310 =
      rs_R009_ueqv_R009NNNNY_partial_27_0305 := by
  native_decide

/-- Coefficient term 306 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNY_coefficient_27_0306 : Poly :=
[
  term ((8 : Rat) / 31) [(14, 2), (15, 2), (16, 1)]
]

/-- Partial product 306 for generator 27. -/
def rs_R009_ueqv_R009NNNNY_partial_27_0306 : Poly :=
[
  term ((-16 : Rat) / 31) [(0, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((8 : Rat) / 31) [(0, 2), (14, 2), (15, 2), (16, 1)],
  term ((-16 : Rat) / 31) [(1, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((8 : Rat) / 31) [(1, 2), (14, 2), (15, 2), (16, 1)],
  term ((16 : Rat) / 31) [(12, 1), (14, 3), (15, 2), (16, 1)],
  term ((16 : Rat) / 31) [(13, 1), (14, 2), (15, 3), (16, 1)],
  term ((-8 : Rat) / 31) [(14, 2), (15, 4), (16, 1)],
  term ((-8 : Rat) / 31) [(14, 4), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 306 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNY_partial_27_0306_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_27_0306
        rs_R009_ueqv_R009NNNNY_generator_27_0300_0310 =
      rs_R009_ueqv_R009NNNNY_partial_27_0306 := by
  native_decide

/-- Coefficient term 307 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNY_coefficient_27_0307 : Poly :=
[
  term ((-2149 : Rat) / 186) [(14, 2), (16, 1)]
]

/-- Partial product 307 for generator 27. -/
def rs_R009_ueqv_R009NNNNY_partial_27_0307 : Poly :=
[
  term ((2149 : Rat) / 93) [(0, 1), (12, 1), (14, 2), (16, 1)],
  term ((-2149 : Rat) / 186) [(0, 2), (14, 2), (16, 1)],
  term ((2149 : Rat) / 93) [(1, 1), (13, 1), (14, 2), (16, 1)],
  term ((-2149 : Rat) / 186) [(1, 2), (14, 2), (16, 1)],
  term ((-2149 : Rat) / 93) [(12, 1), (14, 3), (16, 1)],
  term ((-2149 : Rat) / 93) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((2149 : Rat) / 186) [(14, 2), (15, 2), (16, 1)],
  term ((2149 : Rat) / 186) [(14, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 307 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNY_partial_27_0307_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_27_0307
        rs_R009_ueqv_R009NNNNY_generator_27_0300_0310 =
      rs_R009_ueqv_R009NNNNY_partial_27_0307 := by
  native_decide

/-- Coefficient term 308 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNY_coefficient_27_0308 : Poly :=
[
  term ((-463 : Rat) / 31) [(15, 2), (16, 1)]
]

/-- Partial product 308 for generator 27. -/
def rs_R009_ueqv_R009NNNNY_partial_27_0308 : Poly :=
[
  term ((926 : Rat) / 31) [(0, 1), (12, 1), (15, 2), (16, 1)],
  term ((-463 : Rat) / 31) [(0, 2), (15, 2), (16, 1)],
  term ((926 : Rat) / 31) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((-463 : Rat) / 31) [(1, 2), (15, 2), (16, 1)],
  term ((-926 : Rat) / 31) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-926 : Rat) / 31) [(13, 1), (15, 3), (16, 1)],
  term ((463 : Rat) / 31) [(14, 2), (15, 2), (16, 1)],
  term ((463 : Rat) / 31) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 308 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNY_partial_27_0308_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_27_0308
        rs_R009_ueqv_R009NNNNY_generator_27_0300_0310 =
      rs_R009_ueqv_R009NNNNY_partial_27_0308 := by
  native_decide

/-- Coefficient term 309 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNY_coefficient_27_0309 : Poly :=
[
  term ((8 : Rat) / 31) [(15, 4), (16, 1)]
]

/-- Partial product 309 for generator 27. -/
def rs_R009_ueqv_R009NNNNY_partial_27_0309 : Poly :=
[
  term ((-16 : Rat) / 31) [(0, 1), (12, 1), (15, 4), (16, 1)],
  term ((8 : Rat) / 31) [(0, 2), (15, 4), (16, 1)],
  term ((-16 : Rat) / 31) [(1, 1), (13, 1), (15, 4), (16, 1)],
  term ((8 : Rat) / 31) [(1, 2), (15, 4), (16, 1)],
  term ((16 : Rat) / 31) [(12, 1), (14, 1), (15, 4), (16, 1)],
  term ((16 : Rat) / 31) [(13, 1), (15, 5), (16, 1)],
  term ((-8 : Rat) / 31) [(14, 2), (15, 4), (16, 1)],
  term ((-8 : Rat) / 31) [(15, 6), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 309 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNY_partial_27_0309_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_27_0309
        rs_R009_ueqv_R009NNNNY_generator_27_0300_0310 =
      rs_R009_ueqv_R009NNNNY_partial_27_0309 := by
  native_decide

/-- Coefficient term 310 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNY_coefficient_27_0310 : Poly :=
[
  term ((-569 : Rat) / 124) [(16, 1)]
]

/-- Partial product 310 for generator 27. -/
def rs_R009_ueqv_R009NNNNY_partial_27_0310 : Poly :=
[
  term ((569 : Rat) / 62) [(0, 1), (12, 1), (16, 1)],
  term ((-569 : Rat) / 124) [(0, 2), (16, 1)],
  term ((569 : Rat) / 62) [(1, 1), (13, 1), (16, 1)],
  term ((-569 : Rat) / 124) [(1, 2), (16, 1)],
  term ((-569 : Rat) / 62) [(12, 1), (14, 1), (16, 1)],
  term ((-569 : Rat) / 62) [(13, 1), (15, 1), (16, 1)],
  term ((569 : Rat) / 124) [(14, 2), (16, 1)],
  term ((569 : Rat) / 124) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 310 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNY_partial_27_0310_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_27_0310
        rs_R009_ueqv_R009NNNNY_generator_27_0300_0310 =
      rs_R009_ueqv_R009NNNNY_partial_27_0310 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NNNNY_partials_27_0300_0310 : List Poly :=
[
  rs_R009_ueqv_R009NNNNY_partial_27_0300,
  rs_R009_ueqv_R009NNNNY_partial_27_0301,
  rs_R009_ueqv_R009NNNNY_partial_27_0302,
  rs_R009_ueqv_R009NNNNY_partial_27_0303,
  rs_R009_ueqv_R009NNNNY_partial_27_0304,
  rs_R009_ueqv_R009NNNNY_partial_27_0305,
  rs_R009_ueqv_R009NNNNY_partial_27_0306,
  rs_R009_ueqv_R009NNNNY_partial_27_0307,
  rs_R009_ueqv_R009NNNNY_partial_27_0308,
  rs_R009_ueqv_R009NNNNY_partial_27_0309,
  rs_R009_ueqv_R009NNNNY_partial_27_0310
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NNNNY_block_27_0300_0310 : Poly :=
[
  term ((-3 : Rat) / 2) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 31) [(0, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((200 : Rat) / 93) [(0, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-152 : Rat) / 93) [(0, 1), (12, 1), (13, 2), (16, 1)],
  term ((24 : Rat) / 31) [(0, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2614 : Rat) / 93) [(0, 1), (12, 1), (14, 1), (16, 1)],
  term ((-16 : Rat) / 31) [(0, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((2149 : Rat) / 93) [(0, 1), (12, 1), (14, 2), (16, 1)],
  term ((926 : Rat) / 31) [(0, 1), (12, 1), (15, 2), (16, 1)],
  term ((-16 : Rat) / 31) [(0, 1), (12, 1), (15, 4), (16, 1)],
  term ((569 : Rat) / 62) [(0, 1), (12, 1), (16, 1)],
  term ((3 : Rat) / 4) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 31) [(0, 2), (13, 1), (15, 3), (16, 1)],
  term ((-100 : Rat) / 93) [(0, 2), (13, 2), (14, 1), (16, 1)],
  term ((76 : Rat) / 93) [(0, 2), (13, 2), (16, 1)],
  term ((-12 : Rat) / 31) [(0, 2), (14, 1), (15, 2), (16, 1)],
  term ((1307 : Rat) / 93) [(0, 2), (14, 1), (16, 1)],
  term ((8 : Rat) / 31) [(0, 2), (14, 2), (15, 2), (16, 1)],
  term ((-2149 : Rat) / 186) [(0, 2), (14, 2), (16, 1)],
  term ((-463 : Rat) / 31) [(0, 2), (15, 2), (16, 1)],
  term ((8 : Rat) / 31) [(0, 2), (15, 4), (16, 1)],
  term ((-569 : Rat) / 124) [(0, 2), (16, 1)],
  term ((24 : Rat) / 31) [(1, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2614 : Rat) / 93) [(1, 1), (13, 1), (14, 1), (16, 1)],
  term ((-16 : Rat) / 31) [(1, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((2149 : Rat) / 93) [(1, 1), (13, 1), (14, 2), (16, 1)],
  term ((926 : Rat) / 31) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((-16 : Rat) / 31) [(1, 1), (13, 1), (15, 4), (16, 1)],
  term ((569 : Rat) / 62) [(1, 1), (13, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((32 : Rat) / 31) [(1, 1), (13, 2), (15, 3), (16, 1)],
  term ((200 : Rat) / 93) [(1, 1), (13, 3), (14, 1), (16, 1)],
  term ((-152 : Rat) / 93) [(1, 1), (13, 3), (16, 1)],
  term ((3 : Rat) / 4) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 31) [(1, 2), (13, 1), (15, 3), (16, 1)],
  term ((-100 : Rat) / 93) [(1, 2), (13, 2), (14, 1), (16, 1)],
  term ((76 : Rat) / 93) [(1, 2), (13, 2), (16, 1)],
  term ((-12 : Rat) / 31) [(1, 2), (14, 1), (15, 2), (16, 1)],
  term ((1307 : Rat) / 93) [(1, 2), (14, 1), (16, 1)],
  term ((8 : Rat) / 31) [(1, 2), (14, 2), (15, 2), (16, 1)],
  term ((-2149 : Rat) / 186) [(1, 2), (14, 2), (16, 1)],
  term ((-463 : Rat) / 31) [(1, 2), (15, 2), (16, 1)],
  term ((8 : Rat) / 31) [(1, 2), (15, 4), (16, 1)],
  term ((-569 : Rat) / 124) [(1, 2), (16, 1)],
  term ((3 : Rat) / 2) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 31) [(12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((152 : Rat) / 93) [(12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-200 : Rat) / 93) [(12, 1), (13, 2), (14, 2), (16, 1)],
  term ((-926 : Rat) / 31) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((16 : Rat) / 31) [(12, 1), (14, 1), (15, 4), (16, 1)],
  term ((-569 : Rat) / 62) [(12, 1), (14, 1), (16, 1)],
  term ((-24 : Rat) / 31) [(12, 1), (14, 2), (15, 2), (16, 1)],
  term ((2614 : Rat) / 93) [(12, 1), (14, 2), (16, 1)],
  term ((16 : Rat) / 31) [(12, 1), (14, 3), (15, 2), (16, 1)],
  term ((-2149 : Rat) / 93) [(12, 1), (14, 3), (16, 1)],
  term ((2614 : Rat) / 93) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-24 : Rat) / 31) [(13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-8875 : Rat) / 372) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((32 : Rat) / 31) [(13, 1), (14, 2), (15, 3), (16, 1)],
  term ((-569 : Rat) / 62) [(13, 1), (15, 1), (16, 1)],
  term ((-3797 : Rat) / 124) [(13, 1), (15, 3), (16, 1)],
  term ((32 : Rat) / 31) [(13, 1), (15, 5), (16, 1)],
  term ((100 : Rat) / 93) [(13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-76 : Rat) / 93) [(13, 2), (14, 2), (16, 1)],
  term ((100 : Rat) / 93) [(13, 2), (14, 3), (16, 1)],
  term ((127 : Rat) / 186) [(13, 2), (15, 2), (16, 1)],
  term ((-32 : Rat) / 31) [(13, 2), (15, 4), (16, 1)],
  term ((-200 : Rat) / 93) [(13, 3), (14, 1), (15, 1), (16, 1)],
  term ((152 : Rat) / 93) [(13, 3), (15, 1), (16, 1)],
  term ((-1307 : Rat) / 93) [(14, 1), (15, 2), (16, 1)],
  term ((12 : Rat) / 31) [(14, 1), (15, 4), (16, 1)],
  term ((4927 : Rat) / 186) [(14, 2), (15, 2), (16, 1)],
  term ((-16 : Rat) / 31) [(14, 2), (15, 4), (16, 1)],
  term ((569 : Rat) / 124) [(14, 2), (16, 1)],
  term ((12 : Rat) / 31) [(14, 3), (15, 2), (16, 1)],
  term ((-1307 : Rat) / 93) [(14, 3), (16, 1)],
  term ((-8 : Rat) / 31) [(14, 4), (15, 2), (16, 1)],
  term ((2149 : Rat) / 186) [(14, 4), (16, 1)],
  term ((569 : Rat) / 124) [(15, 2), (16, 1)],
  term ((463 : Rat) / 31) [(15, 4), (16, 1)],
  term ((-8 : Rat) / 31) [(15, 6), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 27, terms 300 through 310. -/
theorem rs_R009_ueqv_R009NNNNY_block_27_0300_0310_valid :
    checkProductSumEq rs_R009_ueqv_R009NNNNY_partials_27_0300_0310
      rs_R009_ueqv_R009NNNNY_block_27_0300_0310 = true := by
  native_decide

end R009UeqvR009NNNNYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
