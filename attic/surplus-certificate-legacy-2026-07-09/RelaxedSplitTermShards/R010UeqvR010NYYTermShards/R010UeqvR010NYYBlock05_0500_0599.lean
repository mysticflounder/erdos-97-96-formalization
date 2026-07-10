/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010NYY, term block 5:500-599

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010NYYTermShards

/-- Generator polynomial 5 for relaxed split surplus certificate `R010:u=v:R010NYY`. -/
def rs_R010_ueqv_R010NYY_generator_05_0500_0599 : Poly :=
[
  term (-2 : Rat) [(6, 1)],
  term (1 : Rat) [(6, 2)],
  term (1 : Rat) [(7, 2)],
  term (2 : Rat) [(14, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 500 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0500 : Poly :=
[
  term ((-954422357427762169755 : Rat) / 67388272094645211136) [(5, 1), (8, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 500 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0500 : Poly :=
[
  term ((954422357427762169755 : Rat) / 33694136047322605568) [(5, 1), (6, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-954422357427762169755 : Rat) / 67388272094645211136) [(5, 1), (6, 2), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-954422357427762169755 : Rat) / 67388272094645211136) [(5, 1), (7, 2), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-954422357427762169755 : Rat) / 33694136047322605568) [(5, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((954422357427762169755 : Rat) / 67388272094645211136) [(5, 1), (8, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((954422357427762169755 : Rat) / 67388272094645211136) [(5, 1), (8, 1), (10, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 500 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0500_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0500
        rs_R010_ueqv_R010NYY_generator_05_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_05_0500 := by
  native_decide

/-- Coefficient term 501 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0501 : Poly :=
[
  term ((-24082546774204629297 : Rat) / 33694136047322605568) [(5, 1), (8, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 501 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0501 : Poly :=
[
  term ((24082546774204629297 : Rat) / 16847068023661302784) [(5, 1), (6, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-24082546774204629297 : Rat) / 33694136047322605568) [(5, 1), (6, 2), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-24082546774204629297 : Rat) / 33694136047322605568) [(5, 1), (7, 2), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((24082546774204629297 : Rat) / 33694136047322605568) [(5, 1), (8, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-24082546774204629297 : Rat) / 16847068023661302784) [(5, 1), (8, 1), (11, 1), (14, 2), (16, 1)],
  term ((24082546774204629297 : Rat) / 33694136047322605568) [(5, 1), (8, 1), (11, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 501 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0501_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0501
        rs_R010_ueqv_R010NYY_generator_05_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_05_0501 := by
  native_decide

/-- Coefficient term 502 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0502 : Poly :=
[
  term ((54162118951983571405 : Rat) / 33694136047322605568) [(5, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 502 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0502 : Poly :=
[
  term ((-54162118951983571405 : Rat) / 16847068023661302784) [(5, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((54162118951983571405 : Rat) / 33694136047322605568) [(5, 1), (6, 2), (8, 1), (11, 1), (16, 1)],
  term ((54162118951983571405 : Rat) / 33694136047322605568) [(5, 1), (7, 2), (8, 1), (11, 1), (16, 1)],
  term ((54162118951983571405 : Rat) / 16847068023661302784) [(5, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-54162118951983571405 : Rat) / 33694136047322605568) [(5, 1), (8, 1), (11, 1), (14, 2), (16, 1)],
  term ((-54162118951983571405 : Rat) / 33694136047322605568) [(5, 1), (8, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 502 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0502_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0502
        rs_R010_ueqv_R010NYY_generator_05_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_05_0502 := by
  native_decide

/-- Coefficient term 503 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0503 : Poly :=
[
  term ((-61366430509389361365 : Rat) / 16847068023661302784) [(5, 1), (8, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 503 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0503 : Poly :=
[
  term ((61366430509389361365 : Rat) / 8423534011830651392) [(5, 1), (6, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-61366430509389361365 : Rat) / 16847068023661302784) [(5, 1), (6, 2), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-61366430509389361365 : Rat) / 16847068023661302784) [(5, 1), (7, 2), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((61366430509389361365 : Rat) / 16847068023661302784) [(5, 1), (8, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-61366430509389361365 : Rat) / 8423534011830651392) [(5, 1), (8, 1), (13, 1), (14, 2), (16, 1)],
  term ((61366430509389361365 : Rat) / 16847068023661302784) [(5, 1), (8, 1), (13, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 503 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0503_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0503
        rs_R010_ueqv_R010NYY_generator_05_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_05_0503 := by
  native_decide

/-- Coefficient term 504 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0504 : Poly :=
[
  term ((59854582444141895889 : Rat) / 33694136047322605568) [(5, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 504 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0504 : Poly :=
[
  term ((-59854582444141895889 : Rat) / 16847068023661302784) [(5, 1), (6, 1), (8, 1), (13, 1), (16, 1)],
  term ((59854582444141895889 : Rat) / 33694136047322605568) [(5, 1), (6, 2), (8, 1), (13, 1), (16, 1)],
  term ((59854582444141895889 : Rat) / 33694136047322605568) [(5, 1), (7, 2), (8, 1), (13, 1), (16, 1)],
  term ((59854582444141895889 : Rat) / 16847068023661302784) [(5, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-59854582444141895889 : Rat) / 33694136047322605568) [(5, 1), (8, 1), (13, 1), (14, 2), (16, 1)],
  term ((-59854582444141895889 : Rat) / 33694136047322605568) [(5, 1), (8, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 504 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0504_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0504
        rs_R010_ueqv_R010NYY_generator_05_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_05_0504 := by
  native_decide

/-- Coefficient term 505 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0505 : Poly :=
[
  term ((-3061944933367692879 : Rat) / 260186378743803904) [(5, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 505 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0505 : Poly :=
[
  term ((3061944933367692879 : Rat) / 130093189371901952) [(5, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-3061944933367692879 : Rat) / 260186378743803904) [(5, 1), (6, 2), (8, 1), (15, 1), (16, 1)],
  term ((-3061944933367692879 : Rat) / 260186378743803904) [(5, 1), (7, 2), (8, 1), (15, 1), (16, 1)],
  term ((-3061944933367692879 : Rat) / 130093189371901952) [(5, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((3061944933367692879 : Rat) / 260186378743803904) [(5, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((3061944933367692879 : Rat) / 260186378743803904) [(5, 1), (8, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 505 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0505_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0505
        rs_R010_ueqv_R010NYY_generator_05_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_05_0505 := by
  native_decide

/-- Coefficient term 506 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0506 : Poly :=
[
  term ((-23839805706003352161 : Rat) / 4211767005915325696) [(5, 1), (9, 1), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 506 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0506 : Poly :=
[
  term ((23839805706003352161 : Rat) / 2105883502957662848) [(5, 1), (6, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-23839805706003352161 : Rat) / 4211767005915325696) [(5, 1), (6, 2), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-23839805706003352161 : Rat) / 4211767005915325696) [(5, 1), (7, 2), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((23839805706003352161 : Rat) / 4211767005915325696) [(5, 1), (9, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-23839805706003352161 : Rat) / 2105883502957662848) [(5, 1), (9, 1), (10, 1), (14, 2), (16, 1)],
  term ((23839805706003352161 : Rat) / 4211767005915325696) [(5, 1), (9, 1), (10, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 506 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0506_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0506
        rs_R010_ueqv_R010NYY_generator_05_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_05_0506 := by
  native_decide

/-- Coefficient term 507 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0507 : Poly :=
[
  term ((-100963211346141388395 : Rat) / 33694136047322605568) [(5, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 507 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0507 : Poly :=
[
  term ((100963211346141388395 : Rat) / 16847068023661302784) [(5, 1), (6, 1), (9, 1), (10, 1), (16, 1)],
  term ((-100963211346141388395 : Rat) / 33694136047322605568) [(5, 1), (6, 2), (9, 1), (10, 1), (16, 1)],
  term ((-100963211346141388395 : Rat) / 33694136047322605568) [(5, 1), (7, 2), (9, 1), (10, 1), (16, 1)],
  term ((-100963211346141388395 : Rat) / 16847068023661302784) [(5, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((100963211346141388395 : Rat) / 33694136047322605568) [(5, 1), (9, 1), (10, 1), (14, 2), (16, 1)],
  term ((100963211346141388395 : Rat) / 33694136047322605568) [(5, 1), (9, 1), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 507 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0507_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0507
        rs_R010_ueqv_R010NYY_generator_05_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_05_0507 := by
  native_decide

/-- Coefficient term 508 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0508 : Poly :=
[
  term ((-27980600721736322115 : Rat) / 16847068023661302784) [(5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 508 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0508 : Poly :=
[
  term ((27980600721736322115 : Rat) / 8423534011830651392) [(5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-27980600721736322115 : Rat) / 16847068023661302784) [(5, 1), (6, 2), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-27980600721736322115 : Rat) / 16847068023661302784) [(5, 1), (7, 2), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((27980600721736322115 : Rat) / 16847068023661302784) [(5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-27980600721736322115 : Rat) / 8423534011830651392) [(5, 1), (9, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((27980600721736322115 : Rat) / 16847068023661302784) [(5, 1), (9, 1), (11, 1), (13, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 508 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0508_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0508
        rs_R010_ueqv_R010NYY_generator_05_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_05_0508 := by
  native_decide

/-- Coefficient term 509 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0509 : Poly :=
[
  term ((-22546153675895831973 : Rat) / 16847068023661302784) [(5, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 509 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0509 : Poly :=
[
  term ((22546153675895831973 : Rat) / 8423534011830651392) [(5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-22546153675895831973 : Rat) / 16847068023661302784) [(5, 1), (6, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-22546153675895831973 : Rat) / 16847068023661302784) [(5, 1), (7, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-22546153675895831973 : Rat) / 8423534011830651392) [(5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((22546153675895831973 : Rat) / 16847068023661302784) [(5, 1), (9, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((22546153675895831973 : Rat) / 16847068023661302784) [(5, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 509 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0509_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0509
        rs_R010_ueqv_R010NYY_generator_05_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_05_0509 := by
  native_decide

/-- Coefficient term 510 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0510 : Poly :=
[
  term ((780699240759410409 : Rat) / 95858139537190912) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 510 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0510 : Poly :=
[
  term ((-780699240759410409 : Rat) / 47929069768595456) [(5, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((780699240759410409 : Rat) / 95858139537190912) [(5, 1), (6, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((780699240759410409 : Rat) / 95858139537190912) [(5, 1), (7, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((780699240759410409 : Rat) / 47929069768595456) [(5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-780699240759410409 : Rat) / 95858139537190912) [(5, 1), (9, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-780699240759410409 : Rat) / 95858139537190912) [(5, 1), (9, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 510 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0510_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0510
        rs_R010_ueqv_R010NYY_generator_05_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_05_0510 := by
  native_decide

/-- Coefficient term 511 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0511 : Poly :=
[
  term ((-2258274597875481133 : Rat) / 170747311050621312) [(5, 1), (9, 1), (11, 2), (16, 1)]
]

/-- Partial product 511 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0511 : Poly :=
[
  term ((2258274597875481133 : Rat) / 85373655525310656) [(5, 1), (6, 1), (9, 1), (11, 2), (16, 1)],
  term ((-2258274597875481133 : Rat) / 170747311050621312) [(5, 1), (6, 2), (9, 1), (11, 2), (16, 1)],
  term ((-2258274597875481133 : Rat) / 170747311050621312) [(5, 1), (7, 2), (9, 1), (11, 2), (16, 1)],
  term ((-2258274597875481133 : Rat) / 85373655525310656) [(5, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((2258274597875481133 : Rat) / 170747311050621312) [(5, 1), (9, 1), (11, 2), (14, 2), (16, 1)],
  term ((2258274597875481133 : Rat) / 170747311050621312) [(5, 1), (9, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 511 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0511_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0511
        rs_R010_ueqv_R010NYY_generator_05_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_05_0511 := by
  native_decide

/-- Coefficient term 512 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0512 : Poly :=
[
  term ((9846260672265067047 : Rat) / 3546751162876063744) [(5, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 512 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0512 : Poly :=
[
  term ((-9846260672265067047 : Rat) / 1773375581438031872) [(5, 1), (6, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((9846260672265067047 : Rat) / 3546751162876063744) [(5, 1), (6, 2), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((9846260672265067047 : Rat) / 3546751162876063744) [(5, 1), (7, 2), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9846260672265067047 : Rat) / 3546751162876063744) [(5, 1), (9, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((9846260672265067047 : Rat) / 1773375581438031872) [(5, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-9846260672265067047 : Rat) / 3546751162876063744) [(5, 1), (9, 1), (13, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 512 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0512_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0512
        rs_R010_ueqv_R010NYY_generator_05_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_05_0512 := by
  native_decide

/-- Coefficient term 513 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0513 : Poly :=
[
  term ((121878886740089521065 : Rat) / 19253792027041488896) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 513 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0513 : Poly :=
[
  term ((-121878886740089521065 : Rat) / 9626896013520744448) [(5, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((121878886740089521065 : Rat) / 19253792027041488896) [(5, 1), (6, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((121878886740089521065 : Rat) / 19253792027041488896) [(5, 1), (7, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((121878886740089521065 : Rat) / 9626896013520744448) [(5, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-121878886740089521065 : Rat) / 19253792027041488896) [(5, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-121878886740089521065 : Rat) / 19253792027041488896) [(5, 1), (9, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 513 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0513_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0513
        rs_R010_ueqv_R010NYY_generator_05_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_05_0513 := by
  native_decide

/-- Coefficient term 514 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0514 : Poly :=
[
  term ((590535202605832960863 : Rat) / 269553088378580844544) [(5, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 514 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0514 : Poly :=
[
  term ((-590535202605832960863 : Rat) / 134776544189290422272) [(5, 1), (6, 1), (9, 1), (14, 1), (16, 1)],
  term ((590535202605832960863 : Rat) / 269553088378580844544) [(5, 1), (6, 2), (9, 1), (14, 1), (16, 1)],
  term ((590535202605832960863 : Rat) / 269553088378580844544) [(5, 1), (7, 2), (9, 1), (14, 1), (16, 1)],
  term ((-590535202605832960863 : Rat) / 269553088378580844544) [(5, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((590535202605832960863 : Rat) / 134776544189290422272) [(5, 1), (9, 1), (14, 2), (16, 1)],
  term ((-590535202605832960863 : Rat) / 269553088378580844544) [(5, 1), (9, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 514 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0514_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0514
        rs_R010_ueqv_R010NYY_generator_05_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_05_0514 := by
  native_decide

/-- Coefficient term 515 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0515 : Poly :=
[
  term ((-9846260672265067047 : Rat) / 7093502325752127488) [(5, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 515 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0515 : Poly :=
[
  term ((9846260672265067047 : Rat) / 3546751162876063744) [(5, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((-9846260672265067047 : Rat) / 7093502325752127488) [(5, 1), (6, 2), (9, 1), (15, 2), (16, 1)],
  term ((-9846260672265067047 : Rat) / 7093502325752127488) [(5, 1), (7, 2), (9, 1), (15, 2), (16, 1)],
  term ((-9846260672265067047 : Rat) / 3546751162876063744) [(5, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((9846260672265067047 : Rat) / 7093502325752127488) [(5, 1), (9, 1), (14, 2), (15, 2), (16, 1)],
  term ((9846260672265067047 : Rat) / 7093502325752127488) [(5, 1), (9, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 515 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0515_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0515
        rs_R010_ueqv_R010NYY_generator_05_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_05_0515 := by
  native_decide

/-- Coefficient term 516 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0516 : Poly :=
[
  term ((1021866705675947590393 : Rat) / 134776544189290422272) [(5, 1), (9, 1), (16, 1)]
]

/-- Partial product 516 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0516 : Poly :=
[
  term ((-1021866705675947590393 : Rat) / 67388272094645211136) [(5, 1), (6, 1), (9, 1), (16, 1)],
  term ((1021866705675947590393 : Rat) / 134776544189290422272) [(5, 1), (6, 2), (9, 1), (16, 1)],
  term ((1021866705675947590393 : Rat) / 134776544189290422272) [(5, 1), (7, 2), (9, 1), (16, 1)],
  term ((1021866705675947590393 : Rat) / 67388272094645211136) [(5, 1), (9, 1), (14, 1), (16, 1)],
  term ((-1021866705675947590393 : Rat) / 134776544189290422272) [(5, 1), (9, 1), (14, 2), (16, 1)],
  term ((-1021866705675947590393 : Rat) / 134776544189290422272) [(5, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 516 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0516_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0516
        rs_R010_ueqv_R010NYY_generator_05_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_05_0516 := by
  native_decide

/-- Coefficient term 517 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0517 : Poly :=
[
  term ((-557357753330154279 : Rat) / 56915770350207104) [(5, 1), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 517 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0517 : Poly :=
[
  term ((557357753330154279 : Rat) / 28457885175103552) [(5, 1), (6, 1), (9, 2), (11, 1), (16, 1)],
  term ((-557357753330154279 : Rat) / 56915770350207104) [(5, 1), (6, 2), (9, 2), (11, 1), (16, 1)],
  term ((-557357753330154279 : Rat) / 56915770350207104) [(5, 1), (7, 2), (9, 2), (11, 1), (16, 1)],
  term ((-557357753330154279 : Rat) / 28457885175103552) [(5, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((557357753330154279 : Rat) / 56915770350207104) [(5, 1), (9, 2), (11, 1), (14, 2), (16, 1)],
  term ((557357753330154279 : Rat) / 56915770350207104) [(5, 1), (9, 2), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 517 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0517_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0517
        rs_R010_ueqv_R010NYY_generator_05_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_05_0517 := by
  native_decide

/-- Coefficient term 518 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0518 : Poly :=
[
  term ((-12853999827937751211 : Rat) / 2105883502957662848) [(5, 1), (9, 2), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 518 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0518 : Poly :=
[
  term ((12853999827937751211 : Rat) / 1052941751478831424) [(5, 1), (6, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((-12853999827937751211 : Rat) / 2105883502957662848) [(5, 1), (6, 2), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((-12853999827937751211 : Rat) / 2105883502957662848) [(5, 1), (7, 2), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((12853999827937751211 : Rat) / 2105883502957662848) [(5, 1), (9, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-12853999827937751211 : Rat) / 1052941751478831424) [(5, 1), (9, 2), (13, 1), (14, 2), (16, 1)],
  term ((12853999827937751211 : Rat) / 2105883502957662848) [(5, 1), (9, 2), (13, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 518 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0518_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0518
        rs_R010_ueqv_R010NYY_generator_05_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_05_0518 := by
  native_decide

/-- Coefficient term 519 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0519 : Poly :=
[
  term ((-38018171745318956481 : Rat) / 16847068023661302784) [(5, 1), (9, 2), (13, 1), (16, 1)]
]

/-- Partial product 519 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0519 : Poly :=
[
  term ((38018171745318956481 : Rat) / 8423534011830651392) [(5, 1), (6, 1), (9, 2), (13, 1), (16, 1)],
  term ((-38018171745318956481 : Rat) / 16847068023661302784) [(5, 1), (6, 2), (9, 2), (13, 1), (16, 1)],
  term ((-38018171745318956481 : Rat) / 16847068023661302784) [(5, 1), (7, 2), (9, 2), (13, 1), (16, 1)],
  term ((-38018171745318956481 : Rat) / 8423534011830651392) [(5, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((38018171745318956481 : Rat) / 16847068023661302784) [(5, 1), (9, 2), (13, 1), (14, 2), (16, 1)],
  term ((38018171745318956481 : Rat) / 16847068023661302784) [(5, 1), (9, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 519 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0519_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0519
        rs_R010_ueqv_R010NYY_generator_05_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_05_0519 := by
  native_decide

/-- Coefficient term 520 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0520 : Poly :=
[
  term ((32898310098832139433 : Rat) / 2406724003380186112) [(5, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 520 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0520 : Poly :=
[
  term ((-32898310098832139433 : Rat) / 1203362001690093056) [(5, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((32898310098832139433 : Rat) / 2406724003380186112) [(5, 1), (6, 2), (9, 2), (15, 1), (16, 1)],
  term ((32898310098832139433 : Rat) / 2406724003380186112) [(5, 1), (7, 2), (9, 2), (15, 1), (16, 1)],
  term ((32898310098832139433 : Rat) / 1203362001690093056) [(5, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-32898310098832139433 : Rat) / 2406724003380186112) [(5, 1), (9, 2), (14, 2), (15, 1), (16, 1)],
  term ((-32898310098832139433 : Rat) / 2406724003380186112) [(5, 1), (9, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 520 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0520_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0520
        rs_R010_ueqv_R010NYY_generator_05_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_05_0520 := by
  native_decide

/-- Coefficient term 521 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0521 : Poly :=
[
  term ((-12853999827937751211 : Rat) / 1052941751478831424) [(5, 1), (9, 3), (16, 1)]
]

/-- Partial product 521 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0521 : Poly :=
[
  term ((12853999827937751211 : Rat) / 526470875739415712) [(5, 1), (6, 1), (9, 3), (16, 1)],
  term ((-12853999827937751211 : Rat) / 1052941751478831424) [(5, 1), (6, 2), (9, 3), (16, 1)],
  term ((-12853999827937751211 : Rat) / 1052941751478831424) [(5, 1), (7, 2), (9, 3), (16, 1)],
  term ((-12853999827937751211 : Rat) / 526470875739415712) [(5, 1), (9, 3), (14, 1), (16, 1)],
  term ((12853999827937751211 : Rat) / 1052941751478831424) [(5, 1), (9, 3), (14, 2), (16, 1)],
  term ((12853999827937751211 : Rat) / 1052941751478831424) [(5, 1), (9, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 521 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0521_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0521
        rs_R010_ueqv_R010NYY_generator_05_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_05_0521 := by
  native_decide

/-- Coefficient term 522 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0522 : Poly :=
[
  term ((-10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (10, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 522 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0522 : Poly :=
[
  term ((10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (6, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (6, 2), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (7, 2), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (10, 1), (11, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 522 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0522_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0522
        rs_R010_ueqv_R010NYY_generator_05_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_05_0522 := by
  native_decide

/-- Coefficient term 523 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0523 : Poly :=
[
  term ((6149870212956131 : Rat) / 852239377967488) [(5, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 523 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0523 : Poly :=
[
  term ((-6149870212956131 : Rat) / 426119688983744) [(5, 1), (6, 1), (10, 1), (11, 1), (16, 1)],
  term ((6149870212956131 : Rat) / 852239377967488) [(5, 1), (6, 2), (10, 1), (11, 1), (16, 1)],
  term ((6149870212956131 : Rat) / 852239377967488) [(5, 1), (7, 2), (10, 1), (11, 1), (16, 1)],
  term ((6149870212956131 : Rat) / 426119688983744) [(5, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-6149870212956131 : Rat) / 852239377967488) [(5, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((-6149870212956131 : Rat) / 852239377967488) [(5, 1), (10, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 523 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0523_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0523
        rs_R010_ueqv_R010NYY_generator_05_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_05_0523 := by
  native_decide

/-- Coefficient term 524 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0524 : Poly :=
[
  term ((48690874158145051407 : Rat) / 8423534011830651392) [(5, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 524 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0524 : Poly :=
[
  term ((-48690874158145051407 : Rat) / 4211767005915325696) [(5, 1), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((48690874158145051407 : Rat) / 8423534011830651392) [(5, 1), (6, 2), (10, 1), (13, 1), (16, 1)],
  term ((48690874158145051407 : Rat) / 8423534011830651392) [(5, 1), (7, 2), (10, 1), (13, 1), (16, 1)],
  term ((48690874158145051407 : Rat) / 4211767005915325696) [(5, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-48690874158145051407 : Rat) / 8423534011830651392) [(5, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((-48690874158145051407 : Rat) / 8423534011830651392) [(5, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 524 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0524_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0524
        rs_R010_ueqv_R010NYY_generator_05_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_05_0524 := by
  native_decide

/-- Coefficient term 525 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0525 : Poly :=
[
  term ((915776598761011178391 : Rat) / 67388272094645211136) [(5, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 525 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0525 : Poly :=
[
  term ((-915776598761011178391 : Rat) / 33694136047322605568) [(5, 1), (6, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((915776598761011178391 : Rat) / 67388272094645211136) [(5, 1), (6, 2), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((915776598761011178391 : Rat) / 67388272094645211136) [(5, 1), (7, 2), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-915776598761011178391 : Rat) / 67388272094645211136) [(5, 1), (10, 1), (14, 1), (15, 3), (16, 1)],
  term ((915776598761011178391 : Rat) / 33694136047322605568) [(5, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-915776598761011178391 : Rat) / 67388272094645211136) [(5, 1), (10, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 525 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0525_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0525
        rs_R010_ueqv_R010NYY_generator_05_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_05_0525 := by
  native_decide

/-- Coefficient term 526 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0526 : Poly :=
[
  term ((701456634752293629 : Rat) / 263235437869707856) [(5, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 526 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0526 : Poly :=
[
  term ((-701456634752293629 : Rat) / 131617718934853928) [(5, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((701456634752293629 : Rat) / 263235437869707856) [(5, 1), (6, 2), (10, 1), (15, 1), (16, 1)],
  term ((701456634752293629 : Rat) / 263235437869707856) [(5, 1), (7, 2), (10, 1), (15, 1), (16, 1)],
  term ((701456634752293629 : Rat) / 131617718934853928) [(5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-701456634752293629 : Rat) / 263235437869707856) [(5, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-701456634752293629 : Rat) / 263235437869707856) [(5, 1), (10, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 526 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0526_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0526
        rs_R010_ueqv_R010NYY_generator_05_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_05_0526 := by
  native_decide

/-- Coefficient term 527 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0527 : Poly :=
[
  term ((-4249056461351911479 : Rat) / 16847068023661302784) [(5, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 527 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0527 : Poly :=
[
  term ((4249056461351911479 : Rat) / 8423534011830651392) [(5, 1), (6, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4249056461351911479 : Rat) / 16847068023661302784) [(5, 1), (6, 2), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4249056461351911479 : Rat) / 16847068023661302784) [(5, 1), (7, 2), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((4249056461351911479 : Rat) / 16847068023661302784) [(5, 1), (11, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-4249056461351911479 : Rat) / 8423534011830651392) [(5, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((4249056461351911479 : Rat) / 16847068023661302784) [(5, 1), (11, 1), (13, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 527 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0527_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0527
        rs_R010_ueqv_R010NYY_generator_05_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_05_0527 := by
  native_decide

/-- Coefficient term 528 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0528 : Poly :=
[
  term ((94103904218330396751 : Rat) / 33694136047322605568) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 528 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0528 : Poly :=
[
  term ((-94103904218330396751 : Rat) / 16847068023661302784) [(5, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((94103904218330396751 : Rat) / 33694136047322605568) [(5, 1), (6, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((94103904218330396751 : Rat) / 33694136047322605568) [(5, 1), (7, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((94103904218330396751 : Rat) / 16847068023661302784) [(5, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-94103904218330396751 : Rat) / 33694136047322605568) [(5, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-94103904218330396751 : Rat) / 33694136047322605568) [(5, 1), (11, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 528 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0528_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0528
        rs_R010_ueqv_R010NYY_generator_05_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_05_0528 := by
  native_decide

/-- Coefficient term 529 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0529 : Poly :=
[
  term ((-574219009407614324223 : Rat) / 67388272094645211136) [(5, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 529 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0529 : Poly :=
[
  term ((574219009407614324223 : Rat) / 33694136047322605568) [(5, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((-574219009407614324223 : Rat) / 67388272094645211136) [(5, 1), (6, 2), (11, 1), (14, 1), (16, 1)],
  term ((-574219009407614324223 : Rat) / 67388272094645211136) [(5, 1), (7, 2), (11, 1), (14, 1), (16, 1)],
  term ((574219009407614324223 : Rat) / 67388272094645211136) [(5, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-574219009407614324223 : Rat) / 33694136047322605568) [(5, 1), (11, 1), (14, 2), (16, 1)],
  term ((574219009407614324223 : Rat) / 67388272094645211136) [(5, 1), (11, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 529 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0529_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0529
        rs_R010_ueqv_R010NYY_generator_05_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_05_0529 := by
  native_decide

/-- Coefficient term 530 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0530 : Poly :=
[
  term ((924274711683715001349 : Rat) / 67388272094645211136) [(5, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 530 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0530 : Poly :=
[
  term ((-924274711683715001349 : Rat) / 33694136047322605568) [(5, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((924274711683715001349 : Rat) / 67388272094645211136) [(5, 1), (6, 2), (11, 1), (15, 2), (16, 1)],
  term ((924274711683715001349 : Rat) / 67388272094645211136) [(5, 1), (7, 2), (11, 1), (15, 2), (16, 1)],
  term ((924274711683715001349 : Rat) / 33694136047322605568) [(5, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-924274711683715001349 : Rat) / 67388272094645211136) [(5, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((-924274711683715001349 : Rat) / 67388272094645211136) [(5, 1), (11, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 530 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0530_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0530
        rs_R010_ueqv_R010NYY_generator_05_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_05_0530 := by
  native_decide

/-- Coefficient term 531 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0531 : Poly :=
[
  term ((-20389494938133054455 : Rat) / 33694136047322605568) [(5, 1), (11, 1), (16, 1)]
]

/-- Partial product 531 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0531 : Poly :=
[
  term ((20389494938133054455 : Rat) / 16847068023661302784) [(5, 1), (6, 1), (11, 1), (16, 1)],
  term ((-20389494938133054455 : Rat) / 33694136047322605568) [(5, 1), (6, 2), (11, 1), (16, 1)],
  term ((-20389494938133054455 : Rat) / 33694136047322605568) [(5, 1), (7, 2), (11, 1), (16, 1)],
  term ((-20389494938133054455 : Rat) / 16847068023661302784) [(5, 1), (11, 1), (14, 1), (16, 1)],
  term ((20389494938133054455 : Rat) / 33694136047322605568) [(5, 1), (11, 1), (14, 2), (16, 1)],
  term ((20389494938133054455 : Rat) / 33694136047322605568) [(5, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 531 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0531_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0531
        rs_R010_ueqv_R010NYY_generator_05_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_05_0531 := by
  native_decide

/-- Coefficient term 532 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0532 : Poly :=
[
  term ((-10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 532 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0532 : Poly :=
[
  term ((10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (6, 1), (11, 2), (15, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (6, 2), (11, 2), (15, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (7, 2), (11, 2), (15, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (11, 2), (14, 2), (15, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (11, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 532 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0532_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0532
        rs_R010_ueqv_R010NYY_generator_05_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_05_0532 := by
  native_decide

/-- Coefficient term 533 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0533 : Poly :=
[
  term ((9613258292915725557 : Rat) / 4211767005915325696) [(5, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 533 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0533 : Poly :=
[
  term ((-9613258292915725557 : Rat) / 2105883502957662848) [(5, 1), (6, 1), (13, 1), (14, 1), (16, 1)],
  term ((9613258292915725557 : Rat) / 4211767005915325696) [(5, 1), (6, 2), (13, 1), (14, 1), (16, 1)],
  term ((9613258292915725557 : Rat) / 4211767005915325696) [(5, 1), (7, 2), (13, 1), (14, 1), (16, 1)],
  term ((-9613258292915725557 : Rat) / 4211767005915325696) [(5, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((9613258292915725557 : Rat) / 2105883502957662848) [(5, 1), (13, 1), (14, 2), (16, 1)],
  term ((-9613258292915725557 : Rat) / 4211767005915325696) [(5, 1), (13, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 533 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0533_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0533
        rs_R010_ueqv_R010NYY_generator_05_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_05_0533 := by
  native_decide

/-- Coefficient term 534 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0534 : Poly :=
[
  term ((-915776598761011178391 : Rat) / 67388272094645211136) [(5, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 534 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0534 : Poly :=
[
  term ((915776598761011178391 : Rat) / 33694136047322605568) [(5, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-915776598761011178391 : Rat) / 67388272094645211136) [(5, 1), (6, 2), (13, 1), (15, 2), (16, 1)],
  term ((-915776598761011178391 : Rat) / 67388272094645211136) [(5, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((-915776598761011178391 : Rat) / 33694136047322605568) [(5, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((915776598761011178391 : Rat) / 67388272094645211136) [(5, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((915776598761011178391 : Rat) / 67388272094645211136) [(5, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 534 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0534_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0534
        rs_R010_ueqv_R010NYY_generator_05_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_05_0534 := by
  native_decide

/-- Coefficient term 535 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0535 : Poly :=
[
  term ((-44569905339525962661 : Rat) / 16847068023661302784) [(5, 1), (13, 1), (16, 1)]
]

/-- Partial product 535 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0535 : Poly :=
[
  term ((44569905339525962661 : Rat) / 8423534011830651392) [(5, 1), (6, 1), (13, 1), (16, 1)],
  term ((-44569905339525962661 : Rat) / 16847068023661302784) [(5, 1), (6, 2), (13, 1), (16, 1)],
  term ((-44569905339525962661 : Rat) / 16847068023661302784) [(5, 1), (7, 2), (13, 1), (16, 1)],
  term ((-44569905339525962661 : Rat) / 8423534011830651392) [(5, 1), (13, 1), (14, 1), (16, 1)],
  term ((44569905339525962661 : Rat) / 16847068023661302784) [(5, 1), (13, 1), (14, 2), (16, 1)],
  term ((44569905339525962661 : Rat) / 16847068023661302784) [(5, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 535 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0535_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0535
        rs_R010_ueqv_R010NYY_generator_05_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_05_0535 := by
  native_decide

/-- Coefficient term 536 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0536 : Poly :=
[
  term ((-915776598761011178391 : Rat) / 134776544189290422272) [(5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 536 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0536 : Poly :=
[
  term ((915776598761011178391 : Rat) / 67388272094645211136) [(5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-915776598761011178391 : Rat) / 134776544189290422272) [(5, 1), (6, 2), (14, 1), (15, 1), (16, 1)],
  term ((-915776598761011178391 : Rat) / 134776544189290422272) [(5, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((915776598761011178391 : Rat) / 134776544189290422272) [(5, 1), (14, 1), (15, 3), (16, 1)],
  term ((-915776598761011178391 : Rat) / 67388272094645211136) [(5, 1), (14, 2), (15, 1), (16, 1)],
  term ((915776598761011178391 : Rat) / 134776544189290422272) [(5, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 536 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0536_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0536
        rs_R010_ueqv_R010NYY_generator_05_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_05_0536 := by
  native_decide

/-- Coefficient term 537 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0537 : Poly :=
[
  term ((-9613258292915725557 : Rat) / 8423534011830651392) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 537 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0537 : Poly :=
[
  term ((9613258292915725557 : Rat) / 4211767005915325696) [(5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-9613258292915725557 : Rat) / 8423534011830651392) [(5, 1), (6, 2), (15, 1), (16, 1)],
  term ((-9613258292915725557 : Rat) / 8423534011830651392) [(5, 1), (7, 2), (15, 1), (16, 1)],
  term ((-9613258292915725557 : Rat) / 4211767005915325696) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term ((9613258292915725557 : Rat) / 8423534011830651392) [(5, 1), (14, 2), (15, 1), (16, 1)],
  term ((9613258292915725557 : Rat) / 8423534011830651392) [(5, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 537 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0537_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0537
        rs_R010_ueqv_R010NYY_generator_05_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_05_0537 := by
  native_decide

/-- Coefficient term 538 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0538 : Poly :=
[
  term ((1380205666669678263 : Rat) / 1203362001690093056) [(5, 2), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 538 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0538 : Poly :=
[
  term ((-1380205666669678263 : Rat) / 601681000845046528) [(5, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((1380205666669678263 : Rat) / 1203362001690093056) [(5, 2), (6, 2), (9, 1), (11, 1), (16, 1)],
  term ((1380205666669678263 : Rat) / 1203362001690093056) [(5, 2), (7, 2), (9, 1), (11, 1), (16, 1)],
  term ((1380205666669678263 : Rat) / 601681000845046528) [(5, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1380205666669678263 : Rat) / 1203362001690093056) [(5, 2), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-1380205666669678263 : Rat) / 1203362001690093056) [(5, 2), (9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 538 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0538_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0538
        rs_R010_ueqv_R010NYY_generator_05_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_05_0538 := by
  native_decide

/-- Coefficient term 539 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0539 : Poly :=
[
  term ((240937308571641895789 : Rat) / 6317650508872988544) [(6, 1), (8, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 539 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0539 : Poly :=
[
  term ((240937308571641895789 : Rat) / 6317650508872988544) [(6, 1), (7, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((240937308571641895789 : Rat) / 3158825254436494272) [(6, 1), (8, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-240937308571641895789 : Rat) / 6317650508872988544) [(6, 1), (8, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-240937308571641895789 : Rat) / 6317650508872988544) [(6, 1), (8, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-240937308571641895789 : Rat) / 3158825254436494272) [(6, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((240937308571641895789 : Rat) / 6317650508872988544) [(6, 3), (8, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 539 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0539_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0539
        rs_R010_ueqv_R010NYY_generator_05_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_05_0539 := by
  native_decide

/-- Coefficient term 540 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0540 : Poly :=
[
  term ((70302592550481639 : Rat) / 5965675645772416) [(6, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 540 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0540 : Poly :=
[
  term ((70302592550481639 : Rat) / 5965675645772416) [(6, 1), (7, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 2982837822886208) [(6, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-70302592550481639 : Rat) / 5965675645772416) [(6, 1), (8, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-70302592550481639 : Rat) / 5965675645772416) [(6, 1), (8, 1), (9, 1), (15, 3), (16, 1)],
  term ((-70302592550481639 : Rat) / 2982837822886208) [(6, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 5965675645772416) [(6, 3), (8, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 540 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0540_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0540
        rs_R010_ueqv_R010NYY_generator_05_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_05_0540 := by
  native_decide

/-- Coefficient term 541 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0541 : Poly :=
[
  term ((-39023555492874908592505 : Rat) / 303247224425903450112) [(6, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 541 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0541 : Poly :=
[
  term ((-39023555492874908592505 : Rat) / 303247224425903450112) [(6, 1), (7, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-39023555492874908592505 : Rat) / 151623612212951725056) [(6, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((39023555492874908592505 : Rat) / 303247224425903450112) [(6, 1), (8, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((39023555492874908592505 : Rat) / 303247224425903450112) [(6, 1), (8, 1), (11, 1), (15, 3), (16, 1)],
  term ((39023555492874908592505 : Rat) / 151623612212951725056) [(6, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-39023555492874908592505 : Rat) / 303247224425903450112) [(6, 3), (8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 541 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0541_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0541
        rs_R010_ueqv_R010NYY_generator_05_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_05_0541 := by
  native_decide

/-- Coefficient term 542 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0542 : Poly :=
[
  term ((69556067785407573619 : Rat) / 6317650508872988544) [(6, 1), (8, 1), (11, 2), (16, 1)]
]

/-- Partial product 542 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0542 : Poly :=
[
  term ((69556067785407573619 : Rat) / 6317650508872988544) [(6, 1), (7, 2), (8, 1), (11, 2), (16, 1)],
  term ((69556067785407573619 : Rat) / 3158825254436494272) [(6, 1), (8, 1), (11, 2), (14, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 6317650508872988544) [(6, 1), (8, 1), (11, 2), (14, 2), (16, 1)],
  term ((-69556067785407573619 : Rat) / 6317650508872988544) [(6, 1), (8, 1), (11, 2), (15, 2), (16, 1)],
  term ((-69556067785407573619 : Rat) / 3158825254436494272) [(6, 2), (8, 1), (11, 2), (16, 1)],
  term ((69556067785407573619 : Rat) / 6317650508872988544) [(6, 3), (8, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 542 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0542_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0542
        rs_R010_ueqv_R010NYY_generator_05_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_05_0542 := by
  native_decide

/-- Coefficient term 543 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0543 : Poly :=
[
  term ((-1353319841726368049 : Rat) / 47725405166179328) [(6, 1), (8, 1), (15, 2), (16, 1)]
]

/-- Partial product 543 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0543 : Poly :=
[
  term ((-1353319841726368049 : Rat) / 47725405166179328) [(6, 1), (7, 2), (8, 1), (15, 2), (16, 1)],
  term ((-1353319841726368049 : Rat) / 23862702583089664) [(6, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((1353319841726368049 : Rat) / 47725405166179328) [(6, 1), (8, 1), (14, 2), (15, 2), (16, 1)],
  term ((1353319841726368049 : Rat) / 47725405166179328) [(6, 1), (8, 1), (15, 4), (16, 1)],
  term ((1353319841726368049 : Rat) / 23862702583089664) [(6, 2), (8, 1), (15, 2), (16, 1)],
  term ((-1353319841726368049 : Rat) / 47725405166179328) [(6, 3), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 543 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0543_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0543
        rs_R010_ueqv_R010NYY_generator_05_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_05_0543 := by
  native_decide

/-- Coefficient term 544 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0544 : Poly :=
[
  term ((-3728508138334321 : Rat) / 1278359066951232) [(6, 1), (8, 1), (16, 1)]
]

/-- Partial product 544 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0544 : Poly :=
[
  term ((-3728508138334321 : Rat) / 1278359066951232) [(6, 1), (7, 2), (8, 1), (16, 1)],
  term ((-3728508138334321 : Rat) / 639179533475616) [(6, 1), (8, 1), (14, 1), (16, 1)],
  term ((3728508138334321 : Rat) / 1278359066951232) [(6, 1), (8, 1), (14, 2), (16, 1)],
  term ((3728508138334321 : Rat) / 1278359066951232) [(6, 1), (8, 1), (15, 2), (16, 1)],
  term ((3728508138334321 : Rat) / 639179533475616) [(6, 2), (8, 1), (16, 1)],
  term ((-3728508138334321 : Rat) / 1278359066951232) [(6, 3), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 544 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0544_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0544
        rs_R010_ueqv_R010NYY_generator_05_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_05_0544 := by
  native_decide

/-- Coefficient term 545 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0545 : Poly :=
[
  term ((-28288027507455275093431 : Rat) / 303247224425903450112) [(6, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 545 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0545 : Poly :=
[
  term ((-28288027507455275093431 : Rat) / 303247224425903450112) [(6, 1), (7, 2), (9, 1), (11, 1), (16, 1)],
  term ((-28288027507455275093431 : Rat) / 151623612212951725056) [(6, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((28288027507455275093431 : Rat) / 303247224425903450112) [(6, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((28288027507455275093431 : Rat) / 303247224425903450112) [(6, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((28288027507455275093431 : Rat) / 151623612212951725056) [(6, 2), (9, 1), (11, 1), (16, 1)],
  term ((-28288027507455275093431 : Rat) / 303247224425903450112) [(6, 3), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 545 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0545_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0545
        rs_R010_ueqv_R010NYY_generator_05_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_05_0545 := by
  native_decide

/-- Coefficient term 546 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0546 : Poly :=
[
  term ((-711968041840092767 : Rat) / 47725405166179328) [(6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 546 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0546 : Poly :=
[
  term ((-711968041840092767 : Rat) / 47725405166179328) [(6, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-711968041840092767 : Rat) / 23862702583089664) [(6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((711968041840092767 : Rat) / 47725405166179328) [(6, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((711968041840092767 : Rat) / 47725405166179328) [(6, 1), (9, 1), (15, 3), (16, 1)],
  term ((711968041840092767 : Rat) / 23862702583089664) [(6, 2), (9, 1), (15, 1), (16, 1)],
  term ((-711968041840092767 : Rat) / 47725405166179328) [(6, 3), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 546 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0546_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0546
        rs_R010_ueqv_R010NYY_generator_05_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_05_0546 := by
  native_decide

/-- Coefficient term 547 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0547 : Poly :=
[
  term ((39023555492874908592505 : Rat) / 303247224425903450112) [(7, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 547 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0547 : Poly :=
[
  term ((-39023555492874908592505 : Rat) / 151623612212951725056) [(6, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((39023555492874908592505 : Rat) / 303247224425903450112) [(6, 2), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((39023555492874908592505 : Rat) / 151623612212951725056) [(7, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-39023555492874908592505 : Rat) / 303247224425903450112) [(7, 1), (9, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-39023555492874908592505 : Rat) / 303247224425903450112) [(7, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((39023555492874908592505 : Rat) / 303247224425903450112) [(7, 3), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 547 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0547_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0547
        rs_R010_ueqv_R010NYY_generator_05_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_05_0547 := by
  native_decide

/-- Coefficient term 548 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0548 : Poly :=
[
  term ((-69556067785407573619 : Rat) / 6317650508872988544) [(7, 1), (9, 1), (11, 2), (16, 1)]
]

/-- Partial product 548 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0548 : Poly :=
[
  term ((69556067785407573619 : Rat) / 3158825254436494272) [(6, 1), (7, 1), (9, 1), (11, 2), (16, 1)],
  term ((-69556067785407573619 : Rat) / 6317650508872988544) [(6, 2), (7, 1), (9, 1), (11, 2), (16, 1)],
  term ((-69556067785407573619 : Rat) / 3158825254436494272) [(7, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 6317650508872988544) [(7, 1), (9, 1), (11, 2), (14, 2), (16, 1)],
  term ((69556067785407573619 : Rat) / 6317650508872988544) [(7, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((-69556067785407573619 : Rat) / 6317650508872988544) [(7, 3), (9, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 548 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0548_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0548
        rs_R010_ueqv_R010NYY_generator_05_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_05_0548 := by
  native_decide

/-- Coefficient term 549 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0549 : Poly :=
[
  term ((1353319841726368049 : Rat) / 47725405166179328) [(7, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 549 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0549 : Poly :=
[
  term ((-1353319841726368049 : Rat) / 23862702583089664) [(6, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((1353319841726368049 : Rat) / 47725405166179328) [(6, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((1353319841726368049 : Rat) / 23862702583089664) [(7, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1353319841726368049 : Rat) / 47725405166179328) [(7, 1), (9, 1), (14, 2), (15, 2), (16, 1)],
  term ((-1353319841726368049 : Rat) / 47725405166179328) [(7, 1), (9, 1), (15, 4), (16, 1)],
  term ((1353319841726368049 : Rat) / 47725405166179328) [(7, 3), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 549 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0549_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0549
        rs_R010_ueqv_R010NYY_generator_05_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_05_0549 := by
  native_decide

/-- Coefficient term 550 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0550 : Poly :=
[
  term ((3728508138334321 : Rat) / 1278359066951232) [(7, 1), (9, 1), (16, 1)]
]

/-- Partial product 550 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0550 : Poly :=
[
  term ((-3728508138334321 : Rat) / 639179533475616) [(6, 1), (7, 1), (9, 1), (16, 1)],
  term ((3728508138334321 : Rat) / 1278359066951232) [(6, 2), (7, 1), (9, 1), (16, 1)],
  term ((3728508138334321 : Rat) / 639179533475616) [(7, 1), (9, 1), (14, 1), (16, 1)],
  term ((-3728508138334321 : Rat) / 1278359066951232) [(7, 1), (9, 1), (14, 2), (16, 1)],
  term ((-3728508138334321 : Rat) / 1278359066951232) [(7, 1), (9, 1), (15, 2), (16, 1)],
  term ((3728508138334321 : Rat) / 1278359066951232) [(7, 3), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 550 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0550_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0550
        rs_R010_ueqv_R010NYY_generator_05_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_05_0550 := by
  native_decide

/-- Coefficient term 551 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0551 : Poly :=
[
  term ((-240937308571641895789 : Rat) / 6317650508872988544) [(7, 1), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 551 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0551 : Poly :=
[
  term ((240937308571641895789 : Rat) / 3158825254436494272) [(6, 1), (7, 1), (9, 2), (11, 1), (16, 1)],
  term ((-240937308571641895789 : Rat) / 6317650508872988544) [(6, 2), (7, 1), (9, 2), (11, 1), (16, 1)],
  term ((-240937308571641895789 : Rat) / 3158825254436494272) [(7, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((240937308571641895789 : Rat) / 6317650508872988544) [(7, 1), (9, 2), (11, 1), (14, 2), (16, 1)],
  term ((240937308571641895789 : Rat) / 6317650508872988544) [(7, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((-240937308571641895789 : Rat) / 6317650508872988544) [(7, 3), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 551 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0551_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0551
        rs_R010_ueqv_R010NYY_generator_05_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_05_0551 := by
  native_decide

/-- Coefficient term 552 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0552 : Poly :=
[
  term ((-70302592550481639 : Rat) / 5965675645772416) [(7, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 552 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0552 : Poly :=
[
  term ((70302592550481639 : Rat) / 2982837822886208) [(6, 1), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((-70302592550481639 : Rat) / 5965675645772416) [(6, 2), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((-70302592550481639 : Rat) / 2982837822886208) [(7, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 5965675645772416) [(7, 1), (9, 2), (14, 2), (15, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 5965675645772416) [(7, 1), (9, 2), (15, 3), (16, 1)],
  term ((-70302592550481639 : Rat) / 5965675645772416) [(7, 3), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 552 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0552_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0552
        rs_R010_ueqv_R010NYY_generator_05_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_05_0552 := by
  native_decide

/-- Coefficient term 553 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0553 : Poly :=
[
  term ((-115359153689655303847 : Rat) / 4211767005915325696) [(8, 1), (9, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 553 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0553 : Poly :=
[
  term ((115359153689655303847 : Rat) / 2105883502957662848) [(6, 1), (8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-115359153689655303847 : Rat) / 4211767005915325696) [(6, 2), (8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-115359153689655303847 : Rat) / 4211767005915325696) [(7, 2), (8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-115359153689655303847 : Rat) / 2105883502957662848) [(8, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((115359153689655303847 : Rat) / 4211767005915325696) [(8, 1), (9, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((115359153689655303847 : Rat) / 4211767005915325696) [(8, 1), (9, 1), (10, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 553 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0553_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0553
        rs_R010_ueqv_R010NYY_generator_05_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_05_0553 := by
  native_decide

/-- Coefficient term 554 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0554 : Poly :=
[
  term ((-70302592550481639 : Rat) / 5965675645772416) [(8, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 554 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0554 : Poly :=
[
  term ((70302592550481639 : Rat) / 2982837822886208) [(6, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-70302592550481639 : Rat) / 5965675645772416) [(6, 2), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-70302592550481639 : Rat) / 5965675645772416) [(7, 2), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-70302592550481639 : Rat) / 2982837822886208) [(8, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 5965675645772416) [(8, 1), (9, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 5965675645772416) [(8, 1), (9, 1), (10, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 554 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0554_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0554
        rs_R010_ueqv_R010NYY_generator_05_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_05_0554 := by
  native_decide

/-- Coefficient term 555 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0555 : Poly :=
[
  term ((-927970231076998320611 : Rat) / 101082408141967816704) [(8, 1), (9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 555 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0555 : Poly :=
[
  term ((927970231076998320611 : Rat) / 50541204070983908352) [(6, 1), (8, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-927970231076998320611 : Rat) / 101082408141967816704) [(6, 2), (8, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-927970231076998320611 : Rat) / 101082408141967816704) [(7, 2), (8, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((927970231076998320611 : Rat) / 101082408141967816704) [(8, 1), (9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-927970231076998320611 : Rat) / 50541204070983908352) [(8, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((927970231076998320611 : Rat) / 101082408141967816704) [(8, 1), (9, 1), (11, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 555 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0555_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0555
        rs_R010_ueqv_R010NYY_generator_05_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_05_0555 := by
  native_decide

/-- Coefficient term 556 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0556 : Poly :=
[
  term ((115859141337574330264073 : Rat) / 606494448851806900224) [(8, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 556 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0556 : Poly :=
[
  term ((-115859141337574330264073 : Rat) / 303247224425903450112) [(6, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((115859141337574330264073 : Rat) / 606494448851806900224) [(6, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((115859141337574330264073 : Rat) / 606494448851806900224) [(7, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((115859141337574330264073 : Rat) / 303247224425903450112) [(8, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-115859141337574330264073 : Rat) / 606494448851806900224) [(8, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-115859141337574330264073 : Rat) / 606494448851806900224) [(8, 1), (9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 556 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0556_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0556
        rs_R010_ueqv_R010NYY_generator_05_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_05_0556 := by
  native_decide

/-- Coefficient term 557 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0557 : Poly :=
[
  term ((118762376429848645 : Rat) / 47725405166179328) [(8, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 557 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0557 : Poly :=
[
  term ((-118762376429848645 : Rat) / 23862702583089664) [(6, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((118762376429848645 : Rat) / 47725405166179328) [(6, 2), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((118762376429848645 : Rat) / 47725405166179328) [(7, 2), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-118762376429848645 : Rat) / 47725405166179328) [(8, 1), (9, 1), (14, 1), (15, 3), (16, 1)],
  term ((118762376429848645 : Rat) / 23862702583089664) [(8, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-118762376429848645 : Rat) / 47725405166179328) [(8, 1), (9, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 557 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0557_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0557
        rs_R010_ueqv_R010NYY_generator_05_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_05_0557 := by
  native_decide

/-- Coefficient term 558 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0558 : Poly :=
[
  term ((2832754402317459495 : Rat) / 95450810332358656) [(8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 558 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0558 : Poly :=
[
  term ((-2832754402317459495 : Rat) / 47725405166179328) [(6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((2832754402317459495 : Rat) / 95450810332358656) [(6, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((2832754402317459495 : Rat) / 95450810332358656) [(7, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((2832754402317459495 : Rat) / 47725405166179328) [(8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2832754402317459495 : Rat) / 95450810332358656) [(8, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2832754402317459495 : Rat) / 95450810332358656) [(8, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 558 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0558_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0558
        rs_R010_ueqv_R010NYY_generator_05_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_05_0558 := by
  native_decide

/-- Coefficient term 559 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0559 : Poly :=
[
  term ((40653121365766723152949 : Rat) / 303247224425903450112) [(8, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 559 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0559 : Poly :=
[
  term ((-40653121365766723152949 : Rat) / 151623612212951725056) [(6, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((40653121365766723152949 : Rat) / 303247224425903450112) [(6, 2), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((40653121365766723152949 : Rat) / 303247224425903450112) [(7, 2), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((40653121365766723152949 : Rat) / 151623612212951725056) [(8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-40653121365766723152949 : Rat) / 303247224425903450112) [(8, 1), (10, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-40653121365766723152949 : Rat) / 303247224425903450112) [(8, 1), (10, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 559 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0559_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0559
        rs_R010_ueqv_R010NYY_generator_05_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_05_0559 := by
  native_decide

/-- Coefficient term 560 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0560 : Poly :=
[
  term ((-69556067785407573619 : Rat) / 6317650508872988544) [(8, 1), (10, 1), (11, 2), (16, 1)]
]

/-- Partial product 560 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0560 : Poly :=
[
  term ((69556067785407573619 : Rat) / 3158825254436494272) [(6, 1), (8, 1), (10, 1), (11, 2), (16, 1)],
  term ((-69556067785407573619 : Rat) / 6317650508872988544) [(6, 2), (8, 1), (10, 1), (11, 2), (16, 1)],
  term ((-69556067785407573619 : Rat) / 6317650508872988544) [(7, 2), (8, 1), (10, 1), (11, 2), (16, 1)],
  term ((-69556067785407573619 : Rat) / 3158825254436494272) [(8, 1), (10, 1), (11, 2), (14, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 6317650508872988544) [(8, 1), (10, 1), (11, 2), (14, 2), (16, 1)],
  term ((69556067785407573619 : Rat) / 6317650508872988544) [(8, 1), (10, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 560 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0560_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0560
        rs_R010_ueqv_R010NYY_generator_05_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_05_0560 := by
  native_decide

/-- Coefficient term 561 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0561 : Poly :=
[
  term ((-848513315802319 : Rat) / 1704478755934976) [(8, 1), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 561 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0561 : Poly :=
[
  term ((848513315802319 : Rat) / 852239377967488) [(6, 1), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((-848513315802319 : Rat) / 1704478755934976) [(6, 2), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((-848513315802319 : Rat) / 1704478755934976) [(7, 2), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((848513315802319 : Rat) / 1704478755934976) [(8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-848513315802319 : Rat) / 852239377967488) [(8, 1), (10, 1), (14, 2), (16, 1)],
  term ((848513315802319 : Rat) / 1704478755934976) [(8, 1), (10, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 561 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0561_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0561
        rs_R010_ueqv_R010NYY_generator_05_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_05_0561 := by
  native_decide

/-- Coefficient term 562 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0562 : Poly :=
[
  term ((1353319841726368049 : Rat) / 47725405166179328) [(8, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 562 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0562 : Poly :=
[
  term ((-1353319841726368049 : Rat) / 23862702583089664) [(6, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((1353319841726368049 : Rat) / 47725405166179328) [(6, 2), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((1353319841726368049 : Rat) / 47725405166179328) [(7, 2), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((1353319841726368049 : Rat) / 23862702583089664) [(8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1353319841726368049 : Rat) / 47725405166179328) [(8, 1), (10, 1), (14, 2), (15, 2), (16, 1)],
  term ((-1353319841726368049 : Rat) / 47725405166179328) [(8, 1), (10, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 562 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0562_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0562
        rs_R010_ueqv_R010NYY_generator_05_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_05_0562 := by
  native_decide

/-- Coefficient term 563 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0563 : Poly :=
[
  term ((-16389209499091483 : Rat) / 10226872535609856) [(8, 1), (10, 1), (16, 1)]
]

/-- Partial product 563 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0563 : Poly :=
[
  term ((16389209499091483 : Rat) / 5113436267804928) [(6, 1), (8, 1), (10, 1), (16, 1)],
  term ((-16389209499091483 : Rat) / 10226872535609856) [(6, 2), (8, 1), (10, 1), (16, 1)],
  term ((-16389209499091483 : Rat) / 10226872535609856) [(7, 2), (8, 1), (10, 1), (16, 1)],
  term ((-16389209499091483 : Rat) / 5113436267804928) [(8, 1), (10, 1), (14, 1), (16, 1)],
  term ((16389209499091483 : Rat) / 10226872535609856) [(8, 1), (10, 1), (14, 2), (16, 1)],
  term ((16389209499091483 : Rat) / 10226872535609856) [(8, 1), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 563 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0563_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0563
        rs_R010_ueqv_R010NYY_generator_05_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_05_0563 := by
  native_decide

/-- Coefficient term 564 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0564 : Poly :=
[
  term ((349947488033723 : Rat) / 852239377967488) [(8, 1), (10, 2), (16, 1)]
]

/-- Partial product 564 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0564 : Poly :=
[
  term ((-349947488033723 : Rat) / 426119688983744) [(6, 1), (8, 1), (10, 2), (16, 1)],
  term ((349947488033723 : Rat) / 852239377967488) [(6, 2), (8, 1), (10, 2), (16, 1)],
  term ((349947488033723 : Rat) / 852239377967488) [(7, 2), (8, 1), (10, 2), (16, 1)],
  term ((349947488033723 : Rat) / 426119688983744) [(8, 1), (10, 2), (14, 1), (16, 1)],
  term ((-349947488033723 : Rat) / 852239377967488) [(8, 1), (10, 2), (14, 2), (16, 1)],
  term ((-349947488033723 : Rat) / 852239377967488) [(8, 1), (10, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 564 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0564_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0564
        rs_R010_ueqv_R010NYY_generator_05_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_05_0564 := by
  native_decide

/-- Coefficient term 565 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0565 : Poly :=
[
  term ((3674057352858660123931 : Rat) / 75811806106475862528) [(8, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 565 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0565 : Poly :=
[
  term ((-3674057352858660123931 : Rat) / 37905903053237931264) [(6, 1), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((3674057352858660123931 : Rat) / 75811806106475862528) [(6, 2), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((3674057352858660123931 : Rat) / 75811806106475862528) [(7, 2), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3674057352858660123931 : Rat) / 75811806106475862528) [(8, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((3674057352858660123931 : Rat) / 37905903053237931264) [(8, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-3674057352858660123931 : Rat) / 75811806106475862528) [(8, 1), (11, 1), (13, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 565 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0565_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0565
        rs_R010_ueqv_R010NYY_generator_05_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_05_0565 := by
  native_decide

/-- Coefficient term 566 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0566 : Poly :=
[
  term ((-2362877370809801204651 : Rat) / 151623612212951725056) [(8, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 566 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0566 : Poly :=
[
  term ((2362877370809801204651 : Rat) / 75811806106475862528) [(6, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-2362877370809801204651 : Rat) / 151623612212951725056) [(6, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-2362877370809801204651 : Rat) / 151623612212951725056) [(7, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-2362877370809801204651 : Rat) / 75811806106475862528) [(8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((2362877370809801204651 : Rat) / 151623612212951725056) [(8, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((2362877370809801204651 : Rat) / 151623612212951725056) [(8, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 566 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0566_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0566
        rs_R010_ueqv_R010NYY_generator_05_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_05_0566 := by
  native_decide

/-- Coefficient term 567 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0567 : Poly :=
[
  term ((1186750147506747 : Rat) / 644937907651072) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 567 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0567 : Poly :=
[
  term ((-1186750147506747 : Rat) / 322468953825536) [(6, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1186750147506747 : Rat) / 644937907651072) [(6, 2), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1186750147506747 : Rat) / 644937907651072) [(7, 2), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1186750147506747 : Rat) / 644937907651072) [(8, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((1186750147506747 : Rat) / 322468953825536) [(8, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1186750147506747 : Rat) / 644937907651072) [(8, 1), (11, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 567 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0567_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0567
        rs_R010_ueqv_R010NYY_generator_05_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_05_0567 := by
  native_decide

/-- Coefficient term 568 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0568 : Poly :=
[
  term ((31308594075310269003563 : Rat) / 303247224425903450112) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 568 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0568 : Poly :=
[
  term ((-31308594075310269003563 : Rat) / 151623612212951725056) [(6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((31308594075310269003563 : Rat) / 303247224425903450112) [(6, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((31308594075310269003563 : Rat) / 303247224425903450112) [(7, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((31308594075310269003563 : Rat) / 151623612212951725056) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-31308594075310269003563 : Rat) / 303247224425903450112) [(8, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-31308594075310269003563 : Rat) / 303247224425903450112) [(8, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 568 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0568_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0568
        rs_R010_ueqv_R010NYY_generator_05_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_05_0568 := by
  native_decide

/-- Coefficient term 569 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0569 : Poly :=
[
  term ((234049543066301841079 : Rat) / 16847068023661302784) [(8, 1), (11, 2), (14, 1), (16, 1)]
]

/-- Partial product 569 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0569 : Poly :=
[
  term ((-234049543066301841079 : Rat) / 8423534011830651392) [(6, 1), (8, 1), (11, 2), (14, 1), (16, 1)],
  term ((234049543066301841079 : Rat) / 16847068023661302784) [(6, 2), (8, 1), (11, 2), (14, 1), (16, 1)],
  term ((234049543066301841079 : Rat) / 16847068023661302784) [(7, 2), (8, 1), (11, 2), (14, 1), (16, 1)],
  term ((-234049543066301841079 : Rat) / 16847068023661302784) [(8, 1), (11, 2), (14, 1), (15, 2), (16, 1)],
  term ((234049543066301841079 : Rat) / 8423534011830651392) [(8, 1), (11, 2), (14, 2), (16, 1)],
  term ((-234049543066301841079 : Rat) / 16847068023661302784) [(8, 1), (11, 2), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 569 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0569_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0569
        rs_R010_ueqv_R010NYY_generator_05_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_05_0569 := by
  native_decide

/-- Coefficient term 570 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0570 : Poly :=
[
  term ((-773530512246286335553 : Rat) / 50541204070983908352) [(8, 1), (11, 2), (16, 1)]
]

/-- Partial product 570 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0570 : Poly :=
[
  term ((773530512246286335553 : Rat) / 25270602035491954176) [(6, 1), (8, 1), (11, 2), (16, 1)],
  term ((-773530512246286335553 : Rat) / 50541204070983908352) [(6, 2), (8, 1), (11, 2), (16, 1)],
  term ((-773530512246286335553 : Rat) / 50541204070983908352) [(7, 2), (8, 1), (11, 2), (16, 1)],
  term ((-773530512246286335553 : Rat) / 25270602035491954176) [(8, 1), (11, 2), (14, 1), (16, 1)],
  term ((773530512246286335553 : Rat) / 50541204070983908352) [(8, 1), (11, 2), (14, 2), (16, 1)],
  term ((773530512246286335553 : Rat) / 50541204070983908352) [(8, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 570 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0570_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0570
        rs_R010_ueqv_R010NYY_generator_05_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_05_0570 := by
  native_decide

/-- Coefficient term 571 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0571 : Poly :=
[
  term ((16549472857713853 : Rat) / 1491418911443104) [(8, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 571 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0571 : Poly :=
[
  term ((-16549472857713853 : Rat) / 745709455721552) [(6, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((16549472857713853 : Rat) / 1491418911443104) [(6, 2), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((16549472857713853 : Rat) / 1491418911443104) [(7, 2), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-16549472857713853 : Rat) / 1491418911443104) [(8, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((16549472857713853 : Rat) / 745709455721552) [(8, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-16549472857713853 : Rat) / 1491418911443104) [(8, 1), (13, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 571 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0571_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0571
        rs_R010_ueqv_R010NYY_generator_05_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_05_0571 := by
  native_decide

/-- Coefficient term 572 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0572 : Poly :=
[
  term ((-45043032468617529 : Rat) / 47725405166179328) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 572 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0572 : Poly :=
[
  term ((45043032468617529 : Rat) / 23862702583089664) [(6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-45043032468617529 : Rat) / 47725405166179328) [(6, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-45043032468617529 : Rat) / 47725405166179328) [(7, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-45043032468617529 : Rat) / 23862702583089664) [(8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((45043032468617529 : Rat) / 47725405166179328) [(8, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((45043032468617529 : Rat) / 47725405166179328) [(8, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 572 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0572_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0572
        rs_R010_ueqv_R010NYY_generator_05_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_05_0572 := by
  native_decide

/-- Coefficient term 573 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0573 : Poly :=
[
  term ((3084653865858353 : Rat) / 958769300213424) [(8, 1), (14, 1), (16, 1)]
]

/-- Partial product 573 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0573 : Poly :=
[
  term ((-3084653865858353 : Rat) / 479384650106712) [(6, 1), (8, 1), (14, 1), (16, 1)],
  term ((3084653865858353 : Rat) / 958769300213424) [(6, 2), (8, 1), (14, 1), (16, 1)],
  term ((3084653865858353 : Rat) / 958769300213424) [(7, 2), (8, 1), (14, 1), (16, 1)],
  term ((-3084653865858353 : Rat) / 958769300213424) [(8, 1), (14, 1), (15, 2), (16, 1)],
  term ((3084653865858353 : Rat) / 479384650106712) [(8, 1), (14, 2), (16, 1)],
  term ((-3084653865858353 : Rat) / 958769300213424) [(8, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 573 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0573_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0573
        rs_R010_ueqv_R010NYY_generator_05_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_05_0573 := by
  native_decide

/-- Coefficient term 574 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0574 : Poly :=
[
  term ((178703730328681975 : Rat) / 6817915023739904) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 574 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0574 : Poly :=
[
  term ((-178703730328681975 : Rat) / 3408957511869952) [(6, 1), (8, 1), (15, 2), (16, 1)],
  term ((178703730328681975 : Rat) / 6817915023739904) [(6, 2), (8, 1), (15, 2), (16, 1)],
  term ((178703730328681975 : Rat) / 6817915023739904) [(7, 2), (8, 1), (15, 2), (16, 1)],
  term ((178703730328681975 : Rat) / 3408957511869952) [(8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-178703730328681975 : Rat) / 6817915023739904) [(8, 1), (14, 2), (15, 2), (16, 1)],
  term ((-178703730328681975 : Rat) / 6817915023739904) [(8, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 574 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0574_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0574
        rs_R010_ueqv_R010NYY_generator_05_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_05_0574 := by
  native_decide

/-- Coefficient term 575 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0575 : Poly :=
[
  term ((-5919904330058953 : Rat) / 3229538695455744) [(8, 1), (16, 1)]
]

/-- Partial product 575 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0575 : Poly :=
[
  term ((5919904330058953 : Rat) / 1614769347727872) [(6, 1), (8, 1), (16, 1)],
  term ((-5919904330058953 : Rat) / 3229538695455744) [(6, 2), (8, 1), (16, 1)],
  term ((-5919904330058953 : Rat) / 3229538695455744) [(7, 2), (8, 1), (16, 1)],
  term ((-5919904330058953 : Rat) / 1614769347727872) [(8, 1), (14, 1), (16, 1)],
  term ((5919904330058953 : Rat) / 3229538695455744) [(8, 1), (14, 2), (16, 1)],
  term ((5919904330058953 : Rat) / 3229538695455744) [(8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 575 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0575_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0575
        rs_R010_ueqv_R010NYY_generator_05_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_05_0575 := by
  native_decide

/-- Coefficient term 576 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0576 : Poly :=
[
  term ((240937308571641895789 : Rat) / 6317650508872988544) [(9, 1), (10, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 576 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0576 : Poly :=
[
  term ((-240937308571641895789 : Rat) / 3158825254436494272) [(6, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((240937308571641895789 : Rat) / 6317650508872988544) [(6, 2), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((240937308571641895789 : Rat) / 6317650508872988544) [(7, 2), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-240937308571641895789 : Rat) / 6317650508872988544) [(9, 1), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((240937308571641895789 : Rat) / 3158825254436494272) [(9, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((-240937308571641895789 : Rat) / 6317650508872988544) [(9, 1), (10, 1), (11, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 576 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0576_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0576
        rs_R010_ueqv_R010NYY_generator_05_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_05_0576 := by
  native_decide

/-- Coefficient term 577 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0577 : Poly :=
[
  term ((1877072492831531603975 : Rat) / 50541204070983908352) [(9, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 577 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0577 : Poly :=
[
  term ((-1877072492831531603975 : Rat) / 25270602035491954176) [(6, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((1877072492831531603975 : Rat) / 50541204070983908352) [(6, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((1877072492831531603975 : Rat) / 50541204070983908352) [(7, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((1877072492831531603975 : Rat) / 25270602035491954176) [(9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1877072492831531603975 : Rat) / 50541204070983908352) [(9, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((-1877072492831531603975 : Rat) / 50541204070983908352) [(9, 1), (10, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 577 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0577_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0577
        rs_R010_ueqv_R010NYY_generator_05_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_05_0577 := by
  native_decide

/-- Coefficient term 578 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0578 : Poly :=
[
  term ((349947488033723 : Rat) / 426119688983744) [(9, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 578 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0578 : Poly :=
[
  term ((-349947488033723 : Rat) / 213059844491872) [(6, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((349947488033723 : Rat) / 426119688983744) [(6, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((349947488033723 : Rat) / 426119688983744) [(7, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((349947488033723 : Rat) / 213059844491872) [(9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-349947488033723 : Rat) / 426119688983744) [(9, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((-349947488033723 : Rat) / 426119688983744) [(9, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 578 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0578_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0578
        rs_R010_ueqv_R010NYY_generator_05_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_05_0578 := by
  native_decide

/-- Coefficient term 579 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0579 : Poly :=
[
  term ((70302592550481639 : Rat) / 5965675645772416) [(9, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 579 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0579 : Poly :=
[
  term ((-70302592550481639 : Rat) / 2982837822886208) [(6, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 5965675645772416) [(6, 2), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 5965675645772416) [(7, 2), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-70302592550481639 : Rat) / 5965675645772416) [(9, 1), (10, 1), (14, 1), (15, 3), (16, 1)],
  term ((70302592550481639 : Rat) / 2982837822886208) [(9, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-70302592550481639 : Rat) / 5965675645772416) [(9, 1), (10, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 579 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0579_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0579
        rs_R010_ueqv_R010NYY_generator_05_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_05_0579 := by
  native_decide

/-- Coefficient term 580 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0580 : Poly :=
[
  term ((90014065649565359 : Rat) / 11931351291544832) [(9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 580 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0580 : Poly :=
[
  term ((-90014065649565359 : Rat) / 5965675645772416) [(6, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((90014065649565359 : Rat) / 11931351291544832) [(6, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((90014065649565359 : Rat) / 11931351291544832) [(7, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((90014065649565359 : Rat) / 5965675645772416) [(9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-90014065649565359 : Rat) / 11931351291544832) [(9, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-90014065649565359 : Rat) / 11931351291544832) [(9, 1), (10, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 580 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0580_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0580
        rs_R010_ueqv_R010NYY_generator_05_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_05_0580 := by
  native_decide

/-- Coefficient term 581 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0581 : Poly :=
[
  term ((9655207142042678387 : Rat) / 4813448006760372224) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 581 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0581 : Poly :=
[
  term ((-9655207142042678387 : Rat) / 2406724003380186112) [(6, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((9655207142042678387 : Rat) / 4813448006760372224) [(6, 2), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((9655207142042678387 : Rat) / 4813448006760372224) [(7, 2), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9655207142042678387 : Rat) / 4813448006760372224) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((9655207142042678387 : Rat) / 2406724003380186112) [(9, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-9655207142042678387 : Rat) / 4813448006760372224) [(9, 1), (11, 1), (13, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 581 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0581_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0581
        rs_R010_ueqv_R010NYY_generator_05_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_05_0581 := by
  native_decide

/-- Coefficient term 582 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0582 : Poly :=
[
  term ((-5215218605463587495723 : Rat) / 202164816283935633408) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 582 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0582 : Poly :=
[
  term ((5215218605463587495723 : Rat) / 101082408141967816704) [(6, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5215218605463587495723 : Rat) / 202164816283935633408) [(6, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5215218605463587495723 : Rat) / 202164816283935633408) [(7, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5215218605463587495723 : Rat) / 101082408141967816704) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((5215218605463587495723 : Rat) / 202164816283935633408) [(9, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((5215218605463587495723 : Rat) / 202164816283935633408) [(9, 1), (11, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 582 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0582_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0582
        rs_R010_ueqv_R010NYY_generator_05_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_05_0582 := by
  native_decide

/-- Coefficient term 583 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0583 : Poly :=
[
  term ((-4470641786420435117147 : Rat) / 404329632567871266816) [(9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 583 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0583 : Poly :=
[
  term ((4470641786420435117147 : Rat) / 202164816283935633408) [(6, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-4470641786420435117147 : Rat) / 404329632567871266816) [(6, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-4470641786420435117147 : Rat) / 404329632567871266816) [(7, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((4470641786420435117147 : Rat) / 404329632567871266816) [(9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4470641786420435117147 : Rat) / 202164816283935633408) [(9, 1), (11, 1), (14, 2), (16, 1)],
  term ((4470641786420435117147 : Rat) / 404329632567871266816) [(9, 1), (11, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 583 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0583_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0583
        rs_R010_ueqv_R010NYY_generator_05_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_05_0583 := by
  native_decide

/-- Coefficient term 584 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0584 : Poly :=
[
  term ((-18312078542974526913 : Rat) / 1375270859074392064) [(9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 584 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0584 : Poly :=
[
  term ((18312078542974526913 : Rat) / 687635429537196032) [(6, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-18312078542974526913 : Rat) / 1375270859074392064) [(6, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-18312078542974526913 : Rat) / 1375270859074392064) [(7, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-18312078542974526913 : Rat) / 687635429537196032) [(9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((18312078542974526913 : Rat) / 1375270859074392064) [(9, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((18312078542974526913 : Rat) / 1375270859074392064) [(9, 1), (11, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 584 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0584_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0584
        rs_R010_ueqv_R010NYY_generator_05_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_05_0584 := by
  native_decide

/-- Coefficient term 585 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0585 : Poly :=
[
  term ((-107738122480090876834895 : Rat) / 606494448851806900224) [(9, 1), (11, 1), (16, 1)]
]

/-- Partial product 585 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0585 : Poly :=
[
  term ((107738122480090876834895 : Rat) / 303247224425903450112) [(6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-107738122480090876834895 : Rat) / 606494448851806900224) [(6, 2), (9, 1), (11, 1), (16, 1)],
  term ((-107738122480090876834895 : Rat) / 606494448851806900224) [(7, 2), (9, 1), (11, 1), (16, 1)],
  term ((-107738122480090876834895 : Rat) / 303247224425903450112) [(9, 1), (11, 1), (14, 1), (16, 1)],
  term ((107738122480090876834895 : Rat) / 606494448851806900224) [(9, 1), (11, 1), (14, 2), (16, 1)],
  term ((107738122480090876834895 : Rat) / 606494448851806900224) [(9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 585 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0585_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0585
        rs_R010_ueqv_R010NYY_generator_05_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_05_0585 := by
  native_decide

/-- Coefficient term 586 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0586 : Poly :=
[
  term ((-240473047099696446673 : Rat) / 25270602035491954176) [(9, 1), (11, 2), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 586 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0586 : Poly :=
[
  term ((240473047099696446673 : Rat) / 12635301017745977088) [(6, 1), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-240473047099696446673 : Rat) / 25270602035491954176) [(6, 2), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-240473047099696446673 : Rat) / 25270602035491954176) [(7, 2), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((240473047099696446673 : Rat) / 25270602035491954176) [(9, 1), (11, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-240473047099696446673 : Rat) / 12635301017745977088) [(9, 1), (11, 2), (13, 1), (14, 2), (16, 1)],
  term ((240473047099696446673 : Rat) / 25270602035491954176) [(9, 1), (11, 2), (13, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 586 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0586_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0586
        rs_R010_ueqv_R010NYY_generator_05_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_05_0586 := by
  native_decide

/-- Coefficient term 587 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0587 : Poly :=
[
  term ((565277130855222650825 : Rat) / 25270602035491954176) [(9, 1), (11, 2), (13, 1), (16, 1)]
]

/-- Partial product 587 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0587 : Poly :=
[
  term ((-565277130855222650825 : Rat) / 12635301017745977088) [(6, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((565277130855222650825 : Rat) / 25270602035491954176) [(6, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((565277130855222650825 : Rat) / 25270602035491954176) [(7, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((565277130855222650825 : Rat) / 12635301017745977088) [(9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-565277130855222650825 : Rat) / 25270602035491954176) [(9, 1), (11, 2), (13, 1), (14, 2), (16, 1)],
  term ((-565277130855222650825 : Rat) / 25270602035491954176) [(9, 1), (11, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 587 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0587_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0587
        rs_R010_ueqv_R010NYY_generator_05_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_05_0587 := by
  native_decide

/-- Coefficient term 588 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0588 : Poly :=
[
  term ((-3001794751113820687807 : Rat) / 43321032060843350016) [(9, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 588 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0588 : Poly :=
[
  term ((3001794751113820687807 : Rat) / 21660516030421675008) [(6, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-3001794751113820687807 : Rat) / 43321032060843350016) [(6, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-3001794751113820687807 : Rat) / 43321032060843350016) [(7, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-3001794751113820687807 : Rat) / 21660516030421675008) [(9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((3001794751113820687807 : Rat) / 43321032060843350016) [(9, 1), (11, 2), (14, 2), (15, 1), (16, 1)],
  term ((3001794751113820687807 : Rat) / 43321032060843350016) [(9, 1), (11, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 588 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0588_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0588
        rs_R010_ueqv_R010NYY_generator_05_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_05_0588 := by
  native_decide

/-- Coefficient term 589 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0589 : Poly :=
[
  term ((69556067785407573619 : Rat) / 6317650508872988544) [(9, 1), (11, 3), (16, 1)]
]

/-- Partial product 589 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0589 : Poly :=
[
  term ((-69556067785407573619 : Rat) / 3158825254436494272) [(6, 1), (9, 1), (11, 3), (16, 1)],
  term ((69556067785407573619 : Rat) / 6317650508872988544) [(6, 2), (9, 1), (11, 3), (16, 1)],
  term ((69556067785407573619 : Rat) / 6317650508872988544) [(7, 2), (9, 1), (11, 3), (16, 1)],
  term ((69556067785407573619 : Rat) / 3158825254436494272) [(9, 1), (11, 3), (14, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 6317650508872988544) [(9, 1), (11, 3), (14, 2), (16, 1)],
  term ((-69556067785407573619 : Rat) / 6317650508872988544) [(9, 1), (11, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 589 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0589_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0589
        rs_R010_ueqv_R010NYY_generator_05_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_05_0589 := by
  native_decide

/-- Coefficient term 590 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0590 : Poly :=
[
  term ((-183099752496479997 : Rat) / 47725405166179328) [(9, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 590 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0590 : Poly :=
[
  term ((183099752496479997 : Rat) / 23862702583089664) [(6, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-183099752496479997 : Rat) / 47725405166179328) [(6, 2), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-183099752496479997 : Rat) / 47725405166179328) [(7, 2), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((183099752496479997 : Rat) / 47725405166179328) [(9, 1), (13, 1), (14, 1), (15, 4), (16, 1)],
  term ((-183099752496479997 : Rat) / 23862702583089664) [(9, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((183099752496479997 : Rat) / 47725405166179328) [(9, 1), (13, 1), (14, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 590 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0590_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0590
        rs_R010_ueqv_R010NYY_generator_05_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_05_0590 := by
  native_decide

/-- Coefficient term 591 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0591 : Poly :=
[
  term ((1396991133095807 : Rat) / 5113436267804928) [(9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 591 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0591 : Poly :=
[
  term ((-1396991133095807 : Rat) / 2556718133902464) [(6, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((1396991133095807 : Rat) / 5113436267804928) [(6, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((1396991133095807 : Rat) / 5113436267804928) [(7, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1396991133095807 : Rat) / 5113436267804928) [(9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1396991133095807 : Rat) / 2556718133902464) [(9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-1396991133095807 : Rat) / 5113436267804928) [(9, 1), (13, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 591 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0591_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0591
        rs_R010_ueqv_R010NYY_generator_05_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_05_0591 := by
  native_decide

/-- Coefficient term 592 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0592 : Poly :=
[
  term ((-163353597466831685 : Rat) / 13635830047479808) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 592 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0592 : Poly :=
[
  term ((163353597466831685 : Rat) / 6817915023739904) [(6, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-163353597466831685 : Rat) / 13635830047479808) [(6, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-163353597466831685 : Rat) / 13635830047479808) [(7, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-163353597466831685 : Rat) / 6817915023739904) [(9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((163353597466831685 : Rat) / 13635830047479808) [(9, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((163353597466831685 : Rat) / 13635830047479808) [(9, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 592 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0592_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0592
        rs_R010_ueqv_R010NYY_generator_05_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_05_0592 := by
  native_decide

/-- Coefficient term 593 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0593 : Poly :=
[
  term ((2971329079268371 : Rat) / 5113436267804928) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 593 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0593 : Poly :=
[
  term ((-2971329079268371 : Rat) / 2556718133902464) [(6, 1), (9, 1), (13, 1), (16, 1)],
  term ((2971329079268371 : Rat) / 5113436267804928) [(6, 2), (9, 1), (13, 1), (16, 1)],
  term ((2971329079268371 : Rat) / 5113436267804928) [(7, 2), (9, 1), (13, 1), (16, 1)],
  term ((2971329079268371 : Rat) / 2556718133902464) [(9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2971329079268371 : Rat) / 5113436267804928) [(9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-2971329079268371 : Rat) / 5113436267804928) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 593 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0593_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0593
        rs_R010_ueqv_R010NYY_generator_05_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_05_0593 := by
  native_decide

/-- Coefficient term 594 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0594 : Poly :=
[
  term ((-33093482828145841 : Rat) / 10047453719195648) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 594 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0594 : Poly :=
[
  term ((33093482828145841 : Rat) / 5023726859597824) [(6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-33093482828145841 : Rat) / 10047453719195648) [(6, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-33093482828145841 : Rat) / 10047453719195648) [(7, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((33093482828145841 : Rat) / 10047453719195648) [(9, 1), (14, 1), (15, 3), (16, 1)],
  term ((-33093482828145841 : Rat) / 5023726859597824) [(9, 1), (14, 2), (15, 1), (16, 1)],
  term ((33093482828145841 : Rat) / 10047453719195648) [(9, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 594 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0594_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0594
        rs_R010_ueqv_R010NYY_generator_05_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_05_0594 := by
  native_decide

/-- Coefficient term 595 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0595 : Poly :=
[
  term ((-951662774070118849 : Rat) / 23862702583089664) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 595 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0595 : Poly :=
[
  term ((951662774070118849 : Rat) / 11931351291544832) [(6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-951662774070118849 : Rat) / 23862702583089664) [(6, 2), (9, 1), (15, 1), (16, 1)],
  term ((-951662774070118849 : Rat) / 23862702583089664) [(7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-951662774070118849 : Rat) / 11931351291544832) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term ((951662774070118849 : Rat) / 23862702583089664) [(9, 1), (14, 2), (15, 1), (16, 1)],
  term ((951662774070118849 : Rat) / 23862702583089664) [(9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 595 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0595_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0595
        rs_R010_ueqv_R010NYY_generator_05_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_05_0595 := by
  native_decide

/-- Coefficient term 596 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0596 : Poly :=
[
  term ((183099752496479997 : Rat) / 95450810332358656) [(9, 1), (15, 3), (16, 1)]
]

/-- Partial product 596 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0596 : Poly :=
[
  term ((-183099752496479997 : Rat) / 47725405166179328) [(6, 1), (9, 1), (15, 3), (16, 1)],
  term ((183099752496479997 : Rat) / 95450810332358656) [(6, 2), (9, 1), (15, 3), (16, 1)],
  term ((183099752496479997 : Rat) / 95450810332358656) [(7, 2), (9, 1), (15, 3), (16, 1)],
  term ((183099752496479997 : Rat) / 47725405166179328) [(9, 1), (14, 1), (15, 3), (16, 1)],
  term ((-183099752496479997 : Rat) / 95450810332358656) [(9, 1), (14, 2), (15, 3), (16, 1)],
  term ((-183099752496479997 : Rat) / 95450810332358656) [(9, 1), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 596 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0596_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0596
        rs_R010_ueqv_R010NYY_generator_05_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_05_0596 := by
  native_decide

/-- Coefficient term 597 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0597 : Poly :=
[
  term ((-349947488033723 : Rat) / 213059844491872) [(9, 2), (10, 1), (16, 1)]
]

/-- Partial product 597 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0597 : Poly :=
[
  term ((349947488033723 : Rat) / 106529922245936) [(6, 1), (9, 2), (10, 1), (16, 1)],
  term ((-349947488033723 : Rat) / 213059844491872) [(6, 2), (9, 2), (10, 1), (16, 1)],
  term ((-349947488033723 : Rat) / 213059844491872) [(7, 2), (9, 2), (10, 1), (16, 1)],
  term ((-349947488033723 : Rat) / 106529922245936) [(9, 2), (10, 1), (14, 1), (16, 1)],
  term ((349947488033723 : Rat) / 213059844491872) [(9, 2), (10, 1), (14, 2), (16, 1)],
  term ((349947488033723 : Rat) / 213059844491872) [(9, 2), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 597 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0597_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0597
        rs_R010_ueqv_R010NYY_generator_05_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_05_0597 := by
  native_decide

/-- Coefficient term 598 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0598 : Poly :=
[
  term ((41469041122357166957 : Rat) / 1052941751478831424) [(9, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 598 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0598 : Poly :=
[
  term ((-41469041122357166957 : Rat) / 526470875739415712) [(6, 1), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((41469041122357166957 : Rat) / 1052941751478831424) [(6, 2), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((41469041122357166957 : Rat) / 1052941751478831424) [(7, 2), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-41469041122357166957 : Rat) / 1052941751478831424) [(9, 2), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((41469041122357166957 : Rat) / 526470875739415712) [(9, 2), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-41469041122357166957 : Rat) / 1052941751478831424) [(9, 2), (11, 1), (13, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 598 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0598_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0598
        rs_R010_ueqv_R010NYY_generator_05_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_05_0598 := by
  native_decide

/-- Coefficient term 599 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0599 : Poly :=
[
  term ((115359153689655303847 : Rat) / 8423534011830651392) [(9, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 599 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0599 : Poly :=
[
  term ((-115359153689655303847 : Rat) / 4211767005915325696) [(6, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((115359153689655303847 : Rat) / 8423534011830651392) [(6, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((115359153689655303847 : Rat) / 8423534011830651392) [(7, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((115359153689655303847 : Rat) / 4211767005915325696) [(9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-115359153689655303847 : Rat) / 8423534011830651392) [(9, 2), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-115359153689655303847 : Rat) / 8423534011830651392) [(9, 2), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 599 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0599_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0599
        rs_R010_ueqv_R010NYY_generator_05_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_05_0599 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010NYY_partials_05_0500_0599 : List Poly :=
[
  rs_R010_ueqv_R010NYY_partial_05_0500,
  rs_R010_ueqv_R010NYY_partial_05_0501,
  rs_R010_ueqv_R010NYY_partial_05_0502,
  rs_R010_ueqv_R010NYY_partial_05_0503,
  rs_R010_ueqv_R010NYY_partial_05_0504,
  rs_R010_ueqv_R010NYY_partial_05_0505,
  rs_R010_ueqv_R010NYY_partial_05_0506,
  rs_R010_ueqv_R010NYY_partial_05_0507,
  rs_R010_ueqv_R010NYY_partial_05_0508,
  rs_R010_ueqv_R010NYY_partial_05_0509,
  rs_R010_ueqv_R010NYY_partial_05_0510,
  rs_R010_ueqv_R010NYY_partial_05_0511,
  rs_R010_ueqv_R010NYY_partial_05_0512,
  rs_R010_ueqv_R010NYY_partial_05_0513,
  rs_R010_ueqv_R010NYY_partial_05_0514,
  rs_R010_ueqv_R010NYY_partial_05_0515,
  rs_R010_ueqv_R010NYY_partial_05_0516,
  rs_R010_ueqv_R010NYY_partial_05_0517,
  rs_R010_ueqv_R010NYY_partial_05_0518,
  rs_R010_ueqv_R010NYY_partial_05_0519,
  rs_R010_ueqv_R010NYY_partial_05_0520,
  rs_R010_ueqv_R010NYY_partial_05_0521,
  rs_R010_ueqv_R010NYY_partial_05_0522,
  rs_R010_ueqv_R010NYY_partial_05_0523,
  rs_R010_ueqv_R010NYY_partial_05_0524,
  rs_R010_ueqv_R010NYY_partial_05_0525,
  rs_R010_ueqv_R010NYY_partial_05_0526,
  rs_R010_ueqv_R010NYY_partial_05_0527,
  rs_R010_ueqv_R010NYY_partial_05_0528,
  rs_R010_ueqv_R010NYY_partial_05_0529,
  rs_R010_ueqv_R010NYY_partial_05_0530,
  rs_R010_ueqv_R010NYY_partial_05_0531,
  rs_R010_ueqv_R010NYY_partial_05_0532,
  rs_R010_ueqv_R010NYY_partial_05_0533,
  rs_R010_ueqv_R010NYY_partial_05_0534,
  rs_R010_ueqv_R010NYY_partial_05_0535,
  rs_R010_ueqv_R010NYY_partial_05_0536,
  rs_R010_ueqv_R010NYY_partial_05_0537,
  rs_R010_ueqv_R010NYY_partial_05_0538,
  rs_R010_ueqv_R010NYY_partial_05_0539,
  rs_R010_ueqv_R010NYY_partial_05_0540,
  rs_R010_ueqv_R010NYY_partial_05_0541,
  rs_R010_ueqv_R010NYY_partial_05_0542,
  rs_R010_ueqv_R010NYY_partial_05_0543,
  rs_R010_ueqv_R010NYY_partial_05_0544,
  rs_R010_ueqv_R010NYY_partial_05_0545,
  rs_R010_ueqv_R010NYY_partial_05_0546,
  rs_R010_ueqv_R010NYY_partial_05_0547,
  rs_R010_ueqv_R010NYY_partial_05_0548,
  rs_R010_ueqv_R010NYY_partial_05_0549,
  rs_R010_ueqv_R010NYY_partial_05_0550,
  rs_R010_ueqv_R010NYY_partial_05_0551,
  rs_R010_ueqv_R010NYY_partial_05_0552,
  rs_R010_ueqv_R010NYY_partial_05_0553,
  rs_R010_ueqv_R010NYY_partial_05_0554,
  rs_R010_ueqv_R010NYY_partial_05_0555,
  rs_R010_ueqv_R010NYY_partial_05_0556,
  rs_R010_ueqv_R010NYY_partial_05_0557,
  rs_R010_ueqv_R010NYY_partial_05_0558,
  rs_R010_ueqv_R010NYY_partial_05_0559,
  rs_R010_ueqv_R010NYY_partial_05_0560,
  rs_R010_ueqv_R010NYY_partial_05_0561,
  rs_R010_ueqv_R010NYY_partial_05_0562,
  rs_R010_ueqv_R010NYY_partial_05_0563,
  rs_R010_ueqv_R010NYY_partial_05_0564,
  rs_R010_ueqv_R010NYY_partial_05_0565,
  rs_R010_ueqv_R010NYY_partial_05_0566,
  rs_R010_ueqv_R010NYY_partial_05_0567,
  rs_R010_ueqv_R010NYY_partial_05_0568,
  rs_R010_ueqv_R010NYY_partial_05_0569,
  rs_R010_ueqv_R010NYY_partial_05_0570,
  rs_R010_ueqv_R010NYY_partial_05_0571,
  rs_R010_ueqv_R010NYY_partial_05_0572,
  rs_R010_ueqv_R010NYY_partial_05_0573,
  rs_R010_ueqv_R010NYY_partial_05_0574,
  rs_R010_ueqv_R010NYY_partial_05_0575,
  rs_R010_ueqv_R010NYY_partial_05_0576,
  rs_R010_ueqv_R010NYY_partial_05_0577,
  rs_R010_ueqv_R010NYY_partial_05_0578,
  rs_R010_ueqv_R010NYY_partial_05_0579,
  rs_R010_ueqv_R010NYY_partial_05_0580,
  rs_R010_ueqv_R010NYY_partial_05_0581,
  rs_R010_ueqv_R010NYY_partial_05_0582,
  rs_R010_ueqv_R010NYY_partial_05_0583,
  rs_R010_ueqv_R010NYY_partial_05_0584,
  rs_R010_ueqv_R010NYY_partial_05_0585,
  rs_R010_ueqv_R010NYY_partial_05_0586,
  rs_R010_ueqv_R010NYY_partial_05_0587,
  rs_R010_ueqv_R010NYY_partial_05_0588,
  rs_R010_ueqv_R010NYY_partial_05_0589,
  rs_R010_ueqv_R010NYY_partial_05_0590,
  rs_R010_ueqv_R010NYY_partial_05_0591,
  rs_R010_ueqv_R010NYY_partial_05_0592,
  rs_R010_ueqv_R010NYY_partial_05_0593,
  rs_R010_ueqv_R010NYY_partial_05_0594,
  rs_R010_ueqv_R010NYY_partial_05_0595,
  rs_R010_ueqv_R010NYY_partial_05_0596,
  rs_R010_ueqv_R010NYY_partial_05_0597,
  rs_R010_ueqv_R010NYY_partial_05_0598,
  rs_R010_ueqv_R010NYY_partial_05_0599
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010NYY_block_05_0500_0599 : Poly :=
[
  term ((954422357427762169755 : Rat) / 33694136047322605568) [(5, 1), (6, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((24082546774204629297 : Rat) / 16847068023661302784) [(5, 1), (6, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-54162118951983571405 : Rat) / 16847068023661302784) [(5, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((61366430509389361365 : Rat) / 8423534011830651392) [(5, 1), (6, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-59854582444141895889 : Rat) / 16847068023661302784) [(5, 1), (6, 1), (8, 1), (13, 1), (16, 1)],
  term ((3061944933367692879 : Rat) / 130093189371901952) [(5, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((23839805706003352161 : Rat) / 2105883502957662848) [(5, 1), (6, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((100963211346141388395 : Rat) / 16847068023661302784) [(5, 1), (6, 1), (9, 1), (10, 1), (16, 1)],
  term ((27980600721736322115 : Rat) / 8423534011830651392) [(5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((22546153675895831973 : Rat) / 8423534011830651392) [(5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-780699240759410409 : Rat) / 47929069768595456) [(5, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((2258274597875481133 : Rat) / 85373655525310656) [(5, 1), (6, 1), (9, 1), (11, 2), (16, 1)],
  term ((-9846260672265067047 : Rat) / 1773375581438031872) [(5, 1), (6, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-121878886740089521065 : Rat) / 9626896013520744448) [(5, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-590535202605832960863 : Rat) / 134776544189290422272) [(5, 1), (6, 1), (9, 1), (14, 1), (16, 1)],
  term ((9846260672265067047 : Rat) / 3546751162876063744) [(5, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((-1021866705675947590393 : Rat) / 67388272094645211136) [(5, 1), (6, 1), (9, 1), (16, 1)],
  term ((557357753330154279 : Rat) / 28457885175103552) [(5, 1), (6, 1), (9, 2), (11, 1), (16, 1)],
  term ((12853999827937751211 : Rat) / 1052941751478831424) [(5, 1), (6, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((38018171745318956481 : Rat) / 8423534011830651392) [(5, 1), (6, 1), (9, 2), (13, 1), (16, 1)],
  term ((-32898310098832139433 : Rat) / 1203362001690093056) [(5, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((12853999827937751211 : Rat) / 526470875739415712) [(5, 1), (6, 1), (9, 3), (16, 1)],
  term ((10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (6, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-6149870212956131 : Rat) / 426119688983744) [(5, 1), (6, 1), (10, 1), (11, 1), (16, 1)],
  term ((-48690874158145051407 : Rat) / 4211767005915325696) [(5, 1), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((-915776598761011178391 : Rat) / 33694136047322605568) [(5, 1), (6, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-701456634752293629 : Rat) / 131617718934853928) [(5, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((4249056461351911479 : Rat) / 8423534011830651392) [(5, 1), (6, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-94103904218330396751 : Rat) / 16847068023661302784) [(5, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((574219009407614324223 : Rat) / 33694136047322605568) [(5, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((-924274711683715001349 : Rat) / 33694136047322605568) [(5, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((20389494938133054455 : Rat) / 16847068023661302784) [(5, 1), (6, 1), (11, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (6, 1), (11, 2), (15, 1), (16, 1)],
  term ((-9613258292915725557 : Rat) / 2105883502957662848) [(5, 1), (6, 1), (13, 1), (14, 1), (16, 1)],
  term ((915776598761011178391 : Rat) / 33694136047322605568) [(5, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((44569905339525962661 : Rat) / 8423534011830651392) [(5, 1), (6, 1), (13, 1), (16, 1)],
  term ((915776598761011178391 : Rat) / 67388272094645211136) [(5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((9613258292915725557 : Rat) / 4211767005915325696) [(5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-954422357427762169755 : Rat) / 67388272094645211136) [(5, 1), (6, 2), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-24082546774204629297 : Rat) / 33694136047322605568) [(5, 1), (6, 2), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((54162118951983571405 : Rat) / 33694136047322605568) [(5, 1), (6, 2), (8, 1), (11, 1), (16, 1)],
  term ((-61366430509389361365 : Rat) / 16847068023661302784) [(5, 1), (6, 2), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((59854582444141895889 : Rat) / 33694136047322605568) [(5, 1), (6, 2), (8, 1), (13, 1), (16, 1)],
  term ((-3061944933367692879 : Rat) / 260186378743803904) [(5, 1), (6, 2), (8, 1), (15, 1), (16, 1)],
  term ((-23839805706003352161 : Rat) / 4211767005915325696) [(5, 1), (6, 2), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-100963211346141388395 : Rat) / 33694136047322605568) [(5, 1), (6, 2), (9, 1), (10, 1), (16, 1)],
  term ((-27980600721736322115 : Rat) / 16847068023661302784) [(5, 1), (6, 2), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-22546153675895831973 : Rat) / 16847068023661302784) [(5, 1), (6, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((780699240759410409 : Rat) / 95858139537190912) [(5, 1), (6, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2258274597875481133 : Rat) / 170747311050621312) [(5, 1), (6, 2), (9, 1), (11, 2), (16, 1)],
  term ((9846260672265067047 : Rat) / 3546751162876063744) [(5, 1), (6, 2), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((121878886740089521065 : Rat) / 19253792027041488896) [(5, 1), (6, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((590535202605832960863 : Rat) / 269553088378580844544) [(5, 1), (6, 2), (9, 1), (14, 1), (16, 1)],
  term ((-9846260672265067047 : Rat) / 7093502325752127488) [(5, 1), (6, 2), (9, 1), (15, 2), (16, 1)],
  term ((1021866705675947590393 : Rat) / 134776544189290422272) [(5, 1), (6, 2), (9, 1), (16, 1)],
  term ((-557357753330154279 : Rat) / 56915770350207104) [(5, 1), (6, 2), (9, 2), (11, 1), (16, 1)],
  term ((-12853999827937751211 : Rat) / 2105883502957662848) [(5, 1), (6, 2), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((-38018171745318956481 : Rat) / 16847068023661302784) [(5, 1), (6, 2), (9, 2), (13, 1), (16, 1)],
  term ((32898310098832139433 : Rat) / 2406724003380186112) [(5, 1), (6, 2), (9, 2), (15, 1), (16, 1)],
  term ((-12853999827937751211 : Rat) / 1052941751478831424) [(5, 1), (6, 2), (9, 3), (16, 1)],
  term ((-10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (6, 2), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((6149870212956131 : Rat) / 852239377967488) [(5, 1), (6, 2), (10, 1), (11, 1), (16, 1)],
  term ((48690874158145051407 : Rat) / 8423534011830651392) [(5, 1), (6, 2), (10, 1), (13, 1), (16, 1)],
  term ((915776598761011178391 : Rat) / 67388272094645211136) [(5, 1), (6, 2), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((701456634752293629 : Rat) / 263235437869707856) [(5, 1), (6, 2), (10, 1), (15, 1), (16, 1)],
  term ((-4249056461351911479 : Rat) / 16847068023661302784) [(5, 1), (6, 2), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((94103904218330396751 : Rat) / 33694136047322605568) [(5, 1), (6, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-574219009407614324223 : Rat) / 67388272094645211136) [(5, 1), (6, 2), (11, 1), (14, 1), (16, 1)],
  term ((924274711683715001349 : Rat) / 67388272094645211136) [(5, 1), (6, 2), (11, 1), (15, 2), (16, 1)],
  term ((-20389494938133054455 : Rat) / 33694136047322605568) [(5, 1), (6, 2), (11, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (6, 2), (11, 2), (15, 1), (16, 1)],
  term ((9613258292915725557 : Rat) / 4211767005915325696) [(5, 1), (6, 2), (13, 1), (14, 1), (16, 1)],
  term ((-915776598761011178391 : Rat) / 67388272094645211136) [(5, 1), (6, 2), (13, 1), (15, 2), (16, 1)],
  term ((-44569905339525962661 : Rat) / 16847068023661302784) [(5, 1), (6, 2), (13, 1), (16, 1)],
  term ((-915776598761011178391 : Rat) / 134776544189290422272) [(5, 1), (6, 2), (14, 1), (15, 1), (16, 1)],
  term ((-9613258292915725557 : Rat) / 8423534011830651392) [(5, 1), (6, 2), (15, 1), (16, 1)],
  term ((-954422357427762169755 : Rat) / 67388272094645211136) [(5, 1), (7, 2), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-24082546774204629297 : Rat) / 33694136047322605568) [(5, 1), (7, 2), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((54162118951983571405 : Rat) / 33694136047322605568) [(5, 1), (7, 2), (8, 1), (11, 1), (16, 1)],
  term ((-61366430509389361365 : Rat) / 16847068023661302784) [(5, 1), (7, 2), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((59854582444141895889 : Rat) / 33694136047322605568) [(5, 1), (7, 2), (8, 1), (13, 1), (16, 1)],
  term ((-3061944933367692879 : Rat) / 260186378743803904) [(5, 1), (7, 2), (8, 1), (15, 1), (16, 1)],
  term ((-23839805706003352161 : Rat) / 4211767005915325696) [(5, 1), (7, 2), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-100963211346141388395 : Rat) / 33694136047322605568) [(5, 1), (7, 2), (9, 1), (10, 1), (16, 1)],
  term ((-27980600721736322115 : Rat) / 16847068023661302784) [(5, 1), (7, 2), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-22546153675895831973 : Rat) / 16847068023661302784) [(5, 1), (7, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((780699240759410409 : Rat) / 95858139537190912) [(5, 1), (7, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2258274597875481133 : Rat) / 170747311050621312) [(5, 1), (7, 2), (9, 1), (11, 2), (16, 1)],
  term ((9846260672265067047 : Rat) / 3546751162876063744) [(5, 1), (7, 2), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((121878886740089521065 : Rat) / 19253792027041488896) [(5, 1), (7, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((590535202605832960863 : Rat) / 269553088378580844544) [(5, 1), (7, 2), (9, 1), (14, 1), (16, 1)],
  term ((-9846260672265067047 : Rat) / 7093502325752127488) [(5, 1), (7, 2), (9, 1), (15, 2), (16, 1)],
  term ((1021866705675947590393 : Rat) / 134776544189290422272) [(5, 1), (7, 2), (9, 1), (16, 1)],
  term ((-557357753330154279 : Rat) / 56915770350207104) [(5, 1), (7, 2), (9, 2), (11, 1), (16, 1)],
  term ((-12853999827937751211 : Rat) / 2105883502957662848) [(5, 1), (7, 2), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((-38018171745318956481 : Rat) / 16847068023661302784) [(5, 1), (7, 2), (9, 2), (13, 1), (16, 1)],
  term ((32898310098832139433 : Rat) / 2406724003380186112) [(5, 1), (7, 2), (9, 2), (15, 1), (16, 1)],
  term ((-12853999827937751211 : Rat) / 1052941751478831424) [(5, 1), (7, 2), (9, 3), (16, 1)],
  term ((-10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (7, 2), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((6149870212956131 : Rat) / 852239377967488) [(5, 1), (7, 2), (10, 1), (11, 1), (16, 1)],
  term ((48690874158145051407 : Rat) / 8423534011830651392) [(5, 1), (7, 2), (10, 1), (13, 1), (16, 1)],
  term ((915776598761011178391 : Rat) / 67388272094645211136) [(5, 1), (7, 2), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((701456634752293629 : Rat) / 263235437869707856) [(5, 1), (7, 2), (10, 1), (15, 1), (16, 1)],
  term ((-4249056461351911479 : Rat) / 16847068023661302784) [(5, 1), (7, 2), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((94103904218330396751 : Rat) / 33694136047322605568) [(5, 1), (7, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-574219009407614324223 : Rat) / 67388272094645211136) [(5, 1), (7, 2), (11, 1), (14, 1), (16, 1)],
  term ((924274711683715001349 : Rat) / 67388272094645211136) [(5, 1), (7, 2), (11, 1), (15, 2), (16, 1)],
  term ((-20389494938133054455 : Rat) / 33694136047322605568) [(5, 1), (7, 2), (11, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (7, 2), (11, 2), (15, 1), (16, 1)],
  term ((9613258292915725557 : Rat) / 4211767005915325696) [(5, 1), (7, 2), (13, 1), (14, 1), (16, 1)],
  term ((-915776598761011178391 : Rat) / 67388272094645211136) [(5, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((-44569905339525962661 : Rat) / 16847068023661302784) [(5, 1), (7, 2), (13, 1), (16, 1)],
  term ((-915776598761011178391 : Rat) / 134776544189290422272) [(5, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((-9613258292915725557 : Rat) / 8423534011830651392) [(5, 1), (7, 2), (15, 1), (16, 1)],
  term ((-954422357427762169755 : Rat) / 33694136047322605568) [(5, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((954422357427762169755 : Rat) / 67388272094645211136) [(5, 1), (8, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((954422357427762169755 : Rat) / 67388272094645211136) [(5, 1), (8, 1), (10, 1), (15, 3), (16, 1)],
  term ((24082546774204629297 : Rat) / 33694136047322605568) [(5, 1), (8, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((54162118951983571405 : Rat) / 16847068023661302784) [(5, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-14618173214341832857 : Rat) / 4813448006760372224) [(5, 1), (8, 1), (11, 1), (14, 2), (16, 1)],
  term ((24082546774204629297 : Rat) / 33694136047322605568) [(5, 1), (8, 1), (11, 1), (14, 3), (16, 1)],
  term ((-54162118951983571405 : Rat) / 33694136047322605568) [(5, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((61366430509389361365 : Rat) / 16847068023661302784) [(5, 1), (8, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((59854582444141895889 : Rat) / 16847068023661302784) [(5, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-305320304481699341349 : Rat) / 33694136047322605568) [(5, 1), (8, 1), (13, 1), (14, 2), (16, 1)],
  term ((61366430509389361365 : Rat) / 16847068023661302784) [(5, 1), (8, 1), (13, 1), (14, 3), (16, 1)],
  term ((-59854582444141895889 : Rat) / 33694136047322605568) [(5, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3061944933367692879 : Rat) / 130093189371901952) [(5, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((3061944933367692879 : Rat) / 260186378743803904) [(5, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((3061944933367692879 : Rat) / 260186378743803904) [(5, 1), (8, 1), (15, 3), (16, 1)],
  term ((23839805706003352161 : Rat) / 4211767005915325696) [(5, 1), (9, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-100963211346141388395 : Rat) / 16847068023661302784) [(5, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-14761772628942749799 : Rat) / 1773375581438031872) [(5, 1), (9, 1), (10, 1), (14, 2), (16, 1)],
  term ((23839805706003352161 : Rat) / 4211767005915325696) [(5, 1), (9, 1), (10, 1), (14, 3), (16, 1)],
  term ((100963211346141388395 : Rat) / 33694136047322605568) [(5, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((27980600721736322115 : Rat) / 16847068023661302784) [(5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-22546153675895831973 : Rat) / 8423534011830651392) [(5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-33415047767576812257 : Rat) / 16847068023661302784) [(5, 1), (9, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((27980600721736322115 : Rat) / 16847068023661302784) [(5, 1), (9, 1), (11, 1), (13, 1), (14, 3), (16, 1)],
  term ((22546153675895831973 : Rat) / 16847068023661302784) [(5, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((780699240759410409 : Rat) / 47929069768595456) [(5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-780699240759410409 : Rat) / 95858139537190912) [(5, 1), (9, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-780699240759410409 : Rat) / 95858139537190912) [(5, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((-2258274597875481133 : Rat) / 85373655525310656) [(5, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((2258274597875481133 : Rat) / 170747311050621312) [(5, 1), (9, 1), (11, 2), (14, 2), (16, 1)],
  term ((2258274597875481133 : Rat) / 170747311050621312) [(5, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((121878886740089521065 : Rat) / 9626896013520744448) [(5, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9846260672265067047 : Rat) / 3546751162876063744) [(5, 1), (9, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-104836396088481551883 : Rat) / 134776544189290422272) [(5, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-9846260672265067047 : Rat) / 3546751162876063744) [(5, 1), (9, 1), (13, 1), (14, 3), (15, 1), (16, 1)],
  term ((-121878886740089521065 : Rat) / 19253792027041488896) [(5, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((-1338851013697978056435 : Rat) / 269553088378580844544) [(5, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((1021866705675947590393 : Rat) / 67388272094645211136) [(5, 1), (9, 1), (14, 1), (16, 1)],
  term ((9846260672265067047 : Rat) / 7093502325752127488) [(5, 1), (9, 1), (14, 2), (15, 2), (16, 1)],
  term ((-215665751535057314765 : Rat) / 67388272094645211136) [(5, 1), (9, 1), (14, 2), (16, 1)],
  term ((-590535202605832960863 : Rat) / 269553088378580844544) [(5, 1), (9, 1), (14, 3), (16, 1)],
  term ((-1021866705675947590393 : Rat) / 134776544189290422272) [(5, 1), (9, 1), (15, 2), (16, 1)],
  term ((9846260672265067047 : Rat) / 7093502325752127488) [(5, 1), (9, 1), (15, 4), (16, 1)],
  term ((-557357753330154279 : Rat) / 28457885175103552) [(5, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((557357753330154279 : Rat) / 56915770350207104) [(5, 1), (9, 2), (11, 1), (14, 2), (16, 1)],
  term ((557357753330154279 : Rat) / 56915770350207104) [(5, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((12853999827937751211 : Rat) / 2105883502957662848) [(5, 1), (9, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-38018171745318956481 : Rat) / 8423534011830651392) [(5, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((-167645825501685062895 : Rat) / 16847068023661302784) [(5, 1), (9, 2), (13, 1), (14, 2), (16, 1)],
  term ((12853999827937751211 : Rat) / 2105883502957662848) [(5, 1), (9, 2), (13, 1), (14, 3), (16, 1)],
  term ((38018171745318956481 : Rat) / 16847068023661302784) [(5, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((32898310098832139433 : Rat) / 1203362001690093056) [(5, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-32898310098832139433 : Rat) / 2406724003380186112) [(5, 1), (9, 2), (14, 2), (15, 1), (16, 1)],
  term ((-32898310098832139433 : Rat) / 2406724003380186112) [(5, 1), (9, 2), (15, 3), (16, 1)],
  term ((-12853999827937751211 : Rat) / 526470875739415712) [(5, 1), (9, 3), (14, 1), (16, 1)],
  term ((12853999827937751211 : Rat) / 1052941751478831424) [(5, 1), (9, 3), (14, 2), (16, 1)],
  term ((12853999827937751211 : Rat) / 1052941751478831424) [(5, 1), (9, 3), (15, 2), (16, 1)],
  term ((10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((6149870212956131 : Rat) / 426119688983744) [(5, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-6408679338092626909 : Rat) / 526470875739415712) [(5, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (10, 1), (11, 1), (14, 3), (16, 1)],
  term ((-6149870212956131 : Rat) / 852239377967488) [(5, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((48690874158145051407 : Rat) / 4211767005915325696) [(5, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-48690874158145051407 : Rat) / 8423534011830651392) [(5, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((-48690874158145051407 : Rat) / 8423534011830651392) [(5, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((701456634752293629 : Rat) / 131617718934853928) [(5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-915776598761011178391 : Rat) / 67388272094645211136) [(5, 1), (10, 1), (14, 1), (15, 3), (16, 1)],
  term ((825990149512717593879 : Rat) / 33694136047322605568) [(5, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-915776598761011178391 : Rat) / 67388272094645211136) [(5, 1), (10, 1), (14, 3), (15, 1), (16, 1)],
  term ((-701456634752293629 : Rat) / 263235437869707856) [(5, 1), (10, 1), (15, 3), (16, 1)],
  term ((94103904218330396751 : Rat) / 16847068023661302784) [(5, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((4249056461351911479 : Rat) / 16847068023661302784) [(5, 1), (11, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-111100130063738042667 : Rat) / 33694136047322605568) [(5, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((4249056461351911479 : Rat) / 16847068023661302784) [(5, 1), (11, 1), (13, 1), (14, 3), (15, 1), (16, 1)],
  term ((-94103904218330396751 : Rat) / 33694136047322605568) [(5, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((2422768432775044326921 : Rat) / 67388272094645211136) [(5, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-20389494938133054455 : Rat) / 16847068023661302784) [(5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-924274711683715001349 : Rat) / 67388272094645211136) [(5, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((-9889812758383594103 : Rat) / 601681000845046528) [(5, 1), (11, 1), (14, 2), (16, 1)],
  term ((574219009407614324223 : Rat) / 67388272094645211136) [(5, 1), (11, 1), (14, 3), (16, 1)],
  term ((20389494938133054455 : Rat) / 33694136047322605568) [(5, 1), (11, 1), (15, 2), (16, 1)],
  term ((-924274711683715001349 : Rat) / 67388272094645211136) [(5, 1), (11, 1), (15, 4), (16, 1)],
  term ((-10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (11, 2), (14, 2), (15, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (11, 2), (15, 3), (16, 1)],
  term ((-992682665104336982847 : Rat) / 33694136047322605568) [(5, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-44569905339525962661 : Rat) / 8423534011830651392) [(5, 1), (13, 1), (14, 1), (16, 1)],
  term ((915776598761011178391 : Rat) / 67388272094645211136) [(5, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((121475971682851767117 : Rat) / 16847068023661302784) [(5, 1), (13, 1), (14, 2), (16, 1)],
  term ((-9613258292915725557 : Rat) / 4211767005915325696) [(5, 1), (13, 1), (14, 3), (16, 1)],
  term ((44569905339525962661 : Rat) / 16847068023661302784) [(5, 1), (13, 1), (15, 2), (16, 1)],
  term ((915776598761011178391 : Rat) / 67388272094645211136) [(5, 1), (13, 1), (15, 4), (16, 1)],
  term ((-9613258292915725557 : Rat) / 4211767005915325696) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term ((915776598761011178391 : Rat) / 134776544189290422272) [(5, 1), (14, 1), (15, 3), (16, 1)],
  term ((-119838647488240767705 : Rat) / 9626896013520744448) [(5, 1), (14, 2), (15, 1), (16, 1)],
  term ((915776598761011178391 : Rat) / 134776544189290422272) [(5, 1), (14, 3), (15, 1), (16, 1)],
  term ((9613258292915725557 : Rat) / 8423534011830651392) [(5, 1), (15, 3), (16, 1)],
  term ((-1380205666669678263 : Rat) / 601681000845046528) [(5, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((1380205666669678263 : Rat) / 1203362001690093056) [(5, 2), (6, 2), (9, 1), (11, 1), (16, 1)],
  term ((1380205666669678263 : Rat) / 1203362001690093056) [(5, 2), (7, 2), (9, 1), (11, 1), (16, 1)],
  term ((1380205666669678263 : Rat) / 601681000845046528) [(5, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1380205666669678263 : Rat) / 1203362001690093056) [(5, 2), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-1380205666669678263 : Rat) / 1203362001690093056) [(5, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-39023555492874908592505 : Rat) / 151623612212951725056) [(6, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 3158825254436494272) [(6, 1), (7, 1), (9, 1), (11, 2), (16, 1)],
  term ((-1353319841726368049 : Rat) / 23862702583089664) [(6, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-3728508138334321 : Rat) / 639179533475616) [(6, 1), (7, 1), (9, 1), (16, 1)],
  term ((240937308571641895789 : Rat) / 3158825254436494272) [(6, 1), (7, 1), (9, 2), (11, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 2982837822886208) [(6, 1), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((240937308571641895789 : Rat) / 6317650508872988544) [(6, 1), (7, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 5965675645772416) [(6, 1), (7, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-39023555492874908592505 : Rat) / 303247224425903450112) [(6, 1), (7, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 6317650508872988544) [(6, 1), (7, 2), (8, 1), (11, 2), (16, 1)],
  term ((-1353319841726368049 : Rat) / 47725405166179328) [(6, 1), (7, 2), (8, 1), (15, 2), (16, 1)],
  term ((-3728508138334321 : Rat) / 1278359066951232) [(6, 1), (7, 2), (8, 1), (16, 1)],
  term ((-28288027507455275093431 : Rat) / 303247224425903450112) [(6, 1), (7, 2), (9, 1), (11, 1), (16, 1)],
  term ((-711968041840092767 : Rat) / 47725405166179328) [(6, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((115359153689655303847 : Rat) / 2105883502957662848) [(6, 1), (8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 2982837822886208) [(6, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((1594322389407756217745 : Rat) / 16847068023661302784) [(6, 1), (8, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-240937308571641895789 : Rat) / 6317650508872988544) [(6, 1), (8, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-240937308571641895789 : Rat) / 6317650508872988544) [(6, 1), (8, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-115859141337574330264073 : Rat) / 303247224425903450112) [(6, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((443658363974004467 : Rat) / 23862702583089664) [(6, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-70302592550481639 : Rat) / 5965675645772416) [(6, 1), (8, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2832754402317459495 : Rat) / 47725405166179328) [(6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-70302592550481639 : Rat) / 5965675645772416) [(6, 1), (8, 1), (9, 1), (15, 3), (16, 1)],
  term ((-40653121365766723152949 : Rat) / 151623612212951725056) [(6, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 3158825254436494272) [(6, 1), (8, 1), (10, 1), (11, 2), (16, 1)],
  term ((848513315802319 : Rat) / 852239377967488) [(6, 1), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((-1353319841726368049 : Rat) / 23862702583089664) [(6, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((16389209499091483 : Rat) / 5113436267804928) [(6, 1), (8, 1), (10, 1), (16, 1)],
  term ((-349947488033723 : Rat) / 426119688983744) [(6, 1), (8, 1), (10, 2), (16, 1)],
  term ((-3674057352858660123931 : Rat) / 37905903053237931264) [(6, 1), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((2362877370809801204651 : Rat) / 75811806106475862528) [(6, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-39581560665231991004917 : Rat) / 151623612212951725056) [(6, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((39023555492874908592505 : Rat) / 303247224425903450112) [(6, 1), (8, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-31308594075310269003563 : Rat) / 151623612212951725056) [(6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((39023555492874908592505 : Rat) / 303247224425903450112) [(6, 1), (8, 1), (11, 1), (15, 3), (16, 1)],
  term ((-145700086915644934285 : Rat) / 25270602035491954176) [(6, 1), (8, 1), (11, 2), (14, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 6317650508872988544) [(6, 1), (8, 1), (11, 2), (14, 2), (16, 1)],
  term ((-69556067785407573619 : Rat) / 6317650508872988544) [(6, 1), (8, 1), (11, 2), (15, 2), (16, 1)],
  term ((773530512246286335553 : Rat) / 25270602035491954176) [(6, 1), (8, 1), (11, 2), (16, 1)],
  term ((-16549472857713853 : Rat) / 745709455721552) [(6, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((45043032468617529 : Rat) / 23862702583089664) [(6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1353319841726368049 : Rat) / 23862702583089664) [(6, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-23524139878436375 : Rat) / 1917538600426848) [(6, 1), (8, 1), (14, 1), (16, 1)],
  term ((1353319841726368049 : Rat) / 47725405166179328) [(6, 1), (8, 1), (14, 2), (15, 2), (16, 1)],
  term ((3728508138334321 : Rat) / 1278359066951232) [(6, 1), (8, 1), (14, 2), (16, 1)],
  term ((-506283125879371357 : Rat) / 10226872535609856) [(6, 1), (8, 1), (15, 2), (16, 1)],
  term ((1353319841726368049 : Rat) / 47725405166179328) [(6, 1), (8, 1), (15, 4), (16, 1)],
  term ((5919904330058953 : Rat) / 1614769347727872) [(6, 1), (8, 1), (16, 1)],
  term ((-240937308571641895789 : Rat) / 3158825254436494272) [(6, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1877072492831531603975 : Rat) / 25270602035491954176) [(6, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-349947488033723 : Rat) / 213059844491872) [(6, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-70302592550481639 : Rat) / 2982837822886208) [(6, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-90014065649565359 : Rat) / 5965675645772416) [(6, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-9655207142042678387 : Rat) / 2406724003380186112) [(6, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((5215218605463587495723 : Rat) / 101082408141967816704) [(6, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-14248597810079970717469 : Rat) / 86642064121686700032) [(6, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((28288027507455275093431 : Rat) / 303247224425903450112) [(6, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((2272728384056690091379 : Rat) / 18952951526618965632) [(6, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((107738122480090876834895 : Rat) / 303247224425903450112) [(6, 1), (9, 1), (11, 1), (16, 1)],
  term ((240473047099696446673 : Rat) / 12635301017745977088) [(6, 1), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-565277130855222650825 : Rat) / 12635301017745977088) [(6, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((3001794751113820687807 : Rat) / 21660516030421675008) [(6, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 3158825254436494272) [(6, 1), (9, 1), (11, 3), (16, 1)],
  term ((183099752496479997 : Rat) / 23862702583089664) [(6, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1396991133095807 : Rat) / 2556718133902464) [(6, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((163353597466831685 : Rat) / 6817915023739904) [(6, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2971329079268371 : Rat) / 2556718133902464) [(6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-45287673339297961 : Rat) / 1947975721068544) [(6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((711968041840092767 : Rat) / 47725405166179328) [(6, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((951662774070118849 : Rat) / 11931351291544832) [(6, 1), (9, 1), (15, 1), (16, 1)],
  term ((264434144671806385 : Rat) / 23862702583089664) [(6, 1), (9, 1), (15, 3), (16, 1)],
  term ((349947488033723 : Rat) / 106529922245936) [(6, 1), (9, 2), (10, 1), (16, 1)],
  term ((-41469041122357166957 : Rat) / 526470875739415712) [(6, 1), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-115359153689655303847 : Rat) / 4211767005915325696) [(6, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((39023555492874908592505 : Rat) / 303247224425903450112) [(6, 2), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 6317650508872988544) [(6, 2), (7, 1), (9, 1), (11, 2), (16, 1)],
  term ((1353319841726368049 : Rat) / 47725405166179328) [(6, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((3728508138334321 : Rat) / 1278359066951232) [(6, 2), (7, 1), (9, 1), (16, 1)],
  term ((-240937308571641895789 : Rat) / 6317650508872988544) [(6, 2), (7, 1), (9, 2), (11, 1), (16, 1)],
  term ((-70302592550481639 : Rat) / 5965675645772416) [(6, 2), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((-115359153689655303847 : Rat) / 4211767005915325696) [(6, 2), (8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-70302592550481639 : Rat) / 5965675645772416) [(6, 2), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-927970231076998320611 : Rat) / 101082408141967816704) [(6, 2), (8, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((69599178091819086272585 : Rat) / 606494448851806900224) [(6, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((118762376429848645 : Rat) / 47725405166179328) [(6, 2), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((583071440702047047 : Rat) / 95450810332358656) [(6, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((40653121365766723152949 : Rat) / 303247224425903450112) [(6, 2), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 6317650508872988544) [(6, 2), (8, 1), (10, 1), (11, 2), (16, 1)],
  term ((-848513315802319 : Rat) / 1704478755934976) [(6, 2), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((1353319841726368049 : Rat) / 47725405166179328) [(6, 2), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-16389209499091483 : Rat) / 10226872535609856) [(6, 2), (8, 1), (10, 1), (16, 1)],
  term ((349947488033723 : Rat) / 852239377967488) [(6, 2), (8, 1), (10, 2), (16, 1)],
  term ((3674057352858660123931 : Rat) / 75811806106475862528) [(6, 2), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2362877370809801204651 : Rat) / 151623612212951725056) [(6, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((1186750147506747 : Rat) / 644937907651072) [(6, 2), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((109355705061060086188573 : Rat) / 303247224425903450112) [(6, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((234049543066301841079 : Rat) / 16847068023661302784) [(6, 2), (8, 1), (11, 2), (14, 1), (16, 1)],
  term ((-1886427596812807513457 : Rat) / 50541204070983908352) [(6, 2), (8, 1), (11, 2), (16, 1)],
  term ((16549472857713853 : Rat) / 1491418911443104) [(6, 2), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-45043032468617529 : Rat) / 47725405166179328) [(6, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((3084653865858353 : Rat) / 958769300213424) [(6, 2), (8, 1), (14, 1), (16, 1)],
  term ((3957565795753509923 : Rat) / 47725405166179328) [(6, 2), (8, 1), (15, 2), (16, 1)],
  term ((245458599008974709 : Rat) / 61361235213659136) [(6, 2), (8, 1), (16, 1)],
  term ((240937308571641895789 : Rat) / 6317650508872988544) [(6, 2), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((1877072492831531603975 : Rat) / 50541204070983908352) [(6, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((349947488033723 : Rat) / 426119688983744) [(6, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 5965675645772416) [(6, 2), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((90014065649565359 : Rat) / 11931351291544832) [(6, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((9655207142042678387 : Rat) / 4813448006760372224) [(6, 2), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5215218605463587495723 : Rat) / 202164816283935633408) [(6, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4470641786420435117147 : Rat) / 404329632567871266816) [(6, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-18312078542974526913 : Rat) / 1375270859074392064) [(6, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((5413987549730223538829 : Rat) / 606494448851806900224) [(6, 2), (9, 1), (11, 1), (16, 1)],
  term ((-240473047099696446673 : Rat) / 25270602035491954176) [(6, 2), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((565277130855222650825 : Rat) / 25270602035491954176) [(6, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-3001794751113820687807 : Rat) / 43321032060843350016) [(6, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 6317650508872988544) [(6, 2), (9, 1), (11, 3), (16, 1)],
  term ((-183099752496479997 : Rat) / 47725405166179328) [(6, 2), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1396991133095807 : Rat) / 5113436267804928) [(6, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-163353597466831685 : Rat) / 13635830047479808) [(6, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((2971329079268371 : Rat) / 5113436267804928) [(6, 2), (9, 1), (13, 1), (16, 1)],
  term ((-33093482828145841 : Rat) / 10047453719195648) [(6, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-119847366115013041 : Rat) / 11931351291544832) [(6, 2), (9, 1), (15, 1), (16, 1)],
  term ((183099752496479997 : Rat) / 95450810332358656) [(6, 2), (9, 1), (15, 3), (16, 1)],
  term ((-349947488033723 : Rat) / 213059844491872) [(6, 2), (9, 2), (10, 1), (16, 1)],
  term ((41469041122357166957 : Rat) / 1052941751478831424) [(6, 2), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((115359153689655303847 : Rat) / 8423534011830651392) [(6, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((240937308571641895789 : Rat) / 6317650508872988544) [(6, 3), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 5965675645772416) [(6, 3), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-39023555492874908592505 : Rat) / 303247224425903450112) [(6, 3), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 6317650508872988544) [(6, 3), (8, 1), (11, 2), (16, 1)],
  term ((-1353319841726368049 : Rat) / 47725405166179328) [(6, 3), (8, 1), (15, 2), (16, 1)],
  term ((-3728508138334321 : Rat) / 1278359066951232) [(6, 3), (8, 1), (16, 1)],
  term ((-28288027507455275093431 : Rat) / 303247224425903450112) [(6, 3), (9, 1), (11, 1), (16, 1)],
  term ((-711968041840092767 : Rat) / 47725405166179328) [(6, 3), (9, 1), (15, 1), (16, 1)],
  term ((39023555492874908592505 : Rat) / 151623612212951725056) [(7, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-39023555492874908592505 : Rat) / 303247224425903450112) [(7, 1), (9, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-39023555492874908592505 : Rat) / 303247224425903450112) [(7, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((-69556067785407573619 : Rat) / 3158825254436494272) [(7, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 6317650508872988544) [(7, 1), (9, 1), (11, 2), (14, 2), (16, 1)],
  term ((69556067785407573619 : Rat) / 6317650508872988544) [(7, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((1353319841726368049 : Rat) / 23862702583089664) [(7, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((3728508138334321 : Rat) / 639179533475616) [(7, 1), (9, 1), (14, 1), (16, 1)],
  term ((-1353319841726368049 : Rat) / 47725405166179328) [(7, 1), (9, 1), (14, 2), (15, 2), (16, 1)],
  term ((-3728508138334321 : Rat) / 1278359066951232) [(7, 1), (9, 1), (14, 2), (16, 1)],
  term ((-3728508138334321 : Rat) / 1278359066951232) [(7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-1353319841726368049 : Rat) / 47725405166179328) [(7, 1), (9, 1), (15, 4), (16, 1)],
  term ((-240937308571641895789 : Rat) / 3158825254436494272) [(7, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((240937308571641895789 : Rat) / 6317650508872988544) [(7, 1), (9, 2), (11, 1), (14, 2), (16, 1)],
  term ((240937308571641895789 : Rat) / 6317650508872988544) [(7, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((-70302592550481639 : Rat) / 2982837822886208) [(7, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 5965675645772416) [(7, 1), (9, 2), (14, 2), (15, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 5965675645772416) [(7, 1), (9, 2), (15, 3), (16, 1)],
  term ((-115359153689655303847 : Rat) / 4211767005915325696) [(7, 2), (8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-70302592550481639 : Rat) / 5965675645772416) [(7, 2), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-927970231076998320611 : Rat) / 101082408141967816704) [(7, 2), (8, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((115859141337574330264073 : Rat) / 606494448851806900224) [(7, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((118762376429848645 : Rat) / 47725405166179328) [(7, 2), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((2832754402317459495 : Rat) / 95450810332358656) [(7, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((40653121365766723152949 : Rat) / 303247224425903450112) [(7, 2), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 6317650508872988544) [(7, 2), (8, 1), (10, 1), (11, 2), (16, 1)],
  term ((-848513315802319 : Rat) / 1704478755934976) [(7, 2), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((1353319841726368049 : Rat) / 47725405166179328) [(7, 2), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-16389209499091483 : Rat) / 10226872535609856) [(7, 2), (8, 1), (10, 1), (16, 1)],
  term ((349947488033723 : Rat) / 852239377967488) [(7, 2), (8, 1), (10, 2), (16, 1)],
  term ((3674057352858660123931 : Rat) / 75811806106475862528) [(7, 2), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2362877370809801204651 : Rat) / 151623612212951725056) [(7, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((1186750147506747 : Rat) / 644937907651072) [(7, 2), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((31308594075310269003563 : Rat) / 303247224425903450112) [(7, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((234049543066301841079 : Rat) / 16847068023661302784) [(7, 2), (8, 1), (11, 2), (14, 1), (16, 1)],
  term ((-773530512246286335553 : Rat) / 50541204070983908352) [(7, 2), (8, 1), (11, 2), (16, 1)],
  term ((16549472857713853 : Rat) / 1491418911443104) [(7, 2), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-45043032468617529 : Rat) / 47725405166179328) [(7, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((3084653865858353 : Rat) / 958769300213424) [(7, 2), (8, 1), (14, 1), (16, 1)],
  term ((178703730328681975 : Rat) / 6817915023739904) [(7, 2), (8, 1), (15, 2), (16, 1)],
  term ((-5919904330058953 : Rat) / 3229538695455744) [(7, 2), (8, 1), (16, 1)],
  term ((240937308571641895789 : Rat) / 6317650508872988544) [(7, 2), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((1877072492831531603975 : Rat) / 50541204070983908352) [(7, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((349947488033723 : Rat) / 426119688983744) [(7, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 5965675645772416) [(7, 2), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((90014065649565359 : Rat) / 11931351291544832) [(7, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((9655207142042678387 : Rat) / 4813448006760372224) [(7, 2), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5215218605463587495723 : Rat) / 202164816283935633408) [(7, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4470641786420435117147 : Rat) / 404329632567871266816) [(7, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-18312078542974526913 : Rat) / 1375270859074392064) [(7, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-107738122480090876834895 : Rat) / 606494448851806900224) [(7, 2), (9, 1), (11, 1), (16, 1)],
  term ((-240473047099696446673 : Rat) / 25270602035491954176) [(7, 2), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((565277130855222650825 : Rat) / 25270602035491954176) [(7, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-3001794751113820687807 : Rat) / 43321032060843350016) [(7, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 6317650508872988544) [(7, 2), (9, 1), (11, 3), (16, 1)],
  term ((-183099752496479997 : Rat) / 47725405166179328) [(7, 2), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1396991133095807 : Rat) / 5113436267804928) [(7, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-163353597466831685 : Rat) / 13635830047479808) [(7, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((2971329079268371 : Rat) / 5113436267804928) [(7, 2), (9, 1), (13, 1), (16, 1)],
  term ((-33093482828145841 : Rat) / 10047453719195648) [(7, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-951662774070118849 : Rat) / 23862702583089664) [(7, 2), (9, 1), (15, 1), (16, 1)],
  term ((183099752496479997 : Rat) / 95450810332358656) [(7, 2), (9, 1), (15, 3), (16, 1)],
  term ((-349947488033723 : Rat) / 213059844491872) [(7, 2), (9, 2), (10, 1), (16, 1)],
  term ((41469041122357166957 : Rat) / 1052941751478831424) [(7, 2), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((115359153689655303847 : Rat) / 8423534011830651392) [(7, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((39023555492874908592505 : Rat) / 303247224425903450112) [(7, 3), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 6317650508872988544) [(7, 3), (9, 1), (11, 2), (16, 1)],
  term ((1353319841726368049 : Rat) / 47725405166179328) [(7, 3), (9, 1), (15, 2), (16, 1)],
  term ((3728508138334321 : Rat) / 1278359066951232) [(7, 3), (9, 1), (16, 1)],
  term ((-240937308571641895789 : Rat) / 6317650508872988544) [(7, 3), (9, 2), (11, 1), (16, 1)],
  term ((-70302592550481639 : Rat) / 5965675645772416) [(7, 3), (9, 2), (15, 1), (16, 1)],
  term ((-115359153689655303847 : Rat) / 2105883502957662848) [(8, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((115359153689655303847 : Rat) / 4211767005915325696) [(8, 1), (9, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((115359153689655303847 : Rat) / 4211767005915325696) [(8, 1), (9, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-70302592550481639 : Rat) / 2982837822886208) [(8, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 5965675645772416) [(8, 1), (9, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 5965675645772416) [(8, 1), (9, 1), (10, 1), (15, 3), (16, 1)],
  term ((927970231076998320611 : Rat) / 101082408141967816704) [(8, 1), (9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((115859141337574330264073 : Rat) / 303247224425903450112) [(8, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-126994784110498310111405 : Rat) / 606494448851806900224) [(8, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((927970231076998320611 : Rat) / 101082408141967816704) [(8, 1), (9, 1), (11, 1), (14, 3), (16, 1)],
  term ((-115859141337574330264073 : Rat) / 606494448851806900224) [(8, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((2832754402317459495 : Rat) / 47725405166179328) [(8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-118762376429848645 : Rat) / 47725405166179328) [(8, 1), (9, 1), (14, 1), (15, 3), (16, 1)],
  term ((-2357704896598064915 : Rat) / 95450810332358656) [(8, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-118762376429848645 : Rat) / 47725405166179328) [(8, 1), (9, 1), (14, 3), (15, 1), (16, 1)],
  term ((-2832754402317459495 : Rat) / 95450810332358656) [(8, 1), (9, 1), (15, 3), (16, 1)],
  term ((40653121365766723152949 : Rat) / 151623612212951725056) [(8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-40653121365766723152949 : Rat) / 303247224425903450112) [(8, 1), (10, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-40653121365766723152949 : Rat) / 303247224425903450112) [(8, 1), (10, 1), (11, 1), (15, 3), (16, 1)],
  term ((-69556067785407573619 : Rat) / 3158825254436494272) [(8, 1), (10, 1), (11, 2), (14, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 6317650508872988544) [(8, 1), (10, 1), (11, 2), (14, 2), (16, 1)],
  term ((69556067785407573619 : Rat) / 6317650508872988544) [(8, 1), (10, 1), (11, 2), (15, 2), (16, 1)],
  term ((1365199028147600515 : Rat) / 23862702583089664) [(8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-16389209499091483 : Rat) / 5113436267804928) [(8, 1), (10, 1), (14, 1), (16, 1)],
  term ((-1353319841726368049 : Rat) / 47725405166179328) [(8, 1), (10, 1), (14, 2), (15, 2), (16, 1)],
  term ((6207049709463655 : Rat) / 10226872535609856) [(8, 1), (10, 1), (14, 2), (16, 1)],
  term ((848513315802319 : Rat) / 1704478755934976) [(8, 1), (10, 1), (14, 3), (16, 1)],
  term ((16389209499091483 : Rat) / 10226872535609856) [(8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-1353319841726368049 : Rat) / 47725405166179328) [(8, 1), (10, 1), (15, 4), (16, 1)],
  term ((349947488033723 : Rat) / 426119688983744) [(8, 1), (10, 2), (14, 1), (16, 1)],
  term ((-349947488033723 : Rat) / 852239377967488) [(8, 1), (10, 2), (14, 2), (16, 1)],
  term ((-349947488033723 : Rat) / 852239377967488) [(8, 1), (10, 2), (15, 2), (16, 1)],
  term ((-3674057352858660123931 : Rat) / 75811806106475862528) [(8, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2362877370809801204651 : Rat) / 75811806106475862528) [(8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((5686368927414813900125 : Rat) / 50541204070983908352) [(8, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-3674057352858660123931 : Rat) / 75811806106475862528) [(8, 1), (11, 1), (13, 1), (14, 3), (16, 1)],
  term ((2362877370809801204651 : Rat) / 151623612212951725056) [(8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((31308594075310269003563 : Rat) / 151623612212951725056) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1186750147506747 : Rat) / 644937907651072) [(8, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((-4313226247228014882677 : Rat) / 43321032060843350016) [(8, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1186750147506747 : Rat) / 644937907651072) [(8, 1), (11, 1), (14, 3), (15, 1), (16, 1)],
  term ((-31308594075310269003563 : Rat) / 303247224425903450112) [(8, 1), (11, 1), (15, 3), (16, 1)],
  term ((-234049543066301841079 : Rat) / 16847068023661302784) [(8, 1), (11, 2), (14, 1), (15, 2), (16, 1)],
  term ((-773530512246286335553 : Rat) / 25270602035491954176) [(8, 1), (11, 2), (14, 1), (16, 1)],
  term ((311118252949156768861 : Rat) / 7220172010140558336) [(8, 1), (11, 2), (14, 2), (16, 1)],
  term ((-234049543066301841079 : Rat) / 16847068023661302784) [(8, 1), (11, 2), (14, 3), (16, 1)],
  term ((773530512246286335553 : Rat) / 50541204070983908352) [(8, 1), (11, 2), (15, 2), (16, 1)],
  term ((-45043032468617529 : Rat) / 23862702583089664) [(8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-16549472857713853 : Rat) / 1491418911443104) [(8, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((1104209295362304121 : Rat) / 47725405166179328) [(8, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-16549472857713853 : Rat) / 1491418911443104) [(8, 1), (13, 1), (14, 3), (15, 1), (16, 1)],
  term ((45043032468617529 : Rat) / 47725405166179328) [(8, 1), (13, 1), (15, 3), (16, 1)],
  term ((40800666195964067 : Rat) / 829205881265664) [(8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-5919904330058953 : Rat) / 1614769347727872) [(8, 1), (14, 1), (16, 1)],
  term ((-178703730328681975 : Rat) / 6817915023739904) [(8, 1), (14, 2), (15, 2), (16, 1)],
  term ((507313877100989291 : Rat) / 61361235213659136) [(8, 1), (14, 2), (16, 1)],
  term ((-3084653865858353 : Rat) / 958769300213424) [(8, 1), (14, 3), (16, 1)],
  term ((5919904330058953 : Rat) / 3229538695455744) [(8, 1), (15, 2), (16, 1)],
  term ((-178703730328681975 : Rat) / 6817915023739904) [(8, 1), (15, 4), (16, 1)],
  term ((-240937308571641895789 : Rat) / 6317650508872988544) [(9, 1), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((1877072492831531603975 : Rat) / 25270602035491954176) [(9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((1977924444314738728649 : Rat) / 50541204070983908352) [(9, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((-240937308571641895789 : Rat) / 6317650508872988544) [(9, 1), (10, 1), (11, 1), (14, 3), (16, 1)],
  term ((-1877072492831531603975 : Rat) / 50541204070983908352) [(9, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((349947488033723 : Rat) / 213059844491872) [(9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-349947488033723 : Rat) / 426119688983744) [(9, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((-349947488033723 : Rat) / 426119688983744) [(9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((90014065649565359 : Rat) / 5965675645772416) [(9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-70302592550481639 : Rat) / 5965675645772416) [(9, 1), (10, 1), (14, 1), (15, 3), (16, 1)],
  term ((191196304552361197 : Rat) / 11931351291544832) [(9, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-70302592550481639 : Rat) / 5965675645772416) [(9, 1), (10, 1), (14, 3), (15, 1), (16, 1)],
  term ((-90014065649565359 : Rat) / 11931351291544832) [(9, 1), (10, 1), (15, 3), (16, 1)],
  term ((-5215218605463587495723 : Rat) / 101082408141967816704) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9655207142042678387 : Rat) / 4813448006760372224) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((6026256005395172480231 : Rat) / 202164816283935633408) [(9, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-9655207142042678387 : Rat) / 4813448006760372224) [(9, 1), (11, 1), (13, 1), (14, 3), (15, 1), (16, 1)],
  term ((5215218605463587495723 : Rat) / 202164816283935633408) [(9, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-6296860396848586707697 : Rat) / 404329632567871266816) [(9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-107738122480090876834895 : Rat) / 303247224425903450112) [(9, 1), (11, 1), (14, 1), (16, 1)],
  term ((18312078542974526913 : Rat) / 1375270859074392064) [(9, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((47163098560414785741727 : Rat) / 303247224425903450112) [(9, 1), (11, 1), (14, 2), (16, 1)],
  term ((4470641786420435117147 : Rat) / 404329632567871266816) [(9, 1), (11, 1), (14, 3), (16, 1)],
  term ((107738122480090876834895 : Rat) / 606494448851806900224) [(9, 1), (11, 1), (15, 2), (16, 1)],
  term ((18312078542974526913 : Rat) / 1375270859074392064) [(9, 1), (11, 1), (15, 4), (16, 1)],
  term ((240473047099696446673 : Rat) / 25270602035491954176) [(9, 1), (11, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((565277130855222650825 : Rat) / 12635301017745977088) [(9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-1046223225054615544171 : Rat) / 25270602035491954176) [(9, 1), (11, 2), (13, 1), (14, 2), (16, 1)],
  term ((240473047099696446673 : Rat) / 25270602035491954176) [(9, 1), (11, 2), (13, 1), (14, 3), (16, 1)],
  term ((-565277130855222650825 : Rat) / 25270602035491954176) [(9, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-3001794751113820687807 : Rat) / 21660516030421675008) [(9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((3001794751113820687807 : Rat) / 43321032060843350016) [(9, 1), (11, 2), (14, 2), (15, 1), (16, 1)],
  term ((3001794751113820687807 : Rat) / 43321032060843350016) [(9, 1), (11, 2), (15, 3), (16, 1)],
  term ((69556067785407573619 : Rat) / 3158825254436494272) [(9, 1), (11, 3), (14, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 6317650508872988544) [(9, 1), (11, 3), (14, 2), (16, 1)],
  term ((-69556067785407573619 : Rat) / 6317650508872988544) [(9, 1), (11, 3), (15, 2), (16, 1)],
  term ((-70806965276125469 : Rat) / 2921963581602816) [(9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((183099752496479997 : Rat) / 47725405166179328) [(9, 1), (13, 1), (14, 1), (15, 4), (16, 1)],
  term ((2971329079268371 : Rat) / 2556718133902464) [(9, 1), (13, 1), (14, 1), (16, 1)],
  term ((411076172281901807 : Rat) / 95450810332358656) [(9, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-59115604358919 : Rat) / 1704478755934976) [(9, 1), (13, 1), (14, 2), (16, 1)],
  term ((183099752496479997 : Rat) / 47725405166179328) [(9, 1), (13, 1), (14, 3), (15, 2), (16, 1)],
  term ((-1396991133095807 : Rat) / 5113436267804928) [(9, 1), (13, 1), (14, 3), (16, 1)],
  term ((-2971329079268371 : Rat) / 5113436267804928) [(9, 1), (13, 1), (15, 2), (16, 1)],
  term ((163353597466831685 : Rat) / 13635830047479808) [(9, 1), (13, 1), (15, 4), (16, 1)],
  term ((-951662774070118849 : Rat) / 11931351291544832) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term ((1361175183720690967 : Rat) / 190901620664717312) [(9, 1), (14, 1), (15, 3), (16, 1)],
  term ((3177874922545704417 : Rat) / 95450810332358656) [(9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-183099752496479997 : Rat) / 95450810332358656) [(9, 1), (14, 2), (15, 3), (16, 1)],
  term ((33093482828145841 : Rat) / 10047453719195648) [(9, 1), (14, 3), (15, 1), (16, 1)],
  term ((951662774070118849 : Rat) / 23862702583089664) [(9, 1), (15, 3), (16, 1)],
  term ((-183099752496479997 : Rat) / 95450810332358656) [(9, 1), (15, 5), (16, 1)],
  term ((-349947488033723 : Rat) / 106529922245936) [(9, 2), (10, 1), (14, 1), (16, 1)],
  term ((349947488033723 : Rat) / 213059844491872) [(9, 2), (10, 1), (14, 2), (16, 1)],
  term ((349947488033723 : Rat) / 213059844491872) [(9, 2), (10, 1), (15, 2), (16, 1)],
  term ((-41469041122357166957 : Rat) / 1052941751478831424) [(9, 2), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((115359153689655303847 : Rat) / 4211767005915325696) [(9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((548145504268059367465 : Rat) / 8423534011830651392) [(9, 2), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-41469041122357166957 : Rat) / 1052941751478831424) [(9, 2), (11, 1), (13, 1), (14, 3), (16, 1)],
  term ((-115359153689655303847 : Rat) / 8423534011830651392) [(9, 2), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 5, terms 500 through 599. -/
theorem rs_R010_ueqv_R010NYY_block_05_0500_0599_valid :
    checkProductSumEq rs_R010_ueqv_R010NYY_partials_05_0500_0599
      rs_R010_ueqv_R010NYY_block_05_0500_0599 = true := by
  native_decide

end R010UeqvR010NYYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
