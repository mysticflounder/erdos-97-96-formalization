/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R006:u=v:R006, term block 26:200-277

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R006UeqvR006TermShards

/-- Generator polynomial 26 for relaxed split surplus certificate `R006:u=v:R006`. -/
def rs_R006_ueqv_R006_generator_26_0200_0277 : Poly :=
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
def rs_R006_ueqv_R006_coefficient_26_0200 : Poly :=
[
  term ((-72 : Rat) / 35) [(5, 1), (8, 1), (13, 1)]
]

/-- Partial product 200 for generator 26. -/
def rs_R006_ueqv_R006_partial_26_0200 : Poly :=
[
  term ((144 : Rat) / 35) [(0, 1), (5, 1), (8, 1), (12, 1), (13, 1)],
  term ((-72 : Rat) / 35) [(0, 2), (5, 1), (8, 1), (13, 1)],
  term ((144 : Rat) / 35) [(1, 1), (5, 1), (8, 1), (13, 2)],
  term ((-72 : Rat) / 35) [(1, 2), (5, 1), (8, 1), (13, 1)],
  term ((-144 : Rat) / 35) [(5, 1), (6, 1), (8, 1), (12, 1), (13, 1)],
  term ((72 : Rat) / 35) [(5, 1), (6, 2), (8, 1), (13, 1)],
  term ((-144 : Rat) / 35) [(5, 1), (7, 1), (8, 1), (13, 2)],
  term ((72 : Rat) / 35) [(5, 1), (7, 2), (8, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 26. -/
theorem rs_R006_ueqv_R006_partial_26_0200_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_26_0200
        rs_R006_ueqv_R006_generator_26_0200_0277 =
      rs_R006_ueqv_R006_partial_26_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 26. -/
def rs_R006_ueqv_R006_coefficient_26_0201 : Poly :=
[
  term ((144 : Rat) / 7) [(5, 1), (9, 1), (11, 1), (13, 1)]
]

/-- Partial product 201 for generator 26. -/
def rs_R006_ueqv_R006_partial_26_0201 : Poly :=
[
  term ((-288 : Rat) / 7) [(0, 1), (5, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((144 : Rat) / 7) [(0, 2), (5, 1), (9, 1), (11, 1), (13, 1)],
  term ((-288 : Rat) / 7) [(1, 1), (5, 1), (9, 1), (11, 1), (13, 2)],
  term ((144 : Rat) / 7) [(1, 2), (5, 1), (9, 1), (11, 1), (13, 1)],
  term ((288 : Rat) / 7) [(5, 1), (6, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((-144 : Rat) / 7) [(5, 1), (6, 2), (9, 1), (11, 1), (13, 1)],
  term ((288 : Rat) / 7) [(5, 1), (7, 1), (9, 1), (11, 1), (13, 2)],
  term ((-144 : Rat) / 7) [(5, 1), (7, 2), (9, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 26. -/
theorem rs_R006_ueqv_R006_partial_26_0201_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_26_0201
        rs_R006_ueqv_R006_generator_26_0200_0277 =
      rs_R006_ueqv_R006_partial_26_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 26. -/
def rs_R006_ueqv_R006_coefficient_26_0202 : Poly :=
[
  term ((-24 : Rat) / 5) [(5, 1), (11, 1), (12, 1)]
]

/-- Partial product 202 for generator 26. -/
def rs_R006_ueqv_R006_partial_26_0202 : Poly :=
[
  term ((48 : Rat) / 5) [(0, 1), (5, 1), (11, 1), (12, 2)],
  term ((-24 : Rat) / 5) [(0, 2), (5, 1), (11, 1), (12, 1)],
  term ((48 : Rat) / 5) [(1, 1), (5, 1), (11, 1), (12, 1), (13, 1)],
  term ((-24 : Rat) / 5) [(1, 2), (5, 1), (11, 1), (12, 1)],
  term ((-48 : Rat) / 5) [(5, 1), (6, 1), (11, 1), (12, 2)],
  term ((24 : Rat) / 5) [(5, 1), (6, 2), (11, 1), (12, 1)],
  term ((-48 : Rat) / 5) [(5, 1), (7, 1), (11, 1), (12, 1), (13, 1)],
  term ((24 : Rat) / 5) [(5, 1), (7, 2), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 26. -/
theorem rs_R006_ueqv_R006_partial_26_0202_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_26_0202
        rs_R006_ueqv_R006_generator_26_0200_0277 =
      rs_R006_ueqv_R006_partial_26_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 26. -/
def rs_R006_ueqv_R006_coefficient_26_0203 : Poly :=
[
  term ((24 : Rat) / 5) [(5, 1), (11, 1), (12, 1), (14, 1)]
]

/-- Partial product 203 for generator 26. -/
def rs_R006_ueqv_R006_partial_26_0203 : Poly :=
[
  term ((-48 : Rat) / 5) [(0, 1), (5, 1), (11, 1), (12, 2), (14, 1)],
  term ((24 : Rat) / 5) [(0, 2), (5, 1), (11, 1), (12, 1), (14, 1)],
  term ((-48 : Rat) / 5) [(1, 1), (5, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((24 : Rat) / 5) [(1, 2), (5, 1), (11, 1), (12, 1), (14, 1)],
  term ((48 : Rat) / 5) [(5, 1), (6, 1), (11, 1), (12, 2), (14, 1)],
  term ((-24 : Rat) / 5) [(5, 1), (6, 2), (11, 1), (12, 1), (14, 1)],
  term ((48 : Rat) / 5) [(5, 1), (7, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-24 : Rat) / 5) [(5, 1), (7, 2), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 26. -/
theorem rs_R006_ueqv_R006_partial_26_0203_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_26_0203
        rs_R006_ueqv_R006_generator_26_0200_0277 =
      rs_R006_ueqv_R006_partial_26_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 26. -/
def rs_R006_ueqv_R006_coefficient_26_0204 : Poly :=
[
  term ((1728 : Rat) / 35) [(5, 1), (11, 1), (13, 2)]
]

/-- Partial product 204 for generator 26. -/
def rs_R006_ueqv_R006_partial_26_0204 : Poly :=
[
  term ((-3456 : Rat) / 35) [(0, 1), (5, 1), (11, 1), (12, 1), (13, 2)],
  term ((1728 : Rat) / 35) [(0, 2), (5, 1), (11, 1), (13, 2)],
  term ((-3456 : Rat) / 35) [(1, 1), (5, 1), (11, 1), (13, 3)],
  term ((1728 : Rat) / 35) [(1, 2), (5, 1), (11, 1), (13, 2)],
  term ((3456 : Rat) / 35) [(5, 1), (6, 1), (11, 1), (12, 1), (13, 2)],
  term ((-1728 : Rat) / 35) [(5, 1), (6, 2), (11, 1), (13, 2)],
  term ((3456 : Rat) / 35) [(5, 1), (7, 1), (11, 1), (13, 3)],
  term ((-1728 : Rat) / 35) [(5, 1), (7, 2), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 26. -/
theorem rs_R006_ueqv_R006_partial_26_0204_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_26_0204
        rs_R006_ueqv_R006_generator_26_0200_0277 =
      rs_R006_ueqv_R006_partial_26_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 26. -/
def rs_R006_ueqv_R006_coefficient_26_0205 : Poly :=
[
  term ((-1248 : Rat) / 35) [(5, 1), (11, 2), (13, 1)]
]

/-- Partial product 205 for generator 26. -/
def rs_R006_ueqv_R006_partial_26_0205 : Poly :=
[
  term ((2496 : Rat) / 35) [(0, 1), (5, 1), (11, 2), (12, 1), (13, 1)],
  term ((-1248 : Rat) / 35) [(0, 2), (5, 1), (11, 2), (13, 1)],
  term ((2496 : Rat) / 35) [(1, 1), (5, 1), (11, 2), (13, 2)],
  term ((-1248 : Rat) / 35) [(1, 2), (5, 1), (11, 2), (13, 1)],
  term ((-2496 : Rat) / 35) [(5, 1), (6, 1), (11, 2), (12, 1), (13, 1)],
  term ((1248 : Rat) / 35) [(5, 1), (6, 2), (11, 2), (13, 1)],
  term ((-2496 : Rat) / 35) [(5, 1), (7, 1), (11, 2), (13, 2)],
  term ((1248 : Rat) / 35) [(5, 1), (7, 2), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 26. -/
theorem rs_R006_ueqv_R006_partial_26_0205_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_26_0205
        rs_R006_ueqv_R006_generator_26_0200_0277 =
      rs_R006_ueqv_R006_partial_26_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 26. -/
def rs_R006_ueqv_R006_coefficient_26_0206 : Poly :=
[
  term ((492 : Rat) / 35) [(5, 1), (13, 1)]
]

/-- Partial product 206 for generator 26. -/
def rs_R006_ueqv_R006_partial_26_0206 : Poly :=
[
  term ((-984 : Rat) / 35) [(0, 1), (5, 1), (12, 1), (13, 1)],
  term ((492 : Rat) / 35) [(0, 2), (5, 1), (13, 1)],
  term ((-984 : Rat) / 35) [(1, 1), (5, 1), (13, 2)],
  term ((492 : Rat) / 35) [(1, 2), (5, 1), (13, 1)],
  term ((984 : Rat) / 35) [(5, 1), (6, 1), (12, 1), (13, 1)],
  term ((-492 : Rat) / 35) [(5, 1), (6, 2), (13, 1)],
  term ((984 : Rat) / 35) [(5, 1), (7, 1), (13, 2)],
  term ((-492 : Rat) / 35) [(5, 1), (7, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 26. -/
theorem rs_R006_ueqv_R006_partial_26_0206_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_26_0206
        rs_R006_ueqv_R006_generator_26_0200_0277 =
      rs_R006_ueqv_R006_partial_26_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 26. -/
def rs_R006_ueqv_R006_coefficient_26_0207 : Poly :=
[
  term (-12 : Rat) [(5, 1), (13, 1), (14, 1)]
]

/-- Partial product 207 for generator 26. -/
def rs_R006_ueqv_R006_partial_26_0207 : Poly :=
[
  term (24 : Rat) [(0, 1), (5, 1), (12, 1), (13, 1), (14, 1)],
  term (-12 : Rat) [(0, 2), (5, 1), (13, 1), (14, 1)],
  term (24 : Rat) [(1, 1), (5, 1), (13, 2), (14, 1)],
  term (-12 : Rat) [(1, 2), (5, 1), (13, 1), (14, 1)],
  term (-24 : Rat) [(5, 1), (6, 1), (12, 1), (13, 1), (14, 1)],
  term (12 : Rat) [(5, 1), (6, 2), (13, 1), (14, 1)],
  term (-24 : Rat) [(5, 1), (7, 1), (13, 2), (14, 1)],
  term (12 : Rat) [(5, 1), (7, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 26. -/
theorem rs_R006_ueqv_R006_partial_26_0207_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_26_0207
        rs_R006_ueqv_R006_generator_26_0200_0277 =
      rs_R006_ueqv_R006_partial_26_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 26. -/
def rs_R006_ueqv_R006_coefficient_26_0208 : Poly :=
[
  term ((24 : Rat) / 5) [(5, 1), (14, 1), (15, 1)]
]

/-- Partial product 208 for generator 26. -/
def rs_R006_ueqv_R006_partial_26_0208 : Poly :=
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
/-- Checked partial-product identity 208 for generator 26. -/
theorem rs_R006_ueqv_R006_partial_26_0208_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_26_0208
        rs_R006_ueqv_R006_generator_26_0200_0277 =
      rs_R006_ueqv_R006_partial_26_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 26. -/
def rs_R006_ueqv_R006_coefficient_26_0209 : Poly :=
[
  term ((-24 : Rat) / 5) [(5, 1), (15, 1)]
]

/-- Partial product 209 for generator 26. -/
def rs_R006_ueqv_R006_partial_26_0209 : Poly :=
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
/-- Checked partial-product identity 209 for generator 26. -/
theorem rs_R006_ueqv_R006_partial_26_0209_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_26_0209
        rs_R006_ueqv_R006_generator_26_0200_0277 =
      rs_R006_ueqv_R006_partial_26_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 26. -/
def rs_R006_ueqv_R006_coefficient_26_0210 : Poly :=
[
  term ((36 : Rat) / 35) [(7, 1), (8, 1), (13, 1)]
]

/-- Partial product 210 for generator 26. -/
def rs_R006_ueqv_R006_partial_26_0210 : Poly :=
[
  term ((-72 : Rat) / 35) [(0, 1), (7, 1), (8, 1), (12, 1), (13, 1)],
  term ((36 : Rat) / 35) [(0, 2), (7, 1), (8, 1), (13, 1)],
  term ((-72 : Rat) / 35) [(1, 1), (7, 1), (8, 1), (13, 2)],
  term ((36 : Rat) / 35) [(1, 2), (7, 1), (8, 1), (13, 1)],
  term ((72 : Rat) / 35) [(6, 1), (7, 1), (8, 1), (12, 1), (13, 1)],
  term ((-36 : Rat) / 35) [(6, 2), (7, 1), (8, 1), (13, 1)],
  term ((72 : Rat) / 35) [(7, 2), (8, 1), (13, 2)],
  term ((-36 : Rat) / 35) [(7, 3), (8, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 26. -/
theorem rs_R006_ueqv_R006_partial_26_0210_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_26_0210
        rs_R006_ueqv_R006_generator_26_0200_0277 =
      rs_R006_ueqv_R006_partial_26_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 26. -/
def rs_R006_ueqv_R006_coefficient_26_0211 : Poly :=
[
  term ((72 : Rat) / 35) [(7, 1), (9, 1), (11, 1), (13, 1)]
]

/-- Partial product 211 for generator 26. -/
def rs_R006_ueqv_R006_partial_26_0211 : Poly :=
[
  term ((-144 : Rat) / 35) [(0, 1), (7, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((72 : Rat) / 35) [(0, 2), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-144 : Rat) / 35) [(1, 1), (7, 1), (9, 1), (11, 1), (13, 2)],
  term ((72 : Rat) / 35) [(1, 2), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((144 : Rat) / 35) [(6, 1), (7, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((-72 : Rat) / 35) [(6, 2), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((144 : Rat) / 35) [(7, 2), (9, 1), (11, 1), (13, 2)],
  term ((-72 : Rat) / 35) [(7, 3), (9, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 26. -/
theorem rs_R006_ueqv_R006_partial_26_0211_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_26_0211
        rs_R006_ueqv_R006_generator_26_0200_0277 =
      rs_R006_ueqv_R006_partial_26_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 26. -/
def rs_R006_ueqv_R006_coefficient_26_0212 : Poly :=
[
  term ((-36 : Rat) / 5) [(7, 1), (11, 1)]
]

/-- Partial product 212 for generator 26. -/
def rs_R006_ueqv_R006_partial_26_0212 : Poly :=
[
  term ((72 : Rat) / 5) [(0, 1), (7, 1), (11, 1), (12, 1)],
  term ((-36 : Rat) / 5) [(0, 2), (7, 1), (11, 1)],
  term ((72 : Rat) / 5) [(1, 1), (7, 1), (11, 1), (13, 1)],
  term ((-36 : Rat) / 5) [(1, 2), (7, 1), (11, 1)],
  term ((-72 : Rat) / 5) [(6, 1), (7, 1), (11, 1), (12, 1)],
  term ((36 : Rat) / 5) [(6, 2), (7, 1), (11, 1)],
  term ((-72 : Rat) / 5) [(7, 2), (11, 1), (13, 1)],
  term ((36 : Rat) / 5) [(7, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 26. -/
theorem rs_R006_ueqv_R006_partial_26_0212_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_26_0212
        rs_R006_ueqv_R006_generator_26_0200_0277 =
      rs_R006_ueqv_R006_partial_26_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 26. -/
def rs_R006_ueqv_R006_coefficient_26_0213 : Poly :=
[
  term ((48 : Rat) / 5) [(7, 1), (11, 1), (14, 1)]
]

/-- Partial product 213 for generator 26. -/
def rs_R006_ueqv_R006_partial_26_0213 : Poly :=
[
  term ((-96 : Rat) / 5) [(0, 1), (7, 1), (11, 1), (12, 1), (14, 1)],
  term ((48 : Rat) / 5) [(0, 2), (7, 1), (11, 1), (14, 1)],
  term ((-96 : Rat) / 5) [(1, 1), (7, 1), (11, 1), (13, 1), (14, 1)],
  term ((48 : Rat) / 5) [(1, 2), (7, 1), (11, 1), (14, 1)],
  term ((96 : Rat) / 5) [(6, 1), (7, 1), (11, 1), (12, 1), (14, 1)],
  term ((-48 : Rat) / 5) [(6, 2), (7, 1), (11, 1), (14, 1)],
  term ((96 : Rat) / 5) [(7, 2), (11, 1), (13, 1), (14, 1)],
  term ((-48 : Rat) / 5) [(7, 3), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 26. -/
theorem rs_R006_ueqv_R006_partial_26_0213_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_26_0213
        rs_R006_ueqv_R006_generator_26_0200_0277 =
      rs_R006_ueqv_R006_partial_26_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 26. -/
def rs_R006_ueqv_R006_coefficient_26_0214 : Poly :=
[
  term ((-5112 : Rat) / 35) [(7, 1), (13, 1)]
]

/-- Partial product 214 for generator 26. -/
def rs_R006_ueqv_R006_partial_26_0214 : Poly :=
[
  term ((10224 : Rat) / 35) [(0, 1), (7, 1), (12, 1), (13, 1)],
  term ((-5112 : Rat) / 35) [(0, 2), (7, 1), (13, 1)],
  term ((10224 : Rat) / 35) [(1, 1), (7, 1), (13, 2)],
  term ((-5112 : Rat) / 35) [(1, 2), (7, 1), (13, 1)],
  term ((-10224 : Rat) / 35) [(6, 1), (7, 1), (12, 1), (13, 1)],
  term ((5112 : Rat) / 35) [(6, 2), (7, 1), (13, 1)],
  term ((-10224 : Rat) / 35) [(7, 2), (13, 2)],
  term ((5112 : Rat) / 35) [(7, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 26. -/
theorem rs_R006_ueqv_R006_partial_26_0214_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_26_0214
        rs_R006_ueqv_R006_generator_26_0200_0277 =
      rs_R006_ueqv_R006_partial_26_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 26. -/
def rs_R006_ueqv_R006_coefficient_26_0215 : Poly :=
[
  term ((1464 : Rat) / 5) [(7, 1), (13, 1), (14, 1)]
]

/-- Partial product 215 for generator 26. -/
def rs_R006_ueqv_R006_partial_26_0215 : Poly :=
[
  term ((-2928 : Rat) / 5) [(0, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((1464 : Rat) / 5) [(0, 2), (7, 1), (13, 1), (14, 1)],
  term ((-2928 : Rat) / 5) [(1, 1), (7, 1), (13, 2), (14, 1)],
  term ((1464 : Rat) / 5) [(1, 2), (7, 1), (13, 1), (14, 1)],
  term ((2928 : Rat) / 5) [(6, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((-1464 : Rat) / 5) [(6, 2), (7, 1), (13, 1), (14, 1)],
  term ((2928 : Rat) / 5) [(7, 2), (13, 2), (14, 1)],
  term ((-1464 : Rat) / 5) [(7, 3), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 26. -/
theorem rs_R006_ueqv_R006_partial_26_0215_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_26_0215
        rs_R006_ueqv_R006_generator_26_0200_0277 =
      rs_R006_ueqv_R006_partial_26_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 26. -/
def rs_R006_ueqv_R006_coefficient_26_0216 : Poly :=
[
  term (-96 : Rat) [(7, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 216 for generator 26. -/
def rs_R006_ueqv_R006_partial_26_0216 : Poly :=
[
  term (192 : Rat) [(0, 1), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term (-96 : Rat) [(0, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term (192 : Rat) [(1, 1), (7, 1), (13, 2), (14, 1), (16, 1)],
  term (-96 : Rat) [(1, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term (-192 : Rat) [(6, 1), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term (96 : Rat) [(6, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term (-192 : Rat) [(7, 2), (13, 2), (14, 1), (16, 1)],
  term (96 : Rat) [(7, 3), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 26. -/
theorem rs_R006_ueqv_R006_partial_26_0216_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_26_0216
        rs_R006_ueqv_R006_generator_26_0200_0277 =
      rs_R006_ueqv_R006_partial_26_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 26. -/
def rs_R006_ueqv_R006_coefficient_26_0217 : Poly :=
[
  term (48 : Rat) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 217 for generator 26. -/
def rs_R006_ueqv_R006_partial_26_0217 : Poly :=
[
  term (-96 : Rat) [(0, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term (48 : Rat) [(0, 2), (7, 1), (13, 1), (16, 1)],
  term (-96 : Rat) [(1, 1), (7, 1), (13, 2), (16, 1)],
  term (48 : Rat) [(1, 2), (7, 1), (13, 1), (16, 1)],
  term (96 : Rat) [(6, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term (-48 : Rat) [(6, 2), (7, 1), (13, 1), (16, 1)],
  term (96 : Rat) [(7, 2), (13, 2), (16, 1)],
  term (-48 : Rat) [(7, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 26. -/
theorem rs_R006_ueqv_R006_partial_26_0217_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_26_0217
        rs_R006_ueqv_R006_generator_26_0200_0277 =
      rs_R006_ueqv_R006_partial_26_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 26. -/
def rs_R006_ueqv_R006_coefficient_26_0218 : Poly :=
[
  term ((-12 : Rat) / 5) [(7, 1), (14, 1), (15, 1)]
]

/-- Partial product 218 for generator 26. -/
def rs_R006_ueqv_R006_partial_26_0218 : Poly :=
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
/-- Checked partial-product identity 218 for generator 26. -/
theorem rs_R006_ueqv_R006_partial_26_0218_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_26_0218
        rs_R006_ueqv_R006_generator_26_0200_0277 =
      rs_R006_ueqv_R006_partial_26_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 26. -/
def rs_R006_ueqv_R006_coefficient_26_0219 : Poly :=
[
  term ((-1428 : Rat) / 5) [(7, 1), (15, 1)]
]

/-- Partial product 219 for generator 26. -/
def rs_R006_ueqv_R006_partial_26_0219 : Poly :=
[
  term ((2856 : Rat) / 5) [(0, 1), (7, 1), (12, 1), (15, 1)],
  term ((-1428 : Rat) / 5) [(0, 2), (7, 1), (15, 1)],
  term ((2856 : Rat) / 5) [(1, 1), (7, 1), (13, 1), (15, 1)],
  term ((-1428 : Rat) / 5) [(1, 2), (7, 1), (15, 1)],
  term ((-2856 : Rat) / 5) [(6, 1), (7, 1), (12, 1), (15, 1)],
  term ((1428 : Rat) / 5) [(6, 2), (7, 1), (15, 1)],
  term ((-2856 : Rat) / 5) [(7, 2), (13, 1), (15, 1)],
  term ((1428 : Rat) / 5) [(7, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 26. -/
theorem rs_R006_ueqv_R006_partial_26_0219_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_26_0219
        rs_R006_ueqv_R006_generator_26_0200_0277 =
      rs_R006_ueqv_R006_partial_26_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 26. -/
def rs_R006_ueqv_R006_coefficient_26_0220 : Poly :=
[
  term (96 : Rat) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 220 for generator 26. -/
def rs_R006_ueqv_R006_partial_26_0220 : Poly :=
[
  term (-192 : Rat) [(0, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term (96 : Rat) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term (-192 : Rat) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term (96 : Rat) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term (192 : Rat) [(6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term (-96 : Rat) [(6, 2), (7, 1), (15, 1), (16, 1)],
  term (192 : Rat) [(7, 2), (13, 1), (15, 1), (16, 1)],
  term (-96 : Rat) [(7, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 26. -/
theorem rs_R006_ueqv_R006_partial_26_0220_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_26_0220
        rs_R006_ueqv_R006_generator_26_0200_0277 =
      rs_R006_ueqv_R006_partial_26_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 26. -/
def rs_R006_ueqv_R006_coefficient_26_0221 : Poly :=
[
  term ((-612 : Rat) / 7) [(8, 1), (11, 1), (13, 1)]
]

/-- Partial product 221 for generator 26. -/
def rs_R006_ueqv_R006_partial_26_0221 : Poly :=
[
  term ((1224 : Rat) / 7) [(0, 1), (8, 1), (11, 1), (12, 1), (13, 1)],
  term ((-612 : Rat) / 7) [(0, 2), (8, 1), (11, 1), (13, 1)],
  term ((1224 : Rat) / 7) [(1, 1), (8, 1), (11, 1), (13, 2)],
  term ((-612 : Rat) / 7) [(1, 2), (8, 1), (11, 1), (13, 1)],
  term ((-1224 : Rat) / 7) [(6, 1), (8, 1), (11, 1), (12, 1), (13, 1)],
  term ((612 : Rat) / 7) [(6, 2), (8, 1), (11, 1), (13, 1)],
  term ((-1224 : Rat) / 7) [(7, 1), (8, 1), (11, 1), (13, 2)],
  term ((612 : Rat) / 7) [(7, 2), (8, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 26. -/
theorem rs_R006_ueqv_R006_partial_26_0221_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_26_0221
        rs_R006_ueqv_R006_generator_26_0200_0277 =
      rs_R006_ueqv_R006_partial_26_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 26. -/
def rs_R006_ueqv_R006_coefficient_26_0222 : Poly :=
[
  term ((864 : Rat) / 5) [(8, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 222 for generator 26. -/
def rs_R006_ueqv_R006_partial_26_0222 : Poly :=
[
  term ((-1728 : Rat) / 5) [(0, 1), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((864 : Rat) / 5) [(0, 2), (8, 1), (11, 1), (13, 1), (14, 1)],
  term ((-1728 : Rat) / 5) [(1, 1), (8, 1), (11, 1), (13, 2), (14, 1)],
  term ((864 : Rat) / 5) [(1, 2), (8, 1), (11, 1), (13, 1), (14, 1)],
  term ((1728 : Rat) / 5) [(6, 1), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-864 : Rat) / 5) [(6, 2), (8, 1), (11, 1), (13, 1), (14, 1)],
  term ((1728 : Rat) / 5) [(7, 1), (8, 1), (11, 1), (13, 2), (14, 1)],
  term ((-864 : Rat) / 5) [(7, 2), (8, 1), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 26. -/
theorem rs_R006_ueqv_R006_partial_26_0222_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_26_0222
        rs_R006_ueqv_R006_generator_26_0200_0277 =
      rs_R006_ueqv_R006_partial_26_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 26. -/
def rs_R006_ueqv_R006_coefficient_26_0223 : Poly :=
[
  term ((-288 : Rat) / 5) [(8, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 223 for generator 26. -/
def rs_R006_ueqv_R006_partial_26_0223 : Poly :=
[
  term ((576 : Rat) / 5) [(0, 1), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(0, 2), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((576 : Rat) / 5) [(1, 1), (8, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(1, 2), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-576 : Rat) / 5) [(6, 1), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((288 : Rat) / 5) [(6, 2), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-576 : Rat) / 5) [(7, 1), (8, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((288 : Rat) / 5) [(7, 2), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 26. -/
theorem rs_R006_ueqv_R006_partial_26_0223_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_26_0223
        rs_R006_ueqv_R006_generator_26_0200_0277 =
      rs_R006_ueqv_R006_partial_26_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 26. -/
def rs_R006_ueqv_R006_coefficient_26_0224 : Poly :=
[
  term ((144 : Rat) / 5) [(8, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 224 for generator 26. -/
def rs_R006_ueqv_R006_partial_26_0224 : Poly :=
[
  term ((-288 : Rat) / 5) [(0, 1), (8, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((144 : Rat) / 5) [(0, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(1, 1), (8, 1), (11, 1), (13, 2), (16, 1)],
  term ((144 : Rat) / 5) [(1, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((288 : Rat) / 5) [(6, 1), (8, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-144 : Rat) / 5) [(6, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((288 : Rat) / 5) [(7, 1), (8, 1), (11, 1), (13, 2), (16, 1)],
  term ((-144 : Rat) / 5) [(7, 2), (8, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 26. -/
theorem rs_R006_ueqv_R006_partial_26_0224_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_26_0224
        rs_R006_ueqv_R006_generator_26_0200_0277 =
      rs_R006_ueqv_R006_partial_26_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 26. -/
def rs_R006_ueqv_R006_coefficient_26_0225 : Poly :=
[
  term ((-864 : Rat) / 5) [(8, 1), (11, 1), (15, 1)]
]

/-- Partial product 225 for generator 26. -/
def rs_R006_ueqv_R006_partial_26_0225 : Poly :=
[
  term ((1728 : Rat) / 5) [(0, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-864 : Rat) / 5) [(0, 2), (8, 1), (11, 1), (15, 1)],
  term ((1728 : Rat) / 5) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-864 : Rat) / 5) [(1, 2), (8, 1), (11, 1), (15, 1)],
  term ((-1728 : Rat) / 5) [(6, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((864 : Rat) / 5) [(6, 2), (8, 1), (11, 1), (15, 1)],
  term ((-1728 : Rat) / 5) [(7, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((864 : Rat) / 5) [(7, 2), (8, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 26. -/
theorem rs_R006_ueqv_R006_partial_26_0225_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_26_0225
        rs_R006_ueqv_R006_generator_26_0200_0277 =
      rs_R006_ueqv_R006_partial_26_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 26. -/
def rs_R006_ueqv_R006_coefficient_26_0226 : Poly :=
[
  term ((288 : Rat) / 5) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 226 for generator 26. -/
def rs_R006_ueqv_R006_partial_26_0226 : Poly :=
[
  term ((-576 : Rat) / 5) [(0, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((288 : Rat) / 5) [(0, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-576 : Rat) / 5) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((288 : Rat) / 5) [(1, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((576 : Rat) / 5) [(6, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(6, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((576 : Rat) / 5) [(7, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(7, 2), (8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 26. -/
theorem rs_R006_ueqv_R006_partial_26_0226_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_26_0226
        rs_R006_ueqv_R006_generator_26_0200_0277 =
      rs_R006_ueqv_R006_partial_26_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 26. -/
def rs_R006_ueqv_R006_coefficient_26_0227 : Poly :=
[
  term ((-552 : Rat) / 5) [(9, 1), (11, 1)]
]

/-- Partial product 227 for generator 26. -/
def rs_R006_ueqv_R006_partial_26_0227 : Poly :=
[
  term ((1104 : Rat) / 5) [(0, 1), (9, 1), (11, 1), (12, 1)],
  term ((-552 : Rat) / 5) [(0, 2), (9, 1), (11, 1)],
  term ((1104 : Rat) / 5) [(1, 1), (9, 1), (11, 1), (13, 1)],
  term ((-552 : Rat) / 5) [(1, 2), (9, 1), (11, 1)],
  term ((-1104 : Rat) / 5) [(6, 1), (9, 1), (11, 1), (12, 1)],
  term ((552 : Rat) / 5) [(6, 2), (9, 1), (11, 1)],
  term ((-1104 : Rat) / 5) [(7, 1), (9, 1), (11, 1), (13, 1)],
  term ((552 : Rat) / 5) [(7, 2), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 26. -/
theorem rs_R006_ueqv_R006_partial_26_0227_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_26_0227
        rs_R006_ueqv_R006_generator_26_0200_0277 =
      rs_R006_ueqv_R006_partial_26_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 26. -/
def rs_R006_ueqv_R006_coefficient_26_0228 : Poly :=
[
  term ((10368 : Rat) / 5) [(9, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 228 for generator 26. -/
def rs_R006_ueqv_R006_partial_26_0228 : Poly :=
[
  term ((-20736 : Rat) / 5) [(0, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((10368 : Rat) / 5) [(0, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-20736 : Rat) / 5) [(1, 1), (9, 1), (11, 1), (13, 2), (15, 1)],
  term ((10368 : Rat) / 5) [(1, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((20736 : Rat) / 5) [(6, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-10368 : Rat) / 5) [(6, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((20736 : Rat) / 5) [(7, 1), (9, 1), (11, 1), (13, 2), (15, 1)],
  term ((-10368 : Rat) / 5) [(7, 2), (9, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 26. -/
theorem rs_R006_ueqv_R006_partial_26_0228_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_26_0228
        rs_R006_ueqv_R006_generator_26_0200_0277 =
      rs_R006_ueqv_R006_partial_26_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 26. -/
def rs_R006_ueqv_R006_coefficient_26_0229 : Poly :=
[
  term ((-3456 : Rat) / 5) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 229 for generator 26. -/
def rs_R006_ueqv_R006_partial_26_0229 : Poly :=
[
  term ((6912 : Rat) / 5) [(0, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3456 : Rat) / 5) [(0, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((6912 : Rat) / 5) [(1, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-3456 : Rat) / 5) [(1, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6912 : Rat) / 5) [(6, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((3456 : Rat) / 5) [(6, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6912 : Rat) / 5) [(7, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((3456 : Rat) / 5) [(7, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 26. -/
theorem rs_R006_ueqv_R006_partial_26_0229_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_26_0229
        rs_R006_ueqv_R006_generator_26_0200_0277 =
      rs_R006_ueqv_R006_partial_26_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 26. -/
def rs_R006_ueqv_R006_coefficient_26_0230 : Poly :=
[
  term ((6912 : Rat) / 7) [(9, 1), (11, 1), (13, 2)]
]

/-- Partial product 230 for generator 26. -/
def rs_R006_ueqv_R006_partial_26_0230 : Poly :=
[
  term ((-13824 : Rat) / 7) [(0, 1), (9, 1), (11, 1), (12, 1), (13, 2)],
  term ((6912 : Rat) / 7) [(0, 2), (9, 1), (11, 1), (13, 2)],
  term ((-13824 : Rat) / 7) [(1, 1), (9, 1), (11, 1), (13, 3)],
  term ((6912 : Rat) / 7) [(1, 2), (9, 1), (11, 1), (13, 2)],
  term ((13824 : Rat) / 7) [(6, 1), (9, 1), (11, 1), (12, 1), (13, 2)],
  term ((-6912 : Rat) / 7) [(6, 2), (9, 1), (11, 1), (13, 2)],
  term ((13824 : Rat) / 7) [(7, 1), (9, 1), (11, 1), (13, 3)],
  term ((-6912 : Rat) / 7) [(7, 2), (9, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 26. -/
theorem rs_R006_ueqv_R006_partial_26_0230_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_26_0230
        rs_R006_ueqv_R006_generator_26_0200_0277 =
      rs_R006_ueqv_R006_partial_26_0230 := by
  native_decide

/-- Coefficient term 231 from coefficient polynomial 26. -/
def rs_R006_ueqv_R006_coefficient_26_0231 : Poly :=
[
  term ((-10368 : Rat) / 5) [(9, 1), (11, 1), (13, 2), (14, 1)]
]

/-- Partial product 231 for generator 26. -/
def rs_R006_ueqv_R006_partial_26_0231 : Poly :=
[
  term ((20736 : Rat) / 5) [(0, 1), (9, 1), (11, 1), (12, 1), (13, 2), (14, 1)],
  term ((-10368 : Rat) / 5) [(0, 2), (9, 1), (11, 1), (13, 2), (14, 1)],
  term ((20736 : Rat) / 5) [(1, 1), (9, 1), (11, 1), (13, 3), (14, 1)],
  term ((-10368 : Rat) / 5) [(1, 2), (9, 1), (11, 1), (13, 2), (14, 1)],
  term ((-20736 : Rat) / 5) [(6, 1), (9, 1), (11, 1), (12, 1), (13, 2), (14, 1)],
  term ((10368 : Rat) / 5) [(6, 2), (9, 1), (11, 1), (13, 2), (14, 1)],
  term ((-20736 : Rat) / 5) [(7, 1), (9, 1), (11, 1), (13, 3), (14, 1)],
  term ((10368 : Rat) / 5) [(7, 2), (9, 1), (11, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 231 for generator 26. -/
theorem rs_R006_ueqv_R006_partial_26_0231_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_26_0231
        rs_R006_ueqv_R006_generator_26_0200_0277 =
      rs_R006_ueqv_R006_partial_26_0231 := by
  native_decide

/-- Coefficient term 232 from coefficient polynomial 26. -/
def rs_R006_ueqv_R006_coefficient_26_0232 : Poly :=
[
  term ((3456 : Rat) / 5) [(9, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 232 for generator 26. -/
def rs_R006_ueqv_R006_partial_26_0232 : Poly :=
[
  term ((-6912 : Rat) / 5) [(0, 1), (9, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((3456 : Rat) / 5) [(0, 2), (9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-6912 : Rat) / 5) [(1, 1), (9, 1), (11, 1), (13, 3), (14, 1), (16, 1)],
  term ((3456 : Rat) / 5) [(1, 2), (9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((6912 : Rat) / 5) [(6, 1), (9, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-3456 : Rat) / 5) [(6, 2), (9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((6912 : Rat) / 5) [(7, 1), (9, 1), (11, 1), (13, 3), (14, 1), (16, 1)],
  term ((-3456 : Rat) / 5) [(7, 2), (9, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 232 for generator 26. -/
theorem rs_R006_ueqv_R006_partial_26_0232_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_26_0232
        rs_R006_ueqv_R006_generator_26_0200_0277 =
      rs_R006_ueqv_R006_partial_26_0232 := by
  native_decide

/-- Coefficient term 233 from coefficient polynomial 26. -/
def rs_R006_ueqv_R006_coefficient_26_0233 : Poly :=
[
  term ((-1728 : Rat) / 5) [(9, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 233 for generator 26. -/
def rs_R006_ueqv_R006_partial_26_0233 : Poly :=
[
  term ((3456 : Rat) / 5) [(0, 1), (9, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-1728 : Rat) / 5) [(0, 2), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((3456 : Rat) / 5) [(1, 1), (9, 1), (11, 1), (13, 3), (16, 1)],
  term ((-1728 : Rat) / 5) [(1, 2), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-3456 : Rat) / 5) [(6, 1), (9, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((1728 : Rat) / 5) [(6, 2), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-3456 : Rat) / 5) [(7, 1), (9, 1), (11, 1), (13, 3), (16, 1)],
  term ((1728 : Rat) / 5) [(7, 2), (9, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 233 for generator 26. -/
theorem rs_R006_ueqv_R006_partial_26_0233_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_26_0233
        rs_R006_ueqv_R006_generator_26_0200_0277 =
      rs_R006_ueqv_R006_partial_26_0233 := by
  native_decide

/-- Coefficient term 234 from coefficient polynomial 26. -/
def rs_R006_ueqv_R006_coefficient_26_0234 : Poly :=
[
  term ((432 : Rat) / 5) [(9, 1), (11, 1), (14, 1)]
]

/-- Partial product 234 for generator 26. -/
def rs_R006_ueqv_R006_partial_26_0234 : Poly :=
[
  term ((-864 : Rat) / 5) [(0, 1), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((432 : Rat) / 5) [(0, 2), (9, 1), (11, 1), (14, 1)],
  term ((-864 : Rat) / 5) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((432 : Rat) / 5) [(1, 2), (9, 1), (11, 1), (14, 1)],
  term ((864 : Rat) / 5) [(6, 1), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((-432 : Rat) / 5) [(6, 2), (9, 1), (11, 1), (14, 1)],
  term ((864 : Rat) / 5) [(7, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((-432 : Rat) / 5) [(7, 2), (9, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 234 for generator 26. -/
theorem rs_R006_ueqv_R006_partial_26_0234_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_26_0234
        rs_R006_ueqv_R006_generator_26_0200_0277 =
      rs_R006_ueqv_R006_partial_26_0234 := by
  native_decide

/-- Coefficient term 235 from coefficient polynomial 26. -/
def rs_R006_ueqv_R006_coefficient_26_0235 : Poly :=
[
  term ((-22152 : Rat) / 35) [(9, 1), (11, 2), (13, 1)]
]

/-- Partial product 235 for generator 26. -/
def rs_R006_ueqv_R006_partial_26_0235 : Poly :=
[
  term ((44304 : Rat) / 35) [(0, 1), (9, 1), (11, 2), (12, 1), (13, 1)],
  term ((-22152 : Rat) / 35) [(0, 2), (9, 1), (11, 2), (13, 1)],
  term ((44304 : Rat) / 35) [(1, 1), (9, 1), (11, 2), (13, 2)],
  term ((-22152 : Rat) / 35) [(1, 2), (9, 1), (11, 2), (13, 1)],
  term ((-44304 : Rat) / 35) [(6, 1), (9, 1), (11, 2), (12, 1), (13, 1)],
  term ((22152 : Rat) / 35) [(6, 2), (9, 1), (11, 2), (13, 1)],
  term ((-44304 : Rat) / 35) [(7, 1), (9, 1), (11, 2), (13, 2)],
  term ((22152 : Rat) / 35) [(7, 2), (9, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 235 for generator 26. -/
theorem rs_R006_ueqv_R006_partial_26_0235_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_26_0235
        rs_R006_ueqv_R006_generator_26_0200_0277 =
      rs_R006_ueqv_R006_partial_26_0235 := by
  native_decide

/-- Coefficient term 236 from coefficient polynomial 26. -/
def rs_R006_ueqv_R006_coefficient_26_0236 : Poly :=
[
  term ((6624 : Rat) / 5) [(9, 1), (11, 2), (13, 1), (14, 1)]
]

/-- Partial product 236 for generator 26. -/
def rs_R006_ueqv_R006_partial_26_0236 : Poly :=
[
  term ((-13248 : Rat) / 5) [(0, 1), (9, 1), (11, 2), (12, 1), (13, 1), (14, 1)],
  term ((6624 : Rat) / 5) [(0, 2), (9, 1), (11, 2), (13, 1), (14, 1)],
  term ((-13248 : Rat) / 5) [(1, 1), (9, 1), (11, 2), (13, 2), (14, 1)],
  term ((6624 : Rat) / 5) [(1, 2), (9, 1), (11, 2), (13, 1), (14, 1)],
  term ((13248 : Rat) / 5) [(6, 1), (9, 1), (11, 2), (12, 1), (13, 1), (14, 1)],
  term ((-6624 : Rat) / 5) [(6, 2), (9, 1), (11, 2), (13, 1), (14, 1)],
  term ((13248 : Rat) / 5) [(7, 1), (9, 1), (11, 2), (13, 2), (14, 1)],
  term ((-6624 : Rat) / 5) [(7, 2), (9, 1), (11, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 236 for generator 26. -/
theorem rs_R006_ueqv_R006_partial_26_0236_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_26_0236
        rs_R006_ueqv_R006_generator_26_0200_0277 =
      rs_R006_ueqv_R006_partial_26_0236 := by
  native_decide

/-- Coefficient term 237 from coefficient polynomial 26. -/
def rs_R006_ueqv_R006_coefficient_26_0237 : Poly :=
[
  term ((-2208 : Rat) / 5) [(9, 1), (11, 2), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 237 for generator 26. -/
def rs_R006_ueqv_R006_partial_26_0237 : Poly :=
[
  term ((4416 : Rat) / 5) [(0, 1), (9, 1), (11, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2208 : Rat) / 5) [(0, 2), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((4416 : Rat) / 5) [(1, 1), (9, 1), (11, 2), (13, 2), (14, 1), (16, 1)],
  term ((-2208 : Rat) / 5) [(1, 2), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-4416 : Rat) / 5) [(6, 1), (9, 1), (11, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((2208 : Rat) / 5) [(6, 2), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-4416 : Rat) / 5) [(7, 1), (9, 1), (11, 2), (13, 2), (14, 1), (16, 1)],
  term ((2208 : Rat) / 5) [(7, 2), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 237 for generator 26. -/
theorem rs_R006_ueqv_R006_partial_26_0237_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_26_0237
        rs_R006_ueqv_R006_generator_26_0200_0277 =
      rs_R006_ueqv_R006_partial_26_0237 := by
  native_decide

/-- Coefficient term 238 from coefficient polynomial 26. -/
def rs_R006_ueqv_R006_coefficient_26_0238 : Poly :=
[
  term ((1104 : Rat) / 5) [(9, 1), (11, 2), (13, 1), (16, 1)]
]

/-- Partial product 238 for generator 26. -/
def rs_R006_ueqv_R006_partial_26_0238 : Poly :=
[
  term ((-2208 : Rat) / 5) [(0, 1), (9, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((1104 : Rat) / 5) [(0, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-2208 : Rat) / 5) [(1, 1), (9, 1), (11, 2), (13, 2), (16, 1)],
  term ((1104 : Rat) / 5) [(1, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((2208 : Rat) / 5) [(6, 1), (9, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((-1104 : Rat) / 5) [(6, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((2208 : Rat) / 5) [(7, 1), (9, 1), (11, 2), (13, 2), (16, 1)],
  term ((-1104 : Rat) / 5) [(7, 2), (9, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 238 for generator 26. -/
theorem rs_R006_ueqv_R006_partial_26_0238_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_26_0238
        rs_R006_ueqv_R006_generator_26_0200_0277 =
      rs_R006_ueqv_R006_partial_26_0238 := by
  native_decide

/-- Coefficient term 239 from coefficient polynomial 26. -/
def rs_R006_ueqv_R006_coefficient_26_0239 : Poly :=
[
  term ((-6624 : Rat) / 5) [(9, 1), (11, 2), (15, 1)]
]

/-- Partial product 239 for generator 26. -/
def rs_R006_ueqv_R006_partial_26_0239 : Poly :=
[
  term ((13248 : Rat) / 5) [(0, 1), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((-6624 : Rat) / 5) [(0, 2), (9, 1), (11, 2), (15, 1)],
  term ((13248 : Rat) / 5) [(1, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((-6624 : Rat) / 5) [(1, 2), (9, 1), (11, 2), (15, 1)],
  term ((-13248 : Rat) / 5) [(6, 1), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((6624 : Rat) / 5) [(6, 2), (9, 1), (11, 2), (15, 1)],
  term ((-13248 : Rat) / 5) [(7, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((6624 : Rat) / 5) [(7, 2), (9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 239 for generator 26. -/
theorem rs_R006_ueqv_R006_partial_26_0239_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_26_0239
        rs_R006_ueqv_R006_generator_26_0200_0277 =
      rs_R006_ueqv_R006_partial_26_0239 := by
  native_decide

/-- Coefficient term 240 from coefficient polynomial 26. -/
def rs_R006_ueqv_R006_coefficient_26_0240 : Poly :=
[
  term ((2208 : Rat) / 5) [(9, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 240 for generator 26. -/
def rs_R006_ueqv_R006_partial_26_0240 : Poly :=
[
  term ((-4416 : Rat) / 5) [(0, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((2208 : Rat) / 5) [(0, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-4416 : Rat) / 5) [(1, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((2208 : Rat) / 5) [(1, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((4416 : Rat) / 5) [(6, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-2208 : Rat) / 5) [(6, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((4416 : Rat) / 5) [(7, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2208 : Rat) / 5) [(7, 2), (9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 240 for generator 26. -/
theorem rs_R006_ueqv_R006_partial_26_0240_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_26_0240
        rs_R006_ueqv_R006_generator_26_0200_0277 =
      rs_R006_ueqv_R006_partial_26_0240 := by
  native_decide

/-- Coefficient term 241 from coefficient polynomial 26. -/
def rs_R006_ueqv_R006_coefficient_26_0241 : Poly :=
[
  term ((6348 : Rat) / 35) [(9, 1), (13, 1)]
]

/-- Partial product 241 for generator 26. -/
def rs_R006_ueqv_R006_partial_26_0241 : Poly :=
[
  term ((-12696 : Rat) / 35) [(0, 1), (9, 1), (12, 1), (13, 1)],
  term ((6348 : Rat) / 35) [(0, 2), (9, 1), (13, 1)],
  term ((-12696 : Rat) / 35) [(1, 1), (9, 1), (13, 2)],
  term ((6348 : Rat) / 35) [(1, 2), (9, 1), (13, 1)],
  term ((12696 : Rat) / 35) [(6, 1), (9, 1), (12, 1), (13, 1)],
  term ((-6348 : Rat) / 35) [(6, 2), (9, 1), (13, 1)],
  term ((12696 : Rat) / 35) [(7, 1), (9, 1), (13, 2)],
  term ((-6348 : Rat) / 35) [(7, 2), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 241 for generator 26. -/
theorem rs_R006_ueqv_R006_partial_26_0241_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_26_0241
        rs_R006_ueqv_R006_generator_26_0200_0277 =
      rs_R006_ueqv_R006_partial_26_0241 := by
  native_decide

/-- Coefficient term 242 from coefficient polynomial 26. -/
def rs_R006_ueqv_R006_coefficient_26_0242 : Poly :=
[
  term ((-1872 : Rat) / 5) [(9, 1), (13, 1), (14, 1)]
]

/-- Partial product 242 for generator 26. -/
def rs_R006_ueqv_R006_partial_26_0242 : Poly :=
[
  term ((3744 : Rat) / 5) [(0, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-1872 : Rat) / 5) [(0, 2), (9, 1), (13, 1), (14, 1)],
  term ((3744 : Rat) / 5) [(1, 1), (9, 1), (13, 2), (14, 1)],
  term ((-1872 : Rat) / 5) [(1, 2), (9, 1), (13, 1), (14, 1)],
  term ((-3744 : Rat) / 5) [(6, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((1872 : Rat) / 5) [(6, 2), (9, 1), (13, 1), (14, 1)],
  term ((-3744 : Rat) / 5) [(7, 1), (9, 1), (13, 2), (14, 1)],
  term ((1872 : Rat) / 5) [(7, 2), (9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 242 for generator 26. -/
theorem rs_R006_ueqv_R006_partial_26_0242_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_26_0242
        rs_R006_ueqv_R006_generator_26_0200_0277 =
      rs_R006_ueqv_R006_partial_26_0242 := by
  native_decide

/-- Coefficient term 243 from coefficient polynomial 26. -/
def rs_R006_ueqv_R006_coefficient_26_0243 : Poly :=
[
  term ((624 : Rat) / 5) [(9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 243 for generator 26. -/
def rs_R006_ueqv_R006_partial_26_0243 : Poly :=
[
  term ((-1248 : Rat) / 5) [(0, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((624 : Rat) / 5) [(0, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1248 : Rat) / 5) [(1, 1), (9, 1), (13, 2), (14, 1), (16, 1)],
  term ((624 : Rat) / 5) [(1, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((1248 : Rat) / 5) [(6, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-624 : Rat) / 5) [(6, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((1248 : Rat) / 5) [(7, 1), (9, 1), (13, 2), (14, 1), (16, 1)],
  term ((-624 : Rat) / 5) [(7, 2), (9, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 243 for generator 26. -/
theorem rs_R006_ueqv_R006_partial_26_0243_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_26_0243
        rs_R006_ueqv_R006_generator_26_0200_0277 =
      rs_R006_ueqv_R006_partial_26_0243 := by
  native_decide

/-- Coefficient term 244 from coefficient polynomial 26. -/
def rs_R006_ueqv_R006_coefficient_26_0244 : Poly :=
[
  term ((-312 : Rat) / 5) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 244 for generator 26. -/
def rs_R006_ueqv_R006_partial_26_0244 : Poly :=
[
  term ((624 : Rat) / 5) [(0, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-312 : Rat) / 5) [(0, 2), (9, 1), (13, 1), (16, 1)],
  term ((624 : Rat) / 5) [(1, 1), (9, 1), (13, 2), (16, 1)],
  term ((-312 : Rat) / 5) [(1, 2), (9, 1), (13, 1), (16, 1)],
  term ((-624 : Rat) / 5) [(6, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((312 : Rat) / 5) [(6, 2), (9, 1), (13, 1), (16, 1)],
  term ((-624 : Rat) / 5) [(7, 1), (9, 1), (13, 2), (16, 1)],
  term ((312 : Rat) / 5) [(7, 2), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 244 for generator 26. -/
theorem rs_R006_ueqv_R006_partial_26_0244_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_26_0244
        rs_R006_ueqv_R006_generator_26_0200_0277 =
      rs_R006_ueqv_R006_partial_26_0244 := by
  native_decide

/-- Coefficient term 245 from coefficient polynomial 26. -/
def rs_R006_ueqv_R006_coefficient_26_0245 : Poly :=
[
  term ((1872 : Rat) / 5) [(9, 1), (15, 1)]
]

/-- Partial product 245 for generator 26. -/
def rs_R006_ueqv_R006_partial_26_0245 : Poly :=
[
  term ((-3744 : Rat) / 5) [(0, 1), (9, 1), (12, 1), (15, 1)],
  term ((1872 : Rat) / 5) [(0, 2), (9, 1), (15, 1)],
  term ((-3744 : Rat) / 5) [(1, 1), (9, 1), (13, 1), (15, 1)],
  term ((1872 : Rat) / 5) [(1, 2), (9, 1), (15, 1)],
  term ((3744 : Rat) / 5) [(6, 1), (9, 1), (12, 1), (15, 1)],
  term ((-1872 : Rat) / 5) [(6, 2), (9, 1), (15, 1)],
  term ((3744 : Rat) / 5) [(7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-1872 : Rat) / 5) [(7, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 245 for generator 26. -/
theorem rs_R006_ueqv_R006_partial_26_0245_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_26_0245
        rs_R006_ueqv_R006_generator_26_0200_0277 =
      rs_R006_ueqv_R006_partial_26_0245 := by
  native_decide

/-- Coefficient term 246 from coefficient polynomial 26. -/
def rs_R006_ueqv_R006_coefficient_26_0246 : Poly :=
[
  term ((-624 : Rat) / 5) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 246 for generator 26. -/
def rs_R006_ueqv_R006_partial_26_0246 : Poly :=
[
  term ((1248 : Rat) / 5) [(0, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-624 : Rat) / 5) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((1248 : Rat) / 5) [(1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-624 : Rat) / 5) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((-1248 : Rat) / 5) [(6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((624 : Rat) / 5) [(6, 2), (9, 1), (15, 1), (16, 1)],
  term ((-1248 : Rat) / 5) [(7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((624 : Rat) / 5) [(7, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 246 for generator 26. -/
theorem rs_R006_ueqv_R006_partial_26_0246_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_26_0246
        rs_R006_ueqv_R006_generator_26_0200_0277 =
      rs_R006_ueqv_R006_partial_26_0246 := by
  native_decide

/-- Coefficient term 247 from coefficient polynomial 26. -/
def rs_R006_ueqv_R006_coefficient_26_0247 : Poly :=
[
  term ((1152 : Rat) / 7) [(9, 2), (11, 1), (13, 1)]
]

/-- Partial product 247 for generator 26. -/
def rs_R006_ueqv_R006_partial_26_0247 : Poly :=
[
  term ((-2304 : Rat) / 7) [(0, 1), (9, 2), (11, 1), (12, 1), (13, 1)],
  term ((1152 : Rat) / 7) [(0, 2), (9, 2), (11, 1), (13, 1)],
  term ((-2304 : Rat) / 7) [(1, 1), (9, 2), (11, 1), (13, 2)],
  term ((1152 : Rat) / 7) [(1, 2), (9, 2), (11, 1), (13, 1)],
  term ((2304 : Rat) / 7) [(6, 1), (9, 2), (11, 1), (12, 1), (13, 1)],
  term ((-1152 : Rat) / 7) [(6, 2), (9, 2), (11, 1), (13, 1)],
  term ((2304 : Rat) / 7) [(7, 1), (9, 2), (11, 1), (13, 2)],
  term ((-1152 : Rat) / 7) [(7, 2), (9, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 247 for generator 26. -/
theorem rs_R006_ueqv_R006_partial_26_0247_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_26_0247
        rs_R006_ueqv_R006_generator_26_0200_0277 =
      rs_R006_ueqv_R006_partial_26_0247 := by
  native_decide

/-- Coefficient term 248 from coefficient polynomial 26. -/
def rs_R006_ueqv_R006_coefficient_26_0248 : Poly :=
[
  term ((-1728 : Rat) / 5) [(9, 2), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 248 for generator 26. -/
def rs_R006_ueqv_R006_partial_26_0248 : Poly :=
[
  term ((3456 : Rat) / 5) [(0, 1), (9, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-1728 : Rat) / 5) [(0, 2), (9, 2), (11, 1), (13, 1), (14, 1)],
  term ((3456 : Rat) / 5) [(1, 1), (9, 2), (11, 1), (13, 2), (14, 1)],
  term ((-1728 : Rat) / 5) [(1, 2), (9, 2), (11, 1), (13, 1), (14, 1)],
  term ((-3456 : Rat) / 5) [(6, 1), (9, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((1728 : Rat) / 5) [(6, 2), (9, 2), (11, 1), (13, 1), (14, 1)],
  term ((-3456 : Rat) / 5) [(7, 1), (9, 2), (11, 1), (13, 2), (14, 1)],
  term ((1728 : Rat) / 5) [(7, 2), (9, 2), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 248 for generator 26. -/
theorem rs_R006_ueqv_R006_partial_26_0248_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_26_0248
        rs_R006_ueqv_R006_generator_26_0200_0277 =
      rs_R006_ueqv_R006_partial_26_0248 := by
  native_decide

/-- Coefficient term 249 from coefficient polynomial 26. -/
def rs_R006_ueqv_R006_coefficient_26_0249 : Poly :=
[
  term ((576 : Rat) / 5) [(9, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 249 for generator 26. -/
def rs_R006_ueqv_R006_partial_26_0249 : Poly :=
[
  term ((-1152 : Rat) / 5) [(0, 1), (9, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((576 : Rat) / 5) [(0, 2), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1152 : Rat) / 5) [(1, 1), (9, 2), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((576 : Rat) / 5) [(1, 2), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((1152 : Rat) / 5) [(6, 1), (9, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-576 : Rat) / 5) [(6, 2), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((1152 : Rat) / 5) [(7, 1), (9, 2), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-576 : Rat) / 5) [(7, 2), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 249 for generator 26. -/
theorem rs_R006_ueqv_R006_partial_26_0249_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_26_0249
        rs_R006_ueqv_R006_generator_26_0200_0277 =
      rs_R006_ueqv_R006_partial_26_0249 := by
  native_decide

/-- Coefficient term 250 from coefficient polynomial 26. -/
def rs_R006_ueqv_R006_coefficient_26_0250 : Poly :=
[
  term ((-288 : Rat) / 5) [(9, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 250 for generator 26. -/
def rs_R006_ueqv_R006_partial_26_0250 : Poly :=
[
  term ((576 : Rat) / 5) [(0, 1), (9, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(0, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((576 : Rat) / 5) [(1, 1), (9, 2), (11, 1), (13, 2), (16, 1)],
  term ((-288 : Rat) / 5) [(1, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-576 : Rat) / 5) [(6, 1), (9, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((288 : Rat) / 5) [(6, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-576 : Rat) / 5) [(7, 1), (9, 2), (11, 1), (13, 2), (16, 1)],
  term ((288 : Rat) / 5) [(7, 2), (9, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 250 for generator 26. -/
theorem rs_R006_ueqv_R006_partial_26_0250_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_26_0250
        rs_R006_ueqv_R006_generator_26_0200_0277 =
      rs_R006_ueqv_R006_partial_26_0250 := by
  native_decide

/-- Coefficient term 251 from coefficient polynomial 26. -/
def rs_R006_ueqv_R006_coefficient_26_0251 : Poly :=
[
  term ((1728 : Rat) / 5) [(9, 2), (11, 1), (15, 1)]
]

/-- Partial product 251 for generator 26. -/
def rs_R006_ueqv_R006_partial_26_0251 : Poly :=
[
  term ((-3456 : Rat) / 5) [(0, 1), (9, 2), (11, 1), (12, 1), (15, 1)],
  term ((1728 : Rat) / 5) [(0, 2), (9, 2), (11, 1), (15, 1)],
  term ((-3456 : Rat) / 5) [(1, 1), (9, 2), (11, 1), (13, 1), (15, 1)],
  term ((1728 : Rat) / 5) [(1, 2), (9, 2), (11, 1), (15, 1)],
  term ((3456 : Rat) / 5) [(6, 1), (9, 2), (11, 1), (12, 1), (15, 1)],
  term ((-1728 : Rat) / 5) [(6, 2), (9, 2), (11, 1), (15, 1)],
  term ((3456 : Rat) / 5) [(7, 1), (9, 2), (11, 1), (13, 1), (15, 1)],
  term ((-1728 : Rat) / 5) [(7, 2), (9, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 251 for generator 26. -/
theorem rs_R006_ueqv_R006_partial_26_0251_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_26_0251
        rs_R006_ueqv_R006_generator_26_0200_0277 =
      rs_R006_ueqv_R006_partial_26_0251 := by
  native_decide

/-- Coefficient term 252 from coefficient polynomial 26. -/
def rs_R006_ueqv_R006_coefficient_26_0252 : Poly :=
[
  term ((-576 : Rat) / 5) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 252 for generator 26. -/
def rs_R006_ueqv_R006_partial_26_0252 : Poly :=
[
  term ((1152 : Rat) / 5) [(0, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-576 : Rat) / 5) [(0, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((1152 : Rat) / 5) [(1, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-576 : Rat) / 5) [(1, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1152 : Rat) / 5) [(6, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((576 : Rat) / 5) [(6, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1152 : Rat) / 5) [(7, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((576 : Rat) / 5) [(7, 2), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 252 for generator 26. -/
theorem rs_R006_ueqv_R006_partial_26_0252_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_26_0252
        rs_R006_ueqv_R006_generator_26_0200_0277 =
      rs_R006_ueqv_R006_partial_26_0252 := by
  native_decide

/-- Coefficient term 253 from coefficient polynomial 26. -/
def rs_R006_ueqv_R006_coefficient_26_0253 : Poly :=
[
  term ((-2988 : Rat) / 35) [(11, 1), (12, 1), (13, 1)]
]

/-- Partial product 253 for generator 26. -/
def rs_R006_ueqv_R006_partial_26_0253 : Poly :=
[
  term ((5976 : Rat) / 35) [(0, 1), (11, 1), (12, 2), (13, 1)],
  term ((-2988 : Rat) / 35) [(0, 2), (11, 1), (12, 1), (13, 1)],
  term ((5976 : Rat) / 35) [(1, 1), (11, 1), (12, 1), (13, 2)],
  term ((-2988 : Rat) / 35) [(1, 2), (11, 1), (12, 1), (13, 1)],
  term ((-5976 : Rat) / 35) [(6, 1), (11, 1), (12, 2), (13, 1)],
  term ((2988 : Rat) / 35) [(6, 2), (11, 1), (12, 1), (13, 1)],
  term ((-5976 : Rat) / 35) [(7, 1), (11, 1), (12, 1), (13, 2)],
  term ((2988 : Rat) / 35) [(7, 2), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 253 for generator 26. -/
theorem rs_R006_ueqv_R006_partial_26_0253_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_26_0253
        rs_R006_ueqv_R006_generator_26_0200_0277 =
      rs_R006_ueqv_R006_partial_26_0253 := by
  native_decide

/-- Coefficient term 254 from coefficient polynomial 26. -/
def rs_R006_ueqv_R006_coefficient_26_0254 : Poly :=
[
  term ((864 : Rat) / 5) [(11, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 254 for generator 26. -/
def rs_R006_ueqv_R006_partial_26_0254 : Poly :=
[
  term ((-1728 : Rat) / 5) [(0, 1), (11, 1), (12, 2), (13, 1), (14, 1)],
  term ((864 : Rat) / 5) [(0, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-1728 : Rat) / 5) [(1, 1), (11, 1), (12, 1), (13, 2), (14, 1)],
  term ((864 : Rat) / 5) [(1, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((1728 : Rat) / 5) [(6, 1), (11, 1), (12, 2), (13, 1), (14, 1)],
  term ((-864 : Rat) / 5) [(6, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((1728 : Rat) / 5) [(7, 1), (11, 1), (12, 1), (13, 2), (14, 1)],
  term ((-864 : Rat) / 5) [(7, 2), (11, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 254 for generator 26. -/
theorem rs_R006_ueqv_R006_partial_26_0254_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_26_0254
        rs_R006_ueqv_R006_generator_26_0200_0277 =
      rs_R006_ueqv_R006_partial_26_0254 := by
  native_decide

/-- Coefficient term 255 from coefficient polynomial 26. -/
def rs_R006_ueqv_R006_coefficient_26_0255 : Poly :=
[
  term ((-288 : Rat) / 5) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 255 for generator 26. -/
def rs_R006_ueqv_R006_partial_26_0255 : Poly :=
[
  term ((576 : Rat) / 5) [(0, 1), (11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(0, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((576 : Rat) / 5) [(1, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(1, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-576 : Rat) / 5) [(6, 1), (11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((288 : Rat) / 5) [(6, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-576 : Rat) / 5) [(7, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((288 : Rat) / 5) [(7, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 255 for generator 26. -/
theorem rs_R006_ueqv_R006_partial_26_0255_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_26_0255
        rs_R006_ueqv_R006_generator_26_0200_0277 =
      rs_R006_ueqv_R006_partial_26_0255 := by
  native_decide

/-- Coefficient term 256 from coefficient polynomial 26. -/
def rs_R006_ueqv_R006_coefficient_26_0256 : Poly :=
[
  term ((144 : Rat) / 5) [(11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 256 for generator 26. -/
def rs_R006_ueqv_R006_partial_26_0256 : Poly :=
[
  term ((-288 : Rat) / 5) [(0, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((144 : Rat) / 5) [(0, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(1, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((144 : Rat) / 5) [(1, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((288 : Rat) / 5) [(6, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-144 : Rat) / 5) [(6, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((288 : Rat) / 5) [(7, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-144 : Rat) / 5) [(7, 2), (11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 256 for generator 26. -/
theorem rs_R006_ueqv_R006_partial_26_0256_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_26_0256
        rs_R006_ueqv_R006_generator_26_0200_0277 =
      rs_R006_ueqv_R006_partial_26_0256 := by
  native_decide

/-- Coefficient term 257 from coefficient polynomial 26. -/
def rs_R006_ueqv_R006_coefficient_26_0257 : Poly :=
[
  term ((-4062 : Rat) / 25) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 257 for generator 26. -/
def rs_R006_ueqv_R006_partial_26_0257 : Poly :=
[
  term ((8124 : Rat) / 25) [(0, 1), (11, 1), (12, 2), (15, 1)],
  term ((-4062 : Rat) / 25) [(0, 2), (11, 1), (12, 1), (15, 1)],
  term ((8124 : Rat) / 25) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-4062 : Rat) / 25) [(1, 2), (11, 1), (12, 1), (15, 1)],
  term ((-8124 : Rat) / 25) [(6, 1), (11, 1), (12, 2), (15, 1)],
  term ((4062 : Rat) / 25) [(6, 2), (11, 1), (12, 1), (15, 1)],
  term ((-8124 : Rat) / 25) [(7, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((4062 : Rat) / 25) [(7, 2), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 257 for generator 26. -/
theorem rs_R006_ueqv_R006_partial_26_0257_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_26_0257
        rs_R006_ueqv_R006_generator_26_0200_0277 =
      rs_R006_ueqv_R006_partial_26_0257 := by
  native_decide

/-- Coefficient term 258 from coefficient polynomial 26. -/
def rs_R006_ueqv_R006_coefficient_26_0258 : Poly :=
[
  term ((1284 : Rat) / 25) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 258 for generator 26. -/
def rs_R006_ueqv_R006_partial_26_0258 : Poly :=
[
  term ((-2568 : Rat) / 25) [(0, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((1284 : Rat) / 25) [(0, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2568 : Rat) / 25) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1284 : Rat) / 25) [(1, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((2568 : Rat) / 25) [(6, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1284 : Rat) / 25) [(6, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((2568 : Rat) / 25) [(7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1284 : Rat) / 25) [(7, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 258 for generator 26. -/
theorem rs_R006_ueqv_R006_partial_26_0258_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_26_0258
        rs_R006_ueqv_R006_generator_26_0200_0277 =
      rs_R006_ueqv_R006_partial_26_0258 := by
  native_decide

/-- Coefficient term 259 from coefficient polynomial 26. -/
def rs_R006_ueqv_R006_coefficient_26_0259 : Poly :=
[
  term ((-6996 : Rat) / 35) [(11, 1), (13, 1)]
]

/-- Partial product 259 for generator 26. -/
def rs_R006_ueqv_R006_partial_26_0259 : Poly :=
[
  term ((13992 : Rat) / 35) [(0, 1), (11, 1), (12, 1), (13, 1)],
  term ((-6996 : Rat) / 35) [(0, 2), (11, 1), (13, 1)],
  term ((13992 : Rat) / 35) [(1, 1), (11, 1), (13, 2)],
  term ((-6996 : Rat) / 35) [(1, 2), (11, 1), (13, 1)],
  term ((-13992 : Rat) / 35) [(6, 1), (11, 1), (12, 1), (13, 1)],
  term ((6996 : Rat) / 35) [(6, 2), (11, 1), (13, 1)],
  term ((-13992 : Rat) / 35) [(7, 1), (11, 1), (13, 2)],
  term ((6996 : Rat) / 35) [(7, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 259 for generator 26. -/
theorem rs_R006_ueqv_R006_partial_26_0259_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_26_0259
        rs_R006_ueqv_R006_generator_26_0200_0277 =
      rs_R006_ueqv_R006_partial_26_0259 := by
  native_decide

/-- Coefficient term 260 from coefficient polynomial 26. -/
def rs_R006_ueqv_R006_coefficient_26_0260 : Poly :=
[
  term ((624 : Rat) / 5) [(11, 1), (13, 1), (14, 1)]
]

/-- Partial product 260 for generator 26. -/
def rs_R006_ueqv_R006_partial_26_0260 : Poly :=
[
  term ((-1248 : Rat) / 5) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((624 : Rat) / 5) [(0, 2), (11, 1), (13, 1), (14, 1)],
  term ((-1248 : Rat) / 5) [(1, 1), (11, 1), (13, 2), (14, 1)],
  term ((624 : Rat) / 5) [(1, 2), (11, 1), (13, 1), (14, 1)],
  term ((1248 : Rat) / 5) [(6, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-624 : Rat) / 5) [(6, 2), (11, 1), (13, 1), (14, 1)],
  term ((1248 : Rat) / 5) [(7, 1), (11, 1), (13, 2), (14, 1)],
  term ((-624 : Rat) / 5) [(7, 2), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 260 for generator 26. -/
theorem rs_R006_ueqv_R006_partial_26_0260_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_26_0260
        rs_R006_ueqv_R006_generator_26_0200_0277 =
      rs_R006_ueqv_R006_partial_26_0260 := by
  native_decide

/-- Coefficient term 261 from coefficient polynomial 26. -/
def rs_R006_ueqv_R006_coefficient_26_0261 : Poly :=
[
  term ((96 : Rat) / 5) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 261 for generator 26. -/
def rs_R006_ueqv_R006_partial_26_0261 : Poly :=
[
  term ((-192 : Rat) / 5) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((96 : Rat) / 5) [(0, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-192 : Rat) / 5) [(1, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((96 : Rat) / 5) [(1, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((192 : Rat) / 5) [(6, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-96 : Rat) / 5) [(6, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((192 : Rat) / 5) [(7, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-96 : Rat) / 5) [(7, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 261 for generator 26. -/
theorem rs_R006_ueqv_R006_partial_26_0261_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_26_0261
        rs_R006_ueqv_R006_generator_26_0200_0277 =
      rs_R006_ueqv_R006_partial_26_0261 := by
  native_decide

/-- Coefficient term 262 from coefficient polynomial 26. -/
def rs_R006_ueqv_R006_coefficient_26_0262 : Poly :=
[
  term ((-48 : Rat) / 5) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 262 for generator 26. -/
def rs_R006_ueqv_R006_partial_26_0262 : Poly :=
[
  term ((96 : Rat) / 5) [(0, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-48 : Rat) / 5) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term ((96 : Rat) / 5) [(1, 1), (11, 1), (13, 2), (16, 1)],
  term ((-48 : Rat) / 5) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term ((-96 : Rat) / 5) [(6, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((48 : Rat) / 5) [(6, 2), (11, 1), (13, 1), (16, 1)],
  term ((-96 : Rat) / 5) [(7, 1), (11, 1), (13, 2), (16, 1)],
  term ((48 : Rat) / 5) [(7, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 262 for generator 26. -/
theorem rs_R006_ueqv_R006_partial_26_0262_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_26_0262
        rs_R006_ueqv_R006_generator_26_0200_0277 =
      rs_R006_ueqv_R006_partial_26_0262 := by
  native_decide

/-- Coefficient term 263 from coefficient polynomial 26. -/
def rs_R006_ueqv_R006_coefficient_26_0263 : Poly :=
[
  term ((1212 : Rat) / 25) [(11, 1), (15, 1)]
]

/-- Partial product 263 for generator 26. -/
def rs_R006_ueqv_R006_partial_26_0263 : Poly :=
[
  term ((-2424 : Rat) / 25) [(0, 1), (11, 1), (12, 1), (15, 1)],
  term ((1212 : Rat) / 25) [(0, 2), (11, 1), (15, 1)],
  term ((-2424 : Rat) / 25) [(1, 1), (11, 1), (13, 1), (15, 1)],
  term ((1212 : Rat) / 25) [(1, 2), (11, 1), (15, 1)],
  term ((2424 : Rat) / 25) [(6, 1), (11, 1), (12, 1), (15, 1)],
  term ((-1212 : Rat) / 25) [(6, 2), (11, 1), (15, 1)],
  term ((2424 : Rat) / 25) [(7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1212 : Rat) / 25) [(7, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 263 for generator 26. -/
theorem rs_R006_ueqv_R006_partial_26_0263_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_26_0263
        rs_R006_ueqv_R006_generator_26_0200_0277 =
      rs_R006_ueqv_R006_partial_26_0263 := by
  native_decide

/-- Coefficient term 264 from coefficient polynomial 26. -/
def rs_R006_ueqv_R006_coefficient_26_0264 : Poly :=
[
  term ((-264 : Rat) / 25) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 264 for generator 26. -/
def rs_R006_ueqv_R006_partial_26_0264 : Poly :=
[
  term ((528 : Rat) / 25) [(0, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-264 : Rat) / 25) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((528 : Rat) / 25) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-264 : Rat) / 25) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-528 : Rat) / 25) [(6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((264 : Rat) / 25) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-528 : Rat) / 25) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((264 : Rat) / 25) [(7, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 264 for generator 26. -/
theorem rs_R006_ueqv_R006_partial_26_0264_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_26_0264
        rs_R006_ueqv_R006_generator_26_0200_0277 =
      rs_R006_ueqv_R006_partial_26_0264 := by
  native_decide

/-- Coefficient term 265 from coefficient polynomial 26. -/
def rs_R006_ueqv_R006_coefficient_26_0265 : Poly :=
[
  term ((954 : Rat) / 5) [(11, 2)]
]

/-- Partial product 265 for generator 26. -/
def rs_R006_ueqv_R006_partial_26_0265 : Poly :=
[
  term ((-1908 : Rat) / 5) [(0, 1), (11, 2), (12, 1)],
  term ((954 : Rat) / 5) [(0, 2), (11, 2)],
  term ((-1908 : Rat) / 5) [(1, 1), (11, 2), (13, 1)],
  term ((954 : Rat) / 5) [(1, 2), (11, 2)],
  term ((1908 : Rat) / 5) [(6, 1), (11, 2), (12, 1)],
  term ((-954 : Rat) / 5) [(6, 2), (11, 2)],
  term ((1908 : Rat) / 5) [(7, 1), (11, 2), (13, 1)],
  term ((-954 : Rat) / 5) [(7, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 265 for generator 26. -/
theorem rs_R006_ueqv_R006_partial_26_0265_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_26_0265
        rs_R006_ueqv_R006_generator_26_0200_0277 =
      rs_R006_ueqv_R006_partial_26_0265 := by
  native_decide

/-- Coefficient term 266 from coefficient polynomial 26. -/
def rs_R006_ueqv_R006_coefficient_26_0266 : Poly :=
[
  term ((-726 : Rat) / 5) [(11, 2), (14, 1)]
]

/-- Partial product 266 for generator 26. -/
def rs_R006_ueqv_R006_partial_26_0266 : Poly :=
[
  term ((1452 : Rat) / 5) [(0, 1), (11, 2), (12, 1), (14, 1)],
  term ((-726 : Rat) / 5) [(0, 2), (11, 2), (14, 1)],
  term ((1452 : Rat) / 5) [(1, 1), (11, 2), (13, 1), (14, 1)],
  term ((-726 : Rat) / 5) [(1, 2), (11, 2), (14, 1)],
  term ((-1452 : Rat) / 5) [(6, 1), (11, 2), (12, 1), (14, 1)],
  term ((726 : Rat) / 5) [(6, 2), (11, 2), (14, 1)],
  term ((-1452 : Rat) / 5) [(7, 1), (11, 2), (13, 1), (14, 1)],
  term ((726 : Rat) / 5) [(7, 2), (11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 266 for generator 26. -/
theorem rs_R006_ueqv_R006_partial_26_0266_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_26_0266
        rs_R006_ueqv_R006_generator_26_0200_0277 =
      rs_R006_ueqv_R006_partial_26_0266 := by
  native_decide

/-- Coefficient term 267 from coefficient polynomial 26. -/
def rs_R006_ueqv_R006_coefficient_26_0267 : Poly :=
[
  term (-2 : Rat) [(11, 2), (16, 1)]
]

/-- Partial product 267 for generator 26. -/
def rs_R006_ueqv_R006_partial_26_0267 : Poly :=
[
  term (4 : Rat) [(0, 1), (11, 2), (12, 1), (16, 1)],
  term (-2 : Rat) [(0, 2), (11, 2), (16, 1)],
  term (4 : Rat) [(1, 1), (11, 2), (13, 1), (16, 1)],
  term (-2 : Rat) [(1, 2), (11, 2), (16, 1)],
  term (-4 : Rat) [(6, 1), (11, 2), (12, 1), (16, 1)],
  term (2 : Rat) [(6, 2), (11, 2), (16, 1)],
  term (-4 : Rat) [(7, 1), (11, 2), (13, 1), (16, 1)],
  term (2 : Rat) [(7, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 267 for generator 26. -/
theorem rs_R006_ueqv_R006_partial_26_0267_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_26_0267
        rs_R006_ueqv_R006_generator_26_0200_0277 =
      rs_R006_ueqv_R006_partial_26_0267 := by
  native_decide

/-- Coefficient term 268 from coefficient polynomial 26. -/
def rs_R006_ueqv_R006_coefficient_26_0268 : Poly :=
[
  term ((288 : Rat) / 5) [(12, 1)]
]

/-- Partial product 268 for generator 26. -/
def rs_R006_ueqv_R006_partial_26_0268 : Poly :=
[
  term ((-576 : Rat) / 5) [(0, 1), (12, 2)],
  term ((288 : Rat) / 5) [(0, 2), (12, 1)],
  term ((-576 : Rat) / 5) [(1, 1), (12, 1), (13, 1)],
  term ((288 : Rat) / 5) [(1, 2), (12, 1)],
  term ((576 : Rat) / 5) [(6, 1), (12, 2)],
  term ((-288 : Rat) / 5) [(6, 2), (12, 1)],
  term ((576 : Rat) / 5) [(7, 1), (12, 1), (13, 1)],
  term ((-288 : Rat) / 5) [(7, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 268 for generator 26. -/
theorem rs_R006_ueqv_R006_partial_26_0268_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_26_0268
        rs_R006_ueqv_R006_generator_26_0200_0277 =
      rs_R006_ueqv_R006_partial_26_0268 := by
  native_decide

/-- Coefficient term 269 from coefficient polynomial 26. -/
def rs_R006_ueqv_R006_coefficient_26_0269 : Poly :=
[
  term ((-228 : Rat) / 5) [(12, 1), (14, 1)]
]

/-- Partial product 269 for generator 26. -/
def rs_R006_ueqv_R006_partial_26_0269 : Poly :=
[
  term ((456 : Rat) / 5) [(0, 1), (12, 2), (14, 1)],
  term ((-228 : Rat) / 5) [(0, 2), (12, 1), (14, 1)],
  term ((456 : Rat) / 5) [(1, 1), (12, 1), (13, 1), (14, 1)],
  term ((-228 : Rat) / 5) [(1, 2), (12, 1), (14, 1)],
  term ((-456 : Rat) / 5) [(6, 1), (12, 2), (14, 1)],
  term ((228 : Rat) / 5) [(6, 2), (12, 1), (14, 1)],
  term ((-456 : Rat) / 5) [(7, 1), (12, 1), (13, 1), (14, 1)],
  term ((228 : Rat) / 5) [(7, 2), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 269 for generator 26. -/
theorem rs_R006_ueqv_R006_partial_26_0269_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_26_0269
        rs_R006_ueqv_R006_generator_26_0200_0277 =
      rs_R006_ueqv_R006_partial_26_0269 := by
  native_decide

/-- Coefficient term 270 from coefficient polynomial 26. -/
def rs_R006_ueqv_R006_coefficient_26_0270 : Poly :=
[
  term ((2259 : Rat) / 25) [(13, 1), (15, 1)]
]

/-- Partial product 270 for generator 26. -/
def rs_R006_ueqv_R006_partial_26_0270 : Poly :=
[
  term ((-4518 : Rat) / 25) [(0, 1), (12, 1), (13, 1), (15, 1)],
  term ((2259 : Rat) / 25) [(0, 2), (13, 1), (15, 1)],
  term ((-4518 : Rat) / 25) [(1, 1), (13, 2), (15, 1)],
  term ((2259 : Rat) / 25) [(1, 2), (13, 1), (15, 1)],
  term ((4518 : Rat) / 25) [(6, 1), (12, 1), (13, 1), (15, 1)],
  term ((-2259 : Rat) / 25) [(6, 2), (13, 1), (15, 1)],
  term ((4518 : Rat) / 25) [(7, 1), (13, 2), (15, 1)],
  term ((-2259 : Rat) / 25) [(7, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 270 for generator 26. -/
theorem rs_R006_ueqv_R006_partial_26_0270_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_26_0270
        rs_R006_ueqv_R006_generator_26_0200_0277 =
      rs_R006_ueqv_R006_partial_26_0270 := by
  native_decide

/-- Coefficient term 271 from coefficient polynomial 26. -/
def rs_R006_ueqv_R006_coefficient_26_0271 : Poly :=
[
  term ((-738 : Rat) / 25) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 271 for generator 26. -/
def rs_R006_ueqv_R006_partial_26_0271 : Poly :=
[
  term ((1476 : Rat) / 25) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-738 : Rat) / 25) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((1476 : Rat) / 25) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((-738 : Rat) / 25) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1476 : Rat) / 25) [(6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((738 : Rat) / 25) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1476 : Rat) / 25) [(7, 1), (13, 2), (15, 1), (16, 1)],
  term ((738 : Rat) / 25) [(7, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 271 for generator 26. -/
theorem rs_R006_ueqv_R006_partial_26_0271_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_26_0271
        rs_R006_ueqv_R006_generator_26_0200_0277 =
      rs_R006_ueqv_R006_partial_26_0271 := by
  native_decide

/-- Coefficient term 272 from coefficient polynomial 26. -/
def rs_R006_ueqv_R006_coefficient_26_0272 : Poly :=
[
  term ((1566 : Rat) / 35) [(13, 2)]
]

/-- Partial product 272 for generator 26. -/
def rs_R006_ueqv_R006_partial_26_0272 : Poly :=
[
  term ((-3132 : Rat) / 35) [(0, 1), (12, 1), (13, 2)],
  term ((1566 : Rat) / 35) [(0, 2), (13, 2)],
  term ((-3132 : Rat) / 35) [(1, 1), (13, 3)],
  term ((1566 : Rat) / 35) [(1, 2), (13, 2)],
  term ((3132 : Rat) / 35) [(6, 1), (12, 1), (13, 2)],
  term ((-1566 : Rat) / 35) [(6, 2), (13, 2)],
  term ((3132 : Rat) / 35) [(7, 1), (13, 3)],
  term ((-1566 : Rat) / 35) [(7, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 272 for generator 26. -/
theorem rs_R006_ueqv_R006_partial_26_0272_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_26_0272
        rs_R006_ueqv_R006_generator_26_0200_0277 =
      rs_R006_ueqv_R006_partial_26_0272 := by
  native_decide

/-- Coefficient term 273 from coefficient polynomial 26. -/
def rs_R006_ueqv_R006_coefficient_26_0273 : Poly :=
[
  term ((-432 : Rat) / 5) [(13, 2), (14, 1)]
]

/-- Partial product 273 for generator 26. -/
def rs_R006_ueqv_R006_partial_26_0273 : Poly :=
[
  term ((864 : Rat) / 5) [(0, 1), (12, 1), (13, 2), (14, 1)],
  term ((-432 : Rat) / 5) [(0, 2), (13, 2), (14, 1)],
  term ((864 : Rat) / 5) [(1, 1), (13, 3), (14, 1)],
  term ((-432 : Rat) / 5) [(1, 2), (13, 2), (14, 1)],
  term ((-864 : Rat) / 5) [(6, 1), (12, 1), (13, 2), (14, 1)],
  term ((432 : Rat) / 5) [(6, 2), (13, 2), (14, 1)],
  term ((-864 : Rat) / 5) [(7, 1), (13, 3), (14, 1)],
  term ((432 : Rat) / 5) [(7, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 273 for generator 26. -/
theorem rs_R006_ueqv_R006_partial_26_0273_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_26_0273
        rs_R006_ueqv_R006_generator_26_0200_0277 =
      rs_R006_ueqv_R006_partial_26_0273 := by
  native_decide

/-- Coefficient term 274 from coefficient polynomial 26. -/
def rs_R006_ueqv_R006_coefficient_26_0274 : Poly :=
[
  term ((144 : Rat) / 5) [(13, 2), (14, 1), (16, 1)]
]

/-- Partial product 274 for generator 26. -/
def rs_R006_ueqv_R006_partial_26_0274 : Poly :=
[
  term ((-288 : Rat) / 5) [(0, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((144 : Rat) / 5) [(0, 2), (13, 2), (14, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(1, 1), (13, 3), (14, 1), (16, 1)],
  term ((144 : Rat) / 5) [(1, 2), (13, 2), (14, 1), (16, 1)],
  term ((288 : Rat) / 5) [(6, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-144 : Rat) / 5) [(6, 2), (13, 2), (14, 1), (16, 1)],
  term ((288 : Rat) / 5) [(7, 1), (13, 3), (14, 1), (16, 1)],
  term ((-144 : Rat) / 5) [(7, 2), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 274 for generator 26. -/
theorem rs_R006_ueqv_R006_partial_26_0274_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_26_0274
        rs_R006_ueqv_R006_generator_26_0200_0277 =
      rs_R006_ueqv_R006_partial_26_0274 := by
  native_decide

/-- Coefficient term 275 from coefficient polynomial 26. -/
def rs_R006_ueqv_R006_coefficient_26_0275 : Poly :=
[
  term ((-72 : Rat) / 5) [(13, 2), (16, 1)]
]

/-- Partial product 275 for generator 26. -/
def rs_R006_ueqv_R006_partial_26_0275 : Poly :=
[
  term ((144 : Rat) / 5) [(0, 1), (12, 1), (13, 2), (16, 1)],
  term ((-72 : Rat) / 5) [(0, 2), (13, 2), (16, 1)],
  term ((144 : Rat) / 5) [(1, 1), (13, 3), (16, 1)],
  term ((-72 : Rat) / 5) [(1, 2), (13, 2), (16, 1)],
  term ((-144 : Rat) / 5) [(6, 1), (12, 1), (13, 2), (16, 1)],
  term ((72 : Rat) / 5) [(6, 2), (13, 2), (16, 1)],
  term ((-144 : Rat) / 5) [(7, 1), (13, 3), (16, 1)],
  term ((72 : Rat) / 5) [(7, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 275 for generator 26. -/
theorem rs_R006_ueqv_R006_partial_26_0275_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_26_0275
        rs_R006_ueqv_R006_generator_26_0200_0277 =
      rs_R006_ueqv_R006_partial_26_0275 := by
  native_decide

/-- Coefficient term 276 from coefficient polynomial 26. -/
def rs_R006_ueqv_R006_coefficient_26_0276 : Poly :=
[
  term ((282 : Rat) / 5) [(14, 1)]
]

/-- Partial product 276 for generator 26. -/
def rs_R006_ueqv_R006_partial_26_0276 : Poly :=
[
  term ((-564 : Rat) / 5) [(0, 1), (12, 1), (14, 1)],
  term ((282 : Rat) / 5) [(0, 2), (14, 1)],
  term ((-564 : Rat) / 5) [(1, 1), (13, 1), (14, 1)],
  term ((282 : Rat) / 5) [(1, 2), (14, 1)],
  term ((564 : Rat) / 5) [(6, 1), (12, 1), (14, 1)],
  term ((-282 : Rat) / 5) [(6, 2), (14, 1)],
  term ((564 : Rat) / 5) [(7, 1), (13, 1), (14, 1)],
  term ((-282 : Rat) / 5) [(7, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 276 for generator 26. -/
theorem rs_R006_ueqv_R006_partial_26_0276_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_26_0276
        rs_R006_ueqv_R006_generator_26_0200_0277 =
      rs_R006_ueqv_R006_partial_26_0276 := by
  native_decide

/-- Coefficient term 277 from coefficient polynomial 26. -/
def rs_R006_ueqv_R006_coefficient_26_0277 : Poly :=
[
  term ((6 : Rat) / 5) [(15, 2)]
]

/-- Partial product 277 for generator 26. -/
def rs_R006_ueqv_R006_partial_26_0277 : Poly :=
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
/-- Checked partial-product identity 277 for generator 26. -/
theorem rs_R006_ueqv_R006_partial_26_0277_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_26_0277
        rs_R006_ueqv_R006_generator_26_0200_0277 =
      rs_R006_ueqv_R006_partial_26_0277 := by
  native_decide

/-- Partial products in this block. -/
def rs_R006_ueqv_R006_partials_26_0200_0277 : List Poly :=
[
  rs_R006_ueqv_R006_partial_26_0200,
  rs_R006_ueqv_R006_partial_26_0201,
  rs_R006_ueqv_R006_partial_26_0202,
  rs_R006_ueqv_R006_partial_26_0203,
  rs_R006_ueqv_R006_partial_26_0204,
  rs_R006_ueqv_R006_partial_26_0205,
  rs_R006_ueqv_R006_partial_26_0206,
  rs_R006_ueqv_R006_partial_26_0207,
  rs_R006_ueqv_R006_partial_26_0208,
  rs_R006_ueqv_R006_partial_26_0209,
  rs_R006_ueqv_R006_partial_26_0210,
  rs_R006_ueqv_R006_partial_26_0211,
  rs_R006_ueqv_R006_partial_26_0212,
  rs_R006_ueqv_R006_partial_26_0213,
  rs_R006_ueqv_R006_partial_26_0214,
  rs_R006_ueqv_R006_partial_26_0215,
  rs_R006_ueqv_R006_partial_26_0216,
  rs_R006_ueqv_R006_partial_26_0217,
  rs_R006_ueqv_R006_partial_26_0218,
  rs_R006_ueqv_R006_partial_26_0219,
  rs_R006_ueqv_R006_partial_26_0220,
  rs_R006_ueqv_R006_partial_26_0221,
  rs_R006_ueqv_R006_partial_26_0222,
  rs_R006_ueqv_R006_partial_26_0223,
  rs_R006_ueqv_R006_partial_26_0224,
  rs_R006_ueqv_R006_partial_26_0225,
  rs_R006_ueqv_R006_partial_26_0226,
  rs_R006_ueqv_R006_partial_26_0227,
  rs_R006_ueqv_R006_partial_26_0228,
  rs_R006_ueqv_R006_partial_26_0229,
  rs_R006_ueqv_R006_partial_26_0230,
  rs_R006_ueqv_R006_partial_26_0231,
  rs_R006_ueqv_R006_partial_26_0232,
  rs_R006_ueqv_R006_partial_26_0233,
  rs_R006_ueqv_R006_partial_26_0234,
  rs_R006_ueqv_R006_partial_26_0235,
  rs_R006_ueqv_R006_partial_26_0236,
  rs_R006_ueqv_R006_partial_26_0237,
  rs_R006_ueqv_R006_partial_26_0238,
  rs_R006_ueqv_R006_partial_26_0239,
  rs_R006_ueqv_R006_partial_26_0240,
  rs_R006_ueqv_R006_partial_26_0241,
  rs_R006_ueqv_R006_partial_26_0242,
  rs_R006_ueqv_R006_partial_26_0243,
  rs_R006_ueqv_R006_partial_26_0244,
  rs_R006_ueqv_R006_partial_26_0245,
  rs_R006_ueqv_R006_partial_26_0246,
  rs_R006_ueqv_R006_partial_26_0247,
  rs_R006_ueqv_R006_partial_26_0248,
  rs_R006_ueqv_R006_partial_26_0249,
  rs_R006_ueqv_R006_partial_26_0250,
  rs_R006_ueqv_R006_partial_26_0251,
  rs_R006_ueqv_R006_partial_26_0252,
  rs_R006_ueqv_R006_partial_26_0253,
  rs_R006_ueqv_R006_partial_26_0254,
  rs_R006_ueqv_R006_partial_26_0255,
  rs_R006_ueqv_R006_partial_26_0256,
  rs_R006_ueqv_R006_partial_26_0257,
  rs_R006_ueqv_R006_partial_26_0258,
  rs_R006_ueqv_R006_partial_26_0259,
  rs_R006_ueqv_R006_partial_26_0260,
  rs_R006_ueqv_R006_partial_26_0261,
  rs_R006_ueqv_R006_partial_26_0262,
  rs_R006_ueqv_R006_partial_26_0263,
  rs_R006_ueqv_R006_partial_26_0264,
  rs_R006_ueqv_R006_partial_26_0265,
  rs_R006_ueqv_R006_partial_26_0266,
  rs_R006_ueqv_R006_partial_26_0267,
  rs_R006_ueqv_R006_partial_26_0268,
  rs_R006_ueqv_R006_partial_26_0269,
  rs_R006_ueqv_R006_partial_26_0270,
  rs_R006_ueqv_R006_partial_26_0271,
  rs_R006_ueqv_R006_partial_26_0272,
  rs_R006_ueqv_R006_partial_26_0273,
  rs_R006_ueqv_R006_partial_26_0274,
  rs_R006_ueqv_R006_partial_26_0275,
  rs_R006_ueqv_R006_partial_26_0276,
  rs_R006_ueqv_R006_partial_26_0277
]

/-- Sum of partial products in this block. -/
def rs_R006_ueqv_R006_block_26_0200_0277 : Poly :=
[
  term ((144 : Rat) / 35) [(0, 1), (5, 1), (8, 1), (12, 1), (13, 1)],
  term ((-288 : Rat) / 7) [(0, 1), (5, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((-3456 : Rat) / 35) [(0, 1), (5, 1), (11, 1), (12, 1), (13, 2)],
  term ((48 : Rat) / 5) [(0, 1), (5, 1), (11, 1), (12, 2)],
  term ((-48 : Rat) / 5) [(0, 1), (5, 1), (11, 1), (12, 2), (14, 1)],
  term ((2496 : Rat) / 35) [(0, 1), (5, 1), (11, 2), (12, 1), (13, 1)],
  term ((-984 : Rat) / 35) [(0, 1), (5, 1), (12, 1), (13, 1)],
  term (24 : Rat) [(0, 1), (5, 1), (12, 1), (13, 1), (14, 1)],
  term ((-48 : Rat) / 5) [(0, 1), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((48 : Rat) / 5) [(0, 1), (5, 1), (12, 1), (15, 1)],
  term ((-72 : Rat) / 35) [(0, 1), (7, 1), (8, 1), (12, 1), (13, 1)],
  term ((-144 : Rat) / 35) [(0, 1), (7, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((72 : Rat) / 5) [(0, 1), (7, 1), (11, 1), (12, 1)],
  term ((-96 : Rat) / 5) [(0, 1), (7, 1), (11, 1), (12, 1), (14, 1)],
  term ((10224 : Rat) / 35) [(0, 1), (7, 1), (12, 1), (13, 1)],
  term ((-2928 : Rat) / 5) [(0, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term (192 : Rat) [(0, 1), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term (-96 : Rat) [(0, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((24 : Rat) / 5) [(0, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((2856 : Rat) / 5) [(0, 1), (7, 1), (12, 1), (15, 1)],
  term (-192 : Rat) [(0, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((1224 : Rat) / 7) [(0, 1), (8, 1), (11, 1), (12, 1), (13, 1)],
  term ((-1728 : Rat) / 5) [(0, 1), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((576 : Rat) / 5) [(0, 1), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(0, 1), (8, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((1728 : Rat) / 5) [(0, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-576 : Rat) / 5) [(0, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1104 : Rat) / 5) [(0, 1), (9, 1), (11, 1), (12, 1)],
  term ((-20736 : Rat) / 5) [(0, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((6912 : Rat) / 5) [(0, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-13824 : Rat) / 7) [(0, 1), (9, 1), (11, 1), (12, 1), (13, 2)],
  term ((20736 : Rat) / 5) [(0, 1), (9, 1), (11, 1), (12, 1), (13, 2), (14, 1)],
  term ((-6912 : Rat) / 5) [(0, 1), (9, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((3456 : Rat) / 5) [(0, 1), (9, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-864 : Rat) / 5) [(0, 1), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((44304 : Rat) / 35) [(0, 1), (9, 1), (11, 2), (12, 1), (13, 1)],
  term ((-13248 : Rat) / 5) [(0, 1), (9, 1), (11, 2), (12, 1), (13, 1), (14, 1)],
  term ((4416 : Rat) / 5) [(0, 1), (9, 1), (11, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2208 : Rat) / 5) [(0, 1), (9, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((13248 : Rat) / 5) [(0, 1), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((-4416 : Rat) / 5) [(0, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-12696 : Rat) / 35) [(0, 1), (9, 1), (12, 1), (13, 1)],
  term ((3744 : Rat) / 5) [(0, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-1248 : Rat) / 5) [(0, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((624 : Rat) / 5) [(0, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-3744 : Rat) / 5) [(0, 1), (9, 1), (12, 1), (15, 1)],
  term ((1248 : Rat) / 5) [(0, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2304 : Rat) / 7) [(0, 1), (9, 2), (11, 1), (12, 1), (13, 1)],
  term ((3456 : Rat) / 5) [(0, 1), (9, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-1152 : Rat) / 5) [(0, 1), (9, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((576 : Rat) / 5) [(0, 1), (9, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-3456 : Rat) / 5) [(0, 1), (9, 2), (11, 1), (12, 1), (15, 1)],
  term ((1152 : Rat) / 5) [(0, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((13992 : Rat) / 35) [(0, 1), (11, 1), (12, 1), (13, 1)],
  term ((-1248 : Rat) / 5) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-192 : Rat) / 5) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((96 : Rat) / 5) [(0, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-2424 : Rat) / 25) [(0, 1), (11, 1), (12, 1), (15, 1)],
  term ((528 : Rat) / 25) [(0, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((5976 : Rat) / 35) [(0, 1), (11, 1), (12, 2), (13, 1)],
  term ((-1728 : Rat) / 5) [(0, 1), (11, 1), (12, 2), (13, 1), (14, 1)],
  term ((576 : Rat) / 5) [(0, 1), (11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(0, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((8124 : Rat) / 25) [(0, 1), (11, 1), (12, 2), (15, 1)],
  term ((-2568 : Rat) / 25) [(0, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1908 : Rat) / 5) [(0, 1), (11, 2), (12, 1)],
  term ((1452 : Rat) / 5) [(0, 1), (11, 2), (12, 1), (14, 1)],
  term (4 : Rat) [(0, 1), (11, 2), (12, 1), (16, 1)],
  term ((-4518 : Rat) / 25) [(0, 1), (12, 1), (13, 1), (15, 1)],
  term ((1476 : Rat) / 25) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3132 : Rat) / 35) [(0, 1), (12, 1), (13, 2)],
  term ((864 : Rat) / 5) [(0, 1), (12, 1), (13, 2), (14, 1)],
  term ((-288 : Rat) / 5) [(0, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((144 : Rat) / 5) [(0, 1), (12, 1), (13, 2), (16, 1)],
  term ((-564 : Rat) / 5) [(0, 1), (12, 1), (14, 1)],
  term ((-12 : Rat) / 5) [(0, 1), (12, 1), (15, 2)],
  term ((-576 : Rat) / 5) [(0, 1), (12, 2)],
  term ((456 : Rat) / 5) [(0, 1), (12, 2), (14, 1)],
  term ((-72 : Rat) / 35) [(0, 2), (5, 1), (8, 1), (13, 1)],
  term ((144 : Rat) / 7) [(0, 2), (5, 1), (9, 1), (11, 1), (13, 1)],
  term ((-24 : Rat) / 5) [(0, 2), (5, 1), (11, 1), (12, 1)],
  term ((24 : Rat) / 5) [(0, 2), (5, 1), (11, 1), (12, 1), (14, 1)],
  term ((1728 : Rat) / 35) [(0, 2), (5, 1), (11, 1), (13, 2)],
  term ((-1248 : Rat) / 35) [(0, 2), (5, 1), (11, 2), (13, 1)],
  term ((492 : Rat) / 35) [(0, 2), (5, 1), (13, 1)],
  term (-12 : Rat) [(0, 2), (5, 1), (13, 1), (14, 1)],
  term ((24 : Rat) / 5) [(0, 2), (5, 1), (14, 1), (15, 1)],
  term ((-24 : Rat) / 5) [(0, 2), (5, 1), (15, 1)],
  term ((36 : Rat) / 35) [(0, 2), (7, 1), (8, 1), (13, 1)],
  term ((72 : Rat) / 35) [(0, 2), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-36 : Rat) / 5) [(0, 2), (7, 1), (11, 1)],
  term ((48 : Rat) / 5) [(0, 2), (7, 1), (11, 1), (14, 1)],
  term ((-5112 : Rat) / 35) [(0, 2), (7, 1), (13, 1)],
  term ((1464 : Rat) / 5) [(0, 2), (7, 1), (13, 1), (14, 1)],
  term (-96 : Rat) [(0, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term (48 : Rat) [(0, 2), (7, 1), (13, 1), (16, 1)],
  term ((-12 : Rat) / 5) [(0, 2), (7, 1), (14, 1), (15, 1)],
  term ((-1428 : Rat) / 5) [(0, 2), (7, 1), (15, 1)],
  term (96 : Rat) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((-612 : Rat) / 7) [(0, 2), (8, 1), (11, 1), (13, 1)],
  term ((864 : Rat) / 5) [(0, 2), (8, 1), (11, 1), (13, 1), (14, 1)],
  term ((-288 : Rat) / 5) [(0, 2), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((144 : Rat) / 5) [(0, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-864 : Rat) / 5) [(0, 2), (8, 1), (11, 1), (15, 1)],
  term ((288 : Rat) / 5) [(0, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-552 : Rat) / 5) [(0, 2), (9, 1), (11, 1)],
  term ((10368 : Rat) / 5) [(0, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-3456 : Rat) / 5) [(0, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((6912 : Rat) / 7) [(0, 2), (9, 1), (11, 1), (13, 2)],
  term ((-10368 : Rat) / 5) [(0, 2), (9, 1), (11, 1), (13, 2), (14, 1)],
  term ((3456 : Rat) / 5) [(0, 2), (9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-1728 : Rat) / 5) [(0, 2), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((432 : Rat) / 5) [(0, 2), (9, 1), (11, 1), (14, 1)],
  term ((-22152 : Rat) / 35) [(0, 2), (9, 1), (11, 2), (13, 1)],
  term ((6624 : Rat) / 5) [(0, 2), (9, 1), (11, 2), (13, 1), (14, 1)],
  term ((-2208 : Rat) / 5) [(0, 2), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((1104 : Rat) / 5) [(0, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-6624 : Rat) / 5) [(0, 2), (9, 1), (11, 2), (15, 1)],
  term ((2208 : Rat) / 5) [(0, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((6348 : Rat) / 35) [(0, 2), (9, 1), (13, 1)],
  term ((-1872 : Rat) / 5) [(0, 2), (9, 1), (13, 1), (14, 1)],
  term ((624 : Rat) / 5) [(0, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-312 : Rat) / 5) [(0, 2), (9, 1), (13, 1), (16, 1)],
  term ((1872 : Rat) / 5) [(0, 2), (9, 1), (15, 1)],
  term ((-624 : Rat) / 5) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((1152 : Rat) / 7) [(0, 2), (9, 2), (11, 1), (13, 1)],
  term ((-1728 : Rat) / 5) [(0, 2), (9, 2), (11, 1), (13, 1), (14, 1)],
  term ((576 : Rat) / 5) [(0, 2), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(0, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((1728 : Rat) / 5) [(0, 2), (9, 2), (11, 1), (15, 1)],
  term ((-576 : Rat) / 5) [(0, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-2988 : Rat) / 35) [(0, 2), (11, 1), (12, 1), (13, 1)],
  term ((864 : Rat) / 5) [(0, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-288 : Rat) / 5) [(0, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((144 : Rat) / 5) [(0, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-4062 : Rat) / 25) [(0, 2), (11, 1), (12, 1), (15, 1)],
  term ((1284 : Rat) / 25) [(0, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-6996 : Rat) / 35) [(0, 2), (11, 1), (13, 1)],
  term ((624 : Rat) / 5) [(0, 2), (11, 1), (13, 1), (14, 1)],
  term ((96 : Rat) / 5) [(0, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-48 : Rat) / 5) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term ((1212 : Rat) / 25) [(0, 2), (11, 1), (15, 1)],
  term ((-264 : Rat) / 25) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((954 : Rat) / 5) [(0, 2), (11, 2)],
  term ((-726 : Rat) / 5) [(0, 2), (11, 2), (14, 1)],
  term (-2 : Rat) [(0, 2), (11, 2), (16, 1)],
  term ((288 : Rat) / 5) [(0, 2), (12, 1)],
  term ((-228 : Rat) / 5) [(0, 2), (12, 1), (14, 1)],
  term ((2259 : Rat) / 25) [(0, 2), (13, 1), (15, 1)],
  term ((-738 : Rat) / 25) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((1566 : Rat) / 35) [(0, 2), (13, 2)],
  term ((-432 : Rat) / 5) [(0, 2), (13, 2), (14, 1)],
  term ((144 : Rat) / 5) [(0, 2), (13, 2), (14, 1), (16, 1)],
  term ((-72 : Rat) / 5) [(0, 2), (13, 2), (16, 1)],
  term ((282 : Rat) / 5) [(0, 2), (14, 1)],
  term ((6 : Rat) / 5) [(0, 2), (15, 2)],
  term ((144 : Rat) / 35) [(1, 1), (5, 1), (8, 1), (13, 2)],
  term ((-288 : Rat) / 7) [(1, 1), (5, 1), (9, 1), (11, 1), (13, 2)],
  term ((48 : Rat) / 5) [(1, 1), (5, 1), (11, 1), (12, 1), (13, 1)],
  term ((-48 : Rat) / 5) [(1, 1), (5, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-3456 : Rat) / 35) [(1, 1), (5, 1), (11, 1), (13, 3)],
  term ((2496 : Rat) / 35) [(1, 1), (5, 1), (11, 2), (13, 2)],
  term ((-48 : Rat) / 5) [(1, 1), (5, 1), (13, 1), (14, 1), (15, 1)],
  term ((48 : Rat) / 5) [(1, 1), (5, 1), (13, 1), (15, 1)],
  term ((-984 : Rat) / 35) [(1, 1), (5, 1), (13, 2)],
  term (24 : Rat) [(1, 1), (5, 1), (13, 2), (14, 1)],
  term ((-72 : Rat) / 35) [(1, 1), (7, 1), (8, 1), (13, 2)],
  term ((-144 : Rat) / 35) [(1, 1), (7, 1), (9, 1), (11, 1), (13, 2)],
  term ((72 : Rat) / 5) [(1, 1), (7, 1), (11, 1), (13, 1)],
  term ((-96 : Rat) / 5) [(1, 1), (7, 1), (11, 1), (13, 1), (14, 1)],
  term ((24 : Rat) / 5) [(1, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((2856 : Rat) / 5) [(1, 1), (7, 1), (13, 1), (15, 1)],
  term (-192 : Rat) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((10224 : Rat) / 35) [(1, 1), (7, 1), (13, 2)],
  term ((-2928 : Rat) / 5) [(1, 1), (7, 1), (13, 2), (14, 1)],
  term (192 : Rat) [(1, 1), (7, 1), (13, 2), (14, 1), (16, 1)],
  term (-96 : Rat) [(1, 1), (7, 1), (13, 2), (16, 1)],
  term ((1728 : Rat) / 5) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-576 : Rat) / 5) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1224 : Rat) / 7) [(1, 1), (8, 1), (11, 1), (13, 2)],
  term ((-1728 : Rat) / 5) [(1, 1), (8, 1), (11, 1), (13, 2), (14, 1)],
  term ((576 : Rat) / 5) [(1, 1), (8, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(1, 1), (8, 1), (11, 1), (13, 2), (16, 1)],
  term ((1104 : Rat) / 5) [(1, 1), (9, 1), (11, 1), (13, 1)],
  term ((-864 : Rat) / 5) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((-20736 : Rat) / 5) [(1, 1), (9, 1), (11, 1), (13, 2), (15, 1)],
  term ((6912 : Rat) / 5) [(1, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-13824 : Rat) / 7) [(1, 1), (9, 1), (11, 1), (13, 3)],
  term ((20736 : Rat) / 5) [(1, 1), (9, 1), (11, 1), (13, 3), (14, 1)],
  term ((-6912 : Rat) / 5) [(1, 1), (9, 1), (11, 1), (13, 3), (14, 1), (16, 1)],
  term ((3456 : Rat) / 5) [(1, 1), (9, 1), (11, 1), (13, 3), (16, 1)],
  term ((13248 : Rat) / 5) [(1, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((-4416 : Rat) / 5) [(1, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((44304 : Rat) / 35) [(1, 1), (9, 1), (11, 2), (13, 2)],
  term ((-13248 : Rat) / 5) [(1, 1), (9, 1), (11, 2), (13, 2), (14, 1)],
  term ((4416 : Rat) / 5) [(1, 1), (9, 1), (11, 2), (13, 2), (14, 1), (16, 1)],
  term ((-2208 : Rat) / 5) [(1, 1), (9, 1), (11, 2), (13, 2), (16, 1)],
  term ((-3744 : Rat) / 5) [(1, 1), (9, 1), (13, 1), (15, 1)],
  term ((1248 : Rat) / 5) [(1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-12696 : Rat) / 35) [(1, 1), (9, 1), (13, 2)],
  term ((3744 : Rat) / 5) [(1, 1), (9, 1), (13, 2), (14, 1)],
  term ((-1248 : Rat) / 5) [(1, 1), (9, 1), (13, 2), (14, 1), (16, 1)],
  term ((624 : Rat) / 5) [(1, 1), (9, 1), (13, 2), (16, 1)],
  term ((-3456 : Rat) / 5) [(1, 1), (9, 2), (11, 1), (13, 1), (15, 1)],
  term ((1152 : Rat) / 5) [(1, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2304 : Rat) / 7) [(1, 1), (9, 2), (11, 1), (13, 2)],
  term ((3456 : Rat) / 5) [(1, 1), (9, 2), (11, 1), (13, 2), (14, 1)],
  term ((-1152 : Rat) / 5) [(1, 1), (9, 2), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((576 : Rat) / 5) [(1, 1), (9, 2), (11, 1), (13, 2), (16, 1)],
  term ((8124 : Rat) / 25) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-2568 : Rat) / 25) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((5976 : Rat) / 35) [(1, 1), (11, 1), (12, 1), (13, 2)],
  term ((-1728 : Rat) / 5) [(1, 1), (11, 1), (12, 1), (13, 2), (14, 1)],
  term ((576 : Rat) / 5) [(1, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(1, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-2424 : Rat) / 25) [(1, 1), (11, 1), (13, 1), (15, 1)],
  term ((528 : Rat) / 25) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((13992 : Rat) / 35) [(1, 1), (11, 1), (13, 2)],
  term ((-1248 : Rat) / 5) [(1, 1), (11, 1), (13, 2), (14, 1)],
  term ((-192 : Rat) / 5) [(1, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((96 : Rat) / 5) [(1, 1), (11, 1), (13, 2), (16, 1)],
  term ((-1908 : Rat) / 5) [(1, 1), (11, 2), (13, 1)],
  term ((1452 : Rat) / 5) [(1, 1), (11, 2), (13, 1), (14, 1)],
  term (4 : Rat) [(1, 1), (11, 2), (13, 1), (16, 1)],
  term ((-576 : Rat) / 5) [(1, 1), (12, 1), (13, 1)],
  term ((456 : Rat) / 5) [(1, 1), (12, 1), (13, 1), (14, 1)],
  term ((-564 : Rat) / 5) [(1, 1), (13, 1), (14, 1)],
  term ((-12 : Rat) / 5) [(1, 1), (13, 1), (15, 2)],
  term ((-4518 : Rat) / 25) [(1, 1), (13, 2), (15, 1)],
  term ((1476 : Rat) / 25) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((-3132 : Rat) / 35) [(1, 1), (13, 3)],
  term ((864 : Rat) / 5) [(1, 1), (13, 3), (14, 1)],
  term ((-288 : Rat) / 5) [(1, 1), (13, 3), (14, 1), (16, 1)],
  term ((144 : Rat) / 5) [(1, 1), (13, 3), (16, 1)],
  term ((-72 : Rat) / 35) [(1, 2), (5, 1), (8, 1), (13, 1)],
  term ((144 : Rat) / 7) [(1, 2), (5, 1), (9, 1), (11, 1), (13, 1)],
  term ((-24 : Rat) / 5) [(1, 2), (5, 1), (11, 1), (12, 1)],
  term ((24 : Rat) / 5) [(1, 2), (5, 1), (11, 1), (12, 1), (14, 1)],
  term ((1728 : Rat) / 35) [(1, 2), (5, 1), (11, 1), (13, 2)],
  term ((-1248 : Rat) / 35) [(1, 2), (5, 1), (11, 2), (13, 1)],
  term ((492 : Rat) / 35) [(1, 2), (5, 1), (13, 1)],
  term (-12 : Rat) [(1, 2), (5, 1), (13, 1), (14, 1)],
  term ((24 : Rat) / 5) [(1, 2), (5, 1), (14, 1), (15, 1)],
  term ((-24 : Rat) / 5) [(1, 2), (5, 1), (15, 1)],
  term ((36 : Rat) / 35) [(1, 2), (7, 1), (8, 1), (13, 1)],
  term ((72 : Rat) / 35) [(1, 2), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-36 : Rat) / 5) [(1, 2), (7, 1), (11, 1)],
  term ((48 : Rat) / 5) [(1, 2), (7, 1), (11, 1), (14, 1)],
  term ((-5112 : Rat) / 35) [(1, 2), (7, 1), (13, 1)],
  term ((1464 : Rat) / 5) [(1, 2), (7, 1), (13, 1), (14, 1)],
  term (-96 : Rat) [(1, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term (48 : Rat) [(1, 2), (7, 1), (13, 1), (16, 1)],
  term ((-12 : Rat) / 5) [(1, 2), (7, 1), (14, 1), (15, 1)],
  term ((-1428 : Rat) / 5) [(1, 2), (7, 1), (15, 1)],
  term (96 : Rat) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((-612 : Rat) / 7) [(1, 2), (8, 1), (11, 1), (13, 1)],
  term ((864 : Rat) / 5) [(1, 2), (8, 1), (11, 1), (13, 1), (14, 1)],
  term ((-288 : Rat) / 5) [(1, 2), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((144 : Rat) / 5) [(1, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-864 : Rat) / 5) [(1, 2), (8, 1), (11, 1), (15, 1)],
  term ((288 : Rat) / 5) [(1, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-552 : Rat) / 5) [(1, 2), (9, 1), (11, 1)],
  term ((10368 : Rat) / 5) [(1, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-3456 : Rat) / 5) [(1, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((6912 : Rat) / 7) [(1, 2), (9, 1), (11, 1), (13, 2)],
  term ((-10368 : Rat) / 5) [(1, 2), (9, 1), (11, 1), (13, 2), (14, 1)],
  term ((3456 : Rat) / 5) [(1, 2), (9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-1728 : Rat) / 5) [(1, 2), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((432 : Rat) / 5) [(1, 2), (9, 1), (11, 1), (14, 1)],
  term ((-22152 : Rat) / 35) [(1, 2), (9, 1), (11, 2), (13, 1)],
  term ((6624 : Rat) / 5) [(1, 2), (9, 1), (11, 2), (13, 1), (14, 1)],
  term ((-2208 : Rat) / 5) [(1, 2), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((1104 : Rat) / 5) [(1, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-6624 : Rat) / 5) [(1, 2), (9, 1), (11, 2), (15, 1)],
  term ((2208 : Rat) / 5) [(1, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((6348 : Rat) / 35) [(1, 2), (9, 1), (13, 1)],
  term ((-1872 : Rat) / 5) [(1, 2), (9, 1), (13, 1), (14, 1)],
  term ((624 : Rat) / 5) [(1, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-312 : Rat) / 5) [(1, 2), (9, 1), (13, 1), (16, 1)],
  term ((1872 : Rat) / 5) [(1, 2), (9, 1), (15, 1)],
  term ((-624 : Rat) / 5) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((1152 : Rat) / 7) [(1, 2), (9, 2), (11, 1), (13, 1)],
  term ((-1728 : Rat) / 5) [(1, 2), (9, 2), (11, 1), (13, 1), (14, 1)],
  term ((576 : Rat) / 5) [(1, 2), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(1, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((1728 : Rat) / 5) [(1, 2), (9, 2), (11, 1), (15, 1)],
  term ((-576 : Rat) / 5) [(1, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-2988 : Rat) / 35) [(1, 2), (11, 1), (12, 1), (13, 1)],
  term ((864 : Rat) / 5) [(1, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-288 : Rat) / 5) [(1, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((144 : Rat) / 5) [(1, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-4062 : Rat) / 25) [(1, 2), (11, 1), (12, 1), (15, 1)],
  term ((1284 : Rat) / 25) [(1, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-6996 : Rat) / 35) [(1, 2), (11, 1), (13, 1)],
  term ((624 : Rat) / 5) [(1, 2), (11, 1), (13, 1), (14, 1)],
  term ((96 : Rat) / 5) [(1, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-48 : Rat) / 5) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term ((1212 : Rat) / 25) [(1, 2), (11, 1), (15, 1)],
  term ((-264 : Rat) / 25) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((954 : Rat) / 5) [(1, 2), (11, 2)],
  term ((-726 : Rat) / 5) [(1, 2), (11, 2), (14, 1)],
  term (-2 : Rat) [(1, 2), (11, 2), (16, 1)],
  term ((288 : Rat) / 5) [(1, 2), (12, 1)],
  term ((-228 : Rat) / 5) [(1, 2), (12, 1), (14, 1)],
  term ((2259 : Rat) / 25) [(1, 2), (13, 1), (15, 1)],
  term ((-738 : Rat) / 25) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((1566 : Rat) / 35) [(1, 2), (13, 2)],
  term ((-432 : Rat) / 5) [(1, 2), (13, 2), (14, 1)],
  term ((144 : Rat) / 5) [(1, 2), (13, 2), (14, 1), (16, 1)],
  term ((-72 : Rat) / 5) [(1, 2), (13, 2), (16, 1)],
  term ((282 : Rat) / 5) [(1, 2), (14, 1)],
  term ((6 : Rat) / 5) [(1, 2), (15, 2)],
  term ((-144 : Rat) / 35) [(5, 1), (6, 1), (8, 1), (12, 1), (13, 1)],
  term ((288 : Rat) / 7) [(5, 1), (6, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((3456 : Rat) / 35) [(5, 1), (6, 1), (11, 1), (12, 1), (13, 2)],
  term ((-48 : Rat) / 5) [(5, 1), (6, 1), (11, 1), (12, 2)],
  term ((48 : Rat) / 5) [(5, 1), (6, 1), (11, 1), (12, 2), (14, 1)],
  term ((-2496 : Rat) / 35) [(5, 1), (6, 1), (11, 2), (12, 1), (13, 1)],
  term ((984 : Rat) / 35) [(5, 1), (6, 1), (12, 1), (13, 1)],
  term (-24 : Rat) [(5, 1), (6, 1), (12, 1), (13, 1), (14, 1)],
  term ((48 : Rat) / 5) [(5, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((-48 : Rat) / 5) [(5, 1), (6, 1), (12, 1), (15, 1)],
  term ((72 : Rat) / 35) [(5, 1), (6, 2), (8, 1), (13, 1)],
  term ((-144 : Rat) / 7) [(5, 1), (6, 2), (9, 1), (11, 1), (13, 1)],
  term ((24 : Rat) / 5) [(5, 1), (6, 2), (11, 1), (12, 1)],
  term ((-24 : Rat) / 5) [(5, 1), (6, 2), (11, 1), (12, 1), (14, 1)],
  term ((-1728 : Rat) / 35) [(5, 1), (6, 2), (11, 1), (13, 2)],
  term ((1248 : Rat) / 35) [(5, 1), (6, 2), (11, 2), (13, 1)],
  term ((-492 : Rat) / 35) [(5, 1), (6, 2), (13, 1)],
  term (12 : Rat) [(5, 1), (6, 2), (13, 1), (14, 1)],
  term ((-24 : Rat) / 5) [(5, 1), (6, 2), (14, 1), (15, 1)],
  term ((24 : Rat) / 5) [(5, 1), (6, 2), (15, 1)],
  term ((-144 : Rat) / 35) [(5, 1), (7, 1), (8, 1), (13, 2)],
  term ((288 : Rat) / 7) [(5, 1), (7, 1), (9, 1), (11, 1), (13, 2)],
  term ((-48 : Rat) / 5) [(5, 1), (7, 1), (11, 1), (12, 1), (13, 1)],
  term ((48 : Rat) / 5) [(5, 1), (7, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((3456 : Rat) / 35) [(5, 1), (7, 1), (11, 1), (13, 3)],
  term ((-2496 : Rat) / 35) [(5, 1), (7, 1), (11, 2), (13, 2)],
  term ((48 : Rat) / 5) [(5, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((-48 : Rat) / 5) [(5, 1), (7, 1), (13, 1), (15, 1)],
  term ((984 : Rat) / 35) [(5, 1), (7, 1), (13, 2)],
  term (-24 : Rat) [(5, 1), (7, 1), (13, 2), (14, 1)],
  term ((72 : Rat) / 35) [(5, 1), (7, 2), (8, 1), (13, 1)],
  term ((-144 : Rat) / 7) [(5, 1), (7, 2), (9, 1), (11, 1), (13, 1)],
  term ((24 : Rat) / 5) [(5, 1), (7, 2), (11, 1), (12, 1)],
  term ((-24 : Rat) / 5) [(5, 1), (7, 2), (11, 1), (12, 1), (14, 1)],
  term ((-1728 : Rat) / 35) [(5, 1), (7, 2), (11, 1), (13, 2)],
  term ((1248 : Rat) / 35) [(5, 1), (7, 2), (11, 2), (13, 1)],
  term ((-492 : Rat) / 35) [(5, 1), (7, 2), (13, 1)],
  term (12 : Rat) [(5, 1), (7, 2), (13, 1), (14, 1)],
  term ((-24 : Rat) / 5) [(5, 1), (7, 2), (14, 1), (15, 1)],
  term ((24 : Rat) / 5) [(5, 1), (7, 2), (15, 1)],
  term ((72 : Rat) / 35) [(6, 1), (7, 1), (8, 1), (12, 1), (13, 1)],
  term ((144 : Rat) / 35) [(6, 1), (7, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((-72 : Rat) / 5) [(6, 1), (7, 1), (11, 1), (12, 1)],
  term ((96 : Rat) / 5) [(6, 1), (7, 1), (11, 1), (12, 1), (14, 1)],
  term ((-10224 : Rat) / 35) [(6, 1), (7, 1), (12, 1), (13, 1)],
  term ((2928 : Rat) / 5) [(6, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term (-192 : Rat) [(6, 1), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term (96 : Rat) [(6, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-24 : Rat) / 5) [(6, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-2856 : Rat) / 5) [(6, 1), (7, 1), (12, 1), (15, 1)],
  term (192 : Rat) [(6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1224 : Rat) / 7) [(6, 1), (8, 1), (11, 1), (12, 1), (13, 1)],
  term ((1728 : Rat) / 5) [(6, 1), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-576 : Rat) / 5) [(6, 1), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((288 : Rat) / 5) [(6, 1), (8, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1728 : Rat) / 5) [(6, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((576 : Rat) / 5) [(6, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1104 : Rat) / 5) [(6, 1), (9, 1), (11, 1), (12, 1)],
  term ((20736 : Rat) / 5) [(6, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-6912 : Rat) / 5) [(6, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((13824 : Rat) / 7) [(6, 1), (9, 1), (11, 1), (12, 1), (13, 2)],
  term ((-20736 : Rat) / 5) [(6, 1), (9, 1), (11, 1), (12, 1), (13, 2), (14, 1)],
  term ((6912 : Rat) / 5) [(6, 1), (9, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-3456 : Rat) / 5) [(6, 1), (9, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((864 : Rat) / 5) [(6, 1), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((-44304 : Rat) / 35) [(6, 1), (9, 1), (11, 2), (12, 1), (13, 1)],
  term ((13248 : Rat) / 5) [(6, 1), (9, 1), (11, 2), (12, 1), (13, 1), (14, 1)],
  term ((-4416 : Rat) / 5) [(6, 1), (9, 1), (11, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((2208 : Rat) / 5) [(6, 1), (9, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((-13248 : Rat) / 5) [(6, 1), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((4416 : Rat) / 5) [(6, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((12696 : Rat) / 35) [(6, 1), (9, 1), (12, 1), (13, 1)],
  term ((-3744 : Rat) / 5) [(6, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((1248 : Rat) / 5) [(6, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-624 : Rat) / 5) [(6, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((3744 : Rat) / 5) [(6, 1), (9, 1), (12, 1), (15, 1)],
  term ((-1248 : Rat) / 5) [(6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((2304 : Rat) / 7) [(6, 1), (9, 2), (11, 1), (12, 1), (13, 1)],
  term ((-3456 : Rat) / 5) [(6, 1), (9, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((1152 : Rat) / 5) [(6, 1), (9, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-576 : Rat) / 5) [(6, 1), (9, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((3456 : Rat) / 5) [(6, 1), (9, 2), (11, 1), (12, 1), (15, 1)],
  term ((-1152 : Rat) / 5) [(6, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-13992 : Rat) / 35) [(6, 1), (11, 1), (12, 1), (13, 1)],
  term ((1248 : Rat) / 5) [(6, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((192 : Rat) / 5) [(6, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-96 : Rat) / 5) [(6, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((2424 : Rat) / 25) [(6, 1), (11, 1), (12, 1), (15, 1)],
  term ((-528 : Rat) / 25) [(6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-5976 : Rat) / 35) [(6, 1), (11, 1), (12, 2), (13, 1)],
  term ((1728 : Rat) / 5) [(6, 1), (11, 1), (12, 2), (13, 1), (14, 1)],
  term ((-576 : Rat) / 5) [(6, 1), (11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((288 : Rat) / 5) [(6, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-8124 : Rat) / 25) [(6, 1), (11, 1), (12, 2), (15, 1)],
  term ((2568 : Rat) / 25) [(6, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((1908 : Rat) / 5) [(6, 1), (11, 2), (12, 1)],
  term ((-1452 : Rat) / 5) [(6, 1), (11, 2), (12, 1), (14, 1)],
  term (-4 : Rat) [(6, 1), (11, 2), (12, 1), (16, 1)],
  term ((4518 : Rat) / 25) [(6, 1), (12, 1), (13, 1), (15, 1)],
  term ((-1476 : Rat) / 25) [(6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((3132 : Rat) / 35) [(6, 1), (12, 1), (13, 2)],
  term ((-864 : Rat) / 5) [(6, 1), (12, 1), (13, 2), (14, 1)],
  term ((288 : Rat) / 5) [(6, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-144 : Rat) / 5) [(6, 1), (12, 1), (13, 2), (16, 1)],
  term ((564 : Rat) / 5) [(6, 1), (12, 1), (14, 1)],
  term ((12 : Rat) / 5) [(6, 1), (12, 1), (15, 2)],
  term ((576 : Rat) / 5) [(6, 1), (12, 2)],
  term ((-456 : Rat) / 5) [(6, 1), (12, 2), (14, 1)],
  term ((-36 : Rat) / 35) [(6, 2), (7, 1), (8, 1), (13, 1)],
  term ((-72 : Rat) / 35) [(6, 2), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((36 : Rat) / 5) [(6, 2), (7, 1), (11, 1)],
  term ((-48 : Rat) / 5) [(6, 2), (7, 1), (11, 1), (14, 1)],
  term ((5112 : Rat) / 35) [(6, 2), (7, 1), (13, 1)],
  term ((-1464 : Rat) / 5) [(6, 2), (7, 1), (13, 1), (14, 1)],
  term (96 : Rat) [(6, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term (-48 : Rat) [(6, 2), (7, 1), (13, 1), (16, 1)],
  term ((12 : Rat) / 5) [(6, 2), (7, 1), (14, 1), (15, 1)],
  term ((1428 : Rat) / 5) [(6, 2), (7, 1), (15, 1)],
  term (-96 : Rat) [(6, 2), (7, 1), (15, 1), (16, 1)],
  term ((612 : Rat) / 7) [(6, 2), (8, 1), (11, 1), (13, 1)],
  term ((-864 : Rat) / 5) [(6, 2), (8, 1), (11, 1), (13, 1), (14, 1)],
  term ((288 : Rat) / 5) [(6, 2), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-144 : Rat) / 5) [(6, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((864 : Rat) / 5) [(6, 2), (8, 1), (11, 1), (15, 1)],
  term ((-288 : Rat) / 5) [(6, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((552 : Rat) / 5) [(6, 2), (9, 1), (11, 1)],
  term ((-10368 : Rat) / 5) [(6, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((3456 : Rat) / 5) [(6, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6912 : Rat) / 7) [(6, 2), (9, 1), (11, 1), (13, 2)],
  term ((10368 : Rat) / 5) [(6, 2), (9, 1), (11, 1), (13, 2), (14, 1)],
  term ((-3456 : Rat) / 5) [(6, 2), (9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((1728 : Rat) / 5) [(6, 2), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-432 : Rat) / 5) [(6, 2), (9, 1), (11, 1), (14, 1)],
  term ((22152 : Rat) / 35) [(6, 2), (9, 1), (11, 2), (13, 1)],
  term ((-6624 : Rat) / 5) [(6, 2), (9, 1), (11, 2), (13, 1), (14, 1)],
  term ((2208 : Rat) / 5) [(6, 2), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-1104 : Rat) / 5) [(6, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((6624 : Rat) / 5) [(6, 2), (9, 1), (11, 2), (15, 1)],
  term ((-2208 : Rat) / 5) [(6, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-6348 : Rat) / 35) [(6, 2), (9, 1), (13, 1)],
  term ((1872 : Rat) / 5) [(6, 2), (9, 1), (13, 1), (14, 1)],
  term ((-624 : Rat) / 5) [(6, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((312 : Rat) / 5) [(6, 2), (9, 1), (13, 1), (16, 1)],
  term ((-1872 : Rat) / 5) [(6, 2), (9, 1), (15, 1)],
  term ((624 : Rat) / 5) [(6, 2), (9, 1), (15, 1), (16, 1)],
  term ((-1152 : Rat) / 7) [(6, 2), (9, 2), (11, 1), (13, 1)],
  term ((1728 : Rat) / 5) [(6, 2), (9, 2), (11, 1), (13, 1), (14, 1)],
  term ((-576 : Rat) / 5) [(6, 2), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((288 : Rat) / 5) [(6, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-1728 : Rat) / 5) [(6, 2), (9, 2), (11, 1), (15, 1)],
  term ((576 : Rat) / 5) [(6, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((2988 : Rat) / 35) [(6, 2), (11, 1), (12, 1), (13, 1)],
  term ((-864 : Rat) / 5) [(6, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((288 : Rat) / 5) [(6, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-144 : Rat) / 5) [(6, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((4062 : Rat) / 25) [(6, 2), (11, 1), (12, 1), (15, 1)],
  term ((-1284 : Rat) / 25) [(6, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((6996 : Rat) / 35) [(6, 2), (11, 1), (13, 1)],
  term ((-624 : Rat) / 5) [(6, 2), (11, 1), (13, 1), (14, 1)],
  term ((-96 : Rat) / 5) [(6, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((48 : Rat) / 5) [(6, 2), (11, 1), (13, 1), (16, 1)],
  term ((-1212 : Rat) / 25) [(6, 2), (11, 1), (15, 1)],
  term ((264 : Rat) / 25) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-954 : Rat) / 5) [(6, 2), (11, 2)],
  term ((726 : Rat) / 5) [(6, 2), (11, 2), (14, 1)],
  term (2 : Rat) [(6, 2), (11, 2), (16, 1)],
  term ((-288 : Rat) / 5) [(6, 2), (12, 1)],
  term ((228 : Rat) / 5) [(6, 2), (12, 1), (14, 1)],
  term ((-2259 : Rat) / 25) [(6, 2), (13, 1), (15, 1)],
  term ((738 : Rat) / 25) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1566 : Rat) / 35) [(6, 2), (13, 2)],
  term ((432 : Rat) / 5) [(6, 2), (13, 2), (14, 1)],
  term ((-144 : Rat) / 5) [(6, 2), (13, 2), (14, 1), (16, 1)],
  term ((72 : Rat) / 5) [(6, 2), (13, 2), (16, 1)],
  term ((-282 : Rat) / 5) [(6, 2), (14, 1)],
  term ((-6 : Rat) / 5) [(6, 2), (15, 2)],
  term ((-1728 : Rat) / 5) [(7, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((576 : Rat) / 5) [(7, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1224 : Rat) / 7) [(7, 1), (8, 1), (11, 1), (13, 2)],
  term ((1728 : Rat) / 5) [(7, 1), (8, 1), (11, 1), (13, 2), (14, 1)],
  term ((-576 : Rat) / 5) [(7, 1), (8, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((288 : Rat) / 5) [(7, 1), (8, 1), (11, 1), (13, 2), (16, 1)],
  term ((-1104 : Rat) / 5) [(7, 1), (9, 1), (11, 1), (13, 1)],
  term ((864 : Rat) / 5) [(7, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((20736 : Rat) / 5) [(7, 1), (9, 1), (11, 1), (13, 2), (15, 1)],
  term ((-6912 : Rat) / 5) [(7, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((13824 : Rat) / 7) [(7, 1), (9, 1), (11, 1), (13, 3)],
  term ((-20736 : Rat) / 5) [(7, 1), (9, 1), (11, 1), (13, 3), (14, 1)],
  term ((6912 : Rat) / 5) [(7, 1), (9, 1), (11, 1), (13, 3), (14, 1), (16, 1)],
  term ((-3456 : Rat) / 5) [(7, 1), (9, 1), (11, 1), (13, 3), (16, 1)],
  term ((-13248 : Rat) / 5) [(7, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((4416 : Rat) / 5) [(7, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-44304 : Rat) / 35) [(7, 1), (9, 1), (11, 2), (13, 2)],
  term ((13248 : Rat) / 5) [(7, 1), (9, 1), (11, 2), (13, 2), (14, 1)],
  term ((-4416 : Rat) / 5) [(7, 1), (9, 1), (11, 2), (13, 2), (14, 1), (16, 1)],
  term ((2208 : Rat) / 5) [(7, 1), (9, 1), (11, 2), (13, 2), (16, 1)],
  term ((3744 : Rat) / 5) [(7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-1248 : Rat) / 5) [(7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((12696 : Rat) / 35) [(7, 1), (9, 1), (13, 2)],
  term ((-3744 : Rat) / 5) [(7, 1), (9, 1), (13, 2), (14, 1)],
  term ((1248 : Rat) / 5) [(7, 1), (9, 1), (13, 2), (14, 1), (16, 1)],
  term ((-624 : Rat) / 5) [(7, 1), (9, 1), (13, 2), (16, 1)],
  term ((3456 : Rat) / 5) [(7, 1), (9, 2), (11, 1), (13, 1), (15, 1)],
  term ((-1152 : Rat) / 5) [(7, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((2304 : Rat) / 7) [(7, 1), (9, 2), (11, 1), (13, 2)],
  term ((-3456 : Rat) / 5) [(7, 1), (9, 2), (11, 1), (13, 2), (14, 1)],
  term ((1152 : Rat) / 5) [(7, 1), (9, 2), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-576 : Rat) / 5) [(7, 1), (9, 2), (11, 1), (13, 2), (16, 1)],
  term ((-8124 : Rat) / 25) [(7, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((2568 : Rat) / 25) [(7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5976 : Rat) / 35) [(7, 1), (11, 1), (12, 1), (13, 2)],
  term ((1728 : Rat) / 5) [(7, 1), (11, 1), (12, 1), (13, 2), (14, 1)],
  term ((-576 : Rat) / 5) [(7, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((288 : Rat) / 5) [(7, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((2424 : Rat) / 25) [(7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-528 : Rat) / 25) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-13992 : Rat) / 35) [(7, 1), (11, 1), (13, 2)],
  term ((1248 : Rat) / 5) [(7, 1), (11, 1), (13, 2), (14, 1)],
  term ((192 : Rat) / 5) [(7, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-96 : Rat) / 5) [(7, 1), (11, 1), (13, 2), (16, 1)],
  term ((1908 : Rat) / 5) [(7, 1), (11, 2), (13, 1)],
  term ((-1452 : Rat) / 5) [(7, 1), (11, 2), (13, 1), (14, 1)],
  term (-4 : Rat) [(7, 1), (11, 2), (13, 1), (16, 1)],
  term ((576 : Rat) / 5) [(7, 1), (12, 1), (13, 1)],
  term ((-456 : Rat) / 5) [(7, 1), (12, 1), (13, 1), (14, 1)],
  term ((564 : Rat) / 5) [(7, 1), (13, 1), (14, 1)],
  term ((12 : Rat) / 5) [(7, 1), (13, 1), (15, 2)],
  term ((4518 : Rat) / 25) [(7, 1), (13, 2), (15, 1)],
  term ((-1476 : Rat) / 25) [(7, 1), (13, 2), (15, 1), (16, 1)],
  term ((3132 : Rat) / 35) [(7, 1), (13, 3)],
  term ((-864 : Rat) / 5) [(7, 1), (13, 3), (14, 1)],
  term ((288 : Rat) / 5) [(7, 1), (13, 3), (14, 1), (16, 1)],
  term ((-144 : Rat) / 5) [(7, 1), (13, 3), (16, 1)],
  term ((612 : Rat) / 7) [(7, 2), (8, 1), (11, 1), (13, 1)],
  term ((-864 : Rat) / 5) [(7, 2), (8, 1), (11, 1), (13, 1), (14, 1)],
  term ((288 : Rat) / 5) [(7, 2), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-144 : Rat) / 5) [(7, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((864 : Rat) / 5) [(7, 2), (8, 1), (11, 1), (15, 1)],
  term ((-288 : Rat) / 5) [(7, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((72 : Rat) / 35) [(7, 2), (8, 1), (13, 2)],
  term ((552 : Rat) / 5) [(7, 2), (9, 1), (11, 1)],
  term ((-10368 : Rat) / 5) [(7, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((3456 : Rat) / 5) [(7, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-34416 : Rat) / 35) [(7, 2), (9, 1), (11, 1), (13, 2)],
  term ((10368 : Rat) / 5) [(7, 2), (9, 1), (11, 1), (13, 2), (14, 1)],
  term ((-3456 : Rat) / 5) [(7, 2), (9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((1728 : Rat) / 5) [(7, 2), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-432 : Rat) / 5) [(7, 2), (9, 1), (11, 1), (14, 1)],
  term ((22152 : Rat) / 35) [(7, 2), (9, 1), (11, 2), (13, 1)],
  term ((-6624 : Rat) / 5) [(7, 2), (9, 1), (11, 2), (13, 1), (14, 1)],
  term ((2208 : Rat) / 5) [(7, 2), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-1104 : Rat) / 5) [(7, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((6624 : Rat) / 5) [(7, 2), (9, 1), (11, 2), (15, 1)],
  term ((-2208 : Rat) / 5) [(7, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-6348 : Rat) / 35) [(7, 2), (9, 1), (13, 1)],
  term ((1872 : Rat) / 5) [(7, 2), (9, 1), (13, 1), (14, 1)],
  term ((-624 : Rat) / 5) [(7, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((312 : Rat) / 5) [(7, 2), (9, 1), (13, 1), (16, 1)],
  term ((-1872 : Rat) / 5) [(7, 2), (9, 1), (15, 1)],
  term ((624 : Rat) / 5) [(7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-1152 : Rat) / 7) [(7, 2), (9, 2), (11, 1), (13, 1)],
  term ((1728 : Rat) / 5) [(7, 2), (9, 2), (11, 1), (13, 1), (14, 1)],
  term ((-576 : Rat) / 5) [(7, 2), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((288 : Rat) / 5) [(7, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-1728 : Rat) / 5) [(7, 2), (9, 2), (11, 1), (15, 1)],
  term ((576 : Rat) / 5) [(7, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((2988 : Rat) / 35) [(7, 2), (11, 1), (12, 1), (13, 1)],
  term ((-864 : Rat) / 5) [(7, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((288 : Rat) / 5) [(7, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-144 : Rat) / 5) [(7, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((4062 : Rat) / 25) [(7, 2), (11, 1), (12, 1), (15, 1)],
  term ((-1284 : Rat) / 25) [(7, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((6492 : Rat) / 35) [(7, 2), (11, 1), (13, 1)],
  term ((-528 : Rat) / 5) [(7, 2), (11, 1), (13, 1), (14, 1)],
  term ((-96 : Rat) / 5) [(7, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((48 : Rat) / 5) [(7, 2), (11, 1), (13, 1), (16, 1)],
  term ((-1212 : Rat) / 25) [(7, 2), (11, 1), (15, 1)],
  term ((264 : Rat) / 25) [(7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-954 : Rat) / 5) [(7, 2), (11, 2)],
  term ((726 : Rat) / 5) [(7, 2), (11, 2), (14, 1)],
  term (2 : Rat) [(7, 2), (11, 2), (16, 1)],
  term ((-288 : Rat) / 5) [(7, 2), (12, 1)],
  term ((228 : Rat) / 5) [(7, 2), (12, 1), (14, 1)],
  term ((-24 : Rat) / 5) [(7, 2), (13, 1), (14, 1), (15, 1)],
  term ((-16539 : Rat) / 25) [(7, 2), (13, 1), (15, 1)],
  term ((5538 : Rat) / 25) [(7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2358 : Rat) / 7) [(7, 2), (13, 2)],
  term (672 : Rat) [(7, 2), (13, 2), (14, 1)],
  term ((-1104 : Rat) / 5) [(7, 2), (13, 2), (14, 1), (16, 1)],
  term ((552 : Rat) / 5) [(7, 2), (13, 2), (16, 1)],
  term ((-282 : Rat) / 5) [(7, 2), (14, 1)],
  term ((-6 : Rat) / 5) [(7, 2), (15, 2)],
  term ((-36 : Rat) / 35) [(7, 3), (8, 1), (13, 1)],
  term ((-72 : Rat) / 35) [(7, 3), (9, 1), (11, 1), (13, 1)],
  term ((36 : Rat) / 5) [(7, 3), (11, 1)],
  term ((-48 : Rat) / 5) [(7, 3), (11, 1), (14, 1)],
  term ((5112 : Rat) / 35) [(7, 3), (13, 1)],
  term ((-1464 : Rat) / 5) [(7, 3), (13, 1), (14, 1)],
  term (96 : Rat) [(7, 3), (13, 1), (14, 1), (16, 1)],
  term (-48 : Rat) [(7, 3), (13, 1), (16, 1)],
  term ((12 : Rat) / 5) [(7, 3), (14, 1), (15, 1)],
  term ((1428 : Rat) / 5) [(7, 3), (15, 1)],
  term (-96 : Rat) [(7, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 26, terms 200 through 277. -/
theorem rs_R006_ueqv_R006_block_26_0200_0277_valid :
    checkProductSumEq rs_R006_ueqv_R006_partials_26_0200_0277
      rs_R006_ueqv_R006_block_26_0200_0277 = true := by
  native_decide

end R006UeqvR006TermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
