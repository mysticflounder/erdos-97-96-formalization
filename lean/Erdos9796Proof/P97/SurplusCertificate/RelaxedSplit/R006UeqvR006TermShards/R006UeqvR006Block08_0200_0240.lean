/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R006:u=v:R006, term block 8:200-240

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R006UeqvR006TermShards

/-- Generator polynomial 8 for relaxed split surplus certificate `R006:u=v:R006`. -/
def rs_R006_ueqv_R006_generator_08_0200_0240 : Poly :=
[
  term (2 : Rat) [(0, 1), (6, 1)],
  term (2 : Rat) [(1, 1), (7, 1)],
  term (-1 : Rat) [(6, 2)],
  term (-1 : Rat) [(7, 2)]
]

/-- Coefficient term 200 from coefficient polynomial 8. -/
def rs_R006_ueqv_R006_coefficient_08_0200 : Poly :=
[
  term ((-3456 : Rat) / 5) [(9, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 200 for generator 8. -/
def rs_R006_ueqv_R006_partial_08_0200 : Poly :=
[
  term ((-6912 : Rat) / 5) [(0, 1), (6, 1), (9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-6912 : Rat) / 5) [(1, 1), (7, 1), (9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((3456 : Rat) / 5) [(6, 2), (9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((3456 : Rat) / 5) [(7, 2), (9, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 8. -/
theorem rs_R006_ueqv_R006_partial_08_0200_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_08_0200
        rs_R006_ueqv_R006_generator_08_0200_0240 =
      rs_R006_ueqv_R006_partial_08_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 8. -/
def rs_R006_ueqv_R006_coefficient_08_0201 : Poly :=
[
  term ((1728 : Rat) / 5) [(9, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 201 for generator 8. -/
def rs_R006_ueqv_R006_partial_08_0201 : Poly :=
[
  term ((3456 : Rat) / 5) [(0, 1), (6, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((3456 : Rat) / 5) [(1, 1), (7, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-1728 : Rat) / 5) [(6, 2), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-1728 : Rat) / 5) [(7, 2), (9, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 8. -/
theorem rs_R006_ueqv_R006_partial_08_0201_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_08_0201
        rs_R006_ueqv_R006_generator_08_0200_0240 =
      rs_R006_ueqv_R006_partial_08_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 8. -/
def rs_R006_ueqv_R006_coefficient_08_0202 : Poly :=
[
  term ((3144 : Rat) / 5) [(9, 1), (11, 2), (13, 1)]
]

/-- Partial product 202 for generator 8. -/
def rs_R006_ueqv_R006_partial_08_0202 : Poly :=
[
  term ((6288 : Rat) / 5) [(0, 1), (6, 1), (9, 1), (11, 2), (13, 1)],
  term ((6288 : Rat) / 5) [(1, 1), (7, 1), (9, 1), (11, 2), (13, 1)],
  term ((-3144 : Rat) / 5) [(6, 2), (9, 1), (11, 2), (13, 1)],
  term ((-3144 : Rat) / 5) [(7, 2), (9, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 8. -/
theorem rs_R006_ueqv_R006_partial_08_0202_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_08_0202
        rs_R006_ueqv_R006_generator_08_0200_0240 =
      rs_R006_ueqv_R006_partial_08_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 8. -/
def rs_R006_ueqv_R006_coefficient_08_0203 : Poly :=
[
  term ((-6624 : Rat) / 5) [(9, 1), (11, 2), (13, 1), (14, 1)]
]

/-- Partial product 203 for generator 8. -/
def rs_R006_ueqv_R006_partial_08_0203 : Poly :=
[
  term ((-13248 : Rat) / 5) [(0, 1), (6, 1), (9, 1), (11, 2), (13, 1), (14, 1)],
  term ((-13248 : Rat) / 5) [(1, 1), (7, 1), (9, 1), (11, 2), (13, 1), (14, 1)],
  term ((6624 : Rat) / 5) [(6, 2), (9, 1), (11, 2), (13, 1), (14, 1)],
  term ((6624 : Rat) / 5) [(7, 2), (9, 1), (11, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 8. -/
theorem rs_R006_ueqv_R006_partial_08_0203_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_08_0203
        rs_R006_ueqv_R006_generator_08_0200_0240 =
      rs_R006_ueqv_R006_partial_08_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 8. -/
def rs_R006_ueqv_R006_coefficient_08_0204 : Poly :=
[
  term ((2208 : Rat) / 5) [(9, 1), (11, 2), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 204 for generator 8. -/
def rs_R006_ueqv_R006_partial_08_0204 : Poly :=
[
  term ((4416 : Rat) / 5) [(0, 1), (6, 1), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((4416 : Rat) / 5) [(1, 1), (7, 1), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-2208 : Rat) / 5) [(6, 2), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-2208 : Rat) / 5) [(7, 2), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 8. -/
theorem rs_R006_ueqv_R006_partial_08_0204_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_08_0204
        rs_R006_ueqv_R006_generator_08_0200_0240 =
      rs_R006_ueqv_R006_partial_08_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 8. -/
def rs_R006_ueqv_R006_coefficient_08_0205 : Poly :=
[
  term ((-1104 : Rat) / 5) [(9, 1), (11, 2), (13, 1), (16, 1)]
]

/-- Partial product 205 for generator 8. -/
def rs_R006_ueqv_R006_partial_08_0205 : Poly :=
[
  term ((-2208 : Rat) / 5) [(0, 1), (6, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-2208 : Rat) / 5) [(1, 1), (7, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((1104 : Rat) / 5) [(6, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((1104 : Rat) / 5) [(7, 2), (9, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 8. -/
theorem rs_R006_ueqv_R006_partial_08_0205_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_08_0205
        rs_R006_ueqv_R006_generator_08_0200_0240 =
      rs_R006_ueqv_R006_partial_08_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 8. -/
def rs_R006_ueqv_R006_coefficient_08_0206 : Poly :=
[
  term ((6624 : Rat) / 5) [(9, 1), (11, 2), (15, 1)]
]

/-- Partial product 206 for generator 8. -/
def rs_R006_ueqv_R006_partial_08_0206 : Poly :=
[
  term ((13248 : Rat) / 5) [(0, 1), (6, 1), (9, 1), (11, 2), (15, 1)],
  term ((13248 : Rat) / 5) [(1, 1), (7, 1), (9, 1), (11, 2), (15, 1)],
  term ((-6624 : Rat) / 5) [(6, 2), (9, 1), (11, 2), (15, 1)],
  term ((-6624 : Rat) / 5) [(7, 2), (9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 8. -/
theorem rs_R006_ueqv_R006_partial_08_0206_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_08_0206
        rs_R006_ueqv_R006_generator_08_0200_0240 =
      rs_R006_ueqv_R006_partial_08_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 8. -/
def rs_R006_ueqv_R006_coefficient_08_0207 : Poly :=
[
  term ((-2208 : Rat) / 5) [(9, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 207 for generator 8. -/
def rs_R006_ueqv_R006_partial_08_0207 : Poly :=
[
  term ((-4416 : Rat) / 5) [(0, 1), (6, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-4416 : Rat) / 5) [(1, 1), (7, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((2208 : Rat) / 5) [(6, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((2208 : Rat) / 5) [(7, 2), (9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 8. -/
theorem rs_R006_ueqv_R006_partial_08_0207_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_08_0207
        rs_R006_ueqv_R006_generator_08_0200_0240 =
      rs_R006_ueqv_R006_partial_08_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 8. -/
def rs_R006_ueqv_R006_coefficient_08_0208 : Poly :=
[
  term ((996 : Rat) / 7) [(9, 1), (13, 1)]
]

/-- Partial product 208 for generator 8. -/
def rs_R006_ueqv_R006_partial_08_0208 : Poly :=
[
  term ((1992 : Rat) / 7) [(0, 1), (6, 1), (9, 1), (13, 1)],
  term ((1992 : Rat) / 7) [(1, 1), (7, 1), (9, 1), (13, 1)],
  term ((-996 : Rat) / 7) [(6, 2), (9, 1), (13, 1)],
  term ((-996 : Rat) / 7) [(7, 2), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 8. -/
theorem rs_R006_ueqv_R006_partial_08_0208_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_08_0208
        rs_R006_ueqv_R006_generator_08_0200_0240 =
      rs_R006_ueqv_R006_partial_08_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 8. -/
def rs_R006_ueqv_R006_coefficient_08_0209 : Poly :=
[
  term (-288 : Rat) [(9, 1), (13, 1), (14, 1)]
]

/-- Partial product 209 for generator 8. -/
def rs_R006_ueqv_R006_partial_08_0209 : Poly :=
[
  term (-576 : Rat) [(0, 1), (6, 1), (9, 1), (13, 1), (14, 1)],
  term (-576 : Rat) [(1, 1), (7, 1), (9, 1), (13, 1), (14, 1)],
  term (288 : Rat) [(6, 2), (9, 1), (13, 1), (14, 1)],
  term (288 : Rat) [(7, 2), (9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 8. -/
theorem rs_R006_ueqv_R006_partial_08_0209_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_08_0209
        rs_R006_ueqv_R006_generator_08_0200_0240 =
      rs_R006_ueqv_R006_partial_08_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 8. -/
def rs_R006_ueqv_R006_coefficient_08_0210 : Poly :=
[
  term (96 : Rat) [(9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 210 for generator 8. -/
def rs_R006_ueqv_R006_partial_08_0210 : Poly :=
[
  term (192 : Rat) [(0, 1), (6, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term (192 : Rat) [(1, 1), (7, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term (-96 : Rat) [(6, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term (-96 : Rat) [(7, 2), (9, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 8. -/
theorem rs_R006_ueqv_R006_partial_08_0210_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_08_0210
        rs_R006_ueqv_R006_generator_08_0200_0240 =
      rs_R006_ueqv_R006_partial_08_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 8. -/
def rs_R006_ueqv_R006_coefficient_08_0211 : Poly :=
[
  term (-48 : Rat) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 211 for generator 8. -/
def rs_R006_ueqv_R006_partial_08_0211 : Poly :=
[
  term (-96 : Rat) [(0, 1), (6, 1), (9, 1), (13, 1), (16, 1)],
  term (-96 : Rat) [(1, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term (48 : Rat) [(6, 2), (9, 1), (13, 1), (16, 1)],
  term (48 : Rat) [(7, 2), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 8. -/
theorem rs_R006_ueqv_R006_partial_08_0211_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_08_0211
        rs_R006_ueqv_R006_generator_08_0200_0240 =
      rs_R006_ueqv_R006_partial_08_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 8. -/
def rs_R006_ueqv_R006_coefficient_08_0212 : Poly :=
[
  term (288 : Rat) [(9, 1), (15, 1)]
]

/-- Partial product 212 for generator 8. -/
def rs_R006_ueqv_R006_partial_08_0212 : Poly :=
[
  term (576 : Rat) [(0, 1), (6, 1), (9, 1), (15, 1)],
  term (576 : Rat) [(1, 1), (7, 1), (9, 1), (15, 1)],
  term (-288 : Rat) [(6, 2), (9, 1), (15, 1)],
  term (-288 : Rat) [(7, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 8. -/
theorem rs_R006_ueqv_R006_partial_08_0212_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_08_0212
        rs_R006_ueqv_R006_generator_08_0200_0240 =
      rs_R006_ueqv_R006_partial_08_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 8. -/
def rs_R006_ueqv_R006_coefficient_08_0213 : Poly :=
[
  term (-96 : Rat) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 213 for generator 8. -/
def rs_R006_ueqv_R006_partial_08_0213 : Poly :=
[
  term (-192 : Rat) [(0, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term (-192 : Rat) [(1, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term (96 : Rat) [(6, 2), (9, 1), (15, 1), (16, 1)],
  term (96 : Rat) [(7, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 8. -/
theorem rs_R006_ueqv_R006_partial_08_0213_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_08_0213
        rs_R006_ueqv_R006_generator_08_0200_0240 =
      rs_R006_ueqv_R006_partial_08_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 8. -/
def rs_R006_ueqv_R006_coefficient_08_0214 : Poly :=
[
  term ((-1152 : Rat) / 7) [(9, 2), (11, 1), (13, 1)]
]

/-- Partial product 214 for generator 8. -/
def rs_R006_ueqv_R006_partial_08_0214 : Poly :=
[
  term ((-2304 : Rat) / 7) [(0, 1), (6, 1), (9, 2), (11, 1), (13, 1)],
  term ((-2304 : Rat) / 7) [(1, 1), (7, 1), (9, 2), (11, 1), (13, 1)],
  term ((1152 : Rat) / 7) [(6, 2), (9, 2), (11, 1), (13, 1)],
  term ((1152 : Rat) / 7) [(7, 2), (9, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 8. -/
theorem rs_R006_ueqv_R006_partial_08_0214_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_08_0214
        rs_R006_ueqv_R006_generator_08_0200_0240 =
      rs_R006_ueqv_R006_partial_08_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 8. -/
def rs_R006_ueqv_R006_coefficient_08_0215 : Poly :=
[
  term ((1728 : Rat) / 5) [(9, 2), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 215 for generator 8. -/
def rs_R006_ueqv_R006_partial_08_0215 : Poly :=
[
  term ((3456 : Rat) / 5) [(0, 1), (6, 1), (9, 2), (11, 1), (13, 1), (14, 1)],
  term ((3456 : Rat) / 5) [(1, 1), (7, 1), (9, 2), (11, 1), (13, 1), (14, 1)],
  term ((-1728 : Rat) / 5) [(6, 2), (9, 2), (11, 1), (13, 1), (14, 1)],
  term ((-1728 : Rat) / 5) [(7, 2), (9, 2), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 8. -/
theorem rs_R006_ueqv_R006_partial_08_0215_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_08_0215
        rs_R006_ueqv_R006_generator_08_0200_0240 =
      rs_R006_ueqv_R006_partial_08_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 8. -/
def rs_R006_ueqv_R006_coefficient_08_0216 : Poly :=
[
  term ((-576 : Rat) / 5) [(9, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 216 for generator 8. -/
def rs_R006_ueqv_R006_partial_08_0216 : Poly :=
[
  term ((-1152 : Rat) / 5) [(0, 1), (6, 1), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1152 : Rat) / 5) [(1, 1), (7, 1), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((576 : Rat) / 5) [(6, 2), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((576 : Rat) / 5) [(7, 2), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 8. -/
theorem rs_R006_ueqv_R006_partial_08_0216_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_08_0216
        rs_R006_ueqv_R006_generator_08_0200_0240 =
      rs_R006_ueqv_R006_partial_08_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 8. -/
def rs_R006_ueqv_R006_coefficient_08_0217 : Poly :=
[
  term ((288 : Rat) / 5) [(9, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 217 for generator 8. -/
def rs_R006_ueqv_R006_partial_08_0217 : Poly :=
[
  term ((576 : Rat) / 5) [(0, 1), (6, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((576 : Rat) / 5) [(1, 1), (7, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(6, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(7, 2), (9, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 8. -/
theorem rs_R006_ueqv_R006_partial_08_0217_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_08_0217
        rs_R006_ueqv_R006_generator_08_0200_0240 =
      rs_R006_ueqv_R006_partial_08_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 8. -/
def rs_R006_ueqv_R006_coefficient_08_0218 : Poly :=
[
  term ((-1728 : Rat) / 5) [(9, 2), (11, 1), (15, 1)]
]

/-- Partial product 218 for generator 8. -/
def rs_R006_ueqv_R006_partial_08_0218 : Poly :=
[
  term ((-3456 : Rat) / 5) [(0, 1), (6, 1), (9, 2), (11, 1), (15, 1)],
  term ((-3456 : Rat) / 5) [(1, 1), (7, 1), (9, 2), (11, 1), (15, 1)],
  term ((1728 : Rat) / 5) [(6, 2), (9, 2), (11, 1), (15, 1)],
  term ((1728 : Rat) / 5) [(7, 2), (9, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 8. -/
theorem rs_R006_ueqv_R006_partial_08_0218_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_08_0218
        rs_R006_ueqv_R006_generator_08_0200_0240 =
      rs_R006_ueqv_R006_partial_08_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 8. -/
def rs_R006_ueqv_R006_coefficient_08_0219 : Poly :=
[
  term ((576 : Rat) / 5) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 219 for generator 8. -/
def rs_R006_ueqv_R006_partial_08_0219 : Poly :=
[
  term ((1152 : Rat) / 5) [(0, 1), (6, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((1152 : Rat) / 5) [(1, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-576 : Rat) / 5) [(6, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-576 : Rat) / 5) [(7, 2), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 8. -/
theorem rs_R006_ueqv_R006_partial_08_0219_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_08_0219
        rs_R006_ueqv_R006_generator_08_0200_0240 =
      rs_R006_ueqv_R006_partial_08_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 8. -/
def rs_R006_ueqv_R006_coefficient_08_0220 : Poly :=
[
  term ((2988 : Rat) / 35) [(11, 1), (12, 1), (13, 1)]
]

/-- Partial product 220 for generator 8. -/
def rs_R006_ueqv_R006_partial_08_0220 : Poly :=
[
  term ((5976 : Rat) / 35) [(0, 1), (6, 1), (11, 1), (12, 1), (13, 1)],
  term ((5976 : Rat) / 35) [(1, 1), (7, 1), (11, 1), (12, 1), (13, 1)],
  term ((-2988 : Rat) / 35) [(6, 2), (11, 1), (12, 1), (13, 1)],
  term ((-2988 : Rat) / 35) [(7, 2), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 8. -/
theorem rs_R006_ueqv_R006_partial_08_0220_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_08_0220
        rs_R006_ueqv_R006_generator_08_0200_0240 =
      rs_R006_ueqv_R006_partial_08_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 8. -/
def rs_R006_ueqv_R006_coefficient_08_0221 : Poly :=
[
  term ((-864 : Rat) / 5) [(11, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 221 for generator 8. -/
def rs_R006_ueqv_R006_partial_08_0221 : Poly :=
[
  term ((-1728 : Rat) / 5) [(0, 1), (6, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-1728 : Rat) / 5) [(1, 1), (7, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((864 : Rat) / 5) [(6, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((864 : Rat) / 5) [(7, 2), (11, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 8. -/
theorem rs_R006_ueqv_R006_partial_08_0221_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_08_0221
        rs_R006_ueqv_R006_generator_08_0200_0240 =
      rs_R006_ueqv_R006_partial_08_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 8. -/
def rs_R006_ueqv_R006_coefficient_08_0222 : Poly :=
[
  term ((288 : Rat) / 5) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 222 for generator 8. -/
def rs_R006_ueqv_R006_partial_08_0222 : Poly :=
[
  term ((576 : Rat) / 5) [(0, 1), (6, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((576 : Rat) / 5) [(1, 1), (7, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(6, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(7, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 8. -/
theorem rs_R006_ueqv_R006_partial_08_0222_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_08_0222
        rs_R006_ueqv_R006_generator_08_0200_0240 =
      rs_R006_ueqv_R006_partial_08_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 8. -/
def rs_R006_ueqv_R006_coefficient_08_0223 : Poly :=
[
  term ((-144 : Rat) / 5) [(11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 223 for generator 8. -/
def rs_R006_ueqv_R006_partial_08_0223 : Poly :=
[
  term ((-288 : Rat) / 5) [(0, 1), (6, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(1, 1), (7, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((144 : Rat) / 5) [(6, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((144 : Rat) / 5) [(7, 2), (11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 8. -/
theorem rs_R006_ueqv_R006_partial_08_0223_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_08_0223
        rs_R006_ueqv_R006_generator_08_0200_0240 =
      rs_R006_ueqv_R006_partial_08_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 8. -/
def rs_R006_ueqv_R006_coefficient_08_0224 : Poly :=
[
  term (174 : Rat) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 224 for generator 8. -/
def rs_R006_ueqv_R006_partial_08_0224 : Poly :=
[
  term (348 : Rat) [(0, 1), (6, 1), (11, 1), (12, 1), (15, 1)],
  term (348 : Rat) [(1, 1), (7, 1), (11, 1), (12, 1), (15, 1)],
  term (-174 : Rat) [(6, 2), (11, 1), (12, 1), (15, 1)],
  term (-174 : Rat) [(7, 2), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 8. -/
theorem rs_R006_ueqv_R006_partial_08_0224_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_08_0224
        rs_R006_ueqv_R006_generator_08_0200_0240 =
      rs_R006_ueqv_R006_partial_08_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 8. -/
def rs_R006_ueqv_R006_coefficient_08_0225 : Poly :=
[
  term ((-276 : Rat) / 5) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 225 for generator 8. -/
def rs_R006_ueqv_R006_partial_08_0225 : Poly :=
[
  term ((-552 : Rat) / 5) [(0, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-552 : Rat) / 5) [(1, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((276 : Rat) / 5) [(6, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((276 : Rat) / 5) [(7, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 8. -/
theorem rs_R006_ueqv_R006_partial_08_0225_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_08_0225
        rs_R006_ueqv_R006_generator_08_0200_0240 =
      rs_R006_ueqv_R006_partial_08_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 8. -/
def rs_R006_ueqv_R006_coefficient_08_0226 : Poly :=
[
  term ((7008 : Rat) / 35) [(11, 1), (13, 1)]
]

/-- Partial product 226 for generator 8. -/
def rs_R006_ueqv_R006_partial_08_0226 : Poly :=
[
  term ((14016 : Rat) / 35) [(0, 1), (6, 1), (11, 1), (13, 1)],
  term ((14016 : Rat) / 35) [(1, 1), (7, 1), (11, 1), (13, 1)],
  term ((-7008 : Rat) / 35) [(6, 2), (11, 1), (13, 1)],
  term ((-7008 : Rat) / 35) [(7, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 8. -/
theorem rs_R006_ueqv_R006_partial_08_0226_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_08_0226
        rs_R006_ueqv_R006_generator_08_0200_0240 =
      rs_R006_ueqv_R006_partial_08_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 8. -/
def rs_R006_ueqv_R006_coefficient_08_0227 : Poly :=
[
  term ((-648 : Rat) / 5) [(11, 1), (13, 1), (14, 1)]
]

/-- Partial product 227 for generator 8. -/
def rs_R006_ueqv_R006_partial_08_0227 : Poly :=
[
  term ((-1296 : Rat) / 5) [(0, 1), (6, 1), (11, 1), (13, 1), (14, 1)],
  term ((-1296 : Rat) / 5) [(1, 1), (7, 1), (11, 1), (13, 1), (14, 1)],
  term ((648 : Rat) / 5) [(6, 2), (11, 1), (13, 1), (14, 1)],
  term ((648 : Rat) / 5) [(7, 2), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 8. -/
theorem rs_R006_ueqv_R006_partial_08_0227_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_08_0227
        rs_R006_ueqv_R006_generator_08_0200_0240 =
      rs_R006_ueqv_R006_partial_08_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 8. -/
def rs_R006_ueqv_R006_coefficient_08_0228 : Poly :=
[
  term ((-96 : Rat) / 5) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 228 for generator 8. -/
def rs_R006_ueqv_R006_partial_08_0228 : Poly :=
[
  term ((-192 : Rat) / 5) [(0, 1), (6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-192 : Rat) / 5) [(1, 1), (7, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((96 : Rat) / 5) [(6, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((96 : Rat) / 5) [(7, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 8. -/
theorem rs_R006_ueqv_R006_partial_08_0228_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_08_0228
        rs_R006_ueqv_R006_generator_08_0200_0240 =
      rs_R006_ueqv_R006_partial_08_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 8. -/
def rs_R006_ueqv_R006_coefficient_08_0229 : Poly :=
[
  term ((48 : Rat) / 5) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 229 for generator 8. -/
def rs_R006_ueqv_R006_partial_08_0229 : Poly :=
[
  term ((96 : Rat) / 5) [(0, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((96 : Rat) / 5) [(1, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((-48 : Rat) / 5) [(6, 2), (11, 1), (13, 1), (16, 1)],
  term ((-48 : Rat) / 5) [(7, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 8. -/
theorem rs_R006_ueqv_R006_partial_08_0229_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_08_0229
        rs_R006_ueqv_R006_generator_08_0200_0240 =
      rs_R006_ueqv_R006_partial_08_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 8. -/
def rs_R006_ueqv_R006_coefficient_08_0230 : Poly :=
[
  term ((-108 : Rat) / 5) [(11, 1), (15, 1)]
]

/-- Partial product 230 for generator 8. -/
def rs_R006_ueqv_R006_partial_08_0230 : Poly :=
[
  term ((-216 : Rat) / 5) [(0, 1), (6, 1), (11, 1), (15, 1)],
  term ((-216 : Rat) / 5) [(1, 1), (7, 1), (11, 1), (15, 1)],
  term ((108 : Rat) / 5) [(6, 2), (11, 1), (15, 1)],
  term ((108 : Rat) / 5) [(7, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 8. -/
theorem rs_R006_ueqv_R006_partial_08_0230_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_08_0230
        rs_R006_ueqv_R006_generator_08_0200_0240 =
      rs_R006_ueqv_R006_partial_08_0230 := by
  native_decide

/-- Coefficient term 231 from coefficient polynomial 8. -/
def rs_R006_ueqv_R006_coefficient_08_0231 : Poly :=
[
  term ((48 : Rat) / 5) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 231 for generator 8. -/
def rs_R006_ueqv_R006_partial_08_0231 : Poly :=
[
  term ((96 : Rat) / 5) [(0, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((96 : Rat) / 5) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-48 : Rat) / 5) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-48 : Rat) / 5) [(7, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 231 for generator 8. -/
theorem rs_R006_ueqv_R006_partial_08_0231_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_08_0231
        rs_R006_ueqv_R006_generator_08_0200_0240 =
      rs_R006_ueqv_R006_partial_08_0231 := by
  native_decide

/-- Coefficient term 232 from coefficient polynomial 8. -/
def rs_R006_ueqv_R006_coefficient_08_0232 : Poly :=
[
  term ((-942 : Rat) / 5) [(11, 2)]
]

/-- Partial product 232 for generator 8. -/
def rs_R006_ueqv_R006_partial_08_0232 : Poly :=
[
  term ((-1884 : Rat) / 5) [(0, 1), (6, 1), (11, 2)],
  term ((-1884 : Rat) / 5) [(1, 1), (7, 1), (11, 2)],
  term ((942 : Rat) / 5) [(6, 2), (11, 2)],
  term ((942 : Rat) / 5) [(7, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 232 for generator 8. -/
theorem rs_R006_ueqv_R006_partial_08_0232_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_08_0232
        rs_R006_ueqv_R006_generator_08_0200_0240 =
      rs_R006_ueqv_R006_partial_08_0232 := by
  native_decide

/-- Coefficient term 233 from coefficient polynomial 8. -/
def rs_R006_ueqv_R006_coefficient_08_0233 : Poly :=
[
  term ((678 : Rat) / 5) [(11, 2), (14, 1)]
]

/-- Partial product 233 for generator 8. -/
def rs_R006_ueqv_R006_partial_08_0233 : Poly :=
[
  term ((1356 : Rat) / 5) [(0, 1), (6, 1), (11, 2), (14, 1)],
  term ((1356 : Rat) / 5) [(1, 1), (7, 1), (11, 2), (14, 1)],
  term ((-678 : Rat) / 5) [(6, 2), (11, 2), (14, 1)],
  term ((-678 : Rat) / 5) [(7, 2), (11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 233 for generator 8. -/
theorem rs_R006_ueqv_R006_partial_08_0233_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_08_0233
        rs_R006_ueqv_R006_generator_08_0200_0240 =
      rs_R006_ueqv_R006_partial_08_0233 := by
  native_decide

/-- Coefficient term 234 from coefficient polynomial 8. -/
def rs_R006_ueqv_R006_coefficient_08_0234 : Poly :=
[
  term ((-2 : Rat) / 5) [(11, 2), (16, 1)]
]

/-- Partial product 234 for generator 8. -/
def rs_R006_ueqv_R006_partial_08_0234 : Poly :=
[
  term ((-4 : Rat) / 5) [(0, 1), (6, 1), (11, 2), (16, 1)],
  term ((-4 : Rat) / 5) [(1, 1), (7, 1), (11, 2), (16, 1)],
  term ((2 : Rat) / 5) [(6, 2), (11, 2), (16, 1)],
  term ((2 : Rat) / 5) [(7, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 234 for generator 8. -/
theorem rs_R006_ueqv_R006_partial_08_0234_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_08_0234
        rs_R006_ueqv_R006_generator_08_0200_0240 =
      rs_R006_ueqv_R006_partial_08_0234 := by
  native_decide

/-- Coefficient term 235 from coefficient polynomial 8. -/
def rs_R006_ueqv_R006_coefficient_08_0235 : Poly :=
[
  term ((-16719 : Rat) / 25) [(13, 1), (15, 1)]
]

/-- Partial product 235 for generator 8. -/
def rs_R006_ueqv_R006_partial_08_0235 : Poly :=
[
  term ((-33438 : Rat) / 25) [(0, 1), (6, 1), (13, 1), (15, 1)],
  term ((-33438 : Rat) / 25) [(1, 1), (7, 1), (13, 1), (15, 1)],
  term ((16719 : Rat) / 25) [(6, 2), (13, 1), (15, 1)],
  term ((16719 : Rat) / 25) [(7, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 235 for generator 8. -/
theorem rs_R006_ueqv_R006_partial_08_0235_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_08_0235
        rs_R006_ueqv_R006_generator_08_0200_0240 =
      rs_R006_ueqv_R006_partial_08_0235 := by
  native_decide

/-- Coefficient term 236 from coefficient polynomial 8. -/
def rs_R006_ueqv_R006_coefficient_08_0236 : Poly :=
[
  term ((5538 : Rat) / 25) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 236 for generator 8. -/
def rs_R006_ueqv_R006_partial_08_0236 : Poly :=
[
  term ((11076 : Rat) / 25) [(0, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((11076 : Rat) / 25) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5538 : Rat) / 25) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-5538 : Rat) / 25) [(7, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 236 for generator 8. -/
theorem rs_R006_ueqv_R006_partial_08_0236_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_08_0236
        rs_R006_ueqv_R006_generator_08_0200_0240 =
      rs_R006_ueqv_R006_partial_08_0236 := by
  native_decide

/-- Coefficient term 237 from coefficient polynomial 8. -/
def rs_R006_ueqv_R006_coefficient_08_0237 : Poly :=
[
  term ((-11454 : Rat) / 35) [(13, 2)]
]

/-- Partial product 237 for generator 8. -/
def rs_R006_ueqv_R006_partial_08_0237 : Poly :=
[
  term ((-22908 : Rat) / 35) [(0, 1), (6, 1), (13, 2)],
  term ((-22908 : Rat) / 35) [(1, 1), (7, 1), (13, 2)],
  term ((11454 : Rat) / 35) [(6, 2), (13, 2)],
  term ((11454 : Rat) / 35) [(7, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 237 for generator 8. -/
theorem rs_R006_ueqv_R006_partial_08_0237_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_08_0237
        rs_R006_ueqv_R006_generator_08_0200_0240 =
      rs_R006_ueqv_R006_partial_08_0237 := by
  native_decide

/-- Coefficient term 238 from coefficient polynomial 8. -/
def rs_R006_ueqv_R006_coefficient_08_0238 : Poly :=
[
  term ((3312 : Rat) / 5) [(13, 2), (14, 1)]
]

/-- Partial product 238 for generator 8. -/
def rs_R006_ueqv_R006_partial_08_0238 : Poly :=
[
  term ((6624 : Rat) / 5) [(0, 1), (6, 1), (13, 2), (14, 1)],
  term ((6624 : Rat) / 5) [(1, 1), (7, 1), (13, 2), (14, 1)],
  term ((-3312 : Rat) / 5) [(6, 2), (13, 2), (14, 1)],
  term ((-3312 : Rat) / 5) [(7, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 238 for generator 8. -/
theorem rs_R006_ueqv_R006_partial_08_0238_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_08_0238
        rs_R006_ueqv_R006_generator_08_0200_0240 =
      rs_R006_ueqv_R006_partial_08_0238 := by
  native_decide

/-- Coefficient term 239 from coefficient polynomial 8. -/
def rs_R006_ueqv_R006_coefficient_08_0239 : Poly :=
[
  term ((-1104 : Rat) / 5) [(13, 2), (14, 1), (16, 1)]
]

/-- Partial product 239 for generator 8. -/
def rs_R006_ueqv_R006_partial_08_0239 : Poly :=
[
  term ((-2208 : Rat) / 5) [(0, 1), (6, 1), (13, 2), (14, 1), (16, 1)],
  term ((-2208 : Rat) / 5) [(1, 1), (7, 1), (13, 2), (14, 1), (16, 1)],
  term ((1104 : Rat) / 5) [(6, 2), (13, 2), (14, 1), (16, 1)],
  term ((1104 : Rat) / 5) [(7, 2), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 239 for generator 8. -/
theorem rs_R006_ueqv_R006_partial_08_0239_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_08_0239
        rs_R006_ueqv_R006_generator_08_0200_0240 =
      rs_R006_ueqv_R006_partial_08_0239 := by
  native_decide

/-- Coefficient term 240 from coefficient polynomial 8. -/
def rs_R006_ueqv_R006_coefficient_08_0240 : Poly :=
[
  term ((552 : Rat) / 5) [(13, 2), (16, 1)]
]

/-- Partial product 240 for generator 8. -/
def rs_R006_ueqv_R006_partial_08_0240 : Poly :=
[
  term ((1104 : Rat) / 5) [(0, 1), (6, 1), (13, 2), (16, 1)],
  term ((1104 : Rat) / 5) [(1, 1), (7, 1), (13, 2), (16, 1)],
  term ((-552 : Rat) / 5) [(6, 2), (13, 2), (16, 1)],
  term ((-552 : Rat) / 5) [(7, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 240 for generator 8. -/
theorem rs_R006_ueqv_R006_partial_08_0240_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_08_0240
        rs_R006_ueqv_R006_generator_08_0200_0240 =
      rs_R006_ueqv_R006_partial_08_0240 := by
  native_decide

/-- Partial products in this block. -/
def rs_R006_ueqv_R006_partials_08_0200_0240 : List Poly :=
[
  rs_R006_ueqv_R006_partial_08_0200,
  rs_R006_ueqv_R006_partial_08_0201,
  rs_R006_ueqv_R006_partial_08_0202,
  rs_R006_ueqv_R006_partial_08_0203,
  rs_R006_ueqv_R006_partial_08_0204,
  rs_R006_ueqv_R006_partial_08_0205,
  rs_R006_ueqv_R006_partial_08_0206,
  rs_R006_ueqv_R006_partial_08_0207,
  rs_R006_ueqv_R006_partial_08_0208,
  rs_R006_ueqv_R006_partial_08_0209,
  rs_R006_ueqv_R006_partial_08_0210,
  rs_R006_ueqv_R006_partial_08_0211,
  rs_R006_ueqv_R006_partial_08_0212,
  rs_R006_ueqv_R006_partial_08_0213,
  rs_R006_ueqv_R006_partial_08_0214,
  rs_R006_ueqv_R006_partial_08_0215,
  rs_R006_ueqv_R006_partial_08_0216,
  rs_R006_ueqv_R006_partial_08_0217,
  rs_R006_ueqv_R006_partial_08_0218,
  rs_R006_ueqv_R006_partial_08_0219,
  rs_R006_ueqv_R006_partial_08_0220,
  rs_R006_ueqv_R006_partial_08_0221,
  rs_R006_ueqv_R006_partial_08_0222,
  rs_R006_ueqv_R006_partial_08_0223,
  rs_R006_ueqv_R006_partial_08_0224,
  rs_R006_ueqv_R006_partial_08_0225,
  rs_R006_ueqv_R006_partial_08_0226,
  rs_R006_ueqv_R006_partial_08_0227,
  rs_R006_ueqv_R006_partial_08_0228,
  rs_R006_ueqv_R006_partial_08_0229,
  rs_R006_ueqv_R006_partial_08_0230,
  rs_R006_ueqv_R006_partial_08_0231,
  rs_R006_ueqv_R006_partial_08_0232,
  rs_R006_ueqv_R006_partial_08_0233,
  rs_R006_ueqv_R006_partial_08_0234,
  rs_R006_ueqv_R006_partial_08_0235,
  rs_R006_ueqv_R006_partial_08_0236,
  rs_R006_ueqv_R006_partial_08_0237,
  rs_R006_ueqv_R006_partial_08_0238,
  rs_R006_ueqv_R006_partial_08_0239,
  rs_R006_ueqv_R006_partial_08_0240
]

/-- Sum of partial products in this block. -/
def rs_R006_ueqv_R006_block_08_0200_0240 : Poly :=
[
  term ((-6912 : Rat) / 5) [(0, 1), (6, 1), (9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((3456 : Rat) / 5) [(0, 1), (6, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((6288 : Rat) / 5) [(0, 1), (6, 1), (9, 1), (11, 2), (13, 1)],
  term ((-13248 : Rat) / 5) [(0, 1), (6, 1), (9, 1), (11, 2), (13, 1), (14, 1)],
  term ((4416 : Rat) / 5) [(0, 1), (6, 1), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-2208 : Rat) / 5) [(0, 1), (6, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((13248 : Rat) / 5) [(0, 1), (6, 1), (9, 1), (11, 2), (15, 1)],
  term ((-4416 : Rat) / 5) [(0, 1), (6, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((1992 : Rat) / 7) [(0, 1), (6, 1), (9, 1), (13, 1)],
  term (-576 : Rat) [(0, 1), (6, 1), (9, 1), (13, 1), (14, 1)],
  term (192 : Rat) [(0, 1), (6, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term (-96 : Rat) [(0, 1), (6, 1), (9, 1), (13, 1), (16, 1)],
  term (576 : Rat) [(0, 1), (6, 1), (9, 1), (15, 1)],
  term (-192 : Rat) [(0, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-2304 : Rat) / 7) [(0, 1), (6, 1), (9, 2), (11, 1), (13, 1)],
  term ((3456 : Rat) / 5) [(0, 1), (6, 1), (9, 2), (11, 1), (13, 1), (14, 1)],
  term ((-1152 : Rat) / 5) [(0, 1), (6, 1), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((576 : Rat) / 5) [(0, 1), (6, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-3456 : Rat) / 5) [(0, 1), (6, 1), (9, 2), (11, 1), (15, 1)],
  term ((1152 : Rat) / 5) [(0, 1), (6, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((5976 : Rat) / 35) [(0, 1), (6, 1), (11, 1), (12, 1), (13, 1)],
  term ((-1728 : Rat) / 5) [(0, 1), (6, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((576 : Rat) / 5) [(0, 1), (6, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(0, 1), (6, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term (348 : Rat) [(0, 1), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((-552 : Rat) / 5) [(0, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((14016 : Rat) / 35) [(0, 1), (6, 1), (11, 1), (13, 1)],
  term ((-1296 : Rat) / 5) [(0, 1), (6, 1), (11, 1), (13, 1), (14, 1)],
  term ((-192 : Rat) / 5) [(0, 1), (6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((96 : Rat) / 5) [(0, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-216 : Rat) / 5) [(0, 1), (6, 1), (11, 1), (15, 1)],
  term ((96 : Rat) / 5) [(0, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1884 : Rat) / 5) [(0, 1), (6, 1), (11, 2)],
  term ((1356 : Rat) / 5) [(0, 1), (6, 1), (11, 2), (14, 1)],
  term ((-4 : Rat) / 5) [(0, 1), (6, 1), (11, 2), (16, 1)],
  term ((-33438 : Rat) / 25) [(0, 1), (6, 1), (13, 1), (15, 1)],
  term ((11076 : Rat) / 25) [(0, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-22908 : Rat) / 35) [(0, 1), (6, 1), (13, 2)],
  term ((6624 : Rat) / 5) [(0, 1), (6, 1), (13, 2), (14, 1)],
  term ((-2208 : Rat) / 5) [(0, 1), (6, 1), (13, 2), (14, 1), (16, 1)],
  term ((1104 : Rat) / 5) [(0, 1), (6, 1), (13, 2), (16, 1)],
  term ((-6912 : Rat) / 5) [(1, 1), (7, 1), (9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((3456 : Rat) / 5) [(1, 1), (7, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((6288 : Rat) / 5) [(1, 1), (7, 1), (9, 1), (11, 2), (13, 1)],
  term ((-13248 : Rat) / 5) [(1, 1), (7, 1), (9, 1), (11, 2), (13, 1), (14, 1)],
  term ((4416 : Rat) / 5) [(1, 1), (7, 1), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-2208 : Rat) / 5) [(1, 1), (7, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((13248 : Rat) / 5) [(1, 1), (7, 1), (9, 1), (11, 2), (15, 1)],
  term ((-4416 : Rat) / 5) [(1, 1), (7, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((1992 : Rat) / 7) [(1, 1), (7, 1), (9, 1), (13, 1)],
  term (-576 : Rat) [(1, 1), (7, 1), (9, 1), (13, 1), (14, 1)],
  term (192 : Rat) [(1, 1), (7, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term (-96 : Rat) [(1, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term (576 : Rat) [(1, 1), (7, 1), (9, 1), (15, 1)],
  term (-192 : Rat) [(1, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-2304 : Rat) / 7) [(1, 1), (7, 1), (9, 2), (11, 1), (13, 1)],
  term ((3456 : Rat) / 5) [(1, 1), (7, 1), (9, 2), (11, 1), (13, 1), (14, 1)],
  term ((-1152 : Rat) / 5) [(1, 1), (7, 1), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((576 : Rat) / 5) [(1, 1), (7, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-3456 : Rat) / 5) [(1, 1), (7, 1), (9, 2), (11, 1), (15, 1)],
  term ((1152 : Rat) / 5) [(1, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((5976 : Rat) / 35) [(1, 1), (7, 1), (11, 1), (12, 1), (13, 1)],
  term ((-1728 : Rat) / 5) [(1, 1), (7, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((576 : Rat) / 5) [(1, 1), (7, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(1, 1), (7, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term (348 : Rat) [(1, 1), (7, 1), (11, 1), (12, 1), (15, 1)],
  term ((-552 : Rat) / 5) [(1, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((14016 : Rat) / 35) [(1, 1), (7, 1), (11, 1), (13, 1)],
  term ((-1296 : Rat) / 5) [(1, 1), (7, 1), (11, 1), (13, 1), (14, 1)],
  term ((-192 : Rat) / 5) [(1, 1), (7, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((96 : Rat) / 5) [(1, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((-216 : Rat) / 5) [(1, 1), (7, 1), (11, 1), (15, 1)],
  term ((96 : Rat) / 5) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1884 : Rat) / 5) [(1, 1), (7, 1), (11, 2)],
  term ((1356 : Rat) / 5) [(1, 1), (7, 1), (11, 2), (14, 1)],
  term ((-4 : Rat) / 5) [(1, 1), (7, 1), (11, 2), (16, 1)],
  term ((-33438 : Rat) / 25) [(1, 1), (7, 1), (13, 1), (15, 1)],
  term ((11076 : Rat) / 25) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-22908 : Rat) / 35) [(1, 1), (7, 1), (13, 2)],
  term ((6624 : Rat) / 5) [(1, 1), (7, 1), (13, 2), (14, 1)],
  term ((-2208 : Rat) / 5) [(1, 1), (7, 1), (13, 2), (14, 1), (16, 1)],
  term ((1104 : Rat) / 5) [(1, 1), (7, 1), (13, 2), (16, 1)],
  term ((3456 : Rat) / 5) [(6, 2), (9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-1728 : Rat) / 5) [(6, 2), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-3144 : Rat) / 5) [(6, 2), (9, 1), (11, 2), (13, 1)],
  term ((6624 : Rat) / 5) [(6, 2), (9, 1), (11, 2), (13, 1), (14, 1)],
  term ((-2208 : Rat) / 5) [(6, 2), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((1104 : Rat) / 5) [(6, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-6624 : Rat) / 5) [(6, 2), (9, 1), (11, 2), (15, 1)],
  term ((2208 : Rat) / 5) [(6, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-996 : Rat) / 7) [(6, 2), (9, 1), (13, 1)],
  term (288 : Rat) [(6, 2), (9, 1), (13, 1), (14, 1)],
  term (-96 : Rat) [(6, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term (48 : Rat) [(6, 2), (9, 1), (13, 1), (16, 1)],
  term (-288 : Rat) [(6, 2), (9, 1), (15, 1)],
  term (96 : Rat) [(6, 2), (9, 1), (15, 1), (16, 1)],
  term ((1152 : Rat) / 7) [(6, 2), (9, 2), (11, 1), (13, 1)],
  term ((-1728 : Rat) / 5) [(6, 2), (9, 2), (11, 1), (13, 1), (14, 1)],
  term ((576 : Rat) / 5) [(6, 2), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(6, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((1728 : Rat) / 5) [(6, 2), (9, 2), (11, 1), (15, 1)],
  term ((-576 : Rat) / 5) [(6, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-2988 : Rat) / 35) [(6, 2), (11, 1), (12, 1), (13, 1)],
  term ((864 : Rat) / 5) [(6, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-288 : Rat) / 5) [(6, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((144 : Rat) / 5) [(6, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term (-174 : Rat) [(6, 2), (11, 1), (12, 1), (15, 1)],
  term ((276 : Rat) / 5) [(6, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-7008 : Rat) / 35) [(6, 2), (11, 1), (13, 1)],
  term ((648 : Rat) / 5) [(6, 2), (11, 1), (13, 1), (14, 1)],
  term ((96 : Rat) / 5) [(6, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-48 : Rat) / 5) [(6, 2), (11, 1), (13, 1), (16, 1)],
  term ((108 : Rat) / 5) [(6, 2), (11, 1), (15, 1)],
  term ((-48 : Rat) / 5) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term ((942 : Rat) / 5) [(6, 2), (11, 2)],
  term ((-678 : Rat) / 5) [(6, 2), (11, 2), (14, 1)],
  term ((2 : Rat) / 5) [(6, 2), (11, 2), (16, 1)],
  term ((16719 : Rat) / 25) [(6, 2), (13, 1), (15, 1)],
  term ((-5538 : Rat) / 25) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((11454 : Rat) / 35) [(6, 2), (13, 2)],
  term ((-3312 : Rat) / 5) [(6, 2), (13, 2), (14, 1)],
  term ((1104 : Rat) / 5) [(6, 2), (13, 2), (14, 1), (16, 1)],
  term ((-552 : Rat) / 5) [(6, 2), (13, 2), (16, 1)],
  term ((3456 : Rat) / 5) [(7, 2), (9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-1728 : Rat) / 5) [(7, 2), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-3144 : Rat) / 5) [(7, 2), (9, 1), (11, 2), (13, 1)],
  term ((6624 : Rat) / 5) [(7, 2), (9, 1), (11, 2), (13, 1), (14, 1)],
  term ((-2208 : Rat) / 5) [(7, 2), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((1104 : Rat) / 5) [(7, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-6624 : Rat) / 5) [(7, 2), (9, 1), (11, 2), (15, 1)],
  term ((2208 : Rat) / 5) [(7, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-996 : Rat) / 7) [(7, 2), (9, 1), (13, 1)],
  term (288 : Rat) [(7, 2), (9, 1), (13, 1), (14, 1)],
  term (-96 : Rat) [(7, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term (48 : Rat) [(7, 2), (9, 1), (13, 1), (16, 1)],
  term (-288 : Rat) [(7, 2), (9, 1), (15, 1)],
  term (96 : Rat) [(7, 2), (9, 1), (15, 1), (16, 1)],
  term ((1152 : Rat) / 7) [(7, 2), (9, 2), (11, 1), (13, 1)],
  term ((-1728 : Rat) / 5) [(7, 2), (9, 2), (11, 1), (13, 1), (14, 1)],
  term ((576 : Rat) / 5) [(7, 2), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(7, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((1728 : Rat) / 5) [(7, 2), (9, 2), (11, 1), (15, 1)],
  term ((-576 : Rat) / 5) [(7, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-2988 : Rat) / 35) [(7, 2), (11, 1), (12, 1), (13, 1)],
  term ((864 : Rat) / 5) [(7, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-288 : Rat) / 5) [(7, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((144 : Rat) / 5) [(7, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term (-174 : Rat) [(7, 2), (11, 1), (12, 1), (15, 1)],
  term ((276 : Rat) / 5) [(7, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-7008 : Rat) / 35) [(7, 2), (11, 1), (13, 1)],
  term ((648 : Rat) / 5) [(7, 2), (11, 1), (13, 1), (14, 1)],
  term ((96 : Rat) / 5) [(7, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-48 : Rat) / 5) [(7, 2), (11, 1), (13, 1), (16, 1)],
  term ((108 : Rat) / 5) [(7, 2), (11, 1), (15, 1)],
  term ((-48 : Rat) / 5) [(7, 2), (11, 1), (15, 1), (16, 1)],
  term ((942 : Rat) / 5) [(7, 2), (11, 2)],
  term ((-678 : Rat) / 5) [(7, 2), (11, 2), (14, 1)],
  term ((2 : Rat) / 5) [(7, 2), (11, 2), (16, 1)],
  term ((16719 : Rat) / 25) [(7, 2), (13, 1), (15, 1)],
  term ((-5538 : Rat) / 25) [(7, 2), (13, 1), (15, 1), (16, 1)],
  term ((11454 : Rat) / 35) [(7, 2), (13, 2)],
  term ((-3312 : Rat) / 5) [(7, 2), (13, 2), (14, 1)],
  term ((1104 : Rat) / 5) [(7, 2), (13, 2), (14, 1), (16, 1)],
  term ((-552 : Rat) / 5) [(7, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 8, terms 200 through 240. -/
theorem rs_R006_ueqv_R006_block_08_0200_0240_valid :
    checkProductSumEq rs_R006_ueqv_R006_partials_08_0200_0240
      rs_R006_ueqv_R006_block_08_0200_0240 = true := by
  native_decide

end R006UeqvR006TermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
