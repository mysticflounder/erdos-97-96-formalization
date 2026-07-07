/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R003:u=v:R003NY, term block 11:200-241

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R003UeqvR003NYTermShards

/-- Generator polynomial 11 for relaxed split surplus certificate `R003:u=v:R003NY`. -/
def rs_R003_ueqv_R003NY_generator_11_0200_0241 : Poly :=
[
  term (-2 : Rat) [(0, 1), (2, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (3, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(2, 1), (4, 1)],
  term (2 : Rat) [(3, 1), (5, 1)],
  term (-1 : Rat) [(4, 2)],
  term (-1 : Rat) [(5, 2)]
]

/-- Coefficient term 200 from coefficient polynomial 11. -/
def rs_R003_ueqv_R003NY_coefficient_11_0200 : Poly :=
[
  term ((1800 : Rat) / 299) [(2, 2), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 200 for generator 11. -/
def rs_R003_ueqv_R003NY_partial_11_0200 : Poly :=
[
  term ((-3600 : Rat) / 299) [(0, 1), (2, 3), (9, 1), (13, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(0, 2), (2, 2), (9, 1), (13, 1), (16, 1)],
  term ((-3600 : Rat) / 299) [(1, 1), (2, 2), (3, 1), (9, 1), (13, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(1, 2), (2, 2), (9, 1), (13, 1), (16, 1)],
  term ((3600 : Rat) / 299) [(2, 2), (3, 1), (5, 1), (9, 1), (13, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(2, 2), (4, 2), (9, 1), (13, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(2, 2), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((3600 : Rat) / 299) [(2, 3), (4, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 11. -/
theorem rs_R003_ueqv_R003NY_partial_11_0200_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_11_0200
        rs_R003_ueqv_R003NY_generator_11_0200_0241 =
      rs_R003_ueqv_R003NY_partial_11_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 11. -/
def rs_R003_ueqv_R003NY_coefficient_11_0201 : Poly :=
[
  term ((-8640 : Rat) / 299) [(2, 2), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 201 for generator 11. -/
def rs_R003_ueqv_R003NY_partial_11_0201 : Poly :=
[
  term ((17280 : Rat) / 299) [(0, 1), (2, 3), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8640 : Rat) / 299) [(0, 2), (2, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((17280 : Rat) / 299) [(1, 1), (2, 2), (3, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8640 : Rat) / 299) [(1, 2), (2, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-17280 : Rat) / 299) [(2, 2), (3, 1), (5, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((8640 : Rat) / 299) [(2, 2), (4, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((8640 : Rat) / 299) [(2, 2), (5, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-17280 : Rat) / 299) [(2, 3), (4, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 11. -/
theorem rs_R003_ueqv_R003NY_partial_11_0201_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_11_0201
        rs_R003_ueqv_R003NY_generator_11_0200_0241 =
      rs_R003_ueqv_R003NY_partial_11_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 11. -/
def rs_R003_ueqv_R003NY_coefficient_11_0202 : Poly :=
[
  term ((4320 : Rat) / 299) [(2, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 202 for generator 11. -/
def rs_R003_ueqv_R003NY_partial_11_0202 : Poly :=
[
  term ((-8640 : Rat) / 299) [(0, 1), (2, 3), (9, 1), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(0, 2), (2, 2), (9, 1), (15, 1), (16, 1)],
  term ((-8640 : Rat) / 299) [(1, 1), (2, 2), (3, 1), (9, 1), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(1, 2), (2, 2), (9, 1), (15, 1), (16, 1)],
  term ((8640 : Rat) / 299) [(2, 2), (3, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(2, 2), (4, 2), (9, 1), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(2, 2), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((8640 : Rat) / 299) [(2, 3), (4, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 11. -/
theorem rs_R003_ueqv_R003NY_partial_11_0202_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_11_0202
        rs_R003_ueqv_R003NY_generator_11_0200_0241 =
      rs_R003_ueqv_R003NY_partial_11_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 11. -/
def rs_R003_ueqv_R003NY_coefficient_11_0203 : Poly :=
[
  term ((1200 : Rat) / 299) [(2, 2), (9, 2), (16, 1)]
]

/-- Partial product 203 for generator 11. -/
def rs_R003_ueqv_R003NY_partial_11_0203 : Poly :=
[
  term ((-2400 : Rat) / 299) [(0, 1), (2, 3), (9, 2), (16, 1)],
  term ((1200 : Rat) / 299) [(0, 2), (2, 2), (9, 2), (16, 1)],
  term ((-2400 : Rat) / 299) [(1, 1), (2, 2), (3, 1), (9, 2), (16, 1)],
  term ((1200 : Rat) / 299) [(1, 2), (2, 2), (9, 2), (16, 1)],
  term ((2400 : Rat) / 299) [(2, 2), (3, 1), (5, 1), (9, 2), (16, 1)],
  term ((-1200 : Rat) / 299) [(2, 2), (4, 2), (9, 2), (16, 1)],
  term ((-1200 : Rat) / 299) [(2, 2), (5, 2), (9, 2), (16, 1)],
  term ((2400 : Rat) / 299) [(2, 3), (4, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 11. -/
theorem rs_R003_ueqv_R003NY_partial_11_0203_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_11_0203
        rs_R003_ueqv_R003NY_generator_11_0200_0241 =
      rs_R003_ueqv_R003NY_partial_11_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 11. -/
def rs_R003_ueqv_R003NY_coefficient_11_0204 : Poly :=
[
  term ((-240 : Rat) / 299) [(2, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 204 for generator 11. -/
def rs_R003_ueqv_R003NY_partial_11_0204 : Poly :=
[
  term ((480 : Rat) / 299) [(0, 1), (2, 3), (11, 1), (15, 1), (16, 1)],
  term ((-240 : Rat) / 299) [(0, 2), (2, 2), (11, 1), (15, 1), (16, 1)],
  term ((480 : Rat) / 299) [(1, 1), (2, 2), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((-240 : Rat) / 299) [(1, 2), (2, 2), (11, 1), (15, 1), (16, 1)],
  term ((-480 : Rat) / 299) [(2, 2), (3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((240 : Rat) / 299) [(2, 2), (4, 2), (11, 1), (15, 1), (16, 1)],
  term ((240 : Rat) / 299) [(2, 2), (5, 2), (11, 1), (15, 1), (16, 1)],
  term ((-480 : Rat) / 299) [(2, 3), (4, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 11. -/
theorem rs_R003_ueqv_R003NY_partial_11_0204_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_11_0204
        rs_R003_ueqv_R003NY_generator_11_0200_0241 =
      rs_R003_ueqv_R003NY_partial_11_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 11. -/
def rs_R003_ueqv_R003NY_coefficient_11_0205 : Poly :=
[
  term ((-3600 : Rat) / 299) [(2, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 205 for generator 11. -/
def rs_R003_ueqv_R003NY_partial_11_0205 : Poly :=
[
  term ((7200 : Rat) / 299) [(0, 1), (2, 3), (13, 1), (15, 1), (16, 1)],
  term ((-3600 : Rat) / 299) [(0, 2), (2, 2), (13, 1), (15, 1), (16, 1)],
  term ((7200 : Rat) / 299) [(1, 1), (2, 2), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3600 : Rat) / 299) [(1, 2), (2, 2), (13, 1), (15, 1), (16, 1)],
  term ((-7200 : Rat) / 299) [(2, 2), (3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((3600 : Rat) / 299) [(2, 2), (4, 2), (13, 1), (15, 1), (16, 1)],
  term ((3600 : Rat) / 299) [(2, 2), (5, 2), (13, 1), (15, 1), (16, 1)],
  term ((-7200 : Rat) / 299) [(2, 3), (4, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 11. -/
theorem rs_R003_ueqv_R003NY_partial_11_0205_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_11_0205
        rs_R003_ueqv_R003NY_generator_11_0200_0241 =
      rs_R003_ueqv_R003NY_partial_11_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 11. -/
def rs_R003_ueqv_R003NY_coefficient_11_0206 : Poly :=
[
  term ((-360 : Rat) / 299) [(2, 2), (14, 1), (16, 1)]
]

/-- Partial product 206 for generator 11. -/
def rs_R003_ueqv_R003NY_partial_11_0206 : Poly :=
[
  term ((720 : Rat) / 299) [(0, 1), (2, 3), (14, 1), (16, 1)],
  term ((-360 : Rat) / 299) [(0, 2), (2, 2), (14, 1), (16, 1)],
  term ((720 : Rat) / 299) [(1, 1), (2, 2), (3, 1), (14, 1), (16, 1)],
  term ((-360 : Rat) / 299) [(1, 2), (2, 2), (14, 1), (16, 1)],
  term ((-720 : Rat) / 299) [(2, 2), (3, 1), (5, 1), (14, 1), (16, 1)],
  term ((360 : Rat) / 299) [(2, 2), (4, 2), (14, 1), (16, 1)],
  term ((360 : Rat) / 299) [(2, 2), (5, 2), (14, 1), (16, 1)],
  term ((-720 : Rat) / 299) [(2, 3), (4, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 11. -/
theorem rs_R003_ueqv_R003NY_partial_11_0206_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_11_0206
        rs_R003_ueqv_R003NY_generator_11_0200_0241 =
      rs_R003_ueqv_R003NY_partial_11_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 11. -/
def rs_R003_ueqv_R003NY_coefficient_11_0207 : Poly :=
[
  term ((360 : Rat) / 299) [(2, 2), (16, 1)]
]

/-- Partial product 207 for generator 11. -/
def rs_R003_ueqv_R003NY_partial_11_0207 : Poly :=
[
  term ((-720 : Rat) / 299) [(0, 1), (2, 3), (16, 1)],
  term ((360 : Rat) / 299) [(0, 2), (2, 2), (16, 1)],
  term ((-720 : Rat) / 299) [(1, 1), (2, 2), (3, 1), (16, 1)],
  term ((360 : Rat) / 299) [(1, 2), (2, 2), (16, 1)],
  term ((720 : Rat) / 299) [(2, 2), (3, 1), (5, 1), (16, 1)],
  term ((-360 : Rat) / 299) [(2, 2), (4, 2), (16, 1)],
  term ((-360 : Rat) / 299) [(2, 2), (5, 2), (16, 1)],
  term ((720 : Rat) / 299) [(2, 3), (4, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 11. -/
theorem rs_R003_ueqv_R003NY_partial_11_0207_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_11_0207
        rs_R003_ueqv_R003NY_generator_11_0200_0241 =
      rs_R003_ueqv_R003NY_partial_11_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 11. -/
def rs_R003_ueqv_R003NY_coefficient_11_0208 : Poly :=
[
  term ((-5024 : Rat) / 299) [(3, 1), (4, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 208 for generator 11. -/
def rs_R003_ueqv_R003NY_partial_11_0208 : Poly :=
[
  term ((10048 : Rat) / 299) [(0, 1), (2, 1), (3, 1), (4, 1), (9, 1), (14, 1), (16, 1)],
  term ((-5024 : Rat) / 299) [(0, 2), (3, 1), (4, 1), (9, 1), (14, 1), (16, 1)],
  term ((10048 : Rat) / 299) [(1, 1), (3, 2), (4, 1), (9, 1), (14, 1), (16, 1)],
  term ((-5024 : Rat) / 299) [(1, 2), (3, 1), (4, 1), (9, 1), (14, 1), (16, 1)],
  term ((-10048 : Rat) / 299) [(2, 1), (3, 1), (4, 2), (9, 1), (14, 1), (16, 1)],
  term ((5024 : Rat) / 299) [(3, 1), (4, 1), (5, 2), (9, 1), (14, 1), (16, 1)],
  term ((5024 : Rat) / 299) [(3, 1), (4, 3), (9, 1), (14, 1), (16, 1)],
  term ((-10048 : Rat) / 299) [(3, 2), (4, 1), (5, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 11. -/
theorem rs_R003_ueqv_R003NY_partial_11_0208_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_11_0208
        rs_R003_ueqv_R003NY_generator_11_0200_0241 =
      rs_R003_ueqv_R003NY_partial_11_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 11. -/
def rs_R003_ueqv_R003NY_coefficient_11_0209 : Poly :=
[
  term ((5024 : Rat) / 299) [(3, 1), (4, 1), (9, 1), (16, 1)]
]

/-- Partial product 209 for generator 11. -/
def rs_R003_ueqv_R003NY_partial_11_0209 : Poly :=
[
  term ((-10048 : Rat) / 299) [(0, 1), (2, 1), (3, 1), (4, 1), (9, 1), (16, 1)],
  term ((5024 : Rat) / 299) [(0, 2), (3, 1), (4, 1), (9, 1), (16, 1)],
  term ((-10048 : Rat) / 299) [(1, 1), (3, 2), (4, 1), (9, 1), (16, 1)],
  term ((5024 : Rat) / 299) [(1, 2), (3, 1), (4, 1), (9, 1), (16, 1)],
  term ((10048 : Rat) / 299) [(2, 1), (3, 1), (4, 2), (9, 1), (16, 1)],
  term ((-5024 : Rat) / 299) [(3, 1), (4, 1), (5, 2), (9, 1), (16, 1)],
  term ((-5024 : Rat) / 299) [(3, 1), (4, 3), (9, 1), (16, 1)],
  term ((10048 : Rat) / 299) [(3, 2), (4, 1), (5, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 11. -/
theorem rs_R003_ueqv_R003NY_partial_11_0209_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_11_0209
        rs_R003_ueqv_R003NY_generator_11_0200_0241 =
      rs_R003_ueqv_R003NY_partial_11_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 11. -/
def rs_R003_ueqv_R003NY_coefficient_11_0210 : Poly :=
[
  term ((-48 : Rat) / 13) [(3, 1), (4, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 210 for generator 11. -/
def rs_R003_ueqv_R003NY_partial_11_0210 : Poly :=
[
  term ((96 : Rat) / 13) [(0, 1), (2, 1), (3, 1), (4, 1), (13, 1), (14, 1), (16, 1)],
  term ((-48 : Rat) / 13) [(0, 2), (3, 1), (4, 1), (13, 1), (14, 1), (16, 1)],
  term ((96 : Rat) / 13) [(1, 1), (3, 2), (4, 1), (13, 1), (14, 1), (16, 1)],
  term ((-48 : Rat) / 13) [(1, 2), (3, 1), (4, 1), (13, 1), (14, 1), (16, 1)],
  term ((-96 : Rat) / 13) [(2, 1), (3, 1), (4, 2), (13, 1), (14, 1), (16, 1)],
  term ((48 : Rat) / 13) [(3, 1), (4, 1), (5, 2), (13, 1), (14, 1), (16, 1)],
  term ((48 : Rat) / 13) [(3, 1), (4, 3), (13, 1), (14, 1), (16, 1)],
  term ((-96 : Rat) / 13) [(3, 2), (4, 1), (5, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 11. -/
theorem rs_R003_ueqv_R003NY_partial_11_0210_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_11_0210
        rs_R003_ueqv_R003NY_generator_11_0200_0241 =
      rs_R003_ueqv_R003NY_partial_11_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 11. -/
def rs_R003_ueqv_R003NY_coefficient_11_0211 : Poly :=
[
  term ((36 : Rat) / 13) [(3, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 211 for generator 11. -/
def rs_R003_ueqv_R003NY_partial_11_0211 : Poly :=
[
  term ((-72 : Rat) / 13) [(0, 1), (2, 1), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((36 : Rat) / 13) [(0, 2), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((-72 : Rat) / 13) [(1, 1), (3, 2), (4, 1), (15, 1), (16, 1)],
  term ((36 : Rat) / 13) [(1, 2), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((72 : Rat) / 13) [(2, 1), (3, 1), (4, 2), (15, 1), (16, 1)],
  term ((-36 : Rat) / 13) [(3, 1), (4, 1), (5, 2), (15, 1), (16, 1)],
  term ((-36 : Rat) / 13) [(3, 1), (4, 3), (15, 1), (16, 1)],
  term ((72 : Rat) / 13) [(3, 2), (4, 1), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 11. -/
theorem rs_R003_ueqv_R003NY_partial_11_0211_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_11_0211
        rs_R003_ueqv_R003NY_generator_11_0200_0241 =
      rs_R003_ueqv_R003NY_partial_11_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 11. -/
def rs_R003_ueqv_R003NY_coefficient_11_0212 : Poly :=
[
  term ((5024 : Rat) / 299) [(3, 1), (5, 1), (8, 1), (14, 1), (16, 1)]
]

/-- Partial product 212 for generator 11. -/
def rs_R003_ueqv_R003NY_partial_11_0212 : Poly :=
[
  term ((-10048 : Rat) / 299) [(0, 1), (2, 1), (3, 1), (5, 1), (8, 1), (14, 1), (16, 1)],
  term ((5024 : Rat) / 299) [(0, 2), (3, 1), (5, 1), (8, 1), (14, 1), (16, 1)],
  term ((-10048 : Rat) / 299) [(1, 1), (3, 2), (5, 1), (8, 1), (14, 1), (16, 1)],
  term ((5024 : Rat) / 299) [(1, 2), (3, 1), (5, 1), (8, 1), (14, 1), (16, 1)],
  term ((10048 : Rat) / 299) [(2, 1), (3, 1), (4, 1), (5, 1), (8, 1), (14, 1), (16, 1)],
  term ((-5024 : Rat) / 299) [(3, 1), (4, 2), (5, 1), (8, 1), (14, 1), (16, 1)],
  term ((-5024 : Rat) / 299) [(3, 1), (5, 3), (8, 1), (14, 1), (16, 1)],
  term ((10048 : Rat) / 299) [(3, 2), (5, 2), (8, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 11. -/
theorem rs_R003_ueqv_R003NY_partial_11_0212_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_11_0212
        rs_R003_ueqv_R003NY_generator_11_0200_0241 =
      rs_R003_ueqv_R003NY_partial_11_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 11. -/
def rs_R003_ueqv_R003NY_coefficient_11_0213 : Poly :=
[
  term ((-5024 : Rat) / 299) [(3, 1), (5, 1), (8, 1), (16, 1)]
]

/-- Partial product 213 for generator 11. -/
def rs_R003_ueqv_R003NY_partial_11_0213 : Poly :=
[
  term ((10048 : Rat) / 299) [(0, 1), (2, 1), (3, 1), (5, 1), (8, 1), (16, 1)],
  term ((-5024 : Rat) / 299) [(0, 2), (3, 1), (5, 1), (8, 1), (16, 1)],
  term ((10048 : Rat) / 299) [(1, 1), (3, 2), (5, 1), (8, 1), (16, 1)],
  term ((-5024 : Rat) / 299) [(1, 2), (3, 1), (5, 1), (8, 1), (16, 1)],
  term ((-10048 : Rat) / 299) [(2, 1), (3, 1), (4, 1), (5, 1), (8, 1), (16, 1)],
  term ((5024 : Rat) / 299) [(3, 1), (4, 2), (5, 1), (8, 1), (16, 1)],
  term ((5024 : Rat) / 299) [(3, 1), (5, 3), (8, 1), (16, 1)],
  term ((-10048 : Rat) / 299) [(3, 2), (5, 2), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 11. -/
theorem rs_R003_ueqv_R003NY_partial_11_0213_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_11_0213
        rs_R003_ueqv_R003NY_generator_11_0200_0241 =
      rs_R003_ueqv_R003NY_partial_11_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 11. -/
def rs_R003_ueqv_R003NY_coefficient_11_0214 : Poly :=
[
  term ((2512 : Rat) / 299) [(3, 1), (8, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 214 for generator 11. -/
def rs_R003_ueqv_R003NY_partial_11_0214 : Poly :=
[
  term ((-5024 : Rat) / 299) [(0, 1), (2, 1), (3, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((2512 : Rat) / 299) [(0, 2), (3, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((-5024 : Rat) / 299) [(1, 1), (3, 2), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((2512 : Rat) / 299) [(1, 2), (3, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((5024 : Rat) / 299) [(2, 1), (3, 1), (4, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((-2512 : Rat) / 299) [(3, 1), (4, 2), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((-2512 : Rat) / 299) [(3, 1), (5, 2), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((5024 : Rat) / 299) [(3, 2), (5, 1), (8, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 11. -/
theorem rs_R003_ueqv_R003NY_partial_11_0214_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_11_0214
        rs_R003_ueqv_R003NY_generator_11_0200_0241 =
      rs_R003_ueqv_R003NY_partial_11_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 11. -/
def rs_R003_ueqv_R003NY_coefficient_11_0215 : Poly :=
[
  term ((-2144 : Rat) / 299) [(3, 1), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 215 for generator 11. -/
def rs_R003_ueqv_R003NY_partial_11_0215 : Poly :=
[
  term ((4288 : Rat) / 299) [(0, 1), (2, 1), (3, 1), (8, 1), (9, 1), (16, 1)],
  term ((-2144 : Rat) / 299) [(0, 2), (3, 1), (8, 1), (9, 1), (16, 1)],
  term ((4288 : Rat) / 299) [(1, 1), (3, 2), (8, 1), (9, 1), (16, 1)],
  term ((-2144 : Rat) / 299) [(1, 2), (3, 1), (8, 1), (9, 1), (16, 1)],
  term ((-4288 : Rat) / 299) [(2, 1), (3, 1), (4, 1), (8, 1), (9, 1), (16, 1)],
  term ((2144 : Rat) / 299) [(3, 1), (4, 2), (8, 1), (9, 1), (16, 1)],
  term ((2144 : Rat) / 299) [(3, 1), (5, 2), (8, 1), (9, 1), (16, 1)],
  term ((-4288 : Rat) / 299) [(3, 2), (5, 1), (8, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 11. -/
theorem rs_R003_ueqv_R003NY_partial_11_0215_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_11_0215
        rs_R003_ueqv_R003NY_generator_11_0200_0241 =
      rs_R003_ueqv_R003NY_partial_11_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 11. -/
def rs_R003_ueqv_R003NY_coefficient_11_0216 : Poly :=
[
  term ((-1256 : Rat) / 299) [(3, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 216 for generator 11. -/
def rs_R003_ueqv_R003NY_partial_11_0216 : Poly :=
[
  term ((2512 : Rat) / 299) [(0, 1), (2, 1), (3, 1), (8, 1), (11, 1), (16, 1)],
  term ((-1256 : Rat) / 299) [(0, 2), (3, 1), (8, 1), (11, 1), (16, 1)],
  term ((2512 : Rat) / 299) [(1, 1), (3, 2), (8, 1), (11, 1), (16, 1)],
  term ((-1256 : Rat) / 299) [(1, 2), (3, 1), (8, 1), (11, 1), (16, 1)],
  term ((-2512 : Rat) / 299) [(2, 1), (3, 1), (4, 1), (8, 1), (11, 1), (16, 1)],
  term ((1256 : Rat) / 299) [(3, 1), (4, 2), (8, 1), (11, 1), (16, 1)],
  term ((1256 : Rat) / 299) [(3, 1), (5, 2), (8, 1), (11, 1), (16, 1)],
  term ((-2512 : Rat) / 299) [(3, 2), (5, 1), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 11. -/
theorem rs_R003_ueqv_R003NY_partial_11_0216_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_11_0216
        rs_R003_ueqv_R003NY_generator_11_0200_0241 =
      rs_R003_ueqv_R003NY_partial_11_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 11. -/
def rs_R003_ueqv_R003NY_coefficient_11_0217 : Poly :=
[
  term ((-96 : Rat) / 13) [(3, 1), (8, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 217 for generator 11. -/
def rs_R003_ueqv_R003NY_partial_11_0217 : Poly :=
[
  term ((192 : Rat) / 13) [(0, 1), (2, 1), (3, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-96 : Rat) / 13) [(0, 2), (3, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((192 : Rat) / 13) [(1, 1), (3, 2), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-96 : Rat) / 13) [(1, 2), (3, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-192 : Rat) / 13) [(2, 1), (3, 1), (4, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((96 : Rat) / 13) [(3, 1), (4, 2), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((96 : Rat) / 13) [(3, 1), (5, 2), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-192 : Rat) / 13) [(3, 2), (5, 1), (8, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 11. -/
theorem rs_R003_ueqv_R003NY_partial_11_0217_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_11_0217
        rs_R003_ueqv_R003NY_generator_11_0200_0241 =
      rs_R003_ueqv_R003NY_partial_11_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 11. -/
def rs_R003_ueqv_R003NY_coefficient_11_0218 : Poly :=
[
  term ((24 : Rat) / 13) [(3, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 218 for generator 11. -/
def rs_R003_ueqv_R003NY_partial_11_0218 : Poly :=
[
  term ((-48 : Rat) / 13) [(0, 1), (2, 1), (3, 1), (8, 1), (13, 1), (16, 1)],
  term ((24 : Rat) / 13) [(0, 2), (3, 1), (8, 1), (13, 1), (16, 1)],
  term ((-48 : Rat) / 13) [(1, 1), (3, 2), (8, 1), (13, 1), (16, 1)],
  term ((24 : Rat) / 13) [(1, 2), (3, 1), (8, 1), (13, 1), (16, 1)],
  term ((48 : Rat) / 13) [(2, 1), (3, 1), (4, 1), (8, 1), (13, 1), (16, 1)],
  term ((-24 : Rat) / 13) [(3, 1), (4, 2), (8, 1), (13, 1), (16, 1)],
  term ((-24 : Rat) / 13) [(3, 1), (5, 2), (8, 1), (13, 1), (16, 1)],
  term ((48 : Rat) / 13) [(3, 2), (5, 1), (8, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 11. -/
theorem rs_R003_ueqv_R003NY_partial_11_0218_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_11_0218
        rs_R003_ueqv_R003NY_generator_11_0200_0241 =
      rs_R003_ueqv_R003NY_partial_11_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 11. -/
def rs_R003_ueqv_R003NY_coefficient_11_0219 : Poly :=
[
  term ((76 : Rat) / 299) [(3, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 219 for generator 11. -/
def rs_R003_ueqv_R003NY_partial_11_0219 : Poly :=
[
  term ((-152 : Rat) / 299) [(0, 1), (2, 1), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((76 : Rat) / 299) [(0, 2), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((-152 : Rat) / 299) [(1, 1), (3, 2), (8, 1), (15, 1), (16, 1)],
  term ((76 : Rat) / 299) [(1, 2), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((152 : Rat) / 299) [(2, 1), (3, 1), (4, 1), (8, 1), (15, 1), (16, 1)],
  term ((-76 : Rat) / 299) [(3, 1), (4, 2), (8, 1), (15, 1), (16, 1)],
  term ((-76 : Rat) / 299) [(3, 1), (5, 2), (8, 1), (15, 1), (16, 1)],
  term ((152 : Rat) / 299) [(3, 2), (5, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 11. -/
theorem rs_R003_ueqv_R003NY_partial_11_0219_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_11_0219
        rs_R003_ueqv_R003NY_generator_11_0200_0241 =
      rs_R003_ueqv_R003NY_partial_11_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 11. -/
def rs_R003_ueqv_R003NY_coefficient_11_0220 : Poly :=
[
  term ((8180 : Rat) / 299) [(3, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 220 for generator 11. -/
def rs_R003_ueqv_R003NY_partial_11_0220 : Poly :=
[
  term ((-16360 : Rat) / 299) [(0, 1), (2, 1), (3, 1), (9, 1), (14, 1), (16, 1)],
  term ((8180 : Rat) / 299) [(0, 2), (3, 1), (9, 1), (14, 1), (16, 1)],
  term ((-16360 : Rat) / 299) [(1, 1), (3, 2), (9, 1), (14, 1), (16, 1)],
  term ((8180 : Rat) / 299) [(1, 2), (3, 1), (9, 1), (14, 1), (16, 1)],
  term ((16360 : Rat) / 299) [(2, 1), (3, 1), (4, 1), (9, 1), (14, 1), (16, 1)],
  term ((-8180 : Rat) / 299) [(3, 1), (4, 2), (9, 1), (14, 1), (16, 1)],
  term ((-8180 : Rat) / 299) [(3, 1), (5, 2), (9, 1), (14, 1), (16, 1)],
  term ((16360 : Rat) / 299) [(3, 2), (5, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 11. -/
theorem rs_R003_ueqv_R003NY_partial_11_0220_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_11_0220
        rs_R003_ueqv_R003NY_generator_11_0200_0241 =
      rs_R003_ueqv_R003NY_partial_11_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 11. -/
def rs_R003_ueqv_R003NY_coefficient_11_0221 : Poly :=
[
  term ((-8180 : Rat) / 299) [(3, 1), (9, 1), (16, 1)]
]

/-- Partial product 221 for generator 11. -/
def rs_R003_ueqv_R003NY_partial_11_0221 : Poly :=
[
  term ((16360 : Rat) / 299) [(0, 1), (2, 1), (3, 1), (9, 1), (16, 1)],
  term ((-8180 : Rat) / 299) [(0, 2), (3, 1), (9, 1), (16, 1)],
  term ((16360 : Rat) / 299) [(1, 1), (3, 2), (9, 1), (16, 1)],
  term ((-8180 : Rat) / 299) [(1, 2), (3, 1), (9, 1), (16, 1)],
  term ((-16360 : Rat) / 299) [(2, 1), (3, 1), (4, 1), (9, 1), (16, 1)],
  term ((8180 : Rat) / 299) [(3, 1), (4, 2), (9, 1), (16, 1)],
  term ((8180 : Rat) / 299) [(3, 1), (5, 2), (9, 1), (16, 1)],
  term ((-16360 : Rat) / 299) [(3, 2), (5, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 11. -/
theorem rs_R003_ueqv_R003NY_partial_11_0221_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_11_0221
        rs_R003_ueqv_R003NY_generator_11_0200_0241 =
      rs_R003_ueqv_R003NY_partial_11_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 11. -/
def rs_R003_ueqv_R003NY_coefficient_11_0222 : Poly :=
[
  term ((-1256 : Rat) / 299) [(3, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 222 for generator 11. -/
def rs_R003_ueqv_R003NY_partial_11_0222 : Poly :=
[
  term ((2512 : Rat) / 299) [(0, 1), (2, 1), (3, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1256 : Rat) / 299) [(0, 2), (3, 1), (11, 1), (14, 1), (16, 1)],
  term ((2512 : Rat) / 299) [(1, 1), (3, 2), (11, 1), (14, 1), (16, 1)],
  term ((-1256 : Rat) / 299) [(1, 2), (3, 1), (11, 1), (14, 1), (16, 1)],
  term ((-2512 : Rat) / 299) [(2, 1), (3, 1), (4, 1), (11, 1), (14, 1), (16, 1)],
  term ((1256 : Rat) / 299) [(3, 1), (4, 2), (11, 1), (14, 1), (16, 1)],
  term ((1256 : Rat) / 299) [(3, 1), (5, 2), (11, 1), (14, 1), (16, 1)],
  term ((-2512 : Rat) / 299) [(3, 2), (5, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 11. -/
theorem rs_R003_ueqv_R003NY_partial_11_0222_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_11_0222
        rs_R003_ueqv_R003NY_generator_11_0200_0241 =
      rs_R003_ueqv_R003NY_partial_11_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 11. -/
def rs_R003_ueqv_R003NY_coefficient_11_0223 : Poly :=
[
  term ((1256 : Rat) / 299) [(3, 1), (11, 1), (16, 1)]
]

/-- Partial product 223 for generator 11. -/
def rs_R003_ueqv_R003NY_partial_11_0223 : Poly :=
[
  term ((-2512 : Rat) / 299) [(0, 1), (2, 1), (3, 1), (11, 1), (16, 1)],
  term ((1256 : Rat) / 299) [(0, 2), (3, 1), (11, 1), (16, 1)],
  term ((-2512 : Rat) / 299) [(1, 1), (3, 2), (11, 1), (16, 1)],
  term ((1256 : Rat) / 299) [(1, 2), (3, 1), (11, 1), (16, 1)],
  term ((2512 : Rat) / 299) [(2, 1), (3, 1), (4, 1), (11, 1), (16, 1)],
  term ((-1256 : Rat) / 299) [(3, 1), (4, 2), (11, 1), (16, 1)],
  term ((-1256 : Rat) / 299) [(3, 1), (5, 2), (11, 1), (16, 1)],
  term ((2512 : Rat) / 299) [(3, 2), (5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 11. -/
theorem rs_R003_ueqv_R003NY_partial_11_0223_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_11_0223
        rs_R003_ueqv_R003NY_generator_11_0200_0241 =
      rs_R003_ueqv_R003NY_partial_11_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 11. -/
def rs_R003_ueqv_R003NY_coefficient_11_0224 : Poly :=
[
  term ((48 : Rat) / 13) [(3, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 224 for generator 11. -/
def rs_R003_ueqv_R003NY_partial_11_0224 : Poly :=
[
  term ((-96 : Rat) / 13) [(0, 1), (2, 1), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((48 : Rat) / 13) [(0, 2), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((-96 : Rat) / 13) [(1, 1), (3, 2), (13, 1), (14, 1), (16, 1)],
  term ((48 : Rat) / 13) [(1, 2), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((96 : Rat) / 13) [(2, 1), (3, 1), (4, 1), (13, 1), (14, 1), (16, 1)],
  term ((-48 : Rat) / 13) [(3, 1), (4, 2), (13, 1), (14, 1), (16, 1)],
  term ((-48 : Rat) / 13) [(3, 1), (5, 2), (13, 1), (14, 1), (16, 1)],
  term ((96 : Rat) / 13) [(3, 2), (5, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 11. -/
theorem rs_R003_ueqv_R003NY_partial_11_0224_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_11_0224
        rs_R003_ueqv_R003NY_generator_11_0200_0241 =
      rs_R003_ueqv_R003NY_partial_11_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 11. -/
def rs_R003_ueqv_R003NY_coefficient_11_0225 : Poly :=
[
  term ((24 : Rat) / 13) [(3, 1), (13, 1), (16, 1)]
]

/-- Partial product 225 for generator 11. -/
def rs_R003_ueqv_R003NY_partial_11_0225 : Poly :=
[
  term ((-48 : Rat) / 13) [(0, 1), (2, 1), (3, 1), (13, 1), (16, 1)],
  term ((24 : Rat) / 13) [(0, 2), (3, 1), (13, 1), (16, 1)],
  term ((-48 : Rat) / 13) [(1, 1), (3, 2), (13, 1), (16, 1)],
  term ((24 : Rat) / 13) [(1, 2), (3, 1), (13, 1), (16, 1)],
  term ((48 : Rat) / 13) [(2, 1), (3, 1), (4, 1), (13, 1), (16, 1)],
  term ((-24 : Rat) / 13) [(3, 1), (4, 2), (13, 1), (16, 1)],
  term ((-24 : Rat) / 13) [(3, 1), (5, 2), (13, 1), (16, 1)],
  term ((48 : Rat) / 13) [(3, 2), (5, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 11. -/
theorem rs_R003_ueqv_R003NY_partial_11_0225_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_11_0225
        rs_R003_ueqv_R003NY_generator_11_0200_0241 =
      rs_R003_ueqv_R003NY_partial_11_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 11. -/
def rs_R003_ueqv_R003NY_coefficient_11_0226 : Poly :=
[
  term ((-138 : Rat) / 13) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 226 for generator 11. -/
def rs_R003_ueqv_R003NY_partial_11_0226 : Poly :=
[
  term ((276 : Rat) / 13) [(0, 1), (2, 1), (3, 1), (15, 1), (16, 1)],
  term ((-138 : Rat) / 13) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((276 : Rat) / 13) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((-138 : Rat) / 13) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((-276 : Rat) / 13) [(2, 1), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((138 : Rat) / 13) [(3, 1), (4, 2), (15, 1), (16, 1)],
  term ((138 : Rat) / 13) [(3, 1), (5, 2), (15, 1), (16, 1)],
  term ((-276 : Rat) / 13) [(3, 2), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 11. -/
theorem rs_R003_ueqv_R003NY_partial_11_0226_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_11_0226
        rs_R003_ueqv_R003NY_generator_11_0200_0241 =
      rs_R003_ueqv_R003NY_partial_11_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 11. -/
def rs_R003_ueqv_R003NY_coefficient_11_0227 : Poly :=
[
  term ((72 : Rat) / 13) [(3, 2), (8, 1), (16, 1)]
]

/-- Partial product 227 for generator 11. -/
def rs_R003_ueqv_R003NY_partial_11_0227 : Poly :=
[
  term ((-144 : Rat) / 13) [(0, 1), (2, 1), (3, 2), (8, 1), (16, 1)],
  term ((72 : Rat) / 13) [(0, 2), (3, 2), (8, 1), (16, 1)],
  term ((-144 : Rat) / 13) [(1, 1), (3, 3), (8, 1), (16, 1)],
  term ((72 : Rat) / 13) [(1, 2), (3, 2), (8, 1), (16, 1)],
  term ((144 : Rat) / 13) [(2, 1), (3, 2), (4, 1), (8, 1), (16, 1)],
  term ((-72 : Rat) / 13) [(3, 2), (4, 2), (8, 1), (16, 1)],
  term ((-72 : Rat) / 13) [(3, 2), (5, 2), (8, 1), (16, 1)],
  term ((144 : Rat) / 13) [(3, 3), (5, 1), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 11. -/
theorem rs_R003_ueqv_R003NY_partial_11_0227_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_11_0227
        rs_R003_ueqv_R003NY_generator_11_0200_0241 =
      rs_R003_ueqv_R003NY_partial_11_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 11. -/
def rs_R003_ueqv_R003NY_coefficient_11_0228 : Poly :=
[
  term ((60 : Rat) / 13) [(3, 2), (14, 1), (16, 1)]
]

/-- Partial product 228 for generator 11. -/
def rs_R003_ueqv_R003NY_partial_11_0228 : Poly :=
[
  term ((-120 : Rat) / 13) [(0, 1), (2, 1), (3, 2), (14, 1), (16, 1)],
  term ((60 : Rat) / 13) [(0, 2), (3, 2), (14, 1), (16, 1)],
  term ((-120 : Rat) / 13) [(1, 1), (3, 3), (14, 1), (16, 1)],
  term ((60 : Rat) / 13) [(1, 2), (3, 2), (14, 1), (16, 1)],
  term ((120 : Rat) / 13) [(2, 1), (3, 2), (4, 1), (14, 1), (16, 1)],
  term ((-60 : Rat) / 13) [(3, 2), (4, 2), (14, 1), (16, 1)],
  term ((-60 : Rat) / 13) [(3, 2), (5, 2), (14, 1), (16, 1)],
  term ((120 : Rat) / 13) [(3, 3), (5, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 11. -/
theorem rs_R003_ueqv_R003NY_partial_11_0228_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_11_0228
        rs_R003_ueqv_R003NY_generator_11_0200_0241 =
      rs_R003_ueqv_R003NY_partial_11_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 11. -/
def rs_R003_ueqv_R003NY_coefficient_11_0229 : Poly :=
[
  term ((-72 : Rat) / 13) [(3, 2), (16, 1)]
]

/-- Partial product 229 for generator 11. -/
def rs_R003_ueqv_R003NY_partial_11_0229 : Poly :=
[
  term ((144 : Rat) / 13) [(0, 1), (2, 1), (3, 2), (16, 1)],
  term ((-72 : Rat) / 13) [(0, 2), (3, 2), (16, 1)],
  term ((144 : Rat) / 13) [(1, 1), (3, 3), (16, 1)],
  term ((-72 : Rat) / 13) [(1, 2), (3, 2), (16, 1)],
  term ((-144 : Rat) / 13) [(2, 1), (3, 2), (4, 1), (16, 1)],
  term ((72 : Rat) / 13) [(3, 2), (4, 2), (16, 1)],
  term ((72 : Rat) / 13) [(3, 2), (5, 2), (16, 1)],
  term ((-144 : Rat) / 13) [(3, 3), (5, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 11. -/
theorem rs_R003_ueqv_R003NY_partial_11_0229_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_11_0229
        rs_R003_ueqv_R003NY_generator_11_0200_0241 =
      rs_R003_ueqv_R003NY_partial_11_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 11. -/
def rs_R003_ueqv_R003NY_coefficient_11_0230 : Poly :=
[
  term ((36 : Rat) / 13) [(4, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 230 for generator 11. -/
def rs_R003_ueqv_R003NY_partial_11_0230 : Poly :=
[
  term ((-72 : Rat) / 13) [(0, 1), (2, 1), (4, 1), (9, 1), (13, 1), (16, 1)],
  term ((36 : Rat) / 13) [(0, 2), (4, 1), (9, 1), (13, 1), (16, 1)],
  term ((-72 : Rat) / 13) [(1, 1), (3, 1), (4, 1), (9, 1), (13, 1), (16, 1)],
  term ((36 : Rat) / 13) [(1, 2), (4, 1), (9, 1), (13, 1), (16, 1)],
  term ((72 : Rat) / 13) [(2, 1), (4, 2), (9, 1), (13, 1), (16, 1)],
  term ((72 : Rat) / 13) [(3, 1), (4, 1), (5, 1), (9, 1), (13, 1), (16, 1)],
  term ((-36 : Rat) / 13) [(4, 1), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((-36 : Rat) / 13) [(4, 3), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 11. -/
theorem rs_R003_ueqv_R003NY_partial_11_0230_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_11_0230
        rs_R003_ueqv_R003NY_generator_11_0200_0241 =
      rs_R003_ueqv_R003NY_partial_11_0230 := by
  native_decide

/-- Coefficient term 231 from coefficient polynomial 11. -/
def rs_R003_ueqv_R003NY_coefficient_11_0231 : Poly :=
[
  term ((-36 : Rat) / 13) [(4, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 231 for generator 11. -/
def rs_R003_ueqv_R003NY_partial_11_0231 : Poly :=
[
  term ((72 : Rat) / 13) [(0, 1), (2, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-36 : Rat) / 13) [(0, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((72 : Rat) / 13) [(1, 1), (3, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-36 : Rat) / 13) [(1, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-72 : Rat) / 13) [(2, 1), (4, 2), (13, 1), (15, 1), (16, 1)],
  term ((-72 : Rat) / 13) [(3, 1), (4, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((36 : Rat) / 13) [(4, 1), (5, 2), (13, 1), (15, 1), (16, 1)],
  term ((36 : Rat) / 13) [(4, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 231 for generator 11. -/
theorem rs_R003_ueqv_R003NY_partial_11_0231_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_11_0231
        rs_R003_ueqv_R003NY_generator_11_0200_0241 =
      rs_R003_ueqv_R003NY_partial_11_0231 := by
  native_decide

/-- Coefficient term 232 from coefficient polynomial 11. -/
def rs_R003_ueqv_R003NY_coefficient_11_0232 : Poly :=
[
  term ((-36 : Rat) / 13) [(5, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 232 for generator 11. -/
def rs_R003_ueqv_R003NY_partial_11_0232 : Poly :=
[
  term ((72 : Rat) / 13) [(0, 1), (2, 1), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((-36 : Rat) / 13) [(0, 2), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((72 : Rat) / 13) [(1, 1), (3, 1), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((-36 : Rat) / 13) [(1, 2), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((-72 : Rat) / 13) [(2, 1), (4, 1), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((-72 : Rat) / 13) [(3, 1), (5, 2), (8, 1), (13, 1), (16, 1)],
  term ((36 : Rat) / 13) [(4, 2), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((36 : Rat) / 13) [(5, 3), (8, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 232 for generator 11. -/
theorem rs_R003_ueqv_R003NY_partial_11_0232_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_11_0232
        rs_R003_ueqv_R003NY_generator_11_0200_0241 =
      rs_R003_ueqv_R003NY_partial_11_0232 := by
  native_decide

/-- Coefficient term 233 from coefficient polynomial 11. -/
def rs_R003_ueqv_R003NY_coefficient_11_0233 : Poly :=
[
  term ((36 : Rat) / 13) [(5, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 233 for generator 11. -/
def rs_R003_ueqv_R003NY_partial_11_0233 : Poly :=
[
  term ((-72 : Rat) / 13) [(0, 1), (2, 1), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((36 : Rat) / 13) [(0, 2), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((-72 : Rat) / 13) [(1, 1), (3, 1), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((36 : Rat) / 13) [(1, 2), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((72 : Rat) / 13) [(2, 1), (4, 1), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((72 : Rat) / 13) [(3, 1), (5, 2), (13, 1), (14, 1), (16, 1)],
  term ((-36 : Rat) / 13) [(4, 2), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((-36 : Rat) / 13) [(5, 3), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 233 for generator 11. -/
theorem rs_R003_ueqv_R003NY_partial_11_0233_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_11_0233
        rs_R003_ueqv_R003NY_generator_11_0200_0241 =
      rs_R003_ueqv_R003NY_partial_11_0233 := by
  native_decide

/-- Coefficient term 234 from coefficient polynomial 11. -/
def rs_R003_ueqv_R003NY_coefficient_11_0234 : Poly :=
[
  term ((-36 : Rat) / 13) [(5, 1), (13, 1), (16, 1)]
]

/-- Partial product 234 for generator 11. -/
def rs_R003_ueqv_R003NY_partial_11_0234 : Poly :=
[
  term ((72 : Rat) / 13) [(0, 1), (2, 1), (5, 1), (13, 1), (16, 1)],
  term ((-36 : Rat) / 13) [(0, 2), (5, 1), (13, 1), (16, 1)],
  term ((72 : Rat) / 13) [(1, 1), (3, 1), (5, 1), (13, 1), (16, 1)],
  term ((-36 : Rat) / 13) [(1, 2), (5, 1), (13, 1), (16, 1)],
  term ((-72 : Rat) / 13) [(2, 1), (4, 1), (5, 1), (13, 1), (16, 1)],
  term ((-72 : Rat) / 13) [(3, 1), (5, 2), (13, 1), (16, 1)],
  term ((36 : Rat) / 13) [(4, 2), (5, 1), (13, 1), (16, 1)],
  term ((36 : Rat) / 13) [(5, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 234 for generator 11. -/
theorem rs_R003_ueqv_R003NY_partial_11_0234_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_11_0234
        rs_R003_ueqv_R003NY_generator_11_0200_0241 =
      rs_R003_ueqv_R003NY_partial_11_0234 := by
  native_decide

/-- Coefficient term 235 from coefficient polynomial 11. -/
def rs_R003_ueqv_R003NY_coefficient_11_0235 : Poly :=
[
  term ((-36 : Rat) / 13) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 235 for generator 11. -/
def rs_R003_ueqv_R003NY_partial_11_0235 : Poly :=
[
  term ((72 : Rat) / 13) [(0, 1), (2, 1), (5, 1), (15, 1), (16, 1)],
  term ((-36 : Rat) / 13) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((72 : Rat) / 13) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((-36 : Rat) / 13) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((-72 : Rat) / 13) [(2, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-72 : Rat) / 13) [(3, 1), (5, 2), (15, 1), (16, 1)],
  term ((36 : Rat) / 13) [(4, 2), (5, 1), (15, 1), (16, 1)],
  term ((36 : Rat) / 13) [(5, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 235 for generator 11. -/
theorem rs_R003_ueqv_R003NY_partial_11_0235_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_11_0235
        rs_R003_ueqv_R003NY_generator_11_0200_0241 =
      rs_R003_ueqv_R003NY_partial_11_0235 := by
  native_decide

/-- Coefficient term 236 from coefficient polynomial 11. -/
def rs_R003_ueqv_R003NY_coefficient_11_0236 : Poly :=
[
  term ((24 : Rat) / 13) [(8, 1), (9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 236 for generator 11. -/
def rs_R003_ueqv_R003NY_partial_11_0236 : Poly :=
[
  term ((-48 : Rat) / 13) [(0, 1), (2, 1), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((24 : Rat) / 13) [(0, 2), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-48 : Rat) / 13) [(1, 1), (3, 1), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((24 : Rat) / 13) [(1, 2), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((48 : Rat) / 13) [(2, 1), (4, 1), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((48 : Rat) / 13) [(3, 1), (5, 1), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-24 : Rat) / 13) [(4, 2), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-24 : Rat) / 13) [(5, 2), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 236 for generator 11. -/
theorem rs_R003_ueqv_R003NY_partial_11_0236_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_11_0236
        rs_R003_ueqv_R003NY_generator_11_0200_0241 =
      rs_R003_ueqv_R003NY_partial_11_0236 := by
  native_decide

/-- Coefficient term 237 from coefficient polynomial 11. -/
def rs_R003_ueqv_R003NY_coefficient_11_0237 : Poly :=
[
  term ((-12 : Rat) / 13) [(8, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 237 for generator 11. -/
def rs_R003_ueqv_R003NY_partial_11_0237 : Poly :=
[
  term ((24 : Rat) / 13) [(0, 1), (2, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-12 : Rat) / 13) [(0, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((24 : Rat) / 13) [(1, 1), (3, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-12 : Rat) / 13) [(1, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-24 : Rat) / 13) [(2, 1), (4, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-24 : Rat) / 13) [(3, 1), (5, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((12 : Rat) / 13) [(4, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((12 : Rat) / 13) [(5, 2), (8, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 237 for generator 11. -/
theorem rs_R003_ueqv_R003NY_partial_11_0237_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_11_0237
        rs_R003_ueqv_R003NY_generator_11_0200_0241 =
      rs_R003_ueqv_R003NY_partial_11_0237 := by
  native_decide

/-- Coefficient term 238 from coefficient polynomial 11. -/
def rs_R003_ueqv_R003NY_coefficient_11_0238 : Poly :=
[
  term ((-54 : Rat) / 13) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 238 for generator 11. -/
def rs_R003_ueqv_R003NY_partial_11_0238 : Poly :=
[
  term ((108 : Rat) / 13) [(0, 1), (2, 1), (9, 1), (13, 1), (16, 1)],
  term ((-54 : Rat) / 13) [(0, 2), (9, 1), (13, 1), (16, 1)],
  term ((108 : Rat) / 13) [(1, 1), (3, 1), (9, 1), (13, 1), (16, 1)],
  term ((-54 : Rat) / 13) [(1, 2), (9, 1), (13, 1), (16, 1)],
  term ((-108 : Rat) / 13) [(2, 1), (4, 1), (9, 1), (13, 1), (16, 1)],
  term ((-108 : Rat) / 13) [(3, 1), (5, 1), (9, 1), (13, 1), (16, 1)],
  term ((54 : Rat) / 13) [(4, 2), (9, 1), (13, 1), (16, 1)],
  term ((54 : Rat) / 13) [(5, 2), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 238 for generator 11. -/
theorem rs_R003_ueqv_R003NY_partial_11_0238_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_11_0238
        rs_R003_ueqv_R003NY_generator_11_0200_0241 =
      rs_R003_ueqv_R003NY_partial_11_0238 := by
  native_decide

/-- Coefficient term 239 from coefficient polynomial 11. -/
def rs_R003_ueqv_R003NY_coefficient_11_0239 : Poly :=
[
  term ((-28 : Rat) / 13) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 239 for generator 11. -/
def rs_R003_ueqv_R003NY_partial_11_0239 : Poly :=
[
  term ((56 : Rat) / 13) [(0, 1), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((-28 : Rat) / 13) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((56 : Rat) / 13) [(1, 1), (3, 1), (9, 1), (15, 1), (16, 1)],
  term ((-28 : Rat) / 13) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((-56 : Rat) / 13) [(2, 1), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-56 : Rat) / 13) [(3, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((28 : Rat) / 13) [(4, 2), (9, 1), (15, 1), (16, 1)],
  term ((28 : Rat) / 13) [(5, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 239 for generator 11. -/
theorem rs_R003_ueqv_R003NY_partial_11_0239_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_11_0239
        rs_R003_ueqv_R003NY_generator_11_0200_0241 =
      rs_R003_ueqv_R003NY_partial_11_0239 := by
  native_decide

/-- Coefficient term 240 from coefficient polynomial 11. -/
def rs_R003_ueqv_R003NY_coefficient_11_0240 : Poly :=
[
  term ((1256 : Rat) / 299) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 240 for generator 11. -/
def rs_R003_ueqv_R003NY_partial_11_0240 : Poly :=
[
  term ((-2512 : Rat) / 299) [(0, 1), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((1256 : Rat) / 299) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((-2512 : Rat) / 299) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((1256 : Rat) / 299) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((2512 : Rat) / 299) [(2, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((2512 : Rat) / 299) [(3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1256 : Rat) / 299) [(4, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1256 : Rat) / 299) [(5, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 240 for generator 11. -/
theorem rs_R003_ueqv_R003NY_partial_11_0240_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_11_0240
        rs_R003_ueqv_R003NY_generator_11_0200_0241 =
      rs_R003_ueqv_R003NY_partial_11_0240 := by
  native_decide

/-- Coefficient term 241 from coefficient polynomial 11. -/
def rs_R003_ueqv_R003NY_coefficient_11_0241 : Poly :=
[
  term ((54 : Rat) / 13) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 241 for generator 11. -/
def rs_R003_ueqv_R003NY_partial_11_0241 : Poly :=
[
  term ((-108 : Rat) / 13) [(0, 1), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((54 : Rat) / 13) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-108 : Rat) / 13) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((54 : Rat) / 13) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((108 : Rat) / 13) [(2, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((108 : Rat) / 13) [(3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-54 : Rat) / 13) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term ((-54 : Rat) / 13) [(5, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 241 for generator 11. -/
theorem rs_R003_ueqv_R003NY_partial_11_0241_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_11_0241
        rs_R003_ueqv_R003NY_generator_11_0200_0241 =
      rs_R003_ueqv_R003NY_partial_11_0241 := by
  native_decide

/-- Partial products in this block. -/
def rs_R003_ueqv_R003NY_partials_11_0200_0241 : List Poly :=
[
  rs_R003_ueqv_R003NY_partial_11_0200,
  rs_R003_ueqv_R003NY_partial_11_0201,
  rs_R003_ueqv_R003NY_partial_11_0202,
  rs_R003_ueqv_R003NY_partial_11_0203,
  rs_R003_ueqv_R003NY_partial_11_0204,
  rs_R003_ueqv_R003NY_partial_11_0205,
  rs_R003_ueqv_R003NY_partial_11_0206,
  rs_R003_ueqv_R003NY_partial_11_0207,
  rs_R003_ueqv_R003NY_partial_11_0208,
  rs_R003_ueqv_R003NY_partial_11_0209,
  rs_R003_ueqv_R003NY_partial_11_0210,
  rs_R003_ueqv_R003NY_partial_11_0211,
  rs_R003_ueqv_R003NY_partial_11_0212,
  rs_R003_ueqv_R003NY_partial_11_0213,
  rs_R003_ueqv_R003NY_partial_11_0214,
  rs_R003_ueqv_R003NY_partial_11_0215,
  rs_R003_ueqv_R003NY_partial_11_0216,
  rs_R003_ueqv_R003NY_partial_11_0217,
  rs_R003_ueqv_R003NY_partial_11_0218,
  rs_R003_ueqv_R003NY_partial_11_0219,
  rs_R003_ueqv_R003NY_partial_11_0220,
  rs_R003_ueqv_R003NY_partial_11_0221,
  rs_R003_ueqv_R003NY_partial_11_0222,
  rs_R003_ueqv_R003NY_partial_11_0223,
  rs_R003_ueqv_R003NY_partial_11_0224,
  rs_R003_ueqv_R003NY_partial_11_0225,
  rs_R003_ueqv_R003NY_partial_11_0226,
  rs_R003_ueqv_R003NY_partial_11_0227,
  rs_R003_ueqv_R003NY_partial_11_0228,
  rs_R003_ueqv_R003NY_partial_11_0229,
  rs_R003_ueqv_R003NY_partial_11_0230,
  rs_R003_ueqv_R003NY_partial_11_0231,
  rs_R003_ueqv_R003NY_partial_11_0232,
  rs_R003_ueqv_R003NY_partial_11_0233,
  rs_R003_ueqv_R003NY_partial_11_0234,
  rs_R003_ueqv_R003NY_partial_11_0235,
  rs_R003_ueqv_R003NY_partial_11_0236,
  rs_R003_ueqv_R003NY_partial_11_0237,
  rs_R003_ueqv_R003NY_partial_11_0238,
  rs_R003_ueqv_R003NY_partial_11_0239,
  rs_R003_ueqv_R003NY_partial_11_0240,
  rs_R003_ueqv_R003NY_partial_11_0241
]

/-- Sum of partial products in this block. -/
def rs_R003_ueqv_R003NY_block_11_0200_0241 : Poly :=
[
  term ((10048 : Rat) / 299) [(0, 1), (2, 1), (3, 1), (4, 1), (9, 1), (14, 1), (16, 1)],
  term ((-10048 : Rat) / 299) [(0, 1), (2, 1), (3, 1), (4, 1), (9, 1), (16, 1)],
  term ((96 : Rat) / 13) [(0, 1), (2, 1), (3, 1), (4, 1), (13, 1), (14, 1), (16, 1)],
  term ((-72 : Rat) / 13) [(0, 1), (2, 1), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((-10048 : Rat) / 299) [(0, 1), (2, 1), (3, 1), (5, 1), (8, 1), (14, 1), (16, 1)],
  term ((10048 : Rat) / 299) [(0, 1), (2, 1), (3, 1), (5, 1), (8, 1), (16, 1)],
  term ((-5024 : Rat) / 299) [(0, 1), (2, 1), (3, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((4288 : Rat) / 299) [(0, 1), (2, 1), (3, 1), (8, 1), (9, 1), (16, 1)],
  term ((2512 : Rat) / 299) [(0, 1), (2, 1), (3, 1), (8, 1), (11, 1), (16, 1)],
  term ((192 : Rat) / 13) [(0, 1), (2, 1), (3, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-48 : Rat) / 13) [(0, 1), (2, 1), (3, 1), (8, 1), (13, 1), (16, 1)],
  term ((-152 : Rat) / 299) [(0, 1), (2, 1), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((-16360 : Rat) / 299) [(0, 1), (2, 1), (3, 1), (9, 1), (14, 1), (16, 1)],
  term ((16360 : Rat) / 299) [(0, 1), (2, 1), (3, 1), (9, 1), (16, 1)],
  term ((2512 : Rat) / 299) [(0, 1), (2, 1), (3, 1), (11, 1), (14, 1), (16, 1)],
  term ((-2512 : Rat) / 299) [(0, 1), (2, 1), (3, 1), (11, 1), (16, 1)],
  term ((-96 : Rat) / 13) [(0, 1), (2, 1), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((-48 : Rat) / 13) [(0, 1), (2, 1), (3, 1), (13, 1), (16, 1)],
  term ((276 : Rat) / 13) [(0, 1), (2, 1), (3, 1), (15, 1), (16, 1)],
  term ((-144 : Rat) / 13) [(0, 1), (2, 1), (3, 2), (8, 1), (16, 1)],
  term ((-120 : Rat) / 13) [(0, 1), (2, 1), (3, 2), (14, 1), (16, 1)],
  term ((144 : Rat) / 13) [(0, 1), (2, 1), (3, 2), (16, 1)],
  term ((-72 : Rat) / 13) [(0, 1), (2, 1), (4, 1), (9, 1), (13, 1), (16, 1)],
  term ((72 : Rat) / 13) [(0, 1), (2, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((72 : Rat) / 13) [(0, 1), (2, 1), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((-72 : Rat) / 13) [(0, 1), (2, 1), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((72 : Rat) / 13) [(0, 1), (2, 1), (5, 1), (13, 1), (16, 1)],
  term ((72 : Rat) / 13) [(0, 1), (2, 1), (5, 1), (15, 1), (16, 1)],
  term ((-48 : Rat) / 13) [(0, 1), (2, 1), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((24 : Rat) / 13) [(0, 1), (2, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((108 : Rat) / 13) [(0, 1), (2, 1), (9, 1), (13, 1), (16, 1)],
  term ((56 : Rat) / 13) [(0, 1), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((-2512 : Rat) / 299) [(0, 1), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((-108 : Rat) / 13) [(0, 1), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3600 : Rat) / 299) [(0, 1), (2, 3), (9, 1), (13, 1), (16, 1)],
  term ((17280 : Rat) / 299) [(0, 1), (2, 3), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8640 : Rat) / 299) [(0, 1), (2, 3), (9, 1), (15, 1), (16, 1)],
  term ((-2400 : Rat) / 299) [(0, 1), (2, 3), (9, 2), (16, 1)],
  term ((480 : Rat) / 299) [(0, 1), (2, 3), (11, 1), (15, 1), (16, 1)],
  term ((7200 : Rat) / 299) [(0, 1), (2, 3), (13, 1), (15, 1), (16, 1)],
  term ((720 : Rat) / 299) [(0, 1), (2, 3), (14, 1), (16, 1)],
  term ((-720 : Rat) / 299) [(0, 1), (2, 3), (16, 1)],
  term ((1800 : Rat) / 299) [(0, 2), (2, 2), (9, 1), (13, 1), (16, 1)],
  term ((-8640 : Rat) / 299) [(0, 2), (2, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(0, 2), (2, 2), (9, 1), (15, 1), (16, 1)],
  term ((1200 : Rat) / 299) [(0, 2), (2, 2), (9, 2), (16, 1)],
  term ((-240 : Rat) / 299) [(0, 2), (2, 2), (11, 1), (15, 1), (16, 1)],
  term ((-3600 : Rat) / 299) [(0, 2), (2, 2), (13, 1), (15, 1), (16, 1)],
  term ((-360 : Rat) / 299) [(0, 2), (2, 2), (14, 1), (16, 1)],
  term ((360 : Rat) / 299) [(0, 2), (2, 2), (16, 1)],
  term ((-5024 : Rat) / 299) [(0, 2), (3, 1), (4, 1), (9, 1), (14, 1), (16, 1)],
  term ((5024 : Rat) / 299) [(0, 2), (3, 1), (4, 1), (9, 1), (16, 1)],
  term ((-48 : Rat) / 13) [(0, 2), (3, 1), (4, 1), (13, 1), (14, 1), (16, 1)],
  term ((36 : Rat) / 13) [(0, 2), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((5024 : Rat) / 299) [(0, 2), (3, 1), (5, 1), (8, 1), (14, 1), (16, 1)],
  term ((-5024 : Rat) / 299) [(0, 2), (3, 1), (5, 1), (8, 1), (16, 1)],
  term ((2512 : Rat) / 299) [(0, 2), (3, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((-2144 : Rat) / 299) [(0, 2), (3, 1), (8, 1), (9, 1), (16, 1)],
  term ((-1256 : Rat) / 299) [(0, 2), (3, 1), (8, 1), (11, 1), (16, 1)],
  term ((-96 : Rat) / 13) [(0, 2), (3, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((24 : Rat) / 13) [(0, 2), (3, 1), (8, 1), (13, 1), (16, 1)],
  term ((76 : Rat) / 299) [(0, 2), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((8180 : Rat) / 299) [(0, 2), (3, 1), (9, 1), (14, 1), (16, 1)],
  term ((-8180 : Rat) / 299) [(0, 2), (3, 1), (9, 1), (16, 1)],
  term ((-1256 : Rat) / 299) [(0, 2), (3, 1), (11, 1), (14, 1), (16, 1)],
  term ((1256 : Rat) / 299) [(0, 2), (3, 1), (11, 1), (16, 1)],
  term ((48 : Rat) / 13) [(0, 2), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((24 : Rat) / 13) [(0, 2), (3, 1), (13, 1), (16, 1)],
  term ((-138 : Rat) / 13) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((72 : Rat) / 13) [(0, 2), (3, 2), (8, 1), (16, 1)],
  term ((60 : Rat) / 13) [(0, 2), (3, 2), (14, 1), (16, 1)],
  term ((-72 : Rat) / 13) [(0, 2), (3, 2), (16, 1)],
  term ((36 : Rat) / 13) [(0, 2), (4, 1), (9, 1), (13, 1), (16, 1)],
  term ((-36 : Rat) / 13) [(0, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-36 : Rat) / 13) [(0, 2), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((36 : Rat) / 13) [(0, 2), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((-36 : Rat) / 13) [(0, 2), (5, 1), (13, 1), (16, 1)],
  term ((-36 : Rat) / 13) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((24 : Rat) / 13) [(0, 2), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-12 : Rat) / 13) [(0, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-54 : Rat) / 13) [(0, 2), (9, 1), (13, 1), (16, 1)],
  term ((-28 : Rat) / 13) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((1256 : Rat) / 299) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((54 : Rat) / 13) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-3600 : Rat) / 299) [(1, 1), (2, 2), (3, 1), (9, 1), (13, 1), (16, 1)],
  term ((17280 : Rat) / 299) [(1, 1), (2, 2), (3, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8640 : Rat) / 299) [(1, 1), (2, 2), (3, 1), (9, 1), (15, 1), (16, 1)],
  term ((-2400 : Rat) / 299) [(1, 1), (2, 2), (3, 1), (9, 2), (16, 1)],
  term ((480 : Rat) / 299) [(1, 1), (2, 2), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((7200 : Rat) / 299) [(1, 1), (2, 2), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((720 : Rat) / 299) [(1, 1), (2, 2), (3, 1), (14, 1), (16, 1)],
  term ((-720 : Rat) / 299) [(1, 1), (2, 2), (3, 1), (16, 1)],
  term ((-72 : Rat) / 13) [(1, 1), (3, 1), (4, 1), (9, 1), (13, 1), (16, 1)],
  term ((72 : Rat) / 13) [(1, 1), (3, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((72 : Rat) / 13) [(1, 1), (3, 1), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((-72 : Rat) / 13) [(1, 1), (3, 1), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((72 : Rat) / 13) [(1, 1), (3, 1), (5, 1), (13, 1), (16, 1)],
  term ((72 : Rat) / 13) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((-48 : Rat) / 13) [(1, 1), (3, 1), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((24 : Rat) / 13) [(1, 1), (3, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((108 : Rat) / 13) [(1, 1), (3, 1), (9, 1), (13, 1), (16, 1)],
  term ((56 : Rat) / 13) [(1, 1), (3, 1), (9, 1), (15, 1), (16, 1)],
  term ((-2512 : Rat) / 299) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((-108 : Rat) / 13) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((10048 : Rat) / 299) [(1, 1), (3, 2), (4, 1), (9, 1), (14, 1), (16, 1)],
  term ((-10048 : Rat) / 299) [(1, 1), (3, 2), (4, 1), (9, 1), (16, 1)],
  term ((96 : Rat) / 13) [(1, 1), (3, 2), (4, 1), (13, 1), (14, 1), (16, 1)],
  term ((-72 : Rat) / 13) [(1, 1), (3, 2), (4, 1), (15, 1), (16, 1)],
  term ((-10048 : Rat) / 299) [(1, 1), (3, 2), (5, 1), (8, 1), (14, 1), (16, 1)],
  term ((10048 : Rat) / 299) [(1, 1), (3, 2), (5, 1), (8, 1), (16, 1)],
  term ((-5024 : Rat) / 299) [(1, 1), (3, 2), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((4288 : Rat) / 299) [(1, 1), (3, 2), (8, 1), (9, 1), (16, 1)],
  term ((2512 : Rat) / 299) [(1, 1), (3, 2), (8, 1), (11, 1), (16, 1)],
  term ((192 : Rat) / 13) [(1, 1), (3, 2), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-48 : Rat) / 13) [(1, 1), (3, 2), (8, 1), (13, 1), (16, 1)],
  term ((-152 : Rat) / 299) [(1, 1), (3, 2), (8, 1), (15, 1), (16, 1)],
  term ((-16360 : Rat) / 299) [(1, 1), (3, 2), (9, 1), (14, 1), (16, 1)],
  term ((16360 : Rat) / 299) [(1, 1), (3, 2), (9, 1), (16, 1)],
  term ((2512 : Rat) / 299) [(1, 1), (3, 2), (11, 1), (14, 1), (16, 1)],
  term ((-2512 : Rat) / 299) [(1, 1), (3, 2), (11, 1), (16, 1)],
  term ((-96 : Rat) / 13) [(1, 1), (3, 2), (13, 1), (14, 1), (16, 1)],
  term ((-48 : Rat) / 13) [(1, 1), (3, 2), (13, 1), (16, 1)],
  term ((276 : Rat) / 13) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((-144 : Rat) / 13) [(1, 1), (3, 3), (8, 1), (16, 1)],
  term ((-120 : Rat) / 13) [(1, 1), (3, 3), (14, 1), (16, 1)],
  term ((144 : Rat) / 13) [(1, 1), (3, 3), (16, 1)],
  term ((1800 : Rat) / 299) [(1, 2), (2, 2), (9, 1), (13, 1), (16, 1)],
  term ((-8640 : Rat) / 299) [(1, 2), (2, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(1, 2), (2, 2), (9, 1), (15, 1), (16, 1)],
  term ((1200 : Rat) / 299) [(1, 2), (2, 2), (9, 2), (16, 1)],
  term ((-240 : Rat) / 299) [(1, 2), (2, 2), (11, 1), (15, 1), (16, 1)],
  term ((-3600 : Rat) / 299) [(1, 2), (2, 2), (13, 1), (15, 1), (16, 1)],
  term ((-360 : Rat) / 299) [(1, 2), (2, 2), (14, 1), (16, 1)],
  term ((360 : Rat) / 299) [(1, 2), (2, 2), (16, 1)],
  term ((-5024 : Rat) / 299) [(1, 2), (3, 1), (4, 1), (9, 1), (14, 1), (16, 1)],
  term ((5024 : Rat) / 299) [(1, 2), (3, 1), (4, 1), (9, 1), (16, 1)],
  term ((-48 : Rat) / 13) [(1, 2), (3, 1), (4, 1), (13, 1), (14, 1), (16, 1)],
  term ((36 : Rat) / 13) [(1, 2), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((5024 : Rat) / 299) [(1, 2), (3, 1), (5, 1), (8, 1), (14, 1), (16, 1)],
  term ((-5024 : Rat) / 299) [(1, 2), (3, 1), (5, 1), (8, 1), (16, 1)],
  term ((2512 : Rat) / 299) [(1, 2), (3, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((-2144 : Rat) / 299) [(1, 2), (3, 1), (8, 1), (9, 1), (16, 1)],
  term ((-1256 : Rat) / 299) [(1, 2), (3, 1), (8, 1), (11, 1), (16, 1)],
  term ((-96 : Rat) / 13) [(1, 2), (3, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((24 : Rat) / 13) [(1, 2), (3, 1), (8, 1), (13, 1), (16, 1)],
  term ((76 : Rat) / 299) [(1, 2), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((8180 : Rat) / 299) [(1, 2), (3, 1), (9, 1), (14, 1), (16, 1)],
  term ((-8180 : Rat) / 299) [(1, 2), (3, 1), (9, 1), (16, 1)],
  term ((-1256 : Rat) / 299) [(1, 2), (3, 1), (11, 1), (14, 1), (16, 1)],
  term ((1256 : Rat) / 299) [(1, 2), (3, 1), (11, 1), (16, 1)],
  term ((48 : Rat) / 13) [(1, 2), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((24 : Rat) / 13) [(1, 2), (3, 1), (13, 1), (16, 1)],
  term ((-138 : Rat) / 13) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((72 : Rat) / 13) [(1, 2), (3, 2), (8, 1), (16, 1)],
  term ((60 : Rat) / 13) [(1, 2), (3, 2), (14, 1), (16, 1)],
  term ((-72 : Rat) / 13) [(1, 2), (3, 2), (16, 1)],
  term ((36 : Rat) / 13) [(1, 2), (4, 1), (9, 1), (13, 1), (16, 1)],
  term ((-36 : Rat) / 13) [(1, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-36 : Rat) / 13) [(1, 2), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((36 : Rat) / 13) [(1, 2), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((-36 : Rat) / 13) [(1, 2), (5, 1), (13, 1), (16, 1)],
  term ((-36 : Rat) / 13) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((24 : Rat) / 13) [(1, 2), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-12 : Rat) / 13) [(1, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-54 : Rat) / 13) [(1, 2), (9, 1), (13, 1), (16, 1)],
  term ((-28 : Rat) / 13) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((1256 : Rat) / 299) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((54 : Rat) / 13) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((10048 : Rat) / 299) [(2, 1), (3, 1), (4, 1), (5, 1), (8, 1), (14, 1), (16, 1)],
  term ((-10048 : Rat) / 299) [(2, 1), (3, 1), (4, 1), (5, 1), (8, 1), (16, 1)],
  term ((5024 : Rat) / 299) [(2, 1), (3, 1), (4, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((-4288 : Rat) / 299) [(2, 1), (3, 1), (4, 1), (8, 1), (9, 1), (16, 1)],
  term ((-2512 : Rat) / 299) [(2, 1), (3, 1), (4, 1), (8, 1), (11, 1), (16, 1)],
  term ((-192 : Rat) / 13) [(2, 1), (3, 1), (4, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((48 : Rat) / 13) [(2, 1), (3, 1), (4, 1), (8, 1), (13, 1), (16, 1)],
  term ((152 : Rat) / 299) [(2, 1), (3, 1), (4, 1), (8, 1), (15, 1), (16, 1)],
  term ((16360 : Rat) / 299) [(2, 1), (3, 1), (4, 1), (9, 1), (14, 1), (16, 1)],
  term ((-16360 : Rat) / 299) [(2, 1), (3, 1), (4, 1), (9, 1), (16, 1)],
  term ((-2512 : Rat) / 299) [(2, 1), (3, 1), (4, 1), (11, 1), (14, 1), (16, 1)],
  term ((2512 : Rat) / 299) [(2, 1), (3, 1), (4, 1), (11, 1), (16, 1)],
  term ((96 : Rat) / 13) [(2, 1), (3, 1), (4, 1), (13, 1), (14, 1), (16, 1)],
  term ((48 : Rat) / 13) [(2, 1), (3, 1), (4, 1), (13, 1), (16, 1)],
  term ((-276 : Rat) / 13) [(2, 1), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((-10048 : Rat) / 299) [(2, 1), (3, 1), (4, 2), (9, 1), (14, 1), (16, 1)],
  term ((10048 : Rat) / 299) [(2, 1), (3, 1), (4, 2), (9, 1), (16, 1)],
  term ((-96 : Rat) / 13) [(2, 1), (3, 1), (4, 2), (13, 1), (14, 1), (16, 1)],
  term ((72 : Rat) / 13) [(2, 1), (3, 1), (4, 2), (15, 1), (16, 1)],
  term ((144 : Rat) / 13) [(2, 1), (3, 2), (4, 1), (8, 1), (16, 1)],
  term ((120 : Rat) / 13) [(2, 1), (3, 2), (4, 1), (14, 1), (16, 1)],
  term ((-144 : Rat) / 13) [(2, 1), (3, 2), (4, 1), (16, 1)],
  term ((-72 : Rat) / 13) [(2, 1), (4, 1), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((72 : Rat) / 13) [(2, 1), (4, 1), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((-72 : Rat) / 13) [(2, 1), (4, 1), (5, 1), (13, 1), (16, 1)],
  term ((-72 : Rat) / 13) [(2, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((48 : Rat) / 13) [(2, 1), (4, 1), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-24 : Rat) / 13) [(2, 1), (4, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-108 : Rat) / 13) [(2, 1), (4, 1), (9, 1), (13, 1), (16, 1)],
  term ((-56 : Rat) / 13) [(2, 1), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((2512 : Rat) / 299) [(2, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((108 : Rat) / 13) [(2, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((72 : Rat) / 13) [(2, 1), (4, 2), (9, 1), (13, 1), (16, 1)],
  term ((-72 : Rat) / 13) [(2, 1), (4, 2), (13, 1), (15, 1), (16, 1)],
  term ((3600 : Rat) / 299) [(2, 2), (3, 1), (5, 1), (9, 1), (13, 1), (16, 1)],
  term ((-17280 : Rat) / 299) [(2, 2), (3, 1), (5, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((8640 : Rat) / 299) [(2, 2), (3, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((2400 : Rat) / 299) [(2, 2), (3, 1), (5, 1), (9, 2), (16, 1)],
  term ((-480 : Rat) / 299) [(2, 2), (3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-7200 : Rat) / 299) [(2, 2), (3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-720 : Rat) / 299) [(2, 2), (3, 1), (5, 1), (14, 1), (16, 1)],
  term ((720 : Rat) / 299) [(2, 2), (3, 1), (5, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(2, 2), (4, 2), (9, 1), (13, 1), (16, 1)],
  term ((8640 : Rat) / 299) [(2, 2), (4, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(2, 2), (4, 2), (9, 1), (15, 1), (16, 1)],
  term ((-1200 : Rat) / 299) [(2, 2), (4, 2), (9, 2), (16, 1)],
  term ((240 : Rat) / 299) [(2, 2), (4, 2), (11, 1), (15, 1), (16, 1)],
  term ((3600 : Rat) / 299) [(2, 2), (4, 2), (13, 1), (15, 1), (16, 1)],
  term ((360 : Rat) / 299) [(2, 2), (4, 2), (14, 1), (16, 1)],
  term ((-360 : Rat) / 299) [(2, 2), (4, 2), (16, 1)],
  term ((-1800 : Rat) / 299) [(2, 2), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((8640 : Rat) / 299) [(2, 2), (5, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(2, 2), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-1200 : Rat) / 299) [(2, 2), (5, 2), (9, 2), (16, 1)],
  term ((240 : Rat) / 299) [(2, 2), (5, 2), (11, 1), (15, 1), (16, 1)],
  term ((3600 : Rat) / 299) [(2, 2), (5, 2), (13, 1), (15, 1), (16, 1)],
  term ((360 : Rat) / 299) [(2, 2), (5, 2), (14, 1), (16, 1)],
  term ((-360 : Rat) / 299) [(2, 2), (5, 2), (16, 1)],
  term ((3600 : Rat) / 299) [(2, 3), (4, 1), (9, 1), (13, 1), (16, 1)],
  term ((-17280 : Rat) / 299) [(2, 3), (4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((8640 : Rat) / 299) [(2, 3), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((2400 : Rat) / 299) [(2, 3), (4, 1), (9, 2), (16, 1)],
  term ((-480 : Rat) / 299) [(2, 3), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-7200 : Rat) / 299) [(2, 3), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-720 : Rat) / 299) [(2, 3), (4, 1), (14, 1), (16, 1)],
  term ((720 : Rat) / 299) [(2, 3), (4, 1), (16, 1)],
  term ((72 : Rat) / 13) [(3, 1), (4, 1), (5, 1), (9, 1), (13, 1), (16, 1)],
  term ((-72 : Rat) / 13) [(3, 1), (4, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((5024 : Rat) / 299) [(3, 1), (4, 1), (5, 2), (9, 1), (14, 1), (16, 1)],
  term ((-5024 : Rat) / 299) [(3, 1), (4, 1), (5, 2), (9, 1), (16, 1)],
  term ((48 : Rat) / 13) [(3, 1), (4, 1), (5, 2), (13, 1), (14, 1), (16, 1)],
  term ((-36 : Rat) / 13) [(3, 1), (4, 1), (5, 2), (15, 1), (16, 1)],
  term ((-5024 : Rat) / 299) [(3, 1), (4, 2), (5, 1), (8, 1), (14, 1), (16, 1)],
  term ((5024 : Rat) / 299) [(3, 1), (4, 2), (5, 1), (8, 1), (16, 1)],
  term ((-2512 : Rat) / 299) [(3, 1), (4, 2), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((2144 : Rat) / 299) [(3, 1), (4, 2), (8, 1), (9, 1), (16, 1)],
  term ((1256 : Rat) / 299) [(3, 1), (4, 2), (8, 1), (11, 1), (16, 1)],
  term ((96 : Rat) / 13) [(3, 1), (4, 2), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-24 : Rat) / 13) [(3, 1), (4, 2), (8, 1), (13, 1), (16, 1)],
  term ((-76 : Rat) / 299) [(3, 1), (4, 2), (8, 1), (15, 1), (16, 1)],
  term ((-8180 : Rat) / 299) [(3, 1), (4, 2), (9, 1), (14, 1), (16, 1)],
  term ((8180 : Rat) / 299) [(3, 1), (4, 2), (9, 1), (16, 1)],
  term ((1256 : Rat) / 299) [(3, 1), (4, 2), (11, 1), (14, 1), (16, 1)],
  term ((-1256 : Rat) / 299) [(3, 1), (4, 2), (11, 1), (16, 1)],
  term ((-48 : Rat) / 13) [(3, 1), (4, 2), (13, 1), (14, 1), (16, 1)],
  term ((-24 : Rat) / 13) [(3, 1), (4, 2), (13, 1), (16, 1)],
  term ((138 : Rat) / 13) [(3, 1), (4, 2), (15, 1), (16, 1)],
  term ((5024 : Rat) / 299) [(3, 1), (4, 3), (9, 1), (14, 1), (16, 1)],
  term ((-5024 : Rat) / 299) [(3, 1), (4, 3), (9, 1), (16, 1)],
  term ((48 : Rat) / 13) [(3, 1), (4, 3), (13, 1), (14, 1), (16, 1)],
  term ((-36 : Rat) / 13) [(3, 1), (4, 3), (15, 1), (16, 1)],
  term ((48 : Rat) / 13) [(3, 1), (5, 1), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-24 : Rat) / 13) [(3, 1), (5, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-108 : Rat) / 13) [(3, 1), (5, 1), (9, 1), (13, 1), (16, 1)],
  term ((-56 : Rat) / 13) [(3, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((2512 : Rat) / 299) [(3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((108 : Rat) / 13) [(3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2512 : Rat) / 299) [(3, 1), (5, 2), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((2144 : Rat) / 299) [(3, 1), (5, 2), (8, 1), (9, 1), (16, 1)],
  term ((1256 : Rat) / 299) [(3, 1), (5, 2), (8, 1), (11, 1), (16, 1)],
  term ((96 : Rat) / 13) [(3, 1), (5, 2), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-96 : Rat) / 13) [(3, 1), (5, 2), (8, 1), (13, 1), (16, 1)],
  term ((-76 : Rat) / 299) [(3, 1), (5, 2), (8, 1), (15, 1), (16, 1)],
  term ((-8180 : Rat) / 299) [(3, 1), (5, 2), (9, 1), (14, 1), (16, 1)],
  term ((8180 : Rat) / 299) [(3, 1), (5, 2), (9, 1), (16, 1)],
  term ((1256 : Rat) / 299) [(3, 1), (5, 2), (11, 1), (14, 1), (16, 1)],
  term ((-1256 : Rat) / 299) [(3, 1), (5, 2), (11, 1), (16, 1)],
  term ((24 : Rat) / 13) [(3, 1), (5, 2), (13, 1), (14, 1), (16, 1)],
  term ((-96 : Rat) / 13) [(3, 1), (5, 2), (13, 1), (16, 1)],
  term ((66 : Rat) / 13) [(3, 1), (5, 2), (15, 1), (16, 1)],
  term ((-5024 : Rat) / 299) [(3, 1), (5, 3), (8, 1), (14, 1), (16, 1)],
  term ((5024 : Rat) / 299) [(3, 1), (5, 3), (8, 1), (16, 1)],
  term ((-10048 : Rat) / 299) [(3, 2), (4, 1), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((10048 : Rat) / 299) [(3, 2), (4, 1), (5, 1), (9, 1), (16, 1)],
  term ((-96 : Rat) / 13) [(3, 2), (4, 1), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((72 : Rat) / 13) [(3, 2), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-72 : Rat) / 13) [(3, 2), (4, 2), (8, 1), (16, 1)],
  term ((-60 : Rat) / 13) [(3, 2), (4, 2), (14, 1), (16, 1)],
  term ((72 : Rat) / 13) [(3, 2), (4, 2), (16, 1)],
  term ((5024 : Rat) / 299) [(3, 2), (5, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((-4288 : Rat) / 299) [(3, 2), (5, 1), (8, 1), (9, 1), (16, 1)],
  term ((-2512 : Rat) / 299) [(3, 2), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((-192 : Rat) / 13) [(3, 2), (5, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((48 : Rat) / 13) [(3, 2), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((152 : Rat) / 299) [(3, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((16360 : Rat) / 299) [(3, 2), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((-16360 : Rat) / 299) [(3, 2), (5, 1), (9, 1), (16, 1)],
  term ((-2512 : Rat) / 299) [(3, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((2512 : Rat) / 299) [(3, 2), (5, 1), (11, 1), (16, 1)],
  term ((96 : Rat) / 13) [(3, 2), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((48 : Rat) / 13) [(3, 2), (5, 1), (13, 1), (16, 1)],
  term ((-276 : Rat) / 13) [(3, 2), (5, 1), (15, 1), (16, 1)],
  term ((10048 : Rat) / 299) [(3, 2), (5, 2), (8, 1), (14, 1), (16, 1)],
  term ((-11704 : Rat) / 299) [(3, 2), (5, 2), (8, 1), (16, 1)],
  term ((-60 : Rat) / 13) [(3, 2), (5, 2), (14, 1), (16, 1)],
  term ((72 : Rat) / 13) [(3, 2), (5, 2), (16, 1)],
  term ((144 : Rat) / 13) [(3, 3), (5, 1), (8, 1), (16, 1)],
  term ((120 : Rat) / 13) [(3, 3), (5, 1), (14, 1), (16, 1)],
  term ((-144 : Rat) / 13) [(3, 3), (5, 1), (16, 1)],
  term ((-36 : Rat) / 13) [(4, 1), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((36 : Rat) / 13) [(4, 1), (5, 2), (13, 1), (15, 1), (16, 1)],
  term ((36 : Rat) / 13) [(4, 2), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((-36 : Rat) / 13) [(4, 2), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((36 : Rat) / 13) [(4, 2), (5, 1), (13, 1), (16, 1)],
  term ((36 : Rat) / 13) [(4, 2), (5, 1), (15, 1), (16, 1)],
  term ((-24 : Rat) / 13) [(4, 2), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((12 : Rat) / 13) [(4, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((54 : Rat) / 13) [(4, 2), (9, 1), (13, 1), (16, 1)],
  term ((28 : Rat) / 13) [(4, 2), (9, 1), (15, 1), (16, 1)],
  term ((-1256 : Rat) / 299) [(4, 2), (11, 1), (15, 1), (16, 1)],
  term ((-54 : Rat) / 13) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term ((-36 : Rat) / 13) [(4, 3), (9, 1), (13, 1), (16, 1)],
  term ((36 : Rat) / 13) [(4, 3), (13, 1), (15, 1), (16, 1)],
  term ((-24 : Rat) / 13) [(5, 2), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((12 : Rat) / 13) [(5, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((54 : Rat) / 13) [(5, 2), (9, 1), (13, 1), (16, 1)],
  term ((28 : Rat) / 13) [(5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-1256 : Rat) / 299) [(5, 2), (11, 1), (15, 1), (16, 1)],
  term ((-54 : Rat) / 13) [(5, 2), (13, 1), (15, 1), (16, 1)],
  term ((36 : Rat) / 13) [(5, 3), (8, 1), (13, 1), (16, 1)],
  term ((-36 : Rat) / 13) [(5, 3), (13, 1), (14, 1), (16, 1)],
  term ((36 : Rat) / 13) [(5, 3), (13, 1), (16, 1)],
  term ((36 : Rat) / 13) [(5, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 11, terms 200 through 241. -/
theorem rs_R003_ueqv_R003NY_block_11_0200_0241_valid :
    checkProductSumEq rs_R003_ueqv_R003NY_partials_11_0200_0241
      rs_R003_ueqv_R003NY_block_11_0200_0241 = true := by
  native_decide

end R003UeqvR003NYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
