/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010NYN, term block 5:200-299

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010NYNTermShards

/-- Generator polynomial 5 for relaxed split surplus certificate `R010:u=v:R010NYN`. -/
def rs_R010_ueqv_R010NYN_generator_05_0200_0299 : Poly :=
[
  term (-2 : Rat) [(6, 1)],
  term (1 : Rat) [(6, 2)],
  term (1 : Rat) [(7, 2)],
  term (2 : Rat) [(14, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 200 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0200 : Poly :=
[
  term ((2839104 : Rat) / 2995) [(2, 1), (11, 2), (14, 1)]
]

/-- Partial product 200 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0200 : Poly :=
[
  term ((-5678208 : Rat) / 2995) [(2, 1), (6, 1), (11, 2), (14, 1)],
  term ((2839104 : Rat) / 2995) [(2, 1), (6, 2), (11, 2), (14, 1)],
  term ((2839104 : Rat) / 2995) [(2, 1), (7, 2), (11, 2), (14, 1)],
  term ((-2839104 : Rat) / 2995) [(2, 1), (11, 2), (14, 1), (15, 2)],
  term ((5678208 : Rat) / 2995) [(2, 1), (11, 2), (14, 2)],
  term ((-2839104 : Rat) / 2995) [(2, 1), (11, 2), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0200_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0200
        rs_R010_ueqv_R010NYN_generator_05_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_05_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0201 : Poly :=
[
  term ((-482112 : Rat) / 2995) [(2, 1), (11, 2), (15, 2)]
]

/-- Partial product 201 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0201 : Poly :=
[
  term ((964224 : Rat) / 2995) [(2, 1), (6, 1), (11, 2), (15, 2)],
  term ((-482112 : Rat) / 2995) [(2, 1), (6, 2), (11, 2), (15, 2)],
  term ((-482112 : Rat) / 2995) [(2, 1), (7, 2), (11, 2), (15, 2)],
  term ((-964224 : Rat) / 2995) [(2, 1), (11, 2), (14, 1), (15, 2)],
  term ((482112 : Rat) / 2995) [(2, 1), (11, 2), (14, 2), (15, 2)],
  term ((482112 : Rat) / 2995) [(2, 1), (11, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0201_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0201
        rs_R010_ueqv_R010NYN_generator_05_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_05_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0202 : Poly :=
[
  term ((-388346 : Rat) / 2995) [(2, 1), (13, 1), (15, 1)]
]

/-- Partial product 202 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0202 : Poly :=
[
  term ((776692 : Rat) / 2995) [(2, 1), (6, 1), (13, 1), (15, 1)],
  term ((-388346 : Rat) / 2995) [(2, 1), (6, 2), (13, 1), (15, 1)],
  term ((-388346 : Rat) / 2995) [(2, 1), (7, 2), (13, 1), (15, 1)],
  term ((-776692 : Rat) / 2995) [(2, 1), (13, 1), (14, 1), (15, 1)],
  term ((388346 : Rat) / 2995) [(2, 1), (13, 1), (14, 2), (15, 1)],
  term ((388346 : Rat) / 2995) [(2, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0202_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0202
        rs_R010_ueqv_R010NYN_generator_05_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_05_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0203 : Poly :=
[
  term ((88 : Rat) / 5) [(2, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 203 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0203 : Poly :=
[
  term ((-176 : Rat) / 5) [(2, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((88 : Rat) / 5) [(2, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((88 : Rat) / 5) [(2, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((176 : Rat) / 5) [(2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-88 : Rat) / 5) [(2, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-88 : Rat) / 5) [(2, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0203_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0203
        rs_R010_ueqv_R010NYN_generator_05_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_05_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0204 : Poly :=
[
  term ((-19666 : Rat) / 599) [(2, 1), (14, 1)]
]

/-- Partial product 204 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0204 : Poly :=
[
  term ((39332 : Rat) / 599) [(2, 1), (6, 1), (14, 1)],
  term ((-19666 : Rat) / 599) [(2, 1), (6, 2), (14, 1)],
  term ((-19666 : Rat) / 599) [(2, 1), (7, 2), (14, 1)],
  term ((19666 : Rat) / 599) [(2, 1), (14, 1), (15, 2)],
  term ((-39332 : Rat) / 599) [(2, 1), (14, 2)],
  term ((19666 : Rat) / 599) [(2, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0204_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0204
        rs_R010_ueqv_R010NYN_generator_05_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_05_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0205 : Poly :=
[
  term ((2423808 : Rat) / 2995) [(2, 1), (14, 1), (15, 2)]
]

/-- Partial product 205 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0205 : Poly :=
[
  term ((-4847616 : Rat) / 2995) [(2, 1), (6, 1), (14, 1), (15, 2)],
  term ((2423808 : Rat) / 2995) [(2, 1), (6, 2), (14, 1), (15, 2)],
  term ((2423808 : Rat) / 2995) [(2, 1), (7, 2), (14, 1), (15, 2)],
  term ((-2423808 : Rat) / 2995) [(2, 1), (14, 1), (15, 4)],
  term ((4847616 : Rat) / 2995) [(2, 1), (14, 2), (15, 2)],
  term ((-2423808 : Rat) / 2995) [(2, 1), (14, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0205_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0205
        rs_R010_ueqv_R010NYN_generator_05_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_05_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0206 : Poly :=
[
  term ((-534 : Rat) / 5) [(2, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 206 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0206 : Poly :=
[
  term ((1068 : Rat) / 5) [(2, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-534 : Rat) / 5) [(2, 1), (6, 2), (14, 1), (15, 2), (16, 1)],
  term ((-534 : Rat) / 5) [(2, 1), (7, 2), (14, 1), (15, 2), (16, 1)],
  term ((534 : Rat) / 5) [(2, 1), (14, 1), (15, 4), (16, 1)],
  term ((-1068 : Rat) / 5) [(2, 1), (14, 2), (15, 2), (16, 1)],
  term ((534 : Rat) / 5) [(2, 1), (14, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0206_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0206
        rs_R010_ueqv_R010NYN_generator_05_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_05_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0207 : Poly :=
[
  term ((191480 : Rat) / 599) [(2, 1), (15, 2)]
]

/-- Partial product 207 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0207 : Poly :=
[
  term ((-382960 : Rat) / 599) [(2, 1), (6, 1), (15, 2)],
  term ((191480 : Rat) / 599) [(2, 1), (6, 2), (15, 2)],
  term ((191480 : Rat) / 599) [(2, 1), (7, 2), (15, 2)],
  term ((382960 : Rat) / 599) [(2, 1), (14, 1), (15, 2)],
  term ((-191480 : Rat) / 599) [(2, 1), (14, 2), (15, 2)],
  term ((-191480 : Rat) / 599) [(2, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0207_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0207
        rs_R010_ueqv_R010NYN_generator_05_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_05_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0208 : Poly :=
[
  term (-44 : Rat) [(2, 1), (15, 2), (16, 1)]
]

/-- Partial product 208 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0208 : Poly :=
[
  term (88 : Rat) [(2, 1), (6, 1), (15, 2), (16, 1)],
  term (-44 : Rat) [(2, 1), (6, 2), (15, 2), (16, 1)],
  term (-44 : Rat) [(2, 1), (7, 2), (15, 2), (16, 1)],
  term (-88 : Rat) [(2, 1), (14, 1), (15, 2), (16, 1)],
  term (44 : Rat) [(2, 1), (14, 2), (15, 2), (16, 1)],
  term (44 : Rat) [(2, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0208_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0208
        rs_R010_ueqv_R010NYN_generator_05_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_05_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0209 : Poly :=
[
  term (-6 : Rat) [(2, 2)]
]

/-- Partial product 209 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0209 : Poly :=
[
  term (12 : Rat) [(2, 2), (6, 1)],
  term (-6 : Rat) [(2, 2), (6, 2)],
  term (-6 : Rat) [(2, 2), (7, 2)],
  term (-12 : Rat) [(2, 2), (14, 1)],
  term (6 : Rat) [(2, 2), (14, 2)],
  term (6 : Rat) [(2, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0209_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0209
        rs_R010_ueqv_R010NYN_generator_05_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_05_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0210 : Poly :=
[
  term (12 : Rat) [(2, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 210 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0210 : Poly :=
[
  term (-24 : Rat) [(2, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(2, 2), (6, 2), (11, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(2, 2), (7, 2), (11, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(2, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(2, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term (-12 : Rat) [(2, 2), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0210_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0210
        rs_R010_ueqv_R010NYN_generator_05_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_05_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0211 : Poly :=
[
  term ((2571264 : Rat) / 2995) [(3, 1), (6, 1), (8, 1), (11, 1)]
]

/-- Partial product 211 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0211 : Poly :=
[
  term ((2571264 : Rat) / 2995) [(3, 1), (6, 1), (7, 2), (8, 1), (11, 1)],
  term ((5142528 : Rat) / 2995) [(3, 1), (6, 1), (8, 1), (11, 1), (14, 1)],
  term ((-2571264 : Rat) / 2995) [(3, 1), (6, 1), (8, 1), (11, 1), (14, 2)],
  term ((-2571264 : Rat) / 2995) [(3, 1), (6, 1), (8, 1), (11, 1), (15, 2)],
  term ((-5142528 : Rat) / 2995) [(3, 1), (6, 2), (8, 1), (11, 1)],
  term ((2571264 : Rat) / 2995) [(3, 1), (6, 3), (8, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0211_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0211
        rs_R010_ueqv_R010NYN_generator_05_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_05_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0212 : Poly :=
[
  term ((-2757312 : Rat) / 2995) [(3, 1), (6, 1), (8, 1), (15, 1)]
]

/-- Partial product 212 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0212 : Poly :=
[
  term ((-2757312 : Rat) / 2995) [(3, 1), (6, 1), (7, 2), (8, 1), (15, 1)],
  term ((-5514624 : Rat) / 2995) [(3, 1), (6, 1), (8, 1), (14, 1), (15, 1)],
  term ((2757312 : Rat) / 2995) [(3, 1), (6, 1), (8, 1), (14, 2), (15, 1)],
  term ((2757312 : Rat) / 2995) [(3, 1), (6, 1), (8, 1), (15, 3)],
  term ((5514624 : Rat) / 2995) [(3, 1), (6, 2), (8, 1), (15, 1)],
  term ((-2757312 : Rat) / 2995) [(3, 1), (6, 3), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0212_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0212
        rs_R010_ueqv_R010NYN_generator_05_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_05_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0213 : Poly :=
[
  term ((636 : Rat) / 5) [(3, 1), (6, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 213 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0213 : Poly :=
[
  term ((636 : Rat) / 5) [(3, 1), (6, 1), (7, 2), (8, 1), (15, 1), (16, 1)],
  term ((1272 : Rat) / 5) [(3, 1), (6, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-636 : Rat) / 5) [(3, 1), (6, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((-636 : Rat) / 5) [(3, 1), (6, 1), (8, 1), (15, 3), (16, 1)],
  term ((-1272 : Rat) / 5) [(3, 1), (6, 2), (8, 1), (15, 1), (16, 1)],
  term ((636 : Rat) / 5) [(3, 1), (6, 3), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0213_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0213
        rs_R010_ueqv_R010NYN_generator_05_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_05_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0214 : Poly :=
[
  term ((-2571264 : Rat) / 2995) [(3, 1), (7, 1), (9, 1), (11, 1)]
]

/-- Partial product 214 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0214 : Poly :=
[
  term ((5142528 : Rat) / 2995) [(3, 1), (6, 1), (7, 1), (9, 1), (11, 1)],
  term ((-2571264 : Rat) / 2995) [(3, 1), (6, 2), (7, 1), (9, 1), (11, 1)],
  term ((-5142528 : Rat) / 2995) [(3, 1), (7, 1), (9, 1), (11, 1), (14, 1)],
  term ((2571264 : Rat) / 2995) [(3, 1), (7, 1), (9, 1), (11, 1), (14, 2)],
  term ((2571264 : Rat) / 2995) [(3, 1), (7, 1), (9, 1), (11, 1), (15, 2)],
  term ((-2571264 : Rat) / 2995) [(3, 1), (7, 3), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0214_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0214
        rs_R010_ueqv_R010NYN_generator_05_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_05_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0215 : Poly :=
[
  term ((2757312 : Rat) / 2995) [(3, 1), (7, 1), (9, 1), (15, 1)]
]

/-- Partial product 215 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0215 : Poly :=
[
  term ((-5514624 : Rat) / 2995) [(3, 1), (6, 1), (7, 1), (9, 1), (15, 1)],
  term ((2757312 : Rat) / 2995) [(3, 1), (6, 2), (7, 1), (9, 1), (15, 1)],
  term ((5514624 : Rat) / 2995) [(3, 1), (7, 1), (9, 1), (14, 1), (15, 1)],
  term ((-2757312 : Rat) / 2995) [(3, 1), (7, 1), (9, 1), (14, 2), (15, 1)],
  term ((-2757312 : Rat) / 2995) [(3, 1), (7, 1), (9, 1), (15, 3)],
  term ((2757312 : Rat) / 2995) [(3, 1), (7, 3), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0215_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0215
        rs_R010_ueqv_R010NYN_generator_05_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_05_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0216 : Poly :=
[
  term ((-636 : Rat) / 5) [(3, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 216 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0216 : Poly :=
[
  term ((1272 : Rat) / 5) [(3, 1), (6, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-636 : Rat) / 5) [(3, 1), (6, 2), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1272 : Rat) / 5) [(3, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((636 : Rat) / 5) [(3, 1), (7, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((636 : Rat) / 5) [(3, 1), (7, 1), (9, 1), (15, 3), (16, 1)],
  term ((-636 : Rat) / 5) [(3, 1), (7, 3), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0216_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0216
        rs_R010_ueqv_R010NYN_generator_05_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_05_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0217 : Poly :=
[
  term ((-2571264 : Rat) / 2995) [(3, 1), (8, 1), (10, 1), (11, 1)]
]

/-- Partial product 217 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0217 : Poly :=
[
  term ((5142528 : Rat) / 2995) [(3, 1), (6, 1), (8, 1), (10, 1), (11, 1)],
  term ((-2571264 : Rat) / 2995) [(3, 1), (6, 2), (8, 1), (10, 1), (11, 1)],
  term ((-2571264 : Rat) / 2995) [(3, 1), (7, 2), (8, 1), (10, 1), (11, 1)],
  term ((-5142528 : Rat) / 2995) [(3, 1), (8, 1), (10, 1), (11, 1), (14, 1)],
  term ((2571264 : Rat) / 2995) [(3, 1), (8, 1), (10, 1), (11, 1), (14, 2)],
  term ((2571264 : Rat) / 2995) [(3, 1), (8, 1), (10, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0217_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0217
        rs_R010_ueqv_R010NYN_generator_05_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_05_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0218 : Poly :=
[
  term ((2757312 : Rat) / 2995) [(3, 1), (8, 1), (10, 1), (15, 1)]
]

/-- Partial product 218 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0218 : Poly :=
[
  term ((-5514624 : Rat) / 2995) [(3, 1), (6, 1), (8, 1), (10, 1), (15, 1)],
  term ((2757312 : Rat) / 2995) [(3, 1), (6, 2), (8, 1), (10, 1), (15, 1)],
  term ((2757312 : Rat) / 2995) [(3, 1), (7, 2), (8, 1), (10, 1), (15, 1)],
  term ((5514624 : Rat) / 2995) [(3, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((-2757312 : Rat) / 2995) [(3, 1), (8, 1), (10, 1), (14, 2), (15, 1)],
  term ((-2757312 : Rat) / 2995) [(3, 1), (8, 1), (10, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0218_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0218
        rs_R010_ueqv_R010NYN_generator_05_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_05_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0219 : Poly :=
[
  term ((-636 : Rat) / 5) [(3, 1), (8, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 219 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0219 : Poly :=
[
  term ((1272 : Rat) / 5) [(3, 1), (6, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-636 : Rat) / 5) [(3, 1), (6, 2), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-636 : Rat) / 5) [(3, 1), (7, 2), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1272 : Rat) / 5) [(3, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((636 : Rat) / 5) [(3, 1), (8, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((636 : Rat) / 5) [(3, 1), (8, 1), (10, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0219_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0219
        rs_R010_ueqv_R010NYN_generator_05_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_05_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0220 : Poly :=
[
  term ((-3428352 : Rat) / 2995) [(3, 1), (8, 1), (11, 1)]
]

/-- Partial product 220 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0220 : Poly :=
[
  term ((6856704 : Rat) / 2995) [(3, 1), (6, 1), (8, 1), (11, 1)],
  term ((-3428352 : Rat) / 2995) [(3, 1), (6, 2), (8, 1), (11, 1)],
  term ((-3428352 : Rat) / 2995) [(3, 1), (7, 2), (8, 1), (11, 1)],
  term ((-6856704 : Rat) / 2995) [(3, 1), (8, 1), (11, 1), (14, 1)],
  term ((3428352 : Rat) / 2995) [(3, 1), (8, 1), (11, 1), (14, 2)],
  term ((3428352 : Rat) / 2995) [(3, 1), (8, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0220_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0220
        rs_R010_ueqv_R010NYN_generator_05_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_05_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0221 : Poly :=
[
  term ((-1714176 : Rat) / 2995) [(3, 1), (8, 1), (11, 1), (14, 1)]
]

/-- Partial product 221 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0221 : Poly :=
[
  term ((3428352 : Rat) / 2995) [(3, 1), (6, 1), (8, 1), (11, 1), (14, 1)],
  term ((-1714176 : Rat) / 2995) [(3, 1), (6, 2), (8, 1), (11, 1), (14, 1)],
  term ((-1714176 : Rat) / 2995) [(3, 1), (7, 2), (8, 1), (11, 1), (14, 1)],
  term ((1714176 : Rat) / 2995) [(3, 1), (8, 1), (11, 1), (14, 1), (15, 2)],
  term ((-3428352 : Rat) / 2995) [(3, 1), (8, 1), (11, 1), (14, 2)],
  term ((1714176 : Rat) / 2995) [(3, 1), (8, 1), (11, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0221_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0221
        rs_R010_ueqv_R010NYN_generator_05_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_05_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0222 : Poly :=
[
  term ((1838208 : Rat) / 2995) [(3, 1), (8, 1), (14, 1), (15, 1)]
]

/-- Partial product 222 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0222 : Poly :=
[
  term ((-3676416 : Rat) / 2995) [(3, 1), (6, 1), (8, 1), (14, 1), (15, 1)],
  term ((1838208 : Rat) / 2995) [(3, 1), (6, 2), (8, 1), (14, 1), (15, 1)],
  term ((1838208 : Rat) / 2995) [(3, 1), (7, 2), (8, 1), (14, 1), (15, 1)],
  term ((-1838208 : Rat) / 2995) [(3, 1), (8, 1), (14, 1), (15, 3)],
  term ((3676416 : Rat) / 2995) [(3, 1), (8, 1), (14, 2), (15, 1)],
  term ((-1838208 : Rat) / 2995) [(3, 1), (8, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0222_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0222
        rs_R010_ueqv_R010NYN_generator_05_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_05_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0223 : Poly :=
[
  term ((-424 : Rat) / 5) [(3, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 223 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0223 : Poly :=
[
  term ((848 : Rat) / 5) [(3, 1), (6, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-424 : Rat) / 5) [(3, 1), (6, 2), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-424 : Rat) / 5) [(3, 1), (7, 2), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((424 : Rat) / 5) [(3, 1), (8, 1), (14, 1), (15, 3), (16, 1)],
  term ((-848 : Rat) / 5) [(3, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((424 : Rat) / 5) [(3, 1), (8, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0223_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0223
        rs_R010_ueqv_R010NYN_generator_05_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_05_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0224 : Poly :=
[
  term ((3676416 : Rat) / 2995) [(3, 1), (8, 1), (15, 1)]
]

/-- Partial product 224 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0224 : Poly :=
[
  term ((-7352832 : Rat) / 2995) [(3, 1), (6, 1), (8, 1), (15, 1)],
  term ((3676416 : Rat) / 2995) [(3, 1), (6, 2), (8, 1), (15, 1)],
  term ((3676416 : Rat) / 2995) [(3, 1), (7, 2), (8, 1), (15, 1)],
  term ((7352832 : Rat) / 2995) [(3, 1), (8, 1), (14, 1), (15, 1)],
  term ((-3676416 : Rat) / 2995) [(3, 1), (8, 1), (14, 2), (15, 1)],
  term ((-3676416 : Rat) / 2995) [(3, 1), (8, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0224_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0224
        rs_R010_ueqv_R010NYN_generator_05_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_05_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0225 : Poly :=
[
  term ((-848 : Rat) / 5) [(3, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 225 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0225 : Poly :=
[
  term ((1696 : Rat) / 5) [(3, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-848 : Rat) / 5) [(3, 1), (6, 2), (8, 1), (15, 1), (16, 1)],
  term ((-848 : Rat) / 5) [(3, 1), (7, 2), (8, 1), (15, 1), (16, 1)],
  term ((-1696 : Rat) / 5) [(3, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((848 : Rat) / 5) [(3, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((848 : Rat) / 5) [(3, 1), (8, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0225_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0225
        rs_R010_ueqv_R010NYN_generator_05_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_05_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0226 : Poly :=
[
  term (6 : Rat) [(3, 1), (9, 1)]
]

/-- Partial product 226 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0226 : Poly :=
[
  term (-12 : Rat) [(3, 1), (6, 1), (9, 1)],
  term (6 : Rat) [(3, 1), (6, 2), (9, 1)],
  term (6 : Rat) [(3, 1), (7, 2), (9, 1)],
  term (12 : Rat) [(3, 1), (9, 1), (14, 1)],
  term (-6 : Rat) [(3, 1), (9, 1), (14, 2)],
  term (-6 : Rat) [(3, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0226_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0226
        rs_R010_ueqv_R010NYN_generator_05_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_05_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0227 : Poly :=
[
  term ((458496 : Rat) / 2995) [(3, 1), (9, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 227 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0227 : Poly :=
[
  term ((-916992 : Rat) / 2995) [(3, 1), (6, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((458496 : Rat) / 2995) [(3, 1), (6, 2), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((458496 : Rat) / 2995) [(3, 1), (7, 2), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((-458496 : Rat) / 2995) [(3, 1), (9, 1), (11, 1), (14, 1), (15, 3)],
  term ((916992 : Rat) / 2995) [(3, 1), (9, 1), (11, 1), (14, 2), (15, 1)],
  term ((-458496 : Rat) / 2995) [(3, 1), (9, 1), (11, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0227_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0227
        rs_R010_ueqv_R010NYN_generator_05_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_05_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0228 : Poly :=
[
  term ((-72 : Rat) / 5) [(3, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 228 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0228 : Poly :=
[
  term ((144 : Rat) / 5) [(3, 1), (6, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-72 : Rat) / 5) [(3, 1), (6, 2), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-72 : Rat) / 5) [(3, 1), (7, 2), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((72 : Rat) / 5) [(3, 1), (9, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((-144 : Rat) / 5) [(3, 1), (9, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((72 : Rat) / 5) [(3, 1), (9, 1), (11, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0228_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0228
        rs_R010_ueqv_R010NYN_generator_05_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_05_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0229 : Poly :=
[
  term ((68544 : Rat) / 2995) [(3, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 229 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0229 : Poly :=
[
  term ((-137088 : Rat) / 2995) [(3, 1), (6, 1), (9, 1), (11, 1), (15, 1)],
  term ((68544 : Rat) / 2995) [(3, 1), (6, 2), (9, 1), (11, 1), (15, 1)],
  term ((68544 : Rat) / 2995) [(3, 1), (7, 2), (9, 1), (11, 1), (15, 1)],
  term ((137088 : Rat) / 2995) [(3, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((-68544 : Rat) / 2995) [(3, 1), (9, 1), (11, 1), (14, 2), (15, 1)],
  term ((-68544 : Rat) / 2995) [(3, 1), (9, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0229_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0229
        rs_R010_ueqv_R010NYN_generator_05_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_05_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0230 : Poly :=
[
  term ((-276 : Rat) / 5) [(3, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 230 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0230 : Poly :=
[
  term ((552 : Rat) / 5) [(3, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-276 : Rat) / 5) [(3, 1), (6, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-276 : Rat) / 5) [(3, 1), (7, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-552 : Rat) / 5) [(3, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((276 : Rat) / 5) [(3, 1), (9, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((276 : Rat) / 5) [(3, 1), (9, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0230_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0230
        rs_R010_ueqv_R010NYN_generator_05_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_05_0230 := by
  native_decide

/-- Coefficient term 231 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0231 : Poly :=
[
  term ((-160704 : Rat) / 2995) [(3, 1), (9, 1), (11, 2)]
]

/-- Partial product 231 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0231 : Poly :=
[
  term ((321408 : Rat) / 2995) [(3, 1), (6, 1), (9, 1), (11, 2)],
  term ((-160704 : Rat) / 2995) [(3, 1), (6, 2), (9, 1), (11, 2)],
  term ((-160704 : Rat) / 2995) [(3, 1), (7, 2), (9, 1), (11, 2)],
  term ((-321408 : Rat) / 2995) [(3, 1), (9, 1), (11, 2), (14, 1)],
  term ((160704 : Rat) / 2995) [(3, 1), (9, 1), (11, 2), (14, 2)],
  term ((160704 : Rat) / 2995) [(3, 1), (9, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 231 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0231_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0231
        rs_R010_ueqv_R010NYN_generator_05_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_05_0231 := by
  native_decide

/-- Coefficient term 232 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0232 : Poly :=
[
  term ((-321408 : Rat) / 2995) [(3, 1), (9, 1), (11, 2), (14, 1)]
]

/-- Partial product 232 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0232 : Poly :=
[
  term ((642816 : Rat) / 2995) [(3, 1), (6, 1), (9, 1), (11, 2), (14, 1)],
  term ((-321408 : Rat) / 2995) [(3, 1), (6, 2), (9, 1), (11, 2), (14, 1)],
  term ((-321408 : Rat) / 2995) [(3, 1), (7, 2), (9, 1), (11, 2), (14, 1)],
  term ((321408 : Rat) / 2995) [(3, 1), (9, 1), (11, 2), (14, 1), (15, 2)],
  term ((-642816 : Rat) / 2995) [(3, 1), (9, 1), (11, 2), (14, 2)],
  term ((321408 : Rat) / 2995) [(3, 1), (9, 1), (11, 2), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 232 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0232_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0232
        rs_R010_ueqv_R010NYN_generator_05_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_05_0232 := by
  native_decide

/-- Coefficient term 233 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0233 : Poly :=
[
  term (12 : Rat) [(3, 1), (9, 1), (14, 1)]
]

/-- Partial product 233 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0233 : Poly :=
[
  term (-24 : Rat) [(3, 1), (6, 1), (9, 1), (14, 1)],
  term (12 : Rat) [(3, 1), (6, 2), (9, 1), (14, 1)],
  term (12 : Rat) [(3, 1), (7, 2), (9, 1), (14, 1)],
  term (-12 : Rat) [(3, 1), (9, 1), (14, 1), (15, 2)],
  term (24 : Rat) [(3, 1), (9, 1), (14, 2)],
  term (-12 : Rat) [(3, 1), (9, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 233 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0233_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0233
        rs_R010_ueqv_R010NYN_generator_05_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_05_0233 := by
  native_decide

/-- Coefficient term 234 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0234 : Poly :=
[
  term ((-98496 : Rat) / 2995) [(3, 1), (9, 1), (14, 1), (15, 2)]
]

/-- Partial product 234 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0234 : Poly :=
[
  term ((196992 : Rat) / 2995) [(3, 1), (6, 1), (9, 1), (14, 1), (15, 2)],
  term ((-98496 : Rat) / 2995) [(3, 1), (6, 2), (9, 1), (14, 1), (15, 2)],
  term ((-98496 : Rat) / 2995) [(3, 1), (7, 2), (9, 1), (14, 1), (15, 2)],
  term ((98496 : Rat) / 2995) [(3, 1), (9, 1), (14, 1), (15, 4)],
  term ((-196992 : Rat) / 2995) [(3, 1), (9, 1), (14, 2), (15, 2)],
  term ((98496 : Rat) / 2995) [(3, 1), (9, 1), (14, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 234 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0234_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0234
        rs_R010_ueqv_R010NYN_generator_05_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_05_0234 := by
  native_decide

/-- Coefficient term 235 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0235 : Poly :=
[
  term ((-12 : Rat) / 5) [(3, 1), (9, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 235 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0235 : Poly :=
[
  term ((24 : Rat) / 5) [(3, 1), (6, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-12 : Rat) / 5) [(3, 1), (6, 2), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-12 : Rat) / 5) [(3, 1), (7, 2), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((12 : Rat) / 5) [(3, 1), (9, 1), (14, 1), (15, 4), (16, 1)],
  term ((-24 : Rat) / 5) [(3, 1), (9, 1), (14, 2), (15, 2), (16, 1)],
  term ((12 : Rat) / 5) [(3, 1), (9, 1), (14, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 235 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0235_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0235
        rs_R010_ueqv_R010NYN_generator_05_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_05_0235 := by
  native_decide

/-- Coefficient term 236 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0236 : Poly :=
[
  term ((-16416 : Rat) / 2995) [(3, 1), (9, 1), (15, 2)]
]

/-- Partial product 236 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0236 : Poly :=
[
  term ((32832 : Rat) / 2995) [(3, 1), (6, 1), (9, 1), (15, 2)],
  term ((-16416 : Rat) / 2995) [(3, 1), (6, 2), (9, 1), (15, 2)],
  term ((-16416 : Rat) / 2995) [(3, 1), (7, 2), (9, 1), (15, 2)],
  term ((-32832 : Rat) / 2995) [(3, 1), (9, 1), (14, 1), (15, 2)],
  term ((16416 : Rat) / 2995) [(3, 1), (9, 1), (14, 2), (15, 2)],
  term ((16416 : Rat) / 2995) [(3, 1), (9, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 236 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0236_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0236
        rs_R010_ueqv_R010NYN_generator_05_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_05_0236 := by
  native_decide

/-- Coefficient term 237 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0237 : Poly :=
[
  term ((-2 : Rat) / 5) [(3, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 237 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0237 : Poly :=
[
  term ((4 : Rat) / 5) [(3, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((-2 : Rat) / 5) [(3, 1), (6, 2), (9, 1), (15, 2), (16, 1)],
  term ((-2 : Rat) / 5) [(3, 1), (7, 2), (9, 1), (15, 2), (16, 1)],
  term ((-4 : Rat) / 5) [(3, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((2 : Rat) / 5) [(3, 1), (9, 1), (14, 2), (15, 2), (16, 1)],
  term ((2 : Rat) / 5) [(3, 1), (9, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 237 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0237_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0237
        rs_R010_ueqv_R010NYN_generator_05_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_05_0237 := by
  native_decide

/-- Coefficient term 238 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0238 : Poly :=
[
  term ((321408 : Rat) / 599) [(3, 1), (10, 1), (11, 1)]
]

/-- Partial product 238 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0238 : Poly :=
[
  term ((-642816 : Rat) / 599) [(3, 1), (6, 1), (10, 1), (11, 1)],
  term ((321408 : Rat) / 599) [(3, 1), (6, 2), (10, 1), (11, 1)],
  term ((321408 : Rat) / 599) [(3, 1), (7, 2), (10, 1), (11, 1)],
  term ((642816 : Rat) / 599) [(3, 1), (10, 1), (11, 1), (14, 1)],
  term ((-321408 : Rat) / 599) [(3, 1), (10, 1), (11, 1), (14, 2)],
  term ((-321408 : Rat) / 599) [(3, 1), (10, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 238 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0238_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0238
        rs_R010_ueqv_R010NYN_generator_05_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_05_0238 := by
  native_decide

/-- Coefficient term 239 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0239 : Poly :=
[
  term ((2571264 : Rat) / 2995) [(3, 1), (10, 1), (11, 1), (14, 1)]
]

/-- Partial product 239 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0239 : Poly :=
[
  term ((-5142528 : Rat) / 2995) [(3, 1), (6, 1), (10, 1), (11, 1), (14, 1)],
  term ((2571264 : Rat) / 2995) [(3, 1), (6, 2), (10, 1), (11, 1), (14, 1)],
  term ((2571264 : Rat) / 2995) [(3, 1), (7, 2), (10, 1), (11, 1), (14, 1)],
  term ((-2571264 : Rat) / 2995) [(3, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((5142528 : Rat) / 2995) [(3, 1), (10, 1), (11, 1), (14, 2)],
  term ((-2571264 : Rat) / 2995) [(3, 1), (10, 1), (11, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 239 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0239_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0239
        rs_R010_ueqv_R010NYN_generator_05_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_05_0239 := by
  native_decide

/-- Coefficient term 240 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0240 : Poly :=
[
  term ((-2757312 : Rat) / 2995) [(3, 1), (10, 1), (14, 1), (15, 1)]
]

/-- Partial product 240 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0240 : Poly :=
[
  term ((5514624 : Rat) / 2995) [(3, 1), (6, 1), (10, 1), (14, 1), (15, 1)],
  term ((-2757312 : Rat) / 2995) [(3, 1), (6, 2), (10, 1), (14, 1), (15, 1)],
  term ((-2757312 : Rat) / 2995) [(3, 1), (7, 2), (10, 1), (14, 1), (15, 1)],
  term ((2757312 : Rat) / 2995) [(3, 1), (10, 1), (14, 1), (15, 3)],
  term ((-5514624 : Rat) / 2995) [(3, 1), (10, 1), (14, 2), (15, 1)],
  term ((2757312 : Rat) / 2995) [(3, 1), (10, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 240 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0240_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0240
        rs_R010_ueqv_R010NYN_generator_05_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_05_0240 := by
  native_decide

/-- Coefficient term 241 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0241 : Poly :=
[
  term ((636 : Rat) / 5) [(3, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 241 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0241 : Poly :=
[
  term ((-1272 : Rat) / 5) [(3, 1), (6, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((636 : Rat) / 5) [(3, 1), (6, 2), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((636 : Rat) / 5) [(3, 1), (7, 2), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-636 : Rat) / 5) [(3, 1), (10, 1), (14, 1), (15, 3), (16, 1)],
  term ((1272 : Rat) / 5) [(3, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-636 : Rat) / 5) [(3, 1), (10, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 241 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0241_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0241
        rs_R010_ueqv_R010NYN_generator_05_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_05_0241 := by
  native_decide

/-- Coefficient term 242 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0242 : Poly :=
[
  term ((-317388 : Rat) / 599) [(3, 1), (10, 1), (15, 1)]
]

/-- Partial product 242 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0242 : Poly :=
[
  term ((634776 : Rat) / 599) [(3, 1), (6, 1), (10, 1), (15, 1)],
  term ((-317388 : Rat) / 599) [(3, 1), (6, 2), (10, 1), (15, 1)],
  term ((-317388 : Rat) / 599) [(3, 1), (7, 2), (10, 1), (15, 1)],
  term ((-634776 : Rat) / 599) [(3, 1), (10, 1), (14, 1), (15, 1)],
  term ((317388 : Rat) / 599) [(3, 1), (10, 1), (14, 2), (15, 1)],
  term ((317388 : Rat) / 599) [(3, 1), (10, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 242 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0242_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0242
        rs_R010_ueqv_R010NYN_generator_05_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_05_0242 := by
  native_decide

/-- Coefficient term 243 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0243 : Poly :=
[
  term (70 : Rat) [(3, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 243 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0243 : Poly :=
[
  term (-140 : Rat) [(3, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term (70 : Rat) [(3, 1), (6, 2), (10, 1), (15, 1), (16, 1)],
  term (70 : Rat) [(3, 1), (7, 2), (10, 1), (15, 1), (16, 1)],
  term (140 : Rat) [(3, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term (-70 : Rat) [(3, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term (-70 : Rat) [(3, 1), (10, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 243 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0243_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0243
        rs_R010_ueqv_R010NYN_generator_05_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_05_0243 := by
  native_decide

/-- Coefficient term 244 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0244 : Poly :=
[
  term ((-162936 : Rat) / 2995) [(3, 1), (11, 1)]
]

/-- Partial product 244 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0244 : Poly :=
[
  term ((325872 : Rat) / 2995) [(3, 1), (6, 1), (11, 1)],
  term ((-162936 : Rat) / 2995) [(3, 1), (6, 2), (11, 1)],
  term ((-162936 : Rat) / 2995) [(3, 1), (7, 2), (11, 1)],
  term ((-325872 : Rat) / 2995) [(3, 1), (11, 1), (14, 1)],
  term ((162936 : Rat) / 2995) [(3, 1), (11, 1), (14, 2)],
  term ((162936 : Rat) / 2995) [(3, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 244 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0244_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0244
        rs_R010_ueqv_R010NYN_generator_05_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_05_0244 := by
  native_decide

/-- Coefficient term 245 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0245 : Poly :=
[
  term ((-2571264 : Rat) / 2995) [(3, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 245 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0245 : Poly :=
[
  term ((5142528 : Rat) / 2995) [(3, 1), (6, 1), (11, 1), (13, 1), (15, 1)],
  term ((-2571264 : Rat) / 2995) [(3, 1), (6, 2), (11, 1), (13, 1), (15, 1)],
  term ((-2571264 : Rat) / 2995) [(3, 1), (7, 2), (11, 1), (13, 1), (15, 1)],
  term ((-5142528 : Rat) / 2995) [(3, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((2571264 : Rat) / 2995) [(3, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((2571264 : Rat) / 2995) [(3, 1), (11, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 245 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0245_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0245
        rs_R010_ueqv_R010NYN_generator_05_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_05_0245 := by
  native_decide

/-- Coefficient term 246 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0246 : Poly :=
[
  term (-6 : Rat) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 246 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0246 : Poly :=
[
  term (12 : Rat) [(3, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(3, 1), (6, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(3, 1), (7, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(3, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(3, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term (6 : Rat) [(3, 1), (11, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 246 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0246_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0246
        rs_R010_ueqv_R010NYN_generator_05_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_05_0246 := by
  native_decide

/-- Coefficient term 247 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0247 : Poly :=
[
  term ((-325872 : Rat) / 2995) [(3, 1), (11, 1), (14, 1)]
]

/-- Partial product 247 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0247 : Poly :=
[
  term ((651744 : Rat) / 2995) [(3, 1), (6, 1), (11, 1), (14, 1)],
  term ((-325872 : Rat) / 2995) [(3, 1), (6, 2), (11, 1), (14, 1)],
  term ((-325872 : Rat) / 2995) [(3, 1), (7, 2), (11, 1), (14, 1)],
  term ((325872 : Rat) / 2995) [(3, 1), (11, 1), (14, 1), (15, 2)],
  term ((-651744 : Rat) / 2995) [(3, 1), (11, 1), (14, 2)],
  term ((325872 : Rat) / 2995) [(3, 1), (11, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 247 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0247_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0247
        rs_R010_ueqv_R010NYN_generator_05_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_05_0247 := by
  native_decide

/-- Coefficient term 248 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0248 : Poly :=
[
  term ((-366336 : Rat) / 2995) [(3, 1), (11, 1), (14, 1), (15, 2)]
]

/-- Partial product 248 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0248 : Poly :=
[
  term ((732672 : Rat) / 2995) [(3, 1), (6, 1), (11, 1), (14, 1), (15, 2)],
  term ((-366336 : Rat) / 2995) [(3, 1), (6, 2), (11, 1), (14, 1), (15, 2)],
  term ((-366336 : Rat) / 2995) [(3, 1), (7, 2), (11, 1), (14, 1), (15, 2)],
  term ((366336 : Rat) / 2995) [(3, 1), (11, 1), (14, 1), (15, 4)],
  term ((-732672 : Rat) / 2995) [(3, 1), (11, 1), (14, 2), (15, 2)],
  term ((366336 : Rat) / 2995) [(3, 1), (11, 1), (14, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 248 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0248_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0248
        rs_R010_ueqv_R010NYN_generator_05_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_05_0248 := by
  native_decide

/-- Coefficient term 249 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0249 : Poly :=
[
  term ((198 : Rat) / 5) [(3, 1), (11, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 249 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0249 : Poly :=
[
  term ((-396 : Rat) / 5) [(3, 1), (6, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((198 : Rat) / 5) [(3, 1), (6, 2), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((198 : Rat) / 5) [(3, 1), (7, 2), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-198 : Rat) / 5) [(3, 1), (11, 1), (14, 1), (15, 4), (16, 1)],
  term ((396 : Rat) / 5) [(3, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((-198 : Rat) / 5) [(3, 1), (11, 1), (14, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 249 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0249_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0249
        rs_R010_ueqv_R010NYN_generator_05_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_05_0249 := by
  native_decide

/-- Coefficient term 250 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0250 : Poly :=
[
  term ((-1553424 : Rat) / 599) [(3, 1), (11, 1), (15, 2)]
]

/-- Partial product 250 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0250 : Poly :=
[
  term ((3106848 : Rat) / 599) [(3, 1), (6, 1), (11, 1), (15, 2)],
  term ((-1553424 : Rat) / 599) [(3, 1), (6, 2), (11, 1), (15, 2)],
  term ((-1553424 : Rat) / 599) [(3, 1), (7, 2), (11, 1), (15, 2)],
  term ((-3106848 : Rat) / 599) [(3, 1), (11, 1), (14, 1), (15, 2)],
  term ((1553424 : Rat) / 599) [(3, 1), (11, 1), (14, 2), (15, 2)],
  term ((1553424 : Rat) / 599) [(3, 1), (11, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 250 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0250_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0250
        rs_R010_ueqv_R010NYN_generator_05_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_05_0250 := by
  native_decide

/-- Coefficient term 251 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0251 : Poly :=
[
  term ((1557 : Rat) / 5) [(3, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 251 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0251 : Poly :=
[
  term ((-3114 : Rat) / 5) [(3, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((1557 : Rat) / 5) [(3, 1), (6, 2), (11, 1), (15, 2), (16, 1)],
  term ((1557 : Rat) / 5) [(3, 1), (7, 2), (11, 1), (15, 2), (16, 1)],
  term ((3114 : Rat) / 5) [(3, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1557 : Rat) / 5) [(3, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((-1557 : Rat) / 5) [(3, 1), (11, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 251 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0251_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0251
        rs_R010_ueqv_R010NYN_generator_05_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_05_0251 := by
  native_decide

/-- Coefficient term 252 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0252 : Poly :=
[
  term ((482112 : Rat) / 2995) [(3, 1), (11, 2), (14, 1), (15, 1)]
]

/-- Partial product 252 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0252 : Poly :=
[
  term ((-964224 : Rat) / 2995) [(3, 1), (6, 1), (11, 2), (14, 1), (15, 1)],
  term ((482112 : Rat) / 2995) [(3, 1), (6, 2), (11, 2), (14, 1), (15, 1)],
  term ((482112 : Rat) / 2995) [(3, 1), (7, 2), (11, 2), (14, 1), (15, 1)],
  term ((-482112 : Rat) / 2995) [(3, 1), (11, 2), (14, 1), (15, 3)],
  term ((964224 : Rat) / 2995) [(3, 1), (11, 2), (14, 2), (15, 1)],
  term ((-482112 : Rat) / 2995) [(3, 1), (11, 2), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 252 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0252_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0252
        rs_R010_ueqv_R010NYN_generator_05_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_05_0252 := by
  native_decide

/-- Coefficient term 253 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0253 : Poly :=
[
  term ((5410368 : Rat) / 2995) [(3, 1), (11, 2), (15, 1)]
]

/-- Partial product 253 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0253 : Poly :=
[
  term ((-10820736 : Rat) / 2995) [(3, 1), (6, 1), (11, 2), (15, 1)],
  term ((5410368 : Rat) / 2995) [(3, 1), (6, 2), (11, 2), (15, 1)],
  term ((5410368 : Rat) / 2995) [(3, 1), (7, 2), (11, 2), (15, 1)],
  term ((10820736 : Rat) / 2995) [(3, 1), (11, 2), (14, 1), (15, 1)],
  term ((-5410368 : Rat) / 2995) [(3, 1), (11, 2), (14, 2), (15, 1)],
  term ((-5410368 : Rat) / 2995) [(3, 1), (11, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 253 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0253_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0253
        rs_R010_ueqv_R010NYN_generator_05_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_05_0253 := by
  native_decide

/-- Coefficient term 254 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0254 : Poly :=
[
  term ((2667 : Rat) / 599) [(3, 1), (13, 1)]
]

/-- Partial product 254 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0254 : Poly :=
[
  term ((-5334 : Rat) / 599) [(3, 1), (6, 1), (13, 1)],
  term ((2667 : Rat) / 599) [(3, 1), (6, 2), (13, 1)],
  term ((2667 : Rat) / 599) [(3, 1), (7, 2), (13, 1)],
  term ((5334 : Rat) / 599) [(3, 1), (13, 1), (14, 1)],
  term ((-2667 : Rat) / 599) [(3, 1), (13, 1), (14, 2)],
  term ((-2667 : Rat) / 599) [(3, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 254 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0254_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0254
        rs_R010_ueqv_R010NYN_generator_05_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_05_0254 := by
  native_decide

/-- Coefficient term 255 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0255 : Poly :=
[
  term ((2757312 : Rat) / 2995) [(3, 1), (13, 1), (15, 2)]
]

/-- Partial product 255 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0255 : Poly :=
[
  term ((-5514624 : Rat) / 2995) [(3, 1), (6, 1), (13, 1), (15, 2)],
  term ((2757312 : Rat) / 2995) [(3, 1), (6, 2), (13, 1), (15, 2)],
  term ((2757312 : Rat) / 2995) [(3, 1), (7, 2), (13, 1), (15, 2)],
  term ((5514624 : Rat) / 2995) [(3, 1), (13, 1), (14, 1), (15, 2)],
  term ((-2757312 : Rat) / 2995) [(3, 1), (13, 1), (14, 2), (15, 2)],
  term ((-2757312 : Rat) / 2995) [(3, 1), (13, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 255 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0255_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0255
        rs_R010_ueqv_R010NYN_generator_05_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_05_0255 := by
  native_decide

/-- Coefficient term 256 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0256 : Poly :=
[
  term ((-636 : Rat) / 5) [(3, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 256 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0256 : Poly :=
[
  term ((1272 : Rat) / 5) [(3, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-636 : Rat) / 5) [(3, 1), (6, 2), (13, 1), (15, 2), (16, 1)],
  term ((-636 : Rat) / 5) [(3, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((-1272 : Rat) / 5) [(3, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((636 : Rat) / 5) [(3, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((636 : Rat) / 5) [(3, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 256 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0256_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0256
        rs_R010_ueqv_R010NYN_generator_05_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_05_0256 := by
  native_decide

/-- Coefficient term 257 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0257 : Poly :=
[
  term ((421256 : Rat) / 2995) [(3, 1), (14, 1), (15, 1)]
]

/-- Partial product 257 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0257 : Poly :=
[
  term ((-842512 : Rat) / 2995) [(3, 1), (6, 1), (14, 1), (15, 1)],
  term ((421256 : Rat) / 2995) [(3, 1), (6, 2), (14, 1), (15, 1)],
  term ((421256 : Rat) / 2995) [(3, 1), (7, 2), (14, 1), (15, 1)],
  term ((-421256 : Rat) / 2995) [(3, 1), (14, 1), (15, 3)],
  term ((842512 : Rat) / 2995) [(3, 1), (14, 2), (15, 1)],
  term ((-421256 : Rat) / 2995) [(3, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 257 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0257_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0257
        rs_R010_ueqv_R010NYN_generator_05_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_05_0257 := by
  native_decide

/-- Coefficient term 258 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0258 : Poly :=
[
  term ((-98 : Rat) / 5) [(3, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 258 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0258 : Poly :=
[
  term ((196 : Rat) / 5) [(3, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-98 : Rat) / 5) [(3, 1), (6, 2), (14, 1), (15, 1), (16, 1)],
  term ((-98 : Rat) / 5) [(3, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((98 : Rat) / 5) [(3, 1), (14, 1), (15, 3), (16, 1)],
  term ((-196 : Rat) / 5) [(3, 1), (14, 2), (15, 1), (16, 1)],
  term ((98 : Rat) / 5) [(3, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 258 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0258_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0258
        rs_R010_ueqv_R010NYN_generator_05_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_05_0258 := by
  native_decide

/-- Coefficient term 259 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0259 : Poly :=
[
  term ((95843 : Rat) / 2995) [(3, 1), (15, 1)]
]

/-- Partial product 259 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0259 : Poly :=
[
  term ((-191686 : Rat) / 2995) [(3, 1), (6, 1), (15, 1)],
  term ((95843 : Rat) / 2995) [(3, 1), (6, 2), (15, 1)],
  term ((95843 : Rat) / 2995) [(3, 1), (7, 2), (15, 1)],
  term ((191686 : Rat) / 2995) [(3, 1), (14, 1), (15, 1)],
  term ((-95843 : Rat) / 2995) [(3, 1), (14, 2), (15, 1)],
  term ((-95843 : Rat) / 2995) [(3, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 259 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0259_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0259
        rs_R010_ueqv_R010NYN_generator_05_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_05_0259 := by
  native_decide

/-- Coefficient term 260 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0260 : Poly :=
[
  term ((-44 : Rat) / 5) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 260 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0260 : Poly :=
[
  term ((88 : Rat) / 5) [(3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-44 : Rat) / 5) [(3, 1), (6, 2), (15, 1), (16, 1)],
  term ((-44 : Rat) / 5) [(3, 1), (7, 2), (15, 1), (16, 1)],
  term ((-88 : Rat) / 5) [(3, 1), (14, 1), (15, 1), (16, 1)],
  term ((44 : Rat) / 5) [(3, 1), (14, 2), (15, 1), (16, 1)],
  term ((44 : Rat) / 5) [(3, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 260 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0260_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0260
        rs_R010_ueqv_R010NYN_generator_05_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_05_0260 := by
  native_decide

/-- Coefficient term 261 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0261 : Poly :=
[
  term ((2423808 : Rat) / 2995) [(3, 1), (15, 3)]
]

/-- Partial product 261 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0261 : Poly :=
[
  term ((-4847616 : Rat) / 2995) [(3, 1), (6, 1), (15, 3)],
  term ((2423808 : Rat) / 2995) [(3, 1), (6, 2), (15, 3)],
  term ((2423808 : Rat) / 2995) [(3, 1), (7, 2), (15, 3)],
  term ((4847616 : Rat) / 2995) [(3, 1), (14, 1), (15, 3)],
  term ((-2423808 : Rat) / 2995) [(3, 1), (14, 2), (15, 3)],
  term ((-2423808 : Rat) / 2995) [(3, 1), (15, 5)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 261 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0261_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0261
        rs_R010_ueqv_R010NYN_generator_05_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_05_0261 := by
  native_decide

/-- Coefficient term 262 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0262 : Poly :=
[
  term ((-534 : Rat) / 5) [(3, 1), (15, 3), (16, 1)]
]

/-- Partial product 262 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0262 : Poly :=
[
  term ((1068 : Rat) / 5) [(3, 1), (6, 1), (15, 3), (16, 1)],
  term ((-534 : Rat) / 5) [(3, 1), (6, 2), (15, 3), (16, 1)],
  term ((-534 : Rat) / 5) [(3, 1), (7, 2), (15, 3), (16, 1)],
  term ((-1068 : Rat) / 5) [(3, 1), (14, 1), (15, 3), (16, 1)],
  term ((534 : Rat) / 5) [(3, 1), (14, 2), (15, 3), (16, 1)],
  term ((534 : Rat) / 5) [(3, 1), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 262 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0262_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0262
        rs_R010_ueqv_R010NYN_generator_05_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_05_0262 := by
  native_decide

/-- Coefficient term 263 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0263 : Poly :=
[
  term (-6 : Rat) [(3, 2)]
]

/-- Partial product 263 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0263 : Poly :=
[
  term (12 : Rat) [(3, 2), (6, 1)],
  term (-6 : Rat) [(3, 2), (6, 2)],
  term (-6 : Rat) [(3, 2), (7, 2)],
  term (-12 : Rat) [(3, 2), (14, 1)],
  term (6 : Rat) [(3, 2), (14, 2)],
  term (6 : Rat) [(3, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 263 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0263_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0263
        rs_R010_ueqv_R010NYN_generator_05_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_05_0263 := by
  native_decide

/-- Coefficient term 264 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0264 : Poly :=
[
  term ((2571264 : Rat) / 2995) [(3, 2), (11, 1), (15, 1)]
]

/-- Partial product 264 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0264 : Poly :=
[
  term ((-5142528 : Rat) / 2995) [(3, 2), (6, 1), (11, 1), (15, 1)],
  term ((2571264 : Rat) / 2995) [(3, 2), (6, 2), (11, 1), (15, 1)],
  term ((2571264 : Rat) / 2995) [(3, 2), (7, 2), (11, 1), (15, 1)],
  term ((5142528 : Rat) / 2995) [(3, 2), (11, 1), (14, 1), (15, 1)],
  term ((-2571264 : Rat) / 2995) [(3, 2), (11, 1), (14, 2), (15, 1)],
  term ((-2571264 : Rat) / 2995) [(3, 2), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 264 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0264_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0264
        rs_R010_ueqv_R010NYN_generator_05_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_05_0264 := by
  native_decide

/-- Coefficient term 265 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0265 : Poly :=
[
  term (12 : Rat) [(3, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 265 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0265 : Poly :=
[
  term (-24 : Rat) [(3, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(3, 2), (6, 2), (11, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(3, 2), (7, 2), (11, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(3, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(3, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term (-12 : Rat) [(3, 2), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 265 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0265_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0265
        rs_R010_ueqv_R010NYN_generator_05_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_05_0265 := by
  native_decide

/-- Coefficient term 266 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0266 : Poly :=
[
  term ((-2757312 : Rat) / 2995) [(3, 2), (15, 2)]
]

/-- Partial product 266 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0266 : Poly :=
[
  term ((5514624 : Rat) / 2995) [(3, 2), (6, 1), (15, 2)],
  term ((-2757312 : Rat) / 2995) [(3, 2), (6, 2), (15, 2)],
  term ((-2757312 : Rat) / 2995) [(3, 2), (7, 2), (15, 2)],
  term ((-5514624 : Rat) / 2995) [(3, 2), (14, 1), (15, 2)],
  term ((2757312 : Rat) / 2995) [(3, 2), (14, 2), (15, 2)],
  term ((2757312 : Rat) / 2995) [(3, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 266 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0266_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0266
        rs_R010_ueqv_R010NYN_generator_05_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_05_0266 := by
  native_decide

/-- Coefficient term 267 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0267 : Poly :=
[
  term ((636 : Rat) / 5) [(3, 2), (15, 2), (16, 1)]
]

/-- Partial product 267 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0267 : Poly :=
[
  term ((-1272 : Rat) / 5) [(3, 2), (6, 1), (15, 2), (16, 1)],
  term ((636 : Rat) / 5) [(3, 2), (6, 2), (15, 2), (16, 1)],
  term ((636 : Rat) / 5) [(3, 2), (7, 2), (15, 2), (16, 1)],
  term ((1272 : Rat) / 5) [(3, 2), (14, 1), (15, 2), (16, 1)],
  term ((-636 : Rat) / 5) [(3, 2), (14, 2), (15, 2), (16, 1)],
  term ((-636 : Rat) / 5) [(3, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 267 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0267_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0267
        rs_R010_ueqv_R010NYN_generator_05_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_05_0267 := by
  native_decide

/-- Coefficient term 268 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0268 : Poly :=
[
  term ((23304 : Rat) / 599) [(4, 1), (8, 1)]
]

/-- Partial product 268 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0268 : Poly :=
[
  term ((-46608 : Rat) / 599) [(4, 1), (6, 1), (8, 1)],
  term ((23304 : Rat) / 599) [(4, 1), (6, 2), (8, 1)],
  term ((23304 : Rat) / 599) [(4, 1), (7, 2), (8, 1)],
  term ((46608 : Rat) / 599) [(4, 1), (8, 1), (14, 1)],
  term ((-23304 : Rat) / 599) [(4, 1), (8, 1), (14, 2)],
  term ((-23304 : Rat) / 599) [(4, 1), (8, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 268 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0268_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0268
        rs_R010_ueqv_R010NYN_generator_05_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_05_0268 := by
  native_decide

/-- Coefficient term 269 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0269 : Poly :=
[
  term ((2957952 : Rat) / 2995) [(4, 1), (8, 1), (11, 1), (15, 1)]
]

/-- Partial product 269 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0269 : Poly :=
[
  term ((-5915904 : Rat) / 2995) [(4, 1), (6, 1), (8, 1), (11, 1), (15, 1)],
  term ((2957952 : Rat) / 2995) [(4, 1), (6, 2), (8, 1), (11, 1), (15, 1)],
  term ((2957952 : Rat) / 2995) [(4, 1), (7, 2), (8, 1), (11, 1), (15, 1)],
  term ((5915904 : Rat) / 2995) [(4, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((-2957952 : Rat) / 2995) [(4, 1), (8, 1), (11, 1), (14, 2), (15, 1)],
  term ((-2957952 : Rat) / 2995) [(4, 1), (8, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 269 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0269_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0269
        rs_R010_ueqv_R010NYN_generator_05_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_05_0269 := by
  native_decide

/-- Coefficient term 270 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0270 : Poly :=
[
  term ((-1012 : Rat) / 5) [(4, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 270 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0270 : Poly :=
[
  term ((2024 : Rat) / 5) [(4, 1), (6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1012 : Rat) / 5) [(4, 1), (6, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1012 : Rat) / 5) [(4, 1), (7, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2024 : Rat) / 5) [(4, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1012 : Rat) / 5) [(4, 1), (8, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((1012 : Rat) / 5) [(4, 1), (8, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 270 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0270_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0270
        rs_R010_ueqv_R010NYN_generator_05_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_05_0270 := by
  native_decide

/-- Coefficient term 271 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0271 : Poly :=
[
  term ((-2999808 : Rat) / 2995) [(4, 1), (8, 1), (11, 2)]
]

/-- Partial product 271 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0271 : Poly :=
[
  term ((5999616 : Rat) / 2995) [(4, 1), (6, 1), (8, 1), (11, 2)],
  term ((-2999808 : Rat) / 2995) [(4, 1), (6, 2), (8, 1), (11, 2)],
  term ((-2999808 : Rat) / 2995) [(4, 1), (7, 2), (8, 1), (11, 2)],
  term ((-5999616 : Rat) / 2995) [(4, 1), (8, 1), (11, 2), (14, 1)],
  term ((2999808 : Rat) / 2995) [(4, 1), (8, 1), (11, 2), (14, 2)],
  term ((2999808 : Rat) / 2995) [(4, 1), (8, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 271 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0271_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0271
        rs_R010_ueqv_R010NYN_generator_05_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_05_0271 := by
  native_decide

/-- Coefficient term 272 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0272 : Poly :=
[
  term ((-85344 : Rat) / 2995) [(4, 1), (8, 1), (15, 2)]
]

/-- Partial product 272 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0272 : Poly :=
[
  term ((170688 : Rat) / 2995) [(4, 1), (6, 1), (8, 1), (15, 2)],
  term ((-85344 : Rat) / 2995) [(4, 1), (6, 2), (8, 1), (15, 2)],
  term ((-85344 : Rat) / 2995) [(4, 1), (7, 2), (8, 1), (15, 2)],
  term ((-170688 : Rat) / 2995) [(4, 1), (8, 1), (14, 1), (15, 2)],
  term ((85344 : Rat) / 2995) [(4, 1), (8, 1), (14, 2), (15, 2)],
  term ((85344 : Rat) / 2995) [(4, 1), (8, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 272 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0272_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0272
        rs_R010_ueqv_R010NYN_generator_05_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_05_0272 := by
  native_decide

/-- Coefficient term 273 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0273 : Poly :=
[
  term ((32 : Rat) / 5) [(4, 1), (8, 1), (15, 2), (16, 1)]
]

/-- Partial product 273 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0273 : Poly :=
[
  term ((-64 : Rat) / 5) [(4, 1), (6, 1), (8, 1), (15, 2), (16, 1)],
  term ((32 : Rat) / 5) [(4, 1), (6, 2), (8, 1), (15, 2), (16, 1)],
  term ((32 : Rat) / 5) [(4, 1), (7, 2), (8, 1), (15, 2), (16, 1)],
  term ((64 : Rat) / 5) [(4, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-32 : Rat) / 5) [(4, 1), (8, 1), (14, 2), (15, 2), (16, 1)],
  term ((-32 : Rat) / 5) [(4, 1), (8, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 273 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0273_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0273
        rs_R010_ueqv_R010NYN_generator_05_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_05_0273 := by
  native_decide

/-- Coefficient term 274 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0274 : Poly :=
[
  term ((-1928448 : Rat) / 2995) [(4, 1), (9, 1), (11, 1)]
]

/-- Partial product 274 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0274 : Poly :=
[
  term ((3856896 : Rat) / 2995) [(4, 1), (6, 1), (9, 1), (11, 1)],
  term ((-1928448 : Rat) / 2995) [(4, 1), (6, 2), (9, 1), (11, 1)],
  term ((-1928448 : Rat) / 2995) [(4, 1), (7, 2), (9, 1), (11, 1)],
  term ((-3856896 : Rat) / 2995) [(4, 1), (9, 1), (11, 1), (14, 1)],
  term ((1928448 : Rat) / 2995) [(4, 1), (9, 1), (11, 1), (14, 2)],
  term ((1928448 : Rat) / 2995) [(4, 1), (9, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 274 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0274_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0274
        rs_R010_ueqv_R010NYN_generator_05_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_05_0274 := by
  native_decide

/-- Coefficient term 275 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0275 : Poly :=
[
  term ((1822464 : Rat) / 2995) [(4, 1), (9, 1), (15, 1)]
]

/-- Partial product 275 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0275 : Poly :=
[
  term ((-3644928 : Rat) / 2995) [(4, 1), (6, 1), (9, 1), (15, 1)],
  term ((1822464 : Rat) / 2995) [(4, 1), (6, 2), (9, 1), (15, 1)],
  term ((1822464 : Rat) / 2995) [(4, 1), (7, 2), (9, 1), (15, 1)],
  term ((3644928 : Rat) / 2995) [(4, 1), (9, 1), (14, 1), (15, 1)],
  term ((-1822464 : Rat) / 2995) [(4, 1), (9, 1), (14, 2), (15, 1)],
  term ((-1822464 : Rat) / 2995) [(4, 1), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 275 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0275_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0275
        rs_R010_ueqv_R010NYN_generator_05_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_05_0275 := by
  native_decide

/-- Coefficient term 276 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0276 : Poly :=
[
  term ((-452 : Rat) / 5) [(4, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 276 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0276 : Poly :=
[
  term ((904 : Rat) / 5) [(4, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-452 : Rat) / 5) [(4, 1), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((-452 : Rat) / 5) [(4, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-904 : Rat) / 5) [(4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((452 : Rat) / 5) [(4, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((452 : Rat) / 5) [(4, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 276 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0276_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0276
        rs_R010_ueqv_R010NYN_generator_05_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_05_0276 := by
  native_decide

/-- Coefficient term 277 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0277 : Poly :=
[
  term ((-23304 : Rat) / 599) [(5, 1), (9, 1)]
]

/-- Partial product 277 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0277 : Poly :=
[
  term ((46608 : Rat) / 599) [(5, 1), (6, 1), (9, 1)],
  term ((-23304 : Rat) / 599) [(5, 1), (6, 2), (9, 1)],
  term ((-23304 : Rat) / 599) [(5, 1), (7, 2), (9, 1)],
  term ((-46608 : Rat) / 599) [(5, 1), (9, 1), (14, 1)],
  term ((23304 : Rat) / 599) [(5, 1), (9, 1), (14, 2)],
  term ((23304 : Rat) / 599) [(5, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 277 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0277_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0277
        rs_R010_ueqv_R010NYN_generator_05_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_05_0277 := by
  native_decide

/-- Coefficient term 278 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0278 : Poly :=
[
  term ((-2957952 : Rat) / 2995) [(5, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 278 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0278 : Poly :=
[
  term ((5915904 : Rat) / 2995) [(5, 1), (6, 1), (9, 1), (11, 1), (15, 1)],
  term ((-2957952 : Rat) / 2995) [(5, 1), (6, 2), (9, 1), (11, 1), (15, 1)],
  term ((-2957952 : Rat) / 2995) [(5, 1), (7, 2), (9, 1), (11, 1), (15, 1)],
  term ((-5915904 : Rat) / 2995) [(5, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((2957952 : Rat) / 2995) [(5, 1), (9, 1), (11, 1), (14, 2), (15, 1)],
  term ((2957952 : Rat) / 2995) [(5, 1), (9, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 278 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0278_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0278
        rs_R010_ueqv_R010NYN_generator_05_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_05_0278 := by
  native_decide

/-- Coefficient term 279 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0279 : Poly :=
[
  term ((1012 : Rat) / 5) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 279 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0279 : Poly :=
[
  term ((-2024 : Rat) / 5) [(5, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((1012 : Rat) / 5) [(5, 1), (6, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((1012 : Rat) / 5) [(5, 1), (7, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((2024 : Rat) / 5) [(5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1012 : Rat) / 5) [(5, 1), (9, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1012 : Rat) / 5) [(5, 1), (9, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 279 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0279_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0279
        rs_R010_ueqv_R010NYN_generator_05_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_05_0279 := by
  native_decide

/-- Coefficient term 280 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0280 : Poly :=
[
  term ((2999808 : Rat) / 2995) [(5, 1), (9, 1), (11, 2)]
]

/-- Partial product 280 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0280 : Poly :=
[
  term ((-5999616 : Rat) / 2995) [(5, 1), (6, 1), (9, 1), (11, 2)],
  term ((2999808 : Rat) / 2995) [(5, 1), (6, 2), (9, 1), (11, 2)],
  term ((2999808 : Rat) / 2995) [(5, 1), (7, 2), (9, 1), (11, 2)],
  term ((5999616 : Rat) / 2995) [(5, 1), (9, 1), (11, 2), (14, 1)],
  term ((-2999808 : Rat) / 2995) [(5, 1), (9, 1), (11, 2), (14, 2)],
  term ((-2999808 : Rat) / 2995) [(5, 1), (9, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 280 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0280_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0280
        rs_R010_ueqv_R010NYN_generator_05_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_05_0280 := by
  native_decide

/-- Coefficient term 281 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0281 : Poly :=
[
  term ((85344 : Rat) / 2995) [(5, 1), (9, 1), (15, 2)]
]

/-- Partial product 281 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0281 : Poly :=
[
  term ((-170688 : Rat) / 2995) [(5, 1), (6, 1), (9, 1), (15, 2)],
  term ((85344 : Rat) / 2995) [(5, 1), (6, 2), (9, 1), (15, 2)],
  term ((85344 : Rat) / 2995) [(5, 1), (7, 2), (9, 1), (15, 2)],
  term ((170688 : Rat) / 2995) [(5, 1), (9, 1), (14, 1), (15, 2)],
  term ((-85344 : Rat) / 2995) [(5, 1), (9, 1), (14, 2), (15, 2)],
  term ((-85344 : Rat) / 2995) [(5, 1), (9, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 281 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0281_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0281
        rs_R010_ueqv_R010NYN_generator_05_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_05_0281 := by
  native_decide

/-- Coefficient term 282 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0282 : Poly :=
[
  term ((-32 : Rat) / 5) [(5, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 282 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0282 : Poly :=
[
  term ((64 : Rat) / 5) [(5, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((-32 : Rat) / 5) [(5, 1), (6, 2), (9, 1), (15, 2), (16, 1)],
  term ((-32 : Rat) / 5) [(5, 1), (7, 2), (9, 1), (15, 2), (16, 1)],
  term ((-64 : Rat) / 5) [(5, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((32 : Rat) / 5) [(5, 1), (9, 1), (14, 2), (15, 2), (16, 1)],
  term ((32 : Rat) / 5) [(5, 1), (9, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 282 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0282_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0282
        rs_R010_ueqv_R010NYN_generator_05_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_05_0282 := by
  native_decide

/-- Coefficient term 283 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0283 : Poly :=
[
  term ((-21072 : Rat) / 599) [(6, 1), (8, 1)]
]

/-- Partial product 283 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0283 : Poly :=
[
  term ((-21072 : Rat) / 599) [(6, 1), (7, 2), (8, 1)],
  term ((-42144 : Rat) / 599) [(6, 1), (8, 1), (14, 1)],
  term ((21072 : Rat) / 599) [(6, 1), (8, 1), (14, 2)],
  term ((21072 : Rat) / 599) [(6, 1), (8, 1), (15, 2)],
  term ((42144 : Rat) / 599) [(6, 2), (8, 1)],
  term ((-21072 : Rat) / 599) [(6, 3), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 283 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0283_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0283
        rs_R010_ueqv_R010NYN_generator_05_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_05_0283 := by
  native_decide

/-- Coefficient term 284 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0284 : Poly :=
[
  term ((-4983552 : Rat) / 2995) [(6, 1), (8, 1), (11, 1), (15, 1)]
]

/-- Partial product 284 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0284 : Poly :=
[
  term ((-4983552 : Rat) / 2995) [(6, 1), (7, 2), (8, 1), (11, 1), (15, 1)],
  term ((-9967104 : Rat) / 2995) [(6, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((4983552 : Rat) / 2995) [(6, 1), (8, 1), (11, 1), (14, 2), (15, 1)],
  term ((4983552 : Rat) / 2995) [(6, 1), (8, 1), (11, 1), (15, 3)],
  term ((9967104 : Rat) / 2995) [(6, 2), (8, 1), (11, 1), (15, 1)],
  term ((-4983552 : Rat) / 2995) [(6, 3), (8, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 284 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0284_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0284
        rs_R010_ueqv_R010NYN_generator_05_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_05_0284 := by
  native_decide

/-- Coefficient term 285 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0285 : Poly :=
[
  term ((948 : Rat) / 5) [(6, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 285 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0285 : Poly :=
[
  term ((948 : Rat) / 5) [(6, 1), (7, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((1896 : Rat) / 5) [(6, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-948 : Rat) / 5) [(6, 1), (8, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-948 : Rat) / 5) [(6, 1), (8, 1), (11, 1), (15, 3), (16, 1)],
  term ((-1896 : Rat) / 5) [(6, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((948 : Rat) / 5) [(6, 3), (8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 285 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0285_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0285
        rs_R010_ueqv_R010NYN_generator_05_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_05_0285 := by
  native_decide

/-- Coefficient term 286 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0286 : Poly :=
[
  term ((2892672 : Rat) / 2995) [(6, 1), (8, 1), (11, 2)]
]

/-- Partial product 286 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0286 : Poly :=
[
  term ((2892672 : Rat) / 2995) [(6, 1), (7, 2), (8, 1), (11, 2)],
  term ((5785344 : Rat) / 2995) [(6, 1), (8, 1), (11, 2), (14, 1)],
  term ((-2892672 : Rat) / 2995) [(6, 1), (8, 1), (11, 2), (14, 2)],
  term ((-2892672 : Rat) / 2995) [(6, 1), (8, 1), (11, 2), (15, 2)],
  term ((-5785344 : Rat) / 2995) [(6, 2), (8, 1), (11, 2)],
  term ((2892672 : Rat) / 2995) [(6, 3), (8, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 286 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0286_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0286
        rs_R010_ueqv_R010NYN_generator_05_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_05_0286 := by
  native_decide

/-- Coefficient term 287 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0287 : Poly :=
[
  term ((2423808 : Rat) / 2995) [(6, 1), (8, 1), (15, 2)]
]

/-- Partial product 287 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0287 : Poly :=
[
  term ((2423808 : Rat) / 2995) [(6, 1), (7, 2), (8, 1), (15, 2)],
  term ((4847616 : Rat) / 2995) [(6, 1), (8, 1), (14, 1), (15, 2)],
  term ((-2423808 : Rat) / 2995) [(6, 1), (8, 1), (14, 2), (15, 2)],
  term ((-2423808 : Rat) / 2995) [(6, 1), (8, 1), (15, 4)],
  term ((-4847616 : Rat) / 2995) [(6, 2), (8, 1), (15, 2)],
  term ((2423808 : Rat) / 2995) [(6, 3), (8, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 287 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0287_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0287
        rs_R010_ueqv_R010NYN_generator_05_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_05_0287 := by
  native_decide

/-- Coefficient term 288 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0288 : Poly :=
[
  term ((-534 : Rat) / 5) [(6, 1), (8, 1), (15, 2), (16, 1)]
]

/-- Partial product 288 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0288 : Poly :=
[
  term ((-534 : Rat) / 5) [(6, 1), (7, 2), (8, 1), (15, 2), (16, 1)],
  term ((-1068 : Rat) / 5) [(6, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((534 : Rat) / 5) [(6, 1), (8, 1), (14, 2), (15, 2), (16, 1)],
  term ((534 : Rat) / 5) [(6, 1), (8, 1), (15, 4), (16, 1)],
  term ((1068 : Rat) / 5) [(6, 2), (8, 1), (15, 2), (16, 1)],
  term ((-534 : Rat) / 5) [(6, 3), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 288 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0288_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0288
        rs_R010_ueqv_R010NYN_generator_05_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_05_0288 := by
  native_decide

/-- Coefficient term 289 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0289 : Poly :=
[
  term ((160704 : Rat) / 2995) [(6, 1), (9, 1), (11, 1)]
]

/-- Partial product 289 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0289 : Poly :=
[
  term ((160704 : Rat) / 2995) [(6, 1), (7, 2), (9, 1), (11, 1)],
  term ((321408 : Rat) / 2995) [(6, 1), (9, 1), (11, 1), (14, 1)],
  term ((-160704 : Rat) / 2995) [(6, 1), (9, 1), (11, 1), (14, 2)],
  term ((-160704 : Rat) / 2995) [(6, 1), (9, 1), (11, 1), (15, 2)],
  term ((-321408 : Rat) / 2995) [(6, 2), (9, 1), (11, 1)],
  term ((160704 : Rat) / 2995) [(6, 3), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 289 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0289_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0289
        rs_R010_ueqv_R010NYN_generator_05_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_05_0289 := by
  native_decide

/-- Coefficient term 290 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0290 : Poly :=
[
  term ((56448 : Rat) / 2995) [(6, 1), (9, 1), (15, 1)]
]

/-- Partial product 290 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0290 : Poly :=
[
  term ((56448 : Rat) / 2995) [(6, 1), (7, 2), (9, 1), (15, 1)],
  term ((112896 : Rat) / 2995) [(6, 1), (9, 1), (14, 1), (15, 1)],
  term ((-56448 : Rat) / 2995) [(6, 1), (9, 1), (14, 2), (15, 1)],
  term ((-56448 : Rat) / 2995) [(6, 1), (9, 1), (15, 3)],
  term ((-112896 : Rat) / 2995) [(6, 2), (9, 1), (15, 1)],
  term ((56448 : Rat) / 2995) [(6, 3), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 290 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0290_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0290
        rs_R010_ueqv_R010NYN_generator_05_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_05_0290 := by
  native_decide

/-- Coefficient term 291 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0291 : Poly :=
[
  term ((26 : Rat) / 5) [(6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 291 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0291 : Poly :=
[
  term ((26 : Rat) / 5) [(6, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((52 : Rat) / 5) [(6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-26 : Rat) / 5) [(6, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-26 : Rat) / 5) [(6, 1), (9, 1), (15, 3), (16, 1)],
  term ((-52 : Rat) / 5) [(6, 2), (9, 1), (15, 1), (16, 1)],
  term ((26 : Rat) / 5) [(6, 3), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 291 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0291_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0291
        rs_R010_ueqv_R010NYN_generator_05_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_05_0291 := by
  native_decide

/-- Coefficient term 292 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0292 : Poly :=
[
  term ((21072 : Rat) / 599) [(7, 1), (9, 1)]
]

/-- Partial product 292 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0292 : Poly :=
[
  term ((-42144 : Rat) / 599) [(6, 1), (7, 1), (9, 1)],
  term ((21072 : Rat) / 599) [(6, 2), (7, 1), (9, 1)],
  term ((42144 : Rat) / 599) [(7, 1), (9, 1), (14, 1)],
  term ((-21072 : Rat) / 599) [(7, 1), (9, 1), (14, 2)],
  term ((-21072 : Rat) / 599) [(7, 1), (9, 1), (15, 2)],
  term ((21072 : Rat) / 599) [(7, 3), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 292 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0292_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0292
        rs_R010_ueqv_R010NYN_generator_05_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_05_0292 := by
  native_decide

/-- Coefficient term 293 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0293 : Poly :=
[
  term ((4983552 : Rat) / 2995) [(7, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 293 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0293 : Poly :=
[
  term ((-9967104 : Rat) / 2995) [(6, 1), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((4983552 : Rat) / 2995) [(6, 2), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((9967104 : Rat) / 2995) [(7, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((-4983552 : Rat) / 2995) [(7, 1), (9, 1), (11, 1), (14, 2), (15, 1)],
  term ((-4983552 : Rat) / 2995) [(7, 1), (9, 1), (11, 1), (15, 3)],
  term ((4983552 : Rat) / 2995) [(7, 3), (9, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 293 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0293_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0293
        rs_R010_ueqv_R010NYN_generator_05_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_05_0293 := by
  native_decide

/-- Coefficient term 294 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0294 : Poly :=
[
  term ((-948 : Rat) / 5) [(7, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 294 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0294 : Poly :=
[
  term ((1896 : Rat) / 5) [(6, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-948 : Rat) / 5) [(6, 2), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1896 : Rat) / 5) [(7, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((948 : Rat) / 5) [(7, 1), (9, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((948 : Rat) / 5) [(7, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((-948 : Rat) / 5) [(7, 3), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 294 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0294_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0294
        rs_R010_ueqv_R010NYN_generator_05_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_05_0294 := by
  native_decide

/-- Coefficient term 295 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0295 : Poly :=
[
  term ((-2892672 : Rat) / 2995) [(7, 1), (9, 1), (11, 2)]
]

/-- Partial product 295 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0295 : Poly :=
[
  term ((5785344 : Rat) / 2995) [(6, 1), (7, 1), (9, 1), (11, 2)],
  term ((-2892672 : Rat) / 2995) [(6, 2), (7, 1), (9, 1), (11, 2)],
  term ((-5785344 : Rat) / 2995) [(7, 1), (9, 1), (11, 2), (14, 1)],
  term ((2892672 : Rat) / 2995) [(7, 1), (9, 1), (11, 2), (14, 2)],
  term ((2892672 : Rat) / 2995) [(7, 1), (9, 1), (11, 2), (15, 2)],
  term ((-2892672 : Rat) / 2995) [(7, 3), (9, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 295 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0295_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0295
        rs_R010_ueqv_R010NYN_generator_05_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_05_0295 := by
  native_decide

/-- Coefficient term 296 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0296 : Poly :=
[
  term ((-2423808 : Rat) / 2995) [(7, 1), (9, 1), (15, 2)]
]

/-- Partial product 296 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0296 : Poly :=
[
  term ((4847616 : Rat) / 2995) [(6, 1), (7, 1), (9, 1), (15, 2)],
  term ((-2423808 : Rat) / 2995) [(6, 2), (7, 1), (9, 1), (15, 2)],
  term ((-4847616 : Rat) / 2995) [(7, 1), (9, 1), (14, 1), (15, 2)],
  term ((2423808 : Rat) / 2995) [(7, 1), (9, 1), (14, 2), (15, 2)],
  term ((2423808 : Rat) / 2995) [(7, 1), (9, 1), (15, 4)],
  term ((-2423808 : Rat) / 2995) [(7, 3), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 296 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0296_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0296
        rs_R010_ueqv_R010NYN_generator_05_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_05_0296 := by
  native_decide

/-- Coefficient term 297 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0297 : Poly :=
[
  term ((534 : Rat) / 5) [(7, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 297 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0297 : Poly :=
[
  term ((-1068 : Rat) / 5) [(6, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((534 : Rat) / 5) [(6, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((1068 : Rat) / 5) [(7, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-534 : Rat) / 5) [(7, 1), (9, 1), (14, 2), (15, 2), (16, 1)],
  term ((-534 : Rat) / 5) [(7, 1), (9, 1), (15, 4), (16, 1)],
  term ((534 : Rat) / 5) [(7, 3), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 297 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0297_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0297
        rs_R010_ueqv_R010NYN_generator_05_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_05_0297 := by
  native_decide

/-- Coefficient term 298 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0298 : Poly :=
[
  term ((23922 : Rat) / 599) [(8, 1)]
]

/-- Partial product 298 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0298 : Poly :=
[
  term ((-47844 : Rat) / 599) [(6, 1), (8, 1)],
  term ((23922 : Rat) / 599) [(6, 2), (8, 1)],
  term ((23922 : Rat) / 599) [(7, 2), (8, 1)],
  term ((47844 : Rat) / 599) [(8, 1), (14, 1)],
  term ((-23922 : Rat) / 599) [(8, 1), (14, 2)],
  term ((-23922 : Rat) / 599) [(8, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 298 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0298_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0298
        rs_R010_ueqv_R010NYN_generator_05_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_05_0298 := by
  native_decide

/-- Coefficient term 299 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYN_coefficient_05_0299 : Poly :=
[
  term ((3722976 : Rat) / 2995) [(8, 1), (9, 1), (11, 1)]
]

/-- Partial product 299 for generator 5. -/
def rs_R010_ueqv_R010NYN_partial_05_0299 : Poly :=
[
  term ((-7445952 : Rat) / 2995) [(6, 1), (8, 1), (9, 1), (11, 1)],
  term ((3722976 : Rat) / 2995) [(6, 2), (8, 1), (9, 1), (11, 1)],
  term ((3722976 : Rat) / 2995) [(7, 2), (8, 1), (9, 1), (11, 1)],
  term ((7445952 : Rat) / 2995) [(8, 1), (9, 1), (11, 1), (14, 1)],
  term ((-3722976 : Rat) / 2995) [(8, 1), (9, 1), (11, 1), (14, 2)],
  term ((-3722976 : Rat) / 2995) [(8, 1), (9, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 299 for generator 5. -/
theorem rs_R010_ueqv_R010NYN_partial_05_0299_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_05_0299
        rs_R010_ueqv_R010NYN_generator_05_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_05_0299 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010NYN_partials_05_0200_0299 : List Poly :=
[
  rs_R010_ueqv_R010NYN_partial_05_0200,
  rs_R010_ueqv_R010NYN_partial_05_0201,
  rs_R010_ueqv_R010NYN_partial_05_0202,
  rs_R010_ueqv_R010NYN_partial_05_0203,
  rs_R010_ueqv_R010NYN_partial_05_0204,
  rs_R010_ueqv_R010NYN_partial_05_0205,
  rs_R010_ueqv_R010NYN_partial_05_0206,
  rs_R010_ueqv_R010NYN_partial_05_0207,
  rs_R010_ueqv_R010NYN_partial_05_0208,
  rs_R010_ueqv_R010NYN_partial_05_0209,
  rs_R010_ueqv_R010NYN_partial_05_0210,
  rs_R010_ueqv_R010NYN_partial_05_0211,
  rs_R010_ueqv_R010NYN_partial_05_0212,
  rs_R010_ueqv_R010NYN_partial_05_0213,
  rs_R010_ueqv_R010NYN_partial_05_0214,
  rs_R010_ueqv_R010NYN_partial_05_0215,
  rs_R010_ueqv_R010NYN_partial_05_0216,
  rs_R010_ueqv_R010NYN_partial_05_0217,
  rs_R010_ueqv_R010NYN_partial_05_0218,
  rs_R010_ueqv_R010NYN_partial_05_0219,
  rs_R010_ueqv_R010NYN_partial_05_0220,
  rs_R010_ueqv_R010NYN_partial_05_0221,
  rs_R010_ueqv_R010NYN_partial_05_0222,
  rs_R010_ueqv_R010NYN_partial_05_0223,
  rs_R010_ueqv_R010NYN_partial_05_0224,
  rs_R010_ueqv_R010NYN_partial_05_0225,
  rs_R010_ueqv_R010NYN_partial_05_0226,
  rs_R010_ueqv_R010NYN_partial_05_0227,
  rs_R010_ueqv_R010NYN_partial_05_0228,
  rs_R010_ueqv_R010NYN_partial_05_0229,
  rs_R010_ueqv_R010NYN_partial_05_0230,
  rs_R010_ueqv_R010NYN_partial_05_0231,
  rs_R010_ueqv_R010NYN_partial_05_0232,
  rs_R010_ueqv_R010NYN_partial_05_0233,
  rs_R010_ueqv_R010NYN_partial_05_0234,
  rs_R010_ueqv_R010NYN_partial_05_0235,
  rs_R010_ueqv_R010NYN_partial_05_0236,
  rs_R010_ueqv_R010NYN_partial_05_0237,
  rs_R010_ueqv_R010NYN_partial_05_0238,
  rs_R010_ueqv_R010NYN_partial_05_0239,
  rs_R010_ueqv_R010NYN_partial_05_0240,
  rs_R010_ueqv_R010NYN_partial_05_0241,
  rs_R010_ueqv_R010NYN_partial_05_0242,
  rs_R010_ueqv_R010NYN_partial_05_0243,
  rs_R010_ueqv_R010NYN_partial_05_0244,
  rs_R010_ueqv_R010NYN_partial_05_0245,
  rs_R010_ueqv_R010NYN_partial_05_0246,
  rs_R010_ueqv_R010NYN_partial_05_0247,
  rs_R010_ueqv_R010NYN_partial_05_0248,
  rs_R010_ueqv_R010NYN_partial_05_0249,
  rs_R010_ueqv_R010NYN_partial_05_0250,
  rs_R010_ueqv_R010NYN_partial_05_0251,
  rs_R010_ueqv_R010NYN_partial_05_0252,
  rs_R010_ueqv_R010NYN_partial_05_0253,
  rs_R010_ueqv_R010NYN_partial_05_0254,
  rs_R010_ueqv_R010NYN_partial_05_0255,
  rs_R010_ueqv_R010NYN_partial_05_0256,
  rs_R010_ueqv_R010NYN_partial_05_0257,
  rs_R010_ueqv_R010NYN_partial_05_0258,
  rs_R010_ueqv_R010NYN_partial_05_0259,
  rs_R010_ueqv_R010NYN_partial_05_0260,
  rs_R010_ueqv_R010NYN_partial_05_0261,
  rs_R010_ueqv_R010NYN_partial_05_0262,
  rs_R010_ueqv_R010NYN_partial_05_0263,
  rs_R010_ueqv_R010NYN_partial_05_0264,
  rs_R010_ueqv_R010NYN_partial_05_0265,
  rs_R010_ueqv_R010NYN_partial_05_0266,
  rs_R010_ueqv_R010NYN_partial_05_0267,
  rs_R010_ueqv_R010NYN_partial_05_0268,
  rs_R010_ueqv_R010NYN_partial_05_0269,
  rs_R010_ueqv_R010NYN_partial_05_0270,
  rs_R010_ueqv_R010NYN_partial_05_0271,
  rs_R010_ueqv_R010NYN_partial_05_0272,
  rs_R010_ueqv_R010NYN_partial_05_0273,
  rs_R010_ueqv_R010NYN_partial_05_0274,
  rs_R010_ueqv_R010NYN_partial_05_0275,
  rs_R010_ueqv_R010NYN_partial_05_0276,
  rs_R010_ueqv_R010NYN_partial_05_0277,
  rs_R010_ueqv_R010NYN_partial_05_0278,
  rs_R010_ueqv_R010NYN_partial_05_0279,
  rs_R010_ueqv_R010NYN_partial_05_0280,
  rs_R010_ueqv_R010NYN_partial_05_0281,
  rs_R010_ueqv_R010NYN_partial_05_0282,
  rs_R010_ueqv_R010NYN_partial_05_0283,
  rs_R010_ueqv_R010NYN_partial_05_0284,
  rs_R010_ueqv_R010NYN_partial_05_0285,
  rs_R010_ueqv_R010NYN_partial_05_0286,
  rs_R010_ueqv_R010NYN_partial_05_0287,
  rs_R010_ueqv_R010NYN_partial_05_0288,
  rs_R010_ueqv_R010NYN_partial_05_0289,
  rs_R010_ueqv_R010NYN_partial_05_0290,
  rs_R010_ueqv_R010NYN_partial_05_0291,
  rs_R010_ueqv_R010NYN_partial_05_0292,
  rs_R010_ueqv_R010NYN_partial_05_0293,
  rs_R010_ueqv_R010NYN_partial_05_0294,
  rs_R010_ueqv_R010NYN_partial_05_0295,
  rs_R010_ueqv_R010NYN_partial_05_0296,
  rs_R010_ueqv_R010NYN_partial_05_0297,
  rs_R010_ueqv_R010NYN_partial_05_0298,
  rs_R010_ueqv_R010NYN_partial_05_0299
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010NYN_block_05_0200_0299 : Poly :=
[
  term ((-5678208 : Rat) / 2995) [(2, 1), (6, 1), (11, 2), (14, 1)],
  term ((964224 : Rat) / 2995) [(2, 1), (6, 1), (11, 2), (15, 2)],
  term ((776692 : Rat) / 2995) [(2, 1), (6, 1), (13, 1), (15, 1)],
  term ((-176 : Rat) / 5) [(2, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((39332 : Rat) / 599) [(2, 1), (6, 1), (14, 1)],
  term ((-4847616 : Rat) / 2995) [(2, 1), (6, 1), (14, 1), (15, 2)],
  term ((1068 : Rat) / 5) [(2, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-382960 : Rat) / 599) [(2, 1), (6, 1), (15, 2)],
  term (88 : Rat) [(2, 1), (6, 1), (15, 2), (16, 1)],
  term ((2839104 : Rat) / 2995) [(2, 1), (6, 2), (11, 2), (14, 1)],
  term ((-482112 : Rat) / 2995) [(2, 1), (6, 2), (11, 2), (15, 2)],
  term ((-388346 : Rat) / 2995) [(2, 1), (6, 2), (13, 1), (15, 1)],
  term ((88 : Rat) / 5) [(2, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-19666 : Rat) / 599) [(2, 1), (6, 2), (14, 1)],
  term ((2423808 : Rat) / 2995) [(2, 1), (6, 2), (14, 1), (15, 2)],
  term ((-534 : Rat) / 5) [(2, 1), (6, 2), (14, 1), (15, 2), (16, 1)],
  term ((191480 : Rat) / 599) [(2, 1), (6, 2), (15, 2)],
  term (-44 : Rat) [(2, 1), (6, 2), (15, 2), (16, 1)],
  term ((2839104 : Rat) / 2995) [(2, 1), (7, 2), (11, 2), (14, 1)],
  term ((-482112 : Rat) / 2995) [(2, 1), (7, 2), (11, 2), (15, 2)],
  term ((-388346 : Rat) / 2995) [(2, 1), (7, 2), (13, 1), (15, 1)],
  term ((88 : Rat) / 5) [(2, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-19666 : Rat) / 599) [(2, 1), (7, 2), (14, 1)],
  term ((2423808 : Rat) / 2995) [(2, 1), (7, 2), (14, 1), (15, 2)],
  term ((-534 : Rat) / 5) [(2, 1), (7, 2), (14, 1), (15, 2), (16, 1)],
  term ((191480 : Rat) / 599) [(2, 1), (7, 2), (15, 2)],
  term (-44 : Rat) [(2, 1), (7, 2), (15, 2), (16, 1)],
  term ((-3803328 : Rat) / 2995) [(2, 1), (11, 2), (14, 1), (15, 2)],
  term ((5678208 : Rat) / 2995) [(2, 1), (11, 2), (14, 2)],
  term ((482112 : Rat) / 2995) [(2, 1), (11, 2), (14, 2), (15, 2)],
  term ((-2839104 : Rat) / 2995) [(2, 1), (11, 2), (14, 3)],
  term ((482112 : Rat) / 2995) [(2, 1), (11, 2), (15, 4)],
  term ((-776692 : Rat) / 2995) [(2, 1), (13, 1), (14, 1), (15, 1)],
  term ((176 : Rat) / 5) [(2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((388346 : Rat) / 2995) [(2, 1), (13, 1), (14, 2), (15, 1)],
  term ((-88 : Rat) / 5) [(2, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((388346 : Rat) / 2995) [(2, 1), (13, 1), (15, 3)],
  term ((-88 : Rat) / 5) [(2, 1), (13, 1), (15, 3), (16, 1)],
  term ((402626 : Rat) / 599) [(2, 1), (14, 1), (15, 2)],
  term (-88 : Rat) [(2, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2423808 : Rat) / 2995) [(2, 1), (14, 1), (15, 4)],
  term ((534 : Rat) / 5) [(2, 1), (14, 1), (15, 4), (16, 1)],
  term ((-39332 : Rat) / 599) [(2, 1), (14, 2)],
  term ((3890216 : Rat) / 2995) [(2, 1), (14, 2), (15, 2)],
  term ((-848 : Rat) / 5) [(2, 1), (14, 2), (15, 2), (16, 1)],
  term ((19666 : Rat) / 599) [(2, 1), (14, 3)],
  term ((-2423808 : Rat) / 2995) [(2, 1), (14, 3), (15, 2)],
  term ((534 : Rat) / 5) [(2, 1), (14, 3), (15, 2), (16, 1)],
  term ((-191480 : Rat) / 599) [(2, 1), (15, 4)],
  term (44 : Rat) [(2, 1), (15, 4), (16, 1)],
  term (12 : Rat) [(2, 2), (6, 1)],
  term (-24 : Rat) [(2, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(2, 2), (6, 2)],
  term (12 : Rat) [(2, 2), (6, 2), (11, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(2, 2), (7, 2)],
  term (12 : Rat) [(2, 2), (7, 2), (11, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(2, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(2, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term (-12 : Rat) [(2, 2), (11, 1), (15, 3), (16, 1)],
  term (-12 : Rat) [(2, 2), (14, 1)],
  term (6 : Rat) [(2, 2), (14, 2)],
  term (6 : Rat) [(2, 2), (15, 2)],
  term ((5142528 : Rat) / 2995) [(3, 1), (6, 1), (7, 1), (9, 1), (11, 1)],
  term ((-5514624 : Rat) / 2995) [(3, 1), (6, 1), (7, 1), (9, 1), (15, 1)],
  term ((1272 : Rat) / 5) [(3, 1), (6, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((2571264 : Rat) / 2995) [(3, 1), (6, 1), (7, 2), (8, 1), (11, 1)],
  term ((-2757312 : Rat) / 2995) [(3, 1), (6, 1), (7, 2), (8, 1), (15, 1)],
  term ((636 : Rat) / 5) [(3, 1), (6, 1), (7, 2), (8, 1), (15, 1), (16, 1)],
  term ((5142528 : Rat) / 2995) [(3, 1), (6, 1), (8, 1), (10, 1), (11, 1)],
  term ((-5514624 : Rat) / 2995) [(3, 1), (6, 1), (8, 1), (10, 1), (15, 1)],
  term ((1272 : Rat) / 5) [(3, 1), (6, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((6856704 : Rat) / 2995) [(3, 1), (6, 1), (8, 1), (11, 1)],
  term ((1714176 : Rat) / 599) [(3, 1), (6, 1), (8, 1), (11, 1), (14, 1)],
  term ((-2571264 : Rat) / 2995) [(3, 1), (6, 1), (8, 1), (11, 1), (14, 2)],
  term ((-2571264 : Rat) / 2995) [(3, 1), (6, 1), (8, 1), (11, 1), (15, 2)],
  term ((-1838208 : Rat) / 599) [(3, 1), (6, 1), (8, 1), (14, 1), (15, 1)],
  term (424 : Rat) [(3, 1), (6, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((2757312 : Rat) / 2995) [(3, 1), (6, 1), (8, 1), (14, 2), (15, 1)],
  term ((-636 : Rat) / 5) [(3, 1), (6, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((-7352832 : Rat) / 2995) [(3, 1), (6, 1), (8, 1), (15, 1)],
  term ((1696 : Rat) / 5) [(3, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((2757312 : Rat) / 2995) [(3, 1), (6, 1), (8, 1), (15, 3)],
  term ((-636 : Rat) / 5) [(3, 1), (6, 1), (8, 1), (15, 3), (16, 1)],
  term (-12 : Rat) [(3, 1), (6, 1), (9, 1)],
  term ((-916992 : Rat) / 2995) [(3, 1), (6, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((144 : Rat) / 5) [(3, 1), (6, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-137088 : Rat) / 2995) [(3, 1), (6, 1), (9, 1), (11, 1), (15, 1)],
  term ((552 : Rat) / 5) [(3, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((321408 : Rat) / 2995) [(3, 1), (6, 1), (9, 1), (11, 2)],
  term ((642816 : Rat) / 2995) [(3, 1), (6, 1), (9, 1), (11, 2), (14, 1)],
  term (-24 : Rat) [(3, 1), (6, 1), (9, 1), (14, 1)],
  term ((196992 : Rat) / 2995) [(3, 1), (6, 1), (9, 1), (14, 1), (15, 2)],
  term ((24 : Rat) / 5) [(3, 1), (6, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((32832 : Rat) / 2995) [(3, 1), (6, 1), (9, 1), (15, 2)],
  term ((4 : Rat) / 5) [(3, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((-642816 : Rat) / 599) [(3, 1), (6, 1), (10, 1), (11, 1)],
  term ((-5142528 : Rat) / 2995) [(3, 1), (6, 1), (10, 1), (11, 1), (14, 1)],
  term ((5514624 : Rat) / 2995) [(3, 1), (6, 1), (10, 1), (14, 1), (15, 1)],
  term ((-1272 : Rat) / 5) [(3, 1), (6, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((634776 : Rat) / 599) [(3, 1), (6, 1), (10, 1), (15, 1)],
  term (-140 : Rat) [(3, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((325872 : Rat) / 2995) [(3, 1), (6, 1), (11, 1)],
  term ((5142528 : Rat) / 2995) [(3, 1), (6, 1), (11, 1), (13, 1), (15, 1)],
  term (12 : Rat) [(3, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((651744 : Rat) / 2995) [(3, 1), (6, 1), (11, 1), (14, 1)],
  term ((732672 : Rat) / 2995) [(3, 1), (6, 1), (11, 1), (14, 1), (15, 2)],
  term ((-396 : Rat) / 5) [(3, 1), (6, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((3106848 : Rat) / 599) [(3, 1), (6, 1), (11, 1), (15, 2)],
  term ((-3114 : Rat) / 5) [(3, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((-964224 : Rat) / 2995) [(3, 1), (6, 1), (11, 2), (14, 1), (15, 1)],
  term ((-10820736 : Rat) / 2995) [(3, 1), (6, 1), (11, 2), (15, 1)],
  term ((-5334 : Rat) / 599) [(3, 1), (6, 1), (13, 1)],
  term ((-5514624 : Rat) / 2995) [(3, 1), (6, 1), (13, 1), (15, 2)],
  term ((1272 : Rat) / 5) [(3, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-842512 : Rat) / 2995) [(3, 1), (6, 1), (14, 1), (15, 1)],
  term ((196 : Rat) / 5) [(3, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-191686 : Rat) / 2995) [(3, 1), (6, 1), (15, 1)],
  term ((88 : Rat) / 5) [(3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-4847616 : Rat) / 2995) [(3, 1), (6, 1), (15, 3)],
  term ((1068 : Rat) / 5) [(3, 1), (6, 1), (15, 3), (16, 1)],
  term ((-2571264 : Rat) / 2995) [(3, 1), (6, 2), (7, 1), (9, 1), (11, 1)],
  term ((2757312 : Rat) / 2995) [(3, 1), (6, 2), (7, 1), (9, 1), (15, 1)],
  term ((-636 : Rat) / 5) [(3, 1), (6, 2), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-2571264 : Rat) / 2995) [(3, 1), (6, 2), (8, 1), (10, 1), (11, 1)],
  term ((2757312 : Rat) / 2995) [(3, 1), (6, 2), (8, 1), (10, 1), (15, 1)],
  term ((-636 : Rat) / 5) [(3, 1), (6, 2), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1714176 : Rat) / 599) [(3, 1), (6, 2), (8, 1), (11, 1)],
  term ((-1714176 : Rat) / 2995) [(3, 1), (6, 2), (8, 1), (11, 1), (14, 1)],
  term ((1838208 : Rat) / 2995) [(3, 1), (6, 2), (8, 1), (14, 1), (15, 1)],
  term ((-424 : Rat) / 5) [(3, 1), (6, 2), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((1838208 : Rat) / 599) [(3, 1), (6, 2), (8, 1), (15, 1)],
  term (-424 : Rat) [(3, 1), (6, 2), (8, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(3, 1), (6, 2), (9, 1)],
  term ((458496 : Rat) / 2995) [(3, 1), (6, 2), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((-72 : Rat) / 5) [(3, 1), (6, 2), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((68544 : Rat) / 2995) [(3, 1), (6, 2), (9, 1), (11, 1), (15, 1)],
  term ((-276 : Rat) / 5) [(3, 1), (6, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-160704 : Rat) / 2995) [(3, 1), (6, 2), (9, 1), (11, 2)],
  term ((-321408 : Rat) / 2995) [(3, 1), (6, 2), (9, 1), (11, 2), (14, 1)],
  term (12 : Rat) [(3, 1), (6, 2), (9, 1), (14, 1)],
  term ((-98496 : Rat) / 2995) [(3, 1), (6, 2), (9, 1), (14, 1), (15, 2)],
  term ((-12 : Rat) / 5) [(3, 1), (6, 2), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-16416 : Rat) / 2995) [(3, 1), (6, 2), (9, 1), (15, 2)],
  term ((-2 : Rat) / 5) [(3, 1), (6, 2), (9, 1), (15, 2), (16, 1)],
  term ((321408 : Rat) / 599) [(3, 1), (6, 2), (10, 1), (11, 1)],
  term ((2571264 : Rat) / 2995) [(3, 1), (6, 2), (10, 1), (11, 1), (14, 1)],
  term ((-2757312 : Rat) / 2995) [(3, 1), (6, 2), (10, 1), (14, 1), (15, 1)],
  term ((636 : Rat) / 5) [(3, 1), (6, 2), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-317388 : Rat) / 599) [(3, 1), (6, 2), (10, 1), (15, 1)],
  term (70 : Rat) [(3, 1), (6, 2), (10, 1), (15, 1), (16, 1)],
  term ((-162936 : Rat) / 2995) [(3, 1), (6, 2), (11, 1)],
  term ((-2571264 : Rat) / 2995) [(3, 1), (6, 2), (11, 1), (13, 1), (15, 1)],
  term (-6 : Rat) [(3, 1), (6, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-325872 : Rat) / 2995) [(3, 1), (6, 2), (11, 1), (14, 1)],
  term ((-366336 : Rat) / 2995) [(3, 1), (6, 2), (11, 1), (14, 1), (15, 2)],
  term ((198 : Rat) / 5) [(3, 1), (6, 2), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1553424 : Rat) / 599) [(3, 1), (6, 2), (11, 1), (15, 2)],
  term ((1557 : Rat) / 5) [(3, 1), (6, 2), (11, 1), (15, 2), (16, 1)],
  term ((482112 : Rat) / 2995) [(3, 1), (6, 2), (11, 2), (14, 1), (15, 1)],
  term ((5410368 : Rat) / 2995) [(3, 1), (6, 2), (11, 2), (15, 1)],
  term ((2667 : Rat) / 599) [(3, 1), (6, 2), (13, 1)],
  term ((2757312 : Rat) / 2995) [(3, 1), (6, 2), (13, 1), (15, 2)],
  term ((-636 : Rat) / 5) [(3, 1), (6, 2), (13, 1), (15, 2), (16, 1)],
  term ((421256 : Rat) / 2995) [(3, 1), (6, 2), (14, 1), (15, 1)],
  term ((-98 : Rat) / 5) [(3, 1), (6, 2), (14, 1), (15, 1), (16, 1)],
  term ((95843 : Rat) / 2995) [(3, 1), (6, 2), (15, 1)],
  term ((-44 : Rat) / 5) [(3, 1), (6, 2), (15, 1), (16, 1)],
  term ((2423808 : Rat) / 2995) [(3, 1), (6, 2), (15, 3)],
  term ((-534 : Rat) / 5) [(3, 1), (6, 2), (15, 3), (16, 1)],
  term ((2571264 : Rat) / 2995) [(3, 1), (6, 3), (8, 1), (11, 1)],
  term ((-2757312 : Rat) / 2995) [(3, 1), (6, 3), (8, 1), (15, 1)],
  term ((636 : Rat) / 5) [(3, 1), (6, 3), (8, 1), (15, 1), (16, 1)],
  term ((-5142528 : Rat) / 2995) [(3, 1), (7, 1), (9, 1), (11, 1), (14, 1)],
  term ((2571264 : Rat) / 2995) [(3, 1), (7, 1), (9, 1), (11, 1), (14, 2)],
  term ((2571264 : Rat) / 2995) [(3, 1), (7, 1), (9, 1), (11, 1), (15, 2)],
  term ((5514624 : Rat) / 2995) [(3, 1), (7, 1), (9, 1), (14, 1), (15, 1)],
  term ((-1272 : Rat) / 5) [(3, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2757312 : Rat) / 2995) [(3, 1), (7, 1), (9, 1), (14, 2), (15, 1)],
  term ((636 : Rat) / 5) [(3, 1), (7, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2757312 : Rat) / 2995) [(3, 1), (7, 1), (9, 1), (15, 3)],
  term ((636 : Rat) / 5) [(3, 1), (7, 1), (9, 1), (15, 3), (16, 1)],
  term ((-2571264 : Rat) / 2995) [(3, 1), (7, 2), (8, 1), (10, 1), (11, 1)],
  term ((2757312 : Rat) / 2995) [(3, 1), (7, 2), (8, 1), (10, 1), (15, 1)],
  term ((-636 : Rat) / 5) [(3, 1), (7, 2), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-3428352 : Rat) / 2995) [(3, 1), (7, 2), (8, 1), (11, 1)],
  term ((-1714176 : Rat) / 2995) [(3, 1), (7, 2), (8, 1), (11, 1), (14, 1)],
  term ((1838208 : Rat) / 2995) [(3, 1), (7, 2), (8, 1), (14, 1), (15, 1)],
  term ((-424 : Rat) / 5) [(3, 1), (7, 2), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((3676416 : Rat) / 2995) [(3, 1), (7, 2), (8, 1), (15, 1)],
  term ((-848 : Rat) / 5) [(3, 1), (7, 2), (8, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(3, 1), (7, 2), (9, 1)],
  term ((458496 : Rat) / 2995) [(3, 1), (7, 2), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((-72 : Rat) / 5) [(3, 1), (7, 2), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((68544 : Rat) / 2995) [(3, 1), (7, 2), (9, 1), (11, 1), (15, 1)],
  term ((-276 : Rat) / 5) [(3, 1), (7, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-160704 : Rat) / 2995) [(3, 1), (7, 2), (9, 1), (11, 2)],
  term ((-321408 : Rat) / 2995) [(3, 1), (7, 2), (9, 1), (11, 2), (14, 1)],
  term (12 : Rat) [(3, 1), (7, 2), (9, 1), (14, 1)],
  term ((-98496 : Rat) / 2995) [(3, 1), (7, 2), (9, 1), (14, 1), (15, 2)],
  term ((-12 : Rat) / 5) [(3, 1), (7, 2), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-16416 : Rat) / 2995) [(3, 1), (7, 2), (9, 1), (15, 2)],
  term ((-2 : Rat) / 5) [(3, 1), (7, 2), (9, 1), (15, 2), (16, 1)],
  term ((321408 : Rat) / 599) [(3, 1), (7, 2), (10, 1), (11, 1)],
  term ((2571264 : Rat) / 2995) [(3, 1), (7, 2), (10, 1), (11, 1), (14, 1)],
  term ((-2757312 : Rat) / 2995) [(3, 1), (7, 2), (10, 1), (14, 1), (15, 1)],
  term ((636 : Rat) / 5) [(3, 1), (7, 2), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-317388 : Rat) / 599) [(3, 1), (7, 2), (10, 1), (15, 1)],
  term (70 : Rat) [(3, 1), (7, 2), (10, 1), (15, 1), (16, 1)],
  term ((-162936 : Rat) / 2995) [(3, 1), (7, 2), (11, 1)],
  term ((-2571264 : Rat) / 2995) [(3, 1), (7, 2), (11, 1), (13, 1), (15, 1)],
  term (-6 : Rat) [(3, 1), (7, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-325872 : Rat) / 2995) [(3, 1), (7, 2), (11, 1), (14, 1)],
  term ((-366336 : Rat) / 2995) [(3, 1), (7, 2), (11, 1), (14, 1), (15, 2)],
  term ((198 : Rat) / 5) [(3, 1), (7, 2), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1553424 : Rat) / 599) [(3, 1), (7, 2), (11, 1), (15, 2)],
  term ((1557 : Rat) / 5) [(3, 1), (7, 2), (11, 1), (15, 2), (16, 1)],
  term ((482112 : Rat) / 2995) [(3, 1), (7, 2), (11, 2), (14, 1), (15, 1)],
  term ((5410368 : Rat) / 2995) [(3, 1), (7, 2), (11, 2), (15, 1)],
  term ((2667 : Rat) / 599) [(3, 1), (7, 2), (13, 1)],
  term ((2757312 : Rat) / 2995) [(3, 1), (7, 2), (13, 1), (15, 2)],
  term ((-636 : Rat) / 5) [(3, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((421256 : Rat) / 2995) [(3, 1), (7, 2), (14, 1), (15, 1)],
  term ((-98 : Rat) / 5) [(3, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((95843 : Rat) / 2995) [(3, 1), (7, 2), (15, 1)],
  term ((-44 : Rat) / 5) [(3, 1), (7, 2), (15, 1), (16, 1)],
  term ((2423808 : Rat) / 2995) [(3, 1), (7, 2), (15, 3)],
  term ((-534 : Rat) / 5) [(3, 1), (7, 2), (15, 3), (16, 1)],
  term ((-2571264 : Rat) / 2995) [(3, 1), (7, 3), (9, 1), (11, 1)],
  term ((2757312 : Rat) / 2995) [(3, 1), (7, 3), (9, 1), (15, 1)],
  term ((-636 : Rat) / 5) [(3, 1), (7, 3), (9, 1), (15, 1), (16, 1)],
  term ((-5142528 : Rat) / 2995) [(3, 1), (8, 1), (10, 1), (11, 1), (14, 1)],
  term ((2571264 : Rat) / 2995) [(3, 1), (8, 1), (10, 1), (11, 1), (14, 2)],
  term ((2571264 : Rat) / 2995) [(3, 1), (8, 1), (10, 1), (11, 1), (15, 2)],
  term ((5514624 : Rat) / 2995) [(3, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((-1272 : Rat) / 5) [(3, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2757312 : Rat) / 2995) [(3, 1), (8, 1), (10, 1), (14, 2), (15, 1)],
  term ((636 : Rat) / 5) [(3, 1), (8, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2757312 : Rat) / 2995) [(3, 1), (8, 1), (10, 1), (15, 3)],
  term ((636 : Rat) / 5) [(3, 1), (8, 1), (10, 1), (15, 3), (16, 1)],
  term ((-6856704 : Rat) / 2995) [(3, 1), (8, 1), (11, 1), (14, 1)],
  term ((1714176 : Rat) / 2995) [(3, 1), (8, 1), (11, 1), (14, 1), (15, 2)],
  term ((1714176 : Rat) / 2995) [(3, 1), (8, 1), (11, 1), (14, 3)],
  term ((3428352 : Rat) / 2995) [(3, 1), (8, 1), (11, 1), (15, 2)],
  term ((7352832 : Rat) / 2995) [(3, 1), (8, 1), (14, 1), (15, 1)],
  term ((-1696 : Rat) / 5) [(3, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1838208 : Rat) / 2995) [(3, 1), (8, 1), (14, 1), (15, 3)],
  term ((424 : Rat) / 5) [(3, 1), (8, 1), (14, 1), (15, 3), (16, 1)],
  term ((-1838208 : Rat) / 2995) [(3, 1), (8, 1), (14, 3), (15, 1)],
  term ((424 : Rat) / 5) [(3, 1), (8, 1), (14, 3), (15, 1), (16, 1)],
  term ((-3676416 : Rat) / 2995) [(3, 1), (8, 1), (15, 3)],
  term ((848 : Rat) / 5) [(3, 1), (8, 1), (15, 3), (16, 1)],
  term ((137088 : Rat) / 2995) [(3, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((-552 : Rat) / 5) [(3, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-458496 : Rat) / 2995) [(3, 1), (9, 1), (11, 1), (14, 1), (15, 3)],
  term ((72 : Rat) / 5) [(3, 1), (9, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((848448 : Rat) / 2995) [(3, 1), (9, 1), (11, 1), (14, 2), (15, 1)],
  term ((132 : Rat) / 5) [(3, 1), (9, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-458496 : Rat) / 2995) [(3, 1), (9, 1), (11, 1), (14, 3), (15, 1)],
  term ((72 : Rat) / 5) [(3, 1), (9, 1), (11, 1), (14, 3), (15, 1), (16, 1)],
  term ((-68544 : Rat) / 2995) [(3, 1), (9, 1), (11, 1), (15, 3)],
  term ((276 : Rat) / 5) [(3, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((-321408 : Rat) / 2995) [(3, 1), (9, 1), (11, 2), (14, 1)],
  term ((321408 : Rat) / 2995) [(3, 1), (9, 1), (11, 2), (14, 1), (15, 2)],
  term ((-482112 : Rat) / 2995) [(3, 1), (9, 1), (11, 2), (14, 2)],
  term ((321408 : Rat) / 2995) [(3, 1), (9, 1), (11, 2), (14, 3)],
  term ((160704 : Rat) / 2995) [(3, 1), (9, 1), (11, 2), (15, 2)],
  term (12 : Rat) [(3, 1), (9, 1), (14, 1)],
  term ((-68772 : Rat) / 2995) [(3, 1), (9, 1), (14, 1), (15, 2)],
  term ((-4 : Rat) / 5) [(3, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((98496 : Rat) / 2995) [(3, 1), (9, 1), (14, 1), (15, 4)],
  term ((12 : Rat) / 5) [(3, 1), (9, 1), (14, 1), (15, 4), (16, 1)],
  term (18 : Rat) [(3, 1), (9, 1), (14, 2)],
  term ((-180576 : Rat) / 2995) [(3, 1), (9, 1), (14, 2), (15, 2)],
  term ((-22 : Rat) / 5) [(3, 1), (9, 1), (14, 2), (15, 2), (16, 1)],
  term (-12 : Rat) [(3, 1), (9, 1), (14, 3)],
  term ((98496 : Rat) / 2995) [(3, 1), (9, 1), (14, 3), (15, 2)],
  term ((12 : Rat) / 5) [(3, 1), (9, 1), (14, 3), (15, 2), (16, 1)],
  term (-6 : Rat) [(3, 1), (9, 1), (15, 2)],
  term ((16416 : Rat) / 2995) [(3, 1), (9, 1), (15, 4)],
  term ((2 : Rat) / 5) [(3, 1), (9, 1), (15, 4), (16, 1)],
  term ((642816 : Rat) / 599) [(3, 1), (10, 1), (11, 1), (14, 1)],
  term ((-2571264 : Rat) / 2995) [(3, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((3535488 : Rat) / 2995) [(3, 1), (10, 1), (11, 1), (14, 2)],
  term ((-2571264 : Rat) / 2995) [(3, 1), (10, 1), (11, 1), (14, 3)],
  term ((-321408 : Rat) / 599) [(3, 1), (10, 1), (11, 1), (15, 2)],
  term ((-634776 : Rat) / 599) [(3, 1), (10, 1), (14, 1), (15, 1)],
  term (140 : Rat) [(3, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((2757312 : Rat) / 2995) [(3, 1), (10, 1), (14, 1), (15, 3)],
  term ((-636 : Rat) / 5) [(3, 1), (10, 1), (14, 1), (15, 3), (16, 1)],
  term ((-3927684 : Rat) / 2995) [(3, 1), (10, 1), (14, 2), (15, 1)],
  term ((922 : Rat) / 5) [(3, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((2757312 : Rat) / 2995) [(3, 1), (10, 1), (14, 3), (15, 1)],
  term ((-636 : Rat) / 5) [(3, 1), (10, 1), (14, 3), (15, 1), (16, 1)],
  term ((317388 : Rat) / 599) [(3, 1), (10, 1), (15, 3)],
  term (-70 : Rat) [(3, 1), (10, 1), (15, 3), (16, 1)],
  term ((-5142528 : Rat) / 2995) [(3, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term (-12 : Rat) [(3, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2571264 : Rat) / 2995) [(3, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term (6 : Rat) [(3, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((2571264 : Rat) / 2995) [(3, 1), (11, 1), (13, 1), (15, 3)],
  term (6 : Rat) [(3, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-325872 : Rat) / 2995) [(3, 1), (11, 1), (14, 1)],
  term ((-15208368 : Rat) / 2995) [(3, 1), (11, 1), (14, 1), (15, 2)],
  term ((3114 : Rat) / 5) [(3, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((366336 : Rat) / 2995) [(3, 1), (11, 1), (14, 1), (15, 4)],
  term ((-198 : Rat) / 5) [(3, 1), (11, 1), (14, 1), (15, 4), (16, 1)],
  term ((-488808 : Rat) / 2995) [(3, 1), (11, 1), (14, 2)],
  term ((7034448 : Rat) / 2995) [(3, 1), (11, 1), (14, 2), (15, 2)],
  term ((-1161 : Rat) / 5) [(3, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((325872 : Rat) / 2995) [(3, 1), (11, 1), (14, 3)],
  term ((366336 : Rat) / 2995) [(3, 1), (11, 1), (14, 3), (15, 2)],
  term ((-198 : Rat) / 5) [(3, 1), (11, 1), (14, 3), (15, 2), (16, 1)],
  term ((162936 : Rat) / 2995) [(3, 1), (11, 1), (15, 2)],
  term ((1553424 : Rat) / 599) [(3, 1), (11, 1), (15, 4)],
  term ((-1557 : Rat) / 5) [(3, 1), (11, 1), (15, 4), (16, 1)],
  term ((10820736 : Rat) / 2995) [(3, 1), (11, 2), (14, 1), (15, 1)],
  term ((-482112 : Rat) / 2995) [(3, 1), (11, 2), (14, 1), (15, 3)],
  term ((-4446144 : Rat) / 2995) [(3, 1), (11, 2), (14, 2), (15, 1)],
  term ((-482112 : Rat) / 2995) [(3, 1), (11, 2), (14, 3), (15, 1)],
  term ((-5410368 : Rat) / 2995) [(3, 1), (11, 2), (15, 3)],
  term ((5334 : Rat) / 599) [(3, 1), (13, 1), (14, 1)],
  term ((5514624 : Rat) / 2995) [(3, 1), (13, 1), (14, 1), (15, 2)],
  term ((-1272 : Rat) / 5) [(3, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2667 : Rat) / 599) [(3, 1), (13, 1), (14, 2)],
  term ((-2757312 : Rat) / 2995) [(3, 1), (13, 1), (14, 2), (15, 2)],
  term ((636 : Rat) / 5) [(3, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-2667 : Rat) / 599) [(3, 1), (13, 1), (15, 2)],
  term ((-2757312 : Rat) / 2995) [(3, 1), (13, 1), (15, 4)],
  term ((636 : Rat) / 5) [(3, 1), (13, 1), (15, 4), (16, 1)],
  term ((191686 : Rat) / 2995) [(3, 1), (14, 1), (15, 1)],
  term ((-88 : Rat) / 5) [(3, 1), (14, 1), (15, 1), (16, 1)],
  term ((885272 : Rat) / 599) [(3, 1), (14, 1), (15, 3)],
  term (-194 : Rat) [(3, 1), (14, 1), (15, 3), (16, 1)],
  term ((746669 : Rat) / 2995) [(3, 1), (14, 2), (15, 1)],
  term ((-152 : Rat) / 5) [(3, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2423808 : Rat) / 2995) [(3, 1), (14, 2), (15, 3)],
  term ((534 : Rat) / 5) [(3, 1), (14, 2), (15, 3), (16, 1)],
  term ((-421256 : Rat) / 2995) [(3, 1), (14, 3), (15, 1)],
  term ((98 : Rat) / 5) [(3, 1), (14, 3), (15, 1), (16, 1)],
  term ((-95843 : Rat) / 2995) [(3, 1), (15, 3)],
  term ((44 : Rat) / 5) [(3, 1), (15, 3), (16, 1)],
  term ((-2423808 : Rat) / 2995) [(3, 1), (15, 5)],
  term ((534 : Rat) / 5) [(3, 1), (15, 5), (16, 1)],
  term (12 : Rat) [(3, 2), (6, 1)],
  term ((-5142528 : Rat) / 2995) [(3, 2), (6, 1), (11, 1), (15, 1)],
  term (-24 : Rat) [(3, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((5514624 : Rat) / 2995) [(3, 2), (6, 1), (15, 2)],
  term ((-1272 : Rat) / 5) [(3, 2), (6, 1), (15, 2), (16, 1)],
  term (-6 : Rat) [(3, 2), (6, 2)],
  term ((2571264 : Rat) / 2995) [(3, 2), (6, 2), (11, 1), (15, 1)],
  term (12 : Rat) [(3, 2), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-2757312 : Rat) / 2995) [(3, 2), (6, 2), (15, 2)],
  term ((636 : Rat) / 5) [(3, 2), (6, 2), (15, 2), (16, 1)],
  term (-6 : Rat) [(3, 2), (7, 2)],
  term ((2571264 : Rat) / 2995) [(3, 2), (7, 2), (11, 1), (15, 1)],
  term (12 : Rat) [(3, 2), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-2757312 : Rat) / 2995) [(3, 2), (7, 2), (15, 2)],
  term ((636 : Rat) / 5) [(3, 2), (7, 2), (15, 2), (16, 1)],
  term ((5142528 : Rat) / 2995) [(3, 2), (11, 1), (14, 1), (15, 1)],
  term (24 : Rat) [(3, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2571264 : Rat) / 2995) [(3, 2), (11, 1), (14, 2), (15, 1)],
  term (-12 : Rat) [(3, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2571264 : Rat) / 2995) [(3, 2), (11, 1), (15, 3)],
  term (-12 : Rat) [(3, 2), (11, 1), (15, 3), (16, 1)],
  term (-12 : Rat) [(3, 2), (14, 1)],
  term ((-5514624 : Rat) / 2995) [(3, 2), (14, 1), (15, 2)],
  term ((1272 : Rat) / 5) [(3, 2), (14, 1), (15, 2), (16, 1)],
  term (6 : Rat) [(3, 2), (14, 2)],
  term ((2757312 : Rat) / 2995) [(3, 2), (14, 2), (15, 2)],
  term ((-636 : Rat) / 5) [(3, 2), (14, 2), (15, 2), (16, 1)],
  term (6 : Rat) [(3, 2), (15, 2)],
  term ((2757312 : Rat) / 2995) [(3, 2), (15, 4)],
  term ((-636 : Rat) / 5) [(3, 2), (15, 4), (16, 1)],
  term ((-46608 : Rat) / 599) [(4, 1), (6, 1), (8, 1)],
  term ((-5915904 : Rat) / 2995) [(4, 1), (6, 1), (8, 1), (11, 1), (15, 1)],
  term ((2024 : Rat) / 5) [(4, 1), (6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((5999616 : Rat) / 2995) [(4, 1), (6, 1), (8, 1), (11, 2)],
  term ((170688 : Rat) / 2995) [(4, 1), (6, 1), (8, 1), (15, 2)],
  term ((-64 : Rat) / 5) [(4, 1), (6, 1), (8, 1), (15, 2), (16, 1)],
  term ((3856896 : Rat) / 2995) [(4, 1), (6, 1), (9, 1), (11, 1)],
  term ((-3644928 : Rat) / 2995) [(4, 1), (6, 1), (9, 1), (15, 1)],
  term ((904 : Rat) / 5) [(4, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((23304 : Rat) / 599) [(4, 1), (6, 2), (8, 1)],
  term ((2957952 : Rat) / 2995) [(4, 1), (6, 2), (8, 1), (11, 1), (15, 1)],
  term ((-1012 : Rat) / 5) [(4, 1), (6, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2999808 : Rat) / 2995) [(4, 1), (6, 2), (8, 1), (11, 2)],
  term ((-85344 : Rat) / 2995) [(4, 1), (6, 2), (8, 1), (15, 2)],
  term ((32 : Rat) / 5) [(4, 1), (6, 2), (8, 1), (15, 2), (16, 1)],
  term ((-1928448 : Rat) / 2995) [(4, 1), (6, 2), (9, 1), (11, 1)],
  term ((1822464 : Rat) / 2995) [(4, 1), (6, 2), (9, 1), (15, 1)],
  term ((-452 : Rat) / 5) [(4, 1), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((23304 : Rat) / 599) [(4, 1), (7, 2), (8, 1)],
  term ((2957952 : Rat) / 2995) [(4, 1), (7, 2), (8, 1), (11, 1), (15, 1)],
  term ((-1012 : Rat) / 5) [(4, 1), (7, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2999808 : Rat) / 2995) [(4, 1), (7, 2), (8, 1), (11, 2)],
  term ((-85344 : Rat) / 2995) [(4, 1), (7, 2), (8, 1), (15, 2)],
  term ((32 : Rat) / 5) [(4, 1), (7, 2), (8, 1), (15, 2), (16, 1)],
  term ((-1928448 : Rat) / 2995) [(4, 1), (7, 2), (9, 1), (11, 1)],
  term ((1822464 : Rat) / 2995) [(4, 1), (7, 2), (9, 1), (15, 1)],
  term ((-452 : Rat) / 5) [(4, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((5915904 : Rat) / 2995) [(4, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((-2024 : Rat) / 5) [(4, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2957952 : Rat) / 2995) [(4, 1), (8, 1), (11, 1), (14, 2), (15, 1)],
  term ((1012 : Rat) / 5) [(4, 1), (8, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2957952 : Rat) / 2995) [(4, 1), (8, 1), (11, 1), (15, 3)],
  term ((1012 : Rat) / 5) [(4, 1), (8, 1), (11, 1), (15, 3), (16, 1)],
  term ((-5999616 : Rat) / 2995) [(4, 1), (8, 1), (11, 2), (14, 1)],
  term ((2999808 : Rat) / 2995) [(4, 1), (8, 1), (11, 2), (14, 2)],
  term ((2999808 : Rat) / 2995) [(4, 1), (8, 1), (11, 2), (15, 2)],
  term ((46608 : Rat) / 599) [(4, 1), (8, 1), (14, 1)],
  term ((-170688 : Rat) / 2995) [(4, 1), (8, 1), (14, 1), (15, 2)],
  term ((64 : Rat) / 5) [(4, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-23304 : Rat) / 599) [(4, 1), (8, 1), (14, 2)],
  term ((85344 : Rat) / 2995) [(4, 1), (8, 1), (14, 2), (15, 2)],
  term ((-32 : Rat) / 5) [(4, 1), (8, 1), (14, 2), (15, 2), (16, 1)],
  term ((-23304 : Rat) / 599) [(4, 1), (8, 1), (15, 2)],
  term ((85344 : Rat) / 2995) [(4, 1), (8, 1), (15, 4)],
  term ((-32 : Rat) / 5) [(4, 1), (8, 1), (15, 4), (16, 1)],
  term ((-3856896 : Rat) / 2995) [(4, 1), (9, 1), (11, 1), (14, 1)],
  term ((1928448 : Rat) / 2995) [(4, 1), (9, 1), (11, 1), (14, 2)],
  term ((1928448 : Rat) / 2995) [(4, 1), (9, 1), (11, 1), (15, 2)],
  term ((3644928 : Rat) / 2995) [(4, 1), (9, 1), (14, 1), (15, 1)],
  term ((-904 : Rat) / 5) [(4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1822464 : Rat) / 2995) [(4, 1), (9, 1), (14, 2), (15, 1)],
  term ((452 : Rat) / 5) [(4, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1822464 : Rat) / 2995) [(4, 1), (9, 1), (15, 3)],
  term ((452 : Rat) / 5) [(4, 1), (9, 1), (15, 3), (16, 1)],
  term ((46608 : Rat) / 599) [(5, 1), (6, 1), (9, 1)],
  term ((5915904 : Rat) / 2995) [(5, 1), (6, 1), (9, 1), (11, 1), (15, 1)],
  term ((-2024 : Rat) / 5) [(5, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-5999616 : Rat) / 2995) [(5, 1), (6, 1), (9, 1), (11, 2)],
  term ((-170688 : Rat) / 2995) [(5, 1), (6, 1), (9, 1), (15, 2)],
  term ((64 : Rat) / 5) [(5, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((-23304 : Rat) / 599) [(5, 1), (6, 2), (9, 1)],
  term ((-2957952 : Rat) / 2995) [(5, 1), (6, 2), (9, 1), (11, 1), (15, 1)],
  term ((1012 : Rat) / 5) [(5, 1), (6, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((2999808 : Rat) / 2995) [(5, 1), (6, 2), (9, 1), (11, 2)],
  term ((85344 : Rat) / 2995) [(5, 1), (6, 2), (9, 1), (15, 2)],
  term ((-32 : Rat) / 5) [(5, 1), (6, 2), (9, 1), (15, 2), (16, 1)],
  term ((-23304 : Rat) / 599) [(5, 1), (7, 2), (9, 1)],
  term ((-2957952 : Rat) / 2995) [(5, 1), (7, 2), (9, 1), (11, 1), (15, 1)],
  term ((1012 : Rat) / 5) [(5, 1), (7, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((2999808 : Rat) / 2995) [(5, 1), (7, 2), (9, 1), (11, 2)],
  term ((85344 : Rat) / 2995) [(5, 1), (7, 2), (9, 1), (15, 2)],
  term ((-32 : Rat) / 5) [(5, 1), (7, 2), (9, 1), (15, 2), (16, 1)],
  term ((-5915904 : Rat) / 2995) [(5, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((2024 : Rat) / 5) [(5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((2957952 : Rat) / 2995) [(5, 1), (9, 1), (11, 1), (14, 2), (15, 1)],
  term ((-1012 : Rat) / 5) [(5, 1), (9, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((2957952 : Rat) / 2995) [(5, 1), (9, 1), (11, 1), (15, 3)],
  term ((-1012 : Rat) / 5) [(5, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((5999616 : Rat) / 2995) [(5, 1), (9, 1), (11, 2), (14, 1)],
  term ((-2999808 : Rat) / 2995) [(5, 1), (9, 1), (11, 2), (14, 2)],
  term ((-2999808 : Rat) / 2995) [(5, 1), (9, 1), (11, 2), (15, 2)],
  term ((-46608 : Rat) / 599) [(5, 1), (9, 1), (14, 1)],
  term ((170688 : Rat) / 2995) [(5, 1), (9, 1), (14, 1), (15, 2)],
  term ((-64 : Rat) / 5) [(5, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((23304 : Rat) / 599) [(5, 1), (9, 1), (14, 2)],
  term ((-85344 : Rat) / 2995) [(5, 1), (9, 1), (14, 2), (15, 2)],
  term ((32 : Rat) / 5) [(5, 1), (9, 1), (14, 2), (15, 2), (16, 1)],
  term ((23304 : Rat) / 599) [(5, 1), (9, 1), (15, 2)],
  term ((-85344 : Rat) / 2995) [(5, 1), (9, 1), (15, 4)],
  term ((32 : Rat) / 5) [(5, 1), (9, 1), (15, 4), (16, 1)],
  term ((-42144 : Rat) / 599) [(6, 1), (7, 1), (9, 1)],
  term ((-9967104 : Rat) / 2995) [(6, 1), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((1896 : Rat) / 5) [(6, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((5785344 : Rat) / 2995) [(6, 1), (7, 1), (9, 1), (11, 2)],
  term ((4847616 : Rat) / 2995) [(6, 1), (7, 1), (9, 1), (15, 2)],
  term ((-1068 : Rat) / 5) [(6, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-21072 : Rat) / 599) [(6, 1), (7, 2), (8, 1)],
  term ((-4983552 : Rat) / 2995) [(6, 1), (7, 2), (8, 1), (11, 1), (15, 1)],
  term ((948 : Rat) / 5) [(6, 1), (7, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((2892672 : Rat) / 2995) [(6, 1), (7, 2), (8, 1), (11, 2)],
  term ((2423808 : Rat) / 2995) [(6, 1), (7, 2), (8, 1), (15, 2)],
  term ((-534 : Rat) / 5) [(6, 1), (7, 2), (8, 1), (15, 2), (16, 1)],
  term ((160704 : Rat) / 2995) [(6, 1), (7, 2), (9, 1), (11, 1)],
  term ((56448 : Rat) / 2995) [(6, 1), (7, 2), (9, 1), (15, 1)],
  term ((26 : Rat) / 5) [(6, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-47844 : Rat) / 599) [(6, 1), (8, 1)],
  term ((-7445952 : Rat) / 2995) [(6, 1), (8, 1), (9, 1), (11, 1)],
  term ((-9967104 : Rat) / 2995) [(6, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((1896 : Rat) / 5) [(6, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((4983552 : Rat) / 2995) [(6, 1), (8, 1), (11, 1), (14, 2), (15, 1)],
  term ((-948 : Rat) / 5) [(6, 1), (8, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((4983552 : Rat) / 2995) [(6, 1), (8, 1), (11, 1), (15, 3)],
  term ((-948 : Rat) / 5) [(6, 1), (8, 1), (11, 1), (15, 3), (16, 1)],
  term ((5785344 : Rat) / 2995) [(6, 1), (8, 1), (11, 2), (14, 1)],
  term ((-2892672 : Rat) / 2995) [(6, 1), (8, 1), (11, 2), (14, 2)],
  term ((-2892672 : Rat) / 2995) [(6, 1), (8, 1), (11, 2), (15, 2)],
  term ((-42144 : Rat) / 599) [(6, 1), (8, 1), (14, 1)],
  term ((4847616 : Rat) / 2995) [(6, 1), (8, 1), (14, 1), (15, 2)],
  term ((-1068 : Rat) / 5) [(6, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((21072 : Rat) / 599) [(6, 1), (8, 1), (14, 2)],
  term ((-2423808 : Rat) / 2995) [(6, 1), (8, 1), (14, 2), (15, 2)],
  term ((534 : Rat) / 5) [(6, 1), (8, 1), (14, 2), (15, 2), (16, 1)],
  term ((21072 : Rat) / 599) [(6, 1), (8, 1), (15, 2)],
  term ((-2423808 : Rat) / 2995) [(6, 1), (8, 1), (15, 4)],
  term ((534 : Rat) / 5) [(6, 1), (8, 1), (15, 4), (16, 1)],
  term ((321408 : Rat) / 2995) [(6, 1), (9, 1), (11, 1), (14, 1)],
  term ((-160704 : Rat) / 2995) [(6, 1), (9, 1), (11, 1), (14, 2)],
  term ((-160704 : Rat) / 2995) [(6, 1), (9, 1), (11, 1), (15, 2)],
  term ((112896 : Rat) / 2995) [(6, 1), (9, 1), (14, 1), (15, 1)],
  term ((52 : Rat) / 5) [(6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-56448 : Rat) / 2995) [(6, 1), (9, 1), (14, 2), (15, 1)],
  term ((-26 : Rat) / 5) [(6, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-56448 : Rat) / 2995) [(6, 1), (9, 1), (15, 3)],
  term ((-26 : Rat) / 5) [(6, 1), (9, 1), (15, 3), (16, 1)],
  term ((21072 : Rat) / 599) [(6, 2), (7, 1), (9, 1)],
  term ((4983552 : Rat) / 2995) [(6, 2), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((-948 : Rat) / 5) [(6, 2), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2892672 : Rat) / 2995) [(6, 2), (7, 1), (9, 1), (11, 2)],
  term ((-2423808 : Rat) / 2995) [(6, 2), (7, 1), (9, 1), (15, 2)],
  term ((534 : Rat) / 5) [(6, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((66066 : Rat) / 599) [(6, 2), (8, 1)],
  term ((3722976 : Rat) / 2995) [(6, 2), (8, 1), (9, 1), (11, 1)],
  term ((9967104 : Rat) / 2995) [(6, 2), (8, 1), (11, 1), (15, 1)],
  term ((-1896 : Rat) / 5) [(6, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-5785344 : Rat) / 2995) [(6, 2), (8, 1), (11, 2)],
  term ((-4847616 : Rat) / 2995) [(6, 2), (8, 1), (15, 2)],
  term ((1068 : Rat) / 5) [(6, 2), (8, 1), (15, 2), (16, 1)],
  term ((-321408 : Rat) / 2995) [(6, 2), (9, 1), (11, 1)],
  term ((-112896 : Rat) / 2995) [(6, 2), (9, 1), (15, 1)],
  term ((-52 : Rat) / 5) [(6, 2), (9, 1), (15, 1), (16, 1)],
  term ((-21072 : Rat) / 599) [(6, 3), (8, 1)],
  term ((-4983552 : Rat) / 2995) [(6, 3), (8, 1), (11, 1), (15, 1)],
  term ((948 : Rat) / 5) [(6, 3), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((2892672 : Rat) / 2995) [(6, 3), (8, 1), (11, 2)],
  term ((2423808 : Rat) / 2995) [(6, 3), (8, 1), (15, 2)],
  term ((-534 : Rat) / 5) [(6, 3), (8, 1), (15, 2), (16, 1)],
  term ((160704 : Rat) / 2995) [(6, 3), (9, 1), (11, 1)],
  term ((56448 : Rat) / 2995) [(6, 3), (9, 1), (15, 1)],
  term ((26 : Rat) / 5) [(6, 3), (9, 1), (15, 1), (16, 1)],
  term ((9967104 : Rat) / 2995) [(7, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((-1896 : Rat) / 5) [(7, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4983552 : Rat) / 2995) [(7, 1), (9, 1), (11, 1), (14, 2), (15, 1)],
  term ((948 : Rat) / 5) [(7, 1), (9, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-4983552 : Rat) / 2995) [(7, 1), (9, 1), (11, 1), (15, 3)],
  term ((948 : Rat) / 5) [(7, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((-5785344 : Rat) / 2995) [(7, 1), (9, 1), (11, 2), (14, 1)],
  term ((2892672 : Rat) / 2995) [(7, 1), (9, 1), (11, 2), (14, 2)],
  term ((2892672 : Rat) / 2995) [(7, 1), (9, 1), (11, 2), (15, 2)],
  term ((42144 : Rat) / 599) [(7, 1), (9, 1), (14, 1)],
  term ((-4847616 : Rat) / 2995) [(7, 1), (9, 1), (14, 1), (15, 2)],
  term ((1068 : Rat) / 5) [(7, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-21072 : Rat) / 599) [(7, 1), (9, 1), (14, 2)],
  term ((2423808 : Rat) / 2995) [(7, 1), (9, 1), (14, 2), (15, 2)],
  term ((-534 : Rat) / 5) [(7, 1), (9, 1), (14, 2), (15, 2), (16, 1)],
  term ((-21072 : Rat) / 599) [(7, 1), (9, 1), (15, 2)],
  term ((2423808 : Rat) / 2995) [(7, 1), (9, 1), (15, 4)],
  term ((-534 : Rat) / 5) [(7, 1), (9, 1), (15, 4), (16, 1)],
  term ((23922 : Rat) / 599) [(7, 2), (8, 1)],
  term ((3722976 : Rat) / 2995) [(7, 2), (8, 1), (9, 1), (11, 1)],
  term ((21072 : Rat) / 599) [(7, 3), (9, 1)],
  term ((4983552 : Rat) / 2995) [(7, 3), (9, 1), (11, 1), (15, 1)],
  term ((-948 : Rat) / 5) [(7, 3), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2892672 : Rat) / 2995) [(7, 3), (9, 1), (11, 2)],
  term ((-2423808 : Rat) / 2995) [(7, 3), (9, 1), (15, 2)],
  term ((534 : Rat) / 5) [(7, 3), (9, 1), (15, 2), (16, 1)],
  term ((7445952 : Rat) / 2995) [(8, 1), (9, 1), (11, 1), (14, 1)],
  term ((-3722976 : Rat) / 2995) [(8, 1), (9, 1), (11, 1), (14, 2)],
  term ((-3722976 : Rat) / 2995) [(8, 1), (9, 1), (11, 1), (15, 2)],
  term ((47844 : Rat) / 599) [(8, 1), (14, 1)],
  term ((-23922 : Rat) / 599) [(8, 1), (14, 2)],
  term ((-23922 : Rat) / 599) [(8, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 5, terms 200 through 299. -/
theorem rs_R010_ueqv_R010NYN_block_05_0200_0299_valid :
    checkProductSumEq rs_R010_ueqv_R010NYN_partials_05_0200_0299
      rs_R010_ueqv_R010NYN_block_05_0200_0299 = true := by
  native_decide

end R010UeqvR010NYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
