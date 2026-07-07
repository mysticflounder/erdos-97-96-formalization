/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R002:u=v:R002YNYN, term block 25:200-217

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R002UeqvR002YNYNTermShards

/-- Generator polynomial 25 for relaxed split surplus certificate `R002:u=v:R002YNYN`. -/
def rs_R002_ueqv_R002YNYN_generator_25_0200_0217 : Poly :=
[
  term (-2 : Rat) [(0, 1), (12, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (13, 1)],
  term (1 : Rat) [(1, 2)]
]

/-- Coefficient term 200 from coefficient polynomial 25. -/
def rs_R002_ueqv_R002YNYN_coefficient_25_0200 : Poly :=
[
  term ((103 : Rat) / 4) [(10, 1)]
]

/-- Partial product 200 for generator 25. -/
def rs_R002_ueqv_R002YNYN_partial_25_0200 : Poly :=
[
  term ((-103 : Rat) / 2) [(0, 1), (10, 1), (12, 1)],
  term ((103 : Rat) / 4) [(0, 2), (10, 1)],
  term ((-103 : Rat) / 2) [(1, 1), (10, 1), (13, 1)],
  term ((103 : Rat) / 4) [(1, 2), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 25. -/
theorem rs_R002_ueqv_R002YNYN_partial_25_0200_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_25_0200
        rs_R002_ueqv_R002YNYN_generator_25_0200_0217 =
      rs_R002_ueqv_R002YNYN_partial_25_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 25. -/
def rs_R002_ueqv_R002YNYN_coefficient_25_0201 : Poly :=
[
  term (-6 : Rat) [(10, 1), (11, 1), (15, 1)]
]

/-- Partial product 201 for generator 25. -/
def rs_R002_ueqv_R002YNYN_partial_25_0201 : Poly :=
[
  term (12 : Rat) [(0, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term (-6 : Rat) [(0, 2), (10, 1), (11, 1), (15, 1)],
  term (12 : Rat) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term (-6 : Rat) [(1, 2), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 25. -/
theorem rs_R002_ueqv_R002YNYN_partial_25_0201_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_25_0201
        rs_R002_ueqv_R002YNYN_generator_25_0200_0217 =
      rs_R002_ueqv_R002YNYN_partial_25_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 25. -/
def rs_R002_ueqv_R002YNYN_coefficient_25_0202 : Poly :=
[
  term (-42 : Rat) [(10, 1), (12, 1)]
]

/-- Partial product 202 for generator 25. -/
def rs_R002_ueqv_R002YNYN_partial_25_0202 : Poly :=
[
  term (84 : Rat) [(0, 1), (10, 1), (12, 2)],
  term (-42 : Rat) [(0, 2), (10, 1), (12, 1)],
  term (84 : Rat) [(1, 1), (10, 1), (12, 1), (13, 1)],
  term (-42 : Rat) [(1, 2), (10, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 25. -/
theorem rs_R002_ueqv_R002YNYN_partial_25_0202_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_25_0202
        rs_R002_ueqv_R002YNYN_generator_25_0200_0217 =
      rs_R002_ueqv_R002YNYN_partial_25_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 25. -/
def rs_R002_ueqv_R002YNYN_coefficient_25_0203 : Poly :=
[
  term ((16 : Rat) / 3) [(10, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 203 for generator 25. -/
def rs_R002_ueqv_R002YNYN_partial_25_0203 : Poly :=
[
  term ((-32 : Rat) / 3) [(0, 1), (10, 1), (12, 2), (15, 2), (16, 1)],
  term ((16 : Rat) / 3) [(0, 2), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-32 : Rat) / 3) [(1, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((16 : Rat) / 3) [(1, 2), (10, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 25. -/
theorem rs_R002_ueqv_R002YNYN_partial_25_0203_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_25_0203
        rs_R002_ueqv_R002YNYN_generator_25_0200_0217 =
      rs_R002_ueqv_R002YNYN_partial_25_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 25. -/
def rs_R002_ueqv_R002YNYN_coefficient_25_0204 : Poly :=
[
  term ((8 : Rat) / 3) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 204 for generator 25. -/
def rs_R002_ueqv_R002YNYN_partial_25_0204 : Poly :=
[
  term ((-16 : Rat) / 3) [(0, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 3) [(0, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 3) [(1, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((8 : Rat) / 3) [(1, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 25. -/
theorem rs_R002_ueqv_R002YNYN_partial_25_0204_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_25_0204
        rs_R002_ueqv_R002YNYN_generator_25_0200_0217 =
      rs_R002_ueqv_R002YNYN_partial_25_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 25. -/
def rs_R002_ueqv_R002YNYN_coefficient_25_0205 : Poly :=
[
  term (-21 : Rat) [(10, 1), (15, 2)]
]

/-- Partial product 205 for generator 25. -/
def rs_R002_ueqv_R002YNYN_partial_25_0205 : Poly :=
[
  term (42 : Rat) [(0, 1), (10, 1), (12, 1), (15, 2)],
  term (-21 : Rat) [(0, 2), (10, 1), (15, 2)],
  term (42 : Rat) [(1, 1), (10, 1), (13, 1), (15, 2)],
  term (-21 : Rat) [(1, 2), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 25. -/
theorem rs_R002_ueqv_R002YNYN_partial_25_0205_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_25_0205
        rs_R002_ueqv_R002YNYN_generator_25_0200_0217 =
      rs_R002_ueqv_R002YNYN_partial_25_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 25. -/
def rs_R002_ueqv_R002YNYN_coefficient_25_0206 : Poly :=
[
  term ((-20 : Rat) / 3) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 206 for generator 25. -/
def rs_R002_ueqv_R002YNYN_partial_25_0206 : Poly :=
[
  term ((40 : Rat) / 3) [(0, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-20 : Rat) / 3) [(0, 2), (10, 1), (15, 2), (16, 1)],
  term ((40 : Rat) / 3) [(1, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-20 : Rat) / 3) [(1, 2), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 25. -/
theorem rs_R002_ueqv_R002YNYN_partial_25_0206_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_25_0206
        rs_R002_ueqv_R002YNYN_generator_25_0200_0217 =
      rs_R002_ueqv_R002YNYN_partial_25_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 25. -/
def rs_R002_ueqv_R002YNYN_coefficient_25_0207 : Poly :=
[
  term (-3 : Rat) [(10, 2)]
]

/-- Partial product 207 for generator 25. -/
def rs_R002_ueqv_R002YNYN_partial_25_0207 : Poly :=
[
  term (6 : Rat) [(0, 1), (10, 2), (12, 1)],
  term (-3 : Rat) [(0, 2), (10, 2)],
  term (6 : Rat) [(1, 1), (10, 2), (13, 1)],
  term (-3 : Rat) [(1, 2), (10, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 25. -/
theorem rs_R002_ueqv_R002YNYN_partial_25_0207_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_25_0207
        rs_R002_ueqv_R002YNYN_generator_25_0200_0217 =
      rs_R002_ueqv_R002YNYN_partial_25_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 25. -/
def rs_R002_ueqv_R002YNYN_coefficient_25_0208 : Poly :=
[
  term ((2 : Rat) / 3) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 208 for generator 25. -/
def rs_R002_ueqv_R002YNYN_partial_25_0208 : Poly :=
[
  term ((-4 : Rat) / 3) [(0, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((2 : Rat) / 3) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((2 : Rat) / 3) [(1, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 25. -/
theorem rs_R002_ueqv_R002YNYN_partial_25_0208_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_25_0208
        rs_R002_ueqv_R002YNYN_generator_25_0200_0217 =
      rs_R002_ueqv_R002YNYN_partial_25_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 25. -/
def rs_R002_ueqv_R002YNYN_coefficient_25_0209 : Poly :=
[
  term (1 : Rat) [(12, 1)]
]

/-- Partial product 209 for generator 25. -/
def rs_R002_ueqv_R002YNYN_partial_25_0209 : Poly :=
[
  term (-2 : Rat) [(0, 1), (12, 2)],
  term (1 : Rat) [(0, 2), (12, 1)],
  term (-2 : Rat) [(1, 1), (12, 1), (13, 1)],
  term (1 : Rat) [(1, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 25. -/
theorem rs_R002_ueqv_R002YNYN_partial_25_0209_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_25_0209
        rs_R002_ueqv_R002YNYN_generator_25_0200_0217 =
      rs_R002_ueqv_R002YNYN_partial_25_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 25. -/
def rs_R002_ueqv_R002YNYN_coefficient_25_0210 : Poly :=
[
  term (4 : Rat) [(12, 1), (13, 1), (15, 1)]
]

/-- Partial product 210 for generator 25. -/
def rs_R002_ueqv_R002YNYN_partial_25_0210 : Poly :=
[
  term (-8 : Rat) [(0, 1), (12, 2), (13, 1), (15, 1)],
  term (4 : Rat) [(0, 2), (12, 1), (13, 1), (15, 1)],
  term (-8 : Rat) [(1, 1), (12, 1), (13, 2), (15, 1)],
  term (4 : Rat) [(1, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 25. -/
theorem rs_R002_ueqv_R002YNYN_partial_25_0210_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_25_0210
        rs_R002_ueqv_R002YNYN_generator_25_0200_0217 =
      rs_R002_ueqv_R002YNYN_partial_25_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 25. -/
def rs_R002_ueqv_R002YNYN_coefficient_25_0211 : Poly :=
[
  term (-4 : Rat) [(12, 1), (15, 2)]
]

/-- Partial product 211 for generator 25. -/
def rs_R002_ueqv_R002YNYN_partial_25_0211 : Poly :=
[
  term (8 : Rat) [(0, 1), (12, 2), (15, 2)],
  term (-4 : Rat) [(0, 2), (12, 1), (15, 2)],
  term (8 : Rat) [(1, 1), (12, 1), (13, 1), (15, 2)],
  term (-4 : Rat) [(1, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 25. -/
theorem rs_R002_ueqv_R002YNYN_partial_25_0211_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_25_0211
        rs_R002_ueqv_R002YNYN_generator_25_0200_0217 =
      rs_R002_ueqv_R002YNYN_partial_25_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 25. -/
def rs_R002_ueqv_R002YNYN_coefficient_25_0212 : Poly :=
[
  term ((-7 : Rat) / 3) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 212 for generator 25. -/
def rs_R002_ueqv_R002YNYN_partial_25_0212 : Poly :=
[
  term ((14 : Rat) / 3) [(0, 1), (12, 2), (15, 2), (16, 1)],
  term ((-7 : Rat) / 3) [(0, 2), (12, 1), (15, 2), (16, 1)],
  term ((14 : Rat) / 3) [(1, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-7 : Rat) / 3) [(1, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 25. -/
theorem rs_R002_ueqv_R002YNYN_partial_25_0212_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_25_0212
        rs_R002_ueqv_R002YNYN_generator_25_0200_0217 =
      rs_R002_ueqv_R002YNYN_partial_25_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 25. -/
def rs_R002_ueqv_R002YNYN_coefficient_25_0213 : Poly :=
[
  term (-8 : Rat) [(13, 1), (15, 1)]
]

/-- Partial product 213 for generator 25. -/
def rs_R002_ueqv_R002YNYN_partial_25_0213 : Poly :=
[
  term (16 : Rat) [(0, 1), (12, 1), (13, 1), (15, 1)],
  term (-8 : Rat) [(0, 2), (13, 1), (15, 1)],
  term (16 : Rat) [(1, 1), (13, 2), (15, 1)],
  term (-8 : Rat) [(1, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 25. -/
theorem rs_R002_ueqv_R002YNYN_partial_25_0213_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_25_0213
        rs_R002_ueqv_R002YNYN_generator_25_0200_0217 =
      rs_R002_ueqv_R002YNYN_partial_25_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 25. -/
def rs_R002_ueqv_R002YNYN_coefficient_25_0214 : Poly :=
[
  term ((-7 : Rat) / 6) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 214 for generator 25. -/
def rs_R002_ueqv_R002YNYN_partial_25_0214 : Poly :=
[
  term ((7 : Rat) / 3) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-7 : Rat) / 6) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((7 : Rat) / 3) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((-7 : Rat) / 6) [(1, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 25. -/
theorem rs_R002_ueqv_R002YNYN_partial_25_0214_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_25_0214
        rs_R002_ueqv_R002YNYN_generator_25_0200_0217 =
      rs_R002_ueqv_R002YNYN_partial_25_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 25. -/
def rs_R002_ueqv_R002YNYN_coefficient_25_0215 : Poly :=
[
  term (2 : Rat) [(13, 2)]
]

/-- Partial product 215 for generator 25. -/
def rs_R002_ueqv_R002YNYN_partial_25_0215 : Poly :=
[
  term (-4 : Rat) [(0, 1), (12, 1), (13, 2)],
  term (2 : Rat) [(0, 2), (13, 2)],
  term (-4 : Rat) [(1, 1), (13, 3)],
  term (2 : Rat) [(1, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 25. -/
theorem rs_R002_ueqv_R002YNYN_partial_25_0215_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_25_0215
        rs_R002_ueqv_R002YNYN_generator_25_0200_0217 =
      rs_R002_ueqv_R002YNYN_partial_25_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 25. -/
def rs_R002_ueqv_R002YNYN_coefficient_25_0216 : Poly :=
[
  term (14 : Rat) [(15, 2)]
]

/-- Partial product 216 for generator 25. -/
def rs_R002_ueqv_R002YNYN_partial_25_0216 : Poly :=
[
  term (-28 : Rat) [(0, 1), (12, 1), (15, 2)],
  term (14 : Rat) [(0, 2), (15, 2)],
  term (-28 : Rat) [(1, 1), (13, 1), (15, 2)],
  term (14 : Rat) [(1, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 25. -/
theorem rs_R002_ueqv_R002YNYN_partial_25_0216_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_25_0216
        rs_R002_ueqv_R002YNYN_generator_25_0200_0217 =
      rs_R002_ueqv_R002YNYN_partial_25_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 25. -/
def rs_R002_ueqv_R002YNYN_coefficient_25_0217 : Poly :=
[
  term ((8 : Rat) / 3) [(15, 2), (16, 1)]
]

/-- Partial product 217 for generator 25. -/
def rs_R002_ueqv_R002YNYN_partial_25_0217 : Poly :=
[
  term ((-16 : Rat) / 3) [(0, 1), (12, 1), (15, 2), (16, 1)],
  term ((8 : Rat) / 3) [(0, 2), (15, 2), (16, 1)],
  term ((-16 : Rat) / 3) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((8 : Rat) / 3) [(1, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 25. -/
theorem rs_R002_ueqv_R002YNYN_partial_25_0217_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_25_0217
        rs_R002_ueqv_R002YNYN_generator_25_0200_0217 =
      rs_R002_ueqv_R002YNYN_partial_25_0217 := by
  native_decide

/-- Partial products in this block. -/
def rs_R002_ueqv_R002YNYN_partials_25_0200_0217 : List Poly :=
[
  rs_R002_ueqv_R002YNYN_partial_25_0200,
  rs_R002_ueqv_R002YNYN_partial_25_0201,
  rs_R002_ueqv_R002YNYN_partial_25_0202,
  rs_R002_ueqv_R002YNYN_partial_25_0203,
  rs_R002_ueqv_R002YNYN_partial_25_0204,
  rs_R002_ueqv_R002YNYN_partial_25_0205,
  rs_R002_ueqv_R002YNYN_partial_25_0206,
  rs_R002_ueqv_R002YNYN_partial_25_0207,
  rs_R002_ueqv_R002YNYN_partial_25_0208,
  rs_R002_ueqv_R002YNYN_partial_25_0209,
  rs_R002_ueqv_R002YNYN_partial_25_0210,
  rs_R002_ueqv_R002YNYN_partial_25_0211,
  rs_R002_ueqv_R002YNYN_partial_25_0212,
  rs_R002_ueqv_R002YNYN_partial_25_0213,
  rs_R002_ueqv_R002YNYN_partial_25_0214,
  rs_R002_ueqv_R002YNYN_partial_25_0215,
  rs_R002_ueqv_R002YNYN_partial_25_0216,
  rs_R002_ueqv_R002YNYN_partial_25_0217
]

/-- Sum of partial products in this block. -/
def rs_R002_ueqv_R002YNYN_block_25_0200_0217 : Poly :=
[
  term (12 : Rat) [(0, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-103 : Rat) / 2) [(0, 1), (10, 1), (12, 1)],
  term ((-16 : Rat) / 3) [(0, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (42 : Rat) [(0, 1), (10, 1), (12, 1), (15, 2)],
  term ((40 : Rat) / 3) [(0, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term (84 : Rat) [(0, 1), (10, 1), (12, 2)],
  term ((-32 : Rat) / 3) [(0, 1), (10, 1), (12, 2), (15, 2), (16, 1)],
  term (6 : Rat) [(0, 1), (10, 2), (12, 1)],
  term ((-4 : Rat) / 3) [(0, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term (16 : Rat) [(0, 1), (12, 1), (13, 1), (15, 1)],
  term ((7 : Rat) / 3) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(0, 1), (12, 1), (13, 2)],
  term (-28 : Rat) [(0, 1), (12, 1), (15, 2)],
  term ((-16 : Rat) / 3) [(0, 1), (12, 1), (15, 2), (16, 1)],
  term (-2 : Rat) [(0, 1), (12, 2)],
  term (-8 : Rat) [(0, 1), (12, 2), (13, 1), (15, 1)],
  term (8 : Rat) [(0, 1), (12, 2), (15, 2)],
  term ((14 : Rat) / 3) [(0, 1), (12, 2), (15, 2), (16, 1)],
  term ((103 : Rat) / 4) [(0, 2), (10, 1)],
  term (-6 : Rat) [(0, 2), (10, 1), (11, 1), (15, 1)],
  term (-42 : Rat) [(0, 2), (10, 1), (12, 1)],
  term ((16 : Rat) / 3) [(0, 2), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((8 : Rat) / 3) [(0, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term (-21 : Rat) [(0, 2), (10, 1), (15, 2)],
  term ((-20 : Rat) / 3) [(0, 2), (10, 1), (15, 2), (16, 1)],
  term (-3 : Rat) [(0, 2), (10, 2)],
  term ((2 : Rat) / 3) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term (1 : Rat) [(0, 2), (12, 1)],
  term (4 : Rat) [(0, 2), (12, 1), (13, 1), (15, 1)],
  term (-4 : Rat) [(0, 2), (12, 1), (15, 2)],
  term ((-7 : Rat) / 3) [(0, 2), (12, 1), (15, 2), (16, 1)],
  term (-8 : Rat) [(0, 2), (13, 1), (15, 1)],
  term ((-7 : Rat) / 6) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(0, 2), (13, 2)],
  term (14 : Rat) [(0, 2), (15, 2)],
  term ((8 : Rat) / 3) [(0, 2), (15, 2), (16, 1)],
  term (12 : Rat) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term (84 : Rat) [(1, 1), (10, 1), (12, 1), (13, 1)],
  term ((-32 : Rat) / 3) [(1, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-103 : Rat) / 2) [(1, 1), (10, 1), (13, 1)],
  term (42 : Rat) [(1, 1), (10, 1), (13, 1), (15, 2)],
  term ((40 : Rat) / 3) [(1, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-16 : Rat) / 3) [(1, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term (6 : Rat) [(1, 1), (10, 2), (13, 1)],
  term ((-4 : Rat) / 3) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(1, 1), (12, 1), (13, 1)],
  term (8 : Rat) [(1, 1), (12, 1), (13, 1), (15, 2)],
  term ((14 : Rat) / 3) [(1, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term (-8 : Rat) [(1, 1), (12, 1), (13, 2), (15, 1)],
  term (-28 : Rat) [(1, 1), (13, 1), (15, 2)],
  term ((-16 : Rat) / 3) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term (16 : Rat) [(1, 1), (13, 2), (15, 1)],
  term ((7 : Rat) / 3) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term (-4 : Rat) [(1, 1), (13, 3)],
  term ((103 : Rat) / 4) [(1, 2), (10, 1)],
  term (-6 : Rat) [(1, 2), (10, 1), (11, 1), (15, 1)],
  term (-42 : Rat) [(1, 2), (10, 1), (12, 1)],
  term ((16 : Rat) / 3) [(1, 2), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((8 : Rat) / 3) [(1, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term (-21 : Rat) [(1, 2), (10, 1), (15, 2)],
  term ((-20 : Rat) / 3) [(1, 2), (10, 1), (15, 2), (16, 1)],
  term (-3 : Rat) [(1, 2), (10, 2)],
  term ((2 : Rat) / 3) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term (1 : Rat) [(1, 2), (12, 1)],
  term (4 : Rat) [(1, 2), (12, 1), (13, 1), (15, 1)],
  term (-4 : Rat) [(1, 2), (12, 1), (15, 2)],
  term ((-7 : Rat) / 3) [(1, 2), (12, 1), (15, 2), (16, 1)],
  term (-8 : Rat) [(1, 2), (13, 1), (15, 1)],
  term ((-7 : Rat) / 6) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(1, 2), (13, 2)],
  term (14 : Rat) [(1, 2), (15, 2)],
  term ((8 : Rat) / 3) [(1, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 25, terms 200 through 217. -/
theorem rs_R002_ueqv_R002YNYN_block_25_0200_0217_valid :
    checkProductSumEq rs_R002_ueqv_R002YNYN_partials_25_0200_0217
      rs_R002_ueqv_R002YNYN_block_25_0200_0217 = true := by
  native_decide

end R002UeqvR002YNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
