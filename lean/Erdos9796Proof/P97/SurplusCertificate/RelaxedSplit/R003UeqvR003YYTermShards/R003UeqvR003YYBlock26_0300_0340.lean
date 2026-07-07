/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R003:u=v:R003YY, term block 26:300-340

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R003UeqvR003YYTermShards

/-- Generator polynomial 26 for relaxed split surplus certificate `R003:u=v:R003YY`. -/
def rs_R003_ueqv_R003YY_generator_26_0300_0340 : Poly :=
[
  term (-2 : Rat) [(0, 1), (12, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (13, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(6, 1), (12, 1)],
  term (-1 : Rat) [(6, 2)],
  term (2 : Rat) [(7, 1), (13, 1)],
  term (-1 : Rat) [(7, 2)]
]

/-- Coefficient term 300 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0300 : Poly :=
[
  term ((443 : Rat) / 70) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 300 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0300 : Poly :=
[
  term ((-443 : Rat) / 35) [(0, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((443 : Rat) / 70) [(0, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-443 : Rat) / 35) [(1, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((443 : Rat) / 70) [(1, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((443 : Rat) / 35) [(6, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-443 : Rat) / 70) [(6, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((443 : Rat) / 35) [(7, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-443 : Rat) / 70) [(7, 2), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 300 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0300_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0300
        rs_R003_ueqv_R003YY_generator_26_0300_0340 =
      rs_R003_ueqv_R003YY_partial_26_0300 := by
  native_decide

/-- Coefficient term 301 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0301 : Poly :=
[
  term ((-23486416 : Rat) / 53375) [(9, 1), (13, 1)]
]

/-- Partial product 301 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0301 : Poly :=
[
  term ((46972832 : Rat) / 53375) [(0, 1), (9, 1), (12, 1), (13, 1)],
  term ((-23486416 : Rat) / 53375) [(0, 2), (9, 1), (13, 1)],
  term ((46972832 : Rat) / 53375) [(1, 1), (9, 1), (13, 2)],
  term ((-23486416 : Rat) / 53375) [(1, 2), (9, 1), (13, 1)],
  term ((-46972832 : Rat) / 53375) [(6, 1), (9, 1), (12, 1), (13, 1)],
  term ((23486416 : Rat) / 53375) [(6, 2), (9, 1), (13, 1)],
  term ((-46972832 : Rat) / 53375) [(7, 1), (9, 1), (13, 2)],
  term ((23486416 : Rat) / 53375) [(7, 2), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 301 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0301_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0301
        rs_R003_ueqv_R003YY_generator_26_0300_0340 =
      rs_R003_ueqv_R003YY_partial_26_0301 := by
  native_decide

/-- Coefficient term 302 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0302 : Poly :=
[
  term ((13856 : Rat) / 35) [(9, 1), (13, 1), (14, 1)]
]

/-- Partial product 302 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0302 : Poly :=
[
  term ((-27712 : Rat) / 35) [(0, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((13856 : Rat) / 35) [(0, 2), (9, 1), (13, 1), (14, 1)],
  term ((-27712 : Rat) / 35) [(1, 1), (9, 1), (13, 2), (14, 1)],
  term ((13856 : Rat) / 35) [(1, 2), (9, 1), (13, 1), (14, 1)],
  term ((27712 : Rat) / 35) [(6, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-13856 : Rat) / 35) [(6, 2), (9, 1), (13, 1), (14, 1)],
  term ((27712 : Rat) / 35) [(7, 1), (9, 1), (13, 2), (14, 1)],
  term ((-13856 : Rat) / 35) [(7, 2), (9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 302 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0302_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0302
        rs_R003_ueqv_R003YY_generator_26_0300_0340 =
      rs_R003_ueqv_R003YY_partial_26_0302 := by
  native_decide

/-- Coefficient term 303 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0303 : Poly :=
[
  term ((384 : Rat) / 35) [(9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 303 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0303 : Poly :=
[
  term ((-768 : Rat) / 35) [(0, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((384 : Rat) / 35) [(0, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-768 : Rat) / 35) [(1, 1), (9, 1), (13, 2), (14, 1), (16, 1)],
  term ((384 : Rat) / 35) [(1, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((768 : Rat) / 35) [(6, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-384 : Rat) / 35) [(6, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((768 : Rat) / 35) [(7, 1), (9, 1), (13, 2), (14, 1), (16, 1)],
  term ((-384 : Rat) / 35) [(7, 2), (9, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 303 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0303_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0303
        rs_R003_ueqv_R003YY_generator_26_0300_0340 =
      rs_R003_ueqv_R003YY_partial_26_0303 := by
  native_decide

/-- Coefficient term 304 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0304 : Poly :=
[
  term ((-96 : Rat) / 7) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 304 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0304 : Poly :=
[
  term ((192 : Rat) / 7) [(0, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-96 : Rat) / 7) [(0, 2), (9, 1), (13, 1), (16, 1)],
  term ((192 : Rat) / 7) [(1, 1), (9, 1), (13, 2), (16, 1)],
  term ((-96 : Rat) / 7) [(1, 2), (9, 1), (13, 1), (16, 1)],
  term ((-192 : Rat) / 7) [(6, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((96 : Rat) / 7) [(6, 2), (9, 1), (13, 1), (16, 1)],
  term ((-192 : Rat) / 7) [(7, 1), (9, 1), (13, 2), (16, 1)],
  term ((96 : Rat) / 7) [(7, 2), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 304 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0304_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0304
        rs_R003_ueqv_R003YY_generator_26_0300_0340 =
      rs_R003_ueqv_R003YY_partial_26_0304 := by
  native_decide

/-- Coefficient term 305 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0305 : Poly :=
[
  term ((-44141 : Rat) / 2100) [(9, 1), (15, 1)]
]

/-- Partial product 305 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0305 : Poly :=
[
  term ((44141 : Rat) / 1050) [(0, 1), (9, 1), (12, 1), (15, 1)],
  term ((-44141 : Rat) / 2100) [(0, 2), (9, 1), (15, 1)],
  term ((44141 : Rat) / 1050) [(1, 1), (9, 1), (13, 1), (15, 1)],
  term ((-44141 : Rat) / 2100) [(1, 2), (9, 1), (15, 1)],
  term ((-44141 : Rat) / 1050) [(6, 1), (9, 1), (12, 1), (15, 1)],
  term ((44141 : Rat) / 2100) [(6, 2), (9, 1), (15, 1)],
  term ((-44141 : Rat) / 1050) [(7, 1), (9, 1), (13, 1), (15, 1)],
  term ((44141 : Rat) / 2100) [(7, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 305 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0305_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0305
        rs_R003_ueqv_R003YY_generator_26_0300_0340 =
      rs_R003_ueqv_R003YY_partial_26_0305 := by
  native_decide

/-- Coefficient term 306 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0306 : Poly :=
[
  term ((827 : Rat) / 140) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 306 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0306 : Poly :=
[
  term ((-827 : Rat) / 70) [(0, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((827 : Rat) / 140) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((-827 : Rat) / 70) [(1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((827 : Rat) / 140) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((827 : Rat) / 70) [(6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-827 : Rat) / 140) [(6, 2), (9, 1), (15, 1), (16, 1)],
  term ((827 : Rat) / 70) [(7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-827 : Rat) / 140) [(7, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 306 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0306_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0306
        rs_R003_ueqv_R003YY_generator_26_0300_0340 =
      rs_R003_ueqv_R003YY_partial_26_0306 := by
  native_decide

/-- Coefficient term 307 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0307 : Poly :=
[
  term ((1744 : Rat) / 5) [(9, 2)]
]

/-- Partial product 307 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0307 : Poly :=
[
  term ((-3488 : Rat) / 5) [(0, 1), (9, 2), (12, 1)],
  term ((1744 : Rat) / 5) [(0, 2), (9, 2)],
  term ((-3488 : Rat) / 5) [(1, 1), (9, 2), (13, 1)],
  term ((1744 : Rat) / 5) [(1, 2), (9, 2)],
  term ((3488 : Rat) / 5) [(6, 1), (9, 2), (12, 1)],
  term ((-1744 : Rat) / 5) [(6, 2), (9, 2)],
  term ((3488 : Rat) / 5) [(7, 1), (9, 2), (13, 1)],
  term ((-1744 : Rat) / 5) [(7, 2), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 307 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0307_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0307
        rs_R003_ueqv_R003YY_generator_26_0300_0340 =
      rs_R003_ueqv_R003YY_partial_26_0307 := by
  native_decide

/-- Coefficient term 308 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0308 : Poly :=
[
  term ((45861024 : Rat) / 53375) [(9, 2), (11, 1), (13, 1)]
]

/-- Partial product 308 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0308 : Poly :=
[
  term ((-91722048 : Rat) / 53375) [(0, 1), (9, 2), (11, 1), (12, 1), (13, 1)],
  term ((45861024 : Rat) / 53375) [(0, 2), (9, 2), (11, 1), (13, 1)],
  term ((-91722048 : Rat) / 53375) [(1, 1), (9, 2), (11, 1), (13, 2)],
  term ((45861024 : Rat) / 53375) [(1, 2), (9, 2), (11, 1), (13, 1)],
  term ((91722048 : Rat) / 53375) [(6, 1), (9, 2), (11, 1), (12, 1), (13, 1)],
  term ((-45861024 : Rat) / 53375) [(6, 2), (9, 2), (11, 1), (13, 1)],
  term ((91722048 : Rat) / 53375) [(7, 1), (9, 2), (11, 1), (13, 2)],
  term ((-45861024 : Rat) / 53375) [(7, 2), (9, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 308 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0308_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0308
        rs_R003_ueqv_R003YY_generator_26_0300_0340 =
      rs_R003_ueqv_R003YY_partial_26_0308 := by
  native_decide

/-- Coefficient term 309 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0309 : Poly :=
[
  term ((-36864 : Rat) / 35) [(9, 2), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 309 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0309 : Poly :=
[
  term ((73728 : Rat) / 35) [(0, 1), (9, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-36864 : Rat) / 35) [(0, 2), (9, 2), (11, 1), (13, 1), (14, 1)],
  term ((73728 : Rat) / 35) [(1, 1), (9, 2), (11, 1), (13, 2), (14, 1)],
  term ((-36864 : Rat) / 35) [(1, 2), (9, 2), (11, 1), (13, 1), (14, 1)],
  term ((-73728 : Rat) / 35) [(6, 1), (9, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((36864 : Rat) / 35) [(6, 2), (9, 2), (11, 1), (13, 1), (14, 1)],
  term ((-73728 : Rat) / 35) [(7, 1), (9, 2), (11, 1), (13, 2), (14, 1)],
  term ((36864 : Rat) / 35) [(7, 2), (9, 2), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 309 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0309_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0309
        rs_R003_ueqv_R003YY_generator_26_0300_0340 =
      rs_R003_ueqv_R003YY_partial_26_0309 := by
  native_decide

/-- Coefficient term 310 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0310 : Poly :=
[
  term ((12288 : Rat) / 35) [(9, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 310 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0310 : Poly :=
[
  term ((-24576 : Rat) / 35) [(0, 1), (9, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((12288 : Rat) / 35) [(0, 2), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-24576 : Rat) / 35) [(1, 1), (9, 2), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((12288 : Rat) / 35) [(1, 2), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((24576 : Rat) / 35) [(6, 1), (9, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-12288 : Rat) / 35) [(6, 2), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((24576 : Rat) / 35) [(7, 1), (9, 2), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-12288 : Rat) / 35) [(7, 2), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 310 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0310_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0310
        rs_R003_ueqv_R003YY_generator_26_0300_0340 =
      rs_R003_ueqv_R003YY_partial_26_0310 := by
  native_decide

/-- Coefficient term 311 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0311 : Poly :=
[
  term ((-9984 : Rat) / 35) [(9, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 311 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0311 : Poly :=
[
  term ((19968 : Rat) / 35) [(0, 1), (9, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-9984 : Rat) / 35) [(0, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((19968 : Rat) / 35) [(1, 1), (9, 2), (11, 1), (13, 2), (16, 1)],
  term ((-9984 : Rat) / 35) [(1, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-19968 : Rat) / 35) [(6, 1), (9, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((9984 : Rat) / 35) [(6, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-19968 : Rat) / 35) [(7, 1), (9, 2), (11, 1), (13, 2), (16, 1)],
  term ((9984 : Rat) / 35) [(7, 2), (9, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 311 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0311_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0311
        rs_R003_ueqv_R003YY_generator_26_0300_0340 =
      rs_R003_ueqv_R003YY_partial_26_0311 := by
  native_decide

/-- Coefficient term 312 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0312 : Poly :=
[
  term ((2096 : Rat) / 7) [(9, 2), (11, 1), (15, 1)]
]

/-- Partial product 312 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0312 : Poly :=
[
  term ((-4192 : Rat) / 7) [(0, 1), (9, 2), (11, 1), (12, 1), (15, 1)],
  term ((2096 : Rat) / 7) [(0, 2), (9, 2), (11, 1), (15, 1)],
  term ((-4192 : Rat) / 7) [(1, 1), (9, 2), (11, 1), (13, 1), (15, 1)],
  term ((2096 : Rat) / 7) [(1, 2), (9, 2), (11, 1), (15, 1)],
  term ((4192 : Rat) / 7) [(6, 1), (9, 2), (11, 1), (12, 1), (15, 1)],
  term ((-2096 : Rat) / 7) [(6, 2), (9, 2), (11, 1), (15, 1)],
  term ((4192 : Rat) / 7) [(7, 1), (9, 2), (11, 1), (13, 1), (15, 1)],
  term ((-2096 : Rat) / 7) [(7, 2), (9, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 312 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0312_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0312
        rs_R003_ueqv_R003YY_generator_26_0300_0340 =
      rs_R003_ueqv_R003YY_partial_26_0312 := by
  native_decide

/-- Coefficient term 313 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0313 : Poly :=
[
  term ((-1392 : Rat) / 35) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 313 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0313 : Poly :=
[
  term ((2784 : Rat) / 35) [(0, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1392 : Rat) / 35) [(0, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((2784 : Rat) / 35) [(1, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1392 : Rat) / 35) [(1, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-2784 : Rat) / 35) [(6, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1392 : Rat) / 35) [(6, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-2784 : Rat) / 35) [(7, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1392 : Rat) / 35) [(7, 2), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 313 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0313_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0313
        rs_R003_ueqv_R003YY_generator_26_0300_0340 =
      rs_R003_ueqv_R003YY_partial_26_0313 := by
  native_decide

/-- Coefficient term 314 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0314 : Poly :=
[
  term (-316 : Rat) [(9, 2), (14, 1)]
]

/-- Partial product 314 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0314 : Poly :=
[
  term (632 : Rat) [(0, 1), (9, 2), (12, 1), (14, 1)],
  term (-316 : Rat) [(0, 2), (9, 2), (14, 1)],
  term (632 : Rat) [(1, 1), (9, 2), (13, 1), (14, 1)],
  term (-316 : Rat) [(1, 2), (9, 2), (14, 1)],
  term (-632 : Rat) [(6, 1), (9, 2), (12, 1), (14, 1)],
  term (316 : Rat) [(6, 2), (9, 2), (14, 1)],
  term (-632 : Rat) [(7, 1), (9, 2), (13, 1), (14, 1)],
  term (316 : Rat) [(7, 2), (9, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 314 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0314_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0314
        rs_R003_ueqv_R003YY_generator_26_0300_0340 =
      rs_R003_ueqv_R003YY_partial_26_0314 := by
  native_decide

/-- Coefficient term 315 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0315 : Poly :=
[
  term ((2 : Rat) / 5) [(9, 2), (16, 1)]
]

/-- Partial product 315 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0315 : Poly :=
[
  term ((-4 : Rat) / 5) [(0, 1), (9, 2), (12, 1), (16, 1)],
  term ((2 : Rat) / 5) [(0, 2), (9, 2), (16, 1)],
  term ((-4 : Rat) / 5) [(1, 1), (9, 2), (13, 1), (16, 1)],
  term ((2 : Rat) / 5) [(1, 2), (9, 2), (16, 1)],
  term ((4 : Rat) / 5) [(6, 1), (9, 2), (12, 1), (16, 1)],
  term ((-2 : Rat) / 5) [(6, 2), (9, 2), (16, 1)],
  term ((4 : Rat) / 5) [(7, 1), (9, 2), (13, 1), (16, 1)],
  term ((-2 : Rat) / 5) [(7, 2), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 315 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0315_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0315
        rs_R003_ueqv_R003YY_generator_26_0300_0340 =
      rs_R003_ueqv_R003YY_partial_26_0315 := by
  native_decide

/-- Coefficient term 316 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0316 : Poly :=
[
  term ((19067264 : Rat) / 53375) [(11, 1), (12, 1), (13, 1)]
]

/-- Partial product 316 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0316 : Poly :=
[
  term ((-38134528 : Rat) / 53375) [(0, 1), (11, 1), (12, 2), (13, 1)],
  term ((19067264 : Rat) / 53375) [(0, 2), (11, 1), (12, 1), (13, 1)],
  term ((-38134528 : Rat) / 53375) [(1, 1), (11, 1), (12, 1), (13, 2)],
  term ((19067264 : Rat) / 53375) [(1, 2), (11, 1), (12, 1), (13, 1)],
  term ((38134528 : Rat) / 53375) [(6, 1), (11, 1), (12, 2), (13, 1)],
  term ((-19067264 : Rat) / 53375) [(6, 2), (11, 1), (12, 1), (13, 1)],
  term ((38134528 : Rat) / 53375) [(7, 1), (11, 1), (12, 1), (13, 2)],
  term ((-19067264 : Rat) / 53375) [(7, 2), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 316 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0316_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0316
        rs_R003_ueqv_R003YY_generator_26_0300_0340 =
      rs_R003_ueqv_R003YY_partial_26_0316 := by
  native_decide

/-- Coefficient term 317 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0317 : Poly :=
[
  term ((-3072 : Rat) / 7) [(11, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 317 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0317 : Poly :=
[
  term ((6144 : Rat) / 7) [(0, 1), (11, 1), (12, 2), (13, 1), (14, 1)],
  term ((-3072 : Rat) / 7) [(0, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((6144 : Rat) / 7) [(1, 1), (11, 1), (12, 1), (13, 2), (14, 1)],
  term ((-3072 : Rat) / 7) [(1, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-6144 : Rat) / 7) [(6, 1), (11, 1), (12, 2), (13, 1), (14, 1)],
  term ((3072 : Rat) / 7) [(6, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-6144 : Rat) / 7) [(7, 1), (11, 1), (12, 1), (13, 2), (14, 1)],
  term ((3072 : Rat) / 7) [(7, 2), (11, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 317 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0317_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0317
        rs_R003_ueqv_R003YY_generator_26_0300_0340 =
      rs_R003_ueqv_R003YY_partial_26_0317 := by
  native_decide

/-- Coefficient term 318 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0318 : Poly :=
[
  term ((1024 : Rat) / 7) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 318 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0318 : Poly :=
[
  term ((-2048 : Rat) / 7) [(0, 1), (11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((1024 : Rat) / 7) [(0, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2048 : Rat) / 7) [(1, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((1024 : Rat) / 7) [(1, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((2048 : Rat) / 7) [(6, 1), (11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-1024 : Rat) / 7) [(6, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((2048 : Rat) / 7) [(7, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-1024 : Rat) / 7) [(7, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 318 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0318_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0318
        rs_R003_ueqv_R003YY_generator_26_0300_0340 =
      rs_R003_ueqv_R003YY_partial_26_0318 := by
  native_decide

/-- Coefficient term 319 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0319 : Poly :=
[
  term ((-832 : Rat) / 7) [(11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 319 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0319 : Poly :=
[
  term ((1664 : Rat) / 7) [(0, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-832 : Rat) / 7) [(0, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((1664 : Rat) / 7) [(1, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-832 : Rat) / 7) [(1, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1664 : Rat) / 7) [(6, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((832 : Rat) / 7) [(6, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1664 : Rat) / 7) [(7, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((832 : Rat) / 7) [(7, 2), (11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 319 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0319_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0319
        rs_R003_ueqv_R003YY_generator_26_0300_0340 =
      rs_R003_ueqv_R003YY_partial_26_0319 := by
  native_decide

/-- Coefficient term 320 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0320 : Poly :=
[
  term ((25574 : Rat) / 105) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 320 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0320 : Poly :=
[
  term ((-51148 : Rat) / 105) [(0, 1), (11, 1), (12, 2), (15, 1)],
  term ((25574 : Rat) / 105) [(0, 2), (11, 1), (12, 1), (15, 1)],
  term ((-51148 : Rat) / 105) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((25574 : Rat) / 105) [(1, 2), (11, 1), (12, 1), (15, 1)],
  term ((51148 : Rat) / 105) [(6, 1), (11, 1), (12, 2), (15, 1)],
  term ((-25574 : Rat) / 105) [(6, 2), (11, 1), (12, 1), (15, 1)],
  term ((51148 : Rat) / 105) [(7, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-25574 : Rat) / 105) [(7, 2), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 320 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0320_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0320
        rs_R003_ueqv_R003YY_generator_26_0300_0340 =
      rs_R003_ueqv_R003YY_partial_26_0320 := by
  native_decide

/-- Coefficient term 321 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0321 : Poly :=
[
  term ((-1042 : Rat) / 35) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 321 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0321 : Poly :=
[
  term ((2084 : Rat) / 35) [(0, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1042 : Rat) / 35) [(0, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((2084 : Rat) / 35) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1042 : Rat) / 35) [(1, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2084 : Rat) / 35) [(6, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((1042 : Rat) / 35) [(6, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2084 : Rat) / 35) [(7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1042 : Rat) / 35) [(7, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 321 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0321_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0321
        rs_R003_ueqv_R003YY_generator_26_0300_0340 =
      rs_R003_ueqv_R003YY_partial_26_0321 := by
  native_decide

/-- Coefficient term 322 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0322 : Poly :=
[
  term ((-18596328 : Rat) / 53375) [(11, 1), (13, 1)]
]

/-- Partial product 322 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0322 : Poly :=
[
  term ((37192656 : Rat) / 53375) [(0, 1), (11, 1), (12, 1), (13, 1)],
  term ((-18596328 : Rat) / 53375) [(0, 2), (11, 1), (13, 1)],
  term ((37192656 : Rat) / 53375) [(1, 1), (11, 1), (13, 2)],
  term ((-18596328 : Rat) / 53375) [(1, 2), (11, 1), (13, 1)],
  term ((-37192656 : Rat) / 53375) [(6, 1), (11, 1), (12, 1), (13, 1)],
  term ((18596328 : Rat) / 53375) [(6, 2), (11, 1), (13, 1)],
  term ((-37192656 : Rat) / 53375) [(7, 1), (11, 1), (13, 2)],
  term ((18596328 : Rat) / 53375) [(7, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 322 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0322_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0322
        rs_R003_ueqv_R003YY_generator_26_0300_0340 =
      rs_R003_ueqv_R003YY_partial_26_0322 := by
  native_decide

/-- Coefficient term 323 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0323 : Poly :=
[
  term ((14976 : Rat) / 35) [(11, 1), (13, 1), (14, 1)]
]

/-- Partial product 323 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0323 : Poly :=
[
  term ((-29952 : Rat) / 35) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((14976 : Rat) / 35) [(0, 2), (11, 1), (13, 1), (14, 1)],
  term ((-29952 : Rat) / 35) [(1, 1), (11, 1), (13, 2), (14, 1)],
  term ((14976 : Rat) / 35) [(1, 2), (11, 1), (13, 1), (14, 1)],
  term ((29952 : Rat) / 35) [(6, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-14976 : Rat) / 35) [(6, 2), (11, 1), (13, 1), (14, 1)],
  term ((29952 : Rat) / 35) [(7, 1), (11, 1), (13, 2), (14, 1)],
  term ((-14976 : Rat) / 35) [(7, 2), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 323 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0323_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0323
        rs_R003_ueqv_R003YY_generator_26_0300_0340 =
      rs_R003_ueqv_R003YY_partial_26_0323 := by
  native_decide

/-- Coefficient term 324 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0324 : Poly :=
[
  term ((-4992 : Rat) / 35) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 324 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0324 : Poly :=
[
  term ((9984 : Rat) / 35) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-4992 : Rat) / 35) [(0, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((9984 : Rat) / 35) [(1, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-4992 : Rat) / 35) [(1, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-9984 : Rat) / 35) [(6, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((4992 : Rat) / 35) [(6, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-9984 : Rat) / 35) [(7, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((4992 : Rat) / 35) [(7, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 324 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0324_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0324
        rs_R003_ueqv_R003YY_generator_26_0300_0340 =
      rs_R003_ueqv_R003YY_partial_26_0324 := by
  native_decide

/-- Coefficient term 325 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0325 : Poly :=
[
  term ((4056 : Rat) / 35) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 325 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0325 : Poly :=
[
  term ((-8112 : Rat) / 35) [(0, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((4056 : Rat) / 35) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term ((-8112 : Rat) / 35) [(1, 1), (11, 1), (13, 2), (16, 1)],
  term ((4056 : Rat) / 35) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term ((8112 : Rat) / 35) [(6, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-4056 : Rat) / 35) [(6, 2), (11, 1), (13, 1), (16, 1)],
  term ((8112 : Rat) / 35) [(7, 1), (11, 1), (13, 2), (16, 1)],
  term ((-4056 : Rat) / 35) [(7, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 325 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0325_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0325
        rs_R003_ueqv_R003YY_generator_26_0300_0340 =
      rs_R003_ueqv_R003YY_partial_26_0325 := by
  native_decide

/-- Coefficient term 326 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0326 : Poly :=
[
  term ((-2837 : Rat) / 14) [(11, 1), (15, 1)]
]

/-- Partial product 326 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0326 : Poly :=
[
  term ((2837 : Rat) / 7) [(0, 1), (11, 1), (12, 1), (15, 1)],
  term ((-2837 : Rat) / 14) [(0, 2), (11, 1), (15, 1)],
  term ((2837 : Rat) / 7) [(1, 1), (11, 1), (13, 1), (15, 1)],
  term ((-2837 : Rat) / 14) [(1, 2), (11, 1), (15, 1)],
  term ((-2837 : Rat) / 7) [(6, 1), (11, 1), (12, 1), (15, 1)],
  term ((2837 : Rat) / 14) [(6, 2), (11, 1), (15, 1)],
  term ((-2837 : Rat) / 7) [(7, 1), (11, 1), (13, 1), (15, 1)],
  term ((2837 : Rat) / 14) [(7, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 326 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0326_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0326
        rs_R003_ueqv_R003YY_generator_26_0300_0340 =
      rs_R003_ueqv_R003YY_partial_26_0326 := by
  native_decide

/-- Coefficient term 327 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0327 : Poly :=
[
  term ((1761 : Rat) / 70) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 327 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0327 : Poly :=
[
  term ((-1761 : Rat) / 35) [(0, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1761 : Rat) / 70) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1761 : Rat) / 35) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1761 : Rat) / 70) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((1761 : Rat) / 35) [(6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1761 : Rat) / 70) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term ((1761 : Rat) / 35) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1761 : Rat) / 70) [(7, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 327 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0327_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0327
        rs_R003_ueqv_R003YY_generator_26_0300_0340 =
      rs_R003_ueqv_R003YY_partial_26_0327 := by
  native_decide

/-- Coefficient term 328 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0328 : Poly :=
[
  term (128 : Rat) [(12, 1)]
]

/-- Partial product 328 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0328 : Poly :=
[
  term (-256 : Rat) [(0, 1), (12, 2)],
  term (128 : Rat) [(0, 2), (12, 1)],
  term (-256 : Rat) [(1, 1), (12, 1), (13, 1)],
  term (128 : Rat) [(1, 2), (12, 1)],
  term (256 : Rat) [(6, 1), (12, 2)],
  term (-128 : Rat) [(6, 2), (12, 1)],
  term (256 : Rat) [(7, 1), (12, 1), (13, 1)],
  term (-128 : Rat) [(7, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 328 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0328_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0328
        rs_R003_ueqv_R003YY_generator_26_0300_0340 =
      rs_R003_ueqv_R003YY_partial_26_0328 := by
  native_decide

/-- Coefficient term 329 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0329 : Poly :=
[
  term ((-10368 : Rat) / 7625) [(12, 1), (13, 1), (15, 1)]
]

/-- Partial product 329 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0329 : Poly :=
[
  term ((20736 : Rat) / 7625) [(0, 1), (12, 2), (13, 1), (15, 1)],
  term ((-10368 : Rat) / 7625) [(0, 2), (12, 1), (13, 1), (15, 1)],
  term ((20736 : Rat) / 7625) [(1, 1), (12, 1), (13, 2), (15, 1)],
  term ((-10368 : Rat) / 7625) [(1, 2), (12, 1), (13, 1), (15, 1)],
  term ((-20736 : Rat) / 7625) [(6, 1), (12, 2), (13, 1), (15, 1)],
  term ((10368 : Rat) / 7625) [(6, 2), (12, 1), (13, 1), (15, 1)],
  term ((-20736 : Rat) / 7625) [(7, 1), (12, 1), (13, 2), (15, 1)],
  term ((10368 : Rat) / 7625) [(7, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 329 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0329_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0329
        rs_R003_ueqv_R003YY_generator_26_0300_0340 =
      rs_R003_ueqv_R003YY_partial_26_0329 := by
  native_decide

/-- Coefficient term 330 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0330 : Poly :=
[
  term ((-564 : Rat) / 5) [(12, 1), (14, 1)]
]

/-- Partial product 330 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0330 : Poly :=
[
  term ((1128 : Rat) / 5) [(0, 1), (12, 2), (14, 1)],
  term ((-564 : Rat) / 5) [(0, 2), (12, 1), (14, 1)],
  term ((1128 : Rat) / 5) [(1, 1), (12, 1), (13, 1), (14, 1)],
  term ((-564 : Rat) / 5) [(1, 2), (12, 1), (14, 1)],
  term ((-1128 : Rat) / 5) [(6, 1), (12, 2), (14, 1)],
  term ((564 : Rat) / 5) [(6, 2), (12, 1), (14, 1)],
  term ((-1128 : Rat) / 5) [(7, 1), (12, 1), (13, 1), (14, 1)],
  term ((564 : Rat) / 5) [(7, 2), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 330 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0330_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0330
        rs_R003_ueqv_R003YY_generator_26_0300_0340 =
      rs_R003_ueqv_R003YY_partial_26_0330 := by
  native_decide

/-- Coefficient term 331 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0331 : Poly :=
[
  term ((12 : Rat) / 5) [(12, 1), (16, 1)]
]

/-- Partial product 331 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0331 : Poly :=
[
  term ((-24 : Rat) / 5) [(0, 1), (12, 2), (16, 1)],
  term ((12 : Rat) / 5) [(0, 2), (12, 1), (16, 1)],
  term ((-24 : Rat) / 5) [(1, 1), (12, 1), (13, 1), (16, 1)],
  term ((12 : Rat) / 5) [(1, 2), (12, 1), (16, 1)],
  term ((24 : Rat) / 5) [(6, 1), (12, 2), (16, 1)],
  term ((-12 : Rat) / 5) [(6, 2), (12, 1), (16, 1)],
  term ((24 : Rat) / 5) [(7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-12 : Rat) / 5) [(7, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 331 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0331_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0331
        rs_R003_ueqv_R003YY_generator_26_0300_0340 =
      rs_R003_ueqv_R003YY_partial_26_0331 := by
  native_decide

/-- Coefficient term 332 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0332 : Poly :=
[
  term ((12762389 : Rat) / 640500) [(13, 1), (15, 1)]
]

/-- Partial product 332 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0332 : Poly :=
[
  term ((-12762389 : Rat) / 320250) [(0, 1), (12, 1), (13, 1), (15, 1)],
  term ((12762389 : Rat) / 640500) [(0, 2), (13, 1), (15, 1)],
  term ((-12762389 : Rat) / 320250) [(1, 1), (13, 2), (15, 1)],
  term ((12762389 : Rat) / 640500) [(1, 2), (13, 1), (15, 1)],
  term ((12762389 : Rat) / 320250) [(6, 1), (12, 1), (13, 1), (15, 1)],
  term ((-12762389 : Rat) / 640500) [(6, 2), (13, 1), (15, 1)],
  term ((12762389 : Rat) / 320250) [(7, 1), (13, 2), (15, 1)],
  term ((-12762389 : Rat) / 640500) [(7, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 332 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0332_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0332
        rs_R003_ueqv_R003YY_generator_26_0300_0340 =
      rs_R003_ueqv_R003YY_partial_26_0332 := by
  native_decide

/-- Coefficient term 333 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0333 : Poly :=
[
  term ((-603 : Rat) / 140) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 333 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0333 : Poly :=
[
  term ((603 : Rat) / 70) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-603 : Rat) / 140) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((603 : Rat) / 70) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((-603 : Rat) / 140) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-603 : Rat) / 70) [(6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((603 : Rat) / 140) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-603 : Rat) / 70) [(7, 1), (13, 2), (15, 1), (16, 1)],
  term ((603 : Rat) / 140) [(7, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 333 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0333_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0333
        rs_R003_ueqv_R003YY_generator_26_0300_0340 =
      rs_R003_ueqv_R003YY_partial_26_0333 := by
  native_decide

/-- Coefficient term 334 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0334 : Poly :=
[
  term ((1045876 : Rat) / 10675) [(13, 2)]
]

/-- Partial product 334 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0334 : Poly :=
[
  term ((-2091752 : Rat) / 10675) [(0, 1), (12, 1), (13, 2)],
  term ((1045876 : Rat) / 10675) [(0, 2), (13, 2)],
  term ((-2091752 : Rat) / 10675) [(1, 1), (13, 3)],
  term ((1045876 : Rat) / 10675) [(1, 2), (13, 2)],
  term ((2091752 : Rat) / 10675) [(6, 1), (12, 1), (13, 2)],
  term ((-1045876 : Rat) / 10675) [(6, 2), (13, 2)],
  term ((2091752 : Rat) / 10675) [(7, 1), (13, 3)],
  term ((-1045876 : Rat) / 10675) [(7, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 334 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0334_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0334
        rs_R003_ueqv_R003YY_generator_26_0300_0340 =
      rs_R003_ueqv_R003YY_partial_26_0334 := by
  native_decide

/-- Coefficient term 335 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0335 : Poly :=
[
  term ((-4224 : Rat) / 35) [(13, 2), (14, 1)]
]

/-- Partial product 335 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0335 : Poly :=
[
  term ((8448 : Rat) / 35) [(0, 1), (12, 1), (13, 2), (14, 1)],
  term ((-4224 : Rat) / 35) [(0, 2), (13, 2), (14, 1)],
  term ((8448 : Rat) / 35) [(1, 1), (13, 3), (14, 1)],
  term ((-4224 : Rat) / 35) [(1, 2), (13, 2), (14, 1)],
  term ((-8448 : Rat) / 35) [(6, 1), (12, 1), (13, 2), (14, 1)],
  term ((4224 : Rat) / 35) [(6, 2), (13, 2), (14, 1)],
  term ((-8448 : Rat) / 35) [(7, 1), (13, 3), (14, 1)],
  term ((4224 : Rat) / 35) [(7, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 335 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0335_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0335
        rs_R003_ueqv_R003YY_generator_26_0300_0340 =
      rs_R003_ueqv_R003YY_partial_26_0335 := by
  native_decide

/-- Coefficient term 336 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0336 : Poly :=
[
  term ((1408 : Rat) / 35) [(13, 2), (14, 1), (16, 1)]
]

/-- Partial product 336 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0336 : Poly :=
[
  term ((-2816 : Rat) / 35) [(0, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((1408 : Rat) / 35) [(0, 2), (13, 2), (14, 1), (16, 1)],
  term ((-2816 : Rat) / 35) [(1, 1), (13, 3), (14, 1), (16, 1)],
  term ((1408 : Rat) / 35) [(1, 2), (13, 2), (14, 1), (16, 1)],
  term ((2816 : Rat) / 35) [(6, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-1408 : Rat) / 35) [(6, 2), (13, 2), (14, 1), (16, 1)],
  term ((2816 : Rat) / 35) [(7, 1), (13, 3), (14, 1), (16, 1)],
  term ((-1408 : Rat) / 35) [(7, 2), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 336 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0336_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0336
        rs_R003_ueqv_R003YY_generator_26_0300_0340 =
      rs_R003_ueqv_R003YY_partial_26_0336 := by
  native_decide

/-- Coefficient term 337 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0337 : Poly :=
[
  term ((-1144 : Rat) / 35) [(13, 2), (16, 1)]
]

/-- Partial product 337 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0337 : Poly :=
[
  term ((2288 : Rat) / 35) [(0, 1), (12, 1), (13, 2), (16, 1)],
  term ((-1144 : Rat) / 35) [(0, 2), (13, 2), (16, 1)],
  term ((2288 : Rat) / 35) [(1, 1), (13, 3), (16, 1)],
  term ((-1144 : Rat) / 35) [(1, 2), (13, 2), (16, 1)],
  term ((-2288 : Rat) / 35) [(6, 1), (12, 1), (13, 2), (16, 1)],
  term ((1144 : Rat) / 35) [(6, 2), (13, 2), (16, 1)],
  term ((-2288 : Rat) / 35) [(7, 1), (13, 3), (16, 1)],
  term ((1144 : Rat) / 35) [(7, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 337 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0337_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0337
        rs_R003_ueqv_R003YY_generator_26_0300_0340 =
      rs_R003_ueqv_R003YY_partial_26_0337 := by
  native_decide

/-- Coefficient term 338 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0338 : Poly :=
[
  term ((711 : Rat) / 5) [(14, 1)]
]

/-- Partial product 338 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0338 : Poly :=
[
  term ((-1422 : Rat) / 5) [(0, 1), (12, 1), (14, 1)],
  term ((711 : Rat) / 5) [(0, 2), (14, 1)],
  term ((-1422 : Rat) / 5) [(1, 1), (13, 1), (14, 1)],
  term ((711 : Rat) / 5) [(1, 2), (14, 1)],
  term ((1422 : Rat) / 5) [(6, 1), (12, 1), (14, 1)],
  term ((-711 : Rat) / 5) [(6, 2), (14, 1)],
  term ((1422 : Rat) / 5) [(7, 1), (13, 1), (14, 1)],
  term ((-711 : Rat) / 5) [(7, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 338 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0338_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0338
        rs_R003_ueqv_R003YY_generator_26_0300_0340 =
      rs_R003_ueqv_R003YY_partial_26_0338 := by
  native_decide

/-- Coefficient term 339 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0339 : Poly :=
[
  term ((6 : Rat) / 5) [(15, 2)]
]

/-- Partial product 339 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0339 : Poly :=
[
  term ((-12 : Rat) / 5) [(0, 1), (12, 1), (15, 2)],
  term ((6 : Rat) / 5) [(0, 2), (15, 2)],
  term ((-12 : Rat) / 5) [(1, 1), (13, 1), (15, 2)],
  term ((6 : Rat) / 5) [(1, 2), (15, 2)],
  term ((12 : Rat) / 5) [(6, 1), (12, 1), (15, 2)],
  term ((-6 : Rat) / 5) [(6, 2), (15, 2)],
  term ((12 : Rat) / 5) [(7, 1), (13, 1), (15, 2)],
  term ((-6 : Rat) / 5) [(7, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 339 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0339_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0339
        rs_R003_ueqv_R003YY_generator_26_0300_0340 =
      rs_R003_ueqv_R003YY_partial_26_0339 := by
  native_decide

/-- Coefficient term 340 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0340 : Poly :=
[
  term ((-9 : Rat) / 5) [(16, 1)]
]

/-- Partial product 340 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0340 : Poly :=
[
  term ((18 : Rat) / 5) [(0, 1), (12, 1), (16, 1)],
  term ((-9 : Rat) / 5) [(0, 2), (16, 1)],
  term ((18 : Rat) / 5) [(1, 1), (13, 1), (16, 1)],
  term ((-9 : Rat) / 5) [(1, 2), (16, 1)],
  term ((-18 : Rat) / 5) [(6, 1), (12, 1), (16, 1)],
  term ((9 : Rat) / 5) [(6, 2), (16, 1)],
  term ((-18 : Rat) / 5) [(7, 1), (13, 1), (16, 1)],
  term ((9 : Rat) / 5) [(7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 340 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0340_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0340
        rs_R003_ueqv_R003YY_generator_26_0300_0340 =
      rs_R003_ueqv_R003YY_partial_26_0340 := by
  native_decide

/-- Partial products in this block. -/
def rs_R003_ueqv_R003YY_partials_26_0300_0340 : List Poly :=
[
  rs_R003_ueqv_R003YY_partial_26_0300,
  rs_R003_ueqv_R003YY_partial_26_0301,
  rs_R003_ueqv_R003YY_partial_26_0302,
  rs_R003_ueqv_R003YY_partial_26_0303,
  rs_R003_ueqv_R003YY_partial_26_0304,
  rs_R003_ueqv_R003YY_partial_26_0305,
  rs_R003_ueqv_R003YY_partial_26_0306,
  rs_R003_ueqv_R003YY_partial_26_0307,
  rs_R003_ueqv_R003YY_partial_26_0308,
  rs_R003_ueqv_R003YY_partial_26_0309,
  rs_R003_ueqv_R003YY_partial_26_0310,
  rs_R003_ueqv_R003YY_partial_26_0311,
  rs_R003_ueqv_R003YY_partial_26_0312,
  rs_R003_ueqv_R003YY_partial_26_0313,
  rs_R003_ueqv_R003YY_partial_26_0314,
  rs_R003_ueqv_R003YY_partial_26_0315,
  rs_R003_ueqv_R003YY_partial_26_0316,
  rs_R003_ueqv_R003YY_partial_26_0317,
  rs_R003_ueqv_R003YY_partial_26_0318,
  rs_R003_ueqv_R003YY_partial_26_0319,
  rs_R003_ueqv_R003YY_partial_26_0320,
  rs_R003_ueqv_R003YY_partial_26_0321,
  rs_R003_ueqv_R003YY_partial_26_0322,
  rs_R003_ueqv_R003YY_partial_26_0323,
  rs_R003_ueqv_R003YY_partial_26_0324,
  rs_R003_ueqv_R003YY_partial_26_0325,
  rs_R003_ueqv_R003YY_partial_26_0326,
  rs_R003_ueqv_R003YY_partial_26_0327,
  rs_R003_ueqv_R003YY_partial_26_0328,
  rs_R003_ueqv_R003YY_partial_26_0329,
  rs_R003_ueqv_R003YY_partial_26_0330,
  rs_R003_ueqv_R003YY_partial_26_0331,
  rs_R003_ueqv_R003YY_partial_26_0332,
  rs_R003_ueqv_R003YY_partial_26_0333,
  rs_R003_ueqv_R003YY_partial_26_0334,
  rs_R003_ueqv_R003YY_partial_26_0335,
  rs_R003_ueqv_R003YY_partial_26_0336,
  rs_R003_ueqv_R003YY_partial_26_0337,
  rs_R003_ueqv_R003YY_partial_26_0338,
  rs_R003_ueqv_R003YY_partial_26_0339,
  rs_R003_ueqv_R003YY_partial_26_0340
]

/-- Sum of partial products in this block. -/
def rs_R003_ueqv_R003YY_block_26_0300_0340 : Poly :=
[
  term ((46972832 : Rat) / 53375) [(0, 1), (9, 1), (12, 1), (13, 1)],
  term ((-27712 : Rat) / 35) [(0, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-768 : Rat) / 35) [(0, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((192 : Rat) / 7) [(0, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((44141 : Rat) / 1050) [(0, 1), (9, 1), (12, 1), (15, 1)],
  term ((-827 : Rat) / 70) [(0, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-443 : Rat) / 35) [(0, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-91722048 : Rat) / 53375) [(0, 1), (9, 2), (11, 1), (12, 1), (13, 1)],
  term ((73728 : Rat) / 35) [(0, 1), (9, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-24576 : Rat) / 35) [(0, 1), (9, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((19968 : Rat) / 35) [(0, 1), (9, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-4192 : Rat) / 7) [(0, 1), (9, 2), (11, 1), (12, 1), (15, 1)],
  term ((2784 : Rat) / 35) [(0, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3488 : Rat) / 5) [(0, 1), (9, 2), (12, 1)],
  term (632 : Rat) [(0, 1), (9, 2), (12, 1), (14, 1)],
  term ((-4 : Rat) / 5) [(0, 1), (9, 2), (12, 1), (16, 1)],
  term ((37192656 : Rat) / 53375) [(0, 1), (11, 1), (12, 1), (13, 1)],
  term ((-29952 : Rat) / 35) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((9984 : Rat) / 35) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-8112 : Rat) / 35) [(0, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((2837 : Rat) / 7) [(0, 1), (11, 1), (12, 1), (15, 1)],
  term ((-1761 : Rat) / 35) [(0, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-38134528 : Rat) / 53375) [(0, 1), (11, 1), (12, 2), (13, 1)],
  term ((6144 : Rat) / 7) [(0, 1), (11, 1), (12, 2), (13, 1), (14, 1)],
  term ((-2048 : Rat) / 7) [(0, 1), (11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((1664 : Rat) / 7) [(0, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-51148 : Rat) / 105) [(0, 1), (11, 1), (12, 2), (15, 1)],
  term ((2084 : Rat) / 35) [(0, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-12762389 : Rat) / 320250) [(0, 1), (12, 1), (13, 1), (15, 1)],
  term ((603 : Rat) / 70) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2091752 : Rat) / 10675) [(0, 1), (12, 1), (13, 2)],
  term ((8448 : Rat) / 35) [(0, 1), (12, 1), (13, 2), (14, 1)],
  term ((-2816 : Rat) / 35) [(0, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((2288 : Rat) / 35) [(0, 1), (12, 1), (13, 2), (16, 1)],
  term ((-1422 : Rat) / 5) [(0, 1), (12, 1), (14, 1)],
  term ((-12 : Rat) / 5) [(0, 1), (12, 1), (15, 2)],
  term ((18 : Rat) / 5) [(0, 1), (12, 1), (16, 1)],
  term (-256 : Rat) [(0, 1), (12, 2)],
  term ((20736 : Rat) / 7625) [(0, 1), (12, 2), (13, 1), (15, 1)],
  term ((1128 : Rat) / 5) [(0, 1), (12, 2), (14, 1)],
  term ((-24 : Rat) / 5) [(0, 1), (12, 2), (16, 1)],
  term ((443 : Rat) / 70) [(0, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-23486416 : Rat) / 53375) [(0, 2), (9, 1), (13, 1)],
  term ((13856 : Rat) / 35) [(0, 2), (9, 1), (13, 1), (14, 1)],
  term ((384 : Rat) / 35) [(0, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-96 : Rat) / 7) [(0, 2), (9, 1), (13, 1), (16, 1)],
  term ((-44141 : Rat) / 2100) [(0, 2), (9, 1), (15, 1)],
  term ((827 : Rat) / 140) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((1744 : Rat) / 5) [(0, 2), (9, 2)],
  term ((45861024 : Rat) / 53375) [(0, 2), (9, 2), (11, 1), (13, 1)],
  term ((-36864 : Rat) / 35) [(0, 2), (9, 2), (11, 1), (13, 1), (14, 1)],
  term ((12288 : Rat) / 35) [(0, 2), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-9984 : Rat) / 35) [(0, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((2096 : Rat) / 7) [(0, 2), (9, 2), (11, 1), (15, 1)],
  term ((-1392 : Rat) / 35) [(0, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term (-316 : Rat) [(0, 2), (9, 2), (14, 1)],
  term ((2 : Rat) / 5) [(0, 2), (9, 2), (16, 1)],
  term ((19067264 : Rat) / 53375) [(0, 2), (11, 1), (12, 1), (13, 1)],
  term ((-3072 : Rat) / 7) [(0, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((1024 : Rat) / 7) [(0, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-832 : Rat) / 7) [(0, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((25574 : Rat) / 105) [(0, 2), (11, 1), (12, 1), (15, 1)],
  term ((-1042 : Rat) / 35) [(0, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-18596328 : Rat) / 53375) [(0, 2), (11, 1), (13, 1)],
  term ((14976 : Rat) / 35) [(0, 2), (11, 1), (13, 1), (14, 1)],
  term ((-4992 : Rat) / 35) [(0, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((4056 : Rat) / 35) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term ((-2837 : Rat) / 14) [(0, 2), (11, 1), (15, 1)],
  term ((1761 : Rat) / 70) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term (128 : Rat) [(0, 2), (12, 1)],
  term ((-10368 : Rat) / 7625) [(0, 2), (12, 1), (13, 1), (15, 1)],
  term ((-564 : Rat) / 5) [(0, 2), (12, 1), (14, 1)],
  term ((12 : Rat) / 5) [(0, 2), (12, 1), (16, 1)],
  term ((12762389 : Rat) / 640500) [(0, 2), (13, 1), (15, 1)],
  term ((-603 : Rat) / 140) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((1045876 : Rat) / 10675) [(0, 2), (13, 2)],
  term ((-4224 : Rat) / 35) [(0, 2), (13, 2), (14, 1)],
  term ((1408 : Rat) / 35) [(0, 2), (13, 2), (14, 1), (16, 1)],
  term ((-1144 : Rat) / 35) [(0, 2), (13, 2), (16, 1)],
  term ((711 : Rat) / 5) [(0, 2), (14, 1)],
  term ((6 : Rat) / 5) [(0, 2), (15, 2)],
  term ((-9 : Rat) / 5) [(0, 2), (16, 1)],
  term ((-443 : Rat) / 35) [(1, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((44141 : Rat) / 1050) [(1, 1), (9, 1), (13, 1), (15, 1)],
  term ((-827 : Rat) / 70) [(1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((46972832 : Rat) / 53375) [(1, 1), (9, 1), (13, 2)],
  term ((-27712 : Rat) / 35) [(1, 1), (9, 1), (13, 2), (14, 1)],
  term ((-768 : Rat) / 35) [(1, 1), (9, 1), (13, 2), (14, 1), (16, 1)],
  term ((192 : Rat) / 7) [(1, 1), (9, 1), (13, 2), (16, 1)],
  term ((-4192 : Rat) / 7) [(1, 1), (9, 2), (11, 1), (13, 1), (15, 1)],
  term ((2784 : Rat) / 35) [(1, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-91722048 : Rat) / 53375) [(1, 1), (9, 2), (11, 1), (13, 2)],
  term ((73728 : Rat) / 35) [(1, 1), (9, 2), (11, 1), (13, 2), (14, 1)],
  term ((-24576 : Rat) / 35) [(1, 1), (9, 2), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((19968 : Rat) / 35) [(1, 1), (9, 2), (11, 1), (13, 2), (16, 1)],
  term ((-3488 : Rat) / 5) [(1, 1), (9, 2), (13, 1)],
  term (632 : Rat) [(1, 1), (9, 2), (13, 1), (14, 1)],
  term ((-4 : Rat) / 5) [(1, 1), (9, 2), (13, 1), (16, 1)],
  term ((-51148 : Rat) / 105) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((2084 : Rat) / 35) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-38134528 : Rat) / 53375) [(1, 1), (11, 1), (12, 1), (13, 2)],
  term ((6144 : Rat) / 7) [(1, 1), (11, 1), (12, 1), (13, 2), (14, 1)],
  term ((-2048 : Rat) / 7) [(1, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((1664 : Rat) / 7) [(1, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((2837 : Rat) / 7) [(1, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1761 : Rat) / 35) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((37192656 : Rat) / 53375) [(1, 1), (11, 1), (13, 2)],
  term ((-29952 : Rat) / 35) [(1, 1), (11, 1), (13, 2), (14, 1)],
  term ((9984 : Rat) / 35) [(1, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-8112 : Rat) / 35) [(1, 1), (11, 1), (13, 2), (16, 1)],
  term (-256 : Rat) [(1, 1), (12, 1), (13, 1)],
  term ((1128 : Rat) / 5) [(1, 1), (12, 1), (13, 1), (14, 1)],
  term ((-24 : Rat) / 5) [(1, 1), (12, 1), (13, 1), (16, 1)],
  term ((20736 : Rat) / 7625) [(1, 1), (12, 1), (13, 2), (15, 1)],
  term ((-1422 : Rat) / 5) [(1, 1), (13, 1), (14, 1)],
  term ((-12 : Rat) / 5) [(1, 1), (13, 1), (15, 2)],
  term ((18 : Rat) / 5) [(1, 1), (13, 1), (16, 1)],
  term ((-12762389 : Rat) / 320250) [(1, 1), (13, 2), (15, 1)],
  term ((603 : Rat) / 70) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((-2091752 : Rat) / 10675) [(1, 1), (13, 3)],
  term ((8448 : Rat) / 35) [(1, 1), (13, 3), (14, 1)],
  term ((-2816 : Rat) / 35) [(1, 1), (13, 3), (14, 1), (16, 1)],
  term ((2288 : Rat) / 35) [(1, 1), (13, 3), (16, 1)],
  term ((443 : Rat) / 70) [(1, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-23486416 : Rat) / 53375) [(1, 2), (9, 1), (13, 1)],
  term ((13856 : Rat) / 35) [(1, 2), (9, 1), (13, 1), (14, 1)],
  term ((384 : Rat) / 35) [(1, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-96 : Rat) / 7) [(1, 2), (9, 1), (13, 1), (16, 1)],
  term ((-44141 : Rat) / 2100) [(1, 2), (9, 1), (15, 1)],
  term ((827 : Rat) / 140) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((1744 : Rat) / 5) [(1, 2), (9, 2)],
  term ((45861024 : Rat) / 53375) [(1, 2), (9, 2), (11, 1), (13, 1)],
  term ((-36864 : Rat) / 35) [(1, 2), (9, 2), (11, 1), (13, 1), (14, 1)],
  term ((12288 : Rat) / 35) [(1, 2), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-9984 : Rat) / 35) [(1, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((2096 : Rat) / 7) [(1, 2), (9, 2), (11, 1), (15, 1)],
  term ((-1392 : Rat) / 35) [(1, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term (-316 : Rat) [(1, 2), (9, 2), (14, 1)],
  term ((2 : Rat) / 5) [(1, 2), (9, 2), (16, 1)],
  term ((19067264 : Rat) / 53375) [(1, 2), (11, 1), (12, 1), (13, 1)],
  term ((-3072 : Rat) / 7) [(1, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((1024 : Rat) / 7) [(1, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-832 : Rat) / 7) [(1, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((25574 : Rat) / 105) [(1, 2), (11, 1), (12, 1), (15, 1)],
  term ((-1042 : Rat) / 35) [(1, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-18596328 : Rat) / 53375) [(1, 2), (11, 1), (13, 1)],
  term ((14976 : Rat) / 35) [(1, 2), (11, 1), (13, 1), (14, 1)],
  term ((-4992 : Rat) / 35) [(1, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((4056 : Rat) / 35) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term ((-2837 : Rat) / 14) [(1, 2), (11, 1), (15, 1)],
  term ((1761 : Rat) / 70) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term (128 : Rat) [(1, 2), (12, 1)],
  term ((-10368 : Rat) / 7625) [(1, 2), (12, 1), (13, 1), (15, 1)],
  term ((-564 : Rat) / 5) [(1, 2), (12, 1), (14, 1)],
  term ((12 : Rat) / 5) [(1, 2), (12, 1), (16, 1)],
  term ((12762389 : Rat) / 640500) [(1, 2), (13, 1), (15, 1)],
  term ((-603 : Rat) / 140) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((1045876 : Rat) / 10675) [(1, 2), (13, 2)],
  term ((-4224 : Rat) / 35) [(1, 2), (13, 2), (14, 1)],
  term ((1408 : Rat) / 35) [(1, 2), (13, 2), (14, 1), (16, 1)],
  term ((-1144 : Rat) / 35) [(1, 2), (13, 2), (16, 1)],
  term ((711 : Rat) / 5) [(1, 2), (14, 1)],
  term ((6 : Rat) / 5) [(1, 2), (15, 2)],
  term ((-9 : Rat) / 5) [(1, 2), (16, 1)],
  term ((-46972832 : Rat) / 53375) [(6, 1), (9, 1), (12, 1), (13, 1)],
  term ((27712 : Rat) / 35) [(6, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((768 : Rat) / 35) [(6, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-192 : Rat) / 7) [(6, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-44141 : Rat) / 1050) [(6, 1), (9, 1), (12, 1), (15, 1)],
  term ((827 : Rat) / 70) [(6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((443 : Rat) / 35) [(6, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((91722048 : Rat) / 53375) [(6, 1), (9, 2), (11, 1), (12, 1), (13, 1)],
  term ((-73728 : Rat) / 35) [(6, 1), (9, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((24576 : Rat) / 35) [(6, 1), (9, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-19968 : Rat) / 35) [(6, 1), (9, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((4192 : Rat) / 7) [(6, 1), (9, 2), (11, 1), (12, 1), (15, 1)],
  term ((-2784 : Rat) / 35) [(6, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((3488 : Rat) / 5) [(6, 1), (9, 2), (12, 1)],
  term (-632 : Rat) [(6, 1), (9, 2), (12, 1), (14, 1)],
  term ((4 : Rat) / 5) [(6, 1), (9, 2), (12, 1), (16, 1)],
  term ((-37192656 : Rat) / 53375) [(6, 1), (11, 1), (12, 1), (13, 1)],
  term ((29952 : Rat) / 35) [(6, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-9984 : Rat) / 35) [(6, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((8112 : Rat) / 35) [(6, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-2837 : Rat) / 7) [(6, 1), (11, 1), (12, 1), (15, 1)],
  term ((1761 : Rat) / 35) [(6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((38134528 : Rat) / 53375) [(6, 1), (11, 1), (12, 2), (13, 1)],
  term ((-6144 : Rat) / 7) [(6, 1), (11, 1), (12, 2), (13, 1), (14, 1)],
  term ((2048 : Rat) / 7) [(6, 1), (11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-1664 : Rat) / 7) [(6, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((51148 : Rat) / 105) [(6, 1), (11, 1), (12, 2), (15, 1)],
  term ((-2084 : Rat) / 35) [(6, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((12762389 : Rat) / 320250) [(6, 1), (12, 1), (13, 1), (15, 1)],
  term ((-603 : Rat) / 70) [(6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((2091752 : Rat) / 10675) [(6, 1), (12, 1), (13, 2)],
  term ((-8448 : Rat) / 35) [(6, 1), (12, 1), (13, 2), (14, 1)],
  term ((2816 : Rat) / 35) [(6, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-2288 : Rat) / 35) [(6, 1), (12, 1), (13, 2), (16, 1)],
  term ((1422 : Rat) / 5) [(6, 1), (12, 1), (14, 1)],
  term ((12 : Rat) / 5) [(6, 1), (12, 1), (15, 2)],
  term ((-18 : Rat) / 5) [(6, 1), (12, 1), (16, 1)],
  term (256 : Rat) [(6, 1), (12, 2)],
  term ((-20736 : Rat) / 7625) [(6, 1), (12, 2), (13, 1), (15, 1)],
  term ((-1128 : Rat) / 5) [(6, 1), (12, 2), (14, 1)],
  term ((24 : Rat) / 5) [(6, 1), (12, 2), (16, 1)],
  term ((-443 : Rat) / 70) [(6, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((23486416 : Rat) / 53375) [(6, 2), (9, 1), (13, 1)],
  term ((-13856 : Rat) / 35) [(6, 2), (9, 1), (13, 1), (14, 1)],
  term ((-384 : Rat) / 35) [(6, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((96 : Rat) / 7) [(6, 2), (9, 1), (13, 1), (16, 1)],
  term ((44141 : Rat) / 2100) [(6, 2), (9, 1), (15, 1)],
  term ((-827 : Rat) / 140) [(6, 2), (9, 1), (15, 1), (16, 1)],
  term ((-1744 : Rat) / 5) [(6, 2), (9, 2)],
  term ((-45861024 : Rat) / 53375) [(6, 2), (9, 2), (11, 1), (13, 1)],
  term ((36864 : Rat) / 35) [(6, 2), (9, 2), (11, 1), (13, 1), (14, 1)],
  term ((-12288 : Rat) / 35) [(6, 2), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((9984 : Rat) / 35) [(6, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-2096 : Rat) / 7) [(6, 2), (9, 2), (11, 1), (15, 1)],
  term ((1392 : Rat) / 35) [(6, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term (316 : Rat) [(6, 2), (9, 2), (14, 1)],
  term ((-2 : Rat) / 5) [(6, 2), (9, 2), (16, 1)],
  term ((-19067264 : Rat) / 53375) [(6, 2), (11, 1), (12, 1), (13, 1)],
  term ((3072 : Rat) / 7) [(6, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-1024 : Rat) / 7) [(6, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((832 : Rat) / 7) [(6, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-25574 : Rat) / 105) [(6, 2), (11, 1), (12, 1), (15, 1)],
  term ((1042 : Rat) / 35) [(6, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((18596328 : Rat) / 53375) [(6, 2), (11, 1), (13, 1)],
  term ((-14976 : Rat) / 35) [(6, 2), (11, 1), (13, 1), (14, 1)],
  term ((4992 : Rat) / 35) [(6, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-4056 : Rat) / 35) [(6, 2), (11, 1), (13, 1), (16, 1)],
  term ((2837 : Rat) / 14) [(6, 2), (11, 1), (15, 1)],
  term ((-1761 : Rat) / 70) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term (-128 : Rat) [(6, 2), (12, 1)],
  term ((10368 : Rat) / 7625) [(6, 2), (12, 1), (13, 1), (15, 1)],
  term ((564 : Rat) / 5) [(6, 2), (12, 1), (14, 1)],
  term ((-12 : Rat) / 5) [(6, 2), (12, 1), (16, 1)],
  term ((-12762389 : Rat) / 640500) [(6, 2), (13, 1), (15, 1)],
  term ((603 : Rat) / 140) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1045876 : Rat) / 10675) [(6, 2), (13, 2)],
  term ((4224 : Rat) / 35) [(6, 2), (13, 2), (14, 1)],
  term ((-1408 : Rat) / 35) [(6, 2), (13, 2), (14, 1), (16, 1)],
  term ((1144 : Rat) / 35) [(6, 2), (13, 2), (16, 1)],
  term ((-711 : Rat) / 5) [(6, 2), (14, 1)],
  term ((-6 : Rat) / 5) [(6, 2), (15, 2)],
  term ((9 : Rat) / 5) [(6, 2), (16, 1)],
  term ((443 : Rat) / 35) [(7, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-44141 : Rat) / 1050) [(7, 1), (9, 1), (13, 1), (15, 1)],
  term ((827 : Rat) / 70) [(7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-46972832 : Rat) / 53375) [(7, 1), (9, 1), (13, 2)],
  term ((27712 : Rat) / 35) [(7, 1), (9, 1), (13, 2), (14, 1)],
  term ((768 : Rat) / 35) [(7, 1), (9, 1), (13, 2), (14, 1), (16, 1)],
  term ((-192 : Rat) / 7) [(7, 1), (9, 1), (13, 2), (16, 1)],
  term ((4192 : Rat) / 7) [(7, 1), (9, 2), (11, 1), (13, 1), (15, 1)],
  term ((-2784 : Rat) / 35) [(7, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((91722048 : Rat) / 53375) [(7, 1), (9, 2), (11, 1), (13, 2)],
  term ((-73728 : Rat) / 35) [(7, 1), (9, 2), (11, 1), (13, 2), (14, 1)],
  term ((24576 : Rat) / 35) [(7, 1), (9, 2), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-19968 : Rat) / 35) [(7, 1), (9, 2), (11, 1), (13, 2), (16, 1)],
  term ((3488 : Rat) / 5) [(7, 1), (9, 2), (13, 1)],
  term (-632 : Rat) [(7, 1), (9, 2), (13, 1), (14, 1)],
  term ((4 : Rat) / 5) [(7, 1), (9, 2), (13, 1), (16, 1)],
  term ((51148 : Rat) / 105) [(7, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-2084 : Rat) / 35) [(7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((38134528 : Rat) / 53375) [(7, 1), (11, 1), (12, 1), (13, 2)],
  term ((-6144 : Rat) / 7) [(7, 1), (11, 1), (12, 1), (13, 2), (14, 1)],
  term ((2048 : Rat) / 7) [(7, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-1664 : Rat) / 7) [(7, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-2837 : Rat) / 7) [(7, 1), (11, 1), (13, 1), (15, 1)],
  term ((1761 : Rat) / 35) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-37192656 : Rat) / 53375) [(7, 1), (11, 1), (13, 2)],
  term ((29952 : Rat) / 35) [(7, 1), (11, 1), (13, 2), (14, 1)],
  term ((-9984 : Rat) / 35) [(7, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((8112 : Rat) / 35) [(7, 1), (11, 1), (13, 2), (16, 1)],
  term (256 : Rat) [(7, 1), (12, 1), (13, 1)],
  term ((-1128 : Rat) / 5) [(7, 1), (12, 1), (13, 1), (14, 1)],
  term ((24 : Rat) / 5) [(7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-20736 : Rat) / 7625) [(7, 1), (12, 1), (13, 2), (15, 1)],
  term ((1422 : Rat) / 5) [(7, 1), (13, 1), (14, 1)],
  term ((12 : Rat) / 5) [(7, 1), (13, 1), (15, 2)],
  term ((-18 : Rat) / 5) [(7, 1), (13, 1), (16, 1)],
  term ((12762389 : Rat) / 320250) [(7, 1), (13, 2), (15, 1)],
  term ((-603 : Rat) / 70) [(7, 1), (13, 2), (15, 1), (16, 1)],
  term ((2091752 : Rat) / 10675) [(7, 1), (13, 3)],
  term ((-8448 : Rat) / 35) [(7, 1), (13, 3), (14, 1)],
  term ((2816 : Rat) / 35) [(7, 1), (13, 3), (14, 1), (16, 1)],
  term ((-2288 : Rat) / 35) [(7, 1), (13, 3), (16, 1)],
  term ((-443 : Rat) / 70) [(7, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((23486416 : Rat) / 53375) [(7, 2), (9, 1), (13, 1)],
  term ((-13856 : Rat) / 35) [(7, 2), (9, 1), (13, 1), (14, 1)],
  term ((-384 : Rat) / 35) [(7, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((96 : Rat) / 7) [(7, 2), (9, 1), (13, 1), (16, 1)],
  term ((44141 : Rat) / 2100) [(7, 2), (9, 1), (15, 1)],
  term ((-827 : Rat) / 140) [(7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-1744 : Rat) / 5) [(7, 2), (9, 2)],
  term ((-45861024 : Rat) / 53375) [(7, 2), (9, 2), (11, 1), (13, 1)],
  term ((36864 : Rat) / 35) [(7, 2), (9, 2), (11, 1), (13, 1), (14, 1)],
  term ((-12288 : Rat) / 35) [(7, 2), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((9984 : Rat) / 35) [(7, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-2096 : Rat) / 7) [(7, 2), (9, 2), (11, 1), (15, 1)],
  term ((1392 : Rat) / 35) [(7, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term (316 : Rat) [(7, 2), (9, 2), (14, 1)],
  term ((-2 : Rat) / 5) [(7, 2), (9, 2), (16, 1)],
  term ((-19067264 : Rat) / 53375) [(7, 2), (11, 1), (12, 1), (13, 1)],
  term ((3072 : Rat) / 7) [(7, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-1024 : Rat) / 7) [(7, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((832 : Rat) / 7) [(7, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-25574 : Rat) / 105) [(7, 2), (11, 1), (12, 1), (15, 1)],
  term ((1042 : Rat) / 35) [(7, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((18596328 : Rat) / 53375) [(7, 2), (11, 1), (13, 1)],
  term ((-14976 : Rat) / 35) [(7, 2), (11, 1), (13, 1), (14, 1)],
  term ((4992 : Rat) / 35) [(7, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-4056 : Rat) / 35) [(7, 2), (11, 1), (13, 1), (16, 1)],
  term ((2837 : Rat) / 14) [(7, 2), (11, 1), (15, 1)],
  term ((-1761 : Rat) / 70) [(7, 2), (11, 1), (15, 1), (16, 1)],
  term (-128 : Rat) [(7, 2), (12, 1)],
  term ((10368 : Rat) / 7625) [(7, 2), (12, 1), (13, 1), (15, 1)],
  term ((564 : Rat) / 5) [(7, 2), (12, 1), (14, 1)],
  term ((-12 : Rat) / 5) [(7, 2), (12, 1), (16, 1)],
  term ((-12762389 : Rat) / 640500) [(7, 2), (13, 1), (15, 1)],
  term ((603 : Rat) / 140) [(7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1045876 : Rat) / 10675) [(7, 2), (13, 2)],
  term ((4224 : Rat) / 35) [(7, 2), (13, 2), (14, 1)],
  term ((-1408 : Rat) / 35) [(7, 2), (13, 2), (14, 1), (16, 1)],
  term ((1144 : Rat) / 35) [(7, 2), (13, 2), (16, 1)],
  term ((-711 : Rat) / 5) [(7, 2), (14, 1)],
  term ((-6 : Rat) / 5) [(7, 2), (15, 2)],
  term ((9 : Rat) / 5) [(7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 26, terms 300 through 340. -/
theorem rs_R003_ueqv_R003YY_block_26_0300_0340_valid :
    checkProductSumEq rs_R003_ueqv_R003YY_partials_26_0300_0340
      rs_R003_ueqv_R003YY_block_26_0300_0340 = true := by
  native_decide

end R003UeqvR003YYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
