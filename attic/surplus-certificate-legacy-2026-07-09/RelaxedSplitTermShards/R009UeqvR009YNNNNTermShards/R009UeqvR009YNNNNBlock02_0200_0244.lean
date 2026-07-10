/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009YNNNN, term block 2:200-244

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009YNNNNTermShards

/-- Generator polynomial 2 for relaxed split surplus certificate `R009:u=v:R009YNNNN`. -/
def rs_R009_ueqv_R009YNNNN_generator_02_0200_0244 : Poly :=
[
  term (1 : Rat) [(0, 2)],
  term (1 : Rat) [(1, 2)],
  term (-1 : Rat) [(10, 2)],
  term (-1 : Rat) [(11, 2)]
]

/-- Coefficient term 200 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0200 : Poly :=
[
  term ((478374873295483 : Rat) / 2841865725888) [(9, 1), (15, 1)]
]

/-- Partial product 200 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0200 : Poly :=
[
  term ((478374873295483 : Rat) / 2841865725888) [(0, 2), (9, 1), (15, 1)],
  term ((478374873295483 : Rat) / 2841865725888) [(1, 2), (9, 1), (15, 1)],
  term ((-478374873295483 : Rat) / 2841865725888) [(9, 1), (10, 2), (15, 1)],
  term ((-478374873295483 : Rat) / 2841865725888) [(9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0200_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0200
        rs_R009_ueqv_R009YNNNN_generator_02_0200_0244 =
      rs_R009_ueqv_R009YNNNN_partial_02_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0201 : Poly :=
[
  term ((13 : Rat) / 84) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 201 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0201 : Poly :=
[
  term ((13 : Rat) / 84) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((13 : Rat) / 84) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((-13 : Rat) / 84) [(9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-13 : Rat) / 84) [(9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0201_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0201
        rs_R009_ueqv_R009YNNNN_generator_02_0200_0244 =
      rs_R009_ueqv_R009YNNNN_partial_02_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0202 : Poly :=
[
  term ((-3366906314273 : Rat) / 29602767978) [(9, 1), (15, 3)]
]

/-- Partial product 202 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0202 : Poly :=
[
  term ((-3366906314273 : Rat) / 29602767978) [(0, 2), (9, 1), (15, 3)],
  term ((-3366906314273 : Rat) / 29602767978) [(1, 2), (9, 1), (15, 3)],
  term ((3366906314273 : Rat) / 29602767978) [(9, 1), (10, 2), (15, 3)],
  term ((3366906314273 : Rat) / 29602767978) [(9, 1), (11, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0202_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0202
        rs_R009_ueqv_R009YNNNN_generator_02_0200_0244 =
      rs_R009_ueqv_R009YNNNN_partial_02_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0203 : Poly :=
[
  term ((65 : Rat) / 7) [(9, 1), (15, 3), (16, 1)]
]

/-- Partial product 203 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0203 : Poly :=
[
  term ((65 : Rat) / 7) [(0, 2), (9, 1), (15, 3), (16, 1)],
  term ((65 : Rat) / 7) [(1, 2), (9, 1), (15, 3), (16, 1)],
  term ((-65 : Rat) / 7) [(9, 1), (10, 2), (15, 3), (16, 1)],
  term ((-65 : Rat) / 7) [(9, 1), (11, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0203_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0203
        rs_R009_ueqv_R009YNNNN_generator_02_0200_0244 =
      rs_R009_ueqv_R009YNNNN_partial_02_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0204 : Poly :=
[
  term ((158570726509 : Rat) / 1332332736) [(9, 2)]
]

/-- Partial product 204 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0204 : Poly :=
[
  term ((158570726509 : Rat) / 1332332736) [(0, 2), (9, 2)],
  term ((158570726509 : Rat) / 1332332736) [(1, 2), (9, 2)],
  term ((-158570726509 : Rat) / 1332332736) [(9, 2), (10, 2)],
  term ((-158570726509 : Rat) / 1332332736) [(9, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0204_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0204
        rs_R009_ueqv_R009YNNNN_generator_02_0200_0244 =
      rs_R009_ueqv_R009YNNNN_partial_02_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0205 : Poly :=
[
  term ((-210703568101 : Rat) / 2997748656) [(9, 2), (10, 1)]
]

/-- Partial product 205 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0205 : Poly :=
[
  term ((-210703568101 : Rat) / 2997748656) [(0, 2), (9, 2), (10, 1)],
  term ((-210703568101 : Rat) / 2997748656) [(1, 2), (9, 2), (10, 1)],
  term ((210703568101 : Rat) / 2997748656) [(9, 2), (10, 1), (11, 2)],
  term ((210703568101 : Rat) / 2997748656) [(9, 2), (10, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0205_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0205
        rs_R009_ueqv_R009YNNNN_generator_02_0200_0244 =
      rs_R009_ueqv_R009YNNNN_partial_02_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0206 : Poly :=
[
  term ((-940563350389 : Rat) / 8993245968) [(9, 2), (14, 1)]
]

/-- Partial product 206 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0206 : Poly :=
[
  term ((-940563350389 : Rat) / 8993245968) [(0, 2), (9, 2), (14, 1)],
  term ((-940563350389 : Rat) / 8993245968) [(1, 2), (9, 2), (14, 1)],
  term ((940563350389 : Rat) / 8993245968) [(9, 2), (10, 2), (14, 1)],
  term ((940563350389 : Rat) / 8993245968) [(9, 2), (11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0206_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0206
        rs_R009_ueqv_R009YNNNN_generator_02_0200_0244 =
      rs_R009_ueqv_R009YNNNN_partial_02_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0207 : Poly :=
[
  term ((-210703568101 : Rat) / 2997748656) [(9, 2), (15, 2)]
]

/-- Partial product 207 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0207 : Poly :=
[
  term ((-210703568101 : Rat) / 2997748656) [(0, 2), (9, 2), (15, 2)],
  term ((-210703568101 : Rat) / 2997748656) [(1, 2), (9, 2), (15, 2)],
  term ((210703568101 : Rat) / 2997748656) [(9, 2), (10, 2), (15, 2)],
  term ((210703568101 : Rat) / 2997748656) [(9, 2), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0207_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0207
        rs_R009_ueqv_R009YNNNN_generator_02_0200_0244 =
      rs_R009_ueqv_R009YNNNN_partial_02_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0208 : Poly :=
[
  term ((9984 : Rat) / 553) [(10, 1)]
]

/-- Partial product 208 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0208 : Poly :=
[
  term ((9984 : Rat) / 553) [(0, 2), (10, 1)],
  term ((9984 : Rat) / 553) [(1, 2), (10, 1)],
  term ((-9984 : Rat) / 553) [(10, 1), (11, 2)],
  term ((-9984 : Rat) / 553) [(10, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0208_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0208
        rs_R009_ueqv_R009YNNNN_generator_02_0200_0244 =
      rs_R009_ueqv_R009YNNNN_partial_02_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0209 : Poly :=
[
  term ((-443073850304263 : Rat) / 932487191307) [(10, 1), (11, 1), (15, 1)]
]

/-- Partial product 209 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0209 : Poly :=
[
  term ((-443073850304263 : Rat) / 932487191307) [(0, 2), (10, 1), (11, 1), (15, 1)],
  term ((-443073850304263 : Rat) / 932487191307) [(1, 2), (10, 1), (11, 1), (15, 1)],
  term ((443073850304263 : Rat) / 932487191307) [(10, 1), (11, 3), (15, 1)],
  term ((443073850304263 : Rat) / 932487191307) [(10, 3), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0209_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0209
        rs_R009_ueqv_R009YNNNN_generator_02_0200_0244 =
      rs_R009_ueqv_R009YNNNN_partial_02_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0210 : Poly :=
[
  term ((3423936574329053 : Rat) / 6394197883248) [(10, 1), (13, 1), (15, 1)]
]

/-- Partial product 210 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0210 : Poly :=
[
  term ((3423936574329053 : Rat) / 6394197883248) [(0, 2), (10, 1), (13, 1), (15, 1)],
  term ((3423936574329053 : Rat) / 6394197883248) [(1, 2), (10, 1), (13, 1), (15, 1)],
  term ((-3423936574329053 : Rat) / 6394197883248) [(10, 1), (11, 2), (13, 1), (15, 1)],
  term ((-3423936574329053 : Rat) / 6394197883248) [(10, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0210_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0210
        rs_R009_ueqv_R009YNNNN_generator_02_0200_0244 =
      rs_R009_ueqv_R009YNNNN_partial_02_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0211 : Poly :=
[
  term ((-3425 : Rat) / 504) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 211 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0211 : Poly :=
[
  term ((-3425 : Rat) / 504) [(0, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3425 : Rat) / 504) [(1, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((3425 : Rat) / 504) [(10, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((3425 : Rat) / 504) [(10, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0211_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0211
        rs_R009_ueqv_R009YNNNN_generator_02_0200_0244 =
      rs_R009_ueqv_R009YNNNN_partial_02_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0212 : Poly :=
[
  term ((3491796256120 : Rat) / 44404151967) [(10, 1), (14, 1)]
]

/-- Partial product 212 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0212 : Poly :=
[
  term ((3491796256120 : Rat) / 44404151967) [(0, 2), (10, 1), (14, 1)],
  term ((3491796256120 : Rat) / 44404151967) [(1, 2), (10, 1), (14, 1)],
  term ((-3491796256120 : Rat) / 44404151967) [(10, 1), (11, 2), (14, 1)],
  term ((-3491796256120 : Rat) / 44404151967) [(10, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0212_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0212
        rs_R009_ueqv_R009YNNNN_generator_02_0200_0244 =
      rs_R009_ueqv_R009YNNNN_partial_02_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0213 : Poly :=
[
  term ((-969271862750903 : Rat) / 1864974382614) [(10, 1), (15, 2)]
]

/-- Partial product 213 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0213 : Poly :=
[
  term ((-969271862750903 : Rat) / 1864974382614) [(0, 2), (10, 1), (15, 2)],
  term ((-969271862750903 : Rat) / 1864974382614) [(1, 2), (10, 1), (15, 2)],
  term ((969271862750903 : Rat) / 1864974382614) [(10, 1), (11, 2), (15, 2)],
  term ((969271862750903 : Rat) / 1864974382614) [(10, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0213_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0213
        rs_R009_ueqv_R009YNNNN_generator_02_0200_0244 =
      rs_R009_ueqv_R009YNNNN_partial_02_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0214 : Poly :=
[
  term ((593 : Rat) / 126) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 214 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0214 : Poly :=
[
  term ((593 : Rat) / 126) [(0, 2), (10, 1), (15, 2), (16, 1)],
  term ((593 : Rat) / 126) [(1, 2), (10, 1), (15, 2), (16, 1)],
  term ((-593 : Rat) / 126) [(10, 1), (11, 2), (15, 2), (16, 1)],
  term ((-593 : Rat) / 126) [(10, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0214_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0214
        rs_R009_ueqv_R009YNNNN_generator_02_0200_0244 =
      rs_R009_ueqv_R009YNNNN_partial_02_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0215 : Poly :=
[
  term ((34814158588603 : Rat) / 78940714608) [(11, 1), (13, 1)]
]

/-- Partial product 215 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0215 : Poly :=
[
  term ((34814158588603 : Rat) / 78940714608) [(0, 2), (11, 1), (13, 1)],
  term ((34814158588603 : Rat) / 78940714608) [(1, 2), (11, 1), (13, 1)],
  term ((-34814158588603 : Rat) / 78940714608) [(10, 2), (11, 1), (13, 1)],
  term ((-34814158588603 : Rat) / 78940714608) [(11, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0215_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0215
        rs_R009_ueqv_R009YNNNN_generator_02_0200_0244 =
      rs_R009_ueqv_R009YNNNN_partial_02_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0216 : Poly :=
[
  term ((-279556226161057949 : Rat) / 313315696279152) [(11, 1), (13, 1), (14, 1)]
]

/-- Partial product 216 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0216 : Poly :=
[
  term ((-279556226161057949 : Rat) / 313315696279152) [(0, 2), (11, 1), (13, 1), (14, 1)],
  term ((-279556226161057949 : Rat) / 313315696279152) [(1, 2), (11, 1), (13, 1), (14, 1)],
  term ((279556226161057949 : Rat) / 313315696279152) [(10, 2), (11, 1), (13, 1), (14, 1)],
  term ((279556226161057949 : Rat) / 313315696279152) [(11, 3), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0216_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0216
        rs_R009_ueqv_R009YNNNN_generator_02_0200_0244 =
      rs_R009_ueqv_R009YNNNN_partial_02_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0217 : Poly :=
[
  term ((3425 : Rat) / 504) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 217 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0217 : Poly :=
[
  term ((3425 : Rat) / 504) [(0, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((3425 : Rat) / 504) [(1, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3425 : Rat) / 504) [(10, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3425 : Rat) / 504) [(11, 3), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0217_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0217
        rs_R009_ueqv_R009YNNNN_generator_02_0200_0244 =
      rs_R009_ueqv_R009YNNNN_partial_02_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0218 : Poly :=
[
  term ((239616 : Rat) / 553) [(11, 1), (13, 1), (15, 2)]
]

/-- Partial product 218 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0218 : Poly :=
[
  term ((239616 : Rat) / 553) [(0, 2), (11, 1), (13, 1), (15, 2)],
  term ((239616 : Rat) / 553) [(1, 2), (11, 1), (13, 1), (15, 2)],
  term ((-239616 : Rat) / 553) [(10, 2), (11, 1), (13, 1), (15, 2)],
  term ((-239616 : Rat) / 553) [(11, 3), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0218_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0218
        rs_R009_ueqv_R009YNNNN_generator_02_0200_0244 =
      rs_R009_ueqv_R009YNNNN_partial_02_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0219 : Poly :=
[
  term ((305 : Rat) / 56) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 219 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0219 : Poly :=
[
  term ((305 : Rat) / 56) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term ((305 : Rat) / 56) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term ((-305 : Rat) / 56) [(10, 2), (11, 1), (13, 1), (16, 1)],
  term ((-305 : Rat) / 56) [(11, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0219_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0219
        rs_R009_ueqv_R009YNNNN_generator_02_0200_0244 =
      rs_R009_ueqv_R009YNNNN_partial_02_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0220 : Poly :=
[
  term ((767247585325751 : Rat) / 1864974382614) [(11, 1), (14, 1), (15, 1)]
]

/-- Partial product 220 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0220 : Poly :=
[
  term ((767247585325751 : Rat) / 1864974382614) [(0, 2), (11, 1), (14, 1), (15, 1)],
  term ((767247585325751 : Rat) / 1864974382614) [(1, 2), (11, 1), (14, 1), (15, 1)],
  term ((-767247585325751 : Rat) / 1864974382614) [(10, 2), (11, 1), (14, 1), (15, 1)],
  term ((-767247585325751 : Rat) / 1864974382614) [(11, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0220_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0220
        rs_R009_ueqv_R009YNNNN_generator_02_0200_0244 =
      rs_R009_ueqv_R009YNNNN_partial_02_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0221 : Poly :=
[
  term ((-593 : Rat) / 126) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 221 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0221 : Poly :=
[
  term ((-593 : Rat) / 126) [(0, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-593 : Rat) / 126) [(1, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((593 : Rat) / 126) [(10, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((593 : Rat) / 126) [(11, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0221_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0221
        rs_R009_ueqv_R009YNNNN_generator_02_0200_0244 =
      rs_R009_ueqv_R009YNNNN_partial_02_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0222 : Poly :=
[
  term ((9647328393532813 : Rat) / 17406427571064) [(11, 1), (15, 1)]
]

/-- Partial product 222 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0222 : Poly :=
[
  term ((9647328393532813 : Rat) / 17406427571064) [(0, 2), (11, 1), (15, 1)],
  term ((9647328393532813 : Rat) / 17406427571064) [(1, 2), (11, 1), (15, 1)],
  term ((-9647328393532813 : Rat) / 17406427571064) [(10, 2), (11, 1), (15, 1)],
  term ((-9647328393532813 : Rat) / 17406427571064) [(11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0222_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0222
        rs_R009_ueqv_R009YNNNN_generator_02_0200_0244 =
      rs_R009_ueqv_R009YNNNN_partial_02_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0223 : Poly :=
[
  term ((-65 : Rat) / 14) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 223 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0223 : Poly :=
[
  term ((-65 : Rat) / 14) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((-65 : Rat) / 14) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((65 : Rat) / 14) [(10, 2), (11, 1), (15, 1), (16, 1)],
  term ((65 : Rat) / 14) [(11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0223_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0223
        rs_R009_ueqv_R009YNNNN_generator_02_0200_0244 =
      rs_R009_ueqv_R009YNNNN_partial_02_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0224 : Poly :=
[
  term ((59904 : Rat) / 553) [(11, 2)]
]

/-- Partial product 224 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0224 : Poly :=
[
  term ((59904 : Rat) / 553) [(0, 2), (11, 2)],
  term ((59904 : Rat) / 553) [(1, 2), (11, 2)],
  term ((-59904 : Rat) / 553) [(10, 2), (11, 2)],
  term ((-59904 : Rat) / 553) [(11, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0224_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0224
        rs_R009_ueqv_R009YNNNN_generator_02_0200_0244 =
      rs_R009_ueqv_R009YNNNN_partial_02_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0225 : Poly :=
[
  term ((443073850304263 : Rat) / 932487191307) [(11, 2), (14, 1)]
]

/-- Partial product 225 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0225 : Poly :=
[
  term ((443073850304263 : Rat) / 932487191307) [(0, 2), (11, 2), (14, 1)],
  term ((443073850304263 : Rat) / 932487191307) [(1, 2), (11, 2), (14, 1)],
  term ((-443073850304263 : Rat) / 932487191307) [(10, 2), (11, 2), (14, 1)],
  term ((-443073850304263 : Rat) / 932487191307) [(11, 4), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0225_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0225
        rs_R009_ueqv_R009YNNNN_generator_02_0200_0244 =
      rs_R009_ueqv_R009YNNNN_partial_02_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0226 : Poly :=
[
  term ((-42478288242592501 : Rat) / 104438565426384) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 226 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0226 : Poly :=
[
  term ((-42478288242592501 : Rat) / 104438565426384) [(0, 2), (13, 1), (14, 1), (15, 1)],
  term ((-42478288242592501 : Rat) / 104438565426384) [(1, 2), (13, 1), (14, 1), (15, 1)],
  term ((42478288242592501 : Rat) / 104438565426384) [(10, 2), (13, 1), (14, 1), (15, 1)],
  term ((42478288242592501 : Rat) / 104438565426384) [(11, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0226_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0226
        rs_R009_ueqv_R009YNNNN_generator_02_0200_0244 =
      rs_R009_ueqv_R009YNNNN_partial_02_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0227 : Poly :=
[
  term ((9935 : Rat) / 504) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 227 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0227 : Poly :=
[
  term ((9935 : Rat) / 504) [(0, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((9935 : Rat) / 504) [(1, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9935 : Rat) / 504) [(10, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9935 : Rat) / 504) [(11, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0227_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0227
        rs_R009_ueqv_R009YNNNN_generator_02_0200_0244 =
      rs_R009_ueqv_R009YNNNN_partial_02_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0228 : Poly :=
[
  term ((1532199782809 : Rat) / 26861770943) [(13, 1), (14, 2), (15, 1)]
]

/-- Partial product 228 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0228 : Poly :=
[
  term ((1532199782809 : Rat) / 26861770943) [(0, 2), (13, 1), (14, 2), (15, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(1, 2), (13, 1), (14, 2), (15, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(10, 2), (13, 1), (14, 2), (15, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(11, 2), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0228_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0228
        rs_R009_ueqv_R009YNNNN_generator_02_0200_0244 =
      rs_R009_ueqv_R009YNNNN_partial_02_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0229 : Poly :=
[
  term ((21402345960848759 : Rat) / 208877130852768) [(13, 1), (15, 1)]
]

/-- Partial product 229 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0229 : Poly :=
[
  term ((21402345960848759 : Rat) / 208877130852768) [(0, 2), (13, 1), (15, 1)],
  term ((21402345960848759 : Rat) / 208877130852768) [(1, 2), (13, 1), (15, 1)],
  term ((-21402345960848759 : Rat) / 208877130852768) [(10, 2), (13, 1), (15, 1)],
  term ((-21402345960848759 : Rat) / 208877130852768) [(11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0229_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0229
        rs_R009_ueqv_R009YNNNN_generator_02_0200_0244 =
      rs_R009_ueqv_R009YNNNN_partial_02_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0230 : Poly :=
[
  term ((-6359 : Rat) / 336) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 230 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0230 : Poly :=
[
  term ((-6359 : Rat) / 336) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-6359 : Rat) / 336) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((6359 : Rat) / 336) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term ((6359 : Rat) / 336) [(11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0230_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0230
        rs_R009_ueqv_R009YNNNN_generator_02_0200_0244 =
      rs_R009_ueqv_R009YNNNN_partial_02_0230 := by
  native_decide

/-- Coefficient term 231 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0231 : Poly :=
[
  term ((3366906314273 : Rat) / 14801383989) [(13, 1), (15, 3)]
]

/-- Partial product 231 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0231 : Poly :=
[
  term ((3366906314273 : Rat) / 14801383989) [(0, 2), (13, 1), (15, 3)],
  term ((3366906314273 : Rat) / 14801383989) [(1, 2), (13, 1), (15, 3)],
  term ((-3366906314273 : Rat) / 14801383989) [(10, 2), (13, 1), (15, 3)],
  term ((-3366906314273 : Rat) / 14801383989) [(11, 2), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 231 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0231_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0231
        rs_R009_ueqv_R009YNNNN_generator_02_0200_0244 =
      rs_R009_ueqv_R009YNNNN_partial_02_0231 := by
  native_decide

/-- Coefficient term 232 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0232 : Poly :=
[
  term ((-130 : Rat) / 7) [(13, 1), (15, 3), (16, 1)]
]

/-- Partial product 232 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0232 : Poly :=
[
  term ((-130 : Rat) / 7) [(0, 2), (13, 1), (15, 3), (16, 1)],
  term ((-130 : Rat) / 7) [(1, 2), (13, 1), (15, 3), (16, 1)],
  term ((130 : Rat) / 7) [(10, 2), (13, 1), (15, 3), (16, 1)],
  term ((130 : Rat) / 7) [(11, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 232 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0232_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0232
        rs_R009_ueqv_R009YNNNN_generator_02_0200_0244 =
      rs_R009_ueqv_R009YNNNN_partial_02_0232 := by
  native_decide

/-- Coefficient term 233 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0233 : Poly :=
[
  term ((-4157630447657 : Rat) / 88808303934) [(13, 2)]
]

/-- Partial product 233 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0233 : Poly :=
[
  term ((-4157630447657 : Rat) / 88808303934) [(0, 2), (13, 2)],
  term ((-4157630447657 : Rat) / 88808303934) [(1, 2), (13, 2)],
  term ((4157630447657 : Rat) / 88808303934) [(10, 2), (13, 2)],
  term ((4157630447657 : Rat) / 88808303934) [(11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 233 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0233_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0233
        rs_R009_ueqv_R009YNNNN_generator_02_0200_0244 =
      rs_R009_ueqv_R009YNNNN_partial_02_0233 := by
  native_decide

/-- Coefficient term 234 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0234 : Poly :=
[
  term ((2438286298446361 : Rat) / 3197098941624) [(13, 2), (14, 1)]
]

/-- Partial product 234 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0234 : Poly :=
[
  term ((2438286298446361 : Rat) / 3197098941624) [(0, 2), (13, 2), (14, 1)],
  term ((2438286298446361 : Rat) / 3197098941624) [(1, 2), (13, 2), (14, 1)],
  term ((-2438286298446361 : Rat) / 3197098941624) [(10, 2), (13, 2), (14, 1)],
  term ((-2438286298446361 : Rat) / 3197098941624) [(11, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 234 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0234_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0234
        rs_R009_ueqv_R009YNNNN_generator_02_0200_0244 =
      rs_R009_ueqv_R009YNNNN_partial_02_0234 := by
  native_decide

/-- Coefficient term 235 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0235 : Poly :=
[
  term ((-7645 : Rat) / 252) [(13, 2), (14, 1), (16, 1)]
]

/-- Partial product 235 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0235 : Poly :=
[
  term ((-7645 : Rat) / 252) [(0, 2), (13, 2), (14, 1), (16, 1)],
  term ((-7645 : Rat) / 252) [(1, 2), (13, 2), (14, 1), (16, 1)],
  term ((7645 : Rat) / 252) [(10, 2), (13, 2), (14, 1), (16, 1)],
  term ((7645 : Rat) / 252) [(11, 2), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 235 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0235_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0235
        rs_R009_ueqv_R009YNNNN_generator_02_0200_0244 =
      rs_R009_ueqv_R009YNNNN_partial_02_0235 := by
  native_decide

/-- Coefficient term 236 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0236 : Poly :=
[
  term ((-2954048478533 : Rat) / 19735178652) [(13, 2), (15, 2)]
]

/-- Partial product 236 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0236 : Poly :=
[
  term ((-2954048478533 : Rat) / 19735178652) [(0, 2), (13, 2), (15, 2)],
  term ((-2954048478533 : Rat) / 19735178652) [(1, 2), (13, 2), (15, 2)],
  term ((2954048478533 : Rat) / 19735178652) [(10, 2), (13, 2), (15, 2)],
  term ((2954048478533 : Rat) / 19735178652) [(11, 2), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 236 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0236_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0236
        rs_R009_ueqv_R009YNNNN_generator_02_0200_0244 =
      rs_R009_ueqv_R009YNNNN_partial_02_0236 := by
  native_decide

/-- Coefficient term 237 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0237 : Poly :=
[
  term ((305 : Rat) / 14) [(13, 2), (15, 2), (16, 1)]
]

/-- Partial product 237 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0237 : Poly :=
[
  term ((305 : Rat) / 14) [(0, 2), (13, 2), (15, 2), (16, 1)],
  term ((305 : Rat) / 14) [(1, 2), (13, 2), (15, 2), (16, 1)],
  term ((-305 : Rat) / 14) [(10, 2), (13, 2), (15, 2), (16, 1)],
  term ((-305 : Rat) / 14) [(11, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 237 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0237_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0237
        rs_R009_ueqv_R009YNNNN_generator_02_0200_0244 =
      rs_R009_ueqv_R009YNNNN_partial_02_0237 := by
  native_decide

/-- Coefficient term 238 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0238 : Poly :=
[
  term ((55 : Rat) / 3) [(13, 2), (16, 1)]
]

/-- Partial product 238 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0238 : Poly :=
[
  term ((55 : Rat) / 3) [(0, 2), (13, 2), (16, 1)],
  term ((55 : Rat) / 3) [(1, 2), (13, 2), (16, 1)],
  term ((-55 : Rat) / 3) [(10, 2), (13, 2), (16, 1)],
  term ((-55 : Rat) / 3) [(11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 238 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0238_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0238
        rs_R009_ueqv_R009YNNNN_generator_02_0200_0244 =
      rs_R009_ueqv_R009YNNNN_partial_02_0238 := by
  native_decide

/-- Coefficient term 239 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0239 : Poly :=
[
  term ((-29166615233519929 : Rat) / 104438565426384) [(14, 1)]
]

/-- Partial product 239 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0239 : Poly :=
[
  term ((-29166615233519929 : Rat) / 104438565426384) [(0, 2), (14, 1)],
  term ((-29166615233519929 : Rat) / 104438565426384) [(1, 2), (14, 1)],
  term ((29166615233519929 : Rat) / 104438565426384) [(10, 2), (14, 1)],
  term ((29166615233519929 : Rat) / 104438565426384) [(11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 239 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0239_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0239
        rs_R009_ueqv_R009YNNNN_generator_02_0200_0244 =
      rs_R009_ueqv_R009YNNNN_partial_02_0239 := by
  native_decide

/-- Coefficient term 240 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0240 : Poly :=
[
  term ((-247717197671063 : Rat) / 2901071261844) [(14, 1), (15, 2)]
]

/-- Partial product 240 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0240 : Poly :=
[
  term ((-247717197671063 : Rat) / 2901071261844) [(0, 2), (14, 1), (15, 2)],
  term ((-247717197671063 : Rat) / 2901071261844) [(1, 2), (14, 1), (15, 2)],
  term ((247717197671063 : Rat) / 2901071261844) [(10, 2), (14, 1), (15, 2)],
  term ((247717197671063 : Rat) / 2901071261844) [(11, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 240 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0240_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0240
        rs_R009_ueqv_R009YNNNN_generator_02_0200_0244 =
      rs_R009_ueqv_R009YNNNN_partial_02_0240 := by
  native_decide

/-- Coefficient term 241 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0241 : Poly :=
[
  term ((65 : Rat) / 14) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 241 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0241 : Poly :=
[
  term ((65 : Rat) / 14) [(0, 2), (14, 1), (15, 2), (16, 1)],
  term ((65 : Rat) / 14) [(1, 2), (14, 1), (15, 2), (16, 1)],
  term ((-65 : Rat) / 14) [(10, 2), (14, 1), (15, 2), (16, 1)],
  term ((-65 : Rat) / 14) [(11, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 241 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0241_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0241
        rs_R009_ueqv_R009YNNNN_generator_02_0200_0244 =
      rs_R009_ueqv_R009YNNNN_partial_02_0241 := by
  native_decide

/-- Coefficient term 242 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0242 : Poly :=
[
  term ((-10228028852911099 : Rat) / 52219282713192) [(14, 2)]
]

/-- Partial product 242 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0242 : Poly :=
[
  term ((-10228028852911099 : Rat) / 52219282713192) [(0, 2), (14, 2)],
  term ((-10228028852911099 : Rat) / 52219282713192) [(1, 2), (14, 2)],
  term ((10228028852911099 : Rat) / 52219282713192) [(10, 2), (14, 2)],
  term ((10228028852911099 : Rat) / 52219282713192) [(11, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 242 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0242_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0242
        rs_R009_ueqv_R009YNNNN_generator_02_0200_0244 =
      rs_R009_ueqv_R009YNNNN_partial_02_0242 := by
  native_decide

/-- Coefficient term 243 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0243 : Poly :=
[
  term ((-6292612742532443 : Rat) / 7459897530456) [(15, 2)]
]

/-- Partial product 243 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0243 : Poly :=
[
  term ((-6292612742532443 : Rat) / 7459897530456) [(0, 2), (15, 2)],
  term ((-6292612742532443 : Rat) / 7459897530456) [(1, 2), (15, 2)],
  term ((6292612742532443 : Rat) / 7459897530456) [(10, 2), (15, 2)],
  term ((6292612742532443 : Rat) / 7459897530456) [(11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 243 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0243_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0243
        rs_R009_ueqv_R009YNNNN_generator_02_0200_0244 =
      rs_R009_ueqv_R009YNNNN_partial_02_0243 := by
  native_decide

/-- Coefficient term 244 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0244 : Poly :=
[
  term ((29 : Rat) / 12) [(15, 2), (16, 1)]
]

/-- Partial product 244 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0244 : Poly :=
[
  term ((29 : Rat) / 12) [(0, 2), (15, 2), (16, 1)],
  term ((29 : Rat) / 12) [(1, 2), (15, 2), (16, 1)],
  term ((-29 : Rat) / 12) [(10, 2), (15, 2), (16, 1)],
  term ((-29 : Rat) / 12) [(11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 244 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0244_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0244
        rs_R009_ueqv_R009YNNNN_generator_02_0200_0244 =
      rs_R009_ueqv_R009YNNNN_partial_02_0244 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_partials_02_0200_0244 : List Poly :=
[
  rs_R009_ueqv_R009YNNNN_partial_02_0200,
  rs_R009_ueqv_R009YNNNN_partial_02_0201,
  rs_R009_ueqv_R009YNNNN_partial_02_0202,
  rs_R009_ueqv_R009YNNNN_partial_02_0203,
  rs_R009_ueqv_R009YNNNN_partial_02_0204,
  rs_R009_ueqv_R009YNNNN_partial_02_0205,
  rs_R009_ueqv_R009YNNNN_partial_02_0206,
  rs_R009_ueqv_R009YNNNN_partial_02_0207,
  rs_R009_ueqv_R009YNNNN_partial_02_0208,
  rs_R009_ueqv_R009YNNNN_partial_02_0209,
  rs_R009_ueqv_R009YNNNN_partial_02_0210,
  rs_R009_ueqv_R009YNNNN_partial_02_0211,
  rs_R009_ueqv_R009YNNNN_partial_02_0212,
  rs_R009_ueqv_R009YNNNN_partial_02_0213,
  rs_R009_ueqv_R009YNNNN_partial_02_0214,
  rs_R009_ueqv_R009YNNNN_partial_02_0215,
  rs_R009_ueqv_R009YNNNN_partial_02_0216,
  rs_R009_ueqv_R009YNNNN_partial_02_0217,
  rs_R009_ueqv_R009YNNNN_partial_02_0218,
  rs_R009_ueqv_R009YNNNN_partial_02_0219,
  rs_R009_ueqv_R009YNNNN_partial_02_0220,
  rs_R009_ueqv_R009YNNNN_partial_02_0221,
  rs_R009_ueqv_R009YNNNN_partial_02_0222,
  rs_R009_ueqv_R009YNNNN_partial_02_0223,
  rs_R009_ueqv_R009YNNNN_partial_02_0224,
  rs_R009_ueqv_R009YNNNN_partial_02_0225,
  rs_R009_ueqv_R009YNNNN_partial_02_0226,
  rs_R009_ueqv_R009YNNNN_partial_02_0227,
  rs_R009_ueqv_R009YNNNN_partial_02_0228,
  rs_R009_ueqv_R009YNNNN_partial_02_0229,
  rs_R009_ueqv_R009YNNNN_partial_02_0230,
  rs_R009_ueqv_R009YNNNN_partial_02_0231,
  rs_R009_ueqv_R009YNNNN_partial_02_0232,
  rs_R009_ueqv_R009YNNNN_partial_02_0233,
  rs_R009_ueqv_R009YNNNN_partial_02_0234,
  rs_R009_ueqv_R009YNNNN_partial_02_0235,
  rs_R009_ueqv_R009YNNNN_partial_02_0236,
  rs_R009_ueqv_R009YNNNN_partial_02_0237,
  rs_R009_ueqv_R009YNNNN_partial_02_0238,
  rs_R009_ueqv_R009YNNNN_partial_02_0239,
  rs_R009_ueqv_R009YNNNN_partial_02_0240,
  rs_R009_ueqv_R009YNNNN_partial_02_0241,
  rs_R009_ueqv_R009YNNNN_partial_02_0242,
  rs_R009_ueqv_R009YNNNN_partial_02_0243,
  rs_R009_ueqv_R009YNNNN_partial_02_0244
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_block_02_0200_0244 : Poly :=
[
  term ((478374873295483 : Rat) / 2841865725888) [(0, 2), (9, 1), (15, 1)],
  term ((13 : Rat) / 84) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((-3366906314273 : Rat) / 29602767978) [(0, 2), (9, 1), (15, 3)],
  term ((65 : Rat) / 7) [(0, 2), (9, 1), (15, 3), (16, 1)],
  term ((158570726509 : Rat) / 1332332736) [(0, 2), (9, 2)],
  term ((-210703568101 : Rat) / 2997748656) [(0, 2), (9, 2), (10, 1)],
  term ((-940563350389 : Rat) / 8993245968) [(0, 2), (9, 2), (14, 1)],
  term ((-210703568101 : Rat) / 2997748656) [(0, 2), (9, 2), (15, 2)],
  term ((9984 : Rat) / 553) [(0, 2), (10, 1)],
  term ((-443073850304263 : Rat) / 932487191307) [(0, 2), (10, 1), (11, 1), (15, 1)],
  term ((3423936574329053 : Rat) / 6394197883248) [(0, 2), (10, 1), (13, 1), (15, 1)],
  term ((-3425 : Rat) / 504) [(0, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((3491796256120 : Rat) / 44404151967) [(0, 2), (10, 1), (14, 1)],
  term ((-969271862750903 : Rat) / 1864974382614) [(0, 2), (10, 1), (15, 2)],
  term ((593 : Rat) / 126) [(0, 2), (10, 1), (15, 2), (16, 1)],
  term ((34814158588603 : Rat) / 78940714608) [(0, 2), (11, 1), (13, 1)],
  term ((-279556226161057949 : Rat) / 313315696279152) [(0, 2), (11, 1), (13, 1), (14, 1)],
  term ((3425 : Rat) / 504) [(0, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((239616 : Rat) / 553) [(0, 2), (11, 1), (13, 1), (15, 2)],
  term ((305 : Rat) / 56) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term ((767247585325751 : Rat) / 1864974382614) [(0, 2), (11, 1), (14, 1), (15, 1)],
  term ((-593 : Rat) / 126) [(0, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((9647328393532813 : Rat) / 17406427571064) [(0, 2), (11, 1), (15, 1)],
  term ((-65 : Rat) / 14) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((59904 : Rat) / 553) [(0, 2), (11, 2)],
  term ((443073850304263 : Rat) / 932487191307) [(0, 2), (11, 2), (14, 1)],
  term ((-42478288242592501 : Rat) / 104438565426384) [(0, 2), (13, 1), (14, 1), (15, 1)],
  term ((9935 : Rat) / 504) [(0, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(0, 2), (13, 1), (14, 2), (15, 1)],
  term ((21402345960848759 : Rat) / 208877130852768) [(0, 2), (13, 1), (15, 1)],
  term ((-6359 : Rat) / 336) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((3366906314273 : Rat) / 14801383989) [(0, 2), (13, 1), (15, 3)],
  term ((-130 : Rat) / 7) [(0, 2), (13, 1), (15, 3), (16, 1)],
  term ((-4157630447657 : Rat) / 88808303934) [(0, 2), (13, 2)],
  term ((2438286298446361 : Rat) / 3197098941624) [(0, 2), (13, 2), (14, 1)],
  term ((-7645 : Rat) / 252) [(0, 2), (13, 2), (14, 1), (16, 1)],
  term ((-2954048478533 : Rat) / 19735178652) [(0, 2), (13, 2), (15, 2)],
  term ((305 : Rat) / 14) [(0, 2), (13, 2), (15, 2), (16, 1)],
  term ((55 : Rat) / 3) [(0, 2), (13, 2), (16, 1)],
  term ((-29166615233519929 : Rat) / 104438565426384) [(0, 2), (14, 1)],
  term ((-247717197671063 : Rat) / 2901071261844) [(0, 2), (14, 1), (15, 2)],
  term ((65 : Rat) / 14) [(0, 2), (14, 1), (15, 2), (16, 1)],
  term ((-10228028852911099 : Rat) / 52219282713192) [(0, 2), (14, 2)],
  term ((-6292612742532443 : Rat) / 7459897530456) [(0, 2), (15, 2)],
  term ((29 : Rat) / 12) [(0, 2), (15, 2), (16, 1)],
  term ((478374873295483 : Rat) / 2841865725888) [(1, 2), (9, 1), (15, 1)],
  term ((13 : Rat) / 84) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((-3366906314273 : Rat) / 29602767978) [(1, 2), (9, 1), (15, 3)],
  term ((65 : Rat) / 7) [(1, 2), (9, 1), (15, 3), (16, 1)],
  term ((158570726509 : Rat) / 1332332736) [(1, 2), (9, 2)],
  term ((-210703568101 : Rat) / 2997748656) [(1, 2), (9, 2), (10, 1)],
  term ((-940563350389 : Rat) / 8993245968) [(1, 2), (9, 2), (14, 1)],
  term ((-210703568101 : Rat) / 2997748656) [(1, 2), (9, 2), (15, 2)],
  term ((9984 : Rat) / 553) [(1, 2), (10, 1)],
  term ((-443073850304263 : Rat) / 932487191307) [(1, 2), (10, 1), (11, 1), (15, 1)],
  term ((3423936574329053 : Rat) / 6394197883248) [(1, 2), (10, 1), (13, 1), (15, 1)],
  term ((-3425 : Rat) / 504) [(1, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((3491796256120 : Rat) / 44404151967) [(1, 2), (10, 1), (14, 1)],
  term ((-969271862750903 : Rat) / 1864974382614) [(1, 2), (10, 1), (15, 2)],
  term ((593 : Rat) / 126) [(1, 2), (10, 1), (15, 2), (16, 1)],
  term ((34814158588603 : Rat) / 78940714608) [(1, 2), (11, 1), (13, 1)],
  term ((-279556226161057949 : Rat) / 313315696279152) [(1, 2), (11, 1), (13, 1), (14, 1)],
  term ((3425 : Rat) / 504) [(1, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((239616 : Rat) / 553) [(1, 2), (11, 1), (13, 1), (15, 2)],
  term ((305 : Rat) / 56) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term ((767247585325751 : Rat) / 1864974382614) [(1, 2), (11, 1), (14, 1), (15, 1)],
  term ((-593 : Rat) / 126) [(1, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((9647328393532813 : Rat) / 17406427571064) [(1, 2), (11, 1), (15, 1)],
  term ((-65 : Rat) / 14) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((59904 : Rat) / 553) [(1, 2), (11, 2)],
  term ((443073850304263 : Rat) / 932487191307) [(1, 2), (11, 2), (14, 1)],
  term ((-42478288242592501 : Rat) / 104438565426384) [(1, 2), (13, 1), (14, 1), (15, 1)],
  term ((9935 : Rat) / 504) [(1, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(1, 2), (13, 1), (14, 2), (15, 1)],
  term ((21402345960848759 : Rat) / 208877130852768) [(1, 2), (13, 1), (15, 1)],
  term ((-6359 : Rat) / 336) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((3366906314273 : Rat) / 14801383989) [(1, 2), (13, 1), (15, 3)],
  term ((-130 : Rat) / 7) [(1, 2), (13, 1), (15, 3), (16, 1)],
  term ((-4157630447657 : Rat) / 88808303934) [(1, 2), (13, 2)],
  term ((2438286298446361 : Rat) / 3197098941624) [(1, 2), (13, 2), (14, 1)],
  term ((-7645 : Rat) / 252) [(1, 2), (13, 2), (14, 1), (16, 1)],
  term ((-2954048478533 : Rat) / 19735178652) [(1, 2), (13, 2), (15, 2)],
  term ((305 : Rat) / 14) [(1, 2), (13, 2), (15, 2), (16, 1)],
  term ((55 : Rat) / 3) [(1, 2), (13, 2), (16, 1)],
  term ((-29166615233519929 : Rat) / 104438565426384) [(1, 2), (14, 1)],
  term ((-247717197671063 : Rat) / 2901071261844) [(1, 2), (14, 1), (15, 2)],
  term ((65 : Rat) / 14) [(1, 2), (14, 1), (15, 2), (16, 1)],
  term ((-10228028852911099 : Rat) / 52219282713192) [(1, 2), (14, 2)],
  term ((-6292612742532443 : Rat) / 7459897530456) [(1, 2), (15, 2)],
  term ((29 : Rat) / 12) [(1, 2), (15, 2), (16, 1)],
  term ((-478374873295483 : Rat) / 2841865725888) [(9, 1), (10, 2), (15, 1)],
  term ((-13 : Rat) / 84) [(9, 1), (10, 2), (15, 1), (16, 1)],
  term ((3366906314273 : Rat) / 29602767978) [(9, 1), (10, 2), (15, 3)],
  term ((-65 : Rat) / 7) [(9, 1), (10, 2), (15, 3), (16, 1)],
  term ((-478374873295483 : Rat) / 2841865725888) [(9, 1), (11, 2), (15, 1)],
  term ((-13 : Rat) / 84) [(9, 1), (11, 2), (15, 1), (16, 1)],
  term ((3366906314273 : Rat) / 29602767978) [(9, 1), (11, 2), (15, 3)],
  term ((-65 : Rat) / 7) [(9, 1), (11, 2), (15, 3), (16, 1)],
  term ((210703568101 : Rat) / 2997748656) [(9, 2), (10, 1), (11, 2)],
  term ((-158570726509 : Rat) / 1332332736) [(9, 2), (10, 2)],
  term ((940563350389 : Rat) / 8993245968) [(9, 2), (10, 2), (14, 1)],
  term ((210703568101 : Rat) / 2997748656) [(9, 2), (10, 2), (15, 2)],
  term ((210703568101 : Rat) / 2997748656) [(9, 2), (10, 3)],
  term ((-158570726509 : Rat) / 1332332736) [(9, 2), (11, 2)],
  term ((940563350389 : Rat) / 8993245968) [(9, 2), (11, 2), (14, 1)],
  term ((210703568101 : Rat) / 2997748656) [(9, 2), (11, 2), (15, 2)],
  term ((-9984 : Rat) / 553) [(10, 1), (11, 2)],
  term ((-3423936574329053 : Rat) / 6394197883248) [(10, 1), (11, 2), (13, 1), (15, 1)],
  term ((3425 : Rat) / 504) [(10, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-3491796256120 : Rat) / 44404151967) [(10, 1), (11, 2), (14, 1)],
  term ((969271862750903 : Rat) / 1864974382614) [(10, 1), (11, 2), (15, 2)],
  term ((-593 : Rat) / 126) [(10, 1), (11, 2), (15, 2), (16, 1)],
  term ((443073850304263 : Rat) / 932487191307) [(10, 1), (11, 3), (15, 1)],
  term ((-34814158588603 : Rat) / 78940714608) [(10, 2), (11, 1), (13, 1)],
  term ((279556226161057949 : Rat) / 313315696279152) [(10, 2), (11, 1), (13, 1), (14, 1)],
  term ((-3425 : Rat) / 504) [(10, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-239616 : Rat) / 553) [(10, 2), (11, 1), (13, 1), (15, 2)],
  term ((-305 : Rat) / 56) [(10, 2), (11, 1), (13, 1), (16, 1)],
  term ((-767247585325751 : Rat) / 1864974382614) [(10, 2), (11, 1), (14, 1), (15, 1)],
  term ((593 : Rat) / 126) [(10, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9647328393532813 : Rat) / 17406427571064) [(10, 2), (11, 1), (15, 1)],
  term ((65 : Rat) / 14) [(10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-59904 : Rat) / 553) [(10, 2), (11, 2)],
  term ((-443073850304263 : Rat) / 932487191307) [(10, 2), (11, 2), (14, 1)],
  term ((42478288242592501 : Rat) / 104438565426384) [(10, 2), (13, 1), (14, 1), (15, 1)],
  term ((-9935 : Rat) / 504) [(10, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(10, 2), (13, 1), (14, 2), (15, 1)],
  term ((-21402345960848759 : Rat) / 208877130852768) [(10, 2), (13, 1), (15, 1)],
  term ((6359 : Rat) / 336) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-3366906314273 : Rat) / 14801383989) [(10, 2), (13, 1), (15, 3)],
  term ((130 : Rat) / 7) [(10, 2), (13, 1), (15, 3), (16, 1)],
  term ((4157630447657 : Rat) / 88808303934) [(10, 2), (13, 2)],
  term ((-2438286298446361 : Rat) / 3197098941624) [(10, 2), (13, 2), (14, 1)],
  term ((7645 : Rat) / 252) [(10, 2), (13, 2), (14, 1), (16, 1)],
  term ((2954048478533 : Rat) / 19735178652) [(10, 2), (13, 2), (15, 2)],
  term ((-305 : Rat) / 14) [(10, 2), (13, 2), (15, 2), (16, 1)],
  term ((-55 : Rat) / 3) [(10, 2), (13, 2), (16, 1)],
  term ((29166615233519929 : Rat) / 104438565426384) [(10, 2), (14, 1)],
  term ((247717197671063 : Rat) / 2901071261844) [(10, 2), (14, 1), (15, 2)],
  term ((-65 : Rat) / 14) [(10, 2), (14, 1), (15, 2), (16, 1)],
  term ((10228028852911099 : Rat) / 52219282713192) [(10, 2), (14, 2)],
  term ((6292612742532443 : Rat) / 7459897530456) [(10, 2), (15, 2)],
  term ((-29 : Rat) / 12) [(10, 2), (15, 2), (16, 1)],
  term ((-9984 : Rat) / 553) [(10, 3)],
  term ((443073850304263 : Rat) / 932487191307) [(10, 3), (11, 1), (15, 1)],
  term ((-3423936574329053 : Rat) / 6394197883248) [(10, 3), (13, 1), (15, 1)],
  term ((3425 : Rat) / 504) [(10, 3), (13, 1), (15, 1), (16, 1)],
  term ((-3491796256120 : Rat) / 44404151967) [(10, 3), (14, 1)],
  term ((969271862750903 : Rat) / 1864974382614) [(10, 3), (15, 2)],
  term ((-593 : Rat) / 126) [(10, 3), (15, 2), (16, 1)],
  term ((42478288242592501 : Rat) / 104438565426384) [(11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-9935 : Rat) / 504) [(11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(11, 2), (13, 1), (14, 2), (15, 1)],
  term ((-21402345960848759 : Rat) / 208877130852768) [(11, 2), (13, 1), (15, 1)],
  term ((6359 : Rat) / 336) [(11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-3366906314273 : Rat) / 14801383989) [(11, 2), (13, 1), (15, 3)],
  term ((130 : Rat) / 7) [(11, 2), (13, 1), (15, 3), (16, 1)],
  term ((4157630447657 : Rat) / 88808303934) [(11, 2), (13, 2)],
  term ((-2438286298446361 : Rat) / 3197098941624) [(11, 2), (13, 2), (14, 1)],
  term ((7645 : Rat) / 252) [(11, 2), (13, 2), (14, 1), (16, 1)],
  term ((2954048478533 : Rat) / 19735178652) [(11, 2), (13, 2), (15, 2)],
  term ((-305 : Rat) / 14) [(11, 2), (13, 2), (15, 2), (16, 1)],
  term ((-55 : Rat) / 3) [(11, 2), (13, 2), (16, 1)],
  term ((29166615233519929 : Rat) / 104438565426384) [(11, 2), (14, 1)],
  term ((247717197671063 : Rat) / 2901071261844) [(11, 2), (14, 1), (15, 2)],
  term ((-65 : Rat) / 14) [(11, 2), (14, 1), (15, 2), (16, 1)],
  term ((10228028852911099 : Rat) / 52219282713192) [(11, 2), (14, 2)],
  term ((6292612742532443 : Rat) / 7459897530456) [(11, 2), (15, 2)],
  term ((-29 : Rat) / 12) [(11, 2), (15, 2), (16, 1)],
  term ((-34814158588603 : Rat) / 78940714608) [(11, 3), (13, 1)],
  term ((279556226161057949 : Rat) / 313315696279152) [(11, 3), (13, 1), (14, 1)],
  term ((-3425 : Rat) / 504) [(11, 3), (13, 1), (14, 1), (16, 1)],
  term ((-239616 : Rat) / 553) [(11, 3), (13, 1), (15, 2)],
  term ((-305 : Rat) / 56) [(11, 3), (13, 1), (16, 1)],
  term ((-767247585325751 : Rat) / 1864974382614) [(11, 3), (14, 1), (15, 1)],
  term ((593 : Rat) / 126) [(11, 3), (14, 1), (15, 1), (16, 1)],
  term ((-9647328393532813 : Rat) / 17406427571064) [(11, 3), (15, 1)],
  term ((65 : Rat) / 14) [(11, 3), (15, 1), (16, 1)],
  term ((-59904 : Rat) / 553) [(11, 4)],
  term ((-443073850304263 : Rat) / 932487191307) [(11, 4), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 2, terms 200 through 244. -/
theorem rs_R009_ueqv_R009YNNNN_block_02_0200_0244_valid :
    checkProductSumEq rs_R009_ueqv_R009YNNNN_partials_02_0200_0244
      rs_R009_ueqv_R009YNNNN_block_02_0200_0244 = true := by
  native_decide

end R009UeqvR009YNNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
