/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R007:u=v:R007NY, term block 16:500-599

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R007UeqvR007NYTermShards

/-- Generator polynomial 16 for relaxed split surplus certificate `R007:u=v:R007NY`. -/
def rs_R007_ueqv_R007NY_generator_16_0500_0599 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(6, 1)]
]

/-- Coefficient term 500 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0500 : Poly :=
[
  term ((100784493098877911007535 : Rat) / 944793217079644179807) [(3, 1), (8, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 500 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0500 : Poly :=
[
  term ((201568986197755822015070 : Rat) / 944793217079644179807) [(3, 1), (6, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((-100784493098877911007535 : Rat) / 944793217079644179807) [(3, 1), (8, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 500 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0500_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0500
        rs_R007_ueqv_R007NY_generator_16_0500_0599 =
      rs_R007_ueqv_R007NY_partial_16_0500 := by
  native_decide

/-- Coefficient term 501 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0501 : Poly :=
[
  term ((-20156898619775582201507 : Rat) / 314931072359881393269) [(3, 1), (8, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 501 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0501 : Poly :=
[
  term ((-40313797239551164403014 : Rat) / 314931072359881393269) [(3, 1), (6, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((20156898619775582201507 : Rat) / 314931072359881393269) [(3, 1), (8, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 501 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0501_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0501
        rs_R007_ueqv_R007NY_generator_16_0500_0599 =
      rs_R007_ueqv_R007NY_partial_16_0501 := by
  native_decide

/-- Coefficient term 502 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0502 : Poly :=
[
  term ((-135737460150381118510 : Rat) / 44990153194268770467) [(3, 1), (8, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 502 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0502 : Poly :=
[
  term ((-271474920300762237020 : Rat) / 44990153194268770467) [(3, 1), (6, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((135737460150381118510 : Rat) / 44990153194268770467) [(3, 1), (8, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 502 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0502_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0502
        rs_R007_ueqv_R007NY_generator_16_0500_0599 =
      rs_R007_ueqv_R007NY_partial_16_0502 := by
  native_decide

/-- Coefficient term 503 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0503 : Poly :=
[
  term ((18870258760392817072405 : Rat) / 209954048239920928846) [(3, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 503 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0503 : Poly :=
[
  term ((18870258760392817072405 : Rat) / 104977024119960464423) [(3, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((-18870258760392817072405 : Rat) / 209954048239920928846) [(3, 1), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 503 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0503_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0503
        rs_R007_ueqv_R007NY_generator_16_0500_0599 =
      rs_R007_ueqv_R007NY_partial_16_0503 := by
  native_decide

/-- Coefficient term 504 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0504 : Poly :=
[
  term ((27147492030076223702 : Rat) / 14996717731422923489) [(3, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 504 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0504 : Poly :=
[
  term ((54294984060152447404 : Rat) / 14996717731422923489) [(3, 1), (6, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-27147492030076223702 : Rat) / 14996717731422923489) [(3, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 504 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0504_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0504
        rs_R007_ueqv_R007NY_generator_16_0500_0599 =
      rs_R007_ueqv_R007NY_partial_16_0504 := by
  native_decide

/-- Coefficient term 505 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0505 : Poly :=
[
  term ((-11322155256235690243443 : Rat) / 209954048239920928846) [(3, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 505 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0505 : Poly :=
[
  term ((-11322155256235690243443 : Rat) / 104977024119960464423) [(3, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((11322155256235690243443 : Rat) / 209954048239920928846) [(3, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 505 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0505_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0505
        rs_R007_ueqv_R007NY_generator_16_0500_0599 =
      rs_R007_ueqv_R007NY_partial_16_0505 := by
  native_decide

/-- Coefficient term 506 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0506 : Poly :=
[
  term ((-57719325446763640280995 : Rat) / 944793217079644179807) [(3, 1), (10, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 506 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0506 : Poly :=
[
  term ((-115438650893527280561990 : Rat) / 944793217079644179807) [(3, 1), (6, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((57719325446763640280995 : Rat) / 944793217079644179807) [(3, 1), (10, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 506 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0506_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0506
        rs_R007_ueqv_R007NY_generator_16_0500_0599 =
      rs_R007_ueqv_R007NY_partial_16_0506 := by
  native_decide

/-- Coefficient term 507 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0507 : Poly :=
[
  term ((19827601053650260123090 : Rat) / 104977024119960464423) [(3, 1), (10, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 507 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0507 : Poly :=
[
  term ((39655202107300520246180 : Rat) / 104977024119960464423) [(3, 1), (6, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-19827601053650260123090 : Rat) / 104977024119960464423) [(3, 1), (10, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 507 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0507_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0507
        rs_R007_ueqv_R007NY_generator_16_0500_0599 =
      rs_R007_ueqv_R007NY_partial_16_0507 := by
  native_decide

/-- Coefficient term 508 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0508 : Poly :=
[
  term ((-223626412692223537377044 : Rat) / 944793217079644179807) [(3, 1), (10, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 508 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0508 : Poly :=
[
  term ((-447252825384447074754088 : Rat) / 944793217079644179807) [(3, 1), (6, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((223626412692223537377044 : Rat) / 944793217079644179807) [(3, 1), (10, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 508 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0508_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0508
        rs_R007_ueqv_R007NY_generator_16_0500_0599 =
      rs_R007_ueqv_R007NY_partial_16_0508 := by
  native_decide

/-- Coefficient term 509 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0509 : Poly :=
[
  term ((853633811778749201296735 : Rat) / 3779172868318576719228) [(3, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 509 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0509 : Poly :=
[
  term ((853633811778749201296735 : Rat) / 1889586434159288359614) [(3, 1), (6, 1), (10, 1), (11, 1), (16, 1)],
  term ((-853633811778749201296735 : Rat) / 3779172868318576719228) [(3, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 509 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0509_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0509
        rs_R007_ueqv_R007NY_generator_16_0500_0599 =
      rs_R007_ueqv_R007NY_partial_16_0509 := by
  native_decide

/-- Coefficient term 510 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0510 : Poly :=
[
  term ((-41888471282988417458510 : Rat) / 944793217079644179807) [(3, 1), (10, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 510 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0510 : Poly :=
[
  term ((-83776942565976834917020 : Rat) / 944793217079644179807) [(3, 1), (6, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((41888471282988417458510 : Rat) / 944793217079644179807) [(3, 1), (10, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 510 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0510_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0510
        rs_R007_ueqv_R007NY_generator_16_0500_0599 =
      rs_R007_ueqv_R007NY_partial_16_0510 := by
  native_decide

/-- Coefficient term 511 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0511 : Poly :=
[
  term ((11543865089352728056199 : Rat) / 314931072359881393269) [(3, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 511 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0511 : Poly :=
[
  term ((23087730178705456112398 : Rat) / 314931072359881393269) [(3, 1), (6, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-11543865089352728056199 : Rat) / 314931072359881393269) [(3, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 511 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0511_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0511
        rs_R007_ueqv_R007NY_generator_16_0500_0599 =
      rs_R007_ueqv_R007NY_partial_16_0511 := by
  native_decide

/-- Coefficient term 512 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0512 : Poly :=
[
  term ((-11896560632190156073854 : Rat) / 104977024119960464423) [(3, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 512 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0512 : Poly :=
[
  term ((-23793121264380312147708 : Rat) / 104977024119960464423) [(3, 1), (6, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((11896560632190156073854 : Rat) / 104977024119960464423) [(3, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 512 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0512_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0512
        rs_R007_ueqv_R007NY_generator_16_0500_0599 =
      rs_R007_ueqv_R007NY_partial_16_0512 := by
  native_decide

/-- Coefficient term 513 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0513 : Poly :=
[
  term ((-170726762355749840259347 : Rat) / 1259724289439525573076) [(3, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 513 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0513 : Poly :=
[
  term ((-170726762355749840259347 : Rat) / 629862144719762786538) [(3, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((170726762355749840259347 : Rat) / 1259724289439525573076) [(3, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 513 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0513_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0513
        rs_R007_ueqv_R007NY_generator_16_0500_0599 =
      rs_R007_ueqv_R007NY_partial_16_0513 := by
  native_decide

/-- Coefficient term 514 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0514 : Poly :=
[
  term ((49751899092403317570430 : Rat) / 314931072359881393269) [(3, 1), (10, 1), (15, 3), (16, 1)]
]

/-- Partial product 514 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0514 : Poly :=
[
  term ((99503798184806635140860 : Rat) / 314931072359881393269) [(3, 1), (6, 1), (10, 1), (15, 3), (16, 1)],
  term ((-49751899092403317570430 : Rat) / 314931072359881393269) [(3, 1), (10, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 514 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0514_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0514
        rs_R007_ueqv_R007NY_generator_16_0500_0599 =
      rs_R007_ueqv_R007NY_partial_16_0514 := by
  native_decide

/-- Coefficient term 515 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0515 : Poly :=
[
  term ((-20944235641494208729255 : Rat) / 629862144719762786538) [(3, 1), (10, 2), (11, 1), (16, 1)]
]

/-- Partial product 515 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0515 : Poly :=
[
  term ((-20944235641494208729255 : Rat) / 314931072359881393269) [(3, 1), (6, 1), (10, 2), (11, 1), (16, 1)],
  term ((20944235641494208729255 : Rat) / 629862144719762786538) [(3, 1), (10, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 515 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0515_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0515
        rs_R007_ueqv_R007NY_generator_16_0500_0599 =
      rs_R007_ueqv_R007NY_partial_16_0515 := by
  native_decide

/-- Coefficient term 516 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0516 : Poly :=
[
  term ((4188847128298841745851 : Rat) / 209954048239920928846) [(3, 1), (10, 2), (15, 1), (16, 1)]
]

/-- Partial product 516 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0516 : Poly :=
[
  term ((4188847128298841745851 : Rat) / 104977024119960464423) [(3, 1), (6, 1), (10, 2), (15, 1), (16, 1)],
  term ((-4188847128298841745851 : Rat) / 209954048239920928846) [(3, 1), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 516 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0516_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0516
        rs_R007_ueqv_R007NY_generator_16_0500_0599 =
      rs_R007_ueqv_R007NY_partial_16_0516 := by
  native_decide

/-- Coefficient term 517 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0517 : Poly :=
[
  term ((864451638997170129687205 : Rat) / 3779172868318576719228) [(3, 1), (11, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 517 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0517 : Poly :=
[
  term ((864451638997170129687205 : Rat) / 1889586434159288359614) [(3, 1), (6, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-864451638997170129687205 : Rat) / 3779172868318576719228) [(3, 1), (11, 1), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 517 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0517_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0517
        rs_R007_ueqv_R007NY_generator_16_0500_0599 =
      rs_R007_ueqv_R007NY_partial_16_0517 := by
  native_decide

/-- Coefficient term 518 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0518 : Poly :=
[
  term ((26711289640800691592215 : Rat) / 944793217079644179807) [(3, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 518 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0518 : Poly :=
[
  term ((53422579281601383184430 : Rat) / 944793217079644179807) [(3, 1), (6, 1), (11, 1), (12, 1), (16, 1)],
  term ((-26711289640800691592215 : Rat) / 944793217079644179807) [(3, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 518 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0518_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0518
        rs_R007_ueqv_R007NY_generator_16_0500_0599 =
      rs_R007_ueqv_R007NY_partial_16_0518 := by
  native_decide

/-- Coefficient term 519 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0519 : Poly :=
[
  term ((-7100176550521443036800 : Rat) / 19281494226115187343) [(3, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 519 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0519 : Poly :=
[
  term ((-14200353101042886073600 : Rat) / 19281494226115187343) [(3, 1), (6, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 19281494226115187343) [(3, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 519 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0519_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0519
        rs_R007_ueqv_R007NY_generator_16_0500_0599 =
      rs_R007_ueqv_R007NY_partial_16_0519 := by
  native_decide

/-- Coefficient term 520 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0520 : Poly :=
[
  term ((84935950587050752584400 : Rat) / 944793217079644179807) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 520 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0520 : Poly :=
[
  term ((169871901174101505168800 : Rat) / 944793217079644179807) [(3, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-84935950587050752584400 : Rat) / 944793217079644179807) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 520 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0520_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0520
        rs_R007_ueqv_R007NY_generator_16_0500_0599 =
      rs_R007_ueqv_R007NY_partial_16_0520 := by
  native_decide

/-- Coefficient term 521 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0521 : Poly :=
[
  term ((7100176550521443036800 : Rat) / 134970459582806311401) [(3, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 521 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0521 : Poly :=
[
  term ((14200353101042886073600 : Rat) / 134970459582806311401) [(3, 1), (6, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(3, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 521 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0521_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0521
        rs_R007_ueqv_R007NY_generator_16_0500_0599 =
      rs_R007_ueqv_R007NY_partial_16_0521 := by
  native_decide

/-- Coefficient term 522 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0522 : Poly :=
[
  term ((-3550088275260721518400 : Rat) / 134970459582806311401) [(3, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 522 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0522 : Poly :=
[
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(3, 1), (6, 1), (11, 1), (13, 2), (16, 1)],
  term ((3550088275260721518400 : Rat) / 134970459582806311401) [(3, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 522 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0522_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0522
        rs_R007_ueqv_R007NY_generator_16_0500_0599 =
      rs_R007_ueqv_R007NY_partial_16_0522 := by
  native_decide

/-- Coefficient term 523 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0523 : Poly :=
[
  term ((81066579038598020573485 : Rat) / 269940919165612622802) [(3, 1), (11, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 523 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0523 : Poly :=
[
  term ((81066579038598020573485 : Rat) / 134970459582806311401) [(3, 1), (6, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-81066579038598020573485 : Rat) / 269940919165612622802) [(3, 1), (11, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 523 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0523_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0523
        rs_R007_ueqv_R007NY_generator_16_0500_0599 =
      rs_R007_ueqv_R007NY_partial_16_0523 := by
  native_decide

/-- Coefficient term 524 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0524 : Poly :=
[
  term ((-1231947469333442661915025 : Rat) / 7558345736637153438456) [(3, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 524 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0524 : Poly :=
[
  term ((-1231947469333442661915025 : Rat) / 3779172868318576719228) [(3, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((1231947469333442661915025 : Rat) / 7558345736637153438456) [(3, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 524 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0524_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0524
        rs_R007_ueqv_R007NY_generator_16_0500_0599 =
      rs_R007_ueqv_R007NY_partial_16_0524 := by
  native_decide

/-- Coefficient term 525 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0525 : Poly :=
[
  term ((-109477222932483602855 : Rat) / 4531382336113401342) [(3, 1), (11, 1), (14, 2), (16, 1)]
]

/-- Partial product 525 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0525 : Poly :=
[
  term ((-109477222932483602855 : Rat) / 2265691168056700671) [(3, 1), (6, 1), (11, 1), (14, 2), (16, 1)],
  term ((109477222932483602855 : Rat) / 4531382336113401342) [(3, 1), (11, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 525 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0525_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0525
        rs_R007_ueqv_R007NY_generator_16_0500_0599 =
      rs_R007_ueqv_R007NY_partial_16_0525 := by
  native_decide

/-- Coefficient term 526 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0526 : Poly :=
[
  term ((491656423605717141358255 : Rat) / 1889586434159288359614) [(3, 1), (11, 1), (14, 3), (16, 1)]
]

/-- Partial product 526 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0526 : Poly :=
[
  term ((491656423605717141358255 : Rat) / 944793217079644179807) [(3, 1), (6, 1), (11, 1), (14, 3), (16, 1)],
  term ((-491656423605717141358255 : Rat) / 1889586434159288359614) [(3, 1), (11, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 526 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0526_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0526
        rs_R007_ueqv_R007NY_generator_16_0500_0599 =
      rs_R007_ueqv_R007NY_partial_16_0526 := by
  native_decide

/-- Coefficient term 527 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0527 : Poly :=
[
  term ((-54089543066360453463557 : Rat) / 444608572743361966968) [(3, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 527 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0527 : Poly :=
[
  term ((-54089543066360453463557 : Rat) / 222304286371680983484) [(3, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((54089543066360453463557 : Rat) / 444608572743361966968) [(3, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 527 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0527_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0527
        rs_R007_ueqv_R007NY_generator_16_0500_0599 =
      rs_R007_ueqv_R007NY_partial_16_0527 := by
  native_decide

/-- Coefficient term 528 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0528 : Poly :=
[
  term ((11036814903973679754320 : Rat) / 944793217079644179807) [(3, 1), (11, 1), (16, 1)]
]

/-- Partial product 528 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0528 : Poly :=
[
  term ((22073629807947359508640 : Rat) / 944793217079644179807) [(3, 1), (6, 1), (11, 1), (16, 1)],
  term ((-11036814903973679754320 : Rat) / 944793217079644179807) [(3, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 528 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0528_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0528
        rs_R007_ueqv_R007NY_generator_16_0500_0599 =
      rs_R007_ueqv_R007NY_partial_16_0528 := by
  native_decide

/-- Coefficient term 529 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0529 : Poly :=
[
  term ((184309273645149036817444 : Rat) / 944793217079644179807) [(3, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 529 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0529 : Poly :=
[
  term ((368618547290298073634888 : Rat) / 944793217079644179807) [(3, 1), (6, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-184309273645149036817444 : Rat) / 944793217079644179807) [(3, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 529 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0529_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0529
        rs_R007_ueqv_R007NY_generator_16_0500_0599 =
      rs_R007_ueqv_R007NY_partial_16_0529 := by
  native_decide

/-- Coefficient term 530 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0530 : Poly :=
[
  term ((-4188847128298841745851 : Rat) / 51069903625926712422) [(3, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 530 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0530 : Poly :=
[
  term ((-4188847128298841745851 : Rat) / 25534951812963356211) [(3, 1), (6, 1), (11, 2), (15, 1), (16, 1)],
  term ((4188847128298841745851 : Rat) / 51069903625926712422) [(3, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 530 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0530_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0530
        rs_R007_ueqv_R007NY_generator_16_0500_0599 =
      rs_R007_ueqv_R007NY_partial_16_0530 := by
  native_decide

/-- Coefficient term 531 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0531 : Poly :=
[
  term ((41888471282988417458510 : Rat) / 944793217079644179807) [(3, 1), (11, 3), (14, 1), (16, 1)]
]

/-- Partial product 531 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0531 : Poly :=
[
  term ((83776942565976834917020 : Rat) / 944793217079644179807) [(3, 1), (6, 1), (11, 3), (14, 1), (16, 1)],
  term ((-41888471282988417458510 : Rat) / 944793217079644179807) [(3, 1), (11, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 531 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0531_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0531
        rs_R007_ueqv_R007NY_generator_16_0500_0599 =
      rs_R007_ueqv_R007NY_partial_16_0531 := by
  native_decide

/-- Coefficient term 532 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0532 : Poly :=
[
  term ((-20944235641494208729255 : Rat) / 1889586434159288359614) [(3, 1), (11, 3), (16, 1)]
]

/-- Partial product 532 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0532 : Poly :=
[
  term ((-20944235641494208729255 : Rat) / 944793217079644179807) [(3, 1), (6, 1), (11, 3), (16, 1)],
  term ((20944235641494208729255 : Rat) / 1889586434159288359614) [(3, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 532 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0532_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0532
        rs_R007_ueqv_R007NY_generator_16_0500_0599 =
      rs_R007_ueqv_R007NY_partial_16_0532 := by
  native_decide

/-- Coefficient term 533 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0533 : Poly :=
[
  term ((-172890327799434025937441 : Rat) / 1259724289439525573076) [(3, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 533 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0533 : Poly :=
[
  term ((-172890327799434025937441 : Rat) / 629862144719762786538) [(3, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((172890327799434025937441 : Rat) / 1259724289439525573076) [(3, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 533 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0533_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0533
        rs_R007_ueqv_R007NY_generator_16_0500_0599 =
      rs_R007_ueqv_R007NY_partial_16_0533 := by
  native_decide

/-- Coefficient term 534 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0534 : Poly :=
[
  term ((-5342257928160138318443 : Rat) / 314931072359881393269) [(3, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 534 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0534 : Poly :=
[
  term ((-10684515856320276636886 : Rat) / 314931072359881393269) [(3, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((5342257928160138318443 : Rat) / 314931072359881393269) [(3, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 534 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0534_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0534
        rs_R007_ueqv_R007NY_generator_16_0500_0599 =
      rs_R007_ueqv_R007NY_partial_16_0534 := by
  native_decide

/-- Coefficient term 535 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0535 : Poly :=
[
  term ((1420035310104288607360 : Rat) / 6427164742038395781) [(3, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 535 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0535 : Poly :=
[
  term ((2840070620208577214720 : Rat) / 6427164742038395781) [(3, 1), (6, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 6427164742038395781) [(3, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 535 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0535_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0535
        rs_R007_ueqv_R007NY_generator_16_0500_0599 =
      rs_R007_ueqv_R007NY_partial_16_0535 := by
  native_decide

/-- Coefficient term 536 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0536 : Poly :=
[
  term ((-16987190117410150516880 : Rat) / 314931072359881393269) [(3, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 536 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0536 : Poly :=
[
  term ((-33974380234820301033760 : Rat) / 314931072359881393269) [(3, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((16987190117410150516880 : Rat) / 314931072359881393269) [(3, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 536 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0536_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0536
        rs_R007_ueqv_R007NY_generator_16_0500_0599 =
      rs_R007_ueqv_R007NY_partial_16_0536 := by
  native_decide

/-- Coefficient term 537 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0537 : Poly :=
[
  term ((-1420035310104288607360 : Rat) / 44990153194268770467) [(3, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 537 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0537 : Poly :=
[
  term ((-2840070620208577214720 : Rat) / 44990153194268770467) [(3, 1), (6, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(3, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 537 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0537_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0537
        rs_R007_ueqv_R007NY_generator_16_0500_0599 =
      rs_R007_ueqv_R007NY_partial_16_0537 := by
  native_decide

/-- Coefficient term 538 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0538 : Poly :=
[
  term ((710017655052144303680 : Rat) / 44990153194268770467) [(3, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 538 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0538 : Poly :=
[
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(3, 1), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((-710017655052144303680 : Rat) / 44990153194268770467) [(3, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 538 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0538_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0538
        rs_R007_ueqv_R007NY_generator_16_0500_0599 =
      rs_R007_ueqv_R007NY_partial_16_0538 := by
  native_decide

/-- Coefficient term 539 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0539 : Poly :=
[
  term ((253108023410366002106077 : Rat) / 2519448578879051146152) [(3, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 539 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0539 : Poly :=
[
  term ((253108023410366002106077 : Rat) / 1259724289439525573076) [(3, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-253108023410366002106077 : Rat) / 2519448578879051146152) [(3, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 539 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0539_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0539
        rs_R007_ueqv_R007NY_generator_16_0500_0599 =
      rs_R007_ueqv_R007NY_partial_16_0539 := by
  native_decide

/-- Coefficient term 540 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0540 : Poly :=
[
  term ((-163759376193623329753091 : Rat) / 629862144719762786538) [(3, 1), (14, 1), (15, 3), (16, 1)]
]

/-- Partial product 540 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0540 : Poly :=
[
  term ((-163759376193623329753091 : Rat) / 314931072359881393269) [(3, 1), (6, 1), (14, 1), (15, 3), (16, 1)],
  term ((163759376193623329753091 : Rat) / 629862144719762786538) [(3, 1), (14, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 540 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0540_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0540
        rs_R007_ueqv_R007NY_generator_16_0500_0599 =
      rs_R007_ueqv_R007NY_partial_16_0540 := by
  native_decide

/-- Coefficient term 541 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0541 : Poly :=
[
  term ((21895444586496720571 : Rat) / 1510460778704467114) [(3, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 541 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0541 : Poly :=
[
  term ((21895444586496720571 : Rat) / 755230389352233557) [(3, 1), (6, 1), (14, 2), (15, 1), (16, 1)],
  term ((-21895444586496720571 : Rat) / 1510460778704467114) [(3, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 541 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0541_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0541
        rs_R007_ueqv_R007NY_generator_16_0500_0599 =
      rs_R007_ueqv_R007NY_partial_16_0541 := by
  native_decide

/-- Coefficient term 542 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0542 : Poly :=
[
  term ((-98331284721143428271651 : Rat) / 629862144719762786538) [(3, 1), (14, 3), (15, 1), (16, 1)]
]

/-- Partial product 542 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0542 : Poly :=
[
  term ((-98331284721143428271651 : Rat) / 314931072359881393269) [(3, 1), (6, 1), (14, 3), (15, 1), (16, 1)],
  term ((98331284721143428271651 : Rat) / 629862144719762786538) [(3, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 542 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0542_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0542
        rs_R007_ueqv_R007NY_generator_16_0500_0599 =
      rs_R007_ueqv_R007NY_partial_16_0542 := by
  native_decide

/-- Coefficient term 543 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0543 : Poly :=
[
  term ((-5359519178669116081535 : Rat) / 629862144719762786538) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 543 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0543 : Poly :=
[
  term ((-5359519178669116081535 : Rat) / 314931072359881393269) [(3, 1), (6, 1), (15, 1), (16, 1)],
  term ((5359519178669116081535 : Rat) / 629862144719762786538) [(3, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 543 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0543_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0543
        rs_R007_ueqv_R007NY_generator_16_0500_0599 =
      rs_R007_ueqv_R007NY_partial_16_0543 := by
  native_decide

/-- Coefficient term 544 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0544 : Poly :=
[
  term ((264330311288963303296433 : Rat) / 2519448578879051146152) [(3, 1), (15, 3), (16, 1)]
]

/-- Partial product 544 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0544 : Poly :=
[
  term ((264330311288963303296433 : Rat) / 1259724289439525573076) [(3, 1), (6, 1), (15, 3), (16, 1)],
  term ((-264330311288963303296433 : Rat) / 2519448578879051146152) [(3, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 544 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0544_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0544
        rs_R007_ueqv_R007NY_generator_16_0500_0599 =
      rs_R007_ueqv_R007NY_partial_16_0544 := by
  native_decide

/-- Coefficient term 545 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0545 : Poly :=
[
  term ((35500882752607215184000 : Rat) / 134970459582806311401) [(3, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 545 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0545 : Poly :=
[
  term ((71001765505214430368000 : Rat) / 134970459582806311401) [(3, 2), (6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-35500882752607215184000 : Rat) / 134970459582806311401) [(3, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 545 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0545_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0545
        rs_R007_ueqv_R007NY_generator_16_0500_0599 =
      rs_R007_ueqv_R007NY_partial_16_0545 := by
  native_decide

/-- Coefficient term 546 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0546 : Poly :=
[
  term ((-35500882752607215184000 : Rat) / 134970459582806311401) [(3, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 546 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0546 : Poly :=
[
  term ((-71001765505214430368000 : Rat) / 134970459582806311401) [(3, 2), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((35500882752607215184000 : Rat) / 134970459582806311401) [(3, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 546 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0546_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0546
        rs_R007_ueqv_R007NY_generator_16_0500_0599 =
      rs_R007_ueqv_R007NY_partial_16_0546 := by
  native_decide

/-- Coefficient term 547 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0547 : Poly :=
[
  term ((-39317139047074500559600 : Rat) / 944793217079644179807) [(3, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 547 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0547 : Poly :=
[
  term ((-78634278094149001119200 : Rat) / 944793217079644179807) [(3, 2), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(3, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 547 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0547_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0547
        rs_R007_ueqv_R007NY_generator_16_0500_0599 =
      rs_R007_ueqv_R007NY_partial_16_0547 := by
  native_decide

/-- Coefficient term 548 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0548 : Poly :=
[
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(3, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 548 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0548 : Poly :=
[
  term ((78634278094149001119200 : Rat) / 944793217079644179807) [(3, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-39317139047074500559600 : Rat) / 944793217079644179807) [(3, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 548 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0548_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0548
        rs_R007_ueqv_R007NY_generator_16_0500_0599 =
      rs_R007_ueqv_R007NY_partial_16_0548 := by
  native_decide

/-- Coefficient term 549 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0549 : Poly :=
[
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(3, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 549 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0549 : Poly :=
[
  term ((-14200353101042886073600 : Rat) / 44990153194268770467) [(3, 2), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(3, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 549 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0549_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0549
        rs_R007_ueqv_R007NY_generator_16_0500_0599 =
      rs_R007_ueqv_R007NY_partial_16_0549 := by
  native_decide

/-- Coefficient term 550 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0550 : Poly :=
[
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(3, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 550 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0550 : Poly :=
[
  term ((14200353101042886073600 : Rat) / 44990153194268770467) [(3, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(3, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 550 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0550_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0550
        rs_R007_ueqv_R007NY_generator_16_0500_0599 =
      rs_R007_ueqv_R007NY_partial_16_0550 := by
  native_decide

/-- Coefficient term 551 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0551 : Poly :=
[
  term ((7863427809414900111920 : Rat) / 314931072359881393269) [(3, 2), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 551 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0551 : Poly :=
[
  term ((15726855618829800223840 : Rat) / 314931072359881393269) [(3, 2), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-7863427809414900111920 : Rat) / 314931072359881393269) [(3, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 551 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0551_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0551
        rs_R007_ueqv_R007NY_generator_16_0500_0599 =
      rs_R007_ueqv_R007NY_partial_16_0551 := by
  native_decide

/-- Coefficient term 552 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0552 : Poly :=
[
  term ((-7863427809414900111920 : Rat) / 314931072359881393269) [(3, 2), (15, 2), (16, 1)]
]

/-- Partial product 552 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0552 : Poly :=
[
  term ((-15726855618829800223840 : Rat) / 314931072359881393269) [(3, 2), (6, 1), (15, 2), (16, 1)],
  term ((7863427809414900111920 : Rat) / 314931072359881393269) [(3, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 552 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0552_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0552
        rs_R007_ueqv_R007NY_generator_16_0500_0599 =
      rs_R007_ueqv_R007NY_partial_16_0552 := by
  native_decide

/-- Coefficient term 553 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0553 : Poly :=
[
  term ((34010450733643947758025 : Rat) / 209954048239920928846) [(4, 1), (5, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 553 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0553 : Poly :=
[
  term ((34010450733643947758025 : Rat) / 104977024119960464423) [(4, 1), (5, 1), (6, 1), (11, 1), (12, 1), (16, 1)],
  term ((-34010450733643947758025 : Rat) / 209954048239920928846) [(4, 1), (5, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 553 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0553_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0553
        rs_R007_ueqv_R007NY_generator_16_0500_0599 =
      rs_R007_ueqv_R007NY_partial_16_0553 := by
  native_decide

/-- Coefficient term 554 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0554 : Poly :=
[
  term ((-44681062481013498721145 : Rat) / 222304286371680983484) [(4, 1), (5, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 554 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0554 : Poly :=
[
  term ((-44681062481013498721145 : Rat) / 111152143185840491742) [(4, 1), (5, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((44681062481013498721145 : Rat) / 222304286371680983484) [(4, 1), (5, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 554 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0554_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0554
        rs_R007_ueqv_R007NY_generator_16_0500_0599 =
      rs_R007_ueqv_R007NY_partial_16_0554 := by
  native_decide

/-- Coefficient term 555 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0555 : Poly :=
[
  term ((-20406270440186368654815 : Rat) / 209954048239920928846) [(4, 1), (5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 555 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0555 : Poly :=
[
  term ((-20406270440186368654815 : Rat) / 104977024119960464423) [(4, 1), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((20406270440186368654815 : Rat) / 209954048239920928846) [(4, 1), (5, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 555 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0555_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0555
        rs_R007_ueqv_R007NY_generator_16_0500_0599 =
      rs_R007_ueqv_R007NY_partial_16_0555 := by
  native_decide

/-- Coefficient term 556 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0556 : Poly :=
[
  term ((8936212496202699744229 : Rat) / 74101428790560327828) [(4, 1), (5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 556 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0556 : Poly :=
[
  term ((8936212496202699744229 : Rat) / 37050714395280163914) [(4, 1), (5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8936212496202699744229 : Rat) / 74101428790560327828) [(4, 1), (5, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 556 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0556_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0556
        rs_R007_ueqv_R007NY_generator_16_0500_0599 =
      rs_R007_ueqv_R007NY_partial_16_0556 := by
  native_decide

/-- Coefficient term 557 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0557 : Poly :=
[
  term ((-7863427809414900111920 : Rat) / 944793217079644179807) [(4, 1), (6, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 557 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0557 : Poly :=
[
  term ((7863427809414900111920 : Rat) / 944793217079644179807) [(4, 1), (6, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-15726855618829800223840 : Rat) / 944793217079644179807) [(4, 1), (6, 2), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 557 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0557_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0557
        rs_R007_ueqv_R007NY_generator_16_0500_0599 =
      rs_R007_ueqv_R007NY_partial_16_0557 := by
  native_decide

/-- Coefficient term 558 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0558 : Poly :=
[
  term ((4914642380884312569950 : Rat) / 944793217079644179807) [(4, 1), (6, 1), (10, 1), (11, 2), (16, 1)]
]

/-- Partial product 558 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0558 : Poly :=
[
  term ((-4914642380884312569950 : Rat) / 944793217079644179807) [(4, 1), (6, 1), (10, 1), (11, 2), (16, 1)],
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(4, 1), (6, 2), (10, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 558 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0558_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0558
        rs_R007_ueqv_R007NY_generator_16_0500_0599 =
      rs_R007_ueqv_R007NY_partial_16_0558 := by
  native_decide

/-- Coefficient term 559 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0559 : Poly :=
[
  term ((982928476176862513990 : Rat) / 314931072359881393269) [(4, 1), (6, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 559 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0559 : Poly :=
[
  term ((-982928476176862513990 : Rat) / 314931072359881393269) [(4, 1), (6, 1), (10, 1), (15, 2), (16, 1)],
  term ((1965856952353725027980 : Rat) / 314931072359881393269) [(4, 1), (6, 2), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 559 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0559_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0559
        rs_R007_ueqv_R007NY_generator_16_0500_0599 =
      rs_R007_ueqv_R007NY_partial_16_0559 := by
  native_decide

/-- Coefficient term 560 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0560 : Poly :=
[
  term ((272938280898139989559088 : Rat) / 314931072359881393269) [(4, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 560 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0560 : Poly :=
[
  term ((-272938280898139989559088 : Rat) / 314931072359881393269) [(4, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((545876561796279979118176 : Rat) / 314931072359881393269) [(4, 1), (6, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 560 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0560_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0560
        rs_R007_ueqv_R007NY_generator_16_0500_0599 =
      rs_R007_ueqv_R007NY_partial_16_0560 := by
  native_decide

/-- Coefficient term 561 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0561 : Poly :=
[
  term ((-259269581950970142209947 : Rat) / 314931072359881393269) [(4, 1), (6, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 561 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0561 : Poly :=
[
  term ((259269581950970142209947 : Rat) / 314931072359881393269) [(4, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-518539163901940284419894 : Rat) / 314931072359881393269) [(4, 1), (6, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 561 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0561_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0561
        rs_R007_ueqv_R007NY_generator_16_0500_0599 =
      rs_R007_ueqv_R007NY_partial_16_0561 := by
  native_decide

/-- Coefficient term 562 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0562 : Poly :=
[
  term ((-647726097490564268053090 : Rat) / 944793217079644179807) [(4, 1), (6, 1), (11, 2), (14, 1), (16, 1)]
]

/-- Partial product 562 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0562 : Poly :=
[
  term ((647726097490564268053090 : Rat) / 944793217079644179807) [(4, 1), (6, 1), (11, 2), (14, 1), (16, 1)],
  term ((-1295452194981128536106180 : Rat) / 944793217079644179807) [(4, 1), (6, 2), (11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 562 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0562_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0562
        rs_R007_ueqv_R007NY_generator_16_0500_0599 =
      rs_R007_ueqv_R007NY_partial_16_0562 := by
  native_decide

/-- Coefficient term 563 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0563 : Poly :=
[
  term ((103387324493161324946105 : Rat) / 209954048239920928846) [(4, 1), (6, 1), (11, 2), (16, 1)]
]

/-- Partial product 563 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0563 : Poly :=
[
  term ((-103387324493161324946105 : Rat) / 209954048239920928846) [(4, 1), (6, 1), (11, 2), (16, 1)],
  term ((103387324493161324946105 : Rat) / 104977024119960464423) [(4, 1), (6, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 563 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0563_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0563
        rs_R007_ueqv_R007NY_generator_16_0500_0599 =
      rs_R007_ueqv_R007NY_partial_16_0563 := by
  native_decide

/-- Coefficient term 564 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0564 : Poly :=
[
  term ((-28678612280005427189694 : Rat) / 104977024119960464423) [(4, 1), (6, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 564 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0564 : Poly :=
[
  term ((28678612280005427189694 : Rat) / 104977024119960464423) [(4, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-57357224560010854379388 : Rat) / 104977024119960464423) [(4, 1), (6, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 564 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0564_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0564
        rs_R007_ueqv_R007NY_generator_16_0500_0599 =
      rs_R007_ueqv_R007NY_partial_16_0564 := by
  native_decide

/-- Coefficient term 565 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0565 : Poly :=
[
  term ((66488395962849979903381 : Rat) / 209954048239920928846) [(4, 1), (6, 1), (15, 2), (16, 1)]
]

/-- Partial product 565 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0565 : Poly :=
[
  term ((-66488395962849979903381 : Rat) / 209954048239920928846) [(4, 1), (6, 1), (15, 2), (16, 1)],
  term ((66488395962849979903381 : Rat) / 104977024119960464423) [(4, 1), (6, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 565 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0565_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0565
        rs_R007_ueqv_R007NY_generator_16_0500_0599 =
      rs_R007_ueqv_R007NY_partial_16_0565 := by
  native_decide

/-- Coefficient term 566 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0566 : Poly :=
[
  term ((2153929834559236239680 : Rat) / 3118129429305756369) [(4, 1), (7, 1), (10, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 566 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0566 : Poly :=
[
  term ((4307859669118472479360 : Rat) / 3118129429305756369) [(4, 1), (6, 1), (7, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-2153929834559236239680 : Rat) / 3118129429305756369) [(4, 1), (7, 1), (10, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 566 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0566_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0566
        rs_R007_ueqv_R007NY_generator_16_0500_0599 =
      rs_R007_ueqv_R007NY_partial_16_0566 := by
  native_decide

/-- Coefficient term 567 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0567 : Poly :=
[
  term ((-940315205200220549654845 : Rat) / 1889586434159288359614) [(4, 1), (7, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 567 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0567 : Poly :=
[
  term ((-940315205200220549654845 : Rat) / 944793217079644179807) [(4, 1), (6, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((940315205200220549654845 : Rat) / 1889586434159288359614) [(4, 1), (7, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 567 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0567_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0567
        rs_R007_ueqv_R007NY_generator_16_0500_0599 =
      rs_R007_ueqv_R007NY_partial_16_0567 := by
  native_decide

/-- Coefficient term 568 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0568 : Poly :=
[
  term ((-430785966911847247936 : Rat) / 1039376476435252123) [(4, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 568 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0568 : Poly :=
[
  term ((-861571933823694495872 : Rat) / 1039376476435252123) [(4, 1), (6, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((430785966911847247936 : Rat) / 1039376476435252123) [(4, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 568 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0568_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0568
        rs_R007_ueqv_R007NY_generator_16_0500_0599 =
      rs_R007_ueqv_R007NY_partial_16_0568 := by
  native_decide

/-- Coefficient term 569 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0569 : Poly :=
[
  term ((188063041040044109930969 : Rat) / 629862144719762786538) [(4, 1), (7, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 569 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0569 : Poly :=
[
  term ((188063041040044109930969 : Rat) / 314931072359881393269) [(4, 1), (6, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-188063041040044109930969 : Rat) / 629862144719762786538) [(4, 1), (7, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 569 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0569_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0569
        rs_R007_ueqv_R007NY_generator_16_0500_0599 =
      rs_R007_ueqv_R007NY_partial_16_0569 := by
  native_decide

/-- Coefficient term 570 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0570 : Poly :=
[
  term ((-4914642380884312569950 : Rat) / 944793217079644179807) [(4, 1), (7, 1), (10, 2), (11, 1), (16, 1)]
]

/-- Partial product 570 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0570 : Poly :=
[
  term ((-9829284761768625139900 : Rat) / 944793217079644179807) [(4, 1), (6, 1), (7, 1), (10, 2), (11, 1), (16, 1)],
  term ((4914642380884312569950 : Rat) / 944793217079644179807) [(4, 1), (7, 1), (10, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 570 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0570_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0570
        rs_R007_ueqv_R007NY_generator_16_0500_0599 =
      rs_R007_ueqv_R007NY_partial_16_0570 := by
  native_decide

/-- Coefficient term 571 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0571 : Poly :=
[
  term ((982928476176862513990 : Rat) / 314931072359881393269) [(4, 1), (7, 1), (10, 2), (15, 1), (16, 1)]
]

/-- Partial product 571 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0571 : Poly :=
[
  term ((1965856952353725027980 : Rat) / 314931072359881393269) [(4, 1), (6, 1), (7, 1), (10, 2), (15, 1), (16, 1)],
  term ((-982928476176862513990 : Rat) / 314931072359881393269) [(4, 1), (7, 1), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 571 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0571_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0571
        rs_R007_ueqv_R007NY_generator_16_0500_0599 =
      rs_R007_ueqv_R007NY_partial_16_0571 := by
  native_decide

/-- Coefficient term 572 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0572 : Poly :=
[
  term ((88461157516329167344835 : Rat) / 89980306388537540934) [(4, 1), (7, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 572 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0572 : Poly :=
[
  term ((88461157516329167344835 : Rat) / 44990153194268770467) [(4, 1), (6, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-88461157516329167344835 : Rat) / 89980306388537540934) [(4, 1), (7, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 572 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0572_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0572
        rs_R007_ueqv_R007NY_generator_16_0500_0599 =
      rs_R007_ueqv_R007NY_partial_16_0572 := by
  native_decide

/-- Coefficient term 573 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0573 : Poly :=
[
  term ((-47797687133342378649490 : Rat) / 104977024119960464423) [(4, 1), (7, 1), (11, 1), (14, 2), (16, 1)]
]

/-- Partial product 573 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0573 : Poly :=
[
  term ((-95595374266684757298980 : Rat) / 104977024119960464423) [(4, 1), (6, 1), (7, 1), (11, 1), (14, 2), (16, 1)],
  term ((47797687133342378649490 : Rat) / 104977024119960464423) [(4, 1), (7, 1), (11, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 573 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0573_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0573
        rs_R007_ueqv_R007NY_generator_16_0500_0599 =
      rs_R007_ueqv_R007NY_partial_16_0573 := by
  native_decide

/-- Coefficient term 574 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0574 : Poly :=
[
  term ((-31937443610443010828390 : Rat) / 55576071592920245871) [(4, 1), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 574 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0574 : Poly :=
[
  term ((-63874887220886021656780 : Rat) / 55576071592920245871) [(4, 1), (6, 1), (7, 1), (11, 1), (16, 1)],
  term ((31937443610443010828390 : Rat) / 55576071592920245871) [(4, 1), (7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 574 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0574_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0574
        rs_R007_ueqv_R007NY_generator_16_0500_0599 =
      rs_R007_ueqv_R007NY_partial_16_0574 := by
  native_decide

/-- Coefficient term 575 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0575 : Poly :=
[
  term ((-17692231503265833468967 : Rat) / 29993435462845846978) [(4, 1), (7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 575 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0575 : Poly :=
[
  term ((-17692231503265833468967 : Rat) / 14996717731422923489) [(4, 1), (6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((17692231503265833468967 : Rat) / 29993435462845846978) [(4, 1), (7, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 575 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0575_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0575
        rs_R007_ueqv_R007NY_generator_16_0500_0599 =
      rs_R007_ueqv_R007NY_partial_16_0575 := by
  native_decide

/-- Coefficient term 576 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0576 : Poly :=
[
  term ((28678612280005427189694 : Rat) / 104977024119960464423) [(4, 1), (7, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 576 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0576 : Poly :=
[
  term ((57357224560010854379388 : Rat) / 104977024119960464423) [(4, 1), (6, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-28678612280005427189694 : Rat) / 104977024119960464423) [(4, 1), (7, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 576 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0576_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0576
        rs_R007_ueqv_R007NY_generator_16_0500_0599 =
      rs_R007_ueqv_R007NY_partial_16_0576 := by
  native_decide

/-- Coefficient term 577 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0577 : Poly :=
[
  term ((6387488722088602165678 : Rat) / 18525357197640081957) [(4, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 577 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0577 : Poly :=
[
  term ((12774977444177204331356 : Rat) / 18525357197640081957) [(4, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-6387488722088602165678 : Rat) / 18525357197640081957) [(4, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 577 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0577_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0577
        rs_R007_ueqv_R007NY_generator_16_0500_0599 =
      rs_R007_ueqv_R007NY_partial_16_0577 := by
  native_decide

/-- Coefficient term 578 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0578 : Poly :=
[
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(4, 1), (8, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 578 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0578 : Poly :=
[
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(4, 1), (6, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(4, 1), (8, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 578 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0578_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0578
        rs_R007_ueqv_R007NY_generator_16_0500_0599 =
      rs_R007_ueqv_R007NY_partial_16_0578 := by
  native_decide

/-- Coefficient term 579 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0579 : Poly :=
[
  term ((-30634236009570896062246 : Rat) / 944793217079644179807) [(4, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 579 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0579 : Poly :=
[
  term ((-61268472019141792124492 : Rat) / 944793217079644179807) [(4, 1), (6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((30634236009570896062246 : Rat) / 944793217079644179807) [(4, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 579 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0579_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0579
        rs_R007_ueqv_R007NY_generator_16_0500_0599 =
      rs_R007_ueqv_R007NY_partial_16_0579 := by
  native_decide

/-- Coefficient term 580 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0580 : Poly :=
[
  term ((-52257067674313277706190 : Rat) / 944793217079644179807) [(4, 1), (8, 1), (11, 2), (16, 1)]
]

/-- Partial product 580 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0580 : Poly :=
[
  term ((-104514135348626555412380 : Rat) / 944793217079644179807) [(4, 1), (6, 1), (8, 1), (11, 2), (16, 1)],
  term ((52257067674313277706190 : Rat) / 944793217079644179807) [(4, 1), (8, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 580 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0580_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0580
        rs_R007_ueqv_R007NY_generator_16_0500_0599 =
      rs_R007_ueqv_R007NY_partial_16_0580 := by
  native_decide

/-- Coefficient term 581 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0581 : Poly :=
[
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(4, 1), (8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 581 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0581 : Poly :=
[
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(4, 1), (6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(4, 1), (8, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 581 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0581_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0581
        rs_R007_ueqv_R007NY_generator_16_0500_0599 =
      rs_R007_ueqv_R007NY_partial_16_0581 := by
  native_decide

/-- Coefficient term 582 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0582 : Poly :=
[
  term ((17535636948842676856 : Rat) / 445447061329393767) [(4, 1), (8, 1), (15, 2), (16, 1)]
]

/-- Partial product 582 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0582 : Poly :=
[
  term ((35071273897685353712 : Rat) / 445447061329393767) [(4, 1), (6, 1), (8, 1), (15, 2), (16, 1)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(4, 1), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 582 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0582_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0582
        rs_R007_ueqv_R007NY_generator_16_0500_0599 =
      rs_R007_ueqv_R007NY_partial_16_0582 := by
  native_decide

/-- Coefficient term 583 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0583 : Poly :=
[
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(4, 1), (9, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 583 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0583 : Poly :=
[
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(4, 1), (6, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(4, 1), (9, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 583 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0583_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0583
        rs_R007_ueqv_R007NY_generator_16_0500_0599 =
      rs_R007_ueqv_R007NY_partial_16_0583 := by
  native_decide

/-- Coefficient term 584 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0584 : Poly :=
[
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(4, 1), (9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 584 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0584 : Poly :=
[
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(4, 1), (6, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(4, 1), (9, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 584 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0584_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0584
        rs_R007_ueqv_R007NY_generator_16_0500_0599 =
      rs_R007_ueqv_R007NY_partial_16_0584 := by
  native_decide

/-- Coefficient term 585 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0585 : Poly :=
[
  term ((17535636948842676856 : Rat) / 445447061329393767) [(4, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 585 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0585 : Poly :=
[
  term ((35071273897685353712 : Rat) / 445447061329393767) [(4, 1), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(4, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 585 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0585_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0585
        rs_R007_ueqv_R007NY_generator_16_0500_0599 =
      rs_R007_ueqv_R007NY_partial_16_0585 := by
  native_decide

/-- Coefficient term 586 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0586 : Poly :=
[
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(4, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 586 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0586 : Poly :=
[
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(4, 1), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(4, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 586 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0586_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0586
        rs_R007_ueqv_R007NY_generator_16_0500_0599 =
      rs_R007_ueqv_R007NY_partial_16_0586 := by
  native_decide

/-- Coefficient term 587 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0587 : Poly :=
[
  term ((-75856154360239256530720 : Rat) / 55576071592920245871) [(4, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 587 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0587 : Poly :=
[
  term ((-151712308720478513061440 : Rat) / 55576071592920245871) [(4, 1), (6, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((75856154360239256530720 : Rat) / 55576071592920245871) [(4, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 587 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0587_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0587
        rs_R007_ueqv_R007NY_generator_16_0500_0599 =
      rs_R007_ueqv_R007NY_partial_16_0587 := by
  native_decide

/-- Coefficient term 588 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0588 : Poly :=
[
  term ((275635296332778680427445 : Rat) / 209954048239920928846) [(4, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 588 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0588 : Poly :=
[
  term ((275635296332778680427445 : Rat) / 104977024119960464423) [(4, 1), (6, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-275635296332778680427445 : Rat) / 209954048239920928846) [(4, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 588 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0588_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0588
        rs_R007_ueqv_R007NY_generator_16_0500_0599 =
      rs_R007_ueqv_R007NY_partial_16_0588 := by
  native_decide

/-- Coefficient term 589 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0589 : Poly :=
[
  term ((-9829284761768625139900 : Rat) / 944793217079644179807) [(4, 1), (10, 1), (11, 2), (14, 1), (16, 1)]
]

/-- Partial product 589 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0589 : Poly :=
[
  term ((-19658569523537250279800 : Rat) / 944793217079644179807) [(4, 1), (6, 1), (10, 1), (11, 2), (14, 1), (16, 1)],
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(4, 1), (10, 1), (11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 589 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0589_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0589
        rs_R007_ueqv_R007NY_generator_16_0500_0599 =
      rs_R007_ueqv_R007NY_partial_16_0589 := by
  native_decide

/-- Coefficient term 590 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0590 : Poly :=
[
  term ((4914642380884312569950 : Rat) / 944793217079644179807) [(4, 1), (10, 1), (11, 2), (16, 1)]
]

/-- Partial product 590 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0590 : Poly :=
[
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(4, 1), (6, 1), (10, 1), (11, 2), (16, 1)],
  term ((-4914642380884312569950 : Rat) / 944793217079644179807) [(4, 1), (10, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 590 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0590_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0590
        rs_R007_ueqv_R007NY_generator_16_0500_0599 =
      rs_R007_ueqv_R007NY_partial_16_0590 := by
  native_decide

/-- Coefficient term 591 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0591 : Poly :=
[
  term ((259090438996225707221236 : Rat) / 314931072359881393269) [(4, 1), (10, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 591 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0591 : Poly :=
[
  term ((518180877992451414442472 : Rat) / 314931072359881393269) [(4, 1), (6, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-259090438996225707221236 : Rat) / 314931072359881393269) [(4, 1), (10, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 591 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0591_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0591
        rs_R007_ueqv_R007NY_generator_16_0500_0599 =
      rs_R007_ueqv_R007NY_partial_16_0591 := by
  native_decide

/-- Coefficient term 592 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0592 : Poly :=
[
  term ((-165774349190137953262063 : Rat) / 209954048239920928846) [(4, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 592 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0592 : Poly :=
[
  term ((-165774349190137953262063 : Rat) / 104977024119960464423) [(4, 1), (6, 1), (10, 1), (15, 2), (16, 1)],
  term ((165774349190137953262063 : Rat) / 209954048239920928846) [(4, 1), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 592 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0592_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0592
        rs_R007_ueqv_R007NY_generator_16_0500_0599 =
      rs_R007_ueqv_R007NY_partial_16_0592 := by
  native_decide

/-- Coefficient term 593 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0593 : Poly :=
[
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(4, 1), (10, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 593 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0593 : Poly :=
[
  term ((19658569523537250279800 : Rat) / 944793217079644179807) [(4, 1), (6, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-9829284761768625139900 : Rat) / 944793217079644179807) [(4, 1), (10, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 593 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0593_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0593
        rs_R007_ueqv_R007NY_generator_16_0500_0599 =
      rs_R007_ueqv_R007NY_partial_16_0593 := by
  native_decide

/-- Coefficient term 594 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0594 : Poly :=
[
  term ((-1965856952353725027980 : Rat) / 314931072359881393269) [(4, 1), (10, 2), (15, 2), (16, 1)]
]

/-- Partial product 594 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0594 : Poly :=
[
  term ((-3931713904707450055960 : Rat) / 314931072359881393269) [(4, 1), (6, 1), (10, 2), (15, 2), (16, 1)],
  term ((1965856952353725027980 : Rat) / 314931072359881393269) [(4, 1), (10, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 594 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0594_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0594
        rs_R007_ueqv_R007NY_generator_16_0500_0599 =
      rs_R007_ueqv_R007NY_partial_16_0594 := by
  native_decide

/-- Coefficient term 595 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0595 : Poly :=
[
  term ((-344497016483710621603865 : Rat) / 1889586434159288359614) [(4, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 595 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0595 : Poly :=
[
  term ((-344497016483710621603865 : Rat) / 944793217079644179807) [(4, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((344497016483710621603865 : Rat) / 1889586434159288359614) [(4, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 595 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0595_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0595
        rs_R007_ueqv_R007NY_generator_16_0500_0599 =
      rs_R007_ueqv_R007NY_partial_16_0595 := by
  native_decide

/-- Coefficient term 596 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0596 : Poly :=
[
  term ((600594436829201815376375 : Rat) / 1889586434159288359614) [(4, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 596 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0596 : Poly :=
[
  term ((600594436829201815376375 : Rat) / 944793217079644179807) [(4, 1), (6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-600594436829201815376375 : Rat) / 1889586434159288359614) [(4, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 596 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0596_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0596
        rs_R007_ueqv_R007NY_generator_16_0500_0599 =
      rs_R007_ueqv_R007NY_partial_16_0596 := by
  native_decide

/-- Coefficient term 597 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0597 : Poly :=
[
  term ((431532330960967228266527 : Rat) / 629862144719762786538) [(4, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 597 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0597 : Poly :=
[
  term ((431532330960967228266527 : Rat) / 314931072359881393269) [(4, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-431532330960967228266527 : Rat) / 629862144719762786538) [(4, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 597 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0597_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0597
        rs_R007_ueqv_R007NY_generator_16_0500_0599 =
      rs_R007_ueqv_R007NY_partial_16_0597 := by
  native_decide

/-- Coefficient term 598 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0598 : Poly :=
[
  term ((-259090438996225707221236 : Rat) / 314931072359881393269) [(4, 1), (11, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 598 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0598 : Poly :=
[
  term ((-518180877992451414442472 : Rat) / 314931072359881393269) [(4, 1), (6, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((259090438996225707221236 : Rat) / 314931072359881393269) [(4, 1), (11, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 598 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0598_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0598
        rs_R007_ueqv_R007NY_generator_16_0500_0599 =
      rs_R007_ueqv_R007NY_partial_16_0598 := by
  native_decide

/-- Coefficient term 599 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0599 : Poly :=
[
  term ((-1798203093578840574027 : Rat) / 3020921557408934228) [(4, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 599 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0599 : Poly :=
[
  term ((-1798203093578840574027 : Rat) / 1510460778704467114) [(4, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((1798203093578840574027 : Rat) / 3020921557408934228) [(4, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 599 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0599_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0599
        rs_R007_ueqv_R007NY_generator_16_0500_0599 =
      rs_R007_ueqv_R007NY_partial_16_0599 := by
  native_decide

/-- Partial products in this block. -/
def rs_R007_ueqv_R007NY_partials_16_0500_0599 : List Poly :=
[
  rs_R007_ueqv_R007NY_partial_16_0500,
  rs_R007_ueqv_R007NY_partial_16_0501,
  rs_R007_ueqv_R007NY_partial_16_0502,
  rs_R007_ueqv_R007NY_partial_16_0503,
  rs_R007_ueqv_R007NY_partial_16_0504,
  rs_R007_ueqv_R007NY_partial_16_0505,
  rs_R007_ueqv_R007NY_partial_16_0506,
  rs_R007_ueqv_R007NY_partial_16_0507,
  rs_R007_ueqv_R007NY_partial_16_0508,
  rs_R007_ueqv_R007NY_partial_16_0509,
  rs_R007_ueqv_R007NY_partial_16_0510,
  rs_R007_ueqv_R007NY_partial_16_0511,
  rs_R007_ueqv_R007NY_partial_16_0512,
  rs_R007_ueqv_R007NY_partial_16_0513,
  rs_R007_ueqv_R007NY_partial_16_0514,
  rs_R007_ueqv_R007NY_partial_16_0515,
  rs_R007_ueqv_R007NY_partial_16_0516,
  rs_R007_ueqv_R007NY_partial_16_0517,
  rs_R007_ueqv_R007NY_partial_16_0518,
  rs_R007_ueqv_R007NY_partial_16_0519,
  rs_R007_ueqv_R007NY_partial_16_0520,
  rs_R007_ueqv_R007NY_partial_16_0521,
  rs_R007_ueqv_R007NY_partial_16_0522,
  rs_R007_ueqv_R007NY_partial_16_0523,
  rs_R007_ueqv_R007NY_partial_16_0524,
  rs_R007_ueqv_R007NY_partial_16_0525,
  rs_R007_ueqv_R007NY_partial_16_0526,
  rs_R007_ueqv_R007NY_partial_16_0527,
  rs_R007_ueqv_R007NY_partial_16_0528,
  rs_R007_ueqv_R007NY_partial_16_0529,
  rs_R007_ueqv_R007NY_partial_16_0530,
  rs_R007_ueqv_R007NY_partial_16_0531,
  rs_R007_ueqv_R007NY_partial_16_0532,
  rs_R007_ueqv_R007NY_partial_16_0533,
  rs_R007_ueqv_R007NY_partial_16_0534,
  rs_R007_ueqv_R007NY_partial_16_0535,
  rs_R007_ueqv_R007NY_partial_16_0536,
  rs_R007_ueqv_R007NY_partial_16_0537,
  rs_R007_ueqv_R007NY_partial_16_0538,
  rs_R007_ueqv_R007NY_partial_16_0539,
  rs_R007_ueqv_R007NY_partial_16_0540,
  rs_R007_ueqv_R007NY_partial_16_0541,
  rs_R007_ueqv_R007NY_partial_16_0542,
  rs_R007_ueqv_R007NY_partial_16_0543,
  rs_R007_ueqv_R007NY_partial_16_0544,
  rs_R007_ueqv_R007NY_partial_16_0545,
  rs_R007_ueqv_R007NY_partial_16_0546,
  rs_R007_ueqv_R007NY_partial_16_0547,
  rs_R007_ueqv_R007NY_partial_16_0548,
  rs_R007_ueqv_R007NY_partial_16_0549,
  rs_R007_ueqv_R007NY_partial_16_0550,
  rs_R007_ueqv_R007NY_partial_16_0551,
  rs_R007_ueqv_R007NY_partial_16_0552,
  rs_R007_ueqv_R007NY_partial_16_0553,
  rs_R007_ueqv_R007NY_partial_16_0554,
  rs_R007_ueqv_R007NY_partial_16_0555,
  rs_R007_ueqv_R007NY_partial_16_0556,
  rs_R007_ueqv_R007NY_partial_16_0557,
  rs_R007_ueqv_R007NY_partial_16_0558,
  rs_R007_ueqv_R007NY_partial_16_0559,
  rs_R007_ueqv_R007NY_partial_16_0560,
  rs_R007_ueqv_R007NY_partial_16_0561,
  rs_R007_ueqv_R007NY_partial_16_0562,
  rs_R007_ueqv_R007NY_partial_16_0563,
  rs_R007_ueqv_R007NY_partial_16_0564,
  rs_R007_ueqv_R007NY_partial_16_0565,
  rs_R007_ueqv_R007NY_partial_16_0566,
  rs_R007_ueqv_R007NY_partial_16_0567,
  rs_R007_ueqv_R007NY_partial_16_0568,
  rs_R007_ueqv_R007NY_partial_16_0569,
  rs_R007_ueqv_R007NY_partial_16_0570,
  rs_R007_ueqv_R007NY_partial_16_0571,
  rs_R007_ueqv_R007NY_partial_16_0572,
  rs_R007_ueqv_R007NY_partial_16_0573,
  rs_R007_ueqv_R007NY_partial_16_0574,
  rs_R007_ueqv_R007NY_partial_16_0575,
  rs_R007_ueqv_R007NY_partial_16_0576,
  rs_R007_ueqv_R007NY_partial_16_0577,
  rs_R007_ueqv_R007NY_partial_16_0578,
  rs_R007_ueqv_R007NY_partial_16_0579,
  rs_R007_ueqv_R007NY_partial_16_0580,
  rs_R007_ueqv_R007NY_partial_16_0581,
  rs_R007_ueqv_R007NY_partial_16_0582,
  rs_R007_ueqv_R007NY_partial_16_0583,
  rs_R007_ueqv_R007NY_partial_16_0584,
  rs_R007_ueqv_R007NY_partial_16_0585,
  rs_R007_ueqv_R007NY_partial_16_0586,
  rs_R007_ueqv_R007NY_partial_16_0587,
  rs_R007_ueqv_R007NY_partial_16_0588,
  rs_R007_ueqv_R007NY_partial_16_0589,
  rs_R007_ueqv_R007NY_partial_16_0590,
  rs_R007_ueqv_R007NY_partial_16_0591,
  rs_R007_ueqv_R007NY_partial_16_0592,
  rs_R007_ueqv_R007NY_partial_16_0593,
  rs_R007_ueqv_R007NY_partial_16_0594,
  rs_R007_ueqv_R007NY_partial_16_0595,
  rs_R007_ueqv_R007NY_partial_16_0596,
  rs_R007_ueqv_R007NY_partial_16_0597,
  rs_R007_ueqv_R007NY_partial_16_0598,
  rs_R007_ueqv_R007NY_partial_16_0599
]

/-- Sum of partial products in this block. -/
def rs_R007_ueqv_R007NY_block_16_0500_0599 : Poly :=
[
  term ((201568986197755822015070 : Rat) / 944793217079644179807) [(3, 1), (6, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((-40313797239551164403014 : Rat) / 314931072359881393269) [(3, 1), (6, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-271474920300762237020 : Rat) / 44990153194268770467) [(3, 1), (6, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((18870258760392817072405 : Rat) / 104977024119960464423) [(3, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((54294984060152447404 : Rat) / 14996717731422923489) [(3, 1), (6, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11322155256235690243443 : Rat) / 104977024119960464423) [(3, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-115438650893527280561990 : Rat) / 944793217079644179807) [(3, 1), (6, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((39655202107300520246180 : Rat) / 104977024119960464423) [(3, 1), (6, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-447252825384447074754088 : Rat) / 944793217079644179807) [(3, 1), (6, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((853633811778749201296735 : Rat) / 1889586434159288359614) [(3, 1), (6, 1), (10, 1), (11, 1), (16, 1)],
  term ((-83776942565976834917020 : Rat) / 944793217079644179807) [(3, 1), (6, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((23087730178705456112398 : Rat) / 314931072359881393269) [(3, 1), (6, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-23793121264380312147708 : Rat) / 104977024119960464423) [(3, 1), (6, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-170726762355749840259347 : Rat) / 629862144719762786538) [(3, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((99503798184806635140860 : Rat) / 314931072359881393269) [(3, 1), (6, 1), (10, 1), (15, 3), (16, 1)],
  term ((-20944235641494208729255 : Rat) / 314931072359881393269) [(3, 1), (6, 1), (10, 2), (11, 1), (16, 1)],
  term ((4188847128298841745851 : Rat) / 104977024119960464423) [(3, 1), (6, 1), (10, 2), (15, 1), (16, 1)],
  term ((864451638997170129687205 : Rat) / 1889586434159288359614) [(3, 1), (6, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((53422579281601383184430 : Rat) / 944793217079644179807) [(3, 1), (6, 1), (11, 1), (12, 1), (16, 1)],
  term ((-14200353101042886073600 : Rat) / 19281494226115187343) [(3, 1), (6, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((169871901174101505168800 : Rat) / 944793217079644179807) [(3, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((14200353101042886073600 : Rat) / 134970459582806311401) [(3, 1), (6, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(3, 1), (6, 1), (11, 1), (13, 2), (16, 1)],
  term ((81066579038598020573485 : Rat) / 134970459582806311401) [(3, 1), (6, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1231947469333442661915025 : Rat) / 3779172868318576719228) [(3, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((-109477222932483602855 : Rat) / 2265691168056700671) [(3, 1), (6, 1), (11, 1), (14, 2), (16, 1)],
  term ((491656423605717141358255 : Rat) / 944793217079644179807) [(3, 1), (6, 1), (11, 1), (14, 3), (16, 1)],
  term ((-54089543066360453463557 : Rat) / 222304286371680983484) [(3, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((22073629807947359508640 : Rat) / 944793217079644179807) [(3, 1), (6, 1), (11, 1), (16, 1)],
  term ((368618547290298073634888 : Rat) / 944793217079644179807) [(3, 1), (6, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-4188847128298841745851 : Rat) / 25534951812963356211) [(3, 1), (6, 1), (11, 2), (15, 1), (16, 1)],
  term ((83776942565976834917020 : Rat) / 944793217079644179807) [(3, 1), (6, 1), (11, 3), (14, 1), (16, 1)],
  term ((-20944235641494208729255 : Rat) / 944793217079644179807) [(3, 1), (6, 1), (11, 3), (16, 1)],
  term ((-172890327799434025937441 : Rat) / 629862144719762786538) [(3, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10684515856320276636886 : Rat) / 314931072359881393269) [(3, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((2840070620208577214720 : Rat) / 6427164742038395781) [(3, 1), (6, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-33974380234820301033760 : Rat) / 314931072359881393269) [(3, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2840070620208577214720 : Rat) / 44990153194268770467) [(3, 1), (6, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(3, 1), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((253108023410366002106077 : Rat) / 1259724289439525573076) [(3, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-163759376193623329753091 : Rat) / 314931072359881393269) [(3, 1), (6, 1), (14, 1), (15, 3), (16, 1)],
  term ((21895444586496720571 : Rat) / 755230389352233557) [(3, 1), (6, 1), (14, 2), (15, 1), (16, 1)],
  term ((-98331284721143428271651 : Rat) / 314931072359881393269) [(3, 1), (6, 1), (14, 3), (15, 1), (16, 1)],
  term ((-5359519178669116081535 : Rat) / 314931072359881393269) [(3, 1), (6, 1), (15, 1), (16, 1)],
  term ((264330311288963303296433 : Rat) / 1259724289439525573076) [(3, 1), (6, 1), (15, 3), (16, 1)],
  term ((-100784493098877911007535 : Rat) / 944793217079644179807) [(3, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((20156898619775582201507 : Rat) / 314931072359881393269) [(3, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((135737460150381118510 : Rat) / 44990153194268770467) [(3, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-18870258760392817072405 : Rat) / 209954048239920928846) [(3, 1), (8, 1), (11, 1), (16, 1)],
  term ((-27147492030076223702 : Rat) / 14996717731422923489) [(3, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((11322155256235690243443 : Rat) / 209954048239920928846) [(3, 1), (8, 1), (15, 1), (16, 1)],
  term ((57719325446763640280995 : Rat) / 944793217079644179807) [(3, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-19827601053650260123090 : Rat) / 104977024119960464423) [(3, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((223626412692223537377044 : Rat) / 944793217079644179807) [(3, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-853633811778749201296735 : Rat) / 3779172868318576719228) [(3, 1), (10, 1), (11, 1), (16, 1)],
  term ((41888471282988417458510 : Rat) / 944793217079644179807) [(3, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((-11543865089352728056199 : Rat) / 314931072359881393269) [(3, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((11896560632190156073854 : Rat) / 104977024119960464423) [(3, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((170726762355749840259347 : Rat) / 1259724289439525573076) [(3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-49751899092403317570430 : Rat) / 314931072359881393269) [(3, 1), (10, 1), (15, 3), (16, 1)],
  term ((20944235641494208729255 : Rat) / 629862144719762786538) [(3, 1), (10, 2), (11, 1), (16, 1)],
  term ((-4188847128298841745851 : Rat) / 209954048239920928846) [(3, 1), (10, 2), (15, 1), (16, 1)],
  term ((-864451638997170129687205 : Rat) / 3779172868318576719228) [(3, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-26711289640800691592215 : Rat) / 944793217079644179807) [(3, 1), (11, 1), (12, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 19281494226115187343) [(3, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-84935950587050752584400 : Rat) / 944793217079644179807) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(3, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 134970459582806311401) [(3, 1), (11, 1), (13, 2), (16, 1)],
  term ((-81066579038598020573485 : Rat) / 269940919165612622802) [(3, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((1231947469333442661915025 : Rat) / 7558345736637153438456) [(3, 1), (11, 1), (14, 1), (16, 1)],
  term ((109477222932483602855 : Rat) / 4531382336113401342) [(3, 1), (11, 1), (14, 2), (16, 1)],
  term ((-491656423605717141358255 : Rat) / 1889586434159288359614) [(3, 1), (11, 1), (14, 3), (16, 1)],
  term ((54089543066360453463557 : Rat) / 444608572743361966968) [(3, 1), (11, 1), (15, 2), (16, 1)],
  term ((-11036814903973679754320 : Rat) / 944793217079644179807) [(3, 1), (11, 1), (16, 1)],
  term ((-184309273645149036817444 : Rat) / 944793217079644179807) [(3, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((4188847128298841745851 : Rat) / 51069903625926712422) [(3, 1), (11, 2), (15, 1), (16, 1)],
  term ((-41888471282988417458510 : Rat) / 944793217079644179807) [(3, 1), (11, 3), (14, 1), (16, 1)],
  term ((20944235641494208729255 : Rat) / 1889586434159288359614) [(3, 1), (11, 3), (16, 1)],
  term ((172890327799434025937441 : Rat) / 1259724289439525573076) [(3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((5342257928160138318443 : Rat) / 314931072359881393269) [(3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 6427164742038395781) [(3, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((16987190117410150516880 : Rat) / 314931072359881393269) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(3, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-710017655052144303680 : Rat) / 44990153194268770467) [(3, 1), (13, 2), (15, 1), (16, 1)],
  term ((-253108023410366002106077 : Rat) / 2519448578879051146152) [(3, 1), (14, 1), (15, 1), (16, 1)],
  term ((163759376193623329753091 : Rat) / 629862144719762786538) [(3, 1), (14, 1), (15, 3), (16, 1)],
  term ((-21895444586496720571 : Rat) / 1510460778704467114) [(3, 1), (14, 2), (15, 1), (16, 1)],
  term ((98331284721143428271651 : Rat) / 629862144719762786538) [(3, 1), (14, 3), (15, 1), (16, 1)],
  term ((5359519178669116081535 : Rat) / 629862144719762786538) [(3, 1), (15, 1), (16, 1)],
  term ((-264330311288963303296433 : Rat) / 2519448578879051146152) [(3, 1), (15, 3), (16, 1)],
  term ((71001765505214430368000 : Rat) / 134970459582806311401) [(3, 2), (6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-71001765505214430368000 : Rat) / 134970459582806311401) [(3, 2), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-78634278094149001119200 : Rat) / 944793217079644179807) [(3, 2), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((78634278094149001119200 : Rat) / 944793217079644179807) [(3, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-14200353101042886073600 : Rat) / 44990153194268770467) [(3, 2), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((14200353101042886073600 : Rat) / 44990153194268770467) [(3, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((15726855618829800223840 : Rat) / 314931072359881393269) [(3, 2), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-15726855618829800223840 : Rat) / 314931072359881393269) [(3, 2), (6, 1), (15, 2), (16, 1)],
  term ((-35500882752607215184000 : Rat) / 134970459582806311401) [(3, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((35500882752607215184000 : Rat) / 134970459582806311401) [(3, 2), (11, 1), (13, 1), (16, 1)],
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(3, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-39317139047074500559600 : Rat) / 944793217079644179807) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(3, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-7863427809414900111920 : Rat) / 314931072359881393269) [(3, 2), (14, 1), (15, 2), (16, 1)],
  term ((7863427809414900111920 : Rat) / 314931072359881393269) [(3, 2), (15, 2), (16, 1)],
  term ((34010450733643947758025 : Rat) / 104977024119960464423) [(4, 1), (5, 1), (6, 1), (11, 1), (12, 1), (16, 1)],
  term ((-44681062481013498721145 : Rat) / 111152143185840491742) [(4, 1), (5, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((-20406270440186368654815 : Rat) / 104977024119960464423) [(4, 1), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((8936212496202699744229 : Rat) / 37050714395280163914) [(4, 1), (5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-34010450733643947758025 : Rat) / 209954048239920928846) [(4, 1), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((44681062481013498721145 : Rat) / 222304286371680983484) [(4, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((20406270440186368654815 : Rat) / 209954048239920928846) [(4, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-8936212496202699744229 : Rat) / 74101428790560327828) [(4, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((4307859669118472479360 : Rat) / 3118129429305756369) [(4, 1), (6, 1), (7, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-940315205200220549654845 : Rat) / 944793217079644179807) [(4, 1), (6, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((-861571933823694495872 : Rat) / 1039376476435252123) [(4, 1), (6, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((188063041040044109930969 : Rat) / 314931072359881393269) [(4, 1), (6, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-9829284761768625139900 : Rat) / 944793217079644179807) [(4, 1), (6, 1), (7, 1), (10, 2), (11, 1), (16, 1)],
  term ((1965856952353725027980 : Rat) / 314931072359881393269) [(4, 1), (6, 1), (7, 1), (10, 2), (15, 1), (16, 1)],
  term ((88461157516329167344835 : Rat) / 44990153194268770467) [(4, 1), (6, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-95595374266684757298980 : Rat) / 104977024119960464423) [(4, 1), (6, 1), (7, 1), (11, 1), (14, 2), (16, 1)],
  term ((-63874887220886021656780 : Rat) / 55576071592920245871) [(4, 1), (6, 1), (7, 1), (11, 1), (16, 1)],
  term ((-17692231503265833468967 : Rat) / 14996717731422923489) [(4, 1), (6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((57357224560010854379388 : Rat) / 104977024119960464423) [(4, 1), (6, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((12774977444177204331356 : Rat) / 18525357197640081957) [(4, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(4, 1), (6, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-61268472019141792124492 : Rat) / 944793217079644179807) [(4, 1), (6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-104514135348626555412380 : Rat) / 944793217079644179807) [(4, 1), (6, 1), (8, 1), (11, 2), (16, 1)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(4, 1), (6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(4, 1), (6, 1), (8, 1), (15, 2), (16, 1)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(4, 1), (6, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(4, 1), (6, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(4, 1), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(4, 1), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-151712308720478513061440 : Rat) / 55576071592920245871) [(4, 1), (6, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((2488581094804423023958925 : Rat) / 944793217079644179807) [(4, 1), (6, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-19658569523537250279800 : Rat) / 944793217079644179807) [(4, 1), (6, 1), (10, 1), (11, 2), (14, 1), (16, 1)],
  term ((4914642380884312569950 : Rat) / 944793217079644179807) [(4, 1), (6, 1), (10, 1), (11, 2), (16, 1)],
  term ((518180877992451414442472 : Rat) / 314931072359881393269) [(4, 1), (6, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-498305976046590722300179 : Rat) / 314931072359881393269) [(4, 1), (6, 1), (10, 1), (15, 2), (16, 1)],
  term ((19658569523537250279800 : Rat) / 944793217079644179807) [(4, 1), (6, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-3931713904707450055960 : Rat) / 314931072359881393269) [(4, 1), (6, 1), (10, 2), (15, 2), (16, 1)],
  term ((-344497016483710621603865 : Rat) / 944793217079644179807) [(4, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((600594436829201815376375 : Rat) / 944793217079644179807) [(4, 1), (6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((52864683354275746235813 : Rat) / 104977024119960464423) [(4, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-518180877992451414442472 : Rat) / 314931072359881393269) [(4, 1), (6, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-231311526120436234949365 : Rat) / 629862144719762786538) [(4, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((647726097490564268053090 : Rat) / 944793217079644179807) [(4, 1), (6, 1), (11, 2), (14, 1), (16, 1)],
  term ((-103387324493161324946105 : Rat) / 209954048239920928846) [(4, 1), (6, 1), (11, 2), (16, 1)],
  term ((28678612280005427189694 : Rat) / 104977024119960464423) [(4, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-66488395962849979903381 : Rat) / 209954048239920928846) [(4, 1), (6, 1), (15, 2), (16, 1)],
  term ((-15726855618829800223840 : Rat) / 944793217079644179807) [(4, 1), (6, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(4, 1), (6, 2), (10, 1), (11, 2), (16, 1)],
  term ((1965856952353725027980 : Rat) / 314931072359881393269) [(4, 1), (6, 2), (10, 1), (15, 2), (16, 1)],
  term ((545876561796279979118176 : Rat) / 314931072359881393269) [(4, 1), (6, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-518539163901940284419894 : Rat) / 314931072359881393269) [(4, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1295452194981128536106180 : Rat) / 944793217079644179807) [(4, 1), (6, 2), (11, 2), (14, 1), (16, 1)],
  term ((103387324493161324946105 : Rat) / 104977024119960464423) [(4, 1), (6, 2), (11, 2), (16, 1)],
  term ((-57357224560010854379388 : Rat) / 104977024119960464423) [(4, 1), (6, 2), (14, 1), (15, 2), (16, 1)],
  term ((66488395962849979903381 : Rat) / 104977024119960464423) [(4, 1), (6, 2), (15, 2), (16, 1)],
  term ((-2153929834559236239680 : Rat) / 3118129429305756369) [(4, 1), (7, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((940315205200220549654845 : Rat) / 1889586434159288359614) [(4, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((430785966911847247936 : Rat) / 1039376476435252123) [(4, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-188063041040044109930969 : Rat) / 629862144719762786538) [(4, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((4914642380884312569950 : Rat) / 944793217079644179807) [(4, 1), (7, 1), (10, 2), (11, 1), (16, 1)],
  term ((-982928476176862513990 : Rat) / 314931072359881393269) [(4, 1), (7, 1), (10, 2), (15, 1), (16, 1)],
  term ((-88461157516329167344835 : Rat) / 89980306388537540934) [(4, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((47797687133342378649490 : Rat) / 104977024119960464423) [(4, 1), (7, 1), (11, 1), (14, 2), (16, 1)],
  term ((31937443610443010828390 : Rat) / 55576071592920245871) [(4, 1), (7, 1), (11, 1), (16, 1)],
  term ((17692231503265833468967 : Rat) / 29993435462845846978) [(4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-28678612280005427189694 : Rat) / 104977024119960464423) [(4, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-6387488722088602165678 : Rat) / 18525357197640081957) [(4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(4, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((30634236009570896062246 : Rat) / 944793217079644179807) [(4, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((52257067674313277706190 : Rat) / 944793217079644179807) [(4, 1), (8, 1), (11, 2), (16, 1)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(4, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(4, 1), (8, 1), (15, 2), (16, 1)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(4, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(4, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(4, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((75856154360239256530720 : Rat) / 55576071592920245871) [(4, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-275635296332778680427445 : Rat) / 209954048239920928846) [(4, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(4, 1), (10, 1), (11, 2), (14, 1), (16, 1)],
  term ((-4914642380884312569950 : Rat) / 944793217079644179807) [(4, 1), (10, 1), (11, 2), (16, 1)],
  term ((-259090438996225707221236 : Rat) / 314931072359881393269) [(4, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((165774349190137953262063 : Rat) / 209954048239920928846) [(4, 1), (10, 1), (15, 2), (16, 1)],
  term ((-9829284761768625139900 : Rat) / 944793217079644179807) [(4, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((1965856952353725027980 : Rat) / 314931072359881393269) [(4, 1), (10, 2), (15, 2), (16, 1)],
  term ((344497016483710621603865 : Rat) / 1889586434159288359614) [(4, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-600594436829201815376375 : Rat) / 1889586434159288359614) [(4, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-431532330960967228266527 : Rat) / 629862144719762786538) [(4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((259090438996225707221236 : Rat) / 314931072359881393269) [(4, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((1798203093578840574027 : Rat) / 3020921557408934228) [(4, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 16, terms 500 through 599. -/
theorem rs_R007_ueqv_R007NY_block_16_0500_0599_valid :
    checkProductSumEq rs_R007_ueqv_R007NY_partials_16_0500_0599
      rs_R007_ueqv_R007NY_block_16_0500_0599 = true := by
  native_decide

end R007UeqvR007NYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
