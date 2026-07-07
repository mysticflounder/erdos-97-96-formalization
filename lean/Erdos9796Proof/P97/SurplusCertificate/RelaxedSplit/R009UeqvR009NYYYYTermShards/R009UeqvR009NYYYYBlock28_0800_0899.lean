/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NYYYY, term block 28:800-899

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NYYYYTermShards

/-- Generator polynomial 28 for relaxed split surplus certificate `R009:u=v:R009NYYYY`. -/
def rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(14, 1)]
]

/-- Coefficient term 800 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0800 : Poly :=
[
  term ((5 : Rat) / 8) [(8, 1), (9, 1), (13, 1)]
]

/-- Partial product 800 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0800 : Poly :=
[
  term ((-5 : Rat) / 8) [(8, 1), (9, 1), (13, 1)],
  term ((5 : Rat) / 4) [(8, 1), (9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 800 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0800_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0800
        rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYYYY_partial_28_0800 := by
  native_decide

/-- Coefficient term 801 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0801 : Poly :=
[
  term ((5 : Rat) / 4) [(8, 1), (9, 1), (13, 1), (14, 1)]
]

/-- Partial product 801 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0801 : Poly :=
[
  term ((-5 : Rat) / 4) [(8, 1), (9, 1), (13, 1), (14, 1)],
  term ((5 : Rat) / 2) [(8, 1), (9, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 801 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0801_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0801
        rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYYYY_partial_28_0801 := by
  native_decide

/-- Coefficient term 802 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0802 : Poly :=
[
  term ((40 : Rat) / 29) [(8, 1), (9, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 802 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0802 : Poly :=
[
  term ((-40 : Rat) / 29) [(8, 1), (9, 1), (13, 1), (14, 1), (15, 2)],
  term ((80 : Rat) / 29) [(8, 1), (9, 1), (13, 1), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 802 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0802_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0802
        rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYYYY_partial_28_0802 := by
  native_decide

/-- Coefficient term 803 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0803 : Poly :=
[
  term ((20 : Rat) / 29) [(8, 1), (9, 1), (13, 1), (15, 2)]
]

/-- Partial product 803 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0803 : Poly :=
[
  term ((40 : Rat) / 29) [(8, 1), (9, 1), (13, 1), (14, 1), (15, 2)],
  term ((-20 : Rat) / 29) [(8, 1), (9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 803 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0803_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0803
        rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYYYY_partial_28_0803 := by
  native_decide

/-- Coefficient term 804 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0804 : Poly :=
[
  term ((213 : Rat) / 58) [(8, 1), (9, 1), (14, 1), (15, 1)]
]

/-- Partial product 804 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0804 : Poly :=
[
  term ((-213 : Rat) / 58) [(8, 1), (9, 1), (14, 1), (15, 1)],
  term ((213 : Rat) / 29) [(8, 1), (9, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 804 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0804_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0804
        rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYYYY_partial_28_0804 := by
  native_decide

/-- Coefficient term 805 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0805 : Poly :=
[
  term ((213 : Rat) / 116) [(8, 1), (9, 1), (15, 1)]
]

/-- Partial product 805 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0805 : Poly :=
[
  term ((213 : Rat) / 58) [(8, 1), (9, 1), (14, 1), (15, 1)],
  term ((-213 : Rat) / 116) [(8, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 805 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0805_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0805
        rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYYYY_partial_28_0805 := by
  native_decide

/-- Coefficient term 806 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0806 : Poly :=
[
  term ((2185880136 : Rat) / 33189485) [(8, 1), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 806 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0806 : Poly :=
[
  term ((4371760272 : Rat) / 33189485) [(8, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-2185880136 : Rat) / 33189485) [(8, 1), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 806 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0806_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0806
        rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYYYY_partial_28_0806 := by
  native_decide

/-- Coefficient term 807 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0807 : Poly :=
[
  term ((-415104 : Rat) / 32699) [(8, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 807 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0807 : Poly :=
[
  term ((-830208 : Rat) / 32699) [(8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((415104 : Rat) / 32699) [(8, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 807 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0807_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0807
        rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYYYY_partial_28_0807 := by
  native_decide

/-- Coefficient term 808 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0808 : Poly :=
[
  term ((-248043136 : Rat) / 33189485) [(8, 1), (10, 1), (11, 2), (13, 1), (15, 1)]
]

/-- Partial product 808 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0808 : Poly :=
[
  term ((-496086272 : Rat) / 33189485) [(8, 1), (10, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((248043136 : Rat) / 33189485) [(8, 1), (10, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 808 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0808_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0808
        rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYYYY_partial_28_0808 := by
  native_decide

/-- Coefficient term 809 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0809 : Poly :=
[
  term ((47104 : Rat) / 32699) [(8, 1), (10, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 809 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0809 : Poly :=
[
  term ((94208 : Rat) / 32699) [(8, 1), (10, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-47104 : Rat) / 32699) [(8, 1), (10, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 809 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0809_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0809
        rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYYYY_partial_28_0809 := by
  native_decide

/-- Coefficient term 810 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0810 : Poly :=
[
  term ((7973016144 : Rat) / 33189485) [(8, 1), (10, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 810 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0810 : Poly :=
[
  term ((15946032288 : Rat) / 33189485) [(8, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-7973016144 : Rat) / 33189485) [(8, 1), (10, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 810 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0810_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0810
        rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYYYY_partial_28_0810 := by
  native_decide

/-- Coefficient term 811 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0811 : Poly :=
[
  term ((-1524960 : Rat) / 32699) [(8, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 811 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0811 : Poly :=
[
  term ((-3049920 : Rat) / 32699) [(8, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1524960 : Rat) / 32699) [(8, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 811 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0811_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0811
        rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYYYY_partial_28_0811 := by
  native_decide

/-- Coefficient term 812 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0812 : Poly :=
[
  term ((5979762108 : Rat) / 33189485) [(8, 1), (10, 1), (12, 1), (15, 2)]
]

/-- Partial product 812 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0812 : Poly :=
[
  term ((11959524216 : Rat) / 33189485) [(8, 1), (10, 1), (12, 1), (14, 1), (15, 2)],
  term ((-5979762108 : Rat) / 33189485) [(8, 1), (10, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 812 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0812_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0812
        rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYYYY_partial_28_0812 := by
  native_decide

/-- Coefficient term 813 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0813 : Poly :=
[
  term ((-1143720 : Rat) / 32699) [(8, 1), (10, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 813 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0813 : Poly :=
[
  term ((-2287440 : Rat) / 32699) [(8, 1), (10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((1143720 : Rat) / 32699) [(8, 1), (10, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 813 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0813_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0813
        rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYYYY_partial_28_0813 := by
  native_decide

/-- Coefficient term 814 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0814 : Poly :=
[
  term ((-3986508072 : Rat) / 33189485) [(8, 1), (10, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 814 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0814 : Poly :=
[
  term ((3986508072 : Rat) / 33189485) [(8, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-7973016144 : Rat) / 33189485) [(8, 1), (10, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 814 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0814_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0814
        rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYYYY_partial_28_0814 := by
  native_decide

/-- Coefficient term 815 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0815 : Poly :=
[
  term ((762480 : Rat) / 32699) [(8, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 815 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0815 : Poly :=
[
  term ((-762480 : Rat) / 32699) [(8, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1524960 : Rat) / 32699) [(8, 1), (10, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 815 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0815_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0815
        rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYYYY_partial_28_0815 := by
  native_decide

/-- Coefficient term 816 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0816 : Poly :=
[
  term ((-9992156621 : Rat) / 19913691) [(8, 1), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 816 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0816 : Poly :=
[
  term ((-19984313242 : Rat) / 19913691) [(8, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((9992156621 : Rat) / 19913691) [(8, 1), (10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 816 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0816_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0816
        rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYYYY_partial_28_0816 := by
  native_decide

/-- Coefficient term 817 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0817 : Poly :=
[
  term ((9563728 : Rat) / 98097) [(8, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 817 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0817 : Poly :=
[
  term ((19127456 : Rat) / 98097) [(8, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9563728 : Rat) / 98097) [(8, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 817 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0817_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0817
        rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYYYY_partial_28_0817 := by
  native_decide

/-- Coefficient term 818 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0818 : Poly :=
[
  term ((-2989881054 : Rat) / 33189485) [(8, 1), (10, 1), (14, 1), (15, 2)]
]

/-- Partial product 818 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0818 : Poly :=
[
  term ((2989881054 : Rat) / 33189485) [(8, 1), (10, 1), (14, 1), (15, 2)],
  term ((-5979762108 : Rat) / 33189485) [(8, 1), (10, 1), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 818 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0818_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0818
        rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYYYY_partial_28_0818 := by
  native_decide

/-- Coefficient term 819 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0819 : Poly :=
[
  term ((571860 : Rat) / 32699) [(8, 1), (10, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 819 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0819 : Poly :=
[
  term ((-571860 : Rat) / 32699) [(8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((1143720 : Rat) / 32699) [(8, 1), (10, 1), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 819 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0819_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0819
        rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYYYY_partial_28_0819 := by
  native_decide

/-- Coefficient term 820 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0820 : Poly :=
[
  term ((-14326473487 : Rat) / 99568455) [(8, 1), (10, 1), (15, 2)]
]

/-- Partial product 820 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0820 : Poly :=
[
  term ((-28652946974 : Rat) / 99568455) [(8, 1), (10, 1), (14, 1), (15, 2)],
  term ((14326473487 : Rat) / 99568455) [(8, 1), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 820 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0820_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0820
        rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYYYY_partial_28_0820 := by
  native_decide

/-- Coefficient term 821 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0821 : Poly :=
[
  term ((2734156 : Rat) / 98097) [(8, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 821 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0821 : Poly :=
[
  term ((5468312 : Rat) / 98097) [(8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2734156 : Rat) / 98097) [(8, 1), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 821 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0821_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0821
        rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYYYY_partial_28_0821 := by
  native_decide

/-- Coefficient term 822 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0822 : Poly :=
[
  term ((5813511000 : Rat) / 6637897) [(8, 1), (11, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 822 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0822 : Poly :=
[
  term ((11627022000 : Rat) / 6637897) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-5813511000 : Rat) / 6637897) [(8, 1), (11, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 822 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0822_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0822
        rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYYYY_partial_28_0822 := by
  native_decide

/-- Coefficient term 823 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0823 : Poly :=
[
  term ((-5520000 : Rat) / 32699) [(8, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 823 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0823 : Poly :=
[
  term ((-11040000 : Rat) / 32699) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((5520000 : Rat) / 32699) [(8, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 823 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0823_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0823
        rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYYYY_partial_28_0823 := by
  native_decide

/-- Coefficient term 824 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0824 : Poly :=
[
  term ((-8684129044 : Rat) / 4741355) [(8, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 824 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0824 : Poly :=
[
  term ((-17368258088 : Rat) / 4741355) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((8684129044 : Rat) / 4741355) [(8, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 824 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0824_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0824
        rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYYYY_partial_28_0824 := by
  native_decide

/-- Coefficient term 825 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0825 : Poly :=
[
  term ((11633940 : Rat) / 32699) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 825 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0825 : Poly :=
[
  term ((23267880 : Rat) / 32699) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11633940 : Rat) / 32699) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 825 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0825_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0825
        rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYYYY_partial_28_0825 := by
  native_decide

/-- Coefficient term 826 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0826 : Poly :=
[
  term ((-7751348 : Rat) / 6637897) [(8, 1), (11, 1), (12, 1), (15, 3)]
]

/-- Partial product 826 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0826 : Poly :=
[
  term ((-15502696 : Rat) / 6637897) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 3)],
  term ((7751348 : Rat) / 6637897) [(8, 1), (11, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 826 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0826_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0826
        rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYYYY_partial_28_0826 := by
  native_decide

/-- Coefficient term 827 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0827 : Poly :=
[
  term ((7360 : Rat) / 32699) [(8, 1), (11, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 827 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0827 : Poly :=
[
  term ((14720 : Rat) / 32699) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-7360 : Rat) / 32699) [(8, 1), (11, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 827 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0827_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0827
        rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYYYY_partial_28_0827 := by
  native_decide

/-- Coefficient term 828 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0828 : Poly :=
[
  term ((-2899004152 : Rat) / 6637897) [(8, 1), (11, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 828 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0828 : Poly :=
[
  term ((2899004152 : Rat) / 6637897) [(8, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-5798008304 : Rat) / 6637897) [(8, 1), (11, 1), (13, 1), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 828 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0828_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0828
        rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYYYY_partial_28_0828 := by
  native_decide

/-- Coefficient term 829 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0829 : Poly :=
[
  term ((2752640 : Rat) / 32699) [(8, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 829 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0829 : Poly :=
[
  term ((-2752640 : Rat) / 32699) [(8, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((5505280 : Rat) / 32699) [(8, 1), (11, 1), (13, 1), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 829 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0829_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0829
        rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYYYY_partial_28_0829 := by
  native_decide

/-- Coefficient term 830 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0830 : Poly :=
[
  term ((-7278515772 : Rat) / 33189485) [(8, 1), (11, 1), (13, 1), (15, 2)]
]

/-- Partial product 830 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0830 : Poly :=
[
  term ((-14557031544 : Rat) / 33189485) [(8, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((7278515772 : Rat) / 33189485) [(8, 1), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 830 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0830_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0830
        rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYYYY_partial_28_0830 := by
  native_decide

/-- Coefficient term 831 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0831 : Poly :=
[
  term ((1382208 : Rat) / 32699) [(8, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 831 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0831 : Poly :=
[
  term ((2764416 : Rat) / 32699) [(8, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1382208 : Rat) / 32699) [(8, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 831 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0831_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0831
        rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYYYY_partial_28_0831 := by
  native_decide

/-- Coefficient term 832 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0832 : Poly :=
[
  term ((103812782827 : Rat) / 99568455) [(8, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 832 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0832 : Poly :=
[
  term ((-103812782827 : Rat) / 99568455) [(8, 1), (11, 1), (14, 1), (15, 1)],
  term ((207625565654 : Rat) / 99568455) [(8, 1), (11, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 832 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0832_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0832
        rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYYYY_partial_28_0832 := by
  native_decide

/-- Coefficient term 833 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0833 : Poly :=
[
  term ((-19877056 : Rat) / 98097) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 833 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0833 : Poly :=
[
  term ((19877056 : Rat) / 98097) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-39754112 : Rat) / 98097) [(8, 1), (11, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 833 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0833_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0833
        rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYYYY_partial_28_0833 := by
  native_decide

/-- Coefficient term 834 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0834 : Poly :=
[
  term ((91946274787 : Rat) / 199136910) [(8, 1), (11, 1), (15, 1)]
]

/-- Partial product 834 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0834 : Poly :=
[
  term ((91946274787 : Rat) / 99568455) [(8, 1), (11, 1), (14, 1), (15, 1)],
  term ((-91946274787 : Rat) / 199136910) [(8, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 834 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0834_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0834
        rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYYYY_partial_28_0834 := by
  native_decide

/-- Coefficient term 835 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0835 : Poly :=
[
  term ((-8803640 : Rat) / 98097) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 835 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0835 : Poly :=
[
  term ((-17607280 : Rat) / 98097) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((8803640 : Rat) / 98097) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 835 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0835_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0835
        rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYYYY_partial_28_0835 := by
  native_decide

/-- Coefficient term 836 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0836 : Poly :=
[
  term ((-13766394048 : Rat) / 33189485) [(8, 1), (11, 2), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 836 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0836 : Poly :=
[
  term ((-27532788096 : Rat) / 33189485) [(8, 1), (11, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((13766394048 : Rat) / 33189485) [(8, 1), (11, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 836 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0836_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0836
        rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYYYY_partial_28_0836 := by
  native_decide

/-- Coefficient term 837 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0837 : Poly :=
[
  term ((2614272 : Rat) / 32699) [(8, 1), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 837 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0837 : Poly :=
[
  term ((5228544 : Rat) / 32699) [(8, 1), (11, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2614272 : Rat) / 32699) [(8, 1), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 837 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0837_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0837
        rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYYYY_partial_28_0837 := by
  native_decide

/-- Coefficient term 838 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0838 : Poly :=
[
  term ((4092711744 : Rat) / 6637897) [(8, 1), (11, 2), (12, 1), (15, 2)]
]

/-- Partial product 838 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0838 : Poly :=
[
  term ((8185423488 : Rat) / 6637897) [(8, 1), (11, 2), (12, 1), (14, 1), (15, 2)],
  term ((-4092711744 : Rat) / 6637897) [(8, 1), (11, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 838 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0838_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0838
        rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYYYY_partial_28_0838 := by
  native_decide

/-- Coefficient term 839 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0839 : Poly :=
[
  term ((-3886080 : Rat) / 32699) [(8, 1), (11, 2), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 839 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0839 : Poly :=
[
  term ((-7772160 : Rat) / 32699) [(8, 1), (11, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((3886080 : Rat) / 32699) [(8, 1), (11, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 839 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0839_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0839
        rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYYYY_partial_28_0839 := by
  native_decide

/-- Coefficient term 840 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0840 : Poly :=
[
  term ((372064704 : Rat) / 1746815) [(8, 1), (11, 2), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 840 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0840 : Poly :=
[
  term ((-372064704 : Rat) / 1746815) [(8, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((744129408 : Rat) / 1746815) [(8, 1), (11, 2), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 840 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0840_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0840
        rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYYYY_partial_28_0840 := by
  native_decide

/-- Coefficient term 841 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0841 : Poly :=
[
  term ((-70656 : Rat) / 1721) [(8, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 841 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0841 : Poly :=
[
  term ((70656 : Rat) / 1721) [(8, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-141312 : Rat) / 1721) [(8, 1), (11, 2), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 841 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0841_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0841
        rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYYYY_partial_28_0841 := by
  native_decide

/-- Coefficient term 842 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0842 : Poly :=
[
  term ((434075488 : Rat) / 4741355) [(8, 1), (11, 2), (13, 1), (15, 1)]
]

/-- Partial product 842 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0842 : Poly :=
[
  term ((868150976 : Rat) / 4741355) [(8, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-434075488 : Rat) / 4741355) [(8, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 842 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0842_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0842
        rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYYYY_partial_28_0842 := by
  native_decide

/-- Coefficient term 843 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0843 : Poly :=
[
  term ((-577024 : Rat) / 32699) [(8, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 843 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0843 : Poly :=
[
  term ((-1154048 : Rat) / 32699) [(8, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((577024 : Rat) / 32699) [(8, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 843 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0843_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0843
        rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYYYY_partial_28_0843 := by
  native_decide

/-- Coefficient term 844 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0844 : Poly :=
[
  term ((-10262784752 : Rat) / 33189485) [(8, 1), (11, 2), (14, 1), (15, 2)]
]

/-- Partial product 844 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0844 : Poly :=
[
  term ((10262784752 : Rat) / 33189485) [(8, 1), (11, 2), (14, 1), (15, 2)],
  term ((-20525569504 : Rat) / 33189485) [(8, 1), (11, 2), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 844 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0844_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0844
        rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYYYY_partial_28_0844 := by
  native_decide

/-- Coefficient term 845 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0845 : Poly :=
[
  term ((1948928 : Rat) / 32699) [(8, 1), (11, 2), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 845 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0845 : Poly :=
[
  term ((-1948928 : Rat) / 32699) [(8, 1), (11, 2), (14, 1), (15, 2), (16, 1)],
  term ((3897856 : Rat) / 32699) [(8, 1), (11, 2), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 845 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0845_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0845
        rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYYYY_partial_28_0845 := by
  native_decide

/-- Coefficient term 846 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0846 : Poly :=
[
  term ((-5131392376 : Rat) / 33189485) [(8, 1), (11, 2), (15, 2)]
]

/-- Partial product 846 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0846 : Poly :=
[
  term ((-10262784752 : Rat) / 33189485) [(8, 1), (11, 2), (14, 1), (15, 2)],
  term ((5131392376 : Rat) / 33189485) [(8, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 846 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0846_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0846
        rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYYYY_partial_28_0846 := by
  native_decide

/-- Coefficient term 847 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0847 : Poly :=
[
  term ((974464 : Rat) / 32699) [(8, 1), (11, 2), (15, 2), (16, 1)]
]

/-- Partial product 847 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0847 : Poly :=
[
  term ((1948928 : Rat) / 32699) [(8, 1), (11, 2), (14, 1), (15, 2), (16, 1)],
  term ((-974464 : Rat) / 32699) [(8, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 847 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0847_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0847
        rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYYYY_partial_28_0847 := by
  native_decide

/-- Coefficient term 848 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0848 : Poly :=
[
  term ((-248043136 : Rat) / 33189485) [(8, 1), (11, 3), (12, 1), (15, 1)]
]

/-- Partial product 848 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0848 : Poly :=
[
  term ((-496086272 : Rat) / 33189485) [(8, 1), (11, 3), (12, 1), (14, 1), (15, 1)],
  term ((248043136 : Rat) / 33189485) [(8, 1), (11, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 848 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0848_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0848
        rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYYYY_partial_28_0848 := by
  native_decide

/-- Coefficient term 849 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0849 : Poly :=
[
  term ((47104 : Rat) / 32699) [(8, 1), (11, 3), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 849 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0849 : Poly :=
[
  term ((94208 : Rat) / 32699) [(8, 1), (11, 3), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-47104 : Rat) / 32699) [(8, 1), (11, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 849 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0849_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0849
        rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYYYY_partial_28_0849 := by
  native_decide

/-- Coefficient term 850 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0850 : Poly :=
[
  term ((124021568 : Rat) / 33189485) [(8, 1), (11, 3), (14, 1), (15, 1)]
]

/-- Partial product 850 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0850 : Poly :=
[
  term ((-124021568 : Rat) / 33189485) [(8, 1), (11, 3), (14, 1), (15, 1)],
  term ((248043136 : Rat) / 33189485) [(8, 1), (11, 3), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 850 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0850_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0850
        rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYYYY_partial_28_0850 := by
  native_decide

/-- Coefficient term 851 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0851 : Poly :=
[
  term ((-23552 : Rat) / 32699) [(8, 1), (11, 3), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 851 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0851 : Poly :=
[
  term ((23552 : Rat) / 32699) [(8, 1), (11, 3), (14, 1), (15, 1), (16, 1)],
  term ((-47104 : Rat) / 32699) [(8, 1), (11, 3), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 851 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0851_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0851
        rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYYYY_partial_28_0851 := by
  native_decide

/-- Coefficient term 852 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0852 : Poly :=
[
  term ((62010784 : Rat) / 33189485) [(8, 1), (11, 3), (15, 1)]
]

/-- Partial product 852 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0852 : Poly :=
[
  term ((124021568 : Rat) / 33189485) [(8, 1), (11, 3), (14, 1), (15, 1)],
  term ((-62010784 : Rat) / 33189485) [(8, 1), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 852 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0852_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0852
        rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYYYY_partial_28_0852 := by
  native_decide

/-- Coefficient term 853 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0853 : Poly :=
[
  term ((-11776 : Rat) / 32699) [(8, 1), (11, 3), (15, 1), (16, 1)]
]

/-- Partial product 853 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0853 : Poly :=
[
  term ((-23552 : Rat) / 32699) [(8, 1), (11, 3), (14, 1), (15, 1), (16, 1)],
  term ((11776 : Rat) / 32699) [(8, 1), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 853 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0853_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0853
        rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYYYY_partial_28_0853 := by
  native_decide

/-- Coefficient term 854 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0854 : Poly :=
[
  term ((27 : Rat) / 5) [(8, 1), (12, 1)]
]

/-- Partial product 854 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0854 : Poly :=
[
  term ((-27 : Rat) / 5) [(8, 1), (12, 1)],
  term ((54 : Rat) / 5) [(8, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 854 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0854_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0854
        rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYYYY_partial_28_0854 := by
  native_decide

/-- Coefficient term 855 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0855 : Poly :=
[
  term ((-144424777527 : Rat) / 53103176) [(8, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 855 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0855 : Poly :=
[
  term ((-144424777527 : Rat) / 26551588) [(8, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((144424777527 : Rat) / 53103176) [(8, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 855 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0855_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0855
        rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYYYY_partial_28_0855 := by
  native_decide

/-- Coefficient term 856 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0856 : Poly :=
[
  term ((17241566 : Rat) / 32699) [(8, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 856 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0856 : Poly :=
[
  term ((34483132 : Rat) / 32699) [(8, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-17241566 : Rat) / 32699) [(8, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 856 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0856_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0856
        rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYYYY_partial_28_0856 := by
  native_decide

/-- Coefficient term 857 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0857 : Poly :=
[
  term ((-61 : Rat) / 160) [(8, 1), (12, 1), (14, 1)]
]

/-- Partial product 857 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0857 : Poly :=
[
  term ((61 : Rat) / 160) [(8, 1), (12, 1), (14, 1)],
  term ((-61 : Rat) / 80) [(8, 1), (12, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 857 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0857_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0857
        rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYYYY_partial_28_0857 := by
  native_decide

/-- Coefficient term 858 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0858 : Poly :=
[
  term ((813184131611 : Rat) / 531031760) [(8, 1), (12, 1), (15, 2)]
]

/-- Partial product 858 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0858 : Poly :=
[
  term ((813184131611 : Rat) / 265515880) [(8, 1), (12, 1), (14, 1), (15, 2)],
  term ((-813184131611 : Rat) / 531031760) [(8, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 858 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0858_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0858
        rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYYYY_partial_28_0858 := by
  native_decide

/-- Coefficient term 859 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0859 : Poly :=
[
  term ((-9736537 : Rat) / 32699) [(8, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 859 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0859 : Poly :=
[
  term ((-19473074 : Rat) / 32699) [(8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((9736537 : Rat) / 32699) [(8, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 859 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0859_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0859
        rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYYYY_partial_28_0859 := by
  native_decide

/-- Coefficient term 860 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0860 : Poly :=
[
  term ((61 : Rat) / 80) [(8, 1), (12, 2)]
]

/-- Partial product 860 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0860 : Poly :=
[
  term ((-61 : Rat) / 80) [(8, 1), (12, 2)],
  term ((61 : Rat) / 40) [(8, 1), (12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 860 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0860_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0860
        rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYYYY_partial_28_0860 := by
  native_decide

/-- Coefficient term 861 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0861 : Poly :=
[
  term ((140042949377 : Rat) / 75861680) [(8, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 861 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0861 : Poly :=
[
  term ((-140042949377 : Rat) / 75861680) [(8, 1), (13, 1), (14, 1), (15, 1)],
  term ((140042949377 : Rat) / 37930840) [(8, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 861 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0861_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0861
        rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYYYY_partial_28_0861 := by
  native_decide

/-- Coefficient term 862 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0862 : Poly :=
[
  term ((-11663968 : Rat) / 32699) [(8, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 862 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0862 : Poly :=
[
  term ((11663968 : Rat) / 32699) [(8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-23327936 : Rat) / 32699) [(8, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 862 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0862_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0862
        rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYYYY_partial_28_0862 := by
  native_decide

/-- Coefficient term 863 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0863 : Poly :=
[
  term ((867739875631 : Rat) / 1062063520) [(8, 1), (13, 1), (15, 1)]
]

/-- Partial product 863 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0863 : Poly :=
[
  term ((867739875631 : Rat) / 531031760) [(8, 1), (13, 1), (14, 1), (15, 1)],
  term ((-867739875631 : Rat) / 1062063520) [(8, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 863 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0863_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0863
        rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYYYY_partial_28_0863 := by
  native_decide

/-- Coefficient term 864 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0864 : Poly :=
[
  term ((-5222288 : Rat) / 32699) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 864 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0864 : Poly :=
[
  term ((-10444576 : Rat) / 32699) [(8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((5222288 : Rat) / 32699) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 864 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0864_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0864
        rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYYYY_partial_28_0864 := by
  native_decide

/-- Coefficient term 865 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0865 : Poly :=
[
  term ((-267 : Rat) / 80) [(8, 1), (13, 2)]
]

/-- Partial product 865 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0865 : Poly :=
[
  term ((267 : Rat) / 80) [(8, 1), (13, 2)],
  term ((-267 : Rat) / 40) [(8, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 865 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0865_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0865
        rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYYYY_partial_28_0865 := by
  native_decide

/-- Coefficient term 866 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0866 : Poly :=
[
  term ((-267 : Rat) / 40) [(8, 1), (13, 2), (14, 1)]
]

/-- Partial product 866 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0866 : Poly :=
[
  term ((267 : Rat) / 40) [(8, 1), (13, 2), (14, 1)],
  term ((-267 : Rat) / 20) [(8, 1), (13, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 866 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0866_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0866
        rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYYYY_partial_28_0866 := by
  native_decide

/-- Coefficient term 867 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0867 : Poly :=
[
  term ((-897 : Rat) / 320) [(8, 1), (14, 1)]
]

/-- Partial product 867 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0867 : Poly :=
[
  term ((897 : Rat) / 320) [(8, 1), (14, 1)],
  term ((-897 : Rat) / 160) [(8, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 867 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0867_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0867
        rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYYYY_partial_28_0867 := by
  native_decide

/-- Coefficient term 868 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0868 : Poly :=
[
  term ((-713886046843 : Rat) / 796547640) [(8, 1), (14, 1), (15, 2)]
]

/-- Partial product 868 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0868 : Poly :=
[
  term ((713886046843 : Rat) / 796547640) [(8, 1), (14, 1), (15, 2)],
  term ((-713886046843 : Rat) / 398273820) [(8, 1), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 868 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0868_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0868
        rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYYYY_partial_28_0868 := by
  native_decide

/-- Coefficient term 869 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0869 : Poly :=
[
  term ((17064581 : Rat) / 98097) [(8, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 869 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0869 : Poly :=
[
  term ((-17064581 : Rat) / 98097) [(8, 1), (14, 1), (15, 2), (16, 1)],
  term ((34129162 : Rat) / 98097) [(8, 1), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 869 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0869_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0869
        rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYYYY_partial_28_0869 := by
  native_decide

/-- Coefficient term 870 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0870 : Poly :=
[
  term ((-142342953569 : Rat) / 318619056) [(8, 1), (15, 2)]
]

/-- Partial product 870 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0870 : Poly :=
[
  term ((-142342953569 : Rat) / 159309528) [(8, 1), (14, 1), (15, 2)],
  term ((142342953569 : Rat) / 318619056) [(8, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 870 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0870_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0870
        rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYYYY_partial_28_0870 := by
  native_decide

/-- Coefficient term 871 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0871 : Poly :=
[
  term ((17064581 : Rat) / 196194) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 871 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0871 : Poly :=
[
  term ((17064581 : Rat) / 98097) [(8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-17064581 : Rat) / 196194) [(8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 871 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0871_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0871
        rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYYYY_partial_28_0871 := by
  native_decide

/-- Coefficient term 872 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0872 : Poly :=
[
  term ((89 : Rat) / 80) [(8, 2)]
]

/-- Partial product 872 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0872 : Poly :=
[
  term ((-89 : Rat) / 80) [(8, 2)],
  term ((89 : Rat) / 40) [(8, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 872 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0872_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0872
        rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYYYY_partial_28_0872 := by
  native_decide

/-- Coefficient term 873 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0873 : Poly :=
[
  term ((-89 : Rat) / 20) [(8, 2), (12, 1)]
]

/-- Partial product 873 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0873 : Poly :=
[
  term ((89 : Rat) / 20) [(8, 2), (12, 1)],
  term ((-89 : Rat) / 10) [(8, 2), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 873 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0873_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0873
        rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYYYY_partial_28_0873 := by
  native_decide

/-- Coefficient term 874 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0874 : Poly :=
[
  term ((89 : Rat) / 40) [(8, 2), (14, 1)]
]

/-- Partial product 874 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0874 : Poly :=
[
  term ((-89 : Rat) / 40) [(8, 2), (14, 1)],
  term ((89 : Rat) / 20) [(8, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 874 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0874_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0874
        rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYYYY_partial_28_0874 := by
  native_decide

/-- Coefficient term 875 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0875 : Poly :=
[
  term ((62010784 : Rat) / 33189485) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 875 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0875 : Poly :=
[
  term ((124021568 : Rat) / 33189485) [(9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-62010784 : Rat) / 33189485) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 875 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0875_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0875
        rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYYYY_partial_28_0875 := by
  native_decide

/-- Coefficient term 876 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0876 : Poly :=
[
  term ((-11776 : Rat) / 32699) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 876 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0876 : Poly :=
[
  term ((-23552 : Rat) / 32699) [(9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((11776 : Rat) / 32699) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 876 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0876_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0876
        rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYYYY_partial_28_0876 := by
  native_decide

/-- Coefficient term 877 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0877 : Poly :=
[
  term ((-14 : Rat) / 29) [(9, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 877 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0877 : Poly :=
[
  term ((-28 : Rat) / 29) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((14 : Rat) / 29) [(9, 1), (10, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 877 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0877_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0877
        rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYYYY_partial_28_0877 := by
  native_decide

/-- Coefficient term 878 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0878 : Poly :=
[
  term ((8 : Rat) / 29) [(9, 1), (10, 1), (12, 1), (15, 3)]
]

/-- Partial product 878 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0878 : Poly :=
[
  term ((16 : Rat) / 29) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 3)],
  term ((-8 : Rat) / 29) [(9, 1), (10, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 878 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0878_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0878
        rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYYYY_partial_28_0878 := by
  native_decide

/-- Coefficient term 879 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0879 : Poly :=
[
  term ((-8 : Rat) / 29) [(9, 1), (10, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 879 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0879 : Poly :=
[
  term ((8 : Rat) / 29) [(9, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((-16 : Rat) / 29) [(9, 1), (10, 1), (13, 1), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 879 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0879_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0879
        rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYYYY_partial_28_0879 := by
  native_decide

/-- Coefficient term 880 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0880 : Poly :=
[
  term ((20 : Rat) / 29) [(9, 1), (10, 1), (13, 1), (15, 2)]
]

/-- Partial product 880 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0880 : Poly :=
[
  term ((40 : Rat) / 29) [(9, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((-20 : Rat) / 29) [(9, 1), (10, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 880 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0880_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0880
        rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYYYY_partial_28_0880 := by
  native_decide

/-- Coefficient term 881 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0881 : Poly :=
[
  term ((-5 : Rat) / 29) [(9, 1), (10, 1), (14, 1), (15, 1)]
]

/-- Partial product 881 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0881 : Poly :=
[
  term ((5 : Rat) / 29) [(9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-10 : Rat) / 29) [(9, 1), (10, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 881 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0881_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0881
        rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYYYY_partial_28_0881 := by
  native_decide

/-- Coefficient term 882 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0882 : Poly :=
[
  term ((22 : Rat) / 29) [(9, 1), (10, 1), (15, 1)]
]

/-- Partial product 882 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0882 : Poly :=
[
  term ((44 : Rat) / 29) [(9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-22 : Rat) / 29) [(9, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 882 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0882_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0882
        rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYYYY_partial_28_0882 := by
  native_decide

/-- Coefficient term 883 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0883 : Poly :=
[
  term ((-18 : Rat) / 29) [(9, 1), (10, 1), (15, 3)]
]

/-- Partial product 883 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0883 : Poly :=
[
  term ((-36 : Rat) / 29) [(9, 1), (10, 1), (14, 1), (15, 3)],
  term ((18 : Rat) / 29) [(9, 1), (10, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 883 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0883_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0883
        rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYYYY_partial_28_0883 := by
  native_decide

/-- Coefficient term 884 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0884 : Poly :=
[
  term ((193783700 : Rat) / 19913691) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 884 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0884 : Poly :=
[
  term ((387567400 : Rat) / 19913691) [(9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-193783700 : Rat) / 19913691) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 884 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0884_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0884
        rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYYYY_partial_28_0884 := by
  native_decide

/-- Coefficient term 885 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0885 : Poly :=
[
  term ((-184000 : Rat) / 98097) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 885 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0885 : Poly :=
[
  term ((-368000 : Rat) / 98097) [(9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((184000 : Rat) / 98097) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 885 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0885_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0885
        rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYYYY_partial_28_0885 := by
  native_decide

/-- Coefficient term 886 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0886 : Poly :=
[
  term ((-573599752 : Rat) / 99568455) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 3)]
]

/-- Partial product 886 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0886 : Poly :=
[
  term ((-1147199504 : Rat) / 99568455) [(9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 3)],
  term ((573599752 : Rat) / 99568455) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 886 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0886_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0886
        rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYYYY_partial_28_0886 := by
  native_decide

/-- Coefficient term 887 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0887 : Poly :=
[
  term ((108928 : Rat) / 98097) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 887 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0887 : Poly :=
[
  term ((217856 : Rat) / 98097) [(9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-108928 : Rat) / 98097) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 887 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0887_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0887
        rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYYYY_partial_28_0887 := by
  native_decide

/-- Coefficient term 888 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0888 : Poly :=
[
  term ((23254044 : Rat) / 33189485) [(9, 1), (11, 1), (12, 1), (14, 1), (15, 2)]
]

/-- Partial product 888 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0888 : Poly :=
[
  term ((-23254044 : Rat) / 33189485) [(9, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((46508088 : Rat) / 33189485) [(9, 1), (11, 1), (12, 1), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 888 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0888_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0888
        rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYYYY_partial_28_0888 := by
  native_decide

/-- Coefficient term 889 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0889 : Poly :=
[
  term ((-4416 : Rat) / 32699) [(9, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 889 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0889 : Poly :=
[
  term ((4416 : Rat) / 32699) [(9, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-8832 : Rat) / 32699) [(9, 1), (11, 1), (12, 1), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 889 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0889_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0889
        rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYYYY_partial_28_0889 := by
  native_decide

/-- Coefficient term 890 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0890 : Poly :=
[
  term ((144839036 : Rat) / 19913691) [(9, 1), (11, 1), (12, 1), (15, 2)]
]

/-- Partial product 890 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0890 : Poly :=
[
  term ((289678072 : Rat) / 19913691) [(9, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((-144839036 : Rat) / 19913691) [(9, 1), (11, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 890 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0890_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0890
        rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYYYY_partial_28_0890 := by
  native_decide

/-- Coefficient term 891 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0891 : Poly :=
[
  term ((-22080 : Rat) / 32699) [(9, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 891 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0891 : Poly :=
[
  term ((-44160 : Rat) / 32699) [(9, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((22080 : Rat) / 32699) [(9, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 891 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0891_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0891
        rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYYYY_partial_28_0891 := by
  native_decide

/-- Coefficient term 892 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0892 : Poly :=
[
  term ((-542375944 : Rat) / 99568455) [(9, 1), (11, 1), (12, 1), (15, 4)]
]

/-- Partial product 892 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0892 : Poly :=
[
  term ((-1084751888 : Rat) / 99568455) [(9, 1), (11, 1), (12, 1), (14, 1), (15, 4)],
  term ((542375944 : Rat) / 99568455) [(9, 1), (11, 1), (12, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 892 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0892_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0892
        rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYYYY_partial_28_0892 := by
  native_decide

/-- Coefficient term 893 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0893 : Poly :=
[
  term ((8832 : Rat) / 32699) [(9, 1), (11, 1), (12, 1), (15, 4), (16, 1)]
]

/-- Partial product 893 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0893 : Poly :=
[
  term ((17664 : Rat) / 32699) [(9, 1), (11, 1), (12, 1), (14, 1), (15, 4), (16, 1)],
  term ((-8832 : Rat) / 32699) [(9, 1), (11, 1), (12, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 893 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0893_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0893
        rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYYYY_partial_28_0893 := by
  native_decide

/-- Coefficient term 894 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0894 : Poly :=
[
  term ((-15502696 : Rat) / 6637897) [(9, 1), (11, 1), (12, 2), (13, 1), (15, 1)]
]

/-- Partial product 894 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0894 : Poly :=
[
  term ((-31005392 : Rat) / 6637897) [(9, 1), (11, 1), (12, 2), (13, 1), (14, 1), (15, 1)],
  term ((15502696 : Rat) / 6637897) [(9, 1), (11, 1), (12, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 894 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0894_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0894
        rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYYYY_partial_28_0894 := by
  native_decide

/-- Coefficient term 895 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0895 : Poly :=
[
  term ((14720 : Rat) / 32699) [(9, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 895 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0895 : Poly :=
[
  term ((29440 : Rat) / 32699) [(9, 1), (11, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-14720 : Rat) / 32699) [(9, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 895 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0895_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0895
        rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYYYY_partial_28_0895 := by
  native_decide

/-- Coefficient term 896 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0896 : Poly :=
[
  term ((-83130968 : Rat) / 33189485) [(9, 1), (11, 1), (12, 2), (15, 2)]
]

/-- Partial product 896 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0896 : Poly :=
[
  term ((-166261936 : Rat) / 33189485) [(9, 1), (11, 1), (12, 2), (14, 1), (15, 2)],
  term ((83130968 : Rat) / 33189485) [(9, 1), (11, 1), (12, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 896 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0896_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0896
        rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYYYY_partial_28_0896 := by
  native_decide

/-- Coefficient term 897 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0897 : Poly :=
[
  term ((8832 : Rat) / 32699) [(9, 1), (11, 1), (12, 2), (15, 2), (16, 1)]
]

/-- Partial product 897 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0897 : Poly :=
[
  term ((17664 : Rat) / 32699) [(9, 1), (11, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-8832 : Rat) / 32699) [(9, 1), (11, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 897 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0897_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0897
        rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYYYY_partial_28_0897 := by
  native_decide

/-- Coefficient term 898 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0898 : Poly :=
[
  term ((-8666920 : Rat) / 6637897) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 898 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0898 : Poly :=
[
  term ((8666920 : Rat) / 6637897) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-17333840 : Rat) / 6637897) [(9, 1), (11, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 898 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0898_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0898
        rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYYYY_partial_28_0898 := by
  native_decide

/-- Coefficient term 899 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0899 : Poly :=
[
  term ((7360 : Rat) / 32699) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 899 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0899 : Poly :=
[
  term ((-7360 : Rat) / 32699) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((14720 : Rat) / 32699) [(9, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 899 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0899_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0899
        rs_R009_ueqv_R009NYYYY_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYYYY_partial_28_0899 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NYYYY_partials_28_0800_0899 : List Poly :=
[
  rs_R009_ueqv_R009NYYYY_partial_28_0800,
  rs_R009_ueqv_R009NYYYY_partial_28_0801,
  rs_R009_ueqv_R009NYYYY_partial_28_0802,
  rs_R009_ueqv_R009NYYYY_partial_28_0803,
  rs_R009_ueqv_R009NYYYY_partial_28_0804,
  rs_R009_ueqv_R009NYYYY_partial_28_0805,
  rs_R009_ueqv_R009NYYYY_partial_28_0806,
  rs_R009_ueqv_R009NYYYY_partial_28_0807,
  rs_R009_ueqv_R009NYYYY_partial_28_0808,
  rs_R009_ueqv_R009NYYYY_partial_28_0809,
  rs_R009_ueqv_R009NYYYY_partial_28_0810,
  rs_R009_ueqv_R009NYYYY_partial_28_0811,
  rs_R009_ueqv_R009NYYYY_partial_28_0812,
  rs_R009_ueqv_R009NYYYY_partial_28_0813,
  rs_R009_ueqv_R009NYYYY_partial_28_0814,
  rs_R009_ueqv_R009NYYYY_partial_28_0815,
  rs_R009_ueqv_R009NYYYY_partial_28_0816,
  rs_R009_ueqv_R009NYYYY_partial_28_0817,
  rs_R009_ueqv_R009NYYYY_partial_28_0818,
  rs_R009_ueqv_R009NYYYY_partial_28_0819,
  rs_R009_ueqv_R009NYYYY_partial_28_0820,
  rs_R009_ueqv_R009NYYYY_partial_28_0821,
  rs_R009_ueqv_R009NYYYY_partial_28_0822,
  rs_R009_ueqv_R009NYYYY_partial_28_0823,
  rs_R009_ueqv_R009NYYYY_partial_28_0824,
  rs_R009_ueqv_R009NYYYY_partial_28_0825,
  rs_R009_ueqv_R009NYYYY_partial_28_0826,
  rs_R009_ueqv_R009NYYYY_partial_28_0827,
  rs_R009_ueqv_R009NYYYY_partial_28_0828,
  rs_R009_ueqv_R009NYYYY_partial_28_0829,
  rs_R009_ueqv_R009NYYYY_partial_28_0830,
  rs_R009_ueqv_R009NYYYY_partial_28_0831,
  rs_R009_ueqv_R009NYYYY_partial_28_0832,
  rs_R009_ueqv_R009NYYYY_partial_28_0833,
  rs_R009_ueqv_R009NYYYY_partial_28_0834,
  rs_R009_ueqv_R009NYYYY_partial_28_0835,
  rs_R009_ueqv_R009NYYYY_partial_28_0836,
  rs_R009_ueqv_R009NYYYY_partial_28_0837,
  rs_R009_ueqv_R009NYYYY_partial_28_0838,
  rs_R009_ueqv_R009NYYYY_partial_28_0839,
  rs_R009_ueqv_R009NYYYY_partial_28_0840,
  rs_R009_ueqv_R009NYYYY_partial_28_0841,
  rs_R009_ueqv_R009NYYYY_partial_28_0842,
  rs_R009_ueqv_R009NYYYY_partial_28_0843,
  rs_R009_ueqv_R009NYYYY_partial_28_0844,
  rs_R009_ueqv_R009NYYYY_partial_28_0845,
  rs_R009_ueqv_R009NYYYY_partial_28_0846,
  rs_R009_ueqv_R009NYYYY_partial_28_0847,
  rs_R009_ueqv_R009NYYYY_partial_28_0848,
  rs_R009_ueqv_R009NYYYY_partial_28_0849,
  rs_R009_ueqv_R009NYYYY_partial_28_0850,
  rs_R009_ueqv_R009NYYYY_partial_28_0851,
  rs_R009_ueqv_R009NYYYY_partial_28_0852,
  rs_R009_ueqv_R009NYYYY_partial_28_0853,
  rs_R009_ueqv_R009NYYYY_partial_28_0854,
  rs_R009_ueqv_R009NYYYY_partial_28_0855,
  rs_R009_ueqv_R009NYYYY_partial_28_0856,
  rs_R009_ueqv_R009NYYYY_partial_28_0857,
  rs_R009_ueqv_R009NYYYY_partial_28_0858,
  rs_R009_ueqv_R009NYYYY_partial_28_0859,
  rs_R009_ueqv_R009NYYYY_partial_28_0860,
  rs_R009_ueqv_R009NYYYY_partial_28_0861,
  rs_R009_ueqv_R009NYYYY_partial_28_0862,
  rs_R009_ueqv_R009NYYYY_partial_28_0863,
  rs_R009_ueqv_R009NYYYY_partial_28_0864,
  rs_R009_ueqv_R009NYYYY_partial_28_0865,
  rs_R009_ueqv_R009NYYYY_partial_28_0866,
  rs_R009_ueqv_R009NYYYY_partial_28_0867,
  rs_R009_ueqv_R009NYYYY_partial_28_0868,
  rs_R009_ueqv_R009NYYYY_partial_28_0869,
  rs_R009_ueqv_R009NYYYY_partial_28_0870,
  rs_R009_ueqv_R009NYYYY_partial_28_0871,
  rs_R009_ueqv_R009NYYYY_partial_28_0872,
  rs_R009_ueqv_R009NYYYY_partial_28_0873,
  rs_R009_ueqv_R009NYYYY_partial_28_0874,
  rs_R009_ueqv_R009NYYYY_partial_28_0875,
  rs_R009_ueqv_R009NYYYY_partial_28_0876,
  rs_R009_ueqv_R009NYYYY_partial_28_0877,
  rs_R009_ueqv_R009NYYYY_partial_28_0878,
  rs_R009_ueqv_R009NYYYY_partial_28_0879,
  rs_R009_ueqv_R009NYYYY_partial_28_0880,
  rs_R009_ueqv_R009NYYYY_partial_28_0881,
  rs_R009_ueqv_R009NYYYY_partial_28_0882,
  rs_R009_ueqv_R009NYYYY_partial_28_0883,
  rs_R009_ueqv_R009NYYYY_partial_28_0884,
  rs_R009_ueqv_R009NYYYY_partial_28_0885,
  rs_R009_ueqv_R009NYYYY_partial_28_0886,
  rs_R009_ueqv_R009NYYYY_partial_28_0887,
  rs_R009_ueqv_R009NYYYY_partial_28_0888,
  rs_R009_ueqv_R009NYYYY_partial_28_0889,
  rs_R009_ueqv_R009NYYYY_partial_28_0890,
  rs_R009_ueqv_R009NYYYY_partial_28_0891,
  rs_R009_ueqv_R009NYYYY_partial_28_0892,
  rs_R009_ueqv_R009NYYYY_partial_28_0893,
  rs_R009_ueqv_R009NYYYY_partial_28_0894,
  rs_R009_ueqv_R009NYYYY_partial_28_0895,
  rs_R009_ueqv_R009NYYYY_partial_28_0896,
  rs_R009_ueqv_R009NYYYY_partial_28_0897,
  rs_R009_ueqv_R009NYYYY_partial_28_0898,
  rs_R009_ueqv_R009NYYYY_partial_28_0899
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NYYYY_block_28_0800_0899 : Poly :=
[
  term ((-5 : Rat) / 8) [(8, 1), (9, 1), (13, 1)],
  term ((5 : Rat) / 2) [(8, 1), (9, 1), (13, 1), (14, 2)],
  term ((80 : Rat) / 29) [(8, 1), (9, 1), (13, 1), (14, 2), (15, 2)],
  term ((-20 : Rat) / 29) [(8, 1), (9, 1), (13, 1), (15, 2)],
  term ((213 : Rat) / 29) [(8, 1), (9, 1), (14, 2), (15, 1)],
  term ((-213 : Rat) / 116) [(8, 1), (9, 1), (15, 1)],
  term ((4371760272 : Rat) / 33189485) [(8, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-830208 : Rat) / 32699) [(8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2185880136 : Rat) / 33189485) [(8, 1), (10, 1), (11, 1), (15, 1)],
  term ((415104 : Rat) / 32699) [(8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-496086272 : Rat) / 33189485) [(8, 1), (10, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((94208 : Rat) / 32699) [(8, 1), (10, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((248043136 : Rat) / 33189485) [(8, 1), (10, 1), (11, 2), (13, 1), (15, 1)],
  term ((-47104 : Rat) / 32699) [(8, 1), (10, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((15946032288 : Rat) / 33189485) [(8, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-3049920 : Rat) / 32699) [(8, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7973016144 : Rat) / 33189485) [(8, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((1524960 : Rat) / 32699) [(8, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((11959524216 : Rat) / 33189485) [(8, 1), (10, 1), (12, 1), (14, 1), (15, 2)],
  term ((-2287440 : Rat) / 32699) [(8, 1), (10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-5979762108 : Rat) / 33189485) [(8, 1), (10, 1), (12, 1), (15, 2)],
  term ((1143720 : Rat) / 32699) [(8, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-87962041994 : Rat) / 99568455) [(8, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((16840016 : Rat) / 98097) [(8, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7973016144 : Rat) / 33189485) [(8, 1), (10, 1), (13, 1), (14, 2), (15, 1)],
  term ((1524960 : Rat) / 32699) [(8, 1), (10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((9992156621 : Rat) / 19913691) [(8, 1), (10, 1), (13, 1), (15, 1)],
  term ((-9563728 : Rat) / 98097) [(8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-19683303812 : Rat) / 99568455) [(8, 1), (10, 1), (14, 1), (15, 2)],
  term ((3752732 : Rat) / 98097) [(8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-5979762108 : Rat) / 33189485) [(8, 1), (10, 1), (14, 2), (15, 2)],
  term ((1143720 : Rat) / 32699) [(8, 1), (10, 1), (14, 2), (15, 2), (16, 1)],
  term ((14326473487 : Rat) / 99568455) [(8, 1), (10, 1), (15, 2)],
  term ((-2734156 : Rat) / 98097) [(8, 1), (10, 1), (15, 2), (16, 1)],
  term ((11627022000 : Rat) / 6637897) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-11040000 : Rat) / 32699) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-5813511000 : Rat) / 6637897) [(8, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((5520000 : Rat) / 32699) [(8, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-17368258088 : Rat) / 4741355) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((23267880 : Rat) / 32699) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-15502696 : Rat) / 6637897) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 3)],
  term ((14720 : Rat) / 32699) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((8684129044 : Rat) / 4741355) [(8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-11633940 : Rat) / 32699) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((7751348 : Rat) / 6637897) [(8, 1), (11, 1), (12, 1), (15, 3)],
  term ((-7360 : Rat) / 32699) [(8, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-62010784 : Rat) / 33189485) [(8, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((11776 : Rat) / 32699) [(8, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-5798008304 : Rat) / 6637897) [(8, 1), (11, 1), (13, 1), (14, 2), (15, 2)],
  term ((5505280 : Rat) / 32699) [(8, 1), (11, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((7278515772 : Rat) / 33189485) [(8, 1), (11, 1), (13, 1), (15, 2)],
  term ((-1382208 : Rat) / 32699) [(8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-791100536 : Rat) / 6637897) [(8, 1), (11, 1), (14, 1), (15, 1)],
  term ((756592 : Rat) / 32699) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((207625565654 : Rat) / 99568455) [(8, 1), (11, 1), (14, 2), (15, 1)],
  term ((-39754112 : Rat) / 98097) [(8, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-91946274787 : Rat) / 199136910) [(8, 1), (11, 1), (15, 1)],
  term ((8803640 : Rat) / 98097) [(8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-27532788096 : Rat) / 33189485) [(8, 1), (11, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((5228544 : Rat) / 32699) [(8, 1), (11, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((13766394048 : Rat) / 33189485) [(8, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-2614272 : Rat) / 32699) [(8, 1), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((8185423488 : Rat) / 6637897) [(8, 1), (11, 2), (12, 1), (14, 1), (15, 2)],
  term ((-7772160 : Rat) / 32699) [(8, 1), (11, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4092711744 : Rat) / 6637897) [(8, 1), (11, 2), (12, 1), (15, 2)],
  term ((3886080 : Rat) / 32699) [(8, 1), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((-992172544 : Rat) / 33189485) [(8, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((188416 : Rat) / 32699) [(8, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((744129408 : Rat) / 1746815) [(8, 1), (11, 2), (13, 1), (14, 2), (15, 1)],
  term ((-141312 : Rat) / 1721) [(8, 1), (11, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-434075488 : Rat) / 4741355) [(8, 1), (11, 2), (13, 1), (15, 1)],
  term ((577024 : Rat) / 32699) [(8, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-20525569504 : Rat) / 33189485) [(8, 1), (11, 2), (14, 2), (15, 2)],
  term ((3897856 : Rat) / 32699) [(8, 1), (11, 2), (14, 2), (15, 2), (16, 1)],
  term ((5131392376 : Rat) / 33189485) [(8, 1), (11, 2), (15, 2)],
  term ((-974464 : Rat) / 32699) [(8, 1), (11, 2), (15, 2), (16, 1)],
  term ((-496086272 : Rat) / 33189485) [(8, 1), (11, 3), (12, 1), (14, 1), (15, 1)],
  term ((94208 : Rat) / 32699) [(8, 1), (11, 3), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((248043136 : Rat) / 33189485) [(8, 1), (11, 3), (12, 1), (15, 1)],
  term ((-47104 : Rat) / 32699) [(8, 1), (11, 3), (12, 1), (15, 1), (16, 1)],
  term ((248043136 : Rat) / 33189485) [(8, 1), (11, 3), (14, 2), (15, 1)],
  term ((-47104 : Rat) / 32699) [(8, 1), (11, 3), (14, 2), (15, 1), (16, 1)],
  term ((-62010784 : Rat) / 33189485) [(8, 1), (11, 3), (15, 1)],
  term ((11776 : Rat) / 32699) [(8, 1), (11, 3), (15, 1), (16, 1)],
  term ((-27 : Rat) / 5) [(8, 1), (12, 1)],
  term ((-144424777527 : Rat) / 26551588) [(8, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((34483132 : Rat) / 32699) [(8, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((144424777527 : Rat) / 53103176) [(8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-17241566 : Rat) / 32699) [(8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1789 : Rat) / 160) [(8, 1), (12, 1), (14, 1)],
  term ((813184131611 : Rat) / 265515880) [(8, 1), (12, 1), (14, 1), (15, 2)],
  term ((-19473074 : Rat) / 32699) [(8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-61 : Rat) / 80) [(8, 1), (12, 1), (14, 2)],
  term ((-813184131611 : Rat) / 531031760) [(8, 1), (12, 1), (15, 2)],
  term ((9736537 : Rat) / 32699) [(8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-61 : Rat) / 80) [(8, 1), (12, 2)],
  term ((61 : Rat) / 40) [(8, 1), (12, 2), (14, 1)],
  term ((-14070096251 : Rat) / 66378970) [(8, 1), (13, 1), (14, 1), (15, 1)],
  term ((1219392 : Rat) / 32699) [(8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((140042949377 : Rat) / 37930840) [(8, 1), (13, 1), (14, 2), (15, 1)],
  term ((-23327936 : Rat) / 32699) [(8, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-867739875631 : Rat) / 1062063520) [(8, 1), (13, 1), (15, 1)],
  term ((5222288 : Rat) / 32699) [(8, 1), (13, 1), (15, 1), (16, 1)],
  term ((267 : Rat) / 80) [(8, 1), (13, 2)],
  term ((-267 : Rat) / 20) [(8, 1), (13, 2), (14, 2)],
  term ((897 : Rat) / 320) [(8, 1), (14, 1)],
  term ((1581 : Rat) / 580) [(8, 1), (14, 1), (15, 2)],
  term ((-897 : Rat) / 160) [(8, 1), (14, 2)],
  term ((-713886046843 : Rat) / 398273820) [(8, 1), (14, 2), (15, 2)],
  term ((34129162 : Rat) / 98097) [(8, 1), (14, 2), (15, 2), (16, 1)],
  term ((142342953569 : Rat) / 318619056) [(8, 1), (15, 2)],
  term ((-17064581 : Rat) / 196194) [(8, 1), (15, 2), (16, 1)],
  term ((-89 : Rat) / 80) [(8, 2)],
  term ((89 : Rat) / 20) [(8, 2), (12, 1)],
  term ((-89 : Rat) / 10) [(8, 2), (12, 1), (14, 1)],
  term ((89 : Rat) / 20) [(8, 2), (14, 2)],
  term ((124021568 : Rat) / 33189485) [(9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-23552 : Rat) / 32699) [(9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-62010784 : Rat) / 33189485) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((11776 : Rat) / 32699) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-28 : Rat) / 29) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((16 : Rat) / 29) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 3)],
  term ((14 : Rat) / 29) [(9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-8 : Rat) / 29) [(9, 1), (10, 1), (12, 1), (15, 3)],
  term ((48 : Rat) / 29) [(9, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((-16 : Rat) / 29) [(9, 1), (10, 1), (13, 1), (14, 2), (15, 2)],
  term ((-20 : Rat) / 29) [(9, 1), (10, 1), (13, 1), (15, 2)],
  term ((49 : Rat) / 29) [(9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-36 : Rat) / 29) [(9, 1), (10, 1), (14, 1), (15, 3)],
  term ((-10 : Rat) / 29) [(9, 1), (10, 1), (14, 2), (15, 1)],
  term ((-22 : Rat) / 29) [(9, 1), (10, 1), (15, 1)],
  term ((18 : Rat) / 29) [(9, 1), (10, 1), (15, 3)],
  term ((387567400 : Rat) / 19913691) [(9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-368000 : Rat) / 98097) [(9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1147199504 : Rat) / 99568455) [(9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 3)],
  term ((217856 : Rat) / 98097) [(9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-193783700 : Rat) / 19913691) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((184000 : Rat) / 98097) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((573599752 : Rat) / 99568455) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 3)],
  term ((-108928 : Rat) / 98097) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((1378628228 : Rat) / 99568455) [(9, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((-39744 : Rat) / 32699) [(9, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1084751888 : Rat) / 99568455) [(9, 1), (11, 1), (12, 1), (14, 1), (15, 4)],
  term ((17664 : Rat) / 32699) [(9, 1), (11, 1), (12, 1), (14, 1), (15, 4), (16, 1)],
  term ((46508088 : Rat) / 33189485) [(9, 1), (11, 1), (12, 1), (14, 2), (15, 2)],
  term ((-8832 : Rat) / 32699) [(9, 1), (11, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-144839036 : Rat) / 19913691) [(9, 1), (11, 1), (12, 1), (15, 2)],
  term ((22080 : Rat) / 32699) [(9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((542375944 : Rat) / 99568455) [(9, 1), (11, 1), (12, 1), (15, 4)],
  term ((-8832 : Rat) / 32699) [(9, 1), (11, 1), (12, 1), (15, 4), (16, 1)],
  term ((-31005392 : Rat) / 6637897) [(9, 1), (11, 1), (12, 2), (13, 1), (14, 1), (15, 1)],
  term ((29440 : Rat) / 32699) [(9, 1), (11, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((15502696 : Rat) / 6637897) [(9, 1), (11, 1), (12, 2), (13, 1), (15, 1)],
  term ((-14720 : Rat) / 32699) [(9, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-166261936 : Rat) / 33189485) [(9, 1), (11, 1), (12, 2), (14, 1), (15, 2)],
  term ((17664 : Rat) / 32699) [(9, 1), (11, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((83130968 : Rat) / 33189485) [(9, 1), (11, 1), (12, 2), (15, 2)],
  term ((-8832 : Rat) / 32699) [(9, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((8666920 : Rat) / 6637897) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-7360 : Rat) / 32699) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-17333840 : Rat) / 6637897) [(9, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((14720 : Rat) / 32699) [(9, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 28, terms 800 through 899. -/
theorem rs_R009_ueqv_R009NYYYY_block_28_0800_0899_valid :
    checkProductSumEq rs_R009_ueqv_R009NYYYY_partials_28_0800_0899
      rs_R009_ueqv_R009NYYYY_block_28_0800_0899 = true := by
  native_decide

end R009UeqvR009NYYYYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
