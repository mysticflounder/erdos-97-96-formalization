/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R013:u=v:R013YNNN, term block 5:300-399

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R013UeqvR013YNNNTermShards

/-- Generator polynomial 5 for relaxed split surplus certificate `R013:u=v:R013YNNN`. -/
def rs_R013_ueqv_R013YNNN_generator_05_0300_0399 : Poly :=
[
  term (-2 : Rat) [(6, 1)],
  term (1 : Rat) [(6, 2)],
  term (1 : Rat) [(7, 2)],
  term (2 : Rat) [(14, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 300 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0300 : Poly :=
[
  term ((2540028560 : Rat) / 25734207) [(2, 2), (3, 1), (15, 1)]
]

/-- Partial product 300 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0300 : Poly :=
[
  term ((-5080057120 : Rat) / 25734207) [(2, 2), (3, 1), (6, 1), (15, 1)],
  term ((2540028560 : Rat) / 25734207) [(2, 2), (3, 1), (6, 2), (15, 1)],
  term ((2540028560 : Rat) / 25734207) [(2, 2), (3, 1), (7, 2), (15, 1)],
  term ((5080057120 : Rat) / 25734207) [(2, 2), (3, 1), (14, 1), (15, 1)],
  term ((-2540028560 : Rat) / 25734207) [(2, 2), (3, 1), (14, 2), (15, 1)],
  term ((-2540028560 : Rat) / 25734207) [(2, 2), (3, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 300 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0300_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0300
        rs_R013_ueqv_R013YNNN_generator_05_0300_0399 =
      rs_R013_ueqv_R013YNNN_partial_05_0300 := by
  native_decide

/-- Coefficient term 301 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0301 : Poly :=
[
  term ((-129863461200 : Rat) / 150171761) [(3, 1), (4, 1), (11, 1)]
]

/-- Partial product 301 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0301 : Poly :=
[
  term ((259726922400 : Rat) / 150171761) [(3, 1), (4, 1), (6, 1), (11, 1)],
  term ((-129863461200 : Rat) / 150171761) [(3, 1), (4, 1), (6, 2), (11, 1)],
  term ((-129863461200 : Rat) / 150171761) [(3, 1), (4, 1), (7, 2), (11, 1)],
  term ((-259726922400 : Rat) / 150171761) [(3, 1), (4, 1), (11, 1), (14, 1)],
  term ((129863461200 : Rat) / 150171761) [(3, 1), (4, 1), (11, 1), (14, 2)],
  term ((129863461200 : Rat) / 150171761) [(3, 1), (4, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 301 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0301_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0301
        rs_R013_ueqv_R013YNNN_generator_05_0300_0399 =
      rs_R013_ueqv_R013YNNN_partial_05_0301 := by
  native_decide

/-- Coefficient term 302 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0302 : Poly :=
[
  term ((-13400751600 : Rat) / 150171761) [(3, 1), (4, 1), (11, 1), (14, 1)]
]

/-- Partial product 302 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0302 : Poly :=
[
  term ((26801503200 : Rat) / 150171761) [(3, 1), (4, 1), (6, 1), (11, 1), (14, 1)],
  term ((-13400751600 : Rat) / 150171761) [(3, 1), (4, 1), (6, 2), (11, 1), (14, 1)],
  term ((-13400751600 : Rat) / 150171761) [(3, 1), (4, 1), (7, 2), (11, 1), (14, 1)],
  term ((13400751600 : Rat) / 150171761) [(3, 1), (4, 1), (11, 1), (14, 1), (15, 2)],
  term ((-26801503200 : Rat) / 150171761) [(3, 1), (4, 1), (11, 1), (14, 2)],
  term ((13400751600 : Rat) / 150171761) [(3, 1), (4, 1), (11, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 302 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0302_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0302
        rs_R013_ueqv_R013YNNN_generator_05_0300_0399 =
      rs_R013_ueqv_R013YNNN_partial_05_0302 := by
  native_decide

/-- Coefficient term 303 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0303 : Poly :=
[
  term ((-645516536470287795 : Rat) / 1288183727709509) [(3, 1), (4, 1), (11, 2), (14, 1), (15, 1)]
]

/-- Partial product 303 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0303 : Poly :=
[
  term ((1291033072940575590 : Rat) / 1288183727709509) [(3, 1), (4, 1), (6, 1), (11, 2), (14, 1), (15, 1)],
  term ((-645516536470287795 : Rat) / 1288183727709509) [(3, 1), (4, 1), (6, 2), (11, 2), (14, 1), (15, 1)],
  term ((-645516536470287795 : Rat) / 1288183727709509) [(3, 1), (4, 1), (7, 2), (11, 2), (14, 1), (15, 1)],
  term ((645516536470287795 : Rat) / 1288183727709509) [(3, 1), (4, 1), (11, 2), (14, 1), (15, 3)],
  term ((-1291033072940575590 : Rat) / 1288183727709509) [(3, 1), (4, 1), (11, 2), (14, 2), (15, 1)],
  term ((645516536470287795 : Rat) / 1288183727709509) [(3, 1), (4, 1), (11, 2), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 303 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0303_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0303
        rs_R013_ueqv_R013YNNN_generator_05_0300_0399 =
      rs_R013_ueqv_R013YNNN_partial_05_0303 := by
  native_decide

/-- Coefficient term 304 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0304 : Poly :=
[
  term ((-6255545523869542065 : Rat) / 1288183727709509) [(3, 1), (4, 1), (11, 2), (15, 1)]
]

/-- Partial product 304 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0304 : Poly :=
[
  term ((12511091047739084130 : Rat) / 1288183727709509) [(3, 1), (4, 1), (6, 1), (11, 2), (15, 1)],
  term ((-6255545523869542065 : Rat) / 1288183727709509) [(3, 1), (4, 1), (6, 2), (11, 2), (15, 1)],
  term ((-6255545523869542065 : Rat) / 1288183727709509) [(3, 1), (4, 1), (7, 2), (11, 2), (15, 1)],
  term ((-12511091047739084130 : Rat) / 1288183727709509) [(3, 1), (4, 1), (11, 2), (14, 1), (15, 1)],
  term ((6255545523869542065 : Rat) / 1288183727709509) [(3, 1), (4, 1), (11, 2), (14, 2), (15, 1)],
  term ((6255545523869542065 : Rat) / 1288183727709509) [(3, 1), (4, 1), (11, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 304 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0304_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0304
        rs_R013_ueqv_R013YNNN_generator_05_0300_0399 =
      rs_R013_ueqv_R013YNNN_partial_05_0304 := by
  native_decide

/-- Coefficient term 305 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0305 : Poly :=
[
  term ((3617350196 : Rat) / 8578069) [(3, 1), (4, 1), (14, 1), (15, 1)]
]

/-- Partial product 305 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0305 : Poly :=
[
  term ((-7234700392 : Rat) / 8578069) [(3, 1), (4, 1), (6, 1), (14, 1), (15, 1)],
  term ((3617350196 : Rat) / 8578069) [(3, 1), (4, 1), (6, 2), (14, 1), (15, 1)],
  term ((3617350196 : Rat) / 8578069) [(3, 1), (4, 1), (7, 2), (14, 1), (15, 1)],
  term ((-3617350196 : Rat) / 8578069) [(3, 1), (4, 1), (14, 1), (15, 3)],
  term ((7234700392 : Rat) / 8578069) [(3, 1), (4, 1), (14, 2), (15, 1)],
  term ((-3617350196 : Rat) / 8578069) [(3, 1), (4, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 305 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0305_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0305
        rs_R013_ueqv_R013YNNN_generator_05_0300_0399 =
      rs_R013_ueqv_R013YNNN_partial_05_0305 := by
  native_decide

/-- Coefficient term 306 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0306 : Poly :=
[
  term ((77946492 : Rat) / 8578069) [(3, 1), (4, 1), (15, 1)]
]

/-- Partial product 306 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0306 : Poly :=
[
  term ((-155892984 : Rat) / 8578069) [(3, 1), (4, 1), (6, 1), (15, 1)],
  term ((77946492 : Rat) / 8578069) [(3, 1), (4, 1), (6, 2), (15, 1)],
  term ((77946492 : Rat) / 8578069) [(3, 1), (4, 1), (7, 2), (15, 1)],
  term ((155892984 : Rat) / 8578069) [(3, 1), (4, 1), (14, 1), (15, 1)],
  term ((-77946492 : Rat) / 8578069) [(3, 1), (4, 1), (14, 2), (15, 1)],
  term ((-77946492 : Rat) / 8578069) [(3, 1), (4, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 306 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0306_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0306
        rs_R013_ueqv_R013YNNN_generator_05_0300_0399 =
      rs_R013_ueqv_R013YNNN_partial_05_0306 := by
  native_decide

/-- Coefficient term 307 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0307 : Poly :=
[
  term ((-23181753200 : Rat) / 150171761) [(3, 1), (5, 1), (11, 1), (13, 1)]
]

/-- Partial product 307 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0307 : Poly :=
[
  term ((46363506400 : Rat) / 150171761) [(3, 1), (5, 1), (6, 1), (11, 1), (13, 1)],
  term ((-23181753200 : Rat) / 150171761) [(3, 1), (5, 1), (6, 2), (11, 1), (13, 1)],
  term ((-23181753200 : Rat) / 150171761) [(3, 1), (5, 1), (7, 2), (11, 1), (13, 1)],
  term ((-46363506400 : Rat) / 150171761) [(3, 1), (5, 1), (11, 1), (13, 1), (14, 1)],
  term ((23181753200 : Rat) / 150171761) [(3, 1), (5, 1), (11, 1), (13, 1), (14, 2)],
  term ((23181753200 : Rat) / 150171761) [(3, 1), (5, 1), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 307 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0307_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0307
        rs_R013_ueqv_R013YNNN_generator_05_0300_0399 =
      rs_R013_ueqv_R013YNNN_partial_05_0307 := by
  native_decide

/-- Coefficient term 308 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0308 : Poly :=
[
  term ((-117266535600 : Rat) / 150171761) [(3, 1), (5, 1), (11, 1), (15, 1)]
]

/-- Partial product 308 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0308 : Poly :=
[
  term ((234533071200 : Rat) / 150171761) [(3, 1), (5, 1), (6, 1), (11, 1), (15, 1)],
  term ((-117266535600 : Rat) / 150171761) [(3, 1), (5, 1), (6, 2), (11, 1), (15, 1)],
  term ((-117266535600 : Rat) / 150171761) [(3, 1), (5, 1), (7, 2), (11, 1), (15, 1)],
  term ((-234533071200 : Rat) / 150171761) [(3, 1), (5, 1), (11, 1), (14, 1), (15, 1)],
  term ((117266535600 : Rat) / 150171761) [(3, 1), (5, 1), (11, 1), (14, 2), (15, 1)],
  term ((117266535600 : Rat) / 150171761) [(3, 1), (5, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 308 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0308_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0308
        rs_R013_ueqv_R013YNNN_generator_05_0300_0399 =
      rs_R013_ueqv_R013YNNN_partial_05_0308 := by
  native_decide

/-- Coefficient term 309 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0309 : Poly :=
[
  term ((-1116669085558828715 : Rat) / 1288183727709509) [(3, 1), (5, 1), (11, 2), (13, 1), (15, 1)]
]

/-- Partial product 309 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0309 : Poly :=
[
  term ((2233338171117657430 : Rat) / 1288183727709509) [(3, 1), (5, 1), (6, 1), (11, 2), (13, 1), (15, 1)],
  term ((-1116669085558828715 : Rat) / 1288183727709509) [(3, 1), (5, 1), (6, 2), (11, 2), (13, 1), (15, 1)],
  term ((-1116669085558828715 : Rat) / 1288183727709509) [(3, 1), (5, 1), (7, 2), (11, 2), (13, 1), (15, 1)],
  term ((-2233338171117657430 : Rat) / 1288183727709509) [(3, 1), (5, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((1116669085558828715 : Rat) / 1288183727709509) [(3, 1), (5, 1), (11, 2), (13, 1), (14, 2), (15, 1)],
  term ((1116669085558828715 : Rat) / 1288183727709509) [(3, 1), (5, 1), (11, 2), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 309 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0309_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0309
        rs_R013_ueqv_R013YNNN_generator_05_0300_0399 =
      rs_R013_ueqv_R013YNNN_partial_05_0309 := by
  native_decide

/-- Coefficient term 310 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0310 : Poly :=
[
  term ((-95741515689746205 : Rat) / 21833622503551) [(3, 1), (5, 1), (11, 2), (15, 2)]
]

/-- Partial product 310 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0310 : Poly :=
[
  term ((191483031379492410 : Rat) / 21833622503551) [(3, 1), (5, 1), (6, 1), (11, 2), (15, 2)],
  term ((-95741515689746205 : Rat) / 21833622503551) [(3, 1), (5, 1), (6, 2), (11, 2), (15, 2)],
  term ((-95741515689746205 : Rat) / 21833622503551) [(3, 1), (5, 1), (7, 2), (11, 2), (15, 2)],
  term ((-191483031379492410 : Rat) / 21833622503551) [(3, 1), (5, 1), (11, 2), (14, 1), (15, 2)],
  term ((95741515689746205 : Rat) / 21833622503551) [(3, 1), (5, 1), (11, 2), (14, 2), (15, 2)],
  term ((95741515689746205 : Rat) / 21833622503551) [(3, 1), (5, 1), (11, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 310 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0310_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0310
        rs_R013_ueqv_R013YNNN_generator_05_0300_0399 =
      rs_R013_ueqv_R013YNNN_partial_05_0310 := by
  native_decide

/-- Coefficient term 311 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0311 : Poly :=
[
  term ((27585262556 : Rat) / 25734207) [(3, 1), (5, 1), (13, 1), (15, 1)]
]

/-- Partial product 311 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0311 : Poly :=
[
  term ((-55170525112 : Rat) / 25734207) [(3, 1), (5, 1), (6, 1), (13, 1), (15, 1)],
  term ((27585262556 : Rat) / 25734207) [(3, 1), (5, 1), (6, 2), (13, 1), (15, 1)],
  term ((27585262556 : Rat) / 25734207) [(3, 1), (5, 1), (7, 2), (13, 1), (15, 1)],
  term ((55170525112 : Rat) / 25734207) [(3, 1), (5, 1), (13, 1), (14, 1), (15, 1)],
  term ((-27585262556 : Rat) / 25734207) [(3, 1), (5, 1), (13, 1), (14, 2), (15, 1)],
  term ((-27585262556 : Rat) / 25734207) [(3, 1), (5, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 311 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0311_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0311
        rs_R013_ueqv_R013YNNN_generator_05_0300_0399 =
      rs_R013_ueqv_R013YNNN_partial_05_0311 := by
  native_decide

/-- Coefficient term 312 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0312 : Poly :=
[
  term ((38893324 : Rat) / 145391) [(3, 1), (5, 1), (15, 2)]
]

/-- Partial product 312 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0312 : Poly :=
[
  term ((-77786648 : Rat) / 145391) [(3, 1), (5, 1), (6, 1), (15, 2)],
  term ((38893324 : Rat) / 145391) [(3, 1), (5, 1), (6, 2), (15, 2)],
  term ((38893324 : Rat) / 145391) [(3, 1), (5, 1), (7, 2), (15, 2)],
  term ((77786648 : Rat) / 145391) [(3, 1), (5, 1), (14, 1), (15, 2)],
  term ((-38893324 : Rat) / 145391) [(3, 1), (5, 1), (14, 2), (15, 2)],
  term ((-38893324 : Rat) / 145391) [(3, 1), (5, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 312 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0312_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0312
        rs_R013_ueqv_R013YNNN_generator_05_0300_0399 =
      rs_R013_ueqv_R013YNNN_partial_05_0312 := by
  native_decide

/-- Coefficient term 313 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0313 : Poly :=
[
  term ((4656059400 : Rat) / 150171761) [(3, 1), (7, 1), (11, 1), (13, 1)]
]

/-- Partial product 313 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0313 : Poly :=
[
  term ((-9312118800 : Rat) / 150171761) [(3, 1), (6, 1), (7, 1), (11, 1), (13, 1)],
  term ((4656059400 : Rat) / 150171761) [(3, 1), (6, 2), (7, 1), (11, 1), (13, 1)],
  term ((9312118800 : Rat) / 150171761) [(3, 1), (7, 1), (11, 1), (13, 1), (14, 1)],
  term ((-4656059400 : Rat) / 150171761) [(3, 1), (7, 1), (11, 1), (13, 1), (14, 2)],
  term ((-4656059400 : Rat) / 150171761) [(3, 1), (7, 1), (11, 1), (13, 1), (15, 2)],
  term ((4656059400 : Rat) / 150171761) [(3, 1), (7, 3), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 313 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0313_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0313
        rs_R013_ueqv_R013YNNN_generator_05_0300_0399 =
      rs_R013_ueqv_R013YNNN_partial_05_0313 := by
  native_decide

/-- Coefficient term 314 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0314 : Poly :=
[
  term ((15669817600 : Rat) / 150171761) [(3, 1), (7, 1), (11, 1), (15, 1)]
]

/-- Partial product 314 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0314 : Poly :=
[
  term ((-31339635200 : Rat) / 150171761) [(3, 1), (6, 1), (7, 1), (11, 1), (15, 1)],
  term ((15669817600 : Rat) / 150171761) [(3, 1), (6, 2), (7, 1), (11, 1), (15, 1)],
  term ((31339635200 : Rat) / 150171761) [(3, 1), (7, 1), (11, 1), (14, 1), (15, 1)],
  term ((-15669817600 : Rat) / 150171761) [(3, 1), (7, 1), (11, 1), (14, 2), (15, 1)],
  term ((-15669817600 : Rat) / 150171761) [(3, 1), (7, 1), (11, 1), (15, 3)],
  term ((15669817600 : Rat) / 150171761) [(3, 1), (7, 3), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 314 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0314_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0314
        rs_R013_ueqv_R013YNNN_generator_05_0300_0399 =
      rs_R013_ueqv_R013YNNN_partial_05_0314 := by
  native_decide

/-- Coefficient term 315 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0315 : Poly :=
[
  term ((448566383021072685 : Rat) / 2576367455419018) [(3, 1), (7, 1), (11, 2), (13, 1), (15, 1)]
]

/-- Partial product 315 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0315 : Poly :=
[
  term ((-448566383021072685 : Rat) / 1288183727709509) [(3, 1), (6, 1), (7, 1), (11, 2), (13, 1), (15, 1)],
  term ((448566383021072685 : Rat) / 2576367455419018) [(3, 1), (6, 2), (7, 1), (11, 2), (13, 1), (15, 1)],
  term ((448566383021072685 : Rat) / 1288183727709509) [(3, 1), (7, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-448566383021072685 : Rat) / 2576367455419018) [(3, 1), (7, 1), (11, 2), (13, 1), (14, 2), (15, 1)],
  term ((-448566383021072685 : Rat) / 2576367455419018) [(3, 1), (7, 1), (11, 2), (13, 1), (15, 3)],
  term ((448566383021072685 : Rat) / 2576367455419018) [(3, 1), (7, 3), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 315 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0315_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0315
        rs_R013_ueqv_R013YNNN_generator_05_0300_0399 =
      rs_R013_ueqv_R013YNNN_partial_05_0315 := by
  native_decide

/-- Coefficient term 316 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0316 : Poly :=
[
  term ((754817840536135120 : Rat) / 1288183727709509) [(3, 1), (7, 1), (11, 2), (15, 2)]
]

/-- Partial product 316 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0316 : Poly :=
[
  term ((-1509635681072270240 : Rat) / 1288183727709509) [(3, 1), (6, 1), (7, 1), (11, 2), (15, 2)],
  term ((754817840536135120 : Rat) / 1288183727709509) [(3, 1), (6, 2), (7, 1), (11, 2), (15, 2)],
  term ((1509635681072270240 : Rat) / 1288183727709509) [(3, 1), (7, 1), (11, 2), (14, 1), (15, 2)],
  term ((-754817840536135120 : Rat) / 1288183727709509) [(3, 1), (7, 1), (11, 2), (14, 2), (15, 2)],
  term ((-754817840536135120 : Rat) / 1288183727709509) [(3, 1), (7, 1), (11, 2), (15, 4)],
  term ((754817840536135120 : Rat) / 1288183727709509) [(3, 1), (7, 3), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 316 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0316_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0316
        rs_R013_ueqv_R013YNNN_generator_05_0300_0399 =
      rs_R013_ueqv_R013YNNN_partial_05_0316 := by
  native_decide

/-- Coefficient term 317 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0317 : Poly :=
[
  term ((437091386 : Rat) / 8578069) [(3, 1), (7, 1), (13, 1), (15, 1)]
]

/-- Partial product 317 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0317 : Poly :=
[
  term ((-874182772 : Rat) / 8578069) [(3, 1), (6, 1), (7, 1), (13, 1), (15, 1)],
  term ((437091386 : Rat) / 8578069) [(3, 1), (6, 2), (7, 1), (13, 1), (15, 1)],
  term ((874182772 : Rat) / 8578069) [(3, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((-437091386 : Rat) / 8578069) [(3, 1), (7, 1), (13, 1), (14, 2), (15, 1)],
  term ((-437091386 : Rat) / 8578069) [(3, 1), (7, 1), (13, 1), (15, 3)],
  term ((437091386 : Rat) / 8578069) [(3, 1), (7, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 317 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0317_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0317
        rs_R013_ueqv_R013YNNN_generator_05_0300_0399 =
      rs_R013_ueqv_R013YNNN_partial_05_0317 := by
  native_decide

/-- Coefficient term 318 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0318 : Poly :=
[
  term ((-12808589248 : Rat) / 25734207) [(3, 1), (7, 1), (15, 2)]
]

/-- Partial product 318 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0318 : Poly :=
[
  term ((25617178496 : Rat) / 25734207) [(3, 1), (6, 1), (7, 1), (15, 2)],
  term ((-12808589248 : Rat) / 25734207) [(3, 1), (6, 2), (7, 1), (15, 2)],
  term ((-25617178496 : Rat) / 25734207) [(3, 1), (7, 1), (14, 1), (15, 2)],
  term ((12808589248 : Rat) / 25734207) [(3, 1), (7, 1), (14, 2), (15, 2)],
  term ((12808589248 : Rat) / 25734207) [(3, 1), (7, 1), (15, 4)],
  term ((-12808589248 : Rat) / 25734207) [(3, 1), (7, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 318 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0318_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0318
        rs_R013_ueqv_R013YNNN_generator_05_0300_0399 =
      rs_R013_ueqv_R013YNNN_partial_05_0318 := by
  native_decide

/-- Coefficient term 319 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0319 : Poly :=
[
  term ((-13546041600 : Rat) / 150171761) [(3, 1), (10, 1), (11, 1)]
]

/-- Partial product 319 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0319 : Poly :=
[
  term ((27092083200 : Rat) / 150171761) [(3, 1), (6, 1), (10, 1), (11, 1)],
  term ((-13546041600 : Rat) / 150171761) [(3, 1), (6, 2), (10, 1), (11, 1)],
  term ((-13546041600 : Rat) / 150171761) [(3, 1), (7, 2), (10, 1), (11, 1)],
  term ((-27092083200 : Rat) / 150171761) [(3, 1), (10, 1), (11, 1), (14, 1)],
  term ((13546041600 : Rat) / 150171761) [(3, 1), (10, 1), (11, 1), (14, 2)],
  term ((13546041600 : Rat) / 150171761) [(3, 1), (10, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 319 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0319_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0319
        rs_R013_ueqv_R013YNNN_generator_05_0300_0399 =
      rs_R013_ueqv_R013YNNN_partial_05_0319 := by
  native_decide

/-- Coefficient term 320 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0320 : Poly :=
[
  term ((-13546041600 : Rat) / 150171761) [(3, 1), (10, 1), (11, 1), (14, 1)]
]

/-- Partial product 320 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0320 : Poly :=
[
  term ((27092083200 : Rat) / 150171761) [(3, 1), (6, 1), (10, 1), (11, 1), (14, 1)],
  term ((-13546041600 : Rat) / 150171761) [(3, 1), (6, 2), (10, 1), (11, 1), (14, 1)],
  term ((-13546041600 : Rat) / 150171761) [(3, 1), (7, 2), (10, 1), (11, 1), (14, 1)],
  term ((13546041600 : Rat) / 150171761) [(3, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((-27092083200 : Rat) / 150171761) [(3, 1), (10, 1), (11, 1), (14, 2)],
  term ((13546041600 : Rat) / 150171761) [(3, 1), (10, 1), (11, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 320 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0320_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0320
        rs_R013_ueqv_R013YNNN_generator_05_0300_0399 =
      rs_R013_ueqv_R013YNNN_partial_05_0320 := by
  native_decide

/-- Coefficient term 321 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0321 : Poly :=
[
  term ((-652515181052563920 : Rat) / 1288183727709509) [(3, 1), (10, 1), (11, 2), (14, 1), (15, 1)]
]

/-- Partial product 321 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0321 : Poly :=
[
  term ((1305030362105127840 : Rat) / 1288183727709509) [(3, 1), (6, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((-652515181052563920 : Rat) / 1288183727709509) [(3, 1), (6, 2), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((-652515181052563920 : Rat) / 1288183727709509) [(3, 1), (7, 2), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((652515181052563920 : Rat) / 1288183727709509) [(3, 1), (10, 1), (11, 2), (14, 1), (15, 3)],
  term ((-1305030362105127840 : Rat) / 1288183727709509) [(3, 1), (10, 1), (11, 2), (14, 2), (15, 1)],
  term ((652515181052563920 : Rat) / 1288183727709509) [(3, 1), (10, 1), (11, 2), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 321 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0321_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0321
        rs_R013_ueqv_R013YNNN_generator_05_0300_0399 =
      rs_R013_ueqv_R013YNNN_partial_05_0321 := by
  native_decide

/-- Coefficient term 322 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0322 : Poly :=
[
  term ((-652515181052563920 : Rat) / 1288183727709509) [(3, 1), (10, 1), (11, 2), (15, 1)]
]

/-- Partial product 322 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0322 : Poly :=
[
  term ((1305030362105127840 : Rat) / 1288183727709509) [(3, 1), (6, 1), (10, 1), (11, 2), (15, 1)],
  term ((-652515181052563920 : Rat) / 1288183727709509) [(3, 1), (6, 2), (10, 1), (11, 2), (15, 1)],
  term ((-652515181052563920 : Rat) / 1288183727709509) [(3, 1), (7, 2), (10, 1), (11, 2), (15, 1)],
  term ((-1305030362105127840 : Rat) / 1288183727709509) [(3, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((652515181052563920 : Rat) / 1288183727709509) [(3, 1), (10, 1), (11, 2), (14, 2), (15, 1)],
  term ((652515181052563920 : Rat) / 1288183727709509) [(3, 1), (10, 1), (11, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 322 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0322_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0322
        rs_R013_ueqv_R013YNNN_generator_05_0300_0399 =
      rs_R013_ueqv_R013YNNN_partial_05_0322 := by
  native_decide

/-- Coefficient term 323 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0323 : Poly :=
[
  term ((860779296 : Rat) / 8578069) [(3, 1), (10, 1), (14, 1), (15, 1)]
]

/-- Partial product 323 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0323 : Poly :=
[
  term ((-1721558592 : Rat) / 8578069) [(3, 1), (6, 1), (10, 1), (14, 1), (15, 1)],
  term ((860779296 : Rat) / 8578069) [(3, 1), (6, 2), (10, 1), (14, 1), (15, 1)],
  term ((860779296 : Rat) / 8578069) [(3, 1), (7, 2), (10, 1), (14, 1), (15, 1)],
  term ((-860779296 : Rat) / 8578069) [(3, 1), (10, 1), (14, 1), (15, 3)],
  term ((1721558592 : Rat) / 8578069) [(3, 1), (10, 1), (14, 2), (15, 1)],
  term ((-860779296 : Rat) / 8578069) [(3, 1), (10, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 323 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0323_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0323
        rs_R013_ueqv_R013YNNN_generator_05_0300_0399 =
      rs_R013_ueqv_R013YNNN_partial_05_0323 := by
  native_decide

/-- Coefficient term 324 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0324 : Poly :=
[
  term ((860779296 : Rat) / 8578069) [(3, 1), (10, 1), (15, 1)]
]

/-- Partial product 324 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0324 : Poly :=
[
  term ((-1721558592 : Rat) / 8578069) [(3, 1), (6, 1), (10, 1), (15, 1)],
  term ((860779296 : Rat) / 8578069) [(3, 1), (6, 2), (10, 1), (15, 1)],
  term ((860779296 : Rat) / 8578069) [(3, 1), (7, 2), (10, 1), (15, 1)],
  term ((1721558592 : Rat) / 8578069) [(3, 1), (10, 1), (14, 1), (15, 1)],
  term ((-860779296 : Rat) / 8578069) [(3, 1), (10, 1), (14, 2), (15, 1)],
  term ((-860779296 : Rat) / 8578069) [(3, 1), (10, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 324 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0324_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0324
        rs_R013_ueqv_R013YNNN_generator_05_0300_0399 =
      rs_R013_ueqv_R013YNNN_partial_05_0324 := by
  native_decide

/-- Coefficient term 325 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0325 : Poly :=
[
  term ((92245571850 : Rat) / 150171761) [(3, 1), (11, 1)]
]

/-- Partial product 325 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0325 : Poly :=
[
  term ((-184491143700 : Rat) / 150171761) [(3, 1), (6, 1), (11, 1)],
  term ((92245571850 : Rat) / 150171761) [(3, 1), (6, 2), (11, 1)],
  term ((92245571850 : Rat) / 150171761) [(3, 1), (7, 2), (11, 1)],
  term ((184491143700 : Rat) / 150171761) [(3, 1), (11, 1), (14, 1)],
  term ((-92245571850 : Rat) / 150171761) [(3, 1), (11, 1), (14, 2)],
  term ((-92245571850 : Rat) / 150171761) [(3, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 325 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0325_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0325
        rs_R013_ueqv_R013YNNN_generator_05_0300_0399 =
      rs_R013_ueqv_R013YNNN_partial_05_0325 := by
  native_decide

/-- Coefficient term 326 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0326 : Poly :=
[
  term ((-6027147900 : Rat) / 150171761) [(3, 1), (11, 1), (12, 1)]
]

/-- Partial product 326 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0326 : Poly :=
[
  term ((12054295800 : Rat) / 150171761) [(3, 1), (6, 1), (11, 1), (12, 1)],
  term ((-6027147900 : Rat) / 150171761) [(3, 1), (6, 2), (11, 1), (12, 1)],
  term ((-6027147900 : Rat) / 150171761) [(3, 1), (7, 2), (11, 1), (12, 1)],
  term ((-12054295800 : Rat) / 150171761) [(3, 1), (11, 1), (12, 1), (14, 1)],
  term ((6027147900 : Rat) / 150171761) [(3, 1), (11, 1), (12, 1), (14, 2)],
  term ((6027147900 : Rat) / 150171761) [(3, 1), (11, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 326 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0326_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0326
        rs_R013_ueqv_R013YNNN_generator_05_0300_0399 =
      rs_R013_ueqv_R013YNNN_partial_05_0326 := by
  native_decide

/-- Coefficient term 327 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0327 : Poly :=
[
  term ((129315175700 : Rat) / 150171761) [(3, 1), (11, 1), (12, 1), (14, 1)]
]

/-- Partial product 327 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0327 : Poly :=
[
  term ((-258630351400 : Rat) / 150171761) [(3, 1), (6, 1), (11, 1), (12, 1), (14, 1)],
  term ((129315175700 : Rat) / 150171761) [(3, 1), (6, 2), (11, 1), (12, 1), (14, 1)],
  term ((129315175700 : Rat) / 150171761) [(3, 1), (7, 2), (11, 1), (12, 1), (14, 1)],
  term ((-129315175700 : Rat) / 150171761) [(3, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((258630351400 : Rat) / 150171761) [(3, 1), (11, 1), (12, 1), (14, 2)],
  term ((-129315175700 : Rat) / 150171761) [(3, 1), (11, 1), (12, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 327 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0327_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0327
        rs_R013_ueqv_R013YNNN_generator_05_0300_0399 =
      rs_R013_ueqv_R013YNNN_partial_05_0327 := by
  native_decide

/-- Coefficient term 328 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0328 : Poly :=
[
  term ((178591625200 : Rat) / 150171761) [(3, 1), (11, 1), (12, 2)]
]

/-- Partial product 328 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0328 : Poly :=
[
  term ((-357183250400 : Rat) / 150171761) [(3, 1), (6, 1), (11, 1), (12, 2)],
  term ((178591625200 : Rat) / 150171761) [(3, 1), (6, 2), (11, 1), (12, 2)],
  term ((178591625200 : Rat) / 150171761) [(3, 1), (7, 2), (11, 1), (12, 2)],
  term ((357183250400 : Rat) / 150171761) [(3, 1), (11, 1), (12, 2), (14, 1)],
  term ((-178591625200 : Rat) / 150171761) [(3, 1), (11, 1), (12, 2), (14, 2)],
  term ((-178591625200 : Rat) / 150171761) [(3, 1), (11, 1), (12, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 328 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0328_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0328
        rs_R013_ueqv_R013YNNN_generator_05_0300_0399 =
      rs_R013_ueqv_R013YNNN_partial_05_0328 := by
  native_decide

/-- Coefficient term 329 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0329 : Poly :=
[
  term ((129794133700 : Rat) / 150171761) [(3, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 329 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0329 : Poly :=
[
  term ((-259588267400 : Rat) / 150171761) [(3, 1), (6, 1), (11, 1), (13, 1), (15, 1)],
  term ((129794133700 : Rat) / 150171761) [(3, 1), (6, 2), (11, 1), (13, 1), (15, 1)],
  term ((129794133700 : Rat) / 150171761) [(3, 1), (7, 2), (11, 1), (13, 1), (15, 1)],
  term ((259588267400 : Rat) / 150171761) [(3, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-129794133700 : Rat) / 150171761) [(3, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((-129794133700 : Rat) / 150171761) [(3, 1), (11, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 329 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0329_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0329
        rs_R013_ueqv_R013YNNN_generator_05_0300_0399 =
      rs_R013_ueqv_R013YNNN_partial_05_0329 := by
  native_decide

/-- Coefficient term 330 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0330 : Poly :=
[
  term ((596667141200 : Rat) / 150171761) [(3, 1), (11, 1), (13, 2)]
]

/-- Partial product 330 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0330 : Poly :=
[
  term ((-1193334282400 : Rat) / 150171761) [(3, 1), (6, 1), (11, 1), (13, 2)],
  term ((596667141200 : Rat) / 150171761) [(3, 1), (6, 2), (11, 1), (13, 2)],
  term ((596667141200 : Rat) / 150171761) [(3, 1), (7, 2), (11, 1), (13, 2)],
  term ((1193334282400 : Rat) / 150171761) [(3, 1), (11, 1), (13, 2), (14, 1)],
  term ((-596667141200 : Rat) / 150171761) [(3, 1), (11, 1), (13, 2), (14, 2)],
  term ((-596667141200 : Rat) / 150171761) [(3, 1), (11, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 330 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0330_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0330
        rs_R013_ueqv_R013YNNN_generator_05_0300_0399 =
      rs_R013_ueqv_R013YNNN_partial_05_0330 := by
  native_decide

/-- Coefficient term 331 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0331 : Poly :=
[
  term ((66150300800 : Rat) / 150171761) [(3, 1), (11, 1), (14, 1)]
]

/-- Partial product 331 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0331 : Poly :=
[
  term ((-132300601600 : Rat) / 150171761) [(3, 1), (6, 1), (11, 1), (14, 1)],
  term ((66150300800 : Rat) / 150171761) [(3, 1), (6, 2), (11, 1), (14, 1)],
  term ((66150300800 : Rat) / 150171761) [(3, 1), (7, 2), (11, 1), (14, 1)],
  term ((-66150300800 : Rat) / 150171761) [(3, 1), (11, 1), (14, 1), (15, 2)],
  term ((132300601600 : Rat) / 150171761) [(3, 1), (11, 1), (14, 2)],
  term ((-66150300800 : Rat) / 150171761) [(3, 1), (11, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 331 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0331_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0331
        rs_R013_ueqv_R013YNNN_generator_05_0300_0399 =
      rs_R013_ueqv_R013YNNN_partial_05_0331 := by
  native_decide

/-- Coefficient term 332 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0332 : Poly :=
[
  term ((-59170421450 : Rat) / 150171761) [(3, 1), (11, 1), (14, 2)]
]

/-- Partial product 332 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0332 : Poly :=
[
  term ((118340842900 : Rat) / 150171761) [(3, 1), (6, 1), (11, 1), (14, 2)],
  term ((-59170421450 : Rat) / 150171761) [(3, 1), (6, 2), (11, 1), (14, 2)],
  term ((-59170421450 : Rat) / 150171761) [(3, 1), (7, 2), (11, 1), (14, 2)],
  term ((59170421450 : Rat) / 150171761) [(3, 1), (11, 1), (14, 2), (15, 2)],
  term ((-118340842900 : Rat) / 150171761) [(3, 1), (11, 1), (14, 3)],
  term ((59170421450 : Rat) / 150171761) [(3, 1), (11, 1), (14, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 332 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0332_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0332
        rs_R013_ueqv_R013YNNN_generator_05_0300_0399 =
      rs_R013_ueqv_R013YNNN_partial_05_0332 := by
  native_decide

/-- Coefficient term 333 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0333 : Poly :=
[
  term ((8139304950 : Rat) / 150171761) [(3, 1), (11, 1), (15, 2)]
]

/-- Partial product 333 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0333 : Poly :=
[
  term ((-16278609900 : Rat) / 150171761) [(3, 1), (6, 1), (11, 1), (15, 2)],
  term ((8139304950 : Rat) / 150171761) [(3, 1), (6, 2), (11, 1), (15, 2)],
  term ((8139304950 : Rat) / 150171761) [(3, 1), (7, 2), (11, 1), (15, 2)],
  term ((16278609900 : Rat) / 150171761) [(3, 1), (11, 1), (14, 1), (15, 2)],
  term ((-8139304950 : Rat) / 150171761) [(3, 1), (11, 1), (14, 2), (15, 2)],
  term ((-8139304950 : Rat) / 150171761) [(3, 1), (11, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 333 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0333_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0333
        rs_R013_ueqv_R013YNNN_generator_05_0300_0399 =
      rs_R013_ueqv_R013YNNN_partial_05_0333 := by
  native_decide

/-- Coefficient term 334 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0334 : Poly :=
[
  term ((24916538063704045985 : Rat) / 5152734910838036) [(3, 1), (11, 2), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 334 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0334 : Poly :=
[
  term ((-24916538063704045985 : Rat) / 2576367455419018) [(3, 1), (6, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((24916538063704045985 : Rat) / 5152734910838036) [(3, 1), (6, 2), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((24916538063704045985 : Rat) / 5152734910838036) [(3, 1), (7, 2), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-24916538063704045985 : Rat) / 5152734910838036) [(3, 1), (11, 2), (12, 1), (14, 1), (15, 3)],
  term ((24916538063704045985 : Rat) / 2576367455419018) [(3, 1), (11, 2), (12, 1), (14, 2), (15, 1)],
  term ((-24916538063704045985 : Rat) / 5152734910838036) [(3, 1), (11, 2), (12, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 334 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0334_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0334
        rs_R013_ueqv_R013YNNN_generator_05_0300_0399 =
      rs_R013_ueqv_R013YNNN_partial_05_0334 := by
  native_decide

/-- Coefficient term 335 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0335 : Poly :=
[
  term ((-1161315052568295795 : Rat) / 5152734910838036) [(3, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 335 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0335 : Poly :=
[
  term ((1161315052568295795 : Rat) / 2576367455419018) [(3, 1), (6, 1), (11, 2), (12, 1), (15, 1)],
  term ((-1161315052568295795 : Rat) / 5152734910838036) [(3, 1), (6, 2), (11, 2), (12, 1), (15, 1)],
  term ((-1161315052568295795 : Rat) / 5152734910838036) [(3, 1), (7, 2), (11, 2), (12, 1), (15, 1)],
  term ((-1161315052568295795 : Rat) / 2576367455419018) [(3, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((1161315052568295795 : Rat) / 5152734910838036) [(3, 1), (11, 2), (12, 1), (14, 2), (15, 1)],
  term ((1161315052568295795 : Rat) / 5152734910838036) [(3, 1), (11, 2), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 335 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0335_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0335
        rs_R013_ueqv_R013YNNN_generator_05_0300_0399 =
      rs_R013_ueqv_R013YNNN_partial_05_0335 := by
  native_decide

/-- Coefficient term 336 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0336 : Poly :=
[
  term ((8602789663059180115 : Rat) / 1288183727709509) [(3, 1), (11, 2), (12, 2), (15, 1)]
]

/-- Partial product 336 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0336 : Poly :=
[
  term ((-17205579326118360230 : Rat) / 1288183727709509) [(3, 1), (6, 1), (11, 2), (12, 2), (15, 1)],
  term ((8602789663059180115 : Rat) / 1288183727709509) [(3, 1), (6, 2), (11, 2), (12, 2), (15, 1)],
  term ((8602789663059180115 : Rat) / 1288183727709509) [(3, 1), (7, 2), (11, 2), (12, 2), (15, 1)],
  term ((17205579326118360230 : Rat) / 1288183727709509) [(3, 1), (11, 2), (12, 2), (14, 1), (15, 1)],
  term ((-8602789663059180115 : Rat) / 1288183727709509) [(3, 1), (11, 2), (12, 2), (14, 2), (15, 1)],
  term ((-8602789663059180115 : Rat) / 1288183727709509) [(3, 1), (11, 2), (12, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 336 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0336_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0336
        rs_R013_ueqv_R013YNNN_generator_05_0300_0399 =
      rs_R013_ueqv_R013YNNN_partial_05_0336 := by
  native_decide

/-- Coefficient term 337 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0337 : Poly :=
[
  term ((25008824024522761885 : Rat) / 5152734910838036) [(3, 1), (11, 2), (13, 1), (15, 2)]
]

/-- Partial product 337 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0337 : Poly :=
[
  term ((-25008824024522761885 : Rat) / 2576367455419018) [(3, 1), (6, 1), (11, 2), (13, 1), (15, 2)],
  term ((25008824024522761885 : Rat) / 5152734910838036) [(3, 1), (6, 2), (11, 2), (13, 1), (15, 2)],
  term ((25008824024522761885 : Rat) / 5152734910838036) [(3, 1), (7, 2), (11, 2), (13, 1), (15, 2)],
  term ((25008824024522761885 : Rat) / 2576367455419018) [(3, 1), (11, 2), (13, 1), (14, 1), (15, 2)],
  term ((-25008824024522761885 : Rat) / 5152734910838036) [(3, 1), (11, 2), (13, 1), (14, 2), (15, 2)],
  term ((-25008824024522761885 : Rat) / 5152734910838036) [(3, 1), (11, 2), (13, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 337 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0337_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0337
        rs_R013_ueqv_R013YNNN_generator_05_0300_0399 =
      rs_R013_ueqv_R013YNNN_partial_05_0337 := by
  native_decide

/-- Coefficient term 338 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0338 : Poly :=
[
  term ((28741560019144908065 : Rat) / 1288183727709509) [(3, 1), (11, 2), (13, 2), (15, 1)]
]

/-- Partial product 338 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0338 : Poly :=
[
  term ((-57483120038289816130 : Rat) / 1288183727709509) [(3, 1), (6, 1), (11, 2), (13, 2), (15, 1)],
  term ((28741560019144908065 : Rat) / 1288183727709509) [(3, 1), (6, 2), (11, 2), (13, 2), (15, 1)],
  term ((28741560019144908065 : Rat) / 1288183727709509) [(3, 1), (7, 2), (11, 2), (13, 2), (15, 1)],
  term ((57483120038289816130 : Rat) / 1288183727709509) [(3, 1), (11, 2), (13, 2), (14, 1), (15, 1)],
  term ((-28741560019144908065 : Rat) / 1288183727709509) [(3, 1), (11, 2), (13, 2), (14, 2), (15, 1)],
  term ((-28741560019144908065 : Rat) / 1288183727709509) [(3, 1), (11, 2), (13, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 338 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0338_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0338
        rs_R013_ueqv_R013YNNN_generator_05_0300_0399 =
      rs_R013_ueqv_R013YNNN_partial_05_0338 := by
  native_decide

/-- Coefficient term 339 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0339 : Poly :=
[
  term ((3186471500515217960 : Rat) / 1288183727709509) [(3, 1), (11, 2), (14, 1), (15, 1)]
]

/-- Partial product 339 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0339 : Poly :=
[
  term ((-6372943001030435920 : Rat) / 1288183727709509) [(3, 1), (6, 1), (11, 2), (14, 1), (15, 1)],
  term ((3186471500515217960 : Rat) / 1288183727709509) [(3, 1), (6, 2), (11, 2), (14, 1), (15, 1)],
  term ((3186471500515217960 : Rat) / 1288183727709509) [(3, 1), (7, 2), (11, 2), (14, 1), (15, 1)],
  term ((-3186471500515217960 : Rat) / 1288183727709509) [(3, 1), (11, 2), (14, 1), (15, 3)],
  term ((6372943001030435920 : Rat) / 1288183727709509) [(3, 1), (11, 2), (14, 2), (15, 1)],
  term ((-3186471500515217960 : Rat) / 1288183727709509) [(3, 1), (11, 2), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 339 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0339_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0339
        rs_R013_ueqv_R013YNNN_generator_05_0300_0399 =
      rs_R013_ueqv_R013YNNN_partial_05_0339 := by
  native_decide

/-- Coefficient term 340 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0340 : Poly :=
[
  term ((-22801995981115700545 : Rat) / 10305469821676072) [(3, 1), (11, 2), (14, 2), (15, 1)]
]

/-- Partial product 340 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0340 : Poly :=
[
  term ((22801995981115700545 : Rat) / 5152734910838036) [(3, 1), (6, 1), (11, 2), (14, 2), (15, 1)],
  term ((-22801995981115700545 : Rat) / 10305469821676072) [(3, 1), (6, 2), (11, 2), (14, 2), (15, 1)],
  term ((-22801995981115700545 : Rat) / 10305469821676072) [(3, 1), (7, 2), (11, 2), (14, 2), (15, 1)],
  term ((22801995981115700545 : Rat) / 10305469821676072) [(3, 1), (11, 2), (14, 2), (15, 3)],
  term ((-22801995981115700545 : Rat) / 5152734910838036) [(3, 1), (11, 2), (14, 3), (15, 1)],
  term ((22801995981115700545 : Rat) / 10305469821676072) [(3, 1), (11, 2), (14, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 340 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0340_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0340
        rs_R013_ueqv_R013YNNN_generator_05_0300_0399 =
      rs_R013_ueqv_R013YNNN_partial_05_0340 := by
  native_decide

/-- Coefficient term 341 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0341 : Poly :=
[
  term ((35547881983176572385 : Rat) / 10305469821676072) [(3, 1), (11, 2), (15, 1)]
]

/-- Partial product 341 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0341 : Poly :=
[
  term ((-35547881983176572385 : Rat) / 5152734910838036) [(3, 1), (6, 1), (11, 2), (15, 1)],
  term ((35547881983176572385 : Rat) / 10305469821676072) [(3, 1), (6, 2), (11, 2), (15, 1)],
  term ((35547881983176572385 : Rat) / 10305469821676072) [(3, 1), (7, 2), (11, 2), (15, 1)],
  term ((35547881983176572385 : Rat) / 5152734910838036) [(3, 1), (11, 2), (14, 1), (15, 1)],
  term ((-35547881983176572385 : Rat) / 10305469821676072) [(3, 1), (11, 2), (14, 2), (15, 1)],
  term ((-35547881983176572385 : Rat) / 10305469821676072) [(3, 1), (11, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 341 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0341_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0341
        rs_R013_ueqv_R013YNNN_generator_05_0300_0399 =
      rs_R013_ueqv_R013YNNN_partial_05_0341 := by
  native_decide

/-- Coefficient term 342 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0342 : Poly :=
[
  term ((3136573886258420895 : Rat) / 10305469821676072) [(3, 1), (11, 2), (15, 3)]
]

/-- Partial product 342 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0342 : Poly :=
[
  term ((-3136573886258420895 : Rat) / 5152734910838036) [(3, 1), (6, 1), (11, 2), (15, 3)],
  term ((3136573886258420895 : Rat) / 10305469821676072) [(3, 1), (6, 2), (11, 2), (15, 3)],
  term ((3136573886258420895 : Rat) / 10305469821676072) [(3, 1), (7, 2), (11, 2), (15, 3)],
  term ((3136573886258420895 : Rat) / 5152734910838036) [(3, 1), (11, 2), (14, 1), (15, 3)],
  term ((-3136573886258420895 : Rat) / 10305469821676072) [(3, 1), (11, 2), (14, 2), (15, 3)],
  term ((-3136573886258420895 : Rat) / 10305469821676072) [(3, 1), (11, 2), (15, 5)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 342 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0342_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0342
        rs_R013_ueqv_R013YNNN_generator_05_0300_0399 =
      rs_R013_ueqv_R013YNNN_partial_05_0342 := by
  native_decide

/-- Coefficient term 343 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0343 : Poly :=
[
  term ((83325925219 : Rat) / 25734207) [(3, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 343 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0343 : Poly :=
[
  term ((-166651850438 : Rat) / 25734207) [(3, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((83325925219 : Rat) / 25734207) [(3, 1), (6, 2), (12, 1), (14, 1), (15, 1)],
  term ((83325925219 : Rat) / 25734207) [(3, 1), (7, 2), (12, 1), (14, 1), (15, 1)],
  term ((-83325925219 : Rat) / 25734207) [(3, 1), (12, 1), (14, 1), (15, 3)],
  term ((166651850438 : Rat) / 25734207) [(3, 1), (12, 1), (14, 2), (15, 1)],
  term ((-83325925219 : Rat) / 25734207) [(3, 1), (12, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 343 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0343_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0343
        rs_R013_ueqv_R013YNNN_generator_05_0300_0399 =
      rs_R013_ueqv_R013YNNN_partial_05_0343 := by
  native_decide

/-- Coefficient term 344 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0344 : Poly :=
[
  term ((16165700269 : Rat) / 8578069) [(3, 1), (12, 1), (15, 1)]
]

/-- Partial product 344 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0344 : Poly :=
[
  term ((-32331400538 : Rat) / 8578069) [(3, 1), (6, 1), (12, 1), (15, 1)],
  term ((16165700269 : Rat) / 8578069) [(3, 1), (6, 2), (12, 1), (15, 1)],
  term ((16165700269 : Rat) / 8578069) [(3, 1), (7, 2), (12, 1), (15, 1)],
  term ((32331400538 : Rat) / 8578069) [(3, 1), (12, 1), (14, 1), (15, 1)],
  term ((-16165700269 : Rat) / 8578069) [(3, 1), (12, 1), (14, 2), (15, 1)],
  term ((-16165700269 : Rat) / 8578069) [(3, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 344 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0344_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0344
        rs_R013_ueqv_R013YNNN_generator_05_0300_0399 =
      rs_R013_ueqv_R013YNNN_partial_05_0344 := by
  native_decide

/-- Coefficient term 345 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0345 : Poly :=
[
  term ((50991025124 : Rat) / 25734207) [(3, 1), (12, 2), (15, 1)]
]

/-- Partial product 345 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0345 : Poly :=
[
  term ((-101982050248 : Rat) / 25734207) [(3, 1), (6, 1), (12, 2), (15, 1)],
  term ((50991025124 : Rat) / 25734207) [(3, 1), (6, 2), (12, 2), (15, 1)],
  term ((50991025124 : Rat) / 25734207) [(3, 1), (7, 2), (12, 2), (15, 1)],
  term ((101982050248 : Rat) / 25734207) [(3, 1), (12, 2), (14, 1), (15, 1)],
  term ((-50991025124 : Rat) / 25734207) [(3, 1), (12, 2), (14, 2), (15, 1)],
  term ((-50991025124 : Rat) / 25734207) [(3, 1), (12, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 345 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0345_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0345
        rs_R013_ueqv_R013YNNN_generator_05_0300_0399 =
      rs_R013_ueqv_R013YNNN_partial_05_0345 := by
  native_decide

/-- Coefficient term 346 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0346 : Poly :=
[
  term ((-1500705001 : Rat) / 25734207) [(3, 1), (13, 1), (15, 2)]
]

/-- Partial product 346 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0346 : Poly :=
[
  term ((3001410002 : Rat) / 25734207) [(3, 1), (6, 1), (13, 1), (15, 2)],
  term ((-1500705001 : Rat) / 25734207) [(3, 1), (6, 2), (13, 1), (15, 2)],
  term ((-1500705001 : Rat) / 25734207) [(3, 1), (7, 2), (13, 1), (15, 2)],
  term ((-3001410002 : Rat) / 25734207) [(3, 1), (13, 1), (14, 1), (15, 2)],
  term ((1500705001 : Rat) / 25734207) [(3, 1), (13, 1), (14, 2), (15, 2)],
  term ((1500705001 : Rat) / 25734207) [(3, 1), (13, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 346 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0346_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0346
        rs_R013_ueqv_R013YNNN_generator_05_0300_0399 =
      rs_R013_ueqv_R013YNNN_partial_05_0346 := by
  native_decide

/-- Coefficient term 347 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0347 : Poly :=
[
  term ((255343153804 : Rat) / 25734207) [(3, 1), (13, 2), (15, 1)]
]

/-- Partial product 347 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0347 : Poly :=
[
  term ((-510686307608 : Rat) / 25734207) [(3, 1), (6, 1), (13, 2), (15, 1)],
  term ((255343153804 : Rat) / 25734207) [(3, 1), (6, 2), (13, 2), (15, 1)],
  term ((255343153804 : Rat) / 25734207) [(3, 1), (7, 2), (13, 2), (15, 1)],
  term ((510686307608 : Rat) / 25734207) [(3, 1), (13, 2), (14, 1), (15, 1)],
  term ((-255343153804 : Rat) / 25734207) [(3, 1), (13, 2), (14, 2), (15, 1)],
  term ((-255343153804 : Rat) / 25734207) [(3, 1), (13, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 347 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0347_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0347
        rs_R013_ueqv_R013YNNN_generator_05_0300_0399 =
      rs_R013_ueqv_R013YNNN_partial_05_0347 := by
  native_decide

/-- Coefficient term 348 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0348 : Poly :=
[
  term ((-13184616704 : Rat) / 25734207) [(3, 1), (14, 1), (15, 1)]
]

/-- Partial product 348 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0348 : Poly :=
[
  term ((26369233408 : Rat) / 25734207) [(3, 1), (6, 1), (14, 1), (15, 1)],
  term ((-13184616704 : Rat) / 25734207) [(3, 1), (6, 2), (14, 1), (15, 1)],
  term ((-13184616704 : Rat) / 25734207) [(3, 1), (7, 2), (14, 1), (15, 1)],
  term ((13184616704 : Rat) / 25734207) [(3, 1), (14, 1), (15, 3)],
  term ((-26369233408 : Rat) / 25734207) [(3, 1), (14, 2), (15, 1)],
  term ((13184616704 : Rat) / 25734207) [(3, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 348 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0348_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0348
        rs_R013_ueqv_R013YNNN_generator_05_0300_0399 =
      rs_R013_ueqv_R013YNNN_partial_05_0348 := by
  native_decide

/-- Coefficient term 349 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0349 : Poly :=
[
  term ((-2041952483 : Rat) / 51468414) [(3, 1), (14, 2), (15, 1)]
]

/-- Partial product 349 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0349 : Poly :=
[
  term ((2041952483 : Rat) / 25734207) [(3, 1), (6, 1), (14, 2), (15, 1)],
  term ((-2041952483 : Rat) / 51468414) [(3, 1), (6, 2), (14, 2), (15, 1)],
  term ((-2041952483 : Rat) / 51468414) [(3, 1), (7, 2), (14, 2), (15, 1)],
  term ((2041952483 : Rat) / 51468414) [(3, 1), (14, 2), (15, 3)],
  term ((-2041952483 : Rat) / 25734207) [(3, 1), (14, 3), (15, 1)],
  term ((2041952483 : Rat) / 51468414) [(3, 1), (14, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 349 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0349_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0349
        rs_R013_ueqv_R013YNNN_generator_05_0300_0399 =
      rs_R013_ueqv_R013YNNN_partial_05_0349 := by
  native_decide

/-- Coefficient term 350 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0350 : Poly :=
[
  term ((-3714221407 : Rat) / 17156138) [(3, 1), (15, 1)]
]

/-- Partial product 350 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0350 : Poly :=
[
  term ((3714221407 : Rat) / 8578069) [(3, 1), (6, 1), (15, 1)],
  term ((-3714221407 : Rat) / 17156138) [(3, 1), (6, 2), (15, 1)],
  term ((-3714221407 : Rat) / 17156138) [(3, 1), (7, 2), (15, 1)],
  term ((-3714221407 : Rat) / 8578069) [(3, 1), (14, 1), (15, 1)],
  term ((3714221407 : Rat) / 17156138) [(3, 1), (14, 2), (15, 1)],
  term ((3714221407 : Rat) / 17156138) [(3, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 350 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0350_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0350
        rs_R013_ueqv_R013YNNN_generator_05_0300_0399 =
      rs_R013_ueqv_R013YNNN_partial_05_0350 := by
  native_decide

/-- Coefficient term 351 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0351 : Poly :=
[
  term ((2607959871 : Rat) / 17156138) [(3, 1), (15, 3)]
]

/-- Partial product 351 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0351 : Poly :=
[
  term ((-2607959871 : Rat) / 8578069) [(3, 1), (6, 1), (15, 3)],
  term ((2607959871 : Rat) / 17156138) [(3, 1), (6, 2), (15, 3)],
  term ((2607959871 : Rat) / 17156138) [(3, 1), (7, 2), (15, 3)],
  term ((2607959871 : Rat) / 8578069) [(3, 1), (14, 1), (15, 3)],
  term ((-2607959871 : Rat) / 17156138) [(3, 1), (14, 2), (15, 3)],
  term ((-2607959871 : Rat) / 17156138) [(3, 1), (15, 5)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 351 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0351_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0351
        rs_R013_ueqv_R013YNNN_generator_05_0300_0399 =
      rs_R013_ueqv_R013YNNN_partial_05_0351 := by
  native_decide

/-- Coefficient term 352 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0352 : Poly :=
[
  term ((-15873657200 : Rat) / 150171761) [(3, 2), (5, 1), (11, 1)]
]

/-- Partial product 352 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0352 : Poly :=
[
  term ((31747314400 : Rat) / 150171761) [(3, 2), (5, 1), (6, 1), (11, 1)],
  term ((-15873657200 : Rat) / 150171761) [(3, 2), (5, 1), (6, 2), (11, 1)],
  term ((-15873657200 : Rat) / 150171761) [(3, 2), (5, 1), (7, 2), (11, 1)],
  term ((-31747314400 : Rat) / 150171761) [(3, 2), (5, 1), (11, 1), (14, 1)],
  term ((15873657200 : Rat) / 150171761) [(3, 2), (5, 1), (11, 1), (14, 2)],
  term ((15873657200 : Rat) / 150171761) [(3, 2), (5, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 352 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0352_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0352
        rs_R013_ueqv_R013YNNN_generator_05_0300_0399 =
      rs_R013_ueqv_R013YNNN_partial_05_0352 := by
  native_decide

/-- Coefficient term 353 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0353 : Poly :=
[
  term ((-764636829538773515 : Rat) / 1288183727709509) [(3, 2), (5, 1), (11, 2), (15, 1)]
]

/-- Partial product 353 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0353 : Poly :=
[
  term ((1529273659077547030 : Rat) / 1288183727709509) [(3, 2), (5, 1), (6, 1), (11, 2), (15, 1)],
  term ((-764636829538773515 : Rat) / 1288183727709509) [(3, 2), (5, 1), (6, 2), (11, 2), (15, 1)],
  term ((-764636829538773515 : Rat) / 1288183727709509) [(3, 2), (5, 1), (7, 2), (11, 2), (15, 1)],
  term ((-1529273659077547030 : Rat) / 1288183727709509) [(3, 2), (5, 1), (11, 2), (14, 1), (15, 1)],
  term ((764636829538773515 : Rat) / 1288183727709509) [(3, 2), (5, 1), (11, 2), (14, 2), (15, 1)],
  term ((764636829538773515 : Rat) / 1288183727709509) [(3, 2), (5, 1), (11, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 353 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0353_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0353
        rs_R013_ueqv_R013YNNN_generator_05_0300_0399 =
      rs_R013_ueqv_R013YNNN_partial_05_0353 := by
  native_decide

/-- Coefficient term 354 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0354 : Poly :=
[
  term ((-12926066884 : Rat) / 25734207) [(3, 2), (5, 1), (15, 1)]
]

/-- Partial product 354 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0354 : Poly :=
[
  term ((25852133768 : Rat) / 25734207) [(3, 2), (5, 1), (6, 1), (15, 1)],
  term ((-12926066884 : Rat) / 25734207) [(3, 2), (5, 1), (6, 2), (15, 1)],
  term ((-12926066884 : Rat) / 25734207) [(3, 2), (5, 1), (7, 2), (15, 1)],
  term ((-25852133768 : Rat) / 25734207) [(3, 2), (5, 1), (14, 1), (15, 1)],
  term ((12926066884 : Rat) / 25734207) [(3, 2), (5, 1), (14, 2), (15, 1)],
  term ((12926066884 : Rat) / 25734207) [(3, 2), (5, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 354 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0354_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0354
        rs_R013_ueqv_R013YNNN_generator_05_0300_0399 =
      rs_R013_ueqv_R013YNNN_partial_05_0354 := by
  native_decide

/-- Coefficient term 355 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0355 : Poly :=
[
  term ((-70323376800 : Rat) / 150171761) [(3, 2), (7, 1), (11, 1)]
]

/-- Partial product 355 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0355 : Poly :=
[
  term ((140646753600 : Rat) / 150171761) [(3, 2), (6, 1), (7, 1), (11, 1)],
  term ((-70323376800 : Rat) / 150171761) [(3, 2), (6, 2), (7, 1), (11, 1)],
  term ((-140646753600 : Rat) / 150171761) [(3, 2), (7, 1), (11, 1), (14, 1)],
  term ((70323376800 : Rat) / 150171761) [(3, 2), (7, 1), (11, 1), (14, 2)],
  term ((70323376800 : Rat) / 150171761) [(3, 2), (7, 1), (11, 1), (15, 2)],
  term ((-70323376800 : Rat) / 150171761) [(3, 2), (7, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 355 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0355_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0355
        rs_R013_ueqv_R013YNNN_generator_05_0300_0399 =
      rs_R013_ueqv_R013YNNN_partial_05_0355 := by
  native_decide

/-- Coefficient term 356 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0356 : Poly :=
[
  term ((-3387489297602605410 : Rat) / 1288183727709509) [(3, 2), (7, 1), (11, 2), (15, 1)]
]

/-- Partial product 356 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0356 : Poly :=
[
  term ((6774978595205210820 : Rat) / 1288183727709509) [(3, 2), (6, 1), (7, 1), (11, 2), (15, 1)],
  term ((-3387489297602605410 : Rat) / 1288183727709509) [(3, 2), (6, 2), (7, 1), (11, 2), (15, 1)],
  term ((-6774978595205210820 : Rat) / 1288183727709509) [(3, 2), (7, 1), (11, 2), (14, 1), (15, 1)],
  term ((3387489297602605410 : Rat) / 1288183727709509) [(3, 2), (7, 1), (11, 2), (14, 2), (15, 1)],
  term ((3387489297602605410 : Rat) / 1288183727709509) [(3, 2), (7, 1), (11, 2), (15, 3)],
  term ((-3387489297602605410 : Rat) / 1288183727709509) [(3, 2), (7, 3), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 356 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0356_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0356
        rs_R013_ueqv_R013YNNN_generator_05_0300_0399 =
      rs_R013_ueqv_R013YNNN_partial_05_0356 := by
  native_decide

/-- Coefficient term 357 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0357 : Poly :=
[
  term ((4928338968 : Rat) / 8578069) [(3, 2), (7, 1), (15, 1)]
]

/-- Partial product 357 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0357 : Poly :=
[
  term ((-9856677936 : Rat) / 8578069) [(3, 2), (6, 1), (7, 1), (15, 1)],
  term ((4928338968 : Rat) / 8578069) [(3, 2), (6, 2), (7, 1), (15, 1)],
  term ((9856677936 : Rat) / 8578069) [(3, 2), (7, 1), (14, 1), (15, 1)],
  term ((-4928338968 : Rat) / 8578069) [(3, 2), (7, 1), (14, 2), (15, 1)],
  term ((-4928338968 : Rat) / 8578069) [(3, 2), (7, 1), (15, 3)],
  term ((4928338968 : Rat) / 8578069) [(3, 2), (7, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 357 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0357_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0357
        rs_R013_ueqv_R013YNNN_generator_05_0300_0399 =
      rs_R013_ueqv_R013YNNN_partial_05_0357 := by
  native_decide

/-- Coefficient term 358 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0358 : Poly :=
[
  term ((-415631664000 : Rat) / 150171761) [(3, 2), (11, 1), (13, 1)]
]

/-- Partial product 358 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0358 : Poly :=
[
  term ((831263328000 : Rat) / 150171761) [(3, 2), (6, 1), (11, 1), (13, 1)],
  term ((-415631664000 : Rat) / 150171761) [(3, 2), (6, 2), (11, 1), (13, 1)],
  term ((-415631664000 : Rat) / 150171761) [(3, 2), (7, 2), (11, 1), (13, 1)],
  term ((-831263328000 : Rat) / 150171761) [(3, 2), (11, 1), (13, 1), (14, 1)],
  term ((415631664000 : Rat) / 150171761) [(3, 2), (11, 1), (13, 1), (14, 2)],
  term ((415631664000 : Rat) / 150171761) [(3, 2), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 358 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0358_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0358
        rs_R013_ueqv_R013YNNN_generator_05_0300_0399 =
      rs_R013_ueqv_R013YNNN_partial_05_0358 := by
  native_decide

/-- Coefficient term 359 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0359 : Poly :=
[
  term ((12476476400 : Rat) / 150171761) [(3, 2), (11, 1), (15, 1)]
]

/-- Partial product 359 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0359 : Poly :=
[
  term ((-24952952800 : Rat) / 150171761) [(3, 2), (6, 1), (11, 1), (15, 1)],
  term ((12476476400 : Rat) / 150171761) [(3, 2), (6, 2), (11, 1), (15, 1)],
  term ((12476476400 : Rat) / 150171761) [(3, 2), (7, 2), (11, 1), (15, 1)],
  term ((24952952800 : Rat) / 150171761) [(3, 2), (11, 1), (14, 1), (15, 1)],
  term ((-12476476400 : Rat) / 150171761) [(3, 2), (11, 1), (14, 2), (15, 1)],
  term ((-12476476400 : Rat) / 150171761) [(3, 2), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 359 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0359_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0359
        rs_R013_ueqv_R013YNNN_generator_05_0300_0399 =
      rs_R013_ueqv_R013YNNN_partial_05_0359 := by
  native_decide

/-- Coefficient term 360 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0360 : Poly :=
[
  term ((-20021049579984931800 : Rat) / 1288183727709509) [(3, 2), (11, 2), (13, 1), (15, 1)]
]

/-- Partial product 360 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0360 : Poly :=
[
  term ((40042099159969863600 : Rat) / 1288183727709509) [(3, 2), (6, 1), (11, 2), (13, 1), (15, 1)],
  term ((-20021049579984931800 : Rat) / 1288183727709509) [(3, 2), (6, 2), (11, 2), (13, 1), (15, 1)],
  term ((-20021049579984931800 : Rat) / 1288183727709509) [(3, 2), (7, 2), (11, 2), (13, 1), (15, 1)],
  term ((-40042099159969863600 : Rat) / 1288183727709509) [(3, 2), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((20021049579984931800 : Rat) / 1288183727709509) [(3, 2), (11, 2), (13, 1), (14, 2), (15, 1)],
  term ((20021049579984931800 : Rat) / 1288183727709509) [(3, 2), (11, 2), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 360 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0360_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0360
        rs_R013_ueqv_R013YNNN_generator_05_0300_0399 =
      rs_R013_ueqv_R013YNNN_partial_05_0360 := by
  native_decide

/-- Coefficient term 361 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0361 : Poly :=
[
  term ((600994039250849555 : Rat) / 1288183727709509) [(3, 2), (11, 2), (15, 2)]
]

/-- Partial product 361 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0361 : Poly :=
[
  term ((-1201988078501699110 : Rat) / 1288183727709509) [(3, 2), (6, 1), (11, 2), (15, 2)],
  term ((600994039250849555 : Rat) / 1288183727709509) [(3, 2), (6, 2), (11, 2), (15, 2)],
  term ((600994039250849555 : Rat) / 1288183727709509) [(3, 2), (7, 2), (11, 2), (15, 2)],
  term ((1201988078501699110 : Rat) / 1288183727709509) [(3, 2), (11, 2), (14, 1), (15, 2)],
  term ((-600994039250849555 : Rat) / 1288183727709509) [(3, 2), (11, 2), (14, 2), (15, 2)],
  term ((-600994039250849555 : Rat) / 1288183727709509) [(3, 2), (11, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 361 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0361_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0361
        rs_R013_ueqv_R013YNNN_generator_05_0300_0399 =
      rs_R013_ueqv_R013YNNN_partial_05_0361 := by
  native_decide

/-- Coefficient term 362 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0362 : Poly :=
[
  term ((-33018305440 : Rat) / 8578069) [(3, 2), (13, 1), (15, 1)]
]

/-- Partial product 362 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0362 : Poly :=
[
  term ((66036610880 : Rat) / 8578069) [(3, 2), (6, 1), (13, 1), (15, 1)],
  term ((-33018305440 : Rat) / 8578069) [(3, 2), (6, 2), (13, 1), (15, 1)],
  term ((-33018305440 : Rat) / 8578069) [(3, 2), (7, 2), (13, 1), (15, 1)],
  term ((-66036610880 : Rat) / 8578069) [(3, 2), (13, 1), (14, 1), (15, 1)],
  term ((33018305440 : Rat) / 8578069) [(3, 2), (13, 1), (14, 2), (15, 1)],
  term ((33018305440 : Rat) / 8578069) [(3, 2), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 362 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0362_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0362
        rs_R013_ueqv_R013YNNN_generator_05_0300_0399 =
      rs_R013_ueqv_R013YNNN_partial_05_0362 := by
  native_decide

/-- Coefficient term 363 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0363 : Poly :=
[
  term ((8342117668 : Rat) / 25734207) [(3, 2), (15, 2)]
]

/-- Partial product 363 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0363 : Poly :=
[
  term ((-16684235336 : Rat) / 25734207) [(3, 2), (6, 1), (15, 2)],
  term ((8342117668 : Rat) / 25734207) [(3, 2), (6, 2), (15, 2)],
  term ((8342117668 : Rat) / 25734207) [(3, 2), (7, 2), (15, 2)],
  term ((16684235336 : Rat) / 25734207) [(3, 2), (14, 1), (15, 2)],
  term ((-8342117668 : Rat) / 25734207) [(3, 2), (14, 2), (15, 2)],
  term ((-8342117668 : Rat) / 25734207) [(3, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 363 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0363_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0363
        rs_R013_ueqv_R013YNNN_generator_05_0300_0399 =
      rs_R013_ueqv_R013YNNN_partial_05_0363 := by
  native_decide

/-- Coefficient term 364 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0364 : Poly :=
[
  term ((119478328000 : Rat) / 150171761) [(3, 3), (11, 1)]
]

/-- Partial product 364 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0364 : Poly :=
[
  term ((-238956656000 : Rat) / 150171761) [(3, 3), (6, 1), (11, 1)],
  term ((119478328000 : Rat) / 150171761) [(3, 3), (6, 2), (11, 1)],
  term ((119478328000 : Rat) / 150171761) [(3, 3), (7, 2), (11, 1)],
  term ((238956656000 : Rat) / 150171761) [(3, 3), (11, 1), (14, 1)],
  term ((-119478328000 : Rat) / 150171761) [(3, 3), (11, 1), (14, 2)],
  term ((-119478328000 : Rat) / 150171761) [(3, 3), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 364 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0364_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0364
        rs_R013_ueqv_R013YNNN_generator_05_0300_0399 =
      rs_R013_ueqv_R013YNNN_partial_05_0364 := by
  native_decide

/-- Coefficient term 365 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0365 : Poly :=
[
  term ((5755291850482551100 : Rat) / 1288183727709509) [(3, 3), (11, 2), (15, 1)]
]

/-- Partial product 365 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0365 : Poly :=
[
  term ((-11510583700965102200 : Rat) / 1288183727709509) [(3, 3), (6, 1), (11, 2), (15, 1)],
  term ((5755291850482551100 : Rat) / 1288183727709509) [(3, 3), (6, 2), (11, 2), (15, 1)],
  term ((5755291850482551100 : Rat) / 1288183727709509) [(3, 3), (7, 2), (11, 2), (15, 1)],
  term ((11510583700965102200 : Rat) / 1288183727709509) [(3, 3), (11, 2), (14, 1), (15, 1)],
  term ((-5755291850482551100 : Rat) / 1288183727709509) [(3, 3), (11, 2), (14, 2), (15, 1)],
  term ((-5755291850482551100 : Rat) / 1288183727709509) [(3, 3), (11, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 365 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0365_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0365
        rs_R013_ueqv_R013YNNN_generator_05_0300_0399 =
      rs_R013_ueqv_R013YNNN_partial_05_0365 := by
  native_decide

/-- Coefficient term 366 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0366 : Poly :=
[
  term ((2540028560 : Rat) / 25734207) [(3, 3), (15, 1)]
]

/-- Partial product 366 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0366 : Poly :=
[
  term ((-5080057120 : Rat) / 25734207) [(3, 3), (6, 1), (15, 1)],
  term ((2540028560 : Rat) / 25734207) [(3, 3), (6, 2), (15, 1)],
  term ((2540028560 : Rat) / 25734207) [(3, 3), (7, 2), (15, 1)],
  term ((5080057120 : Rat) / 25734207) [(3, 3), (14, 1), (15, 1)],
  term ((-2540028560 : Rat) / 25734207) [(3, 3), (14, 2), (15, 1)],
  term ((-2540028560 : Rat) / 25734207) [(3, 3), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 366 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0366_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0366
        rs_R013_ueqv_R013YNNN_generator_05_0300_0399 =
      rs_R013_ueqv_R013YNNN_partial_05_0366 := by
  native_decide

/-- Coefficient term 367 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0367 : Poly :=
[
  term ((44373283200 : Rat) / 150171761) [(4, 1), (5, 1), (11, 1)]
]

/-- Partial product 367 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0367 : Poly :=
[
  term ((-88746566400 : Rat) / 150171761) [(4, 1), (5, 1), (6, 1), (11, 1)],
  term ((44373283200 : Rat) / 150171761) [(4, 1), (5, 1), (6, 2), (11, 1)],
  term ((44373283200 : Rat) / 150171761) [(4, 1), (5, 1), (7, 2), (11, 1)],
  term ((88746566400 : Rat) / 150171761) [(4, 1), (5, 1), (11, 1), (14, 1)],
  term ((-44373283200 : Rat) / 150171761) [(4, 1), (5, 1), (11, 1), (14, 2)],
  term ((-44373283200 : Rat) / 150171761) [(4, 1), (5, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 367 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0367_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0367
        rs_R013_ueqv_R013YNNN_generator_05_0300_0399 =
      rs_R013_ueqv_R013YNNN_partial_05_0367 := by
  native_decide

/-- Coefficient term 368 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0368 : Poly :=
[
  term ((-3074827200 : Rat) / 150171761) [(4, 1), (5, 1), (11, 1), (12, 1)]
]

/-- Partial product 368 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0368 : Poly :=
[
  term ((6149654400 : Rat) / 150171761) [(4, 1), (5, 1), (6, 1), (11, 1), (12, 1)],
  term ((-3074827200 : Rat) / 150171761) [(4, 1), (5, 1), (6, 2), (11, 1), (12, 1)],
  term ((-3074827200 : Rat) / 150171761) [(4, 1), (5, 1), (7, 2), (11, 1), (12, 1)],
  term ((-6149654400 : Rat) / 150171761) [(4, 1), (5, 1), (11, 1), (12, 1), (14, 1)],
  term ((3074827200 : Rat) / 150171761) [(4, 1), (5, 1), (11, 1), (12, 1), (14, 2)],
  term ((3074827200 : Rat) / 150171761) [(4, 1), (5, 1), (11, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 368 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0368_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0368
        rs_R013_ueqv_R013YNNN_generator_05_0300_0399 =
      rs_R013_ueqv_R013YNNN_partial_05_0368 := by
  native_decide

/-- Coefficient term 369 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0369 : Poly :=
[
  term ((1537413600 : Rat) / 150171761) [(4, 1), (5, 1), (11, 1), (14, 1)]
]

/-- Partial product 369 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0369 : Poly :=
[
  term ((-3074827200 : Rat) / 150171761) [(4, 1), (5, 1), (6, 1), (11, 1), (14, 1)],
  term ((1537413600 : Rat) / 150171761) [(4, 1), (5, 1), (6, 2), (11, 1), (14, 1)],
  term ((1537413600 : Rat) / 150171761) [(4, 1), (5, 1), (7, 2), (11, 1), (14, 1)],
  term ((-1537413600 : Rat) / 150171761) [(4, 1), (5, 1), (11, 1), (14, 1), (15, 2)],
  term ((3074827200 : Rat) / 150171761) [(4, 1), (5, 1), (11, 1), (14, 2)],
  term ((-1537413600 : Rat) / 150171761) [(4, 1), (5, 1), (11, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 369 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0369_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0369
        rs_R013_ueqv_R013YNNN_generator_05_0300_0399 =
      rs_R013_ueqv_R013YNNN_partial_05_0369 := by
  native_decide

/-- Coefficient term 370 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0370 : Poly :=
[
  term ((-148114961282368140 : Rat) / 1288183727709509) [(4, 1), (5, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 370 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0370 : Poly :=
[
  term ((296229922564736280 : Rat) / 1288183727709509) [(4, 1), (5, 1), (6, 1), (11, 2), (12, 1), (15, 1)],
  term ((-148114961282368140 : Rat) / 1288183727709509) [(4, 1), (5, 1), (6, 2), (11, 2), (12, 1), (15, 1)],
  term ((-148114961282368140 : Rat) / 1288183727709509) [(4, 1), (5, 1), (7, 2), (11, 2), (12, 1), (15, 1)],
  term ((-296229922564736280 : Rat) / 1288183727709509) [(4, 1), (5, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((148114961282368140 : Rat) / 1288183727709509) [(4, 1), (5, 1), (11, 2), (12, 1), (14, 2), (15, 1)],
  term ((148114961282368140 : Rat) / 1288183727709509) [(4, 1), (5, 1), (11, 2), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 370 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0370_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0370
        rs_R013_ueqv_R013YNNN_generator_05_0300_0399 =
      rs_R013_ueqv_R013YNNN_partial_05_0370 := by
  native_decide

/-- Coefficient term 371 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0371 : Poly :=
[
  term ((74057480641184070 : Rat) / 1288183727709509) [(4, 1), (5, 1), (11, 2), (14, 1), (15, 1)]
]

/-- Partial product 371 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0371 : Poly :=
[
  term ((-148114961282368140 : Rat) / 1288183727709509) [(4, 1), (5, 1), (6, 1), (11, 2), (14, 1), (15, 1)],
  term ((74057480641184070 : Rat) / 1288183727709509) [(4, 1), (5, 1), (6, 2), (11, 2), (14, 1), (15, 1)],
  term ((74057480641184070 : Rat) / 1288183727709509) [(4, 1), (5, 1), (7, 2), (11, 2), (14, 1), (15, 1)],
  term ((-74057480641184070 : Rat) / 1288183727709509) [(4, 1), (5, 1), (11, 2), (14, 1), (15, 3)],
  term ((148114961282368140 : Rat) / 1288183727709509) [(4, 1), (5, 1), (11, 2), (14, 2), (15, 1)],
  term ((-74057480641184070 : Rat) / 1288183727709509) [(4, 1), (5, 1), (11, 2), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 371 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0371_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0371
        rs_R013_ueqv_R013YNNN_generator_05_0300_0399 =
      rs_R013_ueqv_R013YNNN_partial_05_0371 := by
  native_decide

/-- Coefficient term 372 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0372 : Poly :=
[
  term ((2137468773249942840 : Rat) / 1288183727709509) [(4, 1), (5, 1), (11, 2), (15, 1)]
]

/-- Partial product 372 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0372 : Poly :=
[
  term ((-4274937546499885680 : Rat) / 1288183727709509) [(4, 1), (5, 1), (6, 1), (11, 2), (15, 1)],
  term ((2137468773249942840 : Rat) / 1288183727709509) [(4, 1), (5, 1), (6, 2), (11, 2), (15, 1)],
  term ((2137468773249942840 : Rat) / 1288183727709509) [(4, 1), (5, 1), (7, 2), (11, 2), (15, 1)],
  term ((4274937546499885680 : Rat) / 1288183727709509) [(4, 1), (5, 1), (11, 2), (14, 1), (15, 1)],
  term ((-2137468773249942840 : Rat) / 1288183727709509) [(4, 1), (5, 1), (11, 2), (14, 2), (15, 1)],
  term ((-2137468773249942840 : Rat) / 1288183727709509) [(4, 1), (5, 1), (11, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 372 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0372_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0372
        rs_R013_ueqv_R013YNNN_generator_05_0300_0399 =
      rs_R013_ueqv_R013YNNN_partial_05_0372 := by
  native_decide

/-- Coefficient term 373 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0373 : Poly :=
[
  term ((-462816688 : Rat) / 8578069) [(4, 1), (5, 1), (12, 1), (15, 1)]
]

/-- Partial product 373 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0373 : Poly :=
[
  term ((925633376 : Rat) / 8578069) [(4, 1), (5, 1), (6, 1), (12, 1), (15, 1)],
  term ((-462816688 : Rat) / 8578069) [(4, 1), (5, 1), (6, 2), (12, 1), (15, 1)],
  term ((-462816688 : Rat) / 8578069) [(4, 1), (5, 1), (7, 2), (12, 1), (15, 1)],
  term ((-925633376 : Rat) / 8578069) [(4, 1), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((462816688 : Rat) / 8578069) [(4, 1), (5, 1), (12, 1), (14, 2), (15, 1)],
  term ((462816688 : Rat) / 8578069) [(4, 1), (5, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 373 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0373_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0373
        rs_R013_ueqv_R013YNNN_generator_05_0300_0399 =
      rs_R013_ueqv_R013YNNN_partial_05_0373 := by
  native_decide

/-- Coefficient term 374 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0374 : Poly :=
[
  term ((231408344 : Rat) / 8578069) [(4, 1), (5, 1), (14, 1), (15, 1)]
]

/-- Partial product 374 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0374 : Poly :=
[
  term ((-462816688 : Rat) / 8578069) [(4, 1), (5, 1), (6, 1), (14, 1), (15, 1)],
  term ((231408344 : Rat) / 8578069) [(4, 1), (5, 1), (6, 2), (14, 1), (15, 1)],
  term ((231408344 : Rat) / 8578069) [(4, 1), (5, 1), (7, 2), (14, 1), (15, 1)],
  term ((-231408344 : Rat) / 8578069) [(4, 1), (5, 1), (14, 1), (15, 3)],
  term ((462816688 : Rat) / 8578069) [(4, 1), (5, 1), (14, 2), (15, 1)],
  term ((-231408344 : Rat) / 8578069) [(4, 1), (5, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 374 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0374_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0374
        rs_R013_ueqv_R013YNNN_generator_05_0300_0399 =
      rs_R013_ueqv_R013YNNN_partial_05_0374 := by
  native_decide

/-- Coefficient term 375 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0375 : Poly :=
[
  term ((-268335072 : Rat) / 8578069) [(4, 1), (5, 1), (15, 1)]
]

/-- Partial product 375 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0375 : Poly :=
[
  term ((536670144 : Rat) / 8578069) [(4, 1), (5, 1), (6, 1), (15, 1)],
  term ((-268335072 : Rat) / 8578069) [(4, 1), (5, 1), (6, 2), (15, 1)],
  term ((-268335072 : Rat) / 8578069) [(4, 1), (5, 1), (7, 2), (15, 1)],
  term ((-536670144 : Rat) / 8578069) [(4, 1), (5, 1), (14, 1), (15, 1)],
  term ((268335072 : Rat) / 8578069) [(4, 1), (5, 1), (14, 2), (15, 1)],
  term ((268335072 : Rat) / 8578069) [(4, 1), (5, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 375 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0375_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0375
        rs_R013_ueqv_R013YNNN_generator_05_0300_0399 =
      rs_R013_ueqv_R013YNNN_partial_05_0375 := by
  native_decide

/-- Coefficient term 376 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0376 : Poly :=
[
  term ((9504862400 : Rat) / 150171761) [(4, 1), (7, 1), (11, 1)]
]

/-- Partial product 376 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0376 : Poly :=
[
  term ((-19009724800 : Rat) / 150171761) [(4, 1), (6, 1), (7, 1), (11, 1)],
  term ((9504862400 : Rat) / 150171761) [(4, 1), (6, 2), (7, 1), (11, 1)],
  term ((19009724800 : Rat) / 150171761) [(4, 1), (7, 1), (11, 1), (14, 1)],
  term ((-9504862400 : Rat) / 150171761) [(4, 1), (7, 1), (11, 1), (14, 2)],
  term ((-9504862400 : Rat) / 150171761) [(4, 1), (7, 1), (11, 1), (15, 2)],
  term ((9504862400 : Rat) / 150171761) [(4, 1), (7, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 376 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0376_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0376
        rs_R013_ueqv_R013YNNN_generator_05_0300_0399 =
      rs_R013_ueqv_R013YNNN_partial_05_0376 := by
  native_decide

/-- Coefficient term 377 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0377 : Poly :=
[
  term ((-9504862400 : Rat) / 150171761) [(4, 1), (7, 1), (11, 1), (14, 1)]
]

/-- Partial product 377 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0377 : Poly :=
[
  term ((19009724800 : Rat) / 150171761) [(4, 1), (6, 1), (7, 1), (11, 1), (14, 1)],
  term ((-9504862400 : Rat) / 150171761) [(4, 1), (6, 2), (7, 1), (11, 1), (14, 1)],
  term ((9504862400 : Rat) / 150171761) [(4, 1), (7, 1), (11, 1), (14, 1), (15, 2)],
  term ((-19009724800 : Rat) / 150171761) [(4, 1), (7, 1), (11, 1), (14, 2)],
  term ((9504862400 : Rat) / 150171761) [(4, 1), (7, 1), (11, 1), (14, 3)],
  term ((-9504862400 : Rat) / 150171761) [(4, 1), (7, 3), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 377 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0377_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0377
        rs_R013_ueqv_R013YNNN_generator_05_0300_0399 =
      rs_R013_ueqv_R013YNNN_partial_05_0377 := by
  native_decide

/-- Coefficient term 378 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0378 : Poly :=
[
  term ((-457850875772868380 : Rat) / 1288183727709509) [(4, 1), (7, 1), (11, 2), (14, 1), (15, 1)]
]

/-- Partial product 378 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0378 : Poly :=
[
  term ((915701751545736760 : Rat) / 1288183727709509) [(4, 1), (6, 1), (7, 1), (11, 2), (14, 1), (15, 1)],
  term ((-457850875772868380 : Rat) / 1288183727709509) [(4, 1), (6, 2), (7, 1), (11, 2), (14, 1), (15, 1)],
  term ((457850875772868380 : Rat) / 1288183727709509) [(4, 1), (7, 1), (11, 2), (14, 1), (15, 3)],
  term ((-915701751545736760 : Rat) / 1288183727709509) [(4, 1), (7, 1), (11, 2), (14, 2), (15, 1)],
  term ((457850875772868380 : Rat) / 1288183727709509) [(4, 1), (7, 1), (11, 2), (14, 3), (15, 1)],
  term ((-457850875772868380 : Rat) / 1288183727709509) [(4, 1), (7, 3), (11, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 378 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0378_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0378
        rs_R013_ueqv_R013YNNN_generator_05_0300_0399 =
      rs_R013_ueqv_R013YNNN_partial_05_0378 := by
  native_decide

/-- Coefficient term 379 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0379 : Poly :=
[
  term ((457850875772868380 : Rat) / 1288183727709509) [(4, 1), (7, 1), (11, 2), (15, 1)]
]

/-- Partial product 379 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0379 : Poly :=
[
  term ((-915701751545736760 : Rat) / 1288183727709509) [(4, 1), (6, 1), (7, 1), (11, 2), (15, 1)],
  term ((457850875772868380 : Rat) / 1288183727709509) [(4, 1), (6, 2), (7, 1), (11, 2), (15, 1)],
  term ((915701751545736760 : Rat) / 1288183727709509) [(4, 1), (7, 1), (11, 2), (14, 1), (15, 1)],
  term ((-457850875772868380 : Rat) / 1288183727709509) [(4, 1), (7, 1), (11, 2), (14, 2), (15, 1)],
  term ((-457850875772868380 : Rat) / 1288183727709509) [(4, 1), (7, 1), (11, 2), (15, 3)],
  term ((457850875772868380 : Rat) / 1288183727709509) [(4, 1), (7, 3), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 379 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0379_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0379
        rs_R013_ueqv_R013YNNN_generator_05_0300_0399 =
      rs_R013_ueqv_R013YNNN_partial_05_0379 := by
  native_decide

/-- Coefficient term 380 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0380 : Poly :=
[
  term ((-1578022768 : Rat) / 25734207) [(4, 1), (7, 1), (14, 1), (15, 1)]
]

/-- Partial product 380 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0380 : Poly :=
[
  term ((3156045536 : Rat) / 25734207) [(4, 1), (6, 1), (7, 1), (14, 1), (15, 1)],
  term ((-1578022768 : Rat) / 25734207) [(4, 1), (6, 2), (7, 1), (14, 1), (15, 1)],
  term ((1578022768 : Rat) / 25734207) [(4, 1), (7, 1), (14, 1), (15, 3)],
  term ((-3156045536 : Rat) / 25734207) [(4, 1), (7, 1), (14, 2), (15, 1)],
  term ((1578022768 : Rat) / 25734207) [(4, 1), (7, 1), (14, 3), (15, 1)],
  term ((-1578022768 : Rat) / 25734207) [(4, 1), (7, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 380 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0380_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0380
        rs_R013_ueqv_R013YNNN_generator_05_0300_0399 =
      rs_R013_ueqv_R013YNNN_partial_05_0380 := by
  native_decide

/-- Coefficient term 381 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0381 : Poly :=
[
  term ((1578022768 : Rat) / 25734207) [(4, 1), (7, 1), (15, 1)]
]

/-- Partial product 381 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0381 : Poly :=
[
  term ((-3156045536 : Rat) / 25734207) [(4, 1), (6, 1), (7, 1), (15, 1)],
  term ((1578022768 : Rat) / 25734207) [(4, 1), (6, 2), (7, 1), (15, 1)],
  term ((3156045536 : Rat) / 25734207) [(4, 1), (7, 1), (14, 1), (15, 1)],
  term ((-1578022768 : Rat) / 25734207) [(4, 1), (7, 1), (14, 2), (15, 1)],
  term ((-1578022768 : Rat) / 25734207) [(4, 1), (7, 1), (15, 3)],
  term ((1578022768 : Rat) / 25734207) [(4, 1), (7, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 381 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0381_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0381
        rs_R013_ueqv_R013YNNN_generator_05_0300_0399 =
      rs_R013_ueqv_R013YNNN_partial_05_0381 := by
  native_decide

/-- Coefficient term 382 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0382 : Poly :=
[
  term ((-48092330400 : Rat) / 150171761) [(4, 1), (9, 1), (10, 1), (11, 1)]
]

/-- Partial product 382 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0382 : Poly :=
[
  term ((96184660800 : Rat) / 150171761) [(4, 1), (6, 1), (9, 1), (10, 1), (11, 1)],
  term ((-48092330400 : Rat) / 150171761) [(4, 1), (6, 2), (9, 1), (10, 1), (11, 1)],
  term ((-48092330400 : Rat) / 150171761) [(4, 1), (7, 2), (9, 1), (10, 1), (11, 1)],
  term ((-96184660800 : Rat) / 150171761) [(4, 1), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((48092330400 : Rat) / 150171761) [(4, 1), (9, 1), (10, 1), (11, 1), (14, 2)],
  term ((48092330400 : Rat) / 150171761) [(4, 1), (9, 1), (10, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 382 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0382_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0382
        rs_R013_ueqv_R013YNNN_generator_05_0300_0399 =
      rs_R013_ueqv_R013YNNN_partial_05_0382 := by
  native_decide

/-- Coefficient term 383 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0383 : Poly :=
[
  term ((-2316615924034643730 : Rat) / 1288183727709509) [(4, 1), (9, 1), (10, 1), (11, 2), (15, 1)]
]

/-- Partial product 383 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0383 : Poly :=
[
  term ((4633231848069287460 : Rat) / 1288183727709509) [(4, 1), (6, 1), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((-2316615924034643730 : Rat) / 1288183727709509) [(4, 1), (6, 2), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((-2316615924034643730 : Rat) / 1288183727709509) [(4, 1), (7, 2), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((-4633231848069287460 : Rat) / 1288183727709509) [(4, 1), (9, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((2316615924034643730 : Rat) / 1288183727709509) [(4, 1), (9, 1), (10, 1), (11, 2), (14, 2), (15, 1)],
  term ((2316615924034643730 : Rat) / 1288183727709509) [(4, 1), (9, 1), (10, 1), (11, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 383 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0383_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0383
        rs_R013_ueqv_R013YNNN_generator_05_0300_0399 =
      rs_R013_ueqv_R013YNNN_partial_05_0383 := by
  native_decide

/-- Coefficient term 384 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0384 : Poly :=
[
  term ((-1248808296 : Rat) / 8578069) [(4, 1), (9, 1), (10, 1), (15, 1)]
]

/-- Partial product 384 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0384 : Poly :=
[
  term ((2497616592 : Rat) / 8578069) [(4, 1), (6, 1), (9, 1), (10, 1), (15, 1)],
  term ((-1248808296 : Rat) / 8578069) [(4, 1), (6, 2), (9, 1), (10, 1), (15, 1)],
  term ((-1248808296 : Rat) / 8578069) [(4, 1), (7, 2), (9, 1), (10, 1), (15, 1)],
  term ((-2497616592 : Rat) / 8578069) [(4, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((1248808296 : Rat) / 8578069) [(4, 1), (9, 1), (10, 1), (14, 2), (15, 1)],
  term ((1248808296 : Rat) / 8578069) [(4, 1), (9, 1), (10, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 384 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0384_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0384
        rs_R013_ueqv_R013YNNN_generator_05_0300_0399 =
      rs_R013_ueqv_R013YNNN_partial_05_0384 := by
  native_decide

/-- Coefficient term 385 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0385 : Poly :=
[
  term ((-365893084139274548 : Rat) / 1288183727709509) [(4, 1), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 385 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0385 : Poly :=
[
  term ((731786168278549096 : Rat) / 1288183727709509) [(4, 1), (6, 1), (10, 1), (11, 1), (15, 1)],
  term ((-365893084139274548 : Rat) / 1288183727709509) [(4, 1), (6, 2), (10, 1), (11, 1), (15, 1)],
  term ((-365893084139274548 : Rat) / 1288183727709509) [(4, 1), (7, 2), (10, 1), (11, 1), (15, 1)],
  term ((-731786168278549096 : Rat) / 1288183727709509) [(4, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((365893084139274548 : Rat) / 1288183727709509) [(4, 1), (10, 1), (11, 1), (14, 2), (15, 1)],
  term ((365893084139274548 : Rat) / 1288183727709509) [(4, 1), (10, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 385 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0385_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0385
        rs_R013_ueqv_R013YNNN_generator_05_0300_0399 =
      rs_R013_ueqv_R013YNNN_partial_05_0385 := by
  native_decide

/-- Coefficient term 386 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0386 : Poly :=
[
  term ((73350826800 : Rat) / 150171761) [(4, 1), (10, 1), (11, 2)]
]

/-- Partial product 386 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0386 : Poly :=
[
  term ((-146701653600 : Rat) / 150171761) [(4, 1), (6, 1), (10, 1), (11, 2)],
  term ((73350826800 : Rat) / 150171761) [(4, 1), (6, 2), (10, 1), (11, 2)],
  term ((73350826800 : Rat) / 150171761) [(4, 1), (7, 2), (10, 1), (11, 2)],
  term ((146701653600 : Rat) / 150171761) [(4, 1), (10, 1), (11, 2), (14, 1)],
  term ((-73350826800 : Rat) / 150171761) [(4, 1), (10, 1), (11, 2), (14, 2)],
  term ((-73350826800 : Rat) / 150171761) [(4, 1), (10, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 386 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0386_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0386
        rs_R013_ueqv_R013YNNN_generator_05_0300_0399 =
      rs_R013_ueqv_R013YNNN_partial_05_0386 := by
  native_decide

/-- Coefficient term 387 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0387 : Poly :=
[
  term ((-2401645741788882285 : Rat) / 1288183727709509) [(4, 1), (10, 1), (11, 2), (15, 2)]
]

/-- Partial product 387 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0387 : Poly :=
[
  term ((4803291483577764570 : Rat) / 1288183727709509) [(4, 1), (6, 1), (10, 1), (11, 2), (15, 2)],
  term ((-2401645741788882285 : Rat) / 1288183727709509) [(4, 1), (6, 2), (10, 1), (11, 2), (15, 2)],
  term ((-2401645741788882285 : Rat) / 1288183727709509) [(4, 1), (7, 2), (10, 1), (11, 2), (15, 2)],
  term ((-4803291483577764570 : Rat) / 1288183727709509) [(4, 1), (10, 1), (11, 2), (14, 1), (15, 2)],
  term ((2401645741788882285 : Rat) / 1288183727709509) [(4, 1), (10, 1), (11, 2), (14, 2), (15, 2)],
  term ((2401645741788882285 : Rat) / 1288183727709509) [(4, 1), (10, 1), (11, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 387 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0387_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0387
        rs_R013_ueqv_R013YNNN_generator_05_0300_0399 =
      rs_R013_ueqv_R013YNNN_partial_05_0387 := by
  native_decide

/-- Coefficient term 388 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0388 : Poly :=
[
  term ((3533322090916748535 : Rat) / 1288183727709509) [(4, 1), (10, 1), (11, 3), (15, 1)]
]

/-- Partial product 388 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0388 : Poly :=
[
  term ((-7066644181833497070 : Rat) / 1288183727709509) [(4, 1), (6, 1), (10, 1), (11, 3), (15, 1)],
  term ((3533322090916748535 : Rat) / 1288183727709509) [(4, 1), (6, 2), (10, 1), (11, 3), (15, 1)],
  term ((3533322090916748535 : Rat) / 1288183727709509) [(4, 1), (7, 2), (10, 1), (11, 3), (15, 1)],
  term ((7066644181833497070 : Rat) / 1288183727709509) [(4, 1), (10, 1), (11, 3), (14, 1), (15, 1)],
  term ((-3533322090916748535 : Rat) / 1288183727709509) [(4, 1), (10, 1), (11, 3), (14, 2), (15, 1)],
  term ((-3533322090916748535 : Rat) / 1288183727709509) [(4, 1), (10, 1), (11, 3), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 388 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0388_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0388
        rs_R013_ueqv_R013YNNN_generator_05_0300_0399 =
      rs_R013_ueqv_R013YNNN_partial_05_0388 := by
  native_decide

/-- Coefficient term 389 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0389 : Poly :=
[
  term ((1449418188 : Rat) / 8578069) [(4, 1), (10, 1), (15, 2)]
]

/-- Partial product 389 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0389 : Poly :=
[
  term ((-2898836376 : Rat) / 8578069) [(4, 1), (6, 1), (10, 1), (15, 2)],
  term ((1449418188 : Rat) / 8578069) [(4, 1), (6, 2), (10, 1), (15, 2)],
  term ((1449418188 : Rat) / 8578069) [(4, 1), (7, 2), (10, 1), (15, 2)],
  term ((2898836376 : Rat) / 8578069) [(4, 1), (10, 1), (14, 1), (15, 2)],
  term ((-1449418188 : Rat) / 8578069) [(4, 1), (10, 1), (14, 2), (15, 2)],
  term ((-1449418188 : Rat) / 8578069) [(4, 1), (10, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 389 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0389_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0389
        rs_R013_ueqv_R013YNNN_generator_05_0300_0399 =
      rs_R013_ueqv_R013YNNN_partial_05_0389 := by
  native_decide

/-- Coefficient term 390 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0390 : Poly :=
[
  term ((-1796587200 : Rat) / 8833633) [(4, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 390 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0390 : Poly :=
[
  term ((3593174400 : Rat) / 8833633) [(4, 1), (6, 1), (11, 1), (12, 1), (13, 1)],
  term ((-1796587200 : Rat) / 8833633) [(4, 1), (6, 2), (11, 1), (12, 1), (13, 1)],
  term ((-1796587200 : Rat) / 8833633) [(4, 1), (7, 2), (11, 1), (12, 1), (13, 1)],
  term ((-3593174400 : Rat) / 8833633) [(4, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((1796587200 : Rat) / 8833633) [(4, 1), (11, 1), (12, 1), (13, 1), (14, 2)],
  term ((1796587200 : Rat) / 8833633) [(4, 1), (11, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 390 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0390_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0390
        rs_R013_ueqv_R013YNNN_generator_05_0300_0399 =
      rs_R013_ueqv_R013YNNN_partial_05_0390 := by
  native_decide

/-- Coefficient term 391 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0391 : Poly :=
[
  term ((61762096800 : Rat) / 150171761) [(4, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 391 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0391 : Poly :=
[
  term ((-123524193600 : Rat) / 150171761) [(4, 1), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((61762096800 : Rat) / 150171761) [(4, 1), (6, 2), (11, 1), (12, 1), (15, 1)],
  term ((61762096800 : Rat) / 150171761) [(4, 1), (7, 2), (11, 1), (12, 1), (15, 1)],
  term ((123524193600 : Rat) / 150171761) [(4, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-61762096800 : Rat) / 150171761) [(4, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-61762096800 : Rat) / 150171761) [(4, 1), (11, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 391 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0391_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0391
        rs_R013_ueqv_R013YNNN_generator_05_0300_0399 =
      rs_R013_ueqv_R013YNNN_partial_05_0391 := by
  native_decide

/-- Coefficient term 392 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0392 : Poly :=
[
  term ((-91919758600 : Rat) / 150171761) [(4, 1), (11, 1), (13, 1)]
]

/-- Partial product 392 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0392 : Poly :=
[
  term ((183839517200 : Rat) / 150171761) [(4, 1), (6, 1), (11, 1), (13, 1)],
  term ((-91919758600 : Rat) / 150171761) [(4, 1), (6, 2), (11, 1), (13, 1)],
  term ((-91919758600 : Rat) / 150171761) [(4, 1), (7, 2), (11, 1), (13, 1)],
  term ((-183839517200 : Rat) / 150171761) [(4, 1), (11, 1), (13, 1), (14, 1)],
  term ((91919758600 : Rat) / 150171761) [(4, 1), (11, 1), (13, 1), (14, 2)],
  term ((91919758600 : Rat) / 150171761) [(4, 1), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 392 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0392_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0392
        rs_R013_ueqv_R013YNNN_generator_05_0300_0399 =
      rs_R013_ueqv_R013YNNN_partial_05_0392 := by
  native_decide

/-- Coefficient term 393 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0393 : Poly :=
[
  term ((-10891776600 : Rat) / 150171761) [(4, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 393 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0393 : Poly :=
[
  term ((21783553200 : Rat) / 150171761) [(4, 1), (6, 1), (11, 1), (13, 1), (14, 1)],
  term ((-10891776600 : Rat) / 150171761) [(4, 1), (6, 2), (11, 1), (13, 1), (14, 1)],
  term ((-10891776600 : Rat) / 150171761) [(4, 1), (7, 2), (11, 1), (13, 1), (14, 1)],
  term ((10891776600 : Rat) / 150171761) [(4, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-21783553200 : Rat) / 150171761) [(4, 1), (11, 1), (13, 1), (14, 2)],
  term ((10891776600 : Rat) / 150171761) [(4, 1), (11, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 393 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0393_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0393
        rs_R013_ueqv_R013YNNN_generator_05_0300_0399 =
      rs_R013_ueqv_R013YNNN_partial_05_0393 := by
  native_decide

/-- Coefficient term 394 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0394 : Poly :=
[
  term ((-17472879112412534 : Rat) / 1288183727709509) [(4, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 394 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0394 : Poly :=
[
  term ((34945758224825068 : Rat) / 1288183727709509) [(4, 1), (6, 1), (11, 1), (14, 1), (15, 1)],
  term ((-17472879112412534 : Rat) / 1288183727709509) [(4, 1), (6, 2), (11, 1), (14, 1), (15, 1)],
  term ((-17472879112412534 : Rat) / 1288183727709509) [(4, 1), (7, 2), (11, 1), (14, 1), (15, 1)],
  term ((17472879112412534 : Rat) / 1288183727709509) [(4, 1), (11, 1), (14, 1), (15, 3)],
  term ((-34945758224825068 : Rat) / 1288183727709509) [(4, 1), (11, 1), (14, 2), (15, 1)],
  term ((17472879112412534 : Rat) / 1288183727709509) [(4, 1), (11, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 394 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0394_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0394
        rs_R013_ueqv_R013YNNN_generator_05_0300_0399 =
      rs_R013_ueqv_R013YNNN_partial_05_0394 := by
  native_decide

/-- Coefficient term 395 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0395 : Poly :=
[
  term ((42798625292932862 : Rat) / 1288183727709509) [(4, 1), (11, 1), (15, 1)]
]

/-- Partial product 395 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0395 : Poly :=
[
  term ((-85597250585865724 : Rat) / 1288183727709509) [(4, 1), (6, 1), (11, 1), (15, 1)],
  term ((42798625292932862 : Rat) / 1288183727709509) [(4, 1), (6, 2), (11, 1), (15, 1)],
  term ((42798625292932862 : Rat) / 1288183727709509) [(4, 1), (7, 2), (11, 1), (15, 1)],
  term ((85597250585865724 : Rat) / 1288183727709509) [(4, 1), (11, 1), (14, 1), (15, 1)],
  term ((-42798625292932862 : Rat) / 1288183727709509) [(4, 1), (11, 1), (14, 2), (15, 1)],
  term ((-42798625292932862 : Rat) / 1288183727709509) [(4, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 395 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0395_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0395
        rs_R013_ueqv_R013YNNN_generator_05_0300_0399 =
      rs_R013_ueqv_R013YNNN_partial_05_0395 := by
  native_decide

/-- Coefficient term 396 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0396 : Poly :=
[
  term ((111825631800 : Rat) / 150171761) [(4, 1), (11, 2)]
]

/-- Partial product 396 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0396 : Poly :=
[
  term ((-223651263600 : Rat) / 150171761) [(4, 1), (6, 1), (11, 2)],
  term ((111825631800 : Rat) / 150171761) [(4, 1), (6, 2), (11, 2)],
  term ((111825631800 : Rat) / 150171761) [(4, 1), (7, 2), (11, 2)],
  term ((223651263600 : Rat) / 150171761) [(4, 1), (11, 2), (14, 1)],
  term ((-111825631800 : Rat) / 150171761) [(4, 1), (11, 2), (14, 2)],
  term ((-111825631800 : Rat) / 150171761) [(4, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 396 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0396_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0396
        rs_R013_ueqv_R013YNNN_generator_05_0300_0399 =
      rs_R013_ueqv_R013YNNN_partial_05_0396 := by
  native_decide

/-- Coefficient term 397 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0397 : Poly :=
[
  term ((-86541918052630140 : Rat) / 75775513394677) [(4, 1), (11, 2), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 397 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0397 : Poly :=
[
  term ((173083836105260280 : Rat) / 75775513394677) [(4, 1), (6, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-86541918052630140 : Rat) / 75775513394677) [(4, 1), (6, 2), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-86541918052630140 : Rat) / 75775513394677) [(4, 1), (7, 2), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-173083836105260280 : Rat) / 75775513394677) [(4, 1), (11, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((86541918052630140 : Rat) / 75775513394677) [(4, 1), (11, 2), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((86541918052630140 : Rat) / 75775513394677) [(4, 1), (11, 2), (12, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 397 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0397_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0397
        rs_R013_ueqv_R013YNNN_generator_05_0300_0399 =
      rs_R013_ueqv_R013YNNN_partial_05_0397 := by
  native_decide

/-- Coefficient term 398 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0398 : Poly :=
[
  term ((346825252890 : Rat) / 150171761) [(4, 1), (11, 2), (12, 1), (15, 2)]
]

/-- Partial product 398 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0398 : Poly :=
[
  term ((-693650505780 : Rat) / 150171761) [(4, 1), (6, 1), (11, 2), (12, 1), (15, 2)],
  term ((346825252890 : Rat) / 150171761) [(4, 1), (6, 2), (11, 2), (12, 1), (15, 2)],
  term ((346825252890 : Rat) / 150171761) [(4, 1), (7, 2), (11, 2), (12, 1), (15, 2)],
  term ((693650505780 : Rat) / 150171761) [(4, 1), (11, 2), (12, 1), (14, 1), (15, 2)],
  term ((-346825252890 : Rat) / 150171761) [(4, 1), (11, 2), (12, 1), (14, 2), (15, 2)],
  term ((-346825252890 : Rat) / 150171761) [(4, 1), (11, 2), (12, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 398 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0398_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0398
        rs_R013_ueqv_R013YNNN_generator_05_0300_0399 =
      rs_R013_ueqv_R013YNNN_partial_05_0398 := by
  native_decide

/-- Coefficient term 399 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013YNNN_coefficient_05_0399 : Poly :=
[
  term ((-1049317548254551215 : Rat) / 2576367455419018) [(4, 1), (11, 2), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 399 for generator 5. -/
def rs_R013_ueqv_R013YNNN_partial_05_0399 : Poly :=
[
  term ((1049317548254551215 : Rat) / 1288183727709509) [(4, 1), (6, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-1049317548254551215 : Rat) / 2576367455419018) [(4, 1), (6, 2), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-1049317548254551215 : Rat) / 2576367455419018) [(4, 1), (7, 2), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((1049317548254551215 : Rat) / 2576367455419018) [(4, 1), (11, 2), (13, 1), (14, 1), (15, 3)],
  term ((-1049317548254551215 : Rat) / 1288183727709509) [(4, 1), (11, 2), (13, 1), (14, 2), (15, 1)],
  term ((1049317548254551215 : Rat) / 2576367455419018) [(4, 1), (11, 2), (13, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 399 for generator 5. -/
theorem rs_R013_ueqv_R013YNNN_partial_05_0399_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_05_0399
        rs_R013_ueqv_R013YNNN_generator_05_0300_0399 =
      rs_R013_ueqv_R013YNNN_partial_05_0399 := by
  native_decide

/-- Partial products in this block. -/
def rs_R013_ueqv_R013YNNN_partials_05_0300_0399 : List Poly :=
[
  rs_R013_ueqv_R013YNNN_partial_05_0300,
  rs_R013_ueqv_R013YNNN_partial_05_0301,
  rs_R013_ueqv_R013YNNN_partial_05_0302,
  rs_R013_ueqv_R013YNNN_partial_05_0303,
  rs_R013_ueqv_R013YNNN_partial_05_0304,
  rs_R013_ueqv_R013YNNN_partial_05_0305,
  rs_R013_ueqv_R013YNNN_partial_05_0306,
  rs_R013_ueqv_R013YNNN_partial_05_0307,
  rs_R013_ueqv_R013YNNN_partial_05_0308,
  rs_R013_ueqv_R013YNNN_partial_05_0309,
  rs_R013_ueqv_R013YNNN_partial_05_0310,
  rs_R013_ueqv_R013YNNN_partial_05_0311,
  rs_R013_ueqv_R013YNNN_partial_05_0312,
  rs_R013_ueqv_R013YNNN_partial_05_0313,
  rs_R013_ueqv_R013YNNN_partial_05_0314,
  rs_R013_ueqv_R013YNNN_partial_05_0315,
  rs_R013_ueqv_R013YNNN_partial_05_0316,
  rs_R013_ueqv_R013YNNN_partial_05_0317,
  rs_R013_ueqv_R013YNNN_partial_05_0318,
  rs_R013_ueqv_R013YNNN_partial_05_0319,
  rs_R013_ueqv_R013YNNN_partial_05_0320,
  rs_R013_ueqv_R013YNNN_partial_05_0321,
  rs_R013_ueqv_R013YNNN_partial_05_0322,
  rs_R013_ueqv_R013YNNN_partial_05_0323,
  rs_R013_ueqv_R013YNNN_partial_05_0324,
  rs_R013_ueqv_R013YNNN_partial_05_0325,
  rs_R013_ueqv_R013YNNN_partial_05_0326,
  rs_R013_ueqv_R013YNNN_partial_05_0327,
  rs_R013_ueqv_R013YNNN_partial_05_0328,
  rs_R013_ueqv_R013YNNN_partial_05_0329,
  rs_R013_ueqv_R013YNNN_partial_05_0330,
  rs_R013_ueqv_R013YNNN_partial_05_0331,
  rs_R013_ueqv_R013YNNN_partial_05_0332,
  rs_R013_ueqv_R013YNNN_partial_05_0333,
  rs_R013_ueqv_R013YNNN_partial_05_0334,
  rs_R013_ueqv_R013YNNN_partial_05_0335,
  rs_R013_ueqv_R013YNNN_partial_05_0336,
  rs_R013_ueqv_R013YNNN_partial_05_0337,
  rs_R013_ueqv_R013YNNN_partial_05_0338,
  rs_R013_ueqv_R013YNNN_partial_05_0339,
  rs_R013_ueqv_R013YNNN_partial_05_0340,
  rs_R013_ueqv_R013YNNN_partial_05_0341,
  rs_R013_ueqv_R013YNNN_partial_05_0342,
  rs_R013_ueqv_R013YNNN_partial_05_0343,
  rs_R013_ueqv_R013YNNN_partial_05_0344,
  rs_R013_ueqv_R013YNNN_partial_05_0345,
  rs_R013_ueqv_R013YNNN_partial_05_0346,
  rs_R013_ueqv_R013YNNN_partial_05_0347,
  rs_R013_ueqv_R013YNNN_partial_05_0348,
  rs_R013_ueqv_R013YNNN_partial_05_0349,
  rs_R013_ueqv_R013YNNN_partial_05_0350,
  rs_R013_ueqv_R013YNNN_partial_05_0351,
  rs_R013_ueqv_R013YNNN_partial_05_0352,
  rs_R013_ueqv_R013YNNN_partial_05_0353,
  rs_R013_ueqv_R013YNNN_partial_05_0354,
  rs_R013_ueqv_R013YNNN_partial_05_0355,
  rs_R013_ueqv_R013YNNN_partial_05_0356,
  rs_R013_ueqv_R013YNNN_partial_05_0357,
  rs_R013_ueqv_R013YNNN_partial_05_0358,
  rs_R013_ueqv_R013YNNN_partial_05_0359,
  rs_R013_ueqv_R013YNNN_partial_05_0360,
  rs_R013_ueqv_R013YNNN_partial_05_0361,
  rs_R013_ueqv_R013YNNN_partial_05_0362,
  rs_R013_ueqv_R013YNNN_partial_05_0363,
  rs_R013_ueqv_R013YNNN_partial_05_0364,
  rs_R013_ueqv_R013YNNN_partial_05_0365,
  rs_R013_ueqv_R013YNNN_partial_05_0366,
  rs_R013_ueqv_R013YNNN_partial_05_0367,
  rs_R013_ueqv_R013YNNN_partial_05_0368,
  rs_R013_ueqv_R013YNNN_partial_05_0369,
  rs_R013_ueqv_R013YNNN_partial_05_0370,
  rs_R013_ueqv_R013YNNN_partial_05_0371,
  rs_R013_ueqv_R013YNNN_partial_05_0372,
  rs_R013_ueqv_R013YNNN_partial_05_0373,
  rs_R013_ueqv_R013YNNN_partial_05_0374,
  rs_R013_ueqv_R013YNNN_partial_05_0375,
  rs_R013_ueqv_R013YNNN_partial_05_0376,
  rs_R013_ueqv_R013YNNN_partial_05_0377,
  rs_R013_ueqv_R013YNNN_partial_05_0378,
  rs_R013_ueqv_R013YNNN_partial_05_0379,
  rs_R013_ueqv_R013YNNN_partial_05_0380,
  rs_R013_ueqv_R013YNNN_partial_05_0381,
  rs_R013_ueqv_R013YNNN_partial_05_0382,
  rs_R013_ueqv_R013YNNN_partial_05_0383,
  rs_R013_ueqv_R013YNNN_partial_05_0384,
  rs_R013_ueqv_R013YNNN_partial_05_0385,
  rs_R013_ueqv_R013YNNN_partial_05_0386,
  rs_R013_ueqv_R013YNNN_partial_05_0387,
  rs_R013_ueqv_R013YNNN_partial_05_0388,
  rs_R013_ueqv_R013YNNN_partial_05_0389,
  rs_R013_ueqv_R013YNNN_partial_05_0390,
  rs_R013_ueqv_R013YNNN_partial_05_0391,
  rs_R013_ueqv_R013YNNN_partial_05_0392,
  rs_R013_ueqv_R013YNNN_partial_05_0393,
  rs_R013_ueqv_R013YNNN_partial_05_0394,
  rs_R013_ueqv_R013YNNN_partial_05_0395,
  rs_R013_ueqv_R013YNNN_partial_05_0396,
  rs_R013_ueqv_R013YNNN_partial_05_0397,
  rs_R013_ueqv_R013YNNN_partial_05_0398,
  rs_R013_ueqv_R013YNNN_partial_05_0399
]

/-- Sum of partial products in this block. -/
def rs_R013_ueqv_R013YNNN_block_05_0300_0399 : Poly :=
[
  term ((-5080057120 : Rat) / 25734207) [(2, 2), (3, 1), (6, 1), (15, 1)],
  term ((2540028560 : Rat) / 25734207) [(2, 2), (3, 1), (6, 2), (15, 1)],
  term ((2540028560 : Rat) / 25734207) [(2, 2), (3, 1), (7, 2), (15, 1)],
  term ((5080057120 : Rat) / 25734207) [(2, 2), (3, 1), (14, 1), (15, 1)],
  term ((-2540028560 : Rat) / 25734207) [(2, 2), (3, 1), (14, 2), (15, 1)],
  term ((-2540028560 : Rat) / 25734207) [(2, 2), (3, 1), (15, 3)],
  term ((259726922400 : Rat) / 150171761) [(3, 1), (4, 1), (6, 1), (11, 1)],
  term ((26801503200 : Rat) / 150171761) [(3, 1), (4, 1), (6, 1), (11, 1), (14, 1)],
  term ((1291033072940575590 : Rat) / 1288183727709509) [(3, 1), (4, 1), (6, 1), (11, 2), (14, 1), (15, 1)],
  term ((12511091047739084130 : Rat) / 1288183727709509) [(3, 1), (4, 1), (6, 1), (11, 2), (15, 1)],
  term ((-7234700392 : Rat) / 8578069) [(3, 1), (4, 1), (6, 1), (14, 1), (15, 1)],
  term ((-155892984 : Rat) / 8578069) [(3, 1), (4, 1), (6, 1), (15, 1)],
  term ((-129863461200 : Rat) / 150171761) [(3, 1), (4, 1), (6, 2), (11, 1)],
  term ((-13400751600 : Rat) / 150171761) [(3, 1), (4, 1), (6, 2), (11, 1), (14, 1)],
  term ((-645516536470287795 : Rat) / 1288183727709509) [(3, 1), (4, 1), (6, 2), (11, 2), (14, 1), (15, 1)],
  term ((-6255545523869542065 : Rat) / 1288183727709509) [(3, 1), (4, 1), (6, 2), (11, 2), (15, 1)],
  term ((3617350196 : Rat) / 8578069) [(3, 1), (4, 1), (6, 2), (14, 1), (15, 1)],
  term ((77946492 : Rat) / 8578069) [(3, 1), (4, 1), (6, 2), (15, 1)],
  term ((-129863461200 : Rat) / 150171761) [(3, 1), (4, 1), (7, 2), (11, 1)],
  term ((-13400751600 : Rat) / 150171761) [(3, 1), (4, 1), (7, 2), (11, 1), (14, 1)],
  term ((-645516536470287795 : Rat) / 1288183727709509) [(3, 1), (4, 1), (7, 2), (11, 2), (14, 1), (15, 1)],
  term ((-6255545523869542065 : Rat) / 1288183727709509) [(3, 1), (4, 1), (7, 2), (11, 2), (15, 1)],
  term ((3617350196 : Rat) / 8578069) [(3, 1), (4, 1), (7, 2), (14, 1), (15, 1)],
  term ((77946492 : Rat) / 8578069) [(3, 1), (4, 1), (7, 2), (15, 1)],
  term ((-259726922400 : Rat) / 150171761) [(3, 1), (4, 1), (11, 1), (14, 1)],
  term ((13400751600 : Rat) / 150171761) [(3, 1), (4, 1), (11, 1), (14, 1), (15, 2)],
  term ((103061958000 : Rat) / 150171761) [(3, 1), (4, 1), (11, 1), (14, 2)],
  term ((13400751600 : Rat) / 150171761) [(3, 1), (4, 1), (11, 1), (14, 3)],
  term ((129863461200 : Rat) / 150171761) [(3, 1), (4, 1), (11, 1), (15, 2)],
  term ((-12511091047739084130 : Rat) / 1288183727709509) [(3, 1), (4, 1), (11, 2), (14, 1), (15, 1)],
  term ((645516536470287795 : Rat) / 1288183727709509) [(3, 1), (4, 1), (11, 2), (14, 1), (15, 3)],
  term ((4964512450928966475 : Rat) / 1288183727709509) [(3, 1), (4, 1), (11, 2), (14, 2), (15, 1)],
  term ((645516536470287795 : Rat) / 1288183727709509) [(3, 1), (4, 1), (11, 2), (14, 3), (15, 1)],
  term ((6255545523869542065 : Rat) / 1288183727709509) [(3, 1), (4, 1), (11, 2), (15, 3)],
  term ((155892984 : Rat) / 8578069) [(3, 1), (4, 1), (14, 1), (15, 1)],
  term ((-3617350196 : Rat) / 8578069) [(3, 1), (4, 1), (14, 1), (15, 3)],
  term ((7156753900 : Rat) / 8578069) [(3, 1), (4, 1), (14, 2), (15, 1)],
  term ((-3617350196 : Rat) / 8578069) [(3, 1), (4, 1), (14, 3), (15, 1)],
  term ((-77946492 : Rat) / 8578069) [(3, 1), (4, 1), (15, 3)],
  term ((46363506400 : Rat) / 150171761) [(3, 1), (5, 1), (6, 1), (11, 1), (13, 1)],
  term ((234533071200 : Rat) / 150171761) [(3, 1), (5, 1), (6, 1), (11, 1), (15, 1)],
  term ((2233338171117657430 : Rat) / 1288183727709509) [(3, 1), (5, 1), (6, 1), (11, 2), (13, 1), (15, 1)],
  term ((191483031379492410 : Rat) / 21833622503551) [(3, 1), (5, 1), (6, 1), (11, 2), (15, 2)],
  term ((-55170525112 : Rat) / 25734207) [(3, 1), (5, 1), (6, 1), (13, 1), (15, 1)],
  term ((-77786648 : Rat) / 145391) [(3, 1), (5, 1), (6, 1), (15, 2)],
  term ((-23181753200 : Rat) / 150171761) [(3, 1), (5, 1), (6, 2), (11, 1), (13, 1)],
  term ((-117266535600 : Rat) / 150171761) [(3, 1), (5, 1), (6, 2), (11, 1), (15, 1)],
  term ((-1116669085558828715 : Rat) / 1288183727709509) [(3, 1), (5, 1), (6, 2), (11, 2), (13, 1), (15, 1)],
  term ((-95741515689746205 : Rat) / 21833622503551) [(3, 1), (5, 1), (6, 2), (11, 2), (15, 2)],
  term ((27585262556 : Rat) / 25734207) [(3, 1), (5, 1), (6, 2), (13, 1), (15, 1)],
  term ((38893324 : Rat) / 145391) [(3, 1), (5, 1), (6, 2), (15, 2)],
  term ((-23181753200 : Rat) / 150171761) [(3, 1), (5, 1), (7, 2), (11, 1), (13, 1)],
  term ((-117266535600 : Rat) / 150171761) [(3, 1), (5, 1), (7, 2), (11, 1), (15, 1)],
  term ((-1116669085558828715 : Rat) / 1288183727709509) [(3, 1), (5, 1), (7, 2), (11, 2), (13, 1), (15, 1)],
  term ((-95741515689746205 : Rat) / 21833622503551) [(3, 1), (5, 1), (7, 2), (11, 2), (15, 2)],
  term ((27585262556 : Rat) / 25734207) [(3, 1), (5, 1), (7, 2), (13, 1), (15, 1)],
  term ((38893324 : Rat) / 145391) [(3, 1), (5, 1), (7, 2), (15, 2)],
  term ((-46363506400 : Rat) / 150171761) [(3, 1), (5, 1), (11, 1), (13, 1), (14, 1)],
  term ((23181753200 : Rat) / 150171761) [(3, 1), (5, 1), (11, 1), (13, 1), (14, 2)],
  term ((23181753200 : Rat) / 150171761) [(3, 1), (5, 1), (11, 1), (13, 1), (15, 2)],
  term ((-234533071200 : Rat) / 150171761) [(3, 1), (5, 1), (11, 1), (14, 1), (15, 1)],
  term ((117266535600 : Rat) / 150171761) [(3, 1), (5, 1), (11, 1), (14, 2), (15, 1)],
  term ((117266535600 : Rat) / 150171761) [(3, 1), (5, 1), (11, 1), (15, 3)],
  term ((-2233338171117657430 : Rat) / 1288183727709509) [(3, 1), (5, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((1116669085558828715 : Rat) / 1288183727709509) [(3, 1), (5, 1), (11, 2), (13, 1), (14, 2), (15, 1)],
  term ((1116669085558828715 : Rat) / 1288183727709509) [(3, 1), (5, 1), (11, 2), (13, 1), (15, 3)],
  term ((-191483031379492410 : Rat) / 21833622503551) [(3, 1), (5, 1), (11, 2), (14, 1), (15, 2)],
  term ((95741515689746205 : Rat) / 21833622503551) [(3, 1), (5, 1), (11, 2), (14, 2), (15, 2)],
  term ((95741515689746205 : Rat) / 21833622503551) [(3, 1), (5, 1), (11, 2), (15, 4)],
  term ((55170525112 : Rat) / 25734207) [(3, 1), (5, 1), (13, 1), (14, 1), (15, 1)],
  term ((-27585262556 : Rat) / 25734207) [(3, 1), (5, 1), (13, 1), (14, 2), (15, 1)],
  term ((-27585262556 : Rat) / 25734207) [(3, 1), (5, 1), (13, 1), (15, 3)],
  term ((77786648 : Rat) / 145391) [(3, 1), (5, 1), (14, 1), (15, 2)],
  term ((-38893324 : Rat) / 145391) [(3, 1), (5, 1), (14, 2), (15, 2)],
  term ((-38893324 : Rat) / 145391) [(3, 1), (5, 1), (15, 4)],
  term ((-9312118800 : Rat) / 150171761) [(3, 1), (6, 1), (7, 1), (11, 1), (13, 1)],
  term ((-31339635200 : Rat) / 150171761) [(3, 1), (6, 1), (7, 1), (11, 1), (15, 1)],
  term ((-448566383021072685 : Rat) / 1288183727709509) [(3, 1), (6, 1), (7, 1), (11, 2), (13, 1), (15, 1)],
  term ((-1509635681072270240 : Rat) / 1288183727709509) [(3, 1), (6, 1), (7, 1), (11, 2), (15, 2)],
  term ((-874182772 : Rat) / 8578069) [(3, 1), (6, 1), (7, 1), (13, 1), (15, 1)],
  term ((25617178496 : Rat) / 25734207) [(3, 1), (6, 1), (7, 1), (15, 2)],
  term ((27092083200 : Rat) / 150171761) [(3, 1), (6, 1), (10, 1), (11, 1)],
  term ((27092083200 : Rat) / 150171761) [(3, 1), (6, 1), (10, 1), (11, 1), (14, 1)],
  term ((1305030362105127840 : Rat) / 1288183727709509) [(3, 1), (6, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((1305030362105127840 : Rat) / 1288183727709509) [(3, 1), (6, 1), (10, 1), (11, 2), (15, 1)],
  term ((-1721558592 : Rat) / 8578069) [(3, 1), (6, 1), (10, 1), (14, 1), (15, 1)],
  term ((-1721558592 : Rat) / 8578069) [(3, 1), (6, 1), (10, 1), (15, 1)],
  term ((-184491143700 : Rat) / 150171761) [(3, 1), (6, 1), (11, 1)],
  term ((12054295800 : Rat) / 150171761) [(3, 1), (6, 1), (11, 1), (12, 1)],
  term ((-258630351400 : Rat) / 150171761) [(3, 1), (6, 1), (11, 1), (12, 1), (14, 1)],
  term ((-357183250400 : Rat) / 150171761) [(3, 1), (6, 1), (11, 1), (12, 2)],
  term ((-259588267400 : Rat) / 150171761) [(3, 1), (6, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1193334282400 : Rat) / 150171761) [(3, 1), (6, 1), (11, 1), (13, 2)],
  term ((-132300601600 : Rat) / 150171761) [(3, 1), (6, 1), (11, 1), (14, 1)],
  term ((118340842900 : Rat) / 150171761) [(3, 1), (6, 1), (11, 1), (14, 2)],
  term ((-16278609900 : Rat) / 150171761) [(3, 1), (6, 1), (11, 1), (15, 2)],
  term ((-24916538063704045985 : Rat) / 2576367455419018) [(3, 1), (6, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((1161315052568295795 : Rat) / 2576367455419018) [(3, 1), (6, 1), (11, 2), (12, 1), (15, 1)],
  term ((-17205579326118360230 : Rat) / 1288183727709509) [(3, 1), (6, 1), (11, 2), (12, 2), (15, 1)],
  term ((-25008824024522761885 : Rat) / 2576367455419018) [(3, 1), (6, 1), (11, 2), (13, 1), (15, 2)],
  term ((-57483120038289816130 : Rat) / 1288183727709509) [(3, 1), (6, 1), (11, 2), (13, 2), (15, 1)],
  term ((-6372943001030435920 : Rat) / 1288183727709509) [(3, 1), (6, 1), (11, 2), (14, 1), (15, 1)],
  term ((22801995981115700545 : Rat) / 5152734910838036) [(3, 1), (6, 1), (11, 2), (14, 2), (15, 1)],
  term ((-35547881983176572385 : Rat) / 5152734910838036) [(3, 1), (6, 1), (11, 2), (15, 1)],
  term ((-3136573886258420895 : Rat) / 5152734910838036) [(3, 1), (6, 1), (11, 2), (15, 3)],
  term ((-166651850438 : Rat) / 25734207) [(3, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((-32331400538 : Rat) / 8578069) [(3, 1), (6, 1), (12, 1), (15, 1)],
  term ((-101982050248 : Rat) / 25734207) [(3, 1), (6, 1), (12, 2), (15, 1)],
  term ((3001410002 : Rat) / 25734207) [(3, 1), (6, 1), (13, 1), (15, 2)],
  term ((-510686307608 : Rat) / 25734207) [(3, 1), (6, 1), (13, 2), (15, 1)],
  term ((26369233408 : Rat) / 25734207) [(3, 1), (6, 1), (14, 1), (15, 1)],
  term ((2041952483 : Rat) / 25734207) [(3, 1), (6, 1), (14, 2), (15, 1)],
  term ((3714221407 : Rat) / 8578069) [(3, 1), (6, 1), (15, 1)],
  term ((-2607959871 : Rat) / 8578069) [(3, 1), (6, 1), (15, 3)],
  term ((4656059400 : Rat) / 150171761) [(3, 1), (6, 2), (7, 1), (11, 1), (13, 1)],
  term ((15669817600 : Rat) / 150171761) [(3, 1), (6, 2), (7, 1), (11, 1), (15, 1)],
  term ((448566383021072685 : Rat) / 2576367455419018) [(3, 1), (6, 2), (7, 1), (11, 2), (13, 1), (15, 1)],
  term ((754817840536135120 : Rat) / 1288183727709509) [(3, 1), (6, 2), (7, 1), (11, 2), (15, 2)],
  term ((437091386 : Rat) / 8578069) [(3, 1), (6, 2), (7, 1), (13, 1), (15, 1)],
  term ((-12808589248 : Rat) / 25734207) [(3, 1), (6, 2), (7, 1), (15, 2)],
  term ((-13546041600 : Rat) / 150171761) [(3, 1), (6, 2), (10, 1), (11, 1)],
  term ((-13546041600 : Rat) / 150171761) [(3, 1), (6, 2), (10, 1), (11, 1), (14, 1)],
  term ((-652515181052563920 : Rat) / 1288183727709509) [(3, 1), (6, 2), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((-652515181052563920 : Rat) / 1288183727709509) [(3, 1), (6, 2), (10, 1), (11, 2), (15, 1)],
  term ((860779296 : Rat) / 8578069) [(3, 1), (6, 2), (10, 1), (14, 1), (15, 1)],
  term ((860779296 : Rat) / 8578069) [(3, 1), (6, 2), (10, 1), (15, 1)],
  term ((92245571850 : Rat) / 150171761) [(3, 1), (6, 2), (11, 1)],
  term ((-6027147900 : Rat) / 150171761) [(3, 1), (6, 2), (11, 1), (12, 1)],
  term ((129315175700 : Rat) / 150171761) [(3, 1), (6, 2), (11, 1), (12, 1), (14, 1)],
  term ((178591625200 : Rat) / 150171761) [(3, 1), (6, 2), (11, 1), (12, 2)],
  term ((129794133700 : Rat) / 150171761) [(3, 1), (6, 2), (11, 1), (13, 1), (15, 1)],
  term ((596667141200 : Rat) / 150171761) [(3, 1), (6, 2), (11, 1), (13, 2)],
  term ((66150300800 : Rat) / 150171761) [(3, 1), (6, 2), (11, 1), (14, 1)],
  term ((-59170421450 : Rat) / 150171761) [(3, 1), (6, 2), (11, 1), (14, 2)],
  term ((8139304950 : Rat) / 150171761) [(3, 1), (6, 2), (11, 1), (15, 2)],
  term ((24916538063704045985 : Rat) / 5152734910838036) [(3, 1), (6, 2), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-1161315052568295795 : Rat) / 5152734910838036) [(3, 1), (6, 2), (11, 2), (12, 1), (15, 1)],
  term ((8602789663059180115 : Rat) / 1288183727709509) [(3, 1), (6, 2), (11, 2), (12, 2), (15, 1)],
  term ((25008824024522761885 : Rat) / 5152734910838036) [(3, 1), (6, 2), (11, 2), (13, 1), (15, 2)],
  term ((28741560019144908065 : Rat) / 1288183727709509) [(3, 1), (6, 2), (11, 2), (13, 2), (15, 1)],
  term ((3186471500515217960 : Rat) / 1288183727709509) [(3, 1), (6, 2), (11, 2), (14, 1), (15, 1)],
  term ((-22801995981115700545 : Rat) / 10305469821676072) [(3, 1), (6, 2), (11, 2), (14, 2), (15, 1)],
  term ((35547881983176572385 : Rat) / 10305469821676072) [(3, 1), (6, 2), (11, 2), (15, 1)],
  term ((3136573886258420895 : Rat) / 10305469821676072) [(3, 1), (6, 2), (11, 2), (15, 3)],
  term ((83325925219 : Rat) / 25734207) [(3, 1), (6, 2), (12, 1), (14, 1), (15, 1)],
  term ((16165700269 : Rat) / 8578069) [(3, 1), (6, 2), (12, 1), (15, 1)],
  term ((50991025124 : Rat) / 25734207) [(3, 1), (6, 2), (12, 2), (15, 1)],
  term ((-1500705001 : Rat) / 25734207) [(3, 1), (6, 2), (13, 1), (15, 2)],
  term ((255343153804 : Rat) / 25734207) [(3, 1), (6, 2), (13, 2), (15, 1)],
  term ((-13184616704 : Rat) / 25734207) [(3, 1), (6, 2), (14, 1), (15, 1)],
  term ((-2041952483 : Rat) / 51468414) [(3, 1), (6, 2), (14, 2), (15, 1)],
  term ((-3714221407 : Rat) / 17156138) [(3, 1), (6, 2), (15, 1)],
  term ((2607959871 : Rat) / 17156138) [(3, 1), (6, 2), (15, 3)],
  term ((9312118800 : Rat) / 150171761) [(3, 1), (7, 1), (11, 1), (13, 1), (14, 1)],
  term ((-4656059400 : Rat) / 150171761) [(3, 1), (7, 1), (11, 1), (13, 1), (14, 2)],
  term ((-4656059400 : Rat) / 150171761) [(3, 1), (7, 1), (11, 1), (13, 1), (15, 2)],
  term ((31339635200 : Rat) / 150171761) [(3, 1), (7, 1), (11, 1), (14, 1), (15, 1)],
  term ((-15669817600 : Rat) / 150171761) [(3, 1), (7, 1), (11, 1), (14, 2), (15, 1)],
  term ((-15669817600 : Rat) / 150171761) [(3, 1), (7, 1), (11, 1), (15, 3)],
  term ((448566383021072685 : Rat) / 1288183727709509) [(3, 1), (7, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-448566383021072685 : Rat) / 2576367455419018) [(3, 1), (7, 1), (11, 2), (13, 1), (14, 2), (15, 1)],
  term ((-448566383021072685 : Rat) / 2576367455419018) [(3, 1), (7, 1), (11, 2), (13, 1), (15, 3)],
  term ((1509635681072270240 : Rat) / 1288183727709509) [(3, 1), (7, 1), (11, 2), (14, 1), (15, 2)],
  term ((-754817840536135120 : Rat) / 1288183727709509) [(3, 1), (7, 1), (11, 2), (14, 2), (15, 2)],
  term ((-754817840536135120 : Rat) / 1288183727709509) [(3, 1), (7, 1), (11, 2), (15, 4)],
  term ((874182772 : Rat) / 8578069) [(3, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((-437091386 : Rat) / 8578069) [(3, 1), (7, 1), (13, 1), (14, 2), (15, 1)],
  term ((-437091386 : Rat) / 8578069) [(3, 1), (7, 1), (13, 1), (15, 3)],
  term ((-25617178496 : Rat) / 25734207) [(3, 1), (7, 1), (14, 1), (15, 2)],
  term ((12808589248 : Rat) / 25734207) [(3, 1), (7, 1), (14, 2), (15, 2)],
  term ((12808589248 : Rat) / 25734207) [(3, 1), (7, 1), (15, 4)],
  term ((-13546041600 : Rat) / 150171761) [(3, 1), (7, 2), (10, 1), (11, 1)],
  term ((-13546041600 : Rat) / 150171761) [(3, 1), (7, 2), (10, 1), (11, 1), (14, 1)],
  term ((-652515181052563920 : Rat) / 1288183727709509) [(3, 1), (7, 2), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((-652515181052563920 : Rat) / 1288183727709509) [(3, 1), (7, 2), (10, 1), (11, 2), (15, 1)],
  term ((860779296 : Rat) / 8578069) [(3, 1), (7, 2), (10, 1), (14, 1), (15, 1)],
  term ((860779296 : Rat) / 8578069) [(3, 1), (7, 2), (10, 1), (15, 1)],
  term ((92245571850 : Rat) / 150171761) [(3, 1), (7, 2), (11, 1)],
  term ((-6027147900 : Rat) / 150171761) [(3, 1), (7, 2), (11, 1), (12, 1)],
  term ((129315175700 : Rat) / 150171761) [(3, 1), (7, 2), (11, 1), (12, 1), (14, 1)],
  term ((178591625200 : Rat) / 150171761) [(3, 1), (7, 2), (11, 1), (12, 2)],
  term ((129794133700 : Rat) / 150171761) [(3, 1), (7, 2), (11, 1), (13, 1), (15, 1)],
  term ((596667141200 : Rat) / 150171761) [(3, 1), (7, 2), (11, 1), (13, 2)],
  term ((66150300800 : Rat) / 150171761) [(3, 1), (7, 2), (11, 1), (14, 1)],
  term ((-59170421450 : Rat) / 150171761) [(3, 1), (7, 2), (11, 1), (14, 2)],
  term ((8139304950 : Rat) / 150171761) [(3, 1), (7, 2), (11, 1), (15, 2)],
  term ((24916538063704045985 : Rat) / 5152734910838036) [(3, 1), (7, 2), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-1161315052568295795 : Rat) / 5152734910838036) [(3, 1), (7, 2), (11, 2), (12, 1), (15, 1)],
  term ((8602789663059180115 : Rat) / 1288183727709509) [(3, 1), (7, 2), (11, 2), (12, 2), (15, 1)],
  term ((25008824024522761885 : Rat) / 5152734910838036) [(3, 1), (7, 2), (11, 2), (13, 1), (15, 2)],
  term ((28741560019144908065 : Rat) / 1288183727709509) [(3, 1), (7, 2), (11, 2), (13, 2), (15, 1)],
  term ((3186471500515217960 : Rat) / 1288183727709509) [(3, 1), (7, 2), (11, 2), (14, 1), (15, 1)],
  term ((-22801995981115700545 : Rat) / 10305469821676072) [(3, 1), (7, 2), (11, 2), (14, 2), (15, 1)],
  term ((35547881983176572385 : Rat) / 10305469821676072) [(3, 1), (7, 2), (11, 2), (15, 1)],
  term ((3136573886258420895 : Rat) / 10305469821676072) [(3, 1), (7, 2), (11, 2), (15, 3)],
  term ((83325925219 : Rat) / 25734207) [(3, 1), (7, 2), (12, 1), (14, 1), (15, 1)],
  term ((16165700269 : Rat) / 8578069) [(3, 1), (7, 2), (12, 1), (15, 1)],
  term ((50991025124 : Rat) / 25734207) [(3, 1), (7, 2), (12, 2), (15, 1)],
  term ((-1500705001 : Rat) / 25734207) [(3, 1), (7, 2), (13, 1), (15, 2)],
  term ((255343153804 : Rat) / 25734207) [(3, 1), (7, 2), (13, 2), (15, 1)],
  term ((-13184616704 : Rat) / 25734207) [(3, 1), (7, 2), (14, 1), (15, 1)],
  term ((-2041952483 : Rat) / 51468414) [(3, 1), (7, 2), (14, 2), (15, 1)],
  term ((-3714221407 : Rat) / 17156138) [(3, 1), (7, 2), (15, 1)],
  term ((2607959871 : Rat) / 17156138) [(3, 1), (7, 2), (15, 3)],
  term ((4656059400 : Rat) / 150171761) [(3, 1), (7, 3), (11, 1), (13, 1)],
  term ((15669817600 : Rat) / 150171761) [(3, 1), (7, 3), (11, 1), (15, 1)],
  term ((448566383021072685 : Rat) / 2576367455419018) [(3, 1), (7, 3), (11, 2), (13, 1), (15, 1)],
  term ((754817840536135120 : Rat) / 1288183727709509) [(3, 1), (7, 3), (11, 2), (15, 2)],
  term ((437091386 : Rat) / 8578069) [(3, 1), (7, 3), (13, 1), (15, 1)],
  term ((-12808589248 : Rat) / 25734207) [(3, 1), (7, 3), (15, 2)],
  term ((-27092083200 : Rat) / 150171761) [(3, 1), (10, 1), (11, 1), (14, 1)],
  term ((13546041600 : Rat) / 150171761) [(3, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((-13546041600 : Rat) / 150171761) [(3, 1), (10, 1), (11, 1), (14, 2)],
  term ((13546041600 : Rat) / 150171761) [(3, 1), (10, 1), (11, 1), (14, 3)],
  term ((13546041600 : Rat) / 150171761) [(3, 1), (10, 1), (11, 1), (15, 2)],
  term ((-1305030362105127840 : Rat) / 1288183727709509) [(3, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((652515181052563920 : Rat) / 1288183727709509) [(3, 1), (10, 1), (11, 2), (14, 1), (15, 3)],
  term ((-652515181052563920 : Rat) / 1288183727709509) [(3, 1), (10, 1), (11, 2), (14, 2), (15, 1)],
  term ((652515181052563920 : Rat) / 1288183727709509) [(3, 1), (10, 1), (11, 2), (14, 3), (15, 1)],
  term ((652515181052563920 : Rat) / 1288183727709509) [(3, 1), (10, 1), (11, 2), (15, 3)],
  term ((1721558592 : Rat) / 8578069) [(3, 1), (10, 1), (14, 1), (15, 1)],
  term ((-860779296 : Rat) / 8578069) [(3, 1), (10, 1), (14, 1), (15, 3)],
  term ((860779296 : Rat) / 8578069) [(3, 1), (10, 1), (14, 2), (15, 1)],
  term ((-860779296 : Rat) / 8578069) [(3, 1), (10, 1), (14, 3), (15, 1)],
  term ((-860779296 : Rat) / 8578069) [(3, 1), (10, 1), (15, 3)],
  term ((-12054295800 : Rat) / 150171761) [(3, 1), (11, 1), (12, 1), (14, 1)],
  term ((-129315175700 : Rat) / 150171761) [(3, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((264657499300 : Rat) / 150171761) [(3, 1), (11, 1), (12, 1), (14, 2)],
  term ((-129315175700 : Rat) / 150171761) [(3, 1), (11, 1), (12, 1), (14, 3)],
  term ((6027147900 : Rat) / 150171761) [(3, 1), (11, 1), (12, 1), (15, 2)],
  term ((357183250400 : Rat) / 150171761) [(3, 1), (11, 1), (12, 2), (14, 1)],
  term ((-178591625200 : Rat) / 150171761) [(3, 1), (11, 1), (12, 2), (14, 2)],
  term ((-178591625200 : Rat) / 150171761) [(3, 1), (11, 1), (12, 2), (15, 2)],
  term ((259588267400 : Rat) / 150171761) [(3, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-129794133700 : Rat) / 150171761) [(3, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((-129794133700 : Rat) / 150171761) [(3, 1), (11, 1), (13, 1), (15, 3)],
  term ((1193334282400 : Rat) / 150171761) [(3, 1), (11, 1), (13, 2), (14, 1)],
  term ((-596667141200 : Rat) / 150171761) [(3, 1), (11, 1), (13, 2), (14, 2)],
  term ((-596667141200 : Rat) / 150171761) [(3, 1), (11, 1), (13, 2), (15, 2)],
  term ((184491143700 : Rat) / 150171761) [(3, 1), (11, 1), (14, 1)],
  term ((-49871690900 : Rat) / 150171761) [(3, 1), (11, 1), (14, 1), (15, 2)],
  term ((40055029750 : Rat) / 150171761) [(3, 1), (11, 1), (14, 2)],
  term ((51031116500 : Rat) / 150171761) [(3, 1), (11, 1), (14, 2), (15, 2)],
  term ((-184491143700 : Rat) / 150171761) [(3, 1), (11, 1), (14, 3)],
  term ((59170421450 : Rat) / 150171761) [(3, 1), (11, 1), (14, 4)],
  term ((-92245571850 : Rat) / 150171761) [(3, 1), (11, 1), (15, 2)],
  term ((-8139304950 : Rat) / 150171761) [(3, 1), (11, 1), (15, 4)],
  term ((-1161315052568295795 : Rat) / 2576367455419018) [(3, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-24916538063704045985 : Rat) / 5152734910838036) [(3, 1), (11, 2), (12, 1), (14, 1), (15, 3)],
  term ((50994391179976387765 : Rat) / 5152734910838036) [(3, 1), (11, 2), (12, 1), (14, 2), (15, 1)],
  term ((-24916538063704045985 : Rat) / 5152734910838036) [(3, 1), (11, 2), (12, 1), (14, 3), (15, 1)],
  term ((1161315052568295795 : Rat) / 5152734910838036) [(3, 1), (11, 2), (12, 1), (15, 3)],
  term ((17205579326118360230 : Rat) / 1288183727709509) [(3, 1), (11, 2), (12, 2), (14, 1), (15, 1)],
  term ((-8602789663059180115 : Rat) / 1288183727709509) [(3, 1), (11, 2), (12, 2), (14, 2), (15, 1)],
  term ((-8602789663059180115 : Rat) / 1288183727709509) [(3, 1), (11, 2), (12, 2), (15, 3)],
  term ((25008824024522761885 : Rat) / 2576367455419018) [(3, 1), (11, 2), (13, 1), (14, 1), (15, 2)],
  term ((-25008824024522761885 : Rat) / 5152734910838036) [(3, 1), (11, 2), (13, 1), (14, 2), (15, 2)],
  term ((-25008824024522761885 : Rat) / 5152734910838036) [(3, 1), (11, 2), (13, 1), (15, 4)],
  term ((57483120038289816130 : Rat) / 1288183727709509) [(3, 1), (11, 2), (13, 2), (14, 1), (15, 1)],
  term ((-28741560019144908065 : Rat) / 1288183727709509) [(3, 1), (11, 2), (13, 2), (14, 2), (15, 1)],
  term ((-28741560019144908065 : Rat) / 1288183727709509) [(3, 1), (11, 2), (13, 2), (15, 3)],
  term ((35547881983176572385 : Rat) / 5152734910838036) [(3, 1), (11, 2), (14, 1), (15, 1)],
  term ((-9609312115802450945 : Rat) / 5152734910838036) [(3, 1), (11, 2), (14, 1), (15, 3)],
  term ((15435662025066914975 : Rat) / 10305469821676072) [(3, 1), (11, 2), (14, 2), (15, 1)],
  term ((9832711047428639825 : Rat) / 5152734910838036) [(3, 1), (11, 2), (14, 2), (15, 3)],
  term ((-35547881983176572385 : Rat) / 5152734910838036) [(3, 1), (11, 2), (14, 3), (15, 1)],
  term ((22801995981115700545 : Rat) / 10305469821676072) [(3, 1), (11, 2), (14, 4), (15, 1)],
  term ((-35547881983176572385 : Rat) / 10305469821676072) [(3, 1), (11, 2), (15, 3)],
  term ((-3136573886258420895 : Rat) / 10305469821676072) [(3, 1), (11, 2), (15, 5)],
  term ((32331400538 : Rat) / 8578069) [(3, 1), (12, 1), (14, 1), (15, 1)],
  term ((-83325925219 : Rat) / 25734207) [(3, 1), (12, 1), (14, 1), (15, 3)],
  term ((118154749631 : Rat) / 25734207) [(3, 1), (12, 1), (14, 2), (15, 1)],
  term ((-83325925219 : Rat) / 25734207) [(3, 1), (12, 1), (14, 3), (15, 1)],
  term ((-16165700269 : Rat) / 8578069) [(3, 1), (12, 1), (15, 3)],
  term ((101982050248 : Rat) / 25734207) [(3, 1), (12, 2), (14, 1), (15, 1)],
  term ((-50991025124 : Rat) / 25734207) [(3, 1), (12, 2), (14, 2), (15, 1)],
  term ((-50991025124 : Rat) / 25734207) [(3, 1), (12, 2), (15, 3)],
  term ((-3001410002 : Rat) / 25734207) [(3, 1), (13, 1), (14, 1), (15, 2)],
  term ((1500705001 : Rat) / 25734207) [(3, 1), (13, 1), (14, 2), (15, 2)],
  term ((1500705001 : Rat) / 25734207) [(3, 1), (13, 1), (15, 4)],
  term ((510686307608 : Rat) / 25734207) [(3, 1), (13, 2), (14, 1), (15, 1)],
  term ((-255343153804 : Rat) / 25734207) [(3, 1), (13, 2), (14, 2), (15, 1)],
  term ((-255343153804 : Rat) / 25734207) [(3, 1), (13, 2), (15, 3)],
  term ((-3714221407 : Rat) / 8578069) [(3, 1), (14, 1), (15, 1)],
  term ((21008496317 : Rat) / 25734207) [(3, 1), (14, 1), (15, 3)],
  term ((-41595802595 : Rat) / 51468414) [(3, 1), (14, 2), (15, 1)],
  term ((-2890963565 : Rat) / 25734207) [(3, 1), (14, 2), (15, 3)],
  term ((3714221407 : Rat) / 8578069) [(3, 1), (14, 3), (15, 1)],
  term ((2041952483 : Rat) / 51468414) [(3, 1), (14, 4), (15, 1)],
  term ((3714221407 : Rat) / 17156138) [(3, 1), (15, 3)],
  term ((-2607959871 : Rat) / 17156138) [(3, 1), (15, 5)],
  term ((31747314400 : Rat) / 150171761) [(3, 2), (5, 1), (6, 1), (11, 1)],
  term ((1529273659077547030 : Rat) / 1288183727709509) [(3, 2), (5, 1), (6, 1), (11, 2), (15, 1)],
  term ((25852133768 : Rat) / 25734207) [(3, 2), (5, 1), (6, 1), (15, 1)],
  term ((-15873657200 : Rat) / 150171761) [(3, 2), (5, 1), (6, 2), (11, 1)],
  term ((-764636829538773515 : Rat) / 1288183727709509) [(3, 2), (5, 1), (6, 2), (11, 2), (15, 1)],
  term ((-12926066884 : Rat) / 25734207) [(3, 2), (5, 1), (6, 2), (15, 1)],
  term ((-15873657200 : Rat) / 150171761) [(3, 2), (5, 1), (7, 2), (11, 1)],
  term ((-764636829538773515 : Rat) / 1288183727709509) [(3, 2), (5, 1), (7, 2), (11, 2), (15, 1)],
  term ((-12926066884 : Rat) / 25734207) [(3, 2), (5, 1), (7, 2), (15, 1)],
  term ((-31747314400 : Rat) / 150171761) [(3, 2), (5, 1), (11, 1), (14, 1)],
  term ((15873657200 : Rat) / 150171761) [(3, 2), (5, 1), (11, 1), (14, 2)],
  term ((15873657200 : Rat) / 150171761) [(3, 2), (5, 1), (11, 1), (15, 2)],
  term ((-1529273659077547030 : Rat) / 1288183727709509) [(3, 2), (5, 1), (11, 2), (14, 1), (15, 1)],
  term ((764636829538773515 : Rat) / 1288183727709509) [(3, 2), (5, 1), (11, 2), (14, 2), (15, 1)],
  term ((764636829538773515 : Rat) / 1288183727709509) [(3, 2), (5, 1), (11, 2), (15, 3)],
  term ((-25852133768 : Rat) / 25734207) [(3, 2), (5, 1), (14, 1), (15, 1)],
  term ((12926066884 : Rat) / 25734207) [(3, 2), (5, 1), (14, 2), (15, 1)],
  term ((12926066884 : Rat) / 25734207) [(3, 2), (5, 1), (15, 3)],
  term ((140646753600 : Rat) / 150171761) [(3, 2), (6, 1), (7, 1), (11, 1)],
  term ((6774978595205210820 : Rat) / 1288183727709509) [(3, 2), (6, 1), (7, 1), (11, 2), (15, 1)],
  term ((-9856677936 : Rat) / 8578069) [(3, 2), (6, 1), (7, 1), (15, 1)],
  term ((831263328000 : Rat) / 150171761) [(3, 2), (6, 1), (11, 1), (13, 1)],
  term ((-24952952800 : Rat) / 150171761) [(3, 2), (6, 1), (11, 1), (15, 1)],
  term ((40042099159969863600 : Rat) / 1288183727709509) [(3, 2), (6, 1), (11, 2), (13, 1), (15, 1)],
  term ((-1201988078501699110 : Rat) / 1288183727709509) [(3, 2), (6, 1), (11, 2), (15, 2)],
  term ((66036610880 : Rat) / 8578069) [(3, 2), (6, 1), (13, 1), (15, 1)],
  term ((-16684235336 : Rat) / 25734207) [(3, 2), (6, 1), (15, 2)],
  term ((-70323376800 : Rat) / 150171761) [(3, 2), (6, 2), (7, 1), (11, 1)],
  term ((-3387489297602605410 : Rat) / 1288183727709509) [(3, 2), (6, 2), (7, 1), (11, 2), (15, 1)],
  term ((4928338968 : Rat) / 8578069) [(3, 2), (6, 2), (7, 1), (15, 1)],
  term ((-415631664000 : Rat) / 150171761) [(3, 2), (6, 2), (11, 1), (13, 1)],
  term ((12476476400 : Rat) / 150171761) [(3, 2), (6, 2), (11, 1), (15, 1)],
  term ((-20021049579984931800 : Rat) / 1288183727709509) [(3, 2), (6, 2), (11, 2), (13, 1), (15, 1)],
  term ((600994039250849555 : Rat) / 1288183727709509) [(3, 2), (6, 2), (11, 2), (15, 2)],
  term ((-33018305440 : Rat) / 8578069) [(3, 2), (6, 2), (13, 1), (15, 1)],
  term ((8342117668 : Rat) / 25734207) [(3, 2), (6, 2), (15, 2)],
  term ((-140646753600 : Rat) / 150171761) [(3, 2), (7, 1), (11, 1), (14, 1)],
  term ((70323376800 : Rat) / 150171761) [(3, 2), (7, 1), (11, 1), (14, 2)],
  term ((70323376800 : Rat) / 150171761) [(3, 2), (7, 1), (11, 1), (15, 2)],
  term ((-6774978595205210820 : Rat) / 1288183727709509) [(3, 2), (7, 1), (11, 2), (14, 1), (15, 1)],
  term ((3387489297602605410 : Rat) / 1288183727709509) [(3, 2), (7, 1), (11, 2), (14, 2), (15, 1)],
  term ((3387489297602605410 : Rat) / 1288183727709509) [(3, 2), (7, 1), (11, 2), (15, 3)],
  term ((9856677936 : Rat) / 8578069) [(3, 2), (7, 1), (14, 1), (15, 1)],
  term ((-4928338968 : Rat) / 8578069) [(3, 2), (7, 1), (14, 2), (15, 1)],
  term ((-4928338968 : Rat) / 8578069) [(3, 2), (7, 1), (15, 3)],
  term ((-415631664000 : Rat) / 150171761) [(3, 2), (7, 2), (11, 1), (13, 1)],
  term ((12476476400 : Rat) / 150171761) [(3, 2), (7, 2), (11, 1), (15, 1)],
  term ((-20021049579984931800 : Rat) / 1288183727709509) [(3, 2), (7, 2), (11, 2), (13, 1), (15, 1)],
  term ((600994039250849555 : Rat) / 1288183727709509) [(3, 2), (7, 2), (11, 2), (15, 2)],
  term ((-33018305440 : Rat) / 8578069) [(3, 2), (7, 2), (13, 1), (15, 1)],
  term ((8342117668 : Rat) / 25734207) [(3, 2), (7, 2), (15, 2)],
  term ((-70323376800 : Rat) / 150171761) [(3, 2), (7, 3), (11, 1)],
  term ((-3387489297602605410 : Rat) / 1288183727709509) [(3, 2), (7, 3), (11, 2), (15, 1)],
  term ((4928338968 : Rat) / 8578069) [(3, 2), (7, 3), (15, 1)],
  term ((-831263328000 : Rat) / 150171761) [(3, 2), (11, 1), (13, 1), (14, 1)],
  term ((415631664000 : Rat) / 150171761) [(3, 2), (11, 1), (13, 1), (14, 2)],
  term ((415631664000 : Rat) / 150171761) [(3, 2), (11, 1), (13, 1), (15, 2)],
  term ((24952952800 : Rat) / 150171761) [(3, 2), (11, 1), (14, 1), (15, 1)],
  term ((-12476476400 : Rat) / 150171761) [(3, 2), (11, 1), (14, 2), (15, 1)],
  term ((-12476476400 : Rat) / 150171761) [(3, 2), (11, 1), (15, 3)],
  term ((-40042099159969863600 : Rat) / 1288183727709509) [(3, 2), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((20021049579984931800 : Rat) / 1288183727709509) [(3, 2), (11, 2), (13, 1), (14, 2), (15, 1)],
  term ((20021049579984931800 : Rat) / 1288183727709509) [(3, 2), (11, 2), (13, 1), (15, 3)],
  term ((1201988078501699110 : Rat) / 1288183727709509) [(3, 2), (11, 2), (14, 1), (15, 2)],
  term ((-600994039250849555 : Rat) / 1288183727709509) [(3, 2), (11, 2), (14, 2), (15, 2)],
  term ((-600994039250849555 : Rat) / 1288183727709509) [(3, 2), (11, 2), (15, 4)],
  term ((-66036610880 : Rat) / 8578069) [(3, 2), (13, 1), (14, 1), (15, 1)],
  term ((33018305440 : Rat) / 8578069) [(3, 2), (13, 1), (14, 2), (15, 1)],
  term ((33018305440 : Rat) / 8578069) [(3, 2), (13, 1), (15, 3)],
  term ((16684235336 : Rat) / 25734207) [(3, 2), (14, 1), (15, 2)],
  term ((-8342117668 : Rat) / 25734207) [(3, 2), (14, 2), (15, 2)],
  term ((-8342117668 : Rat) / 25734207) [(3, 2), (15, 4)],
  term ((-238956656000 : Rat) / 150171761) [(3, 3), (6, 1), (11, 1)],
  term ((-11510583700965102200 : Rat) / 1288183727709509) [(3, 3), (6, 1), (11, 2), (15, 1)],
  term ((-5080057120 : Rat) / 25734207) [(3, 3), (6, 1), (15, 1)],
  term ((119478328000 : Rat) / 150171761) [(3, 3), (6, 2), (11, 1)],
  term ((5755291850482551100 : Rat) / 1288183727709509) [(3, 3), (6, 2), (11, 2), (15, 1)],
  term ((2540028560 : Rat) / 25734207) [(3, 3), (6, 2), (15, 1)],
  term ((119478328000 : Rat) / 150171761) [(3, 3), (7, 2), (11, 1)],
  term ((5755291850482551100 : Rat) / 1288183727709509) [(3, 3), (7, 2), (11, 2), (15, 1)],
  term ((2540028560 : Rat) / 25734207) [(3, 3), (7, 2), (15, 1)],
  term ((238956656000 : Rat) / 150171761) [(3, 3), (11, 1), (14, 1)],
  term ((-119478328000 : Rat) / 150171761) [(3, 3), (11, 1), (14, 2)],
  term ((-119478328000 : Rat) / 150171761) [(3, 3), (11, 1), (15, 2)],
  term ((11510583700965102200 : Rat) / 1288183727709509) [(3, 3), (11, 2), (14, 1), (15, 1)],
  term ((-5755291850482551100 : Rat) / 1288183727709509) [(3, 3), (11, 2), (14, 2), (15, 1)],
  term ((-5755291850482551100 : Rat) / 1288183727709509) [(3, 3), (11, 2), (15, 3)],
  term ((5080057120 : Rat) / 25734207) [(3, 3), (14, 1), (15, 1)],
  term ((-2540028560 : Rat) / 25734207) [(3, 3), (14, 2), (15, 1)],
  term ((-2540028560 : Rat) / 25734207) [(3, 3), (15, 3)],
  term ((-88746566400 : Rat) / 150171761) [(4, 1), (5, 1), (6, 1), (11, 1)],
  term ((6149654400 : Rat) / 150171761) [(4, 1), (5, 1), (6, 1), (11, 1), (12, 1)],
  term ((-3074827200 : Rat) / 150171761) [(4, 1), (5, 1), (6, 1), (11, 1), (14, 1)],
  term ((296229922564736280 : Rat) / 1288183727709509) [(4, 1), (5, 1), (6, 1), (11, 2), (12, 1), (15, 1)],
  term ((-148114961282368140 : Rat) / 1288183727709509) [(4, 1), (5, 1), (6, 1), (11, 2), (14, 1), (15, 1)],
  term ((-4274937546499885680 : Rat) / 1288183727709509) [(4, 1), (5, 1), (6, 1), (11, 2), (15, 1)],
  term ((925633376 : Rat) / 8578069) [(4, 1), (5, 1), (6, 1), (12, 1), (15, 1)],
  term ((-462816688 : Rat) / 8578069) [(4, 1), (5, 1), (6, 1), (14, 1), (15, 1)],
  term ((536670144 : Rat) / 8578069) [(4, 1), (5, 1), (6, 1), (15, 1)],
  term ((44373283200 : Rat) / 150171761) [(4, 1), (5, 1), (6, 2), (11, 1)],
  term ((-3074827200 : Rat) / 150171761) [(4, 1), (5, 1), (6, 2), (11, 1), (12, 1)],
  term ((1537413600 : Rat) / 150171761) [(4, 1), (5, 1), (6, 2), (11, 1), (14, 1)],
  term ((-148114961282368140 : Rat) / 1288183727709509) [(4, 1), (5, 1), (6, 2), (11, 2), (12, 1), (15, 1)],
  term ((74057480641184070 : Rat) / 1288183727709509) [(4, 1), (5, 1), (6, 2), (11, 2), (14, 1), (15, 1)],
  term ((2137468773249942840 : Rat) / 1288183727709509) [(4, 1), (5, 1), (6, 2), (11, 2), (15, 1)],
  term ((-462816688 : Rat) / 8578069) [(4, 1), (5, 1), (6, 2), (12, 1), (15, 1)],
  term ((231408344 : Rat) / 8578069) [(4, 1), (5, 1), (6, 2), (14, 1), (15, 1)],
  term ((-268335072 : Rat) / 8578069) [(4, 1), (5, 1), (6, 2), (15, 1)],
  term ((44373283200 : Rat) / 150171761) [(4, 1), (5, 1), (7, 2), (11, 1)],
  term ((-3074827200 : Rat) / 150171761) [(4, 1), (5, 1), (7, 2), (11, 1), (12, 1)],
  term ((1537413600 : Rat) / 150171761) [(4, 1), (5, 1), (7, 2), (11, 1), (14, 1)],
  term ((-148114961282368140 : Rat) / 1288183727709509) [(4, 1), (5, 1), (7, 2), (11, 2), (12, 1), (15, 1)],
  term ((74057480641184070 : Rat) / 1288183727709509) [(4, 1), (5, 1), (7, 2), (11, 2), (14, 1), (15, 1)],
  term ((2137468773249942840 : Rat) / 1288183727709509) [(4, 1), (5, 1), (7, 2), (11, 2), (15, 1)],
  term ((-462816688 : Rat) / 8578069) [(4, 1), (5, 1), (7, 2), (12, 1), (15, 1)],
  term ((231408344 : Rat) / 8578069) [(4, 1), (5, 1), (7, 2), (14, 1), (15, 1)],
  term ((-268335072 : Rat) / 8578069) [(4, 1), (5, 1), (7, 2), (15, 1)],
  term ((-6149654400 : Rat) / 150171761) [(4, 1), (5, 1), (11, 1), (12, 1), (14, 1)],
  term ((3074827200 : Rat) / 150171761) [(4, 1), (5, 1), (11, 1), (12, 1), (14, 2)],
  term ((3074827200 : Rat) / 150171761) [(4, 1), (5, 1), (11, 1), (12, 1), (15, 2)],
  term ((88746566400 : Rat) / 150171761) [(4, 1), (5, 1), (11, 1), (14, 1)],
  term ((-1537413600 : Rat) / 150171761) [(4, 1), (5, 1), (11, 1), (14, 1), (15, 2)],
  term ((-41298456000 : Rat) / 150171761) [(4, 1), (5, 1), (11, 1), (14, 2)],
  term ((-1537413600 : Rat) / 150171761) [(4, 1), (5, 1), (11, 1), (14, 3)],
  term ((-44373283200 : Rat) / 150171761) [(4, 1), (5, 1), (11, 1), (15, 2)],
  term ((-296229922564736280 : Rat) / 1288183727709509) [(4, 1), (5, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((148114961282368140 : Rat) / 1288183727709509) [(4, 1), (5, 1), (11, 2), (12, 1), (14, 2), (15, 1)],
  term ((148114961282368140 : Rat) / 1288183727709509) [(4, 1), (5, 1), (11, 2), (12, 1), (15, 3)],
  term ((4274937546499885680 : Rat) / 1288183727709509) [(4, 1), (5, 1), (11, 2), (14, 1), (15, 1)],
  term ((-74057480641184070 : Rat) / 1288183727709509) [(4, 1), (5, 1), (11, 2), (14, 1), (15, 3)],
  term ((-1989353811967574700 : Rat) / 1288183727709509) [(4, 1), (5, 1), (11, 2), (14, 2), (15, 1)],
  term ((-74057480641184070 : Rat) / 1288183727709509) [(4, 1), (5, 1), (11, 2), (14, 3), (15, 1)],
  term ((-2137468773249942840 : Rat) / 1288183727709509) [(4, 1), (5, 1), (11, 2), (15, 3)],
  term ((-925633376 : Rat) / 8578069) [(4, 1), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((462816688 : Rat) / 8578069) [(4, 1), (5, 1), (12, 1), (14, 2), (15, 1)],
  term ((462816688 : Rat) / 8578069) [(4, 1), (5, 1), (12, 1), (15, 3)],
  term ((-536670144 : Rat) / 8578069) [(4, 1), (5, 1), (14, 1), (15, 1)],
  term ((-231408344 : Rat) / 8578069) [(4, 1), (5, 1), (14, 1), (15, 3)],
  term ((731151760 : Rat) / 8578069) [(4, 1), (5, 1), (14, 2), (15, 1)],
  term ((-231408344 : Rat) / 8578069) [(4, 1), (5, 1), (14, 3), (15, 1)],
  term ((268335072 : Rat) / 8578069) [(4, 1), (5, 1), (15, 3)],
  term ((-19009724800 : Rat) / 150171761) [(4, 1), (6, 1), (7, 1), (11, 1)],
  term ((19009724800 : Rat) / 150171761) [(4, 1), (6, 1), (7, 1), (11, 1), (14, 1)],
  term ((915701751545736760 : Rat) / 1288183727709509) [(4, 1), (6, 1), (7, 1), (11, 2), (14, 1), (15, 1)],
  term ((-915701751545736760 : Rat) / 1288183727709509) [(4, 1), (6, 1), (7, 1), (11, 2), (15, 1)],
  term ((3156045536 : Rat) / 25734207) [(4, 1), (6, 1), (7, 1), (14, 1), (15, 1)],
  term ((-3156045536 : Rat) / 25734207) [(4, 1), (6, 1), (7, 1), (15, 1)],
  term ((96184660800 : Rat) / 150171761) [(4, 1), (6, 1), (9, 1), (10, 1), (11, 1)],
  term ((4633231848069287460 : Rat) / 1288183727709509) [(4, 1), (6, 1), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((2497616592 : Rat) / 8578069) [(4, 1), (6, 1), (9, 1), (10, 1), (15, 1)],
  term ((731786168278549096 : Rat) / 1288183727709509) [(4, 1), (6, 1), (10, 1), (11, 1), (15, 1)],
  term ((-146701653600 : Rat) / 150171761) [(4, 1), (6, 1), (10, 1), (11, 2)],
  term ((4803291483577764570 : Rat) / 1288183727709509) [(4, 1), (6, 1), (10, 1), (11, 2), (15, 2)],
  term ((-7066644181833497070 : Rat) / 1288183727709509) [(4, 1), (6, 1), (10, 1), (11, 3), (15, 1)],
  term ((-2898836376 : Rat) / 8578069) [(4, 1), (6, 1), (10, 1), (15, 2)],
  term ((3593174400 : Rat) / 8833633) [(4, 1), (6, 1), (11, 1), (12, 1), (13, 1)],
  term ((-123524193600 : Rat) / 150171761) [(4, 1), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((183839517200 : Rat) / 150171761) [(4, 1), (6, 1), (11, 1), (13, 1)],
  term ((21783553200 : Rat) / 150171761) [(4, 1), (6, 1), (11, 1), (13, 1), (14, 1)],
  term ((34945758224825068 : Rat) / 1288183727709509) [(4, 1), (6, 1), (11, 1), (14, 1), (15, 1)],
  term ((-85597250585865724 : Rat) / 1288183727709509) [(4, 1), (6, 1), (11, 1), (15, 1)],
  term ((-223651263600 : Rat) / 150171761) [(4, 1), (6, 1), (11, 2)],
  term ((173083836105260280 : Rat) / 75775513394677) [(4, 1), (6, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-693650505780 : Rat) / 150171761) [(4, 1), (6, 1), (11, 2), (12, 1), (15, 2)],
  term ((1049317548254551215 : Rat) / 1288183727709509) [(4, 1), (6, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((9504862400 : Rat) / 150171761) [(4, 1), (6, 2), (7, 1), (11, 1)],
  term ((-9504862400 : Rat) / 150171761) [(4, 1), (6, 2), (7, 1), (11, 1), (14, 1)],
  term ((-457850875772868380 : Rat) / 1288183727709509) [(4, 1), (6, 2), (7, 1), (11, 2), (14, 1), (15, 1)],
  term ((457850875772868380 : Rat) / 1288183727709509) [(4, 1), (6, 2), (7, 1), (11, 2), (15, 1)],
  term ((-1578022768 : Rat) / 25734207) [(4, 1), (6, 2), (7, 1), (14, 1), (15, 1)],
  term ((1578022768 : Rat) / 25734207) [(4, 1), (6, 2), (7, 1), (15, 1)],
  term ((-48092330400 : Rat) / 150171761) [(4, 1), (6, 2), (9, 1), (10, 1), (11, 1)],
  term ((-2316615924034643730 : Rat) / 1288183727709509) [(4, 1), (6, 2), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((-1248808296 : Rat) / 8578069) [(4, 1), (6, 2), (9, 1), (10, 1), (15, 1)],
  term ((-365893084139274548 : Rat) / 1288183727709509) [(4, 1), (6, 2), (10, 1), (11, 1), (15, 1)],
  term ((73350826800 : Rat) / 150171761) [(4, 1), (6, 2), (10, 1), (11, 2)],
  term ((-2401645741788882285 : Rat) / 1288183727709509) [(4, 1), (6, 2), (10, 1), (11, 2), (15, 2)],
  term ((3533322090916748535 : Rat) / 1288183727709509) [(4, 1), (6, 2), (10, 1), (11, 3), (15, 1)],
  term ((1449418188 : Rat) / 8578069) [(4, 1), (6, 2), (10, 1), (15, 2)],
  term ((-1796587200 : Rat) / 8833633) [(4, 1), (6, 2), (11, 1), (12, 1), (13, 1)],
  term ((61762096800 : Rat) / 150171761) [(4, 1), (6, 2), (11, 1), (12, 1), (15, 1)],
  term ((-91919758600 : Rat) / 150171761) [(4, 1), (6, 2), (11, 1), (13, 1)],
  term ((-10891776600 : Rat) / 150171761) [(4, 1), (6, 2), (11, 1), (13, 1), (14, 1)],
  term ((-17472879112412534 : Rat) / 1288183727709509) [(4, 1), (6, 2), (11, 1), (14, 1), (15, 1)],
  term ((42798625292932862 : Rat) / 1288183727709509) [(4, 1), (6, 2), (11, 1), (15, 1)],
  term ((111825631800 : Rat) / 150171761) [(4, 1), (6, 2), (11, 2)],
  term ((-86541918052630140 : Rat) / 75775513394677) [(4, 1), (6, 2), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((346825252890 : Rat) / 150171761) [(4, 1), (6, 2), (11, 2), (12, 1), (15, 2)],
  term ((-1049317548254551215 : Rat) / 2576367455419018) [(4, 1), (6, 2), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((19009724800 : Rat) / 150171761) [(4, 1), (7, 1), (11, 1), (14, 1)],
  term ((9504862400 : Rat) / 150171761) [(4, 1), (7, 1), (11, 1), (14, 1), (15, 2)],
  term ((-28514587200 : Rat) / 150171761) [(4, 1), (7, 1), (11, 1), (14, 2)],
  term ((9504862400 : Rat) / 150171761) [(4, 1), (7, 1), (11, 1), (14, 3)],
  term ((-9504862400 : Rat) / 150171761) [(4, 1), (7, 1), (11, 1), (15, 2)],
  term ((915701751545736760 : Rat) / 1288183727709509) [(4, 1), (7, 1), (11, 2), (14, 1), (15, 1)],
  term ((457850875772868380 : Rat) / 1288183727709509) [(4, 1), (7, 1), (11, 2), (14, 1), (15, 3)],
  term ((-1373552627318605140 : Rat) / 1288183727709509) [(4, 1), (7, 1), (11, 2), (14, 2), (15, 1)],
  term ((457850875772868380 : Rat) / 1288183727709509) [(4, 1), (7, 1), (11, 2), (14, 3), (15, 1)],
  term ((-457850875772868380 : Rat) / 1288183727709509) [(4, 1), (7, 1), (11, 2), (15, 3)],
  term ((3156045536 : Rat) / 25734207) [(4, 1), (7, 1), (14, 1), (15, 1)],
  term ((1578022768 : Rat) / 25734207) [(4, 1), (7, 1), (14, 1), (15, 3)],
  term ((-1578022768 : Rat) / 8578069) [(4, 1), (7, 1), (14, 2), (15, 1)],
  term ((1578022768 : Rat) / 25734207) [(4, 1), (7, 1), (14, 3), (15, 1)],
  term ((-1578022768 : Rat) / 25734207) [(4, 1), (7, 1), (15, 3)],
  term ((-48092330400 : Rat) / 150171761) [(4, 1), (7, 2), (9, 1), (10, 1), (11, 1)],
  term ((-2316615924034643730 : Rat) / 1288183727709509) [(4, 1), (7, 2), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((-1248808296 : Rat) / 8578069) [(4, 1), (7, 2), (9, 1), (10, 1), (15, 1)],
  term ((-365893084139274548 : Rat) / 1288183727709509) [(4, 1), (7, 2), (10, 1), (11, 1), (15, 1)],
  term ((73350826800 : Rat) / 150171761) [(4, 1), (7, 2), (10, 1), (11, 2)],
  term ((-2401645741788882285 : Rat) / 1288183727709509) [(4, 1), (7, 2), (10, 1), (11, 2), (15, 2)],
  term ((3533322090916748535 : Rat) / 1288183727709509) [(4, 1), (7, 2), (10, 1), (11, 3), (15, 1)],
  term ((1449418188 : Rat) / 8578069) [(4, 1), (7, 2), (10, 1), (15, 2)],
  term ((-1796587200 : Rat) / 8833633) [(4, 1), (7, 2), (11, 1), (12, 1), (13, 1)],
  term ((61762096800 : Rat) / 150171761) [(4, 1), (7, 2), (11, 1), (12, 1), (15, 1)],
  term ((-91919758600 : Rat) / 150171761) [(4, 1), (7, 2), (11, 1), (13, 1)],
  term ((-10891776600 : Rat) / 150171761) [(4, 1), (7, 2), (11, 1), (13, 1), (14, 1)],
  term ((-17472879112412534 : Rat) / 1288183727709509) [(4, 1), (7, 2), (11, 1), (14, 1), (15, 1)],
  term ((42798625292932862 : Rat) / 1288183727709509) [(4, 1), (7, 2), (11, 1), (15, 1)],
  term ((111825631800 : Rat) / 150171761) [(4, 1), (7, 2), (11, 2)],
  term ((-86541918052630140 : Rat) / 75775513394677) [(4, 1), (7, 2), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((346825252890 : Rat) / 150171761) [(4, 1), (7, 2), (11, 2), (12, 1), (15, 2)],
  term ((-1049317548254551215 : Rat) / 2576367455419018) [(4, 1), (7, 2), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((9504862400 : Rat) / 150171761) [(4, 1), (7, 3), (11, 1)],
  term ((-9504862400 : Rat) / 150171761) [(4, 1), (7, 3), (11, 1), (14, 1)],
  term ((-457850875772868380 : Rat) / 1288183727709509) [(4, 1), (7, 3), (11, 2), (14, 1), (15, 1)],
  term ((457850875772868380 : Rat) / 1288183727709509) [(4, 1), (7, 3), (11, 2), (15, 1)],
  term ((-1578022768 : Rat) / 25734207) [(4, 1), (7, 3), (14, 1), (15, 1)],
  term ((1578022768 : Rat) / 25734207) [(4, 1), (7, 3), (15, 1)],
  term ((-96184660800 : Rat) / 150171761) [(4, 1), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((48092330400 : Rat) / 150171761) [(4, 1), (9, 1), (10, 1), (11, 1), (14, 2)],
  term ((48092330400 : Rat) / 150171761) [(4, 1), (9, 1), (10, 1), (11, 1), (15, 2)],
  term ((-4633231848069287460 : Rat) / 1288183727709509) [(4, 1), (9, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((2316615924034643730 : Rat) / 1288183727709509) [(4, 1), (9, 1), (10, 1), (11, 2), (14, 2), (15, 1)],
  term ((2316615924034643730 : Rat) / 1288183727709509) [(4, 1), (9, 1), (10, 1), (11, 2), (15, 3)],
  term ((-2497616592 : Rat) / 8578069) [(4, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((1248808296 : Rat) / 8578069) [(4, 1), (9, 1), (10, 1), (14, 2), (15, 1)],
  term ((1248808296 : Rat) / 8578069) [(4, 1), (9, 1), (10, 1), (15, 3)],
  term ((-731786168278549096 : Rat) / 1288183727709509) [(4, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((365893084139274548 : Rat) / 1288183727709509) [(4, 1), (10, 1), (11, 1), (14, 2), (15, 1)],
  term ((365893084139274548 : Rat) / 1288183727709509) [(4, 1), (10, 1), (11, 1), (15, 3)],
  term ((146701653600 : Rat) / 150171761) [(4, 1), (10, 1), (11, 2), (14, 1)],
  term ((-4803291483577764570 : Rat) / 1288183727709509) [(4, 1), (10, 1), (11, 2), (14, 1), (15, 2)],
  term ((-73350826800 : Rat) / 150171761) [(4, 1), (10, 1), (11, 2), (14, 2)],
  term ((2401645741788882285 : Rat) / 1288183727709509) [(4, 1), (10, 1), (11, 2), (14, 2), (15, 2)],
  term ((-73350826800 : Rat) / 150171761) [(4, 1), (10, 1), (11, 2), (15, 2)],
  term ((2401645741788882285 : Rat) / 1288183727709509) [(4, 1), (10, 1), (11, 2), (15, 4)],
  term ((7066644181833497070 : Rat) / 1288183727709509) [(4, 1), (10, 1), (11, 3), (14, 1), (15, 1)],
  term ((-3533322090916748535 : Rat) / 1288183727709509) [(4, 1), (10, 1), (11, 3), (14, 2), (15, 1)],
  term ((-3533322090916748535 : Rat) / 1288183727709509) [(4, 1), (10, 1), (11, 3), (15, 3)],
  term ((2898836376 : Rat) / 8578069) [(4, 1), (10, 1), (14, 1), (15, 2)],
  term ((-1449418188 : Rat) / 8578069) [(4, 1), (10, 1), (14, 2), (15, 2)],
  term ((-1449418188 : Rat) / 8578069) [(4, 1), (10, 1), (15, 4)],
  term ((-3593174400 : Rat) / 8833633) [(4, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((1796587200 : Rat) / 8833633) [(4, 1), (11, 1), (12, 1), (13, 1), (14, 2)],
  term ((1796587200 : Rat) / 8833633) [(4, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((123524193600 : Rat) / 150171761) [(4, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-61762096800 : Rat) / 150171761) [(4, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-61762096800 : Rat) / 150171761) [(4, 1), (11, 1), (12, 1), (15, 3)],
  term ((-183839517200 : Rat) / 150171761) [(4, 1), (11, 1), (13, 1), (14, 1)],
  term ((10891776600 : Rat) / 150171761) [(4, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((70136205400 : Rat) / 150171761) [(4, 1), (11, 1), (13, 1), (14, 2)],
  term ((10891776600 : Rat) / 150171761) [(4, 1), (11, 1), (13, 1), (14, 3)],
  term ((91919758600 : Rat) / 150171761) [(4, 1), (11, 1), (13, 1), (15, 2)],
  term ((85597250585865724 : Rat) / 1288183727709509) [(4, 1), (11, 1), (14, 1), (15, 1)],
  term ((17472879112412534 : Rat) / 1288183727709509) [(4, 1), (11, 1), (14, 1), (15, 3)],
  term ((-77744383517757930 : Rat) / 1288183727709509) [(4, 1), (11, 1), (14, 2), (15, 1)],
  term ((17472879112412534 : Rat) / 1288183727709509) [(4, 1), (11, 1), (14, 3), (15, 1)],
  term ((-42798625292932862 : Rat) / 1288183727709509) [(4, 1), (11, 1), (15, 3)],
  term ((-173083836105260280 : Rat) / 75775513394677) [(4, 1), (11, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((86541918052630140 : Rat) / 75775513394677) [(4, 1), (11, 2), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((86541918052630140 : Rat) / 75775513394677) [(4, 1), (11, 2), (12, 1), (13, 1), (15, 3)],
  term ((693650505780 : Rat) / 150171761) [(4, 1), (11, 2), (12, 1), (14, 1), (15, 2)],
  term ((-346825252890 : Rat) / 150171761) [(4, 1), (11, 2), (12, 1), (14, 2), (15, 2)],
  term ((-346825252890 : Rat) / 150171761) [(4, 1), (11, 2), (12, 1), (15, 4)],
  term ((1049317548254551215 : Rat) / 2576367455419018) [(4, 1), (11, 2), (13, 1), (14, 1), (15, 3)],
  term ((-1049317548254551215 : Rat) / 1288183727709509) [(4, 1), (11, 2), (13, 1), (14, 2), (15, 1)],
  term ((1049317548254551215 : Rat) / 2576367455419018) [(4, 1), (11, 2), (13, 1), (14, 3), (15, 1)],
  term ((223651263600 : Rat) / 150171761) [(4, 1), (11, 2), (14, 1)],
  term ((-111825631800 : Rat) / 150171761) [(4, 1), (11, 2), (14, 2)],
  term ((-111825631800 : Rat) / 150171761) [(4, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 5, terms 300 through 399. -/
theorem rs_R013_ueqv_R013YNNN_block_05_0300_0399_valid :
    checkProductSumEq rs_R013_ueqv_R013YNNN_partials_05_0300_0399
      rs_R013_ueqv_R013YNNN_block_05_0300_0399 = true := by
  native_decide

end R013UeqvR013YNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
