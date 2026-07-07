/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NYYYY, term block 10:200-299

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NYYYYTermShards

/-- Generator polynomial 10 for relaxed split surplus certificate `R009:u=v:R009NYYYY`. -/
def rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(2, 1)]
]

/-- Coefficient term 200 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0200 : Poly :=
[
  term ((-15502696 : Rat) / 6637897) [(3, 1), (4, 1), (9, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 200 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0200 : Poly :=
[
  term ((-31005392 : Rat) / 6637897) [(2, 1), (3, 1), (4, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((15502696 : Rat) / 6637897) [(3, 1), (4, 1), (9, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0200_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0200
        rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_10_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0201 : Poly :=
[
  term ((14720 : Rat) / 32699) [(3, 1), (4, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 201 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0201 : Poly :=
[
  term ((29440 : Rat) / 32699) [(2, 1), (3, 1), (4, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-14720 : Rat) / 32699) [(3, 1), (4, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0201_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0201
        rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_10_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0202 : Poly :=
[
  term ((31005392 : Rat) / 19913691) [(3, 1), (4, 1), (9, 1), (11, 1), (13, 1), (15, 2)]
]

/-- Partial product 202 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0202 : Poly :=
[
  term ((62010784 : Rat) / 19913691) [(2, 1), (3, 1), (4, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((-31005392 : Rat) / 19913691) [(3, 1), (4, 1), (9, 1), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0202_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0202
        rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_10_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0203 : Poly :=
[
  term ((-29440 : Rat) / 98097) [(3, 1), (4, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 203 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0203 : Poly :=
[
  term ((-58880 : Rat) / 98097) [(2, 1), (3, 1), (4, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((29440 : Rat) / 98097) [(3, 1), (4, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0203_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0203
        rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_10_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0204 : Poly :=
[
  term ((131772916 : Rat) / 33189485) [(3, 1), (4, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 204 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0204 : Poly :=
[
  term ((263545832 : Rat) / 33189485) [(2, 1), (3, 1), (4, 1), (9, 1), (11, 1), (15, 1)],
  term ((-131772916 : Rat) / 33189485) [(3, 1), (4, 1), (9, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0204_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0204
        rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_10_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0205 : Poly :=
[
  term ((-25024 : Rat) / 32699) [(3, 1), (4, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 205 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0205 : Poly :=
[
  term ((-50048 : Rat) / 32699) [(2, 1), (3, 1), (4, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((25024 : Rat) / 32699) [(3, 1), (4, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0205_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0205
        rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_10_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0206 : Poly :=
[
  term ((64 : Rat) / 87) [(3, 1), (4, 1), (9, 1), (11, 1), (15, 3)]
]

/-- Partial product 206 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0206 : Poly :=
[
  term ((128 : Rat) / 87) [(2, 1), (3, 1), (4, 1), (9, 1), (11, 1), (15, 3)],
  term ((-64 : Rat) / 87) [(3, 1), (4, 1), (9, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0206_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0206
        rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_10_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0207 : Poly :=
[
  term ((-5 : Rat) / 4) [(3, 1), (4, 1), (9, 1), (12, 1)]
]

/-- Partial product 207 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0207 : Poly :=
[
  term ((-5 : Rat) / 2) [(2, 1), (3, 1), (4, 1), (9, 1), (12, 1)],
  term ((5 : Rat) / 4) [(3, 1), (4, 1), (9, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0207_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0207
        rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_10_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0208 : Poly :=
[
  term ((-40 : Rat) / 29) [(3, 1), (4, 1), (9, 1), (12, 1), (15, 2)]
]

/-- Partial product 208 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0208 : Poly :=
[
  term ((-80 : Rat) / 29) [(2, 1), (3, 1), (4, 1), (9, 1), (12, 1), (15, 2)],
  term ((40 : Rat) / 29) [(3, 1), (4, 1), (9, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0208_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0208
        rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_10_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0209 : Poly :=
[
  term ((-239 : Rat) / 174) [(3, 1), (4, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 209 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0209 : Poly :=
[
  term ((-239 : Rat) / 87) [(2, 1), (3, 1), (4, 1), (9, 1), (13, 1), (15, 1)],
  term ((239 : Rat) / 174) [(3, 1), (4, 1), (9, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0209_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0209
        rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_10_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0210 : Poly :=
[
  term ((80 : Rat) / 87) [(3, 1), (4, 1), (9, 1), (13, 1), (15, 3)]
]

/-- Partial product 210 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0210 : Poly :=
[
  term ((160 : Rat) / 87) [(2, 1), (3, 1), (4, 1), (9, 1), (13, 1), (15, 3)],
  term ((-80 : Rat) / 87) [(3, 1), (4, 1), (9, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0210_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0210
        rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_10_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0211 : Poly :=
[
  term ((416 : Rat) / 87) [(3, 1), (4, 1), (9, 1), (15, 2)]
]

/-- Partial product 211 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0211 : Poly :=
[
  term ((832 : Rat) / 87) [(2, 1), (3, 1), (4, 1), (9, 1), (15, 2)],
  term ((-416 : Rat) / 87) [(3, 1), (4, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0211_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0211
        rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_10_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0212 : Poly :=
[
  term ((2046355872 : Rat) / 6637897) [(3, 1), (4, 1), (10, 1), (11, 1), (15, 2)]
]

/-- Partial product 212 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0212 : Poly :=
[
  term ((4092711744 : Rat) / 6637897) [(2, 1), (3, 1), (4, 1), (10, 1), (11, 1), (15, 2)],
  term ((-2046355872 : Rat) / 6637897) [(3, 1), (4, 1), (10, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0212_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0212
        rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_10_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0213 : Poly :=
[
  term ((-1943040 : Rat) / 32699) [(3, 1), (4, 1), (10, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 213 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0213 : Poly :=
[
  term ((-3886080 : Rat) / 32699) [(2, 1), (3, 1), (4, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((1943040 : Rat) / 32699) [(3, 1), (4, 1), (10, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0213_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0213
        rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_10_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0214 : Poly :=
[
  term ((15946032288 : Rat) / 33189485) [(3, 1), (4, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 214 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0214 : Poly :=
[
  term ((31892064576 : Rat) / 33189485) [(2, 1), (3, 1), (4, 1), (10, 1), (12, 1), (15, 1)],
  term ((-15946032288 : Rat) / 33189485) [(3, 1), (4, 1), (10, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0214_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0214
        rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_10_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0215 : Poly :=
[
  term ((-3049920 : Rat) / 32699) [(3, 1), (4, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 215 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0215 : Poly :=
[
  term ((-6099840 : Rat) / 32699) [(2, 1), (3, 1), (4, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((3049920 : Rat) / 32699) [(3, 1), (4, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0215_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0215
        rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_10_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0216 : Poly :=
[
  term ((-10630688192 : Rat) / 33189485) [(3, 1), (4, 1), (10, 1), (13, 1), (15, 2)]
]

/-- Partial product 216 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0216 : Poly :=
[
  term ((-21261376384 : Rat) / 33189485) [(2, 1), (3, 1), (4, 1), (10, 1), (13, 1), (15, 2)],
  term ((10630688192 : Rat) / 33189485) [(3, 1), (4, 1), (10, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0216_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0216
        rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_10_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0217 : Poly :=
[
  term ((2033280 : Rat) / 32699) [(3, 1), (4, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 217 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0217 : Poly :=
[
  term ((4066560 : Rat) / 32699) [(2, 1), (3, 1), (4, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2033280 : Rat) / 32699) [(3, 1), (4, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0217_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0217
        rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_10_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0218 : Poly :=
[
  term ((-863559471 : Rat) / 1896542) [(3, 1), (4, 1), (10, 1), (15, 1)]
]

/-- Partial product 218 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0218 : Poly :=
[
  term ((-863559471 : Rat) / 948271) [(2, 1), (3, 1), (4, 1), (10, 1), (15, 1)],
  term ((863559471 : Rat) / 1896542) [(3, 1), (4, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0218_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0218
        rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_10_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0219 : Poly :=
[
  term ((2880862 : Rat) / 32699) [(3, 1), (4, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 219 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0219 : Poly :=
[
  term ((5761724 : Rat) / 32699) [(2, 1), (3, 1), (4, 1), (10, 1), (15, 1), (16, 1)],
  term ((-2880862 : Rat) / 32699) [(3, 1), (4, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0219_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0219
        rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_10_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0220 : Poly :=
[
  term ((2906755500 : Rat) / 6637897) [(3, 1), (4, 1), (11, 1), (12, 1), (15, 2)]
]

/-- Partial product 220 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0220 : Poly :=
[
  term ((5813511000 : Rat) / 6637897) [(2, 1), (3, 1), (4, 1), (11, 1), (12, 1), (15, 2)],
  term ((-2906755500 : Rat) / 6637897) [(3, 1), (4, 1), (11, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0220_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0220
        rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_10_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0221 : Poly :=
[
  term ((-2760000 : Rat) / 32699) [(3, 1), (4, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 221 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0221 : Poly :=
[
  term ((-5520000 : Rat) / 32699) [(2, 1), (3, 1), (4, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((2760000 : Rat) / 32699) [(3, 1), (4, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0221_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0221
        rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_10_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0222 : Poly :=
[
  term ((4092711744 : Rat) / 6637897) [(3, 1), (4, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 222 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0222 : Poly :=
[
  term ((8185423488 : Rat) / 6637897) [(2, 1), (3, 1), (4, 1), (11, 1), (13, 1), (15, 1)],
  term ((-4092711744 : Rat) / 6637897) [(3, 1), (4, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0222_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0222
        rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_10_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0223 : Poly :=
[
  term ((-3886080 : Rat) / 32699) [(3, 1), (4, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 223 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0223 : Poly :=
[
  term ((-7772160 : Rat) / 32699) [(2, 1), (3, 1), (4, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((3886080 : Rat) / 32699) [(3, 1), (4, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0223_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0223
        rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_10_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0224 : Poly :=
[
  term ((-1937837000 : Rat) / 6637897) [(3, 1), (4, 1), (11, 1), (13, 1), (15, 3)]
]

/-- Partial product 224 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0224 : Poly :=
[
  term ((-3875674000 : Rat) / 6637897) [(2, 1), (3, 1), (4, 1), (11, 1), (13, 1), (15, 3)],
  term ((1937837000 : Rat) / 6637897) [(3, 1), (4, 1), (11, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0224_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0224
        rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_10_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0225 : Poly :=
[
  term ((1840000 : Rat) / 32699) [(3, 1), (4, 1), (11, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 225 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0225 : Poly :=
[
  term ((3680000 : Rat) / 32699) [(2, 1), (3, 1), (4, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-1840000 : Rat) / 32699) [(3, 1), (4, 1), (11, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0225_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0225
        rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_10_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0226 : Poly :=
[
  term ((-47413935991 : Rat) / 33189485) [(3, 1), (4, 1), (11, 1), (15, 2)]
]

/-- Partial product 226 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0226 : Poly :=
[
  term ((-94827871982 : Rat) / 33189485) [(2, 1), (3, 1), (4, 1), (11, 1), (15, 2)],
  term ((47413935991 : Rat) / 33189485) [(3, 1), (4, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0226_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0226
        rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_10_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0227 : Poly :=
[
  term ((9012660 : Rat) / 32699) [(3, 1), (4, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 227 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0227 : Poly :=
[
  term ((18025320 : Rat) / 32699) [(2, 1), (3, 1), (4, 1), (11, 1), (15, 2), (16, 1)],
  term ((-9012660 : Rat) / 32699) [(3, 1), (4, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0227_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0227
        rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_10_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0228 : Poly :=
[
  term ((-6883197024 : Rat) / 33189485) [(3, 1), (4, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 228 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0228 : Poly :=
[
  term ((-13766394048 : Rat) / 33189485) [(2, 1), (3, 1), (4, 1), (11, 2), (12, 1), (15, 1)],
  term ((6883197024 : Rat) / 33189485) [(3, 1), (4, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0228_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0228
        rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_10_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0229 : Poly :=
[
  term ((1307136 : Rat) / 32699) [(3, 1), (4, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 229 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0229 : Poly :=
[
  term ((2614272 : Rat) / 32699) [(2, 1), (3, 1), (4, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-1307136 : Rat) / 32699) [(3, 1), (4, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0229_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0229
        rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_10_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0230 : Poly :=
[
  term ((4588798016 : Rat) / 33189485) [(3, 1), (4, 1), (11, 2), (13, 1), (15, 2)]
]

/-- Partial product 230 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0230 : Poly :=
[
  term ((9177596032 : Rat) / 33189485) [(2, 1), (3, 1), (4, 1), (11, 2), (13, 1), (15, 2)],
  term ((-4588798016 : Rat) / 33189485) [(3, 1), (4, 1), (11, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0230_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0230
        rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_10_0230 := by
  native_decide

/-- Coefficient term 231 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0231 : Poly :=
[
  term ((-871424 : Rat) / 32699) [(3, 1), (4, 1), (11, 2), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 231 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0231 : Poly :=
[
  term ((-1742848 : Rat) / 32699) [(2, 1), (3, 1), (4, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((871424 : Rat) / 32699) [(3, 1), (4, 1), (11, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 231 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0231_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0231
        rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_10_0231 := by
  native_decide

/-- Coefficient term 232 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0232 : Poly :=
[
  term ((1333231856 : Rat) / 6637897) [(3, 1), (4, 1), (11, 2), (15, 1)]
]

/-- Partial product 232 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0232 : Poly :=
[
  term ((2666463712 : Rat) / 6637897) [(2, 1), (3, 1), (4, 1), (11, 2), (15, 1)],
  term ((-1333231856 : Rat) / 6637897) [(3, 1), (4, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 232 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0232_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0232
        rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_10_0232 := by
  native_decide

/-- Coefficient term 233 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0233 : Poly :=
[
  term ((-1265920 : Rat) / 32699) [(3, 1), (4, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 233 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0233 : Poly :=
[
  term ((-2531840 : Rat) / 32699) [(2, 1), (3, 1), (4, 1), (11, 2), (15, 1), (16, 1)],
  term ((1265920 : Rat) / 32699) [(3, 1), (4, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 233 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0233_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0233
        rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_10_0233 := by
  native_decide

/-- Coefficient term 234 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0234 : Poly :=
[
  term ((-1364237248 : Rat) / 6637897) [(3, 1), (4, 1), (11, 2), (15, 3)]
]

/-- Partial product 234 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0234 : Poly :=
[
  term ((-2728474496 : Rat) / 6637897) [(2, 1), (3, 1), (4, 1), (11, 2), (15, 3)],
  term ((1364237248 : Rat) / 6637897) [(3, 1), (4, 1), (11, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 234 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0234_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0234
        rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_10_0234 := by
  native_decide

/-- Coefficient term 235 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0235 : Poly :=
[
  term ((1295360 : Rat) / 32699) [(3, 1), (4, 1), (11, 2), (15, 3), (16, 1)]
]

/-- Partial product 235 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0235 : Poly :=
[
  term ((2590720 : Rat) / 32699) [(2, 1), (3, 1), (4, 1), (11, 2), (15, 3), (16, 1)],
  term ((-1295360 : Rat) / 32699) [(3, 1), (4, 1), (11, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 235 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0235_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0235
        rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_10_0235 := by
  native_decide

/-- Coefficient term 236 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0236 : Poly :=
[
  term ((-43027457307 : Rat) / 265515880) [(3, 1), (4, 1), (12, 1), (15, 1)]
]

/-- Partial product 236 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0236 : Poly :=
[
  term ((-43027457307 : Rat) / 132757940) [(2, 1), (3, 1), (4, 1), (12, 1), (15, 1)],
  term ((43027457307 : Rat) / 265515880) [(3, 1), (4, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 236 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0236_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0236
        rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_10_0236 := by
  native_decide

/-- Coefficient term 237 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0237 : Poly :=
[
  term ((995983 : Rat) / 32699) [(3, 1), (4, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 237 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0237 : Poly :=
[
  term ((1991966 : Rat) / 32699) [(2, 1), (3, 1), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((-995983 : Rat) / 32699) [(3, 1), (4, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 237 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0237_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0237
        rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_10_0237 := by
  native_decide

/-- Coefficient term 238 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0238 : Poly :=
[
  term ((14342485769 : Rat) / 132757940) [(3, 1), (4, 1), (13, 1), (15, 2)]
]

/-- Partial product 238 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0238 : Poly :=
[
  term ((14342485769 : Rat) / 66378970) [(2, 1), (3, 1), (4, 1), (13, 1), (15, 2)],
  term ((-14342485769 : Rat) / 132757940) [(3, 1), (4, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 238 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0238_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0238
        rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_10_0238 := by
  native_decide

/-- Coefficient term 239 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0239 : Poly :=
[
  term ((-1991966 : Rat) / 98097) [(3, 1), (4, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 239 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0239 : Poly :=
[
  term ((-3983932 : Rat) / 98097) [(2, 1), (3, 1), (4, 1), (13, 1), (15, 2), (16, 1)],
  term ((1991966 : Rat) / 98097) [(3, 1), (4, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 239 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0239_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0239
        rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_10_0239 := by
  native_decide

/-- Coefficient term 240 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0240 : Poly :=
[
  term ((109277810501 : Rat) / 531031760) [(3, 1), (4, 1), (15, 1)]
]

/-- Partial product 240 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0240 : Poly :=
[
  term ((109277810501 : Rat) / 265515880) [(2, 1), (3, 1), (4, 1), (15, 1)],
  term ((-109277810501 : Rat) / 531031760) [(3, 1), (4, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 240 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0240_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0240
        rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_10_0240 := by
  native_decide

/-- Coefficient term 241 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0241 : Poly :=
[
  term ((-2058623 : Rat) / 65398) [(3, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 241 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0241 : Poly :=
[
  term ((-2058623 : Rat) / 32699) [(2, 1), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((2058623 : Rat) / 65398) [(3, 1), (4, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 241 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0241_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0241
        rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_10_0241 := by
  native_decide

/-- Coefficient term 242 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0242 : Poly :=
[
  term ((31 : Rat) / 20) [(3, 1), (5, 1)]
]

/-- Partial product 242 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0242 : Poly :=
[
  term ((31 : Rat) / 10) [(2, 1), (3, 1), (5, 1)],
  term ((-31 : Rat) / 20) [(3, 1), (5, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 242 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0242_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0242
        rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_10_0242 := by
  native_decide

/-- Coefficient term 243 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0243 : Poly :=
[
  term ((-62010784 : Rat) / 19913691) [(3, 1), (5, 1), (9, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 243 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0243 : Poly :=
[
  term ((-124021568 : Rat) / 19913691) [(2, 1), (3, 1), (5, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((62010784 : Rat) / 19913691) [(3, 1), (5, 1), (9, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 243 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0243_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0243
        rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_10_0243 := by
  native_decide

/-- Coefficient term 244 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0244 : Poly :=
[
  term ((58880 : Rat) / 98097) [(3, 1), (5, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 244 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0244 : Poly :=
[
  term ((117760 : Rat) / 98097) [(2, 1), (3, 1), (5, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-58880 : Rat) / 98097) [(3, 1), (5, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 244 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0244_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0244
        rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_10_0244 := by
  native_decide

/-- Coefficient term 245 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0245 : Poly :=
[
  term ((-128 : Rat) / 87) [(3, 1), (5, 1), (9, 1), (11, 1), (15, 2)]
]

/-- Partial product 245 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0245 : Poly :=
[
  term ((-256 : Rat) / 87) [(2, 1), (3, 1), (5, 1), (9, 1), (11, 1), (15, 2)],
  term ((128 : Rat) / 87) [(3, 1), (5, 1), (9, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 245 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0245_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0245
        rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_10_0245 := by
  native_decide

/-- Coefficient term 246 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0246 : Poly :=
[
  term ((64 : Rat) / 29) [(3, 1), (5, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 246 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0246 : Poly :=
[
  term ((128 : Rat) / 29) [(2, 1), (3, 1), (5, 1), (9, 1), (12, 1), (15, 1)],
  term ((-64 : Rat) / 29) [(3, 1), (5, 1), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 246 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0246_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0246
        rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_10_0246 := by
  native_decide

/-- Coefficient term 247 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0247 : Poly :=
[
  term ((-5 : Rat) / 3) [(3, 1), (5, 1), (9, 1), (13, 1)]
]

/-- Partial product 247 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0247 : Poly :=
[
  term ((-10 : Rat) / 3) [(2, 1), (3, 1), (5, 1), (9, 1), (13, 1)],
  term ((5 : Rat) / 3) [(3, 1), (5, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 247 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0247_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0247
        rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_10_0247 := by
  native_decide

/-- Coefficient term 248 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0248 : Poly :=
[
  term ((-160 : Rat) / 87) [(3, 1), (5, 1), (9, 1), (13, 1), (15, 2)]
]

/-- Partial product 248 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0248 : Poly :=
[
  term ((-320 : Rat) / 87) [(2, 1), (3, 1), (5, 1), (9, 1), (13, 1), (15, 2)],
  term ((160 : Rat) / 87) [(3, 1), (5, 1), (9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 248 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0248_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0248
        rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_10_0248 := by
  native_decide

/-- Coefficient term 249 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0249 : Poly :=
[
  term ((-64 : Rat) / 87) [(3, 1), (5, 1), (9, 1), (15, 1)]
]

/-- Partial product 249 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0249 : Poly :=
[
  term ((-128 : Rat) / 87) [(2, 1), (3, 1), (5, 1), (9, 1), (15, 1)],
  term ((64 : Rat) / 87) [(3, 1), (5, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 249 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0249_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0249
        rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_10_0249 := by
  native_decide

/-- Coefficient term 250 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0250 : Poly :=
[
  term ((21261376384 : Rat) / 33189485) [(3, 1), (5, 1), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 250 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0250 : Poly :=
[
  term ((42522752768 : Rat) / 33189485) [(2, 1), (3, 1), (5, 1), (10, 1), (13, 1), (15, 1)],
  term ((-21261376384 : Rat) / 33189485) [(3, 1), (5, 1), (10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 250 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0250_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0250
        rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_10_0250 := by
  native_decide

/-- Coefficient term 251 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0251 : Poly :=
[
  term ((-4066560 : Rat) / 32699) [(3, 1), (5, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 251 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0251 : Poly :=
[
  term ((-8133120 : Rat) / 32699) [(2, 1), (3, 1), (5, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((4066560 : Rat) / 32699) [(3, 1), (5, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 251 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0251_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0251
        rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_10_0251 := by
  native_decide

/-- Coefficient term 252 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0252 : Poly :=
[
  term ((-4081084722 : Rat) / 6637897) [(3, 1), (5, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 252 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0252 : Poly :=
[
  term ((-8162169444 : Rat) / 6637897) [(2, 1), (3, 1), (5, 1), (11, 1), (12, 1), (15, 1)],
  term ((4081084722 : Rat) / 6637897) [(3, 1), (5, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 252 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0252_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0252
        rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_10_0252 := by
  native_decide

/-- Coefficient term 253 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0253 : Poly :=
[
  term ((3875040 : Rat) / 32699) [(3, 1), (5, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 253 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0253 : Poly :=
[
  term ((7750080 : Rat) / 32699) [(2, 1), (3, 1), (5, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3875040 : Rat) / 32699) [(3, 1), (5, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 253 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0253_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0253
        rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_10_0253 := by
  native_decide

/-- Coefficient term 254 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0254 : Poly :=
[
  term ((3875674000 : Rat) / 6637897) [(3, 1), (5, 1), (11, 1), (13, 1), (15, 2)]
]

/-- Partial product 254 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0254 : Poly :=
[
  term ((7751348000 : Rat) / 6637897) [(2, 1), (3, 1), (5, 1), (11, 1), (13, 1), (15, 2)],
  term ((-3875674000 : Rat) / 6637897) [(3, 1), (5, 1), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 254 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0254_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0254
        rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_10_0254 := by
  native_decide

/-- Coefficient term 255 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0255 : Poly :=
[
  term ((-3680000 : Rat) / 32699) [(3, 1), (5, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 255 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0255 : Poly :=
[
  term ((-7360000 : Rat) / 32699) [(2, 1), (3, 1), (5, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((3680000 : Rat) / 32699) [(3, 1), (5, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 255 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0255_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0255
        rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_10_0255 := by
  native_decide

/-- Coefficient term 256 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0256 : Poly :=
[
  term ((9315000846 : Rat) / 33189485) [(3, 1), (5, 1), (11, 1), (15, 1)]
]

/-- Partial product 256 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0256 : Poly :=
[
  term ((18630001692 : Rat) / 33189485) [(2, 1), (3, 1), (5, 1), (11, 1), (15, 1)],
  term ((-9315000846 : Rat) / 33189485) [(3, 1), (5, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 256 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0256_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0256
        rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_10_0256 := by
  native_decide

/-- Coefficient term 257 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0257 : Poly :=
[
  term ((-1786216 : Rat) / 32699) [(3, 1), (5, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 257 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0257 : Poly :=
[
  term ((-3572432 : Rat) / 32699) [(2, 1), (3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((1786216 : Rat) / 32699) [(3, 1), (5, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 257 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0257_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0257
        rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_10_0257 := by
  native_decide

/-- Coefficient term 258 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0258 : Poly :=
[
  term ((-9177596032 : Rat) / 33189485) [(3, 1), (5, 1), (11, 2), (13, 1), (15, 1)]
]

/-- Partial product 258 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0258 : Poly :=
[
  term ((-18355192064 : Rat) / 33189485) [(2, 1), (3, 1), (5, 1), (11, 2), (13, 1), (15, 1)],
  term ((9177596032 : Rat) / 33189485) [(3, 1), (5, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 258 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0258_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0258
        rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_10_0258 := by
  native_decide

/-- Coefficient term 259 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0259 : Poly :=
[
  term ((1742848 : Rat) / 32699) [(3, 1), (5, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 259 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0259 : Poly :=
[
  term ((3485696 : Rat) / 32699) [(2, 1), (3, 1), (5, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1742848 : Rat) / 32699) [(3, 1), (5, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 259 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0259_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0259
        rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_10_0259 := by
  native_decide

/-- Coefficient term 260 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0260 : Poly :=
[
  term ((2728474496 : Rat) / 6637897) [(3, 1), (5, 1), (11, 2), (15, 2)]
]

/-- Partial product 260 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0260 : Poly :=
[
  term ((5456948992 : Rat) / 6637897) [(2, 1), (3, 1), (5, 1), (11, 2), (15, 2)],
  term ((-2728474496 : Rat) / 6637897) [(3, 1), (5, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 260 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0260_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0260
        rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_10_0260 := by
  native_decide

/-- Coefficient term 261 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0261 : Poly :=
[
  term ((-2590720 : Rat) / 32699) [(3, 1), (5, 1), (11, 2), (15, 2), (16, 1)]
]

/-- Partial product 261 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0261 : Poly :=
[
  term ((-5181440 : Rat) / 32699) [(2, 1), (3, 1), (5, 1), (11, 2), (15, 2), (16, 1)],
  term ((2590720 : Rat) / 32699) [(3, 1), (5, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 261 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0261_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0261
        rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_10_0261 := by
  native_decide

/-- Coefficient term 262 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0262 : Poly :=
[
  term ((31 : Rat) / 20) [(3, 1), (5, 1), (12, 1)]
]

/-- Partial product 262 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0262 : Poly :=
[
  term ((31 : Rat) / 10) [(2, 1), (3, 1), (5, 1), (12, 1)],
  term ((-31 : Rat) / 20) [(3, 1), (5, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 262 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0262_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0262
        rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_10_0262 := by
  native_decide

/-- Coefficient term 263 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0263 : Poly :=
[
  term ((-14342485769 : Rat) / 66378970) [(3, 1), (5, 1), (13, 1), (15, 1)]
]

/-- Partial product 263 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0263 : Poly :=
[
  term ((-14342485769 : Rat) / 33189485) [(2, 1), (3, 1), (5, 1), (13, 1), (15, 1)],
  term ((14342485769 : Rat) / 66378970) [(3, 1), (5, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 263 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0263_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0263
        rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_10_0263 := by
  native_decide

/-- Coefficient term 264 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0264 : Poly :=
[
  term ((3983932 : Rat) / 98097) [(3, 1), (5, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 264 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0264 : Poly :=
[
  term ((7967864 : Rat) / 98097) [(2, 1), (3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3983932 : Rat) / 98097) [(3, 1), (5, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 264 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0264_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0264
        rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_10_0264 := by
  native_decide

/-- Coefficient term 265 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0265 : Poly :=
[
  term ((-1993254036 : Rat) / 33189485) [(3, 1), (6, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 265 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0265 : Poly :=
[
  term ((-3986508072 : Rat) / 33189485) [(2, 1), (3, 1), (6, 1), (10, 1), (12, 1), (15, 1)],
  term ((1993254036 : Rat) / 33189485) [(3, 1), (6, 1), (10, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 265 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0265_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0265
        rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_10_0265 := by
  native_decide

/-- Coefficient term 266 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0266 : Poly :=
[
  term ((381240 : Rat) / 32699) [(3, 1), (6, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 266 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0266 : Poly :=
[
  term ((762480 : Rat) / 32699) [(2, 1), (3, 1), (6, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-381240 : Rat) / 32699) [(3, 1), (6, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 266 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0266_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0266
        rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_10_0266 := by
  native_decide

/-- Coefficient term 267 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0267 : Poly :=
[
  term ((-2657672048 : Rat) / 33189485) [(3, 1), (6, 1), (10, 1), (13, 1), (15, 2)]
]

/-- Partial product 267 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0267 : Poly :=
[
  term ((-5315344096 : Rat) / 33189485) [(2, 1), (3, 1), (6, 1), (10, 1), (13, 1), (15, 2)],
  term ((2657672048 : Rat) / 33189485) [(3, 1), (6, 1), (10, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 267 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0267_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0267
        rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_10_0267 := by
  native_decide

/-- Coefficient term 268 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0268 : Poly :=
[
  term ((508320 : Rat) / 32699) [(3, 1), (6, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 268 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0268 : Poly :=
[
  term ((1016640 : Rat) / 32699) [(2, 1), (3, 1), (6, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-508320 : Rat) / 32699) [(3, 1), (6, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 268 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0268_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0268
        rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_10_0268 := by
  native_decide

/-- Coefficient term 269 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0269 : Poly :=
[
  term ((-166104503 : Rat) / 4741355) [(3, 1), (6, 1), (10, 1), (15, 1)]
]

/-- Partial product 269 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0269 : Poly :=
[
  term ((-332209006 : Rat) / 4741355) [(2, 1), (3, 1), (6, 1), (10, 1), (15, 1)],
  term ((166104503 : Rat) / 4741355) [(3, 1), (6, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 269 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0269_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0269
        rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_10_0269 := by
  native_decide

/-- Coefficient term 270 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0270 : Poly :=
[
  term ((222390 : Rat) / 32699) [(3, 1), (6, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 270 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0270 : Poly :=
[
  term ((444780 : Rat) / 32699) [(2, 1), (3, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((-222390 : Rat) / 32699) [(3, 1), (6, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 270 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0270_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0270
        rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_10_0270 := by
  native_decide

/-- Coefficient term 271 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0271 : Poly :=
[
  term ((664418012 : Rat) / 33189485) [(3, 1), (6, 1), (10, 1), (15, 3)]
]

/-- Partial product 271 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0271 : Poly :=
[
  term ((1328836024 : Rat) / 33189485) [(2, 1), (3, 1), (6, 1), (10, 1), (15, 3)],
  term ((-664418012 : Rat) / 33189485) [(3, 1), (6, 1), (10, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 271 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0271_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0271
        rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_10_0271 := by
  native_decide

/-- Coefficient term 272 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0272 : Poly :=
[
  term ((-127080 : Rat) / 32699) [(3, 1), (6, 1), (10, 1), (15, 3), (16, 1)]
]

/-- Partial product 272 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0272 : Poly :=
[
  term ((-254160 : Rat) / 32699) [(2, 1), (3, 1), (6, 1), (10, 1), (15, 3), (16, 1)],
  term ((127080 : Rat) / 32699) [(3, 1), (6, 1), (10, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 272 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0272_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0272
        rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_10_0272 := by
  native_decide

/-- Coefficient term 273 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0273 : Poly :=
[
  term ((15281614276 : Rat) / 33189485) [(3, 1), (6, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 273 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0273 : Poly :=
[
  term ((30563228552 : Rat) / 33189485) [(2, 1), (3, 1), (6, 1), (11, 1), (13, 1), (15, 1)],
  term ((-15281614276 : Rat) / 33189485) [(3, 1), (6, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 273 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0273_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0273
        rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_10_0273 := by
  native_decide

/-- Coefficient term 274 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0274 : Poly :=
[
  term ((-2922840 : Rat) / 32699) [(3, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 274 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0274 : Poly :=
[
  term ((-5845680 : Rat) / 32699) [(2, 1), (3, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((2922840 : Rat) / 32699) [(3, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 274 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0274_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0274
        rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_10_0274 := by
  native_decide

/-- Coefficient term 275 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0275 : Poly :=
[
  term ((-664418012 : Rat) / 948271) [(3, 1), (6, 1), (11, 1), (15, 2)]
]

/-- Partial product 275 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0275 : Poly :=
[
  term ((-1328836024 : Rat) / 948271) [(2, 1), (3, 1), (6, 1), (11, 1), (15, 2)],
  term ((664418012 : Rat) / 948271) [(3, 1), (6, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 275 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0275_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0275
        rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_10_0275 := by
  native_decide

/-- Coefficient term 276 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0276 : Poly :=
[
  term ((4447800 : Rat) / 32699) [(3, 1), (6, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 276 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0276 : Poly :=
[
  term ((8895600 : Rat) / 32699) [(2, 1), (3, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((-4447800 : Rat) / 32699) [(3, 1), (6, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 276 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0276_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0276
        rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_10_0276 := by
  native_decide

/-- Coefficient term 277 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0277 : Poly :=
[
  term ((-3986508072 : Rat) / 33189485) [(3, 1), (6, 1), (12, 1), (15, 1)]
]

/-- Partial product 277 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0277 : Poly :=
[
  term ((-7973016144 : Rat) / 33189485) [(2, 1), (3, 1), (6, 1), (12, 1), (15, 1)],
  term ((3986508072 : Rat) / 33189485) [(3, 1), (6, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 277 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0277_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0277
        rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_10_0277 := by
  native_decide

/-- Coefficient term 278 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0278 : Poly :=
[
  term ((762480 : Rat) / 32699) [(3, 1), (6, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 278 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0278 : Poly :=
[
  term ((1524960 : Rat) / 32699) [(2, 1), (3, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-762480 : Rat) / 32699) [(3, 1), (6, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 278 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0278_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0278
        rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_10_0278 := by
  native_decide

/-- Coefficient term 279 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0279 : Poly :=
[
  term ((-5315344096 : Rat) / 19913691) [(3, 1), (6, 1), (13, 1), (15, 2)]
]

/-- Partial product 279 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0279 : Poly :=
[
  term ((-10630688192 : Rat) / 19913691) [(2, 1), (3, 1), (6, 1), (13, 1), (15, 2)],
  term ((5315344096 : Rat) / 19913691) [(3, 1), (6, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 279 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0279_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0279
        rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_10_0279 := by
  native_decide

/-- Coefficient term 280 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0280 : Poly :=
[
  term ((1694400 : Rat) / 32699) [(3, 1), (6, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 280 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0280 : Poly :=
[
  term ((3388800 : Rat) / 32699) [(2, 1), (3, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1694400 : Rat) / 32699) [(3, 1), (6, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 280 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0280_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0280
        rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_10_0280 := by
  native_decide

/-- Coefficient term 281 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0281 : Poly :=
[
  term ((2657672048 : Rat) / 33189485) [(3, 1), (6, 1), (15, 1)]
]

/-- Partial product 281 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0281 : Poly :=
[
  term ((5315344096 : Rat) / 33189485) [(2, 1), (3, 1), (6, 1), (15, 1)],
  term ((-2657672048 : Rat) / 33189485) [(3, 1), (6, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 281 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0281_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0281
        rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_10_0281 := by
  native_decide

/-- Coefficient term 282 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0282 : Poly :=
[
  term ((-508320 : Rat) / 32699) [(3, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 282 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0282 : Poly :=
[
  term ((-1016640 : Rat) / 32699) [(2, 1), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((508320 : Rat) / 32699) [(3, 1), (6, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 282 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0282_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0282
        rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_10_0282 := by
  native_decide

/-- Coefficient term 283 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0283 : Poly :=
[
  term ((2657672048 : Rat) / 14224065) [(3, 1), (6, 1), (15, 3)]
]

/-- Partial product 283 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0283 : Poly :=
[
  term ((5315344096 : Rat) / 14224065) [(2, 1), (3, 1), (6, 1), (15, 3)],
  term ((-2657672048 : Rat) / 14224065) [(3, 1), (6, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 283 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0283_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0283
        rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_10_0283 := by
  native_decide

/-- Coefficient term 284 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0284 : Poly :=
[
  term ((-1186080 : Rat) / 32699) [(3, 1), (6, 1), (15, 3), (16, 1)]
]

/-- Partial product 284 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0284 : Poly :=
[
  term ((-2372160 : Rat) / 32699) [(2, 1), (3, 1), (6, 1), (15, 3), (16, 1)],
  term ((1186080 : Rat) / 32699) [(3, 1), (6, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 284 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0284_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0284
        rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_10_0284 := by
  native_decide

/-- Coefficient term 285 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0285 : Poly :=
[
  term ((-2657672048 : Rat) / 33189485) [(3, 1), (7, 1), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 285 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0285 : Poly :=
[
  term ((-5315344096 : Rat) / 33189485) [(2, 1), (3, 1), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((2657672048 : Rat) / 33189485) [(3, 1), (7, 1), (10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 285 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0285_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0285
        rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_10_0285 := by
  native_decide

/-- Coefficient term 286 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0286 : Poly :=
[
  term ((508320 : Rat) / 32699) [(3, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 286 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0286 : Poly :=
[
  term ((1016640 : Rat) / 32699) [(2, 1), (3, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-508320 : Rat) / 32699) [(3, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 286 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0286_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0286
        rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_10_0286 := by
  native_decide

/-- Coefficient term 287 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0287 : Poly :=
[
  term ((664418012 : Rat) / 33189485) [(3, 1), (7, 1), (10, 1), (15, 2)]
]

/-- Partial product 287 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0287 : Poly :=
[
  term ((1328836024 : Rat) / 33189485) [(2, 1), (3, 1), (7, 1), (10, 1), (15, 2)],
  term ((-664418012 : Rat) / 33189485) [(3, 1), (7, 1), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 287 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0287_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0287
        rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_10_0287 := by
  native_decide

/-- Coefficient term 288 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0288 : Poly :=
[
  term ((-127080 : Rat) / 32699) [(3, 1), (7, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 288 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0288 : Poly :=
[
  term ((-254160 : Rat) / 32699) [(2, 1), (3, 1), (7, 1), (10, 1), (15, 2), (16, 1)],
  term ((127080 : Rat) / 32699) [(3, 1), (7, 1), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 288 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0288_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0288
        rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_10_0288 := by
  native_decide

/-- Coefficient term 289 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0289 : Poly :=
[
  term ((-8637434156 : Rat) / 33189485) [(3, 1), (7, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 289 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0289 : Poly :=
[
  term ((-17274868312 : Rat) / 33189485) [(2, 1), (3, 1), (7, 1), (11, 1), (12, 1), (15, 1)],
  term ((8637434156 : Rat) / 33189485) [(3, 1), (7, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 289 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0289_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0289
        rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_10_0289 := by
  native_decide

/-- Coefficient term 290 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0290 : Poly :=
[
  term ((1652040 : Rat) / 32699) [(3, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 290 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0290 : Poly :=
[
  term ((3304080 : Rat) / 32699) [(2, 1), (3, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1652040 : Rat) / 32699) [(3, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 290 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0290_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0290
        rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_10_0290 := by
  native_decide

/-- Coefficient term 291 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0291 : Poly :=
[
  term ((-7973016144 : Rat) / 33189485) [(3, 1), (7, 1), (11, 1), (15, 1)]
]

/-- Partial product 291 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0291 : Poly :=
[
  term ((-15946032288 : Rat) / 33189485) [(2, 1), (3, 1), (7, 1), (11, 1), (15, 1)],
  term ((7973016144 : Rat) / 33189485) [(3, 1), (7, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 291 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0291_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0291
        rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_10_0291 := by
  native_decide

/-- Coefficient term 292 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0292 : Poly :=
[
  term ((1524960 : Rat) / 32699) [(3, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 292 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0292 : Poly :=
[
  term ((3049920 : Rat) / 32699) [(2, 1), (3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1524960 : Rat) / 32699) [(3, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 292 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0292_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0292
        rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_10_0292 := by
  native_decide

/-- Coefficient term 293 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0293 : Poly :=
[
  term ((-10630688192 : Rat) / 99568455) [(3, 1), (7, 1), (13, 1), (15, 1)]
]

/-- Partial product 293 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0293 : Poly :=
[
  term ((-21261376384 : Rat) / 99568455) [(2, 1), (3, 1), (7, 1), (13, 1), (15, 1)],
  term ((10630688192 : Rat) / 99568455) [(3, 1), (7, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 293 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0293_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0293
        rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_10_0293 := by
  native_decide

/-- Coefficient term 294 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0294 : Poly :=
[
  term ((677760 : Rat) / 32699) [(3, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 294 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0294 : Poly :=
[
  term ((1355520 : Rat) / 32699) [(2, 1), (3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-677760 : Rat) / 32699) [(3, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 294 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0294_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0294
        rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_10_0294 := by
  native_decide

/-- Coefficient term 295 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0295 : Poly :=
[
  term ((10630688192 : Rat) / 99568455) [(3, 1), (7, 1), (15, 2)]
]

/-- Partial product 295 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0295 : Poly :=
[
  term ((21261376384 : Rat) / 99568455) [(2, 1), (3, 1), (7, 1), (15, 2)],
  term ((-10630688192 : Rat) / 99568455) [(3, 1), (7, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 295 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0295_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0295
        rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_10_0295 := by
  native_decide

/-- Coefficient term 296 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0296 : Poly :=
[
  term ((-677760 : Rat) / 32699) [(3, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 296 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0296 : Poly :=
[
  term ((-1355520 : Rat) / 32699) [(2, 1), (3, 1), (7, 1), (15, 2), (16, 1)],
  term ((677760 : Rat) / 32699) [(3, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 296 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0296_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0296
        rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_10_0296 := by
  native_decide

/-- Coefficient term 297 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0297 : Poly :=
[
  term ((-15502696 : Rat) / 33189485) [(3, 1), (8, 1), (11, 1), (12, 1), (15, 2)]
]

/-- Partial product 297 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0297 : Poly :=
[
  term ((-31005392 : Rat) / 33189485) [(2, 1), (3, 1), (8, 1), (11, 1), (12, 1), (15, 2)],
  term ((15502696 : Rat) / 33189485) [(3, 1), (8, 1), (11, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 297 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0297_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0297
        rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_10_0297 := by
  native_decide

/-- Coefficient term 298 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0298 : Poly :=
[
  term ((2944 : Rat) / 32699) [(3, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 298 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0298 : Poly :=
[
  term ((5888 : Rat) / 32699) [(2, 1), (3, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-2944 : Rat) / 32699) [(3, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 298 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0298_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0298
        rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_10_0298 := by
  native_decide

/-- Coefficient term 299 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0299 : Poly :=
[
  term ((-7751348 : Rat) / 33189485) [(3, 1), (8, 1), (11, 1), (15, 2)]
]

/-- Partial product 299 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0299 : Poly :=
[
  term ((-15502696 : Rat) / 33189485) [(2, 1), (3, 1), (8, 1), (11, 1), (15, 2)],
  term ((7751348 : Rat) / 33189485) [(3, 1), (8, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 299 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0299_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0299
        rs_R009_ueqv_R009NYYYY_generator_10_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_10_0299 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NYYYY_partials_10_0200_0299 : List Poly :=
[
  rs_R009_ueqv_R009NYYYY_partial_10_0200,
  rs_R009_ueqv_R009NYYYY_partial_10_0201,
  rs_R009_ueqv_R009NYYYY_partial_10_0202,
  rs_R009_ueqv_R009NYYYY_partial_10_0203,
  rs_R009_ueqv_R009NYYYY_partial_10_0204,
  rs_R009_ueqv_R009NYYYY_partial_10_0205,
  rs_R009_ueqv_R009NYYYY_partial_10_0206,
  rs_R009_ueqv_R009NYYYY_partial_10_0207,
  rs_R009_ueqv_R009NYYYY_partial_10_0208,
  rs_R009_ueqv_R009NYYYY_partial_10_0209,
  rs_R009_ueqv_R009NYYYY_partial_10_0210,
  rs_R009_ueqv_R009NYYYY_partial_10_0211,
  rs_R009_ueqv_R009NYYYY_partial_10_0212,
  rs_R009_ueqv_R009NYYYY_partial_10_0213,
  rs_R009_ueqv_R009NYYYY_partial_10_0214,
  rs_R009_ueqv_R009NYYYY_partial_10_0215,
  rs_R009_ueqv_R009NYYYY_partial_10_0216,
  rs_R009_ueqv_R009NYYYY_partial_10_0217,
  rs_R009_ueqv_R009NYYYY_partial_10_0218,
  rs_R009_ueqv_R009NYYYY_partial_10_0219,
  rs_R009_ueqv_R009NYYYY_partial_10_0220,
  rs_R009_ueqv_R009NYYYY_partial_10_0221,
  rs_R009_ueqv_R009NYYYY_partial_10_0222,
  rs_R009_ueqv_R009NYYYY_partial_10_0223,
  rs_R009_ueqv_R009NYYYY_partial_10_0224,
  rs_R009_ueqv_R009NYYYY_partial_10_0225,
  rs_R009_ueqv_R009NYYYY_partial_10_0226,
  rs_R009_ueqv_R009NYYYY_partial_10_0227,
  rs_R009_ueqv_R009NYYYY_partial_10_0228,
  rs_R009_ueqv_R009NYYYY_partial_10_0229,
  rs_R009_ueqv_R009NYYYY_partial_10_0230,
  rs_R009_ueqv_R009NYYYY_partial_10_0231,
  rs_R009_ueqv_R009NYYYY_partial_10_0232,
  rs_R009_ueqv_R009NYYYY_partial_10_0233,
  rs_R009_ueqv_R009NYYYY_partial_10_0234,
  rs_R009_ueqv_R009NYYYY_partial_10_0235,
  rs_R009_ueqv_R009NYYYY_partial_10_0236,
  rs_R009_ueqv_R009NYYYY_partial_10_0237,
  rs_R009_ueqv_R009NYYYY_partial_10_0238,
  rs_R009_ueqv_R009NYYYY_partial_10_0239,
  rs_R009_ueqv_R009NYYYY_partial_10_0240,
  rs_R009_ueqv_R009NYYYY_partial_10_0241,
  rs_R009_ueqv_R009NYYYY_partial_10_0242,
  rs_R009_ueqv_R009NYYYY_partial_10_0243,
  rs_R009_ueqv_R009NYYYY_partial_10_0244,
  rs_R009_ueqv_R009NYYYY_partial_10_0245,
  rs_R009_ueqv_R009NYYYY_partial_10_0246,
  rs_R009_ueqv_R009NYYYY_partial_10_0247,
  rs_R009_ueqv_R009NYYYY_partial_10_0248,
  rs_R009_ueqv_R009NYYYY_partial_10_0249,
  rs_R009_ueqv_R009NYYYY_partial_10_0250,
  rs_R009_ueqv_R009NYYYY_partial_10_0251,
  rs_R009_ueqv_R009NYYYY_partial_10_0252,
  rs_R009_ueqv_R009NYYYY_partial_10_0253,
  rs_R009_ueqv_R009NYYYY_partial_10_0254,
  rs_R009_ueqv_R009NYYYY_partial_10_0255,
  rs_R009_ueqv_R009NYYYY_partial_10_0256,
  rs_R009_ueqv_R009NYYYY_partial_10_0257,
  rs_R009_ueqv_R009NYYYY_partial_10_0258,
  rs_R009_ueqv_R009NYYYY_partial_10_0259,
  rs_R009_ueqv_R009NYYYY_partial_10_0260,
  rs_R009_ueqv_R009NYYYY_partial_10_0261,
  rs_R009_ueqv_R009NYYYY_partial_10_0262,
  rs_R009_ueqv_R009NYYYY_partial_10_0263,
  rs_R009_ueqv_R009NYYYY_partial_10_0264,
  rs_R009_ueqv_R009NYYYY_partial_10_0265,
  rs_R009_ueqv_R009NYYYY_partial_10_0266,
  rs_R009_ueqv_R009NYYYY_partial_10_0267,
  rs_R009_ueqv_R009NYYYY_partial_10_0268,
  rs_R009_ueqv_R009NYYYY_partial_10_0269,
  rs_R009_ueqv_R009NYYYY_partial_10_0270,
  rs_R009_ueqv_R009NYYYY_partial_10_0271,
  rs_R009_ueqv_R009NYYYY_partial_10_0272,
  rs_R009_ueqv_R009NYYYY_partial_10_0273,
  rs_R009_ueqv_R009NYYYY_partial_10_0274,
  rs_R009_ueqv_R009NYYYY_partial_10_0275,
  rs_R009_ueqv_R009NYYYY_partial_10_0276,
  rs_R009_ueqv_R009NYYYY_partial_10_0277,
  rs_R009_ueqv_R009NYYYY_partial_10_0278,
  rs_R009_ueqv_R009NYYYY_partial_10_0279,
  rs_R009_ueqv_R009NYYYY_partial_10_0280,
  rs_R009_ueqv_R009NYYYY_partial_10_0281,
  rs_R009_ueqv_R009NYYYY_partial_10_0282,
  rs_R009_ueqv_R009NYYYY_partial_10_0283,
  rs_R009_ueqv_R009NYYYY_partial_10_0284,
  rs_R009_ueqv_R009NYYYY_partial_10_0285,
  rs_R009_ueqv_R009NYYYY_partial_10_0286,
  rs_R009_ueqv_R009NYYYY_partial_10_0287,
  rs_R009_ueqv_R009NYYYY_partial_10_0288,
  rs_R009_ueqv_R009NYYYY_partial_10_0289,
  rs_R009_ueqv_R009NYYYY_partial_10_0290,
  rs_R009_ueqv_R009NYYYY_partial_10_0291,
  rs_R009_ueqv_R009NYYYY_partial_10_0292,
  rs_R009_ueqv_R009NYYYY_partial_10_0293,
  rs_R009_ueqv_R009NYYYY_partial_10_0294,
  rs_R009_ueqv_R009NYYYY_partial_10_0295,
  rs_R009_ueqv_R009NYYYY_partial_10_0296,
  rs_R009_ueqv_R009NYYYY_partial_10_0297,
  rs_R009_ueqv_R009NYYYY_partial_10_0298,
  rs_R009_ueqv_R009NYYYY_partial_10_0299
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NYYYY_block_10_0200_0299 : Poly :=
[
  term ((-31005392 : Rat) / 6637897) [(2, 1), (3, 1), (4, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((29440 : Rat) / 32699) [(2, 1), (3, 1), (4, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((62010784 : Rat) / 19913691) [(2, 1), (3, 1), (4, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((-58880 : Rat) / 98097) [(2, 1), (3, 1), (4, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((263545832 : Rat) / 33189485) [(2, 1), (3, 1), (4, 1), (9, 1), (11, 1), (15, 1)],
  term ((-50048 : Rat) / 32699) [(2, 1), (3, 1), (4, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((128 : Rat) / 87) [(2, 1), (3, 1), (4, 1), (9, 1), (11, 1), (15, 3)],
  term ((-5 : Rat) / 2) [(2, 1), (3, 1), (4, 1), (9, 1), (12, 1)],
  term ((-80 : Rat) / 29) [(2, 1), (3, 1), (4, 1), (9, 1), (12, 1), (15, 2)],
  term ((-239 : Rat) / 87) [(2, 1), (3, 1), (4, 1), (9, 1), (13, 1), (15, 1)],
  term ((160 : Rat) / 87) [(2, 1), (3, 1), (4, 1), (9, 1), (13, 1), (15, 3)],
  term ((832 : Rat) / 87) [(2, 1), (3, 1), (4, 1), (9, 1), (15, 2)],
  term ((4092711744 : Rat) / 6637897) [(2, 1), (3, 1), (4, 1), (10, 1), (11, 1), (15, 2)],
  term ((-3886080 : Rat) / 32699) [(2, 1), (3, 1), (4, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((31892064576 : Rat) / 33189485) [(2, 1), (3, 1), (4, 1), (10, 1), (12, 1), (15, 1)],
  term ((-6099840 : Rat) / 32699) [(2, 1), (3, 1), (4, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-21261376384 : Rat) / 33189485) [(2, 1), (3, 1), (4, 1), (10, 1), (13, 1), (15, 2)],
  term ((4066560 : Rat) / 32699) [(2, 1), (3, 1), (4, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-863559471 : Rat) / 948271) [(2, 1), (3, 1), (4, 1), (10, 1), (15, 1)],
  term ((5761724 : Rat) / 32699) [(2, 1), (3, 1), (4, 1), (10, 1), (15, 1), (16, 1)],
  term ((5813511000 : Rat) / 6637897) [(2, 1), (3, 1), (4, 1), (11, 1), (12, 1), (15, 2)],
  term ((-5520000 : Rat) / 32699) [(2, 1), (3, 1), (4, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((8185423488 : Rat) / 6637897) [(2, 1), (3, 1), (4, 1), (11, 1), (13, 1), (15, 1)],
  term ((-7772160 : Rat) / 32699) [(2, 1), (3, 1), (4, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3875674000 : Rat) / 6637897) [(2, 1), (3, 1), (4, 1), (11, 1), (13, 1), (15, 3)],
  term ((3680000 : Rat) / 32699) [(2, 1), (3, 1), (4, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-94827871982 : Rat) / 33189485) [(2, 1), (3, 1), (4, 1), (11, 1), (15, 2)],
  term ((18025320 : Rat) / 32699) [(2, 1), (3, 1), (4, 1), (11, 1), (15, 2), (16, 1)],
  term ((-13766394048 : Rat) / 33189485) [(2, 1), (3, 1), (4, 1), (11, 2), (12, 1), (15, 1)],
  term ((2614272 : Rat) / 32699) [(2, 1), (3, 1), (4, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((9177596032 : Rat) / 33189485) [(2, 1), (3, 1), (4, 1), (11, 2), (13, 1), (15, 2)],
  term ((-1742848 : Rat) / 32699) [(2, 1), (3, 1), (4, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((2666463712 : Rat) / 6637897) [(2, 1), (3, 1), (4, 1), (11, 2), (15, 1)],
  term ((-2531840 : Rat) / 32699) [(2, 1), (3, 1), (4, 1), (11, 2), (15, 1), (16, 1)],
  term ((-2728474496 : Rat) / 6637897) [(2, 1), (3, 1), (4, 1), (11, 2), (15, 3)],
  term ((2590720 : Rat) / 32699) [(2, 1), (3, 1), (4, 1), (11, 2), (15, 3), (16, 1)],
  term ((-43027457307 : Rat) / 132757940) [(2, 1), (3, 1), (4, 1), (12, 1), (15, 1)],
  term ((1991966 : Rat) / 32699) [(2, 1), (3, 1), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((14342485769 : Rat) / 66378970) [(2, 1), (3, 1), (4, 1), (13, 1), (15, 2)],
  term ((-3983932 : Rat) / 98097) [(2, 1), (3, 1), (4, 1), (13, 1), (15, 2), (16, 1)],
  term ((109277810501 : Rat) / 265515880) [(2, 1), (3, 1), (4, 1), (15, 1)],
  term ((-2058623 : Rat) / 32699) [(2, 1), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((31 : Rat) / 10) [(2, 1), (3, 1), (5, 1)],
  term ((-124021568 : Rat) / 19913691) [(2, 1), (3, 1), (5, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((117760 : Rat) / 98097) [(2, 1), (3, 1), (5, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-256 : Rat) / 87) [(2, 1), (3, 1), (5, 1), (9, 1), (11, 1), (15, 2)],
  term ((128 : Rat) / 29) [(2, 1), (3, 1), (5, 1), (9, 1), (12, 1), (15, 1)],
  term ((-10 : Rat) / 3) [(2, 1), (3, 1), (5, 1), (9, 1), (13, 1)],
  term ((-320 : Rat) / 87) [(2, 1), (3, 1), (5, 1), (9, 1), (13, 1), (15, 2)],
  term ((-128 : Rat) / 87) [(2, 1), (3, 1), (5, 1), (9, 1), (15, 1)],
  term ((42522752768 : Rat) / 33189485) [(2, 1), (3, 1), (5, 1), (10, 1), (13, 1), (15, 1)],
  term ((-8133120 : Rat) / 32699) [(2, 1), (3, 1), (5, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-8162169444 : Rat) / 6637897) [(2, 1), (3, 1), (5, 1), (11, 1), (12, 1), (15, 1)],
  term ((7750080 : Rat) / 32699) [(2, 1), (3, 1), (5, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((7751348000 : Rat) / 6637897) [(2, 1), (3, 1), (5, 1), (11, 1), (13, 1), (15, 2)],
  term ((-7360000 : Rat) / 32699) [(2, 1), (3, 1), (5, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((18630001692 : Rat) / 33189485) [(2, 1), (3, 1), (5, 1), (11, 1), (15, 1)],
  term ((-3572432 : Rat) / 32699) [(2, 1), (3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-18355192064 : Rat) / 33189485) [(2, 1), (3, 1), (5, 1), (11, 2), (13, 1), (15, 1)],
  term ((3485696 : Rat) / 32699) [(2, 1), (3, 1), (5, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((5456948992 : Rat) / 6637897) [(2, 1), (3, 1), (5, 1), (11, 2), (15, 2)],
  term ((-5181440 : Rat) / 32699) [(2, 1), (3, 1), (5, 1), (11, 2), (15, 2), (16, 1)],
  term ((31 : Rat) / 10) [(2, 1), (3, 1), (5, 1), (12, 1)],
  term ((-14342485769 : Rat) / 33189485) [(2, 1), (3, 1), (5, 1), (13, 1), (15, 1)],
  term ((7967864 : Rat) / 98097) [(2, 1), (3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3986508072 : Rat) / 33189485) [(2, 1), (3, 1), (6, 1), (10, 1), (12, 1), (15, 1)],
  term ((762480 : Rat) / 32699) [(2, 1), (3, 1), (6, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-5315344096 : Rat) / 33189485) [(2, 1), (3, 1), (6, 1), (10, 1), (13, 1), (15, 2)],
  term ((1016640 : Rat) / 32699) [(2, 1), (3, 1), (6, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-332209006 : Rat) / 4741355) [(2, 1), (3, 1), (6, 1), (10, 1), (15, 1)],
  term ((444780 : Rat) / 32699) [(2, 1), (3, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((1328836024 : Rat) / 33189485) [(2, 1), (3, 1), (6, 1), (10, 1), (15, 3)],
  term ((-254160 : Rat) / 32699) [(2, 1), (3, 1), (6, 1), (10, 1), (15, 3), (16, 1)],
  term ((30563228552 : Rat) / 33189485) [(2, 1), (3, 1), (6, 1), (11, 1), (13, 1), (15, 1)],
  term ((-5845680 : Rat) / 32699) [(2, 1), (3, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1328836024 : Rat) / 948271) [(2, 1), (3, 1), (6, 1), (11, 1), (15, 2)],
  term ((8895600 : Rat) / 32699) [(2, 1), (3, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((-7973016144 : Rat) / 33189485) [(2, 1), (3, 1), (6, 1), (12, 1), (15, 1)],
  term ((1524960 : Rat) / 32699) [(2, 1), (3, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-10630688192 : Rat) / 19913691) [(2, 1), (3, 1), (6, 1), (13, 1), (15, 2)],
  term ((3388800 : Rat) / 32699) [(2, 1), (3, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((5315344096 : Rat) / 33189485) [(2, 1), (3, 1), (6, 1), (15, 1)],
  term ((-1016640 : Rat) / 32699) [(2, 1), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((5315344096 : Rat) / 14224065) [(2, 1), (3, 1), (6, 1), (15, 3)],
  term ((-2372160 : Rat) / 32699) [(2, 1), (3, 1), (6, 1), (15, 3), (16, 1)],
  term ((-5315344096 : Rat) / 33189485) [(2, 1), (3, 1), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((1016640 : Rat) / 32699) [(2, 1), (3, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((1328836024 : Rat) / 33189485) [(2, 1), (3, 1), (7, 1), (10, 1), (15, 2)],
  term ((-254160 : Rat) / 32699) [(2, 1), (3, 1), (7, 1), (10, 1), (15, 2), (16, 1)],
  term ((-17274868312 : Rat) / 33189485) [(2, 1), (3, 1), (7, 1), (11, 1), (12, 1), (15, 1)],
  term ((3304080 : Rat) / 32699) [(2, 1), (3, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-15946032288 : Rat) / 33189485) [(2, 1), (3, 1), (7, 1), (11, 1), (15, 1)],
  term ((3049920 : Rat) / 32699) [(2, 1), (3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-21261376384 : Rat) / 99568455) [(2, 1), (3, 1), (7, 1), (13, 1), (15, 1)],
  term ((1355520 : Rat) / 32699) [(2, 1), (3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((21261376384 : Rat) / 99568455) [(2, 1), (3, 1), (7, 1), (15, 2)],
  term ((-1355520 : Rat) / 32699) [(2, 1), (3, 1), (7, 1), (15, 2), (16, 1)],
  term ((-31005392 : Rat) / 33189485) [(2, 1), (3, 1), (8, 1), (11, 1), (12, 1), (15, 2)],
  term ((5888 : Rat) / 32699) [(2, 1), (3, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-15502696 : Rat) / 33189485) [(2, 1), (3, 1), (8, 1), (11, 1), (15, 2)],
  term ((15502696 : Rat) / 6637897) [(3, 1), (4, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((-14720 : Rat) / 32699) [(3, 1), (4, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-31005392 : Rat) / 19913691) [(3, 1), (4, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((29440 : Rat) / 98097) [(3, 1), (4, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-131772916 : Rat) / 33189485) [(3, 1), (4, 1), (9, 1), (11, 1), (15, 1)],
  term ((25024 : Rat) / 32699) [(3, 1), (4, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-64 : Rat) / 87) [(3, 1), (4, 1), (9, 1), (11, 1), (15, 3)],
  term ((5 : Rat) / 4) [(3, 1), (4, 1), (9, 1), (12, 1)],
  term ((40 : Rat) / 29) [(3, 1), (4, 1), (9, 1), (12, 1), (15, 2)],
  term ((239 : Rat) / 174) [(3, 1), (4, 1), (9, 1), (13, 1), (15, 1)],
  term ((-80 : Rat) / 87) [(3, 1), (4, 1), (9, 1), (13, 1), (15, 3)],
  term ((-416 : Rat) / 87) [(3, 1), (4, 1), (9, 1), (15, 2)],
  term ((-2046355872 : Rat) / 6637897) [(3, 1), (4, 1), (10, 1), (11, 1), (15, 2)],
  term ((1943040 : Rat) / 32699) [(3, 1), (4, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-15946032288 : Rat) / 33189485) [(3, 1), (4, 1), (10, 1), (12, 1), (15, 1)],
  term ((3049920 : Rat) / 32699) [(3, 1), (4, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((10630688192 : Rat) / 33189485) [(3, 1), (4, 1), (10, 1), (13, 1), (15, 2)],
  term ((-2033280 : Rat) / 32699) [(3, 1), (4, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((863559471 : Rat) / 1896542) [(3, 1), (4, 1), (10, 1), (15, 1)],
  term ((-2880862 : Rat) / 32699) [(3, 1), (4, 1), (10, 1), (15, 1), (16, 1)],
  term ((-2906755500 : Rat) / 6637897) [(3, 1), (4, 1), (11, 1), (12, 1), (15, 2)],
  term ((2760000 : Rat) / 32699) [(3, 1), (4, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-4092711744 : Rat) / 6637897) [(3, 1), (4, 1), (11, 1), (13, 1), (15, 1)],
  term ((3886080 : Rat) / 32699) [(3, 1), (4, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1937837000 : Rat) / 6637897) [(3, 1), (4, 1), (11, 1), (13, 1), (15, 3)],
  term ((-1840000 : Rat) / 32699) [(3, 1), (4, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((47413935991 : Rat) / 33189485) [(3, 1), (4, 1), (11, 1), (15, 2)],
  term ((-9012660 : Rat) / 32699) [(3, 1), (4, 1), (11, 1), (15, 2), (16, 1)],
  term ((6883197024 : Rat) / 33189485) [(3, 1), (4, 1), (11, 2), (12, 1), (15, 1)],
  term ((-1307136 : Rat) / 32699) [(3, 1), (4, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-4588798016 : Rat) / 33189485) [(3, 1), (4, 1), (11, 2), (13, 1), (15, 2)],
  term ((871424 : Rat) / 32699) [(3, 1), (4, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-1333231856 : Rat) / 6637897) [(3, 1), (4, 1), (11, 2), (15, 1)],
  term ((1265920 : Rat) / 32699) [(3, 1), (4, 1), (11, 2), (15, 1), (16, 1)],
  term ((1364237248 : Rat) / 6637897) [(3, 1), (4, 1), (11, 2), (15, 3)],
  term ((-1295360 : Rat) / 32699) [(3, 1), (4, 1), (11, 2), (15, 3), (16, 1)],
  term ((43027457307 : Rat) / 265515880) [(3, 1), (4, 1), (12, 1), (15, 1)],
  term ((-995983 : Rat) / 32699) [(3, 1), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((-14342485769 : Rat) / 132757940) [(3, 1), (4, 1), (13, 1), (15, 2)],
  term ((1991966 : Rat) / 98097) [(3, 1), (4, 1), (13, 1), (15, 2), (16, 1)],
  term ((-109277810501 : Rat) / 531031760) [(3, 1), (4, 1), (15, 1)],
  term ((2058623 : Rat) / 65398) [(3, 1), (4, 1), (15, 1), (16, 1)],
  term ((-31 : Rat) / 20) [(3, 1), (5, 1)],
  term ((62010784 : Rat) / 19913691) [(3, 1), (5, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-58880 : Rat) / 98097) [(3, 1), (5, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((128 : Rat) / 87) [(3, 1), (5, 1), (9, 1), (11, 1), (15, 2)],
  term ((-64 : Rat) / 29) [(3, 1), (5, 1), (9, 1), (12, 1), (15, 1)],
  term ((5 : Rat) / 3) [(3, 1), (5, 1), (9, 1), (13, 1)],
  term ((160 : Rat) / 87) [(3, 1), (5, 1), (9, 1), (13, 1), (15, 2)],
  term ((64 : Rat) / 87) [(3, 1), (5, 1), (9, 1), (15, 1)],
  term ((-21261376384 : Rat) / 33189485) [(3, 1), (5, 1), (10, 1), (13, 1), (15, 1)],
  term ((4066560 : Rat) / 32699) [(3, 1), (5, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((4081084722 : Rat) / 6637897) [(3, 1), (5, 1), (11, 1), (12, 1), (15, 1)],
  term ((-3875040 : Rat) / 32699) [(3, 1), (5, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3875674000 : Rat) / 6637897) [(3, 1), (5, 1), (11, 1), (13, 1), (15, 2)],
  term ((3680000 : Rat) / 32699) [(3, 1), (5, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-9315000846 : Rat) / 33189485) [(3, 1), (5, 1), (11, 1), (15, 1)],
  term ((1786216 : Rat) / 32699) [(3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((9177596032 : Rat) / 33189485) [(3, 1), (5, 1), (11, 2), (13, 1), (15, 1)],
  term ((-1742848 : Rat) / 32699) [(3, 1), (5, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2728474496 : Rat) / 6637897) [(3, 1), (5, 1), (11, 2), (15, 2)],
  term ((2590720 : Rat) / 32699) [(3, 1), (5, 1), (11, 2), (15, 2), (16, 1)],
  term ((-31 : Rat) / 20) [(3, 1), (5, 1), (12, 1)],
  term ((14342485769 : Rat) / 66378970) [(3, 1), (5, 1), (13, 1), (15, 1)],
  term ((-3983932 : Rat) / 98097) [(3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((1993254036 : Rat) / 33189485) [(3, 1), (6, 1), (10, 1), (12, 1), (15, 1)],
  term ((-381240 : Rat) / 32699) [(3, 1), (6, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((2657672048 : Rat) / 33189485) [(3, 1), (6, 1), (10, 1), (13, 1), (15, 2)],
  term ((-508320 : Rat) / 32699) [(3, 1), (6, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((166104503 : Rat) / 4741355) [(3, 1), (6, 1), (10, 1), (15, 1)],
  term ((-222390 : Rat) / 32699) [(3, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((-664418012 : Rat) / 33189485) [(3, 1), (6, 1), (10, 1), (15, 3)],
  term ((127080 : Rat) / 32699) [(3, 1), (6, 1), (10, 1), (15, 3), (16, 1)],
  term ((-15281614276 : Rat) / 33189485) [(3, 1), (6, 1), (11, 1), (13, 1), (15, 1)],
  term ((2922840 : Rat) / 32699) [(3, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((664418012 : Rat) / 948271) [(3, 1), (6, 1), (11, 1), (15, 2)],
  term ((-4447800 : Rat) / 32699) [(3, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((3986508072 : Rat) / 33189485) [(3, 1), (6, 1), (12, 1), (15, 1)],
  term ((-762480 : Rat) / 32699) [(3, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((5315344096 : Rat) / 19913691) [(3, 1), (6, 1), (13, 1), (15, 2)],
  term ((-1694400 : Rat) / 32699) [(3, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2657672048 : Rat) / 33189485) [(3, 1), (6, 1), (15, 1)],
  term ((508320 : Rat) / 32699) [(3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-2657672048 : Rat) / 14224065) [(3, 1), (6, 1), (15, 3)],
  term ((1186080 : Rat) / 32699) [(3, 1), (6, 1), (15, 3), (16, 1)],
  term ((2657672048 : Rat) / 33189485) [(3, 1), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((-508320 : Rat) / 32699) [(3, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-664418012 : Rat) / 33189485) [(3, 1), (7, 1), (10, 1), (15, 2)],
  term ((127080 : Rat) / 32699) [(3, 1), (7, 1), (10, 1), (15, 2), (16, 1)],
  term ((8637434156 : Rat) / 33189485) [(3, 1), (7, 1), (11, 1), (12, 1), (15, 1)],
  term ((-1652040 : Rat) / 32699) [(3, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((7973016144 : Rat) / 33189485) [(3, 1), (7, 1), (11, 1), (15, 1)],
  term ((-1524960 : Rat) / 32699) [(3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((10630688192 : Rat) / 99568455) [(3, 1), (7, 1), (13, 1), (15, 1)],
  term ((-677760 : Rat) / 32699) [(3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-10630688192 : Rat) / 99568455) [(3, 1), (7, 1), (15, 2)],
  term ((677760 : Rat) / 32699) [(3, 1), (7, 1), (15, 2), (16, 1)],
  term ((15502696 : Rat) / 33189485) [(3, 1), (8, 1), (11, 1), (12, 1), (15, 2)],
  term ((-2944 : Rat) / 32699) [(3, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((7751348 : Rat) / 33189485) [(3, 1), (8, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 10, terms 200 through 299. -/
theorem rs_R009_ueqv_R009NYYYY_block_10_0200_0299_valid :
    checkProductSumEq rs_R009_ueqv_R009NYYYY_partials_10_0200_0299
      rs_R009_ueqv_R009NYYYY_block_10_0200_0299 = true := by
  native_decide

end R009UeqvR009NYYYYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
