/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R003:u=v:R003NY, term block 3:200-270

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R003UeqvR003NYTermShards

/-- Generator polynomial 3 for relaxed split surplus certificate `R003:u=v:R003NY`. -/
def rs_R003_ueqv_R003NY_generator_03_0200_0270 : Poly :=
[
  term (-2 : Rat) [(4, 1)],
  term (1 : Rat) [(4, 2)],
  term (1 : Rat) [(5, 2)],
  term (2 : Rat) [(8, 1)],
  term (-1 : Rat) [(8, 2)],
  term (-1 : Rat) [(9, 2)]
]

/-- Coefficient term 200 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003NY_coefficient_03_0200 : Poly :=
[
  term ((180 : Rat) / 23) [(2, 1), (12, 1), (16, 1)]
]

/-- Partial product 200 for generator 3. -/
def rs_R003_ueqv_R003NY_partial_03_0200 : Poly :=
[
  term ((-360 : Rat) / 23) [(2, 1), (4, 1), (12, 1), (16, 1)],
  term ((180 : Rat) / 23) [(2, 1), (4, 2), (12, 1), (16, 1)],
  term ((180 : Rat) / 23) [(2, 1), (5, 2), (12, 1), (16, 1)],
  term ((360 : Rat) / 23) [(2, 1), (8, 1), (12, 1), (16, 1)],
  term ((-180 : Rat) / 23) [(2, 1), (8, 2), (12, 1), (16, 1)],
  term ((-180 : Rat) / 23) [(2, 1), (9, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 3. -/
theorem rs_R003_ueqv_R003NY_partial_03_0200_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_03_0200
        rs_R003_ueqv_R003NY_generator_03_0200_0270 =
      rs_R003_ueqv_R003NY_partial_03_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003NY_coefficient_03_0201 : Poly :=
[
  term ((-1680 : Rat) / 299) [(2, 1), (12, 2), (16, 1)]
]

/-- Partial product 201 for generator 3. -/
def rs_R003_ueqv_R003NY_partial_03_0201 : Poly :=
[
  term ((3360 : Rat) / 299) [(2, 1), (4, 1), (12, 2), (16, 1)],
  term ((-1680 : Rat) / 299) [(2, 1), (4, 2), (12, 2), (16, 1)],
  term ((-1680 : Rat) / 299) [(2, 1), (5, 2), (12, 2), (16, 1)],
  term ((-3360 : Rat) / 299) [(2, 1), (8, 1), (12, 2), (16, 1)],
  term ((1680 : Rat) / 299) [(2, 1), (8, 2), (12, 2), (16, 1)],
  term ((1680 : Rat) / 299) [(2, 1), (9, 2), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 3. -/
theorem rs_R003_ueqv_R003NY_partial_03_0201_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_03_0201
        rs_R003_ueqv_R003NY_generator_03_0200_0270 =
      rs_R003_ueqv_R003NY_partial_03_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003NY_coefficient_03_0202 : Poly :=
[
  term ((-4320 : Rat) / 299) [(2, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 202 for generator 3. -/
def rs_R003_ueqv_R003NY_partial_03_0202 : Poly :=
[
  term ((8640 : Rat) / 299) [(2, 1), (4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(2, 1), (4, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(2, 1), (5, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8640 : Rat) / 299) [(2, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(2, 1), (8, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(2, 1), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 3. -/
theorem rs_R003_ueqv_R003NY_partial_03_0202_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_03_0202
        rs_R003_ueqv_R003NY_generator_03_0200_0270 =
      rs_R003_ueqv_R003NY_partial_03_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003NY_coefficient_03_0203 : Poly :=
[
  term ((2052 : Rat) / 299) [(2, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 203 for generator 3. -/
def rs_R003_ueqv_R003NY_partial_03_0203 : Poly :=
[
  term ((-4104 : Rat) / 299) [(2, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((2052 : Rat) / 299) [(2, 1), (4, 2), (13, 1), (15, 1), (16, 1)],
  term ((2052 : Rat) / 299) [(2, 1), (5, 2), (13, 1), (15, 1), (16, 1)],
  term ((4104 : Rat) / 299) [(2, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2052 : Rat) / 299) [(2, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2052 : Rat) / 299) [(2, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 3. -/
theorem rs_R003_ueqv_R003NY_partial_03_0203_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_03_0203
        rs_R003_ueqv_R003NY_generator_03_0200_0270 =
      rs_R003_ueqv_R003NY_partial_03_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003NY_coefficient_03_0204 : Poly :=
[
  term ((-4020 : Rat) / 299) [(2, 1), (13, 2), (16, 1)]
]

/-- Partial product 204 for generator 3. -/
def rs_R003_ueqv_R003NY_partial_03_0204 : Poly :=
[
  term ((8040 : Rat) / 299) [(2, 1), (4, 1), (13, 2), (16, 1)],
  term ((-4020 : Rat) / 299) [(2, 1), (4, 2), (13, 2), (16, 1)],
  term ((-4020 : Rat) / 299) [(2, 1), (5, 2), (13, 2), (16, 1)],
  term ((-8040 : Rat) / 299) [(2, 1), (8, 1), (13, 2), (16, 1)],
  term ((4020 : Rat) / 299) [(2, 1), (8, 2), (13, 2), (16, 1)],
  term ((4020 : Rat) / 299) [(2, 1), (9, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 3. -/
theorem rs_R003_ueqv_R003NY_partial_03_0204_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_03_0204
        rs_R003_ueqv_R003NY_generator_03_0200_0270 =
      rs_R003_ueqv_R003NY_partial_03_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003NY_coefficient_03_0205 : Poly :=
[
  term ((-1582 : Rat) / 299) [(2, 1), (14, 1), (16, 1)]
]

/-- Partial product 205 for generator 3. -/
def rs_R003_ueqv_R003NY_partial_03_0205 : Poly :=
[
  term ((3164 : Rat) / 299) [(2, 1), (4, 1), (14, 1), (16, 1)],
  term ((-1582 : Rat) / 299) [(2, 1), (4, 2), (14, 1), (16, 1)],
  term ((-1582 : Rat) / 299) [(2, 1), (5, 2), (14, 1), (16, 1)],
  term ((-3164 : Rat) / 299) [(2, 1), (8, 1), (14, 1), (16, 1)],
  term ((1582 : Rat) / 299) [(2, 1), (8, 2), (14, 1), (16, 1)],
  term ((1582 : Rat) / 299) [(2, 1), (9, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 3. -/
theorem rs_R003_ueqv_R003NY_partial_03_0205_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_03_0205
        rs_R003_ueqv_R003NY_generator_03_0200_0270 =
      rs_R003_ueqv_R003NY_partial_03_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003NY_coefficient_03_0206 : Poly :=
[
  term ((840 : Rat) / 299) [(2, 1), (14, 2), (16, 1)]
]

/-- Partial product 206 for generator 3. -/
def rs_R003_ueqv_R003NY_partial_03_0206 : Poly :=
[
  term ((-1680 : Rat) / 299) [(2, 1), (4, 1), (14, 2), (16, 1)],
  term ((840 : Rat) / 299) [(2, 1), (4, 2), (14, 2), (16, 1)],
  term ((840 : Rat) / 299) [(2, 1), (5, 2), (14, 2), (16, 1)],
  term ((1680 : Rat) / 299) [(2, 1), (8, 1), (14, 2), (16, 1)],
  term ((-840 : Rat) / 299) [(2, 1), (8, 2), (14, 2), (16, 1)],
  term ((-840 : Rat) / 299) [(2, 1), (9, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 3. -/
theorem rs_R003_ueqv_R003NY_partial_03_0206_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_03_0206
        rs_R003_ueqv_R003NY_generator_03_0200_0270 =
      rs_R003_ueqv_R003NY_partial_03_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003NY_coefficient_03_0207 : Poly :=
[
  term ((-60 : Rat) / 299) [(2, 1), (15, 2), (16, 1)]
]

/-- Partial product 207 for generator 3. -/
def rs_R003_ueqv_R003NY_partial_03_0207 : Poly :=
[
  term ((120 : Rat) / 299) [(2, 1), (4, 1), (15, 2), (16, 1)],
  term ((-60 : Rat) / 299) [(2, 1), (4, 2), (15, 2), (16, 1)],
  term ((-60 : Rat) / 299) [(2, 1), (5, 2), (15, 2), (16, 1)],
  term ((-120 : Rat) / 299) [(2, 1), (8, 1), (15, 2), (16, 1)],
  term ((60 : Rat) / 299) [(2, 1), (8, 2), (15, 2), (16, 1)],
  term ((60 : Rat) / 299) [(2, 1), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 3. -/
theorem rs_R003_ueqv_R003NY_partial_03_0207_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_03_0207
        rs_R003_ueqv_R003NY_generator_03_0200_0270 =
      rs_R003_ueqv_R003NY_partial_03_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003NY_coefficient_03_0208 : Poly :=
[
  term ((172 : Rat) / 299) [(2, 1), (16, 1)]
]

/-- Partial product 208 for generator 3. -/
def rs_R003_ueqv_R003NY_partial_03_0208 : Poly :=
[
  term ((-344 : Rat) / 299) [(2, 1), (4, 1), (16, 1)],
  term ((172 : Rat) / 299) [(2, 1), (4, 2), (16, 1)],
  term ((172 : Rat) / 299) [(2, 1), (5, 2), (16, 1)],
  term ((344 : Rat) / 299) [(2, 1), (8, 1), (16, 1)],
  term ((-172 : Rat) / 299) [(2, 1), (8, 2), (16, 1)],
  term ((-172 : Rat) / 299) [(2, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 3. -/
theorem rs_R003_ueqv_R003NY_partial_03_0208_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_03_0208
        rs_R003_ueqv_R003NY_generator_03_0200_0270 =
      rs_R003_ueqv_R003NY_partial_03_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003NY_coefficient_03_0209 : Poly :=
[
  term ((1680 : Rat) / 299) [(2, 2), (6, 1), (16, 1)]
]

/-- Partial product 209 for generator 3. -/
def rs_R003_ueqv_R003NY_partial_03_0209 : Poly :=
[
  term ((-3360 : Rat) / 299) [(2, 2), (4, 1), (6, 1), (16, 1)],
  term ((1680 : Rat) / 299) [(2, 2), (4, 2), (6, 1), (16, 1)],
  term ((1680 : Rat) / 299) [(2, 2), (5, 2), (6, 1), (16, 1)],
  term ((3360 : Rat) / 299) [(2, 2), (6, 1), (8, 1), (16, 1)],
  term ((-1680 : Rat) / 299) [(2, 2), (6, 1), (8, 2), (16, 1)],
  term ((-1680 : Rat) / 299) [(2, 2), (6, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 3. -/
theorem rs_R003_ueqv_R003NY_partial_03_0209_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_03_0209
        rs_R003_ueqv_R003NY_generator_03_0200_0270 =
      rs_R003_ueqv_R003NY_partial_03_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003NY_coefficient_03_0210 : Poly :=
[
  term ((600 : Rat) / 299) [(2, 2), (8, 1), (16, 1)]
]

/-- Partial product 210 for generator 3. -/
def rs_R003_ueqv_R003NY_partial_03_0210 : Poly :=
[
  term ((-1200 : Rat) / 299) [(2, 2), (4, 1), (8, 1), (16, 1)],
  term ((600 : Rat) / 299) [(2, 2), (4, 2), (8, 1), (16, 1)],
  term ((600 : Rat) / 299) [(2, 2), (5, 2), (8, 1), (16, 1)],
  term ((-600 : Rat) / 299) [(2, 2), (8, 1), (9, 2), (16, 1)],
  term ((1200 : Rat) / 299) [(2, 2), (8, 2), (16, 1)],
  term ((-600 : Rat) / 299) [(2, 2), (8, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 3. -/
theorem rs_R003_ueqv_R003NY_partial_03_0210_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_03_0210
        rs_R003_ueqv_R003NY_generator_03_0200_0270 =
      rs_R003_ueqv_R003NY_partial_03_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003NY_coefficient_03_0211 : Poly :=
[
  term ((600 : Rat) / 299) [(2, 2), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 211 for generator 3. -/
def rs_R003_ueqv_R003NY_partial_03_0211 : Poly :=
[
  term ((-1200 : Rat) / 299) [(2, 2), (4, 1), (9, 1), (11, 1), (16, 1)],
  term ((600 : Rat) / 299) [(2, 2), (4, 2), (9, 1), (11, 1), (16, 1)],
  term ((600 : Rat) / 299) [(2, 2), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((1200 : Rat) / 299) [(2, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-600 : Rat) / 299) [(2, 2), (8, 2), (9, 1), (11, 1), (16, 1)],
  term ((-600 : Rat) / 299) [(2, 2), (9, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 3. -/
theorem rs_R003_ueqv_R003NY_partial_03_0211_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_03_0211
        rs_R003_ueqv_R003NY_generator_03_0200_0270 =
      rs_R003_ueqv_R003NY_partial_03_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003NY_coefficient_03_0212 : Poly :=
[
  term ((-7200 : Rat) / 299) [(2, 2), (9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 212 for generator 3. -/
def rs_R003_ueqv_R003NY_partial_03_0212 : Poly :=
[
  term ((14400 : Rat) / 299) [(2, 2), (4, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-7200 : Rat) / 299) [(2, 2), (4, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-7200 : Rat) / 299) [(2, 2), (5, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-14400 : Rat) / 299) [(2, 2), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((7200 : Rat) / 299) [(2, 2), (8, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((7200 : Rat) / 299) [(2, 2), (9, 3), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 3. -/
theorem rs_R003_ueqv_R003NY_partial_03_0212_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_03_0212
        rs_R003_ueqv_R003NY_generator_03_0200_0270 =
      rs_R003_ueqv_R003NY_partial_03_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003NY_coefficient_03_0213 : Poly :=
[
  term ((1800 : Rat) / 299) [(2, 2), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 213 for generator 3. -/
def rs_R003_ueqv_R003NY_partial_03_0213 : Poly :=
[
  term ((-3600 : Rat) / 299) [(2, 2), (4, 1), (9, 1), (13, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(2, 2), (4, 2), (9, 1), (13, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(2, 2), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((3600 : Rat) / 299) [(2, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(2, 2), (8, 2), (9, 1), (13, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(2, 2), (9, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 3. -/
theorem rs_R003_ueqv_R003NY_partial_03_0213_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_03_0213
        rs_R003_ueqv_R003NY_generator_03_0200_0270 =
      rs_R003_ueqv_R003NY_partial_03_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003NY_coefficient_03_0214 : Poly :=
[
  term ((-4320 : Rat) / 299) [(2, 2), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 214 for generator 3. -/
def rs_R003_ueqv_R003NY_partial_03_0214 : Poly :=
[
  term ((8640 : Rat) / 299) [(2, 2), (4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(2, 2), (4, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(2, 2), (5, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8640 : Rat) / 299) [(2, 2), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(2, 2), (8, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(2, 2), (9, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 3. -/
theorem rs_R003_ueqv_R003NY_partial_03_0214_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_03_0214
        rs_R003_ueqv_R003NY_generator_03_0200_0270 =
      rs_R003_ueqv_R003NY_partial_03_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003NY_coefficient_03_0215 : Poly :=
[
  term ((4320 : Rat) / 299) [(2, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 215 for generator 3. -/
def rs_R003_ueqv_R003NY_partial_03_0215 : Poly :=
[
  term ((-8640 : Rat) / 299) [(2, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(2, 2), (4, 2), (9, 1), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(2, 2), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((8640 : Rat) / 299) [(2, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(2, 2), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(2, 2), (9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 3. -/
theorem rs_R003_ueqv_R003NY_partial_03_0215_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_03_0215
        rs_R003_ueqv_R003NY_generator_03_0200_0270 =
      rs_R003_ueqv_R003NY_partial_03_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003NY_coefficient_03_0216 : Poly :=
[
  term ((-3600 : Rat) / 299) [(2, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 216 for generator 3. -/
def rs_R003_ueqv_R003NY_partial_03_0216 : Poly :=
[
  term ((7200 : Rat) / 299) [(2, 2), (4, 1), (11, 1), (13, 1), (16, 1)],
  term ((-3600 : Rat) / 299) [(2, 2), (4, 2), (11, 1), (13, 1), (16, 1)],
  term ((-3600 : Rat) / 299) [(2, 2), (5, 2), (11, 1), (13, 1), (16, 1)],
  term ((-7200 : Rat) / 299) [(2, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((3600 : Rat) / 299) [(2, 2), (8, 2), (11, 1), (13, 1), (16, 1)],
  term ((3600 : Rat) / 299) [(2, 2), (9, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 3. -/
theorem rs_R003_ueqv_R003NY_partial_03_0216_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_03_0216
        rs_R003_ueqv_R003NY_generator_03_0200_0270 =
      rs_R003_ueqv_R003NY_partial_03_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003NY_coefficient_03_0217 : Poly :=
[
  term ((-240 : Rat) / 299) [(2, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 217 for generator 3. -/
def rs_R003_ueqv_R003NY_partial_03_0217 : Poly :=
[
  term ((480 : Rat) / 299) [(2, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-240 : Rat) / 299) [(2, 2), (4, 2), (11, 1), (15, 1), (16, 1)],
  term ((-240 : Rat) / 299) [(2, 2), (5, 2), (11, 1), (15, 1), (16, 1)],
  term ((-480 : Rat) / 299) [(2, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((240 : Rat) / 299) [(2, 2), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((240 : Rat) / 299) [(2, 2), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 3. -/
theorem rs_R003_ueqv_R003NY_partial_03_0217_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_03_0217
        rs_R003_ueqv_R003NY_generator_03_0200_0270 =
      rs_R003_ueqv_R003NY_partial_03_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003NY_coefficient_03_0218 : Poly :=
[
  term ((-1800 : Rat) / 299) [(2, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 218 for generator 3. -/
def rs_R003_ueqv_R003NY_partial_03_0218 : Poly :=
[
  term ((3600 : Rat) / 299) [(2, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(2, 2), (4, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(2, 2), (5, 2), (13, 1), (15, 1), (16, 1)],
  term ((-3600 : Rat) / 299) [(2, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(2, 2), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(2, 2), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 3. -/
theorem rs_R003_ueqv_R003NY_partial_03_0218_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_03_0218
        rs_R003_ueqv_R003NY_generator_03_0200_0270 =
      rs_R003_ueqv_R003NY_partial_03_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003NY_coefficient_03_0219 : Poly :=
[
  term ((-180 : Rat) / 299) [(2, 2), (14, 1), (16, 1)]
]

/-- Partial product 219 for generator 3. -/
def rs_R003_ueqv_R003NY_partial_03_0219 : Poly :=
[
  term ((360 : Rat) / 299) [(2, 2), (4, 1), (14, 1), (16, 1)],
  term ((-180 : Rat) / 299) [(2, 2), (4, 2), (14, 1), (16, 1)],
  term ((-180 : Rat) / 299) [(2, 2), (5, 2), (14, 1), (16, 1)],
  term ((-360 : Rat) / 299) [(2, 2), (8, 1), (14, 1), (16, 1)],
  term ((180 : Rat) / 299) [(2, 2), (8, 2), (14, 1), (16, 1)],
  term ((180 : Rat) / 299) [(2, 2), (9, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 3. -/
theorem rs_R003_ueqv_R003NY_partial_03_0219_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_03_0219
        rs_R003_ueqv_R003NY_generator_03_0200_0270 =
      rs_R003_ueqv_R003NY_partial_03_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003NY_coefficient_03_0220 : Poly :=
[
  term ((2160 : Rat) / 299) [(2, 2), (15, 2), (16, 1)]
]

/-- Partial product 220 for generator 3. -/
def rs_R003_ueqv_R003NY_partial_03_0220 : Poly :=
[
  term ((-4320 : Rat) / 299) [(2, 2), (4, 1), (15, 2), (16, 1)],
  term ((2160 : Rat) / 299) [(2, 2), (4, 2), (15, 2), (16, 1)],
  term ((2160 : Rat) / 299) [(2, 2), (5, 2), (15, 2), (16, 1)],
  term ((4320 : Rat) / 299) [(2, 2), (8, 1), (15, 2), (16, 1)],
  term ((-2160 : Rat) / 299) [(2, 2), (8, 2), (15, 2), (16, 1)],
  term ((-2160 : Rat) / 299) [(2, 2), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 3. -/
theorem rs_R003_ueqv_R003NY_partial_03_0220_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_03_0220
        rs_R003_ueqv_R003NY_generator_03_0200_0270 =
      rs_R003_ueqv_R003NY_partial_03_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003NY_coefficient_03_0221 : Poly :=
[
  term ((180 : Rat) / 299) [(2, 2), (16, 1)]
]

/-- Partial product 221 for generator 3. -/
def rs_R003_ueqv_R003NY_partial_03_0221 : Poly :=
[
  term ((-360 : Rat) / 299) [(2, 2), (4, 1), (16, 1)],
  term ((180 : Rat) / 299) [(2, 2), (4, 2), (16, 1)],
  term ((180 : Rat) / 299) [(2, 2), (5, 2), (16, 1)],
  term ((360 : Rat) / 299) [(2, 2), (8, 1), (16, 1)],
  term ((-180 : Rat) / 299) [(2, 2), (8, 2), (16, 1)],
  term ((-180 : Rat) / 299) [(2, 2), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 3. -/
theorem rs_R003_ueqv_R003NY_partial_03_0221_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_03_0221
        rs_R003_ueqv_R003NY_generator_03_0200_0270 =
      rs_R003_ueqv_R003NY_partial_03_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003NY_coefficient_03_0222 : Poly :=
[
  term ((2512 : Rat) / 299) [(3, 1), (5, 1), (8, 1), (14, 1), (16, 1)]
]

/-- Partial product 222 for generator 3. -/
def rs_R003_ueqv_R003NY_partial_03_0222 : Poly :=
[
  term ((-5024 : Rat) / 299) [(3, 1), (4, 1), (5, 1), (8, 1), (14, 1), (16, 1)],
  term ((2512 : Rat) / 299) [(3, 1), (4, 2), (5, 1), (8, 1), (14, 1), (16, 1)],
  term ((-2512 : Rat) / 299) [(3, 1), (5, 1), (8, 1), (9, 2), (14, 1), (16, 1)],
  term ((5024 : Rat) / 299) [(3, 1), (5, 1), (8, 2), (14, 1), (16, 1)],
  term ((-2512 : Rat) / 299) [(3, 1), (5, 1), (8, 3), (14, 1), (16, 1)],
  term ((2512 : Rat) / 299) [(3, 1), (5, 3), (8, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 3. -/
theorem rs_R003_ueqv_R003NY_partial_03_0222_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_03_0222
        rs_R003_ueqv_R003NY_generator_03_0200_0270 =
      rs_R003_ueqv_R003NY_partial_03_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003NY_coefficient_03_0223 : Poly :=
[
  term ((-2512 : Rat) / 299) [(3, 1), (5, 1), (8, 1), (16, 1)]
]

/-- Partial product 223 for generator 3. -/
def rs_R003_ueqv_R003NY_partial_03_0223 : Poly :=
[
  term ((5024 : Rat) / 299) [(3, 1), (4, 1), (5, 1), (8, 1), (16, 1)],
  term ((-2512 : Rat) / 299) [(3, 1), (4, 2), (5, 1), (8, 1), (16, 1)],
  term ((2512 : Rat) / 299) [(3, 1), (5, 1), (8, 1), (9, 2), (16, 1)],
  term ((-5024 : Rat) / 299) [(3, 1), (5, 1), (8, 2), (16, 1)],
  term ((2512 : Rat) / 299) [(3, 1), (5, 1), (8, 3), (16, 1)],
  term ((-2512 : Rat) / 299) [(3, 1), (5, 3), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 3. -/
theorem rs_R003_ueqv_R003NY_partial_03_0223_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_03_0223
        rs_R003_ueqv_R003NY_generator_03_0200_0270 =
      rs_R003_ueqv_R003NY_partial_03_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003NY_coefficient_03_0224 : Poly :=
[
  term ((-1256 : Rat) / 299) [(3, 1), (5, 1), (14, 1), (16, 1)]
]

/-- Partial product 224 for generator 3. -/
def rs_R003_ueqv_R003NY_partial_03_0224 : Poly :=
[
  term ((2512 : Rat) / 299) [(3, 1), (4, 1), (5, 1), (14, 1), (16, 1)],
  term ((-1256 : Rat) / 299) [(3, 1), (4, 2), (5, 1), (14, 1), (16, 1)],
  term ((-2512 : Rat) / 299) [(3, 1), (5, 1), (8, 1), (14, 1), (16, 1)],
  term ((1256 : Rat) / 299) [(3, 1), (5, 1), (8, 2), (14, 1), (16, 1)],
  term ((1256 : Rat) / 299) [(3, 1), (5, 1), (9, 2), (14, 1), (16, 1)],
  term ((-1256 : Rat) / 299) [(3, 1), (5, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 3. -/
theorem rs_R003_ueqv_R003NY_partial_03_0224_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_03_0224
        rs_R003_ueqv_R003NY_generator_03_0200_0270 =
      rs_R003_ueqv_R003NY_partial_03_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003NY_coefficient_03_0225 : Poly :=
[
  term ((1256 : Rat) / 299) [(3, 1), (5, 1), (16, 1)]
]

/-- Partial product 225 for generator 3. -/
def rs_R003_ueqv_R003NY_partial_03_0225 : Poly :=
[
  term ((-2512 : Rat) / 299) [(3, 1), (4, 1), (5, 1), (16, 1)],
  term ((1256 : Rat) / 299) [(3, 1), (4, 2), (5, 1), (16, 1)],
  term ((2512 : Rat) / 299) [(3, 1), (5, 1), (8, 1), (16, 1)],
  term ((-1256 : Rat) / 299) [(3, 1), (5, 1), (8, 2), (16, 1)],
  term ((-1256 : Rat) / 299) [(3, 1), (5, 1), (9, 2), (16, 1)],
  term ((1256 : Rat) / 299) [(3, 1), (5, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 3. -/
theorem rs_R003_ueqv_R003NY_partial_03_0225_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_03_0225
        rs_R003_ueqv_R003NY_generator_03_0200_0270 =
      rs_R003_ueqv_R003NY_partial_03_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003NY_coefficient_03_0226 : Poly :=
[
  term ((-34 : Rat) / 13) [(3, 1), (7, 1), (16, 1)]
]

/-- Partial product 226 for generator 3. -/
def rs_R003_ueqv_R003NY_partial_03_0226 : Poly :=
[
  term ((68 : Rat) / 13) [(3, 1), (4, 1), (7, 1), (16, 1)],
  term ((-34 : Rat) / 13) [(3, 1), (4, 2), (7, 1), (16, 1)],
  term ((-34 : Rat) / 13) [(3, 1), (5, 2), (7, 1), (16, 1)],
  term ((-68 : Rat) / 13) [(3, 1), (7, 1), (8, 1), (16, 1)],
  term ((34 : Rat) / 13) [(3, 1), (7, 1), (8, 2), (16, 1)],
  term ((34 : Rat) / 13) [(3, 1), (7, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 3. -/
theorem rs_R003_ueqv_R003NY_partial_03_0226_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_03_0226
        rs_R003_ueqv_R003NY_generator_03_0200_0270 =
      rs_R003_ueqv_R003NY_partial_03_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003NY_coefficient_03_0227 : Poly :=
[
  term ((-2512 : Rat) / 299) [(3, 1), (8, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 227 for generator 3. -/
def rs_R003_ueqv_R003NY_partial_03_0227 : Poly :=
[
  term ((5024 : Rat) / 299) [(3, 1), (4, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-2512 : Rat) / 299) [(3, 1), (4, 2), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-2512 : Rat) / 299) [(3, 1), (5, 2), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((2512 : Rat) / 299) [(3, 1), (8, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((-5024 : Rat) / 299) [(3, 1), (8, 2), (11, 1), (14, 1), (16, 1)],
  term ((2512 : Rat) / 299) [(3, 1), (8, 3), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 3. -/
theorem rs_R003_ueqv_R003NY_partial_03_0227_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_03_0227
        rs_R003_ueqv_R003NY_generator_03_0200_0270 =
      rs_R003_ueqv_R003NY_partial_03_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003NY_coefficient_03_0228 : Poly :=
[
  term ((1256 : Rat) / 299) [(3, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 228 for generator 3. -/
def rs_R003_ueqv_R003NY_partial_03_0228 : Poly :=
[
  term ((-2512 : Rat) / 299) [(3, 1), (4, 1), (8, 1), (11, 1), (16, 1)],
  term ((1256 : Rat) / 299) [(3, 1), (4, 2), (8, 1), (11, 1), (16, 1)],
  term ((1256 : Rat) / 299) [(3, 1), (5, 2), (8, 1), (11, 1), (16, 1)],
  term ((-1256 : Rat) / 299) [(3, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((2512 : Rat) / 299) [(3, 1), (8, 2), (11, 1), (16, 1)],
  term ((-1256 : Rat) / 299) [(3, 1), (8, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 3. -/
theorem rs_R003_ueqv_R003NY_partial_03_0228_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_03_0228
        rs_R003_ueqv_R003NY_generator_03_0200_0270 =
      rs_R003_ueqv_R003NY_partial_03_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003NY_coefficient_03_0229 : Poly :=
[
  term ((-96 : Rat) / 13) [(3, 1), (8, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 229 for generator 3. -/
def rs_R003_ueqv_R003NY_partial_03_0229 : Poly :=
[
  term ((192 : Rat) / 13) [(3, 1), (4, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-96 : Rat) / 13) [(3, 1), (4, 2), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-96 : Rat) / 13) [(3, 1), (5, 2), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((96 : Rat) / 13) [(3, 1), (8, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((-192 : Rat) / 13) [(3, 1), (8, 2), (13, 1), (14, 1), (16, 1)],
  term ((96 : Rat) / 13) [(3, 1), (8, 3), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 3. -/
theorem rs_R003_ueqv_R003NY_partial_03_0229_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_03_0229
        rs_R003_ueqv_R003NY_generator_03_0200_0270 =
      rs_R003_ueqv_R003NY_partial_03_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003NY_coefficient_03_0230 : Poly :=
[
  term ((-48 : Rat) / 13) [(3, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 230 for generator 3. -/
def rs_R003_ueqv_R003NY_partial_03_0230 : Poly :=
[
  term ((96 : Rat) / 13) [(3, 1), (4, 1), (8, 1), (13, 1), (16, 1)],
  term ((-48 : Rat) / 13) [(3, 1), (4, 2), (8, 1), (13, 1), (16, 1)],
  term ((-48 : Rat) / 13) [(3, 1), (5, 2), (8, 1), (13, 1), (16, 1)],
  term ((48 : Rat) / 13) [(3, 1), (8, 1), (9, 2), (13, 1), (16, 1)],
  term ((-96 : Rat) / 13) [(3, 1), (8, 2), (13, 1), (16, 1)],
  term ((48 : Rat) / 13) [(3, 1), (8, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 3. -/
theorem rs_R003_ueqv_R003NY_partial_03_0230_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_03_0230
        rs_R003_ueqv_R003NY_generator_03_0200_0270 =
      rs_R003_ueqv_R003NY_partial_03_0230 := by
  native_decide

/-- Coefficient term 231 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003NY_coefficient_03_0231 : Poly :=
[
  term ((60 : Rat) / 13) [(3, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 231 for generator 3. -/
def rs_R003_ueqv_R003NY_partial_03_0231 : Poly :=
[
  term ((-120 : Rat) / 13) [(3, 1), (4, 1), (8, 1), (15, 1), (16, 1)],
  term ((60 : Rat) / 13) [(3, 1), (4, 2), (8, 1), (15, 1), (16, 1)],
  term ((60 : Rat) / 13) [(3, 1), (5, 2), (8, 1), (15, 1), (16, 1)],
  term ((-60 : Rat) / 13) [(3, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((120 : Rat) / 13) [(3, 1), (8, 2), (15, 1), (16, 1)],
  term ((-60 : Rat) / 13) [(3, 1), (8, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 231 for generator 3. -/
theorem rs_R003_ueqv_R003NY_partial_03_0231_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_03_0231
        rs_R003_ueqv_R003NY_generator_03_0200_0270 =
      rs_R003_ueqv_R003NY_partial_03_0231 := by
  native_decide

/-- Coefficient term 232 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003NY_coefficient_03_0232 : Poly :=
[
  term ((72 : Rat) / 13) [(3, 1), (9, 1), (12, 1), (16, 1)]
]

/-- Partial product 232 for generator 3. -/
def rs_R003_ueqv_R003NY_partial_03_0232 : Poly :=
[
  term ((-144 : Rat) / 13) [(3, 1), (4, 1), (9, 1), (12, 1), (16, 1)],
  term ((72 : Rat) / 13) [(3, 1), (4, 2), (9, 1), (12, 1), (16, 1)],
  term ((72 : Rat) / 13) [(3, 1), (5, 2), (9, 1), (12, 1), (16, 1)],
  term ((144 : Rat) / 13) [(3, 1), (8, 1), (9, 1), (12, 1), (16, 1)],
  term ((-72 : Rat) / 13) [(3, 1), (8, 2), (9, 1), (12, 1), (16, 1)],
  term ((-72 : Rat) / 13) [(3, 1), (9, 3), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 232 for generator 3. -/
theorem rs_R003_ueqv_R003NY_partial_03_0232_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_03_0232
        rs_R003_ueqv_R003NY_generator_03_0200_0270 =
      rs_R003_ueqv_R003NY_partial_03_0232 := by
  native_decide

/-- Coefficient term 233 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003NY_coefficient_03_0233 : Poly :=
[
  term ((14 : Rat) / 13) [(3, 1), (9, 1), (16, 1)]
]

/-- Partial product 233 for generator 3. -/
def rs_R003_ueqv_R003NY_partial_03_0233 : Poly :=
[
  term ((-28 : Rat) / 13) [(3, 1), (4, 1), (9, 1), (16, 1)],
  term ((14 : Rat) / 13) [(3, 1), (4, 2), (9, 1), (16, 1)],
  term ((14 : Rat) / 13) [(3, 1), (5, 2), (9, 1), (16, 1)],
  term ((28 : Rat) / 13) [(3, 1), (8, 1), (9, 1), (16, 1)],
  term ((-14 : Rat) / 13) [(3, 1), (8, 2), (9, 1), (16, 1)],
  term ((-14 : Rat) / 13) [(3, 1), (9, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 233 for generator 3. -/
theorem rs_R003_ueqv_R003NY_partial_03_0233_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_03_0233
        rs_R003_ueqv_R003NY_generator_03_0200_0270 =
      rs_R003_ueqv_R003NY_partial_03_0233 := by
  native_decide

/-- Coefficient term 234 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003NY_coefficient_03_0234 : Poly :=
[
  term ((72 : Rat) / 13) [(3, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 234 for generator 3. -/
def rs_R003_ueqv_R003NY_partial_03_0234 : Poly :=
[
  term ((-144 : Rat) / 13) [(3, 1), (4, 1), (11, 1), (12, 1), (16, 1)],
  term ((72 : Rat) / 13) [(3, 1), (4, 2), (11, 1), (12, 1), (16, 1)],
  term ((72 : Rat) / 13) [(3, 1), (5, 2), (11, 1), (12, 1), (16, 1)],
  term ((144 : Rat) / 13) [(3, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((-72 : Rat) / 13) [(3, 1), (8, 2), (11, 1), (12, 1), (16, 1)],
  term ((-72 : Rat) / 13) [(3, 1), (9, 2), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 234 for generator 3. -/
theorem rs_R003_ueqv_R003NY_partial_03_0234_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_03_0234
        rs_R003_ueqv_R003NY_generator_03_0200_0270 =
      rs_R003_ueqv_R003NY_partial_03_0234 := by
  native_decide

/-- Coefficient term 235 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003NY_coefficient_03_0235 : Poly :=
[
  term ((1256 : Rat) / 299) [(3, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 235 for generator 3. -/
def rs_R003_ueqv_R003NY_partial_03_0235 : Poly :=
[
  term ((-2512 : Rat) / 299) [(3, 1), (4, 1), (11, 1), (14, 1), (16, 1)],
  term ((1256 : Rat) / 299) [(3, 1), (4, 2), (11, 1), (14, 1), (16, 1)],
  term ((1256 : Rat) / 299) [(3, 1), (5, 2), (11, 1), (14, 1), (16, 1)],
  term ((2512 : Rat) / 299) [(3, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1256 : Rat) / 299) [(3, 1), (8, 2), (11, 1), (14, 1), (16, 1)],
  term ((-1256 : Rat) / 299) [(3, 1), (9, 2), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 235 for generator 3. -/
theorem rs_R003_ueqv_R003NY_partial_03_0235_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_03_0235
        rs_R003_ueqv_R003NY_generator_03_0200_0270 =
      rs_R003_ueqv_R003NY_partial_03_0235 := by
  native_decide

/-- Coefficient term 236 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003NY_coefficient_03_0236 : Poly :=
[
  term ((-1256 : Rat) / 299) [(3, 1), (11, 1), (16, 1)]
]

/-- Partial product 236 for generator 3. -/
def rs_R003_ueqv_R003NY_partial_03_0236 : Poly :=
[
  term ((2512 : Rat) / 299) [(3, 1), (4, 1), (11, 1), (16, 1)],
  term ((-1256 : Rat) / 299) [(3, 1), (4, 2), (11, 1), (16, 1)],
  term ((-1256 : Rat) / 299) [(3, 1), (5, 2), (11, 1), (16, 1)],
  term ((-2512 : Rat) / 299) [(3, 1), (8, 1), (11, 1), (16, 1)],
  term ((1256 : Rat) / 299) [(3, 1), (8, 2), (11, 1), (16, 1)],
  term ((1256 : Rat) / 299) [(3, 1), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 236 for generator 3. -/
theorem rs_R003_ueqv_R003NY_partial_03_0236_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_03_0236
        rs_R003_ueqv_R003NY_generator_03_0200_0270 =
      rs_R003_ueqv_R003NY_partial_03_0236 := by
  native_decide

/-- Coefficient term 237 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003NY_coefficient_03_0237 : Poly :=
[
  term ((-24 : Rat) / 13) [(3, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 237 for generator 3. -/
def rs_R003_ueqv_R003NY_partial_03_0237 : Poly :=
[
  term ((48 : Rat) / 13) [(3, 1), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((-24 : Rat) / 13) [(3, 1), (4, 2), (12, 1), (15, 1), (16, 1)],
  term ((-24 : Rat) / 13) [(3, 1), (5, 2), (12, 1), (15, 1), (16, 1)],
  term ((-48 : Rat) / 13) [(3, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((24 : Rat) / 13) [(3, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((24 : Rat) / 13) [(3, 1), (9, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 237 for generator 3. -/
theorem rs_R003_ueqv_R003NY_partial_03_0237_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_03_0237
        rs_R003_ueqv_R003NY_generator_03_0200_0270 =
      rs_R003_ueqv_R003NY_partial_03_0237 := by
  native_decide

/-- Coefficient term 238 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003NY_coefficient_03_0238 : Poly :=
[
  term ((-60 : Rat) / 13) [(3, 1), (13, 1), (16, 1)]
]

/-- Partial product 238 for generator 3. -/
def rs_R003_ueqv_R003NY_partial_03_0238 : Poly :=
[
  term ((120 : Rat) / 13) [(3, 1), (4, 1), (13, 1), (16, 1)],
  term ((-60 : Rat) / 13) [(3, 1), (4, 2), (13, 1), (16, 1)],
  term ((-60 : Rat) / 13) [(3, 1), (5, 2), (13, 1), (16, 1)],
  term ((-120 : Rat) / 13) [(3, 1), (8, 1), (13, 1), (16, 1)],
  term ((60 : Rat) / 13) [(3, 1), (8, 2), (13, 1), (16, 1)],
  term ((60 : Rat) / 13) [(3, 1), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 238 for generator 3. -/
theorem rs_R003_ueqv_R003NY_partial_03_0238_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_03_0238
        rs_R003_ueqv_R003NY_generator_03_0200_0270 =
      rs_R003_ueqv_R003NY_partial_03_0238 := by
  native_decide

/-- Coefficient term 239 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003NY_coefficient_03_0239 : Poly :=
[
  term ((18 : Rat) / 13) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 239 for generator 3. -/
def rs_R003_ueqv_R003NY_partial_03_0239 : Poly :=
[
  term ((-36 : Rat) / 13) [(3, 1), (4, 1), (15, 1), (16, 1)],
  term ((18 : Rat) / 13) [(3, 1), (4, 2), (15, 1), (16, 1)],
  term ((18 : Rat) / 13) [(3, 1), (5, 2), (15, 1), (16, 1)],
  term ((36 : Rat) / 13) [(3, 1), (8, 1), (15, 1), (16, 1)],
  term ((-18 : Rat) / 13) [(3, 1), (8, 2), (15, 1), (16, 1)],
  term ((-18 : Rat) / 13) [(3, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 239 for generator 3. -/
theorem rs_R003_ueqv_R003NY_partial_03_0239_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_03_0239
        rs_R003_ueqv_R003NY_generator_03_0200_0270 =
      rs_R003_ueqv_R003NY_partial_03_0239 := by
  native_decide

/-- Coefficient term 240 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003NY_coefficient_03_0240 : Poly :=
[
  term ((72 : Rat) / 13) [(3, 2), (8, 1), (16, 1)]
]

/-- Partial product 240 for generator 3. -/
def rs_R003_ueqv_R003NY_partial_03_0240 : Poly :=
[
  term ((-144 : Rat) / 13) [(3, 2), (4, 1), (8, 1), (16, 1)],
  term ((72 : Rat) / 13) [(3, 2), (4, 2), (8, 1), (16, 1)],
  term ((72 : Rat) / 13) [(3, 2), (5, 2), (8, 1), (16, 1)],
  term ((-72 : Rat) / 13) [(3, 2), (8, 1), (9, 2), (16, 1)],
  term ((144 : Rat) / 13) [(3, 2), (8, 2), (16, 1)],
  term ((-72 : Rat) / 13) [(3, 2), (8, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 240 for generator 3. -/
theorem rs_R003_ueqv_R003NY_partial_03_0240_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_03_0240
        rs_R003_ueqv_R003NY_generator_03_0200_0270 =
      rs_R003_ueqv_R003NY_partial_03_0240 := by
  native_decide

/-- Coefficient term 241 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003NY_coefficient_03_0241 : Poly :=
[
  term ((24 : Rat) / 13) [(5, 1), (8, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 241 for generator 3. -/
def rs_R003_ueqv_R003NY_partial_03_0241 : Poly :=
[
  term ((-48 : Rat) / 13) [(4, 1), (5, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((24 : Rat) / 13) [(4, 2), (5, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-24 : Rat) / 13) [(5, 1), (8, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((48 : Rat) / 13) [(5, 1), (8, 2), (13, 1), (14, 1), (16, 1)],
  term ((-24 : Rat) / 13) [(5, 1), (8, 3), (13, 1), (14, 1), (16, 1)],
  term ((24 : Rat) / 13) [(5, 3), (8, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 241 for generator 3. -/
theorem rs_R003_ueqv_R003NY_partial_03_0241_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_03_0241
        rs_R003_ueqv_R003NY_generator_03_0200_0270 =
      rs_R003_ueqv_R003NY_partial_03_0241 := by
  native_decide

/-- Coefficient term 242 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003NY_coefficient_03_0242 : Poly :=
[
  term ((-12 : Rat) / 13) [(5, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 242 for generator 3. -/
def rs_R003_ueqv_R003NY_partial_03_0242 : Poly :=
[
  term ((24 : Rat) / 13) [(4, 1), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((-12 : Rat) / 13) [(4, 2), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((12 : Rat) / 13) [(5, 1), (8, 1), (9, 2), (13, 1), (16, 1)],
  term ((-24 : Rat) / 13) [(5, 1), (8, 2), (13, 1), (16, 1)],
  term ((12 : Rat) / 13) [(5, 1), (8, 3), (13, 1), (16, 1)],
  term ((-12 : Rat) / 13) [(5, 3), (8, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 242 for generator 3. -/
theorem rs_R003_ueqv_R003NY_partial_03_0242_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_03_0242
        rs_R003_ueqv_R003NY_generator_03_0200_0270 =
      rs_R003_ueqv_R003NY_partial_03_0242 := by
  native_decide

/-- Coefficient term 243 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003NY_coefficient_03_0243 : Poly :=
[
  term ((12 : Rat) / 13) [(5, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 243 for generator 3. -/
def rs_R003_ueqv_R003NY_partial_03_0243 : Poly :=
[
  term ((-24 : Rat) / 13) [(4, 1), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((12 : Rat) / 13) [(4, 2), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((24 : Rat) / 13) [(5, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-12 : Rat) / 13) [(5, 1), (8, 2), (13, 1), (14, 1), (16, 1)],
  term ((-12 : Rat) / 13) [(5, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((12 : Rat) / 13) [(5, 3), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 243 for generator 3. -/
theorem rs_R003_ueqv_R003NY_partial_03_0243_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_03_0243
        rs_R003_ueqv_R003NY_generator_03_0200_0270 =
      rs_R003_ueqv_R003NY_partial_03_0243 := by
  native_decide

/-- Coefficient term 244 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003NY_coefficient_03_0244 : Poly :=
[
  term ((12 : Rat) / 13) [(5, 1), (13, 1), (16, 1)]
]

/-- Partial product 244 for generator 3. -/
def rs_R003_ueqv_R003NY_partial_03_0244 : Poly :=
[
  term ((-24 : Rat) / 13) [(4, 1), (5, 1), (13, 1), (16, 1)],
  term ((12 : Rat) / 13) [(4, 2), (5, 1), (13, 1), (16, 1)],
  term ((24 : Rat) / 13) [(5, 1), (8, 1), (13, 1), (16, 1)],
  term ((-12 : Rat) / 13) [(5, 1), (8, 2), (13, 1), (16, 1)],
  term ((-12 : Rat) / 13) [(5, 1), (9, 2), (13, 1), (16, 1)],
  term ((12 : Rat) / 13) [(5, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 244 for generator 3. -/
theorem rs_R003_ueqv_R003NY_partial_03_0244_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_03_0244
        rs_R003_ueqv_R003NY_generator_03_0200_0270 =
      rs_R003_ueqv_R003NY_partial_03_0244 := by
  native_decide

/-- Coefficient term 245 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003NY_coefficient_03_0245 : Poly :=
[
  term ((34 : Rat) / 13) [(6, 1), (16, 1)]
]

/-- Partial product 245 for generator 3. -/
def rs_R003_ueqv_R003NY_partial_03_0245 : Poly :=
[
  term ((-68 : Rat) / 13) [(4, 1), (6, 1), (16, 1)],
  term ((34 : Rat) / 13) [(4, 2), (6, 1), (16, 1)],
  term ((34 : Rat) / 13) [(5, 2), (6, 1), (16, 1)],
  term ((68 : Rat) / 13) [(6, 1), (8, 1), (16, 1)],
  term ((-34 : Rat) / 13) [(6, 1), (8, 2), (16, 1)],
  term ((-34 : Rat) / 13) [(6, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 245 for generator 3. -/
theorem rs_R003_ueqv_R003NY_partial_03_0245_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_03_0245
        rs_R003_ueqv_R003NY_generator_03_0200_0270 =
      rs_R003_ueqv_R003NY_partial_03_0245 := by
  native_decide

/-- Coefficient term 246 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003NY_coefficient_03_0246 : Poly :=
[
  term ((-24 : Rat) / 13) [(8, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 246 for generator 3. -/
def rs_R003_ueqv_R003NY_partial_03_0246 : Poly :=
[
  term ((48 : Rat) / 13) [(4, 1), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-24 : Rat) / 13) [(4, 2), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-24 : Rat) / 13) [(5, 2), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((24 : Rat) / 13) [(8, 1), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-48 : Rat) / 13) [(8, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((24 : Rat) / 13) [(8, 3), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 246 for generator 3. -/
theorem rs_R003_ueqv_R003NY_partial_03_0246_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_03_0246
        rs_R003_ueqv_R003NY_generator_03_0200_0270 =
      rs_R003_ueqv_R003NY_partial_03_0246 := by
  native_decide

/-- Coefficient term 247 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003NY_coefficient_03_0247 : Poly :=
[
  term ((1164 : Rat) / 299) [(8, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 247 for generator 3. -/
def rs_R003_ueqv_R003NY_partial_03_0247 : Poly :=
[
  term ((-2328 : Rat) / 299) [(4, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((1164 : Rat) / 299) [(4, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((1164 : Rat) / 299) [(5, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1164 : Rat) / 299) [(8, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((2328 : Rat) / 299) [(8, 2), (11, 1), (13, 1), (16, 1)],
  term ((-1164 : Rat) / 299) [(8, 3), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 247 for generator 3. -/
theorem rs_R003_ueqv_R003NY_partial_03_0247_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_03_0247
        rs_R003_ueqv_R003NY_generator_03_0200_0270 =
      rs_R003_ueqv_R003NY_partial_03_0247 := by
  native_decide

/-- Coefficient term 248 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003NY_coefficient_03_0248 : Poly :=
[
  term ((-60 : Rat) / 13) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 248 for generator 3. -/
def rs_R003_ueqv_R003NY_partial_03_0248 : Poly :=
[
  term ((120 : Rat) / 13) [(4, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-60 : Rat) / 13) [(4, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-60 : Rat) / 13) [(5, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((60 : Rat) / 13) [(8, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-120 : Rat) / 13) [(8, 2), (13, 1), (15, 1), (16, 1)],
  term ((60 : Rat) / 13) [(8, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 248 for generator 3. -/
theorem rs_R003_ueqv_R003NY_partial_03_0248_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_03_0248
        rs_R003_ueqv_R003NY_generator_03_0200_0270 =
      rs_R003_ueqv_R003NY_partial_03_0248 := by
  native_decide

/-- Coefficient term 249 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003NY_coefficient_03_0249 : Poly :=
[
  term ((96 : Rat) / 13) [(8, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 249 for generator 3. -/
def rs_R003_ueqv_R003NY_partial_03_0249 : Poly :=
[
  term ((-192 : Rat) / 13) [(4, 1), (8, 1), (13, 2), (14, 1), (16, 1)],
  term ((96 : Rat) / 13) [(4, 2), (8, 1), (13, 2), (14, 1), (16, 1)],
  term ((96 : Rat) / 13) [(5, 2), (8, 1), (13, 2), (14, 1), (16, 1)],
  term ((-96 : Rat) / 13) [(8, 1), (9, 2), (13, 2), (14, 1), (16, 1)],
  term ((192 : Rat) / 13) [(8, 2), (13, 2), (14, 1), (16, 1)],
  term ((-96 : Rat) / 13) [(8, 3), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 249 for generator 3. -/
theorem rs_R003_ueqv_R003NY_partial_03_0249_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_03_0249
        rs_R003_ueqv_R003NY_generator_03_0200_0270 =
      rs_R003_ueqv_R003NY_partial_03_0249 := by
  native_decide

/-- Coefficient term 250 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003NY_coefficient_03_0250 : Poly :=
[
  term ((-24 : Rat) / 13) [(8, 1), (13, 2), (16, 1)]
]

/-- Partial product 250 for generator 3. -/
def rs_R003_ueqv_R003NY_partial_03_0250 : Poly :=
[
  term ((48 : Rat) / 13) [(4, 1), (8, 1), (13, 2), (16, 1)],
  term ((-24 : Rat) / 13) [(4, 2), (8, 1), (13, 2), (16, 1)],
  term ((-24 : Rat) / 13) [(5, 2), (8, 1), (13, 2), (16, 1)],
  term ((24 : Rat) / 13) [(8, 1), (9, 2), (13, 2), (16, 1)],
  term ((-48 : Rat) / 13) [(8, 2), (13, 2), (16, 1)],
  term ((24 : Rat) / 13) [(8, 3), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 250 for generator 3. -/
theorem rs_R003_ueqv_R003NY_partial_03_0250_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_03_0250
        rs_R003_ueqv_R003NY_generator_03_0200_0270 =
      rs_R003_ueqv_R003NY_partial_03_0250 := by
  native_decide

/-- Coefficient term 251 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003NY_coefficient_03_0251 : Poly :=
[
  term ((2 : Rat) / 13) [(8, 1), (16, 1)]
]

/-- Partial product 251 for generator 3. -/
def rs_R003_ueqv_R003NY_partial_03_0251 : Poly :=
[
  term ((-4 : Rat) / 13) [(4, 1), (8, 1), (16, 1)],
  term ((2 : Rat) / 13) [(4, 2), (8, 1), (16, 1)],
  term ((2 : Rat) / 13) [(5, 2), (8, 1), (16, 1)],
  term ((-2 : Rat) / 13) [(8, 1), (9, 2), (16, 1)],
  term ((4 : Rat) / 13) [(8, 2), (16, 1)],
  term ((-2 : Rat) / 13) [(8, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 251 for generator 3. -/
theorem rs_R003_ueqv_R003NY_partial_03_0251_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_03_0251
        rs_R003_ueqv_R003NY_generator_03_0200_0270 =
      rs_R003_ueqv_R003NY_partial_03_0251 := by
  native_decide

/-- Coefficient term 252 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003NY_coefficient_03_0252 : Poly :=
[
  term ((400 : Rat) / 299) [(9, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 252 for generator 3. -/
def rs_R003_ueqv_R003NY_partial_03_0252 : Poly :=
[
  term ((-800 : Rat) / 299) [(4, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((400 : Rat) / 299) [(4, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((400 : Rat) / 299) [(5, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((800 : Rat) / 299) [(8, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-400 : Rat) / 299) [(8, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-400 : Rat) / 299) [(9, 3), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 252 for generator 3. -/
theorem rs_R003_ueqv_R003NY_partial_03_0252_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_03_0252
        rs_R003_ueqv_R003NY_generator_03_0200_0270 =
      rs_R003_ueqv_R003NY_partial_03_0252 := by
  native_decide

/-- Coefficient term 253 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003NY_coefficient_03_0253 : Poly :=
[
  term ((4 : Rat) / 13) [(9, 1), (11, 1), (16, 1)]
]

/-- Partial product 253 for generator 3. -/
def rs_R003_ueqv_R003NY_partial_03_0253 : Poly :=
[
  term ((-8 : Rat) / 13) [(4, 1), (9, 1), (11, 1), (16, 1)],
  term ((4 : Rat) / 13) [(4, 2), (9, 1), (11, 1), (16, 1)],
  term ((4 : Rat) / 13) [(5, 2), (9, 1), (11, 1), (16, 1)],
  term ((8 : Rat) / 13) [(8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-4 : Rat) / 13) [(8, 2), (9, 1), (11, 1), (16, 1)],
  term ((-4 : Rat) / 13) [(9, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 253 for generator 3. -/
theorem rs_R003_ueqv_R003NY_partial_03_0253_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_03_0253
        rs_R003_ueqv_R003NY_generator_03_0200_0270 =
      rs_R003_ueqv_R003NY_partial_03_0253 := by
  native_decide

/-- Coefficient term 254 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003NY_coefficient_03_0254 : Poly :=
[
  term ((-96 : Rat) / 13) [(9, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 254 for generator 3. -/
def rs_R003_ueqv_R003NY_partial_03_0254 : Poly :=
[
  term ((192 : Rat) / 13) [(4, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-96 : Rat) / 13) [(4, 2), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-96 : Rat) / 13) [(5, 2), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-192 : Rat) / 13) [(8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((96 : Rat) / 13) [(8, 2), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((96 : Rat) / 13) [(9, 3), (12, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 254 for generator 3. -/
theorem rs_R003_ueqv_R003NY_partial_03_0254_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_03_0254
        rs_R003_ueqv_R003NY_generator_03_0200_0270 =
      rs_R003_ueqv_R003NY_partial_03_0254 := by
  native_decide

/-- Coefficient term 255 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003NY_coefficient_03_0255 : Poly :=
[
  term ((24 : Rat) / 13) [(9, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 255 for generator 3. -/
def rs_R003_ueqv_R003NY_partial_03_0255 : Poly :=
[
  term ((-48 : Rat) / 13) [(4, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((24 : Rat) / 13) [(4, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((24 : Rat) / 13) [(5, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((48 : Rat) / 13) [(8, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-24 : Rat) / 13) [(8, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-24 : Rat) / 13) [(9, 3), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 255 for generator 3. -/
theorem rs_R003_ueqv_R003NY_partial_03_0255_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_03_0255
        rs_R003_ueqv_R003NY_generator_03_0200_0270 =
      rs_R003_ueqv_R003NY_partial_03_0255 := by
  native_decide

/-- Coefficient term 256 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003NY_coefficient_03_0256 : Poly :=
[
  term ((60 : Rat) / 13) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 256 for generator 3. -/
def rs_R003_ueqv_R003NY_partial_03_0256 : Poly :=
[
  term ((-120 : Rat) / 13) [(4, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((60 : Rat) / 13) [(4, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((60 : Rat) / 13) [(5, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((120 : Rat) / 13) [(8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-60 : Rat) / 13) [(8, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-60 : Rat) / 13) [(9, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 256 for generator 3. -/
theorem rs_R003_ueqv_R003NY_partial_03_0256_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_03_0256
        rs_R003_ueqv_R003NY_generator_03_0200_0270 =
      rs_R003_ueqv_R003NY_partial_03_0256 := by
  native_decide

/-- Coefficient term 257 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003NY_coefficient_03_0257 : Poly :=
[
  term ((-28 : Rat) / 13) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 257 for generator 3. -/
def rs_R003_ueqv_R003NY_partial_03_0257 : Poly :=
[
  term ((56 : Rat) / 13) [(4, 1), (9, 1), (13, 1), (16, 1)],
  term ((-28 : Rat) / 13) [(4, 2), (9, 1), (13, 1), (16, 1)],
  term ((-28 : Rat) / 13) [(5, 2), (9, 1), (13, 1), (16, 1)],
  term ((-56 : Rat) / 13) [(8, 1), (9, 1), (13, 1), (16, 1)],
  term ((28 : Rat) / 13) [(8, 2), (9, 1), (13, 1), (16, 1)],
  term ((28 : Rat) / 13) [(9, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 257 for generator 3. -/
theorem rs_R003_ueqv_R003NY_partial_03_0257_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_03_0257
        rs_R003_ueqv_R003NY_generator_03_0200_0270 =
      rs_R003_ueqv_R003NY_partial_03_0257 := by
  native_decide

/-- Coefficient term 258 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003NY_coefficient_03_0258 : Poly :=
[
  term ((-48 : Rat) / 13) [(11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 258 for generator 3. -/
def rs_R003_ueqv_R003NY_partial_03_0258 : Poly :=
[
  term ((96 : Rat) / 13) [(4, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-48 : Rat) / 13) [(4, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-48 : Rat) / 13) [(5, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-96 : Rat) / 13) [(8, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((48 : Rat) / 13) [(8, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((48 : Rat) / 13) [(9, 2), (11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 258 for generator 3. -/
theorem rs_R003_ueqv_R003NY_partial_03_0258_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_03_0258
        rs_R003_ueqv_R003NY_generator_03_0200_0270 =
      rs_R003_ueqv_R003NY_partial_03_0258 := by
  native_decide

/-- Coefficient term 259 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003NY_coefficient_03_0259 : Poly :=
[
  term ((36 : Rat) / 13) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 259 for generator 3. -/
def rs_R003_ueqv_R003NY_partial_03_0259 : Poly :=
[
  term ((-72 : Rat) / 13) [(4, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((36 : Rat) / 13) [(4, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((36 : Rat) / 13) [(5, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((72 : Rat) / 13) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-36 : Rat) / 13) [(8, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-36 : Rat) / 13) [(9, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 259 for generator 3. -/
theorem rs_R003_ueqv_R003NY_partial_03_0259_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_03_0259
        rs_R003_ueqv_R003NY_generator_03_0200_0270 =
      rs_R003_ueqv_R003NY_partial_03_0259 := by
  native_decide

/-- Coefficient term 260 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003NY_coefficient_03_0260 : Poly :=
[
  term ((-12 : Rat) / 13) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 260 for generator 3. -/
def rs_R003_ueqv_R003NY_partial_03_0260 : Poly :=
[
  term ((24 : Rat) / 13) [(4, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-12 : Rat) / 13) [(4, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-12 : Rat) / 13) [(5, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-24 : Rat) / 13) [(8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((12 : Rat) / 13) [(8, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((12 : Rat) / 13) [(9, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 260 for generator 3. -/
theorem rs_R003_ueqv_R003NY_partial_03_0260_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_03_0260
        rs_R003_ueqv_R003NY_generator_03_0200_0270 =
      rs_R003_ueqv_R003NY_partial_03_0260 := by
  native_decide

/-- Coefficient term 261 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003NY_coefficient_03_0261 : Poly :=
[
  term ((20 : Rat) / 23) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 261 for generator 3. -/
def rs_R003_ueqv_R003NY_partial_03_0261 : Poly :=
[
  term ((-40 : Rat) / 23) [(4, 1), (11, 1), (13, 1), (16, 1)],
  term ((20 : Rat) / 23) [(4, 2), (11, 1), (13, 1), (16, 1)],
  term ((20 : Rat) / 23) [(5, 2), (11, 1), (13, 1), (16, 1)],
  term ((40 : Rat) / 23) [(8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-20 : Rat) / 23) [(8, 2), (11, 1), (13, 1), (16, 1)],
  term ((-20 : Rat) / 23) [(9, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 261 for generator 3. -/
theorem rs_R003_ueqv_R003NY_partial_03_0261_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_03_0261
        rs_R003_ueqv_R003NY_generator_03_0200_0270 =
      rs_R003_ueqv_R003NY_partial_03_0261 := by
  native_decide

/-- Coefficient term 262 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003NY_coefficient_03_0262 : Poly :=
[
  term ((-1256 : Rat) / 299) [(11, 2), (12, 1), (16, 1)]
]

/-- Partial product 262 for generator 3. -/
def rs_R003_ueqv_R003NY_partial_03_0262 : Poly :=
[
  term ((2512 : Rat) / 299) [(4, 1), (11, 2), (12, 1), (16, 1)],
  term ((-1256 : Rat) / 299) [(4, 2), (11, 2), (12, 1), (16, 1)],
  term ((-1256 : Rat) / 299) [(5, 2), (11, 2), (12, 1), (16, 1)],
  term ((-2512 : Rat) / 299) [(8, 1), (11, 2), (12, 1), (16, 1)],
  term ((1256 : Rat) / 299) [(8, 2), (11, 2), (12, 1), (16, 1)],
  term ((1256 : Rat) / 299) [(9, 2), (11, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 262 for generator 3. -/
theorem rs_R003_ueqv_R003NY_partial_03_0262_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_03_0262
        rs_R003_ueqv_R003NY_generator_03_0200_0270 =
      rs_R003_ueqv_R003NY_partial_03_0262 := by
  native_decide

/-- Coefficient term 263 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003NY_coefficient_03_0263 : Poly :=
[
  term (-4 : Rat) [(12, 1), (16, 1)]
]

/-- Partial product 263 for generator 3. -/
def rs_R003_ueqv_R003NY_partial_03_0263 : Poly :=
[
  term (8 : Rat) [(4, 1), (12, 1), (16, 1)],
  term (-4 : Rat) [(4, 2), (12, 1), (16, 1)],
  term (-4 : Rat) [(5, 2), (12, 1), (16, 1)],
  term (-8 : Rat) [(8, 1), (12, 1), (16, 1)],
  term (4 : Rat) [(8, 2), (12, 1), (16, 1)],
  term (4 : Rat) [(9, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 263 for generator 3. -/
theorem rs_R003_ueqv_R003NY_partial_03_0263_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_03_0263
        rs_R003_ueqv_R003NY_generator_03_0200_0270 =
      rs_R003_ueqv_R003NY_partial_03_0263 := by
  native_decide

/-- Coefficient term 264 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003NY_coefficient_03_0264 : Poly :=
[
  term ((34 : Rat) / 13) [(12, 2), (16, 1)]
]

/-- Partial product 264 for generator 3. -/
def rs_R003_ueqv_R003NY_partial_03_0264 : Poly :=
[
  term ((-68 : Rat) / 13) [(4, 1), (12, 2), (16, 1)],
  term ((34 : Rat) / 13) [(4, 2), (12, 2), (16, 1)],
  term ((34 : Rat) / 13) [(5, 2), (12, 2), (16, 1)],
  term ((68 : Rat) / 13) [(8, 1), (12, 2), (16, 1)],
  term ((-34 : Rat) / 13) [(8, 2), (12, 2), (16, 1)],
  term ((-34 : Rat) / 13) [(9, 2), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 264 for generator 3. -/
theorem rs_R003_ueqv_R003NY_partial_03_0264_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_03_0264
        rs_R003_ueqv_R003NY_generator_03_0200_0270 =
      rs_R003_ueqv_R003NY_partial_03_0264 := by
  native_decide

/-- Coefficient term 265 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003NY_coefficient_03_0265 : Poly :=
[
  term ((-18 : Rat) / 13) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 265 for generator 3. -/
def rs_R003_ueqv_R003NY_partial_03_0265 : Poly :=
[
  term ((36 : Rat) / 13) [(4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-18 : Rat) / 13) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term ((-18 : Rat) / 13) [(5, 2), (13, 1), (15, 1), (16, 1)],
  term ((-36 : Rat) / 13) [(8, 1), (13, 1), (15, 1), (16, 1)],
  term ((18 : Rat) / 13) [(8, 2), (13, 1), (15, 1), (16, 1)],
  term ((18 : Rat) / 13) [(9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 265 for generator 3. -/
theorem rs_R003_ueqv_R003NY_partial_03_0265_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_03_0265
        rs_R003_ueqv_R003NY_generator_03_0200_0270 =
      rs_R003_ueqv_R003NY_partial_03_0265 := by
  native_decide

/-- Coefficient term 266 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003NY_coefficient_03_0266 : Poly :=
[
  term ((58 : Rat) / 13) [(13, 2), (16, 1)]
]

/-- Partial product 266 for generator 3. -/
def rs_R003_ueqv_R003NY_partial_03_0266 : Poly :=
[
  term ((-116 : Rat) / 13) [(4, 1), (13, 2), (16, 1)],
  term ((58 : Rat) / 13) [(4, 2), (13, 2), (16, 1)],
  term ((58 : Rat) / 13) [(5, 2), (13, 2), (16, 1)],
  term ((116 : Rat) / 13) [(8, 1), (13, 2), (16, 1)],
  term ((-58 : Rat) / 13) [(8, 2), (13, 2), (16, 1)],
  term ((-58 : Rat) / 13) [(9, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 266 for generator 3. -/
theorem rs_R003_ueqv_R003NY_partial_03_0266_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_03_0266
        rs_R003_ueqv_R003NY_generator_03_0200_0270 =
      rs_R003_ueqv_R003NY_partial_03_0266 := by
  native_decide

/-- Coefficient term 267 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003NY_coefficient_03_0267 : Poly :=
[
  term ((34 : Rat) / 13) [(14, 1), (16, 1)]
]

/-- Partial product 267 for generator 3. -/
def rs_R003_ueqv_R003NY_partial_03_0267 : Poly :=
[
  term ((-68 : Rat) / 13) [(4, 1), (14, 1), (16, 1)],
  term ((34 : Rat) / 13) [(4, 2), (14, 1), (16, 1)],
  term ((34 : Rat) / 13) [(5, 2), (14, 1), (16, 1)],
  term ((68 : Rat) / 13) [(8, 1), (14, 1), (16, 1)],
  term ((-34 : Rat) / 13) [(8, 2), (14, 1), (16, 1)],
  term ((-34 : Rat) / 13) [(9, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 267 for generator 3. -/
theorem rs_R003_ueqv_R003NY_partial_03_0267_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_03_0267
        rs_R003_ueqv_R003NY_generator_03_0200_0270 =
      rs_R003_ueqv_R003NY_partial_03_0267 := by
  native_decide

/-- Coefficient term 268 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003NY_coefficient_03_0268 : Poly :=
[
  term ((-17 : Rat) / 13) [(14, 2), (16, 1)]
]

/-- Partial product 268 for generator 3. -/
def rs_R003_ueqv_R003NY_partial_03_0268 : Poly :=
[
  term ((34 : Rat) / 13) [(4, 1), (14, 2), (16, 1)],
  term ((-17 : Rat) / 13) [(4, 2), (14, 2), (16, 1)],
  term ((-17 : Rat) / 13) [(5, 2), (14, 2), (16, 1)],
  term ((-34 : Rat) / 13) [(8, 1), (14, 2), (16, 1)],
  term ((17 : Rat) / 13) [(8, 2), (14, 2), (16, 1)],
  term ((17 : Rat) / 13) [(9, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 268 for generator 3. -/
theorem rs_R003_ueqv_R003NY_partial_03_0268_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_03_0268
        rs_R003_ueqv_R003NY_generator_03_0200_0270 =
      rs_R003_ueqv_R003NY_partial_03_0268 := by
  native_decide

/-- Coefficient term 269 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003NY_coefficient_03_0269 : Poly :=
[
  term ((-17 : Rat) / 13) [(15, 2), (16, 1)]
]

/-- Partial product 269 for generator 3. -/
def rs_R003_ueqv_R003NY_partial_03_0269 : Poly :=
[
  term ((34 : Rat) / 13) [(4, 1), (15, 2), (16, 1)],
  term ((-17 : Rat) / 13) [(4, 2), (15, 2), (16, 1)],
  term ((-17 : Rat) / 13) [(5, 2), (15, 2), (16, 1)],
  term ((-34 : Rat) / 13) [(8, 1), (15, 2), (16, 1)],
  term ((17 : Rat) / 13) [(8, 2), (15, 2), (16, 1)],
  term ((17 : Rat) / 13) [(9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 269 for generator 3. -/
theorem rs_R003_ueqv_R003NY_partial_03_0269_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_03_0269
        rs_R003_ueqv_R003NY_generator_03_0200_0270 =
      rs_R003_ueqv_R003NY_partial_03_0269 := by
  native_decide

/-- Coefficient term 270 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003NY_coefficient_03_0270 : Poly :=
[
  term ((-9 : Rat) / 13) [(16, 1)]
]

/-- Partial product 270 for generator 3. -/
def rs_R003_ueqv_R003NY_partial_03_0270 : Poly :=
[
  term ((18 : Rat) / 13) [(4, 1), (16, 1)],
  term ((-9 : Rat) / 13) [(4, 2), (16, 1)],
  term ((-9 : Rat) / 13) [(5, 2), (16, 1)],
  term ((-18 : Rat) / 13) [(8, 1), (16, 1)],
  term ((9 : Rat) / 13) [(8, 2), (16, 1)],
  term ((9 : Rat) / 13) [(9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 270 for generator 3. -/
theorem rs_R003_ueqv_R003NY_partial_03_0270_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_03_0270
        rs_R003_ueqv_R003NY_generator_03_0200_0270 =
      rs_R003_ueqv_R003NY_partial_03_0270 := by
  native_decide

/-- Partial products in this block. -/
def rs_R003_ueqv_R003NY_partials_03_0200_0270 : List Poly :=
[
  rs_R003_ueqv_R003NY_partial_03_0200,
  rs_R003_ueqv_R003NY_partial_03_0201,
  rs_R003_ueqv_R003NY_partial_03_0202,
  rs_R003_ueqv_R003NY_partial_03_0203,
  rs_R003_ueqv_R003NY_partial_03_0204,
  rs_R003_ueqv_R003NY_partial_03_0205,
  rs_R003_ueqv_R003NY_partial_03_0206,
  rs_R003_ueqv_R003NY_partial_03_0207,
  rs_R003_ueqv_R003NY_partial_03_0208,
  rs_R003_ueqv_R003NY_partial_03_0209,
  rs_R003_ueqv_R003NY_partial_03_0210,
  rs_R003_ueqv_R003NY_partial_03_0211,
  rs_R003_ueqv_R003NY_partial_03_0212,
  rs_R003_ueqv_R003NY_partial_03_0213,
  rs_R003_ueqv_R003NY_partial_03_0214,
  rs_R003_ueqv_R003NY_partial_03_0215,
  rs_R003_ueqv_R003NY_partial_03_0216,
  rs_R003_ueqv_R003NY_partial_03_0217,
  rs_R003_ueqv_R003NY_partial_03_0218,
  rs_R003_ueqv_R003NY_partial_03_0219,
  rs_R003_ueqv_R003NY_partial_03_0220,
  rs_R003_ueqv_R003NY_partial_03_0221,
  rs_R003_ueqv_R003NY_partial_03_0222,
  rs_R003_ueqv_R003NY_partial_03_0223,
  rs_R003_ueqv_R003NY_partial_03_0224,
  rs_R003_ueqv_R003NY_partial_03_0225,
  rs_R003_ueqv_R003NY_partial_03_0226,
  rs_R003_ueqv_R003NY_partial_03_0227,
  rs_R003_ueqv_R003NY_partial_03_0228,
  rs_R003_ueqv_R003NY_partial_03_0229,
  rs_R003_ueqv_R003NY_partial_03_0230,
  rs_R003_ueqv_R003NY_partial_03_0231,
  rs_R003_ueqv_R003NY_partial_03_0232,
  rs_R003_ueqv_R003NY_partial_03_0233,
  rs_R003_ueqv_R003NY_partial_03_0234,
  rs_R003_ueqv_R003NY_partial_03_0235,
  rs_R003_ueqv_R003NY_partial_03_0236,
  rs_R003_ueqv_R003NY_partial_03_0237,
  rs_R003_ueqv_R003NY_partial_03_0238,
  rs_R003_ueqv_R003NY_partial_03_0239,
  rs_R003_ueqv_R003NY_partial_03_0240,
  rs_R003_ueqv_R003NY_partial_03_0241,
  rs_R003_ueqv_R003NY_partial_03_0242,
  rs_R003_ueqv_R003NY_partial_03_0243,
  rs_R003_ueqv_R003NY_partial_03_0244,
  rs_R003_ueqv_R003NY_partial_03_0245,
  rs_R003_ueqv_R003NY_partial_03_0246,
  rs_R003_ueqv_R003NY_partial_03_0247,
  rs_R003_ueqv_R003NY_partial_03_0248,
  rs_R003_ueqv_R003NY_partial_03_0249,
  rs_R003_ueqv_R003NY_partial_03_0250,
  rs_R003_ueqv_R003NY_partial_03_0251,
  rs_R003_ueqv_R003NY_partial_03_0252,
  rs_R003_ueqv_R003NY_partial_03_0253,
  rs_R003_ueqv_R003NY_partial_03_0254,
  rs_R003_ueqv_R003NY_partial_03_0255,
  rs_R003_ueqv_R003NY_partial_03_0256,
  rs_R003_ueqv_R003NY_partial_03_0257,
  rs_R003_ueqv_R003NY_partial_03_0258,
  rs_R003_ueqv_R003NY_partial_03_0259,
  rs_R003_ueqv_R003NY_partial_03_0260,
  rs_R003_ueqv_R003NY_partial_03_0261,
  rs_R003_ueqv_R003NY_partial_03_0262,
  rs_R003_ueqv_R003NY_partial_03_0263,
  rs_R003_ueqv_R003NY_partial_03_0264,
  rs_R003_ueqv_R003NY_partial_03_0265,
  rs_R003_ueqv_R003NY_partial_03_0266,
  rs_R003_ueqv_R003NY_partial_03_0267,
  rs_R003_ueqv_R003NY_partial_03_0268,
  rs_R003_ueqv_R003NY_partial_03_0269,
  rs_R003_ueqv_R003NY_partial_03_0270
]

/-- Sum of partial products in this block. -/
def rs_R003_ueqv_R003NY_block_03_0200_0270 : Poly :=
[
  term ((-360 : Rat) / 23) [(2, 1), (4, 1), (12, 1), (16, 1)],
  term ((3360 : Rat) / 299) [(2, 1), (4, 1), (12, 2), (16, 1)],
  term ((8640 : Rat) / 299) [(2, 1), (4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4104 : Rat) / 299) [(2, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((8040 : Rat) / 299) [(2, 1), (4, 1), (13, 2), (16, 1)],
  term ((3164 : Rat) / 299) [(2, 1), (4, 1), (14, 1), (16, 1)],
  term ((-1680 : Rat) / 299) [(2, 1), (4, 1), (14, 2), (16, 1)],
  term ((120 : Rat) / 299) [(2, 1), (4, 1), (15, 2), (16, 1)],
  term ((-344 : Rat) / 299) [(2, 1), (4, 1), (16, 1)],
  term ((180 : Rat) / 23) [(2, 1), (4, 2), (12, 1), (16, 1)],
  term ((-1680 : Rat) / 299) [(2, 1), (4, 2), (12, 2), (16, 1)],
  term ((-4320 : Rat) / 299) [(2, 1), (4, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2052 : Rat) / 299) [(2, 1), (4, 2), (13, 1), (15, 1), (16, 1)],
  term ((-4020 : Rat) / 299) [(2, 1), (4, 2), (13, 2), (16, 1)],
  term ((-1582 : Rat) / 299) [(2, 1), (4, 2), (14, 1), (16, 1)],
  term ((840 : Rat) / 299) [(2, 1), (4, 2), (14, 2), (16, 1)],
  term ((-60 : Rat) / 299) [(2, 1), (4, 2), (15, 2), (16, 1)],
  term ((172 : Rat) / 299) [(2, 1), (4, 2), (16, 1)],
  term ((180 : Rat) / 23) [(2, 1), (5, 2), (12, 1), (16, 1)],
  term ((-1680 : Rat) / 299) [(2, 1), (5, 2), (12, 2), (16, 1)],
  term ((-4320 : Rat) / 299) [(2, 1), (5, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2052 : Rat) / 299) [(2, 1), (5, 2), (13, 1), (15, 1), (16, 1)],
  term ((-4020 : Rat) / 299) [(2, 1), (5, 2), (13, 2), (16, 1)],
  term ((-1582 : Rat) / 299) [(2, 1), (5, 2), (14, 1), (16, 1)],
  term ((840 : Rat) / 299) [(2, 1), (5, 2), (14, 2), (16, 1)],
  term ((-60 : Rat) / 299) [(2, 1), (5, 2), (15, 2), (16, 1)],
  term ((172 : Rat) / 299) [(2, 1), (5, 2), (16, 1)],
  term ((360 : Rat) / 23) [(2, 1), (8, 1), (12, 1), (16, 1)],
  term ((-3360 : Rat) / 299) [(2, 1), (8, 1), (12, 2), (16, 1)],
  term ((-8640 : Rat) / 299) [(2, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((4104 : Rat) / 299) [(2, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-8040 : Rat) / 299) [(2, 1), (8, 1), (13, 2), (16, 1)],
  term ((-3164 : Rat) / 299) [(2, 1), (8, 1), (14, 1), (16, 1)],
  term ((1680 : Rat) / 299) [(2, 1), (8, 1), (14, 2), (16, 1)],
  term ((-120 : Rat) / 299) [(2, 1), (8, 1), (15, 2), (16, 1)],
  term ((344 : Rat) / 299) [(2, 1), (8, 1), (16, 1)],
  term ((-180 : Rat) / 23) [(2, 1), (8, 2), (12, 1), (16, 1)],
  term ((1680 : Rat) / 299) [(2, 1), (8, 2), (12, 2), (16, 1)],
  term ((4320 : Rat) / 299) [(2, 1), (8, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2052 : Rat) / 299) [(2, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((4020 : Rat) / 299) [(2, 1), (8, 2), (13, 2), (16, 1)],
  term ((1582 : Rat) / 299) [(2, 1), (8, 2), (14, 1), (16, 1)],
  term ((-840 : Rat) / 299) [(2, 1), (8, 2), (14, 2), (16, 1)],
  term ((60 : Rat) / 299) [(2, 1), (8, 2), (15, 2), (16, 1)],
  term ((-172 : Rat) / 299) [(2, 1), (8, 2), (16, 1)],
  term ((-180 : Rat) / 23) [(2, 1), (9, 2), (12, 1), (16, 1)],
  term ((1680 : Rat) / 299) [(2, 1), (9, 2), (12, 2), (16, 1)],
  term ((4320 : Rat) / 299) [(2, 1), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2052 : Rat) / 299) [(2, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((4020 : Rat) / 299) [(2, 1), (9, 2), (13, 2), (16, 1)],
  term ((1582 : Rat) / 299) [(2, 1), (9, 2), (14, 1), (16, 1)],
  term ((-840 : Rat) / 299) [(2, 1), (9, 2), (14, 2), (16, 1)],
  term ((60 : Rat) / 299) [(2, 1), (9, 2), (15, 2), (16, 1)],
  term ((-172 : Rat) / 299) [(2, 1), (9, 2), (16, 1)],
  term ((-3360 : Rat) / 299) [(2, 2), (4, 1), (6, 1), (16, 1)],
  term ((-1200 : Rat) / 299) [(2, 2), (4, 1), (8, 1), (16, 1)],
  term ((-1200 : Rat) / 299) [(2, 2), (4, 1), (9, 1), (11, 1), (16, 1)],
  term ((14400 : Rat) / 299) [(2, 2), (4, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3600 : Rat) / 299) [(2, 2), (4, 1), (9, 1), (13, 1), (16, 1)],
  term ((8640 : Rat) / 299) [(2, 2), (4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8640 : Rat) / 299) [(2, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((7200 : Rat) / 299) [(2, 2), (4, 1), (11, 1), (13, 1), (16, 1)],
  term ((480 : Rat) / 299) [(2, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((3600 : Rat) / 299) [(2, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((360 : Rat) / 299) [(2, 2), (4, 1), (14, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(2, 2), (4, 1), (15, 2), (16, 1)],
  term ((-360 : Rat) / 299) [(2, 2), (4, 1), (16, 1)],
  term ((1680 : Rat) / 299) [(2, 2), (4, 2), (6, 1), (16, 1)],
  term ((600 : Rat) / 299) [(2, 2), (4, 2), (8, 1), (16, 1)],
  term ((600 : Rat) / 299) [(2, 2), (4, 2), (9, 1), (11, 1), (16, 1)],
  term ((-7200 : Rat) / 299) [(2, 2), (4, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(2, 2), (4, 2), (9, 1), (13, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(2, 2), (4, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(2, 2), (4, 2), (9, 1), (15, 1), (16, 1)],
  term ((-3600 : Rat) / 299) [(2, 2), (4, 2), (11, 1), (13, 1), (16, 1)],
  term ((-240 : Rat) / 299) [(2, 2), (4, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(2, 2), (4, 2), (13, 1), (15, 1), (16, 1)],
  term ((-180 : Rat) / 299) [(2, 2), (4, 2), (14, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(2, 2), (4, 2), (15, 2), (16, 1)],
  term ((180 : Rat) / 299) [(2, 2), (4, 2), (16, 1)],
  term ((1680 : Rat) / 299) [(2, 2), (5, 2), (6, 1), (16, 1)],
  term ((600 : Rat) / 299) [(2, 2), (5, 2), (8, 1), (16, 1)],
  term ((600 : Rat) / 299) [(2, 2), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-7200 : Rat) / 299) [(2, 2), (5, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(2, 2), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(2, 2), (5, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(2, 2), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-3600 : Rat) / 299) [(2, 2), (5, 2), (11, 1), (13, 1), (16, 1)],
  term ((-240 : Rat) / 299) [(2, 2), (5, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(2, 2), (5, 2), (13, 1), (15, 1), (16, 1)],
  term ((-180 : Rat) / 299) [(2, 2), (5, 2), (14, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(2, 2), (5, 2), (15, 2), (16, 1)],
  term ((180 : Rat) / 299) [(2, 2), (5, 2), (16, 1)],
  term ((3360 : Rat) / 299) [(2, 2), (6, 1), (8, 1), (16, 1)],
  term ((-1680 : Rat) / 299) [(2, 2), (6, 1), (8, 2), (16, 1)],
  term ((-1680 : Rat) / 299) [(2, 2), (6, 1), (9, 2), (16, 1)],
  term ((1200 : Rat) / 299) [(2, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-14400 : Rat) / 299) [(2, 2), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((3600 : Rat) / 299) [(2, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-8640 : Rat) / 299) [(2, 2), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((8640 : Rat) / 299) [(2, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-600 : Rat) / 299) [(2, 2), (8, 1), (9, 2), (16, 1)],
  term ((-7200 : Rat) / 299) [(2, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-480 : Rat) / 299) [(2, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3600 : Rat) / 299) [(2, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-360 : Rat) / 299) [(2, 2), (8, 1), (14, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(2, 2), (8, 1), (15, 2), (16, 1)],
  term ((360 : Rat) / 299) [(2, 2), (8, 1), (16, 1)],
  term ((-600 : Rat) / 299) [(2, 2), (8, 2), (9, 1), (11, 1), (16, 1)],
  term ((7200 : Rat) / 299) [(2, 2), (8, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(2, 2), (8, 2), (9, 1), (13, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(2, 2), (8, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(2, 2), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((3600 : Rat) / 299) [(2, 2), (8, 2), (11, 1), (13, 1), (16, 1)],
  term ((240 : Rat) / 299) [(2, 2), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(2, 2), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((180 : Rat) / 299) [(2, 2), (8, 2), (14, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(2, 2), (8, 2), (15, 2), (16, 1)],
  term ((1020 : Rat) / 299) [(2, 2), (8, 2), (16, 1)],
  term ((-600 : Rat) / 299) [(2, 2), (8, 3), (16, 1)],
  term ((3600 : Rat) / 299) [(2, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((240 : Rat) / 299) [(2, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(2, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((180 : Rat) / 299) [(2, 2), (9, 2), (14, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(2, 2), (9, 2), (15, 2), (16, 1)],
  term ((-180 : Rat) / 299) [(2, 2), (9, 2), (16, 1)],
  term ((-600 : Rat) / 299) [(2, 2), (9, 3), (11, 1), (16, 1)],
  term ((7200 : Rat) / 299) [(2, 2), (9, 3), (13, 1), (14, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(2, 2), (9, 3), (13, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(2, 2), (9, 3), (14, 1), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(2, 2), (9, 3), (15, 1), (16, 1)],
  term ((-5024 : Rat) / 299) [(3, 1), (4, 1), (5, 1), (8, 1), (14, 1), (16, 1)],
  term ((5024 : Rat) / 299) [(3, 1), (4, 1), (5, 1), (8, 1), (16, 1)],
  term ((2512 : Rat) / 299) [(3, 1), (4, 1), (5, 1), (14, 1), (16, 1)],
  term ((-2512 : Rat) / 299) [(3, 1), (4, 1), (5, 1), (16, 1)],
  term ((68 : Rat) / 13) [(3, 1), (4, 1), (7, 1), (16, 1)],
  term ((5024 : Rat) / 299) [(3, 1), (4, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-2512 : Rat) / 299) [(3, 1), (4, 1), (8, 1), (11, 1), (16, 1)],
  term ((192 : Rat) / 13) [(3, 1), (4, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((96 : Rat) / 13) [(3, 1), (4, 1), (8, 1), (13, 1), (16, 1)],
  term ((-120 : Rat) / 13) [(3, 1), (4, 1), (8, 1), (15, 1), (16, 1)],
  term ((-144 : Rat) / 13) [(3, 1), (4, 1), (9, 1), (12, 1), (16, 1)],
  term ((-28 : Rat) / 13) [(3, 1), (4, 1), (9, 1), (16, 1)],
  term ((-144 : Rat) / 13) [(3, 1), (4, 1), (11, 1), (12, 1), (16, 1)],
  term ((-2512 : Rat) / 299) [(3, 1), (4, 1), (11, 1), (14, 1), (16, 1)],
  term ((2512 : Rat) / 299) [(3, 1), (4, 1), (11, 1), (16, 1)],
  term ((48 : Rat) / 13) [(3, 1), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((120 : Rat) / 13) [(3, 1), (4, 1), (13, 1), (16, 1)],
  term ((-36 : Rat) / 13) [(3, 1), (4, 1), (15, 1), (16, 1)],
  term ((2512 : Rat) / 299) [(3, 1), (4, 2), (5, 1), (8, 1), (14, 1), (16, 1)],
  term ((-2512 : Rat) / 299) [(3, 1), (4, 2), (5, 1), (8, 1), (16, 1)],
  term ((-1256 : Rat) / 299) [(3, 1), (4, 2), (5, 1), (14, 1), (16, 1)],
  term ((1256 : Rat) / 299) [(3, 1), (4, 2), (5, 1), (16, 1)],
  term ((-34 : Rat) / 13) [(3, 1), (4, 2), (7, 1), (16, 1)],
  term ((-2512 : Rat) / 299) [(3, 1), (4, 2), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((1256 : Rat) / 299) [(3, 1), (4, 2), (8, 1), (11, 1), (16, 1)],
  term ((-96 : Rat) / 13) [(3, 1), (4, 2), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-48 : Rat) / 13) [(3, 1), (4, 2), (8, 1), (13, 1), (16, 1)],
  term ((60 : Rat) / 13) [(3, 1), (4, 2), (8, 1), (15, 1), (16, 1)],
  term ((72 : Rat) / 13) [(3, 1), (4, 2), (9, 1), (12, 1), (16, 1)],
  term ((14 : Rat) / 13) [(3, 1), (4, 2), (9, 1), (16, 1)],
  term ((72 : Rat) / 13) [(3, 1), (4, 2), (11, 1), (12, 1), (16, 1)],
  term ((1256 : Rat) / 299) [(3, 1), (4, 2), (11, 1), (14, 1), (16, 1)],
  term ((-1256 : Rat) / 299) [(3, 1), (4, 2), (11, 1), (16, 1)],
  term ((-24 : Rat) / 13) [(3, 1), (4, 2), (12, 1), (15, 1), (16, 1)],
  term ((-60 : Rat) / 13) [(3, 1), (4, 2), (13, 1), (16, 1)],
  term ((18 : Rat) / 13) [(3, 1), (4, 2), (15, 1), (16, 1)],
  term ((-2512 : Rat) / 299) [(3, 1), (5, 1), (8, 1), (9, 2), (14, 1), (16, 1)],
  term ((2512 : Rat) / 299) [(3, 1), (5, 1), (8, 1), (9, 2), (16, 1)],
  term ((-2512 : Rat) / 299) [(3, 1), (5, 1), (8, 1), (14, 1), (16, 1)],
  term ((2512 : Rat) / 299) [(3, 1), (5, 1), (8, 1), (16, 1)],
  term ((6280 : Rat) / 299) [(3, 1), (5, 1), (8, 2), (14, 1), (16, 1)],
  term ((-6280 : Rat) / 299) [(3, 1), (5, 1), (8, 2), (16, 1)],
  term ((-2512 : Rat) / 299) [(3, 1), (5, 1), (8, 3), (14, 1), (16, 1)],
  term ((2512 : Rat) / 299) [(3, 1), (5, 1), (8, 3), (16, 1)],
  term ((1256 : Rat) / 299) [(3, 1), (5, 1), (9, 2), (14, 1), (16, 1)],
  term ((-1256 : Rat) / 299) [(3, 1), (5, 1), (9, 2), (16, 1)],
  term ((-34 : Rat) / 13) [(3, 1), (5, 2), (7, 1), (16, 1)],
  term ((-2512 : Rat) / 299) [(3, 1), (5, 2), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((1256 : Rat) / 299) [(3, 1), (5, 2), (8, 1), (11, 1), (16, 1)],
  term ((-96 : Rat) / 13) [(3, 1), (5, 2), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-48 : Rat) / 13) [(3, 1), (5, 2), (8, 1), (13, 1), (16, 1)],
  term ((60 : Rat) / 13) [(3, 1), (5, 2), (8, 1), (15, 1), (16, 1)],
  term ((72 : Rat) / 13) [(3, 1), (5, 2), (9, 1), (12, 1), (16, 1)],
  term ((14 : Rat) / 13) [(3, 1), (5, 2), (9, 1), (16, 1)],
  term ((72 : Rat) / 13) [(3, 1), (5, 2), (11, 1), (12, 1), (16, 1)],
  term ((1256 : Rat) / 299) [(3, 1), (5, 2), (11, 1), (14, 1), (16, 1)],
  term ((-1256 : Rat) / 299) [(3, 1), (5, 2), (11, 1), (16, 1)],
  term ((-24 : Rat) / 13) [(3, 1), (5, 2), (12, 1), (15, 1), (16, 1)],
  term ((-60 : Rat) / 13) [(3, 1), (5, 2), (13, 1), (16, 1)],
  term ((18 : Rat) / 13) [(3, 1), (5, 2), (15, 1), (16, 1)],
  term ((2512 : Rat) / 299) [(3, 1), (5, 3), (8, 1), (14, 1), (16, 1)],
  term ((-2512 : Rat) / 299) [(3, 1), (5, 3), (8, 1), (16, 1)],
  term ((-1256 : Rat) / 299) [(3, 1), (5, 3), (14, 1), (16, 1)],
  term ((1256 : Rat) / 299) [(3, 1), (5, 3), (16, 1)],
  term ((-68 : Rat) / 13) [(3, 1), (7, 1), (8, 1), (16, 1)],
  term ((34 : Rat) / 13) [(3, 1), (7, 1), (8, 2), (16, 1)],
  term ((34 : Rat) / 13) [(3, 1), (7, 1), (9, 2), (16, 1)],
  term ((144 : Rat) / 13) [(3, 1), (8, 1), (9, 1), (12, 1), (16, 1)],
  term ((28 : Rat) / 13) [(3, 1), (8, 1), (9, 1), (16, 1)],
  term ((2512 : Rat) / 299) [(3, 1), (8, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((-1256 : Rat) / 299) [(3, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((96 : Rat) / 13) [(3, 1), (8, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((48 : Rat) / 13) [(3, 1), (8, 1), (9, 2), (13, 1), (16, 1)],
  term ((-60 : Rat) / 13) [(3, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((144 : Rat) / 13) [(3, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((2512 : Rat) / 299) [(3, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-2512 : Rat) / 299) [(3, 1), (8, 1), (11, 1), (16, 1)],
  term ((-48 : Rat) / 13) [(3, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-120 : Rat) / 13) [(3, 1), (8, 1), (13, 1), (16, 1)],
  term ((36 : Rat) / 13) [(3, 1), (8, 1), (15, 1), (16, 1)],
  term ((-72 : Rat) / 13) [(3, 1), (8, 2), (9, 1), (12, 1), (16, 1)],
  term ((-14 : Rat) / 13) [(3, 1), (8, 2), (9, 1), (16, 1)],
  term ((-72 : Rat) / 13) [(3, 1), (8, 2), (11, 1), (12, 1), (16, 1)],
  term ((-6280 : Rat) / 299) [(3, 1), (8, 2), (11, 1), (14, 1), (16, 1)],
  term ((3768 : Rat) / 299) [(3, 1), (8, 2), (11, 1), (16, 1)],
  term ((24 : Rat) / 13) [(3, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((-192 : Rat) / 13) [(3, 1), (8, 2), (13, 1), (14, 1), (16, 1)],
  term ((-36 : Rat) / 13) [(3, 1), (8, 2), (13, 1), (16, 1)],
  term ((102 : Rat) / 13) [(3, 1), (8, 2), (15, 1), (16, 1)],
  term ((2512 : Rat) / 299) [(3, 1), (8, 3), (11, 1), (14, 1), (16, 1)],
  term ((-1256 : Rat) / 299) [(3, 1), (8, 3), (11, 1), (16, 1)],
  term ((96 : Rat) / 13) [(3, 1), (8, 3), (13, 1), (14, 1), (16, 1)],
  term ((48 : Rat) / 13) [(3, 1), (8, 3), (13, 1), (16, 1)],
  term ((-60 : Rat) / 13) [(3, 1), (8, 3), (15, 1), (16, 1)],
  term ((-72 : Rat) / 13) [(3, 1), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((-1256 : Rat) / 299) [(3, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((1256 : Rat) / 299) [(3, 1), (9, 2), (11, 1), (16, 1)],
  term ((24 : Rat) / 13) [(3, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((60 : Rat) / 13) [(3, 1), (9, 2), (13, 1), (16, 1)],
  term ((-18 : Rat) / 13) [(3, 1), (9, 2), (15, 1), (16, 1)],
  term ((-72 : Rat) / 13) [(3, 1), (9, 3), (12, 1), (16, 1)],
  term ((-14 : Rat) / 13) [(3, 1), (9, 3), (16, 1)],
  term ((-144 : Rat) / 13) [(3, 2), (4, 1), (8, 1), (16, 1)],
  term ((72 : Rat) / 13) [(3, 2), (4, 2), (8, 1), (16, 1)],
  term ((72 : Rat) / 13) [(3, 2), (5, 2), (8, 1), (16, 1)],
  term ((-72 : Rat) / 13) [(3, 2), (8, 1), (9, 2), (16, 1)],
  term ((144 : Rat) / 13) [(3, 2), (8, 2), (16, 1)],
  term ((-72 : Rat) / 13) [(3, 2), (8, 3), (16, 1)],
  term ((-48 : Rat) / 13) [(4, 1), (5, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((24 : Rat) / 13) [(4, 1), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((-24 : Rat) / 13) [(4, 1), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((-24 : Rat) / 13) [(4, 1), (5, 1), (13, 1), (16, 1)],
  term ((-68 : Rat) / 13) [(4, 1), (6, 1), (16, 1)],
  term ((48 : Rat) / 13) [(4, 1), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2328 : Rat) / 299) [(4, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((120 : Rat) / 13) [(4, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-192 : Rat) / 13) [(4, 1), (8, 1), (13, 2), (14, 1), (16, 1)],
  term ((48 : Rat) / 13) [(4, 1), (8, 1), (13, 2), (16, 1)],
  term ((-4 : Rat) / 13) [(4, 1), (8, 1), (16, 1)],
  term ((-800 : Rat) / 299) [(4, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-8 : Rat) / 13) [(4, 1), (9, 1), (11, 1), (16, 1)],
  term ((192 : Rat) / 13) [(4, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-48 : Rat) / 13) [(4, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-120 : Rat) / 13) [(4, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((56 : Rat) / 13) [(4, 1), (9, 1), (13, 1), (16, 1)],
  term ((96 : Rat) / 13) [(4, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-72 : Rat) / 13) [(4, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((24 : Rat) / 13) [(4, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-40 : Rat) / 23) [(4, 1), (11, 1), (13, 1), (16, 1)],
  term ((2512 : Rat) / 299) [(4, 1), (11, 2), (12, 1), (16, 1)],
  term (8 : Rat) [(4, 1), (12, 1), (16, 1)],
  term ((-68 : Rat) / 13) [(4, 1), (12, 2), (16, 1)],
  term ((36 : Rat) / 13) [(4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-116 : Rat) / 13) [(4, 1), (13, 2), (16, 1)],
  term ((-68 : Rat) / 13) [(4, 1), (14, 1), (16, 1)],
  term ((34 : Rat) / 13) [(4, 1), (14, 2), (16, 1)],
  term ((34 : Rat) / 13) [(4, 1), (15, 2), (16, 1)],
  term ((18 : Rat) / 13) [(4, 1), (16, 1)],
  term ((24 : Rat) / 13) [(4, 2), (5, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-12 : Rat) / 13) [(4, 2), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((12 : Rat) / 13) [(4, 2), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((12 : Rat) / 13) [(4, 2), (5, 1), (13, 1), (16, 1)],
  term ((34 : Rat) / 13) [(4, 2), (6, 1), (16, 1)],
  term ((-24 : Rat) / 13) [(4, 2), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((1164 : Rat) / 299) [(4, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-60 : Rat) / 13) [(4, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((96 : Rat) / 13) [(4, 2), (8, 1), (13, 2), (14, 1), (16, 1)],
  term ((-24 : Rat) / 13) [(4, 2), (8, 1), (13, 2), (16, 1)],
  term ((2 : Rat) / 13) [(4, 2), (8, 1), (16, 1)],
  term ((400 : Rat) / 299) [(4, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((4 : Rat) / 13) [(4, 2), (9, 1), (11, 1), (16, 1)],
  term ((-96 : Rat) / 13) [(4, 2), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((24 : Rat) / 13) [(4, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((60 : Rat) / 13) [(4, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-28 : Rat) / 13) [(4, 2), (9, 1), (13, 1), (16, 1)],
  term ((-48 : Rat) / 13) [(4, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((36 : Rat) / 13) [(4, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-12 : Rat) / 13) [(4, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((20 : Rat) / 23) [(4, 2), (11, 1), (13, 1), (16, 1)],
  term ((-1256 : Rat) / 299) [(4, 2), (11, 2), (12, 1), (16, 1)],
  term (-4 : Rat) [(4, 2), (12, 1), (16, 1)],
  term ((34 : Rat) / 13) [(4, 2), (12, 2), (16, 1)],
  term ((-18 : Rat) / 13) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term ((58 : Rat) / 13) [(4, 2), (13, 2), (16, 1)],
  term ((34 : Rat) / 13) [(4, 2), (14, 1), (16, 1)],
  term ((-17 : Rat) / 13) [(4, 2), (14, 2), (16, 1)],
  term ((-17 : Rat) / 13) [(4, 2), (15, 2), (16, 1)],
  term ((-9 : Rat) / 13) [(4, 2), (16, 1)],
  term ((-24 : Rat) / 13) [(5, 1), (8, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((12 : Rat) / 13) [(5, 1), (8, 1), (9, 2), (13, 1), (16, 1)],
  term ((24 : Rat) / 13) [(5, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((24 : Rat) / 13) [(5, 1), (8, 1), (13, 1), (16, 1)],
  term ((36 : Rat) / 13) [(5, 1), (8, 2), (13, 1), (14, 1), (16, 1)],
  term ((-36 : Rat) / 13) [(5, 1), (8, 2), (13, 1), (16, 1)],
  term ((-24 : Rat) / 13) [(5, 1), (8, 3), (13, 1), (14, 1), (16, 1)],
  term ((12 : Rat) / 13) [(5, 1), (8, 3), (13, 1), (16, 1)],
  term ((-12 : Rat) / 13) [(5, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((-12 : Rat) / 13) [(5, 1), (9, 2), (13, 1), (16, 1)],
  term ((34 : Rat) / 13) [(5, 2), (6, 1), (16, 1)],
  term ((-24 : Rat) / 13) [(5, 2), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((1164 : Rat) / 299) [(5, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-60 : Rat) / 13) [(5, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((96 : Rat) / 13) [(5, 2), (8, 1), (13, 2), (14, 1), (16, 1)],
  term ((-24 : Rat) / 13) [(5, 2), (8, 1), (13, 2), (16, 1)],
  term ((2 : Rat) / 13) [(5, 2), (8, 1), (16, 1)],
  term ((400 : Rat) / 299) [(5, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((4 : Rat) / 13) [(5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-96 : Rat) / 13) [(5, 2), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((24 : Rat) / 13) [(5, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((60 : Rat) / 13) [(5, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-28 : Rat) / 13) [(5, 2), (9, 1), (13, 1), (16, 1)],
  term ((-48 : Rat) / 13) [(5, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((36 : Rat) / 13) [(5, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-12 : Rat) / 13) [(5, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((20 : Rat) / 23) [(5, 2), (11, 1), (13, 1), (16, 1)],
  term ((-1256 : Rat) / 299) [(5, 2), (11, 2), (12, 1), (16, 1)],
  term (-4 : Rat) [(5, 2), (12, 1), (16, 1)],
  term ((34 : Rat) / 13) [(5, 2), (12, 2), (16, 1)],
  term ((-18 : Rat) / 13) [(5, 2), (13, 1), (15, 1), (16, 1)],
  term ((58 : Rat) / 13) [(5, 2), (13, 2), (16, 1)],
  term ((34 : Rat) / 13) [(5, 2), (14, 1), (16, 1)],
  term ((-17 : Rat) / 13) [(5, 2), (14, 2), (16, 1)],
  term ((-17 : Rat) / 13) [(5, 2), (15, 2), (16, 1)],
  term ((-9 : Rat) / 13) [(5, 2), (16, 1)],
  term ((24 : Rat) / 13) [(5, 3), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-12 : Rat) / 13) [(5, 3), (8, 1), (13, 1), (16, 1)],
  term ((12 : Rat) / 13) [(5, 3), (13, 1), (14, 1), (16, 1)],
  term ((12 : Rat) / 13) [(5, 3), (13, 1), (16, 1)],
  term ((68 : Rat) / 13) [(6, 1), (8, 1), (16, 1)],
  term ((-34 : Rat) / 13) [(6, 1), (8, 2), (16, 1)],
  term ((-34 : Rat) / 13) [(6, 1), (9, 2), (16, 1)],
  term ((800 : Rat) / 299) [(8, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((8 : Rat) / 13) [(8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-192 : Rat) / 13) [(8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((48 : Rat) / 13) [(8, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((120 : Rat) / 13) [(8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-56 : Rat) / 13) [(8, 1), (9, 1), (13, 1), (16, 1)],
  term ((24 : Rat) / 13) [(8, 1), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1164 : Rat) / 299) [(8, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((60 : Rat) / 13) [(8, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-96 : Rat) / 13) [(8, 1), (9, 2), (13, 2), (14, 1), (16, 1)],
  term ((24 : Rat) / 13) [(8, 1), (9, 2), (13, 2), (16, 1)],
  term ((-2 : Rat) / 13) [(8, 1), (9, 2), (16, 1)],
  term ((-96 : Rat) / 13) [(8, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((72 : Rat) / 13) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-24 : Rat) / 13) [(8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((40 : Rat) / 23) [(8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-2512 : Rat) / 299) [(8, 1), (11, 2), (12, 1), (16, 1)],
  term (-8 : Rat) [(8, 1), (12, 1), (16, 1)],
  term ((68 : Rat) / 13) [(8, 1), (12, 2), (16, 1)],
  term ((-36 : Rat) / 13) [(8, 1), (13, 1), (15, 1), (16, 1)],
  term ((116 : Rat) / 13) [(8, 1), (13, 2), (16, 1)],
  term ((68 : Rat) / 13) [(8, 1), (14, 1), (16, 1)],
  term ((-34 : Rat) / 13) [(8, 1), (14, 2), (16, 1)],
  term ((-34 : Rat) / 13) [(8, 1), (15, 2), (16, 1)],
  term ((-18 : Rat) / 13) [(8, 1), (16, 1)],
  term ((-400 : Rat) / 299) [(8, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-4 : Rat) / 13) [(8, 2), (9, 1), (11, 1), (16, 1)],
  term ((96 : Rat) / 13) [(8, 2), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-24 : Rat) / 13) [(8, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-60 : Rat) / 13) [(8, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((28 : Rat) / 13) [(8, 2), (9, 1), (13, 1), (16, 1)],
  term ((48 : Rat) / 13) [(8, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-36 : Rat) / 13) [(8, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-36 : Rat) / 13) [(8, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((2068 : Rat) / 299) [(8, 2), (11, 1), (13, 1), (16, 1)],
  term ((1256 : Rat) / 299) [(8, 2), (11, 2), (12, 1), (16, 1)],
  term (4 : Rat) [(8, 2), (12, 1), (16, 1)],
  term ((-34 : Rat) / 13) [(8, 2), (12, 2), (16, 1)],
  term ((-102 : Rat) / 13) [(8, 2), (13, 1), (15, 1), (16, 1)],
  term ((192 : Rat) / 13) [(8, 2), (13, 2), (14, 1), (16, 1)],
  term ((-106 : Rat) / 13) [(8, 2), (13, 2), (16, 1)],
  term ((-34 : Rat) / 13) [(8, 2), (14, 1), (16, 1)],
  term ((17 : Rat) / 13) [(8, 2), (14, 2), (16, 1)],
  term ((17 : Rat) / 13) [(8, 2), (15, 2), (16, 1)],
  term (1 : Rat) [(8, 2), (16, 1)],
  term ((24 : Rat) / 13) [(8, 3), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1164 : Rat) / 299) [(8, 3), (11, 1), (13, 1), (16, 1)],
  term ((60 : Rat) / 13) [(8, 3), (13, 1), (15, 1), (16, 1)],
  term ((-96 : Rat) / 13) [(8, 3), (13, 2), (14, 1), (16, 1)],
  term ((24 : Rat) / 13) [(8, 3), (13, 2), (16, 1)],
  term ((-2 : Rat) / 13) [(8, 3), (16, 1)],
  term ((48 : Rat) / 13) [(9, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-36 : Rat) / 13) [(9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((12 : Rat) / 13) [(9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-20 : Rat) / 23) [(9, 2), (11, 1), (13, 1), (16, 1)],
  term ((1256 : Rat) / 299) [(9, 2), (11, 2), (12, 1), (16, 1)],
  term (4 : Rat) [(9, 2), (12, 1), (16, 1)],
  term ((-34 : Rat) / 13) [(9, 2), (12, 2), (16, 1)],
  term ((18 : Rat) / 13) [(9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-58 : Rat) / 13) [(9, 2), (13, 2), (16, 1)],
  term ((-34 : Rat) / 13) [(9, 2), (14, 1), (16, 1)],
  term ((17 : Rat) / 13) [(9, 2), (14, 2), (16, 1)],
  term ((17 : Rat) / 13) [(9, 2), (15, 2), (16, 1)],
  term ((9 : Rat) / 13) [(9, 2), (16, 1)],
  term ((-400 : Rat) / 299) [(9, 3), (11, 1), (12, 1), (16, 1)],
  term ((-4 : Rat) / 13) [(9, 3), (11, 1), (16, 1)],
  term ((96 : Rat) / 13) [(9, 3), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-24 : Rat) / 13) [(9, 3), (12, 1), (13, 1), (16, 1)],
  term ((-60 : Rat) / 13) [(9, 3), (12, 1), (15, 1), (16, 1)],
  term ((28 : Rat) / 13) [(9, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 3, terms 200 through 270. -/
theorem rs_R003_ueqv_R003NY_block_03_0200_0270_valid :
    checkProductSumEq rs_R003_ueqv_R003NY_partials_03_0200_0270
      rs_R003_ueqv_R003NY_block_03_0200_0270 = true := by
  native_decide

end R003UeqvR003NYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
