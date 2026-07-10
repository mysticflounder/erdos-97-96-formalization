/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R003:u=v:R003YY, term block 2:200-282

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R003UeqvR003YYTermShards

/-- Generator polynomial 2 for relaxed split surplus certificate `R003:u=v:R003YY`. -/
def rs_R003_ueqv_R003YY_generator_02_0200_0282 : Poly :=
[
  term (1 : Rat) [(0, 2)],
  term (1 : Rat) [(1, 2)],
  term (-1 : Rat) [(10, 2)],
  term (-1 : Rat) [(11, 2)]
]

/-- Coefficient term 200 from coefficient polynomial 2. -/
def rs_R003_ueqv_R003YY_coefficient_02_0200 : Poly :=
[
  term ((243 : Rat) / 5) [(3, 1), (12, 1), (15, 1)]
]

/-- Partial product 200 for generator 2. -/
def rs_R003_ueqv_R003YY_partial_02_0200 : Poly :=
[
  term ((243 : Rat) / 5) [(0, 2), (3, 1), (12, 1), (15, 1)],
  term ((243 : Rat) / 5) [(1, 2), (3, 1), (12, 1), (15, 1)],
  term ((-243 : Rat) / 5) [(3, 1), (10, 2), (12, 1), (15, 1)],
  term ((-243 : Rat) / 5) [(3, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 2. -/
theorem rs_R003_ueqv_R003YY_partial_02_0200_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_02_0200
        rs_R003_ueqv_R003YY_generator_02_0200_0282 =
      rs_R003_ueqv_R003YY_partial_02_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 2. -/
def rs_R003_ueqv_R003YY_coefficient_02_0201 : Poly :=
[
  term ((-27 : Rat) / 5) [(3, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 201 for generator 2. -/
def rs_R003_ueqv_R003YY_partial_02_0201 : Poly :=
[
  term ((-27 : Rat) / 5) [(0, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-27 : Rat) / 5) [(1, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((27 : Rat) / 5) [(3, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((27 : Rat) / 5) [(3, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 2. -/
theorem rs_R003_ueqv_R003YY_partial_02_0201_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_02_0201
        rs_R003_ueqv_R003YY_generator_02_0200_0282 =
      rs_R003_ueqv_R003YY_partial_02_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 2. -/
def rs_R003_ueqv_R003YY_coefficient_02_0202 : Poly :=
[
  term ((432 : Rat) / 35) [(3, 1), (13, 1)]
]

/-- Partial product 202 for generator 2. -/
def rs_R003_ueqv_R003YY_partial_02_0202 : Poly :=
[
  term ((432 : Rat) / 35) [(0, 2), (3, 1), (13, 1)],
  term ((432 : Rat) / 35) [(1, 2), (3, 1), (13, 1)],
  term ((-432 : Rat) / 35) [(3, 1), (10, 2), (13, 1)],
  term ((-432 : Rat) / 35) [(3, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 2. -/
theorem rs_R003_ueqv_R003YY_partial_02_0202_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_02_0202
        rs_R003_ueqv_R003YY_generator_02_0200_0282 =
      rs_R003_ueqv_R003YY_partial_02_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 2. -/
def rs_R003_ueqv_R003YY_coefficient_02_0203 : Poly :=
[
  term ((216 : Rat) / 35) [(3, 1), (13, 1), (14, 1)]
]

/-- Partial product 203 for generator 2. -/
def rs_R003_ueqv_R003YY_partial_02_0203 : Poly :=
[
  term ((216 : Rat) / 35) [(0, 2), (3, 1), (13, 1), (14, 1)],
  term ((216 : Rat) / 35) [(1, 2), (3, 1), (13, 1), (14, 1)],
  term ((-216 : Rat) / 35) [(3, 1), (10, 2), (13, 1), (14, 1)],
  term ((-216 : Rat) / 35) [(3, 1), (11, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 2. -/
theorem rs_R003_ueqv_R003YY_partial_02_0203_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_02_0203
        rs_R003_ueqv_R003YY_generator_02_0200_0282 =
      rs_R003_ueqv_R003YY_partial_02_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 2. -/
def rs_R003_ueqv_R003YY_coefficient_02_0204 : Poly :=
[
  term ((-72 : Rat) / 35) [(3, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 204 for generator 2. -/
def rs_R003_ueqv_R003YY_partial_02_0204 : Poly :=
[
  term ((-72 : Rat) / 35) [(0, 2), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((-72 : Rat) / 35) [(1, 2), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((72 : Rat) / 35) [(3, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((72 : Rat) / 35) [(3, 1), (11, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 2. -/
theorem rs_R003_ueqv_R003YY_partial_02_0204_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_02_0204
        rs_R003_ueqv_R003YY_generator_02_0200_0282 =
      rs_R003_ueqv_R003YY_partial_02_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 2. -/
def rs_R003_ueqv_R003YY_coefficient_02_0205 : Poly :=
[
  term ((-144 : Rat) / 35) [(3, 1), (13, 1), (16, 1)]
]

/-- Partial product 205 for generator 2. -/
def rs_R003_ueqv_R003YY_partial_02_0205 : Poly :=
[
  term ((-144 : Rat) / 35) [(0, 2), (3, 1), (13, 1), (16, 1)],
  term ((-144 : Rat) / 35) [(1, 2), (3, 1), (13, 1), (16, 1)],
  term ((144 : Rat) / 35) [(3, 1), (10, 2), (13, 1), (16, 1)],
  term ((144 : Rat) / 35) [(3, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 2. -/
theorem rs_R003_ueqv_R003YY_partial_02_0205_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_02_0205
        rs_R003_ueqv_R003YY_generator_02_0200_0282 =
      rs_R003_ueqv_R003YY_partial_02_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 2. -/
def rs_R003_ueqv_R003YY_coefficient_02_0206 : Poly :=
[
  term ((-891 : Rat) / 20) [(3, 1), (15, 1)]
]

/-- Partial product 206 for generator 2. -/
def rs_R003_ueqv_R003YY_partial_02_0206 : Poly :=
[
  term ((-891 : Rat) / 20) [(0, 2), (3, 1), (15, 1)],
  term ((-891 : Rat) / 20) [(1, 2), (3, 1), (15, 1)],
  term ((891 : Rat) / 20) [(3, 1), (10, 2), (15, 1)],
  term ((891 : Rat) / 20) [(3, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 2. -/
theorem rs_R003_ueqv_R003YY_partial_02_0206_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_02_0206
        rs_R003_ueqv_R003YY_generator_02_0200_0282 =
      rs_R003_ueqv_R003YY_partial_02_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 2. -/
def rs_R003_ueqv_R003YY_coefficient_02_0207 : Poly :=
[
  term ((99 : Rat) / 20) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 207 for generator 2. -/
def rs_R003_ueqv_R003YY_partial_02_0207 : Poly :=
[
  term ((99 : Rat) / 20) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((99 : Rat) / 20) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((-99 : Rat) / 20) [(3, 1), (10, 2), (15, 1), (16, 1)],
  term ((-99 : Rat) / 20) [(3, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 2. -/
theorem rs_R003_ueqv_R003YY_partial_02_0207_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_02_0207
        rs_R003_ueqv_R003YY_generator_02_0200_0282 =
      rs_R003_ueqv_R003YY_partial_02_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 2. -/
def rs_R003_ueqv_R003YY_coefficient_02_0208 : Poly :=
[
  term ((-55296 : Rat) / 7625) [(4, 1), (5, 1), (9, 1), (13, 2)]
]

/-- Partial product 208 for generator 2. -/
def rs_R003_ueqv_R003YY_partial_02_0208 : Poly :=
[
  term ((-55296 : Rat) / 7625) [(0, 2), (4, 1), (5, 1), (9, 1), (13, 2)],
  term ((-55296 : Rat) / 7625) [(1, 2), (4, 1), (5, 1), (9, 1), (13, 2)],
  term ((55296 : Rat) / 7625) [(4, 1), (5, 1), (9, 1), (10, 2), (13, 2)],
  term ((55296 : Rat) / 7625) [(4, 1), (5, 1), (9, 1), (11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 2. -/
theorem rs_R003_ueqv_R003YY_partial_02_0208_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_02_0208
        rs_R003_ueqv_R003YY_generator_02_0200_0282 =
      rs_R003_ueqv_R003YY_partial_02_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 2. -/
def rs_R003_ueqv_R003YY_coefficient_02_0209 : Poly :=
[
  term ((-41472 : Rat) / 7625) [(4, 1), (5, 1), (12, 1), (13, 1)]
]

/-- Partial product 209 for generator 2. -/
def rs_R003_ueqv_R003YY_partial_02_0209 : Poly :=
[
  term ((-41472 : Rat) / 7625) [(0, 2), (4, 1), (5, 1), (12, 1), (13, 1)],
  term ((-41472 : Rat) / 7625) [(1, 2), (4, 1), (5, 1), (12, 1), (13, 1)],
  term ((41472 : Rat) / 7625) [(4, 1), (5, 1), (10, 2), (12, 1), (13, 1)],
  term ((41472 : Rat) / 7625) [(4, 1), (5, 1), (11, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 2. -/
theorem rs_R003_ueqv_R003YY_partial_02_0209_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_02_0209
        rs_R003_ueqv_R003YY_generator_02_0200_0282 =
      rs_R003_ueqv_R003YY_partial_02_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 2. -/
def rs_R003_ueqv_R003YY_coefficient_02_0210 : Poly :=
[
  term ((55296 : Rat) / 7625) [(4, 1), (5, 1), (13, 1)]
]

/-- Partial product 210 for generator 2. -/
def rs_R003_ueqv_R003YY_partial_02_0210 : Poly :=
[
  term ((55296 : Rat) / 7625) [(0, 2), (4, 1), (5, 1), (13, 1)],
  term ((55296 : Rat) / 7625) [(1, 2), (4, 1), (5, 1), (13, 1)],
  term ((-55296 : Rat) / 7625) [(4, 1), (5, 1), (10, 2), (13, 1)],
  term ((-55296 : Rat) / 7625) [(4, 1), (5, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 2. -/
theorem rs_R003_ueqv_R003YY_partial_02_0210_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_02_0210
        rs_R003_ueqv_R003YY_generator_02_0200_0282 =
      rs_R003_ueqv_R003YY_partial_02_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 2. -/
def rs_R003_ueqv_R003YY_coefficient_02_0211 : Poly :=
[
  term ((6912 : Rat) / 7625) [(4, 1), (7, 1), (13, 1)]
]

/-- Partial product 211 for generator 2. -/
def rs_R003_ueqv_R003YY_partial_02_0211 : Poly :=
[
  term ((6912 : Rat) / 7625) [(0, 2), (4, 1), (7, 1), (13, 1)],
  term ((6912 : Rat) / 7625) [(1, 2), (4, 1), (7, 1), (13, 1)],
  term ((-6912 : Rat) / 7625) [(4, 1), (7, 1), (10, 2), (13, 1)],
  term ((-6912 : Rat) / 7625) [(4, 1), (7, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 2. -/
theorem rs_R003_ueqv_R003YY_partial_02_0211_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_02_0211
        rs_R003_ueqv_R003YY_generator_02_0200_0282 =
      rs_R003_ueqv_R003YY_partial_02_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 2. -/
def rs_R003_ueqv_R003YY_coefficient_02_0212 : Poly :=
[
  term ((528 : Rat) / 427) [(4, 1), (9, 1), (10, 1), (13, 1)]
]

/-- Partial product 212 for generator 2. -/
def rs_R003_ueqv_R003YY_partial_02_0212 : Poly :=
[
  term ((528 : Rat) / 427) [(0, 2), (4, 1), (9, 1), (10, 1), (13, 1)],
  term ((528 : Rat) / 427) [(1, 2), (4, 1), (9, 1), (10, 1), (13, 1)],
  term ((-528 : Rat) / 427) [(4, 1), (9, 1), (10, 1), (11, 2), (13, 1)],
  term ((-528 : Rat) / 427) [(4, 1), (9, 1), (10, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 2. -/
theorem rs_R003_ueqv_R003YY_partial_02_0212_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_02_0212
        rs_R003_ueqv_R003YY_generator_02_0200_0282 =
      rs_R003_ueqv_R003YY_partial_02_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 2. -/
def rs_R003_ueqv_R003YY_coefficient_02_0213 : Poly :=
[
  term ((-2112 : Rat) / 427) [(4, 1), (9, 1), (11, 1), (13, 2)]
]

/-- Partial product 213 for generator 2. -/
def rs_R003_ueqv_R003YY_partial_02_0213 : Poly :=
[
  term ((-2112 : Rat) / 427) [(0, 2), (4, 1), (9, 1), (11, 1), (13, 2)],
  term ((-2112 : Rat) / 427) [(1, 2), (4, 1), (9, 1), (11, 1), (13, 2)],
  term ((2112 : Rat) / 427) [(4, 1), (9, 1), (10, 2), (11, 1), (13, 2)],
  term ((2112 : Rat) / 427) [(4, 1), (9, 1), (11, 3), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 2. -/
theorem rs_R003_ueqv_R003YY_partial_02_0213_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_02_0213
        rs_R003_ueqv_R003YY_generator_02_0200_0282 =
      rs_R003_ueqv_R003YY_partial_02_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 2. -/
def rs_R003_ueqv_R003YY_coefficient_02_0214 : Poly :=
[
  term ((-118224 : Rat) / 53375) [(4, 1), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 214 for generator 2. -/
def rs_R003_ueqv_R003YY_partial_02_0214 : Poly :=
[
  term ((-118224 : Rat) / 53375) [(0, 2), (4, 1), (9, 1), (12, 1), (13, 1)],
  term ((-118224 : Rat) / 53375) [(1, 2), (4, 1), (9, 1), (12, 1), (13, 1)],
  term ((118224 : Rat) / 53375) [(4, 1), (9, 1), (10, 2), (12, 1), (13, 1)],
  term ((118224 : Rat) / 53375) [(4, 1), (9, 1), (11, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 2. -/
theorem rs_R003_ueqv_R003YY_partial_02_0214_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_02_0214
        rs_R003_ueqv_R003YY_generator_02_0200_0282 =
      rs_R003_ueqv_R003YY_partial_02_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 2. -/
def rs_R003_ueqv_R003YY_coefficient_02_0215 : Poly :=
[
  term ((-134976 : Rat) / 53375) [(4, 1), (9, 1), (13, 1)]
]

/-- Partial product 215 for generator 2. -/
def rs_R003_ueqv_R003YY_partial_02_0215 : Poly :=
[
  term ((-134976 : Rat) / 53375) [(0, 2), (4, 1), (9, 1), (13, 1)],
  term ((-134976 : Rat) / 53375) [(1, 2), (4, 1), (9, 1), (13, 1)],
  term ((134976 : Rat) / 53375) [(4, 1), (9, 1), (10, 2), (13, 1)],
  term ((134976 : Rat) / 53375) [(4, 1), (9, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 2. -/
theorem rs_R003_ueqv_R003YY_partial_02_0215_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_02_0215
        rs_R003_ueqv_R003YY_generator_02_0200_0282 =
      rs_R003_ueqv_R003YY_partial_02_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 2. -/
def rs_R003_ueqv_R003YY_coefficient_02_0216 : Poly :=
[
  term ((-12576 : Rat) / 10675) [(4, 1), (10, 1), (13, 2)]
]

/-- Partial product 216 for generator 2. -/
def rs_R003_ueqv_R003YY_partial_02_0216 : Poly :=
[
  term ((-12576 : Rat) / 10675) [(0, 2), (4, 1), (10, 1), (13, 2)],
  term ((-12576 : Rat) / 10675) [(1, 2), (4, 1), (10, 1), (13, 2)],
  term ((12576 : Rat) / 10675) [(4, 1), (10, 1), (11, 2), (13, 2)],
  term ((12576 : Rat) / 10675) [(4, 1), (10, 3), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 2. -/
theorem rs_R003_ueqv_R003YY_partial_02_0216_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_02_0216
        rs_R003_ueqv_R003YY_generator_02_0200_0282 =
      rs_R003_ueqv_R003YY_partial_02_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 2. -/
def rs_R003_ueqv_R003YY_coefficient_02_0217 : Poly :=
[
  term ((-40224 : Rat) / 10675) [(4, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 217 for generator 2. -/
def rs_R003_ueqv_R003YY_partial_02_0217 : Poly :=
[
  term ((-40224 : Rat) / 10675) [(0, 2), (4, 1), (11, 1), (12, 1), (13, 1)],
  term ((-40224 : Rat) / 10675) [(1, 2), (4, 1), (11, 1), (12, 1), (13, 1)],
  term ((40224 : Rat) / 10675) [(4, 1), (10, 2), (11, 1), (12, 1), (13, 1)],
  term ((40224 : Rat) / 10675) [(4, 1), (11, 3), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 2. -/
theorem rs_R003_ueqv_R003YY_partial_02_0217_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_02_0217
        rs_R003_ueqv_R003YY_generator_02_0200_0282 =
      rs_R003_ueqv_R003YY_partial_02_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 2. -/
def rs_R003_ueqv_R003YY_coefficient_02_0218 : Poly :=
[
  term ((33624 : Rat) / 10675) [(4, 1), (11, 1), (13, 1)]
]

/-- Partial product 218 for generator 2. -/
def rs_R003_ueqv_R003YY_partial_02_0218 : Poly :=
[
  term ((33624 : Rat) / 10675) [(0, 2), (4, 1), (11, 1), (13, 1)],
  term ((33624 : Rat) / 10675) [(1, 2), (4, 1), (11, 1), (13, 1)],
  term ((-33624 : Rat) / 10675) [(4, 1), (10, 2), (11, 1), (13, 1)],
  term ((-33624 : Rat) / 10675) [(4, 1), (11, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 2. -/
theorem rs_R003_ueqv_R003YY_partial_02_0218_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_02_0218
        rs_R003_ueqv_R003YY_generator_02_0200_0282 =
      rs_R003_ueqv_R003YY_partial_02_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 2. -/
def rs_R003_ueqv_R003YY_coefficient_02_0219 : Poly :=
[
  term ((792 : Rat) / 2135) [(4, 1), (13, 2)]
]

/-- Partial product 219 for generator 2. -/
def rs_R003_ueqv_R003YY_partial_02_0219 : Poly :=
[
  term ((792 : Rat) / 2135) [(0, 2), (4, 1), (13, 2)],
  term ((792 : Rat) / 2135) [(1, 2), (4, 1), (13, 2)],
  term ((-792 : Rat) / 2135) [(4, 1), (10, 2), (13, 2)],
  term ((-792 : Rat) / 2135) [(4, 1), (11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 2. -/
theorem rs_R003_ueqv_R003YY_partial_02_0219_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_02_0219
        rs_R003_ueqv_R003YY_generator_02_0200_0282 =
      rs_R003_ueqv_R003YY_partial_02_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 2. -/
def rs_R003_ueqv_R003YY_coefficient_02_0220 : Poly :=
[
  term ((-13824 : Rat) / 7625) [(4, 2), (9, 1), (10, 1), (13, 1)]
]

/-- Partial product 220 for generator 2. -/
def rs_R003_ueqv_R003YY_partial_02_0220 : Poly :=
[
  term ((-13824 : Rat) / 7625) [(0, 2), (4, 2), (9, 1), (10, 1), (13, 1)],
  term ((-13824 : Rat) / 7625) [(1, 2), (4, 2), (9, 1), (10, 1), (13, 1)],
  term ((13824 : Rat) / 7625) [(4, 2), (9, 1), (10, 1), (11, 2), (13, 1)],
  term ((13824 : Rat) / 7625) [(4, 2), (9, 1), (10, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 2. -/
theorem rs_R003_ueqv_R003YY_partial_02_0220_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_02_0220
        rs_R003_ueqv_R003YY_generator_02_0200_0282 =
      rs_R003_ueqv_R003YY_partial_02_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 2. -/
def rs_R003_ueqv_R003YY_coefficient_02_0221 : Poly :=
[
  term ((55296 : Rat) / 7625) [(4, 2), (9, 1), (11, 1), (13, 2)]
]

/-- Partial product 221 for generator 2. -/
def rs_R003_ueqv_R003YY_partial_02_0221 : Poly :=
[
  term ((55296 : Rat) / 7625) [(0, 2), (4, 2), (9, 1), (11, 1), (13, 2)],
  term ((55296 : Rat) / 7625) [(1, 2), (4, 2), (9, 1), (11, 1), (13, 2)],
  term ((-55296 : Rat) / 7625) [(4, 2), (9, 1), (10, 2), (11, 1), (13, 2)],
  term ((-55296 : Rat) / 7625) [(4, 2), (9, 1), (11, 3), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 2. -/
theorem rs_R003_ueqv_R003YY_partial_02_0221_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_02_0221
        rs_R003_ueqv_R003YY_generator_02_0200_0282 =
      rs_R003_ueqv_R003YY_partial_02_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 2. -/
def rs_R003_ueqv_R003YY_coefficient_02_0222 : Poly :=
[
  term ((13824 : Rat) / 7625) [(4, 2), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 222 for generator 2. -/
def rs_R003_ueqv_R003YY_partial_02_0222 : Poly :=
[
  term ((13824 : Rat) / 7625) [(0, 2), (4, 2), (9, 1), (12, 1), (13, 1)],
  term ((13824 : Rat) / 7625) [(1, 2), (4, 2), (9, 1), (12, 1), (13, 1)],
  term ((-13824 : Rat) / 7625) [(4, 2), (9, 1), (10, 2), (12, 1), (13, 1)],
  term ((-13824 : Rat) / 7625) [(4, 2), (9, 1), (11, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 2. -/
theorem rs_R003_ueqv_R003YY_partial_02_0222_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_02_0222
        rs_R003_ueqv_R003YY_generator_02_0200_0282 =
      rs_R003_ueqv_R003YY_partial_02_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 2. -/
def rs_R003_ueqv_R003YY_coefficient_02_0223 : Poly :=
[
  term ((55296 : Rat) / 7625) [(4, 2), (9, 1), (13, 1)]
]

/-- Partial product 223 for generator 2. -/
def rs_R003_ueqv_R003YY_partial_02_0223 : Poly :=
[
  term ((55296 : Rat) / 7625) [(0, 2), (4, 2), (9, 1), (13, 1)],
  term ((55296 : Rat) / 7625) [(1, 2), (4, 2), (9, 1), (13, 1)],
  term ((-55296 : Rat) / 7625) [(4, 2), (9, 1), (10, 2), (13, 1)],
  term ((-55296 : Rat) / 7625) [(4, 2), (9, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 2. -/
theorem rs_R003_ueqv_R003YY_partial_02_0223_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_02_0223
        rs_R003_ueqv_R003YY_generator_02_0200_0282 =
      rs_R003_ueqv_R003YY_partial_02_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 2. -/
def rs_R003_ueqv_R003YY_coefficient_02_0224 : Poly :=
[
  term ((27648 : Rat) / 7625) [(4, 2), (10, 1), (13, 2)]
]

/-- Partial product 224 for generator 2. -/
def rs_R003_ueqv_R003YY_partial_02_0224 : Poly :=
[
  term ((27648 : Rat) / 7625) [(0, 2), (4, 2), (10, 1), (13, 2)],
  term ((27648 : Rat) / 7625) [(1, 2), (4, 2), (10, 1), (13, 2)],
  term ((-27648 : Rat) / 7625) [(4, 2), (10, 1), (11, 2), (13, 2)],
  term ((-27648 : Rat) / 7625) [(4, 2), (10, 3), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 2. -/
theorem rs_R003_ueqv_R003YY_partial_02_0224_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_02_0224
        rs_R003_ueqv_R003YY_generator_02_0200_0282 =
      rs_R003_ueqv_R003YY_partial_02_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 2. -/
def rs_R003_ueqv_R003YY_coefficient_02_0225 : Poly :=
[
  term ((27648 : Rat) / 7625) [(4, 2), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 225 for generator 2. -/
def rs_R003_ueqv_R003YY_partial_02_0225 : Poly :=
[
  term ((27648 : Rat) / 7625) [(0, 2), (4, 2), (11, 1), (12, 1), (13, 1)],
  term ((27648 : Rat) / 7625) [(1, 2), (4, 2), (11, 1), (12, 1), (13, 1)],
  term ((-27648 : Rat) / 7625) [(4, 2), (10, 2), (11, 1), (12, 1), (13, 1)],
  term ((-27648 : Rat) / 7625) [(4, 2), (11, 3), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 2. -/
theorem rs_R003_ueqv_R003YY_partial_02_0225_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_02_0225
        rs_R003_ueqv_R003YY_generator_02_0200_0282 =
      rs_R003_ueqv_R003YY_partial_02_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 2. -/
def rs_R003_ueqv_R003YY_coefficient_02_0226 : Poly :=
[
  term ((-20736 : Rat) / 7625) [(4, 2), (11, 1), (13, 1)]
]

/-- Partial product 226 for generator 2. -/
def rs_R003_ueqv_R003YY_partial_02_0226 : Poly :=
[
  term ((-20736 : Rat) / 7625) [(0, 2), (4, 2), (11, 1), (13, 1)],
  term ((-20736 : Rat) / 7625) [(1, 2), (4, 2), (11, 1), (13, 1)],
  term ((20736 : Rat) / 7625) [(4, 2), (10, 2), (11, 1), (13, 1)],
  term ((20736 : Rat) / 7625) [(4, 2), (11, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 2. -/
theorem rs_R003_ueqv_R003YY_partial_02_0226_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_02_0226
        rs_R003_ueqv_R003YY_generator_02_0200_0282 =
      rs_R003_ueqv_R003YY_partial_02_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 2. -/
def rs_R003_ueqv_R003YY_coefficient_02_0227 : Poly :=
[
  term ((-48384 : Rat) / 7625) [(4, 2), (13, 2)]
]

/-- Partial product 227 for generator 2. -/
def rs_R003_ueqv_R003YY_partial_02_0227 : Poly :=
[
  term ((-48384 : Rat) / 7625) [(0, 2), (4, 2), (13, 2)],
  term ((-48384 : Rat) / 7625) [(1, 2), (4, 2), (13, 2)],
  term ((48384 : Rat) / 7625) [(4, 2), (10, 2), (13, 2)],
  term ((48384 : Rat) / 7625) [(4, 2), (11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 2. -/
theorem rs_R003_ueqv_R003YY_partial_02_0227_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_02_0227
        rs_R003_ueqv_R003YY_generator_02_0200_0282 =
      rs_R003_ueqv_R003YY_partial_02_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 2. -/
def rs_R003_ueqv_R003YY_coefficient_02_0228 : Poly :=
[
  term ((10944 : Rat) / 7625) [(5, 1), (9, 1), (13, 2)]
]

/-- Partial product 228 for generator 2. -/
def rs_R003_ueqv_R003YY_partial_02_0228 : Poly :=
[
  term ((10944 : Rat) / 7625) [(0, 2), (5, 1), (9, 1), (13, 2)],
  term ((10944 : Rat) / 7625) [(1, 2), (5, 1), (9, 1), (13, 2)],
  term ((-10944 : Rat) / 7625) [(5, 1), (9, 1), (10, 2), (13, 2)],
  term ((-10944 : Rat) / 7625) [(5, 1), (9, 1), (11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 2. -/
theorem rs_R003_ueqv_R003YY_partial_02_0228_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_02_0228
        rs_R003_ueqv_R003YY_generator_02_0200_0282 =
      rs_R003_ueqv_R003YY_partial_02_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 2. -/
def rs_R003_ueqv_R003YY_coefficient_02_0229 : Poly :=
[
  term ((8208 : Rat) / 7625) [(5, 1), (12, 1), (13, 1)]
]

/-- Partial product 229 for generator 2. -/
def rs_R003_ueqv_R003YY_partial_02_0229 : Poly :=
[
  term ((8208 : Rat) / 7625) [(0, 2), (5, 1), (12, 1), (13, 1)],
  term ((8208 : Rat) / 7625) [(1, 2), (5, 1), (12, 1), (13, 1)],
  term ((-8208 : Rat) / 7625) [(5, 1), (10, 2), (12, 1), (13, 1)],
  term ((-8208 : Rat) / 7625) [(5, 1), (11, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 2. -/
theorem rs_R003_ueqv_R003YY_partial_02_0229_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_02_0229
        rs_R003_ueqv_R003YY_generator_02_0200_0282 =
      rs_R003_ueqv_R003YY_partial_02_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 2. -/
def rs_R003_ueqv_R003YY_coefficient_02_0230 : Poly :=
[
  term ((-10944 : Rat) / 7625) [(5, 1), (13, 1)]
]

/-- Partial product 230 for generator 2. -/
def rs_R003_ueqv_R003YY_partial_02_0230 : Poly :=
[
  term ((-10944 : Rat) / 7625) [(0, 2), (5, 1), (13, 1)],
  term ((-10944 : Rat) / 7625) [(1, 2), (5, 1), (13, 1)],
  term ((10944 : Rat) / 7625) [(5, 1), (10, 2), (13, 1)],
  term ((10944 : Rat) / 7625) [(5, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 2. -/
theorem rs_R003_ueqv_R003YY_partial_02_0230_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_02_0230
        rs_R003_ueqv_R003YY_generator_02_0200_0282 =
      rs_R003_ueqv_R003YY_partial_02_0230 := by
  native_decide

/-- Coefficient term 231 from coefficient polynomial 2. -/
def rs_R003_ueqv_R003YY_coefficient_02_0231 : Poly :=
[
  term ((-1368 : Rat) / 7625) [(7, 1), (13, 1)]
]

/-- Partial product 231 for generator 2. -/
def rs_R003_ueqv_R003YY_partial_02_0231 : Poly :=
[
  term ((-1368 : Rat) / 7625) [(0, 2), (7, 1), (13, 1)],
  term ((-1368 : Rat) / 7625) [(1, 2), (7, 1), (13, 1)],
  term ((1368 : Rat) / 7625) [(7, 1), (10, 2), (13, 1)],
  term ((1368 : Rat) / 7625) [(7, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 231 for generator 2. -/
theorem rs_R003_ueqv_R003YY_partial_02_0231_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_02_0231
        rs_R003_ueqv_R003YY_generator_02_0200_0282 =
      rs_R003_ueqv_R003YY_partial_02_0231 := by
  native_decide

/-- Coefficient term 232 from coefficient polynomial 2. -/
def rs_R003_ueqv_R003YY_coefficient_02_0232 : Poly :=
[
  term ((-31352 : Rat) / 875) [(9, 1), (10, 1), (13, 1)]
]

/-- Partial product 232 for generator 2. -/
def rs_R003_ueqv_R003YY_partial_02_0232 : Poly :=
[
  term ((-31352 : Rat) / 875) [(0, 2), (9, 1), (10, 1), (13, 1)],
  term ((-31352 : Rat) / 875) [(1, 2), (9, 1), (10, 1), (13, 1)],
  term ((31352 : Rat) / 875) [(9, 1), (10, 1), (11, 2), (13, 1)],
  term ((31352 : Rat) / 875) [(9, 1), (10, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 232 for generator 2. -/
theorem rs_R003_ueqv_R003YY_partial_02_0232_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_02_0232
        rs_R003_ueqv_R003YY_generator_02_0200_0282 =
      rs_R003_ueqv_R003YY_partial_02_0232 := by
  native_decide

/-- Coefficient term 233 from coefficient polynomial 2. -/
def rs_R003_ueqv_R003YY_coefficient_02_0233 : Poly :=
[
  term ((1536 : Rat) / 35) [(9, 1), (10, 1), (13, 1), (14, 1)]
]

/-- Partial product 233 for generator 2. -/
def rs_R003_ueqv_R003YY_partial_02_0233 : Poly :=
[
  term ((1536 : Rat) / 35) [(0, 2), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((1536 : Rat) / 35) [(1, 2), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((-1536 : Rat) / 35) [(9, 1), (10, 1), (11, 2), (13, 1), (14, 1)],
  term ((-1536 : Rat) / 35) [(9, 1), (10, 3), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 233 for generator 2. -/
theorem rs_R003_ueqv_R003YY_partial_02_0233_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_02_0233
        rs_R003_ueqv_R003YY_generator_02_0200_0282 =
      rs_R003_ueqv_R003YY_partial_02_0233 := by
  native_decide

/-- Coefficient term 234 from coefficient polynomial 2. -/
def rs_R003_ueqv_R003YY_coefficient_02_0234 : Poly :=
[
  term ((-512 : Rat) / 35) [(9, 1), (10, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 234 for generator 2. -/
def rs_R003_ueqv_R003YY_partial_02_0234 : Poly :=
[
  term ((-512 : Rat) / 35) [(0, 2), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-512 : Rat) / 35) [(1, 2), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((512 : Rat) / 35) [(9, 1), (10, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((512 : Rat) / 35) [(9, 1), (10, 3), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 234 for generator 2. -/
theorem rs_R003_ueqv_R003YY_partial_02_0234_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_02_0234
        rs_R003_ueqv_R003YY_generator_02_0200_0282 =
      rs_R003_ueqv_R003YY_partial_02_0234 := by
  native_decide

/-- Coefficient term 235 from coefficient polynomial 2. -/
def rs_R003_ueqv_R003YY_coefficient_02_0235 : Poly :=
[
  term ((416 : Rat) / 35) [(9, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 235 for generator 2. -/
def rs_R003_ueqv_R003YY_partial_02_0235 : Poly :=
[
  term ((416 : Rat) / 35) [(0, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((416 : Rat) / 35) [(1, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-416 : Rat) / 35) [(9, 1), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((-416 : Rat) / 35) [(9, 1), (10, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 235 for generator 2. -/
theorem rs_R003_ueqv_R003YY_partial_02_0235_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_02_0235
        rs_R003_ueqv_R003YY_generator_02_0200_0282 =
      rs_R003_ueqv_R003YY_partial_02_0235 := by
  native_decide

/-- Coefficient term 236 from coefficient polynomial 2. -/
def rs_R003_ueqv_R003YY_coefficient_02_0236 : Poly :=
[
  term ((-9209 : Rat) / 420) [(9, 1), (10, 1), (15, 1)]
]

/-- Partial product 236 for generator 2. -/
def rs_R003_ueqv_R003YY_partial_02_0236 : Poly :=
[
  term ((-9209 : Rat) / 420) [(0, 2), (9, 1), (10, 1), (15, 1)],
  term ((-9209 : Rat) / 420) [(1, 2), (9, 1), (10, 1), (15, 1)],
  term ((9209 : Rat) / 420) [(9, 1), (10, 1), (11, 2), (15, 1)],
  term ((9209 : Rat) / 420) [(9, 1), (10, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 236 for generator 2. -/
theorem rs_R003_ueqv_R003YY_partial_02_0236_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_02_0236
        rs_R003_ueqv_R003YY_generator_02_0200_0282 =
      rs_R003_ueqv_R003YY_partial_02_0236 := by
  native_decide

/-- Coefficient term 237 from coefficient polynomial 2. -/
def rs_R003_ueqv_R003YY_coefficient_02_0237 : Poly :=
[
  term ((379 : Rat) / 140) [(9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 237 for generator 2. -/
def rs_R003_ueqv_R003YY_partial_02_0237 : Poly :=
[
  term ((379 : Rat) / 140) [(0, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((379 : Rat) / 140) [(1, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-379 : Rat) / 140) [(9, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((-379 : Rat) / 140) [(9, 1), (10, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 237 for generator 2. -/
theorem rs_R003_ueqv_R003YY_partial_02_0237_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_02_0237
        rs_R003_ueqv_R003YY_generator_02_0200_0282 =
      rs_R003_ueqv_R003YY_partial_02_0237 := by
  native_decide

/-- Coefficient term 238 from coefficient polynomial 2. -/
def rs_R003_ueqv_R003YY_coefficient_02_0238 : Poly :=
[
  term ((9209 : Rat) / 105) [(9, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 238 for generator 2. -/
def rs_R003_ueqv_R003YY_partial_02_0238 : Poly :=
[
  term ((9209 : Rat) / 105) [(0, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((9209 : Rat) / 105) [(1, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-9209 : Rat) / 105) [(9, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((-9209 : Rat) / 105) [(9, 1), (11, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 238 for generator 2. -/
theorem rs_R003_ueqv_R003YY_partial_02_0238_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_02_0238
        rs_R003_ueqv_R003YY_generator_02_0200_0282 =
      rs_R003_ueqv_R003YY_partial_02_0238 := by
  native_decide

/-- Coefficient term 239 from coefficient polynomial 2. -/
def rs_R003_ueqv_R003YY_coefficient_02_0239 : Poly :=
[
  term ((-379 : Rat) / 35) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 239 for generator 2. -/
def rs_R003_ueqv_R003YY_partial_02_0239 : Poly :=
[
  term ((-379 : Rat) / 35) [(0, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-379 : Rat) / 35) [(1, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((379 : Rat) / 35) [(9, 1), (10, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((379 : Rat) / 35) [(9, 1), (11, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 239 for generator 2. -/
theorem rs_R003_ueqv_R003YY_partial_02_0239_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_02_0239
        rs_R003_ueqv_R003YY_generator_02_0200_0282 =
      rs_R003_ueqv_R003YY_partial_02_0239 := by
  native_decide

/-- Coefficient term 240 from coefficient polynomial 2. -/
def rs_R003_ueqv_R003YY_coefficient_02_0240 : Poly :=
[
  term ((125408 : Rat) / 875) [(9, 1), (11, 1), (13, 2)]
]

/-- Partial product 240 for generator 2. -/
def rs_R003_ueqv_R003YY_partial_02_0240 : Poly :=
[
  term ((125408 : Rat) / 875) [(0, 2), (9, 1), (11, 1), (13, 2)],
  term ((125408 : Rat) / 875) [(1, 2), (9, 1), (11, 1), (13, 2)],
  term ((-125408 : Rat) / 875) [(9, 1), (10, 2), (11, 1), (13, 2)],
  term ((-125408 : Rat) / 875) [(9, 1), (11, 3), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 240 for generator 2. -/
theorem rs_R003_ueqv_R003YY_partial_02_0240_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_02_0240
        rs_R003_ueqv_R003YY_generator_02_0200_0282 =
      rs_R003_ueqv_R003YY_partial_02_0240 := by
  native_decide

/-- Coefficient term 241 from coefficient polynomial 2. -/
def rs_R003_ueqv_R003YY_coefficient_02_0241 : Poly :=
[
  term ((-6144 : Rat) / 35) [(9, 1), (11, 1), (13, 2), (14, 1)]
]

/-- Partial product 241 for generator 2. -/
def rs_R003_ueqv_R003YY_partial_02_0241 : Poly :=
[
  term ((-6144 : Rat) / 35) [(0, 2), (9, 1), (11, 1), (13, 2), (14, 1)],
  term ((-6144 : Rat) / 35) [(1, 2), (9, 1), (11, 1), (13, 2), (14, 1)],
  term ((6144 : Rat) / 35) [(9, 1), (10, 2), (11, 1), (13, 2), (14, 1)],
  term ((6144 : Rat) / 35) [(9, 1), (11, 3), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 241 for generator 2. -/
theorem rs_R003_ueqv_R003YY_partial_02_0241_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_02_0241
        rs_R003_ueqv_R003YY_generator_02_0200_0282 =
      rs_R003_ueqv_R003YY_partial_02_0241 := by
  native_decide

/-- Coefficient term 242 from coefficient polynomial 2. -/
def rs_R003_ueqv_R003YY_coefficient_02_0242 : Poly :=
[
  term ((2048 : Rat) / 35) [(9, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 242 for generator 2. -/
def rs_R003_ueqv_R003YY_partial_02_0242 : Poly :=
[
  term ((2048 : Rat) / 35) [(0, 2), (9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((2048 : Rat) / 35) [(1, 2), (9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-2048 : Rat) / 35) [(9, 1), (10, 2), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-2048 : Rat) / 35) [(9, 1), (11, 3), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 242 for generator 2. -/
theorem rs_R003_ueqv_R003YY_partial_02_0242_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_02_0242
        rs_R003_ueqv_R003YY_generator_02_0200_0282 =
      rs_R003_ueqv_R003YY_partial_02_0242 := by
  native_decide

/-- Coefficient term 243 from coefficient polynomial 2. -/
def rs_R003_ueqv_R003YY_coefficient_02_0243 : Poly :=
[
  term ((-1664 : Rat) / 35) [(9, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 243 for generator 2. -/
def rs_R003_ueqv_R003YY_partial_02_0243 : Poly :=
[
  term ((-1664 : Rat) / 35) [(0, 2), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-1664 : Rat) / 35) [(1, 2), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((1664 : Rat) / 35) [(9, 1), (10, 2), (11, 1), (13, 2), (16, 1)],
  term ((1664 : Rat) / 35) [(9, 1), (11, 3), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 243 for generator 2. -/
theorem rs_R003_ueqv_R003YY_partial_02_0243_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_02_0243
        rs_R003_ueqv_R003YY_generator_02_0200_0282 =
      rs_R003_ueqv_R003YY_partial_02_0243 := by
  native_decide

/-- Coefficient term 244 from coefficient polynomial 2. -/
def rs_R003_ueqv_R003YY_coefficient_02_0244 : Poly :=
[
  term ((-2835192 : Rat) / 53375) [(9, 1), (12, 1), (13, 1)]
]

/-- Partial product 244 for generator 2. -/
def rs_R003_ueqv_R003YY_partial_02_0244 : Poly :=
[
  term ((-2835192 : Rat) / 53375) [(0, 2), (9, 1), (12, 1), (13, 1)],
  term ((-2835192 : Rat) / 53375) [(1, 2), (9, 1), (12, 1), (13, 1)],
  term ((2835192 : Rat) / 53375) [(9, 1), (10, 2), (12, 1), (13, 1)],
  term ((2835192 : Rat) / 53375) [(9, 1), (11, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 244 for generator 2. -/
theorem rs_R003_ueqv_R003YY_partial_02_0244_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_02_0244
        rs_R003_ueqv_R003YY_generator_02_0200_0282 =
      rs_R003_ueqv_R003YY_partial_02_0244 := by
  native_decide

/-- Coefficient term 245 from coefficient polynomial 2. -/
def rs_R003_ueqv_R003YY_coefficient_02_0245 : Poly :=
[
  term ((2304 : Rat) / 35) [(9, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 245 for generator 2. -/
def rs_R003_ueqv_R003YY_partial_02_0245 : Poly :=
[
  term ((2304 : Rat) / 35) [(0, 2), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((2304 : Rat) / 35) [(1, 2), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-2304 : Rat) / 35) [(9, 1), (10, 2), (12, 1), (13, 1), (14, 1)],
  term ((-2304 : Rat) / 35) [(9, 1), (11, 2), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 245 for generator 2. -/
theorem rs_R003_ueqv_R003YY_partial_02_0245_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_02_0245
        rs_R003_ueqv_R003YY_generator_02_0200_0282 =
      rs_R003_ueqv_R003YY_partial_02_0245 := by
  native_decide

/-- Coefficient term 246 from coefficient polynomial 2. -/
def rs_R003_ueqv_R003YY_coefficient_02_0246 : Poly :=
[
  term ((-768 : Rat) / 35) [(9, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 246 for generator 2. -/
def rs_R003_ueqv_R003YY_partial_02_0246 : Poly :=
[
  term ((-768 : Rat) / 35) [(0, 2), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-768 : Rat) / 35) [(1, 2), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((768 : Rat) / 35) [(9, 1), (10, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((768 : Rat) / 35) [(9, 1), (11, 2), (12, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 246 for generator 2. -/
theorem rs_R003_ueqv_R003YY_partial_02_0246_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_02_0246
        rs_R003_ueqv_R003YY_generator_02_0200_0282 =
      rs_R003_ueqv_R003YY_partial_02_0246 := by
  native_decide

/-- Coefficient term 247 from coefficient polynomial 2. -/
def rs_R003_ueqv_R003YY_coefficient_02_0247 : Poly :=
[
  term ((624 : Rat) / 35) [(9, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 247 for generator 2. -/
def rs_R003_ueqv_R003YY_partial_02_0247 : Poly :=
[
  term ((624 : Rat) / 35) [(0, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((624 : Rat) / 35) [(1, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-624 : Rat) / 35) [(9, 1), (10, 2), (12, 1), (13, 1), (16, 1)],
  term ((-624 : Rat) / 35) [(9, 1), (11, 2), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 247 for generator 2. -/
theorem rs_R003_ueqv_R003YY_partial_02_0247_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_02_0247
        rs_R003_ueqv_R003YY_generator_02_0200_0282 =
      rs_R003_ueqv_R003YY_partial_02_0247 := by
  native_decide

/-- Coefficient term 248 from coefficient polynomial 2. -/
def rs_R003_ueqv_R003YY_coefficient_02_0248 : Poly :=
[
  term ((3617 : Rat) / 140) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 248 for generator 2. -/
def rs_R003_ueqv_R003YY_partial_02_0248 : Poly :=
[
  term ((3617 : Rat) / 140) [(0, 2), (9, 1), (12, 1), (15, 1)],
  term ((3617 : Rat) / 140) [(1, 2), (9, 1), (12, 1), (15, 1)],
  term ((-3617 : Rat) / 140) [(9, 1), (10, 2), (12, 1), (15, 1)],
  term ((-3617 : Rat) / 140) [(9, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 248 for generator 2. -/
theorem rs_R003_ueqv_R003YY_partial_02_0248_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_02_0248
        rs_R003_ueqv_R003YY_generator_02_0200_0282 =
      rs_R003_ueqv_R003YY_partial_02_0248 := by
  native_decide

/-- Coefficient term 249 from coefficient polynomial 2. -/
def rs_R003_ueqv_R003YY_coefficient_02_0249 : Poly :=
[
  term ((-69 : Rat) / 28) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 249 for generator 2. -/
def rs_R003_ueqv_R003YY_partial_02_0249 : Poly :=
[
  term ((-69 : Rat) / 28) [(0, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-69 : Rat) / 28) [(1, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((69 : Rat) / 28) [(9, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((69 : Rat) / 28) [(9, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 249 for generator 2. -/
theorem rs_R003_ueqv_R003YY_partial_02_0249_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_02_0249
        rs_R003_ueqv_R003YY_generator_02_0200_0282 =
      rs_R003_ueqv_R003YY_partial_02_0249 := by
  native_decide

/-- Coefficient term 250 from coefficient polynomial 2. -/
def rs_R003_ueqv_R003YY_coefficient_02_0250 : Poly :=
[
  term ((2628452 : Rat) / 53375) [(9, 1), (13, 1)]
]

/-- Partial product 250 for generator 2. -/
def rs_R003_ueqv_R003YY_partial_02_0250 : Poly :=
[
  term ((2628452 : Rat) / 53375) [(0, 2), (9, 1), (13, 1)],
  term ((2628452 : Rat) / 53375) [(1, 2), (9, 1), (13, 1)],
  term ((-2628452 : Rat) / 53375) [(9, 1), (10, 2), (13, 1)],
  term ((-2628452 : Rat) / 53375) [(9, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 250 for generator 2. -/
theorem rs_R003_ueqv_R003YY_partial_02_0250_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_02_0250
        rs_R003_ueqv_R003YY_generator_02_0200_0282 =
      rs_R003_ueqv_R003YY_partial_02_0250 := by
  native_decide

/-- Coefficient term 251 from coefficient polynomial 2. -/
def rs_R003_ueqv_R003YY_coefficient_02_0251 : Poly :=
[
  term ((-2112 : Rat) / 35) [(9, 1), (13, 1), (14, 1)]
]

/-- Partial product 251 for generator 2. -/
def rs_R003_ueqv_R003YY_partial_02_0251 : Poly :=
[
  term ((-2112 : Rat) / 35) [(0, 2), (9, 1), (13, 1), (14, 1)],
  term ((-2112 : Rat) / 35) [(1, 2), (9, 1), (13, 1), (14, 1)],
  term ((2112 : Rat) / 35) [(9, 1), (10, 2), (13, 1), (14, 1)],
  term ((2112 : Rat) / 35) [(9, 1), (11, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 251 for generator 2. -/
theorem rs_R003_ueqv_R003YY_partial_02_0251_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_02_0251
        rs_R003_ueqv_R003YY_generator_02_0200_0282 =
      rs_R003_ueqv_R003YY_partial_02_0251 := by
  native_decide

/-- Coefficient term 252 from coefficient polynomial 2. -/
def rs_R003_ueqv_R003YY_coefficient_02_0252 : Poly :=
[
  term ((704 : Rat) / 35) [(9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 252 for generator 2. -/
def rs_R003_ueqv_R003YY_partial_02_0252 : Poly :=
[
  term ((704 : Rat) / 35) [(0, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((704 : Rat) / 35) [(1, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-704 : Rat) / 35) [(9, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((-704 : Rat) / 35) [(9, 1), (11, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 252 for generator 2. -/
theorem rs_R003_ueqv_R003YY_partial_02_0252_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_02_0252
        rs_R003_ueqv_R003YY_generator_02_0200_0282 =
      rs_R003_ueqv_R003YY_partial_02_0252 := by
  native_decide

/-- Coefficient term 253 from coefficient polynomial 2. -/
def rs_R003_ueqv_R003YY_coefficient_02_0253 : Poly :=
[
  term ((-572 : Rat) / 35) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 253 for generator 2. -/
def rs_R003_ueqv_R003YY_partial_02_0253 : Poly :=
[
  term ((-572 : Rat) / 35) [(0, 2), (9, 1), (13, 1), (16, 1)],
  term ((-572 : Rat) / 35) [(1, 2), (9, 1), (13, 1), (16, 1)],
  term ((572 : Rat) / 35) [(9, 1), (10, 2), (13, 1), (16, 1)],
  term ((572 : Rat) / 35) [(9, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 253 for generator 2. -/
theorem rs_R003_ueqv_R003YY_partial_02_0253_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_02_0253
        rs_R003_ueqv_R003YY_generator_02_0200_0282 =
      rs_R003_ueqv_R003YY_partial_02_0253 := by
  native_decide

/-- Coefficient term 254 from coefficient polynomial 2. -/
def rs_R003_ueqv_R003YY_coefficient_02_0254 : Poly :=
[
  term ((-827 : Rat) / 84) [(9, 1), (15, 1)]
]

/-- Partial product 254 for generator 2. -/
def rs_R003_ueqv_R003YY_partial_02_0254 : Poly :=
[
  term ((-827 : Rat) / 84) [(0, 2), (9, 1), (15, 1)],
  term ((-827 : Rat) / 84) [(1, 2), (9, 1), (15, 1)],
  term ((827 : Rat) / 84) [(9, 1), (10, 2), (15, 1)],
  term ((827 : Rat) / 84) [(9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 254 for generator 2. -/
theorem rs_R003_ueqv_R003YY_partial_02_0254_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_02_0254
        rs_R003_ueqv_R003YY_generator_02_0200_0282 =
      rs_R003_ueqv_R003YY_partial_02_0254 := by
  native_decide

/-- Coefficient term 255 from coefficient polynomial 2. -/
def rs_R003_ueqv_R003YY_coefficient_02_0255 : Poly :=
[
  term ((101 : Rat) / 140) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 255 for generator 2. -/
def rs_R003_ueqv_R003YY_partial_02_0255 : Poly :=
[
  term ((101 : Rat) / 140) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((101 : Rat) / 140) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((-101 : Rat) / 140) [(9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-101 : Rat) / 140) [(9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 255 for generator 2. -/
theorem rs_R003_ueqv_R003YY_partial_02_0255_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_02_0255
        rs_R003_ueqv_R003YY_generator_02_0200_0282 =
      rs_R003_ueqv_R003YY_partial_02_0255 := by
  native_decide

/-- Coefficient term 256 from coefficient polynomial 2. -/
def rs_R003_ueqv_R003YY_coefficient_02_0256 : Poly :=
[
  term ((1352 : Rat) / 21) [(10, 1), (13, 1), (15, 1)]
]

/-- Partial product 256 for generator 2. -/
def rs_R003_ueqv_R003YY_partial_02_0256 : Poly :=
[
  term ((1352 : Rat) / 21) [(0, 2), (10, 1), (13, 1), (15, 1)],
  term ((1352 : Rat) / 21) [(1, 2), (10, 1), (13, 1), (15, 1)],
  term ((-1352 : Rat) / 21) [(10, 1), (11, 2), (13, 1), (15, 1)],
  term ((-1352 : Rat) / 21) [(10, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 256 for generator 2. -/
theorem rs_R003_ueqv_R003YY_partial_02_0256_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_02_0256
        rs_R003_ueqv_R003YY_generator_02_0200_0282 =
      rs_R003_ueqv_R003YY_partial_02_0256 := by
  native_decide

/-- Coefficient term 257 from coefficient polynomial 2. -/
def rs_R003_ueqv_R003YY_coefficient_02_0257 : Poly :=
[
  term ((-248 : Rat) / 35) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 257 for generator 2. -/
def rs_R003_ueqv_R003YY_partial_02_0257 : Poly :=
[
  term ((-248 : Rat) / 35) [(0, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-248 : Rat) / 35) [(1, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((248 : Rat) / 35) [(10, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((248 : Rat) / 35) [(10, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 257 for generator 2. -/
theorem rs_R003_ueqv_R003YY_partial_02_0257_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_02_0257
        rs_R003_ueqv_R003YY_generator_02_0200_0282 =
      rs_R003_ueqv_R003YY_partial_02_0257 := by
  native_decide

/-- Coefficient term 258 from coefficient polynomial 2. -/
def rs_R003_ueqv_R003YY_coefficient_02_0258 : Poly :=
[
  term ((-470936 : Rat) / 53375) [(10, 1), (13, 2)]
]

/-- Partial product 258 for generator 2. -/
def rs_R003_ueqv_R003YY_partial_02_0258 : Poly :=
[
  term ((-470936 : Rat) / 53375) [(0, 2), (10, 1), (13, 2)],
  term ((-470936 : Rat) / 53375) [(1, 2), (10, 1), (13, 2)],
  term ((470936 : Rat) / 53375) [(10, 1), (11, 2), (13, 2)],
  term ((470936 : Rat) / 53375) [(10, 3), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 258 for generator 2. -/
theorem rs_R003_ueqv_R003YY_partial_02_0258_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_02_0258
        rs_R003_ueqv_R003YY_generator_02_0200_0282 =
      rs_R003_ueqv_R003YY_partial_02_0258 := by
  native_decide

/-- Coefficient term 259 from coefficient polynomial 2. -/
def rs_R003_ueqv_R003YY_coefficient_02_0259 : Poly :=
[
  term ((384 : Rat) / 35) [(10, 1), (13, 2), (14, 1)]
]

/-- Partial product 259 for generator 2. -/
def rs_R003_ueqv_R003YY_partial_02_0259 : Poly :=
[
  term ((384 : Rat) / 35) [(0, 2), (10, 1), (13, 2), (14, 1)],
  term ((384 : Rat) / 35) [(1, 2), (10, 1), (13, 2), (14, 1)],
  term ((-384 : Rat) / 35) [(10, 1), (11, 2), (13, 2), (14, 1)],
  term ((-384 : Rat) / 35) [(10, 3), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 259 for generator 2. -/
theorem rs_R003_ueqv_R003YY_partial_02_0259_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_02_0259
        rs_R003_ueqv_R003YY_generator_02_0200_0282 =
      rs_R003_ueqv_R003YY_partial_02_0259 := by
  native_decide

/-- Coefficient term 260 from coefficient polynomial 2. -/
def rs_R003_ueqv_R003YY_coefficient_02_0260 : Poly :=
[
  term ((-128 : Rat) / 35) [(10, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 260 for generator 2. -/
def rs_R003_ueqv_R003YY_partial_02_0260 : Poly :=
[
  term ((-128 : Rat) / 35) [(0, 2), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((-128 : Rat) / 35) [(1, 2), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((128 : Rat) / 35) [(10, 1), (11, 2), (13, 2), (14, 1), (16, 1)],
  term ((128 : Rat) / 35) [(10, 3), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 260 for generator 2. -/
theorem rs_R003_ueqv_R003YY_partial_02_0260_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_02_0260
        rs_R003_ueqv_R003YY_generator_02_0200_0282 =
      rs_R003_ueqv_R003YY_partial_02_0260 := by
  native_decide

/-- Coefficient term 261 from coefficient polynomial 2. -/
def rs_R003_ueqv_R003YY_coefficient_02_0261 : Poly :=
[
  term ((104 : Rat) / 35) [(10, 1), (13, 2), (16, 1)]
]

/-- Partial product 261 for generator 2. -/
def rs_R003_ueqv_R003YY_partial_02_0261 : Poly :=
[
  term ((104 : Rat) / 35) [(0, 2), (10, 1), (13, 2), (16, 1)],
  term ((104 : Rat) / 35) [(1, 2), (10, 1), (13, 2), (16, 1)],
  term ((-104 : Rat) / 35) [(10, 1), (11, 2), (13, 2), (16, 1)],
  term ((-104 : Rat) / 35) [(10, 3), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 261 for generator 2. -/
theorem rs_R003_ueqv_R003YY_partial_02_0261_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_02_0261
        rs_R003_ueqv_R003YY_generator_02_0200_0282 =
      rs_R003_ueqv_R003YY_partial_02_0261 := by
  native_decide

/-- Coefficient term 262 from coefficient polynomial 2. -/
def rs_R003_ueqv_R003YY_coefficient_02_0262 : Poly :=
[
  term ((8120824 : Rat) / 53375) [(11, 1), (12, 1), (13, 1)]
]

/-- Partial product 262 for generator 2. -/
def rs_R003_ueqv_R003YY_partial_02_0262 : Poly :=
[
  term ((8120824 : Rat) / 53375) [(0, 2), (11, 1), (12, 1), (13, 1)],
  term ((8120824 : Rat) / 53375) [(1, 2), (11, 1), (12, 1), (13, 1)],
  term ((-8120824 : Rat) / 53375) [(10, 2), (11, 1), (12, 1), (13, 1)],
  term ((-8120824 : Rat) / 53375) [(11, 3), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 262 for generator 2. -/
theorem rs_R003_ueqv_R003YY_partial_02_0262_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_02_0262
        rs_R003_ueqv_R003YY_generator_02_0200_0282 =
      rs_R003_ueqv_R003YY_partial_02_0262 := by
  native_decide

/-- Coefficient term 263 from coefficient polynomial 2. -/
def rs_R003_ueqv_R003YY_coefficient_02_0263 : Poly :=
[
  term ((-6528 : Rat) / 35) [(11, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 263 for generator 2. -/
def rs_R003_ueqv_R003YY_partial_02_0263 : Poly :=
[
  term ((-6528 : Rat) / 35) [(0, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-6528 : Rat) / 35) [(1, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((6528 : Rat) / 35) [(10, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((6528 : Rat) / 35) [(11, 3), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 263 for generator 2. -/
theorem rs_R003_ueqv_R003YY_partial_02_0263_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_02_0263
        rs_R003_ueqv_R003YY_generator_02_0200_0282 =
      rs_R003_ueqv_R003YY_partial_02_0263 := by
  native_decide

/-- Coefficient term 264 from coefficient polynomial 2. -/
def rs_R003_ueqv_R003YY_coefficient_02_0264 : Poly :=
[
  term ((2176 : Rat) / 35) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 264 for generator 2. -/
def rs_R003_ueqv_R003YY_partial_02_0264 : Poly :=
[
  term ((2176 : Rat) / 35) [(0, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((2176 : Rat) / 35) [(1, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2176 : Rat) / 35) [(10, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2176 : Rat) / 35) [(11, 3), (12, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 264 for generator 2. -/
theorem rs_R003_ueqv_R003YY_partial_02_0264_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_02_0264
        rs_R003_ueqv_R003YY_generator_02_0200_0282 =
      rs_R003_ueqv_R003YY_partial_02_0264 := by
  native_decide

/-- Coefficient term 265 from coefficient polynomial 2. -/
def rs_R003_ueqv_R003YY_coefficient_02_0265 : Poly :=
[
  term ((-1768 : Rat) / 35) [(11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 265 for generator 2. -/
def rs_R003_ueqv_R003YY_partial_02_0265 : Poly :=
[
  term ((-1768 : Rat) / 35) [(0, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1768 : Rat) / 35) [(1, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((1768 : Rat) / 35) [(10, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((1768 : Rat) / 35) [(11, 3), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 265 for generator 2. -/
theorem rs_R003_ueqv_R003YY_partial_02_0265_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_02_0265
        rs_R003_ueqv_R003YY_generator_02_0200_0282 =
      rs_R003_ueqv_R003YY_partial_02_0265 := by
  native_decide

/-- Coefficient term 266 from coefficient polynomial 2. -/
def rs_R003_ueqv_R003YY_coefficient_02_0266 : Poly :=
[
  term ((2449 : Rat) / 105) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 266 for generator 2. -/
def rs_R003_ueqv_R003YY_partial_02_0266 : Poly :=
[
  term ((2449 : Rat) / 105) [(0, 2), (11, 1), (12, 1), (15, 1)],
  term ((2449 : Rat) / 105) [(1, 2), (11, 1), (12, 1), (15, 1)],
  term ((-2449 : Rat) / 105) [(10, 2), (11, 1), (12, 1), (15, 1)],
  term ((-2449 : Rat) / 105) [(11, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 266 for generator 2. -/
theorem rs_R003_ueqv_R003YY_partial_02_0266_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_02_0266
        rs_R003_ueqv_R003YY_generator_02_0200_0282 =
      rs_R003_ueqv_R003YY_partial_02_0266 := by
  native_decide

/-- Coefficient term 267 from coefficient polynomial 2. -/
def rs_R003_ueqv_R003YY_coefficient_02_0267 : Poly :=
[
  term ((-131 : Rat) / 35) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 267 for generator 2. -/
def rs_R003_ueqv_R003YY_partial_02_0267 : Poly :=
[
  term ((-131 : Rat) / 35) [(0, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-131 : Rat) / 35) [(1, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((131 : Rat) / 35) [(10, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((131 : Rat) / 35) [(11, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 267 for generator 2. -/
theorem rs_R003_ueqv_R003YY_partial_02_0267_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_02_0267
        rs_R003_ueqv_R003YY_generator_02_0200_0282 =
      rs_R003_ueqv_R003YY_partial_02_0267 := by
  native_decide

/-- Coefficient term 268 from coefficient polynomial 2. -/
def rs_R003_ueqv_R003YY_coefficient_02_0268 : Poly :=
[
  term ((-7164588 : Rat) / 53375) [(11, 1), (13, 1)]
]

/-- Partial product 268 for generator 2. -/
def rs_R003_ueqv_R003YY_partial_02_0268 : Poly :=
[
  term ((-7164588 : Rat) / 53375) [(0, 2), (11, 1), (13, 1)],
  term ((-7164588 : Rat) / 53375) [(1, 2), (11, 1), (13, 1)],
  term ((7164588 : Rat) / 53375) [(10, 2), (11, 1), (13, 1)],
  term ((7164588 : Rat) / 53375) [(11, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 268 for generator 2. -/
theorem rs_R003_ueqv_R003YY_partial_02_0268_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_02_0268
        rs_R003_ueqv_R003YY_generator_02_0200_0282 =
      rs_R003_ueqv_R003YY_partial_02_0268 := by
  native_decide

/-- Coefficient term 269 from coefficient polynomial 2. -/
def rs_R003_ueqv_R003YY_coefficient_02_0269 : Poly :=
[
  term ((1152 : Rat) / 7) [(11, 1), (13, 1), (14, 1)]
]

/-- Partial product 269 for generator 2. -/
def rs_R003_ueqv_R003YY_partial_02_0269 : Poly :=
[
  term ((1152 : Rat) / 7) [(0, 2), (11, 1), (13, 1), (14, 1)],
  term ((1152 : Rat) / 7) [(1, 2), (11, 1), (13, 1), (14, 1)],
  term ((-1152 : Rat) / 7) [(10, 2), (11, 1), (13, 1), (14, 1)],
  term ((-1152 : Rat) / 7) [(11, 3), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 269 for generator 2. -/
theorem rs_R003_ueqv_R003YY_partial_02_0269_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_02_0269
        rs_R003_ueqv_R003YY_generator_02_0200_0282 =
      rs_R003_ueqv_R003YY_partial_02_0269 := by
  native_decide

/-- Coefficient term 270 from coefficient polynomial 2. -/
def rs_R003_ueqv_R003YY_coefficient_02_0270 : Poly :=
[
  term ((-384 : Rat) / 7) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 270 for generator 2. -/
def rs_R003_ueqv_R003YY_partial_02_0270 : Poly :=
[
  term ((-384 : Rat) / 7) [(0, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-384 : Rat) / 7) [(1, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((384 : Rat) / 7) [(10, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((384 : Rat) / 7) [(11, 3), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 270 for generator 2. -/
theorem rs_R003_ueqv_R003YY_partial_02_0270_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_02_0270
        rs_R003_ueqv_R003YY_generator_02_0200_0282 =
      rs_R003_ueqv_R003YY_partial_02_0270 := by
  native_decide

/-- Coefficient term 271 from coefficient polynomial 2. -/
def rs_R003_ueqv_R003YY_coefficient_02_0271 : Poly :=
[
  term ((312 : Rat) / 7) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 271 for generator 2. -/
def rs_R003_ueqv_R003YY_partial_02_0271 : Poly :=
[
  term ((312 : Rat) / 7) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term ((312 : Rat) / 7) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term ((-312 : Rat) / 7) [(10, 2), (11, 1), (13, 1), (16, 1)],
  term ((-312 : Rat) / 7) [(11, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 271 for generator 2. -/
theorem rs_R003_ueqv_R003YY_partial_02_0271_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_02_0271
        rs_R003_ueqv_R003YY_generator_02_0200_0282 =
      rs_R003_ueqv_R003YY_partial_02_0271 := by
  native_decide

/-- Coefficient term 272 from coefficient polynomial 2. -/
def rs_R003_ueqv_R003YY_coefficient_02_0272 : Poly :=
[
  term ((-3461 : Rat) / 280) [(11, 1), (15, 1)]
]

/-- Partial product 272 for generator 2. -/
def rs_R003_ueqv_R003YY_partial_02_0272 : Poly :=
[
  term ((-3461 : Rat) / 280) [(0, 2), (11, 1), (15, 1)],
  term ((-3461 : Rat) / 280) [(1, 2), (11, 1), (15, 1)],
  term ((3461 : Rat) / 280) [(10, 2), (11, 1), (15, 1)],
  term ((3461 : Rat) / 280) [(11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 272 for generator 2. -/
theorem rs_R003_ueqv_R003YY_partial_02_0272_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_02_0272
        rs_R003_ueqv_R003YY_generator_02_0200_0282 =
      rs_R003_ueqv_R003YY_partial_02_0272 := by
  native_decide

/-- Coefficient term 273 from coefficient polynomial 2. -/
def rs_R003_ueqv_R003YY_coefficient_02_0273 : Poly :=
[
  term ((669 : Rat) / 280) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 273 for generator 2. -/
def rs_R003_ueqv_R003YY_partial_02_0273 : Poly :=
[
  term ((669 : Rat) / 280) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((669 : Rat) / 280) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-669 : Rat) / 280) [(10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-669 : Rat) / 280) [(11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 273 for generator 2. -/
theorem rs_R003_ueqv_R003YY_partial_02_0273_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_02_0273
        rs_R003_ueqv_R003YY_generator_02_0200_0282 =
      rs_R003_ueqv_R003YY_partial_02_0273 := by
  native_decide

/-- Coefficient term 274 from coefficient polynomial 2. -/
def rs_R003_ueqv_R003YY_coefficient_02_0274 : Poly :=
[
  term ((616 : Rat) / 5) [(12, 1)]
]

/-- Partial product 274 for generator 2. -/
def rs_R003_ueqv_R003YY_partial_02_0274 : Poly :=
[
  term ((616 : Rat) / 5) [(0, 2), (12, 1)],
  term ((616 : Rat) / 5) [(1, 2), (12, 1)],
  term ((-616 : Rat) / 5) [(10, 2), (12, 1)],
  term ((-616 : Rat) / 5) [(11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 274 for generator 2. -/
theorem rs_R003_ueqv_R003YY_partial_02_0274_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_02_0274
        rs_R003_ueqv_R003YY_generator_02_0200_0282 =
      rs_R003_ueqv_R003YY_partial_02_0274 := by
  native_decide

/-- Coefficient term 275 from coefficient polynomial 2. -/
def rs_R003_ueqv_R003YY_coefficient_02_0275 : Poly :=
[
  term ((-576 : Rat) / 5) [(12, 1), (14, 1)]
]

/-- Partial product 275 for generator 2. -/
def rs_R003_ueqv_R003YY_partial_02_0275 : Poly :=
[
  term ((-576 : Rat) / 5) [(0, 2), (12, 1), (14, 1)],
  term ((-576 : Rat) / 5) [(1, 2), (12, 1), (14, 1)],
  term ((576 : Rat) / 5) [(10, 2), (12, 1), (14, 1)],
  term ((576 : Rat) / 5) [(11, 2), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 275 for generator 2. -/
theorem rs_R003_ueqv_R003YY_partial_02_0275_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_02_0275
        rs_R003_ueqv_R003YY_generator_02_0200_0282 =
      rs_R003_ueqv_R003YY_partial_02_0275 := by
  native_decide

/-- Coefficient term 276 from coefficient polynomial 2. -/
def rs_R003_ueqv_R003YY_coefficient_02_0276 : Poly :=
[
  term ((-21761 : Rat) / 280) [(13, 1), (15, 1)]
]

/-- Partial product 276 for generator 2. -/
def rs_R003_ueqv_R003YY_partial_02_0276 : Poly :=
[
  term ((-21761 : Rat) / 280) [(0, 2), (13, 1), (15, 1)],
  term ((-21761 : Rat) / 280) [(1, 2), (13, 1), (15, 1)],
  term ((21761 : Rat) / 280) [(10, 2), (13, 1), (15, 1)],
  term ((21761 : Rat) / 280) [(11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 276 for generator 2. -/
theorem rs_R003_ueqv_R003YY_partial_02_0276_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_02_0276
        rs_R003_ueqv_R003YY_generator_02_0200_0282 =
      rs_R003_ueqv_R003YY_partial_02_0276 := by
  native_decide

/-- Coefficient term 277 from coefficient polynomial 2. -/
def rs_R003_ueqv_R003YY_coefficient_02_0277 : Poly :=
[
  term ((2361 : Rat) / 280) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 277 for generator 2. -/
def rs_R003_ueqv_R003YY_partial_02_0277 : Poly :=
[
  term ((2361 : Rat) / 280) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((2361 : Rat) / 280) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2361 : Rat) / 280) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2361 : Rat) / 280) [(11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 277 for generator 2. -/
theorem rs_R003_ueqv_R003YY_partial_02_0277_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_02_0277
        rs_R003_ueqv_R003YY_generator_02_0200_0282 =
      rs_R003_ueqv_R003YY_partial_02_0277 := by
  native_decide

/-- Coefficient term 278 from coefficient polynomial 2. -/
def rs_R003_ueqv_R003YY_coefficient_02_0278 : Poly :=
[
  term ((1436748 : Rat) / 53375) [(13, 2)]
]

/-- Partial product 278 for generator 2. -/
def rs_R003_ueqv_R003YY_partial_02_0278 : Poly :=
[
  term ((1436748 : Rat) / 53375) [(0, 2), (13, 2)],
  term ((1436748 : Rat) / 53375) [(1, 2), (13, 2)],
  term ((-1436748 : Rat) / 53375) [(10, 2), (13, 2)],
  term ((-1436748 : Rat) / 53375) [(11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 278 for generator 2. -/
theorem rs_R003_ueqv_R003YY_partial_02_0278_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_02_0278
        rs_R003_ueqv_R003YY_generator_02_0200_0282 =
      rs_R003_ueqv_R003YY_partial_02_0278 := by
  native_decide

/-- Coefficient term 279 from coefficient polynomial 2. -/
def rs_R003_ueqv_R003YY_coefficient_02_0279 : Poly :=
[
  term ((-1152 : Rat) / 35) [(13, 2), (14, 1)]
]

/-- Partial product 279 for generator 2. -/
def rs_R003_ueqv_R003YY_partial_02_0279 : Poly :=
[
  term ((-1152 : Rat) / 35) [(0, 2), (13, 2), (14, 1)],
  term ((-1152 : Rat) / 35) [(1, 2), (13, 2), (14, 1)],
  term ((1152 : Rat) / 35) [(10, 2), (13, 2), (14, 1)],
  term ((1152 : Rat) / 35) [(11, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 279 for generator 2. -/
theorem rs_R003_ueqv_R003YY_partial_02_0279_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_02_0279
        rs_R003_ueqv_R003YY_generator_02_0200_0282 =
      rs_R003_ueqv_R003YY_partial_02_0279 := by
  native_decide

/-- Coefficient term 280 from coefficient polynomial 2. -/
def rs_R003_ueqv_R003YY_coefficient_02_0280 : Poly :=
[
  term ((384 : Rat) / 35) [(13, 2), (14, 1), (16, 1)]
]

/-- Partial product 280 for generator 2. -/
def rs_R003_ueqv_R003YY_partial_02_0280 : Poly :=
[
  term ((384 : Rat) / 35) [(0, 2), (13, 2), (14, 1), (16, 1)],
  term ((384 : Rat) / 35) [(1, 2), (13, 2), (14, 1), (16, 1)],
  term ((-384 : Rat) / 35) [(10, 2), (13, 2), (14, 1), (16, 1)],
  term ((-384 : Rat) / 35) [(11, 2), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 280 for generator 2. -/
theorem rs_R003_ueqv_R003YY_partial_02_0280_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_02_0280
        rs_R003_ueqv_R003YY_generator_02_0200_0282 =
      rs_R003_ueqv_R003YY_partial_02_0280 := by
  native_decide

/-- Coefficient term 281 from coefficient polynomial 2. -/
def rs_R003_ueqv_R003YY_coefficient_02_0281 : Poly :=
[
  term ((-312 : Rat) / 35) [(13, 2), (16, 1)]
]

/-- Partial product 281 for generator 2. -/
def rs_R003_ueqv_R003YY_partial_02_0281 : Poly :=
[
  term ((-312 : Rat) / 35) [(0, 2), (13, 2), (16, 1)],
  term ((-312 : Rat) / 35) [(1, 2), (13, 2), (16, 1)],
  term ((312 : Rat) / 35) [(10, 2), (13, 2), (16, 1)],
  term ((312 : Rat) / 35) [(11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 281 for generator 2. -/
theorem rs_R003_ueqv_R003YY_partial_02_0281_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_02_0281
        rs_R003_ueqv_R003YY_generator_02_0200_0282 =
      rs_R003_ueqv_R003YY_partial_02_0281 := by
  native_decide

/-- Coefficient term 282 from coefficient polynomial 2. -/
def rs_R003_ueqv_R003YY_coefficient_02_0282 : Poly :=
[
  term ((432 : Rat) / 5) [(14, 1)]
]

/-- Partial product 282 for generator 2. -/
def rs_R003_ueqv_R003YY_partial_02_0282 : Poly :=
[
  term ((432 : Rat) / 5) [(0, 2), (14, 1)],
  term ((432 : Rat) / 5) [(1, 2), (14, 1)],
  term ((-432 : Rat) / 5) [(10, 2), (14, 1)],
  term ((-432 : Rat) / 5) [(11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 282 for generator 2. -/
theorem rs_R003_ueqv_R003YY_partial_02_0282_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_02_0282
        rs_R003_ueqv_R003YY_generator_02_0200_0282 =
      rs_R003_ueqv_R003YY_partial_02_0282 := by
  native_decide

/-- Partial products in this block. -/
def rs_R003_ueqv_R003YY_partials_02_0200_0282 : List Poly :=
[
  rs_R003_ueqv_R003YY_partial_02_0200,
  rs_R003_ueqv_R003YY_partial_02_0201,
  rs_R003_ueqv_R003YY_partial_02_0202,
  rs_R003_ueqv_R003YY_partial_02_0203,
  rs_R003_ueqv_R003YY_partial_02_0204,
  rs_R003_ueqv_R003YY_partial_02_0205,
  rs_R003_ueqv_R003YY_partial_02_0206,
  rs_R003_ueqv_R003YY_partial_02_0207,
  rs_R003_ueqv_R003YY_partial_02_0208,
  rs_R003_ueqv_R003YY_partial_02_0209,
  rs_R003_ueqv_R003YY_partial_02_0210,
  rs_R003_ueqv_R003YY_partial_02_0211,
  rs_R003_ueqv_R003YY_partial_02_0212,
  rs_R003_ueqv_R003YY_partial_02_0213,
  rs_R003_ueqv_R003YY_partial_02_0214,
  rs_R003_ueqv_R003YY_partial_02_0215,
  rs_R003_ueqv_R003YY_partial_02_0216,
  rs_R003_ueqv_R003YY_partial_02_0217,
  rs_R003_ueqv_R003YY_partial_02_0218,
  rs_R003_ueqv_R003YY_partial_02_0219,
  rs_R003_ueqv_R003YY_partial_02_0220,
  rs_R003_ueqv_R003YY_partial_02_0221,
  rs_R003_ueqv_R003YY_partial_02_0222,
  rs_R003_ueqv_R003YY_partial_02_0223,
  rs_R003_ueqv_R003YY_partial_02_0224,
  rs_R003_ueqv_R003YY_partial_02_0225,
  rs_R003_ueqv_R003YY_partial_02_0226,
  rs_R003_ueqv_R003YY_partial_02_0227,
  rs_R003_ueqv_R003YY_partial_02_0228,
  rs_R003_ueqv_R003YY_partial_02_0229,
  rs_R003_ueqv_R003YY_partial_02_0230,
  rs_R003_ueqv_R003YY_partial_02_0231,
  rs_R003_ueqv_R003YY_partial_02_0232,
  rs_R003_ueqv_R003YY_partial_02_0233,
  rs_R003_ueqv_R003YY_partial_02_0234,
  rs_R003_ueqv_R003YY_partial_02_0235,
  rs_R003_ueqv_R003YY_partial_02_0236,
  rs_R003_ueqv_R003YY_partial_02_0237,
  rs_R003_ueqv_R003YY_partial_02_0238,
  rs_R003_ueqv_R003YY_partial_02_0239,
  rs_R003_ueqv_R003YY_partial_02_0240,
  rs_R003_ueqv_R003YY_partial_02_0241,
  rs_R003_ueqv_R003YY_partial_02_0242,
  rs_R003_ueqv_R003YY_partial_02_0243,
  rs_R003_ueqv_R003YY_partial_02_0244,
  rs_R003_ueqv_R003YY_partial_02_0245,
  rs_R003_ueqv_R003YY_partial_02_0246,
  rs_R003_ueqv_R003YY_partial_02_0247,
  rs_R003_ueqv_R003YY_partial_02_0248,
  rs_R003_ueqv_R003YY_partial_02_0249,
  rs_R003_ueqv_R003YY_partial_02_0250,
  rs_R003_ueqv_R003YY_partial_02_0251,
  rs_R003_ueqv_R003YY_partial_02_0252,
  rs_R003_ueqv_R003YY_partial_02_0253,
  rs_R003_ueqv_R003YY_partial_02_0254,
  rs_R003_ueqv_R003YY_partial_02_0255,
  rs_R003_ueqv_R003YY_partial_02_0256,
  rs_R003_ueqv_R003YY_partial_02_0257,
  rs_R003_ueqv_R003YY_partial_02_0258,
  rs_R003_ueqv_R003YY_partial_02_0259,
  rs_R003_ueqv_R003YY_partial_02_0260,
  rs_R003_ueqv_R003YY_partial_02_0261,
  rs_R003_ueqv_R003YY_partial_02_0262,
  rs_R003_ueqv_R003YY_partial_02_0263,
  rs_R003_ueqv_R003YY_partial_02_0264,
  rs_R003_ueqv_R003YY_partial_02_0265,
  rs_R003_ueqv_R003YY_partial_02_0266,
  rs_R003_ueqv_R003YY_partial_02_0267,
  rs_R003_ueqv_R003YY_partial_02_0268,
  rs_R003_ueqv_R003YY_partial_02_0269,
  rs_R003_ueqv_R003YY_partial_02_0270,
  rs_R003_ueqv_R003YY_partial_02_0271,
  rs_R003_ueqv_R003YY_partial_02_0272,
  rs_R003_ueqv_R003YY_partial_02_0273,
  rs_R003_ueqv_R003YY_partial_02_0274,
  rs_R003_ueqv_R003YY_partial_02_0275,
  rs_R003_ueqv_R003YY_partial_02_0276,
  rs_R003_ueqv_R003YY_partial_02_0277,
  rs_R003_ueqv_R003YY_partial_02_0278,
  rs_R003_ueqv_R003YY_partial_02_0279,
  rs_R003_ueqv_R003YY_partial_02_0280,
  rs_R003_ueqv_R003YY_partial_02_0281,
  rs_R003_ueqv_R003YY_partial_02_0282
]

/-- Sum of partial products in this block. -/
def rs_R003_ueqv_R003YY_block_02_0200_0282 : Poly :=
[
  term ((243 : Rat) / 5) [(0, 2), (3, 1), (12, 1), (15, 1)],
  term ((-27 : Rat) / 5) [(0, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((432 : Rat) / 35) [(0, 2), (3, 1), (13, 1)],
  term ((216 : Rat) / 35) [(0, 2), (3, 1), (13, 1), (14, 1)],
  term ((-72 : Rat) / 35) [(0, 2), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((-144 : Rat) / 35) [(0, 2), (3, 1), (13, 1), (16, 1)],
  term ((-891 : Rat) / 20) [(0, 2), (3, 1), (15, 1)],
  term ((99 : Rat) / 20) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((-55296 : Rat) / 7625) [(0, 2), (4, 1), (5, 1), (9, 1), (13, 2)],
  term ((-41472 : Rat) / 7625) [(0, 2), (4, 1), (5, 1), (12, 1), (13, 1)],
  term ((55296 : Rat) / 7625) [(0, 2), (4, 1), (5, 1), (13, 1)],
  term ((6912 : Rat) / 7625) [(0, 2), (4, 1), (7, 1), (13, 1)],
  term ((528 : Rat) / 427) [(0, 2), (4, 1), (9, 1), (10, 1), (13, 1)],
  term ((-2112 : Rat) / 427) [(0, 2), (4, 1), (9, 1), (11, 1), (13, 2)],
  term ((-118224 : Rat) / 53375) [(0, 2), (4, 1), (9, 1), (12, 1), (13, 1)],
  term ((-134976 : Rat) / 53375) [(0, 2), (4, 1), (9, 1), (13, 1)],
  term ((-12576 : Rat) / 10675) [(0, 2), (4, 1), (10, 1), (13, 2)],
  term ((-40224 : Rat) / 10675) [(0, 2), (4, 1), (11, 1), (12, 1), (13, 1)],
  term ((33624 : Rat) / 10675) [(0, 2), (4, 1), (11, 1), (13, 1)],
  term ((792 : Rat) / 2135) [(0, 2), (4, 1), (13, 2)],
  term ((-13824 : Rat) / 7625) [(0, 2), (4, 2), (9, 1), (10, 1), (13, 1)],
  term ((55296 : Rat) / 7625) [(0, 2), (4, 2), (9, 1), (11, 1), (13, 2)],
  term ((13824 : Rat) / 7625) [(0, 2), (4, 2), (9, 1), (12, 1), (13, 1)],
  term ((55296 : Rat) / 7625) [(0, 2), (4, 2), (9, 1), (13, 1)],
  term ((27648 : Rat) / 7625) [(0, 2), (4, 2), (10, 1), (13, 2)],
  term ((27648 : Rat) / 7625) [(0, 2), (4, 2), (11, 1), (12, 1), (13, 1)],
  term ((-20736 : Rat) / 7625) [(0, 2), (4, 2), (11, 1), (13, 1)],
  term ((-48384 : Rat) / 7625) [(0, 2), (4, 2), (13, 2)],
  term ((10944 : Rat) / 7625) [(0, 2), (5, 1), (9, 1), (13, 2)],
  term ((8208 : Rat) / 7625) [(0, 2), (5, 1), (12, 1), (13, 1)],
  term ((-10944 : Rat) / 7625) [(0, 2), (5, 1), (13, 1)],
  term ((-1368 : Rat) / 7625) [(0, 2), (7, 1), (13, 1)],
  term ((-31352 : Rat) / 875) [(0, 2), (9, 1), (10, 1), (13, 1)],
  term ((1536 : Rat) / 35) [(0, 2), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((-512 : Rat) / 35) [(0, 2), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((416 : Rat) / 35) [(0, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-9209 : Rat) / 420) [(0, 2), (9, 1), (10, 1), (15, 1)],
  term ((379 : Rat) / 140) [(0, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((9209 : Rat) / 105) [(0, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-379 : Rat) / 35) [(0, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((125408 : Rat) / 875) [(0, 2), (9, 1), (11, 1), (13, 2)],
  term ((-6144 : Rat) / 35) [(0, 2), (9, 1), (11, 1), (13, 2), (14, 1)],
  term ((2048 : Rat) / 35) [(0, 2), (9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-1664 : Rat) / 35) [(0, 2), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-2835192 : Rat) / 53375) [(0, 2), (9, 1), (12, 1), (13, 1)],
  term ((2304 : Rat) / 35) [(0, 2), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-768 : Rat) / 35) [(0, 2), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((624 : Rat) / 35) [(0, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((3617 : Rat) / 140) [(0, 2), (9, 1), (12, 1), (15, 1)],
  term ((-69 : Rat) / 28) [(0, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((2628452 : Rat) / 53375) [(0, 2), (9, 1), (13, 1)],
  term ((-2112 : Rat) / 35) [(0, 2), (9, 1), (13, 1), (14, 1)],
  term ((704 : Rat) / 35) [(0, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-572 : Rat) / 35) [(0, 2), (9, 1), (13, 1), (16, 1)],
  term ((-827 : Rat) / 84) [(0, 2), (9, 1), (15, 1)],
  term ((101 : Rat) / 140) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((1352 : Rat) / 21) [(0, 2), (10, 1), (13, 1), (15, 1)],
  term ((-248 : Rat) / 35) [(0, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-470936 : Rat) / 53375) [(0, 2), (10, 1), (13, 2)],
  term ((384 : Rat) / 35) [(0, 2), (10, 1), (13, 2), (14, 1)],
  term ((-128 : Rat) / 35) [(0, 2), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((104 : Rat) / 35) [(0, 2), (10, 1), (13, 2), (16, 1)],
  term ((8120824 : Rat) / 53375) [(0, 2), (11, 1), (12, 1), (13, 1)],
  term ((-6528 : Rat) / 35) [(0, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((2176 : Rat) / 35) [(0, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1768 : Rat) / 35) [(0, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((2449 : Rat) / 105) [(0, 2), (11, 1), (12, 1), (15, 1)],
  term ((-131 : Rat) / 35) [(0, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-7164588 : Rat) / 53375) [(0, 2), (11, 1), (13, 1)],
  term ((1152 : Rat) / 7) [(0, 2), (11, 1), (13, 1), (14, 1)],
  term ((-384 : Rat) / 7) [(0, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((312 : Rat) / 7) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term ((-3461 : Rat) / 280) [(0, 2), (11, 1), (15, 1)],
  term ((669 : Rat) / 280) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((616 : Rat) / 5) [(0, 2), (12, 1)],
  term ((-576 : Rat) / 5) [(0, 2), (12, 1), (14, 1)],
  term ((-21761 : Rat) / 280) [(0, 2), (13, 1), (15, 1)],
  term ((2361 : Rat) / 280) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((1436748 : Rat) / 53375) [(0, 2), (13, 2)],
  term ((-1152 : Rat) / 35) [(0, 2), (13, 2), (14, 1)],
  term ((384 : Rat) / 35) [(0, 2), (13, 2), (14, 1), (16, 1)],
  term ((-312 : Rat) / 35) [(0, 2), (13, 2), (16, 1)],
  term ((432 : Rat) / 5) [(0, 2), (14, 1)],
  term ((243 : Rat) / 5) [(1, 2), (3, 1), (12, 1), (15, 1)],
  term ((-27 : Rat) / 5) [(1, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((432 : Rat) / 35) [(1, 2), (3, 1), (13, 1)],
  term ((216 : Rat) / 35) [(1, 2), (3, 1), (13, 1), (14, 1)],
  term ((-72 : Rat) / 35) [(1, 2), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((-144 : Rat) / 35) [(1, 2), (3, 1), (13, 1), (16, 1)],
  term ((-891 : Rat) / 20) [(1, 2), (3, 1), (15, 1)],
  term ((99 : Rat) / 20) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((-55296 : Rat) / 7625) [(1, 2), (4, 1), (5, 1), (9, 1), (13, 2)],
  term ((-41472 : Rat) / 7625) [(1, 2), (4, 1), (5, 1), (12, 1), (13, 1)],
  term ((55296 : Rat) / 7625) [(1, 2), (4, 1), (5, 1), (13, 1)],
  term ((6912 : Rat) / 7625) [(1, 2), (4, 1), (7, 1), (13, 1)],
  term ((528 : Rat) / 427) [(1, 2), (4, 1), (9, 1), (10, 1), (13, 1)],
  term ((-2112 : Rat) / 427) [(1, 2), (4, 1), (9, 1), (11, 1), (13, 2)],
  term ((-118224 : Rat) / 53375) [(1, 2), (4, 1), (9, 1), (12, 1), (13, 1)],
  term ((-134976 : Rat) / 53375) [(1, 2), (4, 1), (9, 1), (13, 1)],
  term ((-12576 : Rat) / 10675) [(1, 2), (4, 1), (10, 1), (13, 2)],
  term ((-40224 : Rat) / 10675) [(1, 2), (4, 1), (11, 1), (12, 1), (13, 1)],
  term ((33624 : Rat) / 10675) [(1, 2), (4, 1), (11, 1), (13, 1)],
  term ((792 : Rat) / 2135) [(1, 2), (4, 1), (13, 2)],
  term ((-13824 : Rat) / 7625) [(1, 2), (4, 2), (9, 1), (10, 1), (13, 1)],
  term ((55296 : Rat) / 7625) [(1, 2), (4, 2), (9, 1), (11, 1), (13, 2)],
  term ((13824 : Rat) / 7625) [(1, 2), (4, 2), (9, 1), (12, 1), (13, 1)],
  term ((55296 : Rat) / 7625) [(1, 2), (4, 2), (9, 1), (13, 1)],
  term ((27648 : Rat) / 7625) [(1, 2), (4, 2), (10, 1), (13, 2)],
  term ((27648 : Rat) / 7625) [(1, 2), (4, 2), (11, 1), (12, 1), (13, 1)],
  term ((-20736 : Rat) / 7625) [(1, 2), (4, 2), (11, 1), (13, 1)],
  term ((-48384 : Rat) / 7625) [(1, 2), (4, 2), (13, 2)],
  term ((10944 : Rat) / 7625) [(1, 2), (5, 1), (9, 1), (13, 2)],
  term ((8208 : Rat) / 7625) [(1, 2), (5, 1), (12, 1), (13, 1)],
  term ((-10944 : Rat) / 7625) [(1, 2), (5, 1), (13, 1)],
  term ((-1368 : Rat) / 7625) [(1, 2), (7, 1), (13, 1)],
  term ((-31352 : Rat) / 875) [(1, 2), (9, 1), (10, 1), (13, 1)],
  term ((1536 : Rat) / 35) [(1, 2), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((-512 : Rat) / 35) [(1, 2), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((416 : Rat) / 35) [(1, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-9209 : Rat) / 420) [(1, 2), (9, 1), (10, 1), (15, 1)],
  term ((379 : Rat) / 140) [(1, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((9209 : Rat) / 105) [(1, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-379 : Rat) / 35) [(1, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((125408 : Rat) / 875) [(1, 2), (9, 1), (11, 1), (13, 2)],
  term ((-6144 : Rat) / 35) [(1, 2), (9, 1), (11, 1), (13, 2), (14, 1)],
  term ((2048 : Rat) / 35) [(1, 2), (9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-1664 : Rat) / 35) [(1, 2), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-2835192 : Rat) / 53375) [(1, 2), (9, 1), (12, 1), (13, 1)],
  term ((2304 : Rat) / 35) [(1, 2), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-768 : Rat) / 35) [(1, 2), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((624 : Rat) / 35) [(1, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((3617 : Rat) / 140) [(1, 2), (9, 1), (12, 1), (15, 1)],
  term ((-69 : Rat) / 28) [(1, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((2628452 : Rat) / 53375) [(1, 2), (9, 1), (13, 1)],
  term ((-2112 : Rat) / 35) [(1, 2), (9, 1), (13, 1), (14, 1)],
  term ((704 : Rat) / 35) [(1, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-572 : Rat) / 35) [(1, 2), (9, 1), (13, 1), (16, 1)],
  term ((-827 : Rat) / 84) [(1, 2), (9, 1), (15, 1)],
  term ((101 : Rat) / 140) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((1352 : Rat) / 21) [(1, 2), (10, 1), (13, 1), (15, 1)],
  term ((-248 : Rat) / 35) [(1, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-470936 : Rat) / 53375) [(1, 2), (10, 1), (13, 2)],
  term ((384 : Rat) / 35) [(1, 2), (10, 1), (13, 2), (14, 1)],
  term ((-128 : Rat) / 35) [(1, 2), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((104 : Rat) / 35) [(1, 2), (10, 1), (13, 2), (16, 1)],
  term ((8120824 : Rat) / 53375) [(1, 2), (11, 1), (12, 1), (13, 1)],
  term ((-6528 : Rat) / 35) [(1, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((2176 : Rat) / 35) [(1, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1768 : Rat) / 35) [(1, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((2449 : Rat) / 105) [(1, 2), (11, 1), (12, 1), (15, 1)],
  term ((-131 : Rat) / 35) [(1, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-7164588 : Rat) / 53375) [(1, 2), (11, 1), (13, 1)],
  term ((1152 : Rat) / 7) [(1, 2), (11, 1), (13, 1), (14, 1)],
  term ((-384 : Rat) / 7) [(1, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((312 : Rat) / 7) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term ((-3461 : Rat) / 280) [(1, 2), (11, 1), (15, 1)],
  term ((669 : Rat) / 280) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((616 : Rat) / 5) [(1, 2), (12, 1)],
  term ((-576 : Rat) / 5) [(1, 2), (12, 1), (14, 1)],
  term ((-21761 : Rat) / 280) [(1, 2), (13, 1), (15, 1)],
  term ((2361 : Rat) / 280) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((1436748 : Rat) / 53375) [(1, 2), (13, 2)],
  term ((-1152 : Rat) / 35) [(1, 2), (13, 2), (14, 1)],
  term ((384 : Rat) / 35) [(1, 2), (13, 2), (14, 1), (16, 1)],
  term ((-312 : Rat) / 35) [(1, 2), (13, 2), (16, 1)],
  term ((432 : Rat) / 5) [(1, 2), (14, 1)],
  term ((-243 : Rat) / 5) [(3, 1), (10, 2), (12, 1), (15, 1)],
  term ((27 : Rat) / 5) [(3, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((-432 : Rat) / 35) [(3, 1), (10, 2), (13, 1)],
  term ((-216 : Rat) / 35) [(3, 1), (10, 2), (13, 1), (14, 1)],
  term ((72 : Rat) / 35) [(3, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((144 : Rat) / 35) [(3, 1), (10, 2), (13, 1), (16, 1)],
  term ((891 : Rat) / 20) [(3, 1), (10, 2), (15, 1)],
  term ((-99 : Rat) / 20) [(3, 1), (10, 2), (15, 1), (16, 1)],
  term ((-243 : Rat) / 5) [(3, 1), (11, 2), (12, 1), (15, 1)],
  term ((27 : Rat) / 5) [(3, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-432 : Rat) / 35) [(3, 1), (11, 2), (13, 1)],
  term ((-216 : Rat) / 35) [(3, 1), (11, 2), (13, 1), (14, 1)],
  term ((72 : Rat) / 35) [(3, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((144 : Rat) / 35) [(3, 1), (11, 2), (13, 1), (16, 1)],
  term ((891 : Rat) / 20) [(3, 1), (11, 2), (15, 1)],
  term ((-99 : Rat) / 20) [(3, 1), (11, 2), (15, 1), (16, 1)],
  term ((55296 : Rat) / 7625) [(4, 1), (5, 1), (9, 1), (10, 2), (13, 2)],
  term ((55296 : Rat) / 7625) [(4, 1), (5, 1), (9, 1), (11, 2), (13, 2)],
  term ((41472 : Rat) / 7625) [(4, 1), (5, 1), (10, 2), (12, 1), (13, 1)],
  term ((-55296 : Rat) / 7625) [(4, 1), (5, 1), (10, 2), (13, 1)],
  term ((41472 : Rat) / 7625) [(4, 1), (5, 1), (11, 2), (12, 1), (13, 1)],
  term ((-55296 : Rat) / 7625) [(4, 1), (5, 1), (11, 2), (13, 1)],
  term ((-6912 : Rat) / 7625) [(4, 1), (7, 1), (10, 2), (13, 1)],
  term ((-6912 : Rat) / 7625) [(4, 1), (7, 1), (11, 2), (13, 1)],
  term ((-528 : Rat) / 427) [(4, 1), (9, 1), (10, 1), (11, 2), (13, 1)],
  term ((2112 : Rat) / 427) [(4, 1), (9, 1), (10, 2), (11, 1), (13, 2)],
  term ((118224 : Rat) / 53375) [(4, 1), (9, 1), (10, 2), (12, 1), (13, 1)],
  term ((134976 : Rat) / 53375) [(4, 1), (9, 1), (10, 2), (13, 1)],
  term ((-528 : Rat) / 427) [(4, 1), (9, 1), (10, 3), (13, 1)],
  term ((118224 : Rat) / 53375) [(4, 1), (9, 1), (11, 2), (12, 1), (13, 1)],
  term ((134976 : Rat) / 53375) [(4, 1), (9, 1), (11, 2), (13, 1)],
  term ((2112 : Rat) / 427) [(4, 1), (9, 1), (11, 3), (13, 2)],
  term ((12576 : Rat) / 10675) [(4, 1), (10, 1), (11, 2), (13, 2)],
  term ((40224 : Rat) / 10675) [(4, 1), (10, 2), (11, 1), (12, 1), (13, 1)],
  term ((-33624 : Rat) / 10675) [(4, 1), (10, 2), (11, 1), (13, 1)],
  term ((-792 : Rat) / 2135) [(4, 1), (10, 2), (13, 2)],
  term ((12576 : Rat) / 10675) [(4, 1), (10, 3), (13, 2)],
  term ((-792 : Rat) / 2135) [(4, 1), (11, 2), (13, 2)],
  term ((40224 : Rat) / 10675) [(4, 1), (11, 3), (12, 1), (13, 1)],
  term ((-33624 : Rat) / 10675) [(4, 1), (11, 3), (13, 1)],
  term ((13824 : Rat) / 7625) [(4, 2), (9, 1), (10, 1), (11, 2), (13, 1)],
  term ((-55296 : Rat) / 7625) [(4, 2), (9, 1), (10, 2), (11, 1), (13, 2)],
  term ((-13824 : Rat) / 7625) [(4, 2), (9, 1), (10, 2), (12, 1), (13, 1)],
  term ((-55296 : Rat) / 7625) [(4, 2), (9, 1), (10, 2), (13, 1)],
  term ((13824 : Rat) / 7625) [(4, 2), (9, 1), (10, 3), (13, 1)],
  term ((-13824 : Rat) / 7625) [(4, 2), (9, 1), (11, 2), (12, 1), (13, 1)],
  term ((-55296 : Rat) / 7625) [(4, 2), (9, 1), (11, 2), (13, 1)],
  term ((-55296 : Rat) / 7625) [(4, 2), (9, 1), (11, 3), (13, 2)],
  term ((-27648 : Rat) / 7625) [(4, 2), (10, 1), (11, 2), (13, 2)],
  term ((-27648 : Rat) / 7625) [(4, 2), (10, 2), (11, 1), (12, 1), (13, 1)],
  term ((20736 : Rat) / 7625) [(4, 2), (10, 2), (11, 1), (13, 1)],
  term ((48384 : Rat) / 7625) [(4, 2), (10, 2), (13, 2)],
  term ((-27648 : Rat) / 7625) [(4, 2), (10, 3), (13, 2)],
  term ((48384 : Rat) / 7625) [(4, 2), (11, 2), (13, 2)],
  term ((-27648 : Rat) / 7625) [(4, 2), (11, 3), (12, 1), (13, 1)],
  term ((20736 : Rat) / 7625) [(4, 2), (11, 3), (13, 1)],
  term ((-10944 : Rat) / 7625) [(5, 1), (9, 1), (10, 2), (13, 2)],
  term ((-10944 : Rat) / 7625) [(5, 1), (9, 1), (11, 2), (13, 2)],
  term ((-8208 : Rat) / 7625) [(5, 1), (10, 2), (12, 1), (13, 1)],
  term ((10944 : Rat) / 7625) [(5, 1), (10, 2), (13, 1)],
  term ((-8208 : Rat) / 7625) [(5, 1), (11, 2), (12, 1), (13, 1)],
  term ((10944 : Rat) / 7625) [(5, 1), (11, 2), (13, 1)],
  term ((1368 : Rat) / 7625) [(7, 1), (10, 2), (13, 1)],
  term ((1368 : Rat) / 7625) [(7, 1), (11, 2), (13, 1)],
  term ((31352 : Rat) / 875) [(9, 1), (10, 1), (11, 2), (13, 1)],
  term ((-1536 : Rat) / 35) [(9, 1), (10, 1), (11, 2), (13, 1), (14, 1)],
  term ((512 : Rat) / 35) [(9, 1), (10, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-416 : Rat) / 35) [(9, 1), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((9209 : Rat) / 420) [(9, 1), (10, 1), (11, 2), (15, 1)],
  term ((-379 : Rat) / 140) [(9, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((-9209 : Rat) / 105) [(9, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((379 : Rat) / 35) [(9, 1), (10, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-125408 : Rat) / 875) [(9, 1), (10, 2), (11, 1), (13, 2)],
  term ((6144 : Rat) / 35) [(9, 1), (10, 2), (11, 1), (13, 2), (14, 1)],
  term ((-2048 : Rat) / 35) [(9, 1), (10, 2), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((1664 : Rat) / 35) [(9, 1), (10, 2), (11, 1), (13, 2), (16, 1)],
  term ((2835192 : Rat) / 53375) [(9, 1), (10, 2), (12, 1), (13, 1)],
  term ((-2304 : Rat) / 35) [(9, 1), (10, 2), (12, 1), (13, 1), (14, 1)],
  term ((768 : Rat) / 35) [(9, 1), (10, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-624 : Rat) / 35) [(9, 1), (10, 2), (12, 1), (13, 1), (16, 1)],
  term ((-3617 : Rat) / 140) [(9, 1), (10, 2), (12, 1), (15, 1)],
  term ((69 : Rat) / 28) [(9, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((-2628452 : Rat) / 53375) [(9, 1), (10, 2), (13, 1)],
  term ((2112 : Rat) / 35) [(9, 1), (10, 2), (13, 1), (14, 1)],
  term ((-704 : Rat) / 35) [(9, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((572 : Rat) / 35) [(9, 1), (10, 2), (13, 1), (16, 1)],
  term ((827 : Rat) / 84) [(9, 1), (10, 2), (15, 1)],
  term ((-101 : Rat) / 140) [(9, 1), (10, 2), (15, 1), (16, 1)],
  term ((31352 : Rat) / 875) [(9, 1), (10, 3), (13, 1)],
  term ((-1536 : Rat) / 35) [(9, 1), (10, 3), (13, 1), (14, 1)],
  term ((512 : Rat) / 35) [(9, 1), (10, 3), (13, 1), (14, 1), (16, 1)],
  term ((-416 : Rat) / 35) [(9, 1), (10, 3), (13, 1), (16, 1)],
  term ((9209 : Rat) / 420) [(9, 1), (10, 3), (15, 1)],
  term ((-379 : Rat) / 140) [(9, 1), (10, 3), (15, 1), (16, 1)],
  term ((2835192 : Rat) / 53375) [(9, 1), (11, 2), (12, 1), (13, 1)],
  term ((-2304 : Rat) / 35) [(9, 1), (11, 2), (12, 1), (13, 1), (14, 1)],
  term ((768 : Rat) / 35) [(9, 1), (11, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-624 : Rat) / 35) [(9, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((-3617 : Rat) / 140) [(9, 1), (11, 2), (12, 1), (15, 1)],
  term ((69 : Rat) / 28) [(9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-2628452 : Rat) / 53375) [(9, 1), (11, 2), (13, 1)],
  term ((2112 : Rat) / 35) [(9, 1), (11, 2), (13, 1), (14, 1)],
  term ((-704 : Rat) / 35) [(9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((572 : Rat) / 35) [(9, 1), (11, 2), (13, 1), (16, 1)],
  term ((827 : Rat) / 84) [(9, 1), (11, 2), (15, 1)],
  term ((-101 : Rat) / 140) [(9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-9209 : Rat) / 105) [(9, 1), (11, 3), (13, 1), (15, 1)],
  term ((379 : Rat) / 35) [(9, 1), (11, 3), (13, 1), (15, 1), (16, 1)],
  term ((-125408 : Rat) / 875) [(9, 1), (11, 3), (13, 2)],
  term ((6144 : Rat) / 35) [(9, 1), (11, 3), (13, 2), (14, 1)],
  term ((-2048 : Rat) / 35) [(9, 1), (11, 3), (13, 2), (14, 1), (16, 1)],
  term ((1664 : Rat) / 35) [(9, 1), (11, 3), (13, 2), (16, 1)],
  term ((-1352 : Rat) / 21) [(10, 1), (11, 2), (13, 1), (15, 1)],
  term ((248 : Rat) / 35) [(10, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((470936 : Rat) / 53375) [(10, 1), (11, 2), (13, 2)],
  term ((-384 : Rat) / 35) [(10, 1), (11, 2), (13, 2), (14, 1)],
  term ((128 : Rat) / 35) [(10, 1), (11, 2), (13, 2), (14, 1), (16, 1)],
  term ((-104 : Rat) / 35) [(10, 1), (11, 2), (13, 2), (16, 1)],
  term ((-8120824 : Rat) / 53375) [(10, 2), (11, 1), (12, 1), (13, 1)],
  term ((6528 : Rat) / 35) [(10, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-2176 : Rat) / 35) [(10, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((1768 : Rat) / 35) [(10, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-2449 : Rat) / 105) [(10, 2), (11, 1), (12, 1), (15, 1)],
  term ((131 : Rat) / 35) [(10, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((7164588 : Rat) / 53375) [(10, 2), (11, 1), (13, 1)],
  term ((-1152 : Rat) / 7) [(10, 2), (11, 1), (13, 1), (14, 1)],
  term ((384 : Rat) / 7) [(10, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-312 : Rat) / 7) [(10, 2), (11, 1), (13, 1), (16, 1)],
  term ((3461 : Rat) / 280) [(10, 2), (11, 1), (15, 1)],
  term ((-669 : Rat) / 280) [(10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-616 : Rat) / 5) [(10, 2), (12, 1)],
  term ((576 : Rat) / 5) [(10, 2), (12, 1), (14, 1)],
  term ((21761 : Rat) / 280) [(10, 2), (13, 1), (15, 1)],
  term ((-2361 : Rat) / 280) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1436748 : Rat) / 53375) [(10, 2), (13, 2)],
  term ((1152 : Rat) / 35) [(10, 2), (13, 2), (14, 1)],
  term ((-384 : Rat) / 35) [(10, 2), (13, 2), (14, 1), (16, 1)],
  term ((312 : Rat) / 35) [(10, 2), (13, 2), (16, 1)],
  term ((-432 : Rat) / 5) [(10, 2), (14, 1)],
  term ((-1352 : Rat) / 21) [(10, 3), (13, 1), (15, 1)],
  term ((248 : Rat) / 35) [(10, 3), (13, 1), (15, 1), (16, 1)],
  term ((470936 : Rat) / 53375) [(10, 3), (13, 2)],
  term ((-384 : Rat) / 35) [(10, 3), (13, 2), (14, 1)],
  term ((128 : Rat) / 35) [(10, 3), (13, 2), (14, 1), (16, 1)],
  term ((-104 : Rat) / 35) [(10, 3), (13, 2), (16, 1)],
  term ((-616 : Rat) / 5) [(11, 2), (12, 1)],
  term ((576 : Rat) / 5) [(11, 2), (12, 1), (14, 1)],
  term ((21761 : Rat) / 280) [(11, 2), (13, 1), (15, 1)],
  term ((-2361 : Rat) / 280) [(11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1436748 : Rat) / 53375) [(11, 2), (13, 2)],
  term ((1152 : Rat) / 35) [(11, 2), (13, 2), (14, 1)],
  term ((-384 : Rat) / 35) [(11, 2), (13, 2), (14, 1), (16, 1)],
  term ((312 : Rat) / 35) [(11, 2), (13, 2), (16, 1)],
  term ((-432 : Rat) / 5) [(11, 2), (14, 1)],
  term ((-8120824 : Rat) / 53375) [(11, 3), (12, 1), (13, 1)],
  term ((6528 : Rat) / 35) [(11, 3), (12, 1), (13, 1), (14, 1)],
  term ((-2176 : Rat) / 35) [(11, 3), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((1768 : Rat) / 35) [(11, 3), (12, 1), (13, 1), (16, 1)],
  term ((-2449 : Rat) / 105) [(11, 3), (12, 1), (15, 1)],
  term ((131 : Rat) / 35) [(11, 3), (12, 1), (15, 1), (16, 1)],
  term ((7164588 : Rat) / 53375) [(11, 3), (13, 1)],
  term ((-1152 : Rat) / 7) [(11, 3), (13, 1), (14, 1)],
  term ((384 : Rat) / 7) [(11, 3), (13, 1), (14, 1), (16, 1)],
  term ((-312 : Rat) / 7) [(11, 3), (13, 1), (16, 1)],
  term ((3461 : Rat) / 280) [(11, 3), (15, 1)],
  term ((-669 : Rat) / 280) [(11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 2, terms 200 through 282. -/
theorem rs_R003_ueqv_R003YY_block_02_0200_0282_valid :
    checkProductSumEq rs_R003_ueqv_R003YY_partials_02_0200_0282
      rs_R003_ueqv_R003YY_block_02_0200_0282 = true := by
  native_decide

end R003UeqvR003YYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
