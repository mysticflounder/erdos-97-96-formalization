/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R014:u=v:R014YY, term block 1:200-288

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R014UeqvR014YYTermShards

/-- Generator polynomial 1 for relaxed split surplus certificate `R014:u=v:R014YY`. -/
def rs_R014_ueqv_R014YY_generator_01_0200_0288 : Poly :=
[
  term (1 : Rat) [(0, 2)],
  term (1 : Rat) [(1, 2)],
  term (-1 : Rat) [(8, 2)],
  term (-1 : Rat) [(9, 2)]
]

/-- Coefficient term 200 from coefficient polynomial 1. -/
def rs_R014_ueqv_R014YY_coefficient_01_0200 : Poly :=
[
  term ((-77 : Rat) / 120) [(7, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 200 for generator 1. -/
def rs_R014_ueqv_R014YY_partial_01_0200 : Poly :=
[
  term ((-77 : Rat) / 120) [(0, 2), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-77 : Rat) / 120) [(1, 2), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((77 : Rat) / 120) [(7, 1), (8, 2), (11, 1), (13, 1), (15, 1)],
  term ((77 : Rat) / 120) [(7, 1), (9, 2), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 1. -/
theorem rs_R014_ueqv_R014YY_partial_01_0200_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_01_0200
        rs_R014_ueqv_R014YY_generator_01_0200_0288 =
      rs_R014_ueqv_R014YY_partial_01_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 1. -/
def rs_R014_ueqv_R014YY_coefficient_01_0201 : Poly :=
[
  term ((89 : Rat) / 240) [(7, 1), (11, 1), (14, 1)]
]

/-- Partial product 201 for generator 1. -/
def rs_R014_ueqv_R014YY_partial_01_0201 : Poly :=
[
  term ((89 : Rat) / 240) [(0, 2), (7, 1), (11, 1), (14, 1)],
  term ((89 : Rat) / 240) [(1, 2), (7, 1), (11, 1), (14, 1)],
  term ((-89 : Rat) / 240) [(7, 1), (8, 2), (11, 1), (14, 1)],
  term ((-89 : Rat) / 240) [(7, 1), (9, 2), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 1. -/
theorem rs_R014_ueqv_R014YY_partial_01_0201_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_01_0201
        rs_R014_ueqv_R014YY_generator_01_0200_0288 =
      rs_R014_ueqv_R014YY_partial_01_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 1. -/
def rs_R014_ueqv_R014YY_coefficient_01_0202 : Poly :=
[
  term ((1 : Rat) / 2) [(7, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 202 for generator 1. -/
def rs_R014_ueqv_R014YY_partial_01_0202 : Poly :=
[
  term ((1 : Rat) / 2) [(0, 2), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((1 : Rat) / 2) [(1, 2), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1 : Rat) / 2) [(7, 1), (8, 2), (11, 1), (14, 1), (16, 1)],
  term ((-1 : Rat) / 2) [(7, 1), (9, 2), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 1. -/
theorem rs_R014_ueqv_R014YY_partial_01_0202_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_01_0202
        rs_R014_ueqv_R014YY_generator_01_0200_0288 =
      rs_R014_ueqv_R014YY_partial_01_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 1. -/
def rs_R014_ueqv_R014YY_coefficient_01_0203 : Poly :=
[
  term ((-49 : Rat) / 30) [(7, 1), (11, 1), (14, 2)]
]

/-- Partial product 203 for generator 1. -/
def rs_R014_ueqv_R014YY_partial_01_0203 : Poly :=
[
  term ((-49 : Rat) / 30) [(0, 2), (7, 1), (11, 1), (14, 2)],
  term ((-49 : Rat) / 30) [(1, 2), (7, 1), (11, 1), (14, 2)],
  term ((49 : Rat) / 30) [(7, 1), (8, 2), (11, 1), (14, 2)],
  term ((49 : Rat) / 30) [(7, 1), (9, 2), (11, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 1. -/
theorem rs_R014_ueqv_R014YY_partial_01_0203_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_01_0203
        rs_R014_ueqv_R014YY_generator_01_0200_0288 =
      rs_R014_ueqv_R014YY_partial_01_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 1. -/
def rs_R014_ueqv_R014YY_coefficient_01_0204 : Poly :=
[
  term ((7 : Rat) / 10) [(7, 1), (11, 1), (15, 2)]
]

/-- Partial product 204 for generator 1. -/
def rs_R014_ueqv_R014YY_partial_01_0204 : Poly :=
[
  term ((7 : Rat) / 10) [(0, 2), (7, 1), (11, 1), (15, 2)],
  term ((7 : Rat) / 10) [(1, 2), (7, 1), (11, 1), (15, 2)],
  term ((-7 : Rat) / 10) [(7, 1), (8, 2), (11, 1), (15, 2)],
  term ((-7 : Rat) / 10) [(7, 1), (9, 2), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 1. -/
theorem rs_R014_ueqv_R014YY_partial_01_0204_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_01_0204
        rs_R014_ueqv_R014YY_generator_01_0200_0288 =
      rs_R014_ueqv_R014YY_partial_01_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 1. -/
def rs_R014_ueqv_R014YY_coefficient_01_0205 : Poly :=
[
  term ((-19 : Rat) / 8) [(7, 1), (11, 1), (16, 1)]
]

/-- Partial product 205 for generator 1. -/
def rs_R014_ueqv_R014YY_partial_01_0205 : Poly :=
[
  term ((-19 : Rat) / 8) [(0, 2), (7, 1), (11, 1), (16, 1)],
  term ((-19 : Rat) / 8) [(1, 2), (7, 1), (11, 1), (16, 1)],
  term ((19 : Rat) / 8) [(7, 1), (8, 2), (11, 1), (16, 1)],
  term ((19 : Rat) / 8) [(7, 1), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 1. -/
theorem rs_R014_ueqv_R014YY_partial_01_0205_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_01_0205
        rs_R014_ueqv_R014YY_generator_01_0200_0288 =
      rs_R014_ueqv_R014YY_partial_01_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 1. -/
def rs_R014_ueqv_R014YY_coefficient_01_0206 : Poly :=
[
  term ((-941 : Rat) / 120) [(7, 1), (13, 1)]
]

/-- Partial product 206 for generator 1. -/
def rs_R014_ueqv_R014YY_partial_01_0206 : Poly :=
[
  term ((-941 : Rat) / 120) [(0, 2), (7, 1), (13, 1)],
  term ((-941 : Rat) / 120) [(1, 2), (7, 1), (13, 1)],
  term ((941 : Rat) / 120) [(7, 1), (8, 2), (13, 1)],
  term ((941 : Rat) / 120) [(7, 1), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 1. -/
theorem rs_R014_ueqv_R014YY_partial_01_0206_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_01_0206
        rs_R014_ueqv_R014YY_generator_01_0200_0288 =
      rs_R014_ueqv_R014YY_partial_01_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 1. -/
def rs_R014_ueqv_R014YY_coefficient_01_0207 : Poly :=
[
  term ((-667 : Rat) / 80) [(7, 1), (13, 1), (14, 1)]
]

/-- Partial product 207 for generator 1. -/
def rs_R014_ueqv_R014YY_partial_01_0207 : Poly :=
[
  term ((-667 : Rat) / 80) [(0, 2), (7, 1), (13, 1), (14, 1)],
  term ((-667 : Rat) / 80) [(1, 2), (7, 1), (13, 1), (14, 1)],
  term ((667 : Rat) / 80) [(7, 1), (8, 2), (13, 1), (14, 1)],
  term ((667 : Rat) / 80) [(7, 1), (9, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 1. -/
theorem rs_R014_ueqv_R014YY_partial_01_0207_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_01_0207
        rs_R014_ueqv_R014YY_generator_01_0200_0288 =
      rs_R014_ueqv_R014YY_partial_01_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 1. -/
def rs_R014_ueqv_R014YY_coefficient_01_0208 : Poly :=
[
  term (3 : Rat) [(7, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 208 for generator 1. -/
def rs_R014_ueqv_R014YY_partial_01_0208 : Poly :=
[
  term (3 : Rat) [(0, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term (3 : Rat) [(1, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term (-3 : Rat) [(7, 1), (8, 2), (13, 1), (14, 1), (16, 1)],
  term (-3 : Rat) [(7, 1), (9, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 1. -/
theorem rs_R014_ueqv_R014YY_partial_01_0208_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_01_0208
        rs_R014_ueqv_R014YY_generator_01_0200_0288 =
      rs_R014_ueqv_R014YY_partial_01_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 1. -/
def rs_R014_ueqv_R014YY_coefficient_01_0209 : Poly :=
[
  term ((49 : Rat) / 60) [(7, 1), (13, 1), (14, 2)]
]

/-- Partial product 209 for generator 1. -/
def rs_R014_ueqv_R014YY_partial_01_0209 : Poly :=
[
  term ((49 : Rat) / 60) [(0, 2), (7, 1), (13, 1), (14, 2)],
  term ((49 : Rat) / 60) [(1, 2), (7, 1), (13, 1), (14, 2)],
  term ((-49 : Rat) / 60) [(7, 1), (8, 2), (13, 1), (14, 2)],
  term ((-49 : Rat) / 60) [(7, 1), (9, 2), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 1. -/
theorem rs_R014_ueqv_R014YY_partial_01_0209_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_01_0209
        rs_R014_ueqv_R014YY_generator_01_0200_0288 =
      rs_R014_ueqv_R014YY_partial_01_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 1. -/
def rs_R014_ueqv_R014YY_coefficient_01_0210 : Poly :=
[
  term ((-133 : Rat) / 24) [(7, 1), (13, 1), (15, 2)]
]

/-- Partial product 210 for generator 1. -/
def rs_R014_ueqv_R014YY_partial_01_0210 : Poly :=
[
  term ((-133 : Rat) / 24) [(0, 2), (7, 1), (13, 1), (15, 2)],
  term ((-133 : Rat) / 24) [(1, 2), (7, 1), (13, 1), (15, 2)],
  term ((133 : Rat) / 24) [(7, 1), (8, 2), (13, 1), (15, 2)],
  term ((133 : Rat) / 24) [(7, 1), (9, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 1. -/
theorem rs_R014_ueqv_R014YY_partial_01_0210_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_01_0210
        rs_R014_ueqv_R014YY_generator_01_0200_0288 =
      rs_R014_ueqv_R014YY_partial_01_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 1. -/
def rs_R014_ueqv_R014YY_coefficient_01_0211 : Poly :=
[
  term ((7 : Rat) / 4) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 211 for generator 1. -/
def rs_R014_ueqv_R014YY_partial_01_0211 : Poly :=
[
  term ((7 : Rat) / 4) [(0, 2), (7, 1), (13, 1), (16, 1)],
  term ((7 : Rat) / 4) [(1, 2), (7, 1), (13, 1), (16, 1)],
  term ((-7 : Rat) / 4) [(7, 1), (8, 2), (13, 1), (16, 1)],
  term ((-7 : Rat) / 4) [(7, 1), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 1. -/
theorem rs_R014_ueqv_R014YY_partial_01_0211_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_01_0211
        rs_R014_ueqv_R014YY_generator_01_0200_0288 =
      rs_R014_ueqv_R014YY_partial_01_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 1. -/
def rs_R014_ueqv_R014YY_coefficient_01_0212 : Poly :=
[
  term ((-21 : Rat) / 8) [(7, 1), (13, 2), (15, 1)]
]

/-- Partial product 212 for generator 1. -/
def rs_R014_ueqv_R014YY_partial_01_0212 : Poly :=
[
  term ((-21 : Rat) / 8) [(0, 2), (7, 1), (13, 2), (15, 1)],
  term ((-21 : Rat) / 8) [(1, 2), (7, 1), (13, 2), (15, 1)],
  term ((21 : Rat) / 8) [(7, 1), (8, 2), (13, 2), (15, 1)],
  term ((21 : Rat) / 8) [(7, 1), (9, 2), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 1. -/
theorem rs_R014_ueqv_R014YY_partial_01_0212_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_01_0212
        rs_R014_ueqv_R014YY_generator_01_0200_0288 =
      rs_R014_ueqv_R014YY_partial_01_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 1. -/
def rs_R014_ueqv_R014YY_coefficient_01_0213 : Poly :=
[
  term ((-217 : Rat) / 240) [(7, 1), (14, 1), (15, 1)]
]

/-- Partial product 213 for generator 1. -/
def rs_R014_ueqv_R014YY_partial_01_0213 : Poly :=
[
  term ((-217 : Rat) / 240) [(0, 2), (7, 1), (14, 1), (15, 1)],
  term ((-217 : Rat) / 240) [(1, 2), (7, 1), (14, 1), (15, 1)],
  term ((217 : Rat) / 240) [(7, 1), (8, 2), (14, 1), (15, 1)],
  term ((217 : Rat) / 240) [(7, 1), (9, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 1. -/
theorem rs_R014_ueqv_R014YY_partial_01_0213_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_01_0213
        rs_R014_ueqv_R014YY_generator_01_0200_0288 =
      rs_R014_ueqv_R014YY_partial_01_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 1. -/
def rs_R014_ueqv_R014YY_coefficient_01_0214 : Poly :=
[
  term ((7 : Rat) / 2) [(7, 1), (14, 2), (15, 1)]
]

/-- Partial product 214 for generator 1. -/
def rs_R014_ueqv_R014YY_partial_01_0214 : Poly :=
[
  term ((7 : Rat) / 2) [(0, 2), (7, 1), (14, 2), (15, 1)],
  term ((7 : Rat) / 2) [(1, 2), (7, 1), (14, 2), (15, 1)],
  term ((-7 : Rat) / 2) [(7, 1), (8, 2), (14, 2), (15, 1)],
  term ((-7 : Rat) / 2) [(7, 1), (9, 2), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 1. -/
theorem rs_R014_ueqv_R014YY_partial_01_0214_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_01_0214
        rs_R014_ueqv_R014YY_generator_01_0200_0288 =
      rs_R014_ueqv_R014YY_partial_01_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 1. -/
def rs_R014_ueqv_R014YY_coefficient_01_0215 : Poly :=
[
  term ((-2311 : Rat) / 240) [(7, 1), (15, 1)]
]

/-- Partial product 215 for generator 1. -/
def rs_R014_ueqv_R014YY_partial_01_0215 : Poly :=
[
  term ((-2311 : Rat) / 240) [(0, 2), (7, 1), (15, 1)],
  term ((-2311 : Rat) / 240) [(1, 2), (7, 1), (15, 1)],
  term ((2311 : Rat) / 240) [(7, 1), (8, 2), (15, 1)],
  term ((2311 : Rat) / 240) [(7, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 1. -/
theorem rs_R014_ueqv_R014YY_partial_01_0215_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_01_0215
        rs_R014_ueqv_R014YY_generator_01_0200_0288 =
      rs_R014_ueqv_R014YY_partial_01_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 1. -/
def rs_R014_ueqv_R014YY_coefficient_01_0216 : Poly :=
[
  term (6 : Rat) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 216 for generator 1. -/
def rs_R014_ueqv_R014YY_partial_01_0216 : Poly :=
[
  term (6 : Rat) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(7, 1), (8, 2), (15, 1), (16, 1)],
  term (-6 : Rat) [(7, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 1. -/
theorem rs_R014_ueqv_R014YY_partial_01_0216_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_01_0216
        rs_R014_ueqv_R014YY_generator_01_0200_0288 =
      rs_R014_ueqv_R014YY_partial_01_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 1. -/
def rs_R014_ueqv_R014YY_coefficient_01_0217 : Poly :=
[
  term ((7 : Rat) / 2) [(7, 1), (15, 3)]
]

/-- Partial product 217 for generator 1. -/
def rs_R014_ueqv_R014YY_partial_01_0217 : Poly :=
[
  term ((7 : Rat) / 2) [(0, 2), (7, 1), (15, 3)],
  term ((7 : Rat) / 2) [(1, 2), (7, 1), (15, 3)],
  term ((-7 : Rat) / 2) [(7, 1), (8, 2), (15, 3)],
  term ((-7 : Rat) / 2) [(7, 1), (9, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 1. -/
theorem rs_R014_ueqv_R014YY_partial_01_0217_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_01_0217
        rs_R014_ueqv_R014YY_generator_01_0200_0288 =
      rs_R014_ueqv_R014YY_partial_01_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 1. -/
def rs_R014_ueqv_R014YY_coefficient_01_0218 : Poly :=
[
  term ((904391 : Rat) / 9240) [(8, 1)]
]

/-- Partial product 218 for generator 1. -/
def rs_R014_ueqv_R014YY_partial_01_0218 : Poly :=
[
  term ((904391 : Rat) / 9240) [(0, 2), (8, 1)],
  term ((904391 : Rat) / 9240) [(1, 2), (8, 1)],
  term ((-904391 : Rat) / 9240) [(8, 1), (9, 2)],
  term ((-904391 : Rat) / 9240) [(8, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 1. -/
theorem rs_R014_ueqv_R014YY_partial_01_0218_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_01_0218
        rs_R014_ueqv_R014YY_generator_01_0200_0288 =
      rs_R014_ueqv_R014YY_partial_01_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 1. -/
def rs_R014_ueqv_R014YY_coefficient_01_0219 : Poly :=
[
  term ((-31 : Rat) / 24) [(8, 1), (10, 1)]
]

/-- Partial product 219 for generator 1. -/
def rs_R014_ueqv_R014YY_partial_01_0219 : Poly :=
[
  term ((-31 : Rat) / 24) [(0, 2), (8, 1), (10, 1)],
  term ((-31 : Rat) / 24) [(1, 2), (8, 1), (10, 1)],
  term ((31 : Rat) / 24) [(8, 1), (9, 2), (10, 1)],
  term ((31 : Rat) / 24) [(8, 3), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 1. -/
theorem rs_R014_ueqv_R014YY_partial_01_0219_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_01_0219
        rs_R014_ueqv_R014YY_generator_01_0200_0288 =
      rs_R014_ueqv_R014YY_partial_01_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 1. -/
def rs_R014_ueqv_R014YY_coefficient_01_0220 : Poly :=
[
  term ((1 : Rat) / 6) [(8, 1), (10, 1), (14, 1)]
]

/-- Partial product 220 for generator 1. -/
def rs_R014_ueqv_R014YY_partial_01_0220 : Poly :=
[
  term ((1 : Rat) / 6) [(0, 2), (8, 1), (10, 1), (14, 1)],
  term ((1 : Rat) / 6) [(1, 2), (8, 1), (10, 1), (14, 1)],
  term ((-1 : Rat) / 6) [(8, 1), (9, 2), (10, 1), (14, 1)],
  term ((-1 : Rat) / 6) [(8, 3), (10, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 1. -/
theorem rs_R014_ueqv_R014YY_partial_01_0220_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_01_0220
        rs_R014_ueqv_R014YY_generator_01_0200_0288 =
      rs_R014_ueqv_R014YY_partial_01_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 1. -/
def rs_R014_ueqv_R014YY_coefficient_01_0221 : Poly :=
[
  term ((-1 : Rat) / 3) [(8, 1), (10, 1), (15, 2)]
]

/-- Partial product 221 for generator 1. -/
def rs_R014_ueqv_R014YY_partial_01_0221 : Poly :=
[
  term ((-1 : Rat) / 3) [(0, 2), (8, 1), (10, 1), (15, 2)],
  term ((-1 : Rat) / 3) [(1, 2), (8, 1), (10, 1), (15, 2)],
  term ((1 : Rat) / 3) [(8, 1), (9, 2), (10, 1), (15, 2)],
  term ((1 : Rat) / 3) [(8, 3), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 1. -/
theorem rs_R014_ueqv_R014YY_partial_01_0221_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_01_0221
        rs_R014_ueqv_R014YY_generator_01_0200_0288 =
      rs_R014_ueqv_R014YY_partial_01_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 1. -/
def rs_R014_ueqv_R014YY_coefficient_01_0222 : Poly :=
[
  term ((-1 : Rat) / 12) [(8, 1), (11, 1), (13, 1)]
]

/-- Partial product 222 for generator 1. -/
def rs_R014_ueqv_R014YY_partial_01_0222 : Poly :=
[
  term ((-1 : Rat) / 12) [(0, 2), (8, 1), (11, 1), (13, 1)],
  term ((-1 : Rat) / 12) [(1, 2), (8, 1), (11, 1), (13, 1)],
  term ((1 : Rat) / 12) [(8, 1), (9, 2), (11, 1), (13, 1)],
  term ((1 : Rat) / 12) [(8, 3), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 1. -/
theorem rs_R014_ueqv_R014YY_partial_01_0222_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_01_0222
        rs_R014_ueqv_R014YY_generator_01_0200_0288 =
      rs_R014_ueqv_R014YY_partial_01_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 1. -/
def rs_R014_ueqv_R014YY_coefficient_01_0223 : Poly :=
[
  term ((1 : Rat) / 3) [(8, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 223 for generator 1. -/
def rs_R014_ueqv_R014YY_partial_01_0223 : Poly :=
[
  term ((1 : Rat) / 3) [(0, 2), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((1 : Rat) / 3) [(1, 2), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((-1 : Rat) / 3) [(8, 1), (9, 2), (11, 1), (14, 1), (15, 1)],
  term ((-1 : Rat) / 3) [(8, 3), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 1. -/
theorem rs_R014_ueqv_R014YY_partial_01_0223_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_01_0223
        rs_R014_ueqv_R014YY_generator_01_0200_0288 =
      rs_R014_ueqv_R014YY_partial_01_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 1. -/
def rs_R014_ueqv_R014YY_coefficient_01_0224 : Poly :=
[
  term ((13 : Rat) / 3) [(8, 1), (11, 1), (15, 1)]
]

/-- Partial product 224 for generator 1. -/
def rs_R014_ueqv_R014YY_partial_01_0224 : Poly :=
[
  term ((13 : Rat) / 3) [(0, 2), (8, 1), (11, 1), (15, 1)],
  term ((13 : Rat) / 3) [(1, 2), (8, 1), (11, 1), (15, 1)],
  term ((-13 : Rat) / 3) [(8, 1), (9, 2), (11, 1), (15, 1)],
  term ((-13 : Rat) / 3) [(8, 3), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 1. -/
theorem rs_R014_ueqv_R014YY_partial_01_0224_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_01_0224
        rs_R014_ueqv_R014YY_generator_01_0200_0288 =
      rs_R014_ueqv_R014YY_partial_01_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 1. -/
def rs_R014_ueqv_R014YY_coefficient_01_0225 : Poly :=
[
  term ((5 : Rat) / 6) [(8, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 225 for generator 1. -/
def rs_R014_ueqv_R014YY_partial_01_0225 : Poly :=
[
  term ((5 : Rat) / 6) [(0, 2), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((5 : Rat) / 6) [(1, 2), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((-5 : Rat) / 6) [(8, 1), (9, 2), (13, 1), (14, 1), (15, 1)],
  term ((-5 : Rat) / 6) [(8, 3), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 1. -/
theorem rs_R014_ueqv_R014YY_partial_01_0225_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_01_0225
        rs_R014_ueqv_R014YY_generator_01_0200_0288 =
      rs_R014_ueqv_R014YY_partial_01_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 1. -/
def rs_R014_ueqv_R014YY_coefficient_01_0226 : Poly :=
[
  term ((1329829 : Rat) / 2310) [(8, 1), (13, 1), (15, 1)]
]

/-- Partial product 226 for generator 1. -/
def rs_R014_ueqv_R014YY_partial_01_0226 : Poly :=
[
  term ((1329829 : Rat) / 2310) [(0, 2), (8, 1), (13, 1), (15, 1)],
  term ((1329829 : Rat) / 2310) [(1, 2), (8, 1), (13, 1), (15, 1)],
  term ((-1329829 : Rat) / 2310) [(8, 1), (9, 2), (13, 1), (15, 1)],
  term ((-1329829 : Rat) / 2310) [(8, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 1. -/
theorem rs_R014_ueqv_R014YY_partial_01_0226_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_01_0226
        rs_R014_ueqv_R014YY_generator_01_0200_0288 =
      rs_R014_ueqv_R014YY_partial_01_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 1. -/
def rs_R014_ueqv_R014YY_coefficient_01_0227 : Poly :=
[
  term ((4 : Rat) / 3) [(8, 1), (13, 2)]
]

/-- Partial product 227 for generator 1. -/
def rs_R014_ueqv_R014YY_partial_01_0227 : Poly :=
[
  term ((4 : Rat) / 3) [(0, 2), (8, 1), (13, 2)],
  term ((4 : Rat) / 3) [(1, 2), (8, 1), (13, 2)],
  term ((-4 : Rat) / 3) [(8, 1), (9, 2), (13, 2)],
  term ((-4 : Rat) / 3) [(8, 3), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 1. -/
theorem rs_R014_ueqv_R014YY_partial_01_0227_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_01_0227
        rs_R014_ueqv_R014YY_generator_01_0200_0288 =
      rs_R014_ueqv_R014YY_partial_01_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 1. -/
def rs_R014_ueqv_R014YY_coefficient_01_0228 : Poly :=
[
  term ((1352929 : Rat) / 4620) [(8, 1), (14, 1)]
]

/-- Partial product 228 for generator 1. -/
def rs_R014_ueqv_R014YY_partial_01_0228 : Poly :=
[
  term ((1352929 : Rat) / 4620) [(0, 2), (8, 1), (14, 1)],
  term ((1352929 : Rat) / 4620) [(1, 2), (8, 1), (14, 1)],
  term ((-1352929 : Rat) / 4620) [(8, 1), (9, 2), (14, 1)],
  term ((-1352929 : Rat) / 4620) [(8, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 1. -/
theorem rs_R014_ueqv_R014YY_partial_01_0228_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_01_0228
        rs_R014_ueqv_R014YY_generator_01_0200_0288 =
      rs_R014_ueqv_R014YY_partial_01_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 1. -/
def rs_R014_ueqv_R014YY_coefficient_01_0229 : Poly :=
[
  term ((-150411 : Rat) / 385) [(8, 1), (14, 2)]
]

/-- Partial product 229 for generator 1. -/
def rs_R014_ueqv_R014YY_partial_01_0229 : Poly :=
[
  term ((-150411 : Rat) / 385) [(0, 2), (8, 1), (14, 2)],
  term ((-150411 : Rat) / 385) [(1, 2), (8, 1), (14, 2)],
  term ((150411 : Rat) / 385) [(8, 1), (9, 2), (14, 2)],
  term ((150411 : Rat) / 385) [(8, 3), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 1. -/
theorem rs_R014_ueqv_R014YY_partial_01_0229_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_01_0229
        rs_R014_ueqv_R014YY_generator_01_0200_0288 =
      rs_R014_ueqv_R014YY_partial_01_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 1. -/
def rs_R014_ueqv_R014YY_coefficient_01_0230 : Poly :=
[
  term ((-599719 : Rat) / 1540) [(8, 1), (15, 2)]
]

/-- Partial product 230 for generator 1. -/
def rs_R014_ueqv_R014YY_partial_01_0230 : Poly :=
[
  term ((-599719 : Rat) / 1540) [(0, 2), (8, 1), (15, 2)],
  term ((-599719 : Rat) / 1540) [(1, 2), (8, 1), (15, 2)],
  term ((599719 : Rat) / 1540) [(8, 1), (9, 2), (15, 2)],
  term ((599719 : Rat) / 1540) [(8, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 1. -/
theorem rs_R014_ueqv_R014YY_partial_01_0230_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_01_0230
        rs_R014_ueqv_R014YY_generator_01_0200_0288 =
      rs_R014_ueqv_R014YY_partial_01_0230 := by
  native_decide

/-- Coefficient term 231 from coefficient polynomial 1. -/
def rs_R014_ueqv_R014YY_coefficient_01_0231 : Poly :=
[
  term (-1 : Rat) [(9, 1), (10, 1), (13, 1)]
]

/-- Partial product 231 for generator 1. -/
def rs_R014_ueqv_R014YY_partial_01_0231 : Poly :=
[
  term (-1 : Rat) [(0, 2), (9, 1), (10, 1), (13, 1)],
  term (-1 : Rat) [(1, 2), (9, 1), (10, 1), (13, 1)],
  term (1 : Rat) [(8, 2), (9, 1), (10, 1), (13, 1)],
  term (1 : Rat) [(9, 3), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 231 for generator 1. -/
theorem rs_R014_ueqv_R014YY_partial_01_0231_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_01_0231
        rs_R014_ueqv_R014YY_generator_01_0200_0288 =
      rs_R014_ueqv_R014YY_partial_01_0231 := by
  native_decide

/-- Coefficient term 232 from coefficient polynomial 1. -/
def rs_R014_ueqv_R014YY_coefficient_01_0232 : Poly :=
[
  term ((1 : Rat) / 3) [(9, 1), (10, 1), (14, 1), (15, 1)]
]

/-- Partial product 232 for generator 1. -/
def rs_R014_ueqv_R014YY_partial_01_0232 : Poly :=
[
  term ((1 : Rat) / 3) [(0, 2), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((1 : Rat) / 3) [(1, 2), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-1 : Rat) / 3) [(8, 2), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-1 : Rat) / 3) [(9, 3), (10, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 232 for generator 1. -/
theorem rs_R014_ueqv_R014YY_partial_01_0232_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_01_0232
        rs_R014_ueqv_R014YY_generator_01_0200_0288 =
      rs_R014_ueqv_R014YY_partial_01_0232 := by
  native_decide

/-- Coefficient term 233 from coefficient polynomial 1. -/
def rs_R014_ueqv_R014YY_coefficient_01_0233 : Poly :=
[
  term ((-35 : Rat) / 12) [(9, 1), (10, 1), (15, 1)]
]

/-- Partial product 233 for generator 1. -/
def rs_R014_ueqv_R014YY_partial_01_0233 : Poly :=
[
  term ((-35 : Rat) / 12) [(0, 2), (9, 1), (10, 1), (15, 1)],
  term ((-35 : Rat) / 12) [(1, 2), (9, 1), (10, 1), (15, 1)],
  term ((35 : Rat) / 12) [(8, 2), (9, 1), (10, 1), (15, 1)],
  term ((35 : Rat) / 12) [(9, 3), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 233 for generator 1. -/
theorem rs_R014_ueqv_R014YY_partial_01_0233_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_01_0233
        rs_R014_ueqv_R014YY_generator_01_0200_0288 =
      rs_R014_ueqv_R014YY_partial_01_0233 := by
  native_decide

/-- Coefficient term 234 from coefficient polynomial 1. -/
def rs_R014_ueqv_R014YY_coefficient_01_0234 : Poly :=
[
  term ((-2 : Rat) / 3) [(9, 1), (11, 1)]
]

/-- Partial product 234 for generator 1. -/
def rs_R014_ueqv_R014YY_partial_01_0234 : Poly :=
[
  term ((-2 : Rat) / 3) [(0, 2), (9, 1), (11, 1)],
  term ((-2 : Rat) / 3) [(1, 2), (9, 1), (11, 1)],
  term ((2 : Rat) / 3) [(8, 2), (9, 1), (11, 1)],
  term ((2 : Rat) / 3) [(9, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 234 for generator 1. -/
theorem rs_R014_ueqv_R014YY_partial_01_0234_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_01_0234
        rs_R014_ueqv_R014YY_generator_01_0200_0288 =
      rs_R014_ueqv_R014YY_partial_01_0234 := by
  native_decide

/-- Coefficient term 235 from coefficient polynomial 1. -/
def rs_R014_ueqv_R014YY_coefficient_01_0235 : Poly :=
[
  term ((-1 : Rat) / 6) [(9, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 235 for generator 1. -/
def rs_R014_ueqv_R014YY_partial_01_0235 : Poly :=
[
  term ((-1 : Rat) / 6) [(0, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1 : Rat) / 6) [(1, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((1 : Rat) / 6) [(8, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((1 : Rat) / 6) [(9, 3), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 235 for generator 1. -/
theorem rs_R014_ueqv_R014YY_partial_01_0235_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_01_0235
        rs_R014_ueqv_R014YY_generator_01_0200_0288 =
      rs_R014_ueqv_R014YY_partial_01_0235 := by
  native_decide

/-- Coefficient term 236 from coefficient polynomial 1. -/
def rs_R014_ueqv_R014YY_coefficient_01_0236 : Poly :=
[
  term ((-3 : Rat) / 2) [(9, 1), (11, 1), (14, 1)]
]

/-- Partial product 236 for generator 1. -/
def rs_R014_ueqv_R014YY_partial_01_0236 : Poly :=
[
  term ((-3 : Rat) / 2) [(0, 2), (9, 1), (11, 1), (14, 1)],
  term ((-3 : Rat) / 2) [(1, 2), (9, 1), (11, 1), (14, 1)],
  term ((3 : Rat) / 2) [(8, 2), (9, 1), (11, 1), (14, 1)],
  term ((3 : Rat) / 2) [(9, 3), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 236 for generator 1. -/
theorem rs_R014_ueqv_R014YY_partial_01_0236_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_01_0236
        rs_R014_ueqv_R014YY_generator_01_0200_0288 =
      rs_R014_ueqv_R014YY_partial_01_0236 := by
  native_decide

/-- Coefficient term 237 from coefficient polynomial 1. -/
def rs_R014_ueqv_R014YY_coefficient_01_0237 : Poly :=
[
  term ((1 : Rat) / 3) [(9, 1), (11, 1), (15, 2)]
]

/-- Partial product 237 for generator 1. -/
def rs_R014_ueqv_R014YY_partial_01_0237 : Poly :=
[
  term ((1 : Rat) / 3) [(0, 2), (9, 1), (11, 1), (15, 2)],
  term ((1 : Rat) / 3) [(1, 2), (9, 1), (11, 1), (15, 2)],
  term ((-1 : Rat) / 3) [(8, 2), (9, 1), (11, 1), (15, 2)],
  term ((-1 : Rat) / 3) [(9, 3), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 237 for generator 1. -/
theorem rs_R014_ueqv_R014YY_partial_01_0237_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_01_0237
        rs_R014_ueqv_R014YY_generator_01_0200_0288 =
      rs_R014_ueqv_R014YY_partial_01_0237 := by
  native_decide

/-- Coefficient term 238 from coefficient polynomial 1. -/
def rs_R014_ueqv_R014YY_coefficient_01_0238 : Poly :=
[
  term ((11 : Rat) / 24) [(9, 1), (13, 1)]
]

/-- Partial product 238 for generator 1. -/
def rs_R014_ueqv_R014YY_partial_01_0238 : Poly :=
[
  term ((11 : Rat) / 24) [(0, 2), (9, 1), (13, 1)],
  term ((11 : Rat) / 24) [(1, 2), (9, 1), (13, 1)],
  term ((-11 : Rat) / 24) [(8, 2), (9, 1), (13, 1)],
  term ((-11 : Rat) / 24) [(9, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 238 for generator 1. -/
theorem rs_R014_ueqv_R014YY_partial_01_0238_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_01_0238
        rs_R014_ueqv_R014YY_generator_01_0200_0288 =
      rs_R014_ueqv_R014YY_partial_01_0238 := by
  native_decide

/-- Coefficient term 239 from coefficient polynomial 1. -/
def rs_R014_ueqv_R014YY_coefficient_01_0239 : Poly :=
[
  term ((35 : Rat) / 24) [(9, 1), (13, 1), (14, 1)]
]

/-- Partial product 239 for generator 1. -/
def rs_R014_ueqv_R014YY_partial_01_0239 : Poly :=
[
  term ((35 : Rat) / 24) [(0, 2), (9, 1), (13, 1), (14, 1)],
  term ((35 : Rat) / 24) [(1, 2), (9, 1), (13, 1), (14, 1)],
  term ((-35 : Rat) / 24) [(8, 2), (9, 1), (13, 1), (14, 1)],
  term ((-35 : Rat) / 24) [(9, 3), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 239 for generator 1. -/
theorem rs_R014_ueqv_R014YY_partial_01_0239_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_01_0239
        rs_R014_ueqv_R014YY_generator_01_0200_0288 =
      rs_R014_ueqv_R014YY_partial_01_0239 := by
  native_decide

/-- Coefficient term 240 from coefficient polynomial 1. -/
def rs_R014_ueqv_R014YY_coefficient_01_0240 : Poly :=
[
  term ((-5 : Rat) / 2) [(9, 1), (13, 1), (15, 2)]
]

/-- Partial product 240 for generator 1. -/
def rs_R014_ueqv_R014YY_partial_01_0240 : Poly :=
[
  term ((-5 : Rat) / 2) [(0, 2), (9, 1), (13, 1), (15, 2)],
  term ((-5 : Rat) / 2) [(1, 2), (9, 1), (13, 1), (15, 2)],
  term ((5 : Rat) / 2) [(8, 2), (9, 1), (13, 1), (15, 2)],
  term ((5 : Rat) / 2) [(9, 3), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 240 for generator 1. -/
theorem rs_R014_ueqv_R014YY_partial_01_0240_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_01_0240
        rs_R014_ueqv_R014YY_generator_01_0200_0288 =
      rs_R014_ueqv_R014YY_partial_01_0240 := by
  native_decide

/-- Coefficient term 241 from coefficient polynomial 1. -/
def rs_R014_ueqv_R014YY_coefficient_01_0241 : Poly :=
[
  term ((-25 : Rat) / 12) [(9, 1), (14, 1), (15, 1)]
]

/-- Partial product 241 for generator 1. -/
def rs_R014_ueqv_R014YY_partial_01_0241 : Poly :=
[
  term ((-25 : Rat) / 12) [(0, 2), (9, 1), (14, 1), (15, 1)],
  term ((-25 : Rat) / 12) [(1, 2), (9, 1), (14, 1), (15, 1)],
  term ((25 : Rat) / 12) [(8, 2), (9, 1), (14, 1), (15, 1)],
  term ((25 : Rat) / 12) [(9, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 241 for generator 1. -/
theorem rs_R014_ueqv_R014YY_partial_01_0241_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_01_0241
        rs_R014_ueqv_R014YY_generator_01_0200_0288 =
      rs_R014_ueqv_R014YY_partial_01_0241 := by
  native_decide

/-- Coefficient term 242 from coefficient polynomial 1. -/
def rs_R014_ueqv_R014YY_coefficient_01_0242 : Poly :=
[
  term (2 : Rat) [(9, 1), (14, 2), (15, 1)]
]

/-- Partial product 242 for generator 1. -/
def rs_R014_ueqv_R014YY_partial_01_0242 : Poly :=
[
  term (2 : Rat) [(0, 2), (9, 1), (14, 2), (15, 1)],
  term (2 : Rat) [(1, 2), (9, 1), (14, 2), (15, 1)],
  term (-2 : Rat) [(8, 2), (9, 1), (14, 2), (15, 1)],
  term (-2 : Rat) [(9, 3), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 242 for generator 1. -/
theorem rs_R014_ueqv_R014YY_partial_01_0242_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_01_0242
        rs_R014_ueqv_R014YY_generator_01_0200_0288 =
      rs_R014_ueqv_R014YY_partial_01_0242 := by
  native_decide

/-- Coefficient term 243 from coefficient polynomial 1. -/
def rs_R014_ueqv_R014YY_coefficient_01_0243 : Poly :=
[
  term ((139 : Rat) / 48) [(9, 1), (15, 1)]
]

/-- Partial product 243 for generator 1. -/
def rs_R014_ueqv_R014YY_partial_01_0243 : Poly :=
[
  term ((139 : Rat) / 48) [(0, 2), (9, 1), (15, 1)],
  term ((139 : Rat) / 48) [(1, 2), (9, 1), (15, 1)],
  term ((-139 : Rat) / 48) [(8, 2), (9, 1), (15, 1)],
  term ((-139 : Rat) / 48) [(9, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 243 for generator 1. -/
theorem rs_R014_ueqv_R014YY_partial_01_0243_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_01_0243
        rs_R014_ueqv_R014YY_generator_01_0200_0288 =
      rs_R014_ueqv_R014YY_partial_01_0243 := by
  native_decide

/-- Coefficient term 244 from coefficient polynomial 1. -/
def rs_R014_ueqv_R014YY_coefficient_01_0244 : Poly :=
[
  term (2 : Rat) [(9, 1), (15, 3)]
]

/-- Partial product 244 for generator 1. -/
def rs_R014_ueqv_R014YY_partial_01_0244 : Poly :=
[
  term (2 : Rat) [(0, 2), (9, 1), (15, 3)],
  term (2 : Rat) [(1, 2), (9, 1), (15, 3)],
  term (-2 : Rat) [(8, 2), (9, 1), (15, 3)],
  term (-2 : Rat) [(9, 3), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 244 for generator 1. -/
theorem rs_R014_ueqv_R014YY_partial_01_0244_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_01_0244
        rs_R014_ueqv_R014YY_generator_01_0200_0288 =
      rs_R014_ueqv_R014YY_partial_01_0244 := by
  native_decide

/-- Coefficient term 245 from coefficient polynomial 1. -/
def rs_R014_ueqv_R014YY_coefficient_01_0245 : Poly :=
[
  term ((933651 : Rat) / 12320) [(10, 1)]
]

/-- Partial product 245 for generator 1. -/
def rs_R014_ueqv_R014YY_partial_01_0245 : Poly :=
[
  term ((933651 : Rat) / 12320) [(0, 2), (10, 1)],
  term ((933651 : Rat) / 12320) [(1, 2), (10, 1)],
  term ((-933651 : Rat) / 12320) [(8, 2), (10, 1)],
  term ((-933651 : Rat) / 12320) [(9, 2), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 245 for generator 1. -/
theorem rs_R014_ueqv_R014YY_partial_01_0245_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_01_0245
        rs_R014_ueqv_R014YY_generator_01_0200_0288 =
      rs_R014_ueqv_R014YY_partial_01_0245 := by
  native_decide

/-- Coefficient term 246 from coefficient polynomial 1. -/
def rs_R014_ueqv_R014YY_coefficient_01_0246 : Poly :=
[
  term ((321031 : Rat) / 1848) [(10, 1), (13, 1), (15, 1)]
]

/-- Partial product 246 for generator 1. -/
def rs_R014_ueqv_R014YY_partial_01_0246 : Poly :=
[
  term ((321031 : Rat) / 1848) [(0, 2), (10, 1), (13, 1), (15, 1)],
  term ((321031 : Rat) / 1848) [(1, 2), (10, 1), (13, 1), (15, 1)],
  term ((-321031 : Rat) / 1848) [(8, 2), (10, 1), (13, 1), (15, 1)],
  term ((-321031 : Rat) / 1848) [(9, 2), (10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 246 for generator 1. -/
theorem rs_R014_ueqv_R014YY_partial_01_0246_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_01_0246
        rs_R014_ueqv_R014YY_generator_01_0200_0288 =
      rs_R014_ueqv_R014YY_partial_01_0246 := by
  native_decide

/-- Coefficient term 247 from coefficient polynomial 1. -/
def rs_R014_ueqv_R014YY_coefficient_01_0247 : Poly :=
[
  term (4 : Rat) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 247 for generator 1. -/
def rs_R014_ueqv_R014YY_partial_01_0247 : Poly :=
[
  term (4 : Rat) [(0, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(1, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(8, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(9, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 247 for generator 1. -/
theorem rs_R014_ueqv_R014YY_partial_01_0247_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_01_0247
        rs_R014_ueqv_R014YY_generator_01_0200_0288 =
      rs_R014_ueqv_R014YY_partial_01_0247 := by
  native_decide

/-- Coefficient term 248 from coefficient polynomial 1. -/
def rs_R014_ueqv_R014YY_coefficient_01_0248 : Poly :=
[
  term ((-77 : Rat) / 12) [(10, 1), (13, 2)]
]

/-- Partial product 248 for generator 1. -/
def rs_R014_ueqv_R014YY_partial_01_0248 : Poly :=
[
  term ((-77 : Rat) / 12) [(0, 2), (10, 1), (13, 2)],
  term ((-77 : Rat) / 12) [(1, 2), (10, 1), (13, 2)],
  term ((77 : Rat) / 12) [(8, 2), (10, 1), (13, 2)],
  term ((77 : Rat) / 12) [(9, 2), (10, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 248 for generator 1. -/
theorem rs_R014_ueqv_R014YY_partial_01_0248_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_01_0248
        rs_R014_ueqv_R014YY_generator_01_0200_0288 =
      rs_R014_ueqv_R014YY_partial_01_0248 := by
  native_decide

/-- Coefficient term 249 from coefficient polynomial 1. -/
def rs_R014_ueqv_R014YY_coefficient_01_0249 : Poly :=
[
  term ((-3460147 : Rat) / 36960) [(10, 1), (14, 1)]
]

/-- Partial product 249 for generator 1. -/
def rs_R014_ueqv_R014YY_partial_01_0249 : Poly :=
[
  term ((-3460147 : Rat) / 36960) [(0, 2), (10, 1), (14, 1)],
  term ((-3460147 : Rat) / 36960) [(1, 2), (10, 1), (14, 1)],
  term ((3460147 : Rat) / 36960) [(8, 2), (10, 1), (14, 1)],
  term ((3460147 : Rat) / 36960) [(9, 2), (10, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 249 for generator 1. -/
theorem rs_R014_ueqv_R014YY_partial_01_0249_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_01_0249
        rs_R014_ueqv_R014YY_generator_01_0200_0288 =
      rs_R014_ueqv_R014YY_partial_01_0249 := by
  native_decide

/-- Coefficient term 250 from coefficient polynomial 1. -/
def rs_R014_ueqv_R014YY_coefficient_01_0250 : Poly :=
[
  term ((-7 : Rat) / 12) [(10, 1), (14, 1), (15, 2)]
]

/-- Partial product 250 for generator 1. -/
def rs_R014_ueqv_R014YY_partial_01_0250 : Poly :=
[
  term ((-7 : Rat) / 12) [(0, 2), (10, 1), (14, 1), (15, 2)],
  term ((-7 : Rat) / 12) [(1, 2), (10, 1), (14, 1), (15, 2)],
  term ((7 : Rat) / 12) [(8, 2), (10, 1), (14, 1), (15, 2)],
  term ((7 : Rat) / 12) [(9, 2), (10, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 250 for generator 1. -/
theorem rs_R014_ueqv_R014YY_partial_01_0250_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_01_0250
        rs_R014_ueqv_R014YY_generator_01_0200_0288 =
      rs_R014_ueqv_R014YY_partial_01_0250 := by
  native_decide

/-- Coefficient term 251 from coefficient polynomial 1. -/
def rs_R014_ueqv_R014YY_coefficient_01_0251 : Poly :=
[
  term (-4 : Rat) [(10, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 251 for generator 1. -/
def rs_R014_ueqv_R014YY_partial_01_0251 : Poly :=
[
  term (-4 : Rat) [(0, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term (-4 : Rat) [(1, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term (4 : Rat) [(8, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term (4 : Rat) [(9, 2), (10, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 251 for generator 1. -/
theorem rs_R014_ueqv_R014YY_partial_01_0251_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_01_0251
        rs_R014_ueqv_R014YY_generator_01_0200_0288 =
      rs_R014_ueqv_R014YY_partial_01_0251 := by
  native_decide

/-- Coefficient term 252 from coefficient polynomial 1. -/
def rs_R014_ueqv_R014YY_coefficient_01_0252 : Poly :=
[
  term ((-231337 : Rat) / 27720) [(10, 1), (14, 2)]
]

/-- Partial product 252 for generator 1. -/
def rs_R014_ueqv_R014YY_partial_01_0252 : Poly :=
[
  term ((-231337 : Rat) / 27720) [(0, 2), (10, 1), (14, 2)],
  term ((-231337 : Rat) / 27720) [(1, 2), (10, 1), (14, 2)],
  term ((231337 : Rat) / 27720) [(8, 2), (10, 1), (14, 2)],
  term ((231337 : Rat) / 27720) [(9, 2), (10, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 252 for generator 1. -/
theorem rs_R014_ueqv_R014YY_partial_01_0252_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_01_0252
        rs_R014_ueqv_R014YY_generator_01_0200_0288 =
      rs_R014_ueqv_R014YY_partial_01_0252 := by
  native_decide

/-- Coefficient term 253 from coefficient polynomial 1. -/
def rs_R014_ueqv_R014YY_coefficient_01_0253 : Poly :=
[
  term ((-150107 : Rat) / 2640) [(10, 1), (15, 2)]
]

/-- Partial product 253 for generator 1. -/
def rs_R014_ueqv_R014YY_partial_01_0253 : Poly :=
[
  term ((-150107 : Rat) / 2640) [(0, 2), (10, 1), (15, 2)],
  term ((-150107 : Rat) / 2640) [(1, 2), (10, 1), (15, 2)],
  term ((150107 : Rat) / 2640) [(8, 2), (10, 1), (15, 2)],
  term ((150107 : Rat) / 2640) [(9, 2), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 253 for generator 1. -/
theorem rs_R014_ueqv_R014YY_partial_01_0253_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_01_0253
        rs_R014_ueqv_R014YY_generator_01_0200_0288 =
      rs_R014_ueqv_R014YY_partial_01_0253 := by
  native_decide

/-- Coefficient term 254 from coefficient polynomial 1. -/
def rs_R014_ueqv_R014YY_coefficient_01_0254 : Poly :=
[
  term (-7 : Rat) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 254 for generator 1. -/
def rs_R014_ueqv_R014YY_partial_01_0254 : Poly :=
[
  term (-7 : Rat) [(0, 2), (10, 1), (15, 2), (16, 1)],
  term (-7 : Rat) [(1, 2), (10, 1), (15, 2), (16, 1)],
  term (7 : Rat) [(8, 2), (10, 1), (15, 2), (16, 1)],
  term (7 : Rat) [(9, 2), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 254 for generator 1. -/
theorem rs_R014_ueqv_R014YY_partial_01_0254_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_01_0254
        rs_R014_ueqv_R014YY_generator_01_0200_0288 =
      rs_R014_ueqv_R014YY_partial_01_0254 := by
  native_decide

/-- Coefficient term 255 from coefficient polynomial 1. -/
def rs_R014_ueqv_R014YY_coefficient_01_0255 : Poly :=
[
  term ((1003721 : Rat) / 18480) [(11, 1), (13, 1)]
]

/-- Partial product 255 for generator 1. -/
def rs_R014_ueqv_R014YY_partial_01_0255 : Poly :=
[
  term ((1003721 : Rat) / 18480) [(0, 2), (11, 1), (13, 1)],
  term ((1003721 : Rat) / 18480) [(1, 2), (11, 1), (13, 1)],
  term ((-1003721 : Rat) / 18480) [(8, 2), (11, 1), (13, 1)],
  term ((-1003721 : Rat) / 18480) [(9, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 255 for generator 1. -/
theorem rs_R014_ueqv_R014YY_partial_01_0255_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_01_0255
        rs_R014_ueqv_R014YY_generator_01_0200_0288 =
      rs_R014_ueqv_R014YY_partial_01_0255 := by
  native_decide

/-- Coefficient term 256 from coefficient polynomial 1. -/
def rs_R014_ueqv_R014YY_coefficient_01_0256 : Poly :=
[
  term ((-544823 : Rat) / 55440) [(11, 1), (13, 1), (14, 1)]
]

/-- Partial product 256 for generator 1. -/
def rs_R014_ueqv_R014YY_partial_01_0256 : Poly :=
[
  term ((-544823 : Rat) / 55440) [(0, 2), (11, 1), (13, 1), (14, 1)],
  term ((-544823 : Rat) / 55440) [(1, 2), (11, 1), (13, 1), (14, 1)],
  term ((544823 : Rat) / 55440) [(8, 2), (11, 1), (13, 1), (14, 1)],
  term ((544823 : Rat) / 55440) [(9, 2), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 256 for generator 1. -/
theorem rs_R014_ueqv_R014YY_partial_01_0256_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_01_0256
        rs_R014_ueqv_R014YY_generator_01_0200_0288 =
      rs_R014_ueqv_R014YY_partial_01_0256 := by
  native_decide

/-- Coefficient term 257 from coefficient polynomial 1. -/
def rs_R014_ueqv_R014YY_coefficient_01_0257 : Poly :=
[
  term ((1 : Rat) / 12) [(11, 1), (13, 1), (15, 2)]
]

/-- Partial product 257 for generator 1. -/
def rs_R014_ueqv_R014YY_partial_01_0257 : Poly :=
[
  term ((1 : Rat) / 12) [(0, 2), (11, 1), (13, 1), (15, 2)],
  term ((1 : Rat) / 12) [(1, 2), (11, 1), (13, 1), (15, 2)],
  term ((-1 : Rat) / 12) [(8, 2), (11, 1), (13, 1), (15, 2)],
  term ((-1 : Rat) / 12) [(9, 2), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 257 for generator 1. -/
theorem rs_R014_ueqv_R014YY_partial_01_0257_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_01_0257
        rs_R014_ueqv_R014YY_generator_01_0200_0288 =
      rs_R014_ueqv_R014YY_partial_01_0257 := by
  native_decide

/-- Coefficient term 258 from coefficient polynomial 1. -/
def rs_R014_ueqv_R014YY_coefficient_01_0258 : Poly :=
[
  term ((11 : Rat) / 10) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 258 for generator 1. -/
def rs_R014_ueqv_R014YY_partial_01_0258 : Poly :=
[
  term ((11 : Rat) / 10) [(0, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((11 : Rat) / 10) [(1, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-11 : Rat) / 10) [(8, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-11 : Rat) / 10) [(9, 2), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 258 for generator 1. -/
theorem rs_R014_ueqv_R014YY_partial_01_0258_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_01_0258
        rs_R014_ueqv_R014YY_generator_01_0200_0288 =
      rs_R014_ueqv_R014YY_partial_01_0258 := by
  native_decide

/-- Coefficient term 259 from coefficient polynomial 1. -/
def rs_R014_ueqv_R014YY_coefficient_01_0259 : Poly :=
[
  term ((2696503 : Rat) / 55440) [(11, 1), (14, 1), (15, 1)]
]

/-- Partial product 259 for generator 1. -/
def rs_R014_ueqv_R014YY_partial_01_0259 : Poly :=
[
  term ((2696503 : Rat) / 55440) [(0, 2), (11, 1), (14, 1), (15, 1)],
  term ((2696503 : Rat) / 55440) [(1, 2), (11, 1), (14, 1), (15, 1)],
  term ((-2696503 : Rat) / 55440) [(8, 2), (11, 1), (14, 1), (15, 1)],
  term ((-2696503 : Rat) / 55440) [(9, 2), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 259 for generator 1. -/
theorem rs_R014_ueqv_R014YY_partial_01_0259_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_01_0259
        rs_R014_ueqv_R014YY_generator_01_0200_0288 =
      rs_R014_ueqv_R014YY_partial_01_0259 := by
  native_decide

/-- Coefficient term 260 from coefficient polynomial 1. -/
def rs_R014_ueqv_R014YY_coefficient_01_0260 : Poly :=
[
  term ((153 : Rat) / 20) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 260 for generator 1. -/
def rs_R014_ueqv_R014YY_partial_01_0260 : Poly :=
[
  term ((153 : Rat) / 20) [(0, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((153 : Rat) / 20) [(1, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-153 : Rat) / 20) [(8, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-153 : Rat) / 20) [(9, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 260 for generator 1. -/
theorem rs_R014_ueqv_R014YY_partial_01_0260_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_01_0260
        rs_R014_ueqv_R014YY_generator_01_0200_0288 =
      rs_R014_ueqv_R014YY_partial_01_0260 := by
  native_decide

/-- Coefficient term 261 from coefficient polynomial 1. -/
def rs_R014_ueqv_R014YY_coefficient_01_0261 : Poly :=
[
  term ((5 : Rat) / 12) [(11, 1), (14, 2), (15, 1)]
]

/-- Partial product 261 for generator 1. -/
def rs_R014_ueqv_R014YY_partial_01_0261 : Poly :=
[
  term ((5 : Rat) / 12) [(0, 2), (11, 1), (14, 2), (15, 1)],
  term ((5 : Rat) / 12) [(1, 2), (11, 1), (14, 2), (15, 1)],
  term ((-5 : Rat) / 12) [(8, 2), (11, 1), (14, 2), (15, 1)],
  term ((-5 : Rat) / 12) [(9, 2), (11, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 261 for generator 1. -/
theorem rs_R014_ueqv_R014YY_partial_01_0261_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_01_0261
        rs_R014_ueqv_R014YY_generator_01_0200_0288 =
      rs_R014_ueqv_R014YY_partial_01_0261 := by
  native_decide

/-- Coefficient term 262 from coefficient polynomial 1. -/
def rs_R014_ueqv_R014YY_coefficient_01_0262 : Poly :=
[
  term ((14 : Rat) / 5) [(11, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 262 for generator 1. -/
def rs_R014_ueqv_R014YY_partial_01_0262 : Poly :=
[
  term ((14 : Rat) / 5) [(0, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((14 : Rat) / 5) [(1, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-14 : Rat) / 5) [(8, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-14 : Rat) / 5) [(9, 2), (11, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 262 for generator 1. -/
theorem rs_R014_ueqv_R014YY_partial_01_0262_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_01_0262
        rs_R014_ueqv_R014YY_generator_01_0200_0288 =
      rs_R014_ueqv_R014YY_partial_01_0262 := by
  native_decide

/-- Coefficient term 263 from coefficient polynomial 1. -/
def rs_R014_ueqv_R014YY_coefficient_01_0263 : Poly :=
[
  term ((-458631 : Rat) / 6160) [(11, 1), (15, 1)]
]

/-- Partial product 263 for generator 1. -/
def rs_R014_ueqv_R014YY_partial_01_0263 : Poly :=
[
  term ((-458631 : Rat) / 6160) [(0, 2), (11, 1), (15, 1)],
  term ((-458631 : Rat) / 6160) [(1, 2), (11, 1), (15, 1)],
  term ((458631 : Rat) / 6160) [(8, 2), (11, 1), (15, 1)],
  term ((458631 : Rat) / 6160) [(9, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 263 for generator 1. -/
theorem rs_R014_ueqv_R014YY_partial_01_0263_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_01_0263
        rs_R014_ueqv_R014YY_generator_01_0200_0288 =
      rs_R014_ueqv_R014YY_partial_01_0263 := by
  native_decide

/-- Coefficient term 264 from coefficient polynomial 1. -/
def rs_R014_ueqv_R014YY_coefficient_01_0264 : Poly :=
[
  term ((-9 : Rat) / 2) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 264 for generator 1. -/
def rs_R014_ueqv_R014YY_partial_01_0264 : Poly :=
[
  term ((-9 : Rat) / 2) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((-9 : Rat) / 2) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((9 : Rat) / 2) [(8, 2), (11, 1), (15, 1), (16, 1)],
  term ((9 : Rat) / 2) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 264 for generator 1. -/
theorem rs_R014_ueqv_R014YY_partial_01_0264_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_01_0264
        rs_R014_ueqv_R014YY_generator_01_0200_0288 =
      rs_R014_ueqv_R014YY_partial_01_0264 := by
  native_decide

/-- Coefficient term 265 from coefficient polynomial 1. -/
def rs_R014_ueqv_R014YY_coefficient_01_0265 : Poly :=
[
  term ((-1 : Rat) / 6) [(11, 1), (15, 3)]
]

/-- Partial product 265 for generator 1. -/
def rs_R014_ueqv_R014YY_partial_01_0265 : Poly :=
[
  term ((-1 : Rat) / 6) [(0, 2), (11, 1), (15, 3)],
  term ((-1 : Rat) / 6) [(1, 2), (11, 1), (15, 3)],
  term ((1 : Rat) / 6) [(8, 2), (11, 1), (15, 3)],
  term ((1 : Rat) / 6) [(9, 2), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 265 for generator 1. -/
theorem rs_R014_ueqv_R014YY_partial_01_0265_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_01_0265
        rs_R014_ueqv_R014YY_generator_01_0200_0288 =
      rs_R014_ueqv_R014YY_partial_01_0265 := by
  native_decide

/-- Coefficient term 266 from coefficient polynomial 1. -/
def rs_R014_ueqv_R014YY_coefficient_01_0266 : Poly :=
[
  term ((-6 : Rat) / 5) [(11, 1), (15, 3), (16, 1)]
]

/-- Partial product 266 for generator 1. -/
def rs_R014_ueqv_R014YY_partial_01_0266 : Poly :=
[
  term ((-6 : Rat) / 5) [(0, 2), (11, 1), (15, 3), (16, 1)],
  term ((-6 : Rat) / 5) [(1, 2), (11, 1), (15, 3), (16, 1)],
  term ((6 : Rat) / 5) [(8, 2), (11, 1), (15, 3), (16, 1)],
  term ((6 : Rat) / 5) [(9, 2), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 266 for generator 1. -/
theorem rs_R014_ueqv_R014YY_partial_01_0266_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_01_0266
        rs_R014_ueqv_R014YY_generator_01_0200_0288 =
      rs_R014_ueqv_R014YY_partial_01_0266 := by
  native_decide

/-- Coefficient term 267 from coefficient polynomial 1. -/
def rs_R014_ueqv_R014YY_coefficient_01_0267 : Poly :=
[
  term ((-158035 : Rat) / 924) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 267 for generator 1. -/
def rs_R014_ueqv_R014YY_partial_01_0267 : Poly :=
[
  term ((-158035 : Rat) / 924) [(0, 2), (13, 1), (14, 1), (15, 1)],
  term ((-158035 : Rat) / 924) [(1, 2), (13, 1), (14, 1), (15, 1)],
  term ((158035 : Rat) / 924) [(8, 2), (13, 1), (14, 1), (15, 1)],
  term ((158035 : Rat) / 924) [(9, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 267 for generator 1. -/
theorem rs_R014_ueqv_R014YY_partial_01_0267_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_01_0267
        rs_R014_ueqv_R014YY_generator_01_0200_0288 =
      rs_R014_ueqv_R014YY_partial_01_0267 := by
  native_decide

/-- Coefficient term 268 from coefficient polynomial 1. -/
def rs_R014_ueqv_R014YY_coefficient_01_0268 : Poly :=
[
  term ((113 : Rat) / 20) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 268 for generator 1. -/
def rs_R014_ueqv_R014YY_partial_01_0268 : Poly :=
[
  term ((113 : Rat) / 20) [(0, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((113 : Rat) / 20) [(1, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-113 : Rat) / 20) [(8, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-113 : Rat) / 20) [(9, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 268 for generator 1. -/
theorem rs_R014_ueqv_R014YY_partial_01_0268_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_01_0268
        rs_R014_ueqv_R014YY_generator_01_0200_0288 =
      rs_R014_ueqv_R014YY_partial_01_0268 := by
  native_decide

/-- Coefficient term 269 from coefficient polynomial 1. -/
def rs_R014_ueqv_R014YY_coefficient_01_0269 : Poly :=
[
  term ((-1 : Rat) / 3) [(13, 1), (14, 2), (15, 1)]
]

/-- Partial product 269 for generator 1. -/
def rs_R014_ueqv_R014YY_partial_01_0269 : Poly :=
[
  term ((-1 : Rat) / 3) [(0, 2), (13, 1), (14, 2), (15, 1)],
  term ((-1 : Rat) / 3) [(1, 2), (13, 1), (14, 2), (15, 1)],
  term ((1 : Rat) / 3) [(8, 2), (13, 1), (14, 2), (15, 1)],
  term ((1 : Rat) / 3) [(9, 2), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 269 for generator 1. -/
theorem rs_R014_ueqv_R014YY_partial_01_0269_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_01_0269
        rs_R014_ueqv_R014YY_generator_01_0200_0288 =
      rs_R014_ueqv_R014YY_partial_01_0269 := by
  native_decide

/-- Coefficient term 270 from coefficient polynomial 1. -/
def rs_R014_ueqv_R014YY_coefficient_01_0270 : Poly :=
[
  term ((-7 : Rat) / 5) [(13, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 270 for generator 1. -/
def rs_R014_ueqv_R014YY_partial_01_0270 : Poly :=
[
  term ((-7 : Rat) / 5) [(0, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-7 : Rat) / 5) [(1, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((7 : Rat) / 5) [(8, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((7 : Rat) / 5) [(9, 2), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 270 for generator 1. -/
theorem rs_R014_ueqv_R014YY_partial_01_0270_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_01_0270
        rs_R014_ueqv_R014YY_generator_01_0200_0288 =
      rs_R014_ueqv_R014YY_partial_01_0270 := by
  native_decide

/-- Coefficient term 271 from coefficient polynomial 1. -/
def rs_R014_ueqv_R014YY_coefficient_01_0271 : Poly :=
[
  term ((-101428 : Rat) / 495) [(13, 1), (15, 1)]
]

/-- Partial product 271 for generator 1. -/
def rs_R014_ueqv_R014YY_partial_01_0271 : Poly :=
[
  term ((-101428 : Rat) / 495) [(0, 2), (13, 1), (15, 1)],
  term ((-101428 : Rat) / 495) [(1, 2), (13, 1), (15, 1)],
  term ((101428 : Rat) / 495) [(8, 2), (13, 1), (15, 1)],
  term ((101428 : Rat) / 495) [(9, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 271 for generator 1. -/
theorem rs_R014_ueqv_R014YY_partial_01_0271_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_01_0271
        rs_R014_ueqv_R014YY_generator_01_0200_0288 =
      rs_R014_ueqv_R014YY_partial_01_0271 := by
  native_decide

/-- Coefficient term 272 from coefficient polynomial 1. -/
def rs_R014_ueqv_R014YY_coefficient_01_0272 : Poly :=
[
  term ((54 : Rat) / 5) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 272 for generator 1. -/
def rs_R014_ueqv_R014YY_partial_01_0272 : Poly :=
[
  term ((54 : Rat) / 5) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((54 : Rat) / 5) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-54 : Rat) / 5) [(8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-54 : Rat) / 5) [(9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 272 for generator 1. -/
theorem rs_R014_ueqv_R014YY_partial_01_0272_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_01_0272
        rs_R014_ueqv_R014YY_generator_01_0200_0288 =
      rs_R014_ueqv_R014YY_partial_01_0272 := by
  native_decide

/-- Coefficient term 273 from coefficient polynomial 1. -/
def rs_R014_ueqv_R014YY_coefficient_01_0273 : Poly :=
[
  term ((7 : Rat) / 4) [(13, 1), (15, 3)]
]

/-- Partial product 273 for generator 1. -/
def rs_R014_ueqv_R014YY_partial_01_0273 : Poly :=
[
  term ((7 : Rat) / 4) [(0, 2), (13, 1), (15, 3)],
  term ((7 : Rat) / 4) [(1, 2), (13, 1), (15, 3)],
  term ((-7 : Rat) / 4) [(8, 2), (13, 1), (15, 3)],
  term ((-7 : Rat) / 4) [(9, 2), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 273 for generator 1. -/
theorem rs_R014_ueqv_R014YY_partial_01_0273_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_01_0273
        rs_R014_ueqv_R014YY_generator_01_0200_0288 =
      rs_R014_ueqv_R014YY_partial_01_0273 := by
  native_decide

/-- Coefficient term 274 from coefficient polynomial 1. -/
def rs_R014_ueqv_R014YY_coefficient_01_0274 : Poly :=
[
  term ((19 : Rat) / 2) [(13, 1), (15, 3), (16, 1)]
]

/-- Partial product 274 for generator 1. -/
def rs_R014_ueqv_R014YY_partial_01_0274 : Poly :=
[
  term ((19 : Rat) / 2) [(0, 2), (13, 1), (15, 3), (16, 1)],
  term ((19 : Rat) / 2) [(1, 2), (13, 1), (15, 3), (16, 1)],
  term ((-19 : Rat) / 2) [(8, 2), (13, 1), (15, 3), (16, 1)],
  term ((-19 : Rat) / 2) [(9, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 274 for generator 1. -/
theorem rs_R014_ueqv_R014YY_partial_01_0274_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_01_0274
        rs_R014_ueqv_R014YY_generator_01_0200_0288 =
      rs_R014_ueqv_R014YY_partial_01_0274 := by
  native_decide

/-- Coefficient term 275 from coefficient polynomial 1. -/
def rs_R014_ueqv_R014YY_coefficient_01_0275 : Poly :=
[
  term ((7 : Rat) / 12) [(13, 2)]
]

/-- Partial product 275 for generator 1. -/
def rs_R014_ueqv_R014YY_partial_01_0275 : Poly :=
[
  term ((7 : Rat) / 12) [(0, 2), (13, 2)],
  term ((7 : Rat) / 12) [(1, 2), (13, 2)],
  term ((-7 : Rat) / 12) [(8, 2), (13, 2)],
  term ((-7 : Rat) / 12) [(9, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 275 for generator 1. -/
theorem rs_R014_ueqv_R014YY_partial_01_0275_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_01_0275
        rs_R014_ueqv_R014YY_generator_01_0200_0288 =
      rs_R014_ueqv_R014YY_partial_01_0275 := by
  native_decide

/-- Coefficient term 276 from coefficient polynomial 1. -/
def rs_R014_ueqv_R014YY_coefficient_01_0276 : Poly :=
[
  term ((7 : Rat) / 4) [(13, 2), (14, 1)]
]

/-- Partial product 276 for generator 1. -/
def rs_R014_ueqv_R014YY_partial_01_0276 : Poly :=
[
  term ((7 : Rat) / 4) [(0, 2), (13, 2), (14, 1)],
  term ((7 : Rat) / 4) [(1, 2), (13, 2), (14, 1)],
  term ((-7 : Rat) / 4) [(8, 2), (13, 2), (14, 1)],
  term ((-7 : Rat) / 4) [(9, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 276 for generator 1. -/
theorem rs_R014_ueqv_R014YY_partial_01_0276_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_01_0276
        rs_R014_ueqv_R014YY_generator_01_0200_0288 =
      rs_R014_ueqv_R014YY_partial_01_0276 := by
  native_decide

/-- Coefficient term 277 from coefficient polynomial 1. -/
def rs_R014_ueqv_R014YY_coefficient_01_0277 : Poly :=
[
  term ((9 : Rat) / 2) [(13, 2), (15, 2), (16, 1)]
]

/-- Partial product 277 for generator 1. -/
def rs_R014_ueqv_R014YY_partial_01_0277 : Poly :=
[
  term ((9 : Rat) / 2) [(0, 2), (13, 2), (15, 2), (16, 1)],
  term ((9 : Rat) / 2) [(1, 2), (13, 2), (15, 2), (16, 1)],
  term ((-9 : Rat) / 2) [(8, 2), (13, 2), (15, 2), (16, 1)],
  term ((-9 : Rat) / 2) [(9, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 277 for generator 1. -/
theorem rs_R014_ueqv_R014YY_partial_01_0277_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_01_0277
        rs_R014_ueqv_R014YY_generator_01_0200_0288 =
      rs_R014_ueqv_R014YY_partial_01_0277 := by
  native_decide

/-- Coefficient term 278 from coefficient polynomial 1. -/
def rs_R014_ueqv_R014YY_coefficient_01_0278 : Poly :=
[
  term ((-56009 : Rat) / 1980) [(14, 1)]
]

/-- Partial product 278 for generator 1. -/
def rs_R014_ueqv_R014YY_partial_01_0278 : Poly :=
[
  term ((-56009 : Rat) / 1980) [(0, 2), (14, 1)],
  term ((-56009 : Rat) / 1980) [(1, 2), (14, 1)],
  term ((56009 : Rat) / 1980) [(8, 2), (14, 1)],
  term ((56009 : Rat) / 1980) [(9, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 278 for generator 1. -/
theorem rs_R014_ueqv_R014YY_partial_01_0278_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_01_0278
        rs_R014_ueqv_R014YY_generator_01_0200_0288 =
      rs_R014_ueqv_R014YY_partial_01_0278 := by
  native_decide

/-- Coefficient term 279 from coefficient polynomial 1. -/
def rs_R014_ueqv_R014YY_coefficient_01_0279 : Poly :=
[
  term ((-439189 : Rat) / 9240) [(14, 1), (15, 2)]
]

/-- Partial product 279 for generator 1. -/
def rs_R014_ueqv_R014YY_partial_01_0279 : Poly :=
[
  term ((-439189 : Rat) / 9240) [(0, 2), (14, 1), (15, 2)],
  term ((-439189 : Rat) / 9240) [(1, 2), (14, 1), (15, 2)],
  term ((439189 : Rat) / 9240) [(8, 2), (14, 1), (15, 2)],
  term ((439189 : Rat) / 9240) [(9, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 279 for generator 1. -/
theorem rs_R014_ueqv_R014YY_partial_01_0279_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_01_0279
        rs_R014_ueqv_R014YY_generator_01_0200_0288 =
      rs_R014_ueqv_R014YY_partial_01_0279 := by
  native_decide

/-- Coefficient term 280 from coefficient polynomial 1. -/
def rs_R014_ueqv_R014YY_coefficient_01_0280 : Poly :=
[
  term ((31 : Rat) / 20) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 280 for generator 1. -/
def rs_R014_ueqv_R014YY_partial_01_0280 : Poly :=
[
  term ((31 : Rat) / 20) [(0, 2), (14, 1), (15, 2), (16, 1)],
  term ((31 : Rat) / 20) [(1, 2), (14, 1), (15, 2), (16, 1)],
  term ((-31 : Rat) / 20) [(8, 2), (14, 1), (15, 2), (16, 1)],
  term ((-31 : Rat) / 20) [(9, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 280 for generator 1. -/
theorem rs_R014_ueqv_R014YY_partial_01_0280_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_01_0280
        rs_R014_ueqv_R014YY_generator_01_0200_0288 =
      rs_R014_ueqv_R014YY_partial_01_0280 := by
  native_decide

/-- Coefficient term 281 from coefficient polynomial 1. -/
def rs_R014_ueqv_R014YY_coefficient_01_0281 : Poly :=
[
  term ((-20733499 : Rat) / 110880) [(14, 2)]
]

/-- Partial product 281 for generator 1. -/
def rs_R014_ueqv_R014YY_partial_01_0281 : Poly :=
[
  term ((-20733499 : Rat) / 110880) [(0, 2), (14, 2)],
  term ((-20733499 : Rat) / 110880) [(1, 2), (14, 2)],
  term ((20733499 : Rat) / 110880) [(8, 2), (14, 2)],
  term ((20733499 : Rat) / 110880) [(9, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 281 for generator 1. -/
theorem rs_R014_ueqv_R014YY_partial_01_0281_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_01_0281
        rs_R014_ueqv_R014YY_generator_01_0200_0288 =
      rs_R014_ueqv_R014YY_partial_01_0281 := by
  native_decide

/-- Coefficient term 282 from coefficient polynomial 1. -/
def rs_R014_ueqv_R014YY_coefficient_01_0282 : Poly :=
[
  term (-2 : Rat) [(14, 2), (15, 2)]
]

/-- Partial product 282 for generator 1. -/
def rs_R014_ueqv_R014YY_partial_01_0282 : Poly :=
[
  term (-2 : Rat) [(0, 2), (14, 2), (15, 2)],
  term (-2 : Rat) [(1, 2), (14, 2), (15, 2)],
  term (2 : Rat) [(8, 2), (14, 2), (15, 2)],
  term (2 : Rat) [(9, 2), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 282 for generator 1. -/
theorem rs_R014_ueqv_R014YY_partial_01_0282_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_01_0282
        rs_R014_ueqv_R014YY_generator_01_0200_0288 =
      rs_R014_ueqv_R014YY_partial_01_0282 := by
  native_decide

/-- Coefficient term 283 from coefficient polynomial 1. -/
def rs_R014_ueqv_R014YY_coefficient_01_0283 : Poly :=
[
  term (-6 : Rat) [(14, 2), (15, 2), (16, 1)]
]

/-- Partial product 283 for generator 1. -/
def rs_R014_ueqv_R014YY_partial_01_0283 : Poly :=
[
  term (-6 : Rat) [(0, 2), (14, 2), (15, 2), (16, 1)],
  term (-6 : Rat) [(1, 2), (14, 2), (15, 2), (16, 1)],
  term (6 : Rat) [(8, 2), (14, 2), (15, 2), (16, 1)],
  term (6 : Rat) [(9, 2), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 283 for generator 1. -/
theorem rs_R014_ueqv_R014YY_partial_01_0283_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_01_0283
        rs_R014_ueqv_R014YY_generator_01_0200_0288 =
      rs_R014_ueqv_R014YY_partial_01_0283 := by
  native_decide

/-- Coefficient term 284 from coefficient polynomial 1. -/
def rs_R014_ueqv_R014YY_coefficient_01_0284 : Poly :=
[
  term ((-231337 : Rat) / 4620) [(14, 3)]
]

/-- Partial product 284 for generator 1. -/
def rs_R014_ueqv_R014YY_partial_01_0284 : Poly :=
[
  term ((-231337 : Rat) / 4620) [(0, 2), (14, 3)],
  term ((-231337 : Rat) / 4620) [(1, 2), (14, 3)],
  term ((231337 : Rat) / 4620) [(8, 2), (14, 3)],
  term ((231337 : Rat) / 4620) [(9, 2), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 284 for generator 1. -/
theorem rs_R014_ueqv_R014YY_partial_01_0284_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_01_0284
        rs_R014_ueqv_R014YY_generator_01_0200_0288 =
      rs_R014_ueqv_R014YY_partial_01_0284 := by
  native_decide

/-- Coefficient term 285 from coefficient polynomial 1. -/
def rs_R014_ueqv_R014YY_coefficient_01_0285 : Poly :=
[
  term ((397241 : Rat) / 3168) [(15, 2)]
]

/-- Partial product 285 for generator 1. -/
def rs_R014_ueqv_R014YY_partial_01_0285 : Poly :=
[
  term ((397241 : Rat) / 3168) [(0, 2), (15, 2)],
  term ((397241 : Rat) / 3168) [(1, 2), (15, 2)],
  term ((-397241 : Rat) / 3168) [(8, 2), (15, 2)],
  term ((-397241 : Rat) / 3168) [(9, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 285 for generator 1. -/
theorem rs_R014_ueqv_R014YY_partial_01_0285_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_01_0285
        rs_R014_ueqv_R014YY_generator_01_0200_0288 =
      rs_R014_ueqv_R014YY_partial_01_0285 := by
  native_decide

/-- Coefficient term 286 from coefficient polynomial 1. -/
def rs_R014_ueqv_R014YY_coefficient_01_0286 : Poly :=
[
  term ((149 : Rat) / 10) [(15, 2), (16, 1)]
]

/-- Partial product 286 for generator 1. -/
def rs_R014_ueqv_R014YY_partial_01_0286 : Poly :=
[
  term ((149 : Rat) / 10) [(0, 2), (15, 2), (16, 1)],
  term ((149 : Rat) / 10) [(1, 2), (15, 2), (16, 1)],
  term ((-149 : Rat) / 10) [(8, 2), (15, 2), (16, 1)],
  term ((-149 : Rat) / 10) [(9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 286 for generator 1. -/
theorem rs_R014_ueqv_R014YY_partial_01_0286_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_01_0286
        rs_R014_ueqv_R014YY_generator_01_0200_0288 =
      rs_R014_ueqv_R014YY_partial_01_0286 := by
  native_decide

/-- Coefficient term 287 from coefficient polynomial 1. -/
def rs_R014_ueqv_R014YY_coefficient_01_0287 : Poly :=
[
  term (-2 : Rat) [(15, 4)]
]

/-- Partial product 287 for generator 1. -/
def rs_R014_ueqv_R014YY_partial_01_0287 : Poly :=
[
  term (-2 : Rat) [(0, 2), (15, 4)],
  term (-2 : Rat) [(1, 2), (15, 4)],
  term (2 : Rat) [(8, 2), (15, 4)],
  term (2 : Rat) [(9, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 287 for generator 1. -/
theorem rs_R014_ueqv_R014YY_partial_01_0287_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_01_0287
        rs_R014_ueqv_R014YY_generator_01_0200_0288 =
      rs_R014_ueqv_R014YY_partial_01_0287 := by
  native_decide

/-- Coefficient term 288 from coefficient polynomial 1. -/
def rs_R014_ueqv_R014YY_coefficient_01_0288 : Poly :=
[
  term (-6 : Rat) [(15, 4), (16, 1)]
]

/-- Partial product 288 for generator 1. -/
def rs_R014_ueqv_R014YY_partial_01_0288 : Poly :=
[
  term (-6 : Rat) [(0, 2), (15, 4), (16, 1)],
  term (-6 : Rat) [(1, 2), (15, 4), (16, 1)],
  term (6 : Rat) [(8, 2), (15, 4), (16, 1)],
  term (6 : Rat) [(9, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 288 for generator 1. -/
theorem rs_R014_ueqv_R014YY_partial_01_0288_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_01_0288
        rs_R014_ueqv_R014YY_generator_01_0200_0288 =
      rs_R014_ueqv_R014YY_partial_01_0288 := by
  native_decide

/-- Partial products in this block. -/
def rs_R014_ueqv_R014YY_partials_01_0200_0288 : List Poly :=
[
  rs_R014_ueqv_R014YY_partial_01_0200,
  rs_R014_ueqv_R014YY_partial_01_0201,
  rs_R014_ueqv_R014YY_partial_01_0202,
  rs_R014_ueqv_R014YY_partial_01_0203,
  rs_R014_ueqv_R014YY_partial_01_0204,
  rs_R014_ueqv_R014YY_partial_01_0205,
  rs_R014_ueqv_R014YY_partial_01_0206,
  rs_R014_ueqv_R014YY_partial_01_0207,
  rs_R014_ueqv_R014YY_partial_01_0208,
  rs_R014_ueqv_R014YY_partial_01_0209,
  rs_R014_ueqv_R014YY_partial_01_0210,
  rs_R014_ueqv_R014YY_partial_01_0211,
  rs_R014_ueqv_R014YY_partial_01_0212,
  rs_R014_ueqv_R014YY_partial_01_0213,
  rs_R014_ueqv_R014YY_partial_01_0214,
  rs_R014_ueqv_R014YY_partial_01_0215,
  rs_R014_ueqv_R014YY_partial_01_0216,
  rs_R014_ueqv_R014YY_partial_01_0217,
  rs_R014_ueqv_R014YY_partial_01_0218,
  rs_R014_ueqv_R014YY_partial_01_0219,
  rs_R014_ueqv_R014YY_partial_01_0220,
  rs_R014_ueqv_R014YY_partial_01_0221,
  rs_R014_ueqv_R014YY_partial_01_0222,
  rs_R014_ueqv_R014YY_partial_01_0223,
  rs_R014_ueqv_R014YY_partial_01_0224,
  rs_R014_ueqv_R014YY_partial_01_0225,
  rs_R014_ueqv_R014YY_partial_01_0226,
  rs_R014_ueqv_R014YY_partial_01_0227,
  rs_R014_ueqv_R014YY_partial_01_0228,
  rs_R014_ueqv_R014YY_partial_01_0229,
  rs_R014_ueqv_R014YY_partial_01_0230,
  rs_R014_ueqv_R014YY_partial_01_0231,
  rs_R014_ueqv_R014YY_partial_01_0232,
  rs_R014_ueqv_R014YY_partial_01_0233,
  rs_R014_ueqv_R014YY_partial_01_0234,
  rs_R014_ueqv_R014YY_partial_01_0235,
  rs_R014_ueqv_R014YY_partial_01_0236,
  rs_R014_ueqv_R014YY_partial_01_0237,
  rs_R014_ueqv_R014YY_partial_01_0238,
  rs_R014_ueqv_R014YY_partial_01_0239,
  rs_R014_ueqv_R014YY_partial_01_0240,
  rs_R014_ueqv_R014YY_partial_01_0241,
  rs_R014_ueqv_R014YY_partial_01_0242,
  rs_R014_ueqv_R014YY_partial_01_0243,
  rs_R014_ueqv_R014YY_partial_01_0244,
  rs_R014_ueqv_R014YY_partial_01_0245,
  rs_R014_ueqv_R014YY_partial_01_0246,
  rs_R014_ueqv_R014YY_partial_01_0247,
  rs_R014_ueqv_R014YY_partial_01_0248,
  rs_R014_ueqv_R014YY_partial_01_0249,
  rs_R014_ueqv_R014YY_partial_01_0250,
  rs_R014_ueqv_R014YY_partial_01_0251,
  rs_R014_ueqv_R014YY_partial_01_0252,
  rs_R014_ueqv_R014YY_partial_01_0253,
  rs_R014_ueqv_R014YY_partial_01_0254,
  rs_R014_ueqv_R014YY_partial_01_0255,
  rs_R014_ueqv_R014YY_partial_01_0256,
  rs_R014_ueqv_R014YY_partial_01_0257,
  rs_R014_ueqv_R014YY_partial_01_0258,
  rs_R014_ueqv_R014YY_partial_01_0259,
  rs_R014_ueqv_R014YY_partial_01_0260,
  rs_R014_ueqv_R014YY_partial_01_0261,
  rs_R014_ueqv_R014YY_partial_01_0262,
  rs_R014_ueqv_R014YY_partial_01_0263,
  rs_R014_ueqv_R014YY_partial_01_0264,
  rs_R014_ueqv_R014YY_partial_01_0265,
  rs_R014_ueqv_R014YY_partial_01_0266,
  rs_R014_ueqv_R014YY_partial_01_0267,
  rs_R014_ueqv_R014YY_partial_01_0268,
  rs_R014_ueqv_R014YY_partial_01_0269,
  rs_R014_ueqv_R014YY_partial_01_0270,
  rs_R014_ueqv_R014YY_partial_01_0271,
  rs_R014_ueqv_R014YY_partial_01_0272,
  rs_R014_ueqv_R014YY_partial_01_0273,
  rs_R014_ueqv_R014YY_partial_01_0274,
  rs_R014_ueqv_R014YY_partial_01_0275,
  rs_R014_ueqv_R014YY_partial_01_0276,
  rs_R014_ueqv_R014YY_partial_01_0277,
  rs_R014_ueqv_R014YY_partial_01_0278,
  rs_R014_ueqv_R014YY_partial_01_0279,
  rs_R014_ueqv_R014YY_partial_01_0280,
  rs_R014_ueqv_R014YY_partial_01_0281,
  rs_R014_ueqv_R014YY_partial_01_0282,
  rs_R014_ueqv_R014YY_partial_01_0283,
  rs_R014_ueqv_R014YY_partial_01_0284,
  rs_R014_ueqv_R014YY_partial_01_0285,
  rs_R014_ueqv_R014YY_partial_01_0286,
  rs_R014_ueqv_R014YY_partial_01_0287,
  rs_R014_ueqv_R014YY_partial_01_0288
]

/-- Sum of partial products in this block. -/
def rs_R014_ueqv_R014YY_block_01_0200_0288 : Poly :=
[
  term ((-77 : Rat) / 120) [(0, 2), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((89 : Rat) / 240) [(0, 2), (7, 1), (11, 1), (14, 1)],
  term ((1 : Rat) / 2) [(0, 2), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-49 : Rat) / 30) [(0, 2), (7, 1), (11, 1), (14, 2)],
  term ((7 : Rat) / 10) [(0, 2), (7, 1), (11, 1), (15, 2)],
  term ((-19 : Rat) / 8) [(0, 2), (7, 1), (11, 1), (16, 1)],
  term ((-941 : Rat) / 120) [(0, 2), (7, 1), (13, 1)],
  term ((-667 : Rat) / 80) [(0, 2), (7, 1), (13, 1), (14, 1)],
  term (3 : Rat) [(0, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((49 : Rat) / 60) [(0, 2), (7, 1), (13, 1), (14, 2)],
  term ((-133 : Rat) / 24) [(0, 2), (7, 1), (13, 1), (15, 2)],
  term ((7 : Rat) / 4) [(0, 2), (7, 1), (13, 1), (16, 1)],
  term ((-21 : Rat) / 8) [(0, 2), (7, 1), (13, 2), (15, 1)],
  term ((-217 : Rat) / 240) [(0, 2), (7, 1), (14, 1), (15, 1)],
  term ((7 : Rat) / 2) [(0, 2), (7, 1), (14, 2), (15, 1)],
  term ((-2311 : Rat) / 240) [(0, 2), (7, 1), (15, 1)],
  term (6 : Rat) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((7 : Rat) / 2) [(0, 2), (7, 1), (15, 3)],
  term ((904391 : Rat) / 9240) [(0, 2), (8, 1)],
  term ((-31 : Rat) / 24) [(0, 2), (8, 1), (10, 1)],
  term ((1 : Rat) / 6) [(0, 2), (8, 1), (10, 1), (14, 1)],
  term ((-1 : Rat) / 3) [(0, 2), (8, 1), (10, 1), (15, 2)],
  term ((-1 : Rat) / 12) [(0, 2), (8, 1), (11, 1), (13, 1)],
  term ((1 : Rat) / 3) [(0, 2), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((13 : Rat) / 3) [(0, 2), (8, 1), (11, 1), (15, 1)],
  term ((5 : Rat) / 6) [(0, 2), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((1329829 : Rat) / 2310) [(0, 2), (8, 1), (13, 1), (15, 1)],
  term ((4 : Rat) / 3) [(0, 2), (8, 1), (13, 2)],
  term ((1352929 : Rat) / 4620) [(0, 2), (8, 1), (14, 1)],
  term ((-150411 : Rat) / 385) [(0, 2), (8, 1), (14, 2)],
  term ((-599719 : Rat) / 1540) [(0, 2), (8, 1), (15, 2)],
  term (-1 : Rat) [(0, 2), (9, 1), (10, 1), (13, 1)],
  term ((1 : Rat) / 3) [(0, 2), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-35 : Rat) / 12) [(0, 2), (9, 1), (10, 1), (15, 1)],
  term ((-2 : Rat) / 3) [(0, 2), (9, 1), (11, 1)],
  term ((-1 : Rat) / 6) [(0, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-3 : Rat) / 2) [(0, 2), (9, 1), (11, 1), (14, 1)],
  term ((1 : Rat) / 3) [(0, 2), (9, 1), (11, 1), (15, 2)],
  term ((11 : Rat) / 24) [(0, 2), (9, 1), (13, 1)],
  term ((35 : Rat) / 24) [(0, 2), (9, 1), (13, 1), (14, 1)],
  term ((-5 : Rat) / 2) [(0, 2), (9, 1), (13, 1), (15, 2)],
  term ((-25 : Rat) / 12) [(0, 2), (9, 1), (14, 1), (15, 1)],
  term (2 : Rat) [(0, 2), (9, 1), (14, 2), (15, 1)],
  term ((139 : Rat) / 48) [(0, 2), (9, 1), (15, 1)],
  term (2 : Rat) [(0, 2), (9, 1), (15, 3)],
  term ((933651 : Rat) / 12320) [(0, 2), (10, 1)],
  term ((321031 : Rat) / 1848) [(0, 2), (10, 1), (13, 1), (15, 1)],
  term (4 : Rat) [(0, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-77 : Rat) / 12) [(0, 2), (10, 1), (13, 2)],
  term ((-3460147 : Rat) / 36960) [(0, 2), (10, 1), (14, 1)],
  term ((-7 : Rat) / 12) [(0, 2), (10, 1), (14, 1), (15, 2)],
  term (-4 : Rat) [(0, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-231337 : Rat) / 27720) [(0, 2), (10, 1), (14, 2)],
  term ((-150107 : Rat) / 2640) [(0, 2), (10, 1), (15, 2)],
  term (-7 : Rat) [(0, 2), (10, 1), (15, 2), (16, 1)],
  term ((1003721 : Rat) / 18480) [(0, 2), (11, 1), (13, 1)],
  term ((-544823 : Rat) / 55440) [(0, 2), (11, 1), (13, 1), (14, 1)],
  term ((1 : Rat) / 12) [(0, 2), (11, 1), (13, 1), (15, 2)],
  term ((11 : Rat) / 10) [(0, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((2696503 : Rat) / 55440) [(0, 2), (11, 1), (14, 1), (15, 1)],
  term ((153 : Rat) / 20) [(0, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((5 : Rat) / 12) [(0, 2), (11, 1), (14, 2), (15, 1)],
  term ((14 : Rat) / 5) [(0, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-458631 : Rat) / 6160) [(0, 2), (11, 1), (15, 1)],
  term ((-9 : Rat) / 2) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1 : Rat) / 6) [(0, 2), (11, 1), (15, 3)],
  term ((-6 : Rat) / 5) [(0, 2), (11, 1), (15, 3), (16, 1)],
  term ((-158035 : Rat) / 924) [(0, 2), (13, 1), (14, 1), (15, 1)],
  term ((113 : Rat) / 20) [(0, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1 : Rat) / 3) [(0, 2), (13, 1), (14, 2), (15, 1)],
  term ((-7 : Rat) / 5) [(0, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-101428 : Rat) / 495) [(0, 2), (13, 1), (15, 1)],
  term ((54 : Rat) / 5) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((7 : Rat) / 4) [(0, 2), (13, 1), (15, 3)],
  term ((19 : Rat) / 2) [(0, 2), (13, 1), (15, 3), (16, 1)],
  term ((7 : Rat) / 12) [(0, 2), (13, 2)],
  term ((7 : Rat) / 4) [(0, 2), (13, 2), (14, 1)],
  term ((9 : Rat) / 2) [(0, 2), (13, 2), (15, 2), (16, 1)],
  term ((-56009 : Rat) / 1980) [(0, 2), (14, 1)],
  term ((-439189 : Rat) / 9240) [(0, 2), (14, 1), (15, 2)],
  term ((31 : Rat) / 20) [(0, 2), (14, 1), (15, 2), (16, 1)],
  term ((-20733499 : Rat) / 110880) [(0, 2), (14, 2)],
  term (-2 : Rat) [(0, 2), (14, 2), (15, 2)],
  term (-6 : Rat) [(0, 2), (14, 2), (15, 2), (16, 1)],
  term ((-231337 : Rat) / 4620) [(0, 2), (14, 3)],
  term ((397241 : Rat) / 3168) [(0, 2), (15, 2)],
  term ((149 : Rat) / 10) [(0, 2), (15, 2), (16, 1)],
  term (-2 : Rat) [(0, 2), (15, 4)],
  term (-6 : Rat) [(0, 2), (15, 4), (16, 1)],
  term ((-77 : Rat) / 120) [(1, 2), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((89 : Rat) / 240) [(1, 2), (7, 1), (11, 1), (14, 1)],
  term ((1 : Rat) / 2) [(1, 2), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-49 : Rat) / 30) [(1, 2), (7, 1), (11, 1), (14, 2)],
  term ((7 : Rat) / 10) [(1, 2), (7, 1), (11, 1), (15, 2)],
  term ((-19 : Rat) / 8) [(1, 2), (7, 1), (11, 1), (16, 1)],
  term ((-941 : Rat) / 120) [(1, 2), (7, 1), (13, 1)],
  term ((-667 : Rat) / 80) [(1, 2), (7, 1), (13, 1), (14, 1)],
  term (3 : Rat) [(1, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((49 : Rat) / 60) [(1, 2), (7, 1), (13, 1), (14, 2)],
  term ((-133 : Rat) / 24) [(1, 2), (7, 1), (13, 1), (15, 2)],
  term ((7 : Rat) / 4) [(1, 2), (7, 1), (13, 1), (16, 1)],
  term ((-21 : Rat) / 8) [(1, 2), (7, 1), (13, 2), (15, 1)],
  term ((-217 : Rat) / 240) [(1, 2), (7, 1), (14, 1), (15, 1)],
  term ((7 : Rat) / 2) [(1, 2), (7, 1), (14, 2), (15, 1)],
  term ((-2311 : Rat) / 240) [(1, 2), (7, 1), (15, 1)],
  term (6 : Rat) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((7 : Rat) / 2) [(1, 2), (7, 1), (15, 3)],
  term ((904391 : Rat) / 9240) [(1, 2), (8, 1)],
  term ((-31 : Rat) / 24) [(1, 2), (8, 1), (10, 1)],
  term ((1 : Rat) / 6) [(1, 2), (8, 1), (10, 1), (14, 1)],
  term ((-1 : Rat) / 3) [(1, 2), (8, 1), (10, 1), (15, 2)],
  term ((-1 : Rat) / 12) [(1, 2), (8, 1), (11, 1), (13, 1)],
  term ((1 : Rat) / 3) [(1, 2), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((13 : Rat) / 3) [(1, 2), (8, 1), (11, 1), (15, 1)],
  term ((5 : Rat) / 6) [(1, 2), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((1329829 : Rat) / 2310) [(1, 2), (8, 1), (13, 1), (15, 1)],
  term ((4 : Rat) / 3) [(1, 2), (8, 1), (13, 2)],
  term ((1352929 : Rat) / 4620) [(1, 2), (8, 1), (14, 1)],
  term ((-150411 : Rat) / 385) [(1, 2), (8, 1), (14, 2)],
  term ((-599719 : Rat) / 1540) [(1, 2), (8, 1), (15, 2)],
  term (-1 : Rat) [(1, 2), (9, 1), (10, 1), (13, 1)],
  term ((1 : Rat) / 3) [(1, 2), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-35 : Rat) / 12) [(1, 2), (9, 1), (10, 1), (15, 1)],
  term ((-2 : Rat) / 3) [(1, 2), (9, 1), (11, 1)],
  term ((-1 : Rat) / 6) [(1, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-3 : Rat) / 2) [(1, 2), (9, 1), (11, 1), (14, 1)],
  term ((1 : Rat) / 3) [(1, 2), (9, 1), (11, 1), (15, 2)],
  term ((11 : Rat) / 24) [(1, 2), (9, 1), (13, 1)],
  term ((35 : Rat) / 24) [(1, 2), (9, 1), (13, 1), (14, 1)],
  term ((-5 : Rat) / 2) [(1, 2), (9, 1), (13, 1), (15, 2)],
  term ((-25 : Rat) / 12) [(1, 2), (9, 1), (14, 1), (15, 1)],
  term (2 : Rat) [(1, 2), (9, 1), (14, 2), (15, 1)],
  term ((139 : Rat) / 48) [(1, 2), (9, 1), (15, 1)],
  term (2 : Rat) [(1, 2), (9, 1), (15, 3)],
  term ((933651 : Rat) / 12320) [(1, 2), (10, 1)],
  term ((321031 : Rat) / 1848) [(1, 2), (10, 1), (13, 1), (15, 1)],
  term (4 : Rat) [(1, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-77 : Rat) / 12) [(1, 2), (10, 1), (13, 2)],
  term ((-3460147 : Rat) / 36960) [(1, 2), (10, 1), (14, 1)],
  term ((-7 : Rat) / 12) [(1, 2), (10, 1), (14, 1), (15, 2)],
  term (-4 : Rat) [(1, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-231337 : Rat) / 27720) [(1, 2), (10, 1), (14, 2)],
  term ((-150107 : Rat) / 2640) [(1, 2), (10, 1), (15, 2)],
  term (-7 : Rat) [(1, 2), (10, 1), (15, 2), (16, 1)],
  term ((1003721 : Rat) / 18480) [(1, 2), (11, 1), (13, 1)],
  term ((-544823 : Rat) / 55440) [(1, 2), (11, 1), (13, 1), (14, 1)],
  term ((1 : Rat) / 12) [(1, 2), (11, 1), (13, 1), (15, 2)],
  term ((11 : Rat) / 10) [(1, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((2696503 : Rat) / 55440) [(1, 2), (11, 1), (14, 1), (15, 1)],
  term ((153 : Rat) / 20) [(1, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((5 : Rat) / 12) [(1, 2), (11, 1), (14, 2), (15, 1)],
  term ((14 : Rat) / 5) [(1, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-458631 : Rat) / 6160) [(1, 2), (11, 1), (15, 1)],
  term ((-9 : Rat) / 2) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1 : Rat) / 6) [(1, 2), (11, 1), (15, 3)],
  term ((-6 : Rat) / 5) [(1, 2), (11, 1), (15, 3), (16, 1)],
  term ((-158035 : Rat) / 924) [(1, 2), (13, 1), (14, 1), (15, 1)],
  term ((113 : Rat) / 20) [(1, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1 : Rat) / 3) [(1, 2), (13, 1), (14, 2), (15, 1)],
  term ((-7 : Rat) / 5) [(1, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-101428 : Rat) / 495) [(1, 2), (13, 1), (15, 1)],
  term ((54 : Rat) / 5) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((7 : Rat) / 4) [(1, 2), (13, 1), (15, 3)],
  term ((19 : Rat) / 2) [(1, 2), (13, 1), (15, 3), (16, 1)],
  term ((7 : Rat) / 12) [(1, 2), (13, 2)],
  term ((7 : Rat) / 4) [(1, 2), (13, 2), (14, 1)],
  term ((9 : Rat) / 2) [(1, 2), (13, 2), (15, 2), (16, 1)],
  term ((-56009 : Rat) / 1980) [(1, 2), (14, 1)],
  term ((-439189 : Rat) / 9240) [(1, 2), (14, 1), (15, 2)],
  term ((31 : Rat) / 20) [(1, 2), (14, 1), (15, 2), (16, 1)],
  term ((-20733499 : Rat) / 110880) [(1, 2), (14, 2)],
  term (-2 : Rat) [(1, 2), (14, 2), (15, 2)],
  term (-6 : Rat) [(1, 2), (14, 2), (15, 2), (16, 1)],
  term ((-231337 : Rat) / 4620) [(1, 2), (14, 3)],
  term ((397241 : Rat) / 3168) [(1, 2), (15, 2)],
  term ((149 : Rat) / 10) [(1, 2), (15, 2), (16, 1)],
  term (-2 : Rat) [(1, 2), (15, 4)],
  term (-6 : Rat) [(1, 2), (15, 4), (16, 1)],
  term ((77 : Rat) / 120) [(7, 1), (8, 2), (11, 1), (13, 1), (15, 1)],
  term ((-89 : Rat) / 240) [(7, 1), (8, 2), (11, 1), (14, 1)],
  term ((-1 : Rat) / 2) [(7, 1), (8, 2), (11, 1), (14, 1), (16, 1)],
  term ((49 : Rat) / 30) [(7, 1), (8, 2), (11, 1), (14, 2)],
  term ((-7 : Rat) / 10) [(7, 1), (8, 2), (11, 1), (15, 2)],
  term ((19 : Rat) / 8) [(7, 1), (8, 2), (11, 1), (16, 1)],
  term ((941 : Rat) / 120) [(7, 1), (8, 2), (13, 1)],
  term ((667 : Rat) / 80) [(7, 1), (8, 2), (13, 1), (14, 1)],
  term (-3 : Rat) [(7, 1), (8, 2), (13, 1), (14, 1), (16, 1)],
  term ((-49 : Rat) / 60) [(7, 1), (8, 2), (13, 1), (14, 2)],
  term ((133 : Rat) / 24) [(7, 1), (8, 2), (13, 1), (15, 2)],
  term ((-7 : Rat) / 4) [(7, 1), (8, 2), (13, 1), (16, 1)],
  term ((21 : Rat) / 8) [(7, 1), (8, 2), (13, 2), (15, 1)],
  term ((217 : Rat) / 240) [(7, 1), (8, 2), (14, 1), (15, 1)],
  term ((-7 : Rat) / 2) [(7, 1), (8, 2), (14, 2), (15, 1)],
  term ((2311 : Rat) / 240) [(7, 1), (8, 2), (15, 1)],
  term (-6 : Rat) [(7, 1), (8, 2), (15, 1), (16, 1)],
  term ((-7 : Rat) / 2) [(7, 1), (8, 2), (15, 3)],
  term ((77 : Rat) / 120) [(7, 1), (9, 2), (11, 1), (13, 1), (15, 1)],
  term ((-89 : Rat) / 240) [(7, 1), (9, 2), (11, 1), (14, 1)],
  term ((-1 : Rat) / 2) [(7, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((49 : Rat) / 30) [(7, 1), (9, 2), (11, 1), (14, 2)],
  term ((-7 : Rat) / 10) [(7, 1), (9, 2), (11, 1), (15, 2)],
  term ((19 : Rat) / 8) [(7, 1), (9, 2), (11, 1), (16, 1)],
  term ((941 : Rat) / 120) [(7, 1), (9, 2), (13, 1)],
  term ((667 : Rat) / 80) [(7, 1), (9, 2), (13, 1), (14, 1)],
  term (-3 : Rat) [(7, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((-49 : Rat) / 60) [(7, 1), (9, 2), (13, 1), (14, 2)],
  term ((133 : Rat) / 24) [(7, 1), (9, 2), (13, 1), (15, 2)],
  term ((-7 : Rat) / 4) [(7, 1), (9, 2), (13, 1), (16, 1)],
  term ((21 : Rat) / 8) [(7, 1), (9, 2), (13, 2), (15, 1)],
  term ((217 : Rat) / 240) [(7, 1), (9, 2), (14, 1), (15, 1)],
  term ((-7 : Rat) / 2) [(7, 1), (9, 2), (14, 2), (15, 1)],
  term ((2311 : Rat) / 240) [(7, 1), (9, 2), (15, 1)],
  term (-6 : Rat) [(7, 1), (9, 2), (15, 1), (16, 1)],
  term ((-7 : Rat) / 2) [(7, 1), (9, 2), (15, 3)],
  term ((-904391 : Rat) / 9240) [(8, 1), (9, 2)],
  term ((31 : Rat) / 24) [(8, 1), (9, 2), (10, 1)],
  term ((-1 : Rat) / 6) [(8, 1), (9, 2), (10, 1), (14, 1)],
  term ((1 : Rat) / 3) [(8, 1), (9, 2), (10, 1), (15, 2)],
  term ((1 : Rat) / 12) [(8, 1), (9, 2), (11, 1), (13, 1)],
  term ((-1 : Rat) / 3) [(8, 1), (9, 2), (11, 1), (14, 1), (15, 1)],
  term ((-13 : Rat) / 3) [(8, 1), (9, 2), (11, 1), (15, 1)],
  term ((-5 : Rat) / 6) [(8, 1), (9, 2), (13, 1), (14, 1), (15, 1)],
  term ((-1329829 : Rat) / 2310) [(8, 1), (9, 2), (13, 1), (15, 1)],
  term ((-4 : Rat) / 3) [(8, 1), (9, 2), (13, 2)],
  term ((-1352929 : Rat) / 4620) [(8, 1), (9, 2), (14, 1)],
  term ((150411 : Rat) / 385) [(8, 1), (9, 2), (14, 2)],
  term ((599719 : Rat) / 1540) [(8, 1), (9, 2), (15, 2)],
  term (1 : Rat) [(8, 2), (9, 1), (10, 1), (13, 1)],
  term ((-1 : Rat) / 3) [(8, 2), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((35 : Rat) / 12) [(8, 2), (9, 1), (10, 1), (15, 1)],
  term ((2 : Rat) / 3) [(8, 2), (9, 1), (11, 1)],
  term ((1 : Rat) / 6) [(8, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((3 : Rat) / 2) [(8, 2), (9, 1), (11, 1), (14, 1)],
  term ((-1 : Rat) / 3) [(8, 2), (9, 1), (11, 1), (15, 2)],
  term ((-11 : Rat) / 24) [(8, 2), (9, 1), (13, 1)],
  term ((-35 : Rat) / 24) [(8, 2), (9, 1), (13, 1), (14, 1)],
  term ((5 : Rat) / 2) [(8, 2), (9, 1), (13, 1), (15, 2)],
  term ((25 : Rat) / 12) [(8, 2), (9, 1), (14, 1), (15, 1)],
  term (-2 : Rat) [(8, 2), (9, 1), (14, 2), (15, 1)],
  term ((-139 : Rat) / 48) [(8, 2), (9, 1), (15, 1)],
  term (-2 : Rat) [(8, 2), (9, 1), (15, 3)],
  term ((-933651 : Rat) / 12320) [(8, 2), (10, 1)],
  term ((-321031 : Rat) / 1848) [(8, 2), (10, 1), (13, 1), (15, 1)],
  term (-4 : Rat) [(8, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((77 : Rat) / 12) [(8, 2), (10, 1), (13, 2)],
  term ((3460147 : Rat) / 36960) [(8, 2), (10, 1), (14, 1)],
  term ((7 : Rat) / 12) [(8, 2), (10, 1), (14, 1), (15, 2)],
  term (4 : Rat) [(8, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((231337 : Rat) / 27720) [(8, 2), (10, 1), (14, 2)],
  term ((150107 : Rat) / 2640) [(8, 2), (10, 1), (15, 2)],
  term (7 : Rat) [(8, 2), (10, 1), (15, 2), (16, 1)],
  term ((-1003721 : Rat) / 18480) [(8, 2), (11, 1), (13, 1)],
  term ((544823 : Rat) / 55440) [(8, 2), (11, 1), (13, 1), (14, 1)],
  term ((-1 : Rat) / 12) [(8, 2), (11, 1), (13, 1), (15, 2)],
  term ((-11 : Rat) / 10) [(8, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2696503 : Rat) / 55440) [(8, 2), (11, 1), (14, 1), (15, 1)],
  term ((-153 : Rat) / 20) [(8, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5 : Rat) / 12) [(8, 2), (11, 1), (14, 2), (15, 1)],
  term ((-14 : Rat) / 5) [(8, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((458631 : Rat) / 6160) [(8, 2), (11, 1), (15, 1)],
  term ((9 : Rat) / 2) [(8, 2), (11, 1), (15, 1), (16, 1)],
  term ((1 : Rat) / 6) [(8, 2), (11, 1), (15, 3)],
  term ((6 : Rat) / 5) [(8, 2), (11, 1), (15, 3), (16, 1)],
  term ((158035 : Rat) / 924) [(8, 2), (13, 1), (14, 1), (15, 1)],
  term ((-113 : Rat) / 20) [(8, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1 : Rat) / 3) [(8, 2), (13, 1), (14, 2), (15, 1)],
  term ((7 : Rat) / 5) [(8, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((101428 : Rat) / 495) [(8, 2), (13, 1), (15, 1)],
  term ((-54 : Rat) / 5) [(8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-7 : Rat) / 4) [(8, 2), (13, 1), (15, 3)],
  term ((-19 : Rat) / 2) [(8, 2), (13, 1), (15, 3), (16, 1)],
  term ((-7 : Rat) / 12) [(8, 2), (13, 2)],
  term ((-7 : Rat) / 4) [(8, 2), (13, 2), (14, 1)],
  term ((-9 : Rat) / 2) [(8, 2), (13, 2), (15, 2), (16, 1)],
  term ((56009 : Rat) / 1980) [(8, 2), (14, 1)],
  term ((439189 : Rat) / 9240) [(8, 2), (14, 1), (15, 2)],
  term ((-31 : Rat) / 20) [(8, 2), (14, 1), (15, 2), (16, 1)],
  term ((20733499 : Rat) / 110880) [(8, 2), (14, 2)],
  term (2 : Rat) [(8, 2), (14, 2), (15, 2)],
  term (6 : Rat) [(8, 2), (14, 2), (15, 2), (16, 1)],
  term ((231337 : Rat) / 4620) [(8, 2), (14, 3)],
  term ((-397241 : Rat) / 3168) [(8, 2), (15, 2)],
  term ((-149 : Rat) / 10) [(8, 2), (15, 2), (16, 1)],
  term (2 : Rat) [(8, 2), (15, 4)],
  term (6 : Rat) [(8, 2), (15, 4), (16, 1)],
  term ((-904391 : Rat) / 9240) [(8, 3)],
  term ((31 : Rat) / 24) [(8, 3), (10, 1)],
  term ((-1 : Rat) / 6) [(8, 3), (10, 1), (14, 1)],
  term ((1 : Rat) / 3) [(8, 3), (10, 1), (15, 2)],
  term ((1 : Rat) / 12) [(8, 3), (11, 1), (13, 1)],
  term ((-1 : Rat) / 3) [(8, 3), (11, 1), (14, 1), (15, 1)],
  term ((-13 : Rat) / 3) [(8, 3), (11, 1), (15, 1)],
  term ((-5 : Rat) / 6) [(8, 3), (13, 1), (14, 1), (15, 1)],
  term ((-1329829 : Rat) / 2310) [(8, 3), (13, 1), (15, 1)],
  term ((-4 : Rat) / 3) [(8, 3), (13, 2)],
  term ((-1352929 : Rat) / 4620) [(8, 3), (14, 1)],
  term ((150411 : Rat) / 385) [(8, 3), (14, 2)],
  term ((599719 : Rat) / 1540) [(8, 3), (15, 2)],
  term ((-933651 : Rat) / 12320) [(9, 2), (10, 1)],
  term ((-321031 : Rat) / 1848) [(9, 2), (10, 1), (13, 1), (15, 1)],
  term (-4 : Rat) [(9, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((77 : Rat) / 12) [(9, 2), (10, 1), (13, 2)],
  term ((3460147 : Rat) / 36960) [(9, 2), (10, 1), (14, 1)],
  term ((7 : Rat) / 12) [(9, 2), (10, 1), (14, 1), (15, 2)],
  term (4 : Rat) [(9, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((231337 : Rat) / 27720) [(9, 2), (10, 1), (14, 2)],
  term ((150107 : Rat) / 2640) [(9, 2), (10, 1), (15, 2)],
  term (7 : Rat) [(9, 2), (10, 1), (15, 2), (16, 1)],
  term ((-1003721 : Rat) / 18480) [(9, 2), (11, 1), (13, 1)],
  term ((544823 : Rat) / 55440) [(9, 2), (11, 1), (13, 1), (14, 1)],
  term ((-1 : Rat) / 12) [(9, 2), (11, 1), (13, 1), (15, 2)],
  term ((-11 : Rat) / 10) [(9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2696503 : Rat) / 55440) [(9, 2), (11, 1), (14, 1), (15, 1)],
  term ((-153 : Rat) / 20) [(9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5 : Rat) / 12) [(9, 2), (11, 1), (14, 2), (15, 1)],
  term ((-14 : Rat) / 5) [(9, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((458631 : Rat) / 6160) [(9, 2), (11, 1), (15, 1)],
  term ((9 : Rat) / 2) [(9, 2), (11, 1), (15, 1), (16, 1)],
  term ((1 : Rat) / 6) [(9, 2), (11, 1), (15, 3)],
  term ((6 : Rat) / 5) [(9, 2), (11, 1), (15, 3), (16, 1)],
  term ((158035 : Rat) / 924) [(9, 2), (13, 1), (14, 1), (15, 1)],
  term ((-113 : Rat) / 20) [(9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1 : Rat) / 3) [(9, 2), (13, 1), (14, 2), (15, 1)],
  term ((7 : Rat) / 5) [(9, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((101428 : Rat) / 495) [(9, 2), (13, 1), (15, 1)],
  term ((-54 : Rat) / 5) [(9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-7 : Rat) / 4) [(9, 2), (13, 1), (15, 3)],
  term ((-19 : Rat) / 2) [(9, 2), (13, 1), (15, 3), (16, 1)],
  term ((-7 : Rat) / 12) [(9, 2), (13, 2)],
  term ((-7 : Rat) / 4) [(9, 2), (13, 2), (14, 1)],
  term ((-9 : Rat) / 2) [(9, 2), (13, 2), (15, 2), (16, 1)],
  term ((56009 : Rat) / 1980) [(9, 2), (14, 1)],
  term ((439189 : Rat) / 9240) [(9, 2), (14, 1), (15, 2)],
  term ((-31 : Rat) / 20) [(9, 2), (14, 1), (15, 2), (16, 1)],
  term ((20733499 : Rat) / 110880) [(9, 2), (14, 2)],
  term (2 : Rat) [(9, 2), (14, 2), (15, 2)],
  term (6 : Rat) [(9, 2), (14, 2), (15, 2), (16, 1)],
  term ((231337 : Rat) / 4620) [(9, 2), (14, 3)],
  term ((-397241 : Rat) / 3168) [(9, 2), (15, 2)],
  term ((-149 : Rat) / 10) [(9, 2), (15, 2), (16, 1)],
  term (2 : Rat) [(9, 2), (15, 4)],
  term (6 : Rat) [(9, 2), (15, 4), (16, 1)],
  term (1 : Rat) [(9, 3), (10, 1), (13, 1)],
  term ((-1 : Rat) / 3) [(9, 3), (10, 1), (14, 1), (15, 1)],
  term ((35 : Rat) / 12) [(9, 3), (10, 1), (15, 1)],
  term ((2 : Rat) / 3) [(9, 3), (11, 1)],
  term ((1 : Rat) / 6) [(9, 3), (11, 1), (13, 1), (15, 1)],
  term ((3 : Rat) / 2) [(9, 3), (11, 1), (14, 1)],
  term ((-1 : Rat) / 3) [(9, 3), (11, 1), (15, 2)],
  term ((-11 : Rat) / 24) [(9, 3), (13, 1)],
  term ((-35 : Rat) / 24) [(9, 3), (13, 1), (14, 1)],
  term ((5 : Rat) / 2) [(9, 3), (13, 1), (15, 2)],
  term ((25 : Rat) / 12) [(9, 3), (14, 1), (15, 1)],
  term (-2 : Rat) [(9, 3), (14, 2), (15, 1)],
  term ((-139 : Rat) / 48) [(9, 3), (15, 1)],
  term (-2 : Rat) [(9, 3), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 1, terms 200 through 288. -/
theorem rs_R014_ueqv_R014YY_block_01_0200_0288_valid :
    checkProductSumEq rs_R014_ueqv_R014YY_partials_01_0200_0288
      rs_R014_ueqv_R014YY_block_01_0200_0288 = true := by
  native_decide

end R014UeqvR014YYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
