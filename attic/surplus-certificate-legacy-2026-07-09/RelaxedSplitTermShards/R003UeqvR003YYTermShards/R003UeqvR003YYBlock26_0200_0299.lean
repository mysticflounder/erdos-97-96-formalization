/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R003:u=v:R003YY, term block 26:200-299

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R003UeqvR003YYTermShards

/-- Generator polynomial 26 for relaxed split surplus certificate `R003:u=v:R003YY`. -/
def rs_R003_ueqv_R003YY_generator_26_0200_0299 : Poly :=
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

/-- Coefficient term 200 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0200 : Poly :=
[
  term ((-2808 : Rat) / 35) [(3, 1), (11, 1), (14, 1)]
]

/-- Partial product 200 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0200 : Poly :=
[
  term ((5616 : Rat) / 35) [(0, 1), (3, 1), (11, 1), (12, 1), (14, 1)],
  term ((-2808 : Rat) / 35) [(0, 2), (3, 1), (11, 1), (14, 1)],
  term ((5616 : Rat) / 35) [(1, 1), (3, 1), (11, 1), (13, 1), (14, 1)],
  term ((-2808 : Rat) / 35) [(1, 2), (3, 1), (11, 1), (14, 1)],
  term ((-5616 : Rat) / 35) [(3, 1), (6, 1), (11, 1), (12, 1), (14, 1)],
  term ((2808 : Rat) / 35) [(3, 1), (6, 2), (11, 1), (14, 1)],
  term ((-5616 : Rat) / 35) [(3, 1), (7, 1), (11, 1), (13, 1), (14, 1)],
  term ((2808 : Rat) / 35) [(3, 1), (7, 2), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0200_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0200
        rs_R003_ueqv_R003YY_generator_26_0200_0299 =
      rs_R003_ueqv_R003YY_partial_26_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0201 : Poly :=
[
  term ((936 : Rat) / 35) [(3, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 201 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0201 : Poly :=
[
  term ((-1872 : Rat) / 35) [(0, 1), (3, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((936 : Rat) / 35) [(0, 2), (3, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1872 : Rat) / 35) [(1, 1), (3, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((936 : Rat) / 35) [(1, 2), (3, 1), (11, 1), (14, 1), (16, 1)],
  term ((1872 : Rat) / 35) [(3, 1), (6, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-936 : Rat) / 35) [(3, 1), (6, 2), (11, 1), (14, 1), (16, 1)],
  term ((1872 : Rat) / 35) [(3, 1), (7, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-936 : Rat) / 35) [(3, 1), (7, 2), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0201_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0201
        rs_R003_ueqv_R003YY_generator_26_0200_0299 =
      rs_R003_ueqv_R003YY_partial_26_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0202 : Poly :=
[
  term ((1872 : Rat) / 35) [(3, 1), (11, 1), (16, 1)]
]

/-- Partial product 202 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0202 : Poly :=
[
  term ((-3744 : Rat) / 35) [(0, 1), (3, 1), (11, 1), (12, 1), (16, 1)],
  term ((1872 : Rat) / 35) [(0, 2), (3, 1), (11, 1), (16, 1)],
  term ((-3744 : Rat) / 35) [(1, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((1872 : Rat) / 35) [(1, 2), (3, 1), (11, 1), (16, 1)],
  term ((3744 : Rat) / 35) [(3, 1), (6, 1), (11, 1), (12, 1), (16, 1)],
  term ((-1872 : Rat) / 35) [(3, 1), (6, 2), (11, 1), (16, 1)],
  term ((3744 : Rat) / 35) [(3, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1872 : Rat) / 35) [(3, 1), (7, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0202_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0202
        rs_R003_ueqv_R003YY_generator_26_0200_0299 =
      rs_R003_ueqv_R003YY_partial_26_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0203 : Poly :=
[
  term ((2256 : Rat) / 35) [(3, 1), (13, 1)]
]

/-- Partial product 203 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0203 : Poly :=
[
  term ((-4512 : Rat) / 35) [(0, 1), (3, 1), (12, 1), (13, 1)],
  term ((2256 : Rat) / 35) [(0, 2), (3, 1), (13, 1)],
  term ((-4512 : Rat) / 35) [(1, 1), (3, 1), (13, 2)],
  term ((2256 : Rat) / 35) [(1, 2), (3, 1), (13, 1)],
  term ((4512 : Rat) / 35) [(3, 1), (6, 1), (12, 1), (13, 1)],
  term ((-2256 : Rat) / 35) [(3, 1), (6, 2), (13, 1)],
  term ((4512 : Rat) / 35) [(3, 1), (7, 1), (13, 2)],
  term ((-2256 : Rat) / 35) [(3, 1), (7, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0203_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0203
        rs_R003_ueqv_R003YY_generator_26_0200_0299 =
      rs_R003_ueqv_R003YY_partial_26_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0204 : Poly :=
[
  term ((64 : Rat) / 35) [(3, 1), (13, 1), (14, 1)]
]

/-- Partial product 204 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0204 : Poly :=
[
  term ((-128 : Rat) / 35) [(0, 1), (3, 1), (12, 1), (13, 1), (14, 1)],
  term ((64 : Rat) / 35) [(0, 2), (3, 1), (13, 1), (14, 1)],
  term ((-128 : Rat) / 35) [(1, 1), (3, 1), (13, 2), (14, 1)],
  term ((64 : Rat) / 35) [(1, 2), (3, 1), (13, 1), (14, 1)],
  term ((128 : Rat) / 35) [(3, 1), (6, 1), (12, 1), (13, 1), (14, 1)],
  term ((-64 : Rat) / 35) [(3, 1), (6, 2), (13, 1), (14, 1)],
  term ((128 : Rat) / 35) [(3, 1), (7, 1), (13, 2), (14, 1)],
  term ((-64 : Rat) / 35) [(3, 1), (7, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0204_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0204
        rs_R003_ueqv_R003YY_generator_26_0200_0299 =
      rs_R003_ueqv_R003YY_partial_26_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0205 : Poly :=
[
  term ((-264 : Rat) / 35) [(3, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 205 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0205 : Poly :=
[
  term ((528 : Rat) / 35) [(0, 1), (3, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-264 : Rat) / 35) [(0, 2), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((528 : Rat) / 35) [(1, 1), (3, 1), (13, 2), (14, 1), (16, 1)],
  term ((-264 : Rat) / 35) [(1, 2), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((-528 : Rat) / 35) [(3, 1), (6, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((264 : Rat) / 35) [(3, 1), (6, 2), (13, 1), (14, 1), (16, 1)],
  term ((-528 : Rat) / 35) [(3, 1), (7, 1), (13, 2), (14, 1), (16, 1)],
  term ((264 : Rat) / 35) [(3, 1), (7, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0205_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0205
        rs_R003_ueqv_R003YY_generator_26_0200_0299 =
      rs_R003_ueqv_R003YY_partial_26_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0206 : Poly :=
[
  term ((-542 : Rat) / 35) [(3, 1), (13, 1), (16, 1)]
]

/-- Partial product 206 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0206 : Poly :=
[
  term ((1084 : Rat) / 35) [(0, 1), (3, 1), (12, 1), (13, 1), (16, 1)],
  term ((-542 : Rat) / 35) [(0, 2), (3, 1), (13, 1), (16, 1)],
  term ((1084 : Rat) / 35) [(1, 1), (3, 1), (13, 2), (16, 1)],
  term ((-542 : Rat) / 35) [(1, 2), (3, 1), (13, 1), (16, 1)],
  term ((-1084 : Rat) / 35) [(3, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term ((542 : Rat) / 35) [(3, 1), (6, 2), (13, 1), (16, 1)],
  term ((-1084 : Rat) / 35) [(3, 1), (7, 1), (13, 2), (16, 1)],
  term ((542 : Rat) / 35) [(3, 1), (7, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0206_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0206
        rs_R003_ueqv_R003YY_generator_26_0200_0299 =
      rs_R003_ueqv_R003YY_partial_26_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0207 : Poly :=
[
  term ((-393 : Rat) / 25) [(3, 1), (15, 1)]
]

/-- Partial product 207 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0207 : Poly :=
[
  term ((786 : Rat) / 25) [(0, 1), (3, 1), (12, 1), (15, 1)],
  term ((-393 : Rat) / 25) [(0, 2), (3, 1), (15, 1)],
  term ((786 : Rat) / 25) [(1, 1), (3, 1), (13, 1), (15, 1)],
  term ((-393 : Rat) / 25) [(1, 2), (3, 1), (15, 1)],
  term ((-786 : Rat) / 25) [(3, 1), (6, 1), (12, 1), (15, 1)],
  term ((393 : Rat) / 25) [(3, 1), (6, 2), (15, 1)],
  term ((-786 : Rat) / 25) [(3, 1), (7, 1), (13, 1), (15, 1)],
  term ((393 : Rat) / 25) [(3, 1), (7, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0207_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0207
        rs_R003_ueqv_R003YY_generator_26_0200_0299 =
      rs_R003_ueqv_R003YY_partial_26_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0208 : Poly :=
[
  term ((9 : Rat) / 5) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 208 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0208 : Poly :=
[
  term ((-18 : Rat) / 5) [(0, 1), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((9 : Rat) / 5) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((-18 : Rat) / 5) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((9 : Rat) / 5) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((18 : Rat) / 5) [(3, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-9 : Rat) / 5) [(3, 1), (6, 2), (15, 1), (16, 1)],
  term ((18 : Rat) / 5) [(3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-9 : Rat) / 5) [(3, 1), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0208_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0208
        rs_R003_ueqv_R003YY_generator_26_0200_0299 =
      rs_R003_ueqv_R003YY_partial_26_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0209 : Poly :=
[
  term ((-2592 : Rat) / 35) [(3, 2), (9, 1), (11, 1)]
]

/-- Partial product 209 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0209 : Poly :=
[
  term ((5184 : Rat) / 35) [(0, 1), (3, 2), (9, 1), (11, 1), (12, 1)],
  term ((-2592 : Rat) / 35) [(0, 2), (3, 2), (9, 1), (11, 1)],
  term ((5184 : Rat) / 35) [(1, 1), (3, 2), (9, 1), (11, 1), (13, 1)],
  term ((-2592 : Rat) / 35) [(1, 2), (3, 2), (9, 1), (11, 1)],
  term ((-5184 : Rat) / 35) [(3, 2), (6, 1), (9, 1), (11, 1), (12, 1)],
  term ((2592 : Rat) / 35) [(3, 2), (6, 2), (9, 1), (11, 1)],
  term ((-5184 : Rat) / 35) [(3, 2), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((2592 : Rat) / 35) [(3, 2), (7, 2), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0209_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0209
        rs_R003_ueqv_R003YY_generator_26_0200_0299 =
      rs_R003_ueqv_R003YY_partial_26_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0210 : Poly :=
[
  term ((1728 : Rat) / 35) [(3, 2), (9, 1), (11, 1), (12, 1)]
]

/-- Partial product 210 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0210 : Poly :=
[
  term ((-3456 : Rat) / 35) [(0, 1), (3, 2), (9, 1), (11, 1), (12, 2)],
  term ((1728 : Rat) / 35) [(0, 2), (3, 2), (9, 1), (11, 1), (12, 1)],
  term ((-3456 : Rat) / 35) [(1, 1), (3, 2), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((1728 : Rat) / 35) [(1, 2), (3, 2), (9, 1), (11, 1), (12, 1)],
  term ((3456 : Rat) / 35) [(3, 2), (6, 1), (9, 1), (11, 1), (12, 2)],
  term ((-1728 : Rat) / 35) [(3, 2), (6, 2), (9, 1), (11, 1), (12, 1)],
  term ((3456 : Rat) / 35) [(3, 2), (7, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((-1728 : Rat) / 35) [(3, 2), (7, 2), (9, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0210_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0210
        rs_R003_ueqv_R003YY_generator_26_0200_0299 =
      rs_R003_ueqv_R003YY_partial_26_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0211 : Poly :=
[
  term ((864 : Rat) / 35) [(3, 2), (9, 1), (11, 1), (12, 1), (14, 1)]
]

/-- Partial product 211 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0211 : Poly :=
[
  term ((-1728 : Rat) / 35) [(0, 1), (3, 2), (9, 1), (11, 1), (12, 2), (14, 1)],
  term ((864 : Rat) / 35) [(0, 2), (3, 2), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((-1728 : Rat) / 35) [(1, 1), (3, 2), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((864 : Rat) / 35) [(1, 2), (3, 2), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((1728 : Rat) / 35) [(3, 2), (6, 1), (9, 1), (11, 1), (12, 2), (14, 1)],
  term ((-864 : Rat) / 35) [(3, 2), (6, 2), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((1728 : Rat) / 35) [(3, 2), (7, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-864 : Rat) / 35) [(3, 2), (7, 2), (9, 1), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0211_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0211
        rs_R003_ueqv_R003YY_generator_26_0200_0299 =
      rs_R003_ueqv_R003YY_partial_26_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0212 : Poly :=
[
  term ((-288 : Rat) / 35) [(3, 2), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 212 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0212 : Poly :=
[
  term ((576 : Rat) / 35) [(0, 1), (3, 2), (9, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((-288 : Rat) / 35) [(0, 2), (3, 2), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((576 : Rat) / 35) [(1, 1), (3, 2), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-288 : Rat) / 35) [(1, 2), (3, 2), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-576 : Rat) / 35) [(3, 2), (6, 1), (9, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((288 : Rat) / 35) [(3, 2), (6, 2), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-576 : Rat) / 35) [(3, 2), (7, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((288 : Rat) / 35) [(3, 2), (7, 2), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0212_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0212
        rs_R003_ueqv_R003YY_generator_26_0200_0299 =
      rs_R003_ueqv_R003YY_partial_26_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0213 : Poly :=
[
  term ((-576 : Rat) / 35) [(3, 2), (9, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 213 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0213 : Poly :=
[
  term ((1152 : Rat) / 35) [(0, 1), (3, 2), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((-576 : Rat) / 35) [(0, 2), (3, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((1152 : Rat) / 35) [(1, 1), (3, 2), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-576 : Rat) / 35) [(1, 2), (3, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-1152 : Rat) / 35) [(3, 2), (6, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((576 : Rat) / 35) [(3, 2), (6, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-1152 : Rat) / 35) [(3, 2), (7, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((576 : Rat) / 35) [(3, 2), (7, 2), (9, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0213_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0213
        rs_R003_ueqv_R003YY_generator_26_0200_0299 =
      rs_R003_ueqv_R003YY_partial_26_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0214 : Poly :=
[
  term ((-1296 : Rat) / 35) [(3, 2), (9, 1), (11, 1), (14, 1)]
]

/-- Partial product 214 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0214 : Poly :=
[
  term ((2592 : Rat) / 35) [(0, 1), (3, 2), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((-1296 : Rat) / 35) [(0, 2), (3, 2), (9, 1), (11, 1), (14, 1)],
  term ((2592 : Rat) / 35) [(1, 1), (3, 2), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((-1296 : Rat) / 35) [(1, 2), (3, 2), (9, 1), (11, 1), (14, 1)],
  term ((-2592 : Rat) / 35) [(3, 2), (6, 1), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((1296 : Rat) / 35) [(3, 2), (6, 2), (9, 1), (11, 1), (14, 1)],
  term ((-2592 : Rat) / 35) [(3, 2), (7, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((1296 : Rat) / 35) [(3, 2), (7, 2), (9, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0214_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0214
        rs_R003_ueqv_R003YY_generator_26_0200_0299 =
      rs_R003_ueqv_R003YY_partial_26_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0215 : Poly :=
[
  term ((432 : Rat) / 35) [(3, 2), (9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 215 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0215 : Poly :=
[
  term ((-864 : Rat) / 35) [(0, 1), (3, 2), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((432 : Rat) / 35) [(0, 2), (3, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-864 : Rat) / 35) [(1, 1), (3, 2), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((432 : Rat) / 35) [(1, 2), (3, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((864 : Rat) / 35) [(3, 2), (6, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-432 : Rat) / 35) [(3, 2), (6, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((864 : Rat) / 35) [(3, 2), (7, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-432 : Rat) / 35) [(3, 2), (7, 2), (9, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0215_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0215
        rs_R003_ueqv_R003YY_generator_26_0200_0299 =
      rs_R003_ueqv_R003YY_partial_26_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0216 : Poly :=
[
  term ((864 : Rat) / 35) [(3, 2), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 216 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0216 : Poly :=
[
  term ((-1728 : Rat) / 35) [(0, 1), (3, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((864 : Rat) / 35) [(0, 2), (3, 2), (9, 1), (11, 1), (16, 1)],
  term ((-1728 : Rat) / 35) [(1, 1), (3, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((864 : Rat) / 35) [(1, 2), (3, 2), (9, 1), (11, 1), (16, 1)],
  term ((1728 : Rat) / 35) [(3, 2), (6, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-864 : Rat) / 35) [(3, 2), (6, 2), (9, 1), (11, 1), (16, 1)],
  term ((1728 : Rat) / 35) [(3, 2), (7, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-864 : Rat) / 35) [(3, 2), (7, 2), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0216_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0216
        rs_R003_ueqv_R003YY_generator_26_0200_0299 =
      rs_R003_ueqv_R003YY_partial_26_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0217 : Poly :=
[
  term ((108 : Rat) / 5) [(3, 2), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 217 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0217 : Poly :=
[
  term ((-216 : Rat) / 5) [(0, 1), (3, 2), (9, 1), (12, 2), (15, 1)],
  term ((108 : Rat) / 5) [(0, 2), (3, 2), (9, 1), (12, 1), (15, 1)],
  term ((-216 : Rat) / 5) [(1, 1), (3, 2), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((108 : Rat) / 5) [(1, 2), (3, 2), (9, 1), (12, 1), (15, 1)],
  term ((216 : Rat) / 5) [(3, 2), (6, 1), (9, 1), (12, 2), (15, 1)],
  term ((-108 : Rat) / 5) [(3, 2), (6, 2), (9, 1), (12, 1), (15, 1)],
  term ((216 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-108 : Rat) / 5) [(3, 2), (7, 2), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0217_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0217
        rs_R003_ueqv_R003YY_generator_26_0200_0299 =
      rs_R003_ueqv_R003YY_partial_26_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0218 : Poly :=
[
  term ((-12 : Rat) / 5) [(3, 2), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 218 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0218 : Poly :=
[
  term ((24 : Rat) / 5) [(0, 1), (3, 2), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-12 : Rat) / 5) [(0, 2), (3, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((24 : Rat) / 5) [(1, 1), (3, 2), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-12 : Rat) / 5) [(1, 2), (3, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-24 : Rat) / 5) [(3, 2), (6, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((12 : Rat) / 5) [(3, 2), (6, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-24 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((12 : Rat) / 5) [(3, 2), (7, 2), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0218_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0218
        rs_R003_ueqv_R003YY_generator_26_0200_0299 =
      rs_R003_ueqv_R003YY_partial_26_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0219 : Poly :=
[
  term ((-162 : Rat) / 5) [(3, 2), (9, 1), (15, 1)]
]

/-- Partial product 219 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0219 : Poly :=
[
  term ((324 : Rat) / 5) [(0, 1), (3, 2), (9, 1), (12, 1), (15, 1)],
  term ((-162 : Rat) / 5) [(0, 2), (3, 2), (9, 1), (15, 1)],
  term ((324 : Rat) / 5) [(1, 1), (3, 2), (9, 1), (13, 1), (15, 1)],
  term ((-162 : Rat) / 5) [(1, 2), (3, 2), (9, 1), (15, 1)],
  term ((-324 : Rat) / 5) [(3, 2), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((162 : Rat) / 5) [(3, 2), (6, 2), (9, 1), (15, 1)],
  term ((-324 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((162 : Rat) / 5) [(3, 2), (7, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0219_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0219
        rs_R003_ueqv_R003YY_generator_26_0200_0299 =
      rs_R003_ueqv_R003YY_partial_26_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0220 : Poly :=
[
  term ((18 : Rat) / 5) [(3, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 220 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0220 : Poly :=
[
  term ((-36 : Rat) / 5) [(0, 1), (3, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((18 : Rat) / 5) [(0, 2), (3, 2), (9, 1), (15, 1), (16, 1)],
  term ((-36 : Rat) / 5) [(1, 1), (3, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((18 : Rat) / 5) [(1, 2), (3, 2), (9, 1), (15, 1), (16, 1)],
  term ((36 : Rat) / 5) [(3, 2), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-18 : Rat) / 5) [(3, 2), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((36 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-18 : Rat) / 5) [(3, 2), (7, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0220_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0220
        rs_R003_ueqv_R003YY_generator_26_0200_0299 =
      rs_R003_ueqv_R003YY_partial_26_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0221 : Poly :=
[
  term ((864 : Rat) / 35) [(3, 2), (11, 1), (13, 1)]
]

/-- Partial product 221 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0221 : Poly :=
[
  term ((-1728 : Rat) / 35) [(0, 1), (3, 2), (11, 1), (12, 1), (13, 1)],
  term ((864 : Rat) / 35) [(0, 2), (3, 2), (11, 1), (13, 1)],
  term ((-1728 : Rat) / 35) [(1, 1), (3, 2), (11, 1), (13, 2)],
  term ((864 : Rat) / 35) [(1, 2), (3, 2), (11, 1), (13, 1)],
  term ((1728 : Rat) / 35) [(3, 2), (6, 1), (11, 1), (12, 1), (13, 1)],
  term ((-864 : Rat) / 35) [(3, 2), (6, 2), (11, 1), (13, 1)],
  term ((1728 : Rat) / 35) [(3, 2), (7, 1), (11, 1), (13, 2)],
  term ((-864 : Rat) / 35) [(3, 2), (7, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0221_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0221
        rs_R003_ueqv_R003YY_generator_26_0200_0299 =
      rs_R003_ueqv_R003YY_partial_26_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0222 : Poly :=
[
  term ((432 : Rat) / 35) [(3, 2), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 222 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0222 : Poly :=
[
  term ((-864 : Rat) / 35) [(0, 1), (3, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((432 : Rat) / 35) [(0, 2), (3, 2), (11, 1), (13, 1), (14, 1)],
  term ((-864 : Rat) / 35) [(1, 1), (3, 2), (11, 1), (13, 2), (14, 1)],
  term ((432 : Rat) / 35) [(1, 2), (3, 2), (11, 1), (13, 1), (14, 1)],
  term ((864 : Rat) / 35) [(3, 2), (6, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-432 : Rat) / 35) [(3, 2), (6, 2), (11, 1), (13, 1), (14, 1)],
  term ((864 : Rat) / 35) [(3, 2), (7, 1), (11, 1), (13, 2), (14, 1)],
  term ((-432 : Rat) / 35) [(3, 2), (7, 2), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0222_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0222
        rs_R003_ueqv_R003YY_generator_26_0200_0299 =
      rs_R003_ueqv_R003YY_partial_26_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0223 : Poly :=
[
  term ((-144 : Rat) / 35) [(3, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 223 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0223 : Poly :=
[
  term ((288 : Rat) / 35) [(0, 1), (3, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-144 : Rat) / 35) [(0, 2), (3, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((288 : Rat) / 35) [(1, 1), (3, 2), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-144 : Rat) / 35) [(1, 2), (3, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-288 : Rat) / 35) [(3, 2), (6, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((144 : Rat) / 35) [(3, 2), (6, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-288 : Rat) / 35) [(3, 2), (7, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((144 : Rat) / 35) [(3, 2), (7, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0223_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0223
        rs_R003_ueqv_R003YY_generator_26_0200_0299 =
      rs_R003_ueqv_R003YY_partial_26_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0224 : Poly :=
[
  term ((-288 : Rat) / 35) [(3, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 224 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0224 : Poly :=
[
  term ((576 : Rat) / 35) [(0, 1), (3, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-288 : Rat) / 35) [(0, 2), (3, 2), (11, 1), (13, 1), (16, 1)],
  term ((576 : Rat) / 35) [(1, 1), (3, 2), (11, 1), (13, 2), (16, 1)],
  term ((-288 : Rat) / 35) [(1, 2), (3, 2), (11, 1), (13, 1), (16, 1)],
  term ((-576 : Rat) / 35) [(3, 2), (6, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((288 : Rat) / 35) [(3, 2), (6, 2), (11, 1), (13, 1), (16, 1)],
  term ((-576 : Rat) / 35) [(3, 2), (7, 1), (11, 1), (13, 2), (16, 1)],
  term ((288 : Rat) / 35) [(3, 2), (7, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0224_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0224
        rs_R003_ueqv_R003YY_generator_26_0200_0299 =
      rs_R003_ueqv_R003YY_partial_26_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0225 : Poly :=
[
  term ((54 : Rat) / 5) [(3, 2), (13, 1), (15, 1)]
]

/-- Partial product 225 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0225 : Poly :=
[
  term ((-108 : Rat) / 5) [(0, 1), (3, 2), (12, 1), (13, 1), (15, 1)],
  term ((54 : Rat) / 5) [(0, 2), (3, 2), (13, 1), (15, 1)],
  term ((-108 : Rat) / 5) [(1, 1), (3, 2), (13, 2), (15, 1)],
  term ((54 : Rat) / 5) [(1, 2), (3, 2), (13, 1), (15, 1)],
  term ((108 : Rat) / 5) [(3, 2), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((-54 : Rat) / 5) [(3, 2), (6, 2), (13, 1), (15, 1)],
  term ((108 : Rat) / 5) [(3, 2), (7, 1), (13, 2), (15, 1)],
  term ((-54 : Rat) / 5) [(3, 2), (7, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0225_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0225
        rs_R003_ueqv_R003YY_generator_26_0200_0299 =
      rs_R003_ueqv_R003YY_partial_26_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0226 : Poly :=
[
  term ((-6 : Rat) / 5) [(3, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 226 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0226 : Poly :=
[
  term ((12 : Rat) / 5) [(0, 1), (3, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6 : Rat) / 5) [(0, 2), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((12 : Rat) / 5) [(1, 1), (3, 2), (13, 2), (15, 1), (16, 1)],
  term ((-6 : Rat) / 5) [(1, 2), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-12 : Rat) / 5) [(3, 2), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((6 : Rat) / 5) [(3, 2), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-12 : Rat) / 5) [(3, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((6 : Rat) / 5) [(3, 2), (7, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0226_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0226
        rs_R003_ueqv_R003YY_generator_26_0200_0299 =
      rs_R003_ueqv_R003YY_partial_26_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0227 : Poly :=
[
  term ((110592 : Rat) / 7625) [(4, 1), (5, 1), (9, 1), (11, 1), (13, 1)]
]

/-- Partial product 227 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0227 : Poly :=
[
  term ((-221184 : Rat) / 7625) [(0, 1), (4, 1), (5, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((110592 : Rat) / 7625) [(0, 2), (4, 1), (5, 1), (9, 1), (11, 1), (13, 1)],
  term ((-221184 : Rat) / 7625) [(1, 1), (4, 1), (5, 1), (9, 1), (11, 1), (13, 2)],
  term ((110592 : Rat) / 7625) [(1, 2), (4, 1), (5, 1), (9, 1), (11, 1), (13, 1)],
  term ((221184 : Rat) / 7625) [(4, 1), (5, 1), (6, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((-110592 : Rat) / 7625) [(4, 1), (5, 1), (6, 2), (9, 1), (11, 1), (13, 1)],
  term ((221184 : Rat) / 7625) [(4, 1), (5, 1), (7, 1), (9, 1), (11, 1), (13, 2)],
  term ((-110592 : Rat) / 7625) [(4, 1), (5, 1), (7, 2), (9, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0227_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0227
        rs_R003_ueqv_R003YY_generator_26_0200_0299 =
      rs_R003_ueqv_R003YY_partial_26_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0228 : Poly :=
[
  term ((331776 : Rat) / 7625) [(4, 1), (5, 1), (9, 1), (13, 2)]
]

/-- Partial product 228 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0228 : Poly :=
[
  term ((-663552 : Rat) / 7625) [(0, 1), (4, 1), (5, 1), (9, 1), (12, 1), (13, 2)],
  term ((331776 : Rat) / 7625) [(0, 2), (4, 1), (5, 1), (9, 1), (13, 2)],
  term ((-663552 : Rat) / 7625) [(1, 1), (4, 1), (5, 1), (9, 1), (13, 3)],
  term ((331776 : Rat) / 7625) [(1, 2), (4, 1), (5, 1), (9, 1), (13, 2)],
  term ((663552 : Rat) / 7625) [(4, 1), (5, 1), (6, 1), (9, 1), (12, 1), (13, 2)],
  term ((-331776 : Rat) / 7625) [(4, 1), (5, 1), (6, 2), (9, 1), (13, 2)],
  term ((663552 : Rat) / 7625) [(4, 1), (5, 1), (7, 1), (9, 1), (13, 3)],
  term ((-331776 : Rat) / 7625) [(4, 1), (5, 1), (7, 2), (9, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0228_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0228
        rs_R003_ueqv_R003YY_generator_26_0200_0299 =
      rs_R003_ueqv_R003YY_partial_26_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0229 : Poly :=
[
  term ((-239616 : Rat) / 7625) [(4, 1), (5, 1), (9, 2), (13, 1)]
]

/-- Partial product 229 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0229 : Poly :=
[
  term ((479232 : Rat) / 7625) [(0, 1), (4, 1), (5, 1), (9, 2), (12, 1), (13, 1)],
  term ((-239616 : Rat) / 7625) [(0, 2), (4, 1), (5, 1), (9, 2), (13, 1)],
  term ((479232 : Rat) / 7625) [(1, 1), (4, 1), (5, 1), (9, 2), (13, 2)],
  term ((-239616 : Rat) / 7625) [(1, 2), (4, 1), (5, 1), (9, 2), (13, 1)],
  term ((-479232 : Rat) / 7625) [(4, 1), (5, 1), (6, 1), (9, 2), (12, 1), (13, 1)],
  term ((239616 : Rat) / 7625) [(4, 1), (5, 1), (6, 2), (9, 2), (13, 1)],
  term ((-479232 : Rat) / 7625) [(4, 1), (5, 1), (7, 1), (9, 2), (13, 2)],
  term ((239616 : Rat) / 7625) [(4, 1), (5, 1), (7, 2), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0229_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0229
        rs_R003_ueqv_R003YY_generator_26_0200_0299 =
      rs_R003_ueqv_R003YY_partial_26_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0230 : Poly :=
[
  term ((55296 : Rat) / 7625) [(4, 1), (5, 1), (10, 1), (13, 1)]
]

/-- Partial product 230 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0230 : Poly :=
[
  term ((-110592 : Rat) / 7625) [(0, 1), (4, 1), (5, 1), (10, 1), (12, 1), (13, 1)],
  term ((55296 : Rat) / 7625) [(0, 2), (4, 1), (5, 1), (10, 1), (13, 1)],
  term ((-110592 : Rat) / 7625) [(1, 1), (4, 1), (5, 1), (10, 1), (13, 2)],
  term ((55296 : Rat) / 7625) [(1, 2), (4, 1), (5, 1), (10, 1), (13, 1)],
  term ((110592 : Rat) / 7625) [(4, 1), (5, 1), (6, 1), (10, 1), (12, 1), (13, 1)],
  term ((-55296 : Rat) / 7625) [(4, 1), (5, 1), (6, 2), (10, 1), (13, 1)],
  term ((110592 : Rat) / 7625) [(4, 1), (5, 1), (7, 1), (10, 1), (13, 2)],
  term ((-55296 : Rat) / 7625) [(4, 1), (5, 1), (7, 2), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0230_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0230
        rs_R003_ueqv_R003YY_generator_26_0200_0299 =
      rs_R003_ueqv_R003YY_partial_26_0230 := by
  native_decide

/-- Coefficient term 231 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0231 : Poly :=
[
  term ((41472 : Rat) / 7625) [(4, 1), (5, 1), (13, 1)]
]

/-- Partial product 231 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0231 : Poly :=
[
  term ((-82944 : Rat) / 7625) [(0, 1), (4, 1), (5, 1), (12, 1), (13, 1)],
  term ((41472 : Rat) / 7625) [(0, 2), (4, 1), (5, 1), (13, 1)],
  term ((-82944 : Rat) / 7625) [(1, 1), (4, 1), (5, 1), (13, 2)],
  term ((41472 : Rat) / 7625) [(1, 2), (4, 1), (5, 1), (13, 1)],
  term ((82944 : Rat) / 7625) [(4, 1), (5, 1), (6, 1), (12, 1), (13, 1)],
  term ((-41472 : Rat) / 7625) [(4, 1), (5, 1), (6, 2), (13, 1)],
  term ((82944 : Rat) / 7625) [(4, 1), (5, 1), (7, 1), (13, 2)],
  term ((-41472 : Rat) / 7625) [(4, 1), (5, 1), (7, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 231 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0231_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0231
        rs_R003_ueqv_R003YY_generator_26_0200_0299 =
      rs_R003_ueqv_R003YY_partial_26_0231 := by
  native_decide

/-- Coefficient term 232 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0232 : Poly :=
[
  term ((-41472 : Rat) / 7625) [(4, 1), (5, 1), (13, 1), (14, 1)]
]

/-- Partial product 232 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0232 : Poly :=
[
  term ((82944 : Rat) / 7625) [(0, 1), (4, 1), (5, 1), (12, 1), (13, 1), (14, 1)],
  term ((-41472 : Rat) / 7625) [(0, 2), (4, 1), (5, 1), (13, 1), (14, 1)],
  term ((82944 : Rat) / 7625) [(1, 1), (4, 1), (5, 1), (13, 2), (14, 1)],
  term ((-41472 : Rat) / 7625) [(1, 2), (4, 1), (5, 1), (13, 1), (14, 1)],
  term ((-82944 : Rat) / 7625) [(4, 1), (5, 1), (6, 1), (12, 1), (13, 1), (14, 1)],
  term ((41472 : Rat) / 7625) [(4, 1), (5, 1), (6, 2), (13, 1), (14, 1)],
  term ((-82944 : Rat) / 7625) [(4, 1), (5, 1), (7, 1), (13, 2), (14, 1)],
  term ((41472 : Rat) / 7625) [(4, 1), (5, 1), (7, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 232 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0232_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0232
        rs_R003_ueqv_R003YY_generator_26_0200_0299 =
      rs_R003_ueqv_R003YY_partial_26_0232 := by
  native_decide

/-- Coefficient term 233 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0233 : Poly :=
[
  term ((-27648 : Rat) / 7625) [(4, 1), (7, 1), (10, 1), (13, 1)]
]

/-- Partial product 233 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0233 : Poly :=
[
  term ((55296 : Rat) / 7625) [(0, 1), (4, 1), (7, 1), (10, 1), (12, 1), (13, 1)],
  term ((-27648 : Rat) / 7625) [(0, 2), (4, 1), (7, 1), (10, 1), (13, 1)],
  term ((55296 : Rat) / 7625) [(1, 1), (4, 1), (7, 1), (10, 1), (13, 2)],
  term ((-27648 : Rat) / 7625) [(1, 2), (4, 1), (7, 1), (10, 1), (13, 1)],
  term ((-55296 : Rat) / 7625) [(4, 1), (6, 1), (7, 1), (10, 1), (12, 1), (13, 1)],
  term ((27648 : Rat) / 7625) [(4, 1), (6, 2), (7, 1), (10, 1), (13, 1)],
  term ((-55296 : Rat) / 7625) [(4, 1), (7, 2), (10, 1), (13, 2)],
  term ((27648 : Rat) / 7625) [(4, 1), (7, 3), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 233 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0233_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0233
        rs_R003_ueqv_R003YY_generator_26_0200_0299 =
      rs_R003_ueqv_R003YY_partial_26_0233 := by
  native_decide

/-- Coefficient term 234 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0234 : Poly :=
[
  term ((20736 : Rat) / 7625) [(4, 1), (7, 1), (13, 1), (14, 1)]
]

/-- Partial product 234 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0234 : Poly :=
[
  term ((-41472 : Rat) / 7625) [(0, 1), (4, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((20736 : Rat) / 7625) [(0, 2), (4, 1), (7, 1), (13, 1), (14, 1)],
  term ((-41472 : Rat) / 7625) [(1, 1), (4, 1), (7, 1), (13, 2), (14, 1)],
  term ((20736 : Rat) / 7625) [(1, 2), (4, 1), (7, 1), (13, 1), (14, 1)],
  term ((41472 : Rat) / 7625) [(4, 1), (6, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((-20736 : Rat) / 7625) [(4, 1), (6, 2), (7, 1), (13, 1), (14, 1)],
  term ((41472 : Rat) / 7625) [(4, 1), (7, 2), (13, 2), (14, 1)],
  term ((-20736 : Rat) / 7625) [(4, 1), (7, 3), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 234 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0234_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0234
        rs_R003_ueqv_R003YY_generator_26_0200_0299 =
      rs_R003_ueqv_R003YY_partial_26_0234 := by
  native_decide

/-- Coefficient term 235 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0235 : Poly :=
[
  term ((-367104 : Rat) / 53375) [(4, 1), (9, 1), (10, 1), (13, 1)]
]

/-- Partial product 235 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0235 : Poly :=
[
  term ((734208 : Rat) / 53375) [(0, 1), (4, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-367104 : Rat) / 53375) [(0, 2), (4, 1), (9, 1), (10, 1), (13, 1)],
  term ((734208 : Rat) / 53375) [(1, 1), (4, 1), (9, 1), (10, 1), (13, 2)],
  term ((-367104 : Rat) / 53375) [(1, 2), (4, 1), (9, 1), (10, 1), (13, 1)],
  term ((-734208 : Rat) / 53375) [(4, 1), (6, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((367104 : Rat) / 53375) [(4, 1), (6, 2), (9, 1), (10, 1), (13, 1)],
  term ((-734208 : Rat) / 53375) [(4, 1), (7, 1), (9, 1), (10, 1), (13, 2)],
  term ((367104 : Rat) / 53375) [(4, 1), (7, 2), (9, 1), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 235 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0235_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0235
        rs_R003_ueqv_R003YY_generator_26_0200_0299 =
      rs_R003_ueqv_R003YY_partial_26_0235 := by
  native_decide

/-- Coefficient term 236 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0236 : Poly :=
[
  term ((12672 : Rat) / 427) [(4, 1), (9, 1), (11, 1), (13, 2)]
]

/-- Partial product 236 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0236 : Poly :=
[
  term ((-25344 : Rat) / 427) [(0, 1), (4, 1), (9, 1), (11, 1), (12, 1), (13, 2)],
  term ((12672 : Rat) / 427) [(0, 2), (4, 1), (9, 1), (11, 1), (13, 2)],
  term ((-25344 : Rat) / 427) [(1, 1), (4, 1), (9, 1), (11, 1), (13, 3)],
  term ((12672 : Rat) / 427) [(1, 2), (4, 1), (9, 1), (11, 1), (13, 2)],
  term ((25344 : Rat) / 427) [(4, 1), (6, 1), (9, 1), (11, 1), (12, 1), (13, 2)],
  term ((-12672 : Rat) / 427) [(4, 1), (6, 2), (9, 1), (11, 1), (13, 2)],
  term ((25344 : Rat) / 427) [(4, 1), (7, 1), (9, 1), (11, 1), (13, 3)],
  term ((-12672 : Rat) / 427) [(4, 1), (7, 2), (9, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 236 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0236_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0236
        rs_R003_ueqv_R003YY_generator_26_0200_0299 =
      rs_R003_ueqv_R003YY_partial_26_0236 := by
  native_decide

/-- Coefficient term 237 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0237 : Poly :=
[
  term ((108096 : Rat) / 10675) [(4, 1), (9, 1), (11, 2), (13, 1)]
]

/-- Partial product 237 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0237 : Poly :=
[
  term ((-216192 : Rat) / 10675) [(0, 1), (4, 1), (9, 1), (11, 2), (12, 1), (13, 1)],
  term ((108096 : Rat) / 10675) [(0, 2), (4, 1), (9, 1), (11, 2), (13, 1)],
  term ((-216192 : Rat) / 10675) [(1, 1), (4, 1), (9, 1), (11, 2), (13, 2)],
  term ((108096 : Rat) / 10675) [(1, 2), (4, 1), (9, 1), (11, 2), (13, 1)],
  term ((216192 : Rat) / 10675) [(4, 1), (6, 1), (9, 1), (11, 2), (12, 1), (13, 1)],
  term ((-108096 : Rat) / 10675) [(4, 1), (6, 2), (9, 1), (11, 2), (13, 1)],
  term ((216192 : Rat) / 10675) [(4, 1), (7, 1), (9, 1), (11, 2), (13, 2)],
  term ((-108096 : Rat) / 10675) [(4, 1), (7, 2), (9, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 237 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0237_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0237
        rs_R003_ueqv_R003YY_generator_26_0200_0299 =
      rs_R003_ueqv_R003YY_partial_26_0237 := by
  native_decide

/-- Coefficient term 238 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0238 : Poly :=
[
  term ((-151968 : Rat) / 53375) [(4, 1), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 238 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0238 : Poly :=
[
  term ((303936 : Rat) / 53375) [(0, 1), (4, 1), (9, 1), (12, 2), (13, 1)],
  term ((-151968 : Rat) / 53375) [(0, 2), (4, 1), (9, 1), (12, 1), (13, 1)],
  term ((303936 : Rat) / 53375) [(1, 1), (4, 1), (9, 1), (12, 1), (13, 2)],
  term ((-151968 : Rat) / 53375) [(1, 2), (4, 1), (9, 1), (12, 1), (13, 1)],
  term ((-303936 : Rat) / 53375) [(4, 1), (6, 1), (9, 1), (12, 2), (13, 1)],
  term ((151968 : Rat) / 53375) [(4, 1), (6, 2), (9, 1), (12, 1), (13, 1)],
  term ((-303936 : Rat) / 53375) [(4, 1), (7, 1), (9, 1), (12, 1), (13, 2)],
  term ((151968 : Rat) / 53375) [(4, 1), (7, 2), (9, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 238 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0238_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0238
        rs_R003_ueqv_R003YY_generator_26_0200_0299 =
      rs_R003_ueqv_R003YY_partial_26_0238 := by
  native_decide

/-- Coefficient term 239 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0239 : Poly :=
[
  term ((63312 : Rat) / 53375) [(4, 1), (9, 1), (13, 1)]
]

/-- Partial product 239 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0239 : Poly :=
[
  term ((-126624 : Rat) / 53375) [(0, 1), (4, 1), (9, 1), (12, 1), (13, 1)],
  term ((63312 : Rat) / 53375) [(0, 2), (4, 1), (9, 1), (13, 1)],
  term ((-126624 : Rat) / 53375) [(1, 1), (4, 1), (9, 1), (13, 2)],
  term ((63312 : Rat) / 53375) [(1, 2), (4, 1), (9, 1), (13, 1)],
  term ((126624 : Rat) / 53375) [(4, 1), (6, 1), (9, 1), (12, 1), (13, 1)],
  term ((-63312 : Rat) / 53375) [(4, 1), (6, 2), (9, 1), (13, 1)],
  term ((126624 : Rat) / 53375) [(4, 1), (7, 1), (9, 1), (13, 2)],
  term ((-63312 : Rat) / 53375) [(4, 1), (7, 2), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 239 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0239_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0239
        rs_R003_ueqv_R003YY_generator_26_0200_0299 =
      rs_R003_ueqv_R003YY_partial_26_0239 := by
  native_decide

/-- Coefficient term 240 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0240 : Poly :=
[
  term ((-232128 : Rat) / 10675) [(4, 1), (9, 2), (11, 1), (13, 1)]
]

/-- Partial product 240 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0240 : Poly :=
[
  term ((464256 : Rat) / 10675) [(0, 1), (4, 1), (9, 2), (11, 1), (12, 1), (13, 1)],
  term ((-232128 : Rat) / 10675) [(0, 2), (4, 1), (9, 2), (11, 1), (13, 1)],
  term ((464256 : Rat) / 10675) [(1, 1), (4, 1), (9, 2), (11, 1), (13, 2)],
  term ((-232128 : Rat) / 10675) [(1, 2), (4, 1), (9, 2), (11, 1), (13, 1)],
  term ((-464256 : Rat) / 10675) [(4, 1), (6, 1), (9, 2), (11, 1), (12, 1), (13, 1)],
  term ((232128 : Rat) / 10675) [(4, 1), (6, 2), (9, 2), (11, 1), (13, 1)],
  term ((-464256 : Rat) / 10675) [(4, 1), (7, 1), (9, 2), (11, 1), (13, 2)],
  term ((232128 : Rat) / 10675) [(4, 1), (7, 2), (9, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 240 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0240_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0240
        rs_R003_ueqv_R003YY_generator_26_0200_0299 =
      rs_R003_ueqv_R003YY_partial_26_0240 := by
  native_decide

/-- Coefficient term 241 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0241 : Poly :=
[
  term ((-4992 : Rat) / 10675) [(4, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 241 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0241 : Poly :=
[
  term ((9984 : Rat) / 10675) [(0, 1), (4, 1), (11, 1), (12, 2), (13, 1)],
  term ((-4992 : Rat) / 10675) [(0, 2), (4, 1), (11, 1), (12, 1), (13, 1)],
  term ((9984 : Rat) / 10675) [(1, 1), (4, 1), (11, 1), (12, 1), (13, 2)],
  term ((-4992 : Rat) / 10675) [(1, 2), (4, 1), (11, 1), (12, 1), (13, 1)],
  term ((-9984 : Rat) / 10675) [(4, 1), (6, 1), (11, 1), (12, 2), (13, 1)],
  term ((4992 : Rat) / 10675) [(4, 1), (6, 2), (11, 1), (12, 1), (13, 1)],
  term ((-9984 : Rat) / 10675) [(4, 1), (7, 1), (11, 1), (12, 1), (13, 2)],
  term ((4992 : Rat) / 10675) [(4, 1), (7, 2), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 241 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0241_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0241
        rs_R003_ueqv_R003YY_generator_26_0200_0299 =
      rs_R003_ueqv_R003YY_partial_26_0241 := by
  native_decide

/-- Coefficient term 242 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0242 : Poly :=
[
  term ((288 : Rat) / 175) [(4, 1), (11, 1), (13, 1)]
]

/-- Partial product 242 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0242 : Poly :=
[
  term ((-576 : Rat) / 175) [(0, 1), (4, 1), (11, 1), (12, 1), (13, 1)],
  term ((288 : Rat) / 175) [(0, 2), (4, 1), (11, 1), (13, 1)],
  term ((-576 : Rat) / 175) [(1, 1), (4, 1), (11, 1), (13, 2)],
  term ((288 : Rat) / 175) [(1, 2), (4, 1), (11, 1), (13, 1)],
  term ((576 : Rat) / 175) [(4, 1), (6, 1), (11, 1), (12, 1), (13, 1)],
  term ((-288 : Rat) / 175) [(4, 1), (6, 2), (11, 1), (13, 1)],
  term ((576 : Rat) / 175) [(4, 1), (7, 1), (11, 1), (13, 2)],
  term ((-288 : Rat) / 175) [(4, 1), (7, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 242 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0242_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0242
        rs_R003_ueqv_R003YY_generator_26_0200_0299 =
      rs_R003_ueqv_R003YY_partial_26_0242 := by
  native_decide

/-- Coefficient term 243 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0243 : Poly :=
[
  term ((-10368 : Rat) / 7625) [(4, 1), (13, 1), (15, 1)]
]

/-- Partial product 243 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0243 : Poly :=
[
  term ((20736 : Rat) / 7625) [(0, 1), (4, 1), (12, 1), (13, 1), (15, 1)],
  term ((-10368 : Rat) / 7625) [(0, 2), (4, 1), (13, 1), (15, 1)],
  term ((20736 : Rat) / 7625) [(1, 1), (4, 1), (13, 2), (15, 1)],
  term ((-10368 : Rat) / 7625) [(1, 2), (4, 1), (13, 1), (15, 1)],
  term ((-20736 : Rat) / 7625) [(4, 1), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((10368 : Rat) / 7625) [(4, 1), (6, 2), (13, 1), (15, 1)],
  term ((-20736 : Rat) / 7625) [(4, 1), (7, 1), (13, 2), (15, 1)],
  term ((10368 : Rat) / 7625) [(4, 1), (7, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 243 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0243_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0243
        rs_R003_ueqv_R003YY_generator_26_0200_0299 =
      rs_R003_ueqv_R003YY_partial_26_0243 := by
  native_decide

/-- Coefficient term 244 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0244 : Poly :=
[
  term ((456816 : Rat) / 53375) [(4, 1), (13, 2)]
]

/-- Partial product 244 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0244 : Poly :=
[
  term ((-913632 : Rat) / 53375) [(0, 1), (4, 1), (12, 1), (13, 2)],
  term ((456816 : Rat) / 53375) [(0, 2), (4, 1), (13, 2)],
  term ((-913632 : Rat) / 53375) [(1, 1), (4, 1), (13, 3)],
  term ((456816 : Rat) / 53375) [(1, 2), (4, 1), (13, 2)],
  term ((913632 : Rat) / 53375) [(4, 1), (6, 1), (12, 1), (13, 2)],
  term ((-456816 : Rat) / 53375) [(4, 1), (6, 2), (13, 2)],
  term ((913632 : Rat) / 53375) [(4, 1), (7, 1), (13, 3)],
  term ((-456816 : Rat) / 53375) [(4, 1), (7, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 244 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0244_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0244
        rs_R003_ueqv_R003YY_generator_26_0200_0299 =
      rs_R003_ueqv_R003YY_partial_26_0244 := by
  native_decide

/-- Coefficient term 245 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0245 : Poly :=
[
  term ((-331776 : Rat) / 7625) [(4, 2), (9, 1), (11, 1), (13, 2)]
]

/-- Partial product 245 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0245 : Poly :=
[
  term ((663552 : Rat) / 7625) [(0, 1), (4, 2), (9, 1), (11, 1), (12, 1), (13, 2)],
  term ((-331776 : Rat) / 7625) [(0, 2), (4, 2), (9, 1), (11, 1), (13, 2)],
  term ((663552 : Rat) / 7625) [(1, 1), (4, 2), (9, 1), (11, 1), (13, 3)],
  term ((-331776 : Rat) / 7625) [(1, 2), (4, 2), (9, 1), (11, 1), (13, 2)],
  term ((-663552 : Rat) / 7625) [(4, 2), (6, 1), (9, 1), (11, 1), (12, 1), (13, 2)],
  term ((331776 : Rat) / 7625) [(4, 2), (6, 2), (9, 1), (11, 1), (13, 2)],
  term ((-663552 : Rat) / 7625) [(4, 2), (7, 1), (9, 1), (11, 1), (13, 3)],
  term ((331776 : Rat) / 7625) [(4, 2), (7, 2), (9, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 245 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0245_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0245
        rs_R003_ueqv_R003YY_generator_26_0200_0299 =
      rs_R003_ueqv_R003YY_partial_26_0245 := by
  native_decide

/-- Coefficient term 246 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0246 : Poly :=
[
  term ((-55296 : Rat) / 7625) [(4, 2), (9, 1), (11, 2), (13, 1)]
]

/-- Partial product 246 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0246 : Poly :=
[
  term ((110592 : Rat) / 7625) [(0, 1), (4, 2), (9, 1), (11, 2), (12, 1), (13, 1)],
  term ((-55296 : Rat) / 7625) [(0, 2), (4, 2), (9, 1), (11, 2), (13, 1)],
  term ((110592 : Rat) / 7625) [(1, 1), (4, 2), (9, 1), (11, 2), (13, 2)],
  term ((-55296 : Rat) / 7625) [(1, 2), (4, 2), (9, 1), (11, 2), (13, 1)],
  term ((-110592 : Rat) / 7625) [(4, 2), (6, 1), (9, 1), (11, 2), (12, 1), (13, 1)],
  term ((55296 : Rat) / 7625) [(4, 2), (6, 2), (9, 1), (11, 2), (13, 1)],
  term ((-110592 : Rat) / 7625) [(4, 2), (7, 1), (9, 1), (11, 2), (13, 2)],
  term ((55296 : Rat) / 7625) [(4, 2), (7, 2), (9, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 246 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0246_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0246
        rs_R003_ueqv_R003YY_generator_26_0200_0299 =
      rs_R003_ueqv_R003YY_partial_26_0246 := by
  native_decide

/-- Coefficient term 247 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0247 : Poly :=
[
  term ((101376 : Rat) / 7625) [(4, 2), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 247 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0247 : Poly :=
[
  term ((-202752 : Rat) / 7625) [(0, 1), (4, 2), (9, 1), (12, 2), (13, 1)],
  term ((101376 : Rat) / 7625) [(0, 2), (4, 2), (9, 1), (12, 1), (13, 1)],
  term ((-202752 : Rat) / 7625) [(1, 1), (4, 2), (9, 1), (12, 1), (13, 2)],
  term ((101376 : Rat) / 7625) [(1, 2), (4, 2), (9, 1), (12, 1), (13, 1)],
  term ((202752 : Rat) / 7625) [(4, 2), (6, 1), (9, 1), (12, 2), (13, 1)],
  term ((-101376 : Rat) / 7625) [(4, 2), (6, 2), (9, 1), (12, 1), (13, 1)],
  term ((202752 : Rat) / 7625) [(4, 2), (7, 1), (9, 1), (12, 1), (13, 2)],
  term ((-101376 : Rat) / 7625) [(4, 2), (7, 2), (9, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 247 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0247_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0247
        rs_R003_ueqv_R003YY_generator_26_0200_0299 =
      rs_R003_ueqv_R003YY_partial_26_0247 := by
  native_decide

/-- Coefficient term 248 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0248 : Poly :=
[
  term ((-50688 : Rat) / 7625) [(4, 2), (9, 1), (13, 1)]
]

/-- Partial product 248 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0248 : Poly :=
[
  term ((101376 : Rat) / 7625) [(0, 1), (4, 2), (9, 1), (12, 1), (13, 1)],
  term ((-50688 : Rat) / 7625) [(0, 2), (4, 2), (9, 1), (13, 1)],
  term ((101376 : Rat) / 7625) [(1, 1), (4, 2), (9, 1), (13, 2)],
  term ((-50688 : Rat) / 7625) [(1, 2), (4, 2), (9, 1), (13, 1)],
  term ((-101376 : Rat) / 7625) [(4, 2), (6, 1), (9, 1), (12, 1), (13, 1)],
  term ((50688 : Rat) / 7625) [(4, 2), (6, 2), (9, 1), (13, 1)],
  term ((-101376 : Rat) / 7625) [(4, 2), (7, 1), (9, 1), (13, 2)],
  term ((50688 : Rat) / 7625) [(4, 2), (7, 2), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 248 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0248_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0248
        rs_R003_ueqv_R003YY_generator_26_0200_0299 =
      rs_R003_ueqv_R003YY_partial_26_0248 := by
  native_decide

/-- Coefficient term 249 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0249 : Poly :=
[
  term ((165888 : Rat) / 7625) [(4, 2), (9, 2), (11, 1), (13, 1)]
]

/-- Partial product 249 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0249 : Poly :=
[
  term ((-331776 : Rat) / 7625) [(0, 1), (4, 2), (9, 2), (11, 1), (12, 1), (13, 1)],
  term ((165888 : Rat) / 7625) [(0, 2), (4, 2), (9, 2), (11, 1), (13, 1)],
  term ((-331776 : Rat) / 7625) [(1, 1), (4, 2), (9, 2), (11, 1), (13, 2)],
  term ((165888 : Rat) / 7625) [(1, 2), (4, 2), (9, 2), (11, 1), (13, 1)],
  term ((331776 : Rat) / 7625) [(4, 2), (6, 1), (9, 2), (11, 1), (12, 1), (13, 1)],
  term ((-165888 : Rat) / 7625) [(4, 2), (6, 2), (9, 2), (11, 1), (13, 1)],
  term ((331776 : Rat) / 7625) [(4, 2), (7, 1), (9, 2), (11, 1), (13, 2)],
  term ((-165888 : Rat) / 7625) [(4, 2), (7, 2), (9, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 249 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0249_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0249
        rs_R003_ueqv_R003YY_generator_26_0200_0299 =
      rs_R003_ueqv_R003YY_partial_26_0249 := by
  native_decide

/-- Coefficient term 250 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0250 : Poly :=
[
  term ((-110592 : Rat) / 7625) [(4, 2), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 250 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0250 : Poly :=
[
  term ((221184 : Rat) / 7625) [(0, 1), (4, 2), (11, 1), (12, 2), (13, 1)],
  term ((-110592 : Rat) / 7625) [(0, 2), (4, 2), (11, 1), (12, 1), (13, 1)],
  term ((221184 : Rat) / 7625) [(1, 1), (4, 2), (11, 1), (12, 1), (13, 2)],
  term ((-110592 : Rat) / 7625) [(1, 2), (4, 2), (11, 1), (12, 1), (13, 1)],
  term ((-221184 : Rat) / 7625) [(4, 2), (6, 1), (11, 1), (12, 2), (13, 1)],
  term ((110592 : Rat) / 7625) [(4, 2), (6, 2), (11, 1), (12, 1), (13, 1)],
  term ((-221184 : Rat) / 7625) [(4, 2), (7, 1), (11, 1), (12, 1), (13, 2)],
  term ((110592 : Rat) / 7625) [(4, 2), (7, 2), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 250 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0250_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0250
        rs_R003_ueqv_R003YY_generator_26_0200_0299 =
      rs_R003_ueqv_R003YY_partial_26_0250 := by
  native_decide

/-- Coefficient term 251 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0251 : Poly :=
[
  term ((82944 : Rat) / 7625) [(4, 2), (11, 1), (13, 1)]
]

/-- Partial product 251 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0251 : Poly :=
[
  term ((-165888 : Rat) / 7625) [(0, 1), (4, 2), (11, 1), (12, 1), (13, 1)],
  term ((82944 : Rat) / 7625) [(0, 2), (4, 2), (11, 1), (13, 1)],
  term ((-165888 : Rat) / 7625) [(1, 1), (4, 2), (11, 1), (13, 2)],
  term ((82944 : Rat) / 7625) [(1, 2), (4, 2), (11, 1), (13, 1)],
  term ((165888 : Rat) / 7625) [(4, 2), (6, 1), (11, 1), (12, 1), (13, 1)],
  term ((-82944 : Rat) / 7625) [(4, 2), (6, 2), (11, 1), (13, 1)],
  term ((165888 : Rat) / 7625) [(4, 2), (7, 1), (11, 1), (13, 2)],
  term ((-82944 : Rat) / 7625) [(4, 2), (7, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 251 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0251_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0251
        rs_R003_ueqv_R003YY_generator_26_0200_0299 =
      rs_R003_ueqv_R003YY_partial_26_0251 := by
  native_decide

/-- Coefficient term 252 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0252 : Poly :=
[
  term ((-78336 : Rat) / 7625) [(4, 2), (13, 2)]
]

/-- Partial product 252 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0252 : Poly :=
[
  term ((156672 : Rat) / 7625) [(0, 1), (4, 2), (12, 1), (13, 2)],
  term ((-78336 : Rat) / 7625) [(0, 2), (4, 2), (13, 2)],
  term ((156672 : Rat) / 7625) [(1, 1), (4, 2), (13, 3)],
  term ((-78336 : Rat) / 7625) [(1, 2), (4, 2), (13, 2)],
  term ((-156672 : Rat) / 7625) [(4, 2), (6, 1), (12, 1), (13, 2)],
  term ((78336 : Rat) / 7625) [(4, 2), (6, 2), (13, 2)],
  term ((-156672 : Rat) / 7625) [(4, 2), (7, 1), (13, 3)],
  term ((78336 : Rat) / 7625) [(4, 2), (7, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 252 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0252_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0252
        rs_R003_ueqv_R003YY_generator_26_0200_0299 =
      rs_R003_ueqv_R003YY_partial_26_0252 := by
  native_decide

/-- Coefficient term 253 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0253 : Poly :=
[
  term ((-21888 : Rat) / 7625) [(5, 1), (9, 1), (11, 1), (13, 1)]
]

/-- Partial product 253 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0253 : Poly :=
[
  term ((43776 : Rat) / 7625) [(0, 1), (5, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((-21888 : Rat) / 7625) [(0, 2), (5, 1), (9, 1), (11, 1), (13, 1)],
  term ((43776 : Rat) / 7625) [(1, 1), (5, 1), (9, 1), (11, 1), (13, 2)],
  term ((-21888 : Rat) / 7625) [(1, 2), (5, 1), (9, 1), (11, 1), (13, 1)],
  term ((-43776 : Rat) / 7625) [(5, 1), (6, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((21888 : Rat) / 7625) [(5, 1), (6, 2), (9, 1), (11, 1), (13, 1)],
  term ((-43776 : Rat) / 7625) [(5, 1), (7, 1), (9, 1), (11, 1), (13, 2)],
  term ((21888 : Rat) / 7625) [(5, 1), (7, 2), (9, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 253 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0253_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0253
        rs_R003_ueqv_R003YY_generator_26_0200_0299 =
      rs_R003_ueqv_R003YY_partial_26_0253 := by
  native_decide

/-- Coefficient term 254 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0254 : Poly :=
[
  term ((-24 : Rat) / 5) [(5, 1), (9, 1), (12, 1)]
]

/-- Partial product 254 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0254 : Poly :=
[
  term ((48 : Rat) / 5) [(0, 1), (5, 1), (9, 1), (12, 2)],
  term ((-24 : Rat) / 5) [(0, 2), (5, 1), (9, 1), (12, 1)],
  term ((48 : Rat) / 5) [(1, 1), (5, 1), (9, 1), (12, 1), (13, 1)],
  term ((-24 : Rat) / 5) [(1, 2), (5, 1), (9, 1), (12, 1)],
  term ((-48 : Rat) / 5) [(5, 1), (6, 1), (9, 1), (12, 2)],
  term ((24 : Rat) / 5) [(5, 1), (6, 2), (9, 1), (12, 1)],
  term ((-48 : Rat) / 5) [(5, 1), (7, 1), (9, 1), (12, 1), (13, 1)],
  term ((24 : Rat) / 5) [(5, 1), (7, 2), (9, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 254 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0254_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0254
        rs_R003_ueqv_R003YY_generator_26_0200_0299 =
      rs_R003_ueqv_R003YY_partial_26_0254 := by
  native_decide

/-- Coefficient term 255 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0255 : Poly :=
[
  term ((24 : Rat) / 5) [(5, 1), (9, 1), (12, 1), (14, 1)]
]

/-- Partial product 255 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0255 : Poly :=
[
  term ((-48 : Rat) / 5) [(0, 1), (5, 1), (9, 1), (12, 2), (14, 1)],
  term ((24 : Rat) / 5) [(0, 2), (5, 1), (9, 1), (12, 1), (14, 1)],
  term ((-48 : Rat) / 5) [(1, 1), (5, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((24 : Rat) / 5) [(1, 2), (5, 1), (9, 1), (12, 1), (14, 1)],
  term ((48 : Rat) / 5) [(5, 1), (6, 1), (9, 1), (12, 2), (14, 1)],
  term ((-24 : Rat) / 5) [(5, 1), (6, 2), (9, 1), (12, 1), (14, 1)],
  term ((48 : Rat) / 5) [(5, 1), (7, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-24 : Rat) / 5) [(5, 1), (7, 2), (9, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 255 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0255_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0255
        rs_R003_ueqv_R003YY_generator_26_0200_0299 =
      rs_R003_ueqv_R003YY_partial_26_0255 := by
  native_decide

/-- Coefficient term 256 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0256 : Poly :=
[
  term ((-65664 : Rat) / 7625) [(5, 1), (9, 1), (13, 2)]
]

/-- Partial product 256 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0256 : Poly :=
[
  term ((131328 : Rat) / 7625) [(0, 1), (5, 1), (9, 1), (12, 1), (13, 2)],
  term ((-65664 : Rat) / 7625) [(0, 2), (5, 1), (9, 1), (13, 2)],
  term ((131328 : Rat) / 7625) [(1, 1), (5, 1), (9, 1), (13, 3)],
  term ((-65664 : Rat) / 7625) [(1, 2), (5, 1), (9, 1), (13, 2)],
  term ((-131328 : Rat) / 7625) [(5, 1), (6, 1), (9, 1), (12, 1), (13, 2)],
  term ((65664 : Rat) / 7625) [(5, 1), (6, 2), (9, 1), (13, 2)],
  term ((-131328 : Rat) / 7625) [(5, 1), (7, 1), (9, 1), (13, 3)],
  term ((65664 : Rat) / 7625) [(5, 1), (7, 2), (9, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 256 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0256_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0256
        rs_R003_ueqv_R003YY_generator_26_0200_0299 =
      rs_R003_ueqv_R003YY_partial_26_0256 := by
  native_decide

/-- Coefficient term 257 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0257 : Poly :=
[
  term ((47424 : Rat) / 7625) [(5, 1), (9, 2), (13, 1)]
]

/-- Partial product 257 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0257 : Poly :=
[
  term ((-94848 : Rat) / 7625) [(0, 1), (5, 1), (9, 2), (12, 1), (13, 1)],
  term ((47424 : Rat) / 7625) [(0, 2), (5, 1), (9, 2), (13, 1)],
  term ((-94848 : Rat) / 7625) [(1, 1), (5, 1), (9, 2), (13, 2)],
  term ((47424 : Rat) / 7625) [(1, 2), (5, 1), (9, 2), (13, 1)],
  term ((94848 : Rat) / 7625) [(5, 1), (6, 1), (9, 2), (12, 1), (13, 1)],
  term ((-47424 : Rat) / 7625) [(5, 1), (6, 2), (9, 2), (13, 1)],
  term ((94848 : Rat) / 7625) [(5, 1), (7, 1), (9, 2), (13, 2)],
  term ((-47424 : Rat) / 7625) [(5, 1), (7, 2), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 257 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0257_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0257
        rs_R003_ueqv_R003YY_generator_26_0200_0299 =
      rs_R003_ueqv_R003YY_partial_26_0257 := by
  native_decide

/-- Coefficient term 258 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0258 : Poly :=
[
  term ((-10944 : Rat) / 7625) [(5, 1), (10, 1), (13, 1)]
]

/-- Partial product 258 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0258 : Poly :=
[
  term ((21888 : Rat) / 7625) [(0, 1), (5, 1), (10, 1), (12, 1), (13, 1)],
  term ((-10944 : Rat) / 7625) [(0, 2), (5, 1), (10, 1), (13, 1)],
  term ((21888 : Rat) / 7625) [(1, 1), (5, 1), (10, 1), (13, 2)],
  term ((-10944 : Rat) / 7625) [(1, 2), (5, 1), (10, 1), (13, 1)],
  term ((-21888 : Rat) / 7625) [(5, 1), (6, 1), (10, 1), (12, 1), (13, 1)],
  term ((10944 : Rat) / 7625) [(5, 1), (6, 2), (10, 1), (13, 1)],
  term ((-21888 : Rat) / 7625) [(5, 1), (7, 1), (10, 1), (13, 2)],
  term ((10944 : Rat) / 7625) [(5, 1), (7, 2), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 258 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0258_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0258
        rs_R003_ueqv_R003YY_generator_26_0200_0299 =
      rs_R003_ueqv_R003YY_partial_26_0258 := by
  native_decide

/-- Coefficient term 259 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0259 : Poly :=
[
  term ((41472 : Rat) / 7625) [(5, 1), (12, 1), (13, 1)]
]

/-- Partial product 259 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0259 : Poly :=
[
  term ((-82944 : Rat) / 7625) [(0, 1), (5, 1), (12, 2), (13, 1)],
  term ((41472 : Rat) / 7625) [(0, 2), (5, 1), (12, 1), (13, 1)],
  term ((-82944 : Rat) / 7625) [(1, 1), (5, 1), (12, 1), (13, 2)],
  term ((41472 : Rat) / 7625) [(1, 2), (5, 1), (12, 1), (13, 1)],
  term ((82944 : Rat) / 7625) [(5, 1), (6, 1), (12, 2), (13, 1)],
  term ((-41472 : Rat) / 7625) [(5, 1), (6, 2), (12, 1), (13, 1)],
  term ((82944 : Rat) / 7625) [(5, 1), (7, 1), (12, 1), (13, 2)],
  term ((-41472 : Rat) / 7625) [(5, 1), (7, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 259 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0259_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0259
        rs_R003_ueqv_R003YY_generator_26_0200_0299 =
      rs_R003_ueqv_R003YY_partial_26_0259 := by
  native_decide

/-- Coefficient term 260 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0260 : Poly :=
[
  term ((-41472 : Rat) / 7625) [(5, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 260 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0260 : Poly :=
[
  term ((82944 : Rat) / 7625) [(0, 1), (5, 1), (12, 2), (13, 1), (14, 1)],
  term ((-41472 : Rat) / 7625) [(0, 2), (5, 1), (12, 1), (13, 1), (14, 1)],
  term ((82944 : Rat) / 7625) [(1, 1), (5, 1), (12, 1), (13, 2), (14, 1)],
  term ((-41472 : Rat) / 7625) [(1, 2), (5, 1), (12, 1), (13, 1), (14, 1)],
  term ((-82944 : Rat) / 7625) [(5, 1), (6, 1), (12, 2), (13, 1), (14, 1)],
  term ((41472 : Rat) / 7625) [(5, 1), (6, 2), (12, 1), (13, 1), (14, 1)],
  term ((-82944 : Rat) / 7625) [(5, 1), (7, 1), (12, 1), (13, 2), (14, 1)],
  term ((41472 : Rat) / 7625) [(5, 1), (7, 2), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 260 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0260_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0260
        rs_R003_ueqv_R003YY_generator_26_0200_0299 =
      rs_R003_ueqv_R003YY_partial_26_0260 := by
  native_decide

/-- Coefficient term 261 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0261 : Poly :=
[
  term ((-11028 : Rat) / 7625) [(5, 1), (13, 1)]
]

/-- Partial product 261 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0261 : Poly :=
[
  term ((22056 : Rat) / 7625) [(0, 1), (5, 1), (12, 1), (13, 1)],
  term ((-11028 : Rat) / 7625) [(0, 2), (5, 1), (13, 1)],
  term ((22056 : Rat) / 7625) [(1, 1), (5, 1), (13, 2)],
  term ((-11028 : Rat) / 7625) [(1, 2), (5, 1), (13, 1)],
  term ((-22056 : Rat) / 7625) [(5, 1), (6, 1), (12, 1), (13, 1)],
  term ((11028 : Rat) / 7625) [(5, 1), (6, 2), (13, 1)],
  term ((-22056 : Rat) / 7625) [(5, 1), (7, 1), (13, 2)],
  term ((11028 : Rat) / 7625) [(5, 1), (7, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 261 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0261_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0261
        rs_R003_ueqv_R003YY_generator_26_0200_0299 =
      rs_R003_ueqv_R003YY_partial_26_0261 := by
  native_decide

/-- Coefficient term 262 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0262 : Poly :=
[
  term ((-8556 : Rat) / 7625) [(5, 1), (13, 1), (14, 1)]
]

/-- Partial product 262 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0262 : Poly :=
[
  term ((17112 : Rat) / 7625) [(0, 1), (5, 1), (12, 1), (13, 1), (14, 1)],
  term ((-8556 : Rat) / 7625) [(0, 2), (5, 1), (13, 1), (14, 1)],
  term ((17112 : Rat) / 7625) [(1, 1), (5, 1), (13, 2), (14, 1)],
  term ((-8556 : Rat) / 7625) [(1, 2), (5, 1), (13, 1), (14, 1)],
  term ((-17112 : Rat) / 7625) [(5, 1), (6, 1), (12, 1), (13, 1), (14, 1)],
  term ((8556 : Rat) / 7625) [(5, 1), (6, 2), (13, 1), (14, 1)],
  term ((-17112 : Rat) / 7625) [(5, 1), (7, 1), (13, 2), (14, 1)],
  term ((8556 : Rat) / 7625) [(5, 1), (7, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 262 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0262_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0262
        rs_R003_ueqv_R003YY_generator_26_0200_0299 =
      rs_R003_ueqv_R003YY_partial_26_0262 := by
  native_decide

/-- Coefficient term 263 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0263 : Poly :=
[
  term ((24 : Rat) / 5) [(5, 1), (14, 1), (15, 1)]
]

/-- Partial product 263 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0263 : Poly :=
[
  term ((-48 : Rat) / 5) [(0, 1), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((24 : Rat) / 5) [(0, 2), (5, 1), (14, 1), (15, 1)],
  term ((-48 : Rat) / 5) [(1, 1), (5, 1), (13, 1), (14, 1), (15, 1)],
  term ((24 : Rat) / 5) [(1, 2), (5, 1), (14, 1), (15, 1)],
  term ((48 : Rat) / 5) [(5, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((-24 : Rat) / 5) [(5, 1), (6, 2), (14, 1), (15, 1)],
  term ((48 : Rat) / 5) [(5, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((-24 : Rat) / 5) [(5, 1), (7, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 263 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0263_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0263
        rs_R003_ueqv_R003YY_generator_26_0200_0299 =
      rs_R003_ueqv_R003YY_partial_26_0263 := by
  native_decide

/-- Coefficient term 264 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0264 : Poly :=
[
  term ((-24 : Rat) / 5) [(5, 1), (15, 1)]
]

/-- Partial product 264 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0264 : Poly :=
[
  term ((48 : Rat) / 5) [(0, 1), (5, 1), (12, 1), (15, 1)],
  term ((-24 : Rat) / 5) [(0, 2), (5, 1), (15, 1)],
  term ((48 : Rat) / 5) [(1, 1), (5, 1), (13, 1), (15, 1)],
  term ((-24 : Rat) / 5) [(1, 2), (5, 1), (15, 1)],
  term ((-48 : Rat) / 5) [(5, 1), (6, 1), (12, 1), (15, 1)],
  term ((24 : Rat) / 5) [(5, 1), (6, 2), (15, 1)],
  term ((-48 : Rat) / 5) [(5, 1), (7, 1), (13, 1), (15, 1)],
  term ((24 : Rat) / 5) [(5, 1), (7, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 264 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0264_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0264
        rs_R003_ueqv_R003YY_generator_26_0200_0299 =
      rs_R003_ueqv_R003YY_partial_26_0264 := by
  native_decide

/-- Coefficient term 265 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0265 : Poly :=
[
  term ((-12 : Rat) / 5) [(7, 1), (9, 1)]
]

/-- Partial product 265 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0265 : Poly :=
[
  term ((24 : Rat) / 5) [(0, 1), (7, 1), (9, 1), (12, 1)],
  term ((-12 : Rat) / 5) [(0, 2), (7, 1), (9, 1)],
  term ((24 : Rat) / 5) [(1, 1), (7, 1), (9, 1), (13, 1)],
  term ((-12 : Rat) / 5) [(1, 2), (7, 1), (9, 1)],
  term ((-24 : Rat) / 5) [(6, 1), (7, 1), (9, 1), (12, 1)],
  term ((12 : Rat) / 5) [(6, 2), (7, 1), (9, 1)],
  term ((-24 : Rat) / 5) [(7, 2), (9, 1), (13, 1)],
  term ((12 : Rat) / 5) [(7, 3), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 265 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0265_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0265
        rs_R003_ueqv_R003YY_generator_26_0200_0299 =
      rs_R003_ueqv_R003YY_partial_26_0265 := by
  native_decide

/-- Coefficient term 266 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0266 : Poly :=
[
  term ((24 : Rat) / 5) [(7, 1), (9, 1), (14, 1)]
]

/-- Partial product 266 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0266 : Poly :=
[
  term ((-48 : Rat) / 5) [(0, 1), (7, 1), (9, 1), (12, 1), (14, 1)],
  term ((24 : Rat) / 5) [(0, 2), (7, 1), (9, 1), (14, 1)],
  term ((-48 : Rat) / 5) [(1, 1), (7, 1), (9, 1), (13, 1), (14, 1)],
  term ((24 : Rat) / 5) [(1, 2), (7, 1), (9, 1), (14, 1)],
  term ((48 : Rat) / 5) [(6, 1), (7, 1), (9, 1), (12, 1), (14, 1)],
  term ((-24 : Rat) / 5) [(6, 2), (7, 1), (9, 1), (14, 1)],
  term ((48 : Rat) / 5) [(7, 2), (9, 1), (13, 1), (14, 1)],
  term ((-24 : Rat) / 5) [(7, 3), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 266 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0266_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0266
        rs_R003_ueqv_R003YY_generator_26_0200_0299 =
      rs_R003_ueqv_R003YY_partial_26_0266 := by
  native_decide

/-- Coefficient term 267 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0267 : Poly :=
[
  term ((5472 : Rat) / 7625) [(7, 1), (10, 1), (13, 1)]
]

/-- Partial product 267 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0267 : Poly :=
[
  term ((-10944 : Rat) / 7625) [(0, 1), (7, 1), (10, 1), (12, 1), (13, 1)],
  term ((5472 : Rat) / 7625) [(0, 2), (7, 1), (10, 1), (13, 1)],
  term ((-10944 : Rat) / 7625) [(1, 1), (7, 1), (10, 1), (13, 2)],
  term ((5472 : Rat) / 7625) [(1, 2), (7, 1), (10, 1), (13, 1)],
  term ((10944 : Rat) / 7625) [(6, 1), (7, 1), (10, 1), (12, 1), (13, 1)],
  term ((-5472 : Rat) / 7625) [(6, 2), (7, 1), (10, 1), (13, 1)],
  term ((10944 : Rat) / 7625) [(7, 2), (10, 1), (13, 2)],
  term ((-5472 : Rat) / 7625) [(7, 3), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 267 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0267_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0267
        rs_R003_ueqv_R003YY_generator_26_0200_0299 =
      rs_R003_ueqv_R003YY_partial_26_0267 := by
  native_decide

/-- Coefficient term 268 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0268 : Poly :=
[
  term ((-20736 : Rat) / 7625) [(7, 1), (12, 1), (13, 1)]
]

/-- Partial product 268 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0268 : Poly :=
[
  term ((41472 : Rat) / 7625) [(0, 1), (7, 1), (12, 2), (13, 1)],
  term ((-20736 : Rat) / 7625) [(0, 2), (7, 1), (12, 1), (13, 1)],
  term ((41472 : Rat) / 7625) [(1, 1), (7, 1), (12, 1), (13, 2)],
  term ((-20736 : Rat) / 7625) [(1, 2), (7, 1), (12, 1), (13, 1)],
  term ((-41472 : Rat) / 7625) [(6, 1), (7, 1), (12, 2), (13, 1)],
  term ((20736 : Rat) / 7625) [(6, 2), (7, 1), (12, 1), (13, 1)],
  term ((-41472 : Rat) / 7625) [(7, 2), (12, 1), (13, 2)],
  term ((20736 : Rat) / 7625) [(7, 3), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 268 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0268_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0268
        rs_R003_ueqv_R003YY_generator_26_0200_0299 =
      rs_R003_ueqv_R003YY_partial_26_0268 := by
  native_decide

/-- Coefficient term 269 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0269 : Poly :=
[
  term ((20736 : Rat) / 7625) [(7, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 269 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0269 : Poly :=
[
  term ((-41472 : Rat) / 7625) [(0, 1), (7, 1), (12, 2), (13, 1), (14, 1)],
  term ((20736 : Rat) / 7625) [(0, 2), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((-41472 : Rat) / 7625) [(1, 1), (7, 1), (12, 1), (13, 2), (14, 1)],
  term ((20736 : Rat) / 7625) [(1, 2), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((41472 : Rat) / 7625) [(6, 1), (7, 1), (12, 2), (13, 1), (14, 1)],
  term ((-20736 : Rat) / 7625) [(6, 2), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((41472 : Rat) / 7625) [(7, 2), (12, 1), (13, 2), (14, 1)],
  term ((-20736 : Rat) / 7625) [(7, 3), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 269 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0269_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0269
        rs_R003_ueqv_R003YY_generator_26_0200_0299 =
      rs_R003_ueqv_R003YY_partial_26_0269 := by
  native_decide

/-- Coefficient term 270 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0270 : Poly :=
[
  term ((15168 : Rat) / 7625) [(7, 1), (13, 1)]
]

/-- Partial product 270 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0270 : Poly :=
[
  term ((-30336 : Rat) / 7625) [(0, 1), (7, 1), (12, 1), (13, 1)],
  term ((15168 : Rat) / 7625) [(0, 2), (7, 1), (13, 1)],
  term ((-30336 : Rat) / 7625) [(1, 1), (7, 1), (13, 2)],
  term ((15168 : Rat) / 7625) [(1, 2), (7, 1), (13, 1)],
  term ((30336 : Rat) / 7625) [(6, 1), (7, 1), (12, 1), (13, 1)],
  term ((-15168 : Rat) / 7625) [(6, 2), (7, 1), (13, 1)],
  term ((30336 : Rat) / 7625) [(7, 2), (13, 2)],
  term ((-15168 : Rat) / 7625) [(7, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 270 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0270_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0270
        rs_R003_ueqv_R003YY_generator_26_0200_0299 =
      rs_R003_ueqv_R003YY_partial_26_0270 := by
  native_decide

/-- Coefficient term 271 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0271 : Poly :=
[
  term ((-4872 : Rat) / 7625) [(7, 1), (13, 1), (14, 1)]
]

/-- Partial product 271 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0271 : Poly :=
[
  term ((9744 : Rat) / 7625) [(0, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((-4872 : Rat) / 7625) [(0, 2), (7, 1), (13, 1), (14, 1)],
  term ((9744 : Rat) / 7625) [(1, 1), (7, 1), (13, 2), (14, 1)],
  term ((-4872 : Rat) / 7625) [(1, 2), (7, 1), (13, 1), (14, 1)],
  term ((-9744 : Rat) / 7625) [(6, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((4872 : Rat) / 7625) [(6, 2), (7, 1), (13, 1), (14, 1)],
  term ((-9744 : Rat) / 7625) [(7, 2), (13, 2), (14, 1)],
  term ((4872 : Rat) / 7625) [(7, 3), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 271 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0271_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0271
        rs_R003_ueqv_R003YY_generator_26_0200_0299 =
      rs_R003_ueqv_R003YY_partial_26_0271 := by
  native_decide

/-- Coefficient term 272 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0272 : Poly :=
[
  term ((-12 : Rat) / 5) [(7, 1), (14, 1), (15, 1)]
]

/-- Partial product 272 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0272 : Poly :=
[
  term ((24 : Rat) / 5) [(0, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-12 : Rat) / 5) [(0, 2), (7, 1), (14, 1), (15, 1)],
  term ((24 : Rat) / 5) [(1, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((-12 : Rat) / 5) [(1, 2), (7, 1), (14, 1), (15, 1)],
  term ((-24 : Rat) / 5) [(6, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((12 : Rat) / 5) [(6, 2), (7, 1), (14, 1), (15, 1)],
  term ((-24 : Rat) / 5) [(7, 2), (13, 1), (14, 1), (15, 1)],
  term ((12 : Rat) / 5) [(7, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 272 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0272_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0272
        rs_R003_ueqv_R003YY_generator_26_0200_0299 =
      rs_R003_ueqv_R003YY_partial_26_0272 := by
  native_decide

/-- Coefficient term 273 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0273 : Poly :=
[
  term ((-33 : Rat) / 20) [(7, 1), (15, 1)]
]

/-- Partial product 273 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0273 : Poly :=
[
  term ((33 : Rat) / 10) [(0, 1), (7, 1), (12, 1), (15, 1)],
  term ((-33 : Rat) / 20) [(0, 2), (7, 1), (15, 1)],
  term ((33 : Rat) / 10) [(1, 1), (7, 1), (13, 1), (15, 1)],
  term ((-33 : Rat) / 20) [(1, 2), (7, 1), (15, 1)],
  term ((-33 : Rat) / 10) [(6, 1), (7, 1), (12, 1), (15, 1)],
  term ((33 : Rat) / 20) [(6, 2), (7, 1), (15, 1)],
  term ((-33 : Rat) / 10) [(7, 2), (13, 1), (15, 1)],
  term ((33 : Rat) / 20) [(7, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 273 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0273_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0273
        rs_R003_ueqv_R003YY_generator_26_0200_0299 =
      rs_R003_ueqv_R003YY_partial_26_0273 := by
  native_decide

/-- Coefficient term 274 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0274 : Poly :=
[
  term ((9 : Rat) / 20) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 274 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0274 : Poly :=
[
  term ((-9 : Rat) / 10) [(0, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((9 : Rat) / 20) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((-9 : Rat) / 10) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((9 : Rat) / 20) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((9 : Rat) / 10) [(6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-9 : Rat) / 20) [(6, 2), (7, 1), (15, 1), (16, 1)],
  term ((9 : Rat) / 10) [(7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-9 : Rat) / 20) [(7, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 274 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0274_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0274
        rs_R003_ueqv_R003YY_generator_26_0200_0299 =
      rs_R003_ueqv_R003YY_partial_26_0274 := by
  native_decide

/-- Coefficient term 275 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0275 : Poly :=
[
  term ((-5161144 : Rat) / 53375) [(9, 1), (10, 1), (13, 1)]
]

/-- Partial product 275 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0275 : Poly :=
[
  term ((10322288 : Rat) / 53375) [(0, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-5161144 : Rat) / 53375) [(0, 2), (9, 1), (10, 1), (13, 1)],
  term ((10322288 : Rat) / 53375) [(1, 1), (9, 1), (10, 1), (13, 2)],
  term ((-5161144 : Rat) / 53375) [(1, 2), (9, 1), (10, 1), (13, 1)],
  term ((-10322288 : Rat) / 53375) [(6, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((5161144 : Rat) / 53375) [(6, 2), (9, 1), (10, 1), (13, 1)],
  term ((-10322288 : Rat) / 53375) [(7, 1), (9, 1), (10, 1), (13, 2)],
  term ((5161144 : Rat) / 53375) [(7, 2), (9, 1), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 275 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0275_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0275
        rs_R003_ueqv_R003YY_generator_26_0200_0299 =
      rs_R003_ueqv_R003YY_partial_26_0275 := by
  native_decide

/-- Coefficient term 276 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0276 : Poly :=
[
  term ((4224 : Rat) / 35) [(9, 1), (10, 1), (13, 1), (14, 1)]
]

/-- Partial product 276 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0276 : Poly :=
[
  term ((-8448 : Rat) / 35) [(0, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((4224 : Rat) / 35) [(0, 2), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((-8448 : Rat) / 35) [(1, 1), (9, 1), (10, 1), (13, 2), (14, 1)],
  term ((4224 : Rat) / 35) [(1, 2), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((8448 : Rat) / 35) [(6, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((-4224 : Rat) / 35) [(6, 2), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((8448 : Rat) / 35) [(7, 1), (9, 1), (10, 1), (13, 2), (14, 1)],
  term ((-4224 : Rat) / 35) [(7, 2), (9, 1), (10, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 276 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0276_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0276
        rs_R003_ueqv_R003YY_generator_26_0200_0299 =
      rs_R003_ueqv_R003YY_partial_26_0276 := by
  native_decide

/-- Coefficient term 277 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0277 : Poly :=
[
  term ((-1408 : Rat) / 35) [(9, 1), (10, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 277 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0277 : Poly :=
[
  term ((2816 : Rat) / 35) [(0, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1408 : Rat) / 35) [(0, 2), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((2816 : Rat) / 35) [(1, 1), (9, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((-1408 : Rat) / 35) [(1, 2), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2816 : Rat) / 35) [(6, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((1408 : Rat) / 35) [(6, 2), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2816 : Rat) / 35) [(7, 1), (9, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((1408 : Rat) / 35) [(7, 2), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 277 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0277_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0277
        rs_R003_ueqv_R003YY_generator_26_0200_0299 =
      rs_R003_ueqv_R003YY_partial_26_0277 := by
  native_decide

/-- Coefficient term 278 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0278 : Poly :=
[
  term ((1144 : Rat) / 35) [(9, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 278 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0278 : Poly :=
[
  term ((-2288 : Rat) / 35) [(0, 1), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((1144 : Rat) / 35) [(0, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-2288 : Rat) / 35) [(1, 1), (9, 1), (10, 1), (13, 2), (16, 1)],
  term ((1144 : Rat) / 35) [(1, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((2288 : Rat) / 35) [(6, 1), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1144 : Rat) / 35) [(6, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((2288 : Rat) / 35) [(7, 1), (9, 1), (10, 1), (13, 2), (16, 1)],
  term ((-1144 : Rat) / 35) [(7, 2), (9, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 278 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0278_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0278
        rs_R003_ueqv_R003YY_generator_26_0200_0299 =
      rs_R003_ueqv_R003YY_partial_26_0278 := by
  native_decide

/-- Coefficient term 279 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0279 : Poly :=
[
  term ((14341 : Rat) / 210) [(9, 1), (10, 1), (15, 1)]
]

/-- Partial product 279 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0279 : Poly :=
[
  term ((-14341 : Rat) / 105) [(0, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((14341 : Rat) / 210) [(0, 2), (9, 1), (10, 1), (15, 1)],
  term ((-14341 : Rat) / 105) [(1, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((14341 : Rat) / 210) [(1, 2), (9, 1), (10, 1), (15, 1)],
  term ((14341 : Rat) / 105) [(6, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-14341 : Rat) / 210) [(6, 2), (9, 1), (10, 1), (15, 1)],
  term ((14341 : Rat) / 105) [(7, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((-14341 : Rat) / 210) [(7, 2), (9, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 279 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0279_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0279
        rs_R003_ueqv_R003YY_generator_26_0200_0299 =
      rs_R003_ueqv_R003YY_partial_26_0279 := by
  native_decide

/-- Coefficient term 280 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0280 : Poly :=
[
  term ((-479 : Rat) / 70) [(9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 280 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0280 : Poly :=
[
  term ((479 : Rat) / 35) [(0, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-479 : Rat) / 70) [(0, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((479 : Rat) / 35) [(1, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-479 : Rat) / 70) [(1, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-479 : Rat) / 35) [(6, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((479 : Rat) / 70) [(6, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-479 : Rat) / 35) [(7, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((479 : Rat) / 70) [(7, 2), (9, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 280 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0280_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0280
        rs_R003_ueqv_R003YY_generator_26_0200_0299 =
      rs_R003_ueqv_R003YY_partial_26_0280 := by
  native_decide

/-- Coefficient term 281 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0281 : Poly :=
[
  term ((-1232 : Rat) / 5) [(9, 1), (11, 1)]
]

/-- Partial product 281 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0281 : Poly :=
[
  term ((2464 : Rat) / 5) [(0, 1), (9, 1), (11, 1), (12, 1)],
  term ((-1232 : Rat) / 5) [(0, 2), (9, 1), (11, 1)],
  term ((2464 : Rat) / 5) [(1, 1), (9, 1), (11, 1), (13, 1)],
  term ((-1232 : Rat) / 5) [(1, 2), (9, 1), (11, 1)],
  term ((-2464 : Rat) / 5) [(6, 1), (9, 1), (11, 1), (12, 1)],
  term ((1232 : Rat) / 5) [(6, 2), (9, 1), (11, 1)],
  term ((-2464 : Rat) / 5) [(7, 1), (9, 1), (11, 1), (13, 1)],
  term ((1232 : Rat) / 5) [(7, 2), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 281 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0281_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0281
        rs_R003_ueqv_R003YY_generator_26_0200_0299 =
      rs_R003_ueqv_R003YY_partial_26_0281 := by
  native_decide

/-- Coefficient term 282 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0282 : Poly :=
[
  term ((-18418 : Rat) / 35) [(9, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 282 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0282 : Poly :=
[
  term ((36836 : Rat) / 35) [(0, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-18418 : Rat) / 35) [(0, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((36836 : Rat) / 35) [(1, 1), (9, 1), (11, 1), (13, 2), (15, 1)],
  term ((-18418 : Rat) / 35) [(1, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-36836 : Rat) / 35) [(6, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((18418 : Rat) / 35) [(6, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-36836 : Rat) / 35) [(7, 1), (9, 1), (11, 1), (13, 2), (15, 1)],
  term ((18418 : Rat) / 35) [(7, 2), (9, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 282 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0282_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0282
        rs_R003_ueqv_R003YY_generator_26_0200_0299 =
      rs_R003_ueqv_R003YY_partial_26_0282 := by
  native_decide

/-- Coefficient term 283 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0283 : Poly :=
[
  term ((2274 : Rat) / 35) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 283 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0283 : Poly :=
[
  term ((-4548 : Rat) / 35) [(0, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((2274 : Rat) / 35) [(0, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4548 : Rat) / 35) [(1, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((2274 : Rat) / 35) [(1, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((4548 : Rat) / 35) [(6, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2274 : Rat) / 35) [(6, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((4548 : Rat) / 35) [(7, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-2274 : Rat) / 35) [(7, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 283 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0283_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0283
        rs_R003_ueqv_R003YY_generator_26_0200_0299 =
      rs_R003_ueqv_R003YY_partial_26_0283 := by
  native_decide

/-- Coefficient term 284 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0284 : Poly :=
[
  term ((-752448 : Rat) / 875) [(9, 1), (11, 1), (13, 2)]
]

/-- Partial product 284 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0284 : Poly :=
[
  term ((1504896 : Rat) / 875) [(0, 1), (9, 1), (11, 1), (12, 1), (13, 2)],
  term ((-752448 : Rat) / 875) [(0, 2), (9, 1), (11, 1), (13, 2)],
  term ((1504896 : Rat) / 875) [(1, 1), (9, 1), (11, 1), (13, 3)],
  term ((-752448 : Rat) / 875) [(1, 2), (9, 1), (11, 1), (13, 2)],
  term ((-1504896 : Rat) / 875) [(6, 1), (9, 1), (11, 1), (12, 1), (13, 2)],
  term ((752448 : Rat) / 875) [(6, 2), (9, 1), (11, 1), (13, 2)],
  term ((-1504896 : Rat) / 875) [(7, 1), (9, 1), (11, 1), (13, 3)],
  term ((752448 : Rat) / 875) [(7, 2), (9, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 284 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0284_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0284
        rs_R003_ueqv_R003YY_generator_26_0200_0299 =
      rs_R003_ueqv_R003YY_partial_26_0284 := by
  native_decide

/-- Coefficient term 285 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0285 : Poly :=
[
  term ((36864 : Rat) / 35) [(9, 1), (11, 1), (13, 2), (14, 1)]
]

/-- Partial product 285 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0285 : Poly :=
[
  term ((-73728 : Rat) / 35) [(0, 1), (9, 1), (11, 1), (12, 1), (13, 2), (14, 1)],
  term ((36864 : Rat) / 35) [(0, 2), (9, 1), (11, 1), (13, 2), (14, 1)],
  term ((-73728 : Rat) / 35) [(1, 1), (9, 1), (11, 1), (13, 3), (14, 1)],
  term ((36864 : Rat) / 35) [(1, 2), (9, 1), (11, 1), (13, 2), (14, 1)],
  term ((73728 : Rat) / 35) [(6, 1), (9, 1), (11, 1), (12, 1), (13, 2), (14, 1)],
  term ((-36864 : Rat) / 35) [(6, 2), (9, 1), (11, 1), (13, 2), (14, 1)],
  term ((73728 : Rat) / 35) [(7, 1), (9, 1), (11, 1), (13, 3), (14, 1)],
  term ((-36864 : Rat) / 35) [(7, 2), (9, 1), (11, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 285 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0285_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0285
        rs_R003_ueqv_R003YY_generator_26_0200_0299 =
      rs_R003_ueqv_R003YY_partial_26_0285 := by
  native_decide

/-- Coefficient term 286 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0286 : Poly :=
[
  term ((-12288 : Rat) / 35) [(9, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 286 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0286 : Poly :=
[
  term ((24576 : Rat) / 35) [(0, 1), (9, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-12288 : Rat) / 35) [(0, 2), (9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((24576 : Rat) / 35) [(1, 1), (9, 1), (11, 1), (13, 3), (14, 1), (16, 1)],
  term ((-12288 : Rat) / 35) [(1, 2), (9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-24576 : Rat) / 35) [(6, 1), (9, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((12288 : Rat) / 35) [(6, 2), (9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-24576 : Rat) / 35) [(7, 1), (9, 1), (11, 1), (13, 3), (14, 1), (16, 1)],
  term ((12288 : Rat) / 35) [(7, 2), (9, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 286 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0286_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0286
        rs_R003_ueqv_R003YY_generator_26_0200_0299 =
      rs_R003_ueqv_R003YY_partial_26_0286 := by
  native_decide

/-- Coefficient term 287 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0287 : Poly :=
[
  term ((9984 : Rat) / 35) [(9, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 287 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0287 : Poly :=
[
  term ((-19968 : Rat) / 35) [(0, 1), (9, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((9984 : Rat) / 35) [(0, 2), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-19968 : Rat) / 35) [(1, 1), (9, 1), (11, 1), (13, 3), (16, 1)],
  term ((9984 : Rat) / 35) [(1, 2), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((19968 : Rat) / 35) [(6, 1), (9, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-9984 : Rat) / 35) [(6, 2), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((19968 : Rat) / 35) [(7, 1), (9, 1), (11, 1), (13, 3), (16, 1)],
  term ((-9984 : Rat) / 35) [(7, 2), (9, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 287 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0287_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0287
        rs_R003_ueqv_R003YY_generator_26_0200_0299 =
      rs_R003_ueqv_R003YY_partial_26_0287 := by
  native_decide

/-- Coefficient term 288 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0288 : Poly :=
[
  term ((1152 : Rat) / 5) [(9, 1), (11, 1), (14, 1)]
]

/-- Partial product 288 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0288 : Poly :=
[
  term ((-2304 : Rat) / 5) [(0, 1), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((1152 : Rat) / 5) [(0, 2), (9, 1), (11, 1), (14, 1)],
  term ((-2304 : Rat) / 5) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((1152 : Rat) / 5) [(1, 2), (9, 1), (11, 1), (14, 1)],
  term ((2304 : Rat) / 5) [(6, 1), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((-1152 : Rat) / 5) [(6, 2), (9, 1), (11, 1), (14, 1)],
  term ((2304 : Rat) / 5) [(7, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((-1152 : Rat) / 5) [(7, 2), (9, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 288 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0288_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0288
        rs_R003_ueqv_R003YY_generator_26_0200_0299 =
      rs_R003_ueqv_R003YY_partial_26_0288 := by
  native_decide

/-- Coefficient term 289 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0289 : Poly :=
[
  term ((-24833408 : Rat) / 53375) [(9, 1), (11, 2), (13, 1)]
]

/-- Partial product 289 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0289 : Poly :=
[
  term ((49666816 : Rat) / 53375) [(0, 1), (9, 1), (11, 2), (12, 1), (13, 1)],
  term ((-24833408 : Rat) / 53375) [(0, 2), (9, 1), (11, 2), (13, 1)],
  term ((49666816 : Rat) / 53375) [(1, 1), (9, 1), (11, 2), (13, 2)],
  term ((-24833408 : Rat) / 53375) [(1, 2), (9, 1), (11, 2), (13, 1)],
  term ((-49666816 : Rat) / 53375) [(6, 1), (9, 1), (11, 2), (12, 1), (13, 1)],
  term ((24833408 : Rat) / 53375) [(6, 2), (9, 1), (11, 2), (13, 1)],
  term ((-49666816 : Rat) / 53375) [(7, 1), (9, 1), (11, 2), (13, 2)],
  term ((24833408 : Rat) / 53375) [(7, 2), (9, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 289 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0289_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0289
        rs_R003_ueqv_R003YY_generator_26_0200_0299 =
      rs_R003_ueqv_R003YY_partial_26_0289 := by
  native_decide

/-- Coefficient term 290 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0290 : Poly :=
[
  term ((19968 : Rat) / 35) [(9, 1), (11, 2), (13, 1), (14, 1)]
]

/-- Partial product 290 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0290 : Poly :=
[
  term ((-39936 : Rat) / 35) [(0, 1), (9, 1), (11, 2), (12, 1), (13, 1), (14, 1)],
  term ((19968 : Rat) / 35) [(0, 2), (9, 1), (11, 2), (13, 1), (14, 1)],
  term ((-39936 : Rat) / 35) [(1, 1), (9, 1), (11, 2), (13, 2), (14, 1)],
  term ((19968 : Rat) / 35) [(1, 2), (9, 1), (11, 2), (13, 1), (14, 1)],
  term ((39936 : Rat) / 35) [(6, 1), (9, 1), (11, 2), (12, 1), (13, 1), (14, 1)],
  term ((-19968 : Rat) / 35) [(6, 2), (9, 1), (11, 2), (13, 1), (14, 1)],
  term ((39936 : Rat) / 35) [(7, 1), (9, 1), (11, 2), (13, 2), (14, 1)],
  term ((-19968 : Rat) / 35) [(7, 2), (9, 1), (11, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 290 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0290_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0290
        rs_R003_ueqv_R003YY_generator_26_0200_0299 =
      rs_R003_ueqv_R003YY_partial_26_0290 := by
  native_decide

/-- Coefficient term 291 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0291 : Poly :=
[
  term ((-6656 : Rat) / 35) [(9, 1), (11, 2), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 291 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0291 : Poly :=
[
  term ((13312 : Rat) / 35) [(0, 1), (9, 1), (11, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-6656 : Rat) / 35) [(0, 2), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((13312 : Rat) / 35) [(1, 1), (9, 1), (11, 2), (13, 2), (14, 1), (16, 1)],
  term ((-6656 : Rat) / 35) [(1, 2), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-13312 : Rat) / 35) [(6, 1), (9, 1), (11, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((6656 : Rat) / 35) [(6, 2), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-13312 : Rat) / 35) [(7, 1), (9, 1), (11, 2), (13, 2), (14, 1), (16, 1)],
  term ((6656 : Rat) / 35) [(7, 2), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 291 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0291_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0291
        rs_R003_ueqv_R003YY_generator_26_0200_0299 =
      rs_R003_ueqv_R003YY_partial_26_0291 := by
  native_decide

/-- Coefficient term 292 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0292 : Poly :=
[
  term ((5408 : Rat) / 35) [(9, 1), (11, 2), (13, 1), (16, 1)]
]

/-- Partial product 292 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0292 : Poly :=
[
  term ((-10816 : Rat) / 35) [(0, 1), (9, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((5408 : Rat) / 35) [(0, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-10816 : Rat) / 35) [(1, 1), (9, 1), (11, 2), (13, 2), (16, 1)],
  term ((5408 : Rat) / 35) [(1, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((10816 : Rat) / 35) [(6, 1), (9, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((-5408 : Rat) / 35) [(6, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((10816 : Rat) / 35) [(7, 1), (9, 1), (11, 2), (13, 2), (16, 1)],
  term ((-5408 : Rat) / 35) [(7, 2), (9, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 292 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0292_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0292
        rs_R003_ueqv_R003YY_generator_26_0200_0299 =
      rs_R003_ueqv_R003YY_partial_26_0292 := by
  native_decide

/-- Coefficient term 293 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0293 : Poly :=
[
  term ((-587 : Rat) / 105) [(9, 1), (11, 2), (15, 1)]
]

/-- Partial product 293 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0293 : Poly :=
[
  term ((1174 : Rat) / 105) [(0, 1), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((-587 : Rat) / 105) [(0, 2), (9, 1), (11, 2), (15, 1)],
  term ((1174 : Rat) / 105) [(1, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((-587 : Rat) / 105) [(1, 2), (9, 1), (11, 2), (15, 1)],
  term ((-1174 : Rat) / 105) [(6, 1), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((587 : Rat) / 105) [(6, 2), (9, 1), (11, 2), (15, 1)],
  term ((-1174 : Rat) / 105) [(7, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((587 : Rat) / 105) [(7, 2), (9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 293 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0293_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0293
        rs_R003_ueqv_R003YY_generator_26_0200_0299 =
      rs_R003_ueqv_R003YY_partial_26_0293 := by
  native_decide

/-- Coefficient term 294 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0294 : Poly :=
[
  term ((29 : Rat) / 7) [(9, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 294 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0294 : Poly :=
[
  term ((-58 : Rat) / 7) [(0, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((29 : Rat) / 7) [(0, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-58 : Rat) / 7) [(1, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((29 : Rat) / 7) [(1, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((58 : Rat) / 7) [(6, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-29 : Rat) / 7) [(6, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((58 : Rat) / 7) [(7, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-29 : Rat) / 7) [(7, 2), (9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 294 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0294_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0294
        rs_R003_ueqv_R003YY_generator_26_0200_0299 =
      rs_R003_ueqv_R003YY_partial_26_0294 := by
  native_decide

/-- Coefficient term 295 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0295 : Poly :=
[
  term ((-1223496 : Rat) / 53375) [(9, 1), (12, 1), (13, 1)]
]

/-- Partial product 295 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0295 : Poly :=
[
  term ((2446992 : Rat) / 53375) [(0, 1), (9, 1), (12, 2), (13, 1)],
  term ((-1223496 : Rat) / 53375) [(0, 2), (9, 1), (12, 1), (13, 1)],
  term ((2446992 : Rat) / 53375) [(1, 1), (9, 1), (12, 1), (13, 2)],
  term ((-1223496 : Rat) / 53375) [(1, 2), (9, 1), (12, 1), (13, 1)],
  term ((-2446992 : Rat) / 53375) [(6, 1), (9, 1), (12, 2), (13, 1)],
  term ((1223496 : Rat) / 53375) [(6, 2), (9, 1), (12, 1), (13, 1)],
  term ((-2446992 : Rat) / 53375) [(7, 1), (9, 1), (12, 1), (13, 2)],
  term ((1223496 : Rat) / 53375) [(7, 2), (9, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 295 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0295_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0295
        rs_R003_ueqv_R003YY_generator_26_0200_0299 =
      rs_R003_ueqv_R003YY_partial_26_0295 := by
  native_decide

/-- Coefficient term 296 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0296 : Poly :=
[
  term ((768 : Rat) / 35) [(9, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 296 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0296 : Poly :=
[
  term ((-1536 : Rat) / 35) [(0, 1), (9, 1), (12, 2), (13, 1), (14, 1)],
  term ((768 : Rat) / 35) [(0, 2), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-1536 : Rat) / 35) [(1, 1), (9, 1), (12, 1), (13, 2), (14, 1)],
  term ((768 : Rat) / 35) [(1, 2), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((1536 : Rat) / 35) [(6, 1), (9, 1), (12, 2), (13, 1), (14, 1)],
  term ((-768 : Rat) / 35) [(6, 2), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((1536 : Rat) / 35) [(7, 1), (9, 1), (12, 1), (13, 2), (14, 1)],
  term ((-768 : Rat) / 35) [(7, 2), (9, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 296 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0296_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0296
        rs_R003_ueqv_R003YY_generator_26_0200_0299 =
      rs_R003_ueqv_R003YY_partial_26_0296 := by
  native_decide

/-- Coefficient term 297 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0297 : Poly :=
[
  term ((-256 : Rat) / 35) [(9, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 297 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0297 : Poly :=
[
  term ((512 : Rat) / 35) [(0, 1), (9, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-256 : Rat) / 35) [(0, 2), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((512 : Rat) / 35) [(1, 1), (9, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-256 : Rat) / 35) [(1, 2), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-512 : Rat) / 35) [(6, 1), (9, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((256 : Rat) / 35) [(6, 2), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-512 : Rat) / 35) [(7, 1), (9, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((256 : Rat) / 35) [(7, 2), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 297 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0297_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0297
        rs_R003_ueqv_R003YY_generator_26_0200_0299 =
      rs_R003_ueqv_R003YY_partial_26_0297 := by
  native_decide

/-- Coefficient term 298 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0298 : Poly :=
[
  term ((208 : Rat) / 35) [(9, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 298 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0298 : Poly :=
[
  term ((-416 : Rat) / 35) [(0, 1), (9, 1), (12, 2), (13, 1), (16, 1)],
  term ((208 : Rat) / 35) [(0, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-416 : Rat) / 35) [(1, 1), (9, 1), (12, 1), (13, 2), (16, 1)],
  term ((208 : Rat) / 35) [(1, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((416 : Rat) / 35) [(6, 1), (9, 1), (12, 2), (13, 1), (16, 1)],
  term ((-208 : Rat) / 35) [(6, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((416 : Rat) / 35) [(7, 1), (9, 1), (12, 1), (13, 2), (16, 1)],
  term ((-208 : Rat) / 35) [(7, 2), (9, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 298 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0298_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0298
        rs_R003_ueqv_R003YY_generator_26_0200_0299 =
      rs_R003_ueqv_R003YY_partial_26_0298 := by
  native_decide

/-- Coefficient term 299 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003YY_coefficient_26_0299 : Poly :=
[
  term ((-32519 : Rat) / 350) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 299 for generator 26. -/
def rs_R003_ueqv_R003YY_partial_26_0299 : Poly :=
[
  term ((32519 : Rat) / 175) [(0, 1), (9, 1), (12, 2), (15, 1)],
  term ((-32519 : Rat) / 350) [(0, 2), (9, 1), (12, 1), (15, 1)],
  term ((32519 : Rat) / 175) [(1, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-32519 : Rat) / 350) [(1, 2), (9, 1), (12, 1), (15, 1)],
  term ((-32519 : Rat) / 175) [(6, 1), (9, 1), (12, 2), (15, 1)],
  term ((32519 : Rat) / 350) [(6, 2), (9, 1), (12, 1), (15, 1)],
  term ((-32519 : Rat) / 175) [(7, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((32519 : Rat) / 350) [(7, 2), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 299 for generator 26. -/
theorem rs_R003_ueqv_R003YY_partial_26_0299_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_26_0299
        rs_R003_ueqv_R003YY_generator_26_0200_0299 =
      rs_R003_ueqv_R003YY_partial_26_0299 := by
  native_decide

/-- Partial products in this block. -/
def rs_R003_ueqv_R003YY_partials_26_0200_0299 : List Poly :=
[
  rs_R003_ueqv_R003YY_partial_26_0200,
  rs_R003_ueqv_R003YY_partial_26_0201,
  rs_R003_ueqv_R003YY_partial_26_0202,
  rs_R003_ueqv_R003YY_partial_26_0203,
  rs_R003_ueqv_R003YY_partial_26_0204,
  rs_R003_ueqv_R003YY_partial_26_0205,
  rs_R003_ueqv_R003YY_partial_26_0206,
  rs_R003_ueqv_R003YY_partial_26_0207,
  rs_R003_ueqv_R003YY_partial_26_0208,
  rs_R003_ueqv_R003YY_partial_26_0209,
  rs_R003_ueqv_R003YY_partial_26_0210,
  rs_R003_ueqv_R003YY_partial_26_0211,
  rs_R003_ueqv_R003YY_partial_26_0212,
  rs_R003_ueqv_R003YY_partial_26_0213,
  rs_R003_ueqv_R003YY_partial_26_0214,
  rs_R003_ueqv_R003YY_partial_26_0215,
  rs_R003_ueqv_R003YY_partial_26_0216,
  rs_R003_ueqv_R003YY_partial_26_0217,
  rs_R003_ueqv_R003YY_partial_26_0218,
  rs_R003_ueqv_R003YY_partial_26_0219,
  rs_R003_ueqv_R003YY_partial_26_0220,
  rs_R003_ueqv_R003YY_partial_26_0221,
  rs_R003_ueqv_R003YY_partial_26_0222,
  rs_R003_ueqv_R003YY_partial_26_0223,
  rs_R003_ueqv_R003YY_partial_26_0224,
  rs_R003_ueqv_R003YY_partial_26_0225,
  rs_R003_ueqv_R003YY_partial_26_0226,
  rs_R003_ueqv_R003YY_partial_26_0227,
  rs_R003_ueqv_R003YY_partial_26_0228,
  rs_R003_ueqv_R003YY_partial_26_0229,
  rs_R003_ueqv_R003YY_partial_26_0230,
  rs_R003_ueqv_R003YY_partial_26_0231,
  rs_R003_ueqv_R003YY_partial_26_0232,
  rs_R003_ueqv_R003YY_partial_26_0233,
  rs_R003_ueqv_R003YY_partial_26_0234,
  rs_R003_ueqv_R003YY_partial_26_0235,
  rs_R003_ueqv_R003YY_partial_26_0236,
  rs_R003_ueqv_R003YY_partial_26_0237,
  rs_R003_ueqv_R003YY_partial_26_0238,
  rs_R003_ueqv_R003YY_partial_26_0239,
  rs_R003_ueqv_R003YY_partial_26_0240,
  rs_R003_ueqv_R003YY_partial_26_0241,
  rs_R003_ueqv_R003YY_partial_26_0242,
  rs_R003_ueqv_R003YY_partial_26_0243,
  rs_R003_ueqv_R003YY_partial_26_0244,
  rs_R003_ueqv_R003YY_partial_26_0245,
  rs_R003_ueqv_R003YY_partial_26_0246,
  rs_R003_ueqv_R003YY_partial_26_0247,
  rs_R003_ueqv_R003YY_partial_26_0248,
  rs_R003_ueqv_R003YY_partial_26_0249,
  rs_R003_ueqv_R003YY_partial_26_0250,
  rs_R003_ueqv_R003YY_partial_26_0251,
  rs_R003_ueqv_R003YY_partial_26_0252,
  rs_R003_ueqv_R003YY_partial_26_0253,
  rs_R003_ueqv_R003YY_partial_26_0254,
  rs_R003_ueqv_R003YY_partial_26_0255,
  rs_R003_ueqv_R003YY_partial_26_0256,
  rs_R003_ueqv_R003YY_partial_26_0257,
  rs_R003_ueqv_R003YY_partial_26_0258,
  rs_R003_ueqv_R003YY_partial_26_0259,
  rs_R003_ueqv_R003YY_partial_26_0260,
  rs_R003_ueqv_R003YY_partial_26_0261,
  rs_R003_ueqv_R003YY_partial_26_0262,
  rs_R003_ueqv_R003YY_partial_26_0263,
  rs_R003_ueqv_R003YY_partial_26_0264,
  rs_R003_ueqv_R003YY_partial_26_0265,
  rs_R003_ueqv_R003YY_partial_26_0266,
  rs_R003_ueqv_R003YY_partial_26_0267,
  rs_R003_ueqv_R003YY_partial_26_0268,
  rs_R003_ueqv_R003YY_partial_26_0269,
  rs_R003_ueqv_R003YY_partial_26_0270,
  rs_R003_ueqv_R003YY_partial_26_0271,
  rs_R003_ueqv_R003YY_partial_26_0272,
  rs_R003_ueqv_R003YY_partial_26_0273,
  rs_R003_ueqv_R003YY_partial_26_0274,
  rs_R003_ueqv_R003YY_partial_26_0275,
  rs_R003_ueqv_R003YY_partial_26_0276,
  rs_R003_ueqv_R003YY_partial_26_0277,
  rs_R003_ueqv_R003YY_partial_26_0278,
  rs_R003_ueqv_R003YY_partial_26_0279,
  rs_R003_ueqv_R003YY_partial_26_0280,
  rs_R003_ueqv_R003YY_partial_26_0281,
  rs_R003_ueqv_R003YY_partial_26_0282,
  rs_R003_ueqv_R003YY_partial_26_0283,
  rs_R003_ueqv_R003YY_partial_26_0284,
  rs_R003_ueqv_R003YY_partial_26_0285,
  rs_R003_ueqv_R003YY_partial_26_0286,
  rs_R003_ueqv_R003YY_partial_26_0287,
  rs_R003_ueqv_R003YY_partial_26_0288,
  rs_R003_ueqv_R003YY_partial_26_0289,
  rs_R003_ueqv_R003YY_partial_26_0290,
  rs_R003_ueqv_R003YY_partial_26_0291,
  rs_R003_ueqv_R003YY_partial_26_0292,
  rs_R003_ueqv_R003YY_partial_26_0293,
  rs_R003_ueqv_R003YY_partial_26_0294,
  rs_R003_ueqv_R003YY_partial_26_0295,
  rs_R003_ueqv_R003YY_partial_26_0296,
  rs_R003_ueqv_R003YY_partial_26_0297,
  rs_R003_ueqv_R003YY_partial_26_0298,
  rs_R003_ueqv_R003YY_partial_26_0299
]

/-- Sum of partial products in this block. -/
def rs_R003_ueqv_R003YY_block_26_0200_0299 : Poly :=
[
  term ((5616 : Rat) / 35) [(0, 1), (3, 1), (11, 1), (12, 1), (14, 1)],
  term ((-1872 : Rat) / 35) [(0, 1), (3, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-3744 : Rat) / 35) [(0, 1), (3, 1), (11, 1), (12, 1), (16, 1)],
  term ((-4512 : Rat) / 35) [(0, 1), (3, 1), (12, 1), (13, 1)],
  term ((-128 : Rat) / 35) [(0, 1), (3, 1), (12, 1), (13, 1), (14, 1)],
  term ((528 : Rat) / 35) [(0, 1), (3, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((1084 : Rat) / 35) [(0, 1), (3, 1), (12, 1), (13, 1), (16, 1)],
  term ((786 : Rat) / 25) [(0, 1), (3, 1), (12, 1), (15, 1)],
  term ((-18 : Rat) / 5) [(0, 1), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((5184 : Rat) / 35) [(0, 1), (3, 2), (9, 1), (11, 1), (12, 1)],
  term ((2592 : Rat) / 35) [(0, 1), (3, 2), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((-864 : Rat) / 35) [(0, 1), (3, 2), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1728 : Rat) / 35) [(0, 1), (3, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-3456 : Rat) / 35) [(0, 1), (3, 2), (9, 1), (11, 1), (12, 2)],
  term ((-1728 : Rat) / 35) [(0, 1), (3, 2), (9, 1), (11, 1), (12, 2), (14, 1)],
  term ((576 : Rat) / 35) [(0, 1), (3, 2), (9, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((1152 : Rat) / 35) [(0, 1), (3, 2), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((324 : Rat) / 5) [(0, 1), (3, 2), (9, 1), (12, 1), (15, 1)],
  term ((-36 : Rat) / 5) [(0, 1), (3, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-216 : Rat) / 5) [(0, 1), (3, 2), (9, 1), (12, 2), (15, 1)],
  term ((24 : Rat) / 5) [(0, 1), (3, 2), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1728 : Rat) / 35) [(0, 1), (3, 2), (11, 1), (12, 1), (13, 1)],
  term ((-864 : Rat) / 35) [(0, 1), (3, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((288 : Rat) / 35) [(0, 1), (3, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((576 : Rat) / 35) [(0, 1), (3, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-108 : Rat) / 5) [(0, 1), (3, 2), (12, 1), (13, 1), (15, 1)],
  term ((12 : Rat) / 5) [(0, 1), (3, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-221184 : Rat) / 7625) [(0, 1), (4, 1), (5, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((-663552 : Rat) / 7625) [(0, 1), (4, 1), (5, 1), (9, 1), (12, 1), (13, 2)],
  term ((479232 : Rat) / 7625) [(0, 1), (4, 1), (5, 1), (9, 2), (12, 1), (13, 1)],
  term ((-110592 : Rat) / 7625) [(0, 1), (4, 1), (5, 1), (10, 1), (12, 1), (13, 1)],
  term ((-82944 : Rat) / 7625) [(0, 1), (4, 1), (5, 1), (12, 1), (13, 1)],
  term ((82944 : Rat) / 7625) [(0, 1), (4, 1), (5, 1), (12, 1), (13, 1), (14, 1)],
  term ((55296 : Rat) / 7625) [(0, 1), (4, 1), (7, 1), (10, 1), (12, 1), (13, 1)],
  term ((-41472 : Rat) / 7625) [(0, 1), (4, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((734208 : Rat) / 53375) [(0, 1), (4, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-25344 : Rat) / 427) [(0, 1), (4, 1), (9, 1), (11, 1), (12, 1), (13, 2)],
  term ((-216192 : Rat) / 10675) [(0, 1), (4, 1), (9, 1), (11, 2), (12, 1), (13, 1)],
  term ((-126624 : Rat) / 53375) [(0, 1), (4, 1), (9, 1), (12, 1), (13, 1)],
  term ((303936 : Rat) / 53375) [(0, 1), (4, 1), (9, 1), (12, 2), (13, 1)],
  term ((464256 : Rat) / 10675) [(0, 1), (4, 1), (9, 2), (11, 1), (12, 1), (13, 1)],
  term ((-576 : Rat) / 175) [(0, 1), (4, 1), (11, 1), (12, 1), (13, 1)],
  term ((9984 : Rat) / 10675) [(0, 1), (4, 1), (11, 1), (12, 2), (13, 1)],
  term ((20736 : Rat) / 7625) [(0, 1), (4, 1), (12, 1), (13, 1), (15, 1)],
  term ((-913632 : Rat) / 53375) [(0, 1), (4, 1), (12, 1), (13, 2)],
  term ((663552 : Rat) / 7625) [(0, 1), (4, 2), (9, 1), (11, 1), (12, 1), (13, 2)],
  term ((110592 : Rat) / 7625) [(0, 1), (4, 2), (9, 1), (11, 2), (12, 1), (13, 1)],
  term ((101376 : Rat) / 7625) [(0, 1), (4, 2), (9, 1), (12, 1), (13, 1)],
  term ((-202752 : Rat) / 7625) [(0, 1), (4, 2), (9, 1), (12, 2), (13, 1)],
  term ((-331776 : Rat) / 7625) [(0, 1), (4, 2), (9, 2), (11, 1), (12, 1), (13, 1)],
  term ((-165888 : Rat) / 7625) [(0, 1), (4, 2), (11, 1), (12, 1), (13, 1)],
  term ((221184 : Rat) / 7625) [(0, 1), (4, 2), (11, 1), (12, 2), (13, 1)],
  term ((156672 : Rat) / 7625) [(0, 1), (4, 2), (12, 1), (13, 2)],
  term ((43776 : Rat) / 7625) [(0, 1), (5, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((131328 : Rat) / 7625) [(0, 1), (5, 1), (9, 1), (12, 1), (13, 2)],
  term ((48 : Rat) / 5) [(0, 1), (5, 1), (9, 1), (12, 2)],
  term ((-48 : Rat) / 5) [(0, 1), (5, 1), (9, 1), (12, 2), (14, 1)],
  term ((-94848 : Rat) / 7625) [(0, 1), (5, 1), (9, 2), (12, 1), (13, 1)],
  term ((21888 : Rat) / 7625) [(0, 1), (5, 1), (10, 1), (12, 1), (13, 1)],
  term ((22056 : Rat) / 7625) [(0, 1), (5, 1), (12, 1), (13, 1)],
  term ((17112 : Rat) / 7625) [(0, 1), (5, 1), (12, 1), (13, 1), (14, 1)],
  term ((-48 : Rat) / 5) [(0, 1), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((48 : Rat) / 5) [(0, 1), (5, 1), (12, 1), (15, 1)],
  term ((-82944 : Rat) / 7625) [(0, 1), (5, 1), (12, 2), (13, 1)],
  term ((82944 : Rat) / 7625) [(0, 1), (5, 1), (12, 2), (13, 1), (14, 1)],
  term ((24 : Rat) / 5) [(0, 1), (7, 1), (9, 1), (12, 1)],
  term ((-48 : Rat) / 5) [(0, 1), (7, 1), (9, 1), (12, 1), (14, 1)],
  term ((-10944 : Rat) / 7625) [(0, 1), (7, 1), (10, 1), (12, 1), (13, 1)],
  term ((-30336 : Rat) / 7625) [(0, 1), (7, 1), (12, 1), (13, 1)],
  term ((9744 : Rat) / 7625) [(0, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((24 : Rat) / 5) [(0, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((33 : Rat) / 10) [(0, 1), (7, 1), (12, 1), (15, 1)],
  term ((-9 : Rat) / 10) [(0, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((41472 : Rat) / 7625) [(0, 1), (7, 1), (12, 2), (13, 1)],
  term ((-41472 : Rat) / 7625) [(0, 1), (7, 1), (12, 2), (13, 1), (14, 1)],
  term ((10322288 : Rat) / 53375) [(0, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-8448 : Rat) / 35) [(0, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((2816 : Rat) / 35) [(0, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2288 : Rat) / 35) [(0, 1), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-14341 : Rat) / 105) [(0, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((479 : Rat) / 35) [(0, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((2464 : Rat) / 5) [(0, 1), (9, 1), (11, 1), (12, 1)],
  term ((36836 : Rat) / 35) [(0, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-4548 : Rat) / 35) [(0, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1504896 : Rat) / 875) [(0, 1), (9, 1), (11, 1), (12, 1), (13, 2)],
  term ((-73728 : Rat) / 35) [(0, 1), (9, 1), (11, 1), (12, 1), (13, 2), (14, 1)],
  term ((24576 : Rat) / 35) [(0, 1), (9, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-19968 : Rat) / 35) [(0, 1), (9, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-2304 : Rat) / 5) [(0, 1), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((49666816 : Rat) / 53375) [(0, 1), (9, 1), (11, 2), (12, 1), (13, 1)],
  term ((-39936 : Rat) / 35) [(0, 1), (9, 1), (11, 2), (12, 1), (13, 1), (14, 1)],
  term ((13312 : Rat) / 35) [(0, 1), (9, 1), (11, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-10816 : Rat) / 35) [(0, 1), (9, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((1174 : Rat) / 105) [(0, 1), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((-58 : Rat) / 7) [(0, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((2446992 : Rat) / 53375) [(0, 1), (9, 1), (12, 2), (13, 1)],
  term ((-1536 : Rat) / 35) [(0, 1), (9, 1), (12, 2), (13, 1), (14, 1)],
  term ((512 : Rat) / 35) [(0, 1), (9, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-416 : Rat) / 35) [(0, 1), (9, 1), (12, 2), (13, 1), (16, 1)],
  term ((32519 : Rat) / 175) [(0, 1), (9, 1), (12, 2), (15, 1)],
  term ((-2808 : Rat) / 35) [(0, 2), (3, 1), (11, 1), (14, 1)],
  term ((936 : Rat) / 35) [(0, 2), (3, 1), (11, 1), (14, 1), (16, 1)],
  term ((1872 : Rat) / 35) [(0, 2), (3, 1), (11, 1), (16, 1)],
  term ((2256 : Rat) / 35) [(0, 2), (3, 1), (13, 1)],
  term ((64 : Rat) / 35) [(0, 2), (3, 1), (13, 1), (14, 1)],
  term ((-264 : Rat) / 35) [(0, 2), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((-542 : Rat) / 35) [(0, 2), (3, 1), (13, 1), (16, 1)],
  term ((-393 : Rat) / 25) [(0, 2), (3, 1), (15, 1)],
  term ((9 : Rat) / 5) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((-2592 : Rat) / 35) [(0, 2), (3, 2), (9, 1), (11, 1)],
  term ((1728 : Rat) / 35) [(0, 2), (3, 2), (9, 1), (11, 1), (12, 1)],
  term ((864 : Rat) / 35) [(0, 2), (3, 2), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((-288 : Rat) / 35) [(0, 2), (3, 2), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-576 : Rat) / 35) [(0, 2), (3, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-1296 : Rat) / 35) [(0, 2), (3, 2), (9, 1), (11, 1), (14, 1)],
  term ((432 : Rat) / 35) [(0, 2), (3, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((864 : Rat) / 35) [(0, 2), (3, 2), (9, 1), (11, 1), (16, 1)],
  term ((108 : Rat) / 5) [(0, 2), (3, 2), (9, 1), (12, 1), (15, 1)],
  term ((-12 : Rat) / 5) [(0, 2), (3, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-162 : Rat) / 5) [(0, 2), (3, 2), (9, 1), (15, 1)],
  term ((18 : Rat) / 5) [(0, 2), (3, 2), (9, 1), (15, 1), (16, 1)],
  term ((864 : Rat) / 35) [(0, 2), (3, 2), (11, 1), (13, 1)],
  term ((432 : Rat) / 35) [(0, 2), (3, 2), (11, 1), (13, 1), (14, 1)],
  term ((-144 : Rat) / 35) [(0, 2), (3, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-288 : Rat) / 35) [(0, 2), (3, 2), (11, 1), (13, 1), (16, 1)],
  term ((54 : Rat) / 5) [(0, 2), (3, 2), (13, 1), (15, 1)],
  term ((-6 : Rat) / 5) [(0, 2), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((110592 : Rat) / 7625) [(0, 2), (4, 1), (5, 1), (9, 1), (11, 1), (13, 1)],
  term ((331776 : Rat) / 7625) [(0, 2), (4, 1), (5, 1), (9, 1), (13, 2)],
  term ((-239616 : Rat) / 7625) [(0, 2), (4, 1), (5, 1), (9, 2), (13, 1)],
  term ((55296 : Rat) / 7625) [(0, 2), (4, 1), (5, 1), (10, 1), (13, 1)],
  term ((41472 : Rat) / 7625) [(0, 2), (4, 1), (5, 1), (13, 1)],
  term ((-41472 : Rat) / 7625) [(0, 2), (4, 1), (5, 1), (13, 1), (14, 1)],
  term ((-27648 : Rat) / 7625) [(0, 2), (4, 1), (7, 1), (10, 1), (13, 1)],
  term ((20736 : Rat) / 7625) [(0, 2), (4, 1), (7, 1), (13, 1), (14, 1)],
  term ((-367104 : Rat) / 53375) [(0, 2), (4, 1), (9, 1), (10, 1), (13, 1)],
  term ((12672 : Rat) / 427) [(0, 2), (4, 1), (9, 1), (11, 1), (13, 2)],
  term ((108096 : Rat) / 10675) [(0, 2), (4, 1), (9, 1), (11, 2), (13, 1)],
  term ((-151968 : Rat) / 53375) [(0, 2), (4, 1), (9, 1), (12, 1), (13, 1)],
  term ((63312 : Rat) / 53375) [(0, 2), (4, 1), (9, 1), (13, 1)],
  term ((-232128 : Rat) / 10675) [(0, 2), (4, 1), (9, 2), (11, 1), (13, 1)],
  term ((-4992 : Rat) / 10675) [(0, 2), (4, 1), (11, 1), (12, 1), (13, 1)],
  term ((288 : Rat) / 175) [(0, 2), (4, 1), (11, 1), (13, 1)],
  term ((-10368 : Rat) / 7625) [(0, 2), (4, 1), (13, 1), (15, 1)],
  term ((456816 : Rat) / 53375) [(0, 2), (4, 1), (13, 2)],
  term ((-331776 : Rat) / 7625) [(0, 2), (4, 2), (9, 1), (11, 1), (13, 2)],
  term ((-55296 : Rat) / 7625) [(0, 2), (4, 2), (9, 1), (11, 2), (13, 1)],
  term ((101376 : Rat) / 7625) [(0, 2), (4, 2), (9, 1), (12, 1), (13, 1)],
  term ((-50688 : Rat) / 7625) [(0, 2), (4, 2), (9, 1), (13, 1)],
  term ((165888 : Rat) / 7625) [(0, 2), (4, 2), (9, 2), (11, 1), (13, 1)],
  term ((-110592 : Rat) / 7625) [(0, 2), (4, 2), (11, 1), (12, 1), (13, 1)],
  term ((82944 : Rat) / 7625) [(0, 2), (4, 2), (11, 1), (13, 1)],
  term ((-78336 : Rat) / 7625) [(0, 2), (4, 2), (13, 2)],
  term ((-21888 : Rat) / 7625) [(0, 2), (5, 1), (9, 1), (11, 1), (13, 1)],
  term ((-24 : Rat) / 5) [(0, 2), (5, 1), (9, 1), (12, 1)],
  term ((24 : Rat) / 5) [(0, 2), (5, 1), (9, 1), (12, 1), (14, 1)],
  term ((-65664 : Rat) / 7625) [(0, 2), (5, 1), (9, 1), (13, 2)],
  term ((47424 : Rat) / 7625) [(0, 2), (5, 1), (9, 2), (13, 1)],
  term ((-10944 : Rat) / 7625) [(0, 2), (5, 1), (10, 1), (13, 1)],
  term ((41472 : Rat) / 7625) [(0, 2), (5, 1), (12, 1), (13, 1)],
  term ((-41472 : Rat) / 7625) [(0, 2), (5, 1), (12, 1), (13, 1), (14, 1)],
  term ((-11028 : Rat) / 7625) [(0, 2), (5, 1), (13, 1)],
  term ((-8556 : Rat) / 7625) [(0, 2), (5, 1), (13, 1), (14, 1)],
  term ((24 : Rat) / 5) [(0, 2), (5, 1), (14, 1), (15, 1)],
  term ((-24 : Rat) / 5) [(0, 2), (5, 1), (15, 1)],
  term ((-12 : Rat) / 5) [(0, 2), (7, 1), (9, 1)],
  term ((24 : Rat) / 5) [(0, 2), (7, 1), (9, 1), (14, 1)],
  term ((5472 : Rat) / 7625) [(0, 2), (7, 1), (10, 1), (13, 1)],
  term ((-20736 : Rat) / 7625) [(0, 2), (7, 1), (12, 1), (13, 1)],
  term ((20736 : Rat) / 7625) [(0, 2), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((15168 : Rat) / 7625) [(0, 2), (7, 1), (13, 1)],
  term ((-4872 : Rat) / 7625) [(0, 2), (7, 1), (13, 1), (14, 1)],
  term ((-12 : Rat) / 5) [(0, 2), (7, 1), (14, 1), (15, 1)],
  term ((-33 : Rat) / 20) [(0, 2), (7, 1), (15, 1)],
  term ((9 : Rat) / 20) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((-5161144 : Rat) / 53375) [(0, 2), (9, 1), (10, 1), (13, 1)],
  term ((4224 : Rat) / 35) [(0, 2), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((-1408 : Rat) / 35) [(0, 2), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((1144 : Rat) / 35) [(0, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((14341 : Rat) / 210) [(0, 2), (9, 1), (10, 1), (15, 1)],
  term ((-479 : Rat) / 70) [(0, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1232 : Rat) / 5) [(0, 2), (9, 1), (11, 1)],
  term ((-18418 : Rat) / 35) [(0, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((2274 : Rat) / 35) [(0, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-752448 : Rat) / 875) [(0, 2), (9, 1), (11, 1), (13, 2)],
  term ((36864 : Rat) / 35) [(0, 2), (9, 1), (11, 1), (13, 2), (14, 1)],
  term ((-12288 : Rat) / 35) [(0, 2), (9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((9984 : Rat) / 35) [(0, 2), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((1152 : Rat) / 5) [(0, 2), (9, 1), (11, 1), (14, 1)],
  term ((-24833408 : Rat) / 53375) [(0, 2), (9, 1), (11, 2), (13, 1)],
  term ((19968 : Rat) / 35) [(0, 2), (9, 1), (11, 2), (13, 1), (14, 1)],
  term ((-6656 : Rat) / 35) [(0, 2), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((5408 : Rat) / 35) [(0, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-587 : Rat) / 105) [(0, 2), (9, 1), (11, 2), (15, 1)],
  term ((29 : Rat) / 7) [(0, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-1223496 : Rat) / 53375) [(0, 2), (9, 1), (12, 1), (13, 1)],
  term ((768 : Rat) / 35) [(0, 2), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-256 : Rat) / 35) [(0, 2), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((208 : Rat) / 35) [(0, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-32519 : Rat) / 350) [(0, 2), (9, 1), (12, 1), (15, 1)],
  term ((5616 : Rat) / 35) [(1, 1), (3, 1), (11, 1), (13, 1), (14, 1)],
  term ((-1872 : Rat) / 35) [(1, 1), (3, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3744 : Rat) / 35) [(1, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((786 : Rat) / 25) [(1, 1), (3, 1), (13, 1), (15, 1)],
  term ((-18 : Rat) / 5) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4512 : Rat) / 35) [(1, 1), (3, 1), (13, 2)],
  term ((-128 : Rat) / 35) [(1, 1), (3, 1), (13, 2), (14, 1)],
  term ((528 : Rat) / 35) [(1, 1), (3, 1), (13, 2), (14, 1), (16, 1)],
  term ((1084 : Rat) / 35) [(1, 1), (3, 1), (13, 2), (16, 1)],
  term ((-3456 : Rat) / 35) [(1, 1), (3, 2), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((-1728 : Rat) / 35) [(1, 1), (3, 2), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((576 : Rat) / 35) [(1, 1), (3, 2), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((1152 : Rat) / 35) [(1, 1), (3, 2), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((5184 : Rat) / 35) [(1, 1), (3, 2), (9, 1), (11, 1), (13, 1)],
  term ((2592 : Rat) / 35) [(1, 1), (3, 2), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((-864 : Rat) / 35) [(1, 1), (3, 2), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1728 : Rat) / 35) [(1, 1), (3, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-216 : Rat) / 5) [(1, 1), (3, 2), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((24 : Rat) / 5) [(1, 1), (3, 2), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((324 : Rat) / 5) [(1, 1), (3, 2), (9, 1), (13, 1), (15, 1)],
  term ((-36 : Rat) / 5) [(1, 1), (3, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1728 : Rat) / 35) [(1, 1), (3, 2), (11, 1), (13, 2)],
  term ((-864 : Rat) / 35) [(1, 1), (3, 2), (11, 1), (13, 2), (14, 1)],
  term ((288 : Rat) / 35) [(1, 1), (3, 2), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((576 : Rat) / 35) [(1, 1), (3, 2), (11, 1), (13, 2), (16, 1)],
  term ((-108 : Rat) / 5) [(1, 1), (3, 2), (13, 2), (15, 1)],
  term ((12 : Rat) / 5) [(1, 1), (3, 2), (13, 2), (15, 1), (16, 1)],
  term ((-221184 : Rat) / 7625) [(1, 1), (4, 1), (5, 1), (9, 1), (11, 1), (13, 2)],
  term ((-663552 : Rat) / 7625) [(1, 1), (4, 1), (5, 1), (9, 1), (13, 3)],
  term ((479232 : Rat) / 7625) [(1, 1), (4, 1), (5, 1), (9, 2), (13, 2)],
  term ((-110592 : Rat) / 7625) [(1, 1), (4, 1), (5, 1), (10, 1), (13, 2)],
  term ((-82944 : Rat) / 7625) [(1, 1), (4, 1), (5, 1), (13, 2)],
  term ((82944 : Rat) / 7625) [(1, 1), (4, 1), (5, 1), (13, 2), (14, 1)],
  term ((55296 : Rat) / 7625) [(1, 1), (4, 1), (7, 1), (10, 1), (13, 2)],
  term ((-41472 : Rat) / 7625) [(1, 1), (4, 1), (7, 1), (13, 2), (14, 1)],
  term ((734208 : Rat) / 53375) [(1, 1), (4, 1), (9, 1), (10, 1), (13, 2)],
  term ((-25344 : Rat) / 427) [(1, 1), (4, 1), (9, 1), (11, 1), (13, 3)],
  term ((-216192 : Rat) / 10675) [(1, 1), (4, 1), (9, 1), (11, 2), (13, 2)],
  term ((303936 : Rat) / 53375) [(1, 1), (4, 1), (9, 1), (12, 1), (13, 2)],
  term ((-126624 : Rat) / 53375) [(1, 1), (4, 1), (9, 1), (13, 2)],
  term ((464256 : Rat) / 10675) [(1, 1), (4, 1), (9, 2), (11, 1), (13, 2)],
  term ((9984 : Rat) / 10675) [(1, 1), (4, 1), (11, 1), (12, 1), (13, 2)],
  term ((-576 : Rat) / 175) [(1, 1), (4, 1), (11, 1), (13, 2)],
  term ((20736 : Rat) / 7625) [(1, 1), (4, 1), (13, 2), (15, 1)],
  term ((-913632 : Rat) / 53375) [(1, 1), (4, 1), (13, 3)],
  term ((663552 : Rat) / 7625) [(1, 1), (4, 2), (9, 1), (11, 1), (13, 3)],
  term ((110592 : Rat) / 7625) [(1, 1), (4, 2), (9, 1), (11, 2), (13, 2)],
  term ((-202752 : Rat) / 7625) [(1, 1), (4, 2), (9, 1), (12, 1), (13, 2)],
  term ((101376 : Rat) / 7625) [(1, 1), (4, 2), (9, 1), (13, 2)],
  term ((-331776 : Rat) / 7625) [(1, 1), (4, 2), (9, 2), (11, 1), (13, 2)],
  term ((221184 : Rat) / 7625) [(1, 1), (4, 2), (11, 1), (12, 1), (13, 2)],
  term ((-165888 : Rat) / 7625) [(1, 1), (4, 2), (11, 1), (13, 2)],
  term ((156672 : Rat) / 7625) [(1, 1), (4, 2), (13, 3)],
  term ((43776 : Rat) / 7625) [(1, 1), (5, 1), (9, 1), (11, 1), (13, 2)],
  term ((48 : Rat) / 5) [(1, 1), (5, 1), (9, 1), (12, 1), (13, 1)],
  term ((-48 : Rat) / 5) [(1, 1), (5, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((131328 : Rat) / 7625) [(1, 1), (5, 1), (9, 1), (13, 3)],
  term ((-94848 : Rat) / 7625) [(1, 1), (5, 1), (9, 2), (13, 2)],
  term ((21888 : Rat) / 7625) [(1, 1), (5, 1), (10, 1), (13, 2)],
  term ((-82944 : Rat) / 7625) [(1, 1), (5, 1), (12, 1), (13, 2)],
  term ((82944 : Rat) / 7625) [(1, 1), (5, 1), (12, 1), (13, 2), (14, 1)],
  term ((-48 : Rat) / 5) [(1, 1), (5, 1), (13, 1), (14, 1), (15, 1)],
  term ((48 : Rat) / 5) [(1, 1), (5, 1), (13, 1), (15, 1)],
  term ((22056 : Rat) / 7625) [(1, 1), (5, 1), (13, 2)],
  term ((17112 : Rat) / 7625) [(1, 1), (5, 1), (13, 2), (14, 1)],
  term ((24 : Rat) / 5) [(1, 1), (7, 1), (9, 1), (13, 1)],
  term ((-48 : Rat) / 5) [(1, 1), (7, 1), (9, 1), (13, 1), (14, 1)],
  term ((-10944 : Rat) / 7625) [(1, 1), (7, 1), (10, 1), (13, 2)],
  term ((41472 : Rat) / 7625) [(1, 1), (7, 1), (12, 1), (13, 2)],
  term ((-41472 : Rat) / 7625) [(1, 1), (7, 1), (12, 1), (13, 2), (14, 1)],
  term ((24 : Rat) / 5) [(1, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((33 : Rat) / 10) [(1, 1), (7, 1), (13, 1), (15, 1)],
  term ((-9 : Rat) / 10) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-30336 : Rat) / 7625) [(1, 1), (7, 1), (13, 2)],
  term ((9744 : Rat) / 7625) [(1, 1), (7, 1), (13, 2), (14, 1)],
  term ((-14341 : Rat) / 105) [(1, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((479 : Rat) / 35) [(1, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((10322288 : Rat) / 53375) [(1, 1), (9, 1), (10, 1), (13, 2)],
  term ((-8448 : Rat) / 35) [(1, 1), (9, 1), (10, 1), (13, 2), (14, 1)],
  term ((2816 : Rat) / 35) [(1, 1), (9, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((-2288 : Rat) / 35) [(1, 1), (9, 1), (10, 1), (13, 2), (16, 1)],
  term ((2464 : Rat) / 5) [(1, 1), (9, 1), (11, 1), (13, 1)],
  term ((-2304 : Rat) / 5) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((36836 : Rat) / 35) [(1, 1), (9, 1), (11, 1), (13, 2), (15, 1)],
  term ((-4548 : Rat) / 35) [(1, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((1504896 : Rat) / 875) [(1, 1), (9, 1), (11, 1), (13, 3)],
  term ((-73728 : Rat) / 35) [(1, 1), (9, 1), (11, 1), (13, 3), (14, 1)],
  term ((24576 : Rat) / 35) [(1, 1), (9, 1), (11, 1), (13, 3), (14, 1), (16, 1)],
  term ((-19968 : Rat) / 35) [(1, 1), (9, 1), (11, 1), (13, 3), (16, 1)],
  term ((1174 : Rat) / 105) [(1, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((-58 : Rat) / 7) [(1, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((49666816 : Rat) / 53375) [(1, 1), (9, 1), (11, 2), (13, 2)],
  term ((-39936 : Rat) / 35) [(1, 1), (9, 1), (11, 2), (13, 2), (14, 1)],
  term ((13312 : Rat) / 35) [(1, 1), (9, 1), (11, 2), (13, 2), (14, 1), (16, 1)],
  term ((-10816 : Rat) / 35) [(1, 1), (9, 1), (11, 2), (13, 2), (16, 1)],
  term ((32519 : Rat) / 175) [(1, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((2446992 : Rat) / 53375) [(1, 1), (9, 1), (12, 1), (13, 2)],
  term ((-1536 : Rat) / 35) [(1, 1), (9, 1), (12, 1), (13, 2), (14, 1)],
  term ((512 : Rat) / 35) [(1, 1), (9, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-416 : Rat) / 35) [(1, 1), (9, 1), (12, 1), (13, 2), (16, 1)],
  term ((-2808 : Rat) / 35) [(1, 2), (3, 1), (11, 1), (14, 1)],
  term ((936 : Rat) / 35) [(1, 2), (3, 1), (11, 1), (14, 1), (16, 1)],
  term ((1872 : Rat) / 35) [(1, 2), (3, 1), (11, 1), (16, 1)],
  term ((2256 : Rat) / 35) [(1, 2), (3, 1), (13, 1)],
  term ((64 : Rat) / 35) [(1, 2), (3, 1), (13, 1), (14, 1)],
  term ((-264 : Rat) / 35) [(1, 2), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((-542 : Rat) / 35) [(1, 2), (3, 1), (13, 1), (16, 1)],
  term ((-393 : Rat) / 25) [(1, 2), (3, 1), (15, 1)],
  term ((9 : Rat) / 5) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((-2592 : Rat) / 35) [(1, 2), (3, 2), (9, 1), (11, 1)],
  term ((1728 : Rat) / 35) [(1, 2), (3, 2), (9, 1), (11, 1), (12, 1)],
  term ((864 : Rat) / 35) [(1, 2), (3, 2), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((-288 : Rat) / 35) [(1, 2), (3, 2), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-576 : Rat) / 35) [(1, 2), (3, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-1296 : Rat) / 35) [(1, 2), (3, 2), (9, 1), (11, 1), (14, 1)],
  term ((432 : Rat) / 35) [(1, 2), (3, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((864 : Rat) / 35) [(1, 2), (3, 2), (9, 1), (11, 1), (16, 1)],
  term ((108 : Rat) / 5) [(1, 2), (3, 2), (9, 1), (12, 1), (15, 1)],
  term ((-12 : Rat) / 5) [(1, 2), (3, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-162 : Rat) / 5) [(1, 2), (3, 2), (9, 1), (15, 1)],
  term ((18 : Rat) / 5) [(1, 2), (3, 2), (9, 1), (15, 1), (16, 1)],
  term ((864 : Rat) / 35) [(1, 2), (3, 2), (11, 1), (13, 1)],
  term ((432 : Rat) / 35) [(1, 2), (3, 2), (11, 1), (13, 1), (14, 1)],
  term ((-144 : Rat) / 35) [(1, 2), (3, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-288 : Rat) / 35) [(1, 2), (3, 2), (11, 1), (13, 1), (16, 1)],
  term ((54 : Rat) / 5) [(1, 2), (3, 2), (13, 1), (15, 1)],
  term ((-6 : Rat) / 5) [(1, 2), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((110592 : Rat) / 7625) [(1, 2), (4, 1), (5, 1), (9, 1), (11, 1), (13, 1)],
  term ((331776 : Rat) / 7625) [(1, 2), (4, 1), (5, 1), (9, 1), (13, 2)],
  term ((-239616 : Rat) / 7625) [(1, 2), (4, 1), (5, 1), (9, 2), (13, 1)],
  term ((55296 : Rat) / 7625) [(1, 2), (4, 1), (5, 1), (10, 1), (13, 1)],
  term ((41472 : Rat) / 7625) [(1, 2), (4, 1), (5, 1), (13, 1)],
  term ((-41472 : Rat) / 7625) [(1, 2), (4, 1), (5, 1), (13, 1), (14, 1)],
  term ((-27648 : Rat) / 7625) [(1, 2), (4, 1), (7, 1), (10, 1), (13, 1)],
  term ((20736 : Rat) / 7625) [(1, 2), (4, 1), (7, 1), (13, 1), (14, 1)],
  term ((-367104 : Rat) / 53375) [(1, 2), (4, 1), (9, 1), (10, 1), (13, 1)],
  term ((12672 : Rat) / 427) [(1, 2), (4, 1), (9, 1), (11, 1), (13, 2)],
  term ((108096 : Rat) / 10675) [(1, 2), (4, 1), (9, 1), (11, 2), (13, 1)],
  term ((-151968 : Rat) / 53375) [(1, 2), (4, 1), (9, 1), (12, 1), (13, 1)],
  term ((63312 : Rat) / 53375) [(1, 2), (4, 1), (9, 1), (13, 1)],
  term ((-232128 : Rat) / 10675) [(1, 2), (4, 1), (9, 2), (11, 1), (13, 1)],
  term ((-4992 : Rat) / 10675) [(1, 2), (4, 1), (11, 1), (12, 1), (13, 1)],
  term ((288 : Rat) / 175) [(1, 2), (4, 1), (11, 1), (13, 1)],
  term ((-10368 : Rat) / 7625) [(1, 2), (4, 1), (13, 1), (15, 1)],
  term ((456816 : Rat) / 53375) [(1, 2), (4, 1), (13, 2)],
  term ((-331776 : Rat) / 7625) [(1, 2), (4, 2), (9, 1), (11, 1), (13, 2)],
  term ((-55296 : Rat) / 7625) [(1, 2), (4, 2), (9, 1), (11, 2), (13, 1)],
  term ((101376 : Rat) / 7625) [(1, 2), (4, 2), (9, 1), (12, 1), (13, 1)],
  term ((-50688 : Rat) / 7625) [(1, 2), (4, 2), (9, 1), (13, 1)],
  term ((165888 : Rat) / 7625) [(1, 2), (4, 2), (9, 2), (11, 1), (13, 1)],
  term ((-110592 : Rat) / 7625) [(1, 2), (4, 2), (11, 1), (12, 1), (13, 1)],
  term ((82944 : Rat) / 7625) [(1, 2), (4, 2), (11, 1), (13, 1)],
  term ((-78336 : Rat) / 7625) [(1, 2), (4, 2), (13, 2)],
  term ((-21888 : Rat) / 7625) [(1, 2), (5, 1), (9, 1), (11, 1), (13, 1)],
  term ((-24 : Rat) / 5) [(1, 2), (5, 1), (9, 1), (12, 1)],
  term ((24 : Rat) / 5) [(1, 2), (5, 1), (9, 1), (12, 1), (14, 1)],
  term ((-65664 : Rat) / 7625) [(1, 2), (5, 1), (9, 1), (13, 2)],
  term ((47424 : Rat) / 7625) [(1, 2), (5, 1), (9, 2), (13, 1)],
  term ((-10944 : Rat) / 7625) [(1, 2), (5, 1), (10, 1), (13, 1)],
  term ((41472 : Rat) / 7625) [(1, 2), (5, 1), (12, 1), (13, 1)],
  term ((-41472 : Rat) / 7625) [(1, 2), (5, 1), (12, 1), (13, 1), (14, 1)],
  term ((-11028 : Rat) / 7625) [(1, 2), (5, 1), (13, 1)],
  term ((-8556 : Rat) / 7625) [(1, 2), (5, 1), (13, 1), (14, 1)],
  term ((24 : Rat) / 5) [(1, 2), (5, 1), (14, 1), (15, 1)],
  term ((-24 : Rat) / 5) [(1, 2), (5, 1), (15, 1)],
  term ((-12 : Rat) / 5) [(1, 2), (7, 1), (9, 1)],
  term ((24 : Rat) / 5) [(1, 2), (7, 1), (9, 1), (14, 1)],
  term ((5472 : Rat) / 7625) [(1, 2), (7, 1), (10, 1), (13, 1)],
  term ((-20736 : Rat) / 7625) [(1, 2), (7, 1), (12, 1), (13, 1)],
  term ((20736 : Rat) / 7625) [(1, 2), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((15168 : Rat) / 7625) [(1, 2), (7, 1), (13, 1)],
  term ((-4872 : Rat) / 7625) [(1, 2), (7, 1), (13, 1), (14, 1)],
  term ((-12 : Rat) / 5) [(1, 2), (7, 1), (14, 1), (15, 1)],
  term ((-33 : Rat) / 20) [(1, 2), (7, 1), (15, 1)],
  term ((9 : Rat) / 20) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((-5161144 : Rat) / 53375) [(1, 2), (9, 1), (10, 1), (13, 1)],
  term ((4224 : Rat) / 35) [(1, 2), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((-1408 : Rat) / 35) [(1, 2), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((1144 : Rat) / 35) [(1, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((14341 : Rat) / 210) [(1, 2), (9, 1), (10, 1), (15, 1)],
  term ((-479 : Rat) / 70) [(1, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1232 : Rat) / 5) [(1, 2), (9, 1), (11, 1)],
  term ((-18418 : Rat) / 35) [(1, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((2274 : Rat) / 35) [(1, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-752448 : Rat) / 875) [(1, 2), (9, 1), (11, 1), (13, 2)],
  term ((36864 : Rat) / 35) [(1, 2), (9, 1), (11, 1), (13, 2), (14, 1)],
  term ((-12288 : Rat) / 35) [(1, 2), (9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((9984 : Rat) / 35) [(1, 2), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((1152 : Rat) / 5) [(1, 2), (9, 1), (11, 1), (14, 1)],
  term ((-24833408 : Rat) / 53375) [(1, 2), (9, 1), (11, 2), (13, 1)],
  term ((19968 : Rat) / 35) [(1, 2), (9, 1), (11, 2), (13, 1), (14, 1)],
  term ((-6656 : Rat) / 35) [(1, 2), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((5408 : Rat) / 35) [(1, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-587 : Rat) / 105) [(1, 2), (9, 1), (11, 2), (15, 1)],
  term ((29 : Rat) / 7) [(1, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-1223496 : Rat) / 53375) [(1, 2), (9, 1), (12, 1), (13, 1)],
  term ((768 : Rat) / 35) [(1, 2), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-256 : Rat) / 35) [(1, 2), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((208 : Rat) / 35) [(1, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-32519 : Rat) / 350) [(1, 2), (9, 1), (12, 1), (15, 1)],
  term ((-5616 : Rat) / 35) [(3, 1), (6, 1), (11, 1), (12, 1), (14, 1)],
  term ((1872 : Rat) / 35) [(3, 1), (6, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((3744 : Rat) / 35) [(3, 1), (6, 1), (11, 1), (12, 1), (16, 1)],
  term ((4512 : Rat) / 35) [(3, 1), (6, 1), (12, 1), (13, 1)],
  term ((128 : Rat) / 35) [(3, 1), (6, 1), (12, 1), (13, 1), (14, 1)],
  term ((-528 : Rat) / 35) [(3, 1), (6, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1084 : Rat) / 35) [(3, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term ((-786 : Rat) / 25) [(3, 1), (6, 1), (12, 1), (15, 1)],
  term ((18 : Rat) / 5) [(3, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((2808 : Rat) / 35) [(3, 1), (6, 2), (11, 1), (14, 1)],
  term ((-936 : Rat) / 35) [(3, 1), (6, 2), (11, 1), (14, 1), (16, 1)],
  term ((-1872 : Rat) / 35) [(3, 1), (6, 2), (11, 1), (16, 1)],
  term ((-2256 : Rat) / 35) [(3, 1), (6, 2), (13, 1)],
  term ((-64 : Rat) / 35) [(3, 1), (6, 2), (13, 1), (14, 1)],
  term ((264 : Rat) / 35) [(3, 1), (6, 2), (13, 1), (14, 1), (16, 1)],
  term ((542 : Rat) / 35) [(3, 1), (6, 2), (13, 1), (16, 1)],
  term ((393 : Rat) / 25) [(3, 1), (6, 2), (15, 1)],
  term ((-9 : Rat) / 5) [(3, 1), (6, 2), (15, 1), (16, 1)],
  term ((-5616 : Rat) / 35) [(3, 1), (7, 1), (11, 1), (13, 1), (14, 1)],
  term ((1872 : Rat) / 35) [(3, 1), (7, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((3744 : Rat) / 35) [(3, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((-786 : Rat) / 25) [(3, 1), (7, 1), (13, 1), (15, 1)],
  term ((18 : Rat) / 5) [(3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((4512 : Rat) / 35) [(3, 1), (7, 1), (13, 2)],
  term ((128 : Rat) / 35) [(3, 1), (7, 1), (13, 2), (14, 1)],
  term ((-528 : Rat) / 35) [(3, 1), (7, 1), (13, 2), (14, 1), (16, 1)],
  term ((-1084 : Rat) / 35) [(3, 1), (7, 1), (13, 2), (16, 1)],
  term ((2808 : Rat) / 35) [(3, 1), (7, 2), (11, 1), (14, 1)],
  term ((-936 : Rat) / 35) [(3, 1), (7, 2), (11, 1), (14, 1), (16, 1)],
  term ((-1872 : Rat) / 35) [(3, 1), (7, 2), (11, 1), (16, 1)],
  term ((-2256 : Rat) / 35) [(3, 1), (7, 2), (13, 1)],
  term ((-64 : Rat) / 35) [(3, 1), (7, 2), (13, 1), (14, 1)],
  term ((264 : Rat) / 35) [(3, 1), (7, 2), (13, 1), (14, 1), (16, 1)],
  term ((542 : Rat) / 35) [(3, 1), (7, 2), (13, 1), (16, 1)],
  term ((393 : Rat) / 25) [(3, 1), (7, 2), (15, 1)],
  term ((-9 : Rat) / 5) [(3, 1), (7, 2), (15, 1), (16, 1)],
  term ((-5184 : Rat) / 35) [(3, 2), (6, 1), (9, 1), (11, 1), (12, 1)],
  term ((-2592 : Rat) / 35) [(3, 2), (6, 1), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((864 : Rat) / 35) [(3, 2), (6, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((1728 : Rat) / 35) [(3, 2), (6, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((3456 : Rat) / 35) [(3, 2), (6, 1), (9, 1), (11, 1), (12, 2)],
  term ((1728 : Rat) / 35) [(3, 2), (6, 1), (9, 1), (11, 1), (12, 2), (14, 1)],
  term ((-576 : Rat) / 35) [(3, 2), (6, 1), (9, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((-1152 : Rat) / 35) [(3, 2), (6, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((-324 : Rat) / 5) [(3, 2), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((36 : Rat) / 5) [(3, 2), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((216 : Rat) / 5) [(3, 2), (6, 1), (9, 1), (12, 2), (15, 1)],
  term ((-24 : Rat) / 5) [(3, 2), (6, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((1728 : Rat) / 35) [(3, 2), (6, 1), (11, 1), (12, 1), (13, 1)],
  term ((864 : Rat) / 35) [(3, 2), (6, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-288 : Rat) / 35) [(3, 2), (6, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-576 : Rat) / 35) [(3, 2), (6, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((108 : Rat) / 5) [(3, 2), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((-12 : Rat) / 5) [(3, 2), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((2592 : Rat) / 35) [(3, 2), (6, 2), (9, 1), (11, 1)],
  term ((-1728 : Rat) / 35) [(3, 2), (6, 2), (9, 1), (11, 1), (12, 1)],
  term ((-864 : Rat) / 35) [(3, 2), (6, 2), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((288 : Rat) / 35) [(3, 2), (6, 2), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((576 : Rat) / 35) [(3, 2), (6, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((1296 : Rat) / 35) [(3, 2), (6, 2), (9, 1), (11, 1), (14, 1)],
  term ((-432 : Rat) / 35) [(3, 2), (6, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-864 : Rat) / 35) [(3, 2), (6, 2), (9, 1), (11, 1), (16, 1)],
  term ((-108 : Rat) / 5) [(3, 2), (6, 2), (9, 1), (12, 1), (15, 1)],
  term ((12 : Rat) / 5) [(3, 2), (6, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((162 : Rat) / 5) [(3, 2), (6, 2), (9, 1), (15, 1)],
  term ((-18 : Rat) / 5) [(3, 2), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((-864 : Rat) / 35) [(3, 2), (6, 2), (11, 1), (13, 1)],
  term ((-432 : Rat) / 35) [(3, 2), (6, 2), (11, 1), (13, 1), (14, 1)],
  term ((144 : Rat) / 35) [(3, 2), (6, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((288 : Rat) / 35) [(3, 2), (6, 2), (11, 1), (13, 1), (16, 1)],
  term ((-54 : Rat) / 5) [(3, 2), (6, 2), (13, 1), (15, 1)],
  term ((6 : Rat) / 5) [(3, 2), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((3456 : Rat) / 35) [(3, 2), (7, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((1728 : Rat) / 35) [(3, 2), (7, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-576 : Rat) / 35) [(3, 2), (7, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1152 : Rat) / 35) [(3, 2), (7, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-5184 : Rat) / 35) [(3, 2), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-2592 : Rat) / 35) [(3, 2), (7, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((864 : Rat) / 35) [(3, 2), (7, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((1728 : Rat) / 35) [(3, 2), (7, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((216 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-24 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-324 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((36 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((1728 : Rat) / 35) [(3, 2), (7, 1), (11, 1), (13, 2)],
  term ((864 : Rat) / 35) [(3, 2), (7, 1), (11, 1), (13, 2), (14, 1)],
  term ((-288 : Rat) / 35) [(3, 2), (7, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-576 : Rat) / 35) [(3, 2), (7, 1), (11, 1), (13, 2), (16, 1)],
  term ((108 : Rat) / 5) [(3, 2), (7, 1), (13, 2), (15, 1)],
  term ((-12 : Rat) / 5) [(3, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((2592 : Rat) / 35) [(3, 2), (7, 2), (9, 1), (11, 1)],
  term ((-1728 : Rat) / 35) [(3, 2), (7, 2), (9, 1), (11, 1), (12, 1)],
  term ((-864 : Rat) / 35) [(3, 2), (7, 2), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((288 : Rat) / 35) [(3, 2), (7, 2), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((576 : Rat) / 35) [(3, 2), (7, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((1296 : Rat) / 35) [(3, 2), (7, 2), (9, 1), (11, 1), (14, 1)],
  term ((-432 : Rat) / 35) [(3, 2), (7, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-864 : Rat) / 35) [(3, 2), (7, 2), (9, 1), (11, 1), (16, 1)],
  term ((-108 : Rat) / 5) [(3, 2), (7, 2), (9, 1), (12, 1), (15, 1)],
  term ((12 : Rat) / 5) [(3, 2), (7, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((162 : Rat) / 5) [(3, 2), (7, 2), (9, 1), (15, 1)],
  term ((-18 : Rat) / 5) [(3, 2), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-864 : Rat) / 35) [(3, 2), (7, 2), (11, 1), (13, 1)],
  term ((-432 : Rat) / 35) [(3, 2), (7, 2), (11, 1), (13, 1), (14, 1)],
  term ((144 : Rat) / 35) [(3, 2), (7, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((288 : Rat) / 35) [(3, 2), (7, 2), (11, 1), (13, 1), (16, 1)],
  term ((-54 : Rat) / 5) [(3, 2), (7, 2), (13, 1), (15, 1)],
  term ((6 : Rat) / 5) [(3, 2), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((221184 : Rat) / 7625) [(4, 1), (5, 1), (6, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((663552 : Rat) / 7625) [(4, 1), (5, 1), (6, 1), (9, 1), (12, 1), (13, 2)],
  term ((-479232 : Rat) / 7625) [(4, 1), (5, 1), (6, 1), (9, 2), (12, 1), (13, 1)],
  term ((110592 : Rat) / 7625) [(4, 1), (5, 1), (6, 1), (10, 1), (12, 1), (13, 1)],
  term ((82944 : Rat) / 7625) [(4, 1), (5, 1), (6, 1), (12, 1), (13, 1)],
  term ((-82944 : Rat) / 7625) [(4, 1), (5, 1), (6, 1), (12, 1), (13, 1), (14, 1)],
  term ((-110592 : Rat) / 7625) [(4, 1), (5, 1), (6, 2), (9, 1), (11, 1), (13, 1)],
  term ((-331776 : Rat) / 7625) [(4, 1), (5, 1), (6, 2), (9, 1), (13, 2)],
  term ((239616 : Rat) / 7625) [(4, 1), (5, 1), (6, 2), (9, 2), (13, 1)],
  term ((-55296 : Rat) / 7625) [(4, 1), (5, 1), (6, 2), (10, 1), (13, 1)],
  term ((-41472 : Rat) / 7625) [(4, 1), (5, 1), (6, 2), (13, 1)],
  term ((41472 : Rat) / 7625) [(4, 1), (5, 1), (6, 2), (13, 1), (14, 1)],
  term ((221184 : Rat) / 7625) [(4, 1), (5, 1), (7, 1), (9, 1), (11, 1), (13, 2)],
  term ((663552 : Rat) / 7625) [(4, 1), (5, 1), (7, 1), (9, 1), (13, 3)],
  term ((-479232 : Rat) / 7625) [(4, 1), (5, 1), (7, 1), (9, 2), (13, 2)],
  term ((110592 : Rat) / 7625) [(4, 1), (5, 1), (7, 1), (10, 1), (13, 2)],
  term ((82944 : Rat) / 7625) [(4, 1), (5, 1), (7, 1), (13, 2)],
  term ((-82944 : Rat) / 7625) [(4, 1), (5, 1), (7, 1), (13, 2), (14, 1)],
  term ((-110592 : Rat) / 7625) [(4, 1), (5, 1), (7, 2), (9, 1), (11, 1), (13, 1)],
  term ((-331776 : Rat) / 7625) [(4, 1), (5, 1), (7, 2), (9, 1), (13, 2)],
  term ((239616 : Rat) / 7625) [(4, 1), (5, 1), (7, 2), (9, 2), (13, 1)],
  term ((-55296 : Rat) / 7625) [(4, 1), (5, 1), (7, 2), (10, 1), (13, 1)],
  term ((-41472 : Rat) / 7625) [(4, 1), (5, 1), (7, 2), (13, 1)],
  term ((41472 : Rat) / 7625) [(4, 1), (5, 1), (7, 2), (13, 1), (14, 1)],
  term ((-55296 : Rat) / 7625) [(4, 1), (6, 1), (7, 1), (10, 1), (12, 1), (13, 1)],
  term ((41472 : Rat) / 7625) [(4, 1), (6, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((-734208 : Rat) / 53375) [(4, 1), (6, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((25344 : Rat) / 427) [(4, 1), (6, 1), (9, 1), (11, 1), (12, 1), (13, 2)],
  term ((216192 : Rat) / 10675) [(4, 1), (6, 1), (9, 1), (11, 2), (12, 1), (13, 1)],
  term ((126624 : Rat) / 53375) [(4, 1), (6, 1), (9, 1), (12, 1), (13, 1)],
  term ((-303936 : Rat) / 53375) [(4, 1), (6, 1), (9, 1), (12, 2), (13, 1)],
  term ((-464256 : Rat) / 10675) [(4, 1), (6, 1), (9, 2), (11, 1), (12, 1), (13, 1)],
  term ((576 : Rat) / 175) [(4, 1), (6, 1), (11, 1), (12, 1), (13, 1)],
  term ((-9984 : Rat) / 10675) [(4, 1), (6, 1), (11, 1), (12, 2), (13, 1)],
  term ((-20736 : Rat) / 7625) [(4, 1), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((913632 : Rat) / 53375) [(4, 1), (6, 1), (12, 1), (13, 2)],
  term ((27648 : Rat) / 7625) [(4, 1), (6, 2), (7, 1), (10, 1), (13, 1)],
  term ((-20736 : Rat) / 7625) [(4, 1), (6, 2), (7, 1), (13, 1), (14, 1)],
  term ((367104 : Rat) / 53375) [(4, 1), (6, 2), (9, 1), (10, 1), (13, 1)],
  term ((-12672 : Rat) / 427) [(4, 1), (6, 2), (9, 1), (11, 1), (13, 2)],
  term ((-108096 : Rat) / 10675) [(4, 1), (6, 2), (9, 1), (11, 2), (13, 1)],
  term ((151968 : Rat) / 53375) [(4, 1), (6, 2), (9, 1), (12, 1), (13, 1)],
  term ((-63312 : Rat) / 53375) [(4, 1), (6, 2), (9, 1), (13, 1)],
  term ((232128 : Rat) / 10675) [(4, 1), (6, 2), (9, 2), (11, 1), (13, 1)],
  term ((4992 : Rat) / 10675) [(4, 1), (6, 2), (11, 1), (12, 1), (13, 1)],
  term ((-288 : Rat) / 175) [(4, 1), (6, 2), (11, 1), (13, 1)],
  term ((10368 : Rat) / 7625) [(4, 1), (6, 2), (13, 1), (15, 1)],
  term ((-456816 : Rat) / 53375) [(4, 1), (6, 2), (13, 2)],
  term ((-734208 : Rat) / 53375) [(4, 1), (7, 1), (9, 1), (10, 1), (13, 2)],
  term ((25344 : Rat) / 427) [(4, 1), (7, 1), (9, 1), (11, 1), (13, 3)],
  term ((216192 : Rat) / 10675) [(4, 1), (7, 1), (9, 1), (11, 2), (13, 2)],
  term ((-303936 : Rat) / 53375) [(4, 1), (7, 1), (9, 1), (12, 1), (13, 2)],
  term ((126624 : Rat) / 53375) [(4, 1), (7, 1), (9, 1), (13, 2)],
  term ((-464256 : Rat) / 10675) [(4, 1), (7, 1), (9, 2), (11, 1), (13, 2)],
  term ((-9984 : Rat) / 10675) [(4, 1), (7, 1), (11, 1), (12, 1), (13, 2)],
  term ((576 : Rat) / 175) [(4, 1), (7, 1), (11, 1), (13, 2)],
  term ((-20736 : Rat) / 7625) [(4, 1), (7, 1), (13, 2), (15, 1)],
  term ((913632 : Rat) / 53375) [(4, 1), (7, 1), (13, 3)],
  term ((367104 : Rat) / 53375) [(4, 1), (7, 2), (9, 1), (10, 1), (13, 1)],
  term ((-12672 : Rat) / 427) [(4, 1), (7, 2), (9, 1), (11, 1), (13, 2)],
  term ((-108096 : Rat) / 10675) [(4, 1), (7, 2), (9, 1), (11, 2), (13, 1)],
  term ((151968 : Rat) / 53375) [(4, 1), (7, 2), (9, 1), (12, 1), (13, 1)],
  term ((-63312 : Rat) / 53375) [(4, 1), (7, 2), (9, 1), (13, 1)],
  term ((232128 : Rat) / 10675) [(4, 1), (7, 2), (9, 2), (11, 1), (13, 1)],
  term ((-55296 : Rat) / 7625) [(4, 1), (7, 2), (10, 1), (13, 2)],
  term ((4992 : Rat) / 10675) [(4, 1), (7, 2), (11, 1), (12, 1), (13, 1)],
  term ((-288 : Rat) / 175) [(4, 1), (7, 2), (11, 1), (13, 1)],
  term ((10368 : Rat) / 7625) [(4, 1), (7, 2), (13, 1), (15, 1)],
  term ((-456816 : Rat) / 53375) [(4, 1), (7, 2), (13, 2)],
  term ((41472 : Rat) / 7625) [(4, 1), (7, 2), (13, 2), (14, 1)],
  term ((27648 : Rat) / 7625) [(4, 1), (7, 3), (10, 1), (13, 1)],
  term ((-20736 : Rat) / 7625) [(4, 1), (7, 3), (13, 1), (14, 1)],
  term ((-663552 : Rat) / 7625) [(4, 2), (6, 1), (9, 1), (11, 1), (12, 1), (13, 2)],
  term ((-110592 : Rat) / 7625) [(4, 2), (6, 1), (9, 1), (11, 2), (12, 1), (13, 1)],
  term ((-101376 : Rat) / 7625) [(4, 2), (6, 1), (9, 1), (12, 1), (13, 1)],
  term ((202752 : Rat) / 7625) [(4, 2), (6, 1), (9, 1), (12, 2), (13, 1)],
  term ((331776 : Rat) / 7625) [(4, 2), (6, 1), (9, 2), (11, 1), (12, 1), (13, 1)],
  term ((165888 : Rat) / 7625) [(4, 2), (6, 1), (11, 1), (12, 1), (13, 1)],
  term ((-221184 : Rat) / 7625) [(4, 2), (6, 1), (11, 1), (12, 2), (13, 1)],
  term ((-156672 : Rat) / 7625) [(4, 2), (6, 1), (12, 1), (13, 2)],
  term ((331776 : Rat) / 7625) [(4, 2), (6, 2), (9, 1), (11, 1), (13, 2)],
  term ((55296 : Rat) / 7625) [(4, 2), (6, 2), (9, 1), (11, 2), (13, 1)],
  term ((-101376 : Rat) / 7625) [(4, 2), (6, 2), (9, 1), (12, 1), (13, 1)],
  term ((50688 : Rat) / 7625) [(4, 2), (6, 2), (9, 1), (13, 1)],
  term ((-165888 : Rat) / 7625) [(4, 2), (6, 2), (9, 2), (11, 1), (13, 1)],
  term ((110592 : Rat) / 7625) [(4, 2), (6, 2), (11, 1), (12, 1), (13, 1)],
  term ((-82944 : Rat) / 7625) [(4, 2), (6, 2), (11, 1), (13, 1)],
  term ((78336 : Rat) / 7625) [(4, 2), (6, 2), (13, 2)],
  term ((-663552 : Rat) / 7625) [(4, 2), (7, 1), (9, 1), (11, 1), (13, 3)],
  term ((-110592 : Rat) / 7625) [(4, 2), (7, 1), (9, 1), (11, 2), (13, 2)],
  term ((202752 : Rat) / 7625) [(4, 2), (7, 1), (9, 1), (12, 1), (13, 2)],
  term ((-101376 : Rat) / 7625) [(4, 2), (7, 1), (9, 1), (13, 2)],
  term ((331776 : Rat) / 7625) [(4, 2), (7, 1), (9, 2), (11, 1), (13, 2)],
  term ((-221184 : Rat) / 7625) [(4, 2), (7, 1), (11, 1), (12, 1), (13, 2)],
  term ((165888 : Rat) / 7625) [(4, 2), (7, 1), (11, 1), (13, 2)],
  term ((-156672 : Rat) / 7625) [(4, 2), (7, 1), (13, 3)],
  term ((331776 : Rat) / 7625) [(4, 2), (7, 2), (9, 1), (11, 1), (13, 2)],
  term ((55296 : Rat) / 7625) [(4, 2), (7, 2), (9, 1), (11, 2), (13, 1)],
  term ((-101376 : Rat) / 7625) [(4, 2), (7, 2), (9, 1), (12, 1), (13, 1)],
  term ((50688 : Rat) / 7625) [(4, 2), (7, 2), (9, 1), (13, 1)],
  term ((-165888 : Rat) / 7625) [(4, 2), (7, 2), (9, 2), (11, 1), (13, 1)],
  term ((110592 : Rat) / 7625) [(4, 2), (7, 2), (11, 1), (12, 1), (13, 1)],
  term ((-82944 : Rat) / 7625) [(4, 2), (7, 2), (11, 1), (13, 1)],
  term ((78336 : Rat) / 7625) [(4, 2), (7, 2), (13, 2)],
  term ((-43776 : Rat) / 7625) [(5, 1), (6, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((-131328 : Rat) / 7625) [(5, 1), (6, 1), (9, 1), (12, 1), (13, 2)],
  term ((-48 : Rat) / 5) [(5, 1), (6, 1), (9, 1), (12, 2)],
  term ((48 : Rat) / 5) [(5, 1), (6, 1), (9, 1), (12, 2), (14, 1)],
  term ((94848 : Rat) / 7625) [(5, 1), (6, 1), (9, 2), (12, 1), (13, 1)],
  term ((-21888 : Rat) / 7625) [(5, 1), (6, 1), (10, 1), (12, 1), (13, 1)],
  term ((-22056 : Rat) / 7625) [(5, 1), (6, 1), (12, 1), (13, 1)],
  term ((-17112 : Rat) / 7625) [(5, 1), (6, 1), (12, 1), (13, 1), (14, 1)],
  term ((48 : Rat) / 5) [(5, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((-48 : Rat) / 5) [(5, 1), (6, 1), (12, 1), (15, 1)],
  term ((82944 : Rat) / 7625) [(5, 1), (6, 1), (12, 2), (13, 1)],
  term ((-82944 : Rat) / 7625) [(5, 1), (6, 1), (12, 2), (13, 1), (14, 1)],
  term ((21888 : Rat) / 7625) [(5, 1), (6, 2), (9, 1), (11, 1), (13, 1)],
  term ((24 : Rat) / 5) [(5, 1), (6, 2), (9, 1), (12, 1)],
  term ((-24 : Rat) / 5) [(5, 1), (6, 2), (9, 1), (12, 1), (14, 1)],
  term ((65664 : Rat) / 7625) [(5, 1), (6, 2), (9, 1), (13, 2)],
  term ((-47424 : Rat) / 7625) [(5, 1), (6, 2), (9, 2), (13, 1)],
  term ((10944 : Rat) / 7625) [(5, 1), (6, 2), (10, 1), (13, 1)],
  term ((-41472 : Rat) / 7625) [(5, 1), (6, 2), (12, 1), (13, 1)],
  term ((41472 : Rat) / 7625) [(5, 1), (6, 2), (12, 1), (13, 1), (14, 1)],
  term ((11028 : Rat) / 7625) [(5, 1), (6, 2), (13, 1)],
  term ((8556 : Rat) / 7625) [(5, 1), (6, 2), (13, 1), (14, 1)],
  term ((-24 : Rat) / 5) [(5, 1), (6, 2), (14, 1), (15, 1)],
  term ((24 : Rat) / 5) [(5, 1), (6, 2), (15, 1)],
  term ((-43776 : Rat) / 7625) [(5, 1), (7, 1), (9, 1), (11, 1), (13, 2)],
  term ((-48 : Rat) / 5) [(5, 1), (7, 1), (9, 1), (12, 1), (13, 1)],
  term ((48 : Rat) / 5) [(5, 1), (7, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-131328 : Rat) / 7625) [(5, 1), (7, 1), (9, 1), (13, 3)],
  term ((94848 : Rat) / 7625) [(5, 1), (7, 1), (9, 2), (13, 2)],
  term ((-21888 : Rat) / 7625) [(5, 1), (7, 1), (10, 1), (13, 2)],
  term ((82944 : Rat) / 7625) [(5, 1), (7, 1), (12, 1), (13, 2)],
  term ((-82944 : Rat) / 7625) [(5, 1), (7, 1), (12, 1), (13, 2), (14, 1)],
  term ((48 : Rat) / 5) [(5, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((-48 : Rat) / 5) [(5, 1), (7, 1), (13, 1), (15, 1)],
  term ((-22056 : Rat) / 7625) [(5, 1), (7, 1), (13, 2)],
  term ((-17112 : Rat) / 7625) [(5, 1), (7, 1), (13, 2), (14, 1)],
  term ((21888 : Rat) / 7625) [(5, 1), (7, 2), (9, 1), (11, 1), (13, 1)],
  term ((24 : Rat) / 5) [(5, 1), (7, 2), (9, 1), (12, 1)],
  term ((-24 : Rat) / 5) [(5, 1), (7, 2), (9, 1), (12, 1), (14, 1)],
  term ((65664 : Rat) / 7625) [(5, 1), (7, 2), (9, 1), (13, 2)],
  term ((-47424 : Rat) / 7625) [(5, 1), (7, 2), (9, 2), (13, 1)],
  term ((10944 : Rat) / 7625) [(5, 1), (7, 2), (10, 1), (13, 1)],
  term ((-41472 : Rat) / 7625) [(5, 1), (7, 2), (12, 1), (13, 1)],
  term ((41472 : Rat) / 7625) [(5, 1), (7, 2), (12, 1), (13, 1), (14, 1)],
  term ((11028 : Rat) / 7625) [(5, 1), (7, 2), (13, 1)],
  term ((8556 : Rat) / 7625) [(5, 1), (7, 2), (13, 1), (14, 1)],
  term ((-24 : Rat) / 5) [(5, 1), (7, 2), (14, 1), (15, 1)],
  term ((24 : Rat) / 5) [(5, 1), (7, 2), (15, 1)],
  term ((-24 : Rat) / 5) [(6, 1), (7, 1), (9, 1), (12, 1)],
  term ((48 : Rat) / 5) [(6, 1), (7, 1), (9, 1), (12, 1), (14, 1)],
  term ((10944 : Rat) / 7625) [(6, 1), (7, 1), (10, 1), (12, 1), (13, 1)],
  term ((30336 : Rat) / 7625) [(6, 1), (7, 1), (12, 1), (13, 1)],
  term ((-9744 : Rat) / 7625) [(6, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((-24 : Rat) / 5) [(6, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-33 : Rat) / 10) [(6, 1), (7, 1), (12, 1), (15, 1)],
  term ((9 : Rat) / 10) [(6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-41472 : Rat) / 7625) [(6, 1), (7, 1), (12, 2), (13, 1)],
  term ((41472 : Rat) / 7625) [(6, 1), (7, 1), (12, 2), (13, 1), (14, 1)],
  term ((-10322288 : Rat) / 53375) [(6, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((8448 : Rat) / 35) [(6, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((-2816 : Rat) / 35) [(6, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((2288 : Rat) / 35) [(6, 1), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((14341 : Rat) / 105) [(6, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-479 : Rat) / 35) [(6, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2464 : Rat) / 5) [(6, 1), (9, 1), (11, 1), (12, 1)],
  term ((-36836 : Rat) / 35) [(6, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((4548 : Rat) / 35) [(6, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1504896 : Rat) / 875) [(6, 1), (9, 1), (11, 1), (12, 1), (13, 2)],
  term ((73728 : Rat) / 35) [(6, 1), (9, 1), (11, 1), (12, 1), (13, 2), (14, 1)],
  term ((-24576 : Rat) / 35) [(6, 1), (9, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((19968 : Rat) / 35) [(6, 1), (9, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((2304 : Rat) / 5) [(6, 1), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((-49666816 : Rat) / 53375) [(6, 1), (9, 1), (11, 2), (12, 1), (13, 1)],
  term ((39936 : Rat) / 35) [(6, 1), (9, 1), (11, 2), (12, 1), (13, 1), (14, 1)],
  term ((-13312 : Rat) / 35) [(6, 1), (9, 1), (11, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((10816 : Rat) / 35) [(6, 1), (9, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((-1174 : Rat) / 105) [(6, 1), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((58 : Rat) / 7) [(6, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-2446992 : Rat) / 53375) [(6, 1), (9, 1), (12, 2), (13, 1)],
  term ((1536 : Rat) / 35) [(6, 1), (9, 1), (12, 2), (13, 1), (14, 1)],
  term ((-512 : Rat) / 35) [(6, 1), (9, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((416 : Rat) / 35) [(6, 1), (9, 1), (12, 2), (13, 1), (16, 1)],
  term ((-32519 : Rat) / 175) [(6, 1), (9, 1), (12, 2), (15, 1)],
  term ((12 : Rat) / 5) [(6, 2), (7, 1), (9, 1)],
  term ((-24 : Rat) / 5) [(6, 2), (7, 1), (9, 1), (14, 1)],
  term ((-5472 : Rat) / 7625) [(6, 2), (7, 1), (10, 1), (13, 1)],
  term ((20736 : Rat) / 7625) [(6, 2), (7, 1), (12, 1), (13, 1)],
  term ((-20736 : Rat) / 7625) [(6, 2), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((-15168 : Rat) / 7625) [(6, 2), (7, 1), (13, 1)],
  term ((4872 : Rat) / 7625) [(6, 2), (7, 1), (13, 1), (14, 1)],
  term ((12 : Rat) / 5) [(6, 2), (7, 1), (14, 1), (15, 1)],
  term ((33 : Rat) / 20) [(6, 2), (7, 1), (15, 1)],
  term ((-9 : Rat) / 20) [(6, 2), (7, 1), (15, 1), (16, 1)],
  term ((5161144 : Rat) / 53375) [(6, 2), (9, 1), (10, 1), (13, 1)],
  term ((-4224 : Rat) / 35) [(6, 2), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((1408 : Rat) / 35) [(6, 2), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1144 : Rat) / 35) [(6, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-14341 : Rat) / 210) [(6, 2), (9, 1), (10, 1), (15, 1)],
  term ((479 : Rat) / 70) [(6, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((1232 : Rat) / 5) [(6, 2), (9, 1), (11, 1)],
  term ((18418 : Rat) / 35) [(6, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-2274 : Rat) / 35) [(6, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((752448 : Rat) / 875) [(6, 2), (9, 1), (11, 1), (13, 2)],
  term ((-36864 : Rat) / 35) [(6, 2), (9, 1), (11, 1), (13, 2), (14, 1)],
  term ((12288 : Rat) / 35) [(6, 2), (9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-9984 : Rat) / 35) [(6, 2), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-1152 : Rat) / 5) [(6, 2), (9, 1), (11, 1), (14, 1)],
  term ((24833408 : Rat) / 53375) [(6, 2), (9, 1), (11, 2), (13, 1)],
  term ((-19968 : Rat) / 35) [(6, 2), (9, 1), (11, 2), (13, 1), (14, 1)],
  term ((6656 : Rat) / 35) [(6, 2), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-5408 : Rat) / 35) [(6, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((587 : Rat) / 105) [(6, 2), (9, 1), (11, 2), (15, 1)],
  term ((-29 : Rat) / 7) [(6, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((1223496 : Rat) / 53375) [(6, 2), (9, 1), (12, 1), (13, 1)],
  term ((-768 : Rat) / 35) [(6, 2), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((256 : Rat) / 35) [(6, 2), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-208 : Rat) / 35) [(6, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((32519 : Rat) / 350) [(6, 2), (9, 1), (12, 1), (15, 1)],
  term ((14341 : Rat) / 105) [(7, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((-479 : Rat) / 35) [(7, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-10322288 : Rat) / 53375) [(7, 1), (9, 1), (10, 1), (13, 2)],
  term ((8448 : Rat) / 35) [(7, 1), (9, 1), (10, 1), (13, 2), (14, 1)],
  term ((-2816 : Rat) / 35) [(7, 1), (9, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((2288 : Rat) / 35) [(7, 1), (9, 1), (10, 1), (13, 2), (16, 1)],
  term ((-2464 : Rat) / 5) [(7, 1), (9, 1), (11, 1), (13, 1)],
  term ((2304 : Rat) / 5) [(7, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((-36836 : Rat) / 35) [(7, 1), (9, 1), (11, 1), (13, 2), (15, 1)],
  term ((4548 : Rat) / 35) [(7, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1504896 : Rat) / 875) [(7, 1), (9, 1), (11, 1), (13, 3)],
  term ((73728 : Rat) / 35) [(7, 1), (9, 1), (11, 1), (13, 3), (14, 1)],
  term ((-24576 : Rat) / 35) [(7, 1), (9, 1), (11, 1), (13, 3), (14, 1), (16, 1)],
  term ((19968 : Rat) / 35) [(7, 1), (9, 1), (11, 1), (13, 3), (16, 1)],
  term ((-1174 : Rat) / 105) [(7, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((58 : Rat) / 7) [(7, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-49666816 : Rat) / 53375) [(7, 1), (9, 1), (11, 2), (13, 2)],
  term ((39936 : Rat) / 35) [(7, 1), (9, 1), (11, 2), (13, 2), (14, 1)],
  term ((-13312 : Rat) / 35) [(7, 1), (9, 1), (11, 2), (13, 2), (14, 1), (16, 1)],
  term ((10816 : Rat) / 35) [(7, 1), (9, 1), (11, 2), (13, 2), (16, 1)],
  term ((-32519 : Rat) / 175) [(7, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-2446992 : Rat) / 53375) [(7, 1), (9, 1), (12, 1), (13, 2)],
  term ((1536 : Rat) / 35) [(7, 1), (9, 1), (12, 1), (13, 2), (14, 1)],
  term ((-512 : Rat) / 35) [(7, 1), (9, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((416 : Rat) / 35) [(7, 1), (9, 1), (12, 1), (13, 2), (16, 1)],
  term ((5161144 : Rat) / 53375) [(7, 2), (9, 1), (10, 1), (13, 1)],
  term ((-4224 : Rat) / 35) [(7, 2), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((1408 : Rat) / 35) [(7, 2), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1144 : Rat) / 35) [(7, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-14341 : Rat) / 210) [(7, 2), (9, 1), (10, 1), (15, 1)],
  term ((479 : Rat) / 70) [(7, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((1232 : Rat) / 5) [(7, 2), (9, 1), (11, 1)],
  term ((18418 : Rat) / 35) [(7, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-2274 : Rat) / 35) [(7, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((752448 : Rat) / 875) [(7, 2), (9, 1), (11, 1), (13, 2)],
  term ((-36864 : Rat) / 35) [(7, 2), (9, 1), (11, 1), (13, 2), (14, 1)],
  term ((12288 : Rat) / 35) [(7, 2), (9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-9984 : Rat) / 35) [(7, 2), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-1152 : Rat) / 5) [(7, 2), (9, 1), (11, 1), (14, 1)],
  term ((24833408 : Rat) / 53375) [(7, 2), (9, 1), (11, 2), (13, 1)],
  term ((-19968 : Rat) / 35) [(7, 2), (9, 1), (11, 2), (13, 1), (14, 1)],
  term ((6656 : Rat) / 35) [(7, 2), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-5408 : Rat) / 35) [(7, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((587 : Rat) / 105) [(7, 2), (9, 1), (11, 2), (15, 1)],
  term ((-29 : Rat) / 7) [(7, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((1223496 : Rat) / 53375) [(7, 2), (9, 1), (12, 1), (13, 1)],
  term ((-768 : Rat) / 35) [(7, 2), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((256 : Rat) / 35) [(7, 2), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-208 : Rat) / 35) [(7, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((32519 : Rat) / 350) [(7, 2), (9, 1), (12, 1), (15, 1)],
  term ((-24 : Rat) / 5) [(7, 2), (9, 1), (13, 1)],
  term ((48 : Rat) / 5) [(7, 2), (9, 1), (13, 1), (14, 1)],
  term ((10944 : Rat) / 7625) [(7, 2), (10, 1), (13, 2)],
  term ((-41472 : Rat) / 7625) [(7, 2), (12, 1), (13, 2)],
  term ((41472 : Rat) / 7625) [(7, 2), (12, 1), (13, 2), (14, 1)],
  term ((-24 : Rat) / 5) [(7, 2), (13, 1), (14, 1), (15, 1)],
  term ((-33 : Rat) / 10) [(7, 2), (13, 1), (15, 1)],
  term ((9 : Rat) / 10) [(7, 2), (13, 1), (15, 1), (16, 1)],
  term ((30336 : Rat) / 7625) [(7, 2), (13, 2)],
  term ((-9744 : Rat) / 7625) [(7, 2), (13, 2), (14, 1)],
  term ((12 : Rat) / 5) [(7, 3), (9, 1)],
  term ((-24 : Rat) / 5) [(7, 3), (9, 1), (14, 1)],
  term ((-5472 : Rat) / 7625) [(7, 3), (10, 1), (13, 1)],
  term ((20736 : Rat) / 7625) [(7, 3), (12, 1), (13, 1)],
  term ((-20736 : Rat) / 7625) [(7, 3), (12, 1), (13, 1), (14, 1)],
  term ((-15168 : Rat) / 7625) [(7, 3), (13, 1)],
  term ((4872 : Rat) / 7625) [(7, 3), (13, 1), (14, 1)],
  term ((12 : Rat) / 5) [(7, 3), (14, 1), (15, 1)],
  term ((33 : Rat) / 20) [(7, 3), (15, 1)],
  term ((-9 : Rat) / 20) [(7, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 26, terms 200 through 299. -/
theorem rs_R003_ueqv_R003YY_block_26_0200_0299_valid :
    checkProductSumEq rs_R003_ueqv_R003YY_partials_26_0200_0299
      rs_R003_ueqv_R003YY_block_26_0200_0299 = true := by
  native_decide

end R003UeqvR003YYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
