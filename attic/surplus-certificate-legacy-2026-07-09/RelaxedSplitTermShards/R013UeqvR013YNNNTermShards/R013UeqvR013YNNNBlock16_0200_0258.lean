/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R013:u=v:R013YNNN, term block 16:200-258

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R013UeqvR013YNNNTermShards

/-- Generator polynomial 16 for relaxed split surplus certificate `R013:u=v:R013YNNN`. -/
def rs_R013_ueqv_R013YNNN_generator_16_0200_0258 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(6, 1)]
]

/-- Coefficient term 200 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0200 : Poly :=
[
  term ((-63376842833879680 : Rat) / 1288183727709509) [(6, 1), (9, 1), (10, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 200 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0200 : Poly :=
[
  term ((63376842833879680 : Rat) / 1288183727709509) [(6, 1), (9, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((-126753685667759360 : Rat) / 1288183727709509) [(6, 2), (9, 1), (10, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0200_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0200
        rs_R013_ueqv_R013YNNN_generator_16_0200_0258 =
      rs_R013_ueqv_R013YNNN_partial_16_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0201 : Poly :=
[
  term ((3484068180475701389 : Rat) / 1288183727709509) [(6, 1), (9, 1), (10, 1), (11, 2), (15, 1)]
]

/-- Partial product 201 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0201 : Poly :=
[
  term ((-3484068180475701389 : Rat) / 1288183727709509) [(6, 1), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((6968136360951402778 : Rat) / 1288183727709509) [(6, 2), (9, 1), (10, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0201_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0201
        rs_R013_ueqv_R013YNNN_generator_16_0200_0258 =
      rs_R013_ueqv_R013YNNN_partial_16_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0202 : Poly :=
[
  term ((-16256607488 : Rat) / 25734207) [(6, 1), (9, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 202 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0202 : Poly :=
[
  term ((16256607488 : Rat) / 25734207) [(6, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-32513214976 : Rat) / 25734207) [(6, 2), (9, 1), (10, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0202_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0202
        rs_R013_ueqv_R013YNNN_generator_16_0200_0258 =
      rs_R013_ueqv_R013YNNN_partial_16_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0203 : Poly :=
[
  term ((22652678179 : Rat) / 25734207) [(6, 1), (9, 1), (10, 1), (15, 1)]
]

/-- Partial product 203 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0203 : Poly :=
[
  term ((-22652678179 : Rat) / 25734207) [(6, 1), (9, 1), (10, 1), (15, 1)],
  term ((45305356358 : Rat) / 25734207) [(6, 2), (9, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0203_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0203
        rs_R013_ueqv_R013YNNN_generator_16_0200_0258 =
      rs_R013_ueqv_R013YNNN_partial_16_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0204 : Poly :=
[
  term ((59027192440 : Rat) / 150171761) [(6, 1), (9, 1), (11, 1)]
]

/-- Partial product 204 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0204 : Poly :=
[
  term ((-59027192440 : Rat) / 150171761) [(6, 1), (9, 1), (11, 1)],
  term ((118054384880 : Rat) / 150171761) [(6, 2), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0204_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0204
        rs_R013_ueqv_R013YNNN_generator_16_0200_0258 =
      rs_R013_ueqv_R013YNNN_partial_16_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0205 : Poly :=
[
  term ((-2127756400 : Rat) / 150171761) [(6, 1), (9, 1), (11, 1), (12, 1)]
]

/-- Partial product 205 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0205 : Poly :=
[
  term ((2127756400 : Rat) / 150171761) [(6, 1), (9, 1), (11, 1), (12, 1)],
  term ((-4255512800 : Rat) / 150171761) [(6, 2), (9, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0205_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0205
        rs_R013_ueqv_R013YNNN_generator_16_0200_0258 =
      rs_R013_ueqv_R013YNNN_partial_16_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0206 : Poly :=
[
  term ((-102494396044210555 : Rat) / 1288183727709509) [(6, 1), (9, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 206 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0206 : Poly :=
[
  term ((102494396044210555 : Rat) / 1288183727709509) [(6, 1), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((-204988792088421110 : Rat) / 1288183727709509) [(6, 2), (9, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0206_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0206
        rs_R013_ueqv_R013YNNN_generator_16_0200_0258 =
      rs_R013_ueqv_R013YNNN_partial_16_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0207 : Poly :=
[
  term ((5686700262608248931 : Rat) / 2576367455419018) [(6, 1), (9, 1), (11, 2), (15, 1)]
]

/-- Partial product 207 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0207 : Poly :=
[
  term ((-5686700262608248931 : Rat) / 2576367455419018) [(6, 1), (9, 1), (11, 2), (15, 1)],
  term ((5686700262608248931 : Rat) / 1288183727709509) [(6, 2), (9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0207_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0207
        rs_R013_ueqv_R013YNNN_generator_16_0200_0258 =
      rs_R013_ueqv_R013YNNN_partial_16_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0208 : Poly :=
[
  term ((22056755452 : Rat) / 25734207) [(6, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 208 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0208 : Poly :=
[
  term ((-22056755452 : Rat) / 25734207) [(6, 1), (9, 1), (12, 1), (15, 1)],
  term ((44113510904 : Rat) / 25734207) [(6, 2), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0208_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0208
        rs_R013_ueqv_R013YNNN_generator_16_0200_0258 =
      rs_R013_ueqv_R013YNNN_partial_16_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0209 : Poly :=
[
  term ((-10798687478 : Rat) / 8578069) [(6, 1), (9, 1), (15, 1)]
]

/-- Partial product 209 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0209 : Poly :=
[
  term ((10798687478 : Rat) / 8578069) [(6, 1), (9, 1), (15, 1)],
  term ((-21597374956 : Rat) / 8578069) [(6, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0209_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0209
        rs_R013_ueqv_R013YNNN_generator_16_0200_0258 =
      rs_R013_ueqv_R013YNNN_partial_16_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0210 : Poly :=
[
  term (-2 : Rat) [(6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 210 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0210 : Poly :=
[
  term (2 : Rat) [(6, 1), (9, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(6, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0210_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0210
        rs_R013_ueqv_R013YNNN_generator_16_0200_0258 =
      rs_R013_ueqv_R013YNNN_partial_16_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0211 : Poly :=
[
  term (-112 : Rat) [(7, 1), (9, 1)]
]

/-- Partial product 211 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0211 : Poly :=
[
  term (-224 : Rat) [(6, 1), (7, 1), (9, 1)],
  term (112 : Rat) [(7, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0211_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0211
        rs_R013_ueqv_R013YNNN_generator_16_0200_0258 =
      rs_R013_ueqv_R013YNNN_partial_16_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0212 : Poly :=
[
  term (160 : Rat) [(7, 1), (9, 1), (10, 1)]
]

/-- Partial product 212 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0212 : Poly :=
[
  term (320 : Rat) [(6, 1), (7, 1), (9, 1), (10, 1)],
  term (-160 : Rat) [(7, 1), (9, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0212_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0212
        rs_R013_ueqv_R013YNNN_generator_16_0200_0258 =
      rs_R013_ueqv_R013YNNN_partial_16_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0213 : Poly :=
[
  term ((21501791864 : Rat) / 150171761) [(7, 1), (10, 1), (11, 1)]
]

/-- Partial product 213 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0213 : Poly :=
[
  term ((43003583728 : Rat) / 150171761) [(6, 1), (7, 1), (10, 1), (11, 1)],
  term ((-21501791864 : Rat) / 150171761) [(7, 1), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0213_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0213
        rs_R013_ueqv_R013YNNN_generator_16_0200_0258 =
      rs_R013_ueqv_R013YNNN_partial_16_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0214 : Poly :=
[
  term ((657843200 : Rat) / 150171761) [(7, 1), (10, 1), (11, 1), (12, 1)]
]

/-- Partial product 214 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0214 : Poly :=
[
  term ((1315686400 : Rat) / 150171761) [(6, 1), (7, 1), (10, 1), (11, 1), (12, 1)],
  term ((-657843200 : Rat) / 150171761) [(7, 1), (10, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0214_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0214
        rs_R013_ueqv_R013YNNN_generator_16_0200_0258 =
      rs_R013_ueqv_R013YNNN_partial_16_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0215 : Poly :=
[
  term ((31688421416939840 : Rat) / 1288183727709509) [(7, 1), (10, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 215 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0215 : Poly :=
[
  term ((63376842833879680 : Rat) / 1288183727709509) [(6, 1), (7, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((-31688421416939840 : Rat) / 1288183727709509) [(7, 1), (10, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0215_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0215
        rs_R013_ueqv_R013YNNN_generator_16_0200_0258 =
      rs_R013_ueqv_R013YNNN_partial_16_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0216 : Poly :=
[
  term ((-3484068180475701389 : Rat) / 2576367455419018) [(7, 1), (10, 1), (11, 2), (15, 1)]
]

/-- Partial product 216 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0216 : Poly :=
[
  term ((-3484068180475701389 : Rat) / 1288183727709509) [(6, 1), (7, 1), (10, 1), (11, 2), (15, 1)],
  term ((3484068180475701389 : Rat) / 2576367455419018) [(7, 1), (10, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0216_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0216
        rs_R013_ueqv_R013YNNN_generator_16_0200_0258 =
      rs_R013_ueqv_R013YNNN_partial_16_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0217 : Poly :=
[
  term ((8128303744 : Rat) / 25734207) [(7, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 217 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0217 : Poly :=
[
  term ((16256607488 : Rat) / 25734207) [(6, 1), (7, 1), (10, 1), (12, 1), (15, 1)],
  term ((-8128303744 : Rat) / 25734207) [(7, 1), (10, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0217_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0217
        rs_R013_ueqv_R013YNNN_generator_16_0200_0258 =
      rs_R013_ueqv_R013YNNN_partial_16_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0218 : Poly :=
[
  term ((-45774361705 : Rat) / 51468414) [(7, 1), (10, 1), (15, 1)]
]

/-- Partial product 218 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0218 : Poly :=
[
  term ((-45774361705 : Rat) / 25734207) [(6, 1), (7, 1), (10, 1), (15, 1)],
  term ((45774361705 : Rat) / 51468414) [(7, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0218_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0218
        rs_R013_ueqv_R013YNNN_generator_16_0200_0258 =
      rs_R013_ueqv_R013YNNN_partial_16_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0219 : Poly :=
[
  term ((-25660358720 : Rat) / 150171761) [(7, 1), (11, 1)]
]

/-- Partial product 219 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0219 : Poly :=
[
  term ((-51320717440 : Rat) / 150171761) [(6, 1), (7, 1), (11, 1)],
  term ((25660358720 : Rat) / 150171761) [(7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0219_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0219
        rs_R013_ueqv_R013YNNN_generator_16_0200_0258 =
      rs_R013_ueqv_R013YNNN_partial_16_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0220 : Poly :=
[
  term ((734956600 : Rat) / 150171761) [(7, 1), (11, 1), (12, 1)]
]

/-- Partial product 220 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0220 : Poly :=
[
  term ((1469913200 : Rat) / 150171761) [(6, 1), (7, 1), (11, 1), (12, 1)],
  term ((-734956600 : Rat) / 150171761) [(7, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0220_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0220
        rs_R013_ueqv_R013YNNN_generator_16_0200_0258 =
      rs_R013_ueqv_R013YNNN_partial_16_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0221 : Poly :=
[
  term ((70805974627270715 : Rat) / 2576367455419018) [(7, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 221 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0221 : Poly :=
[
  term ((70805974627270715 : Rat) / 1288183727709509) [(6, 1), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((-70805974627270715 : Rat) / 2576367455419018) [(7, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0221_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0221
        rs_R013_ueqv_R013YNNN_generator_16_0200_0258 =
      rs_R013_ueqv_R013YNNN_partial_16_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0222 : Poly :=
[
  term ((-657359956034886883 : Rat) / 1288183727709509) [(7, 1), (11, 2), (15, 1)]
]

/-- Partial product 222 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0222 : Poly :=
[
  term ((-1314719912069773766 : Rat) / 1288183727709509) [(6, 1), (7, 1), (11, 2), (15, 1)],
  term ((657359956034886883 : Rat) / 1288183727709509) [(7, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0222_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0222
        rs_R013_ueqv_R013YNNN_generator_16_0200_0258 =
      rs_R013_ueqv_R013YNNN_partial_16_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0223 : Poly :=
[
  term ((-15092529598 : Rat) / 25734207) [(7, 1), (12, 1), (15, 1)]
]

/-- Partial product 223 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0223 : Poly :=
[
  term ((-30185059196 : Rat) / 25734207) [(6, 1), (7, 1), (12, 1), (15, 1)],
  term ((15092529598 : Rat) / 25734207) [(7, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0223_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0223
        rs_R013_ueqv_R013YNNN_generator_16_0200_0258 =
      rs_R013_ueqv_R013YNNN_partial_16_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0224 : Poly :=
[
  term ((27335678258 : Rat) / 25734207) [(7, 1), (15, 1)]
]

/-- Partial product 224 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0224 : Poly :=
[
  term ((54671356516 : Rat) / 25734207) [(6, 1), (7, 1), (15, 1)],
  term ((-27335678258 : Rat) / 25734207) [(7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0224_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0224
        rs_R013_ueqv_R013YNNN_generator_16_0200_0258 =
      rs_R013_ueqv_R013YNNN_partial_16_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0225 : Poly :=
[
  term (3 : Rat) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 225 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0225 : Poly :=
[
  term (6 : Rat) [(6, 1), (7, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0225_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0225
        rs_R013_ueqv_R013YNNN_generator_16_0200_0258 =
      rs_R013_ueqv_R013YNNN_partial_16_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0226 : Poly :=
[
  term (-144 : Rat) [(7, 2)]
]

/-- Partial product 226 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0226 : Poly :=
[
  term (-288 : Rat) [(6, 1), (7, 2)],
  term (144 : Rat) [(7, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0226_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0226
        rs_R013_ueqv_R013YNNN_generator_16_0200_0258 =
      rs_R013_ueqv_R013YNNN_partial_16_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0227 : Poly :=
[
  term (64 : Rat) [(7, 2), (10, 1)]
]

/-- Partial product 227 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0227 : Poly :=
[
  term (128 : Rat) [(6, 1), (7, 2), (10, 1)],
  term (-64 : Rat) [(7, 2), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0227_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0227
        rs_R013_ueqv_R013YNNN_generator_16_0200_0258 =
      rs_R013_ueqv_R013YNNN_partial_16_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0228 : Poly :=
[
  term ((-63318327700 : Rat) / 150171761) [(9, 1), (10, 1), (11, 1)]
]

/-- Partial product 228 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0228 : Poly :=
[
  term ((-126636655400 : Rat) / 150171761) [(6, 1), (9, 1), (10, 1), (11, 1)],
  term ((63318327700 : Rat) / 150171761) [(9, 1), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0228_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0228
        rs_R013_ueqv_R013YNNN_generator_16_0200_0258 =
      rs_R013_ueqv_R013YNNN_partial_16_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0229 : Poly :=
[
  term ((1644608000 : Rat) / 150171761) [(9, 1), (10, 1), (11, 1), (12, 1)]
]

/-- Partial product 229 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0229 : Poly :=
[
  term ((3289216000 : Rat) / 150171761) [(6, 1), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((-1644608000 : Rat) / 150171761) [(9, 1), (10, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0229_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0229
        rs_R013_ueqv_R013YNNN_generator_16_0200_0258 =
      rs_R013_ueqv_R013YNNN_partial_16_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0230 : Poly :=
[
  term ((79221053542349600 : Rat) / 1288183727709509) [(9, 1), (10, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 230 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0230 : Poly :=
[
  term ((158442107084699200 : Rat) / 1288183727709509) [(6, 1), (9, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((-79221053542349600 : Rat) / 1288183727709509) [(9, 1), (10, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0230_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0230
        rs_R013_ueqv_R013YNNN_generator_16_0200_0258 =
      rs_R013_ueqv_R013YNNN_partial_16_0230 := by
  native_decide

/-- Coefficient term 231 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0231 : Poly :=
[
  term ((-12200219453957995585 : Rat) / 5152734910838036) [(9, 1), (10, 1), (11, 2), (15, 1)]
]

/-- Partial product 231 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0231 : Poly :=
[
  term ((-12200219453957995585 : Rat) / 2576367455419018) [(6, 1), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((12200219453957995585 : Rat) / 5152734910838036) [(9, 1), (10, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 231 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0231_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0231
        rs_R013_ueqv_R013YNNN_generator_16_0200_0258 =
      rs_R013_ueqv_R013YNNN_partial_16_0231 := by
  native_decide

/-- Coefficient term 232 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0232 : Poly :=
[
  term ((20320759360 : Rat) / 25734207) [(9, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 232 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0232 : Poly :=
[
  term ((40641518720 : Rat) / 25734207) [(6, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-20320759360 : Rat) / 25734207) [(9, 1), (10, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 232 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0232_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0232
        rs_R013_ueqv_R013YNNN_generator_16_0200_0258 =
      rs_R013_ueqv_R013YNNN_partial_16_0232 := by
  native_decide

/-- Coefficient term 233 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0233 : Poly :=
[
  term ((-30590313059 : Rat) / 25734207) [(9, 1), (10, 1), (15, 1)]
]

/-- Partial product 233 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0233 : Poly :=
[
  term ((-61180626118 : Rat) / 25734207) [(6, 1), (9, 1), (10, 1), (15, 1)],
  term ((30590313059 : Rat) / 25734207) [(9, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 233 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0233_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0233
        rs_R013_ueqv_R013YNNN_generator_16_0200_0258 =
      rs_R013_ueqv_R013YNNN_partial_16_0233 := by
  native_decide

/-- Coefficient term 234 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0234 : Poly :=
[
  term ((-125744631500 : Rat) / 150171761) [(9, 1), (11, 1)]
]

/-- Partial product 234 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0234 : Poly :=
[
  term ((-251489263000 : Rat) / 150171761) [(6, 1), (9, 1), (11, 1)],
  term ((125744631500 : Rat) / 150171761) [(9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 234 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0234_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0234
        rs_R013_ueqv_R013YNNN_generator_16_0200_0258 =
      rs_R013_ueqv_R013YNNN_partial_16_0234 := by
  native_decide

/-- Coefficient term 235 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0235 : Poly :=
[
  term ((1798834800 : Rat) / 150171761) [(9, 1), (11, 1), (12, 1)]
]

/-- Partial product 235 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0235 : Poly :=
[
  term ((3597669600 : Rat) / 150171761) [(6, 1), (9, 1), (11, 1), (12, 1)],
  term ((-1798834800 : Rat) / 150171761) [(9, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 235 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0235_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0235
        rs_R013_ueqv_R013YNNN_generator_16_0200_0258 =
      rs_R013_ueqv_R013YNNN_partial_16_0235 := by
  native_decide

/-- Coefficient term 236 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0236 : Poly :=
[
  term ((86650185335740635 : Rat) / 1288183727709509) [(9, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 236 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0236 : Poly :=
[
  term ((173300370671481270 : Rat) / 1288183727709509) [(6, 1), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((-86650185335740635 : Rat) / 1288183727709509) [(9, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 236 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0236_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0236
        rs_R013_ueqv_R013YNNN_generator_16_0200_0258 =
      rs_R013_ueqv_R013YNNN_partial_16_0236 := by
  native_decide

/-- Coefficient term 237 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0237 : Poly :=
[
  term ((-21913747167048016051 : Rat) / 5152734910838036) [(9, 1), (11, 2), (15, 1)]
]

/-- Partial product 237 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0237 : Poly :=
[
  term ((-21913747167048016051 : Rat) / 2576367455419018) [(6, 1), (9, 1), (11, 2), (15, 1)],
  term ((21913747167048016051 : Rat) / 5152734910838036) [(9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 237 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0237_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0237
        rs_R013_ueqv_R013YNNN_generator_16_0200_0258 =
      rs_R013_ueqv_R013YNNN_partial_16_0237 := by
  native_decide

/-- Coefficient term 238 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0238 : Poly :=
[
  term ((-8706969108 : Rat) / 8578069) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 238 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0238 : Poly :=
[
  term ((-17413938216 : Rat) / 8578069) [(6, 1), (9, 1), (12, 1), (15, 1)],
  term ((8706969108 : Rat) / 8578069) [(9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 238 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0238_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0238
        rs_R013_ueqv_R013YNNN_generator_16_0200_0258 =
      rs_R013_ueqv_R013YNNN_partial_16_0238 := by
  native_decide

/-- Coefficient term 239 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0239 : Poly :=
[
  term ((37782846089 : Rat) / 25734207) [(9, 1), (15, 1)]
]

/-- Partial product 239 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0239 : Poly :=
[
  term ((75565692178 : Rat) / 25734207) [(6, 1), (9, 1), (15, 1)],
  term ((-37782846089 : Rat) / 25734207) [(9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 239 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0239_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0239
        rs_R013_ueqv_R013YNNN_generator_16_0200_0258 =
      rs_R013_ueqv_R013YNNN_partial_16_0239 := by
  native_decide

/-- Coefficient term 240 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0240 : Poly :=
[
  term (2 : Rat) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 240 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0240 : Poly :=
[
  term (4 : Rat) [(6, 1), (9, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 240 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0240_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0240
        rs_R013_ueqv_R013YNNN_generator_16_0200_0258 =
      rs_R013_ueqv_R013YNNN_partial_16_0240 := by
  native_decide

/-- Coefficient term 241 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0241 : Poly :=
[
  term (-40 : Rat) [(9, 2)]
]

/-- Partial product 241 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0241 : Poly :=
[
  term (-80 : Rat) [(6, 1), (9, 2)],
  term (40 : Rat) [(9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 241 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0241_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0241
        rs_R013_ueqv_R013YNNN_generator_16_0200_0258 =
      rs_R013_ueqv_R013YNNN_partial_16_0241 := by
  native_decide

/-- Coefficient term 242 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0242 : Poly :=
[
  term (-80 : Rat) [(10, 1)]
]

/-- Partial product 242 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0242 : Poly :=
[
  term (-160 : Rat) [(6, 1), (10, 1)],
  term (80 : Rat) [(10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 242 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0242_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0242
        rs_R013_ueqv_R013YNNN_generator_16_0200_0258 =
      rs_R013_ueqv_R013YNNN_partial_16_0242 := by
  native_decide

/-- Coefficient term 243 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0243 : Poly :=
[
  term ((16256607488 : Rat) / 8578069) [(10, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 243 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0243 : Poly :=
[
  term ((32513214976 : Rat) / 8578069) [(6, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-16256607488 : Rat) / 8578069) [(10, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 243 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0243_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0243
        rs_R013_ueqv_R013YNNN_generator_16_0200_0258 =
      rs_R013_ueqv_R013YNNN_partial_16_0243 := by
  native_decide

/-- Coefficient term 244 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0244 : Poly :=
[
  term ((-41996023245 : Rat) / 17156138) [(10, 1), (11, 1), (15, 1)]
]

/-- Partial product 244 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0244 : Poly :=
[
  term ((-41996023245 : Rat) / 8578069) [(6, 1), (10, 1), (11, 1), (15, 1)],
  term ((41996023245 : Rat) / 17156138) [(10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 244 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0244_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0244
        rs_R013_ueqv_R013YNNN_generator_16_0200_0258 =
      rs_R013_ueqv_R013YNNN_partial_16_0244 := by
  native_decide

/-- Coefficient term 245 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0245 : Poly :=
[
  term ((-239750429760 : Rat) / 150171761) [(10, 1), (11, 2)]
]

/-- Partial product 245 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0245 : Poly :=
[
  term ((-479500859520 : Rat) / 150171761) [(6, 1), (10, 1), (11, 2)],
  term ((239750429760 : Rat) / 150171761) [(10, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 245 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0245_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0245
        rs_R013_ueqv_R013YNNN_generator_16_0200_0258 =
      rs_R013_ueqv_R013YNNN_partial_16_0245 := by
  native_decide

/-- Coefficient term 246 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0246 : Poly :=
[
  term ((3947059200 : Rat) / 150171761) [(10, 1), (11, 2), (12, 1)]
]

/-- Partial product 246 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0246 : Poly :=
[
  term ((7894118400 : Rat) / 150171761) [(6, 1), (10, 1), (11, 2), (12, 1)],
  term ((-3947059200 : Rat) / 150171761) [(10, 1), (11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 246 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0246_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0246
        rs_R013_ueqv_R013YNNN_generator_16_0200_0258 =
      rs_R013_ueqv_R013YNNN_partial_16_0246 := by
  native_decide

/-- Coefficient term 247 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0247 : Poly :=
[
  term ((190130528501639040 : Rat) / 1288183727709509) [(10, 1), (11, 3), (12, 1), (15, 1)]
]

/-- Partial product 247 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0247 : Poly :=
[
  term ((380261057003278080 : Rat) / 1288183727709509) [(6, 1), (10, 1), (11, 3), (12, 1), (15, 1)],
  term ((-190130528501639040 : Rat) / 1288183727709509) [(10, 1), (11, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 247 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0247_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0247
        rs_R013_ueqv_R013YNNN_generator_16_0200_0258 =
      rs_R013_ueqv_R013YNNN_partial_16_0247 := by
  native_decide

/-- Coefficient term 248 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0248 : Poly :=
[
  term ((-11548819921110858612 : Rat) / 1288183727709509) [(10, 1), (11, 3), (15, 1)]
]

/-- Partial product 248 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0248 : Poly :=
[
  term ((-23097639842221717224 : Rat) / 1288183727709509) [(6, 1), (10, 1), (11, 3), (15, 1)],
  term ((11548819921110858612 : Rat) / 1288183727709509) [(10, 1), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 248 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0248_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0248
        rs_R013_ueqv_R013YNNN_generator_16_0200_0258 =
      rs_R013_ueqv_R013YNNN_partial_16_0248 := by
  native_decide

/-- Coefficient term 249 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0249 : Poly :=
[
  term ((1918340009954760272 : Rat) / 1288183727709509) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 249 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0249 : Poly :=
[
  term ((3836680019909520544 : Rat) / 1288183727709509) [(6, 1), (11, 1), (12, 1), (15, 1)],
  term ((-1918340009954760272 : Rat) / 1288183727709509) [(11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 249 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0249_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0249
        rs_R013_ueqv_R013YNNN_generator_16_0200_0258 =
      rs_R013_ueqv_R013YNNN_partial_16_0249 := by
  native_decide

/-- Coefficient term 250 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0250 : Poly :=
[
  term ((4720969972449303 : Rat) / 303102053578708) [(11, 1), (15, 1)]
]

/-- Partial product 250 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0250 : Poly :=
[
  term ((4720969972449303 : Rat) / 151551026789354) [(6, 1), (11, 1), (15, 1)],
  term ((-4720969972449303 : Rat) / 303102053578708) [(11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 250 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0250_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0250
        rs_R013_ueqv_R013YNNN_generator_16_0200_0258 =
      rs_R013_ueqv_R013YNNN_partial_16_0250 := by
  native_decide

/-- Coefficient term 251 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0251 : Poly :=
[
  term ((-36062927250 : Rat) / 150171761) [(11, 2)]
]

/-- Partial product 251 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0251 : Poly :=
[
  term ((-72125854500 : Rat) / 150171761) [(6, 1), (11, 2)],
  term ((36062927250 : Rat) / 150171761) [(11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 251 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0251_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0251
        rs_R013_ueqv_R013YNNN_generator_16_0200_0258 =
      rs_R013_ueqv_R013YNNN_partial_16_0251 := by
  native_decide

/-- Coefficient term 252 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0252 : Poly :=
[
  term ((3453676800 : Rat) / 150171761) [(11, 2), (12, 1)]
]

/-- Partial product 252 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0252 : Poly :=
[
  term ((6907353600 : Rat) / 150171761) [(6, 1), (11, 2), (12, 1)],
  term ((-3453676800 : Rat) / 150171761) [(11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 252 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0252_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0252
        rs_R013_ueqv_R013YNNN_generator_16_0200_0258 =
      rs_R013_ueqv_R013YNNN_partial_16_0252 := by
  native_decide

/-- Coefficient term 253 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0253 : Poly :=
[
  term ((-1222960813492723065 : Rat) / 1288183727709509) [(11, 2), (12, 1), (15, 2)]
]

/-- Partial product 253 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0253 : Poly :=
[
  term ((-2445921626985446130 : Rat) / 1288183727709509) [(6, 1), (11, 2), (12, 1), (15, 2)],
  term ((1222960813492723065 : Rat) / 1288183727709509) [(11, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 253 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0253_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0253
        rs_R013_ueqv_R013YNNN_generator_16_0200_0258 =
      rs_R013_ueqv_R013YNNN_partial_16_0253 := by
  native_decide

/-- Coefficient term 254 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0254 : Poly :=
[
  term ((55069626572449585 : Rat) / 75775513394677) [(11, 2), (15, 2)]
]

/-- Partial product 254 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0254 : Poly :=
[
  term ((110139253144899170 : Rat) / 75775513394677) [(6, 1), (11, 2), (15, 2)],
  term ((-55069626572449585 : Rat) / 75775513394677) [(11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 254 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0254_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0254
        rs_R013_ueqv_R013YNNN_generator_16_0200_0258 =
      rs_R013_ueqv_R013YNNN_partial_16_0254 := by
  native_decide

/-- Coefficient term 255 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0255 : Poly :=
[
  term ((166364212438934160 : Rat) / 1288183727709509) [(11, 3), (12, 1), (15, 1)]
]

/-- Partial product 255 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0255 : Poly :=
[
  term ((332728424877868320 : Rat) / 1288183727709509) [(6, 1), (11, 3), (12, 1), (15, 1)],
  term ((-166364212438934160 : Rat) / 1288183727709509) [(11, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 255 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0255_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0255
        rs_R013_ueqv_R013YNNN_generator_16_0200_0258 =
      rs_R013_ueqv_R013YNNN_partial_16_0255 := by
  native_decide

/-- Coefficient term 256 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0256 : Poly :=
[
  term ((-13897259848261024725 : Rat) / 10305469821676072) [(11, 3), (15, 1)]
]

/-- Partial product 256 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0256 : Poly :=
[
  term ((-13897259848261024725 : Rat) / 5152734910838036) [(6, 1), (11, 3), (15, 1)],
  term ((13897259848261024725 : Rat) / 10305469821676072) [(11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 256 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0256_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0256
        rs_R013_ueqv_R013YNNN_generator_16_0200_0258 =
      rs_R013_ueqv_R013YNNN_partial_16_0256 := by
  native_decide

/-- Coefficient term 257 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0257 : Poly :=
[
  term ((-2623673188 : Rat) / 8578069) [(12, 1), (15, 2)]
]

/-- Partial product 257 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0257 : Poly :=
[
  term ((-5247346376 : Rat) / 8578069) [(6, 1), (12, 1), (15, 2)],
  term ((2623673188 : Rat) / 8578069) [(12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 257 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0257_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0257
        rs_R013_ueqv_R013YNNN_generator_16_0200_0258 =
      rs_R013_ueqv_R013YNNN_partial_16_0257 := by
  native_decide

/-- Coefficient term 258 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0258 : Poly :=
[
  term ((-2773982228 : Rat) / 25734207) [(15, 2)]
]

/-- Partial product 258 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0258 : Poly :=
[
  term ((-5547964456 : Rat) / 25734207) [(6, 1), (15, 2)],
  term ((2773982228 : Rat) / 25734207) [(15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 258 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0258_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0258
        rs_R013_ueqv_R013YNNN_generator_16_0200_0258 =
      rs_R013_ueqv_R013YNNN_partial_16_0258 := by
  native_decide

/-- Partial products in this block. -/
def rs_R013_ueqv_R013YNNN_partials_16_0200_0258 : List Poly :=
[
  rs_R013_ueqv_R013YNNN_partial_16_0200,
  rs_R013_ueqv_R013YNNN_partial_16_0201,
  rs_R013_ueqv_R013YNNN_partial_16_0202,
  rs_R013_ueqv_R013YNNN_partial_16_0203,
  rs_R013_ueqv_R013YNNN_partial_16_0204,
  rs_R013_ueqv_R013YNNN_partial_16_0205,
  rs_R013_ueqv_R013YNNN_partial_16_0206,
  rs_R013_ueqv_R013YNNN_partial_16_0207,
  rs_R013_ueqv_R013YNNN_partial_16_0208,
  rs_R013_ueqv_R013YNNN_partial_16_0209,
  rs_R013_ueqv_R013YNNN_partial_16_0210,
  rs_R013_ueqv_R013YNNN_partial_16_0211,
  rs_R013_ueqv_R013YNNN_partial_16_0212,
  rs_R013_ueqv_R013YNNN_partial_16_0213,
  rs_R013_ueqv_R013YNNN_partial_16_0214,
  rs_R013_ueqv_R013YNNN_partial_16_0215,
  rs_R013_ueqv_R013YNNN_partial_16_0216,
  rs_R013_ueqv_R013YNNN_partial_16_0217,
  rs_R013_ueqv_R013YNNN_partial_16_0218,
  rs_R013_ueqv_R013YNNN_partial_16_0219,
  rs_R013_ueqv_R013YNNN_partial_16_0220,
  rs_R013_ueqv_R013YNNN_partial_16_0221,
  rs_R013_ueqv_R013YNNN_partial_16_0222,
  rs_R013_ueqv_R013YNNN_partial_16_0223,
  rs_R013_ueqv_R013YNNN_partial_16_0224,
  rs_R013_ueqv_R013YNNN_partial_16_0225,
  rs_R013_ueqv_R013YNNN_partial_16_0226,
  rs_R013_ueqv_R013YNNN_partial_16_0227,
  rs_R013_ueqv_R013YNNN_partial_16_0228,
  rs_R013_ueqv_R013YNNN_partial_16_0229,
  rs_R013_ueqv_R013YNNN_partial_16_0230,
  rs_R013_ueqv_R013YNNN_partial_16_0231,
  rs_R013_ueqv_R013YNNN_partial_16_0232,
  rs_R013_ueqv_R013YNNN_partial_16_0233,
  rs_R013_ueqv_R013YNNN_partial_16_0234,
  rs_R013_ueqv_R013YNNN_partial_16_0235,
  rs_R013_ueqv_R013YNNN_partial_16_0236,
  rs_R013_ueqv_R013YNNN_partial_16_0237,
  rs_R013_ueqv_R013YNNN_partial_16_0238,
  rs_R013_ueqv_R013YNNN_partial_16_0239,
  rs_R013_ueqv_R013YNNN_partial_16_0240,
  rs_R013_ueqv_R013YNNN_partial_16_0241,
  rs_R013_ueqv_R013YNNN_partial_16_0242,
  rs_R013_ueqv_R013YNNN_partial_16_0243,
  rs_R013_ueqv_R013YNNN_partial_16_0244,
  rs_R013_ueqv_R013YNNN_partial_16_0245,
  rs_R013_ueqv_R013YNNN_partial_16_0246,
  rs_R013_ueqv_R013YNNN_partial_16_0247,
  rs_R013_ueqv_R013YNNN_partial_16_0248,
  rs_R013_ueqv_R013YNNN_partial_16_0249,
  rs_R013_ueqv_R013YNNN_partial_16_0250,
  rs_R013_ueqv_R013YNNN_partial_16_0251,
  rs_R013_ueqv_R013YNNN_partial_16_0252,
  rs_R013_ueqv_R013YNNN_partial_16_0253,
  rs_R013_ueqv_R013YNNN_partial_16_0254,
  rs_R013_ueqv_R013YNNN_partial_16_0255,
  rs_R013_ueqv_R013YNNN_partial_16_0256,
  rs_R013_ueqv_R013YNNN_partial_16_0257,
  rs_R013_ueqv_R013YNNN_partial_16_0258
]

/-- Sum of partial products in this block. -/
def rs_R013_ueqv_R013YNNN_block_16_0200_0258 : Poly :=
[
  term (-224 : Rat) [(6, 1), (7, 1), (9, 1)],
  term (320 : Rat) [(6, 1), (7, 1), (9, 1), (10, 1)],
  term ((43003583728 : Rat) / 150171761) [(6, 1), (7, 1), (10, 1), (11, 1)],
  term ((1315686400 : Rat) / 150171761) [(6, 1), (7, 1), (10, 1), (11, 1), (12, 1)],
  term ((63376842833879680 : Rat) / 1288183727709509) [(6, 1), (7, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((-3484068180475701389 : Rat) / 1288183727709509) [(6, 1), (7, 1), (10, 1), (11, 2), (15, 1)],
  term ((16256607488 : Rat) / 25734207) [(6, 1), (7, 1), (10, 1), (12, 1), (15, 1)],
  term ((-45774361705 : Rat) / 25734207) [(6, 1), (7, 1), (10, 1), (15, 1)],
  term ((-51320717440 : Rat) / 150171761) [(6, 1), (7, 1), (11, 1)],
  term ((1469913200 : Rat) / 150171761) [(6, 1), (7, 1), (11, 1), (12, 1)],
  term ((70805974627270715 : Rat) / 1288183727709509) [(6, 1), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((-1314719912069773766 : Rat) / 1288183727709509) [(6, 1), (7, 1), (11, 2), (15, 1)],
  term ((-30185059196 : Rat) / 25734207) [(6, 1), (7, 1), (12, 1), (15, 1)],
  term ((54671356516 : Rat) / 25734207) [(6, 1), (7, 1), (15, 1)],
  term (6 : Rat) [(6, 1), (7, 1), (15, 1), (16, 1)],
  term (-288 : Rat) [(6, 1), (7, 2)],
  term (128 : Rat) [(6, 1), (7, 2), (10, 1)],
  term ((-126636655400 : Rat) / 150171761) [(6, 1), (9, 1), (10, 1), (11, 1)],
  term ((3289216000 : Rat) / 150171761) [(6, 1), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((221818949918578880 : Rat) / 1288183727709509) [(6, 1), (9, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((-19168355814909398363 : Rat) / 2576367455419018) [(6, 1), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((56898126208 : Rat) / 25734207) [(6, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-83833304297 : Rat) / 25734207) [(6, 1), (9, 1), (10, 1), (15, 1)],
  term ((-310516455440 : Rat) / 150171761) [(6, 1), (9, 1), (11, 1)],
  term ((5725426000 : Rat) / 150171761) [(6, 1), (9, 1), (11, 1), (12, 1)],
  term ((275794766715691825 : Rat) / 1288183727709509) [(6, 1), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((-13800223714828132491 : Rat) / 1288183727709509) [(6, 1), (9, 1), (11, 2), (15, 1)],
  term ((-74298570100 : Rat) / 25734207) [(6, 1), (9, 1), (12, 1), (15, 1)],
  term ((107961754612 : Rat) / 25734207) [(6, 1), (9, 1), (15, 1)],
  term (6 : Rat) [(6, 1), (9, 1), (15, 1), (16, 1)],
  term (-80 : Rat) [(6, 1), (9, 2)],
  term (-160 : Rat) [(6, 1), (10, 1)],
  term ((32513214976 : Rat) / 8578069) [(6, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-41996023245 : Rat) / 8578069) [(6, 1), (10, 1), (11, 1), (15, 1)],
  term ((-479500859520 : Rat) / 150171761) [(6, 1), (10, 1), (11, 2)],
  term ((7894118400 : Rat) / 150171761) [(6, 1), (10, 1), (11, 2), (12, 1)],
  term ((380261057003278080 : Rat) / 1288183727709509) [(6, 1), (10, 1), (11, 3), (12, 1), (15, 1)],
  term ((-23097639842221717224 : Rat) / 1288183727709509) [(6, 1), (10, 1), (11, 3), (15, 1)],
  term ((3836680019909520544 : Rat) / 1288183727709509) [(6, 1), (11, 1), (12, 1), (15, 1)],
  term ((4720969972449303 : Rat) / 151551026789354) [(6, 1), (11, 1), (15, 1)],
  term ((-72125854500 : Rat) / 150171761) [(6, 1), (11, 2)],
  term ((6907353600 : Rat) / 150171761) [(6, 1), (11, 2), (12, 1)],
  term ((-2445921626985446130 : Rat) / 1288183727709509) [(6, 1), (11, 2), (12, 1), (15, 2)],
  term ((110139253144899170 : Rat) / 75775513394677) [(6, 1), (11, 2), (15, 2)],
  term ((332728424877868320 : Rat) / 1288183727709509) [(6, 1), (11, 3), (12, 1), (15, 1)],
  term ((-13897259848261024725 : Rat) / 5152734910838036) [(6, 1), (11, 3), (15, 1)],
  term ((-5247346376 : Rat) / 8578069) [(6, 1), (12, 1), (15, 2)],
  term ((-5547964456 : Rat) / 25734207) [(6, 1), (15, 2)],
  term ((-126753685667759360 : Rat) / 1288183727709509) [(6, 2), (9, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((6968136360951402778 : Rat) / 1288183727709509) [(6, 2), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((-32513214976 : Rat) / 25734207) [(6, 2), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((45305356358 : Rat) / 25734207) [(6, 2), (9, 1), (10, 1), (15, 1)],
  term ((118054384880 : Rat) / 150171761) [(6, 2), (9, 1), (11, 1)],
  term ((-4255512800 : Rat) / 150171761) [(6, 2), (9, 1), (11, 1), (12, 1)],
  term ((-204988792088421110 : Rat) / 1288183727709509) [(6, 2), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((5686700262608248931 : Rat) / 1288183727709509) [(6, 2), (9, 1), (11, 2), (15, 1)],
  term ((44113510904 : Rat) / 25734207) [(6, 2), (9, 1), (12, 1), (15, 1)],
  term ((-21597374956 : Rat) / 8578069) [(6, 2), (9, 1), (15, 1)],
  term (-4 : Rat) [(6, 2), (9, 1), (15, 1), (16, 1)],
  term (112 : Rat) [(7, 1), (9, 1)],
  term (-160 : Rat) [(7, 1), (9, 1), (10, 1)],
  term ((-21501791864 : Rat) / 150171761) [(7, 1), (10, 1), (11, 1)],
  term ((-657843200 : Rat) / 150171761) [(7, 1), (10, 1), (11, 1), (12, 1)],
  term ((-31688421416939840 : Rat) / 1288183727709509) [(7, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((3484068180475701389 : Rat) / 2576367455419018) [(7, 1), (10, 1), (11, 2), (15, 1)],
  term ((-8128303744 : Rat) / 25734207) [(7, 1), (10, 1), (12, 1), (15, 1)],
  term ((45774361705 : Rat) / 51468414) [(7, 1), (10, 1), (15, 1)],
  term ((25660358720 : Rat) / 150171761) [(7, 1), (11, 1)],
  term ((-734956600 : Rat) / 150171761) [(7, 1), (11, 1), (12, 1)],
  term ((-70805974627270715 : Rat) / 2576367455419018) [(7, 1), (11, 2), (12, 1), (15, 1)],
  term ((657359956034886883 : Rat) / 1288183727709509) [(7, 1), (11, 2), (15, 1)],
  term ((15092529598 : Rat) / 25734207) [(7, 1), (12, 1), (15, 1)],
  term ((-27335678258 : Rat) / 25734207) [(7, 1), (15, 1)],
  term (-3 : Rat) [(7, 1), (15, 1), (16, 1)],
  term (144 : Rat) [(7, 2)],
  term (-64 : Rat) [(7, 2), (10, 1)],
  term ((63318327700 : Rat) / 150171761) [(9, 1), (10, 1), (11, 1)],
  term ((-1644608000 : Rat) / 150171761) [(9, 1), (10, 1), (11, 1), (12, 1)],
  term ((-79221053542349600 : Rat) / 1288183727709509) [(9, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((12200219453957995585 : Rat) / 5152734910838036) [(9, 1), (10, 1), (11, 2), (15, 1)],
  term ((-20320759360 : Rat) / 25734207) [(9, 1), (10, 1), (12, 1), (15, 1)],
  term ((30590313059 : Rat) / 25734207) [(9, 1), (10, 1), (15, 1)],
  term ((125744631500 : Rat) / 150171761) [(9, 1), (11, 1)],
  term ((-1798834800 : Rat) / 150171761) [(9, 1), (11, 1), (12, 1)],
  term ((-86650185335740635 : Rat) / 1288183727709509) [(9, 1), (11, 2), (12, 1), (15, 1)],
  term ((21913747167048016051 : Rat) / 5152734910838036) [(9, 1), (11, 2), (15, 1)],
  term ((8706969108 : Rat) / 8578069) [(9, 1), (12, 1), (15, 1)],
  term ((-37782846089 : Rat) / 25734207) [(9, 1), (15, 1)],
  term (-2 : Rat) [(9, 1), (15, 1), (16, 1)],
  term (40 : Rat) [(9, 2)],
  term (80 : Rat) [(10, 1)],
  term ((-16256607488 : Rat) / 8578069) [(10, 1), (11, 1), (12, 1), (15, 1)],
  term ((41996023245 : Rat) / 17156138) [(10, 1), (11, 1), (15, 1)],
  term ((239750429760 : Rat) / 150171761) [(10, 1), (11, 2)],
  term ((-3947059200 : Rat) / 150171761) [(10, 1), (11, 2), (12, 1)],
  term ((-190130528501639040 : Rat) / 1288183727709509) [(10, 1), (11, 3), (12, 1), (15, 1)],
  term ((11548819921110858612 : Rat) / 1288183727709509) [(10, 1), (11, 3), (15, 1)],
  term ((-1918340009954760272 : Rat) / 1288183727709509) [(11, 1), (12, 1), (15, 1)],
  term ((-4720969972449303 : Rat) / 303102053578708) [(11, 1), (15, 1)],
  term ((36062927250 : Rat) / 150171761) [(11, 2)],
  term ((-3453676800 : Rat) / 150171761) [(11, 2), (12, 1)],
  term ((1222960813492723065 : Rat) / 1288183727709509) [(11, 2), (12, 1), (15, 2)],
  term ((-55069626572449585 : Rat) / 75775513394677) [(11, 2), (15, 2)],
  term ((-166364212438934160 : Rat) / 1288183727709509) [(11, 3), (12, 1), (15, 1)],
  term ((13897259848261024725 : Rat) / 10305469821676072) [(11, 3), (15, 1)],
  term ((2623673188 : Rat) / 8578069) [(12, 1), (15, 2)],
  term ((2773982228 : Rat) / 25734207) [(15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 16, terms 200 through 258. -/
theorem rs_R013_ueqv_R013YNNN_block_16_0200_0258_valid :
    checkProductSumEq rs_R013_ueqv_R013YNNN_partials_16_0200_0258
      rs_R013_ueqv_R013YNNN_block_16_0200_0258 = true := by
  native_decide

end R013UeqvR013YNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
