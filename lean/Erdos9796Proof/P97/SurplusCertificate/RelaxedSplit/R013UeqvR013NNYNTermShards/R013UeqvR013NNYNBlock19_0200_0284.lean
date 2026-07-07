/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R013:u=v:R013NNYN, term block 19:200-284

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R013UeqvR013NNYNTermShards

/-- Generator polynomial 19 for relaxed split surplus certificate `R013:u=v:R013NNYN`. -/
def rs_R013_ueqv_R013NNYN_generator_19_0200_0284 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(8, 1)]
]

/-- Coefficient term 200 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013NNYN_coefficient_19_0200 : Poly :=
[
  term ((5424 : Rat) / 103) [(5, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 200 for generator 19. -/
def rs_R013_ueqv_R013NNYN_partial_19_0200 : Poly :=
[
  term ((10848 : Rat) / 103) [(5, 1), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-5424 : Rat) / 103) [(5, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 19. -/
theorem rs_R013_ueqv_R013NNYN_partial_19_0200_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_19_0200
        rs_R013_ueqv_R013NNYN_generator_19_0200_0284 =
      rs_R013_ueqv_R013NNYN_partial_19_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013NNYN_coefficient_19_0201 : Poly :=
[
  term ((1392 : Rat) / 103) [(5, 1), (7, 1), (12, 1), (16, 1)]
]

/-- Partial product 201 for generator 19. -/
def rs_R013_ueqv_R013NNYN_partial_19_0201 : Poly :=
[
  term ((2784 : Rat) / 103) [(5, 1), (7, 1), (8, 1), (12, 1), (16, 1)],
  term ((-1392 : Rat) / 103) [(5, 1), (7, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 19. -/
theorem rs_R013_ueqv_R013NNYN_partial_19_0201_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_19_0201
        rs_R013_ueqv_R013NNYN_generator_19_0200_0284 =
      rs_R013_ueqv_R013NNYN_partial_19_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013NNYN_coefficient_19_0202 : Poly :=
[
  term ((4872 : Rat) / 103) [(5, 1), (7, 1), (16, 1)]
]

/-- Partial product 202 for generator 19. -/
def rs_R013_ueqv_R013NNYN_partial_19_0202 : Poly :=
[
  term ((9744 : Rat) / 103) [(5, 1), (7, 1), (8, 1), (16, 1)],
  term ((-4872 : Rat) / 103) [(5, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 19. -/
theorem rs_R013_ueqv_R013NNYN_partial_19_0202_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_19_0202
        rs_R013_ueqv_R013NNYN_generator_19_0200_0284 =
      rs_R013_ueqv_R013NNYN_partial_19_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013NNYN_coefficient_19_0203 : Poly :=
[
  term ((-1896 : Rat) / 103) [(5, 1), (8, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 203 for generator 19. -/
def rs_R013_ueqv_R013NNYN_partial_19_0203 : Poly :=
[
  term ((1896 : Rat) / 103) [(5, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3792 : Rat) / 103) [(5, 1), (8, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 19. -/
theorem rs_R013_ueqv_R013NNYN_partial_19_0203_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_19_0203
        rs_R013_ueqv_R013NNYN_generator_19_0200_0284 =
      rs_R013_ueqv_R013NNYN_partial_19_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013NNYN_coefficient_19_0204 : Poly :=
[
  term ((-1452 : Rat) / 103) [(5, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 204 for generator 19. -/
def rs_R013_ueqv_R013NNYN_partial_19_0204 : Poly :=
[
  term ((1452 : Rat) / 103) [(5, 1), (8, 1), (13, 1), (16, 1)],
  term ((-2904 : Rat) / 103) [(5, 1), (8, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 19. -/
theorem rs_R013_ueqv_R013NNYN_partial_19_0204_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_19_0204
        rs_R013_ueqv_R013NNYN_generator_19_0200_0284 =
      rs_R013_ueqv_R013NNYN_partial_19_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013NNYN_coefficient_19_0205 : Poly :=
[
  term ((2712 : Rat) / 103) [(5, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 205 for generator 19. -/
def rs_R013_ueqv_R013NNYN_partial_19_0205 : Poly :=
[
  term ((-2712 : Rat) / 103) [(5, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((5424 : Rat) / 103) [(5, 1), (8, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 19. -/
theorem rs_R013_ueqv_R013NNYN_partial_19_0205_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_19_0205
        rs_R013_ueqv_R013NNYN_generator_19_0200_0284 =
      rs_R013_ueqv_R013NNYN_partial_19_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013NNYN_coefficient_19_0206 : Poly :=
[
  term ((4068 : Rat) / 103) [(5, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 206 for generator 19. -/
def rs_R013_ueqv_R013NNYN_partial_19_0206 : Poly :=
[
  term ((-4068 : Rat) / 103) [(5, 1), (8, 1), (15, 1), (16, 1)],
  term ((8136 : Rat) / 103) [(5, 1), (8, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 19. -/
theorem rs_R013_ueqv_R013NNYN_partial_19_0206_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_19_0206
        rs_R013_ueqv_R013NNYN_generator_19_0200_0284 =
      rs_R013_ueqv_R013NNYN_partial_19_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013NNYN_coefficient_19_0207 : Poly :=
[
  term ((-1392 : Rat) / 103) [(5, 1), (9, 1), (12, 1), (16, 1)]
]

/-- Partial product 207 for generator 19. -/
def rs_R013_ueqv_R013NNYN_partial_19_0207 : Poly :=
[
  term ((-2784 : Rat) / 103) [(5, 1), (8, 1), (9, 1), (12, 1), (16, 1)],
  term ((1392 : Rat) / 103) [(5, 1), (9, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 19. -/
theorem rs_R013_ueqv_R013NNYN_partial_19_0207_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_19_0207
        rs_R013_ueqv_R013NNYN_generator_19_0200_0284 =
      rs_R013_ueqv_R013NNYN_partial_19_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013NNYN_coefficient_19_0208 : Poly :=
[
  term ((-3792 : Rat) / 103) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 208 for generator 19. -/
def rs_R013_ueqv_R013NNYN_partial_19_0208 : Poly :=
[
  term ((-7584 : Rat) / 103) [(5, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((3792 : Rat) / 103) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 19. -/
theorem rs_R013_ueqv_R013NNYN_partial_19_0208_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_19_0208
        rs_R013_ueqv_R013NNYN_generator_19_0200_0284 =
      rs_R013_ueqv_R013NNYN_partial_19_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013NNYN_coefficient_19_0209 : Poly :=
[
  term ((5424 : Rat) / 103) [(5, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 209 for generator 19. -/
def rs_R013_ueqv_R013NNYN_partial_19_0209 : Poly :=
[
  term ((10848 : Rat) / 103) [(5, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-5424 : Rat) / 103) [(5, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 19. -/
theorem rs_R013_ueqv_R013NNYN_partial_19_0209_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_19_0209
        rs_R013_ueqv_R013NNYN_generator_19_0200_0284 =
      rs_R013_ueqv_R013NNYN_partial_19_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013NNYN_coefficient_19_0210 : Poly :=
[
  term ((2784 : Rat) / 103) [(5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 210 for generator 19. -/
def rs_R013_ueqv_R013NNYN_partial_19_0210 : Poly :=
[
  term ((5568 : Rat) / 103) [(5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2784 : Rat) / 103) [(5, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 19. -/
theorem rs_R013_ueqv_R013NNYN_partial_19_0210_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_19_0210
        rs_R013_ueqv_R013NNYN_generator_19_0200_0284 =
      rs_R013_ueqv_R013NNYN_partial_19_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013NNYN_coefficient_19_0211 : Poly :=
[
  term ((6636 : Rat) / 103) [(5, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 211 for generator 19. -/
def rs_R013_ueqv_R013NNYN_partial_19_0211 : Poly :=
[
  term ((13272 : Rat) / 103) [(5, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-6636 : Rat) / 103) [(5, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 19. -/
theorem rs_R013_ueqv_R013NNYN_partial_19_0211_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_19_0211
        rs_R013_ueqv_R013NNYN_generator_19_0200_0284 =
      rs_R013_ueqv_R013NNYN_partial_19_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013NNYN_coefficient_19_0212 : Poly :=
[
  term ((702 : Rat) / 103) [(5, 1), (13, 1), (16, 1)]
]

/-- Partial product 212 for generator 19. -/
def rs_R013_ueqv_R013NNYN_partial_19_0212 : Poly :=
[
  term ((1404 : Rat) / 103) [(5, 1), (8, 1), (13, 1), (16, 1)],
  term ((-702 : Rat) / 103) [(5, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 19. -/
theorem rs_R013_ueqv_R013NNYN_partial_19_0212_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_19_0212
        rs_R013_ueqv_R013NNYN_generator_19_0200_0284 =
      rs_R013_ueqv_R013NNYN_partial_19_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013NNYN_coefficient_19_0213 : Poly :=
[
  term ((-9492 : Rat) / 103) [(5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 213 for generator 19. -/
def rs_R013_ueqv_R013NNYN_partial_19_0213 : Poly :=
[
  term ((-18984 : Rat) / 103) [(5, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((9492 : Rat) / 103) [(5, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 19. -/
theorem rs_R013_ueqv_R013NNYN_partial_19_0213_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_19_0213
        rs_R013_ueqv_R013NNYN_generator_19_0200_0284 =
      rs_R013_ueqv_R013NNYN_partial_19_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013NNYN_coefficient_19_0214 : Poly :=
[
  term ((-2634 : Rat) / 103) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 214 for generator 19. -/
def rs_R013_ueqv_R013NNYN_partial_19_0214 : Poly :=
[
  term ((-5268 : Rat) / 103) [(5, 1), (8, 1), (15, 1), (16, 1)],
  term ((2634 : Rat) / 103) [(5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 19. -/
theorem rs_R013_ueqv_R013NNYN_partial_19_0214_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_19_0214
        rs_R013_ueqv_R013NNYN_generator_19_0200_0284 =
      rs_R013_ueqv_R013NNYN_partial_19_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013NNYN_coefficient_19_0215 : Poly :=
[
  term ((-11376 : Rat) / 103) [(5, 2), (6, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 215 for generator 19. -/
def rs_R013_ueqv_R013NNYN_partial_19_0215 : Poly :=
[
  term ((-22752 : Rat) / 103) [(5, 2), (6, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((11376 : Rat) / 103) [(5, 2), (6, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 19. -/
theorem rs_R013_ueqv_R013NNYN_partial_19_0215_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_19_0215
        rs_R013_ueqv_R013NNYN_generator_19_0200_0284 =
      rs_R013_ueqv_R013NNYN_partial_19_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013NNYN_coefficient_19_0216 : Poly :=
[
  term ((16272 : Rat) / 103) [(5, 2), (6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 216 for generator 19. -/
def rs_R013_ueqv_R013NNYN_partial_19_0216 : Poly :=
[
  term ((32544 : Rat) / 103) [(5, 2), (6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-16272 : Rat) / 103) [(5, 2), (6, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 19. -/
theorem rs_R013_ueqv_R013NNYN_partial_19_0216_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_19_0216
        rs_R013_ueqv_R013NNYN_generator_19_0200_0284 =
      rs_R013_ueqv_R013NNYN_partial_19_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013NNYN_coefficient_19_0217 : Poly :=
[
  term ((11376 : Rat) / 103) [(5, 2), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 217 for generator 19. -/
def rs_R013_ueqv_R013NNYN_partial_19_0217 : Poly :=
[
  term ((22752 : Rat) / 103) [(5, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-11376 : Rat) / 103) [(5, 2), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 19. -/
theorem rs_R013_ueqv_R013NNYN_partial_19_0217_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_19_0217
        rs_R013_ueqv_R013NNYN_generator_19_0200_0284 =
      rs_R013_ueqv_R013NNYN_partial_19_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013NNYN_coefficient_19_0218 : Poly :=
[
  term ((-16272 : Rat) / 103) [(5, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 218 for generator 19. -/
def rs_R013_ueqv_R013NNYN_partial_19_0218 : Poly :=
[
  term ((-32544 : Rat) / 103) [(5, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((16272 : Rat) / 103) [(5, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 19. -/
theorem rs_R013_ueqv_R013NNYN_partial_19_0218_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_19_0218
        rs_R013_ueqv_R013NNYN_generator_19_0200_0284 =
      rs_R013_ueqv_R013NNYN_partial_19_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013NNYN_coefficient_19_0219 : Poly :=
[
  term ((672 : Rat) / 103) [(6, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 219 for generator 19. -/
def rs_R013_ueqv_R013NNYN_partial_19_0219 : Poly :=
[
  term ((1344 : Rat) / 103) [(6, 1), (7, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-672 : Rat) / 103) [(6, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 19. -/
theorem rs_R013_ueqv_R013NNYN_partial_19_0219_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_19_0219
        rs_R013_ueqv_R013NNYN_generator_19_0200_0284 =
      rs_R013_ueqv_R013NNYN_partial_19_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013NNYN_coefficient_19_0220 : Poly :=
[
  term ((736 : Rat) / 103) [(6, 1), (7, 1), (9, 1), (16, 1)]
]

/-- Partial product 220 for generator 19. -/
def rs_R013_ueqv_R013NNYN_partial_19_0220 : Poly :=
[
  term ((1472 : Rat) / 103) [(6, 1), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((-736 : Rat) / 103) [(6, 1), (7, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 19. -/
theorem rs_R013_ueqv_R013NNYN_partial_19_0220_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_19_0220
        rs_R013_ueqv_R013NNYN_generator_19_0200_0284 =
      rs_R013_ueqv_R013NNYN_partial_19_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013NNYN_coefficient_19_0221 : Poly :=
[
  term ((-656 : Rat) / 103) [(6, 1), (7, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 221 for generator 19. -/
def rs_R013_ueqv_R013NNYN_partial_19_0221 : Poly :=
[
  term ((-1312 : Rat) / 103) [(6, 1), (7, 1), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((656 : Rat) / 103) [(6, 1), (7, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 19. -/
theorem rs_R013_ueqv_R013NNYN_partial_19_0221_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_19_0221
        rs_R013_ueqv_R013NNYN_generator_19_0200_0284 =
      rs_R013_ueqv_R013NNYN_partial_19_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013NNYN_coefficient_19_0222 : Poly :=
[
  term ((1912 : Rat) / 103) [(6, 1), (7, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 222 for generator 19. -/
def rs_R013_ueqv_R013NNYN_partial_19_0222 : Poly :=
[
  term ((3824 : Rat) / 103) [(6, 1), (7, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1912 : Rat) / 103) [(6, 1), (7, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 19. -/
theorem rs_R013_ueqv_R013NNYN_partial_19_0222_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_19_0222
        rs_R013_ueqv_R013NNYN_generator_19_0200_0284 =
      rs_R013_ueqv_R013NNYN_partial_19_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013NNYN_coefficient_19_0223 : Poly :=
[
  term ((1280 : Rat) / 103) [(6, 1), (7, 1), (13, 1), (16, 1)]
]

/-- Partial product 223 for generator 19. -/
def rs_R013_ueqv_R013NNYN_partial_19_0223 : Poly :=
[
  term ((2560 : Rat) / 103) [(6, 1), (7, 1), (8, 1), (13, 1), (16, 1)],
  term ((-1280 : Rat) / 103) [(6, 1), (7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 19. -/
theorem rs_R013_ueqv_R013NNYN_partial_19_0223_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_19_0223
        rs_R013_ueqv_R013NNYN_generator_19_0200_0284 =
      rs_R013_ueqv_R013NNYN_partial_19_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013NNYN_coefficient_19_0224 : Poly :=
[
  term ((-768 : Rat) / 103) [(6, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 224 for generator 19. -/
def rs_R013_ueqv_R013NNYN_partial_19_0224 : Poly :=
[
  term ((-1536 : Rat) / 103) [(6, 1), (7, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((768 : Rat) / 103) [(6, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 19. -/
theorem rs_R013_ueqv_R013NNYN_partial_19_0224_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_19_0224
        rs_R013_ueqv_R013NNYN_generator_19_0200_0284 =
      rs_R013_ueqv_R013NNYN_partial_19_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013NNYN_coefficient_19_0225 : Poly :=
[
  term ((-2712 : Rat) / 103) [(6, 1), (7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 225 for generator 19. -/
def rs_R013_ueqv_R013NNYN_partial_19_0225 : Poly :=
[
  term ((-5424 : Rat) / 103) [(6, 1), (7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((2712 : Rat) / 103) [(6, 1), (7, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 19. -/
theorem rs_R013_ueqv_R013NNYN_partial_19_0225_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_19_0225
        rs_R013_ueqv_R013NNYN_generator_19_0200_0284 =
      rs_R013_ueqv_R013NNYN_partial_19_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013NNYN_coefficient_19_0226 : Poly :=
[
  term ((80 : Rat) / 103) [(6, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 226 for generator 19. -/
def rs_R013_ueqv_R013NNYN_partial_19_0226 : Poly :=
[
  term ((160 : Rat) / 103) [(6, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-80 : Rat) / 103) [(6, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 19. -/
theorem rs_R013_ueqv_R013NNYN_partial_19_0226_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_19_0226
        rs_R013_ueqv_R013NNYN_generator_19_0200_0284 =
      rs_R013_ueqv_R013NNYN_partial_19_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013NNYN_coefficient_19_0227 : Poly :=
[
  term ((-864 : Rat) / 103) [(6, 1), (9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 227 for generator 19. -/
def rs_R013_ueqv_R013NNYN_partial_19_0227 : Poly :=
[
  term ((-1728 : Rat) / 103) [(6, 1), (8, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((864 : Rat) / 103) [(6, 1), (9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 19. -/
theorem rs_R013_ueqv_R013NNYN_partial_19_0227_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_19_0227
        rs_R013_ueqv_R013NNYN_generator_19_0200_0284 =
      rs_R013_ueqv_R013NNYN_partial_19_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013NNYN_coefficient_19_0228 : Poly :=
[
  term ((808 : Rat) / 103) [(6, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 228 for generator 19. -/
def rs_R013_ueqv_R013NNYN_partial_19_0228 : Poly :=
[
  term ((1616 : Rat) / 103) [(6, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-808 : Rat) / 103) [(6, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 19. -/
theorem rs_R013_ueqv_R013NNYN_partial_19_0228_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_19_0228
        rs_R013_ueqv_R013NNYN_generator_19_0200_0284 =
      rs_R013_ueqv_R013NNYN_partial_19_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013NNYN_coefficient_19_0229 : Poly :=
[
  term ((-1576 : Rat) / 103) [(6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 229 for generator 19. -/
def rs_R013_ueqv_R013NNYN_partial_19_0229 : Poly :=
[
  term ((-3152 : Rat) / 103) [(6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((1576 : Rat) / 103) [(6, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 19. -/
theorem rs_R013_ueqv_R013NNYN_partial_19_0229_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_19_0229
        rs_R013_ueqv_R013NNYN_generator_19_0200_0284 =
      rs_R013_ueqv_R013NNYN_partial_19_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013NNYN_coefficient_19_0230 : Poly :=
[
  term ((1120 : Rat) / 103) [(6, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 230 for generator 19. -/
def rs_R013_ueqv_R013NNYN_partial_19_0230 : Poly :=
[
  term ((2240 : Rat) / 103) [(6, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1120 : Rat) / 103) [(6, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 19. -/
theorem rs_R013_ueqv_R013NNYN_partial_19_0230_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_19_0230
        rs_R013_ueqv_R013NNYN_generator_19_0200_0284 =
      rs_R013_ueqv_R013NNYN_partial_19_0230 := by
  native_decide

/-- Coefficient term 231 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013NNYN_coefficient_19_0231 : Poly :=
[
  term ((-432 : Rat) / 103) [(6, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 231 for generator 19. -/
def rs_R013_ueqv_R013NNYN_partial_19_0231 : Poly :=
[
  term ((-864 : Rat) / 103) [(6, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((432 : Rat) / 103) [(6, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 231 for generator 19. -/
theorem rs_R013_ueqv_R013NNYN_partial_19_0231_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_19_0231
        rs_R013_ueqv_R013NNYN_generator_19_0200_0284 =
      rs_R013_ueqv_R013NNYN_partial_19_0231 := by
  native_decide

/-- Coefficient term 232 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013NNYN_coefficient_19_0232 : Poly :=
[
  term ((-3908 : Rat) / 103) [(6, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 232 for generator 19. -/
def rs_R013_ueqv_R013NNYN_partial_19_0232 : Poly :=
[
  term ((-7816 : Rat) / 103) [(6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((3908 : Rat) / 103) [(6, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 232 for generator 19. -/
theorem rs_R013_ueqv_R013NNYN_partial_19_0232_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_19_0232
        rs_R013_ueqv_R013NNYN_generator_19_0200_0284 =
      rs_R013_ueqv_R013NNYN_partial_19_0232 := by
  native_decide

/-- Coefficient term 233 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013NNYN_coefficient_19_0233 : Poly :=
[
  term ((-704 : Rat) / 103) [(6, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 233 for generator 19. -/
def rs_R013_ueqv_R013NNYN_partial_19_0233 : Poly :=
[
  term ((-1408 : Rat) / 103) [(6, 1), (8, 1), (13, 2), (14, 1), (16, 1)],
  term ((704 : Rat) / 103) [(6, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 233 for generator 19. -/
theorem rs_R013_ueqv_R013NNYN_partial_19_0233_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_19_0233
        rs_R013_ueqv_R013NNYN_generator_19_0200_0284 =
      rs_R013_ueqv_R013NNYN_partial_19_0233 := by
  native_decide

/-- Coefficient term 234 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013NNYN_coefficient_19_0234 : Poly :=
[
  term ((576 : Rat) / 103) [(6, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 234 for generator 19. -/
def rs_R013_ueqv_R013NNYN_partial_19_0234 : Poly :=
[
  term ((1152 : Rat) / 103) [(6, 1), (8, 1), (13, 2), (15, 2), (16, 1)],
  term ((-576 : Rat) / 103) [(6, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 234 for generator 19. -/
theorem rs_R013_ueqv_R013NNYN_partial_19_0234_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_19_0234
        rs_R013_ueqv_R013NNYN_generator_19_0200_0284 =
      rs_R013_ueqv_R013NNYN_partial_19_0234 := by
  native_decide

/-- Coefficient term 235 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013NNYN_coefficient_19_0235 : Poly :=
[
  term ((-120 : Rat) / 103) [(6, 1), (13, 2), (16, 1)]
]

/-- Partial product 235 for generator 19. -/
def rs_R013_ueqv_R013NNYN_partial_19_0235 : Poly :=
[
  term ((-240 : Rat) / 103) [(6, 1), (8, 1), (13, 2), (16, 1)],
  term ((120 : Rat) / 103) [(6, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 235 for generator 19. -/
theorem rs_R013_ueqv_R013NNYN_partial_19_0235_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_19_0235
        rs_R013_ueqv_R013NNYN_generator_19_0200_0284 =
      rs_R013_ueqv_R013NNYN_partial_19_0235 := by
  native_decide

/-- Coefficient term 236 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013NNYN_coefficient_19_0236 : Poly :=
[
  term ((-600 : Rat) / 103) [(6, 1), (14, 1), (16, 1)]
]

/-- Partial product 236 for generator 19. -/
def rs_R013_ueqv_R013NNYN_partial_19_0236 : Poly :=
[
  term ((-1200 : Rat) / 103) [(6, 1), (8, 1), (14, 1), (16, 1)],
  term ((600 : Rat) / 103) [(6, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 236 for generator 19. -/
theorem rs_R013_ueqv_R013NNYN_partial_19_0236_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_19_0236
        rs_R013_ueqv_R013NNYN_generator_19_0200_0284 =
      rs_R013_ueqv_R013NNYN_partial_19_0236 := by
  native_decide

/-- Coefficient term 237 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013NNYN_coefficient_19_0237 : Poly :=
[
  term ((6780 : Rat) / 103) [(6, 1), (15, 2), (16, 1)]
]

/-- Partial product 237 for generator 19. -/
def rs_R013_ueqv_R013NNYN_partial_19_0237 : Poly :=
[
  term ((13560 : Rat) / 103) [(6, 1), (8, 1), (15, 2), (16, 1)],
  term ((-6780 : Rat) / 103) [(6, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 237 for generator 19. -/
theorem rs_R013_ueqv_R013NNYN_partial_19_0237_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_19_0237
        rs_R013_ueqv_R013NNYN_generator_19_0200_0284 =
      rs_R013_ueqv_R013NNYN_partial_19_0237 := by
  native_decide

/-- Coefficient term 238 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013NNYN_coefficient_19_0238 : Poly :=
[
  term ((416 : Rat) / 103) [(6, 1), (16, 1)]
]

/-- Partial product 238 for generator 19. -/
def rs_R013_ueqv_R013NNYN_partial_19_0238 : Poly :=
[
  term ((832 : Rat) / 103) [(6, 1), (8, 1), (16, 1)],
  term ((-416 : Rat) / 103) [(6, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 238 for generator 19. -/
theorem rs_R013_ueqv_R013NNYN_partial_19_0238_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_19_0238
        rs_R013_ueqv_R013NNYN_generator_19_0200_0284 =
      rs_R013_ueqv_R013NNYN_partial_19_0238 := by
  native_decide

/-- Coefficient term 239 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013NNYN_coefficient_19_0239 : Poly :=
[
  term ((288 : Rat) / 103) [(7, 1), (8, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 239 for generator 19. -/
def rs_R013_ueqv_R013NNYN_partial_19_0239 : Poly :=
[
  term ((-288 : Rat) / 103) [(7, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((576 : Rat) / 103) [(7, 1), (8, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 239 for generator 19. -/
theorem rs_R013_ueqv_R013NNYN_partial_19_0239_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_19_0239
        rs_R013_ueqv_R013NNYN_generator_19_0200_0284 =
      rs_R013_ueqv_R013NNYN_partial_19_0239 := by
  native_decide

/-- Coefficient term 240 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013NNYN_coefficient_19_0240 : Poly :=
[
  term ((-808 : Rat) / 103) [(7, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 240 for generator 19. -/
def rs_R013_ueqv_R013NNYN_partial_19_0240 : Poly :=
[
  term ((808 : Rat) / 103) [(7, 1), (8, 1), (13, 1), (16, 1)],
  term ((-1616 : Rat) / 103) [(7, 1), (8, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 240 for generator 19. -/
theorem rs_R013_ueqv_R013NNYN_partial_19_0240_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_19_0240
        rs_R013_ueqv_R013NNYN_generator_19_0200_0284 =
      rs_R013_ueqv_R013NNYN_partial_19_0240 := by
  native_decide

/-- Coefficient term 241 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013NNYN_coefficient_19_0241 : Poly :=
[
  term ((384 : Rat) / 103) [(7, 1), (8, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 241 for generator 19. -/
def rs_R013_ueqv_R013NNYN_partial_19_0241 : Poly :=
[
  term ((-384 : Rat) / 103) [(7, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((768 : Rat) / 103) [(7, 1), (8, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 241 for generator 19. -/
theorem rs_R013_ueqv_R013NNYN_partial_19_0241_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_19_0241
        rs_R013_ueqv_R013NNYN_generator_19_0200_0284 =
      rs_R013_ueqv_R013NNYN_partial_19_0241 := by
  native_decide

/-- Coefficient term 242 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013NNYN_coefficient_19_0242 : Poly :=
[
  term ((1496 : Rat) / 103) [(7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 242 for generator 19. -/
def rs_R013_ueqv_R013NNYN_partial_19_0242 : Poly :=
[
  term ((-1496 : Rat) / 103) [(7, 1), (8, 1), (15, 1), (16, 1)],
  term ((2992 : Rat) / 103) [(7, 1), (8, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 242 for generator 19. -/
theorem rs_R013_ueqv_R013NNYN_partial_19_0242_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_19_0242
        rs_R013_ueqv_R013NNYN_generator_19_0200_0284 =
      rs_R013_ueqv_R013NNYN_partial_19_0242 := by
  native_decide

/-- Coefficient term 243 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013NNYN_coefficient_19_0243 : Poly :=
[
  term ((-384 : Rat) / 103) [(7, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 243 for generator 19. -/
def rs_R013_ueqv_R013NNYN_partial_19_0243 : Poly :=
[
  term ((-768 : Rat) / 103) [(7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((384 : Rat) / 103) [(7, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 243 for generator 19. -/
theorem rs_R013_ueqv_R013NNYN_partial_19_0243_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_19_0243
        rs_R013_ueqv_R013NNYN_generator_19_0200_0284 =
      rs_R013_ueqv_R013NNYN_partial_19_0243 := by
  native_decide

/-- Coefficient term 244 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013NNYN_coefficient_19_0244 : Poly :=
[
  term ((-672 : Rat) / 103) [(7, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 244 for generator 19. -/
def rs_R013_ueqv_R013NNYN_partial_19_0244 : Poly :=
[
  term ((-1344 : Rat) / 103) [(7, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((672 : Rat) / 103) [(7, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 244 for generator 19. -/
theorem rs_R013_ueqv_R013NNYN_partial_19_0244_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_19_0244
        rs_R013_ueqv_R013NNYN_generator_19_0200_0284 =
      rs_R013_ueqv_R013NNYN_partial_19_0244 := by
  native_decide

/-- Coefficient term 245 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013NNYN_coefficient_19_0245 : Poly :=
[
  term ((-736 : Rat) / 103) [(7, 1), (9, 1), (16, 1)]
]

/-- Partial product 245 for generator 19. -/
def rs_R013_ueqv_R013NNYN_partial_19_0245 : Poly :=
[
  term ((-1472 : Rat) / 103) [(7, 1), (8, 1), (9, 1), (16, 1)],
  term ((736 : Rat) / 103) [(7, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 245 for generator 19. -/
theorem rs_R013_ueqv_R013NNYN_partial_19_0245_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_19_0245
        rs_R013_ueqv_R013NNYN_generator_19_0200_0284 =
      rs_R013_ueqv_R013NNYN_partial_19_0245 := by
  native_decide

/-- Coefficient term 246 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013NNYN_coefficient_19_0246 : Poly :=
[
  term ((704 : Rat) / 103) [(7, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 246 for generator 19. -/
def rs_R013_ueqv_R013NNYN_partial_19_0246 : Poly :=
[
  term ((1408 : Rat) / 103) [(7, 1), (8, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-704 : Rat) / 103) [(7, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 246 for generator 19. -/
theorem rs_R013_ueqv_R013NNYN_partial_19_0246_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_19_0246
        rs_R013_ueqv_R013NNYN_generator_19_0200_0284 =
      rs_R013_ueqv_R013NNYN_partial_19_0246 := by
  native_decide

/-- Coefficient term 247 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013NNYN_coefficient_19_0247 : Poly :=
[
  term ((-576 : Rat) / 103) [(7, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 247 for generator 19. -/
def rs_R013_ueqv_R013NNYN_partial_19_0247 : Poly :=
[
  term ((-1152 : Rat) / 103) [(7, 1), (8, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((576 : Rat) / 103) [(7, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 247 for generator 19. -/
theorem rs_R013_ueqv_R013NNYN_partial_19_0247_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_19_0247
        rs_R013_ueqv_R013NNYN_generator_19_0200_0284 =
      rs_R013_ueqv_R013NNYN_partial_19_0247 := by
  native_decide

/-- Coefficient term 248 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013NNYN_coefficient_19_0248 : Poly :=
[
  term ((776 : Rat) / 103) [(7, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 248 for generator 19. -/
def rs_R013_ueqv_R013NNYN_partial_19_0248 : Poly :=
[
  term ((1552 : Rat) / 103) [(7, 1), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((-776 : Rat) / 103) [(7, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 248 for generator 19. -/
theorem rs_R013_ueqv_R013NNYN_partial_19_0248_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_19_0248
        rs_R013_ueqv_R013NNYN_generator_19_0200_0284 =
      rs_R013_ueqv_R013NNYN_partial_19_0248 := by
  native_decide

/-- Coefficient term 249 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013NNYN_coefficient_19_0249 : Poly :=
[
  term ((-1824 : Rat) / 103) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 249 for generator 19. -/
def rs_R013_ueqv_R013NNYN_partial_19_0249 : Poly :=
[
  term ((-3648 : Rat) / 103) [(7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((1824 : Rat) / 103) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 249 for generator 19. -/
theorem rs_R013_ueqv_R013NNYN_partial_19_0249_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_19_0249
        rs_R013_ueqv_R013NNYN_generator_19_0200_0284 =
      rs_R013_ueqv_R013NNYN_partial_19_0249 := by
  native_decide

/-- Coefficient term 250 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013NNYN_coefficient_19_0250 : Poly :=
[
  term ((-1912 : Rat) / 103) [(7, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 250 for generator 19. -/
def rs_R013_ueqv_R013NNYN_partial_19_0250 : Poly :=
[
  term ((-3824 : Rat) / 103) [(7, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((1912 : Rat) / 103) [(7, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 250 for generator 19. -/
theorem rs_R013_ueqv_R013NNYN_partial_19_0250_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_19_0250
        rs_R013_ueqv_R013NNYN_generator_19_0200_0284 =
      rs_R013_ueqv_R013NNYN_partial_19_0250 := by
  native_decide

/-- Coefficient term 251 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013NNYN_coefficient_19_0251 : Poly :=
[
  term ((-432 : Rat) / 103) [(7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 251 for generator 19. -/
def rs_R013_ueqv_R013NNYN_partial_19_0251 : Poly :=
[
  term ((-864 : Rat) / 103) [(7, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((432 : Rat) / 103) [(7, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 251 for generator 19. -/
theorem rs_R013_ueqv_R013NNYN_partial_19_0251_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_19_0251
        rs_R013_ueqv_R013NNYN_generator_19_0200_0284 =
      rs_R013_ueqv_R013NNYN_partial_19_0251 := by
  native_decide

/-- Coefficient term 252 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013NNYN_coefficient_19_0252 : Poly :=
[
  term ((-68 : Rat) / 103) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 252 for generator 19. -/
def rs_R013_ueqv_R013NNYN_partial_19_0252 : Poly :=
[
  term ((-136 : Rat) / 103) [(7, 1), (8, 1), (13, 1), (16, 1)],
  term ((68 : Rat) / 103) [(7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 252 for generator 19. -/
theorem rs_R013_ueqv_R013NNYN_partial_19_0252_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_19_0252
        rs_R013_ueqv_R013NNYN_generator_19_0200_0284 =
      rs_R013_ueqv_R013NNYN_partial_19_0252 := by
  native_decide

/-- Coefficient term 253 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013NNYN_coefficient_19_0253 : Poly :=
[
  term ((192 : Rat) / 103) [(7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 253 for generator 19. -/
def rs_R013_ueqv_R013NNYN_partial_19_0253 : Poly :=
[
  term ((384 : Rat) / 103) [(7, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((-192 : Rat) / 103) [(7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 253 for generator 19. -/
theorem rs_R013_ueqv_R013NNYN_partial_19_0253_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_19_0253
        rs_R013_ueqv_R013NNYN_generator_19_0200_0284 =
      rs_R013_ueqv_R013NNYN_partial_19_0253 := by
  native_decide

/-- Coefficient term 254 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013NNYN_coefficient_19_0254 : Poly :=
[
  term ((2712 : Rat) / 103) [(7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 254 for generator 19. -/
def rs_R013_ueqv_R013NNYN_partial_19_0254 : Poly :=
[
  term ((5424 : Rat) / 103) [(7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2712 : Rat) / 103) [(7, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 254 for generator 19. -/
theorem rs_R013_ueqv_R013NNYN_partial_19_0254_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_19_0254
        rs_R013_ueqv_R013NNYN_generator_19_0200_0284 =
      rs_R013_ueqv_R013NNYN_partial_19_0254 := by
  native_decide

/-- Coefficient term 255 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013NNYN_coefficient_19_0255 : Poly :=
[
  term ((-2324 : Rat) / 103) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 255 for generator 19. -/
def rs_R013_ueqv_R013NNYN_partial_19_0255 : Poly :=
[
  term ((-4648 : Rat) / 103) [(7, 1), (8, 1), (15, 1), (16, 1)],
  term ((2324 : Rat) / 103) [(7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 255 for generator 19. -/
theorem rs_R013_ueqv_R013NNYN_partial_19_0255_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_19_0255
        rs_R013_ueqv_R013NNYN_generator_19_0200_0284 =
      rs_R013_ueqv_R013NNYN_partial_19_0255 := by
  native_decide

/-- Coefficient term 256 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013NNYN_coefficient_19_0256 : Poly :=
[
  term ((-384 : Rat) / 103) [(7, 2), (8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 256 for generator 19. -/
def rs_R013_ueqv_R013NNYN_partial_19_0256 : Poly :=
[
  term ((384 : Rat) / 103) [(7, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-768 : Rat) / 103) [(7, 2), (8, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 256 for generator 19. -/
theorem rs_R013_ueqv_R013NNYN_partial_19_0256_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_19_0256
        rs_R013_ueqv_R013NNYN_generator_19_0200_0284 =
      rs_R013_ueqv_R013NNYN_partial_19_0256 := by
  native_decide

/-- Coefficient term 257 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013NNYN_coefficient_19_0257 : Poly :=
[
  term ((768 : Rat) / 103) [(7, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 257 for generator 19. -/
def rs_R013_ueqv_R013NNYN_partial_19_0257 : Poly :=
[
  term ((1536 : Rat) / 103) [(7, 2), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-768 : Rat) / 103) [(7, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 257 for generator 19. -/
theorem rs_R013_ueqv_R013NNYN_partial_19_0257_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_19_0257
        rs_R013_ueqv_R013NNYN_generator_19_0200_0284 =
      rs_R013_ueqv_R013NNYN_partial_19_0257 := by
  native_decide

/-- Coefficient term 258 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013NNYN_coefficient_19_0258 : Poly :=
[
  term ((576 : Rat) / 103) [(7, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 258 for generator 19. -/
def rs_R013_ueqv_R013NNYN_partial_19_0258 : Poly :=
[
  term ((1152 : Rat) / 103) [(7, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-576 : Rat) / 103) [(7, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 258 for generator 19. -/
theorem rs_R013_ueqv_R013NNYN_partial_19_0258_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_19_0258
        rs_R013_ueqv_R013NNYN_generator_19_0200_0284 =
      rs_R013_ueqv_R013NNYN_partial_19_0258 := by
  native_decide

/-- Coefficient term 259 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013NNYN_coefficient_19_0259 : Poly :=
[
  term ((288 : Rat) / 103) [(8, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 259 for generator 19. -/
def rs_R013_ueqv_R013NNYN_partial_19_0259 : Poly :=
[
  term ((-288 : Rat) / 103) [(8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((576 : Rat) / 103) [(8, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 259 for generator 19. -/
theorem rs_R013_ueqv_R013NNYN_partial_19_0259_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_19_0259
        rs_R013_ueqv_R013NNYN_generator_19_0200_0284 =
      rs_R013_ueqv_R013NNYN_partial_19_0259 := by
  native_decide

/-- Coefficient term 260 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013NNYN_coefficient_19_0260 : Poly :=
[
  term ((-1128 : Rat) / 103) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 260 for generator 19. -/
def rs_R013_ueqv_R013NNYN_partial_19_0260 : Poly :=
[
  term ((1128 : Rat) / 103) [(8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2256 : Rat) / 103) [(8, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 260 for generator 19. -/
theorem rs_R013_ueqv_R013NNYN_partial_19_0260_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_19_0260
        rs_R013_ueqv_R013NNYN_generator_19_0200_0284 =
      rs_R013_ueqv_R013NNYN_partial_19_0260 := by
  native_decide

/-- Coefficient term 261 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013NNYN_coefficient_19_0261 : Poly :=
[
  term ((112 : Rat) / 103) [(8, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 261 for generator 19. -/
def rs_R013_ueqv_R013NNYN_partial_19_0261 : Poly :=
[
  term ((-112 : Rat) / 103) [(8, 1), (13, 2), (14, 1), (16, 1)],
  term ((224 : Rat) / 103) [(8, 2), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 261 for generator 19. -/
theorem rs_R013_ueqv_R013NNYN_partial_19_0261_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_19_0261
        rs_R013_ueqv_R013NNYN_generator_19_0200_0284 =
      rs_R013_ueqv_R013NNYN_partial_19_0261 := by
  native_decide

/-- Coefficient term 262 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013NNYN_coefficient_19_0262 : Poly :=
[
  term ((-288 : Rat) / 103) [(8, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 262 for generator 19. -/
def rs_R013_ueqv_R013NNYN_partial_19_0262 : Poly :=
[
  term ((288 : Rat) / 103) [(8, 1), (13, 2), (15, 2), (16, 1)],
  term ((-576 : Rat) / 103) [(8, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 262 for generator 19. -/
theorem rs_R013_ueqv_R013NNYN_partial_19_0262_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_19_0262
        rs_R013_ueqv_R013NNYN_generator_19_0200_0284 =
      rs_R013_ueqv_R013NNYN_partial_19_0262 := by
  native_decide

/-- Coefficient term 263 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013NNYN_coefficient_19_0263 : Poly :=
[
  term ((568 : Rat) / 103) [(8, 1), (13, 2), (16, 1)]
]

/-- Partial product 263 for generator 19. -/
def rs_R013_ueqv_R013NNYN_partial_19_0263 : Poly :=
[
  term ((-568 : Rat) / 103) [(8, 1), (13, 2), (16, 1)],
  term ((1136 : Rat) / 103) [(8, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 263 for generator 19. -/
theorem rs_R013_ueqv_R013NNYN_partial_19_0263_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_19_0263
        rs_R013_ueqv_R013NNYN_generator_19_0200_0284 =
      rs_R013_ueqv_R013NNYN_partial_19_0263 := by
  native_decide

/-- Coefficient term 264 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013NNYN_coefficient_19_0264 : Poly :=
[
  term ((40 : Rat) / 103) [(8, 1), (14, 1), (16, 1)]
]

/-- Partial product 264 for generator 19. -/
def rs_R013_ueqv_R013NNYN_partial_19_0264 : Poly :=
[
  term ((-40 : Rat) / 103) [(8, 1), (14, 1), (16, 1)],
  term ((80 : Rat) / 103) [(8, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 264 for generator 19. -/
theorem rs_R013_ueqv_R013NNYN_partial_19_0264_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_19_0264
        rs_R013_ueqv_R013NNYN_generator_19_0200_0284 =
      rs_R013_ueqv_R013NNYN_partial_19_0264 := by
  native_decide

/-- Coefficient term 265 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013NNYN_coefficient_19_0265 : Poly :=
[
  term ((-552 : Rat) / 103) [(8, 1), (16, 1)]
]

/-- Partial product 265 for generator 19. -/
def rs_R013_ueqv_R013NNYN_partial_19_0265 : Poly :=
[
  term ((552 : Rat) / 103) [(8, 1), (16, 1)],
  term ((-1104 : Rat) / 103) [(8, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 265 for generator 19. -/
theorem rs_R013_ueqv_R013NNYN_partial_19_0265_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_19_0265
        rs_R013_ueqv_R013NNYN_generator_19_0200_0284 =
      rs_R013_ueqv_R013NNYN_partial_19_0265 := by
  native_decide

/-- Coefficient term 266 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013NNYN_coefficient_19_0266 : Poly :=
[
  term ((-112 : Rat) / 103) [(9, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 266 for generator 19. -/
def rs_R013_ueqv_R013NNYN_partial_19_0266 : Poly :=
[
  term ((-224 : Rat) / 103) [(8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((112 : Rat) / 103) [(9, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 266 for generator 19. -/
theorem rs_R013_ueqv_R013NNYN_partial_19_0266_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_19_0266
        rs_R013_ueqv_R013NNYN_generator_19_0200_0284 =
      rs_R013_ueqv_R013NNYN_partial_19_0266 := by
  native_decide

/-- Coefficient term 267 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013NNYN_coefficient_19_0267 : Poly :=
[
  term ((288 : Rat) / 103) [(9, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 267 for generator 19. -/
def rs_R013_ueqv_R013NNYN_partial_19_0267 : Poly :=
[
  term ((576 : Rat) / 103) [(8, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-288 : Rat) / 103) [(9, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 267 for generator 19. -/
theorem rs_R013_ueqv_R013NNYN_partial_19_0267_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_19_0267
        rs_R013_ueqv_R013NNYN_generator_19_0200_0284 =
      rs_R013_ueqv_R013NNYN_partial_19_0267 := by
  native_decide

/-- Coefficient term 268 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013NNYN_coefficient_19_0268 : Poly :=
[
  term ((-568 : Rat) / 103) [(9, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 268 for generator 19. -/
def rs_R013_ueqv_R013NNYN_partial_19_0268 : Poly :=
[
  term ((-1136 : Rat) / 103) [(8, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((568 : Rat) / 103) [(9, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 268 for generator 19. -/
theorem rs_R013_ueqv_R013NNYN_partial_19_0268_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_19_0268
        rs_R013_ueqv_R013NNYN_generator_19_0200_0284 =
      rs_R013_ueqv_R013NNYN_partial_19_0268 := by
  native_decide

/-- Coefficient term 269 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013NNYN_coefficient_19_0269 : Poly :=
[
  term ((912 : Rat) / 103) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 269 for generator 19. -/
def rs_R013_ueqv_R013NNYN_partial_19_0269 : Poly :=
[
  term ((1824 : Rat) / 103) [(8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-912 : Rat) / 103) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 269 for generator 19. -/
theorem rs_R013_ueqv_R013NNYN_partial_19_0269_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_19_0269
        rs_R013_ueqv_R013NNYN_generator_19_0200_0284 =
      rs_R013_ueqv_R013NNYN_partial_19_0269 := by
  native_decide

/-- Coefficient term 270 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013NNYN_coefficient_19_0270 : Poly :=
[
  term ((864 : Rat) / 103) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 270 for generator 19. -/
def rs_R013_ueqv_R013NNYN_partial_19_0270 : Poly :=
[
  term ((1728 : Rat) / 103) [(8, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-864 : Rat) / 103) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 270 for generator 19. -/
theorem rs_R013_ueqv_R013NNYN_partial_19_0270_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_19_0270
        rs_R013_ueqv_R013NNYN_generator_19_0200_0284 =
      rs_R013_ueqv_R013NNYN_partial_19_0270 := by
  native_decide

/-- Coefficient term 271 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013NNYN_coefficient_19_0271 : Poly :=
[
  term ((-808 : Rat) / 103) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 271 for generator 19. -/
def rs_R013_ueqv_R013NNYN_partial_19_0271 : Poly :=
[
  term ((-1616 : Rat) / 103) [(8, 1), (9, 1), (13, 1), (16, 1)],
  term ((808 : Rat) / 103) [(9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 271 for generator 19. -/
theorem rs_R013_ueqv_R013NNYN_partial_19_0271_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_19_0271
        rs_R013_ueqv_R013NNYN_generator_19_0200_0284 =
      rs_R013_ueqv_R013NNYN_partial_19_0271 := by
  native_decide

/-- Coefficient term 272 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013NNYN_coefficient_19_0272 : Poly :=
[
  term ((1576 : Rat) / 103) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 272 for generator 19. -/
def rs_R013_ueqv_R013NNYN_partial_19_0272 : Poly :=
[
  term ((3152 : Rat) / 103) [(8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1576 : Rat) / 103) [(9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 272 for generator 19. -/
theorem rs_R013_ueqv_R013NNYN_partial_19_0272_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_19_0272
        rs_R013_ueqv_R013NNYN_generator_19_0200_0284 =
      rs_R013_ueqv_R013NNYN_partial_19_0272 := by
  native_decide

/-- Coefficient term 273 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013NNYN_coefficient_19_0273 : Poly :=
[
  term ((144 : Rat) / 103) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 273 for generator 19. -/
def rs_R013_ueqv_R013NNYN_partial_19_0273 : Poly :=
[
  term ((288 : Rat) / 103) [(8, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-144 : Rat) / 103) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 273 for generator 19. -/
theorem rs_R013_ueqv_R013NNYN_partial_19_0273_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_19_0273
        rs_R013_ueqv_R013NNYN_generator_19_0200_0284 =
      rs_R013_ueqv_R013NNYN_partial_19_0273 := by
  native_decide

/-- Coefficient term 274 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013NNYN_coefficient_19_0274 : Poly :=
[
  term ((-552 : Rat) / 103) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 274 for generator 19. -/
def rs_R013_ueqv_R013NNYN_partial_19_0274 : Poly :=
[
  term ((-1104 : Rat) / 103) [(8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((552 : Rat) / 103) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 274 for generator 19. -/
theorem rs_R013_ueqv_R013NNYN_partial_19_0274_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_19_0274
        rs_R013_ueqv_R013NNYN_generator_19_0200_0284 =
      rs_R013_ueqv_R013NNYN_partial_19_0274 := by
  native_decide

/-- Coefficient term 275 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013NNYN_coefficient_19_0275 : Poly :=
[
  term ((288 : Rat) / 103) [(12, 1), (13, 2), (16, 1)]
]

/-- Partial product 275 for generator 19. -/
def rs_R013_ueqv_R013NNYN_partial_19_0275 : Poly :=
[
  term ((576 : Rat) / 103) [(8, 1), (12, 1), (13, 2), (16, 1)],
  term ((-288 : Rat) / 103) [(12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 275 for generator 19. -/
theorem rs_R013_ueqv_R013NNYN_partial_19_0275_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_19_0275
        rs_R013_ueqv_R013NNYN_generator_19_0200_0284 =
      rs_R013_ueqv_R013NNYN_partial_19_0275 := by
  native_decide

/-- Coefficient term 276 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013NNYN_coefficient_19_0276 : Poly :=
[
  term ((72 : Rat) / 103) [(12, 1), (14, 1), (16, 1)]
]

/-- Partial product 276 for generator 19. -/
def rs_R013_ueqv_R013NNYN_partial_19_0276 : Poly :=
[
  term ((144 : Rat) / 103) [(8, 1), (12, 1), (14, 1), (16, 1)],
  term ((-72 : Rat) / 103) [(12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 276 for generator 19. -/
theorem rs_R013_ueqv_R013NNYN_partial_19_0276_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_19_0276
        rs_R013_ueqv_R013NNYN_generator_19_0200_0284 =
      rs_R013_ueqv_R013NNYN_partial_19_0276 := by
  native_decide

/-- Coefficient term 277 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013NNYN_coefficient_19_0277 : Poly :=
[
  term ((-72 : Rat) / 103) [(12, 2), (16, 1)]
]

/-- Partial product 277 for generator 19. -/
def rs_R013_ueqv_R013NNYN_partial_19_0277 : Poly :=
[
  term ((-144 : Rat) / 103) [(8, 1), (12, 2), (16, 1)],
  term ((72 : Rat) / 103) [(12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 277 for generator 19. -/
theorem rs_R013_ueqv_R013NNYN_partial_19_0277_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_19_0277
        rs_R013_ueqv_R013NNYN_generator_19_0200_0284 =
      rs_R013_ueqv_R013NNYN_partial_19_0277 := by
  native_decide

/-- Coefficient term 278 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013NNYN_coefficient_19_0278 : Poly :=
[
  term ((5600 : Rat) / 103) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 278 for generator 19. -/
def rs_R013_ueqv_R013NNYN_partial_19_0278 : Poly :=
[
  term ((11200 : Rat) / 103) [(8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5600 : Rat) / 103) [(13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 278 for generator 19. -/
theorem rs_R013_ueqv_R013NNYN_partial_19_0278_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_19_0278
        rs_R013_ueqv_R013NNYN_generator_19_0200_0284 =
      rs_R013_ueqv_R013NNYN_partial_19_0278 := by
  native_decide

/-- Coefficient term 279 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013NNYN_coefficient_19_0279 : Poly :=
[
  term ((536 : Rat) / 103) [(13, 2), (14, 1), (16, 1)]
]

/-- Partial product 279 for generator 19. -/
def rs_R013_ueqv_R013NNYN_partial_19_0279 : Poly :=
[
  term ((1072 : Rat) / 103) [(8, 1), (13, 2), (14, 1), (16, 1)],
  term ((-536 : Rat) / 103) [(13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 279 for generator 19. -/
theorem rs_R013_ueqv_R013NNYN_partial_19_0279_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_19_0279
        rs_R013_ueqv_R013NNYN_generator_19_0200_0284 =
      rs_R013_ueqv_R013NNYN_partial_19_0279 := by
  native_decide

/-- Coefficient term 280 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013NNYN_coefficient_19_0280 : Poly :=
[
  term ((-144 : Rat) / 103) [(13, 2), (15, 2), (16, 1)]
]

/-- Partial product 280 for generator 19. -/
def rs_R013_ueqv_R013NNYN_partial_19_0280 : Poly :=
[
  term ((-288 : Rat) / 103) [(8, 1), (13, 2), (15, 2), (16, 1)],
  term ((144 : Rat) / 103) [(13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 280 for generator 19. -/
theorem rs_R013_ueqv_R013NNYN_partial_19_0280_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_19_0280
        rs_R013_ueqv_R013NNYN_generator_19_0200_0284 =
      rs_R013_ueqv_R013NNYN_partial_19_0280 := by
  native_decide

/-- Coefficient term 281 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013NNYN_coefficient_19_0281 : Poly :=
[
  term ((-732 : Rat) / 103) [(13, 2), (16, 1)]
]

/-- Partial product 281 for generator 19. -/
def rs_R013_ueqv_R013NNYN_partial_19_0281 : Poly :=
[
  term ((-1464 : Rat) / 103) [(8, 1), (13, 2), (16, 1)],
  term ((732 : Rat) / 103) [(13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 281 for generator 19. -/
theorem rs_R013_ueqv_R013NNYN_partial_19_0281_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_19_0281
        rs_R013_ueqv_R013NNYN_generator_19_0200_0284 =
      rs_R013_ueqv_R013NNYN_partial_19_0281 := by
  native_decide

/-- Coefficient term 282 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013NNYN_coefficient_19_0282 : Poly :=
[
  term ((540 : Rat) / 103) [(14, 1), (16, 1)]
]

/-- Partial product 282 for generator 19. -/
def rs_R013_ueqv_R013NNYN_partial_19_0282 : Poly :=
[
  term ((1080 : Rat) / 103) [(8, 1), (14, 1), (16, 1)],
  term ((-540 : Rat) / 103) [(14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 282 for generator 19. -/
theorem rs_R013_ueqv_R013NNYN_partial_19_0282_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_19_0282
        rs_R013_ueqv_R013NNYN_generator_19_0200_0284 =
      rs_R013_ueqv_R013NNYN_partial_19_0282 := by
  native_decide

/-- Coefficient term 283 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013NNYN_coefficient_19_0283 : Poly :=
[
  term ((-6780 : Rat) / 103) [(15, 2), (16, 1)]
]

/-- Partial product 283 for generator 19. -/
def rs_R013_ueqv_R013NNYN_partial_19_0283 : Poly :=
[
  term ((-13560 : Rat) / 103) [(8, 1), (15, 2), (16, 1)],
  term ((6780 : Rat) / 103) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 283 for generator 19. -/
theorem rs_R013_ueqv_R013NNYN_partial_19_0283_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_19_0283
        rs_R013_ueqv_R013NNYN_generator_19_0200_0284 =
      rs_R013_ueqv_R013NNYN_partial_19_0283 := by
  native_decide

/-- Coefficient term 284 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013NNYN_coefficient_19_0284 : Poly :=
[
  term (4 : Rat) [(16, 1)]
]

/-- Partial product 284 for generator 19. -/
def rs_R013_ueqv_R013NNYN_partial_19_0284 : Poly :=
[
  term (8 : Rat) [(8, 1), (16, 1)],
  term (-4 : Rat) [(16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 284 for generator 19. -/
theorem rs_R013_ueqv_R013NNYN_partial_19_0284_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_19_0284
        rs_R013_ueqv_R013NNYN_generator_19_0200_0284 =
      rs_R013_ueqv_R013NNYN_partial_19_0284 := by
  native_decide

/-- Partial products in this block. -/
def rs_R013_ueqv_R013NNYN_partials_19_0200_0284 : List Poly :=
[
  rs_R013_ueqv_R013NNYN_partial_19_0200,
  rs_R013_ueqv_R013NNYN_partial_19_0201,
  rs_R013_ueqv_R013NNYN_partial_19_0202,
  rs_R013_ueqv_R013NNYN_partial_19_0203,
  rs_R013_ueqv_R013NNYN_partial_19_0204,
  rs_R013_ueqv_R013NNYN_partial_19_0205,
  rs_R013_ueqv_R013NNYN_partial_19_0206,
  rs_R013_ueqv_R013NNYN_partial_19_0207,
  rs_R013_ueqv_R013NNYN_partial_19_0208,
  rs_R013_ueqv_R013NNYN_partial_19_0209,
  rs_R013_ueqv_R013NNYN_partial_19_0210,
  rs_R013_ueqv_R013NNYN_partial_19_0211,
  rs_R013_ueqv_R013NNYN_partial_19_0212,
  rs_R013_ueqv_R013NNYN_partial_19_0213,
  rs_R013_ueqv_R013NNYN_partial_19_0214,
  rs_R013_ueqv_R013NNYN_partial_19_0215,
  rs_R013_ueqv_R013NNYN_partial_19_0216,
  rs_R013_ueqv_R013NNYN_partial_19_0217,
  rs_R013_ueqv_R013NNYN_partial_19_0218,
  rs_R013_ueqv_R013NNYN_partial_19_0219,
  rs_R013_ueqv_R013NNYN_partial_19_0220,
  rs_R013_ueqv_R013NNYN_partial_19_0221,
  rs_R013_ueqv_R013NNYN_partial_19_0222,
  rs_R013_ueqv_R013NNYN_partial_19_0223,
  rs_R013_ueqv_R013NNYN_partial_19_0224,
  rs_R013_ueqv_R013NNYN_partial_19_0225,
  rs_R013_ueqv_R013NNYN_partial_19_0226,
  rs_R013_ueqv_R013NNYN_partial_19_0227,
  rs_R013_ueqv_R013NNYN_partial_19_0228,
  rs_R013_ueqv_R013NNYN_partial_19_0229,
  rs_R013_ueqv_R013NNYN_partial_19_0230,
  rs_R013_ueqv_R013NNYN_partial_19_0231,
  rs_R013_ueqv_R013NNYN_partial_19_0232,
  rs_R013_ueqv_R013NNYN_partial_19_0233,
  rs_R013_ueqv_R013NNYN_partial_19_0234,
  rs_R013_ueqv_R013NNYN_partial_19_0235,
  rs_R013_ueqv_R013NNYN_partial_19_0236,
  rs_R013_ueqv_R013NNYN_partial_19_0237,
  rs_R013_ueqv_R013NNYN_partial_19_0238,
  rs_R013_ueqv_R013NNYN_partial_19_0239,
  rs_R013_ueqv_R013NNYN_partial_19_0240,
  rs_R013_ueqv_R013NNYN_partial_19_0241,
  rs_R013_ueqv_R013NNYN_partial_19_0242,
  rs_R013_ueqv_R013NNYN_partial_19_0243,
  rs_R013_ueqv_R013NNYN_partial_19_0244,
  rs_R013_ueqv_R013NNYN_partial_19_0245,
  rs_R013_ueqv_R013NNYN_partial_19_0246,
  rs_R013_ueqv_R013NNYN_partial_19_0247,
  rs_R013_ueqv_R013NNYN_partial_19_0248,
  rs_R013_ueqv_R013NNYN_partial_19_0249,
  rs_R013_ueqv_R013NNYN_partial_19_0250,
  rs_R013_ueqv_R013NNYN_partial_19_0251,
  rs_R013_ueqv_R013NNYN_partial_19_0252,
  rs_R013_ueqv_R013NNYN_partial_19_0253,
  rs_R013_ueqv_R013NNYN_partial_19_0254,
  rs_R013_ueqv_R013NNYN_partial_19_0255,
  rs_R013_ueqv_R013NNYN_partial_19_0256,
  rs_R013_ueqv_R013NNYN_partial_19_0257,
  rs_R013_ueqv_R013NNYN_partial_19_0258,
  rs_R013_ueqv_R013NNYN_partial_19_0259,
  rs_R013_ueqv_R013NNYN_partial_19_0260,
  rs_R013_ueqv_R013NNYN_partial_19_0261,
  rs_R013_ueqv_R013NNYN_partial_19_0262,
  rs_R013_ueqv_R013NNYN_partial_19_0263,
  rs_R013_ueqv_R013NNYN_partial_19_0264,
  rs_R013_ueqv_R013NNYN_partial_19_0265,
  rs_R013_ueqv_R013NNYN_partial_19_0266,
  rs_R013_ueqv_R013NNYN_partial_19_0267,
  rs_R013_ueqv_R013NNYN_partial_19_0268,
  rs_R013_ueqv_R013NNYN_partial_19_0269,
  rs_R013_ueqv_R013NNYN_partial_19_0270,
  rs_R013_ueqv_R013NNYN_partial_19_0271,
  rs_R013_ueqv_R013NNYN_partial_19_0272,
  rs_R013_ueqv_R013NNYN_partial_19_0273,
  rs_R013_ueqv_R013NNYN_partial_19_0274,
  rs_R013_ueqv_R013NNYN_partial_19_0275,
  rs_R013_ueqv_R013NNYN_partial_19_0276,
  rs_R013_ueqv_R013NNYN_partial_19_0277,
  rs_R013_ueqv_R013NNYN_partial_19_0278,
  rs_R013_ueqv_R013NNYN_partial_19_0279,
  rs_R013_ueqv_R013NNYN_partial_19_0280,
  rs_R013_ueqv_R013NNYN_partial_19_0281,
  rs_R013_ueqv_R013NNYN_partial_19_0282,
  rs_R013_ueqv_R013NNYN_partial_19_0283,
  rs_R013_ueqv_R013NNYN_partial_19_0284
]

/-- Sum of partial products in this block. -/
def rs_R013_ueqv_R013NNYN_block_19_0200_0284 : Poly :=
[
  term ((10848 : Rat) / 103) [(5, 1), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((2784 : Rat) / 103) [(5, 1), (7, 1), (8, 1), (12, 1), (16, 1)],
  term ((9744 : Rat) / 103) [(5, 1), (7, 1), (8, 1), (16, 1)],
  term ((-5424 : Rat) / 103) [(5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1392 : Rat) / 103) [(5, 1), (7, 1), (12, 1), (16, 1)],
  term ((-4872 : Rat) / 103) [(5, 1), (7, 1), (16, 1)],
  term ((-2784 : Rat) / 103) [(5, 1), (8, 1), (9, 1), (12, 1), (16, 1)],
  term ((-7584 : Rat) / 103) [(5, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((10848 : Rat) / 103) [(5, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((5568 : Rat) / 103) [(5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((15168 : Rat) / 103) [(5, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((2856 : Rat) / 103) [(5, 1), (8, 1), (13, 1), (16, 1)],
  term ((-21696 : Rat) / 103) [(5, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9336 : Rat) / 103) [(5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-3792 : Rat) / 103) [(5, 1), (8, 2), (13, 1), (14, 1), (16, 1)],
  term ((-2904 : Rat) / 103) [(5, 1), (8, 2), (13, 1), (16, 1)],
  term ((5424 : Rat) / 103) [(5, 1), (8, 2), (14, 1), (15, 1), (16, 1)],
  term ((8136 : Rat) / 103) [(5, 1), (8, 2), (15, 1), (16, 1)],
  term ((1392 : Rat) / 103) [(5, 1), (9, 1), (12, 1), (16, 1)],
  term ((3792 : Rat) / 103) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5424 : Rat) / 103) [(5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-2784 : Rat) / 103) [(5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-6636 : Rat) / 103) [(5, 1), (13, 1), (14, 1), (16, 1)],
  term ((-702 : Rat) / 103) [(5, 1), (13, 1), (16, 1)],
  term ((9492 : Rat) / 103) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term ((2634 : Rat) / 103) [(5, 1), (15, 1), (16, 1)],
  term ((-22752 : Rat) / 103) [(5, 2), (6, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((32544 : Rat) / 103) [(5, 2), (6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((11376 : Rat) / 103) [(5, 2), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-16272 : Rat) / 103) [(5, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((22752 : Rat) / 103) [(5, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-32544 : Rat) / 103) [(5, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-11376 : Rat) / 103) [(5, 2), (9, 1), (13, 1), (16, 1)],
  term ((16272 : Rat) / 103) [(5, 2), (9, 1), (15, 1), (16, 1)],
  term ((1344 : Rat) / 103) [(6, 1), (7, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((1472 : Rat) / 103) [(6, 1), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((-1312 : Rat) / 103) [(6, 1), (7, 1), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((3824 : Rat) / 103) [(6, 1), (7, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((2560 : Rat) / 103) [(6, 1), (7, 1), (8, 1), (13, 1), (16, 1)],
  term ((-1536 : Rat) / 103) [(6, 1), (7, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((-5424 : Rat) / 103) [(6, 1), (7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((160 : Rat) / 103) [(6, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-672 : Rat) / 103) [(6, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-736 : Rat) / 103) [(6, 1), (7, 1), (9, 1), (16, 1)],
  term ((656 : Rat) / 103) [(6, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1912 : Rat) / 103) [(6, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1280 : Rat) / 103) [(6, 1), (7, 1), (13, 1), (16, 1)],
  term ((768 : Rat) / 103) [(6, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((2712 : Rat) / 103) [(6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-80 : Rat) / 103) [(6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-1728 : Rat) / 103) [(6, 1), (8, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((1616 : Rat) / 103) [(6, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-3152 : Rat) / 103) [(6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((2240 : Rat) / 103) [(6, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-864 : Rat) / 103) [(6, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7816 : Rat) / 103) [(6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1408 : Rat) / 103) [(6, 1), (8, 1), (13, 2), (14, 1), (16, 1)],
  term ((1152 : Rat) / 103) [(6, 1), (8, 1), (13, 2), (15, 2), (16, 1)],
  term ((-240 : Rat) / 103) [(6, 1), (8, 1), (13, 2), (16, 1)],
  term ((-1200 : Rat) / 103) [(6, 1), (8, 1), (14, 1), (16, 1)],
  term ((13560 : Rat) / 103) [(6, 1), (8, 1), (15, 2), (16, 1)],
  term ((832 : Rat) / 103) [(6, 1), (8, 1), (16, 1)],
  term ((864 : Rat) / 103) [(6, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-808 : Rat) / 103) [(6, 1), (9, 1), (13, 1), (16, 1)],
  term ((1576 : Rat) / 103) [(6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1120 : Rat) / 103) [(6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((432 : Rat) / 103) [(6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3908 : Rat) / 103) [(6, 1), (13, 1), (15, 1), (16, 1)],
  term ((704 : Rat) / 103) [(6, 1), (13, 2), (14, 1), (16, 1)],
  term ((-576 : Rat) / 103) [(6, 1), (13, 2), (15, 2), (16, 1)],
  term ((120 : Rat) / 103) [(6, 1), (13, 2), (16, 1)],
  term ((600 : Rat) / 103) [(6, 1), (14, 1), (16, 1)],
  term ((-6780 : Rat) / 103) [(6, 1), (15, 2), (16, 1)],
  term ((-416 : Rat) / 103) [(6, 1), (16, 1)],
  term ((-768 : Rat) / 103) [(7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1344 : Rat) / 103) [(7, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1472 : Rat) / 103) [(7, 1), (8, 1), (9, 1), (16, 1)],
  term ((1408 : Rat) / 103) [(7, 1), (8, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1152 : Rat) / 103) [(7, 1), (8, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((1552 : Rat) / 103) [(7, 1), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((-3648 : Rat) / 103) [(7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3824 : Rat) / 103) [(7, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1152 : Rat) / 103) [(7, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((672 : Rat) / 103) [(7, 1), (8, 1), (13, 1), (16, 1)],
  term ((5424 : Rat) / 103) [(7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6144 : Rat) / 103) [(7, 1), (8, 1), (15, 1), (16, 1)],
  term ((576 : Rat) / 103) [(7, 1), (8, 2), (13, 1), (15, 2), (16, 1)],
  term ((-1616 : Rat) / 103) [(7, 1), (8, 2), (13, 1), (16, 1)],
  term ((768 : Rat) / 103) [(7, 1), (8, 2), (13, 2), (15, 1), (16, 1)],
  term ((2992 : Rat) / 103) [(7, 1), (8, 2), (15, 1), (16, 1)],
  term ((384 : Rat) / 103) [(7, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((672 : Rat) / 103) [(7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((736 : Rat) / 103) [(7, 1), (9, 1), (16, 1)],
  term ((-704 : Rat) / 103) [(7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((576 : Rat) / 103) [(7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-776 : Rat) / 103) [(7, 1), (12, 1), (13, 1), (16, 1)],
  term ((1824 : Rat) / 103) [(7, 1), (12, 1), (15, 1), (16, 1)],
  term ((1912 : Rat) / 103) [(7, 1), (13, 1), (14, 1), (16, 1)],
  term ((432 : Rat) / 103) [(7, 1), (13, 1), (15, 2), (16, 1)],
  term ((68 : Rat) / 103) [(7, 1), (13, 1), (16, 1)],
  term ((-192 : Rat) / 103) [(7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-2712 : Rat) / 103) [(7, 1), (14, 1), (15, 1), (16, 1)],
  term ((2324 : Rat) / 103) [(7, 1), (15, 1), (16, 1)],
  term ((1536 : Rat) / 103) [(7, 2), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1536 : Rat) / 103) [(7, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-768 : Rat) / 103) [(7, 2), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-768 : Rat) / 103) [(7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-576 : Rat) / 103) [(7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-224 : Rat) / 103) [(8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((576 : Rat) / 103) [(8, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1136 : Rat) / 103) [(8, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((1824 : Rat) / 103) [(8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((1728 : Rat) / 103) [(8, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1616 : Rat) / 103) [(8, 1), (9, 1), (13, 1), (16, 1)],
  term ((3152 : Rat) / 103) [(8, 1), (9, 1), (15, 1), (16, 1)],
  term ((288 : Rat) / 103) [(8, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1104 : Rat) / 103) [(8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((576 : Rat) / 103) [(8, 1), (12, 1), (13, 2), (16, 1)],
  term ((144 : Rat) / 103) [(8, 1), (12, 1), (14, 1), (16, 1)],
  term ((-144 : Rat) / 103) [(8, 1), (12, 2), (16, 1)],
  term ((-288 : Rat) / 103) [(8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((12328 : Rat) / 103) [(8, 1), (13, 1), (15, 1), (16, 1)],
  term ((960 : Rat) / 103) [(8, 1), (13, 2), (14, 1), (16, 1)],
  term ((-2032 : Rat) / 103) [(8, 1), (13, 2), (16, 1)],
  term ((1040 : Rat) / 103) [(8, 1), (14, 1), (16, 1)],
  term ((-13560 : Rat) / 103) [(8, 1), (15, 2), (16, 1)],
  term ((1376 : Rat) / 103) [(8, 1), (16, 1)],
  term ((576 : Rat) / 103) [(8, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2256 : Rat) / 103) [(8, 2), (13, 1), (15, 1), (16, 1)],
  term ((224 : Rat) / 103) [(8, 2), (13, 2), (14, 1), (16, 1)],
  term ((-576 : Rat) / 103) [(8, 2), (13, 2), (15, 2), (16, 1)],
  term ((1136 : Rat) / 103) [(8, 2), (13, 2), (16, 1)],
  term ((80 : Rat) / 103) [(8, 2), (14, 1), (16, 1)],
  term ((-1104 : Rat) / 103) [(8, 2), (16, 1)],
  term ((112 : Rat) / 103) [(9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-288 : Rat) / 103) [(9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((568 : Rat) / 103) [(9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-912 : Rat) / 103) [(9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-864 : Rat) / 103) [(9, 1), (13, 1), (15, 2), (16, 1)],
  term ((808 : Rat) / 103) [(9, 1), (13, 1), (16, 1)],
  term ((-1576 : Rat) / 103) [(9, 1), (15, 1), (16, 1)],
  term ((-144 : Rat) / 103) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((552 : Rat) / 103) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-288 : Rat) / 103) [(12, 1), (13, 2), (16, 1)],
  term ((-72 : Rat) / 103) [(12, 1), (14, 1), (16, 1)],
  term ((72 : Rat) / 103) [(12, 2), (16, 1)],
  term ((-5600 : Rat) / 103) [(13, 1), (15, 1), (16, 1)],
  term ((-536 : Rat) / 103) [(13, 2), (14, 1), (16, 1)],
  term ((144 : Rat) / 103) [(13, 2), (15, 2), (16, 1)],
  term ((732 : Rat) / 103) [(13, 2), (16, 1)],
  term ((-540 : Rat) / 103) [(14, 1), (16, 1)],
  term ((6780 : Rat) / 103) [(15, 2), (16, 1)],
  term (-4 : Rat) [(16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 19, terms 200 through 284. -/
theorem rs_R013_ueqv_R013NNYN_block_19_0200_0284_valid :
    checkProductSumEq rs_R013_ueqv_R013NNYN_partials_19_0200_0284
      rs_R013_ueqv_R013NNYN_block_19_0200_0284 = true := by
  native_decide

end R013UeqvR013NNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
