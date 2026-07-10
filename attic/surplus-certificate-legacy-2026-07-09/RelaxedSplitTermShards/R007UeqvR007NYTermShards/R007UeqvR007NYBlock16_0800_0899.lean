/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R007:u=v:R007NY, term block 16:800-899

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R007UeqvR007NYTermShards

/-- Generator polynomial 16 for relaxed split surplus certificate `R007:u=v:R007NY`. -/
def rs_R007_ueqv_R007NY_generator_16_0800_0899 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(6, 1)]
]

/-- Coefficient term 800 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0800 : Poly :=
[
  term ((-491656423605717141358255 : Rat) / 1259724289439525573076) [(7, 1), (10, 1), (11, 1), (14, 2), (16, 1)]
]

/-- Partial product 800 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0800 : Poly :=
[
  term ((-491656423605717141358255 : Rat) / 629862144719762786538) [(6, 1), (7, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((491656423605717141358255 : Rat) / 1259724289439525573076) [(7, 1), (10, 1), (11, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 800 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0800_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0800
        rs_R007_ueqv_R007NY_generator_16_0800_0899 =
      rs_R007_ueqv_R007NY_partial_16_0800 := by
  native_decide

/-- Coefficient term 801 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0801 : Poly :=
[
  term ((1457930566764680866908895 : Rat) / 629862144719762786538) [(7, 1), (10, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 801 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0801 : Poly :=
[
  term ((1457930566764680866908895 : Rat) / 314931072359881393269) [(6, 1), (7, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1457930566764680866908895 : Rat) / 629862144719762786538) [(7, 1), (10, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 801 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0801_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0801
        rs_R007_ueqv_R007NY_generator_16_0800_0899 =
      rs_R007_ueqv_R007NY_partial_16_0801 := by
  native_decide

/-- Coefficient term 802 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0802 : Poly :=
[
  term ((739797197680483925779928 : Rat) / 944793217079644179807) [(7, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 802 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0802 : Poly :=
[
  term ((1479594395360967851559856 : Rat) / 944793217079644179807) [(6, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((-739797197680483925779928 : Rat) / 944793217079644179807) [(7, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 802 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0802_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0802
        rs_R007_ueqv_R007NY_generator_16_0800_0899 =
      rs_R007_ueqv_R007NY_partial_16_0802 := by
  native_decide

/-- Coefficient term 803 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0803 : Poly :=
[
  term ((-43839092372106692140 : Rat) / 1336341183988181301) [(7, 1), (10, 1), (11, 1), (16, 2)]
]

/-- Partial product 803 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0803 : Poly :=
[
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(6, 1), (7, 1), (10, 1), (11, 1), (16, 2)],
  term ((43839092372106692140 : Rat) / 1336341183988181301) [(7, 1), (10, 1), (11, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 803 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0803_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0803
        rs_R007_ueqv_R007NY_generator_16_0800_0899 =
      rs_R007_ueqv_R007NY_partial_16_0803 := by
  native_decide

/-- Coefficient term 804 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0804 : Poly :=
[
  term ((-2042945277385306882520 : Rat) / 134970459582806311401) [(7, 1), (10, 1), (11, 2), (13, 1), (16, 1)]
]

/-- Partial product 804 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0804 : Poly :=
[
  term ((-4085890554770613765040 : Rat) / 134970459582806311401) [(6, 1), (7, 1), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((2042945277385306882520 : Rat) / 134970459582806311401) [(7, 1), (10, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 804 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0804_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0804
        rs_R007_ueqv_R007NY_generator_16_0800_0899 =
      rs_R007_ueqv_R007NY_partial_16_0804 := by
  native_decide

/-- Coefficient term 805 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0805 : Poly :=
[
  term ((-115539178558553908420525 : Rat) / 314931072359881393269) [(7, 1), (10, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 805 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0805 : Poly :=
[
  term ((-231078357117107816841050 : Rat) / 314931072359881393269) [(6, 1), (7, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((115539178558553908420525 : Rat) / 314931072359881393269) [(7, 1), (10, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 805 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0805_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0805
        rs_R007_ueqv_R007NY_generator_16_0800_0899 =
      rs_R007_ueqv_R007NY_partial_16_0805 := by
  native_decide

/-- Coefficient term 806 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0806 : Poly :=
[
  term ((35071273897685353712 : Rat) / 445447061329393767) [(7, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 2)]
]

/-- Partial product 806 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0806 : Poly :=
[
  term ((70142547795370707424 : Rat) / 445447061329393767) [(6, 1), (7, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 2)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(7, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 806 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0806_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0806
        rs_R007_ueqv_R007NY_generator_16_0800_0899 =
      rs_R007_ueqv_R007NY_partial_16_0806 := by
  native_decide

/-- Coefficient term 807 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0807 : Poly :=
[
  term ((-34895474864922553202030 : Rat) / 314931072359881393269) [(7, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 807 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0807 : Poly :=
[
  term ((-69790949729845106404060 : Rat) / 314931072359881393269) [(6, 1), (7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((34895474864922553202030 : Rat) / 314931072359881393269) [(7, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 807 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0807_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0807
        rs_R007_ueqv_R007NY_generator_16_0800_0899 =
      rs_R007_ueqv_R007NY_partial_16_0807 := by
  native_decide

/-- Coefficient term 808 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0808 : Poly :=
[
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(7, 1), (10, 1), (12, 1), (15, 1), (16, 2)]
]

/-- Partial product 808 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0808 : Poly :=
[
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(6, 1), (7, 1), (10, 1), (12, 1), (15, 1), (16, 2)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(7, 1), (10, 1), (12, 1), (15, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 808 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0808_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0808
        rs_R007_ueqv_R007NY_generator_16_0800_0899 =
      rs_R007_ueqv_R007NY_partial_16_0808 := by
  native_decide

/-- Coefficient term 809 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0809 : Poly :=
[
  term ((2840070620208577214720 : Rat) / 14996717731422923489) [(7, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 809 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0809 : Poly :=
[
  term ((5680141240417154429440 : Rat) / 14996717731422923489) [(6, 1), (7, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2840070620208577214720 : Rat) / 14996717731422923489) [(7, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 809 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0809_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0809
        rs_R007_ueqv_R007NY_generator_16_0800_0899 =
      rs_R007_ueqv_R007NY_partial_16_0809 := by
  native_decide

/-- Coefficient term 810 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0810 : Poly :=
[
  term ((-20381976477367116044546 : Rat) / 314931072359881393269) [(7, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 810 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0810 : Poly :=
[
  term ((-40763952954734232089092 : Rat) / 314931072359881393269) [(6, 1), (7, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((20381976477367116044546 : Rat) / 314931072359881393269) [(7, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 810 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0810_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0810
        rs_R007_ueqv_R007NY_generator_16_0800_0899 =
      rs_R007_ueqv_R007NY_partial_16_0810 := by
  native_decide

/-- Coefficient term 811 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0811 : Poly :=
[
  term ((2840070620208577214720 : Rat) / 44990153194268770467) [(7, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 811 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0811 : Poly :=
[
  term ((5680141240417154429440 : Rat) / 44990153194268770467) [(6, 1), (7, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-2840070620208577214720 : Rat) / 44990153194268770467) [(7, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 811 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0811_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0811
        rs_R007_ueqv_R007NY_generator_16_0800_0899 =
      rs_R007_ueqv_R007NY_partial_16_0811 := by
  native_decide

/-- Coefficient term 812 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0812 : Poly :=
[
  term ((289895242826578198186399 : Rat) / 629862144719762786538) [(7, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 812 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0812 : Poly :=
[
  term ((289895242826578198186399 : Rat) / 314931072359881393269) [(6, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-289895242826578198186399 : Rat) / 629862144719762786538) [(7, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 812 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0812_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0812
        rs_R007_ueqv_R007NY_generator_16_0800_0899 =
      rs_R007_ueqv_R007NY_partial_16_0812 := by
  native_decide

/-- Coefficient term 813 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0813 : Poly :=
[
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(7, 1), (10, 1), (14, 1), (15, 1), (16, 2)]
]

/-- Partial product 813 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0813 : Poly :=
[
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(6, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 2)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(7, 1), (10, 1), (14, 1), (15, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 813 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0813_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0813
        rs_R007_ueqv_R007NY_generator_16_0800_0899 =
      rs_R007_ueqv_R007NY_partial_16_0813 := by
  native_decide

/-- Coefficient term 814 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0814 : Poly :=
[
  term ((-1420035310104288607360 : Rat) / 44990153194268770467) [(7, 1), (10, 1), (14, 1), (15, 3), (16, 1)]
]

/-- Partial product 814 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0814 : Poly :=
[
  term ((-2840070620208577214720 : Rat) / 44990153194268770467) [(6, 1), (7, 1), (10, 1), (14, 1), (15, 3), (16, 1)],
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(7, 1), (10, 1), (14, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 814 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0814_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0814
        rs_R007_ueqv_R007NY_generator_16_0800_0899 =
      rs_R007_ueqv_R007NY_partial_16_0814 := by
  native_decide

/-- Coefficient term 815 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0815 : Poly :=
[
  term ((98331284721143428271651 : Rat) / 419908096479841857692) [(7, 1), (10, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 815 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0815 : Poly :=
[
  term ((98331284721143428271651 : Rat) / 209954048239920928846) [(6, 1), (7, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-98331284721143428271651 : Rat) / 419908096479841857692) [(7, 1), (10, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 815 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0815_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0815
        rs_R007_ueqv_R007NY_generator_16_0800_0899 =
      rs_R007_ueqv_R007NY_partial_16_0815 := by
  native_decide

/-- Coefficient term 816 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0816 : Poly :=
[
  term ((-146258811745353425632333 : Rat) / 314931072359881393269) [(7, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 816 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0816 : Poly :=
[
  term ((-292517623490706851264666 : Rat) / 314931072359881393269) [(6, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((146258811745353425632333 : Rat) / 314931072359881393269) [(7, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 816 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0816_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0816
        rs_R007_ueqv_R007NY_generator_16_0800_0899 =
      rs_R007_ueqv_R007NY_partial_16_0816 := by
  native_decide

/-- Coefficient term 817 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0817 : Poly :=
[
  term ((8767818474421338428 : Rat) / 445447061329393767) [(7, 1), (10, 1), (15, 1), (16, 2)]
]

/-- Partial product 817 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0817 : Poly :=
[
  term ((17535636948842676856 : Rat) / 445447061329393767) [(6, 1), (7, 1), (10, 1), (15, 1), (16, 2)],
  term ((-8767818474421338428 : Rat) / 445447061329393767) [(7, 1), (10, 1), (15, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 817 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0817_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0817
        rs_R007_ueqv_R007NY_generator_16_0800_0899 =
      rs_R007_ueqv_R007NY_partial_16_0817 := by
  native_decide

/-- Coefficient term 818 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0818 : Poly :=
[
  term ((-263856710498883235360853 : Rat) / 209954048239920928846) [(7, 1), (10, 1), (15, 3), (16, 1)]
]

/-- Partial product 818 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0818 : Poly :=
[
  term ((-263856710498883235360853 : Rat) / 104977024119960464423) [(6, 1), (7, 1), (10, 1), (15, 3), (16, 1)],
  term ((263856710498883235360853 : Rat) / 209954048239920928846) [(7, 1), (10, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 818 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0818_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0818
        rs_R007_ueqv_R007NY_generator_16_0800_0899 =
      rs_R007_ueqv_R007NY_partial_16_0818 := by
  native_decide

/-- Coefficient term 819 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0819 : Poly :=
[
  term ((-130535616982708862298245 : Rat) / 944793217079644179807) [(7, 1), (10, 2), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 819 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0819 : Poly :=
[
  term ((-261071233965417724596490 : Rat) / 944793217079644179807) [(6, 1), (7, 1), (10, 2), (11, 1), (12, 1), (16, 1)],
  term ((130535616982708862298245 : Rat) / 944793217079644179807) [(7, 1), (10, 2), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 819 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0819_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0819
        rs_R007_ueqv_R007NY_generator_16_0800_0899 =
      rs_R007_ueqv_R007NY_partial_16_0819 := by
  native_decide

/-- Coefficient term 820 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0820 : Poly :=
[
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(7, 1), (10, 2), (11, 1), (12, 1), (16, 2)]
]

/-- Partial product 820 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0820 : Poly :=
[
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(6, 1), (7, 1), (10, 2), (11, 1), (12, 1), (16, 2)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(7, 1), (10, 2), (11, 1), (12, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 820 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0820_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0820
        rs_R007_ueqv_R007NY_generator_16_0800_0899 =
      rs_R007_ueqv_R007NY_partial_16_0820 := by
  native_decide

/-- Coefficient term 821 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0821 : Poly :=
[
  term ((35500882752607215184000 : Rat) / 134970459582806311401) [(7, 1), (10, 2), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 821 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0821 : Poly :=
[
  term ((71001765505214430368000 : Rat) / 134970459582806311401) [(6, 1), (7, 1), (10, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-35500882752607215184000 : Rat) / 134970459582806311401) [(7, 1), (10, 2), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 821 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0821_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0821
        rs_R007_ueqv_R007NY_generator_16_0800_0899 =
      rs_R007_ueqv_R007NY_partial_16_0821 := by
  native_decide

/-- Coefficient term 822 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0822 : Poly :=
[
  term ((61579824695772740558575 : Rat) / 209954048239920928846) [(7, 1), (10, 2), (11, 1), (16, 1)]
]

/-- Partial product 822 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0822 : Poly :=
[
  term ((61579824695772740558575 : Rat) / 104977024119960464423) [(6, 1), (7, 1), (10, 2), (11, 1), (16, 1)],
  term ((-61579824695772740558575 : Rat) / 209954048239920928846) [(7, 1), (10, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 822 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0822_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0822
        rs_R007_ueqv_R007NY_generator_16_0800_0899 =
      rs_R007_ueqv_R007NY_partial_16_0822 := by
  native_decide

/-- Coefficient term 823 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0823 : Poly :=
[
  term ((-43839092372106692140 : Rat) / 1336341183988181301) [(7, 1), (10, 2), (11, 1), (16, 2)]
]

/-- Partial product 823 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0823 : Poly :=
[
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(6, 1), (7, 1), (10, 2), (11, 1), (16, 2)],
  term ((43839092372106692140 : Rat) / 1336341183988181301) [(7, 1), (10, 2), (11, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 823 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0823_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0823
        rs_R007_ueqv_R007NY_generator_16_0800_0899 =
      rs_R007_ueqv_R007NY_partial_16_0823 := by
  native_decide

/-- Coefficient term 824 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0824 : Poly :=
[
  term ((26107123396541772459649 : Rat) / 314931072359881393269) [(7, 1), (10, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 824 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0824 : Poly :=
[
  term ((52214246793083544919298 : Rat) / 314931072359881393269) [(6, 1), (7, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((-26107123396541772459649 : Rat) / 314931072359881393269) [(7, 1), (10, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 824 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0824_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0824
        rs_R007_ueqv_R007NY_generator_16_0800_0899 =
      rs_R007_ueqv_R007NY_partial_16_0824 := by
  native_decide

/-- Coefficient term 825 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0825 : Poly :=
[
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(7, 1), (10, 2), (12, 1), (15, 1), (16, 2)]
]

/-- Partial product 825 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0825 : Poly :=
[
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(6, 1), (7, 1), (10, 2), (12, 1), (15, 1), (16, 2)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(7, 1), (10, 2), (12, 1), (15, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 825 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0825_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0825
        rs_R007_ueqv_R007NY_generator_16_0800_0899 =
      rs_R007_ueqv_R007NY_partial_16_0825 := by
  native_decide

/-- Coefficient term 826 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0826 : Poly :=
[
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(7, 1), (10, 2), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 826 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0826 : Poly :=
[
  term ((-14200353101042886073600 : Rat) / 44990153194268770467) [(6, 1), (7, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(7, 1), (10, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 826 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0826_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0826
        rs_R007_ueqv_R007NY_generator_16_0800_0899 =
      rs_R007_ueqv_R007NY_partial_16_0826 := by
  native_decide

/-- Coefficient term 827 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0827 : Poly :=
[
  term ((-37787711010423328050529 : Rat) / 209954048239920928846) [(7, 1), (10, 2), (15, 1), (16, 1)]
]

/-- Partial product 827 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0827 : Poly :=
[
  term ((-37787711010423328050529 : Rat) / 104977024119960464423) [(6, 1), (7, 1), (10, 2), (15, 1), (16, 1)],
  term ((37787711010423328050529 : Rat) / 209954048239920928846) [(7, 1), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 827 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0827_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0827
        rs_R007_ueqv_R007NY_generator_16_0800_0899 =
      rs_R007_ueqv_R007NY_partial_16_0827 := by
  native_decide

/-- Coefficient term 828 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0828 : Poly :=
[
  term ((8767818474421338428 : Rat) / 445447061329393767) [(7, 1), (10, 2), (15, 1), (16, 2)]
]

/-- Partial product 828 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0828 : Poly :=
[
  term ((17535636948842676856 : Rat) / 445447061329393767) [(6, 1), (7, 1), (10, 2), (15, 1), (16, 2)],
  term ((-8767818474421338428 : Rat) / 445447061329393767) [(7, 1), (10, 2), (15, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 828 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0828_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0828
        rs_R007_ueqv_R007NY_generator_16_0800_0899 =
      rs_R007_ueqv_R007NY_partial_16_0828 := by
  native_decide

/-- Coefficient term 829 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0829 : Poly :=
[
  term ((-6549548039438125832290 : Rat) / 19281494226115187343) [(7, 1), (11, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 829 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0829 : Poly :=
[
  term ((-13099096078876251664580 : Rat) / 19281494226115187343) [(6, 1), (7, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((6549548039438125832290 : Rat) / 19281494226115187343) [(7, 1), (11, 1), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 829 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0829_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0829
        rs_R007_ueqv_R007NY_generator_16_0800_0899 =
      rs_R007_ueqv_R007NY_partial_16_0829 := by
  native_decide

/-- Coefficient term 830 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0830 : Poly :=
[
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(7, 1), (11, 1), (12, 1), (14, 1), (16, 2)]
]

/-- Partial product 830 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0830 : Poly :=
[
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(6, 1), (7, 1), (11, 1), (12, 1), (14, 1), (16, 2)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(7, 1), (11, 1), (12, 1), (14, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 830 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0830_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0830
        rs_R007_ueqv_R007NY_generator_16_0800_0899 =
      rs_R007_ueqv_R007NY_partial_16_0830 := by
  native_decide

/-- Coefficient term 831 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0831 : Poly :=
[
  term ((130535616982708862298245 : Rat) / 944793217079644179807) [(7, 1), (11, 1), (12, 1), (14, 2), (16, 1)]
]

/-- Partial product 831 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0831 : Poly :=
[
  term ((261071233965417724596490 : Rat) / 944793217079644179807) [(6, 1), (7, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-130535616982708862298245 : Rat) / 944793217079644179807) [(7, 1), (11, 1), (12, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 831 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0831_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0831
        rs_R007_ueqv_R007NY_generator_16_0800_0899 =
      rs_R007_ueqv_R007NY_partial_16_0831 := by
  native_decide

/-- Coefficient term 832 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0832 : Poly :=
[
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(7, 1), (11, 1), (12, 1), (14, 2), (16, 2)]
]

/-- Partial product 832 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0832 : Poly :=
[
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(6, 1), (7, 1), (11, 1), (12, 1), (14, 2), (16, 2)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(7, 1), (11, 1), (12, 1), (14, 2), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 832 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0832_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0832
        rs_R007_ueqv_R007NY_generator_16_0800_0899 =
      rs_R007_ueqv_R007NY_partial_16_0832 := by
  native_decide

/-- Coefficient term 833 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0833 : Poly :=
[
  term ((257154298999075108691105 : Rat) / 944793217079644179807) [(7, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 833 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0833 : Poly :=
[
  term ((514308597998150217382210 : Rat) / 944793217079644179807) [(6, 1), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((-257154298999075108691105 : Rat) / 944793217079644179807) [(7, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 833 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0833_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0833
        rs_R007_ueqv_R007NY_generator_16_0800_0899 =
      rs_R007_ueqv_R007NY_partial_16_0833 := by
  native_decide

/-- Coefficient term 834 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0834 : Poly :=
[
  term ((88314690862746535901086 : Rat) / 944793217079644179807) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 834 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0834 : Poly :=
[
  term ((176629381725493071802172 : Rat) / 944793217079644179807) [(6, 1), (7, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-88314690862746535901086 : Rat) / 944793217079644179807) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 834 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0834_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0834
        rs_R007_ueqv_R007NY_generator_16_0800_0899 =
      rs_R007_ueqv_R007NY_partial_16_0834 := by
  native_decide

/-- Coefficient term 835 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0835 : Poly :=
[
  term ((7100176550521443036800 : Rat) / 134970459582806311401) [(7, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 835 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0835 : Poly :=
[
  term ((14200353101042886073600 : Rat) / 134970459582806311401) [(6, 1), (7, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(7, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 835 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0835_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0835
        rs_R007_ueqv_R007NY_generator_16_0800_0899 =
      rs_R007_ueqv_R007NY_partial_16_0835 := by
  native_decide

/-- Coefficient term 836 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0836 : Poly :=
[
  term ((-1820231004788008292897 : Rat) / 89980306388537540934) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 836 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0836 : Poly :=
[
  term ((-1820231004788008292897 : Rat) / 44990153194268770467) [(6, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1820231004788008292897 : Rat) / 89980306388537540934) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 836 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0836_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0836
        rs_R007_ueqv_R007NY_generator_16_0800_0899 =
      rs_R007_ueqv_R007NY_partial_16_0836 := by
  native_decide

/-- Coefficient term 837 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0837 : Poly :=
[
  term ((7100176550521443036800 : Rat) / 134970459582806311401) [(7, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 837 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0837 : Poly :=
[
  term ((14200353101042886073600 : Rat) / 134970459582806311401) [(6, 1), (7, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(7, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 837 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0837_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0837
        rs_R007_ueqv_R007NY_generator_16_0800_0899 =
      rs_R007_ueqv_R007NY_partial_16_0837 := by
  native_decide

/-- Coefficient term 838 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0838 : Poly :=
[
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(7, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 838 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0838 : Poly :=
[
  term ((-14200353101042886073600 : Rat) / 134970459582806311401) [(6, 1), (7, 1), (11, 1), (13, 2), (16, 1)],
  term ((7100176550521443036800 : Rat) / 134970459582806311401) [(7, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 838 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0838_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0838
        rs_R007_ueqv_R007NY_generator_16_0800_0899 =
      rs_R007_ueqv_R007NY_partial_16_0838 := by
  native_decide

/-- Coefficient term 839 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0839 : Poly :=
[
  term ((356731356309041624996845 : Rat) / 222304286371680983484) [(7, 1), (11, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 839 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0839 : Poly :=
[
  term ((356731356309041624996845 : Rat) / 111152143185840491742) [(6, 1), (7, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-356731356309041624996845 : Rat) / 222304286371680983484) [(7, 1), (11, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 839 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0839_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0839
        rs_R007_ueqv_R007NY_generator_16_0800_0899 =
      rs_R007_ueqv_R007NY_partial_16_0839 := by
  native_decide

/-- Coefficient term 840 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0840 : Poly :=
[
  term ((-1277626910628790970994715 : Rat) / 7558345736637153438456) [(7, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 840 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0840 : Poly :=
[
  term ((-1277626910628790970994715 : Rat) / 3779172868318576719228) [(6, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((1277626910628790970994715 : Rat) / 7558345736637153438456) [(7, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 840 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0840_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0840
        rs_R007_ueqv_R007NY_generator_16_0800_0899 =
      rs_R007_ueqv_R007NY_partial_16_0840 := by
  native_decide

/-- Coefficient term 841 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0841 : Poly :=
[
  term ((43839092372106692140 : Rat) / 1336341183988181301) [(7, 1), (11, 1), (14, 1), (16, 2)]
]

/-- Partial product 841 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0841 : Poly :=
[
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(6, 1), (7, 1), (11, 1), (14, 1), (16, 2)],
  term ((-43839092372106692140 : Rat) / 1336341183988181301) [(7, 1), (11, 1), (14, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 841 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0841_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0841
        rs_R007_ueqv_R007NY_generator_16_0800_0899 =
      rs_R007_ueqv_R007NY_partial_16_0841 := by
  native_decide

/-- Coefficient term 842 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0842 : Poly :=
[
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(7, 1), (11, 1), (14, 2), (15, 2), (16, 1)]
]

/-- Partial product 842 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0842 : Poly :=
[
  term ((-14200353101042886073600 : Rat) / 134970459582806311401) [(6, 1), (7, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((7100176550521443036800 : Rat) / 134970459582806311401) [(7, 1), (11, 1), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 842 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0842_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0842
        rs_R007_ueqv_R007NY_generator_16_0800_0899 =
      rs_R007_ueqv_R007NY_partial_16_0842 := by
  native_decide

/-- Coefficient term 843 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0843 : Poly :=
[
  term ((-4151541073340545828779 : Rat) / 6175119065880027319) [(7, 1), (11, 1), (14, 2), (16, 1)]
]

/-- Partial product 843 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0843 : Poly :=
[
  term ((-8303082146681091657558 : Rat) / 6175119065880027319) [(6, 1), (7, 1), (11, 1), (14, 2), (16, 1)],
  term ((4151541073340545828779 : Rat) / 6175119065880027319) [(7, 1), (11, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 843 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0843_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0843
        rs_R007_ueqv_R007NY_generator_16_0800_0899 =
      rs_R007_ueqv_R007NY_partial_16_0843 := by
  native_decide

/-- Coefficient term 844 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0844 : Poly :=
[
  term ((-43839092372106692140 : Rat) / 1336341183988181301) [(7, 1), (11, 1), (14, 2), (16, 2)]
]

/-- Partial product 844 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0844 : Poly :=
[
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(6, 1), (7, 1), (11, 1), (14, 2), (16, 2)],
  term ((43839092372106692140 : Rat) / 1336341183988181301) [(7, 1), (11, 1), (14, 2), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 844 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0844_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0844
        rs_R007_ueqv_R007NY_generator_16_0800_0899 =
      rs_R007_ueqv_R007NY_partial_16_0844 := by
  native_decide

/-- Coefficient term 845 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0845 : Poly :=
[
  term ((491656423605717141358255 : Rat) / 1889586434159288359614) [(7, 1), (11, 1), (14, 3), (16, 1)]
]

/-- Partial product 845 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0845 : Poly :=
[
  term ((491656423605717141358255 : Rat) / 944793217079644179807) [(6, 1), (7, 1), (11, 1), (14, 3), (16, 1)],
  term ((-491656423605717141358255 : Rat) / 1889586434159288359614) [(7, 1), (11, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 845 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0845_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0845
        rs_R007_ueqv_R007NY_generator_16_0800_0899 =
      rs_R007_ueqv_R007NY_partial_16_0845 := by
  native_decide

/-- Coefficient term 846 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0846 : Poly :=
[
  term ((-28689052069811804767525 : Rat) / 222304286371680983484) [(7, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 846 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0846 : Poly :=
[
  term ((-28689052069811804767525 : Rat) / 111152143185840491742) [(6, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((28689052069811804767525 : Rat) / 222304286371680983484) [(7, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 846 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0846_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0846
        rs_R007_ueqv_R007NY_generator_16_0800_0899 =
      rs_R007_ueqv_R007NY_partial_16_0846 := by
  native_decide

/-- Coefficient term 847 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0847 : Poly :=
[
  term ((6564128440451154837029767 : Rat) / 3779172868318576719228) [(7, 1), (11, 1), (16, 1)]
]

/-- Partial product 847 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0847 : Poly :=
[
  term ((6564128440451154837029767 : Rat) / 1889586434159288359614) [(6, 1), (7, 1), (11, 1), (16, 1)],
  term ((-6564128440451154837029767 : Rat) / 3779172868318576719228) [(7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 847 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0847_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0847
        rs_R007_ueqv_R007NY_generator_16_0800_0899 =
      rs_R007_ueqv_R007NY_partial_16_0847 := by
  native_decide

/-- Coefficient term 848 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0848 : Poly :=
[
  term ((2042945277385306882520 : Rat) / 134970459582806311401) [(7, 1), (11, 2), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 848 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0848 : Poly :=
[
  term ((4085890554770613765040 : Rat) / 134970459582806311401) [(6, 1), (7, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-2042945277385306882520 : Rat) / 134970459582806311401) [(7, 1), (11, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 848 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0848_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0848
        rs_R007_ueqv_R007NY_generator_16_0800_0899 =
      rs_R007_ueqv_R007NY_partial_16_0848 := by
  native_decide

/-- Coefficient term 849 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0849 : Poly :=
[
  term ((-2042945277385306882520 : Rat) / 134970459582806311401) [(7, 1), (11, 2), (13, 1), (16, 1)]
]

/-- Partial product 849 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0849 : Poly :=
[
  term ((-4085890554770613765040 : Rat) / 134970459582806311401) [(6, 1), (7, 1), (11, 2), (13, 1), (16, 1)],
  term ((2042945277385306882520 : Rat) / 134970459582806311401) [(7, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 849 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0849_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0849
        rs_R007_ueqv_R007NY_generator_16_0800_0899 =
      rs_R007_ueqv_R007NY_partial_16_0849 := by
  native_decide

/-- Coefficient term 850 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0850 : Poly :=
[
  term ((-837656028974230594608425 : Rat) / 419908096479841857692) [(7, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 850 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0850 : Poly :=
[
  term ((-837656028974230594608425 : Rat) / 209954048239920928846) [(6, 1), (7, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((837656028974230594608425 : Rat) / 419908096479841857692) [(7, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 850 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0850_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0850
        rs_R007_ueqv_R007NY_generator_16_0800_0899 =
      rs_R007_ueqv_R007NY_partial_16_0850 := by
  native_decide

/-- Coefficient term 851 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0851 : Poly :=
[
  term ((-115539178558553908420525 : Rat) / 314931072359881393269) [(7, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 851 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0851 : Poly :=
[
  term ((-231078357117107816841050 : Rat) / 314931072359881393269) [(6, 1), (7, 1), (11, 2), (15, 1), (16, 1)],
  term ((115539178558553908420525 : Rat) / 314931072359881393269) [(7, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 851 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0851_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0851
        rs_R007_ueqv_R007NY_generator_16_0800_0899 =
      rs_R007_ueqv_R007NY_partial_16_0851 := by
  native_decide

/-- Coefficient term 852 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0852 : Poly :=
[
  term ((1309909607887625166458 : Rat) / 6427164742038395781) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 852 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0852 : Poly :=
[
  term ((2619819215775250332916 : Rat) / 6427164742038395781) [(6, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1309909607887625166458 : Rat) / 6427164742038395781) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 852 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0852_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0852
        rs_R007_ueqv_R007NY_generator_16_0800_0899 =
      rs_R007_ueqv_R007NY_partial_16_0852 := by
  native_decide

/-- Coefficient term 853 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0853 : Poly :=
[
  term ((17535636948842676856 : Rat) / 445447061329393767) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 2)]
]

/-- Partial product 853 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0853 : Poly :=
[
  term ((35071273897685353712 : Rat) / 445447061329393767) [(6, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 2)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 853 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0853_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0853
        rs_R007_ueqv_R007NY_generator_16_0800_0899 =
      rs_R007_ueqv_R007NY_partial_16_0853 := by
  native_decide

/-- Coefficient term 854 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0854 : Poly :=
[
  term ((-26107123396541772459649 : Rat) / 314931072359881393269) [(7, 1), (12, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 854 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0854 : Poly :=
[
  term ((-52214246793083544919298 : Rat) / 314931072359881393269) [(6, 1), (7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((26107123396541772459649 : Rat) / 314931072359881393269) [(7, 1), (12, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 854 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0854_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0854
        rs_R007_ueqv_R007NY_generator_16_0800_0899 =
      rs_R007_ueqv_R007NY_partial_16_0854 := by
  native_decide

/-- Coefficient term 855 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0855 : Poly :=
[
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(7, 1), (12, 1), (14, 2), (15, 1), (16, 2)]
]

/-- Partial product 855 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0855 : Poly :=
[
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(6, 1), (7, 1), (12, 1), (14, 2), (15, 1), (16, 2)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(7, 1), (12, 1), (14, 2), (15, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 855 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0855_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0855
        rs_R007_ueqv_R007NY_generator_16_0800_0899 =
      rs_R007_ueqv_R007NY_partial_16_0855 := by
  native_decide

/-- Coefficient term 856 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0856 : Poly :=
[
  term ((-51430859799815021738221 : Rat) / 314931072359881393269) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 856 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0856 : Poly :=
[
  term ((-102861719599630043476442 : Rat) / 314931072359881393269) [(6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((51430859799815021738221 : Rat) / 314931072359881393269) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 856 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0856_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0856
        rs_R007_ueqv_R007NY_generator_16_0800_0899 =
      rs_R007_ueqv_R007NY_partial_16_0856 := by
  native_decide

/-- Coefficient term 857 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0857 : Poly :=
[
  term ((-523757086636566620582 : Rat) / 8511650604321118737) [(7, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 857 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0857 : Poly :=
[
  term ((-1047514173273133241164 : Rat) / 8511650604321118737) [(6, 1), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((523757086636566620582 : Rat) / 8511650604321118737) [(7, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 857 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0857_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0857
        rs_R007_ueqv_R007NY_generator_16_0800_0899 =
      rs_R007_ueqv_R007NY_partial_16_0857 := by
  native_decide

/-- Coefficient term 858 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0858 : Poly :=
[
  term ((-1420035310104288607360 : Rat) / 44990153194268770467) [(7, 1), (13, 1), (14, 2), (15, 2), (16, 1)]
]

/-- Partial product 858 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0858 : Poly :=
[
  term ((-2840070620208577214720 : Rat) / 44990153194268770467) [(6, 1), (7, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(7, 1), (13, 1), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 858 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0858_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0858
        rs_R007_ueqv_R007NY_generator_16_0800_0899 =
      rs_R007_ueqv_R007NY_partial_16_0858 := by
  native_decide

/-- Coefficient term 859 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0859 : Poly :=
[
  term ((527481823148426209181 : Rat) / 29993435462845846978) [(7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 859 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0859 : Poly :=
[
  term ((527481823148426209181 : Rat) / 14996717731422923489) [(6, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-527481823148426209181 : Rat) / 29993435462845846978) [(7, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 859 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0859_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0859
        rs_R007_ueqv_R007NY_generator_16_0800_0899 =
      rs_R007_ueqv_R007NY_partial_16_0859 := by
  native_decide

/-- Coefficient term 860 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0860 : Poly :=
[
  term ((-1420035310104288607360 : Rat) / 44990153194268770467) [(7, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 860 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0860 : Poly :=
[
  term ((-2840070620208577214720 : Rat) / 44990153194268770467) [(6, 1), (7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(7, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 860 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0860_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0860
        rs_R007_ueqv_R007NY_generator_16_0800_0899 =
      rs_R007_ueqv_R007NY_partial_16_0860 := by
  native_decide

/-- Coefficient term 861 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0861 : Poly :=
[
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 861 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0861 : Poly :=
[
  term ((2840070620208577214720 : Rat) / 44990153194268770467) [(6, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 44990153194268770467) [(7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 861 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0861_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0861
        rs_R007_ueqv_R007NY_generator_16_0800_0899 =
      rs_R007_ueqv_R007NY_partial_16_0861 := by
  native_decide

/-- Coefficient term 862 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0862 : Poly :=
[
  term ((225291999179209580445119 : Rat) / 2519448578879051146152) [(7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 862 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0862 : Poly :=
[
  term ((225291999179209580445119 : Rat) / 1259724289439525573076) [(6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-225291999179209580445119 : Rat) / 2519448578879051146152) [(7, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 862 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0862_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0862
        rs_R007_ueqv_R007NY_generator_16_0800_0899 =
      rs_R007_ueqv_R007NY_partial_16_0862 := by
  native_decide

/-- Coefficient term 863 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0863 : Poly :=
[
  term ((-8767818474421338428 : Rat) / 445447061329393767) [(7, 1), (14, 1), (15, 1), (16, 2)]
]

/-- Partial product 863 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0863 : Poly :=
[
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(6, 1), (7, 1), (14, 1), (15, 1), (16, 2)],
  term ((8767818474421338428 : Rat) / 445447061329393767) [(7, 1), (14, 1), (15, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 863 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0863_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0863
        rs_R007_ueqv_R007NY_generator_16_0800_0899 =
      rs_R007_ueqv_R007NY_partial_16_0863 := by
  native_decide

/-- Coefficient term 864 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0864 : Poly :=
[
  term ((-154109050079286241406087 : Rat) / 629862144719762786538) [(7, 1), (14, 1), (15, 3), (16, 1)]
]

/-- Partial product 864 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0864 : Poly :=
[
  term ((-154109050079286241406087 : Rat) / 314931072359881393269) [(6, 1), (7, 1), (14, 1), (15, 3), (16, 1)],
  term ((154109050079286241406087 : Rat) / 629862144719762786538) [(7, 1), (14, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 864 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0864_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0864
        rs_R007_ueqv_R007NY_generator_16_0800_0899 =
      rs_R007_ueqv_R007NY_partial_16_0864 := by
  native_decide

/-- Coefficient term 865 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0865 : Poly :=
[
  term ((2518095167894199617471 : Rat) / 6175119065880027319) [(7, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 865 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0865 : Poly :=
[
  term ((5036190335788399234942 : Rat) / 6175119065880027319) [(6, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2518095167894199617471 : Rat) / 6175119065880027319) [(7, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 865 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0865_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0865
        rs_R007_ueqv_R007NY_generator_16_0800_0899 =
      rs_R007_ueqv_R007NY_partial_16_0865 := by
  native_decide

/-- Coefficient term 866 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0866 : Poly :=
[
  term ((8767818474421338428 : Rat) / 445447061329393767) [(7, 1), (14, 2), (15, 1), (16, 2)]
]

/-- Partial product 866 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0866 : Poly :=
[
  term ((17535636948842676856 : Rat) / 445447061329393767) [(6, 1), (7, 1), (14, 2), (15, 1), (16, 2)],
  term ((-8767818474421338428 : Rat) / 445447061329393767) [(7, 1), (14, 2), (15, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 866 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0866_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0866
        rs_R007_ueqv_R007NY_generator_16_0800_0899 =
      rs_R007_ueqv_R007NY_partial_16_0866 := by
  native_decide

/-- Coefficient term 867 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0867 : Poly :=
[
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(7, 1), (14, 2), (15, 3), (16, 1)]
]

/-- Partial product 867 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0867 : Poly :=
[
  term ((2840070620208577214720 : Rat) / 44990153194268770467) [(6, 1), (7, 1), (14, 2), (15, 3), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 44990153194268770467) [(7, 1), (14, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 867 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0867_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0867
        rs_R007_ueqv_R007NY_generator_16_0800_0899 =
      rs_R007_ueqv_R007NY_partial_16_0867 := by
  native_decide

/-- Coefficient term 868 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0868 : Poly :=
[
  term ((-98331284721143428271651 : Rat) / 629862144719762786538) [(7, 1), (14, 3), (15, 1), (16, 1)]
]

/-- Partial product 868 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0868 : Poly :=
[
  term ((-98331284721143428271651 : Rat) / 314931072359881393269) [(6, 1), (7, 1), (14, 3), (15, 1), (16, 1)],
  term ((98331284721143428271651 : Rat) / 629862144719762786538) [(7, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 868 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0868_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0868
        rs_R007_ueqv_R007NY_generator_16_0800_0899 =
      rs_R007_ueqv_R007NY_partial_16_0868 := by
  native_decide

/-- Coefficient term 869 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0869 : Poly :=
[
  term ((-1300984279769499427019039 : Rat) / 1259724289439525573076) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 869 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0869 : Poly :=
[
  term ((-1300984279769499427019039 : Rat) / 629862144719762786538) [(6, 1), (7, 1), (15, 1), (16, 1)],
  term ((1300984279769499427019039 : Rat) / 1259724289439525573076) [(7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 869 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0869_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0869
        rs_R007_ueqv_R007NY_generator_16_0800_0899 =
      rs_R007_ueqv_R007NY_partial_16_0869 := by
  native_decide

/-- Coefficient term 870 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0870 : Poly :=
[
  term ((263919194161677764335141 : Rat) / 1259724289439525573076) [(7, 1), (15, 3), (16, 1)]
]

/-- Partial product 870 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0870 : Poly :=
[
  term ((263919194161677764335141 : Rat) / 629862144719762786538) [(6, 1), (7, 1), (15, 3), (16, 1)],
  term ((-263919194161677764335141 : Rat) / 1259724289439525573076) [(7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 870 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0870_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0870
        rs_R007_ueqv_R007NY_generator_16_0800_0899 =
      rs_R007_ueqv_R007NY_partial_16_0870 := by
  native_decide

/-- Coefficient term 871 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0871 : Poly :=
[
  term (2 : Rat) [(7, 2), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 871 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0871 : Poly :=
[
  term (4 : Rat) [(6, 1), (7, 2), (10, 1), (14, 1), (16, 1)],
  term (-2 : Rat) [(7, 2), (10, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 871 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0871_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0871
        rs_R007_ueqv_R007NY_generator_16_0800_0899 =
      rs_R007_ueqv_R007NY_partial_16_0871 := by
  native_decide

/-- Coefficient term 872 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0872 : Poly :=
[
  term ((-2 : Rat) / 3) [(7, 2), (10, 1), (16, 1)]
]

/-- Partial product 872 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0872 : Poly :=
[
  term ((-4 : Rat) / 3) [(6, 1), (7, 2), (10, 1), (16, 1)],
  term ((2 : Rat) / 3) [(7, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 872 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0872_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0872
        rs_R007_ueqv_R007NY_generator_16_0800_0899 =
      rs_R007_ueqv_R007NY_partial_16_0872 := by
  native_decide

/-- Coefficient term 873 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0873 : Poly :=
[
  term ((1047316035339671504241670 : Rat) / 314931072359881393269) [(7, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 873 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0873 : Poly :=
[
  term ((2094632070679343008483340 : Rat) / 314931072359881393269) [(6, 1), (7, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1047316035339671504241670 : Rat) / 314931072359881393269) [(7, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 873 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0873_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0873
        rs_R007_ueqv_R007NY_generator_16_0800_0899 =
      rs_R007_ueqv_R007NY_partial_16_0873 := by
  native_decide

/-- Coefficient term 874 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0874 : Poly :=
[
  term ((-209463207067934300848334 : Rat) / 104977024119960464423) [(7, 2), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 874 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0874 : Poly :=
[
  term ((-418926414135868601696668 : Rat) / 104977024119960464423) [(6, 1), (7, 2), (14, 1), (15, 2), (16, 1)],
  term ((209463207067934300848334 : Rat) / 104977024119960464423) [(7, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 874 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0874_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0874
        rs_R007_ueqv_R007NY_generator_16_0800_0899 =
      rs_R007_ueqv_R007NY_partial_16_0874 := by
  native_decide

/-- Coefficient term 875 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0875 : Poly :=
[
  term ((8 : Rat) / 3) [(7, 2), (14, 1), (16, 1)]
]

/-- Partial product 875 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0875 : Poly :=
[
  term ((16 : Rat) / 3) [(6, 1), (7, 2), (14, 1), (16, 1)],
  term ((-8 : Rat) / 3) [(7, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 875 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0875_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0875
        rs_R007_ueqv_R007NY_generator_16_0800_0899 =
      rs_R007_ueqv_R007NY_partial_16_0875 := by
  native_decide

/-- Coefficient term 876 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0876 : Poly :=
[
  term ((-4 : Rat) / 3) [(7, 2), (14, 2), (16, 1)]
]

/-- Partial product 876 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0876 : Poly :=
[
  term ((-8 : Rat) / 3) [(6, 1), (7, 2), (14, 2), (16, 1)],
  term ((4 : Rat) / 3) [(7, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 876 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0876_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0876
        rs_R007_ueqv_R007NY_generator_16_0800_0899 =
      rs_R007_ueqv_R007NY_partial_16_0876 := by
  native_decide

/-- Coefficient term 877 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0877 : Poly :=
[
  term ((-4 : Rat) / 3) [(7, 2), (16, 1)]
]

/-- Partial product 877 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0877 : Poly :=
[
  term ((-8 : Rat) / 3) [(6, 1), (7, 2), (16, 1)],
  term ((4 : Rat) / 3) [(7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 877 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0877_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0877
        rs_R007_ueqv_R007NY_generator_16_0800_0899 =
      rs_R007_ueqv_R007NY_partial_16_0877 := by
  native_decide

/-- Coefficient term 878 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0878 : Poly :=
[
  term ((536641431322907652251185 : Rat) / 944793217079644179807) [(8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 878 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0878 : Poly :=
[
  term ((1073282862645815304502370 : Rat) / 944793217079644179807) [(6, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-536641431322907652251185 : Rat) / 944793217079644179807) [(8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 878 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0878_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0878
        rs_R007_ueqv_R007NY_generator_16_0800_0899 =
      rs_R007_ueqv_R007NY_partial_16_0878 := by
  native_decide

/-- Coefficient term 879 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0879 : Poly :=
[
  term ((-70142547795370707424 : Rat) / 1336341183988181301) [(8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 2)]
]

/-- Partial product 879 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0879 : Poly :=
[
  term ((-140285095590741414848 : Rat) / 1336341183988181301) [(6, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 2)],
  term ((70142547795370707424 : Rat) / 1336341183988181301) [(8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 879 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0879_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0879
        rs_R007_ueqv_R007NY_generator_16_0800_0899 =
      rs_R007_ueqv_R007NY_partial_16_0879 := by
  native_decide

/-- Coefficient term 880 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0880 : Poly :=
[
  term ((262955591432127197107685 : Rat) / 3779172868318576719228) [(8, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 880 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0880 : Poly :=
[
  term ((262955591432127197107685 : Rat) / 1889586434159288359614) [(6, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-262955591432127197107685 : Rat) / 3779172868318576719228) [(8, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 880 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0880_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0880
        rs_R007_ueqv_R007NY_generator_16_0800_0899 =
      rs_R007_ueqv_R007NY_partial_16_0880 := by
  native_decide

/-- Coefficient term 881 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0881 : Poly :=
[
  term ((35071273897685353712 : Rat) / 1336341183988181301) [(8, 1), (10, 1), (11, 1), (15, 1), (16, 2)]
]

/-- Partial product 881 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0881 : Poly :=
[
  term ((70142547795370707424 : Rat) / 1336341183988181301) [(6, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 2)],
  term ((-35071273897685353712 : Rat) / 1336341183988181301) [(8, 1), (10, 1), (11, 1), (15, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 881 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0881_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0881
        rs_R007_ueqv_R007NY_generator_16_0800_0899 =
      rs_R007_ueqv_R007NY_partial_16_0881 := by
  native_decide

/-- Coefficient term 882 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0882 : Poly :=
[
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(8, 1), (10, 1), (11, 2), (14, 1), (16, 2)]
]

/-- Partial product 882 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0882 : Poly :=
[
  term ((-350712738976853537120 : Rat) / 1336341183988181301) [(6, 1), (8, 1), (10, 1), (11, 2), (14, 1), (16, 2)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(8, 1), (10, 1), (11, 2), (14, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 882 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0882_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0882
        rs_R007_ueqv_R007NY_generator_16_0800_0899 =
      rs_R007_ueqv_R007NY_partial_16_0882 := by
  native_decide

/-- Coefficient term 883 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0883 : Poly :=
[
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(8, 1), (10, 1), (11, 2), (16, 2)]
]

/-- Partial product 883 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0883 : Poly :=
[
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(6, 1), (8, 1), (10, 1), (11, 2), (16, 2)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(8, 1), (10, 1), (11, 2), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 883 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0883_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0883
        rs_R007_ueqv_R007NY_generator_16_0800_0899 =
      rs_R007_ueqv_R007NY_partial_16_0883 := by
  native_decide

/-- Coefficient term 884 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0884 : Poly :=
[
  term ((-107328286264581530450237 : Rat) / 314931072359881393269) [(8, 1), (10, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 884 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0884 : Poly :=
[
  term ((-214656572529163060900474 : Rat) / 314931072359881393269) [(6, 1), (8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((107328286264581530450237 : Rat) / 314931072359881393269) [(8, 1), (10, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 884 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0884_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0884
        rs_R007_ueqv_R007NY_generator_16_0800_0899 =
      rs_R007_ueqv_R007NY_partial_16_0884 := by
  native_decide

/-- Coefficient term 885 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0885 : Poly :=
[
  term ((35071273897685353712 : Rat) / 445447061329393767) [(8, 1), (10, 1), (14, 1), (15, 2), (16, 2)]
]

/-- Partial product 885 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0885 : Poly :=
[
  term ((70142547795370707424 : Rat) / 445447061329393767) [(6, 1), (8, 1), (10, 1), (14, 1), (15, 2), (16, 2)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(8, 1), (10, 1), (14, 1), (15, 2), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 885 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0885_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0885
        rs_R007_ueqv_R007NY_generator_16_0800_0899 =
      rs_R007_ueqv_R007NY_partial_16_0885 := by
  native_decide

/-- Coefficient term 886 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0886 : Poly :=
[
  term ((-52591118286425439421537 : Rat) / 1259724289439525573076) [(8, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 886 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0886 : Poly :=
[
  term ((-52591118286425439421537 : Rat) / 629862144719762786538) [(6, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((52591118286425439421537 : Rat) / 1259724289439525573076) [(8, 1), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 886 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0886_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0886
        rs_R007_ueqv_R007NY_generator_16_0800_0899 =
      rs_R007_ueqv_R007NY_partial_16_0886 := by
  native_decide

/-- Coefficient term 887 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0887 : Poly :=
[
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(8, 1), (10, 1), (15, 2), (16, 2)]
]

/-- Partial product 887 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0887 : Poly :=
[
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(6, 1), (8, 1), (10, 1), (15, 2), (16, 2)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(8, 1), (10, 1), (15, 2), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 887 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0887_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0887
        rs_R007_ueqv_R007NY_generator_16_0800_0899 =
      rs_R007_ueqv_R007NY_partial_16_0887 := by
  native_decide

/-- Coefficient term 888 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0888 : Poly :=
[
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(8, 1), (10, 2), (11, 1), (15, 1), (16, 2)]
]

/-- Partial product 888 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0888 : Poly :=
[
  term ((350712738976853537120 : Rat) / 1336341183988181301) [(6, 1), (8, 1), (10, 2), (11, 1), (15, 1), (16, 2)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(8, 1), (10, 2), (11, 1), (15, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 888 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0888_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0888
        rs_R007_ueqv_R007NY_generator_16_0800_0899 =
      rs_R007_ueqv_R007NY_partial_16_0888 := by
  native_decide

/-- Coefficient term 889 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0889 : Poly :=
[
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(8, 1), (10, 2), (15, 2), (16, 2)]
]

/-- Partial product 889 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0889 : Poly :=
[
  term ((-70142547795370707424 : Rat) / 445447061329393767) [(6, 1), (8, 1), (10, 2), (15, 2), (16, 2)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(8, 1), (10, 2), (15, 2), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 889 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0889_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0889
        rs_R007_ueqv_R007NY_generator_16_0800_0899 =
      rs_R007_ueqv_R007NY_partial_16_0889 := by
  native_decide

/-- Coefficient term 890 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0890 : Poly :=
[
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(8, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 890 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0890 : Poly :=
[
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(6, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(8, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 890 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0890_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0890
        rs_R007_ueqv_R007NY_generator_16_0800_0899 =
      rs_R007_ueqv_R007NY_partial_16_0890 := by
  native_decide

/-- Coefficient term 891 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0891 : Poly :=
[
  term ((1491065154585459569603 : Rat) / 19281494226115187343) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 891 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0891 : Poly :=
[
  term ((2982130309170919139206 : Rat) / 19281494226115187343) [(6, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1491065154585459569603 : Rat) / 19281494226115187343) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 891 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0891_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0891
        rs_R007_ueqv_R007NY_generator_16_0800_0899 =
      rs_R007_ueqv_R007NY_partial_16_0891 := by
  native_decide

/-- Coefficient term 892 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0892 : Poly :=
[
  term ((-35071273897685353712 : Rat) / 1336341183988181301) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 2)]
]

/-- Partial product 892 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0892 : Poly :=
[
  term ((-70142547795370707424 : Rat) / 1336341183988181301) [(6, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 2)],
  term ((35071273897685353712 : Rat) / 1336341183988181301) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 892 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0892_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0892
        rs_R007_ueqv_R007NY_generator_16_0800_0899 =
      rs_R007_ueqv_R007NY_partial_16_0892 := by
  native_decide

/-- Coefficient term 893 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0893 : Poly :=
[
  term ((107328286264581530450237 : Rat) / 314931072359881393269) [(8, 1), (11, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 893 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0893 : Poly :=
[
  term ((214656572529163060900474 : Rat) / 314931072359881393269) [(6, 1), (8, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-107328286264581530450237 : Rat) / 314931072359881393269) [(8, 1), (11, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 893 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0893_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0893
        rs_R007_ueqv_R007NY_generator_16_0800_0899 =
      rs_R007_ueqv_R007NY_partial_16_0893 := by
  native_decide

/-- Coefficient term 894 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0894 : Poly :=
[
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(8, 1), (11, 1), (14, 2), (15, 1), (16, 2)]
]

/-- Partial product 894 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0894 : Poly :=
[
  term ((-70142547795370707424 : Rat) / 445447061329393767) [(6, 1), (8, 1), (11, 1), (14, 2), (15, 1), (16, 2)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(8, 1), (11, 1), (14, 2), (15, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 894 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0894_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0894
        rs_R007_ueqv_R007NY_generator_16_0800_0899 =
      rs_R007_ueqv_R007NY_partial_16_0894 := by
  native_decide

/-- Coefficient term 895 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0895 : Poly :=
[
  term ((-88135596048994405185835 : Rat) / 944793217079644179807) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 895 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0895 : Poly :=
[
  term ((-176271192097988810371670 : Rat) / 944793217079644179807) [(6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((88135596048994405185835 : Rat) / 944793217079644179807) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 895 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0895_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0895
        rs_R007_ueqv_R007NY_generator_16_0800_0899 =
      rs_R007_ueqv_R007NY_partial_16_0895 := by
  native_decide

/-- Coefficient term 896 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0896 : Poly :=
[
  term ((-70142547795370707424 : Rat) / 1336341183988181301) [(8, 1), (11, 1), (15, 1), (16, 2)]
]

/-- Partial product 896 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0896 : Poly :=
[
  term ((-140285095590741414848 : Rat) / 1336341183988181301) [(6, 1), (8, 1), (11, 1), (15, 1), (16, 2)],
  term ((70142547795370707424 : Rat) / 1336341183988181301) [(8, 1), (11, 1), (15, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 896 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0896_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0896
        rs_R007_ueqv_R007NY_generator_16_0800_0899 =
      rs_R007_ueqv_R007NY_partial_16_0896 := by
  native_decide

/-- Coefficient term 897 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0897 : Poly :=
[
  term ((650861743622554357383485 : Rat) / 1889586434159288359614) [(8, 1), (11, 2), (14, 1), (16, 1)]
]

/-- Partial product 897 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0897 : Poly :=
[
  term ((650861743622554357383485 : Rat) / 944793217079644179807) [(6, 1), (8, 1), (11, 2), (14, 1), (16, 1)],
  term ((-650861743622554357383485 : Rat) / 1889586434159288359614) [(8, 1), (11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 897 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0897_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0897
        rs_R007_ueqv_R007NY_generator_16_0800_0899 =
      rs_R007_ueqv_R007NY_partial_16_0897 := by
  native_decide

/-- Coefficient term 898 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0898 : Poly :=
[
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(8, 1), (11, 2), (14, 1), (16, 2)]
]

/-- Partial product 898 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0898 : Poly :=
[
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(6, 1), (8, 1), (11, 2), (14, 1), (16, 2)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(8, 1), (11, 2), (14, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 898 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0898_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0898
        rs_R007_ueqv_R007NY_generator_16_0800_0899 =
      rs_R007_ueqv_R007NY_partial_16_0898 := by
  native_decide

/-- Coefficient term 899 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0899 : Poly :=
[
  term ((-536641431322907652251185 : Rat) / 944793217079644179807) [(8, 1), (11, 2), (14, 2), (16, 1)]
]

/-- Partial product 899 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0899 : Poly :=
[
  term ((-1073282862645815304502370 : Rat) / 944793217079644179807) [(6, 1), (8, 1), (11, 2), (14, 2), (16, 1)],
  term ((536641431322907652251185 : Rat) / 944793217079644179807) [(8, 1), (11, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 899 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0899_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0899
        rs_R007_ueqv_R007NY_generator_16_0800_0899 =
      rs_R007_ueqv_R007NY_partial_16_0899 := by
  native_decide

/-- Partial products in this block. -/
def rs_R007_ueqv_R007NY_partials_16_0800_0899 : List Poly :=
[
  rs_R007_ueqv_R007NY_partial_16_0800,
  rs_R007_ueqv_R007NY_partial_16_0801,
  rs_R007_ueqv_R007NY_partial_16_0802,
  rs_R007_ueqv_R007NY_partial_16_0803,
  rs_R007_ueqv_R007NY_partial_16_0804,
  rs_R007_ueqv_R007NY_partial_16_0805,
  rs_R007_ueqv_R007NY_partial_16_0806,
  rs_R007_ueqv_R007NY_partial_16_0807,
  rs_R007_ueqv_R007NY_partial_16_0808,
  rs_R007_ueqv_R007NY_partial_16_0809,
  rs_R007_ueqv_R007NY_partial_16_0810,
  rs_R007_ueqv_R007NY_partial_16_0811,
  rs_R007_ueqv_R007NY_partial_16_0812,
  rs_R007_ueqv_R007NY_partial_16_0813,
  rs_R007_ueqv_R007NY_partial_16_0814,
  rs_R007_ueqv_R007NY_partial_16_0815,
  rs_R007_ueqv_R007NY_partial_16_0816,
  rs_R007_ueqv_R007NY_partial_16_0817,
  rs_R007_ueqv_R007NY_partial_16_0818,
  rs_R007_ueqv_R007NY_partial_16_0819,
  rs_R007_ueqv_R007NY_partial_16_0820,
  rs_R007_ueqv_R007NY_partial_16_0821,
  rs_R007_ueqv_R007NY_partial_16_0822,
  rs_R007_ueqv_R007NY_partial_16_0823,
  rs_R007_ueqv_R007NY_partial_16_0824,
  rs_R007_ueqv_R007NY_partial_16_0825,
  rs_R007_ueqv_R007NY_partial_16_0826,
  rs_R007_ueqv_R007NY_partial_16_0827,
  rs_R007_ueqv_R007NY_partial_16_0828,
  rs_R007_ueqv_R007NY_partial_16_0829,
  rs_R007_ueqv_R007NY_partial_16_0830,
  rs_R007_ueqv_R007NY_partial_16_0831,
  rs_R007_ueqv_R007NY_partial_16_0832,
  rs_R007_ueqv_R007NY_partial_16_0833,
  rs_R007_ueqv_R007NY_partial_16_0834,
  rs_R007_ueqv_R007NY_partial_16_0835,
  rs_R007_ueqv_R007NY_partial_16_0836,
  rs_R007_ueqv_R007NY_partial_16_0837,
  rs_R007_ueqv_R007NY_partial_16_0838,
  rs_R007_ueqv_R007NY_partial_16_0839,
  rs_R007_ueqv_R007NY_partial_16_0840,
  rs_R007_ueqv_R007NY_partial_16_0841,
  rs_R007_ueqv_R007NY_partial_16_0842,
  rs_R007_ueqv_R007NY_partial_16_0843,
  rs_R007_ueqv_R007NY_partial_16_0844,
  rs_R007_ueqv_R007NY_partial_16_0845,
  rs_R007_ueqv_R007NY_partial_16_0846,
  rs_R007_ueqv_R007NY_partial_16_0847,
  rs_R007_ueqv_R007NY_partial_16_0848,
  rs_R007_ueqv_R007NY_partial_16_0849,
  rs_R007_ueqv_R007NY_partial_16_0850,
  rs_R007_ueqv_R007NY_partial_16_0851,
  rs_R007_ueqv_R007NY_partial_16_0852,
  rs_R007_ueqv_R007NY_partial_16_0853,
  rs_R007_ueqv_R007NY_partial_16_0854,
  rs_R007_ueqv_R007NY_partial_16_0855,
  rs_R007_ueqv_R007NY_partial_16_0856,
  rs_R007_ueqv_R007NY_partial_16_0857,
  rs_R007_ueqv_R007NY_partial_16_0858,
  rs_R007_ueqv_R007NY_partial_16_0859,
  rs_R007_ueqv_R007NY_partial_16_0860,
  rs_R007_ueqv_R007NY_partial_16_0861,
  rs_R007_ueqv_R007NY_partial_16_0862,
  rs_R007_ueqv_R007NY_partial_16_0863,
  rs_R007_ueqv_R007NY_partial_16_0864,
  rs_R007_ueqv_R007NY_partial_16_0865,
  rs_R007_ueqv_R007NY_partial_16_0866,
  rs_R007_ueqv_R007NY_partial_16_0867,
  rs_R007_ueqv_R007NY_partial_16_0868,
  rs_R007_ueqv_R007NY_partial_16_0869,
  rs_R007_ueqv_R007NY_partial_16_0870,
  rs_R007_ueqv_R007NY_partial_16_0871,
  rs_R007_ueqv_R007NY_partial_16_0872,
  rs_R007_ueqv_R007NY_partial_16_0873,
  rs_R007_ueqv_R007NY_partial_16_0874,
  rs_R007_ueqv_R007NY_partial_16_0875,
  rs_R007_ueqv_R007NY_partial_16_0876,
  rs_R007_ueqv_R007NY_partial_16_0877,
  rs_R007_ueqv_R007NY_partial_16_0878,
  rs_R007_ueqv_R007NY_partial_16_0879,
  rs_R007_ueqv_R007NY_partial_16_0880,
  rs_R007_ueqv_R007NY_partial_16_0881,
  rs_R007_ueqv_R007NY_partial_16_0882,
  rs_R007_ueqv_R007NY_partial_16_0883,
  rs_R007_ueqv_R007NY_partial_16_0884,
  rs_R007_ueqv_R007NY_partial_16_0885,
  rs_R007_ueqv_R007NY_partial_16_0886,
  rs_R007_ueqv_R007NY_partial_16_0887,
  rs_R007_ueqv_R007NY_partial_16_0888,
  rs_R007_ueqv_R007NY_partial_16_0889,
  rs_R007_ueqv_R007NY_partial_16_0890,
  rs_R007_ueqv_R007NY_partial_16_0891,
  rs_R007_ueqv_R007NY_partial_16_0892,
  rs_R007_ueqv_R007NY_partial_16_0893,
  rs_R007_ueqv_R007NY_partial_16_0894,
  rs_R007_ueqv_R007NY_partial_16_0895,
  rs_R007_ueqv_R007NY_partial_16_0896,
  rs_R007_ueqv_R007NY_partial_16_0897,
  rs_R007_ueqv_R007NY_partial_16_0898,
  rs_R007_ueqv_R007NY_partial_16_0899
]

/-- Sum of partial products in this block. -/
def rs_R007_ueqv_R007NY_block_16_0800_0899 : Poly :=
[
  term ((-491656423605717141358255 : Rat) / 629862144719762786538) [(6, 1), (7, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((1457930566764680866908895 : Rat) / 314931072359881393269) [(6, 1), (7, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((1479594395360967851559856 : Rat) / 944793217079644179807) [(6, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(6, 1), (7, 1), (10, 1), (11, 1), (16, 2)],
  term ((-4085890554770613765040 : Rat) / 134970459582806311401) [(6, 1), (7, 1), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((-231078357117107816841050 : Rat) / 314931072359881393269) [(6, 1), (7, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((70142547795370707424 : Rat) / 445447061329393767) [(6, 1), (7, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 2)],
  term ((-69790949729845106404060 : Rat) / 314931072359881393269) [(6, 1), (7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(6, 1), (7, 1), (10, 1), (12, 1), (15, 1), (16, 2)],
  term ((5680141240417154429440 : Rat) / 14996717731422923489) [(6, 1), (7, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-40763952954734232089092 : Rat) / 314931072359881393269) [(6, 1), (7, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((5680141240417154429440 : Rat) / 44990153194268770467) [(6, 1), (7, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((289895242826578198186399 : Rat) / 314931072359881393269) [(6, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(6, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 2)],
  term ((-2840070620208577214720 : Rat) / 44990153194268770467) [(6, 1), (7, 1), (10, 1), (14, 1), (15, 3), (16, 1)],
  term ((98331284721143428271651 : Rat) / 209954048239920928846) [(6, 1), (7, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-292517623490706851264666 : Rat) / 314931072359881393269) [(6, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(6, 1), (7, 1), (10, 1), (15, 1), (16, 2)],
  term ((-263856710498883235360853 : Rat) / 104977024119960464423) [(6, 1), (7, 1), (10, 1), (15, 3), (16, 1)],
  term ((-261071233965417724596490 : Rat) / 944793217079644179807) [(6, 1), (7, 1), (10, 2), (11, 1), (12, 1), (16, 1)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(6, 1), (7, 1), (10, 2), (11, 1), (12, 1), (16, 2)],
  term ((71001765505214430368000 : Rat) / 134970459582806311401) [(6, 1), (7, 1), (10, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((61579824695772740558575 : Rat) / 104977024119960464423) [(6, 1), (7, 1), (10, 2), (11, 1), (16, 1)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(6, 1), (7, 1), (10, 2), (11, 1), (16, 2)],
  term ((52214246793083544919298 : Rat) / 314931072359881393269) [(6, 1), (7, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(6, 1), (7, 1), (10, 2), (12, 1), (15, 1), (16, 2)],
  term ((-14200353101042886073600 : Rat) / 44990153194268770467) [(6, 1), (7, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((-37787711010423328050529 : Rat) / 104977024119960464423) [(6, 1), (7, 1), (10, 2), (15, 1), (16, 1)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(6, 1), (7, 1), (10, 2), (15, 1), (16, 2)],
  term ((-13099096078876251664580 : Rat) / 19281494226115187343) [(6, 1), (7, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(6, 1), (7, 1), (11, 1), (12, 1), (14, 1), (16, 2)],
  term ((261071233965417724596490 : Rat) / 944793217079644179807) [(6, 1), (7, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(6, 1), (7, 1), (11, 1), (12, 1), (14, 2), (16, 2)],
  term ((514308597998150217382210 : Rat) / 944793217079644179807) [(6, 1), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((176629381725493071802172 : Rat) / 944793217079644179807) [(6, 1), (7, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((14200353101042886073600 : Rat) / 134970459582806311401) [(6, 1), (7, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1820231004788008292897 : Rat) / 44990153194268770467) [(6, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((14200353101042886073600 : Rat) / 134970459582806311401) [(6, 1), (7, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-14200353101042886073600 : Rat) / 134970459582806311401) [(6, 1), (7, 1), (11, 1), (13, 2), (16, 1)],
  term ((356731356309041624996845 : Rat) / 111152143185840491742) [(6, 1), (7, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1277626910628790970994715 : Rat) / 3779172868318576719228) [(6, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(6, 1), (7, 1), (11, 1), (14, 1), (16, 2)],
  term ((-14200353101042886073600 : Rat) / 134970459582806311401) [(6, 1), (7, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((-8303082146681091657558 : Rat) / 6175119065880027319) [(6, 1), (7, 1), (11, 1), (14, 2), (16, 1)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(6, 1), (7, 1), (11, 1), (14, 2), (16, 2)],
  term ((491656423605717141358255 : Rat) / 944793217079644179807) [(6, 1), (7, 1), (11, 1), (14, 3), (16, 1)],
  term ((-28689052069811804767525 : Rat) / 111152143185840491742) [(6, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((6564128440451154837029767 : Rat) / 1889586434159288359614) [(6, 1), (7, 1), (11, 1), (16, 1)],
  term ((4085890554770613765040 : Rat) / 134970459582806311401) [(6, 1), (7, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-4085890554770613765040 : Rat) / 134970459582806311401) [(6, 1), (7, 1), (11, 2), (13, 1), (16, 1)],
  term ((-837656028974230594608425 : Rat) / 209954048239920928846) [(6, 1), (7, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-231078357117107816841050 : Rat) / 314931072359881393269) [(6, 1), (7, 1), (11, 2), (15, 1), (16, 1)],
  term ((2619819215775250332916 : Rat) / 6427164742038395781) [(6, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(6, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 2)],
  term ((-52214246793083544919298 : Rat) / 314931072359881393269) [(6, 1), (7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(6, 1), (7, 1), (12, 1), (14, 2), (15, 1), (16, 2)],
  term ((-102861719599630043476442 : Rat) / 314931072359881393269) [(6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1047514173273133241164 : Rat) / 8511650604321118737) [(6, 1), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2840070620208577214720 : Rat) / 44990153194268770467) [(6, 1), (7, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((527481823148426209181 : Rat) / 14996717731422923489) [(6, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2840070620208577214720 : Rat) / 44990153194268770467) [(6, 1), (7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((2840070620208577214720 : Rat) / 44990153194268770467) [(6, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((225291999179209580445119 : Rat) / 1259724289439525573076) [(6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(6, 1), (7, 1), (14, 1), (15, 1), (16, 2)],
  term ((-154109050079286241406087 : Rat) / 314931072359881393269) [(6, 1), (7, 1), (14, 1), (15, 3), (16, 1)],
  term ((5036190335788399234942 : Rat) / 6175119065880027319) [(6, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(6, 1), (7, 1), (14, 2), (15, 1), (16, 2)],
  term ((2840070620208577214720 : Rat) / 44990153194268770467) [(6, 1), (7, 1), (14, 2), (15, 3), (16, 1)],
  term ((-98331284721143428271651 : Rat) / 314931072359881393269) [(6, 1), (7, 1), (14, 3), (15, 1), (16, 1)],
  term ((-1300984279769499427019039 : Rat) / 629862144719762786538) [(6, 1), (7, 1), (15, 1), (16, 1)],
  term ((263919194161677764335141 : Rat) / 629862144719762786538) [(6, 1), (7, 1), (15, 3), (16, 1)],
  term (4 : Rat) [(6, 1), (7, 2), (10, 1), (14, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(6, 1), (7, 2), (10, 1), (16, 1)],
  term ((2094632070679343008483340 : Rat) / 314931072359881393269) [(6, 1), (7, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-418926414135868601696668 : Rat) / 104977024119960464423) [(6, 1), (7, 2), (14, 1), (15, 2), (16, 1)],
  term ((16 : Rat) / 3) [(6, 1), (7, 2), (14, 1), (16, 1)],
  term ((-8 : Rat) / 3) [(6, 1), (7, 2), (14, 2), (16, 1)],
  term ((-8 : Rat) / 3) [(6, 1), (7, 2), (16, 1)],
  term ((1073282862645815304502370 : Rat) / 944793217079644179807) [(6, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-140285095590741414848 : Rat) / 1336341183988181301) [(6, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 2)],
  term ((262955591432127197107685 : Rat) / 1889586434159288359614) [(6, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((70142547795370707424 : Rat) / 1336341183988181301) [(6, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 2)],
  term ((-350712738976853537120 : Rat) / 1336341183988181301) [(6, 1), (8, 1), (10, 1), (11, 2), (14, 1), (16, 2)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(6, 1), (8, 1), (10, 1), (11, 2), (16, 2)],
  term ((-214656572529163060900474 : Rat) / 314931072359881393269) [(6, 1), (8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((70142547795370707424 : Rat) / 445447061329393767) [(6, 1), (8, 1), (10, 1), (14, 1), (15, 2), (16, 2)],
  term ((-52591118286425439421537 : Rat) / 629862144719762786538) [(6, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(6, 1), (8, 1), (10, 1), (15, 2), (16, 2)],
  term ((350712738976853537120 : Rat) / 1336341183988181301) [(6, 1), (8, 1), (10, 2), (11, 1), (15, 1), (16, 2)],
  term ((-70142547795370707424 : Rat) / 445447061329393767) [(6, 1), (8, 1), (10, 2), (15, 2), (16, 2)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(6, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((2982130309170919139206 : Rat) / 19281494226115187343) [(6, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-70142547795370707424 : Rat) / 1336341183988181301) [(6, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 2)],
  term ((214656572529163060900474 : Rat) / 314931072359881393269) [(6, 1), (8, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-70142547795370707424 : Rat) / 445447061329393767) [(6, 1), (8, 1), (11, 1), (14, 2), (15, 1), (16, 2)],
  term ((-176271192097988810371670 : Rat) / 944793217079644179807) [(6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-140285095590741414848 : Rat) / 1336341183988181301) [(6, 1), (8, 1), (11, 1), (15, 1), (16, 2)],
  term ((650861743622554357383485 : Rat) / 944793217079644179807) [(6, 1), (8, 1), (11, 2), (14, 1), (16, 1)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(6, 1), (8, 1), (11, 2), (14, 1), (16, 2)],
  term ((-1073282862645815304502370 : Rat) / 944793217079644179807) [(6, 1), (8, 1), (11, 2), (14, 2), (16, 1)],
  term ((491656423605717141358255 : Rat) / 1259724289439525573076) [(7, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((-1457930566764680866908895 : Rat) / 629862144719762786538) [(7, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-739797197680483925779928 : Rat) / 944793217079644179807) [(7, 1), (10, 1), (11, 1), (16, 1)],
  term ((43839092372106692140 : Rat) / 1336341183988181301) [(7, 1), (10, 1), (11, 1), (16, 2)],
  term ((2042945277385306882520 : Rat) / 134970459582806311401) [(7, 1), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((115539178558553908420525 : Rat) / 314931072359881393269) [(7, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(7, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 2)],
  term ((34895474864922553202030 : Rat) / 314931072359881393269) [(7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(7, 1), (10, 1), (12, 1), (15, 1), (16, 2)],
  term ((-2840070620208577214720 : Rat) / 14996717731422923489) [(7, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((20381976477367116044546 : Rat) / 314931072359881393269) [(7, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2840070620208577214720 : Rat) / 44990153194268770467) [(7, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-289895242826578198186399 : Rat) / 629862144719762786538) [(7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(7, 1), (10, 1), (14, 1), (15, 1), (16, 2)],
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(7, 1), (10, 1), (14, 1), (15, 3), (16, 1)],
  term ((-98331284721143428271651 : Rat) / 419908096479841857692) [(7, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((146258811745353425632333 : Rat) / 314931072359881393269) [(7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-8767818474421338428 : Rat) / 445447061329393767) [(7, 1), (10, 1), (15, 1), (16, 2)],
  term ((263856710498883235360853 : Rat) / 209954048239920928846) [(7, 1), (10, 1), (15, 3), (16, 1)],
  term ((130535616982708862298245 : Rat) / 944793217079644179807) [(7, 1), (10, 2), (11, 1), (12, 1), (16, 1)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(7, 1), (10, 2), (11, 1), (12, 1), (16, 2)],
  term ((-35500882752607215184000 : Rat) / 134970459582806311401) [(7, 1), (10, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-61579824695772740558575 : Rat) / 209954048239920928846) [(7, 1), (10, 2), (11, 1), (16, 1)],
  term ((43839092372106692140 : Rat) / 1336341183988181301) [(7, 1), (10, 2), (11, 1), (16, 2)],
  term ((-26107123396541772459649 : Rat) / 314931072359881393269) [(7, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(7, 1), (10, 2), (12, 1), (15, 1), (16, 2)],
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(7, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((37787711010423328050529 : Rat) / 209954048239920928846) [(7, 1), (10, 2), (15, 1), (16, 1)],
  term ((-8767818474421338428 : Rat) / 445447061329393767) [(7, 1), (10, 2), (15, 1), (16, 2)],
  term ((6549548039438125832290 : Rat) / 19281494226115187343) [(7, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(7, 1), (11, 1), (12, 1), (14, 1), (16, 2)],
  term ((-130535616982708862298245 : Rat) / 944793217079644179807) [(7, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(7, 1), (11, 1), (12, 1), (14, 2), (16, 2)],
  term ((-257154298999075108691105 : Rat) / 944793217079644179807) [(7, 1), (11, 1), (12, 1), (16, 1)],
  term ((-88314690862746535901086 : Rat) / 944793217079644179807) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(7, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((1820231004788008292897 : Rat) / 89980306388537540934) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(7, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 134970459582806311401) [(7, 1), (11, 1), (13, 2), (16, 1)],
  term ((-356731356309041624996845 : Rat) / 222304286371680983484) [(7, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((1277626910628790970994715 : Rat) / 7558345736637153438456) [(7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-43839092372106692140 : Rat) / 1336341183988181301) [(7, 1), (11, 1), (14, 1), (16, 2)],
  term ((7100176550521443036800 : Rat) / 134970459582806311401) [(7, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((4151541073340545828779 : Rat) / 6175119065880027319) [(7, 1), (11, 1), (14, 2), (16, 1)],
  term ((43839092372106692140 : Rat) / 1336341183988181301) [(7, 1), (11, 1), (14, 2), (16, 2)],
  term ((-491656423605717141358255 : Rat) / 1889586434159288359614) [(7, 1), (11, 1), (14, 3), (16, 1)],
  term ((28689052069811804767525 : Rat) / 222304286371680983484) [(7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-6564128440451154837029767 : Rat) / 3779172868318576719228) [(7, 1), (11, 1), (16, 1)],
  term ((-2042945277385306882520 : Rat) / 134970459582806311401) [(7, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((2042945277385306882520 : Rat) / 134970459582806311401) [(7, 1), (11, 2), (13, 1), (16, 1)],
  term ((837656028974230594608425 : Rat) / 419908096479841857692) [(7, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((115539178558553908420525 : Rat) / 314931072359881393269) [(7, 1), (11, 2), (15, 1), (16, 1)],
  term ((-1309909607887625166458 : Rat) / 6427164742038395781) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 2)],
  term ((26107123396541772459649 : Rat) / 314931072359881393269) [(7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(7, 1), (12, 1), (14, 2), (15, 1), (16, 2)],
  term ((51430859799815021738221 : Rat) / 314931072359881393269) [(7, 1), (12, 1), (15, 1), (16, 1)],
  term ((523757086636566620582 : Rat) / 8511650604321118737) [(7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(7, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-527481823148426209181 : Rat) / 29993435462845846978) [(7, 1), (13, 1), (15, 2), (16, 1)],
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 44990153194268770467) [(7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-225291999179209580445119 : Rat) / 2519448578879051146152) [(7, 1), (14, 1), (15, 1), (16, 1)],
  term ((8767818474421338428 : Rat) / 445447061329393767) [(7, 1), (14, 1), (15, 1), (16, 2)],
  term ((154109050079286241406087 : Rat) / 629862144719762786538) [(7, 1), (14, 1), (15, 3), (16, 1)],
  term ((-2518095167894199617471 : Rat) / 6175119065880027319) [(7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-8767818474421338428 : Rat) / 445447061329393767) [(7, 1), (14, 2), (15, 1), (16, 2)],
  term ((-1420035310104288607360 : Rat) / 44990153194268770467) [(7, 1), (14, 2), (15, 3), (16, 1)],
  term ((98331284721143428271651 : Rat) / 629862144719762786538) [(7, 1), (14, 3), (15, 1), (16, 1)],
  term ((1300984279769499427019039 : Rat) / 1259724289439525573076) [(7, 1), (15, 1), (16, 1)],
  term ((-263919194161677764335141 : Rat) / 1259724289439525573076) [(7, 1), (15, 3), (16, 1)],
  term (-2 : Rat) [(7, 2), (10, 1), (14, 1), (16, 1)],
  term ((2 : Rat) / 3) [(7, 2), (10, 1), (16, 1)],
  term ((-1047316035339671504241670 : Rat) / 314931072359881393269) [(7, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((209463207067934300848334 : Rat) / 104977024119960464423) [(7, 2), (14, 1), (15, 2), (16, 1)],
  term ((-8 : Rat) / 3) [(7, 2), (14, 1), (16, 1)],
  term ((4 : Rat) / 3) [(7, 2), (14, 2), (16, 1)],
  term ((4 : Rat) / 3) [(7, 2), (16, 1)],
  term ((-536641431322907652251185 : Rat) / 944793217079644179807) [(8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((70142547795370707424 : Rat) / 1336341183988181301) [(8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 2)],
  term ((-262955591432127197107685 : Rat) / 3779172868318576719228) [(8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-35071273897685353712 : Rat) / 1336341183988181301) [(8, 1), (10, 1), (11, 1), (15, 1), (16, 2)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(8, 1), (10, 1), (11, 2), (14, 1), (16, 2)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(8, 1), (10, 1), (11, 2), (16, 2)],
  term ((107328286264581530450237 : Rat) / 314931072359881393269) [(8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(8, 1), (10, 1), (14, 1), (15, 2), (16, 2)],
  term ((52591118286425439421537 : Rat) / 1259724289439525573076) [(8, 1), (10, 1), (15, 2), (16, 1)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(8, 1), (10, 1), (15, 2), (16, 2)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(8, 1), (10, 2), (11, 1), (15, 1), (16, 2)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(8, 1), (10, 2), (15, 2), (16, 2)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1491065154585459569603 : Rat) / 19281494226115187343) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((35071273897685353712 : Rat) / 1336341183988181301) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 2)],
  term ((-107328286264581530450237 : Rat) / 314931072359881393269) [(8, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(8, 1), (11, 1), (14, 2), (15, 1), (16, 2)],
  term ((88135596048994405185835 : Rat) / 944793217079644179807) [(8, 1), (11, 1), (15, 1), (16, 1)],
  term ((70142547795370707424 : Rat) / 1336341183988181301) [(8, 1), (11, 1), (15, 1), (16, 2)],
  term ((-650861743622554357383485 : Rat) / 1889586434159288359614) [(8, 1), (11, 2), (14, 1), (16, 1)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(8, 1), (11, 2), (14, 1), (16, 2)],
  term ((536641431322907652251185 : Rat) / 944793217079644179807) [(8, 1), (11, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 16, terms 800 through 899. -/
theorem rs_R007_ueqv_R007NY_block_16_0800_0899_valid :
    checkProductSumEq rs_R007_ueqv_R007NY_partials_16_0800_0899
      rs_R007_ueqv_R007NY_block_16_0800_0899 = true := by
  native_decide

end R007UeqvR007NYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
