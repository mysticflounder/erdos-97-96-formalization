/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R005:u=v:R005NYN, term block 0:600-677

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R005UeqvR005NYNTermShards

/-- Generator polynomial 0 for relaxed split surplus certificate `R005:u=v:R005NYN`. -/
def rs_R005_ueqv_R005NYN_generator_00_0600_0677 : Poly :=
[
  term (1 : Rat) [(0, 2)],
  term (1 : Rat) [(1, 2)],
  term (-1 : Rat) [(2, 2)],
  term (-1 : Rat) [(3, 2)]
]

/-- Coefficient term 600 from coefficient polynomial 0. -/
def rs_R005_ueqv_R005NYN_coefficient_00_0600 : Poly :=
[
  term ((113001540 : Rat) / 385571) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 600 for generator 0. -/
def rs_R005_ueqv_R005NYN_partial_00_0600 : Poly :=
[
  term ((113001540 : Rat) / 385571) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((113001540 : Rat) / 385571) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((-113001540 : Rat) / 385571) [(2, 2), (5, 1), (15, 1), (16, 1)],
  term ((-113001540 : Rat) / 385571) [(3, 2), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 600 for generator 0. -/
theorem rs_R005_ueqv_R005NYN_partial_00_0600_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_00_0600
        rs_R005_ueqv_R005NYN_generator_00_0600_0677 =
      rs_R005_ueqv_R005NYN_partial_00_0600 := by
  native_decide

/-- Coefficient term 601 from coefficient polynomial 0. -/
def rs_R005_ueqv_R005NYN_coefficient_00_0601 : Poly :=
[
  term ((16544960 : Rat) / 158397) [(5, 1), (15, 3)]
]

/-- Partial product 601 for generator 0. -/
def rs_R005_ueqv_R005NYN_partial_00_0601 : Poly :=
[
  term ((16544960 : Rat) / 158397) [(0, 2), (5, 1), (15, 3)],
  term ((16544960 : Rat) / 158397) [(1, 2), (5, 1), (15, 3)],
  term ((-16544960 : Rat) / 158397) [(2, 2), (5, 1), (15, 3)],
  term ((-16544960 : Rat) / 158397) [(3, 2), (5, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 601 for generator 0. -/
theorem rs_R005_ueqv_R005NYN_partial_00_0601_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_00_0601
        rs_R005_ueqv_R005NYN_generator_00_0600_0677 =
      rs_R005_ueqv_R005NYN_partial_00_0601 := by
  native_decide

/-- Coefficient term 602 from coefficient polynomial 0. -/
def rs_R005_ueqv_R005NYN_coefficient_00_0602 : Poly :=
[
  term ((-88080200 : Rat) / 385571) [(5, 1), (15, 3), (16, 1)]
]

/-- Partial product 602 for generator 0. -/
def rs_R005_ueqv_R005NYN_partial_00_0602 : Poly :=
[
  term ((-88080200 : Rat) / 385571) [(0, 2), (5, 1), (15, 3), (16, 1)],
  term ((-88080200 : Rat) / 385571) [(1, 2), (5, 1), (15, 3), (16, 1)],
  term ((88080200 : Rat) / 385571) [(2, 2), (5, 1), (15, 3), (16, 1)],
  term ((88080200 : Rat) / 385571) [(3, 2), (5, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 602 for generator 0. -/
theorem rs_R005_ueqv_R005NYN_partial_00_0602_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_00_0602
        rs_R005_ueqv_R005NYN_generator_00_0600_0677 =
      rs_R005_ueqv_R005NYN_partial_00_0602 := by
  native_decide

/-- Coefficient term 603 from coefficient polynomial 0. -/
def rs_R005_ueqv_R005NYN_coefficient_00_0603 : Poly :=
[
  term ((1690808 : Rat) / 158397) [(5, 2)]
]

/-- Partial product 603 for generator 0. -/
def rs_R005_ueqv_R005NYN_partial_00_0603 : Poly :=
[
  term ((1690808 : Rat) / 158397) [(0, 2), (5, 2)],
  term ((1690808 : Rat) / 158397) [(1, 2), (5, 2)],
  term ((-1690808 : Rat) / 158397) [(2, 2), (5, 2)],
  term ((-1690808 : Rat) / 158397) [(3, 2), (5, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 603 for generator 0. -/
theorem rs_R005_ueqv_R005NYN_partial_00_0603_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_00_0603
        rs_R005_ueqv_R005NYN_generator_00_0600_0677 =
      rs_R005_ueqv_R005NYN_partial_00_0603 := by
  native_decide

/-- Coefficient term 604 from coefficient polynomial 0. -/
def rs_R005_ueqv_R005NYN_coefficient_00_0604 : Poly :=
[
  term ((-4718720 : Rat) / 52799) [(5, 2), (6, 1), (8, 1), (13, 1), (15, 1)]
]

/-- Partial product 604 for generator 0. -/
def rs_R005_ueqv_R005NYN_partial_00_0604 : Poly :=
[
  term ((-4718720 : Rat) / 52799) [(0, 2), (5, 2), (6, 1), (8, 1), (13, 1), (15, 1)],
  term ((-4718720 : Rat) / 52799) [(1, 2), (5, 2), (6, 1), (8, 1), (13, 1), (15, 1)],
  term ((4718720 : Rat) / 52799) [(2, 2), (5, 2), (6, 1), (8, 1), (13, 1), (15, 1)],
  term ((4718720 : Rat) / 52799) [(3, 2), (5, 2), (6, 1), (8, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 604 for generator 0. -/
theorem rs_R005_ueqv_R005NYN_partial_00_0604_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_00_0604
        rs_R005_ueqv_R005NYN_generator_00_0600_0677 =
      rs_R005_ueqv_R005NYN_partial_00_0604 := by
  native_decide

/-- Coefficient term 605 from coefficient polynomial 0. -/
def rs_R005_ueqv_R005NYN_coefficient_00_0605 : Poly :=
[
  term ((65940144 : Rat) / 385571) [(5, 2), (6, 1), (8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 605 for generator 0. -/
def rs_R005_ueqv_R005NYN_partial_00_0605 : Poly :=
[
  term ((65940144 : Rat) / 385571) [(0, 2), (5, 2), (6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((65940144 : Rat) / 385571) [(1, 2), (5, 2), (6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-65940144 : Rat) / 385571) [(2, 2), (5, 2), (6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-65940144 : Rat) / 385571) [(3, 2), (5, 2), (6, 1), (8, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 605 for generator 0. -/
theorem rs_R005_ueqv_R005NYN_partial_00_0605_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_00_0605
        rs_R005_ueqv_R005NYN_generator_00_0600_0677 =
      rs_R005_ueqv_R005NYN_partial_00_0605 := by
  native_decide

/-- Coefficient term 606 from coefficient polynomial 0. -/
def rs_R005_ueqv_R005NYN_coefficient_00_0606 : Poly :=
[
  term ((4718720 : Rat) / 52799) [(5, 2), (6, 1), (13, 1), (15, 1)]
]

/-- Partial product 606 for generator 0. -/
def rs_R005_ueqv_R005NYN_partial_00_0606 : Poly :=
[
  term ((4718720 : Rat) / 52799) [(0, 2), (5, 2), (6, 1), (13, 1), (15, 1)],
  term ((4718720 : Rat) / 52799) [(1, 2), (5, 2), (6, 1), (13, 1), (15, 1)],
  term ((-4718720 : Rat) / 52799) [(2, 2), (5, 2), (6, 1), (13, 1), (15, 1)],
  term ((-4718720 : Rat) / 52799) [(3, 2), (5, 2), (6, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 606 for generator 0. -/
theorem rs_R005_ueqv_R005NYN_partial_00_0606_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_00_0606
        rs_R005_ueqv_R005NYN_generator_00_0600_0677 =
      rs_R005_ueqv_R005NYN_partial_00_0606 := by
  native_decide

/-- Coefficient term 607 from coefficient polynomial 0. -/
def rs_R005_ueqv_R005NYN_coefficient_00_0607 : Poly :=
[
  term ((-65940144 : Rat) / 385571) [(5, 2), (6, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 607 for generator 0. -/
def rs_R005_ueqv_R005NYN_partial_00_0607 : Poly :=
[
  term ((-65940144 : Rat) / 385571) [(0, 2), (5, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-65940144 : Rat) / 385571) [(1, 2), (5, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((65940144 : Rat) / 385571) [(2, 2), (5, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((65940144 : Rat) / 385571) [(3, 2), (5, 2), (6, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 607 for generator 0. -/
theorem rs_R005_ueqv_R005NYN_partial_00_0607_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_00_0607
        rs_R005_ueqv_R005NYN_generator_00_0600_0677 =
      rs_R005_ueqv_R005NYN_partial_00_0607 := by
  native_decide

/-- Coefficient term 608 from coefficient polynomial 0. -/
def rs_R005_ueqv_R005NYN_coefficient_00_0608 : Poly :=
[
  term ((33089920 : Rat) / 158397) [(5, 2), (8, 1), (13, 1), (15, 1)]
]

/-- Partial product 608 for generator 0. -/
def rs_R005_ueqv_R005NYN_partial_00_0608 : Poly :=
[
  term ((33089920 : Rat) / 158397) [(0, 2), (5, 2), (8, 1), (13, 1), (15, 1)],
  term ((33089920 : Rat) / 158397) [(1, 2), (5, 2), (8, 1), (13, 1), (15, 1)],
  term ((-33089920 : Rat) / 158397) [(2, 2), (5, 2), (8, 1), (13, 1), (15, 1)],
  term ((-33089920 : Rat) / 158397) [(3, 2), (5, 2), (8, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 608 for generator 0. -/
theorem rs_R005_ueqv_R005NYN_partial_00_0608_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_00_0608
        rs_R005_ueqv_R005NYN_generator_00_0600_0677 =
      rs_R005_ueqv_R005NYN_partial_00_0608 := by
  native_decide

/-- Coefficient term 609 from coefficient polynomial 0. -/
def rs_R005_ueqv_R005NYN_coefficient_00_0609 : Poly :=
[
  term ((-176160400 : Rat) / 385571) [(5, 2), (8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 609 for generator 0. -/
def rs_R005_ueqv_R005NYN_partial_00_0609 : Poly :=
[
  term ((-176160400 : Rat) / 385571) [(0, 2), (5, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-176160400 : Rat) / 385571) [(1, 2), (5, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((176160400 : Rat) / 385571) [(2, 2), (5, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((176160400 : Rat) / 385571) [(3, 2), (5, 2), (8, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 609 for generator 0. -/
theorem rs_R005_ueqv_R005NYN_partial_00_0609_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_00_0609
        rs_R005_ueqv_R005NYN_generator_00_0600_0677 =
      rs_R005_ueqv_R005NYN_partial_00_0609 := by
  native_decide

/-- Coefficient term 610 from coefficient polynomial 0. -/
def rs_R005_ueqv_R005NYN_coefficient_00_0610 : Poly :=
[
  term ((-5980160 : Rat) / 52799) [(5, 2), (9, 1), (15, 1)]
]

/-- Partial product 610 for generator 0. -/
def rs_R005_ueqv_R005NYN_partial_00_0610 : Poly :=
[
  term ((-5980160 : Rat) / 52799) [(0, 2), (5, 2), (9, 1), (15, 1)],
  term ((-5980160 : Rat) / 52799) [(1, 2), (5, 2), (9, 1), (15, 1)],
  term ((5980160 : Rat) / 52799) [(2, 2), (5, 2), (9, 1), (15, 1)],
  term ((5980160 : Rat) / 52799) [(3, 2), (5, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 610 for generator 0. -/
theorem rs_R005_ueqv_R005NYN_partial_00_0610_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_00_0610
        rs_R005_ueqv_R005NYN_generator_00_0600_0677 =
      rs_R005_ueqv_R005NYN_partial_00_0610 := by
  native_decide

/-- Coefficient term 611 from coefficient polynomial 0. -/
def rs_R005_ueqv_R005NYN_coefficient_00_0611 : Poly :=
[
  term ((12806592 : Rat) / 385571) [(5, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 611 for generator 0. -/
def rs_R005_ueqv_R005NYN_partial_00_0611 : Poly :=
[
  term ((12806592 : Rat) / 385571) [(0, 2), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((12806592 : Rat) / 385571) [(1, 2), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-12806592 : Rat) / 385571) [(2, 2), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-12806592 : Rat) / 385571) [(3, 2), (5, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 611 for generator 0. -/
theorem rs_R005_ueqv_R005NYN_partial_00_0611_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_00_0611
        rs_R005_ueqv_R005NYN_generator_00_0600_0677 =
      rs_R005_ueqv_R005NYN_partial_00_0611 := by
  native_decide

/-- Coefficient term 612 from coefficient polynomial 0. -/
def rs_R005_ueqv_R005NYN_coefficient_00_0612 : Poly :=
[
  term ((-33089920 : Rat) / 158397) [(5, 2), (13, 1), (15, 1)]
]

/-- Partial product 612 for generator 0. -/
def rs_R005_ueqv_R005NYN_partial_00_0612 : Poly :=
[
  term ((-33089920 : Rat) / 158397) [(0, 2), (5, 2), (13, 1), (15, 1)],
  term ((-33089920 : Rat) / 158397) [(1, 2), (5, 2), (13, 1), (15, 1)],
  term ((33089920 : Rat) / 158397) [(2, 2), (5, 2), (13, 1), (15, 1)],
  term ((33089920 : Rat) / 158397) [(3, 2), (5, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 612 for generator 0. -/
theorem rs_R005_ueqv_R005NYN_partial_00_0612_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_00_0612
        rs_R005_ueqv_R005NYN_generator_00_0600_0677 =
      rs_R005_ueqv_R005NYN_partial_00_0612 := by
  native_decide

/-- Coefficient term 613 from coefficient polynomial 0. -/
def rs_R005_ueqv_R005NYN_coefficient_00_0613 : Poly :=
[
  term ((176160400 : Rat) / 385571) [(5, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 613 for generator 0. -/
def rs_R005_ueqv_R005NYN_partial_00_0613 : Poly :=
[
  term ((176160400 : Rat) / 385571) [(0, 2), (5, 2), (13, 1), (15, 1), (16, 1)],
  term ((176160400 : Rat) / 385571) [(1, 2), (5, 2), (13, 1), (15, 1), (16, 1)],
  term ((-176160400 : Rat) / 385571) [(2, 2), (5, 2), (13, 1), (15, 1), (16, 1)],
  term ((-176160400 : Rat) / 385571) [(3, 2), (5, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 613 for generator 0. -/
theorem rs_R005_ueqv_R005NYN_partial_00_0613_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_00_0613
        rs_R005_ueqv_R005NYN_generator_00_0600_0677 =
      rs_R005_ueqv_R005NYN_partial_00_0613 := by
  native_decide

/-- Coefficient term 614 from coefficient polynomial 0. -/
def rs_R005_ueqv_R005NYN_coefficient_00_0614 : Poly :=
[
  term ((-678880 : Rat) / 52799) [(6, 1), (13, 1), (15, 1)]
]

/-- Partial product 614 for generator 0. -/
def rs_R005_ueqv_R005NYN_partial_00_0614 : Poly :=
[
  term ((-678880 : Rat) / 52799) [(0, 2), (6, 1), (13, 1), (15, 1)],
  term ((-678880 : Rat) / 52799) [(1, 2), (6, 1), (13, 1), (15, 1)],
  term ((678880 : Rat) / 52799) [(2, 2), (6, 1), (13, 1), (15, 1)],
  term ((678880 : Rat) / 52799) [(3, 2), (6, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 614 for generator 0. -/
theorem rs_R005_ueqv_R005NYN_partial_00_0614_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_00_0614
        rs_R005_ueqv_R005NYN_generator_00_0600_0677 =
      rs_R005_ueqv_R005NYN_partial_00_0614 := by
  native_decide

/-- Coefficient term 615 from coefficient polynomial 0. -/
def rs_R005_ueqv_R005NYN_coefficient_00_0615 : Poly :=
[
  term ((18332604 : Rat) / 385571) [(6, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 615 for generator 0. -/
def rs_R005_ueqv_R005NYN_partial_00_0615 : Poly :=
[
  term ((18332604 : Rat) / 385571) [(0, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((18332604 : Rat) / 385571) [(1, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-18332604 : Rat) / 385571) [(2, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-18332604 : Rat) / 385571) [(3, 2), (6, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 615 for generator 0. -/
theorem rs_R005_ueqv_R005NYN_partial_00_0615_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_00_0615
        rs_R005_ueqv_R005NYN_generator_00_0600_0677 =
      rs_R005_ueqv_R005NYN_partial_00_0615 := by
  native_decide

/-- Coefficient term 616 from coefficient polynomial 0. -/
def rs_R005_ueqv_R005NYN_coefficient_00_0616 : Poly :=
[
  term ((678880 : Rat) / 52799) [(7, 1), (12, 1), (15, 1)]
]

/-- Partial product 616 for generator 0. -/
def rs_R005_ueqv_R005NYN_partial_00_0616 : Poly :=
[
  term ((678880 : Rat) / 52799) [(0, 2), (7, 1), (12, 1), (15, 1)],
  term ((678880 : Rat) / 52799) [(1, 2), (7, 1), (12, 1), (15, 1)],
  term ((-678880 : Rat) / 52799) [(2, 2), (7, 1), (12, 1), (15, 1)],
  term ((-678880 : Rat) / 52799) [(3, 2), (7, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 616 for generator 0. -/
theorem rs_R005_ueqv_R005NYN_partial_00_0616_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_00_0616
        rs_R005_ueqv_R005NYN_generator_00_0600_0677 =
      rs_R005_ueqv_R005NYN_partial_00_0616 := by
  native_decide

/-- Coefficient term 617 from coefficient polynomial 0. -/
def rs_R005_ueqv_R005NYN_coefficient_00_0617 : Poly :=
[
  term ((-18332604 : Rat) / 385571) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 617 for generator 0. -/
def rs_R005_ueqv_R005NYN_partial_00_0617 : Poly :=
[
  term ((-18332604 : Rat) / 385571) [(0, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-18332604 : Rat) / 385571) [(1, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((18332604 : Rat) / 385571) [(2, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((18332604 : Rat) / 385571) [(3, 2), (7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 617 for generator 0. -/
theorem rs_R005_ueqv_R005NYN_partial_00_0617_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_00_0617
        rs_R005_ueqv_R005NYN_generator_00_0600_0677 =
      rs_R005_ueqv_R005NYN_partial_00_0617 := by
  native_decide

/-- Coefficient term 618 from coefficient polynomial 0. -/
def rs_R005_ueqv_R005NYN_coefficient_00_0618 : Poly :=
[
  term ((645440 : Rat) / 158397) [(7, 1), (15, 1)]
]

/-- Partial product 618 for generator 0. -/
def rs_R005_ueqv_R005NYN_partial_00_0618 : Poly :=
[
  term ((645440 : Rat) / 158397) [(0, 2), (7, 1), (15, 1)],
  term ((645440 : Rat) / 158397) [(1, 2), (7, 1), (15, 1)],
  term ((-645440 : Rat) / 158397) [(2, 2), (7, 1), (15, 1)],
  term ((-645440 : Rat) / 158397) [(3, 2), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 618 for generator 0. -/
theorem rs_R005_ueqv_R005NYN_partial_00_0618_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_00_0618
        rs_R005_ueqv_R005NYN_generator_00_0600_0677 =
      rs_R005_ueqv_R005NYN_partial_00_0618 := by
  native_decide

/-- Coefficient term 619 from coefficient polynomial 0. -/
def rs_R005_ueqv_R005NYN_coefficient_00_0619 : Poly :=
[
  term ((14685160 : Rat) / 385571) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 619 for generator 0. -/
def rs_R005_ueqv_R005NYN_partial_00_0619 : Poly :=
[
  term ((14685160 : Rat) / 385571) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((14685160 : Rat) / 385571) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((-14685160 : Rat) / 385571) [(2, 2), (7, 1), (15, 1), (16, 1)],
  term ((-14685160 : Rat) / 385571) [(3, 2), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 619 for generator 0. -/
theorem rs_R005_ueqv_R005NYN_partial_00_0619_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_00_0619
        rs_R005_ueqv_R005NYN_generator_00_0600_0677 =
      rs_R005_ueqv_R005NYN_partial_00_0619 := by
  native_decide

/-- Coefficient term 620 from coefficient polynomial 0. -/
def rs_R005_ueqv_R005NYN_coefficient_00_0620 : Poly :=
[
  term ((-1390720 : Rat) / 158397) [(8, 1), (9, 1), (10, 1), (15, 1)]
]

/-- Partial product 620 for generator 0. -/
def rs_R005_ueqv_R005NYN_partial_00_0620 : Poly :=
[
  term ((-1390720 : Rat) / 158397) [(0, 2), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((-1390720 : Rat) / 158397) [(1, 2), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((1390720 : Rat) / 158397) [(2, 2), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((1390720 : Rat) / 158397) [(3, 2), (8, 1), (9, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 620 for generator 0. -/
theorem rs_R005_ueqv_R005NYN_partial_00_0620_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_00_0620
        rs_R005_ueqv_R005NYN_generator_00_0600_0677 =
      rs_R005_ueqv_R005NYN_partial_00_0620 := by
  native_decide

/-- Coefficient term 621 from coefficient polynomial 0. -/
def rs_R005_ueqv_R005NYN_coefficient_00_0621 : Poly :=
[
  term ((-37175504 : Rat) / 385571) [(8, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 621 for generator 0. -/
def rs_R005_ueqv_R005NYN_partial_00_0621 : Poly :=
[
  term ((-37175504 : Rat) / 385571) [(0, 2), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-37175504 : Rat) / 385571) [(1, 2), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((37175504 : Rat) / 385571) [(2, 2), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((37175504 : Rat) / 385571) [(3, 2), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 621 for generator 0. -/
theorem rs_R005_ueqv_R005NYN_partial_00_0621_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_00_0621
        rs_R005_ueqv_R005NYN_generator_00_0600_0677 =
      rs_R005_ueqv_R005NYN_partial_00_0621 := by
  native_decide

/-- Coefficient term 622 from coefficient polynomial 0. -/
def rs_R005_ueqv_R005NYN_coefficient_00_0622 : Poly :=
[
  term ((-2781440 : Rat) / 158397) [(8, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 622 for generator 0. -/
def rs_R005_ueqv_R005NYN_partial_00_0622 : Poly :=
[
  term ((-2781440 : Rat) / 158397) [(0, 2), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-2781440 : Rat) / 158397) [(1, 2), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((2781440 : Rat) / 158397) [(2, 2), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((2781440 : Rat) / 158397) [(3, 2), (8, 1), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 622 for generator 0. -/
theorem rs_R005_ueqv_R005NYN_partial_00_0622_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_00_0622
        rs_R005_ueqv_R005NYN_generator_00_0600_0677 =
      rs_R005_ueqv_R005NYN_partial_00_0622 := by
  native_decide

/-- Coefficient term 623 from coefficient polynomial 0. -/
def rs_R005_ueqv_R005NYN_coefficient_00_0623 : Poly :=
[
  term ((-74351008 : Rat) / 385571) [(8, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 623 for generator 0. -/
def rs_R005_ueqv_R005NYN_partial_00_0623 : Poly :=
[
  term ((-74351008 : Rat) / 385571) [(0, 2), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-74351008 : Rat) / 385571) [(1, 2), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((74351008 : Rat) / 385571) [(2, 2), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((74351008 : Rat) / 385571) [(3, 2), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 623 for generator 0. -/
theorem rs_R005_ueqv_R005NYN_partial_00_0623_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_00_0623
        rs_R005_ueqv_R005NYN_generator_00_0600_0677 =
      rs_R005_ueqv_R005NYN_partial_00_0623 := by
  native_decide

/-- Coefficient term 624 from coefficient polynomial 0. -/
def rs_R005_ueqv_R005NYN_coefficient_00_0624 : Poly :=
[
  term ((-701728 : Rat) / 158397) [(8, 1), (9, 1), (15, 1)]
]

/-- Partial product 624 for generator 0. -/
def rs_R005_ueqv_R005NYN_partial_00_0624 : Poly :=
[
  term ((-701728 : Rat) / 158397) [(0, 2), (8, 1), (9, 1), (15, 1)],
  term ((-701728 : Rat) / 158397) [(1, 2), (8, 1), (9, 1), (15, 1)],
  term ((701728 : Rat) / 158397) [(2, 2), (8, 1), (9, 1), (15, 1)],
  term ((701728 : Rat) / 158397) [(3, 2), (8, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 624 for generator 0. -/
theorem rs_R005_ueqv_R005NYN_partial_00_0624_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_00_0624
        rs_R005_ueqv_R005NYN_generator_00_0600_0677 =
      rs_R005_ueqv_R005NYN_partial_00_0624 := by
  native_decide

/-- Coefficient term 625 from coefficient polynomial 0. -/
def rs_R005_ueqv_R005NYN_coefficient_00_0625 : Poly :=
[
  term ((-15098852 : Rat) / 385571) [(8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 625 for generator 0. -/
def rs_R005_ueqv_R005NYN_partial_00_0625 : Poly :=
[
  term ((-15098852 : Rat) / 385571) [(0, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-15098852 : Rat) / 385571) [(1, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((15098852 : Rat) / 385571) [(2, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((15098852 : Rat) / 385571) [(3, 2), (8, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 625 for generator 0. -/
theorem rs_R005_ueqv_R005NYN_partial_00_0625_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_00_0625
        rs_R005_ueqv_R005NYN_generator_00_0600_0677 =
      rs_R005_ueqv_R005NYN_partial_00_0625 := by
  native_decide

/-- Coefficient term 626 from coefficient polynomial 0. -/
def rs_R005_ueqv_R005NYN_coefficient_00_0626 : Poly :=
[
  term ((-1390720 : Rat) / 158397) [(8, 1), (9, 1), (15, 3)]
]

/-- Partial product 626 for generator 0. -/
def rs_R005_ueqv_R005NYN_partial_00_0626 : Poly :=
[
  term ((-1390720 : Rat) / 158397) [(0, 2), (8, 1), (9, 1), (15, 3)],
  term ((-1390720 : Rat) / 158397) [(1, 2), (8, 1), (9, 1), (15, 3)],
  term ((1390720 : Rat) / 158397) [(2, 2), (8, 1), (9, 1), (15, 3)],
  term ((1390720 : Rat) / 158397) [(3, 2), (8, 1), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 626 for generator 0. -/
theorem rs_R005_ueqv_R005NYN_partial_00_0626_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_00_0626
        rs_R005_ueqv_R005NYN_generator_00_0600_0677 =
      rs_R005_ueqv_R005NYN_partial_00_0626 := by
  native_decide

/-- Coefficient term 627 from coefficient polynomial 0. -/
def rs_R005_ueqv_R005NYN_coefficient_00_0627 : Poly :=
[
  term ((-37175504 : Rat) / 385571) [(8, 1), (9, 1), (15, 3), (16, 1)]
]

/-- Partial product 627 for generator 0. -/
def rs_R005_ueqv_R005NYN_partial_00_0627 : Poly :=
[
  term ((-37175504 : Rat) / 385571) [(0, 2), (8, 1), (9, 1), (15, 3), (16, 1)],
  term ((-37175504 : Rat) / 385571) [(1, 2), (8, 1), (9, 1), (15, 3), (16, 1)],
  term ((37175504 : Rat) / 385571) [(2, 2), (8, 1), (9, 1), (15, 3), (16, 1)],
  term ((37175504 : Rat) / 385571) [(3, 2), (8, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 627 for generator 0. -/
theorem rs_R005_ueqv_R005NYN_partial_00_0627_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_00_0627
        rs_R005_ueqv_R005NYN_generator_00_0600_0677 =
      rs_R005_ueqv_R005NYN_partial_00_0627 := by
  native_decide

/-- Coefficient term 628 from coefficient polynomial 0. -/
def rs_R005_ueqv_R005NYN_coefficient_00_0628 : Poly :=
[
  term ((-5181440 : Rat) / 158397) [(8, 1), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 628 for generator 0. -/
def rs_R005_ueqv_R005NYN_partial_00_0628 : Poly :=
[
  term ((-5181440 : Rat) / 158397) [(0, 2), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-5181440 : Rat) / 158397) [(1, 2), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((5181440 : Rat) / 158397) [(2, 2), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((5181440 : Rat) / 158397) [(3, 2), (8, 1), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 628 for generator 0. -/
theorem rs_R005_ueqv_R005NYN_partial_00_0628_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_00_0628
        rs_R005_ueqv_R005NYN_generator_00_0600_0677 =
      rs_R005_ueqv_R005NYN_partial_00_0628 := by
  native_decide

/-- Coefficient term 629 from coefficient polynomial 0. -/
def rs_R005_ueqv_R005NYN_coefficient_00_0629 : Poly :=
[
  term ((21092000 : Rat) / 385571) [(8, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 629 for generator 0. -/
def rs_R005_ueqv_R005NYN_partial_00_0629 : Poly :=
[
  term ((21092000 : Rat) / 385571) [(0, 2), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((21092000 : Rat) / 385571) [(1, 2), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-21092000 : Rat) / 385571) [(2, 2), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-21092000 : Rat) / 385571) [(3, 2), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 629 for generator 0. -/
theorem rs_R005_ueqv_R005NYN_partial_00_0629_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_00_0629
        rs_R005_ueqv_R005NYN_generator_00_0600_0677 =
      rs_R005_ueqv_R005NYN_partial_00_0629 := by
  native_decide

/-- Coefficient term 630 from coefficient polynomial 0. -/
def rs_R005_ueqv_R005NYN_coefficient_00_0630 : Poly :=
[
  term ((2007040 : Rat) / 158397) [(8, 1), (10, 1), (15, 2)]
]

/-- Partial product 630 for generator 0. -/
def rs_R005_ueqv_R005NYN_partial_00_0630 : Poly :=
[
  term ((2007040 : Rat) / 158397) [(0, 2), (8, 1), (10, 1), (15, 2)],
  term ((2007040 : Rat) / 158397) [(1, 2), (8, 1), (10, 1), (15, 2)],
  term ((-2007040 : Rat) / 158397) [(2, 2), (8, 1), (10, 1), (15, 2)],
  term ((-2007040 : Rat) / 158397) [(3, 2), (8, 1), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 630 for generator 0. -/
theorem rs_R005_ueqv_R005NYN_partial_00_0630_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_00_0630
        rs_R005_ueqv_R005NYN_generator_00_0600_0677 =
      rs_R005_ueqv_R005NYN_partial_00_0630 := by
  native_decide

/-- Coefficient term 631 from coefficient polynomial 0. -/
def rs_R005_ueqv_R005NYN_coefficient_00_0631 : Poly :=
[
  term ((-9973120 : Rat) / 385571) [(8, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 631 for generator 0. -/
def rs_R005_ueqv_R005NYN_partial_00_0631 : Poly :=
[
  term ((-9973120 : Rat) / 385571) [(0, 2), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-9973120 : Rat) / 385571) [(1, 2), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((9973120 : Rat) / 385571) [(2, 2), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((9973120 : Rat) / 385571) [(3, 2), (8, 1), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 631 for generator 0. -/
theorem rs_R005_ueqv_R005NYN_partial_00_0631_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_00_0631
        rs_R005_ueqv_R005NYN_generator_00_0600_0677 =
      rs_R005_ueqv_R005NYN_partial_00_0631 := by
  native_decide

/-- Coefficient term 632 from coefficient polynomial 0. -/
def rs_R005_ueqv_R005NYN_coefficient_00_0632 : Poly :=
[
  term ((-10362880 : Rat) / 158397) [(8, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 632 for generator 0. -/
def rs_R005_ueqv_R005NYN_partial_00_0632 : Poly :=
[
  term ((-10362880 : Rat) / 158397) [(0, 2), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-10362880 : Rat) / 158397) [(1, 2), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((10362880 : Rat) / 158397) [(2, 2), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((10362880 : Rat) / 158397) [(3, 2), (8, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 632 for generator 0. -/
theorem rs_R005_ueqv_R005NYN_partial_00_0632_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_00_0632
        rs_R005_ueqv_R005NYN_generator_00_0600_0677 =
      rs_R005_ueqv_R005NYN_partial_00_0632 := by
  native_decide

/-- Coefficient term 633 from coefficient polynomial 0. -/
def rs_R005_ueqv_R005NYN_coefficient_00_0633 : Poly :=
[
  term ((42184000 : Rat) / 385571) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 633 for generator 0. -/
def rs_R005_ueqv_R005NYN_partial_00_0633 : Poly :=
[
  term ((42184000 : Rat) / 385571) [(0, 2), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((42184000 : Rat) / 385571) [(1, 2), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-42184000 : Rat) / 385571) [(2, 2), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-42184000 : Rat) / 385571) [(3, 2), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 633 for generator 0. -/
theorem rs_R005_ueqv_R005NYN_partial_00_0633_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_00_0633
        rs_R005_ueqv_R005NYN_generator_00_0600_0677 =
      rs_R005_ueqv_R005NYN_partial_00_0633 := by
  native_decide

/-- Coefficient term 634 from coefficient polynomial 0. -/
def rs_R005_ueqv_R005NYN_coefficient_00_0634 : Poly :=
[
  term ((2186240 : Rat) / 158397) [(8, 1), (11, 1), (15, 1)]
]

/-- Partial product 634 for generator 0. -/
def rs_R005_ueqv_R005NYN_partial_00_0634 : Poly :=
[
  term ((2186240 : Rat) / 158397) [(0, 2), (8, 1), (11, 1), (15, 1)],
  term ((2186240 : Rat) / 158397) [(1, 2), (8, 1), (11, 1), (15, 1)],
  term ((-2186240 : Rat) / 158397) [(2, 2), (8, 1), (11, 1), (15, 1)],
  term ((-2186240 : Rat) / 158397) [(3, 2), (8, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 634 for generator 0. -/
theorem rs_R005_ueqv_R005NYN_partial_00_0634_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_00_0634
        rs_R005_ueqv_R005NYN_generator_00_0600_0677 =
      rs_R005_ueqv_R005NYN_partial_00_0634 := by
  native_decide

/-- Coefficient term 635 from coefficient polynomial 0. -/
def rs_R005_ueqv_R005NYN_coefficient_00_0635 : Poly :=
[
  term ((-15751256 : Rat) / 385571) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 635 for generator 0. -/
def rs_R005_ueqv_R005NYN_partial_00_0635 : Poly :=
[
  term ((-15751256 : Rat) / 385571) [(0, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-15751256 : Rat) / 385571) [(1, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((15751256 : Rat) / 385571) [(2, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((15751256 : Rat) / 385571) [(3, 2), (8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 635 for generator 0. -/
theorem rs_R005_ueqv_R005NYN_partial_00_0635_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_00_0635
        rs_R005_ueqv_R005NYN_generator_00_0600_0677 =
      rs_R005_ueqv_R005NYN_partial_00_0635 := by
  native_decide

/-- Coefficient term 636 from coefficient polynomial 0. -/
def rs_R005_ueqv_R005NYN_coefficient_00_0636 : Poly :=
[
  term ((-5181440 : Rat) / 158397) [(8, 1), (11, 1), (15, 3)]
]

/-- Partial product 636 for generator 0. -/
def rs_R005_ueqv_R005NYN_partial_00_0636 : Poly :=
[
  term ((-5181440 : Rat) / 158397) [(0, 2), (8, 1), (11, 1), (15, 3)],
  term ((-5181440 : Rat) / 158397) [(1, 2), (8, 1), (11, 1), (15, 3)],
  term ((5181440 : Rat) / 158397) [(2, 2), (8, 1), (11, 1), (15, 3)],
  term ((5181440 : Rat) / 158397) [(3, 2), (8, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 636 for generator 0. -/
theorem rs_R005_ueqv_R005NYN_partial_00_0636_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_00_0636
        rs_R005_ueqv_R005NYN_generator_00_0600_0677 =
      rs_R005_ueqv_R005NYN_partial_00_0636 := by
  native_decide

/-- Coefficient term 637 from coefficient polynomial 0. -/
def rs_R005_ueqv_R005NYN_coefficient_00_0637 : Poly :=
[
  term ((21092000 : Rat) / 385571) [(8, 1), (11, 1), (15, 3), (16, 1)]
]

/-- Partial product 637 for generator 0. -/
def rs_R005_ueqv_R005NYN_partial_00_0637 : Poly :=
[
  term ((21092000 : Rat) / 385571) [(0, 2), (8, 1), (11, 1), (15, 3), (16, 1)],
  term ((21092000 : Rat) / 385571) [(1, 2), (8, 1), (11, 1), (15, 3), (16, 1)],
  term ((-21092000 : Rat) / 385571) [(2, 2), (8, 1), (11, 1), (15, 3), (16, 1)],
  term ((-21092000 : Rat) / 385571) [(3, 2), (8, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 637 for generator 0. -/
theorem rs_R005_ueqv_R005NYN_partial_00_0637_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_00_0637
        rs_R005_ueqv_R005NYN_generator_00_0600_0677 =
      rs_R005_ueqv_R005NYN_partial_00_0637 := by
  native_decide

/-- Coefficient term 638 from coefficient polynomial 0. -/
def rs_R005_ueqv_R005NYN_coefficient_00_0638 : Poly :=
[
  term ((4014080 : Rat) / 158397) [(8, 1), (12, 1), (15, 2)]
]

/-- Partial product 638 for generator 0. -/
def rs_R005_ueqv_R005NYN_partial_00_0638 : Poly :=
[
  term ((4014080 : Rat) / 158397) [(0, 2), (8, 1), (12, 1), (15, 2)],
  term ((4014080 : Rat) / 158397) [(1, 2), (8, 1), (12, 1), (15, 2)],
  term ((-4014080 : Rat) / 158397) [(2, 2), (8, 1), (12, 1), (15, 2)],
  term ((-4014080 : Rat) / 158397) [(3, 2), (8, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 638 for generator 0. -/
theorem rs_R005_ueqv_R005NYN_partial_00_0638_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_00_0638
        rs_R005_ueqv_R005NYN_generator_00_0600_0677 =
      rs_R005_ueqv_R005NYN_partial_00_0638 := by
  native_decide

/-- Coefficient term 639 from coefficient polynomial 0. -/
def rs_R005_ueqv_R005NYN_coefficient_00_0639 : Poly :=
[
  term ((-19946240 : Rat) / 385571) [(8, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 639 for generator 0. -/
def rs_R005_ueqv_R005NYN_partial_00_0639 : Poly :=
[
  term ((-19946240 : Rat) / 385571) [(0, 2), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-19946240 : Rat) / 385571) [(1, 2), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((19946240 : Rat) / 385571) [(2, 2), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((19946240 : Rat) / 385571) [(3, 2), (8, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 639 for generator 0. -/
theorem rs_R005_ueqv_R005NYN_partial_00_0639_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_00_0639
        rs_R005_ueqv_R005NYN_generator_00_0600_0677 =
      rs_R005_ueqv_R005NYN_partial_00_0639 := by
  native_decide

/-- Coefficient term 640 from coefficient polynomial 0. -/
def rs_R005_ueqv_R005NYN_coefficient_00_0640 : Poly :=
[
  term ((1096896 : Rat) / 52799) [(8, 1), (15, 2)]
]

/-- Partial product 640 for generator 0. -/
def rs_R005_ueqv_R005NYN_partial_00_0640 : Poly :=
[
  term ((1096896 : Rat) / 52799) [(0, 2), (8, 1), (15, 2)],
  term ((1096896 : Rat) / 52799) [(1, 2), (8, 1), (15, 2)],
  term ((-1096896 : Rat) / 52799) [(2, 2), (8, 1), (15, 2)],
  term ((-1096896 : Rat) / 52799) [(3, 2), (8, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 640 for generator 0. -/
theorem rs_R005_ueqv_R005NYN_partial_00_0640_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_00_0640
        rs_R005_ueqv_R005NYN_generator_00_0600_0677 =
      rs_R005_ueqv_R005NYN_partial_00_0640 := by
  native_decide

/-- Coefficient term 641 from coefficient polynomial 0. -/
def rs_R005_ueqv_R005NYN_coefficient_00_0641 : Poly :=
[
  term ((13139280 : Rat) / 385571) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 641 for generator 0. -/
def rs_R005_ueqv_R005NYN_partial_00_0641 : Poly :=
[
  term ((13139280 : Rat) / 385571) [(0, 2), (8, 1), (15, 2), (16, 1)],
  term ((13139280 : Rat) / 385571) [(1, 2), (8, 1), (15, 2), (16, 1)],
  term ((-13139280 : Rat) / 385571) [(2, 2), (8, 1), (15, 2), (16, 1)],
  term ((-13139280 : Rat) / 385571) [(3, 2), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 641 for generator 0. -/
theorem rs_R005_ueqv_R005NYN_partial_00_0641_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_00_0641
        rs_R005_ueqv_R005NYN_generator_00_0600_0677 =
      rs_R005_ueqv_R005NYN_partial_00_0641 := by
  native_decide

/-- Coefficient term 642 from coefficient polynomial 0. -/
def rs_R005_ueqv_R005NYN_coefficient_00_0642 : Poly :=
[
  term ((2007040 : Rat) / 158397) [(8, 1), (15, 4)]
]

/-- Partial product 642 for generator 0. -/
def rs_R005_ueqv_R005NYN_partial_00_0642 : Poly :=
[
  term ((2007040 : Rat) / 158397) [(0, 2), (8, 1), (15, 4)],
  term ((2007040 : Rat) / 158397) [(1, 2), (8, 1), (15, 4)],
  term ((-2007040 : Rat) / 158397) [(2, 2), (8, 1), (15, 4)],
  term ((-2007040 : Rat) / 158397) [(3, 2), (8, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 642 for generator 0. -/
theorem rs_R005_ueqv_R005NYN_partial_00_0642_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_00_0642
        rs_R005_ueqv_R005NYN_generator_00_0600_0677 =
      rs_R005_ueqv_R005NYN_partial_00_0642 := by
  native_decide

/-- Coefficient term 643 from coefficient polynomial 0. -/
def rs_R005_ueqv_R005NYN_coefficient_00_0643 : Poly :=
[
  term ((-9973120 : Rat) / 385571) [(8, 1), (15, 4), (16, 1)]
]

/-- Partial product 643 for generator 0. -/
def rs_R005_ueqv_R005NYN_partial_00_0643 : Poly :=
[
  term ((-9973120 : Rat) / 385571) [(0, 2), (8, 1), (15, 4), (16, 1)],
  term ((-9973120 : Rat) / 385571) [(1, 2), (8, 1), (15, 4), (16, 1)],
  term ((9973120 : Rat) / 385571) [(2, 2), (8, 1), (15, 4), (16, 1)],
  term ((9973120 : Rat) / 385571) [(3, 2), (8, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 643 for generator 0. -/
theorem rs_R005_ueqv_R005NYN_partial_00_0643_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_00_0643
        rs_R005_ueqv_R005NYN_generator_00_0600_0677 =
      rs_R005_ueqv_R005NYN_partial_00_0643 := by
  native_decide

/-- Coefficient term 644 from coefficient polynomial 0. -/
def rs_R005_ueqv_R005NYN_coefficient_00_0644 : Poly :=
[
  term ((4565120 : Rat) / 158397) [(9, 1), (10, 1), (15, 1)]
]

/-- Partial product 644 for generator 0. -/
def rs_R005_ueqv_R005NYN_partial_00_0644 : Poly :=
[
  term ((4565120 : Rat) / 158397) [(0, 2), (9, 1), (10, 1), (15, 1)],
  term ((4565120 : Rat) / 158397) [(1, 2), (9, 1), (10, 1), (15, 1)],
  term ((-4565120 : Rat) / 158397) [(2, 2), (9, 1), (10, 1), (15, 1)],
  term ((-4565120 : Rat) / 158397) [(3, 2), (9, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 644 for generator 0. -/
theorem rs_R005_ueqv_R005NYN_partial_00_0644_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_00_0644
        rs_R005_ueqv_R005NYN_generator_00_0600_0677 =
      rs_R005_ueqv_R005NYN_partial_00_0644 := by
  native_decide

/-- Coefficient term 645 from coefficient polynomial 0. -/
def rs_R005_ueqv_R005NYN_coefficient_00_0645 : Poly :=
[
  term ((26056624 : Rat) / 385571) [(9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 645 for generator 0. -/
def rs_R005_ueqv_R005NYN_partial_00_0645 : Poly :=
[
  term ((26056624 : Rat) / 385571) [(0, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((26056624 : Rat) / 385571) [(1, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-26056624 : Rat) / 385571) [(2, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-26056624 : Rat) / 385571) [(3, 2), (9, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 645 for generator 0. -/
theorem rs_R005_ueqv_R005NYN_partial_00_0645_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_00_0645
        rs_R005_ueqv_R005NYN_generator_00_0600_0677 =
      rs_R005_ueqv_R005NYN_partial_00_0645 := by
  native_decide

/-- Coefficient term 646 from coefficient polynomial 0. -/
def rs_R005_ueqv_R005NYN_coefficient_00_0646 : Poly :=
[
  term ((2007040 : Rat) / 158397) [(9, 1), (11, 1), (15, 2)]
]

/-- Partial product 646 for generator 0. -/
def rs_R005_ueqv_R005NYN_partial_00_0646 : Poly :=
[
  term ((2007040 : Rat) / 158397) [(0, 2), (9, 1), (11, 1), (15, 2)],
  term ((2007040 : Rat) / 158397) [(1, 2), (9, 1), (11, 1), (15, 2)],
  term ((-2007040 : Rat) / 158397) [(2, 2), (9, 1), (11, 1), (15, 2)],
  term ((-2007040 : Rat) / 158397) [(3, 2), (9, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 646 for generator 0. -/
theorem rs_R005_ueqv_R005NYN_partial_00_0646_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_00_0646
        rs_R005_ueqv_R005NYN_generator_00_0600_0677 =
      rs_R005_ueqv_R005NYN_partial_00_0646 := by
  native_decide

/-- Coefficient term 647 from coefficient polynomial 0. -/
def rs_R005_ueqv_R005NYN_coefficient_00_0647 : Poly :=
[
  term ((-9973120 : Rat) / 385571) [(9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 647 for generator 0. -/
def rs_R005_ueqv_R005NYN_partial_00_0647 : Poly :=
[
  term ((-9973120 : Rat) / 385571) [(0, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-9973120 : Rat) / 385571) [(1, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((9973120 : Rat) / 385571) [(2, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((9973120 : Rat) / 385571) [(3, 2), (9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 647 for generator 0. -/
theorem rs_R005_ueqv_R005NYN_partial_00_0647_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_00_0647
        rs_R005_ueqv_R005NYN_generator_00_0600_0677 =
      rs_R005_ueqv_R005NYN_partial_00_0647 := by
  native_decide

/-- Coefficient term 648 from coefficient polynomial 0. -/
def rs_R005_ueqv_R005NYN_coefficient_00_0648 : Poly :=
[
  term ((-5181440 : Rat) / 158397) [(9, 1), (11, 2), (15, 1)]
]

/-- Partial product 648 for generator 0. -/
def rs_R005_ueqv_R005NYN_partial_00_0648 : Poly :=
[
  term ((-5181440 : Rat) / 158397) [(0, 2), (9, 1), (11, 2), (15, 1)],
  term ((-5181440 : Rat) / 158397) [(1, 2), (9, 1), (11, 2), (15, 1)],
  term ((5181440 : Rat) / 158397) [(2, 2), (9, 1), (11, 2), (15, 1)],
  term ((5181440 : Rat) / 158397) [(3, 2), (9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 648 for generator 0. -/
theorem rs_R005_ueqv_R005NYN_partial_00_0648_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_00_0648
        rs_R005_ueqv_R005NYN_generator_00_0600_0677 =
      rs_R005_ueqv_R005NYN_partial_00_0648 := by
  native_decide

/-- Coefficient term 649 from coefficient polynomial 0. -/
def rs_R005_ueqv_R005NYN_coefficient_00_0649 : Poly :=
[
  term ((21092000 : Rat) / 385571) [(9, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 649 for generator 0. -/
def rs_R005_ueqv_R005NYN_partial_00_0649 : Poly :=
[
  term ((21092000 : Rat) / 385571) [(0, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((21092000 : Rat) / 385571) [(1, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-21092000 : Rat) / 385571) [(2, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-21092000 : Rat) / 385571) [(3, 2), (9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 649 for generator 0. -/
theorem rs_R005_ueqv_R005NYN_partial_00_0649_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_00_0649
        rs_R005_ueqv_R005NYN_generator_00_0600_0677 =
      rs_R005_ueqv_R005NYN_partial_00_0649 := by
  native_decide

/-- Coefficient term 650 from coefficient polynomial 0. -/
def rs_R005_ueqv_R005NYN_coefficient_00_0650 : Poly :=
[
  term ((4460800 : Rat) / 158397) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 650 for generator 0. -/
def rs_R005_ueqv_R005NYN_partial_00_0650 : Poly :=
[
  term ((4460800 : Rat) / 158397) [(0, 2), (9, 1), (12, 1), (15, 1)],
  term ((4460800 : Rat) / 158397) [(1, 2), (9, 1), (12, 1), (15, 1)],
  term ((-4460800 : Rat) / 158397) [(2, 2), (9, 1), (12, 1), (15, 1)],
  term ((-4460800 : Rat) / 158397) [(3, 2), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 650 for generator 0. -/
theorem rs_R005_ueqv_R005NYN_partial_00_0650_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_00_0650
        rs_R005_ueqv_R005NYN_generator_00_0600_0677 =
      rs_R005_ueqv_R005NYN_partial_00_0650 := by
  native_decide

/-- Coefficient term 651 from coefficient polynomial 0. -/
def rs_R005_ueqv_R005NYN_coefficient_00_0651 : Poly :=
[
  term ((56696288 : Rat) / 385571) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 651 for generator 0. -/
def rs_R005_ueqv_R005NYN_partial_00_0651 : Poly :=
[
  term ((56696288 : Rat) / 385571) [(0, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((56696288 : Rat) / 385571) [(1, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-56696288 : Rat) / 385571) [(2, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-56696288 : Rat) / 385571) [(3, 2), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 651 for generator 0. -/
theorem rs_R005_ueqv_R005NYN_partial_00_0651_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_00_0651
        rs_R005_ueqv_R005NYN_generator_00_0600_0677 =
      rs_R005_ueqv_R005NYN_partial_00_0651 := by
  native_decide

/-- Coefficient term 652 from coefficient polynomial 0. -/
def rs_R005_ueqv_R005NYN_coefficient_00_0652 : Poly :=
[
  term ((-3121568 : Rat) / 52799) [(9, 1), (15, 1)]
]

/-- Partial product 652 for generator 0. -/
def rs_R005_ueqv_R005NYN_partial_00_0652 : Poly :=
[
  term ((-3121568 : Rat) / 52799) [(0, 2), (9, 1), (15, 1)],
  term ((-3121568 : Rat) / 52799) [(1, 2), (9, 1), (15, 1)],
  term ((3121568 : Rat) / 52799) [(2, 2), (9, 1), (15, 1)],
  term ((3121568 : Rat) / 52799) [(3, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 652 for generator 0. -/
theorem rs_R005_ueqv_R005NYN_partial_00_0652_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_00_0652
        rs_R005_ueqv_R005NYN_generator_00_0600_0677 =
      rs_R005_ueqv_R005NYN_partial_00_0652 := by
  native_decide

/-- Coefficient term 653 from coefficient polynomial 0. -/
def rs_R005_ueqv_R005NYN_coefficient_00_0653 : Poly :=
[
  term ((-15837384 : Rat) / 385571) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 653 for generator 0. -/
def rs_R005_ueqv_R005NYN_partial_00_0653 : Poly :=
[
  term ((-15837384 : Rat) / 385571) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((-15837384 : Rat) / 385571) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((15837384 : Rat) / 385571) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((15837384 : Rat) / 385571) [(3, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 653 for generator 0. -/
theorem rs_R005_ueqv_R005NYN_partial_00_0653_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_00_0653
        rs_R005_ueqv_R005NYN_generator_00_0600_0677 =
      rs_R005_ueqv_R005NYN_partial_00_0653 := by
  native_decide

/-- Coefficient term 654 from coefficient polynomial 0. -/
def rs_R005_ueqv_R005NYN_coefficient_00_0654 : Poly :=
[
  term ((2230400 : Rat) / 158397) [(9, 1), (15, 3)]
]

/-- Partial product 654 for generator 0. -/
def rs_R005_ueqv_R005NYN_partial_00_0654 : Poly :=
[
  term ((2230400 : Rat) / 158397) [(0, 2), (9, 1), (15, 3)],
  term ((2230400 : Rat) / 158397) [(1, 2), (9, 1), (15, 3)],
  term ((-2230400 : Rat) / 158397) [(2, 2), (9, 1), (15, 3)],
  term ((-2230400 : Rat) / 158397) [(3, 2), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 654 for generator 0. -/
theorem rs_R005_ueqv_R005NYN_partial_00_0654_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_00_0654
        rs_R005_ueqv_R005NYN_generator_00_0600_0677 =
      rs_R005_ueqv_R005NYN_partial_00_0654 := by
  native_decide

/-- Coefficient term 655 from coefficient polynomial 0. -/
def rs_R005_ueqv_R005NYN_coefficient_00_0655 : Poly :=
[
  term ((28348144 : Rat) / 385571) [(9, 1), (15, 3), (16, 1)]
]

/-- Partial product 655 for generator 0. -/
def rs_R005_ueqv_R005NYN_partial_00_0655 : Poly :=
[
  term ((28348144 : Rat) / 385571) [(0, 2), (9, 1), (15, 3), (16, 1)],
  term ((28348144 : Rat) / 385571) [(1, 2), (9, 1), (15, 3), (16, 1)],
  term ((-28348144 : Rat) / 385571) [(2, 2), (9, 1), (15, 3), (16, 1)],
  term ((-28348144 : Rat) / 385571) [(3, 2), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 655 for generator 0. -/
theorem rs_R005_ueqv_R005NYN_partial_00_0655_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_00_0655
        rs_R005_ueqv_R005NYN_generator_00_0600_0677 =
      rs_R005_ueqv_R005NYN_partial_00_0655 := by
  native_decide

/-- Coefficient term 656 from coefficient polynomial 0. -/
def rs_R005_ueqv_R005NYN_coefficient_00_0656 : Poly :=
[
  term ((-3520640 : Rat) / 158397) [(9, 2), (11, 1), (15, 1)]
]

/-- Partial product 656 for generator 0. -/
def rs_R005_ueqv_R005NYN_partial_00_0656 : Poly :=
[
  term ((-3520640 : Rat) / 158397) [(0, 2), (9, 2), (11, 1), (15, 1)],
  term ((-3520640 : Rat) / 158397) [(1, 2), (9, 2), (11, 1), (15, 1)],
  term ((3520640 : Rat) / 158397) [(2, 2), (9, 2), (11, 1), (15, 1)],
  term ((3520640 : Rat) / 158397) [(3, 2), (9, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 656 for generator 0. -/
theorem rs_R005_ueqv_R005NYN_partial_00_0656_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_00_0656
        rs_R005_ueqv_R005NYN_generator_00_0600_0677 =
      rs_R005_ueqv_R005NYN_partial_00_0656 := by
  native_decide

/-- Coefficient term 657 from coefficient polynomial 0. -/
def rs_R005_ueqv_R005NYN_coefficient_00_0657 : Poly :=
[
  term ((-41487568 : Rat) / 385571) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 657 for generator 0. -/
def rs_R005_ueqv_R005NYN_partial_00_0657 : Poly :=
[
  term ((-41487568 : Rat) / 385571) [(0, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-41487568 : Rat) / 385571) [(1, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((41487568 : Rat) / 385571) [(2, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((41487568 : Rat) / 385571) [(3, 2), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 657 for generator 0. -/
theorem rs_R005_ueqv_R005NYN_partial_00_0657_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_00_0657
        rs_R005_ueqv_R005NYN_generator_00_0600_0677 =
      rs_R005_ueqv_R005NYN_partial_00_0657 := by
  native_decide

/-- Coefficient term 658 from coefficient polynomial 0. -/
def rs_R005_ueqv_R005NYN_coefficient_00_0658 : Poly :=
[
  term ((2867200 : Rat) / 158397) [(9, 2), (15, 2)]
]

/-- Partial product 658 for generator 0. -/
def rs_R005_ueqv_R005NYN_partial_00_0658 : Poly :=
[
  term ((2867200 : Rat) / 158397) [(0, 2), (9, 2), (15, 2)],
  term ((2867200 : Rat) / 158397) [(1, 2), (9, 2), (15, 2)],
  term ((-2867200 : Rat) / 158397) [(2, 2), (9, 2), (15, 2)],
  term ((-2867200 : Rat) / 158397) [(3, 2), (9, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 658 for generator 0. -/
theorem rs_R005_ueqv_R005NYN_partial_00_0658_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_00_0658
        rs_R005_ueqv_R005NYN_generator_00_0600_0677 =
      rs_R005_ueqv_R005NYN_partial_00_0658 := by
  native_decide

/-- Coefficient term 659 from coefficient polynomial 0. -/
def rs_R005_ueqv_R005NYN_coefficient_00_0659 : Poly :=
[
  term ((-1213504 : Rat) / 385571) [(9, 2), (15, 2), (16, 1)]
]

/-- Partial product 659 for generator 0. -/
def rs_R005_ueqv_R005NYN_partial_00_0659 : Poly :=
[
  term ((-1213504 : Rat) / 385571) [(0, 2), (9, 2), (15, 2), (16, 1)],
  term ((-1213504 : Rat) / 385571) [(1, 2), (9, 2), (15, 2), (16, 1)],
  term ((1213504 : Rat) / 385571) [(2, 2), (9, 2), (15, 2), (16, 1)],
  term ((1213504 : Rat) / 385571) [(3, 2), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 659 for generator 0. -/
theorem rs_R005_ueqv_R005NYN_partial_00_0659_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_00_0659
        rs_R005_ueqv_R005NYN_generator_00_0600_0677 =
      rs_R005_ueqv_R005NYN_partial_00_0659 := by
  native_decide

/-- Coefficient term 660 from coefficient polynomial 0. -/
def rs_R005_ueqv_R005NYN_coefficient_00_0660 : Poly :=
[
  term ((5181440 : Rat) / 158397) [(10, 1), (11, 1), (15, 1)]
]

/-- Partial product 660 for generator 0. -/
def rs_R005_ueqv_R005NYN_partial_00_0660 : Poly :=
[
  term ((5181440 : Rat) / 158397) [(0, 2), (10, 1), (11, 1), (15, 1)],
  term ((5181440 : Rat) / 158397) [(1, 2), (10, 1), (11, 1), (15, 1)],
  term ((-5181440 : Rat) / 158397) [(2, 2), (10, 1), (11, 1), (15, 1)],
  term ((-5181440 : Rat) / 158397) [(3, 2), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 660 for generator 0. -/
theorem rs_R005_ueqv_R005NYN_partial_00_0660_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_00_0660
        rs_R005_ueqv_R005NYN_generator_00_0600_0677 =
      rs_R005_ueqv_R005NYN_partial_00_0660 := by
  native_decide

/-- Coefficient term 661 from coefficient polynomial 0. -/
def rs_R005_ueqv_R005NYN_coefficient_00_0661 : Poly :=
[
  term ((-21092000 : Rat) / 385571) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 661 for generator 0. -/
def rs_R005_ueqv_R005NYN_partial_00_0661 : Poly :=
[
  term ((-21092000 : Rat) / 385571) [(0, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-21092000 : Rat) / 385571) [(1, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((21092000 : Rat) / 385571) [(2, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((21092000 : Rat) / 385571) [(3, 2), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 661 for generator 0. -/
theorem rs_R005_ueqv_R005NYN_partial_00_0661_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_00_0661
        rs_R005_ueqv_R005NYN_generator_00_0600_0677 =
      rs_R005_ueqv_R005NYN_partial_00_0661 := by
  native_decide

/-- Coefficient term 662 from coefficient polynomial 0. -/
def rs_R005_ueqv_R005NYN_coefficient_00_0662 : Poly :=
[
  term ((-1576960 : Rat) / 52799) [(10, 1), (15, 2)]
]

/-- Partial product 662 for generator 0. -/
def rs_R005_ueqv_R005NYN_partial_00_0662 : Poly :=
[
  term ((-1576960 : Rat) / 52799) [(0, 2), (10, 1), (15, 2)],
  term ((-1576960 : Rat) / 52799) [(1, 2), (10, 1), (15, 2)],
  term ((1576960 : Rat) / 52799) [(2, 2), (10, 1), (15, 2)],
  term ((1576960 : Rat) / 52799) [(3, 2), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 662 for generator 0. -/
theorem rs_R005_ueqv_R005NYN_partial_00_0662_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_00_0662
        rs_R005_ueqv_R005NYN_generator_00_0600_0677 =
      rs_R005_ueqv_R005NYN_partial_00_0662 := by
  native_decide

/-- Coefficient term 663 from coefficient polynomial 0. -/
def rs_R005_ueqv_R005NYN_coefficient_00_0663 : Poly :=
[
  term ((12646560 : Rat) / 385571) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 663 for generator 0. -/
def rs_R005_ueqv_R005NYN_partial_00_0663 : Poly :=
[
  term ((12646560 : Rat) / 385571) [(0, 2), (10, 1), (15, 2), (16, 1)],
  term ((12646560 : Rat) / 385571) [(1, 2), (10, 1), (15, 2), (16, 1)],
  term ((-12646560 : Rat) / 385571) [(2, 2), (10, 1), (15, 2), (16, 1)],
  term ((-12646560 : Rat) / 385571) [(3, 2), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 663 for generator 0. -/
theorem rs_R005_ueqv_R005NYN_partial_00_0663_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_00_0663
        rs_R005_ueqv_R005NYN_generator_00_0600_0677 =
      rs_R005_ueqv_R005NYN_partial_00_0663 := by
  native_decide

/-- Coefficient term 664 from coefficient polynomial 0. -/
def rs_R005_ueqv_R005NYN_coefficient_00_0664 : Poly :=
[
  term ((10362880 : Rat) / 158397) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 664 for generator 0. -/
def rs_R005_ueqv_R005NYN_partial_00_0664 : Poly :=
[
  term ((10362880 : Rat) / 158397) [(0, 2), (11, 1), (12, 1), (15, 1)],
  term ((10362880 : Rat) / 158397) [(1, 2), (11, 1), (12, 1), (15, 1)],
  term ((-10362880 : Rat) / 158397) [(2, 2), (11, 1), (12, 1), (15, 1)],
  term ((-10362880 : Rat) / 158397) [(3, 2), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 664 for generator 0. -/
theorem rs_R005_ueqv_R005NYN_partial_00_0664_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_00_0664
        rs_R005_ueqv_R005NYN_generator_00_0600_0677 =
      rs_R005_ueqv_R005NYN_partial_00_0664 := by
  native_decide

/-- Coefficient term 665 from coefficient polynomial 0. -/
def rs_R005_ueqv_R005NYN_coefficient_00_0665 : Poly :=
[
  term ((-42184000 : Rat) / 385571) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 665 for generator 0. -/
def rs_R005_ueqv_R005NYN_partial_00_0665 : Poly :=
[
  term ((-42184000 : Rat) / 385571) [(0, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-42184000 : Rat) / 385571) [(1, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((42184000 : Rat) / 385571) [(2, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((42184000 : Rat) / 385571) [(3, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 665 for generator 0. -/
theorem rs_R005_ueqv_R005NYN_partial_00_0665_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_00_0665
        rs_R005_ueqv_R005NYN_generator_00_0600_0677 =
      rs_R005_ueqv_R005NYN_partial_00_0665 := by
  native_decide

/-- Coefficient term 666 from coefficient polynomial 0. -/
def rs_R005_ueqv_R005NYN_coefficient_00_0666 : Poly :=
[
  term ((-6351136 : Rat) / 158397) [(11, 1), (15, 1)]
]

/-- Partial product 666 for generator 0. -/
def rs_R005_ueqv_R005NYN_partial_00_0666 : Poly :=
[
  term ((-6351136 : Rat) / 158397) [(0, 2), (11, 1), (15, 1)],
  term ((-6351136 : Rat) / 158397) [(1, 2), (11, 1), (15, 1)],
  term ((6351136 : Rat) / 158397) [(2, 2), (11, 1), (15, 1)],
  term ((6351136 : Rat) / 158397) [(3, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 666 for generator 0. -/
theorem rs_R005_ueqv_R005NYN_partial_00_0666_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_00_0666
        rs_R005_ueqv_R005NYN_generator_00_0600_0677 =
      rs_R005_ueqv_R005NYN_partial_00_0666 := by
  native_decide

/-- Coefficient term 667 from coefficient polynomial 0. -/
def rs_R005_ueqv_R005NYN_coefficient_00_0667 : Poly :=
[
  term ((8486608 : Rat) / 385571) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 667 for generator 0. -/
def rs_R005_ueqv_R005NYN_partial_00_0667 : Poly :=
[
  term ((8486608 : Rat) / 385571) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((8486608 : Rat) / 385571) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-8486608 : Rat) / 385571) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((-8486608 : Rat) / 385571) [(3, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 667 for generator 0. -/
theorem rs_R005_ueqv_R005NYN_partial_00_0667_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_00_0667
        rs_R005_ueqv_R005NYN_generator_00_0600_0677 =
      rs_R005_ueqv_R005NYN_partial_00_0667 := by
  native_decide

/-- Coefficient term 668 from coefficient polynomial 0. -/
def rs_R005_ueqv_R005NYN_coefficient_00_0668 : Poly :=
[
  term ((5181440 : Rat) / 158397) [(11, 1), (15, 3)]
]

/-- Partial product 668 for generator 0. -/
def rs_R005_ueqv_R005NYN_partial_00_0668 : Poly :=
[
  term ((5181440 : Rat) / 158397) [(0, 2), (11, 1), (15, 3)],
  term ((5181440 : Rat) / 158397) [(1, 2), (11, 1), (15, 3)],
  term ((-5181440 : Rat) / 158397) [(2, 2), (11, 1), (15, 3)],
  term ((-5181440 : Rat) / 158397) [(3, 2), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 668 for generator 0. -/
theorem rs_R005_ueqv_R005NYN_partial_00_0668_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_00_0668
        rs_R005_ueqv_R005NYN_generator_00_0600_0677 =
      rs_R005_ueqv_R005NYN_partial_00_0668 := by
  native_decide

/-- Coefficient term 669 from coefficient polynomial 0. -/
def rs_R005_ueqv_R005NYN_coefficient_00_0669 : Poly :=
[
  term ((-21092000 : Rat) / 385571) [(11, 1), (15, 3), (16, 1)]
]

/-- Partial product 669 for generator 0. -/
def rs_R005_ueqv_R005NYN_partial_00_0669 : Poly :=
[
  term ((-21092000 : Rat) / 385571) [(0, 2), (11, 1), (15, 3), (16, 1)],
  term ((-21092000 : Rat) / 385571) [(1, 2), (11, 1), (15, 3), (16, 1)],
  term ((21092000 : Rat) / 385571) [(2, 2), (11, 1), (15, 3), (16, 1)],
  term ((21092000 : Rat) / 385571) [(3, 2), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 669 for generator 0. -/
theorem rs_R005_ueqv_R005NYN_partial_00_0669_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_00_0669
        rs_R005_ueqv_R005NYN_generator_00_0600_0677 =
      rs_R005_ueqv_R005NYN_partial_00_0669 := by
  native_decide

/-- Coefficient term 670 from coefficient polynomial 0. -/
def rs_R005_ueqv_R005NYN_coefficient_00_0670 : Poly :=
[
  term ((-4014080 : Rat) / 158397) [(12, 1), (15, 2)]
]

/-- Partial product 670 for generator 0. -/
def rs_R005_ueqv_R005NYN_partial_00_0670 : Poly :=
[
  term ((-4014080 : Rat) / 158397) [(0, 2), (12, 1), (15, 2)],
  term ((-4014080 : Rat) / 158397) [(1, 2), (12, 1), (15, 2)],
  term ((4014080 : Rat) / 158397) [(2, 2), (12, 1), (15, 2)],
  term ((4014080 : Rat) / 158397) [(3, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 670 for generator 0. -/
theorem rs_R005_ueqv_R005NYN_partial_00_0670_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_00_0670
        rs_R005_ueqv_R005NYN_generator_00_0600_0677 =
      rs_R005_ueqv_R005NYN_partial_00_0670 := by
  native_decide

/-- Coefficient term 671 from coefficient polynomial 0. -/
def rs_R005_ueqv_R005NYN_coefficient_00_0671 : Poly :=
[
  term ((19946240 : Rat) / 385571) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 671 for generator 0. -/
def rs_R005_ueqv_R005NYN_partial_00_0671 : Poly :=
[
  term ((19946240 : Rat) / 385571) [(0, 2), (12, 1), (15, 2), (16, 1)],
  term ((19946240 : Rat) / 385571) [(1, 2), (12, 1), (15, 2), (16, 1)],
  term ((-19946240 : Rat) / 385571) [(2, 2), (12, 1), (15, 2), (16, 1)],
  term ((-19946240 : Rat) / 385571) [(3, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 671 for generator 0. -/
theorem rs_R005_ueqv_R005NYN_partial_00_0671_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_00_0671
        rs_R005_ueqv_R005NYN_generator_00_0600_0677 =
      rs_R005_ueqv_R005NYN_partial_00_0671 := by
  native_decide

/-- Coefficient term 672 from coefficient polynomial 0. -/
def rs_R005_ueqv_R005NYN_coefficient_00_0672 : Poly :=
[
  term ((678880 : Rat) / 52799) [(13, 1), (15, 1)]
]

/-- Partial product 672 for generator 0. -/
def rs_R005_ueqv_R005NYN_partial_00_0672 : Poly :=
[
  term ((678880 : Rat) / 52799) [(0, 2), (13, 1), (15, 1)],
  term ((678880 : Rat) / 52799) [(1, 2), (13, 1), (15, 1)],
  term ((-678880 : Rat) / 52799) [(2, 2), (13, 1), (15, 1)],
  term ((-678880 : Rat) / 52799) [(3, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 672 for generator 0. -/
theorem rs_R005_ueqv_R005NYN_partial_00_0672_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_00_0672
        rs_R005_ueqv_R005NYN_generator_00_0600_0677 =
      rs_R005_ueqv_R005NYN_partial_00_0672 := by
  native_decide

/-- Coefficient term 673 from coefficient polynomial 0. -/
def rs_R005_ueqv_R005NYN_coefficient_00_0673 : Poly :=
[
  term ((-18332604 : Rat) / 385571) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 673 for generator 0. -/
def rs_R005_ueqv_R005NYN_partial_00_0673 : Poly :=
[
  term ((-18332604 : Rat) / 385571) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-18332604 : Rat) / 385571) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((18332604 : Rat) / 385571) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((18332604 : Rat) / 385571) [(3, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 673 for generator 0. -/
theorem rs_R005_ueqv_R005NYN_partial_00_0673_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_00_0673
        rs_R005_ueqv_R005NYN_generator_00_0600_0677 =
      rs_R005_ueqv_R005NYN_partial_00_0673 := by
  native_decide

/-- Coefficient term 674 from coefficient polynomial 0. -/
def rs_R005_ueqv_R005NYN_coefficient_00_0674 : Poly :=
[
  term ((1721064 : Rat) / 52799) [(15, 2)]
]

/-- Partial product 674 for generator 0. -/
def rs_R005_ueqv_R005NYN_partial_00_0674 : Poly :=
[
  term ((1721064 : Rat) / 52799) [(0, 2), (15, 2)],
  term ((1721064 : Rat) / 52799) [(1, 2), (15, 2)],
  term ((-1721064 : Rat) / 52799) [(2, 2), (15, 2)],
  term ((-1721064 : Rat) / 52799) [(3, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 674 for generator 0. -/
theorem rs_R005_ueqv_R005NYN_partial_00_0674_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_00_0674
        rs_R005_ueqv_R005NYN_generator_00_0600_0677 =
      rs_R005_ueqv_R005NYN_partial_00_0674 := by
  native_decide

/-- Coefficient term 675 from coefficient polynomial 0. -/
def rs_R005_ueqv_R005NYN_coefficient_00_0675 : Poly :=
[
  term ((-13658088 : Rat) / 385571) [(15, 2), (16, 1)]
]

/-- Partial product 675 for generator 0. -/
def rs_R005_ueqv_R005NYN_partial_00_0675 : Poly :=
[
  term ((-13658088 : Rat) / 385571) [(0, 2), (15, 2), (16, 1)],
  term ((-13658088 : Rat) / 385571) [(1, 2), (15, 2), (16, 1)],
  term ((13658088 : Rat) / 385571) [(2, 2), (15, 2), (16, 1)],
  term ((13658088 : Rat) / 385571) [(3, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 675 for generator 0. -/
theorem rs_R005_ueqv_R005NYN_partial_00_0675_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_00_0675
        rs_R005_ueqv_R005NYN_generator_00_0600_0677 =
      rs_R005_ueqv_R005NYN_partial_00_0675 := by
  native_decide

/-- Coefficient term 676 from coefficient polynomial 0. -/
def rs_R005_ueqv_R005NYN_coefficient_00_0676 : Poly :=
[
  term ((-2007040 : Rat) / 158397) [(15, 4)]
]

/-- Partial product 676 for generator 0. -/
def rs_R005_ueqv_R005NYN_partial_00_0676 : Poly :=
[
  term ((-2007040 : Rat) / 158397) [(0, 2), (15, 4)],
  term ((-2007040 : Rat) / 158397) [(1, 2), (15, 4)],
  term ((2007040 : Rat) / 158397) [(2, 2), (15, 4)],
  term ((2007040 : Rat) / 158397) [(3, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 676 for generator 0. -/
theorem rs_R005_ueqv_R005NYN_partial_00_0676_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_00_0676
        rs_R005_ueqv_R005NYN_generator_00_0600_0677 =
      rs_R005_ueqv_R005NYN_partial_00_0676 := by
  native_decide

/-- Coefficient term 677 from coefficient polynomial 0. -/
def rs_R005_ueqv_R005NYN_coefficient_00_0677 : Poly :=
[
  term ((9973120 : Rat) / 385571) [(15, 4), (16, 1)]
]

/-- Partial product 677 for generator 0. -/
def rs_R005_ueqv_R005NYN_partial_00_0677 : Poly :=
[
  term ((9973120 : Rat) / 385571) [(0, 2), (15, 4), (16, 1)],
  term ((9973120 : Rat) / 385571) [(1, 2), (15, 4), (16, 1)],
  term ((-9973120 : Rat) / 385571) [(2, 2), (15, 4), (16, 1)],
  term ((-9973120 : Rat) / 385571) [(3, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 677 for generator 0. -/
theorem rs_R005_ueqv_R005NYN_partial_00_0677_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_00_0677
        rs_R005_ueqv_R005NYN_generator_00_0600_0677 =
      rs_R005_ueqv_R005NYN_partial_00_0677 := by
  native_decide

/-- Partial products in this block. -/
def rs_R005_ueqv_R005NYN_partials_00_0600_0677 : List Poly :=
[
  rs_R005_ueqv_R005NYN_partial_00_0600,
  rs_R005_ueqv_R005NYN_partial_00_0601,
  rs_R005_ueqv_R005NYN_partial_00_0602,
  rs_R005_ueqv_R005NYN_partial_00_0603,
  rs_R005_ueqv_R005NYN_partial_00_0604,
  rs_R005_ueqv_R005NYN_partial_00_0605,
  rs_R005_ueqv_R005NYN_partial_00_0606,
  rs_R005_ueqv_R005NYN_partial_00_0607,
  rs_R005_ueqv_R005NYN_partial_00_0608,
  rs_R005_ueqv_R005NYN_partial_00_0609,
  rs_R005_ueqv_R005NYN_partial_00_0610,
  rs_R005_ueqv_R005NYN_partial_00_0611,
  rs_R005_ueqv_R005NYN_partial_00_0612,
  rs_R005_ueqv_R005NYN_partial_00_0613,
  rs_R005_ueqv_R005NYN_partial_00_0614,
  rs_R005_ueqv_R005NYN_partial_00_0615,
  rs_R005_ueqv_R005NYN_partial_00_0616,
  rs_R005_ueqv_R005NYN_partial_00_0617,
  rs_R005_ueqv_R005NYN_partial_00_0618,
  rs_R005_ueqv_R005NYN_partial_00_0619,
  rs_R005_ueqv_R005NYN_partial_00_0620,
  rs_R005_ueqv_R005NYN_partial_00_0621,
  rs_R005_ueqv_R005NYN_partial_00_0622,
  rs_R005_ueqv_R005NYN_partial_00_0623,
  rs_R005_ueqv_R005NYN_partial_00_0624,
  rs_R005_ueqv_R005NYN_partial_00_0625,
  rs_R005_ueqv_R005NYN_partial_00_0626,
  rs_R005_ueqv_R005NYN_partial_00_0627,
  rs_R005_ueqv_R005NYN_partial_00_0628,
  rs_R005_ueqv_R005NYN_partial_00_0629,
  rs_R005_ueqv_R005NYN_partial_00_0630,
  rs_R005_ueqv_R005NYN_partial_00_0631,
  rs_R005_ueqv_R005NYN_partial_00_0632,
  rs_R005_ueqv_R005NYN_partial_00_0633,
  rs_R005_ueqv_R005NYN_partial_00_0634,
  rs_R005_ueqv_R005NYN_partial_00_0635,
  rs_R005_ueqv_R005NYN_partial_00_0636,
  rs_R005_ueqv_R005NYN_partial_00_0637,
  rs_R005_ueqv_R005NYN_partial_00_0638,
  rs_R005_ueqv_R005NYN_partial_00_0639,
  rs_R005_ueqv_R005NYN_partial_00_0640,
  rs_R005_ueqv_R005NYN_partial_00_0641,
  rs_R005_ueqv_R005NYN_partial_00_0642,
  rs_R005_ueqv_R005NYN_partial_00_0643,
  rs_R005_ueqv_R005NYN_partial_00_0644,
  rs_R005_ueqv_R005NYN_partial_00_0645,
  rs_R005_ueqv_R005NYN_partial_00_0646,
  rs_R005_ueqv_R005NYN_partial_00_0647,
  rs_R005_ueqv_R005NYN_partial_00_0648,
  rs_R005_ueqv_R005NYN_partial_00_0649,
  rs_R005_ueqv_R005NYN_partial_00_0650,
  rs_R005_ueqv_R005NYN_partial_00_0651,
  rs_R005_ueqv_R005NYN_partial_00_0652,
  rs_R005_ueqv_R005NYN_partial_00_0653,
  rs_R005_ueqv_R005NYN_partial_00_0654,
  rs_R005_ueqv_R005NYN_partial_00_0655,
  rs_R005_ueqv_R005NYN_partial_00_0656,
  rs_R005_ueqv_R005NYN_partial_00_0657,
  rs_R005_ueqv_R005NYN_partial_00_0658,
  rs_R005_ueqv_R005NYN_partial_00_0659,
  rs_R005_ueqv_R005NYN_partial_00_0660,
  rs_R005_ueqv_R005NYN_partial_00_0661,
  rs_R005_ueqv_R005NYN_partial_00_0662,
  rs_R005_ueqv_R005NYN_partial_00_0663,
  rs_R005_ueqv_R005NYN_partial_00_0664,
  rs_R005_ueqv_R005NYN_partial_00_0665,
  rs_R005_ueqv_R005NYN_partial_00_0666,
  rs_R005_ueqv_R005NYN_partial_00_0667,
  rs_R005_ueqv_R005NYN_partial_00_0668,
  rs_R005_ueqv_R005NYN_partial_00_0669,
  rs_R005_ueqv_R005NYN_partial_00_0670,
  rs_R005_ueqv_R005NYN_partial_00_0671,
  rs_R005_ueqv_R005NYN_partial_00_0672,
  rs_R005_ueqv_R005NYN_partial_00_0673,
  rs_R005_ueqv_R005NYN_partial_00_0674,
  rs_R005_ueqv_R005NYN_partial_00_0675,
  rs_R005_ueqv_R005NYN_partial_00_0676,
  rs_R005_ueqv_R005NYN_partial_00_0677
]

/-- Sum of partial products in this block. -/
def rs_R005_ueqv_R005NYN_block_00_0600_0677 : Poly :=
[
  term ((113001540 : Rat) / 385571) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((16544960 : Rat) / 158397) [(0, 2), (5, 1), (15, 3)],
  term ((-88080200 : Rat) / 385571) [(0, 2), (5, 1), (15, 3), (16, 1)],
  term ((1690808 : Rat) / 158397) [(0, 2), (5, 2)],
  term ((-4718720 : Rat) / 52799) [(0, 2), (5, 2), (6, 1), (8, 1), (13, 1), (15, 1)],
  term ((65940144 : Rat) / 385571) [(0, 2), (5, 2), (6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((4718720 : Rat) / 52799) [(0, 2), (5, 2), (6, 1), (13, 1), (15, 1)],
  term ((-65940144 : Rat) / 385571) [(0, 2), (5, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((33089920 : Rat) / 158397) [(0, 2), (5, 2), (8, 1), (13, 1), (15, 1)],
  term ((-176160400 : Rat) / 385571) [(0, 2), (5, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5980160 : Rat) / 52799) [(0, 2), (5, 2), (9, 1), (15, 1)],
  term ((12806592 : Rat) / 385571) [(0, 2), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-33089920 : Rat) / 158397) [(0, 2), (5, 2), (13, 1), (15, 1)],
  term ((176160400 : Rat) / 385571) [(0, 2), (5, 2), (13, 1), (15, 1), (16, 1)],
  term ((-678880 : Rat) / 52799) [(0, 2), (6, 1), (13, 1), (15, 1)],
  term ((18332604 : Rat) / 385571) [(0, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((678880 : Rat) / 52799) [(0, 2), (7, 1), (12, 1), (15, 1)],
  term ((-18332604 : Rat) / 385571) [(0, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((645440 : Rat) / 158397) [(0, 2), (7, 1), (15, 1)],
  term ((14685160 : Rat) / 385571) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((-1390720 : Rat) / 158397) [(0, 2), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((-37175504 : Rat) / 385571) [(0, 2), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-2781440 : Rat) / 158397) [(0, 2), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-74351008 : Rat) / 385571) [(0, 2), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-701728 : Rat) / 158397) [(0, 2), (8, 1), (9, 1), (15, 1)],
  term ((-15098852 : Rat) / 385571) [(0, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1390720 : Rat) / 158397) [(0, 2), (8, 1), (9, 1), (15, 3)],
  term ((-37175504 : Rat) / 385571) [(0, 2), (8, 1), (9, 1), (15, 3), (16, 1)],
  term ((-5181440 : Rat) / 158397) [(0, 2), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((21092000 : Rat) / 385571) [(0, 2), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((2007040 : Rat) / 158397) [(0, 2), (8, 1), (10, 1), (15, 2)],
  term ((-9973120 : Rat) / 385571) [(0, 2), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-10362880 : Rat) / 158397) [(0, 2), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((42184000 : Rat) / 385571) [(0, 2), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((2186240 : Rat) / 158397) [(0, 2), (8, 1), (11, 1), (15, 1)],
  term ((-15751256 : Rat) / 385571) [(0, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-5181440 : Rat) / 158397) [(0, 2), (8, 1), (11, 1), (15, 3)],
  term ((21092000 : Rat) / 385571) [(0, 2), (8, 1), (11, 1), (15, 3), (16, 1)],
  term ((4014080 : Rat) / 158397) [(0, 2), (8, 1), (12, 1), (15, 2)],
  term ((-19946240 : Rat) / 385571) [(0, 2), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((1096896 : Rat) / 52799) [(0, 2), (8, 1), (15, 2)],
  term ((13139280 : Rat) / 385571) [(0, 2), (8, 1), (15, 2), (16, 1)],
  term ((2007040 : Rat) / 158397) [(0, 2), (8, 1), (15, 4)],
  term ((-9973120 : Rat) / 385571) [(0, 2), (8, 1), (15, 4), (16, 1)],
  term ((4565120 : Rat) / 158397) [(0, 2), (9, 1), (10, 1), (15, 1)],
  term ((26056624 : Rat) / 385571) [(0, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((2007040 : Rat) / 158397) [(0, 2), (9, 1), (11, 1), (15, 2)],
  term ((-9973120 : Rat) / 385571) [(0, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-5181440 : Rat) / 158397) [(0, 2), (9, 1), (11, 2), (15, 1)],
  term ((21092000 : Rat) / 385571) [(0, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((4460800 : Rat) / 158397) [(0, 2), (9, 1), (12, 1), (15, 1)],
  term ((56696288 : Rat) / 385571) [(0, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3121568 : Rat) / 52799) [(0, 2), (9, 1), (15, 1)],
  term ((-15837384 : Rat) / 385571) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((2230400 : Rat) / 158397) [(0, 2), (9, 1), (15, 3)],
  term ((28348144 : Rat) / 385571) [(0, 2), (9, 1), (15, 3), (16, 1)],
  term ((-3520640 : Rat) / 158397) [(0, 2), (9, 2), (11, 1), (15, 1)],
  term ((-41487568 : Rat) / 385571) [(0, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((2867200 : Rat) / 158397) [(0, 2), (9, 2), (15, 2)],
  term ((-1213504 : Rat) / 385571) [(0, 2), (9, 2), (15, 2), (16, 1)],
  term ((5181440 : Rat) / 158397) [(0, 2), (10, 1), (11, 1), (15, 1)],
  term ((-21092000 : Rat) / 385571) [(0, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1576960 : Rat) / 52799) [(0, 2), (10, 1), (15, 2)],
  term ((12646560 : Rat) / 385571) [(0, 2), (10, 1), (15, 2), (16, 1)],
  term ((10362880 : Rat) / 158397) [(0, 2), (11, 1), (12, 1), (15, 1)],
  term ((-42184000 : Rat) / 385571) [(0, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-6351136 : Rat) / 158397) [(0, 2), (11, 1), (15, 1)],
  term ((8486608 : Rat) / 385571) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((5181440 : Rat) / 158397) [(0, 2), (11, 1), (15, 3)],
  term ((-21092000 : Rat) / 385571) [(0, 2), (11, 1), (15, 3), (16, 1)],
  term ((-4014080 : Rat) / 158397) [(0, 2), (12, 1), (15, 2)],
  term ((19946240 : Rat) / 385571) [(0, 2), (12, 1), (15, 2), (16, 1)],
  term ((678880 : Rat) / 52799) [(0, 2), (13, 1), (15, 1)],
  term ((-18332604 : Rat) / 385571) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((1721064 : Rat) / 52799) [(0, 2), (15, 2)],
  term ((-13658088 : Rat) / 385571) [(0, 2), (15, 2), (16, 1)],
  term ((-2007040 : Rat) / 158397) [(0, 2), (15, 4)],
  term ((9973120 : Rat) / 385571) [(0, 2), (15, 4), (16, 1)],
  term ((113001540 : Rat) / 385571) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((16544960 : Rat) / 158397) [(1, 2), (5, 1), (15, 3)],
  term ((-88080200 : Rat) / 385571) [(1, 2), (5, 1), (15, 3), (16, 1)],
  term ((1690808 : Rat) / 158397) [(1, 2), (5, 2)],
  term ((-4718720 : Rat) / 52799) [(1, 2), (5, 2), (6, 1), (8, 1), (13, 1), (15, 1)],
  term ((65940144 : Rat) / 385571) [(1, 2), (5, 2), (6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((4718720 : Rat) / 52799) [(1, 2), (5, 2), (6, 1), (13, 1), (15, 1)],
  term ((-65940144 : Rat) / 385571) [(1, 2), (5, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((33089920 : Rat) / 158397) [(1, 2), (5, 2), (8, 1), (13, 1), (15, 1)],
  term ((-176160400 : Rat) / 385571) [(1, 2), (5, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5980160 : Rat) / 52799) [(1, 2), (5, 2), (9, 1), (15, 1)],
  term ((12806592 : Rat) / 385571) [(1, 2), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-33089920 : Rat) / 158397) [(1, 2), (5, 2), (13, 1), (15, 1)],
  term ((176160400 : Rat) / 385571) [(1, 2), (5, 2), (13, 1), (15, 1), (16, 1)],
  term ((-678880 : Rat) / 52799) [(1, 2), (6, 1), (13, 1), (15, 1)],
  term ((18332604 : Rat) / 385571) [(1, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((678880 : Rat) / 52799) [(1, 2), (7, 1), (12, 1), (15, 1)],
  term ((-18332604 : Rat) / 385571) [(1, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((645440 : Rat) / 158397) [(1, 2), (7, 1), (15, 1)],
  term ((14685160 : Rat) / 385571) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((-1390720 : Rat) / 158397) [(1, 2), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((-37175504 : Rat) / 385571) [(1, 2), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-2781440 : Rat) / 158397) [(1, 2), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-74351008 : Rat) / 385571) [(1, 2), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-701728 : Rat) / 158397) [(1, 2), (8, 1), (9, 1), (15, 1)],
  term ((-15098852 : Rat) / 385571) [(1, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1390720 : Rat) / 158397) [(1, 2), (8, 1), (9, 1), (15, 3)],
  term ((-37175504 : Rat) / 385571) [(1, 2), (8, 1), (9, 1), (15, 3), (16, 1)],
  term ((-5181440 : Rat) / 158397) [(1, 2), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((21092000 : Rat) / 385571) [(1, 2), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((2007040 : Rat) / 158397) [(1, 2), (8, 1), (10, 1), (15, 2)],
  term ((-9973120 : Rat) / 385571) [(1, 2), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-10362880 : Rat) / 158397) [(1, 2), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((42184000 : Rat) / 385571) [(1, 2), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((2186240 : Rat) / 158397) [(1, 2), (8, 1), (11, 1), (15, 1)],
  term ((-15751256 : Rat) / 385571) [(1, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-5181440 : Rat) / 158397) [(1, 2), (8, 1), (11, 1), (15, 3)],
  term ((21092000 : Rat) / 385571) [(1, 2), (8, 1), (11, 1), (15, 3), (16, 1)],
  term ((4014080 : Rat) / 158397) [(1, 2), (8, 1), (12, 1), (15, 2)],
  term ((-19946240 : Rat) / 385571) [(1, 2), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((1096896 : Rat) / 52799) [(1, 2), (8, 1), (15, 2)],
  term ((13139280 : Rat) / 385571) [(1, 2), (8, 1), (15, 2), (16, 1)],
  term ((2007040 : Rat) / 158397) [(1, 2), (8, 1), (15, 4)],
  term ((-9973120 : Rat) / 385571) [(1, 2), (8, 1), (15, 4), (16, 1)],
  term ((4565120 : Rat) / 158397) [(1, 2), (9, 1), (10, 1), (15, 1)],
  term ((26056624 : Rat) / 385571) [(1, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((2007040 : Rat) / 158397) [(1, 2), (9, 1), (11, 1), (15, 2)],
  term ((-9973120 : Rat) / 385571) [(1, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-5181440 : Rat) / 158397) [(1, 2), (9, 1), (11, 2), (15, 1)],
  term ((21092000 : Rat) / 385571) [(1, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((4460800 : Rat) / 158397) [(1, 2), (9, 1), (12, 1), (15, 1)],
  term ((56696288 : Rat) / 385571) [(1, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3121568 : Rat) / 52799) [(1, 2), (9, 1), (15, 1)],
  term ((-15837384 : Rat) / 385571) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((2230400 : Rat) / 158397) [(1, 2), (9, 1), (15, 3)],
  term ((28348144 : Rat) / 385571) [(1, 2), (9, 1), (15, 3), (16, 1)],
  term ((-3520640 : Rat) / 158397) [(1, 2), (9, 2), (11, 1), (15, 1)],
  term ((-41487568 : Rat) / 385571) [(1, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((2867200 : Rat) / 158397) [(1, 2), (9, 2), (15, 2)],
  term ((-1213504 : Rat) / 385571) [(1, 2), (9, 2), (15, 2), (16, 1)],
  term ((5181440 : Rat) / 158397) [(1, 2), (10, 1), (11, 1), (15, 1)],
  term ((-21092000 : Rat) / 385571) [(1, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1576960 : Rat) / 52799) [(1, 2), (10, 1), (15, 2)],
  term ((12646560 : Rat) / 385571) [(1, 2), (10, 1), (15, 2), (16, 1)],
  term ((10362880 : Rat) / 158397) [(1, 2), (11, 1), (12, 1), (15, 1)],
  term ((-42184000 : Rat) / 385571) [(1, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-6351136 : Rat) / 158397) [(1, 2), (11, 1), (15, 1)],
  term ((8486608 : Rat) / 385571) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((5181440 : Rat) / 158397) [(1, 2), (11, 1), (15, 3)],
  term ((-21092000 : Rat) / 385571) [(1, 2), (11, 1), (15, 3), (16, 1)],
  term ((-4014080 : Rat) / 158397) [(1, 2), (12, 1), (15, 2)],
  term ((19946240 : Rat) / 385571) [(1, 2), (12, 1), (15, 2), (16, 1)],
  term ((678880 : Rat) / 52799) [(1, 2), (13, 1), (15, 1)],
  term ((-18332604 : Rat) / 385571) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((1721064 : Rat) / 52799) [(1, 2), (15, 2)],
  term ((-13658088 : Rat) / 385571) [(1, 2), (15, 2), (16, 1)],
  term ((-2007040 : Rat) / 158397) [(1, 2), (15, 4)],
  term ((9973120 : Rat) / 385571) [(1, 2), (15, 4), (16, 1)],
  term ((-113001540 : Rat) / 385571) [(2, 2), (5, 1), (15, 1), (16, 1)],
  term ((-16544960 : Rat) / 158397) [(2, 2), (5, 1), (15, 3)],
  term ((88080200 : Rat) / 385571) [(2, 2), (5, 1), (15, 3), (16, 1)],
  term ((-1690808 : Rat) / 158397) [(2, 2), (5, 2)],
  term ((4718720 : Rat) / 52799) [(2, 2), (5, 2), (6, 1), (8, 1), (13, 1), (15, 1)],
  term ((-65940144 : Rat) / 385571) [(2, 2), (5, 2), (6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4718720 : Rat) / 52799) [(2, 2), (5, 2), (6, 1), (13, 1), (15, 1)],
  term ((65940144 : Rat) / 385571) [(2, 2), (5, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-33089920 : Rat) / 158397) [(2, 2), (5, 2), (8, 1), (13, 1), (15, 1)],
  term ((176160400 : Rat) / 385571) [(2, 2), (5, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((5980160 : Rat) / 52799) [(2, 2), (5, 2), (9, 1), (15, 1)],
  term ((-12806592 : Rat) / 385571) [(2, 2), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((33089920 : Rat) / 158397) [(2, 2), (5, 2), (13, 1), (15, 1)],
  term ((-176160400 : Rat) / 385571) [(2, 2), (5, 2), (13, 1), (15, 1), (16, 1)],
  term ((678880 : Rat) / 52799) [(2, 2), (6, 1), (13, 1), (15, 1)],
  term ((-18332604 : Rat) / 385571) [(2, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-678880 : Rat) / 52799) [(2, 2), (7, 1), (12, 1), (15, 1)],
  term ((18332604 : Rat) / 385571) [(2, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-645440 : Rat) / 158397) [(2, 2), (7, 1), (15, 1)],
  term ((-14685160 : Rat) / 385571) [(2, 2), (7, 1), (15, 1), (16, 1)],
  term ((1390720 : Rat) / 158397) [(2, 2), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((37175504 : Rat) / 385571) [(2, 2), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((2781440 : Rat) / 158397) [(2, 2), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((74351008 : Rat) / 385571) [(2, 2), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((701728 : Rat) / 158397) [(2, 2), (8, 1), (9, 1), (15, 1)],
  term ((15098852 : Rat) / 385571) [(2, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((1390720 : Rat) / 158397) [(2, 2), (8, 1), (9, 1), (15, 3)],
  term ((37175504 : Rat) / 385571) [(2, 2), (8, 1), (9, 1), (15, 3), (16, 1)],
  term ((5181440 : Rat) / 158397) [(2, 2), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-21092000 : Rat) / 385571) [(2, 2), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2007040 : Rat) / 158397) [(2, 2), (8, 1), (10, 1), (15, 2)],
  term ((9973120 : Rat) / 385571) [(2, 2), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((10362880 : Rat) / 158397) [(2, 2), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-42184000 : Rat) / 385571) [(2, 2), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2186240 : Rat) / 158397) [(2, 2), (8, 1), (11, 1), (15, 1)],
  term ((15751256 : Rat) / 385571) [(2, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((5181440 : Rat) / 158397) [(2, 2), (8, 1), (11, 1), (15, 3)],
  term ((-21092000 : Rat) / 385571) [(2, 2), (8, 1), (11, 1), (15, 3), (16, 1)],
  term ((-4014080 : Rat) / 158397) [(2, 2), (8, 1), (12, 1), (15, 2)],
  term ((19946240 : Rat) / 385571) [(2, 2), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1096896 : Rat) / 52799) [(2, 2), (8, 1), (15, 2)],
  term ((-13139280 : Rat) / 385571) [(2, 2), (8, 1), (15, 2), (16, 1)],
  term ((-2007040 : Rat) / 158397) [(2, 2), (8, 1), (15, 4)],
  term ((9973120 : Rat) / 385571) [(2, 2), (8, 1), (15, 4), (16, 1)],
  term ((-4565120 : Rat) / 158397) [(2, 2), (9, 1), (10, 1), (15, 1)],
  term ((-26056624 : Rat) / 385571) [(2, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-2007040 : Rat) / 158397) [(2, 2), (9, 1), (11, 1), (15, 2)],
  term ((9973120 : Rat) / 385571) [(2, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((5181440 : Rat) / 158397) [(2, 2), (9, 1), (11, 2), (15, 1)],
  term ((-21092000 : Rat) / 385571) [(2, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-4460800 : Rat) / 158397) [(2, 2), (9, 1), (12, 1), (15, 1)],
  term ((-56696288 : Rat) / 385571) [(2, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((3121568 : Rat) / 52799) [(2, 2), (9, 1), (15, 1)],
  term ((15837384 : Rat) / 385571) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((-2230400 : Rat) / 158397) [(2, 2), (9, 1), (15, 3)],
  term ((-28348144 : Rat) / 385571) [(2, 2), (9, 1), (15, 3), (16, 1)],
  term ((3520640 : Rat) / 158397) [(2, 2), (9, 2), (11, 1), (15, 1)],
  term ((41487568 : Rat) / 385571) [(2, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-2867200 : Rat) / 158397) [(2, 2), (9, 2), (15, 2)],
  term ((1213504 : Rat) / 385571) [(2, 2), (9, 2), (15, 2), (16, 1)],
  term ((-5181440 : Rat) / 158397) [(2, 2), (10, 1), (11, 1), (15, 1)],
  term ((21092000 : Rat) / 385571) [(2, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((1576960 : Rat) / 52799) [(2, 2), (10, 1), (15, 2)],
  term ((-12646560 : Rat) / 385571) [(2, 2), (10, 1), (15, 2), (16, 1)],
  term ((-10362880 : Rat) / 158397) [(2, 2), (11, 1), (12, 1), (15, 1)],
  term ((42184000 : Rat) / 385571) [(2, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((6351136 : Rat) / 158397) [(2, 2), (11, 1), (15, 1)],
  term ((-8486608 : Rat) / 385571) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((-5181440 : Rat) / 158397) [(2, 2), (11, 1), (15, 3)],
  term ((21092000 : Rat) / 385571) [(2, 2), (11, 1), (15, 3), (16, 1)],
  term ((4014080 : Rat) / 158397) [(2, 2), (12, 1), (15, 2)],
  term ((-19946240 : Rat) / 385571) [(2, 2), (12, 1), (15, 2), (16, 1)],
  term ((-678880 : Rat) / 52799) [(2, 2), (13, 1), (15, 1)],
  term ((18332604 : Rat) / 385571) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1721064 : Rat) / 52799) [(2, 2), (15, 2)],
  term ((13658088 : Rat) / 385571) [(2, 2), (15, 2), (16, 1)],
  term ((2007040 : Rat) / 158397) [(2, 2), (15, 4)],
  term ((-9973120 : Rat) / 385571) [(2, 2), (15, 4), (16, 1)],
  term ((-113001540 : Rat) / 385571) [(3, 2), (5, 1), (15, 1), (16, 1)],
  term ((-16544960 : Rat) / 158397) [(3, 2), (5, 1), (15, 3)],
  term ((88080200 : Rat) / 385571) [(3, 2), (5, 1), (15, 3), (16, 1)],
  term ((-1690808 : Rat) / 158397) [(3, 2), (5, 2)],
  term ((4718720 : Rat) / 52799) [(3, 2), (5, 2), (6, 1), (8, 1), (13, 1), (15, 1)],
  term ((-65940144 : Rat) / 385571) [(3, 2), (5, 2), (6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4718720 : Rat) / 52799) [(3, 2), (5, 2), (6, 1), (13, 1), (15, 1)],
  term ((65940144 : Rat) / 385571) [(3, 2), (5, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-33089920 : Rat) / 158397) [(3, 2), (5, 2), (8, 1), (13, 1), (15, 1)],
  term ((176160400 : Rat) / 385571) [(3, 2), (5, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((5980160 : Rat) / 52799) [(3, 2), (5, 2), (9, 1), (15, 1)],
  term ((-12806592 : Rat) / 385571) [(3, 2), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((33089920 : Rat) / 158397) [(3, 2), (5, 2), (13, 1), (15, 1)],
  term ((-176160400 : Rat) / 385571) [(3, 2), (5, 2), (13, 1), (15, 1), (16, 1)],
  term ((678880 : Rat) / 52799) [(3, 2), (6, 1), (13, 1), (15, 1)],
  term ((-18332604 : Rat) / 385571) [(3, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-678880 : Rat) / 52799) [(3, 2), (7, 1), (12, 1), (15, 1)],
  term ((18332604 : Rat) / 385571) [(3, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-645440 : Rat) / 158397) [(3, 2), (7, 1), (15, 1)],
  term ((-14685160 : Rat) / 385571) [(3, 2), (7, 1), (15, 1), (16, 1)],
  term ((1390720 : Rat) / 158397) [(3, 2), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((37175504 : Rat) / 385571) [(3, 2), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((2781440 : Rat) / 158397) [(3, 2), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((74351008 : Rat) / 385571) [(3, 2), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((701728 : Rat) / 158397) [(3, 2), (8, 1), (9, 1), (15, 1)],
  term ((15098852 : Rat) / 385571) [(3, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((1390720 : Rat) / 158397) [(3, 2), (8, 1), (9, 1), (15, 3)],
  term ((37175504 : Rat) / 385571) [(3, 2), (8, 1), (9, 1), (15, 3), (16, 1)],
  term ((5181440 : Rat) / 158397) [(3, 2), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-21092000 : Rat) / 385571) [(3, 2), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2007040 : Rat) / 158397) [(3, 2), (8, 1), (10, 1), (15, 2)],
  term ((9973120 : Rat) / 385571) [(3, 2), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((10362880 : Rat) / 158397) [(3, 2), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-42184000 : Rat) / 385571) [(3, 2), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2186240 : Rat) / 158397) [(3, 2), (8, 1), (11, 1), (15, 1)],
  term ((15751256 : Rat) / 385571) [(3, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((5181440 : Rat) / 158397) [(3, 2), (8, 1), (11, 1), (15, 3)],
  term ((-21092000 : Rat) / 385571) [(3, 2), (8, 1), (11, 1), (15, 3), (16, 1)],
  term ((-4014080 : Rat) / 158397) [(3, 2), (8, 1), (12, 1), (15, 2)],
  term ((19946240 : Rat) / 385571) [(3, 2), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1096896 : Rat) / 52799) [(3, 2), (8, 1), (15, 2)],
  term ((-13139280 : Rat) / 385571) [(3, 2), (8, 1), (15, 2), (16, 1)],
  term ((-2007040 : Rat) / 158397) [(3, 2), (8, 1), (15, 4)],
  term ((9973120 : Rat) / 385571) [(3, 2), (8, 1), (15, 4), (16, 1)],
  term ((-4565120 : Rat) / 158397) [(3, 2), (9, 1), (10, 1), (15, 1)],
  term ((-26056624 : Rat) / 385571) [(3, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-2007040 : Rat) / 158397) [(3, 2), (9, 1), (11, 1), (15, 2)],
  term ((9973120 : Rat) / 385571) [(3, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((5181440 : Rat) / 158397) [(3, 2), (9, 1), (11, 2), (15, 1)],
  term ((-21092000 : Rat) / 385571) [(3, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-4460800 : Rat) / 158397) [(3, 2), (9, 1), (12, 1), (15, 1)],
  term ((-56696288 : Rat) / 385571) [(3, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((3121568 : Rat) / 52799) [(3, 2), (9, 1), (15, 1)],
  term ((15837384 : Rat) / 385571) [(3, 2), (9, 1), (15, 1), (16, 1)],
  term ((-2230400 : Rat) / 158397) [(3, 2), (9, 1), (15, 3)],
  term ((-28348144 : Rat) / 385571) [(3, 2), (9, 1), (15, 3), (16, 1)],
  term ((3520640 : Rat) / 158397) [(3, 2), (9, 2), (11, 1), (15, 1)],
  term ((41487568 : Rat) / 385571) [(3, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-2867200 : Rat) / 158397) [(3, 2), (9, 2), (15, 2)],
  term ((1213504 : Rat) / 385571) [(3, 2), (9, 2), (15, 2), (16, 1)],
  term ((-5181440 : Rat) / 158397) [(3, 2), (10, 1), (11, 1), (15, 1)],
  term ((21092000 : Rat) / 385571) [(3, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((1576960 : Rat) / 52799) [(3, 2), (10, 1), (15, 2)],
  term ((-12646560 : Rat) / 385571) [(3, 2), (10, 1), (15, 2), (16, 1)],
  term ((-10362880 : Rat) / 158397) [(3, 2), (11, 1), (12, 1), (15, 1)],
  term ((42184000 : Rat) / 385571) [(3, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((6351136 : Rat) / 158397) [(3, 2), (11, 1), (15, 1)],
  term ((-8486608 : Rat) / 385571) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-5181440 : Rat) / 158397) [(3, 2), (11, 1), (15, 3)],
  term ((21092000 : Rat) / 385571) [(3, 2), (11, 1), (15, 3), (16, 1)],
  term ((4014080 : Rat) / 158397) [(3, 2), (12, 1), (15, 2)],
  term ((-19946240 : Rat) / 385571) [(3, 2), (12, 1), (15, 2), (16, 1)],
  term ((-678880 : Rat) / 52799) [(3, 2), (13, 1), (15, 1)],
  term ((18332604 : Rat) / 385571) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1721064 : Rat) / 52799) [(3, 2), (15, 2)],
  term ((13658088 : Rat) / 385571) [(3, 2), (15, 2), (16, 1)],
  term ((2007040 : Rat) / 158397) [(3, 2), (15, 4)],
  term ((-9973120 : Rat) / 385571) [(3, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 0, terms 600 through 677. -/
theorem rs_R005_ueqv_R005NYN_block_00_0600_0677_valid :
    checkProductSumEq rs_R005_ueqv_R005NYN_partials_00_0600_0677
      rs_R005_ueqv_R005NYN_block_00_0600_0677 = true := by
  native_decide

end R005UeqvR005NYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
