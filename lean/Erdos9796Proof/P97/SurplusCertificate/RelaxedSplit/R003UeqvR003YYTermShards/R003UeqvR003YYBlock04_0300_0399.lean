/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R003:u=v:R003YY, term block 4:300-399

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R003UeqvR003YYTermShards

/-- Generator polynomial 4 for relaxed split surplus certificate `R003:u=v:R003YY`. -/
def rs_R003_ueqv_R003YY_generator_04_0300_0399 : Poly :=
[
  term (-2 : Rat) [(4, 1)],
  term (1 : Rat) [(4, 2)],
  term (1 : Rat) [(5, 2)],
  term (2 : Rat) [(12, 1)],
  term (-1 : Rat) [(12, 2)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 300 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0300 : Poly :=
[
  term ((288 : Rat) / 35) [(3, 2), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 300 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0300 : Poly :=
[
  term ((-576 : Rat) / 35) [(3, 2), (4, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((288 : Rat) / 35) [(3, 2), (4, 2), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((288 : Rat) / 35) [(3, 2), (5, 2), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-288 : Rat) / 35) [(3, 2), (9, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((576 : Rat) / 35) [(3, 2), (9, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((-288 : Rat) / 35) [(3, 2), (9, 1), (11, 1), (12, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 300 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0300_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0300
        rs_R003_ueqv_R003YY_generator_04_0300_0399 =
      rs_R003_ueqv_R003YY_partial_04_0300 := by
  native_decide

/-- Coefficient term 301 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0301 : Poly :=
[
  term ((576 : Rat) / 35) [(3, 2), (9, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 301 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0301 : Poly :=
[
  term ((-1152 : Rat) / 35) [(3, 2), (4, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((576 : Rat) / 35) [(3, 2), (4, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((576 : Rat) / 35) [(3, 2), (5, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-576 : Rat) / 35) [(3, 2), (9, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((1152 : Rat) / 35) [(3, 2), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((-576 : Rat) / 35) [(3, 2), (9, 1), (11, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 301 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0301_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0301
        rs_R003_ueqv_R003YY_generator_04_0300_0399 =
      rs_R003_ueqv_R003YY_partial_04_0301 := by
  native_decide

/-- Coefficient term 302 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0302 : Poly :=
[
  term ((432 : Rat) / 35) [(3, 2), (9, 1), (11, 1), (14, 1)]
]

/-- Partial product 302 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0302 : Poly :=
[
  term ((-864 : Rat) / 35) [(3, 2), (4, 1), (9, 1), (11, 1), (14, 1)],
  term ((432 : Rat) / 35) [(3, 2), (4, 2), (9, 1), (11, 1), (14, 1)],
  term ((432 : Rat) / 35) [(3, 2), (5, 2), (9, 1), (11, 1), (14, 1)],
  term ((864 : Rat) / 35) [(3, 2), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((-432 : Rat) / 35) [(3, 2), (9, 1), (11, 1), (12, 2), (14, 1)],
  term ((-432 : Rat) / 35) [(3, 2), (9, 1), (11, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 302 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0302_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0302
        rs_R003_ueqv_R003YY_generator_04_0300_0399 =
      rs_R003_ueqv_R003YY_partial_04_0302 := by
  native_decide

/-- Coefficient term 303 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0303 : Poly :=
[
  term ((-144 : Rat) / 35) [(3, 2), (9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 303 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0303 : Poly :=
[
  term ((288 : Rat) / 35) [(3, 2), (4, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-144 : Rat) / 35) [(3, 2), (4, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-144 : Rat) / 35) [(3, 2), (5, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-288 : Rat) / 35) [(3, 2), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((144 : Rat) / 35) [(3, 2), (9, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((144 : Rat) / 35) [(3, 2), (9, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 303 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0303_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0303
        rs_R003_ueqv_R003YY_generator_04_0300_0399 =
      rs_R003_ueqv_R003YY_partial_04_0303 := by
  native_decide

/-- Coefficient term 304 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0304 : Poly :=
[
  term ((-288 : Rat) / 35) [(3, 2), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 304 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0304 : Poly :=
[
  term ((576 : Rat) / 35) [(3, 2), (4, 1), (9, 1), (11, 1), (16, 1)],
  term ((-288 : Rat) / 35) [(3, 2), (4, 2), (9, 1), (11, 1), (16, 1)],
  term ((-288 : Rat) / 35) [(3, 2), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-576 : Rat) / 35) [(3, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((288 : Rat) / 35) [(3, 2), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((288 : Rat) / 35) [(3, 2), (9, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 304 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0304_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0304
        rs_R003_ueqv_R003YY_generator_04_0300_0399 =
      rs_R003_ueqv_R003YY_partial_04_0304 := by
  native_decide

/-- Coefficient term 305 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0305 : Poly :=
[
  term ((-108 : Rat) / 5) [(3, 2), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 305 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0305 : Poly :=
[
  term ((216 : Rat) / 5) [(3, 2), (4, 1), (9, 1), (12, 1), (15, 1)],
  term ((-108 : Rat) / 5) [(3, 2), (4, 2), (9, 1), (12, 1), (15, 1)],
  term ((-108 : Rat) / 5) [(3, 2), (5, 2), (9, 1), (12, 1), (15, 1)],
  term ((108 : Rat) / 5) [(3, 2), (9, 1), (12, 1), (13, 2), (15, 1)],
  term ((-216 : Rat) / 5) [(3, 2), (9, 1), (12, 2), (15, 1)],
  term ((108 : Rat) / 5) [(3, 2), (9, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 305 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0305_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0305
        rs_R003_ueqv_R003YY_generator_04_0300_0399 =
      rs_R003_ueqv_R003YY_partial_04_0305 := by
  native_decide

/-- Coefficient term 306 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0306 : Poly :=
[
  term ((12 : Rat) / 5) [(3, 2), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 306 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0306 : Poly :=
[
  term ((-24 : Rat) / 5) [(3, 2), (4, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((12 : Rat) / 5) [(3, 2), (4, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((12 : Rat) / 5) [(3, 2), (5, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-12 : Rat) / 5) [(3, 2), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((24 : Rat) / 5) [(3, 2), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-12 : Rat) / 5) [(3, 2), (9, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 306 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0306_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0306
        rs_R003_ueqv_R003YY_generator_04_0300_0399 =
      rs_R003_ueqv_R003YY_partial_04_0306 := by
  native_decide

/-- Coefficient term 307 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0307 : Poly :=
[
  term ((54 : Rat) / 5) [(3, 2), (9, 1), (15, 1)]
]

/-- Partial product 307 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0307 : Poly :=
[
  term ((-108 : Rat) / 5) [(3, 2), (4, 1), (9, 1), (15, 1)],
  term ((54 : Rat) / 5) [(3, 2), (4, 2), (9, 1), (15, 1)],
  term ((54 : Rat) / 5) [(3, 2), (5, 2), (9, 1), (15, 1)],
  term ((108 : Rat) / 5) [(3, 2), (9, 1), (12, 1), (15, 1)],
  term ((-54 : Rat) / 5) [(3, 2), (9, 1), (12, 2), (15, 1)],
  term ((-54 : Rat) / 5) [(3, 2), (9, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 307 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0307_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0307
        rs_R003_ueqv_R003YY_generator_04_0300_0399 =
      rs_R003_ueqv_R003YY_partial_04_0307 := by
  native_decide

/-- Coefficient term 308 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0308 : Poly :=
[
  term ((-6 : Rat) / 5) [(3, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 308 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0308 : Poly :=
[
  term ((12 : Rat) / 5) [(3, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-6 : Rat) / 5) [(3, 2), (4, 2), (9, 1), (15, 1), (16, 1)],
  term ((-6 : Rat) / 5) [(3, 2), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-12 : Rat) / 5) [(3, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((6 : Rat) / 5) [(3, 2), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((6 : Rat) / 5) [(3, 2), (9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 308 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0308_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0308
        rs_R003_ueqv_R003YY_generator_04_0300_0399 =
      rs_R003_ueqv_R003YY_partial_04_0308 := by
  native_decide

/-- Coefficient term 309 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0309 : Poly :=
[
  term ((-6 : Rat) / 5) [(4, 1)]
]

/-- Partial product 309 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0309 : Poly :=
[
  term ((-6 : Rat) / 5) [(4, 1), (5, 2)],
  term ((-12 : Rat) / 5) [(4, 1), (12, 1)],
  term ((6 : Rat) / 5) [(4, 1), (12, 2)],
  term ((6 : Rat) / 5) [(4, 1), (13, 2)],
  term ((12 : Rat) / 5) [(4, 2)],
  term ((-6 : Rat) / 5) [(4, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 309 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0309_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0309
        rs_R003_ueqv_R003YY_generator_04_0300_0399 =
      rs_R003_ueqv_R003YY_partial_04_0309 := by
  native_decide

/-- Coefficient term 310 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0310 : Poly :=
[
  term ((-82944 : Rat) / 7625) [(4, 1), (5, 1), (9, 1), (11, 1), (13, 1)]
]

/-- Partial product 310 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0310 : Poly :=
[
  term ((-165888 : Rat) / 7625) [(4, 1), (5, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((82944 : Rat) / 7625) [(4, 1), (5, 1), (9, 1), (11, 1), (12, 2), (13, 1)],
  term ((82944 : Rat) / 7625) [(4, 1), (5, 1), (9, 1), (11, 1), (13, 3)],
  term ((-82944 : Rat) / 7625) [(4, 1), (5, 3), (9, 1), (11, 1), (13, 1)],
  term ((165888 : Rat) / 7625) [(4, 2), (5, 1), (9, 1), (11, 1), (13, 1)],
  term ((-82944 : Rat) / 7625) [(4, 3), (5, 1), (9, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 310 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0310_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0310
        rs_R003_ueqv_R003YY_generator_04_0300_0399 =
      rs_R003_ueqv_R003YY_partial_04_0310 := by
  native_decide

/-- Coefficient term 311 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0311 : Poly :=
[
  term ((-165888 : Rat) / 7625) [(4, 1), (5, 1), (9, 1), (13, 2)]
]

/-- Partial product 311 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0311 : Poly :=
[
  term ((-331776 : Rat) / 7625) [(4, 1), (5, 1), (9, 1), (12, 1), (13, 2)],
  term ((165888 : Rat) / 7625) [(4, 1), (5, 1), (9, 1), (12, 2), (13, 2)],
  term ((165888 : Rat) / 7625) [(4, 1), (5, 1), (9, 1), (13, 4)],
  term ((-165888 : Rat) / 7625) [(4, 1), (5, 3), (9, 1), (13, 2)],
  term ((331776 : Rat) / 7625) [(4, 2), (5, 1), (9, 1), (13, 2)],
  term ((-165888 : Rat) / 7625) [(4, 3), (5, 1), (9, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 311 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0311_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0311
        rs_R003_ueqv_R003YY_generator_04_0300_0399 =
      rs_R003_ueqv_R003YY_partial_04_0311 := by
  native_decide

/-- Coefficient term 312 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0312 : Poly :=
[
  term ((-110592 : Rat) / 7625) [(4, 1), (5, 1), (10, 1), (13, 1)]
]

/-- Partial product 312 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0312 : Poly :=
[
  term ((-221184 : Rat) / 7625) [(4, 1), (5, 1), (10, 1), (12, 1), (13, 1)],
  term ((110592 : Rat) / 7625) [(4, 1), (5, 1), (10, 1), (12, 2), (13, 1)],
  term ((110592 : Rat) / 7625) [(4, 1), (5, 1), (10, 1), (13, 3)],
  term ((-110592 : Rat) / 7625) [(4, 1), (5, 3), (10, 1), (13, 1)],
  term ((221184 : Rat) / 7625) [(4, 2), (5, 1), (10, 1), (13, 1)],
  term ((-110592 : Rat) / 7625) [(4, 3), (5, 1), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 312 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0312_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0312
        rs_R003_ueqv_R003YY_generator_04_0300_0399 =
      rs_R003_ueqv_R003YY_partial_04_0312 := by
  native_decide

/-- Coefficient term 313 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0313 : Poly :=
[
  term ((-82944 : Rat) / 7625) [(4, 1), (5, 1), (12, 1), (13, 1)]
]

/-- Partial product 313 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0313 : Poly :=
[
  term ((82944 : Rat) / 7625) [(4, 1), (5, 1), (12, 1), (13, 3)],
  term ((-165888 : Rat) / 7625) [(4, 1), (5, 1), (12, 2), (13, 1)],
  term ((82944 : Rat) / 7625) [(4, 1), (5, 1), (12, 3), (13, 1)],
  term ((-82944 : Rat) / 7625) [(4, 1), (5, 3), (12, 1), (13, 1)],
  term ((165888 : Rat) / 7625) [(4, 2), (5, 1), (12, 1), (13, 1)],
  term ((-82944 : Rat) / 7625) [(4, 3), (5, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 313 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0313_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0313
        rs_R003_ueqv_R003YY_generator_04_0300_0399 =
      rs_R003_ueqv_R003YY_partial_04_0313 := by
  native_decide

/-- Coefficient term 314 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0314 : Poly :=
[
  term ((-4608 : Rat) / 7625) [(4, 1), (5, 1), (13, 1)]
]

/-- Partial product 314 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0314 : Poly :=
[
  term ((-9216 : Rat) / 7625) [(4, 1), (5, 1), (12, 1), (13, 1)],
  term ((4608 : Rat) / 7625) [(4, 1), (5, 1), (12, 2), (13, 1)],
  term ((4608 : Rat) / 7625) [(4, 1), (5, 1), (13, 3)],
  term ((-4608 : Rat) / 7625) [(4, 1), (5, 3), (13, 1)],
  term ((9216 : Rat) / 7625) [(4, 2), (5, 1), (13, 1)],
  term ((-4608 : Rat) / 7625) [(4, 3), (5, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 314 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0314_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0314
        rs_R003_ueqv_R003YY_generator_04_0300_0399 =
      rs_R003_ueqv_R003YY_partial_04_0314 := by
  native_decide

/-- Coefficient term 315 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0315 : Poly :=
[
  term ((41472 : Rat) / 7625) [(4, 1), (5, 1), (13, 1), (14, 1)]
]

/-- Partial product 315 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0315 : Poly :=
[
  term ((82944 : Rat) / 7625) [(4, 1), (5, 1), (12, 1), (13, 1), (14, 1)],
  term ((-41472 : Rat) / 7625) [(4, 1), (5, 1), (12, 2), (13, 1), (14, 1)],
  term ((-41472 : Rat) / 7625) [(4, 1), (5, 1), (13, 3), (14, 1)],
  term ((41472 : Rat) / 7625) [(4, 1), (5, 3), (13, 1), (14, 1)],
  term ((-82944 : Rat) / 7625) [(4, 2), (5, 1), (13, 1), (14, 1)],
  term ((41472 : Rat) / 7625) [(4, 3), (5, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 315 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0315_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0315
        rs_R003_ueqv_R003YY_generator_04_0300_0399 =
      rs_R003_ueqv_R003YY_partial_04_0315 := by
  native_decide

/-- Coefficient term 316 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0316 : Poly :=
[
  term ((2496 : Rat) / 10675) [(4, 1), (7, 1), (9, 1), (11, 1), (13, 1)]
]

/-- Partial product 316 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0316 : Poly :=
[
  term ((2496 : Rat) / 10675) [(4, 1), (5, 2), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((4992 : Rat) / 10675) [(4, 1), (7, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((-2496 : Rat) / 10675) [(4, 1), (7, 1), (9, 1), (11, 1), (12, 2), (13, 1)],
  term ((-2496 : Rat) / 10675) [(4, 1), (7, 1), (9, 1), (11, 1), (13, 3)],
  term ((-4992 : Rat) / 10675) [(4, 2), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((2496 : Rat) / 10675) [(4, 3), (7, 1), (9, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 316 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0316_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0316
        rs_R003_ueqv_R003YY_generator_04_0300_0399 =
      rs_R003_ueqv_R003YY_partial_04_0316 := by
  native_decide

/-- Coefficient term 317 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0317 : Poly :=
[
  term ((9984 : Rat) / 10675) [(4, 1), (7, 1), (11, 1), (13, 2)]
]

/-- Partial product 317 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0317 : Poly :=
[
  term ((9984 : Rat) / 10675) [(4, 1), (5, 2), (7, 1), (11, 1), (13, 2)],
  term ((19968 : Rat) / 10675) [(4, 1), (7, 1), (11, 1), (12, 1), (13, 2)],
  term ((-9984 : Rat) / 10675) [(4, 1), (7, 1), (11, 1), (12, 2), (13, 2)],
  term ((-9984 : Rat) / 10675) [(4, 1), (7, 1), (11, 1), (13, 4)],
  term ((-19968 : Rat) / 10675) [(4, 2), (7, 1), (11, 1), (13, 2)],
  term ((9984 : Rat) / 10675) [(4, 3), (7, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 317 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0317_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0317
        rs_R003_ueqv_R003YY_generator_04_0300_0399 =
      rs_R003_ueqv_R003YY_partial_04_0317 := by
  native_decide

/-- Coefficient term 318 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0318 : Poly :=
[
  term ((913632 : Rat) / 53375) [(4, 1), (7, 1), (12, 1), (13, 1)]
]

/-- Partial product 318 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0318 : Poly :=
[
  term ((913632 : Rat) / 53375) [(4, 1), (5, 2), (7, 1), (12, 1), (13, 1)],
  term ((-913632 : Rat) / 53375) [(4, 1), (7, 1), (12, 1), (13, 3)],
  term ((1827264 : Rat) / 53375) [(4, 1), (7, 1), (12, 2), (13, 1)],
  term ((-913632 : Rat) / 53375) [(4, 1), (7, 1), (12, 3), (13, 1)],
  term ((-1827264 : Rat) / 53375) [(4, 2), (7, 1), (12, 1), (13, 1)],
  term ((913632 : Rat) / 53375) [(4, 3), (7, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 318 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0318_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0318
        rs_R003_ueqv_R003YY_generator_04_0300_0399 =
      rs_R003_ueqv_R003YY_partial_04_0318 := by
  native_decide

/-- Coefficient term 319 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0319 : Poly :=
[
  term ((-358632 : Rat) / 53375) [(4, 1), (7, 1), (13, 1)]
]

/-- Partial product 319 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0319 : Poly :=
[
  term ((-358632 : Rat) / 53375) [(4, 1), (5, 2), (7, 1), (13, 1)],
  term ((-717264 : Rat) / 53375) [(4, 1), (7, 1), (12, 1), (13, 1)],
  term ((358632 : Rat) / 53375) [(4, 1), (7, 1), (12, 2), (13, 1)],
  term ((358632 : Rat) / 53375) [(4, 1), (7, 1), (13, 3)],
  term ((717264 : Rat) / 53375) [(4, 2), (7, 1), (13, 1)],
  term ((-358632 : Rat) / 53375) [(4, 3), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 319 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0319_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0319
        rs_R003_ueqv_R003YY_generator_04_0300_0399 =
      rs_R003_ueqv_R003YY_partial_04_0319 := by
  native_decide

/-- Coefficient term 320 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0320 : Poly :=
[
  term ((-20736 : Rat) / 7625) [(4, 1), (7, 1), (13, 1), (14, 1)]
]

/-- Partial product 320 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0320 : Poly :=
[
  term ((-20736 : Rat) / 7625) [(4, 1), (5, 2), (7, 1), (13, 1), (14, 1)],
  term ((-41472 : Rat) / 7625) [(4, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((20736 : Rat) / 7625) [(4, 1), (7, 1), (12, 2), (13, 1), (14, 1)],
  term ((20736 : Rat) / 7625) [(4, 1), (7, 1), (13, 3), (14, 1)],
  term ((41472 : Rat) / 7625) [(4, 2), (7, 1), (13, 1), (14, 1)],
  term ((-20736 : Rat) / 7625) [(4, 3), (7, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 320 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0320_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0320
        rs_R003_ueqv_R003YY_generator_04_0300_0399 =
      rs_R003_ueqv_R003YY_partial_04_0320 := by
  native_decide

/-- Coefficient term 321 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0321 : Poly :=
[
  term ((-4992 : Rat) / 10675) [(4, 1), (7, 2), (11, 1), (13, 1)]
]

/-- Partial product 321 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0321 : Poly :=
[
  term ((-4992 : Rat) / 10675) [(4, 1), (5, 2), (7, 2), (11, 1), (13, 1)],
  term ((-9984 : Rat) / 10675) [(4, 1), (7, 2), (11, 1), (12, 1), (13, 1)],
  term ((4992 : Rat) / 10675) [(4, 1), (7, 2), (11, 1), (12, 2), (13, 1)],
  term ((4992 : Rat) / 10675) [(4, 1), (7, 2), (11, 1), (13, 3)],
  term ((9984 : Rat) / 10675) [(4, 2), (7, 2), (11, 1), (13, 1)],
  term ((-4992 : Rat) / 10675) [(4, 3), (7, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 321 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0321_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0321
        rs_R003_ueqv_R003YY_generator_04_0300_0399 =
      rs_R003_ueqv_R003YY_partial_04_0321 := by
  native_decide

/-- Coefficient term 322 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0322 : Poly :=
[
  term ((30768 : Rat) / 53375) [(4, 1), (9, 1), (10, 1), (13, 1)]
]

/-- Partial product 322 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0322 : Poly :=
[
  term ((30768 : Rat) / 53375) [(4, 1), (5, 2), (9, 1), (10, 1), (13, 1)],
  term ((61536 : Rat) / 53375) [(4, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-30768 : Rat) / 53375) [(4, 1), (9, 1), (10, 1), (12, 2), (13, 1)],
  term ((-30768 : Rat) / 53375) [(4, 1), (9, 1), (10, 1), (13, 3)],
  term ((-61536 : Rat) / 53375) [(4, 2), (9, 1), (10, 1), (13, 1)],
  term ((30768 : Rat) / 53375) [(4, 3), (9, 1), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 322 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0322_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0322
        rs_R003_ueqv_R003YY_generator_04_0300_0399 =
      rs_R003_ueqv_R003YY_partial_04_0322 := by
  native_decide

/-- Coefficient term 323 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0323 : Poly :=
[
  term ((-163392 : Rat) / 10675) [(4, 1), (9, 1), (11, 1), (13, 2)]
]

/-- Partial product 323 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0323 : Poly :=
[
  term ((-163392 : Rat) / 10675) [(4, 1), (5, 2), (9, 1), (11, 1), (13, 2)],
  term ((-326784 : Rat) / 10675) [(4, 1), (9, 1), (11, 1), (12, 1), (13, 2)],
  term ((163392 : Rat) / 10675) [(4, 1), (9, 1), (11, 1), (12, 2), (13, 2)],
  term ((163392 : Rat) / 10675) [(4, 1), (9, 1), (11, 1), (13, 4)],
  term ((326784 : Rat) / 10675) [(4, 2), (9, 1), (11, 1), (13, 2)],
  term ((-163392 : Rat) / 10675) [(4, 3), (9, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 323 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0323_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0323
        rs_R003_ueqv_R003YY_generator_04_0300_0399 =
      rs_R003_ueqv_R003YY_partial_04_0323 := by
  native_decide

/-- Coefficient term 324 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0324 : Poly :=
[
  term ((-80448 : Rat) / 10675) [(4, 1), (9, 1), (11, 2), (13, 1)]
]

/-- Partial product 324 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0324 : Poly :=
[
  term ((-80448 : Rat) / 10675) [(4, 1), (5, 2), (9, 1), (11, 2), (13, 1)],
  term ((-160896 : Rat) / 10675) [(4, 1), (9, 1), (11, 2), (12, 1), (13, 1)],
  term ((80448 : Rat) / 10675) [(4, 1), (9, 1), (11, 2), (12, 2), (13, 1)],
  term ((80448 : Rat) / 10675) [(4, 1), (9, 1), (11, 2), (13, 3)],
  term ((160896 : Rat) / 10675) [(4, 2), (9, 1), (11, 2), (13, 1)],
  term ((-80448 : Rat) / 10675) [(4, 3), (9, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 324 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0324_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0324
        rs_R003_ueqv_R003YY_generator_04_0300_0399 =
      rs_R003_ueqv_R003YY_partial_04_0324 := by
  native_decide

/-- Coefficient term 325 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0325 : Poly :=
[
  term ((-380832 : Rat) / 53375) [(4, 1), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 325 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0325 : Poly :=
[
  term ((-380832 : Rat) / 53375) [(4, 1), (5, 2), (9, 1), (12, 1), (13, 1)],
  term ((380832 : Rat) / 53375) [(4, 1), (9, 1), (12, 1), (13, 3)],
  term ((-761664 : Rat) / 53375) [(4, 1), (9, 1), (12, 2), (13, 1)],
  term ((380832 : Rat) / 53375) [(4, 1), (9, 1), (12, 3), (13, 1)],
  term ((761664 : Rat) / 53375) [(4, 2), (9, 1), (12, 1), (13, 1)],
  term ((-380832 : Rat) / 53375) [(4, 3), (9, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 325 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0325_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0325
        rs_R003_ueqv_R003YY_generator_04_0300_0399 =
      rs_R003_ueqv_R003YY_partial_04_0325 := by
  native_decide

/-- Coefficient term 326 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0326 : Poly :=
[
  term ((-79176 : Rat) / 53375) [(4, 1), (9, 1), (13, 1)]
]

/-- Partial product 326 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0326 : Poly :=
[
  term ((-79176 : Rat) / 53375) [(4, 1), (5, 2), (9, 1), (13, 1)],
  term ((-158352 : Rat) / 53375) [(4, 1), (9, 1), (12, 1), (13, 1)],
  term ((79176 : Rat) / 53375) [(4, 1), (9, 1), (12, 2), (13, 1)],
  term ((79176 : Rat) / 53375) [(4, 1), (9, 1), (13, 3)],
  term ((158352 : Rat) / 53375) [(4, 2), (9, 1), (13, 1)],
  term ((-79176 : Rat) / 53375) [(4, 3), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 326 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0326_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0326
        rs_R003_ueqv_R003YY_generator_04_0300_0399 =
      rs_R003_ueqv_R003YY_partial_04_0326 := by
  native_decide

/-- Coefficient term 327 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0327 : Poly :=
[
  term ((-40224 : Rat) / 10675) [(4, 1), (10, 1), (11, 1), (13, 1)]
]

/-- Partial product 327 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0327 : Poly :=
[
  term ((-40224 : Rat) / 10675) [(4, 1), (5, 2), (10, 1), (11, 1), (13, 1)],
  term ((-80448 : Rat) / 10675) [(4, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((40224 : Rat) / 10675) [(4, 1), (10, 1), (11, 1), (12, 2), (13, 1)],
  term ((40224 : Rat) / 10675) [(4, 1), (10, 1), (11, 1), (13, 3)],
  term ((80448 : Rat) / 10675) [(4, 2), (10, 1), (11, 1), (13, 1)],
  term ((-40224 : Rat) / 10675) [(4, 3), (10, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 327 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0327_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0327
        rs_R003_ueqv_R003YY_generator_04_0300_0399 =
      rs_R003_ueqv_R003YY_partial_04_0327 := by
  native_decide

/-- Coefficient term 328 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0328 : Poly :=
[
  term ((-76704 : Rat) / 10675) [(4, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 328 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0328 : Poly :=
[
  term ((-76704 : Rat) / 10675) [(4, 1), (5, 2), (11, 1), (12, 1), (13, 1)],
  term ((76704 : Rat) / 10675) [(4, 1), (11, 1), (12, 1), (13, 3)],
  term ((-153408 : Rat) / 10675) [(4, 1), (11, 1), (12, 2), (13, 1)],
  term ((76704 : Rat) / 10675) [(4, 1), (11, 1), (12, 3), (13, 1)],
  term ((153408 : Rat) / 10675) [(4, 2), (11, 1), (12, 1), (13, 1)],
  term ((-76704 : Rat) / 10675) [(4, 3), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 328 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0328_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0328
        rs_R003_ueqv_R003YY_generator_04_0300_0399 =
      rs_R003_ueqv_R003YY_partial_04_0328 := by
  native_decide

/-- Coefficient term 329 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0329 : Poly :=
[
  term ((31176 : Rat) / 10675) [(4, 1), (11, 1), (13, 1)]
]

/-- Partial product 329 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0329 : Poly :=
[
  term ((31176 : Rat) / 10675) [(4, 1), (5, 2), (11, 1), (13, 1)],
  term ((62352 : Rat) / 10675) [(4, 1), (11, 1), (12, 1), (13, 1)],
  term ((-31176 : Rat) / 10675) [(4, 1), (11, 1), (12, 2), (13, 1)],
  term ((-31176 : Rat) / 10675) [(4, 1), (11, 1), (13, 3)],
  term ((-62352 : Rat) / 10675) [(4, 2), (11, 1), (13, 1)],
  term ((31176 : Rat) / 10675) [(4, 3), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 329 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0329_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0329
        rs_R003_ueqv_R003YY_generator_04_0300_0399 =
      rs_R003_ueqv_R003YY_partial_04_0329 := by
  native_decide

/-- Coefficient term 330 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0330 : Poly :=
[
  term ((10368 : Rat) / 7625) [(4, 1), (13, 1), (15, 1)]
]

/-- Partial product 330 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0330 : Poly :=
[
  term ((10368 : Rat) / 7625) [(4, 1), (5, 2), (13, 1), (15, 1)],
  term ((20736 : Rat) / 7625) [(4, 1), (12, 1), (13, 1), (15, 1)],
  term ((-10368 : Rat) / 7625) [(4, 1), (12, 2), (13, 1), (15, 1)],
  term ((-10368 : Rat) / 7625) [(4, 1), (13, 3), (15, 1)],
  term ((-20736 : Rat) / 7625) [(4, 2), (13, 1), (15, 1)],
  term ((10368 : Rat) / 7625) [(4, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 330 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0330_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0330
        rs_R003_ueqv_R003YY_generator_04_0300_0399 =
      rs_R003_ueqv_R003YY_partial_04_0330 := by
  native_decide

/-- Coefficient term 331 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0331 : Poly :=
[
  term ((-10656 : Rat) / 2135) [(4, 1), (13, 2)]
]

/-- Partial product 331 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0331 : Poly :=
[
  term ((-10656 : Rat) / 2135) [(4, 1), (5, 2), (13, 2)],
  term ((-21312 : Rat) / 2135) [(4, 1), (12, 1), (13, 2)],
  term ((10656 : Rat) / 2135) [(4, 1), (12, 2), (13, 2)],
  term ((10656 : Rat) / 2135) [(4, 1), (13, 4)],
  term ((21312 : Rat) / 2135) [(4, 2), (13, 2)],
  term ((-10656 : Rat) / 2135) [(4, 3), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 331 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0331_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0331
        rs_R003_ueqv_R003YY_generator_04_0300_0399 =
      rs_R003_ueqv_R003YY_partial_04_0331 := by
  native_decide

/-- Coefficient term 332 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0332 : Poly :=
[
  term ((55296 : Rat) / 7625) [(4, 2), (7, 1), (9, 1), (11, 1), (13, 1)]
]

/-- Partial product 332 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0332 : Poly :=
[
  term ((55296 : Rat) / 7625) [(4, 2), (5, 2), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((110592 : Rat) / 7625) [(4, 2), (7, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((-55296 : Rat) / 7625) [(4, 2), (7, 1), (9, 1), (11, 1), (12, 2), (13, 1)],
  term ((-55296 : Rat) / 7625) [(4, 2), (7, 1), (9, 1), (11, 1), (13, 3)],
  term ((-110592 : Rat) / 7625) [(4, 3), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((55296 : Rat) / 7625) [(4, 4), (7, 1), (9, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 332 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0332_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0332
        rs_R003_ueqv_R003YY_generator_04_0300_0399 =
      rs_R003_ueqv_R003YY_partial_04_0332 := by
  native_decide

/-- Coefficient term 333 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0333 : Poly :=
[
  term ((221184 : Rat) / 7625) [(4, 2), (7, 1), (11, 1), (13, 2)]
]

/-- Partial product 333 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0333 : Poly :=
[
  term ((221184 : Rat) / 7625) [(4, 2), (5, 2), (7, 1), (11, 1), (13, 2)],
  term ((442368 : Rat) / 7625) [(4, 2), (7, 1), (11, 1), (12, 1), (13, 2)],
  term ((-221184 : Rat) / 7625) [(4, 2), (7, 1), (11, 1), (12, 2), (13, 2)],
  term ((-221184 : Rat) / 7625) [(4, 2), (7, 1), (11, 1), (13, 4)],
  term ((-442368 : Rat) / 7625) [(4, 3), (7, 1), (11, 1), (13, 2)],
  term ((221184 : Rat) / 7625) [(4, 4), (7, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 333 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0333_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0333
        rs_R003_ueqv_R003YY_generator_04_0300_0399 =
      rs_R003_ueqv_R003YY_partial_04_0333 := by
  native_decide

/-- Coefficient term 334 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0334 : Poly :=
[
  term ((-156672 : Rat) / 7625) [(4, 2), (7, 1), (12, 1), (13, 1)]
]

/-- Partial product 334 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0334 : Poly :=
[
  term ((-156672 : Rat) / 7625) [(4, 2), (5, 2), (7, 1), (12, 1), (13, 1)],
  term ((156672 : Rat) / 7625) [(4, 2), (7, 1), (12, 1), (13, 3)],
  term ((-313344 : Rat) / 7625) [(4, 2), (7, 1), (12, 2), (13, 1)],
  term ((156672 : Rat) / 7625) [(4, 2), (7, 1), (12, 3), (13, 1)],
  term ((313344 : Rat) / 7625) [(4, 3), (7, 1), (12, 1), (13, 1)],
  term ((-156672 : Rat) / 7625) [(4, 4), (7, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 334 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0334_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0334
        rs_R003_ueqv_R003YY_generator_04_0300_0399 =
      rs_R003_ueqv_R003YY_partial_04_0334 := by
  native_decide

/-- Coefficient term 335 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0335 : Poly :=
[
  term ((43776 : Rat) / 7625) [(4, 2), (7, 1), (13, 1)]
]

/-- Partial product 335 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0335 : Poly :=
[
  term ((43776 : Rat) / 7625) [(4, 2), (5, 2), (7, 1), (13, 1)],
  term ((87552 : Rat) / 7625) [(4, 2), (7, 1), (12, 1), (13, 1)],
  term ((-43776 : Rat) / 7625) [(4, 2), (7, 1), (12, 2), (13, 1)],
  term ((-43776 : Rat) / 7625) [(4, 2), (7, 1), (13, 3)],
  term ((-87552 : Rat) / 7625) [(4, 3), (7, 1), (13, 1)],
  term ((43776 : Rat) / 7625) [(4, 4), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 335 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0335_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0335
        rs_R003_ueqv_R003YY_generator_04_0300_0399 =
      rs_R003_ueqv_R003YY_partial_04_0335 := by
  native_decide

/-- Coefficient term 336 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0336 : Poly :=
[
  term ((-110592 : Rat) / 7625) [(4, 2), (7, 2), (11, 1), (13, 1)]
]

/-- Partial product 336 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0336 : Poly :=
[
  term ((-110592 : Rat) / 7625) [(4, 2), (5, 2), (7, 2), (11, 1), (13, 1)],
  term ((-221184 : Rat) / 7625) [(4, 2), (7, 2), (11, 1), (12, 1), (13, 1)],
  term ((110592 : Rat) / 7625) [(4, 2), (7, 2), (11, 1), (12, 2), (13, 1)],
  term ((110592 : Rat) / 7625) [(4, 2), (7, 2), (11, 1), (13, 3)],
  term ((221184 : Rat) / 7625) [(4, 3), (7, 2), (11, 1), (13, 1)],
  term ((-110592 : Rat) / 7625) [(4, 4), (7, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 336 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0336_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0336
        rs_R003_ueqv_R003YY_generator_04_0300_0399 =
      rs_R003_ueqv_R003YY_partial_04_0336 := by
  native_decide

/-- Coefficient term 337 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0337 : Poly :=
[
  term ((13824 : Rat) / 7625) [(4, 2), (9, 1), (10, 1), (13, 1)]
]

/-- Partial product 337 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0337 : Poly :=
[
  term ((13824 : Rat) / 7625) [(4, 2), (5, 2), (9, 1), (10, 1), (13, 1)],
  term ((27648 : Rat) / 7625) [(4, 2), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-13824 : Rat) / 7625) [(4, 2), (9, 1), (10, 1), (12, 2), (13, 1)],
  term ((-13824 : Rat) / 7625) [(4, 2), (9, 1), (10, 1), (13, 3)],
  term ((-27648 : Rat) / 7625) [(4, 3), (9, 1), (10, 1), (13, 1)],
  term ((13824 : Rat) / 7625) [(4, 4), (9, 1), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 337 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0337_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0337
        rs_R003_ueqv_R003YY_generator_04_0300_0399 =
      rs_R003_ueqv_R003YY_partial_04_0337 := by
  native_decide

/-- Coefficient term 338 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0338 : Poly :=
[
  term ((55296 : Rat) / 7625) [(4, 2), (9, 1), (11, 1), (13, 2)]
]

/-- Partial product 338 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0338 : Poly :=
[
  term ((55296 : Rat) / 7625) [(4, 2), (5, 2), (9, 1), (11, 1), (13, 2)],
  term ((110592 : Rat) / 7625) [(4, 2), (9, 1), (11, 1), (12, 1), (13, 2)],
  term ((-55296 : Rat) / 7625) [(4, 2), (9, 1), (11, 1), (12, 2), (13, 2)],
  term ((-55296 : Rat) / 7625) [(4, 2), (9, 1), (11, 1), (13, 4)],
  term ((-110592 : Rat) / 7625) [(4, 3), (9, 1), (11, 1), (13, 2)],
  term ((55296 : Rat) / 7625) [(4, 4), (9, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 338 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0338_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0338
        rs_R003_ueqv_R003YY_generator_04_0300_0399 =
      rs_R003_ueqv_R003YY_partial_04_0338 := by
  native_decide

/-- Coefficient term 339 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0339 : Poly :=
[
  term ((55296 : Rat) / 7625) [(4, 2), (9, 1), (11, 2), (13, 1)]
]

/-- Partial product 339 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0339 : Poly :=
[
  term ((55296 : Rat) / 7625) [(4, 2), (5, 2), (9, 1), (11, 2), (13, 1)],
  term ((110592 : Rat) / 7625) [(4, 2), (9, 1), (11, 2), (12, 1), (13, 1)],
  term ((-55296 : Rat) / 7625) [(4, 2), (9, 1), (11, 2), (12, 2), (13, 1)],
  term ((-55296 : Rat) / 7625) [(4, 2), (9, 1), (11, 2), (13, 3)],
  term ((-110592 : Rat) / 7625) [(4, 3), (9, 1), (11, 2), (13, 1)],
  term ((55296 : Rat) / 7625) [(4, 4), (9, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 339 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0339_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0339
        rs_R003_ueqv_R003YY_generator_04_0300_0399 =
      rs_R003_ueqv_R003YY_partial_04_0339 := by
  native_decide

/-- Coefficient term 340 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0340 : Poly :=
[
  term ((27648 : Rat) / 7625) [(4, 2), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 340 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0340 : Poly :=
[
  term ((27648 : Rat) / 7625) [(4, 2), (5, 2), (9, 1), (12, 1), (13, 1)],
  term ((-27648 : Rat) / 7625) [(4, 2), (9, 1), (12, 1), (13, 3)],
  term ((55296 : Rat) / 7625) [(4, 2), (9, 1), (12, 2), (13, 1)],
  term ((-27648 : Rat) / 7625) [(4, 2), (9, 1), (12, 3), (13, 1)],
  term ((-55296 : Rat) / 7625) [(4, 3), (9, 1), (12, 1), (13, 1)],
  term ((27648 : Rat) / 7625) [(4, 4), (9, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 340 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0340_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0340
        rs_R003_ueqv_R003YY_generator_04_0300_0399 =
      rs_R003_ueqv_R003YY_partial_04_0340 := by
  native_decide

/-- Coefficient term 341 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0341 : Poly :=
[
  term ((-20736 : Rat) / 7625) [(4, 2), (9, 1), (13, 1)]
]

/-- Partial product 341 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0341 : Poly :=
[
  term ((-20736 : Rat) / 7625) [(4, 2), (5, 2), (9, 1), (13, 1)],
  term ((-41472 : Rat) / 7625) [(4, 2), (9, 1), (12, 1), (13, 1)],
  term ((20736 : Rat) / 7625) [(4, 2), (9, 1), (12, 2), (13, 1)],
  term ((20736 : Rat) / 7625) [(4, 2), (9, 1), (13, 3)],
  term ((41472 : Rat) / 7625) [(4, 3), (9, 1), (13, 1)],
  term ((-20736 : Rat) / 7625) [(4, 4), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 341 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0341_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0341
        rs_R003_ueqv_R003YY_generator_04_0300_0399 =
      rs_R003_ueqv_R003YY_partial_04_0341 := by
  native_decide

/-- Coefficient term 342 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0342 : Poly :=
[
  term ((27648 : Rat) / 7625) [(4, 2), (10, 1), (11, 1), (13, 1)]
]

/-- Partial product 342 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0342 : Poly :=
[
  term ((27648 : Rat) / 7625) [(4, 2), (5, 2), (10, 1), (11, 1), (13, 1)],
  term ((55296 : Rat) / 7625) [(4, 2), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((-27648 : Rat) / 7625) [(4, 2), (10, 1), (11, 1), (12, 2), (13, 1)],
  term ((-27648 : Rat) / 7625) [(4, 2), (10, 1), (11, 1), (13, 3)],
  term ((-55296 : Rat) / 7625) [(4, 3), (10, 1), (11, 1), (13, 1)],
  term ((27648 : Rat) / 7625) [(4, 4), (10, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 342 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0342_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0342
        rs_R003_ueqv_R003YY_generator_04_0300_0399 =
      rs_R003_ueqv_R003YY_partial_04_0342 := by
  native_decide

/-- Coefficient term 343 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0343 : Poly :=
[
  term ((27648 : Rat) / 1525) [(4, 2), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 343 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0343 : Poly :=
[
  term ((27648 : Rat) / 1525) [(4, 2), (5, 2), (11, 1), (12, 1), (13, 1)],
  term ((-27648 : Rat) / 1525) [(4, 2), (11, 1), (12, 1), (13, 3)],
  term ((55296 : Rat) / 1525) [(4, 2), (11, 1), (12, 2), (13, 1)],
  term ((-27648 : Rat) / 1525) [(4, 2), (11, 1), (12, 3), (13, 1)],
  term ((-55296 : Rat) / 1525) [(4, 3), (11, 1), (12, 1), (13, 1)],
  term ((27648 : Rat) / 1525) [(4, 4), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 343 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0343_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0343
        rs_R003_ueqv_R003YY_generator_04_0300_0399 =
      rs_R003_ueqv_R003YY_partial_04_0343 := by
  native_decide

/-- Coefficient term 344 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0344 : Poly :=
[
  term ((-6912 : Rat) / 7625) [(4, 2), (11, 1), (13, 1)]
]

/-- Partial product 344 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0344 : Poly :=
[
  term ((-6912 : Rat) / 7625) [(4, 2), (5, 2), (11, 1), (13, 1)],
  term ((-13824 : Rat) / 7625) [(4, 2), (11, 1), (12, 1), (13, 1)],
  term ((6912 : Rat) / 7625) [(4, 2), (11, 1), (12, 2), (13, 1)],
  term ((6912 : Rat) / 7625) [(4, 2), (11, 1), (13, 3)],
  term ((13824 : Rat) / 7625) [(4, 3), (11, 1), (13, 1)],
  term ((-6912 : Rat) / 7625) [(4, 4), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 344 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0344_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0344
        rs_R003_ueqv_R003YY_generator_04_0300_0399 =
      rs_R003_ueqv_R003YY_partial_04_0344 := by
  native_decide

/-- Coefficient term 345 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0345 : Poly :=
[
  term ((64512 : Rat) / 7625) [(4, 2), (13, 2)]
]

/-- Partial product 345 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0345 : Poly :=
[
  term ((64512 : Rat) / 7625) [(4, 2), (5, 2), (13, 2)],
  term ((129024 : Rat) / 7625) [(4, 2), (12, 1), (13, 2)],
  term ((-64512 : Rat) / 7625) [(4, 2), (12, 2), (13, 2)],
  term ((-64512 : Rat) / 7625) [(4, 2), (13, 4)],
  term ((-129024 : Rat) / 7625) [(4, 3), (13, 2)],
  term ((64512 : Rat) / 7625) [(4, 4), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 345 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0345_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0345
        rs_R003_ueqv_R003YY_generator_04_0300_0399 =
      rs_R003_ueqv_R003YY_partial_04_0345 := by
  native_decide

/-- Coefficient term 346 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0346 : Poly :=
[
  term ((24 : Rat) / 5) [(5, 1), (7, 1)]
]

/-- Partial product 346 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0346 : Poly :=
[
  term ((-48 : Rat) / 5) [(4, 1), (5, 1), (7, 1)],
  term ((24 : Rat) / 5) [(4, 2), (5, 1), (7, 1)],
  term ((48 : Rat) / 5) [(5, 1), (7, 1), (12, 1)],
  term ((-24 : Rat) / 5) [(5, 1), (7, 1), (12, 2)],
  term ((-24 : Rat) / 5) [(5, 1), (7, 1), (13, 2)],
  term ((24 : Rat) / 5) [(5, 3), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 346 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0346_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0346
        rs_R003_ueqv_R003YY_generator_04_0300_0399 =
      rs_R003_ueqv_R003YY_partial_04_0346 := by
  native_decide

/-- Coefficient term 347 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0347 : Poly :=
[
  term ((24 : Rat) / 5) [(5, 1), (7, 1), (12, 1)]
]

/-- Partial product 347 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0347 : Poly :=
[
  term ((-48 : Rat) / 5) [(4, 1), (5, 1), (7, 1), (12, 1)],
  term ((24 : Rat) / 5) [(4, 2), (5, 1), (7, 1), (12, 1)],
  term ((-24 : Rat) / 5) [(5, 1), (7, 1), (12, 1), (13, 2)],
  term ((48 : Rat) / 5) [(5, 1), (7, 1), (12, 2)],
  term ((-24 : Rat) / 5) [(5, 1), (7, 1), (12, 3)],
  term ((24 : Rat) / 5) [(5, 3), (7, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 347 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0347_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0347
        rs_R003_ueqv_R003YY_generator_04_0300_0399 =
      rs_R003_ueqv_R003YY_partial_04_0347 := by
  native_decide

/-- Coefficient term 348 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0348 : Poly :=
[
  term ((-24 : Rat) / 5) [(5, 1), (7, 1), (12, 1), (14, 1)]
]

/-- Partial product 348 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0348 : Poly :=
[
  term ((48 : Rat) / 5) [(4, 1), (5, 1), (7, 1), (12, 1), (14, 1)],
  term ((-24 : Rat) / 5) [(4, 2), (5, 1), (7, 1), (12, 1), (14, 1)],
  term ((24 : Rat) / 5) [(5, 1), (7, 1), (12, 1), (13, 2), (14, 1)],
  term ((-48 : Rat) / 5) [(5, 1), (7, 1), (12, 2), (14, 1)],
  term ((24 : Rat) / 5) [(5, 1), (7, 1), (12, 3), (14, 1)],
  term ((-24 : Rat) / 5) [(5, 3), (7, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 348 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0348_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0348
        rs_R003_ueqv_R003YY_generator_04_0300_0399 =
      rs_R003_ueqv_R003YY_partial_04_0348 := by
  native_decide

/-- Coefficient term 349 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0349 : Poly :=
[
  term ((-24 : Rat) / 5) [(5, 1), (7, 1), (14, 1)]
]

/-- Partial product 349 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0349 : Poly :=
[
  term ((48 : Rat) / 5) [(4, 1), (5, 1), (7, 1), (14, 1)],
  term ((-24 : Rat) / 5) [(4, 2), (5, 1), (7, 1), (14, 1)],
  term ((-48 : Rat) / 5) [(5, 1), (7, 1), (12, 1), (14, 1)],
  term ((24 : Rat) / 5) [(5, 1), (7, 1), (12, 2), (14, 1)],
  term ((24 : Rat) / 5) [(5, 1), (7, 1), (13, 2), (14, 1)],
  term ((-24 : Rat) / 5) [(5, 3), (7, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 349 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0349_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0349
        rs_R003_ueqv_R003YY_generator_04_0300_0399 =
      rs_R003_ueqv_R003YY_partial_04_0349 := by
  native_decide

/-- Coefficient term 350 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0350 : Poly :=
[
  term ((16416 : Rat) / 7625) [(5, 1), (9, 1), (11, 1), (13, 1)]
]

/-- Partial product 350 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0350 : Poly :=
[
  term ((-32832 : Rat) / 7625) [(4, 1), (5, 1), (9, 1), (11, 1), (13, 1)],
  term ((16416 : Rat) / 7625) [(4, 2), (5, 1), (9, 1), (11, 1), (13, 1)],
  term ((32832 : Rat) / 7625) [(5, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((-16416 : Rat) / 7625) [(5, 1), (9, 1), (11, 1), (12, 2), (13, 1)],
  term ((-16416 : Rat) / 7625) [(5, 1), (9, 1), (11, 1), (13, 3)],
  term ((16416 : Rat) / 7625) [(5, 3), (9, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 350 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0350_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0350
        rs_R003_ueqv_R003YY_generator_04_0300_0399 =
      rs_R003_ueqv_R003YY_partial_04_0350 := by
  native_decide

/-- Coefficient term 351 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0351 : Poly :=
[
  term ((32832 : Rat) / 7625) [(5, 1), (9, 1), (13, 2)]
]

/-- Partial product 351 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0351 : Poly :=
[
  term ((-65664 : Rat) / 7625) [(4, 1), (5, 1), (9, 1), (13, 2)],
  term ((32832 : Rat) / 7625) [(4, 2), (5, 1), (9, 1), (13, 2)],
  term ((65664 : Rat) / 7625) [(5, 1), (9, 1), (12, 1), (13, 2)],
  term ((-32832 : Rat) / 7625) [(5, 1), (9, 1), (12, 2), (13, 2)],
  term ((-32832 : Rat) / 7625) [(5, 1), (9, 1), (13, 4)],
  term ((32832 : Rat) / 7625) [(5, 3), (9, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 351 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0351_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0351
        rs_R003_ueqv_R003YY_generator_04_0300_0399 =
      rs_R003_ueqv_R003YY_partial_04_0351 := by
  native_decide

/-- Coefficient term 352 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0352 : Poly :=
[
  term ((21888 : Rat) / 7625) [(5, 1), (10, 1), (13, 1)]
]

/-- Partial product 352 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0352 : Poly :=
[
  term ((-43776 : Rat) / 7625) [(4, 1), (5, 1), (10, 1), (13, 1)],
  term ((21888 : Rat) / 7625) [(4, 2), (5, 1), (10, 1), (13, 1)],
  term ((43776 : Rat) / 7625) [(5, 1), (10, 1), (12, 1), (13, 1)],
  term ((-21888 : Rat) / 7625) [(5, 1), (10, 1), (12, 2), (13, 1)],
  term ((-21888 : Rat) / 7625) [(5, 1), (10, 1), (13, 3)],
  term ((21888 : Rat) / 7625) [(5, 3), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 352 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0352_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0352
        rs_R003_ueqv_R003YY_generator_04_0300_0399 =
      rs_R003_ueqv_R003YY_partial_04_0352 := by
  native_decide

/-- Coefficient term 353 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0353 : Poly :=
[
  term ((-864 : Rat) / 1525) [(5, 1), (12, 1), (13, 1)]
]

/-- Partial product 353 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0353 : Poly :=
[
  term ((1728 : Rat) / 1525) [(4, 1), (5, 1), (12, 1), (13, 1)],
  term ((-864 : Rat) / 1525) [(4, 2), (5, 1), (12, 1), (13, 1)],
  term ((864 : Rat) / 1525) [(5, 1), (12, 1), (13, 3)],
  term ((-1728 : Rat) / 1525) [(5, 1), (12, 2), (13, 1)],
  term ((864 : Rat) / 1525) [(5, 1), (12, 3), (13, 1)],
  term ((-864 : Rat) / 1525) [(5, 3), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 353 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0353_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0353
        rs_R003_ueqv_R003YY_generator_04_0300_0399 =
      rs_R003_ueqv_R003YY_partial_04_0353 := by
  native_decide

/-- Coefficient term 354 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0354 : Poly :=
[
  term ((41472 : Rat) / 7625) [(5, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 354 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0354 : Poly :=
[
  term ((-82944 : Rat) / 7625) [(4, 1), (5, 1), (12, 1), (13, 1), (14, 1)],
  term ((41472 : Rat) / 7625) [(4, 2), (5, 1), (12, 1), (13, 1), (14, 1)],
  term ((-41472 : Rat) / 7625) [(5, 1), (12, 1), (13, 3), (14, 1)],
  term ((82944 : Rat) / 7625) [(5, 1), (12, 2), (13, 1), (14, 1)],
  term ((-41472 : Rat) / 7625) [(5, 1), (12, 3), (13, 1), (14, 1)],
  term ((41472 : Rat) / 7625) [(5, 3), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 354 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0354_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0354
        rs_R003_ueqv_R003YY_generator_04_0300_0399 =
      rs_R003_ueqv_R003YY_partial_04_0354 := by
  native_decide

/-- Coefficient term 355 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0355 : Poly :=
[
  term ((-2364 : Rat) / 1525) [(5, 1), (13, 1)]
]

/-- Partial product 355 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0355 : Poly :=
[
  term ((4728 : Rat) / 1525) [(4, 1), (5, 1), (13, 1)],
  term ((-2364 : Rat) / 1525) [(4, 2), (5, 1), (13, 1)],
  term ((-4728 : Rat) / 1525) [(5, 1), (12, 1), (13, 1)],
  term ((2364 : Rat) / 1525) [(5, 1), (12, 2), (13, 1)],
  term ((2364 : Rat) / 1525) [(5, 1), (13, 3)],
  term ((-2364 : Rat) / 1525) [(5, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 355 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0355_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0355
        rs_R003_ueqv_R003YY_generator_04_0300_0399 =
      rs_R003_ueqv_R003YY_partial_04_0355 := by
  native_decide

/-- Coefficient term 356 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0356 : Poly :=
[
  term ((8556 : Rat) / 7625) [(5, 1), (13, 1), (14, 1)]
]

/-- Partial product 356 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0356 : Poly :=
[
  term ((-17112 : Rat) / 7625) [(4, 1), (5, 1), (13, 1), (14, 1)],
  term ((8556 : Rat) / 7625) [(4, 2), (5, 1), (13, 1), (14, 1)],
  term ((17112 : Rat) / 7625) [(5, 1), (12, 1), (13, 1), (14, 1)],
  term ((-8556 : Rat) / 7625) [(5, 1), (12, 2), (13, 1), (14, 1)],
  term ((-8556 : Rat) / 7625) [(5, 1), (13, 3), (14, 1)],
  term ((8556 : Rat) / 7625) [(5, 3), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 356 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0356_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0356
        rs_R003_ueqv_R003YY_generator_04_0300_0399 =
      rs_R003_ueqv_R003YY_partial_04_0356 := by
  native_decide

/-- Coefficient term 357 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0357 : Poly :=
[
  term ((-24 : Rat) / 5) [(5, 1), (14, 1), (15, 1)]
]

/-- Partial product 357 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0357 : Poly :=
[
  term ((48 : Rat) / 5) [(4, 1), (5, 1), (14, 1), (15, 1)],
  term ((-24 : Rat) / 5) [(4, 2), (5, 1), (14, 1), (15, 1)],
  term ((-48 : Rat) / 5) [(5, 1), (12, 1), (14, 1), (15, 1)],
  term ((24 : Rat) / 5) [(5, 1), (12, 2), (14, 1), (15, 1)],
  term ((24 : Rat) / 5) [(5, 1), (13, 2), (14, 1), (15, 1)],
  term ((-24 : Rat) / 5) [(5, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 357 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0357_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0357
        rs_R003_ueqv_R003YY_generator_04_0300_0399 =
      rs_R003_ueqv_R003YY_partial_04_0357 := by
  native_decide

/-- Coefficient term 358 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0358 : Poly :=
[
  term ((12 : Rat) / 5) [(5, 1), (15, 1)]
]

/-- Partial product 358 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0358 : Poly :=
[
  term ((-24 : Rat) / 5) [(4, 1), (5, 1), (15, 1)],
  term ((12 : Rat) / 5) [(4, 2), (5, 1), (15, 1)],
  term ((24 : Rat) / 5) [(5, 1), (12, 1), (15, 1)],
  term ((-12 : Rat) / 5) [(5, 1), (12, 2), (15, 1)],
  term ((-12 : Rat) / 5) [(5, 1), (13, 2), (15, 1)],
  term ((12 : Rat) / 5) [(5, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 358 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0358_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0358
        rs_R003_ueqv_R003YY_generator_04_0300_0399 =
      rs_R003_ueqv_R003YY_partial_04_0358 := by
  native_decide

/-- Coefficient term 359 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0359 : Poly :=
[
  term ((-6 : Rat) / 5) [(7, 1), (9, 1)]
]

/-- Partial product 359 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0359 : Poly :=
[
  term ((12 : Rat) / 5) [(4, 1), (7, 1), (9, 1)],
  term ((-6 : Rat) / 5) [(4, 2), (7, 1), (9, 1)],
  term ((-6 : Rat) / 5) [(5, 2), (7, 1), (9, 1)],
  term ((-12 : Rat) / 5) [(7, 1), (9, 1), (12, 1)],
  term ((6 : Rat) / 5) [(7, 1), (9, 1), (12, 2)],
  term ((6 : Rat) / 5) [(7, 1), (9, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 359 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0359_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0359
        rs_R003_ueqv_R003YY_generator_04_0300_0399 =
      rs_R003_ueqv_R003YY_partial_04_0359 := by
  native_decide

/-- Coefficient term 360 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0360 : Poly :=
[
  term ((-9533632 : Rat) / 53375) [(7, 1), (9, 1), (11, 1), (13, 1)]
]

/-- Partial product 360 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0360 : Poly :=
[
  term ((19067264 : Rat) / 53375) [(4, 1), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-9533632 : Rat) / 53375) [(4, 2), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-9533632 : Rat) / 53375) [(5, 2), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-19067264 : Rat) / 53375) [(7, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((9533632 : Rat) / 53375) [(7, 1), (9, 1), (11, 1), (12, 2), (13, 1)],
  term ((9533632 : Rat) / 53375) [(7, 1), (9, 1), (11, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 360 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0360_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0360
        rs_R003_ueqv_R003YY_generator_04_0300_0399 =
      rs_R003_ueqv_R003YY_partial_04_0360 := by
  native_decide

/-- Coefficient term 361 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0361 : Poly :=
[
  term ((1536 : Rat) / 7) [(7, 1), (9, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 361 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0361 : Poly :=
[
  term ((-3072 : Rat) / 7) [(4, 1), (7, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((1536 : Rat) / 7) [(4, 2), (7, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((1536 : Rat) / 7) [(5, 2), (7, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((3072 : Rat) / 7) [(7, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-1536 : Rat) / 7) [(7, 1), (9, 1), (11, 1), (12, 2), (13, 1), (14, 1)],
  term ((-1536 : Rat) / 7) [(7, 1), (9, 1), (11, 1), (13, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 361 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0361_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0361
        rs_R003_ueqv_R003YY_generator_04_0300_0399 =
      rs_R003_ueqv_R003YY_partial_04_0361 := by
  native_decide

/-- Coefficient term 362 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0362 : Poly :=
[
  term ((-512 : Rat) / 7) [(7, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 362 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0362 : Poly :=
[
  term ((1024 : Rat) / 7) [(4, 1), (7, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-512 : Rat) / 7) [(4, 2), (7, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-512 : Rat) / 7) [(5, 2), (7, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1024 : Rat) / 7) [(7, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((512 : Rat) / 7) [(7, 1), (9, 1), (11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((512 : Rat) / 7) [(7, 1), (9, 1), (11, 1), (13, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 362 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0362_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0362
        rs_R003_ueqv_R003YY_generator_04_0300_0399 =
      rs_R003_ueqv_R003YY_partial_04_0362 := by
  native_decide

/-- Coefficient term 363 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0363 : Poly :=
[
  term ((416 : Rat) / 7) [(7, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 363 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0363 : Poly :=
[
  term ((-832 : Rat) / 7) [(4, 1), (7, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((416 : Rat) / 7) [(4, 2), (7, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((416 : Rat) / 7) [(5, 2), (7, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((832 : Rat) / 7) [(7, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-416 : Rat) / 7) [(7, 1), (9, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-416 : Rat) / 7) [(7, 1), (9, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 363 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0363_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0363
        rs_R003_ueqv_R003YY_generator_04_0300_0399 =
      rs_R003_ueqv_R003YY_partial_04_0363 := by
  native_decide

/-- Coefficient term 364 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0364 : Poly :=
[
  term ((-12787 : Rat) / 105) [(7, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 364 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0364 : Poly :=
[
  term ((25574 : Rat) / 105) [(4, 1), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((-12787 : Rat) / 105) [(4, 2), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((-12787 : Rat) / 105) [(5, 2), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((-25574 : Rat) / 105) [(7, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((12787 : Rat) / 105) [(7, 1), (9, 1), (11, 1), (12, 2), (15, 1)],
  term ((12787 : Rat) / 105) [(7, 1), (9, 1), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 364 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0364_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0364
        rs_R003_ueqv_R003YY_generator_04_0300_0399 =
      rs_R003_ueqv_R003YY_partial_04_0364 := by
  native_decide

/-- Coefficient term 365 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0365 : Poly :=
[
  term ((521 : Rat) / 35) [(7, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 365 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0365 : Poly :=
[
  term ((-1042 : Rat) / 35) [(4, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((521 : Rat) / 35) [(4, 2), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((521 : Rat) / 35) [(5, 2), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((1042 : Rat) / 35) [(7, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-521 : Rat) / 35) [(7, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-521 : Rat) / 35) [(7, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 365 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0365_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0365
        rs_R003_ueqv_R003YY_generator_04_0300_0399 =
      rs_R003_ueqv_R003YY_partial_04_0365 := by
  native_decide

/-- Coefficient term 366 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0366 : Poly :=
[
  term ((-12 : Rat) / 5) [(7, 1), (9, 1), (14, 1)]
]

/-- Partial product 366 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0366 : Poly :=
[
  term ((24 : Rat) / 5) [(4, 1), (7, 1), (9, 1), (14, 1)],
  term ((-12 : Rat) / 5) [(4, 2), (7, 1), (9, 1), (14, 1)],
  term ((-12 : Rat) / 5) [(5, 2), (7, 1), (9, 1), (14, 1)],
  term ((-24 : Rat) / 5) [(7, 1), (9, 1), (12, 1), (14, 1)],
  term ((12 : Rat) / 5) [(7, 1), (9, 1), (12, 2), (14, 1)],
  term ((12 : Rat) / 5) [(7, 1), (9, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 366 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0366_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0366
        rs_R003_ueqv_R003YY_generator_04_0300_0399 =
      rs_R003_ueqv_R003YY_partial_04_0366 := by
  native_decide

/-- Coefficient term 367 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0367 : Poly :=
[
  term ((-6 : Rat) / 5) [(7, 1), (9, 1), (16, 1)]
]

/-- Partial product 367 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0367 : Poly :=
[
  term ((12 : Rat) / 5) [(4, 1), (7, 1), (9, 1), (16, 1)],
  term ((-6 : Rat) / 5) [(4, 2), (7, 1), (9, 1), (16, 1)],
  term ((-6 : Rat) / 5) [(5, 2), (7, 1), (9, 1), (16, 1)],
  term ((-12 : Rat) / 5) [(7, 1), (9, 1), (12, 1), (16, 1)],
  term ((6 : Rat) / 5) [(7, 1), (9, 1), (12, 2), (16, 1)],
  term ((6 : Rat) / 5) [(7, 1), (9, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 367 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0367_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0367
        rs_R003_ueqv_R003YY_generator_04_0300_0399 =
      rs_R003_ueqv_R003YY_partial_04_0367 := by
  native_decide

/-- Coefficient term 368 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0368 : Poly :=
[
  term ((-51148 : Rat) / 105) [(7, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 368 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0368 : Poly :=
[
  term ((102296 : Rat) / 105) [(4, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-51148 : Rat) / 105) [(4, 2), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-51148 : Rat) / 105) [(5, 2), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-102296 : Rat) / 105) [(7, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((51148 : Rat) / 105) [(7, 1), (11, 1), (12, 2), (13, 1), (15, 1)],
  term ((51148 : Rat) / 105) [(7, 1), (11, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 368 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0368_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0368
        rs_R003_ueqv_R003YY_generator_04_0300_0399 =
      rs_R003_ueqv_R003YY_partial_04_0368 := by
  native_decide

/-- Coefficient term 369 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0369 : Poly :=
[
  term ((2084 : Rat) / 35) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 369 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0369 : Poly :=
[
  term ((-4168 : Rat) / 35) [(4, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((2084 : Rat) / 35) [(4, 2), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((2084 : Rat) / 35) [(5, 2), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((4168 : Rat) / 35) [(7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2084 : Rat) / 35) [(7, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2084 : Rat) / 35) [(7, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 369 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0369_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0369
        rs_R003_ueqv_R003YY_generator_04_0300_0399 =
      rs_R003_ueqv_R003YY_partial_04_0369 := by
  native_decide

/-- Coefficient term 370 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0370 : Poly :=
[
  term ((-38134528 : Rat) / 53375) [(7, 1), (11, 1), (13, 2)]
]

/-- Partial product 370 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0370 : Poly :=
[
  term ((76269056 : Rat) / 53375) [(4, 1), (7, 1), (11, 1), (13, 2)],
  term ((-38134528 : Rat) / 53375) [(4, 2), (7, 1), (11, 1), (13, 2)],
  term ((-38134528 : Rat) / 53375) [(5, 2), (7, 1), (11, 1), (13, 2)],
  term ((-76269056 : Rat) / 53375) [(7, 1), (11, 1), (12, 1), (13, 2)],
  term ((38134528 : Rat) / 53375) [(7, 1), (11, 1), (12, 2), (13, 2)],
  term ((38134528 : Rat) / 53375) [(7, 1), (11, 1), (13, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 370 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0370_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0370
        rs_R003_ueqv_R003YY_generator_04_0300_0399 =
      rs_R003_ueqv_R003YY_partial_04_0370 := by
  native_decide

/-- Coefficient term 371 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0371 : Poly :=
[
  term ((6144 : Rat) / 7) [(7, 1), (11, 1), (13, 2), (14, 1)]
]

/-- Partial product 371 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0371 : Poly :=
[
  term ((-12288 : Rat) / 7) [(4, 1), (7, 1), (11, 1), (13, 2), (14, 1)],
  term ((6144 : Rat) / 7) [(4, 2), (7, 1), (11, 1), (13, 2), (14, 1)],
  term ((6144 : Rat) / 7) [(5, 2), (7, 1), (11, 1), (13, 2), (14, 1)],
  term ((12288 : Rat) / 7) [(7, 1), (11, 1), (12, 1), (13, 2), (14, 1)],
  term ((-6144 : Rat) / 7) [(7, 1), (11, 1), (12, 2), (13, 2), (14, 1)],
  term ((-6144 : Rat) / 7) [(7, 1), (11, 1), (13, 4), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 371 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0371_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0371
        rs_R003_ueqv_R003YY_generator_04_0300_0399 =
      rs_R003_ueqv_R003YY_partial_04_0371 := by
  native_decide

/-- Coefficient term 372 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0372 : Poly :=
[
  term ((-2048 : Rat) / 7) [(7, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 372 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0372 : Poly :=
[
  term ((4096 : Rat) / 7) [(4, 1), (7, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-2048 : Rat) / 7) [(4, 2), (7, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-2048 : Rat) / 7) [(5, 2), (7, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-4096 : Rat) / 7) [(7, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((2048 : Rat) / 7) [(7, 1), (11, 1), (12, 2), (13, 2), (14, 1), (16, 1)],
  term ((2048 : Rat) / 7) [(7, 1), (11, 1), (13, 4), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 372 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0372_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0372
        rs_R003_ueqv_R003YY_generator_04_0300_0399 =
      rs_R003_ueqv_R003YY_partial_04_0372 := by
  native_decide

/-- Coefficient term 373 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0373 : Poly :=
[
  term ((1664 : Rat) / 7) [(7, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 373 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0373 : Poly :=
[
  term ((-3328 : Rat) / 7) [(4, 1), (7, 1), (11, 1), (13, 2), (16, 1)],
  term ((1664 : Rat) / 7) [(4, 2), (7, 1), (11, 1), (13, 2), (16, 1)],
  term ((1664 : Rat) / 7) [(5, 2), (7, 1), (11, 1), (13, 2), (16, 1)],
  term ((3328 : Rat) / 7) [(7, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-1664 : Rat) / 7) [(7, 1), (11, 1), (12, 2), (13, 2), (16, 1)],
  term ((-1664 : Rat) / 7) [(7, 1), (11, 1), (13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 373 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0373_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0373
        rs_R003_ueqv_R003YY_generator_04_0300_0399 =
      rs_R003_ueqv_R003YY_partial_04_0373 := by
  native_decide

/-- Coefficient term 374 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0374 : Poly :=
[
  term ((10531336 : Rat) / 53375) [(7, 1), (12, 1), (13, 1)]
]

/-- Partial product 374 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0374 : Poly :=
[
  term ((-21062672 : Rat) / 53375) [(4, 1), (7, 1), (12, 1), (13, 1)],
  term ((10531336 : Rat) / 53375) [(4, 2), (7, 1), (12, 1), (13, 1)],
  term ((10531336 : Rat) / 53375) [(5, 2), (7, 1), (12, 1), (13, 1)],
  term ((-10531336 : Rat) / 53375) [(7, 1), (12, 1), (13, 3)],
  term ((21062672 : Rat) / 53375) [(7, 1), (12, 2), (13, 1)],
  term ((-10531336 : Rat) / 53375) [(7, 1), (12, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 374 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0374_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0374
        rs_R003_ueqv_R003YY_generator_04_0300_0399 =
      rs_R003_ueqv_R003YY_partial_04_0374 := by
  native_decide

/-- Coefficient term 375 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0375 : Poly :=
[
  term ((-13028352 : Rat) / 53375) [(7, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 375 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0375 : Poly :=
[
  term ((26056704 : Rat) / 53375) [(4, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((-13028352 : Rat) / 53375) [(4, 2), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((-13028352 : Rat) / 53375) [(5, 2), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((13028352 : Rat) / 53375) [(7, 1), (12, 1), (13, 3), (14, 1)],
  term ((-26056704 : Rat) / 53375) [(7, 1), (12, 2), (13, 1), (14, 1)],
  term ((13028352 : Rat) / 53375) [(7, 1), (12, 3), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 375 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0375_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0375
        rs_R003_ueqv_R003YY_generator_04_0300_0399 =
      rs_R003_ueqv_R003YY_partial_04_0375 := by
  native_decide

/-- Coefficient term 376 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0376 : Poly :=
[
  term ((2816 : Rat) / 35) [(7, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 376 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0376 : Poly :=
[
  term ((-5632 : Rat) / 35) [(4, 1), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((2816 : Rat) / 35) [(4, 2), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((2816 : Rat) / 35) [(5, 2), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2816 : Rat) / 35) [(7, 1), (12, 1), (13, 3), (14, 1), (16, 1)],
  term ((5632 : Rat) / 35) [(7, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-2816 : Rat) / 35) [(7, 1), (12, 3), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 376 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0376_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0376
        rs_R003_ueqv_R003YY_generator_04_0300_0399 =
      rs_R003_ueqv_R003YY_partial_04_0376 := by
  native_decide

/-- Coefficient term 377 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0377 : Poly :=
[
  term ((-2288 : Rat) / 35) [(7, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 377 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0377 : Poly :=
[
  term ((4576 : Rat) / 35) [(4, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-2288 : Rat) / 35) [(4, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-2288 : Rat) / 35) [(5, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((2288 : Rat) / 35) [(7, 1), (12, 1), (13, 3), (16, 1)],
  term ((-4576 : Rat) / 35) [(7, 1), (12, 2), (13, 1), (16, 1)],
  term ((2288 : Rat) / 35) [(7, 1), (12, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 377 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0377_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0377
        rs_R003_ueqv_R003YY_generator_04_0300_0399 =
      rs_R003_ueqv_R003YY_partial_04_0377 := by
  native_decide

/-- Coefficient term 378 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0378 : Poly :=
[
  term ((41173 : Rat) / 1050) [(7, 1), (12, 1), (15, 1)]
]

/-- Partial product 378 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0378 : Poly :=
[
  term ((-41173 : Rat) / 525) [(4, 1), (7, 1), (12, 1), (15, 1)],
  term ((41173 : Rat) / 1050) [(4, 2), (7, 1), (12, 1), (15, 1)],
  term ((41173 : Rat) / 1050) [(5, 2), (7, 1), (12, 1), (15, 1)],
  term ((-41173 : Rat) / 1050) [(7, 1), (12, 1), (13, 2), (15, 1)],
  term ((41173 : Rat) / 525) [(7, 1), (12, 2), (15, 1)],
  term ((-41173 : Rat) / 1050) [(7, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 378 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0378_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0378
        rs_R003_ueqv_R003YY_generator_04_0300_0399 =
      rs_R003_ueqv_R003YY_partial_04_0378 := by
  native_decide

/-- Coefficient term 379 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0379 : Poly :=
[
  term ((-603 : Rat) / 70) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 379 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0379 : Poly :=
[
  term ((603 : Rat) / 35) [(4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-603 : Rat) / 70) [(4, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-603 : Rat) / 70) [(5, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((603 : Rat) / 70) [(7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-603 : Rat) / 35) [(7, 1), (12, 2), (15, 1), (16, 1)],
  term ((603 : Rat) / 70) [(7, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 379 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0379_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0379
        rs_R003_ueqv_R003YY_generator_04_0300_0399 =
      rs_R003_ueqv_R003YY_partial_04_0379 := by
  native_decide

/-- Coefficient term 380 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0380 : Poly :=
[
  term ((-590092 : Rat) / 2135) [(7, 1), (13, 1)]
]

/-- Partial product 380 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0380 : Poly :=
[
  term ((1180184 : Rat) / 2135) [(4, 1), (7, 1), (13, 1)],
  term ((-590092 : Rat) / 2135) [(4, 2), (7, 1), (13, 1)],
  term ((-590092 : Rat) / 2135) [(5, 2), (7, 1), (13, 1)],
  term ((-1180184 : Rat) / 2135) [(7, 1), (12, 1), (13, 1)],
  term ((590092 : Rat) / 2135) [(7, 1), (12, 2), (13, 1)],
  term ((590092 : Rat) / 2135) [(7, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 380 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0380_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0380
        rs_R003_ueqv_R003YY_generator_04_0300_0399 =
      rs_R003_ueqv_R003YY_partial_04_0380 := by
  native_decide

/-- Coefficient term 381 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0381 : Poly :=
[
  term ((13539504 : Rat) / 53375) [(7, 1), (13, 1), (14, 1)]
]

/-- Partial product 381 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0381 : Poly :=
[
  term ((-27079008 : Rat) / 53375) [(4, 1), (7, 1), (13, 1), (14, 1)],
  term ((13539504 : Rat) / 53375) [(4, 2), (7, 1), (13, 1), (14, 1)],
  term ((13539504 : Rat) / 53375) [(5, 2), (7, 1), (13, 1), (14, 1)],
  term ((27079008 : Rat) / 53375) [(7, 1), (12, 1), (13, 1), (14, 1)],
  term ((-13539504 : Rat) / 53375) [(7, 1), (12, 2), (13, 1), (14, 1)],
  term ((-13539504 : Rat) / 53375) [(7, 1), (13, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 381 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0381_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0381
        rs_R003_ueqv_R003YY_generator_04_0300_0399 =
      rs_R003_ueqv_R003YY_partial_04_0381 := by
  native_decide

/-- Coefficient term 382 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0382 : Poly :=
[
  term ((-64 : Rat) / 7) [(7, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 382 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0382 : Poly :=
[
  term ((128 : Rat) / 7) [(4, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-64 : Rat) / 7) [(4, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-64 : Rat) / 7) [(5, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-128 : Rat) / 7) [(7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((64 : Rat) / 7) [(7, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((64 : Rat) / 7) [(7, 1), (13, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 382 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0382_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0382
        rs_R003_ueqv_R003YY_generator_04_0300_0399 =
      rs_R003_ueqv_R003YY_partial_04_0382 := by
  native_decide

/-- Coefficient term 383 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0383 : Poly :=
[
  term ((92 : Rat) / 35) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 383 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0383 : Poly :=
[
  term ((-184 : Rat) / 35) [(4, 1), (7, 1), (13, 1), (16, 1)],
  term ((92 : Rat) / 35) [(4, 2), (7, 1), (13, 1), (16, 1)],
  term ((92 : Rat) / 35) [(5, 2), (7, 1), (13, 1), (16, 1)],
  term ((184 : Rat) / 35) [(7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-92 : Rat) / 35) [(7, 1), (12, 2), (13, 1), (16, 1)],
  term ((-92 : Rat) / 35) [(7, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 383 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0383_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0383
        rs_R003_ueqv_R003YY_generator_04_0300_0399 =
      rs_R003_ueqv_R003YY_partial_04_0383 := by
  native_decide

/-- Coefficient term 384 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0384 : Poly :=
[
  term ((12 : Rat) / 5) [(7, 1), (14, 1), (15, 1)]
]

/-- Partial product 384 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0384 : Poly :=
[
  term ((-24 : Rat) / 5) [(4, 1), (7, 1), (14, 1), (15, 1)],
  term ((12 : Rat) / 5) [(4, 2), (7, 1), (14, 1), (15, 1)],
  term ((12 : Rat) / 5) [(5, 2), (7, 1), (14, 1), (15, 1)],
  term ((24 : Rat) / 5) [(7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-12 : Rat) / 5) [(7, 1), (12, 2), (14, 1), (15, 1)],
  term ((-12 : Rat) / 5) [(7, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 384 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0384_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0384
        rs_R003_ueqv_R003YY_generator_04_0300_0399 =
      rs_R003_ueqv_R003YY_partial_04_0384 := by
  native_decide

/-- Coefficient term 385 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0385 : Poly :=
[
  term ((-10763 : Rat) / 4200) [(7, 1), (15, 1)]
]

/-- Partial product 385 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0385 : Poly :=
[
  term ((10763 : Rat) / 2100) [(4, 1), (7, 1), (15, 1)],
  term ((-10763 : Rat) / 4200) [(4, 2), (7, 1), (15, 1)],
  term ((-10763 : Rat) / 4200) [(5, 2), (7, 1), (15, 1)],
  term ((-10763 : Rat) / 2100) [(7, 1), (12, 1), (15, 1)],
  term ((10763 : Rat) / 4200) [(7, 1), (12, 2), (15, 1)],
  term ((10763 : Rat) / 4200) [(7, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 385 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0385_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0385
        rs_R003_ueqv_R003YY_generator_04_0300_0399 =
      rs_R003_ueqv_R003YY_partial_04_0385 := by
  native_decide

/-- Coefficient term 386 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0386 : Poly :=
[
  term ((269 : Rat) / 280) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 386 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0386 : Poly :=
[
  term ((-269 : Rat) / 140) [(4, 1), (7, 1), (15, 1), (16, 1)],
  term ((269 : Rat) / 280) [(4, 2), (7, 1), (15, 1), (16, 1)],
  term ((269 : Rat) / 280) [(5, 2), (7, 1), (15, 1), (16, 1)],
  term ((269 : Rat) / 140) [(7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-269 : Rat) / 280) [(7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-269 : Rat) / 280) [(7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 386 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0386_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0386
        rs_R003_ueqv_R003YY_generator_04_0300_0399 =
      rs_R003_ueqv_R003YY_partial_04_0386 := by
  native_decide

/-- Coefficient term 387 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0387 : Poly :=
[
  term ((628 : Rat) / 5) [(7, 2)]
]

/-- Partial product 387 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0387 : Poly :=
[
  term ((-1256 : Rat) / 5) [(4, 1), (7, 2)],
  term ((628 : Rat) / 5) [(4, 2), (7, 2)],
  term ((628 : Rat) / 5) [(5, 2), (7, 2)],
  term ((1256 : Rat) / 5) [(7, 2), (12, 1)],
  term ((-628 : Rat) / 5) [(7, 2), (12, 2)],
  term ((-628 : Rat) / 5) [(7, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 387 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0387_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0387
        rs_R003_ueqv_R003YY_generator_04_0300_0399 =
      rs_R003_ueqv_R003YY_partial_04_0387 := by
  native_decide

/-- Coefficient term 388 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0388 : Poly :=
[
  term ((19067264 : Rat) / 53375) [(7, 2), (11, 1), (13, 1)]
]

/-- Partial product 388 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0388 : Poly :=
[
  term ((-38134528 : Rat) / 53375) [(4, 1), (7, 2), (11, 1), (13, 1)],
  term ((19067264 : Rat) / 53375) [(4, 2), (7, 2), (11, 1), (13, 1)],
  term ((19067264 : Rat) / 53375) [(5, 2), (7, 2), (11, 1), (13, 1)],
  term ((38134528 : Rat) / 53375) [(7, 2), (11, 1), (12, 1), (13, 1)],
  term ((-19067264 : Rat) / 53375) [(7, 2), (11, 1), (12, 2), (13, 1)],
  term ((-19067264 : Rat) / 53375) [(7, 2), (11, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 388 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0388_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0388
        rs_R003_ueqv_R003YY_generator_04_0300_0399 =
      rs_R003_ueqv_R003YY_partial_04_0388 := by
  native_decide

/-- Coefficient term 389 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0389 : Poly :=
[
  term ((-3072 : Rat) / 7) [(7, 2), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 389 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0389 : Poly :=
[
  term ((6144 : Rat) / 7) [(4, 1), (7, 2), (11, 1), (13, 1), (14, 1)],
  term ((-3072 : Rat) / 7) [(4, 2), (7, 2), (11, 1), (13, 1), (14, 1)],
  term ((-3072 : Rat) / 7) [(5, 2), (7, 2), (11, 1), (13, 1), (14, 1)],
  term ((-6144 : Rat) / 7) [(7, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((3072 : Rat) / 7) [(7, 2), (11, 1), (12, 2), (13, 1), (14, 1)],
  term ((3072 : Rat) / 7) [(7, 2), (11, 1), (13, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 389 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0389_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0389
        rs_R003_ueqv_R003YY_generator_04_0300_0399 =
      rs_R003_ueqv_R003YY_partial_04_0389 := by
  native_decide

/-- Coefficient term 390 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0390 : Poly :=
[
  term ((1024 : Rat) / 7) [(7, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 390 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0390 : Poly :=
[
  term ((-2048 : Rat) / 7) [(4, 1), (7, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((1024 : Rat) / 7) [(4, 2), (7, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((1024 : Rat) / 7) [(5, 2), (7, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((2048 : Rat) / 7) [(7, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1024 : Rat) / 7) [(7, 2), (11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-1024 : Rat) / 7) [(7, 2), (11, 1), (13, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 390 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0390_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0390
        rs_R003_ueqv_R003YY_generator_04_0300_0399 =
      rs_R003_ueqv_R003YY_partial_04_0390 := by
  native_decide

/-- Coefficient term 391 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0391 : Poly :=
[
  term ((-832 : Rat) / 7) [(7, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 391 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0391 : Poly :=
[
  term ((1664 : Rat) / 7) [(4, 1), (7, 2), (11, 1), (13, 1), (16, 1)],
  term ((-832 : Rat) / 7) [(4, 2), (7, 2), (11, 1), (13, 1), (16, 1)],
  term ((-832 : Rat) / 7) [(5, 2), (7, 2), (11, 1), (13, 1), (16, 1)],
  term ((-1664 : Rat) / 7) [(7, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((832 : Rat) / 7) [(7, 2), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((832 : Rat) / 7) [(7, 2), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 391 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0391_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0391
        rs_R003_ueqv_R003YY_generator_04_0300_0399 =
      rs_R003_ueqv_R003YY_partial_04_0391 := by
  native_decide

/-- Coefficient term 392 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0392 : Poly :=
[
  term ((25574 : Rat) / 105) [(7, 2), (11, 1), (15, 1)]
]

/-- Partial product 392 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0392 : Poly :=
[
  term ((-51148 : Rat) / 105) [(4, 1), (7, 2), (11, 1), (15, 1)],
  term ((25574 : Rat) / 105) [(4, 2), (7, 2), (11, 1), (15, 1)],
  term ((25574 : Rat) / 105) [(5, 2), (7, 2), (11, 1), (15, 1)],
  term ((51148 : Rat) / 105) [(7, 2), (11, 1), (12, 1), (15, 1)],
  term ((-25574 : Rat) / 105) [(7, 2), (11, 1), (12, 2), (15, 1)],
  term ((-25574 : Rat) / 105) [(7, 2), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 392 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0392_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0392
        rs_R003_ueqv_R003YY_generator_04_0300_0399 =
      rs_R003_ueqv_R003YY_partial_04_0392 := by
  native_decide

/-- Coefficient term 393 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0393 : Poly :=
[
  term ((-1042 : Rat) / 35) [(7, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 393 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0393 : Poly :=
[
  term ((2084 : Rat) / 35) [(4, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1042 : Rat) / 35) [(4, 2), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1042 : Rat) / 35) [(5, 2), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-2084 : Rat) / 35) [(7, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1042 : Rat) / 35) [(7, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((1042 : Rat) / 35) [(7, 2), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 393 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0393_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0393
        rs_R003_ueqv_R003YY_generator_04_0300_0399 =
      rs_R003_ueqv_R003YY_partial_04_0393 := by
  native_decide

/-- Coefficient term 394 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0394 : Poly :=
[
  term ((-552 : Rat) / 5) [(7, 2), (14, 1)]
]

/-- Partial product 394 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0394 : Poly :=
[
  term ((1104 : Rat) / 5) [(4, 1), (7, 2), (14, 1)],
  term ((-552 : Rat) / 5) [(4, 2), (7, 2), (14, 1)],
  term ((-552 : Rat) / 5) [(5, 2), (7, 2), (14, 1)],
  term ((-1104 : Rat) / 5) [(7, 2), (12, 1), (14, 1)],
  term ((552 : Rat) / 5) [(7, 2), (12, 2), (14, 1)],
  term ((552 : Rat) / 5) [(7, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 394 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0394_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0394
        rs_R003_ueqv_R003YY_generator_04_0300_0399 =
      rs_R003_ueqv_R003YY_partial_04_0394 := by
  native_decide

/-- Coefficient term 395 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0395 : Poly :=
[
  term ((12 : Rat) / 5) [(7, 2), (16, 1)]
]

/-- Partial product 395 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0395 : Poly :=
[
  term ((-24 : Rat) / 5) [(4, 1), (7, 2), (16, 1)],
  term ((12 : Rat) / 5) [(4, 2), (7, 2), (16, 1)],
  term ((12 : Rat) / 5) [(5, 2), (7, 2), (16, 1)],
  term ((24 : Rat) / 5) [(7, 2), (12, 1), (16, 1)],
  term ((-12 : Rat) / 5) [(7, 2), (12, 2), (16, 1)],
  term ((-12 : Rat) / 5) [(7, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 395 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0395_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0395
        rs_R003_ueqv_R003YY_generator_04_0300_0399 =
      rs_R003_ueqv_R003YY_partial_04_0395 := by
  native_decide

/-- Coefficient term 396 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0396 : Poly :=
[
  term ((378664 : Rat) / 10675) [(9, 1), (10, 1), (13, 1)]
]

/-- Partial product 396 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0396 : Poly :=
[
  term ((-757328 : Rat) / 10675) [(4, 1), (9, 1), (10, 1), (13, 1)],
  term ((378664 : Rat) / 10675) [(4, 2), (9, 1), (10, 1), (13, 1)],
  term ((378664 : Rat) / 10675) [(5, 2), (9, 1), (10, 1), (13, 1)],
  term ((757328 : Rat) / 10675) [(9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-378664 : Rat) / 10675) [(9, 1), (10, 1), (12, 2), (13, 1)],
  term ((-378664 : Rat) / 10675) [(9, 1), (10, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 396 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0396_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0396
        rs_R003_ueqv_R003YY_generator_04_0300_0399 =
      rs_R003_ueqv_R003YY_partial_04_0396 := by
  native_decide

/-- Coefficient term 397 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0397 : Poly :=
[
  term ((-1536 : Rat) / 35) [(9, 1), (10, 1), (13, 1), (14, 1)]
]

/-- Partial product 397 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0397 : Poly :=
[
  term ((3072 : Rat) / 35) [(4, 1), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((-1536 : Rat) / 35) [(4, 2), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((-1536 : Rat) / 35) [(5, 2), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((-3072 : Rat) / 35) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((1536 : Rat) / 35) [(9, 1), (10, 1), (12, 2), (13, 1), (14, 1)],
  term ((1536 : Rat) / 35) [(9, 1), (10, 1), (13, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 397 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0397_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0397
        rs_R003_ueqv_R003YY_generator_04_0300_0399 =
      rs_R003_ueqv_R003YY_partial_04_0397 := by
  native_decide

/-- Coefficient term 398 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0398 : Poly :=
[
  term ((512 : Rat) / 35) [(9, 1), (10, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 398 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0398 : Poly :=
[
  term ((-1024 : Rat) / 35) [(4, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((512 : Rat) / 35) [(4, 2), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((512 : Rat) / 35) [(5, 2), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((1024 : Rat) / 35) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-512 : Rat) / 35) [(9, 1), (10, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-512 : Rat) / 35) [(9, 1), (10, 1), (13, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 398 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0398_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0398
        rs_R003_ueqv_R003YY_generator_04_0300_0399 =
      rs_R003_ueqv_R003YY_partial_04_0398 := by
  native_decide

/-- Coefficient term 399 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0399 : Poly :=
[
  term ((-416 : Rat) / 35) [(9, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 399 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0399 : Poly :=
[
  term ((832 : Rat) / 35) [(4, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-416 : Rat) / 35) [(4, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-416 : Rat) / 35) [(5, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-832 : Rat) / 35) [(9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((416 : Rat) / 35) [(9, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((416 : Rat) / 35) [(9, 1), (10, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 399 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0399_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0399
        rs_R003_ueqv_R003YY_generator_04_0300_0399 =
      rs_R003_ueqv_R003YY_partial_04_0399 := by
  native_decide

/-- Partial products in this block. -/
def rs_R003_ueqv_R003YY_partials_04_0300_0399 : List Poly :=
[
  rs_R003_ueqv_R003YY_partial_04_0300,
  rs_R003_ueqv_R003YY_partial_04_0301,
  rs_R003_ueqv_R003YY_partial_04_0302,
  rs_R003_ueqv_R003YY_partial_04_0303,
  rs_R003_ueqv_R003YY_partial_04_0304,
  rs_R003_ueqv_R003YY_partial_04_0305,
  rs_R003_ueqv_R003YY_partial_04_0306,
  rs_R003_ueqv_R003YY_partial_04_0307,
  rs_R003_ueqv_R003YY_partial_04_0308,
  rs_R003_ueqv_R003YY_partial_04_0309,
  rs_R003_ueqv_R003YY_partial_04_0310,
  rs_R003_ueqv_R003YY_partial_04_0311,
  rs_R003_ueqv_R003YY_partial_04_0312,
  rs_R003_ueqv_R003YY_partial_04_0313,
  rs_R003_ueqv_R003YY_partial_04_0314,
  rs_R003_ueqv_R003YY_partial_04_0315,
  rs_R003_ueqv_R003YY_partial_04_0316,
  rs_R003_ueqv_R003YY_partial_04_0317,
  rs_R003_ueqv_R003YY_partial_04_0318,
  rs_R003_ueqv_R003YY_partial_04_0319,
  rs_R003_ueqv_R003YY_partial_04_0320,
  rs_R003_ueqv_R003YY_partial_04_0321,
  rs_R003_ueqv_R003YY_partial_04_0322,
  rs_R003_ueqv_R003YY_partial_04_0323,
  rs_R003_ueqv_R003YY_partial_04_0324,
  rs_R003_ueqv_R003YY_partial_04_0325,
  rs_R003_ueqv_R003YY_partial_04_0326,
  rs_R003_ueqv_R003YY_partial_04_0327,
  rs_R003_ueqv_R003YY_partial_04_0328,
  rs_R003_ueqv_R003YY_partial_04_0329,
  rs_R003_ueqv_R003YY_partial_04_0330,
  rs_R003_ueqv_R003YY_partial_04_0331,
  rs_R003_ueqv_R003YY_partial_04_0332,
  rs_R003_ueqv_R003YY_partial_04_0333,
  rs_R003_ueqv_R003YY_partial_04_0334,
  rs_R003_ueqv_R003YY_partial_04_0335,
  rs_R003_ueqv_R003YY_partial_04_0336,
  rs_R003_ueqv_R003YY_partial_04_0337,
  rs_R003_ueqv_R003YY_partial_04_0338,
  rs_R003_ueqv_R003YY_partial_04_0339,
  rs_R003_ueqv_R003YY_partial_04_0340,
  rs_R003_ueqv_R003YY_partial_04_0341,
  rs_R003_ueqv_R003YY_partial_04_0342,
  rs_R003_ueqv_R003YY_partial_04_0343,
  rs_R003_ueqv_R003YY_partial_04_0344,
  rs_R003_ueqv_R003YY_partial_04_0345,
  rs_R003_ueqv_R003YY_partial_04_0346,
  rs_R003_ueqv_R003YY_partial_04_0347,
  rs_R003_ueqv_R003YY_partial_04_0348,
  rs_R003_ueqv_R003YY_partial_04_0349,
  rs_R003_ueqv_R003YY_partial_04_0350,
  rs_R003_ueqv_R003YY_partial_04_0351,
  rs_R003_ueqv_R003YY_partial_04_0352,
  rs_R003_ueqv_R003YY_partial_04_0353,
  rs_R003_ueqv_R003YY_partial_04_0354,
  rs_R003_ueqv_R003YY_partial_04_0355,
  rs_R003_ueqv_R003YY_partial_04_0356,
  rs_R003_ueqv_R003YY_partial_04_0357,
  rs_R003_ueqv_R003YY_partial_04_0358,
  rs_R003_ueqv_R003YY_partial_04_0359,
  rs_R003_ueqv_R003YY_partial_04_0360,
  rs_R003_ueqv_R003YY_partial_04_0361,
  rs_R003_ueqv_R003YY_partial_04_0362,
  rs_R003_ueqv_R003YY_partial_04_0363,
  rs_R003_ueqv_R003YY_partial_04_0364,
  rs_R003_ueqv_R003YY_partial_04_0365,
  rs_R003_ueqv_R003YY_partial_04_0366,
  rs_R003_ueqv_R003YY_partial_04_0367,
  rs_R003_ueqv_R003YY_partial_04_0368,
  rs_R003_ueqv_R003YY_partial_04_0369,
  rs_R003_ueqv_R003YY_partial_04_0370,
  rs_R003_ueqv_R003YY_partial_04_0371,
  rs_R003_ueqv_R003YY_partial_04_0372,
  rs_R003_ueqv_R003YY_partial_04_0373,
  rs_R003_ueqv_R003YY_partial_04_0374,
  rs_R003_ueqv_R003YY_partial_04_0375,
  rs_R003_ueqv_R003YY_partial_04_0376,
  rs_R003_ueqv_R003YY_partial_04_0377,
  rs_R003_ueqv_R003YY_partial_04_0378,
  rs_R003_ueqv_R003YY_partial_04_0379,
  rs_R003_ueqv_R003YY_partial_04_0380,
  rs_R003_ueqv_R003YY_partial_04_0381,
  rs_R003_ueqv_R003YY_partial_04_0382,
  rs_R003_ueqv_R003YY_partial_04_0383,
  rs_R003_ueqv_R003YY_partial_04_0384,
  rs_R003_ueqv_R003YY_partial_04_0385,
  rs_R003_ueqv_R003YY_partial_04_0386,
  rs_R003_ueqv_R003YY_partial_04_0387,
  rs_R003_ueqv_R003YY_partial_04_0388,
  rs_R003_ueqv_R003YY_partial_04_0389,
  rs_R003_ueqv_R003YY_partial_04_0390,
  rs_R003_ueqv_R003YY_partial_04_0391,
  rs_R003_ueqv_R003YY_partial_04_0392,
  rs_R003_ueqv_R003YY_partial_04_0393,
  rs_R003_ueqv_R003YY_partial_04_0394,
  rs_R003_ueqv_R003YY_partial_04_0395,
  rs_R003_ueqv_R003YY_partial_04_0396,
  rs_R003_ueqv_R003YY_partial_04_0397,
  rs_R003_ueqv_R003YY_partial_04_0398,
  rs_R003_ueqv_R003YY_partial_04_0399
]

/-- Sum of partial products in this block. -/
def rs_R003_ueqv_R003YY_block_04_0300_0399 : Poly :=
[
  term ((-576 : Rat) / 35) [(3, 2), (4, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1152 : Rat) / 35) [(3, 2), (4, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-864 : Rat) / 35) [(3, 2), (4, 1), (9, 1), (11, 1), (14, 1)],
  term ((288 : Rat) / 35) [(3, 2), (4, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((576 : Rat) / 35) [(3, 2), (4, 1), (9, 1), (11, 1), (16, 1)],
  term ((216 : Rat) / 5) [(3, 2), (4, 1), (9, 1), (12, 1), (15, 1)],
  term ((-24 : Rat) / 5) [(3, 2), (4, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-108 : Rat) / 5) [(3, 2), (4, 1), (9, 1), (15, 1)],
  term ((12 : Rat) / 5) [(3, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((288 : Rat) / 35) [(3, 2), (4, 2), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((576 : Rat) / 35) [(3, 2), (4, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((432 : Rat) / 35) [(3, 2), (4, 2), (9, 1), (11, 1), (14, 1)],
  term ((-144 : Rat) / 35) [(3, 2), (4, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-288 : Rat) / 35) [(3, 2), (4, 2), (9, 1), (11, 1), (16, 1)],
  term ((-108 : Rat) / 5) [(3, 2), (4, 2), (9, 1), (12, 1), (15, 1)],
  term ((12 : Rat) / 5) [(3, 2), (4, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((54 : Rat) / 5) [(3, 2), (4, 2), (9, 1), (15, 1)],
  term ((-6 : Rat) / 5) [(3, 2), (4, 2), (9, 1), (15, 1), (16, 1)],
  term ((288 : Rat) / 35) [(3, 2), (5, 2), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((576 : Rat) / 35) [(3, 2), (5, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((432 : Rat) / 35) [(3, 2), (5, 2), (9, 1), (11, 1), (14, 1)],
  term ((-144 : Rat) / 35) [(3, 2), (5, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-288 : Rat) / 35) [(3, 2), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-108 : Rat) / 5) [(3, 2), (5, 2), (9, 1), (12, 1), (15, 1)],
  term ((12 : Rat) / 5) [(3, 2), (5, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((54 : Rat) / 5) [(3, 2), (5, 2), (9, 1), (15, 1)],
  term ((-6 : Rat) / 5) [(3, 2), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-288 : Rat) / 35) [(3, 2), (9, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-576 : Rat) / 35) [(3, 2), (9, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((864 : Rat) / 35) [(3, 2), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((-288 : Rat) / 35) [(3, 2), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-576 : Rat) / 35) [(3, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-432 : Rat) / 35) [(3, 2), (9, 1), (11, 1), (12, 2), (14, 1)],
  term ((144 : Rat) / 7) [(3, 2), (9, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((288 : Rat) / 7) [(3, 2), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((-288 : Rat) / 35) [(3, 2), (9, 1), (11, 1), (12, 3), (14, 1), (16, 1)],
  term ((-576 : Rat) / 35) [(3, 2), (9, 1), (11, 1), (12, 3), (16, 1)],
  term ((-432 : Rat) / 35) [(3, 2), (9, 1), (11, 1), (13, 2), (14, 1)],
  term ((144 : Rat) / 35) [(3, 2), (9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((288 : Rat) / 35) [(3, 2), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((108 : Rat) / 5) [(3, 2), (9, 1), (12, 1), (13, 2), (15, 1)],
  term ((-12 : Rat) / 5) [(3, 2), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((108 : Rat) / 5) [(3, 2), (9, 1), (12, 1), (15, 1)],
  term ((-12 : Rat) / 5) [(3, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term (-54 : Rat) [(3, 2), (9, 1), (12, 2), (15, 1)],
  term (6 : Rat) [(3, 2), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((108 : Rat) / 5) [(3, 2), (9, 1), (12, 3), (15, 1)],
  term ((-12 : Rat) / 5) [(3, 2), (9, 1), (12, 3), (15, 1), (16, 1)],
  term ((-54 : Rat) / 5) [(3, 2), (9, 1), (13, 2), (15, 1)],
  term ((6 : Rat) / 5) [(3, 2), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-48 : Rat) / 5) [(4, 1), (5, 1), (7, 1)],
  term ((-48 : Rat) / 5) [(4, 1), (5, 1), (7, 1), (12, 1)],
  term ((48 : Rat) / 5) [(4, 1), (5, 1), (7, 1), (12, 1), (14, 1)],
  term ((48 : Rat) / 5) [(4, 1), (5, 1), (7, 1), (14, 1)],
  term ((-165888 : Rat) / 7625) [(4, 1), (5, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((82944 : Rat) / 7625) [(4, 1), (5, 1), (9, 1), (11, 1), (12, 2), (13, 1)],
  term ((-32832 : Rat) / 7625) [(4, 1), (5, 1), (9, 1), (11, 1), (13, 1)],
  term ((82944 : Rat) / 7625) [(4, 1), (5, 1), (9, 1), (11, 1), (13, 3)],
  term ((-331776 : Rat) / 7625) [(4, 1), (5, 1), (9, 1), (12, 1), (13, 2)],
  term ((165888 : Rat) / 7625) [(4, 1), (5, 1), (9, 1), (12, 2), (13, 2)],
  term ((-65664 : Rat) / 7625) [(4, 1), (5, 1), (9, 1), (13, 2)],
  term ((165888 : Rat) / 7625) [(4, 1), (5, 1), (9, 1), (13, 4)],
  term ((-221184 : Rat) / 7625) [(4, 1), (5, 1), (10, 1), (12, 1), (13, 1)],
  term ((110592 : Rat) / 7625) [(4, 1), (5, 1), (10, 1), (12, 2), (13, 1)],
  term ((-43776 : Rat) / 7625) [(4, 1), (5, 1), (10, 1), (13, 1)],
  term ((110592 : Rat) / 7625) [(4, 1), (5, 1), (10, 1), (13, 3)],
  term ((-576 : Rat) / 7625) [(4, 1), (5, 1), (12, 1), (13, 1)],
  term ((82944 : Rat) / 7625) [(4, 1), (5, 1), (12, 1), (13, 3)],
  term ((-32256 : Rat) / 1525) [(4, 1), (5, 1), (12, 2), (13, 1)],
  term ((-41472 : Rat) / 7625) [(4, 1), (5, 1), (12, 2), (13, 1), (14, 1)],
  term ((82944 : Rat) / 7625) [(4, 1), (5, 1), (12, 3), (13, 1)],
  term ((4728 : Rat) / 1525) [(4, 1), (5, 1), (13, 1)],
  term ((-17112 : Rat) / 7625) [(4, 1), (5, 1), (13, 1), (14, 1)],
  term ((4608 : Rat) / 7625) [(4, 1), (5, 1), (13, 3)],
  term ((-41472 : Rat) / 7625) [(4, 1), (5, 1), (13, 3), (14, 1)],
  term ((48 : Rat) / 5) [(4, 1), (5, 1), (14, 1), (15, 1)],
  term ((-24 : Rat) / 5) [(4, 1), (5, 1), (15, 1)],
  term ((-6 : Rat) / 5) [(4, 1), (5, 2)],
  term ((2496 : Rat) / 10675) [(4, 1), (5, 2), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((9984 : Rat) / 10675) [(4, 1), (5, 2), (7, 1), (11, 1), (13, 2)],
  term ((913632 : Rat) / 53375) [(4, 1), (5, 2), (7, 1), (12, 1), (13, 1)],
  term ((-358632 : Rat) / 53375) [(4, 1), (5, 2), (7, 1), (13, 1)],
  term ((-20736 : Rat) / 7625) [(4, 1), (5, 2), (7, 1), (13, 1), (14, 1)],
  term ((-4992 : Rat) / 10675) [(4, 1), (5, 2), (7, 2), (11, 1), (13, 1)],
  term ((30768 : Rat) / 53375) [(4, 1), (5, 2), (9, 1), (10, 1), (13, 1)],
  term ((-163392 : Rat) / 10675) [(4, 1), (5, 2), (9, 1), (11, 1), (13, 2)],
  term ((-80448 : Rat) / 10675) [(4, 1), (5, 2), (9, 1), (11, 2), (13, 1)],
  term ((-380832 : Rat) / 53375) [(4, 1), (5, 2), (9, 1), (12, 1), (13, 1)],
  term ((-79176 : Rat) / 53375) [(4, 1), (5, 2), (9, 1), (13, 1)],
  term ((-40224 : Rat) / 10675) [(4, 1), (5, 2), (10, 1), (11, 1), (13, 1)],
  term ((-76704 : Rat) / 10675) [(4, 1), (5, 2), (11, 1), (12, 1), (13, 1)],
  term ((31176 : Rat) / 10675) [(4, 1), (5, 2), (11, 1), (13, 1)],
  term ((10368 : Rat) / 7625) [(4, 1), (5, 2), (13, 1), (15, 1)],
  term ((-10656 : Rat) / 2135) [(4, 1), (5, 2), (13, 2)],
  term ((-82944 : Rat) / 7625) [(4, 1), (5, 3), (9, 1), (11, 1), (13, 1)],
  term ((-165888 : Rat) / 7625) [(4, 1), (5, 3), (9, 1), (13, 2)],
  term ((-110592 : Rat) / 7625) [(4, 1), (5, 3), (10, 1), (13, 1)],
  term ((-82944 : Rat) / 7625) [(4, 1), (5, 3), (12, 1), (13, 1)],
  term ((-4608 : Rat) / 7625) [(4, 1), (5, 3), (13, 1)],
  term ((41472 : Rat) / 7625) [(4, 1), (5, 3), (13, 1), (14, 1)],
  term ((12 : Rat) / 5) [(4, 1), (7, 1), (9, 1)],
  term ((4992 : Rat) / 10675) [(4, 1), (7, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((-2496 : Rat) / 10675) [(4, 1), (7, 1), (9, 1), (11, 1), (12, 2), (13, 1)],
  term ((19067264 : Rat) / 53375) [(4, 1), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-3072 : Rat) / 7) [(4, 1), (7, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((1024 : Rat) / 7) [(4, 1), (7, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-832 : Rat) / 7) [(4, 1), (7, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-2496 : Rat) / 10675) [(4, 1), (7, 1), (9, 1), (11, 1), (13, 3)],
  term ((25574 : Rat) / 105) [(4, 1), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((-1042 : Rat) / 35) [(4, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((24 : Rat) / 5) [(4, 1), (7, 1), (9, 1), (14, 1)],
  term ((12 : Rat) / 5) [(4, 1), (7, 1), (9, 1), (16, 1)],
  term ((19968 : Rat) / 10675) [(4, 1), (7, 1), (11, 1), (12, 1), (13, 2)],
  term ((-9984 : Rat) / 10675) [(4, 1), (7, 1), (11, 1), (12, 2), (13, 2)],
  term ((102296 : Rat) / 105) [(4, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-4168 : Rat) / 35) [(4, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((76269056 : Rat) / 53375) [(4, 1), (7, 1), (11, 1), (13, 2)],
  term ((-12288 : Rat) / 7) [(4, 1), (7, 1), (11, 1), (13, 2), (14, 1)],
  term ((4096 : Rat) / 7) [(4, 1), (7, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-3328 : Rat) / 7) [(4, 1), (7, 1), (11, 1), (13, 2), (16, 1)],
  term ((-9984 : Rat) / 10675) [(4, 1), (7, 1), (11, 1), (13, 4)],
  term ((-21779936 : Rat) / 53375) [(4, 1), (7, 1), (12, 1), (13, 1)],
  term ((16896 : Rat) / 35) [(4, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((-5632 : Rat) / 35) [(4, 1), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((4576 : Rat) / 35) [(4, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-913632 : Rat) / 53375) [(4, 1), (7, 1), (12, 1), (13, 3)],
  term ((-41173 : Rat) / 525) [(4, 1), (7, 1), (12, 1), (15, 1)],
  term ((603 : Rat) / 35) [(4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((2185896 : Rat) / 53375) [(4, 1), (7, 1), (12, 2), (13, 1)],
  term ((20736 : Rat) / 7625) [(4, 1), (7, 1), (12, 2), (13, 1), (14, 1)],
  term ((-913632 : Rat) / 53375) [(4, 1), (7, 1), (12, 3), (13, 1)],
  term ((1180184 : Rat) / 2135) [(4, 1), (7, 1), (13, 1)],
  term ((-27079008 : Rat) / 53375) [(4, 1), (7, 1), (13, 1), (14, 1)],
  term ((128 : Rat) / 7) [(4, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-184 : Rat) / 35) [(4, 1), (7, 1), (13, 1), (16, 1)],
  term ((358632 : Rat) / 53375) [(4, 1), (7, 1), (13, 3)],
  term ((20736 : Rat) / 7625) [(4, 1), (7, 1), (13, 3), (14, 1)],
  term ((-24 : Rat) / 5) [(4, 1), (7, 1), (14, 1), (15, 1)],
  term ((10763 : Rat) / 2100) [(4, 1), (7, 1), (15, 1)],
  term ((-269 : Rat) / 140) [(4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-1256 : Rat) / 5) [(4, 1), (7, 2)],
  term ((-9984 : Rat) / 10675) [(4, 1), (7, 2), (11, 1), (12, 1), (13, 1)],
  term ((4992 : Rat) / 10675) [(4, 1), (7, 2), (11, 1), (12, 2), (13, 1)],
  term ((-38134528 : Rat) / 53375) [(4, 1), (7, 2), (11, 1), (13, 1)],
  term ((6144 : Rat) / 7) [(4, 1), (7, 2), (11, 1), (13, 1), (14, 1)],
  term ((-2048 : Rat) / 7) [(4, 1), (7, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((1664 : Rat) / 7) [(4, 1), (7, 2), (11, 1), (13, 1), (16, 1)],
  term ((4992 : Rat) / 10675) [(4, 1), (7, 2), (11, 1), (13, 3)],
  term ((-51148 : Rat) / 105) [(4, 1), (7, 2), (11, 1), (15, 1)],
  term ((2084 : Rat) / 35) [(4, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((1104 : Rat) / 5) [(4, 1), (7, 2), (14, 1)],
  term ((-24 : Rat) / 5) [(4, 1), (7, 2), (16, 1)],
  term ((61536 : Rat) / 53375) [(4, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-30768 : Rat) / 53375) [(4, 1), (9, 1), (10, 1), (12, 2), (13, 1)],
  term ((-757328 : Rat) / 10675) [(4, 1), (9, 1), (10, 1), (13, 1)],
  term ((3072 : Rat) / 35) [(4, 1), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((-1024 : Rat) / 35) [(4, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((832 : Rat) / 35) [(4, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-30768 : Rat) / 53375) [(4, 1), (9, 1), (10, 1), (13, 3)],
  term ((-326784 : Rat) / 10675) [(4, 1), (9, 1), (11, 1), (12, 1), (13, 2)],
  term ((163392 : Rat) / 10675) [(4, 1), (9, 1), (11, 1), (12, 2), (13, 2)],
  term ((163392 : Rat) / 10675) [(4, 1), (9, 1), (11, 1), (13, 4)],
  term ((-160896 : Rat) / 10675) [(4, 1), (9, 1), (11, 2), (12, 1), (13, 1)],
  term ((80448 : Rat) / 10675) [(4, 1), (9, 1), (11, 2), (12, 2), (13, 1)],
  term ((80448 : Rat) / 10675) [(4, 1), (9, 1), (11, 2), (13, 3)],
  term ((-158352 : Rat) / 53375) [(4, 1), (9, 1), (12, 1), (13, 1)],
  term ((380832 : Rat) / 53375) [(4, 1), (9, 1), (12, 1), (13, 3)],
  term ((-682488 : Rat) / 53375) [(4, 1), (9, 1), (12, 2), (13, 1)],
  term ((380832 : Rat) / 53375) [(4, 1), (9, 1), (12, 3), (13, 1)],
  term ((79176 : Rat) / 53375) [(4, 1), (9, 1), (13, 3)],
  term ((-80448 : Rat) / 10675) [(4, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((40224 : Rat) / 10675) [(4, 1), (10, 1), (11, 1), (12, 2), (13, 1)],
  term ((40224 : Rat) / 10675) [(4, 1), (10, 1), (11, 1), (13, 3)],
  term ((62352 : Rat) / 10675) [(4, 1), (11, 1), (12, 1), (13, 1)],
  term ((76704 : Rat) / 10675) [(4, 1), (11, 1), (12, 1), (13, 3)],
  term ((-184584 : Rat) / 10675) [(4, 1), (11, 1), (12, 2), (13, 1)],
  term ((76704 : Rat) / 10675) [(4, 1), (11, 1), (12, 3), (13, 1)],
  term ((-31176 : Rat) / 10675) [(4, 1), (11, 1), (13, 3)],
  term ((-12 : Rat) / 5) [(4, 1), (12, 1)],
  term ((20736 : Rat) / 7625) [(4, 1), (12, 1), (13, 1), (15, 1)],
  term ((-21312 : Rat) / 2135) [(4, 1), (12, 1), (13, 2)],
  term ((6 : Rat) / 5) [(4, 1), (12, 2)],
  term ((-10368 : Rat) / 7625) [(4, 1), (12, 2), (13, 1), (15, 1)],
  term ((10656 : Rat) / 2135) [(4, 1), (12, 2), (13, 2)],
  term ((6 : Rat) / 5) [(4, 1), (13, 2)],
  term ((-10368 : Rat) / 7625) [(4, 1), (13, 3), (15, 1)],
  term ((10656 : Rat) / 2135) [(4, 1), (13, 4)],
  term ((12 : Rat) / 5) [(4, 2)],
  term ((24 : Rat) / 5) [(4, 2), (5, 1), (7, 1)],
  term ((24 : Rat) / 5) [(4, 2), (5, 1), (7, 1), (12, 1)],
  term ((-24 : Rat) / 5) [(4, 2), (5, 1), (7, 1), (12, 1), (14, 1)],
  term ((-24 : Rat) / 5) [(4, 2), (5, 1), (7, 1), (14, 1)],
  term ((182304 : Rat) / 7625) [(4, 2), (5, 1), (9, 1), (11, 1), (13, 1)],
  term ((364608 : Rat) / 7625) [(4, 2), (5, 1), (9, 1), (13, 2)],
  term ((243072 : Rat) / 7625) [(4, 2), (5, 1), (10, 1), (13, 1)],
  term ((161568 : Rat) / 7625) [(4, 2), (5, 1), (12, 1), (13, 1)],
  term ((41472 : Rat) / 7625) [(4, 2), (5, 1), (12, 1), (13, 1), (14, 1)],
  term ((-2604 : Rat) / 7625) [(4, 2), (5, 1), (13, 1)],
  term ((-74388 : Rat) / 7625) [(4, 2), (5, 1), (13, 1), (14, 1)],
  term ((-24 : Rat) / 5) [(4, 2), (5, 1), (14, 1), (15, 1)],
  term ((12 : Rat) / 5) [(4, 2), (5, 1), (15, 1)],
  term ((55296 : Rat) / 7625) [(4, 2), (5, 2), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((221184 : Rat) / 7625) [(4, 2), (5, 2), (7, 1), (11, 1), (13, 2)],
  term ((-156672 : Rat) / 7625) [(4, 2), (5, 2), (7, 1), (12, 1), (13, 1)],
  term ((43776 : Rat) / 7625) [(4, 2), (5, 2), (7, 1), (13, 1)],
  term ((-110592 : Rat) / 7625) [(4, 2), (5, 2), (7, 2), (11, 1), (13, 1)],
  term ((13824 : Rat) / 7625) [(4, 2), (5, 2), (9, 1), (10, 1), (13, 1)],
  term ((55296 : Rat) / 7625) [(4, 2), (5, 2), (9, 1), (11, 1), (13, 2)],
  term ((55296 : Rat) / 7625) [(4, 2), (5, 2), (9, 1), (11, 2), (13, 1)],
  term ((27648 : Rat) / 7625) [(4, 2), (5, 2), (9, 1), (12, 1), (13, 1)],
  term ((-20736 : Rat) / 7625) [(4, 2), (5, 2), (9, 1), (13, 1)],
  term ((27648 : Rat) / 7625) [(4, 2), (5, 2), (10, 1), (11, 1), (13, 1)],
  term ((27648 : Rat) / 1525) [(4, 2), (5, 2), (11, 1), (12, 1), (13, 1)],
  term ((-6912 : Rat) / 7625) [(4, 2), (5, 2), (11, 1), (13, 1)],
  term ((64512 : Rat) / 7625) [(4, 2), (5, 2), (13, 2)],
  term ((-6 : Rat) / 5) [(4, 2), (7, 1), (9, 1)],
  term ((110592 : Rat) / 7625) [(4, 2), (7, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((-55296 : Rat) / 7625) [(4, 2), (7, 1), (9, 1), (11, 1), (12, 2), (13, 1)],
  term ((-9558592 : Rat) / 53375) [(4, 2), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((1536 : Rat) / 7) [(4, 2), (7, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((-512 : Rat) / 7) [(4, 2), (7, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((416 : Rat) / 7) [(4, 2), (7, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-55296 : Rat) / 7625) [(4, 2), (7, 1), (9, 1), (11, 1), (13, 3)],
  term ((-12787 : Rat) / 105) [(4, 2), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((521 : Rat) / 35) [(4, 2), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-12 : Rat) / 5) [(4, 2), (7, 1), (9, 1), (14, 1)],
  term ((-6 : Rat) / 5) [(4, 2), (7, 1), (9, 1), (16, 1)],
  term ((442368 : Rat) / 7625) [(4, 2), (7, 1), (11, 1), (12, 1), (13, 2)],
  term ((-221184 : Rat) / 7625) [(4, 2), (7, 1), (11, 1), (12, 2), (13, 2)],
  term ((-51148 : Rat) / 105) [(4, 2), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((2084 : Rat) / 35) [(4, 2), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-38234368 : Rat) / 53375) [(4, 2), (7, 1), (11, 1), (13, 2)],
  term ((6144 : Rat) / 7) [(4, 2), (7, 1), (11, 1), (13, 2), (14, 1)],
  term ((-2048 : Rat) / 7) [(4, 2), (7, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((1664 : Rat) / 7) [(4, 2), (7, 1), (11, 1), (13, 2), (16, 1)],
  term ((-221184 : Rat) / 7625) [(4, 2), (7, 1), (11, 1), (13, 4)],
  term ((9316936 : Rat) / 53375) [(4, 2), (7, 1), (12, 1), (13, 1)],
  term ((-13028352 : Rat) / 53375) [(4, 2), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((2816 : Rat) / 35) [(4, 2), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2288 : Rat) / 35) [(4, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((156672 : Rat) / 7625) [(4, 2), (7, 1), (12, 1), (13, 3)],
  term ((41173 : Rat) / 1050) [(4, 2), (7, 1), (12, 1), (15, 1)],
  term ((-603 : Rat) / 70) [(4, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-71424 : Rat) / 1525) [(4, 2), (7, 1), (12, 2), (13, 1)],
  term ((156672 : Rat) / 7625) [(4, 2), (7, 1), (12, 3), (13, 1)],
  term ((-14035036 : Rat) / 53375) [(4, 2), (7, 1), (13, 1)],
  term ((13829808 : Rat) / 53375) [(4, 2), (7, 1), (13, 1), (14, 1)],
  term ((-64 : Rat) / 7) [(4, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((92 : Rat) / 35) [(4, 2), (7, 1), (13, 1), (16, 1)],
  term ((-43776 : Rat) / 7625) [(4, 2), (7, 1), (13, 3)],
  term ((12 : Rat) / 5) [(4, 2), (7, 1), (14, 1), (15, 1)],
  term ((-10763 : Rat) / 4200) [(4, 2), (7, 1), (15, 1)],
  term ((269 : Rat) / 280) [(4, 2), (7, 1), (15, 1), (16, 1)],
  term ((628 : Rat) / 5) [(4, 2), (7, 2)],
  term ((-221184 : Rat) / 7625) [(4, 2), (7, 2), (11, 1), (12, 1), (13, 1)],
  term ((110592 : Rat) / 7625) [(4, 2), (7, 2), (11, 1), (12, 2), (13, 1)],
  term ((19117184 : Rat) / 53375) [(4, 2), (7, 2), (11, 1), (13, 1)],
  term ((-3072 : Rat) / 7) [(4, 2), (7, 2), (11, 1), (13, 1), (14, 1)],
  term ((1024 : Rat) / 7) [(4, 2), (7, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-832 : Rat) / 7) [(4, 2), (7, 2), (11, 1), (13, 1), (16, 1)],
  term ((110592 : Rat) / 7625) [(4, 2), (7, 2), (11, 1), (13, 3)],
  term ((25574 : Rat) / 105) [(4, 2), (7, 2), (11, 1), (15, 1)],
  term ((-1042 : Rat) / 35) [(4, 2), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-552 : Rat) / 5) [(4, 2), (7, 2), (14, 1)],
  term ((12 : Rat) / 5) [(4, 2), (7, 2), (16, 1)],
  term ((27648 : Rat) / 7625) [(4, 2), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-13824 : Rat) / 7625) [(4, 2), (9, 1), (10, 1), (12, 2), (13, 1)],
  term ((1831784 : Rat) / 53375) [(4, 2), (9, 1), (10, 1), (13, 1)],
  term ((-1536 : Rat) / 35) [(4, 2), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((512 : Rat) / 35) [(4, 2), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-416 : Rat) / 35) [(4, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-13824 : Rat) / 7625) [(4, 2), (9, 1), (10, 1), (13, 3)],
  term ((110592 : Rat) / 7625) [(4, 2), (9, 1), (11, 1), (12, 1), (13, 2)],
  term ((-55296 : Rat) / 7625) [(4, 2), (9, 1), (11, 1), (12, 2), (13, 2)],
  term ((326784 : Rat) / 10675) [(4, 2), (9, 1), (11, 1), (13, 2)],
  term ((-55296 : Rat) / 7625) [(4, 2), (9, 1), (11, 1), (13, 4)],
  term ((110592 : Rat) / 7625) [(4, 2), (9, 1), (11, 2), (12, 1), (13, 1)],
  term ((-55296 : Rat) / 7625) [(4, 2), (9, 1), (11, 2), (12, 2), (13, 1)],
  term ((160896 : Rat) / 10675) [(4, 2), (9, 1), (11, 2), (13, 1)],
  term ((-55296 : Rat) / 7625) [(4, 2), (9, 1), (11, 2), (13, 3)],
  term ((94272 : Rat) / 10675) [(4, 2), (9, 1), (12, 1), (13, 1)],
  term ((-27648 : Rat) / 7625) [(4, 2), (9, 1), (12, 1), (13, 3)],
  term ((76032 : Rat) / 7625) [(4, 2), (9, 1), (12, 2), (13, 1)],
  term ((-27648 : Rat) / 7625) [(4, 2), (9, 1), (12, 3), (13, 1)],
  term ((158352 : Rat) / 53375) [(4, 2), (9, 1), (13, 1)],
  term ((20736 : Rat) / 7625) [(4, 2), (9, 1), (13, 3)],
  term ((55296 : Rat) / 7625) [(4, 2), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((-27648 : Rat) / 7625) [(4, 2), (10, 1), (11, 1), (12, 2), (13, 1)],
  term ((80448 : Rat) / 10675) [(4, 2), (10, 1), (11, 1), (13, 1)],
  term ((-27648 : Rat) / 7625) [(4, 2), (10, 1), (11, 1), (13, 3)],
  term ((670272 : Rat) / 53375) [(4, 2), (11, 1), (12, 1), (13, 1)],
  term ((-27648 : Rat) / 1525) [(4, 2), (11, 1), (12, 1), (13, 3)],
  term ((283392 : Rat) / 7625) [(4, 2), (11, 1), (12, 2), (13, 1)],
  term ((-27648 : Rat) / 1525) [(4, 2), (11, 1), (12, 3), (13, 1)],
  term ((-62352 : Rat) / 10675) [(4, 2), (11, 1), (13, 1)],
  term ((6912 : Rat) / 7625) [(4, 2), (11, 1), (13, 3)],
  term ((129024 : Rat) / 7625) [(4, 2), (12, 1), (13, 2)],
  term ((-64512 : Rat) / 7625) [(4, 2), (12, 2), (13, 2)],
  term ((-20736 : Rat) / 7625) [(4, 2), (13, 1), (15, 1)],
  term ((21312 : Rat) / 2135) [(4, 2), (13, 2)],
  term ((-64512 : Rat) / 7625) [(4, 2), (13, 4)],
  term ((-6 : Rat) / 5) [(4, 3)],
  term ((-82944 : Rat) / 7625) [(4, 3), (5, 1), (9, 1), (11, 1), (13, 1)],
  term ((-165888 : Rat) / 7625) [(4, 3), (5, 1), (9, 1), (13, 2)],
  term ((-110592 : Rat) / 7625) [(4, 3), (5, 1), (10, 1), (13, 1)],
  term ((-82944 : Rat) / 7625) [(4, 3), (5, 1), (12, 1), (13, 1)],
  term ((-4608 : Rat) / 7625) [(4, 3), (5, 1), (13, 1)],
  term ((41472 : Rat) / 7625) [(4, 3), (5, 1), (13, 1), (14, 1)],
  term ((-761664 : Rat) / 53375) [(4, 3), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-3046656 : Rat) / 53375) [(4, 3), (7, 1), (11, 1), (13, 2)],
  term ((621408 : Rat) / 10675) [(4, 3), (7, 1), (12, 1), (13, 1)],
  term ((-971496 : Rat) / 53375) [(4, 3), (7, 1), (13, 1)],
  term ((-20736 : Rat) / 7625) [(4, 3), (7, 1), (13, 1), (14, 1)],
  term ((1523328 : Rat) / 53375) [(4, 3), (7, 2), (11, 1), (13, 1)],
  term ((-162768 : Rat) / 53375) [(4, 3), (9, 1), (10, 1), (13, 1)],
  term ((-1591104 : Rat) / 53375) [(4, 3), (9, 1), (11, 1), (13, 2)],
  term ((-1176384 : Rat) / 53375) [(4, 3), (9, 1), (11, 2), (13, 1)],
  term ((-767904 : Rat) / 53375) [(4, 3), (9, 1), (12, 1), (13, 1)],
  term ((211128 : Rat) / 53375) [(4, 3), (9, 1), (13, 1)],
  term ((-588192 : Rat) / 53375) [(4, 3), (10, 1), (11, 1), (13, 1)],
  term ((-463776 : Rat) / 10675) [(4, 3), (11, 1), (12, 1), (13, 1)],
  term ((252648 : Rat) / 53375) [(4, 3), (11, 1), (13, 1)],
  term ((10368 : Rat) / 7625) [(4, 3), (13, 1), (15, 1)],
  term ((-1169568 : Rat) / 53375) [(4, 3), (13, 2)],
  term ((55296 : Rat) / 7625) [(4, 4), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((221184 : Rat) / 7625) [(4, 4), (7, 1), (11, 1), (13, 2)],
  term ((-156672 : Rat) / 7625) [(4, 4), (7, 1), (12, 1), (13, 1)],
  term ((43776 : Rat) / 7625) [(4, 4), (7, 1), (13, 1)],
  term ((-110592 : Rat) / 7625) [(4, 4), (7, 2), (11, 1), (13, 1)],
  term ((13824 : Rat) / 7625) [(4, 4), (9, 1), (10, 1), (13, 1)],
  term ((55296 : Rat) / 7625) [(4, 4), (9, 1), (11, 1), (13, 2)],
  term ((55296 : Rat) / 7625) [(4, 4), (9, 1), (11, 2), (13, 1)],
  term ((27648 : Rat) / 7625) [(4, 4), (9, 1), (12, 1), (13, 1)],
  term ((-20736 : Rat) / 7625) [(4, 4), (9, 1), (13, 1)],
  term ((27648 : Rat) / 7625) [(4, 4), (10, 1), (11, 1), (13, 1)],
  term ((27648 : Rat) / 1525) [(4, 4), (11, 1), (12, 1), (13, 1)],
  term ((-6912 : Rat) / 7625) [(4, 4), (11, 1), (13, 1)],
  term ((64512 : Rat) / 7625) [(4, 4), (13, 2)],
  term ((48 : Rat) / 5) [(5, 1), (7, 1), (12, 1)],
  term ((-24 : Rat) / 5) [(5, 1), (7, 1), (12, 1), (13, 2)],
  term ((24 : Rat) / 5) [(5, 1), (7, 1), (12, 1), (13, 2), (14, 1)],
  term ((-48 : Rat) / 5) [(5, 1), (7, 1), (12, 1), (14, 1)],
  term ((24 : Rat) / 5) [(5, 1), (7, 1), (12, 2)],
  term ((-24 : Rat) / 5) [(5, 1), (7, 1), (12, 2), (14, 1)],
  term ((-24 : Rat) / 5) [(5, 1), (7, 1), (12, 3)],
  term ((24 : Rat) / 5) [(5, 1), (7, 1), (12, 3), (14, 1)],
  term ((-24 : Rat) / 5) [(5, 1), (7, 1), (13, 2)],
  term ((24 : Rat) / 5) [(5, 1), (7, 1), (13, 2), (14, 1)],
  term ((32832 : Rat) / 7625) [(5, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((-16416 : Rat) / 7625) [(5, 1), (9, 1), (11, 1), (12, 2), (13, 1)],
  term ((-16416 : Rat) / 7625) [(5, 1), (9, 1), (11, 1), (13, 3)],
  term ((65664 : Rat) / 7625) [(5, 1), (9, 1), (12, 1), (13, 2)],
  term ((-32832 : Rat) / 7625) [(5, 1), (9, 1), (12, 2), (13, 2)],
  term ((-32832 : Rat) / 7625) [(5, 1), (9, 1), (13, 4)],
  term ((43776 : Rat) / 7625) [(5, 1), (10, 1), (12, 1), (13, 1)],
  term ((-21888 : Rat) / 7625) [(5, 1), (10, 1), (12, 2), (13, 1)],
  term ((-21888 : Rat) / 7625) [(5, 1), (10, 1), (13, 3)],
  term ((-4728 : Rat) / 1525) [(5, 1), (12, 1), (13, 1)],
  term ((17112 : Rat) / 7625) [(5, 1), (12, 1), (13, 1), (14, 1)],
  term ((864 : Rat) / 1525) [(5, 1), (12, 1), (13, 3)],
  term ((-41472 : Rat) / 7625) [(5, 1), (12, 1), (13, 3), (14, 1)],
  term ((-48 : Rat) / 5) [(5, 1), (12, 1), (14, 1), (15, 1)],
  term ((24 : Rat) / 5) [(5, 1), (12, 1), (15, 1)],
  term ((636 : Rat) / 1525) [(5, 1), (12, 2), (13, 1)],
  term ((74388 : Rat) / 7625) [(5, 1), (12, 2), (13, 1), (14, 1)],
  term ((24 : Rat) / 5) [(5, 1), (12, 2), (14, 1), (15, 1)],
  term ((-12 : Rat) / 5) [(5, 1), (12, 2), (15, 1)],
  term ((864 : Rat) / 1525) [(5, 1), (12, 3), (13, 1)],
  term ((-41472 : Rat) / 7625) [(5, 1), (12, 3), (13, 1), (14, 1)],
  term ((24 : Rat) / 5) [(5, 1), (13, 2), (14, 1), (15, 1)],
  term ((-12 : Rat) / 5) [(5, 1), (13, 2), (15, 1)],
  term ((2364 : Rat) / 1525) [(5, 1), (13, 3)],
  term ((-8556 : Rat) / 7625) [(5, 1), (13, 3), (14, 1)],
  term ((-6 : Rat) / 5) [(5, 2), (7, 1), (9, 1)],
  term ((-9533632 : Rat) / 53375) [(5, 2), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((1536 : Rat) / 7) [(5, 2), (7, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((-512 : Rat) / 7) [(5, 2), (7, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((416 : Rat) / 7) [(5, 2), (7, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-12787 : Rat) / 105) [(5, 2), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((521 : Rat) / 35) [(5, 2), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-12 : Rat) / 5) [(5, 2), (7, 1), (9, 1), (14, 1)],
  term ((-6 : Rat) / 5) [(5, 2), (7, 1), (9, 1), (16, 1)],
  term ((-51148 : Rat) / 105) [(5, 2), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((2084 : Rat) / 35) [(5, 2), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-38134528 : Rat) / 53375) [(5, 2), (7, 1), (11, 1), (13, 2)],
  term ((6144 : Rat) / 7) [(5, 2), (7, 1), (11, 1), (13, 2), (14, 1)],
  term ((-2048 : Rat) / 7) [(5, 2), (7, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((1664 : Rat) / 7) [(5, 2), (7, 1), (11, 1), (13, 2), (16, 1)],
  term ((10531336 : Rat) / 53375) [(5, 2), (7, 1), (12, 1), (13, 1)],
  term ((-13028352 : Rat) / 53375) [(5, 2), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((2816 : Rat) / 35) [(5, 2), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2288 : Rat) / 35) [(5, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((41173 : Rat) / 1050) [(5, 2), (7, 1), (12, 1), (15, 1)],
  term ((-603 : Rat) / 70) [(5, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-590092 : Rat) / 2135) [(5, 2), (7, 1), (13, 1)],
  term ((13539504 : Rat) / 53375) [(5, 2), (7, 1), (13, 1), (14, 1)],
  term ((-64 : Rat) / 7) [(5, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((92 : Rat) / 35) [(5, 2), (7, 1), (13, 1), (16, 1)],
  term ((12 : Rat) / 5) [(5, 2), (7, 1), (14, 1), (15, 1)],
  term ((-10763 : Rat) / 4200) [(5, 2), (7, 1), (15, 1)],
  term ((269 : Rat) / 280) [(5, 2), (7, 1), (15, 1), (16, 1)],
  term ((628 : Rat) / 5) [(5, 2), (7, 2)],
  term ((19067264 : Rat) / 53375) [(5, 2), (7, 2), (11, 1), (13, 1)],
  term ((-3072 : Rat) / 7) [(5, 2), (7, 2), (11, 1), (13, 1), (14, 1)],
  term ((1024 : Rat) / 7) [(5, 2), (7, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-832 : Rat) / 7) [(5, 2), (7, 2), (11, 1), (13, 1), (16, 1)],
  term ((25574 : Rat) / 105) [(5, 2), (7, 2), (11, 1), (15, 1)],
  term ((-1042 : Rat) / 35) [(5, 2), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-552 : Rat) / 5) [(5, 2), (7, 2), (14, 1)],
  term ((12 : Rat) / 5) [(5, 2), (7, 2), (16, 1)],
  term ((378664 : Rat) / 10675) [(5, 2), (9, 1), (10, 1), (13, 1)],
  term ((-1536 : Rat) / 35) [(5, 2), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((512 : Rat) / 35) [(5, 2), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-416 : Rat) / 35) [(5, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((24 : Rat) / 5) [(5, 3), (7, 1)],
  term ((24 : Rat) / 5) [(5, 3), (7, 1), (12, 1)],
  term ((-24 : Rat) / 5) [(5, 3), (7, 1), (12, 1), (14, 1)],
  term ((-24 : Rat) / 5) [(5, 3), (7, 1), (14, 1)],
  term ((16416 : Rat) / 7625) [(5, 3), (9, 1), (11, 1), (13, 1)],
  term ((32832 : Rat) / 7625) [(5, 3), (9, 1), (13, 2)],
  term ((21888 : Rat) / 7625) [(5, 3), (10, 1), (13, 1)],
  term ((-864 : Rat) / 1525) [(5, 3), (12, 1), (13, 1)],
  term ((41472 : Rat) / 7625) [(5, 3), (12, 1), (13, 1), (14, 1)],
  term ((-2364 : Rat) / 1525) [(5, 3), (13, 1)],
  term ((8556 : Rat) / 7625) [(5, 3), (13, 1), (14, 1)],
  term ((-24 : Rat) / 5) [(5, 3), (14, 1), (15, 1)],
  term ((12 : Rat) / 5) [(5, 3), (15, 1)],
  term ((-19067264 : Rat) / 53375) [(7, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((3072 : Rat) / 7) [(7, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-1024 : Rat) / 7) [(7, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((832 : Rat) / 7) [(7, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-25574 : Rat) / 105) [(7, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((1042 : Rat) / 35) [(7, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((9533632 : Rat) / 53375) [(7, 1), (9, 1), (11, 1), (12, 2), (13, 1)],
  term ((-1536 : Rat) / 7) [(7, 1), (9, 1), (11, 1), (12, 2), (13, 1), (14, 1)],
  term ((512 : Rat) / 7) [(7, 1), (9, 1), (11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-416 : Rat) / 7) [(7, 1), (9, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((12787 : Rat) / 105) [(7, 1), (9, 1), (11, 1), (12, 2), (15, 1)],
  term ((-521 : Rat) / 35) [(7, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((12787 : Rat) / 105) [(7, 1), (9, 1), (11, 1), (13, 2), (15, 1)],
  term ((-521 : Rat) / 35) [(7, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((9533632 : Rat) / 53375) [(7, 1), (9, 1), (11, 1), (13, 3)],
  term ((-1536 : Rat) / 7) [(7, 1), (9, 1), (11, 1), (13, 3), (14, 1)],
  term ((512 : Rat) / 7) [(7, 1), (9, 1), (11, 1), (13, 3), (14, 1), (16, 1)],
  term ((-416 : Rat) / 7) [(7, 1), (9, 1), (11, 1), (13, 3), (16, 1)],
  term ((-12 : Rat) / 5) [(7, 1), (9, 1), (12, 1)],
  term ((-24 : Rat) / 5) [(7, 1), (9, 1), (12, 1), (14, 1)],
  term ((-12 : Rat) / 5) [(7, 1), (9, 1), (12, 1), (16, 1)],
  term ((6 : Rat) / 5) [(7, 1), (9, 1), (12, 2)],
  term ((12 : Rat) / 5) [(7, 1), (9, 1), (12, 2), (14, 1)],
  term ((6 : Rat) / 5) [(7, 1), (9, 1), (12, 2), (16, 1)],
  term ((6 : Rat) / 5) [(7, 1), (9, 1), (13, 2)],
  term ((12 : Rat) / 5) [(7, 1), (9, 1), (13, 2), (14, 1)],
  term ((6 : Rat) / 5) [(7, 1), (9, 1), (13, 2), (16, 1)],
  term ((-102296 : Rat) / 105) [(7, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((4168 : Rat) / 35) [(7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-76269056 : Rat) / 53375) [(7, 1), (11, 1), (12, 1), (13, 2)],
  term ((12288 : Rat) / 7) [(7, 1), (11, 1), (12, 1), (13, 2), (14, 1)],
  term ((-4096 : Rat) / 7) [(7, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((3328 : Rat) / 7) [(7, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((51148 : Rat) / 105) [(7, 1), (11, 1), (12, 2), (13, 1), (15, 1)],
  term ((-2084 : Rat) / 35) [(7, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((38134528 : Rat) / 53375) [(7, 1), (11, 1), (12, 2), (13, 2)],
  term ((-6144 : Rat) / 7) [(7, 1), (11, 1), (12, 2), (13, 2), (14, 1)],
  term ((2048 : Rat) / 7) [(7, 1), (11, 1), (12, 2), (13, 2), (14, 1), (16, 1)],
  term ((-1664 : Rat) / 7) [(7, 1), (11, 1), (12, 2), (13, 2), (16, 1)],
  term ((51148 : Rat) / 105) [(7, 1), (11, 1), (13, 3), (15, 1)],
  term ((-2084 : Rat) / 35) [(7, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((38134528 : Rat) / 53375) [(7, 1), (11, 1), (13, 4)],
  term ((-6144 : Rat) / 7) [(7, 1), (11, 1), (13, 4), (14, 1)],
  term ((2048 : Rat) / 7) [(7, 1), (11, 1), (13, 4), (14, 1), (16, 1)],
  term ((-1664 : Rat) / 7) [(7, 1), (11, 1), (13, 4), (16, 1)],
  term ((-1180184 : Rat) / 2135) [(7, 1), (12, 1), (13, 1)],
  term ((27079008 : Rat) / 53375) [(7, 1), (12, 1), (13, 1), (14, 1)],
  term ((-128 : Rat) / 7) [(7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((184 : Rat) / 35) [(7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-41173 : Rat) / 1050) [(7, 1), (12, 1), (13, 2), (15, 1)],
  term ((603 : Rat) / 70) [(7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-10531336 : Rat) / 53375) [(7, 1), (12, 1), (13, 3)],
  term ((13028352 : Rat) / 53375) [(7, 1), (12, 1), (13, 3), (14, 1)],
  term ((-2816 : Rat) / 35) [(7, 1), (12, 1), (13, 3), (14, 1), (16, 1)],
  term ((2288 : Rat) / 35) [(7, 1), (12, 1), (13, 3), (16, 1)],
  term ((24 : Rat) / 5) [(7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-10763 : Rat) / 2100) [(7, 1), (12, 1), (15, 1)],
  term ((269 : Rat) / 140) [(7, 1), (12, 1), (15, 1), (16, 1)],
  term ((35814972 : Rat) / 53375) [(7, 1), (12, 2), (13, 1)],
  term ((-39596208 : Rat) / 53375) [(7, 1), (12, 2), (13, 1), (14, 1)],
  term ((5952 : Rat) / 35) [(7, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-4668 : Rat) / 35) [(7, 1), (12, 2), (13, 1), (16, 1)],
  term ((-12 : Rat) / 5) [(7, 1), (12, 2), (14, 1), (15, 1)],
  term ((340147 : Rat) / 4200) [(7, 1), (12, 2), (15, 1)],
  term ((-5093 : Rat) / 280) [(7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-10531336 : Rat) / 53375) [(7, 1), (12, 3), (13, 1)],
  term ((13028352 : Rat) / 53375) [(7, 1), (12, 3), (13, 1), (14, 1)],
  term ((-2816 : Rat) / 35) [(7, 1), (12, 3), (13, 1), (14, 1), (16, 1)],
  term ((2288 : Rat) / 35) [(7, 1), (12, 3), (13, 1), (16, 1)],
  term ((-41173 : Rat) / 1050) [(7, 1), (12, 3), (15, 1)],
  term ((603 : Rat) / 70) [(7, 1), (12, 3), (15, 1), (16, 1)],
  term ((-12 : Rat) / 5) [(7, 1), (13, 2), (14, 1), (15, 1)],
  term ((10763 : Rat) / 4200) [(7, 1), (13, 2), (15, 1)],
  term ((-269 : Rat) / 280) [(7, 1), (13, 2), (15, 1), (16, 1)],
  term ((590092 : Rat) / 2135) [(7, 1), (13, 3)],
  term ((-13539504 : Rat) / 53375) [(7, 1), (13, 3), (14, 1)],
  term ((64 : Rat) / 7) [(7, 1), (13, 3), (14, 1), (16, 1)],
  term ((-92 : Rat) / 35) [(7, 1), (13, 3), (16, 1)],
  term ((38134528 : Rat) / 53375) [(7, 2), (11, 1), (12, 1), (13, 1)],
  term ((-6144 : Rat) / 7) [(7, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((2048 : Rat) / 7) [(7, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1664 : Rat) / 7) [(7, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((51148 : Rat) / 105) [(7, 2), (11, 1), (12, 1), (15, 1)],
  term ((-2084 : Rat) / 35) [(7, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-19067264 : Rat) / 53375) [(7, 2), (11, 1), (12, 2), (13, 1)],
  term ((3072 : Rat) / 7) [(7, 2), (11, 1), (12, 2), (13, 1), (14, 1)],
  term ((-1024 : Rat) / 7) [(7, 2), (11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((832 : Rat) / 7) [(7, 2), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-25574 : Rat) / 105) [(7, 2), (11, 1), (12, 2), (15, 1)],
  term ((1042 : Rat) / 35) [(7, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-25574 : Rat) / 105) [(7, 2), (11, 1), (13, 2), (15, 1)],
  term ((1042 : Rat) / 35) [(7, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-19067264 : Rat) / 53375) [(7, 2), (11, 1), (13, 3)],
  term ((3072 : Rat) / 7) [(7, 2), (11, 1), (13, 3), (14, 1)],
  term ((-1024 : Rat) / 7) [(7, 2), (11, 1), (13, 3), (14, 1), (16, 1)],
  term ((832 : Rat) / 7) [(7, 2), (11, 1), (13, 3), (16, 1)],
  term ((1256 : Rat) / 5) [(7, 2), (12, 1)],
  term ((-1104 : Rat) / 5) [(7, 2), (12, 1), (14, 1)],
  term ((24 : Rat) / 5) [(7, 2), (12, 1), (16, 1)],
  term ((-628 : Rat) / 5) [(7, 2), (12, 2)],
  term ((552 : Rat) / 5) [(7, 2), (12, 2), (14, 1)],
  term ((-12 : Rat) / 5) [(7, 2), (12, 2), (16, 1)],
  term ((-628 : Rat) / 5) [(7, 2), (13, 2)],
  term ((552 : Rat) / 5) [(7, 2), (13, 2), (14, 1)],
  term ((-12 : Rat) / 5) [(7, 2), (13, 2), (16, 1)],
  term ((757328 : Rat) / 10675) [(9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-3072 : Rat) / 35) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((1024 : Rat) / 35) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-832 : Rat) / 35) [(9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-378664 : Rat) / 10675) [(9, 1), (10, 1), (12, 2), (13, 1)],
  term ((1536 : Rat) / 35) [(9, 1), (10, 1), (12, 2), (13, 1), (14, 1)],
  term ((-512 : Rat) / 35) [(9, 1), (10, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((416 : Rat) / 35) [(9, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((-378664 : Rat) / 10675) [(9, 1), (10, 1), (13, 3)],
  term ((1536 : Rat) / 35) [(9, 1), (10, 1), (13, 3), (14, 1)],
  term ((-512 : Rat) / 35) [(9, 1), (10, 1), (13, 3), (14, 1), (16, 1)],
  term ((416 : Rat) / 35) [(9, 1), (10, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 4, terms 300 through 399. -/
theorem rs_R003_ueqv_R003YY_block_04_0300_0399_valid :
    checkProductSumEq rs_R003_ueqv_R003YY_partials_04_0300_0399
      rs_R003_ueqv_R003YY_block_04_0300_0399 = true := by
  native_decide

end R003UeqvR003YYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
