/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R006:u=v:R006, term block 22:1500-1599

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R006UeqvR006TermShards

/-- Generator polynomial 22 for relaxed split surplus certificate `R006:u=v:R006`. -/
def rs_R006_ueqv_R006_generator_22_1500_1599 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(10, 1)]
]

/-- Coefficient term 1500 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1500 : Poly :=
[
  term ((96 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (12, 2), (14, 1), (16, 1)]
]

/-- Partial product 1500 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1500 : Poly :=
[
  term ((192 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (10, 1), (12, 2), (14, 1), (16, 1)],
  term ((-96 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (12, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1500 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1500_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1500
        rs_R006_ueqv_R006_generator_22_1500_1599 =
      rs_R006_ueqv_R006_partial_22_1500 := by
  native_decide

/-- Coefficient term 1501 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1501 : Poly :=
[
  term ((192 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (12, 2), (16, 1)]
]

/-- Partial product 1501 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1501 : Poly :=
[
  term ((384 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (10, 1), (12, 2), (16, 1)],
  term ((-192 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1501 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1501_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1501
        rs_R006_ueqv_R006_generator_22_1500_1599 =
      rs_R006_ueqv_R006_partial_22_1501 := by
  native_decide

/-- Coefficient term 1502 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1502 : Poly :=
[
  term ((72 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (14, 1)]
]

/-- Partial product 1502 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1502 : Poly :=
[
  term ((144 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (10, 1), (14, 1)],
  term ((-72 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1502 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1502_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1502
        rs_R006_ueqv_R006_generator_22_1500_1599 =
      rs_R006_ueqv_R006_partial_22_1502 := by
  native_decide

/-- Coefficient term 1503 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1503 : Poly :=
[
  term ((-24 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 1503 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1503 : Poly :=
[
  term ((-48 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((24 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1503 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1503_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1503
        rs_R006_ueqv_R006_generator_22_1500_1599 =
      rs_R006_ueqv_R006_partial_22_1503 := by
  native_decide

/-- Coefficient term 1504 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1504 : Poly :=
[
  term ((-48 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (16, 1)]
]

/-- Partial product 1504 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1504 : Poly :=
[
  term ((-96 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((48 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1504 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1504_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1504
        rs_R006_ueqv_R006_generator_22_1500_1599 =
      rs_R006_ueqv_R006_partial_22_1504 := by
  native_decide

/-- Coefficient term 1505 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1505 : Poly :=
[
  term ((576 : Rat) / 5) [(3, 2), (9, 1), (11, 1)]
]

/-- Partial product 1505 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1505 : Poly :=
[
  term ((1152 : Rat) / 5) [(3, 2), (9, 1), (10, 1), (11, 1)],
  term ((-576 : Rat) / 5) [(3, 2), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1505 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1505_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1505
        rs_R006_ueqv_R006_generator_22_1500_1599 =
      rs_R006_ueqv_R006_partial_22_1505 := by
  native_decide

/-- Coefficient term 1506 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1506 : Poly :=
[
  term ((288 : Rat) / 5) [(3, 2), (9, 1), (11, 1), (14, 1)]
]

/-- Partial product 1506 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1506 : Poly :=
[
  term ((576 : Rat) / 5) [(3, 2), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((-288 : Rat) / 5) [(3, 2), (9, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1506 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1506_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1506
        rs_R006_ueqv_R006_generator_22_1500_1599 =
      rs_R006_ueqv_R006_partial_22_1506 := by
  native_decide

/-- Coefficient term 1507 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1507 : Poly :=
[
  term ((-96 : Rat) / 5) [(3, 2), (9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 1507 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1507 : Poly :=
[
  term ((-192 : Rat) / 5) [(3, 2), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((96 : Rat) / 5) [(3, 2), (9, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1507 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1507_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1507
        rs_R006_ueqv_R006_generator_22_1500_1599 =
      rs_R006_ueqv_R006_partial_22_1507 := by
  native_decide

/-- Coefficient term 1508 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1508 : Poly :=
[
  term ((-192 : Rat) / 5) [(3, 2), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 1508 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1508 : Poly :=
[
  term ((-384 : Rat) / 5) [(3, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((192 : Rat) / 5) [(3, 2), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1508 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1508_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1508
        rs_R006_ueqv_R006_generator_22_1500_1599 =
      rs_R006_ueqv_R006_partial_22_1508 := by
  native_decide

/-- Coefficient term 1509 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1509 : Poly :=
[
  term ((-288 : Rat) / 5) [(3, 2), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 1509 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1509 : Poly :=
[
  term ((-576 : Rat) / 5) [(3, 2), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((288 : Rat) / 5) [(3, 2), (9, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1509 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1509_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1509
        rs_R006_ueqv_R006_generator_22_1500_1599 =
      rs_R006_ueqv_R006_partial_22_1509 := by
  native_decide

/-- Coefficient term 1510 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1510 : Poly :=
[
  term ((-144 : Rat) / 5) [(3, 2), (9, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 1510 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1510 : Poly :=
[
  term ((-288 : Rat) / 5) [(3, 2), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((144 : Rat) / 5) [(3, 2), (9, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1510 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1510_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1510
        rs_R006_ueqv_R006_generator_22_1500_1599 =
      rs_R006_ueqv_R006_partial_22_1510 := by
  native_decide

/-- Coefficient term 1511 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1511 : Poly :=
[
  term ((48 : Rat) / 5) [(3, 2), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1511 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1511 : Poly :=
[
  term ((96 : Rat) / 5) [(3, 2), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-48 : Rat) / 5) [(3, 2), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1511 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1511_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1511
        rs_R006_ueqv_R006_generator_22_1500_1599 =
      rs_R006_ueqv_R006_partial_22_1511 := by
  native_decide

/-- Coefficient term 1512 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1512 : Poly :=
[
  term ((96 : Rat) / 5) [(3, 2), (9, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 1512 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1512 : Poly :=
[
  term ((192 : Rat) / 5) [(3, 2), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-96 : Rat) / 5) [(3, 2), (9, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1512 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1512_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1512
        rs_R006_ueqv_R006_generator_22_1500_1599 =
      rs_R006_ueqv_R006_partial_22_1512 := by
  native_decide

/-- Coefficient term 1513 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1513 : Poly :=
[
  term ((-288 : Rat) / 5) [(3, 2), (9, 1), (13, 1)]
]

/-- Partial product 1513 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1513 : Poly :=
[
  term ((-576 : Rat) / 5) [(3, 2), (9, 1), (10, 1), (13, 1)],
  term ((288 : Rat) / 5) [(3, 2), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1513 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1513_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1513
        rs_R006_ueqv_R006_generator_22_1500_1599 =
      rs_R006_ueqv_R006_partial_22_1513 := by
  native_decide

/-- Coefficient term 1514 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1514 : Poly :=
[
  term ((-144 : Rat) / 5) [(3, 2), (9, 1), (13, 1), (14, 1)]
]

/-- Partial product 1514 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1514 : Poly :=
[
  term ((-288 : Rat) / 5) [(3, 2), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((144 : Rat) / 5) [(3, 2), (9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1514 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1514_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1514
        rs_R006_ueqv_R006_generator_22_1500_1599 =
      rs_R006_ueqv_R006_partial_22_1514 := by
  native_decide

/-- Coefficient term 1515 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1515 : Poly :=
[
  term ((48 : Rat) / 5) [(3, 2), (9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1515 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1515 : Poly :=
[
  term ((96 : Rat) / 5) [(3, 2), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-48 : Rat) / 5) [(3, 2), (9, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1515 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1515_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1515
        rs_R006_ueqv_R006_generator_22_1500_1599 =
      rs_R006_ueqv_R006_partial_22_1515 := by
  native_decide

/-- Coefficient term 1516 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1516 : Poly :=
[
  term ((96 : Rat) / 5) [(3, 2), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 1516 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1516 : Poly :=
[
  term ((192 : Rat) / 5) [(3, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-96 : Rat) / 5) [(3, 2), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1516 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1516_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1516
        rs_R006_ueqv_R006_generator_22_1500_1599 =
      rs_R006_ueqv_R006_partial_22_1516 := by
  native_decide

/-- Coefficient term 1517 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1517 : Poly :=
[
  term ((24 : Rat) / 5) [(4, 1)]
]

/-- Partial product 1517 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1517 : Poly :=
[
  term ((-24 : Rat) / 5) [(4, 1)],
  term ((48 : Rat) / 5) [(4, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1517 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1517_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1517
        rs_R006_ueqv_R006_generator_22_1500_1599 =
      rs_R006_ueqv_R006_partial_22_1517 := by
  native_decide

/-- Coefficient term 1518 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1518 : Poly :=
[
  term ((-12 : Rat) / 5) [(4, 1), (6, 1)]
]

/-- Partial product 1518 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1518 : Poly :=
[
  term ((12 : Rat) / 5) [(4, 1), (6, 1)],
  term ((-24 : Rat) / 5) [(4, 1), (6, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1518 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1518_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1518
        rs_R006_ueqv_R006_generator_22_1500_1599 =
      rs_R006_ueqv_R006_partial_22_1518 := by
  native_decide

/-- Coefficient term 1519 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1519 : Poly :=
[
  term ((144 : Rat) / 35) [(4, 1), (6, 1), (8, 1), (11, 1), (13, 1)]
]

/-- Partial product 1519 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1519 : Poly :=
[
  term ((288 : Rat) / 35) [(4, 1), (6, 1), (8, 1), (10, 1), (11, 1), (13, 1)],
  term ((-144 : Rat) / 35) [(4, 1), (6, 1), (8, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1519 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1519_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1519
        rs_R006_ueqv_R006_generator_22_1500_1599 =
      rs_R006_ueqv_R006_partial_22_1519 := by
  native_decide

/-- Coefficient term 1520 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1520 : Poly :=
[
  term ((-288 : Rat) / 35) [(4, 1), (6, 1), (8, 1), (13, 2)]
]

/-- Partial product 1520 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1520 : Poly :=
[
  term ((-576 : Rat) / 35) [(4, 1), (6, 1), (8, 1), (10, 1), (13, 2)],
  term ((288 : Rat) / 35) [(4, 1), (6, 1), (8, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1520 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1520_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1520
        rs_R006_ueqv_R006_generator_22_1500_1599 =
      rs_R006_ueqv_R006_partial_22_1520 := by
  native_decide

/-- Coefficient term 1521 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1521 : Poly :=
[
  term ((72 : Rat) / 35) [(4, 1), (6, 1), (9, 1), (13, 1)]
]

/-- Partial product 1521 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1521 : Poly :=
[
  term ((144 : Rat) / 35) [(4, 1), (6, 1), (9, 1), (10, 1), (13, 1)],
  term ((-72 : Rat) / 35) [(4, 1), (6, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1521 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1521_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1521
        rs_R006_ueqv_R006_generator_22_1500_1599 =
      rs_R006_ueqv_R006_partial_22_1521 := by
  native_decide

/-- Coefficient term 1522 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1522 : Poly :=
[
  term ((144 : Rat) / 35) [(4, 1), (6, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 1522 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1522 : Poly :=
[
  term ((288 : Rat) / 35) [(4, 1), (6, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((-144 : Rat) / 35) [(4, 1), (6, 1), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1522 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1522_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1522
        rs_R006_ueqv_R006_generator_22_1500_1599 =
      rs_R006_ueqv_R006_partial_22_1522 := by
  native_decide

/-- Coefficient term 1523 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1523 : Poly :=
[
  term ((-144 : Rat) / 35) [(4, 1), (6, 1), (11, 1), (13, 1)]
]

/-- Partial product 1523 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1523 : Poly :=
[
  term ((-288 : Rat) / 35) [(4, 1), (6, 1), (10, 1), (11, 1), (13, 1)],
  term ((144 : Rat) / 35) [(4, 1), (6, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1523 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1523_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1523
        rs_R006_ueqv_R006_generator_22_1500_1599 =
      rs_R006_ueqv_R006_partial_22_1523 := by
  native_decide

/-- Coefficient term 1524 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1524 : Poly :=
[
  term ((12 : Rat) / 5) [(4, 1), (6, 1), (14, 1)]
]

/-- Partial product 1524 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1524 : Poly :=
[
  term ((24 : Rat) / 5) [(4, 1), (6, 1), (10, 1), (14, 1)],
  term ((-12 : Rat) / 5) [(4, 1), (6, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1524 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1524_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1524
        rs_R006_ueqv_R006_generator_22_1500_1599 =
      rs_R006_ueqv_R006_partial_22_1524 := by
  native_decide

/-- Coefficient term 1525 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1525 : Poly :=
[
  term ((-144 : Rat) / 35) [(4, 1), (7, 1), (8, 1), (10, 1), (13, 1)]
]

/-- Partial product 1525 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1525 : Poly :=
[
  term ((144 : Rat) / 35) [(4, 1), (7, 1), (8, 1), (10, 1), (13, 1)],
  term ((-288 : Rat) / 35) [(4, 1), (7, 1), (8, 1), (10, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1525 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1525_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1525
        rs_R006_ueqv_R006_generator_22_1500_1599 =
      rs_R006_ueqv_R006_partial_22_1525 := by
  native_decide

/-- Coefficient term 1526 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1526 : Poly :=
[
  term ((288 : Rat) / 35) [(4, 1), (7, 1), (8, 1), (12, 1), (13, 1)]
]

/-- Partial product 1526 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1526 : Poly :=
[
  term ((576 : Rat) / 35) [(4, 1), (7, 1), (8, 1), (10, 1), (12, 1), (13, 1)],
  term ((-288 : Rat) / 35) [(4, 1), (7, 1), (8, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1526 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1526_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1526
        rs_R006_ueqv_R006_generator_22_1500_1599 =
      rs_R006_ueqv_R006_partial_22_1526 := by
  native_decide

/-- Coefficient term 1527 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1527 : Poly :=
[
  term ((144 : Rat) / 35) [(4, 1), (7, 1), (8, 1), (13, 1)]
]

/-- Partial product 1527 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1527 : Poly :=
[
  term ((288 : Rat) / 35) [(4, 1), (7, 1), (8, 1), (10, 1), (13, 1)],
  term ((-144 : Rat) / 35) [(4, 1), (7, 1), (8, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1527 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1527_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1527
        rs_R006_ueqv_R006_generator_22_1500_1599 =
      rs_R006_ueqv_R006_partial_22_1527 := by
  native_decide

/-- Coefficient term 1528 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1528 : Poly :=
[
  term ((-144 : Rat) / 35) [(4, 1), (7, 1), (10, 1), (12, 1), (13, 1)]
]

/-- Partial product 1528 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1528 : Poly :=
[
  term ((144 : Rat) / 35) [(4, 1), (7, 1), (10, 1), (12, 1), (13, 1)],
  term ((-288 : Rat) / 35) [(4, 1), (7, 1), (10, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1528 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1528_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1528
        rs_R006_ueqv_R006_generator_22_1500_1599 =
      rs_R006_ueqv_R006_partial_22_1528 := by
  native_decide

/-- Coefficient term 1529 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1529 : Poly :=
[
  term ((144 : Rat) / 35) [(4, 1), (7, 1), (10, 1), (13, 1)]
]

/-- Partial product 1529 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1529 : Poly :=
[
  term ((-144 : Rat) / 35) [(4, 1), (7, 1), (10, 1), (13, 1)],
  term ((288 : Rat) / 35) [(4, 1), (7, 1), (10, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1529 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1529_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1529
        rs_R006_ueqv_R006_generator_22_1500_1599 =
      rs_R006_ueqv_R006_partial_22_1529 := by
  native_decide

/-- Coefficient term 1530 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1530 : Poly :=
[
  term ((-288 : Rat) / 35) [(4, 1), (7, 1), (12, 1), (13, 1)]
]

/-- Partial product 1530 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1530 : Poly :=
[
  term ((-576 : Rat) / 35) [(4, 1), (7, 1), (10, 1), (12, 1), (13, 1)],
  term ((288 : Rat) / 35) [(4, 1), (7, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1530 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1530_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1530
        rs_R006_ueqv_R006_generator_22_1500_1599 =
      rs_R006_ueqv_R006_partial_22_1530 := by
  native_decide

/-- Coefficient term 1531 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1531 : Poly :=
[
  term ((144 : Rat) / 35) [(4, 1), (8, 1), (10, 1), (13, 2)]
]

/-- Partial product 1531 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1531 : Poly :=
[
  term ((-144 : Rat) / 35) [(4, 1), (8, 1), (10, 1), (13, 2)],
  term ((288 : Rat) / 35) [(4, 1), (8, 1), (10, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1531 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1531_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1531
        rs_R006_ueqv_R006_generator_22_1500_1599 =
      rs_R006_ueqv_R006_partial_22_1531 := by
  native_decide

/-- Coefficient term 1532 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1532 : Poly :=
[
  term ((-288 : Rat) / 35) [(4, 1), (8, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 1532 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1532 : Poly :=
[
  term ((-576 : Rat) / 35) [(4, 1), (8, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((288 : Rat) / 35) [(4, 1), (8, 1), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1532 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1532_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1532
        rs_R006_ueqv_R006_generator_22_1500_1599 =
      rs_R006_ueqv_R006_partial_22_1532 := by
  native_decide

/-- Coefficient term 1533 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1533 : Poly :=
[
  term ((72 : Rat) / 35) [(4, 1), (8, 1), (11, 1), (13, 1)]
]

/-- Partial product 1533 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1533 : Poly :=
[
  term ((144 : Rat) / 35) [(4, 1), (8, 1), (10, 1), (11, 1), (13, 1)],
  term ((-72 : Rat) / 35) [(4, 1), (8, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1533 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1533_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1533
        rs_R006_ueqv_R006_generator_22_1500_1599 =
      rs_R006_ueqv_R006_partial_22_1533 := by
  native_decide

/-- Coefficient term 1534 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1534 : Poly :=
[
  term ((72 : Rat) / 35) [(4, 1), (8, 1), (13, 2)]
]

/-- Partial product 1534 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1534 : Poly :=
[
  term ((144 : Rat) / 35) [(4, 1), (8, 1), (10, 1), (13, 2)],
  term ((-72 : Rat) / 35) [(4, 1), (8, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1534 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1534_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1534
        rs_R006_ueqv_R006_generator_22_1500_1599 =
      rs_R006_ueqv_R006_partial_22_1534 := by
  native_decide

/-- Coefficient term 1535 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1535 : Poly :=
[
  term ((144 : Rat) / 35) [(4, 1), (9, 1), (10, 1), (12, 1), (13, 1)]
]

/-- Partial product 1535 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1535 : Poly :=
[
  term ((-144 : Rat) / 35) [(4, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((288 : Rat) / 35) [(4, 1), (9, 1), (10, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1535 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1535_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1535
        rs_R006_ueqv_R006_generator_22_1500_1599 =
      rs_R006_ueqv_R006_partial_22_1535 := by
  native_decide

/-- Coefficient term 1536 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1536 : Poly :=
[
  term ((-216 : Rat) / 35) [(4, 1), (9, 1), (10, 1), (13, 1)]
]

/-- Partial product 1536 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1536 : Poly :=
[
  term ((216 : Rat) / 35) [(4, 1), (9, 1), (10, 1), (13, 1)],
  term ((-432 : Rat) / 35) [(4, 1), (9, 1), (10, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1536 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1536_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1536
        rs_R006_ueqv_R006_generator_22_1500_1599 =
      rs_R006_ueqv_R006_partial_22_1536 := by
  native_decide

/-- Coefficient term 1537 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1537 : Poly :=
[
  term ((-36 : Rat) / 7) [(4, 1), (9, 1), (13, 1)]
]

/-- Partial product 1537 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1537 : Poly :=
[
  term ((-72 : Rat) / 7) [(4, 1), (9, 1), (10, 1), (13, 1)],
  term ((36 : Rat) / 7) [(4, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1537 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1537_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1537
        rs_R006_ueqv_R006_generator_22_1500_1599 =
      rs_R006_ueqv_R006_partial_22_1537 := by
  native_decide

/-- Coefficient term 1538 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1538 : Poly :=
[
  term ((144 : Rat) / 35) [(4, 1), (10, 1), (13, 2)]
]

/-- Partial product 1538 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1538 : Poly :=
[
  term ((-144 : Rat) / 35) [(4, 1), (10, 1), (13, 2)],
  term ((288 : Rat) / 35) [(4, 1), (10, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1538 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1538_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1538
        rs_R006_ueqv_R006_generator_22_1500_1599 =
      rs_R006_ueqv_R006_partial_22_1538 := by
  native_decide

/-- Coefficient term 1539 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1539 : Poly :=
[
  term ((-144 : Rat) / 35) [(4, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 1539 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1539 : Poly :=
[
  term ((-288 : Rat) / 35) [(4, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((144 : Rat) / 35) [(4, 1), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1539 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1539_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1539
        rs_R006_ueqv_R006_generator_22_1500_1599 =
      rs_R006_ueqv_R006_partial_22_1539 := by
  native_decide

/-- Coefficient term 1540 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1540 : Poly :=
[
  term ((-144 : Rat) / 35) [(4, 1), (11, 1), (13, 1)]
]

/-- Partial product 1540 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1540 : Poly :=
[
  term ((-288 : Rat) / 35) [(4, 1), (10, 1), (11, 1), (13, 1)],
  term ((144 : Rat) / 35) [(4, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1540 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1540_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1540
        rs_R006_ueqv_R006_generator_22_1500_1599 =
      rs_R006_ueqv_R006_partial_22_1540 := by
  native_decide

/-- Coefficient term 1541 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1541 : Poly :=
[
  term ((24 : Rat) / 5) [(4, 1), (12, 1)]
]

/-- Partial product 1541 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1541 : Poly :=
[
  term ((48 : Rat) / 5) [(4, 1), (10, 1), (12, 1)],
  term ((-24 : Rat) / 5) [(4, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1541 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1541_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1541
        rs_R006_ueqv_R006_generator_22_1500_1599 =
      rs_R006_ueqv_R006_partial_22_1541 := by
  native_decide

/-- Coefficient term 1542 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1542 : Poly :=
[
  term ((-24 : Rat) / 5) [(4, 1), (12, 1), (14, 1)]
]

/-- Partial product 1542 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1542 : Poly :=
[
  term ((-48 : Rat) / 5) [(4, 1), (10, 1), (12, 1), (14, 1)],
  term ((24 : Rat) / 5) [(4, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1542 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1542_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1542
        rs_R006_ueqv_R006_generator_22_1500_1599 =
      rs_R006_ueqv_R006_partial_22_1542 := by
  native_decide

/-- Coefficient term 1543 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1543 : Poly :=
[
  term ((72 : Rat) / 35) [(4, 1), (13, 2)]
]

/-- Partial product 1543 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1543 : Poly :=
[
  term ((144 : Rat) / 35) [(4, 1), (10, 1), (13, 2)],
  term ((-72 : Rat) / 35) [(4, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1543 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1543_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1543
        rs_R006_ueqv_R006_generator_22_1500_1599 =
      rs_R006_ueqv_R006_partial_22_1543 := by
  native_decide

/-- Coefficient term 1544 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1544 : Poly :=
[
  term ((-36 : Rat) / 5) [(4, 1), (14, 1)]
]

/-- Partial product 1544 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1544 : Poly :=
[
  term ((-72 : Rat) / 5) [(4, 1), (10, 1), (14, 1)],
  term ((36 : Rat) / 5) [(4, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1544 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1544_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1544
        rs_R006_ueqv_R006_generator_22_1500_1599 =
      rs_R006_ueqv_R006_partial_22_1544 := by
  native_decide

/-- Coefficient term 1545 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1545 : Poly :=
[
  term ((24 : Rat) / 5) [(5, 1), (6, 1), (7, 1)]
]

/-- Partial product 1545 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1545 : Poly :=
[
  term ((-24 : Rat) / 5) [(5, 1), (6, 1), (7, 1)],
  term ((48 : Rat) / 5) [(5, 1), (6, 1), (7, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1545 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1545_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1545
        rs_R006_ueqv_R006_generator_22_1500_1599 =
      rs_R006_ueqv_R006_partial_22_1545 := by
  native_decide

/-- Coefficient term 1546 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1546 : Poly :=
[
  term ((-24 : Rat) / 5) [(5, 1), (6, 1), (7, 1), (14, 1)]
]

/-- Partial product 1546 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1546 : Poly :=
[
  term ((-48 : Rat) / 5) [(5, 1), (6, 1), (7, 1), (10, 1), (14, 1)],
  term ((24 : Rat) / 5) [(5, 1), (6, 1), (7, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1546 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1546_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1546
        rs_R006_ueqv_R006_generator_22_1500_1599 =
      rs_R006_ueqv_R006_partial_22_1546 := by
  native_decide

/-- Coefficient term 1547 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1547 : Poly :=
[
  term ((288 : Rat) / 35) [(5, 1), (6, 1), (9, 1), (11, 1), (13, 1)]
]

/-- Partial product 1547 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1547 : Poly :=
[
  term ((576 : Rat) / 35) [(5, 1), (6, 1), (9, 1), (10, 1), (11, 1), (13, 1)],
  term ((-288 : Rat) / 35) [(5, 1), (6, 1), (9, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1547 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1547_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1547
        rs_R006_ueqv_R006_generator_22_1500_1599 =
      rs_R006_ueqv_R006_partial_22_1547 := by
  native_decide

/-- Coefficient term 1548 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1548 : Poly :=
[
  term ((864 : Rat) / 35) [(5, 1), (6, 1), (9, 1), (13, 2)]
]

/-- Partial product 1548 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1548 : Poly :=
[
  term ((1728 : Rat) / 35) [(5, 1), (6, 1), (9, 1), (10, 1), (13, 2)],
  term ((-864 : Rat) / 35) [(5, 1), (6, 1), (9, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1548 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1548_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1548
        rs_R006_ueqv_R006_generator_22_1500_1599 =
      rs_R006_ueqv_R006_partial_22_1548 := by
  native_decide

/-- Coefficient term 1549 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1549 : Poly :=
[
  term ((24 : Rat) / 5) [(5, 1), (6, 1), (11, 1), (12, 1)]
]

/-- Partial product 1549 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1549 : Poly :=
[
  term ((48 : Rat) / 5) [(5, 1), (6, 1), (10, 1), (11, 1), (12, 1)],
  term ((-24 : Rat) / 5) [(5, 1), (6, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1549 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1549_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1549
        rs_R006_ueqv_R006_generator_22_1500_1599 =
      rs_R006_ueqv_R006_partial_22_1549 := by
  native_decide

/-- Coefficient term 1550 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1550 : Poly :=
[
  term ((-24 : Rat) / 5) [(5, 1), (6, 1), (11, 1), (12, 1), (14, 1)]
]

/-- Partial product 1550 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1550 : Poly :=
[
  term ((-48 : Rat) / 5) [(5, 1), (6, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((24 : Rat) / 5) [(5, 1), (6, 1), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1550 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1550_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1550
        rs_R006_ueqv_R006_generator_22_1500_1599 =
      rs_R006_ueqv_R006_partial_22_1550 := by
  native_decide

/-- Coefficient term 1551 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1551 : Poly :=
[
  term ((-1536 : Rat) / 35) [(5, 1), (6, 1), (11, 1), (13, 2)]
]

/-- Partial product 1551 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1551 : Poly :=
[
  term ((-3072 : Rat) / 35) [(5, 1), (6, 1), (10, 1), (11, 1), (13, 2)],
  term ((1536 : Rat) / 35) [(5, 1), (6, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1551 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1551_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1551
        rs_R006_ueqv_R006_generator_22_1500_1599 =
      rs_R006_ueqv_R006_partial_22_1551 := by
  native_decide

/-- Coefficient term 1552 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1552 : Poly :=
[
  term ((-48 : Rat) / 5) [(5, 1), (6, 1), (12, 1), (13, 1)]
]

/-- Partial product 1552 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1552 : Poly :=
[
  term ((-96 : Rat) / 5) [(5, 1), (6, 1), (10, 1), (12, 1), (13, 1)],
  term ((48 : Rat) / 5) [(5, 1), (6, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1552 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1552_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1552
        rs_R006_ueqv_R006_generator_22_1500_1599 =
      rs_R006_ueqv_R006_partial_22_1552 := by
  native_decide

/-- Coefficient term 1553 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1553 : Poly :=
[
  term ((48 : Rat) / 5) [(5, 1), (6, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 1553 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1553 : Poly :=
[
  term ((96 : Rat) / 5) [(5, 1), (6, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((-48 : Rat) / 5) [(5, 1), (6, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1553 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1553_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1553
        rs_R006_ueqv_R006_generator_22_1500_1599 =
      rs_R006_ueqv_R006_partial_22_1553 := by
  native_decide

/-- Coefficient term 1554 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1554 : Poly :=
[
  term ((-12 : Rat) / 5) [(5, 1), (6, 1), (13, 1)]
]

/-- Partial product 1554 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1554 : Poly :=
[
  term ((-24 : Rat) / 5) [(5, 1), (6, 1), (10, 1), (13, 1)],
  term ((12 : Rat) / 5) [(5, 1), (6, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1554 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1554_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1554
        rs_R006_ueqv_R006_generator_22_1500_1599 =
      rs_R006_ueqv_R006_partial_22_1554 := by
  native_decide

/-- Coefficient term 1555 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1555 : Poly :=
[
  term ((12 : Rat) / 5) [(5, 1), (6, 1), (13, 1), (14, 1)]
]

/-- Partial product 1555 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1555 : Poly :=
[
  term ((24 : Rat) / 5) [(5, 1), (6, 1), (10, 1), (13, 1), (14, 1)],
  term ((-12 : Rat) / 5) [(5, 1), (6, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1555 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1555_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1555
        rs_R006_ueqv_R006_generator_22_1500_1599 =
      rs_R006_ueqv_R006_partial_22_1555 := by
  native_decide

/-- Coefficient term 1556 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1556 : Poly :=
[
  term ((1728 : Rat) / 35) [(5, 1), (6, 1), (13, 3)]
]

/-- Partial product 1556 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1556 : Poly :=
[
  term ((3456 : Rat) / 35) [(5, 1), (6, 1), (10, 1), (13, 3)],
  term ((-1728 : Rat) / 35) [(5, 1), (6, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1556 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1556_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1556
        rs_R006_ueqv_R006_generator_22_1500_1599 =
      rs_R006_ueqv_R006_partial_22_1556 := by
  native_decide

/-- Coefficient term 1557 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1557 : Poly :=
[
  term ((-12 : Rat) / 5) [(5, 1), (7, 1)]
]

/-- Partial product 1557 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1557 : Poly :=
[
  term ((12 : Rat) / 5) [(5, 1), (7, 1)],
  term ((-24 : Rat) / 5) [(5, 1), (7, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1557 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1557_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1557
        rs_R006_ueqv_R006_generator_22_1500_1599 =
      rs_R006_ueqv_R006_partial_22_1557 := by
  native_decide

/-- Coefficient term 1558 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1558 : Poly :=
[
  term ((-288 : Rat) / 35) [(5, 1), (7, 1), (9, 1), (10, 1), (13, 1)]
]

/-- Partial product 1558 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1558 : Poly :=
[
  term ((288 : Rat) / 35) [(5, 1), (7, 1), (9, 1), (10, 1), (13, 1)],
  term ((-576 : Rat) / 35) [(5, 1), (7, 1), (9, 1), (10, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1558 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1558_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1558
        rs_R006_ueqv_R006_generator_22_1500_1599 =
      rs_R006_ueqv_R006_partial_22_1558 := by
  native_decide

/-- Coefficient term 1559 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1559 : Poly :=
[
  term ((-144 : Rat) / 35) [(5, 1), (7, 1), (9, 1), (13, 1)]
]

/-- Partial product 1559 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1559 : Poly :=
[
  term ((-288 : Rat) / 35) [(5, 1), (7, 1), (9, 1), (10, 1), (13, 1)],
  term ((144 : Rat) / 35) [(5, 1), (7, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1559 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1559_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1559
        rs_R006_ueqv_R006_generator_22_1500_1599 =
      rs_R006_ueqv_R006_partial_22_1559 := by
  native_decide

/-- Coefficient term 1560 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1560 : Poly :=
[
  term ((-24 : Rat) / 5) [(5, 1), (7, 1), (10, 1), (12, 1)]
]

/-- Partial product 1560 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1560 : Poly :=
[
  term ((24 : Rat) / 5) [(5, 1), (7, 1), (10, 1), (12, 1)],
  term ((-48 : Rat) / 5) [(5, 1), (7, 1), (10, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1560 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1560_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1560
        rs_R006_ueqv_R006_generator_22_1500_1599 =
      rs_R006_ueqv_R006_partial_22_1560 := by
  native_decide

/-- Coefficient term 1561 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1561 : Poly :=
[
  term ((24 : Rat) / 5) [(5, 1), (7, 1), (10, 1), (12, 1), (14, 1)]
]

/-- Partial product 1561 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1561 : Poly :=
[
  term ((-24 : Rat) / 5) [(5, 1), (7, 1), (10, 1), (12, 1), (14, 1)],
  term ((48 : Rat) / 5) [(5, 1), (7, 1), (10, 2), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1561 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1561_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1561
        rs_R006_ueqv_R006_generator_22_1500_1599 =
      rs_R006_ueqv_R006_partial_22_1561 := by
  native_decide

/-- Coefficient term 1562 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1562 : Poly :=
[
  term ((288 : Rat) / 35) [(5, 1), (7, 1), (10, 1), (13, 2)]
]

/-- Partial product 1562 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1562 : Poly :=
[
  term ((-288 : Rat) / 35) [(5, 1), (7, 1), (10, 1), (13, 2)],
  term ((576 : Rat) / 35) [(5, 1), (7, 1), (10, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1562 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1562_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1562
        rs_R006_ueqv_R006_generator_22_1500_1599 =
      rs_R006_ueqv_R006_partial_22_1562 := by
  native_decide

/-- Coefficient term 1563 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1563 : Poly :=
[
  term ((-24 : Rat) / 5) [(5, 1), (7, 1), (12, 1)]
]

/-- Partial product 1563 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1563 : Poly :=
[
  term ((-48 : Rat) / 5) [(5, 1), (7, 1), (10, 1), (12, 1)],
  term ((24 : Rat) / 5) [(5, 1), (7, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1563 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1563_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1563
        rs_R006_ueqv_R006_generator_22_1500_1599 =
      rs_R006_ueqv_R006_partial_22_1563 := by
  native_decide

/-- Coefficient term 1564 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1564 : Poly :=
[
  term ((24 : Rat) / 5) [(5, 1), (7, 1), (12, 1), (14, 1)]
]

/-- Partial product 1564 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1564 : Poly :=
[
  term ((48 : Rat) / 5) [(5, 1), (7, 1), (10, 1), (12, 1), (14, 1)],
  term ((-24 : Rat) / 5) [(5, 1), (7, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1564 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1564_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1564
        rs_R006_ueqv_R006_generator_22_1500_1599 =
      rs_R006_ueqv_R006_partial_22_1564 := by
  native_decide

/-- Coefficient term 1565 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1565 : Poly :=
[
  term ((24 : Rat) / 5) [(5, 1), (7, 1), (12, 2)]
]

/-- Partial product 1565 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1565 : Poly :=
[
  term ((48 : Rat) / 5) [(5, 1), (7, 1), (10, 1), (12, 2)],
  term ((-24 : Rat) / 5) [(5, 1), (7, 1), (12, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1565 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1565_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1565
        rs_R006_ueqv_R006_generator_22_1500_1599 =
      rs_R006_ueqv_R006_partial_22_1565 := by
  native_decide

/-- Coefficient term 1566 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1566 : Poly :=
[
  term ((-24 : Rat) / 5) [(5, 1), (7, 1), (12, 2), (14, 1)]
]

/-- Partial product 1566 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1566 : Poly :=
[
  term ((-48 : Rat) / 5) [(5, 1), (7, 1), (10, 1), (12, 2), (14, 1)],
  term ((24 : Rat) / 5) [(5, 1), (7, 1), (12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1566 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1566_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1566
        rs_R006_ueqv_R006_generator_22_1500_1599 =
      rs_R006_ueqv_R006_partial_22_1566 := by
  native_decide

/-- Coefficient term 1567 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1567 : Poly :=
[
  term ((144 : Rat) / 35) [(5, 1), (7, 1), (13, 2)]
]

/-- Partial product 1567 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1567 : Poly :=
[
  term ((288 : Rat) / 35) [(5, 1), (7, 1), (10, 1), (13, 2)],
  term ((-144 : Rat) / 35) [(5, 1), (7, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1567 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1567_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1567
        rs_R006_ueqv_R006_generator_22_1500_1599 =
      rs_R006_ueqv_R006_partial_22_1567 := by
  native_decide

/-- Coefficient term 1568 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1568 : Poly :=
[
  term ((12 : Rat) / 5) [(5, 1), (7, 1), (14, 1)]
]

/-- Partial product 1568 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1568 : Poly :=
[
  term ((24 : Rat) / 5) [(5, 1), (7, 1), (10, 1), (14, 1)],
  term ((-12 : Rat) / 5) [(5, 1), (7, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1568 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1568_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1568
        rs_R006_ueqv_R006_generator_22_1500_1599 =
      rs_R006_ueqv_R006_partial_22_1568 := by
  native_decide

/-- Coefficient term 1569 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1569 : Poly :=
[
  term ((-288 : Rat) / 35) [(5, 1), (8, 1), (11, 1), (13, 2)]
]

/-- Partial product 1569 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1569 : Poly :=
[
  term ((-576 : Rat) / 35) [(5, 1), (8, 1), (10, 1), (11, 1), (13, 2)],
  term ((288 : Rat) / 35) [(5, 1), (8, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1569 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1569_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1569
        rs_R006_ueqv_R006_generator_22_1500_1599 =
      rs_R006_ueqv_R006_partial_22_1569 := by
  native_decide

/-- Coefficient term 1570 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1570 : Poly :=
[
  term ((-72 : Rat) / 35) [(5, 1), (8, 1), (12, 1), (13, 1)]
]

/-- Partial product 1570 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1570 : Poly :=
[
  term ((-144 : Rat) / 35) [(5, 1), (8, 1), (10, 1), (12, 1), (13, 1)],
  term ((72 : Rat) / 35) [(5, 1), (8, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1570 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1570_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1570
        rs_R006_ueqv_R006_generator_22_1500_1599 =
      rs_R006_ueqv_R006_partial_22_1570 := by
  native_decide

/-- Coefficient term 1571 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1571 : Poly :=
[
  term ((72 : Rat) / 7) [(5, 1), (8, 1), (13, 1)]
]

/-- Partial product 1571 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1571 : Poly :=
[
  term ((144 : Rat) / 7) [(5, 1), (8, 1), (10, 1), (13, 1)],
  term ((-72 : Rat) / 7) [(5, 1), (8, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1571 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1571_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1571
        rs_R006_ueqv_R006_generator_22_1500_1599 =
      rs_R006_ueqv_R006_partial_22_1571 := by
  native_decide

/-- Coefficient term 1572 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1572 : Poly :=
[
  term ((288 : Rat) / 35) [(5, 1), (9, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 1572 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1572 : Poly :=
[
  term ((576 : Rat) / 35) [(5, 1), (9, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((-288 : Rat) / 35) [(5, 1), (9, 1), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1572 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1572_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1572
        rs_R006_ueqv_R006_generator_22_1500_1599 =
      rs_R006_ueqv_R006_partial_22_1572 := by
  native_decide

/-- Coefficient term 1573 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1573 : Poly :=
[
  term ((288 : Rat) / 35) [(5, 1), (9, 1), (11, 1), (13, 1)]
]

/-- Partial product 1573 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1573 : Poly :=
[
  term ((576 : Rat) / 35) [(5, 1), (9, 1), (10, 1), (11, 1), (13, 1)],
  term ((-288 : Rat) / 35) [(5, 1), (9, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1573 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1573_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1573
        rs_R006_ueqv_R006_generator_22_1500_1599 =
      rs_R006_ueqv_R006_partial_22_1573 := by
  native_decide

/-- Coefficient term 1574 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1574 : Poly :=
[
  term ((1248 : Rat) / 35) [(5, 1), (10, 1), (11, 1), (13, 2)]
]

/-- Partial product 1574 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1574 : Poly :=
[
  term ((-1248 : Rat) / 35) [(5, 1), (10, 1), (11, 1), (13, 2)],
  term ((2496 : Rat) / 35) [(5, 1), (10, 2), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1574 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1574_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1574
        rs_R006_ueqv_R006_generator_22_1500_1599 =
      rs_R006_ueqv_R006_partial_22_1574 := by
  native_decide

/-- Coefficient term 1575 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1575 : Poly :=
[
  term ((24 : Rat) / 5) [(5, 1), (10, 1), (12, 1), (13, 1)]
]

/-- Partial product 1575 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1575 : Poly :=
[
  term ((-24 : Rat) / 5) [(5, 1), (10, 1), (12, 1), (13, 1)],
  term ((48 : Rat) / 5) [(5, 1), (10, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1575 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1575_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1575
        rs_R006_ueqv_R006_generator_22_1500_1599 =
      rs_R006_ueqv_R006_partial_22_1575 := by
  native_decide

/-- Coefficient term 1576 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1576 : Poly :=
[
  term ((-24 : Rat) / 5) [(5, 1), (10, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 1576 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1576 : Poly :=
[
  term ((24 : Rat) / 5) [(5, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((-48 : Rat) / 5) [(5, 1), (10, 2), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1576 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1576_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1576
        rs_R006_ueqv_R006_generator_22_1500_1599 =
      rs_R006_ueqv_R006_partial_22_1576 := by
  native_decide

/-- Coefficient term 1577 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1577 : Poly :=
[
  term ((12 : Rat) / 5) [(5, 1), (10, 1), (13, 1)]
]

/-- Partial product 1577 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1577 : Poly :=
[
  term ((-12 : Rat) / 5) [(5, 1), (10, 1), (13, 1)],
  term ((24 : Rat) / 5) [(5, 1), (10, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1577 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1577_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1577
        rs_R006_ueqv_R006_generator_22_1500_1599 =
      rs_R006_ueqv_R006_partial_22_1577 := by
  native_decide

/-- Coefficient term 1578 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1578 : Poly :=
[
  term ((-12 : Rat) / 5) [(5, 1), (10, 1), (13, 1), (14, 1)]
]

/-- Partial product 1578 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1578 : Poly :=
[
  term ((12 : Rat) / 5) [(5, 1), (10, 1), (13, 1), (14, 1)],
  term ((-24 : Rat) / 5) [(5, 1), (10, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1578 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1578_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1578
        rs_R006_ueqv_R006_generator_22_1500_1599 =
      rs_R006_ueqv_R006_partial_22_1578 := by
  native_decide

/-- Coefficient term 1579 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1579 : Poly :=
[
  term ((-864 : Rat) / 35) [(5, 1), (10, 1), (13, 3)]
]

/-- Partial product 1579 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1579 : Poly :=
[
  term ((864 : Rat) / 35) [(5, 1), (10, 1), (13, 3)],
  term ((-1728 : Rat) / 35) [(5, 1), (10, 2), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1579 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1579_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1579
        rs_R006_ueqv_R006_generator_22_1500_1599 =
      rs_R006_ueqv_R006_partial_22_1579 := by
  native_decide

/-- Coefficient term 1580 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1580 : Poly :=
[
  term ((-12 : Rat) / 5) [(5, 1), (11, 1)]
]

/-- Partial product 1580 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1580 : Poly :=
[
  term ((-24 : Rat) / 5) [(5, 1), (10, 1), (11, 1)],
  term ((12 : Rat) / 5) [(5, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1580 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1580_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1580
        rs_R006_ueqv_R006_generator_22_1500_1599 =
      rs_R006_ueqv_R006_partial_22_1580 := by
  native_decide

/-- Coefficient term 1581 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1581 : Poly :=
[
  term ((-36 : Rat) / 5) [(5, 1), (11, 1), (12, 1)]
]

/-- Partial product 1581 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1581 : Poly :=
[
  term ((-72 : Rat) / 5) [(5, 1), (10, 1), (11, 1), (12, 1)],
  term ((36 : Rat) / 5) [(5, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1581 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1581_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1581
        rs_R006_ueqv_R006_generator_22_1500_1599 =
      rs_R006_ueqv_R006_partial_22_1581 := by
  native_decide

/-- Coefficient term 1582 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1582 : Poly :=
[
  term ((864 : Rat) / 35) [(5, 1), (11, 1), (12, 1), (13, 2)]
]

/-- Partial product 1582 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1582 : Poly :=
[
  term ((1728 : Rat) / 35) [(5, 1), (10, 1), (11, 1), (12, 1), (13, 2)],
  term ((-864 : Rat) / 35) [(5, 1), (11, 1), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1582 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1582_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1582
        rs_R006_ueqv_R006_generator_22_1500_1599 =
      rs_R006_ueqv_R006_partial_22_1582 := by
  native_decide

/-- Coefficient term 1583 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1583 : Poly :=
[
  term ((36 : Rat) / 5) [(5, 1), (11, 1), (12, 1), (14, 1)]
]

/-- Partial product 1583 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1583 : Poly :=
[
  term ((72 : Rat) / 5) [(5, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((-36 : Rat) / 5) [(5, 1), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1583 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1583_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1583
        rs_R006_ueqv_R006_generator_22_1500_1599 =
      rs_R006_ueqv_R006_partial_22_1583 := by
  native_decide

/-- Coefficient term 1584 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1584 : Poly :=
[
  term ((-24 : Rat) / 5) [(5, 1), (11, 1), (12, 2)]
]

/-- Partial product 1584 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1584 : Poly :=
[
  term ((-48 : Rat) / 5) [(5, 1), (10, 1), (11, 1), (12, 2)],
  term ((24 : Rat) / 5) [(5, 1), (11, 1), (12, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1584 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1584_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1584
        rs_R006_ueqv_R006_generator_22_1500_1599 =
      rs_R006_ueqv_R006_partial_22_1584 := by
  native_decide

/-- Coefficient term 1585 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1585 : Poly :=
[
  term ((24 : Rat) / 5) [(5, 1), (11, 1), (12, 2), (14, 1)]
]

/-- Partial product 1585 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1585 : Poly :=
[
  term ((48 : Rat) / 5) [(5, 1), (10, 1), (11, 1), (12, 2), (14, 1)],
  term ((-24 : Rat) / 5) [(5, 1), (11, 1), (12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1585 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1585_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1585
        rs_R006_ueqv_R006_generator_22_1500_1599 =
      rs_R006_ueqv_R006_partial_22_1585 := by
  native_decide

/-- Coefficient term 1586 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1586 : Poly :=
[
  term ((1488 : Rat) / 35) [(5, 1), (11, 1), (13, 2)]
]

/-- Partial product 1586 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1586 : Poly :=
[
  term ((2976 : Rat) / 35) [(5, 1), (10, 1), (11, 1), (13, 2)],
  term ((-1488 : Rat) / 35) [(5, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1586 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1586_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1586
        rs_R006_ueqv_R006_generator_22_1500_1599 =
      rs_R006_ueqv_R006_partial_22_1586 := by
  native_decide

/-- Coefficient term 1587 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1587 : Poly :=
[
  term ((12 : Rat) / 5) [(5, 1), (11, 1), (14, 1)]
]

/-- Partial product 1587 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1587 : Poly :=
[
  term ((24 : Rat) / 5) [(5, 1), (10, 1), (11, 1), (14, 1)],
  term ((-12 : Rat) / 5) [(5, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1587 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1587_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1587
        rs_R006_ueqv_R006_generator_22_1500_1599 =
      rs_R006_ueqv_R006_partial_22_1587 := by
  native_decide

/-- Coefficient term 1588 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1588 : Poly :=
[
  term ((-1248 : Rat) / 35) [(5, 1), (11, 2), (12, 1), (13, 1)]
]

/-- Partial product 1588 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1588 : Poly :=
[
  term ((-2496 : Rat) / 35) [(5, 1), (10, 1), (11, 2), (12, 1), (13, 1)],
  term ((1248 : Rat) / 35) [(5, 1), (11, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1588 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1588_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1588
        rs_R006_ueqv_R006_generator_22_1500_1599 =
      rs_R006_ueqv_R006_partial_22_1588 := by
  native_decide

/-- Coefficient term 1589 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1589 : Poly :=
[
  term ((-1248 : Rat) / 35) [(5, 1), (11, 2), (13, 1)]
]

/-- Partial product 1589 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1589 : Poly :=
[
  term ((-2496 : Rat) / 35) [(5, 1), (10, 1), (11, 2), (13, 1)],
  term ((1248 : Rat) / 35) [(5, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1589 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1589_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1589
        rs_R006_ueqv_R006_generator_22_1500_1599 =
      rs_R006_ueqv_R006_partial_22_1589 := by
  native_decide

/-- Coefficient term 1590 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1590 : Poly :=
[
  term ((204 : Rat) / 35) [(5, 1), (12, 1), (13, 1)]
]

/-- Partial product 1590 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1590 : Poly :=
[
  term ((408 : Rat) / 35) [(5, 1), (10, 1), (12, 1), (13, 1)],
  term ((-204 : Rat) / 35) [(5, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1590 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1590_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1590
        rs_R006_ueqv_R006_generator_22_1500_1599 =
      rs_R006_ueqv_R006_partial_22_1590 := by
  native_decide

/-- Coefficient term 1591 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1591 : Poly :=
[
  term ((-12 : Rat) / 5) [(5, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 1591 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1591 : Poly :=
[
  term ((-24 : Rat) / 5) [(5, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((12 : Rat) / 5) [(5, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1591 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1591_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1591
        rs_R006_ueqv_R006_generator_22_1500_1599 =
      rs_R006_ueqv_R006_partial_22_1591 := by
  native_decide

/-- Coefficient term 1592 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1592 : Poly :=
[
  term ((-432 : Rat) / 35) [(5, 1), (12, 2), (13, 1)]
]

/-- Partial product 1592 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1592 : Poly :=
[
  term ((-864 : Rat) / 35) [(5, 1), (10, 1), (12, 2), (13, 1)],
  term ((432 : Rat) / 35) [(5, 1), (12, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1592 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1592_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1592
        rs_R006_ueqv_R006_generator_22_1500_1599 =
      rs_R006_ueqv_R006_partial_22_1592 := by
  native_decide

/-- Coefficient term 1593 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1593 : Poly :=
[
  term ((66 : Rat) / 35) [(5, 1), (13, 1)]
]

/-- Partial product 1593 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1593 : Poly :=
[
  term ((132 : Rat) / 35) [(5, 1), (10, 1), (13, 1)],
  term ((-66 : Rat) / 35) [(5, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1593 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1593_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1593
        rs_R006_ueqv_R006_generator_22_1500_1599 =
      rs_R006_ueqv_R006_partial_22_1593 := by
  native_decide

/-- Coefficient term 1594 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1594 : Poly :=
[
  term ((-6 : Rat) / 5) [(5, 1), (13, 1), (14, 1)]
]

/-- Partial product 1594 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1594 : Poly :=
[
  term ((-12 : Rat) / 5) [(5, 1), (10, 1), (13, 1), (14, 1)],
  term ((6 : Rat) / 5) [(5, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1594 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1594_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1594
        rs_R006_ueqv_R006_generator_22_1500_1599 =
      rs_R006_ueqv_R006_partial_22_1594 := by
  native_decide

/-- Coefficient term 1595 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1595 : Poly :=
[
  term ((-432 : Rat) / 35) [(5, 1), (13, 3)]
]

/-- Partial product 1595 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1595 : Poly :=
[
  term ((-864 : Rat) / 35) [(5, 1), (10, 1), (13, 3)],
  term ((432 : Rat) / 35) [(5, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1595 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1595_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1595
        rs_R006_ueqv_R006_generator_22_1500_1599 =
      rs_R006_ueqv_R006_partial_22_1595 := by
  native_decide

/-- Coefficient term 1596 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1596 : Poly :=
[
  term ((21 : Rat) / 5) [(6, 1)]
]

/-- Partial product 1596 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1596 : Poly :=
[
  term ((-21 : Rat) / 5) [(6, 1)],
  term ((42 : Rat) / 5) [(6, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1596 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1596_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1596
        rs_R006_ueqv_R006_generator_22_1500_1599 =
      rs_R006_ueqv_R006_partial_22_1596 := by
  native_decide

/-- Coefficient term 1597 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1597 : Poly :=
[
  term ((276 : Rat) / 5) [(6, 1), (7, 1), (9, 1)]
]

/-- Partial product 1597 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1597 : Poly :=
[
  term ((-276 : Rat) / 5) [(6, 1), (7, 1), (9, 1)],
  term ((552 : Rat) / 5) [(6, 1), (7, 1), (9, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1597 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1597_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1597
        rs_R006_ueqv_R006_generator_22_1500_1599 =
      rs_R006_ueqv_R006_partial_22_1597 := by
  native_decide

/-- Coefficient term 1598 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1598 : Poly :=
[
  term ((72 : Rat) / 35) [(6, 1), (7, 1), (9, 1), (11, 1), (13, 1)]
]

/-- Partial product 1598 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1598 : Poly :=
[
  term ((144 : Rat) / 35) [(6, 1), (7, 1), (9, 1), (10, 1), (11, 1), (13, 1)],
  term ((-72 : Rat) / 35) [(6, 1), (7, 1), (9, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1598 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1598_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1598
        rs_R006_ueqv_R006_generator_22_1500_1599 =
      rs_R006_ueqv_R006_partial_22_1598 := by
  native_decide

/-- Coefficient term 1599 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1599 : Poly :=
[
  term ((-216 : Rat) / 5) [(6, 1), (7, 1), (9, 1), (14, 1)]
]

/-- Partial product 1599 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1599 : Poly :=
[
  term ((-432 : Rat) / 5) [(6, 1), (7, 1), (9, 1), (10, 1), (14, 1)],
  term ((216 : Rat) / 5) [(6, 1), (7, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1599 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1599_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1599
        rs_R006_ueqv_R006_generator_22_1500_1599 =
      rs_R006_ueqv_R006_partial_22_1599 := by
  native_decide

/-- Partial products in this block. -/
def rs_R006_ueqv_R006_partials_22_1500_1599 : List Poly :=
[
  rs_R006_ueqv_R006_partial_22_1500,
  rs_R006_ueqv_R006_partial_22_1501,
  rs_R006_ueqv_R006_partial_22_1502,
  rs_R006_ueqv_R006_partial_22_1503,
  rs_R006_ueqv_R006_partial_22_1504,
  rs_R006_ueqv_R006_partial_22_1505,
  rs_R006_ueqv_R006_partial_22_1506,
  rs_R006_ueqv_R006_partial_22_1507,
  rs_R006_ueqv_R006_partial_22_1508,
  rs_R006_ueqv_R006_partial_22_1509,
  rs_R006_ueqv_R006_partial_22_1510,
  rs_R006_ueqv_R006_partial_22_1511,
  rs_R006_ueqv_R006_partial_22_1512,
  rs_R006_ueqv_R006_partial_22_1513,
  rs_R006_ueqv_R006_partial_22_1514,
  rs_R006_ueqv_R006_partial_22_1515,
  rs_R006_ueqv_R006_partial_22_1516,
  rs_R006_ueqv_R006_partial_22_1517,
  rs_R006_ueqv_R006_partial_22_1518,
  rs_R006_ueqv_R006_partial_22_1519,
  rs_R006_ueqv_R006_partial_22_1520,
  rs_R006_ueqv_R006_partial_22_1521,
  rs_R006_ueqv_R006_partial_22_1522,
  rs_R006_ueqv_R006_partial_22_1523,
  rs_R006_ueqv_R006_partial_22_1524,
  rs_R006_ueqv_R006_partial_22_1525,
  rs_R006_ueqv_R006_partial_22_1526,
  rs_R006_ueqv_R006_partial_22_1527,
  rs_R006_ueqv_R006_partial_22_1528,
  rs_R006_ueqv_R006_partial_22_1529,
  rs_R006_ueqv_R006_partial_22_1530,
  rs_R006_ueqv_R006_partial_22_1531,
  rs_R006_ueqv_R006_partial_22_1532,
  rs_R006_ueqv_R006_partial_22_1533,
  rs_R006_ueqv_R006_partial_22_1534,
  rs_R006_ueqv_R006_partial_22_1535,
  rs_R006_ueqv_R006_partial_22_1536,
  rs_R006_ueqv_R006_partial_22_1537,
  rs_R006_ueqv_R006_partial_22_1538,
  rs_R006_ueqv_R006_partial_22_1539,
  rs_R006_ueqv_R006_partial_22_1540,
  rs_R006_ueqv_R006_partial_22_1541,
  rs_R006_ueqv_R006_partial_22_1542,
  rs_R006_ueqv_R006_partial_22_1543,
  rs_R006_ueqv_R006_partial_22_1544,
  rs_R006_ueqv_R006_partial_22_1545,
  rs_R006_ueqv_R006_partial_22_1546,
  rs_R006_ueqv_R006_partial_22_1547,
  rs_R006_ueqv_R006_partial_22_1548,
  rs_R006_ueqv_R006_partial_22_1549,
  rs_R006_ueqv_R006_partial_22_1550,
  rs_R006_ueqv_R006_partial_22_1551,
  rs_R006_ueqv_R006_partial_22_1552,
  rs_R006_ueqv_R006_partial_22_1553,
  rs_R006_ueqv_R006_partial_22_1554,
  rs_R006_ueqv_R006_partial_22_1555,
  rs_R006_ueqv_R006_partial_22_1556,
  rs_R006_ueqv_R006_partial_22_1557,
  rs_R006_ueqv_R006_partial_22_1558,
  rs_R006_ueqv_R006_partial_22_1559,
  rs_R006_ueqv_R006_partial_22_1560,
  rs_R006_ueqv_R006_partial_22_1561,
  rs_R006_ueqv_R006_partial_22_1562,
  rs_R006_ueqv_R006_partial_22_1563,
  rs_R006_ueqv_R006_partial_22_1564,
  rs_R006_ueqv_R006_partial_22_1565,
  rs_R006_ueqv_R006_partial_22_1566,
  rs_R006_ueqv_R006_partial_22_1567,
  rs_R006_ueqv_R006_partial_22_1568,
  rs_R006_ueqv_R006_partial_22_1569,
  rs_R006_ueqv_R006_partial_22_1570,
  rs_R006_ueqv_R006_partial_22_1571,
  rs_R006_ueqv_R006_partial_22_1572,
  rs_R006_ueqv_R006_partial_22_1573,
  rs_R006_ueqv_R006_partial_22_1574,
  rs_R006_ueqv_R006_partial_22_1575,
  rs_R006_ueqv_R006_partial_22_1576,
  rs_R006_ueqv_R006_partial_22_1577,
  rs_R006_ueqv_R006_partial_22_1578,
  rs_R006_ueqv_R006_partial_22_1579,
  rs_R006_ueqv_R006_partial_22_1580,
  rs_R006_ueqv_R006_partial_22_1581,
  rs_R006_ueqv_R006_partial_22_1582,
  rs_R006_ueqv_R006_partial_22_1583,
  rs_R006_ueqv_R006_partial_22_1584,
  rs_R006_ueqv_R006_partial_22_1585,
  rs_R006_ueqv_R006_partial_22_1586,
  rs_R006_ueqv_R006_partial_22_1587,
  rs_R006_ueqv_R006_partial_22_1588,
  rs_R006_ueqv_R006_partial_22_1589,
  rs_R006_ueqv_R006_partial_22_1590,
  rs_R006_ueqv_R006_partial_22_1591,
  rs_R006_ueqv_R006_partial_22_1592,
  rs_R006_ueqv_R006_partial_22_1593,
  rs_R006_ueqv_R006_partial_22_1594,
  rs_R006_ueqv_R006_partial_22_1595,
  rs_R006_ueqv_R006_partial_22_1596,
  rs_R006_ueqv_R006_partial_22_1597,
  rs_R006_ueqv_R006_partial_22_1598,
  rs_R006_ueqv_R006_partial_22_1599
]

/-- Sum of partial products in this block. -/
def rs_R006_ueqv_R006_block_22_1500_1599 : Poly :=
[
  term ((192 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (10, 1), (12, 2), (14, 1), (16, 1)],
  term ((384 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (10, 1), (12, 2), (16, 1)],
  term ((144 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (10, 1), (14, 1)],
  term ((-48 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-96 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((-96 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (12, 2), (14, 1), (16, 1)],
  term ((-192 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (12, 2), (16, 1)],
  term ((-72 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (14, 1)],
  term ((24 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((48 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (16, 1)],
  term ((1152 : Rat) / 5) [(3, 2), (9, 1), (10, 1), (11, 1)],
  term ((576 : Rat) / 5) [(3, 2), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((-192 : Rat) / 5) [(3, 2), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-384 : Rat) / 5) [(3, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-576 : Rat) / 5) [(3, 2), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-288 : Rat) / 5) [(3, 2), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((96 : Rat) / 5) [(3, 2), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((192 : Rat) / 5) [(3, 2), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-576 : Rat) / 5) [(3, 2), (9, 1), (10, 1), (13, 1)],
  term ((-288 : Rat) / 5) [(3, 2), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((96 : Rat) / 5) [(3, 2), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((192 : Rat) / 5) [(3, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-576 : Rat) / 5) [(3, 2), (9, 1), (11, 1)],
  term ((-288 : Rat) / 5) [(3, 2), (9, 1), (11, 1), (14, 1)],
  term ((96 : Rat) / 5) [(3, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((192 : Rat) / 5) [(3, 2), (9, 1), (11, 1), (16, 1)],
  term ((288 : Rat) / 5) [(3, 2), (9, 1), (12, 1), (13, 1)],
  term ((144 : Rat) / 5) [(3, 2), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-48 : Rat) / 5) [(3, 2), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-96 : Rat) / 5) [(3, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((288 : Rat) / 5) [(3, 2), (9, 1), (13, 1)],
  term ((144 : Rat) / 5) [(3, 2), (9, 1), (13, 1), (14, 1)],
  term ((-48 : Rat) / 5) [(3, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-96 : Rat) / 5) [(3, 2), (9, 1), (13, 1), (16, 1)],
  term ((-24 : Rat) / 5) [(4, 1)],
  term ((12 : Rat) / 5) [(4, 1), (6, 1)],
  term ((288 : Rat) / 35) [(4, 1), (6, 1), (8, 1), (10, 1), (11, 1), (13, 1)],
  term ((-576 : Rat) / 35) [(4, 1), (6, 1), (8, 1), (10, 1), (13, 2)],
  term ((-144 : Rat) / 35) [(4, 1), (6, 1), (8, 1), (11, 1), (13, 1)],
  term ((288 : Rat) / 35) [(4, 1), (6, 1), (8, 1), (13, 2)],
  term ((144 : Rat) / 35) [(4, 1), (6, 1), (9, 1), (10, 1), (13, 1)],
  term ((-72 : Rat) / 35) [(4, 1), (6, 1), (9, 1), (13, 1)],
  term ((-24 : Rat) / 5) [(4, 1), (6, 1), (10, 1)],
  term ((288 : Rat) / 35) [(4, 1), (6, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((-288 : Rat) / 35) [(4, 1), (6, 1), (10, 1), (11, 1), (13, 1)],
  term ((24 : Rat) / 5) [(4, 1), (6, 1), (10, 1), (14, 1)],
  term ((-144 : Rat) / 35) [(4, 1), (6, 1), (11, 1), (12, 1), (13, 1)],
  term ((144 : Rat) / 35) [(4, 1), (6, 1), (11, 1), (13, 1)],
  term ((-12 : Rat) / 5) [(4, 1), (6, 1), (14, 1)],
  term ((576 : Rat) / 35) [(4, 1), (7, 1), (8, 1), (10, 1), (12, 1), (13, 1)],
  term ((432 : Rat) / 35) [(4, 1), (7, 1), (8, 1), (10, 1), (13, 1)],
  term ((-288 : Rat) / 35) [(4, 1), (7, 1), (8, 1), (10, 2), (13, 1)],
  term ((-288 : Rat) / 35) [(4, 1), (7, 1), (8, 1), (12, 1), (13, 1)],
  term ((-144 : Rat) / 35) [(4, 1), (7, 1), (8, 1), (13, 1)],
  term ((-432 : Rat) / 35) [(4, 1), (7, 1), (10, 1), (12, 1), (13, 1)],
  term ((-144 : Rat) / 35) [(4, 1), (7, 1), (10, 1), (13, 1)],
  term ((-288 : Rat) / 35) [(4, 1), (7, 1), (10, 2), (12, 1), (13, 1)],
  term ((288 : Rat) / 35) [(4, 1), (7, 1), (10, 2), (13, 1)],
  term ((288 : Rat) / 35) [(4, 1), (7, 1), (12, 1), (13, 1)],
  term ((-576 : Rat) / 35) [(4, 1), (8, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((144 : Rat) / 35) [(4, 1), (8, 1), (10, 1), (11, 1), (13, 1)],
  term ((288 : Rat) / 35) [(4, 1), (8, 1), (10, 2), (13, 2)],
  term ((288 : Rat) / 35) [(4, 1), (8, 1), (11, 1), (12, 1), (13, 1)],
  term ((-72 : Rat) / 35) [(4, 1), (8, 1), (11, 1), (13, 1)],
  term ((-72 : Rat) / 35) [(4, 1), (8, 1), (13, 2)],
  term ((-144 : Rat) / 35) [(4, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-144 : Rat) / 35) [(4, 1), (9, 1), (10, 1), (13, 1)],
  term ((288 : Rat) / 35) [(4, 1), (9, 1), (10, 2), (12, 1), (13, 1)],
  term ((-432 : Rat) / 35) [(4, 1), (9, 1), (10, 2), (13, 1)],
  term ((36 : Rat) / 7) [(4, 1), (9, 1), (13, 1)],
  term ((48 : Rat) / 5) [(4, 1), (10, 1)],
  term ((-288 : Rat) / 35) [(4, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((-288 : Rat) / 35) [(4, 1), (10, 1), (11, 1), (13, 1)],
  term ((48 : Rat) / 5) [(4, 1), (10, 1), (12, 1)],
  term ((-48 : Rat) / 5) [(4, 1), (10, 1), (12, 1), (14, 1)],
  term ((-72 : Rat) / 5) [(4, 1), (10, 1), (14, 1)],
  term ((288 : Rat) / 35) [(4, 1), (10, 2), (13, 2)],
  term ((144 : Rat) / 35) [(4, 1), (11, 1), (12, 1), (13, 1)],
  term ((144 : Rat) / 35) [(4, 1), (11, 1), (13, 1)],
  term ((-24 : Rat) / 5) [(4, 1), (12, 1)],
  term ((24 : Rat) / 5) [(4, 1), (12, 1), (14, 1)],
  term ((-72 : Rat) / 35) [(4, 1), (13, 2)],
  term ((36 : Rat) / 5) [(4, 1), (14, 1)],
  term ((-24 : Rat) / 5) [(5, 1), (6, 1), (7, 1)],
  term ((48 : Rat) / 5) [(5, 1), (6, 1), (7, 1), (10, 1)],
  term ((-48 : Rat) / 5) [(5, 1), (6, 1), (7, 1), (10, 1), (14, 1)],
  term ((24 : Rat) / 5) [(5, 1), (6, 1), (7, 1), (14, 1)],
  term ((576 : Rat) / 35) [(5, 1), (6, 1), (9, 1), (10, 1), (11, 1), (13, 1)],
  term ((1728 : Rat) / 35) [(5, 1), (6, 1), (9, 1), (10, 1), (13, 2)],
  term ((-288 : Rat) / 35) [(5, 1), (6, 1), (9, 1), (11, 1), (13, 1)],
  term ((-864 : Rat) / 35) [(5, 1), (6, 1), (9, 1), (13, 2)],
  term ((48 : Rat) / 5) [(5, 1), (6, 1), (10, 1), (11, 1), (12, 1)],
  term ((-48 : Rat) / 5) [(5, 1), (6, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((-3072 : Rat) / 35) [(5, 1), (6, 1), (10, 1), (11, 1), (13, 2)],
  term ((-96 : Rat) / 5) [(5, 1), (6, 1), (10, 1), (12, 1), (13, 1)],
  term ((96 : Rat) / 5) [(5, 1), (6, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((-24 : Rat) / 5) [(5, 1), (6, 1), (10, 1), (13, 1)],
  term ((24 : Rat) / 5) [(5, 1), (6, 1), (10, 1), (13, 1), (14, 1)],
  term ((3456 : Rat) / 35) [(5, 1), (6, 1), (10, 1), (13, 3)],
  term ((-24 : Rat) / 5) [(5, 1), (6, 1), (11, 1), (12, 1)],
  term ((24 : Rat) / 5) [(5, 1), (6, 1), (11, 1), (12, 1), (14, 1)],
  term ((1536 : Rat) / 35) [(5, 1), (6, 1), (11, 1), (13, 2)],
  term ((48 : Rat) / 5) [(5, 1), (6, 1), (12, 1), (13, 1)],
  term ((-48 : Rat) / 5) [(5, 1), (6, 1), (12, 1), (13, 1), (14, 1)],
  term ((12 : Rat) / 5) [(5, 1), (6, 1), (13, 1)],
  term ((-12 : Rat) / 5) [(5, 1), (6, 1), (13, 1), (14, 1)],
  term ((-1728 : Rat) / 35) [(5, 1), (6, 1), (13, 3)],
  term ((12 : Rat) / 5) [(5, 1), (7, 1)],
  term ((-576 : Rat) / 35) [(5, 1), (7, 1), (9, 1), (10, 2), (13, 1)],
  term ((144 : Rat) / 35) [(5, 1), (7, 1), (9, 1), (13, 1)],
  term ((-24 : Rat) / 5) [(5, 1), (7, 1), (10, 1)],
  term ((-24 : Rat) / 5) [(5, 1), (7, 1), (10, 1), (12, 1)],
  term ((24 : Rat) / 5) [(5, 1), (7, 1), (10, 1), (12, 1), (14, 1)],
  term ((48 : Rat) / 5) [(5, 1), (7, 1), (10, 1), (12, 2)],
  term ((-48 : Rat) / 5) [(5, 1), (7, 1), (10, 1), (12, 2), (14, 1)],
  term ((24 : Rat) / 5) [(5, 1), (7, 1), (10, 1), (14, 1)],
  term ((-48 : Rat) / 5) [(5, 1), (7, 1), (10, 2), (12, 1)],
  term ((48 : Rat) / 5) [(5, 1), (7, 1), (10, 2), (12, 1), (14, 1)],
  term ((576 : Rat) / 35) [(5, 1), (7, 1), (10, 2), (13, 2)],
  term ((24 : Rat) / 5) [(5, 1), (7, 1), (12, 1)],
  term ((-24 : Rat) / 5) [(5, 1), (7, 1), (12, 1), (14, 1)],
  term ((-24 : Rat) / 5) [(5, 1), (7, 1), (12, 2)],
  term ((24 : Rat) / 5) [(5, 1), (7, 1), (12, 2), (14, 1)],
  term ((-144 : Rat) / 35) [(5, 1), (7, 1), (13, 2)],
  term ((-12 : Rat) / 5) [(5, 1), (7, 1), (14, 1)],
  term ((-576 : Rat) / 35) [(5, 1), (8, 1), (10, 1), (11, 1), (13, 2)],
  term ((-144 : Rat) / 35) [(5, 1), (8, 1), (10, 1), (12, 1), (13, 1)],
  term ((144 : Rat) / 7) [(5, 1), (8, 1), (10, 1), (13, 1)],
  term ((288 : Rat) / 35) [(5, 1), (8, 1), (11, 1), (13, 2)],
  term ((72 : Rat) / 35) [(5, 1), (8, 1), (12, 1), (13, 1)],
  term ((-72 : Rat) / 7) [(5, 1), (8, 1), (13, 1)],
  term ((576 : Rat) / 35) [(5, 1), (9, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((576 : Rat) / 35) [(5, 1), (9, 1), (10, 1), (11, 1), (13, 1)],
  term ((-288 : Rat) / 35) [(5, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((-288 : Rat) / 35) [(5, 1), (9, 1), (11, 1), (13, 1)],
  term ((-24 : Rat) / 5) [(5, 1), (10, 1), (11, 1)],
  term ((-72 : Rat) / 5) [(5, 1), (10, 1), (11, 1), (12, 1)],
  term ((1728 : Rat) / 35) [(5, 1), (10, 1), (11, 1), (12, 1), (13, 2)],
  term ((72 : Rat) / 5) [(5, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((-48 : Rat) / 5) [(5, 1), (10, 1), (11, 1), (12, 2)],
  term ((48 : Rat) / 5) [(5, 1), (10, 1), (11, 1), (12, 2), (14, 1)],
  term ((1728 : Rat) / 35) [(5, 1), (10, 1), (11, 1), (13, 2)],
  term ((24 : Rat) / 5) [(5, 1), (10, 1), (11, 1), (14, 1)],
  term ((-2496 : Rat) / 35) [(5, 1), (10, 1), (11, 2), (12, 1), (13, 1)],
  term ((-2496 : Rat) / 35) [(5, 1), (10, 1), (11, 2), (13, 1)],
  term ((48 : Rat) / 7) [(5, 1), (10, 1), (12, 1), (13, 1)],
  term ((-864 : Rat) / 35) [(5, 1), (10, 1), (12, 2), (13, 1)],
  term ((48 : Rat) / 35) [(5, 1), (10, 1), (13, 1)],
  term ((2496 : Rat) / 35) [(5, 1), (10, 2), (11, 1), (13, 2)],
  term ((48 : Rat) / 5) [(5, 1), (10, 2), (12, 1), (13, 1)],
  term ((-48 : Rat) / 5) [(5, 1), (10, 2), (12, 1), (13, 1), (14, 1)],
  term ((24 : Rat) / 5) [(5, 1), (10, 2), (13, 1)],
  term ((-24 : Rat) / 5) [(5, 1), (10, 2), (13, 1), (14, 1)],
  term ((-1728 : Rat) / 35) [(5, 1), (10, 2), (13, 3)],
  term ((12 : Rat) / 5) [(5, 1), (11, 1)],
  term ((36 : Rat) / 5) [(5, 1), (11, 1), (12, 1)],
  term ((-864 : Rat) / 35) [(5, 1), (11, 1), (12, 1), (13, 2)],
  term ((-36 : Rat) / 5) [(5, 1), (11, 1), (12, 1), (14, 1)],
  term ((24 : Rat) / 5) [(5, 1), (11, 1), (12, 2)],
  term ((-24 : Rat) / 5) [(5, 1), (11, 1), (12, 2), (14, 1)],
  term ((-1488 : Rat) / 35) [(5, 1), (11, 1), (13, 2)],
  term ((-12 : Rat) / 5) [(5, 1), (11, 1), (14, 1)],
  term ((1248 : Rat) / 35) [(5, 1), (11, 2), (12, 1), (13, 1)],
  term ((1248 : Rat) / 35) [(5, 1), (11, 2), (13, 1)],
  term ((-204 : Rat) / 35) [(5, 1), (12, 1), (13, 1)],
  term ((12 : Rat) / 5) [(5, 1), (12, 1), (13, 1), (14, 1)],
  term ((432 : Rat) / 35) [(5, 1), (12, 2), (13, 1)],
  term ((-66 : Rat) / 35) [(5, 1), (13, 1)],
  term ((6 : Rat) / 5) [(5, 1), (13, 1), (14, 1)],
  term ((432 : Rat) / 35) [(5, 1), (13, 3)],
  term ((-21 : Rat) / 5) [(6, 1)],
  term ((-276 : Rat) / 5) [(6, 1), (7, 1), (9, 1)],
  term ((552 : Rat) / 5) [(6, 1), (7, 1), (9, 1), (10, 1)],
  term ((144 : Rat) / 35) [(6, 1), (7, 1), (9, 1), (10, 1), (11, 1), (13, 1)],
  term ((-432 : Rat) / 5) [(6, 1), (7, 1), (9, 1), (10, 1), (14, 1)],
  term ((-72 : Rat) / 35) [(6, 1), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((216 : Rat) / 5) [(6, 1), (7, 1), (9, 1), (14, 1)],
  term ((42 : Rat) / 5) [(6, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 22, terms 1500 through 1599. -/
theorem rs_R006_ueqv_R006_block_22_1500_1599_valid :
    checkProductSumEq rs_R006_ueqv_R006_partials_22_1500_1599
      rs_R006_ueqv_R006_block_22_1500_1599 = true := by
  native_decide

end R006UeqvR006TermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
