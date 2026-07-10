/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010YNN, term block 10:500-580

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010YNNTermShards

/-- Generator polynomial 10 for relaxed split surplus certificate `R010:u=v:R010YNN`. -/
def rs_R010_ueqv_R010YNN_generator_10_0500_0580 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(2, 1)]
]

/-- Coefficient term 500 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0500 : Poly :=
[
  term ((-31214114089250075024 : Rat) / 53898264945705951) [(5, 2), (9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 500 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0500 : Poly :=
[
  term ((-62428228178500150048 : Rat) / 53898264945705951) [(2, 1), (5, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((31214114089250075024 : Rat) / 53898264945705951) [(5, 2), (9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 500 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0500_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0500
        rs_R010_ueqv_R010YNN_generator_10_0500_0580 =
      rs_R010_ueqv_R010YNN_partial_10_0500 := by
  native_decide

/-- Coefficient term 501 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0501 : Poly :=
[
  term ((-6660312513411557224 : Rat) / 29943480525392195) [(5, 2), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 501 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0501 : Poly :=
[
  term ((-13320625026823114448 : Rat) / 29943480525392195) [(2, 1), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((6660312513411557224 : Rat) / 29943480525392195) [(5, 2), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 501 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0501_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0501
        rs_R010_ueqv_R010YNN_generator_10_0500_0580 =
      rs_R010_ueqv_R010YNN_partial_10_0501 := by
  native_decide

/-- Coefficient term 502 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0502 : Poly :=
[
  term ((16751835683757716552 : Rat) / 53898264945705951) [(5, 2), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 502 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0502 : Poly :=
[
  term ((33503671367515433104 : Rat) / 53898264945705951) [(2, 1), (5, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-16751835683757716552 : Rat) / 53898264945705951) [(5, 2), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 502 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0502_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0502
        rs_R010_ueqv_R010YNN_generator_10_0500_0580 =
      rs_R010_ueqv_R010YNN_partial_10_0502 := by
  native_decide

/-- Coefficient term 503 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0503 : Poly :=
[
  term ((13320625026823114448 : Rat) / 29943480525392195) [(5, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 503 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0503 : Poly :=
[
  term ((26641250053646228896 : Rat) / 29943480525392195) [(2, 1), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-13320625026823114448 : Rat) / 29943480525392195) [(5, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 503 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0503_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0503
        rs_R010_ueqv_R010YNN_generator_10_0500_0580 =
      rs_R010_ueqv_R010YNN_partial_10_0503 := by
  native_decide

/-- Coefficient term 504 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0504 : Poly :=
[
  term ((62428228178500150048 : Rat) / 53898264945705951) [(5, 2), (9, 1), (15, 3), (16, 1)]
]

/-- Partial product 504 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0504 : Poly :=
[
  term ((124856456357000300096 : Rat) / 53898264945705951) [(2, 1), (5, 2), (9, 1), (15, 3), (16, 1)],
  term ((-62428228178500150048 : Rat) / 53898264945705951) [(5, 2), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 504 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0504_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0504
        rs_R010_ueqv_R010YNN_generator_10_0500_0580 =
      rs_R010_ueqv_R010YNN_partial_10_0504 := by
  native_decide

/-- Coefficient term 505 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0505 : Poly :=
[
  term ((-827720567096550400 : Rat) / 53898264945705951) [(5, 2), (9, 2), (10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 505 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0505 : Poly :=
[
  term ((-1655441134193100800 : Rat) / 53898264945705951) [(2, 1), (5, 2), (9, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((827720567096550400 : Rat) / 53898264945705951) [(5, 2), (9, 2), (10, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 505 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0505_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0505
        rs_R010_ueqv_R010YNN_generator_10_0500_0580 =
      rs_R010_ueqv_R010YNN_partial_10_0505 := by
  native_decide

/-- Coefficient term 506 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0506 : Poly :=
[
  term ((1655441134193100800 : Rat) / 53898264945705951) [(5, 2), (9, 2), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 506 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0506 : Poly :=
[
  term ((3310882268386201600 : Rat) / 53898264945705951) [(2, 1), (5, 2), (9, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1655441134193100800 : Rat) / 53898264945705951) [(5, 2), (9, 2), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 506 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0506_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0506
        rs_R010_ueqv_R010YNN_generator_10_0500_0580 =
      rs_R010_ueqv_R010YNN_partial_10_0506 := by
  native_decide

/-- Coefficient term 507 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0507 : Poly :=
[
  term ((-2509169691676712320 : Rat) / 17966088315235317) [(5, 2), (9, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 507 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0507 : Poly :=
[
  term ((-5018339383353424640 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((2509169691676712320 : Rat) / 17966088315235317) [(5, 2), (9, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 507 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0507_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0507
        rs_R010_ueqv_R010YNN_generator_10_0500_0580 =
      rs_R010_ueqv_R010YNN_partial_10_0507 := by
  native_decide

/-- Coefficient term 508 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0508 : Poly :=
[
  term ((3447953533616398400 : Rat) / 53898264945705951) [(5, 2), (9, 2), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 508 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0508 : Poly :=
[
  term ((6895907067232796800 : Rat) / 53898264945705951) [(2, 1), (5, 2), (9, 2), (10, 1), (14, 1), (16, 1)],
  term ((-3447953533616398400 : Rat) / 53898264945705951) [(5, 2), (9, 2), (10, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 508 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0508_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0508
        rs_R010_ueqv_R010YNN_generator_10_0500_0580 =
      rs_R010_ueqv_R010YNN_partial_10_0508 := by
  native_decide

/-- Coefficient term 509 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0509 : Poly :=
[
  term ((5018339383353424640 : Rat) / 17966088315235317) [(5, 2), (9, 2), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 509 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0509 : Poly :=
[
  term ((10036678766706849280 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 2), (10, 1), (15, 2), (16, 1)],
  term ((-5018339383353424640 : Rat) / 17966088315235317) [(5, 2), (9, 2), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 509 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0509_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0509
        rs_R010_ueqv_R010YNN_generator_10_0500_0580 =
      rs_R010_ueqv_R010YNN_partial_10_0509 := by
  native_decide

/-- Coefficient term 510 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0510 : Poly :=
[
  term ((13215222455818420928 : Rat) / 269491324728529755) [(5, 2), (9, 2), (10, 1), (16, 1)]
]

/-- Partial product 510 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0510 : Poly :=
[
  term ((26430444911636841856 : Rat) / 269491324728529755) [(2, 1), (5, 2), (9, 2), (10, 1), (16, 1)],
  term ((-13215222455818420928 : Rat) / 269491324728529755) [(5, 2), (9, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 510 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0510_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0510
        rs_R010_ueqv_R010YNN_generator_10_0500_0580 =
      rs_R010_ueqv_R010YNN_partial_10_0510 := by
  native_decide

/-- Coefficient term 511 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0511 : Poly :=
[
  term ((237860916618752000 : Rat) / 17966088315235317) [(5, 2), (9, 2), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 511 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0511 : Poly :=
[
  term ((475721833237504000 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-237860916618752000 : Rat) / 17966088315235317) [(5, 2), (9, 2), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 511 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0511_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0511
        rs_R010_ueqv_R010YNN_generator_10_0500_0580 =
      rs_R010_ueqv_R010YNN_partial_10_0511 := by
  native_decide

/-- Coefficient term 512 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0512 : Poly :=
[
  term ((-6135583745198797952 : Rat) / 89830441576176585) [(5, 2), (9, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 512 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0512 : Poly :=
[
  term ((-12271167490397595904 : Rat) / 89830441576176585) [(2, 1), (5, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((6135583745198797952 : Rat) / 89830441576176585) [(5, 2), (9, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 512 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0512_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0512
        rs_R010_ueqv_R010YNN_generator_10_0500_0580 =
      rs_R010_ueqv_R010YNN_partial_10_0512 := by
  native_decide

/-- Coefficient term 513 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0513 : Poly :=
[
  term ((-118930458309376000 : Rat) / 17966088315235317) [(5, 2), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 513 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0513 : Poly :=
[
  term ((-237860916618752000 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((118930458309376000 : Rat) / 17966088315235317) [(5, 2), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 513 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0513_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0513
        rs_R010_ueqv_R010YNN_generator_10_0500_0580 =
      rs_R010_ueqv_R010YNN_partial_10_0513 := by
  native_decide

/-- Coefficient term 514 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0514 : Poly :=
[
  term ((12271167490397595904 : Rat) / 89830441576176585) [(5, 2), (9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 514 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0514 : Poly :=
[
  term ((24542334980795191808 : Rat) / 89830441576176585) [(2, 1), (5, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-12271167490397595904 : Rat) / 89830441576176585) [(5, 2), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 514 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0514_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0514
        rs_R010_ueqv_R010YNN_generator_10_0500_0580 =
      rs_R010_ueqv_R010YNN_partial_10_0514 := by
  native_decide

/-- Coefficient term 515 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0515 : Poly :=
[
  term ((-475721833237504000 : Rat) / 17966088315235317) [(5, 2), (9, 2), (11, 1), (15, 3), (16, 1)]
]

/-- Partial product 515 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0515 : Poly :=
[
  term ((-951443666475008000 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 2), (11, 1), (15, 3), (16, 1)],
  term ((475721833237504000 : Rat) / 17966088315235317) [(5, 2), (9, 2), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 515 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0515_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0515
        rs_R010_ueqv_R010YNN_generator_10_0500_0580 =
      rs_R010_ueqv_R010YNN_partial_10_0515 := by
  native_decide

/-- Coefficient term 516 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0516 : Poly :=
[
  term ((-59465229154688000 : Rat) / 17966088315235317) [(5, 2), (9, 2), (11, 2), (16, 1)]
]

/-- Partial product 516 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0516 : Poly :=
[
  term ((-118930458309376000 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 2), (11, 2), (16, 1)],
  term ((59465229154688000 : Rat) / 17966088315235317) [(5, 2), (9, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 516 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0516_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0516
        rs_R010_ueqv_R010YNN_generator_10_0500_0580 =
      rs_R010_ueqv_R010YNN_partial_10_0516 := by
  native_decide

/-- Coefficient term 517 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0517 : Poly :=
[
  term ((1198497021709723613024 : Rat) / 449152207880882925) [(5, 2), (9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 517 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0517 : Poly :=
[
  term ((2396994043419447226048 : Rat) / 449152207880882925) [(2, 1), (5, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1198497021709723613024 : Rat) / 449152207880882925) [(5, 2), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 517 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0517_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0517
        rs_R010_ueqv_R010YNN_generator_10_0500_0580 =
      rs_R010_ueqv_R010YNN_partial_10_0517 := by
  native_decide

/-- Coefficient term 518 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0518 : Poly :=
[
  term ((1162108441719453888 : Rat) / 29943480525392195) [(5, 2), (9, 2), (14, 1), (16, 1)]
]

/-- Partial product 518 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0518 : Poly :=
[
  term ((2324216883438907776 : Rat) / 29943480525392195) [(2, 1), (5, 2), (9, 2), (14, 1), (16, 1)],
  term ((-1162108441719453888 : Rat) / 29943480525392195) [(5, 2), (9, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 518 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0518_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0518
        rs_R010_ueqv_R010YNN_generator_10_0500_0580 =
      rs_R010_ueqv_R010YNN_partial_10_0518 := by
  native_decide

/-- Coefficient term 519 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0519 : Poly :=
[
  term ((-2396994043419447226048 : Rat) / 449152207880882925) [(5, 2), (9, 2), (15, 2), (16, 1)]
]

/-- Partial product 519 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0519 : Poly :=
[
  term ((-4793988086838894452096 : Rat) / 449152207880882925) [(2, 1), (5, 2), (9, 2), (15, 2), (16, 1)],
  term ((2396994043419447226048 : Rat) / 449152207880882925) [(5, 2), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 519 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0519_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0519
        rs_R010_ueqv_R010YNN_generator_10_0500_0580 =
      rs_R010_ueqv_R010YNN_partial_10_0519 := by
  native_decide

/-- Coefficient term 520 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0520 : Poly :=
[
  term ((-193335910790437995008 : Rat) / 269491324728529755) [(5, 2), (9, 3), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 520 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0520 : Poly :=
[
  term ((-386671821580875990016 : Rat) / 269491324728529755) [(2, 1), (5, 2), (9, 3), (10, 1), (13, 1), (16, 1)],
  term ((193335910790437995008 : Rat) / 269491324728529755) [(5, 2), (9, 3), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 520 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0520_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0520
        rs_R010_ueqv_R010YNN_generator_10_0500_0580 =
      rs_R010_ueqv_R010YNN_partial_10_0520 := by
  native_decide

/-- Coefficient term 521 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0521 : Poly :=
[
  term ((386671821580875990016 : Rat) / 269491324728529755) [(5, 2), (9, 3), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 521 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0521 : Poly :=
[
  term ((773343643161751980032 : Rat) / 269491324728529755) [(2, 1), (5, 2), (9, 3), (10, 1), (15, 1), (16, 1)],
  term ((-386671821580875990016 : Rat) / 269491324728529755) [(5, 2), (9, 3), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 521 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0521_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0521
        rs_R010_ueqv_R010YNN_generator_10_0500_0580 =
      rs_R010_ueqv_R010YNN_partial_10_0521 := by
  native_decide

/-- Coefficient term 522 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0522 : Poly :=
[
  term ((-127103842707251200 : Rat) / 17966088315235317) [(5, 2), (9, 3), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 522 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0522 : Poly :=
[
  term ((-254207685414502400 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 3), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((127103842707251200 : Rat) / 17966088315235317) [(5, 2), (9, 3), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 522 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0522_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0522
        rs_R010_ueqv_R010YNN_generator_10_0500_0580 =
      rs_R010_ueqv_R010YNN_partial_10_0522 := by
  native_decide

/-- Coefficient term 523 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0523 : Poly :=
[
  term ((254207685414502400 : Rat) / 17966088315235317) [(5, 2), (9, 3), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 523 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0523 : Poly :=
[
  term ((508415370829004800 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 3), (11, 1), (15, 2), (16, 1)],
  term ((-254207685414502400 : Rat) / 17966088315235317) [(5, 2), (9, 3), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 523 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0523_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0523
        rs_R010_ueqv_R010YNN_generator_10_0500_0580 =
      rs_R010_ueqv_R010YNN_partial_10_0523 := by
  native_decide

/-- Coefficient term 524 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0524 : Poly :=
[
  term ((-34073019067384371968 : Rat) / 89830441576176585) [(5, 2), (9, 3), (11, 1), (16, 1)]
]

/-- Partial product 524 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0524 : Poly :=
[
  term ((-68146038134768743936 : Rat) / 89830441576176585) [(2, 1), (5, 2), (9, 3), (11, 1), (16, 1)],
  term ((34073019067384371968 : Rat) / 89830441576176585) [(5, 2), (9, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 524 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0524_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0524
        rs_R010_ueqv_R010YNN_generator_10_0500_0580 =
      rs_R010_ueqv_R010YNN_partial_10_0524 := by
  native_decide

/-- Coefficient term 525 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0525 : Poly :=
[
  term ((136292076269537487872 : Rat) / 89830441576176585) [(5, 2), (9, 3), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 525 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0525 : Poly :=
[
  term ((272584152539074975744 : Rat) / 89830441576176585) [(2, 1), (5, 2), (9, 3), (13, 1), (15, 2), (16, 1)],
  term ((-136292076269537487872 : Rat) / 89830441576176585) [(5, 2), (9, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 525 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0525_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0525
        rs_R010_ueqv_R010YNN_generator_10_0500_0580 =
      rs_R010_ueqv_R010YNN_partial_10_0525 := by
  native_decide

/-- Coefficient term 526 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0526 : Poly :=
[
  term ((-879981766182686720 : Rat) / 17966088315235317) [(5, 2), (9, 3), (13, 1), (16, 1)]
]

/-- Partial product 526 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0526 : Poly :=
[
  term ((-1759963532365373440 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 3), (13, 1), (16, 1)],
  term ((879981766182686720 : Rat) / 17966088315235317) [(5, 2), (9, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 526 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0526_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0526
        rs_R010_ueqv_R010YNN_generator_10_0500_0580 =
      rs_R010_ueqv_R010YNN_partial_10_0526 := by
  native_decide

/-- Coefficient term 527 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0527 : Poly :=
[
  term ((-68146038134768743936 : Rat) / 89830441576176585) [(5, 2), (9, 3), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 527 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0527 : Poly :=
[
  term ((-136292076269537487872 : Rat) / 89830441576176585) [(2, 1), (5, 2), (9, 3), (14, 1), (15, 1), (16, 1)],
  term ((68146038134768743936 : Rat) / 89830441576176585) [(5, 2), (9, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 527 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0527_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0527
        rs_R010_ueqv_R010YNN_generator_10_0500_0580 =
      rs_R010_ueqv_R010YNN_partial_10_0527 := by
  native_decide

/-- Coefficient term 528 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0528 : Poly :=
[
  term ((1759963532365373440 : Rat) / 17966088315235317) [(5, 2), (9, 3), (15, 1), (16, 1)]
]

/-- Partial product 528 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0528 : Poly :=
[
  term ((3519927064730746880 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 3), (15, 1), (16, 1)],
  term ((-1759963532365373440 : Rat) / 17966088315235317) [(5, 2), (9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 528 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0528_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0528
        rs_R010_ueqv_R010YNN_generator_10_0500_0580 =
      rs_R010_ueqv_R010YNN_partial_10_0528 := by
  native_decide

/-- Coefficient term 529 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0529 : Poly :=
[
  term ((-272584152539074975744 : Rat) / 89830441576176585) [(5, 2), (9, 3), (15, 3), (16, 1)]
]

/-- Partial product 529 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0529 : Poly :=
[
  term ((-545168305078149951488 : Rat) / 89830441576176585) [(2, 1), (5, 2), (9, 3), (15, 3), (16, 1)],
  term ((272584152539074975744 : Rat) / 89830441576176585) [(5, 2), (9, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 529 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0529_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0529
        rs_R010_ueqv_R010YNN_generator_10_0500_0580 =
      rs_R010_ueqv_R010YNN_partial_10_0529 := by
  native_decide

/-- Coefficient term 530 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0530 : Poly :=
[
  term ((1435727629753876480 : Rat) / 17966088315235317) [(5, 2), (9, 4), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 530 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0530 : Poly :=
[
  term ((2871455259507752960 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 4), (13, 1), (15, 1), (16, 1)],
  term ((-1435727629753876480 : Rat) / 17966088315235317) [(5, 2), (9, 4), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 530 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0530_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0530
        rs_R010_ueqv_R010YNN_generator_10_0500_0580 =
      rs_R010_ueqv_R010YNN_partial_10_0530 := by
  native_decide

/-- Coefficient term 531 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0531 : Poly :=
[
  term ((-2871455259507752960 : Rat) / 17966088315235317) [(5, 2), (9, 4), (15, 2), (16, 1)]
]

/-- Partial product 531 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0531 : Poly :=
[
  term ((-5742910519015505920 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 4), (15, 2), (16, 1)],
  term ((2871455259507752960 : Rat) / 17966088315235317) [(5, 2), (9, 4), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 531 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0531_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0531
        rs_R010_ueqv_R010YNN_generator_10_0500_0580 =
      rs_R010_ueqv_R010YNN_partial_10_0531 := by
  native_decide

/-- Coefficient term 532 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0532 : Poly :=
[
  term ((646501255873655360 : Rat) / 17966088315235317) [(5, 2), (10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 532 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0532 : Poly :=
[
  term ((1293002511747310720 : Rat) / 17966088315235317) [(2, 1), (5, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-646501255873655360 : Rat) / 17966088315235317) [(5, 2), (10, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 532 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0532_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0532
        rs_R010_ueqv_R010YNN_generator_10_0500_0580 =
      rs_R010_ueqv_R010YNN_partial_10_0532 := by
  native_decide

/-- Coefficient term 533 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0533 : Poly :=
[
  term ((-1293002511747310720 : Rat) / 17966088315235317) [(5, 2), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 533 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0533 : Poly :=
[
  term ((-2586005023494621440 : Rat) / 17966088315235317) [(2, 1), (5, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((1293002511747310720 : Rat) / 17966088315235317) [(5, 2), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 533 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0533_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0533
        rs_R010_ueqv_R010YNN_generator_10_0500_0580 =
      rs_R010_ueqv_R010YNN_partial_10_0533 := by
  native_decide

/-- Coefficient term 534 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0534 : Poly :=
[
  term ((41769332704155387088 : Rat) / 449152207880882925) [(5, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 534 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0534 : Poly :=
[
  term ((83538665408310774176 : Rat) / 449152207880882925) [(2, 1), (5, 2), (11, 1), (13, 1), (16, 1)],
  term ((-41769332704155387088 : Rat) / 449152207880882925) [(5, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 534 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0534_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0534
        rs_R010_ueqv_R010YNN_generator_10_0500_0580 =
      rs_R010_ueqv_R010YNN_partial_10_0534 := by
  native_decide

/-- Coefficient term 535 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0535 : Poly :=
[
  term ((-83538665408310774176 : Rat) / 449152207880882925) [(5, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 535 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0535 : Poly :=
[
  term ((-167077330816621548352 : Rat) / 449152207880882925) [(2, 1), (5, 2), (11, 1), (15, 1), (16, 1)],
  term ((83538665408310774176 : Rat) / 449152207880882925) [(5, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 535 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0535_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0535
        rs_R010_ueqv_R010YNN_generator_10_0500_0580 =
      rs_R010_ueqv_R010YNN_partial_10_0535 := by
  native_decide

/-- Coefficient term 536 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0536 : Poly :=
[
  term ((1716648994661777862532 : Rat) / 1347456623642648775) [(5, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 536 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0536 : Poly :=
[
  term ((3433297989323555725064 : Rat) / 1347456623642648775) [(2, 1), (5, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1716648994661777862532 : Rat) / 1347456623642648775) [(5, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 536 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0536_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0536
        rs_R010_ueqv_R010YNN_generator_10_0500_0580 =
      rs_R010_ueqv_R010YNN_partial_10_0536 := by
  native_decide

/-- Coefficient term 537 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0537 : Poly :=
[
  term ((-3433297989323555725064 : Rat) / 1347456623642648775) [(5, 2), (15, 2), (16, 1)]
]

/-- Partial product 537 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0537 : Poly :=
[
  term ((-6866595978647111450128 : Rat) / 1347456623642648775) [(2, 1), (5, 2), (15, 2), (16, 1)],
  term ((3433297989323555725064 : Rat) / 1347456623642648775) [(5, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 537 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0537_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0537
        rs_R010_ueqv_R010YNN_generator_10_0500_0580 =
      rs_R010_ueqv_R010YNN_partial_10_0537 := by
  native_decide

/-- Coefficient term 538 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0538 : Poly :=
[
  term ((-1671245910868017088 : Rat) / 29943480525392195) [(5, 3), (6, 1), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 538 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0538 : Poly :=
[
  term ((-3342491821736034176 : Rat) / 29943480525392195) [(2, 1), (5, 3), (6, 1), (8, 1), (9, 1), (16, 1)],
  term ((1671245910868017088 : Rat) / 29943480525392195) [(5, 3), (6, 1), (8, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 538 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0538_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0538
        rs_R010_ueqv_R010YNN_generator_10_0500_0580 =
      rs_R010_ueqv_R010YNN_partial_10_0538 := by
  native_decide

/-- Coefficient term 539 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0539 : Poly :=
[
  term ((129929800474369280 : Rat) / 53898264945705951) [(5, 3), (6, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 539 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0539 : Poly :=
[
  term ((259859600948738560 : Rat) / 53898264945705951) [(2, 1), (5, 3), (6, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-129929800474369280 : Rat) / 53898264945705951) [(5, 3), (6, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 539 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0539_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0539
        rs_R010_ueqv_R010YNN_generator_10_0500_0580 =
      rs_R010_ueqv_R010YNN_partial_10_0539 := by
  native_decide

/-- Coefficient term 540 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0540 : Poly :=
[
  term ((-259859600948738560 : Rat) / 53898264945705951) [(5, 3), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 540 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0540 : Poly :=
[
  term ((-519719201897477120 : Rat) / 53898264945705951) [(2, 1), (5, 3), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((259859600948738560 : Rat) / 53898264945705951) [(5, 3), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 540 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0540_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0540
        rs_R010_ueqv_R010YNN_generator_10_0500_0580 =
      rs_R010_ueqv_R010YNN_partial_10_0540 := by
  native_decide

/-- Coefficient term 541 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0541 : Poly :=
[
  term ((4920930732265216064 : Rat) / 89830441576176585) [(5, 3), (6, 1), (9, 1), (16, 1)]
]

/-- Partial product 541 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0541 : Poly :=
[
  term ((9841861464530432128 : Rat) / 89830441576176585) [(2, 1), (5, 3), (6, 1), (9, 1), (16, 1)],
  term ((-4920930732265216064 : Rat) / 89830441576176585) [(5, 3), (6, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 541 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0541_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0541
        rs_R010_ueqv_R010YNN_generator_10_0500_0580 =
      rs_R010_ueqv_R010YNN_partial_10_0541 := by
  native_decide

/-- Coefficient term 542 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0542 : Poly :=
[
  term ((37122800135534080 : Rat) / 53898264945705951) [(5, 3), (6, 1), (9, 2), (13, 1), (16, 1)]
]

/-- Partial product 542 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0542 : Poly :=
[
  term ((74245600271068160 : Rat) / 53898264945705951) [(2, 1), (5, 3), (6, 1), (9, 2), (13, 1), (16, 1)],
  term ((-37122800135534080 : Rat) / 53898264945705951) [(5, 3), (6, 1), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 542 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0542_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0542
        rs_R010_ueqv_R010YNN_generator_10_0500_0580 =
      rs_R010_ueqv_R010YNN_partial_10_0542 := by
  native_decide

/-- Coefficient term 543 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0543 : Poly :=
[
  term ((-74245600271068160 : Rat) / 53898264945705951) [(5, 3), (6, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 543 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0543 : Poly :=
[
  term ((-148491200542136320 : Rat) / 53898264945705951) [(2, 1), (5, 3), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((74245600271068160 : Rat) / 53898264945705951) [(5, 3), (6, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 543 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0543_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0543
        rs_R010_ueqv_R010YNN_generator_10_0500_0580 =
      rs_R010_ueqv_R010YNN_partial_10_0543 := by
  native_decide

/-- Coefficient term 544 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0544 : Poly :=
[
  term ((-148491200542136320 : Rat) / 5988696105078439) [(5, 3), (7, 1), (8, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 544 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0544 : Poly :=
[
  term ((-296982401084272640 : Rat) / 5988696105078439) [(2, 1), (5, 3), (7, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((148491200542136320 : Rat) / 5988696105078439) [(5, 3), (7, 1), (8, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 544 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0544_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0544
        rs_R010_ueqv_R010YNN_generator_10_0500_0580 =
      rs_R010_ueqv_R010YNN_partial_10_0544 := by
  native_decide

/-- Coefficient term 545 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0545 : Poly :=
[
  term ((296982401084272640 : Rat) / 5988696105078439) [(5, 3), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 545 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0545 : Poly :=
[
  term ((593964802168545280 : Rat) / 5988696105078439) [(2, 1), (5, 3), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-296982401084272640 : Rat) / 5988696105078439) [(5, 3), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 545 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0545_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0545
        rs_R010_ueqv_R010YNN_generator_10_0500_0580 =
      rs_R010_ueqv_R010YNN_partial_10_0545 := by
  native_decide

/-- Coefficient term 546 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0546 : Poly :=
[
  term ((74245600271068160 : Rat) / 5988696105078439) [(5, 3), (7, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 546 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0546 : Poly :=
[
  term ((148491200542136320 : Rat) / 5988696105078439) [(2, 1), (5, 3), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((-74245600271068160 : Rat) / 5988696105078439) [(5, 3), (7, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 546 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0546_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0546
        rs_R010_ueqv_R010YNN_generator_10_0500_0580 =
      rs_R010_ueqv_R010YNN_partial_10_0546 := by
  native_decide

/-- Coefficient term 547 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0547 : Poly :=
[
  term ((-148491200542136320 : Rat) / 5988696105078439) [(5, 3), (7, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 547 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0547 : Poly :=
[
  term ((-296982401084272640 : Rat) / 5988696105078439) [(2, 1), (5, 3), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((148491200542136320 : Rat) / 5988696105078439) [(5, 3), (7, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 547 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0547_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0547
        rs_R010_ueqv_R010YNN_generator_10_0500_0580 =
      rs_R010_ueqv_R010YNN_partial_10_0547 := by
  native_decide

/-- Coefficient term 548 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0548 : Poly :=
[
  term ((-10403022895177344256 : Rat) / 29943480525392195) [(5, 3), (7, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 548 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0548 : Poly :=
[
  term ((-20806045790354688512 : Rat) / 29943480525392195) [(2, 1), (5, 3), (7, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((10403022895177344256 : Rat) / 29943480525392195) [(5, 3), (7, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 548 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0548_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0548
        rs_R010_ueqv_R010YNN_generator_10_0500_0580 =
      rs_R010_ueqv_R010YNN_partial_10_0548 := by
  native_decide

/-- Coefficient term 549 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0549 : Poly :=
[
  term ((20806045790354688512 : Rat) / 29943480525392195) [(5, 3), (7, 1), (9, 2), (15, 2), (16, 1)]
]

/-- Partial product 549 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0549 : Poly :=
[
  term ((41612091580709377024 : Rat) / 29943480525392195) [(2, 1), (5, 3), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((-20806045790354688512 : Rat) / 29943480525392195) [(5, 3), (7, 1), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 549 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0549_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0549
        rs_R010_ueqv_R010YNN_generator_10_0500_0580 =
      rs_R010_ueqv_R010YNN_partial_10_0549 := by
  native_decide

/-- Coefficient term 550 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0550 : Poly :=
[
  term ((-18219332546331247232 : Rat) / 269491324728529755) [(5, 3), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 550 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0550 : Poly :=
[
  term ((-36438665092662494464 : Rat) / 269491324728529755) [(2, 1), (5, 3), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((18219332546331247232 : Rat) / 269491324728529755) [(5, 3), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 550 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0550_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0550
        rs_R010_ueqv_R010YNN_generator_10_0500_0580 =
      rs_R010_ueqv_R010YNN_partial_10_0550 := by
  native_decide

/-- Coefficient term 551 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0551 : Poly :=
[
  term ((36438665092662494464 : Rat) / 269491324728529755) [(5, 3), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 551 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0551 : Poly :=
[
  term ((72877330185324988928 : Rat) / 269491324728529755) [(2, 1), (5, 3), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-36438665092662494464 : Rat) / 269491324728529755) [(5, 3), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 551 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0551_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0551
        rs_R010_ueqv_R010YNN_generator_10_0500_0580 =
      rs_R010_ueqv_R010YNN_partial_10_0551 := by
  native_decide

/-- Coefficient term 552 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0552 : Poly :=
[
  term ((-113315924951282679296 : Rat) / 53898264945705951) [(5, 3), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 552 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0552 : Poly :=
[
  term ((-226631849902565358592 : Rat) / 53898264945705951) [(2, 1), (5, 3), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((113315924951282679296 : Rat) / 53898264945705951) [(5, 3), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 552 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0552_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0552
        rs_R010_ueqv_R010YNN_generator_10_0500_0580 =
      rs_R010_ueqv_R010YNN_partial_10_0552 := by
  native_decide

/-- Coefficient term 553 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0553 : Poly :=
[
  term ((226631849902565358592 : Rat) / 53898264945705951) [(5, 3), (8, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 553 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0553 : Poly :=
[
  term ((453263699805130717184 : Rat) / 53898264945705951) [(2, 1), (5, 3), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-226631849902565358592 : Rat) / 53898264945705951) [(5, 3), (8, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 553 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0553_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0553
        rs_R010_ueqv_R010YNN_generator_10_0500_0580 =
      rs_R010_ueqv_R010YNN_partial_10_0553 := by
  native_decide

/-- Coefficient term 554 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0554 : Poly :=
[
  term ((-5767772926478503424 : Rat) / 89830441576176585) [(5, 3), (8, 1), (9, 2), (13, 1), (16, 1)]
]

/-- Partial product 554 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0554 : Poly :=
[
  term ((-11535545852957006848 : Rat) / 89830441576176585) [(2, 1), (5, 3), (8, 1), (9, 2), (13, 1), (16, 1)],
  term ((5767772926478503424 : Rat) / 89830441576176585) [(5, 3), (8, 1), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 554 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0554_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0554
        rs_R010_ueqv_R010YNN_generator_10_0500_0580 =
      rs_R010_ueqv_R010YNN_partial_10_0554 := by
  native_decide

/-- Coefficient term 555 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0555 : Poly :=
[
  term ((11535545852957006848 : Rat) / 89830441576176585) [(5, 3), (8, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 555 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0555 : Poly :=
[
  term ((23071091705914013696 : Rat) / 89830441576176585) [(2, 1), (5, 3), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-11535545852957006848 : Rat) / 89830441576176585) [(5, 3), (8, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 555 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0555_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0555
        rs_R010_ueqv_R010YNN_generator_10_0500_0580 =
      rs_R010_ueqv_R010YNN_partial_10_0555 := by
  native_decide

/-- Coefficient term 556 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0556 : Poly :=
[
  term ((2055402032620518080 : Rat) / 53898264945705951) [(5, 3), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 556 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0556 : Poly :=
[
  term ((4110804065241036160 : Rat) / 53898264945705951) [(2, 1), (5, 3), (8, 1), (13, 1), (16, 1)],
  term ((-2055402032620518080 : Rat) / 53898264945705951) [(5, 3), (8, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 556 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0556_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0556
        rs_R010_ueqv_R010YNN_generator_10_0500_0580 =
      rs_R010_ueqv_R010YNN_partial_10_0556 := by
  native_decide

/-- Coefficient term 557 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0557 : Poly :=
[
  term ((-4110804065241036160 : Rat) / 53898264945705951) [(5, 3), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 557 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0557 : Poly :=
[
  term ((-8221608130482072320 : Rat) / 53898264945705951) [(2, 1), (5, 3), (8, 1), (15, 1), (16, 1)],
  term ((4110804065241036160 : Rat) / 53898264945705951) [(5, 3), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 557 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0557_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0557
        rs_R010_ueqv_R010YNN_generator_10_0500_0580 =
      rs_R010_ueqv_R010YNN_partial_10_0557 := by
  native_decide

/-- Coefficient term 558 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0558 : Poly :=
[
  term ((999817620846561792 : Rat) / 29943480525392195) [(5, 3), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 558 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0558 : Poly :=
[
  term ((1999635241693123584 : Rat) / 29943480525392195) [(2, 1), (5, 3), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-999817620846561792 : Rat) / 29943480525392195) [(5, 3), (9, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 558 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0558_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0558
        rs_R010_ueqv_R010YNN_generator_10_0500_0580 =
      rs_R010_ueqv_R010YNN_partial_10_0558 := by
  native_decide

/-- Coefficient term 559 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0559 : Poly :=
[
  term ((-1999635241693123584 : Rat) / 29943480525392195) [(5, 3), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 559 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0559 : Poly :=
[
  term ((-3999270483386247168 : Rat) / 29943480525392195) [(2, 1), (5, 3), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((1999635241693123584 : Rat) / 29943480525392195) [(5, 3), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 559 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0559_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0559
        rs_R010_ueqv_R010YNN_generator_10_0500_0580 =
      rs_R010_ueqv_R010YNN_partial_10_0559 := by
  native_decide

/-- Coefficient term 560 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0560 : Poly :=
[
  term ((211821591221569757264 : Rat) / 269491324728529755) [(5, 3), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 560 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0560 : Poly :=
[
  term ((423643182443139514528 : Rat) / 269491324728529755) [(2, 1), (5, 3), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-211821591221569757264 : Rat) / 269491324728529755) [(5, 3), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 560 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0560_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0560
        rs_R010_ueqv_R010YNN_generator_10_0500_0580 =
      rs_R010_ueqv_R010YNN_partial_10_0560 := by
  native_decide

/-- Coefficient term 561 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0561 : Poly :=
[
  term ((-423643182443139514528 : Rat) / 269491324728529755) [(5, 3), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 561 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0561 : Poly :=
[
  term ((-847286364886279029056 : Rat) / 269491324728529755) [(2, 1), (5, 3), (9, 1), (15, 2), (16, 1)],
  term ((423643182443139514528 : Rat) / 269491324728529755) [(5, 3), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 561 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0561_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0561
        rs_R010_ueqv_R010YNN_generator_10_0500_0580 =
      rs_R010_ueqv_R010YNN_partial_10_0561 := by
  native_decide

/-- Coefficient term 562 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0562 : Poly :=
[
  term ((13955310578987747200 : Rat) / 53898264945705951) [(5, 3), (9, 2), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 562 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0562 : Poly :=
[
  term ((27910621157975494400 : Rat) / 53898264945705951) [(2, 1), (5, 3), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((-13955310578987747200 : Rat) / 53898264945705951) [(5, 3), (9, 2), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 562 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0562_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0562
        rs_R010_ueqv_R010YNN_generator_10_0500_0580 =
      rs_R010_ueqv_R010YNN_partial_10_0562 := by
  native_decide

/-- Coefficient term 563 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0563 : Poly :=
[
  term ((-27910621157975494400 : Rat) / 53898264945705951) [(5, 3), (9, 2), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 563 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0563 : Poly :=
[
  term ((-55821242315950988800 : Rat) / 53898264945705951) [(2, 1), (5, 3), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((27910621157975494400 : Rat) / 53898264945705951) [(5, 3), (9, 2), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 563 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0563_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0563
        rs_R010_ueqv_R010YNN_generator_10_0500_0580 =
      rs_R010_ueqv_R010YNN_partial_10_0563 := by
  native_decide

/-- Coefficient term 564 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0564 : Poly :=
[
  term ((-237860916618752000 : Rat) / 17966088315235317) [(5, 3), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 564 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0564 : Poly :=
[
  term ((-475721833237504000 : Rat) / 17966088315235317) [(2, 1), (5, 3), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((237860916618752000 : Rat) / 17966088315235317) [(5, 3), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 564 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0564_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0564
        rs_R010_ueqv_R010YNN_generator_10_0500_0580 =
      rs_R010_ueqv_R010YNN_partial_10_0564 := by
  native_decide

/-- Coefficient term 565 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0565 : Poly :=
[
  term ((475721833237504000 : Rat) / 17966088315235317) [(5, 3), (9, 2), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 565 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0565 : Poly :=
[
  term ((951443666475008000 : Rat) / 17966088315235317) [(2, 1), (5, 3), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((-475721833237504000 : Rat) / 17966088315235317) [(5, 3), (9, 2), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 565 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0565_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0565
        rs_R010_ueqv_R010YNN_generator_10_0500_0580 =
      rs_R010_ueqv_R010YNN_partial_10_0565 := by
  native_decide

/-- Coefficient term 566 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0566 : Poly :=
[
  term ((1176567251959158400 : Rat) / 17966088315235317) [(5, 3), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 566 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0566 : Poly :=
[
  term ((2353134503918316800 : Rat) / 17966088315235317) [(2, 1), (5, 3), (9, 2), (11, 1), (16, 1)],
  term ((-1176567251959158400 : Rat) / 17966088315235317) [(5, 3), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 566 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0566_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0566
        rs_R010_ueqv_R010YNN_generator_10_0500_0580 =
      rs_R010_ueqv_R010YNN_partial_10_0566 := by
  native_decide

/-- Coefficient term 567 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0567 : Poly :=
[
  term ((-4706269007836633600 : Rat) / 17966088315235317) [(5, 3), (9, 2), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 567 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0567 : Poly :=
[
  term ((-9412538015673267200 : Rat) / 17966088315235317) [(2, 1), (5, 3), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((4706269007836633600 : Rat) / 17966088315235317) [(5, 3), (9, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 567 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0567_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0567
        rs_R010_ueqv_R010YNN_generator_10_0500_0580 =
      rs_R010_ueqv_R010YNN_partial_10_0567 := by
  native_decide

/-- Coefficient term 568 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0568 : Poly :=
[
  term ((9469679372517402368 : Rat) / 53898264945705951) [(5, 3), (9, 2), (13, 1), (16, 1)]
]

/-- Partial product 568 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0568 : Poly :=
[
  term ((18939358745034804736 : Rat) / 53898264945705951) [(2, 1), (5, 3), (9, 2), (13, 1), (16, 1)],
  term ((-9469679372517402368 : Rat) / 53898264945705951) [(5, 3), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 568 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0568_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0568
        rs_R010_ueqv_R010YNN_generator_10_0500_0580 =
      rs_R010_ueqv_R010YNN_partial_10_0568 := by
  native_decide

/-- Coefficient term 569 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0569 : Poly :=
[
  term ((2353134503918316800 : Rat) / 17966088315235317) [(5, 3), (9, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 569 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0569 : Poly :=
[
  term ((4706269007836633600 : Rat) / 17966088315235317) [(2, 1), (5, 3), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-2353134503918316800 : Rat) / 17966088315235317) [(5, 3), (9, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 569 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0569_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0569
        rs_R010_ueqv_R010YNN_generator_10_0500_0580 =
      rs_R010_ueqv_R010YNN_partial_10_0569 := by
  native_decide

/-- Coefficient term 570 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0570 : Poly :=
[
  term ((-18939358745034804736 : Rat) / 53898264945705951) [(5, 3), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 570 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0570 : Poly :=
[
  term ((-37878717490069609472 : Rat) / 53898264945705951) [(2, 1), (5, 3), (9, 2), (15, 1), (16, 1)],
  term ((18939358745034804736 : Rat) / 53898264945705951) [(5, 3), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 570 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0570_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0570
        rs_R010_ueqv_R010YNN_generator_10_0500_0580 =
      rs_R010_ueqv_R010YNN_partial_10_0570 := by
  native_decide

/-- Coefficient term 571 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0571 : Poly :=
[
  term ((9412538015673267200 : Rat) / 17966088315235317) [(5, 3), (9, 2), (15, 3), (16, 1)]
]

/-- Partial product 571 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0571 : Poly :=
[
  term ((18825076031346534400 : Rat) / 17966088315235317) [(2, 1), (5, 3), (9, 2), (15, 3), (16, 1)],
  term ((-9412538015673267200 : Rat) / 17966088315235317) [(5, 3), (9, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 571 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0571_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0571
        rs_R010_ueqv_R010YNN_generator_10_0500_0580 =
      rs_R010_ueqv_R010YNN_partial_10_0571 := by
  native_decide

/-- Coefficient term 572 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0572 : Poly :=
[
  term ((-136292076269537487872 : Rat) / 89830441576176585) [(5, 3), (9, 3), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 572 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0572 : Poly :=
[
  term ((-272584152539074975744 : Rat) / 89830441576176585) [(2, 1), (5, 3), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((136292076269537487872 : Rat) / 89830441576176585) [(5, 3), (9, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 572 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0572_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0572
        rs_R010_ueqv_R010YNN_generator_10_0500_0580 =
      rs_R010_ueqv_R010YNN_partial_10_0572 := by
  native_decide

/-- Coefficient term 573 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0573 : Poly :=
[
  term ((272584152539074975744 : Rat) / 89830441576176585) [(5, 3), (9, 3), (15, 2), (16, 1)]
]

/-- Partial product 573 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0573 : Poly :=
[
  term ((545168305078149951488 : Rat) / 89830441576176585) [(2, 1), (5, 3), (9, 3), (15, 2), (16, 1)],
  term ((-272584152539074975744 : Rat) / 89830441576176585) [(5, 3), (9, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 573 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0573_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0573
        rs_R010_ueqv_R010YNN_generator_10_0500_0580 =
      rs_R010_ueqv_R010YNN_partial_10_0573 := by
  native_decide

/-- Coefficient term 574 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0574 : Poly :=
[
  term ((-1897029392614988480 : Rat) / 53898264945705951) [(5, 3), (13, 1), (16, 1)]
]

/-- Partial product 574 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0574 : Poly :=
[
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(2, 1), (5, 3), (13, 1), (16, 1)],
  term ((1897029392614988480 : Rat) / 53898264945705951) [(5, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 574 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0574_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0574
        rs_R010_ueqv_R010YNN_generator_10_0500_0580 =
      rs_R010_ueqv_R010YNN_partial_10_0574 := by
  native_decide

/-- Coefficient term 575 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0575 : Poly :=
[
  term ((3794058785229976960 : Rat) / 53898264945705951) [(5, 3), (15, 1), (16, 1)]
]

/-- Partial product 575 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0575 : Poly :=
[
  term ((7588117570459953920 : Rat) / 53898264945705951) [(2, 1), (5, 3), (15, 1), (16, 1)],
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(5, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 575 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0575_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0575
        rs_R010_ueqv_R010YNN_generator_10_0500_0580 =
      rs_R010_ueqv_R010YNN_partial_10_0575 := by
  native_decide

/-- Coefficient term 576 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0576 : Poly :=
[
  term ((4706269007836633600 : Rat) / 17966088315235317) [(5, 4), (9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 576 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0576 : Poly :=
[
  term ((9412538015673267200 : Rat) / 17966088315235317) [(2, 1), (5, 4), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-4706269007836633600 : Rat) / 17966088315235317) [(5, 4), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 576 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0576_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0576
        rs_R010_ueqv_R010YNN_generator_10_0500_0580 =
      rs_R010_ueqv_R010YNN_partial_10_0576 := by
  native_decide

/-- Coefficient term 577 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0577 : Poly :=
[
  term ((-9412538015673267200 : Rat) / 17966088315235317) [(5, 4), (9, 2), (15, 2), (16, 1)]
]

/-- Partial product 577 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0577 : Poly :=
[
  term ((-18825076031346534400 : Rat) / 17966088315235317) [(2, 1), (5, 4), (9, 2), (15, 2), (16, 1)],
  term ((9412538015673267200 : Rat) / 17966088315235317) [(5, 4), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 577 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0577_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0577
        rs_R010_ueqv_R010YNN_generator_10_0500_0580 =
      rs_R010_ueqv_R010YNN_partial_10_0577 := by
  native_decide

/-- Coefficient term 578 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0578 : Poly :=
[
  term (2 : Rat) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 578 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0578 : Poly :=
[
  term (4 : Rat) [(2, 1), (13, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 578 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0578_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0578
        rs_R010_ueqv_R010YNN_generator_10_0500_0580 =
      rs_R010_ueqv_R010YNN_partial_10_0578 := by
  native_decide

/-- Coefficient term 579 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0579 : Poly :=
[
  term (-1 : Rat) [(14, 1), (16, 1)]
]

/-- Partial product 579 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0579 : Poly :=
[
  term (-2 : Rat) [(2, 1), (14, 1), (16, 1)],
  term (1 : Rat) [(14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 579 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0579_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0579
        rs_R010_ueqv_R010YNN_generator_10_0500_0580 =
      rs_R010_ueqv_R010YNN_partial_10_0579 := by
  native_decide

/-- Coefficient term 580 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0580 : Poly :=
[
  term (-4 : Rat) [(15, 2), (16, 1)]
]

/-- Partial product 580 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0580 : Poly :=
[
  term (-8 : Rat) [(2, 1), (15, 2), (16, 1)],
  term (4 : Rat) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 580 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0580_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0580
        rs_R010_ueqv_R010YNN_generator_10_0500_0580 =
      rs_R010_ueqv_R010YNN_partial_10_0580 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010YNN_partials_10_0500_0580 : List Poly :=
[
  rs_R010_ueqv_R010YNN_partial_10_0500,
  rs_R010_ueqv_R010YNN_partial_10_0501,
  rs_R010_ueqv_R010YNN_partial_10_0502,
  rs_R010_ueqv_R010YNN_partial_10_0503,
  rs_R010_ueqv_R010YNN_partial_10_0504,
  rs_R010_ueqv_R010YNN_partial_10_0505,
  rs_R010_ueqv_R010YNN_partial_10_0506,
  rs_R010_ueqv_R010YNN_partial_10_0507,
  rs_R010_ueqv_R010YNN_partial_10_0508,
  rs_R010_ueqv_R010YNN_partial_10_0509,
  rs_R010_ueqv_R010YNN_partial_10_0510,
  rs_R010_ueqv_R010YNN_partial_10_0511,
  rs_R010_ueqv_R010YNN_partial_10_0512,
  rs_R010_ueqv_R010YNN_partial_10_0513,
  rs_R010_ueqv_R010YNN_partial_10_0514,
  rs_R010_ueqv_R010YNN_partial_10_0515,
  rs_R010_ueqv_R010YNN_partial_10_0516,
  rs_R010_ueqv_R010YNN_partial_10_0517,
  rs_R010_ueqv_R010YNN_partial_10_0518,
  rs_R010_ueqv_R010YNN_partial_10_0519,
  rs_R010_ueqv_R010YNN_partial_10_0520,
  rs_R010_ueqv_R010YNN_partial_10_0521,
  rs_R010_ueqv_R010YNN_partial_10_0522,
  rs_R010_ueqv_R010YNN_partial_10_0523,
  rs_R010_ueqv_R010YNN_partial_10_0524,
  rs_R010_ueqv_R010YNN_partial_10_0525,
  rs_R010_ueqv_R010YNN_partial_10_0526,
  rs_R010_ueqv_R010YNN_partial_10_0527,
  rs_R010_ueqv_R010YNN_partial_10_0528,
  rs_R010_ueqv_R010YNN_partial_10_0529,
  rs_R010_ueqv_R010YNN_partial_10_0530,
  rs_R010_ueqv_R010YNN_partial_10_0531,
  rs_R010_ueqv_R010YNN_partial_10_0532,
  rs_R010_ueqv_R010YNN_partial_10_0533,
  rs_R010_ueqv_R010YNN_partial_10_0534,
  rs_R010_ueqv_R010YNN_partial_10_0535,
  rs_R010_ueqv_R010YNN_partial_10_0536,
  rs_R010_ueqv_R010YNN_partial_10_0537,
  rs_R010_ueqv_R010YNN_partial_10_0538,
  rs_R010_ueqv_R010YNN_partial_10_0539,
  rs_R010_ueqv_R010YNN_partial_10_0540,
  rs_R010_ueqv_R010YNN_partial_10_0541,
  rs_R010_ueqv_R010YNN_partial_10_0542,
  rs_R010_ueqv_R010YNN_partial_10_0543,
  rs_R010_ueqv_R010YNN_partial_10_0544,
  rs_R010_ueqv_R010YNN_partial_10_0545,
  rs_R010_ueqv_R010YNN_partial_10_0546,
  rs_R010_ueqv_R010YNN_partial_10_0547,
  rs_R010_ueqv_R010YNN_partial_10_0548,
  rs_R010_ueqv_R010YNN_partial_10_0549,
  rs_R010_ueqv_R010YNN_partial_10_0550,
  rs_R010_ueqv_R010YNN_partial_10_0551,
  rs_R010_ueqv_R010YNN_partial_10_0552,
  rs_R010_ueqv_R010YNN_partial_10_0553,
  rs_R010_ueqv_R010YNN_partial_10_0554,
  rs_R010_ueqv_R010YNN_partial_10_0555,
  rs_R010_ueqv_R010YNN_partial_10_0556,
  rs_R010_ueqv_R010YNN_partial_10_0557,
  rs_R010_ueqv_R010YNN_partial_10_0558,
  rs_R010_ueqv_R010YNN_partial_10_0559,
  rs_R010_ueqv_R010YNN_partial_10_0560,
  rs_R010_ueqv_R010YNN_partial_10_0561,
  rs_R010_ueqv_R010YNN_partial_10_0562,
  rs_R010_ueqv_R010YNN_partial_10_0563,
  rs_R010_ueqv_R010YNN_partial_10_0564,
  rs_R010_ueqv_R010YNN_partial_10_0565,
  rs_R010_ueqv_R010YNN_partial_10_0566,
  rs_R010_ueqv_R010YNN_partial_10_0567,
  rs_R010_ueqv_R010YNN_partial_10_0568,
  rs_R010_ueqv_R010YNN_partial_10_0569,
  rs_R010_ueqv_R010YNN_partial_10_0570,
  rs_R010_ueqv_R010YNN_partial_10_0571,
  rs_R010_ueqv_R010YNN_partial_10_0572,
  rs_R010_ueqv_R010YNN_partial_10_0573,
  rs_R010_ueqv_R010YNN_partial_10_0574,
  rs_R010_ueqv_R010YNN_partial_10_0575,
  rs_R010_ueqv_R010YNN_partial_10_0576,
  rs_R010_ueqv_R010YNN_partial_10_0577,
  rs_R010_ueqv_R010YNN_partial_10_0578,
  rs_R010_ueqv_R010YNN_partial_10_0579,
  rs_R010_ueqv_R010YNN_partial_10_0580
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010YNN_block_10_0500_0580 : Poly :=
[
  term ((-62428228178500150048 : Rat) / 53898264945705951) [(2, 1), (5, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-13320625026823114448 : Rat) / 29943480525392195) [(2, 1), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((33503671367515433104 : Rat) / 53898264945705951) [(2, 1), (5, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((26641250053646228896 : Rat) / 29943480525392195) [(2, 1), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((124856456357000300096 : Rat) / 53898264945705951) [(2, 1), (5, 2), (9, 1), (15, 3), (16, 1)],
  term ((-1655441134193100800 : Rat) / 53898264945705951) [(2, 1), (5, 2), (9, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((3310882268386201600 : Rat) / 53898264945705951) [(2, 1), (5, 2), (9, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-5018339383353424640 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((6895907067232796800 : Rat) / 53898264945705951) [(2, 1), (5, 2), (9, 2), (10, 1), (14, 1), (16, 1)],
  term ((10036678766706849280 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 2), (10, 1), (15, 2), (16, 1)],
  term ((26430444911636841856 : Rat) / 269491324728529755) [(2, 1), (5, 2), (9, 2), (10, 1), (16, 1)],
  term ((475721833237504000 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-12271167490397595904 : Rat) / 89830441576176585) [(2, 1), (5, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-237860916618752000 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((24542334980795191808 : Rat) / 89830441576176585) [(2, 1), (5, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-951443666475008000 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 2), (11, 1), (15, 3), (16, 1)],
  term ((-118930458309376000 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 2), (11, 2), (16, 1)],
  term ((2396994043419447226048 : Rat) / 449152207880882925) [(2, 1), (5, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((2324216883438907776 : Rat) / 29943480525392195) [(2, 1), (5, 2), (9, 2), (14, 1), (16, 1)],
  term ((-4793988086838894452096 : Rat) / 449152207880882925) [(2, 1), (5, 2), (9, 2), (15, 2), (16, 1)],
  term ((-386671821580875990016 : Rat) / 269491324728529755) [(2, 1), (5, 2), (9, 3), (10, 1), (13, 1), (16, 1)],
  term ((773343643161751980032 : Rat) / 269491324728529755) [(2, 1), (5, 2), (9, 3), (10, 1), (15, 1), (16, 1)],
  term ((-254207685414502400 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 3), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((508415370829004800 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 3), (11, 1), (15, 2), (16, 1)],
  term ((-68146038134768743936 : Rat) / 89830441576176585) [(2, 1), (5, 2), (9, 3), (11, 1), (16, 1)],
  term ((272584152539074975744 : Rat) / 89830441576176585) [(2, 1), (5, 2), (9, 3), (13, 1), (15, 2), (16, 1)],
  term ((-1759963532365373440 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 3), (13, 1), (16, 1)],
  term ((-136292076269537487872 : Rat) / 89830441576176585) [(2, 1), (5, 2), (9, 3), (14, 1), (15, 1), (16, 1)],
  term ((3519927064730746880 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 3), (15, 1), (16, 1)],
  term ((-545168305078149951488 : Rat) / 89830441576176585) [(2, 1), (5, 2), (9, 3), (15, 3), (16, 1)],
  term ((2871455259507752960 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 4), (13, 1), (15, 1), (16, 1)],
  term ((-5742910519015505920 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 4), (15, 2), (16, 1)],
  term ((1293002511747310720 : Rat) / 17966088315235317) [(2, 1), (5, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-2586005023494621440 : Rat) / 17966088315235317) [(2, 1), (5, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((83538665408310774176 : Rat) / 449152207880882925) [(2, 1), (5, 2), (11, 1), (13, 1), (16, 1)],
  term ((-167077330816621548352 : Rat) / 449152207880882925) [(2, 1), (5, 2), (11, 1), (15, 1), (16, 1)],
  term ((3433297989323555725064 : Rat) / 1347456623642648775) [(2, 1), (5, 2), (13, 1), (15, 1), (16, 1)],
  term ((-6866595978647111450128 : Rat) / 1347456623642648775) [(2, 1), (5, 2), (15, 2), (16, 1)],
  term ((-3342491821736034176 : Rat) / 29943480525392195) [(2, 1), (5, 3), (6, 1), (8, 1), (9, 1), (16, 1)],
  term ((259859600948738560 : Rat) / 53898264945705951) [(2, 1), (5, 3), (6, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-519719201897477120 : Rat) / 53898264945705951) [(2, 1), (5, 3), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((9841861464530432128 : Rat) / 89830441576176585) [(2, 1), (5, 3), (6, 1), (9, 1), (16, 1)],
  term ((74245600271068160 : Rat) / 53898264945705951) [(2, 1), (5, 3), (6, 1), (9, 2), (13, 1), (16, 1)],
  term ((-148491200542136320 : Rat) / 53898264945705951) [(2, 1), (5, 3), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((-296982401084272640 : Rat) / 5988696105078439) [(2, 1), (5, 3), (7, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((593964802168545280 : Rat) / 5988696105078439) [(2, 1), (5, 3), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((148491200542136320 : Rat) / 5988696105078439) [(2, 1), (5, 3), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((-296982401084272640 : Rat) / 5988696105078439) [(2, 1), (5, 3), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-20806045790354688512 : Rat) / 29943480525392195) [(2, 1), (5, 3), (7, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((41612091580709377024 : Rat) / 29943480525392195) [(2, 1), (5, 3), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((-36438665092662494464 : Rat) / 269491324728529755) [(2, 1), (5, 3), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((72877330185324988928 : Rat) / 269491324728529755) [(2, 1), (5, 3), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-226631849902565358592 : Rat) / 53898264945705951) [(2, 1), (5, 3), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((453263699805130717184 : Rat) / 53898264945705951) [(2, 1), (5, 3), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-11535545852957006848 : Rat) / 89830441576176585) [(2, 1), (5, 3), (8, 1), (9, 2), (13, 1), (16, 1)],
  term ((23071091705914013696 : Rat) / 89830441576176585) [(2, 1), (5, 3), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((4110804065241036160 : Rat) / 53898264945705951) [(2, 1), (5, 3), (8, 1), (13, 1), (16, 1)],
  term ((-8221608130482072320 : Rat) / 53898264945705951) [(2, 1), (5, 3), (8, 1), (15, 1), (16, 1)],
  term ((1999635241693123584 : Rat) / 29943480525392195) [(2, 1), (5, 3), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-3999270483386247168 : Rat) / 29943480525392195) [(2, 1), (5, 3), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((423643182443139514528 : Rat) / 269491324728529755) [(2, 1), (5, 3), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-847286364886279029056 : Rat) / 269491324728529755) [(2, 1), (5, 3), (9, 1), (15, 2), (16, 1)],
  term ((27910621157975494400 : Rat) / 53898264945705951) [(2, 1), (5, 3), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((-55821242315950988800 : Rat) / 53898264945705951) [(2, 1), (5, 3), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-475721833237504000 : Rat) / 17966088315235317) [(2, 1), (5, 3), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((951443666475008000 : Rat) / 17966088315235317) [(2, 1), (5, 3), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((2353134503918316800 : Rat) / 17966088315235317) [(2, 1), (5, 3), (9, 2), (11, 1), (16, 1)],
  term ((-9412538015673267200 : Rat) / 17966088315235317) [(2, 1), (5, 3), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((18939358745034804736 : Rat) / 53898264945705951) [(2, 1), (5, 3), (9, 2), (13, 1), (16, 1)],
  term ((4706269007836633600 : Rat) / 17966088315235317) [(2, 1), (5, 3), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-37878717490069609472 : Rat) / 53898264945705951) [(2, 1), (5, 3), (9, 2), (15, 1), (16, 1)],
  term ((18825076031346534400 : Rat) / 17966088315235317) [(2, 1), (5, 3), (9, 2), (15, 3), (16, 1)],
  term ((-272584152539074975744 : Rat) / 89830441576176585) [(2, 1), (5, 3), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((545168305078149951488 : Rat) / 89830441576176585) [(2, 1), (5, 3), (9, 3), (15, 2), (16, 1)],
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(2, 1), (5, 3), (13, 1), (16, 1)],
  term ((7588117570459953920 : Rat) / 53898264945705951) [(2, 1), (5, 3), (15, 1), (16, 1)],
  term ((9412538015673267200 : Rat) / 17966088315235317) [(2, 1), (5, 4), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-18825076031346534400 : Rat) / 17966088315235317) [(2, 1), (5, 4), (9, 2), (15, 2), (16, 1)],
  term (4 : Rat) [(2, 1), (13, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(2, 1), (14, 1), (16, 1)],
  term (-8 : Rat) [(2, 1), (15, 2), (16, 1)],
  term ((31214114089250075024 : Rat) / 53898264945705951) [(5, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((6660312513411557224 : Rat) / 29943480525392195) [(5, 2), (9, 1), (13, 1), (16, 1)],
  term ((-16751835683757716552 : Rat) / 53898264945705951) [(5, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-13320625026823114448 : Rat) / 29943480525392195) [(5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-62428228178500150048 : Rat) / 53898264945705951) [(5, 2), (9, 1), (15, 3), (16, 1)],
  term ((827720567096550400 : Rat) / 53898264945705951) [(5, 2), (9, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1655441134193100800 : Rat) / 53898264945705951) [(5, 2), (9, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((2509169691676712320 : Rat) / 17966088315235317) [(5, 2), (9, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3447953533616398400 : Rat) / 53898264945705951) [(5, 2), (9, 2), (10, 1), (14, 1), (16, 1)],
  term ((-5018339383353424640 : Rat) / 17966088315235317) [(5, 2), (9, 2), (10, 1), (15, 2), (16, 1)],
  term ((-13215222455818420928 : Rat) / 269491324728529755) [(5, 2), (9, 2), (10, 1), (16, 1)],
  term ((-237860916618752000 : Rat) / 17966088315235317) [(5, 2), (9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((6135583745198797952 : Rat) / 89830441576176585) [(5, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((118930458309376000 : Rat) / 17966088315235317) [(5, 2), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12271167490397595904 : Rat) / 89830441576176585) [(5, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((475721833237504000 : Rat) / 17966088315235317) [(5, 2), (9, 2), (11, 1), (15, 3), (16, 1)],
  term ((59465229154688000 : Rat) / 17966088315235317) [(5, 2), (9, 2), (11, 2), (16, 1)],
  term ((-1198497021709723613024 : Rat) / 449152207880882925) [(5, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1162108441719453888 : Rat) / 29943480525392195) [(5, 2), (9, 2), (14, 1), (16, 1)],
  term ((2396994043419447226048 : Rat) / 449152207880882925) [(5, 2), (9, 2), (15, 2), (16, 1)],
  term ((193335910790437995008 : Rat) / 269491324728529755) [(5, 2), (9, 3), (10, 1), (13, 1), (16, 1)],
  term ((-386671821580875990016 : Rat) / 269491324728529755) [(5, 2), (9, 3), (10, 1), (15, 1), (16, 1)],
  term ((127103842707251200 : Rat) / 17966088315235317) [(5, 2), (9, 3), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-254207685414502400 : Rat) / 17966088315235317) [(5, 2), (9, 3), (11, 1), (15, 2), (16, 1)],
  term ((34073019067384371968 : Rat) / 89830441576176585) [(5, 2), (9, 3), (11, 1), (16, 1)],
  term ((-136292076269537487872 : Rat) / 89830441576176585) [(5, 2), (9, 3), (13, 1), (15, 2), (16, 1)],
  term ((879981766182686720 : Rat) / 17966088315235317) [(5, 2), (9, 3), (13, 1), (16, 1)],
  term ((68146038134768743936 : Rat) / 89830441576176585) [(5, 2), (9, 3), (14, 1), (15, 1), (16, 1)],
  term ((-1759963532365373440 : Rat) / 17966088315235317) [(5, 2), (9, 3), (15, 1), (16, 1)],
  term ((272584152539074975744 : Rat) / 89830441576176585) [(5, 2), (9, 3), (15, 3), (16, 1)],
  term ((-1435727629753876480 : Rat) / 17966088315235317) [(5, 2), (9, 4), (13, 1), (15, 1), (16, 1)],
  term ((2871455259507752960 : Rat) / 17966088315235317) [(5, 2), (9, 4), (15, 2), (16, 1)],
  term ((-646501255873655360 : Rat) / 17966088315235317) [(5, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((1293002511747310720 : Rat) / 17966088315235317) [(5, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-41769332704155387088 : Rat) / 449152207880882925) [(5, 2), (11, 1), (13, 1), (16, 1)],
  term ((83538665408310774176 : Rat) / 449152207880882925) [(5, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1716648994661777862532 : Rat) / 1347456623642648775) [(5, 2), (13, 1), (15, 1), (16, 1)],
  term ((3433297989323555725064 : Rat) / 1347456623642648775) [(5, 2), (15, 2), (16, 1)],
  term ((1671245910868017088 : Rat) / 29943480525392195) [(5, 3), (6, 1), (8, 1), (9, 1), (16, 1)],
  term ((-129929800474369280 : Rat) / 53898264945705951) [(5, 3), (6, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((259859600948738560 : Rat) / 53898264945705951) [(5, 3), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-4920930732265216064 : Rat) / 89830441576176585) [(5, 3), (6, 1), (9, 1), (16, 1)],
  term ((-37122800135534080 : Rat) / 53898264945705951) [(5, 3), (6, 1), (9, 2), (13, 1), (16, 1)],
  term ((74245600271068160 : Rat) / 53898264945705951) [(5, 3), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((148491200542136320 : Rat) / 5988696105078439) [(5, 3), (7, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-296982401084272640 : Rat) / 5988696105078439) [(5, 3), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-74245600271068160 : Rat) / 5988696105078439) [(5, 3), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((148491200542136320 : Rat) / 5988696105078439) [(5, 3), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((10403022895177344256 : Rat) / 29943480525392195) [(5, 3), (7, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-20806045790354688512 : Rat) / 29943480525392195) [(5, 3), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((18219332546331247232 : Rat) / 269491324728529755) [(5, 3), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-36438665092662494464 : Rat) / 269491324728529755) [(5, 3), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((113315924951282679296 : Rat) / 53898264945705951) [(5, 3), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-226631849902565358592 : Rat) / 53898264945705951) [(5, 3), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((5767772926478503424 : Rat) / 89830441576176585) [(5, 3), (8, 1), (9, 2), (13, 1), (16, 1)],
  term ((-11535545852957006848 : Rat) / 89830441576176585) [(5, 3), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-2055402032620518080 : Rat) / 53898264945705951) [(5, 3), (8, 1), (13, 1), (16, 1)],
  term ((4110804065241036160 : Rat) / 53898264945705951) [(5, 3), (8, 1), (15, 1), (16, 1)],
  term ((-999817620846561792 : Rat) / 29943480525392195) [(5, 3), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((1999635241693123584 : Rat) / 29943480525392195) [(5, 3), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-211821591221569757264 : Rat) / 269491324728529755) [(5, 3), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((423643182443139514528 : Rat) / 269491324728529755) [(5, 3), (9, 1), (15, 2), (16, 1)],
  term ((-13955310578987747200 : Rat) / 53898264945705951) [(5, 3), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((27910621157975494400 : Rat) / 53898264945705951) [(5, 3), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((237860916618752000 : Rat) / 17966088315235317) [(5, 3), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-475721833237504000 : Rat) / 17966088315235317) [(5, 3), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((-1176567251959158400 : Rat) / 17966088315235317) [(5, 3), (9, 2), (11, 1), (16, 1)],
  term ((4706269007836633600 : Rat) / 17966088315235317) [(5, 3), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((-9469679372517402368 : Rat) / 53898264945705951) [(5, 3), (9, 2), (13, 1), (16, 1)],
  term ((-2353134503918316800 : Rat) / 17966088315235317) [(5, 3), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((18939358745034804736 : Rat) / 53898264945705951) [(5, 3), (9, 2), (15, 1), (16, 1)],
  term ((-9412538015673267200 : Rat) / 17966088315235317) [(5, 3), (9, 2), (15, 3), (16, 1)],
  term ((136292076269537487872 : Rat) / 89830441576176585) [(5, 3), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((-272584152539074975744 : Rat) / 89830441576176585) [(5, 3), (9, 3), (15, 2), (16, 1)],
  term ((1897029392614988480 : Rat) / 53898264945705951) [(5, 3), (13, 1), (16, 1)],
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(5, 3), (15, 1), (16, 1)],
  term ((-4706269007836633600 : Rat) / 17966088315235317) [(5, 4), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((9412538015673267200 : Rat) / 17966088315235317) [(5, 4), (9, 2), (15, 2), (16, 1)],
  term (-2 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (1 : Rat) [(14, 1), (16, 1)],
  term (4 : Rat) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 10, terms 500 through 580. -/
theorem rs_R010_ueqv_R010YNN_block_10_0500_0580_valid :
    checkProductSumEq rs_R010_ueqv_R010YNN_partials_10_0500_0580
      rs_R010_ueqv_R010YNN_block_10_0500_0580 = true := by
  native_decide

end R010UeqvR010YNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
