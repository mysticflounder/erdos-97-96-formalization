/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010NYY, term block 25:500-599

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010NYYTermShards

/-- Generator polynomial 25 for relaxed split surplus certificate `R010:u=v:R010NYY`. -/
def rs_R010_ueqv_R010NYY_generator_25_0500_0599 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(12, 1)]
]

/-- Coefficient term 500 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0500 : Poly :=
[
  term ((-1025651581868754363 : Rat) / 95450810332358656) [(1, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 500 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0500 : Poly :=
[
  term ((-1025651581868754363 : Rat) / 47725405166179328) [(1, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((1025651581868754363 : Rat) / 95450810332358656) [(1, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 500 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0500_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0500
        rs_R010_ueqv_R010NYY_generator_25_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_25_0500 := by
  native_decide

/-- Coefficient term 501 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0501 : Poly :=
[
  term ((3061504394017 : Rat) / 7609280160424) [(1, 1), (13, 1), (16, 1)]
]

/-- Partial product 501 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0501 : Poly :=
[
  term ((3061504394017 : Rat) / 3804640080212) [(1, 1), (12, 1), (13, 1), (16, 1)],
  term ((-3061504394017 : Rat) / 7609280160424) [(1, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 501 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0501_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0501
        rs_R010_ueqv_R010NYY_generator_25_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_25_0501 := by
  native_decide

/-- Coefficient term 502 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0502 : Poly :=
[
  term ((1591058188192238039 : Rat) / 47725405166179328) [(1, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 502 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0502 : Poly :=
[
  term ((1591058188192238039 : Rat) / 23862702583089664) [(1, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1591058188192238039 : Rat) / 47725405166179328) [(1, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 502 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0502_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0502
        rs_R010_ueqv_R010NYY_generator_25_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_25_0502 := by
  native_decide

/-- Coefficient term 503 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0503 : Poly :=
[
  term ((247437128563111349 : Rat) / 47725405166179328) [(1, 1), (14, 1), (15, 3), (16, 1)]
]

/-- Partial product 503 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0503 : Poly :=
[
  term ((247437128563111349 : Rat) / 23862702583089664) [(1, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-247437128563111349 : Rat) / 47725405166179328) [(1, 1), (14, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 503 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0503_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0503
        rs_R010_ueqv_R010NYY_generator_25_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_25_0503 := by
  native_decide

/-- Coefficient term 504 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0504 : Poly :=
[
  term ((21031901114830755 : Rat) / 1491418911443104) [(1, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 504 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0504 : Poly :=
[
  term ((21031901114830755 : Rat) / 745709455721552) [(1, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-21031901114830755 : Rat) / 1491418911443104) [(1, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 504 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0504_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0504
        rs_R010_ueqv_R010NYY_generator_25_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_25_0504 := by
  native_decide

/-- Coefficient term 505 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0505 : Poly :=
[
  term ((645529967593823727 : Rat) / 190901620664717312) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 505 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0505 : Poly :=
[
  term ((645529967593823727 : Rat) / 95450810332358656) [(1, 1), (12, 1), (15, 1), (16, 1)],
  term ((-645529967593823727 : Rat) / 190901620664717312) [(1, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 505 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0505_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0505
        rs_R010_ueqv_R010NYY_generator_25_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_25_0505 := by
  native_decide

/-- Coefficient term 506 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0506 : Poly :=
[
  term ((2866567510344145381 : Rat) / 95450810332358656) [(1, 1), (15, 3), (16, 1)]
]

/-- Partial product 506 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0506 : Poly :=
[
  term ((2866567510344145381 : Rat) / 47725405166179328) [(1, 1), (12, 1), (15, 3), (16, 1)],
  term ((-2866567510344145381 : Rat) / 95450810332358656) [(1, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 506 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0506_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0506
        rs_R010_ueqv_R010NYY_generator_25_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_25_0506 := by
  native_decide

/-- Coefficient term 507 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0507 : Poly :=
[
  term ((-10925110817965791 : Rat) / 75210125105630816) [(1, 2), (3, 1), (5, 1), (12, 1), (16, 1)]
]

/-- Partial product 507 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0507 : Poly :=
[
  term ((10925110817965791 : Rat) / 75210125105630816) [(1, 2), (3, 1), (5, 1), (12, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 37605062552815408) [(1, 2), (3, 1), (5, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 507 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0507_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0507
        rs_R010_ueqv_R010NYY_generator_25_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_25_0507 := by
  native_decide

/-- Coefficient term 508 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0508 : Poly :=
[
  term ((10925110817965791 : Rat) / 37605062552815408) [(1, 2), (3, 1), (5, 1), (14, 1), (16, 1)]
]

/-- Partial product 508 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0508 : Poly :=
[
  term ((10925110817965791 : Rat) / 18802531276407704) [(1, 2), (3, 1), (5, 1), (12, 1), (14, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 37605062552815408) [(1, 2), (3, 1), (5, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 508 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0508_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0508
        rs_R010_ueqv_R010NYY_generator_25_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_25_0508 := by
  native_decide

/-- Coefficient term 509 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0509 : Poly :=
[
  term ((10925110817965791 : Rat) / 150420250211261632) [(1, 2), (3, 1), (5, 1), (16, 1)]
]

/-- Partial product 509 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0509 : Poly :=
[
  term ((10925110817965791 : Rat) / 75210125105630816) [(1, 2), (3, 1), (5, 1), (12, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 150420250211261632) [(1, 2), (3, 1), (5, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 509 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0509_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0509
        rs_R010_ueqv_R010NYY_generator_25_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_25_0509 := by
  native_decide

/-- Coefficient term 510 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0510 : Poly :=
[
  term ((363534495967615059 : Rat) / 75210125105630816) [(1, 2), (3, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 510 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0510 : Poly :=
[
  term ((-363534495967615059 : Rat) / 75210125105630816) [(1, 2), (3, 1), (11, 1), (12, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 37605062552815408) [(1, 2), (3, 1), (11, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 510 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0510_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0510
        rs_R010_ueqv_R010NYY_generator_25_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_25_0510 := by
  native_decide

/-- Coefficient term 511 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0511 : Poly :=
[
  term ((-363534495967615059 : Rat) / 37605062552815408) [(1, 2), (3, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 511 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0511 : Poly :=
[
  term ((-363534495967615059 : Rat) / 18802531276407704) [(1, 2), (3, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 37605062552815408) [(1, 2), (3, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 511 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0511_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0511
        rs_R010_ueqv_R010NYY_generator_25_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_25_0511 := by
  native_decide

/-- Coefficient term 512 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0512 : Poly :=
[
  term ((-363534495967615059 : Rat) / 150420250211261632) [(1, 2), (3, 1), (11, 1), (16, 1)]
]

/-- Partial product 512 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0512 : Poly :=
[
  term ((-363534495967615059 : Rat) / 75210125105630816) [(1, 2), (3, 1), (11, 1), (12, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 150420250211261632) [(1, 2), (3, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 512 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0512_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0512
        rs_R010_ueqv_R010NYY_generator_25_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_25_0512 := by
  native_decide

/-- Coefficient term 513 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0513 : Poly :=
[
  term ((-333796423576923 : Rat) / 852239377967488) [(1, 2), (3, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 513 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0513 : Poly :=
[
  term ((333796423576923 : Rat) / 852239377967488) [(1, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 426119688983744) [(1, 2), (3, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 513 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0513_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0513
        rs_R010_ueqv_R010NYY_generator_25_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_25_0513 := by
  native_decide

/-- Coefficient term 514 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0514 : Poly :=
[
  term ((333796423576923 : Rat) / 426119688983744) [(1, 2), (3, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 514 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0514 : Poly :=
[
  term ((333796423576923 : Rat) / 213059844491872) [(1, 2), (3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 426119688983744) [(1, 2), (3, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 514 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0514_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0514
        rs_R010_ueqv_R010NYY_generator_25_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_25_0514 := by
  native_decide

/-- Coefficient term 515 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0515 : Poly :=
[
  term ((333796423576923 : Rat) / 1704478755934976) [(1, 2), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 515 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0515 : Poly :=
[
  term ((333796423576923 : Rat) / 852239377967488) [(1, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 1704478755934976) [(1, 2), (3, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 515 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0515_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0515
        rs_R010_ueqv_R010NYY_generator_25_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_25_0515 := by
  native_decide

/-- Coefficient term 516 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0516 : Poly :=
[
  term ((-24616754095471512255 : Rat) / 2105883502957662848) [(1, 2), (5, 1), (7, 1), (8, 1), (16, 1)]
]

/-- Partial product 516 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0516 : Poly :=
[
  term ((-24616754095471512255 : Rat) / 1052941751478831424) [(1, 2), (5, 1), (7, 1), (8, 1), (12, 1), (16, 1)],
  term ((24616754095471512255 : Rat) / 2105883502957662848) [(1, 2), (5, 1), (7, 1), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 516 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0516_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0516
        rs_R010_ueqv_R010NYY_generator_25_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_25_0516 := by
  native_decide

/-- Coefficient term 517 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0517 : Poly :=
[
  term ((24616754095471512255 : Rat) / 2105883502957662848) [(1, 2), (5, 1), (7, 1), (14, 1), (16, 1)]
]

/-- Partial product 517 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0517 : Poly :=
[
  term ((24616754095471512255 : Rat) / 1052941751478831424) [(1, 2), (5, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((-24616754095471512255 : Rat) / 2105883502957662848) [(1, 2), (5, 1), (7, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 517 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0517_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0517
        rs_R010_ueqv_R010NYY_generator_25_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_25_0517 := by
  native_decide

/-- Coefficient term 518 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0518 : Poly :=
[
  term ((-24616754095471512255 : Rat) / 4211767005915325696) [(1, 2), (5, 1), (7, 1), (16, 1)]
]

/-- Partial product 518 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0518 : Poly :=
[
  term ((-24616754095471512255 : Rat) / 2105883502957662848) [(1, 2), (5, 1), (7, 1), (12, 1), (16, 1)],
  term ((24616754095471512255 : Rat) / 4211767005915325696) [(1, 2), (5, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 518 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0518_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0518
        rs_R010_ueqv_R010NYY_generator_25_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_25_0518 := by
  native_decide

/-- Coefficient term 519 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0519 : Poly :=
[
  term ((24616754095471512255 : Rat) / 2105883502957662848) [(1, 2), (5, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 519 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0519 : Poly :=
[
  term ((24616754095471512255 : Rat) / 1052941751478831424) [(1, 2), (5, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((-24616754095471512255 : Rat) / 2105883502957662848) [(1, 2), (5, 1), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 519 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0519_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0519
        rs_R010_ueqv_R010NYY_generator_25_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_25_0519 := by
  native_decide

/-- Coefficient term 520 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0520 : Poly :=
[
  term ((12310172089443454059 : Rat) / 2105883502957662848) [(1, 2), (5, 1), (9, 1), (12, 1), (16, 1)]
]

/-- Partial product 520 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0520 : Poly :=
[
  term ((-12310172089443454059 : Rat) / 2105883502957662848) [(1, 2), (5, 1), (9, 1), (12, 1), (16, 1)],
  term ((12310172089443454059 : Rat) / 1052941751478831424) [(1, 2), (5, 1), (9, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 520 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0520_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0520
        rs_R010_ueqv_R010NYY_generator_25_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_25_0520 := by
  native_decide

/-- Coefficient term 521 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0521 : Poly :=
[
  term ((-12310172089443454059 : Rat) / 1052941751478831424) [(1, 2), (5, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 521 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0521 : Poly :=
[
  term ((-12310172089443454059 : Rat) / 526470875739415712) [(1, 2), (5, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((12310172089443454059 : Rat) / 1052941751478831424) [(1, 2), (5, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 521 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0521_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0521
        rs_R010_ueqv_R010NYY_generator_25_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_25_0521 := by
  native_decide

/-- Coefficient term 522 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0522 : Poly :=
[
  term ((-12310172089443454059 : Rat) / 4211767005915325696) [(1, 2), (5, 1), (9, 1), (16, 1)]
]

/-- Partial product 522 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0522 : Poly :=
[
  term ((-12310172089443454059 : Rat) / 2105883502957662848) [(1, 2), (5, 1), (9, 1), (12, 1), (16, 1)],
  term ((12310172089443454059 : Rat) / 4211767005915325696) [(1, 2), (5, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 522 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0522_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0522
        rs_R010_ueqv_R010NYY_generator_25_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_25_0522 := by
  native_decide

/-- Coefficient term 523 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0523 : Poly :=
[
  term ((4249056461351911479 : Rat) / 4211767005915325696) [(1, 2), (5, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 523 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0523 : Poly :=
[
  term ((-4249056461351911479 : Rat) / 4211767005915325696) [(1, 2), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((4249056461351911479 : Rat) / 2105883502957662848) [(1, 2), (5, 1), (11, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 523 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0523_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0523
        rs_R010_ueqv_R010NYY_generator_25_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_25_0523 := by
  native_decide

/-- Coefficient term 524 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0524 : Poly :=
[
  term ((-14432905278411711867 : Rat) / 1052941751478831424) [(1, 2), (5, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 524 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0524 : Poly :=
[
  term ((-14432905278411711867 : Rat) / 526470875739415712) [(1, 2), (5, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((14432905278411711867 : Rat) / 1052941751478831424) [(1, 2), (5, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 524 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0524_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0524
        rs_R010_ueqv_R010NYY_generator_25_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_25_0524 := by
  native_decide

/-- Coefficient term 525 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0525 : Poly :=
[
  term ((-4249056461351911479 : Rat) / 8423534011830651392) [(1, 2), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 525 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0525 : Poly :=
[
  term ((-4249056461351911479 : Rat) / 4211767005915325696) [(1, 2), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((4249056461351911479 : Rat) / 8423534011830651392) [(1, 2), (5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 525 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0525_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0525
        rs_R010_ueqv_R010NYY_generator_25_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_25_0525 := by
  native_decide

/-- Coefficient term 526 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0526 : Poly :=
[
  term ((219906078344885484717 : Rat) / 16847068023661302784) [(1, 2), (5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 526 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0526 : Poly :=
[
  term ((-219906078344885484717 : Rat) / 16847068023661302784) [(1, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((219906078344885484717 : Rat) / 8423534011830651392) [(1, 2), (5, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 526 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0526_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0526
        rs_R010_ueqv_R010NYY_generator_25_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_25_0526 := by
  native_decide

/-- Coefficient term 527 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0527 : Poly :=
[
  term ((-219906078344885484717 : Rat) / 8423534011830651392) [(1, 2), (5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 527 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0527 : Poly :=
[
  term ((-219906078344885484717 : Rat) / 4211767005915325696) [(1, 2), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((219906078344885484717 : Rat) / 8423534011830651392) [(1, 2), (5, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 527 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0527_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0527
        rs_R010_ueqv_R010NYY_generator_25_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_25_0527 := by
  native_decide

/-- Coefficient term 528 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0528 : Poly :=
[
  term ((-219906078344885484717 : Rat) / 33694136047322605568) [(1, 2), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 528 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0528 : Poly :=
[
  term ((-219906078344885484717 : Rat) / 16847068023661302784) [(1, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((219906078344885484717 : Rat) / 33694136047322605568) [(1, 2), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 528 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0528_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0528
        rs_R010_ueqv_R010NYY_generator_25_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_25_0528 := by
  native_decide

/-- Coefficient term 529 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0529 : Poly :=
[
  term ((58232073427577196457 : Rat) / 1052941751478831424) [(1, 2), (7, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 529 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0529 : Poly :=
[
  term ((58232073427577196457 : Rat) / 526470875739415712) [(1, 2), (7, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((-58232073427577196457 : Rat) / 1052941751478831424) [(1, 2), (7, 1), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 529 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0529_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0529
        rs_R010_ueqv_R010NYY_generator_25_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_25_0529 := by
  native_decide

/-- Coefficient term 530 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0530 : Poly :=
[
  term ((21031901114830755 : Rat) / 745709455721552) [(1, 2), (7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 530 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0530 : Poly :=
[
  term ((21031901114830755 : Rat) / 372854727860776) [(1, 2), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-21031901114830755 : Rat) / 745709455721552) [(1, 2), (7, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 530 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0530_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0530
        rs_R010_ueqv_R010NYY_generator_25_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_25_0530 := by
  native_decide

/-- Coefficient term 531 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0531 : Poly :=
[
  term ((-58232073427577196457 : Rat) / 1052941751478831424) [(1, 2), (7, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 531 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0531 : Poly :=
[
  term ((-58232073427577196457 : Rat) / 526470875739415712) [(1, 2), (7, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((58232073427577196457 : Rat) / 1052941751478831424) [(1, 2), (7, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 531 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0531_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0531
        rs_R010_ueqv_R010NYY_generator_25_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_25_0531 := by
  native_decide

/-- Coefficient term 532 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0532 : Poly :=
[
  term ((58232073427577196457 : Rat) / 2105883502957662848) [(1, 2), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 532 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0532 : Poly :=
[
  term ((58232073427577196457 : Rat) / 1052941751478831424) [(1, 2), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((-58232073427577196457 : Rat) / 2105883502957662848) [(1, 2), (7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 532 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0532_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0532
        rs_R010_ueqv_R010NYY_generator_25_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_25_0532 := by
  native_decide

/-- Coefficient term 533 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0533 : Poly :=
[
  term ((-21031901114830755 : Rat) / 745709455721552) [(1, 2), (7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 533 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0533 : Poly :=
[
  term ((-21031901114830755 : Rat) / 372854727860776) [(1, 2), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((21031901114830755 : Rat) / 745709455721552) [(1, 2), (7, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 533 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0533_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0533
        rs_R010_ueqv_R010NYY_generator_25_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_25_0533 := by
  native_decide

/-- Coefficient term 534 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0534 : Poly :=
[
  term ((21031901114830755 : Rat) / 1491418911443104) [(1, 2), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 534 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0534 : Poly :=
[
  term ((21031901114830755 : Rat) / 745709455721552) [(1, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-21031901114830755 : Rat) / 1491418911443104) [(1, 2), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 534 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0534_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0534
        rs_R010_ueqv_R010NYY_generator_25_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_25_0534 := by
  native_decide

/-- Coefficient term 535 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0535 : Poly :=
[
  term ((-21031901114830755 : Rat) / 745709455721552) [(1, 2), (8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 535 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0535 : Poly :=
[
  term ((-21031901114830755 : Rat) / 372854727860776) [(1, 2), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((21031901114830755 : Rat) / 745709455721552) [(1, 2), (8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 535 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0535_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0535
        rs_R010_ueqv_R010NYY_generator_25_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_25_0535 := by
  native_decide

/-- Coefficient term 536 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0536 : Poly :=
[
  term ((-58232073427577196457 : Rat) / 1052941751478831424) [(1, 2), (8, 1), (11, 2), (16, 1)]
]

/-- Partial product 536 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0536 : Poly :=
[
  term ((-58232073427577196457 : Rat) / 526470875739415712) [(1, 2), (8, 1), (11, 2), (12, 1), (16, 1)],
  term ((58232073427577196457 : Rat) / 1052941751478831424) [(1, 2), (8, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 536 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0536_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0536
        rs_R010_ueqv_R010NYY_generator_25_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_25_0536 := by
  native_decide

/-- Coefficient term 537 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0537 : Poly :=
[
  term ((-32421071444940969933 : Rat) / 1052941751478831424) [(1, 2), (9, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 537 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0537 : Poly :=
[
  term ((32421071444940969933 : Rat) / 1052941751478831424) [(1, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-32421071444940969933 : Rat) / 526470875739415712) [(1, 2), (9, 1), (11, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 537 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0537_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0537
        rs_R010_ueqv_R010NYY_generator_25_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_25_0537 := by
  native_decide

/-- Coefficient term 538 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0538 : Poly :=
[
  term ((32421071444940969933 : Rat) / 526470875739415712) [(1, 2), (9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 538 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0538 : Poly :=
[
  term ((32421071444940969933 : Rat) / 263235437869707856) [(1, 2), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-32421071444940969933 : Rat) / 526470875739415712) [(1, 2), (9, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 538 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0538_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0538
        rs_R010_ueqv_R010NYY_generator_25_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_25_0538 := by
  native_decide

/-- Coefficient term 539 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0539 : Poly :=
[
  term ((32421071444940969933 : Rat) / 2105883502957662848) [(1, 2), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 539 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0539 : Poly :=
[
  term ((32421071444940969933 : Rat) / 1052941751478831424) [(1, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-32421071444940969933 : Rat) / 2105883502957662848) [(1, 2), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 539 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0539_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0539
        rs_R010_ueqv_R010NYY_generator_25_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_25_0539 := by
  native_decide

/-- Coefficient term 540 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0540 : Poly :=
[
  term ((-24126516024986757 : Rat) / 1491418911443104) [(1, 2), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 540 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0540 : Poly :=
[
  term ((24126516024986757 : Rat) / 1491418911443104) [(1, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-24126516024986757 : Rat) / 745709455721552) [(1, 2), (9, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 540 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0540_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0540
        rs_R010_ueqv_R010NYY_generator_25_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_25_0540 := by
  native_decide

/-- Coefficient term 541 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0541 : Poly :=
[
  term ((24126516024986757 : Rat) / 745709455721552) [(1, 2), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 541 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0541 : Poly :=
[
  term ((24126516024986757 : Rat) / 372854727860776) [(1, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-24126516024986757 : Rat) / 745709455721552) [(1, 2), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 541 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0541_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0541
        rs_R010_ueqv_R010NYY_generator_25_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_25_0541 := by
  native_decide

/-- Coefficient term 542 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0542 : Poly :=
[
  term ((24126516024986757 : Rat) / 2982837822886208) [(1, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 542 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0542 : Poly :=
[
  term ((24126516024986757 : Rat) / 1491418911443104) [(1, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-24126516024986757 : Rat) / 2982837822886208) [(1, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 542 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0542_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0542
        rs_R010_ueqv_R010NYY_generator_25_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_25_0542 := by
  native_decide

/-- Coefficient term 543 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0543 : Poly :=
[
  term ((-16165627489220962821 : Rat) / 1203362001690093056) [(1, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 543 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0543 : Poly :=
[
  term ((16165627489220962821 : Rat) / 1203362001690093056) [(1, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-16165627489220962821 : Rat) / 601681000845046528) [(1, 2), (11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 543 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0543_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0543
        rs_R010_ueqv_R010NYY_generator_25_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_25_0543 := by
  native_decide

/-- Coefficient term 544 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0544 : Poly :=
[
  term ((231947569921110843987 : Rat) / 4211767005915325696) [(1, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 544 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0544 : Poly :=
[
  term ((231947569921110843987 : Rat) / 2105883502957662848) [(1, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-231947569921110843987 : Rat) / 4211767005915325696) [(1, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 544 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0544_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0544
        rs_R010_ueqv_R010NYY_generator_25_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_25_0544 := by
  native_decide

/-- Coefficient term 545 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0545 : Poly :=
[
  term ((16165627489220962821 : Rat) / 2406724003380186112) [(1, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 545 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0545 : Poly :=
[
  term ((16165627489220962821 : Rat) / 1203362001690093056) [(1, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-16165627489220962821 : Rat) / 2406724003380186112) [(1, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 545 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0545_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0545
        rs_R010_ueqv_R010NYY_generator_25_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_25_0545 := by
  native_decide

/-- Coefficient term 546 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0546 : Poly :=
[
  term ((-70245268919840672953 : Rat) / 2105883502957662848) [(1, 2), (11, 2), (12, 1), (16, 1)]
]

/-- Partial product 546 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0546 : Poly :=
[
  term ((70245268919840672953 : Rat) / 2105883502957662848) [(1, 2), (11, 2), (12, 1), (16, 1)],
  term ((-70245268919840672953 : Rat) / 1052941751478831424) [(1, 2), (11, 2), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 546 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0546_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0546
        rs_R010_ueqv_R010NYY_generator_25_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_25_0546 := by
  native_decide

/-- Coefficient term 547 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0547 : Poly :=
[
  term ((64238671173708934705 : Rat) / 526470875739415712) [(1, 2), (11, 2), (14, 1), (16, 1)]
]

/-- Partial product 547 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0547 : Poly :=
[
  term ((64238671173708934705 : Rat) / 263235437869707856) [(1, 2), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-64238671173708934705 : Rat) / 526470875739415712) [(1, 2), (11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 547 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0547_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0547
        rs_R010_ueqv_R010NYY_generator_25_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_25_0547 := by
  native_decide

/-- Coefficient term 548 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0548 : Poly :=
[
  term ((70245268919840672953 : Rat) / 4211767005915325696) [(1, 2), (11, 2), (16, 1)]
]

/-- Partial product 548 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0548 : Poly :=
[
  term ((70245268919840672953 : Rat) / 2105883502957662848) [(1, 2), (11, 2), (12, 1), (16, 1)],
  term ((-70245268919840672953 : Rat) / 4211767005915325696) [(1, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 548 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0548_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0548
        rs_R010_ueqv_R010NYY_generator_25_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_25_0548 := by
  native_decide

/-- Coefficient term 549 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0549 : Poly :=
[
  term ((-247437128563111349 : Rat) / 11931351291544832) [(1, 2), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 549 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0549 : Poly :=
[
  term ((247437128563111349 : Rat) / 11931351291544832) [(1, 2), (12, 1), (15, 2), (16, 1)],
  term ((-247437128563111349 : Rat) / 5965675645772416) [(1, 2), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 549 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0549_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0549
        rs_R010_ueqv_R010NYY_generator_25_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_25_0549 := by
  native_decide

/-- Coefficient term 550 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0550 : Poly :=
[
  term ((9184513182051 : Rat) / 7609280160424) [(1, 2), (12, 1), (16, 1)]
]

/-- Partial product 550 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0550 : Poly :=
[
  term ((-9184513182051 : Rat) / 7609280160424) [(1, 2), (12, 1), (16, 1)],
  term ((9184513182051 : Rat) / 3804640080212) [(1, 2), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 550 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0550_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0550
        rs_R010_ueqv_R010NYY_generator_25_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_25_0550 := by
  native_decide

/-- Coefficient term 551 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0551 : Poly :=
[
  term ((247437128563111349 : Rat) / 5965675645772416) [(1, 2), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 551 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0551 : Poly :=
[
  term ((247437128563111349 : Rat) / 2982837822886208) [(1, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-247437128563111349 : Rat) / 5965675645772416) [(1, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 551 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0551_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0551
        rs_R010_ueqv_R010NYY_generator_25_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_25_0551 := by
  native_decide

/-- Coefficient term 552 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0552 : Poly :=
[
  term ((-9184513182051 : Rat) / 3804640080212) [(1, 2), (14, 1), (16, 1)]
]

/-- Partial product 552 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0552 : Poly :=
[
  term ((-9184513182051 : Rat) / 1902320040106) [(1, 2), (12, 1), (14, 1), (16, 1)],
  term ((9184513182051 : Rat) / 3804640080212) [(1, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 552 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0552_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0552
        rs_R010_ueqv_R010NYY_generator_25_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_25_0552 := by
  native_decide

/-- Coefficient term 553 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0553 : Poly :=
[
  term ((247437128563111349 : Rat) / 23862702583089664) [(1, 2), (15, 2), (16, 1)]
]

/-- Partial product 553 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0553 : Poly :=
[
  term ((247437128563111349 : Rat) / 11931351291544832) [(1, 2), (12, 1), (15, 2), (16, 1)],
  term ((-247437128563111349 : Rat) / 23862702583089664) [(1, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 553 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0553_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0553
        rs_R010_ueqv_R010NYY_generator_25_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_25_0553 := by
  native_decide

/-- Coefficient term 554 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0554 : Poly :=
[
  term ((-9184513182051 : Rat) / 15218560320848) [(1, 2), (16, 1)]
]

/-- Partial product 554 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0554 : Poly :=
[
  term ((-9184513182051 : Rat) / 7609280160424) [(1, 2), (12, 1), (16, 1)],
  term ((9184513182051 : Rat) / 15218560320848) [(1, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 554 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0554_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0554
        rs_R010_ueqv_R010NYY_generator_25_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_25_0554 := by
  native_decide

/-- Coefficient term 555 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0555 : Poly :=
[
  term ((10925110817965791 : Rat) / 75210125105630816) [(2, 1), (3, 1), (5, 1), (8, 1), (16, 1)]
]

/-- Partial product 555 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0555 : Poly :=
[
  term ((10925110817965791 : Rat) / 37605062552815408) [(2, 1), (3, 1), (5, 1), (8, 1), (12, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 75210125105630816) [(2, 1), (3, 1), (5, 1), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 555 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0555_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0555
        rs_R010_ueqv_R010NYY_generator_25_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_25_0555 := by
  native_decide

/-- Coefficient term 556 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0556 : Poly :=
[
  term ((59919377231734378839 : Rat) / 33694136047322605568) [(2, 1), (3, 1), (5, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 556 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0556 : Poly :=
[
  term ((59919377231734378839 : Rat) / 16847068023661302784) [(2, 1), (3, 1), (5, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-59919377231734378839 : Rat) / 33694136047322605568) [(2, 1), (3, 1), (5, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 556 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0556_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0556
        rs_R010_ueqv_R010NYY_generator_25_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_25_0556 := by
  native_decide

/-- Coefficient term 557 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0557 : Poly :=
[
  term ((-64813826878183053207 : Rat) / 16847068023661302784) [(2, 1), (3, 1), (5, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 557 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0557 : Poly :=
[
  term ((-64813826878183053207 : Rat) / 8423534011830651392) [(2, 1), (3, 1), (5, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((64813826878183053207 : Rat) / 16847068023661302784) [(2, 1), (3, 1), (5, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 557 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0557_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0557
        rs_R010_ueqv_R010NYY_generator_25_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_25_0557 := by
  native_decide

/-- Coefficient term 558 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0558 : Poly :=
[
  term ((-32775332453897373 : Rat) / 37605062552815408) [(2, 1), (3, 1), (5, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 558 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0558 : Poly :=
[
  term ((-32775332453897373 : Rat) / 18802531276407704) [(2, 1), (3, 1), (5, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((32775332453897373 : Rat) / 37605062552815408) [(2, 1), (3, 1), (5, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 558 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0558_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0558
        rs_R010_ueqv_R010NYY_generator_25_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_25_0558 := by
  native_decide

/-- Coefficient term 559 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0559 : Poly :=
[
  term ((32775332453897373 : Rat) / 150420250211261632) [(2, 1), (3, 1), (5, 1), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 559 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0559 : Poly :=
[
  term ((32775332453897373 : Rat) / 75210125105630816) [(2, 1), (3, 1), (5, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-32775332453897373 : Rat) / 150420250211261632) [(2, 1), (3, 1), (5, 1), (10, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 559 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0559_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0559
        rs_R010_ueqv_R010NYY_generator_25_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_25_0559 := by
  native_decide

/-- Coefficient term 560 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0560 : Poly :=
[
  term ((32775332453897373 : Rat) / 75210125105630816) [(2, 1), (3, 1), (5, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 560 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0560 : Poly :=
[
  term ((32775332453897373 : Rat) / 37605062552815408) [(2, 1), (3, 1), (5, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-32775332453897373 : Rat) / 75210125105630816) [(2, 1), (3, 1), (5, 1), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 560 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0560_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0560
        rs_R010_ueqv_R010NYY_generator_25_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_25_0560 := by
  native_decide

/-- Coefficient term 561 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0561 : Poly :=
[
  term ((3957604484499008181 : Rat) / 1203362001690093056) [(2, 1), (3, 1), (5, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 561 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0561 : Poly :=
[
  term ((3957604484499008181 : Rat) / 601681000845046528) [(2, 1), (3, 1), (5, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-3957604484499008181 : Rat) / 1203362001690093056) [(2, 1), (3, 1), (5, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 561 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0561_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0561
        rs_R010_ueqv_R010NYY_generator_25_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_25_0561 := by
  native_decide

/-- Coefficient term 562 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0562 : Poly :=
[
  term ((-3957604484499008181 : Rat) / 601681000845046528) [(2, 1), (3, 1), (5, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 562 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0562 : Poly :=
[
  term ((-3957604484499008181 : Rat) / 300840500422523264) [(2, 1), (3, 1), (5, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((3957604484499008181 : Rat) / 601681000845046528) [(2, 1), (3, 1), (5, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 562 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0562_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0562
        rs_R010_ueqv_R010NYY_generator_25_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_25_0562 := by
  native_decide

/-- Coefficient term 563 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0563 : Poly :=
[
  term ((7173101654988718017 : Rat) / 4211767005915325696) [(2, 1), (3, 1), (5, 1), (12, 1), (16, 1)]
]

/-- Partial product 563 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0563 : Poly :=
[
  term ((-7173101654988718017 : Rat) / 4211767005915325696) [(2, 1), (3, 1), (5, 1), (12, 1), (16, 1)],
  term ((7173101654988718017 : Rat) / 2105883502957662848) [(2, 1), (3, 1), (5, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 563 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0563_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0563
        rs_R010_ueqv_R010NYY_generator_25_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_25_0563 := by
  native_decide

/-- Coefficient term 564 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0564 : Poly :=
[
  term ((61908961301806149 : Rat) / 150420250211261632) [(2, 1), (3, 1), (5, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 564 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0564 : Poly :=
[
  term ((61908961301806149 : Rat) / 75210125105630816) [(2, 1), (3, 1), (5, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-61908961301806149 : Rat) / 150420250211261632) [(2, 1), (3, 1), (5, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 564 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0564_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0564
        rs_R010_ueqv_R010NYY_generator_25_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_25_0564 := by
  native_decide

/-- Coefficient term 565 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0565 : Poly :=
[
  term ((10925110817965791 : Rat) / 9401265638203852) [(2, 1), (3, 1), (5, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 565 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0565 : Poly :=
[
  term ((10925110817965791 : Rat) / 4700632819101926) [(2, 1), (3, 1), (5, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-10925110817965791 : Rat) / 9401265638203852) [(2, 1), (3, 1), (5, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 565 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0565_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0565
        rs_R010_ueqv_R010NYY_generator_25_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_25_0565 := by
  native_decide

/-- Coefficient term 566 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0566 : Poly :=
[
  term ((-94414888068105819 : Rat) / 5603548319860736) [(2, 1), (3, 1), (5, 1), (14, 1), (16, 1)]
]

/-- Partial product 566 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0566 : Poly :=
[
  term ((-94414888068105819 : Rat) / 2801774159930368) [(2, 1), (3, 1), (5, 1), (12, 1), (14, 1), (16, 1)],
  term ((94414888068105819 : Rat) / 5603548319860736) [(2, 1), (3, 1), (5, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 566 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0566_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0566
        rs_R010_ueqv_R010NYY_generator_25_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_25_0566 := by
  native_decide

/-- Coefficient term 567 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0567 : Poly :=
[
  term ((-40058739665874567 : Rat) / 300840500422523264) [(2, 1), (3, 1), (5, 1), (15, 2), (16, 1)]
]

/-- Partial product 567 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0567 : Poly :=
[
  term ((-40058739665874567 : Rat) / 150420250211261632) [(2, 1), (3, 1), (5, 1), (12, 1), (15, 2), (16, 1)],
  term ((40058739665874567 : Rat) / 300840500422523264) [(2, 1), (3, 1), (5, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 567 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0567_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0567
        rs_R010_ueqv_R010NYY_generator_25_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_25_0567 := by
  native_decide

/-- Coefficient term 568 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0568 : Poly :=
[
  term ((-10925110817965791 : Rat) / 150420250211261632) [(2, 1), (3, 1), (5, 1), (16, 1)]
]

/-- Partial product 568 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0568 : Poly :=
[
  term ((-10925110817965791 : Rat) / 75210125105630816) [(2, 1), (3, 1), (5, 1), (12, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 150420250211261632) [(2, 1), (3, 1), (5, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 568 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0568_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0568
        rs_R010_ueqv_R010NYY_generator_25_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_25_0568 := by
  native_decide

/-- Coefficient term 569 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0569 : Poly :=
[
  term ((-363534495967615059 : Rat) / 75210125105630816) [(2, 1), (3, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 569 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0569 : Poly :=
[
  term ((-363534495967615059 : Rat) / 37605062552815408) [(2, 1), (3, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 75210125105630816) [(2, 1), (3, 1), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 569 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0569_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0569
        rs_R010_ueqv_R010NYY_generator_25_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_25_0569 := by
  native_decide

/-- Coefficient term 570 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0570 : Poly :=
[
  term ((333796423576923 : Rat) / 852239377967488) [(2, 1), (3, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 570 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0570 : Poly :=
[
  term ((333796423576923 : Rat) / 426119688983744) [(2, 1), (3, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 852239377967488) [(2, 1), (3, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 570 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0570_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0570
        rs_R010_ueqv_R010NYY_generator_25_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_25_0570 := by
  native_decide

/-- Coefficient term 571 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0571 : Poly :=
[
  term ((-134961448192456258593 : Rat) / 16847068023661302784) [(2, 1), (3, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 571 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0571 : Poly :=
[
  term ((-134961448192456258593 : Rat) / 8423534011830651392) [(2, 1), (3, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((134961448192456258593 : Rat) / 16847068023661302784) [(2, 1), (3, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 571 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0571_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0571
        rs_R010_ueqv_R010NYY_generator_25_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_25_0571 := by
  native_decide

/-- Coefficient term 572 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0572 : Poly :=
[
  term ((216393175289202031809 : Rat) / 8423534011830651392) [(2, 1), (3, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 572 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0572 : Poly :=
[
  term ((216393175289202031809 : Rat) / 4211767005915325696) [(2, 1), (3, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-216393175289202031809 : Rat) / 8423534011830651392) [(2, 1), (3, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 572 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0572_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0572
        rs_R010_ueqv_R010NYY_generator_25_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_25_0572 := by
  native_decide

/-- Coefficient term 573 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0573 : Poly :=
[
  term ((-123748013411651733 : Rat) / 23862702583089664) [(2, 1), (3, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 573 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0573 : Poly :=
[
  term ((-123748013411651733 : Rat) / 11931351291544832) [(2, 1), (3, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((123748013411651733 : Rat) / 23862702583089664) [(2, 1), (3, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 573 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0573_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0573
        rs_R010_ueqv_R010NYY_generator_25_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_25_0573 := by
  native_decide

/-- Coefficient term 574 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0574 : Poly :=
[
  term ((9950570892537 : Rat) / 1037779533056) [(2, 1), (3, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 574 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0574 : Poly :=
[
  term ((9950570892537 : Rat) / 518889766528) [(2, 1), (3, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-9950570892537 : Rat) / 1037779533056) [(2, 1), (3, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 574 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0574_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0574
        rs_R010_ueqv_R010NYY_generator_25_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_25_0574 := by
  native_decide

/-- Coefficient term 575 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0575 : Poly :=
[
  term ((1090603487902845177 : Rat) / 37605062552815408) [(2, 1), (3, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 575 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0575 : Poly :=
[
  term ((1090603487902845177 : Rat) / 18802531276407704) [(2, 1), (3, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1090603487902845177 : Rat) / 37605062552815408) [(2, 1), (3, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 575 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0575_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0575
        rs_R010_ueqv_R010NYY_generator_25_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_25_0575 := by
  native_decide

/-- Coefficient term 576 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0576 : Poly :=
[
  term ((-1090603487902845177 : Rat) / 150420250211261632) [(2, 1), (3, 1), (10, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 576 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0576 : Poly :=
[
  term ((-1090603487902845177 : Rat) / 75210125105630816) [(2, 1), (3, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((1090603487902845177 : Rat) / 150420250211261632) [(2, 1), (3, 1), (10, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 576 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0576_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0576
        rs_R010_ueqv_R010NYY_generator_25_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_25_0576 := by
  native_decide

/-- Coefficient term 577 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0577 : Poly :=
[
  term ((-1090603487902845177 : Rat) / 75210125105630816) [(2, 1), (3, 1), (10, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 577 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0577 : Poly :=
[
  term ((-1090603487902845177 : Rat) / 37605062552815408) [(2, 1), (3, 1), (10, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((1090603487902845177 : Rat) / 75210125105630816) [(2, 1), (3, 1), (10, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 577 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0577_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0577
        rs_R010_ueqv_R010NYY_generator_25_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_25_0577 := by
  native_decide

/-- Coefficient term 578 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0578 : Poly :=
[
  term ((-1001389270730769 : Rat) / 426119688983744) [(2, 1), (3, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 578 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0578 : Poly :=
[
  term ((-1001389270730769 : Rat) / 213059844491872) [(2, 1), (3, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((1001389270730769 : Rat) / 426119688983744) [(2, 1), (3, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 578 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0578_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0578
        rs_R010_ueqv_R010NYY_generator_25_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_25_0578 := by
  native_decide

/-- Coefficient term 579 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0579 : Poly :=
[
  term ((1001389270730769 : Rat) / 1704478755934976) [(2, 1), (3, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 579 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0579 : Poly :=
[
  term ((1001389270730769 : Rat) / 852239377967488) [(2, 1), (3, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1001389270730769 : Rat) / 1704478755934976) [(2, 1), (3, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 579 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0579_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0579
        rs_R010_ueqv_R010NYY_generator_25_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_25_0579 := by
  native_decide

/-- Coefficient term 580 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0580 : Poly :=
[
  term ((1001389270730769 : Rat) / 852239377967488) [(2, 1), (3, 1), (10, 1), (15, 3), (16, 1)]
]

/-- Partial product 580 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0580 : Poly :=
[
  term ((1001389270730769 : Rat) / 426119688983744) [(2, 1), (3, 1), (10, 1), (12, 1), (15, 3), (16, 1)],
  term ((-1001389270730769 : Rat) / 852239377967488) [(2, 1), (3, 1), (10, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 580 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0580_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0580
        rs_R010_ueqv_R010NYY_generator_25_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_25_0580 := by
  native_decide

/-- Coefficient term 581 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0581 : Poly :=
[
  term ((272153528161949061 : Rat) / 1052941751478831424) [(2, 1), (3, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 581 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0581 : Poly :=
[
  term ((-272153528161949061 : Rat) / 1052941751478831424) [(2, 1), (3, 1), (11, 1), (12, 1), (16, 1)],
  term ((272153528161949061 : Rat) / 526470875739415712) [(2, 1), (3, 1), (11, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 581 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0581_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0581
        rs_R010_ueqv_R010NYY_generator_25_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_25_0581 := by
  native_decide

/-- Coefficient term 582 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0582 : Poly :=
[
  term ((-795083714622537723 : Rat) / 37605062552815408) [(2, 1), (3, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 582 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0582 : Poly :=
[
  term ((-795083714622537723 : Rat) / 18802531276407704) [(2, 1), (3, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((795083714622537723 : Rat) / 37605062552815408) [(2, 1), (3, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 582 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0582_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0582
        rs_R010_ueqv_R010NYY_generator_25_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_25_0582 := by
  native_decide

/-- Coefficient term 583 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0583 : Poly :=
[
  term ((-363534495967615059 : Rat) / 9401265638203852) [(2, 1), (3, 1), (11, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 583 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0583 : Poly :=
[
  term ((-363534495967615059 : Rat) / 4700632819101926) [(2, 1), (3, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(2, 1), (3, 1), (11, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 583 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0583_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0583
        rs_R010_ueqv_R010NYY_generator_25_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_25_0583 := by
  native_decide

/-- Coefficient term 584 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0584 : Poly :=
[
  term ((393966604890061650403 : Rat) / 2406724003380186112) [(2, 1), (3, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 584 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0584 : Poly :=
[
  term ((393966604890061650403 : Rat) / 1203362001690093056) [(2, 1), (3, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-393966604890061650403 : Rat) / 2406724003380186112) [(2, 1), (3, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 584 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0584_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0584
        rs_R010_ueqv_R010NYY_generator_25_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_25_0584 := by
  native_decide

/-- Coefficient term 585 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0585 : Poly :=
[
  term ((5814184010575917447 : Rat) / 300840500422523264) [(2, 1), (3, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 585 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0585 : Poly :=
[
  term ((5814184010575917447 : Rat) / 150420250211261632) [(2, 1), (3, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-5814184010575917447 : Rat) / 300840500422523264) [(2, 1), (3, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 585 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0585_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0585
        rs_R010_ueqv_R010NYY_generator_25_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_25_0585 := by
  native_decide

/-- Coefficient term 586 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0586 : Poly :=
[
  term ((363534495967615059 : Rat) / 150420250211261632) [(2, 1), (3, 1), (11, 1), (16, 1)]
]

/-- Partial product 586 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0586 : Poly :=
[
  term ((363534495967615059 : Rat) / 75210125105630816) [(2, 1), (3, 1), (11, 1), (12, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 150420250211261632) [(2, 1), (3, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 586 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0586_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0586
        rs_R010_ueqv_R010NYY_generator_25_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_25_0586 := by
  native_decide

/-- Coefficient term 587 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0587 : Poly :=
[
  term ((-18310457117411443123 : Rat) / 601681000845046528) [(2, 1), (3, 1), (11, 2), (13, 1), (16, 1)]
]

/-- Partial product 587 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0587 : Poly :=
[
  term ((-18310457117411443123 : Rat) / 300840500422523264) [(2, 1), (3, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((18310457117411443123 : Rat) / 601681000845046528) [(2, 1), (3, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 587 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0587_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0587
        rs_R010_ueqv_R010NYY_generator_25_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_25_0587 := by
  native_decide

/-- Coefficient term 588 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0588 : Poly :=
[
  term ((18310457117411443123 : Rat) / 300840500422523264) [(2, 1), (3, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 588 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0588 : Poly :=
[
  term ((18310457117411443123 : Rat) / 150420250211261632) [(2, 1), (3, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-18310457117411443123 : Rat) / 300840500422523264) [(2, 1), (3, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 588 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0588_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0588
        rs_R010_ueqv_R010NYY_generator_25_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_25_0588 := by
  native_decide

/-- Coefficient term 589 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0589 : Poly :=
[
  term ((-5235602667764003 : Rat) / 1255931714899456) [(2, 1), (3, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 589 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0589 : Poly :=
[
  term ((5235602667764003 : Rat) / 1255931714899456) [(2, 1), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-5235602667764003 : Rat) / 627965857449728) [(2, 1), (3, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 589 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0589_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0589
        rs_R010_ueqv_R010NYY_generator_25_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_25_0589 := by
  native_decide

/-- Coefficient term 590 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0590 : Poly :=
[
  term ((1891513066935897 : Rat) / 1704478755934976) [(2, 1), (3, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 590 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0590 : Poly :=
[
  term ((1891513066935897 : Rat) / 852239377967488) [(2, 1), (3, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1891513066935897 : Rat) / 1704478755934976) [(2, 1), (3, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 590 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0590_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0590
        rs_R010_ueqv_R010NYY_generator_25_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_25_0590 := by
  native_decide

/-- Coefficient term 591 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0591 : Poly :=
[
  term ((9184513182051 : Rat) / 15218560320848) [(2, 1), (3, 1), (13, 1), (16, 1)]
]

/-- Partial product 591 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0591 : Poly :=
[
  term ((9184513182051 : Rat) / 7609280160424) [(2, 1), (3, 1), (12, 1), (13, 1), (16, 1)],
  term ((-9184513182051 : Rat) / 15218560320848) [(2, 1), (3, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 591 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0591_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0591
        rs_R010_ueqv_R010NYY_generator_25_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_25_0591 := by
  native_decide

/-- Coefficient term 592 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0592 : Poly :=
[
  term ((316160292746935919 : Rat) / 6817915023739904) [(2, 1), (3, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 592 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0592 : Poly :=
[
  term ((316160292746935919 : Rat) / 3408957511869952) [(2, 1), (3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-316160292746935919 : Rat) / 6817915023739904) [(2, 1), (3, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 592 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0592_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0592
        rs_R010_ueqv_R010NYY_generator_25_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_25_0592 := by
  native_decide

/-- Coefficient term 593 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0593 : Poly :=
[
  term ((333796423576923 : Rat) / 106529922245936) [(2, 1), (3, 1), (14, 1), (15, 3), (16, 1)]
]

/-- Partial product 593 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0593 : Poly :=
[
  term ((333796423576923 : Rat) / 53264961122968) [(2, 1), (3, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(2, 1), (3, 1), (14, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 593 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0593_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0593
        rs_R010_ueqv_R010NYY_generator_25_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_25_0593 := by
  native_decide

/-- Coefficient term 594 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0594 : Poly :=
[
  term ((-125848809281913 : Rat) / 89709408207104) [(2, 1), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 594 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0594 : Poly :=
[
  term ((-125848809281913 : Rat) / 44854704103552) [(2, 1), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((125848809281913 : Rat) / 89709408207104) [(2, 1), (3, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 594 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0594_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0594
        rs_R010_ueqv_R010NYY_generator_25_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_25_0594 := by
  native_decide

/-- Coefficient term 595 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0595 : Poly :=
[
  term ((-1223920219782051 : Rat) / 3408957511869952) [(2, 1), (3, 1), (15, 3), (16, 1)]
]

/-- Partial product 595 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0595 : Poly :=
[
  term ((-1223920219782051 : Rat) / 1704478755934976) [(2, 1), (3, 1), (12, 1), (15, 3), (16, 1)],
  term ((1223920219782051 : Rat) / 3408957511869952) [(2, 1), (3, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 595 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0595_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0595
        rs_R010_ueqv_R010NYY_generator_25_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_25_0595 := by
  native_decide

/-- Coefficient term 596 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0596 : Poly :=
[
  term ((-9184513182051 : Rat) / 13316240280742) [(2, 1), (4, 1), (10, 1), (16, 1)]
]

/-- Partial product 596 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0596 : Poly :=
[
  term ((-9184513182051 : Rat) / 6658120140371) [(2, 1), (4, 1), (10, 1), (12, 1), (16, 1)],
  term ((9184513182051 : Rat) / 13316240280742) [(2, 1), (4, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 596 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0596_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0596
        rs_R010_ueqv_R010NYY_generator_25_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_25_0596 := by
  native_decide

/-- Coefficient term 597 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0597 : Poly :=
[
  term ((9184513182051 : Rat) / 26632480561484) [(2, 1), (4, 1), (14, 1), (16, 1)]
]

/-- Partial product 597 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0597 : Poly :=
[
  term ((9184513182051 : Rat) / 13316240280742) [(2, 1), (4, 1), (12, 1), (14, 1), (16, 1)],
  term ((-9184513182051 : Rat) / 26632480561484) [(2, 1), (4, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 597 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0597_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0597
        rs_R010_ueqv_R010NYY_generator_25_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_25_0597 := by
  native_decide

/-- Coefficient term 598 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0598 : Poly :=
[
  term ((9184513182051 : Rat) / 53264961122968) [(2, 1), (4, 1), (16, 1)]
]

/-- Partial product 598 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0598 : Poly :=
[
  term ((9184513182051 : Rat) / 26632480561484) [(2, 1), (4, 1), (12, 1), (16, 1)],
  term ((-9184513182051 : Rat) / 53264961122968) [(2, 1), (4, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 598 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0598_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0598
        rs_R010_ueqv_R010NYY_generator_25_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_25_0598 := by
  native_decide

/-- Coefficient term 599 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0599 : Poly :=
[
  term ((14392997218618673391 : Rat) / 886687790719015936) [(2, 1), (5, 1), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 599 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0599 : Poly :=
[
  term ((14392997218618673391 : Rat) / 443343895359507968) [(2, 1), (5, 1), (8, 1), (9, 1), (12, 1), (16, 1)],
  term ((-14392997218618673391 : Rat) / 886687790719015936) [(2, 1), (5, 1), (8, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 599 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0599_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0599
        rs_R010_ueqv_R010NYY_generator_25_0500_0599 =
      rs_R010_ueqv_R010NYY_partial_25_0599 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010NYY_partials_25_0500_0599 : List Poly :=
[
  rs_R010_ueqv_R010NYY_partial_25_0500,
  rs_R010_ueqv_R010NYY_partial_25_0501,
  rs_R010_ueqv_R010NYY_partial_25_0502,
  rs_R010_ueqv_R010NYY_partial_25_0503,
  rs_R010_ueqv_R010NYY_partial_25_0504,
  rs_R010_ueqv_R010NYY_partial_25_0505,
  rs_R010_ueqv_R010NYY_partial_25_0506,
  rs_R010_ueqv_R010NYY_partial_25_0507,
  rs_R010_ueqv_R010NYY_partial_25_0508,
  rs_R010_ueqv_R010NYY_partial_25_0509,
  rs_R010_ueqv_R010NYY_partial_25_0510,
  rs_R010_ueqv_R010NYY_partial_25_0511,
  rs_R010_ueqv_R010NYY_partial_25_0512,
  rs_R010_ueqv_R010NYY_partial_25_0513,
  rs_R010_ueqv_R010NYY_partial_25_0514,
  rs_R010_ueqv_R010NYY_partial_25_0515,
  rs_R010_ueqv_R010NYY_partial_25_0516,
  rs_R010_ueqv_R010NYY_partial_25_0517,
  rs_R010_ueqv_R010NYY_partial_25_0518,
  rs_R010_ueqv_R010NYY_partial_25_0519,
  rs_R010_ueqv_R010NYY_partial_25_0520,
  rs_R010_ueqv_R010NYY_partial_25_0521,
  rs_R010_ueqv_R010NYY_partial_25_0522,
  rs_R010_ueqv_R010NYY_partial_25_0523,
  rs_R010_ueqv_R010NYY_partial_25_0524,
  rs_R010_ueqv_R010NYY_partial_25_0525,
  rs_R010_ueqv_R010NYY_partial_25_0526,
  rs_R010_ueqv_R010NYY_partial_25_0527,
  rs_R010_ueqv_R010NYY_partial_25_0528,
  rs_R010_ueqv_R010NYY_partial_25_0529,
  rs_R010_ueqv_R010NYY_partial_25_0530,
  rs_R010_ueqv_R010NYY_partial_25_0531,
  rs_R010_ueqv_R010NYY_partial_25_0532,
  rs_R010_ueqv_R010NYY_partial_25_0533,
  rs_R010_ueqv_R010NYY_partial_25_0534,
  rs_R010_ueqv_R010NYY_partial_25_0535,
  rs_R010_ueqv_R010NYY_partial_25_0536,
  rs_R010_ueqv_R010NYY_partial_25_0537,
  rs_R010_ueqv_R010NYY_partial_25_0538,
  rs_R010_ueqv_R010NYY_partial_25_0539,
  rs_R010_ueqv_R010NYY_partial_25_0540,
  rs_R010_ueqv_R010NYY_partial_25_0541,
  rs_R010_ueqv_R010NYY_partial_25_0542,
  rs_R010_ueqv_R010NYY_partial_25_0543,
  rs_R010_ueqv_R010NYY_partial_25_0544,
  rs_R010_ueqv_R010NYY_partial_25_0545,
  rs_R010_ueqv_R010NYY_partial_25_0546,
  rs_R010_ueqv_R010NYY_partial_25_0547,
  rs_R010_ueqv_R010NYY_partial_25_0548,
  rs_R010_ueqv_R010NYY_partial_25_0549,
  rs_R010_ueqv_R010NYY_partial_25_0550,
  rs_R010_ueqv_R010NYY_partial_25_0551,
  rs_R010_ueqv_R010NYY_partial_25_0552,
  rs_R010_ueqv_R010NYY_partial_25_0553,
  rs_R010_ueqv_R010NYY_partial_25_0554,
  rs_R010_ueqv_R010NYY_partial_25_0555,
  rs_R010_ueqv_R010NYY_partial_25_0556,
  rs_R010_ueqv_R010NYY_partial_25_0557,
  rs_R010_ueqv_R010NYY_partial_25_0558,
  rs_R010_ueqv_R010NYY_partial_25_0559,
  rs_R010_ueqv_R010NYY_partial_25_0560,
  rs_R010_ueqv_R010NYY_partial_25_0561,
  rs_R010_ueqv_R010NYY_partial_25_0562,
  rs_R010_ueqv_R010NYY_partial_25_0563,
  rs_R010_ueqv_R010NYY_partial_25_0564,
  rs_R010_ueqv_R010NYY_partial_25_0565,
  rs_R010_ueqv_R010NYY_partial_25_0566,
  rs_R010_ueqv_R010NYY_partial_25_0567,
  rs_R010_ueqv_R010NYY_partial_25_0568,
  rs_R010_ueqv_R010NYY_partial_25_0569,
  rs_R010_ueqv_R010NYY_partial_25_0570,
  rs_R010_ueqv_R010NYY_partial_25_0571,
  rs_R010_ueqv_R010NYY_partial_25_0572,
  rs_R010_ueqv_R010NYY_partial_25_0573,
  rs_R010_ueqv_R010NYY_partial_25_0574,
  rs_R010_ueqv_R010NYY_partial_25_0575,
  rs_R010_ueqv_R010NYY_partial_25_0576,
  rs_R010_ueqv_R010NYY_partial_25_0577,
  rs_R010_ueqv_R010NYY_partial_25_0578,
  rs_R010_ueqv_R010NYY_partial_25_0579,
  rs_R010_ueqv_R010NYY_partial_25_0580,
  rs_R010_ueqv_R010NYY_partial_25_0581,
  rs_R010_ueqv_R010NYY_partial_25_0582,
  rs_R010_ueqv_R010NYY_partial_25_0583,
  rs_R010_ueqv_R010NYY_partial_25_0584,
  rs_R010_ueqv_R010NYY_partial_25_0585,
  rs_R010_ueqv_R010NYY_partial_25_0586,
  rs_R010_ueqv_R010NYY_partial_25_0587,
  rs_R010_ueqv_R010NYY_partial_25_0588,
  rs_R010_ueqv_R010NYY_partial_25_0589,
  rs_R010_ueqv_R010NYY_partial_25_0590,
  rs_R010_ueqv_R010NYY_partial_25_0591,
  rs_R010_ueqv_R010NYY_partial_25_0592,
  rs_R010_ueqv_R010NYY_partial_25_0593,
  rs_R010_ueqv_R010NYY_partial_25_0594,
  rs_R010_ueqv_R010NYY_partial_25_0595,
  rs_R010_ueqv_R010NYY_partial_25_0596,
  rs_R010_ueqv_R010NYY_partial_25_0597,
  rs_R010_ueqv_R010NYY_partial_25_0598,
  rs_R010_ueqv_R010NYY_partial_25_0599
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010NYY_block_25_0500_0599 : Poly :=
[
  term ((-1025651581868754363 : Rat) / 47725405166179328) [(1, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((3061504394017 : Rat) / 3804640080212) [(1, 1), (12, 1), (13, 1), (16, 1)],
  term ((1591058188192238039 : Rat) / 23862702583089664) [(1, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((247437128563111349 : Rat) / 23862702583089664) [(1, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((21031901114830755 : Rat) / 745709455721552) [(1, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((645529967593823727 : Rat) / 95450810332358656) [(1, 1), (12, 1), (15, 1), (16, 1)],
  term ((2866567510344145381 : Rat) / 47725405166179328) [(1, 1), (12, 1), (15, 3), (16, 1)],
  term ((1025651581868754363 : Rat) / 95450810332358656) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3061504394017 : Rat) / 7609280160424) [(1, 1), (13, 1), (16, 1)],
  term ((-1591058188192238039 : Rat) / 47725405166179328) [(1, 1), (14, 1), (15, 1), (16, 1)],
  term ((-247437128563111349 : Rat) / 47725405166179328) [(1, 1), (14, 1), (15, 3), (16, 1)],
  term ((-21031901114830755 : Rat) / 1491418911443104) [(1, 1), (14, 2), (15, 1), (16, 1)],
  term ((-645529967593823727 : Rat) / 190901620664717312) [(1, 1), (15, 1), (16, 1)],
  term ((-2866567510344145381 : Rat) / 95450810332358656) [(1, 1), (15, 3), (16, 1)],
  term ((10925110817965791 : Rat) / 18802531276407704) [(1, 2), (3, 1), (5, 1), (12, 1), (14, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 37605062552815408) [(1, 2), (3, 1), (5, 1), (12, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 37605062552815408) [(1, 2), (3, 1), (5, 1), (12, 2), (16, 1)],
  term ((-10925110817965791 : Rat) / 37605062552815408) [(1, 2), (3, 1), (5, 1), (14, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 150420250211261632) [(1, 2), (3, 1), (5, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 18802531276407704) [(1, 2), (3, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 37605062552815408) [(1, 2), (3, 1), (11, 1), (12, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 37605062552815408) [(1, 2), (3, 1), (11, 1), (12, 2), (16, 1)],
  term ((363534495967615059 : Rat) / 37605062552815408) [(1, 2), (3, 1), (11, 1), (14, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 150420250211261632) [(1, 2), (3, 1), (11, 1), (16, 1)],
  term ((333796423576923 : Rat) / 213059844491872) [(1, 2), (3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 426119688983744) [(1, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 426119688983744) [(1, 2), (3, 1), (12, 2), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 426119688983744) [(1, 2), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 1704478755934976) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((-24616754095471512255 : Rat) / 1052941751478831424) [(1, 2), (5, 1), (7, 1), (8, 1), (12, 1), (16, 1)],
  term ((24616754095471512255 : Rat) / 2105883502957662848) [(1, 2), (5, 1), (7, 1), (8, 1), (16, 1)],
  term ((24616754095471512255 : Rat) / 1052941751478831424) [(1, 2), (5, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((-24616754095471512255 : Rat) / 2105883502957662848) [(1, 2), (5, 1), (7, 1), (12, 1), (16, 1)],
  term ((-24616754095471512255 : Rat) / 2105883502957662848) [(1, 2), (5, 1), (7, 1), (14, 1), (16, 1)],
  term ((24616754095471512255 : Rat) / 4211767005915325696) [(1, 2), (5, 1), (7, 1), (16, 1)],
  term ((24616754095471512255 : Rat) / 1052941751478831424) [(1, 2), (5, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((-24616754095471512255 : Rat) / 2105883502957662848) [(1, 2), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((-12310172089443454059 : Rat) / 526470875739415712) [(1, 2), (5, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-12310172089443454059 : Rat) / 1052941751478831424) [(1, 2), (5, 1), (9, 1), (12, 1), (16, 1)],
  term ((12310172089443454059 : Rat) / 1052941751478831424) [(1, 2), (5, 1), (9, 1), (12, 2), (16, 1)],
  term ((12310172089443454059 : Rat) / 1052941751478831424) [(1, 2), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((12310172089443454059 : Rat) / 4211767005915325696) [(1, 2), (5, 1), (9, 1), (16, 1)],
  term ((-14432905278411711867 : Rat) / 526470875739415712) [(1, 2), (5, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-4249056461351911479 : Rat) / 2105883502957662848) [(1, 2), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((4249056461351911479 : Rat) / 2105883502957662848) [(1, 2), (5, 1), (11, 1), (12, 2), (16, 1)],
  term ((14432905278411711867 : Rat) / 1052941751478831424) [(1, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((4249056461351911479 : Rat) / 8423534011830651392) [(1, 2), (5, 1), (11, 1), (16, 1)],
  term ((-219906078344885484717 : Rat) / 4211767005915325696) [(1, 2), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-219906078344885484717 : Rat) / 8423534011830651392) [(1, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((219906078344885484717 : Rat) / 8423534011830651392) [(1, 2), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((219906078344885484717 : Rat) / 8423534011830651392) [(1, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((219906078344885484717 : Rat) / 33694136047322605568) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((58232073427577196457 : Rat) / 526470875739415712) [(1, 2), (7, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((-58232073427577196457 : Rat) / 1052941751478831424) [(1, 2), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((21031901114830755 : Rat) / 372854727860776) [(1, 2), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-21031901114830755 : Rat) / 745709455721552) [(1, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-58232073427577196457 : Rat) / 526470875739415712) [(1, 2), (7, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((58232073427577196457 : Rat) / 1052941751478831424) [(1, 2), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((58232073427577196457 : Rat) / 1052941751478831424) [(1, 2), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-58232073427577196457 : Rat) / 2105883502957662848) [(1, 2), (7, 1), (11, 1), (16, 1)],
  term ((-21031901114830755 : Rat) / 372854727860776) [(1, 2), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((21031901114830755 : Rat) / 745709455721552) [(1, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((21031901114830755 : Rat) / 745709455721552) [(1, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-21031901114830755 : Rat) / 1491418911443104) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((-21031901114830755 : Rat) / 372854727860776) [(1, 2), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((21031901114830755 : Rat) / 745709455721552) [(1, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-58232073427577196457 : Rat) / 526470875739415712) [(1, 2), (8, 1), (11, 2), (12, 1), (16, 1)],
  term ((58232073427577196457 : Rat) / 1052941751478831424) [(1, 2), (8, 1), (11, 2), (16, 1)],
  term ((32421071444940969933 : Rat) / 263235437869707856) [(1, 2), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((32421071444940969933 : Rat) / 526470875739415712) [(1, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-32421071444940969933 : Rat) / 526470875739415712) [(1, 2), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((-32421071444940969933 : Rat) / 526470875739415712) [(1, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-32421071444940969933 : Rat) / 2105883502957662848) [(1, 2), (9, 1), (11, 1), (16, 1)],
  term ((24126516024986757 : Rat) / 372854727860776) [(1, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((24126516024986757 : Rat) / 745709455721552) [(1, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-24126516024986757 : Rat) / 745709455721552) [(1, 2), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-24126516024986757 : Rat) / 745709455721552) [(1, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-24126516024986757 : Rat) / 2982837822886208) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((231947569921110843987 : Rat) / 2105883502957662848) [(1, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((16165627489220962821 : Rat) / 601681000845046528) [(1, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-16165627489220962821 : Rat) / 601681000845046528) [(1, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-231947569921110843987 : Rat) / 4211767005915325696) [(1, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-16165627489220962821 : Rat) / 2406724003380186112) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((64238671173708934705 : Rat) / 263235437869707856) [(1, 2), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((70245268919840672953 : Rat) / 1052941751478831424) [(1, 2), (11, 2), (12, 1), (16, 1)],
  term ((-70245268919840672953 : Rat) / 1052941751478831424) [(1, 2), (11, 2), (12, 2), (16, 1)],
  term ((-64238671173708934705 : Rat) / 526470875739415712) [(1, 2), (11, 2), (14, 1), (16, 1)],
  term ((-70245268919840672953 : Rat) / 4211767005915325696) [(1, 2), (11, 2), (16, 1)],
  term ((247437128563111349 : Rat) / 2982837822886208) [(1, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-9184513182051 : Rat) / 1902320040106) [(1, 2), (12, 1), (14, 1), (16, 1)],
  term ((247437128563111349 : Rat) / 5965675645772416) [(1, 2), (12, 1), (15, 2), (16, 1)],
  term ((-9184513182051 : Rat) / 3804640080212) [(1, 2), (12, 1), (16, 1)],
  term ((-247437128563111349 : Rat) / 5965675645772416) [(1, 2), (12, 2), (15, 2), (16, 1)],
  term ((9184513182051 : Rat) / 3804640080212) [(1, 2), (12, 2), (16, 1)],
  term ((-247437128563111349 : Rat) / 5965675645772416) [(1, 2), (14, 1), (15, 2), (16, 1)],
  term ((9184513182051 : Rat) / 3804640080212) [(1, 2), (14, 1), (16, 1)],
  term ((-247437128563111349 : Rat) / 23862702583089664) [(1, 2), (15, 2), (16, 1)],
  term ((9184513182051 : Rat) / 15218560320848) [(1, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 37605062552815408) [(2, 1), (3, 1), (5, 1), (8, 1), (12, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 75210125105630816) [(2, 1), (3, 1), (5, 1), (8, 1), (16, 1)],
  term ((59919377231734378839 : Rat) / 16847068023661302784) [(2, 1), (3, 1), (5, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-64813826878183053207 : Rat) / 8423534011830651392) [(2, 1), (3, 1), (5, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-59919377231734378839 : Rat) / 33694136047322605568) [(2, 1), (3, 1), (5, 1), (9, 1), (13, 1), (16, 1)],
  term ((64813826878183053207 : Rat) / 16847068023661302784) [(2, 1), (3, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-32775332453897373 : Rat) / 18802531276407704) [(2, 1), (3, 1), (5, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((32775332453897373 : Rat) / 75210125105630816) [(2, 1), (3, 1), (5, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((32775332453897373 : Rat) / 37605062552815408) [(2, 1), (3, 1), (5, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((32775332453897373 : Rat) / 37605062552815408) [(2, 1), (3, 1), (5, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-32775332453897373 : Rat) / 150420250211261632) [(2, 1), (3, 1), (5, 1), (10, 1), (14, 1), (16, 1)],
  term ((-32775332453897373 : Rat) / 75210125105630816) [(2, 1), (3, 1), (5, 1), (10, 1), (15, 2), (16, 1)],
  term ((3957604484499008181 : Rat) / 601681000845046528) [(2, 1), (3, 1), (5, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-3957604484499008181 : Rat) / 300840500422523264) [(2, 1), (3, 1), (5, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3957604484499008181 : Rat) / 1203362001690093056) [(2, 1), (3, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((3957604484499008181 : Rat) / 601681000845046528) [(2, 1), (3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((61908961301806149 : Rat) / 75210125105630816) [(2, 1), (3, 1), (5, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 4700632819101926) [(2, 1), (3, 1), (5, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-94414888068105819 : Rat) / 2801774159930368) [(2, 1), (3, 1), (5, 1), (12, 1), (14, 1), (16, 1)],
  term ((-40058739665874567 : Rat) / 150420250211261632) [(2, 1), (3, 1), (5, 1), (12, 1), (15, 2), (16, 1)],
  term ((-7784907860794802313 : Rat) / 4211767005915325696) [(2, 1), (3, 1), (5, 1), (12, 1), (16, 1)],
  term ((7173101654988718017 : Rat) / 2105883502957662848) [(2, 1), (3, 1), (5, 1), (12, 2), (16, 1)],
  term ((-61908961301806149 : Rat) / 150420250211261632) [(2, 1), (3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 9401265638203852) [(2, 1), (3, 1), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((94414888068105819 : Rat) / 5603548319860736) [(2, 1), (3, 1), (5, 1), (14, 1), (16, 1)],
  term ((40058739665874567 : Rat) / 300840500422523264) [(2, 1), (3, 1), (5, 1), (15, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 150420250211261632) [(2, 1), (3, 1), (5, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 37605062552815408) [(2, 1), (3, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 75210125105630816) [(2, 1), (3, 1), (8, 1), (11, 1), (16, 1)],
  term ((333796423576923 : Rat) / 426119688983744) [(2, 1), (3, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 852239377967488) [(2, 1), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((-134961448192456258593 : Rat) / 8423534011830651392) [(2, 1), (3, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((216393175289202031809 : Rat) / 4211767005915325696) [(2, 1), (3, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((134961448192456258593 : Rat) / 16847068023661302784) [(2, 1), (3, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-216393175289202031809 : Rat) / 8423534011830651392) [(2, 1), (3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-123748013411651733 : Rat) / 11931351291544832) [(2, 1), (3, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((9950570892537 : Rat) / 518889766528) [(2, 1), (3, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((123748013411651733 : Rat) / 23862702583089664) [(2, 1), (3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-9950570892537 : Rat) / 1037779533056) [(2, 1), (3, 1), (9, 1), (15, 2), (16, 1)],
  term ((1090603487902845177 : Rat) / 18802531276407704) [(2, 1), (3, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1090603487902845177 : Rat) / 75210125105630816) [(2, 1), (3, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1090603487902845177 : Rat) / 37605062552815408) [(2, 1), (3, 1), (10, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1090603487902845177 : Rat) / 37605062552815408) [(2, 1), (3, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1090603487902845177 : Rat) / 150420250211261632) [(2, 1), (3, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((1090603487902845177 : Rat) / 75210125105630816) [(2, 1), (3, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1001389270730769 : Rat) / 213059844491872) [(2, 1), (3, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((1001389270730769 : Rat) / 852239377967488) [(2, 1), (3, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1001389270730769 : Rat) / 426119688983744) [(2, 1), (3, 1), (10, 1), (12, 1), (15, 3), (16, 1)],
  term ((1001389270730769 : Rat) / 426119688983744) [(2, 1), (3, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1001389270730769 : Rat) / 1704478755934976) [(2, 1), (3, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1001389270730769 : Rat) / 852239377967488) [(2, 1), (3, 1), (10, 1), (15, 3), (16, 1)],
  term ((-795083714622537723 : Rat) / 18802531276407704) [(2, 1), (3, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 4700632819101926) [(2, 1), (3, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((393966604890061650403 : Rat) / 1203362001690093056) [(2, 1), (3, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((5814184010575917447 : Rat) / 150420250211261632) [(2, 1), (3, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((4817329415384661765 : Rat) / 1052941751478831424) [(2, 1), (3, 1), (11, 1), (12, 1), (16, 1)],
  term ((272153528161949061 : Rat) / 526470875739415712) [(2, 1), (3, 1), (11, 1), (12, 2), (16, 1)],
  term ((795083714622537723 : Rat) / 37605062552815408) [(2, 1), (3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(2, 1), (3, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-393966604890061650403 : Rat) / 2406724003380186112) [(2, 1), (3, 1), (11, 1), (14, 1), (16, 1)],
  term ((-5814184010575917447 : Rat) / 300840500422523264) [(2, 1), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((-363534495967615059 : Rat) / 150420250211261632) [(2, 1), (3, 1), (11, 1), (16, 1)],
  term ((-18310457117411443123 : Rat) / 300840500422523264) [(2, 1), (3, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((18310457117411443123 : Rat) / 150420250211261632) [(2, 1), (3, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((18310457117411443123 : Rat) / 601681000845046528) [(2, 1), (3, 1), (11, 2), (13, 1), (16, 1)],
  term ((-18310457117411443123 : Rat) / 300840500422523264) [(2, 1), (3, 1), (11, 2), (15, 1), (16, 1)],
  term ((1891513066935897 : Rat) / 852239377967488) [(2, 1), (3, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((9184513182051 : Rat) / 7609280160424) [(2, 1), (3, 1), (12, 1), (13, 1), (16, 1)],
  term ((316160292746935919 : Rat) / 3408957511869952) [(2, 1), (3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 53264961122968) [(2, 1), (3, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((1711836007870439 : Rat) / 1255931714899456) [(2, 1), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1223920219782051 : Rat) / 1704478755934976) [(2, 1), (3, 1), (12, 1), (15, 3), (16, 1)],
  term ((-5235602667764003 : Rat) / 627965857449728) [(2, 1), (3, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1891513066935897 : Rat) / 1704478755934976) [(2, 1), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-9184513182051 : Rat) / 15218560320848) [(2, 1), (3, 1), (13, 1), (16, 1)],
  term ((-316160292746935919 : Rat) / 6817915023739904) [(2, 1), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(2, 1), (3, 1), (14, 1), (15, 3), (16, 1)],
  term ((125848809281913 : Rat) / 89709408207104) [(2, 1), (3, 1), (15, 1), (16, 1)],
  term ((1223920219782051 : Rat) / 3408957511869952) [(2, 1), (3, 1), (15, 3), (16, 1)],
  term ((-9184513182051 : Rat) / 6658120140371) [(2, 1), (4, 1), (10, 1), (12, 1), (16, 1)],
  term ((9184513182051 : Rat) / 13316240280742) [(2, 1), (4, 1), (10, 1), (16, 1)],
  term ((9184513182051 : Rat) / 13316240280742) [(2, 1), (4, 1), (12, 1), (14, 1), (16, 1)],
  term ((9184513182051 : Rat) / 26632480561484) [(2, 1), (4, 1), (12, 1), (16, 1)],
  term ((-9184513182051 : Rat) / 26632480561484) [(2, 1), (4, 1), (14, 1), (16, 1)],
  term ((-9184513182051 : Rat) / 53264961122968) [(2, 1), (4, 1), (16, 1)],
  term ((14392997218618673391 : Rat) / 443343895359507968) [(2, 1), (5, 1), (8, 1), (9, 1), (12, 1), (16, 1)],
  term ((-14392997218618673391 : Rat) / 886687790719015936) [(2, 1), (5, 1), (8, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 25, terms 500 through 599. -/
theorem rs_R010_ueqv_R010NYY_block_25_0500_0599_valid :
    checkProductSumEq rs_R010_ueqv_R010NYY_partials_25_0500_0599
      rs_R010_ueqv_R010NYY_block_25_0500_0599 = true := by
  native_decide

end R010UeqvR010NYYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
