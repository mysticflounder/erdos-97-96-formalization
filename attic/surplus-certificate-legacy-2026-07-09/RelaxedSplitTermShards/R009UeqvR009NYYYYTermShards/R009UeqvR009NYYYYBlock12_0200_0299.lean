/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NYYYY, term block 12:200-299

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NYYYYTermShards

/-- Generator polynomial 12 for relaxed split surplus certificate `R009:u=v:R009NYYYY`. -/
def rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 : Poly :=
[
  term (2 : Rat) [(2, 1), (14, 1)],
  term (2 : Rat) [(3, 1), (15, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 200 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0200 : Poly :=
[
  term ((-413820513541 : Rat) / 1593095280) [(8, 1), (15, 2)]
]

/-- Partial product 200 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0200 : Poly :=
[
  term ((-413820513541 : Rat) / 796547640) [(2, 1), (8, 1), (14, 1), (15, 2)],
  term ((-413820513541 : Rat) / 796547640) [(3, 1), (8, 1), (15, 3)],
  term ((413820513541 : Rat) / 1593095280) [(8, 1), (14, 2), (15, 2)],
  term ((413820513541 : Rat) / 1593095280) [(8, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0200_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0200
        rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_12_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0201 : Poly :=
[
  term ((4919551 : Rat) / 98097) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 201 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0201 : Poly :=
[
  term ((9839102 : Rat) / 98097) [(2, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((9839102 : Rat) / 98097) [(3, 1), (8, 1), (15, 3), (16, 1)],
  term ((-4919551 : Rat) / 98097) [(8, 1), (14, 2), (15, 2), (16, 1)],
  term ((-4919551 : Rat) / 98097) [(8, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0201_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0201
        rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_12_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0202 : Poly :=
[
  term ((16 : Rat) / 29) [(9, 1), (10, 1), (13, 1), (15, 2)]
]

/-- Partial product 202 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0202 : Poly :=
[
  term ((32 : Rat) / 29) [(2, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((32 : Rat) / 29) [(3, 1), (9, 1), (10, 1), (13, 1), (15, 3)],
  term ((-16 : Rat) / 29) [(9, 1), (10, 1), (13, 1), (14, 2), (15, 2)],
  term ((-16 : Rat) / 29) [(9, 1), (10, 1), (13, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0202_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0202
        rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_12_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0203 : Poly :=
[
  term ((8 : Rat) / 29) [(9, 1), (10, 1), (15, 3)]
]

/-- Partial product 203 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0203 : Poly :=
[
  term ((16 : Rat) / 29) [(2, 1), (9, 1), (10, 1), (14, 1), (15, 3)],
  term ((16 : Rat) / 29) [(3, 1), (9, 1), (10, 1), (15, 4)],
  term ((-8 : Rat) / 29) [(9, 1), (10, 1), (14, 2), (15, 3)],
  term ((-8 : Rat) / 29) [(9, 1), (10, 1), (15, 5)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0203_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0203
        rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_12_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0204 : Poly :=
[
  term ((15502696 : Rat) / 6637897) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 204 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0204 : Poly :=
[
  term ((31005392 : Rat) / 6637897) [(2, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((31005392 : Rat) / 6637897) [(3, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-15502696 : Rat) / 6637897) [(9, 1), (11, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-15502696 : Rat) / 6637897) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0204_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0204
        rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_12_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0205 : Poly :=
[
  term ((-14720 : Rat) / 32699) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 205 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0205 : Poly :=
[
  term ((-29440 : Rat) / 32699) [(2, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-29440 : Rat) / 32699) [(3, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((14720 : Rat) / 32699) [(9, 1), (11, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((14720 : Rat) / 32699) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0205_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0205
        rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_12_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0206 : Poly :=
[
  term ((-5321314 : Rat) / 5240445) [(9, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 206 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0206 : Poly :=
[
  term ((-10642628 : Rat) / 5240445) [(2, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-10642628 : Rat) / 5240445) [(3, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((5321314 : Rat) / 5240445) [(9, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((5321314 : Rat) / 5240445) [(9, 1), (11, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0206_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0206
        rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_12_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0207 : Poly :=
[
  term ((736 : Rat) / 5163) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 207 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0207 : Poly :=
[
  term ((1472 : Rat) / 5163) [(2, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1472 : Rat) / 5163) [(3, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-736 : Rat) / 5163) [(9, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-736 : Rat) / 5163) [(9, 1), (11, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0207_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0207
        rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_12_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0208 : Poly :=
[
  term ((142746528 : Rat) / 33189485) [(9, 1), (11, 1), (13, 1), (15, 3)]
]

/-- Partial product 208 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0208 : Poly :=
[
  term ((285493056 : Rat) / 33189485) [(2, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 3)],
  term ((285493056 : Rat) / 33189485) [(3, 1), (9, 1), (11, 1), (13, 1), (15, 4)],
  term ((-142746528 : Rat) / 33189485) [(9, 1), (11, 1), (13, 1), (14, 2), (15, 3)],
  term ((-142746528 : Rat) / 33189485) [(9, 1), (11, 1), (13, 1), (15, 5)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0208_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0208
        rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_12_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0209 : Poly :=
[
  term ((-11776 : Rat) / 98097) [(9, 1), (11, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 209 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0209 : Poly :=
[
  term ((-23552 : Rat) / 98097) [(2, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-23552 : Rat) / 98097) [(3, 1), (9, 1), (11, 1), (13, 1), (15, 4), (16, 1)],
  term ((11776 : Rat) / 98097) [(9, 1), (11, 1), (13, 1), (14, 2), (15, 3), (16, 1)],
  term ((11776 : Rat) / 98097) [(9, 1), (11, 1), (13, 1), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0209_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0209
        rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_12_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0210 : Poly :=
[
  term ((31005392 : Rat) / 14224065) [(9, 1), (11, 1), (13, 2), (15, 2)]
]

/-- Partial product 210 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0210 : Poly :=
[
  term ((62010784 : Rat) / 14224065) [(2, 1), (9, 1), (11, 1), (13, 2), (14, 1), (15, 2)],
  term ((62010784 : Rat) / 14224065) [(3, 1), (9, 1), (11, 1), (13, 2), (15, 3)],
  term ((-31005392 : Rat) / 14224065) [(9, 1), (11, 1), (13, 2), (14, 2), (15, 2)],
  term ((-31005392 : Rat) / 14224065) [(9, 1), (11, 1), (13, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0210_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0210
        rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_12_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0211 : Poly :=
[
  term ((-41216 : Rat) / 98097) [(9, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 211 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0211 : Poly :=
[
  term ((-82432 : Rat) / 98097) [(2, 1), (9, 1), (11, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-82432 : Rat) / 98097) [(3, 1), (9, 1), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((41216 : Rat) / 98097) [(9, 1), (11, 1), (13, 2), (14, 2), (15, 2), (16, 1)],
  term ((41216 : Rat) / 98097) [(9, 1), (11, 1), (13, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0211_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0211
        rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_12_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0212 : Poly :=
[
  term ((31315532 : Rat) / 99568455) [(9, 1), (11, 1), (15, 2)]
]

/-- Partial product 212 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0212 : Poly :=
[
  term ((62631064 : Rat) / 99568455) [(2, 1), (9, 1), (11, 1), (14, 1), (15, 2)],
  term ((62631064 : Rat) / 99568455) [(3, 1), (9, 1), (11, 1), (15, 3)],
  term ((-31315532 : Rat) / 99568455) [(9, 1), (11, 1), (14, 2), (15, 2)],
  term ((-31315532 : Rat) / 99568455) [(9, 1), (11, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0212_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0212
        rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_12_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0213 : Poly :=
[
  term ((2944 : Rat) / 32699) [(9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 213 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0213 : Poly :=
[
  term ((5888 : Rat) / 32699) [(2, 1), (9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((5888 : Rat) / 32699) [(3, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((-2944 : Rat) / 32699) [(9, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((-2944 : Rat) / 32699) [(9, 1), (11, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0213_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0213
        rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_12_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0214 : Poly :=
[
  term ((-192999608 : Rat) / 99568455) [(9, 1), (11, 1), (15, 4)]
]

/-- Partial product 214 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0214 : Poly :=
[
  term ((-385999216 : Rat) / 99568455) [(2, 1), (9, 1), (11, 1), (14, 1), (15, 4)],
  term ((-385999216 : Rat) / 99568455) [(3, 1), (9, 1), (11, 1), (15, 5)],
  term ((192999608 : Rat) / 99568455) [(9, 1), (11, 1), (14, 2), (15, 4)],
  term ((192999608 : Rat) / 99568455) [(9, 1), (11, 1), (15, 6)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0214_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0214
        rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_12_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0215 : Poly :=
[
  term ((2944 : Rat) / 32699) [(9, 1), (11, 1), (15, 4), (16, 1)]
]

/-- Partial product 215 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0215 : Poly :=
[
  term ((5888 : Rat) / 32699) [(2, 1), (9, 1), (11, 1), (14, 1), (15, 4), (16, 1)],
  term ((5888 : Rat) / 32699) [(3, 1), (9, 1), (11, 1), (15, 5), (16, 1)],
  term ((-2944 : Rat) / 32699) [(9, 1), (11, 1), (14, 2), (15, 4), (16, 1)],
  term ((-2944 : Rat) / 32699) [(9, 1), (11, 1), (15, 6), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0215_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0215
        rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_12_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0216 : Poly :=
[
  term ((5 : Rat) / 4) [(9, 1), (12, 1), (13, 1)]
]

/-- Partial product 216 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0216 : Poly :=
[
  term ((5 : Rat) / 2) [(2, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((5 : Rat) / 2) [(3, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-5 : Rat) / 4) [(9, 1), (12, 1), (13, 1), (14, 2)],
  term ((-5 : Rat) / 4) [(9, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0216_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0216
        rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_12_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0217 : Poly :=
[
  term ((96 : Rat) / 29) [(9, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 217 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0217 : Poly :=
[
  term ((192 : Rat) / 29) [(2, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((192 : Rat) / 29) [(3, 1), (9, 1), (12, 1), (13, 1), (15, 3)],
  term ((-96 : Rat) / 29) [(9, 1), (12, 1), (13, 1), (14, 2), (15, 2)],
  term ((-96 : Rat) / 29) [(9, 1), (12, 1), (13, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0217_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0217
        rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_12_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0218 : Poly :=
[
  term ((-28 : Rat) / 29) [(9, 1), (12, 1), (15, 3)]
]

/-- Partial product 218 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0218 : Poly :=
[
  term ((-56 : Rat) / 29) [(2, 1), (9, 1), (12, 1), (14, 1), (15, 3)],
  term ((-56 : Rat) / 29) [(3, 1), (9, 1), (12, 1), (15, 4)],
  term ((28 : Rat) / 29) [(9, 1), (12, 1), (14, 2), (15, 3)],
  term ((28 : Rat) / 29) [(9, 1), (12, 1), (15, 5)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0218_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0218
        rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_12_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0219 : Poly :=
[
  term ((-19 : Rat) / 48) [(9, 1), (13, 1)]
]

/-- Partial product 219 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0219 : Poly :=
[
  term ((-19 : Rat) / 24) [(2, 1), (9, 1), (13, 1), (14, 1)],
  term ((-19 : Rat) / 24) [(3, 1), (9, 1), (13, 1), (15, 1)],
  term ((19 : Rat) / 48) [(9, 1), (13, 1), (14, 2)],
  term ((19 : Rat) / 48) [(9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0219_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0219
        rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_12_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0220 : Poly :=
[
  term ((325 : Rat) / 87) [(9, 1), (13, 1), (15, 2)]
]

/-- Partial product 220 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0220 : Poly :=
[
  term ((650 : Rat) / 87) [(2, 1), (9, 1), (13, 1), (14, 1), (15, 2)],
  term ((650 : Rat) / 87) [(3, 1), (9, 1), (13, 1), (15, 3)],
  term ((-325 : Rat) / 87) [(9, 1), (13, 1), (14, 2), (15, 2)],
  term ((-325 : Rat) / 87) [(9, 1), (13, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0220_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0220
        rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_12_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0221 : Poly :=
[
  term ((-160 : Rat) / 87) [(9, 1), (13, 1), (15, 4)]
]

/-- Partial product 221 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0221 : Poly :=
[
  term ((-320 : Rat) / 87) [(2, 1), (9, 1), (13, 1), (14, 1), (15, 4)],
  term ((-320 : Rat) / 87) [(3, 1), (9, 1), (13, 1), (15, 5)],
  term ((160 : Rat) / 87) [(9, 1), (13, 1), (14, 2), (15, 4)],
  term ((160 : Rat) / 87) [(9, 1), (13, 1), (15, 6)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0221_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0221
        rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_12_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0222 : Poly :=
[
  term ((-1381 : Rat) / 174) [(9, 1), (13, 2), (15, 1)]
]

/-- Partial product 222 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0222 : Poly :=
[
  term ((-1381 : Rat) / 87) [(2, 1), (9, 1), (13, 2), (14, 1), (15, 1)],
  term ((-1381 : Rat) / 87) [(3, 1), (9, 1), (13, 2), (15, 2)],
  term ((1381 : Rat) / 174) [(9, 1), (13, 2), (14, 2), (15, 1)],
  term ((1381 : Rat) / 174) [(9, 1), (13, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0222_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0222
        rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_12_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0223 : Poly :=
[
  term ((400 : Rat) / 87) [(9, 1), (13, 2), (15, 3)]
]

/-- Partial product 223 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0223 : Poly :=
[
  term ((800 : Rat) / 87) [(2, 1), (9, 1), (13, 2), (14, 1), (15, 3)],
  term ((800 : Rat) / 87) [(3, 1), (9, 1), (13, 2), (15, 4)],
  term ((-400 : Rat) / 87) [(9, 1), (13, 2), (14, 2), (15, 3)],
  term ((-400 : Rat) / 87) [(9, 1), (13, 2), (15, 5)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0223_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0223
        rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_12_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0224 : Poly :=
[
  term ((-35 : Rat) / 348) [(9, 1), (15, 1)]
]

/-- Partial product 224 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0224 : Poly :=
[
  term ((-35 : Rat) / 174) [(2, 1), (9, 1), (14, 1), (15, 1)],
  term ((-35 : Rat) / 174) [(3, 1), (9, 1), (15, 2)],
  term ((35 : Rat) / 348) [(9, 1), (14, 2), (15, 1)],
  term ((35 : Rat) / 348) [(9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0224_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0224
        rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_12_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0225 : Poly :=
[
  term ((-631 : Rat) / 348) [(9, 1), (15, 3)]
]

/-- Partial product 225 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0225 : Poly :=
[
  term ((-631 : Rat) / 174) [(2, 1), (9, 1), (14, 1), (15, 3)],
  term ((-631 : Rat) / 174) [(3, 1), (9, 1), (15, 4)],
  term ((631 : Rat) / 348) [(9, 1), (14, 2), (15, 3)],
  term ((631 : Rat) / 348) [(9, 1), (15, 5)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0225_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0225
        rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_12_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0226 : Poly :=
[
  term ((-744129408 : Rat) / 4741355) [(10, 1), (11, 1), (13, 1), (15, 2)]
]

/-- Partial product 226 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0226 : Poly :=
[
  term ((-1488258816 : Rat) / 4741355) [(2, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-1488258816 : Rat) / 4741355) [(3, 1), (10, 1), (11, 1), (13, 1), (15, 3)],
  term ((744129408 : Rat) / 4741355) [(10, 1), (11, 1), (13, 1), (14, 2), (15, 2)],
  term ((744129408 : Rat) / 4741355) [(10, 1), (11, 1), (13, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0226_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0226
        rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_12_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0227 : Poly :=
[
  term ((989184 : Rat) / 32699) [(10, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 227 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0227 : Poly :=
[
  term ((1978368 : Rat) / 32699) [(2, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1978368 : Rat) / 32699) [(3, 1), (10, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-989184 : Rat) / 32699) [(10, 1), (11, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-989184 : Rat) / 32699) [(10, 1), (11, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0227_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0227
        rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_12_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0228 : Poly :=
[
  term ((124021568 : Rat) / 33189485) [(10, 1), (11, 1), (15, 1)]
]

/-- Partial product 228 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0228 : Poly :=
[
  term ((248043136 : Rat) / 33189485) [(2, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((248043136 : Rat) / 33189485) [(3, 1), (10, 1), (11, 1), (15, 2)],
  term ((-124021568 : Rat) / 33189485) [(10, 1), (11, 1), (14, 2), (15, 1)],
  term ((-124021568 : Rat) / 33189485) [(10, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0228_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0228
        rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_12_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0229 : Poly :=
[
  term ((-23552 : Rat) / 32699) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 229 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0229 : Poly :=
[
  term ((-47104 : Rat) / 32699) [(2, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-47104 : Rat) / 32699) [(3, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((23552 : Rat) / 32699) [(10, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((23552 : Rat) / 32699) [(10, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0229_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0229
        rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_12_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0230 : Poly :=
[
  term ((-2542442144 : Rat) / 33189485) [(10, 1), (11, 1), (15, 3)]
]

/-- Partial product 230 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0230 : Poly :=
[
  term ((-5084884288 : Rat) / 33189485) [(2, 1), (10, 1), (11, 1), (14, 1), (15, 3)],
  term ((-5084884288 : Rat) / 33189485) [(3, 1), (10, 1), (11, 1), (15, 4)],
  term ((2542442144 : Rat) / 33189485) [(10, 1), (11, 1), (14, 2), (15, 3)],
  term ((2542442144 : Rat) / 33189485) [(10, 1), (11, 1), (15, 5)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0230_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0230
        rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_12_0230 := by
  native_decide

/-- Coefficient term 231 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0231 : Poly :=
[
  term ((482816 : Rat) / 32699) [(10, 1), (11, 1), (15, 3), (16, 1)]
]

/-- Partial product 231 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0231 : Poly :=
[
  term ((965632 : Rat) / 32699) [(2, 1), (10, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((965632 : Rat) / 32699) [(3, 1), (10, 1), (11, 1), (15, 4), (16, 1)],
  term ((-482816 : Rat) / 32699) [(10, 1), (11, 1), (14, 2), (15, 3), (16, 1)],
  term ((-482816 : Rat) / 32699) [(10, 1), (11, 1), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 231 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0231_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0231
        rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_12_0231 := by
  native_decide

/-- Coefficient term 232 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0232 : Poly :=
[
  term ((62010784 : Rat) / 33189485) [(10, 1), (11, 2), (13, 1), (15, 1)]
]

/-- Partial product 232 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0232 : Poly :=
[
  term ((124021568 : Rat) / 33189485) [(2, 1), (10, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((124021568 : Rat) / 33189485) [(3, 1), (10, 1), (11, 2), (13, 1), (15, 2)],
  term ((-62010784 : Rat) / 33189485) [(10, 1), (11, 2), (13, 1), (14, 2), (15, 1)],
  term ((-62010784 : Rat) / 33189485) [(10, 1), (11, 2), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 232 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0232_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0232
        rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_12_0232 := by
  native_decide

/-- Coefficient term 233 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0233 : Poly :=
[
  term ((-11776 : Rat) / 32699) [(10, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 233 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0233 : Poly :=
[
  term ((-23552 : Rat) / 32699) [(2, 1), (10, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-23552 : Rat) / 32699) [(3, 1), (10, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((11776 : Rat) / 32699) [(10, 1), (11, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((11776 : Rat) / 32699) [(10, 1), (11, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 233 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0233_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0233
        rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_12_0233 := by
  native_decide

/-- Coefficient term 234 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0234 : Poly :=
[
  term ((-31005392 : Rat) / 33189485) [(10, 1), (11, 2), (15, 2)]
]

/-- Partial product 234 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0234 : Poly :=
[
  term ((-62010784 : Rat) / 33189485) [(2, 1), (10, 1), (11, 2), (14, 1), (15, 2)],
  term ((-62010784 : Rat) / 33189485) [(3, 1), (10, 1), (11, 2), (15, 3)],
  term ((31005392 : Rat) / 33189485) [(10, 1), (11, 2), (14, 2), (15, 2)],
  term ((31005392 : Rat) / 33189485) [(10, 1), (11, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 234 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0234_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0234
        rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_12_0234 := by
  native_decide

/-- Coefficient term 235 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0235 : Poly :=
[
  term ((5888 : Rat) / 32699) [(10, 1), (11, 2), (15, 2), (16, 1)]
]

/-- Partial product 235 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0235 : Poly :=
[
  term ((11776 : Rat) / 32699) [(2, 1), (10, 1), (11, 2), (14, 1), (15, 2), (16, 1)],
  term ((11776 : Rat) / 32699) [(3, 1), (10, 1), (11, 2), (15, 3), (16, 1)],
  term ((-5888 : Rat) / 32699) [(10, 1), (11, 2), (14, 2), (15, 2), (16, 1)],
  term ((-5888 : Rat) / 32699) [(10, 1), (11, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 235 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0235_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0235
        rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_12_0235 := by
  native_decide

/-- Coefficient term 236 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0236 : Poly :=
[
  term ((-16942659306 : Rat) / 33189485) [(10, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 236 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0236 : Poly :=
[
  term ((-33885318612 : Rat) / 33189485) [(2, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-33885318612 : Rat) / 33189485) [(3, 1), (10, 1), (12, 1), (13, 1), (15, 2)],
  term ((16942659306 : Rat) / 33189485) [(10, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((16942659306 : Rat) / 33189485) [(10, 1), (12, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 236 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0236_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0236
        rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_12_0236 := by
  native_decide

/-- Coefficient term 237 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0237 : Poly :=
[
  term ((3240540 : Rat) / 32699) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 237 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0237 : Poly :=
[
  term ((6481080 : Rat) / 32699) [(2, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((6481080 : Rat) / 32699) [(3, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3240540 : Rat) / 32699) [(10, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3240540 : Rat) / 32699) [(10, 1), (12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 237 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0237_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0237
        rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_12_0237 := by
  native_decide

/-- Coefficient term 238 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0238 : Poly :=
[
  term ((498313509 : Rat) / 33189485) [(10, 1), (12, 1), (15, 2)]
]

/-- Partial product 238 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0238 : Poly :=
[
  term ((996627018 : Rat) / 33189485) [(2, 1), (10, 1), (12, 1), (14, 1), (15, 2)],
  term ((996627018 : Rat) / 33189485) [(3, 1), (10, 1), (12, 1), (15, 3)],
  term ((-498313509 : Rat) / 33189485) [(10, 1), (12, 1), (14, 2), (15, 2)],
  term ((-498313509 : Rat) / 33189485) [(10, 1), (12, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 238 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0238_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0238
        rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_12_0238 := by
  native_decide

/-- Coefficient term 239 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0239 : Poly :=
[
  term ((-95310 : Rat) / 32699) [(10, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 239 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0239 : Poly :=
[
  term ((-190620 : Rat) / 32699) [(2, 1), (10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-190620 : Rat) / 32699) [(3, 1), (10, 1), (12, 1), (15, 3), (16, 1)],
  term ((95310 : Rat) / 32699) [(10, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((95310 : Rat) / 32699) [(10, 1), (12, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 239 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0239_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0239
        rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_12_0239 := by
  native_decide

/-- Coefficient term 240 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0240 : Poly :=
[
  term ((-7211022069 : Rat) / 132757940) [(10, 1), (13, 1), (15, 1)]
]

/-- Partial product 240 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0240 : Poly :=
[
  term ((-7211022069 : Rat) / 66378970) [(2, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-7211022069 : Rat) / 66378970) [(3, 1), (10, 1), (13, 1), (15, 2)],
  term ((7211022069 : Rat) / 132757940) [(10, 1), (13, 1), (14, 2), (15, 1)],
  term ((7211022069 : Rat) / 132757940) [(10, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 240 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0240_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0240
        rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_12_0240 := by
  native_decide

/-- Coefficient term 241 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0241 : Poly :=
[
  term ((359245 : Rat) / 32699) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 241 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0241 : Poly :=
[
  term ((718490 : Rat) / 32699) [(2, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((718490 : Rat) / 32699) [(3, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-359245 : Rat) / 32699) [(10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-359245 : Rat) / 32699) [(10, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 241 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0241_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0241
        rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_12_0241 := by
  native_decide

/-- Coefficient term 242 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0242 : Poly :=
[
  term ((664418012 : Rat) / 1144465) [(10, 1), (13, 1), (15, 3)]
]

/-- Partial product 242 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0242 : Poly :=
[
  term ((1328836024 : Rat) / 1144465) [(2, 1), (10, 1), (13, 1), (14, 1), (15, 3)],
  term ((1328836024 : Rat) / 1144465) [(3, 1), (10, 1), (13, 1), (15, 4)],
  term ((-664418012 : Rat) / 1144465) [(10, 1), (13, 1), (14, 2), (15, 3)],
  term ((-664418012 : Rat) / 1144465) [(10, 1), (13, 1), (15, 5)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 242 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0242_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0242
        rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_12_0242 := by
  native_decide

/-- Coefficient term 243 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0243 : Poly :=
[
  term ((-3685320 : Rat) / 32699) [(10, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 243 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0243 : Poly :=
[
  term ((-7370640 : Rat) / 32699) [(2, 1), (10, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-7370640 : Rat) / 32699) [(3, 1), (10, 1), (13, 1), (15, 4), (16, 1)],
  term ((3685320 : Rat) / 32699) [(10, 1), (13, 1), (14, 2), (15, 3), (16, 1)],
  term ((3685320 : Rat) / 32699) [(10, 1), (13, 1), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 243 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0243_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0243
        rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_12_0243 := by
  native_decide

/-- Coefficient term 244 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0244 : Poly :=
[
  term ((-45844842828 : Rat) / 33189485) [(10, 1), (13, 2), (15, 2)]
]

/-- Partial product 244 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0244 : Poly :=
[
  term ((-91689685656 : Rat) / 33189485) [(2, 1), (10, 1), (13, 2), (14, 1), (15, 2)],
  term ((-91689685656 : Rat) / 33189485) [(3, 1), (10, 1), (13, 2), (15, 3)],
  term ((45844842828 : Rat) / 33189485) [(10, 1), (13, 2), (14, 2), (15, 2)],
  term ((45844842828 : Rat) / 33189485) [(10, 1), (13, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 244 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0244_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0244
        rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_12_0244 := by
  native_decide

/-- Coefficient term 245 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0245 : Poly :=
[
  term ((8768520 : Rat) / 32699) [(10, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 245 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0245 : Poly :=
[
  term ((17537040 : Rat) / 32699) [(2, 1), (10, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((17537040 : Rat) / 32699) [(3, 1), (10, 1), (13, 2), (15, 3), (16, 1)],
  term ((-8768520 : Rat) / 32699) [(10, 1), (13, 2), (14, 2), (15, 2), (16, 1)],
  term ((-8768520 : Rat) / 32699) [(10, 1), (13, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 245 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0245_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0245
        rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_12_0245 := by
  native_decide

/-- Coefficient term 246 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0246 : Poly :=
[
  term ((-7973016144 : Rat) / 33189485) [(10, 1), (13, 3), (15, 1)]
]

/-- Partial product 246 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0246 : Poly :=
[
  term ((-15946032288 : Rat) / 33189485) [(2, 1), (10, 1), (13, 3), (14, 1), (15, 1)],
  term ((-15946032288 : Rat) / 33189485) [(3, 1), (10, 1), (13, 3), (15, 2)],
  term ((7973016144 : Rat) / 33189485) [(10, 1), (13, 3), (14, 2), (15, 1)],
  term ((7973016144 : Rat) / 33189485) [(10, 1), (13, 3), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 246 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0246_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0246
        rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_12_0246 := by
  native_decide

/-- Coefficient term 247 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0247 : Poly :=
[
  term ((1524960 : Rat) / 32699) [(10, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 247 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0247 : Poly :=
[
  term ((3049920 : Rat) / 32699) [(2, 1), (10, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((3049920 : Rat) / 32699) [(3, 1), (10, 1), (13, 3), (15, 2), (16, 1)],
  term ((-1524960 : Rat) / 32699) [(10, 1), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((-1524960 : Rat) / 32699) [(10, 1), (13, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 247 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0247_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0247
        rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_12_0247 := by
  native_decide

/-- Coefficient term 248 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0248 : Poly :=
[
  term ((1404345055 : Rat) / 53103176) [(10, 1), (15, 2)]
]

/-- Partial product 248 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0248 : Poly :=
[
  term ((1404345055 : Rat) / 26551588) [(2, 1), (10, 1), (14, 1), (15, 2)],
  term ((1404345055 : Rat) / 26551588) [(3, 1), (10, 1), (15, 3)],
  term ((-1404345055 : Rat) / 53103176) [(10, 1), (14, 2), (15, 2)],
  term ((-1404345055 : Rat) / 53103176) [(10, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 248 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0248_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0248
        rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_12_0248 := by
  native_decide

/-- Coefficient term 249 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0249 : Poly :=
[
  term ((-333247 : Rat) / 65398) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 249 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0249 : Poly :=
[
  term ((-333247 : Rat) / 32699) [(2, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-333247 : Rat) / 32699) [(3, 1), (10, 1), (15, 3), (16, 1)],
  term ((333247 : Rat) / 65398) [(10, 1), (14, 2), (15, 2), (16, 1)],
  term ((333247 : Rat) / 65398) [(10, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 249 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0249_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0249
        rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_12_0249 := by
  native_decide

/-- Coefficient term 250 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0250 : Poly :=
[
  term ((166104503 : Rat) / 33189485) [(10, 1), (15, 4)]
]

/-- Partial product 250 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0250 : Poly :=
[
  term ((332209006 : Rat) / 33189485) [(2, 1), (10, 1), (14, 1), (15, 4)],
  term ((332209006 : Rat) / 33189485) [(3, 1), (10, 1), (15, 5)],
  term ((-166104503 : Rat) / 33189485) [(10, 1), (14, 2), (15, 4)],
  term ((-166104503 : Rat) / 33189485) [(10, 1), (15, 6)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 250 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0250_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0250
        rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_12_0250 := by
  native_decide

/-- Coefficient term 251 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0251 : Poly :=
[
  term ((-31770 : Rat) / 32699) [(10, 1), (15, 4), (16, 1)]
]

/-- Partial product 251 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0251 : Poly :=
[
  term ((-63540 : Rat) / 32699) [(2, 1), (10, 1), (14, 1), (15, 4), (16, 1)],
  term ((-63540 : Rat) / 32699) [(3, 1), (10, 1), (15, 5), (16, 1)],
  term ((31770 : Rat) / 32699) [(10, 1), (14, 2), (15, 4), (16, 1)],
  term ((31770 : Rat) / 32699) [(10, 1), (15, 6), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 251 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0251_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0251
        rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_12_0251 := by
  native_decide

/-- Coefficient term 252 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0252 : Poly :=
[
  term ((-6464624232 : Rat) / 6637897) [(11, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 252 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0252 : Poly :=
[
  term ((-12929248464 : Rat) / 6637897) [(2, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-12929248464 : Rat) / 6637897) [(3, 1), (11, 1), (12, 1), (13, 1), (15, 3)],
  term ((6464624232 : Rat) / 6637897) [(11, 1), (12, 1), (13, 1), (14, 2), (15, 2)],
  term ((6464624232 : Rat) / 6637897) [(11, 1), (12, 1), (13, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 252 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0252_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0252
        rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_12_0252 := by
  native_decide

/-- Coefficient term 253 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0253 : Poly :=
[
  term ((6138240 : Rat) / 32699) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 253 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0253 : Poly :=
[
  term ((12276480 : Rat) / 32699) [(2, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((12276480 : Rat) / 32699) [(3, 1), (11, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-6138240 : Rat) / 32699) [(11, 1), (12, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-6138240 : Rat) / 32699) [(11, 1), (12, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 253 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0253_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0253
        rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_12_0253 := by
  native_decide

/-- Coefficient term 254 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0254 : Poly :=
[
  term ((8867542112 : Rat) / 33189485) [(11, 1), (12, 1), (15, 3)]
]

/-- Partial product 254 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0254 : Poly :=
[
  term ((17735084224 : Rat) / 33189485) [(2, 1), (11, 1), (12, 1), (14, 1), (15, 3)],
  term ((17735084224 : Rat) / 33189485) [(3, 1), (11, 1), (12, 1), (15, 4)],
  term ((-8867542112 : Rat) / 33189485) [(11, 1), (12, 1), (14, 2), (15, 3)],
  term ((-8867542112 : Rat) / 33189485) [(11, 1), (12, 1), (15, 5)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 254 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0254_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0254
        rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_12_0254 := by
  native_decide

/-- Coefficient term 255 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0255 : Poly :=
[
  term ((-1683968 : Rat) / 32699) [(11, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 255 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0255 : Poly :=
[
  term ((-3367936 : Rat) / 32699) [(2, 1), (11, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-3367936 : Rat) / 32699) [(3, 1), (11, 1), (12, 1), (15, 4), (16, 1)],
  term ((1683968 : Rat) / 32699) [(11, 1), (12, 1), (14, 2), (15, 3), (16, 1)],
  term ((1683968 : Rat) / 32699) [(11, 1), (12, 1), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 255 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0255_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0255
        rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_12_0255 := by
  native_decide

/-- Coefficient term 256 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0256 : Poly :=
[
  term ((29610594575 : Rat) / 39827382) [(11, 1), (13, 1), (15, 2)]
]

/-- Partial product 256 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0256 : Poly :=
[
  term ((29610594575 : Rat) / 19913691) [(2, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((29610594575 : Rat) / 19913691) [(3, 1), (11, 1), (13, 1), (15, 3)],
  term ((-29610594575 : Rat) / 39827382) [(11, 1), (13, 1), (14, 2), (15, 2)],
  term ((-29610594575 : Rat) / 39827382) [(11, 1), (13, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 256 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0256_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0256
        rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_12_0256 := by
  native_decide

/-- Coefficient term 257 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0257 : Poly :=
[
  term ((-13921472 : Rat) / 98097) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 257 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0257 : Poly :=
[
  term ((-27842944 : Rat) / 98097) [(2, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-27842944 : Rat) / 98097) [(3, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((13921472 : Rat) / 98097) [(11, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((13921472 : Rat) / 98097) [(11, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 257 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0257_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0257
        rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_12_0257 := by
  native_decide

/-- Coefficient term 258 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0258 : Poly :=
[
  term ((3875674000 : Rat) / 6637897) [(11, 1), (13, 1), (15, 4)]
]

/-- Partial product 258 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0258 : Poly :=
[
  term ((7751348000 : Rat) / 6637897) [(2, 1), (11, 1), (13, 1), (14, 1), (15, 4)],
  term ((7751348000 : Rat) / 6637897) [(3, 1), (11, 1), (13, 1), (15, 5)],
  term ((-3875674000 : Rat) / 6637897) [(11, 1), (13, 1), (14, 2), (15, 4)],
  term ((-3875674000 : Rat) / 6637897) [(11, 1), (13, 1), (15, 6)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 258 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0258_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0258
        rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_12_0258 := by
  native_decide

/-- Coefficient term 259 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0259 : Poly :=
[
  term ((-3680000 : Rat) / 32699) [(11, 1), (13, 1), (15, 4), (16, 1)]
]

/-- Partial product 259 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0259 : Poly :=
[
  term ((-7360000 : Rat) / 32699) [(2, 1), (11, 1), (13, 1), (14, 1), (15, 4), (16, 1)],
  term ((-7360000 : Rat) / 32699) [(3, 1), (11, 1), (13, 1), (15, 5), (16, 1)],
  term ((3680000 : Rat) / 32699) [(11, 1), (13, 1), (14, 2), (15, 4), (16, 1)],
  term ((3680000 : Rat) / 32699) [(11, 1), (13, 1), (15, 6), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 259 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0259_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0259
        rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_12_0259 := by
  native_decide

/-- Coefficient term 260 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0260 : Poly :=
[
  term ((-75795128468 : Rat) / 33189485) [(11, 1), (13, 2), (15, 1)]
]

/-- Partial product 260 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0260 : Poly :=
[
  term ((-151590256936 : Rat) / 33189485) [(2, 1), (11, 1), (13, 2), (14, 1), (15, 1)],
  term ((-151590256936 : Rat) / 33189485) [(3, 1), (11, 1), (13, 2), (15, 2)],
  term ((75795128468 : Rat) / 33189485) [(11, 1), (13, 2), (14, 2), (15, 1)],
  term ((75795128468 : Rat) / 33189485) [(11, 1), (13, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 260 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0260_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0260
        rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_12_0260 := by
  native_decide

/-- Coefficient term 261 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0261 : Poly :=
[
  term ((14466112 : Rat) / 32699) [(11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 261 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0261 : Poly :=
[
  term ((28932224 : Rat) / 32699) [(2, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((28932224 : Rat) / 32699) [(3, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-14466112 : Rat) / 32699) [(11, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-14466112 : Rat) / 32699) [(11, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 261 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0261_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0261
        rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_12_0261 := by
  native_decide

/-- Coefficient term 262 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0262 : Poly :=
[
  term ((-9689185000 : Rat) / 6637897) [(11, 1), (13, 2), (15, 3)]
]

/-- Partial product 262 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0262 : Poly :=
[
  term ((-19378370000 : Rat) / 6637897) [(2, 1), (11, 1), (13, 2), (14, 1), (15, 3)],
  term ((-19378370000 : Rat) / 6637897) [(3, 1), (11, 1), (13, 2), (15, 4)],
  term ((9689185000 : Rat) / 6637897) [(11, 1), (13, 2), (14, 2), (15, 3)],
  term ((9689185000 : Rat) / 6637897) [(11, 1), (13, 2), (15, 5)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 262 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0262_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0262
        rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_12_0262 := by
  native_decide

/-- Coefficient term 263 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0263 : Poly :=
[
  term ((9200000 : Rat) / 32699) [(11, 1), (13, 2), (15, 3), (16, 1)]
]

/-- Partial product 263 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0263 : Poly :=
[
  term ((18400000 : Rat) / 32699) [(2, 1), (11, 1), (13, 2), (14, 1), (15, 3), (16, 1)],
  term ((18400000 : Rat) / 32699) [(3, 1), (11, 1), (13, 2), (15, 4), (16, 1)],
  term ((-9200000 : Rat) / 32699) [(11, 1), (13, 2), (14, 2), (15, 3), (16, 1)],
  term ((-9200000 : Rat) / 32699) [(11, 1), (13, 2), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 263 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0263_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0263
        rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_12_0263 := by
  native_decide

/-- Coefficient term 264 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0264 : Poly :=
[
  term ((-134853541099 : Rat) / 398273820) [(11, 1), (15, 1)]
]

/-- Partial product 264 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0264 : Poly :=
[
  term ((-134853541099 : Rat) / 199136910) [(2, 1), (11, 1), (14, 1), (15, 1)],
  term ((-134853541099 : Rat) / 199136910) [(3, 1), (11, 1), (15, 2)],
  term ((134853541099 : Rat) / 398273820) [(11, 1), (14, 2), (15, 1)],
  term ((134853541099 : Rat) / 398273820) [(11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 264 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0264_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0264
        rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_12_0264 := by
  native_decide

/-- Coefficient term 265 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0265 : Poly :=
[
  term ((6473554 : Rat) / 98097) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 265 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0265 : Poly :=
[
  term ((12947108 : Rat) / 98097) [(2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((12947108 : Rat) / 98097) [(3, 1), (11, 1), (15, 2), (16, 1)],
  term ((-6473554 : Rat) / 98097) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-6473554 : Rat) / 98097) [(11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 265 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0265_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0265
        rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_12_0265 := by
  native_decide

/-- Coefficient term 266 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0266 : Poly :=
[
  term ((80499338629 : Rat) / 132757940) [(11, 1), (15, 3)]
]

/-- Partial product 266 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0266 : Poly :=
[
  term ((80499338629 : Rat) / 66378970) [(2, 1), (11, 1), (14, 1), (15, 3)],
  term ((80499338629 : Rat) / 66378970) [(3, 1), (11, 1), (15, 4)],
  term ((-80499338629 : Rat) / 132757940) [(11, 1), (14, 2), (15, 3)],
  term ((-80499338629 : Rat) / 132757940) [(11, 1), (15, 5)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 266 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0266_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0266
        rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_12_0266 := by
  native_decide

/-- Coefficient term 267 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0267 : Poly :=
[
  term ((-3853742 : Rat) / 32699) [(11, 1), (15, 3), (16, 1)]
]

/-- Partial product 267 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0267 : Poly :=
[
  term ((-7707484 : Rat) / 32699) [(2, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((-7707484 : Rat) / 32699) [(3, 1), (11, 1), (15, 4), (16, 1)],
  term ((3853742 : Rat) / 32699) [(11, 1), (14, 2), (15, 3), (16, 1)],
  term ((3853742 : Rat) / 32699) [(11, 1), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 267 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0267_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0267
        rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_12_0267 := by
  native_decide

/-- Coefficient term 268 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0268 : Poly :=
[
  term ((1023177936 : Rat) / 4741355) [(11, 2), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 268 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0268 : Poly :=
[
  term ((2046355872 : Rat) / 4741355) [(2, 1), (11, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((2046355872 : Rat) / 4741355) [(3, 1), (11, 2), (12, 1), (13, 1), (15, 2)],
  term ((-1023177936 : Rat) / 4741355) [(11, 2), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-1023177936 : Rat) / 4741355) [(11, 2), (12, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 268 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0268_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0268
        rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_12_0268 := by
  native_decide

/-- Coefficient term 269 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0269 : Poly :=
[
  term ((-1360128 : Rat) / 32699) [(11, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 269 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0269 : Poly :=
[
  term ((-2720256 : Rat) / 32699) [(2, 1), (11, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2720256 : Rat) / 32699) [(3, 1), (11, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((1360128 : Rat) / 32699) [(11, 2), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((1360128 : Rat) / 32699) [(11, 2), (12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 269 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0269_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0269
        rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_12_0269 := by
  native_decide

/-- Coefficient term 270 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0270 : Poly :=
[
  term ((15502696 : Rat) / 6637897) [(11, 2), (12, 1), (15, 2)]
]

/-- Partial product 270 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0270 : Poly :=
[
  term ((31005392 : Rat) / 6637897) [(2, 1), (11, 2), (12, 1), (14, 1), (15, 2)],
  term ((31005392 : Rat) / 6637897) [(3, 1), (11, 2), (12, 1), (15, 3)],
  term ((-15502696 : Rat) / 6637897) [(11, 2), (12, 1), (14, 2), (15, 2)],
  term ((-15502696 : Rat) / 6637897) [(11, 2), (12, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 270 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0270_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0270
        rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_12_0270 := by
  native_decide

/-- Coefficient term 271 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0271 : Poly :=
[
  term ((-14720 : Rat) / 32699) [(11, 2), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 271 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0271 : Poly :=
[
  term ((-29440 : Rat) / 32699) [(2, 1), (11, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-29440 : Rat) / 32699) [(3, 1), (11, 2), (12, 1), (15, 3), (16, 1)],
  term ((14720 : Rat) / 32699) [(11, 2), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((14720 : Rat) / 32699) [(11, 2), (12, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 271 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0271_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0271
        rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_12_0271 := by
  native_decide

/-- Coefficient term 272 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0272 : Poly :=
[
  term ((-4736073628 : Rat) / 33189485) [(11, 2), (13, 1), (15, 1)]
]

/-- Partial product 272 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0272 : Poly :=
[
  term ((-9472147256 : Rat) / 33189485) [(2, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-9472147256 : Rat) / 33189485) [(3, 1), (11, 2), (13, 1), (15, 2)],
  term ((4736073628 : Rat) / 33189485) [(11, 2), (13, 1), (14, 2), (15, 1)],
  term ((4736073628 : Rat) / 33189485) [(11, 2), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 272 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0272_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0272
        rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_12_0272 := by
  native_decide

/-- Coefficient term 273 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0273 : Poly :=
[
  term ((899392 : Rat) / 32699) [(11, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 273 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0273 : Poly :=
[
  term ((1798784 : Rat) / 32699) [(2, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1798784 : Rat) / 32699) [(3, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-899392 : Rat) / 32699) [(11, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-899392 : Rat) / 32699) [(11, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 273 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0273_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0273
        rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_12_0273 := by
  native_decide

/-- Coefficient term 274 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0274 : Poly :=
[
  term ((-43469559584 : Rat) / 33189485) [(11, 2), (13, 1), (15, 3)]
]

/-- Partial product 274 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0274 : Poly :=
[
  term ((-86939119168 : Rat) / 33189485) [(2, 1), (11, 2), (13, 1), (14, 1), (15, 3)],
  term ((-86939119168 : Rat) / 33189485) [(3, 1), (11, 2), (13, 1), (15, 4)],
  term ((43469559584 : Rat) / 33189485) [(11, 2), (13, 1), (14, 2), (15, 3)],
  term ((43469559584 : Rat) / 33189485) [(11, 2), (13, 1), (15, 5)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 274 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0274_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0274
        rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_12_0274 := by
  native_decide

/-- Coefficient term 275 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0275 : Poly :=
[
  term ((8254976 : Rat) / 32699) [(11, 2), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 275 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0275 : Poly :=
[
  term ((16509952 : Rat) / 32699) [(2, 1), (11, 2), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((16509952 : Rat) / 32699) [(3, 1), (11, 2), (13, 1), (15, 4), (16, 1)],
  term ((-8254976 : Rat) / 32699) [(11, 2), (13, 1), (14, 2), (15, 3), (16, 1)],
  term ((-8254976 : Rat) / 32699) [(11, 2), (13, 1), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 275 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0275_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0275
        rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_12_0275 := by
  native_decide

/-- Coefficient term 276 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0276 : Poly :=
[
  term ((23502087136 : Rat) / 33189485) [(11, 2), (13, 2), (15, 2)]
]

/-- Partial product 276 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0276 : Poly :=
[
  term ((47004174272 : Rat) / 33189485) [(2, 1), (11, 2), (13, 2), (14, 1), (15, 2)],
  term ((47004174272 : Rat) / 33189485) [(3, 1), (11, 2), (13, 2), (15, 3)],
  term ((-23502087136 : Rat) / 33189485) [(11, 2), (13, 2), (14, 2), (15, 2)],
  term ((-23502087136 : Rat) / 33189485) [(11, 2), (13, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 276 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0276_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0276
        rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_12_0276 := by
  native_decide

/-- Coefficient term 277 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0277 : Poly :=
[
  term ((-4463104 : Rat) / 32699) [(11, 2), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 277 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0277 : Poly :=
[
  term ((-8926208 : Rat) / 32699) [(2, 1), (11, 2), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-8926208 : Rat) / 32699) [(3, 1), (11, 2), (13, 2), (15, 3), (16, 1)],
  term ((4463104 : Rat) / 32699) [(11, 2), (13, 2), (14, 2), (15, 2), (16, 1)],
  term ((4463104 : Rat) / 32699) [(11, 2), (13, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 277 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0277_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0277
        rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_12_0277 := by
  native_decide

/-- Coefficient term 278 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0278 : Poly :=
[
  term ((-6460748558 : Rat) / 33189485) [(11, 2), (15, 2)]
]

/-- Partial product 278 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0278 : Poly :=
[
  term ((-12921497116 : Rat) / 33189485) [(2, 1), (11, 2), (14, 1), (15, 2)],
  term ((-12921497116 : Rat) / 33189485) [(3, 1), (11, 2), (15, 3)],
  term ((6460748558 : Rat) / 33189485) [(11, 2), (14, 2), (15, 2)],
  term ((6460748558 : Rat) / 33189485) [(11, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 278 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0278_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0278
        rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_12_0278 := by
  native_decide

/-- Coefficient term 279 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0279 : Poly :=
[
  term ((1226912 : Rat) / 32699) [(11, 2), (15, 2), (16, 1)]
]

/-- Partial product 279 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0279 : Poly :=
[
  term ((2453824 : Rat) / 32699) [(2, 1), (11, 2), (14, 1), (15, 2), (16, 1)],
  term ((2453824 : Rat) / 32699) [(3, 1), (11, 2), (15, 3), (16, 1)],
  term ((-1226912 : Rat) / 32699) [(11, 2), (14, 2), (15, 2), (16, 1)],
  term ((-1226912 : Rat) / 32699) [(11, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 279 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0279_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0279
        rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_12_0279 := by
  native_decide

/-- Coefficient term 280 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0280 : Poly :=
[
  term ((13657875176 : Rat) / 33189485) [(11, 2), (15, 4)]
]

/-- Partial product 280 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0280 : Poly :=
[
  term ((27315750352 : Rat) / 33189485) [(2, 1), (11, 2), (14, 1), (15, 4)],
  term ((27315750352 : Rat) / 33189485) [(3, 1), (11, 2), (15, 5)],
  term ((-13657875176 : Rat) / 33189485) [(11, 2), (14, 2), (15, 4)],
  term ((-13657875176 : Rat) / 33189485) [(11, 2), (15, 6)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 280 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0280_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0280
        rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_12_0280 := by
  native_decide

/-- Coefficient term 281 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0281 : Poly :=
[
  term ((-2593664 : Rat) / 32699) [(11, 2), (15, 4), (16, 1)]
]

/-- Partial product 281 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0281 : Poly :=
[
  term ((-5187328 : Rat) / 32699) [(2, 1), (11, 2), (14, 1), (15, 4), (16, 1)],
  term ((-5187328 : Rat) / 32699) [(3, 1), (11, 2), (15, 5), (16, 1)],
  term ((2593664 : Rat) / 32699) [(11, 2), (14, 2), (15, 4), (16, 1)],
  term ((2593664 : Rat) / 32699) [(11, 2), (15, 6), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 281 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0281_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0281
        rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_12_0281 := by
  native_decide

/-- Coefficient term 282 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0282 : Poly :=
[
  term ((124021568 : Rat) / 6637897) [(11, 3), (13, 1), (15, 2)]
]

/-- Partial product 282 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0282 : Poly :=
[
  term ((248043136 : Rat) / 6637897) [(2, 1), (11, 3), (13, 1), (14, 1), (15, 2)],
  term ((248043136 : Rat) / 6637897) [(3, 1), (11, 3), (13, 1), (15, 3)],
  term ((-124021568 : Rat) / 6637897) [(11, 3), (13, 1), (14, 2), (15, 2)],
  term ((-124021568 : Rat) / 6637897) [(11, 3), (13, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 282 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0282_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0282
        rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_12_0282 := by
  native_decide

/-- Coefficient term 283 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0283 : Poly :=
[
  term ((-117760 : Rat) / 32699) [(11, 3), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 283 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0283 : Poly :=
[
  term ((-235520 : Rat) / 32699) [(2, 1), (11, 3), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-235520 : Rat) / 32699) [(3, 1), (11, 3), (13, 1), (15, 3), (16, 1)],
  term ((117760 : Rat) / 32699) [(11, 3), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((117760 : Rat) / 32699) [(11, 3), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 283 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0283_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0283
        rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_12_0283 := by
  native_decide

/-- Coefficient term 284 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0284 : Poly :=
[
  term ((-1488258816 : Rat) / 33189485) [(11, 3), (13, 2), (15, 1)]
]

/-- Partial product 284 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0284 : Poly :=
[
  term ((-2976517632 : Rat) / 33189485) [(2, 1), (11, 3), (13, 2), (14, 1), (15, 1)],
  term ((-2976517632 : Rat) / 33189485) [(3, 1), (11, 3), (13, 2), (15, 2)],
  term ((1488258816 : Rat) / 33189485) [(11, 3), (13, 2), (14, 2), (15, 1)],
  term ((1488258816 : Rat) / 33189485) [(11, 3), (13, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 284 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0284_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0284
        rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_12_0284 := by
  native_decide

/-- Coefficient term 285 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0285 : Poly :=
[
  term ((282624 : Rat) / 32699) [(11, 3), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 285 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0285 : Poly :=
[
  term ((565248 : Rat) / 32699) [(2, 1), (11, 3), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((565248 : Rat) / 32699) [(3, 1), (11, 3), (13, 2), (15, 2), (16, 1)],
  term ((-282624 : Rat) / 32699) [(11, 3), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-282624 : Rat) / 32699) [(11, 3), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 285 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0285_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0285
        rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_12_0285 := by
  native_decide

/-- Coefficient term 286 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0286 : Poly :=
[
  term ((-31005392 : Rat) / 33189485) [(11, 3), (15, 1)]
]

/-- Partial product 286 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0286 : Poly :=
[
  term ((-62010784 : Rat) / 33189485) [(2, 1), (11, 3), (14, 1), (15, 1)],
  term ((-62010784 : Rat) / 33189485) [(3, 1), (11, 3), (15, 2)],
  term ((31005392 : Rat) / 33189485) [(11, 3), (14, 2), (15, 1)],
  term ((31005392 : Rat) / 33189485) [(11, 3), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 286 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0286_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0286
        rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_12_0286 := by
  native_decide

/-- Coefficient term 287 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0287 : Poly :=
[
  term ((5888 : Rat) / 32699) [(11, 3), (15, 1), (16, 1)]
]

/-- Partial product 287 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0287 : Poly :=
[
  term ((11776 : Rat) / 32699) [(2, 1), (11, 3), (14, 1), (15, 1), (16, 1)],
  term ((11776 : Rat) / 32699) [(3, 1), (11, 3), (15, 2), (16, 1)],
  term ((-5888 : Rat) / 32699) [(11, 3), (14, 2), (15, 1), (16, 1)],
  term ((-5888 : Rat) / 32699) [(11, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 287 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0287_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0287
        rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_12_0287 := by
  native_decide

/-- Coefficient term 288 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0288 : Poly :=
[
  term ((-62010784 : Rat) / 33189485) [(11, 3), (15, 3)]
]

/-- Partial product 288 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0288 : Poly :=
[
  term ((-124021568 : Rat) / 33189485) [(2, 1), (11, 3), (14, 1), (15, 3)],
  term ((-124021568 : Rat) / 33189485) [(3, 1), (11, 3), (15, 4)],
  term ((62010784 : Rat) / 33189485) [(11, 3), (14, 2), (15, 3)],
  term ((62010784 : Rat) / 33189485) [(11, 3), (15, 5)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 288 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0288_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0288
        rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_12_0288 := by
  native_decide

/-- Coefficient term 289 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0289 : Poly :=
[
  term ((11776 : Rat) / 32699) [(11, 3), (15, 3), (16, 1)]
]

/-- Partial product 289 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0289 : Poly :=
[
  term ((23552 : Rat) / 32699) [(2, 1), (11, 3), (14, 1), (15, 3), (16, 1)],
  term ((23552 : Rat) / 32699) [(3, 1), (11, 3), (15, 4), (16, 1)],
  term ((-11776 : Rat) / 32699) [(11, 3), (14, 2), (15, 3), (16, 1)],
  term ((-11776 : Rat) / 32699) [(11, 3), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 289 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0289_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0289
        rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_12_0289 := by
  native_decide

/-- Coefficient term 290 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0290 : Poly :=
[
  term ((-41 : Rat) / 160) [(12, 1)]
]

/-- Partial product 290 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0290 : Poly :=
[
  term ((-41 : Rat) / 80) [(2, 1), (12, 1), (14, 1)],
  term ((-41 : Rat) / 80) [(3, 1), (12, 1), (15, 1)],
  term ((41 : Rat) / 160) [(12, 1), (14, 2)],
  term ((41 : Rat) / 160) [(12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 290 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0290_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0290
        rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_12_0290 := by
  native_decide

/-- Coefficient term 291 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0291 : Poly :=
[
  term ((-36200041559 : Rat) / 265515880) [(12, 1), (13, 1), (15, 1)]
]

/-- Partial product 291 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0291 : Poly :=
[
  term ((-36200041559 : Rat) / 132757940) [(2, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-36200041559 : Rat) / 132757940) [(3, 1), (12, 1), (13, 1), (15, 2)],
  term ((36200041559 : Rat) / 265515880) [(12, 1), (13, 1), (14, 2), (15, 1)],
  term ((36200041559 : Rat) / 265515880) [(12, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 291 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0291_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0291
        rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_12_0291 := by
  native_decide

/-- Coefficient term 292 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0292 : Poly :=
[
  term ((911377 : Rat) / 32699) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 292 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0292 : Poly :=
[
  term ((1822754 : Rat) / 32699) [(2, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1822754 : Rat) / 32699) [(3, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-911377 : Rat) / 32699) [(12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-911377 : Rat) / 32699) [(12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 292 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0292_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0292
        rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_12_0292 := by
  native_decide

/-- Coefficient term 293 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0293 : Poly :=
[
  term ((123 : Rat) / 10) [(12, 1), (13, 2)]
]

/-- Partial product 293 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0293 : Poly :=
[
  term ((123 : Rat) / 5) [(2, 1), (12, 1), (13, 2), (14, 1)],
  term ((123 : Rat) / 5) [(3, 1), (12, 1), (13, 2), (15, 1)],
  term ((-123 : Rat) / 10) [(12, 1), (13, 2), (14, 2)],
  term ((-123 : Rat) / 10) [(12, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 293 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0293_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0293
        rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_12_0293 := by
  native_decide

/-- Coefficient term 294 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0294 : Poly :=
[
  term ((104291444869 : Rat) / 1593095280) [(12, 1), (15, 2)]
]

/-- Partial product 294 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0294 : Poly :=
[
  term ((104291444869 : Rat) / 796547640) [(2, 1), (12, 1), (14, 1), (15, 2)],
  term ((104291444869 : Rat) / 796547640) [(3, 1), (12, 1), (15, 3)],
  term ((-104291444869 : Rat) / 1593095280) [(12, 1), (14, 2), (15, 2)],
  term ((-104291444869 : Rat) / 1593095280) [(12, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 294 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0294_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0294
        rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_12_0294 := by
  native_decide

/-- Coefficient term 295 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0295 : Poly :=
[
  term ((-2631617 : Rat) / 196194) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 295 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0295 : Poly :=
[
  term ((-2631617 : Rat) / 98097) [(2, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2631617 : Rat) / 98097) [(3, 1), (12, 1), (15, 3), (16, 1)],
  term ((2631617 : Rat) / 196194) [(12, 1), (14, 2), (15, 2), (16, 1)],
  term ((2631617 : Rat) / 196194) [(12, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 295 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0295_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0295
        rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_12_0295 := by
  native_decide

/-- Coefficient term 296 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0296 : Poly :=
[
  term ((45022108009 : Rat) / 1062063520) [(13, 1), (15, 1)]
]

/-- Partial product 296 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0296 : Poly :=
[
  term ((45022108009 : Rat) / 531031760) [(2, 1), (13, 1), (14, 1), (15, 1)],
  term ((45022108009 : Rat) / 531031760) [(3, 1), (13, 1), (15, 2)],
  term ((-45022108009 : Rat) / 1062063520) [(13, 1), (14, 2), (15, 1)],
  term ((-45022108009 : Rat) / 1062063520) [(13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 296 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0296_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0296
        rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_12_0296 := by
  native_decide

/-- Coefficient term 297 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0297 : Poly :=
[
  term ((-4655725 : Rat) / 392388) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 297 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0297 : Poly :=
[
  term ((-4655725 : Rat) / 196194) [(2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4655725 : Rat) / 196194) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((4655725 : Rat) / 392388) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((4655725 : Rat) / 392388) [(13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 297 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0297_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0297
        rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_12_0297 := by
  native_decide

/-- Coefficient term 298 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0298 : Poly :=
[
  term ((-4527808529 : Rat) / 4577860) [(13, 1), (15, 3)]
]

/-- Partial product 298 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0298 : Poly :=
[
  term ((-4527808529 : Rat) / 2288930) [(2, 1), (13, 1), (14, 1), (15, 3)],
  term ((-4527808529 : Rat) / 2288930) [(3, 1), (13, 1), (15, 4)],
  term ((4527808529 : Rat) / 4577860) [(13, 1), (14, 2), (15, 3)],
  term ((4527808529 : Rat) / 4577860) [(13, 1), (15, 5)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 298 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0298_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0298
        rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_12_0298 := by
  native_decide

/-- Coefficient term 299 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYYY_coefficient_12_0299 : Poly :=
[
  term ((18686218 : Rat) / 98097) [(13, 1), (15, 3), (16, 1)]
]

/-- Partial product 299 for generator 12. -/
def rs_R009_ueqv_R009NYYYY_partial_12_0299 : Poly :=
[
  term ((37372436 : Rat) / 98097) [(2, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((37372436 : Rat) / 98097) [(3, 1), (13, 1), (15, 4), (16, 1)],
  term ((-18686218 : Rat) / 98097) [(13, 1), (14, 2), (15, 3), (16, 1)],
  term ((-18686218 : Rat) / 98097) [(13, 1), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 299 for generator 12. -/
theorem rs_R009_ueqv_R009NYYYY_partial_12_0299_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_12_0299
        rs_R009_ueqv_R009NYYYY_generator_12_0200_0299 =
      rs_R009_ueqv_R009NYYYY_partial_12_0299 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NYYYY_partials_12_0200_0299 : List Poly :=
[
  rs_R009_ueqv_R009NYYYY_partial_12_0200,
  rs_R009_ueqv_R009NYYYY_partial_12_0201,
  rs_R009_ueqv_R009NYYYY_partial_12_0202,
  rs_R009_ueqv_R009NYYYY_partial_12_0203,
  rs_R009_ueqv_R009NYYYY_partial_12_0204,
  rs_R009_ueqv_R009NYYYY_partial_12_0205,
  rs_R009_ueqv_R009NYYYY_partial_12_0206,
  rs_R009_ueqv_R009NYYYY_partial_12_0207,
  rs_R009_ueqv_R009NYYYY_partial_12_0208,
  rs_R009_ueqv_R009NYYYY_partial_12_0209,
  rs_R009_ueqv_R009NYYYY_partial_12_0210,
  rs_R009_ueqv_R009NYYYY_partial_12_0211,
  rs_R009_ueqv_R009NYYYY_partial_12_0212,
  rs_R009_ueqv_R009NYYYY_partial_12_0213,
  rs_R009_ueqv_R009NYYYY_partial_12_0214,
  rs_R009_ueqv_R009NYYYY_partial_12_0215,
  rs_R009_ueqv_R009NYYYY_partial_12_0216,
  rs_R009_ueqv_R009NYYYY_partial_12_0217,
  rs_R009_ueqv_R009NYYYY_partial_12_0218,
  rs_R009_ueqv_R009NYYYY_partial_12_0219,
  rs_R009_ueqv_R009NYYYY_partial_12_0220,
  rs_R009_ueqv_R009NYYYY_partial_12_0221,
  rs_R009_ueqv_R009NYYYY_partial_12_0222,
  rs_R009_ueqv_R009NYYYY_partial_12_0223,
  rs_R009_ueqv_R009NYYYY_partial_12_0224,
  rs_R009_ueqv_R009NYYYY_partial_12_0225,
  rs_R009_ueqv_R009NYYYY_partial_12_0226,
  rs_R009_ueqv_R009NYYYY_partial_12_0227,
  rs_R009_ueqv_R009NYYYY_partial_12_0228,
  rs_R009_ueqv_R009NYYYY_partial_12_0229,
  rs_R009_ueqv_R009NYYYY_partial_12_0230,
  rs_R009_ueqv_R009NYYYY_partial_12_0231,
  rs_R009_ueqv_R009NYYYY_partial_12_0232,
  rs_R009_ueqv_R009NYYYY_partial_12_0233,
  rs_R009_ueqv_R009NYYYY_partial_12_0234,
  rs_R009_ueqv_R009NYYYY_partial_12_0235,
  rs_R009_ueqv_R009NYYYY_partial_12_0236,
  rs_R009_ueqv_R009NYYYY_partial_12_0237,
  rs_R009_ueqv_R009NYYYY_partial_12_0238,
  rs_R009_ueqv_R009NYYYY_partial_12_0239,
  rs_R009_ueqv_R009NYYYY_partial_12_0240,
  rs_R009_ueqv_R009NYYYY_partial_12_0241,
  rs_R009_ueqv_R009NYYYY_partial_12_0242,
  rs_R009_ueqv_R009NYYYY_partial_12_0243,
  rs_R009_ueqv_R009NYYYY_partial_12_0244,
  rs_R009_ueqv_R009NYYYY_partial_12_0245,
  rs_R009_ueqv_R009NYYYY_partial_12_0246,
  rs_R009_ueqv_R009NYYYY_partial_12_0247,
  rs_R009_ueqv_R009NYYYY_partial_12_0248,
  rs_R009_ueqv_R009NYYYY_partial_12_0249,
  rs_R009_ueqv_R009NYYYY_partial_12_0250,
  rs_R009_ueqv_R009NYYYY_partial_12_0251,
  rs_R009_ueqv_R009NYYYY_partial_12_0252,
  rs_R009_ueqv_R009NYYYY_partial_12_0253,
  rs_R009_ueqv_R009NYYYY_partial_12_0254,
  rs_R009_ueqv_R009NYYYY_partial_12_0255,
  rs_R009_ueqv_R009NYYYY_partial_12_0256,
  rs_R009_ueqv_R009NYYYY_partial_12_0257,
  rs_R009_ueqv_R009NYYYY_partial_12_0258,
  rs_R009_ueqv_R009NYYYY_partial_12_0259,
  rs_R009_ueqv_R009NYYYY_partial_12_0260,
  rs_R009_ueqv_R009NYYYY_partial_12_0261,
  rs_R009_ueqv_R009NYYYY_partial_12_0262,
  rs_R009_ueqv_R009NYYYY_partial_12_0263,
  rs_R009_ueqv_R009NYYYY_partial_12_0264,
  rs_R009_ueqv_R009NYYYY_partial_12_0265,
  rs_R009_ueqv_R009NYYYY_partial_12_0266,
  rs_R009_ueqv_R009NYYYY_partial_12_0267,
  rs_R009_ueqv_R009NYYYY_partial_12_0268,
  rs_R009_ueqv_R009NYYYY_partial_12_0269,
  rs_R009_ueqv_R009NYYYY_partial_12_0270,
  rs_R009_ueqv_R009NYYYY_partial_12_0271,
  rs_R009_ueqv_R009NYYYY_partial_12_0272,
  rs_R009_ueqv_R009NYYYY_partial_12_0273,
  rs_R009_ueqv_R009NYYYY_partial_12_0274,
  rs_R009_ueqv_R009NYYYY_partial_12_0275,
  rs_R009_ueqv_R009NYYYY_partial_12_0276,
  rs_R009_ueqv_R009NYYYY_partial_12_0277,
  rs_R009_ueqv_R009NYYYY_partial_12_0278,
  rs_R009_ueqv_R009NYYYY_partial_12_0279,
  rs_R009_ueqv_R009NYYYY_partial_12_0280,
  rs_R009_ueqv_R009NYYYY_partial_12_0281,
  rs_R009_ueqv_R009NYYYY_partial_12_0282,
  rs_R009_ueqv_R009NYYYY_partial_12_0283,
  rs_R009_ueqv_R009NYYYY_partial_12_0284,
  rs_R009_ueqv_R009NYYYY_partial_12_0285,
  rs_R009_ueqv_R009NYYYY_partial_12_0286,
  rs_R009_ueqv_R009NYYYY_partial_12_0287,
  rs_R009_ueqv_R009NYYYY_partial_12_0288,
  rs_R009_ueqv_R009NYYYY_partial_12_0289,
  rs_R009_ueqv_R009NYYYY_partial_12_0290,
  rs_R009_ueqv_R009NYYYY_partial_12_0291,
  rs_R009_ueqv_R009NYYYY_partial_12_0292,
  rs_R009_ueqv_R009NYYYY_partial_12_0293,
  rs_R009_ueqv_R009NYYYY_partial_12_0294,
  rs_R009_ueqv_R009NYYYY_partial_12_0295,
  rs_R009_ueqv_R009NYYYY_partial_12_0296,
  rs_R009_ueqv_R009NYYYY_partial_12_0297,
  rs_R009_ueqv_R009NYYYY_partial_12_0298,
  rs_R009_ueqv_R009NYYYY_partial_12_0299
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NYYYY_block_12_0200_0299 : Poly :=
[
  term ((-413820513541 : Rat) / 796547640) [(2, 1), (8, 1), (14, 1), (15, 2)],
  term ((9839102 : Rat) / 98097) [(2, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((32 : Rat) / 29) [(2, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((16 : Rat) / 29) [(2, 1), (9, 1), (10, 1), (14, 1), (15, 3)],
  term ((31005392 : Rat) / 6637897) [(2, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-29440 : Rat) / 32699) [(2, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10642628 : Rat) / 5240445) [(2, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((1472 : Rat) / 5163) [(2, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((285493056 : Rat) / 33189485) [(2, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 3)],
  term ((-23552 : Rat) / 98097) [(2, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((62010784 : Rat) / 14224065) [(2, 1), (9, 1), (11, 1), (13, 2), (14, 1), (15, 2)],
  term ((-82432 : Rat) / 98097) [(2, 1), (9, 1), (11, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((62631064 : Rat) / 99568455) [(2, 1), (9, 1), (11, 1), (14, 1), (15, 2)],
  term ((5888 : Rat) / 32699) [(2, 1), (9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-385999216 : Rat) / 99568455) [(2, 1), (9, 1), (11, 1), (14, 1), (15, 4)],
  term ((5888 : Rat) / 32699) [(2, 1), (9, 1), (11, 1), (14, 1), (15, 4), (16, 1)],
  term ((5 : Rat) / 2) [(2, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((192 : Rat) / 29) [(2, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-56 : Rat) / 29) [(2, 1), (9, 1), (12, 1), (14, 1), (15, 3)],
  term ((-19 : Rat) / 24) [(2, 1), (9, 1), (13, 1), (14, 1)],
  term ((650 : Rat) / 87) [(2, 1), (9, 1), (13, 1), (14, 1), (15, 2)],
  term ((-320 : Rat) / 87) [(2, 1), (9, 1), (13, 1), (14, 1), (15, 4)],
  term ((-1381 : Rat) / 87) [(2, 1), (9, 1), (13, 2), (14, 1), (15, 1)],
  term ((800 : Rat) / 87) [(2, 1), (9, 1), (13, 2), (14, 1), (15, 3)],
  term ((-35 : Rat) / 174) [(2, 1), (9, 1), (14, 1), (15, 1)],
  term ((-631 : Rat) / 174) [(2, 1), (9, 1), (14, 1), (15, 3)],
  term ((-1488258816 : Rat) / 4741355) [(2, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((1978368 : Rat) / 32699) [(2, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((248043136 : Rat) / 33189485) [(2, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-47104 : Rat) / 32699) [(2, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5084884288 : Rat) / 33189485) [(2, 1), (10, 1), (11, 1), (14, 1), (15, 3)],
  term ((965632 : Rat) / 32699) [(2, 1), (10, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((124021568 : Rat) / 33189485) [(2, 1), (10, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-23552 : Rat) / 32699) [(2, 1), (10, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-62010784 : Rat) / 33189485) [(2, 1), (10, 1), (11, 2), (14, 1), (15, 2)],
  term ((11776 : Rat) / 32699) [(2, 1), (10, 1), (11, 2), (14, 1), (15, 2), (16, 1)],
  term ((-33885318612 : Rat) / 33189485) [(2, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((6481080 : Rat) / 32699) [(2, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((996627018 : Rat) / 33189485) [(2, 1), (10, 1), (12, 1), (14, 1), (15, 2)],
  term ((-190620 : Rat) / 32699) [(2, 1), (10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-7211022069 : Rat) / 66378970) [(2, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((718490 : Rat) / 32699) [(2, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1328836024 : Rat) / 1144465) [(2, 1), (10, 1), (13, 1), (14, 1), (15, 3)],
  term ((-7370640 : Rat) / 32699) [(2, 1), (10, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-91689685656 : Rat) / 33189485) [(2, 1), (10, 1), (13, 2), (14, 1), (15, 2)],
  term ((17537040 : Rat) / 32699) [(2, 1), (10, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-15946032288 : Rat) / 33189485) [(2, 1), (10, 1), (13, 3), (14, 1), (15, 1)],
  term ((3049920 : Rat) / 32699) [(2, 1), (10, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((1404345055 : Rat) / 26551588) [(2, 1), (10, 1), (14, 1), (15, 2)],
  term ((-333247 : Rat) / 32699) [(2, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((332209006 : Rat) / 33189485) [(2, 1), (10, 1), (14, 1), (15, 4)],
  term ((-63540 : Rat) / 32699) [(2, 1), (10, 1), (14, 1), (15, 4), (16, 1)],
  term ((-12929248464 : Rat) / 6637897) [(2, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((12276480 : Rat) / 32699) [(2, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((17735084224 : Rat) / 33189485) [(2, 1), (11, 1), (12, 1), (14, 1), (15, 3)],
  term ((-3367936 : Rat) / 32699) [(2, 1), (11, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((29610594575 : Rat) / 19913691) [(2, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-27842944 : Rat) / 98097) [(2, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((7751348000 : Rat) / 6637897) [(2, 1), (11, 1), (13, 1), (14, 1), (15, 4)],
  term ((-7360000 : Rat) / 32699) [(2, 1), (11, 1), (13, 1), (14, 1), (15, 4), (16, 1)],
  term ((-151590256936 : Rat) / 33189485) [(2, 1), (11, 1), (13, 2), (14, 1), (15, 1)],
  term ((28932224 : Rat) / 32699) [(2, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-19378370000 : Rat) / 6637897) [(2, 1), (11, 1), (13, 2), (14, 1), (15, 3)],
  term ((18400000 : Rat) / 32699) [(2, 1), (11, 1), (13, 2), (14, 1), (15, 3), (16, 1)],
  term ((-134853541099 : Rat) / 199136910) [(2, 1), (11, 1), (14, 1), (15, 1)],
  term ((12947108 : Rat) / 98097) [(2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((80499338629 : Rat) / 66378970) [(2, 1), (11, 1), (14, 1), (15, 3)],
  term ((-7707484 : Rat) / 32699) [(2, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((2046355872 : Rat) / 4741355) [(2, 1), (11, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-2720256 : Rat) / 32699) [(2, 1), (11, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((31005392 : Rat) / 6637897) [(2, 1), (11, 2), (12, 1), (14, 1), (15, 2)],
  term ((-29440 : Rat) / 32699) [(2, 1), (11, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-9472147256 : Rat) / 33189485) [(2, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((1798784 : Rat) / 32699) [(2, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-86939119168 : Rat) / 33189485) [(2, 1), (11, 2), (13, 1), (14, 1), (15, 3)],
  term ((16509952 : Rat) / 32699) [(2, 1), (11, 2), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((47004174272 : Rat) / 33189485) [(2, 1), (11, 2), (13, 2), (14, 1), (15, 2)],
  term ((-8926208 : Rat) / 32699) [(2, 1), (11, 2), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-12921497116 : Rat) / 33189485) [(2, 1), (11, 2), (14, 1), (15, 2)],
  term ((2453824 : Rat) / 32699) [(2, 1), (11, 2), (14, 1), (15, 2), (16, 1)],
  term ((27315750352 : Rat) / 33189485) [(2, 1), (11, 2), (14, 1), (15, 4)],
  term ((-5187328 : Rat) / 32699) [(2, 1), (11, 2), (14, 1), (15, 4), (16, 1)],
  term ((248043136 : Rat) / 6637897) [(2, 1), (11, 3), (13, 1), (14, 1), (15, 2)],
  term ((-235520 : Rat) / 32699) [(2, 1), (11, 3), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2976517632 : Rat) / 33189485) [(2, 1), (11, 3), (13, 2), (14, 1), (15, 1)],
  term ((565248 : Rat) / 32699) [(2, 1), (11, 3), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-62010784 : Rat) / 33189485) [(2, 1), (11, 3), (14, 1), (15, 1)],
  term ((11776 : Rat) / 32699) [(2, 1), (11, 3), (14, 1), (15, 1), (16, 1)],
  term ((-124021568 : Rat) / 33189485) [(2, 1), (11, 3), (14, 1), (15, 3)],
  term ((23552 : Rat) / 32699) [(2, 1), (11, 3), (14, 1), (15, 3), (16, 1)],
  term ((-36200041559 : Rat) / 132757940) [(2, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((1822754 : Rat) / 32699) [(2, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((123 : Rat) / 5) [(2, 1), (12, 1), (13, 2), (14, 1)],
  term ((-41 : Rat) / 80) [(2, 1), (12, 1), (14, 1)],
  term ((104291444869 : Rat) / 796547640) [(2, 1), (12, 1), (14, 1), (15, 2)],
  term ((-2631617 : Rat) / 98097) [(2, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((45022108009 : Rat) / 531031760) [(2, 1), (13, 1), (14, 1), (15, 1)],
  term ((-4655725 : Rat) / 196194) [(2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4527808529 : Rat) / 2288930) [(2, 1), (13, 1), (14, 1), (15, 3)],
  term ((37372436 : Rat) / 98097) [(2, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-413820513541 : Rat) / 796547640) [(3, 1), (8, 1), (15, 3)],
  term ((9839102 : Rat) / 98097) [(3, 1), (8, 1), (15, 3), (16, 1)],
  term ((32 : Rat) / 29) [(3, 1), (9, 1), (10, 1), (13, 1), (15, 3)],
  term ((16 : Rat) / 29) [(3, 1), (9, 1), (10, 1), (15, 4)],
  term ((31005392 : Rat) / 6637897) [(3, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-29440 : Rat) / 32699) [(3, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-10642628 : Rat) / 5240445) [(3, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((1472 : Rat) / 5163) [(3, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((285493056 : Rat) / 33189485) [(3, 1), (9, 1), (11, 1), (13, 1), (15, 4)],
  term ((-23552 : Rat) / 98097) [(3, 1), (9, 1), (11, 1), (13, 1), (15, 4), (16, 1)],
  term ((62010784 : Rat) / 14224065) [(3, 1), (9, 1), (11, 1), (13, 2), (15, 3)],
  term ((-82432 : Rat) / 98097) [(3, 1), (9, 1), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((62631064 : Rat) / 99568455) [(3, 1), (9, 1), (11, 1), (15, 3)],
  term ((5888 : Rat) / 32699) [(3, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((-385999216 : Rat) / 99568455) [(3, 1), (9, 1), (11, 1), (15, 5)],
  term ((5888 : Rat) / 32699) [(3, 1), (9, 1), (11, 1), (15, 5), (16, 1)],
  term ((5 : Rat) / 2) [(3, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((192 : Rat) / 29) [(3, 1), (9, 1), (12, 1), (13, 1), (15, 3)],
  term ((-56 : Rat) / 29) [(3, 1), (9, 1), (12, 1), (15, 4)],
  term ((-19 : Rat) / 24) [(3, 1), (9, 1), (13, 1), (15, 1)],
  term ((650 : Rat) / 87) [(3, 1), (9, 1), (13, 1), (15, 3)],
  term ((-320 : Rat) / 87) [(3, 1), (9, 1), (13, 1), (15, 5)],
  term ((-1381 : Rat) / 87) [(3, 1), (9, 1), (13, 2), (15, 2)],
  term ((800 : Rat) / 87) [(3, 1), (9, 1), (13, 2), (15, 4)],
  term ((-35 : Rat) / 174) [(3, 1), (9, 1), (15, 2)],
  term ((-631 : Rat) / 174) [(3, 1), (9, 1), (15, 4)],
  term ((-1488258816 : Rat) / 4741355) [(3, 1), (10, 1), (11, 1), (13, 1), (15, 3)],
  term ((1978368 : Rat) / 32699) [(3, 1), (10, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((248043136 : Rat) / 33189485) [(3, 1), (10, 1), (11, 1), (15, 2)],
  term ((-47104 : Rat) / 32699) [(3, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-5084884288 : Rat) / 33189485) [(3, 1), (10, 1), (11, 1), (15, 4)],
  term ((965632 : Rat) / 32699) [(3, 1), (10, 1), (11, 1), (15, 4), (16, 1)],
  term ((124021568 : Rat) / 33189485) [(3, 1), (10, 1), (11, 2), (13, 1), (15, 2)],
  term ((-23552 : Rat) / 32699) [(3, 1), (10, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-62010784 : Rat) / 33189485) [(3, 1), (10, 1), (11, 2), (15, 3)],
  term ((11776 : Rat) / 32699) [(3, 1), (10, 1), (11, 2), (15, 3), (16, 1)],
  term ((-33885318612 : Rat) / 33189485) [(3, 1), (10, 1), (12, 1), (13, 1), (15, 2)],
  term ((6481080 : Rat) / 32699) [(3, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((996627018 : Rat) / 33189485) [(3, 1), (10, 1), (12, 1), (15, 3)],
  term ((-190620 : Rat) / 32699) [(3, 1), (10, 1), (12, 1), (15, 3), (16, 1)],
  term ((-7211022069 : Rat) / 66378970) [(3, 1), (10, 1), (13, 1), (15, 2)],
  term ((718490 : Rat) / 32699) [(3, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((1328836024 : Rat) / 1144465) [(3, 1), (10, 1), (13, 1), (15, 4)],
  term ((-7370640 : Rat) / 32699) [(3, 1), (10, 1), (13, 1), (15, 4), (16, 1)],
  term ((-91689685656 : Rat) / 33189485) [(3, 1), (10, 1), (13, 2), (15, 3)],
  term ((17537040 : Rat) / 32699) [(3, 1), (10, 1), (13, 2), (15, 3), (16, 1)],
  term ((-15946032288 : Rat) / 33189485) [(3, 1), (10, 1), (13, 3), (15, 2)],
  term ((3049920 : Rat) / 32699) [(3, 1), (10, 1), (13, 3), (15, 2), (16, 1)],
  term ((1404345055 : Rat) / 26551588) [(3, 1), (10, 1), (15, 3)],
  term ((-333247 : Rat) / 32699) [(3, 1), (10, 1), (15, 3), (16, 1)],
  term ((332209006 : Rat) / 33189485) [(3, 1), (10, 1), (15, 5)],
  term ((-63540 : Rat) / 32699) [(3, 1), (10, 1), (15, 5), (16, 1)],
  term ((-12929248464 : Rat) / 6637897) [(3, 1), (11, 1), (12, 1), (13, 1), (15, 3)],
  term ((12276480 : Rat) / 32699) [(3, 1), (11, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((17735084224 : Rat) / 33189485) [(3, 1), (11, 1), (12, 1), (15, 4)],
  term ((-3367936 : Rat) / 32699) [(3, 1), (11, 1), (12, 1), (15, 4), (16, 1)],
  term ((29610594575 : Rat) / 19913691) [(3, 1), (11, 1), (13, 1), (15, 3)],
  term ((-27842944 : Rat) / 98097) [(3, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((7751348000 : Rat) / 6637897) [(3, 1), (11, 1), (13, 1), (15, 5)],
  term ((-7360000 : Rat) / 32699) [(3, 1), (11, 1), (13, 1), (15, 5), (16, 1)],
  term ((-151590256936 : Rat) / 33189485) [(3, 1), (11, 1), (13, 2), (15, 2)],
  term ((28932224 : Rat) / 32699) [(3, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-19378370000 : Rat) / 6637897) [(3, 1), (11, 1), (13, 2), (15, 4)],
  term ((18400000 : Rat) / 32699) [(3, 1), (11, 1), (13, 2), (15, 4), (16, 1)],
  term ((-134853541099 : Rat) / 199136910) [(3, 1), (11, 1), (15, 2)],
  term ((12947108 : Rat) / 98097) [(3, 1), (11, 1), (15, 2), (16, 1)],
  term ((80499338629 : Rat) / 66378970) [(3, 1), (11, 1), (15, 4)],
  term ((-7707484 : Rat) / 32699) [(3, 1), (11, 1), (15, 4), (16, 1)],
  term ((2046355872 : Rat) / 4741355) [(3, 1), (11, 2), (12, 1), (13, 1), (15, 2)],
  term ((-2720256 : Rat) / 32699) [(3, 1), (11, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((31005392 : Rat) / 6637897) [(3, 1), (11, 2), (12, 1), (15, 3)],
  term ((-29440 : Rat) / 32699) [(3, 1), (11, 2), (12, 1), (15, 3), (16, 1)],
  term ((-9472147256 : Rat) / 33189485) [(3, 1), (11, 2), (13, 1), (15, 2)],
  term ((1798784 : Rat) / 32699) [(3, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-86939119168 : Rat) / 33189485) [(3, 1), (11, 2), (13, 1), (15, 4)],
  term ((16509952 : Rat) / 32699) [(3, 1), (11, 2), (13, 1), (15, 4), (16, 1)],
  term ((47004174272 : Rat) / 33189485) [(3, 1), (11, 2), (13, 2), (15, 3)],
  term ((-8926208 : Rat) / 32699) [(3, 1), (11, 2), (13, 2), (15, 3), (16, 1)],
  term ((-12921497116 : Rat) / 33189485) [(3, 1), (11, 2), (15, 3)],
  term ((2453824 : Rat) / 32699) [(3, 1), (11, 2), (15, 3), (16, 1)],
  term ((27315750352 : Rat) / 33189485) [(3, 1), (11, 2), (15, 5)],
  term ((-5187328 : Rat) / 32699) [(3, 1), (11, 2), (15, 5), (16, 1)],
  term ((248043136 : Rat) / 6637897) [(3, 1), (11, 3), (13, 1), (15, 3)],
  term ((-235520 : Rat) / 32699) [(3, 1), (11, 3), (13, 1), (15, 3), (16, 1)],
  term ((-2976517632 : Rat) / 33189485) [(3, 1), (11, 3), (13, 2), (15, 2)],
  term ((565248 : Rat) / 32699) [(3, 1), (11, 3), (13, 2), (15, 2), (16, 1)],
  term ((-62010784 : Rat) / 33189485) [(3, 1), (11, 3), (15, 2)],
  term ((11776 : Rat) / 32699) [(3, 1), (11, 3), (15, 2), (16, 1)],
  term ((-124021568 : Rat) / 33189485) [(3, 1), (11, 3), (15, 4)],
  term ((23552 : Rat) / 32699) [(3, 1), (11, 3), (15, 4), (16, 1)],
  term ((-36200041559 : Rat) / 132757940) [(3, 1), (12, 1), (13, 1), (15, 2)],
  term ((1822754 : Rat) / 32699) [(3, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((123 : Rat) / 5) [(3, 1), (12, 1), (13, 2), (15, 1)],
  term ((-41 : Rat) / 80) [(3, 1), (12, 1), (15, 1)],
  term ((104291444869 : Rat) / 796547640) [(3, 1), (12, 1), (15, 3)],
  term ((-2631617 : Rat) / 98097) [(3, 1), (12, 1), (15, 3), (16, 1)],
  term ((45022108009 : Rat) / 531031760) [(3, 1), (13, 1), (15, 2)],
  term ((-4655725 : Rat) / 196194) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-4527808529 : Rat) / 2288930) [(3, 1), (13, 1), (15, 4)],
  term ((37372436 : Rat) / 98097) [(3, 1), (13, 1), (15, 4), (16, 1)],
  term ((413820513541 : Rat) / 1593095280) [(8, 1), (14, 2), (15, 2)],
  term ((-4919551 : Rat) / 98097) [(8, 1), (14, 2), (15, 2), (16, 1)],
  term ((413820513541 : Rat) / 1593095280) [(8, 1), (15, 4)],
  term ((-4919551 : Rat) / 98097) [(8, 1), (15, 4), (16, 1)],
  term ((-16 : Rat) / 29) [(9, 1), (10, 1), (13, 1), (14, 2), (15, 2)],
  term ((-16 : Rat) / 29) [(9, 1), (10, 1), (13, 1), (15, 4)],
  term ((-8 : Rat) / 29) [(9, 1), (10, 1), (14, 2), (15, 3)],
  term ((-8 : Rat) / 29) [(9, 1), (10, 1), (15, 5)],
  term ((-15502696 : Rat) / 6637897) [(9, 1), (11, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((14720 : Rat) / 32699) [(9, 1), (11, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-15502696 : Rat) / 6637897) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 3)],
  term ((14720 : Rat) / 32699) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((5321314 : Rat) / 5240445) [(9, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((-736 : Rat) / 5163) [(9, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-142746528 : Rat) / 33189485) [(9, 1), (11, 1), (13, 1), (14, 2), (15, 3)],
  term ((11776 : Rat) / 98097) [(9, 1), (11, 1), (13, 1), (14, 2), (15, 3), (16, 1)],
  term ((5321314 : Rat) / 5240445) [(9, 1), (11, 1), (13, 1), (15, 3)],
  term ((-736 : Rat) / 5163) [(9, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-142746528 : Rat) / 33189485) [(9, 1), (11, 1), (13, 1), (15, 5)],
  term ((11776 : Rat) / 98097) [(9, 1), (11, 1), (13, 1), (15, 5), (16, 1)],
  term ((-31005392 : Rat) / 14224065) [(9, 1), (11, 1), (13, 2), (14, 2), (15, 2)],
  term ((41216 : Rat) / 98097) [(9, 1), (11, 1), (13, 2), (14, 2), (15, 2), (16, 1)],
  term ((-31005392 : Rat) / 14224065) [(9, 1), (11, 1), (13, 2), (15, 4)],
  term ((41216 : Rat) / 98097) [(9, 1), (11, 1), (13, 2), (15, 4), (16, 1)],
  term ((-31315532 : Rat) / 99568455) [(9, 1), (11, 1), (14, 2), (15, 2)],
  term ((-2944 : Rat) / 32699) [(9, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((192999608 : Rat) / 99568455) [(9, 1), (11, 1), (14, 2), (15, 4)],
  term ((-2944 : Rat) / 32699) [(9, 1), (11, 1), (14, 2), (15, 4), (16, 1)],
  term ((-31315532 : Rat) / 99568455) [(9, 1), (11, 1), (15, 4)],
  term ((-2944 : Rat) / 32699) [(9, 1), (11, 1), (15, 4), (16, 1)],
  term ((192999608 : Rat) / 99568455) [(9, 1), (11, 1), (15, 6)],
  term ((-2944 : Rat) / 32699) [(9, 1), (11, 1), (15, 6), (16, 1)],
  term ((-5 : Rat) / 4) [(9, 1), (12, 1), (13, 1), (14, 2)],
  term ((-96 : Rat) / 29) [(9, 1), (12, 1), (13, 1), (14, 2), (15, 2)],
  term ((-5 : Rat) / 4) [(9, 1), (12, 1), (13, 1), (15, 2)],
  term ((-96 : Rat) / 29) [(9, 1), (12, 1), (13, 1), (15, 4)],
  term ((28 : Rat) / 29) [(9, 1), (12, 1), (14, 2), (15, 3)],
  term ((28 : Rat) / 29) [(9, 1), (12, 1), (15, 5)],
  term ((19 : Rat) / 48) [(9, 1), (13, 1), (14, 2)],
  term ((-325 : Rat) / 87) [(9, 1), (13, 1), (14, 2), (15, 2)],
  term ((160 : Rat) / 87) [(9, 1), (13, 1), (14, 2), (15, 4)],
  term ((19 : Rat) / 48) [(9, 1), (13, 1), (15, 2)],
  term ((-325 : Rat) / 87) [(9, 1), (13, 1), (15, 4)],
  term ((160 : Rat) / 87) [(9, 1), (13, 1), (15, 6)],
  term ((1381 : Rat) / 174) [(9, 1), (13, 2), (14, 2), (15, 1)],
  term ((-400 : Rat) / 87) [(9, 1), (13, 2), (14, 2), (15, 3)],
  term ((1381 : Rat) / 174) [(9, 1), (13, 2), (15, 3)],
  term ((-400 : Rat) / 87) [(9, 1), (13, 2), (15, 5)],
  term ((35 : Rat) / 348) [(9, 1), (14, 2), (15, 1)],
  term ((631 : Rat) / 348) [(9, 1), (14, 2), (15, 3)],
  term ((35 : Rat) / 348) [(9, 1), (15, 3)],
  term ((631 : Rat) / 348) [(9, 1), (15, 5)],
  term ((744129408 : Rat) / 4741355) [(10, 1), (11, 1), (13, 1), (14, 2), (15, 2)],
  term ((-989184 : Rat) / 32699) [(10, 1), (11, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((744129408 : Rat) / 4741355) [(10, 1), (11, 1), (13, 1), (15, 4)],
  term ((-989184 : Rat) / 32699) [(10, 1), (11, 1), (13, 1), (15, 4), (16, 1)],
  term ((-124021568 : Rat) / 33189485) [(10, 1), (11, 1), (14, 2), (15, 1)],
  term ((23552 : Rat) / 32699) [(10, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((2542442144 : Rat) / 33189485) [(10, 1), (11, 1), (14, 2), (15, 3)],
  term ((-482816 : Rat) / 32699) [(10, 1), (11, 1), (14, 2), (15, 3), (16, 1)],
  term ((-124021568 : Rat) / 33189485) [(10, 1), (11, 1), (15, 3)],
  term ((23552 : Rat) / 32699) [(10, 1), (11, 1), (15, 3), (16, 1)],
  term ((2542442144 : Rat) / 33189485) [(10, 1), (11, 1), (15, 5)],
  term ((-482816 : Rat) / 32699) [(10, 1), (11, 1), (15, 5), (16, 1)],
  term ((-62010784 : Rat) / 33189485) [(10, 1), (11, 2), (13, 1), (14, 2), (15, 1)],
  term ((11776 : Rat) / 32699) [(10, 1), (11, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-62010784 : Rat) / 33189485) [(10, 1), (11, 2), (13, 1), (15, 3)],
  term ((11776 : Rat) / 32699) [(10, 1), (11, 2), (13, 1), (15, 3), (16, 1)],
  term ((31005392 : Rat) / 33189485) [(10, 1), (11, 2), (14, 2), (15, 2)],
  term ((-5888 : Rat) / 32699) [(10, 1), (11, 2), (14, 2), (15, 2), (16, 1)],
  term ((31005392 : Rat) / 33189485) [(10, 1), (11, 2), (15, 4)],
  term ((-5888 : Rat) / 32699) [(10, 1), (11, 2), (15, 4), (16, 1)],
  term ((16942659306 : Rat) / 33189485) [(10, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-3240540 : Rat) / 32699) [(10, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((16942659306 : Rat) / 33189485) [(10, 1), (12, 1), (13, 1), (15, 3)],
  term ((-3240540 : Rat) / 32699) [(10, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-498313509 : Rat) / 33189485) [(10, 1), (12, 1), (14, 2), (15, 2)],
  term ((95310 : Rat) / 32699) [(10, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-498313509 : Rat) / 33189485) [(10, 1), (12, 1), (15, 4)],
  term ((95310 : Rat) / 32699) [(10, 1), (12, 1), (15, 4), (16, 1)],
  term ((7211022069 : Rat) / 132757940) [(10, 1), (13, 1), (14, 2), (15, 1)],
  term ((-359245 : Rat) / 32699) [(10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-664418012 : Rat) / 1144465) [(10, 1), (13, 1), (14, 2), (15, 3)],
  term ((3685320 : Rat) / 32699) [(10, 1), (13, 1), (14, 2), (15, 3), (16, 1)],
  term ((7211022069 : Rat) / 132757940) [(10, 1), (13, 1), (15, 3)],
  term ((-359245 : Rat) / 32699) [(10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-664418012 : Rat) / 1144465) [(10, 1), (13, 1), (15, 5)],
  term ((3685320 : Rat) / 32699) [(10, 1), (13, 1), (15, 5), (16, 1)],
  term ((45844842828 : Rat) / 33189485) [(10, 1), (13, 2), (14, 2), (15, 2)],
  term ((-8768520 : Rat) / 32699) [(10, 1), (13, 2), (14, 2), (15, 2), (16, 1)],
  term ((45844842828 : Rat) / 33189485) [(10, 1), (13, 2), (15, 4)],
  term ((-8768520 : Rat) / 32699) [(10, 1), (13, 2), (15, 4), (16, 1)],
  term ((7973016144 : Rat) / 33189485) [(10, 1), (13, 3), (14, 2), (15, 1)],
  term ((-1524960 : Rat) / 32699) [(10, 1), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((7973016144 : Rat) / 33189485) [(10, 1), (13, 3), (15, 3)],
  term ((-1524960 : Rat) / 32699) [(10, 1), (13, 3), (15, 3), (16, 1)],
  term ((-1404345055 : Rat) / 53103176) [(10, 1), (14, 2), (15, 2)],
  term ((333247 : Rat) / 65398) [(10, 1), (14, 2), (15, 2), (16, 1)],
  term ((-166104503 : Rat) / 33189485) [(10, 1), (14, 2), (15, 4)],
  term ((31770 : Rat) / 32699) [(10, 1), (14, 2), (15, 4), (16, 1)],
  term ((-1404345055 : Rat) / 53103176) [(10, 1), (15, 4)],
  term ((333247 : Rat) / 65398) [(10, 1), (15, 4), (16, 1)],
  term ((-166104503 : Rat) / 33189485) [(10, 1), (15, 6)],
  term ((31770 : Rat) / 32699) [(10, 1), (15, 6), (16, 1)],
  term ((6464624232 : Rat) / 6637897) [(11, 1), (12, 1), (13, 1), (14, 2), (15, 2)],
  term ((-6138240 : Rat) / 32699) [(11, 1), (12, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((6464624232 : Rat) / 6637897) [(11, 1), (12, 1), (13, 1), (15, 4)],
  term ((-6138240 : Rat) / 32699) [(11, 1), (12, 1), (13, 1), (15, 4), (16, 1)],
  term ((-8867542112 : Rat) / 33189485) [(11, 1), (12, 1), (14, 2), (15, 3)],
  term ((1683968 : Rat) / 32699) [(11, 1), (12, 1), (14, 2), (15, 3), (16, 1)],
  term ((-8867542112 : Rat) / 33189485) [(11, 1), (12, 1), (15, 5)],
  term ((1683968 : Rat) / 32699) [(11, 1), (12, 1), (15, 5), (16, 1)],
  term ((-29610594575 : Rat) / 39827382) [(11, 1), (13, 1), (14, 2), (15, 2)],
  term ((13921472 : Rat) / 98097) [(11, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-3875674000 : Rat) / 6637897) [(11, 1), (13, 1), (14, 2), (15, 4)],
  term ((3680000 : Rat) / 32699) [(11, 1), (13, 1), (14, 2), (15, 4), (16, 1)],
  term ((-29610594575 : Rat) / 39827382) [(11, 1), (13, 1), (15, 4)],
  term ((13921472 : Rat) / 98097) [(11, 1), (13, 1), (15, 4), (16, 1)],
  term ((-3875674000 : Rat) / 6637897) [(11, 1), (13, 1), (15, 6)],
  term ((3680000 : Rat) / 32699) [(11, 1), (13, 1), (15, 6), (16, 1)],
  term ((75795128468 : Rat) / 33189485) [(11, 1), (13, 2), (14, 2), (15, 1)],
  term ((-14466112 : Rat) / 32699) [(11, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((9689185000 : Rat) / 6637897) [(11, 1), (13, 2), (14, 2), (15, 3)],
  term ((-9200000 : Rat) / 32699) [(11, 1), (13, 2), (14, 2), (15, 3), (16, 1)],
  term ((75795128468 : Rat) / 33189485) [(11, 1), (13, 2), (15, 3)],
  term ((-14466112 : Rat) / 32699) [(11, 1), (13, 2), (15, 3), (16, 1)],
  term ((9689185000 : Rat) / 6637897) [(11, 1), (13, 2), (15, 5)],
  term ((-9200000 : Rat) / 32699) [(11, 1), (13, 2), (15, 5), (16, 1)],
  term ((134853541099 : Rat) / 398273820) [(11, 1), (14, 2), (15, 1)],
  term ((-6473554 : Rat) / 98097) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-80499338629 : Rat) / 132757940) [(11, 1), (14, 2), (15, 3)],
  term ((3853742 : Rat) / 32699) [(11, 1), (14, 2), (15, 3), (16, 1)],
  term ((134853541099 : Rat) / 398273820) [(11, 1), (15, 3)],
  term ((-6473554 : Rat) / 98097) [(11, 1), (15, 3), (16, 1)],
  term ((-80499338629 : Rat) / 132757940) [(11, 1), (15, 5)],
  term ((3853742 : Rat) / 32699) [(11, 1), (15, 5), (16, 1)],
  term ((-1023177936 : Rat) / 4741355) [(11, 2), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((1360128 : Rat) / 32699) [(11, 2), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1023177936 : Rat) / 4741355) [(11, 2), (12, 1), (13, 1), (15, 3)],
  term ((1360128 : Rat) / 32699) [(11, 2), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-15502696 : Rat) / 6637897) [(11, 2), (12, 1), (14, 2), (15, 2)],
  term ((14720 : Rat) / 32699) [(11, 2), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-15502696 : Rat) / 6637897) [(11, 2), (12, 1), (15, 4)],
  term ((14720 : Rat) / 32699) [(11, 2), (12, 1), (15, 4), (16, 1)],
  term ((4736073628 : Rat) / 33189485) [(11, 2), (13, 1), (14, 2), (15, 1)],
  term ((-899392 : Rat) / 32699) [(11, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((43469559584 : Rat) / 33189485) [(11, 2), (13, 1), (14, 2), (15, 3)],
  term ((-8254976 : Rat) / 32699) [(11, 2), (13, 1), (14, 2), (15, 3), (16, 1)],
  term ((4736073628 : Rat) / 33189485) [(11, 2), (13, 1), (15, 3)],
  term ((-899392 : Rat) / 32699) [(11, 2), (13, 1), (15, 3), (16, 1)],
  term ((43469559584 : Rat) / 33189485) [(11, 2), (13, 1), (15, 5)],
  term ((-8254976 : Rat) / 32699) [(11, 2), (13, 1), (15, 5), (16, 1)],
  term ((-23502087136 : Rat) / 33189485) [(11, 2), (13, 2), (14, 2), (15, 2)],
  term ((4463104 : Rat) / 32699) [(11, 2), (13, 2), (14, 2), (15, 2), (16, 1)],
  term ((-23502087136 : Rat) / 33189485) [(11, 2), (13, 2), (15, 4)],
  term ((4463104 : Rat) / 32699) [(11, 2), (13, 2), (15, 4), (16, 1)],
  term ((6460748558 : Rat) / 33189485) [(11, 2), (14, 2), (15, 2)],
  term ((-1226912 : Rat) / 32699) [(11, 2), (14, 2), (15, 2), (16, 1)],
  term ((-13657875176 : Rat) / 33189485) [(11, 2), (14, 2), (15, 4)],
  term ((2593664 : Rat) / 32699) [(11, 2), (14, 2), (15, 4), (16, 1)],
  term ((6460748558 : Rat) / 33189485) [(11, 2), (15, 4)],
  term ((-1226912 : Rat) / 32699) [(11, 2), (15, 4), (16, 1)],
  term ((-13657875176 : Rat) / 33189485) [(11, 2), (15, 6)],
  term ((2593664 : Rat) / 32699) [(11, 2), (15, 6), (16, 1)],
  term ((-124021568 : Rat) / 6637897) [(11, 3), (13, 1), (14, 2), (15, 2)],
  term ((117760 : Rat) / 32699) [(11, 3), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-124021568 : Rat) / 6637897) [(11, 3), (13, 1), (15, 4)],
  term ((117760 : Rat) / 32699) [(11, 3), (13, 1), (15, 4), (16, 1)],
  term ((1488258816 : Rat) / 33189485) [(11, 3), (13, 2), (14, 2), (15, 1)],
  term ((-282624 : Rat) / 32699) [(11, 3), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((1488258816 : Rat) / 33189485) [(11, 3), (13, 2), (15, 3)],
  term ((-282624 : Rat) / 32699) [(11, 3), (13, 2), (15, 3), (16, 1)],
  term ((31005392 : Rat) / 33189485) [(11, 3), (14, 2), (15, 1)],
  term ((-5888 : Rat) / 32699) [(11, 3), (14, 2), (15, 1), (16, 1)],
  term ((62010784 : Rat) / 33189485) [(11, 3), (14, 2), (15, 3)],
  term ((-11776 : Rat) / 32699) [(11, 3), (14, 2), (15, 3), (16, 1)],
  term ((31005392 : Rat) / 33189485) [(11, 3), (15, 3)],
  term ((-5888 : Rat) / 32699) [(11, 3), (15, 3), (16, 1)],
  term ((62010784 : Rat) / 33189485) [(11, 3), (15, 5)],
  term ((-11776 : Rat) / 32699) [(11, 3), (15, 5), (16, 1)],
  term ((36200041559 : Rat) / 265515880) [(12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-911377 : Rat) / 32699) [(12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((36200041559 : Rat) / 265515880) [(12, 1), (13, 1), (15, 3)],
  term ((-911377 : Rat) / 32699) [(12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-123 : Rat) / 10) [(12, 1), (13, 2), (14, 2)],
  term ((-123 : Rat) / 10) [(12, 1), (13, 2), (15, 2)],
  term ((41 : Rat) / 160) [(12, 1), (14, 2)],
  term ((-104291444869 : Rat) / 1593095280) [(12, 1), (14, 2), (15, 2)],
  term ((2631617 : Rat) / 196194) [(12, 1), (14, 2), (15, 2), (16, 1)],
  term ((41 : Rat) / 160) [(12, 1), (15, 2)],
  term ((-104291444869 : Rat) / 1593095280) [(12, 1), (15, 4)],
  term ((2631617 : Rat) / 196194) [(12, 1), (15, 4), (16, 1)],
  term ((-45022108009 : Rat) / 1062063520) [(13, 1), (14, 2), (15, 1)],
  term ((4655725 : Rat) / 392388) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((4527808529 : Rat) / 4577860) [(13, 1), (14, 2), (15, 3)],
  term ((-18686218 : Rat) / 98097) [(13, 1), (14, 2), (15, 3), (16, 1)],
  term ((-45022108009 : Rat) / 1062063520) [(13, 1), (15, 3)],
  term ((4655725 : Rat) / 392388) [(13, 1), (15, 3), (16, 1)],
  term ((4527808529 : Rat) / 4577860) [(13, 1), (15, 5)],
  term ((-18686218 : Rat) / 98097) [(13, 1), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 12, terms 200 through 299. -/
theorem rs_R009_ueqv_R009NYYYY_block_12_0200_0299_valid :
    checkProductSumEq rs_R009_ueqv_R009NYYYY_partials_12_0200_0299
      rs_R009_ueqv_R009NYYYY_block_12_0200_0299 = true := by
  native_decide

end R009UeqvR009NYYYYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
