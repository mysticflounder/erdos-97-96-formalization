/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R003:u=v:R003YY, term block 8:200-287

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R003UeqvR003YYTermShards

/-- Generator polynomial 8 for relaxed split surplus certificate `R003:u=v:R003YY`. -/
def rs_R003_ueqv_R003YY_generator_08_0200_0287 : Poly :=
[
  term (2 : Rat) [(0, 1), (6, 1)],
  term (2 : Rat) [(1, 1), (7, 1)],
  term (-1 : Rat) [(6, 2)],
  term (-1 : Rat) [(7, 2)]
]

/-- Coefficient term 200 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003YY_coefficient_08_0200 : Poly :=
[
  term ((-576 : Rat) / 35) [(3, 3), (11, 1), (16, 1)]
]

/-- Partial product 200 for generator 8. -/
def rs_R003_ueqv_R003YY_partial_08_0200 : Poly :=
[
  term ((-1152 : Rat) / 35) [(0, 1), (3, 3), (6, 1), (11, 1), (16, 1)],
  term ((-1152 : Rat) / 35) [(1, 1), (3, 3), (7, 1), (11, 1), (16, 1)],
  term ((576 : Rat) / 35) [(3, 3), (6, 2), (11, 1), (16, 1)],
  term ((576 : Rat) / 35) [(3, 3), (7, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 8. -/
theorem rs_R003_ueqv_R003YY_partial_08_0200_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_08_0200
        rs_R003_ueqv_R003YY_generator_08_0200_0287 =
      rs_R003_ueqv_R003YY_partial_08_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003YY_coefficient_08_0201 : Poly :=
[
  term ((108 : Rat) / 5) [(3, 3), (15, 1)]
]

/-- Partial product 201 for generator 8. -/
def rs_R003_ueqv_R003YY_partial_08_0201 : Poly :=
[
  term ((216 : Rat) / 5) [(0, 1), (3, 3), (6, 1), (15, 1)],
  term ((216 : Rat) / 5) [(1, 1), (3, 3), (7, 1), (15, 1)],
  term ((-108 : Rat) / 5) [(3, 3), (6, 2), (15, 1)],
  term ((-108 : Rat) / 5) [(3, 3), (7, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 8. -/
theorem rs_R003_ueqv_R003YY_partial_08_0201_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_08_0201
        rs_R003_ueqv_R003YY_generator_08_0200_0287 =
      rs_R003_ueqv_R003YY_partial_08_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003YY_coefficient_08_0202 : Poly :=
[
  term ((-12 : Rat) / 5) [(3, 3), (15, 1), (16, 1)]
]

/-- Partial product 202 for generator 8. -/
def rs_R003_ueqv_R003YY_partial_08_0202 : Poly :=
[
  term ((-24 : Rat) / 5) [(0, 1), (3, 3), (6, 1), (15, 1), (16, 1)],
  term ((-24 : Rat) / 5) [(1, 1), (3, 3), (7, 1), (15, 1), (16, 1)],
  term ((12 : Rat) / 5) [(3, 3), (6, 2), (15, 1), (16, 1)],
  term ((12 : Rat) / 5) [(3, 3), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 8. -/
theorem rs_R003_ueqv_R003YY_partial_08_0202_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_08_0202
        rs_R003_ueqv_R003YY_generator_08_0200_0287 =
      rs_R003_ueqv_R003YY_partial_08_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003YY_coefficient_08_0203 : Poly :=
[
  term ((-110592 : Rat) / 7625) [(4, 1), (5, 1), (9, 1), (11, 1), (13, 1)]
]

/-- Partial product 203 for generator 8. -/
def rs_R003_ueqv_R003YY_partial_08_0203 : Poly :=
[
  term ((-221184 : Rat) / 7625) [(0, 1), (4, 1), (5, 1), (6, 1), (9, 1), (11, 1), (13, 1)],
  term ((-221184 : Rat) / 7625) [(1, 1), (4, 1), (5, 1), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((110592 : Rat) / 7625) [(4, 1), (5, 1), (6, 2), (9, 1), (11, 1), (13, 1)],
  term ((110592 : Rat) / 7625) [(4, 1), (5, 1), (7, 2), (9, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 8. -/
theorem rs_R003_ueqv_R003YY_partial_08_0203_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_08_0203
        rs_R003_ueqv_R003YY_generator_08_0200_0287 =
      rs_R003_ueqv_R003YY_partial_08_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003YY_coefficient_08_0204 : Poly :=
[
  term ((-331776 : Rat) / 7625) [(4, 1), (5, 1), (9, 1), (13, 2)]
]

/-- Partial product 204 for generator 8. -/
def rs_R003_ueqv_R003YY_partial_08_0204 : Poly :=
[
  term ((-663552 : Rat) / 7625) [(0, 1), (4, 1), (5, 1), (6, 1), (9, 1), (13, 2)],
  term ((-663552 : Rat) / 7625) [(1, 1), (4, 1), (5, 1), (7, 1), (9, 1), (13, 2)],
  term ((331776 : Rat) / 7625) [(4, 1), (5, 1), (6, 2), (9, 1), (13, 2)],
  term ((331776 : Rat) / 7625) [(4, 1), (5, 1), (7, 2), (9, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 8. -/
theorem rs_R003_ueqv_R003YY_partial_08_0204_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_08_0204
        rs_R003_ueqv_R003YY_generator_08_0200_0287 =
      rs_R003_ueqv_R003YY_partial_08_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003YY_coefficient_08_0205 : Poly :=
[
  term ((239616 : Rat) / 7625) [(4, 1), (5, 1), (9, 2), (13, 1)]
]

/-- Partial product 205 for generator 8. -/
def rs_R003_ueqv_R003YY_partial_08_0205 : Poly :=
[
  term ((479232 : Rat) / 7625) [(0, 1), (4, 1), (5, 1), (6, 1), (9, 2), (13, 1)],
  term ((479232 : Rat) / 7625) [(1, 1), (4, 1), (5, 1), (7, 1), (9, 2), (13, 1)],
  term ((-239616 : Rat) / 7625) [(4, 1), (5, 1), (6, 2), (9, 2), (13, 1)],
  term ((-239616 : Rat) / 7625) [(4, 1), (5, 1), (7, 2), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 8. -/
theorem rs_R003_ueqv_R003YY_partial_08_0205_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_08_0205
        rs_R003_ueqv_R003YY_generator_08_0200_0287 =
      rs_R003_ueqv_R003YY_partial_08_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003YY_coefficient_08_0206 : Poly :=
[
  term ((73728 : Rat) / 7625) [(4, 1), (5, 1), (12, 1), (13, 1)]
]

/-- Partial product 206 for generator 8. -/
def rs_R003_ueqv_R003YY_partial_08_0206 : Poly :=
[
  term ((147456 : Rat) / 7625) [(0, 1), (4, 1), (5, 1), (6, 1), (12, 1), (13, 1)],
  term ((147456 : Rat) / 7625) [(1, 1), (4, 1), (5, 1), (7, 1), (12, 1), (13, 1)],
  term ((-73728 : Rat) / 7625) [(4, 1), (5, 1), (6, 2), (12, 1), (13, 1)],
  term ((-73728 : Rat) / 7625) [(4, 1), (5, 1), (7, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 8. -/
theorem rs_R003_ueqv_R003YY_partial_08_0206_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_08_0206
        rs_R003_ueqv_R003YY_generator_08_0200_0287 =
      rs_R003_ueqv_R003YY_partial_08_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003YY_coefficient_08_0207 : Poly :=
[
  term ((-36864 : Rat) / 7625) [(4, 1), (5, 1), (13, 1)]
]

/-- Partial product 207 for generator 8. -/
def rs_R003_ueqv_R003YY_partial_08_0207 : Poly :=
[
  term ((-73728 : Rat) / 7625) [(0, 1), (4, 1), (5, 1), (6, 1), (13, 1)],
  term ((-73728 : Rat) / 7625) [(1, 1), (4, 1), (5, 1), (7, 1), (13, 1)],
  term ((36864 : Rat) / 7625) [(4, 1), (5, 1), (6, 2), (13, 1)],
  term ((36864 : Rat) / 7625) [(4, 1), (5, 1), (7, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 8. -/
theorem rs_R003_ueqv_R003YY_partial_08_0207_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_08_0207
        rs_R003_ueqv_R003YY_generator_08_0200_0287 =
      rs_R003_ueqv_R003YY_partial_08_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003YY_coefficient_08_0208 : Poly :=
[
  term ((-36864 : Rat) / 7625) [(4, 1), (7, 1), (12, 1), (13, 1)]
]

/-- Partial product 208 for generator 8. -/
def rs_R003_ueqv_R003YY_partial_08_0208 : Poly :=
[
  term ((-73728 : Rat) / 7625) [(0, 1), (4, 1), (6, 1), (7, 1), (12, 1), (13, 1)],
  term ((-73728 : Rat) / 7625) [(1, 1), (4, 1), (7, 2), (12, 1), (13, 1)],
  term ((36864 : Rat) / 7625) [(4, 1), (6, 2), (7, 1), (12, 1), (13, 1)],
  term ((36864 : Rat) / 7625) [(4, 1), (7, 3), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 8. -/
theorem rs_R003_ueqv_R003YY_partial_08_0208_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_08_0208
        rs_R003_ueqv_R003YY_generator_08_0200_0287 =
      rs_R003_ueqv_R003YY_partial_08_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003YY_coefficient_08_0209 : Poly :=
[
  term ((18432 : Rat) / 7625) [(4, 1), (7, 1), (13, 1)]
]

/-- Partial product 209 for generator 8. -/
def rs_R003_ueqv_R003YY_partial_08_0209 : Poly :=
[
  term ((36864 : Rat) / 7625) [(0, 1), (4, 1), (6, 1), (7, 1), (13, 1)],
  term ((36864 : Rat) / 7625) [(1, 1), (4, 1), (7, 2), (13, 1)],
  term ((-18432 : Rat) / 7625) [(4, 1), (6, 2), (7, 1), (13, 1)],
  term ((-18432 : Rat) / 7625) [(4, 1), (7, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 8. -/
theorem rs_R003_ueqv_R003YY_partial_08_0209_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_08_0209
        rs_R003_ueqv_R003YY_generator_08_0200_0287 =
      rs_R003_ueqv_R003YY_partial_08_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003YY_coefficient_08_0210 : Poly :=
[
  term ((367104 : Rat) / 53375) [(4, 1), (9, 1), (10, 1), (13, 1)]
]

/-- Partial product 210 for generator 8. -/
def rs_R003_ueqv_R003YY_partial_08_0210 : Poly :=
[
  term ((734208 : Rat) / 53375) [(0, 1), (4, 1), (6, 1), (9, 1), (10, 1), (13, 1)],
  term ((734208 : Rat) / 53375) [(1, 1), (4, 1), (7, 1), (9, 1), (10, 1), (13, 1)],
  term ((-367104 : Rat) / 53375) [(4, 1), (6, 2), (9, 1), (10, 1), (13, 1)],
  term ((-367104 : Rat) / 53375) [(4, 1), (7, 2), (9, 1), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 8. -/
theorem rs_R003_ueqv_R003YY_partial_08_0210_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_08_0210
        rs_R003_ueqv_R003YY_generator_08_0200_0287 =
      rs_R003_ueqv_R003YY_partial_08_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003YY_coefficient_08_0211 : Poly :=
[
  term ((-12672 : Rat) / 427) [(4, 1), (9, 1), (11, 1), (13, 2)]
]

/-- Partial product 211 for generator 8. -/
def rs_R003_ueqv_R003YY_partial_08_0211 : Poly :=
[
  term ((-25344 : Rat) / 427) [(0, 1), (4, 1), (6, 1), (9, 1), (11, 1), (13, 2)],
  term ((-25344 : Rat) / 427) [(1, 1), (4, 1), (7, 1), (9, 1), (11, 1), (13, 2)],
  term ((12672 : Rat) / 427) [(4, 1), (6, 2), (9, 1), (11, 1), (13, 2)],
  term ((12672 : Rat) / 427) [(4, 1), (7, 2), (9, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 8. -/
theorem rs_R003_ueqv_R003YY_partial_08_0211_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_08_0211
        rs_R003_ueqv_R003YY_generator_08_0200_0287 =
      rs_R003_ueqv_R003YY_partial_08_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003YY_coefficient_08_0212 : Poly :=
[
  term ((-108096 : Rat) / 10675) [(4, 1), (9, 1), (11, 2), (13, 1)]
]

/-- Partial product 212 for generator 8. -/
def rs_R003_ueqv_R003YY_partial_08_0212 : Poly :=
[
  term ((-216192 : Rat) / 10675) [(0, 1), (4, 1), (6, 1), (9, 1), (11, 2), (13, 1)],
  term ((-216192 : Rat) / 10675) [(1, 1), (4, 1), (7, 1), (9, 1), (11, 2), (13, 1)],
  term ((108096 : Rat) / 10675) [(4, 1), (6, 2), (9, 1), (11, 2), (13, 1)],
  term ((108096 : Rat) / 10675) [(4, 1), (7, 2), (9, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 8. -/
theorem rs_R003_ueqv_R003YY_partial_08_0212_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_08_0212
        rs_R003_ueqv_R003YY_generator_08_0200_0287 =
      rs_R003_ueqv_R003YY_partial_08_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003YY_coefficient_08_0213 : Poly :=
[
  term ((151968 : Rat) / 53375) [(4, 1), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 213 for generator 8. -/
def rs_R003_ueqv_R003YY_partial_08_0213 : Poly :=
[
  term ((303936 : Rat) / 53375) [(0, 1), (4, 1), (6, 1), (9, 1), (12, 1), (13, 1)],
  term ((303936 : Rat) / 53375) [(1, 1), (4, 1), (7, 1), (9, 1), (12, 1), (13, 1)],
  term ((-151968 : Rat) / 53375) [(4, 1), (6, 2), (9, 1), (12, 1), (13, 1)],
  term ((-151968 : Rat) / 53375) [(4, 1), (7, 2), (9, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 8. -/
theorem rs_R003_ueqv_R003YY_partial_08_0213_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_08_0213
        rs_R003_ueqv_R003YY_generator_08_0200_0287 =
      rs_R003_ueqv_R003YY_partial_08_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003YY_coefficient_08_0214 : Poly :=
[
  term ((-292608 : Rat) / 53375) [(4, 1), (9, 1), (13, 1)]
]

/-- Partial product 214 for generator 8. -/
def rs_R003_ueqv_R003YY_partial_08_0214 : Poly :=
[
  term ((-585216 : Rat) / 53375) [(0, 1), (4, 1), (6, 1), (9, 1), (13, 1)],
  term ((-585216 : Rat) / 53375) [(1, 1), (4, 1), (7, 1), (9, 1), (13, 1)],
  term ((292608 : Rat) / 53375) [(4, 1), (6, 2), (9, 1), (13, 1)],
  term ((292608 : Rat) / 53375) [(4, 1), (7, 2), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 8. -/
theorem rs_R003_ueqv_R003YY_partial_08_0214_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_08_0214
        rs_R003_ueqv_R003YY_generator_08_0200_0287 =
      rs_R003_ueqv_R003YY_partial_08_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003YY_coefficient_08_0215 : Poly :=
[
  term ((232128 : Rat) / 10675) [(4, 1), (9, 2), (11, 1), (13, 1)]
]

/-- Partial product 215 for generator 8. -/
def rs_R003_ueqv_R003YY_partial_08_0215 : Poly :=
[
  term ((464256 : Rat) / 10675) [(0, 1), (4, 1), (6, 1), (9, 2), (11, 1), (13, 1)],
  term ((464256 : Rat) / 10675) [(1, 1), (4, 1), (7, 1), (9, 2), (11, 1), (13, 1)],
  term ((-232128 : Rat) / 10675) [(4, 1), (6, 2), (9, 2), (11, 1), (13, 1)],
  term ((-232128 : Rat) / 10675) [(4, 1), (7, 2), (9, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 8. -/
theorem rs_R003_ueqv_R003YY_partial_08_0215_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_08_0215
        rs_R003_ueqv_R003YY_generator_08_0200_0287 =
      rs_R003_ueqv_R003YY_partial_08_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003YY_coefficient_08_0216 : Poly :=
[
  term ((-99888 : Rat) / 53375) [(4, 1), (11, 1), (13, 1)]
]

/-- Partial product 216 for generator 8. -/
def rs_R003_ueqv_R003YY_partial_08_0216 : Poly :=
[
  term ((-199776 : Rat) / 53375) [(0, 1), (4, 1), (6, 1), (11, 1), (13, 1)],
  term ((-199776 : Rat) / 53375) [(1, 1), (4, 1), (7, 1), (11, 1), (13, 1)],
  term ((99888 : Rat) / 53375) [(4, 1), (6, 2), (11, 1), (13, 1)],
  term ((99888 : Rat) / 53375) [(4, 1), (7, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 8. -/
theorem rs_R003_ueqv_R003YY_partial_08_0216_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_08_0216
        rs_R003_ueqv_R003YY_generator_08_0200_0287 =
      rs_R003_ueqv_R003YY_partial_08_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003YY_coefficient_08_0217 : Poly :=
[
  term ((-52656 : Rat) / 10675) [(4, 1), (13, 2)]
]

/-- Partial product 217 for generator 8. -/
def rs_R003_ueqv_R003YY_partial_08_0217 : Poly :=
[
  term ((-105312 : Rat) / 10675) [(0, 1), (4, 1), (6, 1), (13, 2)],
  term ((-105312 : Rat) / 10675) [(1, 1), (4, 1), (7, 1), (13, 2)],
  term ((52656 : Rat) / 10675) [(4, 1), (6, 2), (13, 2)],
  term ((52656 : Rat) / 10675) [(4, 1), (7, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 8. -/
theorem rs_R003_ueqv_R003YY_partial_08_0217_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_08_0217
        rs_R003_ueqv_R003YY_generator_08_0200_0287 =
      rs_R003_ueqv_R003YY_partial_08_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003YY_coefficient_08_0218 : Poly :=
[
  term ((331776 : Rat) / 7625) [(4, 2), (9, 1), (11, 1), (13, 2)]
]

/-- Partial product 218 for generator 8. -/
def rs_R003_ueqv_R003YY_partial_08_0218 : Poly :=
[
  term ((663552 : Rat) / 7625) [(0, 1), (4, 2), (6, 1), (9, 1), (11, 1), (13, 2)],
  term ((663552 : Rat) / 7625) [(1, 1), (4, 2), (7, 1), (9, 1), (11, 1), (13, 2)],
  term ((-331776 : Rat) / 7625) [(4, 2), (6, 2), (9, 1), (11, 1), (13, 2)],
  term ((-331776 : Rat) / 7625) [(4, 2), (7, 2), (9, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 8. -/
theorem rs_R003_ueqv_R003YY_partial_08_0218_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_08_0218
        rs_R003_ueqv_R003YY_generator_08_0200_0287 =
      rs_R003_ueqv_R003YY_partial_08_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003YY_coefficient_08_0219 : Poly :=
[
  term ((55296 : Rat) / 7625) [(4, 2), (9, 1), (11, 2), (13, 1)]
]

/-- Partial product 219 for generator 8. -/
def rs_R003_ueqv_R003YY_partial_08_0219 : Poly :=
[
  term ((110592 : Rat) / 7625) [(0, 1), (4, 2), (6, 1), (9, 1), (11, 2), (13, 1)],
  term ((110592 : Rat) / 7625) [(1, 1), (4, 2), (7, 1), (9, 1), (11, 2), (13, 1)],
  term ((-55296 : Rat) / 7625) [(4, 2), (6, 2), (9, 1), (11, 2), (13, 1)],
  term ((-55296 : Rat) / 7625) [(4, 2), (7, 2), (9, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 8. -/
theorem rs_R003_ueqv_R003YY_partial_08_0219_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_08_0219
        rs_R003_ueqv_R003YY_generator_08_0200_0287 =
      rs_R003_ueqv_R003YY_partial_08_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003YY_coefficient_08_0220 : Poly :=
[
  term ((-101376 : Rat) / 7625) [(4, 2), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 220 for generator 8. -/
def rs_R003_ueqv_R003YY_partial_08_0220 : Poly :=
[
  term ((-202752 : Rat) / 7625) [(0, 1), (4, 2), (6, 1), (9, 1), (12, 1), (13, 1)],
  term ((-202752 : Rat) / 7625) [(1, 1), (4, 2), (7, 1), (9, 1), (12, 1), (13, 1)],
  term ((101376 : Rat) / 7625) [(4, 2), (6, 2), (9, 1), (12, 1), (13, 1)],
  term ((101376 : Rat) / 7625) [(4, 2), (7, 2), (9, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 8. -/
theorem rs_R003_ueqv_R003YY_partial_08_0220_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_08_0220
        rs_R003_ueqv_R003YY_generator_08_0200_0287 =
      rs_R003_ueqv_R003YY_partial_08_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003YY_coefficient_08_0221 : Poly :=
[
  term ((73728 : Rat) / 7625) [(4, 2), (9, 1), (13, 1)]
]

/-- Partial product 221 for generator 8. -/
def rs_R003_ueqv_R003YY_partial_08_0221 : Poly :=
[
  term ((147456 : Rat) / 7625) [(0, 1), (4, 2), (6, 1), (9, 1), (13, 1)],
  term ((147456 : Rat) / 7625) [(1, 1), (4, 2), (7, 1), (9, 1), (13, 1)],
  term ((-73728 : Rat) / 7625) [(4, 2), (6, 2), (9, 1), (13, 1)],
  term ((-73728 : Rat) / 7625) [(4, 2), (7, 2), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 8. -/
theorem rs_R003_ueqv_R003YY_partial_08_0221_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_08_0221
        rs_R003_ueqv_R003YY_generator_08_0200_0287 =
      rs_R003_ueqv_R003YY_partial_08_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003YY_coefficient_08_0222 : Poly :=
[
  term ((-165888 : Rat) / 7625) [(4, 2), (9, 2), (11, 1), (13, 1)]
]

/-- Partial product 222 for generator 8. -/
def rs_R003_ueqv_R003YY_partial_08_0222 : Poly :=
[
  term ((-331776 : Rat) / 7625) [(0, 1), (4, 2), (6, 1), (9, 2), (11, 1), (13, 1)],
  term ((-331776 : Rat) / 7625) [(1, 1), (4, 2), (7, 1), (9, 2), (11, 1), (13, 1)],
  term ((165888 : Rat) / 7625) [(4, 2), (6, 2), (9, 2), (11, 1), (13, 1)],
  term ((165888 : Rat) / 7625) [(4, 2), (7, 2), (9, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 8. -/
theorem rs_R003_ueqv_R003YY_partial_08_0222_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_08_0222
        rs_R003_ueqv_R003YY_generator_08_0200_0287 =
      rs_R003_ueqv_R003YY_partial_08_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003YY_coefficient_08_0223 : Poly :=
[
  term ((-13824 : Rat) / 7625) [(4, 2), (11, 1), (13, 1)]
]

/-- Partial product 223 for generator 8. -/
def rs_R003_ueqv_R003YY_partial_08_0223 : Poly :=
[
  term ((-27648 : Rat) / 7625) [(0, 1), (4, 2), (6, 1), (11, 1), (13, 1)],
  term ((-27648 : Rat) / 7625) [(1, 1), (4, 2), (7, 1), (11, 1), (13, 1)],
  term ((13824 : Rat) / 7625) [(4, 2), (6, 2), (11, 1), (13, 1)],
  term ((13824 : Rat) / 7625) [(4, 2), (7, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 8. -/
theorem rs_R003_ueqv_R003YY_partial_08_0223_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_08_0223
        rs_R003_ueqv_R003YY_generator_08_0200_0287 =
      rs_R003_ueqv_R003YY_partial_08_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003YY_coefficient_08_0224 : Poly :=
[
  term ((78336 : Rat) / 7625) [(4, 2), (13, 2)]
]

/-- Partial product 224 for generator 8. -/
def rs_R003_ueqv_R003YY_partial_08_0224 : Poly :=
[
  term ((156672 : Rat) / 7625) [(0, 1), (4, 2), (6, 1), (13, 2)],
  term ((156672 : Rat) / 7625) [(1, 1), (4, 2), (7, 1), (13, 2)],
  term ((-78336 : Rat) / 7625) [(4, 2), (6, 2), (13, 2)],
  term ((-78336 : Rat) / 7625) [(4, 2), (7, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 8. -/
theorem rs_R003_ueqv_R003YY_partial_08_0224_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_08_0224
        rs_R003_ueqv_R003YY_generator_08_0200_0287 =
      rs_R003_ueqv_R003YY_partial_08_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003YY_coefficient_08_0225 : Poly :=
[
  term ((21888 : Rat) / 7625) [(5, 1), (9, 1), (11, 1), (13, 1)]
]

/-- Partial product 225 for generator 8. -/
def rs_R003_ueqv_R003YY_partial_08_0225 : Poly :=
[
  term ((43776 : Rat) / 7625) [(0, 1), (5, 1), (6, 1), (9, 1), (11, 1), (13, 1)],
  term ((43776 : Rat) / 7625) [(1, 1), (5, 1), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-21888 : Rat) / 7625) [(5, 1), (6, 2), (9, 1), (11, 1), (13, 1)],
  term ((-21888 : Rat) / 7625) [(5, 1), (7, 2), (9, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 8. -/
theorem rs_R003_ueqv_R003YY_partial_08_0225_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_08_0225
        rs_R003_ueqv_R003YY_generator_08_0200_0287 =
      rs_R003_ueqv_R003YY_partial_08_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003YY_coefficient_08_0226 : Poly :=
[
  term ((24 : Rat) / 5) [(5, 1), (9, 1), (12, 1)]
]

/-- Partial product 226 for generator 8. -/
def rs_R003_ueqv_R003YY_partial_08_0226 : Poly :=
[
  term ((48 : Rat) / 5) [(0, 1), (5, 1), (6, 1), (9, 1), (12, 1)],
  term ((48 : Rat) / 5) [(1, 1), (5, 1), (7, 1), (9, 1), (12, 1)],
  term ((-24 : Rat) / 5) [(5, 1), (6, 2), (9, 1), (12, 1)],
  term ((-24 : Rat) / 5) [(5, 1), (7, 2), (9, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 8. -/
theorem rs_R003_ueqv_R003YY_partial_08_0226_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_08_0226
        rs_R003_ueqv_R003YY_generator_08_0200_0287 =
      rs_R003_ueqv_R003YY_partial_08_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003YY_coefficient_08_0227 : Poly :=
[
  term ((-24 : Rat) / 5) [(5, 1), (9, 1), (12, 1), (14, 1)]
]

/-- Partial product 227 for generator 8. -/
def rs_R003_ueqv_R003YY_partial_08_0227 : Poly :=
[
  term ((-48 : Rat) / 5) [(0, 1), (5, 1), (6, 1), (9, 1), (12, 1), (14, 1)],
  term ((-48 : Rat) / 5) [(1, 1), (5, 1), (7, 1), (9, 1), (12, 1), (14, 1)],
  term ((24 : Rat) / 5) [(5, 1), (6, 2), (9, 1), (12, 1), (14, 1)],
  term ((24 : Rat) / 5) [(5, 1), (7, 2), (9, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 8. -/
theorem rs_R003_ueqv_R003YY_partial_08_0227_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_08_0227
        rs_R003_ueqv_R003YY_generator_08_0200_0287 =
      rs_R003_ueqv_R003YY_partial_08_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003YY_coefficient_08_0228 : Poly :=
[
  term ((65664 : Rat) / 7625) [(5, 1), (9, 1), (13, 2)]
]

/-- Partial product 228 for generator 8. -/
def rs_R003_ueqv_R003YY_partial_08_0228 : Poly :=
[
  term ((131328 : Rat) / 7625) [(0, 1), (5, 1), (6, 1), (9, 1), (13, 2)],
  term ((131328 : Rat) / 7625) [(1, 1), (5, 1), (7, 1), (9, 1), (13, 2)],
  term ((-65664 : Rat) / 7625) [(5, 1), (6, 2), (9, 1), (13, 2)],
  term ((-65664 : Rat) / 7625) [(5, 1), (7, 2), (9, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 8. -/
theorem rs_R003_ueqv_R003YY_partial_08_0228_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_08_0228
        rs_R003_ueqv_R003YY_generator_08_0200_0287 =
      rs_R003_ueqv_R003YY_partial_08_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003YY_coefficient_08_0229 : Poly :=
[
  term ((-47424 : Rat) / 7625) [(5, 1), (9, 2), (13, 1)]
]

/-- Partial product 229 for generator 8. -/
def rs_R003_ueqv_R003YY_partial_08_0229 : Poly :=
[
  term ((-94848 : Rat) / 7625) [(0, 1), (5, 1), (6, 1), (9, 2), (13, 1)],
  term ((-94848 : Rat) / 7625) [(1, 1), (5, 1), (7, 1), (9, 2), (13, 1)],
  term ((47424 : Rat) / 7625) [(5, 1), (6, 2), (9, 2), (13, 1)],
  term ((47424 : Rat) / 7625) [(5, 1), (7, 2), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 8. -/
theorem rs_R003_ueqv_R003YY_partial_08_0229_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_08_0229
        rs_R003_ueqv_R003YY_generator_08_0200_0287 =
      rs_R003_ueqv_R003YY_partial_08_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003YY_coefficient_08_0230 : Poly :=
[
  term ((-54528 : Rat) / 7625) [(5, 1), (12, 1), (13, 1)]
]

/-- Partial product 230 for generator 8. -/
def rs_R003_ueqv_R003YY_partial_08_0230 : Poly :=
[
  term ((-109056 : Rat) / 7625) [(0, 1), (5, 1), (6, 1), (12, 1), (13, 1)],
  term ((-109056 : Rat) / 7625) [(1, 1), (5, 1), (7, 1), (12, 1), (13, 1)],
  term ((54528 : Rat) / 7625) [(5, 1), (6, 2), (12, 1), (13, 1)],
  term ((54528 : Rat) / 7625) [(5, 1), (7, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 8. -/
theorem rs_R003_ueqv_R003YY_partial_08_0230_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_08_0230
        rs_R003_ueqv_R003YY_generator_08_0200_0287 =
      rs_R003_ueqv_R003YY_partial_08_0230 := by
  native_decide

/-- Coefficient term 231 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003YY_coefficient_08_0231 : Poly :=
[
  term ((8964 : Rat) / 7625) [(5, 1), (13, 1)]
]

/-- Partial product 231 for generator 8. -/
def rs_R003_ueqv_R003YY_partial_08_0231 : Poly :=
[
  term ((17928 : Rat) / 7625) [(0, 1), (5, 1), (6, 1), (13, 1)],
  term ((17928 : Rat) / 7625) [(1, 1), (5, 1), (7, 1), (13, 1)],
  term ((-8964 : Rat) / 7625) [(5, 1), (6, 2), (13, 1)],
  term ((-8964 : Rat) / 7625) [(5, 1), (7, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 231 for generator 8. -/
theorem rs_R003_ueqv_R003YY_partial_08_0231_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_08_0231
        rs_R003_ueqv_R003YY_generator_08_0200_0287 =
      rs_R003_ueqv_R003YY_partial_08_0231 := by
  native_decide

/-- Coefficient term 232 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003YY_coefficient_08_0232 : Poly :=
[
  term ((12 : Rat) / 5) [(5, 1), (13, 1), (14, 1)]
]

/-- Partial product 232 for generator 8. -/
def rs_R003_ueqv_R003YY_partial_08_0232 : Poly :=
[
  term ((24 : Rat) / 5) [(0, 1), (5, 1), (6, 1), (13, 1), (14, 1)],
  term ((24 : Rat) / 5) [(1, 1), (5, 1), (7, 1), (13, 1), (14, 1)],
  term ((-12 : Rat) / 5) [(5, 1), (6, 2), (13, 1), (14, 1)],
  term ((-12 : Rat) / 5) [(5, 1), (7, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 232 for generator 8. -/
theorem rs_R003_ueqv_R003YY_partial_08_0232_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_08_0232
        rs_R003_ueqv_R003YY_generator_08_0200_0287 =
      rs_R003_ueqv_R003YY_partial_08_0232 := by
  native_decide

/-- Coefficient term 233 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003YY_coefficient_08_0233 : Poly :=
[
  term ((12 : Rat) / 5) [(7, 1), (9, 1)]
]

/-- Partial product 233 for generator 8. -/
def rs_R003_ueqv_R003YY_partial_08_0233 : Poly :=
[
  term ((24 : Rat) / 5) [(0, 1), (6, 1), (7, 1), (9, 1)],
  term ((24 : Rat) / 5) [(1, 1), (7, 2), (9, 1)],
  term ((-12 : Rat) / 5) [(6, 2), (7, 1), (9, 1)],
  term ((-12 : Rat) / 5) [(7, 3), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 233 for generator 8. -/
theorem rs_R003_ueqv_R003YY_partial_08_0233_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_08_0233
        rs_R003_ueqv_R003YY_generator_08_0200_0287 =
      rs_R003_ueqv_R003YY_partial_08_0233 := by
  native_decide

/-- Coefficient term 234 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003YY_coefficient_08_0234 : Poly :=
[
  term ((-24 : Rat) / 5) [(7, 1), (9, 1), (14, 1)]
]

/-- Partial product 234 for generator 8. -/
def rs_R003_ueqv_R003YY_partial_08_0234 : Poly :=
[
  term ((-48 : Rat) / 5) [(0, 1), (6, 1), (7, 1), (9, 1), (14, 1)],
  term ((-48 : Rat) / 5) [(1, 1), (7, 2), (9, 1), (14, 1)],
  term ((24 : Rat) / 5) [(6, 2), (7, 1), (9, 1), (14, 1)],
  term ((24 : Rat) / 5) [(7, 3), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 234 for generator 8. -/
theorem rs_R003_ueqv_R003YY_partial_08_0234_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_08_0234
        rs_R003_ueqv_R003YY_generator_08_0200_0287 =
      rs_R003_ueqv_R003YY_partial_08_0234 := by
  native_decide

/-- Coefficient term 235 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003YY_coefficient_08_0235 : Poly :=
[
  term ((27264 : Rat) / 7625) [(7, 1), (12, 1), (13, 1)]
]

/-- Partial product 235 for generator 8. -/
def rs_R003_ueqv_R003YY_partial_08_0235 : Poly :=
[
  term ((54528 : Rat) / 7625) [(0, 1), (6, 1), (7, 1), (12, 1), (13, 1)],
  term ((54528 : Rat) / 7625) [(1, 1), (7, 2), (12, 1), (13, 1)],
  term ((-27264 : Rat) / 7625) [(6, 2), (7, 1), (12, 1), (13, 1)],
  term ((-27264 : Rat) / 7625) [(7, 3), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 235 for generator 8. -/
theorem rs_R003_ueqv_R003YY_partial_08_0235_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_08_0235
        rs_R003_ueqv_R003YY_generator_08_0200_0287 =
      rs_R003_ueqv_R003YY_partial_08_0235 := by
  native_decide

/-- Coefficient term 236 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003YY_coefficient_08_0236 : Poly :=
[
  term ((-13632 : Rat) / 7625) [(7, 1), (13, 1)]
]

/-- Partial product 236 for generator 8. -/
def rs_R003_ueqv_R003YY_partial_08_0236 : Poly :=
[
  term ((-27264 : Rat) / 7625) [(0, 1), (6, 1), (7, 1), (13, 1)],
  term ((-27264 : Rat) / 7625) [(1, 1), (7, 2), (13, 1)],
  term ((13632 : Rat) / 7625) [(6, 2), (7, 1), (13, 1)],
  term ((13632 : Rat) / 7625) [(7, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 236 for generator 8. -/
theorem rs_R003_ueqv_R003YY_partial_08_0236_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_08_0236
        rs_R003_ueqv_R003YY_generator_08_0200_0287 =
      rs_R003_ueqv_R003YY_partial_08_0236 := by
  native_decide

/-- Coefficient term 237 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003YY_coefficient_08_0237 : Poly :=
[
  term ((5161144 : Rat) / 53375) [(9, 1), (10, 1), (13, 1)]
]

/-- Partial product 237 for generator 8. -/
def rs_R003_ueqv_R003YY_partial_08_0237 : Poly :=
[
  term ((10322288 : Rat) / 53375) [(0, 1), (6, 1), (9, 1), (10, 1), (13, 1)],
  term ((10322288 : Rat) / 53375) [(1, 1), (7, 1), (9, 1), (10, 1), (13, 1)],
  term ((-5161144 : Rat) / 53375) [(6, 2), (9, 1), (10, 1), (13, 1)],
  term ((-5161144 : Rat) / 53375) [(7, 2), (9, 1), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 237 for generator 8. -/
theorem rs_R003_ueqv_R003YY_partial_08_0237_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_08_0237
        rs_R003_ueqv_R003YY_generator_08_0200_0287 =
      rs_R003_ueqv_R003YY_partial_08_0237 := by
  native_decide

/-- Coefficient term 238 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003YY_coefficient_08_0238 : Poly :=
[
  term ((-4224 : Rat) / 35) [(9, 1), (10, 1), (13, 1), (14, 1)]
]

/-- Partial product 238 for generator 8. -/
def rs_R003_ueqv_R003YY_partial_08_0238 : Poly :=
[
  term ((-8448 : Rat) / 35) [(0, 1), (6, 1), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((-8448 : Rat) / 35) [(1, 1), (7, 1), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((4224 : Rat) / 35) [(6, 2), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((4224 : Rat) / 35) [(7, 2), (9, 1), (10, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 238 for generator 8. -/
theorem rs_R003_ueqv_R003YY_partial_08_0238_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_08_0238
        rs_R003_ueqv_R003YY_generator_08_0200_0287 =
      rs_R003_ueqv_R003YY_partial_08_0238 := by
  native_decide

/-- Coefficient term 239 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003YY_coefficient_08_0239 : Poly :=
[
  term ((1408 : Rat) / 35) [(9, 1), (10, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 239 for generator 8. -/
def rs_R003_ueqv_R003YY_partial_08_0239 : Poly :=
[
  term ((2816 : Rat) / 35) [(0, 1), (6, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((2816 : Rat) / 35) [(1, 1), (7, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1408 : Rat) / 35) [(6, 2), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1408 : Rat) / 35) [(7, 2), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 239 for generator 8. -/
theorem rs_R003_ueqv_R003YY_partial_08_0239_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_08_0239
        rs_R003_ueqv_R003YY_generator_08_0200_0287 =
      rs_R003_ueqv_R003YY_partial_08_0239 := by
  native_decide

/-- Coefficient term 240 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003YY_coefficient_08_0240 : Poly :=
[
  term ((-1144 : Rat) / 35) [(9, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 240 for generator 8. -/
def rs_R003_ueqv_R003YY_partial_08_0240 : Poly :=
[
  term ((-2288 : Rat) / 35) [(0, 1), (6, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-2288 : Rat) / 35) [(1, 1), (7, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((1144 : Rat) / 35) [(6, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((1144 : Rat) / 35) [(7, 2), (9, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 240 for generator 8. -/
theorem rs_R003_ueqv_R003YY_partial_08_0240_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_08_0240
        rs_R003_ueqv_R003YY_generator_08_0200_0287 =
      rs_R003_ueqv_R003YY_partial_08_0240 := by
  native_decide

/-- Coefficient term 241 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003YY_coefficient_08_0241 : Poly :=
[
  term ((-17743 : Rat) / 210) [(9, 1), (10, 1), (15, 1)]
]

/-- Partial product 241 for generator 8. -/
def rs_R003_ueqv_R003YY_partial_08_0241 : Poly :=
[
  term ((-17743 : Rat) / 105) [(0, 1), (6, 1), (9, 1), (10, 1), (15, 1)],
  term ((-17743 : Rat) / 105) [(1, 1), (7, 1), (9, 1), (10, 1), (15, 1)],
  term ((17743 : Rat) / 210) [(6, 2), (9, 1), (10, 1), (15, 1)],
  term ((17743 : Rat) / 210) [(7, 2), (9, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 241 for generator 8. -/
theorem rs_R003_ueqv_R003YY_partial_08_0241_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_08_0241
        rs_R003_ueqv_R003YY_generator_08_0200_0287 =
      rs_R003_ueqv_R003YY_partial_08_0241 := by
  native_decide

/-- Coefficient term 242 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003YY_coefficient_08_0242 : Poly :=
[
  term ((121 : Rat) / 14) [(9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 242 for generator 8. -/
def rs_R003_ueqv_R003YY_partial_08_0242 : Poly :=
[
  term ((121 : Rat) / 7) [(0, 1), (6, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((121 : Rat) / 7) [(1, 1), (7, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-121 : Rat) / 14) [(6, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-121 : Rat) / 14) [(7, 2), (9, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 242 for generator 8. -/
theorem rs_R003_ueqv_R003YY_partial_08_0242_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_08_0242
        rs_R003_ueqv_R003YY_generator_08_0200_0287 =
      rs_R003_ueqv_R003YY_partial_08_0242 := by
  native_decide

/-- Coefficient term 243 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003YY_coefficient_08_0243 : Poly :=
[
  term ((18418 : Rat) / 35) [(9, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 243 for generator 8. -/
def rs_R003_ueqv_R003YY_partial_08_0243 : Poly :=
[
  term ((36836 : Rat) / 35) [(0, 1), (6, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((36836 : Rat) / 35) [(1, 1), (7, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-18418 : Rat) / 35) [(6, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-18418 : Rat) / 35) [(7, 2), (9, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 243 for generator 8. -/
theorem rs_R003_ueqv_R003YY_partial_08_0243_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_08_0243
        rs_R003_ueqv_R003YY_generator_08_0200_0287 =
      rs_R003_ueqv_R003YY_partial_08_0243 := by
  native_decide

/-- Coefficient term 244 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003YY_coefficient_08_0244 : Poly :=
[
  term ((-2274 : Rat) / 35) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 244 for generator 8. -/
def rs_R003_ueqv_R003YY_partial_08_0244 : Poly :=
[
  term ((-4548 : Rat) / 35) [(0, 1), (6, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4548 : Rat) / 35) [(1, 1), (7, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((2274 : Rat) / 35) [(6, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((2274 : Rat) / 35) [(7, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 244 for generator 8. -/
theorem rs_R003_ueqv_R003YY_partial_08_0244_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_08_0244
        rs_R003_ueqv_R003YY_generator_08_0200_0287 =
      rs_R003_ueqv_R003YY_partial_08_0244 := by
  native_decide

/-- Coefficient term 245 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003YY_coefficient_08_0245 : Poly :=
[
  term ((752448 : Rat) / 875) [(9, 1), (11, 1), (13, 2)]
]

/-- Partial product 245 for generator 8. -/
def rs_R003_ueqv_R003YY_partial_08_0245 : Poly :=
[
  term ((1504896 : Rat) / 875) [(0, 1), (6, 1), (9, 1), (11, 1), (13, 2)],
  term ((1504896 : Rat) / 875) [(1, 1), (7, 1), (9, 1), (11, 1), (13, 2)],
  term ((-752448 : Rat) / 875) [(6, 2), (9, 1), (11, 1), (13, 2)],
  term ((-752448 : Rat) / 875) [(7, 2), (9, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 245 for generator 8. -/
theorem rs_R003_ueqv_R003YY_partial_08_0245_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_08_0245
        rs_R003_ueqv_R003YY_generator_08_0200_0287 =
      rs_R003_ueqv_R003YY_partial_08_0245 := by
  native_decide

/-- Coefficient term 246 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003YY_coefficient_08_0246 : Poly :=
[
  term ((-36864 : Rat) / 35) [(9, 1), (11, 1), (13, 2), (14, 1)]
]

/-- Partial product 246 for generator 8. -/
def rs_R003_ueqv_R003YY_partial_08_0246 : Poly :=
[
  term ((-73728 : Rat) / 35) [(0, 1), (6, 1), (9, 1), (11, 1), (13, 2), (14, 1)],
  term ((-73728 : Rat) / 35) [(1, 1), (7, 1), (9, 1), (11, 1), (13, 2), (14, 1)],
  term ((36864 : Rat) / 35) [(6, 2), (9, 1), (11, 1), (13, 2), (14, 1)],
  term ((36864 : Rat) / 35) [(7, 2), (9, 1), (11, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 246 for generator 8. -/
theorem rs_R003_ueqv_R003YY_partial_08_0246_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_08_0246
        rs_R003_ueqv_R003YY_generator_08_0200_0287 =
      rs_R003_ueqv_R003YY_partial_08_0246 := by
  native_decide

/-- Coefficient term 247 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003YY_coefficient_08_0247 : Poly :=
[
  term ((12288 : Rat) / 35) [(9, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 247 for generator 8. -/
def rs_R003_ueqv_R003YY_partial_08_0247 : Poly :=
[
  term ((24576 : Rat) / 35) [(0, 1), (6, 1), (9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((24576 : Rat) / 35) [(1, 1), (7, 1), (9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-12288 : Rat) / 35) [(6, 2), (9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-12288 : Rat) / 35) [(7, 2), (9, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 247 for generator 8. -/
theorem rs_R003_ueqv_R003YY_partial_08_0247_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_08_0247
        rs_R003_ueqv_R003YY_generator_08_0200_0287 =
      rs_R003_ueqv_R003YY_partial_08_0247 := by
  native_decide

/-- Coefficient term 248 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003YY_coefficient_08_0248 : Poly :=
[
  term ((-9984 : Rat) / 35) [(9, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 248 for generator 8. -/
def rs_R003_ueqv_R003YY_partial_08_0248 : Poly :=
[
  term ((-19968 : Rat) / 35) [(0, 1), (6, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-19968 : Rat) / 35) [(1, 1), (7, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((9984 : Rat) / 35) [(6, 2), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((9984 : Rat) / 35) [(7, 2), (9, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 248 for generator 8. -/
theorem rs_R003_ueqv_R003YY_partial_08_0248_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_08_0248
        rs_R003_ueqv_R003YY_generator_08_0200_0287 =
      rs_R003_ueqv_R003YY_partial_08_0248 := by
  native_decide

/-- Coefficient term 249 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003YY_coefficient_08_0249 : Poly :=
[
  term ((24833408 : Rat) / 53375) [(9, 1), (11, 2), (13, 1)]
]

/-- Partial product 249 for generator 8. -/
def rs_R003_ueqv_R003YY_partial_08_0249 : Poly :=
[
  term ((49666816 : Rat) / 53375) [(0, 1), (6, 1), (9, 1), (11, 2), (13, 1)],
  term ((49666816 : Rat) / 53375) [(1, 1), (7, 1), (9, 1), (11, 2), (13, 1)],
  term ((-24833408 : Rat) / 53375) [(6, 2), (9, 1), (11, 2), (13, 1)],
  term ((-24833408 : Rat) / 53375) [(7, 2), (9, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 249 for generator 8. -/
theorem rs_R003_ueqv_R003YY_partial_08_0249_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_08_0249
        rs_R003_ueqv_R003YY_generator_08_0200_0287 =
      rs_R003_ueqv_R003YY_partial_08_0249 := by
  native_decide

/-- Coefficient term 250 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003YY_coefficient_08_0250 : Poly :=
[
  term ((-19968 : Rat) / 35) [(9, 1), (11, 2), (13, 1), (14, 1)]
]

/-- Partial product 250 for generator 8. -/
def rs_R003_ueqv_R003YY_partial_08_0250 : Poly :=
[
  term ((-39936 : Rat) / 35) [(0, 1), (6, 1), (9, 1), (11, 2), (13, 1), (14, 1)],
  term ((-39936 : Rat) / 35) [(1, 1), (7, 1), (9, 1), (11, 2), (13, 1), (14, 1)],
  term ((19968 : Rat) / 35) [(6, 2), (9, 1), (11, 2), (13, 1), (14, 1)],
  term ((19968 : Rat) / 35) [(7, 2), (9, 1), (11, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 250 for generator 8. -/
theorem rs_R003_ueqv_R003YY_partial_08_0250_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_08_0250
        rs_R003_ueqv_R003YY_generator_08_0200_0287 =
      rs_R003_ueqv_R003YY_partial_08_0250 := by
  native_decide

/-- Coefficient term 251 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003YY_coefficient_08_0251 : Poly :=
[
  term ((6656 : Rat) / 35) [(9, 1), (11, 2), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 251 for generator 8. -/
def rs_R003_ueqv_R003YY_partial_08_0251 : Poly :=
[
  term ((13312 : Rat) / 35) [(0, 1), (6, 1), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((13312 : Rat) / 35) [(1, 1), (7, 1), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-6656 : Rat) / 35) [(6, 2), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-6656 : Rat) / 35) [(7, 2), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 251 for generator 8. -/
theorem rs_R003_ueqv_R003YY_partial_08_0251_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_08_0251
        rs_R003_ueqv_R003YY_generator_08_0200_0287 =
      rs_R003_ueqv_R003YY_partial_08_0251 := by
  native_decide

/-- Coefficient term 252 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003YY_coefficient_08_0252 : Poly :=
[
  term ((-5408 : Rat) / 35) [(9, 1), (11, 2), (13, 1), (16, 1)]
]

/-- Partial product 252 for generator 8. -/
def rs_R003_ueqv_R003YY_partial_08_0252 : Poly :=
[
  term ((-10816 : Rat) / 35) [(0, 1), (6, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-10816 : Rat) / 35) [(1, 1), (7, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((5408 : Rat) / 35) [(6, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((5408 : Rat) / 35) [(7, 2), (9, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 252 for generator 8. -/
theorem rs_R003_ueqv_R003YY_partial_08_0252_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_08_0252
        rs_R003_ueqv_R003YY_generator_08_0200_0287 =
      rs_R003_ueqv_R003YY_partial_08_0252 := by
  native_decide

/-- Coefficient term 253 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003YY_coefficient_08_0253 : Poly :=
[
  term ((587 : Rat) / 105) [(9, 1), (11, 2), (15, 1)]
]

/-- Partial product 253 for generator 8. -/
def rs_R003_ueqv_R003YY_partial_08_0253 : Poly :=
[
  term ((1174 : Rat) / 105) [(0, 1), (6, 1), (9, 1), (11, 2), (15, 1)],
  term ((1174 : Rat) / 105) [(1, 1), (7, 1), (9, 1), (11, 2), (15, 1)],
  term ((-587 : Rat) / 105) [(6, 2), (9, 1), (11, 2), (15, 1)],
  term ((-587 : Rat) / 105) [(7, 2), (9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 253 for generator 8. -/
theorem rs_R003_ueqv_R003YY_partial_08_0253_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_08_0253
        rs_R003_ueqv_R003YY_generator_08_0200_0287 =
      rs_R003_ueqv_R003YY_partial_08_0253 := by
  native_decide

/-- Coefficient term 254 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003YY_coefficient_08_0254 : Poly :=
[
  term ((-29 : Rat) / 7) [(9, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 254 for generator 8. -/
def rs_R003_ueqv_R003YY_partial_08_0254 : Poly :=
[
  term ((-58 : Rat) / 7) [(0, 1), (6, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-58 : Rat) / 7) [(1, 1), (7, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((29 : Rat) / 7) [(6, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((29 : Rat) / 7) [(7, 2), (9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 254 for generator 8. -/
theorem rs_R003_ueqv_R003YY_partial_08_0254_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_08_0254
        rs_R003_ueqv_R003YY_generator_08_0200_0287 =
      rs_R003_ueqv_R003YY_partial_08_0254 := by
  native_decide

/-- Coefficient term 255 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003YY_coefficient_08_0255 : Poly :=
[
  term ((1368648 : Rat) / 53375) [(9, 1), (12, 1), (13, 1)]
]

/-- Partial product 255 for generator 8. -/
def rs_R003_ueqv_R003YY_partial_08_0255 : Poly :=
[
  term ((2737296 : Rat) / 53375) [(0, 1), (6, 1), (9, 1), (12, 1), (13, 1)],
  term ((2737296 : Rat) / 53375) [(1, 1), (7, 1), (9, 1), (12, 1), (13, 1)],
  term ((-1368648 : Rat) / 53375) [(6, 2), (9, 1), (12, 1), (13, 1)],
  term ((-1368648 : Rat) / 53375) [(7, 2), (9, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 255 for generator 8. -/
theorem rs_R003_ueqv_R003YY_partial_08_0255_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_08_0255
        rs_R003_ueqv_R003YY_generator_08_0200_0287 =
      rs_R003_ueqv_R003YY_partial_08_0255 := by
  native_decide

/-- Coefficient term 256 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003YY_coefficient_08_0256 : Poly :=
[
  term ((-768 : Rat) / 35) [(9, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 256 for generator 8. -/
def rs_R003_ueqv_R003YY_partial_08_0256 : Poly :=
[
  term ((-1536 : Rat) / 35) [(0, 1), (6, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-1536 : Rat) / 35) [(1, 1), (7, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((768 : Rat) / 35) [(6, 2), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((768 : Rat) / 35) [(7, 2), (9, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 256 for generator 8. -/
theorem rs_R003_ueqv_R003YY_partial_08_0256_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_08_0256
        rs_R003_ueqv_R003YY_generator_08_0200_0287 =
      rs_R003_ueqv_R003YY_partial_08_0256 := by
  native_decide

/-- Coefficient term 257 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003YY_coefficient_08_0257 : Poly :=
[
  term ((256 : Rat) / 35) [(9, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 257 for generator 8. -/
def rs_R003_ueqv_R003YY_partial_08_0257 : Poly :=
[
  term ((512 : Rat) / 35) [(0, 1), (6, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((512 : Rat) / 35) [(1, 1), (7, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-256 : Rat) / 35) [(6, 2), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-256 : Rat) / 35) [(7, 2), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 257 for generator 8. -/
theorem rs_R003_ueqv_R003YY_partial_08_0257_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_08_0257
        rs_R003_ueqv_R003YY_generator_08_0200_0287 =
      rs_R003_ueqv_R003YY_partial_08_0257 := by
  native_decide

/-- Coefficient term 258 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003YY_coefficient_08_0258 : Poly :=
[
  term ((-208 : Rat) / 35) [(9, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 258 for generator 8. -/
def rs_R003_ueqv_R003YY_partial_08_0258 : Poly :=
[
  term ((-416 : Rat) / 35) [(0, 1), (6, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-416 : Rat) / 35) [(1, 1), (7, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((208 : Rat) / 35) [(6, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((208 : Rat) / 35) [(7, 2), (9, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 258 for generator 8. -/
theorem rs_R003_ueqv_R003YY_partial_08_0258_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_08_0258
        rs_R003_ueqv_R003YY_generator_08_0200_0287 =
      rs_R003_ueqv_R003YY_partial_08_0258 := by
  native_decide

/-- Coefficient term 259 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003YY_coefficient_08_0259 : Poly :=
[
  term ((2623 : Rat) / 70) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 259 for generator 8. -/
def rs_R003_ueqv_R003YY_partial_08_0259 : Poly :=
[
  term ((2623 : Rat) / 35) [(0, 1), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((2623 : Rat) / 35) [(1, 1), (7, 1), (9, 1), (12, 1), (15, 1)],
  term ((-2623 : Rat) / 70) [(6, 2), (9, 1), (12, 1), (15, 1)],
  term ((-2623 : Rat) / 70) [(7, 2), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 259 for generator 8. -/
theorem rs_R003_ueqv_R003YY_partial_08_0259_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_08_0259
        rs_R003_ueqv_R003YY_generator_08_0200_0287 =
      rs_R003_ueqv_R003YY_partial_08_0259 := by
  native_decide

/-- Coefficient term 260 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003YY_coefficient_08_0260 : Poly :=
[
  term ((-191 : Rat) / 70) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 260 for generator 8. -/
def rs_R003_ueqv_R003YY_partial_08_0260 : Poly :=
[
  term ((-191 : Rat) / 35) [(0, 1), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-191 : Rat) / 35) [(1, 1), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((191 : Rat) / 70) [(6, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((191 : Rat) / 70) [(7, 2), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 260 for generator 8. -/
theorem rs_R003_ueqv_R003YY_partial_08_0260_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_08_0260
        rs_R003_ueqv_R003YY_generator_08_0200_0287 =
      rs_R003_ueqv_R003YY_partial_08_0260 := by
  native_decide

/-- Coefficient term 261 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003YY_coefficient_08_0261 : Poly :=
[
  term ((3997516 : Rat) / 10675) [(9, 1), (13, 1)]
]

/-- Partial product 261 for generator 8. -/
def rs_R003_ueqv_R003YY_partial_08_0261 : Poly :=
[
  term ((7995032 : Rat) / 10675) [(0, 1), (6, 1), (9, 1), (13, 1)],
  term ((7995032 : Rat) / 10675) [(1, 1), (7, 1), (9, 1), (13, 1)],
  term ((-3997516 : Rat) / 10675) [(6, 2), (9, 1), (13, 1)],
  term ((-3997516 : Rat) / 10675) [(7, 2), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 261 for generator 8. -/
theorem rs_R003_ueqv_R003YY_partial_08_0261_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_08_0261
        rs_R003_ueqv_R003YY_generator_08_0200_0287 =
      rs_R003_ueqv_R003YY_partial_08_0261 := by
  native_decide

/-- Coefficient term 262 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003YY_coefficient_08_0262 : Poly :=
[
  term ((-2272 : Rat) / 7) [(9, 1), (13, 1), (14, 1)]
]

/-- Partial product 262 for generator 8. -/
def rs_R003_ueqv_R003YY_partial_08_0262 : Poly :=
[
  term ((-4544 : Rat) / 7) [(0, 1), (6, 1), (9, 1), (13, 1), (14, 1)],
  term ((-4544 : Rat) / 7) [(1, 1), (7, 1), (9, 1), (13, 1), (14, 1)],
  term ((2272 : Rat) / 7) [(6, 2), (9, 1), (13, 1), (14, 1)],
  term ((2272 : Rat) / 7) [(7, 2), (9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 262 for generator 8. -/
theorem rs_R003_ueqv_R003YY_partial_08_0262_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_08_0262
        rs_R003_ueqv_R003YY_generator_08_0200_0287 =
      rs_R003_ueqv_R003YY_partial_08_0262 := by
  native_decide

/-- Coefficient term 263 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003YY_coefficient_08_0263 : Poly :=
[
  term ((-1664 : Rat) / 35) [(9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 263 for generator 8. -/
def rs_R003_ueqv_R003YY_partial_08_0263 : Poly :=
[
  term ((-3328 : Rat) / 35) [(0, 1), (6, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3328 : Rat) / 35) [(1, 1), (7, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((1664 : Rat) / 35) [(6, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((1664 : Rat) / 35) [(7, 2), (9, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 263 for generator 8. -/
theorem rs_R003_ueqv_R003YY_partial_08_0263_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_08_0263
        rs_R003_ueqv_R003YY_generator_08_0200_0287 =
      rs_R003_ueqv_R003YY_partial_08_0263 := by
  native_decide

/-- Coefficient term 264 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003YY_coefficient_08_0264 : Poly :=
[
  term ((1352 : Rat) / 35) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 264 for generator 8. -/
def rs_R003_ueqv_R003YY_partial_08_0264 : Poly :=
[
  term ((2704 : Rat) / 35) [(0, 1), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((2704 : Rat) / 35) [(1, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((-1352 : Rat) / 35) [(6, 2), (9, 1), (13, 1), (16, 1)],
  term ((-1352 : Rat) / 35) [(7, 2), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 264 for generator 8. -/
theorem rs_R003_ueqv_R003YY_partial_08_0264_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_08_0264
        rs_R003_ueqv_R003YY_generator_08_0200_0287 =
      rs_R003_ueqv_R003YY_partial_08_0264 := by
  native_decide

/-- Coefficient term 265 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003YY_coefficient_08_0265 : Poly :=
[
  term ((-113 : Rat) / 21) [(9, 1), (15, 1)]
]

/-- Partial product 265 for generator 8. -/
def rs_R003_ueqv_R003YY_partial_08_0265 : Poly :=
[
  term ((-226 : Rat) / 21) [(0, 1), (6, 1), (9, 1), (15, 1)],
  term ((-226 : Rat) / 21) [(1, 1), (7, 1), (9, 1), (15, 1)],
  term ((113 : Rat) / 21) [(6, 2), (9, 1), (15, 1)],
  term ((113 : Rat) / 21) [(7, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 265 for generator 8. -/
theorem rs_R003_ueqv_R003YY_partial_08_0265_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_08_0265
        rs_R003_ueqv_R003YY_generator_08_0200_0287 =
      rs_R003_ueqv_R003YY_partial_08_0265 := by
  native_decide

/-- Coefficient term 266 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003YY_coefficient_08_0266 : Poly :=
[
  term ((-33 : Rat) / 7) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 266 for generator 8. -/
def rs_R003_ueqv_R003YY_partial_08_0266 : Poly :=
[
  term ((-66 : Rat) / 7) [(0, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-66 : Rat) / 7) [(1, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((33 : Rat) / 7) [(6, 2), (9, 1), (15, 1), (16, 1)],
  term ((33 : Rat) / 7) [(7, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 266 for generator 8. -/
theorem rs_R003_ueqv_R003YY_partial_08_0266_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_08_0266
        rs_R003_ueqv_R003YY_generator_08_0200_0287 =
      rs_R003_ueqv_R003YY_partial_08_0266 := by
  native_decide

/-- Coefficient term 267 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003YY_coefficient_08_0267 : Poly :=
[
  term ((-1732 : Rat) / 5) [(9, 2)]
]

/-- Partial product 267 for generator 8. -/
def rs_R003_ueqv_R003YY_partial_08_0267 : Poly :=
[
  term ((-3464 : Rat) / 5) [(0, 1), (6, 1), (9, 2)],
  term ((-3464 : Rat) / 5) [(1, 1), (7, 1), (9, 2)],
  term ((1732 : Rat) / 5) [(6, 2), (9, 2)],
  term ((1732 : Rat) / 5) [(7, 2), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 267 for generator 8. -/
theorem rs_R003_ueqv_R003YY_partial_08_0267_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_08_0267
        rs_R003_ueqv_R003YY_generator_08_0200_0287 =
      rs_R003_ueqv_R003YY_partial_08_0267 := by
  native_decide

/-- Coefficient term 268 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003YY_coefficient_08_0268 : Poly :=
[
  term ((-45861024 : Rat) / 53375) [(9, 2), (11, 1), (13, 1)]
]

/-- Partial product 268 for generator 8. -/
def rs_R003_ueqv_R003YY_partial_08_0268 : Poly :=
[
  term ((-91722048 : Rat) / 53375) [(0, 1), (6, 1), (9, 2), (11, 1), (13, 1)],
  term ((-91722048 : Rat) / 53375) [(1, 1), (7, 1), (9, 2), (11, 1), (13, 1)],
  term ((45861024 : Rat) / 53375) [(6, 2), (9, 2), (11, 1), (13, 1)],
  term ((45861024 : Rat) / 53375) [(7, 2), (9, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 268 for generator 8. -/
theorem rs_R003_ueqv_R003YY_partial_08_0268_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_08_0268
        rs_R003_ueqv_R003YY_generator_08_0200_0287 =
      rs_R003_ueqv_R003YY_partial_08_0268 := by
  native_decide

/-- Coefficient term 269 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003YY_coefficient_08_0269 : Poly :=
[
  term ((36864 : Rat) / 35) [(9, 2), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 269 for generator 8. -/
def rs_R003_ueqv_R003YY_partial_08_0269 : Poly :=
[
  term ((73728 : Rat) / 35) [(0, 1), (6, 1), (9, 2), (11, 1), (13, 1), (14, 1)],
  term ((73728 : Rat) / 35) [(1, 1), (7, 1), (9, 2), (11, 1), (13, 1), (14, 1)],
  term ((-36864 : Rat) / 35) [(6, 2), (9, 2), (11, 1), (13, 1), (14, 1)],
  term ((-36864 : Rat) / 35) [(7, 2), (9, 2), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 269 for generator 8. -/
theorem rs_R003_ueqv_R003YY_partial_08_0269_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_08_0269
        rs_R003_ueqv_R003YY_generator_08_0200_0287 =
      rs_R003_ueqv_R003YY_partial_08_0269 := by
  native_decide

/-- Coefficient term 270 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003YY_coefficient_08_0270 : Poly :=
[
  term ((-12288 : Rat) / 35) [(9, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 270 for generator 8. -/
def rs_R003_ueqv_R003YY_partial_08_0270 : Poly :=
[
  term ((-24576 : Rat) / 35) [(0, 1), (6, 1), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-24576 : Rat) / 35) [(1, 1), (7, 1), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((12288 : Rat) / 35) [(6, 2), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((12288 : Rat) / 35) [(7, 2), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 270 for generator 8. -/
theorem rs_R003_ueqv_R003YY_partial_08_0270_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_08_0270
        rs_R003_ueqv_R003YY_generator_08_0200_0287 =
      rs_R003_ueqv_R003YY_partial_08_0270 := by
  native_decide

/-- Coefficient term 271 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003YY_coefficient_08_0271 : Poly :=
[
  term ((9984 : Rat) / 35) [(9, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 271 for generator 8. -/
def rs_R003_ueqv_R003YY_partial_08_0271 : Poly :=
[
  term ((19968 : Rat) / 35) [(0, 1), (6, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((19968 : Rat) / 35) [(1, 1), (7, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-9984 : Rat) / 35) [(6, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-9984 : Rat) / 35) [(7, 2), (9, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 271 for generator 8. -/
theorem rs_R003_ueqv_R003YY_partial_08_0271_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_08_0271
        rs_R003_ueqv_R003YY_generator_08_0200_0287 =
      rs_R003_ueqv_R003YY_partial_08_0271 := by
  native_decide

/-- Coefficient term 272 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003YY_coefficient_08_0272 : Poly :=
[
  term ((-2096 : Rat) / 7) [(9, 2), (11, 1), (15, 1)]
]

/-- Partial product 272 for generator 8. -/
def rs_R003_ueqv_R003YY_partial_08_0272 : Poly :=
[
  term ((-4192 : Rat) / 7) [(0, 1), (6, 1), (9, 2), (11, 1), (15, 1)],
  term ((-4192 : Rat) / 7) [(1, 1), (7, 1), (9, 2), (11, 1), (15, 1)],
  term ((2096 : Rat) / 7) [(6, 2), (9, 2), (11, 1), (15, 1)],
  term ((2096 : Rat) / 7) [(7, 2), (9, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 272 for generator 8. -/
theorem rs_R003_ueqv_R003YY_partial_08_0272_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_08_0272
        rs_R003_ueqv_R003YY_generator_08_0200_0287 =
      rs_R003_ueqv_R003YY_partial_08_0272 := by
  native_decide

/-- Coefficient term 273 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003YY_coefficient_08_0273 : Poly :=
[
  term ((1392 : Rat) / 35) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 273 for generator 8. -/
def rs_R003_ueqv_R003YY_partial_08_0273 : Poly :=
[
  term ((2784 : Rat) / 35) [(0, 1), (6, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((2784 : Rat) / 35) [(1, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1392 : Rat) / 35) [(6, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1392 : Rat) / 35) [(7, 2), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 273 for generator 8. -/
theorem rs_R003_ueqv_R003YY_partial_08_0273_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_08_0273
        rs_R003_ueqv_R003YY_generator_08_0200_0287 =
      rs_R003_ueqv_R003YY_partial_08_0273 := by
  native_decide

/-- Coefficient term 274 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003YY_coefficient_08_0274 : Poly :=
[
  term ((1568 : Rat) / 5) [(9, 2), (14, 1)]
]

/-- Partial product 274 for generator 8. -/
def rs_R003_ueqv_R003YY_partial_08_0274 : Poly :=
[
  term ((3136 : Rat) / 5) [(0, 1), (6, 1), (9, 2), (14, 1)],
  term ((3136 : Rat) / 5) [(1, 1), (7, 1), (9, 2), (14, 1)],
  term ((-1568 : Rat) / 5) [(6, 2), (9, 2), (14, 1)],
  term ((-1568 : Rat) / 5) [(7, 2), (9, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 274 for generator 8. -/
theorem rs_R003_ueqv_R003YY_partial_08_0274_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_08_0274
        rs_R003_ueqv_R003YY_generator_08_0200_0287 =
      rs_R003_ueqv_R003YY_partial_08_0274 := by
  native_decide

/-- Coefficient term 275 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003YY_coefficient_08_0275 : Poly :=
[
  term ((-2 : Rat) / 5) [(9, 2), (16, 1)]
]

/-- Partial product 275 for generator 8. -/
def rs_R003_ueqv_R003YY_partial_08_0275 : Poly :=
[
  term ((-4 : Rat) / 5) [(0, 1), (6, 1), (9, 2), (16, 1)],
  term ((-4 : Rat) / 5) [(1, 1), (7, 1), (9, 2), (16, 1)],
  term ((2 : Rat) / 5) [(6, 2), (9, 2), (16, 1)],
  term ((2 : Rat) / 5) [(7, 2), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 275 for generator 8. -/
theorem rs_R003_ueqv_R003YY_partial_08_0275_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_08_0275
        rs_R003_ueqv_R003YY_generator_08_0200_0287 =
      rs_R003_ueqv_R003YY_partial_08_0275 := by
  native_decide

/-- Coefficient term 276 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003YY_coefficient_08_0276 : Poly :=
[
  term ((480512 : Rat) / 10675) [(11, 1), (13, 1)]
]

/-- Partial product 276 for generator 8. -/
def rs_R003_ueqv_R003YY_partial_08_0276 : Poly :=
[
  term ((961024 : Rat) / 10675) [(0, 1), (6, 1), (11, 1), (13, 1)],
  term ((961024 : Rat) / 10675) [(1, 1), (7, 1), (11, 1), (13, 1)],
  term ((-480512 : Rat) / 10675) [(6, 2), (11, 1), (13, 1)],
  term ((-480512 : Rat) / 10675) [(7, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 276 for generator 8. -/
theorem rs_R003_ueqv_R003YY_partial_08_0276_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_08_0276
        rs_R003_ueqv_R003YY_generator_08_0200_0287 =
      rs_R003_ueqv_R003YY_partial_08_0276 := by
  native_decide

/-- Coefficient term 277 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003YY_coefficient_08_0277 : Poly :=
[
  term ((-384 : Rat) / 7) [(11, 1), (13, 1), (14, 1)]
]

/-- Partial product 277 for generator 8. -/
def rs_R003_ueqv_R003YY_partial_08_0277 : Poly :=
[
  term ((-768 : Rat) / 7) [(0, 1), (6, 1), (11, 1), (13, 1), (14, 1)],
  term ((-768 : Rat) / 7) [(1, 1), (7, 1), (11, 1), (13, 1), (14, 1)],
  term ((384 : Rat) / 7) [(6, 2), (11, 1), (13, 1), (14, 1)],
  term ((384 : Rat) / 7) [(7, 2), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 277 for generator 8. -/
theorem rs_R003_ueqv_R003YY_partial_08_0277_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_08_0277
        rs_R003_ueqv_R003YY_generator_08_0200_0287 =
      rs_R003_ueqv_R003YY_partial_08_0277 := by
  native_decide

/-- Coefficient term 278 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003YY_coefficient_08_0278 : Poly :=
[
  term ((128 : Rat) / 7) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 278 for generator 8. -/
def rs_R003_ueqv_R003YY_partial_08_0278 : Poly :=
[
  term ((256 : Rat) / 7) [(0, 1), (6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((256 : Rat) / 7) [(1, 1), (7, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-128 : Rat) / 7) [(6, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-128 : Rat) / 7) [(7, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 278 for generator 8. -/
theorem rs_R003_ueqv_R003YY_partial_08_0278_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_08_0278
        rs_R003_ueqv_R003YY_generator_08_0200_0287 =
      rs_R003_ueqv_R003YY_partial_08_0278 := by
  native_decide

/-- Coefficient term 279 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003YY_coefficient_08_0279 : Poly :=
[
  term ((-104 : Rat) / 7) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 279 for generator 8. -/
def rs_R003_ueqv_R003YY_partial_08_0279 : Poly :=
[
  term ((-208 : Rat) / 7) [(0, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-208 : Rat) / 7) [(1, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((104 : Rat) / 7) [(6, 2), (11, 1), (13, 1), (16, 1)],
  term ((104 : Rat) / 7) [(7, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 279 for generator 8. -/
theorem rs_R003_ueqv_R003YY_partial_08_0279_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_08_0279
        rs_R003_ueqv_R003YY_generator_08_0200_0287 =
      rs_R003_ueqv_R003YY_partial_08_0279 := by
  native_decide

/-- Coefficient term 280 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003YY_coefficient_08_0280 : Poly :=
[
  term ((2581 : Rat) / 420) [(11, 1), (15, 1)]
]

/-- Partial product 280 for generator 8. -/
def rs_R003_ueqv_R003YY_partial_08_0280 : Poly :=
[
  term ((2581 : Rat) / 210) [(0, 1), (6, 1), (11, 1), (15, 1)],
  term ((2581 : Rat) / 210) [(1, 1), (7, 1), (11, 1), (15, 1)],
  term ((-2581 : Rat) / 420) [(6, 2), (11, 1), (15, 1)],
  term ((-2581 : Rat) / 420) [(7, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 280 for generator 8. -/
theorem rs_R003_ueqv_R003YY_partial_08_0280_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_08_0280
        rs_R003_ueqv_R003YY_generator_08_0200_0287 =
      rs_R003_ueqv_R003YY_partial_08_0280 := by
  native_decide

/-- Coefficient term 281 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003YY_coefficient_08_0281 : Poly :=
[
  term ((-143 : Rat) / 140) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 281 for generator 8. -/
def rs_R003_ueqv_R003YY_partial_08_0281 : Poly :=
[
  term ((-143 : Rat) / 70) [(0, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-143 : Rat) / 70) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((143 : Rat) / 140) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term ((143 : Rat) / 140) [(7, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 281 for generator 8. -/
theorem rs_R003_ueqv_R003YY_partial_08_0281_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_08_0281
        rs_R003_ueqv_R003YY_generator_08_0200_0287 =
      rs_R003_ueqv_R003YY_partial_08_0281 := by
  native_decide

/-- Coefficient term 282 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003YY_coefficient_08_0282 : Poly :=
[
  term ((9857 : Rat) / 2100) [(13, 1), (15, 1)]
]

/-- Partial product 282 for generator 8. -/
def rs_R003_ueqv_R003YY_partial_08_0282 : Poly :=
[
  term ((9857 : Rat) / 1050) [(0, 1), (6, 1), (13, 1), (15, 1)],
  term ((9857 : Rat) / 1050) [(1, 1), (7, 1), (13, 1), (15, 1)],
  term ((-9857 : Rat) / 2100) [(6, 2), (13, 1), (15, 1)],
  term ((-9857 : Rat) / 2100) [(7, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 282 for generator 8. -/
theorem rs_R003_ueqv_R003YY_partial_08_0282_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_08_0282
        rs_R003_ueqv_R003YY_generator_08_0200_0287 =
      rs_R003_ueqv_R003YY_partial_08_0282 := by
  native_decide

/-- Coefficient term 283 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003YY_coefficient_08_0283 : Poly :=
[
  term ((45 : Rat) / 28) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 283 for generator 8. -/
def rs_R003_ueqv_R003YY_partial_08_0283 : Poly :=
[
  term ((45 : Rat) / 14) [(0, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((45 : Rat) / 14) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-45 : Rat) / 28) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-45 : Rat) / 28) [(7, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 283 for generator 8. -/
theorem rs_R003_ueqv_R003YY_partial_08_0283_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_08_0283
        rs_R003_ueqv_R003YY_generator_08_0200_0287 =
      rs_R003_ueqv_R003YY_partial_08_0283 := by
  native_decide

/-- Coefficient term 284 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003YY_coefficient_08_0284 : Poly :=
[
  term ((-5203172 : Rat) / 53375) [(13, 2)]
]

/-- Partial product 284 for generator 8. -/
def rs_R003_ueqv_R003YY_partial_08_0284 : Poly :=
[
  term ((-10406344 : Rat) / 53375) [(0, 1), (6, 1), (13, 2)],
  term ((-10406344 : Rat) / 53375) [(1, 1), (7, 1), (13, 2)],
  term ((5203172 : Rat) / 53375) [(6, 2), (13, 2)],
  term ((5203172 : Rat) / 53375) [(7, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 284 for generator 8. -/
theorem rs_R003_ueqv_R003YY_partial_08_0284_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_08_0284
        rs_R003_ueqv_R003YY_generator_08_0200_0287 =
      rs_R003_ueqv_R003YY_partial_08_0284 := by
  native_decide

/-- Coefficient term 285 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003YY_coefficient_08_0285 : Poly :=
[
  term ((4224 : Rat) / 35) [(13, 2), (14, 1)]
]

/-- Partial product 285 for generator 8. -/
def rs_R003_ueqv_R003YY_partial_08_0285 : Poly :=
[
  term ((8448 : Rat) / 35) [(0, 1), (6, 1), (13, 2), (14, 1)],
  term ((8448 : Rat) / 35) [(1, 1), (7, 1), (13, 2), (14, 1)],
  term ((-4224 : Rat) / 35) [(6, 2), (13, 2), (14, 1)],
  term ((-4224 : Rat) / 35) [(7, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 285 for generator 8. -/
theorem rs_R003_ueqv_R003YY_partial_08_0285_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_08_0285
        rs_R003_ueqv_R003YY_generator_08_0200_0287 =
      rs_R003_ueqv_R003YY_partial_08_0285 := by
  native_decide

/-- Coefficient term 286 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003YY_coefficient_08_0286 : Poly :=
[
  term ((-1408 : Rat) / 35) [(13, 2), (14, 1), (16, 1)]
]

/-- Partial product 286 for generator 8. -/
def rs_R003_ueqv_R003YY_partial_08_0286 : Poly :=
[
  term ((-2816 : Rat) / 35) [(0, 1), (6, 1), (13, 2), (14, 1), (16, 1)],
  term ((-2816 : Rat) / 35) [(1, 1), (7, 1), (13, 2), (14, 1), (16, 1)],
  term ((1408 : Rat) / 35) [(6, 2), (13, 2), (14, 1), (16, 1)],
  term ((1408 : Rat) / 35) [(7, 2), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 286 for generator 8. -/
theorem rs_R003_ueqv_R003YY_partial_08_0286_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_08_0286
        rs_R003_ueqv_R003YY_generator_08_0200_0287 =
      rs_R003_ueqv_R003YY_partial_08_0286 := by
  native_decide

/-- Coefficient term 287 from coefficient polynomial 8. -/
def rs_R003_ueqv_R003YY_coefficient_08_0287 : Poly :=
[
  term ((1144 : Rat) / 35) [(13, 2), (16, 1)]
]

/-- Partial product 287 for generator 8. -/
def rs_R003_ueqv_R003YY_partial_08_0287 : Poly :=
[
  term ((2288 : Rat) / 35) [(0, 1), (6, 1), (13, 2), (16, 1)],
  term ((2288 : Rat) / 35) [(1, 1), (7, 1), (13, 2), (16, 1)],
  term ((-1144 : Rat) / 35) [(6, 2), (13, 2), (16, 1)],
  term ((-1144 : Rat) / 35) [(7, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 287 for generator 8. -/
theorem rs_R003_ueqv_R003YY_partial_08_0287_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_08_0287
        rs_R003_ueqv_R003YY_generator_08_0200_0287 =
      rs_R003_ueqv_R003YY_partial_08_0287 := by
  native_decide

/-- Partial products in this block. -/
def rs_R003_ueqv_R003YY_partials_08_0200_0287 : List Poly :=
[
  rs_R003_ueqv_R003YY_partial_08_0200,
  rs_R003_ueqv_R003YY_partial_08_0201,
  rs_R003_ueqv_R003YY_partial_08_0202,
  rs_R003_ueqv_R003YY_partial_08_0203,
  rs_R003_ueqv_R003YY_partial_08_0204,
  rs_R003_ueqv_R003YY_partial_08_0205,
  rs_R003_ueqv_R003YY_partial_08_0206,
  rs_R003_ueqv_R003YY_partial_08_0207,
  rs_R003_ueqv_R003YY_partial_08_0208,
  rs_R003_ueqv_R003YY_partial_08_0209,
  rs_R003_ueqv_R003YY_partial_08_0210,
  rs_R003_ueqv_R003YY_partial_08_0211,
  rs_R003_ueqv_R003YY_partial_08_0212,
  rs_R003_ueqv_R003YY_partial_08_0213,
  rs_R003_ueqv_R003YY_partial_08_0214,
  rs_R003_ueqv_R003YY_partial_08_0215,
  rs_R003_ueqv_R003YY_partial_08_0216,
  rs_R003_ueqv_R003YY_partial_08_0217,
  rs_R003_ueqv_R003YY_partial_08_0218,
  rs_R003_ueqv_R003YY_partial_08_0219,
  rs_R003_ueqv_R003YY_partial_08_0220,
  rs_R003_ueqv_R003YY_partial_08_0221,
  rs_R003_ueqv_R003YY_partial_08_0222,
  rs_R003_ueqv_R003YY_partial_08_0223,
  rs_R003_ueqv_R003YY_partial_08_0224,
  rs_R003_ueqv_R003YY_partial_08_0225,
  rs_R003_ueqv_R003YY_partial_08_0226,
  rs_R003_ueqv_R003YY_partial_08_0227,
  rs_R003_ueqv_R003YY_partial_08_0228,
  rs_R003_ueqv_R003YY_partial_08_0229,
  rs_R003_ueqv_R003YY_partial_08_0230,
  rs_R003_ueqv_R003YY_partial_08_0231,
  rs_R003_ueqv_R003YY_partial_08_0232,
  rs_R003_ueqv_R003YY_partial_08_0233,
  rs_R003_ueqv_R003YY_partial_08_0234,
  rs_R003_ueqv_R003YY_partial_08_0235,
  rs_R003_ueqv_R003YY_partial_08_0236,
  rs_R003_ueqv_R003YY_partial_08_0237,
  rs_R003_ueqv_R003YY_partial_08_0238,
  rs_R003_ueqv_R003YY_partial_08_0239,
  rs_R003_ueqv_R003YY_partial_08_0240,
  rs_R003_ueqv_R003YY_partial_08_0241,
  rs_R003_ueqv_R003YY_partial_08_0242,
  rs_R003_ueqv_R003YY_partial_08_0243,
  rs_R003_ueqv_R003YY_partial_08_0244,
  rs_R003_ueqv_R003YY_partial_08_0245,
  rs_R003_ueqv_R003YY_partial_08_0246,
  rs_R003_ueqv_R003YY_partial_08_0247,
  rs_R003_ueqv_R003YY_partial_08_0248,
  rs_R003_ueqv_R003YY_partial_08_0249,
  rs_R003_ueqv_R003YY_partial_08_0250,
  rs_R003_ueqv_R003YY_partial_08_0251,
  rs_R003_ueqv_R003YY_partial_08_0252,
  rs_R003_ueqv_R003YY_partial_08_0253,
  rs_R003_ueqv_R003YY_partial_08_0254,
  rs_R003_ueqv_R003YY_partial_08_0255,
  rs_R003_ueqv_R003YY_partial_08_0256,
  rs_R003_ueqv_R003YY_partial_08_0257,
  rs_R003_ueqv_R003YY_partial_08_0258,
  rs_R003_ueqv_R003YY_partial_08_0259,
  rs_R003_ueqv_R003YY_partial_08_0260,
  rs_R003_ueqv_R003YY_partial_08_0261,
  rs_R003_ueqv_R003YY_partial_08_0262,
  rs_R003_ueqv_R003YY_partial_08_0263,
  rs_R003_ueqv_R003YY_partial_08_0264,
  rs_R003_ueqv_R003YY_partial_08_0265,
  rs_R003_ueqv_R003YY_partial_08_0266,
  rs_R003_ueqv_R003YY_partial_08_0267,
  rs_R003_ueqv_R003YY_partial_08_0268,
  rs_R003_ueqv_R003YY_partial_08_0269,
  rs_R003_ueqv_R003YY_partial_08_0270,
  rs_R003_ueqv_R003YY_partial_08_0271,
  rs_R003_ueqv_R003YY_partial_08_0272,
  rs_R003_ueqv_R003YY_partial_08_0273,
  rs_R003_ueqv_R003YY_partial_08_0274,
  rs_R003_ueqv_R003YY_partial_08_0275,
  rs_R003_ueqv_R003YY_partial_08_0276,
  rs_R003_ueqv_R003YY_partial_08_0277,
  rs_R003_ueqv_R003YY_partial_08_0278,
  rs_R003_ueqv_R003YY_partial_08_0279,
  rs_R003_ueqv_R003YY_partial_08_0280,
  rs_R003_ueqv_R003YY_partial_08_0281,
  rs_R003_ueqv_R003YY_partial_08_0282,
  rs_R003_ueqv_R003YY_partial_08_0283,
  rs_R003_ueqv_R003YY_partial_08_0284,
  rs_R003_ueqv_R003YY_partial_08_0285,
  rs_R003_ueqv_R003YY_partial_08_0286,
  rs_R003_ueqv_R003YY_partial_08_0287
]

/-- Sum of partial products in this block. -/
def rs_R003_ueqv_R003YY_block_08_0200_0287 : Poly :=
[
  term ((-1152 : Rat) / 35) [(0, 1), (3, 3), (6, 1), (11, 1), (16, 1)],
  term ((216 : Rat) / 5) [(0, 1), (3, 3), (6, 1), (15, 1)],
  term ((-24 : Rat) / 5) [(0, 1), (3, 3), (6, 1), (15, 1), (16, 1)],
  term ((-221184 : Rat) / 7625) [(0, 1), (4, 1), (5, 1), (6, 1), (9, 1), (11, 1), (13, 1)],
  term ((-663552 : Rat) / 7625) [(0, 1), (4, 1), (5, 1), (6, 1), (9, 1), (13, 2)],
  term ((479232 : Rat) / 7625) [(0, 1), (4, 1), (5, 1), (6, 1), (9, 2), (13, 1)],
  term ((147456 : Rat) / 7625) [(0, 1), (4, 1), (5, 1), (6, 1), (12, 1), (13, 1)],
  term ((-73728 : Rat) / 7625) [(0, 1), (4, 1), (5, 1), (6, 1), (13, 1)],
  term ((-73728 : Rat) / 7625) [(0, 1), (4, 1), (6, 1), (7, 1), (12, 1), (13, 1)],
  term ((36864 : Rat) / 7625) [(0, 1), (4, 1), (6, 1), (7, 1), (13, 1)],
  term ((734208 : Rat) / 53375) [(0, 1), (4, 1), (6, 1), (9, 1), (10, 1), (13, 1)],
  term ((-25344 : Rat) / 427) [(0, 1), (4, 1), (6, 1), (9, 1), (11, 1), (13, 2)],
  term ((-216192 : Rat) / 10675) [(0, 1), (4, 1), (6, 1), (9, 1), (11, 2), (13, 1)],
  term ((303936 : Rat) / 53375) [(0, 1), (4, 1), (6, 1), (9, 1), (12, 1), (13, 1)],
  term ((-585216 : Rat) / 53375) [(0, 1), (4, 1), (6, 1), (9, 1), (13, 1)],
  term ((464256 : Rat) / 10675) [(0, 1), (4, 1), (6, 1), (9, 2), (11, 1), (13, 1)],
  term ((-199776 : Rat) / 53375) [(0, 1), (4, 1), (6, 1), (11, 1), (13, 1)],
  term ((-105312 : Rat) / 10675) [(0, 1), (4, 1), (6, 1), (13, 2)],
  term ((663552 : Rat) / 7625) [(0, 1), (4, 2), (6, 1), (9, 1), (11, 1), (13, 2)],
  term ((110592 : Rat) / 7625) [(0, 1), (4, 2), (6, 1), (9, 1), (11, 2), (13, 1)],
  term ((-202752 : Rat) / 7625) [(0, 1), (4, 2), (6, 1), (9, 1), (12, 1), (13, 1)],
  term ((147456 : Rat) / 7625) [(0, 1), (4, 2), (6, 1), (9, 1), (13, 1)],
  term ((-331776 : Rat) / 7625) [(0, 1), (4, 2), (6, 1), (9, 2), (11, 1), (13, 1)],
  term ((-27648 : Rat) / 7625) [(0, 1), (4, 2), (6, 1), (11, 1), (13, 1)],
  term ((156672 : Rat) / 7625) [(0, 1), (4, 2), (6, 1), (13, 2)],
  term ((43776 : Rat) / 7625) [(0, 1), (5, 1), (6, 1), (9, 1), (11, 1), (13, 1)],
  term ((48 : Rat) / 5) [(0, 1), (5, 1), (6, 1), (9, 1), (12, 1)],
  term ((-48 : Rat) / 5) [(0, 1), (5, 1), (6, 1), (9, 1), (12, 1), (14, 1)],
  term ((131328 : Rat) / 7625) [(0, 1), (5, 1), (6, 1), (9, 1), (13, 2)],
  term ((-94848 : Rat) / 7625) [(0, 1), (5, 1), (6, 1), (9, 2), (13, 1)],
  term ((-109056 : Rat) / 7625) [(0, 1), (5, 1), (6, 1), (12, 1), (13, 1)],
  term ((17928 : Rat) / 7625) [(0, 1), (5, 1), (6, 1), (13, 1)],
  term ((24 : Rat) / 5) [(0, 1), (5, 1), (6, 1), (13, 1), (14, 1)],
  term ((24 : Rat) / 5) [(0, 1), (6, 1), (7, 1), (9, 1)],
  term ((-48 : Rat) / 5) [(0, 1), (6, 1), (7, 1), (9, 1), (14, 1)],
  term ((54528 : Rat) / 7625) [(0, 1), (6, 1), (7, 1), (12, 1), (13, 1)],
  term ((-27264 : Rat) / 7625) [(0, 1), (6, 1), (7, 1), (13, 1)],
  term ((10322288 : Rat) / 53375) [(0, 1), (6, 1), (9, 1), (10, 1), (13, 1)],
  term ((-8448 : Rat) / 35) [(0, 1), (6, 1), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((2816 : Rat) / 35) [(0, 1), (6, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2288 : Rat) / 35) [(0, 1), (6, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-17743 : Rat) / 105) [(0, 1), (6, 1), (9, 1), (10, 1), (15, 1)],
  term ((121 : Rat) / 7) [(0, 1), (6, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((36836 : Rat) / 35) [(0, 1), (6, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-4548 : Rat) / 35) [(0, 1), (6, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1504896 : Rat) / 875) [(0, 1), (6, 1), (9, 1), (11, 1), (13, 2)],
  term ((-73728 : Rat) / 35) [(0, 1), (6, 1), (9, 1), (11, 1), (13, 2), (14, 1)],
  term ((24576 : Rat) / 35) [(0, 1), (6, 1), (9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-19968 : Rat) / 35) [(0, 1), (6, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((49666816 : Rat) / 53375) [(0, 1), (6, 1), (9, 1), (11, 2), (13, 1)],
  term ((-39936 : Rat) / 35) [(0, 1), (6, 1), (9, 1), (11, 2), (13, 1), (14, 1)],
  term ((13312 : Rat) / 35) [(0, 1), (6, 1), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-10816 : Rat) / 35) [(0, 1), (6, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((1174 : Rat) / 105) [(0, 1), (6, 1), (9, 1), (11, 2), (15, 1)],
  term ((-58 : Rat) / 7) [(0, 1), (6, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((2737296 : Rat) / 53375) [(0, 1), (6, 1), (9, 1), (12, 1), (13, 1)],
  term ((-1536 : Rat) / 35) [(0, 1), (6, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((512 : Rat) / 35) [(0, 1), (6, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-416 : Rat) / 35) [(0, 1), (6, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((2623 : Rat) / 35) [(0, 1), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((-191 : Rat) / 35) [(0, 1), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((7995032 : Rat) / 10675) [(0, 1), (6, 1), (9, 1), (13, 1)],
  term ((-4544 : Rat) / 7) [(0, 1), (6, 1), (9, 1), (13, 1), (14, 1)],
  term ((-3328 : Rat) / 35) [(0, 1), (6, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((2704 : Rat) / 35) [(0, 1), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-226 : Rat) / 21) [(0, 1), (6, 1), (9, 1), (15, 1)],
  term ((-66 : Rat) / 7) [(0, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-3464 : Rat) / 5) [(0, 1), (6, 1), (9, 2)],
  term ((-91722048 : Rat) / 53375) [(0, 1), (6, 1), (9, 2), (11, 1), (13, 1)],
  term ((73728 : Rat) / 35) [(0, 1), (6, 1), (9, 2), (11, 1), (13, 1), (14, 1)],
  term ((-24576 : Rat) / 35) [(0, 1), (6, 1), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((19968 : Rat) / 35) [(0, 1), (6, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-4192 : Rat) / 7) [(0, 1), (6, 1), (9, 2), (11, 1), (15, 1)],
  term ((2784 : Rat) / 35) [(0, 1), (6, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((3136 : Rat) / 5) [(0, 1), (6, 1), (9, 2), (14, 1)],
  term ((-4 : Rat) / 5) [(0, 1), (6, 1), (9, 2), (16, 1)],
  term ((961024 : Rat) / 10675) [(0, 1), (6, 1), (11, 1), (13, 1)],
  term ((-768 : Rat) / 7) [(0, 1), (6, 1), (11, 1), (13, 1), (14, 1)],
  term ((256 : Rat) / 7) [(0, 1), (6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-208 : Rat) / 7) [(0, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((2581 : Rat) / 210) [(0, 1), (6, 1), (11, 1), (15, 1)],
  term ((-143 : Rat) / 70) [(0, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((9857 : Rat) / 1050) [(0, 1), (6, 1), (13, 1), (15, 1)],
  term ((45 : Rat) / 14) [(0, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-10406344 : Rat) / 53375) [(0, 1), (6, 1), (13, 2)],
  term ((8448 : Rat) / 35) [(0, 1), (6, 1), (13, 2), (14, 1)],
  term ((-2816 : Rat) / 35) [(0, 1), (6, 1), (13, 2), (14, 1), (16, 1)],
  term ((2288 : Rat) / 35) [(0, 1), (6, 1), (13, 2), (16, 1)],
  term ((-1152 : Rat) / 35) [(1, 1), (3, 3), (7, 1), (11, 1), (16, 1)],
  term ((216 : Rat) / 5) [(1, 1), (3, 3), (7, 1), (15, 1)],
  term ((-24 : Rat) / 5) [(1, 1), (3, 3), (7, 1), (15, 1), (16, 1)],
  term ((-221184 : Rat) / 7625) [(1, 1), (4, 1), (5, 1), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-663552 : Rat) / 7625) [(1, 1), (4, 1), (5, 1), (7, 1), (9, 1), (13, 2)],
  term ((479232 : Rat) / 7625) [(1, 1), (4, 1), (5, 1), (7, 1), (9, 2), (13, 1)],
  term ((147456 : Rat) / 7625) [(1, 1), (4, 1), (5, 1), (7, 1), (12, 1), (13, 1)],
  term ((-73728 : Rat) / 7625) [(1, 1), (4, 1), (5, 1), (7, 1), (13, 1)],
  term ((734208 : Rat) / 53375) [(1, 1), (4, 1), (7, 1), (9, 1), (10, 1), (13, 1)],
  term ((-25344 : Rat) / 427) [(1, 1), (4, 1), (7, 1), (9, 1), (11, 1), (13, 2)],
  term ((-216192 : Rat) / 10675) [(1, 1), (4, 1), (7, 1), (9, 1), (11, 2), (13, 1)],
  term ((303936 : Rat) / 53375) [(1, 1), (4, 1), (7, 1), (9, 1), (12, 1), (13, 1)],
  term ((-585216 : Rat) / 53375) [(1, 1), (4, 1), (7, 1), (9, 1), (13, 1)],
  term ((464256 : Rat) / 10675) [(1, 1), (4, 1), (7, 1), (9, 2), (11, 1), (13, 1)],
  term ((-199776 : Rat) / 53375) [(1, 1), (4, 1), (7, 1), (11, 1), (13, 1)],
  term ((-105312 : Rat) / 10675) [(1, 1), (4, 1), (7, 1), (13, 2)],
  term ((-73728 : Rat) / 7625) [(1, 1), (4, 1), (7, 2), (12, 1), (13, 1)],
  term ((36864 : Rat) / 7625) [(1, 1), (4, 1), (7, 2), (13, 1)],
  term ((663552 : Rat) / 7625) [(1, 1), (4, 2), (7, 1), (9, 1), (11, 1), (13, 2)],
  term ((110592 : Rat) / 7625) [(1, 1), (4, 2), (7, 1), (9, 1), (11, 2), (13, 1)],
  term ((-202752 : Rat) / 7625) [(1, 1), (4, 2), (7, 1), (9, 1), (12, 1), (13, 1)],
  term ((147456 : Rat) / 7625) [(1, 1), (4, 2), (7, 1), (9, 1), (13, 1)],
  term ((-331776 : Rat) / 7625) [(1, 1), (4, 2), (7, 1), (9, 2), (11, 1), (13, 1)],
  term ((-27648 : Rat) / 7625) [(1, 1), (4, 2), (7, 1), (11, 1), (13, 1)],
  term ((156672 : Rat) / 7625) [(1, 1), (4, 2), (7, 1), (13, 2)],
  term ((43776 : Rat) / 7625) [(1, 1), (5, 1), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((48 : Rat) / 5) [(1, 1), (5, 1), (7, 1), (9, 1), (12, 1)],
  term ((-48 : Rat) / 5) [(1, 1), (5, 1), (7, 1), (9, 1), (12, 1), (14, 1)],
  term ((131328 : Rat) / 7625) [(1, 1), (5, 1), (7, 1), (9, 1), (13, 2)],
  term ((-94848 : Rat) / 7625) [(1, 1), (5, 1), (7, 1), (9, 2), (13, 1)],
  term ((-109056 : Rat) / 7625) [(1, 1), (5, 1), (7, 1), (12, 1), (13, 1)],
  term ((17928 : Rat) / 7625) [(1, 1), (5, 1), (7, 1), (13, 1)],
  term ((24 : Rat) / 5) [(1, 1), (5, 1), (7, 1), (13, 1), (14, 1)],
  term ((10322288 : Rat) / 53375) [(1, 1), (7, 1), (9, 1), (10, 1), (13, 1)],
  term ((-8448 : Rat) / 35) [(1, 1), (7, 1), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((2816 : Rat) / 35) [(1, 1), (7, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2288 : Rat) / 35) [(1, 1), (7, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-17743 : Rat) / 105) [(1, 1), (7, 1), (9, 1), (10, 1), (15, 1)],
  term ((121 : Rat) / 7) [(1, 1), (7, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((36836 : Rat) / 35) [(1, 1), (7, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-4548 : Rat) / 35) [(1, 1), (7, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1504896 : Rat) / 875) [(1, 1), (7, 1), (9, 1), (11, 1), (13, 2)],
  term ((-73728 : Rat) / 35) [(1, 1), (7, 1), (9, 1), (11, 1), (13, 2), (14, 1)],
  term ((24576 : Rat) / 35) [(1, 1), (7, 1), (9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-19968 : Rat) / 35) [(1, 1), (7, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((49666816 : Rat) / 53375) [(1, 1), (7, 1), (9, 1), (11, 2), (13, 1)],
  term ((-39936 : Rat) / 35) [(1, 1), (7, 1), (9, 1), (11, 2), (13, 1), (14, 1)],
  term ((13312 : Rat) / 35) [(1, 1), (7, 1), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-10816 : Rat) / 35) [(1, 1), (7, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((1174 : Rat) / 105) [(1, 1), (7, 1), (9, 1), (11, 2), (15, 1)],
  term ((-58 : Rat) / 7) [(1, 1), (7, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((2737296 : Rat) / 53375) [(1, 1), (7, 1), (9, 1), (12, 1), (13, 1)],
  term ((-1536 : Rat) / 35) [(1, 1), (7, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((512 : Rat) / 35) [(1, 1), (7, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-416 : Rat) / 35) [(1, 1), (7, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((2623 : Rat) / 35) [(1, 1), (7, 1), (9, 1), (12, 1), (15, 1)],
  term ((-191 : Rat) / 35) [(1, 1), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((7995032 : Rat) / 10675) [(1, 1), (7, 1), (9, 1), (13, 1)],
  term ((-4544 : Rat) / 7) [(1, 1), (7, 1), (9, 1), (13, 1), (14, 1)],
  term ((-3328 : Rat) / 35) [(1, 1), (7, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((2704 : Rat) / 35) [(1, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((-226 : Rat) / 21) [(1, 1), (7, 1), (9, 1), (15, 1)],
  term ((-66 : Rat) / 7) [(1, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-3464 : Rat) / 5) [(1, 1), (7, 1), (9, 2)],
  term ((-91722048 : Rat) / 53375) [(1, 1), (7, 1), (9, 2), (11, 1), (13, 1)],
  term ((73728 : Rat) / 35) [(1, 1), (7, 1), (9, 2), (11, 1), (13, 1), (14, 1)],
  term ((-24576 : Rat) / 35) [(1, 1), (7, 1), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((19968 : Rat) / 35) [(1, 1), (7, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-4192 : Rat) / 7) [(1, 1), (7, 1), (9, 2), (11, 1), (15, 1)],
  term ((2784 : Rat) / 35) [(1, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((3136 : Rat) / 5) [(1, 1), (7, 1), (9, 2), (14, 1)],
  term ((-4 : Rat) / 5) [(1, 1), (7, 1), (9, 2), (16, 1)],
  term ((961024 : Rat) / 10675) [(1, 1), (7, 1), (11, 1), (13, 1)],
  term ((-768 : Rat) / 7) [(1, 1), (7, 1), (11, 1), (13, 1), (14, 1)],
  term ((256 : Rat) / 7) [(1, 1), (7, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-208 : Rat) / 7) [(1, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((2581 : Rat) / 210) [(1, 1), (7, 1), (11, 1), (15, 1)],
  term ((-143 : Rat) / 70) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((9857 : Rat) / 1050) [(1, 1), (7, 1), (13, 1), (15, 1)],
  term ((45 : Rat) / 14) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-10406344 : Rat) / 53375) [(1, 1), (7, 1), (13, 2)],
  term ((8448 : Rat) / 35) [(1, 1), (7, 1), (13, 2), (14, 1)],
  term ((-2816 : Rat) / 35) [(1, 1), (7, 1), (13, 2), (14, 1), (16, 1)],
  term ((2288 : Rat) / 35) [(1, 1), (7, 1), (13, 2), (16, 1)],
  term ((24 : Rat) / 5) [(1, 1), (7, 2), (9, 1)],
  term ((-48 : Rat) / 5) [(1, 1), (7, 2), (9, 1), (14, 1)],
  term ((54528 : Rat) / 7625) [(1, 1), (7, 2), (12, 1), (13, 1)],
  term ((-27264 : Rat) / 7625) [(1, 1), (7, 2), (13, 1)],
  term ((576 : Rat) / 35) [(3, 3), (6, 2), (11, 1), (16, 1)],
  term ((-108 : Rat) / 5) [(3, 3), (6, 2), (15, 1)],
  term ((12 : Rat) / 5) [(3, 3), (6, 2), (15, 1), (16, 1)],
  term ((576 : Rat) / 35) [(3, 3), (7, 2), (11, 1), (16, 1)],
  term ((-108 : Rat) / 5) [(3, 3), (7, 2), (15, 1)],
  term ((12 : Rat) / 5) [(3, 3), (7, 2), (15, 1), (16, 1)],
  term ((110592 : Rat) / 7625) [(4, 1), (5, 1), (6, 2), (9, 1), (11, 1), (13, 1)],
  term ((331776 : Rat) / 7625) [(4, 1), (5, 1), (6, 2), (9, 1), (13, 2)],
  term ((-239616 : Rat) / 7625) [(4, 1), (5, 1), (6, 2), (9, 2), (13, 1)],
  term ((-73728 : Rat) / 7625) [(4, 1), (5, 1), (6, 2), (12, 1), (13, 1)],
  term ((36864 : Rat) / 7625) [(4, 1), (5, 1), (6, 2), (13, 1)],
  term ((110592 : Rat) / 7625) [(4, 1), (5, 1), (7, 2), (9, 1), (11, 1), (13, 1)],
  term ((331776 : Rat) / 7625) [(4, 1), (5, 1), (7, 2), (9, 1), (13, 2)],
  term ((-239616 : Rat) / 7625) [(4, 1), (5, 1), (7, 2), (9, 2), (13, 1)],
  term ((-73728 : Rat) / 7625) [(4, 1), (5, 1), (7, 2), (12, 1), (13, 1)],
  term ((36864 : Rat) / 7625) [(4, 1), (5, 1), (7, 2), (13, 1)],
  term ((36864 : Rat) / 7625) [(4, 1), (6, 2), (7, 1), (12, 1), (13, 1)],
  term ((-18432 : Rat) / 7625) [(4, 1), (6, 2), (7, 1), (13, 1)],
  term ((-367104 : Rat) / 53375) [(4, 1), (6, 2), (9, 1), (10, 1), (13, 1)],
  term ((12672 : Rat) / 427) [(4, 1), (6, 2), (9, 1), (11, 1), (13, 2)],
  term ((108096 : Rat) / 10675) [(4, 1), (6, 2), (9, 1), (11, 2), (13, 1)],
  term ((-151968 : Rat) / 53375) [(4, 1), (6, 2), (9, 1), (12, 1), (13, 1)],
  term ((292608 : Rat) / 53375) [(4, 1), (6, 2), (9, 1), (13, 1)],
  term ((-232128 : Rat) / 10675) [(4, 1), (6, 2), (9, 2), (11, 1), (13, 1)],
  term ((99888 : Rat) / 53375) [(4, 1), (6, 2), (11, 1), (13, 1)],
  term ((52656 : Rat) / 10675) [(4, 1), (6, 2), (13, 2)],
  term ((-367104 : Rat) / 53375) [(4, 1), (7, 2), (9, 1), (10, 1), (13, 1)],
  term ((12672 : Rat) / 427) [(4, 1), (7, 2), (9, 1), (11, 1), (13, 2)],
  term ((108096 : Rat) / 10675) [(4, 1), (7, 2), (9, 1), (11, 2), (13, 1)],
  term ((-151968 : Rat) / 53375) [(4, 1), (7, 2), (9, 1), (12, 1), (13, 1)],
  term ((292608 : Rat) / 53375) [(4, 1), (7, 2), (9, 1), (13, 1)],
  term ((-232128 : Rat) / 10675) [(4, 1), (7, 2), (9, 2), (11, 1), (13, 1)],
  term ((99888 : Rat) / 53375) [(4, 1), (7, 2), (11, 1), (13, 1)],
  term ((52656 : Rat) / 10675) [(4, 1), (7, 2), (13, 2)],
  term ((36864 : Rat) / 7625) [(4, 1), (7, 3), (12, 1), (13, 1)],
  term ((-18432 : Rat) / 7625) [(4, 1), (7, 3), (13, 1)],
  term ((-331776 : Rat) / 7625) [(4, 2), (6, 2), (9, 1), (11, 1), (13, 2)],
  term ((-55296 : Rat) / 7625) [(4, 2), (6, 2), (9, 1), (11, 2), (13, 1)],
  term ((101376 : Rat) / 7625) [(4, 2), (6, 2), (9, 1), (12, 1), (13, 1)],
  term ((-73728 : Rat) / 7625) [(4, 2), (6, 2), (9, 1), (13, 1)],
  term ((165888 : Rat) / 7625) [(4, 2), (6, 2), (9, 2), (11, 1), (13, 1)],
  term ((13824 : Rat) / 7625) [(4, 2), (6, 2), (11, 1), (13, 1)],
  term ((-78336 : Rat) / 7625) [(4, 2), (6, 2), (13, 2)],
  term ((-331776 : Rat) / 7625) [(4, 2), (7, 2), (9, 1), (11, 1), (13, 2)],
  term ((-55296 : Rat) / 7625) [(4, 2), (7, 2), (9, 1), (11, 2), (13, 1)],
  term ((101376 : Rat) / 7625) [(4, 2), (7, 2), (9, 1), (12, 1), (13, 1)],
  term ((-73728 : Rat) / 7625) [(4, 2), (7, 2), (9, 1), (13, 1)],
  term ((165888 : Rat) / 7625) [(4, 2), (7, 2), (9, 2), (11, 1), (13, 1)],
  term ((13824 : Rat) / 7625) [(4, 2), (7, 2), (11, 1), (13, 1)],
  term ((-78336 : Rat) / 7625) [(4, 2), (7, 2), (13, 2)],
  term ((-21888 : Rat) / 7625) [(5, 1), (6, 2), (9, 1), (11, 1), (13, 1)],
  term ((-24 : Rat) / 5) [(5, 1), (6, 2), (9, 1), (12, 1)],
  term ((24 : Rat) / 5) [(5, 1), (6, 2), (9, 1), (12, 1), (14, 1)],
  term ((-65664 : Rat) / 7625) [(5, 1), (6, 2), (9, 1), (13, 2)],
  term ((47424 : Rat) / 7625) [(5, 1), (6, 2), (9, 2), (13, 1)],
  term ((54528 : Rat) / 7625) [(5, 1), (6, 2), (12, 1), (13, 1)],
  term ((-8964 : Rat) / 7625) [(5, 1), (6, 2), (13, 1)],
  term ((-12 : Rat) / 5) [(5, 1), (6, 2), (13, 1), (14, 1)],
  term ((-21888 : Rat) / 7625) [(5, 1), (7, 2), (9, 1), (11, 1), (13, 1)],
  term ((-24 : Rat) / 5) [(5, 1), (7, 2), (9, 1), (12, 1)],
  term ((24 : Rat) / 5) [(5, 1), (7, 2), (9, 1), (12, 1), (14, 1)],
  term ((-65664 : Rat) / 7625) [(5, 1), (7, 2), (9, 1), (13, 2)],
  term ((47424 : Rat) / 7625) [(5, 1), (7, 2), (9, 2), (13, 1)],
  term ((54528 : Rat) / 7625) [(5, 1), (7, 2), (12, 1), (13, 1)],
  term ((-8964 : Rat) / 7625) [(5, 1), (7, 2), (13, 1)],
  term ((-12 : Rat) / 5) [(5, 1), (7, 2), (13, 1), (14, 1)],
  term ((-12 : Rat) / 5) [(6, 2), (7, 1), (9, 1)],
  term ((24 : Rat) / 5) [(6, 2), (7, 1), (9, 1), (14, 1)],
  term ((-27264 : Rat) / 7625) [(6, 2), (7, 1), (12, 1), (13, 1)],
  term ((13632 : Rat) / 7625) [(6, 2), (7, 1), (13, 1)],
  term ((-5161144 : Rat) / 53375) [(6, 2), (9, 1), (10, 1), (13, 1)],
  term ((4224 : Rat) / 35) [(6, 2), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((-1408 : Rat) / 35) [(6, 2), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((1144 : Rat) / 35) [(6, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((17743 : Rat) / 210) [(6, 2), (9, 1), (10, 1), (15, 1)],
  term ((-121 : Rat) / 14) [(6, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-18418 : Rat) / 35) [(6, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((2274 : Rat) / 35) [(6, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-752448 : Rat) / 875) [(6, 2), (9, 1), (11, 1), (13, 2)],
  term ((36864 : Rat) / 35) [(6, 2), (9, 1), (11, 1), (13, 2), (14, 1)],
  term ((-12288 : Rat) / 35) [(6, 2), (9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((9984 : Rat) / 35) [(6, 2), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-24833408 : Rat) / 53375) [(6, 2), (9, 1), (11, 2), (13, 1)],
  term ((19968 : Rat) / 35) [(6, 2), (9, 1), (11, 2), (13, 1), (14, 1)],
  term ((-6656 : Rat) / 35) [(6, 2), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((5408 : Rat) / 35) [(6, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-587 : Rat) / 105) [(6, 2), (9, 1), (11, 2), (15, 1)],
  term ((29 : Rat) / 7) [(6, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-1368648 : Rat) / 53375) [(6, 2), (9, 1), (12, 1), (13, 1)],
  term ((768 : Rat) / 35) [(6, 2), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-256 : Rat) / 35) [(6, 2), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((208 : Rat) / 35) [(6, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-2623 : Rat) / 70) [(6, 2), (9, 1), (12, 1), (15, 1)],
  term ((191 : Rat) / 70) [(6, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3997516 : Rat) / 10675) [(6, 2), (9, 1), (13, 1)],
  term ((2272 : Rat) / 7) [(6, 2), (9, 1), (13, 1), (14, 1)],
  term ((1664 : Rat) / 35) [(6, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1352 : Rat) / 35) [(6, 2), (9, 1), (13, 1), (16, 1)],
  term ((113 : Rat) / 21) [(6, 2), (9, 1), (15, 1)],
  term ((33 : Rat) / 7) [(6, 2), (9, 1), (15, 1), (16, 1)],
  term ((1732 : Rat) / 5) [(6, 2), (9, 2)],
  term ((45861024 : Rat) / 53375) [(6, 2), (9, 2), (11, 1), (13, 1)],
  term ((-36864 : Rat) / 35) [(6, 2), (9, 2), (11, 1), (13, 1), (14, 1)],
  term ((12288 : Rat) / 35) [(6, 2), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-9984 : Rat) / 35) [(6, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((2096 : Rat) / 7) [(6, 2), (9, 2), (11, 1), (15, 1)],
  term ((-1392 : Rat) / 35) [(6, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1568 : Rat) / 5) [(6, 2), (9, 2), (14, 1)],
  term ((2 : Rat) / 5) [(6, 2), (9, 2), (16, 1)],
  term ((-480512 : Rat) / 10675) [(6, 2), (11, 1), (13, 1)],
  term ((384 : Rat) / 7) [(6, 2), (11, 1), (13, 1), (14, 1)],
  term ((-128 : Rat) / 7) [(6, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((104 : Rat) / 7) [(6, 2), (11, 1), (13, 1), (16, 1)],
  term ((-2581 : Rat) / 420) [(6, 2), (11, 1), (15, 1)],
  term ((143 : Rat) / 140) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-9857 : Rat) / 2100) [(6, 2), (13, 1), (15, 1)],
  term ((-45 : Rat) / 28) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((5203172 : Rat) / 53375) [(6, 2), (13, 2)],
  term ((-4224 : Rat) / 35) [(6, 2), (13, 2), (14, 1)],
  term ((1408 : Rat) / 35) [(6, 2), (13, 2), (14, 1), (16, 1)],
  term ((-1144 : Rat) / 35) [(6, 2), (13, 2), (16, 1)],
  term ((-5161144 : Rat) / 53375) [(7, 2), (9, 1), (10, 1), (13, 1)],
  term ((4224 : Rat) / 35) [(7, 2), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((-1408 : Rat) / 35) [(7, 2), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((1144 : Rat) / 35) [(7, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((17743 : Rat) / 210) [(7, 2), (9, 1), (10, 1), (15, 1)],
  term ((-121 : Rat) / 14) [(7, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-18418 : Rat) / 35) [(7, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((2274 : Rat) / 35) [(7, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-752448 : Rat) / 875) [(7, 2), (9, 1), (11, 1), (13, 2)],
  term ((36864 : Rat) / 35) [(7, 2), (9, 1), (11, 1), (13, 2), (14, 1)],
  term ((-12288 : Rat) / 35) [(7, 2), (9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((9984 : Rat) / 35) [(7, 2), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-24833408 : Rat) / 53375) [(7, 2), (9, 1), (11, 2), (13, 1)],
  term ((19968 : Rat) / 35) [(7, 2), (9, 1), (11, 2), (13, 1), (14, 1)],
  term ((-6656 : Rat) / 35) [(7, 2), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((5408 : Rat) / 35) [(7, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-587 : Rat) / 105) [(7, 2), (9, 1), (11, 2), (15, 1)],
  term ((29 : Rat) / 7) [(7, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-1368648 : Rat) / 53375) [(7, 2), (9, 1), (12, 1), (13, 1)],
  term ((768 : Rat) / 35) [(7, 2), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-256 : Rat) / 35) [(7, 2), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((208 : Rat) / 35) [(7, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-2623 : Rat) / 70) [(7, 2), (9, 1), (12, 1), (15, 1)],
  term ((191 : Rat) / 70) [(7, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3997516 : Rat) / 10675) [(7, 2), (9, 1), (13, 1)],
  term ((2272 : Rat) / 7) [(7, 2), (9, 1), (13, 1), (14, 1)],
  term ((1664 : Rat) / 35) [(7, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1352 : Rat) / 35) [(7, 2), (9, 1), (13, 1), (16, 1)],
  term ((113 : Rat) / 21) [(7, 2), (9, 1), (15, 1)],
  term ((33 : Rat) / 7) [(7, 2), (9, 1), (15, 1), (16, 1)],
  term ((1732 : Rat) / 5) [(7, 2), (9, 2)],
  term ((45861024 : Rat) / 53375) [(7, 2), (9, 2), (11, 1), (13, 1)],
  term ((-36864 : Rat) / 35) [(7, 2), (9, 2), (11, 1), (13, 1), (14, 1)],
  term ((12288 : Rat) / 35) [(7, 2), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-9984 : Rat) / 35) [(7, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((2096 : Rat) / 7) [(7, 2), (9, 2), (11, 1), (15, 1)],
  term ((-1392 : Rat) / 35) [(7, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1568 : Rat) / 5) [(7, 2), (9, 2), (14, 1)],
  term ((2 : Rat) / 5) [(7, 2), (9, 2), (16, 1)],
  term ((-480512 : Rat) / 10675) [(7, 2), (11, 1), (13, 1)],
  term ((384 : Rat) / 7) [(7, 2), (11, 1), (13, 1), (14, 1)],
  term ((-128 : Rat) / 7) [(7, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((104 : Rat) / 7) [(7, 2), (11, 1), (13, 1), (16, 1)],
  term ((-2581 : Rat) / 420) [(7, 2), (11, 1), (15, 1)],
  term ((143 : Rat) / 140) [(7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-9857 : Rat) / 2100) [(7, 2), (13, 1), (15, 1)],
  term ((-45 : Rat) / 28) [(7, 2), (13, 1), (15, 1), (16, 1)],
  term ((5203172 : Rat) / 53375) [(7, 2), (13, 2)],
  term ((-4224 : Rat) / 35) [(7, 2), (13, 2), (14, 1)],
  term ((1408 : Rat) / 35) [(7, 2), (13, 2), (14, 1), (16, 1)],
  term ((-1144 : Rat) / 35) [(7, 2), (13, 2), (16, 1)],
  term ((-12 : Rat) / 5) [(7, 3), (9, 1)],
  term ((24 : Rat) / 5) [(7, 3), (9, 1), (14, 1)],
  term ((-27264 : Rat) / 7625) [(7, 3), (12, 1), (13, 1)],
  term ((13632 : Rat) / 7625) [(7, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 8, terms 200 through 287. -/
theorem rs_R003_ueqv_R003YY_block_08_0200_0287_valid :
    checkProductSumEq rs_R003_ueqv_R003YY_partials_08_0200_0287
      rs_R003_ueqv_R003YY_block_08_0200_0287 = true := by
  native_decide

end R003UeqvR003YYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
