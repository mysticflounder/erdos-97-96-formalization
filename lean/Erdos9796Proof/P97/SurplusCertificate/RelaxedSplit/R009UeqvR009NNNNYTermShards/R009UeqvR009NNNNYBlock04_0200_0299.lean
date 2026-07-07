/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NNNNY, term block 4:200-299

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NNNNYTermShards

/-- Generator polynomial 4 for relaxed split surplus certificate `R009:u=v:R009NNNNY`. -/
def rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 : Poly :=
[
  term (-2 : Rat) [(4, 1)],
  term (1 : Rat) [(4, 2)],
  term (1 : Rat) [(5, 2)],
  term (2 : Rat) [(12, 1)],
  term (-1 : Rat) [(12, 2)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 200 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0200 : Poly :=
[
  term (27 : Rat) [(4, 1), (11, 2), (14, 1), (16, 1)]
]

/-- Partial product 200 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0200 : Poly :=
[
  term (27 : Rat) [(4, 1), (5, 2), (11, 2), (14, 1), (16, 1)],
  term (54 : Rat) [(4, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term (-27 : Rat) [(4, 1), (11, 2), (12, 2), (14, 1), (16, 1)],
  term (-27 : Rat) [(4, 1), (11, 2), (13, 2), (14, 1), (16, 1)],
  term (-54 : Rat) [(4, 2), (11, 2), (14, 1), (16, 1)],
  term (27 : Rat) [(4, 3), (11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0200_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0200
        rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 =
      rs_R009_ueqv_R009NNNNY_partial_04_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0201 : Poly :=
[
  term ((-4943 : Rat) / 93) [(4, 1), (11, 2), (16, 1)]
]

/-- Partial product 201 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0201 : Poly :=
[
  term ((-4943 : Rat) / 93) [(4, 1), (5, 2), (11, 2), (16, 1)],
  term ((-9886 : Rat) / 93) [(4, 1), (11, 2), (12, 1), (16, 1)],
  term ((4943 : Rat) / 93) [(4, 1), (11, 2), (12, 2), (16, 1)],
  term ((4943 : Rat) / 93) [(4, 1), (11, 2), (13, 2), (16, 1)],
  term ((9886 : Rat) / 93) [(4, 2), (11, 2), (16, 1)],
  term ((-4943 : Rat) / 93) [(4, 3), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0201_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0201
        rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 =
      rs_R009_ueqv_R009NNNNY_partial_04_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0202 : Poly :=
[
  term ((4 : Rat) / 31) [(4, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 202 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0202 : Poly :=
[
  term ((4 : Rat) / 31) [(4, 1), (5, 2), (12, 1), (14, 1), (16, 1)],
  term ((-4 : Rat) / 31) [(4, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((8 : Rat) / 31) [(4, 1), (12, 2), (14, 1), (16, 1)],
  term ((-4 : Rat) / 31) [(4, 1), (12, 3), (14, 1), (16, 1)],
  term ((-8 : Rat) / 31) [(4, 2), (12, 1), (14, 1), (16, 1)],
  term ((4 : Rat) / 31) [(4, 3), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0202_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0202
        rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 =
      rs_R009_ueqv_R009NNNNY_partial_04_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0203 : Poly :=
[
  term ((383 : Rat) / 186) [(4, 1), (12, 1), (16, 1)]
]

/-- Partial product 203 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0203 : Poly :=
[
  term ((383 : Rat) / 186) [(4, 1), (5, 2), (12, 1), (16, 1)],
  term ((-383 : Rat) / 186) [(4, 1), (12, 1), (13, 2), (16, 1)],
  term ((383 : Rat) / 93) [(4, 1), (12, 2), (16, 1)],
  term ((-383 : Rat) / 186) [(4, 1), (12, 3), (16, 1)],
  term ((-383 : Rat) / 93) [(4, 2), (12, 1), (16, 1)],
  term ((383 : Rat) / 186) [(4, 3), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0203_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0203
        rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 =
      rs_R009_ueqv_R009NNNNY_partial_04_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0204 : Poly :=
[
  term ((8 : Rat) / 31) [(4, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 204 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0204 : Poly :=
[
  term ((8 : Rat) / 31) [(4, 1), (5, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 31) [(4, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8 : Rat) / 31) [(4, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8 : Rat) / 31) [(4, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 31) [(4, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 31) [(4, 3), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0204_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0204
        rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 =
      rs_R009_ueqv_R009NNNNY_partial_04_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0205 : Poly :=
[
  term ((163 : Rat) / 93) [(4, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 205 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0205 : Poly :=
[
  term ((163 : Rat) / 93) [(4, 1), (5, 2), (13, 1), (15, 1), (16, 1)],
  term ((326 : Rat) / 93) [(4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-163 : Rat) / 93) [(4, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-163 : Rat) / 93) [(4, 1), (13, 3), (15, 1), (16, 1)],
  term ((-326 : Rat) / 93) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term ((163 : Rat) / 93) [(4, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0205_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0205
        rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 =
      rs_R009_ueqv_R009NNNNY_partial_04_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0206 : Poly :=
[
  term ((74 : Rat) / 93) [(4, 1), (13, 2), (16, 1)]
]

/-- Partial product 206 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0206 : Poly :=
[
  term ((74 : Rat) / 93) [(4, 1), (5, 2), (13, 2), (16, 1)],
  term ((148 : Rat) / 93) [(4, 1), (12, 1), (13, 2), (16, 1)],
  term ((-74 : Rat) / 93) [(4, 1), (12, 2), (13, 2), (16, 1)],
  term ((-74 : Rat) / 93) [(4, 1), (13, 4), (16, 1)],
  term ((-148 : Rat) / 93) [(4, 2), (13, 2), (16, 1)],
  term ((74 : Rat) / 93) [(4, 3), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0206_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0206
        rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 =
      rs_R009_ueqv_R009NNNNY_partial_04_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0207 : Poly :=
[
  term ((-4 : Rat) / 31) [(4, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 207 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0207 : Poly :=
[
  term ((-4 : Rat) / 31) [(4, 1), (5, 2), (14, 1), (15, 2), (16, 1)],
  term ((-8 : Rat) / 31) [(4, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((4 : Rat) / 31) [(4, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((4 : Rat) / 31) [(4, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((8 : Rat) / 31) [(4, 2), (14, 1), (15, 2), (16, 1)],
  term ((-4 : Rat) / 31) [(4, 3), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0207_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0207
        rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 =
      rs_R009_ueqv_R009NNNNY_partial_04_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0208 : Poly :=
[
  term ((937 : Rat) / 372) [(4, 1), (14, 1), (16, 1)]
]

/-- Partial product 208 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0208 : Poly :=
[
  term ((937 : Rat) / 372) [(4, 1), (5, 2), (14, 1), (16, 1)],
  term ((937 : Rat) / 186) [(4, 1), (12, 1), (14, 1), (16, 1)],
  term ((-937 : Rat) / 372) [(4, 1), (12, 2), (14, 1), (16, 1)],
  term ((-937 : Rat) / 372) [(4, 1), (13, 2), (14, 1), (16, 1)],
  term ((-937 : Rat) / 186) [(4, 2), (14, 1), (16, 1)],
  term ((937 : Rat) / 372) [(4, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0208_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0208
        rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 =
      rs_R009_ueqv_R009NNNNY_partial_04_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0209 : Poly :=
[
  term ((47 : Rat) / 6) [(4, 1), (15, 2), (16, 1)]
]

/-- Partial product 209 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0209 : Poly :=
[
  term ((47 : Rat) / 6) [(4, 1), (5, 2), (15, 2), (16, 1)],
  term ((47 : Rat) / 3) [(4, 1), (12, 1), (15, 2), (16, 1)],
  term ((-47 : Rat) / 6) [(4, 1), (12, 2), (15, 2), (16, 1)],
  term ((-47 : Rat) / 6) [(4, 1), (13, 2), (15, 2), (16, 1)],
  term ((-47 : Rat) / 3) [(4, 2), (15, 2), (16, 1)],
  term ((47 : Rat) / 6) [(4, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0209_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0209
        rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 =
      rs_R009_ueqv_R009NNNNY_partial_04_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0210 : Poly :=
[
  term ((-11513 : Rat) / 744) [(4, 1), (16, 1)]
]

/-- Partial product 210 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0210 : Poly :=
[
  term ((-11513 : Rat) / 744) [(4, 1), (5, 2), (16, 1)],
  term ((-11513 : Rat) / 372) [(4, 1), (12, 1), (16, 1)],
  term ((11513 : Rat) / 744) [(4, 1), (12, 2), (16, 1)],
  term ((11513 : Rat) / 744) [(4, 1), (13, 2), (16, 1)],
  term ((11513 : Rat) / 372) [(4, 2), (16, 1)],
  term ((-11513 : Rat) / 744) [(4, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0210_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0210
        rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 =
      rs_R009_ueqv_R009NNNNY_partial_04_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0211 : Poly :=
[
  term ((98 : Rat) / 31) [(4, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 211 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0211 : Poly :=
[
  term ((98 : Rat) / 31) [(4, 2), (5, 2), (11, 1), (15, 1), (16, 1)],
  term ((196 : Rat) / 31) [(4, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-98 : Rat) / 31) [(4, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-98 : Rat) / 31) [(4, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-196 : Rat) / 31) [(4, 3), (11, 1), (15, 1), (16, 1)],
  term ((98 : Rat) / 31) [(4, 4), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0211_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0211
        rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 =
      rs_R009_ueqv_R009NNNNY_partial_04_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0212 : Poly :=
[
  term ((232 : Rat) / 93) [(4, 2), (11, 2), (16, 1)]
]

/-- Partial product 212 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0212 : Poly :=
[
  term ((232 : Rat) / 93) [(4, 2), (5, 2), (11, 2), (16, 1)],
  term ((464 : Rat) / 93) [(4, 2), (11, 2), (12, 1), (16, 1)],
  term ((-232 : Rat) / 93) [(4, 2), (11, 2), (12, 2), (16, 1)],
  term ((-232 : Rat) / 93) [(4, 2), (11, 2), (13, 2), (16, 1)],
  term ((-464 : Rat) / 93) [(4, 3), (11, 2), (16, 1)],
  term ((232 : Rat) / 93) [(4, 4), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0212_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0212
        rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 =
      rs_R009_ueqv_R009NNNNY_partial_04_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0213 : Poly :=
[
  term ((-8 : Rat) / 93) [(4, 2), (12, 1), (16, 1)]
]

/-- Partial product 213 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0213 : Poly :=
[
  term ((-8 : Rat) / 93) [(4, 2), (5, 2), (12, 1), (16, 1)],
  term ((8 : Rat) / 93) [(4, 2), (12, 1), (13, 2), (16, 1)],
  term ((-16 : Rat) / 93) [(4, 2), (12, 2), (16, 1)],
  term ((8 : Rat) / 93) [(4, 2), (12, 3), (16, 1)],
  term ((16 : Rat) / 93) [(4, 3), (12, 1), (16, 1)],
  term ((-8 : Rat) / 93) [(4, 4), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0213_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0213
        rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 =
      rs_R009_ueqv_R009NNNNY_partial_04_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0214 : Poly :=
[
  term ((16 : Rat) / 93) [(4, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 214 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0214 : Poly :=
[
  term ((16 : Rat) / 93) [(4, 2), (5, 2), (13, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 93) [(4, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 93) [(4, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 93) [(4, 2), (13, 3), (15, 1), (16, 1)],
  term ((-32 : Rat) / 93) [(4, 3), (13, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 93) [(4, 4), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0214_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0214
        rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 =
      rs_R009_ueqv_R009NNNNY_partial_04_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0215 : Poly :=
[
  term ((-8 : Rat) / 93) [(4, 2), (15, 2), (16, 1)]
]

/-- Partial product 215 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0215 : Poly :=
[
  term ((-8 : Rat) / 93) [(4, 2), (5, 2), (15, 2), (16, 1)],
  term ((-16 : Rat) / 93) [(4, 2), (12, 1), (15, 2), (16, 1)],
  term ((8 : Rat) / 93) [(4, 2), (12, 2), (15, 2), (16, 1)],
  term ((8 : Rat) / 93) [(4, 2), (13, 2), (15, 2), (16, 1)],
  term ((16 : Rat) / 93) [(4, 3), (15, 2), (16, 1)],
  term ((-8 : Rat) / 93) [(4, 4), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0215_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0215
        rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 =
      rs_R009_ueqv_R009NNNNY_partial_04_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0216 : Poly :=
[
  term ((433 : Rat) / 93) [(4, 2), (16, 1)]
]

/-- Partial product 216 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0216 : Poly :=
[
  term ((433 : Rat) / 93) [(4, 2), (5, 2), (16, 1)],
  term ((866 : Rat) / 93) [(4, 2), (12, 1), (16, 1)],
  term ((-433 : Rat) / 93) [(4, 2), (12, 2), (16, 1)],
  term ((-433 : Rat) / 93) [(4, 2), (13, 2), (16, 1)],
  term ((-866 : Rat) / 93) [(4, 3), (16, 1)],
  term ((433 : Rat) / 93) [(4, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0216_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0216
        rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 =
      rs_R009_ueqv_R009NNNNY_partial_04_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0217 : Poly :=
[
  term ((-4 : Rat) / 93) [(5, 1), (7, 1), (10, 1), (16, 1)]
]

/-- Partial product 217 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0217 : Poly :=
[
  term ((8 : Rat) / 93) [(4, 1), (5, 1), (7, 1), (10, 1), (16, 1)],
  term ((-4 : Rat) / 93) [(4, 2), (5, 1), (7, 1), (10, 1), (16, 1)],
  term ((-8 : Rat) / 93) [(5, 1), (7, 1), (10, 1), (12, 1), (16, 1)],
  term ((4 : Rat) / 93) [(5, 1), (7, 1), (10, 1), (12, 2), (16, 1)],
  term ((4 : Rat) / 93) [(5, 1), (7, 1), (10, 1), (13, 2), (16, 1)],
  term ((-4 : Rat) / 93) [(5, 3), (7, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0217_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0217
        rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 =
      rs_R009_ueqv_R009NNNNY_partial_04_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0218 : Poly :=
[
  term ((4 : Rat) / 93) [(5, 1), (7, 1), (16, 1)]
]

/-- Partial product 218 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0218 : Poly :=
[
  term ((-8 : Rat) / 93) [(4, 1), (5, 1), (7, 1), (16, 1)],
  term ((4 : Rat) / 93) [(4, 2), (5, 1), (7, 1), (16, 1)],
  term ((8 : Rat) / 93) [(5, 1), (7, 1), (12, 1), (16, 1)],
  term ((-4 : Rat) / 93) [(5, 1), (7, 1), (12, 2), (16, 1)],
  term ((-4 : Rat) / 93) [(5, 1), (7, 1), (13, 2), (16, 1)],
  term ((4 : Rat) / 93) [(5, 3), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0218_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0218
        rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 =
      rs_R009_ueqv_R009NNNNY_partial_04_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0219 : Poly :=
[
  term ((-182 : Rat) / 93) [(5, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 219 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0219 : Poly :=
[
  term ((364 : Rat) / 93) [(4, 1), (5, 1), (9, 1), (10, 1), (16, 1)],
  term ((-182 : Rat) / 93) [(4, 2), (5, 1), (9, 1), (10, 1), (16, 1)],
  term ((-364 : Rat) / 93) [(5, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((182 : Rat) / 93) [(5, 1), (9, 1), (10, 1), (12, 2), (16, 1)],
  term ((182 : Rat) / 93) [(5, 1), (9, 1), (10, 1), (13, 2), (16, 1)],
  term ((-182 : Rat) / 93) [(5, 3), (9, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0219_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0219
        rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 =
      rs_R009_ueqv_R009NNNNY_partial_04_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0220 : Poly :=
[
  term ((182 : Rat) / 31) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 220 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0220 : Poly :=
[
  term ((-364 : Rat) / 31) [(4, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((182 : Rat) / 31) [(4, 2), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((364 : Rat) / 31) [(5, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-182 : Rat) / 31) [(5, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-182 : Rat) / 31) [(5, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((182 : Rat) / 31) [(5, 3), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0220_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0220
        rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 =
      rs_R009_ueqv_R009NNNNY_partial_04_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0221 : Poly :=
[
  term ((58 : Rat) / 31) [(5, 1), (9, 1), (12, 1), (16, 1)]
]

/-- Partial product 221 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0221 : Poly :=
[
  term ((-116 : Rat) / 31) [(4, 1), (5, 1), (9, 1), (12, 1), (16, 1)],
  term ((58 : Rat) / 31) [(4, 2), (5, 1), (9, 1), (12, 1), (16, 1)],
  term ((-58 : Rat) / 31) [(5, 1), (9, 1), (12, 1), (13, 2), (16, 1)],
  term ((116 : Rat) / 31) [(5, 1), (9, 1), (12, 2), (16, 1)],
  term ((-58 : Rat) / 31) [(5, 1), (9, 1), (12, 3), (16, 1)],
  term ((58 : Rat) / 31) [(5, 3), (9, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0221_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0221
        rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 =
      rs_R009_ueqv_R009NNNNY_partial_04_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0222 : Poly :=
[
  term ((4 : Rat) / 93) [(5, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 222 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0222 : Poly :=
[
  term ((-8 : Rat) / 93) [(4, 1), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((4 : Rat) / 93) [(4, 2), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((8 : Rat) / 93) [(5, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-4 : Rat) / 93) [(5, 1), (9, 1), (12, 2), (14, 1), (16, 1)],
  term ((-4 : Rat) / 93) [(5, 1), (9, 1), (13, 2), (14, 1), (16, 1)],
  term ((4 : Rat) / 93) [(5, 3), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0222_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0222
        rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 =
      rs_R009_ueqv_R009NNNNY_partial_04_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0223 : Poly :=
[
  term ((54 : Rat) / 31) [(5, 1), (9, 1), (16, 1)]
]

/-- Partial product 223 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0223 : Poly :=
[
  term ((-108 : Rat) / 31) [(4, 1), (5, 1), (9, 1), (16, 1)],
  term ((54 : Rat) / 31) [(4, 2), (5, 1), (9, 1), (16, 1)],
  term ((108 : Rat) / 31) [(5, 1), (9, 1), (12, 1), (16, 1)],
  term ((-54 : Rat) / 31) [(5, 1), (9, 1), (12, 2), (16, 1)],
  term ((-54 : Rat) / 31) [(5, 1), (9, 1), (13, 2), (16, 1)],
  term ((54 : Rat) / 31) [(5, 3), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0223_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0223
        rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 =
      rs_R009_ueqv_R009NNNNY_partial_04_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0224 : Poly :=
[
  term ((178 : Rat) / 93) [(5, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 224 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0224 : Poly :=
[
  term ((-356 : Rat) / 93) [(4, 1), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((178 : Rat) / 93) [(4, 2), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((356 : Rat) / 93) [(5, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-178 : Rat) / 93) [(5, 1), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((-178 : Rat) / 93) [(5, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((178 : Rat) / 93) [(5, 3), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0224_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0224
        rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 =
      rs_R009_ueqv_R009NNNNY_partial_04_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0225 : Poly :=
[
  term ((251 : Rat) / 31) [(5, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 225 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0225 : Poly :=
[
  term ((-502 : Rat) / 31) [(4, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((251 : Rat) / 31) [(4, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((502 : Rat) / 31) [(5, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-251 : Rat) / 31) [(5, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-251 : Rat) / 31) [(5, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((251 : Rat) / 31) [(5, 3), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0225_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0225
        rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 =
      rs_R009_ueqv_R009NNNNY_partial_04_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0226 : Poly :=
[
  term ((1070 : Rat) / 93) [(5, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 226 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0226 : Poly :=
[
  term ((-2140 : Rat) / 93) [(4, 1), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((1070 : Rat) / 93) [(4, 2), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((-1070 : Rat) / 93) [(5, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((2140 : Rat) / 93) [(5, 1), (11, 1), (12, 2), (16, 1)],
  term ((-1070 : Rat) / 93) [(5, 1), (11, 1), (12, 3), (16, 1)],
  term ((1070 : Rat) / 93) [(5, 3), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0226_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0226
        rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 =
      rs_R009_ueqv_R009NNNNY_partial_04_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0227 : Poly :=
[
  term ((-1139 : Rat) / 31) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 227 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0227 : Poly :=
[
  term ((2278 : Rat) / 31) [(4, 1), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1139 : Rat) / 31) [(4, 2), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2278 : Rat) / 31) [(5, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1139 : Rat) / 31) [(5, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((1139 : Rat) / 31) [(5, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-1139 : Rat) / 31) [(5, 3), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0227_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0227
        rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 =
      rs_R009_ueqv_R009NNNNY_partial_04_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0228 : Poly :=
[
  term ((-475 : Rat) / 93) [(5, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 228 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0228 : Poly :=
[
  term ((950 : Rat) / 93) [(4, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-475 : Rat) / 93) [(4, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-950 : Rat) / 93) [(5, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((475 : Rat) / 93) [(5, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((475 : Rat) / 93) [(5, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-475 : Rat) / 93) [(5, 3), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0228_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0228
        rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 =
      rs_R009_ueqv_R009NNNNY_partial_04_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0229 : Poly :=
[
  term ((-58 : Rat) / 31) [(5, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 229 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0229 : Poly :=
[
  term ((116 : Rat) / 31) [(4, 1), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((-58 : Rat) / 31) [(4, 2), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((-116 : Rat) / 31) [(5, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((58 : Rat) / 31) [(5, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((58 : Rat) / 31) [(5, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-58 : Rat) / 31) [(5, 3), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0229_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0229
        rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 =
      rs_R009_ueqv_R009NNNNY_partial_04_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0230 : Poly :=
[
  term ((-77 : Rat) / 62) [(5, 1), (11, 1), (16, 1)]
]

/-- Partial product 230 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0230 : Poly :=
[
  term ((77 : Rat) / 31) [(4, 1), (5, 1), (11, 1), (16, 1)],
  term ((-77 : Rat) / 62) [(4, 2), (5, 1), (11, 1), (16, 1)],
  term ((-77 : Rat) / 31) [(5, 1), (11, 1), (12, 1), (16, 1)],
  term ((77 : Rat) / 62) [(5, 1), (11, 1), (12, 2), (16, 1)],
  term ((77 : Rat) / 62) [(5, 1), (11, 1), (13, 2), (16, 1)],
  term ((-77 : Rat) / 62) [(5, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0230_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0230
        rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 =
      rs_R009_ueqv_R009NNNNY_partial_04_0230 := by
  native_decide

/-- Coefficient term 231 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0231 : Poly :=
[
  term (27 : Rat) [(5, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 231 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0231 : Poly :=
[
  term (-54 : Rat) [(4, 1), (5, 1), (11, 2), (15, 1), (16, 1)],
  term (27 : Rat) [(4, 2), (5, 1), (11, 2), (15, 1), (16, 1)],
  term (54 : Rat) [(5, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term (-27 : Rat) [(5, 1), (11, 2), (12, 2), (15, 1), (16, 1)],
  term (-27 : Rat) [(5, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term (27 : Rat) [(5, 3), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 231 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0231_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0231
        rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 =
      rs_R009_ueqv_R009NNNNY_partial_04_0231 := by
  native_decide

/-- Coefficient term 232 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0232 : Poly :=
[
  term ((-14 : Rat) / 31) [(5, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 232 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0232 : Poly :=
[
  term ((28 : Rat) / 31) [(4, 1), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((-14 : Rat) / 31) [(4, 2), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((14 : Rat) / 31) [(5, 1), (12, 1), (13, 3), (16, 1)],
  term ((-28 : Rat) / 31) [(5, 1), (12, 2), (13, 1), (16, 1)],
  term ((14 : Rat) / 31) [(5, 1), (12, 3), (13, 1), (16, 1)],
  term ((-14 : Rat) / 31) [(5, 3), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 232 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0232_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0232
        rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 =
      rs_R009_ueqv_R009NNNNY_partial_04_0232 := by
  native_decide

/-- Coefficient term 233 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0233 : Poly :=
[
  term ((118 : Rat) / 93) [(5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 233 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0233 : Poly :=
[
  term ((-236 : Rat) / 93) [(4, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((118 : Rat) / 93) [(4, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-118 : Rat) / 93) [(5, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((236 : Rat) / 93) [(5, 1), (12, 2), (15, 1), (16, 1)],
  term ((-118 : Rat) / 93) [(5, 1), (12, 3), (15, 1), (16, 1)],
  term ((118 : Rat) / 93) [(5, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 233 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0233_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0233
        rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 =
      rs_R009_ueqv_R009NNNNY_partial_04_0233 := by
  native_decide

/-- Coefficient term 234 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0234 : Poly :=
[
  term ((39 : Rat) / 31) [(5, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 234 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0234 : Poly :=
[
  term ((-78 : Rat) / 31) [(4, 1), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((39 : Rat) / 31) [(4, 2), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((78 : Rat) / 31) [(5, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-39 : Rat) / 31) [(5, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-39 : Rat) / 31) [(5, 1), (13, 3), (14, 1), (16, 1)],
  term ((39 : Rat) / 31) [(5, 3), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 234 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0234_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0234
        rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 =
      rs_R009_ueqv_R009NNNNY_partial_04_0234 := by
  native_decide

/-- Coefficient term 235 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0235 : Poly :=
[
  term ((-16 : Rat) / 31) [(5, 1), (13, 1), (14, 2), (16, 1)]
]

/-- Partial product 235 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0235 : Poly :=
[
  term ((32 : Rat) / 31) [(4, 1), (5, 1), (13, 1), (14, 2), (16, 1)],
  term ((-16 : Rat) / 31) [(4, 2), (5, 1), (13, 1), (14, 2), (16, 1)],
  term ((-32 : Rat) / 31) [(5, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((16 : Rat) / 31) [(5, 1), (12, 2), (13, 1), (14, 2), (16, 1)],
  term ((16 : Rat) / 31) [(5, 1), (13, 3), (14, 2), (16, 1)],
  term ((-16 : Rat) / 31) [(5, 3), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 235 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0235_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0235
        rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 =
      rs_R009_ueqv_R009NNNNY_partial_04_0235 := by
  native_decide

/-- Coefficient term 236 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0236 : Poly :=
[
  term ((-8 : Rat) / 31) [(5, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 236 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0236 : Poly :=
[
  term ((16 : Rat) / 31) [(4, 1), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((-8 : Rat) / 31) [(4, 2), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((-16 : Rat) / 31) [(5, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((8 : Rat) / 31) [(5, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((8 : Rat) / 31) [(5, 1), (13, 3), (15, 2), (16, 1)],
  term ((-8 : Rat) / 31) [(5, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 236 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0236_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0236
        rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 =
      rs_R009_ueqv_R009NNNNY_partial_04_0236 := by
  native_decide

/-- Coefficient term 237 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0237 : Poly :=
[
  term ((5 : Rat) / 186) [(5, 1), (13, 1), (16, 1)]
]

/-- Partial product 237 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0237 : Poly :=
[
  term ((-5 : Rat) / 93) [(4, 1), (5, 1), (13, 1), (16, 1)],
  term ((5 : Rat) / 186) [(4, 2), (5, 1), (13, 1), (16, 1)],
  term ((5 : Rat) / 93) [(5, 1), (12, 1), (13, 1), (16, 1)],
  term ((-5 : Rat) / 186) [(5, 1), (12, 2), (13, 1), (16, 1)],
  term ((-5 : Rat) / 186) [(5, 1), (13, 3), (16, 1)],
  term ((5 : Rat) / 186) [(5, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 237 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0237_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0237
        rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 =
      rs_R009_ueqv_R009NNNNY_partial_04_0237 := by
  native_decide

/-- Coefficient term 238 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0238 : Poly :=
[
  term ((601 : Rat) / 186) [(5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 238 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0238 : Poly :=
[
  term ((-601 : Rat) / 93) [(4, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((601 : Rat) / 186) [(4, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((601 : Rat) / 93) [(5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-601 : Rat) / 186) [(5, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-601 : Rat) / 186) [(5, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((601 : Rat) / 186) [(5, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 238 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0238_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0238
        rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 =
      rs_R009_ueqv_R009NNNNY_partial_04_0238 := by
  native_decide

/-- Coefficient term 239 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0239 : Poly :=
[
  term ((-197 : Rat) / 31) [(5, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 239 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0239 : Poly :=
[
  term ((394 : Rat) / 31) [(4, 1), (5, 1), (14, 2), (15, 1), (16, 1)],
  term ((-197 : Rat) / 31) [(4, 2), (5, 1), (14, 2), (15, 1), (16, 1)],
  term ((-394 : Rat) / 31) [(5, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((197 : Rat) / 31) [(5, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((197 : Rat) / 31) [(5, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-197 : Rat) / 31) [(5, 3), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 239 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0239_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0239
        rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 =
      rs_R009_ueqv_R009NNNNY_partial_04_0239 := by
  native_decide

/-- Coefficient term 240 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0240 : Poly :=
[
  term ((353 : Rat) / 93) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 240 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0240 : Poly :=
[
  term ((-706 : Rat) / 93) [(4, 1), (5, 1), (15, 1), (16, 1)],
  term ((353 : Rat) / 93) [(4, 2), (5, 1), (15, 1), (16, 1)],
  term ((706 : Rat) / 93) [(5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-353 : Rat) / 93) [(5, 1), (12, 2), (15, 1), (16, 1)],
  term ((-353 : Rat) / 93) [(5, 1), (13, 2), (15, 1), (16, 1)],
  term ((353 : Rat) / 93) [(5, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 240 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0240_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0240
        rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 =
      rs_R009_ueqv_R009NNNNY_partial_04_0240 := by
  native_decide

/-- Coefficient term 241 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0241 : Poly :=
[
  term ((-201 : Rat) / 31) [(5, 1), (15, 3), (16, 1)]
]

/-- Partial product 241 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0241 : Poly :=
[
  term ((402 : Rat) / 31) [(4, 1), (5, 1), (15, 3), (16, 1)],
  term ((-201 : Rat) / 31) [(4, 2), (5, 1), (15, 3), (16, 1)],
  term ((-402 : Rat) / 31) [(5, 1), (12, 1), (15, 3), (16, 1)],
  term ((201 : Rat) / 31) [(5, 1), (12, 2), (15, 3), (16, 1)],
  term ((201 : Rat) / 31) [(5, 1), (13, 2), (15, 3), (16, 1)],
  term ((-201 : Rat) / 31) [(5, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 241 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0241_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0241
        rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 =
      rs_R009_ueqv_R009NNNNY_partial_04_0241 := by
  native_decide

/-- Coefficient term 242 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0242 : Poly :=
[
  term ((98 : Rat) / 31) [(5, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 242 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0242 : Poly :=
[
  term ((-196 : Rat) / 31) [(4, 1), (5, 2), (11, 1), (15, 1), (16, 1)],
  term ((98 : Rat) / 31) [(4, 2), (5, 2), (11, 1), (15, 1), (16, 1)],
  term ((196 : Rat) / 31) [(5, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-98 : Rat) / 31) [(5, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-98 : Rat) / 31) [(5, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((98 : Rat) / 31) [(5, 4), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 242 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0242_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0242
        rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 =
      rs_R009_ueqv_R009NNNNY_partial_04_0242 := by
  native_decide

/-- Coefficient term 243 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0243 : Poly :=
[
  term ((232 : Rat) / 93) [(5, 2), (11, 2), (16, 1)]
]

/-- Partial product 243 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0243 : Poly :=
[
  term ((-464 : Rat) / 93) [(4, 1), (5, 2), (11, 2), (16, 1)],
  term ((232 : Rat) / 93) [(4, 2), (5, 2), (11, 2), (16, 1)],
  term ((464 : Rat) / 93) [(5, 2), (11, 2), (12, 1), (16, 1)],
  term ((-232 : Rat) / 93) [(5, 2), (11, 2), (12, 2), (16, 1)],
  term ((-232 : Rat) / 93) [(5, 2), (11, 2), (13, 2), (16, 1)],
  term ((232 : Rat) / 93) [(5, 4), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 243 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0243_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0243
        rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 =
      rs_R009_ueqv_R009NNNNY_partial_04_0243 := by
  native_decide

/-- Coefficient term 244 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0244 : Poly :=
[
  term ((-16 : Rat) / 93) [(5, 2), (12, 1), (16, 1)]
]

/-- Partial product 244 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0244 : Poly :=
[
  term ((32 : Rat) / 93) [(4, 1), (5, 2), (12, 1), (16, 1)],
  term ((-16 : Rat) / 93) [(4, 2), (5, 2), (12, 1), (16, 1)],
  term ((16 : Rat) / 93) [(5, 2), (12, 1), (13, 2), (16, 1)],
  term ((-32 : Rat) / 93) [(5, 2), (12, 2), (16, 1)],
  term ((16 : Rat) / 93) [(5, 2), (12, 3), (16, 1)],
  term ((-16 : Rat) / 93) [(5, 4), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 244 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0244_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0244
        rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 =
      rs_R009_ueqv_R009NNNNY_partial_04_0244 := by
  native_decide

/-- Coefficient term 245 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0245 : Poly :=
[
  term ((64 : Rat) / 93) [(5, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 245 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0245 : Poly :=
[
  term ((-128 : Rat) / 93) [(4, 1), (5, 2), (13, 1), (15, 1), (16, 1)],
  term ((64 : Rat) / 93) [(4, 2), (5, 2), (13, 1), (15, 1), (16, 1)],
  term ((128 : Rat) / 93) [(5, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-64 : Rat) / 93) [(5, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-64 : Rat) / 93) [(5, 2), (13, 3), (15, 1), (16, 1)],
  term ((64 : Rat) / 93) [(5, 4), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 245 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0245_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0245
        rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 =
      rs_R009_ueqv_R009NNNNY_partial_04_0245 := by
  native_decide

/-- Coefficient term 246 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0246 : Poly :=
[
  term ((4 : Rat) / 93) [(5, 2), (14, 1), (16, 1)]
]

/-- Partial product 246 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0246 : Poly :=
[
  term ((-8 : Rat) / 93) [(4, 1), (5, 2), (14, 1), (16, 1)],
  term ((4 : Rat) / 93) [(4, 2), (5, 2), (14, 1), (16, 1)],
  term ((8 : Rat) / 93) [(5, 2), (12, 1), (14, 1), (16, 1)],
  term ((-4 : Rat) / 93) [(5, 2), (12, 2), (14, 1), (16, 1)],
  term ((-4 : Rat) / 93) [(5, 2), (13, 2), (14, 1), (16, 1)],
  term ((4 : Rat) / 93) [(5, 4), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 246 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0246_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0246
        rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 =
      rs_R009_ueqv_R009NNNNY_partial_04_0246 := by
  native_decide

/-- Coefficient term 247 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0247 : Poly :=
[
  term ((583 : Rat) / 93) [(5, 2), (15, 2), (16, 1)]
]

/-- Partial product 247 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0247 : Poly :=
[
  term ((-1166 : Rat) / 93) [(4, 1), (5, 2), (15, 2), (16, 1)],
  term ((583 : Rat) / 93) [(4, 2), (5, 2), (15, 2), (16, 1)],
  term ((1166 : Rat) / 93) [(5, 2), (12, 1), (15, 2), (16, 1)],
  term ((-583 : Rat) / 93) [(5, 2), (12, 2), (15, 2), (16, 1)],
  term ((-583 : Rat) / 93) [(5, 2), (13, 2), (15, 2), (16, 1)],
  term ((583 : Rat) / 93) [(5, 4), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 247 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0247_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0247
        rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 =
      rs_R009_ueqv_R009NNNNY_partial_04_0247 := by
  native_decide

/-- Coefficient term 248 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0248 : Poly :=
[
  term ((33 : Rat) / 31) [(5, 2), (16, 1)]
]

/-- Partial product 248 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0248 : Poly :=
[
  term ((-66 : Rat) / 31) [(4, 1), (5, 2), (16, 1)],
  term ((33 : Rat) / 31) [(4, 2), (5, 2), (16, 1)],
  term ((66 : Rat) / 31) [(5, 2), (12, 1), (16, 1)],
  term ((-33 : Rat) / 31) [(5, 2), (12, 2), (16, 1)],
  term ((-33 : Rat) / 31) [(5, 2), (13, 2), (16, 1)],
  term ((33 : Rat) / 31) [(5, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 248 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0248_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0248
        rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 =
      rs_R009_ueqv_R009NNNNY_partial_04_0248 := by
  native_decide

/-- Coefficient term 249 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0249 : Poly :=
[
  term ((361 : Rat) / 186) [(7, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 249 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0249 : Poly :=
[
  term ((-361 : Rat) / 93) [(4, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((361 : Rat) / 186) [(4, 2), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((361 : Rat) / 186) [(5, 2), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((361 : Rat) / 93) [(7, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-361 : Rat) / 186) [(7, 1), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((-361 : Rat) / 186) [(7, 1), (10, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 249 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0249_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0249
        rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 =
      rs_R009_ueqv_R009NNNNY_partial_04_0249 := by
  native_decide

/-- Coefficient term 250 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0250 : Poly :=
[
  term ((437 : Rat) / 186) [(7, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 250 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0250 : Poly :=
[
  term ((-437 : Rat) / 93) [(4, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((437 : Rat) / 186) [(4, 2), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((437 : Rat) / 186) [(5, 2), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((437 : Rat) / 93) [(7, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-437 : Rat) / 186) [(7, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((-437 : Rat) / 186) [(7, 1), (10, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 250 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0250_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0250
        rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 =
      rs_R009_ueqv_R009NNNNY_partial_04_0250 := by
  native_decide

/-- Coefficient term 251 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0251 : Poly :=
[
  term ((-371 : Rat) / 186) [(7, 1), (11, 1), (16, 1)]
]

/-- Partial product 251 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0251 : Poly :=
[
  term ((371 : Rat) / 93) [(4, 1), (7, 1), (11, 1), (16, 1)],
  term ((-371 : Rat) / 186) [(4, 2), (7, 1), (11, 1), (16, 1)],
  term ((-371 : Rat) / 186) [(5, 2), (7, 1), (11, 1), (16, 1)],
  term ((-371 : Rat) / 93) [(7, 1), (11, 1), (12, 1), (16, 1)],
  term ((371 : Rat) / 186) [(7, 1), (11, 1), (12, 2), (16, 1)],
  term ((371 : Rat) / 186) [(7, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 251 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0251_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0251
        rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 =
      rs_R009_ueqv_R009NNNNY_partial_04_0251 := by
  native_decide

/-- Coefficient term 252 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0252 : Poly :=
[
  term ((-121 : Rat) / 186) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 252 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0252 : Poly :=
[
  term ((121 : Rat) / 93) [(4, 1), (7, 1), (13, 1), (16, 1)],
  term ((-121 : Rat) / 186) [(4, 2), (7, 1), (13, 1), (16, 1)],
  term ((-121 : Rat) / 186) [(5, 2), (7, 1), (13, 1), (16, 1)],
  term ((-121 : Rat) / 93) [(7, 1), (12, 1), (13, 1), (16, 1)],
  term ((121 : Rat) / 186) [(7, 1), (12, 2), (13, 1), (16, 1)],
  term ((121 : Rat) / 186) [(7, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 252 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0252_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0252
        rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 =
      rs_R009_ueqv_R009NNNNY_partial_04_0252 := by
  native_decide

/-- Coefficient term 253 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0253 : Poly :=
[
  term ((91 : Rat) / 93) [(8, 1), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 253 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0253 : Poly :=
[
  term ((-182 : Rat) / 93) [(4, 1), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((91 : Rat) / 93) [(4, 2), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((91 : Rat) / 93) [(5, 2), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((182 : Rat) / 93) [(8, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-91 : Rat) / 93) [(8, 1), (10, 1), (12, 2), (14, 1), (16, 1)],
  term ((-91 : Rat) / 93) [(8, 1), (10, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 253 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0253_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0253
        rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 =
      rs_R009_ueqv_R009NNNNY_partial_04_0253 := by
  native_decide

/-- Coefficient term 254 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0254 : Poly :=
[
  term ((-397 : Rat) / 31) [(8, 1), (10, 1), (16, 1)]
]

/-- Partial product 254 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0254 : Poly :=
[
  term ((794 : Rat) / 31) [(4, 1), (8, 1), (10, 1), (16, 1)],
  term ((-397 : Rat) / 31) [(4, 2), (8, 1), (10, 1), (16, 1)],
  term ((-397 : Rat) / 31) [(5, 2), (8, 1), (10, 1), (16, 1)],
  term ((-794 : Rat) / 31) [(8, 1), (10, 1), (12, 1), (16, 1)],
  term ((397 : Rat) / 31) [(8, 1), (10, 1), (12, 2), (16, 1)],
  term ((397 : Rat) / 31) [(8, 1), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 254 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0254_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0254
        rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 =
      rs_R009_ueqv_R009NNNNY_partial_04_0254 := by
  native_decide

/-- Coefficient term 255 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0255 : Poly :=
[
  term (4 : Rat) [(8, 1), (12, 1), (16, 1)]
]

/-- Partial product 255 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0255 : Poly :=
[
  term (-8 : Rat) [(4, 1), (8, 1), (12, 1), (16, 1)],
  term (4 : Rat) [(4, 2), (8, 1), (12, 1), (16, 1)],
  term (4 : Rat) [(5, 2), (8, 1), (12, 1), (16, 1)],
  term (-4 : Rat) [(8, 1), (12, 1), (13, 2), (16, 1)],
  term (8 : Rat) [(8, 1), (12, 2), (16, 1)],
  term (-4 : Rat) [(8, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 255 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0255_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0255
        rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 =
      rs_R009_ueqv_R009NNNNY_partial_04_0255 := by
  native_decide

/-- Coefficient term 256 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0256 : Poly :=
[
  term ((847 : Rat) / 372) [(8, 1), (14, 1), (16, 1)]
]

/-- Partial product 256 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0256 : Poly :=
[
  term ((-847 : Rat) / 186) [(4, 1), (8, 1), (14, 1), (16, 1)],
  term ((847 : Rat) / 372) [(4, 2), (8, 1), (14, 1), (16, 1)],
  term ((847 : Rat) / 372) [(5, 2), (8, 1), (14, 1), (16, 1)],
  term ((847 : Rat) / 186) [(8, 1), (12, 1), (14, 1), (16, 1)],
  term ((-847 : Rat) / 372) [(8, 1), (12, 2), (14, 1), (16, 1)],
  term ((-847 : Rat) / 372) [(8, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 256 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0256_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0256
        rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 =
      rs_R009_ueqv_R009NNNNY_partial_04_0256 := by
  native_decide

/-- Coefficient term 257 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0257 : Poly :=
[
  term ((10391 : Rat) / 744) [(8, 1), (16, 1)]
]

/-- Partial product 257 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0257 : Poly :=
[
  term ((-10391 : Rat) / 372) [(4, 1), (8, 1), (16, 1)],
  term ((10391 : Rat) / 744) [(4, 2), (8, 1), (16, 1)],
  term ((10391 : Rat) / 744) [(5, 2), (8, 1), (16, 1)],
  term ((10391 : Rat) / 372) [(8, 1), (12, 1), (16, 1)],
  term ((-10391 : Rat) / 744) [(8, 1), (12, 2), (16, 1)],
  term ((-10391 : Rat) / 744) [(8, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 257 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0257_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0257
        rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 =
      rs_R009_ueqv_R009NNNNY_partial_04_0257 := by
  native_decide

/-- Coefficient term 258 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0258 : Poly :=
[
  term ((-116 : Rat) / 93) [(9, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 258 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0258 : Poly :=
[
  term ((232 : Rat) / 93) [(4, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-116 : Rat) / 93) [(4, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-116 : Rat) / 93) [(5, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-232 : Rat) / 93) [(9, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((116 : Rat) / 93) [(9, 1), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((116 : Rat) / 93) [(9, 1), (10, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 258 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0258_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0258
        rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 =
      rs_R009_ueqv_R009NNNNY_partial_04_0258 := by
  native_decide

/-- Coefficient term 259 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0259 : Poly :=
[
  term ((380 : Rat) / 93) [(9, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 259 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0259 : Poly :=
[
  term ((-760 : Rat) / 93) [(4, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((380 : Rat) / 93) [(4, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((380 : Rat) / 93) [(5, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-380 : Rat) / 93) [(9, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((760 : Rat) / 93) [(9, 1), (11, 1), (12, 2), (16, 1)],
  term ((-380 : Rat) / 93) [(9, 1), (11, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 259 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0259_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0259
        rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 =
      rs_R009_ueqv_R009NNNNY_partial_04_0259 := by
  native_decide

/-- Coefficient term 260 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0260 : Poly :=
[
  term ((331 : Rat) / 31) [(9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 260 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0260 : Poly :=
[
  term ((-662 : Rat) / 31) [(4, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((331 : Rat) / 31) [(4, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((331 : Rat) / 31) [(5, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((662 : Rat) / 31) [(9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-331 : Rat) / 31) [(9, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((-331 : Rat) / 31) [(9, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 260 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0260_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0260
        rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 =
      rs_R009_ueqv_R009NNNNY_partial_04_0260 := by
  native_decide

/-- Coefficient term 261 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0261 : Poly :=
[
  term ((-182 : Rat) / 31) [(9, 1), (11, 1), (14, 2), (16, 1)]
]

/-- Partial product 261 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0261 : Poly :=
[
  term ((364 : Rat) / 31) [(4, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-182 : Rat) / 31) [(4, 2), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-182 : Rat) / 31) [(5, 2), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-364 : Rat) / 31) [(9, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((182 : Rat) / 31) [(9, 1), (11, 1), (12, 2), (14, 2), (16, 1)],
  term ((182 : Rat) / 31) [(9, 1), (11, 1), (13, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 261 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0261_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0261
        rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 =
      rs_R009_ueqv_R009NNNNY_partial_04_0261 := by
  native_decide

/-- Coefficient term 262 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0262 : Poly :=
[
  term ((-182 : Rat) / 31) [(9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 262 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0262 : Poly :=
[
  term ((364 : Rat) / 31) [(4, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-182 : Rat) / 31) [(4, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-182 : Rat) / 31) [(5, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-364 : Rat) / 31) [(9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((182 : Rat) / 31) [(9, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((182 : Rat) / 31) [(9, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 262 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0262_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0262
        rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 =
      rs_R009_ueqv_R009NNNNY_partial_04_0262 := by
  native_decide

/-- Coefficient term 263 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0263 : Poly :=
[
  term ((-55 : Rat) / 62) [(9, 1), (11, 1), (16, 1)]
]

/-- Partial product 263 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0263 : Poly :=
[
  term ((55 : Rat) / 31) [(4, 1), (9, 1), (11, 1), (16, 1)],
  term ((-55 : Rat) / 62) [(4, 2), (9, 1), (11, 1), (16, 1)],
  term ((-55 : Rat) / 62) [(5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-55 : Rat) / 31) [(9, 1), (11, 1), (12, 1), (16, 1)],
  term ((55 : Rat) / 62) [(9, 1), (11, 1), (12, 2), (16, 1)],
  term ((55 : Rat) / 62) [(9, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 263 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0263_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0263
        rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 =
      rs_R009_ueqv_R009NNNNY_partial_04_0263 := by
  native_decide

/-- Coefficient term 264 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0264 : Poly :=
[
  term ((-1391 : Rat) / 186) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 264 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0264 : Poly :=
[
  term ((1391 : Rat) / 93) [(4, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1391 : Rat) / 186) [(4, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1391 : Rat) / 186) [(5, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1391 : Rat) / 93) [(10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1391 : Rat) / 186) [(10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((1391 : Rat) / 186) [(10, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 264 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0264_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0264
        rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 =
      rs_R009_ueqv_R009NNNNY_partial_04_0264 := by
  native_decide

/-- Coefficient term 265 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0265 : Poly :=
[
  term ((-312 : Rat) / 31) [(10, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 265 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0265 : Poly :=
[
  term ((624 : Rat) / 31) [(4, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-312 : Rat) / 31) [(4, 2), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-312 : Rat) / 31) [(5, 2), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((312 : Rat) / 31) [(10, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-624 : Rat) / 31) [(10, 1), (12, 2), (14, 1), (16, 1)],
  term ((312 : Rat) / 31) [(10, 1), (12, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 265 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0265_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0265
        rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 =
      rs_R009_ueqv_R009NNNNY_partial_04_0265 := by
  native_decide

/-- Coefficient term 266 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0266 : Poly :=
[
  term ((-395 : Rat) / 186) [(10, 1), (12, 1), (16, 1)]
]

/-- Partial product 266 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0266 : Poly :=
[
  term ((395 : Rat) / 93) [(4, 1), (10, 1), (12, 1), (16, 1)],
  term ((-395 : Rat) / 186) [(4, 2), (10, 1), (12, 1), (16, 1)],
  term ((-395 : Rat) / 186) [(5, 2), (10, 1), (12, 1), (16, 1)],
  term ((395 : Rat) / 186) [(10, 1), (12, 1), (13, 2), (16, 1)],
  term ((-395 : Rat) / 93) [(10, 1), (12, 2), (16, 1)],
  term ((395 : Rat) / 186) [(10, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 266 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0266_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0266
        rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 =
      rs_R009_ueqv_R009NNNNY_partial_04_0266 := by
  native_decide

/-- Coefficient term 267 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0267 : Poly :=
[
  term ((208 : Rat) / 31) [(10, 1), (12, 2), (16, 1)]
]

/-- Partial product 267 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0267 : Poly :=
[
  term ((-416 : Rat) / 31) [(4, 1), (10, 1), (12, 2), (16, 1)],
  term ((208 : Rat) / 31) [(4, 2), (10, 1), (12, 2), (16, 1)],
  term ((208 : Rat) / 31) [(5, 2), (10, 1), (12, 2), (16, 1)],
  term ((-208 : Rat) / 31) [(10, 1), (12, 2), (13, 2), (16, 1)],
  term ((416 : Rat) / 31) [(10, 1), (12, 3), (16, 1)],
  term ((-208 : Rat) / 31) [(10, 1), (12, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 267 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0267_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0267
        rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 =
      rs_R009_ueqv_R009NNNNY_partial_04_0267 := by
  native_decide

/-- Coefficient term 268 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0268 : Poly :=
[
  term ((-523 : Rat) / 31) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 268 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0268 : Poly :=
[
  term ((1046 : Rat) / 31) [(4, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-523 : Rat) / 31) [(4, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-523 : Rat) / 31) [(5, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1046 : Rat) / 31) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((523 : Rat) / 31) [(10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((523 : Rat) / 31) [(10, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 268 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0268_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0268
        rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 =
      rs_R009_ueqv_R009NNNNY_partial_04_0268 := by
  native_decide

/-- Coefficient term 269 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0269 : Poly :=
[
  term ((208 : Rat) / 31) [(10, 1), (13, 2), (16, 1)]
]

/-- Partial product 269 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0269 : Poly :=
[
  term ((-416 : Rat) / 31) [(4, 1), (10, 1), (13, 2), (16, 1)],
  term ((208 : Rat) / 31) [(4, 2), (10, 1), (13, 2), (16, 1)],
  term ((208 : Rat) / 31) [(5, 2), (10, 1), (13, 2), (16, 1)],
  term ((416 : Rat) / 31) [(10, 1), (12, 1), (13, 2), (16, 1)],
  term ((-208 : Rat) / 31) [(10, 1), (12, 2), (13, 2), (16, 1)],
  term ((-208 : Rat) / 31) [(10, 1), (13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 269 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0269_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0269
        rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 =
      rs_R009_ueqv_R009NNNNY_partial_04_0269 := by
  native_decide

/-- Coefficient term 270 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0270 : Poly :=
[
  term ((-59 : Rat) / 93) [(10, 1), (14, 1), (16, 1)]
]

/-- Partial product 270 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0270 : Poly :=
[
  term ((118 : Rat) / 93) [(4, 1), (10, 1), (14, 1), (16, 1)],
  term ((-59 : Rat) / 93) [(4, 2), (10, 1), (14, 1), (16, 1)],
  term ((-59 : Rat) / 93) [(5, 2), (10, 1), (14, 1), (16, 1)],
  term ((-118 : Rat) / 93) [(10, 1), (12, 1), (14, 1), (16, 1)],
  term ((59 : Rat) / 93) [(10, 1), (12, 2), (14, 1), (16, 1)],
  term ((59 : Rat) / 93) [(10, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 270 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0270_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0270
        rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 =
      rs_R009_ueqv_R009NNNNY_partial_04_0270 := by
  native_decide

/-- Coefficient term 271 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0271 : Poly :=
[
  term ((421 : Rat) / 93) [(10, 1), (14, 2), (16, 1)]
]

/-- Partial product 271 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0271 : Poly :=
[
  term ((-842 : Rat) / 93) [(4, 1), (10, 1), (14, 2), (16, 1)],
  term ((421 : Rat) / 93) [(4, 2), (10, 1), (14, 2), (16, 1)],
  term ((421 : Rat) / 93) [(5, 2), (10, 1), (14, 2), (16, 1)],
  term ((842 : Rat) / 93) [(10, 1), (12, 1), (14, 2), (16, 1)],
  term ((-421 : Rat) / 93) [(10, 1), (12, 2), (14, 2), (16, 1)],
  term ((-421 : Rat) / 93) [(10, 1), (13, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 271 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0271_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0271
        rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 =
      rs_R009_ueqv_R009NNNNY_partial_04_0271 := by
  native_decide

/-- Coefficient term 272 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0272 : Poly :=
[
  term ((17 : Rat) / 31) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 272 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0272 : Poly :=
[
  term ((-34 : Rat) / 31) [(4, 1), (10, 1), (15, 2), (16, 1)],
  term ((17 : Rat) / 31) [(4, 2), (10, 1), (15, 2), (16, 1)],
  term ((17 : Rat) / 31) [(5, 2), (10, 1), (15, 2), (16, 1)],
  term ((34 : Rat) / 31) [(10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-17 : Rat) / 31) [(10, 1), (12, 2), (15, 2), (16, 1)],
  term ((-17 : Rat) / 31) [(10, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 272 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0272_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0272
        rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 =
      rs_R009_ueqv_R009NNNNY_partial_04_0272 := by
  native_decide

/-- Coefficient term 273 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0273 : Poly :=
[
  term ((77 : Rat) / 93) [(10, 1), (16, 1)]
]

/-- Partial product 273 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0273 : Poly :=
[
  term ((-154 : Rat) / 93) [(4, 1), (10, 1), (16, 1)],
  term ((77 : Rat) / 93) [(4, 2), (10, 1), (16, 1)],
  term ((77 : Rat) / 93) [(5, 2), (10, 1), (16, 1)],
  term ((154 : Rat) / 93) [(10, 1), (12, 1), (16, 1)],
  term ((-77 : Rat) / 93) [(10, 1), (12, 2), (16, 1)],
  term ((-77 : Rat) / 93) [(10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 273 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0273_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0273
        rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 =
      rs_R009_ueqv_R009NNNNY_partial_04_0273 := by
  native_decide

/-- Coefficient term 274 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0274 : Poly :=
[
  term ((-1447 : Rat) / 186) [(10, 2), (14, 1), (16, 1)]
]

/-- Partial product 274 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0274 : Poly :=
[
  term ((1447 : Rat) / 93) [(4, 1), (10, 2), (14, 1), (16, 1)],
  term ((-1447 : Rat) / 186) [(4, 2), (10, 2), (14, 1), (16, 1)],
  term ((-1447 : Rat) / 186) [(5, 2), (10, 2), (14, 1), (16, 1)],
  term ((-1447 : Rat) / 93) [(10, 2), (12, 1), (14, 1), (16, 1)],
  term ((1447 : Rat) / 186) [(10, 2), (12, 2), (14, 1), (16, 1)],
  term ((1447 : Rat) / 186) [(10, 2), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 274 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0274_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0274
        rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 =
      rs_R009_ueqv_R009NNNNY_partial_04_0274 := by
  native_decide

/-- Coefficient term 275 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0275 : Poly :=
[
  term ((2477 : Rat) / 372) [(10, 2), (16, 1)]
]

/-- Partial product 275 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0275 : Poly :=
[
  term ((-2477 : Rat) / 186) [(4, 1), (10, 2), (16, 1)],
  term ((2477 : Rat) / 372) [(4, 2), (10, 2), (16, 1)],
  term ((2477 : Rat) / 372) [(5, 2), (10, 2), (16, 1)],
  term ((2477 : Rat) / 186) [(10, 2), (12, 1), (16, 1)],
  term ((-2477 : Rat) / 372) [(10, 2), (12, 2), (16, 1)],
  term ((-2477 : Rat) / 372) [(10, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 275 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0275_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0275
        rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 =
      rs_R009_ueqv_R009NNNNY_partial_04_0275 := by
  native_decide

/-- Coefficient term 276 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0276 : Poly :=
[
  term ((-2278 : Rat) / 93) [(11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 276 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0276 : Poly :=
[
  term ((4556 : Rat) / 93) [(4, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-2278 : Rat) / 93) [(4, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-2278 : Rat) / 93) [(5, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((2278 : Rat) / 93) [(11, 1), (12, 1), (13, 3), (16, 1)],
  term ((-4556 : Rat) / 93) [(11, 1), (12, 2), (13, 1), (16, 1)],
  term ((2278 : Rat) / 93) [(11, 1), (12, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 276 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0276_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0276
        rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 =
      rs_R009_ueqv_R009NNNNY_partial_04_0276 := by
  native_decide

/-- Coefficient term 277 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0277 : Poly :=
[
  term ((301 : Rat) / 62) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 277 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0277 : Poly :=
[
  term ((-301 : Rat) / 31) [(4, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((301 : Rat) / 62) [(4, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((301 : Rat) / 62) [(5, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-301 : Rat) / 62) [(11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((301 : Rat) / 31) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-301 : Rat) / 62) [(11, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 277 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0277_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0277
        rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 =
      rs_R009_ueqv_R009NNNNY_partial_04_0277 := by
  native_decide

/-- Coefficient term 278 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0278 : Poly :=
[
  term ((-3753 : Rat) / 62) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 278 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0278 : Poly :=
[
  term ((3753 : Rat) / 31) [(4, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3753 : Rat) / 62) [(4, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3753 : Rat) / 62) [(5, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3753 : Rat) / 31) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((3753 : Rat) / 62) [(11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((3753 : Rat) / 62) [(11, 1), (13, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 278 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0278_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0278
        rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 =
      rs_R009_ueqv_R009NNNNY_partial_04_0278 := by
  native_decide

/-- Coefficient term 279 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0279 : Poly :=
[
  term ((1139 : Rat) / 31) [(11, 1), (13, 1), (14, 2), (16, 1)]
]

/-- Partial product 279 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0279 : Poly :=
[
  term ((-2278 : Rat) / 31) [(4, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((1139 : Rat) / 31) [(4, 2), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((1139 : Rat) / 31) [(5, 2), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((2278 : Rat) / 31) [(11, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-1139 : Rat) / 31) [(11, 1), (12, 2), (13, 1), (14, 2), (16, 1)],
  term ((-1139 : Rat) / 31) [(11, 1), (13, 3), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 279 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0279_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0279
        rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 =
      rs_R009_ueqv_R009NNNNY_partial_04_0279 := by
  native_decide

/-- Coefficient term 280 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0280 : Poly :=
[
  term ((1139 : Rat) / 31) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 280 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0280 : Poly :=
[
  term ((-2278 : Rat) / 31) [(4, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((1139 : Rat) / 31) [(4, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((1139 : Rat) / 31) [(5, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((2278 : Rat) / 31) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1139 : Rat) / 31) [(11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-1139 : Rat) / 31) [(11, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 280 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0280_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0280
        rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 =
      rs_R009_ueqv_R009NNNNY_partial_04_0280 := by
  native_decide

/-- Coefficient term 281 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0281 : Poly :=
[
  term ((4687 : Rat) / 372) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 281 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0281 : Poly :=
[
  term ((-4687 : Rat) / 186) [(4, 1), (11, 1), (13, 1), (16, 1)],
  term ((4687 : Rat) / 372) [(4, 2), (11, 1), (13, 1), (16, 1)],
  term ((4687 : Rat) / 372) [(5, 2), (11, 1), (13, 1), (16, 1)],
  term ((4687 : Rat) / 186) [(11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-4687 : Rat) / 372) [(11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-4687 : Rat) / 372) [(11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 281 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0281_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0281
        rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 =
      rs_R009_ueqv_R009NNNNY_partial_04_0281 := by
  native_decide

/-- Coefficient term 282 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0282 : Poly :=
[
  term ((962 : Rat) / 93) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 282 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0282 : Poly :=
[
  term ((-1924 : Rat) / 93) [(4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((962 : Rat) / 93) [(4, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((962 : Rat) / 93) [(5, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1924 : Rat) / 93) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-962 : Rat) / 93) [(11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-962 : Rat) / 93) [(11, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 282 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0282_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0282
        rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 =
      rs_R009_ueqv_R009NNNNY_partial_04_0282 := by
  native_decide

/-- Coefficient term 283 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0283 : Poly :=
[
  term ((-89 : Rat) / 31) [(11, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 283 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0283 : Poly :=
[
  term ((178 : Rat) / 31) [(4, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-89 : Rat) / 31) [(4, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-89 : Rat) / 31) [(5, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-178 : Rat) / 31) [(11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((89 : Rat) / 31) [(11, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((89 : Rat) / 31) [(11, 1), (13, 2), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 283 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0283_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0283
        rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 =
      rs_R009_ueqv_R009NNNNY_partial_04_0283 := by
  native_decide

/-- Coefficient term 284 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0284 : Poly :=
[
  term ((-72 : Rat) / 31) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 284 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0284 : Poly :=
[
  term ((144 : Rat) / 31) [(4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-72 : Rat) / 31) [(4, 2), (11, 1), (15, 1), (16, 1)],
  term ((-72 : Rat) / 31) [(5, 2), (11, 1), (15, 1), (16, 1)],
  term ((-144 : Rat) / 31) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term ((72 : Rat) / 31) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((72 : Rat) / 31) [(11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 284 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0284_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0284
        rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 =
      rs_R009_ueqv_R009NNNNY_partial_04_0284 := by
  native_decide

/-- Coefficient term 285 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0285 : Poly :=
[
  term ((-89 : Rat) / 31) [(11, 1), (15, 3), (16, 1)]
]

/-- Partial product 285 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0285 : Poly :=
[
  term ((178 : Rat) / 31) [(4, 1), (11, 1), (15, 3), (16, 1)],
  term ((-89 : Rat) / 31) [(4, 2), (11, 1), (15, 3), (16, 1)],
  term ((-89 : Rat) / 31) [(5, 2), (11, 1), (15, 3), (16, 1)],
  term ((-178 : Rat) / 31) [(11, 1), (12, 1), (15, 3), (16, 1)],
  term ((89 : Rat) / 31) [(11, 1), (12, 2), (15, 3), (16, 1)],
  term ((89 : Rat) / 31) [(11, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 285 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0285_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0285
        rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 =
      rs_R009_ueqv_R009NNNNY_partial_04_0285 := by
  native_decide

/-- Coefficient term 286 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0286 : Poly :=
[
  term (18 : Rat) [(11, 2), (12, 1), (16, 1)]
]

/-- Partial product 286 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0286 : Poly :=
[
  term (-36 : Rat) [(4, 1), (11, 2), (12, 1), (16, 1)],
  term (18 : Rat) [(4, 2), (11, 2), (12, 1), (16, 1)],
  term (18 : Rat) [(5, 2), (11, 2), (12, 1), (16, 1)],
  term (-18 : Rat) [(11, 2), (12, 1), (13, 2), (16, 1)],
  term (36 : Rat) [(11, 2), (12, 2), (16, 1)],
  term (-18 : Rat) [(11, 2), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 286 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0286_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0286
        rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 =
      rs_R009_ueqv_R009NNNNY_partial_04_0286 := by
  native_decide

/-- Coefficient term 287 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0287 : Poly :=
[
  term ((4853 : Rat) / 93) [(11, 2), (14, 1), (16, 1)]
]

/-- Partial product 287 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0287 : Poly :=
[
  term ((-9706 : Rat) / 93) [(4, 1), (11, 2), (14, 1), (16, 1)],
  term ((4853 : Rat) / 93) [(4, 2), (11, 2), (14, 1), (16, 1)],
  term ((4853 : Rat) / 93) [(5, 2), (11, 2), (14, 1), (16, 1)],
  term ((9706 : Rat) / 93) [(11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-4853 : Rat) / 93) [(11, 2), (12, 2), (14, 1), (16, 1)],
  term ((-4853 : Rat) / 93) [(11, 2), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 287 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0287_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0287
        rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 =
      rs_R009_ueqv_R009NNNNY_partial_04_0287 := by
  native_decide

/-- Coefficient term 288 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0288 : Poly :=
[
  term ((-953 : Rat) / 31) [(11, 2), (14, 2), (16, 1)]
]

/-- Partial product 288 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0288 : Poly :=
[
  term ((1906 : Rat) / 31) [(4, 1), (11, 2), (14, 2), (16, 1)],
  term ((-953 : Rat) / 31) [(4, 2), (11, 2), (14, 2), (16, 1)],
  term ((-953 : Rat) / 31) [(5, 2), (11, 2), (14, 2), (16, 1)],
  term ((-1906 : Rat) / 31) [(11, 2), (12, 1), (14, 2), (16, 1)],
  term ((953 : Rat) / 31) [(11, 2), (12, 2), (14, 2), (16, 1)],
  term ((953 : Rat) / 31) [(11, 2), (13, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 288 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0288_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0288
        rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 =
      rs_R009_ueqv_R009NNNNY_partial_04_0288 := by
  native_decide

/-- Coefficient term 289 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0289 : Poly :=
[
  term ((-953 : Rat) / 31) [(11, 2), (15, 2), (16, 1)]
]

/-- Partial product 289 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0289 : Poly :=
[
  term ((1906 : Rat) / 31) [(4, 1), (11, 2), (15, 2), (16, 1)],
  term ((-953 : Rat) / 31) [(4, 2), (11, 2), (15, 2), (16, 1)],
  term ((-953 : Rat) / 31) [(5, 2), (11, 2), (15, 2), (16, 1)],
  term ((-1906 : Rat) / 31) [(11, 2), (12, 1), (15, 2), (16, 1)],
  term ((953 : Rat) / 31) [(11, 2), (12, 2), (15, 2), (16, 1)],
  term ((953 : Rat) / 31) [(11, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 289 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0289_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0289
        rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 =
      rs_R009_ueqv_R009NNNNY_partial_04_0289 := by
  native_decide

/-- Coefficient term 290 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0290 : Poly :=
[
  term ((-308 : Rat) / 93) [(11, 2), (16, 1)]
]

/-- Partial product 290 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0290 : Poly :=
[
  term ((616 : Rat) / 93) [(4, 1), (11, 2), (16, 1)],
  term ((-308 : Rat) / 93) [(4, 2), (11, 2), (16, 1)],
  term ((-308 : Rat) / 93) [(5, 2), (11, 2), (16, 1)],
  term ((-616 : Rat) / 93) [(11, 2), (12, 1), (16, 1)],
  term ((308 : Rat) / 93) [(11, 2), (12, 2), (16, 1)],
  term ((308 : Rat) / 93) [(11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 290 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0290_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0290
        rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 =
      rs_R009_ueqv_R009NNNNY_partial_04_0290 := by
  native_decide

/-- Coefficient term 291 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0291 : Poly :=
[
  term ((116 : Rat) / 93) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 291 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0291 : Poly :=
[
  term ((-232 : Rat) / 93) [(4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((116 : Rat) / 93) [(4, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((116 : Rat) / 93) [(5, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-116 : Rat) / 93) [(12, 1), (13, 3), (15, 1), (16, 1)],
  term ((232 : Rat) / 93) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-116 : Rat) / 93) [(12, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 291 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0291_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0291
        rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 =
      rs_R009_ueqv_R009NNNNY_partial_04_0291 := by
  native_decide

/-- Coefficient term 292 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0292 : Poly :=
[
  term ((-3535 : Rat) / 372) [(12, 1), (14, 1), (16, 1)]
]

/-- Partial product 292 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0292 : Poly :=
[
  term ((3535 : Rat) / 186) [(4, 1), (12, 1), (14, 1), (16, 1)],
  term ((-3535 : Rat) / 372) [(4, 2), (12, 1), (14, 1), (16, 1)],
  term ((-3535 : Rat) / 372) [(5, 2), (12, 1), (14, 1), (16, 1)],
  term ((3535 : Rat) / 372) [(12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-3535 : Rat) / 186) [(12, 2), (14, 1), (16, 1)],
  term ((3535 : Rat) / 372) [(12, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 292 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0292_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0292
        rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 =
      rs_R009_ueqv_R009NNNNY_partial_04_0292 := by
  native_decide

/-- Coefficient term 293 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0293 : Poly :=
[
  term ((104 : Rat) / 31) [(12, 1), (14, 2), (16, 1)]
]

/-- Partial product 293 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0293 : Poly :=
[
  term ((-208 : Rat) / 31) [(4, 1), (12, 1), (14, 2), (16, 1)],
  term ((104 : Rat) / 31) [(4, 2), (12, 1), (14, 2), (16, 1)],
  term ((104 : Rat) / 31) [(5, 2), (12, 1), (14, 2), (16, 1)],
  term ((-104 : Rat) / 31) [(12, 1), (13, 2), (14, 2), (16, 1)],
  term ((208 : Rat) / 31) [(12, 2), (14, 2), (16, 1)],
  term ((-104 : Rat) / 31) [(12, 3), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 293 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0293_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0293
        rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 =
      rs_R009_ueqv_R009NNNNY_partial_04_0293 := by
  native_decide

/-- Coefficient term 294 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0294 : Poly :=
[
  term ((-721 : Rat) / 186) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 294 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0294 : Poly :=
[
  term ((721 : Rat) / 93) [(4, 1), (12, 1), (15, 2), (16, 1)],
  term ((-721 : Rat) / 186) [(4, 2), (12, 1), (15, 2), (16, 1)],
  term ((-721 : Rat) / 186) [(5, 2), (12, 1), (15, 2), (16, 1)],
  term ((721 : Rat) / 186) [(12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-721 : Rat) / 93) [(12, 2), (15, 2), (16, 1)],
  term ((721 : Rat) / 186) [(12, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 294 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0294_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0294
        rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 =
      rs_R009_ueqv_R009NNNNY_partial_04_0294 := by
  native_decide

/-- Coefficient term 295 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0295 : Poly :=
[
  term ((-191 : Rat) / 31) [(12, 1), (16, 1)]
]

/-- Partial product 295 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0295 : Poly :=
[
  term ((382 : Rat) / 31) [(4, 1), (12, 1), (16, 1)],
  term ((-191 : Rat) / 31) [(4, 2), (12, 1), (16, 1)],
  term ((-191 : Rat) / 31) [(5, 2), (12, 1), (16, 1)],
  term ((191 : Rat) / 31) [(12, 1), (13, 2), (16, 1)],
  term ((-382 : Rat) / 31) [(12, 2), (16, 1)],
  term ((191 : Rat) / 31) [(12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 295 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0295_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0295
        rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 =
      rs_R009_ueqv_R009NNNNY_partial_04_0295 := by
  native_decide

/-- Coefficient term 296 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0296 : Poly :=
[
  term ((58 : Rat) / 93) [(12, 2), (16, 1)]
]

/-- Partial product 296 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0296 : Poly :=
[
  term ((-116 : Rat) / 93) [(4, 1), (12, 2), (16, 1)],
  term ((58 : Rat) / 93) [(4, 2), (12, 2), (16, 1)],
  term ((58 : Rat) / 93) [(5, 2), (12, 2), (16, 1)],
  term ((-58 : Rat) / 93) [(12, 2), (13, 2), (16, 1)],
  term ((116 : Rat) / 93) [(12, 3), (16, 1)],
  term ((-58 : Rat) / 93) [(12, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 296 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0296_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0296
        rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 =
      rs_R009_ueqv_R009NNNNY_partial_04_0296 := by
  native_decide

/-- Coefficient term 297 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0297 : Poly :=
[
  term ((1505 : Rat) / 186) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 297 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0297 : Poly :=
[
  term ((-1505 : Rat) / 93) [(4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1505 : Rat) / 186) [(4, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1505 : Rat) / 186) [(5, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1505 : Rat) / 93) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1505 : Rat) / 186) [(12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1505 : Rat) / 186) [(13, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 297 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0297_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0297
        rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 =
      rs_R009_ueqv_R009NNNNY_partial_04_0297 := by
  native_decide

/-- Coefficient term 298 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0298 : Poly :=
[
  term ((-16 : Rat) / 31) [(13, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 298 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0298 : Poly :=
[
  term ((32 : Rat) / 31) [(4, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-16 : Rat) / 31) [(4, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-16 : Rat) / 31) [(5, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-32 : Rat) / 31) [(12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((16 : Rat) / 31) [(12, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((16 : Rat) / 31) [(13, 3), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 298 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0298_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0298
        rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 =
      rs_R009_ueqv_R009NNNNY_partial_04_0298 := by
  native_decide

/-- Coefficient term 299 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0299 : Poly :=
[
  term ((2519 : Rat) / 372) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 299 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0299 : Poly :=
[
  term ((-2519 : Rat) / 186) [(4, 1), (13, 1), (15, 1), (16, 1)],
  term ((2519 : Rat) / 372) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term ((2519 : Rat) / 372) [(5, 2), (13, 1), (15, 1), (16, 1)],
  term ((2519 : Rat) / 186) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2519 : Rat) / 372) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2519 : Rat) / 372) [(13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 299 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0299_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0299
        rs_R009_ueqv_R009NNNNY_generator_04_0200_0299 =
      rs_R009_ueqv_R009NNNNY_partial_04_0299 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NNNNY_partials_04_0200_0299 : List Poly :=
[
  rs_R009_ueqv_R009NNNNY_partial_04_0200,
  rs_R009_ueqv_R009NNNNY_partial_04_0201,
  rs_R009_ueqv_R009NNNNY_partial_04_0202,
  rs_R009_ueqv_R009NNNNY_partial_04_0203,
  rs_R009_ueqv_R009NNNNY_partial_04_0204,
  rs_R009_ueqv_R009NNNNY_partial_04_0205,
  rs_R009_ueqv_R009NNNNY_partial_04_0206,
  rs_R009_ueqv_R009NNNNY_partial_04_0207,
  rs_R009_ueqv_R009NNNNY_partial_04_0208,
  rs_R009_ueqv_R009NNNNY_partial_04_0209,
  rs_R009_ueqv_R009NNNNY_partial_04_0210,
  rs_R009_ueqv_R009NNNNY_partial_04_0211,
  rs_R009_ueqv_R009NNNNY_partial_04_0212,
  rs_R009_ueqv_R009NNNNY_partial_04_0213,
  rs_R009_ueqv_R009NNNNY_partial_04_0214,
  rs_R009_ueqv_R009NNNNY_partial_04_0215,
  rs_R009_ueqv_R009NNNNY_partial_04_0216,
  rs_R009_ueqv_R009NNNNY_partial_04_0217,
  rs_R009_ueqv_R009NNNNY_partial_04_0218,
  rs_R009_ueqv_R009NNNNY_partial_04_0219,
  rs_R009_ueqv_R009NNNNY_partial_04_0220,
  rs_R009_ueqv_R009NNNNY_partial_04_0221,
  rs_R009_ueqv_R009NNNNY_partial_04_0222,
  rs_R009_ueqv_R009NNNNY_partial_04_0223,
  rs_R009_ueqv_R009NNNNY_partial_04_0224,
  rs_R009_ueqv_R009NNNNY_partial_04_0225,
  rs_R009_ueqv_R009NNNNY_partial_04_0226,
  rs_R009_ueqv_R009NNNNY_partial_04_0227,
  rs_R009_ueqv_R009NNNNY_partial_04_0228,
  rs_R009_ueqv_R009NNNNY_partial_04_0229,
  rs_R009_ueqv_R009NNNNY_partial_04_0230,
  rs_R009_ueqv_R009NNNNY_partial_04_0231,
  rs_R009_ueqv_R009NNNNY_partial_04_0232,
  rs_R009_ueqv_R009NNNNY_partial_04_0233,
  rs_R009_ueqv_R009NNNNY_partial_04_0234,
  rs_R009_ueqv_R009NNNNY_partial_04_0235,
  rs_R009_ueqv_R009NNNNY_partial_04_0236,
  rs_R009_ueqv_R009NNNNY_partial_04_0237,
  rs_R009_ueqv_R009NNNNY_partial_04_0238,
  rs_R009_ueqv_R009NNNNY_partial_04_0239,
  rs_R009_ueqv_R009NNNNY_partial_04_0240,
  rs_R009_ueqv_R009NNNNY_partial_04_0241,
  rs_R009_ueqv_R009NNNNY_partial_04_0242,
  rs_R009_ueqv_R009NNNNY_partial_04_0243,
  rs_R009_ueqv_R009NNNNY_partial_04_0244,
  rs_R009_ueqv_R009NNNNY_partial_04_0245,
  rs_R009_ueqv_R009NNNNY_partial_04_0246,
  rs_R009_ueqv_R009NNNNY_partial_04_0247,
  rs_R009_ueqv_R009NNNNY_partial_04_0248,
  rs_R009_ueqv_R009NNNNY_partial_04_0249,
  rs_R009_ueqv_R009NNNNY_partial_04_0250,
  rs_R009_ueqv_R009NNNNY_partial_04_0251,
  rs_R009_ueqv_R009NNNNY_partial_04_0252,
  rs_R009_ueqv_R009NNNNY_partial_04_0253,
  rs_R009_ueqv_R009NNNNY_partial_04_0254,
  rs_R009_ueqv_R009NNNNY_partial_04_0255,
  rs_R009_ueqv_R009NNNNY_partial_04_0256,
  rs_R009_ueqv_R009NNNNY_partial_04_0257,
  rs_R009_ueqv_R009NNNNY_partial_04_0258,
  rs_R009_ueqv_R009NNNNY_partial_04_0259,
  rs_R009_ueqv_R009NNNNY_partial_04_0260,
  rs_R009_ueqv_R009NNNNY_partial_04_0261,
  rs_R009_ueqv_R009NNNNY_partial_04_0262,
  rs_R009_ueqv_R009NNNNY_partial_04_0263,
  rs_R009_ueqv_R009NNNNY_partial_04_0264,
  rs_R009_ueqv_R009NNNNY_partial_04_0265,
  rs_R009_ueqv_R009NNNNY_partial_04_0266,
  rs_R009_ueqv_R009NNNNY_partial_04_0267,
  rs_R009_ueqv_R009NNNNY_partial_04_0268,
  rs_R009_ueqv_R009NNNNY_partial_04_0269,
  rs_R009_ueqv_R009NNNNY_partial_04_0270,
  rs_R009_ueqv_R009NNNNY_partial_04_0271,
  rs_R009_ueqv_R009NNNNY_partial_04_0272,
  rs_R009_ueqv_R009NNNNY_partial_04_0273,
  rs_R009_ueqv_R009NNNNY_partial_04_0274,
  rs_R009_ueqv_R009NNNNY_partial_04_0275,
  rs_R009_ueqv_R009NNNNY_partial_04_0276,
  rs_R009_ueqv_R009NNNNY_partial_04_0277,
  rs_R009_ueqv_R009NNNNY_partial_04_0278,
  rs_R009_ueqv_R009NNNNY_partial_04_0279,
  rs_R009_ueqv_R009NNNNY_partial_04_0280,
  rs_R009_ueqv_R009NNNNY_partial_04_0281,
  rs_R009_ueqv_R009NNNNY_partial_04_0282,
  rs_R009_ueqv_R009NNNNY_partial_04_0283,
  rs_R009_ueqv_R009NNNNY_partial_04_0284,
  rs_R009_ueqv_R009NNNNY_partial_04_0285,
  rs_R009_ueqv_R009NNNNY_partial_04_0286,
  rs_R009_ueqv_R009NNNNY_partial_04_0287,
  rs_R009_ueqv_R009NNNNY_partial_04_0288,
  rs_R009_ueqv_R009NNNNY_partial_04_0289,
  rs_R009_ueqv_R009NNNNY_partial_04_0290,
  rs_R009_ueqv_R009NNNNY_partial_04_0291,
  rs_R009_ueqv_R009NNNNY_partial_04_0292,
  rs_R009_ueqv_R009NNNNY_partial_04_0293,
  rs_R009_ueqv_R009NNNNY_partial_04_0294,
  rs_R009_ueqv_R009NNNNY_partial_04_0295,
  rs_R009_ueqv_R009NNNNY_partial_04_0296,
  rs_R009_ueqv_R009NNNNY_partial_04_0297,
  rs_R009_ueqv_R009NNNNY_partial_04_0298,
  rs_R009_ueqv_R009NNNNY_partial_04_0299
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NNNNY_block_04_0200_0299 : Poly :=
[
  term ((8 : Rat) / 93) [(4, 1), (5, 1), (7, 1), (10, 1), (16, 1)],
  term ((-8 : Rat) / 93) [(4, 1), (5, 1), (7, 1), (16, 1)],
  term ((364 : Rat) / 93) [(4, 1), (5, 1), (9, 1), (10, 1), (16, 1)],
  term ((-364 : Rat) / 31) [(4, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-116 : Rat) / 31) [(4, 1), (5, 1), (9, 1), (12, 1), (16, 1)],
  term ((-8 : Rat) / 93) [(4, 1), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((-108 : Rat) / 31) [(4, 1), (5, 1), (9, 1), (16, 1)],
  term ((-356 : Rat) / 93) [(4, 1), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((-502 : Rat) / 31) [(4, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-2140 : Rat) / 93) [(4, 1), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((2278 : Rat) / 31) [(4, 1), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((950 : Rat) / 93) [(4, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((116 : Rat) / 31) [(4, 1), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((77 : Rat) / 31) [(4, 1), (5, 1), (11, 1), (16, 1)],
  term (-54 : Rat) [(4, 1), (5, 1), (11, 2), (15, 1), (16, 1)],
  term ((28 : Rat) / 31) [(4, 1), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((-236 : Rat) / 93) [(4, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-78 : Rat) / 31) [(4, 1), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((32 : Rat) / 31) [(4, 1), (5, 1), (13, 1), (14, 2), (16, 1)],
  term ((16 : Rat) / 31) [(4, 1), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((-5 : Rat) / 93) [(4, 1), (5, 1), (13, 1), (16, 1)],
  term ((-601 : Rat) / 93) [(4, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((394 : Rat) / 31) [(4, 1), (5, 1), (14, 2), (15, 1), (16, 1)],
  term ((-706 : Rat) / 93) [(4, 1), (5, 1), (15, 1), (16, 1)],
  term ((402 : Rat) / 31) [(4, 1), (5, 1), (15, 3), (16, 1)],
  term ((-196 : Rat) / 31) [(4, 1), (5, 2), (11, 1), (15, 1), (16, 1)],
  term (27 : Rat) [(4, 1), (5, 2), (11, 2), (14, 1), (16, 1)],
  term ((-5407 : Rat) / 93) [(4, 1), (5, 2), (11, 2), (16, 1)],
  term ((4 : Rat) / 31) [(4, 1), (5, 2), (12, 1), (14, 1), (16, 1)],
  term ((149 : Rat) / 62) [(4, 1), (5, 2), (12, 1), (16, 1)],
  term ((8 : Rat) / 31) [(4, 1), (5, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((35 : Rat) / 93) [(4, 1), (5, 2), (13, 1), (15, 1), (16, 1)],
  term ((74 : Rat) / 93) [(4, 1), (5, 2), (13, 2), (16, 1)],
  term ((-4 : Rat) / 31) [(4, 1), (5, 2), (14, 1), (15, 2), (16, 1)],
  term ((905 : Rat) / 372) [(4, 1), (5, 2), (14, 1), (16, 1)],
  term ((-875 : Rat) / 186) [(4, 1), (5, 2), (15, 2), (16, 1)],
  term ((-13097 : Rat) / 744) [(4, 1), (5, 2), (16, 1)],
  term ((-361 : Rat) / 93) [(4, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((-437 : Rat) / 93) [(4, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((371 : Rat) / 93) [(4, 1), (7, 1), (11, 1), (16, 1)],
  term ((121 : Rat) / 93) [(4, 1), (7, 1), (13, 1), (16, 1)],
  term ((-182 : Rat) / 93) [(4, 1), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((794 : Rat) / 31) [(4, 1), (8, 1), (10, 1), (16, 1)],
  term (-8 : Rat) [(4, 1), (8, 1), (12, 1), (16, 1)],
  term ((-847 : Rat) / 186) [(4, 1), (8, 1), (14, 1), (16, 1)],
  term ((-10391 : Rat) / 372) [(4, 1), (8, 1), (16, 1)],
  term ((232 : Rat) / 93) [(4, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-760 : Rat) / 93) [(4, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-662 : Rat) / 31) [(4, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((364 : Rat) / 31) [(4, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((364 : Rat) / 31) [(4, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((55 : Rat) / 31) [(4, 1), (9, 1), (11, 1), (16, 1)],
  term ((1391 : Rat) / 93) [(4, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((624 : Rat) / 31) [(4, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((395 : Rat) / 93) [(4, 1), (10, 1), (12, 1), (16, 1)],
  term ((-416 : Rat) / 31) [(4, 1), (10, 1), (12, 2), (16, 1)],
  term ((1046 : Rat) / 31) [(4, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-416 : Rat) / 31) [(4, 1), (10, 1), (13, 2), (16, 1)],
  term ((118 : Rat) / 93) [(4, 1), (10, 1), (14, 1), (16, 1)],
  term ((-842 : Rat) / 93) [(4, 1), (10, 1), (14, 2), (16, 1)],
  term ((-34 : Rat) / 31) [(4, 1), (10, 1), (15, 2), (16, 1)],
  term ((-154 : Rat) / 93) [(4, 1), (10, 1), (16, 1)],
  term ((1447 : Rat) / 93) [(4, 1), (10, 2), (14, 1), (16, 1)],
  term ((-2477 : Rat) / 186) [(4, 1), (10, 2), (16, 1)],
  term ((4556 : Rat) / 93) [(4, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-301 : Rat) / 31) [(4, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((3753 : Rat) / 31) [(4, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2278 : Rat) / 31) [(4, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-2278 : Rat) / 31) [(4, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-4687 : Rat) / 186) [(4, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1924 : Rat) / 93) [(4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((178 : Rat) / 31) [(4, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((144 : Rat) / 31) [(4, 1), (11, 1), (15, 1), (16, 1)],
  term ((178 : Rat) / 31) [(4, 1), (11, 1), (15, 3), (16, 1)],
  term (54 : Rat) [(4, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-13234 : Rat) / 93) [(4, 1), (11, 2), (12, 1), (16, 1)],
  term (-27 : Rat) [(4, 1), (11, 2), (12, 2), (14, 1), (16, 1)],
  term ((4943 : Rat) / 93) [(4, 1), (11, 2), (12, 2), (16, 1)],
  term (-27 : Rat) [(4, 1), (11, 2), (13, 2), (14, 1), (16, 1)],
  term ((4943 : Rat) / 93) [(4, 1), (11, 2), (13, 2), (16, 1)],
  term ((-9706 : Rat) / 93) [(4, 1), (11, 2), (14, 1), (16, 1)],
  term ((1906 : Rat) / 31) [(4, 1), (11, 2), (14, 2), (16, 1)],
  term ((1906 : Rat) / 31) [(4, 1), (11, 2), (15, 2), (16, 1)],
  term ((616 : Rat) / 93) [(4, 1), (11, 2), (16, 1)],
  term ((16 : Rat) / 31) [(4, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((94 : Rat) / 93) [(4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4 : Rat) / 31) [(4, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-29 : Rat) / 62) [(4, 1), (12, 1), (13, 2), (16, 1)],
  term ((-8 : Rat) / 31) [(4, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((2236 : Rat) / 93) [(4, 1), (12, 1), (14, 1), (16, 1)],
  term ((-208 : Rat) / 31) [(4, 1), (12, 1), (14, 2), (16, 1)],
  term ((726 : Rat) / 31) [(4, 1), (12, 1), (15, 2), (16, 1)],
  term ((-6929 : Rat) / 372) [(4, 1), (12, 1), (16, 1)],
  term ((-8 : Rat) / 31) [(4, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-163 : Rat) / 93) [(4, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-74 : Rat) / 93) [(4, 1), (12, 2), (13, 2), (16, 1)],
  term ((4 : Rat) / 31) [(4, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-841 : Rat) / 372) [(4, 1), (12, 2), (14, 1), (16, 1)],
  term ((-47 : Rat) / 6) [(4, 1), (12, 2), (15, 2), (16, 1)],
  term ((13649 : Rat) / 744) [(4, 1), (12, 2), (16, 1)],
  term ((-4 : Rat) / 31) [(4, 1), (12, 3), (14, 1), (16, 1)],
  term ((-383 : Rat) / 186) [(4, 1), (12, 3), (16, 1)],
  term ((-1505 : Rat) / 93) [(4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 31) [(4, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2519 : Rat) / 186) [(4, 1), (13, 1), (15, 1), (16, 1)],
  term ((4 : Rat) / 31) [(4, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-937 : Rat) / 372) [(4, 1), (13, 2), (14, 1), (16, 1)],
  term ((-47 : Rat) / 6) [(4, 1), (13, 2), (15, 2), (16, 1)],
  term ((11513 : Rat) / 744) [(4, 1), (13, 2), (16, 1)],
  term ((-8 : Rat) / 31) [(4, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-163 : Rat) / 93) [(4, 1), (13, 3), (15, 1), (16, 1)],
  term ((-74 : Rat) / 93) [(4, 1), (13, 4), (16, 1)],
  term ((-4 : Rat) / 93) [(4, 2), (5, 1), (7, 1), (10, 1), (16, 1)],
  term ((4 : Rat) / 93) [(4, 2), (5, 1), (7, 1), (16, 1)],
  term ((-182 : Rat) / 93) [(4, 2), (5, 1), (9, 1), (10, 1), (16, 1)],
  term ((182 : Rat) / 31) [(4, 2), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((58 : Rat) / 31) [(4, 2), (5, 1), (9, 1), (12, 1), (16, 1)],
  term ((4 : Rat) / 93) [(4, 2), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((54 : Rat) / 31) [(4, 2), (5, 1), (9, 1), (16, 1)],
  term ((178 : Rat) / 93) [(4, 2), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((251 : Rat) / 31) [(4, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((1070 : Rat) / 93) [(4, 2), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((-1139 : Rat) / 31) [(4, 2), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-475 : Rat) / 93) [(4, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-58 : Rat) / 31) [(4, 2), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((-77 : Rat) / 62) [(4, 2), (5, 1), (11, 1), (16, 1)],
  term (27 : Rat) [(4, 2), (5, 1), (11, 2), (15, 1), (16, 1)],
  term ((-14 : Rat) / 31) [(4, 2), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((118 : Rat) / 93) [(4, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((39 : Rat) / 31) [(4, 2), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((-16 : Rat) / 31) [(4, 2), (5, 1), (13, 1), (14, 2), (16, 1)],
  term ((-8 : Rat) / 31) [(4, 2), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((5 : Rat) / 186) [(4, 2), (5, 1), (13, 1), (16, 1)],
  term ((601 : Rat) / 186) [(4, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-197 : Rat) / 31) [(4, 2), (5, 1), (14, 2), (15, 1), (16, 1)],
  term ((353 : Rat) / 93) [(4, 2), (5, 1), (15, 1), (16, 1)],
  term ((-201 : Rat) / 31) [(4, 2), (5, 1), (15, 3), (16, 1)],
  term ((196 : Rat) / 31) [(4, 2), (5, 2), (11, 1), (15, 1), (16, 1)],
  term ((464 : Rat) / 93) [(4, 2), (5, 2), (11, 2), (16, 1)],
  term ((-8 : Rat) / 31) [(4, 2), (5, 2), (12, 1), (16, 1)],
  term ((80 : Rat) / 93) [(4, 2), (5, 2), (13, 1), (15, 1), (16, 1)],
  term ((4 : Rat) / 93) [(4, 2), (5, 2), (14, 1), (16, 1)],
  term ((575 : Rat) / 93) [(4, 2), (5, 2), (15, 2), (16, 1)],
  term ((532 : Rat) / 93) [(4, 2), (5, 2), (16, 1)],
  term ((361 : Rat) / 186) [(4, 2), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((437 : Rat) / 186) [(4, 2), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-371 : Rat) / 186) [(4, 2), (7, 1), (11, 1), (16, 1)],
  term ((-121 : Rat) / 186) [(4, 2), (7, 1), (13, 1), (16, 1)],
  term ((91 : Rat) / 93) [(4, 2), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((-397 : Rat) / 31) [(4, 2), (8, 1), (10, 1), (16, 1)],
  term (4 : Rat) [(4, 2), (8, 1), (12, 1), (16, 1)],
  term ((847 : Rat) / 372) [(4, 2), (8, 1), (14, 1), (16, 1)],
  term ((10391 : Rat) / 744) [(4, 2), (8, 1), (16, 1)],
  term ((-116 : Rat) / 93) [(4, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((380 : Rat) / 93) [(4, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((331 : Rat) / 31) [(4, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-182 : Rat) / 31) [(4, 2), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-182 : Rat) / 31) [(4, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-55 : Rat) / 62) [(4, 2), (9, 1), (11, 1), (16, 1)],
  term ((-1391 : Rat) / 186) [(4, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-312 : Rat) / 31) [(4, 2), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-395 : Rat) / 186) [(4, 2), (10, 1), (12, 1), (16, 1)],
  term ((208 : Rat) / 31) [(4, 2), (10, 1), (12, 2), (16, 1)],
  term ((-523 : Rat) / 31) [(4, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((208 : Rat) / 31) [(4, 2), (10, 1), (13, 2), (16, 1)],
  term ((-59 : Rat) / 93) [(4, 2), (10, 1), (14, 1), (16, 1)],
  term ((421 : Rat) / 93) [(4, 2), (10, 1), (14, 2), (16, 1)],
  term ((17 : Rat) / 31) [(4, 2), (10, 1), (15, 2), (16, 1)],
  term ((77 : Rat) / 93) [(4, 2), (10, 1), (16, 1)],
  term ((-1447 : Rat) / 186) [(4, 2), (10, 2), (14, 1), (16, 1)],
  term ((2477 : Rat) / 372) [(4, 2), (10, 2), (16, 1)],
  term ((-2278 : Rat) / 93) [(4, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((693 : Rat) / 62) [(4, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-98 : Rat) / 31) [(4, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-3753 : Rat) / 62) [(4, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((1139 : Rat) / 31) [(4, 2), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((1139 : Rat) / 31) [(4, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((4687 : Rat) / 372) [(4, 2), (11, 1), (13, 1), (16, 1)],
  term ((-98 : Rat) / 31) [(4, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((962 : Rat) / 93) [(4, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-89 : Rat) / 31) [(4, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-72 : Rat) / 31) [(4, 2), (11, 1), (15, 1), (16, 1)],
  term ((-89 : Rat) / 31) [(4, 2), (11, 1), (15, 3), (16, 1)],
  term ((2138 : Rat) / 93) [(4, 2), (11, 2), (12, 1), (16, 1)],
  term ((-232 : Rat) / 93) [(4, 2), (11, 2), (12, 2), (16, 1)],
  term ((-232 : Rat) / 93) [(4, 2), (11, 2), (13, 2), (16, 1)],
  term ((-169 : Rat) / 93) [(4, 2), (11, 2), (14, 1), (16, 1)],
  term ((-953 : Rat) / 31) [(4, 2), (11, 2), (14, 2), (16, 1)],
  term ((-953 : Rat) / 31) [(4, 2), (11, 2), (15, 2), (16, 1)],
  term ((9578 : Rat) / 93) [(4, 2), (11, 2), (16, 1)],
  term ((148 : Rat) / 93) [(4, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 93) [(4, 2), (12, 1), (13, 2), (16, 1)],
  term ((-3631 : Rat) / 372) [(4, 2), (12, 1), (14, 1), (16, 1)],
  term ((104 : Rat) / 31) [(4, 2), (12, 1), (14, 2), (16, 1)],
  term ((-251 : Rat) / 62) [(4, 2), (12, 1), (15, 2), (16, 1)],
  term ((-30 : Rat) / 31) [(4, 2), (12, 1), (16, 1)],
  term ((-16 : Rat) / 93) [(4, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 93) [(4, 2), (12, 2), (15, 2), (16, 1)],
  term ((-391 : Rat) / 93) [(4, 2), (12, 2), (16, 1)],
  term ((8 : Rat) / 93) [(4, 2), (12, 3), (16, 1)],
  term ((1409 : Rat) / 186) [(4, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 31) [(4, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((405 : Rat) / 124) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 93) [(4, 2), (13, 2), (15, 2), (16, 1)],
  term ((-581 : Rat) / 93) [(4, 2), (13, 2), (16, 1)],
  term ((-16 : Rat) / 93) [(4, 2), (13, 3), (15, 1), (16, 1)],
  term ((8 : Rat) / 31) [(4, 2), (14, 1), (15, 2), (16, 1)],
  term ((-937 : Rat) / 186) [(4, 2), (14, 1), (16, 1)],
  term ((-47 : Rat) / 3) [(4, 2), (15, 2), (16, 1)],
  term ((11513 : Rat) / 372) [(4, 2), (16, 1)],
  term ((-196 : Rat) / 31) [(4, 3), (11, 1), (15, 1), (16, 1)],
  term (27 : Rat) [(4, 3), (11, 2), (14, 1), (16, 1)],
  term ((-5407 : Rat) / 93) [(4, 3), (11, 2), (16, 1)],
  term ((4 : Rat) / 31) [(4, 3), (12, 1), (14, 1), (16, 1)],
  term ((415 : Rat) / 186) [(4, 3), (12, 1), (16, 1)],
  term ((8 : Rat) / 31) [(4, 3), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((131 : Rat) / 93) [(4, 3), (13, 1), (15, 1), (16, 1)],
  term ((74 : Rat) / 93) [(4, 3), (13, 2), (16, 1)],
  term ((-4 : Rat) / 31) [(4, 3), (14, 1), (15, 2), (16, 1)],
  term ((937 : Rat) / 372) [(4, 3), (14, 1), (16, 1)],
  term ((1489 : Rat) / 186) [(4, 3), (15, 2), (16, 1)],
  term ((-6147 : Rat) / 248) [(4, 3), (16, 1)],
  term ((98 : Rat) / 31) [(4, 4), (11, 1), (15, 1), (16, 1)],
  term ((232 : Rat) / 93) [(4, 4), (11, 2), (16, 1)],
  term ((-8 : Rat) / 93) [(4, 4), (12, 1), (16, 1)],
  term ((16 : Rat) / 93) [(4, 4), (13, 1), (15, 1), (16, 1)],
  term ((-8 : Rat) / 93) [(4, 4), (15, 2), (16, 1)],
  term ((433 : Rat) / 93) [(4, 4), (16, 1)],
  term ((-8 : Rat) / 93) [(5, 1), (7, 1), (10, 1), (12, 1), (16, 1)],
  term ((4 : Rat) / 93) [(5, 1), (7, 1), (10, 1), (12, 2), (16, 1)],
  term ((4 : Rat) / 93) [(5, 1), (7, 1), (10, 1), (13, 2), (16, 1)],
  term ((8 : Rat) / 93) [(5, 1), (7, 1), (12, 1), (16, 1)],
  term ((-4 : Rat) / 93) [(5, 1), (7, 1), (12, 2), (16, 1)],
  term ((-4 : Rat) / 93) [(5, 1), (7, 1), (13, 2), (16, 1)],
  term ((-364 : Rat) / 93) [(5, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((182 : Rat) / 93) [(5, 1), (9, 1), (10, 1), (12, 2), (16, 1)],
  term ((182 : Rat) / 93) [(5, 1), (9, 1), (10, 1), (13, 2), (16, 1)],
  term ((364 : Rat) / 31) [(5, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-182 : Rat) / 31) [(5, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-182 : Rat) / 31) [(5, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-58 : Rat) / 31) [(5, 1), (9, 1), (12, 1), (13, 2), (16, 1)],
  term ((8 : Rat) / 93) [(5, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((108 : Rat) / 31) [(5, 1), (9, 1), (12, 1), (16, 1)],
  term ((-4 : Rat) / 93) [(5, 1), (9, 1), (12, 2), (14, 1), (16, 1)],
  term (2 : Rat) [(5, 1), (9, 1), (12, 2), (16, 1)],
  term ((-58 : Rat) / 31) [(5, 1), (9, 1), (12, 3), (16, 1)],
  term ((-4 : Rat) / 93) [(5, 1), (9, 1), (13, 2), (14, 1), (16, 1)],
  term ((-54 : Rat) / 31) [(5, 1), (9, 1), (13, 2), (16, 1)],
  term ((356 : Rat) / 93) [(5, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-178 : Rat) / 93) [(5, 1), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((-178 : Rat) / 93) [(5, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((502 : Rat) / 31) [(5, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-251 : Rat) / 31) [(5, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-251 : Rat) / 31) [(5, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-2278 : Rat) / 31) [(5, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1070 : Rat) / 93) [(5, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-950 : Rat) / 93) [(5, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-116 : Rat) / 31) [(5, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-77 : Rat) / 31) [(5, 1), (11, 1), (12, 1), (16, 1)],
  term ((1139 : Rat) / 31) [(5, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((475 : Rat) / 93) [(5, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((58 : Rat) / 31) [(5, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((4511 : Rat) / 186) [(5, 1), (11, 1), (12, 2), (16, 1)],
  term ((-1070 : Rat) / 93) [(5, 1), (11, 1), (12, 3), (16, 1)],
  term ((475 : Rat) / 93) [(5, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((58 : Rat) / 31) [(5, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((77 : Rat) / 62) [(5, 1), (11, 1), (13, 2), (16, 1)],
  term ((1139 : Rat) / 31) [(5, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term (54 : Rat) [(5, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term (-27 : Rat) [(5, 1), (11, 2), (12, 2), (15, 1), (16, 1)],
  term (-27 : Rat) [(5, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((78 : Rat) / 31) [(5, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-32 : Rat) / 31) [(5, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-16 : Rat) / 31) [(5, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((5 : Rat) / 93) [(5, 1), (12, 1), (13, 1), (16, 1)],
  term ((-118 : Rat) / 93) [(5, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((14 : Rat) / 31) [(5, 1), (12, 1), (13, 3), (16, 1)],
  term ((601 : Rat) / 93) [(5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-394 : Rat) / 31) [(5, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((706 : Rat) / 93) [(5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-402 : Rat) / 31) [(5, 1), (12, 1), (15, 3), (16, 1)],
  term ((-39 : Rat) / 31) [(5, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((16 : Rat) / 31) [(5, 1), (12, 2), (13, 1), (14, 2), (16, 1)],
  term ((8 : Rat) / 31) [(5, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-173 : Rat) / 186) [(5, 1), (12, 2), (13, 1), (16, 1)],
  term ((-601 : Rat) / 186) [(5, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((197 : Rat) / 31) [(5, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((-39 : Rat) / 31) [(5, 1), (12, 2), (15, 1), (16, 1)],
  term ((201 : Rat) / 31) [(5, 1), (12, 2), (15, 3), (16, 1)],
  term ((14 : Rat) / 31) [(5, 1), (12, 3), (13, 1), (16, 1)],
  term ((-118 : Rat) / 93) [(5, 1), (12, 3), (15, 1), (16, 1)],
  term ((-601 : Rat) / 186) [(5, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((197 : Rat) / 31) [(5, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-353 : Rat) / 93) [(5, 1), (13, 2), (15, 1), (16, 1)],
  term ((201 : Rat) / 31) [(5, 1), (13, 2), (15, 3), (16, 1)],
  term ((-39 : Rat) / 31) [(5, 1), (13, 3), (14, 1), (16, 1)],
  term ((16 : Rat) / 31) [(5, 1), (13, 3), (14, 2), (16, 1)],
  term ((8 : Rat) / 31) [(5, 1), (13, 3), (15, 2), (16, 1)],
  term ((-5 : Rat) / 186) [(5, 1), (13, 3), (16, 1)],
  term ((361 : Rat) / 186) [(5, 2), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((437 : Rat) / 186) [(5, 2), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-371 : Rat) / 186) [(5, 2), (7, 1), (11, 1), (16, 1)],
  term ((-121 : Rat) / 186) [(5, 2), (7, 1), (13, 1), (16, 1)],
  term ((91 : Rat) / 93) [(5, 2), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((-397 : Rat) / 31) [(5, 2), (8, 1), (10, 1), (16, 1)],
  term (4 : Rat) [(5, 2), (8, 1), (12, 1), (16, 1)],
  term ((847 : Rat) / 372) [(5, 2), (8, 1), (14, 1), (16, 1)],
  term ((10391 : Rat) / 744) [(5, 2), (8, 1), (16, 1)],
  term ((-116 : Rat) / 93) [(5, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((380 : Rat) / 93) [(5, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((331 : Rat) / 31) [(5, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-182 : Rat) / 31) [(5, 2), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-182 : Rat) / 31) [(5, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-55 : Rat) / 62) [(5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-1391 : Rat) / 186) [(5, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-312 : Rat) / 31) [(5, 2), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-395 : Rat) / 186) [(5, 2), (10, 1), (12, 1), (16, 1)],
  term ((208 : Rat) / 31) [(5, 2), (10, 1), (12, 2), (16, 1)],
  term ((-523 : Rat) / 31) [(5, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((208 : Rat) / 31) [(5, 2), (10, 1), (13, 2), (16, 1)],
  term ((-59 : Rat) / 93) [(5, 2), (10, 1), (14, 1), (16, 1)],
  term ((421 : Rat) / 93) [(5, 2), (10, 1), (14, 2), (16, 1)],
  term ((17 : Rat) / 31) [(5, 2), (10, 1), (15, 2), (16, 1)],
  term ((77 : Rat) / 93) [(5, 2), (10, 1), (16, 1)],
  term ((-1447 : Rat) / 186) [(5, 2), (10, 2), (14, 1), (16, 1)],
  term ((2477 : Rat) / 372) [(5, 2), (10, 2), (16, 1)],
  term ((-2278 : Rat) / 93) [(5, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((693 : Rat) / 62) [(5, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-98 : Rat) / 31) [(5, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-3753 : Rat) / 62) [(5, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((1139 : Rat) / 31) [(5, 2), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((1139 : Rat) / 31) [(5, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((4687 : Rat) / 372) [(5, 2), (11, 1), (13, 1), (16, 1)],
  term ((-98 : Rat) / 31) [(5, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((962 : Rat) / 93) [(5, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-89 : Rat) / 31) [(5, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-72 : Rat) / 31) [(5, 2), (11, 1), (15, 1), (16, 1)],
  term ((-89 : Rat) / 31) [(5, 2), (11, 1), (15, 3), (16, 1)],
  term ((2138 : Rat) / 93) [(5, 2), (11, 2), (12, 1), (16, 1)],
  term ((-232 : Rat) / 93) [(5, 2), (11, 2), (12, 2), (16, 1)],
  term ((-232 : Rat) / 93) [(5, 2), (11, 2), (13, 2), (16, 1)],
  term ((4853 : Rat) / 93) [(5, 2), (11, 2), (14, 1), (16, 1)],
  term ((-953 : Rat) / 31) [(5, 2), (11, 2), (14, 2), (16, 1)],
  term ((-953 : Rat) / 31) [(5, 2), (11, 2), (15, 2), (16, 1)],
  term ((-308 : Rat) / 93) [(5, 2), (11, 2), (16, 1)],
  term ((244 : Rat) / 93) [(5, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 93) [(5, 2), (12, 1), (13, 2), (16, 1)],
  term ((-113 : Rat) / 12) [(5, 2), (12, 1), (14, 1), (16, 1)],
  term ((104 : Rat) / 31) [(5, 2), (12, 1), (14, 2), (16, 1)],
  term ((537 : Rat) / 62) [(5, 2), (12, 1), (15, 2), (16, 1)],
  term ((-125 : Rat) / 31) [(5, 2), (12, 1), (16, 1)],
  term ((-64 : Rat) / 93) [(5, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-4 : Rat) / 93) [(5, 2), (12, 2), (14, 1), (16, 1)],
  term ((-583 : Rat) / 93) [(5, 2), (12, 2), (15, 2), (16, 1)],
  term ((-73 : Rat) / 93) [(5, 2), (12, 2), (16, 1)],
  term ((16 : Rat) / 93) [(5, 2), (12, 3), (16, 1)],
  term ((1505 : Rat) / 186) [(5, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 31) [(5, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((2519 : Rat) / 372) [(5, 2), (13, 1), (15, 1), (16, 1)],
  term ((-4 : Rat) / 93) [(5, 2), (13, 2), (14, 1), (16, 1)],
  term ((-583 : Rat) / 93) [(5, 2), (13, 2), (15, 2), (16, 1)],
  term ((-33 : Rat) / 31) [(5, 2), (13, 2), (16, 1)],
  term ((-64 : Rat) / 93) [(5, 2), (13, 3), (15, 1), (16, 1)],
  term ((-4 : Rat) / 93) [(5, 3), (7, 1), (10, 1), (16, 1)],
  term ((4 : Rat) / 93) [(5, 3), (7, 1), (16, 1)],
  term ((-182 : Rat) / 93) [(5, 3), (9, 1), (10, 1), (16, 1)],
  term ((182 : Rat) / 31) [(5, 3), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((58 : Rat) / 31) [(5, 3), (9, 1), (12, 1), (16, 1)],
  term ((4 : Rat) / 93) [(5, 3), (9, 1), (14, 1), (16, 1)],
  term ((54 : Rat) / 31) [(5, 3), (9, 1), (16, 1)],
  term ((178 : Rat) / 93) [(5, 3), (10, 1), (11, 1), (16, 1)],
  term ((251 : Rat) / 31) [(5, 3), (10, 1), (15, 1), (16, 1)],
  term ((1070 : Rat) / 93) [(5, 3), (11, 1), (12, 1), (16, 1)],
  term ((-1139 : Rat) / 31) [(5, 3), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-475 : Rat) / 93) [(5, 3), (11, 1), (14, 1), (16, 1)],
  term ((-58 : Rat) / 31) [(5, 3), (11, 1), (15, 2), (16, 1)],
  term ((-77 : Rat) / 62) [(5, 3), (11, 1), (16, 1)],
  term (27 : Rat) [(5, 3), (11, 2), (15, 1), (16, 1)],
  term ((-14 : Rat) / 31) [(5, 3), (12, 1), (13, 1), (16, 1)],
  term ((118 : Rat) / 93) [(5, 3), (12, 1), (15, 1), (16, 1)],
  term ((39 : Rat) / 31) [(5, 3), (13, 1), (14, 1), (16, 1)],
  term ((-16 : Rat) / 31) [(5, 3), (13, 1), (14, 2), (16, 1)],
  term ((-8 : Rat) / 31) [(5, 3), (13, 1), (15, 2), (16, 1)],
  term ((5 : Rat) / 186) [(5, 3), (13, 1), (16, 1)],
  term ((601 : Rat) / 186) [(5, 3), (14, 1), (15, 1), (16, 1)],
  term ((-197 : Rat) / 31) [(5, 3), (14, 2), (15, 1), (16, 1)],
  term ((353 : Rat) / 93) [(5, 3), (15, 1), (16, 1)],
  term ((-201 : Rat) / 31) [(5, 3), (15, 3), (16, 1)],
  term ((98 : Rat) / 31) [(5, 4), (11, 1), (15, 1), (16, 1)],
  term ((232 : Rat) / 93) [(5, 4), (11, 2), (16, 1)],
  term ((-16 : Rat) / 93) [(5, 4), (12, 1), (16, 1)],
  term ((64 : Rat) / 93) [(5, 4), (13, 1), (15, 1), (16, 1)],
  term ((4 : Rat) / 93) [(5, 4), (14, 1), (16, 1)],
  term ((583 : Rat) / 93) [(5, 4), (15, 2), (16, 1)],
  term ((33 : Rat) / 31) [(5, 4), (16, 1)],
  term ((361 : Rat) / 93) [(7, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-361 : Rat) / 186) [(7, 1), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((-361 : Rat) / 186) [(7, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((437 : Rat) / 93) [(7, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-437 : Rat) / 186) [(7, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((-437 : Rat) / 186) [(7, 1), (10, 1), (13, 3), (16, 1)],
  term ((-371 : Rat) / 93) [(7, 1), (11, 1), (12, 1), (16, 1)],
  term ((371 : Rat) / 186) [(7, 1), (11, 1), (12, 2), (16, 1)],
  term ((371 : Rat) / 186) [(7, 1), (11, 1), (13, 2), (16, 1)],
  term ((-121 : Rat) / 93) [(7, 1), (12, 1), (13, 1), (16, 1)],
  term ((121 : Rat) / 186) [(7, 1), (12, 2), (13, 1), (16, 1)],
  term ((121 : Rat) / 186) [(7, 1), (13, 3), (16, 1)],
  term ((182 : Rat) / 93) [(8, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-794 : Rat) / 31) [(8, 1), (10, 1), (12, 1), (16, 1)],
  term ((-91 : Rat) / 93) [(8, 1), (10, 1), (12, 2), (14, 1), (16, 1)],
  term ((397 : Rat) / 31) [(8, 1), (10, 1), (12, 2), (16, 1)],
  term ((-91 : Rat) / 93) [(8, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((397 : Rat) / 31) [(8, 1), (10, 1), (13, 2), (16, 1)],
  term (-4 : Rat) [(8, 1), (12, 1), (13, 2), (16, 1)],
  term ((847 : Rat) / 186) [(8, 1), (12, 1), (14, 1), (16, 1)],
  term ((10391 : Rat) / 372) [(8, 1), (12, 1), (16, 1)],
  term ((-847 : Rat) / 372) [(8, 1), (12, 2), (14, 1), (16, 1)],
  term ((-4439 : Rat) / 744) [(8, 1), (12, 2), (16, 1)],
  term (-4 : Rat) [(8, 1), (12, 3), (16, 1)],
  term ((-847 : Rat) / 372) [(8, 1), (13, 2), (14, 1), (16, 1)],
  term ((-10391 : Rat) / 744) [(8, 1), (13, 2), (16, 1)],
  term ((-232 : Rat) / 93) [(9, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((116 : Rat) / 93) [(9, 1), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((116 : Rat) / 93) [(9, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((-380 : Rat) / 93) [(9, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((662 : Rat) / 31) [(9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-364 : Rat) / 31) [(9, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-364 : Rat) / 31) [(9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-55 : Rat) / 31) [(9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-331 : Rat) / 31) [(9, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((182 : Rat) / 31) [(9, 1), (11, 1), (12, 2), (14, 2), (16, 1)],
  term ((182 : Rat) / 31) [(9, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((1685 : Rat) / 186) [(9, 1), (11, 1), (12, 2), (16, 1)],
  term ((-380 : Rat) / 93) [(9, 1), (11, 1), (12, 3), (16, 1)],
  term ((-331 : Rat) / 31) [(9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((182 : Rat) / 31) [(9, 1), (11, 1), (13, 2), (14, 2), (16, 1)],
  term ((182 : Rat) / 31) [(9, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((55 : Rat) / 62) [(9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-1391 : Rat) / 93) [(10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1391 : Rat) / 186) [(10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((1391 : Rat) / 186) [(10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1046 : Rat) / 31) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((312 : Rat) / 31) [(10, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((2891 : Rat) / 186) [(10, 1), (12, 1), (13, 2), (16, 1)],
  term ((-118 : Rat) / 93) [(10, 1), (12, 1), (14, 1), (16, 1)],
  term ((842 : Rat) / 93) [(10, 1), (12, 1), (14, 2), (16, 1)],
  term ((34 : Rat) / 31) [(10, 1), (12, 1), (15, 2), (16, 1)],
  term ((154 : Rat) / 93) [(10, 1), (12, 1), (16, 1)],
  term ((523 : Rat) / 31) [(10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-416 : Rat) / 31) [(10, 1), (12, 2), (13, 2), (16, 1)],
  term ((-1813 : Rat) / 93) [(10, 1), (12, 2), (14, 1), (16, 1)],
  term ((-421 : Rat) / 93) [(10, 1), (12, 2), (14, 2), (16, 1)],
  term ((-17 : Rat) / 31) [(10, 1), (12, 2), (15, 2), (16, 1)],
  term ((-472 : Rat) / 93) [(10, 1), (12, 2), (16, 1)],
  term ((312 : Rat) / 31) [(10, 1), (12, 3), (14, 1), (16, 1)],
  term ((2891 : Rat) / 186) [(10, 1), (12, 3), (16, 1)],
  term ((-208 : Rat) / 31) [(10, 1), (12, 4), (16, 1)],
  term ((59 : Rat) / 93) [(10, 1), (13, 2), (14, 1), (16, 1)],
  term ((-421 : Rat) / 93) [(10, 1), (13, 2), (14, 2), (16, 1)],
  term ((-17 : Rat) / 31) [(10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-77 : Rat) / 93) [(10, 1), (13, 2), (16, 1)],
  term ((523 : Rat) / 31) [(10, 1), (13, 3), (15, 1), (16, 1)],
  term ((-208 : Rat) / 31) [(10, 1), (13, 4), (16, 1)],
  term ((-1447 : Rat) / 93) [(10, 2), (12, 1), (14, 1), (16, 1)],
  term ((2477 : Rat) / 186) [(10, 2), (12, 1), (16, 1)],
  term ((1447 : Rat) / 186) [(10, 2), (12, 2), (14, 1), (16, 1)],
  term ((-2477 : Rat) / 372) [(10, 2), (12, 2), (16, 1)],
  term ((1447 : Rat) / 186) [(10, 2), (13, 2), (14, 1), (16, 1)],
  term ((-2477 : Rat) / 372) [(10, 2), (13, 2), (16, 1)],
  term ((-3753 : Rat) / 31) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((2278 : Rat) / 31) [(11, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((2278 : Rat) / 31) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((4687 : Rat) / 186) [(11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-301 : Rat) / 62) [(11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((2278 : Rat) / 93) [(11, 1), (12, 1), (13, 3), (16, 1)],
  term ((1924 : Rat) / 93) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-178 : Rat) / 31) [(11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-144 : Rat) / 31) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-178 : Rat) / 31) [(11, 1), (12, 1), (15, 3), (16, 1)],
  term ((3753 : Rat) / 62) [(11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-1139 : Rat) / 31) [(11, 1), (12, 2), (13, 1), (14, 2), (16, 1)],
  term ((-1139 : Rat) / 31) [(11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-7637 : Rat) / 124) [(11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-962 : Rat) / 93) [(11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((89 : Rat) / 31) [(11, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((373 : Rat) / 31) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((89 : Rat) / 31) [(11, 1), (12, 2), (15, 3), (16, 1)],
  term ((2278 : Rat) / 93) [(11, 1), (12, 3), (13, 1), (16, 1)],
  term ((-301 : Rat) / 62) [(11, 1), (12, 3), (15, 1), (16, 1)],
  term ((-962 : Rat) / 93) [(11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((89 : Rat) / 31) [(11, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((72 : Rat) / 31) [(11, 1), (13, 2), (15, 1), (16, 1)],
  term ((89 : Rat) / 31) [(11, 1), (13, 2), (15, 3), (16, 1)],
  term ((3753 : Rat) / 62) [(11, 1), (13, 3), (14, 1), (16, 1)],
  term ((-1139 : Rat) / 31) [(11, 1), (13, 3), (14, 2), (16, 1)],
  term ((-1139 : Rat) / 31) [(11, 1), (13, 3), (15, 2), (16, 1)],
  term ((-4687 : Rat) / 372) [(11, 1), (13, 3), (16, 1)],
  term (-18 : Rat) [(11, 2), (12, 1), (13, 2), (16, 1)],
  term ((9706 : Rat) / 93) [(11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-1906 : Rat) / 31) [(11, 2), (12, 1), (14, 2), (16, 1)],
  term ((-1906 : Rat) / 31) [(11, 2), (12, 1), (15, 2), (16, 1)],
  term ((-616 : Rat) / 93) [(11, 2), (12, 1), (16, 1)],
  term ((-4853 : Rat) / 93) [(11, 2), (12, 2), (14, 1), (16, 1)],
  term ((953 : Rat) / 31) [(11, 2), (12, 2), (14, 2), (16, 1)],
  term ((953 : Rat) / 31) [(11, 2), (12, 2), (15, 2), (16, 1)],
  term ((3656 : Rat) / 93) [(11, 2), (12, 2), (16, 1)],
  term (-18 : Rat) [(11, 2), (12, 3), (16, 1)],
  term ((-4853 : Rat) / 93) [(11, 2), (13, 2), (14, 1), (16, 1)],
  term ((953 : Rat) / 31) [(11, 2), (13, 2), (14, 2), (16, 1)],
  term ((953 : Rat) / 31) [(11, 2), (13, 2), (15, 2), (16, 1)],
  term ((308 : Rat) / 93) [(11, 2), (13, 2), (16, 1)],
  term ((1505 : Rat) / 93) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 31) [(12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((2519 : Rat) / 186) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((3535 : Rat) / 372) [(12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-104 : Rat) / 31) [(12, 1), (13, 2), (14, 2), (16, 1)],
  term ((721 : Rat) / 186) [(12, 1), (13, 2), (15, 2), (16, 1)],
  term ((191 : Rat) / 31) [(12, 1), (13, 2), (16, 1)],
  term ((-116 : Rat) / 93) [(12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-1505 : Rat) / 186) [(12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 31) [(12, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1591 : Rat) / 372) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-58 : Rat) / 93) [(12, 2), (13, 2), (16, 1)],
  term ((-3535 : Rat) / 186) [(12, 2), (14, 1), (16, 1)],
  term ((208 : Rat) / 31) [(12, 2), (14, 2), (16, 1)],
  term ((-721 : Rat) / 93) [(12, 2), (15, 2), (16, 1)],
  term ((-382 : Rat) / 31) [(12, 2), (16, 1)],
  term ((-116 : Rat) / 93) [(12, 3), (13, 1), (15, 1), (16, 1)],
  term ((3535 : Rat) / 372) [(12, 3), (14, 1), (16, 1)],
  term ((-104 : Rat) / 31) [(12, 3), (14, 2), (16, 1)],
  term ((721 : Rat) / 186) [(12, 3), (15, 2), (16, 1)],
  term ((689 : Rat) / 93) [(12, 3), (16, 1)],
  term ((-58 : Rat) / 93) [(12, 4), (16, 1)],
  term ((-1505 : Rat) / 186) [(13, 3), (14, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 31) [(13, 3), (14, 2), (15, 1), (16, 1)],
  term ((-2519 : Rat) / 372) [(13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 4, terms 200 through 299. -/
theorem rs_R009_ueqv_R009NNNNY_block_04_0200_0299_valid :
    checkProductSumEq rs_R009_ueqv_R009NNNNY_partials_04_0200_0299
      rs_R009_ueqv_R009NNNNY_block_04_0200_0299 = true := by
  native_decide

end R009UeqvR009NNNNYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
