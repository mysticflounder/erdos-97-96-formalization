/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010NYY, term block 4:200-299

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010NYYTermShards

/-- Generator polynomial 4 for relaxed split surplus certificate `R010:u=v:R010NYY`. -/
def rs_R010_ueqv_R010NYY_generator_04_0200_0299 : Poly :=
[
  term (-2 : Rat) [(6, 1)],
  term (1 : Rat) [(6, 2)],
  term (1 : Rat) [(7, 2)],
  term (2 : Rat) [(12, 1)],
  term (-1 : Rat) [(12, 2)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 200 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0200 : Poly :=
[
  term ((-64238671173708934705 : Rat) / 1052941751478831424) [(1, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 200 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0200 : Poly :=
[
  term ((64238671173708934705 : Rat) / 526470875739415712) [(1, 1), (6, 1), (11, 2), (15, 1), (16, 1)],
  term ((-64238671173708934705 : Rat) / 1052941751478831424) [(1, 1), (6, 2), (11, 2), (15, 1), (16, 1)],
  term ((-64238671173708934705 : Rat) / 1052941751478831424) [(1, 1), (7, 2), (11, 2), (15, 1), (16, 1)],
  term ((-64238671173708934705 : Rat) / 526470875739415712) [(1, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((64238671173708934705 : Rat) / 1052941751478831424) [(1, 1), (11, 2), (12, 2), (15, 1), (16, 1)],
  term ((64238671173708934705 : Rat) / 1052941751478831424) [(1, 1), (11, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0200_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0200
        rs_R010_ueqv_R010NYY_generator_04_0200_0299 =
      rs_R010_ueqv_R010NYY_partial_04_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0201 : Poly :=
[
  term ((247437128563111349 : Rat) / 47725405166179328) [(1, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 201 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0201 : Poly :=
[
  term ((-247437128563111349 : Rat) / 23862702583089664) [(1, 1), (6, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((247437128563111349 : Rat) / 47725405166179328) [(1, 1), (6, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((247437128563111349 : Rat) / 47725405166179328) [(1, 1), (7, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((247437128563111349 : Rat) / 23862702583089664) [(1, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-247437128563111349 : Rat) / 47725405166179328) [(1, 1), (12, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-247437128563111349 : Rat) / 47725405166179328) [(1, 1), (13, 3), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0201_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0201
        rs_R010_ueqv_R010NYY_generator_04_0200_0299 =
      rs_R010_ueqv_R010NYY_partial_04_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0202 : Poly :=
[
  term ((-3061504394017 : Rat) / 7609280160424) [(1, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 202 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0202 : Poly :=
[
  term ((3061504394017 : Rat) / 3804640080212) [(1, 1), (6, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3061504394017 : Rat) / 7609280160424) [(1, 1), (6, 2), (13, 1), (14, 1), (16, 1)],
  term ((-3061504394017 : Rat) / 7609280160424) [(1, 1), (7, 2), (13, 1), (14, 1), (16, 1)],
  term ((-3061504394017 : Rat) / 3804640080212) [(1, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((3061504394017 : Rat) / 7609280160424) [(1, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((3061504394017 : Rat) / 7609280160424) [(1, 1), (13, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0202_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0202
        rs_R010_ueqv_R010NYY_generator_04_0200_0299 =
      rs_R010_ueqv_R010NYY_partial_04_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0203 : Poly :=
[
  term ((1025651581868754363 : Rat) / 95450810332358656) [(1, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 203 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0203 : Poly :=
[
  term ((-1025651581868754363 : Rat) / 47725405166179328) [(1, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((1025651581868754363 : Rat) / 95450810332358656) [(1, 1), (6, 2), (13, 1), (15, 2), (16, 1)],
  term ((1025651581868754363 : Rat) / 95450810332358656) [(1, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((1025651581868754363 : Rat) / 47725405166179328) [(1, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1025651581868754363 : Rat) / 95450810332358656) [(1, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-1025651581868754363 : Rat) / 95450810332358656) [(1, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0203_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0203
        rs_R010_ueqv_R010NYY_generator_04_0200_0299 =
      rs_R010_ueqv_R010NYY_partial_04_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0204 : Poly :=
[
  term ((-3061504394017 : Rat) / 7609280160424) [(1, 1), (13, 1), (16, 1)]
]

/-- Partial product 204 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0204 : Poly :=
[
  term ((3061504394017 : Rat) / 3804640080212) [(1, 1), (6, 1), (13, 1), (16, 1)],
  term ((-3061504394017 : Rat) / 7609280160424) [(1, 1), (6, 2), (13, 1), (16, 1)],
  term ((-3061504394017 : Rat) / 7609280160424) [(1, 1), (7, 2), (13, 1), (16, 1)],
  term ((-3061504394017 : Rat) / 3804640080212) [(1, 1), (12, 1), (13, 1), (16, 1)],
  term ((3061504394017 : Rat) / 7609280160424) [(1, 1), (12, 2), (13, 1), (16, 1)],
  term ((3061504394017 : Rat) / 7609280160424) [(1, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0204_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0204
        rs_R010_ueqv_R010NYY_generator_04_0200_0299 =
      rs_R010_ueqv_R010NYY_partial_04_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0205 : Poly :=
[
  term ((248319699437457173 : Rat) / 27271660094959616) [(1, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 205 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0205 : Poly :=
[
  term ((-248319699437457173 : Rat) / 13635830047479808) [(1, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((248319699437457173 : Rat) / 27271660094959616) [(1, 1), (6, 2), (14, 1), (15, 1), (16, 1)],
  term ((248319699437457173 : Rat) / 27271660094959616) [(1, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((248319699437457173 : Rat) / 13635830047479808) [(1, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-248319699437457173 : Rat) / 27271660094959616) [(1, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-248319699437457173 : Rat) / 27271660094959616) [(1, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0205_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0205
        rs_R010_ueqv_R010NYY_generator_04_0200_0299 =
      rs_R010_ueqv_R010NYY_partial_04_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0206 : Poly :=
[
  term ((-163489602612049147 : Rat) / 11687854326411264) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 206 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0206 : Poly :=
[
  term ((163489602612049147 : Rat) / 5843927163205632) [(1, 1), (6, 1), (15, 1), (16, 1)],
  term ((-163489602612049147 : Rat) / 11687854326411264) [(1, 1), (6, 2), (15, 1), (16, 1)],
  term ((-163489602612049147 : Rat) / 11687854326411264) [(1, 1), (7, 2), (15, 1), (16, 1)],
  term ((-163489602612049147 : Rat) / 5843927163205632) [(1, 1), (12, 1), (15, 1), (16, 1)],
  term ((163489602612049147 : Rat) / 11687854326411264) [(1, 1), (12, 2), (15, 1), (16, 1)],
  term ((163489602612049147 : Rat) / 11687854326411264) [(1, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0206_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0206
        rs_R010_ueqv_R010NYY_generator_04_0200_0299 =
      rs_R010_ueqv_R010NYY_partial_04_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0207 : Poly :=
[
  term ((-2721808414194224839 : Rat) / 95450810332358656) [(1, 1), (15, 3), (16, 1)]
]

/-- Partial product 207 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0207 : Poly :=
[
  term ((2721808414194224839 : Rat) / 47725405166179328) [(1, 1), (6, 1), (15, 3), (16, 1)],
  term ((-2721808414194224839 : Rat) / 95450810332358656) [(1, 1), (6, 2), (15, 3), (16, 1)],
  term ((-2721808414194224839 : Rat) / 95450810332358656) [(1, 1), (7, 2), (15, 3), (16, 1)],
  term ((-2721808414194224839 : Rat) / 47725405166179328) [(1, 1), (12, 1), (15, 3), (16, 1)],
  term ((2721808414194224839 : Rat) / 95450810332358656) [(1, 1), (12, 2), (15, 3), (16, 1)],
  term ((2721808414194224839 : Rat) / 95450810332358656) [(1, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0207_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0207
        rs_R010_ueqv_R010NYY_generator_04_0200_0299 =
      rs_R010_ueqv_R010NYY_partial_04_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0208 : Poly :=
[
  term ((-10925110817965791 : Rat) / 75210125105630816) [(1, 2), (3, 1), (5, 1), (16, 1)]
]

/-- Partial product 208 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0208 : Poly :=
[
  term ((10925110817965791 : Rat) / 37605062552815408) [(1, 2), (3, 1), (5, 1), (6, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 75210125105630816) [(1, 2), (3, 1), (5, 1), (6, 2), (16, 1)],
  term ((-10925110817965791 : Rat) / 75210125105630816) [(1, 2), (3, 1), (5, 1), (7, 2), (16, 1)],
  term ((-10925110817965791 : Rat) / 37605062552815408) [(1, 2), (3, 1), (5, 1), (12, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 75210125105630816) [(1, 2), (3, 1), (5, 1), (12, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 75210125105630816) [(1, 2), (3, 1), (5, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0208_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0208
        rs_R010_ueqv_R010NYY_generator_04_0200_0299 =
      rs_R010_ueqv_R010NYY_partial_04_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0209 : Poly :=
[
  term ((363534495967615059 : Rat) / 75210125105630816) [(1, 2), (3, 1), (11, 1), (16, 1)]
]

/-- Partial product 209 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0209 : Poly :=
[
  term ((-363534495967615059 : Rat) / 37605062552815408) [(1, 2), (3, 1), (6, 1), (11, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 75210125105630816) [(1, 2), (3, 1), (6, 2), (11, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 75210125105630816) [(1, 2), (3, 1), (7, 2), (11, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 37605062552815408) [(1, 2), (3, 1), (11, 1), (12, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 75210125105630816) [(1, 2), (3, 1), (11, 1), (12, 2), (16, 1)],
  term ((-363534495967615059 : Rat) / 75210125105630816) [(1, 2), (3, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0209_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0209
        rs_R010_ueqv_R010NYY_generator_04_0200_0299 =
      rs_R010_ueqv_R010NYY_partial_04_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0210 : Poly :=
[
  term ((-333796423576923 : Rat) / 852239377967488) [(1, 2), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 210 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0210 : Poly :=
[
  term ((333796423576923 : Rat) / 426119688983744) [(1, 2), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 852239377967488) [(1, 2), (3, 1), (6, 2), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 852239377967488) [(1, 2), (3, 1), (7, 2), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 426119688983744) [(1, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 852239377967488) [(1, 2), (3, 1), (12, 2), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 852239377967488) [(1, 2), (3, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0210_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0210
        rs_R010_ueqv_R010NYY_generator_04_0200_0299 =
      rs_R010_ueqv_R010NYY_partial_04_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0211 : Poly :=
[
  term ((24616754095471512255 : Rat) / 4211767005915325696) [(1, 2), (5, 1), (7, 1), (16, 1)]
]

/-- Partial product 211 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0211 : Poly :=
[
  term ((-24616754095471512255 : Rat) / 2105883502957662848) [(1, 2), (5, 1), (6, 1), (7, 1), (16, 1)],
  term ((24616754095471512255 : Rat) / 4211767005915325696) [(1, 2), (5, 1), (6, 2), (7, 1), (16, 1)],
  term ((24616754095471512255 : Rat) / 2105883502957662848) [(1, 2), (5, 1), (7, 1), (12, 1), (16, 1)],
  term ((-24616754095471512255 : Rat) / 4211767005915325696) [(1, 2), (5, 1), (7, 1), (12, 2), (16, 1)],
  term ((-24616754095471512255 : Rat) / 4211767005915325696) [(1, 2), (5, 1), (7, 1), (13, 2), (16, 1)],
  term ((24616754095471512255 : Rat) / 4211767005915325696) [(1, 2), (5, 1), (7, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0211_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0211
        rs_R010_ueqv_R010NYY_generator_04_0200_0299 =
      rs_R010_ueqv_R010NYY_partial_04_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0212 : Poly :=
[
  term ((12310172089443454059 : Rat) / 2105883502957662848) [(1, 2), (5, 1), (9, 1), (16, 1)]
]

/-- Partial product 212 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0212 : Poly :=
[
  term ((-12310172089443454059 : Rat) / 1052941751478831424) [(1, 2), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((12310172089443454059 : Rat) / 2105883502957662848) [(1, 2), (5, 1), (6, 2), (9, 1), (16, 1)],
  term ((12310172089443454059 : Rat) / 2105883502957662848) [(1, 2), (5, 1), (7, 2), (9, 1), (16, 1)],
  term ((12310172089443454059 : Rat) / 1052941751478831424) [(1, 2), (5, 1), (9, 1), (12, 1), (16, 1)],
  term ((-12310172089443454059 : Rat) / 2105883502957662848) [(1, 2), (5, 1), (9, 1), (12, 2), (16, 1)],
  term ((-12310172089443454059 : Rat) / 2105883502957662848) [(1, 2), (5, 1), (9, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0212_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0212
        rs_R010_ueqv_R010NYY_generator_04_0200_0299 =
      rs_R010_ueqv_R010NYY_partial_04_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0213 : Poly :=
[
  term ((4249056461351911479 : Rat) / 4211767005915325696) [(1, 2), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 213 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0213 : Poly :=
[
  term ((-4249056461351911479 : Rat) / 2105883502957662848) [(1, 2), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((4249056461351911479 : Rat) / 4211767005915325696) [(1, 2), (5, 1), (6, 2), (11, 1), (16, 1)],
  term ((4249056461351911479 : Rat) / 4211767005915325696) [(1, 2), (5, 1), (7, 2), (11, 1), (16, 1)],
  term ((4249056461351911479 : Rat) / 2105883502957662848) [(1, 2), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((-4249056461351911479 : Rat) / 4211767005915325696) [(1, 2), (5, 1), (11, 1), (12, 2), (16, 1)],
  term ((-4249056461351911479 : Rat) / 4211767005915325696) [(1, 2), (5, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0213_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0213
        rs_R010_ueqv_R010NYY_generator_04_0200_0299 =
      rs_R010_ueqv_R010NYY_partial_04_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0214 : Poly :=
[
  term ((219906078344885484717 : Rat) / 16847068023661302784) [(1, 2), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 214 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0214 : Poly :=
[
  term ((-219906078344885484717 : Rat) / 8423534011830651392) [(1, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((219906078344885484717 : Rat) / 16847068023661302784) [(1, 2), (5, 1), (6, 2), (15, 1), (16, 1)],
  term ((219906078344885484717 : Rat) / 16847068023661302784) [(1, 2), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((219906078344885484717 : Rat) / 8423534011830651392) [(1, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-219906078344885484717 : Rat) / 16847068023661302784) [(1, 2), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((-219906078344885484717 : Rat) / 16847068023661302784) [(1, 2), (5, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0214_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0214
        rs_R010_ueqv_R010NYY_generator_04_0200_0299 =
      rs_R010_ueqv_R010NYY_partial_04_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0215 : Poly :=
[
  term ((-58232073427577196457 : Rat) / 2105883502957662848) [(1, 2), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 215 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0215 : Poly :=
[
  term ((58232073427577196457 : Rat) / 1052941751478831424) [(1, 2), (6, 1), (7, 1), (11, 1), (16, 1)],
  term ((-58232073427577196457 : Rat) / 2105883502957662848) [(1, 2), (6, 2), (7, 1), (11, 1), (16, 1)],
  term ((-58232073427577196457 : Rat) / 1052941751478831424) [(1, 2), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((58232073427577196457 : Rat) / 2105883502957662848) [(1, 2), (7, 1), (11, 1), (12, 2), (16, 1)],
  term ((58232073427577196457 : Rat) / 2105883502957662848) [(1, 2), (7, 1), (11, 1), (13, 2), (16, 1)],
  term ((-58232073427577196457 : Rat) / 2105883502957662848) [(1, 2), (7, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0215_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0215
        rs_R010_ueqv_R010NYY_generator_04_0200_0299 =
      rs_R010_ueqv_R010NYY_partial_04_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0216 : Poly :=
[
  term ((-21031901114830755 : Rat) / 1491418911443104) [(1, 2), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 216 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0216 : Poly :=
[
  term ((21031901114830755 : Rat) / 745709455721552) [(1, 2), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-21031901114830755 : Rat) / 1491418911443104) [(1, 2), (6, 2), (7, 1), (15, 1), (16, 1)],
  term ((-21031901114830755 : Rat) / 745709455721552) [(1, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((21031901114830755 : Rat) / 1491418911443104) [(1, 2), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((21031901114830755 : Rat) / 1491418911443104) [(1, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-21031901114830755 : Rat) / 1491418911443104) [(1, 2), (7, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0216_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0216
        rs_R010_ueqv_R010NYY_generator_04_0200_0299 =
      rs_R010_ueqv_R010NYY_partial_04_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0217 : Poly :=
[
  term ((-32421071444940969933 : Rat) / 1052941751478831424) [(1, 2), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 217 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0217 : Poly :=
[
  term ((32421071444940969933 : Rat) / 526470875739415712) [(1, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-32421071444940969933 : Rat) / 1052941751478831424) [(1, 2), (6, 2), (9, 1), (11, 1), (16, 1)],
  term ((-32421071444940969933 : Rat) / 1052941751478831424) [(1, 2), (7, 2), (9, 1), (11, 1), (16, 1)],
  term ((-32421071444940969933 : Rat) / 526470875739415712) [(1, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((32421071444940969933 : Rat) / 1052941751478831424) [(1, 2), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((32421071444940969933 : Rat) / 1052941751478831424) [(1, 2), (9, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0217_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0217
        rs_R010_ueqv_R010NYY_generator_04_0200_0299 =
      rs_R010_ueqv_R010NYY_partial_04_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0218 : Poly :=
[
  term ((-24126516024986757 : Rat) / 1491418911443104) [(1, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 218 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0218 : Poly :=
[
  term ((24126516024986757 : Rat) / 745709455721552) [(1, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-24126516024986757 : Rat) / 1491418911443104) [(1, 2), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((-24126516024986757 : Rat) / 1491418911443104) [(1, 2), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-24126516024986757 : Rat) / 745709455721552) [(1, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((24126516024986757 : Rat) / 1491418911443104) [(1, 2), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((24126516024986757 : Rat) / 1491418911443104) [(1, 2), (9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0218_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0218
        rs_R010_ueqv_R010NYY_generator_04_0200_0299 =
      rs_R010_ueqv_R010NYY_partial_04_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0219 : Poly :=
[
  term ((-16165627489220962821 : Rat) / 1203362001690093056) [(1, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 219 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0219 : Poly :=
[
  term ((16165627489220962821 : Rat) / 601681000845046528) [(1, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-16165627489220962821 : Rat) / 1203362001690093056) [(1, 2), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-16165627489220962821 : Rat) / 1203362001690093056) [(1, 2), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-16165627489220962821 : Rat) / 601681000845046528) [(1, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((16165627489220962821 : Rat) / 1203362001690093056) [(1, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((16165627489220962821 : Rat) / 1203362001690093056) [(1, 2), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0219_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0219
        rs_R010_ueqv_R010NYY_generator_04_0200_0299 =
      rs_R010_ueqv_R010NYY_partial_04_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0220 : Poly :=
[
  term ((-70245268919840672953 : Rat) / 2105883502957662848) [(1, 2), (11, 2), (16, 1)]
]

/-- Partial product 220 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0220 : Poly :=
[
  term ((70245268919840672953 : Rat) / 1052941751478831424) [(1, 2), (6, 1), (11, 2), (16, 1)],
  term ((-70245268919840672953 : Rat) / 2105883502957662848) [(1, 2), (6, 2), (11, 2), (16, 1)],
  term ((-70245268919840672953 : Rat) / 2105883502957662848) [(1, 2), (7, 2), (11, 2), (16, 1)],
  term ((-70245268919840672953 : Rat) / 1052941751478831424) [(1, 2), (11, 2), (12, 1), (16, 1)],
  term ((70245268919840672953 : Rat) / 2105883502957662848) [(1, 2), (11, 2), (12, 2), (16, 1)],
  term ((70245268919840672953 : Rat) / 2105883502957662848) [(1, 2), (11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0220_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0220
        rs_R010_ueqv_R010NYY_generator_04_0200_0299 =
      rs_R010_ueqv_R010NYY_partial_04_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0221 : Poly :=
[
  term ((-247437128563111349 : Rat) / 11931351291544832) [(1, 2), (15, 2), (16, 1)]
]

/-- Partial product 221 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0221 : Poly :=
[
  term ((247437128563111349 : Rat) / 5965675645772416) [(1, 2), (6, 1), (15, 2), (16, 1)],
  term ((-247437128563111349 : Rat) / 11931351291544832) [(1, 2), (6, 2), (15, 2), (16, 1)],
  term ((-247437128563111349 : Rat) / 11931351291544832) [(1, 2), (7, 2), (15, 2), (16, 1)],
  term ((-247437128563111349 : Rat) / 5965675645772416) [(1, 2), (12, 1), (15, 2), (16, 1)],
  term ((247437128563111349 : Rat) / 11931351291544832) [(1, 2), (12, 2), (15, 2), (16, 1)],
  term ((247437128563111349 : Rat) / 11931351291544832) [(1, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0221_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0221
        rs_R010_ueqv_R010NYY_generator_04_0200_0299 =
      rs_R010_ueqv_R010NYY_partial_04_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0222 : Poly :=
[
  term ((9184513182051 : Rat) / 7609280160424) [(1, 2), (16, 1)]
]

/-- Partial product 222 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0222 : Poly :=
[
  term ((-9184513182051 : Rat) / 3804640080212) [(1, 2), (6, 1), (16, 1)],
  term ((9184513182051 : Rat) / 7609280160424) [(1, 2), (6, 2), (16, 1)],
  term ((9184513182051 : Rat) / 7609280160424) [(1, 2), (7, 2), (16, 1)],
  term ((9184513182051 : Rat) / 3804640080212) [(1, 2), (12, 1), (16, 1)],
  term ((-9184513182051 : Rat) / 7609280160424) [(1, 2), (12, 2), (16, 1)],
  term ((-9184513182051 : Rat) / 7609280160424) [(1, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0222_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0222
        rs_R010_ueqv_R010NYY_generator_04_0200_0299 =
      rs_R010_ueqv_R010NYY_partial_04_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0223 : Poly :=
[
  term ((-10925110817965791 : Rat) / 150420250211261632) [(2, 1), (3, 1), (5, 1), (8, 1), (16, 1)]
]

/-- Partial product 223 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0223 : Poly :=
[
  term ((10925110817965791 : Rat) / 75210125105630816) [(2, 1), (3, 1), (5, 1), (6, 1), (8, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 150420250211261632) [(2, 1), (3, 1), (5, 1), (6, 2), (8, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 150420250211261632) [(2, 1), (3, 1), (5, 1), (7, 2), (8, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 75210125105630816) [(2, 1), (3, 1), (5, 1), (8, 1), (12, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 150420250211261632) [(2, 1), (3, 1), (5, 1), (8, 1), (12, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 150420250211261632) [(2, 1), (3, 1), (5, 1), (8, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0223_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0223
        rs_R010_ueqv_R010NYY_generator_04_0200_0299 =
      rs_R010_ueqv_R010NYY_partial_04_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0224 : Poly :=
[
  term ((3641703605988597 : Rat) / 37605062552815408) [(2, 1), (3, 1), (5, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 224 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0224 : Poly :=
[
  term ((-3641703605988597 : Rat) / 18802531276407704) [(2, 1), (3, 1), (5, 1), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((3641703605988597 : Rat) / 37605062552815408) [(2, 1), (3, 1), (5, 1), (6, 2), (9, 1), (13, 1), (16, 1)],
  term ((3641703605988597 : Rat) / 37605062552815408) [(2, 1), (3, 1), (5, 1), (7, 2), (9, 1), (13, 1), (16, 1)],
  term ((3641703605988597 : Rat) / 18802531276407704) [(2, 1), (3, 1), (5, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-3641703605988597 : Rat) / 37605062552815408) [(2, 1), (3, 1), (5, 1), (9, 1), (12, 2), (13, 1), (16, 1)],
  term ((-3641703605988597 : Rat) / 37605062552815408) [(2, 1), (3, 1), (5, 1), (9, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0224_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0224
        rs_R010_ueqv_R010NYY_generator_04_0200_0299 =
      rs_R010_ueqv_R010NYY_partial_04_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0225 : Poly :=
[
  term ((-3641703605988597 : Rat) / 75210125105630816) [(2, 1), (3, 1), (5, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 225 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0225 : Poly :=
[
  term ((3641703605988597 : Rat) / 37605062552815408) [(2, 1), (3, 1), (5, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-3641703605988597 : Rat) / 75210125105630816) [(2, 1), (3, 1), (5, 1), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((-3641703605988597 : Rat) / 75210125105630816) [(2, 1), (3, 1), (5, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-3641703605988597 : Rat) / 37605062552815408) [(2, 1), (3, 1), (5, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((3641703605988597 : Rat) / 75210125105630816) [(2, 1), (3, 1), (5, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((3641703605988597 : Rat) / 75210125105630816) [(2, 1), (3, 1), (5, 1), (9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0225_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0225
        rs_R010_ueqv_R010NYY_generator_04_0200_0299 =
      rs_R010_ueqv_R010NYY_partial_04_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0226 : Poly :=
[
  term ((32775332453897373 : Rat) / 150420250211261632) [(2, 1), (3, 1), (5, 1), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 226 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0226 : Poly :=
[
  term ((-32775332453897373 : Rat) / 75210125105630816) [(2, 1), (3, 1), (5, 1), (6, 1), (10, 1), (14, 1), (16, 1)],
  term ((32775332453897373 : Rat) / 150420250211261632) [(2, 1), (3, 1), (5, 1), (6, 2), (10, 1), (14, 1), (16, 1)],
  term ((32775332453897373 : Rat) / 150420250211261632) [(2, 1), (3, 1), (5, 1), (7, 2), (10, 1), (14, 1), (16, 1)],
  term ((32775332453897373 : Rat) / 75210125105630816) [(2, 1), (3, 1), (5, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-32775332453897373 : Rat) / 150420250211261632) [(2, 1), (3, 1), (5, 1), (10, 1), (12, 2), (14, 1), (16, 1)],
  term ((-32775332453897373 : Rat) / 150420250211261632) [(2, 1), (3, 1), (5, 1), (10, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0226_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0226
        rs_R010_ueqv_R010NYY_generator_04_0200_0299 =
      rs_R010_ueqv_R010NYY_partial_04_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0227 : Poly :=
[
  term ((-98325997361692119 : Rat) / 75210125105630816) [(2, 1), (3, 1), (5, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 227 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0227 : Poly :=
[
  term ((98325997361692119 : Rat) / 37605062552815408) [(2, 1), (3, 1), (5, 1), (6, 1), (10, 1), (15, 2), (16, 1)],
  term ((-98325997361692119 : Rat) / 75210125105630816) [(2, 1), (3, 1), (5, 1), (6, 2), (10, 1), (15, 2), (16, 1)],
  term ((-98325997361692119 : Rat) / 75210125105630816) [(2, 1), (3, 1), (5, 1), (7, 2), (10, 1), (15, 2), (16, 1)],
  term ((-98325997361692119 : Rat) / 37605062552815408) [(2, 1), (3, 1), (5, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((98325997361692119 : Rat) / 75210125105630816) [(2, 1), (3, 1), (5, 1), (10, 1), (12, 2), (15, 2), (16, 1)],
  term ((98325997361692119 : Rat) / 75210125105630816) [(2, 1), (3, 1), (5, 1), (10, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0227_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0227
        rs_R010_ueqv_R010NYY_generator_04_0200_0299 =
      rs_R010_ueqv_R010NYY_partial_04_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0228 : Poly :=
[
  term ((3641703605988597 : Rat) / 37605062552815408) [(2, 1), (3, 1), (5, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 228 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0228 : Poly :=
[
  term ((-3641703605988597 : Rat) / 18802531276407704) [(2, 1), (3, 1), (5, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((3641703605988597 : Rat) / 37605062552815408) [(2, 1), (3, 1), (5, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((3641703605988597 : Rat) / 37605062552815408) [(2, 1), (3, 1), (5, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((3641703605988597 : Rat) / 18802531276407704) [(2, 1), (3, 1), (5, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3641703605988597 : Rat) / 37605062552815408) [(2, 1), (3, 1), (5, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-3641703605988597 : Rat) / 37605062552815408) [(2, 1), (3, 1), (5, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0228_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0228
        rs_R010_ueqv_R010NYY_generator_04_0200_0299 =
      rs_R010_ueqv_R010NYY_partial_04_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0229 : Poly :=
[
  term ((-10925110817965791 : Rat) / 9401265638203852) [(2, 1), (3, 1), (5, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 229 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0229 : Poly :=
[
  term ((10925110817965791 : Rat) / 4700632819101926) [(2, 1), (3, 1), (5, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-10925110817965791 : Rat) / 9401265638203852) [(2, 1), (3, 1), (5, 1), (6, 2), (14, 1), (15, 2), (16, 1)],
  term ((-10925110817965791 : Rat) / 9401265638203852) [(2, 1), (3, 1), (5, 1), (7, 2), (14, 1), (15, 2), (16, 1)],
  term ((-10925110817965791 : Rat) / 4700632819101926) [(2, 1), (3, 1), (5, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 9401265638203852) [(2, 1), (3, 1), (5, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 9401265638203852) [(2, 1), (3, 1), (5, 1), (13, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0229_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0229
        rs_R010_ueqv_R010NYY_generator_04_0200_0299 =
      rs_R010_ueqv_R010NYY_partial_04_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0230 : Poly :=
[
  term ((443566066984674175503 : Rat) / 33694136047322605568) [(2, 1), (3, 1), (5, 1), (14, 1), (16, 1)]
]

/-- Partial product 230 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0230 : Poly :=
[
  term ((-443566066984674175503 : Rat) / 16847068023661302784) [(2, 1), (3, 1), (5, 1), (6, 1), (14, 1), (16, 1)],
  term ((443566066984674175503 : Rat) / 33694136047322605568) [(2, 1), (3, 1), (5, 1), (6, 2), (14, 1), (16, 1)],
  term ((443566066984674175503 : Rat) / 33694136047322605568) [(2, 1), (3, 1), (5, 1), (7, 2), (14, 1), (16, 1)],
  term ((443566066984674175503 : Rat) / 16847068023661302784) [(2, 1), (3, 1), (5, 1), (12, 1), (14, 1), (16, 1)],
  term ((-443566066984674175503 : Rat) / 33694136047322605568) [(2, 1), (3, 1), (5, 1), (12, 2), (14, 1), (16, 1)],
  term ((-443566066984674175503 : Rat) / 33694136047322605568) [(2, 1), (3, 1), (5, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0230_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0230
        rs_R010_ueqv_R010NYY_generator_04_0200_0299 =
      rs_R010_ueqv_R010NYY_partial_04_0230 := by
  native_decide

/-- Coefficient term 231 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0231 : Poly :=
[
  term ((149309847845532477 : Rat) / 300840500422523264) [(2, 1), (3, 1), (5, 1), (15, 2), (16, 1)]
]

/-- Partial product 231 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0231 : Poly :=
[
  term ((-149309847845532477 : Rat) / 150420250211261632) [(2, 1), (3, 1), (5, 1), (6, 1), (15, 2), (16, 1)],
  term ((149309847845532477 : Rat) / 300840500422523264) [(2, 1), (3, 1), (5, 1), (6, 2), (15, 2), (16, 1)],
  term ((149309847845532477 : Rat) / 300840500422523264) [(2, 1), (3, 1), (5, 1), (7, 2), (15, 2), (16, 1)],
  term ((149309847845532477 : Rat) / 150420250211261632) [(2, 1), (3, 1), (5, 1), (12, 1), (15, 2), (16, 1)],
  term ((-149309847845532477 : Rat) / 300840500422523264) [(2, 1), (3, 1), (5, 1), (12, 2), (15, 2), (16, 1)],
  term ((-149309847845532477 : Rat) / 300840500422523264) [(2, 1), (3, 1), (5, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 231 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0231_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0231
        rs_R010_ueqv_R010NYY_generator_04_0200_0299 =
      rs_R010_ueqv_R010NYY_partial_04_0231 := by
  native_decide

/-- Coefficient term 232 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0232 : Poly :=
[
  term ((10925110817965791 : Rat) / 150420250211261632) [(2, 1), (3, 1), (5, 1), (16, 1)]
]

/-- Partial product 232 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0232 : Poly :=
[
  term ((-10925110817965791 : Rat) / 75210125105630816) [(2, 1), (3, 1), (5, 1), (6, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 150420250211261632) [(2, 1), (3, 1), (5, 1), (6, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 150420250211261632) [(2, 1), (3, 1), (5, 1), (7, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 75210125105630816) [(2, 1), (3, 1), (5, 1), (12, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 150420250211261632) [(2, 1), (3, 1), (5, 1), (12, 2), (16, 1)],
  term ((-10925110817965791 : Rat) / 150420250211261632) [(2, 1), (3, 1), (5, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 232 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0232_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0232
        rs_R010_ueqv_R010NYY_generator_04_0200_0299 =
      rs_R010_ueqv_R010NYY_partial_04_0232 := by
  native_decide

/-- Coefficient term 233 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0233 : Poly :=
[
  term ((363534495967615059 : Rat) / 150420250211261632) [(2, 1), (3, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 233 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0233 : Poly :=
[
  term ((-363534495967615059 : Rat) / 75210125105630816) [(2, 1), (3, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 150420250211261632) [(2, 1), (3, 1), (6, 2), (8, 1), (11, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 150420250211261632) [(2, 1), (3, 1), (7, 2), (8, 1), (11, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 75210125105630816) [(2, 1), (3, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 150420250211261632) [(2, 1), (3, 1), (8, 1), (11, 1), (12, 2), (16, 1)],
  term ((-363534495967615059 : Rat) / 150420250211261632) [(2, 1), (3, 1), (8, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 233 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0233_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0233
        rs_R010_ueqv_R010NYY_generator_04_0200_0299 =
      rs_R010_ueqv_R010NYY_partial_04_0233 := by
  native_decide

/-- Coefficient term 234 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0234 : Poly :=
[
  term ((-333796423576923 : Rat) / 1704478755934976) [(2, 1), (3, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 234 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0234 : Poly :=
[
  term ((333796423576923 : Rat) / 852239377967488) [(2, 1), (3, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 1704478755934976) [(2, 1), (3, 1), (6, 2), (8, 1), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 1704478755934976) [(2, 1), (3, 1), (7, 2), (8, 1), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 852239377967488) [(2, 1), (3, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 1704478755934976) [(2, 1), (3, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 1704478755934976) [(2, 1), (3, 1), (8, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 234 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0234_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0234
        rs_R010_ueqv_R010NYY_generator_04_0200_0299 =
      rs_R010_ueqv_R010NYY_partial_04_0234 := by
  native_decide

/-- Coefficient term 235 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0235 : Poly :=
[
  term ((-121178165322538353 : Rat) / 37605062552815408) [(2, 1), (3, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 235 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0235 : Poly :=
[
  term ((121178165322538353 : Rat) / 18802531276407704) [(2, 1), (3, 1), (6, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-121178165322538353 : Rat) / 37605062552815408) [(2, 1), (3, 1), (6, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-121178165322538353 : Rat) / 37605062552815408) [(2, 1), (3, 1), (7, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-121178165322538353 : Rat) / 18802531276407704) [(2, 1), (3, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((121178165322538353 : Rat) / 37605062552815408) [(2, 1), (3, 1), (9, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((121178165322538353 : Rat) / 37605062552815408) [(2, 1), (3, 1), (9, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 235 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0235_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0235
        rs_R010_ueqv_R010NYY_generator_04_0200_0299 =
      rs_R010_ueqv_R010NYY_partial_04_0235 := by
  native_decide

/-- Coefficient term 236 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0236 : Poly :=
[
  term ((121178165322538353 : Rat) / 75210125105630816) [(2, 1), (3, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 236 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0236 : Poly :=
[
  term ((-121178165322538353 : Rat) / 37605062552815408) [(2, 1), (3, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((121178165322538353 : Rat) / 75210125105630816) [(2, 1), (3, 1), (6, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((121178165322538353 : Rat) / 75210125105630816) [(2, 1), (3, 1), (7, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((121178165322538353 : Rat) / 37605062552815408) [(2, 1), (3, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-121178165322538353 : Rat) / 75210125105630816) [(2, 1), (3, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-121178165322538353 : Rat) / 75210125105630816) [(2, 1), (3, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 236 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0236_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0236
        rs_R010_ueqv_R010NYY_generator_04_0200_0299 =
      rs_R010_ueqv_R010NYY_partial_04_0236 := by
  native_decide

/-- Coefficient term 237 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0237 : Poly :=
[
  term ((111265474525641 : Rat) / 426119688983744) [(2, 1), (3, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 237 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0237 : Poly :=
[
  term ((-111265474525641 : Rat) / 213059844491872) [(2, 1), (3, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((111265474525641 : Rat) / 426119688983744) [(2, 1), (3, 1), (6, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((111265474525641 : Rat) / 426119688983744) [(2, 1), (3, 1), (7, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((111265474525641 : Rat) / 213059844491872) [(2, 1), (3, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-111265474525641 : Rat) / 426119688983744) [(2, 1), (3, 1), (9, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-111265474525641 : Rat) / 426119688983744) [(2, 1), (3, 1), (9, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 237 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0237_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0237
        rs_R010_ueqv_R010NYY_generator_04_0200_0299 =
      rs_R010_ueqv_R010NYY_partial_04_0237 := by
  native_decide

/-- Coefficient term 238 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0238 : Poly :=
[
  term ((-111265474525641 : Rat) / 852239377967488) [(2, 1), (3, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 238 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0238 : Poly :=
[
  term ((111265474525641 : Rat) / 426119688983744) [(2, 1), (3, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((-111265474525641 : Rat) / 852239377967488) [(2, 1), (3, 1), (6, 2), (9, 1), (15, 2), (16, 1)],
  term ((-111265474525641 : Rat) / 852239377967488) [(2, 1), (3, 1), (7, 2), (9, 1), (15, 2), (16, 1)],
  term ((-111265474525641 : Rat) / 426119688983744) [(2, 1), (3, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((111265474525641 : Rat) / 852239377967488) [(2, 1), (3, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((111265474525641 : Rat) / 852239377967488) [(2, 1), (3, 1), (9, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 238 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0238_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0238
        rs_R010_ueqv_R010NYY_generator_04_0200_0299 =
      rs_R010_ueqv_R010NYY_partial_04_0238 := by
  native_decide

/-- Coefficient term 239 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0239 : Poly :=
[
  term ((-1090603487902845177 : Rat) / 150420250211261632) [(2, 1), (3, 1), (10, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 239 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0239 : Poly :=
[
  term ((1090603487902845177 : Rat) / 75210125105630816) [(2, 1), (3, 1), (6, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1090603487902845177 : Rat) / 150420250211261632) [(2, 1), (3, 1), (6, 2), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1090603487902845177 : Rat) / 150420250211261632) [(2, 1), (3, 1), (7, 2), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1090603487902845177 : Rat) / 75210125105630816) [(2, 1), (3, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((1090603487902845177 : Rat) / 150420250211261632) [(2, 1), (3, 1), (10, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((1090603487902845177 : Rat) / 150420250211261632) [(2, 1), (3, 1), (10, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 239 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0239_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0239
        rs_R010_ueqv_R010NYY_generator_04_0200_0299 =
      rs_R010_ueqv_R010NYY_partial_04_0239 := by
  native_decide

/-- Coefficient term 240 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0240 : Poly :=
[
  term ((3271810463708535531 : Rat) / 75210125105630816) [(2, 1), (3, 1), (10, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 240 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0240 : Poly :=
[
  term ((-3271810463708535531 : Rat) / 37605062552815408) [(2, 1), (3, 1), (6, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((3271810463708535531 : Rat) / 75210125105630816) [(2, 1), (3, 1), (6, 2), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((3271810463708535531 : Rat) / 75210125105630816) [(2, 1), (3, 1), (7, 2), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((3271810463708535531 : Rat) / 37605062552815408) [(2, 1), (3, 1), (10, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-3271810463708535531 : Rat) / 75210125105630816) [(2, 1), (3, 1), (10, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((-3271810463708535531 : Rat) / 75210125105630816) [(2, 1), (3, 1), (10, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 240 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0240_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0240
        rs_R010_ueqv_R010NYY_generator_04_0200_0299 =
      rs_R010_ueqv_R010NYY_partial_04_0240 := by
  native_decide

/-- Coefficient term 241 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0241 : Poly :=
[
  term ((1001389270730769 : Rat) / 1704478755934976) [(2, 1), (3, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 241 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0241 : Poly :=
[
  term ((-1001389270730769 : Rat) / 852239377967488) [(2, 1), (3, 1), (6, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((1001389270730769 : Rat) / 1704478755934976) [(2, 1), (3, 1), (6, 2), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((1001389270730769 : Rat) / 1704478755934976) [(2, 1), (3, 1), (7, 2), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((1001389270730769 : Rat) / 852239377967488) [(2, 1), (3, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1001389270730769 : Rat) / 1704478755934976) [(2, 1), (3, 1), (10, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1001389270730769 : Rat) / 1704478755934976) [(2, 1), (3, 1), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 241 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0241_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0241
        rs_R010_ueqv_R010NYY_generator_04_0200_0299 =
      rs_R010_ueqv_R010NYY_partial_04_0241 := by
  native_decide

/-- Coefficient term 242 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0242 : Poly :=
[
  term ((-3004167812192307 : Rat) / 852239377967488) [(2, 1), (3, 1), (10, 1), (15, 3), (16, 1)]
]

/-- Partial product 242 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0242 : Poly :=
[
  term ((3004167812192307 : Rat) / 426119688983744) [(2, 1), (3, 1), (6, 1), (10, 1), (15, 3), (16, 1)],
  term ((-3004167812192307 : Rat) / 852239377967488) [(2, 1), (3, 1), (6, 2), (10, 1), (15, 3), (16, 1)],
  term ((-3004167812192307 : Rat) / 852239377967488) [(2, 1), (3, 1), (7, 2), (10, 1), (15, 3), (16, 1)],
  term ((-3004167812192307 : Rat) / 426119688983744) [(2, 1), (3, 1), (10, 1), (12, 1), (15, 3), (16, 1)],
  term ((3004167812192307 : Rat) / 852239377967488) [(2, 1), (3, 1), (10, 1), (12, 2), (15, 3), (16, 1)],
  term ((3004167812192307 : Rat) / 852239377967488) [(2, 1), (3, 1), (10, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 242 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0242_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0242
        rs_R010_ueqv_R010NYY_generator_04_0200_0299 =
      rs_R010_ueqv_R010NYY_partial_04_0242 := by
  native_decide

/-- Coefficient term 243 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0243 : Poly :=
[
  term ((-121178165322538353 : Rat) / 37605062552815408) [(2, 1), (3, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 243 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0243 : Poly :=
[
  term ((121178165322538353 : Rat) / 18802531276407704) [(2, 1), (3, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-121178165322538353 : Rat) / 37605062552815408) [(2, 1), (3, 1), (6, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-121178165322538353 : Rat) / 37605062552815408) [(2, 1), (3, 1), (7, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-121178165322538353 : Rat) / 18802531276407704) [(2, 1), (3, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((121178165322538353 : Rat) / 37605062552815408) [(2, 1), (3, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((121178165322538353 : Rat) / 37605062552815408) [(2, 1), (3, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 243 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0243_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0243
        rs_R010_ueqv_R010NYY_generator_04_0200_0299 =
      rs_R010_ueqv_R010NYY_partial_04_0243 := by
  native_decide

/-- Coefficient term 244 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0244 : Poly :=
[
  term ((363534495967615059 : Rat) / 9401265638203852) [(2, 1), (3, 1), (11, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 244 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0244 : Poly :=
[
  term ((-363534495967615059 : Rat) / 4700632819101926) [(2, 1), (3, 1), (6, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(2, 1), (3, 1), (6, 2), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(2, 1), (3, 1), (7, 2), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((363534495967615059 : Rat) / 4700632819101926) [(2, 1), (3, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(2, 1), (3, 1), (11, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(2, 1), (3, 1), (11, 1), (13, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 244 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0244_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0244
        rs_R010_ueqv_R010NYY_generator_04_0200_0299 =
      rs_R010_ueqv_R010NYY_partial_04_0244 := by
  native_decide

/-- Coefficient term 245 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0245 : Poly :=
[
  term ((-2610397670196184524109 : Rat) / 16847068023661302784) [(2, 1), (3, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 245 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0245 : Poly :=
[
  term ((2610397670196184524109 : Rat) / 8423534011830651392) [(2, 1), (3, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((-2610397670196184524109 : Rat) / 16847068023661302784) [(2, 1), (3, 1), (6, 2), (11, 1), (14, 1), (16, 1)],
  term ((-2610397670196184524109 : Rat) / 16847068023661302784) [(2, 1), (3, 1), (7, 2), (11, 1), (14, 1), (16, 1)],
  term ((-2610397670196184524109 : Rat) / 8423534011830651392) [(2, 1), (3, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((2610397670196184524109 : Rat) / 16847068023661302784) [(2, 1), (3, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((2610397670196184524109 : Rat) / 16847068023661302784) [(2, 1), (3, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 245 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0245_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0245
        rs_R010_ueqv_R010NYY_generator_04_0200_0299 =
      rs_R010_ueqv_R010NYY_partial_04_0245 := by
  native_decide

/-- Coefficient term 246 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0246 : Poly :=
[
  term ((-4968304778224072473 : Rat) / 300840500422523264) [(2, 1), (3, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 246 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0246 : Poly :=
[
  term ((4968304778224072473 : Rat) / 150420250211261632) [(2, 1), (3, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((-4968304778224072473 : Rat) / 300840500422523264) [(2, 1), (3, 1), (6, 2), (11, 1), (15, 2), (16, 1)],
  term ((-4968304778224072473 : Rat) / 300840500422523264) [(2, 1), (3, 1), (7, 2), (11, 1), (15, 2), (16, 1)],
  term ((-4968304778224072473 : Rat) / 150420250211261632) [(2, 1), (3, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((4968304778224072473 : Rat) / 300840500422523264) [(2, 1), (3, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((4968304778224072473 : Rat) / 300840500422523264) [(2, 1), (3, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 246 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0246_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0246
        rs_R010_ueqv_R010NYY_generator_04_0200_0299 =
      rs_R010_ueqv_R010NYY_partial_04_0246 := by
  native_decide

/-- Coefficient term 247 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0247 : Poly :=
[
  term ((-363534495967615059 : Rat) / 150420250211261632) [(2, 1), (3, 1), (11, 1), (16, 1)]
]

/-- Partial product 247 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0247 : Poly :=
[
  term ((363534495967615059 : Rat) / 75210125105630816) [(2, 1), (3, 1), (6, 1), (11, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 150420250211261632) [(2, 1), (3, 1), (6, 2), (11, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 150420250211261632) [(2, 1), (3, 1), (7, 2), (11, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 75210125105630816) [(2, 1), (3, 1), (11, 1), (12, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 150420250211261632) [(2, 1), (3, 1), (11, 1), (12, 2), (16, 1)],
  term ((363534495967615059 : Rat) / 150420250211261632) [(2, 1), (3, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 247 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0247_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0247
        rs_R010_ueqv_R010NYY_generator_04_0200_0299 =
      rs_R010_ueqv_R010NYY_partial_04_0247 := by
  native_decide

/-- Coefficient term 248 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0248 : Poly :=
[
  term ((111265474525641 : Rat) / 426119688983744) [(2, 1), (3, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 248 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0248 : Poly :=
[
  term ((-111265474525641 : Rat) / 213059844491872) [(2, 1), (3, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((111265474525641 : Rat) / 426119688983744) [(2, 1), (3, 1), (6, 2), (13, 1), (15, 2), (16, 1)],
  term ((111265474525641 : Rat) / 426119688983744) [(2, 1), (3, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((111265474525641 : Rat) / 213059844491872) [(2, 1), (3, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-111265474525641 : Rat) / 426119688983744) [(2, 1), (3, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-111265474525641 : Rat) / 426119688983744) [(2, 1), (3, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 248 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0248_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0248
        rs_R010_ueqv_R010NYY_generator_04_0200_0299 =
      rs_R010_ueqv_R010NYY_partial_04_0248 := by
  native_decide

/-- Coefficient term 249 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0249 : Poly :=
[
  term ((-1851043729275743607 : Rat) / 47725405166179328) [(2, 1), (3, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 249 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0249 : Poly :=
[
  term ((1851043729275743607 : Rat) / 23862702583089664) [(2, 1), (3, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1851043729275743607 : Rat) / 47725405166179328) [(2, 1), (3, 1), (6, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1851043729275743607 : Rat) / 47725405166179328) [(2, 1), (3, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1851043729275743607 : Rat) / 23862702583089664) [(2, 1), (3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1851043729275743607 : Rat) / 47725405166179328) [(2, 1), (3, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((1851043729275743607 : Rat) / 47725405166179328) [(2, 1), (3, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 249 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0249_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0249
        rs_R010_ueqv_R010NYY_generator_04_0200_0299 =
      rs_R010_ueqv_R010NYY_partial_04_0249 := by
  native_decide

/-- Coefficient term 250 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0250 : Poly :=
[
  term ((-333796423576923 : Rat) / 106529922245936) [(2, 1), (3, 1), (14, 1), (15, 3), (16, 1)]
]

/-- Partial product 250 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0250 : Poly :=
[
  term ((333796423576923 : Rat) / 53264961122968) [(2, 1), (3, 1), (6, 1), (14, 1), (15, 3), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(2, 1), (3, 1), (6, 2), (14, 1), (15, 3), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(2, 1), (3, 1), (7, 2), (14, 1), (15, 3), (16, 1)],
  term ((-333796423576923 : Rat) / 53264961122968) [(2, 1), (3, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(2, 1), (3, 1), (12, 2), (14, 1), (15, 3), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(2, 1), (3, 1), (13, 2), (14, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 250 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0250_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0250
        rs_R010_ueqv_R010NYY_generator_04_0200_0299 =
      rs_R010_ueqv_R010NYY_partial_04_0250 := by
  native_decide

/-- Coefficient term 251 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0251 : Poly :=
[
  term ((333796423576923 : Rat) / 1704478755934976) [(2, 1), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 251 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0251 : Poly :=
[
  term ((-333796423576923 : Rat) / 852239377967488) [(2, 1), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 1704478755934976) [(2, 1), (3, 1), (6, 2), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 1704478755934976) [(2, 1), (3, 1), (7, 2), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 852239377967488) [(2, 1), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 1704478755934976) [(2, 1), (3, 1), (12, 2), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 1704478755934976) [(2, 1), (3, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 251 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0251_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0251
        rs_R010_ueqv_R010NYY_generator_04_0200_0299 =
      rs_R010_ueqv_R010NYY_partial_04_0251 := by
  native_decide

/-- Coefficient term 252 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0252 : Poly :=
[
  term ((4561884455551281 : Rat) / 3408957511869952) [(2, 1), (3, 1), (15, 3), (16, 1)]
]

/-- Partial product 252 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0252 : Poly :=
[
  term ((-4561884455551281 : Rat) / 1704478755934976) [(2, 1), (3, 1), (6, 1), (15, 3), (16, 1)],
  term ((4561884455551281 : Rat) / 3408957511869952) [(2, 1), (3, 1), (6, 2), (15, 3), (16, 1)],
  term ((4561884455551281 : Rat) / 3408957511869952) [(2, 1), (3, 1), (7, 2), (15, 3), (16, 1)],
  term ((4561884455551281 : Rat) / 1704478755934976) [(2, 1), (3, 1), (12, 1), (15, 3), (16, 1)],
  term ((-4561884455551281 : Rat) / 3408957511869952) [(2, 1), (3, 1), (12, 2), (15, 3), (16, 1)],
  term ((-4561884455551281 : Rat) / 3408957511869952) [(2, 1), (3, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 252 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0252_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0252
        rs_R010_ueqv_R010NYY_generator_04_0200_0299 =
      rs_R010_ueqv_R010NYY_partial_04_0252 := by
  native_decide

/-- Coefficient term 253 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0253 : Poly :=
[
  term ((9184513182051 : Rat) / 13316240280742) [(2, 1), (4, 1), (10, 1), (16, 1)]
]

/-- Partial product 253 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0253 : Poly :=
[
  term ((-9184513182051 : Rat) / 6658120140371) [(2, 1), (4, 1), (6, 1), (10, 1), (16, 1)],
  term ((9184513182051 : Rat) / 13316240280742) [(2, 1), (4, 1), (6, 2), (10, 1), (16, 1)],
  term ((9184513182051 : Rat) / 13316240280742) [(2, 1), (4, 1), (7, 2), (10, 1), (16, 1)],
  term ((9184513182051 : Rat) / 6658120140371) [(2, 1), (4, 1), (10, 1), (12, 1), (16, 1)],
  term ((-9184513182051 : Rat) / 13316240280742) [(2, 1), (4, 1), (10, 1), (12, 2), (16, 1)],
  term ((-9184513182051 : Rat) / 13316240280742) [(2, 1), (4, 1), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 253 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0253_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0253
        rs_R010_ueqv_R010NYY_generator_04_0200_0299 =
      rs_R010_ueqv_R010NYY_partial_04_0253 := by
  native_decide

/-- Coefficient term 254 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0254 : Poly :=
[
  term ((-9184513182051 : Rat) / 26632480561484) [(2, 1), (4, 1), (14, 1), (16, 1)]
]

/-- Partial product 254 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0254 : Poly :=
[
  term ((9184513182051 : Rat) / 13316240280742) [(2, 1), (4, 1), (6, 1), (14, 1), (16, 1)],
  term ((-9184513182051 : Rat) / 26632480561484) [(2, 1), (4, 1), (6, 2), (14, 1), (16, 1)],
  term ((-9184513182051 : Rat) / 26632480561484) [(2, 1), (4, 1), (7, 2), (14, 1), (16, 1)],
  term ((-9184513182051 : Rat) / 13316240280742) [(2, 1), (4, 1), (12, 1), (14, 1), (16, 1)],
  term ((9184513182051 : Rat) / 26632480561484) [(2, 1), (4, 1), (12, 2), (14, 1), (16, 1)],
  term ((9184513182051 : Rat) / 26632480561484) [(2, 1), (4, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 254 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0254_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0254
        rs_R010_ueqv_R010NYY_generator_04_0200_0299 =
      rs_R010_ueqv_R010NYY_partial_04_0254 := by
  native_decide

/-- Coefficient term 255 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0255 : Poly :=
[
  term ((-9184513182051 : Rat) / 53264961122968) [(2, 1), (4, 1), (16, 1)]
]

/-- Partial product 255 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0255 : Poly :=
[
  term ((9184513182051 : Rat) / 26632480561484) [(2, 1), (4, 1), (6, 1), (16, 1)],
  term ((-9184513182051 : Rat) / 53264961122968) [(2, 1), (4, 1), (6, 2), (16, 1)],
  term ((-9184513182051 : Rat) / 53264961122968) [(2, 1), (4, 1), (7, 2), (16, 1)],
  term ((-9184513182051 : Rat) / 26632480561484) [(2, 1), (4, 1), (12, 1), (16, 1)],
  term ((9184513182051 : Rat) / 53264961122968) [(2, 1), (4, 1), (12, 2), (16, 1)],
  term ((9184513182051 : Rat) / 53264961122968) [(2, 1), (4, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 255 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0255_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0255
        rs_R010_ueqv_R010NYY_generator_04_0200_0299 =
      rs_R010_ueqv_R010NYY_partial_04_0255 := by
  native_decide

/-- Coefficient term 256 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0256 : Poly :=
[
  term ((12310172089443454059 : Rat) / 8423534011830651392) [(2, 1), (5, 1), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 256 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0256 : Poly :=
[
  term ((-12310172089443454059 : Rat) / 4211767005915325696) [(2, 1), (5, 1), (6, 1), (8, 1), (9, 1), (16, 1)],
  term ((12310172089443454059 : Rat) / 8423534011830651392) [(2, 1), (5, 1), (6, 2), (8, 1), (9, 1), (16, 1)],
  term ((12310172089443454059 : Rat) / 8423534011830651392) [(2, 1), (5, 1), (7, 2), (8, 1), (9, 1), (16, 1)],
  term ((12310172089443454059 : Rat) / 4211767005915325696) [(2, 1), (5, 1), (8, 1), (9, 1), (12, 1), (16, 1)],
  term ((-12310172089443454059 : Rat) / 8423534011830651392) [(2, 1), (5, 1), (8, 1), (9, 1), (12, 2), (16, 1)],
  term ((-12310172089443454059 : Rat) / 8423534011830651392) [(2, 1), (5, 1), (8, 1), (9, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 256 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0256_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0256
        rs_R010_ueqv_R010NYY_generator_04_0200_0299 =
      rs_R010_ueqv_R010NYY_partial_04_0256 := by
  native_decide

/-- Coefficient term 257 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0257 : Poly :=
[
  term ((28211562291031713945 : Rat) / 33694136047322605568) [(2, 1), (5, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 257 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0257 : Poly :=
[
  term ((-28211562291031713945 : Rat) / 16847068023661302784) [(2, 1), (5, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((28211562291031713945 : Rat) / 33694136047322605568) [(2, 1), (5, 1), (6, 2), (8, 1), (11, 1), (16, 1)],
  term ((28211562291031713945 : Rat) / 33694136047322605568) [(2, 1), (5, 1), (7, 2), (8, 1), (11, 1), (16, 1)],
  term ((28211562291031713945 : Rat) / 16847068023661302784) [(2, 1), (5, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((-28211562291031713945 : Rat) / 33694136047322605568) [(2, 1), (5, 1), (8, 1), (11, 1), (12, 2), (16, 1)],
  term ((-28211562291031713945 : Rat) / 33694136047322605568) [(2, 1), (5, 1), (8, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 257 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0257_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0257
        rs_R010_ueqv_R010NYY_generator_04_0200_0299 =
      rs_R010_ueqv_R010NYY_partial_04_0257 := by
  native_decide

/-- Coefficient term 258 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0258 : Poly :=
[
  term ((-68325355880159966655 : Rat) / 16847068023661302784) [(2, 1), (5, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 258 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0258 : Poly :=
[
  term ((68325355880159966655 : Rat) / 8423534011830651392) [(2, 1), (5, 1), (6, 1), (8, 1), (13, 1), (16, 1)],
  term ((-68325355880159966655 : Rat) / 16847068023661302784) [(2, 1), (5, 1), (6, 2), (8, 1), (13, 1), (16, 1)],
  term ((-68325355880159966655 : Rat) / 16847068023661302784) [(2, 1), (5, 1), (7, 2), (8, 1), (13, 1), (16, 1)],
  term ((-68325355880159966655 : Rat) / 8423534011830651392) [(2, 1), (5, 1), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((68325355880159966655 : Rat) / 16847068023661302784) [(2, 1), (5, 1), (8, 1), (12, 2), (13, 1), (16, 1)],
  term ((68325355880159966655 : Rat) / 16847068023661302784) [(2, 1), (5, 1), (8, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 258 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0258_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0258
        rs_R010_ueqv_R010NYY_generator_04_0200_0299 =
      rs_R010_ueqv_R010NYY_partial_04_0258 := by
  native_decide

/-- Coefficient term 259 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0259 : Poly :=
[
  term ((125435375314695865281 : Rat) / 16847068023661302784) [(2, 1), (5, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 259 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0259 : Poly :=
[
  term ((-125435375314695865281 : Rat) / 8423534011830651392) [(2, 1), (5, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((125435375314695865281 : Rat) / 16847068023661302784) [(2, 1), (5, 1), (6, 2), (8, 1), (15, 1), (16, 1)],
  term ((125435375314695865281 : Rat) / 16847068023661302784) [(2, 1), (5, 1), (7, 2), (8, 1), (15, 1), (16, 1)],
  term ((125435375314695865281 : Rat) / 8423534011830651392) [(2, 1), (5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-125435375314695865281 : Rat) / 16847068023661302784) [(2, 1), (5, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-125435375314695865281 : Rat) / 16847068023661302784) [(2, 1), (5, 1), (8, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 259 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0259_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0259
        rs_R010_ueqv_R010NYY_generator_04_0200_0299 =
      rs_R010_ueqv_R010NYY_partial_04_0259 := by
  native_decide

/-- Coefficient term 260 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0260 : Poly :=
[
  term ((-1513755712459811187 : Rat) / 65808859467426964) [(2, 1), (5, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 260 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0260 : Poly :=
[
  term ((1513755712459811187 : Rat) / 32904429733713482) [(2, 1), (5, 1), (6, 1), (9, 1), (10, 1), (16, 1)],
  term ((-1513755712459811187 : Rat) / 65808859467426964) [(2, 1), (5, 1), (6, 2), (9, 1), (10, 1), (16, 1)],
  term ((-1513755712459811187 : Rat) / 65808859467426964) [(2, 1), (5, 1), (7, 2), (9, 1), (10, 1), (16, 1)],
  term ((-1513755712459811187 : Rat) / 32904429733713482) [(2, 1), (5, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((1513755712459811187 : Rat) / 65808859467426964) [(2, 1), (5, 1), (9, 1), (10, 1), (12, 2), (16, 1)],
  term ((1513755712459811187 : Rat) / 65808859467426964) [(2, 1), (5, 1), (9, 1), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 260 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0260_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0260
        rs_R010_ueqv_R010NYY_generator_04_0200_0299 =
      rs_R010_ueqv_R010NYY_partial_04_0260 := by
  native_decide

/-- Coefficient term 261 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0261 : Poly :=
[
  term ((-33646009336872204087 : Rat) / 16847068023661302784) [(2, 1), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 261 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0261 : Poly :=
[
  term ((33646009336872204087 : Rat) / 8423534011830651392) [(2, 1), (5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-33646009336872204087 : Rat) / 16847068023661302784) [(2, 1), (5, 1), (6, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-33646009336872204087 : Rat) / 16847068023661302784) [(2, 1), (5, 1), (7, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-33646009336872204087 : Rat) / 8423534011830651392) [(2, 1), (5, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((33646009336872204087 : Rat) / 16847068023661302784) [(2, 1), (5, 1), (9, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((33646009336872204087 : Rat) / 16847068023661302784) [(2, 1), (5, 1), (9, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 261 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0261_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0261
        rs_R010_ueqv_R010NYY_generator_04_0200_0299 =
      rs_R010_ueqv_R010NYY_partial_04_0261 := by
  native_decide

/-- Coefficient term 262 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0262 : Poly :=
[
  term ((25147896414168381129 : Rat) / 8423534011830651392) [(2, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 262 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0262 : Poly :=
[
  term ((-25147896414168381129 : Rat) / 4211767005915325696) [(2, 1), (5, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((25147896414168381129 : Rat) / 8423534011830651392) [(2, 1), (5, 1), (6, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((25147896414168381129 : Rat) / 8423534011830651392) [(2, 1), (5, 1), (7, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((25147896414168381129 : Rat) / 4211767005915325696) [(2, 1), (5, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-25147896414168381129 : Rat) / 8423534011830651392) [(2, 1), (5, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-25147896414168381129 : Rat) / 8423534011830651392) [(2, 1), (5, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 262 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0262_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0262
        rs_R010_ueqv_R010NYY_generator_04_0200_0299 =
      rs_R010_ueqv_R010NYY_partial_04_0262 := by
  native_decide

/-- Coefficient term 263 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0263 : Poly :=
[
  term ((625043176708712908569 : Rat) / 134776544189290422272) [(2, 1), (5, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 263 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0263 : Poly :=
[
  term ((-625043176708712908569 : Rat) / 67388272094645211136) [(2, 1), (5, 1), (6, 1), (9, 1), (14, 1), (16, 1)],
  term ((625043176708712908569 : Rat) / 134776544189290422272) [(2, 1), (5, 1), (6, 2), (9, 1), (14, 1), (16, 1)],
  term ((625043176708712908569 : Rat) / 134776544189290422272) [(2, 1), (5, 1), (7, 2), (9, 1), (14, 1), (16, 1)],
  term ((625043176708712908569 : Rat) / 67388272094645211136) [(2, 1), (5, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-625043176708712908569 : Rat) / 134776544189290422272) [(2, 1), (5, 1), (9, 1), (12, 2), (14, 1), (16, 1)],
  term ((-625043176708712908569 : Rat) / 134776544189290422272) [(2, 1), (5, 1), (9, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 263 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0263_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0263
        rs_R010_ueqv_R010NYY_generator_04_0200_0299 =
      rs_R010_ueqv_R010NYY_partial_04_0263 := by
  native_decide

/-- Coefficient term 264 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0264 : Poly :=
[
  term ((-29538782016795201141 : Rat) / 3546751162876063744) [(2, 1), (5, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 264 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0264 : Poly :=
[
  term ((29538782016795201141 : Rat) / 1773375581438031872) [(2, 1), (5, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((-29538782016795201141 : Rat) / 3546751162876063744) [(2, 1), (5, 1), (6, 2), (9, 1), (15, 2), (16, 1)],
  term ((-29538782016795201141 : Rat) / 3546751162876063744) [(2, 1), (5, 1), (7, 2), (9, 1), (15, 2), (16, 1)],
  term ((-29538782016795201141 : Rat) / 1773375581438031872) [(2, 1), (5, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((29538782016795201141 : Rat) / 3546751162876063744) [(2, 1), (5, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((29538782016795201141 : Rat) / 3546751162876063744) [(2, 1), (5, 1), (9, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 264 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0264_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0264
        rs_R010_ueqv_R010NYY_generator_04_0200_0299 =
      rs_R010_ueqv_R010NYY_partial_04_0264 := by
  native_decide

/-- Coefficient term 265 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0265 : Poly :=
[
  term ((-623168103694072882257 : Rat) / 134776544189290422272) [(2, 1), (5, 1), (9, 1), (16, 1)]
]

/-- Partial product 265 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0265 : Poly :=
[
  term ((623168103694072882257 : Rat) / 67388272094645211136) [(2, 1), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((-623168103694072882257 : Rat) / 134776544189290422272) [(2, 1), (5, 1), (6, 2), (9, 1), (16, 1)],
  term ((-623168103694072882257 : Rat) / 134776544189290422272) [(2, 1), (5, 1), (7, 2), (9, 1), (16, 1)],
  term ((-623168103694072882257 : Rat) / 67388272094645211136) [(2, 1), (5, 1), (9, 1), (12, 1), (16, 1)],
  term ((623168103694072882257 : Rat) / 134776544189290422272) [(2, 1), (5, 1), (9, 1), (12, 2), (16, 1)],
  term ((623168103694072882257 : Rat) / 134776544189290422272) [(2, 1), (5, 1), (9, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 265 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0265_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0265
        rs_R010_ueqv_R010NYY_generator_04_0200_0299 =
      rs_R010_ueqv_R010NYY_partial_04_0265 := by
  native_decide

/-- Coefficient term 266 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0266 : Poly :=
[
  term ((-12853999827937751211 : Rat) / 2105883502957662848) [(2, 1), (5, 1), (9, 2), (13, 1), (16, 1)]
]

/-- Partial product 266 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0266 : Poly :=
[
  term ((12853999827937751211 : Rat) / 1052941751478831424) [(2, 1), (5, 1), (6, 1), (9, 2), (13, 1), (16, 1)],
  term ((-12853999827937751211 : Rat) / 2105883502957662848) [(2, 1), (5, 1), (6, 2), (9, 2), (13, 1), (16, 1)],
  term ((-12853999827937751211 : Rat) / 2105883502957662848) [(2, 1), (5, 1), (7, 2), (9, 2), (13, 1), (16, 1)],
  term ((-12853999827937751211 : Rat) / 1052941751478831424) [(2, 1), (5, 1), (9, 2), (12, 1), (13, 1), (16, 1)],
  term ((12853999827937751211 : Rat) / 2105883502957662848) [(2, 1), (5, 1), (9, 2), (12, 2), (13, 1), (16, 1)],
  term ((12853999827937751211 : Rat) / 2105883502957662848) [(2, 1), (5, 1), (9, 2), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 266 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0266_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0266
        rs_R010_ueqv_R010NYY_generator_04_0200_0299 =
      rs_R010_ueqv_R010NYY_partial_04_0266 := by
  native_decide

/-- Coefficient term 267 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0267 : Poly :=
[
  term ((12853999827937751211 : Rat) / 1052941751478831424) [(2, 1), (5, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 267 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0267 : Poly :=
[
  term ((-12853999827937751211 : Rat) / 526470875739415712) [(2, 1), (5, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((12853999827937751211 : Rat) / 1052941751478831424) [(2, 1), (5, 1), (6, 2), (9, 2), (15, 1), (16, 1)],
  term ((12853999827937751211 : Rat) / 1052941751478831424) [(2, 1), (5, 1), (7, 2), (9, 2), (15, 1), (16, 1)],
  term ((12853999827937751211 : Rat) / 526470875739415712) [(2, 1), (5, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-12853999827937751211 : Rat) / 1052941751478831424) [(2, 1), (5, 1), (9, 2), (12, 2), (15, 1), (16, 1)],
  term ((-12853999827937751211 : Rat) / 1052941751478831424) [(2, 1), (5, 1), (9, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 267 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0267_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0267
        rs_R010_ueqv_R010NYY_generator_04_0200_0299 =
      rs_R010_ueqv_R010NYY_partial_04_0267 := by
  native_decide

/-- Coefficient term 268 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0268 : Poly :=
[
  term ((1513755712459811187 : Rat) / 65808859467426964) [(2, 1), (5, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 268 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0268 : Poly :=
[
  term ((-1513755712459811187 : Rat) / 32904429733713482) [(2, 1), (5, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((1513755712459811187 : Rat) / 65808859467426964) [(2, 1), (5, 1), (6, 2), (10, 1), (15, 1), (16, 1)],
  term ((1513755712459811187 : Rat) / 65808859467426964) [(2, 1), (5, 1), (7, 2), (10, 1), (15, 1), (16, 1)],
  term ((1513755712459811187 : Rat) / 32904429733713482) [(2, 1), (5, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1513755712459811187 : Rat) / 65808859467426964) [(2, 1), (5, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1513755712459811187 : Rat) / 65808859467426964) [(2, 1), (5, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 268 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0268_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0268
        rs_R010_ueqv_R010NYY_generator_04_0200_0299 =
      rs_R010_ueqv_R010NYY_partial_04_0268 := by
  native_decide

/-- Coefficient term 269 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0269 : Poly :=
[
  term ((46940248868309494107 : Rat) / 16847068023661302784) [(2, 1), (5, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 269 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0269 : Poly :=
[
  term ((-46940248868309494107 : Rat) / 8423534011830651392) [(2, 1), (5, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((46940248868309494107 : Rat) / 16847068023661302784) [(2, 1), (5, 1), (6, 2), (11, 1), (14, 1), (16, 1)],
  term ((46940248868309494107 : Rat) / 16847068023661302784) [(2, 1), (5, 1), (7, 2), (11, 1), (14, 1), (16, 1)],
  term ((46940248868309494107 : Rat) / 8423534011830651392) [(2, 1), (5, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-46940248868309494107 : Rat) / 16847068023661302784) [(2, 1), (5, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((-46940248868309494107 : Rat) / 16847068023661302784) [(2, 1), (5, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 269 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0269_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0269
        rs_R010_ueqv_R010NYY_generator_04_0200_0299 =
      rs_R010_ueqv_R010NYY_partial_04_0269 := by
  native_decide

/-- Coefficient term 270 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0270 : Poly :=
[
  term ((12747169384055734437 : Rat) / 16847068023661302784) [(2, 1), (5, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 270 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0270 : Poly :=
[
  term ((-12747169384055734437 : Rat) / 8423534011830651392) [(2, 1), (5, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((12747169384055734437 : Rat) / 16847068023661302784) [(2, 1), (5, 1), (6, 2), (11, 1), (15, 2), (16, 1)],
  term ((12747169384055734437 : Rat) / 16847068023661302784) [(2, 1), (5, 1), (7, 2), (11, 1), (15, 2), (16, 1)],
  term ((12747169384055734437 : Rat) / 8423534011830651392) [(2, 1), (5, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-12747169384055734437 : Rat) / 16847068023661302784) [(2, 1), (5, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((-12747169384055734437 : Rat) / 16847068023661302784) [(2, 1), (5, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 270 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0270_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0270
        rs_R010_ueqv_R010NYY_generator_04_0200_0299 =
      rs_R010_ueqv_R010NYY_partial_04_0270 := by
  native_decide

/-- Coefficient term 271 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0271 : Poly :=
[
  term ((-885947376482735655 : Rat) / 687635429537196032) [(2, 1), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 271 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0271 : Poly :=
[
  term ((885947376482735655 : Rat) / 343817714768598016) [(2, 1), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((-885947376482735655 : Rat) / 687635429537196032) [(2, 1), (5, 1), (6, 2), (11, 1), (16, 1)],
  term ((-885947376482735655 : Rat) / 687635429537196032) [(2, 1), (5, 1), (7, 2), (11, 1), (16, 1)],
  term ((-885947376482735655 : Rat) / 343817714768598016) [(2, 1), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((885947376482735655 : Rat) / 687635429537196032) [(2, 1), (5, 1), (11, 1), (12, 2), (16, 1)],
  term ((885947376482735655 : Rat) / 687635429537196032) [(2, 1), (5, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 271 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0271_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0271
        rs_R010_ueqv_R010NYY_generator_04_0200_0299 =
      rs_R010_ueqv_R010NYY_partial_04_0271 := by
  native_decide

/-- Coefficient term 272 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0272 : Poly :=
[
  term ((51727754171883755605 : Rat) / 16847068023661302784) [(2, 1), (5, 1), (13, 1), (16, 1)]
]

/-- Partial product 272 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0272 : Poly :=
[
  term ((-51727754171883755605 : Rat) / 8423534011830651392) [(2, 1), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((51727754171883755605 : Rat) / 16847068023661302784) [(2, 1), (5, 1), (6, 2), (13, 1), (16, 1)],
  term ((51727754171883755605 : Rat) / 16847068023661302784) [(2, 1), (5, 1), (7, 2), (13, 1), (16, 1)],
  term ((51727754171883755605 : Rat) / 8423534011830651392) [(2, 1), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((-51727754171883755605 : Rat) / 16847068023661302784) [(2, 1), (5, 1), (12, 2), (13, 1), (16, 1)],
  term ((-51727754171883755605 : Rat) / 16847068023661302784) [(2, 1), (5, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 272 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0272_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0272
        rs_R010_ueqv_R010NYY_generator_04_0200_0299 =
      rs_R010_ueqv_R010NYY_partial_04_0272 := by
  native_decide

/-- Coefficient term 273 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0273 : Poly :=
[
  term ((-915776598761011178391 : Rat) / 67388272094645211136) [(2, 1), (5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 273 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0273 : Poly :=
[
  term ((915776598761011178391 : Rat) / 33694136047322605568) [(2, 1), (5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-915776598761011178391 : Rat) / 67388272094645211136) [(2, 1), (5, 1), (6, 2), (14, 1), (15, 1), (16, 1)],
  term ((-915776598761011178391 : Rat) / 67388272094645211136) [(2, 1), (5, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((-915776598761011178391 : Rat) / 33694136047322605568) [(2, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((915776598761011178391 : Rat) / 67388272094645211136) [(2, 1), (5, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((915776598761011178391 : Rat) / 67388272094645211136) [(2, 1), (5, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 273 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0273_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0273
        rs_R010_ueqv_R010NYY_generator_04_0200_0299 =
      rs_R010_ueqv_R010NYY_partial_04_0273 := by
  native_decide

/-- Coefficient term 274 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0274 : Poly :=
[
  term ((-34987068918099493085 : Rat) / 9626896013520744448) [(2, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 274 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0274 : Poly :=
[
  term ((34987068918099493085 : Rat) / 4813448006760372224) [(2, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-34987068918099493085 : Rat) / 9626896013520744448) [(2, 1), (5, 1), (6, 2), (15, 1), (16, 1)],
  term ((-34987068918099493085 : Rat) / 9626896013520744448) [(2, 1), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((-34987068918099493085 : Rat) / 4813448006760372224) [(2, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((34987068918099493085 : Rat) / 9626896013520744448) [(2, 1), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((34987068918099493085 : Rat) / 9626896013520744448) [(2, 1), (5, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 274 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0274_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0274
        rs_R010_ueqv_R010NYY_generator_04_0200_0299 =
      rs_R010_ueqv_R010NYY_partial_04_0274 := by
  native_decide

/-- Coefficient term 275 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0275 : Poly :=
[
  term ((-32421071444940969933 : Rat) / 4211767005915325696) [(2, 1), (8, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 275 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0275 : Poly :=
[
  term ((32421071444940969933 : Rat) / 2105883502957662848) [(2, 1), (6, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-32421071444940969933 : Rat) / 4211767005915325696) [(2, 1), (6, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-32421071444940969933 : Rat) / 4211767005915325696) [(2, 1), (7, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-32421071444940969933 : Rat) / 2105883502957662848) [(2, 1), (8, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((32421071444940969933 : Rat) / 4211767005915325696) [(2, 1), (8, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((32421071444940969933 : Rat) / 4211767005915325696) [(2, 1), (8, 1), (9, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 275 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0275_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0275
        rs_R010_ueqv_R010NYY_generator_04_0200_0299 =
      rs_R010_ueqv_R010NYY_partial_04_0275 := by
  native_decide

/-- Coefficient term 276 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0276 : Poly :=
[
  term ((-24126516024986757 : Rat) / 5965675645772416) [(2, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 276 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0276 : Poly :=
[
  term ((24126516024986757 : Rat) / 2982837822886208) [(2, 1), (6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-24126516024986757 : Rat) / 5965675645772416) [(2, 1), (6, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-24126516024986757 : Rat) / 5965675645772416) [(2, 1), (7, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-24126516024986757 : Rat) / 2982837822886208) [(2, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((24126516024986757 : Rat) / 5965675645772416) [(2, 1), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((24126516024986757 : Rat) / 5965675645772416) [(2, 1), (8, 1), (9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 276 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0276_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0276
        rs_R010_ueqv_R010NYY_generator_04_0200_0299 =
      rs_R010_ueqv_R010NYY_partial_04_0276 := by
  native_decide

/-- Coefficient term 277 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0277 : Poly :=
[
  term ((423685498714386141241 : Rat) / 8423534011830651392) [(2, 1), (8, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 277 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0277 : Poly :=
[
  term ((-423685498714386141241 : Rat) / 4211767005915325696) [(2, 1), (6, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((423685498714386141241 : Rat) / 8423534011830651392) [(2, 1), (6, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((423685498714386141241 : Rat) / 8423534011830651392) [(2, 1), (7, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((423685498714386141241 : Rat) / 4211767005915325696) [(2, 1), (8, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-423685498714386141241 : Rat) / 8423534011830651392) [(2, 1), (8, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-423685498714386141241 : Rat) / 8423534011830651392) [(2, 1), (8, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 277 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0277_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0277
        rs_R010_ueqv_R010NYY_generator_04_0200_0299 =
      rs_R010_ueqv_R010NYY_partial_04_0277 := by
  native_decide

/-- Coefficient term 278 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0278 : Poly :=
[
  term ((-110675000869518264713 : Rat) / 1052941751478831424) [(2, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 278 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0278 : Poly :=
[
  term ((110675000869518264713 : Rat) / 526470875739415712) [(2, 1), (6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-110675000869518264713 : Rat) / 1052941751478831424) [(2, 1), (6, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-110675000869518264713 : Rat) / 1052941751478831424) [(2, 1), (7, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-110675000869518264713 : Rat) / 526470875739415712) [(2, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((110675000869518264713 : Rat) / 1052941751478831424) [(2, 1), (8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((110675000869518264713 : Rat) / 1052941751478831424) [(2, 1), (8, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 278 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0278_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0278
        rs_R010_ueqv_R010NYY_generator_04_0200_0299 =
      rs_R010_ueqv_R010NYY_partial_04_0278 := by
  native_decide

/-- Coefficient term 279 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0279 : Poly :=
[
  term ((-271898372148136966367 : Rat) / 16847068023661302784) [(2, 1), (8, 1), (11, 2), (16, 1)]
]

/-- Partial product 279 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0279 : Poly :=
[
  term ((271898372148136966367 : Rat) / 8423534011830651392) [(2, 1), (6, 1), (8, 1), (11, 2), (16, 1)],
  term ((-271898372148136966367 : Rat) / 16847068023661302784) [(2, 1), (6, 2), (8, 1), (11, 2), (16, 1)],
  term ((-271898372148136966367 : Rat) / 16847068023661302784) [(2, 1), (7, 2), (8, 1), (11, 2), (16, 1)],
  term ((-271898372148136966367 : Rat) / 8423534011830651392) [(2, 1), (8, 1), (11, 2), (12, 1), (16, 1)],
  term ((271898372148136966367 : Rat) / 16847068023661302784) [(2, 1), (8, 1), (11, 2), (12, 2), (16, 1)],
  term ((271898372148136966367 : Rat) / 16847068023661302784) [(2, 1), (8, 1), (11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 279 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0279_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0279
        rs_R010_ueqv_R010NYY_generator_04_0200_0299 =
      rs_R010_ueqv_R010NYY_partial_04_0279 := by
  native_decide

/-- Coefficient term 280 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0280 : Poly :=
[
  term ((137004120164657951 : Rat) / 11931351291544832) [(2, 1), (8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 280 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0280 : Poly :=
[
  term ((-137004120164657951 : Rat) / 5965675645772416) [(2, 1), (6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((137004120164657951 : Rat) / 11931351291544832) [(2, 1), (6, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((137004120164657951 : Rat) / 11931351291544832) [(2, 1), (7, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((137004120164657951 : Rat) / 5965675645772416) [(2, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-137004120164657951 : Rat) / 11931351291544832) [(2, 1), (8, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-137004120164657951 : Rat) / 11931351291544832) [(2, 1), (8, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 280 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0280_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0280
        rs_R010_ueqv_R010NYY_generator_04_0200_0299 =
      rs_R010_ueqv_R010NYY_partial_04_0280 := by
  native_decide

/-- Coefficient term 281 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0281 : Poly :=
[
  term ((-3061504394017 : Rat) / 26632480561484) [(2, 1), (8, 1), (14, 1), (16, 1)]
]

/-- Partial product 281 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0281 : Poly :=
[
  term ((3061504394017 : Rat) / 13316240280742) [(2, 1), (6, 1), (8, 1), (14, 1), (16, 1)],
  term ((-3061504394017 : Rat) / 26632480561484) [(2, 1), (6, 2), (8, 1), (14, 1), (16, 1)],
  term ((-3061504394017 : Rat) / 26632480561484) [(2, 1), (7, 2), (8, 1), (14, 1), (16, 1)],
  term ((-3061504394017 : Rat) / 13316240280742) [(2, 1), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((3061504394017 : Rat) / 26632480561484) [(2, 1), (8, 1), (12, 2), (14, 1), (16, 1)],
  term ((3061504394017 : Rat) / 26632480561484) [(2, 1), (8, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 281 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0281_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0281
        rs_R010_ueqv_R010NYY_generator_04_0200_0299 =
      rs_R010_ueqv_R010NYY_partial_04_0281 := by
  native_decide

/-- Coefficient term 282 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0282 : Poly :=
[
  term ((-260183228420474521 : Rat) / 11931351291544832) [(2, 1), (8, 1), (15, 2), (16, 1)]
]

/-- Partial product 282 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0282 : Poly :=
[
  term ((260183228420474521 : Rat) / 5965675645772416) [(2, 1), (6, 1), (8, 1), (15, 2), (16, 1)],
  term ((-260183228420474521 : Rat) / 11931351291544832) [(2, 1), (6, 2), (8, 1), (15, 2), (16, 1)],
  term ((-260183228420474521 : Rat) / 11931351291544832) [(2, 1), (7, 2), (8, 1), (15, 2), (16, 1)],
  term ((-260183228420474521 : Rat) / 5965675645772416) [(2, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((260183228420474521 : Rat) / 11931351291544832) [(2, 1), (8, 1), (12, 2), (15, 2), (16, 1)],
  term ((260183228420474521 : Rat) / 11931351291544832) [(2, 1), (8, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 282 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0282_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0282
        rs_R010_ueqv_R010NYY_generator_04_0200_0299 =
      rs_R010_ueqv_R010NYY_partial_04_0282 := by
  native_decide

/-- Coefficient term 283 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0283 : Poly :=
[
  term ((-2208972241579435 : Rat) / 3408957511869952) [(2, 1), (8, 1), (16, 1)]
]

/-- Partial product 283 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0283 : Poly :=
[
  term ((2208972241579435 : Rat) / 1704478755934976) [(2, 1), (6, 1), (8, 1), (16, 1)],
  term ((-2208972241579435 : Rat) / 3408957511869952) [(2, 1), (6, 2), (8, 1), (16, 1)],
  term ((-2208972241579435 : Rat) / 3408957511869952) [(2, 1), (7, 2), (8, 1), (16, 1)],
  term ((-2208972241579435 : Rat) / 1704478755934976) [(2, 1), (8, 1), (12, 1), (16, 1)],
  term ((2208972241579435 : Rat) / 3408957511869952) [(2, 1), (8, 1), (12, 2), (16, 1)],
  term ((2208972241579435 : Rat) / 3408957511869952) [(2, 1), (8, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 283 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0283_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0283
        rs_R010_ueqv_R010NYY_generator_04_0200_0299 =
      rs_R010_ueqv_R010NYY_partial_04_0283 := by
  native_decide

/-- Coefficient term 284 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0284 : Poly :=
[
  term ((4960748058506481776 : Rat) / 16452214866856741) [(2, 1), (9, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 284 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0284 : Poly :=
[
  term ((-9921496117012963552 : Rat) / 16452214866856741) [(2, 1), (6, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((4960748058506481776 : Rat) / 16452214866856741) [(2, 1), (6, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((4960748058506481776 : Rat) / 16452214866856741) [(2, 1), (7, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((9921496117012963552 : Rat) / 16452214866856741) [(2, 1), (9, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-4960748058506481776 : Rat) / 16452214866856741) [(2, 1), (9, 1), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((-4960748058506481776 : Rat) / 16452214866856741) [(2, 1), (9, 1), (10, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 284 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0284_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0284
        rs_R010_ueqv_R010NYY_generator_04_0200_0299 =
      rs_R010_ueqv_R010NYY_partial_04_0284 := by
  native_decide

/-- Coefficient term 285 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0285 : Poly :=
[
  term ((49648418573141559 : Rat) / 745709455721552) [(2, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 285 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0285 : Poly :=
[
  term ((-49648418573141559 : Rat) / 372854727860776) [(2, 1), (6, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((49648418573141559 : Rat) / 745709455721552) [(2, 1), (6, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((49648418573141559 : Rat) / 745709455721552) [(2, 1), (7, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((49648418573141559 : Rat) / 372854727860776) [(2, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-49648418573141559 : Rat) / 745709455721552) [(2, 1), (9, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-49648418573141559 : Rat) / 745709455721552) [(2, 1), (9, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 285 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0285_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0285
        rs_R010_ueqv_R010NYY_generator_04_0200_0299 =
      rs_R010_ueqv_R010NYY_partial_04_0285 := by
  native_decide

/-- Coefficient term 286 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0286 : Poly :=
[
  term ((41475035726524143 : Rat) / 11931351291544832) [(2, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 286 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0286 : Poly :=
[
  term ((-41475035726524143 : Rat) / 5965675645772416) [(2, 1), (6, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((41475035726524143 : Rat) / 11931351291544832) [(2, 1), (6, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((41475035726524143 : Rat) / 11931351291544832) [(2, 1), (7, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((41475035726524143 : Rat) / 5965675645772416) [(2, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-41475035726524143 : Rat) / 11931351291544832) [(2, 1), (9, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-41475035726524143 : Rat) / 11931351291544832) [(2, 1), (9, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 286 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0286_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0286
        rs_R010_ueqv_R010NYY_generator_04_0200_0299 =
      rs_R010_ueqv_R010NYY_partial_04_0286 := by
  native_decide

/-- Coefficient term 287 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0287 : Poly :=
[
  term ((-4469125592482861723613 : Rat) / 202164816283935633408) [(2, 1), (9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 287 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0287 : Poly :=
[
  term ((4469125592482861723613 : Rat) / 101082408141967816704) [(2, 1), (6, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-4469125592482861723613 : Rat) / 202164816283935633408) [(2, 1), (6, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-4469125592482861723613 : Rat) / 202164816283935633408) [(2, 1), (7, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-4469125592482861723613 : Rat) / 101082408141967816704) [(2, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((4469125592482861723613 : Rat) / 202164816283935633408) [(2, 1), (9, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((4469125592482861723613 : Rat) / 202164816283935633408) [(2, 1), (9, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 287 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0287_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0287
        rs_R010_ueqv_R010NYY_generator_04_0200_0299 =
      rs_R010_ueqv_R010NYY_partial_04_0287 := by
  native_decide

/-- Coefficient term 288 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0288 : Poly :=
[
  term ((-85633849091192066295 : Rat) / 33694136047322605568) [(2, 1), (9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 288 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0288 : Poly :=
[
  term ((85633849091192066295 : Rat) / 16847068023661302784) [(2, 1), (6, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-85633849091192066295 : Rat) / 33694136047322605568) [(2, 1), (6, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-85633849091192066295 : Rat) / 33694136047322605568) [(2, 1), (7, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-85633849091192066295 : Rat) / 16847068023661302784) [(2, 1), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((85633849091192066295 : Rat) / 33694136047322605568) [(2, 1), (9, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((85633849091192066295 : Rat) / 33694136047322605568) [(2, 1), (9, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 288 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0288_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0288
        rs_R010_ueqv_R010NYY_generator_04_0200_0299 =
      rs_R010_ueqv_R010NYY_partial_04_0288 := by
  native_decide

/-- Coefficient term 289 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0289 : Poly :=
[
  term ((4794051628287647684855 : Rat) / 67388272094645211136) [(2, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 289 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0289 : Poly :=
[
  term ((-4794051628287647684855 : Rat) / 33694136047322605568) [(2, 1), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((4794051628287647684855 : Rat) / 67388272094645211136) [(2, 1), (6, 2), (9, 1), (11, 1), (16, 1)],
  term ((4794051628287647684855 : Rat) / 67388272094645211136) [(2, 1), (7, 2), (9, 1), (11, 1), (16, 1)],
  term ((4794051628287647684855 : Rat) / 33694136047322605568) [(2, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-4794051628287647684855 : Rat) / 67388272094645211136) [(2, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((-4794051628287647684855 : Rat) / 67388272094645211136) [(2, 1), (9, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 289 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0289_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0289
        rs_R010_ueqv_R010NYY_generator_04_0200_0299 =
      rs_R010_ueqv_R010NYY_partial_04_0289 := by
  native_decide

/-- Coefficient term 290 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0290 : Poly :=
[
  term ((13502676193222081713 : Rat) / 8423534011830651392) [(2, 1), (9, 1), (11, 2), (13, 1), (16, 1)]
]

/-- Partial product 290 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0290 : Poly :=
[
  term ((-13502676193222081713 : Rat) / 4211767005915325696) [(2, 1), (6, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((13502676193222081713 : Rat) / 8423534011830651392) [(2, 1), (6, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((13502676193222081713 : Rat) / 8423534011830651392) [(2, 1), (7, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((13502676193222081713 : Rat) / 4211767005915325696) [(2, 1), (9, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((-13502676193222081713 : Rat) / 8423534011830651392) [(2, 1), (9, 1), (11, 2), (12, 2), (13, 1), (16, 1)],
  term ((-13502676193222081713 : Rat) / 8423534011830651392) [(2, 1), (9, 1), (11, 2), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 290 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0290_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0290
        rs_R010_ueqv_R010NYY_generator_04_0200_0299 =
      rs_R010_ueqv_R010NYY_partial_04_0290 := by
  native_decide

/-- Coefficient term 291 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0291 : Poly :=
[
  term ((126987861646459264193 : Rat) / 4211767005915325696) [(2, 1), (9, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 291 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0291 : Poly :=
[
  term ((-126987861646459264193 : Rat) / 2105883502957662848) [(2, 1), (6, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((126987861646459264193 : Rat) / 4211767005915325696) [(2, 1), (6, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((126987861646459264193 : Rat) / 4211767005915325696) [(2, 1), (7, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((126987861646459264193 : Rat) / 2105883502957662848) [(2, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-126987861646459264193 : Rat) / 4211767005915325696) [(2, 1), (9, 1), (11, 2), (12, 2), (15, 1), (16, 1)],
  term ((-126987861646459264193 : Rat) / 4211767005915325696) [(2, 1), (9, 1), (11, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 291 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0291_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0291
        rs_R010_ueqv_R010NYY_generator_04_0200_0299 =
      rs_R010_ueqv_R010NYY_partial_04_0291 := by
  native_decide

/-- Coefficient term 292 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0292 : Poly :=
[
  term ((105635733207325 : Rat) / 730490895400704) [(2, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 292 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0292 : Poly :=
[
  term ((-105635733207325 : Rat) / 365245447700352) [(2, 1), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((105635733207325 : Rat) / 730490895400704) [(2, 1), (6, 2), (9, 1), (13, 1), (16, 1)],
  term ((105635733207325 : Rat) / 730490895400704) [(2, 1), (7, 2), (9, 1), (13, 1), (16, 1)],
  term ((105635733207325 : Rat) / 365245447700352) [(2, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-105635733207325 : Rat) / 730490895400704) [(2, 1), (9, 1), (12, 2), (13, 1), (16, 1)],
  term ((-105635733207325 : Rat) / 730490895400704) [(2, 1), (9, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 292 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0292_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0292
        rs_R010_ueqv_R010NYY_generator_04_0200_0299 =
      rs_R010_ueqv_R010NYY_partial_04_0292 := by
  native_decide

/-- Coefficient term 293 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0293 : Poly :=
[
  term ((-721659626964931961 : Rat) / 95450810332358656) [(2, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 293 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0293 : Poly :=
[
  term ((721659626964931961 : Rat) / 47725405166179328) [(2, 1), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-721659626964931961 : Rat) / 95450810332358656) [(2, 1), (6, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-721659626964931961 : Rat) / 95450810332358656) [(2, 1), (7, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-721659626964931961 : Rat) / 47725405166179328) [(2, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((721659626964931961 : Rat) / 95450810332358656) [(2, 1), (9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((721659626964931961 : Rat) / 95450810332358656) [(2, 1), (9, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 293 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0293_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0293
        rs_R010_ueqv_R010NYY_generator_04_0200_0299 =
      rs_R010_ueqv_R010NYY_partial_04_0293 := by
  native_decide

/-- Coefficient term 294 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0294 : Poly :=
[
  term ((3481801724822734025 : Rat) / 286352430997075968) [(2, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 294 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0294 : Poly :=
[
  term ((-3481801724822734025 : Rat) / 143176215498537984) [(2, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((3481801724822734025 : Rat) / 286352430997075968) [(2, 1), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((3481801724822734025 : Rat) / 286352430997075968) [(2, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((3481801724822734025 : Rat) / 143176215498537984) [(2, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3481801724822734025 : Rat) / 286352430997075968) [(2, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-3481801724822734025 : Rat) / 286352430997075968) [(2, 1), (9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 294 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0294_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0294
        rs_R010_ueqv_R010NYY_generator_04_0200_0299 =
      rs_R010_ueqv_R010NYY_partial_04_0294 := by
  native_decide

/-- Coefficient term 295 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0295 : Poly :=
[
  term ((549299257489439991 : Rat) / 47725405166179328) [(2, 1), (9, 1), (15, 3), (16, 1)]
]

/-- Partial product 295 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0295 : Poly :=
[
  term ((-549299257489439991 : Rat) / 23862702583089664) [(2, 1), (6, 1), (9, 1), (15, 3), (16, 1)],
  term ((549299257489439991 : Rat) / 47725405166179328) [(2, 1), (6, 2), (9, 1), (15, 3), (16, 1)],
  term ((549299257489439991 : Rat) / 47725405166179328) [(2, 1), (7, 2), (9, 1), (15, 3), (16, 1)],
  term ((549299257489439991 : Rat) / 23862702583089664) [(2, 1), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((-549299257489439991 : Rat) / 47725405166179328) [(2, 1), (9, 1), (12, 2), (15, 3), (16, 1)],
  term ((-549299257489439991 : Rat) / 47725405166179328) [(2, 1), (9, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 295 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0295_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0295
        rs_R010_ueqv_R010NYY_generator_04_0200_0299 =
      rs_R010_ueqv_R010NYY_partial_04_0295 := by
  native_decide

/-- Coefficient term 296 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0296 : Poly :=
[
  term ((41469041122357166957 : Rat) / 1052941751478831424) [(2, 1), (9, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 296 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0296 : Poly :=
[
  term ((-41469041122357166957 : Rat) / 526470875739415712) [(2, 1), (6, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((41469041122357166957 : Rat) / 1052941751478831424) [(2, 1), (6, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((41469041122357166957 : Rat) / 1052941751478831424) [(2, 1), (7, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((41469041122357166957 : Rat) / 526470875739415712) [(2, 1), (9, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-41469041122357166957 : Rat) / 1052941751478831424) [(2, 1), (9, 2), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-41469041122357166957 : Rat) / 1052941751478831424) [(2, 1), (9, 2), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 296 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0296_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0296
        rs_R010_ueqv_R010NYY_generator_04_0200_0299 =
      rs_R010_ueqv_R010NYY_partial_04_0296 := by
  native_decide

/-- Coefficient term 297 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0297 : Poly :=
[
  term ((-41469041122357166957 : Rat) / 526470875739415712) [(2, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 297 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0297 : Poly :=
[
  term ((41469041122357166957 : Rat) / 263235437869707856) [(2, 1), (6, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-41469041122357166957 : Rat) / 526470875739415712) [(2, 1), (6, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-41469041122357166957 : Rat) / 526470875739415712) [(2, 1), (7, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-41469041122357166957 : Rat) / 263235437869707856) [(2, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((41469041122357166957 : Rat) / 526470875739415712) [(2, 1), (9, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((41469041122357166957 : Rat) / 526470875739415712) [(2, 1), (9, 2), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 297 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0297_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0297
        rs_R010_ueqv_R010NYY_generator_04_0200_0299 =
      rs_R010_ueqv_R010NYY_partial_04_0297 := by
  native_decide

/-- Coefficient term 298 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0298 : Poly :=
[
  term ((23088038262747441 : Rat) / 1491418911443104) [(2, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 298 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0298 : Poly :=
[
  term ((-23088038262747441 : Rat) / 745709455721552) [(2, 1), (6, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((23088038262747441 : Rat) / 1491418911443104) [(2, 1), (6, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((23088038262747441 : Rat) / 1491418911443104) [(2, 1), (7, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((23088038262747441 : Rat) / 745709455721552) [(2, 1), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-23088038262747441 : Rat) / 1491418911443104) [(2, 1), (9, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-23088038262747441 : Rat) / 1491418911443104) [(2, 1), (9, 2), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 298 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0298_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0298
        rs_R010_ueqv_R010NYY_generator_04_0200_0299 =
      rs_R010_ueqv_R010NYY_partial_04_0298 := by
  native_decide

/-- Coefficient term 299 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0299 : Poly :=
[
  term ((-23088038262747441 : Rat) / 745709455721552) [(2, 1), (9, 2), (15, 2), (16, 1)]
]

/-- Partial product 299 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0299 : Poly :=
[
  term ((23088038262747441 : Rat) / 372854727860776) [(2, 1), (6, 1), (9, 2), (15, 2), (16, 1)],
  term ((-23088038262747441 : Rat) / 745709455721552) [(2, 1), (6, 2), (9, 2), (15, 2), (16, 1)],
  term ((-23088038262747441 : Rat) / 745709455721552) [(2, 1), (7, 2), (9, 2), (15, 2), (16, 1)],
  term ((-23088038262747441 : Rat) / 372854727860776) [(2, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((23088038262747441 : Rat) / 745709455721552) [(2, 1), (9, 2), (12, 2), (15, 2), (16, 1)],
  term ((23088038262747441 : Rat) / 745709455721552) [(2, 1), (9, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 299 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0299_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0299
        rs_R010_ueqv_R010NYY_generator_04_0200_0299 =
      rs_R010_ueqv_R010NYY_partial_04_0299 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010NYY_partials_04_0200_0299 : List Poly :=
[
  rs_R010_ueqv_R010NYY_partial_04_0200,
  rs_R010_ueqv_R010NYY_partial_04_0201,
  rs_R010_ueqv_R010NYY_partial_04_0202,
  rs_R010_ueqv_R010NYY_partial_04_0203,
  rs_R010_ueqv_R010NYY_partial_04_0204,
  rs_R010_ueqv_R010NYY_partial_04_0205,
  rs_R010_ueqv_R010NYY_partial_04_0206,
  rs_R010_ueqv_R010NYY_partial_04_0207,
  rs_R010_ueqv_R010NYY_partial_04_0208,
  rs_R010_ueqv_R010NYY_partial_04_0209,
  rs_R010_ueqv_R010NYY_partial_04_0210,
  rs_R010_ueqv_R010NYY_partial_04_0211,
  rs_R010_ueqv_R010NYY_partial_04_0212,
  rs_R010_ueqv_R010NYY_partial_04_0213,
  rs_R010_ueqv_R010NYY_partial_04_0214,
  rs_R010_ueqv_R010NYY_partial_04_0215,
  rs_R010_ueqv_R010NYY_partial_04_0216,
  rs_R010_ueqv_R010NYY_partial_04_0217,
  rs_R010_ueqv_R010NYY_partial_04_0218,
  rs_R010_ueqv_R010NYY_partial_04_0219,
  rs_R010_ueqv_R010NYY_partial_04_0220,
  rs_R010_ueqv_R010NYY_partial_04_0221,
  rs_R010_ueqv_R010NYY_partial_04_0222,
  rs_R010_ueqv_R010NYY_partial_04_0223,
  rs_R010_ueqv_R010NYY_partial_04_0224,
  rs_R010_ueqv_R010NYY_partial_04_0225,
  rs_R010_ueqv_R010NYY_partial_04_0226,
  rs_R010_ueqv_R010NYY_partial_04_0227,
  rs_R010_ueqv_R010NYY_partial_04_0228,
  rs_R010_ueqv_R010NYY_partial_04_0229,
  rs_R010_ueqv_R010NYY_partial_04_0230,
  rs_R010_ueqv_R010NYY_partial_04_0231,
  rs_R010_ueqv_R010NYY_partial_04_0232,
  rs_R010_ueqv_R010NYY_partial_04_0233,
  rs_R010_ueqv_R010NYY_partial_04_0234,
  rs_R010_ueqv_R010NYY_partial_04_0235,
  rs_R010_ueqv_R010NYY_partial_04_0236,
  rs_R010_ueqv_R010NYY_partial_04_0237,
  rs_R010_ueqv_R010NYY_partial_04_0238,
  rs_R010_ueqv_R010NYY_partial_04_0239,
  rs_R010_ueqv_R010NYY_partial_04_0240,
  rs_R010_ueqv_R010NYY_partial_04_0241,
  rs_R010_ueqv_R010NYY_partial_04_0242,
  rs_R010_ueqv_R010NYY_partial_04_0243,
  rs_R010_ueqv_R010NYY_partial_04_0244,
  rs_R010_ueqv_R010NYY_partial_04_0245,
  rs_R010_ueqv_R010NYY_partial_04_0246,
  rs_R010_ueqv_R010NYY_partial_04_0247,
  rs_R010_ueqv_R010NYY_partial_04_0248,
  rs_R010_ueqv_R010NYY_partial_04_0249,
  rs_R010_ueqv_R010NYY_partial_04_0250,
  rs_R010_ueqv_R010NYY_partial_04_0251,
  rs_R010_ueqv_R010NYY_partial_04_0252,
  rs_R010_ueqv_R010NYY_partial_04_0253,
  rs_R010_ueqv_R010NYY_partial_04_0254,
  rs_R010_ueqv_R010NYY_partial_04_0255,
  rs_R010_ueqv_R010NYY_partial_04_0256,
  rs_R010_ueqv_R010NYY_partial_04_0257,
  rs_R010_ueqv_R010NYY_partial_04_0258,
  rs_R010_ueqv_R010NYY_partial_04_0259,
  rs_R010_ueqv_R010NYY_partial_04_0260,
  rs_R010_ueqv_R010NYY_partial_04_0261,
  rs_R010_ueqv_R010NYY_partial_04_0262,
  rs_R010_ueqv_R010NYY_partial_04_0263,
  rs_R010_ueqv_R010NYY_partial_04_0264,
  rs_R010_ueqv_R010NYY_partial_04_0265,
  rs_R010_ueqv_R010NYY_partial_04_0266,
  rs_R010_ueqv_R010NYY_partial_04_0267,
  rs_R010_ueqv_R010NYY_partial_04_0268,
  rs_R010_ueqv_R010NYY_partial_04_0269,
  rs_R010_ueqv_R010NYY_partial_04_0270,
  rs_R010_ueqv_R010NYY_partial_04_0271,
  rs_R010_ueqv_R010NYY_partial_04_0272,
  rs_R010_ueqv_R010NYY_partial_04_0273,
  rs_R010_ueqv_R010NYY_partial_04_0274,
  rs_R010_ueqv_R010NYY_partial_04_0275,
  rs_R010_ueqv_R010NYY_partial_04_0276,
  rs_R010_ueqv_R010NYY_partial_04_0277,
  rs_R010_ueqv_R010NYY_partial_04_0278,
  rs_R010_ueqv_R010NYY_partial_04_0279,
  rs_R010_ueqv_R010NYY_partial_04_0280,
  rs_R010_ueqv_R010NYY_partial_04_0281,
  rs_R010_ueqv_R010NYY_partial_04_0282,
  rs_R010_ueqv_R010NYY_partial_04_0283,
  rs_R010_ueqv_R010NYY_partial_04_0284,
  rs_R010_ueqv_R010NYY_partial_04_0285,
  rs_R010_ueqv_R010NYY_partial_04_0286,
  rs_R010_ueqv_R010NYY_partial_04_0287,
  rs_R010_ueqv_R010NYY_partial_04_0288,
  rs_R010_ueqv_R010NYY_partial_04_0289,
  rs_R010_ueqv_R010NYY_partial_04_0290,
  rs_R010_ueqv_R010NYY_partial_04_0291,
  rs_R010_ueqv_R010NYY_partial_04_0292,
  rs_R010_ueqv_R010NYY_partial_04_0293,
  rs_R010_ueqv_R010NYY_partial_04_0294,
  rs_R010_ueqv_R010NYY_partial_04_0295,
  rs_R010_ueqv_R010NYY_partial_04_0296,
  rs_R010_ueqv_R010NYY_partial_04_0297,
  rs_R010_ueqv_R010NYY_partial_04_0298,
  rs_R010_ueqv_R010NYY_partial_04_0299
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010NYY_block_04_0200_0299 : Poly :=
[
  term ((64238671173708934705 : Rat) / 526470875739415712) [(1, 1), (6, 1), (11, 2), (15, 1), (16, 1)],
  term ((-247437128563111349 : Rat) / 23862702583089664) [(1, 1), (6, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((3061504394017 : Rat) / 3804640080212) [(1, 1), (6, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1025651581868754363 : Rat) / 47725405166179328) [(1, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((3061504394017 : Rat) / 3804640080212) [(1, 1), (6, 1), (13, 1), (16, 1)],
  term ((-248319699437457173 : Rat) / 13635830047479808) [(1, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((163489602612049147 : Rat) / 5843927163205632) [(1, 1), (6, 1), (15, 1), (16, 1)],
  term ((2721808414194224839 : Rat) / 47725405166179328) [(1, 1), (6, 1), (15, 3), (16, 1)],
  term ((-64238671173708934705 : Rat) / 1052941751478831424) [(1, 1), (6, 2), (11, 2), (15, 1), (16, 1)],
  term ((247437128563111349 : Rat) / 47725405166179328) [(1, 1), (6, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3061504394017 : Rat) / 7609280160424) [(1, 1), (6, 2), (13, 1), (14, 1), (16, 1)],
  term ((1025651581868754363 : Rat) / 95450810332358656) [(1, 1), (6, 2), (13, 1), (15, 2), (16, 1)],
  term ((-3061504394017 : Rat) / 7609280160424) [(1, 1), (6, 2), (13, 1), (16, 1)],
  term ((248319699437457173 : Rat) / 27271660094959616) [(1, 1), (6, 2), (14, 1), (15, 1), (16, 1)],
  term ((-163489602612049147 : Rat) / 11687854326411264) [(1, 1), (6, 2), (15, 1), (16, 1)],
  term ((-2721808414194224839 : Rat) / 95450810332358656) [(1, 1), (6, 2), (15, 3), (16, 1)],
  term ((-64238671173708934705 : Rat) / 1052941751478831424) [(1, 1), (7, 2), (11, 2), (15, 1), (16, 1)],
  term ((247437128563111349 : Rat) / 47725405166179328) [(1, 1), (7, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3061504394017 : Rat) / 7609280160424) [(1, 1), (7, 2), (13, 1), (14, 1), (16, 1)],
  term ((1025651581868754363 : Rat) / 95450810332358656) [(1, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((-3061504394017 : Rat) / 7609280160424) [(1, 1), (7, 2), (13, 1), (16, 1)],
  term ((248319699437457173 : Rat) / 27271660094959616) [(1, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((-163489602612049147 : Rat) / 11687854326411264) [(1, 1), (7, 2), (15, 1), (16, 1)],
  term ((-2721808414194224839 : Rat) / 95450810332358656) [(1, 1), (7, 2), (15, 3), (16, 1)],
  term ((-64238671173708934705 : Rat) / 526470875739415712) [(1, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((64238671173708934705 : Rat) / 1052941751478831424) [(1, 1), (11, 2), (12, 2), (15, 1), (16, 1)],
  term ((64238671173708934705 : Rat) / 1052941751478831424) [(1, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((247437128563111349 : Rat) / 23862702583089664) [(1, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3061504394017 : Rat) / 3804640080212) [(1, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((1025651581868754363 : Rat) / 47725405166179328) [(1, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3061504394017 : Rat) / 3804640080212) [(1, 1), (12, 1), (13, 1), (16, 1)],
  term ((248319699437457173 : Rat) / 13635830047479808) [(1, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-163489602612049147 : Rat) / 5843927163205632) [(1, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2721808414194224839 : Rat) / 47725405166179328) [(1, 1), (12, 1), (15, 3), (16, 1)],
  term ((-247437128563111349 : Rat) / 47725405166179328) [(1, 1), (12, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((3061504394017 : Rat) / 7609280160424) [(1, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-1025651581868754363 : Rat) / 95450810332358656) [(1, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((3061504394017 : Rat) / 7609280160424) [(1, 1), (12, 2), (13, 1), (16, 1)],
  term ((-248319699437457173 : Rat) / 27271660094959616) [(1, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((163489602612049147 : Rat) / 11687854326411264) [(1, 1), (12, 2), (15, 1), (16, 1)],
  term ((2721808414194224839 : Rat) / 95450810332358656) [(1, 1), (12, 2), (15, 3), (16, 1)],
  term ((-248319699437457173 : Rat) / 27271660094959616) [(1, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((163489602612049147 : Rat) / 11687854326411264) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((2721808414194224839 : Rat) / 95450810332358656) [(1, 1), (13, 2), (15, 3), (16, 1)],
  term ((-247437128563111349 : Rat) / 47725405166179328) [(1, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((3061504394017 : Rat) / 7609280160424) [(1, 1), (13, 3), (14, 1), (16, 1)],
  term ((-1025651581868754363 : Rat) / 95450810332358656) [(1, 1), (13, 3), (15, 2), (16, 1)],
  term ((3061504394017 : Rat) / 7609280160424) [(1, 1), (13, 3), (16, 1)],
  term ((10925110817965791 : Rat) / 37605062552815408) [(1, 2), (3, 1), (5, 1), (6, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 75210125105630816) [(1, 2), (3, 1), (5, 1), (6, 2), (16, 1)],
  term ((-10925110817965791 : Rat) / 75210125105630816) [(1, 2), (3, 1), (5, 1), (7, 2), (16, 1)],
  term ((-10925110817965791 : Rat) / 37605062552815408) [(1, 2), (3, 1), (5, 1), (12, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 75210125105630816) [(1, 2), (3, 1), (5, 1), (12, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 75210125105630816) [(1, 2), (3, 1), (5, 1), (13, 2), (16, 1)],
  term ((-363534495967615059 : Rat) / 37605062552815408) [(1, 2), (3, 1), (6, 1), (11, 1), (16, 1)],
  term ((333796423576923 : Rat) / 426119688983744) [(1, 2), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 75210125105630816) [(1, 2), (3, 1), (6, 2), (11, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 852239377967488) [(1, 2), (3, 1), (6, 2), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 75210125105630816) [(1, 2), (3, 1), (7, 2), (11, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 852239377967488) [(1, 2), (3, 1), (7, 2), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 37605062552815408) [(1, 2), (3, 1), (11, 1), (12, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 75210125105630816) [(1, 2), (3, 1), (11, 1), (12, 2), (16, 1)],
  term ((-363534495967615059 : Rat) / 75210125105630816) [(1, 2), (3, 1), (11, 1), (13, 2), (16, 1)],
  term ((-333796423576923 : Rat) / 426119688983744) [(1, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 852239377967488) [(1, 2), (3, 1), (12, 2), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 852239377967488) [(1, 2), (3, 1), (13, 2), (15, 1), (16, 1)],
  term ((-24616754095471512255 : Rat) / 2105883502957662848) [(1, 2), (5, 1), (6, 1), (7, 1), (16, 1)],
  term ((-12310172089443454059 : Rat) / 1052941751478831424) [(1, 2), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((-4249056461351911479 : Rat) / 2105883502957662848) [(1, 2), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((-219906078344885484717 : Rat) / 8423534011830651392) [(1, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((24616754095471512255 : Rat) / 4211767005915325696) [(1, 2), (5, 1), (6, 2), (7, 1), (16, 1)],
  term ((12310172089443454059 : Rat) / 2105883502957662848) [(1, 2), (5, 1), (6, 2), (9, 1), (16, 1)],
  term ((4249056461351911479 : Rat) / 4211767005915325696) [(1, 2), (5, 1), (6, 2), (11, 1), (16, 1)],
  term ((219906078344885484717 : Rat) / 16847068023661302784) [(1, 2), (5, 1), (6, 2), (15, 1), (16, 1)],
  term ((24616754095471512255 : Rat) / 2105883502957662848) [(1, 2), (5, 1), (7, 1), (12, 1), (16, 1)],
  term ((-24616754095471512255 : Rat) / 4211767005915325696) [(1, 2), (5, 1), (7, 1), (12, 2), (16, 1)],
  term ((-24616754095471512255 : Rat) / 4211767005915325696) [(1, 2), (5, 1), (7, 1), (13, 2), (16, 1)],
  term ((12310172089443454059 : Rat) / 2105883502957662848) [(1, 2), (5, 1), (7, 2), (9, 1), (16, 1)],
  term ((4249056461351911479 : Rat) / 4211767005915325696) [(1, 2), (5, 1), (7, 2), (11, 1), (16, 1)],
  term ((219906078344885484717 : Rat) / 16847068023661302784) [(1, 2), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((24616754095471512255 : Rat) / 4211767005915325696) [(1, 2), (5, 1), (7, 3), (16, 1)],
  term ((12310172089443454059 : Rat) / 1052941751478831424) [(1, 2), (5, 1), (9, 1), (12, 1), (16, 1)],
  term ((-12310172089443454059 : Rat) / 2105883502957662848) [(1, 2), (5, 1), (9, 1), (12, 2), (16, 1)],
  term ((-12310172089443454059 : Rat) / 2105883502957662848) [(1, 2), (5, 1), (9, 1), (13, 2), (16, 1)],
  term ((4249056461351911479 : Rat) / 2105883502957662848) [(1, 2), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((-4249056461351911479 : Rat) / 4211767005915325696) [(1, 2), (5, 1), (11, 1), (12, 2), (16, 1)],
  term ((-4249056461351911479 : Rat) / 4211767005915325696) [(1, 2), (5, 1), (11, 1), (13, 2), (16, 1)],
  term ((219906078344885484717 : Rat) / 8423534011830651392) [(1, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-219906078344885484717 : Rat) / 16847068023661302784) [(1, 2), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((-219906078344885484717 : Rat) / 16847068023661302784) [(1, 2), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((58232073427577196457 : Rat) / 1052941751478831424) [(1, 2), (6, 1), (7, 1), (11, 1), (16, 1)],
  term ((21031901114830755 : Rat) / 745709455721552) [(1, 2), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((32421071444940969933 : Rat) / 526470875739415712) [(1, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((24126516024986757 : Rat) / 745709455721552) [(1, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((16165627489220962821 : Rat) / 601681000845046528) [(1, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((70245268919840672953 : Rat) / 1052941751478831424) [(1, 2), (6, 1), (11, 2), (16, 1)],
  term ((247437128563111349 : Rat) / 5965675645772416) [(1, 2), (6, 1), (15, 2), (16, 1)],
  term ((-9184513182051 : Rat) / 3804640080212) [(1, 2), (6, 1), (16, 1)],
  term ((-58232073427577196457 : Rat) / 2105883502957662848) [(1, 2), (6, 2), (7, 1), (11, 1), (16, 1)],
  term ((-21031901114830755 : Rat) / 1491418911443104) [(1, 2), (6, 2), (7, 1), (15, 1), (16, 1)],
  term ((-32421071444940969933 : Rat) / 1052941751478831424) [(1, 2), (6, 2), (9, 1), (11, 1), (16, 1)],
  term ((-24126516024986757 : Rat) / 1491418911443104) [(1, 2), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((-16165627489220962821 : Rat) / 1203362001690093056) [(1, 2), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-70245268919840672953 : Rat) / 2105883502957662848) [(1, 2), (6, 2), (11, 2), (16, 1)],
  term ((-247437128563111349 : Rat) / 11931351291544832) [(1, 2), (6, 2), (15, 2), (16, 1)],
  term ((9184513182051 : Rat) / 7609280160424) [(1, 2), (6, 2), (16, 1)],
  term ((-58232073427577196457 : Rat) / 1052941751478831424) [(1, 2), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((58232073427577196457 : Rat) / 2105883502957662848) [(1, 2), (7, 1), (11, 1), (12, 2), (16, 1)],
  term ((58232073427577196457 : Rat) / 2105883502957662848) [(1, 2), (7, 1), (11, 1), (13, 2), (16, 1)],
  term ((-21031901114830755 : Rat) / 745709455721552) [(1, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((21031901114830755 : Rat) / 1491418911443104) [(1, 2), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((21031901114830755 : Rat) / 1491418911443104) [(1, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-32421071444940969933 : Rat) / 1052941751478831424) [(1, 2), (7, 2), (9, 1), (11, 1), (16, 1)],
  term ((-24126516024986757 : Rat) / 1491418911443104) [(1, 2), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-16165627489220962821 : Rat) / 1203362001690093056) [(1, 2), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-70245268919840672953 : Rat) / 2105883502957662848) [(1, 2), (7, 2), (11, 2), (16, 1)],
  term ((-247437128563111349 : Rat) / 11931351291544832) [(1, 2), (7, 2), (15, 2), (16, 1)],
  term ((9184513182051 : Rat) / 7609280160424) [(1, 2), (7, 2), (16, 1)],
  term ((-58232073427577196457 : Rat) / 2105883502957662848) [(1, 2), (7, 3), (11, 1), (16, 1)],
  term ((-21031901114830755 : Rat) / 1491418911443104) [(1, 2), (7, 3), (15, 1), (16, 1)],
  term ((-32421071444940969933 : Rat) / 526470875739415712) [(1, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((32421071444940969933 : Rat) / 1052941751478831424) [(1, 2), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((32421071444940969933 : Rat) / 1052941751478831424) [(1, 2), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-24126516024986757 : Rat) / 745709455721552) [(1, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((24126516024986757 : Rat) / 1491418911443104) [(1, 2), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((24126516024986757 : Rat) / 1491418911443104) [(1, 2), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-16165627489220962821 : Rat) / 601681000845046528) [(1, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((16165627489220962821 : Rat) / 1203362001690093056) [(1, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((16165627489220962821 : Rat) / 1203362001690093056) [(1, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-70245268919840672953 : Rat) / 1052941751478831424) [(1, 2), (11, 2), (12, 1), (16, 1)],
  term ((70245268919840672953 : Rat) / 2105883502957662848) [(1, 2), (11, 2), (12, 2), (16, 1)],
  term ((70245268919840672953 : Rat) / 2105883502957662848) [(1, 2), (11, 2), (13, 2), (16, 1)],
  term ((-247437128563111349 : Rat) / 5965675645772416) [(1, 2), (12, 1), (15, 2), (16, 1)],
  term ((9184513182051 : Rat) / 3804640080212) [(1, 2), (12, 1), (16, 1)],
  term ((247437128563111349 : Rat) / 11931351291544832) [(1, 2), (12, 2), (15, 2), (16, 1)],
  term ((-9184513182051 : Rat) / 7609280160424) [(1, 2), (12, 2), (16, 1)],
  term ((247437128563111349 : Rat) / 11931351291544832) [(1, 2), (13, 2), (15, 2), (16, 1)],
  term ((-9184513182051 : Rat) / 7609280160424) [(1, 2), (13, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 75210125105630816) [(2, 1), (3, 1), (5, 1), (6, 1), (8, 1), (16, 1)],
  term ((-3641703605988597 : Rat) / 18802531276407704) [(2, 1), (3, 1), (5, 1), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((3641703605988597 : Rat) / 37605062552815408) [(2, 1), (3, 1), (5, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-32775332453897373 : Rat) / 75210125105630816) [(2, 1), (3, 1), (5, 1), (6, 1), (10, 1), (14, 1), (16, 1)],
  term ((98325997361692119 : Rat) / 37605062552815408) [(2, 1), (3, 1), (5, 1), (6, 1), (10, 1), (15, 2), (16, 1)],
  term ((-3641703605988597 : Rat) / 18802531276407704) [(2, 1), (3, 1), (5, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 4700632819101926) [(2, 1), (3, 1), (5, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-443566066984674175503 : Rat) / 16847068023661302784) [(2, 1), (3, 1), (5, 1), (6, 1), (14, 1), (16, 1)],
  term ((-149309847845532477 : Rat) / 150420250211261632) [(2, 1), (3, 1), (5, 1), (6, 1), (15, 2), (16, 1)],
  term ((-10925110817965791 : Rat) / 75210125105630816) [(2, 1), (3, 1), (5, 1), (6, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 150420250211261632) [(2, 1), (3, 1), (5, 1), (6, 2), (8, 1), (16, 1)],
  term ((3641703605988597 : Rat) / 37605062552815408) [(2, 1), (3, 1), (5, 1), (6, 2), (9, 1), (13, 1), (16, 1)],
  term ((-3641703605988597 : Rat) / 75210125105630816) [(2, 1), (3, 1), (5, 1), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((32775332453897373 : Rat) / 150420250211261632) [(2, 1), (3, 1), (5, 1), (6, 2), (10, 1), (14, 1), (16, 1)],
  term ((-98325997361692119 : Rat) / 75210125105630816) [(2, 1), (3, 1), (5, 1), (6, 2), (10, 1), (15, 2), (16, 1)],
  term ((3641703605988597 : Rat) / 37605062552815408) [(2, 1), (3, 1), (5, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 9401265638203852) [(2, 1), (3, 1), (5, 1), (6, 2), (14, 1), (15, 2), (16, 1)],
  term ((443566066984674175503 : Rat) / 33694136047322605568) [(2, 1), (3, 1), (5, 1), (6, 2), (14, 1), (16, 1)],
  term ((149309847845532477 : Rat) / 300840500422523264) [(2, 1), (3, 1), (5, 1), (6, 2), (15, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 150420250211261632) [(2, 1), (3, 1), (5, 1), (6, 2), (16, 1)],
  term ((-10925110817965791 : Rat) / 150420250211261632) [(2, 1), (3, 1), (5, 1), (7, 2), (8, 1), (16, 1)],
  term ((3641703605988597 : Rat) / 37605062552815408) [(2, 1), (3, 1), (5, 1), (7, 2), (9, 1), (13, 1), (16, 1)],
  term ((-3641703605988597 : Rat) / 75210125105630816) [(2, 1), (3, 1), (5, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((32775332453897373 : Rat) / 150420250211261632) [(2, 1), (3, 1), (5, 1), (7, 2), (10, 1), (14, 1), (16, 1)],
  term ((-98325997361692119 : Rat) / 75210125105630816) [(2, 1), (3, 1), (5, 1), (7, 2), (10, 1), (15, 2), (16, 1)],
  term ((3641703605988597 : Rat) / 37605062552815408) [(2, 1), (3, 1), (5, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 9401265638203852) [(2, 1), (3, 1), (5, 1), (7, 2), (14, 1), (15, 2), (16, 1)],
  term ((443566066984674175503 : Rat) / 33694136047322605568) [(2, 1), (3, 1), (5, 1), (7, 2), (14, 1), (16, 1)],
  term ((149309847845532477 : Rat) / 300840500422523264) [(2, 1), (3, 1), (5, 1), (7, 2), (15, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 150420250211261632) [(2, 1), (3, 1), (5, 1), (7, 2), (16, 1)],
  term ((-10925110817965791 : Rat) / 75210125105630816) [(2, 1), (3, 1), (5, 1), (8, 1), (12, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 150420250211261632) [(2, 1), (3, 1), (5, 1), (8, 1), (12, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 150420250211261632) [(2, 1), (3, 1), (5, 1), (8, 1), (13, 2), (16, 1)],
  term ((3641703605988597 : Rat) / 18802531276407704) [(2, 1), (3, 1), (5, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-3641703605988597 : Rat) / 37605062552815408) [(2, 1), (3, 1), (5, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3641703605988597 : Rat) / 37605062552815408) [(2, 1), (3, 1), (5, 1), (9, 1), (12, 2), (13, 1), (16, 1)],
  term ((3641703605988597 : Rat) / 75210125105630816) [(2, 1), (3, 1), (5, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((3641703605988597 : Rat) / 75210125105630816) [(2, 1), (3, 1), (5, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-3641703605988597 : Rat) / 37605062552815408) [(2, 1), (3, 1), (5, 1), (9, 1), (13, 3), (16, 1)],
  term ((32775332453897373 : Rat) / 75210125105630816) [(2, 1), (3, 1), (5, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-98325997361692119 : Rat) / 37605062552815408) [(2, 1), (3, 1), (5, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-32775332453897373 : Rat) / 150420250211261632) [(2, 1), (3, 1), (5, 1), (10, 1), (12, 2), (14, 1), (16, 1)],
  term ((98325997361692119 : Rat) / 75210125105630816) [(2, 1), (3, 1), (5, 1), (10, 1), (12, 2), (15, 2), (16, 1)],
  term ((-32775332453897373 : Rat) / 150420250211261632) [(2, 1), (3, 1), (5, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((98325997361692119 : Rat) / 75210125105630816) [(2, 1), (3, 1), (5, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((3641703605988597 : Rat) / 18802531276407704) [(2, 1), (3, 1), (5, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 4700632819101926) [(2, 1), (3, 1), (5, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((443566066984674175503 : Rat) / 16847068023661302784) [(2, 1), (3, 1), (5, 1), (12, 1), (14, 1), (16, 1)],
  term ((149309847845532477 : Rat) / 150420250211261632) [(2, 1), (3, 1), (5, 1), (12, 1), (15, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 75210125105630816) [(2, 1), (3, 1), (5, 1), (12, 1), (16, 1)],
  term ((-3641703605988597 : Rat) / 37605062552815408) [(2, 1), (3, 1), (5, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 9401265638203852) [(2, 1), (3, 1), (5, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-443566066984674175503 : Rat) / 33694136047322605568) [(2, 1), (3, 1), (5, 1), (12, 2), (14, 1), (16, 1)],
  term ((-149309847845532477 : Rat) / 300840500422523264) [(2, 1), (3, 1), (5, 1), (12, 2), (15, 2), (16, 1)],
  term ((-10925110817965791 : Rat) / 150420250211261632) [(2, 1), (3, 1), (5, 1), (12, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 9401265638203852) [(2, 1), (3, 1), (5, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-443566066984674175503 : Rat) / 33694136047322605568) [(2, 1), (3, 1), (5, 1), (13, 2), (14, 1), (16, 1)],
  term ((-149309847845532477 : Rat) / 300840500422523264) [(2, 1), (3, 1), (5, 1), (13, 2), (15, 2), (16, 1)],
  term ((-10925110817965791 : Rat) / 150420250211261632) [(2, 1), (3, 1), (5, 1), (13, 2), (16, 1)],
  term ((-3641703605988597 : Rat) / 37605062552815408) [(2, 1), (3, 1), (5, 1), (13, 3), (15, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 75210125105630816) [(2, 1), (3, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((333796423576923 : Rat) / 852239377967488) [(2, 1), (3, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((121178165322538353 : Rat) / 18802531276407704) [(2, 1), (3, 1), (6, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-121178165322538353 : Rat) / 37605062552815408) [(2, 1), (3, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-111265474525641 : Rat) / 213059844491872) [(2, 1), (3, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((111265474525641 : Rat) / 426119688983744) [(2, 1), (3, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((1090603487902845177 : Rat) / 75210125105630816) [(2, 1), (3, 1), (6, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-3271810463708535531 : Rat) / 37605062552815408) [(2, 1), (3, 1), (6, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1001389270730769 : Rat) / 852239377967488) [(2, 1), (3, 1), (6, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((3004167812192307 : Rat) / 426119688983744) [(2, 1), (3, 1), (6, 1), (10, 1), (15, 3), (16, 1)],
  term ((121178165322538353 : Rat) / 18802531276407704) [(2, 1), (3, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 4700632819101926) [(2, 1), (3, 1), (6, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((2610397670196184524109 : Rat) / 8423534011830651392) [(2, 1), (3, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((4968304778224072473 : Rat) / 150420250211261632) [(2, 1), (3, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((363534495967615059 : Rat) / 75210125105630816) [(2, 1), (3, 1), (6, 1), (11, 1), (16, 1)],
  term ((-111265474525641 : Rat) / 213059844491872) [(2, 1), (3, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((1851043729275743607 : Rat) / 23862702583089664) [(2, 1), (3, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 53264961122968) [(2, 1), (3, 1), (6, 1), (14, 1), (15, 3), (16, 1)],
  term ((-333796423576923 : Rat) / 852239377967488) [(2, 1), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-4561884455551281 : Rat) / 1704478755934976) [(2, 1), (3, 1), (6, 1), (15, 3), (16, 1)],
  term ((363534495967615059 : Rat) / 150420250211261632) [(2, 1), (3, 1), (6, 2), (8, 1), (11, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 1704478755934976) [(2, 1), (3, 1), (6, 2), (8, 1), (15, 1), (16, 1)],
  term ((-121178165322538353 : Rat) / 37605062552815408) [(2, 1), (3, 1), (6, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((121178165322538353 : Rat) / 75210125105630816) [(2, 1), (3, 1), (6, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((111265474525641 : Rat) / 426119688983744) [(2, 1), (3, 1), (6, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-111265474525641 : Rat) / 852239377967488) [(2, 1), (3, 1), (6, 2), (9, 1), (15, 2), (16, 1)],
  term ((-1090603487902845177 : Rat) / 150420250211261632) [(2, 1), (3, 1), (6, 2), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((3271810463708535531 : Rat) / 75210125105630816) [(2, 1), (3, 1), (6, 2), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((1001389270730769 : Rat) / 1704478755934976) [(2, 1), (3, 1), (6, 2), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3004167812192307 : Rat) / 852239377967488) [(2, 1), (3, 1), (6, 2), (10, 1), (15, 3), (16, 1)],
  term ((-121178165322538353 : Rat) / 37605062552815408) [(2, 1), (3, 1), (6, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(2, 1), (3, 1), (6, 2), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2610397670196184524109 : Rat) / 16847068023661302784) [(2, 1), (3, 1), (6, 2), (11, 1), (14, 1), (16, 1)],
  term ((-4968304778224072473 : Rat) / 300840500422523264) [(2, 1), (3, 1), (6, 2), (11, 1), (15, 2), (16, 1)],
  term ((-363534495967615059 : Rat) / 150420250211261632) [(2, 1), (3, 1), (6, 2), (11, 1), (16, 1)],
  term ((111265474525641 : Rat) / 426119688983744) [(2, 1), (3, 1), (6, 2), (13, 1), (15, 2), (16, 1)],
  term ((-1851043729275743607 : Rat) / 47725405166179328) [(2, 1), (3, 1), (6, 2), (14, 1), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(2, 1), (3, 1), (6, 2), (14, 1), (15, 3), (16, 1)],
  term ((333796423576923 : Rat) / 1704478755934976) [(2, 1), (3, 1), (6, 2), (15, 1), (16, 1)],
  term ((4561884455551281 : Rat) / 3408957511869952) [(2, 1), (3, 1), (6, 2), (15, 3), (16, 1)],
  term ((363534495967615059 : Rat) / 150420250211261632) [(2, 1), (3, 1), (7, 2), (8, 1), (11, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 1704478755934976) [(2, 1), (3, 1), (7, 2), (8, 1), (15, 1), (16, 1)],
  term ((-121178165322538353 : Rat) / 37605062552815408) [(2, 1), (3, 1), (7, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((121178165322538353 : Rat) / 75210125105630816) [(2, 1), (3, 1), (7, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((111265474525641 : Rat) / 426119688983744) [(2, 1), (3, 1), (7, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-111265474525641 : Rat) / 852239377967488) [(2, 1), (3, 1), (7, 2), (9, 1), (15, 2), (16, 1)],
  term ((-1090603487902845177 : Rat) / 150420250211261632) [(2, 1), (3, 1), (7, 2), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((3271810463708535531 : Rat) / 75210125105630816) [(2, 1), (3, 1), (7, 2), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((1001389270730769 : Rat) / 1704478755934976) [(2, 1), (3, 1), (7, 2), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3004167812192307 : Rat) / 852239377967488) [(2, 1), (3, 1), (7, 2), (10, 1), (15, 3), (16, 1)],
  term ((-121178165322538353 : Rat) / 37605062552815408) [(2, 1), (3, 1), (7, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(2, 1), (3, 1), (7, 2), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2610397670196184524109 : Rat) / 16847068023661302784) [(2, 1), (3, 1), (7, 2), (11, 1), (14, 1), (16, 1)],
  term ((-4968304778224072473 : Rat) / 300840500422523264) [(2, 1), (3, 1), (7, 2), (11, 1), (15, 2), (16, 1)],
  term ((-363534495967615059 : Rat) / 150420250211261632) [(2, 1), (3, 1), (7, 2), (11, 1), (16, 1)],
  term ((111265474525641 : Rat) / 426119688983744) [(2, 1), (3, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((-1851043729275743607 : Rat) / 47725405166179328) [(2, 1), (3, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(2, 1), (3, 1), (7, 2), (14, 1), (15, 3), (16, 1)],
  term ((333796423576923 : Rat) / 1704478755934976) [(2, 1), (3, 1), (7, 2), (15, 1), (16, 1)],
  term ((4561884455551281 : Rat) / 3408957511869952) [(2, 1), (3, 1), (7, 2), (15, 3), (16, 1)],
  term ((363534495967615059 : Rat) / 75210125105630816) [(2, 1), (3, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 150420250211261632) [(2, 1), (3, 1), (8, 1), (11, 1), (12, 2), (16, 1)],
  term ((-363534495967615059 : Rat) / 150420250211261632) [(2, 1), (3, 1), (8, 1), (11, 1), (13, 2), (16, 1)],
  term ((-333796423576923 : Rat) / 852239377967488) [(2, 1), (3, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 1704478755934976) [(2, 1), (3, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 1704478755934976) [(2, 1), (3, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((-121178165322538353 : Rat) / 18802531276407704) [(2, 1), (3, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((121178165322538353 : Rat) / 37605062552815408) [(2, 1), (3, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((121178165322538353 : Rat) / 37605062552815408) [(2, 1), (3, 1), (9, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-121178165322538353 : Rat) / 75210125105630816) [(2, 1), (3, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-121178165322538353 : Rat) / 75210125105630816) [(2, 1), (3, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((121178165322538353 : Rat) / 37605062552815408) [(2, 1), (3, 1), (9, 1), (11, 1), (13, 3), (16, 1)],
  term ((111265474525641 : Rat) / 213059844491872) [(2, 1), (3, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-111265474525641 : Rat) / 426119688983744) [(2, 1), (3, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-111265474525641 : Rat) / 426119688983744) [(2, 1), (3, 1), (9, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((111265474525641 : Rat) / 852239377967488) [(2, 1), (3, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((111265474525641 : Rat) / 852239377967488) [(2, 1), (3, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((-111265474525641 : Rat) / 426119688983744) [(2, 1), (3, 1), (9, 1), (13, 3), (15, 1), (16, 1)],
  term ((-1090603487902845177 : Rat) / 75210125105630816) [(2, 1), (3, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((3271810463708535531 : Rat) / 37605062552815408) [(2, 1), (3, 1), (10, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((1090603487902845177 : Rat) / 150420250211261632) [(2, 1), (3, 1), (10, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((-3271810463708535531 : Rat) / 75210125105630816) [(2, 1), (3, 1), (10, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((1090603487902845177 : Rat) / 150420250211261632) [(2, 1), (3, 1), (10, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-3271810463708535531 : Rat) / 75210125105630816) [(2, 1), (3, 1), (10, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((1001389270730769 : Rat) / 852239377967488) [(2, 1), (3, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3004167812192307 : Rat) / 426119688983744) [(2, 1), (3, 1), (10, 1), (12, 1), (15, 3), (16, 1)],
  term ((-1001389270730769 : Rat) / 1704478755934976) [(2, 1), (3, 1), (10, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((3004167812192307 : Rat) / 852239377967488) [(2, 1), (3, 1), (10, 1), (12, 2), (15, 3), (16, 1)],
  term ((-1001389270730769 : Rat) / 1704478755934976) [(2, 1), (3, 1), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((3004167812192307 : Rat) / 852239377967488) [(2, 1), (3, 1), (10, 1), (13, 2), (15, 3), (16, 1)],
  term ((-121178165322538353 : Rat) / 18802531276407704) [(2, 1), (3, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 4700632819101926) [(2, 1), (3, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2610397670196184524109 : Rat) / 8423534011830651392) [(2, 1), (3, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-4968304778224072473 : Rat) / 150420250211261632) [(2, 1), (3, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-363534495967615059 : Rat) / 75210125105630816) [(2, 1), (3, 1), (11, 1), (12, 1), (16, 1)],
  term ((121178165322538353 : Rat) / 37605062552815408) [(2, 1), (3, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(2, 1), (3, 1), (11, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((2610397670196184524109 : Rat) / 16847068023661302784) [(2, 1), (3, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((4968304778224072473 : Rat) / 300840500422523264) [(2, 1), (3, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((363534495967615059 : Rat) / 150420250211261632) [(2, 1), (3, 1), (11, 1), (12, 2), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(2, 1), (3, 1), (11, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((2610397670196184524109 : Rat) / 16847068023661302784) [(2, 1), (3, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((4968304778224072473 : Rat) / 300840500422523264) [(2, 1), (3, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((363534495967615059 : Rat) / 150420250211261632) [(2, 1), (3, 1), (11, 1), (13, 2), (16, 1)],
  term ((121178165322538353 : Rat) / 37605062552815408) [(2, 1), (3, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((111265474525641 : Rat) / 213059844491872) [(2, 1), (3, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1851043729275743607 : Rat) / 23862702583089664) [(2, 1), (3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 53264961122968) [(2, 1), (3, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((333796423576923 : Rat) / 852239377967488) [(2, 1), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((4561884455551281 : Rat) / 1704478755934976) [(2, 1), (3, 1), (12, 1), (15, 3), (16, 1)],
  term ((-111265474525641 : Rat) / 426119688983744) [(2, 1), (3, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((1851043729275743607 : Rat) / 47725405166179328) [(2, 1), (3, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(2, 1), (3, 1), (12, 2), (14, 1), (15, 3), (16, 1)],
  term ((-333796423576923 : Rat) / 1704478755934976) [(2, 1), (3, 1), (12, 2), (15, 1), (16, 1)],
  term ((-4561884455551281 : Rat) / 3408957511869952) [(2, 1), (3, 1), (12, 2), (15, 3), (16, 1)],
  term ((1851043729275743607 : Rat) / 47725405166179328) [(2, 1), (3, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(2, 1), (3, 1), (13, 2), (14, 1), (15, 3), (16, 1)],
  term ((-333796423576923 : Rat) / 1704478755934976) [(2, 1), (3, 1), (13, 2), (15, 1), (16, 1)],
  term ((-4561884455551281 : Rat) / 3408957511869952) [(2, 1), (3, 1), (13, 2), (15, 3), (16, 1)],
  term ((-111265474525641 : Rat) / 426119688983744) [(2, 1), (3, 1), (13, 3), (15, 2), (16, 1)],
  term ((-9184513182051 : Rat) / 6658120140371) [(2, 1), (4, 1), (6, 1), (10, 1), (16, 1)],
  term ((9184513182051 : Rat) / 13316240280742) [(2, 1), (4, 1), (6, 1), (14, 1), (16, 1)],
  term ((9184513182051 : Rat) / 26632480561484) [(2, 1), (4, 1), (6, 1), (16, 1)],
  term ((9184513182051 : Rat) / 13316240280742) [(2, 1), (4, 1), (6, 2), (10, 1), (16, 1)],
  term ((-9184513182051 : Rat) / 26632480561484) [(2, 1), (4, 1), (6, 2), (14, 1), (16, 1)],
  term ((-9184513182051 : Rat) / 53264961122968) [(2, 1), (4, 1), (6, 2), (16, 1)],
  term ((9184513182051 : Rat) / 13316240280742) [(2, 1), (4, 1), (7, 2), (10, 1), (16, 1)],
  term ((-9184513182051 : Rat) / 26632480561484) [(2, 1), (4, 1), (7, 2), (14, 1), (16, 1)],
  term ((-9184513182051 : Rat) / 53264961122968) [(2, 1), (4, 1), (7, 2), (16, 1)],
  term ((9184513182051 : Rat) / 6658120140371) [(2, 1), (4, 1), (10, 1), (12, 1), (16, 1)],
  term ((-9184513182051 : Rat) / 13316240280742) [(2, 1), (4, 1), (10, 1), (12, 2), (16, 1)],
  term ((-9184513182051 : Rat) / 13316240280742) [(2, 1), (4, 1), (10, 1), (13, 2), (16, 1)],
  term ((-9184513182051 : Rat) / 13316240280742) [(2, 1), (4, 1), (12, 1), (14, 1), (16, 1)],
  term ((-9184513182051 : Rat) / 26632480561484) [(2, 1), (4, 1), (12, 1), (16, 1)],
  term ((9184513182051 : Rat) / 26632480561484) [(2, 1), (4, 1), (12, 2), (14, 1), (16, 1)],
  term ((9184513182051 : Rat) / 53264961122968) [(2, 1), (4, 1), (12, 2), (16, 1)],
  term ((9184513182051 : Rat) / 26632480561484) [(2, 1), (4, 1), (13, 2), (14, 1), (16, 1)],
  term ((9184513182051 : Rat) / 53264961122968) [(2, 1), (4, 1), (13, 2), (16, 1)],
  term ((-12310172089443454059 : Rat) / 4211767005915325696) [(2, 1), (5, 1), (6, 1), (8, 1), (9, 1), (16, 1)],
  term ((-28211562291031713945 : Rat) / 16847068023661302784) [(2, 1), (5, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((68325355880159966655 : Rat) / 8423534011830651392) [(2, 1), (5, 1), (6, 1), (8, 1), (13, 1), (16, 1)],
  term ((-125435375314695865281 : Rat) / 8423534011830651392) [(2, 1), (5, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((1513755712459811187 : Rat) / 32904429733713482) [(2, 1), (5, 1), (6, 1), (9, 1), (10, 1), (16, 1)],
  term ((33646009336872204087 : Rat) / 8423534011830651392) [(2, 1), (5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-25147896414168381129 : Rat) / 4211767005915325696) [(2, 1), (5, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-625043176708712908569 : Rat) / 67388272094645211136) [(2, 1), (5, 1), (6, 1), (9, 1), (14, 1), (16, 1)],
  term ((29538782016795201141 : Rat) / 1773375581438031872) [(2, 1), (5, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((623168103694072882257 : Rat) / 67388272094645211136) [(2, 1), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((12853999827937751211 : Rat) / 1052941751478831424) [(2, 1), (5, 1), (6, 1), (9, 2), (13, 1), (16, 1)],
  term ((-12853999827937751211 : Rat) / 526470875739415712) [(2, 1), (5, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((-1513755712459811187 : Rat) / 32904429733713482) [(2, 1), (5, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((-46940248868309494107 : Rat) / 8423534011830651392) [(2, 1), (5, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((-12747169384055734437 : Rat) / 8423534011830651392) [(2, 1), (5, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((885947376482735655 : Rat) / 343817714768598016) [(2, 1), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((-51727754171883755605 : Rat) / 8423534011830651392) [(2, 1), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((915776598761011178391 : Rat) / 33694136047322605568) [(2, 1), (5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((34987068918099493085 : Rat) / 4813448006760372224) [(2, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((12310172089443454059 : Rat) / 8423534011830651392) [(2, 1), (5, 1), (6, 2), (8, 1), (9, 1), (16, 1)],
  term ((28211562291031713945 : Rat) / 33694136047322605568) [(2, 1), (5, 1), (6, 2), (8, 1), (11, 1), (16, 1)],
  term ((-68325355880159966655 : Rat) / 16847068023661302784) [(2, 1), (5, 1), (6, 2), (8, 1), (13, 1), (16, 1)],
  term ((125435375314695865281 : Rat) / 16847068023661302784) [(2, 1), (5, 1), (6, 2), (8, 1), (15, 1), (16, 1)],
  term ((-1513755712459811187 : Rat) / 65808859467426964) [(2, 1), (5, 1), (6, 2), (9, 1), (10, 1), (16, 1)],
  term ((-33646009336872204087 : Rat) / 16847068023661302784) [(2, 1), (5, 1), (6, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((25147896414168381129 : Rat) / 8423534011830651392) [(2, 1), (5, 1), (6, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((625043176708712908569 : Rat) / 134776544189290422272) [(2, 1), (5, 1), (6, 2), (9, 1), (14, 1), (16, 1)],
  term ((-29538782016795201141 : Rat) / 3546751162876063744) [(2, 1), (5, 1), (6, 2), (9, 1), (15, 2), (16, 1)],
  term ((-623168103694072882257 : Rat) / 134776544189290422272) [(2, 1), (5, 1), (6, 2), (9, 1), (16, 1)],
  term ((-12853999827937751211 : Rat) / 2105883502957662848) [(2, 1), (5, 1), (6, 2), (9, 2), (13, 1), (16, 1)],
  term ((12853999827937751211 : Rat) / 1052941751478831424) [(2, 1), (5, 1), (6, 2), (9, 2), (15, 1), (16, 1)],
  term ((1513755712459811187 : Rat) / 65808859467426964) [(2, 1), (5, 1), (6, 2), (10, 1), (15, 1), (16, 1)],
  term ((46940248868309494107 : Rat) / 16847068023661302784) [(2, 1), (5, 1), (6, 2), (11, 1), (14, 1), (16, 1)],
  term ((12747169384055734437 : Rat) / 16847068023661302784) [(2, 1), (5, 1), (6, 2), (11, 1), (15, 2), (16, 1)],
  term ((-885947376482735655 : Rat) / 687635429537196032) [(2, 1), (5, 1), (6, 2), (11, 1), (16, 1)],
  term ((51727754171883755605 : Rat) / 16847068023661302784) [(2, 1), (5, 1), (6, 2), (13, 1), (16, 1)],
  term ((-915776598761011178391 : Rat) / 67388272094645211136) [(2, 1), (5, 1), (6, 2), (14, 1), (15, 1), (16, 1)],
  term ((-34987068918099493085 : Rat) / 9626896013520744448) [(2, 1), (5, 1), (6, 2), (15, 1), (16, 1)],
  term ((12310172089443454059 : Rat) / 8423534011830651392) [(2, 1), (5, 1), (7, 2), (8, 1), (9, 1), (16, 1)],
  term ((28211562291031713945 : Rat) / 33694136047322605568) [(2, 1), (5, 1), (7, 2), (8, 1), (11, 1), (16, 1)],
  term ((-68325355880159966655 : Rat) / 16847068023661302784) [(2, 1), (5, 1), (7, 2), (8, 1), (13, 1), (16, 1)],
  term ((125435375314695865281 : Rat) / 16847068023661302784) [(2, 1), (5, 1), (7, 2), (8, 1), (15, 1), (16, 1)],
  term ((-1513755712459811187 : Rat) / 65808859467426964) [(2, 1), (5, 1), (7, 2), (9, 1), (10, 1), (16, 1)],
  term ((-33646009336872204087 : Rat) / 16847068023661302784) [(2, 1), (5, 1), (7, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((25147896414168381129 : Rat) / 8423534011830651392) [(2, 1), (5, 1), (7, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((625043176708712908569 : Rat) / 134776544189290422272) [(2, 1), (5, 1), (7, 2), (9, 1), (14, 1), (16, 1)],
  term ((-29538782016795201141 : Rat) / 3546751162876063744) [(2, 1), (5, 1), (7, 2), (9, 1), (15, 2), (16, 1)],
  term ((-623168103694072882257 : Rat) / 134776544189290422272) [(2, 1), (5, 1), (7, 2), (9, 1), (16, 1)],
  term ((-12853999827937751211 : Rat) / 2105883502957662848) [(2, 1), (5, 1), (7, 2), (9, 2), (13, 1), (16, 1)],
  term ((12853999827937751211 : Rat) / 1052941751478831424) [(2, 1), (5, 1), (7, 2), (9, 2), (15, 1), (16, 1)],
  term ((1513755712459811187 : Rat) / 65808859467426964) [(2, 1), (5, 1), (7, 2), (10, 1), (15, 1), (16, 1)],
  term ((46940248868309494107 : Rat) / 16847068023661302784) [(2, 1), (5, 1), (7, 2), (11, 1), (14, 1), (16, 1)],
  term ((12747169384055734437 : Rat) / 16847068023661302784) [(2, 1), (5, 1), (7, 2), (11, 1), (15, 2), (16, 1)],
  term ((-885947376482735655 : Rat) / 687635429537196032) [(2, 1), (5, 1), (7, 2), (11, 1), (16, 1)],
  term ((51727754171883755605 : Rat) / 16847068023661302784) [(2, 1), (5, 1), (7, 2), (13, 1), (16, 1)],
  term ((-915776598761011178391 : Rat) / 67388272094645211136) [(2, 1), (5, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((-34987068918099493085 : Rat) / 9626896013520744448) [(2, 1), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((12310172089443454059 : Rat) / 4211767005915325696) [(2, 1), (5, 1), (8, 1), (9, 1), (12, 1), (16, 1)],
  term ((-12310172089443454059 : Rat) / 8423534011830651392) [(2, 1), (5, 1), (8, 1), (9, 1), (12, 2), (16, 1)],
  term ((-12310172089443454059 : Rat) / 8423534011830651392) [(2, 1), (5, 1), (8, 1), (9, 1), (13, 2), (16, 1)],
  term ((28211562291031713945 : Rat) / 16847068023661302784) [(2, 1), (5, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((-28211562291031713945 : Rat) / 33694136047322605568) [(2, 1), (5, 1), (8, 1), (11, 1), (12, 2), (16, 1)],
  term ((-28211562291031713945 : Rat) / 33694136047322605568) [(2, 1), (5, 1), (8, 1), (11, 1), (13, 2), (16, 1)],
  term ((-68325355880159966655 : Rat) / 8423534011830651392) [(2, 1), (5, 1), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((125435375314695865281 : Rat) / 8423534011830651392) [(2, 1), (5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((68325355880159966655 : Rat) / 16847068023661302784) [(2, 1), (5, 1), (8, 1), (12, 2), (13, 1), (16, 1)],
  term ((-125435375314695865281 : Rat) / 16847068023661302784) [(2, 1), (5, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-125435375314695865281 : Rat) / 16847068023661302784) [(2, 1), (5, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((68325355880159966655 : Rat) / 16847068023661302784) [(2, 1), (5, 1), (8, 1), (13, 3), (16, 1)],
  term ((-1513755712459811187 : Rat) / 32904429733713482) [(2, 1), (5, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((1513755712459811187 : Rat) / 65808859467426964) [(2, 1), (5, 1), (9, 1), (10, 1), (12, 2), (16, 1)],
  term ((1513755712459811187 : Rat) / 65808859467426964) [(2, 1), (5, 1), (9, 1), (10, 1), (13, 2), (16, 1)],
  term ((-33646009336872204087 : Rat) / 8423534011830651392) [(2, 1), (5, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((25147896414168381129 : Rat) / 4211767005915325696) [(2, 1), (5, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((33646009336872204087 : Rat) / 16847068023661302784) [(2, 1), (5, 1), (9, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-25147896414168381129 : Rat) / 8423534011830651392) [(2, 1), (5, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-25147896414168381129 : Rat) / 8423534011830651392) [(2, 1), (5, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((33646009336872204087 : Rat) / 16847068023661302784) [(2, 1), (5, 1), (9, 1), (11, 1), (13, 3), (16, 1)],
  term ((625043176708712908569 : Rat) / 67388272094645211136) [(2, 1), (5, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-29538782016795201141 : Rat) / 1773375581438031872) [(2, 1), (5, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-623168103694072882257 : Rat) / 67388272094645211136) [(2, 1), (5, 1), (9, 1), (12, 1), (16, 1)],
  term ((-625043176708712908569 : Rat) / 134776544189290422272) [(2, 1), (5, 1), (9, 1), (12, 2), (14, 1), (16, 1)],
  term ((29538782016795201141 : Rat) / 3546751162876063744) [(2, 1), (5, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((623168103694072882257 : Rat) / 134776544189290422272) [(2, 1), (5, 1), (9, 1), (12, 2), (16, 1)],
  term ((-625043176708712908569 : Rat) / 134776544189290422272) [(2, 1), (5, 1), (9, 1), (13, 2), (14, 1), (16, 1)],
  term ((29538782016795201141 : Rat) / 3546751162876063744) [(2, 1), (5, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((623168103694072882257 : Rat) / 134776544189290422272) [(2, 1), (5, 1), (9, 1), (13, 2), (16, 1)],
  term ((-12853999827937751211 : Rat) / 1052941751478831424) [(2, 1), (5, 1), (9, 2), (12, 1), (13, 1), (16, 1)],
  term ((12853999827937751211 : Rat) / 526470875739415712) [(2, 1), (5, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((12853999827937751211 : Rat) / 2105883502957662848) [(2, 1), (5, 1), (9, 2), (12, 2), (13, 1), (16, 1)],
  term ((-12853999827937751211 : Rat) / 1052941751478831424) [(2, 1), (5, 1), (9, 2), (12, 2), (15, 1), (16, 1)],
  term ((-12853999827937751211 : Rat) / 1052941751478831424) [(2, 1), (5, 1), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((12853999827937751211 : Rat) / 2105883502957662848) [(2, 1), (5, 1), (9, 2), (13, 3), (16, 1)],
  term ((1513755712459811187 : Rat) / 32904429733713482) [(2, 1), (5, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1513755712459811187 : Rat) / 65808859467426964) [(2, 1), (5, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1513755712459811187 : Rat) / 65808859467426964) [(2, 1), (5, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((46940248868309494107 : Rat) / 8423534011830651392) [(2, 1), (5, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((12747169384055734437 : Rat) / 8423534011830651392) [(2, 1), (5, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-885947376482735655 : Rat) / 343817714768598016) [(2, 1), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((-46940248868309494107 : Rat) / 16847068023661302784) [(2, 1), (5, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((-12747169384055734437 : Rat) / 16847068023661302784) [(2, 1), (5, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((885947376482735655 : Rat) / 687635429537196032) [(2, 1), (5, 1), (11, 1), (12, 2), (16, 1)],
  term ((-46940248868309494107 : Rat) / 16847068023661302784) [(2, 1), (5, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-12747169384055734437 : Rat) / 16847068023661302784) [(2, 1), (5, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((885947376482735655 : Rat) / 687635429537196032) [(2, 1), (5, 1), (11, 1), (13, 2), (16, 1)],
  term ((51727754171883755605 : Rat) / 8423534011830651392) [(2, 1), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((-915776598761011178391 : Rat) / 33694136047322605568) [(2, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-34987068918099493085 : Rat) / 4813448006760372224) [(2, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-51727754171883755605 : Rat) / 16847068023661302784) [(2, 1), (5, 1), (12, 2), (13, 1), (16, 1)],
  term ((915776598761011178391 : Rat) / 67388272094645211136) [(2, 1), (5, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((34987068918099493085 : Rat) / 9626896013520744448) [(2, 1), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((915776598761011178391 : Rat) / 67388272094645211136) [(2, 1), (5, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((34987068918099493085 : Rat) / 9626896013520744448) [(2, 1), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((-51727754171883755605 : Rat) / 16847068023661302784) [(2, 1), (5, 1), (13, 3), (16, 1)],
  term ((32421071444940969933 : Rat) / 2105883502957662848) [(2, 1), (6, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((24126516024986757 : Rat) / 2982837822886208) [(2, 1), (6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-423685498714386141241 : Rat) / 4211767005915325696) [(2, 1), (6, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((110675000869518264713 : Rat) / 526470875739415712) [(2, 1), (6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((271898372148136966367 : Rat) / 8423534011830651392) [(2, 1), (6, 1), (8, 1), (11, 2), (16, 1)],
  term ((-137004120164657951 : Rat) / 5965675645772416) [(2, 1), (6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((3061504394017 : Rat) / 13316240280742) [(2, 1), (6, 1), (8, 1), (14, 1), (16, 1)],
  term ((260183228420474521 : Rat) / 5965675645772416) [(2, 1), (6, 1), (8, 1), (15, 2), (16, 1)],
  term ((2208972241579435 : Rat) / 1704478755934976) [(2, 1), (6, 1), (8, 1), (16, 1)],
  term ((-9921496117012963552 : Rat) / 16452214866856741) [(2, 1), (6, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-49648418573141559 : Rat) / 372854727860776) [(2, 1), (6, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-41475035726524143 : Rat) / 5965675645772416) [(2, 1), (6, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((4469125592482861723613 : Rat) / 101082408141967816704) [(2, 1), (6, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((85633849091192066295 : Rat) / 16847068023661302784) [(2, 1), (6, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-4794051628287647684855 : Rat) / 33694136047322605568) [(2, 1), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-13502676193222081713 : Rat) / 4211767005915325696) [(2, 1), (6, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-126987861646459264193 : Rat) / 2105883502957662848) [(2, 1), (6, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-105635733207325 : Rat) / 365245447700352) [(2, 1), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((721659626964931961 : Rat) / 47725405166179328) [(2, 1), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3481801724822734025 : Rat) / 143176215498537984) [(2, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-549299257489439991 : Rat) / 23862702583089664) [(2, 1), (6, 1), (9, 1), (15, 3), (16, 1)],
  term ((-41469041122357166957 : Rat) / 526470875739415712) [(2, 1), (6, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((41469041122357166957 : Rat) / 263235437869707856) [(2, 1), (6, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-23088038262747441 : Rat) / 745709455721552) [(2, 1), (6, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((23088038262747441 : Rat) / 372854727860776) [(2, 1), (6, 1), (9, 2), (15, 2), (16, 1)],
  term ((-32421071444940969933 : Rat) / 4211767005915325696) [(2, 1), (6, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-24126516024986757 : Rat) / 5965675645772416) [(2, 1), (6, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((423685498714386141241 : Rat) / 8423534011830651392) [(2, 1), (6, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-110675000869518264713 : Rat) / 1052941751478831424) [(2, 1), (6, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-271898372148136966367 : Rat) / 16847068023661302784) [(2, 1), (6, 2), (8, 1), (11, 2), (16, 1)],
  term ((137004120164657951 : Rat) / 11931351291544832) [(2, 1), (6, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3061504394017 : Rat) / 26632480561484) [(2, 1), (6, 2), (8, 1), (14, 1), (16, 1)],
  term ((-260183228420474521 : Rat) / 11931351291544832) [(2, 1), (6, 2), (8, 1), (15, 2), (16, 1)],
  term ((-2208972241579435 : Rat) / 3408957511869952) [(2, 1), (6, 2), (8, 1), (16, 1)],
  term ((4960748058506481776 : Rat) / 16452214866856741) [(2, 1), (6, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((49648418573141559 : Rat) / 745709455721552) [(2, 1), (6, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((41475035726524143 : Rat) / 11931351291544832) [(2, 1), (6, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4469125592482861723613 : Rat) / 202164816283935633408) [(2, 1), (6, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-85633849091192066295 : Rat) / 33694136047322605568) [(2, 1), (6, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((4794051628287647684855 : Rat) / 67388272094645211136) [(2, 1), (6, 2), (9, 1), (11, 1), (16, 1)],
  term ((13502676193222081713 : Rat) / 8423534011830651392) [(2, 1), (6, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((126987861646459264193 : Rat) / 4211767005915325696) [(2, 1), (6, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((105635733207325 : Rat) / 730490895400704) [(2, 1), (6, 2), (9, 1), (13, 1), (16, 1)],
  term ((-721659626964931961 : Rat) / 95450810332358656) [(2, 1), (6, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((3481801724822734025 : Rat) / 286352430997075968) [(2, 1), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((549299257489439991 : Rat) / 47725405166179328) [(2, 1), (6, 2), (9, 1), (15, 3), (16, 1)],
  term ((41469041122357166957 : Rat) / 1052941751478831424) [(2, 1), (6, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-41469041122357166957 : Rat) / 526470875739415712) [(2, 1), (6, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((23088038262747441 : Rat) / 1491418911443104) [(2, 1), (6, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-23088038262747441 : Rat) / 745709455721552) [(2, 1), (6, 2), (9, 2), (15, 2), (16, 1)],
  term ((-32421071444940969933 : Rat) / 4211767005915325696) [(2, 1), (7, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-24126516024986757 : Rat) / 5965675645772416) [(2, 1), (7, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((423685498714386141241 : Rat) / 8423534011830651392) [(2, 1), (7, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-110675000869518264713 : Rat) / 1052941751478831424) [(2, 1), (7, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-271898372148136966367 : Rat) / 16847068023661302784) [(2, 1), (7, 2), (8, 1), (11, 2), (16, 1)],
  term ((137004120164657951 : Rat) / 11931351291544832) [(2, 1), (7, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3061504394017 : Rat) / 26632480561484) [(2, 1), (7, 2), (8, 1), (14, 1), (16, 1)],
  term ((-260183228420474521 : Rat) / 11931351291544832) [(2, 1), (7, 2), (8, 1), (15, 2), (16, 1)],
  term ((-2208972241579435 : Rat) / 3408957511869952) [(2, 1), (7, 2), (8, 1), (16, 1)],
  term ((4960748058506481776 : Rat) / 16452214866856741) [(2, 1), (7, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((49648418573141559 : Rat) / 745709455721552) [(2, 1), (7, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((41475035726524143 : Rat) / 11931351291544832) [(2, 1), (7, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4469125592482861723613 : Rat) / 202164816283935633408) [(2, 1), (7, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-85633849091192066295 : Rat) / 33694136047322605568) [(2, 1), (7, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((4794051628287647684855 : Rat) / 67388272094645211136) [(2, 1), (7, 2), (9, 1), (11, 1), (16, 1)],
  term ((13502676193222081713 : Rat) / 8423534011830651392) [(2, 1), (7, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((126987861646459264193 : Rat) / 4211767005915325696) [(2, 1), (7, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((105635733207325 : Rat) / 730490895400704) [(2, 1), (7, 2), (9, 1), (13, 1), (16, 1)],
  term ((-721659626964931961 : Rat) / 95450810332358656) [(2, 1), (7, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((3481801724822734025 : Rat) / 286352430997075968) [(2, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((549299257489439991 : Rat) / 47725405166179328) [(2, 1), (7, 2), (9, 1), (15, 3), (16, 1)],
  term ((41469041122357166957 : Rat) / 1052941751478831424) [(2, 1), (7, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-41469041122357166957 : Rat) / 526470875739415712) [(2, 1), (7, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((23088038262747441 : Rat) / 1491418911443104) [(2, 1), (7, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-23088038262747441 : Rat) / 745709455721552) [(2, 1), (7, 2), (9, 2), (15, 2), (16, 1)],
  term ((-32421071444940969933 : Rat) / 2105883502957662848) [(2, 1), (8, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((32421071444940969933 : Rat) / 4211767005915325696) [(2, 1), (8, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((32421071444940969933 : Rat) / 4211767005915325696) [(2, 1), (8, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-24126516024986757 : Rat) / 2982837822886208) [(2, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((24126516024986757 : Rat) / 5965675645772416) [(2, 1), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((24126516024986757 : Rat) / 5965675645772416) [(2, 1), (8, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((423685498714386141241 : Rat) / 4211767005915325696) [(2, 1), (8, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-110675000869518264713 : Rat) / 526470875739415712) [(2, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-423685498714386141241 : Rat) / 8423534011830651392) [(2, 1), (8, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((110675000869518264713 : Rat) / 1052941751478831424) [(2, 1), (8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((110675000869518264713 : Rat) / 1052941751478831424) [(2, 1), (8, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-423685498714386141241 : Rat) / 8423534011830651392) [(2, 1), (8, 1), (11, 1), (13, 3), (16, 1)],
  term ((-271898372148136966367 : Rat) / 8423534011830651392) [(2, 1), (8, 1), (11, 2), (12, 1), (16, 1)],
  term ((271898372148136966367 : Rat) / 16847068023661302784) [(2, 1), (8, 1), (11, 2), (12, 2), (16, 1)],
  term ((271898372148136966367 : Rat) / 16847068023661302784) [(2, 1), (8, 1), (11, 2), (13, 2), (16, 1)],
  term ((137004120164657951 : Rat) / 5965675645772416) [(2, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3061504394017 : Rat) / 13316240280742) [(2, 1), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((-260183228420474521 : Rat) / 5965675645772416) [(2, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-2208972241579435 : Rat) / 1704478755934976) [(2, 1), (8, 1), (12, 1), (16, 1)],
  term ((-137004120164657951 : Rat) / 11931351291544832) [(2, 1), (8, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((3061504394017 : Rat) / 26632480561484) [(2, 1), (8, 1), (12, 2), (14, 1), (16, 1)],
  term ((260183228420474521 : Rat) / 11931351291544832) [(2, 1), (8, 1), (12, 2), (15, 2), (16, 1)],
  term ((2208972241579435 : Rat) / 3408957511869952) [(2, 1), (8, 1), (12, 2), (16, 1)],
  term ((3061504394017 : Rat) / 26632480561484) [(2, 1), (8, 1), (13, 2), (14, 1), (16, 1)],
  term ((260183228420474521 : Rat) / 11931351291544832) [(2, 1), (8, 1), (13, 2), (15, 2), (16, 1)],
  term ((2208972241579435 : Rat) / 3408957511869952) [(2, 1), (8, 1), (13, 2), (16, 1)],
  term ((-137004120164657951 : Rat) / 11931351291544832) [(2, 1), (8, 1), (13, 3), (15, 1), (16, 1)],
  term ((9921496117012963552 : Rat) / 16452214866856741) [(2, 1), (9, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-4960748058506481776 : Rat) / 16452214866856741) [(2, 1), (9, 1), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((-4960748058506481776 : Rat) / 16452214866856741) [(2, 1), (9, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((49648418573141559 : Rat) / 372854727860776) [(2, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-49648418573141559 : Rat) / 745709455721552) [(2, 1), (9, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-49648418573141559 : Rat) / 745709455721552) [(2, 1), (9, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((41475035726524143 : Rat) / 5965675645772416) [(2, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4469125592482861723613 : Rat) / 101082408141967816704) [(2, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-85633849091192066295 : Rat) / 16847068023661302784) [(2, 1), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((4794051628287647684855 : Rat) / 33694136047322605568) [(2, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-41475035726524143 : Rat) / 11931351291544832) [(2, 1), (9, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((4469125592482861723613 : Rat) / 202164816283935633408) [(2, 1), (9, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((85633849091192066295 : Rat) / 33694136047322605568) [(2, 1), (9, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((-4794051628287647684855 : Rat) / 67388272094645211136) [(2, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((4469125592482861723613 : Rat) / 202164816283935633408) [(2, 1), (9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((85633849091192066295 : Rat) / 33694136047322605568) [(2, 1), (9, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-4794051628287647684855 : Rat) / 67388272094645211136) [(2, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-41475035726524143 : Rat) / 11931351291544832) [(2, 1), (9, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((13502676193222081713 : Rat) / 4211767005915325696) [(2, 1), (9, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((126987861646459264193 : Rat) / 2105883502957662848) [(2, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-13502676193222081713 : Rat) / 8423534011830651392) [(2, 1), (9, 1), (11, 2), (12, 2), (13, 1), (16, 1)],
  term ((-126987861646459264193 : Rat) / 4211767005915325696) [(2, 1), (9, 1), (11, 2), (12, 2), (15, 1), (16, 1)],
  term ((-126987861646459264193 : Rat) / 4211767005915325696) [(2, 1), (9, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((-13502676193222081713 : Rat) / 8423534011830651392) [(2, 1), (9, 1), (11, 2), (13, 3), (16, 1)],
  term ((105635733207325 : Rat) / 365245447700352) [(2, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-721659626964931961 : Rat) / 47725405166179328) [(2, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((3481801724822734025 : Rat) / 143176215498537984) [(2, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((549299257489439991 : Rat) / 23862702583089664) [(2, 1), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((-105635733207325 : Rat) / 730490895400704) [(2, 1), (9, 1), (12, 2), (13, 1), (16, 1)],
  term ((721659626964931961 : Rat) / 95450810332358656) [(2, 1), (9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-3481801724822734025 : Rat) / 286352430997075968) [(2, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-549299257489439991 : Rat) / 47725405166179328) [(2, 1), (9, 1), (12, 2), (15, 3), (16, 1)],
  term ((721659626964931961 : Rat) / 95450810332358656) [(2, 1), (9, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-3481801724822734025 : Rat) / 286352430997075968) [(2, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-549299257489439991 : Rat) / 47725405166179328) [(2, 1), (9, 1), (13, 2), (15, 3), (16, 1)],
  term ((-105635733207325 : Rat) / 730490895400704) [(2, 1), (9, 1), (13, 3), (16, 1)],
  term ((41469041122357166957 : Rat) / 526470875739415712) [(2, 1), (9, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-41469041122357166957 : Rat) / 263235437869707856) [(2, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-41469041122357166957 : Rat) / 1052941751478831424) [(2, 1), (9, 2), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((41469041122357166957 : Rat) / 526470875739415712) [(2, 1), (9, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((41469041122357166957 : Rat) / 526470875739415712) [(2, 1), (9, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-41469041122357166957 : Rat) / 1052941751478831424) [(2, 1), (9, 2), (11, 1), (13, 3), (16, 1)],
  term ((23088038262747441 : Rat) / 745709455721552) [(2, 1), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-23088038262747441 : Rat) / 372854727860776) [(2, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((-23088038262747441 : Rat) / 1491418911443104) [(2, 1), (9, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((23088038262747441 : Rat) / 745709455721552) [(2, 1), (9, 2), (12, 2), (15, 2), (16, 1)],
  term ((23088038262747441 : Rat) / 745709455721552) [(2, 1), (9, 2), (13, 2), (15, 2), (16, 1)],
  term ((-23088038262747441 : Rat) / 1491418911443104) [(2, 1), (9, 2), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 4, terms 200 through 299. -/
theorem rs_R010_ueqv_R010NYY_block_04_0200_0299_valid :
    checkProductSumEq rs_R010_ueqv_R010NYY_partials_04_0200_0299
      rs_R010_ueqv_R010NYY_block_04_0200_0299 = true := by
  native_decide

end R010UeqvR010NYYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
