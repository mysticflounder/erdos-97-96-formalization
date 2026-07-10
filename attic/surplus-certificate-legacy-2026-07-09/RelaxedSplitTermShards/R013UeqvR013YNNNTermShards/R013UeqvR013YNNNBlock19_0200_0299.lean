/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R013:u=v:R013YNNN, term block 19:200-299

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R013UeqvR013YNNNTermShards

/-- Generator polynomial 19 for relaxed split surplus certificate `R013:u=v:R013YNNN`. -/
def rs_R013_ueqv_R013YNNN_generator_19_0200_0299 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(8, 1)]
]

/-- Coefficient term 200 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0200 : Poly :=
[
  term ((27092083200 : Rat) / 150171761) [(3, 1), (6, 1), (10, 1), (11, 1)]
]

/-- Partial product 200 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0200 : Poly :=
[
  term ((54184166400 : Rat) / 150171761) [(3, 1), (6, 1), (8, 1), (10, 1), (11, 1)],
  term ((-27092083200 : Rat) / 150171761) [(3, 1), (6, 1), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0200_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0200
        rs_R013_ueqv_R013YNNN_generator_19_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_19_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0201 : Poly :=
[
  term ((1305030362105127840 : Rat) / 1288183727709509) [(3, 1), (6, 1), (10, 1), (11, 2), (15, 1)]
]

/-- Partial product 201 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0201 : Poly :=
[
  term ((2610060724210255680 : Rat) / 1288183727709509) [(3, 1), (6, 1), (8, 1), (10, 1), (11, 2), (15, 1)],
  term ((-1305030362105127840 : Rat) / 1288183727709509) [(3, 1), (6, 1), (10, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0201_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0201
        rs_R013_ueqv_R013YNNN_generator_19_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_19_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0202 : Poly :=
[
  term ((-1721558592 : Rat) / 8578069) [(3, 1), (6, 1), (10, 1), (15, 1)]
]

/-- Partial product 202 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0202 : Poly :=
[
  term ((-3443117184 : Rat) / 8578069) [(3, 1), (6, 1), (8, 1), (10, 1), (15, 1)],
  term ((1721558592 : Rat) / 8578069) [(3, 1), (6, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0202_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0202
        rs_R013_ueqv_R013YNNN_generator_19_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_19_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0203 : Poly :=
[
  term ((-7028029100 : Rat) / 150171761) [(3, 1), (6, 1), (11, 1)]
]

/-- Partial product 203 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0203 : Poly :=
[
  term ((-14056058200 : Rat) / 150171761) [(3, 1), (6, 1), (8, 1), (11, 1)],
  term ((7028029100 : Rat) / 150171761) [(3, 1), (6, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0203_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0203
        rs_R013_ueqv_R013YNNN_generator_19_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_19_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0204 : Poly :=
[
  term ((-1354165538847655055 : Rat) / 5152734910838036) [(3, 1), (6, 1), (11, 2), (15, 1)]
]

/-- Partial product 204 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0204 : Poly :=
[
  term ((-1354165538847655055 : Rat) / 2576367455419018) [(3, 1), (6, 1), (8, 1), (11, 2), (15, 1)],
  term ((1354165538847655055 : Rat) / 5152734910838036) [(3, 1), (6, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0204_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0204
        rs_R013_ueqv_R013YNNN_generator_19_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_19_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0205 : Poly :=
[
  term ((973302563 : Rat) / 25734207) [(3, 1), (6, 1), (15, 1)]
]

/-- Partial product 205 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0205 : Poly :=
[
  term ((1946605126 : Rat) / 25734207) [(3, 1), (6, 1), (8, 1), (15, 1)],
  term ((-973302563 : Rat) / 25734207) [(3, 1), (6, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0205_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0205
        rs_R013_ueqv_R013YNNN_generator_19_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_19_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0206 : Poly :=
[
  term ((-41092248000 : Rat) / 150171761) [(4, 1), (6, 1), (7, 1), (11, 1)]
]

/-- Partial product 206 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0206 : Poly :=
[
  term ((-82184496000 : Rat) / 150171761) [(4, 1), (6, 1), (7, 1), (8, 1), (11, 1)],
  term ((41092248000 : Rat) / 150171761) [(4, 1), (6, 1), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0206_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0206
        rs_R013_ueqv_R013YNNN_generator_19_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_19_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0207 : Poly :=
[
  term ((-1979420736724805100 : Rat) / 1288183727709509) [(4, 1), (6, 1), (7, 1), (11, 2), (15, 1)]
]

/-- Partial product 207 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0207 : Poly :=
[
  term ((-3958841473449610200 : Rat) / 1288183727709509) [(4, 1), (6, 1), (7, 1), (8, 1), (11, 2), (15, 1)],
  term ((1979420736724805100 : Rat) / 1288183727709509) [(4, 1), (6, 1), (7, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0207_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0207
        rs_R013_ueqv_R013YNNN_generator_19_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_19_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0208 : Poly :=
[
  term ((-258686000 : Rat) / 8578069) [(4, 1), (6, 1), (7, 1), (15, 1)]
]

/-- Partial product 208 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0208 : Poly :=
[
  term ((-517372000 : Rat) / 8578069) [(4, 1), (6, 1), (7, 1), (8, 1), (15, 1)],
  term ((258686000 : Rat) / 8578069) [(4, 1), (6, 1), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0208_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0208
        rs_R013_ueqv_R013YNNN_generator_19_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_19_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0209 : Poly :=
[
  term ((-20546124000 : Rat) / 150171761) [(4, 1), (6, 1), (9, 1), (11, 1)]
]

/-- Partial product 209 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0209 : Poly :=
[
  term ((-41092248000 : Rat) / 150171761) [(4, 1), (6, 1), (8, 1), (9, 1), (11, 1)],
  term ((20546124000 : Rat) / 150171761) [(4, 1), (6, 1), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0209_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0209
        rs_R013_ueqv_R013YNNN_generator_19_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_19_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0210 : Poly :=
[
  term ((-989710368362402550 : Rat) / 1288183727709509) [(4, 1), (6, 1), (9, 1), (11, 2), (15, 1)]
]

/-- Partial product 210 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0210 : Poly :=
[
  term ((-1979420736724805100 : Rat) / 1288183727709509) [(4, 1), (6, 1), (8, 1), (9, 1), (11, 2), (15, 1)],
  term ((989710368362402550 : Rat) / 1288183727709509) [(4, 1), (6, 1), (9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0210_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0210
        rs_R013_ueqv_R013YNNN_generator_19_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_19_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0211 : Poly :=
[
  term ((-129343000 : Rat) / 8578069) [(4, 1), (6, 1), (9, 1), (15, 1)]
]

/-- Partial product 211 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0211 : Poly :=
[
  term ((-258686000 : Rat) / 8578069) [(4, 1), (6, 1), (8, 1), (9, 1), (15, 1)],
  term ((129343000 : Rat) / 8578069) [(4, 1), (6, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0211_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0211
        rs_R013_ueqv_R013YNNN_generator_19_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_19_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0212 : Poly :=
[
  term ((20546124000 : Rat) / 150171761) [(4, 1), (7, 1), (8, 1), (11, 1)]
]

/-- Partial product 212 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0212 : Poly :=
[
  term ((-20546124000 : Rat) / 150171761) [(4, 1), (7, 1), (8, 1), (11, 1)],
  term ((41092248000 : Rat) / 150171761) [(4, 1), (7, 1), (8, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0212_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0212
        rs_R013_ueqv_R013YNNN_generator_19_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_19_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0213 : Poly :=
[
  term ((989710368362402550 : Rat) / 1288183727709509) [(4, 1), (7, 1), (8, 1), (11, 2), (15, 1)]
]

/-- Partial product 213 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0213 : Poly :=
[
  term ((-989710368362402550 : Rat) / 1288183727709509) [(4, 1), (7, 1), (8, 1), (11, 2), (15, 1)],
  term ((1979420736724805100 : Rat) / 1288183727709509) [(4, 1), (7, 1), (8, 2), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0213_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0213
        rs_R013_ueqv_R013YNNN_generator_19_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_19_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0214 : Poly :=
[
  term ((129343000 : Rat) / 8578069) [(4, 1), (7, 1), (8, 1), (15, 1)]
]

/-- Partial product 214 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0214 : Poly :=
[
  term ((-129343000 : Rat) / 8578069) [(4, 1), (7, 1), (8, 1), (15, 1)],
  term ((258686000 : Rat) / 8578069) [(4, 1), (7, 1), (8, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0214_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0214
        rs_R013_ueqv_R013YNNN_generator_19_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_19_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0215 : Poly :=
[
  term ((10273062000 : Rat) / 150171761) [(4, 1), (7, 1), (11, 1)]
]

/-- Partial product 215 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0215 : Poly :=
[
  term ((20546124000 : Rat) / 150171761) [(4, 1), (7, 1), (8, 1), (11, 1)],
  term ((-10273062000 : Rat) / 150171761) [(4, 1), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0215_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0215
        rs_R013_ueqv_R013YNNN_generator_19_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_19_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0216 : Poly :=
[
  term ((494855184181201275 : Rat) / 1288183727709509) [(4, 1), (7, 1), (11, 2), (15, 1)]
]

/-- Partial product 216 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0216 : Poly :=
[
  term ((989710368362402550 : Rat) / 1288183727709509) [(4, 1), (7, 1), (8, 1), (11, 2), (15, 1)],
  term ((-494855184181201275 : Rat) / 1288183727709509) [(4, 1), (7, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0216_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0216
        rs_R013_ueqv_R013YNNN_generator_19_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_19_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0217 : Poly :=
[
  term ((64671500 : Rat) / 8578069) [(4, 1), (7, 1), (15, 1)]
]

/-- Partial product 217 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0217 : Poly :=
[
  term ((129343000 : Rat) / 8578069) [(4, 1), (7, 1), (8, 1), (15, 1)],
  term ((-64671500 : Rat) / 8578069) [(4, 1), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0217_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0217
        rs_R013_ueqv_R013YNNN_generator_19_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_19_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0218 : Poly :=
[
  term ((48092330400 : Rat) / 150171761) [(4, 1), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 218 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0218 : Poly :=
[
  term ((96184660800 : Rat) / 150171761) [(4, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-48092330400 : Rat) / 150171761) [(4, 1), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0218_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0218
        rs_R013_ueqv_R013YNNN_generator_19_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_19_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0219 : Poly :=
[
  term ((2316615924034643730 : Rat) / 1288183727709509) [(4, 1), (10, 1), (11, 2), (15, 2)]
]

/-- Partial product 219 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0219 : Poly :=
[
  term ((4633231848069287460 : Rat) / 1288183727709509) [(4, 1), (8, 1), (10, 1), (11, 2), (15, 2)],
  term ((-2316615924034643730 : Rat) / 1288183727709509) [(4, 1), (10, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0219_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0219
        rs_R013_ueqv_R013YNNN_generator_19_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_19_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0220 : Poly :=
[
  term ((1248808296 : Rat) / 8578069) [(4, 1), (10, 1), (15, 2)]
]

/-- Partial product 220 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0220 : Poly :=
[
  term ((2497616592 : Rat) / 8578069) [(4, 1), (8, 1), (10, 1), (15, 2)],
  term ((-1248808296 : Rat) / 8578069) [(4, 1), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0220_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0220
        rs_R013_ueqv_R013YNNN_generator_19_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_19_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0221 : Poly :=
[
  term ((3818314800 : Rat) / 8833633) [(5, 1), (6, 1), (11, 1)]
]

/-- Partial product 221 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0221 : Poly :=
[
  term ((7636629600 : Rat) / 8833633) [(5, 1), (6, 1), (8, 1), (11, 1)],
  term ((-3818314800 : Rat) / 8833633) [(5, 1), (6, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0221_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0221
        rs_R013_ueqv_R013YNNN_generator_19_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_19_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0222 : Poly :=
[
  term ((3117438785601765 : Rat) / 1284330735503) [(5, 1), (6, 1), (11, 2), (15, 1)]
]

/-- Partial product 222 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0222 : Poly :=
[
  term ((6234877571203530 : Rat) / 1284330735503) [(5, 1), (6, 1), (8, 1), (11, 2), (15, 1)],
  term ((-3117438785601765 : Rat) / 1284330735503) [(5, 1), (6, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0222_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0222
        rs_R013_ueqv_R013YNNN_generator_19_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_19_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0223 : Poly :=
[
  term ((-9108844 : Rat) / 145391) [(5, 1), (6, 1), (15, 1)]
]

/-- Partial product 223 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0223 : Poly :=
[
  term ((-18217688 : Rat) / 145391) [(5, 1), (6, 1), (8, 1), (15, 1)],
  term ((9108844 : Rat) / 145391) [(5, 1), (6, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0223_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0223
        rs_R013_ueqv_R013YNNN_generator_19_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_19_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0224 : Poly :=
[
  term ((-24046165200 : Rat) / 150171761) [(5, 1), (10, 1), (11, 1)]
]

/-- Partial product 224 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0224 : Poly :=
[
  term ((-48092330400 : Rat) / 150171761) [(5, 1), (8, 1), (10, 1), (11, 1)],
  term ((24046165200 : Rat) / 150171761) [(5, 1), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0224_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0224
        rs_R013_ueqv_R013YNNN_generator_19_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_19_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0225 : Poly :=
[
  term ((-1158307962017321865 : Rat) / 1288183727709509) [(5, 1), (10, 1), (11, 2), (15, 1)]
]

/-- Partial product 225 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0225 : Poly :=
[
  term ((-2316615924034643730 : Rat) / 1288183727709509) [(5, 1), (8, 1), (10, 1), (11, 2), (15, 1)],
  term ((1158307962017321865 : Rat) / 1288183727709509) [(5, 1), (10, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0225_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0225
        rs_R013_ueqv_R013YNNN_generator_19_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_19_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0226 : Poly :=
[
  term ((-624404148 : Rat) / 8578069) [(5, 1), (10, 1), (15, 1)]
]

/-- Partial product 226 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0226 : Poly :=
[
  term ((-1248808296 : Rat) / 8578069) [(5, 1), (8, 1), (10, 1), (15, 1)],
  term ((624404148 : Rat) / 8578069) [(5, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0226_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0226
        rs_R013_ueqv_R013YNNN_generator_19_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_19_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0227 : Poly :=
[
  term (-4 : Rat) [(6, 1)]
]

/-- Partial product 227 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0227 : Poly :=
[
  term (4 : Rat) [(6, 1)],
  term (-8 : Rat) [(6, 1), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0227_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0227
        rs_R013_ueqv_R013YNNN_generator_19_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_19_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0228 : Poly :=
[
  term (-128 : Rat) [(6, 1), (7, 1), (9, 1)]
]

/-- Partial product 228 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0228 : Poly :=
[
  term (-256 : Rat) [(6, 1), (7, 1), (8, 1), (9, 1)],
  term (128 : Rat) [(6, 1), (7, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0228_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0228
        rs_R013_ueqv_R013YNNN_generator_19_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_19_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0229 : Poly :=
[
  term (64 : Rat) [(6, 1), (7, 1), (9, 1), (10, 1)]
]

/-- Partial product 229 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0229 : Poly :=
[
  term (128 : Rat) [(6, 1), (7, 1), (8, 1), (9, 1), (10, 1)],
  term (-64 : Rat) [(6, 1), (7, 1), (9, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0229_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0229
        rs_R013_ueqv_R013YNNN_generator_19_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_19_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0230 : Poly :=
[
  term ((-72328328720 : Rat) / 150171761) [(6, 1), (7, 1), (10, 1), (11, 1)]
]

/-- Partial product 230 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0230 : Poly :=
[
  term ((-144656657440 : Rat) / 150171761) [(6, 1), (7, 1), (8, 1), (10, 1), (11, 1)],
  term ((72328328720 : Rat) / 150171761) [(6, 1), (7, 1), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0230_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0230
        rs_R013_ueqv_R013YNNN_generator_19_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_19_0230 := by
  native_decide

/-- Coefficient term 231 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0231 : Poly :=
[
  term ((1315686400 : Rat) / 150171761) [(6, 1), (7, 1), (10, 1), (11, 1), (12, 1)]
]

/-- Partial product 231 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0231 : Poly :=
[
  term ((2631372800 : Rat) / 150171761) [(6, 1), (7, 1), (8, 1), (10, 1), (11, 1), (12, 1)],
  term ((-1315686400 : Rat) / 150171761) [(6, 1), (7, 1), (10, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 231 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0231_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0231
        rs_R013_ueqv_R013YNNN_generator_19_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_19_0231 := by
  native_decide

/-- Coefficient term 232 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0232 : Poly :=
[
  term ((63376842833879680 : Rat) / 1288183727709509) [(6, 1), (7, 1), (10, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 232 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0232 : Poly :=
[
  term ((126753685667759360 : Rat) / 1288183727709509) [(6, 1), (7, 1), (8, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((-63376842833879680 : Rat) / 1288183727709509) [(6, 1), (7, 1), (10, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 232 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0232_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0232
        rs_R013_ueqv_R013YNNN_generator_19_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_19_0232 := by
  native_decide

/-- Coefficient term 233 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0233 : Poly :=
[
  term ((-3484068180475701389 : Rat) / 1288183727709509) [(6, 1), (7, 1), (10, 1), (11, 2), (15, 1)]
]

/-- Partial product 233 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0233 : Poly :=
[
  term ((-6968136360951402778 : Rat) / 1288183727709509) [(6, 1), (7, 1), (8, 1), (10, 1), (11, 2), (15, 1)],
  term ((3484068180475701389 : Rat) / 1288183727709509) [(6, 1), (7, 1), (10, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 233 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0233_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0233
        rs_R013_ueqv_R013YNNN_generator_19_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_19_0233 := by
  native_decide

/-- Coefficient term 234 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0234 : Poly :=
[
  term ((16256607488 : Rat) / 25734207) [(6, 1), (7, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 234 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0234 : Poly :=
[
  term ((32513214976 : Rat) / 25734207) [(6, 1), (7, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((-16256607488 : Rat) / 25734207) [(6, 1), (7, 1), (10, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 234 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0234_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0234
        rs_R013_ueqv_R013YNNN_generator_19_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_19_0234 := by
  native_decide

/-- Coefficient term 235 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0235 : Poly :=
[
  term ((-22652678179 : Rat) / 25734207) [(6, 1), (7, 1), (10, 1), (15, 1)]
]

/-- Partial product 235 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0235 : Poly :=
[
  term ((-45305356358 : Rat) / 25734207) [(6, 1), (7, 1), (8, 1), (10, 1), (15, 1)],
  term ((22652678179 : Rat) / 25734207) [(6, 1), (7, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 235 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0235_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0235
        rs_R013_ueqv_R013YNNN_generator_19_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_19_0235 := by
  native_decide

/-- Coefficient term 236 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0236 : Poly :=
[
  term ((-54221696088 : Rat) / 150171761) [(6, 1), (7, 1), (11, 1)]
]

/-- Partial product 236 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0236 : Poly :=
[
  term ((-108443392176 : Rat) / 150171761) [(6, 1), (7, 1), (8, 1), (11, 1)],
  term ((54221696088 : Rat) / 150171761) [(6, 1), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 236 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0236_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0236
        rs_R013_ueqv_R013YNNN_generator_19_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_19_0236 := by
  native_decide

/-- Coefficient term 237 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0237 : Poly :=
[
  term ((2127756400 : Rat) / 150171761) [(6, 1), (7, 1), (11, 1), (12, 1)]
]

/-- Partial product 237 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0237 : Poly :=
[
  term ((4255512800 : Rat) / 150171761) [(6, 1), (7, 1), (8, 1), (11, 1), (12, 1)],
  term ((-2127756400 : Rat) / 150171761) [(6, 1), (7, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 237 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0237_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0237
        rs_R013_ueqv_R013YNNN_generator_19_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_19_0237 := by
  native_decide

/-- Coefficient term 238 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0238 : Poly :=
[
  term ((102494396044210555 : Rat) / 1288183727709509) [(6, 1), (7, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 238 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0238 : Poly :=
[
  term ((204988792088421110 : Rat) / 1288183727709509) [(6, 1), (7, 1), (8, 1), (11, 2), (12, 1), (15, 1)],
  term ((-102494396044210555 : Rat) / 1288183727709509) [(6, 1), (7, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 238 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0238_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0238
        rs_R013_ueqv_R013YNNN_generator_19_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_19_0238 := by
  native_decide

/-- Coefficient term 239 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0239 : Poly :=
[
  term ((-5686700262608248931 : Rat) / 2576367455419018) [(6, 1), (7, 1), (11, 2), (15, 1)]
]

/-- Partial product 239 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0239 : Poly :=
[
  term ((-5686700262608248931 : Rat) / 1288183727709509) [(6, 1), (7, 1), (8, 1), (11, 2), (15, 1)],
  term ((5686700262608248931 : Rat) / 2576367455419018) [(6, 1), (7, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 239 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0239_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0239
        rs_R013_ueqv_R013YNNN_generator_19_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_19_0239 := by
  native_decide

/-- Coefficient term 240 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0240 : Poly :=
[
  term ((-22056755452 : Rat) / 25734207) [(6, 1), (7, 1), (12, 1), (15, 1)]
]

/-- Partial product 240 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0240 : Poly :=
[
  term ((-44113510904 : Rat) / 25734207) [(6, 1), (7, 1), (8, 1), (12, 1), (15, 1)],
  term ((22056755452 : Rat) / 25734207) [(6, 1), (7, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 240 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0240_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0240
        rs_R013_ueqv_R013YNNN_generator_19_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_19_0240 := by
  native_decide

/-- Coefficient term 241 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0241 : Poly :=
[
  term ((10798687478 : Rat) / 8578069) [(6, 1), (7, 1), (15, 1)]
]

/-- Partial product 241 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0241 : Poly :=
[
  term ((21597374956 : Rat) / 8578069) [(6, 1), (7, 1), (8, 1), (15, 1)],
  term ((-10798687478 : Rat) / 8578069) [(6, 1), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 241 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0241_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0241
        rs_R013_ueqv_R013YNNN_generator_19_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_19_0241 := by
  native_decide

/-- Coefficient term 242 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0242 : Poly :=
[
  term (2 : Rat) [(6, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 242 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0242 : Poly :=
[
  term (4 : Rat) [(6, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(6, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 242 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0242_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0242
        rs_R013_ueqv_R013YNNN_generator_19_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_19_0242 := by
  native_decide

/-- Coefficient term 243 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0243 : Poly :=
[
  term (-224 : Rat) [(6, 1), (7, 2)]
]

/-- Partial product 243 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0243 : Poly :=
[
  term (224 : Rat) [(6, 1), (7, 2)],
  term (-448 : Rat) [(6, 1), (7, 2), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 243 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0243_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0243
        rs_R013_ueqv_R013YNNN_generator_19_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_19_0243 := by
  native_decide

/-- Coefficient term 244 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0244 : Poly :=
[
  term (128 : Rat) [(6, 1), (7, 2), (10, 1)]
]

/-- Partial product 244 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0244 : Poly :=
[
  term (256 : Rat) [(6, 1), (7, 2), (8, 1), (10, 1)],
  term (-128 : Rat) [(6, 1), (7, 2), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 244 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0244_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0244
        rs_R013_ueqv_R013YNNN_generator_19_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_19_0244 := by
  native_decide

/-- Coefficient term 245 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0245 : Poly :=
[
  term ((-36164164360 : Rat) / 150171761) [(6, 1), (9, 1), (10, 1), (11, 1)]
]

/-- Partial product 245 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0245 : Poly :=
[
  term ((-72328328720 : Rat) / 150171761) [(6, 1), (8, 1), (9, 1), (10, 1), (11, 1)],
  term ((36164164360 : Rat) / 150171761) [(6, 1), (9, 1), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 245 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0245_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0245
        rs_R013_ueqv_R013YNNN_generator_19_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_19_0245 := by
  native_decide

/-- Coefficient term 246 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0246 : Poly :=
[
  term ((657843200 : Rat) / 150171761) [(6, 1), (9, 1), (10, 1), (11, 1), (12, 1)]
]

/-- Partial product 246 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0246 : Poly :=
[
  term ((1315686400 : Rat) / 150171761) [(6, 1), (8, 1), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((-657843200 : Rat) / 150171761) [(6, 1), (9, 1), (10, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 246 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0246_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0246
        rs_R013_ueqv_R013YNNN_generator_19_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_19_0246 := by
  native_decide

/-- Coefficient term 247 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0247 : Poly :=
[
  term ((31688421416939840 : Rat) / 1288183727709509) [(6, 1), (9, 1), (10, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 247 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0247 : Poly :=
[
  term ((63376842833879680 : Rat) / 1288183727709509) [(6, 1), (8, 1), (9, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((-31688421416939840 : Rat) / 1288183727709509) [(6, 1), (9, 1), (10, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 247 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0247_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0247
        rs_R013_ueqv_R013YNNN_generator_19_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_19_0247 := by
  native_decide

/-- Coefficient term 248 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0248 : Poly :=
[
  term ((-3484068180475701389 : Rat) / 2576367455419018) [(6, 1), (9, 1), (10, 1), (11, 2), (15, 1)]
]

/-- Partial product 248 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0248 : Poly :=
[
  term ((-3484068180475701389 : Rat) / 1288183727709509) [(6, 1), (8, 1), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((3484068180475701389 : Rat) / 2576367455419018) [(6, 1), (9, 1), (10, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 248 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0248_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0248
        rs_R013_ueqv_R013YNNN_generator_19_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_19_0248 := by
  native_decide

/-- Coefficient term 249 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0249 : Poly :=
[
  term ((8128303744 : Rat) / 25734207) [(6, 1), (9, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 249 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0249 : Poly :=
[
  term ((16256607488 : Rat) / 25734207) [(6, 1), (8, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-8128303744 : Rat) / 25734207) [(6, 1), (9, 1), (10, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 249 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0249_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0249
        rs_R013_ueqv_R013YNNN_generator_19_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_19_0249 := by
  native_decide

/-- Coefficient term 250 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0250 : Poly :=
[
  term ((-17106759971 : Rat) / 25734207) [(6, 1), (9, 1), (10, 1), (15, 1)]
]

/-- Partial product 250 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0250 : Poly :=
[
  term ((-34213519942 : Rat) / 25734207) [(6, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((17106759971 : Rat) / 25734207) [(6, 1), (9, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 250 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0250_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0250
        rs_R013_ueqv_R013YNNN_generator_19_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_19_0250 := by
  native_decide

/-- Coefficient term 251 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0251 : Poly :=
[
  term ((-4151835720 : Rat) / 8833633) [(6, 1), (9, 1), (11, 1)]
]

/-- Partial product 251 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0251 : Poly :=
[
  term ((-8303671440 : Rat) / 8833633) [(6, 1), (8, 1), (9, 1), (11, 1)],
  term ((4151835720 : Rat) / 8833633) [(6, 1), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 251 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0251_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0251
        rs_R013_ueqv_R013YNNN_generator_19_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_19_0251 := by
  native_decide

/-- Coefficient term 252 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0252 : Poly :=
[
  term ((10988171600 : Rat) / 150171761) [(6, 1), (9, 1), (11, 1), (12, 1)]
]

/-- Partial product 252 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0252 : Poly :=
[
  term ((21976343200 : Rat) / 150171761) [(6, 1), (8, 1), (9, 1), (11, 1), (12, 1)],
  term ((-10988171600 : Rat) / 150171761) [(6, 1), (9, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 252 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0252_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0252
        rs_R013_ueqv_R013YNNN_generator_19_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_19_0252 := by
  native_decide

/-- Coefficient term 253 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0253 : Poly :=
[
  term ((529302138051210545 : Rat) / 1288183727709509) [(6, 1), (9, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 253 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0253 : Poly :=
[
  term ((1058604276102421090 : Rat) / 1288183727709509) [(6, 1), (8, 1), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((-529302138051210545 : Rat) / 1288183727709509) [(6, 1), (9, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 253 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0253_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0253
        rs_R013_ueqv_R013YNNN_generator_19_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_19_0253 := by
  native_decide

/-- Coefficient term 254 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0254 : Poly :=
[
  term ((-263823653800206481 : Rat) / 151551026789354) [(6, 1), (9, 1), (11, 2), (15, 1)]
]

/-- Partial product 254 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0254 : Poly :=
[
  term ((-263823653800206481 : Rat) / 75775513394677) [(6, 1), (8, 1), (9, 1), (11, 2), (15, 1)],
  term ((263823653800206481 : Rat) / 151551026789354) [(6, 1), (9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 254 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0254_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0254
        rs_R013_ueqv_R013YNNN_generator_19_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_19_0254 := by
  native_decide

/-- Coefficient term 255 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0255 : Poly :=
[
  term ((-9272140148 : Rat) / 25734207) [(6, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 255 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0255 : Poly :=
[
  term ((-18544280296 : Rat) / 25734207) [(6, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((9272140148 : Rat) / 25734207) [(6, 1), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 255 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0255_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0255
        rs_R013_ueqv_R013YNNN_generator_19_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_19_0255 := by
  native_decide

/-- Coefficient term 256 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0256 : Poly :=
[
  term ((24094538066 : Rat) / 25734207) [(6, 1), (9, 1), (15, 1)]
]

/-- Partial product 256 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0256 : Poly :=
[
  term ((48189076132 : Rat) / 25734207) [(6, 1), (8, 1), (9, 1), (15, 1)],
  term ((-24094538066 : Rat) / 25734207) [(6, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 256 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0256_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0256
        rs_R013_ueqv_R013YNNN_generator_19_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_19_0256 := by
  native_decide

/-- Coefficient term 257 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0257 : Poly :=
[
  term (2 : Rat) [(6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 257 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0257 : Poly :=
[
  term (4 : Rat) [(6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(6, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 257 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0257_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0257
        rs_R013_ueqv_R013YNNN_generator_19_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_19_0257 := by
  native_decide

/-- Coefficient term 258 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0258 : Poly :=
[
  term (80 : Rat) [(6, 1), (9, 2)]
]

/-- Partial product 258 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0258 : Poly :=
[
  term (160 : Rat) [(6, 1), (8, 1), (9, 2)],
  term (-80 : Rat) [(6, 1), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 258 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0258_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0258
        rs_R013_ueqv_R013YNNN_generator_19_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_19_0258 := by
  native_decide

/-- Coefficient term 259 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0259 : Poly :=
[
  term ((3853613921 : Rat) / 8578069) [(6, 1), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 259 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0259 : Poly :=
[
  term ((7707227842 : Rat) / 8578069) [(6, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-3853613921 : Rat) / 8578069) [(6, 1), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 259 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0259_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0259
        rs_R013_ueqv_R013YNNN_generator_19_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_19_0259 := by
  native_decide

/-- Coefficient term 260 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0260 : Poly :=
[
  term ((4064151872 : Rat) / 25734207) [(6, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 260 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0260 : Poly :=
[
  term ((8128303744 : Rat) / 25734207) [(6, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-4064151872 : Rat) / 25734207) [(6, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 260 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0260_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0260
        rs_R013_ueqv_R013YNNN_generator_19_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_19_0260 := by
  native_decide

/-- Coefficient term 261 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0261 : Poly :=
[
  term ((-2772959104 : Rat) / 25734207) [(6, 1), (11, 1), (15, 1)]
]

/-- Partial product 261 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0261 : Poly :=
[
  term ((-5545918208 : Rat) / 25734207) [(6, 1), (8, 1), (11, 1), (15, 1)],
  term ((2772959104 : Rat) / 25734207) [(6, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 261 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0261_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0261
        rs_R013_ueqv_R013YNNN_generator_19_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_19_0261 := by
  native_decide

/-- Coefficient term 262 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0262 : Poly :=
[
  term ((-18082082180 : Rat) / 150171761) [(6, 1), (11, 2)]
]

/-- Partial product 262 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0262 : Poly :=
[
  term ((-36164164360 : Rat) / 150171761) [(6, 1), (8, 1), (11, 2)],
  term ((18082082180 : Rat) / 150171761) [(6, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 262 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0262_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0262
        rs_R013_ueqv_R013YNNN_generator_19_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_19_0262 := by
  native_decide

/-- Coefficient term 263 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0263 : Poly :=
[
  term ((328921600 : Rat) / 150171761) [(6, 1), (11, 2), (12, 1)]
]

/-- Partial product 263 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0263 : Poly :=
[
  term ((657843200 : Rat) / 150171761) [(6, 1), (8, 1), (11, 2), (12, 1)],
  term ((-328921600 : Rat) / 150171761) [(6, 1), (11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 263 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0263_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0263
        rs_R013_ueqv_R013YNNN_generator_19_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_19_0263 := by
  native_decide

/-- Coefficient term 264 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0264 : Poly :=
[
  term ((15844210708469920 : Rat) / 1288183727709509) [(6, 1), (11, 3), (12, 1), (15, 1)]
]

/-- Partial product 264 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0264 : Poly :=
[
  term ((31688421416939840 : Rat) / 1288183727709509) [(6, 1), (8, 1), (11, 3), (12, 1), (15, 1)],
  term ((-15844210708469920 : Rat) / 1288183727709509) [(6, 1), (11, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 264 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0264_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0264
        rs_R013_ueqv_R013YNNN_generator_19_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_19_0264 := by
  native_decide

/-- Coefficient term 265 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0265 : Poly :=
[
  term ((-3484068180475701389 : Rat) / 5152734910838036) [(6, 1), (11, 3), (15, 1)]
]

/-- Partial product 265 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0265 : Poly :=
[
  term ((-3484068180475701389 : Rat) / 2576367455419018) [(6, 1), (8, 1), (11, 3), (15, 1)],
  term ((3484068180475701389 : Rat) / 5152734910838036) [(6, 1), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 265 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0265_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0265
        rs_R013_ueqv_R013YNNN_generator_19_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_19_0265 := by
  native_decide

/-- Coefficient term 266 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0266 : Poly :=
[
  term (-80 : Rat) [(7, 1), (8, 1), (9, 1)]
]

/-- Partial product 266 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0266 : Poly :=
[
  term (80 : Rat) [(7, 1), (8, 1), (9, 1)],
  term (-160 : Rat) [(7, 1), (8, 2), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 266 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0266_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0266
        rs_R013_ueqv_R013YNNN_generator_19_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_19_0266 := by
  native_decide

/-- Coefficient term 267 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0267 : Poly :=
[
  term ((36164164360 : Rat) / 150171761) [(7, 1), (8, 1), (10, 1), (11, 1)]
]

/-- Partial product 267 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0267 : Poly :=
[
  term ((-36164164360 : Rat) / 150171761) [(7, 1), (8, 1), (10, 1), (11, 1)],
  term ((72328328720 : Rat) / 150171761) [(7, 1), (8, 2), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 267 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0267_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0267
        rs_R013_ueqv_R013YNNN_generator_19_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_19_0267 := by
  native_decide

/-- Coefficient term 268 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0268 : Poly :=
[
  term ((-657843200 : Rat) / 150171761) [(7, 1), (8, 1), (10, 1), (11, 1), (12, 1)]
]

/-- Partial product 268 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0268 : Poly :=
[
  term ((657843200 : Rat) / 150171761) [(7, 1), (8, 1), (10, 1), (11, 1), (12, 1)],
  term ((-1315686400 : Rat) / 150171761) [(7, 1), (8, 2), (10, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 268 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0268_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0268
        rs_R013_ueqv_R013YNNN_generator_19_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_19_0268 := by
  native_decide

/-- Coefficient term 269 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0269 : Poly :=
[
  term ((-31688421416939840 : Rat) / 1288183727709509) [(7, 1), (8, 1), (10, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 269 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0269 : Poly :=
[
  term ((31688421416939840 : Rat) / 1288183727709509) [(7, 1), (8, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((-63376842833879680 : Rat) / 1288183727709509) [(7, 1), (8, 2), (10, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 269 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0269_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0269
        rs_R013_ueqv_R013YNNN_generator_19_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_19_0269 := by
  native_decide

/-- Coefficient term 270 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0270 : Poly :=
[
  term ((3484068180475701389 : Rat) / 2576367455419018) [(7, 1), (8, 1), (10, 1), (11, 2), (15, 1)]
]

/-- Partial product 270 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0270 : Poly :=
[
  term ((-3484068180475701389 : Rat) / 2576367455419018) [(7, 1), (8, 1), (10, 1), (11, 2), (15, 1)],
  term ((3484068180475701389 : Rat) / 1288183727709509) [(7, 1), (8, 2), (10, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 270 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0270_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0270
        rs_R013_ueqv_R013YNNN_generator_19_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_19_0270 := by
  native_decide

/-- Coefficient term 271 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0271 : Poly :=
[
  term ((-8128303744 : Rat) / 25734207) [(7, 1), (8, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 271 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0271 : Poly :=
[
  term ((8128303744 : Rat) / 25734207) [(7, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((-16256607488 : Rat) / 25734207) [(7, 1), (8, 2), (10, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 271 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0271_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0271
        rs_R013_ueqv_R013YNNN_generator_19_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_19_0271 := by
  native_decide

/-- Coefficient term 272 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0272 : Poly :=
[
  term ((17106759971 : Rat) / 25734207) [(7, 1), (8, 1), (10, 1), (15, 1)]
]

/-- Partial product 272 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0272 : Poly :=
[
  term ((-17106759971 : Rat) / 25734207) [(7, 1), (8, 1), (10, 1), (15, 1)],
  term ((34213519942 : Rat) / 25734207) [(7, 1), (8, 2), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 272 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0272_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0272
        rs_R013_ueqv_R013YNNN_generator_19_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_19_0272 := by
  native_decide

/-- Coefficient term 273 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0273 : Poly :=
[
  term ((2597116312 : Rat) / 8833633) [(7, 1), (8, 1), (11, 1)]
]

/-- Partial product 273 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0273 : Poly :=
[
  term ((-2597116312 : Rat) / 8833633) [(7, 1), (8, 1), (11, 1)],
  term ((5194232624 : Rat) / 8833633) [(7, 1), (8, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 273 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0273_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0273
        rs_R013_ueqv_R013YNNN_generator_19_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_19_0273 := by
  native_decide

/-- Coefficient term 274 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0274 : Poly :=
[
  term ((-10988171600 : Rat) / 150171761) [(7, 1), (8, 1), (11, 1), (12, 1)]
]

/-- Partial product 274 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0274 : Poly :=
[
  term ((10988171600 : Rat) / 150171761) [(7, 1), (8, 1), (11, 1), (12, 1)],
  term ((-21976343200 : Rat) / 150171761) [(7, 1), (8, 2), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 274 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0274_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0274
        rs_R013_ueqv_R013YNNN_generator_19_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_19_0274 := by
  native_decide

/-- Coefficient term 275 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0275 : Poly :=
[
  term ((-529302138051210545 : Rat) / 1288183727709509) [(7, 1), (8, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 275 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0275 : Poly :=
[
  term ((529302138051210545 : Rat) / 1288183727709509) [(7, 1), (8, 1), (11, 2), (12, 1), (15, 1)],
  term ((-1058604276102421090 : Rat) / 1288183727709509) [(7, 1), (8, 2), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 275 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0275_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0275
        rs_R013_ueqv_R013YNNN_generator_19_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_19_0275 := by
  native_decide

/-- Coefficient term 276 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0276 : Poly :=
[
  term ((263823653800206481 : Rat) / 151551026789354) [(7, 1), (8, 1), (11, 2), (15, 1)]
]

/-- Partial product 276 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0276 : Poly :=
[
  term ((-263823653800206481 : Rat) / 151551026789354) [(7, 1), (8, 1), (11, 2), (15, 1)],
  term ((263823653800206481 : Rat) / 75775513394677) [(7, 1), (8, 2), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 276 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0276_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0276
        rs_R013_ueqv_R013YNNN_generator_19_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_19_0276 := by
  native_decide

/-- Coefficient term 277 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0277 : Poly :=
[
  term ((9272140148 : Rat) / 25734207) [(7, 1), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 277 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0277 : Poly :=
[
  term ((-9272140148 : Rat) / 25734207) [(7, 1), (8, 1), (12, 1), (15, 1)],
  term ((18544280296 : Rat) / 25734207) [(7, 1), (8, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 277 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0277_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0277
        rs_R013_ueqv_R013YNNN_generator_19_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_19_0277 := by
  native_decide

/-- Coefficient term 278 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0278 : Poly :=
[
  term ((-24094538066 : Rat) / 25734207) [(7, 1), (8, 1), (15, 1)]
]

/-- Partial product 278 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0278 : Poly :=
[
  term ((24094538066 : Rat) / 25734207) [(7, 1), (8, 1), (15, 1)],
  term ((-48189076132 : Rat) / 25734207) [(7, 1), (8, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 278 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0278_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0278
        rs_R013_ueqv_R013YNNN_generator_19_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_19_0278 := by
  native_decide

/-- Coefficient term 279 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0279 : Poly :=
[
  term (-2 : Rat) [(7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 279 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0279 : Poly :=
[
  term (2 : Rat) [(7, 1), (8, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(7, 1), (8, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 279 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0279_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0279
        rs_R013_ueqv_R013YNNN_generator_19_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_19_0279 := by
  native_decide

/-- Coefficient term 280 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0280 : Poly :=
[
  term (-40 : Rat) [(7, 1), (9, 1)]
]

/-- Partial product 280 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0280 : Poly :=
[
  term (-80 : Rat) [(7, 1), (8, 1), (9, 1)],
  term (40 : Rat) [(7, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 280 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0280_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0280
        rs_R013_ueqv_R013YNNN_generator_19_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_19_0280 := by
  native_decide

/-- Coefficient term 281 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0281 : Poly :=
[
  term (176 : Rat) [(7, 1), (9, 1), (10, 1)]
]

/-- Partial product 281 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0281 : Poly :=
[
  term (352 : Rat) [(7, 1), (8, 1), (9, 1), (10, 1)],
  term (-176 : Rat) [(7, 1), (9, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 281 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0281_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0281
        rs_R013_ueqv_R013YNNN_generator_19_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_19_0281 := by
  native_decide

/-- Coefficient term 282 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0282 : Poly :=
[
  term ((50580653416 : Rat) / 150171761) [(7, 1), (10, 1), (11, 1)]
]

/-- Partial product 282 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0282 : Poly :=
[
  term ((101161306832 : Rat) / 150171761) [(7, 1), (8, 1), (10, 1), (11, 1)],
  term ((-50580653416 : Rat) / 150171761) [(7, 1), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 282 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0282_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0282
        rs_R013_ueqv_R013YNNN_generator_19_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_19_0282 := by
  native_decide

/-- Coefficient term 283 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0283 : Poly :=
[
  term ((-657843200 : Rat) / 150171761) [(7, 1), (10, 1), (11, 1), (12, 1)]
]

/-- Partial product 283 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0283 : Poly :=
[
  term ((-1315686400 : Rat) / 150171761) [(7, 1), (8, 1), (10, 1), (11, 1), (12, 1)],
  term ((657843200 : Rat) / 150171761) [(7, 1), (10, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 283 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0283_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0283
        rs_R013_ueqv_R013YNNN_generator_19_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_19_0283 := by
  native_decide

/-- Coefficient term 284 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0284 : Poly :=
[
  term ((-31688421416939840 : Rat) / 1288183727709509) [(7, 1), (10, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 284 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0284 : Poly :=
[
  term ((-63376842833879680 : Rat) / 1288183727709509) [(7, 1), (8, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((31688421416939840 : Rat) / 1288183727709509) [(7, 1), (10, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 284 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0284_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0284
        rs_R013_ueqv_R013YNNN_generator_19_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_19_0284 := by
  native_decide

/-- Coefficient term 285 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0285 : Poly :=
[
  term ((3484068180475701389 : Rat) / 2576367455419018) [(7, 1), (10, 1), (11, 2), (15, 1)]
]

/-- Partial product 285 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0285 : Poly :=
[
  term ((3484068180475701389 : Rat) / 1288183727709509) [(7, 1), (8, 1), (10, 1), (11, 2), (15, 1)],
  term ((-3484068180475701389 : Rat) / 2576367455419018) [(7, 1), (10, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 285 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0285_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0285
        rs_R013_ueqv_R013YNNN_generator_19_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_19_0285 := by
  native_decide

/-- Coefficient term 286 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0286 : Poly :=
[
  term ((-8128303744 : Rat) / 25734207) [(7, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 286 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0286 : Poly :=
[
  term ((-16256607488 : Rat) / 25734207) [(7, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((8128303744 : Rat) / 25734207) [(7, 1), (10, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 286 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0286_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0286
        rs_R013_ueqv_R013YNNN_generator_19_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_19_0286 := by
  native_decide

/-- Coefficient term 287 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0287 : Poly :=
[
  term ((30064129795 : Rat) / 51468414) [(7, 1), (10, 1), (15, 1)]
]

/-- Partial product 287 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0287 : Poly :=
[
  term ((30064129795 : Rat) / 25734207) [(7, 1), (8, 1), (10, 1), (15, 1)],
  term ((-30064129795 : Rat) / 51468414) [(7, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 287 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0287_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0287
        rs_R013_ueqv_R013YNNN_generator_19_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_19_0287 := by
  native_decide

/-- Coefficient term 288 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0288 : Poly :=
[
  term ((-5500603169 : Rat) / 8578069) [(7, 1), (10, 2), (15, 1)]
]

/-- Partial product 288 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0288 : Poly :=
[
  term ((-11001206338 : Rat) / 8578069) [(7, 1), (8, 1), (10, 2), (15, 1)],
  term ((5500603169 : Rat) / 8578069) [(7, 1), (10, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 288 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0288_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0288
        rs_R013_ueqv_R013YNNN_generator_19_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_19_0288 := by
  native_decide

/-- Coefficient term 289 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0289 : Poly :=
[
  term ((1298558156 : Rat) / 8833633) [(7, 1), (11, 1)]
]

/-- Partial product 289 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0289 : Poly :=
[
  term ((2597116312 : Rat) / 8833633) [(7, 1), (8, 1), (11, 1)],
  term ((-1298558156 : Rat) / 8833633) [(7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 289 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0289_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0289
        rs_R013_ueqv_R013YNNN_generator_19_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_19_0289 := by
  native_decide

/-- Coefficient term 290 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0290 : Poly :=
[
  term ((-5494085800 : Rat) / 150171761) [(7, 1), (11, 1), (12, 1)]
]

/-- Partial product 290 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0290 : Poly :=
[
  term ((-10988171600 : Rat) / 150171761) [(7, 1), (8, 1), (11, 1), (12, 1)],
  term ((5494085800 : Rat) / 150171761) [(7, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 290 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0290_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0290
        rs_R013_ueqv_R013YNNN_generator_19_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_19_0290 := by
  native_decide

/-- Coefficient term 291 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0291 : Poly :=
[
  term ((-529302138051210545 : Rat) / 2576367455419018) [(7, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 291 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0291 : Poly :=
[
  term ((-529302138051210545 : Rat) / 1288183727709509) [(7, 1), (8, 1), (11, 2), (12, 1), (15, 1)],
  term ((529302138051210545 : Rat) / 2576367455419018) [(7, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 291 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0291_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0291
        rs_R013_ueqv_R013YNNN_generator_19_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_19_0291 := by
  native_decide

/-- Coefficient term 292 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0292 : Poly :=
[
  term ((263823653800206481 : Rat) / 303102053578708) [(7, 1), (11, 2), (15, 1)]
]

/-- Partial product 292 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0292 : Poly :=
[
  term ((263823653800206481 : Rat) / 151551026789354) [(7, 1), (8, 1), (11, 2), (15, 1)],
  term ((-263823653800206481 : Rat) / 303102053578708) [(7, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 292 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0292_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0292
        rs_R013_ueqv_R013YNNN_generator_19_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_19_0292 := by
  native_decide

/-- Coefficient term 293 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0293 : Poly :=
[
  term ((4636070074 : Rat) / 25734207) [(7, 1), (12, 1), (15, 1)]
]

/-- Partial product 293 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0293 : Poly :=
[
  term ((9272140148 : Rat) / 25734207) [(7, 1), (8, 1), (12, 1), (15, 1)],
  term ((-4636070074 : Rat) / 25734207) [(7, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 293 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0293_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0293
        rs_R013_ueqv_R013YNNN_generator_19_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_19_0293 := by
  native_decide

/-- Coefficient term 294 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0294 : Poly :=
[
  term ((-12047269033 : Rat) / 25734207) [(7, 1), (15, 1)]
]

/-- Partial product 294 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0294 : Poly :=
[
  term ((-24094538066 : Rat) / 25734207) [(7, 1), (8, 1), (15, 1)],
  term ((12047269033 : Rat) / 25734207) [(7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 294 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0294_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0294
        rs_R013_ueqv_R013YNNN_generator_19_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_19_0294 := by
  native_decide

/-- Coefficient term 295 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0295 : Poly :=
[
  term (-1 : Rat) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 295 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0295 : Poly :=
[
  term (-2 : Rat) [(7, 1), (8, 1), (15, 1), (16, 1)],
  term (1 : Rat) [(7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 295 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0295_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0295
        rs_R013_ueqv_R013YNNN_generator_19_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_19_0295 := by
  native_decide

/-- Coefficient term 296 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0296 : Poly :=
[
  term (64 : Rat) [(7, 2)]
]

/-- Partial product 296 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0296 : Poly :=
[
  term (-64 : Rat) [(7, 2)],
  term (128 : Rat) [(7, 2), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 296 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0296_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0296
        rs_R013_ueqv_R013YNNN_generator_19_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_19_0296 := by
  native_decide

/-- Coefficient term 297 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0297 : Poly :=
[
  term (128 : Rat) [(7, 2), (8, 1)]
]

/-- Partial product 297 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0297 : Poly :=
[
  term (-128 : Rat) [(7, 2), (8, 1)],
  term (256 : Rat) [(7, 2), (8, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 297 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0297_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0297
        rs_R013_ueqv_R013YNNN_generator_19_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_19_0297 := by
  native_decide

/-- Coefficient term 298 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0298 : Poly :=
[
  term (-64 : Rat) [(7, 2), (8, 1), (10, 1)]
]

/-- Partial product 298 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0298 : Poly :=
[
  term (64 : Rat) [(7, 2), (8, 1), (10, 1)],
  term (-128 : Rat) [(7, 2), (8, 2), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 298 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0298_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0298
        rs_R013_ueqv_R013YNNN_generator_19_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_19_0298 := by
  native_decide

/-- Coefficient term 299 from coefficient polynomial 19. -/
def rs_R013_ueqv_R013YNNN_coefficient_19_0299 : Poly :=
[
  term (-64 : Rat) [(7, 2), (10, 1)]
]

/-- Partial product 299 for generator 19. -/
def rs_R013_ueqv_R013YNNN_partial_19_0299 : Poly :=
[
  term (-128 : Rat) [(7, 2), (8, 1), (10, 1)],
  term (64 : Rat) [(7, 2), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 299 for generator 19. -/
theorem rs_R013_ueqv_R013YNNN_partial_19_0299_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_19_0299
        rs_R013_ueqv_R013YNNN_generator_19_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_19_0299 := by
  native_decide

/-- Partial products in this block. -/
def rs_R013_ueqv_R013YNNN_partials_19_0200_0299 : List Poly :=
[
  rs_R013_ueqv_R013YNNN_partial_19_0200,
  rs_R013_ueqv_R013YNNN_partial_19_0201,
  rs_R013_ueqv_R013YNNN_partial_19_0202,
  rs_R013_ueqv_R013YNNN_partial_19_0203,
  rs_R013_ueqv_R013YNNN_partial_19_0204,
  rs_R013_ueqv_R013YNNN_partial_19_0205,
  rs_R013_ueqv_R013YNNN_partial_19_0206,
  rs_R013_ueqv_R013YNNN_partial_19_0207,
  rs_R013_ueqv_R013YNNN_partial_19_0208,
  rs_R013_ueqv_R013YNNN_partial_19_0209,
  rs_R013_ueqv_R013YNNN_partial_19_0210,
  rs_R013_ueqv_R013YNNN_partial_19_0211,
  rs_R013_ueqv_R013YNNN_partial_19_0212,
  rs_R013_ueqv_R013YNNN_partial_19_0213,
  rs_R013_ueqv_R013YNNN_partial_19_0214,
  rs_R013_ueqv_R013YNNN_partial_19_0215,
  rs_R013_ueqv_R013YNNN_partial_19_0216,
  rs_R013_ueqv_R013YNNN_partial_19_0217,
  rs_R013_ueqv_R013YNNN_partial_19_0218,
  rs_R013_ueqv_R013YNNN_partial_19_0219,
  rs_R013_ueqv_R013YNNN_partial_19_0220,
  rs_R013_ueqv_R013YNNN_partial_19_0221,
  rs_R013_ueqv_R013YNNN_partial_19_0222,
  rs_R013_ueqv_R013YNNN_partial_19_0223,
  rs_R013_ueqv_R013YNNN_partial_19_0224,
  rs_R013_ueqv_R013YNNN_partial_19_0225,
  rs_R013_ueqv_R013YNNN_partial_19_0226,
  rs_R013_ueqv_R013YNNN_partial_19_0227,
  rs_R013_ueqv_R013YNNN_partial_19_0228,
  rs_R013_ueqv_R013YNNN_partial_19_0229,
  rs_R013_ueqv_R013YNNN_partial_19_0230,
  rs_R013_ueqv_R013YNNN_partial_19_0231,
  rs_R013_ueqv_R013YNNN_partial_19_0232,
  rs_R013_ueqv_R013YNNN_partial_19_0233,
  rs_R013_ueqv_R013YNNN_partial_19_0234,
  rs_R013_ueqv_R013YNNN_partial_19_0235,
  rs_R013_ueqv_R013YNNN_partial_19_0236,
  rs_R013_ueqv_R013YNNN_partial_19_0237,
  rs_R013_ueqv_R013YNNN_partial_19_0238,
  rs_R013_ueqv_R013YNNN_partial_19_0239,
  rs_R013_ueqv_R013YNNN_partial_19_0240,
  rs_R013_ueqv_R013YNNN_partial_19_0241,
  rs_R013_ueqv_R013YNNN_partial_19_0242,
  rs_R013_ueqv_R013YNNN_partial_19_0243,
  rs_R013_ueqv_R013YNNN_partial_19_0244,
  rs_R013_ueqv_R013YNNN_partial_19_0245,
  rs_R013_ueqv_R013YNNN_partial_19_0246,
  rs_R013_ueqv_R013YNNN_partial_19_0247,
  rs_R013_ueqv_R013YNNN_partial_19_0248,
  rs_R013_ueqv_R013YNNN_partial_19_0249,
  rs_R013_ueqv_R013YNNN_partial_19_0250,
  rs_R013_ueqv_R013YNNN_partial_19_0251,
  rs_R013_ueqv_R013YNNN_partial_19_0252,
  rs_R013_ueqv_R013YNNN_partial_19_0253,
  rs_R013_ueqv_R013YNNN_partial_19_0254,
  rs_R013_ueqv_R013YNNN_partial_19_0255,
  rs_R013_ueqv_R013YNNN_partial_19_0256,
  rs_R013_ueqv_R013YNNN_partial_19_0257,
  rs_R013_ueqv_R013YNNN_partial_19_0258,
  rs_R013_ueqv_R013YNNN_partial_19_0259,
  rs_R013_ueqv_R013YNNN_partial_19_0260,
  rs_R013_ueqv_R013YNNN_partial_19_0261,
  rs_R013_ueqv_R013YNNN_partial_19_0262,
  rs_R013_ueqv_R013YNNN_partial_19_0263,
  rs_R013_ueqv_R013YNNN_partial_19_0264,
  rs_R013_ueqv_R013YNNN_partial_19_0265,
  rs_R013_ueqv_R013YNNN_partial_19_0266,
  rs_R013_ueqv_R013YNNN_partial_19_0267,
  rs_R013_ueqv_R013YNNN_partial_19_0268,
  rs_R013_ueqv_R013YNNN_partial_19_0269,
  rs_R013_ueqv_R013YNNN_partial_19_0270,
  rs_R013_ueqv_R013YNNN_partial_19_0271,
  rs_R013_ueqv_R013YNNN_partial_19_0272,
  rs_R013_ueqv_R013YNNN_partial_19_0273,
  rs_R013_ueqv_R013YNNN_partial_19_0274,
  rs_R013_ueqv_R013YNNN_partial_19_0275,
  rs_R013_ueqv_R013YNNN_partial_19_0276,
  rs_R013_ueqv_R013YNNN_partial_19_0277,
  rs_R013_ueqv_R013YNNN_partial_19_0278,
  rs_R013_ueqv_R013YNNN_partial_19_0279,
  rs_R013_ueqv_R013YNNN_partial_19_0280,
  rs_R013_ueqv_R013YNNN_partial_19_0281,
  rs_R013_ueqv_R013YNNN_partial_19_0282,
  rs_R013_ueqv_R013YNNN_partial_19_0283,
  rs_R013_ueqv_R013YNNN_partial_19_0284,
  rs_R013_ueqv_R013YNNN_partial_19_0285,
  rs_R013_ueqv_R013YNNN_partial_19_0286,
  rs_R013_ueqv_R013YNNN_partial_19_0287,
  rs_R013_ueqv_R013YNNN_partial_19_0288,
  rs_R013_ueqv_R013YNNN_partial_19_0289,
  rs_R013_ueqv_R013YNNN_partial_19_0290,
  rs_R013_ueqv_R013YNNN_partial_19_0291,
  rs_R013_ueqv_R013YNNN_partial_19_0292,
  rs_R013_ueqv_R013YNNN_partial_19_0293,
  rs_R013_ueqv_R013YNNN_partial_19_0294,
  rs_R013_ueqv_R013YNNN_partial_19_0295,
  rs_R013_ueqv_R013YNNN_partial_19_0296,
  rs_R013_ueqv_R013YNNN_partial_19_0297,
  rs_R013_ueqv_R013YNNN_partial_19_0298,
  rs_R013_ueqv_R013YNNN_partial_19_0299
]

/-- Sum of partial products in this block. -/
def rs_R013_ueqv_R013YNNN_block_19_0200_0299 : Poly :=
[
  term ((54184166400 : Rat) / 150171761) [(3, 1), (6, 1), (8, 1), (10, 1), (11, 1)],
  term ((2610060724210255680 : Rat) / 1288183727709509) [(3, 1), (6, 1), (8, 1), (10, 1), (11, 2), (15, 1)],
  term ((-3443117184 : Rat) / 8578069) [(3, 1), (6, 1), (8, 1), (10, 1), (15, 1)],
  term ((-14056058200 : Rat) / 150171761) [(3, 1), (6, 1), (8, 1), (11, 1)],
  term ((-1354165538847655055 : Rat) / 2576367455419018) [(3, 1), (6, 1), (8, 1), (11, 2), (15, 1)],
  term ((1946605126 : Rat) / 25734207) [(3, 1), (6, 1), (8, 1), (15, 1)],
  term ((-27092083200 : Rat) / 150171761) [(3, 1), (6, 1), (10, 1), (11, 1)],
  term ((-1305030362105127840 : Rat) / 1288183727709509) [(3, 1), (6, 1), (10, 1), (11, 2), (15, 1)],
  term ((1721558592 : Rat) / 8578069) [(3, 1), (6, 1), (10, 1), (15, 1)],
  term ((7028029100 : Rat) / 150171761) [(3, 1), (6, 1), (11, 1)],
  term ((1354165538847655055 : Rat) / 5152734910838036) [(3, 1), (6, 1), (11, 2), (15, 1)],
  term ((-973302563 : Rat) / 25734207) [(3, 1), (6, 1), (15, 1)],
  term ((-82184496000 : Rat) / 150171761) [(4, 1), (6, 1), (7, 1), (8, 1), (11, 1)],
  term ((-3958841473449610200 : Rat) / 1288183727709509) [(4, 1), (6, 1), (7, 1), (8, 1), (11, 2), (15, 1)],
  term ((-517372000 : Rat) / 8578069) [(4, 1), (6, 1), (7, 1), (8, 1), (15, 1)],
  term ((41092248000 : Rat) / 150171761) [(4, 1), (6, 1), (7, 1), (11, 1)],
  term ((1979420736724805100 : Rat) / 1288183727709509) [(4, 1), (6, 1), (7, 1), (11, 2), (15, 1)],
  term ((258686000 : Rat) / 8578069) [(4, 1), (6, 1), (7, 1), (15, 1)],
  term ((-41092248000 : Rat) / 150171761) [(4, 1), (6, 1), (8, 1), (9, 1), (11, 1)],
  term ((-1979420736724805100 : Rat) / 1288183727709509) [(4, 1), (6, 1), (8, 1), (9, 1), (11, 2), (15, 1)],
  term ((-258686000 : Rat) / 8578069) [(4, 1), (6, 1), (8, 1), (9, 1), (15, 1)],
  term ((20546124000 : Rat) / 150171761) [(4, 1), (6, 1), (9, 1), (11, 1)],
  term ((989710368362402550 : Rat) / 1288183727709509) [(4, 1), (6, 1), (9, 1), (11, 2), (15, 1)],
  term ((129343000 : Rat) / 8578069) [(4, 1), (6, 1), (9, 1), (15, 1)],
  term ((41092248000 : Rat) / 150171761) [(4, 1), (7, 1), (8, 2), (11, 1)],
  term ((1979420736724805100 : Rat) / 1288183727709509) [(4, 1), (7, 1), (8, 2), (11, 2), (15, 1)],
  term ((258686000 : Rat) / 8578069) [(4, 1), (7, 1), (8, 2), (15, 1)],
  term ((-10273062000 : Rat) / 150171761) [(4, 1), (7, 1), (11, 1)],
  term ((-494855184181201275 : Rat) / 1288183727709509) [(4, 1), (7, 1), (11, 2), (15, 1)],
  term ((-64671500 : Rat) / 8578069) [(4, 1), (7, 1), (15, 1)],
  term ((96184660800 : Rat) / 150171761) [(4, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((4633231848069287460 : Rat) / 1288183727709509) [(4, 1), (8, 1), (10, 1), (11, 2), (15, 2)],
  term ((2497616592 : Rat) / 8578069) [(4, 1), (8, 1), (10, 1), (15, 2)],
  term ((-48092330400 : Rat) / 150171761) [(4, 1), (10, 1), (11, 1), (15, 1)],
  term ((-2316615924034643730 : Rat) / 1288183727709509) [(4, 1), (10, 1), (11, 2), (15, 2)],
  term ((-1248808296 : Rat) / 8578069) [(4, 1), (10, 1), (15, 2)],
  term ((7636629600 : Rat) / 8833633) [(5, 1), (6, 1), (8, 1), (11, 1)],
  term ((6234877571203530 : Rat) / 1284330735503) [(5, 1), (6, 1), (8, 1), (11, 2), (15, 1)],
  term ((-18217688 : Rat) / 145391) [(5, 1), (6, 1), (8, 1), (15, 1)],
  term ((-3818314800 : Rat) / 8833633) [(5, 1), (6, 1), (11, 1)],
  term ((-3117438785601765 : Rat) / 1284330735503) [(5, 1), (6, 1), (11, 2), (15, 1)],
  term ((9108844 : Rat) / 145391) [(5, 1), (6, 1), (15, 1)],
  term ((-48092330400 : Rat) / 150171761) [(5, 1), (8, 1), (10, 1), (11, 1)],
  term ((-2316615924034643730 : Rat) / 1288183727709509) [(5, 1), (8, 1), (10, 1), (11, 2), (15, 1)],
  term ((-1248808296 : Rat) / 8578069) [(5, 1), (8, 1), (10, 1), (15, 1)],
  term ((24046165200 : Rat) / 150171761) [(5, 1), (10, 1), (11, 1)],
  term ((1158307962017321865 : Rat) / 1288183727709509) [(5, 1), (10, 1), (11, 2), (15, 1)],
  term ((624404148 : Rat) / 8578069) [(5, 1), (10, 1), (15, 1)],
  term (4 : Rat) [(6, 1)],
  term (-256 : Rat) [(6, 1), (7, 1), (8, 1), (9, 1)],
  term (128 : Rat) [(6, 1), (7, 1), (8, 1), (9, 1), (10, 1)],
  term ((-144656657440 : Rat) / 150171761) [(6, 1), (7, 1), (8, 1), (10, 1), (11, 1)],
  term ((2631372800 : Rat) / 150171761) [(6, 1), (7, 1), (8, 1), (10, 1), (11, 1), (12, 1)],
  term ((126753685667759360 : Rat) / 1288183727709509) [(6, 1), (7, 1), (8, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((-6968136360951402778 : Rat) / 1288183727709509) [(6, 1), (7, 1), (8, 1), (10, 1), (11, 2), (15, 1)],
  term ((32513214976 : Rat) / 25734207) [(6, 1), (7, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((-45305356358 : Rat) / 25734207) [(6, 1), (7, 1), (8, 1), (10, 1), (15, 1)],
  term ((-108443392176 : Rat) / 150171761) [(6, 1), (7, 1), (8, 1), (11, 1)],
  term ((4255512800 : Rat) / 150171761) [(6, 1), (7, 1), (8, 1), (11, 1), (12, 1)],
  term ((204988792088421110 : Rat) / 1288183727709509) [(6, 1), (7, 1), (8, 1), (11, 2), (12, 1), (15, 1)],
  term ((-5686700262608248931 : Rat) / 1288183727709509) [(6, 1), (7, 1), (8, 1), (11, 2), (15, 1)],
  term ((-44113510904 : Rat) / 25734207) [(6, 1), (7, 1), (8, 1), (12, 1), (15, 1)],
  term ((21597374956 : Rat) / 8578069) [(6, 1), (7, 1), (8, 1), (15, 1)],
  term (4 : Rat) [(6, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term (128 : Rat) [(6, 1), (7, 1), (9, 1)],
  term (-64 : Rat) [(6, 1), (7, 1), (9, 1), (10, 1)],
  term ((72328328720 : Rat) / 150171761) [(6, 1), (7, 1), (10, 1), (11, 1)],
  term ((-1315686400 : Rat) / 150171761) [(6, 1), (7, 1), (10, 1), (11, 1), (12, 1)],
  term ((-63376842833879680 : Rat) / 1288183727709509) [(6, 1), (7, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((3484068180475701389 : Rat) / 1288183727709509) [(6, 1), (7, 1), (10, 1), (11, 2), (15, 1)],
  term ((-16256607488 : Rat) / 25734207) [(6, 1), (7, 1), (10, 1), (12, 1), (15, 1)],
  term ((22652678179 : Rat) / 25734207) [(6, 1), (7, 1), (10, 1), (15, 1)],
  term ((54221696088 : Rat) / 150171761) [(6, 1), (7, 1), (11, 1)],
  term ((-2127756400 : Rat) / 150171761) [(6, 1), (7, 1), (11, 1), (12, 1)],
  term ((-102494396044210555 : Rat) / 1288183727709509) [(6, 1), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((5686700262608248931 : Rat) / 2576367455419018) [(6, 1), (7, 1), (11, 2), (15, 1)],
  term ((22056755452 : Rat) / 25734207) [(6, 1), (7, 1), (12, 1), (15, 1)],
  term ((-10798687478 : Rat) / 8578069) [(6, 1), (7, 1), (15, 1)],
  term (-2 : Rat) [(6, 1), (7, 1), (15, 1), (16, 1)],
  term (224 : Rat) [(6, 1), (7, 2)],
  term (-448 : Rat) [(6, 1), (7, 2), (8, 1)],
  term (256 : Rat) [(6, 1), (7, 2), (8, 1), (10, 1)],
  term (-128 : Rat) [(6, 1), (7, 2), (10, 1)],
  term (-8 : Rat) [(6, 1), (8, 1)],
  term ((-72328328720 : Rat) / 150171761) [(6, 1), (8, 1), (9, 1), (10, 1), (11, 1)],
  term ((1315686400 : Rat) / 150171761) [(6, 1), (8, 1), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((63376842833879680 : Rat) / 1288183727709509) [(6, 1), (8, 1), (9, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((-3484068180475701389 : Rat) / 1288183727709509) [(6, 1), (8, 1), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((16256607488 : Rat) / 25734207) [(6, 1), (8, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-34213519942 : Rat) / 25734207) [(6, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((-8303671440 : Rat) / 8833633) [(6, 1), (8, 1), (9, 1), (11, 1)],
  term ((21976343200 : Rat) / 150171761) [(6, 1), (8, 1), (9, 1), (11, 1), (12, 1)],
  term ((1058604276102421090 : Rat) / 1288183727709509) [(6, 1), (8, 1), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((-263823653800206481 : Rat) / 75775513394677) [(6, 1), (8, 1), (9, 1), (11, 2), (15, 1)],
  term ((-18544280296 : Rat) / 25734207) [(6, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((48189076132 : Rat) / 25734207) [(6, 1), (8, 1), (9, 1), (15, 1)],
  term (4 : Rat) [(6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term (160 : Rat) [(6, 1), (8, 1), (9, 2)],
  term ((7707227842 : Rat) / 8578069) [(6, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((8128303744 : Rat) / 25734207) [(6, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-5545918208 : Rat) / 25734207) [(6, 1), (8, 1), (11, 1), (15, 1)],
  term ((-36164164360 : Rat) / 150171761) [(6, 1), (8, 1), (11, 2)],
  term ((657843200 : Rat) / 150171761) [(6, 1), (8, 1), (11, 2), (12, 1)],
  term ((31688421416939840 : Rat) / 1288183727709509) [(6, 1), (8, 1), (11, 3), (12, 1), (15, 1)],
  term ((-3484068180475701389 : Rat) / 2576367455419018) [(6, 1), (8, 1), (11, 3), (15, 1)],
  term ((36164164360 : Rat) / 150171761) [(6, 1), (9, 1), (10, 1), (11, 1)],
  term ((-657843200 : Rat) / 150171761) [(6, 1), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((-31688421416939840 : Rat) / 1288183727709509) [(6, 1), (9, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((3484068180475701389 : Rat) / 2576367455419018) [(6, 1), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((-8128303744 : Rat) / 25734207) [(6, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((17106759971 : Rat) / 25734207) [(6, 1), (9, 1), (10, 1), (15, 1)],
  term ((4151835720 : Rat) / 8833633) [(6, 1), (9, 1), (11, 1)],
  term ((-10988171600 : Rat) / 150171761) [(6, 1), (9, 1), (11, 1), (12, 1)],
  term ((-529302138051210545 : Rat) / 1288183727709509) [(6, 1), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((263823653800206481 : Rat) / 151551026789354) [(6, 1), (9, 1), (11, 2), (15, 1)],
  term ((9272140148 : Rat) / 25734207) [(6, 1), (9, 1), (12, 1), (15, 1)],
  term ((-24094538066 : Rat) / 25734207) [(6, 1), (9, 1), (15, 1)],
  term (-2 : Rat) [(6, 1), (9, 1), (15, 1), (16, 1)],
  term (-80 : Rat) [(6, 1), (9, 2)],
  term ((-3853613921 : Rat) / 8578069) [(6, 1), (10, 1), (11, 1), (15, 1)],
  term ((-4064151872 : Rat) / 25734207) [(6, 1), (11, 1), (12, 1), (15, 1)],
  term ((2772959104 : Rat) / 25734207) [(6, 1), (11, 1), (15, 1)],
  term ((18082082180 : Rat) / 150171761) [(6, 1), (11, 2)],
  term ((-328921600 : Rat) / 150171761) [(6, 1), (11, 2), (12, 1)],
  term ((-15844210708469920 : Rat) / 1288183727709509) [(6, 1), (11, 3), (12, 1), (15, 1)],
  term ((3484068180475701389 : Rat) / 5152734910838036) [(6, 1), (11, 3), (15, 1)],
  term (352 : Rat) [(7, 1), (8, 1), (9, 1), (10, 1)],
  term ((64997142472 : Rat) / 150171761) [(7, 1), (8, 1), (10, 1), (11, 1)],
  term ((-657843200 : Rat) / 150171761) [(7, 1), (8, 1), (10, 1), (11, 1), (12, 1)],
  term ((-31688421416939840 : Rat) / 1288183727709509) [(7, 1), (8, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((3484068180475701389 : Rat) / 2576367455419018) [(7, 1), (8, 1), (10, 1), (11, 2), (15, 1)],
  term ((-8128303744 : Rat) / 25734207) [(7, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((12957369824 : Rat) / 25734207) [(7, 1), (8, 1), (10, 1), (15, 1)],
  term ((-11001206338 : Rat) / 8578069) [(7, 1), (8, 1), (10, 2), (15, 1)],
  term (-160 : Rat) [(7, 1), (8, 2), (9, 1)],
  term ((72328328720 : Rat) / 150171761) [(7, 1), (8, 2), (10, 1), (11, 1)],
  term ((-1315686400 : Rat) / 150171761) [(7, 1), (8, 2), (10, 1), (11, 1), (12, 1)],
  term ((-63376842833879680 : Rat) / 1288183727709509) [(7, 1), (8, 2), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((3484068180475701389 : Rat) / 1288183727709509) [(7, 1), (8, 2), (10, 1), (11, 2), (15, 1)],
  term ((-16256607488 : Rat) / 25734207) [(7, 1), (8, 2), (10, 1), (12, 1), (15, 1)],
  term ((34213519942 : Rat) / 25734207) [(7, 1), (8, 2), (10, 1), (15, 1)],
  term ((5194232624 : Rat) / 8833633) [(7, 1), (8, 2), (11, 1)],
  term ((-21976343200 : Rat) / 150171761) [(7, 1), (8, 2), (11, 1), (12, 1)],
  term ((-1058604276102421090 : Rat) / 1288183727709509) [(7, 1), (8, 2), (11, 2), (12, 1), (15, 1)],
  term ((263823653800206481 : Rat) / 75775513394677) [(7, 1), (8, 2), (11, 2), (15, 1)],
  term ((18544280296 : Rat) / 25734207) [(7, 1), (8, 2), (12, 1), (15, 1)],
  term ((-48189076132 : Rat) / 25734207) [(7, 1), (8, 2), (15, 1)],
  term (-4 : Rat) [(7, 1), (8, 2), (15, 1), (16, 1)],
  term (40 : Rat) [(7, 1), (9, 1)],
  term (-176 : Rat) [(7, 1), (9, 1), (10, 1)],
  term ((-50580653416 : Rat) / 150171761) [(7, 1), (10, 1), (11, 1)],
  term ((657843200 : Rat) / 150171761) [(7, 1), (10, 1), (11, 1), (12, 1)],
  term ((31688421416939840 : Rat) / 1288183727709509) [(7, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((-3484068180475701389 : Rat) / 2576367455419018) [(7, 1), (10, 1), (11, 2), (15, 1)],
  term ((8128303744 : Rat) / 25734207) [(7, 1), (10, 1), (12, 1), (15, 1)],
  term ((-30064129795 : Rat) / 51468414) [(7, 1), (10, 1), (15, 1)],
  term ((5500603169 : Rat) / 8578069) [(7, 1), (10, 2), (15, 1)],
  term ((-1298558156 : Rat) / 8833633) [(7, 1), (11, 1)],
  term ((5494085800 : Rat) / 150171761) [(7, 1), (11, 1), (12, 1)],
  term ((529302138051210545 : Rat) / 2576367455419018) [(7, 1), (11, 2), (12, 1), (15, 1)],
  term ((-263823653800206481 : Rat) / 303102053578708) [(7, 1), (11, 2), (15, 1)],
  term ((-4636070074 : Rat) / 25734207) [(7, 1), (12, 1), (15, 1)],
  term ((12047269033 : Rat) / 25734207) [(7, 1), (15, 1)],
  term (1 : Rat) [(7, 1), (15, 1), (16, 1)],
  term (-64 : Rat) [(7, 2)],
  term (-64 : Rat) [(7, 2), (8, 1), (10, 1)],
  term (256 : Rat) [(7, 2), (8, 2)],
  term (-128 : Rat) [(7, 2), (8, 2), (10, 1)],
  term (64 : Rat) [(7, 2), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 19, terms 200 through 299. -/
theorem rs_R013_ueqv_R013YNNN_block_19_0200_0299_valid :
    checkProductSumEq rs_R013_ueqv_R013YNNN_partials_19_0200_0299
      rs_R013_ueqv_R013YNNN_block_19_0200_0299 = true := by
  native_decide

end R013UeqvR013YNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
