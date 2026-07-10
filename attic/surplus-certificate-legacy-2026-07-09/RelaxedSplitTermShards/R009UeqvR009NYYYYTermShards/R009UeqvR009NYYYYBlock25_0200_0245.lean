/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NYYYY, term block 25:200-245

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NYYYYTermShards

/-- Generator polynomial 25 for relaxed split surplus certificate `R009:u=v:R009NYYYY`. -/
def rs_R009_ueqv_R009NYYYY_generator_25_0200_0245 : Poly :=
[
  term (1 : Rat) [],
  term (2 : Rat) [(2, 1), (12, 1)],
  term (-1 : Rat) [(2, 2)],
  term (2 : Rat) [(3, 1), (13, 1)],
  term (-1 : Rat) [(3, 2)],
  term (-2 : Rat) [(12, 1)]
]

/-- Coefficient term 200 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0200 : Poly :=
[
  term ((-2775456 : Rat) / 32699) [(11, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 200 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0200 : Poly :=
[
  term ((-5550912 : Rat) / 32699) [(2, 1), (11, 1), (12, 2), (15, 3), (16, 1)],
  term ((2775456 : Rat) / 32699) [(2, 2), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-5550912 : Rat) / 32699) [(3, 1), (11, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((2775456 : Rat) / 32699) [(3, 2), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-2775456 : Rat) / 32699) [(11, 1), (12, 1), (15, 3), (16, 1)],
  term ((5550912 : Rat) / 32699) [(11, 1), (12, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0200_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0200
        rs_R009_ueqv_R009NYYYY_generator_25_0200_0245 =
      rs_R009_ueqv_R009NYYYY_partial_25_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0201 : Poly :=
[
  term ((4457196174 : Rat) / 1746815) [(11, 1), (13, 1), (15, 2)]
]

/-- Partial product 201 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0201 : Poly :=
[
  term ((8914392348 : Rat) / 1746815) [(2, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-4457196174 : Rat) / 1746815) [(2, 2), (11, 1), (13, 1), (15, 2)],
  term ((8914392348 : Rat) / 1746815) [(3, 1), (11, 1), (13, 2), (15, 2)],
  term ((-4457196174 : Rat) / 1746815) [(3, 2), (11, 1), (13, 1), (15, 2)],
  term ((-8914392348 : Rat) / 1746815) [(11, 1), (12, 1), (13, 1), (15, 2)],
  term ((4457196174 : Rat) / 1746815) [(11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0201_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0201
        rs_R009_ueqv_R009NYYYY_generator_25_0200_0245 =
      rs_R009_ueqv_R009NYYYY_partial_25_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0202 : Poly :=
[
  term ((-853932 : Rat) / 1721) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 202 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0202 : Poly :=
[
  term ((-1707864 : Rat) / 1721) [(2, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((853932 : Rat) / 1721) [(2, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1707864 : Rat) / 1721) [(3, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((853932 : Rat) / 1721) [(3, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((1707864 : Rat) / 1721) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-853932 : Rat) / 1721) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0202_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0202
        rs_R009_ueqv_R009NYYYY_generator_25_0200_0245 =
      rs_R009_ueqv_R009NYYYY_partial_25_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0203 : Poly :=
[
  term ((10658103500 : Rat) / 6637897) [(11, 1), (13, 1), (15, 4)]
]

/-- Partial product 203 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0203 : Poly :=
[
  term ((21316207000 : Rat) / 6637897) [(2, 1), (11, 1), (12, 1), (13, 1), (15, 4)],
  term ((-10658103500 : Rat) / 6637897) [(2, 2), (11, 1), (13, 1), (15, 4)],
  term ((21316207000 : Rat) / 6637897) [(3, 1), (11, 1), (13, 2), (15, 4)],
  term ((-10658103500 : Rat) / 6637897) [(3, 2), (11, 1), (13, 1), (15, 4)],
  term ((-21316207000 : Rat) / 6637897) [(11, 1), (12, 1), (13, 1), (15, 4)],
  term ((10658103500 : Rat) / 6637897) [(11, 1), (13, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0203_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0203
        rs_R009_ueqv_R009NYYYY_generator_25_0200_0245 =
      rs_R009_ueqv_R009NYYYY_partial_25_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0204 : Poly :=
[
  term ((-10120000 : Rat) / 32699) [(11, 1), (13, 1), (15, 4), (16, 1)]
]

/-- Partial product 204 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0204 : Poly :=
[
  term ((-20240000 : Rat) / 32699) [(2, 1), (11, 1), (12, 1), (13, 1), (15, 4), (16, 1)],
  term ((10120000 : Rat) / 32699) [(2, 2), (11, 1), (13, 1), (15, 4), (16, 1)],
  term ((-20240000 : Rat) / 32699) [(3, 1), (11, 1), (13, 2), (15, 4), (16, 1)],
  term ((10120000 : Rat) / 32699) [(3, 2), (11, 1), (13, 1), (15, 4), (16, 1)],
  term ((20240000 : Rat) / 32699) [(11, 1), (12, 1), (13, 1), (15, 4), (16, 1)],
  term ((-10120000 : Rat) / 32699) [(11, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0204_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0204
        rs_R009_ueqv_R009NYYYY_generator_25_0200_0245 =
      rs_R009_ueqv_R009NYYYY_partial_25_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0205 : Poly :=
[
  term ((-5813511000 : Rat) / 6637897) [(11, 1), (13, 2), (15, 3)]
]

/-- Partial product 205 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0205 : Poly :=
[
  term ((-11627022000 : Rat) / 6637897) [(2, 1), (11, 1), (12, 1), (13, 2), (15, 3)],
  term ((5813511000 : Rat) / 6637897) [(2, 2), (11, 1), (13, 2), (15, 3)],
  term ((-11627022000 : Rat) / 6637897) [(3, 1), (11, 1), (13, 3), (15, 3)],
  term ((5813511000 : Rat) / 6637897) [(3, 2), (11, 1), (13, 2), (15, 3)],
  term ((11627022000 : Rat) / 6637897) [(11, 1), (12, 1), (13, 2), (15, 3)],
  term ((-5813511000 : Rat) / 6637897) [(11, 1), (13, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0205_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0205
        rs_R009_ueqv_R009NYYYY_generator_25_0200_0245 =
      rs_R009_ueqv_R009NYYYY_partial_25_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0206 : Poly :=
[
  term ((5520000 : Rat) / 32699) [(11, 1), (13, 2), (15, 3), (16, 1)]
]

/-- Partial product 206 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0206 : Poly :=
[
  term ((11040000 : Rat) / 32699) [(2, 1), (11, 1), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((-5520000 : Rat) / 32699) [(2, 2), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((11040000 : Rat) / 32699) [(3, 1), (11, 1), (13, 3), (15, 3), (16, 1)],
  term ((-5520000 : Rat) / 32699) [(3, 2), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((-11040000 : Rat) / 32699) [(11, 1), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((5520000 : Rat) / 32699) [(11, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0206_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0206
        rs_R009_ueqv_R009NYYYY_generator_25_0200_0245 =
      rs_R009_ueqv_R009NYYYY_partial_25_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0207 : Poly :=
[
  term ((12592246549 : Rat) / 56896260) [(11, 1), (15, 1)]
]

/-- Partial product 207 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0207 : Poly :=
[
  term ((12592246549 : Rat) / 28448130) [(2, 1), (11, 1), (12, 1), (15, 1)],
  term ((-12592246549 : Rat) / 56896260) [(2, 2), (11, 1), (15, 1)],
  term ((12592246549 : Rat) / 28448130) [(3, 1), (11, 1), (13, 1), (15, 1)],
  term ((-12592246549 : Rat) / 56896260) [(3, 2), (11, 1), (15, 1)],
  term ((-12592246549 : Rat) / 28448130) [(11, 1), (12, 1), (15, 1)],
  term ((12592246549 : Rat) / 56896260) [(11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0207_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0207
        rs_R009_ueqv_R009NYYYY_generator_25_0200_0245 =
      rs_R009_ueqv_R009NYYYY_partial_25_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0208 : Poly :=
[
  term ((-4245724 : Rat) / 98097) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 208 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0208 : Poly :=
[
  term ((-8491448 : Rat) / 98097) [(2, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((4245724 : Rat) / 98097) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((-8491448 : Rat) / 98097) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((4245724 : Rat) / 98097) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((8491448 : Rat) / 98097) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4245724 : Rat) / 98097) [(11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0208_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0208
        rs_R009_ueqv_R009NYYYY_generator_25_0200_0245 =
      rs_R009_ueqv_R009NYYYY_partial_25_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0209 : Poly :=
[
  term ((-26305804017 : Rat) / 33189485) [(11, 1), (15, 3)]
]

/-- Partial product 209 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0209 : Poly :=
[
  term ((-52611608034 : Rat) / 33189485) [(2, 1), (11, 1), (12, 1), (15, 3)],
  term ((26305804017 : Rat) / 33189485) [(2, 2), (11, 1), (15, 3)],
  term ((-52611608034 : Rat) / 33189485) [(3, 1), (11, 1), (13, 1), (15, 3)],
  term ((26305804017 : Rat) / 33189485) [(3, 2), (11, 1), (15, 3)],
  term ((52611608034 : Rat) / 33189485) [(11, 1), (12, 1), (15, 3)],
  term ((-26305804017 : Rat) / 33189485) [(11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0209_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0209
        rs_R009_ueqv_R009NYYYY_generator_25_0200_0245 =
      rs_R009_ueqv_R009NYYYY_partial_25_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0210 : Poly :=
[
  term ((4983798 : Rat) / 32699) [(11, 1), (15, 3), (16, 1)]
]

/-- Partial product 210 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0210 : Poly :=
[
  term ((9967596 : Rat) / 32699) [(2, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-4983798 : Rat) / 32699) [(2, 2), (11, 1), (15, 3), (16, 1)],
  term ((9967596 : Rat) / 32699) [(3, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-4983798 : Rat) / 32699) [(3, 2), (11, 1), (15, 3), (16, 1)],
  term ((-9967596 : Rat) / 32699) [(11, 1), (12, 1), (15, 3), (16, 1)],
  term ((4983798 : Rat) / 32699) [(11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0210_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0210
        rs_R009_ueqv_R009NYYYY_generator_25_0200_0245 =
      rs_R009_ueqv_R009NYYYY_partial_25_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0211 : Poly :=
[
  term ((-6883197024 : Rat) / 33189485) [(11, 2), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 211 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0211 : Poly :=
[
  term ((-13766394048 : Rat) / 33189485) [(2, 1), (11, 2), (12, 2), (13, 1), (15, 1)],
  term ((6883197024 : Rat) / 33189485) [(2, 2), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-13766394048 : Rat) / 33189485) [(3, 1), (11, 2), (12, 1), (13, 2), (15, 1)],
  term ((6883197024 : Rat) / 33189485) [(3, 2), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-6883197024 : Rat) / 33189485) [(11, 2), (12, 1), (13, 1), (15, 1)],
  term ((13766394048 : Rat) / 33189485) [(11, 2), (12, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0211_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0211
        rs_R009_ueqv_R009NYYYY_generator_25_0200_0245 =
      rs_R009_ueqv_R009NYYYY_partial_25_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0212 : Poly :=
[
  term ((1307136 : Rat) / 32699) [(11, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 212 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0212 : Poly :=
[
  term ((2614272 : Rat) / 32699) [(2, 1), (11, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1307136 : Rat) / 32699) [(2, 2), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((2614272 : Rat) / 32699) [(3, 1), (11, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1307136 : Rat) / 32699) [(3, 2), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1307136 : Rat) / 32699) [(11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2614272 : Rat) / 32699) [(11, 2), (12, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0212_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0212
        rs_R009_ueqv_R009NYYYY_generator_25_0200_0245 =
      rs_R009_ueqv_R009NYYYY_partial_25_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0213 : Poly :=
[
  term ((93016176 : Rat) / 1144465) [(11, 2), (12, 1), (15, 2)]
]

/-- Partial product 213 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0213 : Poly :=
[
  term ((186032352 : Rat) / 1144465) [(2, 1), (11, 2), (12, 2), (15, 2)],
  term ((-93016176 : Rat) / 1144465) [(2, 2), (11, 2), (12, 1), (15, 2)],
  term ((186032352 : Rat) / 1144465) [(3, 1), (11, 2), (12, 1), (13, 1), (15, 2)],
  term ((-93016176 : Rat) / 1144465) [(3, 2), (11, 2), (12, 1), (15, 2)],
  term ((93016176 : Rat) / 1144465) [(11, 2), (12, 1), (15, 2)],
  term ((-186032352 : Rat) / 1144465) [(11, 2), (12, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0213_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0213
        rs_R009_ueqv_R009NYYYY_generator_25_0200_0245 =
      rs_R009_ueqv_R009NYYYY_partial_25_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0214 : Poly :=
[
  term ((-512256 : Rat) / 32699) [(11, 2), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 214 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0214 : Poly :=
[
  term ((-1024512 : Rat) / 32699) [(2, 1), (11, 2), (12, 2), (15, 2), (16, 1)],
  term ((512256 : Rat) / 32699) [(2, 2), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((-1024512 : Rat) / 32699) [(3, 1), (11, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((512256 : Rat) / 32699) [(3, 2), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((-512256 : Rat) / 32699) [(11, 2), (12, 1), (15, 2), (16, 1)],
  term ((1024512 : Rat) / 32699) [(11, 2), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0214_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0214
        rs_R009_ueqv_R009NYYYY_generator_25_0200_0245 =
      rs_R009_ueqv_R009NYYYY_partial_25_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0215 : Poly :=
[
  term ((1224712984 : Rat) / 6637897) [(11, 2), (13, 1), (15, 1)]
]

/-- Partial product 215 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0215 : Poly :=
[
  term ((2449425968 : Rat) / 6637897) [(2, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-1224712984 : Rat) / 6637897) [(2, 2), (11, 2), (13, 1), (15, 1)],
  term ((2449425968 : Rat) / 6637897) [(3, 1), (11, 2), (13, 2), (15, 1)],
  term ((-1224712984 : Rat) / 6637897) [(3, 2), (11, 2), (13, 1), (15, 1)],
  term ((-2449425968 : Rat) / 6637897) [(11, 2), (12, 1), (13, 1), (15, 1)],
  term ((1224712984 : Rat) / 6637897) [(11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0215_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0215
        rs_R009_ueqv_R009NYYYY_generator_25_0200_0245 =
      rs_R009_ueqv_R009NYYYY_partial_25_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0216 : Poly :=
[
  term ((-1162880 : Rat) / 32699) [(11, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 216 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0216 : Poly :=
[
  term ((-2325760 : Rat) / 32699) [(2, 1), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1162880 : Rat) / 32699) [(2, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2325760 : Rat) / 32699) [(3, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((1162880 : Rat) / 32699) [(3, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((2325760 : Rat) / 32699) [(11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1162880 : Rat) / 32699) [(11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0216_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0216
        rs_R009_ueqv_R009NYYYY_generator_25_0200_0245 =
      rs_R009_ueqv_R009NYYYY_partial_25_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0217 : Poly :=
[
  term ((-46260044864 : Rat) / 33189485) [(11, 2), (13, 1), (15, 3)]
]

/-- Partial product 217 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0217 : Poly :=
[
  term ((-92520089728 : Rat) / 33189485) [(2, 1), (11, 2), (12, 1), (13, 1), (15, 3)],
  term ((46260044864 : Rat) / 33189485) [(2, 2), (11, 2), (13, 1), (15, 3)],
  term ((-92520089728 : Rat) / 33189485) [(3, 1), (11, 2), (13, 2), (15, 3)],
  term ((46260044864 : Rat) / 33189485) [(3, 2), (11, 2), (13, 1), (15, 3)],
  term ((92520089728 : Rat) / 33189485) [(11, 2), (12, 1), (13, 1), (15, 3)],
  term ((-46260044864 : Rat) / 33189485) [(11, 2), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0217_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0217
        rs_R009_ueqv_R009NYYYY_generator_25_0200_0245 =
      rs_R009_ueqv_R009NYYYY_partial_25_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0218 : Poly :=
[
  term ((8784896 : Rat) / 32699) [(11, 2), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 218 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0218 : Poly :=
[
  term ((17569792 : Rat) / 32699) [(2, 1), (11, 2), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-8784896 : Rat) / 32699) [(2, 2), (11, 2), (13, 1), (15, 3), (16, 1)],
  term ((17569792 : Rat) / 32699) [(3, 1), (11, 2), (13, 2), (15, 3), (16, 1)],
  term ((-8784896 : Rat) / 32699) [(3, 2), (11, 2), (13, 1), (15, 3), (16, 1)],
  term ((-17569792 : Rat) / 32699) [(11, 2), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((8784896 : Rat) / 32699) [(11, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0218_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0218
        rs_R009_ueqv_R009NYYYY_generator_25_0200_0245 =
      rs_R009_ueqv_R009NYYYY_partial_25_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0219 : Poly :=
[
  term ((13766394048 : Rat) / 33189485) [(11, 2), (13, 2), (15, 2)]
]

/-- Partial product 219 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0219 : Poly :=
[
  term ((27532788096 : Rat) / 33189485) [(2, 1), (11, 2), (12, 1), (13, 2), (15, 2)],
  term ((-13766394048 : Rat) / 33189485) [(2, 2), (11, 2), (13, 2), (15, 2)],
  term ((27532788096 : Rat) / 33189485) [(3, 1), (11, 2), (13, 3), (15, 2)],
  term ((-13766394048 : Rat) / 33189485) [(3, 2), (11, 2), (13, 2), (15, 2)],
  term ((-27532788096 : Rat) / 33189485) [(11, 2), (12, 1), (13, 2), (15, 2)],
  term ((13766394048 : Rat) / 33189485) [(11, 2), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0219_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0219
        rs_R009_ueqv_R009NYYYY_generator_25_0200_0245 =
      rs_R009_ueqv_R009NYYYY_partial_25_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0220 : Poly :=
[
  term ((-2614272 : Rat) / 32699) [(11, 2), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 220 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0220 : Poly :=
[
  term ((-5228544 : Rat) / 32699) [(2, 1), (11, 2), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((2614272 : Rat) / 32699) [(2, 2), (11, 2), (13, 2), (15, 2), (16, 1)],
  term ((-5228544 : Rat) / 32699) [(3, 1), (11, 2), (13, 3), (15, 2), (16, 1)],
  term ((2614272 : Rat) / 32699) [(3, 2), (11, 2), (13, 2), (15, 2), (16, 1)],
  term ((5228544 : Rat) / 32699) [(11, 2), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-2614272 : Rat) / 32699) [(11, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0220_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0220
        rs_R009_ueqv_R009NYYYY_generator_25_0200_0245 =
      rs_R009_ueqv_R009NYYYY_partial_25_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0221 : Poly :=
[
  term ((-13665626524 : Rat) / 33189485) [(11, 2), (15, 2)]
]

/-- Partial product 221 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0221 : Poly :=
[
  term ((-27331253048 : Rat) / 33189485) [(2, 1), (11, 2), (12, 1), (15, 2)],
  term ((13665626524 : Rat) / 33189485) [(2, 2), (11, 2), (15, 2)],
  term ((-27331253048 : Rat) / 33189485) [(3, 1), (11, 2), (13, 1), (15, 2)],
  term ((13665626524 : Rat) / 33189485) [(3, 2), (11, 2), (15, 2)],
  term ((27331253048 : Rat) / 33189485) [(11, 2), (12, 1), (15, 2)],
  term ((-13665626524 : Rat) / 33189485) [(11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0221_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0221
        rs_R009_ueqv_R009NYYYY_generator_25_0200_0245 =
      rs_R009_ueqv_R009NYYYY_partial_25_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0222 : Poly :=
[
  term ((2595136 : Rat) / 32699) [(11, 2), (15, 2), (16, 1)]
]

/-- Partial product 222 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0222 : Poly :=
[
  term ((5190272 : Rat) / 32699) [(2, 1), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((-2595136 : Rat) / 32699) [(2, 2), (11, 2), (15, 2), (16, 1)],
  term ((5190272 : Rat) / 32699) [(3, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-2595136 : Rat) / 32699) [(3, 2), (11, 2), (15, 2), (16, 1)],
  term ((-5190272 : Rat) / 32699) [(11, 2), (12, 1), (15, 2), (16, 1)],
  term ((2595136 : Rat) / 32699) [(11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0222_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0222
        rs_R009_ueqv_R009NYYYY_generator_25_0200_0245 =
      rs_R009_ueqv_R009NYYYY_partial_25_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0223 : Poly :=
[
  term ((37609540496 : Rat) / 33189485) [(11, 2), (15, 4)]
]

/-- Partial product 223 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0223 : Poly :=
[
  term ((75219080992 : Rat) / 33189485) [(2, 1), (11, 2), (12, 1), (15, 4)],
  term ((-37609540496 : Rat) / 33189485) [(2, 2), (11, 2), (15, 4)],
  term ((75219080992 : Rat) / 33189485) [(3, 1), (11, 2), (13, 1), (15, 4)],
  term ((-37609540496 : Rat) / 33189485) [(3, 2), (11, 2), (15, 4)],
  term ((-75219080992 : Rat) / 33189485) [(11, 2), (12, 1), (15, 4)],
  term ((37609540496 : Rat) / 33189485) [(11, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0223_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0223
        rs_R009_ueqv_R009NYYYY_generator_25_0200_0245 =
      rs_R009_ueqv_R009NYYYY_partial_25_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0224 : Poly :=
[
  term ((-7142144 : Rat) / 32699) [(11, 2), (15, 4), (16, 1)]
]

/-- Partial product 224 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0224 : Poly :=
[
  term ((-14284288 : Rat) / 32699) [(2, 1), (11, 2), (12, 1), (15, 4), (16, 1)],
  term ((7142144 : Rat) / 32699) [(2, 2), (11, 2), (15, 4), (16, 1)],
  term ((-14284288 : Rat) / 32699) [(3, 1), (11, 2), (13, 1), (15, 4), (16, 1)],
  term ((7142144 : Rat) / 32699) [(3, 2), (11, 2), (15, 4), (16, 1)],
  term ((14284288 : Rat) / 32699) [(11, 2), (12, 1), (15, 4), (16, 1)],
  term ((-7142144 : Rat) / 32699) [(11, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0224_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0224
        rs_R009_ueqv_R009NYYYY_generator_25_0200_0245 =
      rs_R009_ueqv_R009NYYYY_partial_25_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0225 : Poly :=
[
  term ((1488258816 : Rat) / 33189485) [(11, 3), (13, 1), (15, 2)]
]

/-- Partial product 225 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0225 : Poly :=
[
  term ((2976517632 : Rat) / 33189485) [(2, 1), (11, 3), (12, 1), (13, 1), (15, 2)],
  term ((-1488258816 : Rat) / 33189485) [(2, 2), (11, 3), (13, 1), (15, 2)],
  term ((2976517632 : Rat) / 33189485) [(3, 1), (11, 3), (13, 2), (15, 2)],
  term ((-1488258816 : Rat) / 33189485) [(3, 2), (11, 3), (13, 1), (15, 2)],
  term ((-2976517632 : Rat) / 33189485) [(11, 3), (12, 1), (13, 1), (15, 2)],
  term ((1488258816 : Rat) / 33189485) [(11, 3), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0225_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0225
        rs_R009_ueqv_R009NYYYY_generator_25_0200_0245 =
      rs_R009_ueqv_R009NYYYY_partial_25_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0226 : Poly :=
[
  term ((-282624 : Rat) / 32699) [(11, 3), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 226 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0226 : Poly :=
[
  term ((-565248 : Rat) / 32699) [(2, 1), (11, 3), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((282624 : Rat) / 32699) [(2, 2), (11, 3), (13, 1), (15, 2), (16, 1)],
  term ((-565248 : Rat) / 32699) [(3, 1), (11, 3), (13, 2), (15, 2), (16, 1)],
  term ((282624 : Rat) / 32699) [(3, 2), (11, 3), (13, 1), (15, 2), (16, 1)],
  term ((565248 : Rat) / 32699) [(11, 3), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-282624 : Rat) / 32699) [(11, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0226_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0226
        rs_R009_ueqv_R009NYYYY_generator_25_0200_0245 =
      rs_R009_ueqv_R009NYYYY_partial_25_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0227 : Poly :=
[
  term ((-31005392 : Rat) / 33189485) [(11, 3), (15, 1)]
]

/-- Partial product 227 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0227 : Poly :=
[
  term ((-62010784 : Rat) / 33189485) [(2, 1), (11, 3), (12, 1), (15, 1)],
  term ((31005392 : Rat) / 33189485) [(2, 2), (11, 3), (15, 1)],
  term ((-62010784 : Rat) / 33189485) [(3, 1), (11, 3), (13, 1), (15, 1)],
  term ((31005392 : Rat) / 33189485) [(3, 2), (11, 3), (15, 1)],
  term ((62010784 : Rat) / 33189485) [(11, 3), (12, 1), (15, 1)],
  term ((-31005392 : Rat) / 33189485) [(11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0227_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0227
        rs_R009_ueqv_R009NYYYY_generator_25_0200_0245 =
      rs_R009_ueqv_R009NYYYY_partial_25_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0228 : Poly :=
[
  term ((5888 : Rat) / 32699) [(11, 3), (15, 1), (16, 1)]
]

/-- Partial product 228 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0228 : Poly :=
[
  term ((11776 : Rat) / 32699) [(2, 1), (11, 3), (12, 1), (15, 1), (16, 1)],
  term ((-5888 : Rat) / 32699) [(2, 2), (11, 3), (15, 1), (16, 1)],
  term ((11776 : Rat) / 32699) [(3, 1), (11, 3), (13, 1), (15, 1), (16, 1)],
  term ((-5888 : Rat) / 32699) [(3, 2), (11, 3), (15, 1), (16, 1)],
  term ((-11776 : Rat) / 32699) [(11, 3), (12, 1), (15, 1), (16, 1)],
  term ((5888 : Rat) / 32699) [(11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0228_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0228
        rs_R009_ueqv_R009NYYYY_generator_25_0200_0245 =
      rs_R009_ueqv_R009NYYYY_partial_25_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0229 : Poly :=
[
  term ((-372064704 : Rat) / 33189485) [(11, 3), (15, 3)]
]

/-- Partial product 229 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0229 : Poly :=
[
  term ((-744129408 : Rat) / 33189485) [(2, 1), (11, 3), (12, 1), (15, 3)],
  term ((372064704 : Rat) / 33189485) [(2, 2), (11, 3), (15, 3)],
  term ((-744129408 : Rat) / 33189485) [(3, 1), (11, 3), (13, 1), (15, 3)],
  term ((372064704 : Rat) / 33189485) [(3, 2), (11, 3), (15, 3)],
  term ((744129408 : Rat) / 33189485) [(11, 3), (12, 1), (15, 3)],
  term ((-372064704 : Rat) / 33189485) [(11, 3), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0229_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0229
        rs_R009_ueqv_R009NYYYY_generator_25_0200_0245 =
      rs_R009_ueqv_R009NYYYY_partial_25_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0230 : Poly :=
[
  term ((70656 : Rat) / 32699) [(11, 3), (15, 3), (16, 1)]
]

/-- Partial product 230 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0230 : Poly :=
[
  term ((141312 : Rat) / 32699) [(2, 1), (11, 3), (12, 1), (15, 3), (16, 1)],
  term ((-70656 : Rat) / 32699) [(2, 2), (11, 3), (15, 3), (16, 1)],
  term ((141312 : Rat) / 32699) [(3, 1), (11, 3), (13, 1), (15, 3), (16, 1)],
  term ((-70656 : Rat) / 32699) [(3, 2), (11, 3), (15, 3), (16, 1)],
  term ((-141312 : Rat) / 32699) [(11, 3), (12, 1), (15, 3), (16, 1)],
  term ((70656 : Rat) / 32699) [(11, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0230_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0230
        rs_R009_ueqv_R009NYYYY_generator_25_0200_0245 =
      rs_R009_ueqv_R009NYYYY_partial_25_0230 := by
  native_decide

/-- Coefficient term 231 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0231 : Poly :=
[
  term ((-13 : Rat) / 5) [(12, 1)]
]

/-- Partial product 231 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0231 : Poly :=
[
  term ((-26 : Rat) / 5) [(2, 1), (12, 2)],
  term ((13 : Rat) / 5) [(2, 2), (12, 1)],
  term ((-26 : Rat) / 5) [(3, 1), (12, 1), (13, 1)],
  term ((13 : Rat) / 5) [(3, 2), (12, 1)],
  term ((-13 : Rat) / 5) [(12, 1)],
  term ((26 : Rat) / 5) [(12, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 231 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0231_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0231
        rs_R009_ueqv_R009NYYYY_generator_25_0200_0245 =
      rs_R009_ueqv_R009NYYYY_partial_25_0231 := by
  native_decide

/-- Coefficient term 232 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0232 : Poly :=
[
  term ((-365213948391 : Rat) / 265515880) [(12, 1), (13, 1), (15, 1)]
]

/-- Partial product 232 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0232 : Poly :=
[
  term ((-365213948391 : Rat) / 132757940) [(2, 1), (12, 2), (13, 1), (15, 1)],
  term ((365213948391 : Rat) / 265515880) [(2, 2), (12, 1), (13, 1), (15, 1)],
  term ((-365213948391 : Rat) / 132757940) [(3, 1), (12, 1), (13, 2), (15, 1)],
  term ((365213948391 : Rat) / 265515880) [(3, 2), (12, 1), (13, 1), (15, 1)],
  term ((-365213948391 : Rat) / 265515880) [(12, 1), (13, 1), (15, 1)],
  term ((365213948391 : Rat) / 132757940) [(12, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 232 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0232_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0232
        rs_R009_ueqv_R009NYYYY_generator_25_0200_0245 =
      rs_R009_ueqv_R009NYYYY_partial_25_0232 := by
  native_decide

/-- Coefficient term 233 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0233 : Poly :=
[
  term ((8620783 : Rat) / 32699) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 233 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0233 : Poly :=
[
  term ((17241566 : Rat) / 32699) [(2, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-8620783 : Rat) / 32699) [(2, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((17241566 : Rat) / 32699) [(3, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-8620783 : Rat) / 32699) [(3, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((8620783 : Rat) / 32699) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-17241566 : Rat) / 32699) [(12, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 233 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0233_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0233
        rs_R009_ueqv_R009NYYYY_generator_25_0200_0245 =
      rs_R009_ueqv_R009NYYYY_partial_25_0233 := by
  native_decide

/-- Coefficient term 234 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0234 : Poly :=
[
  term ((25904848343 : Rat) / 27949040) [(12, 1), (15, 2)]
]

/-- Partial product 234 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0234 : Poly :=
[
  term ((25904848343 : Rat) / 13974520) [(2, 1), (12, 2), (15, 2)],
  term ((-25904848343 : Rat) / 27949040) [(2, 2), (12, 1), (15, 2)],
  term ((25904848343 : Rat) / 13974520) [(3, 1), (12, 1), (13, 1), (15, 2)],
  term ((-25904848343 : Rat) / 27949040) [(3, 2), (12, 1), (15, 2)],
  term ((25904848343 : Rat) / 27949040) [(12, 1), (15, 2)],
  term ((-25904848343 : Rat) / 13974520) [(12, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 234 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0234_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0234
        rs_R009_ueqv_R009NYYYY_generator_25_0200_0245 =
      rs_R009_ueqv_R009NYYYY_partial_25_0234 := by
  native_decide

/-- Coefficient term 235 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0235 : Poly :=
[
  term ((-619643 : Rat) / 3442) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 235 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0235 : Poly :=
[
  term ((-619643 : Rat) / 1721) [(2, 1), (12, 2), (15, 2), (16, 1)],
  term ((619643 : Rat) / 3442) [(2, 2), (12, 1), (15, 2), (16, 1)],
  term ((-619643 : Rat) / 1721) [(3, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((619643 : Rat) / 3442) [(3, 2), (12, 1), (15, 2), (16, 1)],
  term ((-619643 : Rat) / 3442) [(12, 1), (15, 2), (16, 1)],
  term ((619643 : Rat) / 1721) [(12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 235 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0235_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0235
        rs_R009_ueqv_R009NYYYY_generator_25_0200_0245 =
      rs_R009_ueqv_R009NYYYY_partial_25_0235 := by
  native_decide

/-- Coefficient term 236 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0236 : Poly :=
[
  term ((315774793765 : Rat) / 318619056) [(13, 1), (15, 1)]
]

/-- Partial product 236 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0236 : Poly :=
[
  term ((315774793765 : Rat) / 159309528) [(2, 1), (12, 1), (13, 1), (15, 1)],
  term ((-315774793765 : Rat) / 318619056) [(2, 2), (13, 1), (15, 1)],
  term ((315774793765 : Rat) / 159309528) [(3, 1), (13, 2), (15, 1)],
  term ((-315774793765 : Rat) / 318619056) [(3, 2), (13, 1), (15, 1)],
  term ((-315774793765 : Rat) / 159309528) [(12, 1), (13, 1), (15, 1)],
  term ((315774793765 : Rat) / 318619056) [(13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 236 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0236_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0236
        rs_R009_ueqv_R009NYYYY_generator_25_0200_0245 =
      rs_R009_ueqv_R009NYYYY_partial_25_0236 := by
  native_decide

/-- Coefficient term 237 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0237 : Poly :=
[
  term ((-37432321 : Rat) / 196194) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 237 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0237 : Poly :=
[
  term ((-37432321 : Rat) / 98097) [(2, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((37432321 : Rat) / 196194) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((-37432321 : Rat) / 98097) [(3, 1), (13, 2), (15, 1), (16, 1)],
  term ((37432321 : Rat) / 196194) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((37432321 : Rat) / 98097) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-37432321 : Rat) / 196194) [(13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 237 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0237_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0237
        rs_R009_ueqv_R009NYYYY_generator_25_0200_0245 =
      rs_R009_ueqv_R009NYYYY_partial_25_0237 := by
  native_decide

/-- Coefficient term 238 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0238 : Poly :=
[
  term ((-603340254457 : Rat) / 113792520) [(13, 1), (15, 3)]
]

/-- Partial product 238 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0238 : Poly :=
[
  term ((-603340254457 : Rat) / 56896260) [(2, 1), (12, 1), (13, 1), (15, 3)],
  term ((603340254457 : Rat) / 113792520) [(2, 2), (13, 1), (15, 3)],
  term ((-603340254457 : Rat) / 56896260) [(3, 1), (13, 2), (15, 3)],
  term ((603340254457 : Rat) / 113792520) [(3, 2), (13, 1), (15, 3)],
  term ((603340254457 : Rat) / 56896260) [(12, 1), (13, 1), (15, 3)],
  term ((-603340254457 : Rat) / 113792520) [(13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 238 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0238_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0238
        rs_R009_ueqv_R009NYYYY_generator_25_0200_0245 =
      rs_R009_ueqv_R009NYYYY_partial_25_0238 := by
  native_decide

/-- Coefficient term 239 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0239 : Poly :=
[
  term ((100557311 : Rat) / 98097) [(13, 1), (15, 3), (16, 1)]
]

/-- Partial product 239 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0239 : Poly :=
[
  term ((201114622 : Rat) / 98097) [(2, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-100557311 : Rat) / 98097) [(2, 2), (13, 1), (15, 3), (16, 1)],
  term ((201114622 : Rat) / 98097) [(3, 1), (13, 2), (15, 3), (16, 1)],
  term ((-100557311 : Rat) / 98097) [(3, 2), (13, 1), (15, 3), (16, 1)],
  term ((-201114622 : Rat) / 98097) [(12, 1), (13, 1), (15, 3), (16, 1)],
  term ((100557311 : Rat) / 98097) [(13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 239 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0239_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0239
        rs_R009_ueqv_R009NYYYY_generator_25_0200_0245 =
      rs_R009_ueqv_R009NYYYY_partial_25_0239 := by
  native_decide

/-- Coefficient term 240 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0240 : Poly :=
[
  term ((468254984987 : Rat) / 132757940) [(13, 2), (15, 2)]
]

/-- Partial product 240 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0240 : Poly :=
[
  term ((468254984987 : Rat) / 66378970) [(2, 1), (12, 1), (13, 2), (15, 2)],
  term ((-468254984987 : Rat) / 132757940) [(2, 2), (13, 2), (15, 2)],
  term ((468254984987 : Rat) / 66378970) [(3, 1), (13, 3), (15, 2)],
  term ((-468254984987 : Rat) / 132757940) [(3, 2), (13, 2), (15, 2)],
  term ((-468254984987 : Rat) / 66378970) [(12, 1), (13, 2), (15, 2)],
  term ((468254984987 : Rat) / 132757940) [(13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 240 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0240_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0240
        rs_R009_ueqv_R009NYYYY_generator_25_0200_0245 =
      rs_R009_ueqv_R009NYYYY_partial_25_0240 := by
  native_decide

/-- Coefficient term 241 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0241 : Poly :=
[
  term ((-22324766 : Rat) / 32699) [(13, 2), (15, 2), (16, 1)]
]

/-- Partial product 241 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0241 : Poly :=
[
  term ((-44649532 : Rat) / 32699) [(2, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((22324766 : Rat) / 32699) [(2, 2), (13, 2), (15, 2), (16, 1)],
  term ((-44649532 : Rat) / 32699) [(3, 1), (13, 3), (15, 2), (16, 1)],
  term ((22324766 : Rat) / 32699) [(3, 2), (13, 2), (15, 2), (16, 1)],
  term ((44649532 : Rat) / 32699) [(12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-22324766 : Rat) / 32699) [(13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 241 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0241_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0241
        rs_R009_ueqv_R009NYYYY_generator_25_0200_0245 =
      rs_R009_ueqv_R009NYYYY_partial_25_0241 := by
  native_decide

/-- Coefficient term 242 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0242 : Poly :=
[
  term ((-3302037910091 : Rat) / 3186190560) [(15, 2)]
]

/-- Partial product 242 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0242 : Poly :=
[
  term ((-3302037910091 : Rat) / 1593095280) [(2, 1), (12, 1), (15, 2)],
  term ((3302037910091 : Rat) / 3186190560) [(2, 2), (15, 2)],
  term ((-3302037910091 : Rat) / 1593095280) [(3, 1), (13, 1), (15, 2)],
  term ((3302037910091 : Rat) / 3186190560) [(3, 2), (15, 2)],
  term ((3302037910091 : Rat) / 1593095280) [(12, 1), (15, 2)],
  term ((-3302037910091 : Rat) / 3186190560) [(15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 242 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0242_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0242
        rs_R009_ueqv_R009NYYYY_generator_25_0200_0245 =
      rs_R009_ueqv_R009NYYYY_partial_25_0242 := by
  native_decide

/-- Coefficient term 243 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0243 : Poly :=
[
  term ((79166885 : Rat) / 392388) [(15, 2), (16, 1)]
]

/-- Partial product 243 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0243 : Poly :=
[
  term ((79166885 : Rat) / 196194) [(2, 1), (12, 1), (15, 2), (16, 1)],
  term ((-79166885 : Rat) / 392388) [(2, 2), (15, 2), (16, 1)],
  term ((79166885 : Rat) / 196194) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-79166885 : Rat) / 392388) [(3, 2), (15, 2), (16, 1)],
  term ((-79166885 : Rat) / 196194) [(12, 1), (15, 2), (16, 1)],
  term ((79166885 : Rat) / 392388) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 243 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0243_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0243
        rs_R009_ueqv_R009NYYYY_generator_25_0200_0245 =
      rs_R009_ueqv_R009NYYYY_partial_25_0243 := by
  native_decide

/-- Coefficient term 244 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0244 : Poly :=
[
  term ((190204212605 : Rat) / 159309528) [(15, 4)]
]

/-- Partial product 244 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0244 : Poly :=
[
  term ((190204212605 : Rat) / 79654764) [(2, 1), (12, 1), (15, 4)],
  term ((-190204212605 : Rat) / 159309528) [(2, 2), (15, 4)],
  term ((190204212605 : Rat) / 79654764) [(3, 1), (13, 1), (15, 4)],
  term ((-190204212605 : Rat) / 159309528) [(3, 2), (15, 4)],
  term ((-190204212605 : Rat) / 79654764) [(12, 1), (15, 4)],
  term ((190204212605 : Rat) / 159309528) [(15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 244 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0244_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0244
        rs_R009_ueqv_R009NYYYY_generator_25_0200_0245 =
      rs_R009_ueqv_R009NYYYY_partial_25_0244 := by
  native_decide

/-- Coefficient term 245 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0245 : Poly :=
[
  term ((-7575941 : Rat) / 32699) [(15, 4), (16, 1)]
]

/-- Partial product 245 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0245 : Poly :=
[
  term ((-15151882 : Rat) / 32699) [(2, 1), (12, 1), (15, 4), (16, 1)],
  term ((7575941 : Rat) / 32699) [(2, 2), (15, 4), (16, 1)],
  term ((-15151882 : Rat) / 32699) [(3, 1), (13, 1), (15, 4), (16, 1)],
  term ((7575941 : Rat) / 32699) [(3, 2), (15, 4), (16, 1)],
  term ((15151882 : Rat) / 32699) [(12, 1), (15, 4), (16, 1)],
  term ((-7575941 : Rat) / 32699) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 245 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0245_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0245
        rs_R009_ueqv_R009NYYYY_generator_25_0200_0245 =
      rs_R009_ueqv_R009NYYYY_partial_25_0245 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NYYYY_partials_25_0200_0245 : List Poly :=
[
  rs_R009_ueqv_R009NYYYY_partial_25_0200,
  rs_R009_ueqv_R009NYYYY_partial_25_0201,
  rs_R009_ueqv_R009NYYYY_partial_25_0202,
  rs_R009_ueqv_R009NYYYY_partial_25_0203,
  rs_R009_ueqv_R009NYYYY_partial_25_0204,
  rs_R009_ueqv_R009NYYYY_partial_25_0205,
  rs_R009_ueqv_R009NYYYY_partial_25_0206,
  rs_R009_ueqv_R009NYYYY_partial_25_0207,
  rs_R009_ueqv_R009NYYYY_partial_25_0208,
  rs_R009_ueqv_R009NYYYY_partial_25_0209,
  rs_R009_ueqv_R009NYYYY_partial_25_0210,
  rs_R009_ueqv_R009NYYYY_partial_25_0211,
  rs_R009_ueqv_R009NYYYY_partial_25_0212,
  rs_R009_ueqv_R009NYYYY_partial_25_0213,
  rs_R009_ueqv_R009NYYYY_partial_25_0214,
  rs_R009_ueqv_R009NYYYY_partial_25_0215,
  rs_R009_ueqv_R009NYYYY_partial_25_0216,
  rs_R009_ueqv_R009NYYYY_partial_25_0217,
  rs_R009_ueqv_R009NYYYY_partial_25_0218,
  rs_R009_ueqv_R009NYYYY_partial_25_0219,
  rs_R009_ueqv_R009NYYYY_partial_25_0220,
  rs_R009_ueqv_R009NYYYY_partial_25_0221,
  rs_R009_ueqv_R009NYYYY_partial_25_0222,
  rs_R009_ueqv_R009NYYYY_partial_25_0223,
  rs_R009_ueqv_R009NYYYY_partial_25_0224,
  rs_R009_ueqv_R009NYYYY_partial_25_0225,
  rs_R009_ueqv_R009NYYYY_partial_25_0226,
  rs_R009_ueqv_R009NYYYY_partial_25_0227,
  rs_R009_ueqv_R009NYYYY_partial_25_0228,
  rs_R009_ueqv_R009NYYYY_partial_25_0229,
  rs_R009_ueqv_R009NYYYY_partial_25_0230,
  rs_R009_ueqv_R009NYYYY_partial_25_0231,
  rs_R009_ueqv_R009NYYYY_partial_25_0232,
  rs_R009_ueqv_R009NYYYY_partial_25_0233,
  rs_R009_ueqv_R009NYYYY_partial_25_0234,
  rs_R009_ueqv_R009NYYYY_partial_25_0235,
  rs_R009_ueqv_R009NYYYY_partial_25_0236,
  rs_R009_ueqv_R009NYYYY_partial_25_0237,
  rs_R009_ueqv_R009NYYYY_partial_25_0238,
  rs_R009_ueqv_R009NYYYY_partial_25_0239,
  rs_R009_ueqv_R009NYYYY_partial_25_0240,
  rs_R009_ueqv_R009NYYYY_partial_25_0241,
  rs_R009_ueqv_R009NYYYY_partial_25_0242,
  rs_R009_ueqv_R009NYYYY_partial_25_0243,
  rs_R009_ueqv_R009NYYYY_partial_25_0244,
  rs_R009_ueqv_R009NYYYY_partial_25_0245
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NYYYY_block_25_0200_0245 : Poly :=
[
  term ((8914392348 : Rat) / 1746815) [(2, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-1707864 : Rat) / 1721) [(2, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((21316207000 : Rat) / 6637897) [(2, 1), (11, 1), (12, 1), (13, 1), (15, 4)],
  term ((-20240000 : Rat) / 32699) [(2, 1), (11, 1), (12, 1), (13, 1), (15, 4), (16, 1)],
  term ((-11627022000 : Rat) / 6637897) [(2, 1), (11, 1), (12, 1), (13, 2), (15, 3)],
  term ((11040000 : Rat) / 32699) [(2, 1), (11, 1), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((12592246549 : Rat) / 28448130) [(2, 1), (11, 1), (12, 1), (15, 1)],
  term ((-8491448 : Rat) / 98097) [(2, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-52611608034 : Rat) / 33189485) [(2, 1), (11, 1), (12, 1), (15, 3)],
  term ((9967596 : Rat) / 32699) [(2, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-5550912 : Rat) / 32699) [(2, 1), (11, 1), (12, 2), (15, 3), (16, 1)],
  term ((2449425968 : Rat) / 6637897) [(2, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-2325760 : Rat) / 32699) [(2, 1), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-92520089728 : Rat) / 33189485) [(2, 1), (11, 2), (12, 1), (13, 1), (15, 3)],
  term ((17569792 : Rat) / 32699) [(2, 1), (11, 2), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((27532788096 : Rat) / 33189485) [(2, 1), (11, 2), (12, 1), (13, 2), (15, 2)],
  term ((-5228544 : Rat) / 32699) [(2, 1), (11, 2), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-27331253048 : Rat) / 33189485) [(2, 1), (11, 2), (12, 1), (15, 2)],
  term ((5190272 : Rat) / 32699) [(2, 1), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((75219080992 : Rat) / 33189485) [(2, 1), (11, 2), (12, 1), (15, 4)],
  term ((-14284288 : Rat) / 32699) [(2, 1), (11, 2), (12, 1), (15, 4), (16, 1)],
  term ((-13766394048 : Rat) / 33189485) [(2, 1), (11, 2), (12, 2), (13, 1), (15, 1)],
  term ((2614272 : Rat) / 32699) [(2, 1), (11, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((186032352 : Rat) / 1144465) [(2, 1), (11, 2), (12, 2), (15, 2)],
  term ((-1024512 : Rat) / 32699) [(2, 1), (11, 2), (12, 2), (15, 2), (16, 1)],
  term ((2976517632 : Rat) / 33189485) [(2, 1), (11, 3), (12, 1), (13, 1), (15, 2)],
  term ((-565248 : Rat) / 32699) [(2, 1), (11, 3), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-62010784 : Rat) / 33189485) [(2, 1), (11, 3), (12, 1), (15, 1)],
  term ((11776 : Rat) / 32699) [(2, 1), (11, 3), (12, 1), (15, 1), (16, 1)],
  term ((-744129408 : Rat) / 33189485) [(2, 1), (11, 3), (12, 1), (15, 3)],
  term ((141312 : Rat) / 32699) [(2, 1), (11, 3), (12, 1), (15, 3), (16, 1)],
  term ((315774793765 : Rat) / 159309528) [(2, 1), (12, 1), (13, 1), (15, 1)],
  term ((-37432321 : Rat) / 98097) [(2, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-603340254457 : Rat) / 56896260) [(2, 1), (12, 1), (13, 1), (15, 3)],
  term ((201114622 : Rat) / 98097) [(2, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((468254984987 : Rat) / 66378970) [(2, 1), (12, 1), (13, 2), (15, 2)],
  term ((-44649532 : Rat) / 32699) [(2, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-3302037910091 : Rat) / 1593095280) [(2, 1), (12, 1), (15, 2)],
  term ((79166885 : Rat) / 196194) [(2, 1), (12, 1), (15, 2), (16, 1)],
  term ((190204212605 : Rat) / 79654764) [(2, 1), (12, 1), (15, 4)],
  term ((-15151882 : Rat) / 32699) [(2, 1), (12, 1), (15, 4), (16, 1)],
  term ((-26 : Rat) / 5) [(2, 1), (12, 2)],
  term ((-365213948391 : Rat) / 132757940) [(2, 1), (12, 2), (13, 1), (15, 1)],
  term ((17241566 : Rat) / 32699) [(2, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((25904848343 : Rat) / 13974520) [(2, 1), (12, 2), (15, 2)],
  term ((-619643 : Rat) / 1721) [(2, 1), (12, 2), (15, 2), (16, 1)],
  term ((2775456 : Rat) / 32699) [(2, 2), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-4457196174 : Rat) / 1746815) [(2, 2), (11, 1), (13, 1), (15, 2)],
  term ((853932 : Rat) / 1721) [(2, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-10658103500 : Rat) / 6637897) [(2, 2), (11, 1), (13, 1), (15, 4)],
  term ((10120000 : Rat) / 32699) [(2, 2), (11, 1), (13, 1), (15, 4), (16, 1)],
  term ((5813511000 : Rat) / 6637897) [(2, 2), (11, 1), (13, 2), (15, 3)],
  term ((-5520000 : Rat) / 32699) [(2, 2), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((-12592246549 : Rat) / 56896260) [(2, 2), (11, 1), (15, 1)],
  term ((4245724 : Rat) / 98097) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((26305804017 : Rat) / 33189485) [(2, 2), (11, 1), (15, 3)],
  term ((-4983798 : Rat) / 32699) [(2, 2), (11, 1), (15, 3), (16, 1)],
  term ((6883197024 : Rat) / 33189485) [(2, 2), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-1307136 : Rat) / 32699) [(2, 2), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-93016176 : Rat) / 1144465) [(2, 2), (11, 2), (12, 1), (15, 2)],
  term ((512256 : Rat) / 32699) [(2, 2), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((-1224712984 : Rat) / 6637897) [(2, 2), (11, 2), (13, 1), (15, 1)],
  term ((1162880 : Rat) / 32699) [(2, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((46260044864 : Rat) / 33189485) [(2, 2), (11, 2), (13, 1), (15, 3)],
  term ((-8784896 : Rat) / 32699) [(2, 2), (11, 2), (13, 1), (15, 3), (16, 1)],
  term ((-13766394048 : Rat) / 33189485) [(2, 2), (11, 2), (13, 2), (15, 2)],
  term ((2614272 : Rat) / 32699) [(2, 2), (11, 2), (13, 2), (15, 2), (16, 1)],
  term ((13665626524 : Rat) / 33189485) [(2, 2), (11, 2), (15, 2)],
  term ((-2595136 : Rat) / 32699) [(2, 2), (11, 2), (15, 2), (16, 1)],
  term ((-37609540496 : Rat) / 33189485) [(2, 2), (11, 2), (15, 4)],
  term ((7142144 : Rat) / 32699) [(2, 2), (11, 2), (15, 4), (16, 1)],
  term ((-1488258816 : Rat) / 33189485) [(2, 2), (11, 3), (13, 1), (15, 2)],
  term ((282624 : Rat) / 32699) [(2, 2), (11, 3), (13, 1), (15, 2), (16, 1)],
  term ((31005392 : Rat) / 33189485) [(2, 2), (11, 3), (15, 1)],
  term ((-5888 : Rat) / 32699) [(2, 2), (11, 3), (15, 1), (16, 1)],
  term ((372064704 : Rat) / 33189485) [(2, 2), (11, 3), (15, 3)],
  term ((-70656 : Rat) / 32699) [(2, 2), (11, 3), (15, 3), (16, 1)],
  term ((13 : Rat) / 5) [(2, 2), (12, 1)],
  term ((365213948391 : Rat) / 265515880) [(2, 2), (12, 1), (13, 1), (15, 1)],
  term ((-8620783 : Rat) / 32699) [(2, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-25904848343 : Rat) / 27949040) [(2, 2), (12, 1), (15, 2)],
  term ((619643 : Rat) / 3442) [(2, 2), (12, 1), (15, 2), (16, 1)],
  term ((-315774793765 : Rat) / 318619056) [(2, 2), (13, 1), (15, 1)],
  term ((37432321 : Rat) / 196194) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((603340254457 : Rat) / 113792520) [(2, 2), (13, 1), (15, 3)],
  term ((-100557311 : Rat) / 98097) [(2, 2), (13, 1), (15, 3), (16, 1)],
  term ((-468254984987 : Rat) / 132757940) [(2, 2), (13, 2), (15, 2)],
  term ((22324766 : Rat) / 32699) [(2, 2), (13, 2), (15, 2), (16, 1)],
  term ((3302037910091 : Rat) / 3186190560) [(2, 2), (15, 2)],
  term ((-79166885 : Rat) / 392388) [(2, 2), (15, 2), (16, 1)],
  term ((-190204212605 : Rat) / 159309528) [(2, 2), (15, 4)],
  term ((7575941 : Rat) / 32699) [(2, 2), (15, 4), (16, 1)],
  term ((-5550912 : Rat) / 32699) [(3, 1), (11, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((12592246549 : Rat) / 28448130) [(3, 1), (11, 1), (13, 1), (15, 1)],
  term ((-8491448 : Rat) / 98097) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-52611608034 : Rat) / 33189485) [(3, 1), (11, 1), (13, 1), (15, 3)],
  term ((9967596 : Rat) / 32699) [(3, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((8914392348 : Rat) / 1746815) [(3, 1), (11, 1), (13, 2), (15, 2)],
  term ((-1707864 : Rat) / 1721) [(3, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((21316207000 : Rat) / 6637897) [(3, 1), (11, 1), (13, 2), (15, 4)],
  term ((-20240000 : Rat) / 32699) [(3, 1), (11, 1), (13, 2), (15, 4), (16, 1)],
  term ((-11627022000 : Rat) / 6637897) [(3, 1), (11, 1), (13, 3), (15, 3)],
  term ((11040000 : Rat) / 32699) [(3, 1), (11, 1), (13, 3), (15, 3), (16, 1)],
  term ((186032352 : Rat) / 1144465) [(3, 1), (11, 2), (12, 1), (13, 1), (15, 2)],
  term ((-1024512 : Rat) / 32699) [(3, 1), (11, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-13766394048 : Rat) / 33189485) [(3, 1), (11, 2), (12, 1), (13, 2), (15, 1)],
  term ((2614272 : Rat) / 32699) [(3, 1), (11, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-27331253048 : Rat) / 33189485) [(3, 1), (11, 2), (13, 1), (15, 2)],
  term ((5190272 : Rat) / 32699) [(3, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((75219080992 : Rat) / 33189485) [(3, 1), (11, 2), (13, 1), (15, 4)],
  term ((-14284288 : Rat) / 32699) [(3, 1), (11, 2), (13, 1), (15, 4), (16, 1)],
  term ((2449425968 : Rat) / 6637897) [(3, 1), (11, 2), (13, 2), (15, 1)],
  term ((-2325760 : Rat) / 32699) [(3, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((-92520089728 : Rat) / 33189485) [(3, 1), (11, 2), (13, 2), (15, 3)],
  term ((17569792 : Rat) / 32699) [(3, 1), (11, 2), (13, 2), (15, 3), (16, 1)],
  term ((27532788096 : Rat) / 33189485) [(3, 1), (11, 2), (13, 3), (15, 2)],
  term ((-5228544 : Rat) / 32699) [(3, 1), (11, 2), (13, 3), (15, 2), (16, 1)],
  term ((-62010784 : Rat) / 33189485) [(3, 1), (11, 3), (13, 1), (15, 1)],
  term ((11776 : Rat) / 32699) [(3, 1), (11, 3), (13, 1), (15, 1), (16, 1)],
  term ((-744129408 : Rat) / 33189485) [(3, 1), (11, 3), (13, 1), (15, 3)],
  term ((141312 : Rat) / 32699) [(3, 1), (11, 3), (13, 1), (15, 3), (16, 1)],
  term ((2976517632 : Rat) / 33189485) [(3, 1), (11, 3), (13, 2), (15, 2)],
  term ((-565248 : Rat) / 32699) [(3, 1), (11, 3), (13, 2), (15, 2), (16, 1)],
  term ((-26 : Rat) / 5) [(3, 1), (12, 1), (13, 1)],
  term ((25904848343 : Rat) / 13974520) [(3, 1), (12, 1), (13, 1), (15, 2)],
  term ((-619643 : Rat) / 1721) [(3, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-365213948391 : Rat) / 132757940) [(3, 1), (12, 1), (13, 2), (15, 1)],
  term ((17241566 : Rat) / 32699) [(3, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-3302037910091 : Rat) / 1593095280) [(3, 1), (13, 1), (15, 2)],
  term ((79166885 : Rat) / 196194) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((190204212605 : Rat) / 79654764) [(3, 1), (13, 1), (15, 4)],
  term ((-15151882 : Rat) / 32699) [(3, 1), (13, 1), (15, 4), (16, 1)],
  term ((315774793765 : Rat) / 159309528) [(3, 1), (13, 2), (15, 1)],
  term ((-37432321 : Rat) / 98097) [(3, 1), (13, 2), (15, 1), (16, 1)],
  term ((-603340254457 : Rat) / 56896260) [(3, 1), (13, 2), (15, 3)],
  term ((201114622 : Rat) / 98097) [(3, 1), (13, 2), (15, 3), (16, 1)],
  term ((468254984987 : Rat) / 66378970) [(3, 1), (13, 3), (15, 2)],
  term ((-44649532 : Rat) / 32699) [(3, 1), (13, 3), (15, 2), (16, 1)],
  term ((2775456 : Rat) / 32699) [(3, 2), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-4457196174 : Rat) / 1746815) [(3, 2), (11, 1), (13, 1), (15, 2)],
  term ((853932 : Rat) / 1721) [(3, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-10658103500 : Rat) / 6637897) [(3, 2), (11, 1), (13, 1), (15, 4)],
  term ((10120000 : Rat) / 32699) [(3, 2), (11, 1), (13, 1), (15, 4), (16, 1)],
  term ((5813511000 : Rat) / 6637897) [(3, 2), (11, 1), (13, 2), (15, 3)],
  term ((-5520000 : Rat) / 32699) [(3, 2), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((-12592246549 : Rat) / 56896260) [(3, 2), (11, 1), (15, 1)],
  term ((4245724 : Rat) / 98097) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((26305804017 : Rat) / 33189485) [(3, 2), (11, 1), (15, 3)],
  term ((-4983798 : Rat) / 32699) [(3, 2), (11, 1), (15, 3), (16, 1)],
  term ((6883197024 : Rat) / 33189485) [(3, 2), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-1307136 : Rat) / 32699) [(3, 2), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-93016176 : Rat) / 1144465) [(3, 2), (11, 2), (12, 1), (15, 2)],
  term ((512256 : Rat) / 32699) [(3, 2), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((-1224712984 : Rat) / 6637897) [(3, 2), (11, 2), (13, 1), (15, 1)],
  term ((1162880 : Rat) / 32699) [(3, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((46260044864 : Rat) / 33189485) [(3, 2), (11, 2), (13, 1), (15, 3)],
  term ((-8784896 : Rat) / 32699) [(3, 2), (11, 2), (13, 1), (15, 3), (16, 1)],
  term ((-13766394048 : Rat) / 33189485) [(3, 2), (11, 2), (13, 2), (15, 2)],
  term ((2614272 : Rat) / 32699) [(3, 2), (11, 2), (13, 2), (15, 2), (16, 1)],
  term ((13665626524 : Rat) / 33189485) [(3, 2), (11, 2), (15, 2)],
  term ((-2595136 : Rat) / 32699) [(3, 2), (11, 2), (15, 2), (16, 1)],
  term ((-37609540496 : Rat) / 33189485) [(3, 2), (11, 2), (15, 4)],
  term ((7142144 : Rat) / 32699) [(3, 2), (11, 2), (15, 4), (16, 1)],
  term ((-1488258816 : Rat) / 33189485) [(3, 2), (11, 3), (13, 1), (15, 2)],
  term ((282624 : Rat) / 32699) [(3, 2), (11, 3), (13, 1), (15, 2), (16, 1)],
  term ((31005392 : Rat) / 33189485) [(3, 2), (11, 3), (15, 1)],
  term ((-5888 : Rat) / 32699) [(3, 2), (11, 3), (15, 1), (16, 1)],
  term ((372064704 : Rat) / 33189485) [(3, 2), (11, 3), (15, 3)],
  term ((-70656 : Rat) / 32699) [(3, 2), (11, 3), (15, 3), (16, 1)],
  term ((13 : Rat) / 5) [(3, 2), (12, 1)],
  term ((365213948391 : Rat) / 265515880) [(3, 2), (12, 1), (13, 1), (15, 1)],
  term ((-8620783 : Rat) / 32699) [(3, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-25904848343 : Rat) / 27949040) [(3, 2), (12, 1), (15, 2)],
  term ((619643 : Rat) / 3442) [(3, 2), (12, 1), (15, 2), (16, 1)],
  term ((-315774793765 : Rat) / 318619056) [(3, 2), (13, 1), (15, 1)],
  term ((37432321 : Rat) / 196194) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((603340254457 : Rat) / 113792520) [(3, 2), (13, 1), (15, 3)],
  term ((-100557311 : Rat) / 98097) [(3, 2), (13, 1), (15, 3), (16, 1)],
  term ((-468254984987 : Rat) / 132757940) [(3, 2), (13, 2), (15, 2)],
  term ((22324766 : Rat) / 32699) [(3, 2), (13, 2), (15, 2), (16, 1)],
  term ((3302037910091 : Rat) / 3186190560) [(3, 2), (15, 2)],
  term ((-79166885 : Rat) / 392388) [(3, 2), (15, 2), (16, 1)],
  term ((-190204212605 : Rat) / 159309528) [(3, 2), (15, 4)],
  term ((7575941 : Rat) / 32699) [(3, 2), (15, 4), (16, 1)],
  term ((-8914392348 : Rat) / 1746815) [(11, 1), (12, 1), (13, 1), (15, 2)],
  term ((1707864 : Rat) / 1721) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-21316207000 : Rat) / 6637897) [(11, 1), (12, 1), (13, 1), (15, 4)],
  term ((20240000 : Rat) / 32699) [(11, 1), (12, 1), (13, 1), (15, 4), (16, 1)],
  term ((11627022000 : Rat) / 6637897) [(11, 1), (12, 1), (13, 2), (15, 3)],
  term ((-11040000 : Rat) / 32699) [(11, 1), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((-12592246549 : Rat) / 28448130) [(11, 1), (12, 1), (15, 1)],
  term ((8491448 : Rat) / 98097) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term ((52611608034 : Rat) / 33189485) [(11, 1), (12, 1), (15, 3)],
  term ((-12743052 : Rat) / 32699) [(11, 1), (12, 1), (15, 3), (16, 1)],
  term ((5550912 : Rat) / 32699) [(11, 1), (12, 2), (15, 3), (16, 1)],
  term ((4457196174 : Rat) / 1746815) [(11, 1), (13, 1), (15, 2)],
  term ((-853932 : Rat) / 1721) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((10658103500 : Rat) / 6637897) [(11, 1), (13, 1), (15, 4)],
  term ((-10120000 : Rat) / 32699) [(11, 1), (13, 1), (15, 4), (16, 1)],
  term ((-5813511000 : Rat) / 6637897) [(11, 1), (13, 2), (15, 3)],
  term ((5520000 : Rat) / 32699) [(11, 1), (13, 2), (15, 3), (16, 1)],
  term ((12592246549 : Rat) / 56896260) [(11, 1), (15, 1)],
  term ((-4245724 : Rat) / 98097) [(11, 1), (15, 1), (16, 1)],
  term ((-26305804017 : Rat) / 33189485) [(11, 1), (15, 3)],
  term ((4983798 : Rat) / 32699) [(11, 1), (15, 3), (16, 1)],
  term ((-19130326864 : Rat) / 33189485) [(11, 2), (12, 1), (13, 1), (15, 1)],
  term ((3632896 : Rat) / 32699) [(11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((92520089728 : Rat) / 33189485) [(11, 2), (12, 1), (13, 1), (15, 3)],
  term ((-17569792 : Rat) / 32699) [(11, 2), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-27532788096 : Rat) / 33189485) [(11, 2), (12, 1), (13, 2), (15, 2)],
  term ((5228544 : Rat) / 32699) [(11, 2), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((30028722152 : Rat) / 33189485) [(11, 2), (12, 1), (15, 2)],
  term ((-5702528 : Rat) / 32699) [(11, 2), (12, 1), (15, 2), (16, 1)],
  term ((-75219080992 : Rat) / 33189485) [(11, 2), (12, 1), (15, 4)],
  term ((14284288 : Rat) / 32699) [(11, 2), (12, 1), (15, 4), (16, 1)],
  term ((13766394048 : Rat) / 33189485) [(11, 2), (12, 2), (13, 1), (15, 1)],
  term ((-2614272 : Rat) / 32699) [(11, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-186032352 : Rat) / 1144465) [(11, 2), (12, 2), (15, 2)],
  term ((1024512 : Rat) / 32699) [(11, 2), (12, 2), (15, 2), (16, 1)],
  term ((1224712984 : Rat) / 6637897) [(11, 2), (13, 1), (15, 1)],
  term ((-1162880 : Rat) / 32699) [(11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-46260044864 : Rat) / 33189485) [(11, 2), (13, 1), (15, 3)],
  term ((8784896 : Rat) / 32699) [(11, 2), (13, 1), (15, 3), (16, 1)],
  term ((13766394048 : Rat) / 33189485) [(11, 2), (13, 2), (15, 2)],
  term ((-2614272 : Rat) / 32699) [(11, 2), (13, 2), (15, 2), (16, 1)],
  term ((-13665626524 : Rat) / 33189485) [(11, 2), (15, 2)],
  term ((2595136 : Rat) / 32699) [(11, 2), (15, 2), (16, 1)],
  term ((37609540496 : Rat) / 33189485) [(11, 2), (15, 4)],
  term ((-7142144 : Rat) / 32699) [(11, 2), (15, 4), (16, 1)],
  term ((-2976517632 : Rat) / 33189485) [(11, 3), (12, 1), (13, 1), (15, 2)],
  term ((565248 : Rat) / 32699) [(11, 3), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((62010784 : Rat) / 33189485) [(11, 3), (12, 1), (15, 1)],
  term ((-11776 : Rat) / 32699) [(11, 3), (12, 1), (15, 1), (16, 1)],
  term ((744129408 : Rat) / 33189485) [(11, 3), (12, 1), (15, 3)],
  term ((-141312 : Rat) / 32699) [(11, 3), (12, 1), (15, 3), (16, 1)],
  term ((1488258816 : Rat) / 33189485) [(11, 3), (13, 1), (15, 2)],
  term ((-282624 : Rat) / 32699) [(11, 3), (13, 1), (15, 2), (16, 1)],
  term ((-31005392 : Rat) / 33189485) [(11, 3), (15, 1)],
  term ((5888 : Rat) / 32699) [(11, 3), (15, 1), (16, 1)],
  term ((-372064704 : Rat) / 33189485) [(11, 3), (15, 3)],
  term ((70656 : Rat) / 32699) [(11, 3), (15, 3), (16, 1)],
  term ((-13 : Rat) / 5) [(12, 1)],
  term ((-191036843857 : Rat) / 56896260) [(12, 1), (13, 1), (15, 1)],
  term ((63294670 : Rat) / 98097) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((603340254457 : Rat) / 56896260) [(12, 1), (13, 1), (15, 3)],
  term ((-201114622 : Rat) / 98097) [(12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-468254984987 : Rat) / 66378970) [(12, 1), (13, 2), (15, 2)],
  term ((44649532 : Rat) / 32699) [(12, 1), (13, 2), (15, 2), (16, 1)],
  term ((341329590403 : Rat) / 113792520) [(12, 1), (15, 2)],
  term ((-57243268 : Rat) / 98097) [(12, 1), (15, 2), (16, 1)],
  term ((-190204212605 : Rat) / 79654764) [(12, 1), (15, 4)],
  term ((15151882 : Rat) / 32699) [(12, 1), (15, 4), (16, 1)],
  term ((26 : Rat) / 5) [(12, 2)],
  term ((365213948391 : Rat) / 132757940) [(12, 2), (13, 1), (15, 1)],
  term ((-17241566 : Rat) / 32699) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-25904848343 : Rat) / 13974520) [(12, 2), (15, 2)],
  term ((619643 : Rat) / 1721) [(12, 2), (15, 2), (16, 1)],
  term ((315774793765 : Rat) / 318619056) [(13, 1), (15, 1)],
  term ((-37432321 : Rat) / 196194) [(13, 1), (15, 1), (16, 1)],
  term ((-603340254457 : Rat) / 113792520) [(13, 1), (15, 3)],
  term ((100557311 : Rat) / 98097) [(13, 1), (15, 3), (16, 1)],
  term ((468254984987 : Rat) / 132757940) [(13, 2), (15, 2)],
  term ((-22324766 : Rat) / 32699) [(13, 2), (15, 2), (16, 1)],
  term ((-3302037910091 : Rat) / 3186190560) [(15, 2)],
  term ((79166885 : Rat) / 392388) [(15, 2), (16, 1)],
  term ((190204212605 : Rat) / 159309528) [(15, 4)],
  term ((-7575941 : Rat) / 32699) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 25, terms 200 through 245. -/
theorem rs_R009_ueqv_R009NYYYY_block_25_0200_0245_valid :
    checkProductSumEq rs_R009_ueqv_R009NYYYY_partials_25_0200_0245
      rs_R009_ueqv_R009NYYYY_block_25_0200_0245 = true := by
  native_decide

end R009UeqvR009NYYYYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
