/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010NYN, term block 25:800-848

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010NYNTermShards

/-- Generator polynomial 25 for relaxed split surplus certificate `R010:u=v:R010NYN`. -/
def rs_R010_ueqv_R010NYN_generator_25_0800_0848 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(12, 1)]
]

/-- Coefficient term 800 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0800 : Poly :=
[
  term ((2423808 : Rat) / 2995) [(10, 1), (14, 1), (15, 2)]
]

/-- Partial product 800 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0800 : Poly :=
[
  term ((4847616 : Rat) / 2995) [(10, 1), (12, 1), (14, 1), (15, 2)],
  term ((-2423808 : Rat) / 2995) [(10, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 800 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0800_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0800
        rs_R010_ueqv_R010NYN_generator_25_0800_0848 =
      rs_R010_ueqv_R010NYN_partial_25_0800 := by
  native_decide

/-- Coefficient term 801 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0801 : Poly :=
[
  term ((-534 : Rat) / 5) [(10, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 801 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0801 : Poly :=
[
  term ((-1068 : Rat) / 5) [(10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((534 : Rat) / 5) [(10, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 801 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0801_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0801
        rs_R010_ueqv_R010NYN_generator_25_0800_0848 =
      rs_R010_ueqv_R010NYN_partial_25_0801 := by
  native_decide

/-- Coefficient term 802 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0802 : Poly :=
[
  term ((-270066 : Rat) / 2995) [(10, 1), (15, 2)]
]

/-- Partial product 802 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0802 : Poly :=
[
  term ((-540132 : Rat) / 2995) [(10, 1), (12, 1), (15, 2)],
  term ((270066 : Rat) / 2995) [(10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 802 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0802_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0802
        rs_R010_ueqv_R010NYN_generator_25_0800_0848 =
      rs_R010_ueqv_R010NYN_partial_25_0802 := by
  native_decide

/-- Coefficient term 803 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0803 : Poly :=
[
  term ((88 : Rat) / 5) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 803 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0803 : Poly :=
[
  term ((176 : Rat) / 5) [(10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-88 : Rat) / 5) [(10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 803 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0803_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0803
        rs_R010_ueqv_R010NYN_generator_25_0800_0848 =
      rs_R010_ueqv_R010NYN_partial_25_0803 := by
  native_decide

/-- Coefficient term 804 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0804 : Poly :=
[
  term ((-642816 : Rat) / 2995) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 804 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0804 : Poly :=
[
  term ((642816 : Rat) / 2995) [(11, 1), (12, 1), (15, 1)],
  term ((-1285632 : Rat) / 2995) [(11, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 804 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0804_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0804
        rs_R010_ueqv_R010NYN_generator_25_0800_0848 =
      rs_R010_ueqv_R010NYN_partial_25_0804 := by
  native_decide

/-- Coefficient term 805 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0805 : Poly :=
[
  term ((-756288 : Rat) / 2995) [(11, 1), (12, 1), (15, 3)]
]

/-- Partial product 805 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0805 : Poly :=
[
  term ((756288 : Rat) / 2995) [(11, 1), (12, 1), (15, 3)],
  term ((-1512576 : Rat) / 2995) [(11, 1), (12, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 805 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0805_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0805
        rs_R010_ueqv_R010NYN_generator_25_0800_0848 =
      rs_R010_ueqv_R010NYN_partial_25_0805 := by
  native_decide

/-- Coefficient term 806 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0806 : Poly :=
[
  term ((184 : Rat) / 5) [(11, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 806 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0806 : Poly :=
[
  term ((-184 : Rat) / 5) [(11, 1), (12, 1), (15, 3), (16, 1)],
  term ((368 : Rat) / 5) [(11, 1), (12, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 806 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0806_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0806
        rs_R010_ueqv_R010NYN_generator_25_0800_0848 =
      rs_R010_ueqv_R010NYN_partial_25_0806 := by
  native_decide

/-- Coefficient term 807 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0807 : Poly :=
[
  term ((-406224 : Rat) / 2995) [(11, 1), (13, 1)]
]

/-- Partial product 807 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0807 : Poly :=
[
  term ((-812448 : Rat) / 2995) [(11, 1), (12, 1), (13, 1)],
  term ((406224 : Rat) / 2995) [(11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 807 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0807_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0807
        rs_R010_ueqv_R010NYN_generator_25_0800_0848 =
      rs_R010_ueqv_R010NYN_partial_25_0807 := by
  native_decide

/-- Coefficient term 808 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0808 : Poly :=
[
  term ((428544 : Rat) / 2995) [(11, 1), (13, 1), (14, 1)]
]

/-- Partial product 808 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0808 : Poly :=
[
  term ((857088 : Rat) / 2995) [(11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-428544 : Rat) / 2995) [(11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 808 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0808_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0808
        rs_R010_ueqv_R010NYN_generator_25_0800_0848 =
      rs_R010_ueqv_R010NYN_partial_25_0808 := by
  native_decide

/-- Coefficient term 809 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0809 : Poly :=
[
  term ((175680 : Rat) / 599) [(11, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 809 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0809 : Poly :=
[
  term ((351360 : Rat) / 599) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-175680 : Rat) / 599) [(11, 1), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 809 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0809_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0809
        rs_R010_ueqv_R010NYN_generator_25_0800_0848 =
      rs_R010_ueqv_R010NYN_partial_25_0809 := by
  native_decide

/-- Coefficient term 810 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0810 : Poly :=
[
  term (-50 : Rat) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 810 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0810 : Poly :=
[
  term (-100 : Rat) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term (50 : Rat) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 810 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0810_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0810
        rs_R010_ueqv_R010NYN_generator_25_0800_0848 =
      rs_R010_ueqv_R010NYN_partial_25_0810 := by
  native_decide

/-- Coefficient term 811 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0811 : Poly :=
[
  term ((6842112 : Rat) / 2995) [(11, 1), (13, 1), (15, 2)]
]

/-- Partial product 811 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0811 : Poly :=
[
  term ((13684224 : Rat) / 2995) [(11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-6842112 : Rat) / 2995) [(11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 811 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0811_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0811
        rs_R010_ueqv_R010NYN_generator_25_0800_0848 =
      rs_R010_ueqv_R010NYN_partial_25_0811 := by
  native_decide

/-- Coefficient term 812 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0812 : Poly :=
[
  term ((-1473 : Rat) / 5) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 812 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0812 : Poly :=
[
  term ((-2946 : Rat) / 5) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((1473 : Rat) / 5) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 812 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0812_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0812
        rs_R010_ueqv_R010NYN_generator_25_0800_0848 =
      rs_R010_ueqv_R010NYN_partial_25_0812 := by
  native_decide

/-- Coefficient term 813 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0813 : Poly :=
[
  term ((-6663054 : Rat) / 2995) [(11, 1), (14, 1), (15, 1)]
]

/-- Partial product 813 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0813 : Poly :=
[
  term ((-13326108 : Rat) / 2995) [(11, 1), (12, 1), (14, 1), (15, 1)],
  term ((6663054 : Rat) / 2995) [(11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 813 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0813_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0813
        rs_R010_ueqv_R010NYN_generator_25_0800_0848 =
      rs_R010_ueqv_R010NYN_partial_25_0813 := by
  native_decide

/-- Coefficient term 814 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0814 : Poly :=
[
  term (296 : Rat) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 814 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0814 : Poly :=
[
  term (592 : Rat) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term (-296 : Rat) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 814 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0814_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0814
        rs_R010_ueqv_R010NYN_generator_25_0800_0848 =
      rs_R010_ueqv_R010NYN_partial_25_0814 := by
  native_decide

/-- Coefficient term 815 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0815 : Poly :=
[
  term ((-122112 : Rat) / 2995) [(11, 1), (14, 1), (15, 3)]
]

/-- Partial product 815 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0815 : Poly :=
[
  term ((-244224 : Rat) / 2995) [(11, 1), (12, 1), (14, 1), (15, 3)],
  term ((122112 : Rat) / 2995) [(11, 1), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 815 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0815_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0815
        rs_R010_ueqv_R010NYN_generator_25_0800_0848 =
      rs_R010_ueqv_R010NYN_partial_25_0815 := by
  native_decide

/-- Coefficient term 816 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0816 : Poly :=
[
  term ((66 : Rat) / 5) [(11, 1), (14, 1), (15, 3), (16, 1)]
]

/-- Partial product 816 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0816 : Poly :=
[
  term ((132 : Rat) / 5) [(11, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-66 : Rat) / 5) [(11, 1), (14, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 816 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0816_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0816
        rs_R010_ueqv_R010NYN_generator_25_0800_0848 =
      rs_R010_ueqv_R010NYN_partial_25_0816 := by
  native_decide

/-- Coefficient term 817 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0817 : Poly :=
[
  term ((4983552 : Rat) / 2995) [(11, 1), (14, 2), (15, 1)]
]

/-- Partial product 817 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0817 : Poly :=
[
  term ((9967104 : Rat) / 2995) [(11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-4983552 : Rat) / 2995) [(11, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 817 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0817_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0817
        rs_R010_ueqv_R010NYN_generator_25_0800_0848 =
      rs_R010_ueqv_R010NYN_partial_25_0817 := by
  native_decide

/-- Coefficient term 818 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0818 : Poly :=
[
  term ((-948 : Rat) / 5) [(11, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 818 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0818 : Poly :=
[
  term ((-1896 : Rat) / 5) [(11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((948 : Rat) / 5) [(11, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 818 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0818_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0818
        rs_R010_ueqv_R010NYN_generator_25_0800_0848 =
      rs_R010_ueqv_R010NYN_partial_25_0818 := by
  native_decide

/-- Coefficient term 819 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0819 : Poly :=
[
  term ((6252069 : Rat) / 2995) [(11, 1), (15, 1)]
]

/-- Partial product 819 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0819 : Poly :=
[
  term ((12504138 : Rat) / 2995) [(11, 1), (12, 1), (15, 1)],
  term ((-6252069 : Rat) / 2995) [(11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 819 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0819_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0819
        rs_R010_ueqv_R010NYN_generator_25_0800_0848 =
      rs_R010_ueqv_R010NYN_partial_25_0819 := by
  native_decide

/-- Coefficient term 820 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0820 : Poly :=
[
  term ((-1851 : Rat) / 10) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 820 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0820 : Poly :=
[
  term ((-1851 : Rat) / 5) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1851 : Rat) / 10) [(11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 820 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0820_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0820
        rs_R010_ueqv_R010NYN_generator_25_0800_0848 =
      rs_R010_ueqv_R010NYN_partial_25_0820 := by
  native_decide

/-- Coefficient term 821 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0821 : Poly :=
[
  term ((-1077312 : Rat) / 2995) [(11, 1), (15, 3)]
]

/-- Partial product 821 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0821 : Poly :=
[
  term ((-2154624 : Rat) / 2995) [(11, 1), (12, 1), (15, 3)],
  term ((1077312 : Rat) / 2995) [(11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 821 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0821_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0821
        rs_R010_ueqv_R010NYN_generator_25_0800_0848 =
      rs_R010_ueqv_R010NYN_partial_25_0821 := by
  native_decide

/-- Coefficient term 822 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0822 : Poly :=
[
  term ((61 : Rat) / 5) [(11, 1), (15, 3), (16, 1)]
]

/-- Partial product 822 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0822 : Poly :=
[
  term ((122 : Rat) / 5) [(11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-61 : Rat) / 5) [(11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 822 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0822_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0822
        rs_R010_ueqv_R010NYN_generator_25_0800_0848 =
      rs_R010_ueqv_R010NYN_partial_25_0822 := by
  native_decide

/-- Coefficient term 823 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0823 : Poly :=
[
  term ((-2825712 : Rat) / 2995) [(11, 2)]
]

/-- Partial product 823 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0823 : Poly :=
[
  term ((2825712 : Rat) / 2995) [(11, 2)],
  term ((-5651424 : Rat) / 2995) [(11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 823 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0823_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0823
        rs_R010_ueqv_R010NYN_generator_25_0800_0848 =
      rs_R010_ueqv_R010NYN_partial_25_0823 := by
  native_decide

/-- Coefficient term 824 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0824 : Poly :=
[
  term ((642816 : Rat) / 2995) [(11, 2), (12, 1), (15, 2)]
]

/-- Partial product 824 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0824 : Poly :=
[
  term ((-642816 : Rat) / 2995) [(11, 2), (12, 1), (15, 2)],
  term ((1285632 : Rat) / 2995) [(11, 2), (12, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 824 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0824_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0824
        rs_R010_ueqv_R010NYN_generator_25_0800_0848 =
      rs_R010_ueqv_R010NYN_partial_25_0824 := by
  native_decide

/-- Coefficient term 825 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0825 : Poly :=
[
  term ((-160704 : Rat) / 599) [(11, 2), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 825 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0825 : Poly :=
[
  term ((-321408 : Rat) / 599) [(11, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((160704 : Rat) / 599) [(11, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 825 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0825_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0825
        rs_R010_ueqv_R010NYN_generator_25_0800_0848 =
      rs_R010_ueqv_R010NYN_partial_25_0825 := by
  native_decide

/-- Coefficient term 826 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0826 : Poly :=
[
  term ((-4633632 : Rat) / 2995) [(11, 2), (13, 1), (15, 1)]
]

/-- Partial product 826 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0826 : Poly :=
[
  term ((-9267264 : Rat) / 2995) [(11, 2), (12, 1), (13, 1), (15, 1)],
  term ((4633632 : Rat) / 2995) [(11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 826 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0826_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0826
        rs_R010_ueqv_R010NYN_generator_25_0800_0848 =
      rs_R010_ueqv_R010NYN_partial_25_0826 := by
  native_decide

/-- Coefficient term 827 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0827 : Poly :=
[
  term ((964224 : Rat) / 599) [(11, 2), (14, 1)]
]

/-- Partial product 827 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0827 : Poly :=
[
  term ((1928448 : Rat) / 599) [(11, 2), (12, 1), (14, 1)],
  term ((-964224 : Rat) / 599) [(11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 827 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0827_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0827
        rs_R010_ueqv_R010NYN_generator_25_0800_0848 =
      rs_R010_ueqv_R010NYN_partial_25_0827 := by
  native_decide

/-- Coefficient term 828 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0828 : Poly :=
[
  term ((160704 : Rat) / 2995) [(11, 2), (14, 1), (15, 2)]
]

/-- Partial product 828 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0828 : Poly :=
[
  term ((321408 : Rat) / 2995) [(11, 2), (12, 1), (14, 1), (15, 2)],
  term ((-160704 : Rat) / 2995) [(11, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 828 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0828_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0828
        rs_R010_ueqv_R010NYN_generator_25_0800_0848 =
      rs_R010_ueqv_R010NYN_partial_25_0828 := by
  native_decide

/-- Coefficient term 829 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0829 : Poly :=
[
  term ((-2892672 : Rat) / 2995) [(11, 2), (14, 2)]
]

/-- Partial product 829 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0829 : Poly :=
[
  term ((-5785344 : Rat) / 2995) [(11, 2), (12, 1), (14, 2)],
  term ((2892672 : Rat) / 2995) [(11, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 829 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0829_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0829
        rs_R010_ueqv_R010NYN_generator_25_0800_0848 =
      rs_R010_ueqv_R010NYN_partial_25_0829 := by
  native_decide

/-- Coefficient term 830 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0830 : Poly :=
[
  term ((712800 : Rat) / 599) [(11, 2), (15, 2)]
]

/-- Partial product 830 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0830 : Poly :=
[
  term ((1425600 : Rat) / 599) [(11, 2), (12, 1), (15, 2)],
  term ((-712800 : Rat) / 599) [(11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 830 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0830_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0830
        rs_R010_ueqv_R010NYN_generator_25_0800_0848 =
      rs_R010_ueqv_R010NYN_partial_25_0830 := by
  native_decide

/-- Coefficient term 831 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0831 : Poly :=
[
  term ((-948 : Rat) / 5) [(11, 2), (15, 2), (16, 1)]
]

/-- Partial product 831 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0831 : Poly :=
[
  term ((-1896 : Rat) / 5) [(11, 2), (12, 1), (15, 2), (16, 1)],
  term ((948 : Rat) / 5) [(11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 831 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0831_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0831
        rs_R010_ueqv_R010NYN_generator_25_0800_0848 =
      rs_R010_ueqv_R010NYN_partial_25_0831 := by
  native_decide

/-- Coefficient term 832 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0832 : Poly :=
[
  term ((-2892672 : Rat) / 2995) [(11, 3), (15, 1)]
]

/-- Partial product 832 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0832 : Poly :=
[
  term ((-5785344 : Rat) / 2995) [(11, 3), (12, 1), (15, 1)],
  term ((2892672 : Rat) / 2995) [(11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 832 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0832_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0832
        rs_R010_ueqv_R010NYN_generator_25_0800_0848 =
      rs_R010_ueqv_R010NYN_partial_25_0832 := by
  native_decide

/-- Coefficient term 833 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0833 : Poly :=
[
  term ((620728 : Rat) / 2995) [(12, 1), (15, 2)]
]

/-- Partial product 833 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0833 : Poly :=
[
  term ((-620728 : Rat) / 2995) [(12, 1), (15, 2)],
  term ((1241456 : Rat) / 2995) [(12, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 833 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0833_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0833
        rs_R010_ueqv_R010NYN_generator_25_0800_0848 =
      rs_R010_ueqv_R010NYN_partial_25_0833 := by
  native_decide

/-- Coefficient term 834 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0834 : Poly :=
[
  term ((-119 : Rat) / 5) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 834 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0834 : Poly :=
[
  term ((119 : Rat) / 5) [(12, 1), (15, 2), (16, 1)],
  term ((-238 : Rat) / 5) [(12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 834 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0834_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0834
        rs_R010_ueqv_R010NYN_generator_25_0800_0848 =
      rs_R010_ueqv_R010NYN_partial_25_0834 := by
  native_decide

/-- Coefficient term 835 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0835 : Poly :=
[
  term ((-415352 : Rat) / 2995) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 835 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0835 : Poly :=
[
  term ((-830704 : Rat) / 2995) [(12, 1), (13, 1), (14, 1), (15, 1)],
  term ((415352 : Rat) / 2995) [(13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 835 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0835_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0835
        rs_R010_ueqv_R010NYN_generator_25_0800_0848 =
      rs_R010_ueqv_R010NYN_partial_25_0835 := by
  native_decide

/-- Coefficient term 836 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0836 : Poly :=
[
  term ((86 : Rat) / 5) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 836 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0836 : Poly :=
[
  term ((172 : Rat) / 5) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-86 : Rat) / 5) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 836 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0836_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0836
        rs_R010_ueqv_R010NYN_generator_25_0800_0848 =
      rs_R010_ueqv_R010NYN_partial_25_0836 := by
  native_decide

/-- Coefficient term 837 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0837 : Poly :=
[
  term ((475792 : Rat) / 2995) [(13, 1), (15, 1)]
]

/-- Partial product 837 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0837 : Poly :=
[
  term ((951584 : Rat) / 2995) [(12, 1), (13, 1), (15, 1)],
  term ((-475792 : Rat) / 2995) [(13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 837 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0837_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0837
        rs_R010_ueqv_R010NYN_generator_25_0800_0848 =
      rs_R010_ueqv_R010NYN_partial_25_0837 := by
  native_decide

/-- Coefficient term 838 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0838 : Poly :=
[
  term ((-96 : Rat) / 5) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 838 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0838 : Poly :=
[
  term ((-192 : Rat) / 5) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((96 : Rat) / 5) [(13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 838 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0838_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0838
        rs_R010_ueqv_R010NYN_generator_25_0800_0848 =
      rs_R010_ueqv_R010NYN_partial_25_0838 := by
  native_decide

/-- Coefficient term 839 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0839 : Poly :=
[
  term ((-2423808 : Rat) / 2995) [(13, 1), (15, 3)]
]

/-- Partial product 839 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0839 : Poly :=
[
  term ((-4847616 : Rat) / 2995) [(12, 1), (13, 1), (15, 3)],
  term ((2423808 : Rat) / 2995) [(13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 839 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0839_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0839
        rs_R010_ueqv_R010NYN_generator_25_0800_0848 =
      rs_R010_ueqv_R010NYN_partial_25_0839 := by
  native_decide

/-- Coefficient term 840 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0840 : Poly :=
[
  term ((534 : Rat) / 5) [(13, 1), (15, 3), (16, 1)]
]

/-- Partial product 840 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0840 : Poly :=
[
  term ((1068 : Rat) / 5) [(12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-534 : Rat) / 5) [(13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 840 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0840_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0840
        rs_R010_ueqv_R010NYN_generator_25_0800_0848 =
      rs_R010_ueqv_R010NYN_partial_25_0840 := by
  native_decide

/-- Coefficient term 841 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0841 : Poly :=
[
  term ((-21671 : Rat) / 599) [(14, 1)]
]

/-- Partial product 841 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0841 : Poly :=
[
  term ((-43342 : Rat) / 599) [(12, 1), (14, 1)],
  term ((21671 : Rat) / 599) [(14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 841 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0841_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0841
        rs_R010_ueqv_R010NYN_generator_25_0800_0848 =
      rs_R010_ueqv_R010NYN_partial_25_0841 := by
  native_decide

/-- Coefficient term 842 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0842 : Poly :=
[
  term ((2218432 : Rat) / 2995) [(14, 1), (15, 2)]
]

/-- Partial product 842 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0842 : Poly :=
[
  term ((4436864 : Rat) / 2995) [(12, 1), (14, 1), (15, 2)],
  term ((-2218432 : Rat) / 2995) [(14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 842 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0842_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0842
        rs_R010_ueqv_R010NYN_generator_25_0800_0848 =
      rs_R010_ueqv_R010NYN_partial_25_0842 := by
  native_decide

/-- Coefficient term 843 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0843 : Poly :=
[
  term ((-501 : Rat) / 5) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 843 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0843 : Poly :=
[
  term ((-1002 : Rat) / 5) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((501 : Rat) / 5) [(14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 843 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0843_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0843
        rs_R010_ueqv_R010NYN_generator_25_0800_0848 =
      rs_R010_ueqv_R010NYN_partial_25_0843 := by
  native_decide

/-- Coefficient term 844 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0844 : Poly :=
[
  term ((21072 : Rat) / 599) [(14, 2)]
]

/-- Partial product 844 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0844 : Poly :=
[
  term ((42144 : Rat) / 599) [(12, 1), (14, 2)],
  term ((-21072 : Rat) / 599) [(14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 844 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0844_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0844
        rs_R010_ueqv_R010NYN_generator_25_0800_0848 =
      rs_R010_ueqv_R010NYN_partial_25_0844 := by
  native_decide

/-- Coefficient term 845 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0845 : Poly :=
[
  term ((-2423808 : Rat) / 2995) [(14, 2), (15, 2)]
]

/-- Partial product 845 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0845 : Poly :=
[
  term ((-4847616 : Rat) / 2995) [(12, 1), (14, 2), (15, 2)],
  term ((2423808 : Rat) / 2995) [(14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 845 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0845_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0845
        rs_R010_ueqv_R010NYN_generator_25_0800_0848 =
      rs_R010_ueqv_R010NYN_partial_25_0845 := by
  native_decide

/-- Coefficient term 846 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0846 : Poly :=
[
  term ((534 : Rat) / 5) [(14, 2), (15, 2), (16, 1)]
]

/-- Partial product 846 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0846 : Poly :=
[
  term ((1068 : Rat) / 5) [(12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-534 : Rat) / 5) [(14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 846 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0846_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0846
        rs_R010_ueqv_R010NYN_generator_25_0800_0848 =
      rs_R010_ueqv_R010NYN_partial_25_0846 := by
  native_decide

/-- Coefficient term 847 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0847 : Poly :=
[
  term ((-3813594 : Rat) / 2995) [(15, 2)]
]

/-- Partial product 847 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0847 : Poly :=
[
  term ((-7627188 : Rat) / 2995) [(12, 1), (15, 2)],
  term ((3813594 : Rat) / 2995) [(15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 847 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0847_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0847
        rs_R010_ueqv_R010NYN_generator_25_0800_0848 =
      rs_R010_ueqv_R010NYN_partial_25_0847 := by
  native_decide

/-- Coefficient term 848 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0848 : Poly :=
[
  term ((857 : Rat) / 5) [(15, 2), (16, 1)]
]

/-- Partial product 848 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0848 : Poly :=
[
  term ((1714 : Rat) / 5) [(12, 1), (15, 2), (16, 1)],
  term ((-857 : Rat) / 5) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 848 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0848_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0848
        rs_R010_ueqv_R010NYN_generator_25_0800_0848 =
      rs_R010_ueqv_R010NYN_partial_25_0848 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010NYN_partials_25_0800_0848 : List Poly :=
[
  rs_R010_ueqv_R010NYN_partial_25_0800,
  rs_R010_ueqv_R010NYN_partial_25_0801,
  rs_R010_ueqv_R010NYN_partial_25_0802,
  rs_R010_ueqv_R010NYN_partial_25_0803,
  rs_R010_ueqv_R010NYN_partial_25_0804,
  rs_R010_ueqv_R010NYN_partial_25_0805,
  rs_R010_ueqv_R010NYN_partial_25_0806,
  rs_R010_ueqv_R010NYN_partial_25_0807,
  rs_R010_ueqv_R010NYN_partial_25_0808,
  rs_R010_ueqv_R010NYN_partial_25_0809,
  rs_R010_ueqv_R010NYN_partial_25_0810,
  rs_R010_ueqv_R010NYN_partial_25_0811,
  rs_R010_ueqv_R010NYN_partial_25_0812,
  rs_R010_ueqv_R010NYN_partial_25_0813,
  rs_R010_ueqv_R010NYN_partial_25_0814,
  rs_R010_ueqv_R010NYN_partial_25_0815,
  rs_R010_ueqv_R010NYN_partial_25_0816,
  rs_R010_ueqv_R010NYN_partial_25_0817,
  rs_R010_ueqv_R010NYN_partial_25_0818,
  rs_R010_ueqv_R010NYN_partial_25_0819,
  rs_R010_ueqv_R010NYN_partial_25_0820,
  rs_R010_ueqv_R010NYN_partial_25_0821,
  rs_R010_ueqv_R010NYN_partial_25_0822,
  rs_R010_ueqv_R010NYN_partial_25_0823,
  rs_R010_ueqv_R010NYN_partial_25_0824,
  rs_R010_ueqv_R010NYN_partial_25_0825,
  rs_R010_ueqv_R010NYN_partial_25_0826,
  rs_R010_ueqv_R010NYN_partial_25_0827,
  rs_R010_ueqv_R010NYN_partial_25_0828,
  rs_R010_ueqv_R010NYN_partial_25_0829,
  rs_R010_ueqv_R010NYN_partial_25_0830,
  rs_R010_ueqv_R010NYN_partial_25_0831,
  rs_R010_ueqv_R010NYN_partial_25_0832,
  rs_R010_ueqv_R010NYN_partial_25_0833,
  rs_R010_ueqv_R010NYN_partial_25_0834,
  rs_R010_ueqv_R010NYN_partial_25_0835,
  rs_R010_ueqv_R010NYN_partial_25_0836,
  rs_R010_ueqv_R010NYN_partial_25_0837,
  rs_R010_ueqv_R010NYN_partial_25_0838,
  rs_R010_ueqv_R010NYN_partial_25_0839,
  rs_R010_ueqv_R010NYN_partial_25_0840,
  rs_R010_ueqv_R010NYN_partial_25_0841,
  rs_R010_ueqv_R010NYN_partial_25_0842,
  rs_R010_ueqv_R010NYN_partial_25_0843,
  rs_R010_ueqv_R010NYN_partial_25_0844,
  rs_R010_ueqv_R010NYN_partial_25_0845,
  rs_R010_ueqv_R010NYN_partial_25_0846,
  rs_R010_ueqv_R010NYN_partial_25_0847,
  rs_R010_ueqv_R010NYN_partial_25_0848
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010NYN_block_25_0800_0848 : Poly :=
[
  term ((4847616 : Rat) / 2995) [(10, 1), (12, 1), (14, 1), (15, 2)],
  term ((-1068 : Rat) / 5) [(10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-540132 : Rat) / 2995) [(10, 1), (12, 1), (15, 2)],
  term ((176 : Rat) / 5) [(10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-2423808 : Rat) / 2995) [(10, 1), (14, 1), (15, 2)],
  term ((534 : Rat) / 5) [(10, 1), (14, 1), (15, 2), (16, 1)],
  term ((270066 : Rat) / 2995) [(10, 1), (15, 2)],
  term ((-88 : Rat) / 5) [(10, 1), (15, 2), (16, 1)],
  term ((-812448 : Rat) / 2995) [(11, 1), (12, 1), (13, 1)],
  term ((857088 : Rat) / 2995) [(11, 1), (12, 1), (13, 1), (14, 1)],
  term ((351360 : Rat) / 599) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term (-100 : Rat) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((13684224 : Rat) / 2995) [(11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-2946 : Rat) / 5) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-13326108 : Rat) / 2995) [(11, 1), (12, 1), (14, 1), (15, 1)],
  term (592 : Rat) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-244224 : Rat) / 2995) [(11, 1), (12, 1), (14, 1), (15, 3)],
  term ((132 : Rat) / 5) [(11, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((9967104 : Rat) / 2995) [(11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-1896 : Rat) / 5) [(11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((13146954 : Rat) / 2995) [(11, 1), (12, 1), (15, 1)],
  term ((-1851 : Rat) / 5) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1398336 : Rat) / 2995) [(11, 1), (12, 1), (15, 3)],
  term ((-62 : Rat) / 5) [(11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-1285632 : Rat) / 2995) [(11, 1), (12, 2), (15, 1)],
  term ((-1512576 : Rat) / 2995) [(11, 1), (12, 2), (15, 3)],
  term ((368 : Rat) / 5) [(11, 1), (12, 2), (15, 3), (16, 1)],
  term ((406224 : Rat) / 2995) [(11, 1), (13, 1)],
  term ((-428544 : Rat) / 2995) [(11, 1), (13, 1), (14, 1)],
  term ((-175680 : Rat) / 599) [(11, 1), (13, 1), (14, 1), (15, 2)],
  term (50 : Rat) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-6842112 : Rat) / 2995) [(11, 1), (13, 1), (15, 2)],
  term ((1473 : Rat) / 5) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((6663054 : Rat) / 2995) [(11, 1), (14, 1), (15, 1)],
  term (-296 : Rat) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term ((122112 : Rat) / 2995) [(11, 1), (14, 1), (15, 3)],
  term ((-66 : Rat) / 5) [(11, 1), (14, 1), (15, 3), (16, 1)],
  term ((-4983552 : Rat) / 2995) [(11, 1), (14, 2), (15, 1)],
  term ((948 : Rat) / 5) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-6252069 : Rat) / 2995) [(11, 1), (15, 1)],
  term ((1851 : Rat) / 10) [(11, 1), (15, 1), (16, 1)],
  term ((1077312 : Rat) / 2995) [(11, 1), (15, 3)],
  term ((-61 : Rat) / 5) [(11, 1), (15, 3), (16, 1)],
  term ((2825712 : Rat) / 2995) [(11, 2)],
  term ((-5651424 : Rat) / 2995) [(11, 2), (12, 1)],
  term ((-321408 : Rat) / 599) [(11, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-9267264 : Rat) / 2995) [(11, 2), (12, 1), (13, 1), (15, 1)],
  term ((1928448 : Rat) / 599) [(11, 2), (12, 1), (14, 1)],
  term ((321408 : Rat) / 2995) [(11, 2), (12, 1), (14, 1), (15, 2)],
  term ((-5785344 : Rat) / 2995) [(11, 2), (12, 1), (14, 2)],
  term ((6485184 : Rat) / 2995) [(11, 2), (12, 1), (15, 2)],
  term ((-1896 : Rat) / 5) [(11, 2), (12, 1), (15, 2), (16, 1)],
  term ((1285632 : Rat) / 2995) [(11, 2), (12, 2), (15, 2)],
  term ((160704 : Rat) / 599) [(11, 2), (13, 1), (14, 1), (15, 1)],
  term ((4633632 : Rat) / 2995) [(11, 2), (13, 1), (15, 1)],
  term ((-964224 : Rat) / 599) [(11, 2), (14, 1)],
  term ((-160704 : Rat) / 2995) [(11, 2), (14, 1), (15, 2)],
  term ((2892672 : Rat) / 2995) [(11, 2), (14, 2)],
  term ((-712800 : Rat) / 599) [(11, 2), (15, 2)],
  term ((948 : Rat) / 5) [(11, 2), (15, 2), (16, 1)],
  term ((-5785344 : Rat) / 2995) [(11, 3), (12, 1), (15, 1)],
  term ((2892672 : Rat) / 2995) [(11, 3), (15, 1)],
  term ((-830704 : Rat) / 2995) [(12, 1), (13, 1), (14, 1), (15, 1)],
  term ((172 : Rat) / 5) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((951584 : Rat) / 2995) [(12, 1), (13, 1), (15, 1)],
  term ((-192 : Rat) / 5) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4847616 : Rat) / 2995) [(12, 1), (13, 1), (15, 3)],
  term ((1068 : Rat) / 5) [(12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-43342 : Rat) / 599) [(12, 1), (14, 1)],
  term ((4436864 : Rat) / 2995) [(12, 1), (14, 1), (15, 2)],
  term ((-1002 : Rat) / 5) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((42144 : Rat) / 599) [(12, 1), (14, 2)],
  term ((-4847616 : Rat) / 2995) [(12, 1), (14, 2), (15, 2)],
  term ((1068 : Rat) / 5) [(12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-8247916 : Rat) / 2995) [(12, 1), (15, 2)],
  term ((1833 : Rat) / 5) [(12, 1), (15, 2), (16, 1)],
  term ((1241456 : Rat) / 2995) [(12, 2), (15, 2)],
  term ((-238 : Rat) / 5) [(12, 2), (15, 2), (16, 1)],
  term ((415352 : Rat) / 2995) [(13, 1), (14, 1), (15, 1)],
  term ((-86 : Rat) / 5) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-475792 : Rat) / 2995) [(13, 1), (15, 1)],
  term ((96 : Rat) / 5) [(13, 1), (15, 1), (16, 1)],
  term ((2423808 : Rat) / 2995) [(13, 1), (15, 3)],
  term ((-534 : Rat) / 5) [(13, 1), (15, 3), (16, 1)],
  term ((21671 : Rat) / 599) [(14, 1)],
  term ((-2218432 : Rat) / 2995) [(14, 1), (15, 2)],
  term ((501 : Rat) / 5) [(14, 1), (15, 2), (16, 1)],
  term ((-21072 : Rat) / 599) [(14, 2)],
  term ((2423808 : Rat) / 2995) [(14, 2), (15, 2)],
  term ((-534 : Rat) / 5) [(14, 2), (15, 2), (16, 1)],
  term ((3813594 : Rat) / 2995) [(15, 2)],
  term ((-857 : Rat) / 5) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 25, terms 800 through 848. -/
theorem rs_R010_ueqv_R010NYN_block_25_0800_0848_valid :
    checkProductSumEq rs_R010_ueqv_R010NYN_partials_25_0800_0848
      rs_R010_ueqv_R010NYN_block_25_0800_0848 = true := by
  native_decide

end R010UeqvR010NYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
