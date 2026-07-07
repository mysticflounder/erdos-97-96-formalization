/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NYYNY, term block 5:200-299

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NYYNYTermShards

/-- Generator polynomial 5 for relaxed split surplus certificate `R009:u=v:R009NYYNY`. -/
def rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 : Poly :=
[
  term (-2 : Rat) [(4, 1)],
  term (1 : Rat) [(4, 2)],
  term (1 : Rat) [(5, 2)],
  term (2 : Rat) [(14, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 200 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYNY_coefficient_05_0200 : Poly :=
[
  term (-7 : Rat) [(3, 1), (9, 1), (14, 1)]
]

/-- Partial product 200 for generator 5. -/
def rs_R009_ueqv_R009NYYNY_partial_05_0200 : Poly :=
[
  term (14 : Rat) [(3, 1), (4, 1), (9, 1), (14, 1)],
  term (-7 : Rat) [(3, 1), (4, 2), (9, 1), (14, 1)],
  term (-7 : Rat) [(3, 1), (5, 2), (9, 1), (14, 1)],
  term (7 : Rat) [(3, 1), (9, 1), (14, 1), (15, 2)],
  term (-14 : Rat) [(3, 1), (9, 1), (14, 2)],
  term (7 : Rat) [(3, 1), (9, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 5. -/
theorem rs_R009_ueqv_R009NYYNY_partial_05_0200_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_05_0200
        rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 =
      rs_R009_ueqv_R009NYYNY_partial_05_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYNY_coefficient_05_0201 : Poly :=
[
  term ((20 : Rat) / 3) [(3, 1), (10, 1), (11, 1)]
]

/-- Partial product 201 for generator 5. -/
def rs_R009_ueqv_R009NYYNY_partial_05_0201 : Poly :=
[
  term ((-40 : Rat) / 3) [(3, 1), (4, 1), (10, 1), (11, 1)],
  term ((20 : Rat) / 3) [(3, 1), (4, 2), (10, 1), (11, 1)],
  term ((20 : Rat) / 3) [(3, 1), (5, 2), (10, 1), (11, 1)],
  term ((40 : Rat) / 3) [(3, 1), (10, 1), (11, 1), (14, 1)],
  term ((-20 : Rat) / 3) [(3, 1), (10, 1), (11, 1), (14, 2)],
  term ((-20 : Rat) / 3) [(3, 1), (10, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 5. -/
theorem rs_R009_ueqv_R009NYYNY_partial_05_0201_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_05_0201
        rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 =
      rs_R009_ueqv_R009NYYNY_partial_05_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYNY_coefficient_05_0202 : Poly :=
[
  term (-24 : Rat) [(3, 1), (10, 1), (11, 1), (14, 1)]
]

/-- Partial product 202 for generator 5. -/
def rs_R009_ueqv_R009NYYNY_partial_05_0202 : Poly :=
[
  term (48 : Rat) [(3, 1), (4, 1), (10, 1), (11, 1), (14, 1)],
  term (-24 : Rat) [(3, 1), (4, 2), (10, 1), (11, 1), (14, 1)],
  term (-24 : Rat) [(3, 1), (5, 2), (10, 1), (11, 1), (14, 1)],
  term (24 : Rat) [(3, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term (-48 : Rat) [(3, 1), (10, 1), (11, 1), (14, 2)],
  term (24 : Rat) [(3, 1), (10, 1), (11, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 5. -/
theorem rs_R009_ueqv_R009NYYNY_partial_05_0202_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_05_0202
        rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 =
      rs_R009_ueqv_R009NYYNY_partial_05_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYNY_coefficient_05_0203 : Poly :=
[
  term (4 : Rat) [(3, 1), (10, 1), (13, 1)]
]

/-- Partial product 203 for generator 5. -/
def rs_R009_ueqv_R009NYYNY_partial_05_0203 : Poly :=
[
  term (-8 : Rat) [(3, 1), (4, 1), (10, 1), (13, 1)],
  term (4 : Rat) [(3, 1), (4, 2), (10, 1), (13, 1)],
  term (4 : Rat) [(3, 1), (5, 2), (10, 1), (13, 1)],
  term (8 : Rat) [(3, 1), (10, 1), (13, 1), (14, 1)],
  term (-4 : Rat) [(3, 1), (10, 1), (13, 1), (14, 2)],
  term (-4 : Rat) [(3, 1), (10, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 5. -/
theorem rs_R009_ueqv_R009NYYNY_partial_05_0203_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_05_0203
        rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 =
      rs_R009_ueqv_R009NYYNY_partial_05_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYNY_coefficient_05_0204 : Poly :=
[
  term (-24 : Rat) [(3, 1), (10, 1), (13, 1), (14, 1)]
]

/-- Partial product 204 for generator 5. -/
def rs_R009_ueqv_R009NYYNY_partial_05_0204 : Poly :=
[
  term (48 : Rat) [(3, 1), (4, 1), (10, 1), (13, 1), (14, 1)],
  term (-24 : Rat) [(3, 1), (4, 2), (10, 1), (13, 1), (14, 1)],
  term (-24 : Rat) [(3, 1), (5, 2), (10, 1), (13, 1), (14, 1)],
  term (24 : Rat) [(3, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term (-48 : Rat) [(3, 1), (10, 1), (13, 1), (14, 2)],
  term (24 : Rat) [(3, 1), (10, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 5. -/
theorem rs_R009_ueqv_R009NYYNY_partial_05_0204_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_05_0204
        rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 =
      rs_R009_ueqv_R009NYYNY_partial_05_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYNY_coefficient_05_0205 : Poly :=
[
  term ((-40 : Rat) / 3) [(3, 1), (10, 2), (13, 1)]
]

/-- Partial product 205 for generator 5. -/
def rs_R009_ueqv_R009NYYNY_partial_05_0205 : Poly :=
[
  term ((80 : Rat) / 3) [(3, 1), (4, 1), (10, 2), (13, 1)],
  term ((-40 : Rat) / 3) [(3, 1), (4, 2), (10, 2), (13, 1)],
  term ((-40 : Rat) / 3) [(3, 1), (5, 2), (10, 2), (13, 1)],
  term ((-80 : Rat) / 3) [(3, 1), (10, 2), (13, 1), (14, 1)],
  term ((40 : Rat) / 3) [(3, 1), (10, 2), (13, 1), (14, 2)],
  term ((40 : Rat) / 3) [(3, 1), (10, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 5. -/
theorem rs_R009_ueqv_R009NYYNY_partial_05_0205_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_05_0205
        rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 =
      rs_R009_ueqv_R009NYYNY_partial_05_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYNY_coefficient_05_0206 : Poly :=
[
  term (48 : Rat) [(3, 1), (10, 2), (13, 1), (14, 1)]
]

/-- Partial product 206 for generator 5. -/
def rs_R009_ueqv_R009NYYNY_partial_05_0206 : Poly :=
[
  term (-96 : Rat) [(3, 1), (4, 1), (10, 2), (13, 1), (14, 1)],
  term (48 : Rat) [(3, 1), (4, 2), (10, 2), (13, 1), (14, 1)],
  term (48 : Rat) [(3, 1), (5, 2), (10, 2), (13, 1), (14, 1)],
  term (-48 : Rat) [(3, 1), (10, 2), (13, 1), (14, 1), (15, 2)],
  term (96 : Rat) [(3, 1), (10, 2), (13, 1), (14, 2)],
  term (-48 : Rat) [(3, 1), (10, 2), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 5. -/
theorem rs_R009_ueqv_R009NYYNY_partial_05_0206_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_05_0206
        rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 =
      rs_R009_ueqv_R009NYYNY_partial_05_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYNY_coefficient_05_0207 : Poly :=
[
  term (-2 : Rat) [(3, 1), (11, 1)]
]

/-- Partial product 207 for generator 5. -/
def rs_R009_ueqv_R009NYYNY_partial_05_0207 : Poly :=
[
  term (4 : Rat) [(3, 1), (4, 1), (11, 1)],
  term (-2 : Rat) [(3, 1), (4, 2), (11, 1)],
  term (-2 : Rat) [(3, 1), (5, 2), (11, 1)],
  term (-4 : Rat) [(3, 1), (11, 1), (14, 1)],
  term (2 : Rat) [(3, 1), (11, 1), (14, 2)],
  term (2 : Rat) [(3, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 5. -/
theorem rs_R009_ueqv_R009NYYNY_partial_05_0207_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_05_0207
        rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 =
      rs_R009_ueqv_R009NYYNY_partial_05_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYNY_coefficient_05_0208 : Poly :=
[
  term (12 : Rat) [(3, 1), (11, 1), (14, 1)]
]

/-- Partial product 208 for generator 5. -/
def rs_R009_ueqv_R009NYYNY_partial_05_0208 : Poly :=
[
  term (-24 : Rat) [(3, 1), (4, 1), (11, 1), (14, 1)],
  term (12 : Rat) [(3, 1), (4, 2), (11, 1), (14, 1)],
  term (12 : Rat) [(3, 1), (5, 2), (11, 1), (14, 1)],
  term (-12 : Rat) [(3, 1), (11, 1), (14, 1), (15, 2)],
  term (24 : Rat) [(3, 1), (11, 1), (14, 2)],
  term (-12 : Rat) [(3, 1), (11, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 5. -/
theorem rs_R009_ueqv_R009NYYNY_partial_05_0208_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_05_0208
        rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 =
      rs_R009_ueqv_R009NYYNY_partial_05_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYNY_coefficient_05_0209 : Poly :=
[
  term ((-10 : Rat) / 3) [(3, 1), (13, 1)]
]

/-- Partial product 209 for generator 5. -/
def rs_R009_ueqv_R009NYYNY_partial_05_0209 : Poly :=
[
  term ((20 : Rat) / 3) [(3, 1), (4, 1), (13, 1)],
  term ((-10 : Rat) / 3) [(3, 1), (4, 2), (13, 1)],
  term ((-10 : Rat) / 3) [(3, 1), (5, 2), (13, 1)],
  term ((-20 : Rat) / 3) [(3, 1), (13, 1), (14, 1)],
  term ((10 : Rat) / 3) [(3, 1), (13, 1), (14, 2)],
  term ((10 : Rat) / 3) [(3, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 5. -/
theorem rs_R009_ueqv_R009NYYNY_partial_05_0209_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_05_0209
        rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 =
      rs_R009_ueqv_R009NYYNY_partial_05_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYNY_coefficient_05_0210 : Poly :=
[
  term (10 : Rat) [(3, 1), (13, 1), (14, 1)]
]

/-- Partial product 210 for generator 5. -/
def rs_R009_ueqv_R009NYYNY_partial_05_0210 : Poly :=
[
  term (-20 : Rat) [(3, 1), (4, 1), (13, 1), (14, 1)],
  term (10 : Rat) [(3, 1), (4, 2), (13, 1), (14, 1)],
  term (10 : Rat) [(3, 1), (5, 2), (13, 1), (14, 1)],
  term (-10 : Rat) [(3, 1), (13, 1), (14, 1), (15, 2)],
  term (20 : Rat) [(3, 1), (13, 1), (14, 2)],
  term (-10 : Rat) [(3, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 5. -/
theorem rs_R009_ueqv_R009NYYNY_partial_05_0210_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_05_0210
        rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 =
      rs_R009_ueqv_R009NYYNY_partial_05_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYNY_coefficient_05_0211 : Poly :=
[
  term ((25 : Rat) / 6) [(3, 1), (15, 1)]
]

/-- Partial product 211 for generator 5. -/
def rs_R009_ueqv_R009NYYNY_partial_05_0211 : Poly :=
[
  term ((-25 : Rat) / 3) [(3, 1), (4, 1), (15, 1)],
  term ((25 : Rat) / 6) [(3, 1), (4, 2), (15, 1)],
  term ((25 : Rat) / 6) [(3, 1), (5, 2), (15, 1)],
  term ((25 : Rat) / 3) [(3, 1), (14, 1), (15, 1)],
  term ((-25 : Rat) / 6) [(3, 1), (14, 2), (15, 1)],
  term ((-25 : Rat) / 6) [(3, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 5. -/
theorem rs_R009_ueqv_R009NYYNY_partial_05_0211_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_05_0211
        rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 =
      rs_R009_ueqv_R009NYYNY_partial_05_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYNY_coefficient_05_0212 : Poly :=
[
  term ((-4 : Rat) / 3) [(3, 2)]
]

/-- Partial product 212 for generator 5. -/
def rs_R009_ueqv_R009NYYNY_partial_05_0212 : Poly :=
[
  term ((8 : Rat) / 3) [(3, 2), (4, 1)],
  term ((-4 : Rat) / 3) [(3, 2), (4, 2)],
  term ((-4 : Rat) / 3) [(3, 2), (5, 2)],
  term ((-8 : Rat) / 3) [(3, 2), (14, 1)],
  term ((4 : Rat) / 3) [(3, 2), (14, 2)],
  term ((4 : Rat) / 3) [(3, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 5. -/
theorem rs_R009_ueqv_R009NYYNY_partial_05_0212_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_05_0212
        rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 =
      rs_R009_ueqv_R009NYYNY_partial_05_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYNY_coefficient_05_0213 : Poly :=
[
  term ((-2 : Rat) / 3) [(4, 1)]
]

/-- Partial product 213 for generator 5. -/
def rs_R009_ueqv_R009NYYNY_partial_05_0213 : Poly :=
[
  term ((-2 : Rat) / 3) [(4, 1), (5, 2)],
  term ((-4 : Rat) / 3) [(4, 1), (14, 1)],
  term ((2 : Rat) / 3) [(4, 1), (14, 2)],
  term ((2 : Rat) / 3) [(4, 1), (15, 2)],
  term ((4 : Rat) / 3) [(4, 2)],
  term ((-2 : Rat) / 3) [(4, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 5. -/
theorem rs_R009_ueqv_R009NYYNY_partial_05_0213_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_05_0213
        rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 =
      rs_R009_ueqv_R009NYYNY_partial_05_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYNY_coefficient_05_0214 : Poly :=
[
  term (-96 : Rat) [(4, 1), (5, 1), (10, 1), (11, 1)]
]

/-- Partial product 214 for generator 5. -/
def rs_R009_ueqv_R009NYYNY_partial_05_0214 : Poly :=
[
  term (-192 : Rat) [(4, 1), (5, 1), (10, 1), (11, 1), (14, 1)],
  term (96 : Rat) [(4, 1), (5, 1), (10, 1), (11, 1), (14, 2)],
  term (96 : Rat) [(4, 1), (5, 1), (10, 1), (11, 1), (15, 2)],
  term (-96 : Rat) [(4, 1), (5, 3), (10, 1), (11, 1)],
  term (192 : Rat) [(4, 2), (5, 1), (10, 1), (11, 1)],
  term (-96 : Rat) [(4, 3), (5, 1), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 5. -/
theorem rs_R009_ueqv_R009NYYNY_partial_05_0214_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_05_0214
        rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 =
      rs_R009_ueqv_R009NYYNY_partial_05_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYNY_coefficient_05_0215 : Poly :=
[
  term (54 : Rat) [(4, 1), (5, 1), (10, 1), (13, 1)]
]

/-- Partial product 215 for generator 5. -/
def rs_R009_ueqv_R009NYYNY_partial_05_0215 : Poly :=
[
  term (108 : Rat) [(4, 1), (5, 1), (10, 1), (13, 1), (14, 1)],
  term (-54 : Rat) [(4, 1), (5, 1), (10, 1), (13, 1), (14, 2)],
  term (-54 : Rat) [(4, 1), (5, 1), (10, 1), (13, 1), (15, 2)],
  term (54 : Rat) [(4, 1), (5, 3), (10, 1), (13, 1)],
  term (-108 : Rat) [(4, 2), (5, 1), (10, 1), (13, 1)],
  term (54 : Rat) [(4, 3), (5, 1), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 5. -/
theorem rs_R009_ueqv_R009NYYNY_partial_05_0215_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_05_0215
        rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 =
      rs_R009_ueqv_R009NYYNY_partial_05_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYNY_coefficient_05_0216 : Poly :=
[
  term (80 : Rat) [(4, 1), (5, 1), (10, 1), (14, 1), (15, 1)]
]

/-- Partial product 216 for generator 5. -/
def rs_R009_ueqv_R009NYYNY_partial_05_0216 : Poly :=
[
  term (-80 : Rat) [(4, 1), (5, 1), (10, 1), (14, 1), (15, 3)],
  term (160 : Rat) [(4, 1), (5, 1), (10, 1), (14, 2), (15, 1)],
  term (-80 : Rat) [(4, 1), (5, 1), (10, 1), (14, 3), (15, 1)],
  term (80 : Rat) [(4, 1), (5, 3), (10, 1), (14, 1), (15, 1)],
  term (-160 : Rat) [(4, 2), (5, 1), (10, 1), (14, 1), (15, 1)],
  term (80 : Rat) [(4, 3), (5, 1), (10, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 5. -/
theorem rs_R009_ueqv_R009NYYNY_partial_05_0216_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_05_0216
        rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 =
      rs_R009_ueqv_R009NYYNY_partial_05_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYNY_coefficient_05_0217 : Poly :=
[
  term ((-215 : Rat) / 3) [(4, 1), (5, 1), (10, 1), (15, 1)]
]

/-- Partial product 217 for generator 5. -/
def rs_R009_ueqv_R009NYYNY_partial_05_0217 : Poly :=
[
  term ((-430 : Rat) / 3) [(4, 1), (5, 1), (10, 1), (14, 1), (15, 1)],
  term ((215 : Rat) / 3) [(4, 1), (5, 1), (10, 1), (14, 2), (15, 1)],
  term ((215 : Rat) / 3) [(4, 1), (5, 1), (10, 1), (15, 3)],
  term ((-215 : Rat) / 3) [(4, 1), (5, 3), (10, 1), (15, 1)],
  term ((430 : Rat) / 3) [(4, 2), (5, 1), (10, 1), (15, 1)],
  term ((-215 : Rat) / 3) [(4, 3), (5, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 5. -/
theorem rs_R009_ueqv_R009NYYNY_partial_05_0217_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_05_0217
        rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 =
      rs_R009_ueqv_R009NYYNY_partial_05_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYNY_coefficient_05_0218 : Poly :=
[
  term ((21 : Rat) / 2) [(4, 1), (5, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 218 for generator 5. -/
def rs_R009_ueqv_R009NYYNY_partial_05_0218 : Poly :=
[
  term (21 : Rat) [(4, 1), (5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-21 : Rat) / 2) [(4, 1), (5, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-21 : Rat) / 2) [(4, 1), (5, 1), (10, 1), (15, 3), (16, 1)],
  term ((21 : Rat) / 2) [(4, 1), (5, 3), (10, 1), (15, 1), (16, 1)],
  term (-21 : Rat) [(4, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((21 : Rat) / 2) [(4, 3), (5, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 5. -/
theorem rs_R009_ueqv_R009NYYNY_partial_05_0218_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_05_0218
        rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 =
      rs_R009_ueqv_R009NYYNY_partial_05_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYNY_coefficient_05_0219 : Poly :=
[
  term (18 : Rat) [(4, 1), (5, 1), (10, 2), (11, 1)]
]

/-- Partial product 219 for generator 5. -/
def rs_R009_ueqv_R009NYYNY_partial_05_0219 : Poly :=
[
  term (36 : Rat) [(4, 1), (5, 1), (10, 2), (11, 1), (14, 1)],
  term (-18 : Rat) [(4, 1), (5, 1), (10, 2), (11, 1), (14, 2)],
  term (-18 : Rat) [(4, 1), (5, 1), (10, 2), (11, 1), (15, 2)],
  term (18 : Rat) [(4, 1), (5, 3), (10, 2), (11, 1)],
  term (-36 : Rat) [(4, 2), (5, 1), (10, 2), (11, 1)],
  term (18 : Rat) [(4, 3), (5, 1), (10, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 5. -/
theorem rs_R009_ueqv_R009NYYNY_partial_05_0219_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_05_0219
        rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 =
      rs_R009_ueqv_R009NYYNY_partial_05_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYNY_coefficient_05_0220 : Poly :=
[
  term (-12 : Rat) [(4, 1), (5, 1), (10, 2), (13, 1)]
]

/-- Partial product 220 for generator 5. -/
def rs_R009_ueqv_R009NYYNY_partial_05_0220 : Poly :=
[
  term (-24 : Rat) [(4, 1), (5, 1), (10, 2), (13, 1), (14, 1)],
  term (12 : Rat) [(4, 1), (5, 1), (10, 2), (13, 1), (14, 2)],
  term (12 : Rat) [(4, 1), (5, 1), (10, 2), (13, 1), (15, 2)],
  term (-12 : Rat) [(4, 1), (5, 3), (10, 2), (13, 1)],
  term (24 : Rat) [(4, 2), (5, 1), (10, 2), (13, 1)],
  term (-12 : Rat) [(4, 3), (5, 1), (10, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 5. -/
theorem rs_R009_ueqv_R009NYYNY_partial_05_0220_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_05_0220
        rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 =
      rs_R009_ueqv_R009NYYNY_partial_05_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYNY_coefficient_05_0221 : Poly :=
[
  term (12 : Rat) [(4, 1), (5, 1), (10, 2), (15, 1)]
]

/-- Partial product 221 for generator 5. -/
def rs_R009_ueqv_R009NYYNY_partial_05_0221 : Poly :=
[
  term (24 : Rat) [(4, 1), (5, 1), (10, 2), (14, 1), (15, 1)],
  term (-12 : Rat) [(4, 1), (5, 1), (10, 2), (14, 2), (15, 1)],
  term (-12 : Rat) [(4, 1), (5, 1), (10, 2), (15, 3)],
  term (12 : Rat) [(4, 1), (5, 3), (10, 2), (15, 1)],
  term (-24 : Rat) [(4, 2), (5, 1), (10, 2), (15, 1)],
  term (12 : Rat) [(4, 3), (5, 1), (10, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 5. -/
theorem rs_R009_ueqv_R009NYYNY_partial_05_0221_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_05_0221
        rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 =
      rs_R009_ueqv_R009NYYNY_partial_05_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYNY_coefficient_05_0222 : Poly :=
[
  term (55 : Rat) [(4, 1), (5, 1), (11, 1)]
]

/-- Partial product 222 for generator 5. -/
def rs_R009_ueqv_R009NYYNY_partial_05_0222 : Poly :=
[
  term (110 : Rat) [(4, 1), (5, 1), (11, 1), (14, 1)],
  term (-55 : Rat) [(4, 1), (5, 1), (11, 1), (14, 2)],
  term (-55 : Rat) [(4, 1), (5, 1), (11, 1), (15, 2)],
  term (55 : Rat) [(4, 1), (5, 3), (11, 1)],
  term (-110 : Rat) [(4, 2), (5, 1), (11, 1)],
  term (55 : Rat) [(4, 3), (5, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 5. -/
theorem rs_R009_ueqv_R009NYYNY_partial_05_0222_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_05_0222
        rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 =
      rs_R009_ueqv_R009NYYNY_partial_05_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYNY_coefficient_05_0223 : Poly :=
[
  term ((-68 : Rat) / 3) [(4, 1), (5, 1), (13, 1)]
]

/-- Partial product 223 for generator 5. -/
def rs_R009_ueqv_R009NYYNY_partial_05_0223 : Poly :=
[
  term ((-136 : Rat) / 3) [(4, 1), (5, 1), (13, 1), (14, 1)],
  term ((68 : Rat) / 3) [(4, 1), (5, 1), (13, 1), (14, 2)],
  term ((68 : Rat) / 3) [(4, 1), (5, 1), (13, 1), (15, 2)],
  term ((-68 : Rat) / 3) [(4, 1), (5, 3), (13, 1)],
  term ((136 : Rat) / 3) [(4, 2), (5, 1), (13, 1)],
  term ((-68 : Rat) / 3) [(4, 3), (5, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 5. -/
theorem rs_R009_ueqv_R009NYYNY_partial_05_0223_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_05_0223
        rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 =
      rs_R009_ueqv_R009NYYNY_partial_05_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYNY_coefficient_05_0224 : Poly :=
[
  term ((-208 : Rat) / 3) [(4, 1), (5, 1), (14, 1), (15, 1)]
]

/-- Partial product 224 for generator 5. -/
def rs_R009_ueqv_R009NYYNY_partial_05_0224 : Poly :=
[
  term ((208 : Rat) / 3) [(4, 1), (5, 1), (14, 1), (15, 3)],
  term ((-416 : Rat) / 3) [(4, 1), (5, 1), (14, 2), (15, 1)],
  term ((208 : Rat) / 3) [(4, 1), (5, 1), (14, 3), (15, 1)],
  term ((-208 : Rat) / 3) [(4, 1), (5, 3), (14, 1), (15, 1)],
  term ((416 : Rat) / 3) [(4, 2), (5, 1), (14, 1), (15, 1)],
  term ((-208 : Rat) / 3) [(4, 3), (5, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 5. -/
theorem rs_R009_ueqv_R009NYYNY_partial_05_0224_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_05_0224
        rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 =
      rs_R009_ueqv_R009NYYNY_partial_05_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYNY_coefficient_05_0225 : Poly :=
[
  term ((127 : Rat) / 2) [(4, 1), (5, 1), (15, 1)]
]

/-- Partial product 225 for generator 5. -/
def rs_R009_ueqv_R009NYYNY_partial_05_0225 : Poly :=
[
  term (127 : Rat) [(4, 1), (5, 1), (14, 1), (15, 1)],
  term ((-127 : Rat) / 2) [(4, 1), (5, 1), (14, 2), (15, 1)],
  term ((-127 : Rat) / 2) [(4, 1), (5, 1), (15, 3)],
  term ((127 : Rat) / 2) [(4, 1), (5, 3), (15, 1)],
  term (-127 : Rat) [(4, 2), (5, 1), (15, 1)],
  term ((127 : Rat) / 2) [(4, 3), (5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 5. -/
theorem rs_R009_ueqv_R009NYYNY_partial_05_0225_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_05_0225
        rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 =
      rs_R009_ueqv_R009NYYNY_partial_05_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYNY_coefficient_05_0226 : Poly :=
[
  term (-15 : Rat) [(4, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 226 for generator 5. -/
def rs_R009_ueqv_R009NYYNY_partial_05_0226 : Poly :=
[
  term (-30 : Rat) [(4, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term (15 : Rat) [(4, 1), (5, 1), (14, 2), (15, 1), (16, 1)],
  term (15 : Rat) [(4, 1), (5, 1), (15, 3), (16, 1)],
  term (-15 : Rat) [(4, 1), (5, 3), (15, 1), (16, 1)],
  term (30 : Rat) [(4, 2), (5, 1), (15, 1), (16, 1)],
  term (-15 : Rat) [(4, 3), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 5. -/
theorem rs_R009_ueqv_R009NYYNY_partial_05_0226_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_05_0226
        rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 =
      rs_R009_ueqv_R009NYYNY_partial_05_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYNY_coefficient_05_0227 : Poly :=
[
  term (-87 : Rat) [(4, 1), (9, 1), (10, 1), (11, 1)]
]

/-- Partial product 227 for generator 5. -/
def rs_R009_ueqv_R009NYYNY_partial_05_0227 : Poly :=
[
  term (-87 : Rat) [(4, 1), (5, 2), (9, 1), (10, 1), (11, 1)],
  term (-174 : Rat) [(4, 1), (9, 1), (10, 1), (11, 1), (14, 1)],
  term (87 : Rat) [(4, 1), (9, 1), (10, 1), (11, 1), (14, 2)],
  term (87 : Rat) [(4, 1), (9, 1), (10, 1), (11, 1), (15, 2)],
  term (174 : Rat) [(4, 2), (9, 1), (10, 1), (11, 1)],
  term (-87 : Rat) [(4, 3), (9, 1), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 5. -/
theorem rs_R009_ueqv_R009NYYNY_partial_05_0227_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_05_0227
        rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 =
      rs_R009_ueqv_R009NYYNY_partial_05_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYNY_coefficient_05_0228 : Poly :=
[
  term (51 : Rat) [(4, 1), (9, 1), (10, 1), (13, 1)]
]

/-- Partial product 228 for generator 5. -/
def rs_R009_ueqv_R009NYYNY_partial_05_0228 : Poly :=
[
  term (51 : Rat) [(4, 1), (5, 2), (9, 1), (10, 1), (13, 1)],
  term (102 : Rat) [(4, 1), (9, 1), (10, 1), (13, 1), (14, 1)],
  term (-51 : Rat) [(4, 1), (9, 1), (10, 1), (13, 1), (14, 2)],
  term (-51 : Rat) [(4, 1), (9, 1), (10, 1), (13, 1), (15, 2)],
  term (-102 : Rat) [(4, 2), (9, 1), (10, 1), (13, 1)],
  term (51 : Rat) [(4, 3), (9, 1), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 5. -/
theorem rs_R009_ueqv_R009NYYNY_partial_05_0228_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_05_0228
        rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 =
      rs_R009_ueqv_R009NYYNY_partial_05_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYNY_coefficient_05_0229 : Poly :=
[
  term (80 : Rat) [(4, 1), (9, 1), (10, 1), (14, 1), (15, 1)]
]

/-- Partial product 229 for generator 5. -/
def rs_R009_ueqv_R009NYYNY_partial_05_0229 : Poly :=
[
  term (80 : Rat) [(4, 1), (5, 2), (9, 1), (10, 1), (14, 1), (15, 1)],
  term (-80 : Rat) [(4, 1), (9, 1), (10, 1), (14, 1), (15, 3)],
  term (160 : Rat) [(4, 1), (9, 1), (10, 1), (14, 2), (15, 1)],
  term (-80 : Rat) [(4, 1), (9, 1), (10, 1), (14, 3), (15, 1)],
  term (-160 : Rat) [(4, 2), (9, 1), (10, 1), (14, 1), (15, 1)],
  term (80 : Rat) [(4, 3), (9, 1), (10, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 5. -/
theorem rs_R009_ueqv_R009NYYNY_partial_05_0229_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_05_0229
        rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 =
      rs_R009_ueqv_R009NYYNY_partial_05_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYNY_coefficient_05_0230 : Poly :=
[
  term ((-98 : Rat) / 3) [(4, 1), (9, 1), (10, 1), (15, 1)]
]

/-- Partial product 230 for generator 5. -/
def rs_R009_ueqv_R009NYYNY_partial_05_0230 : Poly :=
[
  term ((-98 : Rat) / 3) [(4, 1), (5, 2), (9, 1), (10, 1), (15, 1)],
  term ((-196 : Rat) / 3) [(4, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((98 : Rat) / 3) [(4, 1), (9, 1), (10, 1), (14, 2), (15, 1)],
  term ((98 : Rat) / 3) [(4, 1), (9, 1), (10, 1), (15, 3)],
  term ((196 : Rat) / 3) [(4, 2), (9, 1), (10, 1), (15, 1)],
  term ((-98 : Rat) / 3) [(4, 3), (9, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 5. -/
theorem rs_R009_ueqv_R009NYYNY_partial_05_0230_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_05_0230
        rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 =
      rs_R009_ueqv_R009NYYNY_partial_05_0230 := by
  native_decide

/-- Coefficient term 231 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYNY_coefficient_05_0231 : Poly :=
[
  term (-3 : Rat) [(4, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 231 for generator 5. -/
def rs_R009_ueqv_R009NYYNY_partial_05_0231 : Poly :=
[
  term (-3 : Rat) [(4, 1), (5, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(4, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(4, 1), (9, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term (3 : Rat) [(4, 1), (9, 1), (10, 1), (15, 3), (16, 1)],
  term (6 : Rat) [(4, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(4, 3), (9, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 231 for generator 5. -/
theorem rs_R009_ueqv_R009NYYNY_partial_05_0231_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_05_0231
        rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 =
      rs_R009_ueqv_R009NYYNY_partial_05_0231 := by
  native_decide

/-- Coefficient term 232 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYNY_coefficient_05_0232 : Poly :=
[
  term (18 : Rat) [(4, 1), (9, 1), (10, 2), (11, 1)]
]

/-- Partial product 232 for generator 5. -/
def rs_R009_ueqv_R009NYYNY_partial_05_0232 : Poly :=
[
  term (18 : Rat) [(4, 1), (5, 2), (9, 1), (10, 2), (11, 1)],
  term (36 : Rat) [(4, 1), (9, 1), (10, 2), (11, 1), (14, 1)],
  term (-18 : Rat) [(4, 1), (9, 1), (10, 2), (11, 1), (14, 2)],
  term (-18 : Rat) [(4, 1), (9, 1), (10, 2), (11, 1), (15, 2)],
  term (-36 : Rat) [(4, 2), (9, 1), (10, 2), (11, 1)],
  term (18 : Rat) [(4, 3), (9, 1), (10, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 232 for generator 5. -/
theorem rs_R009_ueqv_R009NYYNY_partial_05_0232_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_05_0232
        rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 =
      rs_R009_ueqv_R009NYYNY_partial_05_0232 := by
  native_decide

/-- Coefficient term 233 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYNY_coefficient_05_0233 : Poly :=
[
  term (-12 : Rat) [(4, 1), (9, 1), (10, 2), (13, 1)]
]

/-- Partial product 233 for generator 5. -/
def rs_R009_ueqv_R009NYYNY_partial_05_0233 : Poly :=
[
  term (-12 : Rat) [(4, 1), (5, 2), (9, 1), (10, 2), (13, 1)],
  term (-24 : Rat) [(4, 1), (9, 1), (10, 2), (13, 1), (14, 1)],
  term (12 : Rat) [(4, 1), (9, 1), (10, 2), (13, 1), (14, 2)],
  term (12 : Rat) [(4, 1), (9, 1), (10, 2), (13, 1), (15, 2)],
  term (24 : Rat) [(4, 2), (9, 1), (10, 2), (13, 1)],
  term (-12 : Rat) [(4, 3), (9, 1), (10, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 233 for generator 5. -/
theorem rs_R009_ueqv_R009NYYNY_partial_05_0233_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_05_0233
        rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 =
      rs_R009_ueqv_R009NYYNY_partial_05_0233 := by
  native_decide

/-- Coefficient term 234 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYNY_coefficient_05_0234 : Poly :=
[
  term (12 : Rat) [(4, 1), (9, 1), (10, 2), (15, 1)]
]

/-- Partial product 234 for generator 5. -/
def rs_R009_ueqv_R009NYYNY_partial_05_0234 : Poly :=
[
  term (12 : Rat) [(4, 1), (5, 2), (9, 1), (10, 2), (15, 1)],
  term (24 : Rat) [(4, 1), (9, 1), (10, 2), (14, 1), (15, 1)],
  term (-12 : Rat) [(4, 1), (9, 1), (10, 2), (14, 2), (15, 1)],
  term (-12 : Rat) [(4, 1), (9, 1), (10, 2), (15, 3)],
  term (-24 : Rat) [(4, 2), (9, 1), (10, 2), (15, 1)],
  term (12 : Rat) [(4, 3), (9, 1), (10, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 234 for generator 5. -/
theorem rs_R009_ueqv_R009NYYNY_partial_05_0234_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_05_0234
        rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 =
      rs_R009_ueqv_R009NYYNY_partial_05_0234 := by
  native_decide

/-- Coefficient term 235 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYNY_coefficient_05_0235 : Poly :=
[
  term (13 : Rat) [(4, 1), (9, 1), (11, 1)]
]

/-- Partial product 235 for generator 5. -/
def rs_R009_ueqv_R009NYYNY_partial_05_0235 : Poly :=
[
  term (13 : Rat) [(4, 1), (5, 2), (9, 1), (11, 1)],
  term (26 : Rat) [(4, 1), (9, 1), (11, 1), (14, 1)],
  term (-13 : Rat) [(4, 1), (9, 1), (11, 1), (14, 2)],
  term (-13 : Rat) [(4, 1), (9, 1), (11, 1), (15, 2)],
  term (-26 : Rat) [(4, 2), (9, 1), (11, 1)],
  term (13 : Rat) [(4, 3), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 235 for generator 5. -/
theorem rs_R009_ueqv_R009NYYNY_partial_05_0235_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_05_0235
        rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 =
      rs_R009_ueqv_R009NYYNY_partial_05_0235 := by
  native_decide

/-- Coefficient term 236 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYNY_coefficient_05_0236 : Poly :=
[
  term ((-41 : Rat) / 3) [(4, 1), (9, 1), (13, 1)]
]

/-- Partial product 236 for generator 5. -/
def rs_R009_ueqv_R009NYYNY_partial_05_0236 : Poly :=
[
  term ((-41 : Rat) / 3) [(4, 1), (5, 2), (9, 1), (13, 1)],
  term ((-82 : Rat) / 3) [(4, 1), (9, 1), (13, 1), (14, 1)],
  term ((41 : Rat) / 3) [(4, 1), (9, 1), (13, 1), (14, 2)],
  term ((41 : Rat) / 3) [(4, 1), (9, 1), (13, 1), (15, 2)],
  term ((82 : Rat) / 3) [(4, 2), (9, 1), (13, 1)],
  term ((-41 : Rat) / 3) [(4, 3), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 236 for generator 5. -/
theorem rs_R009_ueqv_R009NYYNY_partial_05_0236_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_05_0236
        rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 =
      rs_R009_ueqv_R009NYYNY_partial_05_0236 := by
  native_decide

/-- Coefficient term 237 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYNY_coefficient_05_0237 : Poly :=
[
  term ((-16 : Rat) / 3) [(4, 1), (9, 1), (14, 1), (15, 1)]
]

/-- Partial product 237 for generator 5. -/
def rs_R009_ueqv_R009NYYNY_partial_05_0237 : Poly :=
[
  term ((-16 : Rat) / 3) [(4, 1), (5, 2), (9, 1), (14, 1), (15, 1)],
  term ((16 : Rat) / 3) [(4, 1), (9, 1), (14, 1), (15, 3)],
  term ((-32 : Rat) / 3) [(4, 1), (9, 1), (14, 2), (15, 1)],
  term ((16 : Rat) / 3) [(4, 1), (9, 1), (14, 3), (15, 1)],
  term ((32 : Rat) / 3) [(4, 2), (9, 1), (14, 1), (15, 1)],
  term ((-16 : Rat) / 3) [(4, 3), (9, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 237 for generator 5. -/
theorem rs_R009_ueqv_R009NYYNY_partial_05_0237_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_05_0237
        rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 =
      rs_R009_ueqv_R009NYYNY_partial_05_0237 := by
  native_decide

/-- Coefficient term 238 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYNY_coefficient_05_0238 : Poly :=
[
  term ((-63 : Rat) / 4) [(4, 1), (9, 1), (15, 1)]
]

/-- Partial product 238 for generator 5. -/
def rs_R009_ueqv_R009NYYNY_partial_05_0238 : Poly :=
[
  term ((-63 : Rat) / 4) [(4, 1), (5, 2), (9, 1), (15, 1)],
  term ((-63 : Rat) / 2) [(4, 1), (9, 1), (14, 1), (15, 1)],
  term ((63 : Rat) / 4) [(4, 1), (9, 1), (14, 2), (15, 1)],
  term ((63 : Rat) / 4) [(4, 1), (9, 1), (15, 3)],
  term ((63 : Rat) / 2) [(4, 2), (9, 1), (15, 1)],
  term ((-63 : Rat) / 4) [(4, 3), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 238 for generator 5. -/
theorem rs_R009_ueqv_R009NYYNY_partial_05_0238_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_05_0238
        rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 =
      rs_R009_ueqv_R009NYYNY_partial_05_0238 := by
  native_decide

/-- Coefficient term 239 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYNY_coefficient_05_0239 : Poly :=
[
  term ((63 : Rat) / 8) [(4, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 239 for generator 5. -/
def rs_R009_ueqv_R009NYYNY_partial_05_0239 : Poly :=
[
  term ((63 : Rat) / 8) [(4, 1), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((63 : Rat) / 4) [(4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-63 : Rat) / 8) [(4, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-63 : Rat) / 8) [(4, 1), (9, 1), (15, 3), (16, 1)],
  term ((-63 : Rat) / 4) [(4, 2), (9, 1), (15, 1), (16, 1)],
  term ((63 : Rat) / 8) [(4, 3), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 239 for generator 5. -/
theorem rs_R009_ueqv_R009NYYNY_partial_05_0239_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_05_0239
        rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 =
      rs_R009_ueqv_R009NYYNY_partial_05_0239 := by
  native_decide

/-- Coefficient term 240 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYNY_coefficient_05_0240 : Poly :=
[
  term (-186 : Rat) [(4, 1), (10, 1), (11, 1), (13, 1)]
]

/-- Partial product 240 for generator 5. -/
def rs_R009_ueqv_R009NYYNY_partial_05_0240 : Poly :=
[
  term (-186 : Rat) [(4, 1), (5, 2), (10, 1), (11, 1), (13, 1)],
  term (-372 : Rat) [(4, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term (186 : Rat) [(4, 1), (10, 1), (11, 1), (13, 1), (14, 2)],
  term (186 : Rat) [(4, 1), (10, 1), (11, 1), (13, 1), (15, 2)],
  term (372 : Rat) [(4, 2), (10, 1), (11, 1), (13, 1)],
  term (-186 : Rat) [(4, 3), (10, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 240 for generator 5. -/
theorem rs_R009_ueqv_R009NYYNY_partial_05_0240_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_05_0240
        rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 =
      rs_R009_ueqv_R009NYYNY_partial_05_0240 := by
  native_decide

/-- Coefficient term 241 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYNY_coefficient_05_0241 : Poly :=
[
  term (-160 : Rat) [(4, 1), (10, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 241 for generator 5. -/
def rs_R009_ueqv_R009NYYNY_partial_05_0241 : Poly :=
[
  term (-160 : Rat) [(4, 1), (5, 2), (10, 1), (11, 1), (14, 1), (15, 1)],
  term (160 : Rat) [(4, 1), (10, 1), (11, 1), (14, 1), (15, 3)],
  term (-320 : Rat) [(4, 1), (10, 1), (11, 1), (14, 2), (15, 1)],
  term (160 : Rat) [(4, 1), (10, 1), (11, 1), (14, 3), (15, 1)],
  term (320 : Rat) [(4, 2), (10, 1), (11, 1), (14, 1), (15, 1)],
  term (-160 : Rat) [(4, 3), (10, 1), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 241 for generator 5. -/
theorem rs_R009_ueqv_R009NYYNY_partial_05_0241_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_05_0241
        rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 =
      rs_R009_ueqv_R009NYYNY_partial_05_0241 := by
  native_decide

/-- Coefficient term 242 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYNY_coefficient_05_0242 : Poly :=
[
  term ((268 : Rat) / 3) [(4, 1), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 242 for generator 5. -/
def rs_R009_ueqv_R009NYYNY_partial_05_0242 : Poly :=
[
  term ((268 : Rat) / 3) [(4, 1), (5, 2), (10, 1), (11, 1), (15, 1)],
  term ((536 : Rat) / 3) [(4, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-268 : Rat) / 3) [(4, 1), (10, 1), (11, 1), (14, 2), (15, 1)],
  term ((-268 : Rat) / 3) [(4, 1), (10, 1), (11, 1), (15, 3)],
  term ((-536 : Rat) / 3) [(4, 2), (10, 1), (11, 1), (15, 1)],
  term ((268 : Rat) / 3) [(4, 3), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 242 for generator 5. -/
theorem rs_R009_ueqv_R009NYYNY_partial_05_0242_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_05_0242
        rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 =
      rs_R009_ueqv_R009NYYNY_partial_05_0242 := by
  native_decide

/-- Coefficient term 243 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYNY_coefficient_05_0243 : Poly :=
[
  term (-3 : Rat) [(4, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 243 for generator 5. -/
def rs_R009_ueqv_R009NYYNY_partial_05_0243 : Poly :=
[
  term (-3 : Rat) [(4, 1), (5, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(4, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(4, 1), (10, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term (3 : Rat) [(4, 1), (10, 1), (11, 1), (15, 3), (16, 1)],
  term (6 : Rat) [(4, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(4, 3), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 243 for generator 5. -/
theorem rs_R009_ueqv_R009NYYNY_partial_05_0243_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_05_0243
        rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 =
      rs_R009_ueqv_R009NYYNY_partial_05_0243 := by
  native_decide

/-- Coefficient term 244 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYNY_coefficient_05_0244 : Poly :=
[
  term (177 : Rat) [(4, 1), (10, 1), (11, 2)]
]

/-- Partial product 244 for generator 5. -/
def rs_R009_ueqv_R009NYYNY_partial_05_0244 : Poly :=
[
  term (177 : Rat) [(4, 1), (5, 2), (10, 1), (11, 2)],
  term (354 : Rat) [(4, 1), (10, 1), (11, 2), (14, 1)],
  term (-177 : Rat) [(4, 1), (10, 1), (11, 2), (14, 2)],
  term (-177 : Rat) [(4, 1), (10, 1), (11, 2), (15, 2)],
  term (-354 : Rat) [(4, 2), (10, 1), (11, 2)],
  term (177 : Rat) [(4, 3), (10, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 244 for generator 5. -/
theorem rs_R009_ueqv_R009NYYNY_partial_05_0244_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_05_0244
        rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 =
      rs_R009_ueqv_R009NYYNY_partial_05_0244 := by
  native_decide

/-- Coefficient term 245 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYNY_coefficient_05_0245 : Poly :=
[
  term (80 : Rat) [(4, 1), (10, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 245 for generator 5. -/
def rs_R009_ueqv_R009NYYNY_partial_05_0245 : Poly :=
[
  term (80 : Rat) [(4, 1), (5, 2), (10, 1), (13, 1), (14, 1), (15, 1)],
  term (-80 : Rat) [(4, 1), (10, 1), (13, 1), (14, 1), (15, 3)],
  term (160 : Rat) [(4, 1), (10, 1), (13, 1), (14, 2), (15, 1)],
  term (-80 : Rat) [(4, 1), (10, 1), (13, 1), (14, 3), (15, 1)],
  term (-160 : Rat) [(4, 2), (10, 1), (13, 1), (14, 1), (15, 1)],
  term (80 : Rat) [(4, 3), (10, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 245 for generator 5. -/
theorem rs_R009_ueqv_R009NYYNY_partial_05_0245_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_05_0245
        rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 =
      rs_R009_ueqv_R009NYYNY_partial_05_0245 := by
  native_decide

/-- Coefficient term 246 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYNY_coefficient_05_0246 : Poly :=
[
  term ((-170 : Rat) / 3) [(4, 1), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 246 for generator 5. -/
def rs_R009_ueqv_R009NYYNY_partial_05_0246 : Poly :=
[
  term ((-170 : Rat) / 3) [(4, 1), (5, 2), (10, 1), (13, 1), (15, 1)],
  term ((-340 : Rat) / 3) [(4, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((170 : Rat) / 3) [(4, 1), (10, 1), (13, 1), (14, 2), (15, 1)],
  term ((170 : Rat) / 3) [(4, 1), (10, 1), (13, 1), (15, 3)],
  term ((340 : Rat) / 3) [(4, 2), (10, 1), (13, 1), (15, 1)],
  term ((-170 : Rat) / 3) [(4, 3), (10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 246 for generator 5. -/
theorem rs_R009_ueqv_R009NYYNY_partial_05_0246_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_05_0246
        rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 =
      rs_R009_ueqv_R009NYYNY_partial_05_0246 := by
  native_decide

/-- Coefficient term 247 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYNY_coefficient_05_0247 : Poly :=
[
  term (6 : Rat) [(4, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 247 for generator 5. -/
def rs_R009_ueqv_R009NYYNY_partial_05_0247 : Poly :=
[
  term (6 : Rat) [(4, 1), (5, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(4, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(4, 1), (10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term (-6 : Rat) [(4, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term (-12 : Rat) [(4, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(4, 3), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 247 for generator 5. -/
theorem rs_R009_ueqv_R009NYYNY_partial_05_0247_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_05_0247
        rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 =
      rs_R009_ueqv_R009NYYNY_partial_05_0247 := by
  native_decide

/-- Coefficient term 248 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYNY_coefficient_05_0248 : Poly :=
[
  term (45 : Rat) [(4, 1), (10, 1), (13, 2)]
]

/-- Partial product 248 for generator 5. -/
def rs_R009_ueqv_R009NYYNY_partial_05_0248 : Poly :=
[
  term (45 : Rat) [(4, 1), (5, 2), (10, 1), (13, 2)],
  term (90 : Rat) [(4, 1), (10, 1), (13, 2), (14, 1)],
  term (-45 : Rat) [(4, 1), (10, 1), (13, 2), (14, 2)],
  term (-45 : Rat) [(4, 1), (10, 1), (13, 2), (15, 2)],
  term (-90 : Rat) [(4, 2), (10, 1), (13, 2)],
  term (45 : Rat) [(4, 3), (10, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 248 for generator 5. -/
theorem rs_R009_ueqv_R009NYYNY_partial_05_0248_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_05_0248
        rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 =
      rs_R009_ueqv_R009NYYNY_partial_05_0248 := by
  native_decide

/-- Coefficient term 249 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYNY_coefficient_05_0249 : Poly :=
[
  term (42 : Rat) [(4, 1), (10, 2), (11, 1), (13, 1)]
]

/-- Partial product 249 for generator 5. -/
def rs_R009_ueqv_R009NYYNY_partial_05_0249 : Poly :=
[
  term (42 : Rat) [(4, 1), (5, 2), (10, 2), (11, 1), (13, 1)],
  term (84 : Rat) [(4, 1), (10, 2), (11, 1), (13, 1), (14, 1)],
  term (-42 : Rat) [(4, 1), (10, 2), (11, 1), (13, 1), (14, 2)],
  term (-42 : Rat) [(4, 1), (10, 2), (11, 1), (13, 1), (15, 2)],
  term (-84 : Rat) [(4, 2), (10, 2), (11, 1), (13, 1)],
  term (42 : Rat) [(4, 3), (10, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 249 for generator 5. -/
theorem rs_R009_ueqv_R009NYYNY_partial_05_0249_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_05_0249
        rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 =
      rs_R009_ueqv_R009NYYNY_partial_05_0249 := by
  native_decide

/-- Coefficient term 250 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYNY_coefficient_05_0250 : Poly :=
[
  term (-24 : Rat) [(4, 1), (10, 2), (11, 1), (15, 1)]
]

/-- Partial product 250 for generator 5. -/
def rs_R009_ueqv_R009NYYNY_partial_05_0250 : Poly :=
[
  term (-24 : Rat) [(4, 1), (5, 2), (10, 2), (11, 1), (15, 1)],
  term (-48 : Rat) [(4, 1), (10, 2), (11, 1), (14, 1), (15, 1)],
  term (24 : Rat) [(4, 1), (10, 2), (11, 1), (14, 2), (15, 1)],
  term (24 : Rat) [(4, 1), (10, 2), (11, 1), (15, 3)],
  term (48 : Rat) [(4, 2), (10, 2), (11, 1), (15, 1)],
  term (-24 : Rat) [(4, 3), (10, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 250 for generator 5. -/
theorem rs_R009_ueqv_R009NYYNY_partial_05_0250_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_05_0250
        rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 =
      rs_R009_ueqv_R009NYYNY_partial_05_0250 := by
  native_decide

/-- Coefficient term 251 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYNY_coefficient_05_0251 : Poly :=
[
  term (-36 : Rat) [(4, 1), (10, 2), (11, 2)]
]

/-- Partial product 251 for generator 5. -/
def rs_R009_ueqv_R009NYYNY_partial_05_0251 : Poly :=
[
  term (-36 : Rat) [(4, 1), (5, 2), (10, 2), (11, 2)],
  term (-72 : Rat) [(4, 1), (10, 2), (11, 2), (14, 1)],
  term (36 : Rat) [(4, 1), (10, 2), (11, 2), (14, 2)],
  term (36 : Rat) [(4, 1), (10, 2), (11, 2), (15, 2)],
  term (72 : Rat) [(4, 2), (10, 2), (11, 2)],
  term (-36 : Rat) [(4, 3), (10, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 251 for generator 5. -/
theorem rs_R009_ueqv_R009NYYNY_partial_05_0251_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_05_0251
        rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 =
      rs_R009_ueqv_R009NYYNY_partial_05_0251 := by
  native_decide

/-- Coefficient term 252 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYNY_coefficient_05_0252 : Poly :=
[
  term (12 : Rat) [(4, 1), (10, 2), (13, 1), (15, 1)]
]

/-- Partial product 252 for generator 5. -/
def rs_R009_ueqv_R009NYYNY_partial_05_0252 : Poly :=
[
  term (12 : Rat) [(4, 1), (5, 2), (10, 2), (13, 1), (15, 1)],
  term (24 : Rat) [(4, 1), (10, 2), (13, 1), (14, 1), (15, 1)],
  term (-12 : Rat) [(4, 1), (10, 2), (13, 1), (14, 2), (15, 1)],
  term (-12 : Rat) [(4, 1), (10, 2), (13, 1), (15, 3)],
  term (-24 : Rat) [(4, 2), (10, 2), (13, 1), (15, 1)],
  term (12 : Rat) [(4, 3), (10, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 252 for generator 5. -/
theorem rs_R009_ueqv_R009NYYNY_partial_05_0252_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_05_0252
        rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 =
      rs_R009_ueqv_R009NYYNY_partial_05_0252 := by
  native_decide

/-- Coefficient term 253 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYNY_coefficient_05_0253 : Poly :=
[
  term (-12 : Rat) [(4, 1), (10, 2), (13, 2)]
]

/-- Partial product 253 for generator 5. -/
def rs_R009_ueqv_R009NYYNY_partial_05_0253 : Poly :=
[
  term (-12 : Rat) [(4, 1), (5, 2), (10, 2), (13, 2)],
  term (-24 : Rat) [(4, 1), (10, 2), (13, 2), (14, 1)],
  term (12 : Rat) [(4, 1), (10, 2), (13, 2), (14, 2)],
  term (12 : Rat) [(4, 1), (10, 2), (13, 2), (15, 2)],
  term (24 : Rat) [(4, 2), (10, 2), (13, 2)],
  term (-12 : Rat) [(4, 3), (10, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 253 for generator 5. -/
theorem rs_R009_ueqv_R009NYYNY_partial_05_0253_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_05_0253
        rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 =
      rs_R009_ueqv_R009NYYNY_partial_05_0253 := by
  native_decide

/-- Coefficient term 254 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYNY_coefficient_05_0254 : Poly :=
[
  term (27 : Rat) [(4, 1), (11, 1), (13, 1)]
]

/-- Partial product 254 for generator 5. -/
def rs_R009_ueqv_R009NYYNY_partial_05_0254 : Poly :=
[
  term (27 : Rat) [(4, 1), (5, 2), (11, 1), (13, 1)],
  term (54 : Rat) [(4, 1), (11, 1), (13, 1), (14, 1)],
  term (-27 : Rat) [(4, 1), (11, 1), (13, 1), (14, 2)],
  term (-27 : Rat) [(4, 1), (11, 1), (13, 1), (15, 2)],
  term (-54 : Rat) [(4, 2), (11, 1), (13, 1)],
  term (27 : Rat) [(4, 3), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 254 for generator 5. -/
theorem rs_R009_ueqv_R009NYYNY_partial_05_0254_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_05_0254
        rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 =
      rs_R009_ueqv_R009NYYNY_partial_05_0254 := by
  native_decide

/-- Coefficient term 255 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYNY_coefficient_05_0255 : Poly :=
[
  term (40 : Rat) [(4, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 255 for generator 5. -/
def rs_R009_ueqv_R009NYYNY_partial_05_0255 : Poly :=
[
  term (40 : Rat) [(4, 1), (5, 2), (11, 1), (14, 1), (15, 1)],
  term (-40 : Rat) [(4, 1), (11, 1), (14, 1), (15, 3)],
  term (80 : Rat) [(4, 1), (11, 1), (14, 2), (15, 1)],
  term (-40 : Rat) [(4, 1), (11, 1), (14, 3), (15, 1)],
  term (-80 : Rat) [(4, 2), (11, 1), (14, 1), (15, 1)],
  term (40 : Rat) [(4, 3), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 255 for generator 5. -/
theorem rs_R009_ueqv_R009NYYNY_partial_05_0255_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_05_0255
        rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 =
      rs_R009_ueqv_R009NYYNY_partial_05_0255 := by
  native_decide

/-- Coefficient term 256 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYNY_coefficient_05_0256 : Poly :=
[
  term ((-89 : Rat) / 6) [(4, 1), (11, 1), (15, 1)]
]

/-- Partial product 256 for generator 5. -/
def rs_R009_ueqv_R009NYYNY_partial_05_0256 : Poly :=
[
  term ((-89 : Rat) / 6) [(4, 1), (5, 2), (11, 1), (15, 1)],
  term ((-89 : Rat) / 3) [(4, 1), (11, 1), (14, 1), (15, 1)],
  term ((89 : Rat) / 6) [(4, 1), (11, 1), (14, 2), (15, 1)],
  term ((89 : Rat) / 6) [(4, 1), (11, 1), (15, 3)],
  term ((89 : Rat) / 3) [(4, 2), (11, 1), (15, 1)],
  term ((-89 : Rat) / 6) [(4, 3), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 256 for generator 5. -/
theorem rs_R009_ueqv_R009NYYNY_partial_05_0256_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_05_0256
        rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 =
      rs_R009_ueqv_R009NYYNY_partial_05_0256 := by
  native_decide

/-- Coefficient term 257 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYNY_coefficient_05_0257 : Poly :=
[
  term ((-3 : Rat) / 4) [(4, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 257 for generator 5. -/
def rs_R009_ueqv_R009NYYNY_partial_05_0257 : Poly :=
[
  term ((-3 : Rat) / 4) [(4, 1), (5, 2), (11, 1), (15, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((3 : Rat) / 4) [(4, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((3 : Rat) / 4) [(4, 1), (11, 1), (15, 3), (16, 1)],
  term ((3 : Rat) / 2) [(4, 2), (11, 1), (15, 1), (16, 1)],
  term ((-3 : Rat) / 4) [(4, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 257 for generator 5. -/
theorem rs_R009_ueqv_R009NYYNY_partial_05_0257_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_05_0257
        rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 =
      rs_R009_ueqv_R009NYYNY_partial_05_0257 := by
  native_decide

/-- Coefficient term 258 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYNY_coefficient_05_0258 : Poly :=
[
  term (-42 : Rat) [(4, 1), (11, 2)]
]

/-- Partial product 258 for generator 5. -/
def rs_R009_ueqv_R009NYYNY_partial_05_0258 : Poly :=
[
  term (-42 : Rat) [(4, 1), (5, 2), (11, 2)],
  term (-84 : Rat) [(4, 1), (11, 2), (14, 1)],
  term (42 : Rat) [(4, 1), (11, 2), (14, 2)],
  term (42 : Rat) [(4, 1), (11, 2), (15, 2)],
  term (84 : Rat) [(4, 2), (11, 2)],
  term (-42 : Rat) [(4, 3), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 258 for generator 5. -/
theorem rs_R009_ueqv_R009NYYNY_partial_05_0258_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_05_0258
        rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 =
      rs_R009_ueqv_R009NYYNY_partial_05_0258 := by
  native_decide

/-- Coefficient term 259 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYNY_coefficient_05_0259 : Poly :=
[
  term ((-1 : Rat) / 12) [(4, 1), (13, 1), (15, 1)]
]

/-- Partial product 259 for generator 5. -/
def rs_R009_ueqv_R009NYYNY_partial_05_0259 : Poly :=
[
  term ((-1 : Rat) / 12) [(4, 1), (5, 2), (13, 1), (15, 1)],
  term ((-1 : Rat) / 6) [(4, 1), (13, 1), (14, 1), (15, 1)],
  term ((1 : Rat) / 12) [(4, 1), (13, 1), (14, 2), (15, 1)],
  term ((1 : Rat) / 12) [(4, 1), (13, 1), (15, 3)],
  term ((1 : Rat) / 6) [(4, 2), (13, 1), (15, 1)],
  term ((-1 : Rat) / 12) [(4, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 259 for generator 5. -/
theorem rs_R009_ueqv_R009NYYNY_partial_05_0259_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_05_0259
        rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 =
      rs_R009_ueqv_R009NYYNY_partial_05_0259 := by
  native_decide

/-- Coefficient term 260 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYNY_coefficient_05_0260 : Poly :=
[
  term ((-57 : Rat) / 8) [(4, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 260 for generator 5. -/
def rs_R009_ueqv_R009NYYNY_partial_05_0260 : Poly :=
[
  term ((-57 : Rat) / 8) [(4, 1), (5, 2), (13, 1), (15, 1), (16, 1)],
  term ((-57 : Rat) / 4) [(4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((57 : Rat) / 8) [(4, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((57 : Rat) / 8) [(4, 1), (13, 1), (15, 3), (16, 1)],
  term ((57 : Rat) / 4) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term ((-57 : Rat) / 8) [(4, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 260 for generator 5. -/
theorem rs_R009_ueqv_R009NYYNY_partial_05_0260_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_05_0260
        rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 =
      rs_R009_ueqv_R009NYYNY_partial_05_0260 := by
  native_decide

/-- Coefficient term 261 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYNY_coefficient_05_0261 : Poly :=
[
  term ((43 : Rat) / 3) [(4, 1), (13, 2)]
]

/-- Partial product 261 for generator 5. -/
def rs_R009_ueqv_R009NYYNY_partial_05_0261 : Poly :=
[
  term ((43 : Rat) / 3) [(4, 1), (5, 2), (13, 2)],
  term ((86 : Rat) / 3) [(4, 1), (13, 2), (14, 1)],
  term ((-43 : Rat) / 3) [(4, 1), (13, 2), (14, 2)],
  term ((-43 : Rat) / 3) [(4, 1), (13, 2), (15, 2)],
  term ((-86 : Rat) / 3) [(4, 2), (13, 2)],
  term ((43 : Rat) / 3) [(4, 3), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 261 for generator 5. -/
theorem rs_R009_ueqv_R009NYYNY_partial_05_0261_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_05_0261
        rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 =
      rs_R009_ueqv_R009NYYNY_partial_05_0261 := by
  native_decide

/-- Coefficient term 262 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYNY_coefficient_05_0262 : Poly :=
[
  term ((-16 : Rat) / 3) [(4, 1), (15, 2)]
]

/-- Partial product 262 for generator 5. -/
def rs_R009_ueqv_R009NYYNY_partial_05_0262 : Poly :=
[
  term ((-16 : Rat) / 3) [(4, 1), (5, 2), (15, 2)],
  term ((-32 : Rat) / 3) [(4, 1), (14, 1), (15, 2)],
  term ((16 : Rat) / 3) [(4, 1), (14, 2), (15, 2)],
  term ((16 : Rat) / 3) [(4, 1), (15, 4)],
  term ((32 : Rat) / 3) [(4, 2), (15, 2)],
  term ((-16 : Rat) / 3) [(4, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 262 for generator 5. -/
theorem rs_R009_ueqv_R009NYYNY_partial_05_0262_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_05_0262
        rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 =
      rs_R009_ueqv_R009NYYNY_partial_05_0262 := by
  native_decide

/-- Coefficient term 263 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYNY_coefficient_05_0263 : Poly :=
[
  term (183 : Rat) [(5, 1), (8, 1), (10, 1), (11, 1)]
]

/-- Partial product 263 for generator 5. -/
def rs_R009_ueqv_R009NYYNY_partial_05_0263 : Poly :=
[
  term (-366 : Rat) [(4, 1), (5, 1), (8, 1), (10, 1), (11, 1)],
  term (183 : Rat) [(4, 2), (5, 1), (8, 1), (10, 1), (11, 1)],
  term (366 : Rat) [(5, 1), (8, 1), (10, 1), (11, 1), (14, 1)],
  term (-183 : Rat) [(5, 1), (8, 1), (10, 1), (11, 1), (14, 2)],
  term (-183 : Rat) [(5, 1), (8, 1), (10, 1), (11, 1), (15, 2)],
  term (183 : Rat) [(5, 3), (8, 1), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 263 for generator 5. -/
theorem rs_R009_ueqv_R009NYYNY_partial_05_0263_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_05_0263
        rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 =
      rs_R009_ueqv_R009NYYNY_partial_05_0263 := by
  native_decide

/-- Coefficient term 264 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYNY_coefficient_05_0264 : Poly :=
[
  term (-105 : Rat) [(5, 1), (8, 1), (10, 1), (13, 1)]
]

/-- Partial product 264 for generator 5. -/
def rs_R009_ueqv_R009NYYNY_partial_05_0264 : Poly :=
[
  term (210 : Rat) [(4, 1), (5, 1), (8, 1), (10, 1), (13, 1)],
  term (-105 : Rat) [(4, 2), (5, 1), (8, 1), (10, 1), (13, 1)],
  term (-210 : Rat) [(5, 1), (8, 1), (10, 1), (13, 1), (14, 1)],
  term (105 : Rat) [(5, 1), (8, 1), (10, 1), (13, 1), (14, 2)],
  term (105 : Rat) [(5, 1), (8, 1), (10, 1), (13, 1), (15, 2)],
  term (-105 : Rat) [(5, 3), (8, 1), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 264 for generator 5. -/
theorem rs_R009_ueqv_R009NYYNY_partial_05_0264_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_05_0264
        rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 =
      rs_R009_ueqv_R009NYYNY_partial_05_0264 := by
  native_decide

/-- Coefficient term 265 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYNY_coefficient_05_0265 : Poly :=
[
  term (-160 : Rat) [(5, 1), (8, 1), (10, 1), (14, 1), (15, 1)]
]

/-- Partial product 265 for generator 5. -/
def rs_R009_ueqv_R009NYYNY_partial_05_0265 : Poly :=
[
  term (320 : Rat) [(4, 1), (5, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term (-160 : Rat) [(4, 2), (5, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term (160 : Rat) [(5, 1), (8, 1), (10, 1), (14, 1), (15, 3)],
  term (-320 : Rat) [(5, 1), (8, 1), (10, 1), (14, 2), (15, 1)],
  term (160 : Rat) [(5, 1), (8, 1), (10, 1), (14, 3), (15, 1)],
  term (-160 : Rat) [(5, 3), (8, 1), (10, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 265 for generator 5. -/
theorem rs_R009_ueqv_R009NYYNY_partial_05_0265_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_05_0265
        rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 =
      rs_R009_ueqv_R009NYYNY_partial_05_0265 := by
  native_decide

/-- Coefficient term 266 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYNY_coefficient_05_0266 : Poly :=
[
  term ((313 : Rat) / 3) [(5, 1), (8, 1), (10, 1), (15, 1)]
]

/-- Partial product 266 for generator 5. -/
def rs_R009_ueqv_R009NYYNY_partial_05_0266 : Poly :=
[
  term ((-626 : Rat) / 3) [(4, 1), (5, 1), (8, 1), (10, 1), (15, 1)],
  term ((313 : Rat) / 3) [(4, 2), (5, 1), (8, 1), (10, 1), (15, 1)],
  term ((626 : Rat) / 3) [(5, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((-313 : Rat) / 3) [(5, 1), (8, 1), (10, 1), (14, 2), (15, 1)],
  term ((-313 : Rat) / 3) [(5, 1), (8, 1), (10, 1), (15, 3)],
  term ((313 : Rat) / 3) [(5, 3), (8, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 266 for generator 5. -/
theorem rs_R009_ueqv_R009NYYNY_partial_05_0266_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_05_0266
        rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 =
      rs_R009_ueqv_R009NYYNY_partial_05_0266 := by
  native_decide

/-- Coefficient term 267 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYNY_coefficient_05_0267 : Poly :=
[
  term ((-15 : Rat) / 2) [(5, 1), (8, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 267 for generator 5. -/
def rs_R009_ueqv_R009NYYNY_partial_05_0267 : Poly :=
[
  term (15 : Rat) [(4, 1), (5, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-15 : Rat) / 2) [(4, 2), (5, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term (-15 : Rat) [(5, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((15 : Rat) / 2) [(5, 1), (8, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((15 : Rat) / 2) [(5, 1), (8, 1), (10, 1), (15, 3), (16, 1)],
  term ((-15 : Rat) / 2) [(5, 3), (8, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 267 for generator 5. -/
theorem rs_R009_ueqv_R009NYYNY_partial_05_0267_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_05_0267
        rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 =
      rs_R009_ueqv_R009NYYNY_partial_05_0267 := by
  native_decide

/-- Coefficient term 268 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYNY_coefficient_05_0268 : Poly :=
[
  term (-36 : Rat) [(5, 1), (8, 1), (10, 2), (11, 1)]
]

/-- Partial product 268 for generator 5. -/
def rs_R009_ueqv_R009NYYNY_partial_05_0268 : Poly :=
[
  term (72 : Rat) [(4, 1), (5, 1), (8, 1), (10, 2), (11, 1)],
  term (-36 : Rat) [(4, 2), (5, 1), (8, 1), (10, 2), (11, 1)],
  term (-72 : Rat) [(5, 1), (8, 1), (10, 2), (11, 1), (14, 1)],
  term (36 : Rat) [(5, 1), (8, 1), (10, 2), (11, 1), (14, 2)],
  term (36 : Rat) [(5, 1), (8, 1), (10, 2), (11, 1), (15, 2)],
  term (-36 : Rat) [(5, 3), (8, 1), (10, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 268 for generator 5. -/
theorem rs_R009_ueqv_R009NYYNY_partial_05_0268_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_05_0268
        rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 =
      rs_R009_ueqv_R009NYYNY_partial_05_0268 := by
  native_decide

/-- Coefficient term 269 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYNY_coefficient_05_0269 : Poly :=
[
  term (24 : Rat) [(5, 1), (8, 1), (10, 2), (13, 1)]
]

/-- Partial product 269 for generator 5. -/
def rs_R009_ueqv_R009NYYNY_partial_05_0269 : Poly :=
[
  term (-48 : Rat) [(4, 1), (5, 1), (8, 1), (10, 2), (13, 1)],
  term (24 : Rat) [(4, 2), (5, 1), (8, 1), (10, 2), (13, 1)],
  term (48 : Rat) [(5, 1), (8, 1), (10, 2), (13, 1), (14, 1)],
  term (-24 : Rat) [(5, 1), (8, 1), (10, 2), (13, 1), (14, 2)],
  term (-24 : Rat) [(5, 1), (8, 1), (10, 2), (13, 1), (15, 2)],
  term (24 : Rat) [(5, 3), (8, 1), (10, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 269 for generator 5. -/
theorem rs_R009_ueqv_R009NYYNY_partial_05_0269_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_05_0269
        rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 =
      rs_R009_ueqv_R009NYYNY_partial_05_0269 := by
  native_decide

/-- Coefficient term 270 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYNY_coefficient_05_0270 : Poly :=
[
  term (-24 : Rat) [(5, 1), (8, 1), (10, 2), (15, 1)]
]

/-- Partial product 270 for generator 5. -/
def rs_R009_ueqv_R009NYYNY_partial_05_0270 : Poly :=
[
  term (48 : Rat) [(4, 1), (5, 1), (8, 1), (10, 2), (15, 1)],
  term (-24 : Rat) [(4, 2), (5, 1), (8, 1), (10, 2), (15, 1)],
  term (-48 : Rat) [(5, 1), (8, 1), (10, 2), (14, 1), (15, 1)],
  term (24 : Rat) [(5, 1), (8, 1), (10, 2), (14, 2), (15, 1)],
  term (24 : Rat) [(5, 1), (8, 1), (10, 2), (15, 3)],
  term (-24 : Rat) [(5, 3), (8, 1), (10, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 270 for generator 5. -/
theorem rs_R009_ueqv_R009NYYNY_partial_05_0270_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_05_0270
        rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 =
      rs_R009_ueqv_R009NYYNY_partial_05_0270 := by
  native_decide

/-- Coefficient term 271 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYNY_coefficient_05_0271 : Poly :=
[
  term (-68 : Rat) [(5, 1), (8, 1), (11, 1)]
]

/-- Partial product 271 for generator 5. -/
def rs_R009_ueqv_R009NYYNY_partial_05_0271 : Poly :=
[
  term (136 : Rat) [(4, 1), (5, 1), (8, 1), (11, 1)],
  term (-68 : Rat) [(4, 2), (5, 1), (8, 1), (11, 1)],
  term (-136 : Rat) [(5, 1), (8, 1), (11, 1), (14, 1)],
  term (68 : Rat) [(5, 1), (8, 1), (11, 1), (14, 2)],
  term (68 : Rat) [(5, 1), (8, 1), (11, 1), (15, 2)],
  term (-68 : Rat) [(5, 3), (8, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 271 for generator 5. -/
theorem rs_R009_ueqv_R009NYYNY_partial_05_0271_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_05_0271
        rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 =
      rs_R009_ueqv_R009NYYNY_partial_05_0271 := by
  native_decide

/-- Coefficient term 272 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYNY_coefficient_05_0272 : Poly :=
[
  term (35 : Rat) [(5, 1), (8, 1), (13, 1)]
]

/-- Partial product 272 for generator 5. -/
def rs_R009_ueqv_R009NYYNY_partial_05_0272 : Poly :=
[
  term (-70 : Rat) [(4, 1), (5, 1), (8, 1), (13, 1)],
  term (35 : Rat) [(4, 2), (5, 1), (8, 1), (13, 1)],
  term (70 : Rat) [(5, 1), (8, 1), (13, 1), (14, 1)],
  term (-35 : Rat) [(5, 1), (8, 1), (13, 1), (14, 2)],
  term (-35 : Rat) [(5, 1), (8, 1), (13, 1), (15, 2)],
  term (35 : Rat) [(5, 3), (8, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 272 for generator 5. -/
theorem rs_R009_ueqv_R009NYYNY_partial_05_0272_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_05_0272
        rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 =
      rs_R009_ueqv_R009NYYNY_partial_05_0272 := by
  native_decide

/-- Coefficient term 273 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYNY_coefficient_05_0273 : Poly :=
[
  term ((224 : Rat) / 3) [(5, 1), (8, 1), (14, 1), (15, 1)]
]

/-- Partial product 273 for generator 5. -/
def rs_R009_ueqv_R009NYYNY_partial_05_0273 : Poly :=
[
  term ((-448 : Rat) / 3) [(4, 1), (5, 1), (8, 1), (14, 1), (15, 1)],
  term ((224 : Rat) / 3) [(4, 2), (5, 1), (8, 1), (14, 1), (15, 1)],
  term ((-224 : Rat) / 3) [(5, 1), (8, 1), (14, 1), (15, 3)],
  term ((448 : Rat) / 3) [(5, 1), (8, 1), (14, 2), (15, 1)],
  term ((-224 : Rat) / 3) [(5, 1), (8, 1), (14, 3), (15, 1)],
  term ((224 : Rat) / 3) [(5, 3), (8, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 273 for generator 5. -/
theorem rs_R009_ueqv_R009NYYNY_partial_05_0273_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_05_0273
        rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 =
      rs_R009_ueqv_R009NYYNY_partial_05_0273 := by
  native_decide

/-- Coefficient term 274 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYNY_coefficient_05_0274 : Poly :=
[
  term ((-191 : Rat) / 4) [(5, 1), (8, 1), (15, 1)]
]

/-- Partial product 274 for generator 5. -/
def rs_R009_ueqv_R009NYYNY_partial_05_0274 : Poly :=
[
  term ((191 : Rat) / 2) [(4, 1), (5, 1), (8, 1), (15, 1)],
  term ((-191 : Rat) / 4) [(4, 2), (5, 1), (8, 1), (15, 1)],
  term ((-191 : Rat) / 2) [(5, 1), (8, 1), (14, 1), (15, 1)],
  term ((191 : Rat) / 4) [(5, 1), (8, 1), (14, 2), (15, 1)],
  term ((191 : Rat) / 4) [(5, 1), (8, 1), (15, 3)],
  term ((-191 : Rat) / 4) [(5, 3), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 274 for generator 5. -/
theorem rs_R009_ueqv_R009NYYNY_partial_05_0274_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_05_0274
        rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 =
      rs_R009_ueqv_R009NYYNY_partial_05_0274 := by
  native_decide

/-- Coefficient term 275 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYNY_coefficient_05_0275 : Poly :=
[
  term ((57 : Rat) / 8) [(5, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 275 for generator 5. -/
def rs_R009_ueqv_R009NYYNY_partial_05_0275 : Poly :=
[
  term ((-57 : Rat) / 4) [(4, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((57 : Rat) / 8) [(4, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((57 : Rat) / 4) [(5, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-57 : Rat) / 8) [(5, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((-57 : Rat) / 8) [(5, 1), (8, 1), (15, 3), (16, 1)],
  term ((57 : Rat) / 8) [(5, 3), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 275 for generator 5. -/
theorem rs_R009_ueqv_R009NYYNY_partial_05_0275_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_05_0275
        rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 =
      rs_R009_ueqv_R009NYYNY_partial_05_0275 := by
  native_decide

/-- Coefficient term 276 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYNY_coefficient_05_0276 : Poly :=
[
  term ((2 : Rat) / 3) [(5, 1), (9, 1)]
]

/-- Partial product 276 for generator 5. -/
def rs_R009_ueqv_R009NYYNY_partial_05_0276 : Poly :=
[
  term ((-4 : Rat) / 3) [(4, 1), (5, 1), (9, 1)],
  term ((2 : Rat) / 3) [(4, 2), (5, 1), (9, 1)],
  term ((4 : Rat) / 3) [(5, 1), (9, 1), (14, 1)],
  term ((-2 : Rat) / 3) [(5, 1), (9, 1), (14, 2)],
  term ((-2 : Rat) / 3) [(5, 1), (9, 1), (15, 2)],
  term ((2 : Rat) / 3) [(5, 3), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 276 for generator 5. -/
theorem rs_R009_ueqv_R009NYYNY_partial_05_0276_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_05_0276
        rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 =
      rs_R009_ueqv_R009NYYNY_partial_05_0276 := by
  native_decide

/-- Coefficient term 277 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYNY_coefficient_05_0277 : Poly :=
[
  term ((255 : Rat) / 2) [(5, 1), (10, 1), (11, 1)]
]

/-- Partial product 277 for generator 5. -/
def rs_R009_ueqv_R009NYYNY_partial_05_0277 : Poly :=
[
  term (-255 : Rat) [(4, 1), (5, 1), (10, 1), (11, 1)],
  term ((255 : Rat) / 2) [(4, 2), (5, 1), (10, 1), (11, 1)],
  term (255 : Rat) [(5, 1), (10, 1), (11, 1), (14, 1)],
  term ((-255 : Rat) / 2) [(5, 1), (10, 1), (11, 1), (14, 2)],
  term ((-255 : Rat) / 2) [(5, 1), (10, 1), (11, 1), (15, 2)],
  term ((255 : Rat) / 2) [(5, 3), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 277 for generator 5. -/
theorem rs_R009_ueqv_R009NYYNY_partial_05_0277_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_05_0277
        rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 =
      rs_R009_ueqv_R009NYYNY_partial_05_0277 := by
  native_decide

/-- Coefficient term 278 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYNY_coefficient_05_0278 : Poly :=
[
  term ((-111 : Rat) / 2) [(5, 1), (10, 1), (13, 1)]
]

/-- Partial product 278 for generator 5. -/
def rs_R009_ueqv_R009NYYNY_partial_05_0278 : Poly :=
[
  term (111 : Rat) [(4, 1), (5, 1), (10, 1), (13, 1)],
  term ((-111 : Rat) / 2) [(4, 2), (5, 1), (10, 1), (13, 1)],
  term (-111 : Rat) [(5, 1), (10, 1), (13, 1), (14, 1)],
  term ((111 : Rat) / 2) [(5, 1), (10, 1), (13, 1), (14, 2)],
  term ((111 : Rat) / 2) [(5, 1), (10, 1), (13, 1), (15, 2)],
  term ((-111 : Rat) / 2) [(5, 3), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 278 for generator 5. -/
theorem rs_R009_ueqv_R009NYYNY_partial_05_0278_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_05_0278
        rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 =
      rs_R009_ueqv_R009NYYNY_partial_05_0278 := by
  native_decide

/-- Coefficient term 279 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYNY_coefficient_05_0279 : Poly :=
[
  term (-120 : Rat) [(5, 1), (10, 1), (14, 1), (15, 1)]
]

/-- Partial product 279 for generator 5. -/
def rs_R009_ueqv_R009NYYNY_partial_05_0279 : Poly :=
[
  term (240 : Rat) [(4, 1), (5, 1), (10, 1), (14, 1), (15, 1)],
  term (-120 : Rat) [(4, 2), (5, 1), (10, 1), (14, 1), (15, 1)],
  term (120 : Rat) [(5, 1), (10, 1), (14, 1), (15, 3)],
  term (-240 : Rat) [(5, 1), (10, 1), (14, 2), (15, 1)],
  term (120 : Rat) [(5, 1), (10, 1), (14, 3), (15, 1)],
  term (-120 : Rat) [(5, 3), (10, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 279 for generator 5. -/
theorem rs_R009_ueqv_R009NYYNY_partial_05_0279_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_05_0279
        rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 =
      rs_R009_ueqv_R009NYYNY_partial_05_0279 := by
  native_decide

/-- Coefficient term 280 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYNY_coefficient_05_0280 : Poly :=
[
  term ((991 : Rat) / 12) [(5, 1), (10, 1), (15, 1)]
]

/-- Partial product 280 for generator 5. -/
def rs_R009_ueqv_R009NYYNY_partial_05_0280 : Poly :=
[
  term ((-991 : Rat) / 6) [(4, 1), (5, 1), (10, 1), (15, 1)],
  term ((991 : Rat) / 12) [(4, 2), (5, 1), (10, 1), (15, 1)],
  term ((991 : Rat) / 6) [(5, 1), (10, 1), (14, 1), (15, 1)],
  term ((-991 : Rat) / 12) [(5, 1), (10, 1), (14, 2), (15, 1)],
  term ((-991 : Rat) / 12) [(5, 1), (10, 1), (15, 3)],
  term ((991 : Rat) / 12) [(5, 3), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 280 for generator 5. -/
theorem rs_R009_ueqv_R009NYYNY_partial_05_0280_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_05_0280
        rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 =
      rs_R009_ueqv_R009NYYNY_partial_05_0280 := by
  native_decide

/-- Coefficient term 281 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYNY_coefficient_05_0281 : Poly :=
[
  term ((-87 : Rat) / 8) [(5, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 281 for generator 5. -/
def rs_R009_ueqv_R009NYYNY_partial_05_0281 : Poly :=
[
  term ((87 : Rat) / 4) [(4, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-87 : Rat) / 8) [(4, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-87 : Rat) / 4) [(5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((87 : Rat) / 8) [(5, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((87 : Rat) / 8) [(5, 1), (10, 1), (15, 3), (16, 1)],
  term ((-87 : Rat) / 8) [(5, 3), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 281 for generator 5. -/
theorem rs_R009_ueqv_R009NYYNY_partial_05_0281_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_05_0281
        rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 =
      rs_R009_ueqv_R009NYYNY_partial_05_0281 := by
  native_decide

/-- Coefficient term 282 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYNY_coefficient_05_0282 : Poly :=
[
  term (-195 : Rat) [(5, 1), (10, 2), (11, 1)]
]

/-- Partial product 282 for generator 5. -/
def rs_R009_ueqv_R009NYYNY_partial_05_0282 : Poly :=
[
  term (390 : Rat) [(4, 1), (5, 1), (10, 2), (11, 1)],
  term (-195 : Rat) [(4, 2), (5, 1), (10, 2), (11, 1)],
  term (-390 : Rat) [(5, 1), (10, 2), (11, 1), (14, 1)],
  term (195 : Rat) [(5, 1), (10, 2), (11, 1), (14, 2)],
  term (195 : Rat) [(5, 1), (10, 2), (11, 1), (15, 2)],
  term (-195 : Rat) [(5, 3), (10, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 282 for generator 5. -/
theorem rs_R009_ueqv_R009NYYNY_partial_05_0282_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_05_0282
        rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 =
      rs_R009_ueqv_R009NYYNY_partial_05_0282 := by
  native_decide

/-- Coefficient term 283 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYNY_coefficient_05_0283 : Poly :=
[
  term (111 : Rat) [(5, 1), (10, 2), (13, 1)]
]

/-- Partial product 283 for generator 5. -/
def rs_R009_ueqv_R009NYYNY_partial_05_0283 : Poly :=
[
  term (-222 : Rat) [(4, 1), (5, 1), (10, 2), (13, 1)],
  term (111 : Rat) [(4, 2), (5, 1), (10, 2), (13, 1)],
  term (222 : Rat) [(5, 1), (10, 2), (13, 1), (14, 1)],
  term (-111 : Rat) [(5, 1), (10, 2), (13, 1), (14, 2)],
  term (-111 : Rat) [(5, 1), (10, 2), (13, 1), (15, 2)],
  term (111 : Rat) [(5, 3), (10, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 283 for generator 5. -/
theorem rs_R009_ueqv_R009NYYNY_partial_05_0283_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_05_0283
        rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 =
      rs_R009_ueqv_R009NYYNY_partial_05_0283 := by
  native_decide

/-- Coefficient term 284 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYNY_coefficient_05_0284 : Poly :=
[
  term (160 : Rat) [(5, 1), (10, 2), (14, 1), (15, 1)]
]

/-- Partial product 284 for generator 5. -/
def rs_R009_ueqv_R009NYYNY_partial_05_0284 : Poly :=
[
  term (-320 : Rat) [(4, 1), (5, 1), (10, 2), (14, 1), (15, 1)],
  term (160 : Rat) [(4, 2), (5, 1), (10, 2), (14, 1), (15, 1)],
  term (-160 : Rat) [(5, 1), (10, 2), (14, 1), (15, 3)],
  term (320 : Rat) [(5, 1), (10, 2), (14, 2), (15, 1)],
  term (-160 : Rat) [(5, 1), (10, 2), (14, 3), (15, 1)],
  term (160 : Rat) [(5, 3), (10, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 284 for generator 5. -/
theorem rs_R009_ueqv_R009NYYNY_partial_05_0284_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_05_0284
        rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 =
      rs_R009_ueqv_R009NYYNY_partial_05_0284 := by
  native_decide

/-- Coefficient term 285 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYNY_coefficient_05_0285 : Poly :=
[
  term ((-349 : Rat) / 3) [(5, 1), (10, 2), (15, 1)]
]

/-- Partial product 285 for generator 5. -/
def rs_R009_ueqv_R009NYYNY_partial_05_0285 : Poly :=
[
  term ((698 : Rat) / 3) [(4, 1), (5, 1), (10, 2), (15, 1)],
  term ((-349 : Rat) / 3) [(4, 2), (5, 1), (10, 2), (15, 1)],
  term ((-698 : Rat) / 3) [(5, 1), (10, 2), (14, 1), (15, 1)],
  term ((349 : Rat) / 3) [(5, 1), (10, 2), (14, 2), (15, 1)],
  term ((349 : Rat) / 3) [(5, 1), (10, 2), (15, 3)],
  term ((-349 : Rat) / 3) [(5, 3), (10, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 285 for generator 5. -/
theorem rs_R009_ueqv_R009NYYNY_partial_05_0285_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_05_0285
        rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 =
      rs_R009_ueqv_R009NYYNY_partial_05_0285 := by
  native_decide

/-- Coefficient term 286 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYNY_coefficient_05_0286 : Poly :=
[
  term ((15 : Rat) / 2) [(5, 1), (10, 2), (15, 1), (16, 1)]
]

/-- Partial product 286 for generator 5. -/
def rs_R009_ueqv_R009NYYNY_partial_05_0286 : Poly :=
[
  term (-15 : Rat) [(4, 1), (5, 1), (10, 2), (15, 1), (16, 1)],
  term ((15 : Rat) / 2) [(4, 2), (5, 1), (10, 2), (15, 1), (16, 1)],
  term (15 : Rat) [(5, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-15 : Rat) / 2) [(5, 1), (10, 2), (14, 2), (15, 1), (16, 1)],
  term ((-15 : Rat) / 2) [(5, 1), (10, 2), (15, 3), (16, 1)],
  term ((15 : Rat) / 2) [(5, 3), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 286 for generator 5. -/
theorem rs_R009_ueqv_R009NYYNY_partial_05_0286_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_05_0286
        rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 =
      rs_R009_ueqv_R009NYYNY_partial_05_0286 := by
  native_decide

/-- Coefficient term 287 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYNY_coefficient_05_0287 : Poly :=
[
  term (36 : Rat) [(5, 1), (10, 3), (11, 1)]
]

/-- Partial product 287 for generator 5. -/
def rs_R009_ueqv_R009NYYNY_partial_05_0287 : Poly :=
[
  term (-72 : Rat) [(4, 1), (5, 1), (10, 3), (11, 1)],
  term (36 : Rat) [(4, 2), (5, 1), (10, 3), (11, 1)],
  term (72 : Rat) [(5, 1), (10, 3), (11, 1), (14, 1)],
  term (-36 : Rat) [(5, 1), (10, 3), (11, 1), (14, 2)],
  term (-36 : Rat) [(5, 1), (10, 3), (11, 1), (15, 2)],
  term (36 : Rat) [(5, 3), (10, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 287 for generator 5. -/
theorem rs_R009_ueqv_R009NYYNY_partial_05_0287_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_05_0287
        rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 =
      rs_R009_ueqv_R009NYYNY_partial_05_0287 := by
  native_decide

/-- Coefficient term 288 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYNY_coefficient_05_0288 : Poly :=
[
  term (-24 : Rat) [(5, 1), (10, 3), (13, 1)]
]

/-- Partial product 288 for generator 5. -/
def rs_R009_ueqv_R009NYYNY_partial_05_0288 : Poly :=
[
  term (48 : Rat) [(4, 1), (5, 1), (10, 3), (13, 1)],
  term (-24 : Rat) [(4, 2), (5, 1), (10, 3), (13, 1)],
  term (-48 : Rat) [(5, 1), (10, 3), (13, 1), (14, 1)],
  term (24 : Rat) [(5, 1), (10, 3), (13, 1), (14, 2)],
  term (24 : Rat) [(5, 1), (10, 3), (13, 1), (15, 2)],
  term (-24 : Rat) [(5, 3), (10, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 288 for generator 5. -/
theorem rs_R009_ueqv_R009NYYNY_partial_05_0288_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_05_0288
        rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 =
      rs_R009_ueqv_R009NYYNY_partial_05_0288 := by
  native_decide

/-- Coefficient term 289 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYNY_coefficient_05_0289 : Poly :=
[
  term (24 : Rat) [(5, 1), (10, 3), (15, 1)]
]

/-- Partial product 289 for generator 5. -/
def rs_R009_ueqv_R009NYYNY_partial_05_0289 : Poly :=
[
  term (-48 : Rat) [(4, 1), (5, 1), (10, 3), (15, 1)],
  term (24 : Rat) [(4, 2), (5, 1), (10, 3), (15, 1)],
  term (48 : Rat) [(5, 1), (10, 3), (14, 1), (15, 1)],
  term (-24 : Rat) [(5, 1), (10, 3), (14, 2), (15, 1)],
  term (-24 : Rat) [(5, 1), (10, 3), (15, 3)],
  term (24 : Rat) [(5, 3), (10, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 289 for generator 5. -/
theorem rs_R009_ueqv_R009NYYNY_partial_05_0289_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_05_0289
        rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 =
      rs_R009_ueqv_R009NYYNY_partial_05_0289 := by
  native_decide

/-- Coefficient term 290 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYNY_coefficient_05_0290 : Poly :=
[
  term (-8 : Rat) [(5, 1), (11, 1)]
]

/-- Partial product 290 for generator 5. -/
def rs_R009_ueqv_R009NYYNY_partial_05_0290 : Poly :=
[
  term (16 : Rat) [(4, 1), (5, 1), (11, 1)],
  term (-8 : Rat) [(4, 2), (5, 1), (11, 1)],
  term (-16 : Rat) [(5, 1), (11, 1), (14, 1)],
  term (8 : Rat) [(5, 1), (11, 1), (14, 2)],
  term (8 : Rat) [(5, 1), (11, 1), (15, 2)],
  term (-8 : Rat) [(5, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 290 for generator 5. -/
theorem rs_R009_ueqv_R009NYYNY_partial_05_0290_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_05_0290
        rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 =
      rs_R009_ueqv_R009NYYNY_partial_05_0290 := by
  native_decide

/-- Coefficient term 291 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYNY_coefficient_05_0291 : Poly :=
[
  term ((-17 : Rat) / 2) [(5, 1), (13, 1)]
]

/-- Partial product 291 for generator 5. -/
def rs_R009_ueqv_R009NYYNY_partial_05_0291 : Poly :=
[
  term (17 : Rat) [(4, 1), (5, 1), (13, 1)],
  term ((-17 : Rat) / 2) [(4, 2), (5, 1), (13, 1)],
  term (-17 : Rat) [(5, 1), (13, 1), (14, 1)],
  term ((17 : Rat) / 2) [(5, 1), (13, 1), (14, 2)],
  term ((17 : Rat) / 2) [(5, 1), (13, 1), (15, 2)],
  term ((-17 : Rat) / 2) [(5, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 291 for generator 5. -/
theorem rs_R009_ueqv_R009NYYNY_partial_05_0291_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_05_0291
        rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 =
      rs_R009_ueqv_R009NYYNY_partial_05_0291 := by
  native_decide

/-- Coefficient term 292 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYNY_coefficient_05_0292 : Poly :=
[
  term ((8 : Rat) / 3) [(5, 1), (14, 1), (15, 1)]
]

/-- Partial product 292 for generator 5. -/
def rs_R009_ueqv_R009NYYNY_partial_05_0292 : Poly :=
[
  term ((-16 : Rat) / 3) [(4, 1), (5, 1), (14, 1), (15, 1)],
  term ((8 : Rat) / 3) [(4, 2), (5, 1), (14, 1), (15, 1)],
  term ((-8 : Rat) / 3) [(5, 1), (14, 1), (15, 3)],
  term ((16 : Rat) / 3) [(5, 1), (14, 2), (15, 1)],
  term ((-8 : Rat) / 3) [(5, 1), (14, 3), (15, 1)],
  term ((8 : Rat) / 3) [(5, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 292 for generator 5. -/
theorem rs_R009_ueqv_R009NYYNY_partial_05_0292_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_05_0292
        rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 =
      rs_R009_ueqv_R009NYYNY_partial_05_0292 := by
  native_decide

/-- Coefficient term 293 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYNY_coefficient_05_0293 : Poly :=
[
  term ((19 : Rat) / 24) [(5, 1), (15, 1)]
]

/-- Partial product 293 for generator 5. -/
def rs_R009_ueqv_R009NYYNY_partial_05_0293 : Poly :=
[
  term ((-19 : Rat) / 12) [(4, 1), (5, 1), (15, 1)],
  term ((19 : Rat) / 24) [(4, 2), (5, 1), (15, 1)],
  term ((19 : Rat) / 12) [(5, 1), (14, 1), (15, 1)],
  term ((-19 : Rat) / 24) [(5, 1), (14, 2), (15, 1)],
  term ((-19 : Rat) / 24) [(5, 1), (15, 3)],
  term ((19 : Rat) / 24) [(5, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 293 for generator 5. -/
theorem rs_R009_ueqv_R009NYYNY_partial_05_0293_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_05_0293
        rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 =
      rs_R009_ueqv_R009NYYNY_partial_05_0293 := by
  native_decide

/-- Coefficient term 294 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYNY_coefficient_05_0294 : Poly :=
[
  term ((57 : Rat) / 16) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 294 for generator 5. -/
def rs_R009_ueqv_R009NYYNY_partial_05_0294 : Poly :=
[
  term ((-57 : Rat) / 8) [(4, 1), (5, 1), (15, 1), (16, 1)],
  term ((57 : Rat) / 16) [(4, 2), (5, 1), (15, 1), (16, 1)],
  term ((57 : Rat) / 8) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-57 : Rat) / 16) [(5, 1), (14, 2), (15, 1), (16, 1)],
  term ((-57 : Rat) / 16) [(5, 1), (15, 3), (16, 1)],
  term ((57 : Rat) / 16) [(5, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 294 for generator 5. -/
theorem rs_R009_ueqv_R009NYYNY_partial_05_0294_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_05_0294
        rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 =
      rs_R009_ueqv_R009NYYNY_partial_05_0294 := by
  native_decide

/-- Coefficient term 295 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYNY_coefficient_05_0295 : Poly :=
[
  term (-6 : Rat) [(7, 1), (8, 1), (10, 1), (15, 1)]
]

/-- Partial product 295 for generator 5. -/
def rs_R009_ueqv_R009NYYNY_partial_05_0295 : Poly :=
[
  term (12 : Rat) [(4, 1), (7, 1), (8, 1), (10, 1), (15, 1)],
  term (-6 : Rat) [(4, 2), (7, 1), (8, 1), (10, 1), (15, 1)],
  term (-6 : Rat) [(5, 2), (7, 1), (8, 1), (10, 1), (15, 1)],
  term (-12 : Rat) [(7, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term (6 : Rat) [(7, 1), (8, 1), (10, 1), (14, 2), (15, 1)],
  term (6 : Rat) [(7, 1), (8, 1), (10, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 295 for generator 5. -/
theorem rs_R009_ueqv_R009NYYNY_partial_05_0295_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_05_0295
        rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 =
      rs_R009_ueqv_R009NYYNY_partial_05_0295 := by
  native_decide

/-- Coefficient term 296 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYNY_coefficient_05_0296 : Poly :=
[
  term (3 : Rat) [(7, 1), (8, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 296 for generator 5. -/
def rs_R009_ueqv_R009NYYNY_partial_05_0296 : Poly :=
[
  term (-6 : Rat) [(4, 1), (7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(4, 2), (7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(5, 2), (7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(7, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(7, 1), (8, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term (-3 : Rat) [(7, 1), (8, 1), (10, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 296 for generator 5. -/
theorem rs_R009_ueqv_R009NYYNY_partial_05_0296_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_05_0296
        rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 =
      rs_R009_ueqv_R009NYYNY_partial_05_0296 := by
  native_decide

/-- Coefficient term 297 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYNY_coefficient_05_0297 : Poly :=
[
  term (-8 : Rat) [(7, 1), (8, 1), (14, 1), (15, 1)]
]

/-- Partial product 297 for generator 5. -/
def rs_R009_ueqv_R009NYYNY_partial_05_0297 : Poly :=
[
  term (16 : Rat) [(4, 1), (7, 1), (8, 1), (14, 1), (15, 1)],
  term (-8 : Rat) [(4, 2), (7, 1), (8, 1), (14, 1), (15, 1)],
  term (-8 : Rat) [(5, 2), (7, 1), (8, 1), (14, 1), (15, 1)],
  term (8 : Rat) [(7, 1), (8, 1), (14, 1), (15, 3)],
  term (-16 : Rat) [(7, 1), (8, 1), (14, 2), (15, 1)],
  term (8 : Rat) [(7, 1), (8, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 297 for generator 5. -/
theorem rs_R009_ueqv_R009NYYNY_partial_05_0297_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_05_0297
        rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 =
      rs_R009_ueqv_R009NYYNY_partial_05_0297 := by
  native_decide

/-- Coefficient term 298 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYNY_coefficient_05_0298 : Poly :=
[
  term ((27 : Rat) / 2) [(7, 1), (8, 1), (15, 1)]
]

/-- Partial product 298 for generator 5. -/
def rs_R009_ueqv_R009NYYNY_partial_05_0298 : Poly :=
[
  term (-27 : Rat) [(4, 1), (7, 1), (8, 1), (15, 1)],
  term ((27 : Rat) / 2) [(4, 2), (7, 1), (8, 1), (15, 1)],
  term ((27 : Rat) / 2) [(5, 2), (7, 1), (8, 1), (15, 1)],
  term (27 : Rat) [(7, 1), (8, 1), (14, 1), (15, 1)],
  term ((-27 : Rat) / 2) [(7, 1), (8, 1), (14, 2), (15, 1)],
  term ((-27 : Rat) / 2) [(7, 1), (8, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 298 for generator 5. -/
theorem rs_R009_ueqv_R009NYYNY_partial_05_0298_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_05_0298
        rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 =
      rs_R009_ueqv_R009NYYNY_partial_05_0298 := by
  native_decide

/-- Coefficient term 299 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NYYNY_coefficient_05_0299 : Poly :=
[
  term ((-19 : Rat) / 4) [(7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 299 for generator 5. -/
def rs_R009_ueqv_R009NYYNY_partial_05_0299 : Poly :=
[
  term ((19 : Rat) / 2) [(4, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-19 : Rat) / 4) [(4, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-19 : Rat) / 4) [(5, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-19 : Rat) / 2) [(7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((19 : Rat) / 4) [(7, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((19 : Rat) / 4) [(7, 1), (8, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 299 for generator 5. -/
theorem rs_R009_ueqv_R009NYYNY_partial_05_0299_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_05_0299
        rs_R009_ueqv_R009NYYNY_generator_05_0200_0299 =
      rs_R009_ueqv_R009NYYNY_partial_05_0299 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NYYNY_partials_05_0200_0299 : List Poly :=
[
  rs_R009_ueqv_R009NYYNY_partial_05_0200,
  rs_R009_ueqv_R009NYYNY_partial_05_0201,
  rs_R009_ueqv_R009NYYNY_partial_05_0202,
  rs_R009_ueqv_R009NYYNY_partial_05_0203,
  rs_R009_ueqv_R009NYYNY_partial_05_0204,
  rs_R009_ueqv_R009NYYNY_partial_05_0205,
  rs_R009_ueqv_R009NYYNY_partial_05_0206,
  rs_R009_ueqv_R009NYYNY_partial_05_0207,
  rs_R009_ueqv_R009NYYNY_partial_05_0208,
  rs_R009_ueqv_R009NYYNY_partial_05_0209,
  rs_R009_ueqv_R009NYYNY_partial_05_0210,
  rs_R009_ueqv_R009NYYNY_partial_05_0211,
  rs_R009_ueqv_R009NYYNY_partial_05_0212,
  rs_R009_ueqv_R009NYYNY_partial_05_0213,
  rs_R009_ueqv_R009NYYNY_partial_05_0214,
  rs_R009_ueqv_R009NYYNY_partial_05_0215,
  rs_R009_ueqv_R009NYYNY_partial_05_0216,
  rs_R009_ueqv_R009NYYNY_partial_05_0217,
  rs_R009_ueqv_R009NYYNY_partial_05_0218,
  rs_R009_ueqv_R009NYYNY_partial_05_0219,
  rs_R009_ueqv_R009NYYNY_partial_05_0220,
  rs_R009_ueqv_R009NYYNY_partial_05_0221,
  rs_R009_ueqv_R009NYYNY_partial_05_0222,
  rs_R009_ueqv_R009NYYNY_partial_05_0223,
  rs_R009_ueqv_R009NYYNY_partial_05_0224,
  rs_R009_ueqv_R009NYYNY_partial_05_0225,
  rs_R009_ueqv_R009NYYNY_partial_05_0226,
  rs_R009_ueqv_R009NYYNY_partial_05_0227,
  rs_R009_ueqv_R009NYYNY_partial_05_0228,
  rs_R009_ueqv_R009NYYNY_partial_05_0229,
  rs_R009_ueqv_R009NYYNY_partial_05_0230,
  rs_R009_ueqv_R009NYYNY_partial_05_0231,
  rs_R009_ueqv_R009NYYNY_partial_05_0232,
  rs_R009_ueqv_R009NYYNY_partial_05_0233,
  rs_R009_ueqv_R009NYYNY_partial_05_0234,
  rs_R009_ueqv_R009NYYNY_partial_05_0235,
  rs_R009_ueqv_R009NYYNY_partial_05_0236,
  rs_R009_ueqv_R009NYYNY_partial_05_0237,
  rs_R009_ueqv_R009NYYNY_partial_05_0238,
  rs_R009_ueqv_R009NYYNY_partial_05_0239,
  rs_R009_ueqv_R009NYYNY_partial_05_0240,
  rs_R009_ueqv_R009NYYNY_partial_05_0241,
  rs_R009_ueqv_R009NYYNY_partial_05_0242,
  rs_R009_ueqv_R009NYYNY_partial_05_0243,
  rs_R009_ueqv_R009NYYNY_partial_05_0244,
  rs_R009_ueqv_R009NYYNY_partial_05_0245,
  rs_R009_ueqv_R009NYYNY_partial_05_0246,
  rs_R009_ueqv_R009NYYNY_partial_05_0247,
  rs_R009_ueqv_R009NYYNY_partial_05_0248,
  rs_R009_ueqv_R009NYYNY_partial_05_0249,
  rs_R009_ueqv_R009NYYNY_partial_05_0250,
  rs_R009_ueqv_R009NYYNY_partial_05_0251,
  rs_R009_ueqv_R009NYYNY_partial_05_0252,
  rs_R009_ueqv_R009NYYNY_partial_05_0253,
  rs_R009_ueqv_R009NYYNY_partial_05_0254,
  rs_R009_ueqv_R009NYYNY_partial_05_0255,
  rs_R009_ueqv_R009NYYNY_partial_05_0256,
  rs_R009_ueqv_R009NYYNY_partial_05_0257,
  rs_R009_ueqv_R009NYYNY_partial_05_0258,
  rs_R009_ueqv_R009NYYNY_partial_05_0259,
  rs_R009_ueqv_R009NYYNY_partial_05_0260,
  rs_R009_ueqv_R009NYYNY_partial_05_0261,
  rs_R009_ueqv_R009NYYNY_partial_05_0262,
  rs_R009_ueqv_R009NYYNY_partial_05_0263,
  rs_R009_ueqv_R009NYYNY_partial_05_0264,
  rs_R009_ueqv_R009NYYNY_partial_05_0265,
  rs_R009_ueqv_R009NYYNY_partial_05_0266,
  rs_R009_ueqv_R009NYYNY_partial_05_0267,
  rs_R009_ueqv_R009NYYNY_partial_05_0268,
  rs_R009_ueqv_R009NYYNY_partial_05_0269,
  rs_R009_ueqv_R009NYYNY_partial_05_0270,
  rs_R009_ueqv_R009NYYNY_partial_05_0271,
  rs_R009_ueqv_R009NYYNY_partial_05_0272,
  rs_R009_ueqv_R009NYYNY_partial_05_0273,
  rs_R009_ueqv_R009NYYNY_partial_05_0274,
  rs_R009_ueqv_R009NYYNY_partial_05_0275,
  rs_R009_ueqv_R009NYYNY_partial_05_0276,
  rs_R009_ueqv_R009NYYNY_partial_05_0277,
  rs_R009_ueqv_R009NYYNY_partial_05_0278,
  rs_R009_ueqv_R009NYYNY_partial_05_0279,
  rs_R009_ueqv_R009NYYNY_partial_05_0280,
  rs_R009_ueqv_R009NYYNY_partial_05_0281,
  rs_R009_ueqv_R009NYYNY_partial_05_0282,
  rs_R009_ueqv_R009NYYNY_partial_05_0283,
  rs_R009_ueqv_R009NYYNY_partial_05_0284,
  rs_R009_ueqv_R009NYYNY_partial_05_0285,
  rs_R009_ueqv_R009NYYNY_partial_05_0286,
  rs_R009_ueqv_R009NYYNY_partial_05_0287,
  rs_R009_ueqv_R009NYYNY_partial_05_0288,
  rs_R009_ueqv_R009NYYNY_partial_05_0289,
  rs_R009_ueqv_R009NYYNY_partial_05_0290,
  rs_R009_ueqv_R009NYYNY_partial_05_0291,
  rs_R009_ueqv_R009NYYNY_partial_05_0292,
  rs_R009_ueqv_R009NYYNY_partial_05_0293,
  rs_R009_ueqv_R009NYYNY_partial_05_0294,
  rs_R009_ueqv_R009NYYNY_partial_05_0295,
  rs_R009_ueqv_R009NYYNY_partial_05_0296,
  rs_R009_ueqv_R009NYYNY_partial_05_0297,
  rs_R009_ueqv_R009NYYNY_partial_05_0298,
  rs_R009_ueqv_R009NYYNY_partial_05_0299
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NYYNY_block_05_0200_0299 : Poly :=
[
  term (14 : Rat) [(3, 1), (4, 1), (9, 1), (14, 1)],
  term ((-40 : Rat) / 3) [(3, 1), (4, 1), (10, 1), (11, 1)],
  term (48 : Rat) [(3, 1), (4, 1), (10, 1), (11, 1), (14, 1)],
  term (-8 : Rat) [(3, 1), (4, 1), (10, 1), (13, 1)],
  term (48 : Rat) [(3, 1), (4, 1), (10, 1), (13, 1), (14, 1)],
  term ((80 : Rat) / 3) [(3, 1), (4, 1), (10, 2), (13, 1)],
  term (-96 : Rat) [(3, 1), (4, 1), (10, 2), (13, 1), (14, 1)],
  term (4 : Rat) [(3, 1), (4, 1), (11, 1)],
  term (-24 : Rat) [(3, 1), (4, 1), (11, 1), (14, 1)],
  term ((20 : Rat) / 3) [(3, 1), (4, 1), (13, 1)],
  term (-20 : Rat) [(3, 1), (4, 1), (13, 1), (14, 1)],
  term ((-25 : Rat) / 3) [(3, 1), (4, 1), (15, 1)],
  term (-7 : Rat) [(3, 1), (4, 2), (9, 1), (14, 1)],
  term ((20 : Rat) / 3) [(3, 1), (4, 2), (10, 1), (11, 1)],
  term (-24 : Rat) [(3, 1), (4, 2), (10, 1), (11, 1), (14, 1)],
  term (4 : Rat) [(3, 1), (4, 2), (10, 1), (13, 1)],
  term (-24 : Rat) [(3, 1), (4, 2), (10, 1), (13, 1), (14, 1)],
  term ((-40 : Rat) / 3) [(3, 1), (4, 2), (10, 2), (13, 1)],
  term (48 : Rat) [(3, 1), (4, 2), (10, 2), (13, 1), (14, 1)],
  term (-2 : Rat) [(3, 1), (4, 2), (11, 1)],
  term (12 : Rat) [(3, 1), (4, 2), (11, 1), (14, 1)],
  term ((-10 : Rat) / 3) [(3, 1), (4, 2), (13, 1)],
  term (10 : Rat) [(3, 1), (4, 2), (13, 1), (14, 1)],
  term ((25 : Rat) / 6) [(3, 1), (4, 2), (15, 1)],
  term (-7 : Rat) [(3, 1), (5, 2), (9, 1), (14, 1)],
  term ((20 : Rat) / 3) [(3, 1), (5, 2), (10, 1), (11, 1)],
  term (-24 : Rat) [(3, 1), (5, 2), (10, 1), (11, 1), (14, 1)],
  term (4 : Rat) [(3, 1), (5, 2), (10, 1), (13, 1)],
  term (-24 : Rat) [(3, 1), (5, 2), (10, 1), (13, 1), (14, 1)],
  term ((-40 : Rat) / 3) [(3, 1), (5, 2), (10, 2), (13, 1)],
  term (48 : Rat) [(3, 1), (5, 2), (10, 2), (13, 1), (14, 1)],
  term (-2 : Rat) [(3, 1), (5, 2), (11, 1)],
  term (12 : Rat) [(3, 1), (5, 2), (11, 1), (14, 1)],
  term ((-10 : Rat) / 3) [(3, 1), (5, 2), (13, 1)],
  term (10 : Rat) [(3, 1), (5, 2), (13, 1), (14, 1)],
  term ((25 : Rat) / 6) [(3, 1), (5, 2), (15, 1)],
  term (7 : Rat) [(3, 1), (9, 1), (14, 1), (15, 2)],
  term (-14 : Rat) [(3, 1), (9, 1), (14, 2)],
  term (7 : Rat) [(3, 1), (9, 1), (14, 3)],
  term ((40 : Rat) / 3) [(3, 1), (10, 1), (11, 1), (14, 1)],
  term (24 : Rat) [(3, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((-164 : Rat) / 3) [(3, 1), (10, 1), (11, 1), (14, 2)],
  term (24 : Rat) [(3, 1), (10, 1), (11, 1), (14, 3)],
  term ((-20 : Rat) / 3) [(3, 1), (10, 1), (11, 1), (15, 2)],
  term (8 : Rat) [(3, 1), (10, 1), (13, 1), (14, 1)],
  term (24 : Rat) [(3, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term (-52 : Rat) [(3, 1), (10, 1), (13, 1), (14, 2)],
  term (24 : Rat) [(3, 1), (10, 1), (13, 1), (14, 3)],
  term (-4 : Rat) [(3, 1), (10, 1), (13, 1), (15, 2)],
  term ((-80 : Rat) / 3) [(3, 1), (10, 2), (13, 1), (14, 1)],
  term (-48 : Rat) [(3, 1), (10, 2), (13, 1), (14, 1), (15, 2)],
  term ((328 : Rat) / 3) [(3, 1), (10, 2), (13, 1), (14, 2)],
  term (-48 : Rat) [(3, 1), (10, 2), (13, 1), (14, 3)],
  term ((40 : Rat) / 3) [(3, 1), (10, 2), (13, 1), (15, 2)],
  term (-4 : Rat) [(3, 1), (11, 1), (14, 1)],
  term (-12 : Rat) [(3, 1), (11, 1), (14, 1), (15, 2)],
  term (26 : Rat) [(3, 1), (11, 1), (14, 2)],
  term (-12 : Rat) [(3, 1), (11, 1), (14, 3)],
  term (2 : Rat) [(3, 1), (11, 1), (15, 2)],
  term ((-20 : Rat) / 3) [(3, 1), (13, 1), (14, 1)],
  term (-10 : Rat) [(3, 1), (13, 1), (14, 1), (15, 2)],
  term ((70 : Rat) / 3) [(3, 1), (13, 1), (14, 2)],
  term (-10 : Rat) [(3, 1), (13, 1), (14, 3)],
  term ((10 : Rat) / 3) [(3, 1), (13, 1), (15, 2)],
  term ((25 : Rat) / 3) [(3, 1), (14, 1), (15, 1)],
  term ((-25 : Rat) / 6) [(3, 1), (14, 2), (15, 1)],
  term ((-25 : Rat) / 6) [(3, 1), (15, 3)],
  term ((8 : Rat) / 3) [(3, 2), (4, 1)],
  term ((-4 : Rat) / 3) [(3, 2), (4, 2)],
  term ((-4 : Rat) / 3) [(3, 2), (5, 2)],
  term ((-8 : Rat) / 3) [(3, 2), (14, 1)],
  term ((4 : Rat) / 3) [(3, 2), (14, 2)],
  term ((4 : Rat) / 3) [(3, 2), (15, 2)],
  term (-366 : Rat) [(4, 1), (5, 1), (8, 1), (10, 1), (11, 1)],
  term (210 : Rat) [(4, 1), (5, 1), (8, 1), (10, 1), (13, 1)],
  term (320 : Rat) [(4, 1), (5, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((-626 : Rat) / 3) [(4, 1), (5, 1), (8, 1), (10, 1), (15, 1)],
  term (15 : Rat) [(4, 1), (5, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term (72 : Rat) [(4, 1), (5, 1), (8, 1), (10, 2), (11, 1)],
  term (-48 : Rat) [(4, 1), (5, 1), (8, 1), (10, 2), (13, 1)],
  term (48 : Rat) [(4, 1), (5, 1), (8, 1), (10, 2), (15, 1)],
  term (136 : Rat) [(4, 1), (5, 1), (8, 1), (11, 1)],
  term (-70 : Rat) [(4, 1), (5, 1), (8, 1), (13, 1)],
  term ((-448 : Rat) / 3) [(4, 1), (5, 1), (8, 1), (14, 1), (15, 1)],
  term ((191 : Rat) / 2) [(4, 1), (5, 1), (8, 1), (15, 1)],
  term ((-57 : Rat) / 4) [(4, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(4, 1), (5, 1), (9, 1)],
  term (-255 : Rat) [(4, 1), (5, 1), (10, 1), (11, 1)],
  term (-192 : Rat) [(4, 1), (5, 1), (10, 1), (11, 1), (14, 1)],
  term (96 : Rat) [(4, 1), (5, 1), (10, 1), (11, 1), (14, 2)],
  term (96 : Rat) [(4, 1), (5, 1), (10, 1), (11, 1), (15, 2)],
  term (111 : Rat) [(4, 1), (5, 1), (10, 1), (13, 1)],
  term (108 : Rat) [(4, 1), (5, 1), (10, 1), (13, 1), (14, 1)],
  term (-54 : Rat) [(4, 1), (5, 1), (10, 1), (13, 1), (14, 2)],
  term (-54 : Rat) [(4, 1), (5, 1), (10, 1), (13, 1), (15, 2)],
  term ((290 : Rat) / 3) [(4, 1), (5, 1), (10, 1), (14, 1), (15, 1)],
  term (21 : Rat) [(4, 1), (5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term (-80 : Rat) [(4, 1), (5, 1), (10, 1), (14, 1), (15, 3)],
  term ((695 : Rat) / 3) [(4, 1), (5, 1), (10, 1), (14, 2), (15, 1)],
  term ((-21 : Rat) / 2) [(4, 1), (5, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term (-80 : Rat) [(4, 1), (5, 1), (10, 1), (14, 3), (15, 1)],
  term ((-991 : Rat) / 6) [(4, 1), (5, 1), (10, 1), (15, 1)],
  term ((87 : Rat) / 4) [(4, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((215 : Rat) / 3) [(4, 1), (5, 1), (10, 1), (15, 3)],
  term ((-21 : Rat) / 2) [(4, 1), (5, 1), (10, 1), (15, 3), (16, 1)],
  term (390 : Rat) [(4, 1), (5, 1), (10, 2), (11, 1)],
  term (36 : Rat) [(4, 1), (5, 1), (10, 2), (11, 1), (14, 1)],
  term (-18 : Rat) [(4, 1), (5, 1), (10, 2), (11, 1), (14, 2)],
  term (-18 : Rat) [(4, 1), (5, 1), (10, 2), (11, 1), (15, 2)],
  term (-222 : Rat) [(4, 1), (5, 1), (10, 2), (13, 1)],
  term (-24 : Rat) [(4, 1), (5, 1), (10, 2), (13, 1), (14, 1)],
  term (12 : Rat) [(4, 1), (5, 1), (10, 2), (13, 1), (14, 2)],
  term (12 : Rat) [(4, 1), (5, 1), (10, 2), (13, 1), (15, 2)],
  term (-296 : Rat) [(4, 1), (5, 1), (10, 2), (14, 1), (15, 1)],
  term (-12 : Rat) [(4, 1), (5, 1), (10, 2), (14, 2), (15, 1)],
  term ((698 : Rat) / 3) [(4, 1), (5, 1), (10, 2), (15, 1)],
  term (-15 : Rat) [(4, 1), (5, 1), (10, 2), (15, 1), (16, 1)],
  term (-12 : Rat) [(4, 1), (5, 1), (10, 2), (15, 3)],
  term (-72 : Rat) [(4, 1), (5, 1), (10, 3), (11, 1)],
  term (48 : Rat) [(4, 1), (5, 1), (10, 3), (13, 1)],
  term (-48 : Rat) [(4, 1), (5, 1), (10, 3), (15, 1)],
  term (16 : Rat) [(4, 1), (5, 1), (11, 1)],
  term (110 : Rat) [(4, 1), (5, 1), (11, 1), (14, 1)],
  term (-55 : Rat) [(4, 1), (5, 1), (11, 1), (14, 2)],
  term (-55 : Rat) [(4, 1), (5, 1), (11, 1), (15, 2)],
  term (17 : Rat) [(4, 1), (5, 1), (13, 1)],
  term ((-136 : Rat) / 3) [(4, 1), (5, 1), (13, 1), (14, 1)],
  term ((68 : Rat) / 3) [(4, 1), (5, 1), (13, 1), (14, 2)],
  term ((68 : Rat) / 3) [(4, 1), (5, 1), (13, 1), (15, 2)],
  term ((365 : Rat) / 3) [(4, 1), (5, 1), (14, 1), (15, 1)],
  term (-30 : Rat) [(4, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((208 : Rat) / 3) [(4, 1), (5, 1), (14, 1), (15, 3)],
  term ((-1213 : Rat) / 6) [(4, 1), (5, 1), (14, 2), (15, 1)],
  term (15 : Rat) [(4, 1), (5, 1), (14, 2), (15, 1), (16, 1)],
  term ((208 : Rat) / 3) [(4, 1), (5, 1), (14, 3), (15, 1)],
  term ((-19 : Rat) / 12) [(4, 1), (5, 1), (15, 1)],
  term ((-57 : Rat) / 8) [(4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-127 : Rat) / 2) [(4, 1), (5, 1), (15, 3)],
  term (15 : Rat) [(4, 1), (5, 1), (15, 3), (16, 1)],
  term ((-2 : Rat) / 3) [(4, 1), (5, 2)],
  term (-87 : Rat) [(4, 1), (5, 2), (9, 1), (10, 1), (11, 1)],
  term (51 : Rat) [(4, 1), (5, 2), (9, 1), (10, 1), (13, 1)],
  term (80 : Rat) [(4, 1), (5, 2), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-98 : Rat) / 3) [(4, 1), (5, 2), (9, 1), (10, 1), (15, 1)],
  term (-3 : Rat) [(4, 1), (5, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term (18 : Rat) [(4, 1), (5, 2), (9, 1), (10, 2), (11, 1)],
  term (-12 : Rat) [(4, 1), (5, 2), (9, 1), (10, 2), (13, 1)],
  term (12 : Rat) [(4, 1), (5, 2), (9, 1), (10, 2), (15, 1)],
  term (13 : Rat) [(4, 1), (5, 2), (9, 1), (11, 1)],
  term ((-41 : Rat) / 3) [(4, 1), (5, 2), (9, 1), (13, 1)],
  term ((-16 : Rat) / 3) [(4, 1), (5, 2), (9, 1), (14, 1), (15, 1)],
  term ((-63 : Rat) / 4) [(4, 1), (5, 2), (9, 1), (15, 1)],
  term ((63 : Rat) / 8) [(4, 1), (5, 2), (9, 1), (15, 1), (16, 1)],
  term (-186 : Rat) [(4, 1), (5, 2), (10, 1), (11, 1), (13, 1)],
  term (-160 : Rat) [(4, 1), (5, 2), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((268 : Rat) / 3) [(4, 1), (5, 2), (10, 1), (11, 1), (15, 1)],
  term (-3 : Rat) [(4, 1), (5, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term (177 : Rat) [(4, 1), (5, 2), (10, 1), (11, 2)],
  term (80 : Rat) [(4, 1), (5, 2), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-170 : Rat) / 3) [(4, 1), (5, 2), (10, 1), (13, 1), (15, 1)],
  term (6 : Rat) [(4, 1), (5, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term (45 : Rat) [(4, 1), (5, 2), (10, 1), (13, 2)],
  term (42 : Rat) [(4, 1), (5, 2), (10, 2), (11, 1), (13, 1)],
  term (-24 : Rat) [(4, 1), (5, 2), (10, 2), (11, 1), (15, 1)],
  term (-36 : Rat) [(4, 1), (5, 2), (10, 2), (11, 2)],
  term (12 : Rat) [(4, 1), (5, 2), (10, 2), (13, 1), (15, 1)],
  term (-12 : Rat) [(4, 1), (5, 2), (10, 2), (13, 2)],
  term (27 : Rat) [(4, 1), (5, 2), (11, 1), (13, 1)],
  term (40 : Rat) [(4, 1), (5, 2), (11, 1), (14, 1), (15, 1)],
  term ((-89 : Rat) / 6) [(4, 1), (5, 2), (11, 1), (15, 1)],
  term ((-3 : Rat) / 4) [(4, 1), (5, 2), (11, 1), (15, 1), (16, 1)],
  term (-42 : Rat) [(4, 1), (5, 2), (11, 2)],
  term ((-1 : Rat) / 12) [(4, 1), (5, 2), (13, 1), (15, 1)],
  term ((-57 : Rat) / 8) [(4, 1), (5, 2), (13, 1), (15, 1), (16, 1)],
  term ((43 : Rat) / 3) [(4, 1), (5, 2), (13, 2)],
  term ((-16 : Rat) / 3) [(4, 1), (5, 2), (15, 2)],
  term (-96 : Rat) [(4, 1), (5, 3), (10, 1), (11, 1)],
  term (54 : Rat) [(4, 1), (5, 3), (10, 1), (13, 1)],
  term (80 : Rat) [(4, 1), (5, 3), (10, 1), (14, 1), (15, 1)],
  term ((-215 : Rat) / 3) [(4, 1), (5, 3), (10, 1), (15, 1)],
  term ((21 : Rat) / 2) [(4, 1), (5, 3), (10, 1), (15, 1), (16, 1)],
  term (18 : Rat) [(4, 1), (5, 3), (10, 2), (11, 1)],
  term (-12 : Rat) [(4, 1), (5, 3), (10, 2), (13, 1)],
  term (12 : Rat) [(4, 1), (5, 3), (10, 2), (15, 1)],
  term (55 : Rat) [(4, 1), (5, 3), (11, 1)],
  term ((-68 : Rat) / 3) [(4, 1), (5, 3), (13, 1)],
  term ((-208 : Rat) / 3) [(4, 1), (5, 3), (14, 1), (15, 1)],
  term ((127 : Rat) / 2) [(4, 1), (5, 3), (15, 1)],
  term (-15 : Rat) [(4, 1), (5, 3), (15, 1), (16, 1)],
  term (12 : Rat) [(4, 1), (7, 1), (8, 1), (10, 1), (15, 1)],
  term (-6 : Rat) [(4, 1), (7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term (16 : Rat) [(4, 1), (7, 1), (8, 1), (14, 1), (15, 1)],
  term (-27 : Rat) [(4, 1), (7, 1), (8, 1), (15, 1)],
  term ((19 : Rat) / 2) [(4, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term (-174 : Rat) [(4, 1), (9, 1), (10, 1), (11, 1), (14, 1)],
  term (87 : Rat) [(4, 1), (9, 1), (10, 1), (11, 1), (14, 2)],
  term (87 : Rat) [(4, 1), (9, 1), (10, 1), (11, 1), (15, 2)],
  term (102 : Rat) [(4, 1), (9, 1), (10, 1), (13, 1), (14, 1)],
  term (-51 : Rat) [(4, 1), (9, 1), (10, 1), (13, 1), (14, 2)],
  term (-51 : Rat) [(4, 1), (9, 1), (10, 1), (13, 1), (15, 2)],
  term ((-196 : Rat) / 3) [(4, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term (-6 : Rat) [(4, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term (-80 : Rat) [(4, 1), (9, 1), (10, 1), (14, 1), (15, 3)],
  term ((578 : Rat) / 3) [(4, 1), (9, 1), (10, 1), (14, 2), (15, 1)],
  term (3 : Rat) [(4, 1), (9, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term (-80 : Rat) [(4, 1), (9, 1), (10, 1), (14, 3), (15, 1)],
  term ((98 : Rat) / 3) [(4, 1), (9, 1), (10, 1), (15, 3)],
  term (3 : Rat) [(4, 1), (9, 1), (10, 1), (15, 3), (16, 1)],
  term (36 : Rat) [(4, 1), (9, 1), (10, 2), (11, 1), (14, 1)],
  term (-18 : Rat) [(4, 1), (9, 1), (10, 2), (11, 1), (14, 2)],
  term (-18 : Rat) [(4, 1), (9, 1), (10, 2), (11, 1), (15, 2)],
  term (-24 : Rat) [(4, 1), (9, 1), (10, 2), (13, 1), (14, 1)],
  term (12 : Rat) [(4, 1), (9, 1), (10, 2), (13, 1), (14, 2)],
  term (12 : Rat) [(4, 1), (9, 1), (10, 2), (13, 1), (15, 2)],
  term (24 : Rat) [(4, 1), (9, 1), (10, 2), (14, 1), (15, 1)],
  term (-12 : Rat) [(4, 1), (9, 1), (10, 2), (14, 2), (15, 1)],
  term (-12 : Rat) [(4, 1), (9, 1), (10, 2), (15, 3)],
  term (26 : Rat) [(4, 1), (9, 1), (11, 1), (14, 1)],
  term (-13 : Rat) [(4, 1), (9, 1), (11, 1), (14, 2)],
  term (-13 : Rat) [(4, 1), (9, 1), (11, 1), (15, 2)],
  term ((-82 : Rat) / 3) [(4, 1), (9, 1), (13, 1), (14, 1)],
  term ((41 : Rat) / 3) [(4, 1), (9, 1), (13, 1), (14, 2)],
  term ((41 : Rat) / 3) [(4, 1), (9, 1), (13, 1), (15, 2)],
  term ((-63 : Rat) / 2) [(4, 1), (9, 1), (14, 1), (15, 1)],
  term ((63 : Rat) / 4) [(4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 3) [(4, 1), (9, 1), (14, 1), (15, 3)],
  term ((61 : Rat) / 12) [(4, 1), (9, 1), (14, 2), (15, 1)],
  term ((-63 : Rat) / 8) [(4, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((16 : Rat) / 3) [(4, 1), (9, 1), (14, 3), (15, 1)],
  term ((63 : Rat) / 4) [(4, 1), (9, 1), (15, 3)],
  term ((-63 : Rat) / 8) [(4, 1), (9, 1), (15, 3), (16, 1)],
  term (-372 : Rat) [(4, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term (186 : Rat) [(4, 1), (10, 1), (11, 1), (13, 1), (14, 2)],
  term (186 : Rat) [(4, 1), (10, 1), (11, 1), (13, 1), (15, 2)],
  term ((536 : Rat) / 3) [(4, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term (-6 : Rat) [(4, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term (160 : Rat) [(4, 1), (10, 1), (11, 1), (14, 1), (15, 3)],
  term ((-1228 : Rat) / 3) [(4, 1), (10, 1), (11, 1), (14, 2), (15, 1)],
  term (3 : Rat) [(4, 1), (10, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term (160 : Rat) [(4, 1), (10, 1), (11, 1), (14, 3), (15, 1)],
  term ((-268 : Rat) / 3) [(4, 1), (10, 1), (11, 1), (15, 3)],
  term (3 : Rat) [(4, 1), (10, 1), (11, 1), (15, 3), (16, 1)],
  term (354 : Rat) [(4, 1), (10, 1), (11, 2), (14, 1)],
  term (-177 : Rat) [(4, 1), (10, 1), (11, 2), (14, 2)],
  term (-177 : Rat) [(4, 1), (10, 1), (11, 2), (15, 2)],
  term ((-340 : Rat) / 3) [(4, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term (12 : Rat) [(4, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term (-80 : Rat) [(4, 1), (10, 1), (13, 1), (14, 1), (15, 3)],
  term ((650 : Rat) / 3) [(4, 1), (10, 1), (13, 1), (14, 2), (15, 1)],
  term (-6 : Rat) [(4, 1), (10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term (-80 : Rat) [(4, 1), (10, 1), (13, 1), (14, 3), (15, 1)],
  term ((170 : Rat) / 3) [(4, 1), (10, 1), (13, 1), (15, 3)],
  term (-6 : Rat) [(4, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term (90 : Rat) [(4, 1), (10, 1), (13, 2), (14, 1)],
  term (-45 : Rat) [(4, 1), (10, 1), (13, 2), (14, 2)],
  term (-45 : Rat) [(4, 1), (10, 1), (13, 2), (15, 2)],
  term (84 : Rat) [(4, 1), (10, 2), (11, 1), (13, 1), (14, 1)],
  term (-42 : Rat) [(4, 1), (10, 2), (11, 1), (13, 1), (14, 2)],
  term (-42 : Rat) [(4, 1), (10, 2), (11, 1), (13, 1), (15, 2)],
  term (-48 : Rat) [(4, 1), (10, 2), (11, 1), (14, 1), (15, 1)],
  term (24 : Rat) [(4, 1), (10, 2), (11, 1), (14, 2), (15, 1)],
  term (24 : Rat) [(4, 1), (10, 2), (11, 1), (15, 3)],
  term (-72 : Rat) [(4, 1), (10, 2), (11, 2), (14, 1)],
  term (36 : Rat) [(4, 1), (10, 2), (11, 2), (14, 2)],
  term (36 : Rat) [(4, 1), (10, 2), (11, 2), (15, 2)],
  term (24 : Rat) [(4, 1), (10, 2), (13, 1), (14, 1), (15, 1)],
  term (-12 : Rat) [(4, 1), (10, 2), (13, 1), (14, 2), (15, 1)],
  term (-12 : Rat) [(4, 1), (10, 2), (13, 1), (15, 3)],
  term (-24 : Rat) [(4, 1), (10, 2), (13, 2), (14, 1)],
  term (12 : Rat) [(4, 1), (10, 2), (13, 2), (14, 2)],
  term (12 : Rat) [(4, 1), (10, 2), (13, 2), (15, 2)],
  term (54 : Rat) [(4, 1), (11, 1), (13, 1), (14, 1)],
  term (-27 : Rat) [(4, 1), (11, 1), (13, 1), (14, 2)],
  term (-27 : Rat) [(4, 1), (11, 1), (13, 1), (15, 2)],
  term ((-89 : Rat) / 3) [(4, 1), (11, 1), (14, 1), (15, 1)],
  term ((-3 : Rat) / 2) [(4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term (-40 : Rat) [(4, 1), (11, 1), (14, 1), (15, 3)],
  term ((569 : Rat) / 6) [(4, 1), (11, 1), (14, 2), (15, 1)],
  term ((3 : Rat) / 4) [(4, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term (-40 : Rat) [(4, 1), (11, 1), (14, 3), (15, 1)],
  term ((89 : Rat) / 6) [(4, 1), (11, 1), (15, 3)],
  term ((3 : Rat) / 4) [(4, 1), (11, 1), (15, 3), (16, 1)],
  term (-84 : Rat) [(4, 1), (11, 2), (14, 1)],
  term (42 : Rat) [(4, 1), (11, 2), (14, 2)],
  term (42 : Rat) [(4, 1), (11, 2), (15, 2)],
  term ((-1 : Rat) / 6) [(4, 1), (13, 1), (14, 1), (15, 1)],
  term ((-57 : Rat) / 4) [(4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1 : Rat) / 12) [(4, 1), (13, 1), (14, 2), (15, 1)],
  term ((57 : Rat) / 8) [(4, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((1 : Rat) / 12) [(4, 1), (13, 1), (15, 3)],
  term ((57 : Rat) / 8) [(4, 1), (13, 1), (15, 3), (16, 1)],
  term ((86 : Rat) / 3) [(4, 1), (13, 2), (14, 1)],
  term ((-43 : Rat) / 3) [(4, 1), (13, 2), (14, 2)],
  term ((-43 : Rat) / 3) [(4, 1), (13, 2), (15, 2)],
  term ((-4 : Rat) / 3) [(4, 1), (14, 1)],
  term ((-32 : Rat) / 3) [(4, 1), (14, 1), (15, 2)],
  term ((2 : Rat) / 3) [(4, 1), (14, 2)],
  term ((16 : Rat) / 3) [(4, 1), (14, 2), (15, 2)],
  term ((2 : Rat) / 3) [(4, 1), (15, 2)],
  term ((16 : Rat) / 3) [(4, 1), (15, 4)],
  term ((4 : Rat) / 3) [(4, 2)],
  term (183 : Rat) [(4, 2), (5, 1), (8, 1), (10, 1), (11, 1)],
  term (-105 : Rat) [(4, 2), (5, 1), (8, 1), (10, 1), (13, 1)],
  term (-160 : Rat) [(4, 2), (5, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((313 : Rat) / 3) [(4, 2), (5, 1), (8, 1), (10, 1), (15, 1)],
  term ((-15 : Rat) / 2) [(4, 2), (5, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term (-36 : Rat) [(4, 2), (5, 1), (8, 1), (10, 2), (11, 1)],
  term (24 : Rat) [(4, 2), (5, 1), (8, 1), (10, 2), (13, 1)],
  term (-24 : Rat) [(4, 2), (5, 1), (8, 1), (10, 2), (15, 1)],
  term (-68 : Rat) [(4, 2), (5, 1), (8, 1), (11, 1)],
  term (35 : Rat) [(4, 2), (5, 1), (8, 1), (13, 1)],
  term ((224 : Rat) / 3) [(4, 2), (5, 1), (8, 1), (14, 1), (15, 1)],
  term ((-191 : Rat) / 4) [(4, 2), (5, 1), (8, 1), (15, 1)],
  term ((57 : Rat) / 8) [(4, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((2 : Rat) / 3) [(4, 2), (5, 1), (9, 1)],
  term ((639 : Rat) / 2) [(4, 2), (5, 1), (10, 1), (11, 1)],
  term ((-327 : Rat) / 2) [(4, 2), (5, 1), (10, 1), (13, 1)],
  term (-280 : Rat) [(4, 2), (5, 1), (10, 1), (14, 1), (15, 1)],
  term ((2711 : Rat) / 12) [(4, 2), (5, 1), (10, 1), (15, 1)],
  term ((-255 : Rat) / 8) [(4, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term (-231 : Rat) [(4, 2), (5, 1), (10, 2), (11, 1)],
  term (135 : Rat) [(4, 2), (5, 1), (10, 2), (13, 1)],
  term (160 : Rat) [(4, 2), (5, 1), (10, 2), (14, 1), (15, 1)],
  term ((-421 : Rat) / 3) [(4, 2), (5, 1), (10, 2), (15, 1)],
  term ((15 : Rat) / 2) [(4, 2), (5, 1), (10, 2), (15, 1), (16, 1)],
  term (36 : Rat) [(4, 2), (5, 1), (10, 3), (11, 1)],
  term (-24 : Rat) [(4, 2), (5, 1), (10, 3), (13, 1)],
  term (24 : Rat) [(4, 2), (5, 1), (10, 3), (15, 1)],
  term (-118 : Rat) [(4, 2), (5, 1), (11, 1)],
  term ((221 : Rat) / 6) [(4, 2), (5, 1), (13, 1)],
  term ((424 : Rat) / 3) [(4, 2), (5, 1), (14, 1), (15, 1)],
  term ((-3029 : Rat) / 24) [(4, 2), (5, 1), (15, 1)],
  term ((537 : Rat) / 16) [(4, 2), (5, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(4, 2), (7, 1), (8, 1), (10, 1), (15, 1)],
  term (3 : Rat) [(4, 2), (7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(4, 2), (7, 1), (8, 1), (14, 1), (15, 1)],
  term ((27 : Rat) / 2) [(4, 2), (7, 1), (8, 1), (15, 1)],
  term ((-19 : Rat) / 4) [(4, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term (174 : Rat) [(4, 2), (9, 1), (10, 1), (11, 1)],
  term (-102 : Rat) [(4, 2), (9, 1), (10, 1), (13, 1)],
  term (-160 : Rat) [(4, 2), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((196 : Rat) / 3) [(4, 2), (9, 1), (10, 1), (15, 1)],
  term (6 : Rat) [(4, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term (-36 : Rat) [(4, 2), (9, 1), (10, 2), (11, 1)],
  term (24 : Rat) [(4, 2), (9, 1), (10, 2), (13, 1)],
  term (-24 : Rat) [(4, 2), (9, 1), (10, 2), (15, 1)],
  term (-26 : Rat) [(4, 2), (9, 1), (11, 1)],
  term ((82 : Rat) / 3) [(4, 2), (9, 1), (13, 1)],
  term ((32 : Rat) / 3) [(4, 2), (9, 1), (14, 1), (15, 1)],
  term ((63 : Rat) / 2) [(4, 2), (9, 1), (15, 1)],
  term ((-63 : Rat) / 4) [(4, 2), (9, 1), (15, 1), (16, 1)],
  term (372 : Rat) [(4, 2), (10, 1), (11, 1), (13, 1)],
  term (320 : Rat) [(4, 2), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-536 : Rat) / 3) [(4, 2), (10, 1), (11, 1), (15, 1)],
  term (6 : Rat) [(4, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term (-354 : Rat) [(4, 2), (10, 1), (11, 2)],
  term (-160 : Rat) [(4, 2), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((340 : Rat) / 3) [(4, 2), (10, 1), (13, 1), (15, 1)],
  term (-12 : Rat) [(4, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term (-90 : Rat) [(4, 2), (10, 1), (13, 2)],
  term (-84 : Rat) [(4, 2), (10, 2), (11, 1), (13, 1)],
  term (48 : Rat) [(4, 2), (10, 2), (11, 1), (15, 1)],
  term (72 : Rat) [(4, 2), (10, 2), (11, 2)],
  term (-24 : Rat) [(4, 2), (10, 2), (13, 1), (15, 1)],
  term (24 : Rat) [(4, 2), (10, 2), (13, 2)],
  term (-54 : Rat) [(4, 2), (11, 1), (13, 1)],
  term (-80 : Rat) [(4, 2), (11, 1), (14, 1), (15, 1)],
  term ((89 : Rat) / 3) [(4, 2), (11, 1), (15, 1)],
  term ((3 : Rat) / 2) [(4, 2), (11, 1), (15, 1), (16, 1)],
  term (84 : Rat) [(4, 2), (11, 2)],
  term ((1 : Rat) / 6) [(4, 2), (13, 1), (15, 1)],
  term ((57 : Rat) / 4) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term ((-86 : Rat) / 3) [(4, 2), (13, 2)],
  term ((32 : Rat) / 3) [(4, 2), (15, 2)],
  term ((-2 : Rat) / 3) [(4, 3)],
  term (-96 : Rat) [(4, 3), (5, 1), (10, 1), (11, 1)],
  term (54 : Rat) [(4, 3), (5, 1), (10, 1), (13, 1)],
  term (80 : Rat) [(4, 3), (5, 1), (10, 1), (14, 1), (15, 1)],
  term ((-215 : Rat) / 3) [(4, 3), (5, 1), (10, 1), (15, 1)],
  term ((21 : Rat) / 2) [(4, 3), (5, 1), (10, 1), (15, 1), (16, 1)],
  term (18 : Rat) [(4, 3), (5, 1), (10, 2), (11, 1)],
  term (-12 : Rat) [(4, 3), (5, 1), (10, 2), (13, 1)],
  term (12 : Rat) [(4, 3), (5, 1), (10, 2), (15, 1)],
  term (55 : Rat) [(4, 3), (5, 1), (11, 1)],
  term ((-68 : Rat) / 3) [(4, 3), (5, 1), (13, 1)],
  term ((-208 : Rat) / 3) [(4, 3), (5, 1), (14, 1), (15, 1)],
  term ((127 : Rat) / 2) [(4, 3), (5, 1), (15, 1)],
  term (-15 : Rat) [(4, 3), (5, 1), (15, 1), (16, 1)],
  term (-87 : Rat) [(4, 3), (9, 1), (10, 1), (11, 1)],
  term (51 : Rat) [(4, 3), (9, 1), (10, 1), (13, 1)],
  term (80 : Rat) [(4, 3), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-98 : Rat) / 3) [(4, 3), (9, 1), (10, 1), (15, 1)],
  term (-3 : Rat) [(4, 3), (9, 1), (10, 1), (15, 1), (16, 1)],
  term (18 : Rat) [(4, 3), (9, 1), (10, 2), (11, 1)],
  term (-12 : Rat) [(4, 3), (9, 1), (10, 2), (13, 1)],
  term (12 : Rat) [(4, 3), (9, 1), (10, 2), (15, 1)],
  term (13 : Rat) [(4, 3), (9, 1), (11, 1)],
  term ((-41 : Rat) / 3) [(4, 3), (9, 1), (13, 1)],
  term ((-16 : Rat) / 3) [(4, 3), (9, 1), (14, 1), (15, 1)],
  term ((-63 : Rat) / 4) [(4, 3), (9, 1), (15, 1)],
  term ((63 : Rat) / 8) [(4, 3), (9, 1), (15, 1), (16, 1)],
  term (-186 : Rat) [(4, 3), (10, 1), (11, 1), (13, 1)],
  term (-160 : Rat) [(4, 3), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((268 : Rat) / 3) [(4, 3), (10, 1), (11, 1), (15, 1)],
  term (-3 : Rat) [(4, 3), (10, 1), (11, 1), (15, 1), (16, 1)],
  term (177 : Rat) [(4, 3), (10, 1), (11, 2)],
  term (80 : Rat) [(4, 3), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-170 : Rat) / 3) [(4, 3), (10, 1), (13, 1), (15, 1)],
  term (6 : Rat) [(4, 3), (10, 1), (13, 1), (15, 1), (16, 1)],
  term (45 : Rat) [(4, 3), (10, 1), (13, 2)],
  term (42 : Rat) [(4, 3), (10, 2), (11, 1), (13, 1)],
  term (-24 : Rat) [(4, 3), (10, 2), (11, 1), (15, 1)],
  term (-36 : Rat) [(4, 3), (10, 2), (11, 2)],
  term (12 : Rat) [(4, 3), (10, 2), (13, 1), (15, 1)],
  term (-12 : Rat) [(4, 3), (10, 2), (13, 2)],
  term (27 : Rat) [(4, 3), (11, 1), (13, 1)],
  term (40 : Rat) [(4, 3), (11, 1), (14, 1), (15, 1)],
  term ((-89 : Rat) / 6) [(4, 3), (11, 1), (15, 1)],
  term ((-3 : Rat) / 4) [(4, 3), (11, 1), (15, 1), (16, 1)],
  term (-42 : Rat) [(4, 3), (11, 2)],
  term ((-1 : Rat) / 12) [(4, 3), (13, 1), (15, 1)],
  term ((-57 : Rat) / 8) [(4, 3), (13, 1), (15, 1), (16, 1)],
  term ((43 : Rat) / 3) [(4, 3), (13, 2)],
  term ((-16 : Rat) / 3) [(4, 3), (15, 2)],
  term (366 : Rat) [(5, 1), (8, 1), (10, 1), (11, 1), (14, 1)],
  term (-183 : Rat) [(5, 1), (8, 1), (10, 1), (11, 1), (14, 2)],
  term (-183 : Rat) [(5, 1), (8, 1), (10, 1), (11, 1), (15, 2)],
  term (-210 : Rat) [(5, 1), (8, 1), (10, 1), (13, 1), (14, 1)],
  term (105 : Rat) [(5, 1), (8, 1), (10, 1), (13, 1), (14, 2)],
  term (105 : Rat) [(5, 1), (8, 1), (10, 1), (13, 1), (15, 2)],
  term ((626 : Rat) / 3) [(5, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term (-15 : Rat) [(5, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term (160 : Rat) [(5, 1), (8, 1), (10, 1), (14, 1), (15, 3)],
  term ((-1273 : Rat) / 3) [(5, 1), (8, 1), (10, 1), (14, 2), (15, 1)],
  term ((15 : Rat) / 2) [(5, 1), (8, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term (160 : Rat) [(5, 1), (8, 1), (10, 1), (14, 3), (15, 1)],
  term ((-313 : Rat) / 3) [(5, 1), (8, 1), (10, 1), (15, 3)],
  term ((15 : Rat) / 2) [(5, 1), (8, 1), (10, 1), (15, 3), (16, 1)],
  term (-72 : Rat) [(5, 1), (8, 1), (10, 2), (11, 1), (14, 1)],
  term (36 : Rat) [(5, 1), (8, 1), (10, 2), (11, 1), (14, 2)],
  term (36 : Rat) [(5, 1), (8, 1), (10, 2), (11, 1), (15, 2)],
  term (48 : Rat) [(5, 1), (8, 1), (10, 2), (13, 1), (14, 1)],
  term (-24 : Rat) [(5, 1), (8, 1), (10, 2), (13, 1), (14, 2)],
  term (-24 : Rat) [(5, 1), (8, 1), (10, 2), (13, 1), (15, 2)],
  term (-48 : Rat) [(5, 1), (8, 1), (10, 2), (14, 1), (15, 1)],
  term (24 : Rat) [(5, 1), (8, 1), (10, 2), (14, 2), (15, 1)],
  term (24 : Rat) [(5, 1), (8, 1), (10, 2), (15, 3)],
  term (-136 : Rat) [(5, 1), (8, 1), (11, 1), (14, 1)],
  term (68 : Rat) [(5, 1), (8, 1), (11, 1), (14, 2)],
  term (68 : Rat) [(5, 1), (8, 1), (11, 1), (15, 2)],
  term (70 : Rat) [(5, 1), (8, 1), (13, 1), (14, 1)],
  term (-35 : Rat) [(5, 1), (8, 1), (13, 1), (14, 2)],
  term (-35 : Rat) [(5, 1), (8, 1), (13, 1), (15, 2)],
  term ((-191 : Rat) / 2) [(5, 1), (8, 1), (14, 1), (15, 1)],
  term ((57 : Rat) / 4) [(5, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-224 : Rat) / 3) [(5, 1), (8, 1), (14, 1), (15, 3)],
  term ((2365 : Rat) / 12) [(5, 1), (8, 1), (14, 2), (15, 1)],
  term ((-57 : Rat) / 8) [(5, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((-224 : Rat) / 3) [(5, 1), (8, 1), (14, 3), (15, 1)],
  term ((191 : Rat) / 4) [(5, 1), (8, 1), (15, 3)],
  term ((-57 : Rat) / 8) [(5, 1), (8, 1), (15, 3), (16, 1)],
  term ((4 : Rat) / 3) [(5, 1), (9, 1), (14, 1)],
  term ((-2 : Rat) / 3) [(5, 1), (9, 1), (14, 2)],
  term ((-2 : Rat) / 3) [(5, 1), (9, 1), (15, 2)],
  term (255 : Rat) [(5, 1), (10, 1), (11, 1), (14, 1)],
  term ((-255 : Rat) / 2) [(5, 1), (10, 1), (11, 1), (14, 2)],
  term ((-255 : Rat) / 2) [(5, 1), (10, 1), (11, 1), (15, 2)],
  term (-111 : Rat) [(5, 1), (10, 1), (13, 1), (14, 1)],
  term ((111 : Rat) / 2) [(5, 1), (10, 1), (13, 1), (14, 2)],
  term ((111 : Rat) / 2) [(5, 1), (10, 1), (13, 1), (15, 2)],
  term ((991 : Rat) / 6) [(5, 1), (10, 1), (14, 1), (15, 1)],
  term ((-87 : Rat) / 4) [(5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term (120 : Rat) [(5, 1), (10, 1), (14, 1), (15, 3)],
  term ((-3871 : Rat) / 12) [(5, 1), (10, 1), (14, 2), (15, 1)],
  term ((87 : Rat) / 8) [(5, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term (120 : Rat) [(5, 1), (10, 1), (14, 3), (15, 1)],
  term ((-991 : Rat) / 12) [(5, 1), (10, 1), (15, 3)],
  term ((87 : Rat) / 8) [(5, 1), (10, 1), (15, 3), (16, 1)],
  term (-390 : Rat) [(5, 1), (10, 2), (11, 1), (14, 1)],
  term (195 : Rat) [(5, 1), (10, 2), (11, 1), (14, 2)],
  term (195 : Rat) [(5, 1), (10, 2), (11, 1), (15, 2)],
  term (222 : Rat) [(5, 1), (10, 2), (13, 1), (14, 1)],
  term (-111 : Rat) [(5, 1), (10, 2), (13, 1), (14, 2)],
  term (-111 : Rat) [(5, 1), (10, 2), (13, 1), (15, 2)],
  term ((-698 : Rat) / 3) [(5, 1), (10, 2), (14, 1), (15, 1)],
  term (15 : Rat) [(5, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term (-160 : Rat) [(5, 1), (10, 2), (14, 1), (15, 3)],
  term ((1309 : Rat) / 3) [(5, 1), (10, 2), (14, 2), (15, 1)],
  term ((-15 : Rat) / 2) [(5, 1), (10, 2), (14, 2), (15, 1), (16, 1)],
  term (-160 : Rat) [(5, 1), (10, 2), (14, 3), (15, 1)],
  term ((349 : Rat) / 3) [(5, 1), (10, 2), (15, 3)],
  term ((-15 : Rat) / 2) [(5, 1), (10, 2), (15, 3), (16, 1)],
  term (72 : Rat) [(5, 1), (10, 3), (11, 1), (14, 1)],
  term (-36 : Rat) [(5, 1), (10, 3), (11, 1), (14, 2)],
  term (-36 : Rat) [(5, 1), (10, 3), (11, 1), (15, 2)],
  term (-48 : Rat) [(5, 1), (10, 3), (13, 1), (14, 1)],
  term (24 : Rat) [(5, 1), (10, 3), (13, 1), (14, 2)],
  term (24 : Rat) [(5, 1), (10, 3), (13, 1), (15, 2)],
  term (48 : Rat) [(5, 1), (10, 3), (14, 1), (15, 1)],
  term (-24 : Rat) [(5, 1), (10, 3), (14, 2), (15, 1)],
  term (-24 : Rat) [(5, 1), (10, 3), (15, 3)],
  term (-16 : Rat) [(5, 1), (11, 1), (14, 1)],
  term (8 : Rat) [(5, 1), (11, 1), (14, 2)],
  term (8 : Rat) [(5, 1), (11, 1), (15, 2)],
  term (-17 : Rat) [(5, 1), (13, 1), (14, 1)],
  term ((17 : Rat) / 2) [(5, 1), (13, 1), (14, 2)],
  term ((17 : Rat) / 2) [(5, 1), (13, 1), (15, 2)],
  term ((19 : Rat) / 12) [(5, 1), (14, 1), (15, 1)],
  term ((57 : Rat) / 8) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8 : Rat) / 3) [(5, 1), (14, 1), (15, 3)],
  term ((109 : Rat) / 24) [(5, 1), (14, 2), (15, 1)],
  term ((-57 : Rat) / 16) [(5, 1), (14, 2), (15, 1), (16, 1)],
  term ((-8 : Rat) / 3) [(5, 1), (14, 3), (15, 1)],
  term ((-19 : Rat) / 24) [(5, 1), (15, 3)],
  term ((-57 : Rat) / 16) [(5, 1), (15, 3), (16, 1)],
  term (-6 : Rat) [(5, 2), (7, 1), (8, 1), (10, 1), (15, 1)],
  term (3 : Rat) [(5, 2), (7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(5, 2), (7, 1), (8, 1), (14, 1), (15, 1)],
  term ((27 : Rat) / 2) [(5, 2), (7, 1), (8, 1), (15, 1)],
  term ((-19 : Rat) / 4) [(5, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term (183 : Rat) [(5, 3), (8, 1), (10, 1), (11, 1)],
  term (-105 : Rat) [(5, 3), (8, 1), (10, 1), (13, 1)],
  term (-160 : Rat) [(5, 3), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((313 : Rat) / 3) [(5, 3), (8, 1), (10, 1), (15, 1)],
  term ((-15 : Rat) / 2) [(5, 3), (8, 1), (10, 1), (15, 1), (16, 1)],
  term (-36 : Rat) [(5, 3), (8, 1), (10, 2), (11, 1)],
  term (24 : Rat) [(5, 3), (8, 1), (10, 2), (13, 1)],
  term (-24 : Rat) [(5, 3), (8, 1), (10, 2), (15, 1)],
  term (-68 : Rat) [(5, 3), (8, 1), (11, 1)],
  term (35 : Rat) [(5, 3), (8, 1), (13, 1)],
  term ((224 : Rat) / 3) [(5, 3), (8, 1), (14, 1), (15, 1)],
  term ((-191 : Rat) / 4) [(5, 3), (8, 1), (15, 1)],
  term ((57 : Rat) / 8) [(5, 3), (8, 1), (15, 1), (16, 1)],
  term ((2 : Rat) / 3) [(5, 3), (9, 1)],
  term ((255 : Rat) / 2) [(5, 3), (10, 1), (11, 1)],
  term ((-111 : Rat) / 2) [(5, 3), (10, 1), (13, 1)],
  term (-120 : Rat) [(5, 3), (10, 1), (14, 1), (15, 1)],
  term ((991 : Rat) / 12) [(5, 3), (10, 1), (15, 1)],
  term ((-87 : Rat) / 8) [(5, 3), (10, 1), (15, 1), (16, 1)],
  term (-195 : Rat) [(5, 3), (10, 2), (11, 1)],
  term (111 : Rat) [(5, 3), (10, 2), (13, 1)],
  term (160 : Rat) [(5, 3), (10, 2), (14, 1), (15, 1)],
  term ((-349 : Rat) / 3) [(5, 3), (10, 2), (15, 1)],
  term ((15 : Rat) / 2) [(5, 3), (10, 2), (15, 1), (16, 1)],
  term (36 : Rat) [(5, 3), (10, 3), (11, 1)],
  term (-24 : Rat) [(5, 3), (10, 3), (13, 1)],
  term (24 : Rat) [(5, 3), (10, 3), (15, 1)],
  term (-8 : Rat) [(5, 3), (11, 1)],
  term ((-17 : Rat) / 2) [(5, 3), (13, 1)],
  term ((8 : Rat) / 3) [(5, 3), (14, 1), (15, 1)],
  term ((19 : Rat) / 24) [(5, 3), (15, 1)],
  term ((57 : Rat) / 16) [(5, 3), (15, 1), (16, 1)],
  term (-12 : Rat) [(7, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term (6 : Rat) [(7, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(7, 1), (8, 1), (10, 1), (14, 2), (15, 1)],
  term (-3 : Rat) [(7, 1), (8, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term (6 : Rat) [(7, 1), (8, 1), (10, 1), (15, 3)],
  term (-3 : Rat) [(7, 1), (8, 1), (10, 1), (15, 3), (16, 1)],
  term (27 : Rat) [(7, 1), (8, 1), (14, 1), (15, 1)],
  term ((-19 : Rat) / 2) [(7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(7, 1), (8, 1), (14, 1), (15, 3)],
  term ((-59 : Rat) / 2) [(7, 1), (8, 1), (14, 2), (15, 1)],
  term ((19 : Rat) / 4) [(7, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term (8 : Rat) [(7, 1), (8, 1), (14, 3), (15, 1)],
  term ((-27 : Rat) / 2) [(7, 1), (8, 1), (15, 3)],
  term ((19 : Rat) / 4) [(7, 1), (8, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 5, terms 200 through 299. -/
theorem rs_R009_ueqv_R009NYYNY_block_05_0200_0299_valid :
    checkProductSumEq rs_R009_ueqv_R009NYYNY_partials_05_0200_0299
      rs_R009_ueqv_R009NYYNY_block_05_0200_0299 = true := by
  native_decide

end R009UeqvR009NYYNYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
