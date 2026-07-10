/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R002:u=v:R002YNYN, term block 5:200-237

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R002UeqvR002YNYNTermShards

/-- Generator polynomial 5 for relaxed split surplus certificate `R002:u=v:R002YNYN`. -/
def rs_R002_ueqv_R002YNYN_generator_05_0200_0237 : Poly :=
[
  term (-2 : Rat) [(2, 1)],
  term (1 : Rat) [(2, 2)],
  term (1 : Rat) [(3, 2)],
  term (2 : Rat) [(14, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 200 from coefficient polynomial 5. -/
def rs_R002_ueqv_R002YNYN_coefficient_05_0200 : Poly :=
[
  term (4 : Rat) [(7, 1), (13, 1)]
]

/-- Partial product 200 for generator 5. -/
def rs_R002_ueqv_R002YNYN_partial_05_0200 : Poly :=
[
  term (-8 : Rat) [(2, 1), (7, 1), (13, 1)],
  term (4 : Rat) [(2, 2), (7, 1), (13, 1)],
  term (4 : Rat) [(3, 2), (7, 1), (13, 1)],
  term (8 : Rat) [(7, 1), (13, 1), (14, 1)],
  term (-4 : Rat) [(7, 1), (13, 1), (14, 2)],
  term (-4 : Rat) [(7, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 5. -/
theorem rs_R002_ueqv_R002YNYN_partial_05_0200_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_05_0200
        rs_R002_ueqv_R002YNYN_generator_05_0200_0237 =
      rs_R002_ueqv_R002YNYN_partial_05_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 5. -/
def rs_R002_ueqv_R002YNYN_coefficient_05_0201 : Poly :=
[
  term (4 : Rat) [(7, 1), (13, 1), (15, 2)]
]

/-- Partial product 201 for generator 5. -/
def rs_R002_ueqv_R002YNYN_partial_05_0201 : Poly :=
[
  term (-8 : Rat) [(2, 1), (7, 1), (13, 1), (15, 2)],
  term (4 : Rat) [(2, 2), (7, 1), (13, 1), (15, 2)],
  term (4 : Rat) [(3, 2), (7, 1), (13, 1), (15, 2)],
  term (8 : Rat) [(7, 1), (13, 1), (14, 1), (15, 2)],
  term (-4 : Rat) [(7, 1), (13, 1), (14, 2), (15, 2)],
  term (-4 : Rat) [(7, 1), (13, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 5. -/
theorem rs_R002_ueqv_R002YNYN_partial_05_0201_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_05_0201
        rs_R002_ueqv_R002YNYN_generator_05_0200_0237 =
      rs_R002_ueqv_R002YNYN_partial_05_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 5. -/
def rs_R002_ueqv_R002YNYN_coefficient_05_0202 : Poly :=
[
  term (-2 : Rat) [(7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 202 for generator 5. -/
def rs_R002_ueqv_R002YNYN_partial_05_0202 : Poly :=
[
  term (4 : Rat) [(2, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term (-2 : Rat) [(2, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term (-2 : Rat) [(3, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term (-4 : Rat) [(7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term (2 : Rat) [(7, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term (2 : Rat) [(7, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 5. -/
theorem rs_R002_ueqv_R002YNYN_partial_05_0202_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_05_0202
        rs_R002_ueqv_R002YNYN_generator_05_0200_0237 =
      rs_R002_ueqv_R002YNYN_partial_05_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 5. -/
def rs_R002_ueqv_R002YNYN_coefficient_05_0203 : Poly :=
[
  term (8 : Rat) [(7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 203 for generator 5. -/
def rs_R002_ueqv_R002YNYN_partial_05_0203 : Poly :=
[
  term (-16 : Rat) [(2, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term (8 : Rat) [(2, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term (8 : Rat) [(3, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term (16 : Rat) [(7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(7, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term (-8 : Rat) [(7, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 5. -/
theorem rs_R002_ueqv_R002YNYN_partial_05_0203_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_05_0203
        rs_R002_ueqv_R002YNYN_generator_05_0200_0237 =
      rs_R002_ueqv_R002YNYN_partial_05_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 5. -/
def rs_R002_ueqv_R002YNYN_coefficient_05_0204 : Poly :=
[
  term (-17 : Rat) [(7, 1), (15, 1)]
]

/-- Partial product 204 for generator 5. -/
def rs_R002_ueqv_R002YNYN_partial_05_0204 : Poly :=
[
  term (34 : Rat) [(2, 1), (7, 1), (15, 1)],
  term (-17 : Rat) [(2, 2), (7, 1), (15, 1)],
  term (-17 : Rat) [(3, 2), (7, 1), (15, 1)],
  term (-34 : Rat) [(7, 1), (14, 1), (15, 1)],
  term (17 : Rat) [(7, 1), (14, 2), (15, 1)],
  term (17 : Rat) [(7, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 5. -/
theorem rs_R002_ueqv_R002YNYN_partial_05_0204_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_05_0204
        rs_R002_ueqv_R002YNYN_generator_05_0200_0237 =
      rs_R002_ueqv_R002YNYN_partial_05_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 5. -/
def rs_R002_ueqv_R002YNYN_coefficient_05_0205 : Poly :=
[
  term ((23 : Rat) / 2) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 205 for generator 5. -/
def rs_R002_ueqv_R002YNYN_partial_05_0205 : Poly :=
[
  term (-23 : Rat) [(2, 1), (7, 1), (15, 1), (16, 1)],
  term ((23 : Rat) / 2) [(2, 2), (7, 1), (15, 1), (16, 1)],
  term ((23 : Rat) / 2) [(3, 2), (7, 1), (15, 1), (16, 1)],
  term (23 : Rat) [(7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-23 : Rat) / 2) [(7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-23 : Rat) / 2) [(7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 5. -/
theorem rs_R002_ueqv_R002YNYN_partial_05_0205_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_05_0205
        rs_R002_ueqv_R002YNYN_generator_05_0200_0237 =
      rs_R002_ueqv_R002YNYN_partial_05_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 5. -/
def rs_R002_ueqv_R002YNYN_coefficient_05_0206 : Poly :=
[
  term (-100 : Rat) [(7, 1), (15, 3)]
]

/-- Partial product 206 for generator 5. -/
def rs_R002_ueqv_R002YNYN_partial_05_0206 : Poly :=
[
  term (200 : Rat) [(2, 1), (7, 1), (15, 3)],
  term (-100 : Rat) [(2, 2), (7, 1), (15, 3)],
  term (-100 : Rat) [(3, 2), (7, 1), (15, 3)],
  term (-200 : Rat) [(7, 1), (14, 1), (15, 3)],
  term (100 : Rat) [(7, 1), (14, 2), (15, 3)],
  term (100 : Rat) [(7, 1), (15, 5)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 5. -/
theorem rs_R002_ueqv_R002YNYN_partial_05_0206_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_05_0206
        rs_R002_ueqv_R002YNYN_generator_05_0200_0237 =
      rs_R002_ueqv_R002YNYN_partial_05_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 5. -/
def rs_R002_ueqv_R002YNYN_coefficient_05_0207 : Poly :=
[
  term (-10 : Rat) [(7, 1), (15, 3), (16, 1)]
]

/-- Partial product 207 for generator 5. -/
def rs_R002_ueqv_R002YNYN_partial_05_0207 : Poly :=
[
  term (20 : Rat) [(2, 1), (7, 1), (15, 3), (16, 1)],
  term (-10 : Rat) [(2, 2), (7, 1), (15, 3), (16, 1)],
  term (-10 : Rat) [(3, 2), (7, 1), (15, 3), (16, 1)],
  term (-20 : Rat) [(7, 1), (14, 1), (15, 3), (16, 1)],
  term (10 : Rat) [(7, 1), (14, 2), (15, 3), (16, 1)],
  term (10 : Rat) [(7, 1), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 5. -/
theorem rs_R002_ueqv_R002YNYN_partial_05_0207_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_05_0207
        rs_R002_ueqv_R002YNYN_generator_05_0200_0237 =
      rs_R002_ueqv_R002YNYN_partial_05_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 5. -/
def rs_R002_ueqv_R002YNYN_coefficient_05_0208 : Poly :=
[
  term (-24 : Rat) [(7, 2), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 208 for generator 5. -/
def rs_R002_ueqv_R002YNYN_partial_05_0208 : Poly :=
[
  term (48 : Rat) [(2, 1), (7, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(2, 2), (7, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(3, 2), (7, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term (-48 : Rat) [(7, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(7, 2), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term (24 : Rat) [(7, 2), (9, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 5. -/
theorem rs_R002_ueqv_R002YNYN_partial_05_0208_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_05_0208
        rs_R002_ueqv_R002YNYN_generator_05_0200_0237 =
      rs_R002_ueqv_R002YNYN_partial_05_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 5. -/
def rs_R002_ueqv_R002YNYN_coefficient_05_0209 : Poly :=
[
  term (36 : Rat) [(7, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 209 for generator 5. -/
def rs_R002_ueqv_R002YNYN_partial_05_0209 : Poly :=
[
  term (-72 : Rat) [(2, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term (36 : Rat) [(2, 2), (7, 2), (9, 1), (15, 1), (16, 1)],
  term (36 : Rat) [(3, 2), (7, 2), (9, 1), (15, 1), (16, 1)],
  term (72 : Rat) [(7, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term (-36 : Rat) [(7, 2), (9, 1), (14, 2), (15, 1), (16, 1)],
  term (-36 : Rat) [(7, 2), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 5. -/
theorem rs_R002_ueqv_R002YNYN_partial_05_0209_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_05_0209
        rs_R002_ueqv_R002YNYN_generator_05_0200_0237 =
      rs_R002_ueqv_R002YNYN_partial_05_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 5. -/
def rs_R002_ueqv_R002YNYN_coefficient_05_0210 : Poly :=
[
  term (24 : Rat) [(7, 2), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 210 for generator 5. -/
def rs_R002_ueqv_R002YNYN_partial_05_0210 : Poly :=
[
  term (-48 : Rat) [(2, 1), (7, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(2, 2), (7, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(3, 2), (7, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term (48 : Rat) [(7, 2), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(7, 2), (10, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term (-24 : Rat) [(7, 2), (10, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 5. -/
theorem rs_R002_ueqv_R002YNYN_partial_05_0210_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_05_0210
        rs_R002_ueqv_R002YNYN_generator_05_0200_0237 =
      rs_R002_ueqv_R002YNYN_partial_05_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 5. -/
def rs_R002_ueqv_R002YNYN_coefficient_05_0211 : Poly :=
[
  term (48 : Rat) [(7, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 211 for generator 5. -/
def rs_R002_ueqv_R002YNYN_partial_05_0211 : Poly :=
[
  term (-96 : Rat) [(2, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term (48 : Rat) [(2, 2), (7, 2), (11, 1), (15, 1), (16, 1)],
  term (48 : Rat) [(3, 2), (7, 2), (11, 1), (15, 1), (16, 1)],
  term (96 : Rat) [(7, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term (-48 : Rat) [(7, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term (-48 : Rat) [(7, 2), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 5. -/
theorem rs_R002_ueqv_R002YNYN_partial_05_0211_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_05_0211
        rs_R002_ueqv_R002YNYN_generator_05_0200_0237 =
      rs_R002_ueqv_R002YNYN_partial_05_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 5. -/
def rs_R002_ueqv_R002YNYN_coefficient_05_0212 : Poly :=
[
  term (4 : Rat) [(9, 1), (11, 1)]
]

/-- Partial product 212 for generator 5. -/
def rs_R002_ueqv_R002YNYN_partial_05_0212 : Poly :=
[
  term (-8 : Rat) [(2, 1), (9, 1), (11, 1)],
  term (4 : Rat) [(2, 2), (9, 1), (11, 1)],
  term (4 : Rat) [(3, 2), (9, 1), (11, 1)],
  term (8 : Rat) [(9, 1), (11, 1), (14, 1)],
  term (-4 : Rat) [(9, 1), (11, 1), (14, 2)],
  term (-4 : Rat) [(9, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 5. -/
theorem rs_R002_ueqv_R002YNYN_partial_05_0212_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_05_0212
        rs_R002_ueqv_R002YNYN_generator_05_0200_0237 =
      rs_R002_ueqv_R002YNYN_partial_05_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 5. -/
def rs_R002_ueqv_R002YNYN_coefficient_05_0213 : Poly :=
[
  term ((-8 : Rat) / 3) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 213 for generator 5. -/
def rs_R002_ueqv_R002YNYN_partial_05_0213 : Poly :=
[
  term ((16 : Rat) / 3) [(2, 1), (9, 1), (12, 1), (15, 1)],
  term ((-8 : Rat) / 3) [(2, 2), (9, 1), (12, 1), (15, 1)],
  term ((-8 : Rat) / 3) [(3, 2), (9, 1), (12, 1), (15, 1)],
  term ((-16 : Rat) / 3) [(9, 1), (12, 1), (14, 1), (15, 1)],
  term ((8 : Rat) / 3) [(9, 1), (12, 1), (14, 2), (15, 1)],
  term ((8 : Rat) / 3) [(9, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 5. -/
theorem rs_R002_ueqv_R002YNYN_partial_05_0213_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_05_0213
        rs_R002_ueqv_R002YNYN_generator_05_0200_0237 =
      rs_R002_ueqv_R002YNYN_partial_05_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 5. -/
def rs_R002_ueqv_R002YNYN_coefficient_05_0214 : Poly :=
[
  term ((-172 : Rat) / 3) [(9, 1), (13, 1)]
]

/-- Partial product 214 for generator 5. -/
def rs_R002_ueqv_R002YNYN_partial_05_0214 : Poly :=
[
  term ((344 : Rat) / 3) [(2, 1), (9, 1), (13, 1)],
  term ((-172 : Rat) / 3) [(2, 2), (9, 1), (13, 1)],
  term ((-172 : Rat) / 3) [(3, 2), (9, 1), (13, 1)],
  term ((-344 : Rat) / 3) [(9, 1), (13, 1), (14, 1)],
  term ((172 : Rat) / 3) [(9, 1), (13, 1), (14, 2)],
  term ((172 : Rat) / 3) [(9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 5. -/
theorem rs_R002_ueqv_R002YNYN_partial_05_0214_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_05_0214
        rs_R002_ueqv_R002YNYN_generator_05_0200_0237 =
      rs_R002_ueqv_R002YNYN_partial_05_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 5. -/
def rs_R002_ueqv_R002YNYN_coefficient_05_0215 : Poly :=
[
  term (16 : Rat) [(9, 1), (15, 1)]
]

/-- Partial product 215 for generator 5. -/
def rs_R002_ueqv_R002YNYN_partial_05_0215 : Poly :=
[
  term (-32 : Rat) [(2, 1), (9, 1), (15, 1)],
  term (16 : Rat) [(2, 2), (9, 1), (15, 1)],
  term (16 : Rat) [(3, 2), (9, 1), (15, 1)],
  term (32 : Rat) [(9, 1), (14, 1), (15, 1)],
  term (-16 : Rat) [(9, 1), (14, 2), (15, 1)],
  term (-16 : Rat) [(9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 5. -/
theorem rs_R002_ueqv_R002YNYN_partial_05_0215_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_05_0215
        rs_R002_ueqv_R002YNYN_generator_05_0200_0237 =
      rs_R002_ueqv_R002YNYN_partial_05_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 5. -/
def rs_R002_ueqv_R002YNYN_coefficient_05_0216 : Poly :=
[
  term ((28 : Rat) / 3) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 216 for generator 5. -/
def rs_R002_ueqv_R002YNYN_partial_05_0216 : Poly :=
[
  term ((-56 : Rat) / 3) [(2, 1), (9, 1), (15, 1), (16, 1)],
  term ((28 : Rat) / 3) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((28 : Rat) / 3) [(3, 2), (9, 1), (15, 1), (16, 1)],
  term ((56 : Rat) / 3) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-28 : Rat) / 3) [(9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-28 : Rat) / 3) [(9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 5. -/
theorem rs_R002_ueqv_R002YNYN_partial_05_0216_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_05_0216
        rs_R002_ueqv_R002YNYN_generator_05_0200_0237 =
      rs_R002_ueqv_R002YNYN_partial_05_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 5. -/
def rs_R002_ueqv_R002YNYN_coefficient_05_0217 : Poly :=
[
  term ((-37 : Rat) / 4) [(10, 1)]
]

/-- Partial product 217 for generator 5. -/
def rs_R002_ueqv_R002YNYN_partial_05_0217 : Poly :=
[
  term ((37 : Rat) / 2) [(2, 1), (10, 1)],
  term ((-37 : Rat) / 4) [(2, 2), (10, 1)],
  term ((-37 : Rat) / 4) [(3, 2), (10, 1)],
  term ((-37 : Rat) / 2) [(10, 1), (14, 1)],
  term ((37 : Rat) / 4) [(10, 1), (14, 2)],
  term ((37 : Rat) / 4) [(10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 5. -/
theorem rs_R002_ueqv_R002YNYN_partial_05_0217_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_05_0217
        rs_R002_ueqv_R002YNYN_generator_05_0200_0237 =
      rs_R002_ueqv_R002YNYN_partial_05_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 5. -/
def rs_R002_ueqv_R002YNYN_coefficient_05_0218 : Poly :=
[
  term (-6 : Rat) [(10, 1), (11, 1), (15, 1)]
]

/-- Partial product 218 for generator 5. -/
def rs_R002_ueqv_R002YNYN_partial_05_0218 : Poly :=
[
  term (12 : Rat) [(2, 1), (10, 1), (11, 1), (15, 1)],
  term (-6 : Rat) [(2, 2), (10, 1), (11, 1), (15, 1)],
  term (-6 : Rat) [(3, 2), (10, 1), (11, 1), (15, 1)],
  term (-12 : Rat) [(10, 1), (11, 1), (14, 1), (15, 1)],
  term (6 : Rat) [(10, 1), (11, 1), (14, 2), (15, 1)],
  term (6 : Rat) [(10, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 5. -/
theorem rs_R002_ueqv_R002YNYN_partial_05_0218_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_05_0218
        rs_R002_ueqv_R002YNYN_generator_05_0200_0237 =
      rs_R002_ueqv_R002YNYN_partial_05_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 5. -/
def rs_R002_ueqv_R002YNYN_coefficient_05_0219 : Poly :=
[
  term (-16 : Rat) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 219 for generator 5. -/
def rs_R002_ueqv_R002YNYN_partial_05_0219 : Poly :=
[
  term (32 : Rat) [(2, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term (-16 : Rat) [(2, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term (-16 : Rat) [(3, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term (-32 : Rat) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term (16 : Rat) [(10, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term (16 : Rat) [(10, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 5. -/
theorem rs_R002_ueqv_R002YNYN_partial_05_0219_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_05_0219
        rs_R002_ueqv_R002YNYN_generator_05_0200_0237 =
      rs_R002_ueqv_R002YNYN_partial_05_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 5. -/
def rs_R002_ueqv_R002YNYN_coefficient_05_0220 : Poly :=
[
  term ((16 : Rat) / 3) [(10, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 220 for generator 5. -/
def rs_R002_ueqv_R002YNYN_partial_05_0220 : Poly :=
[
  term ((-32 : Rat) / 3) [(2, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((16 : Rat) / 3) [(2, 2), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((16 : Rat) / 3) [(3, 2), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((32 : Rat) / 3) [(10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-16 : Rat) / 3) [(10, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-16 : Rat) / 3) [(10, 1), (12, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 5. -/
theorem rs_R002_ueqv_R002YNYN_partial_05_0220_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_05_0220
        rs_R002_ueqv_R002YNYN_generator_05_0200_0237 =
      rs_R002_ueqv_R002YNYN_partial_05_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 5. -/
def rs_R002_ueqv_R002YNYN_coefficient_05_0221 : Poly :=
[
  term ((-8 : Rat) / 3) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 221 for generator 5. -/
def rs_R002_ueqv_R002YNYN_partial_05_0221 : Poly :=
[
  term ((16 : Rat) / 3) [(2, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-8 : Rat) / 3) [(2, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-8 : Rat) / 3) [(3, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 3) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 3) [(10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((8 : Rat) / 3) [(10, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 5. -/
theorem rs_R002_ueqv_R002YNYN_partial_05_0221_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_05_0221
        rs_R002_ueqv_R002YNYN_generator_05_0200_0237 =
      rs_R002_ueqv_R002YNYN_partial_05_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 5. -/
def rs_R002_ueqv_R002YNYN_coefficient_05_0222 : Poly :=
[
  term (-21 : Rat) [(10, 1), (15, 2)]
]

/-- Partial product 222 for generator 5. -/
def rs_R002_ueqv_R002YNYN_partial_05_0222 : Poly :=
[
  term (42 : Rat) [(2, 1), (10, 1), (15, 2)],
  term (-21 : Rat) [(2, 2), (10, 1), (15, 2)],
  term (-21 : Rat) [(3, 2), (10, 1), (15, 2)],
  term (-42 : Rat) [(10, 1), (14, 1), (15, 2)],
  term (21 : Rat) [(10, 1), (14, 2), (15, 2)],
  term (21 : Rat) [(10, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 5. -/
theorem rs_R002_ueqv_R002YNYN_partial_05_0222_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_05_0222
        rs_R002_ueqv_R002YNYN_generator_05_0200_0237 =
      rs_R002_ueqv_R002YNYN_partial_05_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 5. -/
def rs_R002_ueqv_R002YNYN_coefficient_05_0223 : Poly :=
[
  term ((-20 : Rat) / 3) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 223 for generator 5. -/
def rs_R002_ueqv_R002YNYN_partial_05_0223 : Poly :=
[
  term ((40 : Rat) / 3) [(2, 1), (10, 1), (15, 2), (16, 1)],
  term ((-20 : Rat) / 3) [(2, 2), (10, 1), (15, 2), (16, 1)],
  term ((-20 : Rat) / 3) [(3, 2), (10, 1), (15, 2), (16, 1)],
  term ((-40 : Rat) / 3) [(10, 1), (14, 1), (15, 2), (16, 1)],
  term ((20 : Rat) / 3) [(10, 1), (14, 2), (15, 2), (16, 1)],
  term ((20 : Rat) / 3) [(10, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 5. -/
theorem rs_R002_ueqv_R002YNYN_partial_05_0223_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_05_0223
        rs_R002_ueqv_R002YNYN_generator_05_0200_0237 =
      rs_R002_ueqv_R002YNYN_partial_05_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 5. -/
def rs_R002_ueqv_R002YNYN_coefficient_05_0224 : Poly :=
[
  term (-15 : Rat) [(10, 2)]
]

/-- Partial product 224 for generator 5. -/
def rs_R002_ueqv_R002YNYN_partial_05_0224 : Poly :=
[
  term (30 : Rat) [(2, 1), (10, 2)],
  term (-15 : Rat) [(2, 2), (10, 2)],
  term (-15 : Rat) [(3, 2), (10, 2)],
  term (-30 : Rat) [(10, 2), (14, 1)],
  term (15 : Rat) [(10, 2), (14, 2)],
  term (15 : Rat) [(10, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 5. -/
theorem rs_R002_ueqv_R002YNYN_partial_05_0224_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_05_0224
        rs_R002_ueqv_R002YNYN_generator_05_0200_0237 =
      rs_R002_ueqv_R002YNYN_partial_05_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 5. -/
def rs_R002_ueqv_R002YNYN_coefficient_05_0225 : Poly :=
[
  term (-16 : Rat) [(11, 1), (13, 1)]
]

/-- Partial product 225 for generator 5. -/
def rs_R002_ueqv_R002YNYN_partial_05_0225 : Poly :=
[
  term (32 : Rat) [(2, 1), (11, 1), (13, 1)],
  term (-16 : Rat) [(2, 2), (11, 1), (13, 1)],
  term (-16 : Rat) [(3, 2), (11, 1), (13, 1)],
  term (-32 : Rat) [(11, 1), (13, 1), (14, 1)],
  term (16 : Rat) [(11, 1), (13, 1), (14, 2)],
  term (16 : Rat) [(11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 5. -/
theorem rs_R002_ueqv_R002YNYN_partial_05_0225_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_05_0225
        rs_R002_ueqv_R002YNYN_generator_05_0200_0237 =
      rs_R002_ueqv_R002YNYN_partial_05_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 5. -/
def rs_R002_ueqv_R002YNYN_coefficient_05_0226 : Poly :=
[
  term (-4 : Rat) [(11, 1), (15, 1)]
]

/-- Partial product 226 for generator 5. -/
def rs_R002_ueqv_R002YNYN_partial_05_0226 : Poly :=
[
  term (8 : Rat) [(2, 1), (11, 1), (15, 1)],
  term (-4 : Rat) [(2, 2), (11, 1), (15, 1)],
  term (-4 : Rat) [(3, 2), (11, 1), (15, 1)],
  term (-8 : Rat) [(11, 1), (14, 1), (15, 1)],
  term (4 : Rat) [(11, 1), (14, 2), (15, 1)],
  term (4 : Rat) [(11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 5. -/
theorem rs_R002_ueqv_R002YNYN_partial_05_0226_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_05_0226
        rs_R002_ueqv_R002YNYN_generator_05_0200_0237 =
      rs_R002_ueqv_R002YNYN_partial_05_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 5. -/
def rs_R002_ueqv_R002YNYN_coefficient_05_0227 : Poly :=
[
  term (2 : Rat) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 227 for generator 5. -/
def rs_R002_ueqv_R002YNYN_partial_05_0227 : Poly :=
[
  term (-4 : Rat) [(2, 1), (11, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term (-2 : Rat) [(11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 5. -/
theorem rs_R002_ueqv_R002YNYN_partial_05_0227_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_05_0227
        rs_R002_ueqv_R002YNYN_generator_05_0200_0237 =
      rs_R002_ueqv_R002YNYN_partial_05_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 5. -/
def rs_R002_ueqv_R002YNYN_coefficient_05_0228 : Poly :=
[
  term (-36 : Rat) [(11, 2)]
]

/-- Partial product 228 for generator 5. -/
def rs_R002_ueqv_R002YNYN_partial_05_0228 : Poly :=
[
  term (72 : Rat) [(2, 1), (11, 2)],
  term (-36 : Rat) [(2, 2), (11, 2)],
  term (-36 : Rat) [(3, 2), (11, 2)],
  term (-72 : Rat) [(11, 2), (14, 1)],
  term (36 : Rat) [(11, 2), (14, 2)],
  term (36 : Rat) [(11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 5. -/
theorem rs_R002_ueqv_R002YNYN_partial_05_0228_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_05_0228
        rs_R002_ueqv_R002YNYN_generator_05_0200_0237 =
      rs_R002_ueqv_R002YNYN_partial_05_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 5. -/
def rs_R002_ueqv_R002YNYN_coefficient_05_0229 : Poly :=
[
  term (1 : Rat) [(12, 1)]
]

/-- Partial product 229 for generator 5. -/
def rs_R002_ueqv_R002YNYN_partial_05_0229 : Poly :=
[
  term (-2 : Rat) [(2, 1), (12, 1)],
  term (1 : Rat) [(2, 2), (12, 1)],
  term (1 : Rat) [(3, 2), (12, 1)],
  term (2 : Rat) [(12, 1), (14, 1)],
  term (-1 : Rat) [(12, 1), (14, 2)],
  term (-1 : Rat) [(12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 5. -/
theorem rs_R002_ueqv_R002YNYN_partial_05_0229_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_05_0229
        rs_R002_ueqv_R002YNYN_generator_05_0200_0237 =
      rs_R002_ueqv_R002YNYN_partial_05_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 5. -/
def rs_R002_ueqv_R002YNYN_coefficient_05_0230 : Poly :=
[
  term (4 : Rat) [(12, 1), (13, 1), (15, 1)]
]

/-- Partial product 230 for generator 5. -/
def rs_R002_ueqv_R002YNYN_partial_05_0230 : Poly :=
[
  term (-8 : Rat) [(2, 1), (12, 1), (13, 1), (15, 1)],
  term (4 : Rat) [(2, 2), (12, 1), (13, 1), (15, 1)],
  term (4 : Rat) [(3, 2), (12, 1), (13, 1), (15, 1)],
  term (8 : Rat) [(12, 1), (13, 1), (14, 1), (15, 1)],
  term (-4 : Rat) [(12, 1), (13, 1), (14, 2), (15, 1)],
  term (-4 : Rat) [(12, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 5. -/
theorem rs_R002_ueqv_R002YNYN_partial_05_0230_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_05_0230
        rs_R002_ueqv_R002YNYN_generator_05_0200_0237 =
      rs_R002_ueqv_R002YNYN_partial_05_0230 := by
  native_decide

/-- Coefficient term 231 from coefficient polynomial 5. -/
def rs_R002_ueqv_R002YNYN_coefficient_05_0231 : Poly :=
[
  term (-4 : Rat) [(12, 1), (15, 2)]
]

/-- Partial product 231 for generator 5. -/
def rs_R002_ueqv_R002YNYN_partial_05_0231 : Poly :=
[
  term (8 : Rat) [(2, 1), (12, 1), (15, 2)],
  term (-4 : Rat) [(2, 2), (12, 1), (15, 2)],
  term (-4 : Rat) [(3, 2), (12, 1), (15, 2)],
  term (-8 : Rat) [(12, 1), (14, 1), (15, 2)],
  term (4 : Rat) [(12, 1), (14, 2), (15, 2)],
  term (4 : Rat) [(12, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 231 for generator 5. -/
theorem rs_R002_ueqv_R002YNYN_partial_05_0231_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_05_0231
        rs_R002_ueqv_R002YNYN_generator_05_0200_0237 =
      rs_R002_ueqv_R002YNYN_partial_05_0231 := by
  native_decide

/-- Coefficient term 232 from coefficient polynomial 5. -/
def rs_R002_ueqv_R002YNYN_coefficient_05_0232 : Poly :=
[
  term ((-7 : Rat) / 3) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 232 for generator 5. -/
def rs_R002_ueqv_R002YNYN_partial_05_0232 : Poly :=
[
  term ((14 : Rat) / 3) [(2, 1), (12, 1), (15, 2), (16, 1)],
  term ((-7 : Rat) / 3) [(2, 2), (12, 1), (15, 2), (16, 1)],
  term ((-7 : Rat) / 3) [(3, 2), (12, 1), (15, 2), (16, 1)],
  term ((-14 : Rat) / 3) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((7 : Rat) / 3) [(12, 1), (14, 2), (15, 2), (16, 1)],
  term ((7 : Rat) / 3) [(12, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 232 for generator 5. -/
theorem rs_R002_ueqv_R002YNYN_partial_05_0232_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_05_0232
        rs_R002_ueqv_R002YNYN_generator_05_0200_0237 =
      rs_R002_ueqv_R002YNYN_partial_05_0232 := by
  native_decide

/-- Coefficient term 233 from coefficient polynomial 5. -/
def rs_R002_ueqv_R002YNYN_coefficient_05_0233 : Poly :=
[
  term (-12 : Rat) [(13, 1), (15, 1)]
]

/-- Partial product 233 for generator 5. -/
def rs_R002_ueqv_R002YNYN_partial_05_0233 : Poly :=
[
  term (24 : Rat) [(2, 1), (13, 1), (15, 1)],
  term (-12 : Rat) [(2, 2), (13, 1), (15, 1)],
  term (-12 : Rat) [(3, 2), (13, 1), (15, 1)],
  term (-24 : Rat) [(13, 1), (14, 1), (15, 1)],
  term (12 : Rat) [(13, 1), (14, 2), (15, 1)],
  term (12 : Rat) [(13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 233 for generator 5. -/
theorem rs_R002_ueqv_R002YNYN_partial_05_0233_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_05_0233
        rs_R002_ueqv_R002YNYN_generator_05_0200_0237 =
      rs_R002_ueqv_R002YNYN_partial_05_0233 := by
  native_decide

/-- Coefficient term 234 from coefficient polynomial 5. -/
def rs_R002_ueqv_R002YNYN_coefficient_05_0234 : Poly :=
[
  term ((13 : Rat) / 6) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 234 for generator 5. -/
def rs_R002_ueqv_R002YNYN_partial_05_0234 : Poly :=
[
  term ((-13 : Rat) / 3) [(2, 1), (13, 1), (15, 1), (16, 1)],
  term ((13 : Rat) / 6) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((13 : Rat) / 6) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((13 : Rat) / 3) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-13 : Rat) / 6) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-13 : Rat) / 6) [(13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 234 for generator 5. -/
theorem rs_R002_ueqv_R002YNYN_partial_05_0234_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_05_0234
        rs_R002_ueqv_R002YNYN_generator_05_0200_0237 =
      rs_R002_ueqv_R002YNYN_partial_05_0234 := by
  native_decide

/-- Coefficient term 235 from coefficient polynomial 5. -/
def rs_R002_ueqv_R002YNYN_coefficient_05_0235 : Poly :=
[
  term (-2 : Rat) [(13, 2)]
]

/-- Partial product 235 for generator 5. -/
def rs_R002_ueqv_R002YNYN_partial_05_0235 : Poly :=
[
  term (4 : Rat) [(2, 1), (13, 2)],
  term (-2 : Rat) [(2, 2), (13, 2)],
  term (-2 : Rat) [(3, 2), (13, 2)],
  term (-4 : Rat) [(13, 2), (14, 1)],
  term (2 : Rat) [(13, 2), (14, 2)],
  term (2 : Rat) [(13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 235 for generator 5. -/
theorem rs_R002_ueqv_R002YNYN_partial_05_0235_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_05_0235
        rs_R002_ueqv_R002YNYN_generator_05_0200_0237 =
      rs_R002_ueqv_R002YNYN_partial_05_0235 := by
  native_decide

/-- Coefficient term 236 from coefficient polynomial 5. -/
def rs_R002_ueqv_R002YNYN_coefficient_05_0236 : Poly :=
[
  term (-30 : Rat) [(15, 2)]
]

/-- Partial product 236 for generator 5. -/
def rs_R002_ueqv_R002YNYN_partial_05_0236 : Poly :=
[
  term (60 : Rat) [(2, 1), (15, 2)],
  term (-30 : Rat) [(2, 2), (15, 2)],
  term (-30 : Rat) [(3, 2), (15, 2)],
  term (-60 : Rat) [(14, 1), (15, 2)],
  term (30 : Rat) [(14, 2), (15, 2)],
  term (30 : Rat) [(15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 236 for generator 5. -/
theorem rs_R002_ueqv_R002YNYN_partial_05_0236_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_05_0236
        rs_R002_ueqv_R002YNYN_generator_05_0200_0237 =
      rs_R002_ueqv_R002YNYN_partial_05_0236 := by
  native_decide

/-- Coefficient term 237 from coefficient polynomial 5. -/
def rs_R002_ueqv_R002YNYN_coefficient_05_0237 : Poly :=
[
  term ((4 : Rat) / 3) [(15, 2), (16, 1)]
]

/-- Partial product 237 for generator 5. -/
def rs_R002_ueqv_R002YNYN_partial_05_0237 : Poly :=
[
  term ((-8 : Rat) / 3) [(2, 1), (15, 2), (16, 1)],
  term ((4 : Rat) / 3) [(2, 2), (15, 2), (16, 1)],
  term ((4 : Rat) / 3) [(3, 2), (15, 2), (16, 1)],
  term ((8 : Rat) / 3) [(14, 1), (15, 2), (16, 1)],
  term ((-4 : Rat) / 3) [(14, 2), (15, 2), (16, 1)],
  term ((-4 : Rat) / 3) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 237 for generator 5. -/
theorem rs_R002_ueqv_R002YNYN_partial_05_0237_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_05_0237
        rs_R002_ueqv_R002YNYN_generator_05_0200_0237 =
      rs_R002_ueqv_R002YNYN_partial_05_0237 := by
  native_decide

/-- Partial products in this block. -/
def rs_R002_ueqv_R002YNYN_partials_05_0200_0237 : List Poly :=
[
  rs_R002_ueqv_R002YNYN_partial_05_0200,
  rs_R002_ueqv_R002YNYN_partial_05_0201,
  rs_R002_ueqv_R002YNYN_partial_05_0202,
  rs_R002_ueqv_R002YNYN_partial_05_0203,
  rs_R002_ueqv_R002YNYN_partial_05_0204,
  rs_R002_ueqv_R002YNYN_partial_05_0205,
  rs_R002_ueqv_R002YNYN_partial_05_0206,
  rs_R002_ueqv_R002YNYN_partial_05_0207,
  rs_R002_ueqv_R002YNYN_partial_05_0208,
  rs_R002_ueqv_R002YNYN_partial_05_0209,
  rs_R002_ueqv_R002YNYN_partial_05_0210,
  rs_R002_ueqv_R002YNYN_partial_05_0211,
  rs_R002_ueqv_R002YNYN_partial_05_0212,
  rs_R002_ueqv_R002YNYN_partial_05_0213,
  rs_R002_ueqv_R002YNYN_partial_05_0214,
  rs_R002_ueqv_R002YNYN_partial_05_0215,
  rs_R002_ueqv_R002YNYN_partial_05_0216,
  rs_R002_ueqv_R002YNYN_partial_05_0217,
  rs_R002_ueqv_R002YNYN_partial_05_0218,
  rs_R002_ueqv_R002YNYN_partial_05_0219,
  rs_R002_ueqv_R002YNYN_partial_05_0220,
  rs_R002_ueqv_R002YNYN_partial_05_0221,
  rs_R002_ueqv_R002YNYN_partial_05_0222,
  rs_R002_ueqv_R002YNYN_partial_05_0223,
  rs_R002_ueqv_R002YNYN_partial_05_0224,
  rs_R002_ueqv_R002YNYN_partial_05_0225,
  rs_R002_ueqv_R002YNYN_partial_05_0226,
  rs_R002_ueqv_R002YNYN_partial_05_0227,
  rs_R002_ueqv_R002YNYN_partial_05_0228,
  rs_R002_ueqv_R002YNYN_partial_05_0229,
  rs_R002_ueqv_R002YNYN_partial_05_0230,
  rs_R002_ueqv_R002YNYN_partial_05_0231,
  rs_R002_ueqv_R002YNYN_partial_05_0232,
  rs_R002_ueqv_R002YNYN_partial_05_0233,
  rs_R002_ueqv_R002YNYN_partial_05_0234,
  rs_R002_ueqv_R002YNYN_partial_05_0235,
  rs_R002_ueqv_R002YNYN_partial_05_0236,
  rs_R002_ueqv_R002YNYN_partial_05_0237
]

/-- Sum of partial products in this block. -/
def rs_R002_ueqv_R002YNYN_block_05_0200_0237 : Poly :=
[
  term (-8 : Rat) [(2, 1), (7, 1), (13, 1)],
  term (-8 : Rat) [(2, 1), (7, 1), (13, 1), (15, 2)],
  term (4 : Rat) [(2, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term (-16 : Rat) [(2, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term (34 : Rat) [(2, 1), (7, 1), (15, 1)],
  term (-23 : Rat) [(2, 1), (7, 1), (15, 1), (16, 1)],
  term (200 : Rat) [(2, 1), (7, 1), (15, 3)],
  term (20 : Rat) [(2, 1), (7, 1), (15, 3), (16, 1)],
  term (48 : Rat) [(2, 1), (7, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term (-72 : Rat) [(2, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term (-48 : Rat) [(2, 1), (7, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term (-96 : Rat) [(2, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(2, 1), (9, 1), (11, 1)],
  term ((16 : Rat) / 3) [(2, 1), (9, 1), (12, 1), (15, 1)],
  term ((344 : Rat) / 3) [(2, 1), (9, 1), (13, 1)],
  term (-32 : Rat) [(2, 1), (9, 1), (15, 1)],
  term ((-56 : Rat) / 3) [(2, 1), (9, 1), (15, 1), (16, 1)],
  term ((37 : Rat) / 2) [(2, 1), (10, 1)],
  term (12 : Rat) [(2, 1), (10, 1), (11, 1), (15, 1)],
  term (32 : Rat) [(2, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 3) [(2, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((16 : Rat) / 3) [(2, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term (42 : Rat) [(2, 1), (10, 1), (15, 2)],
  term ((40 : Rat) / 3) [(2, 1), (10, 1), (15, 2), (16, 1)],
  term (30 : Rat) [(2, 1), (10, 2)],
  term (32 : Rat) [(2, 1), (11, 1), (13, 1)],
  term (8 : Rat) [(2, 1), (11, 1), (15, 1)],
  term (-4 : Rat) [(2, 1), (11, 1), (15, 1), (16, 1)],
  term (72 : Rat) [(2, 1), (11, 2)],
  term (-2 : Rat) [(2, 1), (12, 1)],
  term (-8 : Rat) [(2, 1), (12, 1), (13, 1), (15, 1)],
  term (8 : Rat) [(2, 1), (12, 1), (15, 2)],
  term ((14 : Rat) / 3) [(2, 1), (12, 1), (15, 2), (16, 1)],
  term (24 : Rat) [(2, 1), (13, 1), (15, 1)],
  term ((-13 : Rat) / 3) [(2, 1), (13, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(2, 1), (13, 2)],
  term (60 : Rat) [(2, 1), (15, 2)],
  term ((-8 : Rat) / 3) [(2, 1), (15, 2), (16, 1)],
  term (4 : Rat) [(2, 2), (7, 1), (13, 1)],
  term (4 : Rat) [(2, 2), (7, 1), (13, 1), (15, 2)],
  term (-2 : Rat) [(2, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term (8 : Rat) [(2, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term (-17 : Rat) [(2, 2), (7, 1), (15, 1)],
  term ((23 : Rat) / 2) [(2, 2), (7, 1), (15, 1), (16, 1)],
  term (-100 : Rat) [(2, 2), (7, 1), (15, 3)],
  term (-10 : Rat) [(2, 2), (7, 1), (15, 3), (16, 1)],
  term (-24 : Rat) [(2, 2), (7, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term (36 : Rat) [(2, 2), (7, 2), (9, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(2, 2), (7, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term (48 : Rat) [(2, 2), (7, 2), (11, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(2, 2), (9, 1), (11, 1)],
  term ((-8 : Rat) / 3) [(2, 2), (9, 1), (12, 1), (15, 1)],
  term ((-172 : Rat) / 3) [(2, 2), (9, 1), (13, 1)],
  term (16 : Rat) [(2, 2), (9, 1), (15, 1)],
  term ((28 : Rat) / 3) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((-37 : Rat) / 4) [(2, 2), (10, 1)],
  term (-6 : Rat) [(2, 2), (10, 1), (11, 1), (15, 1)],
  term (-16 : Rat) [(2, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 3) [(2, 2), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-8 : Rat) / 3) [(2, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term (-21 : Rat) [(2, 2), (10, 1), (15, 2)],
  term ((-20 : Rat) / 3) [(2, 2), (10, 1), (15, 2), (16, 1)],
  term (-15 : Rat) [(2, 2), (10, 2)],
  term (-16 : Rat) [(2, 2), (11, 1), (13, 1)],
  term (-4 : Rat) [(2, 2), (11, 1), (15, 1)],
  term (2 : Rat) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term (-36 : Rat) [(2, 2), (11, 2)],
  term (1 : Rat) [(2, 2), (12, 1)],
  term (4 : Rat) [(2, 2), (12, 1), (13, 1), (15, 1)],
  term (-4 : Rat) [(2, 2), (12, 1), (15, 2)],
  term ((-7 : Rat) / 3) [(2, 2), (12, 1), (15, 2), (16, 1)],
  term (-12 : Rat) [(2, 2), (13, 1), (15, 1)],
  term ((13 : Rat) / 6) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(2, 2), (13, 2)],
  term (-30 : Rat) [(2, 2), (15, 2)],
  term ((4 : Rat) / 3) [(2, 2), (15, 2), (16, 1)],
  term (4 : Rat) [(3, 2), (7, 1), (13, 1)],
  term (4 : Rat) [(3, 2), (7, 1), (13, 1), (15, 2)],
  term (-2 : Rat) [(3, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term (8 : Rat) [(3, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term (-17 : Rat) [(3, 2), (7, 1), (15, 1)],
  term ((23 : Rat) / 2) [(3, 2), (7, 1), (15, 1), (16, 1)],
  term (-100 : Rat) [(3, 2), (7, 1), (15, 3)],
  term (-10 : Rat) [(3, 2), (7, 1), (15, 3), (16, 1)],
  term (-24 : Rat) [(3, 2), (7, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term (36 : Rat) [(3, 2), (7, 2), (9, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(3, 2), (7, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term (48 : Rat) [(3, 2), (7, 2), (11, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(3, 2), (9, 1), (11, 1)],
  term ((-8 : Rat) / 3) [(3, 2), (9, 1), (12, 1), (15, 1)],
  term ((-172 : Rat) / 3) [(3, 2), (9, 1), (13, 1)],
  term (16 : Rat) [(3, 2), (9, 1), (15, 1)],
  term ((28 : Rat) / 3) [(3, 2), (9, 1), (15, 1), (16, 1)],
  term ((-37 : Rat) / 4) [(3, 2), (10, 1)],
  term (-6 : Rat) [(3, 2), (10, 1), (11, 1), (15, 1)],
  term (-16 : Rat) [(3, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 3) [(3, 2), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-8 : Rat) / 3) [(3, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term (-21 : Rat) [(3, 2), (10, 1), (15, 2)],
  term ((-20 : Rat) / 3) [(3, 2), (10, 1), (15, 2), (16, 1)],
  term (-15 : Rat) [(3, 2), (10, 2)],
  term (-16 : Rat) [(3, 2), (11, 1), (13, 1)],
  term (-4 : Rat) [(3, 2), (11, 1), (15, 1)],
  term (2 : Rat) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term (-36 : Rat) [(3, 2), (11, 2)],
  term (1 : Rat) [(3, 2), (12, 1)],
  term (4 : Rat) [(3, 2), (12, 1), (13, 1), (15, 1)],
  term (-4 : Rat) [(3, 2), (12, 1), (15, 2)],
  term ((-7 : Rat) / 3) [(3, 2), (12, 1), (15, 2), (16, 1)],
  term (-12 : Rat) [(3, 2), (13, 1), (15, 1)],
  term ((13 : Rat) / 6) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(3, 2), (13, 2)],
  term (-30 : Rat) [(3, 2), (15, 2)],
  term ((4 : Rat) / 3) [(3, 2), (15, 2), (16, 1)],
  term (8 : Rat) [(7, 1), (13, 1), (14, 1)],
  term (8 : Rat) [(7, 1), (13, 1), (14, 1), (15, 2)],
  term (-4 : Rat) [(7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term (-4 : Rat) [(7, 1), (13, 1), (14, 2)],
  term (-4 : Rat) [(7, 1), (13, 1), (14, 2), (15, 2)],
  term (2 : Rat) [(7, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term (-4 : Rat) [(7, 1), (13, 1), (15, 2)],
  term (-4 : Rat) [(7, 1), (13, 1), (15, 4)],
  term (2 : Rat) [(7, 1), (13, 1), (15, 4), (16, 1)],
  term (16 : Rat) [(7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(7, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term (-8 : Rat) [(7, 1), (13, 2), (15, 3), (16, 1)],
  term (-34 : Rat) [(7, 1), (14, 1), (15, 1)],
  term (23 : Rat) [(7, 1), (14, 1), (15, 1), (16, 1)],
  term (-200 : Rat) [(7, 1), (14, 1), (15, 3)],
  term (-20 : Rat) [(7, 1), (14, 1), (15, 3), (16, 1)],
  term (17 : Rat) [(7, 1), (14, 2), (15, 1)],
  term ((-23 : Rat) / 2) [(7, 1), (14, 2), (15, 1), (16, 1)],
  term (100 : Rat) [(7, 1), (14, 2), (15, 3)],
  term (10 : Rat) [(7, 1), (14, 2), (15, 3), (16, 1)],
  term (17 : Rat) [(7, 1), (15, 3)],
  term ((-23 : Rat) / 2) [(7, 1), (15, 3), (16, 1)],
  term (100 : Rat) [(7, 1), (15, 5)],
  term (10 : Rat) [(7, 1), (15, 5), (16, 1)],
  term (-48 : Rat) [(7, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(7, 2), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term (24 : Rat) [(7, 2), (9, 1), (12, 1), (15, 3), (16, 1)],
  term (72 : Rat) [(7, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term (-36 : Rat) [(7, 2), (9, 1), (14, 2), (15, 1), (16, 1)],
  term (-36 : Rat) [(7, 2), (9, 1), (15, 3), (16, 1)],
  term (48 : Rat) [(7, 2), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(7, 2), (10, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term (-24 : Rat) [(7, 2), (10, 1), (11, 1), (15, 3), (16, 1)],
  term (96 : Rat) [(7, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term (-48 : Rat) [(7, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term (-48 : Rat) [(7, 2), (11, 1), (15, 3), (16, 1)],
  term (8 : Rat) [(9, 1), (11, 1), (14, 1)],
  term (-4 : Rat) [(9, 1), (11, 1), (14, 2)],
  term (-4 : Rat) [(9, 1), (11, 1), (15, 2)],
  term ((-16 : Rat) / 3) [(9, 1), (12, 1), (14, 1), (15, 1)],
  term ((8 : Rat) / 3) [(9, 1), (12, 1), (14, 2), (15, 1)],
  term ((8 : Rat) / 3) [(9, 1), (12, 1), (15, 3)],
  term ((-344 : Rat) / 3) [(9, 1), (13, 1), (14, 1)],
  term ((172 : Rat) / 3) [(9, 1), (13, 1), (14, 2)],
  term ((172 : Rat) / 3) [(9, 1), (13, 1), (15, 2)],
  term (32 : Rat) [(9, 1), (14, 1), (15, 1)],
  term ((56 : Rat) / 3) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term (-16 : Rat) [(9, 1), (14, 2), (15, 1)],
  term ((-28 : Rat) / 3) [(9, 1), (14, 2), (15, 1), (16, 1)],
  term (-16 : Rat) [(9, 1), (15, 3)],
  term ((-28 : Rat) / 3) [(9, 1), (15, 3), (16, 1)],
  term (-12 : Rat) [(10, 1), (11, 1), (14, 1), (15, 1)],
  term (-32 : Rat) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(10, 1), (11, 1), (14, 2), (15, 1)],
  term (16 : Rat) [(10, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term (6 : Rat) [(10, 1), (11, 1), (15, 3)],
  term (16 : Rat) [(10, 1), (11, 1), (15, 3), (16, 1)],
  term ((32 : Rat) / 3) [(10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-16 : Rat) / 3) [(10, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-16 : Rat) / 3) [(10, 1), (12, 1), (15, 4), (16, 1)],
  term ((-16 : Rat) / 3) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 3) [(10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((8 : Rat) / 3) [(10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-37 : Rat) / 2) [(10, 1), (14, 1)],
  term (-42 : Rat) [(10, 1), (14, 1), (15, 2)],
  term ((-40 : Rat) / 3) [(10, 1), (14, 1), (15, 2), (16, 1)],
  term ((37 : Rat) / 4) [(10, 1), (14, 2)],
  term (21 : Rat) [(10, 1), (14, 2), (15, 2)],
  term ((20 : Rat) / 3) [(10, 1), (14, 2), (15, 2), (16, 1)],
  term ((37 : Rat) / 4) [(10, 1), (15, 2)],
  term (21 : Rat) [(10, 1), (15, 4)],
  term ((20 : Rat) / 3) [(10, 1), (15, 4), (16, 1)],
  term (-30 : Rat) [(10, 2), (14, 1)],
  term (15 : Rat) [(10, 2), (14, 2)],
  term (15 : Rat) [(10, 2), (15, 2)],
  term (-32 : Rat) [(11, 1), (13, 1), (14, 1)],
  term (16 : Rat) [(11, 1), (13, 1), (14, 2)],
  term (16 : Rat) [(11, 1), (13, 1), (15, 2)],
  term (-8 : Rat) [(11, 1), (14, 1), (15, 1)],
  term (4 : Rat) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(11, 1), (14, 2), (15, 1)],
  term (-2 : Rat) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term (4 : Rat) [(11, 1), (15, 3)],
  term (-2 : Rat) [(11, 1), (15, 3), (16, 1)],
  term (-72 : Rat) [(11, 2), (14, 1)],
  term (36 : Rat) [(11, 2), (14, 2)],
  term (36 : Rat) [(11, 2), (15, 2)],
  term (8 : Rat) [(12, 1), (13, 1), (14, 1), (15, 1)],
  term (-4 : Rat) [(12, 1), (13, 1), (14, 2), (15, 1)],
  term (-4 : Rat) [(12, 1), (13, 1), (15, 3)],
  term (2 : Rat) [(12, 1), (14, 1)],
  term (-8 : Rat) [(12, 1), (14, 1), (15, 2)],
  term ((-14 : Rat) / 3) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term (-1 : Rat) [(12, 1), (14, 2)],
  term (4 : Rat) [(12, 1), (14, 2), (15, 2)],
  term ((7 : Rat) / 3) [(12, 1), (14, 2), (15, 2), (16, 1)],
  term (-1 : Rat) [(12, 1), (15, 2)],
  term (4 : Rat) [(12, 1), (15, 4)],
  term ((7 : Rat) / 3) [(12, 1), (15, 4), (16, 1)],
  term (-24 : Rat) [(13, 1), (14, 1), (15, 1)],
  term ((13 : Rat) / 3) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(13, 1), (14, 2), (15, 1)],
  term ((-13 : Rat) / 6) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term (12 : Rat) [(13, 1), (15, 3)],
  term ((-13 : Rat) / 6) [(13, 1), (15, 3), (16, 1)],
  term (-4 : Rat) [(13, 2), (14, 1)],
  term (2 : Rat) [(13, 2), (14, 2)],
  term (2 : Rat) [(13, 2), (15, 2)],
  term (-60 : Rat) [(14, 1), (15, 2)],
  term ((8 : Rat) / 3) [(14, 1), (15, 2), (16, 1)],
  term (30 : Rat) [(14, 2), (15, 2)],
  term ((-4 : Rat) / 3) [(14, 2), (15, 2), (16, 1)],
  term (30 : Rat) [(15, 4)],
  term ((-4 : Rat) / 3) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 5, terms 200 through 237. -/
theorem rs_R002_ueqv_R002YNYN_block_05_0200_0237_valid :
    checkProductSumEq rs_R002_ueqv_R002YNYN_partials_05_0200_0237
      rs_R002_ueqv_R002YNYN_block_05_0200_0237 = true := by
  native_decide

end R002UeqvR002YNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
