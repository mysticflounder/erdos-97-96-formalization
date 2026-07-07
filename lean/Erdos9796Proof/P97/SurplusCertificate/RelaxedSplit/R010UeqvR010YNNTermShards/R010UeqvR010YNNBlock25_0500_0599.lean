/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010YNN, term block 25:500-599

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010YNNTermShards

/-- Generator polynomial 25 for relaxed split surplus certificate `R010:u=v:R010YNN`. -/
def rs_R010_ueqv_R010YNN_generator_25_0500_0599 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(12, 1)]
]

/-- Coefficient term 500 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0500 : Poly :=
[
  term ((-65618476060569600 : Rat) / 5988696105078439) [(1, 1), (5, 1), (7, 1), (9, 2), (11, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 500 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0500 : Poly :=
[
  term ((65618476060569600 : Rat) / 5988696105078439) [(1, 1), (5, 1), (7, 1), (9, 2), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-131236952121139200 : Rat) / 5988696105078439) [(1, 1), (5, 1), (7, 1), (9, 2), (11, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 500 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0500_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0500
        rs_R010_ueqv_R010YNN_generator_25_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_25_0500 := by
  native_decide

/-- Coefficient term 501 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0501 : Poly :=
[
  term ((65618476060569600 : Rat) / 5988696105078439) [(1, 1), (5, 1), (7, 1), (9, 2), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 501 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0501 : Poly :=
[
  term ((131236952121139200 : Rat) / 5988696105078439) [(1, 1), (5, 1), (7, 1), (9, 2), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-65618476060569600 : Rat) / 5988696105078439) [(1, 1), (5, 1), (7, 1), (9, 2), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 501 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0501_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0501
        rs_R010_ueqv_R010YNN_generator_25_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_25_0501 := by
  native_decide

/-- Coefficient term 502 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0502 : Poly :=
[
  term ((32809238030284800 : Rat) / 5988696105078439) [(1, 1), (5, 1), (7, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 502 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0502 : Poly :=
[
  term ((65618476060569600 : Rat) / 5988696105078439) [(1, 1), (5, 1), (7, 1), (9, 2), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-32809238030284800 : Rat) / 5988696105078439) [(1, 1), (5, 1), (7, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 502 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0502_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0502
        rs_R010_ueqv_R010YNN_generator_25_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_25_0502 := by
  native_decide

/-- Coefficient term 503 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0503 : Poly :=
[
  term ((-32809238030284800 : Rat) / 5988696105078439) [(1, 1), (5, 1), (7, 1), (9, 2), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 503 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0503 : Poly :=
[
  term ((-65618476060569600 : Rat) / 5988696105078439) [(1, 1), (5, 1), (7, 1), (9, 2), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((32809238030284800 : Rat) / 5988696105078439) [(1, 1), (5, 1), (7, 1), (9, 2), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 503 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0503_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0503
        rs_R010_ueqv_R010YNN_generator_25_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_25_0503 := by
  native_decide

/-- Coefficient term 504 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0504 : Poly :=
[
  term ((3158010038986700800 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (9, 2), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 504 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0504 : Poly :=
[
  term ((-3158010038986700800 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (9, 2), (12, 1), (15, 3), (16, 1)],
  term ((6316020077973401600 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (9, 2), (12, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 504 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0504_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0504
        rs_R010_ueqv_R010YNN_generator_25_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_25_0504 := by
  native_decide

/-- Coefficient term 505 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0505 : Poly :=
[
  term ((-3158010038986700800 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (9, 2), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 505 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0505 : Poly :=
[
  term ((-6316020077973401600 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (9, 2), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((3158010038986700800 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (9, 2), (13, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 505 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0505_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0505
        rs_R010_ueqv_R010YNN_generator_25_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_25_0505 := by
  native_decide

/-- Coefficient term 506 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0506 : Poly :=
[
  term ((-1579005019493350400 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (9, 2), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 506 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0506 : Poly :=
[
  term ((-3158010038986700800 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (9, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((1579005019493350400 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (9, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 506 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0506_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0506
        rs_R010_ueqv_R010YNN_generator_25_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_25_0506 := by
  native_decide

/-- Coefficient term 507 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0507 : Poly :=
[
  term ((1579005019493350400 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (9, 2), (15, 3), (16, 1)]
]

/-- Partial product 507 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0507 : Poly :=
[
  term ((3158010038986700800 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (9, 2), (12, 1), (15, 3), (16, 1)],
  term ((-1579005019493350400 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (9, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 507 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0507_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0507
        rs_R010_ueqv_R010YNN_generator_25_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_25_0507 := by
  native_decide

/-- Coefficient term 508 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0508 : Poly :=
[
  term ((-2101482817422786560 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (9, 3), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 508 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0508 : Poly :=
[
  term ((2101482817422786560 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (9, 3), (12, 1), (15, 2), (16, 1)],
  term ((-4202965634845573120 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (9, 3), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 508 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0508_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0508
        rs_R010_ueqv_R010YNN_generator_25_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_25_0508 := by
  native_decide

/-- Coefficient term 509 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0509 : Poly :=
[
  term ((2101482817422786560 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (9, 3), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 509 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0509 : Poly :=
[
  term ((4202965634845573120 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (9, 3), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2101482817422786560 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (9, 3), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 509 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0509_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0509
        rs_R010_ueqv_R010YNN_generator_25_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_25_0509 := by
  native_decide

/-- Coefficient term 510 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0510 : Poly :=
[
  term ((1050741408711393280 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (9, 3), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 510 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0510 : Poly :=
[
  term ((2101482817422786560 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (9, 3), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1050741408711393280 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (9, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 510 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0510_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0510
        rs_R010_ueqv_R010YNN_generator_25_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_25_0510 := by
  native_decide

/-- Coefficient term 511 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0511 : Poly :=
[
  term ((-1050741408711393280 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (9, 3), (15, 2), (16, 1)]
]

/-- Partial product 511 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0511 : Poly :=
[
  term ((-2101482817422786560 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (9, 3), (12, 1), (15, 2), (16, 1)],
  term ((1050741408711393280 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (9, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 511 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0511_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0511
        rs_R010_ueqv_R010YNN_generator_25_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_25_0511 := by
  native_decide

/-- Coefficient term 512 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0512 : Poly :=
[
  term ((-850488776525382208 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 512 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0512 : Poly :=
[
  term ((850488776525382208 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1700977553050764416 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 512 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0512_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0512
        rs_R010_ueqv_R010YNN_generator_25_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_25_0512 := by
  native_decide

/-- Coefficient term 513 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0513 : Poly :=
[
  term ((850488776525382208 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 513 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0513 : Poly :=
[
  term ((1700977553050764416 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-850488776525382208 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 513 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0513_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0513
        rs_R010_ueqv_R010YNN_generator_25_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_25_0513 := by
  native_decide

/-- Coefficient term 514 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0514 : Poly :=
[
  term ((425244388262691104 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (13, 1), (16, 1)]
]

/-- Partial product 514 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0514 : Poly :=
[
  term ((850488776525382208 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-425244388262691104 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 514 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0514_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0514
        rs_R010_ueqv_R010YNN_generator_25_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_25_0514 := by
  native_decide

/-- Coefficient term 515 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0515 : Poly :=
[
  term ((818204057025558338 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 515 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0515 : Poly :=
[
  term ((1636408114051116676 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-818204057025558338 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 515 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0515_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0515
        rs_R010_ueqv_R010YNN_generator_25_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_25_0515 := by
  native_decide

/-- Coefficient term 516 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0516 : Poly :=
[
  term ((15662397607167180800 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 516 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0516 : Poly :=
[
  term ((-15662397607167180800 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((31324795214334361600 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (9, 1), (11, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 516 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0516_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0516
        rs_R010_ueqv_R010YNN_generator_25_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_25_0516 := by
  native_decide

/-- Coefficient term 517 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0517 : Poly :=
[
  term ((-15662397607167180800 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 517 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0517 : Poly :=
[
  term ((-31324795214334361600 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((15662397607167180800 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 517 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0517_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0517
        rs_R010_ueqv_R010YNN_generator_25_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_25_0517 := by
  native_decide

/-- Coefficient term 518 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0518 : Poly :=
[
  term ((-7831198803583590400 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 518 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0518 : Poly :=
[
  term ((-15662397607167180800 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((7831198803583590400 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 518 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0518_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0518
        rs_R010_ueqv_R010YNN_generator_25_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_25_0518 := by
  native_decide

/-- Coefficient term 519 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0519 : Poly :=
[
  term ((7831198803583590400 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 519 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0519 : Poly :=
[
  term ((15662397607167180800 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-7831198803583590400 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 519 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0519_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0519
        rs_R010_ueqv_R010YNN_generator_25_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_25_0519 := by
  native_decide

/-- Coefficient term 520 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0520 : Poly :=
[
  term ((126015906195558400 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 520 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0520 : Poly :=
[
  term ((-126015906195558400 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((252031812391116800 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 520 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0520_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0520
        rs_R010_ueqv_R010YNN_generator_25_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_25_0520 := by
  native_decide

/-- Coefficient term 521 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0521 : Poly :=
[
  term ((1736905521442685440 : Rat) / 17966088315235317) [(1, 1), (5, 1), (8, 1), (9, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 521 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0521 : Poly :=
[
  term ((-1736905521442685440 : Rat) / 17966088315235317) [(1, 1), (5, 1), (8, 1), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((3473811042885370880 : Rat) / 17966088315235317) [(1, 1), (5, 1), (8, 1), (9, 1), (12, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 521 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0521_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0521
        rs_R010_ueqv_R010YNN_generator_25_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_25_0521 := by
  native_decide

/-- Coefficient term 522 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0522 : Poly :=
[
  term ((-1736905521442685440 : Rat) / 17966088315235317) [(1, 1), (5, 1), (8, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 522 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0522 : Poly :=
[
  term ((-3473811042885370880 : Rat) / 17966088315235317) [(1, 1), (5, 1), (8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1736905521442685440 : Rat) / 17966088315235317) [(1, 1), (5, 1), (8, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 522 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0522_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0522
        rs_R010_ueqv_R010YNN_generator_25_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_25_0522 := by
  native_decide

/-- Coefficient term 523 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0523 : Poly :=
[
  term ((-126015906195558400 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 523 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0523 : Poly :=
[
  term ((-252031812391116800 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((126015906195558400 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 523 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0523_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0523
        rs_R010_ueqv_R010YNN_generator_25_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_25_0523 := by
  native_decide

/-- Coefficient term 524 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0524 : Poly :=
[
  term ((-868452760721342720 : Rat) / 17966088315235317) [(1, 1), (5, 1), (8, 1), (9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 524 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0524 : Poly :=
[
  term ((-1736905521442685440 : Rat) / 17966088315235317) [(1, 1), (5, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((868452760721342720 : Rat) / 17966088315235317) [(1, 1), (5, 1), (8, 1), (9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 524 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0524_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0524
        rs_R010_ueqv_R010YNN_generator_25_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_25_0524 := by
  native_decide

/-- Coefficient term 525 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0525 : Poly :=
[
  term ((-63007953097779200 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 525 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0525 : Poly :=
[
  term ((-126015906195558400 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((63007953097779200 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 525 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0525_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0525
        rs_R010_ueqv_R010YNN_generator_25_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_25_0525 := by
  native_decide

/-- Coefficient term 526 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0526 : Poly :=
[
  term ((63007953097779200 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 526 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0526 : Poly :=
[
  term ((126015906195558400 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-63007953097779200 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 526 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0526_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0526
        rs_R010_ueqv_R010YNN_generator_25_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_25_0526 := by
  native_decide

/-- Coefficient term 527 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0527 : Poly :=
[
  term ((868452760721342720 : Rat) / 17966088315235317) [(1, 1), (5, 1), (8, 1), (9, 1), (15, 3), (16, 1)]
]

/-- Partial product 527 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0527 : Poly :=
[
  term ((1736905521442685440 : Rat) / 17966088315235317) [(1, 1), (5, 1), (8, 1), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((-868452760721342720 : Rat) / 17966088315235317) [(1, 1), (5, 1), (8, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 527 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0527_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0527
        rs_R010_ueqv_R010YNN_generator_25_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_25_0527 := by
  native_decide

/-- Coefficient term 528 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0528 : Poly :=
[
  term ((3479595011578613760 : Rat) / 5988696105078439) [(1, 1), (5, 1), (8, 1), (9, 2), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 528 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0528 : Poly :=
[
  term ((-3479595011578613760 : Rat) / 5988696105078439) [(1, 1), (5, 1), (8, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((6959190023157227520 : Rat) / 5988696105078439) [(1, 1), (5, 1), (8, 1), (9, 2), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 528 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0528_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0528
        rs_R010_ueqv_R010YNN_generator_25_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_25_0528 := by
  native_decide

/-- Coefficient term 529 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0529 : Poly :=
[
  term ((-3479595011578613760 : Rat) / 5988696105078439) [(1, 1), (5, 1), (8, 1), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 529 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0529 : Poly :=
[
  term ((-6959190023157227520 : Rat) / 5988696105078439) [(1, 1), (5, 1), (8, 1), (9, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3479595011578613760 : Rat) / 5988696105078439) [(1, 1), (5, 1), (8, 1), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 529 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0529_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0529
        rs_R010_ueqv_R010YNN_generator_25_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_25_0529 := by
  native_decide

/-- Coefficient term 530 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0530 : Poly :=
[
  term ((-1739797505789306880 : Rat) / 5988696105078439) [(1, 1), (5, 1), (8, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 530 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0530 : Poly :=
[
  term ((-3479595011578613760 : Rat) / 5988696105078439) [(1, 1), (5, 1), (8, 1), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1739797505789306880 : Rat) / 5988696105078439) [(1, 1), (5, 1), (8, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 530 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0530_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0530
        rs_R010_ueqv_R010YNN_generator_25_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_25_0530 := by
  native_decide

/-- Coefficient term 531 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0531 : Poly :=
[
  term ((1739797505789306880 : Rat) / 5988696105078439) [(1, 1), (5, 1), (8, 1), (9, 2), (15, 2), (16, 1)]
]

/-- Partial product 531 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0531 : Poly :=
[
  term ((3479595011578613760 : Rat) / 5988696105078439) [(1, 1), (5, 1), (8, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((-1739797505789306880 : Rat) / 5988696105078439) [(1, 1), (5, 1), (8, 1), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 531 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0531_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0531
        rs_R010_ueqv_R010YNN_generator_25_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_25_0531 := by
  native_decide

/-- Coefficient term 532 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0532 : Poly :=
[
  term ((253737326913280000 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 532 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0532 : Poly :=
[
  term ((-253737326913280000 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((507474653826560000 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 532 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0532_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0532
        rs_R010_ueqv_R010YNN_generator_25_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_25_0532 := by
  native_decide

/-- Coefficient term 533 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0533 : Poly :=
[
  term ((-253737326913280000 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 533 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0533 : Poly :=
[
  term ((-507474653826560000 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((253737326913280000 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 533 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0533_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0533
        rs_R010_ueqv_R010YNN_generator_25_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_25_0533 := by
  native_decide

/-- Coefficient term 534 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0534 : Poly :=
[
  term ((-126868663456640000 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 534 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0534 : Poly :=
[
  term ((-253737326913280000 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((126868663456640000 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 534 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0534_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0534
        rs_R010_ueqv_R010YNN_generator_25_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_25_0534 := by
  native_decide

/-- Coefficient term 535 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0535 : Poly :=
[
  term ((126868663456640000 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 535 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0535 : Poly :=
[
  term ((253737326913280000 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-126868663456640000 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 535 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0535_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0535
        rs_R010_ueqv_R010YNN_generator_25_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_25_0535 := by
  native_decide

/-- Coefficient term 536 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0536 : Poly :=
[
  term ((1816669710257900273696 : Rat) / 269491324728529755) [(1, 1), (5, 1), (8, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 536 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0536 : Poly :=
[
  term ((-1816669710257900273696 : Rat) / 269491324728529755) [(1, 1), (5, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((3633339420515800547392 : Rat) / 269491324728529755) [(1, 1), (5, 1), (8, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 536 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0536_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0536
        rs_R010_ueqv_R010YNN_generator_25_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_25_0536 := by
  native_decide

/-- Coefficient term 537 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0537 : Poly :=
[
  term ((-1816669710257900273696 : Rat) / 269491324728529755) [(1, 1), (5, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 537 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0537 : Poly :=
[
  term ((-3633339420515800547392 : Rat) / 269491324728529755) [(1, 1), (5, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1816669710257900273696 : Rat) / 269491324728529755) [(1, 1), (5, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 537 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0537_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0537
        rs_R010_ueqv_R010YNN_generator_25_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_25_0537 := by
  native_decide

/-- Coefficient term 538 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0538 : Poly :=
[
  term ((-908334855128950136848 : Rat) / 269491324728529755) [(1, 1), (5, 1), (8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 538 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0538 : Poly :=
[
  term ((-1816669710257900273696 : Rat) / 269491324728529755) [(1, 1), (5, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((908334855128950136848 : Rat) / 269491324728529755) [(1, 1), (5, 1), (8, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 538 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0538_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0538
        rs_R010_ueqv_R010YNN_generator_25_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_25_0538 := by
  native_decide

/-- Coefficient term 539 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0539 : Poly :=
[
  term ((-136497466662748768 : Rat) / 17966088315235317) [(1, 1), (5, 1), (8, 1), (14, 1), (16, 1)]
]

/-- Partial product 539 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0539 : Poly :=
[
  term ((-272994933325497536 : Rat) / 17966088315235317) [(1, 1), (5, 1), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((136497466662748768 : Rat) / 17966088315235317) [(1, 1), (5, 1), (8, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 539 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0539_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0539
        rs_R010_ueqv_R010YNN_generator_25_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_25_0539 := by
  native_decide

/-- Coefficient term 540 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0540 : Poly :=
[
  term ((908334855128950136848 : Rat) / 269491324728529755) [(1, 1), (5, 1), (8, 1), (15, 2), (16, 1)]
]

/-- Partial product 540 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0540 : Poly :=
[
  term ((1816669710257900273696 : Rat) / 269491324728529755) [(1, 1), (5, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-908334855128950136848 : Rat) / 269491324728529755) [(1, 1), (5, 1), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 540 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0540_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0540
        rs_R010_ueqv_R010YNN_generator_25_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_25_0540 := by
  native_decide

/-- Coefficient term 541 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0541 : Poly :=
[
  term ((-236250176543012752 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (16, 1)]
]

/-- Partial product 541 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0541 : Poly :=
[
  term ((-472500353086025504 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (12, 1), (16, 1)],
  term ((236250176543012752 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 541 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0541_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0541
        rs_R010_ueqv_R010YNN_generator_25_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_25_0541 := by
  native_decide

/-- Coefficient term 542 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0542 : Poly :=
[
  term ((-806046390195200 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 1), (10, 2), (11, 1), (16, 1)]
]

/-- Partial product 542 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0542 : Poly :=
[
  term ((-1612092780390400 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 1), (10, 2), (11, 1), (12, 1), (16, 1)],
  term ((806046390195200 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 1), (10, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 542 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0542_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0542
        rs_R010_ueqv_R010YNN_generator_25_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_25_0542 := by
  native_decide

/-- Coefficient term 543 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0543 : Poly :=
[
  term ((-12707547241150361600 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 543 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0543 : Poly :=
[
  term ((12707547241150361600 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-25415094482300723200 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 543 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0543_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0543
        rs_R010_ueqv_R010YNN_generator_25_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_25_0543 := by
  native_decide

/-- Coefficient term 544 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0544 : Poly :=
[
  term ((-146850305428198400 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 544 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0544 : Poly :=
[
  term ((146850305428198400 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-293700610856396800 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 1), (11, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 544 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0544_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0544
        rs_R010_ueqv_R010YNN_generator_25_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_25_0544 := by
  native_decide

/-- Coefficient term 545 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0545 : Poly :=
[
  term ((12707547241150361600 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 545 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0545 : Poly :=
[
  term ((25415094482300723200 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12707547241150361600 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 545 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0545_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0545
        rs_R010_ueqv_R010YNN_generator_25_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_25_0545 := by
  native_decide

/-- Coefficient term 546 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0546 : Poly :=
[
  term ((6353754591670528000 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 546 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0546 : Poly :=
[
  term ((12707509183341056000 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6353754591670528000 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 546 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0546_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0546
        rs_R010_ueqv_R010YNN_generator_25_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_25_0546 := by
  native_decide

/-- Coefficient term 547 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0547 : Poly :=
[
  term ((696706382368460800 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 547 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0547 : Poly :=
[
  term ((1393412764736921600 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-696706382368460800 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 547 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0547_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0547
        rs_R010_ueqv_R010YNN_generator_25_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_25_0547 := by
  native_decide

/-- Coefficient term 548 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0548 : Poly :=
[
  term ((-6344101063892838400 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 548 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0548 : Poly :=
[
  term ((-12688202127785676800 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((6344101063892838400 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 548 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0548_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0548
        rs_R010_ueqv_R010YNN_generator_25_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_25_0548 := by
  native_decide

/-- Coefficient term 549 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0549 : Poly :=
[
  term ((42423895550579200 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 549 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0549 : Poly :=
[
  term ((84847791101158400 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-42423895550579200 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 549 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0549_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0549
        rs_R010_ueqv_R010YNN_generator_25_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_25_0549 := by
  native_decide

/-- Coefficient term 550 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0550 : Poly :=
[
  term ((1612092780390400 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 550 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0550 : Poly :=
[
  term ((-1612092780390400 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((3224185560780800 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 2), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 550 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0550_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0550
        rs_R010_ueqv_R010YNN_generator_25_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_25_0550 := by
  native_decide

/-- Coefficient term 551 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0551 : Poly :=
[
  term ((-1612092780390400 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 551 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0551 : Poly :=
[
  term ((-3224185560780800 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((1612092780390400 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 551 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0551_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0551
        rs_R010_ueqv_R010YNN_generator_25_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_25_0551 := by
  native_decide

/-- Coefficient term 552 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0552 : Poly :=
[
  term ((-806046390195200 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 2), (13, 1), (16, 1)]
]

/-- Partial product 552 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0552 : Poly :=
[
  term ((-1612092780390400 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((806046390195200 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 552 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0552_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0552
        rs_R010_ueqv_R010YNN_generator_25_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_25_0552 := by
  native_decide

/-- Coefficient term 553 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0553 : Poly :=
[
  term ((-4030231950976000 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 553 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0553 : Poly :=
[
  term ((-8060463901952000 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((4030231950976000 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 553 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0553_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0553
        rs_R010_ueqv_R010YNN_generator_25_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_25_0553 := by
  native_decide

/-- Coefficient term 554 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0554 : Poly :=
[
  term ((-224094676890845600 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 554 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0554 : Poly :=
[
  term ((224094676890845600 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-448189353781691200 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 554 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0554_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0554
        rs_R010_ueqv_R010YNN_generator_25_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_25_0554 := by
  native_decide

/-- Coefficient term 555 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0555 : Poly :=
[
  term ((-4579114556530716160 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 555 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0555 : Poly :=
[
  term ((4579114556530716160 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((-9158229113061432320 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (12, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 555 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0555_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0555
        rs_R010_ueqv_R010YNN_generator_25_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_25_0555 := by
  native_decide

/-- Coefficient term 556 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0556 : Poly :=
[
  term ((4579114556530716160 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 556 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0556 : Poly :=
[
  term ((9158229113061432320 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4579114556530716160 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 556 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0556_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0556
        rs_R010_ueqv_R010YNN_generator_25_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_25_0556 := by
  native_decide

/-- Coefficient term 557 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0557 : Poly :=
[
  term ((-2887294661323520 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 557 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0557 : Poly :=
[
  term ((-5774589322647040 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((2887294661323520 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 557 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0557_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0557
        rs_R010_ueqv_R010YNN_generator_25_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_25_0557 := by
  native_decide

/-- Coefficient term 558 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0558 : Poly :=
[
  term ((2289557278265358080 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 558 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0558 : Poly :=
[
  term ((4579114556530716160 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2289557278265358080 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 558 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0558_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0558
        rs_R010_ueqv_R010YNN_generator_25_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_25_0558 := by
  native_decide

/-- Coefficient term 559 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0559 : Poly :=
[
  term ((-1443647330661760 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 559 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0559 : Poly :=
[
  term ((-2887294661323520 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((1443647330661760 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 559 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0559_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0559
        rs_R010_ueqv_R010YNN_generator_25_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_25_0559 := by
  native_decide

/-- Coefficient term 560 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0560 : Poly :=
[
  term ((128294157833834720 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 560 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0560 : Poly :=
[
  term ((256588315667669440 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-128294157833834720 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 560 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0560_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0560
        rs_R010_ueqv_R010YNN_generator_25_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_25_0560 := by
  native_decide

/-- Coefficient term 561 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0561 : Poly :=
[
  term ((522921448660377116264 : Rat) / 4042369870927946325) [(1, 1), (5, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 561 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0561 : Poly :=
[
  term ((1045842897320754232528 : Rat) / 4042369870927946325) [(1, 1), (5, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-522921448660377116264 : Rat) / 4042369870927946325) [(1, 1), (5, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 561 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0561_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0561
        rs_R010_ueqv_R010YNN_generator_25_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_25_0561 := by
  native_decide

/-- Coefficient term 562 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0562 : Poly :=
[
  term ((-2289557278265358080 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (15, 3), (16, 1)]
]

/-- Partial product 562 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0562 : Poly :=
[
  term ((-4579114556530716160 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((2289557278265358080 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 562 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0562_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0562
        rs_R010_ueqv_R010YNN_generator_25_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_25_0562 := by
  native_decide

/-- Coefficient term 563 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0563 : Poly :=
[
  term ((-1781269922826240 : Rat) / 5988696105078439) [(1, 1), (5, 1), (9, 2), (10, 2), (16, 1)]
]

/-- Partial product 563 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0563 : Poly :=
[
  term ((-3562539845652480 : Rat) / 5988696105078439) [(1, 1), (5, 1), (9, 2), (10, 2), (12, 1), (16, 1)],
  term ((1781269922826240 : Rat) / 5988696105078439) [(1, 1), (5, 1), (9, 2), (10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 563 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0563_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0563
        rs_R010_ueqv_R010YNN_generator_25_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_25_0563 := by
  native_decide

/-- Coefficient term 564 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0564 : Poly :=
[
  term ((1187513281884160 : Rat) / 5988696105078439) [(1, 1), (5, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 564 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0564 : Poly :=
[
  term ((-1187513281884160 : Rat) / 5988696105078439) [(1, 1), (5, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((2375026563768320 : Rat) / 5988696105078439) [(1, 1), (5, 1), (9, 2), (11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 564 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0564_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0564
        rs_R010_ueqv_R010YNN_generator_25_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_25_0564 := by
  native_decide

/-- Coefficient term 565 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0565 : Poly :=
[
  term ((-1187513281884160 : Rat) / 5988696105078439) [(1, 1), (5, 1), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 565 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0565 : Poly :=
[
  term ((-2375026563768320 : Rat) / 5988696105078439) [(1, 1), (5, 1), (9, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((1187513281884160 : Rat) / 5988696105078439) [(1, 1), (5, 1), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 565 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0565_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0565
        rs_R010_ueqv_R010YNN_generator_25_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_25_0565 := by
  native_decide

/-- Coefficient term 566 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0566 : Poly :=
[
  term ((-593756640942080 : Rat) / 5988696105078439) [(1, 1), (5, 1), (9, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 566 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0566 : Poly :=
[
  term ((-1187513281884160 : Rat) / 5988696105078439) [(1, 1), (5, 1), (9, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((593756640942080 : Rat) / 5988696105078439) [(1, 1), (5, 1), (9, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 566 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0566_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0566
        rs_R010_ueqv_R010YNN_generator_25_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_25_0566 := by
  native_decide

/-- Coefficient term 567 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0567 : Poly :=
[
  term ((-180608110862950400 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 567 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0567 : Poly :=
[
  term ((-361216221725900800 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((180608110862950400 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 567 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0567_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0567
        rs_R010_ueqv_R010YNN_generator_25_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_25_0567 := by
  native_decide

/-- Coefficient term 568 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0568 : Poly :=
[
  term ((-2450930499727680955328 : Rat) / 449152207880882925) [(1, 1), (5, 1), (9, 2), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 568 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0568 : Poly :=
[
  term ((2450930499727680955328 : Rat) / 449152207880882925) [(1, 1), (5, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((-4901860999455361910656 : Rat) / 449152207880882925) [(1, 1), (5, 1), (9, 2), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 568 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0568_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0568
        rs_R010_ueqv_R010YNN_generator_25_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_25_0568 := by
  native_decide

/-- Coefficient term 569 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0569 : Poly :=
[
  term ((-220929372159435520 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 2), (12, 1), (16, 1)]
]

/-- Partial product 569 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0569 : Poly :=
[
  term ((220929372159435520 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 2), (12, 1), (16, 1)],
  term ((-441858744318871040 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 2), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 569 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0569_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0569
        rs_R010_ueqv_R010YNN_generator_25_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_25_0569 := by
  native_decide

/-- Coefficient term 570 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0570 : Poly :=
[
  term ((2450930499727680955328 : Rat) / 449152207880882925) [(1, 1), (5, 1), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 570 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0570 : Poly :=
[
  term ((4901860999455361910656 : Rat) / 449152207880882925) [(1, 1), (5, 1), (9, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2450930499727680955328 : Rat) / 449152207880882925) [(1, 1), (5, 1), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 570 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0570_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0570
        rs_R010_ueqv_R010YNN_generator_25_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_25_0570 := by
  native_decide

/-- Coefficient term 571 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0571 : Poly :=
[
  term ((1225089569658141021664 : Rat) / 449152207880882925) [(1, 1), (5, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 571 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0571 : Poly :=
[
  term ((2450179139316282043328 : Rat) / 449152207880882925) [(1, 1), (5, 1), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1225089569658141021664 : Rat) / 449152207880882925) [(1, 1), (5, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 571 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0571_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0571
        rs_R010_ueqv_R010YNN_generator_25_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_25_0571 := by
  native_decide

/-- Coefficient term 572 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0572 : Poly :=
[
  term ((362976707660430080 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 2), (14, 1), (16, 1)]
]

/-- Partial product 572 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0572 : Poly :=
[
  term ((725953415320860160 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 2), (12, 1), (14, 1), (16, 1)],
  term ((-362976707660430080 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 572 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0572_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0572
        rs_R010_ueqv_R010YNN_generator_25_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_25_0572 := by
  native_decide

/-- Coefficient term 573 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0573 : Poly :=
[
  term ((-1224930868886992605664 : Rat) / 449152207880882925) [(1, 1), (5, 1), (9, 2), (15, 2), (16, 1)]
]

/-- Partial product 573 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0573 : Poly :=
[
  term ((-2449861737773985211328 : Rat) / 449152207880882925) [(1, 1), (5, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((1224930868886992605664 : Rat) / 449152207880882925) [(1, 1), (5, 1), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 573 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0573_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0573
        rs_R010_ueqv_R010YNN_generator_25_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_25_0573 := by
  native_decide

/-- Coefficient term 574 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0574 : Poly :=
[
  term ((65679857982018560 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 2), (16, 1)]
]

/-- Partial product 574 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0574 : Poly :=
[
  term ((131359715964037120 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 2), (12, 1), (16, 1)],
  term ((-65679857982018560 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 574 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0574_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0574
        rs_R010_ueqv_R010YNN_generator_25_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_25_0574 := by
  native_decide

/-- Coefficient term 575 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0575 : Poly :=
[
  term ((254207685414502400 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 3), (11, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 575 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0575 : Poly :=
[
  term ((-254207685414502400 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 3), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((508415370829004800 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 3), (11, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 575 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0575_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0575
        rs_R010_ueqv_R010YNN_generator_25_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_25_0575 := by
  native_decide

/-- Coefficient term 576 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0576 : Poly :=
[
  term ((-254207685414502400 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 3), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 576 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0576 : Poly :=
[
  term ((-508415370829004800 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 3), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((254207685414502400 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 3), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 576 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0576_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0576
        rs_R010_ueqv_R010YNN_generator_25_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_25_0576 := by
  native_decide

/-- Coefficient term 577 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0577 : Poly :=
[
  term ((-127103842707251200 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 3), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 577 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0577 : Poly :=
[
  term ((-254207685414502400 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 3), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((127103842707251200 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 3), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 577 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0577_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0577
        rs_R010_ueqv_R010YNN_generator_25_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_25_0577 := by
  native_decide

/-- Coefficient term 578 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0578 : Poly :=
[
  term ((127103842707251200 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 3), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 578 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0578 : Poly :=
[
  term ((254207685414502400 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 3), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-127103842707251200 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 3), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 578 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0578_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0578
        rs_R010_ueqv_R010YNN_generator_25_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_25_0578 := by
  native_decide

/-- Coefficient term 579 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0579 : Poly :=
[
  term ((508414149220311040 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 3), (15, 1), (16, 1)]
]

/-- Partial product 579 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0579 : Poly :=
[
  term ((1016828298440622080 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 3), (12, 1), (15, 1), (16, 1)],
  term ((-508414149220311040 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 579 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0579_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0579
        rs_R010_ueqv_R010YNN_generator_25_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_25_0579 := by
  native_decide

/-- Coefficient term 580 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0580 : Poly :=
[
  term ((-2871455259507752960 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 4), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 580 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0580 : Poly :=
[
  term ((2871455259507752960 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 4), (12, 1), (15, 2), (16, 1)],
  term ((-5742910519015505920 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 4), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 580 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0580_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0580
        rs_R010_ueqv_R010YNN_generator_25_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_25_0580 := by
  native_decide

/-- Coefficient term 581 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0581 : Poly :=
[
  term ((2871455259507752960 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 4), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 581 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0581 : Poly :=
[
  term ((5742910519015505920 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 4), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2871455259507752960 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 4), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 581 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0581_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0581
        rs_R010_ueqv_R010YNN_generator_25_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_25_0581 := by
  native_decide

/-- Coefficient term 582 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0582 : Poly :=
[
  term ((1435727629753876480 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 4), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 582 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0582 : Poly :=
[
  term ((2871455259507752960 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 4), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1435727629753876480 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 4), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 582 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0582_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0582
        rs_R010_ueqv_R010YNN_generator_25_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_25_0582 := by
  native_decide

/-- Coefficient term 583 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0583 : Poly :=
[
  term ((-1435727629753876480 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 4), (15, 2), (16, 1)]
]

/-- Partial product 583 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0583 : Poly :=
[
  term ((-2871455259507752960 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 4), (12, 1), (15, 2), (16, 1)],
  term ((1435727629753876480 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 4), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 583 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0583_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0583
        rs_R010_ueqv_R010YNN_generator_25_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_25_0583 := by
  native_decide

/-- Coefficient term 584 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0584 : Poly :=
[
  term ((195893711407505972 : Rat) / 53898264945705951) [(1, 1), (5, 1), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 584 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0584 : Poly :=
[
  term ((391787422815011944 : Rat) / 53898264945705951) [(1, 1), (5, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-195893711407505972 : Rat) / 53898264945705951) [(1, 1), (5, 1), (10, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 584 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0584_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0584
        rs_R010_ueqv_R010YNN_generator_25_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_25_0584 := by
  native_decide

/-- Coefficient term 585 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0585 : Poly :=
[
  term ((487455068154207920 : Rat) / 17966088315235317) [(1, 1), (5, 1), (10, 1), (16, 1)]
]

/-- Partial product 585 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0585 : Poly :=
[
  term ((974910136308415840 : Rat) / 17966088315235317) [(1, 1), (5, 1), (10, 1), (12, 1), (16, 1)],
  term ((-487455068154207920 : Rat) / 17966088315235317) [(1, 1), (5, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 585 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0585_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0585
        rs_R010_ueqv_R010YNN_generator_25_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_25_0585 := by
  native_decide

/-- Coefficient term 586 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0586 : Poly :=
[
  term ((9553869429845543788 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (10, 2), (16, 1)]
]

/-- Partial product 586 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0586 : Poly :=
[
  term ((19107738859691087576 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (10, 2), (12, 1), (16, 1)],
  term ((-9553869429845543788 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 586 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0586_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0586
        rs_R010_ueqv_R010YNN_generator_25_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_25_0586 := by
  native_decide

/-- Coefficient term 587 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0587 : Poly :=
[
  term ((-183260484130124934392 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 587 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0587 : Poly :=
[
  term ((183260484130124934392 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-366520968260249868784 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 587 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0587_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0587
        rs_R010_ueqv_R010YNN_generator_25_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_25_0587 := by
  native_decide

/-- Coefficient term 588 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0588 : Poly :=
[
  term ((183260484130124934392 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 588 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0588 : Poly :=
[
  term ((366520968260249868784 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-183260484130124934392 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 588 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0588_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0588
        rs_R010_ueqv_R010YNN_generator_25_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_25_0588 := by
  native_decide

/-- Coefficient term 589 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0589 : Poly :=
[
  term ((91630242065062467196 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 589 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0589 : Poly :=
[
  term ((183260484130124934392 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-91630242065062467196 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 589 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0589_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0589
        rs_R010_ueqv_R010YNN_generator_25_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_25_0589 := by
  native_decide

/-- Coefficient term 590 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0590 : Poly :=
[
  term ((9314552704128024076 : Rat) / 269491324728529755) [(1, 1), (5, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 590 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0590 : Poly :=
[
  term ((18629105408256048152 : Rat) / 269491324728529755) [(1, 1), (5, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-9314552704128024076 : Rat) / 269491324728529755) [(1, 1), (5, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 590 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0590_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0590
        rs_R010_ueqv_R010YNN_generator_25_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_25_0590 := by
  native_decide

/-- Coefficient term 591 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0591 : Poly :=
[
  term ((-1897029392614988480 : Rat) / 53898264945705951) [(1, 1), (5, 1), (11, 2), (16, 1)]
]

/-- Partial product 591 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0591 : Poly :=
[
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(1, 1), (5, 1), (11, 2), (12, 1), (16, 1)],
  term ((1897029392614988480 : Rat) / 53898264945705951) [(1, 1), (5, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 591 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0591_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0591
        rs_R010_ueqv_R010YNN_generator_25_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_25_0591 := by
  native_decide

/-- Coefficient term 592 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0592 : Poly :=
[
  term ((-3433297989323555725064 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 592 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0592 : Poly :=
[
  term ((3433297989323555725064 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (12, 1), (15, 2), (16, 1)],
  term ((-6866595978647111450128 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 592 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0592_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0592
        rs_R010_ueqv_R010YNN_generator_25_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_25_0592 := by
  native_decide

/-- Coefficient term 593 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0593 : Poly :=
[
  term ((-12937618806001584623 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (12, 1), (16, 1)]
]

/-- Partial product 593 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0593 : Poly :=
[
  term ((12937618806001584623 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (12, 1), (16, 1)],
  term ((-25875237612003169246 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 593 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0593_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0593
        rs_R010_ueqv_R010YNN_generator_25_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_25_0593 := by
  native_decide

/-- Coefficient term 594 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0594 : Poly :=
[
  term ((3433297989323555725064 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 594 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0594 : Poly :=
[
  term ((6866595978647111450128 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3433297989323555725064 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 594 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0594_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0594
        rs_R010_ueqv_R010YNN_generator_25_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_25_0594 := by
  native_decide

/-- Coefficient term 595 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0595 : Poly :=
[
  term ((1639774503533655504644 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 595 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0595 : Poly :=
[
  term ((3279549007067311009288 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1639774503533655504644 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 595 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0595_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0595
        rs_R010_ueqv_R010YNN_generator_25_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_25_0595 := by
  native_decide

/-- Coefficient term 596 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0596 : Poly :=
[
  term ((5005786849403194207 : Rat) / 269491324728529755) [(1, 1), (5, 1), (14, 1), (16, 1)]
]

/-- Partial product 596 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0596 : Poly :=
[
  term ((10011573698806388414 : Rat) / 269491324728529755) [(1, 1), (5, 1), (12, 1), (14, 1), (16, 1)],
  term ((-5005786849403194207 : Rat) / 269491324728529755) [(1, 1), (5, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 596 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0596_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0596
        rs_R010_ueqv_R010YNN_generator_25_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_25_0596 := by
  native_decide

/-- Coefficient term 597 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0597 : Poly :=
[
  term ((-487455068154207920 : Rat) / 17966088315235317) [(1, 1), (5, 1), (14, 2), (16, 1)]
]

/-- Partial product 597 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0597 : Poly :=
[
  term ((-974910136308415840 : Rat) / 17966088315235317) [(1, 1), (5, 1), (12, 1), (14, 2), (16, 1)],
  term ((487455068154207920 : Rat) / 17966088315235317) [(1, 1), (5, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 597 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0597_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0597
        rs_R010_ueqv_R010YNN_generator_25_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_25_0597 := by
  native_decide

/-- Coefficient term 598 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0598 : Poly :=
[
  term ((-1754864472381160037684 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (15, 2), (16, 1)]
]

/-- Partial product 598 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0598 : Poly :=
[
  term ((-3509728944762320075368 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (12, 1), (15, 2), (16, 1)],
  term ((1754864472381160037684 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 598 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0598_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0598
        rs_R010_ueqv_R010YNN_generator_25_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_25_0598 := by
  native_decide

/-- Coefficient term 599 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0599 : Poly :=
[
  term ((-11602576052936772298 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (16, 1)]
]

/-- Partial product 599 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0599 : Poly :=
[
  term ((-23205152105873544596 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (12, 1), (16, 1)],
  term ((11602576052936772298 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 599 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0599_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0599
        rs_R010_ueqv_R010YNN_generator_25_0500_0599 =
      rs_R010_ueqv_R010YNN_partial_25_0599 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010YNN_partials_25_0500_0599 : List Poly :=
[
  rs_R010_ueqv_R010YNN_partial_25_0500,
  rs_R010_ueqv_R010YNN_partial_25_0501,
  rs_R010_ueqv_R010YNN_partial_25_0502,
  rs_R010_ueqv_R010YNN_partial_25_0503,
  rs_R010_ueqv_R010YNN_partial_25_0504,
  rs_R010_ueqv_R010YNN_partial_25_0505,
  rs_R010_ueqv_R010YNN_partial_25_0506,
  rs_R010_ueqv_R010YNN_partial_25_0507,
  rs_R010_ueqv_R010YNN_partial_25_0508,
  rs_R010_ueqv_R010YNN_partial_25_0509,
  rs_R010_ueqv_R010YNN_partial_25_0510,
  rs_R010_ueqv_R010YNN_partial_25_0511,
  rs_R010_ueqv_R010YNN_partial_25_0512,
  rs_R010_ueqv_R010YNN_partial_25_0513,
  rs_R010_ueqv_R010YNN_partial_25_0514,
  rs_R010_ueqv_R010YNN_partial_25_0515,
  rs_R010_ueqv_R010YNN_partial_25_0516,
  rs_R010_ueqv_R010YNN_partial_25_0517,
  rs_R010_ueqv_R010YNN_partial_25_0518,
  rs_R010_ueqv_R010YNN_partial_25_0519,
  rs_R010_ueqv_R010YNN_partial_25_0520,
  rs_R010_ueqv_R010YNN_partial_25_0521,
  rs_R010_ueqv_R010YNN_partial_25_0522,
  rs_R010_ueqv_R010YNN_partial_25_0523,
  rs_R010_ueqv_R010YNN_partial_25_0524,
  rs_R010_ueqv_R010YNN_partial_25_0525,
  rs_R010_ueqv_R010YNN_partial_25_0526,
  rs_R010_ueqv_R010YNN_partial_25_0527,
  rs_R010_ueqv_R010YNN_partial_25_0528,
  rs_R010_ueqv_R010YNN_partial_25_0529,
  rs_R010_ueqv_R010YNN_partial_25_0530,
  rs_R010_ueqv_R010YNN_partial_25_0531,
  rs_R010_ueqv_R010YNN_partial_25_0532,
  rs_R010_ueqv_R010YNN_partial_25_0533,
  rs_R010_ueqv_R010YNN_partial_25_0534,
  rs_R010_ueqv_R010YNN_partial_25_0535,
  rs_R010_ueqv_R010YNN_partial_25_0536,
  rs_R010_ueqv_R010YNN_partial_25_0537,
  rs_R010_ueqv_R010YNN_partial_25_0538,
  rs_R010_ueqv_R010YNN_partial_25_0539,
  rs_R010_ueqv_R010YNN_partial_25_0540,
  rs_R010_ueqv_R010YNN_partial_25_0541,
  rs_R010_ueqv_R010YNN_partial_25_0542,
  rs_R010_ueqv_R010YNN_partial_25_0543,
  rs_R010_ueqv_R010YNN_partial_25_0544,
  rs_R010_ueqv_R010YNN_partial_25_0545,
  rs_R010_ueqv_R010YNN_partial_25_0546,
  rs_R010_ueqv_R010YNN_partial_25_0547,
  rs_R010_ueqv_R010YNN_partial_25_0548,
  rs_R010_ueqv_R010YNN_partial_25_0549,
  rs_R010_ueqv_R010YNN_partial_25_0550,
  rs_R010_ueqv_R010YNN_partial_25_0551,
  rs_R010_ueqv_R010YNN_partial_25_0552,
  rs_R010_ueqv_R010YNN_partial_25_0553,
  rs_R010_ueqv_R010YNN_partial_25_0554,
  rs_R010_ueqv_R010YNN_partial_25_0555,
  rs_R010_ueqv_R010YNN_partial_25_0556,
  rs_R010_ueqv_R010YNN_partial_25_0557,
  rs_R010_ueqv_R010YNN_partial_25_0558,
  rs_R010_ueqv_R010YNN_partial_25_0559,
  rs_R010_ueqv_R010YNN_partial_25_0560,
  rs_R010_ueqv_R010YNN_partial_25_0561,
  rs_R010_ueqv_R010YNN_partial_25_0562,
  rs_R010_ueqv_R010YNN_partial_25_0563,
  rs_R010_ueqv_R010YNN_partial_25_0564,
  rs_R010_ueqv_R010YNN_partial_25_0565,
  rs_R010_ueqv_R010YNN_partial_25_0566,
  rs_R010_ueqv_R010YNN_partial_25_0567,
  rs_R010_ueqv_R010YNN_partial_25_0568,
  rs_R010_ueqv_R010YNN_partial_25_0569,
  rs_R010_ueqv_R010YNN_partial_25_0570,
  rs_R010_ueqv_R010YNN_partial_25_0571,
  rs_R010_ueqv_R010YNN_partial_25_0572,
  rs_R010_ueqv_R010YNN_partial_25_0573,
  rs_R010_ueqv_R010YNN_partial_25_0574,
  rs_R010_ueqv_R010YNN_partial_25_0575,
  rs_R010_ueqv_R010YNN_partial_25_0576,
  rs_R010_ueqv_R010YNN_partial_25_0577,
  rs_R010_ueqv_R010YNN_partial_25_0578,
  rs_R010_ueqv_R010YNN_partial_25_0579,
  rs_R010_ueqv_R010YNN_partial_25_0580,
  rs_R010_ueqv_R010YNN_partial_25_0581,
  rs_R010_ueqv_R010YNN_partial_25_0582,
  rs_R010_ueqv_R010YNN_partial_25_0583,
  rs_R010_ueqv_R010YNN_partial_25_0584,
  rs_R010_ueqv_R010YNN_partial_25_0585,
  rs_R010_ueqv_R010YNN_partial_25_0586,
  rs_R010_ueqv_R010YNN_partial_25_0587,
  rs_R010_ueqv_R010YNN_partial_25_0588,
  rs_R010_ueqv_R010YNN_partial_25_0589,
  rs_R010_ueqv_R010YNN_partial_25_0590,
  rs_R010_ueqv_R010YNN_partial_25_0591,
  rs_R010_ueqv_R010YNN_partial_25_0592,
  rs_R010_ueqv_R010YNN_partial_25_0593,
  rs_R010_ueqv_R010YNN_partial_25_0594,
  rs_R010_ueqv_R010YNN_partial_25_0595,
  rs_R010_ueqv_R010YNN_partial_25_0596,
  rs_R010_ueqv_R010YNN_partial_25_0597,
  rs_R010_ueqv_R010YNN_partial_25_0598,
  rs_R010_ueqv_R010YNN_partial_25_0599
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010YNN_block_25_0500_0599 : Poly :=
[
  term ((131236952121139200 : Rat) / 5988696105078439) [(1, 1), (5, 1), (7, 1), (9, 2), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((65618476060569600 : Rat) / 5988696105078439) [(1, 1), (5, 1), (7, 1), (9, 2), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-131236952121139200 : Rat) / 5988696105078439) [(1, 1), (5, 1), (7, 1), (9, 2), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((-65618476060569600 : Rat) / 5988696105078439) [(1, 1), (5, 1), (7, 1), (9, 2), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-32809238030284800 : Rat) / 5988696105078439) [(1, 1), (5, 1), (7, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((32809238030284800 : Rat) / 5988696105078439) [(1, 1), (5, 1), (7, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((-6316020077973401600 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (9, 2), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3158010038986700800 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (9, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((6316020077973401600 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (9, 2), (12, 2), (15, 3), (16, 1)],
  term ((3158010038986700800 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (9, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1579005019493350400 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((-1579005019493350400 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (9, 2), (15, 3), (16, 1)],
  term ((4202965634845573120 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (9, 3), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2101482817422786560 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (9, 3), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4202965634845573120 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (9, 3), (12, 2), (15, 2), (16, 1)],
  term ((-2101482817422786560 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (9, 3), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1050741408711393280 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((1050741408711393280 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (9, 3), (15, 2), (16, 1)],
  term ((1700977553050764416 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((850488776525382208 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((2486896890576498884 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1700977553050764416 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-850488776525382208 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-425244388262691104 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((-818204057025558338 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-31324795214334361600 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-15662397607167180800 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((31324795214334361600 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (9, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((15662397607167180800 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((7831198803583590400 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-7831198803583590400 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-3473811042885370880 : Rat) / 17966088315235317) [(1, 1), (5, 1), (8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-252031812391116800 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1736905521442685440 : Rat) / 17966088315235317) [(1, 1), (5, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-126015906195558400 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((252031812391116800 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((3473811042885370880 : Rat) / 17966088315235317) [(1, 1), (5, 1), (8, 1), (9, 1), (12, 2), (15, 3), (16, 1)],
  term ((1736905521442685440 : Rat) / 17966088315235317) [(1, 1), (5, 1), (8, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((126015906195558400 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((868452760721342720 : Rat) / 17966088315235317) [(1, 1), (5, 1), (8, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((63007953097779200 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-63007953097779200 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-868452760721342720 : Rat) / 17966088315235317) [(1, 1), (5, 1), (8, 1), (9, 1), (15, 3), (16, 1)],
  term ((-6959190023157227520 : Rat) / 5988696105078439) [(1, 1), (5, 1), (8, 1), (9, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3479595011578613760 : Rat) / 5988696105078439) [(1, 1), (5, 1), (8, 1), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((6959190023157227520 : Rat) / 5988696105078439) [(1, 1), (5, 1), (8, 1), (9, 2), (12, 2), (15, 2), (16, 1)],
  term ((3479595011578613760 : Rat) / 5988696105078439) [(1, 1), (5, 1), (8, 1), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1739797505789306880 : Rat) / 5988696105078439) [(1, 1), (5, 1), (8, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1739797505789306880 : Rat) / 5988696105078439) [(1, 1), (5, 1), (8, 1), (9, 2), (15, 2), (16, 1)],
  term ((-507474653826560000 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-253737326913280000 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((507474653826560000 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((253737326913280000 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((126868663456640000 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-126868663456640000 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3633339420515800547392 : Rat) / 269491324728529755) [(1, 1), (5, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1816669710257900273696 : Rat) / 269491324728529755) [(1, 1), (5, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-272994933325497536 : Rat) / 17966088315235317) [(1, 1), (5, 1), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((-472500353086025504 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (12, 1), (16, 1)],
  term ((3633339420515800547392 : Rat) / 269491324728529755) [(1, 1), (5, 1), (8, 1), (12, 2), (15, 2), (16, 1)],
  term ((1816669710257900273696 : Rat) / 269491324728529755) [(1, 1), (5, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((908334855128950136848 : Rat) / 269491324728529755) [(1, 1), (5, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((136497466662748768 : Rat) / 17966088315235317) [(1, 1), (5, 1), (8, 1), (14, 1), (16, 1)],
  term ((-908334855128950136848 : Rat) / 269491324728529755) [(1, 1), (5, 1), (8, 1), (15, 2), (16, 1)],
  term ((236250176543012752 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (16, 1)],
  term ((-1612092780390400 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 1), (10, 2), (11, 1), (12, 1), (16, 1)],
  term ((806046390195200 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 1), (10, 2), (11, 1), (16, 1)],
  term ((25415094482300723200 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((12707509183341056000 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1393412764736921600 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((6448371121561600 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((231698096529356800 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-25415094482300723200 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((-293700610856396800 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((-12707547241150361600 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6353754591670528000 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-696706382368460800 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((6344101063892838400 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-42423895550579200 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((-3224185560780800 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1612092780390400 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((-3224185560780800 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((3224185560780800 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 2), (12, 2), (15, 1), (16, 1)],
  term ((1612092780390400 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((806046390195200 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((4030231950976000 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((9158229113061432320 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-5774589322647040 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((4579114556530716160 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2887294661323520 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((256588315667669440 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1062649998087567652528 : Rat) / 4042369870927946325) [(1, 1), (5, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-448189353781691200 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-9158229113061432320 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (12, 2), (15, 3), (16, 1)],
  term ((-4579114556530716160 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((2887294661323520 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2289557278265358080 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((1443647330661760 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (13, 1), (16, 1)],
  term ((-128294157833834720 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-522921448660377116264 : Rat) / 4042369870927946325) [(1, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((2289557278265358080 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (15, 3), (16, 1)],
  term ((-3562539845652480 : Rat) / 5988696105078439) [(1, 1), (5, 1), (9, 2), (10, 2), (12, 1), (16, 1)],
  term ((1781269922826240 : Rat) / 5988696105078439) [(1, 1), (5, 1), (9, 2), (10, 2), (16, 1)],
  term ((-2375026563768320 : Rat) / 5988696105078439) [(1, 1), (5, 1), (9, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1187513281884160 : Rat) / 5988696105078439) [(1, 1), (5, 1), (9, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-371903841262858240 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((2375026563768320 : Rat) / 5988696105078439) [(1, 1), (5, 1), (9, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((1187513281884160 : Rat) / 5988696105078439) [(1, 1), (5, 1), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((593756640942080 : Rat) / 5988696105078439) [(1, 1), (5, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((180608110862950400 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((4901860999455361910656 : Rat) / 449152207880882925) [(1, 1), (5, 1), (9, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2450179139316282043328 : Rat) / 449152207880882925) [(1, 1), (5, 1), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((725953415320860160 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 2), (12, 1), (14, 1), (16, 1)],
  term ((14250159382609920 : Rat) / 5988696105078439) [(1, 1), (5, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((352289088123472640 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 2), (12, 1), (16, 1)],
  term ((-4901860999455361910656 : Rat) / 449152207880882925) [(1, 1), (5, 1), (9, 2), (12, 2), (15, 2), (16, 1)],
  term ((-441858744318871040 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 2), (12, 2), (16, 1)],
  term ((-2450930499727680955328 : Rat) / 449152207880882925) [(1, 1), (5, 1), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1225089569658141021664 : Rat) / 449152207880882925) [(1, 1), (5, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-362976707660430080 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 2), (14, 1), (16, 1)],
  term ((1224930868886992605664 : Rat) / 449152207880882925) [(1, 1), (5, 1), (9, 2), (15, 2), (16, 1)],
  term ((-65679857982018560 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 2), (16, 1)],
  term ((-508415370829004800 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 3), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-254207685414502400 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 3), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((508415370829004800 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 3), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((254207685414502400 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 3), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((127103842707251200 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 3), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-127103842707251200 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 3), (11, 1), (15, 2), (16, 1)],
  term ((1016828298440622080 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 3), (12, 1), (15, 1), (16, 1)],
  term ((-508414149220311040 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 3), (15, 1), (16, 1)],
  term ((5742910519015505920 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 4), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2871455259507752960 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 4), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5742910519015505920 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 4), (12, 2), (15, 2), (16, 1)],
  term ((-2871455259507752960 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 4), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1435727629753876480 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 4), (13, 1), (15, 1), (16, 1)],
  term ((1435727629753876480 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 4), (15, 2), (16, 1)],
  term ((391787422815011944 : Rat) / 53898264945705951) [(1, 1), (5, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((974910136308415840 : Rat) / 17966088315235317) [(1, 1), (5, 1), (10, 1), (12, 1), (16, 1)],
  term ((-195893711407505972 : Rat) / 53898264945705951) [(1, 1), (5, 1), (10, 1), (14, 1), (16, 1)],
  term ((-487455068154207920 : Rat) / 17966088315235317) [(1, 1), (5, 1), (10, 1), (16, 1)],
  term ((19107738859691087576 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (10, 2), (12, 1), (16, 1)],
  term ((-9553869429845543788 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (10, 2), (16, 1)],
  term ((366520968260249868784 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((183260484130124934392 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((92135337057135058384 : Rat) / 449152207880882925) [(1, 1), (5, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-366520968260249868784 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-183260484130124934392 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-91630242065062467196 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((-9314552704128024076 : Rat) / 269491324728529755) [(1, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(1, 1), (5, 1), (11, 2), (12, 1), (16, 1)],
  term ((1897029392614988480 : Rat) / 53898264945705951) [(1, 1), (5, 1), (11, 2), (16, 1)],
  term ((6866595978647111450128 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3279549007067311009288 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((10011573698806388414 : Rat) / 269491324728529755) [(1, 1), (5, 1), (12, 1), (14, 1), (16, 1)],
  term ((-974910136308415840 : Rat) / 17966088315235317) [(1, 1), (5, 1), (12, 1), (14, 2), (16, 1)],
  term ((-76430955438764350304 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (12, 1), (15, 2), (16, 1)],
  term ((-3422511099957319991 : Rat) / 449152207880882925) [(1, 1), (5, 1), (12, 1), (16, 1)],
  term ((-6866595978647111450128 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (12, 2), (15, 2), (16, 1)],
  term ((-25875237612003169246 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (12, 2), (16, 1)],
  term ((-3433297989323555725064 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1639774503533655504644 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5005786849403194207 : Rat) / 269491324728529755) [(1, 1), (5, 1), (14, 1), (16, 1)],
  term ((487455068154207920 : Rat) / 17966088315235317) [(1, 1), (5, 1), (14, 2), (16, 1)],
  term ((1754864472381160037684 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (15, 2), (16, 1)],
  term ((11602576052936772298 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 25, terms 500 through 599. -/
theorem rs_R010_ueqv_R010YNN_block_25_0500_0599_valid :
    checkProductSumEq rs_R010_ueqv_R010YNN_partials_25_0500_0599
      rs_R010_ueqv_R010YNN_block_25_0500_0599 = true := by
  native_decide

end R010UeqvR010YNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
