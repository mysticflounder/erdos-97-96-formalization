/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NNNNN, term block 16:200-286

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NNNNNTermShards

/-- Generator polynomial 16 for relaxed split surplus certificate `R009:u=v:R009NNNNN`. -/
def rs_R009_ueqv_R009NNNNN_generator_16_0200_0286 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(6, 1)]
]

/-- Coefficient term 200 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNNN_coefficient_16_0200 : Poly :=
[
  term ((288 : Rat) / 589) [(3, 2), (16, 1)]
]

/-- Partial product 200 for generator 16. -/
def rs_R009_ueqv_R009NNNNN_partial_16_0200 : Poly :=
[
  term ((576 : Rat) / 589) [(3, 2), (6, 1), (16, 1)],
  term ((-288 : Rat) / 589) [(3, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 16. -/
theorem rs_R009_ueqv_R009NNNNN_partial_16_0200_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_16_0200
        rs_R009_ueqv_R009NNNNN_generator_16_0200_0286 =
      rs_R009_ueqv_R009NNNNN_partial_16_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNNN_coefficient_16_0201 : Poly :=
[
  term ((513 : Rat) / 31) [(4, 1), (5, 1), (13, 1), (16, 1)]
]

/-- Partial product 201 for generator 16. -/
def rs_R009_ueqv_R009NNNNN_partial_16_0201 : Poly :=
[
  term ((1026 : Rat) / 31) [(4, 1), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((-513 : Rat) / 31) [(4, 1), (5, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 16. -/
theorem rs_R009_ueqv_R009NNNNN_partial_16_0201_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_16_0201
        rs_R009_ueqv_R009NNNNN_generator_16_0200_0286 =
      rs_R009_ueqv_R009NNNNN_partial_16_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNNN_coefficient_16_0202 : Poly :=
[
  term ((92129 : Rat) / 1178) [(4, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 202 for generator 16. -/
def rs_R009_ueqv_R009NNNNN_partial_16_0202 : Poly :=
[
  term ((92129 : Rat) / 589) [(4, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-92129 : Rat) / 1178) [(4, 1), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 16. -/
theorem rs_R009_ueqv_R009NNNNN_partial_16_0202_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_16_0202
        rs_R009_ueqv_R009NNNNN_generator_16_0200_0286 =
      rs_R009_ueqv_R009NNNNN_partial_16_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNNN_coefficient_16_0203 : Poly :=
[
  term ((456 : Rat) / 31) [(4, 1), (7, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 203 for generator 16. -/
def rs_R009_ueqv_R009NNNNN_partial_16_0203 : Poly :=
[
  term ((912 : Rat) / 31) [(4, 1), (6, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-456 : Rat) / 31) [(4, 1), (7, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 16. -/
theorem rs_R009_ueqv_R009NNNNN_partial_16_0203_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_16_0203
        rs_R009_ueqv_R009NNNNN_generator_16_0200_0286 =
      rs_R009_ueqv_R009NNNNN_partial_16_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNNN_coefficient_16_0204 : Poly :=
[
  term ((113740 : Rat) / 1767) [(4, 1), (7, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 204 for generator 16. -/
def rs_R009_ueqv_R009NNNNN_partial_16_0204 : Poly :=
[
  term ((227480 : Rat) / 1767) [(4, 1), (6, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-113740 : Rat) / 1767) [(4, 1), (7, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 16. -/
theorem rs_R009_ueqv_R009NNNNN_partial_16_0204_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_16_0204
        rs_R009_ueqv_R009NNNNN_generator_16_0200_0286 =
      rs_R009_ueqv_R009NNNNN_partial_16_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNNN_coefficient_16_0205 : Poly :=
[
  term ((1026 : Rat) / 31) [(4, 1), (7, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 205 for generator 16. -/
def rs_R009_ueqv_R009NNNNN_partial_16_0205 : Poly :=
[
  term ((2052 : Rat) / 31) [(4, 1), (6, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1026 : Rat) / 31) [(4, 1), (7, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 16. -/
theorem rs_R009_ueqv_R009NNNNN_partial_16_0205_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_16_0205
        rs_R009_ueqv_R009NNNNN_generator_16_0200_0286 =
      rs_R009_ueqv_R009NNNNN_partial_16_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNNN_coefficient_16_0206 : Poly :=
[
  term ((66539 : Rat) / 589) [(4, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 206 for generator 16. -/
def rs_R009_ueqv_R009NNNNN_partial_16_0206 : Poly :=
[
  term ((133078 : Rat) / 589) [(4, 1), (6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-66539 : Rat) / 589) [(4, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 16. -/
theorem rs_R009_ueqv_R009NNNNN_partial_16_0206_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_16_0206
        rs_R009_ueqv_R009NNNNN_generator_16_0200_0286 =
      rs_R009_ueqv_R009NNNNN_partial_16_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNNN_coefficient_16_0207 : Poly :=
[
  term ((-2185 : Rat) / 62) [(4, 1), (7, 1), (13, 1), (16, 1)]
]

/-- Partial product 207 for generator 16. -/
def rs_R009_ueqv_R009NNNNN_partial_16_0207 : Poly :=
[
  term ((-2185 : Rat) / 31) [(4, 1), (6, 1), (7, 1), (13, 1), (16, 1)],
  term ((2185 : Rat) / 62) [(4, 1), (7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 16. -/
theorem rs_R009_ueqv_R009NNNNN_partial_16_0207_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_16_0207
        rs_R009_ueqv_R009NNNNN_generator_16_0200_0286 =
      rs_R009_ueqv_R009NNNNN_partial_16_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNNN_coefficient_16_0208 : Poly :=
[
  term ((-299957 : Rat) / 2356) [(4, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 208 for generator 16. -/
def rs_R009_ueqv_R009NNNNN_partial_16_0208 : Poly :=
[
  term ((-299957 : Rat) / 1178) [(4, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((299957 : Rat) / 2356) [(4, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 16. -/
theorem rs_R009_ueqv_R009NNNNN_partial_16_0208_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_16_0208
        rs_R009_ueqv_R009NNNNN_generator_16_0200_0286 =
      rs_R009_ueqv_R009NNNNN_partial_16_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNNN_coefficient_16_0209 : Poly :=
[
  term ((-214484 : Rat) / 1767) [(4, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 209 for generator 16. -/
def rs_R009_ueqv_R009NNNNN_partial_16_0209 : Poly :=
[
  term ((-428968 : Rat) / 1767) [(4, 1), (6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((214484 : Rat) / 1767) [(4, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 16. -/
theorem rs_R009_ueqv_R009NNNNN_partial_16_0209_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_16_0209
        rs_R009_ueqv_R009NNNNN_generator_16_0200_0286 =
      rs_R009_ueqv_R009NNNNN_partial_16_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNNN_coefficient_16_0210 : Poly :=
[
  term ((-912 : Rat) / 31) [(4, 1), (10, 1), (13, 2), (16, 1)]
]

/-- Partial product 210 for generator 16. -/
def rs_R009_ueqv_R009NNNNN_partial_16_0210 : Poly :=
[
  term ((-1824 : Rat) / 31) [(4, 1), (6, 1), (10, 1), (13, 2), (16, 1)],
  term ((912 : Rat) / 31) [(4, 1), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 16. -/
theorem rs_R009_ueqv_R009NNNNN_partial_16_0210_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_16_0210
        rs_R009_ueqv_R009NNNNN_generator_16_0200_0286 =
      rs_R009_ueqv_R009NNNNN_partial_16_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNNN_coefficient_16_0211 : Poly :=
[
  term ((56870 : Rat) / 1767) [(4, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 211 for generator 16. -/
def rs_R009_ueqv_R009NNNNN_partial_16_0211 : Poly :=
[
  term ((113740 : Rat) / 1767) [(4, 1), (6, 1), (10, 1), (15, 2), (16, 1)],
  term ((-56870 : Rat) / 1767) [(4, 1), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 16. -/
theorem rs_R009_ueqv_R009NNNNN_partial_16_0211_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_16_0211
        rs_R009_ueqv_R009NNNNN_generator_16_0200_0286 =
      rs_R009_ueqv_R009NNNNN_partial_16_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNNN_coefficient_16_0212 : Poly :=
[
  term ((-5717 : Rat) / 1178) [(4, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 212 for generator 16. -/
def rs_R009_ueqv_R009NNNNN_partial_16_0212 : Poly :=
[
  term ((-5717 : Rat) / 589) [(4, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((5717 : Rat) / 1178) [(4, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 16. -/
theorem rs_R009_ueqv_R009NNNNN_partial_16_0212_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_16_0212
        rs_R009_ueqv_R009NNNNN_generator_16_0200_0286 =
      rs_R009_ueqv_R009NNNNN_partial_16_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNNN_coefficient_16_0213 : Poly :=
[
  term ((8893 : Rat) / 228) [(4, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 213 for generator 16. -/
def rs_R009_ueqv_R009NNNNN_partial_16_0213 : Poly :=
[
  term ((8893 : Rat) / 114) [(4, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-8893 : Rat) / 228) [(4, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 16. -/
theorem rs_R009_ueqv_R009NNNNN_partial_16_0213_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_16_0213
        rs_R009_ueqv_R009NNNNN_generator_16_0200_0286 =
      rs_R009_ueqv_R009NNNNN_partial_16_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNNN_coefficient_16_0214 : Poly :=
[
  term ((-203440 : Rat) / 1767) [(4, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 214 for generator 16. -/
def rs_R009_ueqv_R009NNNNN_partial_16_0214 : Poly :=
[
  term ((-406880 : Rat) / 1767) [(4, 1), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((203440 : Rat) / 1767) [(4, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 16. -/
theorem rs_R009_ueqv_R009NNNNN_partial_16_0214_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_16_0214
        rs_R009_ueqv_R009NNNNN_generator_16_0200_0286 =
      rs_R009_ueqv_R009NNNNN_partial_16_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNNN_coefficient_16_0215 : Poly :=
[
  term ((-1140 : Rat) / 31) [(4, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 215 for generator 16. -/
def rs_R009_ueqv_R009NNNNN_partial_16_0215 : Poly :=
[
  term ((-2280 : Rat) / 31) [(4, 1), (6, 1), (12, 1), (13, 2), (16, 1)],
  term ((1140 : Rat) / 31) [(4, 1), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 16. -/
theorem rs_R009_ueqv_R009NNNNN_partial_16_0215_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_16_0215
        rs_R009_ueqv_R009NNNNN_generator_16_0200_0286 =
      rs_R009_ueqv_R009NNNNN_partial_16_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNNN_coefficient_16_0216 : Poly :=
[
  term ((18199 : Rat) / 589) [(4, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 216 for generator 16. -/
def rs_R009_ueqv_R009NNNNN_partial_16_0216 : Poly :=
[
  term ((36398 : Rat) / 589) [(4, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-18199 : Rat) / 589) [(4, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 16. -/
theorem rs_R009_ueqv_R009NNNNN_partial_16_0216_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_16_0216
        rs_R009_ueqv_R009NNNNN_generator_16_0200_0286 =
      rs_R009_ueqv_R009NNNNN_partial_16_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNNN_coefficient_16_0217 : Poly :=
[
  term ((492473 : Rat) / 3534) [(4, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 217 for generator 16. -/
def rs_R009_ueqv_R009NNNNN_partial_16_0217 : Poly :=
[
  term ((492473 : Rat) / 1767) [(4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-492473 : Rat) / 3534) [(4, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 16. -/
theorem rs_R009_ueqv_R009NNNNN_partial_16_0217_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_16_0217
        rs_R009_ueqv_R009NNNNN_generator_16_0200_0286 =
      rs_R009_ueqv_R009NNNNN_partial_16_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNNN_coefficient_16_0218 : Poly :=
[
  term ((1786 : Rat) / 31) [(4, 1), (13, 2), (16, 1)]
]

/-- Partial product 218 for generator 16. -/
def rs_R009_ueqv_R009NNNNN_partial_16_0218 : Poly :=
[
  term ((3572 : Rat) / 31) [(4, 1), (6, 1), (13, 2), (16, 1)],
  term ((-1786 : Rat) / 31) [(4, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 16. -/
theorem rs_R009_ueqv_R009NNNNN_partial_16_0218_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_16_0218
        rs_R009_ueqv_R009NNNNN_generator_16_0200_0286 =
      rs_R009_ueqv_R009NNNNN_partial_16_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNNN_coefficient_16_0219 : Poly :=
[
  term ((-779297 : Rat) / 7068) [(4, 1), (15, 2), (16, 1)]
]

/-- Partial product 219 for generator 16. -/
def rs_R009_ueqv_R009NNNNN_partial_16_0219 : Poly :=
[
  term ((-779297 : Rat) / 3534) [(4, 1), (6, 1), (15, 2), (16, 1)],
  term ((779297 : Rat) / 7068) [(4, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 16. -/
theorem rs_R009_ueqv_R009NNNNN_partial_16_0219_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_16_0219
        rs_R009_ueqv_R009NNNNN_generator_16_0200_0286 =
      rs_R009_ueqv_R009NNNNN_partial_16_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNNN_coefficient_16_0220 : Poly :=
[
  term ((-456 : Rat) / 31) [(5, 1), (6, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 220 for generator 16. -/
def rs_R009_ueqv_R009NNNNN_partial_16_0220 : Poly :=
[
  term ((456 : Rat) / 31) [(5, 1), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((-912 : Rat) / 31) [(5, 1), (6, 2), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 16. -/
theorem rs_R009_ueqv_R009NNNNN_partial_16_0220_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_16_0220
        rs_R009_ueqv_R009NNNNN_generator_16_0200_0286 =
      rs_R009_ueqv_R009NNNNN_partial_16_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNNN_coefficient_16_0221 : Poly :=
[
  term ((-113740 : Rat) / 1767) [(5, 1), (6, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 221 for generator 16. -/
def rs_R009_ueqv_R009NNNNN_partial_16_0221 : Poly :=
[
  term ((113740 : Rat) / 1767) [(5, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((-227480 : Rat) / 1767) [(5, 1), (6, 2), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 16. -/
theorem rs_R009_ueqv_R009NNNNN_partial_16_0221_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_16_0221
        rs_R009_ueqv_R009NNNNN_generator_16_0200_0286 =
      rs_R009_ueqv_R009NNNNN_partial_16_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNNN_coefficient_16_0222 : Poly :=
[
  term ((1048 : Rat) / 589) [(5, 1), (6, 1), (11, 1), (16, 1)]
]

/-- Partial product 222 for generator 16. -/
def rs_R009_ueqv_R009NNNNN_partial_16_0222 : Poly :=
[
  term ((-1048 : Rat) / 589) [(5, 1), (6, 1), (11, 1), (16, 1)],
  term ((2096 : Rat) / 589) [(5, 1), (6, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 16. -/
theorem rs_R009_ueqv_R009NNNNN_partial_16_0222_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_16_0222
        rs_R009_ueqv_R009NNNNN_generator_16_0200_0286 =
      rs_R009_ueqv_R009NNNNN_partial_16_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNNN_coefficient_16_0223 : Poly :=
[
  term ((-1026 : Rat) / 31) [(5, 1), (6, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 223 for generator 16. -/
def rs_R009_ueqv_R009NNNNN_partial_16_0223 : Poly :=
[
  term ((1026 : Rat) / 31) [(5, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term ((-2052 : Rat) / 31) [(5, 1), (6, 2), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 16. -/
theorem rs_R009_ueqv_R009NNNNN_partial_16_0223_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_16_0223
        rs_R009_ueqv_R009NNNNN_generator_16_0200_0286 =
      rs_R009_ueqv_R009NNNNN_partial_16_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNNN_coefficient_16_0224 : Poly :=
[
  term ((-66539 : Rat) / 589) [(5, 1), (6, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 224 for generator 16. -/
def rs_R009_ueqv_R009NNNNN_partial_16_0224 : Poly :=
[
  term ((66539 : Rat) / 589) [(5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-133078 : Rat) / 589) [(5, 1), (6, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 16. -/
theorem rs_R009_ueqv_R009NNNNN_partial_16_0224_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_16_0224
        rs_R009_ueqv_R009NNNNN_generator_16_0200_0286 =
      rs_R009_ueqv_R009NNNNN_partial_16_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNNN_coefficient_16_0225 : Poly :=
[
  term ((2185 : Rat) / 62) [(5, 1), (6, 1), (13, 1), (16, 1)]
]

/-- Partial product 225 for generator 16. -/
def rs_R009_ueqv_R009NNNNN_partial_16_0225 : Poly :=
[
  term ((-2185 : Rat) / 62) [(5, 1), (6, 1), (13, 1), (16, 1)],
  term ((2185 : Rat) / 31) [(5, 1), (6, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 16. -/
theorem rs_R009_ueqv_R009NNNNN_partial_16_0225_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_16_0225
        rs_R009_ueqv_R009NNNNN_generator_16_0200_0286 =
      rs_R009_ueqv_R009NNNNN_partial_16_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNNN_coefficient_16_0226 : Poly :=
[
  term ((299957 : Rat) / 2356) [(5, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 226 for generator 16. -/
def rs_R009_ueqv_R009NNNNN_partial_16_0226 : Poly :=
[
  term ((-299957 : Rat) / 2356) [(5, 1), (6, 1), (15, 1), (16, 1)],
  term ((299957 : Rat) / 1178) [(5, 1), (6, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 16. -/
theorem rs_R009_ueqv_R009NNNNN_partial_16_0226_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_16_0226
        rs_R009_ueqv_R009NNNNN_generator_16_0200_0286 =
      rs_R009_ueqv_R009NNNNN_partial_16_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNNN_coefficient_16_0227 : Poly :=
[
  term ((-1048 : Rat) / 589) [(5, 1), (7, 1), (10, 1), (16, 1)]
]

/-- Partial product 227 for generator 16. -/
def rs_R009_ueqv_R009NNNNN_partial_16_0227 : Poly :=
[
  term ((-2096 : Rat) / 589) [(5, 1), (6, 1), (7, 1), (10, 1), (16, 1)],
  term ((1048 : Rat) / 589) [(5, 1), (7, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 16. -/
theorem rs_R009_ueqv_R009NNNNN_partial_16_0227_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_16_0227
        rs_R009_ueqv_R009NNNNN_generator_16_0200_0286 =
      rs_R009_ueqv_R009NNNNN_partial_16_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNNN_coefficient_16_0228 : Poly :=
[
  term ((912 : Rat) / 31) [(5, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 228 for generator 16. -/
def rs_R009_ueqv_R009NNNNN_partial_16_0228 : Poly :=
[
  term ((1824 : Rat) / 31) [(5, 1), (6, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-912 : Rat) / 31) [(5, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 16. -/
theorem rs_R009_ueqv_R009NNNNN_partial_16_0228_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_16_0228
        rs_R009_ueqv_R009NNNNN_generator_16_0200_0286 =
      rs_R009_ueqv_R009NNNNN_partial_16_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNNN_coefficient_16_0229 : Poly :=
[
  term ((227480 : Rat) / 1767) [(5, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 229 for generator 16. -/
def rs_R009_ueqv_R009NNNNN_partial_16_0229 : Poly :=
[
  term ((454960 : Rat) / 1767) [(5, 1), (6, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-227480 : Rat) / 1767) [(5, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 16. -/
theorem rs_R009_ueqv_R009NNNNN_partial_16_0229_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_16_0229
        rs_R009_ueqv_R009NNNNN_generator_16_0200_0286 =
      rs_R009_ueqv_R009NNNNN_partial_16_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNNN_coefficient_16_0230 : Poly :=
[
  term ((76 : Rat) / 31) [(5, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 230 for generator 16. -/
def rs_R009_ueqv_R009NNNNN_partial_16_0230 : Poly :=
[
  term ((152 : Rat) / 31) [(5, 1), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((-76 : Rat) / 31) [(5, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 16. -/
theorem rs_R009_ueqv_R009NNNNN_partial_16_0230_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_16_0230
        rs_R009_ueqv_R009NNNNN_generator_16_0200_0286 =
      rs_R009_ueqv_R009NNNNN_partial_16_0230 := by
  native_decide

/-- Coefficient term 231 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNNN_coefficient_16_0231 : Poly :=
[
  term ((-60014 : Rat) / 1767) [(5, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 231 for generator 16. -/
def rs_R009_ueqv_R009NNNNN_partial_16_0231 : Poly :=
[
  term ((-120028 : Rat) / 1767) [(5, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((60014 : Rat) / 1767) [(5, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 231 for generator 16. -/
theorem rs_R009_ueqv_R009NNNNN_partial_16_0231_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_16_0231
        rs_R009_ueqv_R009NNNNN_generator_16_0200_0286 =
      rs_R009_ueqv_R009NNNNN_partial_16_0231 := by
  native_decide

/-- Coefficient term 232 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNNN_coefficient_16_0232 : Poly :=
[
  term ((512 : Rat) / 589) [(5, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 232 for generator 16. -/
def rs_R009_ueqv_R009NNNNN_partial_16_0232 : Poly :=
[
  term ((1024 : Rat) / 589) [(5, 1), (6, 1), (11, 1), (12, 1), (16, 1)],
  term ((-512 : Rat) / 589) [(5, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 232 for generator 16. -/
theorem rs_R009_ueqv_R009NNNNN_partial_16_0232_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_16_0232
        rs_R009_ueqv_R009NNNNN_generator_16_0200_0286 =
      rs_R009_ueqv_R009NNNNN_partial_16_0232 := by
  native_decide

/-- Coefficient term 233 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNNN_coefficient_16_0233 : Poly :=
[
  term ((524 : Rat) / 589) [(5, 1), (11, 1), (16, 1)]
]

/-- Partial product 233 for generator 16. -/
def rs_R009_ueqv_R009NNNNN_partial_16_0233 : Poly :=
[
  term ((1048 : Rat) / 589) [(5, 1), (6, 1), (11, 1), (16, 1)],
  term ((-524 : Rat) / 589) [(5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 233 for generator 16. -/
theorem rs_R009_ueqv_R009NNNNN_partial_16_0233_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_16_0233
        rs_R009_ueqv_R009NNNNN_generator_16_0200_0286 =
      rs_R009_ueqv_R009NNNNN_partial_16_0233 := by
  native_decide

/-- Coefficient term 234 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNNN_coefficient_16_0234 : Poly :=
[
  term ((-2299 : Rat) / 31) [(5, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 234 for generator 16. -/
def rs_R009_ueqv_R009NNNNN_partial_16_0234 : Poly :=
[
  term ((-4598 : Rat) / 31) [(5, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term ((2299 : Rat) / 31) [(5, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 234 for generator 16. -/
theorem rs_R009_ueqv_R009NNNNN_partial_16_0234_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_16_0234
        rs_R009_ueqv_R009NNNNN_generator_16_0200_0286 =
      rs_R009_ueqv_R009NNNNN_partial_16_0234 := by
  native_decide

/-- Coefficient term 235 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNNN_coefficient_16_0235 : Poly :=
[
  term ((-801473 : Rat) / 3534) [(5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 235 for generator 16. -/
def rs_R009_ueqv_R009NNNNN_partial_16_0235 : Poly :=
[
  term ((-801473 : Rat) / 1767) [(5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((801473 : Rat) / 3534) [(5, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 235 for generator 16. -/
theorem rs_R009_ueqv_R009NNNNN_partial_16_0235_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_16_0235
        rs_R009_ueqv_R009NNNNN_generator_16_0200_0286 =
      rs_R009_ueqv_R009NNNNN_partial_16_0235 := by
  native_decide

/-- Coefficient term 236 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNNN_coefficient_16_0236 : Poly :=
[
  term ((1140 : Rat) / 31) [(5, 1), (12, 2), (13, 1), (16, 1)]
]

/-- Partial product 236 for generator 16. -/
def rs_R009_ueqv_R009NNNNN_partial_16_0236 : Poly :=
[
  term ((2280 : Rat) / 31) [(5, 1), (6, 1), (12, 2), (13, 1), (16, 1)],
  term ((-1140 : Rat) / 31) [(5, 1), (12, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 236 for generator 16. -/
theorem rs_R009_ueqv_R009NNNNN_partial_16_0236_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_16_0236
        rs_R009_ueqv_R009NNNNN_generator_16_0200_0286 =
      rs_R009_ueqv_R009NNNNN_partial_16_0236 := by
  native_decide

/-- Coefficient term 237 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNNN_coefficient_16_0237 : Poly :=
[
  term ((222934 : Rat) / 1767) [(5, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 237 for generator 16. -/
def rs_R009_ueqv_R009NNNNN_partial_16_0237 : Poly :=
[
  term ((445868 : Rat) / 1767) [(5, 1), (6, 1), (12, 2), (15, 1), (16, 1)],
  term ((-222934 : Rat) / 1767) [(5, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 237 for generator 16. -/
theorem rs_R009_ueqv_R009NNNNN_partial_16_0237_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_16_0237
        rs_R009_ueqv_R009NNNNN_generator_16_0200_0286 =
      rs_R009_ueqv_R009NNNNN_partial_16_0237 := by
  native_decide

/-- Coefficient term 238 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNNN_coefficient_16_0238 : Poly :=
[
  term ((2185 : Rat) / 124) [(5, 1), (13, 1), (16, 1)]
]

/-- Partial product 238 for generator 16. -/
def rs_R009_ueqv_R009NNNNN_partial_16_0238 : Poly :=
[
  term ((2185 : Rat) / 62) [(5, 1), (6, 1), (13, 1), (16, 1)],
  term ((-2185 : Rat) / 124) [(5, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 238 for generator 16. -/
theorem rs_R009_ueqv_R009NNNNN_partial_16_0238_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_16_0238
        rs_R009_ueqv_R009NNNNN_generator_16_0200_0286 =
      rs_R009_ueqv_R009NNNNN_partial_16_0238 := by
  native_decide

/-- Coefficient term 239 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNNN_coefficient_16_0239 : Poly :=
[
  term ((299957 : Rat) / 4712) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 239 for generator 16. -/
def rs_R009_ueqv_R009NNNNN_partial_16_0239 : Poly :=
[
  term ((299957 : Rat) / 2356) [(5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-299957 : Rat) / 4712) [(5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 239 for generator 16. -/
theorem rs_R009_ueqv_R009NNNNN_partial_16_0239_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_16_0239
        rs_R009_ueqv_R009NNNNN_generator_16_0200_0286 =
      rs_R009_ueqv_R009NNNNN_partial_16_0239 := by
  native_decide

/-- Coefficient term 240 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNNN_coefficient_16_0240 : Poly :=
[
  term ((-684 : Rat) / 31) [(6, 1), (10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 240 for generator 16. -/
def rs_R009_ueqv_R009NNNNN_partial_16_0240 : Poly :=
[
  term ((684 : Rat) / 31) [(6, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1368 : Rat) / 31) [(6, 2), (10, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 240 for generator 16. -/
theorem rs_R009_ueqv_R009NNNNN_partial_16_0240_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_16_0240
        rs_R009_ueqv_R009NNNNN_generator_16_0200_0286 =
      rs_R009_ueqv_R009NNNNN_partial_16_0240 := by
  native_decide

/-- Coefficient term 241 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNNN_coefficient_16_0241 : Poly :=
[
  term ((-56870 : Rat) / 589) [(6, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 241 for generator 16. -/
def rs_R009_ueqv_R009NNNNN_partial_16_0241 : Poly :=
[
  term ((56870 : Rat) / 589) [(6, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-113740 : Rat) / 589) [(6, 2), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 241 for generator 16. -/
theorem rs_R009_ueqv_R009NNNNN_partial_16_0241_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_16_0241
        rs_R009_ueqv_R009NNNNN_generator_16_0200_0286 =
      rs_R009_ueqv_R009NNNNN_partial_16_0241 := by
  native_decide

/-- Coefficient term 242 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNNN_coefficient_16_0242 : Poly :=
[
  term ((103504 : Rat) / 1767) [(6, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 242 for generator 16. -/
def rs_R009_ueqv_R009NNNNN_partial_16_0242 : Poly :=
[
  term ((-103504 : Rat) / 1767) [(6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((207008 : Rat) / 1767) [(6, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 242 for generator 16. -/
theorem rs_R009_ueqv_R009NNNNN_partial_16_0242_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_16_0242
        rs_R009_ueqv_R009NNNNN_generator_16_0200_0286 =
      rs_R009_ueqv_R009NNNNN_partial_16_0242 := by
  native_decide

/-- Coefficient term 243 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNNN_coefficient_16_0243 : Poly :=
[
  term ((456 : Rat) / 31) [(6, 1), (10, 1), (13, 2), (16, 1)]
]

/-- Partial product 243 for generator 16. -/
def rs_R009_ueqv_R009NNNNN_partial_16_0243 : Poly :=
[
  term ((-456 : Rat) / 31) [(6, 1), (10, 1), (13, 2), (16, 1)],
  term ((912 : Rat) / 31) [(6, 2), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 243 for generator 16. -/
theorem rs_R009_ueqv_R009NNNNN_partial_16_0243_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_16_0243
        rs_R009_ueqv_R009NNNNN_generator_16_0200_0286 =
      rs_R009_ueqv_R009NNNNN_partial_16_0243 := by
  native_decide

/-- Coefficient term 244 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNNN_coefficient_16_0244 : Poly :=
[
  term ((-3412 : Rat) / 589) [(6, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 244 for generator 16. -/
def rs_R009_ueqv_R009NNNNN_partial_16_0244 : Poly :=
[
  term ((3412 : Rat) / 589) [(6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-6824 : Rat) / 589) [(6, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 244 for generator 16. -/
theorem rs_R009_ueqv_R009NNNNN_partial_16_0244_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_16_0244
        rs_R009_ueqv_R009NNNNN_generator_16_0200_0286 =
      rs_R009_ueqv_R009NNNNN_partial_16_0244 := by
  native_decide

/-- Coefficient term 245 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNNN_coefficient_16_0245 : Poly :=
[
  term ((53369 : Rat) / 2356) [(6, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 245 for generator 16. -/
def rs_R009_ueqv_R009NNNNN_partial_16_0245 : Poly :=
[
  term ((-53369 : Rat) / 2356) [(6, 1), (11, 1), (13, 1), (16, 1)],
  term ((53369 : Rat) / 1178) [(6, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 245 for generator 16. -/
theorem rs_R009_ueqv_R009NNNNN_partial_16_0245_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_16_0245
        rs_R009_ueqv_R009NNNNN_generator_16_0200_0286 =
      rs_R009_ueqv_R009NNNNN_partial_16_0245 := by
  native_decide

/-- Coefficient term 246 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNNN_coefficient_16_0246 : Poly :=
[
  term ((926401 : Rat) / 14136) [(6, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 246 for generator 16. -/
def rs_R009_ueqv_R009NNNNN_partial_16_0246 : Poly :=
[
  term ((-926401 : Rat) / 14136) [(6, 1), (11, 1), (15, 1), (16, 1)],
  term ((926401 : Rat) / 7068) [(6, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 246 for generator 16. -/
theorem rs_R009_ueqv_R009NNNNN_partial_16_0246_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_16_0246
        rs_R009_ueqv_R009NNNNN_generator_16_0200_0286 =
      rs_R009_ueqv_R009NNNNN_partial_16_0246 := by
  native_decide

/-- Coefficient term 247 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNNN_coefficient_16_0247 : Poly :=
[
  term ((-512 : Rat) / 589) [(6, 1), (11, 2), (16, 1)]
]

/-- Partial product 247 for generator 16. -/
def rs_R009_ueqv_R009NNNNN_partial_16_0247 : Poly :=
[
  term ((512 : Rat) / 589) [(6, 1), (11, 2), (16, 1)],
  term ((-1024 : Rat) / 589) [(6, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 247 for generator 16. -/
theorem rs_R009_ueqv_R009NNNNN_partial_16_0247_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_16_0247
        rs_R009_ueqv_R009NNNNN_generator_16_0200_0286 =
      rs_R009_ueqv_R009NNNNN_partial_16_0247 := by
  native_decide

/-- Coefficient term 248 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNNN_coefficient_16_0248 : Poly :=
[
  term ((83032 : Rat) / 1767) [(6, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 248 for generator 16. -/
def rs_R009_ueqv_R009NNNNN_partial_16_0248 : Poly :=
[
  term ((-83032 : Rat) / 1767) [(6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((166064 : Rat) / 1767) [(6, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 248 for generator 16. -/
theorem rs_R009_ueqv_R009NNNNN_partial_16_0248_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_16_0248
        rs_R009_ueqv_R009NNNNN_generator_16_0200_0286 =
      rs_R009_ueqv_R009NNNNN_partial_16_0248 := by
  native_decide

/-- Coefficient term 249 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNNN_coefficient_16_0249 : Poly :=
[
  term ((456 : Rat) / 31) [(6, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 249 for generator 16. -/
def rs_R009_ueqv_R009NNNNN_partial_16_0249 : Poly :=
[
  term ((-456 : Rat) / 31) [(6, 1), (12, 1), (13, 2), (16, 1)],
  term ((912 : Rat) / 31) [(6, 2), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 249 for generator 16. -/
theorem rs_R009_ueqv_R009NNNNN_partial_16_0249_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_16_0249
        rs_R009_ueqv_R009NNNNN_generator_16_0200_0286 =
      rs_R009_ueqv_R009NNNNN_partial_16_0249 := by
  native_decide

/-- Coefficient term 250 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNNN_coefficient_16_0250 : Poly :=
[
  term ((-155542 : Rat) / 1767) [(6, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 250 for generator 16. -/
def rs_R009_ueqv_R009NNNNN_partial_16_0250 : Poly :=
[
  term ((155542 : Rat) / 1767) [(6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-311084 : Rat) / 1767) [(6, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 250 for generator 16. -/
theorem rs_R009_ueqv_R009NNNNN_partial_16_0250_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_16_0250
        rs_R009_ueqv_R009NNNNN_generator_16_0200_0286 =
      rs_R009_ueqv_R009NNNNN_partial_16_0250 := by
  native_decide

/-- Coefficient term 251 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNNN_coefficient_16_0251 : Poly :=
[
  term ((-950 : Rat) / 31) [(6, 1), (13, 2), (16, 1)]
]

/-- Partial product 251 for generator 16. -/
def rs_R009_ueqv_R009NNNNN_partial_16_0251 : Poly :=
[
  term ((950 : Rat) / 31) [(6, 1), (13, 2), (16, 1)],
  term ((-1900 : Rat) / 31) [(6, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 251 for generator 16. -/
theorem rs_R009_ueqv_R009NNNNN_partial_16_0251_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_16_0251
        rs_R009_ueqv_R009NNNNN_generator_16_0200_0286 =
      rs_R009_ueqv_R009NNNNN_partial_16_0251 := by
  native_decide

/-- Coefficient term 252 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNNN_coefficient_16_0252 : Poly :=
[
  term ((512 : Rat) / 589) [(7, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 252 for generator 16. -/
def rs_R009_ueqv_R009NNNNN_partial_16_0252 : Poly :=
[
  term ((1024 : Rat) / 589) [(6, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((-512 : Rat) / 589) [(7, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 252 for generator 16. -/
theorem rs_R009_ueqv_R009NNNNN_partial_16_0252_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_16_0252
        rs_R009_ueqv_R009NNNNN_generator_16_0200_0286 =
      rs_R009_ueqv_R009NNNNN_partial_16_0252 := by
  native_decide

/-- Coefficient term 253 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNNN_coefficient_16_0253 : Poly :=
[
  term ((-456 : Rat) / 31) [(7, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 253 for generator 16. -/
def rs_R009_ueqv_R009NNNNN_partial_16_0253 : Poly :=
[
  term ((-912 : Rat) / 31) [(6, 1), (7, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((456 : Rat) / 31) [(7, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 253 for generator 16. -/
theorem rs_R009_ueqv_R009NNNNN_partial_16_0253_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_16_0253
        rs_R009_ueqv_R009NNNNN_generator_16_0200_0286 =
      rs_R009_ueqv_R009NNNNN_partial_16_0253 := by
  native_decide

/-- Coefficient term 254 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNNN_coefficient_16_0254 : Poly :=
[
  term ((-93268 : Rat) / 1767) [(7, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 254 for generator 16. -/
def rs_R009_ueqv_R009NNNNN_partial_16_0254 : Poly :=
[
  term ((-186536 : Rat) / 1767) [(6, 1), (7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((93268 : Rat) / 1767) [(7, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 254 for generator 16. -/
theorem rs_R009_ueqv_R009NNNNN_partial_16_0254_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_16_0254
        rs_R009_ueqv_R009NNNNN_generator_16_0200_0286 =
      rs_R009_ueqv_R009NNNNN_partial_16_0254 := by
  native_decide

/-- Coefficient term 255 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNNN_coefficient_16_0255 : Poly :=
[
  term ((-3363 : Rat) / 124) [(7, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 255 for generator 16. -/
def rs_R009_ueqv_R009NNNNN_partial_16_0255 : Poly :=
[
  term ((-3363 : Rat) / 62) [(6, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((3363 : Rat) / 124) [(7, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 255 for generator 16. -/
theorem rs_R009_ueqv_R009NNNNN_partial_16_0255_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_16_0255
        rs_R009_ueqv_R009NNNNN_generator_16_0200_0286 =
      rs_R009_ueqv_R009NNNNN_partial_16_0255 := by
  native_decide

/-- Coefficient term 256 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNNN_coefficient_16_0256 : Poly :=
[
  term ((-926401 : Rat) / 14136) [(7, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 256 for generator 16. -/
def rs_R009_ueqv_R009NNNNN_partial_16_0256 : Poly :=
[
  term ((-926401 : Rat) / 7068) [(6, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((926401 : Rat) / 14136) [(7, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 256 for generator 16. -/
theorem rs_R009_ueqv_R009NNNNN_partial_16_0256_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_16_0256
        rs_R009_ueqv_R009NNNNN_generator_16_0200_0286 =
      rs_R009_ueqv_R009NNNNN_partial_16_0256 := by
  native_decide

/-- Coefficient term 257 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNNN_coefficient_16_0257 : Poly :=
[
  term ((684 : Rat) / 31) [(7, 1), (10, 2), (13, 1), (16, 1)]
]

/-- Partial product 257 for generator 16. -/
def rs_R009_ueqv_R009NNNNN_partial_16_0257 : Poly :=
[
  term ((1368 : Rat) / 31) [(6, 1), (7, 1), (10, 2), (13, 1), (16, 1)],
  term ((-684 : Rat) / 31) [(7, 1), (10, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 257 for generator 16. -/
theorem rs_R009_ueqv_R009NNNNN_partial_16_0257_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_16_0257
        rs_R009_ueqv_R009NNNNN_generator_16_0200_0286 =
      rs_R009_ueqv_R009NNNNN_partial_16_0257 := by
  native_decide

/-- Coefficient term 258 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNNN_coefficient_16_0258 : Poly :=
[
  term ((56870 : Rat) / 589) [(7, 1), (10, 2), (15, 1), (16, 1)]
]

/-- Partial product 258 for generator 16. -/
def rs_R009_ueqv_R009NNNNN_partial_16_0258 : Poly :=
[
  term ((113740 : Rat) / 589) [(6, 1), (7, 1), (10, 2), (15, 1), (16, 1)],
  term ((-56870 : Rat) / 589) [(7, 1), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 258 for generator 16. -/
theorem rs_R009_ueqv_R009NNNNN_partial_16_0258_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_16_0258
        rs_R009_ueqv_R009NNNNN_generator_16_0200_0286 =
      rs_R009_ueqv_R009NNNNN_partial_16_0258 := by
  native_decide

/-- Coefficient term 259 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNNN_coefficient_16_0259 : Poly :=
[
  term ((2632 : Rat) / 589) [(7, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 259 for generator 16. -/
def rs_R009_ueqv_R009NNNNN_partial_16_0259 : Poly :=
[
  term ((5264 : Rat) / 589) [(6, 1), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((-2632 : Rat) / 589) [(7, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 259 for generator 16. -/
theorem rs_R009_ueqv_R009NNNNN_partial_16_0259_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_16_0259
        rs_R009_ueqv_R009NNNNN_generator_16_0200_0286 =
      rs_R009_ueqv_R009NNNNN_partial_16_0259 := by
  native_decide

/-- Coefficient term 260 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNNN_coefficient_16_0260 : Poly :=
[
  term ((950 : Rat) / 31) [(7, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 260 for generator 16. -/
def rs_R009_ueqv_R009NNNNN_partial_16_0260 : Poly :=
[
  term ((1900 : Rat) / 31) [(6, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-950 : Rat) / 31) [(7, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 260 for generator 16. -/
theorem rs_R009_ueqv_R009NNNNN_partial_16_0260_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_16_0260
        rs_R009_ueqv_R009NNNNN_generator_16_0200_0286 =
      rs_R009_ueqv_R009NNNNN_partial_16_0260 := by
  native_decide

/-- Coefficient term 261 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNNN_coefficient_16_0261 : Poly :=
[
  term ((155542 : Rat) / 1767) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 261 for generator 16. -/
def rs_R009_ueqv_R009NNNNN_partial_16_0261 : Poly :=
[
  term ((311084 : Rat) / 1767) [(6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-155542 : Rat) / 1767) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 261 for generator 16. -/
theorem rs_R009_ueqv_R009NNNNN_partial_16_0261_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_16_0261
        rs_R009_ueqv_R009NNNNN_generator_16_0200_0286 =
      rs_R009_ueqv_R009NNNNN_partial_16_0261 := by
  native_decide

/-- Coefficient term 262 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNNN_coefficient_16_0262 : Poly :=
[
  term ((-456 : Rat) / 31) [(7, 1), (12, 2), (13, 1), (16, 1)]
]

/-- Partial product 262 for generator 16. -/
def rs_R009_ueqv_R009NNNNN_partial_16_0262 : Poly :=
[
  term ((-912 : Rat) / 31) [(6, 1), (7, 1), (12, 2), (13, 1), (16, 1)],
  term ((456 : Rat) / 31) [(7, 1), (12, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 262 for generator 16. -/
theorem rs_R009_ueqv_R009NNNNN_partial_16_0262_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_16_0262
        rs_R009_ueqv_R009NNNNN_generator_16_0200_0286 =
      rs_R009_ueqv_R009NNNNN_partial_16_0262 := by
  native_decide

/-- Coefficient term 263 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNNN_coefficient_16_0263 : Poly :=
[
  term ((-83032 : Rat) / 1767) [(7, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 263 for generator 16. -/
def rs_R009_ueqv_R009NNNNN_partial_16_0263 : Poly :=
[
  term ((-166064 : Rat) / 1767) [(6, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((83032 : Rat) / 1767) [(7, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 263 for generator 16. -/
theorem rs_R009_ueqv_R009NNNNN_partial_16_0263_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_16_0263
        rs_R009_ueqv_R009NNNNN_generator_16_0200_0286 =
      rs_R009_ueqv_R009NNNNN_partial_16_0263 := by
  native_decide

/-- Coefficient term 264 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNNN_coefficient_16_0264 : Poly :=
[
  term ((-570 : Rat) / 31) [(10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 264 for generator 16. -/
def rs_R009_ueqv_R009NNNNN_partial_16_0264 : Poly :=
[
  term ((-1140 : Rat) / 31) [(6, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((570 : Rat) / 31) [(10, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 264 for generator 16. -/
theorem rs_R009_ueqv_R009NNNNN_partial_16_0264_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_16_0264
        rs_R009_ueqv_R009NNNNN_generator_16_0200_0286 =
      rs_R009_ueqv_R009NNNNN_partial_16_0264 := by
  native_decide

/-- Coefficient term 265 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNNN_coefficient_16_0265 : Poly :=
[
  term ((-124847 : Rat) / 1767) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 265 for generator 16. -/
def rs_R009_ueqv_R009NNNNN_partial_16_0265 : Poly :=
[
  term ((-249694 : Rat) / 1767) [(6, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((124847 : Rat) / 1767) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 265 for generator 16. -/
theorem rs_R009_ueqv_R009NNNNN_partial_16_0265_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_16_0265
        rs_R009_ueqv_R009NNNNN_generator_16_0200_0286 =
      rs_R009_ueqv_R009NNNNN_partial_16_0265 := by
  native_decide

/-- Coefficient term 266 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNNN_coefficient_16_0266 : Poly :=
[
  term ((456 : Rat) / 31) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 266 for generator 16. -/
def rs_R009_ueqv_R009NNNNN_partial_16_0266 : Poly :=
[
  term ((912 : Rat) / 31) [(6, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-456 : Rat) / 31) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 266 for generator 16. -/
theorem rs_R009_ueqv_R009NNNNN_partial_16_0266_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_16_0266
        rs_R009_ueqv_R009NNNNN_generator_16_0200_0286 =
      rs_R009_ueqv_R009NNNNN_partial_16_0266 := by
  native_decide

/-- Coefficient term 267 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNNN_coefficient_16_0267 : Poly :=
[
  term ((113740 : Rat) / 1767) [(10, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 267 for generator 16. -/
def rs_R009_ueqv_R009NNNNN_partial_16_0267 : Poly :=
[
  term ((227480 : Rat) / 1767) [(6, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-113740 : Rat) / 1767) [(10, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 267 for generator 16. -/
theorem rs_R009_ueqv_R009NNNNN_partial_16_0267_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_16_0267
        rs_R009_ueqv_R009NNNNN_generator_16_0200_0286 =
      rs_R009_ueqv_R009NNNNN_partial_16_0267 := by
  native_decide

/-- Coefficient term 268 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNNN_coefficient_16_0268 : Poly :=
[
  term ((4204 : Rat) / 589) [(10, 1), (12, 1), (16, 1)]
]

/-- Partial product 268 for generator 16. -/
def rs_R009_ueqv_R009NNNNN_partial_16_0268 : Poly :=
[
  term ((8408 : Rat) / 589) [(6, 1), (10, 1), (12, 1), (16, 1)],
  term ((-4204 : Rat) / 589) [(10, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 268 for generator 16. -/
theorem rs_R009_ueqv_R009NNNNN_partial_16_0268_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_16_0268
        rs_R009_ueqv_R009NNNNN_generator_16_0200_0286 =
      rs_R009_ueqv_R009NNNNN_partial_16_0268 := by
  native_decide

/-- Coefficient term 269 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNNN_coefficient_16_0269 : Poly :=
[
  term ((8123 : Rat) / 124) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 269 for generator 16. -/
def rs_R009_ueqv_R009NNNNN_partial_16_0269 : Poly :=
[
  term ((8123 : Rat) / 62) [(6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-8123 : Rat) / 124) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 269 for generator 16. -/
theorem rs_R009_ueqv_R009NNNNN_partial_16_0269_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_16_0269
        rs_R009_ueqv_R009NNNNN_generator_16_0200_0286 =
      rs_R009_ueqv_R009NNNNN_partial_16_0269 := by
  native_decide

/-- Coefficient term 270 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNNN_coefficient_16_0270 : Poly :=
[
  term ((684 : Rat) / 31) [(10, 1), (13, 2), (16, 1)]
]

/-- Partial product 270 for generator 16. -/
def rs_R009_ueqv_R009NNNNN_partial_16_0270 : Poly :=
[
  term ((1368 : Rat) / 31) [(6, 1), (10, 1), (13, 2), (16, 1)],
  term ((-684 : Rat) / 31) [(10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 270 for generator 16. -/
theorem rs_R009_ueqv_R009NNNNN_partial_16_0270_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_16_0270
        rs_R009_ueqv_R009NNNNN_generator_16_0200_0286 =
      rs_R009_ueqv_R009NNNNN_partial_16_0270 := by
  native_decide

/-- Coefficient term 271 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNNN_coefficient_16_0271 : Poly :=
[
  term ((-713829 : Rat) / 4712) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 271 for generator 16. -/
def rs_R009_ueqv_R009NNNNN_partial_16_0271 : Poly :=
[
  term ((-713829 : Rat) / 2356) [(6, 1), (10, 1), (15, 2), (16, 1)],
  term ((713829 : Rat) / 4712) [(10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 271 for generator 16. -/
theorem rs_R009_ueqv_R009NNNNN_partial_16_0271_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_16_0271
        rs_R009_ueqv_R009NNNNN_generator_16_0200_0286 =
      rs_R009_ueqv_R009NNNNN_partial_16_0271 := by
  native_decide

/-- Coefficient term 272 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNNN_coefficient_16_0272 : Poly :=
[
  term ((-1974 : Rat) / 589) [(10, 1), (16, 1)]
]

/-- Partial product 272 for generator 16. -/
def rs_R009_ueqv_R009NNNNN_partial_16_0272 : Poly :=
[
  term ((-3948 : Rat) / 589) [(6, 1), (10, 1), (16, 1)],
  term ((1974 : Rat) / 589) [(10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 272 for generator 16. -/
theorem rs_R009_ueqv_R009NNNNN_partial_16_0272_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_16_0272
        rs_R009_ueqv_R009NNNNN_generator_16_0200_0286 =
      rs_R009_ueqv_R009NNNNN_partial_16_0272 := by
  native_decide

/-- Coefficient term 273 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNNN_coefficient_16_0273 : Poly :=
[
  term ((1140 : Rat) / 31) [(10, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 273 for generator 16. -/
def rs_R009_ueqv_R009NNNNN_partial_16_0273 : Poly :=
[
  term ((2280 : Rat) / 31) [(6, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1140 : Rat) / 31) [(10, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 273 for generator 16. -/
theorem rs_R009_ueqv_R009NNNNN_partial_16_0273_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_16_0273
        rs_R009_ueqv_R009NNNNN_generator_16_0200_0286 =
      rs_R009_ueqv_R009NNNNN_partial_16_0273 := by
  native_decide

/-- Coefficient term 274 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNNN_coefficient_16_0274 : Poly :=
[
  term ((284350 : Rat) / 1767) [(10, 2), (15, 2), (16, 1)]
]

/-- Partial product 274 for generator 16. -/
def rs_R009_ueqv_R009NNNNN_partial_16_0274 : Poly :=
[
  term ((568700 : Rat) / 1767) [(6, 1), (10, 2), (15, 2), (16, 1)],
  term ((-284350 : Rat) / 1767) [(10, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 274 for generator 16. -/
theorem rs_R009_ueqv_R009NNNNN_partial_16_0274_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_16_0274
        rs_R009_ueqv_R009NNNNN_generator_16_0200_0286 =
      rs_R009_ueqv_R009NNNNN_partial_16_0274 := by
  native_decide

/-- Coefficient term 275 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNNN_coefficient_16_0275 : Poly :=
[
  term ((2632 : Rat) / 589) [(10, 2), (16, 1)]
]

/-- Partial product 275 for generator 16. -/
def rs_R009_ueqv_R009NNNNN_partial_16_0275 : Poly :=
[
  term ((5264 : Rat) / 589) [(6, 1), (10, 2), (16, 1)],
  term ((-2632 : Rat) / 589) [(10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 275 for generator 16. -/
theorem rs_R009_ueqv_R009NNNNN_partial_16_0275_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_16_0275
        rs_R009_ueqv_R009NNNNN_generator_16_0200_0286 =
      rs_R009_ueqv_R009NNNNN_partial_16_0275 := by
  native_decide

/-- Coefficient term 276 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNNN_coefficient_16_0276 : Poly :=
[
  term ((-456 : Rat) / 31) [(11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 276 for generator 16. -/
def rs_R009_ueqv_R009NNNNN_partial_16_0276 : Poly :=
[
  term ((-912 : Rat) / 31) [(6, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((456 : Rat) / 31) [(11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 276 for generator 16. -/
theorem rs_R009_ueqv_R009NNNNN_partial_16_0276_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_16_0276
        rs_R009_ueqv_R009NNNNN_generator_16_0200_0286 =
      rs_R009_ueqv_R009NNNNN_partial_16_0276 := by
  native_decide

/-- Coefficient term 277 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNNN_coefficient_16_0277 : Poly :=
[
  term ((-129496 : Rat) / 1767) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 277 for generator 16. -/
def rs_R009_ueqv_R009NNNNN_partial_16_0277 : Poly :=
[
  term ((-258992 : Rat) / 1767) [(6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((129496 : Rat) / 1767) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 277 for generator 16. -/
theorem rs_R009_ueqv_R009NNNNN_partial_16_0277_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_16_0277
        rs_R009_ueqv_R009NNNNN_generator_16_0200_0286 =
      rs_R009_ueqv_R009NNNNN_partial_16_0277 := by
  native_decide

/-- Coefficient term 278 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNNN_coefficient_16_0278 : Poly :=
[
  term ((53369 : Rat) / 4712) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 278 for generator 16. -/
def rs_R009_ueqv_R009NNNNN_partial_16_0278 : Poly :=
[
  term ((53369 : Rat) / 2356) [(6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-53369 : Rat) / 4712) [(11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 278 for generator 16. -/
theorem rs_R009_ueqv_R009NNNNN_partial_16_0278_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_16_0278
        rs_R009_ueqv_R009NNNNN_generator_16_0200_0286 =
      rs_R009_ueqv_R009NNNNN_partial_16_0278 := by
  native_decide

/-- Coefficient term 279 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNNN_coefficient_16_0279 : Poly :=
[
  term ((926401 : Rat) / 28272) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 279 for generator 16. -/
def rs_R009_ueqv_R009NNNNN_partial_16_0279 : Poly :=
[
  term ((926401 : Rat) / 14136) [(6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-926401 : Rat) / 28272) [(11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 279 for generator 16. -/
theorem rs_R009_ueqv_R009NNNNN_partial_16_0279_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_16_0279
        rs_R009_ueqv_R009NNNNN_generator_16_0200_0286 =
      rs_R009_ueqv_R009NNNNN_partial_16_0279 := by
  native_decide

/-- Coefficient term 280 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNNN_coefficient_16_0280 : Poly :=
[
  term ((-256 : Rat) / 589) [(11, 2), (16, 1)]
]

/-- Partial product 280 for generator 16. -/
def rs_R009_ueqv_R009NNNNN_partial_16_0280 : Poly :=
[
  term ((-512 : Rat) / 589) [(6, 1), (11, 2), (16, 1)],
  term ((256 : Rat) / 589) [(11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 280 for generator 16. -/
theorem rs_R009_ueqv_R009NNNNN_partial_16_0280_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_16_0280
        rs_R009_ueqv_R009NNNNN_generator_16_0200_0286 =
      rs_R009_ueqv_R009NNNNN_partial_16_0280 := by
  native_decide

/-- Coefficient term 281 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNNN_coefficient_16_0281 : Poly :=
[
  term ((19905 : Rat) / 589) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 281 for generator 16. -/
def rs_R009_ueqv_R009NNNNN_partial_16_0281 : Poly :=
[
  term ((39810 : Rat) / 589) [(6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-19905 : Rat) / 589) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 281 for generator 16. -/
theorem rs_R009_ueqv_R009NNNNN_partial_16_0281_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_16_0281
        rs_R009_ueqv_R009NNNNN_generator_16_0200_0286 =
      rs_R009_ueqv_R009NNNNN_partial_16_0281 := by
  native_decide

/-- Coefficient term 282 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNNN_coefficient_16_0282 : Poly :=
[
  term ((342 : Rat) / 31) [(12, 1), (13, 2), (16, 1)]
]

/-- Partial product 282 for generator 16. -/
def rs_R009_ueqv_R009NNNNN_partial_16_0282 : Poly :=
[
  term ((684 : Rat) / 31) [(6, 1), (12, 1), (13, 2), (16, 1)],
  term ((-342 : Rat) / 31) [(12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 282 for generator 16. -/
theorem rs_R009_ueqv_R009NNNNN_partial_16_0282_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_16_0282
        rs_R009_ueqv_R009NNNNN_generator_16_0200_0286 =
      rs_R009_ueqv_R009NNNNN_partial_16_0282 := by
  native_decide

/-- Coefficient term 283 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNNN_coefficient_16_0283 : Poly :=
[
  term ((-114 : Rat) / 31) [(12, 1), (16, 1)]
]

/-- Partial product 283 for generator 16. -/
def rs_R009_ueqv_R009NNNNN_partial_16_0283 : Poly :=
[
  term ((-228 : Rat) / 31) [(6, 1), (12, 1), (16, 1)],
  term ((114 : Rat) / 31) [(12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 283 for generator 16. -/
theorem rs_R009_ueqv_R009NNNNN_partial_16_0283_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_16_0283
        rs_R009_ueqv_R009NNNNN_generator_16_0200_0286 =
      rs_R009_ueqv_R009NNNNN_partial_16_0283 := by
  native_decide

/-- Coefficient term 284 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNNN_coefficient_16_0284 : Poly :=
[
  term ((76 : Rat) / 31) [(12, 2), (16, 1)]
]

/-- Partial product 284 for generator 16. -/
def rs_R009_ueqv_R009NNNNN_partial_16_0284 : Poly :=
[
  term ((152 : Rat) / 31) [(6, 1), (12, 2), (16, 1)],
  term ((-76 : Rat) / 31) [(12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 284 for generator 16. -/
theorem rs_R009_ueqv_R009NNNNN_partial_16_0284_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_16_0284
        rs_R009_ueqv_R009NNNNN_generator_16_0200_0286 =
      rs_R009_ueqv_R009NNNNN_partial_16_0284 := by
  native_decide

/-- Coefficient term 285 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNNN_coefficient_16_0285 : Poly :=
[
  term ((-77771 : Rat) / 1767) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 285 for generator 16. -/
def rs_R009_ueqv_R009NNNNN_partial_16_0285 : Poly :=
[
  term ((-155542 : Rat) / 1767) [(6, 1), (13, 1), (15, 1), (16, 1)],
  term ((77771 : Rat) / 1767) [(13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 285 for generator 16. -/
theorem rs_R009_ueqv_R009NNNNN_partial_16_0285_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_16_0285
        rs_R009_ueqv_R009NNNNN_generator_16_0200_0286 =
      rs_R009_ueqv_R009NNNNN_partial_16_0285 := by
  native_decide

/-- Coefficient term 286 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNNN_coefficient_16_0286 : Poly :=
[
  term ((-475 : Rat) / 31) [(13, 2), (16, 1)]
]

/-- Partial product 286 for generator 16. -/
def rs_R009_ueqv_R009NNNNN_partial_16_0286 : Poly :=
[
  term ((-950 : Rat) / 31) [(6, 1), (13, 2), (16, 1)],
  term ((475 : Rat) / 31) [(13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 286 for generator 16. -/
theorem rs_R009_ueqv_R009NNNNN_partial_16_0286_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_16_0286
        rs_R009_ueqv_R009NNNNN_generator_16_0200_0286 =
      rs_R009_ueqv_R009NNNNN_partial_16_0286 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NNNNN_partials_16_0200_0286 : List Poly :=
[
  rs_R009_ueqv_R009NNNNN_partial_16_0200,
  rs_R009_ueqv_R009NNNNN_partial_16_0201,
  rs_R009_ueqv_R009NNNNN_partial_16_0202,
  rs_R009_ueqv_R009NNNNN_partial_16_0203,
  rs_R009_ueqv_R009NNNNN_partial_16_0204,
  rs_R009_ueqv_R009NNNNN_partial_16_0205,
  rs_R009_ueqv_R009NNNNN_partial_16_0206,
  rs_R009_ueqv_R009NNNNN_partial_16_0207,
  rs_R009_ueqv_R009NNNNN_partial_16_0208,
  rs_R009_ueqv_R009NNNNN_partial_16_0209,
  rs_R009_ueqv_R009NNNNN_partial_16_0210,
  rs_R009_ueqv_R009NNNNN_partial_16_0211,
  rs_R009_ueqv_R009NNNNN_partial_16_0212,
  rs_R009_ueqv_R009NNNNN_partial_16_0213,
  rs_R009_ueqv_R009NNNNN_partial_16_0214,
  rs_R009_ueqv_R009NNNNN_partial_16_0215,
  rs_R009_ueqv_R009NNNNN_partial_16_0216,
  rs_R009_ueqv_R009NNNNN_partial_16_0217,
  rs_R009_ueqv_R009NNNNN_partial_16_0218,
  rs_R009_ueqv_R009NNNNN_partial_16_0219,
  rs_R009_ueqv_R009NNNNN_partial_16_0220,
  rs_R009_ueqv_R009NNNNN_partial_16_0221,
  rs_R009_ueqv_R009NNNNN_partial_16_0222,
  rs_R009_ueqv_R009NNNNN_partial_16_0223,
  rs_R009_ueqv_R009NNNNN_partial_16_0224,
  rs_R009_ueqv_R009NNNNN_partial_16_0225,
  rs_R009_ueqv_R009NNNNN_partial_16_0226,
  rs_R009_ueqv_R009NNNNN_partial_16_0227,
  rs_R009_ueqv_R009NNNNN_partial_16_0228,
  rs_R009_ueqv_R009NNNNN_partial_16_0229,
  rs_R009_ueqv_R009NNNNN_partial_16_0230,
  rs_R009_ueqv_R009NNNNN_partial_16_0231,
  rs_R009_ueqv_R009NNNNN_partial_16_0232,
  rs_R009_ueqv_R009NNNNN_partial_16_0233,
  rs_R009_ueqv_R009NNNNN_partial_16_0234,
  rs_R009_ueqv_R009NNNNN_partial_16_0235,
  rs_R009_ueqv_R009NNNNN_partial_16_0236,
  rs_R009_ueqv_R009NNNNN_partial_16_0237,
  rs_R009_ueqv_R009NNNNN_partial_16_0238,
  rs_R009_ueqv_R009NNNNN_partial_16_0239,
  rs_R009_ueqv_R009NNNNN_partial_16_0240,
  rs_R009_ueqv_R009NNNNN_partial_16_0241,
  rs_R009_ueqv_R009NNNNN_partial_16_0242,
  rs_R009_ueqv_R009NNNNN_partial_16_0243,
  rs_R009_ueqv_R009NNNNN_partial_16_0244,
  rs_R009_ueqv_R009NNNNN_partial_16_0245,
  rs_R009_ueqv_R009NNNNN_partial_16_0246,
  rs_R009_ueqv_R009NNNNN_partial_16_0247,
  rs_R009_ueqv_R009NNNNN_partial_16_0248,
  rs_R009_ueqv_R009NNNNN_partial_16_0249,
  rs_R009_ueqv_R009NNNNN_partial_16_0250,
  rs_R009_ueqv_R009NNNNN_partial_16_0251,
  rs_R009_ueqv_R009NNNNN_partial_16_0252,
  rs_R009_ueqv_R009NNNNN_partial_16_0253,
  rs_R009_ueqv_R009NNNNN_partial_16_0254,
  rs_R009_ueqv_R009NNNNN_partial_16_0255,
  rs_R009_ueqv_R009NNNNN_partial_16_0256,
  rs_R009_ueqv_R009NNNNN_partial_16_0257,
  rs_R009_ueqv_R009NNNNN_partial_16_0258,
  rs_R009_ueqv_R009NNNNN_partial_16_0259,
  rs_R009_ueqv_R009NNNNN_partial_16_0260,
  rs_R009_ueqv_R009NNNNN_partial_16_0261,
  rs_R009_ueqv_R009NNNNN_partial_16_0262,
  rs_R009_ueqv_R009NNNNN_partial_16_0263,
  rs_R009_ueqv_R009NNNNN_partial_16_0264,
  rs_R009_ueqv_R009NNNNN_partial_16_0265,
  rs_R009_ueqv_R009NNNNN_partial_16_0266,
  rs_R009_ueqv_R009NNNNN_partial_16_0267,
  rs_R009_ueqv_R009NNNNN_partial_16_0268,
  rs_R009_ueqv_R009NNNNN_partial_16_0269,
  rs_R009_ueqv_R009NNNNN_partial_16_0270,
  rs_R009_ueqv_R009NNNNN_partial_16_0271,
  rs_R009_ueqv_R009NNNNN_partial_16_0272,
  rs_R009_ueqv_R009NNNNN_partial_16_0273,
  rs_R009_ueqv_R009NNNNN_partial_16_0274,
  rs_R009_ueqv_R009NNNNN_partial_16_0275,
  rs_R009_ueqv_R009NNNNN_partial_16_0276,
  rs_R009_ueqv_R009NNNNN_partial_16_0277,
  rs_R009_ueqv_R009NNNNN_partial_16_0278,
  rs_R009_ueqv_R009NNNNN_partial_16_0279,
  rs_R009_ueqv_R009NNNNN_partial_16_0280,
  rs_R009_ueqv_R009NNNNN_partial_16_0281,
  rs_R009_ueqv_R009NNNNN_partial_16_0282,
  rs_R009_ueqv_R009NNNNN_partial_16_0283,
  rs_R009_ueqv_R009NNNNN_partial_16_0284,
  rs_R009_ueqv_R009NNNNN_partial_16_0285,
  rs_R009_ueqv_R009NNNNN_partial_16_0286
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NNNNN_block_16_0200_0286 : Poly :=
[
  term ((576 : Rat) / 589) [(3, 2), (6, 1), (16, 1)],
  term ((-288 : Rat) / 589) [(3, 2), (16, 1)],
  term ((1026 : Rat) / 31) [(4, 1), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((92129 : Rat) / 589) [(4, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-513 : Rat) / 31) [(4, 1), (5, 1), (13, 1), (16, 1)],
  term ((-92129 : Rat) / 1178) [(4, 1), (5, 1), (15, 1), (16, 1)],
  term ((912 : Rat) / 31) [(4, 1), (6, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((227480 : Rat) / 1767) [(4, 1), (6, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((2052 : Rat) / 31) [(4, 1), (6, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((133078 : Rat) / 589) [(4, 1), (6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2185 : Rat) / 31) [(4, 1), (6, 1), (7, 1), (13, 1), (16, 1)],
  term ((-299957 : Rat) / 1178) [(4, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-428968 : Rat) / 1767) [(4, 1), (6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1824 : Rat) / 31) [(4, 1), (6, 1), (10, 1), (13, 2), (16, 1)],
  term ((113740 : Rat) / 1767) [(4, 1), (6, 1), (10, 1), (15, 2), (16, 1)],
  term ((-5717 : Rat) / 589) [(4, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((8893 : Rat) / 114) [(4, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-406880 : Rat) / 1767) [(4, 1), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2280 : Rat) / 31) [(4, 1), (6, 1), (12, 1), (13, 2), (16, 1)],
  term ((36398 : Rat) / 589) [(4, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((492473 : Rat) / 1767) [(4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((3572 : Rat) / 31) [(4, 1), (6, 1), (13, 2), (16, 1)],
  term ((-779297 : Rat) / 3534) [(4, 1), (6, 1), (15, 2), (16, 1)],
  term ((-456 : Rat) / 31) [(4, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-113740 : Rat) / 1767) [(4, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1026 : Rat) / 31) [(4, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-66539 : Rat) / 589) [(4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((2185 : Rat) / 62) [(4, 1), (7, 1), (13, 1), (16, 1)],
  term ((299957 : Rat) / 2356) [(4, 1), (7, 1), (15, 1), (16, 1)],
  term ((214484 : Rat) / 1767) [(4, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((912 : Rat) / 31) [(4, 1), (10, 1), (13, 2), (16, 1)],
  term ((-56870 : Rat) / 1767) [(4, 1), (10, 1), (15, 2), (16, 1)],
  term ((5717 : Rat) / 1178) [(4, 1), (11, 1), (13, 1), (16, 1)],
  term ((-8893 : Rat) / 228) [(4, 1), (11, 1), (15, 1), (16, 1)],
  term ((203440 : Rat) / 1767) [(4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1140 : Rat) / 31) [(4, 1), (12, 1), (13, 2), (16, 1)],
  term ((-18199 : Rat) / 589) [(4, 1), (12, 1), (15, 2), (16, 1)],
  term ((-492473 : Rat) / 3534) [(4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1786 : Rat) / 31) [(4, 1), (13, 2), (16, 1)],
  term ((779297 : Rat) / 7068) [(4, 1), (15, 2), (16, 1)],
  term ((-2096 : Rat) / 589) [(5, 1), (6, 1), (7, 1), (10, 1), (16, 1)],
  term ((1824 : Rat) / 31) [(5, 1), (6, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((454960 : Rat) / 1767) [(5, 1), (6, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((608 : Rat) / 31) [(5, 1), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((-2096 : Rat) / 589) [(5, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((1024 : Rat) / 589) [(5, 1), (6, 1), (11, 1), (12, 1), (16, 1)],
  term ((-3572 : Rat) / 31) [(5, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term ((-601856 : Rat) / 1767) [(5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((2280 : Rat) / 31) [(5, 1), (6, 1), (12, 2), (13, 1), (16, 1)],
  term ((445868 : Rat) / 1767) [(5, 1), (6, 1), (12, 2), (15, 1), (16, 1)],
  term ((-912 : Rat) / 31) [(5, 1), (6, 2), (10, 1), (13, 1), (16, 1)],
  term ((-227480 : Rat) / 1767) [(5, 1), (6, 2), (10, 1), (15, 1), (16, 1)],
  term ((2096 : Rat) / 589) [(5, 1), (6, 2), (11, 1), (16, 1)],
  term ((-2052 : Rat) / 31) [(5, 1), (6, 2), (12, 1), (13, 1), (16, 1)],
  term ((-133078 : Rat) / 589) [(5, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((2185 : Rat) / 31) [(5, 1), (6, 2), (13, 1), (16, 1)],
  term ((299957 : Rat) / 1178) [(5, 1), (6, 2), (15, 1), (16, 1)],
  term ((1048 : Rat) / 589) [(5, 1), (7, 1), (10, 1), (16, 1)],
  term ((-912 : Rat) / 31) [(5, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-227480 : Rat) / 1767) [(5, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-76 : Rat) / 31) [(5, 1), (10, 1), (13, 1), (16, 1)],
  term ((60014 : Rat) / 1767) [(5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-512 : Rat) / 589) [(5, 1), (11, 1), (12, 1), (16, 1)],
  term ((-524 : Rat) / 589) [(5, 1), (11, 1), (16, 1)],
  term ((2299 : Rat) / 31) [(5, 1), (12, 1), (13, 1), (16, 1)],
  term ((801473 : Rat) / 3534) [(5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1140 : Rat) / 31) [(5, 1), (12, 2), (13, 1), (16, 1)],
  term ((-222934 : Rat) / 1767) [(5, 1), (12, 2), (15, 1), (16, 1)],
  term ((-2185 : Rat) / 124) [(5, 1), (13, 1), (16, 1)],
  term ((-299957 : Rat) / 4712) [(5, 1), (15, 1), (16, 1)],
  term ((1024 : Rat) / 589) [(6, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((-912 : Rat) / 31) [(6, 1), (7, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-186536 : Rat) / 1767) [(6, 1), (7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3363 : Rat) / 62) [(6, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-926401 : Rat) / 7068) [(6, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((1368 : Rat) / 31) [(6, 1), (7, 1), (10, 2), (13, 1), (16, 1)],
  term ((113740 : Rat) / 589) [(6, 1), (7, 1), (10, 2), (15, 1), (16, 1)],
  term ((5264 : Rat) / 589) [(6, 1), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((1900 : Rat) / 31) [(6, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((311084 : Rat) / 1767) [(6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-912 : Rat) / 31) [(6, 1), (7, 1), (12, 2), (13, 1), (16, 1)],
  term ((-166064 : Rat) / 1767) [(6, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-456 : Rat) / 31) [(6, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-79084 : Rat) / 1767) [(6, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((912 : Rat) / 31) [(6, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((227480 : Rat) / 1767) [(6, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((8408 : Rat) / 589) [(6, 1), (10, 1), (12, 1), (16, 1)],
  term ((256003 : Rat) / 3534) [(6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((912 : Rat) / 31) [(6, 1), (10, 1), (13, 2), (16, 1)],
  term ((-713829 : Rat) / 2356) [(6, 1), (10, 1), (15, 2), (16, 1)],
  term ((-3948 : Rat) / 589) [(6, 1), (10, 1), (16, 1)],
  term ((2280 : Rat) / 31) [(6, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((568700 : Rat) / 1767) [(6, 1), (10, 2), (15, 2), (16, 1)],
  term ((5264 : Rat) / 589) [(6, 1), (10, 2), (16, 1)],
  term ((-912 : Rat) / 31) [(6, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-248756 : Rat) / 1767) [(6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((36398 : Rat) / 1767) [(6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((228 : Rat) / 31) [(6, 1), (12, 1), (13, 2), (16, 1)],
  term ((-228 : Rat) / 31) [(6, 1), (12, 1), (16, 1)],
  term ((152 : Rat) / 31) [(6, 1), (12, 2), (16, 1)],
  term ((-1368 : Rat) / 31) [(6, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-113740 : Rat) / 589) [(6, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((207008 : Rat) / 1767) [(6, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((912 : Rat) / 31) [(6, 2), (10, 1), (13, 2), (16, 1)],
  term ((-6824 : Rat) / 589) [(6, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((53369 : Rat) / 1178) [(6, 2), (11, 1), (13, 1), (16, 1)],
  term ((926401 : Rat) / 7068) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1024 : Rat) / 589) [(6, 2), (11, 2), (16, 1)],
  term ((166064 : Rat) / 1767) [(6, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((912 : Rat) / 31) [(6, 2), (12, 1), (13, 2), (16, 1)],
  term ((-311084 : Rat) / 1767) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1900 : Rat) / 31) [(6, 2), (13, 2), (16, 1)],
  term ((-512 : Rat) / 589) [(7, 1), (10, 1), (11, 1), (16, 1)],
  term ((456 : Rat) / 31) [(7, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((93268 : Rat) / 1767) [(7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((3363 : Rat) / 124) [(7, 1), (10, 1), (13, 1), (16, 1)],
  term ((926401 : Rat) / 14136) [(7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-684 : Rat) / 31) [(7, 1), (10, 2), (13, 1), (16, 1)],
  term ((-56870 : Rat) / 589) [(7, 1), (10, 2), (15, 1), (16, 1)],
  term ((-2632 : Rat) / 589) [(7, 1), (11, 1), (12, 1), (16, 1)],
  term ((-950 : Rat) / 31) [(7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-155542 : Rat) / 1767) [(7, 1), (12, 1), (15, 1), (16, 1)],
  term ((456 : Rat) / 31) [(7, 1), (12, 2), (13, 1), (16, 1)],
  term ((83032 : Rat) / 1767) [(7, 1), (12, 2), (15, 1), (16, 1)],
  term ((570 : Rat) / 31) [(10, 1), (11, 1), (13, 1), (16, 1)],
  term ((124847 : Rat) / 1767) [(10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-456 : Rat) / 31) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-113740 : Rat) / 1767) [(10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-4204 : Rat) / 589) [(10, 1), (12, 1), (16, 1)],
  term ((-8123 : Rat) / 124) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-684 : Rat) / 31) [(10, 1), (13, 2), (16, 1)],
  term ((713829 : Rat) / 4712) [(10, 1), (15, 2), (16, 1)],
  term ((1974 : Rat) / 589) [(10, 1), (16, 1)],
  term ((-1140 : Rat) / 31) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-284350 : Rat) / 1767) [(10, 2), (15, 2), (16, 1)],
  term ((-2632 : Rat) / 589) [(10, 2), (16, 1)],
  term ((456 : Rat) / 31) [(11, 1), (12, 1), (13, 1), (16, 1)],
  term ((129496 : Rat) / 1767) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-53369 : Rat) / 4712) [(11, 1), (13, 1), (16, 1)],
  term ((-926401 : Rat) / 28272) [(11, 1), (15, 1), (16, 1)],
  term ((256 : Rat) / 589) [(11, 2), (16, 1)],
  term ((-19905 : Rat) / 589) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-342 : Rat) / 31) [(12, 1), (13, 2), (16, 1)],
  term ((114 : Rat) / 31) [(12, 1), (16, 1)],
  term ((-76 : Rat) / 31) [(12, 2), (16, 1)],
  term ((77771 : Rat) / 1767) [(13, 1), (15, 1), (16, 1)],
  term ((475 : Rat) / 31) [(13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 16, terms 200 through 286. -/
theorem rs_R009_ueqv_R009NNNNN_block_16_0200_0286_valid :
    checkProductSumEq rs_R009_ueqv_R009NNNNN_partials_16_0200_0286
      rs_R009_ueqv_R009NNNNN_block_16_0200_0286 = true := by
  native_decide

end R009UeqvR009NNNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
