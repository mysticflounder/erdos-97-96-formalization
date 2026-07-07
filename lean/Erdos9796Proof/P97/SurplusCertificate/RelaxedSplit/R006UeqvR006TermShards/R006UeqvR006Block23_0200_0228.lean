/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R006:u=v:R006, term block 23:200-228

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R006UeqvR006TermShards

/-- Generator polynomial 23 for relaxed split surplus certificate `R006:u=v:R006`. -/
def rs_R006_ueqv_R006_generator_23_0200_0228 : Poly :=
[
  term (2 : Rat) [(8, 1), (10, 1)],
  term (-1 : Rat) [(8, 2)],
  term (2 : Rat) [(9, 1), (11, 1)],
  term (-1 : Rat) [(9, 2)]
]

/-- Coefficient term 200 from coefficient polynomial 23. -/
def rs_R006_ueqv_R006_coefficient_23_0200 : Poly :=
[
  term ((864 : Rat) / 5) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 200 for generator 23. -/
def rs_R006_ueqv_R006_partial_23_0200 : Poly :=
[
  term ((1728 : Rat) / 5) [(8, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-864 : Rat) / 5) [(8, 2), (9, 1), (12, 1), (15, 1)],
  term ((1728 : Rat) / 5) [(9, 2), (11, 1), (12, 1), (15, 1)],
  term ((-864 : Rat) / 5) [(9, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 23. -/
theorem rs_R006_ueqv_R006_partial_23_0200_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_23_0200
        rs_R006_ueqv_R006_generator_23_0200_0228 =
      rs_R006_ueqv_R006_partial_23_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 23. -/
def rs_R006_ueqv_R006_coefficient_23_0201 : Poly :=
[
  term ((-288 : Rat) / 5) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 201 for generator 23. -/
def rs_R006_ueqv_R006_partial_23_0201 : Poly :=
[
  term ((-576 : Rat) / 5) [(8, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((288 : Rat) / 5) [(8, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-576 : Rat) / 5) [(9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((288 : Rat) / 5) [(9, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 23. -/
theorem rs_R006_ueqv_R006_partial_23_0201_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_23_0201
        rs_R006_ueqv_R006_generator_23_0200_0228 =
      rs_R006_ueqv_R006_partial_23_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 23. -/
def rs_R006_ueqv_R006_coefficient_23_0202 : Poly :=
[
  term ((-432 : Rat) / 7) [(9, 1), (13, 1)]
]

/-- Partial product 202 for generator 23. -/
def rs_R006_ueqv_R006_partial_23_0202 : Poly :=
[
  term ((-864 : Rat) / 7) [(8, 1), (9, 1), (10, 1), (13, 1)],
  term ((432 : Rat) / 7) [(8, 2), (9, 1), (13, 1)],
  term ((-864 : Rat) / 7) [(9, 2), (11, 1), (13, 1)],
  term ((432 : Rat) / 7) [(9, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 23. -/
theorem rs_R006_ueqv_R006_partial_23_0202_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_23_0202
        rs_R006_ueqv_R006_generator_23_0200_0228 =
      rs_R006_ueqv_R006_partial_23_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 23. -/
def rs_R006_ueqv_R006_coefficient_23_0203 : Poly :=
[
  term ((648 : Rat) / 5) [(9, 1), (13, 1), (14, 1)]
]

/-- Partial product 203 for generator 23. -/
def rs_R006_ueqv_R006_partial_23_0203 : Poly :=
[
  term ((1296 : Rat) / 5) [(8, 1), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((-648 : Rat) / 5) [(8, 2), (9, 1), (13, 1), (14, 1)],
  term ((1296 : Rat) / 5) [(9, 2), (11, 1), (13, 1), (14, 1)],
  term ((-648 : Rat) / 5) [(9, 3), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 23. -/
theorem rs_R006_ueqv_R006_partial_23_0203_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_23_0203
        rs_R006_ueqv_R006_generator_23_0200_0228 =
      rs_R006_ueqv_R006_partial_23_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 23. -/
def rs_R006_ueqv_R006_coefficient_23_0204 : Poly :=
[
  term ((-216 : Rat) / 5) [(9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 204 for generator 23. -/
def rs_R006_ueqv_R006_partial_23_0204 : Poly :=
[
  term ((-432 : Rat) / 5) [(8, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((216 : Rat) / 5) [(8, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-432 : Rat) / 5) [(9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((216 : Rat) / 5) [(9, 3), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 23. -/
theorem rs_R006_ueqv_R006_partial_23_0204_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_23_0204
        rs_R006_ueqv_R006_generator_23_0200_0228 =
      rs_R006_ueqv_R006_partial_23_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 23. -/
def rs_R006_ueqv_R006_coefficient_23_0205 : Poly :=
[
  term ((108 : Rat) / 5) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 205 for generator 23. -/
def rs_R006_ueqv_R006_partial_23_0205 : Poly :=
[
  term ((216 : Rat) / 5) [(8, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-108 : Rat) / 5) [(8, 2), (9, 1), (13, 1), (16, 1)],
  term ((216 : Rat) / 5) [(9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-108 : Rat) / 5) [(9, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 23. -/
theorem rs_R006_ueqv_R006_partial_23_0205_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_23_0205
        rs_R006_ueqv_R006_generator_23_0200_0228 =
      rs_R006_ueqv_R006_partial_23_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 23. -/
def rs_R006_ueqv_R006_coefficient_23_0206 : Poly :=
[
  term ((-648 : Rat) / 5) [(9, 1), (15, 1)]
]

/-- Partial product 206 for generator 23. -/
def rs_R006_ueqv_R006_partial_23_0206 : Poly :=
[
  term ((-1296 : Rat) / 5) [(8, 1), (9, 1), (10, 1), (15, 1)],
  term ((648 : Rat) / 5) [(8, 2), (9, 1), (15, 1)],
  term ((-1296 : Rat) / 5) [(9, 2), (11, 1), (15, 1)],
  term ((648 : Rat) / 5) [(9, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 23. -/
theorem rs_R006_ueqv_R006_partial_23_0206_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_23_0206
        rs_R006_ueqv_R006_generator_23_0200_0228 =
      rs_R006_ueqv_R006_partial_23_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 23. -/
def rs_R006_ueqv_R006_coefficient_23_0207 : Poly :=
[
  term ((216 : Rat) / 5) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 207 for generator 23. -/
def rs_R006_ueqv_R006_partial_23_0207 : Poly :=
[
  term ((432 : Rat) / 5) [(8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-216 : Rat) / 5) [(8, 2), (9, 1), (15, 1), (16, 1)],
  term ((432 : Rat) / 5) [(9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-216 : Rat) / 5) [(9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 23. -/
theorem rs_R006_ueqv_R006_partial_23_0207_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_23_0207
        rs_R006_ueqv_R006_generator_23_0200_0228 =
      rs_R006_ueqv_R006_partial_23_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 23. -/
def rs_R006_ueqv_R006_coefficient_23_0208 : Poly :=
[
  term ((6492 : Rat) / 35) [(11, 1), (12, 1), (13, 1)]
]

/-- Partial product 208 for generator 23. -/
def rs_R006_ueqv_R006_partial_23_0208 : Poly :=
[
  term ((12984 : Rat) / 35) [(8, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((-6492 : Rat) / 35) [(8, 2), (11, 1), (12, 1), (13, 1)],
  term ((12984 : Rat) / 35) [(9, 1), (11, 2), (12, 1), (13, 1)],
  term ((-6492 : Rat) / 35) [(9, 2), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 23. -/
theorem rs_R006_ueqv_R006_partial_23_0208_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_23_0208
        rs_R006_ueqv_R006_generator_23_0200_0228 =
      rs_R006_ueqv_R006_partial_23_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 23. -/
def rs_R006_ueqv_R006_coefficient_23_0209 : Poly :=
[
  term ((-1872 : Rat) / 5) [(11, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 209 for generator 23. -/
def rs_R006_ueqv_R006_partial_23_0209 : Poly :=
[
  term ((-3744 : Rat) / 5) [(8, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((1872 : Rat) / 5) [(8, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-3744 : Rat) / 5) [(9, 1), (11, 2), (12, 1), (13, 1), (14, 1)],
  term ((1872 : Rat) / 5) [(9, 2), (11, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 23. -/
theorem rs_R006_ueqv_R006_partial_23_0209_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_23_0209
        rs_R006_ueqv_R006_generator_23_0200_0228 =
      rs_R006_ueqv_R006_partial_23_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 23. -/
def rs_R006_ueqv_R006_coefficient_23_0210 : Poly :=
[
  term ((624 : Rat) / 5) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 210 for generator 23. -/
def rs_R006_ueqv_R006_partial_23_0210 : Poly :=
[
  term ((1248 : Rat) / 5) [(8, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-624 : Rat) / 5) [(8, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((1248 : Rat) / 5) [(9, 1), (11, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-624 : Rat) / 5) [(9, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 23. -/
theorem rs_R006_ueqv_R006_partial_23_0210_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_23_0210
        rs_R006_ueqv_R006_generator_23_0200_0228 =
      rs_R006_ueqv_R006_partial_23_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 23. -/
def rs_R006_ueqv_R006_coefficient_23_0211 : Poly :=
[
  term ((-312 : Rat) / 5) [(11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 211 for generator 23. -/
def rs_R006_ueqv_R006_partial_23_0211 : Poly :=
[
  term ((-624 : Rat) / 5) [(8, 1), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((312 : Rat) / 5) [(8, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-624 : Rat) / 5) [(9, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((312 : Rat) / 5) [(9, 2), (11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 23. -/
theorem rs_R006_ueqv_R006_partial_23_0211_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_23_0211
        rs_R006_ueqv_R006_generator_23_0200_0228 =
      rs_R006_ueqv_R006_partial_23_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 23. -/
def rs_R006_ueqv_R006_coefficient_23_0212 : Poly :=
[
  term ((1872 : Rat) / 5) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 212 for generator 23. -/
def rs_R006_ueqv_R006_partial_23_0212 : Poly :=
[
  term ((3744 : Rat) / 5) [(8, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-1872 : Rat) / 5) [(8, 2), (11, 1), (12, 1), (15, 1)],
  term ((3744 : Rat) / 5) [(9, 1), (11, 2), (12, 1), (15, 1)],
  term ((-1872 : Rat) / 5) [(9, 2), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 23. -/
theorem rs_R006_ueqv_R006_partial_23_0212_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_23_0212
        rs_R006_ueqv_R006_generator_23_0200_0228 =
      rs_R006_ueqv_R006_partial_23_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 23. -/
def rs_R006_ueqv_R006_coefficient_23_0213 : Poly :=
[
  term ((-624 : Rat) / 5) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 213 for generator 23. -/
def rs_R006_ueqv_R006_partial_23_0213 : Poly :=
[
  term ((-1248 : Rat) / 5) [(8, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((624 : Rat) / 5) [(8, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1248 : Rat) / 5) [(9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((624 : Rat) / 5) [(9, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 23. -/
theorem rs_R006_ueqv_R006_partial_23_0213_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_23_0213
        rs_R006_ueqv_R006_generator_23_0200_0228 =
      rs_R006_ueqv_R006_partial_23_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 23. -/
def rs_R006_ueqv_R006_coefficient_23_0214 : Poly :=
[
  term ((-4758 : Rat) / 35) [(11, 1), (13, 1)]
]

/-- Partial product 214 for generator 23. -/
def rs_R006_ueqv_R006_partial_23_0214 : Poly :=
[
  term ((-9516 : Rat) / 35) [(8, 1), (10, 1), (11, 1), (13, 1)],
  term ((4758 : Rat) / 35) [(8, 2), (11, 1), (13, 1)],
  term ((-9516 : Rat) / 35) [(9, 1), (11, 2), (13, 1)],
  term ((4758 : Rat) / 35) [(9, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 23. -/
theorem rs_R006_ueqv_R006_partial_23_0214_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_23_0214
        rs_R006_ueqv_R006_generator_23_0200_0228 =
      rs_R006_ueqv_R006_partial_23_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 23. -/
def rs_R006_ueqv_R006_coefficient_23_0215 : Poly :=
[
  term ((1368 : Rat) / 5) [(11, 1), (13, 1), (14, 1)]
]

/-- Partial product 215 for generator 23. -/
def rs_R006_ueqv_R006_partial_23_0215 : Poly :=
[
  term ((2736 : Rat) / 5) [(8, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-1368 : Rat) / 5) [(8, 2), (11, 1), (13, 1), (14, 1)],
  term ((2736 : Rat) / 5) [(9, 1), (11, 2), (13, 1), (14, 1)],
  term ((-1368 : Rat) / 5) [(9, 2), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 23. -/
theorem rs_R006_ueqv_R006_partial_23_0215_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_23_0215
        rs_R006_ueqv_R006_generator_23_0200_0228 =
      rs_R006_ueqv_R006_partial_23_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 23. -/
def rs_R006_ueqv_R006_coefficient_23_0216 : Poly :=
[
  term ((-456 : Rat) / 5) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 216 for generator 23. -/
def rs_R006_ueqv_R006_partial_23_0216 : Poly :=
[
  term ((-912 : Rat) / 5) [(8, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((456 : Rat) / 5) [(8, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-912 : Rat) / 5) [(9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((456 : Rat) / 5) [(9, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 23. -/
theorem rs_R006_ueqv_R006_partial_23_0216_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_23_0216
        rs_R006_ueqv_R006_generator_23_0200_0228 =
      rs_R006_ueqv_R006_partial_23_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 23. -/
def rs_R006_ueqv_R006_coefficient_23_0217 : Poly :=
[
  term ((228 : Rat) / 5) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 217 for generator 23. -/
def rs_R006_ueqv_R006_partial_23_0217 : Poly :=
[
  term ((456 : Rat) / 5) [(8, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-228 : Rat) / 5) [(8, 2), (11, 1), (13, 1), (16, 1)],
  term ((456 : Rat) / 5) [(9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-228 : Rat) / 5) [(9, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 23. -/
theorem rs_R006_ueqv_R006_partial_23_0217_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_23_0217
        rs_R006_ueqv_R006_generator_23_0200_0228 =
      rs_R006_ueqv_R006_partial_23_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 23. -/
def rs_R006_ueqv_R006_coefficient_23_0218 : Poly :=
[
  term ((-1368 : Rat) / 5) [(11, 1), (15, 1)]
]

/-- Partial product 218 for generator 23. -/
def rs_R006_ueqv_R006_partial_23_0218 : Poly :=
[
  term ((-2736 : Rat) / 5) [(8, 1), (10, 1), (11, 1), (15, 1)],
  term ((1368 : Rat) / 5) [(8, 2), (11, 1), (15, 1)],
  term ((-2736 : Rat) / 5) [(9, 1), (11, 2), (15, 1)],
  term ((1368 : Rat) / 5) [(9, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 23. -/
theorem rs_R006_ueqv_R006_partial_23_0218_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_23_0218
        rs_R006_ueqv_R006_generator_23_0200_0228 =
      rs_R006_ueqv_R006_partial_23_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 23. -/
def rs_R006_ueqv_R006_coefficient_23_0219 : Poly :=
[
  term ((456 : Rat) / 5) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 219 for generator 23. -/
def rs_R006_ueqv_R006_partial_23_0219 : Poly :=
[
  term ((912 : Rat) / 5) [(8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-456 : Rat) / 5) [(8, 2), (11, 1), (15, 1), (16, 1)],
  term ((912 : Rat) / 5) [(9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-456 : Rat) / 5) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 23. -/
theorem rs_R006_ueqv_R006_partial_23_0219_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_23_0219
        rs_R006_ueqv_R006_generator_23_0200_0228 =
      rs_R006_ueqv_R006_partial_23_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 23. -/
def rs_R006_ueqv_R006_coefficient_23_0220 : Poly :=
[
  term ((-276 : Rat) / 5) [(12, 1)]
]

/-- Partial product 220 for generator 23. -/
def rs_R006_ueqv_R006_partial_23_0220 : Poly :=
[
  term ((-552 : Rat) / 5) [(8, 1), (10, 1), (12, 1)],
  term ((276 : Rat) / 5) [(8, 2), (12, 1)],
  term ((-552 : Rat) / 5) [(9, 1), (11, 1), (12, 1)],
  term ((276 : Rat) / 5) [(9, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 23. -/
theorem rs_R006_ueqv_R006_partial_23_0220_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_23_0220
        rs_R006_ueqv_R006_generator_23_0200_0228 =
      rs_R006_ueqv_R006_partial_23_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 23. -/
def rs_R006_ueqv_R006_coefficient_23_0221 : Poly :=
[
  term ((216 : Rat) / 5) [(12, 1), (14, 1)]
]

/-- Partial product 221 for generator 23. -/
def rs_R006_ueqv_R006_partial_23_0221 : Poly :=
[
  term ((432 : Rat) / 5) [(8, 1), (10, 1), (12, 1), (14, 1)],
  term ((-216 : Rat) / 5) [(8, 2), (12, 1), (14, 1)],
  term ((432 : Rat) / 5) [(9, 1), (11, 1), (12, 1), (14, 1)],
  term ((-216 : Rat) / 5) [(9, 2), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 23. -/
theorem rs_R006_ueqv_R006_partial_23_0221_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_23_0221
        rs_R006_ueqv_R006_generator_23_0200_0228 =
      rs_R006_ueqv_R006_partial_23_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 23. -/
def rs_R006_ueqv_R006_coefficient_23_0222 : Poly :=
[
  term ((-504 : Rat) / 5) [(13, 1), (15, 1)]
]

/-- Partial product 222 for generator 23. -/
def rs_R006_ueqv_R006_partial_23_0222 : Poly :=
[
  term ((-1008 : Rat) / 5) [(8, 1), (10, 1), (13, 1), (15, 1)],
  term ((504 : Rat) / 5) [(8, 2), (13, 1), (15, 1)],
  term ((-1008 : Rat) / 5) [(9, 1), (11, 1), (13, 1), (15, 1)],
  term ((504 : Rat) / 5) [(9, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 23. -/
theorem rs_R006_ueqv_R006_partial_23_0222_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_23_0222
        rs_R006_ueqv_R006_generator_23_0200_0228 =
      rs_R006_ueqv_R006_partial_23_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 23. -/
def rs_R006_ueqv_R006_coefficient_23_0223 : Poly :=
[
  term ((168 : Rat) / 5) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 223 for generator 23. -/
def rs_R006_ueqv_R006_partial_23_0223 : Poly :=
[
  term ((336 : Rat) / 5) [(8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-168 : Rat) / 5) [(8, 2), (13, 1), (15, 1), (16, 1)],
  term ((336 : Rat) / 5) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-168 : Rat) / 5) [(9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 23. -/
theorem rs_R006_ueqv_R006_partial_23_0223_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_23_0223
        rs_R006_ueqv_R006_generator_23_0200_0228 =
      rs_R006_ueqv_R006_partial_23_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 23. -/
def rs_R006_ueqv_R006_coefficient_23_0224 : Poly :=
[
  term ((-258 : Rat) / 5) [(13, 2)]
]

/-- Partial product 224 for generator 23. -/
def rs_R006_ueqv_R006_partial_23_0224 : Poly :=
[
  term ((-516 : Rat) / 5) [(8, 1), (10, 1), (13, 2)],
  term ((258 : Rat) / 5) [(8, 2), (13, 2)],
  term ((-516 : Rat) / 5) [(9, 1), (11, 1), (13, 2)],
  term ((258 : Rat) / 5) [(9, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 23. -/
theorem rs_R006_ueqv_R006_partial_23_0224_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_23_0224
        rs_R006_ueqv_R006_generator_23_0200_0228 =
      rs_R006_ueqv_R006_partial_23_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 23. -/
def rs_R006_ueqv_R006_coefficient_23_0225 : Poly :=
[
  term ((504 : Rat) / 5) [(13, 2), (14, 1)]
]

/-- Partial product 225 for generator 23. -/
def rs_R006_ueqv_R006_partial_23_0225 : Poly :=
[
  term ((1008 : Rat) / 5) [(8, 1), (10, 1), (13, 2), (14, 1)],
  term ((-504 : Rat) / 5) [(8, 2), (13, 2), (14, 1)],
  term ((1008 : Rat) / 5) [(9, 1), (11, 1), (13, 2), (14, 1)],
  term ((-504 : Rat) / 5) [(9, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 23. -/
theorem rs_R006_ueqv_R006_partial_23_0225_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_23_0225
        rs_R006_ueqv_R006_generator_23_0200_0228 =
      rs_R006_ueqv_R006_partial_23_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 23. -/
def rs_R006_ueqv_R006_coefficient_23_0226 : Poly :=
[
  term ((-168 : Rat) / 5) [(13, 2), (14, 1), (16, 1)]
]

/-- Partial product 226 for generator 23. -/
def rs_R006_ueqv_R006_partial_23_0226 : Poly :=
[
  term ((-336 : Rat) / 5) [(8, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((168 : Rat) / 5) [(8, 2), (13, 2), (14, 1), (16, 1)],
  term ((-336 : Rat) / 5) [(9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((168 : Rat) / 5) [(9, 2), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 23. -/
theorem rs_R006_ueqv_R006_partial_23_0226_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_23_0226
        rs_R006_ueqv_R006_generator_23_0200_0228 =
      rs_R006_ueqv_R006_partial_23_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 23. -/
def rs_R006_ueqv_R006_coefficient_23_0227 : Poly :=
[
  term ((84 : Rat) / 5) [(13, 2), (16, 1)]
]

/-- Partial product 227 for generator 23. -/
def rs_R006_ueqv_R006_partial_23_0227 : Poly :=
[
  term ((168 : Rat) / 5) [(8, 1), (10, 1), (13, 2), (16, 1)],
  term ((-84 : Rat) / 5) [(8, 2), (13, 2), (16, 1)],
  term ((168 : Rat) / 5) [(9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-84 : Rat) / 5) [(9, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 23. -/
theorem rs_R006_ueqv_R006_partial_23_0227_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_23_0227
        rs_R006_ueqv_R006_generator_23_0200_0228 =
      rs_R006_ueqv_R006_partial_23_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 23. -/
def rs_R006_ueqv_R006_coefficient_23_0228 : Poly :=
[
  term ((-162 : Rat) / 5) [(14, 1)]
]

/-- Partial product 228 for generator 23. -/
def rs_R006_ueqv_R006_partial_23_0228 : Poly :=
[
  term ((-324 : Rat) / 5) [(8, 1), (10, 1), (14, 1)],
  term ((162 : Rat) / 5) [(8, 2), (14, 1)],
  term ((-324 : Rat) / 5) [(9, 1), (11, 1), (14, 1)],
  term ((162 : Rat) / 5) [(9, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 23. -/
theorem rs_R006_ueqv_R006_partial_23_0228_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_23_0228
        rs_R006_ueqv_R006_generator_23_0200_0228 =
      rs_R006_ueqv_R006_partial_23_0228 := by
  native_decide

/-- Partial products in this block. -/
def rs_R006_ueqv_R006_partials_23_0200_0228 : List Poly :=
[
  rs_R006_ueqv_R006_partial_23_0200,
  rs_R006_ueqv_R006_partial_23_0201,
  rs_R006_ueqv_R006_partial_23_0202,
  rs_R006_ueqv_R006_partial_23_0203,
  rs_R006_ueqv_R006_partial_23_0204,
  rs_R006_ueqv_R006_partial_23_0205,
  rs_R006_ueqv_R006_partial_23_0206,
  rs_R006_ueqv_R006_partial_23_0207,
  rs_R006_ueqv_R006_partial_23_0208,
  rs_R006_ueqv_R006_partial_23_0209,
  rs_R006_ueqv_R006_partial_23_0210,
  rs_R006_ueqv_R006_partial_23_0211,
  rs_R006_ueqv_R006_partial_23_0212,
  rs_R006_ueqv_R006_partial_23_0213,
  rs_R006_ueqv_R006_partial_23_0214,
  rs_R006_ueqv_R006_partial_23_0215,
  rs_R006_ueqv_R006_partial_23_0216,
  rs_R006_ueqv_R006_partial_23_0217,
  rs_R006_ueqv_R006_partial_23_0218,
  rs_R006_ueqv_R006_partial_23_0219,
  rs_R006_ueqv_R006_partial_23_0220,
  rs_R006_ueqv_R006_partial_23_0221,
  rs_R006_ueqv_R006_partial_23_0222,
  rs_R006_ueqv_R006_partial_23_0223,
  rs_R006_ueqv_R006_partial_23_0224,
  rs_R006_ueqv_R006_partial_23_0225,
  rs_R006_ueqv_R006_partial_23_0226,
  rs_R006_ueqv_R006_partial_23_0227,
  rs_R006_ueqv_R006_partial_23_0228
]

/-- Sum of partial products in this block. -/
def rs_R006_ueqv_R006_block_23_0200_0228 : Poly :=
[
  term ((1728 : Rat) / 5) [(8, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-576 : Rat) / 5) [(8, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-864 : Rat) / 7) [(8, 1), (9, 1), (10, 1), (13, 1)],
  term ((1296 : Rat) / 5) [(8, 1), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((-432 : Rat) / 5) [(8, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((216 : Rat) / 5) [(8, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-1296 : Rat) / 5) [(8, 1), (9, 1), (10, 1), (15, 1)],
  term ((432 : Rat) / 5) [(8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((12984 : Rat) / 35) [(8, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((-3744 : Rat) / 5) [(8, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((1248 : Rat) / 5) [(8, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-624 : Rat) / 5) [(8, 1), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((3744 : Rat) / 5) [(8, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-1248 : Rat) / 5) [(8, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-9516 : Rat) / 35) [(8, 1), (10, 1), (11, 1), (13, 1)],
  term ((2736 : Rat) / 5) [(8, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-912 : Rat) / 5) [(8, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((456 : Rat) / 5) [(8, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-2736 : Rat) / 5) [(8, 1), (10, 1), (11, 1), (15, 1)],
  term ((912 : Rat) / 5) [(8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-552 : Rat) / 5) [(8, 1), (10, 1), (12, 1)],
  term ((432 : Rat) / 5) [(8, 1), (10, 1), (12, 1), (14, 1)],
  term ((-1008 : Rat) / 5) [(8, 1), (10, 1), (13, 1), (15, 1)],
  term ((336 : Rat) / 5) [(8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-516 : Rat) / 5) [(8, 1), (10, 1), (13, 2)],
  term ((1008 : Rat) / 5) [(8, 1), (10, 1), (13, 2), (14, 1)],
  term ((-336 : Rat) / 5) [(8, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((168 : Rat) / 5) [(8, 1), (10, 1), (13, 2), (16, 1)],
  term ((-324 : Rat) / 5) [(8, 1), (10, 1), (14, 1)],
  term ((-864 : Rat) / 5) [(8, 2), (9, 1), (12, 1), (15, 1)],
  term ((288 : Rat) / 5) [(8, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((432 : Rat) / 7) [(8, 2), (9, 1), (13, 1)],
  term ((-648 : Rat) / 5) [(8, 2), (9, 1), (13, 1), (14, 1)],
  term ((216 : Rat) / 5) [(8, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-108 : Rat) / 5) [(8, 2), (9, 1), (13, 1), (16, 1)],
  term ((648 : Rat) / 5) [(8, 2), (9, 1), (15, 1)],
  term ((-216 : Rat) / 5) [(8, 2), (9, 1), (15, 1), (16, 1)],
  term ((-6492 : Rat) / 35) [(8, 2), (11, 1), (12, 1), (13, 1)],
  term ((1872 : Rat) / 5) [(8, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-624 : Rat) / 5) [(8, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((312 : Rat) / 5) [(8, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1872 : Rat) / 5) [(8, 2), (11, 1), (12, 1), (15, 1)],
  term ((624 : Rat) / 5) [(8, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((4758 : Rat) / 35) [(8, 2), (11, 1), (13, 1)],
  term ((-1368 : Rat) / 5) [(8, 2), (11, 1), (13, 1), (14, 1)],
  term ((456 : Rat) / 5) [(8, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-228 : Rat) / 5) [(8, 2), (11, 1), (13, 1), (16, 1)],
  term ((1368 : Rat) / 5) [(8, 2), (11, 1), (15, 1)],
  term ((-456 : Rat) / 5) [(8, 2), (11, 1), (15, 1), (16, 1)],
  term ((276 : Rat) / 5) [(8, 2), (12, 1)],
  term ((-216 : Rat) / 5) [(8, 2), (12, 1), (14, 1)],
  term ((504 : Rat) / 5) [(8, 2), (13, 1), (15, 1)],
  term ((-168 : Rat) / 5) [(8, 2), (13, 1), (15, 1), (16, 1)],
  term ((258 : Rat) / 5) [(8, 2), (13, 2)],
  term ((-504 : Rat) / 5) [(8, 2), (13, 2), (14, 1)],
  term ((168 : Rat) / 5) [(8, 2), (13, 2), (14, 1), (16, 1)],
  term ((-84 : Rat) / 5) [(8, 2), (13, 2), (16, 1)],
  term ((162 : Rat) / 5) [(8, 2), (14, 1)],
  term ((-552 : Rat) / 5) [(9, 1), (11, 1), (12, 1)],
  term ((432 : Rat) / 5) [(9, 1), (11, 1), (12, 1), (14, 1)],
  term ((-1008 : Rat) / 5) [(9, 1), (11, 1), (13, 1), (15, 1)],
  term ((336 : Rat) / 5) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-516 : Rat) / 5) [(9, 1), (11, 1), (13, 2)],
  term ((1008 : Rat) / 5) [(9, 1), (11, 1), (13, 2), (14, 1)],
  term ((-336 : Rat) / 5) [(9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((168 : Rat) / 5) [(9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-324 : Rat) / 5) [(9, 1), (11, 1), (14, 1)],
  term ((12984 : Rat) / 35) [(9, 1), (11, 2), (12, 1), (13, 1)],
  term ((-3744 : Rat) / 5) [(9, 1), (11, 2), (12, 1), (13, 1), (14, 1)],
  term ((1248 : Rat) / 5) [(9, 1), (11, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-624 : Rat) / 5) [(9, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((3744 : Rat) / 5) [(9, 1), (11, 2), (12, 1), (15, 1)],
  term ((-1248 : Rat) / 5) [(9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-9516 : Rat) / 35) [(9, 1), (11, 2), (13, 1)],
  term ((2736 : Rat) / 5) [(9, 1), (11, 2), (13, 1), (14, 1)],
  term ((-912 : Rat) / 5) [(9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((456 : Rat) / 5) [(9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-2736 : Rat) / 5) [(9, 1), (11, 2), (15, 1)],
  term ((912 : Rat) / 5) [(9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-6492 : Rat) / 35) [(9, 2), (11, 1), (12, 1), (13, 1)],
  term ((1872 : Rat) / 5) [(9, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-624 : Rat) / 5) [(9, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((312 : Rat) / 5) [(9, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-144 : Rat) / 5) [(9, 2), (11, 1), (12, 1), (15, 1)],
  term ((48 : Rat) / 5) [(9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((438 : Rat) / 35) [(9, 2), (11, 1), (13, 1)],
  term ((-72 : Rat) / 5) [(9, 2), (11, 1), (13, 1), (14, 1)],
  term ((24 : Rat) / 5) [(9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-12 : Rat) / 5) [(9, 2), (11, 1), (13, 1), (16, 1)],
  term ((72 : Rat) / 5) [(9, 2), (11, 1), (15, 1)],
  term ((-24 : Rat) / 5) [(9, 2), (11, 1), (15, 1), (16, 1)],
  term ((276 : Rat) / 5) [(9, 2), (12, 1)],
  term ((-216 : Rat) / 5) [(9, 2), (12, 1), (14, 1)],
  term ((504 : Rat) / 5) [(9, 2), (13, 1), (15, 1)],
  term ((-168 : Rat) / 5) [(9, 2), (13, 1), (15, 1), (16, 1)],
  term ((258 : Rat) / 5) [(9, 2), (13, 2)],
  term ((-504 : Rat) / 5) [(9, 2), (13, 2), (14, 1)],
  term ((168 : Rat) / 5) [(9, 2), (13, 2), (14, 1), (16, 1)],
  term ((-84 : Rat) / 5) [(9, 2), (13, 2), (16, 1)],
  term ((162 : Rat) / 5) [(9, 2), (14, 1)],
  term ((-864 : Rat) / 5) [(9, 3), (12, 1), (15, 1)],
  term ((288 : Rat) / 5) [(9, 3), (12, 1), (15, 1), (16, 1)],
  term ((432 : Rat) / 7) [(9, 3), (13, 1)],
  term ((-648 : Rat) / 5) [(9, 3), (13, 1), (14, 1)],
  term ((216 : Rat) / 5) [(9, 3), (13, 1), (14, 1), (16, 1)],
  term ((-108 : Rat) / 5) [(9, 3), (13, 1), (16, 1)],
  term ((648 : Rat) / 5) [(9, 3), (15, 1)],
  term ((-216 : Rat) / 5) [(9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 23, terms 200 through 228. -/
theorem rs_R006_ueqv_R006_block_23_0200_0228_valid :
    checkProductSumEq rs_R006_ueqv_R006_partials_23_0200_0228
      rs_R006_ueqv_R006_block_23_0200_0228 = true := by
  native_decide

end R006UeqvR006TermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
