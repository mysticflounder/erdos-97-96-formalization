/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_054, term block 27:800-899

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_054`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2054TermShards

/-- Generator polynomial 27 for endpoint certificate `ep_Q2_054`. -/
def ep_Q2_054_generator_27_0800_0899 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(14, 1)]
]

/-- Coefficient term 800 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0800 : Poly :=
[
  term ((-60893008650 : Rat) / 45033486517) [(7, 2), (11, 2), (12, 1)]
]

/-- Partial product 800 for generator 27. -/
def ep_Q2_054_partial_27_0800 : Poly :=
[
  term ((60893008650 : Rat) / 45033486517) [(7, 2), (11, 2), (12, 1)],
  term ((-121786017300 : Rat) / 45033486517) [(7, 2), (11, 2), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 800 for generator 27. -/
theorem ep_Q2_054_partial_27_0800_valid :
    mulPoly ep_Q2_054_coefficient_27_0800
        ep_Q2_054_generator_27_0800_0899 =
      ep_Q2_054_partial_27_0800 := by
  native_decide

/-- Coefficient term 801 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0801 : Poly :=
[
  term ((30446504325 : Rat) / 45033486517) [(7, 2), (11, 2), (14, 1)]
]

/-- Partial product 801 for generator 27. -/
def ep_Q2_054_partial_27_0801 : Poly :=
[
  term ((-30446504325 : Rat) / 45033486517) [(7, 2), (11, 2), (14, 1)],
  term ((60893008650 : Rat) / 45033486517) [(7, 2), (11, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 801 for generator 27. -/
theorem ep_Q2_054_partial_27_0801_valid :
    mulPoly ep_Q2_054_coefficient_27_0801
        ep_Q2_054_generator_27_0800_0899 =
      ep_Q2_054_partial_27_0801 := by
  native_decide

/-- Coefficient term 802 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0802 : Poly :=
[
  term ((1617913836891 : Rat) / 180133946068) [(7, 2), (12, 1)]
]

/-- Partial product 802 for generator 27. -/
def ep_Q2_054_partial_27_0802 : Poly :=
[
  term ((-1617913836891 : Rat) / 180133946068) [(7, 2), (12, 1)],
  term ((1617913836891 : Rat) / 90066973034) [(7, 2), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 802 for generator 27. -/
theorem ep_Q2_054_partial_27_0802_valid :
    mulPoly ep_Q2_054_coefficient_27_0802
        ep_Q2_054_generator_27_0800_0899 =
      ep_Q2_054_partial_27_0802 := by
  native_decide

/-- Coefficient term 803 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0803 : Poly :=
[
  term ((267619708935 : Rat) / 90066973034) [(7, 2), (12, 2)]
]

/-- Partial product 803 for generator 27. -/
def ep_Q2_054_partial_27_0803 : Poly :=
[
  term ((-267619708935 : Rat) / 90066973034) [(7, 2), (12, 2)],
  term ((267619708935 : Rat) / 45033486517) [(7, 2), (12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 803 for generator 27. -/
theorem ep_Q2_054_partial_27_0803_valid :
    mulPoly ep_Q2_054_coefficient_27_0803
        ep_Q2_054_generator_27_0800_0899 =
      ep_Q2_054_partial_27_0803 := by
  native_decide

/-- Coefficient term 804 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0804 : Poly :=
[
  term ((-245559985209 : Rat) / 45033486517) [(7, 2), (14, 1)]
]

/-- Partial product 804 for generator 27. -/
def ep_Q2_054_partial_27_0804 : Poly :=
[
  term ((245559985209 : Rat) / 45033486517) [(7, 2), (14, 1)],
  term ((-491119970418 : Rat) / 45033486517) [(7, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 804 for generator 27. -/
theorem ep_Q2_054_partial_27_0804_valid :
    mulPoly ep_Q2_054_coefficient_27_0804
        ep_Q2_054_generator_27_0800_0899 =
      ep_Q2_054_partial_27_0804 := by
  native_decide

/-- Coefficient term 805 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0805 : Poly :=
[
  term ((-1702043680185 : Rat) / 45033486517) [(8, 1)]
]

/-- Partial product 805 for generator 27. -/
def ep_Q2_054_partial_27_0805 : Poly :=
[
  term ((1702043680185 : Rat) / 45033486517) [(8, 1)],
  term ((-3404087360370 : Rat) / 45033486517) [(8, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 805 for generator 27. -/
theorem ep_Q2_054_partial_27_0805_valid :
    mulPoly ep_Q2_054_coefficient_27_0805
        ep_Q2_054_generator_27_0800_0899 =
      ep_Q2_054_partial_27_0805 := by
  native_decide

/-- Coefficient term 806 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0806 : Poly :=
[
  term ((463091117583 : Rat) / 45033486517) [(8, 1), (9, 1), (10, 1), (11, 1)]
]

/-- Partial product 806 for generator 27. -/
def ep_Q2_054_partial_27_0806 : Poly :=
[
  term ((-463091117583 : Rat) / 45033486517) [(8, 1), (9, 1), (10, 1), (11, 1)],
  term ((926182235166 : Rat) / 45033486517) [(8, 1), (9, 1), (10, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 806 for generator 27. -/
theorem ep_Q2_054_partial_27_0806_valid :
    mulPoly ep_Q2_054_coefficient_27_0806
        ep_Q2_054_generator_27_0800_0899 =
      ep_Q2_054_partial_27_0806 := by
  native_decide

/-- Coefficient term 807 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0807 : Poly :=
[
  term ((-46170916926 : Rat) / 45033486517) [(8, 1), (9, 1), (10, 1), (13, 1)]
]

/-- Partial product 807 for generator 27. -/
def ep_Q2_054_partial_27_0807 : Poly :=
[
  term ((46170916926 : Rat) / 45033486517) [(8, 1), (9, 1), (10, 1), (13, 1)],
  term ((-92341833852 : Rat) / 45033486517) [(8, 1), (9, 1), (10, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 807 for generator 27. -/
theorem ep_Q2_054_partial_27_0807_valid :
    mulPoly ep_Q2_054_coefficient_27_0807
        ep_Q2_054_generator_27_0800_0899 =
      ep_Q2_054_partial_27_0807 := by
  native_decide

/-- Coefficient term 808 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0808 : Poly :=
[
  term ((-42382375602 : Rat) / 45033486517) [(8, 1), (9, 1), (10, 1), (15, 1)]
]

/-- Partial product 808 for generator 27. -/
def ep_Q2_054_partial_27_0808 : Poly :=
[
  term ((-84764751204 : Rat) / 45033486517) [(8, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((42382375602 : Rat) / 45033486517) [(8, 1), (9, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 808 for generator 27. -/
theorem ep_Q2_054_partial_27_0808_valid :
    mulPoly ep_Q2_054_coefficient_27_0808
        ep_Q2_054_generator_27_0800_0899 =
      ep_Q2_054_partial_27_0808 := by
  native_decide

/-- Coefficient term 809 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0809 : Poly :=
[
  term ((-416713326465 : Rat) / 45033486517) [(8, 1), (9, 1), (11, 1)]
]

/-- Partial product 809 for generator 27. -/
def ep_Q2_054_partial_27_0809 : Poly :=
[
  term ((416713326465 : Rat) / 45033486517) [(8, 1), (9, 1), (11, 1)],
  term ((-833426652930 : Rat) / 45033486517) [(8, 1), (9, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 809 for generator 27. -/
theorem ep_Q2_054_partial_27_0809_valid :
    mulPoly ep_Q2_054_coefficient_27_0809
        ep_Q2_054_generator_27_0800_0899 =
      ep_Q2_054_partial_27_0809 := by
  native_decide

/-- Coefficient term 810 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0810 : Poly :=
[
  term ((-580224054633 : Rat) / 45033486517) [(8, 1), (9, 1), (11, 1), (12, 1)]
]

/-- Partial product 810 for generator 27. -/
def ep_Q2_054_partial_27_0810 : Poly :=
[
  term ((580224054633 : Rat) / 45033486517) [(8, 1), (9, 1), (11, 1), (12, 1)],
  term ((-1160448109266 : Rat) / 45033486517) [(8, 1), (9, 1), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 810 for generator 27. -/
theorem ep_Q2_054_partial_27_0810_valid :
    mulPoly ep_Q2_054_coefficient_27_0810
        ep_Q2_054_generator_27_0800_0899 =
      ep_Q2_054_partial_27_0810 := by
  native_decide

/-- Coefficient term 811 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0811 : Poly :=
[
  term ((327021456336 : Rat) / 45033486517) [(8, 1), (9, 1), (11, 1), (14, 1)]
]

/-- Partial product 811 for generator 27. -/
def ep_Q2_054_partial_27_0811 : Poly :=
[
  term ((-327021456336 : Rat) / 45033486517) [(8, 1), (9, 1), (11, 1), (14, 1)],
  term ((654042912672 : Rat) / 45033486517) [(8, 1), (9, 1), (11, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 811 for generator 27. -/
theorem ep_Q2_054_partial_27_0811_valid :
    mulPoly ep_Q2_054_coefficient_27_0811
        ep_Q2_054_generator_27_0800_0899 =
      ep_Q2_054_partial_27_0811 := by
  native_decide

/-- Coefficient term 812 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0812 : Poly :=
[
  term ((-325051295844 : Rat) / 45033486517) [(8, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 812 for generator 27. -/
def ep_Q2_054_partial_27_0812 : Poly :=
[
  term ((-650102591688 : Rat) / 45033486517) [(8, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((325051295844 : Rat) / 45033486517) [(8, 1), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 812 for generator 27. -/
theorem ep_Q2_054_partial_27_0812_valid :
    mulPoly ep_Q2_054_coefficient_27_0812
        ep_Q2_054_generator_27_0800_0899 =
      ep_Q2_054_partial_27_0812 := by
  native_decide

/-- Coefficient term 813 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0813 : Poly :=
[
  term ((346813815507 : Rat) / 45033486517) [(8, 1), (9, 1), (13, 1)]
]

/-- Partial product 813 for generator 27. -/
def ep_Q2_054_partial_27_0813 : Poly :=
[
  term ((-346813815507 : Rat) / 45033486517) [(8, 1), (9, 1), (13, 1)],
  term ((693627631014 : Rat) / 45033486517) [(8, 1), (9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 813 for generator 27. -/
theorem ep_Q2_054_partial_27_0813_valid :
    mulPoly ep_Q2_054_coefficient_27_0813
        ep_Q2_054_generator_27_0800_0899 =
      ep_Q2_054_partial_27_0813 := by
  native_decide

/-- Coefficient term 814 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0814 : Poly :=
[
  term ((40412215110 : Rat) / 45033486517) [(8, 1), (9, 1), (13, 1), (14, 1)]
]

/-- Partial product 814 for generator 27. -/
def ep_Q2_054_partial_27_0814 : Poly :=
[
  term ((-40412215110 : Rat) / 45033486517) [(8, 1), (9, 1), (13, 1), (14, 1)],
  term ((80824430220 : Rat) / 45033486517) [(8, 1), (9, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 814 for generator 27. -/
theorem ep_Q2_054_partial_27_0814_valid :
    mulPoly ep_Q2_054_coefficient_27_0814
        ep_Q2_054_generator_27_0800_0899 =
      ep_Q2_054_partial_27_0814 := by
  native_decide

/-- Coefficient term 815 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0815 : Poly :=
[
  term ((1051855458 : Rat) / 166175227) [(8, 1), (9, 1), (15, 1)]
]

/-- Partial product 815 for generator 27. -/
def ep_Q2_054_partial_27_0815 : Poly :=
[
  term ((2103710916 : Rat) / 166175227) [(8, 1), (9, 1), (14, 1), (15, 1)],
  term ((-1051855458 : Rat) / 166175227) [(8, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 815 for generator 27. -/
theorem ep_Q2_054_partial_27_0815_valid :
    mulPoly ep_Q2_054_coefficient_27_0815
        ep_Q2_054_generator_27_0800_0899 =
      ep_Q2_054_partial_27_0815 := by
  native_decide

/-- Coefficient term 816 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0816 : Poly :=
[
  term ((3202559078829 : Rat) / 45033486517) [(8, 1), (10, 1)]
]

/-- Partial product 816 for generator 27. -/
def ep_Q2_054_partial_27_0816 : Poly :=
[
  term ((-3202559078829 : Rat) / 45033486517) [(8, 1), (10, 1)],
  term ((6405118157658 : Rat) / 45033486517) [(8, 1), (10, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 816 for generator 27. -/
theorem ep_Q2_054_partial_27_0816_valid :
    mulPoly ep_Q2_054_coefficient_27_0816
        ep_Q2_054_generator_27_0800_0899 =
      ep_Q2_054_partial_27_0816 := by
  native_decide

/-- Coefficient term 817 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0817 : Poly :=
[
  term ((15866815881 : Rat) / 166175227) [(8, 1), (10, 1), (11, 1), (13, 1)]
]

/-- Partial product 817 for generator 27. -/
def ep_Q2_054_partial_27_0817 : Poly :=
[
  term ((-15866815881 : Rat) / 166175227) [(8, 1), (10, 1), (11, 1), (13, 1)],
  term ((31733631762 : Rat) / 166175227) [(8, 1), (10, 1), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 817 for generator 27. -/
theorem ep_Q2_054_partial_27_0817_valid :
    mulPoly ep_Q2_054_coefficient_27_0817
        ep_Q2_054_generator_27_0800_0899 =
      ep_Q2_054_partial_27_0817 := by
  native_decide

/-- Coefficient term 818 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0818 : Poly :=
[
  term ((-11365328267787 : Rat) / 45033486517) [(8, 1), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 818 for generator 27. -/
def ep_Q2_054_partial_27_0818 : Poly :=
[
  term ((-22730656535574 : Rat) / 45033486517) [(8, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((11365328267787 : Rat) / 45033486517) [(8, 1), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 818 for generator 27. -/
theorem ep_Q2_054_partial_27_0818_valid :
    mulPoly ep_Q2_054_coefficient_27_0818
        ep_Q2_054_generator_27_0800_0899 =
      ep_Q2_054_partial_27_0818 := by
  native_decide

/-- Coefficient term 819 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0819 : Poly :=
[
  term ((-218850628539 : Rat) / 45033486517) [(8, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 819 for generator 27. -/
def ep_Q2_054_partial_27_0819 : Poly :=
[
  term ((-437701257078 : Rat) / 45033486517) [(8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((218850628539 : Rat) / 45033486517) [(8, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 819 for generator 27. -/
theorem ep_Q2_054_partial_27_0819_valid :
    mulPoly ep_Q2_054_coefficient_27_0819
        ep_Q2_054_generator_27_0800_0899 =
      ep_Q2_054_partial_27_0819 := by
  native_decide

/-- Coefficient term 820 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0820 : Poly :=
[
  term ((-268454987811 : Rat) / 45033486517) [(8, 1), (10, 1), (11, 2)]
]

/-- Partial product 820 for generator 27. -/
def ep_Q2_054_partial_27_0820 : Poly :=
[
  term ((268454987811 : Rat) / 45033486517) [(8, 1), (10, 1), (11, 2)],
  term ((-536909975622 : Rat) / 45033486517) [(8, 1), (10, 1), (11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 820 for generator 27. -/
theorem ep_Q2_054_partial_27_0820_valid :
    mulPoly ep_Q2_054_coefficient_27_0820
        ep_Q2_054_generator_27_0800_0899 =
      ep_Q2_054_partial_27_0820 := by
  native_decide

/-- Coefficient term 821 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0821 : Poly :=
[
  term ((89484995937 : Rat) / 90066973034) [(8, 1), (10, 1), (12, 1)]
]

/-- Partial product 821 for generator 27. -/
def ep_Q2_054_partial_27_0821 : Poly :=
[
  term ((-89484995937 : Rat) / 90066973034) [(8, 1), (10, 1), (12, 1)],
  term ((89484995937 : Rat) / 45033486517) [(8, 1), (10, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 821 for generator 27. -/
theorem ep_Q2_054_partial_27_0821_valid :
    mulPoly ep_Q2_054_coefficient_27_0821
        ep_Q2_054_generator_27_0800_0899 =
      ep_Q2_054_partial_27_0821 := by
  native_decide

/-- Coefficient term 822 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0822 : Poly :=
[
  term ((13511540080152 : Rat) / 45033486517) [(8, 1), (10, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 822 for generator 27. -/
def ep_Q2_054_partial_27_0822 : Poly :=
[
  term ((27023080160304 : Rat) / 45033486517) [(8, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-13511540080152 : Rat) / 45033486517) [(8, 1), (10, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 822 for generator 27. -/
theorem ep_Q2_054_partial_27_0822_valid :
    mulPoly ep_Q2_054_coefficient_27_0822
        ep_Q2_054_generator_27_0800_0899 =
      ep_Q2_054_partial_27_0822 := by
  native_decide

/-- Coefficient term 823 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0823 : Poly :=
[
  term ((-6755770040076 : Rat) / 45033486517) [(8, 1), (10, 1), (12, 1), (15, 2)]
]

/-- Partial product 823 for generator 27. -/
def ep_Q2_054_partial_27_0823 : Poly :=
[
  term ((-13511540080152 : Rat) / 45033486517) [(8, 1), (10, 1), (12, 1), (14, 1), (15, 2)],
  term ((6755770040076 : Rat) / 45033486517) [(8, 1), (10, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 823 for generator 27. -/
theorem ep_Q2_054_partial_27_0823_valid :
    mulPoly ep_Q2_054_coefficient_27_0823
        ep_Q2_054_generator_27_0800_0899 =
      ep_Q2_054_partial_27_0823 := by
  native_decide

/-- Coefficient term 824 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0824 : Poly :=
[
  term ((-100579066131 : Rat) / 90066973034) [(8, 1), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 824 for generator 27. -/
def ep_Q2_054_partial_27_0824 : Poly :=
[
  term ((-100579066131 : Rat) / 45033486517) [(8, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((100579066131 : Rat) / 90066973034) [(8, 1), (10, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 824 for generator 27. -/
theorem ep_Q2_054_partial_27_0824_valid :
    mulPoly ep_Q2_054_coefficient_27_0824
        ep_Q2_054_generator_27_0800_0899 =
      ep_Q2_054_partial_27_0824 := by
  native_decide

/-- Coefficient term 825 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0825 : Poly :=
[
  term ((-63939357650302 : Rat) / 45033486517) [(8, 1), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 825 for generator 27. -/
def ep_Q2_054_partial_27_0825 : Poly :=
[
  term ((-127878715300604 : Rat) / 45033486517) [(8, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((63939357650302 : Rat) / 45033486517) [(8, 1), (10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 825 for generator 27. -/
theorem ep_Q2_054_partial_27_0825_valid :
    mulPoly ep_Q2_054_coefficient_27_0825
        ep_Q2_054_generator_27_0800_0899 =
      ep_Q2_054_partial_27_0825 := by
  native_decide

/-- Coefficient term 826 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0826 : Poly :=
[
  term ((100579066131 : Rat) / 45033486517) [(8, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 826 for generator 27. -/
def ep_Q2_054_partial_27_0826 : Poly :=
[
  term ((201158132262 : Rat) / 45033486517) [(8, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-100579066131 : Rat) / 45033486517) [(8, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 826 for generator 27. -/
theorem ep_Q2_054_partial_27_0826_valid :
    mulPoly ep_Q2_054_coefficient_27_0826
        ep_Q2_054_generator_27_0800_0899 =
      ep_Q2_054_partial_27_0826 := by
  native_decide

/-- Coefficient term 827 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0827 : Poly :=
[
  term ((3994177738187 : Rat) / 45033486517) [(8, 1), (10, 1), (15, 2)]
]

/-- Partial product 827 for generator 27. -/
def ep_Q2_054_partial_27_0827 : Poly :=
[
  term ((7988355476374 : Rat) / 45033486517) [(8, 1), (10, 1), (14, 1), (15, 2)],
  term ((-3994177738187 : Rat) / 45033486517) [(8, 1), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 827 for generator 27. -/
theorem ep_Q2_054_partial_27_0827_valid :
    mulPoly ep_Q2_054_coefficient_27_0827
        ep_Q2_054_generator_27_0800_0899 =
      ep_Q2_054_partial_27_0827 := by
  native_decide

/-- Coefficient term 828 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0828 : Poly :=
[
  term ((-159714847335 : Rat) / 45033486517) [(8, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 828 for generator 27. -/
def ep_Q2_054_partial_27_0828 : Poly :=
[
  term ((-319429694670 : Rat) / 45033486517) [(8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((159714847335 : Rat) / 45033486517) [(8, 1), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 828 for generator 27. -/
theorem ep_Q2_054_partial_27_0828_valid :
    mulPoly ep_Q2_054_coefficient_27_0828
        ep_Q2_054_generator_27_0800_0899 =
      ep_Q2_054_partial_27_0828 := by
  native_decide

/-- Coefficient term 829 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0829 : Poly :=
[
  term ((100579066131 : Rat) / 180133946068) [(8, 1), (10, 1), (16, 1)]
]

/-- Partial product 829 for generator 27. -/
def ep_Q2_054_partial_27_0829 : Poly :=
[
  term ((100579066131 : Rat) / 90066973034) [(8, 1), (10, 1), (14, 1), (16, 1)],
  term ((-100579066131 : Rat) / 180133946068) [(8, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 829 for generator 27. -/
theorem ep_Q2_054_partial_27_0829_valid :
    mulPoly ep_Q2_054_coefficient_27_0829
        ep_Q2_054_generator_27_0800_0899 =
      ep_Q2_054_partial_27_0829 := by
  native_decide

/-- Coefficient term 830 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0830 : Poly :=
[
  term ((6755770040076 : Rat) / 45033486517) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 830 for generator 27. -/
def ep_Q2_054_partial_27_0830 : Poly :=
[
  term ((-6755770040076 : Rat) / 45033486517) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((13511540080152 : Rat) / 45033486517) [(8, 1), (11, 1), (12, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 830 for generator 27. -/
theorem ep_Q2_054_partial_27_0830_valid :
    mulPoly ep_Q2_054_coefficient_27_0830
        ep_Q2_054_generator_27_0800_0899 =
      ep_Q2_054_partial_27_0830 := by
  native_decide

/-- Coefficient term 831 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0831 : Poly :=
[
  term ((55910913644095 : Rat) / 45033486517) [(8, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 831 for generator 27. -/
def ep_Q2_054_partial_27_0831 : Poly :=
[
  term ((111821827288190 : Rat) / 45033486517) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-55910913644095 : Rat) / 45033486517) [(8, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 831 for generator 27. -/
theorem ep_Q2_054_partial_27_0831_valid :
    mulPoly ep_Q2_054_coefficient_27_0831
        ep_Q2_054_generator_27_0800_0899 =
      ep_Q2_054_partial_27_0831 := by
  native_decide

/-- Coefficient term 832 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0832 : Poly :=
[
  term ((-100579066131 : Rat) / 45033486517) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 832 for generator 27. -/
def ep_Q2_054_partial_27_0832 : Poly :=
[
  term ((-201158132262 : Rat) / 45033486517) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((100579066131 : Rat) / 45033486517) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 832 for generator 27. -/
theorem ep_Q2_054_partial_27_0832_valid :
    mulPoly ep_Q2_054_coefficient_27_0832
        ep_Q2_054_generator_27_0800_0899 =
      ep_Q2_054_partial_27_0832 := by
  native_decide

/-- Coefficient term 833 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0833 : Poly :=
[
  term ((-13511540080152 : Rat) / 45033486517) [(8, 1), (11, 1), (12, 2), (15, 1)]
]

/-- Partial product 833 for generator 27. -/
def ep_Q2_054_partial_27_0833 : Poly :=
[
  term ((-27023080160304 : Rat) / 45033486517) [(8, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((13511540080152 : Rat) / 45033486517) [(8, 1), (11, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 833 for generator 27. -/
theorem ep_Q2_054_partial_27_0833_valid :
    mulPoly ep_Q2_054_coefficient_27_0833
        ep_Q2_054_generator_27_0800_0899 =
      ep_Q2_054_partial_27_0833 := by
  native_decide

/-- Coefficient term 834 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0834 : Poly :=
[
  term ((-2105211053907 : Rat) / 90066973034) [(8, 1), (11, 1), (13, 1)]
]

/-- Partial product 834 for generator 27. -/
def ep_Q2_054_partial_27_0834 : Poly :=
[
  term ((2105211053907 : Rat) / 90066973034) [(8, 1), (11, 1), (13, 1)],
  term ((-2105211053907 : Rat) / 45033486517) [(8, 1), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 834 for generator 27. -/
theorem ep_Q2_054_partial_27_0834_valid :
    mulPoly ep_Q2_054_coefficient_27_0834
        ep_Q2_054_generator_27_0800_0899 =
      ep_Q2_054_partial_27_0834 := by
  native_decide

/-- Coefficient term 835 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0835 : Poly :=
[
  term ((-2105211053907 : Rat) / 45033486517) [(8, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 835 for generator 27. -/
def ep_Q2_054_partial_27_0835 : Poly :=
[
  term ((2105211053907 : Rat) / 45033486517) [(8, 1), (11, 1), (13, 1), (14, 1)],
  term ((-4210422107814 : Rat) / 45033486517) [(8, 1), (11, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 835 for generator 27. -/
theorem ep_Q2_054_partial_27_0835_valid :
    mulPoly ep_Q2_054_coefficient_27_0835
        ep_Q2_054_generator_27_0800_0899 =
      ep_Q2_054_partial_27_0835 := by
  native_decide

/-- Coefficient term 836 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0836 : Poly :=
[
  term ((-3994177738187 : Rat) / 45033486517) [(8, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 836 for generator 27. -/
def ep_Q2_054_partial_27_0836 : Poly :=
[
  term ((3994177738187 : Rat) / 45033486517) [(8, 1), (11, 1), (14, 1), (15, 1)],
  term ((-7988355476374 : Rat) / 45033486517) [(8, 1), (11, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 836 for generator 27. -/
theorem ep_Q2_054_partial_27_0836_valid :
    mulPoly ep_Q2_054_coefficient_27_0836
        ep_Q2_054_generator_27_0800_0899 =
      ep_Q2_054_partial_27_0836 := by
  native_decide

/-- Coefficient term 837 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0837 : Poly :=
[
  term ((159714847335 : Rat) / 45033486517) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 837 for generator 27. -/
def ep_Q2_054_partial_27_0837 : Poly :=
[
  term ((-159714847335 : Rat) / 45033486517) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((319429694670 : Rat) / 45033486517) [(8, 1), (11, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 837 for generator 27. -/
theorem ep_Q2_054_partial_27_0837_valid :
    mulPoly ep_Q2_054_coefficient_27_0837
        ep_Q2_054_generator_27_0800_0899 =
      ep_Q2_054_partial_27_0837 := by
  native_decide

/-- Coefficient term 838 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0838 : Poly :=
[
  term ((37647869072301 : Rat) / 90066973034) [(8, 1), (11, 1), (15, 1)]
]

/-- Partial product 838 for generator 27. -/
def ep_Q2_054_partial_27_0838 : Poly :=
[
  term ((37647869072301 : Rat) / 45033486517) [(8, 1), (11, 1), (14, 1), (15, 1)],
  term ((-37647869072301 : Rat) / 90066973034) [(8, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 838 for generator 27. -/
theorem ep_Q2_054_partial_27_0838_valid :
    mulPoly ep_Q2_054_coefficient_27_0838
        ep_Q2_054_generator_27_0800_0899 =
      ep_Q2_054_partial_27_0838 := by
  native_decide

/-- Coefficient term 839 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0839 : Poly :=
[
  term ((-41443284927 : Rat) / 90066973034) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 839 for generator 27. -/
def ep_Q2_054_partial_27_0839 : Poly :=
[
  term ((-41443284927 : Rat) / 45033486517) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((41443284927 : Rat) / 90066973034) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 839 for generator 27. -/
theorem ep_Q2_054_partial_27_0839_valid :
    mulPoly ep_Q2_054_coefficient_27_0839
        ep_Q2_054_generator_27_0800_0899 =
      ep_Q2_054_partial_27_0839 := by
  native_decide

/-- Coefficient term 840 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0840 : Poly :=
[
  term ((-6315633161721 : Rat) / 90066973034) [(8, 1), (11, 2)]
]

/-- Partial product 840 for generator 27. -/
def ep_Q2_054_partial_27_0840 : Poly :=
[
  term ((6315633161721 : Rat) / 90066973034) [(8, 1), (11, 2)],
  term ((-6315633161721 : Rat) / 45033486517) [(8, 1), (11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 840 for generator 27. -/
theorem ep_Q2_054_partial_27_0840_valid :
    mulPoly ep_Q2_054_coefficient_27_0840
        ep_Q2_054_generator_27_0800_0899 =
      ep_Q2_054_partial_27_0840 := by
  native_decide

/-- Coefficient term 841 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0841 : Poly :=
[
  term ((-4031452115940 : Rat) / 45033486517) [(8, 1), (11, 2), (12, 1)]
]

/-- Partial product 841 for generator 27. -/
def ep_Q2_054_partial_27_0841 : Poly :=
[
  term ((4031452115940 : Rat) / 45033486517) [(8, 1), (11, 2), (12, 1)],
  term ((-8062904231880 : Rat) / 45033486517) [(8, 1), (11, 2), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 841 for generator 27. -/
theorem ep_Q2_054_partial_27_0841_valid :
    mulPoly ep_Q2_054_coefficient_27_0841
        ep_Q2_054_generator_27_0800_0899 =
      ep_Q2_054_partial_27_0841 := by
  native_decide

/-- Coefficient term 842 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0842 : Poly :=
[
  term ((201158132262 : Rat) / 45033486517) [(8, 1), (11, 2), (12, 1), (16, 1)]
]

/-- Partial product 842 for generator 27. -/
def ep_Q2_054_partial_27_0842 : Poly :=
[
  term ((402316264524 : Rat) / 45033486517) [(8, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-201158132262 : Rat) / 45033486517) [(8, 1), (11, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 842 for generator 27. -/
theorem ep_Q2_054_partial_27_0842_valid :
    mulPoly ep_Q2_054_coefficient_27_0842
        ep_Q2_054_generator_27_0800_0899 =
      ep_Q2_054_partial_27_0842 := by
  native_decide

/-- Coefficient term 843 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0843 : Poly :=
[
  term ((2105211053907 : Rat) / 45033486517) [(8, 1), (11, 2), (14, 1)]
]

/-- Partial product 843 for generator 27. -/
def ep_Q2_054_partial_27_0843 : Poly :=
[
  term ((-2105211053907 : Rat) / 45033486517) [(8, 1), (11, 2), (14, 1)],
  term ((4210422107814 : Rat) / 45033486517) [(8, 1), (11, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 843 for generator 27. -/
theorem ep_Q2_054_partial_27_0843_valid :
    mulPoly ep_Q2_054_coefficient_27_0843
        ep_Q2_054_generator_27_0800_0899 =
      ep_Q2_054_partial_27_0843 := by
  native_decide

/-- Coefficient term 844 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0844 : Poly :=
[
  term ((-100579066131 : Rat) / 45033486517) [(8, 1), (11, 2), (14, 1), (16, 1)]
]

/-- Partial product 844 for generator 27. -/
def ep_Q2_054_partial_27_0844 : Poly :=
[
  term ((100579066131 : Rat) / 45033486517) [(8, 1), (11, 2), (14, 1), (16, 1)],
  term ((-201158132262 : Rat) / 45033486517) [(8, 1), (11, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 844 for generator 27. -/
theorem ep_Q2_054_partial_27_0844_valid :
    mulPoly ep_Q2_054_coefficient_27_0844
        ep_Q2_054_generator_27_0800_0899 =
      ep_Q2_054_partial_27_0844 := by
  native_decide

/-- Coefficient term 845 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0845 : Poly :=
[
  term ((301737198393 : Rat) / 90066973034) [(8, 1), (11, 2), (16, 1)]
]

/-- Partial product 845 for generator 27. -/
def ep_Q2_054_partial_27_0845 : Poly :=
[
  term ((301737198393 : Rat) / 45033486517) [(8, 1), (11, 2), (14, 1), (16, 1)],
  term ((-301737198393 : Rat) / 90066973034) [(8, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 845 for generator 27. -/
theorem ep_Q2_054_partial_27_0845_valid :
    mulPoly ep_Q2_054_coefficient_27_0845
        ep_Q2_054_generator_27_0800_0899 =
      ep_Q2_054_partial_27_0845 := by
  native_decide

/-- Coefficient term 846 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0846 : Poly :=
[
  term ((-23367374944779 : Rat) / 180133946068) [(8, 1), (12, 1)]
]

/-- Partial product 846 for generator 27. -/
def ep_Q2_054_partial_27_0846 : Poly :=
[
  term ((23367374944779 : Rat) / 180133946068) [(8, 1), (12, 1)],
  term ((-23367374944779 : Rat) / 90066973034) [(8, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 846 for generator 27. -/
theorem ep_Q2_054_partial_27_0846_valid :
    mulPoly ep_Q2_054_coefficient_27_0846
        ep_Q2_054_generator_27_0800_0899 =
      ep_Q2_054_partial_27_0846 := by
  native_decide

/-- Coefficient term 847 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0847 : Poly :=
[
  term ((-6755770040076 : Rat) / 45033486517) [(8, 1), (12, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 847 for generator 27. -/
def ep_Q2_054_partial_27_0847 : Poly :=
[
  term ((6755770040076 : Rat) / 45033486517) [(8, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-13511540080152 : Rat) / 45033486517) [(8, 1), (12, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 847 for generator 27. -/
theorem ep_Q2_054_partial_27_0847_valid :
    mulPoly ep_Q2_054_coefficient_27_0847
        ep_Q2_054_generator_27_0800_0899 =
      ep_Q2_054_partial_27_0847 := by
  native_decide

/-- Coefficient term 848 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0848 : Poly :=
[
  term ((-3377885020038 : Rat) / 45033486517) [(8, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 848 for generator 27. -/
def ep_Q2_054_partial_27_0848 : Poly :=
[
  term ((-6755770040076 : Rat) / 45033486517) [(8, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((3377885020038 : Rat) / 45033486517) [(8, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 848 for generator 27. -/
theorem ep_Q2_054_partial_27_0848_valid :
    mulPoly ep_Q2_054_coefficient_27_0848
        ep_Q2_054_generator_27_0800_0899 =
      ep_Q2_054_partial_27_0848 := by
  native_decide

/-- Coefficient term 849 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0849 : Poly :=
[
  term ((-4960087442633 : Rat) / 45033486517) [(8, 1), (12, 1), (15, 2)]
]

/-- Partial product 849 for generator 27. -/
def ep_Q2_054_partial_27_0849 : Poly :=
[
  term ((-9920174885266 : Rat) / 45033486517) [(8, 1), (12, 1), (14, 1), (15, 2)],
  term ((4960087442633 : Rat) / 45033486517) [(8, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 849 for generator 27. -/
theorem ep_Q2_054_partial_27_0849_valid :
    mulPoly ep_Q2_054_coefficient_27_0849
        ep_Q2_054_generator_27_0800_0899 =
      ep_Q2_054_partial_27_0849 := by
  native_decide

/-- Coefficient term 850 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0850 : Poly :=
[
  term ((100579066131 : Rat) / 180133946068) [(8, 1), (12, 1), (16, 1)]
]

/-- Partial product 850 for generator 27. -/
def ep_Q2_054_partial_27_0850 : Poly :=
[
  term ((100579066131 : Rat) / 90066973034) [(8, 1), (12, 1), (14, 1), (16, 1)],
  term ((-100579066131 : Rat) / 180133946068) [(8, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 850 for generator 27. -/
theorem ep_Q2_054_partial_27_0850_valid :
    mulPoly ep_Q2_054_coefficient_27_0850
        ep_Q2_054_generator_27_0800_0899 =
      ep_Q2_054_partial_27_0850 := by
  native_decide

/-- Coefficient term 851 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0851 : Poly :=
[
  term ((6755770040076 : Rat) / 45033486517) [(8, 1), (12, 2), (15, 2)]
]

/-- Partial product 851 for generator 27. -/
def ep_Q2_054_partial_27_0851 : Poly :=
[
  term ((13511540080152 : Rat) / 45033486517) [(8, 1), (12, 2), (14, 1), (15, 2)],
  term ((-6755770040076 : Rat) / 45033486517) [(8, 1), (12, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 851 for generator 27. -/
theorem ep_Q2_054_partial_27_0851_valid :
    mulPoly ep_Q2_054_coefficient_27_0851
        ep_Q2_054_generator_27_0800_0899 =
      ep_Q2_054_partial_27_0851 := by
  native_decide

/-- Coefficient term 852 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0852 : Poly :=
[
  term ((11715857482709 : Rat) / 45033486517) [(8, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 852 for generator 27. -/
def ep_Q2_054_partial_27_0852 : Poly :=
[
  term ((-11715857482709 : Rat) / 45033486517) [(8, 1), (13, 1), (14, 1), (15, 1)],
  term ((23431714965418 : Rat) / 45033486517) [(8, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 852 for generator 27. -/
theorem ep_Q2_054_partial_27_0852_valid :
    mulPoly ep_Q2_054_coefficient_27_0852
        ep_Q2_054_generator_27_0800_0899 =
      ep_Q2_054_partial_27_0852 := by
  native_decide

/-- Coefficient term 853 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0853 : Poly :=
[
  term ((40257367959173 : Rat) / 90066973034) [(8, 1), (13, 1), (15, 1)]
]

/-- Partial product 853 for generator 27. -/
def ep_Q2_054_partial_27_0853 : Poly :=
[
  term ((40257367959173 : Rat) / 45033486517) [(8, 1), (13, 1), (14, 1), (15, 1)],
  term ((-40257367959173 : Rat) / 90066973034) [(8, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 853 for generator 27. -/
theorem ep_Q2_054_partial_27_0853_valid :
    mulPoly ep_Q2_054_coefficient_27_0853
        ep_Q2_054_generator_27_0800_0899 =
      ep_Q2_054_partial_27_0853 := by
  native_decide

/-- Coefficient term 854 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0854 : Poly :=
[
  term ((-31350561213 : Rat) / 45033486517) [(8, 1), (14, 1)]
]

/-- Partial product 854 for generator 27. -/
def ep_Q2_054_partial_27_0854 : Poly :=
[
  term ((31350561213 : Rat) / 45033486517) [(8, 1), (14, 1)],
  term ((-62701122426 : Rat) / 45033486517) [(8, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 854 for generator 27. -/
theorem ep_Q2_054_partial_27_0854_valid :
    mulPoly ep_Q2_054_coefficient_27_0854
        ep_Q2_054_generator_27_0800_0899 =
      ep_Q2_054_partial_27_0854 := by
  native_decide

/-- Coefficient term 855 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0855 : Poly :=
[
  term ((-6511650396893 : Rat) / 45033486517) [(8, 1), (15, 2)]
]

/-- Partial product 855 for generator 27. -/
def ep_Q2_054_partial_27_0855 : Poly :=
[
  term ((-13023300793786 : Rat) / 45033486517) [(8, 1), (14, 1), (15, 2)],
  term ((6511650396893 : Rat) / 45033486517) [(8, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 855 for generator 27. -/
theorem ep_Q2_054_partial_27_0855_valid :
    mulPoly ep_Q2_054_coefficient_27_0855
        ep_Q2_054_generator_27_0800_0899 =
      ep_Q2_054_partial_27_0855 := by
  native_decide

/-- Coefficient term 856 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0856 : Poly :=
[
  term ((958289084010 : Rat) / 45033486517) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 856 for generator 27. -/
def ep_Q2_054_partial_27_0856 : Poly :=
[
  term ((1916578168020 : Rat) / 45033486517) [(8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-958289084010 : Rat) / 45033486517) [(8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 856 for generator 27. -/
theorem ep_Q2_054_partial_27_0856_valid :
    mulPoly ep_Q2_054_coefficient_27_0856
        ep_Q2_054_generator_27_0800_0899 =
      ep_Q2_054_partial_27_0856 := by
  native_decide

/-- Coefficient term 857 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0857 : Poly :=
[
  term ((100579066131 : Rat) / 180133946068) [(8, 1), (16, 1)]
]

/-- Partial product 857 for generator 27. -/
def ep_Q2_054_partial_27_0857 : Poly :=
[
  term ((100579066131 : Rat) / 90066973034) [(8, 1), (14, 1), (16, 1)],
  term ((-100579066131 : Rat) / 180133946068) [(8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 857 for generator 27. -/
theorem ep_Q2_054_partial_27_0857_valid :
    mulPoly ep_Q2_054_coefficient_27_0857
        ep_Q2_054_generator_27_0800_0899 =
      ep_Q2_054_partial_27_0857 := by
  native_decide

/-- Coefficient term 858 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0858 : Poly :=
[
  term ((-1003942953279 : Rat) / 90066973034) [(8, 2)]
]

/-- Partial product 858 for generator 27. -/
def ep_Q2_054_partial_27_0858 : Poly :=
[
  term ((1003942953279 : Rat) / 90066973034) [(8, 2)],
  term ((-1003942953279 : Rat) / 45033486517) [(8, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 858 for generator 27. -/
theorem ep_Q2_054_partial_27_0858_valid :
    mulPoly ep_Q2_054_coefficient_27_0858
        ep_Q2_054_generator_27_0800_0899 =
      ep_Q2_054_partial_27_0858 := by
  native_decide

/-- Coefficient term 859 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0859 : Poly :=
[
  term ((268454987811 : Rat) / 45033486517) [(8, 2), (10, 1)]
]

/-- Partial product 859 for generator 27. -/
def ep_Q2_054_partial_27_0859 : Poly :=
[
  term ((-268454987811 : Rat) / 45033486517) [(8, 2), (10, 1)],
  term ((536909975622 : Rat) / 45033486517) [(8, 2), (10, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 859 for generator 27. -/
theorem ep_Q2_054_partial_27_0859_valid :
    mulPoly ep_Q2_054_coefficient_27_0859
        ep_Q2_054_generator_27_0800_0899 =
      ep_Q2_054_partial_27_0859 := by
  native_decide

/-- Coefficient term 860 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0860 : Poly :=
[
  term ((357939983748 : Rat) / 45033486517) [(8, 2), (10, 1), (11, 1), (13, 1)]
]

/-- Partial product 860 for generator 27. -/
def ep_Q2_054_partial_27_0860 : Poly :=
[
  term ((-357939983748 : Rat) / 45033486517) [(8, 2), (10, 1), (11, 1), (13, 1)],
  term ((715879967496 : Rat) / 45033486517) [(8, 2), (10, 1), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 860 for generator 27. -/
theorem ep_Q2_054_partial_27_0860_valid :
    mulPoly ep_Q2_054_coefficient_27_0860
        ep_Q2_054_generator_27_0800_0899 =
      ep_Q2_054_partial_27_0860 := by
  native_decide

/-- Coefficient term 861 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0861 : Poly :=
[
  term ((-178969991874 : Rat) / 45033486517) [(8, 2), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 861 for generator 27. -/
def ep_Q2_054_partial_27_0861 : Poly :=
[
  term ((-357939983748 : Rat) / 45033486517) [(8, 2), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((178969991874 : Rat) / 45033486517) [(8, 2), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 861 for generator 27. -/
theorem ep_Q2_054_partial_27_0861_valid :
    mulPoly ep_Q2_054_coefficient_27_0861
        ep_Q2_054_generator_27_0800_0899 =
      ep_Q2_054_partial_27_0861 := by
  native_decide

/-- Coefficient term 862 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0862 : Poly :=
[
  term ((1138556322936 : Rat) / 45033486517) [(8, 2), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 862 for generator 27. -/
def ep_Q2_054_partial_27_0862 : Poly :=
[
  term ((2277112645872 : Rat) / 45033486517) [(8, 2), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1138556322936 : Rat) / 45033486517) [(8, 2), (10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 862 for generator 27. -/
theorem ep_Q2_054_partial_27_0862_valid :
    mulPoly ep_Q2_054_coefficient_27_0862
        ep_Q2_054_generator_27_0800_0899 =
      ep_Q2_054_partial_27_0862 := by
  native_decide

/-- Coefficient term 863 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0863 : Poly :=
[
  term ((-569278161468 : Rat) / 45033486517) [(8, 2), (10, 1), (15, 2)]
]

/-- Partial product 863 for generator 27. -/
def ep_Q2_054_partial_27_0863 : Poly :=
[
  term ((-1138556322936 : Rat) / 45033486517) [(8, 2), (10, 1), (14, 1), (15, 2)],
  term ((569278161468 : Rat) / 45033486517) [(8, 2), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 863 for generator 27. -/
theorem ep_Q2_054_partial_27_0863_valid :
    mulPoly ep_Q2_054_coefficient_27_0863
        ep_Q2_054_generator_27_0800_0899 =
      ep_Q2_054_partial_27_0863 := by
  native_decide

/-- Coefficient term 864 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0864 : Poly :=
[
  term ((-959586331062 : Rat) / 45033486517) [(8, 2), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 864 for generator 27. -/
def ep_Q2_054_partial_27_0864 : Poly :=
[
  term ((-1919172662124 : Rat) / 45033486517) [(8, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((959586331062 : Rat) / 45033486517) [(8, 2), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 864 for generator 27. -/
theorem ep_Q2_054_partial_27_0864_valid :
    mulPoly ep_Q2_054_coefficient_27_0864
        ep_Q2_054_generator_27_0800_0899 =
      ep_Q2_054_partial_27_0864 := by
  native_decide

/-- Coefficient term 865 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0865 : Poly :=
[
  term ((-89484995937 : Rat) / 45033486517) [(8, 2), (11, 1), (13, 1)]
]

/-- Partial product 865 for generator 27. -/
def ep_Q2_054_partial_27_0865 : Poly :=
[
  term ((89484995937 : Rat) / 45033486517) [(8, 2), (11, 1), (13, 1)],
  term ((-178969991874 : Rat) / 45033486517) [(8, 2), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 865 for generator 27. -/
theorem ep_Q2_054_partial_27_0865_valid :
    mulPoly ep_Q2_054_coefficient_27_0865
        ep_Q2_054_generator_27_0800_0899 =
      ep_Q2_054_partial_27_0865 := by
  native_decide

/-- Coefficient term 866 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0866 : Poly :=
[
  term ((-178969991874 : Rat) / 45033486517) [(8, 2), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 866 for generator 27. -/
def ep_Q2_054_partial_27_0866 : Poly :=
[
  term ((178969991874 : Rat) / 45033486517) [(8, 2), (11, 1), (13, 1), (14, 1)],
  term ((-357939983748 : Rat) / 45033486517) [(8, 2), (11, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 866 for generator 27. -/
theorem ep_Q2_054_partial_27_0866_valid :
    mulPoly ep_Q2_054_coefficient_27_0866
        ep_Q2_054_generator_27_0800_0899 =
      ep_Q2_054_partial_27_0866 := by
  native_decide

/-- Coefficient term 867 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0867 : Poly :=
[
  term ((569278161468 : Rat) / 45033486517) [(8, 2), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 867 for generator 27. -/
def ep_Q2_054_partial_27_0867 : Poly :=
[
  term ((-569278161468 : Rat) / 45033486517) [(8, 2), (11, 1), (14, 1), (15, 1)],
  term ((1138556322936 : Rat) / 45033486517) [(8, 2), (11, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 867 for generator 27. -/
theorem ep_Q2_054_partial_27_0867_valid :
    mulPoly ep_Q2_054_coefficient_27_0867
        ep_Q2_054_generator_27_0800_0899 =
      ep_Q2_054_partial_27_0867 := by
  native_decide

/-- Coefficient term 868 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0868 : Poly :=
[
  term ((-674947250328 : Rat) / 45033486517) [(8, 2), (11, 1), (15, 1)]
]

/-- Partial product 868 for generator 27. -/
def ep_Q2_054_partial_27_0868 : Poly :=
[
  term ((-1349894500656 : Rat) / 45033486517) [(8, 2), (11, 1), (14, 1), (15, 1)],
  term ((674947250328 : Rat) / 45033486517) [(8, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 868 for generator 27. -/
theorem ep_Q2_054_partial_27_0868_valid :
    mulPoly ep_Q2_054_coefficient_27_0868
        ep_Q2_054_generator_27_0800_0899 =
      ep_Q2_054_partial_27_0868 := by
  native_decide

/-- Coefficient term 869 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0869 : Poly :=
[
  term ((-268454987811 : Rat) / 45033486517) [(8, 2), (11, 2)]
]

/-- Partial product 869 for generator 27. -/
def ep_Q2_054_partial_27_0869 : Poly :=
[
  term ((268454987811 : Rat) / 45033486517) [(8, 2), (11, 2)],
  term ((-536909975622 : Rat) / 45033486517) [(8, 2), (11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 869 for generator 27. -/
theorem ep_Q2_054_partial_27_0869_valid :
    mulPoly ep_Q2_054_coefficient_27_0869
        ep_Q2_054_generator_27_0800_0899 =
      ep_Q2_054_partial_27_0869 := by
  native_decide

/-- Coefficient term 870 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0870 : Poly :=
[
  term ((-357939983748 : Rat) / 45033486517) [(8, 2), (11, 2), (12, 1)]
]

/-- Partial product 870 for generator 27. -/
def ep_Q2_054_partial_27_0870 : Poly :=
[
  term ((357939983748 : Rat) / 45033486517) [(8, 2), (11, 2), (12, 1)],
  term ((-715879967496 : Rat) / 45033486517) [(8, 2), (11, 2), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 870 for generator 27. -/
theorem ep_Q2_054_partial_27_0870_valid :
    mulPoly ep_Q2_054_coefficient_27_0870
        ep_Q2_054_generator_27_0800_0899 =
      ep_Q2_054_partial_27_0870 := by
  native_decide

/-- Coefficient term 871 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0871 : Poly :=
[
  term ((178969991874 : Rat) / 45033486517) [(8, 2), (11, 2), (14, 1)]
]

/-- Partial product 871 for generator 27. -/
def ep_Q2_054_partial_27_0871 : Poly :=
[
  term ((-178969991874 : Rat) / 45033486517) [(8, 2), (11, 2), (14, 1)],
  term ((357939983748 : Rat) / 45033486517) [(8, 2), (11, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 871 for generator 27. -/
theorem ep_Q2_054_partial_27_0871_valid :
    mulPoly ep_Q2_054_coefficient_27_0871
        ep_Q2_054_generator_27_0800_0899 =
      ep_Q2_054_partial_27_0871 := by
  native_decide

/-- Coefficient term 872 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0872 : Poly :=
[
  term ((-268454987811 : Rat) / 45033486517) [(8, 2), (12, 1)]
]

/-- Partial product 872 for generator 27. -/
def ep_Q2_054_partial_27_0872 : Poly :=
[
  term ((268454987811 : Rat) / 45033486517) [(8, 2), (12, 1)],
  term ((-536909975622 : Rat) / 45033486517) [(8, 2), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 872 for generator 27. -/
theorem ep_Q2_054_partial_27_0872_valid :
    mulPoly ep_Q2_054_coefficient_27_0872
        ep_Q2_054_generator_27_0800_0899 =
      ep_Q2_054_partial_27_0872 := by
  native_decide

/-- Coefficient term 873 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0873 : Poly :=
[
  term ((569278161468 : Rat) / 45033486517) [(8, 2), (12, 1), (15, 2)]
]

/-- Partial product 873 for generator 27. -/
def ep_Q2_054_partial_27_0873 : Poly :=
[
  term ((1138556322936 : Rat) / 45033486517) [(8, 2), (12, 1), (14, 1), (15, 2)],
  term ((-569278161468 : Rat) / 45033486517) [(8, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 873 for generator 27. -/
theorem ep_Q2_054_partial_27_0873_valid :
    mulPoly ep_Q2_054_coefficient_27_0873
        ep_Q2_054_generator_27_0800_0899 =
      ep_Q2_054_partial_27_0873 := by
  native_decide

/-- Coefficient term 874 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0874 : Poly :=
[
  term ((-569278161468 : Rat) / 45033486517) [(8, 2), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 874 for generator 27. -/
def ep_Q2_054_partial_27_0874 : Poly :=
[
  term ((569278161468 : Rat) / 45033486517) [(8, 2), (13, 1), (14, 1), (15, 1)],
  term ((-1138556322936 : Rat) / 45033486517) [(8, 2), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 874 for generator 27. -/
theorem ep_Q2_054_partial_27_0874_valid :
    mulPoly ep_Q2_054_coefficient_27_0874
        ep_Q2_054_generator_27_0800_0899 =
      ep_Q2_054_partial_27_0874 := by
  native_decide

/-- Coefficient term 875 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0875 : Poly :=
[
  term ((-284639080734 : Rat) / 45033486517) [(8, 2), (13, 1), (15, 1)]
]

/-- Partial product 875 for generator 27. -/
def ep_Q2_054_partial_27_0875 : Poly :=
[
  term ((-569278161468 : Rat) / 45033486517) [(8, 2), (13, 1), (14, 1), (15, 1)],
  term ((284639080734 : Rat) / 45033486517) [(8, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 875 for generator 27. -/
theorem ep_Q2_054_partial_27_0875_valid :
    mulPoly ep_Q2_054_coefficient_27_0875
        ep_Q2_054_generator_27_0800_0899 =
      ep_Q2_054_partial_27_0875 := by
  native_decide

/-- Coefficient term 876 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0876 : Poly :=
[
  term ((155677659219 : Rat) / 45033486517) [(8, 2), (14, 1)]
]

/-- Partial product 876 for generator 27. -/
def ep_Q2_054_partial_27_0876 : Poly :=
[
  term ((-155677659219 : Rat) / 45033486517) [(8, 2), (14, 1)],
  term ((311355318438 : Rat) / 45033486517) [(8, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 876 for generator 27. -/
theorem ep_Q2_054_partial_27_0876_valid :
    mulPoly ep_Q2_054_coefficient_27_0876
        ep_Q2_054_generator_27_0800_0899 =
      ep_Q2_054_partial_27_0876 := by
  native_decide

/-- Coefficient term 877 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0877 : Poly :=
[
  term ((569278161468 : Rat) / 45033486517) [(8, 2), (15, 2)]
]

/-- Partial product 877 for generator 27. -/
def ep_Q2_054_partial_27_0877 : Poly :=
[
  term ((1138556322936 : Rat) / 45033486517) [(8, 2), (14, 1), (15, 2)],
  term ((-569278161468 : Rat) / 45033486517) [(8, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 877 for generator 27. -/
theorem ep_Q2_054_partial_27_0877_valid :
    mulPoly ep_Q2_054_coefficient_27_0877
        ep_Q2_054_generator_27_0800_0899 =
      ep_Q2_054_partial_27_0877 := by
  native_decide

/-- Coefficient term 878 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0878 : Poly :=
[
  term ((5687773837242 : Rat) / 45033486517) [(9, 1), (10, 1), (11, 1)]
]

/-- Partial product 878 for generator 27. -/
def ep_Q2_054_partial_27_0878 : Poly :=
[
  term ((-5687773837242 : Rat) / 45033486517) [(9, 1), (10, 1), (11, 1)],
  term ((11375547674484 : Rat) / 45033486517) [(9, 1), (10, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 878 for generator 27. -/
theorem ep_Q2_054_partial_27_0878_valid :
    mulPoly ep_Q2_054_coefficient_27_0878
        ep_Q2_054_generator_27_0800_0899 =
      ep_Q2_054_partial_27_0878 := by
  native_decide

/-- Coefficient term 879 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0879 : Poly :=
[
  term ((-265368762711 : Rat) / 45033486517) [(9, 1), (10, 1), (11, 1), (12, 1)]
]

/-- Partial product 879 for generator 27. -/
def ep_Q2_054_partial_27_0879 : Poly :=
[
  term ((265368762711 : Rat) / 45033486517) [(9, 1), (10, 1), (11, 1), (12, 1)],
  term ((-530737525422 : Rat) / 45033486517) [(9, 1), (10, 1), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 879 for generator 27. -/
theorem ep_Q2_054_partial_27_0879_valid :
    mulPoly ep_Q2_054_coefficient_27_0879
        ep_Q2_054_generator_27_0800_0899 =
      ep_Q2_054_partial_27_0879 := by
  native_decide

/-- Coefficient term 880 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0880 : Poly :=
[
  term ((-27437863953468 : Rat) / 45033486517) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 880 for generator 27. -/
def ep_Q2_054_partial_27_0880 : Poly :=
[
  term ((-54875727906936 : Rat) / 45033486517) [(9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((27437863953468 : Rat) / 45033486517) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 880 for generator 27. -/
theorem ep_Q2_054_partial_27_0880_valid :
    mulPoly ep_Q2_054_coefficient_27_0880
        ep_Q2_054_generator_27_0800_0899 =
      ep_Q2_054_partial_27_0880 := by
  native_decide

/-- Coefficient term 881 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0881 : Poly :=
[
  term ((13718931976734 : Rat) / 45033486517) [(9, 1), (10, 1), (11, 1), (15, 2)]
]

/-- Partial product 881 for generator 27. -/
def ep_Q2_054_partial_27_0881 : Poly :=
[
  term ((27437863953468 : Rat) / 45033486517) [(9, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((-13718931976734 : Rat) / 45033486517) [(9, 1), (10, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 881 for generator 27. -/
theorem ep_Q2_054_partial_27_0881_valid :
    mulPoly ep_Q2_054_coefficient_27_0881
        ep_Q2_054_generator_27_0800_0899 =
      ep_Q2_054_partial_27_0881 := by
  native_decide

/-- Coefficient term 882 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0882 : Poly :=
[
  term ((3838589777457 : Rat) / 90066973034) [(9, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 882 for generator 27. -/
def ep_Q2_054_partial_27_0882 : Poly :=
[
  term ((3838589777457 : Rat) / 45033486517) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-3838589777457 : Rat) / 90066973034) [(9, 1), (10, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 882 for generator 27. -/
theorem ep_Q2_054_partial_27_0882_valid :
    mulPoly ep_Q2_054_coefficient_27_0882
        ep_Q2_054_generator_27_0800_0899 =
      ep_Q2_054_partial_27_0882 := by
  native_decide

/-- Coefficient term 883 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0883 : Poly :=
[
  term ((-52230060302759 : Rat) / 180133946068) [(9, 1), (10, 1), (13, 1)]
]

/-- Partial product 883 for generator 27. -/
def ep_Q2_054_partial_27_0883 : Poly :=
[
  term ((52230060302759 : Rat) / 180133946068) [(9, 1), (10, 1), (13, 1)],
  term ((-52230060302759 : Rat) / 90066973034) [(9, 1), (10, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 883 for generator 27. -/
theorem ep_Q2_054_partial_27_0883_valid :
    mulPoly ep_Q2_054_coefficient_27_0883
        ep_Q2_054_generator_27_0800_0899 =
      ep_Q2_054_partial_27_0883 := by
  native_decide

/-- Coefficient term 884 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0884 : Poly :=
[
  term ((4803268469100 : Rat) / 45033486517) [(9, 1), (10, 1), (15, 1)]
]

/-- Partial product 884 for generator 27. -/
def ep_Q2_054_partial_27_0884 : Poly :=
[
  term ((9606536938200 : Rat) / 45033486517) [(9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-4803268469100 : Rat) / 45033486517) [(9, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 884 for generator 27. -/
theorem ep_Q2_054_partial_27_0884_valid :
    mulPoly ep_Q2_054_coefficient_27_0884
        ep_Q2_054_generator_27_0800_0899 =
      ep_Q2_054_partial_27_0884 := by
  native_decide

/-- Coefficient term 885 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0885 : Poly :=
[
  term ((2076293015355 : Rat) / 90066973034) [(9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 885 for generator 27. -/
def ep_Q2_054_partial_27_0885 : Poly :=
[
  term ((2076293015355 : Rat) / 45033486517) [(9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2076293015355 : Rat) / 90066973034) [(9, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 885 for generator 27. -/
theorem ep_Q2_054_partial_27_0885_valid :
    mulPoly ep_Q2_054_coefficient_27_0885
        ep_Q2_054_generator_27_0800_0899 =
      ep_Q2_054_partial_27_0885 := by
  native_decide

/-- Coefficient term 886 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0886 : Poly :=
[
  term ((-1198235030517 : Rat) / 45033486517) [(9, 1), (11, 1)]
]

/-- Partial product 886 for generator 27. -/
def ep_Q2_054_partial_27_0886 : Poly :=
[
  term ((1198235030517 : Rat) / 45033486517) [(9, 1), (11, 1)],
  term ((-2396470061034 : Rat) / 45033486517) [(9, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 886 for generator 27. -/
theorem ep_Q2_054_partial_27_0886_valid :
    mulPoly ep_Q2_054_coefficient_27_0886
        ep_Q2_054_generator_27_0800_0899 =
      ep_Q2_054_partial_27_0886 := by
  native_decide

/-- Coefficient term 887 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0887 : Poly :=
[
  term ((10884842183827 : Rat) / 90066973034) [(9, 1), (11, 1), (12, 1)]
]

/-- Partial product 887 for generator 27. -/
def ep_Q2_054_partial_27_0887 : Poly :=
[
  term ((-10884842183827 : Rat) / 90066973034) [(9, 1), (11, 1), (12, 1)],
  term ((10884842183827 : Rat) / 45033486517) [(9, 1), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 887 for generator 27. -/
theorem ep_Q2_054_partial_27_0887_valid :
    mulPoly ep_Q2_054_coefficient_27_0887
        ep_Q2_054_generator_27_0800_0899 =
      ep_Q2_054_partial_27_0887 := by
  native_decide

/-- Coefficient term 888 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0888 : Poly :=
[
  term ((265368762711 : Rat) / 90066973034) [(9, 1), (11, 1), (12, 1), (14, 1)]
]

/-- Partial product 888 for generator 27. -/
def ep_Q2_054_partial_27_0888 : Poly :=
[
  term ((-265368762711 : Rat) / 90066973034) [(9, 1), (11, 1), (12, 1), (14, 1)],
  term ((265368762711 : Rat) / 45033486517) [(9, 1), (11, 1), (12, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 888 for generator 27. -/
theorem ep_Q2_054_partial_27_0888_valid :
    mulPoly ep_Q2_054_coefficient_27_0888
        ep_Q2_054_generator_27_0800_0899 =
      ep_Q2_054_partial_27_0888 := by
  native_decide

/-- Coefficient term 889 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0889 : Poly :=
[
  term ((-13718931976734 : Rat) / 45033486517) [(9, 1), (11, 1), (12, 1), (15, 2)]
]

/-- Partial product 889 for generator 27. -/
def ep_Q2_054_partial_27_0889 : Poly :=
[
  term ((-27437863953468 : Rat) / 45033486517) [(9, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((13718931976734 : Rat) / 45033486517) [(9, 1), (11, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 889 for generator 27. -/
theorem ep_Q2_054_partial_27_0889_valid :
    mulPoly ep_Q2_054_coefficient_27_0889
        ep_Q2_054_generator_27_0800_0899 =
      ep_Q2_054_partial_27_0889 := by
  native_decide

/-- Coefficient term 890 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0890 : Poly :=
[
  term ((13718931976734 : Rat) / 45033486517) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 890 for generator 27. -/
def ep_Q2_054_partial_27_0890 : Poly :=
[
  term ((-13718931976734 : Rat) / 45033486517) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((27437863953468 : Rat) / 45033486517) [(9, 1), (11, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 890 for generator 27. -/
theorem ep_Q2_054_partial_27_0890_valid :
    mulPoly ep_Q2_054_coefficient_27_0890
        ep_Q2_054_generator_27_0800_0899 =
      ep_Q2_054_partial_27_0890 := by
  native_decide

/-- Coefficient term 891 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0891 : Poly :=
[
  term ((6859465988367 : Rat) / 45033486517) [(9, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 891 for generator 27. -/
def ep_Q2_054_partial_27_0891 : Poly :=
[
  term ((13718931976734 : Rat) / 45033486517) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-6859465988367 : Rat) / 45033486517) [(9, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 891 for generator 27. -/
theorem ep_Q2_054_partial_27_0891_valid :
    mulPoly ep_Q2_054_coefficient_27_0891
        ep_Q2_054_generator_27_0800_0899 =
      ep_Q2_054_partial_27_0891 := by
  native_decide

/-- Coefficient term 892 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0892 : Poly :=
[
  term ((-1320739518202 : Rat) / 45033486517) [(9, 1), (11, 1), (14, 1)]
]

/-- Partial product 892 for generator 27. -/
def ep_Q2_054_partial_27_0892 : Poly :=
[
  term ((1320739518202 : Rat) / 45033486517) [(9, 1), (11, 1), (14, 1)],
  term ((-2641479036404 : Rat) / 45033486517) [(9, 1), (11, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 892 for generator 27. -/
theorem ep_Q2_054_partial_27_0892_valid :
    mulPoly ep_Q2_054_coefficient_27_0892
        ep_Q2_054_generator_27_0800_0899 =
      ep_Q2_054_partial_27_0892 := by
  native_decide

/-- Coefficient term 893 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0893 : Poly :=
[
  term ((-13718931976734 : Rat) / 45033486517) [(9, 1), (11, 1), (15, 2)]
]

/-- Partial product 893 for generator 27. -/
def ep_Q2_054_partial_27_0893 : Poly :=
[
  term ((-27437863953468 : Rat) / 45033486517) [(9, 1), (11, 1), (14, 1), (15, 2)],
  term ((13718931976734 : Rat) / 45033486517) [(9, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 893 for generator 27. -/
theorem ep_Q2_054_partial_27_0893_valid :
    mulPoly ep_Q2_054_coefficient_27_0893
        ep_Q2_054_generator_27_0800_0899 =
      ep_Q2_054_partial_27_0893 := by
  native_decide

/-- Coefficient term 894 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0894 : Poly :=
[
  term ((27437863953468 : Rat) / 45033486517) [(9, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 894 for generator 27. -/
def ep_Q2_054_partial_27_0894 : Poly :=
[
  term ((54875727906936 : Rat) / 45033486517) [(9, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-27437863953468 : Rat) / 45033486517) [(9, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 894 for generator 27. -/
theorem ep_Q2_054_partial_27_0894_valid :
    mulPoly ep_Q2_054_coefficient_27_0894
        ep_Q2_054_generator_27_0800_0899 =
      ep_Q2_054_partial_27_0894 := by
  native_decide

/-- Coefficient term 895 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0895 : Poly :=
[
  term ((-13718931976734 : Rat) / 45033486517) [(9, 1), (11, 2), (14, 1), (15, 1)]
]

/-- Partial product 895 for generator 27. -/
def ep_Q2_054_partial_27_0895 : Poly :=
[
  term ((13718931976734 : Rat) / 45033486517) [(9, 1), (11, 2), (14, 1), (15, 1)],
  term ((-27437863953468 : Rat) / 45033486517) [(9, 1), (11, 2), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 895 for generator 27. -/
theorem ep_Q2_054_partial_27_0895_valid :
    mulPoly ep_Q2_054_coefficient_27_0895
        ep_Q2_054_generator_27_0800_0899 =
      ep_Q2_054_partial_27_0895 := by
  native_decide

/-- Coefficient term 896 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0896 : Poly :=
[
  term ((20578397965101 : Rat) / 45033486517) [(9, 1), (11, 2), (15, 1)]
]

/-- Partial product 896 for generator 27. -/
def ep_Q2_054_partial_27_0896 : Poly :=
[
  term ((41156795930202 : Rat) / 45033486517) [(9, 1), (11, 2), (14, 1), (15, 1)],
  term ((-20578397965101 : Rat) / 45033486517) [(9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 896 for generator 27. -/
theorem ep_Q2_054_partial_27_0896_valid :
    mulPoly ep_Q2_054_coefficient_27_0896
        ep_Q2_054_generator_27_0800_0899 =
      ep_Q2_054_partial_27_0896 := by
  native_decide

/-- Coefficient term 897 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0897 : Poly :=
[
  term ((1939233265965 : Rat) / 90066973034) [(9, 1), (12, 1), (13, 1)]
]

/-- Partial product 897 for generator 27. -/
def ep_Q2_054_partial_27_0897 : Poly :=
[
  term ((-1939233265965 : Rat) / 90066973034) [(9, 1), (12, 1), (13, 1)],
  term ((1939233265965 : Rat) / 45033486517) [(9, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 897 for generator 27. -/
theorem ep_Q2_054_partial_27_0897_valid :
    mulPoly ep_Q2_054_coefficient_27_0897
        ep_Q2_054_generator_27_0800_0899 =
      ep_Q2_054_partial_27_0897 := by
  native_decide

/-- Coefficient term 898 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0898 : Poly :=
[
  term ((-114948700083063 : Rat) / 180133946068) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 898 for generator 27. -/
def ep_Q2_054_partial_27_0898 : Poly :=
[
  term ((-114948700083063 : Rat) / 90066973034) [(9, 1), (12, 1), (14, 1), (15, 1)],
  term ((114948700083063 : Rat) / 180133946068) [(9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 898 for generator 27. -/
theorem ep_Q2_054_partial_27_0898_valid :
    mulPoly ep_Q2_054_coefficient_27_0898
        ep_Q2_054_generator_27_0800_0899 =
      ep_Q2_054_partial_27_0898 := by
  native_decide

/-- Coefficient term 899 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0899 : Poly :=
[
  term ((-958289084010 : Rat) / 45033486517) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 899 for generator 27. -/
def ep_Q2_054_partial_27_0899 : Poly :=
[
  term ((-1916578168020 : Rat) / 45033486517) [(9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((958289084010 : Rat) / 45033486517) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 899 for generator 27. -/
theorem ep_Q2_054_partial_27_0899_valid :
    mulPoly ep_Q2_054_coefficient_27_0899
        ep_Q2_054_generator_27_0800_0899 =
      ep_Q2_054_partial_27_0899 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_054_partials_27_0800_0899 : List Poly :=
[
  ep_Q2_054_partial_27_0800,
  ep_Q2_054_partial_27_0801,
  ep_Q2_054_partial_27_0802,
  ep_Q2_054_partial_27_0803,
  ep_Q2_054_partial_27_0804,
  ep_Q2_054_partial_27_0805,
  ep_Q2_054_partial_27_0806,
  ep_Q2_054_partial_27_0807,
  ep_Q2_054_partial_27_0808,
  ep_Q2_054_partial_27_0809,
  ep_Q2_054_partial_27_0810,
  ep_Q2_054_partial_27_0811,
  ep_Q2_054_partial_27_0812,
  ep_Q2_054_partial_27_0813,
  ep_Q2_054_partial_27_0814,
  ep_Q2_054_partial_27_0815,
  ep_Q2_054_partial_27_0816,
  ep_Q2_054_partial_27_0817,
  ep_Q2_054_partial_27_0818,
  ep_Q2_054_partial_27_0819,
  ep_Q2_054_partial_27_0820,
  ep_Q2_054_partial_27_0821,
  ep_Q2_054_partial_27_0822,
  ep_Q2_054_partial_27_0823,
  ep_Q2_054_partial_27_0824,
  ep_Q2_054_partial_27_0825,
  ep_Q2_054_partial_27_0826,
  ep_Q2_054_partial_27_0827,
  ep_Q2_054_partial_27_0828,
  ep_Q2_054_partial_27_0829,
  ep_Q2_054_partial_27_0830,
  ep_Q2_054_partial_27_0831,
  ep_Q2_054_partial_27_0832,
  ep_Q2_054_partial_27_0833,
  ep_Q2_054_partial_27_0834,
  ep_Q2_054_partial_27_0835,
  ep_Q2_054_partial_27_0836,
  ep_Q2_054_partial_27_0837,
  ep_Q2_054_partial_27_0838,
  ep_Q2_054_partial_27_0839,
  ep_Q2_054_partial_27_0840,
  ep_Q2_054_partial_27_0841,
  ep_Q2_054_partial_27_0842,
  ep_Q2_054_partial_27_0843,
  ep_Q2_054_partial_27_0844,
  ep_Q2_054_partial_27_0845,
  ep_Q2_054_partial_27_0846,
  ep_Q2_054_partial_27_0847,
  ep_Q2_054_partial_27_0848,
  ep_Q2_054_partial_27_0849,
  ep_Q2_054_partial_27_0850,
  ep_Q2_054_partial_27_0851,
  ep_Q2_054_partial_27_0852,
  ep_Q2_054_partial_27_0853,
  ep_Q2_054_partial_27_0854,
  ep_Q2_054_partial_27_0855,
  ep_Q2_054_partial_27_0856,
  ep_Q2_054_partial_27_0857,
  ep_Q2_054_partial_27_0858,
  ep_Q2_054_partial_27_0859,
  ep_Q2_054_partial_27_0860,
  ep_Q2_054_partial_27_0861,
  ep_Q2_054_partial_27_0862,
  ep_Q2_054_partial_27_0863,
  ep_Q2_054_partial_27_0864,
  ep_Q2_054_partial_27_0865,
  ep_Q2_054_partial_27_0866,
  ep_Q2_054_partial_27_0867,
  ep_Q2_054_partial_27_0868,
  ep_Q2_054_partial_27_0869,
  ep_Q2_054_partial_27_0870,
  ep_Q2_054_partial_27_0871,
  ep_Q2_054_partial_27_0872,
  ep_Q2_054_partial_27_0873,
  ep_Q2_054_partial_27_0874,
  ep_Q2_054_partial_27_0875,
  ep_Q2_054_partial_27_0876,
  ep_Q2_054_partial_27_0877,
  ep_Q2_054_partial_27_0878,
  ep_Q2_054_partial_27_0879,
  ep_Q2_054_partial_27_0880,
  ep_Q2_054_partial_27_0881,
  ep_Q2_054_partial_27_0882,
  ep_Q2_054_partial_27_0883,
  ep_Q2_054_partial_27_0884,
  ep_Q2_054_partial_27_0885,
  ep_Q2_054_partial_27_0886,
  ep_Q2_054_partial_27_0887,
  ep_Q2_054_partial_27_0888,
  ep_Q2_054_partial_27_0889,
  ep_Q2_054_partial_27_0890,
  ep_Q2_054_partial_27_0891,
  ep_Q2_054_partial_27_0892,
  ep_Q2_054_partial_27_0893,
  ep_Q2_054_partial_27_0894,
  ep_Q2_054_partial_27_0895,
  ep_Q2_054_partial_27_0896,
  ep_Q2_054_partial_27_0897,
  ep_Q2_054_partial_27_0898,
  ep_Q2_054_partial_27_0899
]

/-- Sum of partial products in this block. -/
def ep_Q2_054_block_27_0800_0899 : Poly :=
[
  term ((60893008650 : Rat) / 45033486517) [(7, 2), (11, 2), (12, 1)],
  term ((-121786017300 : Rat) / 45033486517) [(7, 2), (11, 2), (12, 1), (14, 1)],
  term ((-30446504325 : Rat) / 45033486517) [(7, 2), (11, 2), (14, 1)],
  term ((60893008650 : Rat) / 45033486517) [(7, 2), (11, 2), (14, 2)],
  term ((-1617913836891 : Rat) / 180133946068) [(7, 2), (12, 1)],
  term ((1617913836891 : Rat) / 90066973034) [(7, 2), (12, 1), (14, 1)],
  term ((-267619708935 : Rat) / 90066973034) [(7, 2), (12, 2)],
  term ((267619708935 : Rat) / 45033486517) [(7, 2), (12, 2), (14, 1)],
  term ((245559985209 : Rat) / 45033486517) [(7, 2), (14, 1)],
  term ((-491119970418 : Rat) / 45033486517) [(7, 2), (14, 2)],
  term ((1702043680185 : Rat) / 45033486517) [(8, 1)],
  term ((-463091117583 : Rat) / 45033486517) [(8, 1), (9, 1), (10, 1), (11, 1)],
  term ((926182235166 : Rat) / 45033486517) [(8, 1), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((46170916926 : Rat) / 45033486517) [(8, 1), (9, 1), (10, 1), (13, 1)],
  term ((-92341833852 : Rat) / 45033486517) [(8, 1), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((-84764751204 : Rat) / 45033486517) [(8, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((42382375602 : Rat) / 45033486517) [(8, 1), (9, 1), (10, 1), (15, 1)],
  term ((416713326465 : Rat) / 45033486517) [(8, 1), (9, 1), (11, 1)],
  term ((580224054633 : Rat) / 45033486517) [(8, 1), (9, 1), (11, 1), (12, 1)],
  term ((-1160448109266 : Rat) / 45033486517) [(8, 1), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((-1160448109266 : Rat) / 45033486517) [(8, 1), (9, 1), (11, 1), (14, 1)],
  term ((654042912672 : Rat) / 45033486517) [(8, 1), (9, 1), (11, 1), (14, 2)],
  term ((-650102591688 : Rat) / 45033486517) [(8, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((325051295844 : Rat) / 45033486517) [(8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-346813815507 : Rat) / 45033486517) [(8, 1), (9, 1), (13, 1)],
  term ((653215415904 : Rat) / 45033486517) [(8, 1), (9, 1), (13, 1), (14, 1)],
  term ((80824430220 : Rat) / 45033486517) [(8, 1), (9, 1), (13, 1), (14, 2)],
  term ((2103710916 : Rat) / 166175227) [(8, 1), (9, 1), (14, 1), (15, 1)],
  term ((-1051855458 : Rat) / 166175227) [(8, 1), (9, 1), (15, 1)],
  term ((-3202559078829 : Rat) / 45033486517) [(8, 1), (10, 1)],
  term ((-15866815881 : Rat) / 166175227) [(8, 1), (10, 1), (11, 1), (13, 1)],
  term ((31733631762 : Rat) / 166175227) [(8, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-22730656535574 : Rat) / 45033486517) [(8, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-437701257078 : Rat) / 45033486517) [(8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((11365328267787 : Rat) / 45033486517) [(8, 1), (10, 1), (11, 1), (15, 1)],
  term ((218850628539 : Rat) / 45033486517) [(8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((268454987811 : Rat) / 45033486517) [(8, 1), (10, 1), (11, 2)],
  term ((-536909975622 : Rat) / 45033486517) [(8, 1), (10, 1), (11, 2), (14, 1)],
  term ((-89484995937 : Rat) / 90066973034) [(8, 1), (10, 1), (12, 1)],
  term ((27023080160304 : Rat) / 45033486517) [(8, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-13511540080152 : Rat) / 45033486517) [(8, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((89484995937 : Rat) / 45033486517) [(8, 1), (10, 1), (12, 1), (14, 1)],
  term ((-13511540080152 : Rat) / 45033486517) [(8, 1), (10, 1), (12, 1), (14, 1), (15, 2)],
  term ((-100579066131 : Rat) / 45033486517) [(8, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((6755770040076 : Rat) / 45033486517) [(8, 1), (10, 1), (12, 1), (15, 2)],
  term ((100579066131 : Rat) / 90066973034) [(8, 1), (10, 1), (12, 1), (16, 1)],
  term ((-127878715300604 : Rat) / 45033486517) [(8, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((201158132262 : Rat) / 45033486517) [(8, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((63939357650302 : Rat) / 45033486517) [(8, 1), (10, 1), (13, 1), (15, 1)],
  term ((-100579066131 : Rat) / 45033486517) [(8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((6405118157658 : Rat) / 45033486517) [(8, 1), (10, 1), (14, 1)],
  term ((7988355476374 : Rat) / 45033486517) [(8, 1), (10, 1), (14, 1), (15, 2)],
  term ((-319429694670 : Rat) / 45033486517) [(8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((100579066131 : Rat) / 90066973034) [(8, 1), (10, 1), (14, 1), (16, 1)],
  term ((-3994177738187 : Rat) / 45033486517) [(8, 1), (10, 1), (15, 2)],
  term ((159714847335 : Rat) / 45033486517) [(8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-100579066131 : Rat) / 180133946068) [(8, 1), (10, 1), (16, 1)],
  term ((105066057248114 : Rat) / 45033486517) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-201158132262 : Rat) / 45033486517) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((13511540080152 : Rat) / 45033486517) [(8, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-55910913644095 : Rat) / 45033486517) [(8, 1), (11, 1), (12, 1), (15, 1)],
  term ((100579066131 : Rat) / 45033486517) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-27023080160304 : Rat) / 45033486517) [(8, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((13511540080152 : Rat) / 45033486517) [(8, 1), (11, 1), (12, 2), (15, 1)],
  term ((2105211053907 : Rat) / 90066973034) [(8, 1), (11, 1), (13, 1)],
  term ((-4210422107814 : Rat) / 45033486517) [(8, 1), (11, 1), (13, 1), (14, 2)],
  term ((41642046810488 : Rat) / 45033486517) [(8, 1), (11, 1), (14, 1), (15, 1)],
  term ((-201158132262 : Rat) / 45033486517) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7988355476374 : Rat) / 45033486517) [(8, 1), (11, 1), (14, 2), (15, 1)],
  term ((319429694670 : Rat) / 45033486517) [(8, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-37647869072301 : Rat) / 90066973034) [(8, 1), (11, 1), (15, 1)],
  term ((41443284927 : Rat) / 90066973034) [(8, 1), (11, 1), (15, 1), (16, 1)],
  term ((6315633161721 : Rat) / 90066973034) [(8, 1), (11, 2)],
  term ((4031452115940 : Rat) / 45033486517) [(8, 1), (11, 2), (12, 1)],
  term ((-8062904231880 : Rat) / 45033486517) [(8, 1), (11, 2), (12, 1), (14, 1)],
  term ((402316264524 : Rat) / 45033486517) [(8, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-201158132262 : Rat) / 45033486517) [(8, 1), (11, 2), (12, 1), (16, 1)],
  term ((-8420844215628 : Rat) / 45033486517) [(8, 1), (11, 2), (14, 1)],
  term ((402316264524 : Rat) / 45033486517) [(8, 1), (11, 2), (14, 1), (16, 1)],
  term ((4210422107814 : Rat) / 45033486517) [(8, 1), (11, 2), (14, 2)],
  term ((-201158132262 : Rat) / 45033486517) [(8, 1), (11, 2), (14, 2), (16, 1)],
  term ((-301737198393 : Rat) / 90066973034) [(8, 1), (11, 2), (16, 1)],
  term ((23367374944779 : Rat) / 180133946068) [(8, 1), (12, 1)],
  term ((-13511540080152 : Rat) / 45033486517) [(8, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((3377885020038 : Rat) / 45033486517) [(8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-23367374944779 : Rat) / 90066973034) [(8, 1), (12, 1), (14, 1)],
  term ((-9920174885266 : Rat) / 45033486517) [(8, 1), (12, 1), (14, 1), (15, 2)],
  term ((100579066131 : Rat) / 90066973034) [(8, 1), (12, 1), (14, 1), (16, 1)],
  term ((4960087442633 : Rat) / 45033486517) [(8, 1), (12, 1), (15, 2)],
  term ((-100579066131 : Rat) / 180133946068) [(8, 1), (12, 1), (16, 1)],
  term ((13511540080152 : Rat) / 45033486517) [(8, 1), (12, 2), (14, 1), (15, 2)],
  term ((-6755770040076 : Rat) / 45033486517) [(8, 1), (12, 2), (15, 2)],
  term ((28541510476464 : Rat) / 45033486517) [(8, 1), (13, 1), (14, 1), (15, 1)],
  term ((23431714965418 : Rat) / 45033486517) [(8, 1), (13, 1), (14, 2), (15, 1)],
  term ((-40257367959173 : Rat) / 90066973034) [(8, 1), (13, 1), (15, 1)],
  term ((-3372736799157 : Rat) / 45033486517) [(8, 1), (14, 1)],
  term ((-13023300793786 : Rat) / 45033486517) [(8, 1), (14, 1), (15, 2)],
  term ((1916578168020 : Rat) / 45033486517) [(8, 1), (14, 1), (15, 2), (16, 1)],
  term ((100579066131 : Rat) / 90066973034) [(8, 1), (14, 1), (16, 1)],
  term ((-62701122426 : Rat) / 45033486517) [(8, 1), (14, 2)],
  term ((6511650396893 : Rat) / 45033486517) [(8, 1), (15, 2)],
  term ((-958289084010 : Rat) / 45033486517) [(8, 1), (15, 2), (16, 1)],
  term ((-100579066131 : Rat) / 180133946068) [(8, 1), (16, 1)],
  term ((1003942953279 : Rat) / 90066973034) [(8, 2)],
  term ((-268454987811 : Rat) / 45033486517) [(8, 2), (10, 1)],
  term ((-357939983748 : Rat) / 45033486517) [(8, 2), (10, 1), (11, 1), (13, 1)],
  term ((715879967496 : Rat) / 45033486517) [(8, 2), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-357939983748 : Rat) / 45033486517) [(8, 2), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((178969991874 : Rat) / 45033486517) [(8, 2), (10, 1), (11, 1), (15, 1)],
  term ((2277112645872 : Rat) / 45033486517) [(8, 2), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1138556322936 : Rat) / 45033486517) [(8, 2), (10, 1), (13, 1), (15, 1)],
  term ((536909975622 : Rat) / 45033486517) [(8, 2), (10, 1), (14, 1)],
  term ((-1138556322936 : Rat) / 45033486517) [(8, 2), (10, 1), (14, 1), (15, 2)],
  term ((569278161468 : Rat) / 45033486517) [(8, 2), (10, 1), (15, 2)],
  term ((-1919172662124 : Rat) / 45033486517) [(8, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((959586331062 : Rat) / 45033486517) [(8, 2), (11, 1), (12, 1), (15, 1)],
  term ((89484995937 : Rat) / 45033486517) [(8, 2), (11, 1), (13, 1)],
  term ((-357939983748 : Rat) / 45033486517) [(8, 2), (11, 1), (13, 1), (14, 2)],
  term ((-1919172662124 : Rat) / 45033486517) [(8, 2), (11, 1), (14, 1), (15, 1)],
  term ((1138556322936 : Rat) / 45033486517) [(8, 2), (11, 1), (14, 2), (15, 1)],
  term ((674947250328 : Rat) / 45033486517) [(8, 2), (11, 1), (15, 1)],
  term ((268454987811 : Rat) / 45033486517) [(8, 2), (11, 2)],
  term ((357939983748 : Rat) / 45033486517) [(8, 2), (11, 2), (12, 1)],
  term ((-715879967496 : Rat) / 45033486517) [(8, 2), (11, 2), (12, 1), (14, 1)],
  term ((-715879967496 : Rat) / 45033486517) [(8, 2), (11, 2), (14, 1)],
  term ((357939983748 : Rat) / 45033486517) [(8, 2), (11, 2), (14, 2)],
  term ((268454987811 : Rat) / 45033486517) [(8, 2), (12, 1)],
  term ((-536909975622 : Rat) / 45033486517) [(8, 2), (12, 1), (14, 1)],
  term ((1138556322936 : Rat) / 45033486517) [(8, 2), (12, 1), (14, 1), (15, 2)],
  term ((-569278161468 : Rat) / 45033486517) [(8, 2), (12, 1), (15, 2)],
  term ((-1138556322936 : Rat) / 45033486517) [(8, 2), (13, 1), (14, 2), (15, 1)],
  term ((284639080734 : Rat) / 45033486517) [(8, 2), (13, 1), (15, 1)],
  term ((-1159620612498 : Rat) / 45033486517) [(8, 2), (14, 1)],
  term ((1138556322936 : Rat) / 45033486517) [(8, 2), (14, 1), (15, 2)],
  term ((311355318438 : Rat) / 45033486517) [(8, 2), (14, 2)],
  term ((-569278161468 : Rat) / 45033486517) [(8, 2), (15, 2)],
  term ((-5687773837242 : Rat) / 45033486517) [(9, 1), (10, 1), (11, 1)],
  term ((265368762711 : Rat) / 45033486517) [(9, 1), (10, 1), (11, 1), (12, 1)],
  term ((-530737525422 : Rat) / 45033486517) [(9, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((-54875727906936 : Rat) / 45033486517) [(9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((27437863953468 : Rat) / 45033486517) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((11375547674484 : Rat) / 45033486517) [(9, 1), (10, 1), (11, 1), (14, 1)],
  term ((27437863953468 : Rat) / 45033486517) [(9, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((-13718931976734 : Rat) / 45033486517) [(9, 1), (10, 1), (11, 1), (15, 2)],
  term ((3838589777457 : Rat) / 45033486517) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-3838589777457 : Rat) / 90066973034) [(9, 1), (10, 1), (12, 1), (15, 1)],
  term ((52230060302759 : Rat) / 180133946068) [(9, 1), (10, 1), (13, 1)],
  term ((-52230060302759 : Rat) / 90066973034) [(9, 1), (10, 1), (13, 1), (14, 1)],
  term ((9606536938200 : Rat) / 45033486517) [(9, 1), (10, 1), (14, 1), (15, 1)],
  term ((2076293015355 : Rat) / 45033486517) [(9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4803268469100 : Rat) / 45033486517) [(9, 1), (10, 1), (15, 1)],
  term ((-2076293015355 : Rat) / 90066973034) [(9, 1), (10, 1), (15, 1), (16, 1)],
  term ((1198235030517 : Rat) / 45033486517) [(9, 1), (11, 1)],
  term ((-10884842183827 : Rat) / 90066973034) [(9, 1), (11, 1), (12, 1)],
  term ((21504315604943 : Rat) / 90066973034) [(9, 1), (11, 1), (12, 1), (14, 1)],
  term ((-27437863953468 : Rat) / 45033486517) [(9, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((265368762711 : Rat) / 45033486517) [(9, 1), (11, 1), (12, 1), (14, 2)],
  term ((13718931976734 : Rat) / 45033486517) [(9, 1), (11, 1), (12, 1), (15, 2)],
  term ((27437863953468 : Rat) / 45033486517) [(9, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((-6859465988367 : Rat) / 45033486517) [(9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1075730542832 : Rat) / 45033486517) [(9, 1), (11, 1), (14, 1)],
  term ((-27437863953468 : Rat) / 45033486517) [(9, 1), (11, 1), (14, 1), (15, 2)],
  term ((-2641479036404 : Rat) / 45033486517) [(9, 1), (11, 1), (14, 2)],
  term ((13718931976734 : Rat) / 45033486517) [(9, 1), (11, 1), (15, 2)],
  term ((54875727906936 : Rat) / 45033486517) [(9, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-27437863953468 : Rat) / 45033486517) [(9, 1), (11, 2), (12, 1), (15, 1)],
  term ((54875727906936 : Rat) / 45033486517) [(9, 1), (11, 2), (14, 1), (15, 1)],
  term ((-27437863953468 : Rat) / 45033486517) [(9, 1), (11, 2), (14, 2), (15, 1)],
  term ((-20578397965101 : Rat) / 45033486517) [(9, 1), (11, 2), (15, 1)],
  term ((-1939233265965 : Rat) / 90066973034) [(9, 1), (12, 1), (13, 1)],
  term ((1939233265965 : Rat) / 45033486517) [(9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-114948700083063 : Rat) / 90066973034) [(9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1916578168020 : Rat) / 45033486517) [(9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((114948700083063 : Rat) / 180133946068) [(9, 1), (12, 1), (15, 1)],
  term ((958289084010 : Rat) / 45033486517) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 27, terms 800 through 899. -/
theorem ep_Q2_054_block_27_0800_0899_valid :
    checkProductSumEq ep_Q2_054_partials_27_0800_0899
      ep_Q2_054_block_27_0800_0899 = true := by
  native_decide

end EpQ2054TermShards

end Patterns

end EndpointCertificate

end Problem97
