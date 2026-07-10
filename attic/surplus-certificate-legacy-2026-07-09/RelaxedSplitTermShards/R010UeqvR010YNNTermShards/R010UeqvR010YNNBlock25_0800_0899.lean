/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010YNN, term block 25:800-899

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010YNNTermShards

/-- Generator polynomial 25 for relaxed split surplus certificate `R010:u=v:R010YNN`. -/
def rs_R010_ueqv_R010YNN_generator_25_0800_0899 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(12, 1)]
]

/-- Coefficient term 800 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0800 : Poly :=
[
  term ((-127103842707251200 : Rat) / 17966088315235317) [(2, 1), (5, 1), (9, 3), (10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 800 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0800 : Poly :=
[
  term ((-254207685414502400 : Rat) / 17966088315235317) [(2, 1), (5, 1), (9, 3), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((127103842707251200 : Rat) / 17966088315235317) [(2, 1), (5, 1), (9, 3), (10, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 800 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0800_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0800
        rs_R010_ueqv_R010YNN_generator_25_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_25_0800 := by
  native_decide

/-- Coefficient term 801 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0801 : Poly :=
[
  term ((254207685414502400 : Rat) / 17966088315235317) [(2, 1), (5, 1), (9, 3), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 801 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0801 : Poly :=
[
  term ((508415370829004800 : Rat) / 17966088315235317) [(2, 1), (5, 1), (9, 3), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-254207685414502400 : Rat) / 17966088315235317) [(2, 1), (5, 1), (9, 3), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 801 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0801_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0801
        rs_R010_ueqv_R010YNN_generator_25_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_25_0801 := by
  native_decide

/-- Coefficient term 802 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0802 : Poly :=
[
  term ((-4440881445547294720 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 3), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 802 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0802 : Poly :=
[
  term ((-8881762891094589440 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 3), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((4440881445547294720 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 3), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 802 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0802_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0802
        rs_R010_ueqv_R010YNN_generator_25_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_25_0802 := by
  native_decide

/-- Coefficient term 803 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0803 : Poly :=
[
  term ((8881762891094589440 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 3), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 803 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0803 : Poly :=
[
  term ((17763525782189178880 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 3), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-8881762891094589440 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 3), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 803 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0803_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0803
        rs_R010_ueqv_R010YNN_generator_25_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_25_0803 := by
  native_decide

/-- Coefficient term 804 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0804 : Poly :=
[
  term ((254207685414502400 : Rat) / 17966088315235317) [(2, 1), (5, 1), (9, 3), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 804 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0804 : Poly :=
[
  term ((508415370829004800 : Rat) / 17966088315235317) [(2, 1), (5, 1), (9, 3), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-254207685414502400 : Rat) / 17966088315235317) [(2, 1), (5, 1), (9, 3), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 804 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0804_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0804
        rs_R010_ueqv_R010YNN_generator_25_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_25_0804 := by
  native_decide

/-- Coefficient term 805 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0805 : Poly :=
[
  term ((2414398072269209600 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 3), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 805 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0805 : Poly :=
[
  term ((4828796144538419200 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 3), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-2414398072269209600 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 3), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 805 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0805_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0805
        rs_R010_ueqv_R010YNN_generator_25_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_25_0805 := by
  native_decide

/-- Coefficient term 806 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0806 : Poly :=
[
  term ((-4828796144538419200 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 3), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 806 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0806 : Poly :=
[
  term ((-9657592289076838400 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 3), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((4828796144538419200 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 806 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0806_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0806
        rs_R010_ueqv_R010YNN_generator_25_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_25_0806 := by
  native_decide

/-- Coefficient term 807 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0807 : Poly :=
[
  term ((-508415370829004800 : Rat) / 17966088315235317) [(2, 1), (5, 1), (9, 3), (11, 1), (15, 3), (16, 1)]
]

/-- Partial product 807 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0807 : Poly :=
[
  term ((-1016830741658009600 : Rat) / 17966088315235317) [(2, 1), (5, 1), (9, 3), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((508415370829004800 : Rat) / 17966088315235317) [(2, 1), (5, 1), (9, 3), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 807 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0807_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0807
        rs_R010_ueqv_R010YNN_generator_25_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_25_0807 := by
  native_decide

/-- Coefficient term 808 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0808 : Poly :=
[
  term ((-63551921353625600 : Rat) / 17966088315235317) [(2, 1), (5, 1), (9, 3), (11, 2), (16, 1)]
]

/-- Partial product 808 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0808 : Poly :=
[
  term ((-127103842707251200 : Rat) / 17966088315235317) [(2, 1), (5, 1), (9, 3), (11, 2), (12, 1), (16, 1)],
  term ((63551921353625600 : Rat) / 17966088315235317) [(2, 1), (5, 1), (9, 3), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 808 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0808_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0808
        rs_R010_ueqv_R010YNN_generator_25_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_25_0808 := by
  native_decide

/-- Coefficient term 809 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0809 : Poly :=
[
  term ((2865492524826910720 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 3), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 809 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0809 : Poly :=
[
  term ((5730985049653821440 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 3), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2865492524826910720 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 809 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0809_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0809
        rs_R010_ueqv_R010YNN_generator_25_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_25_0809 := by
  native_decide

/-- Coefficient term 810 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0810 : Poly :=
[
  term ((-5730985049653821440 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 3), (15, 2), (16, 1)]
]

/-- Partial product 810 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0810 : Poly :=
[
  term ((-11461970099307642880 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 3), (12, 1), (15, 2), (16, 1)],
  term ((5730985049653821440 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 810 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0810_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0810
        rs_R010_ueqv_R010YNN_generator_25_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_25_0810 := by
  native_decide

/-- Coefficient term 811 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0811 : Poly :=
[
  term ((1435727629753876480 : Rat) / 17966088315235317) [(2, 1), (5, 1), (9, 4), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 811 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0811 : Poly :=
[
  term ((2871455259507752960 : Rat) / 17966088315235317) [(2, 1), (5, 1), (9, 4), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1435727629753876480 : Rat) / 17966088315235317) [(2, 1), (5, 1), (9, 4), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 811 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0811_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0811
        rs_R010_ueqv_R010YNN_generator_25_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_25_0811 := by
  native_decide

/-- Coefficient term 812 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0812 : Poly :=
[
  term ((-2871455259507752960 : Rat) / 17966088315235317) [(2, 1), (5, 1), (9, 4), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 812 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0812 : Poly :=
[
  term ((-5742910519015505920 : Rat) / 17966088315235317) [(2, 1), (5, 1), (9, 4), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((2871455259507752960 : Rat) / 17966088315235317) [(2, 1), (5, 1), (9, 4), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 812 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0812_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0812
        rs_R010_ueqv_R010YNN_generator_25_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_25_0812 := by
  native_decide

/-- Coefficient term 813 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0813 : Poly :=
[
  term ((717863814876938240 : Rat) / 17966088315235317) [(2, 1), (5, 1), (9, 4), (11, 1), (16, 1)]
]

/-- Partial product 813 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0813 : Poly :=
[
  term ((1435727629753876480 : Rat) / 17966088315235317) [(2, 1), (5, 1), (9, 4), (11, 1), (12, 1), (16, 1)],
  term ((-717863814876938240 : Rat) / 17966088315235317) [(2, 1), (5, 1), (9, 4), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 813 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0813_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0813
        rs_R010_ueqv_R010YNN_generator_25_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_25_0813 := by
  native_decide

/-- Coefficient term 814 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0814 : Poly :=
[
  term ((-2871455259507752960 : Rat) / 17966088315235317) [(2, 1), (5, 1), (9, 4), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 814 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0814 : Poly :=
[
  term ((-5742910519015505920 : Rat) / 17966088315235317) [(2, 1), (5, 1), (9, 4), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((2871455259507752960 : Rat) / 17966088315235317) [(2, 1), (5, 1), (9, 4), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 814 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0814_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0814
        rs_R010_ueqv_R010YNN_generator_25_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_25_0814 := by
  native_decide

/-- Coefficient term 815 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0815 : Poly :=
[
  term ((5742910519015505920 : Rat) / 17966088315235317) [(2, 1), (5, 1), (9, 4), (15, 3), (16, 1)]
]

/-- Partial product 815 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0815 : Poly :=
[
  term ((11485821038031011840 : Rat) / 17966088315235317) [(2, 1), (5, 1), (9, 4), (12, 1), (15, 3), (16, 1)],
  term ((-5742910519015505920 : Rat) / 17966088315235317) [(2, 1), (5, 1), (9, 4), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 815 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0815_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0815
        rs_R010_ueqv_R010YNN_generator_25_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_25_0815 := by
  native_decide

/-- Coefficient term 816 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0816 : Poly :=
[
  term ((-1293002511747310720 : Rat) / 17966088315235317) [(2, 1), (5, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 816 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0816 : Poly :=
[
  term ((-2586005023494621440 : Rat) / 17966088315235317) [(2, 1), (5, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1293002511747310720 : Rat) / 17966088315235317) [(2, 1), (5, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 816 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0816_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0816
        rs_R010_ueqv_R010YNN_generator_25_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_25_0816 := by
  native_decide

/-- Coefficient term 817 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0817 : Poly :=
[
  term ((2586005023494621440 : Rat) / 17966088315235317) [(2, 1), (5, 1), (10, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 817 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0817 : Poly :=
[
  term ((5172010046989242880 : Rat) / 17966088315235317) [(2, 1), (5, 1), (10, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-2586005023494621440 : Rat) / 17966088315235317) [(2, 1), (5, 1), (10, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 817 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0817_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0817
        rs_R010_ueqv_R010YNN_generator_25_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_25_0817 := by
  native_decide

/-- Coefficient term 818 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0818 : Poly :=
[
  term ((359463415085447805712 : Rat) / 269491324728529755) [(2, 1), (5, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 818 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0818 : Poly :=
[
  term ((718926830170895611424 : Rat) / 269491324728529755) [(2, 1), (5, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-359463415085447805712 : Rat) / 269491324728529755) [(2, 1), (5, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 818 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0818_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0818
        rs_R010_ueqv_R010YNN_generator_25_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_25_0818 := by
  native_decide

/-- Coefficient term 819 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0819 : Poly :=
[
  term ((-718926830170895611424 : Rat) / 269491324728529755) [(2, 1), (5, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 819 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0819 : Poly :=
[
  term ((-1437853660341791222848 : Rat) / 269491324728529755) [(2, 1), (5, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((718926830170895611424 : Rat) / 269491324728529755) [(2, 1), (5, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 819 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0819_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0819
        rs_R010_ueqv_R010YNN_generator_25_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_25_0819 := by
  native_decide

/-- Coefficient term 820 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0820 : Poly :=
[
  term ((-1762693781939359496 : Rat) / 53898264945705951) [(2, 1), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 820 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0820 : Poly :=
[
  term ((-3525387563878718992 : Rat) / 53898264945705951) [(2, 1), (5, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1762693781939359496 : Rat) / 53898264945705951) [(2, 1), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 820 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0820_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0820
        rs_R010_ueqv_R010YNN_generator_25_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_25_0820 := by
  native_decide

/-- Coefficient term 821 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0821 : Poly :=
[
  term ((3525387563878718992 : Rat) / 53898264945705951) [(2, 1), (5, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 821 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0821 : Poly :=
[
  term ((7050775127757437984 : Rat) / 53898264945705951) [(2, 1), (5, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-3525387563878718992 : Rat) / 53898264945705951) [(2, 1), (5, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 821 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0821_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0821
        rs_R010_ueqv_R010YNN_generator_25_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_25_0821 := by
  native_decide

/-- Coefficient term 822 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0822 : Poly :=
[
  term ((179731707542723902856 : Rat) / 269491324728529755) [(2, 1), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 822 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0822 : Poly :=
[
  term ((359463415085447805712 : Rat) / 269491324728529755) [(2, 1), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((-179731707542723902856 : Rat) / 269491324728529755) [(2, 1), (5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 822 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0822_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0822
        rs_R010_ueqv_R010YNN_generator_25_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_25_0822 := by
  native_decide

/-- Coefficient term 823 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0823 : Poly :=
[
  term ((-23288167546323400736 : Rat) / 1347456623642648775) [(2, 1), (5, 1), (11, 2), (13, 1), (16, 1)]
]

/-- Partial product 823 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0823 : Poly :=
[
  term ((-46576335092646801472 : Rat) / 1347456623642648775) [(2, 1), (5, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((23288167546323400736 : Rat) / 1347456623642648775) [(2, 1), (5, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 823 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0823_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0823
        rs_R010_ueqv_R010YNN_generator_25_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_25_0823 := by
  native_decide

/-- Coefficient term 824 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0824 : Poly :=
[
  term ((46576335092646801472 : Rat) / 1347456623642648775) [(2, 1), (5, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 824 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0824 : Poly :=
[
  term ((93152670185293602944 : Rat) / 1347456623642648775) [(2, 1), (5, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-46576335092646801472 : Rat) / 1347456623642648775) [(2, 1), (5, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 824 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0824_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0824
        rs_R010_ueqv_R010YNN_generator_25_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_25_0824 := by
  native_decide

/-- Coefficient term 825 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0825 : Poly :=
[
  term ((-718926830170895611424 : Rat) / 269491324728529755) [(2, 1), (5, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 825 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0825 : Poly :=
[
  term ((-1437853660341791222848 : Rat) / 269491324728529755) [(2, 1), (5, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((718926830170895611424 : Rat) / 269491324728529755) [(2, 1), (5, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 825 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0825_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0825
        rs_R010_ueqv_R010YNN_generator_25_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_25_0825 := by
  native_decide

/-- Coefficient term 826 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0826 : Poly :=
[
  term (-8 : Rat) [(2, 1), (5, 1), (13, 1), (16, 1)]
]

/-- Partial product 826 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0826 : Poly :=
[
  term (-16 : Rat) [(2, 1), (5, 1), (12, 1), (13, 1), (16, 1)],
  term (8 : Rat) [(2, 1), (5, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 826 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0826_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0826
        rs_R010_ueqv_R010YNN_generator_25_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_25_0826 := by
  native_decide

/-- Coefficient term 827 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0827 : Poly :=
[
  term (16 : Rat) [(2, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 827 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0827 : Poly :=
[
  term (32 : Rat) [(2, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term (-16 : Rat) [(2, 1), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 827 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0827_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0827
        rs_R010_ueqv_R010YNN_generator_25_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_25_0827 := by
  native_decide

/-- Coefficient term 828 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0828 : Poly :=
[
  term ((1437853660341791222848 : Rat) / 269491324728529755) [(2, 1), (5, 1), (15, 3), (16, 1)]
]

/-- Partial product 828 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0828 : Poly :=
[
  term ((2875707320683582445696 : Rat) / 269491324728529755) [(2, 1), (5, 1), (12, 1), (15, 3), (16, 1)],
  term ((-1437853660341791222848 : Rat) / 269491324728529755) [(2, 1), (5, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 828 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0828_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0828
        rs_R010_ueqv_R010YNN_generator_25_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_25_0828 := by
  native_decide

/-- Coefficient term 829 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0829 : Poly :=
[
  term ((-297153869582026240 : Rat) / 17966088315235317) [(2, 1), (5, 2), (6, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 829 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0829 : Poly :=
[
  term ((-594307739164052480 : Rat) / 17966088315235317) [(2, 1), (5, 2), (6, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((297153869582026240 : Rat) / 17966088315235317) [(2, 1), (5, 2), (6, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 829 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0829_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0829
        rs_R010_ueqv_R010YNN_generator_25_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_25_0829 := by
  native_decide

/-- Coefficient term 830 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0830 : Poly :=
[
  term ((594307739164052480 : Rat) / 17966088315235317) [(2, 1), (5, 2), (6, 1), (9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 830 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0830 : Poly :=
[
  term ((1188615478328104960 : Rat) / 17966088315235317) [(2, 1), (5, 2), (6, 1), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-594307739164052480 : Rat) / 17966088315235317) [(2, 1), (5, 2), (6, 1), (9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 830 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0830_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0830
        rs_R010_ueqv_R010YNN_generator_25_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_25_0830 := by
  native_decide

/-- Coefficient term 831 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0831 : Poly :=
[
  term ((-139253367632691200 : Rat) / 53898264945705951) [(2, 1), (5, 2), (6, 1), (9, 1), (11, 2), (13, 1), (16, 1)]
]

/-- Partial product 831 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0831 : Poly :=
[
  term ((-278506735265382400 : Rat) / 53898264945705951) [(2, 1), (5, 2), (6, 1), (9, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((139253367632691200 : Rat) / 53898264945705951) [(2, 1), (5, 2), (6, 1), (9, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 831 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0831_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0831
        rs_R010_ueqv_R010YNN_generator_25_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_25_0831 := by
  native_decide

/-- Coefficient term 832 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0832 : Poly :=
[
  term ((278506735265382400 : Rat) / 53898264945705951) [(2, 1), (5, 2), (6, 1), (9, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 832 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0832 : Poly :=
[
  term ((557013470530764800 : Rat) / 53898264945705951) [(2, 1), (5, 2), (6, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-278506735265382400 : Rat) / 53898264945705951) [(2, 1), (5, 2), (6, 1), (9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 832 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0832_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0832
        rs_R010_ueqv_R010YNN_generator_25_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_25_0832 := by
  native_decide

/-- Coefficient term 833 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0833 : Poly :=
[
  term ((790011652830280096 : Rat) / 53898264945705951) [(2, 1), (5, 2), (6, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 833 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0833 : Poly :=
[
  term ((1580023305660560192 : Rat) / 53898264945705951) [(2, 1), (5, 2), (6, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-790011652830280096 : Rat) / 53898264945705951) [(2, 1), (5, 2), (6, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 833 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0833_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0833
        rs_R010_ueqv_R010YNN_generator_25_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_25_0833 := by
  native_decide

/-- Coefficient term 834 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0834 : Poly :=
[
  term ((-1580023305660560192 : Rat) / 53898264945705951) [(2, 1), (5, 2), (6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 834 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0834 : Poly :=
[
  term ((-3160046611321120384 : Rat) / 53898264945705951) [(2, 1), (5, 2), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((1580023305660560192 : Rat) / 53898264945705951) [(2, 1), (5, 2), (6, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 834 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0834_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0834
        rs_R010_ueqv_R010YNN_generator_25_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_25_0834 := by
  native_decide

/-- Coefficient term 835 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0835 : Poly :=
[
  term ((382946760989900800 : Rat) / 17966088315235317) [(2, 1), (5, 2), (6, 1), (9, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 835 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0835 : Poly :=
[
  term ((765893521979801600 : Rat) / 17966088315235317) [(2, 1), (5, 2), (6, 1), (9, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-382946760989900800 : Rat) / 17966088315235317) [(2, 1), (5, 2), (6, 1), (9, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 835 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0835_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0835
        rs_R010_ueqv_R010YNN_generator_25_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_25_0835 := by
  native_decide

/-- Coefficient term 836 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0836 : Poly :=
[
  term ((-765893521979801600 : Rat) / 17966088315235317) [(2, 1), (5, 2), (6, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 836 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0836 : Poly :=
[
  term ((-1531787043959603200 : Rat) / 17966088315235317) [(2, 1), (5, 2), (6, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((765893521979801600 : Rat) / 17966088315235317) [(2, 1), (5, 2), (6, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 836 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0836_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0836
        rs_R010_ueqv_R010YNN_generator_25_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_25_0836 := by
  native_decide

/-- Coefficient term 837 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0837 : Poly :=
[
  term ((185785469175424000 : Rat) / 17966088315235317) [(2, 1), (5, 2), (6, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 837 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0837 : Poly :=
[
  term ((371570938350848000 : Rat) / 17966088315235317) [(2, 1), (5, 2), (6, 1), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-185785469175424000 : Rat) / 17966088315235317) [(2, 1), (5, 2), (6, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 837 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0837_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0837
        rs_R010_ueqv_R010YNN_generator_25_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_25_0837 := by
  native_decide

/-- Coefficient term 838 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0838 : Poly :=
[
  term ((-371570938350848000 : Rat) / 17966088315235317) [(2, 1), (5, 2), (6, 1), (9, 2), (15, 2), (16, 1)]
]

/-- Partial product 838 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0838 : Poly :=
[
  term ((-743141876701696000 : Rat) / 17966088315235317) [(2, 1), (5, 2), (6, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((371570938350848000 : Rat) / 17966088315235317) [(2, 1), (5, 2), (6, 1), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 838 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0838_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0838
        rs_R010_ueqv_R010YNN_generator_25_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_25_0838 := by
  native_decide

/-- Coefficient term 839 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0839 : Poly :=
[
  term ((-1114026941061529600 : Rat) / 53898264945705951) [(2, 1), (5, 2), (6, 1), (9, 3), (13, 1), (16, 1)]
]

/-- Partial product 839 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0839 : Poly :=
[
  term ((-2228053882123059200 : Rat) / 53898264945705951) [(2, 1), (5, 2), (6, 1), (9, 3), (12, 1), (13, 1), (16, 1)],
  term ((1114026941061529600 : Rat) / 53898264945705951) [(2, 1), (5, 2), (6, 1), (9, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 839 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0839_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0839
        rs_R010_ueqv_R010YNN_generator_25_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_25_0839 := by
  native_decide

/-- Coefficient term 840 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0840 : Poly :=
[
  term ((2228053882123059200 : Rat) / 53898264945705951) [(2, 1), (5, 2), (6, 1), (9, 3), (15, 1), (16, 1)]
]

/-- Partial product 840 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0840 : Poly :=
[
  term ((4456107764246118400 : Rat) / 53898264945705951) [(2, 1), (5, 2), (6, 1), (9, 3), (12, 1), (15, 1), (16, 1)],
  term ((-2228053882123059200 : Rat) / 53898264945705951) [(2, 1), (5, 2), (6, 1), (9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 840 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0840_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0840
        rs_R010_ueqv_R010YNN_generator_25_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_25_0840 := by
  native_decide

/-- Coefficient term 841 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0841 : Poly :=
[
  term ((-1090714409773617968 : Rat) / 17966088315235317) [(2, 1), (5, 2), (6, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 841 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0841 : Poly :=
[
  term ((-2181428819547235936 : Rat) / 17966088315235317) [(2, 1), (5, 2), (6, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((1090714409773617968 : Rat) / 17966088315235317) [(2, 1), (5, 2), (6, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 841 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0841_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0841
        rs_R010_ueqv_R010YNN_generator_25_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_25_0841 := by
  native_decide

/-- Coefficient term 842 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0842 : Poly :=
[
  term ((2181428819547235936 : Rat) / 17966088315235317) [(2, 1), (5, 2), (6, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 842 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0842 : Poly :=
[
  term ((4362857639094471872 : Rat) / 17966088315235317) [(2, 1), (5, 2), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2181428819547235936 : Rat) / 17966088315235317) [(2, 1), (5, 2), (6, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 842 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0842_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0842
        rs_R010_ueqv_R010YNN_generator_25_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_25_0842 := by
  native_decide

/-- Coefficient term 843 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0843 : Poly :=
[
  term ((-1700977553050764416 : Rat) / 53898264945705951) [(2, 1), (5, 2), (7, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 843 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0843 : Poly :=
[
  term ((-3401955106101528832 : Rat) / 53898264945705951) [(2, 1), (5, 2), (7, 1), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((1700977553050764416 : Rat) / 53898264945705951) [(2, 1), (5, 2), (7, 1), (8, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 843 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0843_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0843
        rs_R010_ueqv_R010YNN_generator_25_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_25_0843 := by
  native_decide

/-- Coefficient term 844 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0844 : Poly :=
[
  term ((3401955106101528832 : Rat) / 53898264945705951) [(2, 1), (5, 2), (7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 844 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0844 : Poly :=
[
  term ((6803910212203057664 : Rat) / 53898264945705951) [(2, 1), (5, 2), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3401955106101528832 : Rat) / 53898264945705951) [(2, 1), (5, 2), (7, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 844 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0844_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0844
        rs_R010_ueqv_R010YNN_generator_25_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_25_0844 := by
  native_decide

/-- Coefficient term 845 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0845 : Poly :=
[
  term ((377625914378053734832 : Rat) / 449152207880882925) [(2, 1), (5, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 845 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0845 : Poly :=
[
  term ((755251828756107469664 : Rat) / 449152207880882925) [(2, 1), (5, 2), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-377625914378053734832 : Rat) / 449152207880882925) [(2, 1), (5, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 845 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0845_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0845
        rs_R010_ueqv_R010YNN_generator_25_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_25_0845 := by
  native_decide

/-- Coefficient term 846 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0846 : Poly :=
[
  term ((-755251828756107469664 : Rat) / 449152207880882925) [(2, 1), (5, 2), (7, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 846 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0846 : Poly :=
[
  term ((-1510503657512214939328 : Rat) / 449152207880882925) [(2, 1), (5, 2), (7, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((755251828756107469664 : Rat) / 449152207880882925) [(2, 1), (5, 2), (7, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 846 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0846_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0846
        rs_R010_ueqv_R010YNN_generator_25_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_25_0846 := by
  native_decide

/-- Coefficient term 847 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0847 : Poly :=
[
  term ((-10403022895177344256 : Rat) / 29943480525392195) [(2, 1), (5, 2), (7, 1), (9, 2), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 847 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0847 : Poly :=
[
  term ((-20806045790354688512 : Rat) / 29943480525392195) [(2, 1), (5, 2), (7, 1), (9, 2), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((10403022895177344256 : Rat) / 29943480525392195) [(2, 1), (5, 2), (7, 1), (9, 2), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 847 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0847_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0847
        rs_R010_ueqv_R010YNN_generator_25_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_25_0847 := by
  native_decide

/-- Coefficient term 848 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0848 : Poly :=
[
  term ((20806045790354688512 : Rat) / 29943480525392195) [(2, 1), (5, 2), (7, 1), (9, 2), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 848 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0848 : Poly :=
[
  term ((41612091580709377024 : Rat) / 29943480525392195) [(2, 1), (5, 2), (7, 1), (9, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-20806045790354688512 : Rat) / 29943480525392195) [(2, 1), (5, 2), (7, 1), (9, 2), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 848 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0848_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0848
        rs_R010_ueqv_R010YNN_generator_25_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_25_0848 := by
  native_decide

/-- Coefficient term 849 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0849 : Poly :=
[
  term ((65618476060569600 : Rat) / 5988696105078439) [(2, 1), (5, 2), (7, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 849 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0849 : Poly :=
[
  term ((131236952121139200 : Rat) / 5988696105078439) [(2, 1), (5, 2), (7, 1), (9, 2), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-65618476060569600 : Rat) / 5988696105078439) [(2, 1), (5, 2), (7, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 849 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0849_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0849
        rs_R010_ueqv_R010YNN_generator_25_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_25_0849 := by
  native_decide

/-- Coefficient term 850 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0850 : Poly :=
[
  term ((-131236952121139200 : Rat) / 5988696105078439) [(2, 1), (5, 2), (7, 1), (9, 2), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 850 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0850 : Poly :=
[
  term ((-262473904242278400 : Rat) / 5988696105078439) [(2, 1), (5, 2), (7, 1), (9, 2), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((131236952121139200 : Rat) / 5988696105078439) [(2, 1), (5, 2), (7, 1), (9, 2), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 850 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0850_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0850
        rs_R010_ueqv_R010YNN_generator_25_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_25_0850 := by
  native_decide

/-- Coefficient term 851 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0851 : Poly :=
[
  term ((-5201511447588672128 : Rat) / 29943480525392195) [(2, 1), (5, 2), (7, 1), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 851 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0851 : Poly :=
[
  term ((-10403022895177344256 : Rat) / 29943480525392195) [(2, 1), (5, 2), (7, 1), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((5201511447588672128 : Rat) / 29943480525392195) [(2, 1), (5, 2), (7, 1), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 851 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0851_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0851
        rs_R010_ueqv_R010YNN_generator_25_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_25_0851 := by
  native_decide

/-- Coefficient term 852 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0852 : Poly :=
[
  term ((46628087176130561536 : Rat) / 89830441576176585) [(2, 1), (5, 2), (7, 1), (9, 2), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 852 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0852 : Poly :=
[
  term ((93256174352261123072 : Rat) / 89830441576176585) [(2, 1), (5, 2), (7, 1), (9, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-46628087176130561536 : Rat) / 89830441576176585) [(2, 1), (5, 2), (7, 1), (9, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 852 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0852_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0852
        rs_R010_ueqv_R010YNN_generator_25_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_25_0852 := by
  native_decide

/-- Coefficient term 853 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0853 : Poly :=
[
  term ((-93256174352261123072 : Rat) / 89830441576176585) [(2, 1), (5, 2), (7, 1), (9, 2), (15, 3), (16, 1)]
]

/-- Partial product 853 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0853 : Poly :=
[
  term ((-186512348704522246144 : Rat) / 89830441576176585) [(2, 1), (5, 2), (7, 1), (9, 2), (12, 1), (15, 3), (16, 1)],
  term ((93256174352261123072 : Rat) / 89830441576176585) [(2, 1), (5, 2), (7, 1), (9, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 853 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0853_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0853
        rs_R010_ueqv_R010YNN_generator_25_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_25_0853 := by
  native_decide

/-- Coefficient term 854 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0854 : Poly :=
[
  term ((2101482817422786560 : Rat) / 17966088315235317) [(2, 1), (5, 2), (7, 1), (9, 3), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 854 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0854 : Poly :=
[
  term ((4202965634845573120 : Rat) / 17966088315235317) [(2, 1), (5, 2), (7, 1), (9, 3), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2101482817422786560 : Rat) / 17966088315235317) [(2, 1), (5, 2), (7, 1), (9, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 854 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0854_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0854
        rs_R010_ueqv_R010YNN_generator_25_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_25_0854 := by
  native_decide

/-- Coefficient term 855 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0855 : Poly :=
[
  term ((-4202965634845573120 : Rat) / 17966088315235317) [(2, 1), (5, 2), (7, 1), (9, 3), (15, 2), (16, 1)]
]

/-- Partial product 855 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0855 : Poly :=
[
  term ((-8405931269691146240 : Rat) / 17966088315235317) [(2, 1), (5, 2), (7, 1), (9, 3), (12, 1), (15, 2), (16, 1)],
  term ((4202965634845573120 : Rat) / 17966088315235317) [(2, 1), (5, 2), (7, 1), (9, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 855 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0855_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0855
        rs_R010_ueqv_R010YNN_generator_25_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_25_0855 := by
  native_decide

/-- Coefficient term 856 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0856 : Poly :=
[
  term ((850488776525382208 : Rat) / 53898264945705951) [(2, 1), (5, 2), (7, 1), (13, 1), (16, 1)]
]

/-- Partial product 856 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0856 : Poly :=
[
  term ((1700977553050764416 : Rat) / 53898264945705951) [(2, 1), (5, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-850488776525382208 : Rat) / 53898264945705951) [(2, 1), (5, 2), (7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 856 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0856_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0856
        rs_R010_ueqv_R010YNN_generator_25_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_25_0856 := by
  native_decide

/-- Coefficient term 857 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0857 : Poly :=
[
  term ((-1700977553050764416 : Rat) / 53898264945705951) [(2, 1), (5, 2), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 857 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0857 : Poly :=
[
  term ((-3401955106101528832 : Rat) / 53898264945705951) [(2, 1), (5, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((1700977553050764416 : Rat) / 53898264945705951) [(2, 1), (5, 2), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 857 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0857_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0857
        rs_R010_ueqv_R010YNN_generator_25_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_25_0857 := by
  native_decide

/-- Coefficient term 858 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0858 : Poly :=
[
  term ((-191962034195052461824 : Rat) / 89830441576176585) [(2, 1), (5, 2), (8, 1), (9, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 858 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0858 : Poly :=
[
  term ((-383924068390104923648 : Rat) / 89830441576176585) [(2, 1), (5, 2), (8, 1), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((191962034195052461824 : Rat) / 89830441576176585) [(2, 1), (5, 2), (8, 1), (9, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 858 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0858_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0858
        rs_R010_ueqv_R010YNN_generator_25_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_25_0858 := by
  native_decide

/-- Coefficient term 859 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0859 : Poly :=
[
  term ((383924068390104923648 : Rat) / 89830441576176585) [(2, 1), (5, 2), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 859 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0859 : Poly :=
[
  term ((767848136780209847296 : Rat) / 89830441576176585) [(2, 1), (5, 2), (8, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-383924068390104923648 : Rat) / 89830441576176585) [(2, 1), (5, 2), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 859 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0859_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0859
        rs_R010_ueqv_R010YNN_generator_25_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_25_0859 := by
  native_decide

/-- Coefficient term 860 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0860 : Poly :=
[
  term ((-35557302865200007936 : Rat) / 269491324728529755) [(2, 1), (5, 2), (8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 860 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0860 : Poly :=
[
  term ((-71114605730400015872 : Rat) / 269491324728529755) [(2, 1), (5, 2), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((35557302865200007936 : Rat) / 269491324728529755) [(2, 1), (5, 2), (8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 860 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0860_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0860
        rs_R010_ueqv_R010YNN_generator_25_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_25_0860 := by
  native_decide

/-- Coefficient term 861 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0861 : Poly :=
[
  term ((71114605730400015872 : Rat) / 269491324728529755) [(2, 1), (5, 2), (8, 1), (9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 861 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0861 : Poly :=
[
  term ((142229211460800031744 : Rat) / 269491324728529755) [(2, 1), (5, 2), (8, 1), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-71114605730400015872 : Rat) / 269491324728529755) [(2, 1), (5, 2), (8, 1), (9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 861 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0861_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0861
        rs_R010_ueqv_R010YNN_generator_25_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_25_0861 := by
  native_decide

/-- Coefficient term 862 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0862 : Poly :=
[
  term ((-95981017097526230912 : Rat) / 89830441576176585) [(2, 1), (5, 2), (8, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 862 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0862 : Poly :=
[
  term ((-191962034195052461824 : Rat) / 89830441576176585) [(2, 1), (5, 2), (8, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((95981017097526230912 : Rat) / 89830441576176585) [(2, 1), (5, 2), (8, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 862 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0862_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0862
        rs_R010_ueqv_R010YNN_generator_25_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_25_0862 := by
  native_decide

/-- Coefficient term 863 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0863 : Poly :=
[
  term ((56433192461363200 : Rat) / 17966088315235317) [(2, 1), (5, 2), (8, 1), (9, 1), (11, 2), (13, 1), (16, 1)]
]

/-- Partial product 863 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0863 : Poly :=
[
  term ((112866384922726400 : Rat) / 17966088315235317) [(2, 1), (5, 2), (8, 1), (9, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((-56433192461363200 : Rat) / 17966088315235317) [(2, 1), (5, 2), (8, 1), (9, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 863 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0863_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0863
        rs_R010_ueqv_R010YNN_generator_25_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_25_0863 := by
  native_decide

/-- Coefficient term 864 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0864 : Poly :=
[
  term ((-112866384922726400 : Rat) / 17966088315235317) [(2, 1), (5, 2), (8, 1), (9, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 864 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0864 : Poly :=
[
  term ((-225732769845452800 : Rat) / 17966088315235317) [(2, 1), (5, 2), (8, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((112866384922726400 : Rat) / 17966088315235317) [(2, 1), (5, 2), (8, 1), (9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 864 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0864_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0864
        rs_R010_ueqv_R010YNN_generator_25_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_25_0864 := by
  native_decide

/-- Coefficient term 865 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0865 : Poly :=
[
  term ((125079846927630498816 : Rat) / 29943480525392195) [(2, 1), (5, 2), (8, 1), (9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 865 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0865 : Poly :=
[
  term ((250159693855260997632 : Rat) / 29943480525392195) [(2, 1), (5, 2), (8, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-125079846927630498816 : Rat) / 29943480525392195) [(2, 1), (5, 2), (8, 1), (9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 865 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0865_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0865
        rs_R010_ueqv_R010YNN_generator_25_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_25_0865 := by
  native_decide

/-- Coefficient term 866 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0866 : Poly :=
[
  term ((-554219223153424707616 : Rat) / 4042369870927946325) [(2, 1), (5, 2), (8, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 866 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0866 : Poly :=
[
  term ((-1108438446306849415232 : Rat) / 4042369870927946325) [(2, 1), (5, 2), (8, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((554219223153424707616 : Rat) / 4042369870927946325) [(2, 1), (5, 2), (8, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 866 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0866_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0866
        rs_R010_ueqv_R010YNN_generator_25_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_25_0866 := by
  native_decide

/-- Coefficient term 867 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0867 : Poly :=
[
  term ((1108438446306849415232 : Rat) / 4042369870927946325) [(2, 1), (5, 2), (8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 867 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0867 : Poly :=
[
  term ((2216876892613698830464 : Rat) / 4042369870927946325) [(2, 1), (5, 2), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1108438446306849415232 : Rat) / 4042369870927946325) [(2, 1), (5, 2), (8, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 867 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0867_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0867
        rs_R010_ueqv_R010YNN_generator_25_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_25_0867 := by
  native_decide

/-- Coefficient term 868 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0868 : Poly :=
[
  term ((-250159693855260997632 : Rat) / 29943480525392195) [(2, 1), (5, 2), (8, 1), (9, 1), (15, 3), (16, 1)]
]

/-- Partial product 868 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0868 : Poly :=
[
  term ((-500319387710521995264 : Rat) / 29943480525392195) [(2, 1), (5, 2), (8, 1), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((250159693855260997632 : Rat) / 29943480525392195) [(2, 1), (5, 2), (8, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 868 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0868_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0868
        rs_R010_ueqv_R010YNN_generator_25_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_25_0868 := by
  native_decide

/-- Coefficient term 869 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0869 : Poly :=
[
  term ((-213269996259962880 : Rat) / 5988696105078439) [(2, 1), (5, 2), (8, 1), (9, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 869 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0869 : Poly :=
[
  term ((-426539992519925760 : Rat) / 5988696105078439) [(2, 1), (5, 2), (8, 1), (9, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((213269996259962880 : Rat) / 5988696105078439) [(2, 1), (5, 2), (8, 1), (9, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 869 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0869_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0869
        rs_R010_ueqv_R010YNN_generator_25_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_25_0869 := by
  native_decide

/-- Coefficient term 870 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0870 : Poly :=
[
  term ((426539992519925760 : Rat) / 5988696105078439) [(2, 1), (5, 2), (8, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 870 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0870 : Poly :=
[
  term ((853079985039851520 : Rat) / 5988696105078439) [(2, 1), (5, 2), (8, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-426539992519925760 : Rat) / 5988696105078439) [(2, 1), (5, 2), (8, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 870 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0870_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0870
        rs_R010_ueqv_R010YNN_generator_25_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_25_0870 := by
  native_decide

/-- Coefficient term 871 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0871 : Poly :=
[
  term ((-40658379320722199552 : Rat) / 89830441576176585) [(2, 1), (5, 2), (8, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 871 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0871 : Poly :=
[
  term ((-81316758641444399104 : Rat) / 89830441576176585) [(2, 1), (5, 2), (8, 1), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((40658379320722199552 : Rat) / 89830441576176585) [(2, 1), (5, 2), (8, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 871 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0871_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0871
        rs_R010_ueqv_R010YNN_generator_25_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_25_0871 := by
  native_decide

/-- Coefficient term 872 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0872 : Poly :=
[
  term ((81316758641444399104 : Rat) / 89830441576176585) [(2, 1), (5, 2), (8, 1), (9, 2), (15, 2), (16, 1)]
]

/-- Partial product 872 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0872 : Poly :=
[
  term ((162633517282888798208 : Rat) / 89830441576176585) [(2, 1), (5, 2), (8, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((-81316758641444399104 : Rat) / 89830441576176585) [(2, 1), (5, 2), (8, 1), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 872 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0872_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0872
        rs_R010_ueqv_R010YNN_generator_25_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_25_0872 := by
  native_decide

/-- Coefficient term 873 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0873 : Poly :=
[
  term ((-71154509089341440 : Rat) / 53898264945705951) [(2, 1), (5, 2), (8, 1), (9, 3), (13, 1), (16, 1)]
]

/-- Partial product 873 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0873 : Poly :=
[
  term ((-142309018178682880 : Rat) / 53898264945705951) [(2, 1), (5, 2), (8, 1), (9, 3), (12, 1), (13, 1), (16, 1)],
  term ((71154509089341440 : Rat) / 53898264945705951) [(2, 1), (5, 2), (8, 1), (9, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 873 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0873_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0873
        rs_R010_ueqv_R010YNN_generator_25_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_25_0873 := by
  native_decide

/-- Coefficient term 874 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0874 : Poly :=
[
  term ((142309018178682880 : Rat) / 53898264945705951) [(2, 1), (5, 2), (8, 1), (9, 3), (15, 1), (16, 1)]
]

/-- Partial product 874 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0874 : Poly :=
[
  term ((284618036357365760 : Rat) / 53898264945705951) [(2, 1), (5, 2), (8, 1), (9, 3), (12, 1), (15, 1), (16, 1)],
  term ((-142309018178682880 : Rat) / 53898264945705951) [(2, 1), (5, 2), (8, 1), (9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 874 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0874_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0874
        rs_R010_ueqv_R010YNN_generator_25_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_25_0874 := by
  native_decide

/-- Coefficient term 875 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0875 : Poly :=
[
  term ((-107030693215904362648 : Rat) / 149717402626960975) [(2, 1), (5, 2), (8, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 875 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0875 : Poly :=
[
  term ((-214061386431808725296 : Rat) / 149717402626960975) [(2, 1), (5, 2), (8, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((107030693215904362648 : Rat) / 149717402626960975) [(2, 1), (5, 2), (8, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 875 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0875_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0875
        rs_R010_ueqv_R010YNN_generator_25_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_25_0875 := by
  native_decide

/-- Coefficient term 876 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0876 : Poly :=
[
  term ((214061386431808725296 : Rat) / 149717402626960975) [(2, 1), (5, 2), (8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 876 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0876 : Poly :=
[
  term ((428122772863617450592 : Rat) / 149717402626960975) [(2, 1), (5, 2), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-214061386431808725296 : Rat) / 149717402626960975) [(2, 1), (5, 2), (8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 876 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0876_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0876
        rs_R010_ueqv_R010YNN_generator_25_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_25_0876 := by
  native_decide

/-- Coefficient term 877 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0877 : Poly :=
[
  term ((-1816669710257900273696 : Rat) / 269491324728529755) [(2, 1), (5, 2), (8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 877 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0877 : Poly :=
[
  term ((-3633339420515800547392 : Rat) / 269491324728529755) [(2, 1), (5, 2), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1816669710257900273696 : Rat) / 269491324728529755) [(2, 1), (5, 2), (8, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 877 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0877_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0877
        rs_R010_ueqv_R010YNN_generator_25_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_25_0877 := by
  native_decide

/-- Coefficient term 878 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0878 : Poly :=
[
  term ((3633339420515800547392 : Rat) / 269491324728529755) [(2, 1), (5, 2), (8, 1), (15, 2), (16, 1)]
]

/-- Partial product 878 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0878 : Poly :=
[
  term ((7266678841031601094784 : Rat) / 269491324728529755) [(2, 1), (5, 2), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-3633339420515800547392 : Rat) / 269491324728529755) [(2, 1), (5, 2), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 878 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0878_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0878
        rs_R010_ueqv_R010YNN_generator_25_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_25_0878 := by
  native_decide

/-- Coefficient term 879 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0879 : Poly :=
[
  term ((211310777032520608952 : Rat) / 161694794837117853) [(2, 1), (5, 2), (9, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 879 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0879 : Poly :=
[
  term ((422621554065041217904 : Rat) / 161694794837117853) [(2, 1), (5, 2), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-211310777032520608952 : Rat) / 161694794837117853) [(2, 1), (5, 2), (9, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 879 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0879_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0879
        rs_R010_ueqv_R010YNN_generator_25_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_25_0879 := by
  native_decide

/-- Coefficient term 880 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0880 : Poly :=
[
  term ((-422621554065041217904 : Rat) / 161694794837117853) [(2, 1), (5, 2), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 880 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0880 : Poly :=
[
  term ((-845243108130082435808 : Rat) / 161694794837117853) [(2, 1), (5, 2), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((422621554065041217904 : Rat) / 161694794837117853) [(2, 1), (5, 2), (9, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 880 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0880_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0880
        rs_R010_ueqv_R010YNN_generator_25_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_25_0880 := by
  native_decide

/-- Coefficient term 881 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0881 : Poly :=
[
  term ((8545414984394796800 : Rat) / 53898264945705951) [(2, 1), (5, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 881 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0881 : Poly :=
[
  term ((17090829968789593600 : Rat) / 53898264945705951) [(2, 1), (5, 2), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-8545414984394796800 : Rat) / 53898264945705951) [(2, 1), (5, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 881 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0881_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0881
        rs_R010_ueqv_R010YNN_generator_25_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_25_0881 := by
  native_decide

/-- Coefficient term 882 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0882 : Poly :=
[
  term ((-17090829968789593600 : Rat) / 53898264945705951) [(2, 1), (5, 2), (9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 882 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0882 : Poly :=
[
  term ((-34181659937579187200 : Rat) / 53898264945705951) [(2, 1), (5, 2), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((17090829968789593600 : Rat) / 53898264945705951) [(2, 1), (5, 2), (9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 882 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0882_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0882
        rs_R010_ueqv_R010YNN_generator_25_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_25_0882 := by
  native_decide

/-- Coefficient term 883 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0883 : Poly :=
[
  term ((16751835683757716552 : Rat) / 53898264945705951) [(2, 1), (5, 2), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 883 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0883 : Poly :=
[
  term ((33503671367515433104 : Rat) / 53898264945705951) [(2, 1), (5, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-16751835683757716552 : Rat) / 53898264945705951) [(2, 1), (5, 2), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 883 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0883_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0883
        rs_R010_ueqv_R010YNN_generator_25_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_25_0883 := by
  native_decide

/-- Coefficient term 884 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0884 : Poly :=
[
  term ((-4216887687453903872 : Rat) / 269491324728529755) [(2, 1), (5, 2), (9, 1), (11, 2), (13, 1), (16, 1)]
]

/-- Partial product 884 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0884 : Poly :=
[
  term ((-8433775374907807744 : Rat) / 269491324728529755) [(2, 1), (5, 2), (9, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((4216887687453903872 : Rat) / 269491324728529755) [(2, 1), (5, 2), (9, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 884 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0884_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0884
        rs_R010_ueqv_R010YNN_generator_25_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_25_0884 := by
  native_decide

/-- Coefficient term 885 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0885 : Poly :=
[
  term ((8433775374907807744 : Rat) / 269491324728529755) [(2, 1), (5, 2), (9, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 885 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0885 : Poly :=
[
  term ((16867550749815615488 : Rat) / 269491324728529755) [(2, 1), (5, 2), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-8433775374907807744 : Rat) / 269491324728529755) [(2, 1), (5, 2), (9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 885 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0885_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0885
        rs_R010_ueqv_R010YNN_generator_25_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_25_0885 := by
  native_decide

/-- Coefficient term 886 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0886 : Poly :=
[
  term ((-62428228178500150048 : Rat) / 53898264945705951) [(2, 1), (5, 2), (9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 886 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0886 : Poly :=
[
  term ((-124856456357000300096 : Rat) / 53898264945705951) [(2, 1), (5, 2), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((62428228178500150048 : Rat) / 53898264945705951) [(2, 1), (5, 2), (9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 886 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0886_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0886
        rs_R010_ueqv_R010YNN_generator_25_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_25_0886 := by
  native_decide

/-- Coefficient term 887 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0887 : Poly :=
[
  term ((-13320625026823114448 : Rat) / 29943480525392195) [(2, 1), (5, 2), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 887 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0887 : Poly :=
[
  term ((-26641250053646228896 : Rat) / 29943480525392195) [(2, 1), (5, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((13320625026823114448 : Rat) / 29943480525392195) [(2, 1), (5, 2), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 887 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0887_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0887
        rs_R010_ueqv_R010YNN_generator_25_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_25_0887 := by
  native_decide

/-- Coefficient term 888 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0888 : Poly :=
[
  term ((26641250053646228896 : Rat) / 29943480525392195) [(2, 1), (5, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 888 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0888 : Poly :=
[
  term ((53282500107292457792 : Rat) / 29943480525392195) [(2, 1), (5, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-26641250053646228896 : Rat) / 29943480525392195) [(2, 1), (5, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 888 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0888_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0888
        rs_R010_ueqv_R010YNN_generator_25_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_25_0888 := by
  native_decide

/-- Coefficient term 889 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0889 : Poly :=
[
  term ((124856456357000300096 : Rat) / 53898264945705951) [(2, 1), (5, 2), (9, 1), (15, 3), (16, 1)]
]

/-- Partial product 889 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0889 : Poly :=
[
  term ((249712912714000600192 : Rat) / 53898264945705951) [(2, 1), (5, 2), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((-124856456357000300096 : Rat) / 53898264945705951) [(2, 1), (5, 2), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 889 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0889_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0889
        rs_R010_ueqv_R010YNN_generator_25_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_25_0889 := by
  native_decide

/-- Coefficient term 890 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0890 : Poly :=
[
  term ((-1655441134193100800 : Rat) / 53898264945705951) [(2, 1), (5, 2), (9, 2), (10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 890 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0890 : Poly :=
[
  term ((-3310882268386201600 : Rat) / 53898264945705951) [(2, 1), (5, 2), (9, 2), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((1655441134193100800 : Rat) / 53898264945705951) [(2, 1), (5, 2), (9, 2), (10, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 890 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0890_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0890
        rs_R010_ueqv_R010YNN_generator_25_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_25_0890 := by
  native_decide

/-- Coefficient term 891 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0891 : Poly :=
[
  term ((3310882268386201600 : Rat) / 53898264945705951) [(2, 1), (5, 2), (9, 2), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 891 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0891 : Poly :=
[
  term ((6621764536772403200 : Rat) / 53898264945705951) [(2, 1), (5, 2), (9, 2), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3310882268386201600 : Rat) / 53898264945705951) [(2, 1), (5, 2), (9, 2), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 891 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0891_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0891
        rs_R010_ueqv_R010YNN_generator_25_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_25_0891 := by
  native_decide

/-- Coefficient term 892 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0892 : Poly :=
[
  term ((-5018339383353424640 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 892 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0892 : Poly :=
[
  term ((-10036678766706849280 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((5018339383353424640 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 892 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0892_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0892
        rs_R010_ueqv_R010YNN_generator_25_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_25_0892 := by
  native_decide

/-- Coefficient term 893 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0893 : Poly :=
[
  term ((10036678766706849280 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 2), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 893 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0893 : Poly :=
[
  term ((20073357533413698560 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 2), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-10036678766706849280 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 2), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 893 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0893_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0893
        rs_R010_ueqv_R010YNN_generator_25_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_25_0893 := by
  native_decide

/-- Coefficient term 894 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0894 : Poly :=
[
  term ((475721833237504000 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 2), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 894 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0894 : Poly :=
[
  term ((951443666475008000 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 2), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-475721833237504000 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 2), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 894 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0894_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0894
        rs_R010_ueqv_R010YNN_generator_25_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_25_0894 := by
  native_decide

/-- Coefficient term 895 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0895 : Poly :=
[
  term ((-12271167490397595904 : Rat) / 89830441576176585) [(2, 1), (5, 2), (9, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 895 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0895 : Poly :=
[
  term ((-24542334980795191808 : Rat) / 89830441576176585) [(2, 1), (5, 2), (9, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((12271167490397595904 : Rat) / 89830441576176585) [(2, 1), (5, 2), (9, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 895 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0895_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0895
        rs_R010_ueqv_R010YNN_generator_25_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_25_0895 := by
  native_decide

/-- Coefficient term 896 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0896 : Poly :=
[
  term ((24542334980795191808 : Rat) / 89830441576176585) [(2, 1), (5, 2), (9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 896 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0896 : Poly :=
[
  term ((49084669961590383616 : Rat) / 89830441576176585) [(2, 1), (5, 2), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-24542334980795191808 : Rat) / 89830441576176585) [(2, 1), (5, 2), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 896 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0896_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0896
        rs_R010_ueqv_R010YNN_generator_25_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_25_0896 := by
  native_decide

/-- Coefficient term 897 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0897 : Poly :=
[
  term ((-951443666475008000 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 2), (11, 1), (15, 3), (16, 1)]
]

/-- Partial product 897 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0897 : Poly :=
[
  term ((-1902887332950016000 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 2), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((951443666475008000 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 2), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 897 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0897_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0897
        rs_R010_ueqv_R010YNN_generator_25_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_25_0897 := by
  native_decide

/-- Coefficient term 898 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0898 : Poly :=
[
  term ((-118930458309376000 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 2), (11, 2), (16, 1)]
]

/-- Partial product 898 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0898 : Poly :=
[
  term ((-237860916618752000 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 2), (11, 2), (12, 1), (16, 1)],
  term ((118930458309376000 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 898 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0898_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0898
        rs_R010_ueqv_R010YNN_generator_25_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_25_0898 := by
  native_decide

/-- Coefficient term 899 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0899 : Poly :=
[
  term ((2396994043419447226048 : Rat) / 449152207880882925) [(2, 1), (5, 2), (9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 899 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0899 : Poly :=
[
  term ((4793988086838894452096 : Rat) / 449152207880882925) [(2, 1), (5, 2), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2396994043419447226048 : Rat) / 449152207880882925) [(2, 1), (5, 2), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 899 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0899_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0899
        rs_R010_ueqv_R010YNN_generator_25_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_25_0899 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010YNN_partials_25_0800_0899 : List Poly :=
[
  rs_R010_ueqv_R010YNN_partial_25_0800,
  rs_R010_ueqv_R010YNN_partial_25_0801,
  rs_R010_ueqv_R010YNN_partial_25_0802,
  rs_R010_ueqv_R010YNN_partial_25_0803,
  rs_R010_ueqv_R010YNN_partial_25_0804,
  rs_R010_ueqv_R010YNN_partial_25_0805,
  rs_R010_ueqv_R010YNN_partial_25_0806,
  rs_R010_ueqv_R010YNN_partial_25_0807,
  rs_R010_ueqv_R010YNN_partial_25_0808,
  rs_R010_ueqv_R010YNN_partial_25_0809,
  rs_R010_ueqv_R010YNN_partial_25_0810,
  rs_R010_ueqv_R010YNN_partial_25_0811,
  rs_R010_ueqv_R010YNN_partial_25_0812,
  rs_R010_ueqv_R010YNN_partial_25_0813,
  rs_R010_ueqv_R010YNN_partial_25_0814,
  rs_R010_ueqv_R010YNN_partial_25_0815,
  rs_R010_ueqv_R010YNN_partial_25_0816,
  rs_R010_ueqv_R010YNN_partial_25_0817,
  rs_R010_ueqv_R010YNN_partial_25_0818,
  rs_R010_ueqv_R010YNN_partial_25_0819,
  rs_R010_ueqv_R010YNN_partial_25_0820,
  rs_R010_ueqv_R010YNN_partial_25_0821,
  rs_R010_ueqv_R010YNN_partial_25_0822,
  rs_R010_ueqv_R010YNN_partial_25_0823,
  rs_R010_ueqv_R010YNN_partial_25_0824,
  rs_R010_ueqv_R010YNN_partial_25_0825,
  rs_R010_ueqv_R010YNN_partial_25_0826,
  rs_R010_ueqv_R010YNN_partial_25_0827,
  rs_R010_ueqv_R010YNN_partial_25_0828,
  rs_R010_ueqv_R010YNN_partial_25_0829,
  rs_R010_ueqv_R010YNN_partial_25_0830,
  rs_R010_ueqv_R010YNN_partial_25_0831,
  rs_R010_ueqv_R010YNN_partial_25_0832,
  rs_R010_ueqv_R010YNN_partial_25_0833,
  rs_R010_ueqv_R010YNN_partial_25_0834,
  rs_R010_ueqv_R010YNN_partial_25_0835,
  rs_R010_ueqv_R010YNN_partial_25_0836,
  rs_R010_ueqv_R010YNN_partial_25_0837,
  rs_R010_ueqv_R010YNN_partial_25_0838,
  rs_R010_ueqv_R010YNN_partial_25_0839,
  rs_R010_ueqv_R010YNN_partial_25_0840,
  rs_R010_ueqv_R010YNN_partial_25_0841,
  rs_R010_ueqv_R010YNN_partial_25_0842,
  rs_R010_ueqv_R010YNN_partial_25_0843,
  rs_R010_ueqv_R010YNN_partial_25_0844,
  rs_R010_ueqv_R010YNN_partial_25_0845,
  rs_R010_ueqv_R010YNN_partial_25_0846,
  rs_R010_ueqv_R010YNN_partial_25_0847,
  rs_R010_ueqv_R010YNN_partial_25_0848,
  rs_R010_ueqv_R010YNN_partial_25_0849,
  rs_R010_ueqv_R010YNN_partial_25_0850,
  rs_R010_ueqv_R010YNN_partial_25_0851,
  rs_R010_ueqv_R010YNN_partial_25_0852,
  rs_R010_ueqv_R010YNN_partial_25_0853,
  rs_R010_ueqv_R010YNN_partial_25_0854,
  rs_R010_ueqv_R010YNN_partial_25_0855,
  rs_R010_ueqv_R010YNN_partial_25_0856,
  rs_R010_ueqv_R010YNN_partial_25_0857,
  rs_R010_ueqv_R010YNN_partial_25_0858,
  rs_R010_ueqv_R010YNN_partial_25_0859,
  rs_R010_ueqv_R010YNN_partial_25_0860,
  rs_R010_ueqv_R010YNN_partial_25_0861,
  rs_R010_ueqv_R010YNN_partial_25_0862,
  rs_R010_ueqv_R010YNN_partial_25_0863,
  rs_R010_ueqv_R010YNN_partial_25_0864,
  rs_R010_ueqv_R010YNN_partial_25_0865,
  rs_R010_ueqv_R010YNN_partial_25_0866,
  rs_R010_ueqv_R010YNN_partial_25_0867,
  rs_R010_ueqv_R010YNN_partial_25_0868,
  rs_R010_ueqv_R010YNN_partial_25_0869,
  rs_R010_ueqv_R010YNN_partial_25_0870,
  rs_R010_ueqv_R010YNN_partial_25_0871,
  rs_R010_ueqv_R010YNN_partial_25_0872,
  rs_R010_ueqv_R010YNN_partial_25_0873,
  rs_R010_ueqv_R010YNN_partial_25_0874,
  rs_R010_ueqv_R010YNN_partial_25_0875,
  rs_R010_ueqv_R010YNN_partial_25_0876,
  rs_R010_ueqv_R010YNN_partial_25_0877,
  rs_R010_ueqv_R010YNN_partial_25_0878,
  rs_R010_ueqv_R010YNN_partial_25_0879,
  rs_R010_ueqv_R010YNN_partial_25_0880,
  rs_R010_ueqv_R010YNN_partial_25_0881,
  rs_R010_ueqv_R010YNN_partial_25_0882,
  rs_R010_ueqv_R010YNN_partial_25_0883,
  rs_R010_ueqv_R010YNN_partial_25_0884,
  rs_R010_ueqv_R010YNN_partial_25_0885,
  rs_R010_ueqv_R010YNN_partial_25_0886,
  rs_R010_ueqv_R010YNN_partial_25_0887,
  rs_R010_ueqv_R010YNN_partial_25_0888,
  rs_R010_ueqv_R010YNN_partial_25_0889,
  rs_R010_ueqv_R010YNN_partial_25_0890,
  rs_R010_ueqv_R010YNN_partial_25_0891,
  rs_R010_ueqv_R010YNN_partial_25_0892,
  rs_R010_ueqv_R010YNN_partial_25_0893,
  rs_R010_ueqv_R010YNN_partial_25_0894,
  rs_R010_ueqv_R010YNN_partial_25_0895,
  rs_R010_ueqv_R010YNN_partial_25_0896,
  rs_R010_ueqv_R010YNN_partial_25_0897,
  rs_R010_ueqv_R010YNN_partial_25_0898,
  rs_R010_ueqv_R010YNN_partial_25_0899
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010YNN_block_25_0800_0899 : Poly :=
[
  term ((-254207685414502400 : Rat) / 17966088315235317) [(2, 1), (5, 1), (9, 3), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((508415370829004800 : Rat) / 17966088315235317) [(2, 1), (5, 1), (9, 3), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((127103842707251200 : Rat) / 17966088315235317) [(2, 1), (5, 1), (9, 3), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-254207685414502400 : Rat) / 17966088315235317) [(2, 1), (5, 1), (9, 3), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-8881762891094589440 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 3), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((17763525782189178880 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 3), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((4440881445547294720 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 3), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-8881762891094589440 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 3), (10, 1), (15, 2), (16, 1)],
  term ((508415370829004800 : Rat) / 17966088315235317) [(2, 1), (5, 1), (9, 3), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((4828796144538419200 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 3), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-9657592289076838400 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 3), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1016830741658009600 : Rat) / 17966088315235317) [(2, 1), (5, 1), (9, 3), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-254207685414502400 : Rat) / 17966088315235317) [(2, 1), (5, 1), (9, 3), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2414398072269209600 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 3), (11, 1), (13, 1), (16, 1)],
  term ((4828796144538419200 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 3), (11, 1), (15, 1), (16, 1)],
  term ((508415370829004800 : Rat) / 17966088315235317) [(2, 1), (5, 1), (9, 3), (11, 1), (15, 3), (16, 1)],
  term ((-127103842707251200 : Rat) / 17966088315235317) [(2, 1), (5, 1), (9, 3), (11, 2), (12, 1), (16, 1)],
  term ((63551921353625600 : Rat) / 17966088315235317) [(2, 1), (5, 1), (9, 3), (11, 2), (16, 1)],
  term ((5730985049653821440 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 3), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-11461970099307642880 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 3), (12, 1), (15, 2), (16, 1)],
  term ((-2865492524826910720 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((5730985049653821440 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 3), (15, 2), (16, 1)],
  term ((2871455259507752960 : Rat) / 17966088315235317) [(2, 1), (5, 1), (9, 4), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-5742910519015505920 : Rat) / 17966088315235317) [(2, 1), (5, 1), (9, 4), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1435727629753876480 : Rat) / 17966088315235317) [(2, 1), (5, 1), (9, 4), (10, 1), (13, 1), (16, 1)],
  term ((2871455259507752960 : Rat) / 17966088315235317) [(2, 1), (5, 1), (9, 4), (10, 1), (15, 1), (16, 1)],
  term ((1435727629753876480 : Rat) / 17966088315235317) [(2, 1), (5, 1), (9, 4), (11, 1), (12, 1), (16, 1)],
  term ((-717863814876938240 : Rat) / 17966088315235317) [(2, 1), (5, 1), (9, 4), (11, 1), (16, 1)],
  term ((-5742910519015505920 : Rat) / 17966088315235317) [(2, 1), (5, 1), (9, 4), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((11485821038031011840 : Rat) / 17966088315235317) [(2, 1), (5, 1), (9, 4), (12, 1), (15, 3), (16, 1)],
  term ((2871455259507752960 : Rat) / 17966088315235317) [(2, 1), (5, 1), (9, 4), (13, 1), (15, 2), (16, 1)],
  term ((-5742910519015505920 : Rat) / 17966088315235317) [(2, 1), (5, 1), (9, 4), (15, 3), (16, 1)],
  term ((-2586005023494621440 : Rat) / 17966088315235317) [(2, 1), (5, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((5172010046989242880 : Rat) / 17966088315235317) [(2, 1), (5, 1), (10, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((1293002511747310720 : Rat) / 17966088315235317) [(2, 1), (5, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2586005023494621440 : Rat) / 17966088315235317) [(2, 1), (5, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((718926830170895611424 : Rat) / 269491324728529755) [(2, 1), (5, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1437853660341791222848 : Rat) / 269491324728529755) [(2, 1), (5, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-359463415085447805712 : Rat) / 269491324728529755) [(2, 1), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((718926830170895611424 : Rat) / 269491324728529755) [(2, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-3525387563878718992 : Rat) / 53898264945705951) [(2, 1), (5, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((7050775127757437984 : Rat) / 53898264945705951) [(2, 1), (5, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((359463415085447805712 : Rat) / 269491324728529755) [(2, 1), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((1762693781939359496 : Rat) / 53898264945705951) [(2, 1), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3525387563878718992 : Rat) / 53898264945705951) [(2, 1), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((-179731707542723902856 : Rat) / 269491324728529755) [(2, 1), (5, 1), (11, 1), (16, 1)],
  term ((-46576335092646801472 : Rat) / 1347456623642648775) [(2, 1), (5, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((93152670185293602944 : Rat) / 1347456623642648775) [(2, 1), (5, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((23288167546323400736 : Rat) / 1347456623642648775) [(2, 1), (5, 1), (11, 2), (13, 1), (16, 1)],
  term ((-46576335092646801472 : Rat) / 1347456623642648775) [(2, 1), (5, 1), (11, 2), (15, 1), (16, 1)],
  term ((-1437853660341791222848 : Rat) / 269491324728529755) [(2, 1), (5, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term (-16 : Rat) [(2, 1), (5, 1), (12, 1), (13, 1), (16, 1)],
  term (32 : Rat) [(2, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((2875707320683582445696 : Rat) / 269491324728529755) [(2, 1), (5, 1), (12, 1), (15, 3), (16, 1)],
  term ((718926830170895611424 : Rat) / 269491324728529755) [(2, 1), (5, 1), (13, 1), (15, 2), (16, 1)],
  term (8 : Rat) [(2, 1), (5, 1), (13, 1), (16, 1)],
  term (-16 : Rat) [(2, 1), (5, 1), (15, 1), (16, 1)],
  term ((-1437853660341791222848 : Rat) / 269491324728529755) [(2, 1), (5, 1), (15, 3), (16, 1)],
  term ((-594307739164052480 : Rat) / 17966088315235317) [(2, 1), (5, 2), (6, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1188615478328104960 : Rat) / 17966088315235317) [(2, 1), (5, 2), (6, 1), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((297153869582026240 : Rat) / 17966088315235317) [(2, 1), (5, 2), (6, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-594307739164052480 : Rat) / 17966088315235317) [(2, 1), (5, 2), (6, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-278506735265382400 : Rat) / 53898264945705951) [(2, 1), (5, 2), (6, 1), (9, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((557013470530764800 : Rat) / 53898264945705951) [(2, 1), (5, 2), (6, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((139253367632691200 : Rat) / 53898264945705951) [(2, 1), (5, 2), (6, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-278506735265382400 : Rat) / 53898264945705951) [(2, 1), (5, 2), (6, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((1580023305660560192 : Rat) / 53898264945705951) [(2, 1), (5, 2), (6, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-3160046611321120384 : Rat) / 53898264945705951) [(2, 1), (5, 2), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-790011652830280096 : Rat) / 53898264945705951) [(2, 1), (5, 2), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((1580023305660560192 : Rat) / 53898264945705951) [(2, 1), (5, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((765893521979801600 : Rat) / 17966088315235317) [(2, 1), (5, 2), (6, 1), (9, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1531787043959603200 : Rat) / 17966088315235317) [(2, 1), (5, 2), (6, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-382946760989900800 : Rat) / 17966088315235317) [(2, 1), (5, 2), (6, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((765893521979801600 : Rat) / 17966088315235317) [(2, 1), (5, 2), (6, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((371570938350848000 : Rat) / 17966088315235317) [(2, 1), (5, 2), (6, 1), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-743141876701696000 : Rat) / 17966088315235317) [(2, 1), (5, 2), (6, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((-185785469175424000 : Rat) / 17966088315235317) [(2, 1), (5, 2), (6, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((371570938350848000 : Rat) / 17966088315235317) [(2, 1), (5, 2), (6, 1), (9, 2), (15, 2), (16, 1)],
  term ((-2228053882123059200 : Rat) / 53898264945705951) [(2, 1), (5, 2), (6, 1), (9, 3), (12, 1), (13, 1), (16, 1)],
  term ((4456107764246118400 : Rat) / 53898264945705951) [(2, 1), (5, 2), (6, 1), (9, 3), (12, 1), (15, 1), (16, 1)],
  term ((1114026941061529600 : Rat) / 53898264945705951) [(2, 1), (5, 2), (6, 1), (9, 3), (13, 1), (16, 1)],
  term ((-2228053882123059200 : Rat) / 53898264945705951) [(2, 1), (5, 2), (6, 1), (9, 3), (15, 1), (16, 1)],
  term ((-2181428819547235936 : Rat) / 17966088315235317) [(2, 1), (5, 2), (6, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((4362857639094471872 : Rat) / 17966088315235317) [(2, 1), (5, 2), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1090714409773617968 : Rat) / 17966088315235317) [(2, 1), (5, 2), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-2181428819547235936 : Rat) / 17966088315235317) [(2, 1), (5, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3401955106101528832 : Rat) / 53898264945705951) [(2, 1), (5, 2), (7, 1), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((6803910212203057664 : Rat) / 53898264945705951) [(2, 1), (5, 2), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((1700977553050764416 : Rat) / 53898264945705951) [(2, 1), (5, 2), (7, 1), (8, 1), (13, 1), (16, 1)],
  term ((-3401955106101528832 : Rat) / 53898264945705951) [(2, 1), (5, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((755251828756107469664 : Rat) / 449152207880882925) [(2, 1), (5, 2), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1510503657512214939328 : Rat) / 449152207880882925) [(2, 1), (5, 2), (7, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-377625914378053734832 : Rat) / 449152207880882925) [(2, 1), (5, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((755251828756107469664 : Rat) / 449152207880882925) [(2, 1), (5, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-20806045790354688512 : Rat) / 29943480525392195) [(2, 1), (5, 2), (7, 1), (9, 2), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((41612091580709377024 : Rat) / 29943480525392195) [(2, 1), (5, 2), (7, 1), (9, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((10403022895177344256 : Rat) / 29943480525392195) [(2, 1), (5, 2), (7, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((-20806045790354688512 : Rat) / 29943480525392195) [(2, 1), (5, 2), (7, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((131236952121139200 : Rat) / 5988696105078439) [(2, 1), (5, 2), (7, 1), (9, 2), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-262473904242278400 : Rat) / 5988696105078439) [(2, 1), (5, 2), (7, 1), (9, 2), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-10403022895177344256 : Rat) / 29943480525392195) [(2, 1), (5, 2), (7, 1), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((-65618476060569600 : Rat) / 5988696105078439) [(2, 1), (5, 2), (7, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((131236952121139200 : Rat) / 5988696105078439) [(2, 1), (5, 2), (7, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((5201511447588672128 : Rat) / 29943480525392195) [(2, 1), (5, 2), (7, 1), (9, 2), (11, 1), (16, 1)],
  term ((93256174352261123072 : Rat) / 89830441576176585) [(2, 1), (5, 2), (7, 1), (9, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-186512348704522246144 : Rat) / 89830441576176585) [(2, 1), (5, 2), (7, 1), (9, 2), (12, 1), (15, 3), (16, 1)],
  term ((-46628087176130561536 : Rat) / 89830441576176585) [(2, 1), (5, 2), (7, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((93256174352261123072 : Rat) / 89830441576176585) [(2, 1), (5, 2), (7, 1), (9, 2), (15, 3), (16, 1)],
  term ((4202965634845573120 : Rat) / 17966088315235317) [(2, 1), (5, 2), (7, 1), (9, 3), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-8405931269691146240 : Rat) / 17966088315235317) [(2, 1), (5, 2), (7, 1), (9, 3), (12, 1), (15, 2), (16, 1)],
  term ((-2101482817422786560 : Rat) / 17966088315235317) [(2, 1), (5, 2), (7, 1), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((4202965634845573120 : Rat) / 17966088315235317) [(2, 1), (5, 2), (7, 1), (9, 3), (15, 2), (16, 1)],
  term ((1700977553050764416 : Rat) / 53898264945705951) [(2, 1), (5, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-3401955106101528832 : Rat) / 53898264945705951) [(2, 1), (5, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-850488776525382208 : Rat) / 53898264945705951) [(2, 1), (5, 2), (7, 1), (13, 1), (16, 1)],
  term ((1700977553050764416 : Rat) / 53898264945705951) [(2, 1), (5, 2), (7, 1), (15, 1), (16, 1)],
  term ((-383924068390104923648 : Rat) / 89830441576176585) [(2, 1), (5, 2), (8, 1), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((767848136780209847296 : Rat) / 89830441576176585) [(2, 1), (5, 2), (8, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((191962034195052461824 : Rat) / 89830441576176585) [(2, 1), (5, 2), (8, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-383924068390104923648 : Rat) / 89830441576176585) [(2, 1), (5, 2), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-71114605730400015872 : Rat) / 269491324728529755) [(2, 1), (5, 2), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((142229211460800031744 : Rat) / 269491324728529755) [(2, 1), (5, 2), (8, 1), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-191962034195052461824 : Rat) / 89830441576176585) [(2, 1), (5, 2), (8, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((35557302865200007936 : Rat) / 269491324728529755) [(2, 1), (5, 2), (8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-71114605730400015872 : Rat) / 269491324728529755) [(2, 1), (5, 2), (8, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((95981017097526230912 : Rat) / 89830441576176585) [(2, 1), (5, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((112866384922726400 : Rat) / 17966088315235317) [(2, 1), (5, 2), (8, 1), (9, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((-225732769845452800 : Rat) / 17966088315235317) [(2, 1), (5, 2), (8, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-56433192461363200 : Rat) / 17966088315235317) [(2, 1), (5, 2), (8, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((112866384922726400 : Rat) / 17966088315235317) [(2, 1), (5, 2), (8, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((250159693855260997632 : Rat) / 29943480525392195) [(2, 1), (5, 2), (8, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1108438446306849415232 : Rat) / 4042369870927946325) [(2, 1), (5, 2), (8, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((2216876892613698830464 : Rat) / 4042369870927946325) [(2, 1), (5, 2), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-500319387710521995264 : Rat) / 29943480525392195) [(2, 1), (5, 2), (8, 1), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((-125079846927630498816 : Rat) / 29943480525392195) [(2, 1), (5, 2), (8, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((554219223153424707616 : Rat) / 4042369870927946325) [(2, 1), (5, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-1108438446306849415232 : Rat) / 4042369870927946325) [(2, 1), (5, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((250159693855260997632 : Rat) / 29943480525392195) [(2, 1), (5, 2), (8, 1), (9, 1), (15, 3), (16, 1)],
  term ((-426539992519925760 : Rat) / 5988696105078439) [(2, 1), (5, 2), (8, 1), (9, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((853079985039851520 : Rat) / 5988696105078439) [(2, 1), (5, 2), (8, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((213269996259962880 : Rat) / 5988696105078439) [(2, 1), (5, 2), (8, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-426539992519925760 : Rat) / 5988696105078439) [(2, 1), (5, 2), (8, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-81316758641444399104 : Rat) / 89830441576176585) [(2, 1), (5, 2), (8, 1), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((162633517282888798208 : Rat) / 89830441576176585) [(2, 1), (5, 2), (8, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((40658379320722199552 : Rat) / 89830441576176585) [(2, 1), (5, 2), (8, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-81316758641444399104 : Rat) / 89830441576176585) [(2, 1), (5, 2), (8, 1), (9, 2), (15, 2), (16, 1)],
  term ((-142309018178682880 : Rat) / 53898264945705951) [(2, 1), (5, 2), (8, 1), (9, 3), (12, 1), (13, 1), (16, 1)],
  term ((284618036357365760 : Rat) / 53898264945705951) [(2, 1), (5, 2), (8, 1), (9, 3), (12, 1), (15, 1), (16, 1)],
  term ((71154509089341440 : Rat) / 53898264945705951) [(2, 1), (5, 2), (8, 1), (9, 3), (13, 1), (16, 1)],
  term ((-142309018178682880 : Rat) / 53898264945705951) [(2, 1), (5, 2), (8, 1), (9, 3), (15, 1), (16, 1)],
  term ((-214061386431808725296 : Rat) / 149717402626960975) [(2, 1), (5, 2), (8, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((428122772863617450592 : Rat) / 149717402626960975) [(2, 1), (5, 2), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((107030693215904362648 : Rat) / 149717402626960975) [(2, 1), (5, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-214061386431808725296 : Rat) / 149717402626960975) [(2, 1), (5, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3633339420515800547392 : Rat) / 269491324728529755) [(2, 1), (5, 2), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((7266678841031601094784 : Rat) / 269491324728529755) [(2, 1), (5, 2), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((1816669710257900273696 : Rat) / 269491324728529755) [(2, 1), (5, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3633339420515800547392 : Rat) / 269491324728529755) [(2, 1), (5, 2), (8, 1), (15, 2), (16, 1)],
  term ((422621554065041217904 : Rat) / 161694794837117853) [(2, 1), (5, 2), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-845243108130082435808 : Rat) / 161694794837117853) [(2, 1), (5, 2), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-211310777032520608952 : Rat) / 161694794837117853) [(2, 1), (5, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((422621554065041217904 : Rat) / 161694794837117853) [(2, 1), (5, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((17090829968789593600 : Rat) / 53898264945705951) [(2, 1), (5, 2), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-34181659937579187200 : Rat) / 53898264945705951) [(2, 1), (5, 2), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((33503671367515433104 : Rat) / 53898264945705951) [(2, 1), (5, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-8545414984394796800 : Rat) / 53898264945705951) [(2, 1), (5, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((17090829968789593600 : Rat) / 53898264945705951) [(2, 1), (5, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-16751835683757716552 : Rat) / 53898264945705951) [(2, 1), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-8433775374907807744 : Rat) / 269491324728529755) [(2, 1), (5, 2), (9, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((16867550749815615488 : Rat) / 269491324728529755) [(2, 1), (5, 2), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((4216887687453903872 : Rat) / 269491324728529755) [(2, 1), (5, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-8433775374907807744 : Rat) / 269491324728529755) [(2, 1), (5, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-124856456357000300096 : Rat) / 53898264945705951) [(2, 1), (5, 2), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-26641250053646228896 : Rat) / 29943480525392195) [(2, 1), (5, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((53282500107292457792 : Rat) / 29943480525392195) [(2, 1), (5, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((249712912714000600192 : Rat) / 53898264945705951) [(2, 1), (5, 2), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((62428228178500150048 : Rat) / 53898264945705951) [(2, 1), (5, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((13320625026823114448 : Rat) / 29943480525392195) [(2, 1), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((-26641250053646228896 : Rat) / 29943480525392195) [(2, 1), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-124856456357000300096 : Rat) / 53898264945705951) [(2, 1), (5, 2), (9, 1), (15, 3), (16, 1)],
  term ((-3310882268386201600 : Rat) / 53898264945705951) [(2, 1), (5, 2), (9, 2), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((6621764536772403200 : Rat) / 53898264945705951) [(2, 1), (5, 2), (9, 2), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1655441134193100800 : Rat) / 53898264945705951) [(2, 1), (5, 2), (9, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-3310882268386201600 : Rat) / 53898264945705951) [(2, 1), (5, 2), (9, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-10036678766706849280 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((20073357533413698560 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 2), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((5018339383353424640 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-10036678766706849280 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 2), (10, 1), (15, 2), (16, 1)],
  term ((951443666475008000 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 2), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-24542334980795191808 : Rat) / 89830441576176585) [(2, 1), (5, 2), (9, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((49084669961590383616 : Rat) / 89830441576176585) [(2, 1), (5, 2), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1902887332950016000 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 2), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-475721833237504000 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((12271167490397595904 : Rat) / 89830441576176585) [(2, 1), (5, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-24542334980795191808 : Rat) / 89830441576176585) [(2, 1), (5, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((951443666475008000 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 2), (11, 1), (15, 3), (16, 1)],
  term ((-237860916618752000 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 2), (11, 2), (12, 1), (16, 1)],
  term ((118930458309376000 : Rat) / 17966088315235317) [(2, 1), (5, 2), (9, 2), (11, 2), (16, 1)],
  term ((4793988086838894452096 : Rat) / 449152207880882925) [(2, 1), (5, 2), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2396994043419447226048 : Rat) / 449152207880882925) [(2, 1), (5, 2), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 25, terms 800 through 899. -/
theorem rs_R010_ueqv_R010YNN_block_25_0800_0899_valid :
    checkProductSumEq rs_R010_ueqv_R010YNN_partials_25_0800_0899
      rs_R010_ueqv_R010YNN_block_25_0800_0899 = true := by
  native_decide

end R010UeqvR010YNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
