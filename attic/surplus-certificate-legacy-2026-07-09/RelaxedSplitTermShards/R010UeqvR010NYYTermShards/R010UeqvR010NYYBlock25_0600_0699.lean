/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010NYY, term block 25:600-699

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010NYYTermShards

/-- Generator polynomial 25 for relaxed split surplus certificate `R010:u=v:R010NYY`. -/
def rs_R010_ueqv_R010NYY_generator_25_0600_0699 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(12, 1)]
]

/-- Coefficient term 600 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0600 : Poly :=
[
  term ((1513755712459811187 : Rat) / 131617718934853928) [(2, 1), (5, 1), (8, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 600 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0600 : Poly :=
[
  term ((1513755712459811187 : Rat) / 65808859467426964) [(2, 1), (5, 1), (8, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1513755712459811187 : Rat) / 131617718934853928) [(2, 1), (5, 1), (8, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 600 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0600_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0600
        rs_R010_ueqv_R010NYY_generator_25_0600_0699 =
      rs_R010_ueqv_R010NYY_partial_25_0600 := by
  native_decide

/-- Coefficient term 601 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0601 : Poly :=
[
  term ((-1513755712459811187 : Rat) / 65808859467426964) [(2, 1), (5, 1), (8, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 601 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0601 : Poly :=
[
  term ((-1513755712459811187 : Rat) / 32904429733713482) [(2, 1), (5, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((1513755712459811187 : Rat) / 65808859467426964) [(2, 1), (5, 1), (8, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 601 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0601_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0601
        rs_R010_ueqv_R010NYY_generator_25_0600_0699 =
      rs_R010_ueqv_R010NYY_partial_25_0601 := by
  native_decide

/-- Coefficient term 602 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0602 : Poly :=
[
  term ((-139024487857003943013 : Rat) / 16847068023661302784) [(2, 1), (5, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 602 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0602 : Poly :=
[
  term ((-139024487857003943013 : Rat) / 8423534011830651392) [(2, 1), (5, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((139024487857003943013 : Rat) / 16847068023661302784) [(2, 1), (5, 1), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 602 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0602_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0602
        rs_R010_ueqv_R010NYY_generator_25_0600_0699 =
      rs_R010_ueqv_R010NYY_partial_25_0602 := by
  native_decide

/-- Coefficient term 603 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0603 : Poly :=
[
  term ((-1513755712459811187 : Rat) / 131617718934853928) [(2, 1), (5, 1), (9, 1), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 603 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0603 : Poly :=
[
  term ((1513755712459811187 : Rat) / 131617718934853928) [(2, 1), (5, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((-1513755712459811187 : Rat) / 65808859467426964) [(2, 1), (5, 1), (9, 1), (10, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 603 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0603_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0603
        rs_R010_ueqv_R010NYY_generator_25_0600_0699 =
      rs_R010_ueqv_R010NYY_partial_25_0603 := by
  native_decide

/-- Coefficient term 604 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0604 : Poly :=
[
  term ((1513755712459811187 : Rat) / 65808859467426964) [(2, 1), (5, 1), (9, 1), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 604 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0604 : Poly :=
[
  term ((1513755712459811187 : Rat) / 32904429733713482) [(2, 1), (5, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1513755712459811187 : Rat) / 65808859467426964) [(2, 1), (5, 1), (9, 1), (10, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 604 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0604_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0604
        rs_R010_ueqv_R010NYY_generator_25_0600_0699 =
      rs_R010_ueqv_R010NYY_partial_25_0604 := by
  native_decide

/-- Coefficient term 605 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0605 : Poly :=
[
  term ((66729909382710521517 : Rat) / 8423534011830651392) [(2, 1), (5, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 605 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0605 : Poly :=
[
  term ((66729909382710521517 : Rat) / 4211767005915325696) [(2, 1), (5, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((-66729909382710521517 : Rat) / 8423534011830651392) [(2, 1), (5, 1), (9, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 605 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0605_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0605
        rs_R010_ueqv_R010NYY_generator_25_0600_0699 =
      rs_R010_ueqv_R010NYY_partial_25_0605 := by
  native_decide

/-- Coefficient term 606 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0606 : Poly :=
[
  term ((56076682228120340145 : Rat) / 16847068023661302784) [(2, 1), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 606 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0606 : Poly :=
[
  term ((56076682228120340145 : Rat) / 8423534011830651392) [(2, 1), (5, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-56076682228120340145 : Rat) / 16847068023661302784) [(2, 1), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 606 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0606_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0606
        rs_R010_ueqv_R010NYY_generator_25_0600_0699 =
      rs_R010_ueqv_R010NYY_partial_25_0606 := by
  native_decide

/-- Coefficient term 607 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0607 : Poly :=
[
  term ((-77546125733351215755 : Rat) / 16847068023661302784) [(2, 1), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 607 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0607 : Poly :=
[
  term ((-77546125733351215755 : Rat) / 8423534011830651392) [(2, 1), (5, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((77546125733351215755 : Rat) / 16847068023661302784) [(2, 1), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 607 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0607_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0607
        rs_R010_ueqv_R010NYY_generator_25_0600_0699 =
      rs_R010_ueqv_R010NYY_partial_25_0607 := by
  native_decide

/-- Coefficient term 608 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0608 : Poly :=
[
  term ((-1864944523334154701037 : Rat) / 134776544189290422272) [(2, 1), (5, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 608 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0608 : Poly :=
[
  term ((-1864944523334154701037 : Rat) / 67388272094645211136) [(2, 1), (5, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((1864944523334154701037 : Rat) / 134776544189290422272) [(2, 1), (5, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 608 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0608_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0608
        rs_R010_ueqv_R010NYY_generator_25_0600_0699 =
      rs_R010_ueqv_R010NYY_partial_25_0608 := by
  native_decide

/-- Coefficient term 609 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0609 : Poly :=
[
  term ((-137830605883394360583 : Rat) / 67388272094645211136) [(2, 1), (5, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 609 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0609 : Poly :=
[
  term ((-137830605883394360583 : Rat) / 33694136047322605568) [(2, 1), (5, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((137830605883394360583 : Rat) / 67388272094645211136) [(2, 1), (5, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 609 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0609_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0609
        rs_R010_ueqv_R010NYY_generator_25_0600_0699 =
      rs_R010_ueqv_R010NYY_partial_25_0609 := by
  native_decide

/-- Coefficient term 610 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0610 : Poly :=
[
  term ((111293047763375800215 : Rat) / 33694136047322605568) [(2, 1), (5, 1), (9, 1), (16, 1)]
]

/-- Partial product 610 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0610 : Poly :=
[
  term ((111293047763375800215 : Rat) / 16847068023661302784) [(2, 1), (5, 1), (9, 1), (12, 1), (16, 1)],
  term ((-111293047763375800215 : Rat) / 33694136047322605568) [(2, 1), (5, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 610 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0610_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0610
        rs_R010_ueqv_R010NYY_generator_25_0600_0699 =
      rs_R010_ueqv_R010NYY_partial_25_0610 := by
  native_decide

/-- Coefficient term 611 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0611 : Poly :=
[
  term ((12776310151009994475 : Rat) / 1203362001690093056) [(2, 1), (5, 1), (9, 2), (13, 1), (16, 1)]
]

/-- Partial product 611 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0611 : Poly :=
[
  term ((12776310151009994475 : Rat) / 601681000845046528) [(2, 1), (5, 1), (9, 2), (12, 1), (13, 1), (16, 1)],
  term ((-12776310151009994475 : Rat) / 1203362001690093056) [(2, 1), (5, 1), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 611 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0611_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0611
        rs_R010_ueqv_R010NYY_generator_25_0600_0699 =
      rs_R010_ueqv_R010NYY_partial_25_0611 := by
  native_decide

/-- Coefficient term 612 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0612 : Poly :=
[
  term ((1513755712459811187 : Rat) / 131617718934853928) [(2, 1), (5, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 612 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0612 : Poly :=
[
  term ((-1513755712459811187 : Rat) / 131617718934853928) [(2, 1), (5, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((1513755712459811187 : Rat) / 65808859467426964) [(2, 1), (5, 1), (10, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 612 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0612_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0612
        rs_R010_ueqv_R010NYY_generator_25_0600_0699 =
      rs_R010_ueqv_R010NYY_partial_25_0612 := by
  native_decide

/-- Coefficient term 613 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0613 : Poly :=
[
  term ((-1513755712459811187 : Rat) / 131617718934853928) [(2, 1), (5, 1), (10, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 613 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0613 : Poly :=
[
  term ((-1513755712459811187 : Rat) / 65808859467426964) [(2, 1), (5, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((1513755712459811187 : Rat) / 131617718934853928) [(2, 1), (5, 1), (10, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 613 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0613_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0613
        rs_R010_ueqv_R010NYY_generator_25_0600_0699 =
      rs_R010_ueqv_R010NYY_partial_25_0613 := by
  native_decide

/-- Coefficient term 614 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0614 : Poly :=
[
  term ((1175618734587767943 : Rat) / 1203362001690093056) [(2, 1), (5, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 614 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0614 : Poly :=
[
  term ((1175618734587767943 : Rat) / 601681000845046528) [(2, 1), (5, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1175618734587767943 : Rat) / 1203362001690093056) [(2, 1), (5, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 614 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0614_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0614
        rs_R010_ueqv_R010NYY_generator_25_0600_0699 =
      rs_R010_ueqv_R010NYY_partial_25_0614 := by
  native_decide

/-- Coefficient term 615 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0615 : Poly :=
[
  term ((-1269012684898417635 : Rat) / 171908857384299008) [(2, 1), (5, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 615 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0615 : Poly :=
[
  term ((-1269012684898417635 : Rat) / 85954428692149504) [(2, 1), (5, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((1269012684898417635 : Rat) / 171908857384299008) [(2, 1), (5, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 615 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0615_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0615
        rs_R010_ueqv_R010NYY_generator_25_0600_0699 =
      rs_R010_ueqv_R010NYY_partial_25_0615 := by
  native_decide

/-- Coefficient term 616 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0616 : Poly :=
[
  term ((-21417006019877675079 : Rat) / 16847068023661302784) [(2, 1), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 616 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0616 : Poly :=
[
  term ((-21417006019877675079 : Rat) / 8423534011830651392) [(2, 1), (5, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((21417006019877675079 : Rat) / 16847068023661302784) [(2, 1), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 616 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0616_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0616
        rs_R010_ueqv_R010NYY_generator_25_0600_0699 =
      rs_R010_ueqv_R010NYY_partial_25_0616 := by
  native_decide

/-- Coefficient term 617 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0617 : Poly :=
[
  term ((121297239478114518801 : Rat) / 33694136047322605568) [(2, 1), (5, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 617 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0617 : Poly :=
[
  term ((121297239478114518801 : Rat) / 16847068023661302784) [(2, 1), (5, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-121297239478114518801 : Rat) / 33694136047322605568) [(2, 1), (5, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 617 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0617_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0617
        rs_R010_ueqv_R010NYY_generator_25_0600_0699 =
      rs_R010_ueqv_R010NYY_partial_25_0617 := by
  native_decide

/-- Coefficient term 618 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0618 : Poly :=
[
  term ((5186696643685862367 : Rat) / 8423534011830651392) [(2, 1), (5, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 618 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0618 : Poly :=
[
  term ((5186696643685862367 : Rat) / 4211767005915325696) [(2, 1), (5, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-5186696643685862367 : Rat) / 8423534011830651392) [(2, 1), (5, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 618 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0618_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0618
        rs_R010_ueqv_R010NYY_generator_25_0600_0699 =
      rs_R010_ueqv_R010NYY_partial_25_0618 := by
  native_decide

/-- Coefficient term 619 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0619 : Poly :=
[
  term ((446802628180489059 : Rat) / 171908857384299008) [(2, 1), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 619 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0619 : Poly :=
[
  term ((446802628180489059 : Rat) / 85954428692149504) [(2, 1), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((-446802628180489059 : Rat) / 171908857384299008) [(2, 1), (5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 619 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0619_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0619
        rs_R010_ueqv_R010NYY_generator_25_0600_0699 =
      rs_R010_ueqv_R010NYY_partial_25_0619 := by
  native_decide

/-- Coefficient term 620 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0620 : Poly :=
[
  term ((-7173101654988718017 : Rat) / 4211767005915325696) [(2, 1), (5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 620 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0620 : Poly :=
[
  term ((7173101654988718017 : Rat) / 4211767005915325696) [(2, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-7173101654988718017 : Rat) / 2105883502957662848) [(2, 1), (5, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 620 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0620_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0620
        rs_R010_ueqv_R010NYY_generator_25_0600_0699 =
      rs_R010_ueqv_R010NYY_partial_25_0620 := by
  native_decide

/-- Coefficient term 621 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0621 : Poly :=
[
  term ((7173101654988718017 : Rat) / 4211767005915325696) [(2, 1), (5, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 621 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0621 : Poly :=
[
  term ((7173101654988718017 : Rat) / 2105883502957662848) [(2, 1), (5, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-7173101654988718017 : Rat) / 4211767005915325696) [(2, 1), (5, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 621 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0621_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0621
        rs_R010_ueqv_R010NYY_generator_25_0600_0699 =
      rs_R010_ueqv_R010NYY_partial_25_0621 := by
  native_decide

/-- Coefficient term 622 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0622 : Poly :=
[
  term ((915776598761011178391 : Rat) / 67388272094645211136) [(2, 1), (5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 622 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0622 : Poly :=
[
  term ((915776598761011178391 : Rat) / 33694136047322605568) [(2, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-915776598761011178391 : Rat) / 67388272094645211136) [(2, 1), (5, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 622 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0622_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0622
        rs_R010_ueqv_R010NYY_generator_25_0600_0699 =
      rs_R010_ueqv_R010NYY_partial_25_0622 := by
  native_decide

/-- Coefficient term 623 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0623 : Poly :=
[
  term ((10925110817965791 : Rat) / 150420250211261632) [(2, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 623 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0623 : Poly :=
[
  term ((10925110817965791 : Rat) / 75210125105630816) [(2, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 150420250211261632) [(2, 1), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 623 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0623_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0623
        rs_R010_ueqv_R010NYY_generator_25_0600_0699 =
      rs_R010_ueqv_R010NYY_partial_25_0623 := by
  native_decide

/-- Coefficient term 624 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0624 : Poly :=
[
  term ((-2193825544886352757771 : Rat) / 8423534011830651392) [(2, 1), (8, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 624 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0624 : Poly :=
[
  term ((-2193825544886352757771 : Rat) / 4211767005915325696) [(2, 1), (8, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((2193825544886352757771 : Rat) / 8423534011830651392) [(2, 1), (8, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 624 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0624_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0624
        rs_R010_ueqv_R010NYY_generator_25_0600_0699 =
      rs_R010_ueqv_R010NYY_partial_25_0624 := by
  native_decide

/-- Coefficient term 625 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0625 : Poly :=
[
  term ((-30708785237832633 : Rat) / 627965857449728) [(2, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 625 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0625 : Poly :=
[
  term ((-30708785237832633 : Rat) / 313982928724864) [(2, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((30708785237832633 : Rat) / 627965857449728) [(2, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 625 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0625_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0625
        rs_R010_ueqv_R010NYY_generator_25_0600_0699 =
      rs_R010_ueqv_R010NYY_partial_25_0625 := by
  native_decide

/-- Coefficient term 626 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0626 : Poly :=
[
  term ((-2480374029253240888 : Rat) / 16452214866856741) [(2, 1), (8, 1), (10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 626 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0626 : Poly :=
[
  term ((-4960748058506481776 : Rat) / 16452214866856741) [(2, 1), (8, 1), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((2480374029253240888 : Rat) / 16452214866856741) [(2, 1), (8, 1), (10, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 626 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0626_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0626
        rs_R010_ueqv_R010NYY_generator_25_0600_0699 =
      rs_R010_ueqv_R010NYY_partial_25_0626 := by
  native_decide

/-- Coefficient term 627 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0627 : Poly :=
[
  term ((4960748058506481776 : Rat) / 16452214866856741) [(2, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 627 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0627 : Poly :=
[
  term ((9921496117012963552 : Rat) / 16452214866856741) [(2, 1), (8, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4960748058506481776 : Rat) / 16452214866856741) [(2, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 627 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0627_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0627
        rs_R010_ueqv_R010NYY_generator_25_0600_0699 =
      rs_R010_ueqv_R010NYY_partial_25_0627 := by
  native_decide

/-- Coefficient term 628 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0628 : Poly :=
[
  term ((-49648418573141559 : Rat) / 1491418911443104) [(2, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 628 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0628 : Poly :=
[
  term ((-49648418573141559 : Rat) / 745709455721552) [(2, 1), (8, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((49648418573141559 : Rat) / 1491418911443104) [(2, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 628 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0628_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0628
        rs_R010_ueqv_R010NYY_generator_25_0600_0699 =
      rs_R010_ueqv_R010NYY_partial_25_0628 := by
  native_decide

/-- Coefficient term 629 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0629 : Poly :=
[
  term ((49648418573141559 : Rat) / 745709455721552) [(2, 1), (8, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 629 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0629 : Poly :=
[
  term ((49648418573141559 : Rat) / 372854727860776) [(2, 1), (8, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-49648418573141559 : Rat) / 745709455721552) [(2, 1), (8, 1), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 629 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0629_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0629
        rs_R010_ueqv_R010NYY_generator_25_0600_0699 =
      rs_R010_ueqv_R010NYY_partial_25_0629 := by
  native_decide

/-- Coefficient term 630 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0630 : Poly :=
[
  term ((288586802779787145 : Rat) / 11931351291544832) [(2, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 630 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0630 : Poly :=
[
  term ((288586802779787145 : Rat) / 5965675645772416) [(2, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-288586802779787145 : Rat) / 11931351291544832) [(2, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 630 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0630_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0630
        rs_R010_ueqv_R010NYY_generator_25_0600_0699 =
      rs_R010_ueqv_R010NYY_partial_25_0630 := by
  native_decide

/-- Coefficient term 631 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0631 : Poly :=
[
  term ((778781268825008280435 : Rat) / 8423534011830651392) [(2, 1), (8, 1), (11, 2), (16, 1)]
]

/-- Partial product 631 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0631 : Poly :=
[
  term ((778781268825008280435 : Rat) / 4211767005915325696) [(2, 1), (8, 1), (11, 2), (12, 1), (16, 1)],
  term ((-778781268825008280435 : Rat) / 8423534011830651392) [(2, 1), (8, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 631 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0631_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0631
        rs_R010_ueqv_R010NYY_generator_25_0600_0699 =
      rs_R010_ueqv_R010NYY_partial_25_0631 := by
  native_decide

/-- Coefficient term 632 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0632 : Poly :=
[
  term ((-3061504394017 : Rat) / 6658120140371) [(2, 1), (8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 632 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0632 : Poly :=
[
  term ((-6123008788034 : Rat) / 6658120140371) [(2, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((3061504394017 : Rat) / 6658120140371) [(2, 1), (8, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 632 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0632_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0632
        rs_R010_ueqv_R010NYY_generator_25_0600_0699 =
      rs_R010_ueqv_R010NYY_partial_25_0632 := by
  native_decide

/-- Coefficient term 633 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0633 : Poly :=
[
  term ((-3061504394017 : Rat) / 26632480561484) [(2, 1), (8, 1), (14, 1), (16, 1)]
]

/-- Partial product 633 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0633 : Poly :=
[
  term ((-3061504394017 : Rat) / 13316240280742) [(2, 1), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((3061504394017 : Rat) / 26632480561484) [(2, 1), (8, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 633 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0633_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0633
        rs_R010_ueqv_R010NYY_generator_25_0600_0699 =
      rs_R010_ueqv_R010NYY_partial_25_0633 := by
  native_decide

/-- Coefficient term 634 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0634 : Poly :=
[
  term ((6123008788034 : Rat) / 6658120140371) [(2, 1), (8, 1), (15, 2), (16, 1)]
]

/-- Partial product 634 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0634 : Poly :=
[
  term ((12246017576068 : Rat) / 6658120140371) [(2, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-6123008788034 : Rat) / 6658120140371) [(2, 1), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 634 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0634_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0634
        rs_R010_ueqv_R010NYY_generator_25_0600_0699 =
      rs_R010_ueqv_R010NYY_partial_25_0634 := by
  native_decide

/-- Coefficient term 635 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0635 : Poly :=
[
  term ((2502876663405067 : Rat) / 1704478755934976) [(2, 1), (8, 1), (16, 1)]
]

/-- Partial product 635 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0635 : Poly :=
[
  term ((2502876663405067 : Rat) / 852239377967488) [(2, 1), (8, 1), (12, 1), (16, 1)],
  term ((-2502876663405067 : Rat) / 1704478755934976) [(2, 1), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 635 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0635_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0635
        rs_R010_ueqv_R010NYY_generator_25_0600_0699 =
      rs_R010_ueqv_R010NYY_partial_25_0635 := by
  native_decide

/-- Coefficient term 636 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0636 : Poly :=
[
  term ((2480374029253240888 : Rat) / 16452214866856741) [(2, 1), (9, 1), (10, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 636 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0636 : Poly :=
[
  term ((-2480374029253240888 : Rat) / 16452214866856741) [(2, 1), (9, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((4960748058506481776 : Rat) / 16452214866856741) [(2, 1), (9, 1), (10, 1), (11, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 636 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0636_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0636
        rs_R010_ueqv_R010NYY_generator_25_0600_0699 =
      rs_R010_ueqv_R010NYY_partial_25_0636 := by
  native_decide

/-- Coefficient term 637 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0637 : Poly :=
[
  term ((-4960748058506481776 : Rat) / 16452214866856741) [(2, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 637 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0637 : Poly :=
[
  term ((-9921496117012963552 : Rat) / 16452214866856741) [(2, 1), (9, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((4960748058506481776 : Rat) / 16452214866856741) [(2, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 637 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0637_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0637
        rs_R010_ueqv_R010NYY_generator_25_0600_0699 =
      rs_R010_ueqv_R010NYY_partial_25_0637 := by
  native_decide

/-- Coefficient term 638 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0638 : Poly :=
[
  term ((-468991639423901225547 : Rat) / 4211767005915325696) [(2, 1), (9, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 638 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0638 : Poly :=
[
  term ((-468991639423901225547 : Rat) / 2105883502957662848) [(2, 1), (9, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((468991639423901225547 : Rat) / 4211767005915325696) [(2, 1), (9, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 638 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0638_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0638
        rs_R010_ueqv_R010NYY_generator_25_0600_0699 =
      rs_R010_ueqv_R010NYY_partial_25_0638 := by
  native_decide

/-- Coefficient term 639 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0639 : Poly :=
[
  term ((49648418573141559 : Rat) / 1491418911443104) [(2, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 639 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0639 : Poly :=
[
  term ((-49648418573141559 : Rat) / 1491418911443104) [(2, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((49648418573141559 : Rat) / 745709455721552) [(2, 1), (9, 1), (10, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 639 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0639_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0639
        rs_R010_ueqv_R010NYY_generator_25_0600_0699 =
      rs_R010_ueqv_R010NYY_partial_25_0639 := by
  native_decide

/-- Coefficient term 640 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0640 : Poly :=
[
  term ((-49648418573141559 : Rat) / 745709455721552) [(2, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 640 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0640 : Poly :=
[
  term ((-49648418573141559 : Rat) / 372854727860776) [(2, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((49648418573141559 : Rat) / 745709455721552) [(2, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 640 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0640_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0640
        rs_R010_ueqv_R010NYY_generator_25_0600_0699 =
      rs_R010_ueqv_R010NYY_partial_25_0640 := by
  native_decide

/-- Coefficient term 641 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0641 : Poly :=
[
  term ((-39708855721313775 : Rat) / 1491418911443104) [(2, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 641 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0641 : Poly :=
[
  term ((-39708855721313775 : Rat) / 745709455721552) [(2, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((39708855721313775 : Rat) / 1491418911443104) [(2, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 641 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0641_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0641
        rs_R010_ueqv_R010NYY_generator_25_0600_0699 =
      rs_R010_ueqv_R010NYY_partial_25_0641 := by
  native_decide

/-- Coefficient term 642 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0642 : Poly :=
[
  term ((-19238993851369948251 : Rat) / 1203362001690093056) [(2, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 642 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0642 : Poly :=
[
  term ((-19238993851369948251 : Rat) / 601681000845046528) [(2, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((19238993851369948251 : Rat) / 1203362001690093056) [(2, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 642 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0642_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0642
        rs_R010_ueqv_R010NYY_generator_25_0600_0699 =
      rs_R010_ueqv_R010NYY_partial_25_0642 := by
  native_decide

/-- Coefficient term 643 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0643 : Poly :=
[
  term ((35978409643003240509281 : Rat) / 202164816283935633408) [(2, 1), (9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 643 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0643 : Poly :=
[
  term ((35978409643003240509281 : Rat) / 101082408141967816704) [(2, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-35978409643003240509281 : Rat) / 202164816283935633408) [(2, 1), (9, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 643 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0643_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0643
        rs_R010_ueqv_R010NYY_generator_25_0600_0699 =
      rs_R010_ueqv_R010NYY_partial_25_0643 := by
  native_decide

/-- Coefficient term 644 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0644 : Poly :=
[
  term ((1080289427269892980545 : Rat) / 33694136047322605568) [(2, 1), (9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 644 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0644 : Poly :=
[
  term ((1080289427269892980545 : Rat) / 16847068023661302784) [(2, 1), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1080289427269892980545 : Rat) / 33694136047322605568) [(2, 1), (9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 644 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0644_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0644
        rs_R010_ueqv_R010NYY_generator_25_0600_0699 =
      rs_R010_ueqv_R010NYY_partial_25_0644 := by
  native_decide

/-- Coefficient term 645 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0645 : Poly :=
[
  term ((-222203077899851125185 : Rat) / 16847068023661302784) [(2, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 645 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0645 : Poly :=
[
  term ((-222203077899851125185 : Rat) / 8423534011830651392) [(2, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((222203077899851125185 : Rat) / 16847068023661302784) [(2, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 645 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0645_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0645
        rs_R010_ueqv_R010NYY_generator_25_0600_0699 =
      rs_R010_ueqv_R010NYY_partial_25_0645 := by
  native_decide

/-- Coefficient term 646 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0646 : Poly :=
[
  term ((-15712662524220259847 : Rat) / 8423534011830651392) [(2, 1), (9, 1), (11, 2), (13, 1), (16, 1)]
]

/-- Partial product 646 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0646 : Poly :=
[
  term ((-15712662524220259847 : Rat) / 4211767005915325696) [(2, 1), (9, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((15712662524220259847 : Rat) / 8423534011830651392) [(2, 1), (9, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 646 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0646_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0646
        rs_R010_ueqv_R010NYY_generator_25_0600_0699 =
      rs_R010_ueqv_R010NYY_partial_25_0646 := by
  native_decide

/-- Coefficient term 647 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0647 : Poly :=
[
  term ((3061504394017 : Rat) / 6658120140371) [(2, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 647 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0647 : Poly :=
[
  term ((-3061504394017 : Rat) / 6658120140371) [(2, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((6123008788034 : Rat) / 6658120140371) [(2, 1), (9, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 647 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0647_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0647
        rs_R010_ueqv_R010NYY_generator_25_0600_0699 =
      rs_R010_ueqv_R010NYY_partial_25_0647 := by
  native_decide

/-- Coefficient term 648 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0648 : Poly :=
[
  term ((33258853752903365 : Rat) / 5965675645772416) [(2, 1), (9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 648 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0648 : Poly :=
[
  term ((33258853752903365 : Rat) / 2982837822886208) [(2, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-33258853752903365 : Rat) / 5965675645772416) [(2, 1), (9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 648 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0648_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0648
        rs_R010_ueqv_R010NYY_generator_25_0600_0699 =
      rs_R010_ueqv_R010NYY_partial_25_0648 := by
  native_decide

/-- Coefficient term 649 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0649 : Poly :=
[
  term ((-399540155032957 : Rat) / 243496965133568) [(2, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 649 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0649 : Poly :=
[
  term ((-399540155032957 : Rat) / 121748482566784) [(2, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((399540155032957 : Rat) / 243496965133568) [(2, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 649 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0649_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0649
        rs_R010_ueqv_R010NYY_generator_25_0600_0699 =
      rs_R010_ueqv_R010NYY_partial_25_0649 := by
  native_decide

/-- Coefficient term 650 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0650 : Poly :=
[
  term ((3545308131637509393 : Rat) / 95450810332358656) [(2, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 650 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0650 : Poly :=
[
  term ((3545308131637509393 : Rat) / 47725405166179328) [(2, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3545308131637509393 : Rat) / 95450810332358656) [(2, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 650 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0650_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0650
        rs_R010_ueqv_R010NYY_generator_25_0600_0699 =
      rs_R010_ueqv_R010NYY_partial_25_0650 := by
  native_decide

/-- Coefficient term 651 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0651 : Poly :=
[
  term ((-9950570892537 : Rat) / 2075559066112) [(2, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 651 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0651 : Poly :=
[
  term ((-9950570892537 : Rat) / 1037779533056) [(2, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((9950570892537 : Rat) / 2075559066112) [(2, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 651 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0651_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0651
        rs_R010_ueqv_R010NYY_generator_25_0600_0699 =
      rs_R010_ueqv_R010NYY_partial_25_0651 := by
  native_decide

/-- Coefficient term 652 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0652 : Poly :=
[
  term ((403181853842774263 : Rat) / 47725405166179328) [(2, 1), (9, 1), (15, 3), (16, 1)]
]

/-- Partial product 652 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0652 : Poly :=
[
  term ((403181853842774263 : Rat) / 23862702583089664) [(2, 1), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((-403181853842774263 : Rat) / 47725405166179328) [(2, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 652 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0652_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0652
        rs_R010_ueqv_R010NYY_generator_25_0600_0699 =
      rs_R010_ueqv_R010NYY_partial_25_0652 := by
  native_decide

/-- Coefficient term 653 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0653 : Poly :=
[
  term ((-40176474025583424525 : Rat) / 601681000845046528) [(2, 1), (9, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 653 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0653 : Poly :=
[
  term ((-40176474025583424525 : Rat) / 300840500422523264) [(2, 1), (9, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((40176474025583424525 : Rat) / 601681000845046528) [(2, 1), (9, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 653 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0653_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0653
        rs_R010_ueqv_R010NYY_generator_25_0600_0699 =
      rs_R010_ueqv_R010NYY_partial_25_0653 := by
  native_decide

/-- Coefficient term 654 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0654 : Poly :=
[
  term ((-23236392228781629 : Rat) / 852239377967488) [(2, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 654 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0654 : Poly :=
[
  term ((-23236392228781629 : Rat) / 426119688983744) [(2, 1), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((23236392228781629 : Rat) / 852239377967488) [(2, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 654 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0654_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0654
        rs_R010_ueqv_R010NYY_generator_25_0600_0699 =
      rs_R010_ueqv_R010NYY_partial_25_0654 := by
  native_decide

/-- Coefficient term 655 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0655 : Poly :=
[
  term ((-2480374029253240888 : Rat) / 16452214866856741) [(2, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 655 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0655 : Poly :=
[
  term ((2480374029253240888 : Rat) / 16452214866856741) [(2, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4960748058506481776 : Rat) / 16452214866856741) [(2, 1), (10, 1), (11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 655 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0655_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0655
        rs_R010_ueqv_R010NYY_generator_25_0600_0699 =
      rs_R010_ueqv_R010NYY_partial_25_0655 := by
  native_decide

/-- Coefficient term 656 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0656 : Poly :=
[
  term ((2480374029253240888 : Rat) / 16452214866856741) [(2, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 656 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0656 : Poly :=
[
  term ((4960748058506481776 : Rat) / 16452214866856741) [(2, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2480374029253240888 : Rat) / 16452214866856741) [(2, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 656 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0656_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0656
        rs_R010_ueqv_R010NYY_generator_25_0600_0699 =
      rs_R010_ueqv_R010NYY_partial_25_0656 := by
  native_decide

/-- Coefficient term 657 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0657 : Poly :=
[
  term ((-3297501003327384801 : Rat) / 601681000845046528) [(2, 1), (10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 657 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0657 : Poly :=
[
  term ((-3297501003327384801 : Rat) / 300840500422523264) [(2, 1), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((3297501003327384801 : Rat) / 601681000845046528) [(2, 1), (10, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 657 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0657_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0657
        rs_R010_ueqv_R010NYY_generator_25_0600_0699 =
      rs_R010_ueqv_R010NYY_partial_25_0657 := by
  native_decide

/-- Coefficient term 658 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0658 : Poly :=
[
  term ((71134940873831152923 : Rat) / 601681000845046528) [(2, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 658 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0658 : Poly :=
[
  term ((71134940873831152923 : Rat) / 300840500422523264) [(2, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-71134940873831152923 : Rat) / 601681000845046528) [(2, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 658 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0658_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0658
        rs_R010_ueqv_R010NYY_generator_25_0600_0699 =
      rs_R010_ueqv_R010NYY_partial_25_0658 := by
  native_decide

/-- Coefficient term 659 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0659 : Poly :=
[
  term ((-49648418573141559 : Rat) / 1491418911443104) [(2, 1), (10, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 659 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0659 : Poly :=
[
  term ((49648418573141559 : Rat) / 1491418911443104) [(2, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-49648418573141559 : Rat) / 745709455721552) [(2, 1), (10, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 659 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0659_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0659
        rs_R010_ueqv_R010NYY_generator_25_0600_0699 =
      rs_R010_ueqv_R010NYY_partial_25_0659 := by
  native_decide

/-- Coefficient term 660 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0660 : Poly :=
[
  term ((49648418573141559 : Rat) / 1491418911443104) [(2, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 660 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0660 : Poly :=
[
  term ((49648418573141559 : Rat) / 745709455721552) [(2, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-49648418573141559 : Rat) / 1491418911443104) [(2, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 660 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0660_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0660
        rs_R010_ueqv_R010NYY_generator_25_0600_0699 =
      rs_R010_ueqv_R010NYY_partial_25_0660 := by
  native_decide

/-- Coefficient term 661 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0661 : Poly :=
[
  term ((-802906227816993 : Rat) / 213059844491872) [(2, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 661 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0661 : Poly :=
[
  term ((-802906227816993 : Rat) / 106529922245936) [(2, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((802906227816993 : Rat) / 213059844491872) [(2, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 661 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0661_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0661
        rs_R010_ueqv_R010NYY_generator_25_0600_0699 =
      rs_R010_ueqv_R010NYY_partial_25_0661 := by
  native_decide

/-- Coefficient term 662 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0662 : Poly :=
[
  term ((-22310753970667 : Rat) / 852239377967488) [(2, 1), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 662 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0662 : Poly :=
[
  term ((-22310753970667 : Rat) / 426119688983744) [(2, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((22310753970667 : Rat) / 852239377967488) [(2, 1), (10, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 662 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0662_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0662
        rs_R010_ueqv_R010NYY_generator_25_0600_0699 =
      rs_R010_ueqv_R010NYY_partial_25_0662 := by
  native_decide

/-- Coefficient term 663 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0663 : Poly :=
[
  term ((24816817937759979 : Rat) / 852239377967488) [(2, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 663 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0663 : Poly :=
[
  term ((24816817937759979 : Rat) / 426119688983744) [(2, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-24816817937759979 : Rat) / 852239377967488) [(2, 1), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 663 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0663_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0663
        rs_R010_ueqv_R010NYY_generator_25_0600_0699 =
      rs_R010_ueqv_R010NYY_partial_25_0663 := by
  native_decide

/-- Coefficient term 664 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0664 : Poly :=
[
  term ((-9184513182051 : Rat) / 26632480561484) [(2, 1), (10, 1), (16, 1)]
]

/-- Partial product 664 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0664 : Poly :=
[
  term ((-9184513182051 : Rat) / 13316240280742) [(2, 1), (10, 1), (12, 1), (16, 1)],
  term ((9184513182051 : Rat) / 26632480561484) [(2, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 664 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0664_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0664
        rs_R010_ueqv_R010NYY_generator_25_0600_0699 =
      rs_R010_ueqv_R010NYY_partial_25_0664 := by
  native_decide

/-- Coefficient term 665 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0665 : Poly :=
[
  term ((9184513182051 : Rat) / 26632480561484) [(2, 1), (10, 2), (16, 1)]
]

/-- Partial product 665 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0665 : Poly :=
[
  term ((9184513182051 : Rat) / 13316240280742) [(2, 1), (10, 2), (12, 1), (16, 1)],
  term ((-9184513182051 : Rat) / 26632480561484) [(2, 1), (10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 665 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0665_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0665
        rs_R010_ueqv_R010NYY_generator_25_0600_0699 =
      rs_R010_ueqv_R010NYY_partial_25_0665 := by
  native_decide

/-- Coefficient term 666 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0666 : Poly :=
[
  term ((-272153528161949061 : Rat) / 1052941751478831424) [(2, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 666 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0666 : Poly :=
[
  term ((272153528161949061 : Rat) / 1052941751478831424) [(2, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-272153528161949061 : Rat) / 526470875739415712) [(2, 1), (11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 666 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0666_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0666
        rs_R010_ueqv_R010NYY_generator_25_0600_0699 =
      rs_R010_ueqv_R010NYY_partial_25_0666 := by
  native_decide

/-- Coefficient term 667 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0667 : Poly :=
[
  term ((272153528161949061 : Rat) / 1052941751478831424) [(2, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 667 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0667 : Poly :=
[
  term ((272153528161949061 : Rat) / 526470875739415712) [(2, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-272153528161949061 : Rat) / 1052941751478831424) [(2, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 667 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0667_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0667
        rs_R010_ueqv_R010NYY_generator_25_0600_0699 =
      rs_R010_ueqv_R010NYY_partial_25_0667 := by
  native_decide

/-- Coefficient term 668 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0668 : Poly :=
[
  term ((96659410250578601 : Rat) / 11931351291544832) [(2, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 668 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0668 : Poly :=
[
  term ((96659410250578601 : Rat) / 5965675645772416) [(2, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-96659410250578601 : Rat) / 11931351291544832) [(2, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 668 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0668_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0668
        rs_R010_ueqv_R010NYY_generator_25_0600_0699 =
      rs_R010_ueqv_R010NYY_partial_25_0668 := by
  native_decide

/-- Coefficient term 669 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0669 : Poly :=
[
  term ((-44559772591575311710741 : Rat) / 303247224425903450112) [(2, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 669 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0669 : Poly :=
[
  term ((-44559772591575311710741 : Rat) / 151623612212951725056) [(2, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((44559772591575311710741 : Rat) / 303247224425903450112) [(2, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 669 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0669_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0669
        rs_R010_ueqv_R010NYY_generator_25_0600_0699 =
      rs_R010_ueqv_R010NYY_partial_25_0669 := by
  native_decide

/-- Coefficient term 670 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0670 : Poly :=
[
  term ((-728951739374250963 : Rat) / 75210125105630816) [(2, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 670 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0670 : Poly :=
[
  term ((-728951739374250963 : Rat) / 37605062552815408) [(2, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((728951739374250963 : Rat) / 75210125105630816) [(2, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 670 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0670_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0670
        rs_R010_ueqv_R010NYY_generator_25_0600_0699 =
      rs_R010_ueqv_R010NYY_partial_25_0670 := by
  native_decide

/-- Coefficient term 671 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0671 : Poly :=
[
  term ((-29099288345286953 : Rat) / 5965675645772416) [(2, 1), (11, 1), (15, 3), (16, 1)]
]

/-- Partial product 671 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0671 : Poly :=
[
  term ((-29099288345286953 : Rat) / 2982837822886208) [(2, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((29099288345286953 : Rat) / 5965675645772416) [(2, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 671 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0671_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0671
        rs_R010_ueqv_R010NYY_generator_25_0600_0699 =
      rs_R010_ueqv_R010NYY_partial_25_0671 := by
  native_decide

/-- Coefficient term 672 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0672 : Poly :=
[
  term ((308307006418498407505 : Rat) / 8423534011830651392) [(2, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 672 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0672 : Poly :=
[
  term ((308307006418498407505 : Rat) / 4211767005915325696) [(2, 1), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-308307006418498407505 : Rat) / 8423534011830651392) [(2, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 672 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0672_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0672
        rs_R010_ueqv_R010NYY_generator_25_0600_0699 =
      rs_R010_ueqv_R010NYY_partial_25_0672 := by
  native_decide

/-- Coefficient term 673 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0673 : Poly :=
[
  term ((-3354915870598155110461 : Rat) / 50541204070983908352) [(2, 1), (11, 2), (14, 1), (16, 1)]
]

/-- Partial product 673 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0673 : Poly :=
[
  term ((-3354915870598155110461 : Rat) / 25270602035491954176) [(2, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((3354915870598155110461 : Rat) / 50541204070983908352) [(2, 1), (11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 673 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0673_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0673
        rs_R010_ueqv_R010NYY_generator_25_0600_0699 =
      rs_R010_ueqv_R010NYY_partial_25_0673 := by
  native_decide

/-- Coefficient term 674 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0674 : Poly :=
[
  term ((-137235185884509587845 : Rat) / 4211767005915325696) [(2, 1), (11, 2), (15, 2), (16, 1)]
]

/-- Partial product 674 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0674 : Poly :=
[
  term ((-137235185884509587845 : Rat) / 2105883502957662848) [(2, 1), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((137235185884509587845 : Rat) / 4211767005915325696) [(2, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 674 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0674_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0674
        rs_R010_ueqv_R010NYY_generator_25_0600_0699 =
      rs_R010_ueqv_R010NYY_partial_25_0674 := by
  native_decide

/-- Coefficient term 675 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0675 : Poly :=
[
  term ((-18102960595602546931 : Rat) / 601681000845046528) [(2, 1), (11, 2), (16, 1)]
]

/-- Partial product 675 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0675 : Poly :=
[
  term ((-18102960595602546931 : Rat) / 300840500422523264) [(2, 1), (11, 2), (12, 1), (16, 1)],
  term ((18102960595602546931 : Rat) / 601681000845046528) [(2, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 675 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0675_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0675
        rs_R010_ueqv_R010NYY_generator_25_0600_0699 =
      rs_R010_ueqv_R010NYY_partial_25_0675 := by
  native_decide

/-- Coefficient term 676 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0676 : Poly :=
[
  term ((88504018939359129 : Rat) / 23862702583089664) [(2, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 676 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0676 : Poly :=
[
  term ((-88504018939359129 : Rat) / 23862702583089664) [(2, 1), (12, 1), (15, 2), (16, 1)],
  term ((88504018939359129 : Rat) / 11931351291544832) [(2, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 676 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0676_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0676
        rs_R010_ueqv_R010NYY_generator_25_0600_0699 =
      rs_R010_ueqv_R010NYY_partial_25_0676 := by
  native_decide

/-- Coefficient term 677 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0677 : Poly :=
[
  term ((-88504018939359129 : Rat) / 23862702583089664) [(2, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 677 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0677 : Poly :=
[
  term ((-88504018939359129 : Rat) / 11931351291544832) [(2, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((88504018939359129 : Rat) / 23862702583089664) [(2, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 677 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0677_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0677
        rs_R010_ueqv_R010NYY_generator_25_0600_0699 =
      rs_R010_ueqv_R010NYY_partial_25_0677 := by
  native_decide

/-- Coefficient term 678 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0678 : Poly :=
[
  term ((205175330514845 : Rat) / 958769300213424) [(2, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 678 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0678 : Poly :=
[
  term ((205175330514845 : Rat) / 479384650106712) [(2, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-205175330514845 : Rat) / 958769300213424) [(2, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 678 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0678_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0678
        rs_R010_ueqv_R010NYY_generator_25_0600_0699 =
      rs_R010_ueqv_R010NYY_partial_25_0678 := by
  native_decide

/-- Coefficient term 679 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0679 : Poly :=
[
  term ((-1353319841726368049 : Rat) / 47725405166179328) [(2, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 679 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0679 : Poly :=
[
  term ((-1353319841726368049 : Rat) / 23862702583089664) [(2, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((1353319841726368049 : Rat) / 47725405166179328) [(2, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 679 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0679_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0679
        rs_R010_ueqv_R010NYY_generator_25_0600_0699 =
      rs_R010_ueqv_R010NYY_partial_25_0679 := by
  native_decide

/-- Coefficient term 680 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0680 : Poly :=
[
  term ((-43839229381672925 : Rat) / 8765890744808448) [(2, 1), (14, 1), (16, 1)]
]

/-- Partial product 680 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0680 : Poly :=
[
  term ((-43839229381672925 : Rat) / 4382945372404224) [(2, 1), (12, 1), (14, 1), (16, 1)],
  term ((43839229381672925 : Rat) / 8765890744808448) [(2, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 680 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0680_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0680
        rs_R010_ueqv_R010NYY_generator_25_0600_0699 =
      rs_R010_ueqv_R010NYY_partial_25_0680 := by
  native_decide

/-- Coefficient term 681 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0681 : Poly :=
[
  term ((2662652973673711 : Rat) / 4382945372404224) [(2, 1), (15, 2), (16, 1)]
]

/-- Partial product 681 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0681 : Poly :=
[
  term ((2662652973673711 : Rat) / 2191472686202112) [(2, 1), (12, 1), (15, 2), (16, 1)],
  term ((-2662652973673711 : Rat) / 4382945372404224) [(2, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 681 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0681_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0681
        rs_R010_ueqv_R010NYY_generator_25_0600_0699 =
      rs_R010_ueqv_R010NYY_partial_25_0681 := by
  native_decide

/-- Coefficient term 682 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0682 : Poly :=
[
  term ((27553539546153 : Rat) / 106529922245936) [(2, 1), (16, 1)]
]

/-- Partial product 682 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0682 : Poly :=
[
  term ((27553539546153 : Rat) / 53264961122968) [(2, 1), (12, 1), (16, 1)],
  term ((-27553539546153 : Rat) / 106529922245936) [(2, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 682 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0682_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0682
        rs_R010_ueqv_R010NYY_generator_25_0600_0699 =
      rs_R010_ueqv_R010NYY_partial_25_0682 := by
  native_decide

/-- Coefficient term 683 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0683 : Poly :=
[
  term ((64813826878183053207 : Rat) / 67388272094645211136) [(2, 2), (5, 1), (9, 1), (16, 1)]
]

/-- Partial product 683 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0683 : Poly :=
[
  term ((64813826878183053207 : Rat) / 33694136047322605568) [(2, 2), (5, 1), (9, 1), (12, 1), (16, 1)],
  term ((-64813826878183053207 : Rat) / 67388272094645211136) [(2, 2), (5, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 683 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0683_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0683
        rs_R010_ueqv_R010NYY_generator_25_0600_0699 =
      rs_R010_ueqv_R010NYY_partial_25_0683 := by
  native_decide

/-- Coefficient term 684 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0684 : Poly :=
[
  term ((3957604484499008181 : Rat) / 2406724003380186112) [(2, 2), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 684 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0684 : Poly :=
[
  term ((3957604484499008181 : Rat) / 1203362001690093056) [(2, 2), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((-3957604484499008181 : Rat) / 2406724003380186112) [(2, 2), (5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 684 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0684_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0684
        rs_R010_ueqv_R010NYY_generator_25_0600_0699 =
      rs_R010_ueqv_R010NYY_partial_25_0684 := by
  native_decide

/-- Coefficient term 685 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0685 : Poly :=
[
  term ((-7173101654988718017 : Rat) / 4211767005915325696) [(2, 2), (5, 1), (13, 1), (16, 1)]
]

/-- Partial product 685 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0685 : Poly :=
[
  term ((-7173101654988718017 : Rat) / 2105883502957662848) [(2, 2), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((7173101654988718017 : Rat) / 4211767005915325696) [(2, 2), (5, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 685 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0685_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0685
        rs_R010_ueqv_R010NYY_generator_25_0600_0699 =
      rs_R010_ueqv_R010NYY_partial_25_0685 := by
  native_decide

/-- Coefficient term 686 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0686 : Poly :=
[
  term ((7326053206440239091 : Rat) / 2105883502957662848) [(2, 2), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 686 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0686 : Poly :=
[
  term ((7326053206440239091 : Rat) / 1052941751478831424) [(2, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-7326053206440239091 : Rat) / 2105883502957662848) [(2, 2), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 686 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0686_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0686
        rs_R010_ueqv_R010NYY_generator_25_0600_0699 =
      rs_R010_ueqv_R010NYY_partial_25_0686 := by
  native_decide

/-- Coefficient term 687 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0687 : Poly :=
[
  term ((-216393175289202031809 : Rat) / 33694136047322605568) [(2, 2), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 687 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0687 : Poly :=
[
  term ((-216393175289202031809 : Rat) / 16847068023661302784) [(2, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((216393175289202031809 : Rat) / 33694136047322605568) [(2, 2), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 687 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0687_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0687
        rs_R010_ueqv_R010NYY_generator_25_0600_0699 =
      rs_R010_ueqv_R010NYY_partial_25_0687 := by
  native_decide

/-- Coefficient term 688 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0688 : Poly :=
[
  term ((-9950570892537 : Rat) / 4151118132224) [(2, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 688 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0688 : Poly :=
[
  term ((-9950570892537 : Rat) / 2075559066112) [(2, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((9950570892537 : Rat) / 4151118132224) [(2, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 688 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0688_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0688
        rs_R010_ueqv_R010NYY_generator_25_0600_0699 =
      rs_R010_ueqv_R010NYY_partial_25_0688 := by
  native_decide

/-- Coefficient term 689 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0689 : Poly :=
[
  term ((-272153528161949061 : Rat) / 1052941751478831424) [(2, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 689 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0689 : Poly :=
[
  term ((-272153528161949061 : Rat) / 526470875739415712) [(2, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((272153528161949061 : Rat) / 1052941751478831424) [(2, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 689 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0689_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0689
        rs_R010_ueqv_R010NYY_generator_25_0600_0699 =
      rs_R010_ueqv_R010NYY_partial_25_0689 := by
  native_decide

/-- Coefficient term 690 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0690 : Poly :=
[
  term ((-11843011166947806819 : Rat) / 2105883502957662848) [(2, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 690 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0690 : Poly :=
[
  term ((-11843011166947806819 : Rat) / 1052941751478831424) [(2, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((11843011166947806819 : Rat) / 2105883502957662848) [(2, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 690 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0690_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0690
        rs_R010_ueqv_R010NYY_generator_25_0600_0699 =
      rs_R010_ueqv_R010NYY_partial_25_0690 := by
  native_decide

/-- Coefficient term 691 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0691 : Poly :=
[
  term ((-18310457117411443123 : Rat) / 1203362001690093056) [(2, 2), (11, 2), (16, 1)]
]

/-- Partial product 691 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0691 : Poly :=
[
  term ((-18310457117411443123 : Rat) / 601681000845046528) [(2, 2), (11, 2), (12, 1), (16, 1)],
  term ((18310457117411443123 : Rat) / 1203362001690093056) [(2, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 691 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0691_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0691
        rs_R010_ueqv_R010NYY_generator_25_0600_0699 =
      rs_R010_ueqv_R010NYY_partial_25_0691 := by
  native_decide

/-- Coefficient term 692 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0692 : Poly :=
[
  term ((5235602667764003 : Rat) / 1255931714899456) [(2, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 692 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0692 : Poly :=
[
  term ((5235602667764003 : Rat) / 627965857449728) [(2, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5235602667764003 : Rat) / 1255931714899456) [(2, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 692 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0692_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0692
        rs_R010_ueqv_R010NYY_generator_25_0600_0699 =
      rs_R010_ueqv_R010NYY_partial_25_0692 := by
  native_decide

/-- Coefficient term 693 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0693 : Poly :=
[
  term ((-24284968930619399 : Rat) / 2982837822886208) [(2, 2), (15, 2), (16, 1)]
]

/-- Partial product 693 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0693 : Poly :=
[
  term ((-24284968930619399 : Rat) / 1491418911443104) [(2, 2), (12, 1), (15, 2), (16, 1)],
  term ((24284968930619399 : Rat) / 2982837822886208) [(2, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 693 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0693_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0693
        rs_R010_ueqv_R010NYY_generator_25_0600_0699 =
      rs_R010_ueqv_R010NYY_partial_25_0693 := by
  native_decide

/-- Coefficient term 694 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0694 : Poly :=
[
  term ((9184513182051 : Rat) / 30437120641696) [(2, 2), (16, 1)]
]

/-- Partial product 694 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0694 : Poly :=
[
  term ((9184513182051 : Rat) / 15218560320848) [(2, 2), (12, 1), (16, 1)],
  term ((-9184513182051 : Rat) / 30437120641696) [(2, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 694 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0694_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0694
        rs_R010_ueqv_R010NYY_generator_25_0600_0699 =
      rs_R010_ueqv_R010NYY_partial_25_0694 := by
  native_decide

/-- Coefficient term 695 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0695 : Poly :=
[
  term ((10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (6, 1), (8, 1), (15, 2), (16, 1)]
]

/-- Partial product 695 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0695 : Poly :=
[
  term ((10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (6, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (6, 1), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 695 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0695_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0695
        rs_R010_ueqv_R010NYY_generator_25_0600_0699 =
      rs_R010_ueqv_R010NYY_partial_25_0695 := by
  native_decide

/-- Coefficient term 696 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0696 : Poly :=
[
  term ((-445809356405963151255 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (6, 1), (8, 1), (16, 1)]
]

/-- Partial product 696 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0696 : Poly :=
[
  term ((-445809356405963151255 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (6, 1), (8, 1), (12, 1), (16, 1)],
  term ((445809356405963151255 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (6, 1), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 696 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0696_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0696
        rs_R010_ueqv_R010NYY_generator_25_0600_0699 =
      rs_R010_ueqv_R010NYY_partial_25_0696 := by
  native_decide

/-- Coefficient term 697 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0697 : Poly :=
[
  term ((-445809356405963151255 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 697 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0697 : Poly :=
[
  term ((-445809356405963151255 : Rat) / 8423534011830651392) [(3, 1), (5, 1), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((445809356405963151255 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (7, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 697 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0697_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0697
        rs_R010_ueqv_R010NYY_generator_25_0600_0699 =
      rs_R010_ueqv_R010NYY_partial_25_0697 := by
  native_decide

/-- Coefficient term 698 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0698 : Poly :=
[
  term ((10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (7, 1), (8, 1), (15, 3), (16, 1)]
]

/-- Partial product 698 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0698 : Poly :=
[
  term ((10925110817965791 : Rat) / 2350316409550963) [(3, 1), (5, 1), (7, 1), (8, 1), (12, 1), (15, 3), (16, 1)],
  term ((-10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (7, 1), (8, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 698 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0698_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0698
        rs_R010_ueqv_R010NYY_generator_25_0600_0699 =
      rs_R010_ueqv_R010NYY_partial_25_0698 := by
  native_decide

/-- Coefficient term 699 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0699 : Poly :=
[
  term ((-10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (7, 1), (9, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 699 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0699 : Poly :=
[
  term ((-10925110817965791 : Rat) / 2350316409550963) [(3, 1), (5, 1), (7, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (7, 1), (9, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 699 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0699_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0699
        rs_R010_ueqv_R010NYY_generator_25_0600_0699 =
      rs_R010_ueqv_R010NYY_partial_25_0699 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010NYY_partials_25_0600_0699 : List Poly :=
[
  rs_R010_ueqv_R010NYY_partial_25_0600,
  rs_R010_ueqv_R010NYY_partial_25_0601,
  rs_R010_ueqv_R010NYY_partial_25_0602,
  rs_R010_ueqv_R010NYY_partial_25_0603,
  rs_R010_ueqv_R010NYY_partial_25_0604,
  rs_R010_ueqv_R010NYY_partial_25_0605,
  rs_R010_ueqv_R010NYY_partial_25_0606,
  rs_R010_ueqv_R010NYY_partial_25_0607,
  rs_R010_ueqv_R010NYY_partial_25_0608,
  rs_R010_ueqv_R010NYY_partial_25_0609,
  rs_R010_ueqv_R010NYY_partial_25_0610,
  rs_R010_ueqv_R010NYY_partial_25_0611,
  rs_R010_ueqv_R010NYY_partial_25_0612,
  rs_R010_ueqv_R010NYY_partial_25_0613,
  rs_R010_ueqv_R010NYY_partial_25_0614,
  rs_R010_ueqv_R010NYY_partial_25_0615,
  rs_R010_ueqv_R010NYY_partial_25_0616,
  rs_R010_ueqv_R010NYY_partial_25_0617,
  rs_R010_ueqv_R010NYY_partial_25_0618,
  rs_R010_ueqv_R010NYY_partial_25_0619,
  rs_R010_ueqv_R010NYY_partial_25_0620,
  rs_R010_ueqv_R010NYY_partial_25_0621,
  rs_R010_ueqv_R010NYY_partial_25_0622,
  rs_R010_ueqv_R010NYY_partial_25_0623,
  rs_R010_ueqv_R010NYY_partial_25_0624,
  rs_R010_ueqv_R010NYY_partial_25_0625,
  rs_R010_ueqv_R010NYY_partial_25_0626,
  rs_R010_ueqv_R010NYY_partial_25_0627,
  rs_R010_ueqv_R010NYY_partial_25_0628,
  rs_R010_ueqv_R010NYY_partial_25_0629,
  rs_R010_ueqv_R010NYY_partial_25_0630,
  rs_R010_ueqv_R010NYY_partial_25_0631,
  rs_R010_ueqv_R010NYY_partial_25_0632,
  rs_R010_ueqv_R010NYY_partial_25_0633,
  rs_R010_ueqv_R010NYY_partial_25_0634,
  rs_R010_ueqv_R010NYY_partial_25_0635,
  rs_R010_ueqv_R010NYY_partial_25_0636,
  rs_R010_ueqv_R010NYY_partial_25_0637,
  rs_R010_ueqv_R010NYY_partial_25_0638,
  rs_R010_ueqv_R010NYY_partial_25_0639,
  rs_R010_ueqv_R010NYY_partial_25_0640,
  rs_R010_ueqv_R010NYY_partial_25_0641,
  rs_R010_ueqv_R010NYY_partial_25_0642,
  rs_R010_ueqv_R010NYY_partial_25_0643,
  rs_R010_ueqv_R010NYY_partial_25_0644,
  rs_R010_ueqv_R010NYY_partial_25_0645,
  rs_R010_ueqv_R010NYY_partial_25_0646,
  rs_R010_ueqv_R010NYY_partial_25_0647,
  rs_R010_ueqv_R010NYY_partial_25_0648,
  rs_R010_ueqv_R010NYY_partial_25_0649,
  rs_R010_ueqv_R010NYY_partial_25_0650,
  rs_R010_ueqv_R010NYY_partial_25_0651,
  rs_R010_ueqv_R010NYY_partial_25_0652,
  rs_R010_ueqv_R010NYY_partial_25_0653,
  rs_R010_ueqv_R010NYY_partial_25_0654,
  rs_R010_ueqv_R010NYY_partial_25_0655,
  rs_R010_ueqv_R010NYY_partial_25_0656,
  rs_R010_ueqv_R010NYY_partial_25_0657,
  rs_R010_ueqv_R010NYY_partial_25_0658,
  rs_R010_ueqv_R010NYY_partial_25_0659,
  rs_R010_ueqv_R010NYY_partial_25_0660,
  rs_R010_ueqv_R010NYY_partial_25_0661,
  rs_R010_ueqv_R010NYY_partial_25_0662,
  rs_R010_ueqv_R010NYY_partial_25_0663,
  rs_R010_ueqv_R010NYY_partial_25_0664,
  rs_R010_ueqv_R010NYY_partial_25_0665,
  rs_R010_ueqv_R010NYY_partial_25_0666,
  rs_R010_ueqv_R010NYY_partial_25_0667,
  rs_R010_ueqv_R010NYY_partial_25_0668,
  rs_R010_ueqv_R010NYY_partial_25_0669,
  rs_R010_ueqv_R010NYY_partial_25_0670,
  rs_R010_ueqv_R010NYY_partial_25_0671,
  rs_R010_ueqv_R010NYY_partial_25_0672,
  rs_R010_ueqv_R010NYY_partial_25_0673,
  rs_R010_ueqv_R010NYY_partial_25_0674,
  rs_R010_ueqv_R010NYY_partial_25_0675,
  rs_R010_ueqv_R010NYY_partial_25_0676,
  rs_R010_ueqv_R010NYY_partial_25_0677,
  rs_R010_ueqv_R010NYY_partial_25_0678,
  rs_R010_ueqv_R010NYY_partial_25_0679,
  rs_R010_ueqv_R010NYY_partial_25_0680,
  rs_R010_ueqv_R010NYY_partial_25_0681,
  rs_R010_ueqv_R010NYY_partial_25_0682,
  rs_R010_ueqv_R010NYY_partial_25_0683,
  rs_R010_ueqv_R010NYY_partial_25_0684,
  rs_R010_ueqv_R010NYY_partial_25_0685,
  rs_R010_ueqv_R010NYY_partial_25_0686,
  rs_R010_ueqv_R010NYY_partial_25_0687,
  rs_R010_ueqv_R010NYY_partial_25_0688,
  rs_R010_ueqv_R010NYY_partial_25_0689,
  rs_R010_ueqv_R010NYY_partial_25_0690,
  rs_R010_ueqv_R010NYY_partial_25_0691,
  rs_R010_ueqv_R010NYY_partial_25_0692,
  rs_R010_ueqv_R010NYY_partial_25_0693,
  rs_R010_ueqv_R010NYY_partial_25_0694,
  rs_R010_ueqv_R010NYY_partial_25_0695,
  rs_R010_ueqv_R010NYY_partial_25_0696,
  rs_R010_ueqv_R010NYY_partial_25_0697,
  rs_R010_ueqv_R010NYY_partial_25_0698,
  rs_R010_ueqv_R010NYY_partial_25_0699
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010NYY_block_25_0600_0699 : Poly :=
[
  term ((1513755712459811187 : Rat) / 65808859467426964) [(2, 1), (5, 1), (8, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1513755712459811187 : Rat) / 32904429733713482) [(2, 1), (5, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1513755712459811187 : Rat) / 131617718934853928) [(2, 1), (5, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((1513755712459811187 : Rat) / 65808859467426964) [(2, 1), (5, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-139024487857003943013 : Rat) / 8423534011830651392) [(2, 1), (5, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((139024487857003943013 : Rat) / 16847068023661302784) [(2, 1), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((1513755712459811187 : Rat) / 32904429733713482) [(2, 1), (5, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((115170092181424479501 : Rat) / 4211767005915325696) [(2, 1), (5, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((-1513755712459811187 : Rat) / 65808859467426964) [(2, 1), (5, 1), (9, 1), (10, 1), (12, 2), (16, 1)],
  term ((-1513755712459811187 : Rat) / 65808859467426964) [(2, 1), (5, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-66729909382710521517 : Rat) / 8423534011830651392) [(2, 1), (5, 1), (9, 1), (10, 1), (16, 1)],
  term ((56076682228120340145 : Rat) / 8423534011830651392) [(2, 1), (5, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-56076682228120340145 : Rat) / 16847068023661302784) [(2, 1), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-77546125733351215755 : Rat) / 8423534011830651392) [(2, 1), (5, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1864944523334154701037 : Rat) / 67388272094645211136) [(2, 1), (5, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-137830605883394360583 : Rat) / 33694136047322605568) [(2, 1), (5, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((111293047763375800215 : Rat) / 16847068023661302784) [(2, 1), (5, 1), (9, 1), (12, 1), (16, 1)],
  term ((77546125733351215755 : Rat) / 16847068023661302784) [(2, 1), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((1864944523334154701037 : Rat) / 134776544189290422272) [(2, 1), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((137830605883394360583 : Rat) / 67388272094645211136) [(2, 1), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-111293047763375800215 : Rat) / 33694136047322605568) [(2, 1), (5, 1), (9, 1), (16, 1)],
  term ((12776310151009994475 : Rat) / 601681000845046528) [(2, 1), (5, 1), (9, 2), (12, 1), (13, 1), (16, 1)],
  term ((-12776310151009994475 : Rat) / 1203362001690093056) [(2, 1), (5, 1), (9, 2), (13, 1), (16, 1)],
  term ((-1513755712459811187 : Rat) / 65808859467426964) [(2, 1), (5, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((1175618734587767943 : Rat) / 601681000845046528) [(2, 1), (5, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-110621804358736422099 : Rat) / 4211767005915325696) [(2, 1), (5, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((1513755712459811187 : Rat) / 65808859467426964) [(2, 1), (5, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((1513755712459811187 : Rat) / 131617718934853928) [(2, 1), (5, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1175618734587767943 : Rat) / 1203362001690093056) [(2, 1), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((1269012684898417635 : Rat) / 171908857384299008) [(2, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-21417006019877675079 : Rat) / 8423534011830651392) [(2, 1), (5, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((121297239478114518801 : Rat) / 16847068023661302784) [(2, 1), (5, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((5186696643685862367 : Rat) / 4211767005915325696) [(2, 1), (5, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((446802628180489059 : Rat) / 85954428692149504) [(2, 1), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((21417006019877675079 : Rat) / 16847068023661302784) [(2, 1), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-121297239478114518801 : Rat) / 33694136047322605568) [(2, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-5186696643685862367 : Rat) / 8423534011830651392) [(2, 1), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((-446802628180489059 : Rat) / 171908857384299008) [(2, 1), (5, 1), (11, 1), (16, 1)],
  term ((7173101654988718017 : Rat) / 2105883502957662848) [(2, 1), (5, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((915776598761011178391 : Rat) / 33694136047322605568) [(2, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((7784907860794802313 : Rat) / 4211767005915325696) [(2, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-7173101654988718017 : Rat) / 2105883502957662848) [(2, 1), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((-7173101654988718017 : Rat) / 4211767005915325696) [(2, 1), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((-915776598761011178391 : Rat) / 67388272094645211136) [(2, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 150420250211261632) [(2, 1), (5, 1), (15, 1), (16, 1)],
  term ((-2193825544886352757771 : Rat) / 4211767005915325696) [(2, 1), (8, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((2193825544886352757771 : Rat) / 8423534011830651392) [(2, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-30708785237832633 : Rat) / 313982928724864) [(2, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((30708785237832633 : Rat) / 627965857449728) [(2, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-4960748058506481776 : Rat) / 16452214866856741) [(2, 1), (8, 1), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((9921496117012963552 : Rat) / 16452214866856741) [(2, 1), (8, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((2480374029253240888 : Rat) / 16452214866856741) [(2, 1), (8, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-4960748058506481776 : Rat) / 16452214866856741) [(2, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-49648418573141559 : Rat) / 745709455721552) [(2, 1), (8, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((49648418573141559 : Rat) / 372854727860776) [(2, 1), (8, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((49648418573141559 : Rat) / 1491418911443104) [(2, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-49648418573141559 : Rat) / 745709455721552) [(2, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((288586802779787145 : Rat) / 5965675645772416) [(2, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-288586802779787145 : Rat) / 11931351291544832) [(2, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((778781268825008280435 : Rat) / 4211767005915325696) [(2, 1), (8, 1), (11, 2), (12, 1), (16, 1)],
  term ((-778781268825008280435 : Rat) / 8423534011830651392) [(2, 1), (8, 1), (11, 2), (16, 1)],
  term ((-6123008788034 : Rat) / 6658120140371) [(2, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3061504394017 : Rat) / 13316240280742) [(2, 1), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((12246017576068 : Rat) / 6658120140371) [(2, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((2502876663405067 : Rat) / 852239377967488) [(2, 1), (8, 1), (12, 1), (16, 1)],
  term ((3061504394017 : Rat) / 6658120140371) [(2, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((3061504394017 : Rat) / 26632480561484) [(2, 1), (8, 1), (14, 1), (16, 1)],
  term ((-6123008788034 : Rat) / 6658120140371) [(2, 1), (8, 1), (15, 2), (16, 1)],
  term ((-2502876663405067 : Rat) / 1704478755934976) [(2, 1), (8, 1), (16, 1)],
  term ((-9921496117012963552 : Rat) / 16452214866856741) [(2, 1), (9, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-786479515168316059211 : Rat) / 2105883502957662848) [(2, 1), (9, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((4960748058506481776 : Rat) / 16452214866856741) [(2, 1), (9, 1), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((4960748058506481776 : Rat) / 16452214866856741) [(2, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((468991639423901225547 : Rat) / 4211767005915325696) [(2, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-49648418573141559 : Rat) / 372854727860776) [(2, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-129066130015769109 : Rat) / 1491418911443104) [(2, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((49648418573141559 : Rat) / 745709455721552) [(2, 1), (9, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((49648418573141559 : Rat) / 745709455721552) [(2, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((39708855721313775 : Rat) / 1491418911443104) [(2, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-19238993851369948251 : Rat) / 601681000845046528) [(2, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((35978409643003240509281 : Rat) / 101082408141967816704) [(2, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((1080289427269892980545 : Rat) / 16847068023661302784) [(2, 1), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-222203077899851125185 : Rat) / 8423534011830651392) [(2, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((19238993851369948251 : Rat) / 1203362001690093056) [(2, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-35978409643003240509281 : Rat) / 202164816283935633408) [(2, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1080289427269892980545 : Rat) / 33694136047322605568) [(2, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((222203077899851125185 : Rat) / 16847068023661302784) [(2, 1), (9, 1), (11, 1), (16, 1)],
  term ((-15712662524220259847 : Rat) / 4211767005915325696) [(2, 1), (9, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((15712662524220259847 : Rat) / 8423534011830651392) [(2, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((33258853752903365 : Rat) / 2982837822886208) [(2, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-399540155032957 : Rat) / 121748482566784) [(2, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((3545308131637509393 : Rat) / 47725405166179328) [(2, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-119887929425576353 : Rat) / 11931351291544832) [(2, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((403181853842774263 : Rat) / 23862702583089664) [(2, 1), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((6123008788034 : Rat) / 6658120140371) [(2, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-33258853752903365 : Rat) / 5965675645772416) [(2, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((399540155032957 : Rat) / 243496965133568) [(2, 1), (9, 1), (13, 1), (16, 1)],
  term ((-3545308131637509393 : Rat) / 95450810332358656) [(2, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((9950570892537 : Rat) / 2075559066112) [(2, 1), (9, 1), (15, 1), (16, 1)],
  term ((-403181853842774263 : Rat) / 47725405166179328) [(2, 1), (9, 1), (15, 3), (16, 1)],
  term ((-40176474025583424525 : Rat) / 300840500422523264) [(2, 1), (9, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((40176474025583424525 : Rat) / 601681000845046528) [(2, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-23236392228781629 : Rat) / 426119688983744) [(2, 1), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((23236392228781629 : Rat) / 852239377967488) [(2, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((4960748058506481776 : Rat) / 16452214866856741) [(2, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3297501003327384801 : Rat) / 300840500422523264) [(2, 1), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((815432461861232904125 : Rat) / 2105883502957662848) [(2, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4960748058506481776 : Rat) / 16452214866856741) [(2, 1), (10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-2480374029253240888 : Rat) / 16452214866856741) [(2, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((3297501003327384801 : Rat) / 601681000845046528) [(2, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-71134940873831152923 : Rat) / 601681000845046528) [(2, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((49648418573141559 : Rat) / 745709455721552) [(2, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-802906227816993 : Rat) / 106529922245936) [(2, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-22310753970667 : Rat) / 426119688983744) [(2, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((273014562710602971 : Rat) / 2982837822886208) [(2, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-9184513182051 : Rat) / 13316240280742) [(2, 1), (10, 1), (12, 1), (16, 1)],
  term ((-49648418573141559 : Rat) / 745709455721552) [(2, 1), (10, 1), (12, 2), (15, 2), (16, 1)],
  term ((-49648418573141559 : Rat) / 1491418911443104) [(2, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((802906227816993 : Rat) / 213059844491872) [(2, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((22310753970667 : Rat) / 852239377967488) [(2, 1), (10, 1), (14, 1), (16, 1)],
  term ((-24816817937759979 : Rat) / 852239377967488) [(2, 1), (10, 1), (15, 2), (16, 1)],
  term ((9184513182051 : Rat) / 26632480561484) [(2, 1), (10, 1), (16, 1)],
  term ((9184513182051 : Rat) / 13316240280742) [(2, 1), (10, 2), (12, 1), (16, 1)],
  term ((-9184513182051 : Rat) / 26632480561484) [(2, 1), (10, 2), (16, 1)],
  term ((272153528161949061 : Rat) / 526470875739415712) [(2, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((96659410250578601 : Rat) / 5965675645772416) [(2, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-44559772591575311710741 : Rat) / 151623612212951725056) [(2, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-20138495174317077903 : Rat) / 1052941751478831424) [(2, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-29099288345286953 : Rat) / 2982837822886208) [(2, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-272153528161949061 : Rat) / 526470875739415712) [(2, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-272153528161949061 : Rat) / 1052941751478831424) [(2, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-96659410250578601 : Rat) / 11931351291544832) [(2, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((44559772591575311710741 : Rat) / 303247224425903450112) [(2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((728951739374250963 : Rat) / 75210125105630816) [(2, 1), (11, 1), (15, 1), (16, 1)],
  term ((29099288345286953 : Rat) / 5965675645772416) [(2, 1), (11, 1), (15, 3), (16, 1)],
  term ((308307006418498407505 : Rat) / 4211767005915325696) [(2, 1), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3354915870598155110461 : Rat) / 25270602035491954176) [(2, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-137235185884509587845 : Rat) / 2105883502957662848) [(2, 1), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((-18102960595602546931 : Rat) / 300840500422523264) [(2, 1), (11, 2), (12, 1), (16, 1)],
  term ((-308307006418498407505 : Rat) / 8423534011830651392) [(2, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((3354915870598155110461 : Rat) / 50541204070983908352) [(2, 1), (11, 2), (14, 1), (16, 1)],
  term ((137235185884509587845 : Rat) / 4211767005915325696) [(2, 1), (11, 2), (15, 2), (16, 1)],
  term ((18102960595602546931 : Rat) / 601681000845046528) [(2, 1), (11, 2), (16, 1)],
  term ((-88504018939359129 : Rat) / 11931351291544832) [(2, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((205175330514845 : Rat) / 479384650106712) [(2, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1353319841726368049 : Rat) / 23862702583089664) [(2, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-43839229381672925 : Rat) / 4382945372404224) [(2, 1), (12, 1), (14, 1), (16, 1)],
  term ((-14475572406329959 : Rat) / 5804441168859648) [(2, 1), (12, 1), (15, 2), (16, 1)],
  term ((27553539546153 : Rat) / 53264961122968) [(2, 1), (12, 1), (16, 1)],
  term ((88504018939359129 : Rat) / 11931351291544832) [(2, 1), (12, 2), (15, 2), (16, 1)],
  term ((88504018939359129 : Rat) / 23862702583089664) [(2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-205175330514845 : Rat) / 958769300213424) [(2, 1), (13, 1), (15, 1), (16, 1)],
  term ((1353319841726368049 : Rat) / 47725405166179328) [(2, 1), (14, 1), (15, 2), (16, 1)],
  term ((43839229381672925 : Rat) / 8765890744808448) [(2, 1), (14, 1), (16, 1)],
  term ((-2662652973673711 : Rat) / 4382945372404224) [(2, 1), (15, 2), (16, 1)],
  term ((-27553539546153 : Rat) / 106529922245936) [(2, 1), (16, 1)],
  term ((64813826878183053207 : Rat) / 33694136047322605568) [(2, 2), (5, 1), (9, 1), (12, 1), (16, 1)],
  term ((-64813826878183053207 : Rat) / 67388272094645211136) [(2, 2), (5, 1), (9, 1), (16, 1)],
  term ((3957604484499008181 : Rat) / 1203362001690093056) [(2, 2), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((-3957604484499008181 : Rat) / 2406724003380186112) [(2, 2), (5, 1), (11, 1), (16, 1)],
  term ((-7173101654988718017 : Rat) / 2105883502957662848) [(2, 2), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((7326053206440239091 : Rat) / 1052941751478831424) [(2, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((7173101654988718017 : Rat) / 4211767005915325696) [(2, 2), (5, 1), (13, 1), (16, 1)],
  term ((-7326053206440239091 : Rat) / 2105883502957662848) [(2, 2), (5, 1), (15, 1), (16, 1)],
  term ((-216393175289202031809 : Rat) / 16847068023661302784) [(2, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((216393175289202031809 : Rat) / 33694136047322605568) [(2, 2), (9, 1), (11, 1), (16, 1)],
  term ((-9950570892537 : Rat) / 2075559066112) [(2, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((9950570892537 : Rat) / 4151118132224) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((-272153528161949061 : Rat) / 526470875739415712) [(2, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-11843011166947806819 : Rat) / 1052941751478831424) [(2, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((272153528161949061 : Rat) / 1052941751478831424) [(2, 2), (11, 1), (13, 1), (16, 1)],
  term ((11843011166947806819 : Rat) / 2105883502957662848) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((-18310457117411443123 : Rat) / 601681000845046528) [(2, 2), (11, 2), (12, 1), (16, 1)],
  term ((18310457117411443123 : Rat) / 1203362001690093056) [(2, 2), (11, 2), (16, 1)],
  term ((5235602667764003 : Rat) / 627965857449728) [(2, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-24284968930619399 : Rat) / 1491418911443104) [(2, 2), (12, 1), (15, 2), (16, 1)],
  term ((9184513182051 : Rat) / 15218560320848) [(2, 2), (12, 1), (16, 1)],
  term ((-5235602667764003 : Rat) / 1255931714899456) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((24284968930619399 : Rat) / 2982837822886208) [(2, 2), (15, 2), (16, 1)],
  term ((-9184513182051 : Rat) / 30437120641696) [(2, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (6, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-445809356405963151255 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (6, 1), (8, 1), (12, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (6, 1), (8, 1), (15, 2), (16, 1)],
  term ((445809356405963151255 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (6, 1), (8, 1), (16, 1)],
  term ((-445809356405963151255 : Rat) / 8423534011830651392) [(3, 1), (5, 1), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 2350316409550963) [(3, 1), (5, 1), (7, 1), (8, 1), (12, 1), (15, 3), (16, 1)],
  term ((445809356405963151255 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (7, 1), (8, 1), (15, 3), (16, 1)],
  term ((-10925110817965791 : Rat) / 2350316409550963) [(3, 1), (5, 1), (7, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (7, 1), (9, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 25, terms 600 through 699. -/
theorem rs_R010_ueqv_R010NYY_block_25_0600_0699_valid :
    checkProductSumEq rs_R010_ueqv_R010NYY_partials_25_0600_0699
      rs_R010_ueqv_R010NYY_block_25_0600_0699 = true := by
  native_decide

end R010UeqvR010NYYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
