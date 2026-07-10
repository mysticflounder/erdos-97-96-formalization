/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R003:u=v:R003NY, term block 13:200-245

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R003UeqvR003NYTermShards

/-- Generator polynomial 13 for relaxed split surplus certificate `R003:u=v:R003NY`. -/
def rs_R003_ueqv_R003NY_generator_13_0200_0245 : Poly :=
[
  term (2 : Rat) [(2, 1), (4, 1)],
  term (-1 : Rat) [(2, 2)],
  term (2 : Rat) [(3, 1), (5, 1)],
  term (-1 : Rat) [(3, 2)]
]

/-- Coefficient term 200 from coefficient polynomial 13. -/
def rs_R003_ueqv_R003NY_coefficient_13_0200 : Poly :=
[
  term ((7200 : Rat) / 299) [(2, 2), (9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 200 for generator 13. -/
def rs_R003_ueqv_R003NY_partial_13_0200 : Poly :=
[
  term ((14400 : Rat) / 299) [(2, 2), (3, 1), (5, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-7200 : Rat) / 299) [(2, 2), (3, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((14400 : Rat) / 299) [(2, 3), (4, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-7200 : Rat) / 299) [(2, 4), (9, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 13. -/
theorem rs_R003_ueqv_R003NY_partial_13_0200_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_13_0200
        rs_R003_ueqv_R003NY_generator_13_0200_0245 =
      rs_R003_ueqv_R003NY_partial_13_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 13. -/
def rs_R003_ueqv_R003NY_coefficient_13_0201 : Poly :=
[
  term ((-1800 : Rat) / 299) [(2, 2), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 201 for generator 13. -/
def rs_R003_ueqv_R003NY_partial_13_0201 : Poly :=
[
  term ((-3600 : Rat) / 299) [(2, 2), (3, 1), (5, 1), (9, 1), (13, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(2, 2), (3, 2), (9, 1), (13, 1), (16, 1)],
  term ((-3600 : Rat) / 299) [(2, 3), (4, 1), (9, 1), (13, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(2, 4), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 13. -/
theorem rs_R003_ueqv_R003NY_partial_13_0201_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_13_0201
        rs_R003_ueqv_R003NY_generator_13_0200_0245 =
      rs_R003_ueqv_R003NY_partial_13_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 13. -/
def rs_R003_ueqv_R003NY_coefficient_13_0202 : Poly :=
[
  term ((8640 : Rat) / 299) [(2, 2), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 202 for generator 13. -/
def rs_R003_ueqv_R003NY_partial_13_0202 : Poly :=
[
  term ((17280 : Rat) / 299) [(2, 2), (3, 1), (5, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8640 : Rat) / 299) [(2, 2), (3, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((17280 : Rat) / 299) [(2, 3), (4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8640 : Rat) / 299) [(2, 4), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 13. -/
theorem rs_R003_ueqv_R003NY_partial_13_0202_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_13_0202
        rs_R003_ueqv_R003NY_generator_13_0200_0245 =
      rs_R003_ueqv_R003NY_partial_13_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 13. -/
def rs_R003_ueqv_R003NY_coefficient_13_0203 : Poly :=
[
  term ((-4320 : Rat) / 299) [(2, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 203 for generator 13. -/
def rs_R003_ueqv_R003NY_partial_13_0203 : Poly :=
[
  term ((-8640 : Rat) / 299) [(2, 2), (3, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(2, 2), (3, 2), (9, 1), (15, 1), (16, 1)],
  term ((-8640 : Rat) / 299) [(2, 3), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(2, 4), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 13. -/
theorem rs_R003_ueqv_R003NY_partial_13_0203_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_13_0203
        rs_R003_ueqv_R003NY_generator_13_0200_0245 =
      rs_R003_ueqv_R003NY_partial_13_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 13. -/
def rs_R003_ueqv_R003NY_coefficient_13_0204 : Poly :=
[
  term ((-1200 : Rat) / 299) [(2, 2), (9, 2), (16, 1)]
]

/-- Partial product 204 for generator 13. -/
def rs_R003_ueqv_R003NY_partial_13_0204 : Poly :=
[
  term ((-2400 : Rat) / 299) [(2, 2), (3, 1), (5, 1), (9, 2), (16, 1)],
  term ((1200 : Rat) / 299) [(2, 2), (3, 2), (9, 2), (16, 1)],
  term ((-2400 : Rat) / 299) [(2, 3), (4, 1), (9, 2), (16, 1)],
  term ((1200 : Rat) / 299) [(2, 4), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 13. -/
theorem rs_R003_ueqv_R003NY_partial_13_0204_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_13_0204
        rs_R003_ueqv_R003NY_generator_13_0200_0245 =
      rs_R003_ueqv_R003NY_partial_13_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 13. -/
def rs_R003_ueqv_R003NY_coefficient_13_0205 : Poly :=
[
  term ((240 : Rat) / 299) [(2, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 205 for generator 13. -/
def rs_R003_ueqv_R003NY_partial_13_0205 : Poly :=
[
  term ((480 : Rat) / 299) [(2, 2), (3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-240 : Rat) / 299) [(2, 2), (3, 2), (11, 1), (15, 1), (16, 1)],
  term ((480 : Rat) / 299) [(2, 3), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-240 : Rat) / 299) [(2, 4), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 13. -/
theorem rs_R003_ueqv_R003NY_partial_13_0205_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_13_0205
        rs_R003_ueqv_R003NY_generator_13_0200_0245 =
      rs_R003_ueqv_R003NY_partial_13_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 13. -/
def rs_R003_ueqv_R003NY_coefficient_13_0206 : Poly :=
[
  term ((3600 : Rat) / 299) [(2, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 206 for generator 13. -/
def rs_R003_ueqv_R003NY_partial_13_0206 : Poly :=
[
  term ((7200 : Rat) / 299) [(2, 2), (3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3600 : Rat) / 299) [(2, 2), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((7200 : Rat) / 299) [(2, 3), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3600 : Rat) / 299) [(2, 4), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 13. -/
theorem rs_R003_ueqv_R003NY_partial_13_0206_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_13_0206
        rs_R003_ueqv_R003NY_generator_13_0200_0245 =
      rs_R003_ueqv_R003NY_partial_13_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 13. -/
def rs_R003_ueqv_R003NY_coefficient_13_0207 : Poly :=
[
  term ((360 : Rat) / 299) [(2, 2), (14, 1), (16, 1)]
]

/-- Partial product 207 for generator 13. -/
def rs_R003_ueqv_R003NY_partial_13_0207 : Poly :=
[
  term ((720 : Rat) / 299) [(2, 2), (3, 1), (5, 1), (14, 1), (16, 1)],
  term ((-360 : Rat) / 299) [(2, 2), (3, 2), (14, 1), (16, 1)],
  term ((720 : Rat) / 299) [(2, 3), (4, 1), (14, 1), (16, 1)],
  term ((-360 : Rat) / 299) [(2, 4), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 13. -/
theorem rs_R003_ueqv_R003NY_partial_13_0207_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_13_0207
        rs_R003_ueqv_R003NY_generator_13_0200_0245 =
      rs_R003_ueqv_R003NY_partial_13_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 13. -/
def rs_R003_ueqv_R003NY_coefficient_13_0208 : Poly :=
[
  term ((-360 : Rat) / 299) [(2, 2), (16, 1)]
]

/-- Partial product 208 for generator 13. -/
def rs_R003_ueqv_R003NY_partial_13_0208 : Poly :=
[
  term ((-720 : Rat) / 299) [(2, 2), (3, 1), (5, 1), (16, 1)],
  term ((360 : Rat) / 299) [(2, 2), (3, 2), (16, 1)],
  term ((-720 : Rat) / 299) [(2, 3), (4, 1), (16, 1)],
  term ((360 : Rat) / 299) [(2, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 13. -/
theorem rs_R003_ueqv_R003NY_partial_13_0208_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_13_0208
        rs_R003_ueqv_R003NY_generator_13_0200_0245 =
      rs_R003_ueqv_R003NY_partial_13_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 13. -/
def rs_R003_ueqv_R003NY_coefficient_13_0209 : Poly :=
[
  term ((5024 : Rat) / 299) [(3, 1), (4, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 209 for generator 13. -/
def rs_R003_ueqv_R003NY_partial_13_0209 : Poly :=
[
  term ((10048 : Rat) / 299) [(2, 1), (3, 1), (4, 2), (9, 1), (14, 1), (16, 1)],
  term ((-5024 : Rat) / 299) [(2, 2), (3, 1), (4, 1), (9, 1), (14, 1), (16, 1)],
  term ((10048 : Rat) / 299) [(3, 2), (4, 1), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((-5024 : Rat) / 299) [(3, 3), (4, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 13. -/
theorem rs_R003_ueqv_R003NY_partial_13_0209_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_13_0209
        rs_R003_ueqv_R003NY_generator_13_0200_0245 =
      rs_R003_ueqv_R003NY_partial_13_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 13. -/
def rs_R003_ueqv_R003NY_coefficient_13_0210 : Poly :=
[
  term ((-5024 : Rat) / 299) [(3, 1), (4, 1), (9, 1), (16, 1)]
]

/-- Partial product 210 for generator 13. -/
def rs_R003_ueqv_R003NY_partial_13_0210 : Poly :=
[
  term ((-10048 : Rat) / 299) [(2, 1), (3, 1), (4, 2), (9, 1), (16, 1)],
  term ((5024 : Rat) / 299) [(2, 2), (3, 1), (4, 1), (9, 1), (16, 1)],
  term ((-10048 : Rat) / 299) [(3, 2), (4, 1), (5, 1), (9, 1), (16, 1)],
  term ((5024 : Rat) / 299) [(3, 3), (4, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 13. -/
theorem rs_R003_ueqv_R003NY_partial_13_0210_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_13_0210
        rs_R003_ueqv_R003NY_generator_13_0200_0245 =
      rs_R003_ueqv_R003NY_partial_13_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 13. -/
def rs_R003_ueqv_R003NY_coefficient_13_0211 : Poly :=
[
  term ((48 : Rat) / 13) [(3, 1), (4, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 211 for generator 13. -/
def rs_R003_ueqv_R003NY_partial_13_0211 : Poly :=
[
  term ((96 : Rat) / 13) [(2, 1), (3, 1), (4, 2), (13, 1), (14, 1), (16, 1)],
  term ((-48 : Rat) / 13) [(2, 2), (3, 1), (4, 1), (13, 1), (14, 1), (16, 1)],
  term ((96 : Rat) / 13) [(3, 2), (4, 1), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((-48 : Rat) / 13) [(3, 3), (4, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 13. -/
theorem rs_R003_ueqv_R003NY_partial_13_0211_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_13_0211
        rs_R003_ueqv_R003NY_generator_13_0200_0245 =
      rs_R003_ueqv_R003NY_partial_13_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 13. -/
def rs_R003_ueqv_R003NY_coefficient_13_0212 : Poly :=
[
  term ((-36 : Rat) / 13) [(3, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 212 for generator 13. -/
def rs_R003_ueqv_R003NY_partial_13_0212 : Poly :=
[
  term ((-72 : Rat) / 13) [(2, 1), (3, 1), (4, 2), (15, 1), (16, 1)],
  term ((36 : Rat) / 13) [(2, 2), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((-72 : Rat) / 13) [(3, 2), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((36 : Rat) / 13) [(3, 3), (4, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 13. -/
theorem rs_R003_ueqv_R003NY_partial_13_0212_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_13_0212
        rs_R003_ueqv_R003NY_generator_13_0200_0245 =
      rs_R003_ueqv_R003NY_partial_13_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 13. -/
def rs_R003_ueqv_R003NY_coefficient_13_0213 : Poly :=
[
  term ((-5024 : Rat) / 299) [(3, 1), (5, 1), (8, 1), (14, 1), (16, 1)]
]

/-- Partial product 213 for generator 13. -/
def rs_R003_ueqv_R003NY_partial_13_0213 : Poly :=
[
  term ((-10048 : Rat) / 299) [(2, 1), (3, 1), (4, 1), (5, 1), (8, 1), (14, 1), (16, 1)],
  term ((5024 : Rat) / 299) [(2, 2), (3, 1), (5, 1), (8, 1), (14, 1), (16, 1)],
  term ((-10048 : Rat) / 299) [(3, 2), (5, 2), (8, 1), (14, 1), (16, 1)],
  term ((5024 : Rat) / 299) [(3, 3), (5, 1), (8, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 13. -/
theorem rs_R003_ueqv_R003NY_partial_13_0213_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_13_0213
        rs_R003_ueqv_R003NY_generator_13_0200_0245 =
      rs_R003_ueqv_R003NY_partial_13_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 13. -/
def rs_R003_ueqv_R003NY_coefficient_13_0214 : Poly :=
[
  term ((5024 : Rat) / 299) [(3, 1), (5, 1), (8, 1), (16, 1)]
]

/-- Partial product 214 for generator 13. -/
def rs_R003_ueqv_R003NY_partial_13_0214 : Poly :=
[
  term ((10048 : Rat) / 299) [(2, 1), (3, 1), (4, 1), (5, 1), (8, 1), (16, 1)],
  term ((-5024 : Rat) / 299) [(2, 2), (3, 1), (5, 1), (8, 1), (16, 1)],
  term ((10048 : Rat) / 299) [(3, 2), (5, 2), (8, 1), (16, 1)],
  term ((-5024 : Rat) / 299) [(3, 3), (5, 1), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 13. -/
theorem rs_R003_ueqv_R003NY_partial_13_0214_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_13_0214
        rs_R003_ueqv_R003NY_generator_13_0200_0245 =
      rs_R003_ueqv_R003NY_partial_13_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 13. -/
def rs_R003_ueqv_R003NY_coefficient_13_0215 : Poly :=
[
  term ((-2512 : Rat) / 299) [(3, 1), (8, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 215 for generator 13. -/
def rs_R003_ueqv_R003NY_partial_13_0215 : Poly :=
[
  term ((-5024 : Rat) / 299) [(2, 1), (3, 1), (4, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((2512 : Rat) / 299) [(2, 2), (3, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((-5024 : Rat) / 299) [(3, 2), (5, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((2512 : Rat) / 299) [(3, 3), (8, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 13. -/
theorem rs_R003_ueqv_R003NY_partial_13_0215_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_13_0215
        rs_R003_ueqv_R003NY_generator_13_0200_0245 =
      rs_R003_ueqv_R003NY_partial_13_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 13. -/
def rs_R003_ueqv_R003NY_coefficient_13_0216 : Poly :=
[
  term ((2144 : Rat) / 299) [(3, 1), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 216 for generator 13. -/
def rs_R003_ueqv_R003NY_partial_13_0216 : Poly :=
[
  term ((4288 : Rat) / 299) [(2, 1), (3, 1), (4, 1), (8, 1), (9, 1), (16, 1)],
  term ((-2144 : Rat) / 299) [(2, 2), (3, 1), (8, 1), (9, 1), (16, 1)],
  term ((4288 : Rat) / 299) [(3, 2), (5, 1), (8, 1), (9, 1), (16, 1)],
  term ((-2144 : Rat) / 299) [(3, 3), (8, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 13. -/
theorem rs_R003_ueqv_R003NY_partial_13_0216_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_13_0216
        rs_R003_ueqv_R003NY_generator_13_0200_0245 =
      rs_R003_ueqv_R003NY_partial_13_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 13. -/
def rs_R003_ueqv_R003NY_coefficient_13_0217 : Poly :=
[
  term ((1256 : Rat) / 299) [(3, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 217 for generator 13. -/
def rs_R003_ueqv_R003NY_partial_13_0217 : Poly :=
[
  term ((2512 : Rat) / 299) [(2, 1), (3, 1), (4, 1), (8, 1), (11, 1), (16, 1)],
  term ((-1256 : Rat) / 299) [(2, 2), (3, 1), (8, 1), (11, 1), (16, 1)],
  term ((2512 : Rat) / 299) [(3, 2), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((-1256 : Rat) / 299) [(3, 3), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 13. -/
theorem rs_R003_ueqv_R003NY_partial_13_0217_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_13_0217
        rs_R003_ueqv_R003NY_generator_13_0200_0245 =
      rs_R003_ueqv_R003NY_partial_13_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 13. -/
def rs_R003_ueqv_R003NY_coefficient_13_0218 : Poly :=
[
  term ((96 : Rat) / 13) [(3, 1), (8, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 218 for generator 13. -/
def rs_R003_ueqv_R003NY_partial_13_0218 : Poly :=
[
  term ((192 : Rat) / 13) [(2, 1), (3, 1), (4, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-96 : Rat) / 13) [(2, 2), (3, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((192 : Rat) / 13) [(3, 2), (5, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-96 : Rat) / 13) [(3, 3), (8, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 13. -/
theorem rs_R003_ueqv_R003NY_partial_13_0218_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_13_0218
        rs_R003_ueqv_R003NY_generator_13_0200_0245 =
      rs_R003_ueqv_R003NY_partial_13_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 13. -/
def rs_R003_ueqv_R003NY_coefficient_13_0219 : Poly :=
[
  term ((-24 : Rat) / 13) [(3, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 219 for generator 13. -/
def rs_R003_ueqv_R003NY_partial_13_0219 : Poly :=
[
  term ((-48 : Rat) / 13) [(2, 1), (3, 1), (4, 1), (8, 1), (13, 1), (16, 1)],
  term ((24 : Rat) / 13) [(2, 2), (3, 1), (8, 1), (13, 1), (16, 1)],
  term ((-48 : Rat) / 13) [(3, 2), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((24 : Rat) / 13) [(3, 3), (8, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 13. -/
theorem rs_R003_ueqv_R003NY_partial_13_0219_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_13_0219
        rs_R003_ueqv_R003NY_generator_13_0200_0245 =
      rs_R003_ueqv_R003NY_partial_13_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 13. -/
def rs_R003_ueqv_R003NY_coefficient_13_0220 : Poly :=
[
  term ((-76 : Rat) / 299) [(3, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 220 for generator 13. -/
def rs_R003_ueqv_R003NY_partial_13_0220 : Poly :=
[
  term ((-152 : Rat) / 299) [(2, 1), (3, 1), (4, 1), (8, 1), (15, 1), (16, 1)],
  term ((76 : Rat) / 299) [(2, 2), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((-152 : Rat) / 299) [(3, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((76 : Rat) / 299) [(3, 3), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 13. -/
theorem rs_R003_ueqv_R003NY_partial_13_0220_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_13_0220
        rs_R003_ueqv_R003NY_generator_13_0200_0245 =
      rs_R003_ueqv_R003NY_partial_13_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 13. -/
def rs_R003_ueqv_R003NY_coefficient_13_0221 : Poly :=
[
  term ((-8180 : Rat) / 299) [(3, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 221 for generator 13. -/
def rs_R003_ueqv_R003NY_partial_13_0221 : Poly :=
[
  term ((-16360 : Rat) / 299) [(2, 1), (3, 1), (4, 1), (9, 1), (14, 1), (16, 1)],
  term ((8180 : Rat) / 299) [(2, 2), (3, 1), (9, 1), (14, 1), (16, 1)],
  term ((-16360 : Rat) / 299) [(3, 2), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((8180 : Rat) / 299) [(3, 3), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 13. -/
theorem rs_R003_ueqv_R003NY_partial_13_0221_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_13_0221
        rs_R003_ueqv_R003NY_generator_13_0200_0245 =
      rs_R003_ueqv_R003NY_partial_13_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 13. -/
def rs_R003_ueqv_R003NY_coefficient_13_0222 : Poly :=
[
  term ((6524 : Rat) / 299) [(3, 1), (9, 1), (16, 1)]
]

/-- Partial product 222 for generator 13. -/
def rs_R003_ueqv_R003NY_partial_13_0222 : Poly :=
[
  term ((13048 : Rat) / 299) [(2, 1), (3, 1), (4, 1), (9, 1), (16, 1)],
  term ((-6524 : Rat) / 299) [(2, 2), (3, 1), (9, 1), (16, 1)],
  term ((13048 : Rat) / 299) [(3, 2), (5, 1), (9, 1), (16, 1)],
  term ((-6524 : Rat) / 299) [(3, 3), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 13. -/
theorem rs_R003_ueqv_R003NY_partial_13_0222_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_13_0222
        rs_R003_ueqv_R003NY_generator_13_0200_0245 =
      rs_R003_ueqv_R003NY_partial_13_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 13. -/
def rs_R003_ueqv_R003NY_coefficient_13_0223 : Poly :=
[
  term ((1256 : Rat) / 299) [(3, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 223 for generator 13. -/
def rs_R003_ueqv_R003NY_partial_13_0223 : Poly :=
[
  term ((2512 : Rat) / 299) [(2, 1), (3, 1), (4, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1256 : Rat) / 299) [(2, 2), (3, 1), (11, 1), (14, 1), (16, 1)],
  term ((2512 : Rat) / 299) [(3, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1256 : Rat) / 299) [(3, 3), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 13. -/
theorem rs_R003_ueqv_R003NY_partial_13_0223_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_13_0223
        rs_R003_ueqv_R003NY_generator_13_0200_0245 =
      rs_R003_ueqv_R003NY_partial_13_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 13. -/
def rs_R003_ueqv_R003NY_coefficient_13_0224 : Poly :=
[
  term ((-1256 : Rat) / 299) [(3, 1), (11, 1), (16, 1)]
]

/-- Partial product 224 for generator 13. -/
def rs_R003_ueqv_R003NY_partial_13_0224 : Poly :=
[
  term ((-2512 : Rat) / 299) [(2, 1), (3, 1), (4, 1), (11, 1), (16, 1)],
  term ((1256 : Rat) / 299) [(2, 2), (3, 1), (11, 1), (16, 1)],
  term ((-2512 : Rat) / 299) [(3, 2), (5, 1), (11, 1), (16, 1)],
  term ((1256 : Rat) / 299) [(3, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 13. -/
theorem rs_R003_ueqv_R003NY_partial_13_0224_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_13_0224
        rs_R003_ueqv_R003NY_generator_13_0200_0245 =
      rs_R003_ueqv_R003NY_partial_13_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 13. -/
def rs_R003_ueqv_R003NY_coefficient_13_0225 : Poly :=
[
  term ((-48 : Rat) / 13) [(3, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 225 for generator 13. -/
def rs_R003_ueqv_R003NY_partial_13_0225 : Poly :=
[
  term ((-96 : Rat) / 13) [(2, 1), (3, 1), (4, 1), (13, 1), (14, 1), (16, 1)],
  term ((48 : Rat) / 13) [(2, 2), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((-96 : Rat) / 13) [(3, 2), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((48 : Rat) / 13) [(3, 3), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 13. -/
theorem rs_R003_ueqv_R003NY_partial_13_0225_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_13_0225
        rs_R003_ueqv_R003NY_generator_13_0200_0245 =
      rs_R003_ueqv_R003NY_partial_13_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 13. -/
def rs_R003_ueqv_R003NY_coefficient_13_0226 : Poly :=
[
  term ((-24 : Rat) / 13) [(3, 1), (13, 1), (16, 1)]
]

/-- Partial product 226 for generator 13. -/
def rs_R003_ueqv_R003NY_partial_13_0226 : Poly :=
[
  term ((-48 : Rat) / 13) [(2, 1), (3, 1), (4, 1), (13, 1), (16, 1)],
  term ((24 : Rat) / 13) [(2, 2), (3, 1), (13, 1), (16, 1)],
  term ((-48 : Rat) / 13) [(3, 2), (5, 1), (13, 1), (16, 1)],
  term ((24 : Rat) / 13) [(3, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 13. -/
theorem rs_R003_ueqv_R003NY_partial_13_0226_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_13_0226
        rs_R003_ueqv_R003NY_generator_13_0200_0245 =
      rs_R003_ueqv_R003NY_partial_13_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 13. -/
def rs_R003_ueqv_R003NY_coefficient_13_0227 : Poly :=
[
  term (6 : Rat) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 227 for generator 13. -/
def rs_R003_ueqv_R003NY_partial_13_0227 : Poly :=
[
  term (12 : Rat) [(2, 1), (3, 1), (4, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(2, 2), (3, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(3, 2), (5, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(3, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 13. -/
theorem rs_R003_ueqv_R003NY_partial_13_0227_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_13_0227
        rs_R003_ueqv_R003NY_generator_13_0200_0245 =
      rs_R003_ueqv_R003NY_partial_13_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 13. -/
def rs_R003_ueqv_R003NY_coefficient_13_0228 : Poly :=
[
  term ((-72 : Rat) / 13) [(3, 2), (8, 1), (16, 1)]
]

/-- Partial product 228 for generator 13. -/
def rs_R003_ueqv_R003NY_partial_13_0228 : Poly :=
[
  term ((-144 : Rat) / 13) [(2, 1), (3, 2), (4, 1), (8, 1), (16, 1)],
  term ((72 : Rat) / 13) [(2, 2), (3, 2), (8, 1), (16, 1)],
  term ((-144 : Rat) / 13) [(3, 3), (5, 1), (8, 1), (16, 1)],
  term ((72 : Rat) / 13) [(3, 4), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 13. -/
theorem rs_R003_ueqv_R003NY_partial_13_0228_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_13_0228
        rs_R003_ueqv_R003NY_generator_13_0200_0245 =
      rs_R003_ueqv_R003NY_partial_13_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 13. -/
def rs_R003_ueqv_R003NY_coefficient_13_0229 : Poly :=
[
  term ((-60 : Rat) / 13) [(3, 2), (14, 1), (16, 1)]
]

/-- Partial product 229 for generator 13. -/
def rs_R003_ueqv_R003NY_partial_13_0229 : Poly :=
[
  term ((-120 : Rat) / 13) [(2, 1), (3, 2), (4, 1), (14, 1), (16, 1)],
  term ((60 : Rat) / 13) [(2, 2), (3, 2), (14, 1), (16, 1)],
  term ((-120 : Rat) / 13) [(3, 3), (5, 1), (14, 1), (16, 1)],
  term ((60 : Rat) / 13) [(3, 4), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 13. -/
theorem rs_R003_ueqv_R003NY_partial_13_0229_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_13_0229
        rs_R003_ueqv_R003NY_generator_13_0200_0245 =
      rs_R003_ueqv_R003NY_partial_13_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 13. -/
def rs_R003_ueqv_R003NY_coefficient_13_0230 : Poly :=
[
  term ((72 : Rat) / 13) [(3, 2), (16, 1)]
]

/-- Partial product 230 for generator 13. -/
def rs_R003_ueqv_R003NY_partial_13_0230 : Poly :=
[
  term ((144 : Rat) / 13) [(2, 1), (3, 2), (4, 1), (16, 1)],
  term ((-72 : Rat) / 13) [(2, 2), (3, 2), (16, 1)],
  term ((144 : Rat) / 13) [(3, 3), (5, 1), (16, 1)],
  term ((-72 : Rat) / 13) [(3, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 13. -/
theorem rs_R003_ueqv_R003NY_partial_13_0230_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_13_0230
        rs_R003_ueqv_R003NY_generator_13_0200_0245 =
      rs_R003_ueqv_R003NY_partial_13_0230 := by
  native_decide

/-- Coefficient term 231 from coefficient polynomial 13. -/
def rs_R003_ueqv_R003NY_coefficient_13_0231 : Poly :=
[
  term ((-36 : Rat) / 13) [(4, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 231 for generator 13. -/
def rs_R003_ueqv_R003NY_partial_13_0231 : Poly :=
[
  term ((-72 : Rat) / 13) [(2, 1), (4, 2), (9, 1), (13, 1), (16, 1)],
  term ((36 : Rat) / 13) [(2, 2), (4, 1), (9, 1), (13, 1), (16, 1)],
  term ((-72 : Rat) / 13) [(3, 1), (4, 1), (5, 1), (9, 1), (13, 1), (16, 1)],
  term ((36 : Rat) / 13) [(3, 2), (4, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 231 for generator 13. -/
theorem rs_R003_ueqv_R003NY_partial_13_0231_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_13_0231
        rs_R003_ueqv_R003NY_generator_13_0200_0245 =
      rs_R003_ueqv_R003NY_partial_13_0231 := by
  native_decide

/-- Coefficient term 232 from coefficient polynomial 13. -/
def rs_R003_ueqv_R003NY_coefficient_13_0232 : Poly :=
[
  term ((36 : Rat) / 13) [(4, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 232 for generator 13. -/
def rs_R003_ueqv_R003NY_partial_13_0232 : Poly :=
[
  term ((72 : Rat) / 13) [(2, 1), (4, 2), (13, 1), (15, 1), (16, 1)],
  term ((-36 : Rat) / 13) [(2, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((72 : Rat) / 13) [(3, 1), (4, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-36 : Rat) / 13) [(3, 2), (4, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 232 for generator 13. -/
theorem rs_R003_ueqv_R003NY_partial_13_0232_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_13_0232
        rs_R003_ueqv_R003NY_generator_13_0200_0245 =
      rs_R003_ueqv_R003NY_partial_13_0232 := by
  native_decide

/-- Coefficient term 233 from coefficient polynomial 13. -/
def rs_R003_ueqv_R003NY_coefficient_13_0233 : Poly :=
[
  term ((36 : Rat) / 13) [(5, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 233 for generator 13. -/
def rs_R003_ueqv_R003NY_partial_13_0233 : Poly :=
[
  term ((72 : Rat) / 13) [(2, 1), (4, 1), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((-36 : Rat) / 13) [(2, 2), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((72 : Rat) / 13) [(3, 1), (5, 2), (8, 1), (13, 1), (16, 1)],
  term ((-36 : Rat) / 13) [(3, 2), (5, 1), (8, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 233 for generator 13. -/
theorem rs_R003_ueqv_R003NY_partial_13_0233_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_13_0233
        rs_R003_ueqv_R003NY_generator_13_0200_0245 =
      rs_R003_ueqv_R003NY_partial_13_0233 := by
  native_decide

/-- Coefficient term 234 from coefficient polynomial 13. -/
def rs_R003_ueqv_R003NY_coefficient_13_0234 : Poly :=
[
  term ((12 : Rat) / 13) [(5, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 234 for generator 13. -/
def rs_R003_ueqv_R003NY_partial_13_0234 : Poly :=
[
  term ((24 : Rat) / 13) [(2, 1), (4, 1), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((-12 : Rat) / 13) [(2, 2), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((24 : Rat) / 13) [(3, 1), (5, 2), (13, 1), (14, 1), (16, 1)],
  term ((-12 : Rat) / 13) [(3, 2), (5, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 234 for generator 13. -/
theorem rs_R003_ueqv_R003NY_partial_13_0234_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_13_0234
        rs_R003_ueqv_R003NY_generator_13_0200_0245 =
      rs_R003_ueqv_R003NY_partial_13_0234 := by
  native_decide

/-- Coefficient term 235 from coefficient polynomial 13. -/
def rs_R003_ueqv_R003NY_coefficient_13_0235 : Poly :=
[
  term ((36 : Rat) / 13) [(5, 1), (13, 1), (16, 1)]
]

/-- Partial product 235 for generator 13. -/
def rs_R003_ueqv_R003NY_partial_13_0235 : Poly :=
[
  term ((72 : Rat) / 13) [(2, 1), (4, 1), (5, 1), (13, 1), (16, 1)],
  term ((-36 : Rat) / 13) [(2, 2), (5, 1), (13, 1), (16, 1)],
  term ((72 : Rat) / 13) [(3, 1), (5, 2), (13, 1), (16, 1)],
  term ((-36 : Rat) / 13) [(3, 2), (5, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 235 for generator 13. -/
theorem rs_R003_ueqv_R003NY_partial_13_0235_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_13_0235
        rs_R003_ueqv_R003NY_generator_13_0200_0245 =
      rs_R003_ueqv_R003NY_partial_13_0235 := by
  native_decide

/-- Coefficient term 236 from coefficient polynomial 13. -/
def rs_R003_ueqv_R003NY_coefficient_13_0236 : Poly :=
[
  term ((-24 : Rat) / 13) [(8, 1), (9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 236 for generator 13. -/
def rs_R003_ueqv_R003NY_partial_13_0236 : Poly :=
[
  term ((-48 : Rat) / 13) [(2, 1), (4, 1), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((24 : Rat) / 13) [(2, 2), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-48 : Rat) / 13) [(3, 1), (5, 1), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((24 : Rat) / 13) [(3, 2), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 236 for generator 13. -/
theorem rs_R003_ueqv_R003NY_partial_13_0236_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_13_0236
        rs_R003_ueqv_R003NY_generator_13_0200_0245 =
      rs_R003_ueqv_R003NY_partial_13_0236 := by
  native_decide

/-- Coefficient term 237 from coefficient polynomial 13. -/
def rs_R003_ueqv_R003NY_coefficient_13_0237 : Poly :=
[
  term ((12 : Rat) / 13) [(8, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 237 for generator 13. -/
def rs_R003_ueqv_R003NY_partial_13_0237 : Poly :=
[
  term ((24 : Rat) / 13) [(2, 1), (4, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-12 : Rat) / 13) [(2, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((24 : Rat) / 13) [(3, 1), (5, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-12 : Rat) / 13) [(3, 2), (8, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 237 for generator 13. -/
theorem rs_R003_ueqv_R003NY_partial_13_0237_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_13_0237
        rs_R003_ueqv_R003NY_generator_13_0200_0245 =
      rs_R003_ueqv_R003NY_partial_13_0237 := by
  native_decide

/-- Coefficient term 238 from coefficient polynomial 13. -/
def rs_R003_ueqv_R003NY_coefficient_13_0238 : Poly :=
[
  term ((1256 : Rat) / 299) [(9, 1), (11, 1), (16, 1)]
]

/-- Partial product 238 for generator 13. -/
def rs_R003_ueqv_R003NY_partial_13_0238 : Poly :=
[
  term ((2512 : Rat) / 299) [(2, 1), (4, 1), (9, 1), (11, 1), (16, 1)],
  term ((-1256 : Rat) / 299) [(2, 2), (9, 1), (11, 1), (16, 1)],
  term ((2512 : Rat) / 299) [(3, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((-1256 : Rat) / 299) [(3, 2), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 238 for generator 13. -/
theorem rs_R003_ueqv_R003NY_partial_13_0238_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_13_0238
        rs_R003_ueqv_R003NY_generator_13_0200_0245 =
      rs_R003_ueqv_R003NY_partial_13_0238 := by
  native_decide

/-- Coefficient term 239 from coefficient polynomial 13. -/
def rs_R003_ueqv_R003NY_coefficient_13_0239 : Poly :=
[
  term ((96 : Rat) / 13) [(9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 239 for generator 13. -/
def rs_R003_ueqv_R003NY_partial_13_0239 : Poly :=
[
  term ((192 : Rat) / 13) [(2, 1), (4, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-96 : Rat) / 13) [(2, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((192 : Rat) / 13) [(3, 1), (5, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-96 : Rat) / 13) [(3, 2), (9, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 239 for generator 13. -/
theorem rs_R003_ueqv_R003NY_partial_13_0239_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_13_0239
        rs_R003_ueqv_R003NY_generator_13_0200_0245 =
      rs_R003_ueqv_R003NY_partial_13_0239 := by
  native_decide

/-- Coefficient term 240 from coefficient polynomial 13. -/
def rs_R003_ueqv_R003NY_coefficient_13_0240 : Poly :=
[
  term ((30 : Rat) / 13) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 240 for generator 13. -/
def rs_R003_ueqv_R003NY_partial_13_0240 : Poly :=
[
  term ((60 : Rat) / 13) [(2, 1), (4, 1), (9, 1), (13, 1), (16, 1)],
  term ((-30 : Rat) / 13) [(2, 2), (9, 1), (13, 1), (16, 1)],
  term ((60 : Rat) / 13) [(3, 1), (5, 1), (9, 1), (13, 1), (16, 1)],
  term ((-30 : Rat) / 13) [(3, 2), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 240 for generator 13. -/
theorem rs_R003_ueqv_R003NY_partial_13_0240_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_13_0240
        rs_R003_ueqv_R003NY_generator_13_0200_0245 =
      rs_R003_ueqv_R003NY_partial_13_0240 := by
  native_decide

/-- Coefficient term 241 from coefficient polynomial 13. -/
def rs_R003_ueqv_R003NY_coefficient_13_0241 : Poly :=
[
  term ((-76 : Rat) / 299) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 241 for generator 13. -/
def rs_R003_ueqv_R003NY_partial_13_0241 : Poly :=
[
  term ((-152 : Rat) / 299) [(2, 1), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((76 : Rat) / 299) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((-152 : Rat) / 299) [(3, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((76 : Rat) / 299) [(3, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 241 for generator 13. -/
theorem rs_R003_ueqv_R003NY_partial_13_0241_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_13_0241
        rs_R003_ueqv_R003NY_generator_13_0200_0245 =
      rs_R003_ueqv_R003NY_partial_13_0241 := by
  native_decide

/-- Coefficient term 242 from coefficient polynomial 13. -/
def rs_R003_ueqv_R003NY_coefficient_13_0242 : Poly :=
[
  term ((-16 : Rat) / 13) [(9, 2), (16, 1)]
]

/-- Partial product 242 for generator 13. -/
def rs_R003_ueqv_R003NY_partial_13_0242 : Poly :=
[
  term ((-32 : Rat) / 13) [(2, 1), (4, 1), (9, 2), (16, 1)],
  term ((16 : Rat) / 13) [(2, 2), (9, 2), (16, 1)],
  term ((-32 : Rat) / 13) [(3, 1), (5, 1), (9, 2), (16, 1)],
  term ((16 : Rat) / 13) [(3, 2), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 242 for generator 13. -/
theorem rs_R003_ueqv_R003NY_partial_13_0242_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_13_0242
        rs_R003_ueqv_R003NY_generator_13_0200_0245 =
      rs_R003_ueqv_R003NY_partial_13_0242 := by
  native_decide

/-- Coefficient term 243 from coefficient polynomial 13. -/
def rs_R003_ueqv_R003NY_coefficient_13_0243 : Poly :=
[
  term ((-6 : Rat) / 13) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 243 for generator 13. -/
def rs_R003_ueqv_R003NY_partial_13_0243 : Poly :=
[
  term ((-12 : Rat) / 13) [(2, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((6 : Rat) / 13) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((-12 : Rat) / 13) [(3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((6 : Rat) / 13) [(3, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 243 for generator 13. -/
theorem rs_R003_ueqv_R003NY_partial_13_0243_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_13_0243
        rs_R003_ueqv_R003NY_generator_13_0200_0245 =
      rs_R003_ueqv_R003NY_partial_13_0243 := by
  native_decide

/-- Coefficient term 244 from coefficient polynomial 13. -/
def rs_R003_ueqv_R003NY_coefficient_13_0244 : Poly :=
[
  term ((-628 : Rat) / 299) [(14, 1), (16, 1)]
]

/-- Partial product 244 for generator 13. -/
def rs_R003_ueqv_R003NY_partial_13_0244 : Poly :=
[
  term ((-1256 : Rat) / 299) [(2, 1), (4, 1), (14, 1), (16, 1)],
  term ((628 : Rat) / 299) [(2, 2), (14, 1), (16, 1)],
  term ((-1256 : Rat) / 299) [(3, 1), (5, 1), (14, 1), (16, 1)],
  term ((628 : Rat) / 299) [(3, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 244 for generator 13. -/
theorem rs_R003_ueqv_R003NY_partial_13_0244_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_13_0244
        rs_R003_ueqv_R003NY_generator_13_0200_0245 =
      rs_R003_ueqv_R003NY_partial_13_0244 := by
  native_decide

/-- Coefficient term 245 from coefficient polynomial 13. -/
def rs_R003_ueqv_R003NY_coefficient_13_0245 : Poly :=
[
  term ((628 : Rat) / 299) [(16, 1)]
]

/-- Partial product 245 for generator 13. -/
def rs_R003_ueqv_R003NY_partial_13_0245 : Poly :=
[
  term ((1256 : Rat) / 299) [(2, 1), (4, 1), (16, 1)],
  term ((-628 : Rat) / 299) [(2, 2), (16, 1)],
  term ((1256 : Rat) / 299) [(3, 1), (5, 1), (16, 1)],
  term ((-628 : Rat) / 299) [(3, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 245 for generator 13. -/
theorem rs_R003_ueqv_R003NY_partial_13_0245_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_13_0245
        rs_R003_ueqv_R003NY_generator_13_0200_0245 =
      rs_R003_ueqv_R003NY_partial_13_0245 := by
  native_decide

/-- Partial products in this block. -/
def rs_R003_ueqv_R003NY_partials_13_0200_0245 : List Poly :=
[
  rs_R003_ueqv_R003NY_partial_13_0200,
  rs_R003_ueqv_R003NY_partial_13_0201,
  rs_R003_ueqv_R003NY_partial_13_0202,
  rs_R003_ueqv_R003NY_partial_13_0203,
  rs_R003_ueqv_R003NY_partial_13_0204,
  rs_R003_ueqv_R003NY_partial_13_0205,
  rs_R003_ueqv_R003NY_partial_13_0206,
  rs_R003_ueqv_R003NY_partial_13_0207,
  rs_R003_ueqv_R003NY_partial_13_0208,
  rs_R003_ueqv_R003NY_partial_13_0209,
  rs_R003_ueqv_R003NY_partial_13_0210,
  rs_R003_ueqv_R003NY_partial_13_0211,
  rs_R003_ueqv_R003NY_partial_13_0212,
  rs_R003_ueqv_R003NY_partial_13_0213,
  rs_R003_ueqv_R003NY_partial_13_0214,
  rs_R003_ueqv_R003NY_partial_13_0215,
  rs_R003_ueqv_R003NY_partial_13_0216,
  rs_R003_ueqv_R003NY_partial_13_0217,
  rs_R003_ueqv_R003NY_partial_13_0218,
  rs_R003_ueqv_R003NY_partial_13_0219,
  rs_R003_ueqv_R003NY_partial_13_0220,
  rs_R003_ueqv_R003NY_partial_13_0221,
  rs_R003_ueqv_R003NY_partial_13_0222,
  rs_R003_ueqv_R003NY_partial_13_0223,
  rs_R003_ueqv_R003NY_partial_13_0224,
  rs_R003_ueqv_R003NY_partial_13_0225,
  rs_R003_ueqv_R003NY_partial_13_0226,
  rs_R003_ueqv_R003NY_partial_13_0227,
  rs_R003_ueqv_R003NY_partial_13_0228,
  rs_R003_ueqv_R003NY_partial_13_0229,
  rs_R003_ueqv_R003NY_partial_13_0230,
  rs_R003_ueqv_R003NY_partial_13_0231,
  rs_R003_ueqv_R003NY_partial_13_0232,
  rs_R003_ueqv_R003NY_partial_13_0233,
  rs_R003_ueqv_R003NY_partial_13_0234,
  rs_R003_ueqv_R003NY_partial_13_0235,
  rs_R003_ueqv_R003NY_partial_13_0236,
  rs_R003_ueqv_R003NY_partial_13_0237,
  rs_R003_ueqv_R003NY_partial_13_0238,
  rs_R003_ueqv_R003NY_partial_13_0239,
  rs_R003_ueqv_R003NY_partial_13_0240,
  rs_R003_ueqv_R003NY_partial_13_0241,
  rs_R003_ueqv_R003NY_partial_13_0242,
  rs_R003_ueqv_R003NY_partial_13_0243,
  rs_R003_ueqv_R003NY_partial_13_0244,
  rs_R003_ueqv_R003NY_partial_13_0245
]

/-- Sum of partial products in this block. -/
def rs_R003_ueqv_R003NY_block_13_0200_0245 : Poly :=
[
  term ((-10048 : Rat) / 299) [(2, 1), (3, 1), (4, 1), (5, 1), (8, 1), (14, 1), (16, 1)],
  term ((10048 : Rat) / 299) [(2, 1), (3, 1), (4, 1), (5, 1), (8, 1), (16, 1)],
  term ((-5024 : Rat) / 299) [(2, 1), (3, 1), (4, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((4288 : Rat) / 299) [(2, 1), (3, 1), (4, 1), (8, 1), (9, 1), (16, 1)],
  term ((2512 : Rat) / 299) [(2, 1), (3, 1), (4, 1), (8, 1), (11, 1), (16, 1)],
  term ((192 : Rat) / 13) [(2, 1), (3, 1), (4, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-48 : Rat) / 13) [(2, 1), (3, 1), (4, 1), (8, 1), (13, 1), (16, 1)],
  term ((-152 : Rat) / 299) [(2, 1), (3, 1), (4, 1), (8, 1), (15, 1), (16, 1)],
  term ((-16360 : Rat) / 299) [(2, 1), (3, 1), (4, 1), (9, 1), (14, 1), (16, 1)],
  term ((13048 : Rat) / 299) [(2, 1), (3, 1), (4, 1), (9, 1), (16, 1)],
  term ((2512 : Rat) / 299) [(2, 1), (3, 1), (4, 1), (11, 1), (14, 1), (16, 1)],
  term ((-2512 : Rat) / 299) [(2, 1), (3, 1), (4, 1), (11, 1), (16, 1)],
  term ((-96 : Rat) / 13) [(2, 1), (3, 1), (4, 1), (13, 1), (14, 1), (16, 1)],
  term ((-48 : Rat) / 13) [(2, 1), (3, 1), (4, 1), (13, 1), (16, 1)],
  term (12 : Rat) [(2, 1), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((10048 : Rat) / 299) [(2, 1), (3, 1), (4, 2), (9, 1), (14, 1), (16, 1)],
  term ((-10048 : Rat) / 299) [(2, 1), (3, 1), (4, 2), (9, 1), (16, 1)],
  term ((96 : Rat) / 13) [(2, 1), (3, 1), (4, 2), (13, 1), (14, 1), (16, 1)],
  term ((-72 : Rat) / 13) [(2, 1), (3, 1), (4, 2), (15, 1), (16, 1)],
  term ((-144 : Rat) / 13) [(2, 1), (3, 2), (4, 1), (8, 1), (16, 1)],
  term ((-120 : Rat) / 13) [(2, 1), (3, 2), (4, 1), (14, 1), (16, 1)],
  term ((144 : Rat) / 13) [(2, 1), (3, 2), (4, 1), (16, 1)],
  term ((72 : Rat) / 13) [(2, 1), (4, 1), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((24 : Rat) / 13) [(2, 1), (4, 1), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((72 : Rat) / 13) [(2, 1), (4, 1), (5, 1), (13, 1), (16, 1)],
  term ((-48 : Rat) / 13) [(2, 1), (4, 1), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((24 : Rat) / 13) [(2, 1), (4, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((2512 : Rat) / 299) [(2, 1), (4, 1), (9, 1), (11, 1), (16, 1)],
  term ((192 : Rat) / 13) [(2, 1), (4, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((60 : Rat) / 13) [(2, 1), (4, 1), (9, 1), (13, 1), (16, 1)],
  term ((-152 : Rat) / 299) [(2, 1), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 13) [(2, 1), (4, 1), (9, 2), (16, 1)],
  term ((-12 : Rat) / 13) [(2, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1256 : Rat) / 299) [(2, 1), (4, 1), (14, 1), (16, 1)],
  term ((1256 : Rat) / 299) [(2, 1), (4, 1), (16, 1)],
  term ((-72 : Rat) / 13) [(2, 1), (4, 2), (9, 1), (13, 1), (16, 1)],
  term ((72 : Rat) / 13) [(2, 1), (4, 2), (13, 1), (15, 1), (16, 1)],
  term ((-5024 : Rat) / 299) [(2, 2), (3, 1), (4, 1), (9, 1), (14, 1), (16, 1)],
  term ((5024 : Rat) / 299) [(2, 2), (3, 1), (4, 1), (9, 1), (16, 1)],
  term ((-48 : Rat) / 13) [(2, 2), (3, 1), (4, 1), (13, 1), (14, 1), (16, 1)],
  term ((36 : Rat) / 13) [(2, 2), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((5024 : Rat) / 299) [(2, 2), (3, 1), (5, 1), (8, 1), (14, 1), (16, 1)],
  term ((-5024 : Rat) / 299) [(2, 2), (3, 1), (5, 1), (8, 1), (16, 1)],
  term ((14400 : Rat) / 299) [(2, 2), (3, 1), (5, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3600 : Rat) / 299) [(2, 2), (3, 1), (5, 1), (9, 1), (13, 1), (16, 1)],
  term ((17280 : Rat) / 299) [(2, 2), (3, 1), (5, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8640 : Rat) / 299) [(2, 2), (3, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-2400 : Rat) / 299) [(2, 2), (3, 1), (5, 1), (9, 2), (16, 1)],
  term ((480 : Rat) / 299) [(2, 2), (3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((7200 : Rat) / 299) [(2, 2), (3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((720 : Rat) / 299) [(2, 2), (3, 1), (5, 1), (14, 1), (16, 1)],
  term ((-720 : Rat) / 299) [(2, 2), (3, 1), (5, 1), (16, 1)],
  term ((2512 : Rat) / 299) [(2, 2), (3, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((-2144 : Rat) / 299) [(2, 2), (3, 1), (8, 1), (9, 1), (16, 1)],
  term ((-1256 : Rat) / 299) [(2, 2), (3, 1), (8, 1), (11, 1), (16, 1)],
  term ((-96 : Rat) / 13) [(2, 2), (3, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((24 : Rat) / 13) [(2, 2), (3, 1), (8, 1), (13, 1), (16, 1)],
  term ((76 : Rat) / 299) [(2, 2), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((8180 : Rat) / 299) [(2, 2), (3, 1), (9, 1), (14, 1), (16, 1)],
  term ((-6524 : Rat) / 299) [(2, 2), (3, 1), (9, 1), (16, 1)],
  term ((-1256 : Rat) / 299) [(2, 2), (3, 1), (11, 1), (14, 1), (16, 1)],
  term ((1256 : Rat) / 299) [(2, 2), (3, 1), (11, 1), (16, 1)],
  term ((48 : Rat) / 13) [(2, 2), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((24 : Rat) / 13) [(2, 2), (3, 1), (13, 1), (16, 1)],
  term (-6 : Rat) [(2, 2), (3, 1), (15, 1), (16, 1)],
  term ((72 : Rat) / 13) [(2, 2), (3, 2), (8, 1), (16, 1)],
  term ((-7200 : Rat) / 299) [(2, 2), (3, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(2, 2), (3, 2), (9, 1), (13, 1), (16, 1)],
  term ((-8640 : Rat) / 299) [(2, 2), (3, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(2, 2), (3, 2), (9, 1), (15, 1), (16, 1)],
  term ((1200 : Rat) / 299) [(2, 2), (3, 2), (9, 2), (16, 1)],
  term ((-240 : Rat) / 299) [(2, 2), (3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-3600 : Rat) / 299) [(2, 2), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((1020 : Rat) / 299) [(2, 2), (3, 2), (14, 1), (16, 1)],
  term ((-1296 : Rat) / 299) [(2, 2), (3, 2), (16, 1)],
  term ((36 : Rat) / 13) [(2, 2), (4, 1), (9, 1), (13, 1), (16, 1)],
  term ((-36 : Rat) / 13) [(2, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-36 : Rat) / 13) [(2, 2), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((-12 : Rat) / 13) [(2, 2), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((-36 : Rat) / 13) [(2, 2), (5, 1), (13, 1), (16, 1)],
  term ((24 : Rat) / 13) [(2, 2), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-12 : Rat) / 13) [(2, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-1256 : Rat) / 299) [(2, 2), (9, 1), (11, 1), (16, 1)],
  term ((-96 : Rat) / 13) [(2, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-30 : Rat) / 13) [(2, 2), (9, 1), (13, 1), (16, 1)],
  term ((76 : Rat) / 299) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 13) [(2, 2), (9, 2), (16, 1)],
  term ((6 : Rat) / 13) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((628 : Rat) / 299) [(2, 2), (14, 1), (16, 1)],
  term ((-628 : Rat) / 299) [(2, 2), (16, 1)],
  term ((14400 : Rat) / 299) [(2, 3), (4, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3600 : Rat) / 299) [(2, 3), (4, 1), (9, 1), (13, 1), (16, 1)],
  term ((17280 : Rat) / 299) [(2, 3), (4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8640 : Rat) / 299) [(2, 3), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-2400 : Rat) / 299) [(2, 3), (4, 1), (9, 2), (16, 1)],
  term ((480 : Rat) / 299) [(2, 3), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((7200 : Rat) / 299) [(2, 3), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((720 : Rat) / 299) [(2, 3), (4, 1), (14, 1), (16, 1)],
  term ((-720 : Rat) / 299) [(2, 3), (4, 1), (16, 1)],
  term ((-7200 : Rat) / 299) [(2, 4), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(2, 4), (9, 1), (13, 1), (16, 1)],
  term ((-8640 : Rat) / 299) [(2, 4), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(2, 4), (9, 1), (15, 1), (16, 1)],
  term ((1200 : Rat) / 299) [(2, 4), (9, 2), (16, 1)],
  term ((-240 : Rat) / 299) [(2, 4), (11, 1), (15, 1), (16, 1)],
  term ((-3600 : Rat) / 299) [(2, 4), (13, 1), (15, 1), (16, 1)],
  term ((-360 : Rat) / 299) [(2, 4), (14, 1), (16, 1)],
  term ((360 : Rat) / 299) [(2, 4), (16, 1)],
  term ((-72 : Rat) / 13) [(3, 1), (4, 1), (5, 1), (9, 1), (13, 1), (16, 1)],
  term ((72 : Rat) / 13) [(3, 1), (4, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-48 : Rat) / 13) [(3, 1), (5, 1), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((24 : Rat) / 13) [(3, 1), (5, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((2512 : Rat) / 299) [(3, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((192 : Rat) / 13) [(3, 1), (5, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((60 : Rat) / 13) [(3, 1), (5, 1), (9, 1), (13, 1), (16, 1)],
  term ((-152 : Rat) / 299) [(3, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 13) [(3, 1), (5, 1), (9, 2), (16, 1)],
  term ((-12 : Rat) / 13) [(3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1256 : Rat) / 299) [(3, 1), (5, 1), (14, 1), (16, 1)],
  term ((1256 : Rat) / 299) [(3, 1), (5, 1), (16, 1)],
  term ((72 : Rat) / 13) [(3, 1), (5, 2), (8, 1), (13, 1), (16, 1)],
  term ((24 : Rat) / 13) [(3, 1), (5, 2), (13, 1), (14, 1), (16, 1)],
  term ((72 : Rat) / 13) [(3, 1), (5, 2), (13, 1), (16, 1)],
  term ((10048 : Rat) / 299) [(3, 2), (4, 1), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((-10048 : Rat) / 299) [(3, 2), (4, 1), (5, 1), (9, 1), (16, 1)],
  term ((96 : Rat) / 13) [(3, 2), (4, 1), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((-72 : Rat) / 13) [(3, 2), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((36 : Rat) / 13) [(3, 2), (4, 1), (9, 1), (13, 1), (16, 1)],
  term ((-36 : Rat) / 13) [(3, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5024 : Rat) / 299) [(3, 2), (5, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((4288 : Rat) / 299) [(3, 2), (5, 1), (8, 1), (9, 1), (16, 1)],
  term ((2512 : Rat) / 299) [(3, 2), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((192 : Rat) / 13) [(3, 2), (5, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-84 : Rat) / 13) [(3, 2), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((-152 : Rat) / 299) [(3, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-16360 : Rat) / 299) [(3, 2), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((13048 : Rat) / 299) [(3, 2), (5, 1), (9, 1), (16, 1)],
  term ((2512 : Rat) / 299) [(3, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-2512 : Rat) / 299) [(3, 2), (5, 1), (11, 1), (16, 1)],
  term ((-108 : Rat) / 13) [(3, 2), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((-84 : Rat) / 13) [(3, 2), (5, 1), (13, 1), (16, 1)],
  term (12 : Rat) [(3, 2), (5, 1), (15, 1), (16, 1)],
  term ((-10048 : Rat) / 299) [(3, 2), (5, 2), (8, 1), (14, 1), (16, 1)],
  term ((10048 : Rat) / 299) [(3, 2), (5, 2), (8, 1), (16, 1)],
  term ((24 : Rat) / 13) [(3, 2), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-12 : Rat) / 13) [(3, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-1256 : Rat) / 299) [(3, 2), (9, 1), (11, 1), (16, 1)],
  term ((-96 : Rat) / 13) [(3, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-30 : Rat) / 13) [(3, 2), (9, 1), (13, 1), (16, 1)],
  term ((76 : Rat) / 299) [(3, 2), (9, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 13) [(3, 2), (9, 2), (16, 1)],
  term ((6 : Rat) / 13) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((628 : Rat) / 299) [(3, 2), (14, 1), (16, 1)],
  term ((-628 : Rat) / 299) [(3, 2), (16, 1)],
  term ((-5024 : Rat) / 299) [(3, 3), (4, 1), (9, 1), (14, 1), (16, 1)],
  term ((5024 : Rat) / 299) [(3, 3), (4, 1), (9, 1), (16, 1)],
  term ((-48 : Rat) / 13) [(3, 3), (4, 1), (13, 1), (14, 1), (16, 1)],
  term ((36 : Rat) / 13) [(3, 3), (4, 1), (15, 1), (16, 1)],
  term ((5024 : Rat) / 299) [(3, 3), (5, 1), (8, 1), (14, 1), (16, 1)],
  term ((-8336 : Rat) / 299) [(3, 3), (5, 1), (8, 1), (16, 1)],
  term ((-120 : Rat) / 13) [(3, 3), (5, 1), (14, 1), (16, 1)],
  term ((144 : Rat) / 13) [(3, 3), (5, 1), (16, 1)],
  term ((2512 : Rat) / 299) [(3, 3), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((-2144 : Rat) / 299) [(3, 3), (8, 1), (9, 1), (16, 1)],
  term ((-1256 : Rat) / 299) [(3, 3), (8, 1), (11, 1), (16, 1)],
  term ((-96 : Rat) / 13) [(3, 3), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((24 : Rat) / 13) [(3, 3), (8, 1), (13, 1), (16, 1)],
  term ((76 : Rat) / 299) [(3, 3), (8, 1), (15, 1), (16, 1)],
  term ((8180 : Rat) / 299) [(3, 3), (9, 1), (14, 1), (16, 1)],
  term ((-6524 : Rat) / 299) [(3, 3), (9, 1), (16, 1)],
  term ((-1256 : Rat) / 299) [(3, 3), (11, 1), (14, 1), (16, 1)],
  term ((1256 : Rat) / 299) [(3, 3), (11, 1), (16, 1)],
  term ((48 : Rat) / 13) [(3, 3), (13, 1), (14, 1), (16, 1)],
  term ((24 : Rat) / 13) [(3, 3), (13, 1), (16, 1)],
  term (-6 : Rat) [(3, 3), (15, 1), (16, 1)],
  term ((72 : Rat) / 13) [(3, 4), (8, 1), (16, 1)],
  term ((60 : Rat) / 13) [(3, 4), (14, 1), (16, 1)],
  term ((-72 : Rat) / 13) [(3, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 13, terms 200 through 245. -/
theorem rs_R003_ueqv_R003NY_block_13_0200_0245_valid :
    checkProductSumEq rs_R003_ueqv_R003NY_partials_13_0200_0245
      rs_R003_ueqv_R003NY_block_13_0200_0245 = true := by
  native_decide

end R003UeqvR003NYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
