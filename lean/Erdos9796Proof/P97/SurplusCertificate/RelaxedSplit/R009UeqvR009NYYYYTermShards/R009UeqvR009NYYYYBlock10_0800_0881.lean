/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NYYYY, term block 10:800-881

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NYYYYTermShards

/-- Generator polynomial 10 for relaxed split surplus certificate `R009:u=v:R009NYYYY`. -/
def rs_R009_ueqv_R009NYYYY_generator_10_0800_0881 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(2, 1)]
]

/-- Coefficient term 800 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0800 : Poly :=
[
  term ((-14615166654 : Rat) / 33189485) [(11, 1), (12, 2), (15, 3)]
]

/-- Partial product 800 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0800 : Poly :=
[
  term ((-29230333308 : Rat) / 33189485) [(2, 1), (11, 1), (12, 2), (15, 3)],
  term ((14615166654 : Rat) / 33189485) [(11, 1), (12, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 800 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0800_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0800
        rs_R009_ueqv_R009NYYYY_generator_10_0800_0881 =
      rs_R009_ueqv_R009NYYYY_partial_10_0800 := by
  native_decide

/-- Coefficient term 801 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0801 : Poly :=
[
  term ((2775456 : Rat) / 32699) [(11, 1), (12, 2), (15, 3), (16, 1)]
]

/-- Partial product 801 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0801 : Poly :=
[
  term ((5550912 : Rat) / 32699) [(2, 1), (11, 1), (12, 2), (15, 3), (16, 1)],
  term ((-2775456 : Rat) / 32699) [(11, 1), (12, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 801 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0801_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0801
        rs_R009_ueqv_R009NYYYY_generator_10_0800_0881 =
      rs_R009_ueqv_R009NYYYY_partial_10_0801 := by
  native_decide

/-- Coefficient term 802 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0802 : Poly :=
[
  term ((-3221133967 : Rat) / 28448130) [(11, 1), (13, 1), (15, 2)]
]

/-- Partial product 802 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0802 : Poly :=
[
  term ((-3221133967 : Rat) / 14224065) [(2, 1), (11, 1), (13, 1), (15, 2)],
  term ((3221133967 : Rat) / 28448130) [(11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 802 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0802_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0802
        rs_R009_ueqv_R009NYYYY_generator_10_0800_0881 =
      rs_R009_ueqv_R009NYYYY_partial_10_0802 := by
  native_decide

/-- Coefficient term 803 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0803 : Poly :=
[
  term ((2036537 : Rat) / 98097) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 803 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0803 : Poly :=
[
  term ((4073074 : Rat) / 98097) [(2, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2036537 : Rat) / 98097) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 803 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0803_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0803
        rs_R009_ueqv_R009NYYYY_generator_10_0800_0881 =
      rs_R009_ueqv_R009NYYYY_partial_10_0803 := by
  native_decide

/-- Coefficient term 804 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0804 : Poly :=
[
  term ((968918500 : Rat) / 6637897) [(11, 1), (13, 1), (15, 4)]
]

/-- Partial product 804 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0804 : Poly :=
[
  term ((1937837000 : Rat) / 6637897) [(2, 1), (11, 1), (13, 1), (15, 4)],
  term ((-968918500 : Rat) / 6637897) [(11, 1), (13, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 804 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0804_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0804
        rs_R009_ueqv_R009NYYYY_generator_10_0800_0881 =
      rs_R009_ueqv_R009NYYYY_partial_10_0804 := by
  native_decide

/-- Coefficient term 805 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0805 : Poly :=
[
  term ((-920000 : Rat) / 32699) [(11, 1), (13, 1), (15, 4), (16, 1)]
]

/-- Partial product 805 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0805 : Poly :=
[
  term ((-1840000 : Rat) / 32699) [(2, 1), (11, 1), (13, 1), (15, 4), (16, 1)],
  term ((920000 : Rat) / 32699) [(11, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 805 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0805_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0805
        rs_R009_ueqv_R009NYYYY_generator_10_0800_0881 =
      rs_R009_ueqv_R009NYYYY_partial_10_0805 := by
  native_decide

/-- Coefficient term 806 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0806 : Poly :=
[
  term ((37897564234 : Rat) / 33189485) [(11, 1), (13, 2), (15, 1)]
]

/-- Partial product 806 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0806 : Poly :=
[
  term ((75795128468 : Rat) / 33189485) [(2, 1), (11, 1), (13, 2), (15, 1)],
  term ((-37897564234 : Rat) / 33189485) [(11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 806 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0806_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0806
        rs_R009_ueqv_R009NYYYY_generator_10_0800_0881 =
      rs_R009_ueqv_R009NYYYY_partial_10_0806 := by
  native_decide

/-- Coefficient term 807 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0807 : Poly :=
[
  term ((-7233056 : Rat) / 32699) [(11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 807 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0807 : Poly :=
[
  term ((-14466112 : Rat) / 32699) [(2, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((7233056 : Rat) / 32699) [(11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 807 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0807_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0807
        rs_R009_ueqv_R009NYYYY_generator_10_0800_0881 =
      rs_R009_ueqv_R009NYYYY_partial_10_0807 := by
  native_decide

/-- Coefficient term 808 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0808 : Poly :=
[
  term ((484459250 : Rat) / 948271) [(11, 1), (13, 2), (15, 3)]
]

/-- Partial product 808 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0808 : Poly :=
[
  term ((968918500 : Rat) / 948271) [(2, 1), (11, 1), (13, 2), (15, 3)],
  term ((-484459250 : Rat) / 948271) [(11, 1), (13, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 808 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0808_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0808
        rs_R009_ueqv_R009NYYYY_generator_10_0800_0881 =
      rs_R009_ueqv_R009NYYYY_partial_10_0808 := by
  native_decide

/-- Coefficient term 809 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0809 : Poly :=
[
  term ((-3220000 : Rat) / 32699) [(11, 1), (13, 2), (15, 3), (16, 1)]
]

/-- Partial product 809 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0809 : Poly :=
[
  term ((-6440000 : Rat) / 32699) [(2, 1), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((3220000 : Rat) / 32699) [(11, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 809 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0809_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0809
        rs_R009_ueqv_R009NYYYY_generator_10_0800_0881 =
      rs_R009_ueqv_R009NYYYY_partial_10_0809 := by
  native_decide

/-- Coefficient term 810 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0810 : Poly :=
[
  term ((134853541099 : Rat) / 796547640) [(11, 1), (15, 1)]
]

/-- Partial product 810 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0810 : Poly :=
[
  term ((134853541099 : Rat) / 398273820) [(2, 1), (11, 1), (15, 1)],
  term ((-134853541099 : Rat) / 796547640) [(11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 810 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0810_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0810
        rs_R009_ueqv_R009NYYYY_generator_10_0800_0881 =
      rs_R009_ueqv_R009NYYYY_partial_10_0810 := by
  native_decide

/-- Coefficient term 811 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0811 : Poly :=
[
  term ((-3236777 : Rat) / 98097) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 811 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0811 : Poly :=
[
  term ((-6473554 : Rat) / 98097) [(2, 1), (11, 1), (15, 1), (16, 1)],
  term ((3236777 : Rat) / 98097) [(11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 811 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0811_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0811
        rs_R009_ueqv_R009NYYYY_generator_10_0800_0881 =
      rs_R009_ueqv_R009NYYYY_partial_10_0811 := by
  native_decide

/-- Coefficient term 812 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0812 : Poly :=
[
  term ((-20088499137 : Rat) / 37930840) [(11, 1), (15, 3)]
]

/-- Partial product 812 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0812 : Poly :=
[
  term ((-20088499137 : Rat) / 18965420) [(2, 1), (11, 1), (15, 3)],
  term ((20088499137 : Rat) / 37930840) [(11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 812 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0812_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0812
        rs_R009_ueqv_R009NYYYY_generator_10_0800_0881 =
      rs_R009_ueqv_R009NYYYY_partial_10_0812 := by
  native_decide

/-- Coefficient term 813 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0813 : Poly :=
[
  term ((3336283 : Rat) / 32699) [(11, 1), (15, 3), (16, 1)]
]

/-- Partial product 813 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0813 : Poly :=
[
  term ((6672566 : Rat) / 32699) [(2, 1), (11, 1), (15, 3), (16, 1)],
  term ((-3336283 : Rat) / 32699) [(11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 813 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0813_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0813
        rs_R009_ueqv_R009NYYYY_generator_10_0800_0881 =
      rs_R009_ueqv_R009NYYYY_partial_10_0813 := by
  native_decide

/-- Coefficient term 814 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0814 : Poly :=
[
  term ((-11425486952 : Rat) / 33189485) [(11, 2), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 814 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0814 : Poly :=
[
  term ((-22850973904 : Rat) / 33189485) [(2, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((11425486952 : Rat) / 33189485) [(11, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 814 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0814_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0814
        rs_R009_ueqv_R009NYYYY_generator_10_0800_0881 =
      rs_R009_ueqv_R009NYYYY_partial_10_0814 := by
  native_decide

/-- Coefficient term 815 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0815 : Poly :=
[
  term ((2169728 : Rat) / 32699) [(11, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 815 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0815 : Poly :=
[
  term ((4339456 : Rat) / 32699) [(2, 1), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2169728 : Rat) / 32699) [(11, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 815 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0815_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0815
        rs_R009_ueqv_R009NYYYY_generator_10_0800_0881 =
      rs_R009_ueqv_R009NYYYY_partial_10_0815 := by
  native_decide

/-- Coefficient term 816 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0816 : Poly :=
[
  term ((46260044864 : Rat) / 33189485) [(11, 2), (12, 1), (13, 1), (15, 3)]
]

/-- Partial product 816 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0816 : Poly :=
[
  term ((92520089728 : Rat) / 33189485) [(2, 1), (11, 2), (12, 1), (13, 1), (15, 3)],
  term ((-46260044864 : Rat) / 33189485) [(11, 2), (12, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 816 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0816_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0816
        rs_R009_ueqv_R009NYYYY_generator_10_0800_0881 =
      rs_R009_ueqv_R009NYYYY_partial_10_0816 := by
  native_decide

/-- Coefficient term 817 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0817 : Poly :=
[
  term ((-8784896 : Rat) / 32699) [(11, 2), (12, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 817 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0817 : Poly :=
[
  term ((-17569792 : Rat) / 32699) [(2, 1), (11, 2), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((8784896 : Rat) / 32699) [(11, 2), (12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 817 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0817_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0817
        rs_R009_ueqv_R009NYYYY_generator_10_0800_0881 =
      rs_R009_ueqv_R009NYYYY_partial_10_0817 := by
  native_decide

/-- Coefficient term 818 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0818 : Poly :=
[
  term ((-13766394048 : Rat) / 33189485) [(11, 2), (12, 1), (13, 2), (15, 2)]
]

/-- Partial product 818 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0818 : Poly :=
[
  term ((-27532788096 : Rat) / 33189485) [(2, 1), (11, 2), (12, 1), (13, 2), (15, 2)],
  term ((13766394048 : Rat) / 33189485) [(11, 2), (12, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 818 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0818_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0818
        rs_R009_ueqv_R009NYYYY_generator_10_0800_0881 =
      rs_R009_ueqv_R009NYYYY_partial_10_0818 := by
  native_decide

/-- Coefficient term 819 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0819 : Poly :=
[
  term ((2614272 : Rat) / 32699) [(11, 2), (12, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 819 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0819 : Poly :=
[
  term ((5228544 : Rat) / 32699) [(2, 1), (11, 2), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-2614272 : Rat) / 32699) [(11, 2), (12, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 819 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0819_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0819
        rs_R009_ueqv_R009NYYYY_generator_10_0800_0881 =
      rs_R009_ueqv_R009NYYYY_partial_10_0819 := by
  native_decide

/-- Coefficient term 820 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0820 : Poly :=
[
  term ((11797551656 : Rat) / 33189485) [(11, 2), (12, 1), (15, 2)]
]

/-- Partial product 820 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0820 : Poly :=
[
  term ((23595103312 : Rat) / 33189485) [(2, 1), (11, 2), (12, 1), (15, 2)],
  term ((-11797551656 : Rat) / 33189485) [(11, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 820 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0820_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0820
        rs_R009_ueqv_R009NYYYY_generator_10_0800_0881 =
      rs_R009_ueqv_R009NYYYY_partial_10_0820 := by
  native_decide

/-- Coefficient term 821 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0821 : Poly :=
[
  term ((-2240384 : Rat) / 32699) [(11, 2), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 821 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0821 : Poly :=
[
  term ((-4480768 : Rat) / 32699) [(2, 1), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((2240384 : Rat) / 32699) [(11, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 821 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0821_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0821
        rs_R009_ueqv_R009NYYYY_generator_10_0800_0881 =
      rs_R009_ueqv_R009NYYYY_partial_10_0821 := by
  native_decide

/-- Coefficient term 822 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0822 : Poly :=
[
  term ((-37609540496 : Rat) / 33189485) [(11, 2), (12, 1), (15, 4)]
]

/-- Partial product 822 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0822 : Poly :=
[
  term ((-75219080992 : Rat) / 33189485) [(2, 1), (11, 2), (12, 1), (15, 4)],
  term ((37609540496 : Rat) / 33189485) [(11, 2), (12, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 822 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0822_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0822
        rs_R009_ueqv_R009NYYYY_generator_10_0800_0881 =
      rs_R009_ueqv_R009NYYYY_partial_10_0822 := by
  native_decide

/-- Coefficient term 823 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0823 : Poly :=
[
  term ((7142144 : Rat) / 32699) [(11, 2), (12, 1), (15, 4), (16, 1)]
]

/-- Partial product 823 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0823 : Poly :=
[
  term ((14284288 : Rat) / 32699) [(2, 1), (11, 2), (12, 1), (15, 4), (16, 1)],
  term ((-7142144 : Rat) / 32699) [(11, 2), (12, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 823 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0823_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0823
        rs_R009_ueqv_R009NYYYY_generator_10_0800_0881 =
      rs_R009_ueqv_R009NYYYY_partial_10_0823 := by
  native_decide

/-- Coefficient term 824 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0824 : Poly :=
[
  term ((6883197024 : Rat) / 33189485) [(11, 2), (12, 2), (13, 1), (15, 1)]
]

/-- Partial product 824 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0824 : Poly :=
[
  term ((13766394048 : Rat) / 33189485) [(2, 1), (11, 2), (12, 2), (13, 1), (15, 1)],
  term ((-6883197024 : Rat) / 33189485) [(11, 2), (12, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 824 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0824_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0824
        rs_R009_ueqv_R009NYYYY_generator_10_0800_0881 =
      rs_R009_ueqv_R009NYYYY_partial_10_0824 := by
  native_decide

/-- Coefficient term 825 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0825 : Poly :=
[
  term ((-1307136 : Rat) / 32699) [(11, 2), (12, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 825 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0825 : Poly :=
[
  term ((-2614272 : Rat) / 32699) [(2, 1), (11, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((1307136 : Rat) / 32699) [(11, 2), (12, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 825 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0825_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0825
        rs_R009_ueqv_R009NYYYY_generator_10_0800_0881 =
      rs_R009_ueqv_R009NYYYY_partial_10_0825 := by
  native_decide

/-- Coefficient term 826 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0826 : Poly :=
[
  term ((-93016176 : Rat) / 1144465) [(11, 2), (12, 2), (15, 2)]
]

/-- Partial product 826 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0826 : Poly :=
[
  term ((-186032352 : Rat) / 1144465) [(2, 1), (11, 2), (12, 2), (15, 2)],
  term ((93016176 : Rat) / 1144465) [(11, 2), (12, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 826 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0826_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0826
        rs_R009_ueqv_R009NYYYY_generator_10_0800_0881 =
      rs_R009_ueqv_R009NYYYY_partial_10_0826 := by
  native_decide

/-- Coefficient term 827 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0827 : Poly :=
[
  term ((512256 : Rat) / 32699) [(11, 2), (12, 2), (15, 2), (16, 1)]
]

/-- Partial product 827 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0827 : Poly :=
[
  term ((1024512 : Rat) / 32699) [(2, 1), (11, 2), (12, 2), (15, 2), (16, 1)],
  term ((-512256 : Rat) / 32699) [(11, 2), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 827 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0827_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0827
        rs_R009_ueqv_R009NYYYY_generator_10_0800_0881 =
      rs_R009_ueqv_R009NYYYY_partial_10_0827 := by
  native_decide

/-- Coefficient term 828 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0828 : Poly :=
[
  term ((4003571242 : Rat) / 33189485) [(11, 2), (13, 1), (15, 1)]
]

/-- Partial product 828 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0828 : Poly :=
[
  term ((8007142484 : Rat) / 33189485) [(2, 1), (11, 2), (13, 1), (15, 1)],
  term ((-4003571242 : Rat) / 33189485) [(11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 828 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0828_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0828
        rs_R009_ueqv_R009NYYYY_generator_10_0800_0881 =
      rs_R009_ueqv_R009NYYYY_partial_10_0828 := by
  native_decide

/-- Coefficient term 829 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0829 : Poly :=
[
  term ((-760288 : Rat) / 32699) [(11, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 829 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0829 : Poly :=
[
  term ((-1520576 : Rat) / 32699) [(2, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((760288 : Rat) / 32699) [(11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 829 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0829_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0829
        rs_R009_ueqv_R009NYYYY_generator_10_0800_0881 =
      rs_R009_ueqv_R009NYYYY_partial_10_0829 := by
  native_decide

/-- Coefficient term 830 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0830 : Poly :=
[
  term ((9642676912 : Rat) / 33189485) [(11, 2), (13, 1), (15, 3)]
]

/-- Partial product 830 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0830 : Poly :=
[
  term ((19285353824 : Rat) / 33189485) [(2, 1), (11, 2), (13, 1), (15, 3)],
  term ((-9642676912 : Rat) / 33189485) [(11, 2), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 830 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0830_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0830
        rs_R009_ueqv_R009NYYYY_generator_10_0800_0881 =
      rs_R009_ueqv_R009NYYYY_partial_10_0830 := by
  native_decide

/-- Coefficient term 831 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0831 : Poly :=
[
  term ((-1831168 : Rat) / 32699) [(11, 2), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 831 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0831 : Poly :=
[
  term ((-3662336 : Rat) / 32699) [(2, 1), (11, 2), (13, 1), (15, 3), (16, 1)],
  term ((1831168 : Rat) / 32699) [(11, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 831 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0831_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0831
        rs_R009_ueqv_R009NYYYY_generator_10_0800_0881 =
      rs_R009_ueqv_R009NYYYY_partial_10_0831 := by
  native_decide

/-- Coefficient term 832 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0832 : Poly :=
[
  term ((-8309445056 : Rat) / 33189485) [(11, 2), (13, 2), (15, 2)]
]

/-- Partial product 832 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0832 : Poly :=
[
  term ((-16618890112 : Rat) / 33189485) [(2, 1), (11, 2), (13, 2), (15, 2)],
  term ((8309445056 : Rat) / 33189485) [(11, 2), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 832 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0832_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0832
        rs_R009_ueqv_R009NYYYY_generator_10_0800_0881 =
      rs_R009_ueqv_R009NYYYY_partial_10_0832 := by
  native_decide

/-- Coefficient term 833 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0833 : Poly :=
[
  term ((1577984 : Rat) / 32699) [(11, 2), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 833 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0833 : Poly :=
[
  term ((3155968 : Rat) / 32699) [(2, 1), (11, 2), (13, 2), (15, 2), (16, 1)],
  term ((-1577984 : Rat) / 32699) [(11, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 833 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0833_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0833
        rs_R009_ueqv_R009NYYYY_generator_10_0800_0881 =
      rs_R009_ueqv_R009NYYYY_partial_10_0833 := by
  native_decide

/-- Coefficient term 834 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0834 : Poly :=
[
  term ((792575333 : Rat) / 6637897) [(11, 2), (15, 2)]
]

/-- Partial product 834 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0834 : Poly :=
[
  term ((1585150666 : Rat) / 6637897) [(2, 1), (11, 2), (15, 2)],
  term ((-792575333 : Rat) / 6637897) [(11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 834 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0834_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0834
        rs_R009_ueqv_R009NYYYY_generator_10_0800_0881 =
      rs_R009_ueqv_R009NYYYY_partial_10_0834 := by
  native_decide

/-- Coefficient term 835 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0835 : Poly :=
[
  term ((-752560 : Rat) / 32699) [(11, 2), (15, 2), (16, 1)]
]

/-- Partial product 835 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0835 : Poly :=
[
  term ((-1505120 : Rat) / 32699) [(2, 1), (11, 2), (15, 2), (16, 1)],
  term ((752560 : Rat) / 32699) [(11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 835 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0835_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0835
        rs_R009_ueqv_R009NYYYY_generator_10_0800_0881 =
      rs_R009_ueqv_R009NYYYY_partial_10_0835 := by
  native_decide

/-- Coefficient term 836 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0836 : Poly :=
[
  term ((488334924 : Rat) / 4741355) [(11, 2), (15, 4)]
]

/-- Partial product 836 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0836 : Poly :=
[
  term ((976669848 : Rat) / 4741355) [(2, 1), (11, 2), (15, 4)],
  term ((-488334924 : Rat) / 4741355) [(11, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 836 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0836_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0836
        rs_R009_ueqv_R009NYYYY_generator_10_0800_0881 =
      rs_R009_ueqv_R009NYYYY_partial_10_0836 := by
  native_decide

/-- Coefficient term 837 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0837 : Poly :=
[
  term ((-649152 : Rat) / 32699) [(11, 2), (15, 4), (16, 1)]
]

/-- Partial product 837 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0837 : Poly :=
[
  term ((-1298304 : Rat) / 32699) [(2, 1), (11, 2), (15, 4), (16, 1)],
  term ((649152 : Rat) / 32699) [(11, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 837 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0837_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0837
        rs_R009_ueqv_R009NYYYY_generator_10_0800_0881 =
      rs_R009_ueqv_R009NYYYY_partial_10_0837 := by
  native_decide

/-- Coefficient term 838 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0838 : Poly :=
[
  term ((-1488258816 : Rat) / 33189485) [(11, 3), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 838 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0838 : Poly :=
[
  term ((-2976517632 : Rat) / 33189485) [(2, 1), (11, 3), (12, 1), (13, 1), (15, 2)],
  term ((1488258816 : Rat) / 33189485) [(11, 3), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 838 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0838_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0838
        rs_R009_ueqv_R009NYYYY_generator_10_0800_0881 =
      rs_R009_ueqv_R009NYYYY_partial_10_0838 := by
  native_decide

/-- Coefficient term 839 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0839 : Poly :=
[
  term ((282624 : Rat) / 32699) [(11, 3), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 839 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0839 : Poly :=
[
  term ((565248 : Rat) / 32699) [(2, 1), (11, 3), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-282624 : Rat) / 32699) [(11, 3), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 839 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0839_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0839
        rs_R009_ueqv_R009NYYYY_generator_10_0800_0881 =
      rs_R009_ueqv_R009NYYYY_partial_10_0839 := by
  native_decide

/-- Coefficient term 840 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0840 : Poly :=
[
  term ((31005392 : Rat) / 33189485) [(11, 3), (12, 1), (15, 1)]
]

/-- Partial product 840 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0840 : Poly :=
[
  term ((62010784 : Rat) / 33189485) [(2, 1), (11, 3), (12, 1), (15, 1)],
  term ((-31005392 : Rat) / 33189485) [(11, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 840 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0840_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0840
        rs_R009_ueqv_R009NYYYY_generator_10_0800_0881 =
      rs_R009_ueqv_R009NYYYY_partial_10_0840 := by
  native_decide

/-- Coefficient term 841 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0841 : Poly :=
[
  term ((-5888 : Rat) / 32699) [(11, 3), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 841 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0841 : Poly :=
[
  term ((-11776 : Rat) / 32699) [(2, 1), (11, 3), (12, 1), (15, 1), (16, 1)],
  term ((5888 : Rat) / 32699) [(11, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 841 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0841_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0841
        rs_R009_ueqv_R009NYYYY_generator_10_0800_0881 =
      rs_R009_ueqv_R009NYYYY_partial_10_0841 := by
  native_decide

/-- Coefficient term 842 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0842 : Poly :=
[
  term ((372064704 : Rat) / 33189485) [(11, 3), (12, 1), (15, 3)]
]

/-- Partial product 842 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0842 : Poly :=
[
  term ((744129408 : Rat) / 33189485) [(2, 1), (11, 3), (12, 1), (15, 3)],
  term ((-372064704 : Rat) / 33189485) [(11, 3), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 842 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0842_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0842
        rs_R009_ueqv_R009NYYYY_generator_10_0800_0881 =
      rs_R009_ueqv_R009NYYYY_partial_10_0842 := by
  native_decide

/-- Coefficient term 843 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0843 : Poly :=
[
  term ((-70656 : Rat) / 32699) [(11, 3), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 843 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0843 : Poly :=
[
  term ((-141312 : Rat) / 32699) [(2, 1), (11, 3), (12, 1), (15, 3), (16, 1)],
  term ((70656 : Rat) / 32699) [(11, 3), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 843 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0843_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0843
        rs_R009_ueqv_R009NYYYY_generator_10_0800_0881 =
      rs_R009_ueqv_R009NYYYY_partial_10_0843 := by
  native_decide

/-- Coefficient term 844 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0844 : Poly :=
[
  term ((-62010784 : Rat) / 33189485) [(11, 3), (13, 1), (15, 2)]
]

/-- Partial product 844 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0844 : Poly :=
[
  term ((-124021568 : Rat) / 33189485) [(2, 1), (11, 3), (13, 1), (15, 2)],
  term ((62010784 : Rat) / 33189485) [(11, 3), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 844 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0844_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0844
        rs_R009_ueqv_R009NYYYY_generator_10_0800_0881 =
      rs_R009_ueqv_R009NYYYY_partial_10_0844 := by
  native_decide

/-- Coefficient term 845 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0845 : Poly :=
[
  term ((11776 : Rat) / 32699) [(11, 3), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 845 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0845 : Poly :=
[
  term ((23552 : Rat) / 32699) [(2, 1), (11, 3), (13, 1), (15, 2), (16, 1)],
  term ((-11776 : Rat) / 32699) [(11, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 845 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0845_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0845
        rs_R009_ueqv_R009NYYYY_generator_10_0800_0881 =
      rs_R009_ueqv_R009NYYYY_partial_10_0845 := by
  native_decide

/-- Coefficient term 846 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0846 : Poly :=
[
  term ((744129408 : Rat) / 33189485) [(11, 3), (13, 2), (15, 1)]
]

/-- Partial product 846 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0846 : Poly :=
[
  term ((1488258816 : Rat) / 33189485) [(2, 1), (11, 3), (13, 2), (15, 1)],
  term ((-744129408 : Rat) / 33189485) [(11, 3), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 846 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0846_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0846
        rs_R009_ueqv_R009NYYYY_generator_10_0800_0881 =
      rs_R009_ueqv_R009NYYYY_partial_10_0846 := by
  native_decide

/-- Coefficient term 847 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0847 : Poly :=
[
  term ((-141312 : Rat) / 32699) [(11, 3), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 847 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0847 : Poly :=
[
  term ((-282624 : Rat) / 32699) [(2, 1), (11, 3), (13, 2), (15, 1), (16, 1)],
  term ((141312 : Rat) / 32699) [(11, 3), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 847 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0847_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0847
        rs_R009_ueqv_R009NYYYY_generator_10_0800_0881 =
      rs_R009_ueqv_R009NYYYY_partial_10_0847 := by
  native_decide

/-- Coefficient term 848 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0848 : Poly :=
[
  term ((15502696 : Rat) / 33189485) [(11, 3), (15, 1)]
]

/-- Partial product 848 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0848 : Poly :=
[
  term ((31005392 : Rat) / 33189485) [(2, 1), (11, 3), (15, 1)],
  term ((-15502696 : Rat) / 33189485) [(11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 848 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0848_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0848
        rs_R009_ueqv_R009NYYYY_generator_10_0800_0881 =
      rs_R009_ueqv_R009NYYYY_partial_10_0848 := by
  native_decide

/-- Coefficient term 849 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0849 : Poly :=
[
  term ((-2944 : Rat) / 32699) [(11, 3), (15, 1), (16, 1)]
]

/-- Partial product 849 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0849 : Poly :=
[
  term ((-5888 : Rat) / 32699) [(2, 1), (11, 3), (15, 1), (16, 1)],
  term ((2944 : Rat) / 32699) [(11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 849 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0849_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0849
        rs_R009_ueqv_R009NYYYY_generator_10_0800_0881 =
      rs_R009_ueqv_R009NYYYY_partial_10_0849 := by
  native_decide

/-- Coefficient term 850 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0850 : Poly :=
[
  term ((-31005392 : Rat) / 33189485) [(11, 3), (15, 3)]
]

/-- Partial product 850 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0850 : Poly :=
[
  term ((-62010784 : Rat) / 33189485) [(2, 1), (11, 3), (15, 3)],
  term ((31005392 : Rat) / 33189485) [(11, 3), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 850 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0850_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0850
        rs_R009_ueqv_R009NYYYY_generator_10_0800_0881 =
      rs_R009_ueqv_R009NYYYY_partial_10_0850 := by
  native_decide

/-- Coefficient term 851 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0851 : Poly :=
[
  term ((5888 : Rat) / 32699) [(11, 3), (15, 3), (16, 1)]
]

/-- Partial product 851 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0851 : Poly :=
[
  term ((11776 : Rat) / 32699) [(2, 1), (11, 3), (15, 3), (16, 1)],
  term ((-5888 : Rat) / 32699) [(11, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 851 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0851_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0851
        rs_R009_ueqv_R009NYYYY_generator_10_0800_0881 =
      rs_R009_ueqv_R009NYYYY_partial_10_0851 := by
  native_decide

/-- Coefficient term 852 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0852 : Poly :=
[
  term ((-567 : Rat) / 320) [(12, 1)]
]

/-- Partial product 852 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0852 : Poly :=
[
  term ((-567 : Rat) / 160) [(2, 1), (12, 1)],
  term ((567 : Rat) / 320) [(12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 852 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0852_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0852
        rs_R009_ueqv_R009NYYYY_generator_10_0800_0881 =
      rs_R009_ueqv_R009NYYYY_partial_10_0852 := by
  native_decide

/-- Coefficient term 853 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0853 : Poly :=
[
  term ((-679016479325 : Rat) / 637238112) [(12, 1), (13, 1), (15, 1)]
]

/-- Partial product 853 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0853 : Poly :=
[
  term ((-679016479325 : Rat) / 318619056) [(2, 1), (12, 1), (13, 1), (15, 1)],
  term ((679016479325 : Rat) / 637238112) [(12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 853 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0853_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0853
        rs_R009_ueqv_R009NYYYY_generator_10_0800_0881 =
      rs_R009_ueqv_R009NYYYY_partial_10_0853 := by
  native_decide

/-- Coefficient term 854 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0854 : Poly :=
[
  term ((80009129 : Rat) / 392388) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 854 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0854 : Poly :=
[
  term ((80009129 : Rat) / 196194) [(2, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-80009129 : Rat) / 392388) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 854 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0854_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0854
        rs_R009_ueqv_R009NYYYY_generator_10_0800_0881 =
      rs_R009_ueqv_R009NYYYY_partial_10_0854 := by
  native_decide

/-- Coefficient term 855 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0855 : Poly :=
[
  term ((603340254457 : Rat) / 113792520) [(12, 1), (13, 1), (15, 3)]
]

/-- Partial product 855 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0855 : Poly :=
[
  term ((603340254457 : Rat) / 56896260) [(2, 1), (12, 1), (13, 1), (15, 3)],
  term ((-603340254457 : Rat) / 113792520) [(12, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 855 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0855_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0855
        rs_R009_ueqv_R009NYYYY_generator_10_0800_0881 =
      rs_R009_ueqv_R009NYYYY_partial_10_0855 := by
  native_decide

/-- Coefficient term 856 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0856 : Poly :=
[
  term ((-100557311 : Rat) / 98097) [(12, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 856 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0856 : Poly :=
[
  term ((-201114622 : Rat) / 98097) [(2, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((100557311 : Rat) / 98097) [(12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 856 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0856_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0856
        rs_R009_ueqv_R009NYYYY_generator_10_0800_0881 =
      rs_R009_ueqv_R009NYYYY_partial_10_0856 := by
  native_decide

/-- Coefficient term 857 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0857 : Poly :=
[
  term ((-123 : Rat) / 20) [(12, 1), (13, 2)]
]

/-- Partial product 857 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0857 : Poly :=
[
  term ((-123 : Rat) / 10) [(2, 1), (12, 1), (13, 2)],
  term ((123 : Rat) / 20) [(12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 857 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0857_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0857
        rs_R009_ueqv_R009NYYYY_generator_10_0800_0881 =
      rs_R009_ueqv_R009NYYYY_partial_10_0857 := by
  native_decide

/-- Coefficient term 858 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0858 : Poly :=
[
  term ((-468254984987 : Rat) / 132757940) [(12, 1), (13, 2), (15, 2)]
]

/-- Partial product 858 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0858 : Poly :=
[
  term ((-468254984987 : Rat) / 66378970) [(2, 1), (12, 1), (13, 2), (15, 2)],
  term ((468254984987 : Rat) / 132757940) [(12, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 858 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0858_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0858
        rs_R009_ueqv_R009NYYYY_generator_10_0800_0881 =
      rs_R009_ueqv_R009NYYYY_partial_10_0858 := by
  native_decide

/-- Coefficient term 859 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0859 : Poly :=
[
  term ((22324766 : Rat) / 32699) [(12, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 859 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0859 : Poly :=
[
  term ((44649532 : Rat) / 32699) [(2, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-22324766 : Rat) / 32699) [(12, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 859 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0859_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0859
        rs_R009_ueqv_R009NYYYY_generator_10_0800_0881 =
      rs_R009_ueqv_R009NYYYY_partial_10_0859 := by
  native_decide

/-- Coefficient term 860 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0860 : Poly :=
[
  term ((4762533069 : Rat) / 4741355) [(12, 1), (15, 2)]
]

/-- Partial product 860 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0860 : Poly :=
[
  term ((9525066138 : Rat) / 4741355) [(2, 1), (12, 1), (15, 2)],
  term ((-4762533069 : Rat) / 4741355) [(12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 860 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0860_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0860
        rs_R009_ueqv_R009NYYYY_generator_10_0800_0881 =
      rs_R009_ueqv_R009NYYYY_partial_10_0860 := by
  native_decide

/-- Coefficient term 861 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0861 : Poly :=
[
  term ((-38318891 : Rat) / 196194) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 861 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0861 : Poly :=
[
  term ((-38318891 : Rat) / 98097) [(2, 1), (12, 1), (15, 2), (16, 1)],
  term ((38318891 : Rat) / 196194) [(12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 861 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0861_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0861
        rs_R009_ueqv_R009NYYYY_generator_10_0800_0881 =
      rs_R009_ueqv_R009NYYYY_partial_10_0861 := by
  native_decide

/-- Coefficient term 862 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0862 : Poly :=
[
  term ((-190204212605 : Rat) / 159309528) [(12, 1), (15, 4)]
]

/-- Partial product 862 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0862 : Poly :=
[
  term ((-190204212605 : Rat) / 79654764) [(2, 1), (12, 1), (15, 4)],
  term ((190204212605 : Rat) / 159309528) [(12, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 862 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0862_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0862
        rs_R009_ueqv_R009NYYYY_generator_10_0800_0881 =
      rs_R009_ueqv_R009NYYYY_partial_10_0862 := by
  native_decide

/-- Coefficient term 863 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0863 : Poly :=
[
  term ((7575941 : Rat) / 32699) [(12, 1), (15, 4), (16, 1)]
]

/-- Partial product 863 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0863 : Poly :=
[
  term ((15151882 : Rat) / 32699) [(2, 1), (12, 1), (15, 4), (16, 1)],
  term ((-7575941 : Rat) / 32699) [(12, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 863 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0863_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0863
        rs_R009_ueqv_R009NYYYY_generator_10_0800_0881 =
      rs_R009_ueqv_R009NYYYY_partial_10_0863 := by
  native_decide

/-- Coefficient term 864 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0864 : Poly :=
[
  term ((13 : Rat) / 5) [(12, 2)]
]

/-- Partial product 864 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0864 : Poly :=
[
  term ((26 : Rat) / 5) [(2, 1), (12, 2)],
  term ((-13 : Rat) / 5) [(12, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 864 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0864_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0864
        rs_R009_ueqv_R009NYYYY_generator_10_0800_0881 =
      rs_R009_ueqv_R009NYYYY_partial_10_0864 := by
  native_decide

/-- Coefficient term 865 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0865 : Poly :=
[
  term ((365213948391 : Rat) / 265515880) [(12, 2), (13, 1), (15, 1)]
]

/-- Partial product 865 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0865 : Poly :=
[
  term ((365213948391 : Rat) / 132757940) [(2, 1), (12, 2), (13, 1), (15, 1)],
  term ((-365213948391 : Rat) / 265515880) [(12, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 865 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0865_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0865
        rs_R009_ueqv_R009NYYYY_generator_10_0800_0881 =
      rs_R009_ueqv_R009NYYYY_partial_10_0865 := by
  native_decide

/-- Coefficient term 866 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0866 : Poly :=
[
  term ((-8620783 : Rat) / 32699) [(12, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 866 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0866 : Poly :=
[
  term ((-17241566 : Rat) / 32699) [(2, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((8620783 : Rat) / 32699) [(12, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 866 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0866_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0866
        rs_R009_ueqv_R009NYYYY_generator_10_0800_0881 =
      rs_R009_ueqv_R009NYYYY_partial_10_0866 := by
  native_decide

/-- Coefficient term 867 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0867 : Poly :=
[
  term ((-25904848343 : Rat) / 27949040) [(12, 2), (15, 2)]
]

/-- Partial product 867 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0867 : Poly :=
[
  term ((-25904848343 : Rat) / 13974520) [(2, 1), (12, 2), (15, 2)],
  term ((25904848343 : Rat) / 27949040) [(12, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 867 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0867_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0867
        rs_R009_ueqv_R009NYYYY_generator_10_0800_0881 =
      rs_R009_ueqv_R009NYYYY_partial_10_0867 := by
  native_decide

/-- Coefficient term 868 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0868 : Poly :=
[
  term ((619643 : Rat) / 3442) [(12, 2), (15, 2), (16, 1)]
]

/-- Partial product 868 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0868 : Poly :=
[
  term ((619643 : Rat) / 1721) [(2, 1), (12, 2), (15, 2), (16, 1)],
  term ((-619643 : Rat) / 3442) [(12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 868 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0868_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0868
        rs_R009_ueqv_R009NYYYY_generator_10_0800_0881 =
      rs_R009_ueqv_R009NYYYY_partial_10_0868 := by
  native_decide

/-- Coefficient term 869 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0869 : Poly :=
[
  term ((35858084063 : Rat) / 2124127040) [(13, 1), (15, 1)]
]

/-- Partial product 869 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0869 : Poly :=
[
  term ((35858084063 : Rat) / 1062063520) [(2, 1), (13, 1), (15, 1)],
  term ((-35858084063 : Rat) / 2124127040) [(13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 869 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0869_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0869
        rs_R009_ueqv_R009NYYYY_generator_10_0800_0881 =
      rs_R009_ueqv_R009NYYYY_partial_10_0869 := by
  native_decide

/-- Coefficient term 870 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0870 : Poly :=
[
  term ((-1045775 : Rat) / 784776) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 870 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0870 : Poly :=
[
  term ((-1045775 : Rat) / 392388) [(2, 1), (13, 1), (15, 1), (16, 1)],
  term ((1045775 : Rat) / 784776) [(13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 870 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0870_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0870
        rs_R009_ueqv_R009NYYYY_generator_10_0800_0881 =
      rs_R009_ueqv_R009NYYYY_partial_10_0870 := by
  native_decide

/-- Coefficient term 871 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0871 : Poly :=
[
  term ((-83441959017 : Rat) / 265515880) [(13, 1), (15, 3)]
]

/-- Partial product 871 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0871 : Poly :=
[
  term ((-83441959017 : Rat) / 132757940) [(2, 1), (13, 1), (15, 3)],
  term ((83441959017 : Rat) / 265515880) [(13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 871 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0871_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0871
        rs_R009_ueqv_R009NYYYY_generator_10_0800_0881 =
      rs_R009_ueqv_R009NYYYY_partial_10_0871 := by
  native_decide

/-- Coefficient term 872 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0872 : Poly :=
[
  term ((5952103 : Rat) / 98097) [(13, 1), (15, 3), (16, 1)]
]

/-- Partial product 872 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0872 : Poly :=
[
  term ((11904206 : Rat) / 98097) [(2, 1), (13, 1), (15, 3), (16, 1)],
  term ((-5952103 : Rat) / 98097) [(13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 872 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0872_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0872
        rs_R009_ueqv_R009NYYYY_generator_10_0800_0881 =
      rs_R009_ueqv_R009NYYYY_partial_10_0872 := by
  native_decide

/-- Coefficient term 873 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0873 : Poly :=
[
  term ((-283 : Rat) / 80) [(13, 2)]
]

/-- Partial product 873 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0873 : Poly :=
[
  term ((-283 : Rat) / 40) [(2, 1), (13, 2)],
  term ((283 : Rat) / 80) [(13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 873 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0873_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0873
        rs_R009_ueqv_R009NYYYY_generator_10_0800_0881 =
      rs_R009_ueqv_R009NYYYY_partial_10_0873 := by
  native_decide

/-- Coefficient term 874 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0874 : Poly :=
[
  term ((-189973682117 : Rat) / 227585040) [(13, 2), (15, 2)]
]

/-- Partial product 874 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0874 : Poly :=
[
  term ((-189973682117 : Rat) / 113792520) [(2, 1), (13, 2), (15, 2)],
  term ((189973682117 : Rat) / 227585040) [(13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 874 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0874_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0874
        rs_R009_ueqv_R009NYYYY_generator_10_0800_0881 =
      rs_R009_ueqv_R009NYYYY_partial_10_0874 := by
  native_decide

/-- Coefficient term 875 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0875 : Poly :=
[
  term ((31508419 : Rat) / 196194) [(13, 2), (15, 2), (16, 1)]
]

/-- Partial product 875 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0875 : Poly :=
[
  term ((31508419 : Rat) / 98097) [(2, 1), (13, 2), (15, 2), (16, 1)],
  term ((-31508419 : Rat) / 196194) [(13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 875 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0875_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0875
        rs_R009_ueqv_R009NYYYY_generator_10_0800_0881 =
      rs_R009_ueqv_R009NYYYY_partial_10_0875 := by
  native_decide

/-- Coefficient term 876 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0876 : Poly :=
[
  term ((2657672048 : Rat) / 6637897) [(13, 3), (15, 1)]
]

/-- Partial product 876 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0876 : Poly :=
[
  term ((5315344096 : Rat) / 6637897) [(2, 1), (13, 3), (15, 1)],
  term ((-2657672048 : Rat) / 6637897) [(13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 876 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0876_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0876
        rs_R009_ueqv_R009NYYYY_generator_10_0800_0881 =
      rs_R009_ueqv_R009NYYYY_partial_10_0876 := by
  native_decide

/-- Coefficient term 877 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0877 : Poly :=
[
  term ((-2541600 : Rat) / 32699) [(13, 3), (15, 1), (16, 1)]
]

/-- Partial product 877 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0877 : Poly :=
[
  term ((-5083200 : Rat) / 32699) [(2, 1), (13, 3), (15, 1), (16, 1)],
  term ((2541600 : Rat) / 32699) [(13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 877 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0877_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0877
        rs_R009_ueqv_R009NYYYY_generator_10_0800_0881 =
      rs_R009_ueqv_R009NYYYY_partial_10_0877 := by
  native_decide

/-- Coefficient term 878 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0878 : Poly :=
[
  term ((-738004806521 : Rat) / 12744762240) [(15, 2)]
]

/-- Partial product 878 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0878 : Poly :=
[
  term ((-738004806521 : Rat) / 6372381120) [(2, 1), (15, 2)],
  term ((738004806521 : Rat) / 12744762240) [(15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 878 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0878_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0878
        rs_R009_ueqv_R009NYYYY_generator_10_0800_0881 =
      rs_R009_ueqv_R009NYYYY_partial_10_0878 := by
  native_decide

/-- Coefficient term 879 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0879 : Poly :=
[
  term ((21091975 : Rat) / 1569552) [(15, 2), (16, 1)]
]

/-- Partial product 879 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0879 : Poly :=
[
  term ((21091975 : Rat) / 784776) [(2, 1), (15, 2), (16, 1)],
  term ((-21091975 : Rat) / 1569552) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 879 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0879_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0879
        rs_R009_ueqv_R009NYYYY_generator_10_0800_0881 =
      rs_R009_ueqv_R009NYYYY_partial_10_0879 := by
  native_decide

/-- Coefficient term 880 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0880 : Poly :=
[
  term ((416226777467 : Rat) / 3186190560) [(15, 4)]
]

/-- Partial product 880 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0880 : Poly :=
[
  term ((416226777467 : Rat) / 1593095280) [(2, 1), (15, 4)],
  term ((-416226777467 : Rat) / 3186190560) [(15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 880 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0880_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0880
        rs_R009_ueqv_R009NYYYY_generator_10_0800_0881 =
      rs_R009_ueqv_R009NYYYY_partial_10_0880 := by
  native_decide

/-- Coefficient term 881 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0881 : Poly :=
[
  term ((-9948101 : Rat) / 392388) [(15, 4), (16, 1)]
]

/-- Partial product 881 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0881 : Poly :=
[
  term ((-9948101 : Rat) / 196194) [(2, 1), (15, 4), (16, 1)],
  term ((9948101 : Rat) / 392388) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 881 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0881_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0881
        rs_R009_ueqv_R009NYYYY_generator_10_0800_0881 =
      rs_R009_ueqv_R009NYYYY_partial_10_0881 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NYYYY_partials_10_0800_0881 : List Poly :=
[
  rs_R009_ueqv_R009NYYYY_partial_10_0800,
  rs_R009_ueqv_R009NYYYY_partial_10_0801,
  rs_R009_ueqv_R009NYYYY_partial_10_0802,
  rs_R009_ueqv_R009NYYYY_partial_10_0803,
  rs_R009_ueqv_R009NYYYY_partial_10_0804,
  rs_R009_ueqv_R009NYYYY_partial_10_0805,
  rs_R009_ueqv_R009NYYYY_partial_10_0806,
  rs_R009_ueqv_R009NYYYY_partial_10_0807,
  rs_R009_ueqv_R009NYYYY_partial_10_0808,
  rs_R009_ueqv_R009NYYYY_partial_10_0809,
  rs_R009_ueqv_R009NYYYY_partial_10_0810,
  rs_R009_ueqv_R009NYYYY_partial_10_0811,
  rs_R009_ueqv_R009NYYYY_partial_10_0812,
  rs_R009_ueqv_R009NYYYY_partial_10_0813,
  rs_R009_ueqv_R009NYYYY_partial_10_0814,
  rs_R009_ueqv_R009NYYYY_partial_10_0815,
  rs_R009_ueqv_R009NYYYY_partial_10_0816,
  rs_R009_ueqv_R009NYYYY_partial_10_0817,
  rs_R009_ueqv_R009NYYYY_partial_10_0818,
  rs_R009_ueqv_R009NYYYY_partial_10_0819,
  rs_R009_ueqv_R009NYYYY_partial_10_0820,
  rs_R009_ueqv_R009NYYYY_partial_10_0821,
  rs_R009_ueqv_R009NYYYY_partial_10_0822,
  rs_R009_ueqv_R009NYYYY_partial_10_0823,
  rs_R009_ueqv_R009NYYYY_partial_10_0824,
  rs_R009_ueqv_R009NYYYY_partial_10_0825,
  rs_R009_ueqv_R009NYYYY_partial_10_0826,
  rs_R009_ueqv_R009NYYYY_partial_10_0827,
  rs_R009_ueqv_R009NYYYY_partial_10_0828,
  rs_R009_ueqv_R009NYYYY_partial_10_0829,
  rs_R009_ueqv_R009NYYYY_partial_10_0830,
  rs_R009_ueqv_R009NYYYY_partial_10_0831,
  rs_R009_ueqv_R009NYYYY_partial_10_0832,
  rs_R009_ueqv_R009NYYYY_partial_10_0833,
  rs_R009_ueqv_R009NYYYY_partial_10_0834,
  rs_R009_ueqv_R009NYYYY_partial_10_0835,
  rs_R009_ueqv_R009NYYYY_partial_10_0836,
  rs_R009_ueqv_R009NYYYY_partial_10_0837,
  rs_R009_ueqv_R009NYYYY_partial_10_0838,
  rs_R009_ueqv_R009NYYYY_partial_10_0839,
  rs_R009_ueqv_R009NYYYY_partial_10_0840,
  rs_R009_ueqv_R009NYYYY_partial_10_0841,
  rs_R009_ueqv_R009NYYYY_partial_10_0842,
  rs_R009_ueqv_R009NYYYY_partial_10_0843,
  rs_R009_ueqv_R009NYYYY_partial_10_0844,
  rs_R009_ueqv_R009NYYYY_partial_10_0845,
  rs_R009_ueqv_R009NYYYY_partial_10_0846,
  rs_R009_ueqv_R009NYYYY_partial_10_0847,
  rs_R009_ueqv_R009NYYYY_partial_10_0848,
  rs_R009_ueqv_R009NYYYY_partial_10_0849,
  rs_R009_ueqv_R009NYYYY_partial_10_0850,
  rs_R009_ueqv_R009NYYYY_partial_10_0851,
  rs_R009_ueqv_R009NYYYY_partial_10_0852,
  rs_R009_ueqv_R009NYYYY_partial_10_0853,
  rs_R009_ueqv_R009NYYYY_partial_10_0854,
  rs_R009_ueqv_R009NYYYY_partial_10_0855,
  rs_R009_ueqv_R009NYYYY_partial_10_0856,
  rs_R009_ueqv_R009NYYYY_partial_10_0857,
  rs_R009_ueqv_R009NYYYY_partial_10_0858,
  rs_R009_ueqv_R009NYYYY_partial_10_0859,
  rs_R009_ueqv_R009NYYYY_partial_10_0860,
  rs_R009_ueqv_R009NYYYY_partial_10_0861,
  rs_R009_ueqv_R009NYYYY_partial_10_0862,
  rs_R009_ueqv_R009NYYYY_partial_10_0863,
  rs_R009_ueqv_R009NYYYY_partial_10_0864,
  rs_R009_ueqv_R009NYYYY_partial_10_0865,
  rs_R009_ueqv_R009NYYYY_partial_10_0866,
  rs_R009_ueqv_R009NYYYY_partial_10_0867,
  rs_R009_ueqv_R009NYYYY_partial_10_0868,
  rs_R009_ueqv_R009NYYYY_partial_10_0869,
  rs_R009_ueqv_R009NYYYY_partial_10_0870,
  rs_R009_ueqv_R009NYYYY_partial_10_0871,
  rs_R009_ueqv_R009NYYYY_partial_10_0872,
  rs_R009_ueqv_R009NYYYY_partial_10_0873,
  rs_R009_ueqv_R009NYYYY_partial_10_0874,
  rs_R009_ueqv_R009NYYYY_partial_10_0875,
  rs_R009_ueqv_R009NYYYY_partial_10_0876,
  rs_R009_ueqv_R009NYYYY_partial_10_0877,
  rs_R009_ueqv_R009NYYYY_partial_10_0878,
  rs_R009_ueqv_R009NYYYY_partial_10_0879,
  rs_R009_ueqv_R009NYYYY_partial_10_0880,
  rs_R009_ueqv_R009NYYYY_partial_10_0881
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NYYYY_block_10_0800_0881 : Poly :=
[
  term ((-29230333308 : Rat) / 33189485) [(2, 1), (11, 1), (12, 2), (15, 3)],
  term ((5550912 : Rat) / 32699) [(2, 1), (11, 1), (12, 2), (15, 3), (16, 1)],
  term ((-3221133967 : Rat) / 14224065) [(2, 1), (11, 1), (13, 1), (15, 2)],
  term ((4073074 : Rat) / 98097) [(2, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((1937837000 : Rat) / 6637897) [(2, 1), (11, 1), (13, 1), (15, 4)],
  term ((-1840000 : Rat) / 32699) [(2, 1), (11, 1), (13, 1), (15, 4), (16, 1)],
  term ((75795128468 : Rat) / 33189485) [(2, 1), (11, 1), (13, 2), (15, 1)],
  term ((-14466112 : Rat) / 32699) [(2, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((968918500 : Rat) / 948271) [(2, 1), (11, 1), (13, 2), (15, 3)],
  term ((-6440000 : Rat) / 32699) [(2, 1), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((134853541099 : Rat) / 398273820) [(2, 1), (11, 1), (15, 1)],
  term ((-6473554 : Rat) / 98097) [(2, 1), (11, 1), (15, 1), (16, 1)],
  term ((-20088499137 : Rat) / 18965420) [(2, 1), (11, 1), (15, 3)],
  term ((6672566 : Rat) / 32699) [(2, 1), (11, 1), (15, 3), (16, 1)],
  term ((-22850973904 : Rat) / 33189485) [(2, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((4339456 : Rat) / 32699) [(2, 1), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((92520089728 : Rat) / 33189485) [(2, 1), (11, 2), (12, 1), (13, 1), (15, 3)],
  term ((-17569792 : Rat) / 32699) [(2, 1), (11, 2), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-27532788096 : Rat) / 33189485) [(2, 1), (11, 2), (12, 1), (13, 2), (15, 2)],
  term ((5228544 : Rat) / 32699) [(2, 1), (11, 2), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((23595103312 : Rat) / 33189485) [(2, 1), (11, 2), (12, 1), (15, 2)],
  term ((-4480768 : Rat) / 32699) [(2, 1), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((-75219080992 : Rat) / 33189485) [(2, 1), (11, 2), (12, 1), (15, 4)],
  term ((14284288 : Rat) / 32699) [(2, 1), (11, 2), (12, 1), (15, 4), (16, 1)],
  term ((13766394048 : Rat) / 33189485) [(2, 1), (11, 2), (12, 2), (13, 1), (15, 1)],
  term ((-2614272 : Rat) / 32699) [(2, 1), (11, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-186032352 : Rat) / 1144465) [(2, 1), (11, 2), (12, 2), (15, 2)],
  term ((1024512 : Rat) / 32699) [(2, 1), (11, 2), (12, 2), (15, 2), (16, 1)],
  term ((8007142484 : Rat) / 33189485) [(2, 1), (11, 2), (13, 1), (15, 1)],
  term ((-1520576 : Rat) / 32699) [(2, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((19285353824 : Rat) / 33189485) [(2, 1), (11, 2), (13, 1), (15, 3)],
  term ((-3662336 : Rat) / 32699) [(2, 1), (11, 2), (13, 1), (15, 3), (16, 1)],
  term ((-16618890112 : Rat) / 33189485) [(2, 1), (11, 2), (13, 2), (15, 2)],
  term ((3155968 : Rat) / 32699) [(2, 1), (11, 2), (13, 2), (15, 2), (16, 1)],
  term ((1585150666 : Rat) / 6637897) [(2, 1), (11, 2), (15, 2)],
  term ((-1505120 : Rat) / 32699) [(2, 1), (11, 2), (15, 2), (16, 1)],
  term ((976669848 : Rat) / 4741355) [(2, 1), (11, 2), (15, 4)],
  term ((-1298304 : Rat) / 32699) [(2, 1), (11, 2), (15, 4), (16, 1)],
  term ((-2976517632 : Rat) / 33189485) [(2, 1), (11, 3), (12, 1), (13, 1), (15, 2)],
  term ((565248 : Rat) / 32699) [(2, 1), (11, 3), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((62010784 : Rat) / 33189485) [(2, 1), (11, 3), (12, 1), (15, 1)],
  term ((-11776 : Rat) / 32699) [(2, 1), (11, 3), (12, 1), (15, 1), (16, 1)],
  term ((744129408 : Rat) / 33189485) [(2, 1), (11, 3), (12, 1), (15, 3)],
  term ((-141312 : Rat) / 32699) [(2, 1), (11, 3), (12, 1), (15, 3), (16, 1)],
  term ((-124021568 : Rat) / 33189485) [(2, 1), (11, 3), (13, 1), (15, 2)],
  term ((23552 : Rat) / 32699) [(2, 1), (11, 3), (13, 1), (15, 2), (16, 1)],
  term ((1488258816 : Rat) / 33189485) [(2, 1), (11, 3), (13, 2), (15, 1)],
  term ((-282624 : Rat) / 32699) [(2, 1), (11, 3), (13, 2), (15, 1), (16, 1)],
  term ((31005392 : Rat) / 33189485) [(2, 1), (11, 3), (15, 1)],
  term ((-5888 : Rat) / 32699) [(2, 1), (11, 3), (15, 1), (16, 1)],
  term ((-62010784 : Rat) / 33189485) [(2, 1), (11, 3), (15, 3)],
  term ((11776 : Rat) / 32699) [(2, 1), (11, 3), (15, 3), (16, 1)],
  term ((-567 : Rat) / 160) [(2, 1), (12, 1)],
  term ((-679016479325 : Rat) / 318619056) [(2, 1), (12, 1), (13, 1), (15, 1)],
  term ((80009129 : Rat) / 196194) [(2, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((603340254457 : Rat) / 56896260) [(2, 1), (12, 1), (13, 1), (15, 3)],
  term ((-201114622 : Rat) / 98097) [(2, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-123 : Rat) / 10) [(2, 1), (12, 1), (13, 2)],
  term ((-468254984987 : Rat) / 66378970) [(2, 1), (12, 1), (13, 2), (15, 2)],
  term ((44649532 : Rat) / 32699) [(2, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((9525066138 : Rat) / 4741355) [(2, 1), (12, 1), (15, 2)],
  term ((-38318891 : Rat) / 98097) [(2, 1), (12, 1), (15, 2), (16, 1)],
  term ((-190204212605 : Rat) / 79654764) [(2, 1), (12, 1), (15, 4)],
  term ((15151882 : Rat) / 32699) [(2, 1), (12, 1), (15, 4), (16, 1)],
  term ((26 : Rat) / 5) [(2, 1), (12, 2)],
  term ((365213948391 : Rat) / 132757940) [(2, 1), (12, 2), (13, 1), (15, 1)],
  term ((-17241566 : Rat) / 32699) [(2, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-25904848343 : Rat) / 13974520) [(2, 1), (12, 2), (15, 2)],
  term ((619643 : Rat) / 1721) [(2, 1), (12, 2), (15, 2), (16, 1)],
  term ((35858084063 : Rat) / 1062063520) [(2, 1), (13, 1), (15, 1)],
  term ((-1045775 : Rat) / 392388) [(2, 1), (13, 1), (15, 1), (16, 1)],
  term ((-83441959017 : Rat) / 132757940) [(2, 1), (13, 1), (15, 3)],
  term ((11904206 : Rat) / 98097) [(2, 1), (13, 1), (15, 3), (16, 1)],
  term ((-283 : Rat) / 40) [(2, 1), (13, 2)],
  term ((-189973682117 : Rat) / 113792520) [(2, 1), (13, 2), (15, 2)],
  term ((31508419 : Rat) / 98097) [(2, 1), (13, 2), (15, 2), (16, 1)],
  term ((5315344096 : Rat) / 6637897) [(2, 1), (13, 3), (15, 1)],
  term ((-5083200 : Rat) / 32699) [(2, 1), (13, 3), (15, 1), (16, 1)],
  term ((-738004806521 : Rat) / 6372381120) [(2, 1), (15, 2)],
  term ((21091975 : Rat) / 784776) [(2, 1), (15, 2), (16, 1)],
  term ((416226777467 : Rat) / 1593095280) [(2, 1), (15, 4)],
  term ((-9948101 : Rat) / 196194) [(2, 1), (15, 4), (16, 1)],
  term ((14615166654 : Rat) / 33189485) [(11, 1), (12, 2), (15, 3)],
  term ((-2775456 : Rat) / 32699) [(11, 1), (12, 2), (15, 3), (16, 1)],
  term ((3221133967 : Rat) / 28448130) [(11, 1), (13, 1), (15, 2)],
  term ((-2036537 : Rat) / 98097) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-968918500 : Rat) / 6637897) [(11, 1), (13, 1), (15, 4)],
  term ((920000 : Rat) / 32699) [(11, 1), (13, 1), (15, 4), (16, 1)],
  term ((-37897564234 : Rat) / 33189485) [(11, 1), (13, 2), (15, 1)],
  term ((7233056 : Rat) / 32699) [(11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-484459250 : Rat) / 948271) [(11, 1), (13, 2), (15, 3)],
  term ((3220000 : Rat) / 32699) [(11, 1), (13, 2), (15, 3), (16, 1)],
  term ((-134853541099 : Rat) / 796547640) [(11, 1), (15, 1)],
  term ((3236777 : Rat) / 98097) [(11, 1), (15, 1), (16, 1)],
  term ((20088499137 : Rat) / 37930840) [(11, 1), (15, 3)],
  term ((-3336283 : Rat) / 32699) [(11, 1), (15, 3), (16, 1)],
  term ((11425486952 : Rat) / 33189485) [(11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-2169728 : Rat) / 32699) [(11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-46260044864 : Rat) / 33189485) [(11, 2), (12, 1), (13, 1), (15, 3)],
  term ((8784896 : Rat) / 32699) [(11, 2), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((13766394048 : Rat) / 33189485) [(11, 2), (12, 1), (13, 2), (15, 2)],
  term ((-2614272 : Rat) / 32699) [(11, 2), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-11797551656 : Rat) / 33189485) [(11, 2), (12, 1), (15, 2)],
  term ((2240384 : Rat) / 32699) [(11, 2), (12, 1), (15, 2), (16, 1)],
  term ((37609540496 : Rat) / 33189485) [(11, 2), (12, 1), (15, 4)],
  term ((-7142144 : Rat) / 32699) [(11, 2), (12, 1), (15, 4), (16, 1)],
  term ((-6883197024 : Rat) / 33189485) [(11, 2), (12, 2), (13, 1), (15, 1)],
  term ((1307136 : Rat) / 32699) [(11, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((93016176 : Rat) / 1144465) [(11, 2), (12, 2), (15, 2)],
  term ((-512256 : Rat) / 32699) [(11, 2), (12, 2), (15, 2), (16, 1)],
  term ((-4003571242 : Rat) / 33189485) [(11, 2), (13, 1), (15, 1)],
  term ((760288 : Rat) / 32699) [(11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-9642676912 : Rat) / 33189485) [(11, 2), (13, 1), (15, 3)],
  term ((1831168 : Rat) / 32699) [(11, 2), (13, 1), (15, 3), (16, 1)],
  term ((8309445056 : Rat) / 33189485) [(11, 2), (13, 2), (15, 2)],
  term ((-1577984 : Rat) / 32699) [(11, 2), (13, 2), (15, 2), (16, 1)],
  term ((-792575333 : Rat) / 6637897) [(11, 2), (15, 2)],
  term ((752560 : Rat) / 32699) [(11, 2), (15, 2), (16, 1)],
  term ((-488334924 : Rat) / 4741355) [(11, 2), (15, 4)],
  term ((649152 : Rat) / 32699) [(11, 2), (15, 4), (16, 1)],
  term ((1488258816 : Rat) / 33189485) [(11, 3), (12, 1), (13, 1), (15, 2)],
  term ((-282624 : Rat) / 32699) [(11, 3), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-31005392 : Rat) / 33189485) [(11, 3), (12, 1), (15, 1)],
  term ((5888 : Rat) / 32699) [(11, 3), (12, 1), (15, 1), (16, 1)],
  term ((-372064704 : Rat) / 33189485) [(11, 3), (12, 1), (15, 3)],
  term ((70656 : Rat) / 32699) [(11, 3), (12, 1), (15, 3), (16, 1)],
  term ((62010784 : Rat) / 33189485) [(11, 3), (13, 1), (15, 2)],
  term ((-11776 : Rat) / 32699) [(11, 3), (13, 1), (15, 2), (16, 1)],
  term ((-744129408 : Rat) / 33189485) [(11, 3), (13, 2), (15, 1)],
  term ((141312 : Rat) / 32699) [(11, 3), (13, 2), (15, 1), (16, 1)],
  term ((-15502696 : Rat) / 33189485) [(11, 3), (15, 1)],
  term ((2944 : Rat) / 32699) [(11, 3), (15, 1), (16, 1)],
  term ((31005392 : Rat) / 33189485) [(11, 3), (15, 3)],
  term ((-5888 : Rat) / 32699) [(11, 3), (15, 3), (16, 1)],
  term ((567 : Rat) / 320) [(12, 1)],
  term ((679016479325 : Rat) / 637238112) [(12, 1), (13, 1), (15, 1)],
  term ((-80009129 : Rat) / 392388) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-603340254457 : Rat) / 113792520) [(12, 1), (13, 1), (15, 3)],
  term ((100557311 : Rat) / 98097) [(12, 1), (13, 1), (15, 3), (16, 1)],
  term ((123 : Rat) / 20) [(12, 1), (13, 2)],
  term ((468254984987 : Rat) / 132757940) [(12, 1), (13, 2), (15, 2)],
  term ((-22324766 : Rat) / 32699) [(12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-4762533069 : Rat) / 4741355) [(12, 1), (15, 2)],
  term ((38318891 : Rat) / 196194) [(12, 1), (15, 2), (16, 1)],
  term ((190204212605 : Rat) / 159309528) [(12, 1), (15, 4)],
  term ((-7575941 : Rat) / 32699) [(12, 1), (15, 4), (16, 1)],
  term ((-13 : Rat) / 5) [(12, 2)],
  term ((-365213948391 : Rat) / 265515880) [(12, 2), (13, 1), (15, 1)],
  term ((8620783 : Rat) / 32699) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((25904848343 : Rat) / 27949040) [(12, 2), (15, 2)],
  term ((-619643 : Rat) / 3442) [(12, 2), (15, 2), (16, 1)],
  term ((-35858084063 : Rat) / 2124127040) [(13, 1), (15, 1)],
  term ((1045775 : Rat) / 784776) [(13, 1), (15, 1), (16, 1)],
  term ((83441959017 : Rat) / 265515880) [(13, 1), (15, 3)],
  term ((-5952103 : Rat) / 98097) [(13, 1), (15, 3), (16, 1)],
  term ((283 : Rat) / 80) [(13, 2)],
  term ((189973682117 : Rat) / 227585040) [(13, 2), (15, 2)],
  term ((-31508419 : Rat) / 196194) [(13, 2), (15, 2), (16, 1)],
  term ((-2657672048 : Rat) / 6637897) [(13, 3), (15, 1)],
  term ((2541600 : Rat) / 32699) [(13, 3), (15, 1), (16, 1)],
  term ((738004806521 : Rat) / 12744762240) [(15, 2)],
  term ((-21091975 : Rat) / 1569552) [(15, 2), (16, 1)],
  term ((-416226777467 : Rat) / 3186190560) [(15, 4)],
  term ((9948101 : Rat) / 392388) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 10, terms 800 through 881. -/
theorem rs_R009_ueqv_R009NYYYY_block_10_0800_0881_valid :
    checkProductSumEq rs_R009_ueqv_R009NYYYY_partials_10_0800_0881
      rs_R009_ueqv_R009NYYYY_block_10_0800_0881 = true := by
  native_decide

end R009UeqvR009NYYYYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
