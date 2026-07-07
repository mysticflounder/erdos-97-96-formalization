/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NYYNY, term block 23:300-325

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NYYNYTermShards

/-- Generator polynomial 23 for relaxed split surplus certificate `R009:u=v:R009NYYNY`. -/
def rs_R009_ueqv_R009NYYNY_generator_23_0300_0325 : Poly :=
[
  term (-2 : Rat) [(0, 1), (10, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (11, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(8, 1), (10, 1)],
  term (-1 : Rat) [(8, 2)],
  term (2 : Rat) [(9, 1), (11, 1)],
  term (-1 : Rat) [(9, 2)]
]

/-- Coefficient term 300 from coefficient polynomial 23. -/
def rs_R009_ueqv_R009NYYNY_coefficient_23_0300 : Poly :=
[
  term ((1549 : Rat) / 12) [(9, 1), (10, 1), (15, 1)]
]

/-- Partial product 300 for generator 23. -/
def rs_R009_ueqv_R009NYYNY_partial_23_0300 : Poly :=
[
  term ((-1549 : Rat) / 6) [(0, 1), (9, 1), (10, 2), (15, 1)],
  term ((1549 : Rat) / 12) [(0, 2), (9, 1), (10, 1), (15, 1)],
  term ((-1549 : Rat) / 6) [(1, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((1549 : Rat) / 12) [(1, 2), (9, 1), (10, 1), (15, 1)],
  term ((1549 : Rat) / 6) [(8, 1), (9, 1), (10, 2), (15, 1)],
  term ((-1549 : Rat) / 12) [(8, 2), (9, 1), (10, 1), (15, 1)],
  term ((1549 : Rat) / 6) [(9, 2), (10, 1), (11, 1), (15, 1)],
  term ((-1549 : Rat) / 12) [(9, 3), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 300 for generator 23. -/
theorem rs_R009_ueqv_R009NYYNY_partial_23_0300_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_23_0300
        rs_R009_ueqv_R009NYYNY_generator_23_0300_0325 =
      rs_R009_ueqv_R009NYYNY_partial_23_0300 := by
  native_decide

/-- Coefficient term 301 from coefficient polynomial 23. -/
def rs_R009_ueqv_R009NYYNY_coefficient_23_0301 : Poly :=
[
  term ((-189 : Rat) / 8) [(9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 301 for generator 23. -/
def rs_R009_ueqv_R009NYYNY_partial_23_0301 : Poly :=
[
  term ((189 : Rat) / 4) [(0, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-189 : Rat) / 8) [(0, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((189 : Rat) / 4) [(1, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-189 : Rat) / 8) [(1, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-189 : Rat) / 4) [(8, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((189 : Rat) / 8) [(8, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-189 : Rat) / 4) [(9, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((189 : Rat) / 8) [(9, 3), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 301 for generator 23. -/
theorem rs_R009_ueqv_R009NYYNY_partial_23_0301_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_23_0301
        rs_R009_ueqv_R009NYYNY_generator_23_0300_0325 =
      rs_R009_ueqv_R009NYYNY_partial_23_0301 := by
  native_decide

/-- Coefficient term 302 from coefficient polynomial 23. -/
def rs_R009_ueqv_R009NYYNY_coefficient_23_0302 : Poly :=
[
  term (-27 : Rat) [(9, 1), (10, 2), (11, 1)]
]

/-- Partial product 302 for generator 23. -/
def rs_R009_ueqv_R009NYYNY_partial_23_0302 : Poly :=
[
  term (54 : Rat) [(0, 1), (9, 1), (10, 3), (11, 1)],
  term (-27 : Rat) [(0, 2), (9, 1), (10, 2), (11, 1)],
  term (54 : Rat) [(1, 1), (9, 1), (10, 2), (11, 2)],
  term (-27 : Rat) [(1, 2), (9, 1), (10, 2), (11, 1)],
  term (-54 : Rat) [(8, 1), (9, 1), (10, 3), (11, 1)],
  term (27 : Rat) [(8, 2), (9, 1), (10, 2), (11, 1)],
  term (-54 : Rat) [(9, 2), (10, 2), (11, 2)],
  term (27 : Rat) [(9, 3), (10, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 302 for generator 23. -/
theorem rs_R009_ueqv_R009NYYNY_partial_23_0302_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_23_0302
        rs_R009_ueqv_R009NYYNY_generator_23_0300_0325 =
      rs_R009_ueqv_R009NYYNY_partial_23_0302 := by
  native_decide

/-- Coefficient term 303 from coefficient polynomial 23. -/
def rs_R009_ueqv_R009NYYNY_coefficient_23_0303 : Poly :=
[
  term (15 : Rat) [(9, 1), (10, 2), (13, 1)]
]

/-- Partial product 303 for generator 23. -/
def rs_R009_ueqv_R009NYYNY_partial_23_0303 : Poly :=
[
  term (-30 : Rat) [(0, 1), (9, 1), (10, 3), (13, 1)],
  term (15 : Rat) [(0, 2), (9, 1), (10, 2), (13, 1)],
  term (-30 : Rat) [(1, 1), (9, 1), (10, 2), (11, 1), (13, 1)],
  term (15 : Rat) [(1, 2), (9, 1), (10, 2), (13, 1)],
  term (30 : Rat) [(8, 1), (9, 1), (10, 3), (13, 1)],
  term (-15 : Rat) [(8, 2), (9, 1), (10, 2), (13, 1)],
  term (30 : Rat) [(9, 2), (10, 2), (11, 1), (13, 1)],
  term (-15 : Rat) [(9, 3), (10, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 303 for generator 23. -/
theorem rs_R009_ueqv_R009NYYNY_partial_23_0303_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_23_0303
        rs_R009_ueqv_R009NYYNY_generator_23_0300_0325 =
      rs_R009_ueqv_R009NYYNY_partial_23_0303 := by
  native_decide

/-- Coefficient term 304 from coefficient polynomial 23. -/
def rs_R009_ueqv_R009NYYNY_coefficient_23_0304 : Poly :=
[
  term (-33 : Rat) [(9, 1), (10, 2), (15, 1)]
]

/-- Partial product 304 for generator 23. -/
def rs_R009_ueqv_R009NYYNY_partial_23_0304 : Poly :=
[
  term (66 : Rat) [(0, 1), (9, 1), (10, 3), (15, 1)],
  term (-33 : Rat) [(0, 2), (9, 1), (10, 2), (15, 1)],
  term (66 : Rat) [(1, 1), (9, 1), (10, 2), (11, 1), (15, 1)],
  term (-33 : Rat) [(1, 2), (9, 1), (10, 2), (15, 1)],
  term (-66 : Rat) [(8, 1), (9, 1), (10, 3), (15, 1)],
  term (33 : Rat) [(8, 2), (9, 1), (10, 2), (15, 1)],
  term (-66 : Rat) [(9, 2), (10, 2), (11, 1), (15, 1)],
  term (33 : Rat) [(9, 3), (10, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 304 for generator 23. -/
theorem rs_R009_ueqv_R009NYYNY_partial_23_0304_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_23_0304
        rs_R009_ueqv_R009NYYNY_generator_23_0300_0325 =
      rs_R009_ueqv_R009NYYNY_partial_23_0304 := by
  native_decide

/-- Coefficient term 305 from coefficient polynomial 23. -/
def rs_R009_ueqv_R009NYYNY_coefficient_23_0305 : Poly :=
[
  term ((9 : Rat) / 2) [(9, 1), (10, 2), (15, 1), (16, 1)]
]

/-- Partial product 305 for generator 23. -/
def rs_R009_ueqv_R009NYYNY_partial_23_0305 : Poly :=
[
  term (-9 : Rat) [(0, 1), (9, 1), (10, 3), (15, 1), (16, 1)],
  term ((9 : Rat) / 2) [(0, 2), (9, 1), (10, 2), (15, 1), (16, 1)],
  term (-9 : Rat) [(1, 1), (9, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((9 : Rat) / 2) [(1, 2), (9, 1), (10, 2), (15, 1), (16, 1)],
  term (9 : Rat) [(8, 1), (9, 1), (10, 3), (15, 1), (16, 1)],
  term ((-9 : Rat) / 2) [(8, 2), (9, 1), (10, 2), (15, 1), (16, 1)],
  term (9 : Rat) [(9, 2), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-9 : Rat) / 2) [(9, 3), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 305 for generator 23. -/
theorem rs_R009_ueqv_R009NYYNY_partial_23_0305_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_23_0305
        rs_R009_ueqv_R009NYYNY_generator_23_0300_0325 =
      rs_R009_ueqv_R009NYYNY_partial_23_0305 := by
  native_decide

/-- Coefficient term 306 from coefficient polynomial 23. -/
def rs_R009_ueqv_R009NYYNY_coefficient_23_0306 : Poly :=
[
  term (-3 : Rat) [(9, 1), (11, 1)]
]

/-- Partial product 306 for generator 23. -/
def rs_R009_ueqv_R009NYYNY_partial_23_0306 : Poly :=
[
  term (6 : Rat) [(0, 1), (9, 1), (10, 1), (11, 1)],
  term (-3 : Rat) [(0, 2), (9, 1), (11, 1)],
  term (6 : Rat) [(1, 1), (9, 1), (11, 2)],
  term (-3 : Rat) [(1, 2), (9, 1), (11, 1)],
  term (-6 : Rat) [(8, 1), (9, 1), (10, 1), (11, 1)],
  term (3 : Rat) [(8, 2), (9, 1), (11, 1)],
  term (-6 : Rat) [(9, 2), (11, 2)],
  term (3 : Rat) [(9, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 306 for generator 23. -/
theorem rs_R009_ueqv_R009NYYNY_partial_23_0306_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_23_0306
        rs_R009_ueqv_R009NYYNY_generator_23_0300_0325 =
      rs_R009_ueqv_R009NYYNY_partial_23_0306 := by
  native_decide

/-- Coefficient term 307 from coefficient polynomial 23. -/
def rs_R009_ueqv_R009NYYNY_coefficient_23_0307 : Poly :=
[
  term ((-88 : Rat) / 3) [(9, 1), (13, 1)]
]

/-- Partial product 307 for generator 23. -/
def rs_R009_ueqv_R009NYYNY_partial_23_0307 : Poly :=
[
  term ((176 : Rat) / 3) [(0, 1), (9, 1), (10, 1), (13, 1)],
  term ((-88 : Rat) / 3) [(0, 2), (9, 1), (13, 1)],
  term ((176 : Rat) / 3) [(1, 1), (9, 1), (11, 1), (13, 1)],
  term ((-88 : Rat) / 3) [(1, 2), (9, 1), (13, 1)],
  term ((-176 : Rat) / 3) [(8, 1), (9, 1), (10, 1), (13, 1)],
  term ((88 : Rat) / 3) [(8, 2), (9, 1), (13, 1)],
  term ((-176 : Rat) / 3) [(9, 2), (11, 1), (13, 1)],
  term ((88 : Rat) / 3) [(9, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 307 for generator 23. -/
theorem rs_R009_ueqv_R009NYYNY_partial_23_0307_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_23_0307
        rs_R009_ueqv_R009NYYNY_generator_23_0300_0325 =
      rs_R009_ueqv_R009NYYNY_partial_23_0307 := by
  native_decide

/-- Coefficient term 308 from coefficient polynomial 23. -/
def rs_R009_ueqv_R009NYYNY_coefficient_23_0308 : Poly :=
[
  term (28 : Rat) [(9, 1), (14, 1), (15, 1)]
]

/-- Partial product 308 for generator 23. -/
def rs_R009_ueqv_R009NYYNY_partial_23_0308 : Poly :=
[
  term (-56 : Rat) [(0, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term (28 : Rat) [(0, 2), (9, 1), (14, 1), (15, 1)],
  term (-56 : Rat) [(1, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term (28 : Rat) [(1, 2), (9, 1), (14, 1), (15, 1)],
  term (56 : Rat) [(8, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term (-28 : Rat) [(8, 2), (9, 1), (14, 1), (15, 1)],
  term (56 : Rat) [(9, 2), (11, 1), (14, 1), (15, 1)],
  term (-28 : Rat) [(9, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 308 for generator 23. -/
theorem rs_R009_ueqv_R009NYYNY_partial_23_0308_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_23_0308
        rs_R009_ueqv_R009NYYNY_generator_23_0300_0325 =
      rs_R009_ueqv_R009NYYNY_partial_23_0308 := by
  native_decide

/-- Coefficient term 309 from coefficient polynomial 23. -/
def rs_R009_ueqv_R009NYYNY_coefficient_23_0309 : Poly :=
[
  term ((-797 : Rat) / 12) [(9, 1), (15, 1)]
]

/-- Partial product 309 for generator 23. -/
def rs_R009_ueqv_R009NYYNY_partial_23_0309 : Poly :=
[
  term ((797 : Rat) / 6) [(0, 1), (9, 1), (10, 1), (15, 1)],
  term ((-797 : Rat) / 12) [(0, 2), (9, 1), (15, 1)],
  term ((797 : Rat) / 6) [(1, 1), (9, 1), (11, 1), (15, 1)],
  term ((-797 : Rat) / 12) [(1, 2), (9, 1), (15, 1)],
  term ((-797 : Rat) / 6) [(8, 1), (9, 1), (10, 1), (15, 1)],
  term ((797 : Rat) / 12) [(8, 2), (9, 1), (15, 1)],
  term ((-797 : Rat) / 6) [(9, 2), (11, 1), (15, 1)],
  term ((797 : Rat) / 12) [(9, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 309 for generator 23. -/
theorem rs_R009_ueqv_R009NYYNY_partial_23_0309_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_23_0309
        rs_R009_ueqv_R009NYYNY_generator_23_0300_0325 =
      rs_R009_ueqv_R009NYYNY_partial_23_0309 := by
  native_decide

/-- Coefficient term 310 from coefficient polynomial 23. -/
def rs_R009_ueqv_R009NYYNY_coefficient_23_0310 : Poly :=
[
  term ((177 : Rat) / 8) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 310 for generator 23. -/
def rs_R009_ueqv_R009NYYNY_partial_23_0310 : Poly :=
[
  term ((-177 : Rat) / 4) [(0, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((177 : Rat) / 8) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((-177 : Rat) / 4) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((177 : Rat) / 8) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((177 : Rat) / 4) [(8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-177 : Rat) / 8) [(8, 2), (9, 1), (15, 1), (16, 1)],
  term ((177 : Rat) / 4) [(9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-177 : Rat) / 8) [(9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 310 for generator 23. -/
theorem rs_R009_ueqv_R009NYYNY_partial_23_0310_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_23_0310
        rs_R009_ueqv_R009NYYNY_generator_23_0300_0325 =
      rs_R009_ueqv_R009NYYNY_partial_23_0310 := by
  native_decide

/-- Coefficient term 311 from coefficient polynomial 23. -/
def rs_R009_ueqv_R009NYYNY_coefficient_23_0311 : Poly :=
[
  term ((4 : Rat) / 3) [(9, 2)]
]

/-- Partial product 311 for generator 23. -/
def rs_R009_ueqv_R009NYYNY_partial_23_0311 : Poly :=
[
  term ((-8 : Rat) / 3) [(0, 1), (9, 2), (10, 1)],
  term ((4 : Rat) / 3) [(0, 2), (9, 2)],
  term ((-8 : Rat) / 3) [(1, 1), (9, 2), (11, 1)],
  term ((4 : Rat) / 3) [(1, 2), (9, 2)],
  term ((8 : Rat) / 3) [(8, 1), (9, 2), (10, 1)],
  term ((-4 : Rat) / 3) [(8, 2), (9, 2)],
  term ((8 : Rat) / 3) [(9, 3), (11, 1)],
  term ((-4 : Rat) / 3) [(9, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 311 for generator 23. -/
theorem rs_R009_ueqv_R009NYYNY_partial_23_0311_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_23_0311
        rs_R009_ueqv_R009NYYNY_generator_23_0300_0325 =
      rs_R009_ueqv_R009NYYNY_partial_23_0311 := by
  native_decide

/-- Coefficient term 312 from coefficient polynomial 23. -/
def rs_R009_ueqv_R009NYYNY_coefficient_23_0312 : Poly :=
[
  term ((-13 : Rat) / 4) [(10, 1)]
]

/-- Partial product 312 for generator 23. -/
def rs_R009_ueqv_R009NYYNY_partial_23_0312 : Poly :=
[
  term ((13 : Rat) / 2) [(0, 1), (10, 2)],
  term ((-13 : Rat) / 4) [(0, 2), (10, 1)],
  term ((13 : Rat) / 2) [(1, 1), (10, 1), (11, 1)],
  term ((-13 : Rat) / 4) [(1, 2), (10, 1)],
  term ((-13 : Rat) / 2) [(8, 1), (10, 2)],
  term ((13 : Rat) / 4) [(8, 2), (10, 1)],
  term ((-13 : Rat) / 2) [(9, 1), (10, 1), (11, 1)],
  term ((13 : Rat) / 4) [(9, 2), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 312 for generator 23. -/
theorem rs_R009_ueqv_R009NYYNY_partial_23_0312_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_23_0312
        rs_R009_ueqv_R009NYYNY_generator_23_0300_0325 =
      rs_R009_ueqv_R009NYYNY_partial_23_0312 := by
  native_decide

/-- Coefficient term 313 from coefficient polynomial 23. -/
def rs_R009_ueqv_R009NYYNY_coefficient_23_0313 : Poly :=
[
  term ((9 : Rat) / 2) [(10, 1), (11, 1), (13, 1)]
]

/-- Partial product 313 for generator 23. -/
def rs_R009_ueqv_R009NYYNY_partial_23_0313 : Poly :=
[
  term (-9 : Rat) [(0, 1), (10, 2), (11, 1), (13, 1)],
  term ((9 : Rat) / 2) [(0, 2), (10, 1), (11, 1), (13, 1)],
  term (-9 : Rat) [(1, 1), (10, 1), (11, 2), (13, 1)],
  term ((9 : Rat) / 2) [(1, 2), (10, 1), (11, 1), (13, 1)],
  term (9 : Rat) [(8, 1), (10, 2), (11, 1), (13, 1)],
  term ((-9 : Rat) / 2) [(8, 2), (10, 1), (11, 1), (13, 1)],
  term (9 : Rat) [(9, 1), (10, 1), (11, 2), (13, 1)],
  term ((-9 : Rat) / 2) [(9, 2), (10, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 313 for generator 23. -/
theorem rs_R009_ueqv_R009NYYNY_partial_23_0313_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_23_0313
        rs_R009_ueqv_R009NYYNY_generator_23_0300_0325 =
      rs_R009_ueqv_R009NYYNY_partial_23_0313 := by
  native_decide

/-- Coefficient term 314 from coefficient polynomial 23. -/
def rs_R009_ueqv_R009NYYNY_coefficient_23_0314 : Poly :=
[
  term ((-63 : Rat) / 2) [(10, 1), (11, 1), (15, 1)]
]

/-- Partial product 314 for generator 23. -/
def rs_R009_ueqv_R009NYYNY_partial_23_0314 : Poly :=
[
  term (63 : Rat) [(0, 1), (10, 2), (11, 1), (15, 1)],
  term ((-63 : Rat) / 2) [(0, 2), (10, 1), (11, 1), (15, 1)],
  term (63 : Rat) [(1, 1), (10, 1), (11, 2), (15, 1)],
  term ((-63 : Rat) / 2) [(1, 2), (10, 1), (11, 1), (15, 1)],
  term (-63 : Rat) [(8, 1), (10, 2), (11, 1), (15, 1)],
  term ((63 : Rat) / 2) [(8, 2), (10, 1), (11, 1), (15, 1)],
  term (-63 : Rat) [(9, 1), (10, 1), (11, 2), (15, 1)],
  term ((63 : Rat) / 2) [(9, 2), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 314 for generator 23. -/
theorem rs_R009_ueqv_R009NYYNY_partial_23_0314_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_23_0314
        rs_R009_ueqv_R009NYYNY_generator_23_0300_0325 =
      rs_R009_ueqv_R009NYYNY_partial_23_0314 := by
  native_decide

/-- Coefficient term 315 from coefficient polynomial 23. -/
def rs_R009_ueqv_R009NYYNY_coefficient_23_0315 : Poly :=
[
  term ((27 : Rat) / 4) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 315 for generator 23. -/
def rs_R009_ueqv_R009NYYNY_partial_23_0315 : Poly :=
[
  term ((-27 : Rat) / 2) [(0, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((27 : Rat) / 4) [(0, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-27 : Rat) / 2) [(1, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((27 : Rat) / 4) [(1, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((27 : Rat) / 2) [(8, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-27 : Rat) / 4) [(8, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((27 : Rat) / 2) [(9, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((-27 : Rat) / 4) [(9, 2), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 315 for generator 23. -/
theorem rs_R009_ueqv_R009NYYNY_partial_23_0315_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_23_0315
        rs_R009_ueqv_R009NYYNY_generator_23_0300_0325 =
      rs_R009_ueqv_R009NYYNY_partial_23_0315 := by
  native_decide

/-- Coefficient term 316 from coefficient polynomial 23. -/
def rs_R009_ueqv_R009NYYNY_coefficient_23_0316 : Poly :=
[
  term ((-27 : Rat) / 2) [(10, 1), (11, 2)]
]

/-- Partial product 316 for generator 23. -/
def rs_R009_ueqv_R009NYYNY_partial_23_0316 : Poly :=
[
  term (27 : Rat) [(0, 1), (10, 2), (11, 2)],
  term ((-27 : Rat) / 2) [(0, 2), (10, 1), (11, 2)],
  term (27 : Rat) [(1, 1), (10, 1), (11, 3)],
  term ((-27 : Rat) / 2) [(1, 2), (10, 1), (11, 2)],
  term (-27 : Rat) [(8, 1), (10, 2), (11, 2)],
  term ((27 : Rat) / 2) [(8, 2), (10, 1), (11, 2)],
  term (-27 : Rat) [(9, 1), (10, 1), (11, 3)],
  term ((27 : Rat) / 2) [(9, 2), (10, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 316 for generator 23. -/
theorem rs_R009_ueqv_R009NYYNY_partial_23_0316_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_23_0316
        rs_R009_ueqv_R009NYYNY_generator_23_0300_0325 =
      rs_R009_ueqv_R009NYYNY_partial_23_0316 := by
  native_decide

/-- Coefficient term 317 from coefficient polynomial 23. -/
def rs_R009_ueqv_R009NYYNY_coefficient_23_0317 : Poly :=
[
  term ((3 : Rat) / 4) [(10, 2)]
]

/-- Partial product 317 for generator 23. -/
def rs_R009_ueqv_R009NYYNY_partial_23_0317 : Poly :=
[
  term ((-3 : Rat) / 2) [(0, 1), (10, 3)],
  term ((3 : Rat) / 4) [(0, 2), (10, 2)],
  term ((-3 : Rat) / 2) [(1, 1), (10, 2), (11, 1)],
  term ((3 : Rat) / 4) [(1, 2), (10, 2)],
  term ((3 : Rat) / 2) [(8, 1), (10, 3)],
  term ((-3 : Rat) / 4) [(8, 2), (10, 2)],
  term ((3 : Rat) / 2) [(9, 1), (10, 2), (11, 1)],
  term ((-3 : Rat) / 4) [(9, 2), (10, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 317 for generator 23. -/
theorem rs_R009_ueqv_R009NYYNY_partial_23_0317_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_23_0317
        rs_R009_ueqv_R009NYYNY_generator_23_0300_0325 =
      rs_R009_ueqv_R009NYYNY_partial_23_0317 := by
  native_decide

/-- Coefficient term 318 from coefficient polynomial 23. -/
def rs_R009_ueqv_R009NYYNY_coefficient_23_0318 : Poly :=
[
  term ((-27 : Rat) / 2) [(11, 1), (13, 1)]
]

/-- Partial product 318 for generator 23. -/
def rs_R009_ueqv_R009NYYNY_partial_23_0318 : Poly :=
[
  term (27 : Rat) [(0, 1), (10, 1), (11, 1), (13, 1)],
  term ((-27 : Rat) / 2) [(0, 2), (11, 1), (13, 1)],
  term (27 : Rat) [(1, 1), (11, 2), (13, 1)],
  term ((-27 : Rat) / 2) [(1, 2), (11, 1), (13, 1)],
  term (-27 : Rat) [(8, 1), (10, 1), (11, 1), (13, 1)],
  term ((27 : Rat) / 2) [(8, 2), (11, 1), (13, 1)],
  term (-27 : Rat) [(9, 1), (11, 2), (13, 1)],
  term ((27 : Rat) / 2) [(9, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 318 for generator 23. -/
theorem rs_R009_ueqv_R009NYYNY_partial_23_0318_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_23_0318
        rs_R009_ueqv_R009NYYNY_generator_23_0300_0325 =
      rs_R009_ueqv_R009NYYNY_partial_23_0318 := by
  native_decide

/-- Coefficient term 319 from coefficient polynomial 23. -/
def rs_R009_ueqv_R009NYYNY_coefficient_23_0319 : Poly :=
[
  term (-60 : Rat) [(11, 1), (14, 1), (15, 1)]
]

/-- Partial product 319 for generator 23. -/
def rs_R009_ueqv_R009NYYNY_partial_23_0319 : Poly :=
[
  term (120 : Rat) [(0, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term (-60 : Rat) [(0, 2), (11, 1), (14, 1), (15, 1)],
  term (120 : Rat) [(1, 1), (11, 2), (14, 1), (15, 1)],
  term (-60 : Rat) [(1, 2), (11, 1), (14, 1), (15, 1)],
  term (-120 : Rat) [(8, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term (60 : Rat) [(8, 2), (11, 1), (14, 1), (15, 1)],
  term (-120 : Rat) [(9, 1), (11, 2), (14, 1), (15, 1)],
  term (60 : Rat) [(9, 2), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 319 for generator 23. -/
theorem rs_R009_ueqv_R009NYYNY_partial_23_0319_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_23_0319
        rs_R009_ueqv_R009NYYNY_generator_23_0300_0325 =
      rs_R009_ueqv_R009NYYNY_partial_23_0319 := by
  native_decide

/-- Coefficient term 320 from coefficient polynomial 23. -/
def rs_R009_ueqv_R009NYYNY_coefficient_23_0320 : Poly :=
[
  term ((437 : Rat) / 8) [(11, 1), (15, 1)]
]

/-- Partial product 320 for generator 23. -/
def rs_R009_ueqv_R009NYYNY_partial_23_0320 : Poly :=
[
  term ((-437 : Rat) / 4) [(0, 1), (10, 1), (11, 1), (15, 1)],
  term ((437 : Rat) / 8) [(0, 2), (11, 1), (15, 1)],
  term ((-437 : Rat) / 4) [(1, 1), (11, 2), (15, 1)],
  term ((437 : Rat) / 8) [(1, 2), (11, 1), (15, 1)],
  term ((437 : Rat) / 4) [(8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-437 : Rat) / 8) [(8, 2), (11, 1), (15, 1)],
  term ((437 : Rat) / 4) [(9, 1), (11, 2), (15, 1)],
  term ((-437 : Rat) / 8) [(9, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 320 for generator 23. -/
theorem rs_R009_ueqv_R009NYYNY_partial_23_0320_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_23_0320
        rs_R009_ueqv_R009NYYNY_generator_23_0300_0325 =
      rs_R009_ueqv_R009NYYNY_partial_23_0320 := by
  native_decide

/-- Coefficient term 321 from coefficient polynomial 23. -/
def rs_R009_ueqv_R009NYYNY_coefficient_23_0321 : Poly :=
[
  term ((-207 : Rat) / 16) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 321 for generator 23. -/
def rs_R009_ueqv_R009NYYNY_partial_23_0321 : Poly :=
[
  term ((207 : Rat) / 8) [(0, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-207 : Rat) / 16) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((207 : Rat) / 8) [(1, 1), (11, 2), (15, 1), (16, 1)],
  term ((-207 : Rat) / 16) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-207 : Rat) / 8) [(8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((207 : Rat) / 16) [(8, 2), (11, 1), (15, 1), (16, 1)],
  term ((-207 : Rat) / 8) [(9, 1), (11, 2), (15, 1), (16, 1)],
  term ((207 : Rat) / 16) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 321 for generator 23. -/
theorem rs_R009_ueqv_R009NYYNY_partial_23_0321_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_23_0321
        rs_R009_ueqv_R009NYYNY_generator_23_0300_0325 =
      rs_R009_ueqv_R009NYYNY_partial_23_0321 := by
  native_decide

/-- Coefficient term 322 from coefficient polynomial 23. -/
def rs_R009_ueqv_R009NYYNY_coefficient_23_0322 : Poly :=
[
  term (69 : Rat) [(11, 2)]
]

/-- Partial product 322 for generator 23. -/
def rs_R009_ueqv_R009NYYNY_partial_23_0322 : Poly :=
[
  term (-138 : Rat) [(0, 1), (10, 1), (11, 2)],
  term (69 : Rat) [(0, 2), (11, 2)],
  term (-138 : Rat) [(1, 1), (11, 3)],
  term (69 : Rat) [(1, 2), (11, 2)],
  term (138 : Rat) [(8, 1), (10, 1), (11, 2)],
  term (-69 : Rat) [(8, 2), (11, 2)],
  term (138 : Rat) [(9, 1), (11, 3)],
  term (-69 : Rat) [(9, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 322 for generator 23. -/
theorem rs_R009_ueqv_R009NYYNY_partial_23_0322_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_23_0322
        rs_R009_ueqv_R009NYYNY_generator_23_0300_0325 =
      rs_R009_ueqv_R009NYYNY_partial_23_0322 := by
  native_decide

/-- Coefficient term 323 from coefficient polynomial 23. -/
def rs_R009_ueqv_R009NYYNY_coefficient_23_0323 : Poly :=
[
  term (1 : Rat) [(13, 1), (15, 1)]
]

/-- Partial product 323 for generator 23. -/
def rs_R009_ueqv_R009NYYNY_partial_23_0323 : Poly :=
[
  term (-2 : Rat) [(0, 1), (10, 1), (13, 1), (15, 1)],
  term (1 : Rat) [(0, 2), (13, 1), (15, 1)],
  term (-2 : Rat) [(1, 1), (11, 1), (13, 1), (15, 1)],
  term (1 : Rat) [(1, 2), (13, 1), (15, 1)],
  term (2 : Rat) [(8, 1), (10, 1), (13, 1), (15, 1)],
  term (-1 : Rat) [(8, 2), (13, 1), (15, 1)],
  term (2 : Rat) [(9, 1), (11, 1), (13, 1), (15, 1)],
  term (-1 : Rat) [(9, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 323 for generator 23. -/
theorem rs_R009_ueqv_R009NYYNY_partial_23_0323_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_23_0323
        rs_R009_ueqv_R009NYYNY_generator_23_0300_0325 =
      rs_R009_ueqv_R009NYYNY_partial_23_0323 := by
  native_decide

/-- Coefficient term 324 from coefficient polynomial 23. -/
def rs_R009_ueqv_R009NYYNY_coefficient_23_0324 : Poly :=
[
  term (-2 : Rat) [(14, 1)]
]

/-- Partial product 324 for generator 23. -/
def rs_R009_ueqv_R009NYYNY_partial_23_0324 : Poly :=
[
  term (4 : Rat) [(0, 1), (10, 1), (14, 1)],
  term (-2 : Rat) [(0, 2), (14, 1)],
  term (4 : Rat) [(1, 1), (11, 1), (14, 1)],
  term (-2 : Rat) [(1, 2), (14, 1)],
  term (-4 : Rat) [(8, 1), (10, 1), (14, 1)],
  term (2 : Rat) [(8, 2), (14, 1)],
  term (-4 : Rat) [(9, 1), (11, 1), (14, 1)],
  term (2 : Rat) [(9, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 324 for generator 23. -/
theorem rs_R009_ueqv_R009NYYNY_partial_23_0324_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_23_0324
        rs_R009_ueqv_R009NYYNY_generator_23_0300_0325 =
      rs_R009_ueqv_R009NYYNY_partial_23_0324 := by
  native_decide

/-- Coefficient term 325 from coefficient polynomial 23. -/
def rs_R009_ueqv_R009NYYNY_coefficient_23_0325 : Poly :=
[
  term (-4 : Rat) [(15, 2)]
]

/-- Partial product 325 for generator 23. -/
def rs_R009_ueqv_R009NYYNY_partial_23_0325 : Poly :=
[
  term (8 : Rat) [(0, 1), (10, 1), (15, 2)],
  term (-4 : Rat) [(0, 2), (15, 2)],
  term (8 : Rat) [(1, 1), (11, 1), (15, 2)],
  term (-4 : Rat) [(1, 2), (15, 2)],
  term (-8 : Rat) [(8, 1), (10, 1), (15, 2)],
  term (4 : Rat) [(8, 2), (15, 2)],
  term (-8 : Rat) [(9, 1), (11, 1), (15, 2)],
  term (4 : Rat) [(9, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 325 for generator 23. -/
theorem rs_R009_ueqv_R009NYYNY_partial_23_0325_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_23_0325
        rs_R009_ueqv_R009NYYNY_generator_23_0300_0325 =
      rs_R009_ueqv_R009NYYNY_partial_23_0325 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NYYNY_partials_23_0300_0325 : List Poly :=
[
  rs_R009_ueqv_R009NYYNY_partial_23_0300,
  rs_R009_ueqv_R009NYYNY_partial_23_0301,
  rs_R009_ueqv_R009NYYNY_partial_23_0302,
  rs_R009_ueqv_R009NYYNY_partial_23_0303,
  rs_R009_ueqv_R009NYYNY_partial_23_0304,
  rs_R009_ueqv_R009NYYNY_partial_23_0305,
  rs_R009_ueqv_R009NYYNY_partial_23_0306,
  rs_R009_ueqv_R009NYYNY_partial_23_0307,
  rs_R009_ueqv_R009NYYNY_partial_23_0308,
  rs_R009_ueqv_R009NYYNY_partial_23_0309,
  rs_R009_ueqv_R009NYYNY_partial_23_0310,
  rs_R009_ueqv_R009NYYNY_partial_23_0311,
  rs_R009_ueqv_R009NYYNY_partial_23_0312,
  rs_R009_ueqv_R009NYYNY_partial_23_0313,
  rs_R009_ueqv_R009NYYNY_partial_23_0314,
  rs_R009_ueqv_R009NYYNY_partial_23_0315,
  rs_R009_ueqv_R009NYYNY_partial_23_0316,
  rs_R009_ueqv_R009NYYNY_partial_23_0317,
  rs_R009_ueqv_R009NYYNY_partial_23_0318,
  rs_R009_ueqv_R009NYYNY_partial_23_0319,
  rs_R009_ueqv_R009NYYNY_partial_23_0320,
  rs_R009_ueqv_R009NYYNY_partial_23_0321,
  rs_R009_ueqv_R009NYYNY_partial_23_0322,
  rs_R009_ueqv_R009NYYNY_partial_23_0323,
  rs_R009_ueqv_R009NYYNY_partial_23_0324,
  rs_R009_ueqv_R009NYYNY_partial_23_0325
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NYYNY_block_23_0300_0325 : Poly :=
[
  term (6 : Rat) [(0, 1), (9, 1), (10, 1), (11, 1)],
  term ((176 : Rat) / 3) [(0, 1), (9, 1), (10, 1), (13, 1)],
  term (-56 : Rat) [(0, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((797 : Rat) / 6) [(0, 1), (9, 1), (10, 1), (15, 1)],
  term ((-177 : Rat) / 4) [(0, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1549 : Rat) / 6) [(0, 1), (9, 1), (10, 2), (15, 1)],
  term ((189 : Rat) / 4) [(0, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term (54 : Rat) [(0, 1), (9, 1), (10, 3), (11, 1)],
  term (-30 : Rat) [(0, 1), (9, 1), (10, 3), (13, 1)],
  term (66 : Rat) [(0, 1), (9, 1), (10, 3), (15, 1)],
  term (-9 : Rat) [(0, 1), (9, 1), (10, 3), (15, 1), (16, 1)],
  term ((-8 : Rat) / 3) [(0, 1), (9, 2), (10, 1)],
  term (27 : Rat) [(0, 1), (10, 1), (11, 1), (13, 1)],
  term (120 : Rat) [(0, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-437 : Rat) / 4) [(0, 1), (10, 1), (11, 1), (15, 1)],
  term ((207 : Rat) / 8) [(0, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term (-138 : Rat) [(0, 1), (10, 1), (11, 2)],
  term (-2 : Rat) [(0, 1), (10, 1), (13, 1), (15, 1)],
  term (4 : Rat) [(0, 1), (10, 1), (14, 1)],
  term (8 : Rat) [(0, 1), (10, 1), (15, 2)],
  term ((13 : Rat) / 2) [(0, 1), (10, 2)],
  term (-9 : Rat) [(0, 1), (10, 2), (11, 1), (13, 1)],
  term (63 : Rat) [(0, 1), (10, 2), (11, 1), (15, 1)],
  term ((-27 : Rat) / 2) [(0, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term (27 : Rat) [(0, 1), (10, 2), (11, 2)],
  term ((-3 : Rat) / 2) [(0, 1), (10, 3)],
  term ((1549 : Rat) / 12) [(0, 2), (9, 1), (10, 1), (15, 1)],
  term ((-189 : Rat) / 8) [(0, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term (-27 : Rat) [(0, 2), (9, 1), (10, 2), (11, 1)],
  term (15 : Rat) [(0, 2), (9, 1), (10, 2), (13, 1)],
  term (-33 : Rat) [(0, 2), (9, 1), (10, 2), (15, 1)],
  term ((9 : Rat) / 2) [(0, 2), (9, 1), (10, 2), (15, 1), (16, 1)],
  term (-3 : Rat) [(0, 2), (9, 1), (11, 1)],
  term ((-88 : Rat) / 3) [(0, 2), (9, 1), (13, 1)],
  term (28 : Rat) [(0, 2), (9, 1), (14, 1), (15, 1)],
  term ((-797 : Rat) / 12) [(0, 2), (9, 1), (15, 1)],
  term ((177 : Rat) / 8) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((4 : Rat) / 3) [(0, 2), (9, 2)],
  term ((-13 : Rat) / 4) [(0, 2), (10, 1)],
  term ((9 : Rat) / 2) [(0, 2), (10, 1), (11, 1), (13, 1)],
  term ((-63 : Rat) / 2) [(0, 2), (10, 1), (11, 1), (15, 1)],
  term ((27 : Rat) / 4) [(0, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-27 : Rat) / 2) [(0, 2), (10, 1), (11, 2)],
  term ((3 : Rat) / 4) [(0, 2), (10, 2)],
  term ((-27 : Rat) / 2) [(0, 2), (11, 1), (13, 1)],
  term (-60 : Rat) [(0, 2), (11, 1), (14, 1), (15, 1)],
  term ((437 : Rat) / 8) [(0, 2), (11, 1), (15, 1)],
  term ((-207 : Rat) / 16) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term (69 : Rat) [(0, 2), (11, 2)],
  term (1 : Rat) [(0, 2), (13, 1), (15, 1)],
  term (-2 : Rat) [(0, 2), (14, 1)],
  term (-4 : Rat) [(0, 2), (15, 2)],
  term ((-1549 : Rat) / 6) [(1, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((189 : Rat) / 4) [(1, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term (-30 : Rat) [(1, 1), (9, 1), (10, 2), (11, 1), (13, 1)],
  term (66 : Rat) [(1, 1), (9, 1), (10, 2), (11, 1), (15, 1)],
  term (-9 : Rat) [(1, 1), (9, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term (54 : Rat) [(1, 1), (9, 1), (10, 2), (11, 2)],
  term ((176 : Rat) / 3) [(1, 1), (9, 1), (11, 1), (13, 1)],
  term (-56 : Rat) [(1, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((797 : Rat) / 6) [(1, 1), (9, 1), (11, 1), (15, 1)],
  term ((-177 : Rat) / 4) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(1, 1), (9, 1), (11, 2)],
  term ((-8 : Rat) / 3) [(1, 1), (9, 2), (11, 1)],
  term ((13 : Rat) / 2) [(1, 1), (10, 1), (11, 1)],
  term (-9 : Rat) [(1, 1), (10, 1), (11, 2), (13, 1)],
  term (63 : Rat) [(1, 1), (10, 1), (11, 2), (15, 1)],
  term ((-27 : Rat) / 2) [(1, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term (27 : Rat) [(1, 1), (10, 1), (11, 3)],
  term ((-3 : Rat) / 2) [(1, 1), (10, 2), (11, 1)],
  term (-2 : Rat) [(1, 1), (11, 1), (13, 1), (15, 1)],
  term (4 : Rat) [(1, 1), (11, 1), (14, 1)],
  term (8 : Rat) [(1, 1), (11, 1), (15, 2)],
  term (27 : Rat) [(1, 1), (11, 2), (13, 1)],
  term (120 : Rat) [(1, 1), (11, 2), (14, 1), (15, 1)],
  term ((-437 : Rat) / 4) [(1, 1), (11, 2), (15, 1)],
  term ((207 : Rat) / 8) [(1, 1), (11, 2), (15, 1), (16, 1)],
  term (-138 : Rat) [(1, 1), (11, 3)],
  term ((1549 : Rat) / 12) [(1, 2), (9, 1), (10, 1), (15, 1)],
  term ((-189 : Rat) / 8) [(1, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term (-27 : Rat) [(1, 2), (9, 1), (10, 2), (11, 1)],
  term (15 : Rat) [(1, 2), (9, 1), (10, 2), (13, 1)],
  term (-33 : Rat) [(1, 2), (9, 1), (10, 2), (15, 1)],
  term ((9 : Rat) / 2) [(1, 2), (9, 1), (10, 2), (15, 1), (16, 1)],
  term (-3 : Rat) [(1, 2), (9, 1), (11, 1)],
  term ((-88 : Rat) / 3) [(1, 2), (9, 1), (13, 1)],
  term (28 : Rat) [(1, 2), (9, 1), (14, 1), (15, 1)],
  term ((-797 : Rat) / 12) [(1, 2), (9, 1), (15, 1)],
  term ((177 : Rat) / 8) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((4 : Rat) / 3) [(1, 2), (9, 2)],
  term ((-13 : Rat) / 4) [(1, 2), (10, 1)],
  term ((9 : Rat) / 2) [(1, 2), (10, 1), (11, 1), (13, 1)],
  term ((-63 : Rat) / 2) [(1, 2), (10, 1), (11, 1), (15, 1)],
  term ((27 : Rat) / 4) [(1, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-27 : Rat) / 2) [(1, 2), (10, 1), (11, 2)],
  term ((3 : Rat) / 4) [(1, 2), (10, 2)],
  term ((-27 : Rat) / 2) [(1, 2), (11, 1), (13, 1)],
  term (-60 : Rat) [(1, 2), (11, 1), (14, 1), (15, 1)],
  term ((437 : Rat) / 8) [(1, 2), (11, 1), (15, 1)],
  term ((-207 : Rat) / 16) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term (69 : Rat) [(1, 2), (11, 2)],
  term (1 : Rat) [(1, 2), (13, 1), (15, 1)],
  term (-2 : Rat) [(1, 2), (14, 1)],
  term (-4 : Rat) [(1, 2), (15, 2)],
  term (-6 : Rat) [(8, 1), (9, 1), (10, 1), (11, 1)],
  term ((-176 : Rat) / 3) [(8, 1), (9, 1), (10, 1), (13, 1)],
  term (56 : Rat) [(8, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-797 : Rat) / 6) [(8, 1), (9, 1), (10, 1), (15, 1)],
  term ((177 : Rat) / 4) [(8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((1549 : Rat) / 6) [(8, 1), (9, 1), (10, 2), (15, 1)],
  term ((-189 : Rat) / 4) [(8, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term (-54 : Rat) [(8, 1), (9, 1), (10, 3), (11, 1)],
  term (30 : Rat) [(8, 1), (9, 1), (10, 3), (13, 1)],
  term (-66 : Rat) [(8, 1), (9, 1), (10, 3), (15, 1)],
  term (9 : Rat) [(8, 1), (9, 1), (10, 3), (15, 1), (16, 1)],
  term ((8 : Rat) / 3) [(8, 1), (9, 2), (10, 1)],
  term (-27 : Rat) [(8, 1), (10, 1), (11, 1), (13, 1)],
  term (-120 : Rat) [(8, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((437 : Rat) / 4) [(8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-207 : Rat) / 8) [(8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term (138 : Rat) [(8, 1), (10, 1), (11, 2)],
  term (2 : Rat) [(8, 1), (10, 1), (13, 1), (15, 1)],
  term (-4 : Rat) [(8, 1), (10, 1), (14, 1)],
  term (-8 : Rat) [(8, 1), (10, 1), (15, 2)],
  term ((-13 : Rat) / 2) [(8, 1), (10, 2)],
  term (9 : Rat) [(8, 1), (10, 2), (11, 1), (13, 1)],
  term (-63 : Rat) [(8, 1), (10, 2), (11, 1), (15, 1)],
  term ((27 : Rat) / 2) [(8, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term (-27 : Rat) [(8, 1), (10, 2), (11, 2)],
  term ((3 : Rat) / 2) [(8, 1), (10, 3)],
  term ((-1549 : Rat) / 12) [(8, 2), (9, 1), (10, 1), (15, 1)],
  term ((189 : Rat) / 8) [(8, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term (27 : Rat) [(8, 2), (9, 1), (10, 2), (11, 1)],
  term (-15 : Rat) [(8, 2), (9, 1), (10, 2), (13, 1)],
  term (33 : Rat) [(8, 2), (9, 1), (10, 2), (15, 1)],
  term ((-9 : Rat) / 2) [(8, 2), (9, 1), (10, 2), (15, 1), (16, 1)],
  term (3 : Rat) [(8, 2), (9, 1), (11, 1)],
  term ((88 : Rat) / 3) [(8, 2), (9, 1), (13, 1)],
  term (-28 : Rat) [(8, 2), (9, 1), (14, 1), (15, 1)],
  term ((797 : Rat) / 12) [(8, 2), (9, 1), (15, 1)],
  term ((-177 : Rat) / 8) [(8, 2), (9, 1), (15, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(8, 2), (9, 2)],
  term ((13 : Rat) / 4) [(8, 2), (10, 1)],
  term ((-9 : Rat) / 2) [(8, 2), (10, 1), (11, 1), (13, 1)],
  term ((63 : Rat) / 2) [(8, 2), (10, 1), (11, 1), (15, 1)],
  term ((-27 : Rat) / 4) [(8, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((27 : Rat) / 2) [(8, 2), (10, 1), (11, 2)],
  term ((-3 : Rat) / 4) [(8, 2), (10, 2)],
  term ((27 : Rat) / 2) [(8, 2), (11, 1), (13, 1)],
  term (60 : Rat) [(8, 2), (11, 1), (14, 1), (15, 1)],
  term ((-437 : Rat) / 8) [(8, 2), (11, 1), (15, 1)],
  term ((207 : Rat) / 16) [(8, 2), (11, 1), (15, 1), (16, 1)],
  term (-69 : Rat) [(8, 2), (11, 2)],
  term (-1 : Rat) [(8, 2), (13, 1), (15, 1)],
  term (2 : Rat) [(8, 2), (14, 1)],
  term (4 : Rat) [(8, 2), (15, 2)],
  term ((-13 : Rat) / 2) [(9, 1), (10, 1), (11, 1)],
  term (9 : Rat) [(9, 1), (10, 1), (11, 2), (13, 1)],
  term (-63 : Rat) [(9, 1), (10, 1), (11, 2), (15, 1)],
  term ((27 : Rat) / 2) [(9, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term (-27 : Rat) [(9, 1), (10, 1), (11, 3)],
  term ((3 : Rat) / 2) [(9, 1), (10, 2), (11, 1)],
  term (2 : Rat) [(9, 1), (11, 1), (13, 1), (15, 1)],
  term (-4 : Rat) [(9, 1), (11, 1), (14, 1)],
  term (-8 : Rat) [(9, 1), (11, 1), (15, 2)],
  term (-27 : Rat) [(9, 1), (11, 2), (13, 1)],
  term (-120 : Rat) [(9, 1), (11, 2), (14, 1), (15, 1)],
  term ((437 : Rat) / 4) [(9, 1), (11, 2), (15, 1)],
  term ((-207 : Rat) / 8) [(9, 1), (11, 2), (15, 1), (16, 1)],
  term (138 : Rat) [(9, 1), (11, 3)],
  term ((13 : Rat) / 4) [(9, 2), (10, 1)],
  term ((-9 : Rat) / 2) [(9, 2), (10, 1), (11, 1), (13, 1)],
  term ((869 : Rat) / 3) [(9, 2), (10, 1), (11, 1), (15, 1)],
  term (-54 : Rat) [(9, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((27 : Rat) / 2) [(9, 2), (10, 1), (11, 2)],
  term ((-3 : Rat) / 4) [(9, 2), (10, 2)],
  term (30 : Rat) [(9, 2), (10, 2), (11, 1), (13, 1)],
  term (-66 : Rat) [(9, 2), (10, 2), (11, 1), (15, 1)],
  term (9 : Rat) [(9, 2), (10, 2), (11, 1), (15, 1), (16, 1)],
  term (-54 : Rat) [(9, 2), (10, 2), (11, 2)],
  term ((-271 : Rat) / 6) [(9, 2), (11, 1), (13, 1)],
  term (116 : Rat) [(9, 2), (11, 1), (14, 1), (15, 1)],
  term ((-4499 : Rat) / 24) [(9, 2), (11, 1), (15, 1)],
  term ((915 : Rat) / 16) [(9, 2), (11, 1), (15, 1), (16, 1)],
  term (-75 : Rat) [(9, 2), (11, 2)],
  term (-1 : Rat) [(9, 2), (13, 1), (15, 1)],
  term (2 : Rat) [(9, 2), (14, 1)],
  term (4 : Rat) [(9, 2), (15, 2)],
  term ((-1549 : Rat) / 12) [(9, 3), (10, 1), (15, 1)],
  term ((189 : Rat) / 8) [(9, 3), (10, 1), (15, 1), (16, 1)],
  term (27 : Rat) [(9, 3), (10, 2), (11, 1)],
  term (-15 : Rat) [(9, 3), (10, 2), (13, 1)],
  term (33 : Rat) [(9, 3), (10, 2), (15, 1)],
  term ((-9 : Rat) / 2) [(9, 3), (10, 2), (15, 1), (16, 1)],
  term ((17 : Rat) / 3) [(9, 3), (11, 1)],
  term ((88 : Rat) / 3) [(9, 3), (13, 1)],
  term (-28 : Rat) [(9, 3), (14, 1), (15, 1)],
  term ((797 : Rat) / 12) [(9, 3), (15, 1)],
  term ((-177 : Rat) / 8) [(9, 3), (15, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(9, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 23, terms 300 through 325. -/
theorem rs_R009_ueqv_R009NYYNY_block_23_0300_0325_valid :
    checkProductSumEq rs_R009_ueqv_R009NYYNY_partials_23_0300_0325
      rs_R009_ueqv_R009NYYNY_block_23_0300_0325 = true := by
  native_decide

end R009UeqvR009NYYNYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
