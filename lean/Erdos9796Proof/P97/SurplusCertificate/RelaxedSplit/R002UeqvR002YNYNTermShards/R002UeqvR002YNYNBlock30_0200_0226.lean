/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R002:u=v:R002YNYN, term block 30:200-226

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R002UeqvR002YNYNTermShards

/-- Generator polynomial 30 for relaxed split surplus certificate `R002:u=v:R002YNYN`. -/
def rs_R002_ueqv_R002YNYN_generator_30_0200_0226 : Poly :=
[
  term (2 : Rat) [(12, 1), (14, 1)],
  term (-1 : Rat) [(12, 2)],
  term (2 : Rat) [(13, 1), (15, 1)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 200 from coefficient polynomial 30. -/
def rs_R002_ueqv_R002YNYN_coefficient_30_0200 : Poly :=
[
  term (24 : Rat) [(7, 2), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 200 for generator 30. -/
def rs_R002_ueqv_R002YNYN_partial_30_0200 : Poly :=
[
  term (48 : Rat) [(7, 2), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(7, 2), (10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term (48 : Rat) [(7, 2), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term (-24 : Rat) [(7, 2), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 30. -/
theorem rs_R002_ueqv_R002YNYN_partial_30_0200_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_30_0200
        rs_R002_ueqv_R002YNYN_generator_30_0200_0226 =
      rs_R002_ueqv_R002YNYN_partial_30_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 30. -/
def rs_R002_ueqv_R002YNYN_coefficient_30_0201 : Poly :=
[
  term (24 : Rat) [(7, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 201 for generator 30. -/
def rs_R002_ueqv_R002YNYN_partial_30_0201 : Poly :=
[
  term (48 : Rat) [(7, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(7, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term (48 : Rat) [(7, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term (-24 : Rat) [(7, 2), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 30. -/
theorem rs_R002_ueqv_R002YNYN_partial_30_0201_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_30_0201
        rs_R002_ueqv_R002YNYN_generator_30_0200_0226 =
      rs_R002_ueqv_R002YNYN_partial_30_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 30. -/
def rs_R002_ueqv_R002YNYN_coefficient_30_0202 : Poly :=
[
  term (4 : Rat) [(9, 1), (11, 1)]
]

/-- Partial product 202 for generator 30. -/
def rs_R002_ueqv_R002YNYN_partial_30_0202 : Poly :=
[
  term (8 : Rat) [(9, 1), (11, 1), (12, 1), (14, 1)],
  term (-4 : Rat) [(9, 1), (11, 1), (12, 2)],
  term (8 : Rat) [(9, 1), (11, 1), (13, 1), (15, 1)],
  term (-4 : Rat) [(9, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 30. -/
theorem rs_R002_ueqv_R002YNYN_partial_30_0202_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_30_0202
        rs_R002_ueqv_R002YNYN_generator_30_0200_0226 =
      rs_R002_ueqv_R002YNYN_partial_30_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 30. -/
def rs_R002_ueqv_R002YNYN_coefficient_30_0203 : Poly :=
[
  term ((-8 : Rat) / 3) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 203 for generator 30. -/
def rs_R002_ueqv_R002YNYN_partial_30_0203 : Poly :=
[
  term ((-16 : Rat) / 3) [(9, 1), (12, 1), (13, 1), (15, 2)],
  term ((8 : Rat) / 3) [(9, 1), (12, 1), (13, 2), (15, 1)],
  term ((-16 : Rat) / 3) [(9, 1), (12, 2), (14, 1), (15, 1)],
  term ((8 : Rat) / 3) [(9, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 30. -/
theorem rs_R002_ueqv_R002YNYN_partial_30_0203_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_30_0203
        rs_R002_ueqv_R002YNYN_generator_30_0200_0226 =
      rs_R002_ueqv_R002YNYN_partial_30_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 30. -/
def rs_R002_ueqv_R002YNYN_coefficient_30_0204 : Poly :=
[
  term ((-20 : Rat) / 3) [(9, 1), (13, 1)]
]

/-- Partial product 204 for generator 30. -/
def rs_R002_ueqv_R002YNYN_partial_30_0204 : Poly :=
[
  term ((-40 : Rat) / 3) [(9, 1), (12, 1), (13, 1), (14, 1)],
  term ((20 : Rat) / 3) [(9, 1), (12, 2), (13, 1)],
  term ((-40 : Rat) / 3) [(9, 1), (13, 2), (15, 1)],
  term ((20 : Rat) / 3) [(9, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 30. -/
theorem rs_R002_ueqv_R002YNYN_partial_30_0204_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_30_0204
        rs_R002_ueqv_R002YNYN_generator_30_0200_0226 =
      rs_R002_ueqv_R002YNYN_partial_30_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 30. -/
def rs_R002_ueqv_R002YNYN_coefficient_30_0205 : Poly :=
[
  term (-8 : Rat) [(9, 1), (15, 1)]
]

/-- Partial product 205 for generator 30. -/
def rs_R002_ueqv_R002YNYN_partial_30_0205 : Poly :=
[
  term (-16 : Rat) [(9, 1), (12, 1), (14, 1), (15, 1)],
  term (8 : Rat) [(9, 1), (12, 2), (15, 1)],
  term (-16 : Rat) [(9, 1), (13, 1), (15, 2)],
  term (8 : Rat) [(9, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 30. -/
theorem rs_R002_ueqv_R002YNYN_partial_30_0205_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_30_0205
        rs_R002_ueqv_R002YNYN_generator_30_0200_0226 =
      rs_R002_ueqv_R002YNYN_partial_30_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 30. -/
def rs_R002_ueqv_R002YNYN_coefficient_30_0206 : Poly :=
[
  term ((28 : Rat) / 3) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 206 for generator 30. -/
def rs_R002_ueqv_R002YNYN_partial_30_0206 : Poly :=
[
  term ((56 : Rat) / 3) [(9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-28 : Rat) / 3) [(9, 1), (12, 2), (15, 1), (16, 1)],
  term ((56 : Rat) / 3) [(9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-28 : Rat) / 3) [(9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 30. -/
theorem rs_R002_ueqv_R002YNYN_partial_30_0206_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_30_0206
        rs_R002_ueqv_R002YNYN_generator_30_0200_0226 =
      rs_R002_ueqv_R002YNYN_partial_30_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 30. -/
def rs_R002_ueqv_R002YNYN_coefficient_30_0207 : Poly :=
[
  term (-8 : Rat) [(9, 2)]
]

/-- Partial product 207 for generator 30. -/
def rs_R002_ueqv_R002YNYN_partial_30_0207 : Poly :=
[
  term (-16 : Rat) [(9, 2), (12, 1), (14, 1)],
  term (8 : Rat) [(9, 2), (12, 2)],
  term (-16 : Rat) [(9, 2), (13, 1), (15, 1)],
  term (8 : Rat) [(9, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 30. -/
theorem rs_R002_ueqv_R002YNYN_partial_30_0207_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_30_0207
        rs_R002_ueqv_R002YNYN_generator_30_0200_0226 =
      rs_R002_ueqv_R002YNYN_partial_30_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 30. -/
def rs_R002_ueqv_R002YNYN_coefficient_30_0208 : Poly :=
[
  term ((71 : Rat) / 4) [(10, 1)]
]

/-- Partial product 208 for generator 30. -/
def rs_R002_ueqv_R002YNYN_partial_30_0208 : Poly :=
[
  term ((71 : Rat) / 2) [(10, 1), (12, 1), (14, 1)],
  term ((-71 : Rat) / 4) [(10, 1), (12, 2)],
  term ((71 : Rat) / 2) [(10, 1), (13, 1), (15, 1)],
  term ((-71 : Rat) / 4) [(10, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 30. -/
theorem rs_R002_ueqv_R002YNYN_partial_30_0208_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_30_0208
        rs_R002_ueqv_R002YNYN_generator_30_0200_0226 =
      rs_R002_ueqv_R002YNYN_partial_30_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 30. -/
def rs_R002_ueqv_R002YNYN_coefficient_30_0209 : Poly :=
[
  term (-6 : Rat) [(10, 1), (11, 1), (15, 1)]
]

/-- Partial product 209 for generator 30. -/
def rs_R002_ueqv_R002YNYN_partial_30_0209 : Poly :=
[
  term (-12 : Rat) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term (6 : Rat) [(10, 1), (11, 1), (12, 2), (15, 1)],
  term (-12 : Rat) [(10, 1), (11, 1), (13, 1), (15, 2)],
  term (6 : Rat) [(10, 1), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 30. -/
theorem rs_R002_ueqv_R002YNYN_partial_30_0209_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_30_0209
        rs_R002_ueqv_R002YNYN_generator_30_0200_0226 =
      rs_R002_ueqv_R002YNYN_partial_30_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 30. -/
def rs_R002_ueqv_R002YNYN_coefficient_30_0210 : Poly :=
[
  term (-42 : Rat) [(10, 1), (12, 1)]
]

/-- Partial product 210 for generator 30. -/
def rs_R002_ueqv_R002YNYN_partial_30_0210 : Poly :=
[
  term (-84 : Rat) [(10, 1), (12, 1), (13, 1), (15, 1)],
  term (42 : Rat) [(10, 1), (12, 1), (13, 2)],
  term (-84 : Rat) [(10, 1), (12, 2), (14, 1)],
  term (42 : Rat) [(10, 1), (12, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 30. -/
theorem rs_R002_ueqv_R002YNYN_partial_30_0210_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_30_0210
        rs_R002_ueqv_R002YNYN_generator_30_0200_0226 =
      rs_R002_ueqv_R002YNYN_partial_30_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 30. -/
def rs_R002_ueqv_R002YNYN_coefficient_30_0211 : Poly :=
[
  term ((16 : Rat) / 3) [(10, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 211 for generator 30. -/
def rs_R002_ueqv_R002YNYN_partial_30_0211 : Poly :=
[
  term ((32 : Rat) / 3) [(10, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-16 : Rat) / 3) [(10, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((32 : Rat) / 3) [(10, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-16 : Rat) / 3) [(10, 1), (12, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 30. -/
theorem rs_R002_ueqv_R002YNYN_partial_30_0211_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_30_0211
        rs_R002_ueqv_R002YNYN_generator_30_0200_0226 =
      rs_R002_ueqv_R002YNYN_partial_30_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 30. -/
def rs_R002_ueqv_R002YNYN_coefficient_30_0212 : Poly :=
[
  term ((-8 : Rat) / 3) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 212 for generator 30. -/
def rs_R002_ueqv_R002YNYN_partial_30_0212 : Poly :=
[
  term ((-16 : Rat) / 3) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 3) [(10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 3) [(10, 1), (13, 2), (15, 2), (16, 1)],
  term ((8 : Rat) / 3) [(10, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 30. -/
theorem rs_R002_ueqv_R002YNYN_partial_30_0212_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_30_0212
        rs_R002_ueqv_R002YNYN_generator_30_0200_0226 =
      rs_R002_ueqv_R002YNYN_partial_30_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 30. -/
def rs_R002_ueqv_R002YNYN_coefficient_30_0213 : Poly :=
[
  term (-21 : Rat) [(10, 1), (15, 2)]
]

/-- Partial product 213 for generator 30. -/
def rs_R002_ueqv_R002YNYN_partial_30_0213 : Poly :=
[
  term (-42 : Rat) [(10, 1), (12, 1), (14, 1), (15, 2)],
  term (21 : Rat) [(10, 1), (12, 2), (15, 2)],
  term (-42 : Rat) [(10, 1), (13, 1), (15, 3)],
  term (21 : Rat) [(10, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 30. -/
theorem rs_R002_ueqv_R002YNYN_partial_30_0213_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_30_0213
        rs_R002_ueqv_R002YNYN_generator_30_0200_0226 =
      rs_R002_ueqv_R002YNYN_partial_30_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 30. -/
def rs_R002_ueqv_R002YNYN_coefficient_30_0214 : Poly :=
[
  term ((-28 : Rat) / 3) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 214 for generator 30. -/
def rs_R002_ueqv_R002YNYN_partial_30_0214 : Poly :=
[
  term ((-56 : Rat) / 3) [(10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((28 : Rat) / 3) [(10, 1), (12, 2), (15, 2), (16, 1)],
  term ((-56 : Rat) / 3) [(10, 1), (13, 1), (15, 3), (16, 1)],
  term ((28 : Rat) / 3) [(10, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 30. -/
theorem rs_R002_ueqv_R002YNYN_partial_30_0214_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_30_0214
        rs_R002_ueqv_R002YNYN_generator_30_0200_0226 =
      rs_R002_ueqv_R002YNYN_partial_30_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 30. -/
def rs_R002_ueqv_R002YNYN_coefficient_30_0215 : Poly :=
[
  term (-21 : Rat) [(10, 2)]
]

/-- Partial product 215 for generator 30. -/
def rs_R002_ueqv_R002YNYN_partial_30_0215 : Poly :=
[
  term (-42 : Rat) [(10, 2), (12, 1), (14, 1)],
  term (21 : Rat) [(10, 2), (12, 2)],
  term (-42 : Rat) [(10, 2), (13, 1), (15, 1)],
  term (21 : Rat) [(10, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 30. -/
theorem rs_R002_ueqv_R002YNYN_partial_30_0215_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_30_0215
        rs_R002_ueqv_R002YNYN_generator_30_0200_0226 =
      rs_R002_ueqv_R002YNYN_partial_30_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 30. -/
def rs_R002_ueqv_R002YNYN_coefficient_30_0216 : Poly :=
[
  term ((10 : Rat) / 3) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 216 for generator 30. -/
def rs_R002_ueqv_R002YNYN_partial_30_0216 : Poly :=
[
  term ((20 : Rat) / 3) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10 : Rat) / 3) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((20 : Rat) / 3) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-10 : Rat) / 3) [(11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 30. -/
theorem rs_R002_ueqv_R002YNYN_partial_30_0216_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_30_0216
        rs_R002_ueqv_R002YNYN_generator_30_0200_0226 =
      rs_R002_ueqv_R002YNYN_partial_30_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 30. -/
def rs_R002_ueqv_R002YNYN_coefficient_30_0217 : Poly :=
[
  term (-18 : Rat) [(11, 2)]
]

/-- Partial product 217 for generator 30. -/
def rs_R002_ueqv_R002YNYN_partial_30_0217 : Poly :=
[
  term (-36 : Rat) [(11, 2), (12, 1), (14, 1)],
  term (18 : Rat) [(11, 2), (12, 2)],
  term (-36 : Rat) [(11, 2), (13, 1), (15, 1)],
  term (18 : Rat) [(11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 30. -/
theorem rs_R002_ueqv_R002YNYN_partial_30_0217_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_30_0217
        rs_R002_ueqv_R002YNYN_generator_30_0200_0226 =
      rs_R002_ueqv_R002YNYN_partial_30_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 30. -/
def rs_R002_ueqv_R002YNYN_coefficient_30_0218 : Poly :=
[
  term (-15 : Rat) [(12, 1)]
]

/-- Partial product 218 for generator 30. -/
def rs_R002_ueqv_R002YNYN_partial_30_0218 : Poly :=
[
  term (-30 : Rat) [(12, 1), (13, 1), (15, 1)],
  term (15 : Rat) [(12, 1), (13, 2)],
  term (-30 : Rat) [(12, 2), (14, 1)],
  term (15 : Rat) [(12, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 30. -/
theorem rs_R002_ueqv_R002YNYN_partial_30_0218_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_30_0218
        rs_R002_ueqv_R002YNYN_generator_30_0200_0226 =
      rs_R002_ueqv_R002YNYN_partial_30_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 30. -/
def rs_R002_ueqv_R002YNYN_coefficient_30_0219 : Poly :=
[
  term (4 : Rat) [(12, 1), (13, 1), (15, 1)]
]

/-- Partial product 219 for generator 30. -/
def rs_R002_ueqv_R002YNYN_partial_30_0219 : Poly :=
[
  term (8 : Rat) [(12, 1), (13, 2), (15, 2)],
  term (-4 : Rat) [(12, 1), (13, 3), (15, 1)],
  term (8 : Rat) [(12, 2), (13, 1), (14, 1), (15, 1)],
  term (-4 : Rat) [(12, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 30. -/
theorem rs_R002_ueqv_R002YNYN_partial_30_0219_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_30_0219
        rs_R002_ueqv_R002YNYN_generator_30_0200_0226 =
      rs_R002_ueqv_R002YNYN_partial_30_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 30. -/
def rs_R002_ueqv_R002YNYN_coefficient_30_0220 : Poly :=
[
  term (-4 : Rat) [(12, 1), (15, 2)]
]

/-- Partial product 220 for generator 30. -/
def rs_R002_ueqv_R002YNYN_partial_30_0220 : Poly :=
[
  term (-8 : Rat) [(12, 1), (13, 1), (15, 3)],
  term (4 : Rat) [(12, 1), (13, 2), (15, 2)],
  term (-8 : Rat) [(12, 2), (14, 1), (15, 2)],
  term (4 : Rat) [(12, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 30. -/
theorem rs_R002_ueqv_R002YNYN_partial_30_0220_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_30_0220
        rs_R002_ueqv_R002YNYN_generator_30_0200_0226 =
      rs_R002_ueqv_R002YNYN_partial_30_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 30. -/
def rs_R002_ueqv_R002YNYN_coefficient_30_0221 : Poly :=
[
  term ((-7 : Rat) / 3) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 221 for generator 30. -/
def rs_R002_ueqv_R002YNYN_partial_30_0221 : Poly :=
[
  term ((-14 : Rat) / 3) [(12, 1), (13, 1), (15, 3), (16, 1)],
  term ((7 : Rat) / 3) [(12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-14 : Rat) / 3) [(12, 2), (14, 1), (15, 2), (16, 1)],
  term ((7 : Rat) / 3) [(12, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 30. -/
theorem rs_R002_ueqv_R002YNYN_partial_30_0221_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_30_0221
        rs_R002_ueqv_R002YNYN_generator_30_0200_0226 =
      rs_R002_ueqv_R002YNYN_partial_30_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 30. -/
def rs_R002_ueqv_R002YNYN_coefficient_30_0222 : Poly :=
[
  term (-24 : Rat) [(13, 1), (15, 1)]
]

/-- Partial product 222 for generator 30. -/
def rs_R002_ueqv_R002YNYN_partial_30_0222 : Poly :=
[
  term (-48 : Rat) [(12, 1), (13, 1), (14, 1), (15, 1)],
  term (24 : Rat) [(12, 2), (13, 1), (15, 1)],
  term (-48 : Rat) [(13, 2), (15, 2)],
  term (24 : Rat) [(13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 30. -/
theorem rs_R002_ueqv_R002YNYN_partial_30_0222_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_30_0222
        rs_R002_ueqv_R002YNYN_generator_30_0200_0226 =
      rs_R002_ueqv_R002YNYN_partial_30_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 30. -/
def rs_R002_ueqv_R002YNYN_coefficient_30_0223 : Poly :=
[
  term ((7 : Rat) / 6) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 223 for generator 30. -/
def rs_R002_ueqv_R002YNYN_partial_30_0223 : Poly :=
[
  term ((7 : Rat) / 3) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7 : Rat) / 6) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((7 : Rat) / 3) [(13, 2), (15, 2), (16, 1)],
  term ((-7 : Rat) / 6) [(13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 30. -/
theorem rs_R002_ueqv_R002YNYN_partial_30_0223_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_30_0223
        rs_R002_ueqv_R002YNYN_generator_30_0200_0226 =
      rs_R002_ueqv_R002YNYN_partial_30_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 30. -/
def rs_R002_ueqv_R002YNYN_coefficient_30_0224 : Poly :=
[
  term (-6 : Rat) [(13, 2)]
]

/-- Partial product 224 for generator 30. -/
def rs_R002_ueqv_R002YNYN_partial_30_0224 : Poly :=
[
  term (-12 : Rat) [(12, 1), (13, 2), (14, 1)],
  term (6 : Rat) [(12, 2), (13, 2)],
  term (-12 : Rat) [(13, 3), (15, 1)],
  term (6 : Rat) [(13, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 30. -/
theorem rs_R002_ueqv_R002YNYN_partial_30_0224_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_30_0224
        rs_R002_ueqv_R002YNYN_generator_30_0200_0226 =
      rs_R002_ueqv_R002YNYN_partial_30_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 30. -/
def rs_R002_ueqv_R002YNYN_coefficient_30_0225 : Poly :=
[
  term (-22 : Rat) [(15, 2)]
]

/-- Partial product 225 for generator 30. -/
def rs_R002_ueqv_R002YNYN_partial_30_0225 : Poly :=
[
  term (-44 : Rat) [(12, 1), (14, 1), (15, 2)],
  term (22 : Rat) [(12, 2), (15, 2)],
  term (-44 : Rat) [(13, 1), (15, 3)],
  term (22 : Rat) [(13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 30. -/
theorem rs_R002_ueqv_R002YNYN_partial_30_0225_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_30_0225
        rs_R002_ueqv_R002YNYN_generator_30_0200_0226 =
      rs_R002_ueqv_R002YNYN_partial_30_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 30. -/
def rs_R002_ueqv_R002YNYN_coefficient_30_0226 : Poly :=
[
  term (3 : Rat) [(15, 2), (16, 1)]
]

/-- Partial product 226 for generator 30. -/
def rs_R002_ueqv_R002YNYN_partial_30_0226 : Poly :=
[
  term (6 : Rat) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term (-3 : Rat) [(12, 2), (15, 2), (16, 1)],
  term (6 : Rat) [(13, 1), (15, 3), (16, 1)],
  term (-3 : Rat) [(13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 30. -/
theorem rs_R002_ueqv_R002YNYN_partial_30_0226_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_30_0226
        rs_R002_ueqv_R002YNYN_generator_30_0200_0226 =
      rs_R002_ueqv_R002YNYN_partial_30_0226 := by
  native_decide

/-- Partial products in this block. -/
def rs_R002_ueqv_R002YNYN_partials_30_0200_0226 : List Poly :=
[
  rs_R002_ueqv_R002YNYN_partial_30_0200,
  rs_R002_ueqv_R002YNYN_partial_30_0201,
  rs_R002_ueqv_R002YNYN_partial_30_0202,
  rs_R002_ueqv_R002YNYN_partial_30_0203,
  rs_R002_ueqv_R002YNYN_partial_30_0204,
  rs_R002_ueqv_R002YNYN_partial_30_0205,
  rs_R002_ueqv_R002YNYN_partial_30_0206,
  rs_R002_ueqv_R002YNYN_partial_30_0207,
  rs_R002_ueqv_R002YNYN_partial_30_0208,
  rs_R002_ueqv_R002YNYN_partial_30_0209,
  rs_R002_ueqv_R002YNYN_partial_30_0210,
  rs_R002_ueqv_R002YNYN_partial_30_0211,
  rs_R002_ueqv_R002YNYN_partial_30_0212,
  rs_R002_ueqv_R002YNYN_partial_30_0213,
  rs_R002_ueqv_R002YNYN_partial_30_0214,
  rs_R002_ueqv_R002YNYN_partial_30_0215,
  rs_R002_ueqv_R002YNYN_partial_30_0216,
  rs_R002_ueqv_R002YNYN_partial_30_0217,
  rs_R002_ueqv_R002YNYN_partial_30_0218,
  rs_R002_ueqv_R002YNYN_partial_30_0219,
  rs_R002_ueqv_R002YNYN_partial_30_0220,
  rs_R002_ueqv_R002YNYN_partial_30_0221,
  rs_R002_ueqv_R002YNYN_partial_30_0222,
  rs_R002_ueqv_R002YNYN_partial_30_0223,
  rs_R002_ueqv_R002YNYN_partial_30_0224,
  rs_R002_ueqv_R002YNYN_partial_30_0225,
  rs_R002_ueqv_R002YNYN_partial_30_0226
]

/-- Sum of partial products in this block. -/
def rs_R002_ueqv_R002YNYN_block_30_0200_0226 : Poly :=
[
  term (48 : Rat) [(7, 2), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(7, 2), (10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term (48 : Rat) [(7, 2), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term (-24 : Rat) [(7, 2), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term (48 : Rat) [(7, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(7, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term (48 : Rat) [(7, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term (-24 : Rat) [(7, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term (8 : Rat) [(9, 1), (11, 1), (12, 1), (14, 1)],
  term (-4 : Rat) [(9, 1), (11, 1), (12, 2)],
  term (8 : Rat) [(9, 1), (11, 1), (13, 1), (15, 1)],
  term (-4 : Rat) [(9, 1), (11, 1), (13, 2)],
  term ((-40 : Rat) / 3) [(9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-16 : Rat) / 3) [(9, 1), (12, 1), (13, 1), (15, 2)],
  term ((8 : Rat) / 3) [(9, 1), (12, 1), (13, 2), (15, 1)],
  term (-16 : Rat) [(9, 1), (12, 1), (14, 1), (15, 1)],
  term ((56 : Rat) / 3) [(9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((20 : Rat) / 3) [(9, 1), (12, 2), (13, 1)],
  term ((-16 : Rat) / 3) [(9, 1), (12, 2), (14, 1), (15, 1)],
  term (8 : Rat) [(9, 1), (12, 2), (15, 1)],
  term ((-28 : Rat) / 3) [(9, 1), (12, 2), (15, 1), (16, 1)],
  term ((8 : Rat) / 3) [(9, 1), (12, 3), (15, 1)],
  term (-16 : Rat) [(9, 1), (13, 1), (15, 2)],
  term ((56 : Rat) / 3) [(9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-16 : Rat) / 3) [(9, 1), (13, 2), (15, 1)],
  term ((-28 : Rat) / 3) [(9, 1), (13, 2), (15, 1), (16, 1)],
  term ((20 : Rat) / 3) [(9, 1), (13, 3)],
  term (-16 : Rat) [(9, 2), (12, 1), (14, 1)],
  term (8 : Rat) [(9, 2), (12, 2)],
  term (-16 : Rat) [(9, 2), (13, 1), (15, 1)],
  term (8 : Rat) [(9, 2), (13, 2)],
  term (-12 : Rat) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term (6 : Rat) [(10, 1), (11, 1), (12, 2), (15, 1)],
  term (-12 : Rat) [(10, 1), (11, 1), (13, 1), (15, 2)],
  term (6 : Rat) [(10, 1), (11, 1), (13, 2), (15, 1)],
  term ((-16 : Rat) / 3) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term (-84 : Rat) [(10, 1), (12, 1), (13, 1), (15, 1)],
  term ((32 : Rat) / 3) [(10, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term (42 : Rat) [(10, 1), (12, 1), (13, 2)],
  term ((-16 : Rat) / 3) [(10, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((71 : Rat) / 2) [(10, 1), (12, 1), (14, 1)],
  term (-42 : Rat) [(10, 1), (12, 1), (14, 1), (15, 2)],
  term ((-56 : Rat) / 3) [(10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-71 : Rat) / 4) [(10, 1), (12, 2)],
  term ((8 : Rat) / 3) [(10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term (-84 : Rat) [(10, 1), (12, 2), (14, 1)],
  term ((32 : Rat) / 3) [(10, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term (21 : Rat) [(10, 1), (12, 2), (15, 2)],
  term ((28 : Rat) / 3) [(10, 1), (12, 2), (15, 2), (16, 1)],
  term (42 : Rat) [(10, 1), (12, 3)],
  term ((-16 : Rat) / 3) [(10, 1), (12, 3), (15, 2), (16, 1)],
  term ((71 : Rat) / 2) [(10, 1), (13, 1), (15, 1)],
  term (-42 : Rat) [(10, 1), (13, 1), (15, 3)],
  term ((-56 : Rat) / 3) [(10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-71 : Rat) / 4) [(10, 1), (13, 2)],
  term (21 : Rat) [(10, 1), (13, 2), (15, 2)],
  term (4 : Rat) [(10, 1), (13, 2), (15, 2), (16, 1)],
  term ((8 : Rat) / 3) [(10, 1), (13, 3), (15, 1), (16, 1)],
  term (-42 : Rat) [(10, 2), (12, 1), (14, 1)],
  term (21 : Rat) [(10, 2), (12, 2)],
  term (-42 : Rat) [(10, 2), (13, 1), (15, 1)],
  term (21 : Rat) [(10, 2), (13, 2)],
  term ((20 : Rat) / 3) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10 : Rat) / 3) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((20 : Rat) / 3) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-10 : Rat) / 3) [(11, 1), (13, 2), (15, 1), (16, 1)],
  term (-36 : Rat) [(11, 2), (12, 1), (14, 1)],
  term (18 : Rat) [(11, 2), (12, 2)],
  term (-36 : Rat) [(11, 2), (13, 1), (15, 1)],
  term (18 : Rat) [(11, 2), (13, 2)],
  term (-48 : Rat) [(12, 1), (13, 1), (14, 1), (15, 1)],
  term ((7 : Rat) / 3) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term (-30 : Rat) [(12, 1), (13, 1), (15, 1)],
  term (-8 : Rat) [(12, 1), (13, 1), (15, 3)],
  term ((-14 : Rat) / 3) [(12, 1), (13, 1), (15, 3), (16, 1)],
  term (15 : Rat) [(12, 1), (13, 2)],
  term (-12 : Rat) [(12, 1), (13, 2), (14, 1)],
  term (12 : Rat) [(12, 1), (13, 2), (15, 2)],
  term ((7 : Rat) / 3) [(12, 1), (13, 2), (15, 2), (16, 1)],
  term (-4 : Rat) [(12, 1), (13, 3), (15, 1)],
  term (-44 : Rat) [(12, 1), (14, 1), (15, 2)],
  term (6 : Rat) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term (8 : Rat) [(12, 2), (13, 1), (14, 1), (15, 1)],
  term (24 : Rat) [(12, 2), (13, 1), (15, 1)],
  term ((-7 : Rat) / 6) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(12, 2), (13, 2)],
  term (-30 : Rat) [(12, 2), (14, 1)],
  term (-8 : Rat) [(12, 2), (14, 1), (15, 2)],
  term ((-14 : Rat) / 3) [(12, 2), (14, 1), (15, 2), (16, 1)],
  term (22 : Rat) [(12, 2), (15, 2)],
  term (-3 : Rat) [(12, 2), (15, 2), (16, 1)],
  term (15 : Rat) [(12, 3)],
  term (-4 : Rat) [(12, 3), (13, 1), (15, 1)],
  term (4 : Rat) [(12, 3), (15, 2)],
  term ((7 : Rat) / 3) [(12, 3), (15, 2), (16, 1)],
  term (-44 : Rat) [(13, 1), (15, 3)],
  term (6 : Rat) [(13, 1), (15, 3), (16, 1)],
  term (-26 : Rat) [(13, 2), (15, 2)],
  term ((-2 : Rat) / 3) [(13, 2), (15, 2), (16, 1)],
  term (12 : Rat) [(13, 3), (15, 1)],
  term ((-7 : Rat) / 6) [(13, 3), (15, 1), (16, 1)],
  term (6 : Rat) [(13, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 30, terms 200 through 226. -/
theorem rs_R002_ueqv_R002YNYN_block_30_0200_0226_valid :
    checkProductSumEq rs_R002_ueqv_R002YNYN_partials_30_0200_0226
      rs_R002_ueqv_R002YNYN_block_30_0200_0226 = true := by
  native_decide

end R002UeqvR002YNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
