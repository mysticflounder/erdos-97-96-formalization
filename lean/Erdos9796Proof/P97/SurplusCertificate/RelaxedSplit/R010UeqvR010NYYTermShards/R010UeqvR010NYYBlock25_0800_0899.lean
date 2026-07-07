/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010NYY, term block 25:800-899

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010NYYTermShards

/-- Generator polynomial 25 for relaxed split surplus certificate `R010:u=v:R010NYY`. -/
def rs_R010_ueqv_R010NYY_generator_25_0800_0899 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(12, 1)]
]

/-- Coefficient term 800 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0800 : Poly :=
[
  term ((363534495967615059 : Rat) / 9401265638203852) [(3, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 800 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0800 : Poly :=
[
  term ((-363534495967615059 : Rat) / 9401265638203852) [(3, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((363534495967615059 : Rat) / 4700632819101926) [(3, 1), (8, 1), (11, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 800 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0800_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0800
        rs_R010_ueqv_R010NYY_generator_25_0800_0899 =
      rs_R010_ueqv_R010NYY_partial_25_0800 := by
  native_decide

/-- Coefficient term 801 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0801 : Poly :=
[
  term ((-423685498714386141241 : Rat) / 8423534011830651392) [(3, 1), (8, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 801 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0801 : Poly :=
[
  term ((423685498714386141241 : Rat) / 8423534011830651392) [(3, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((-423685498714386141241 : Rat) / 4211767005915325696) [(3, 1), (8, 1), (11, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 801 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0801_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0801
        rs_R010_ueqv_R010NYY_generator_25_0800_0899 =
      rs_R010_ueqv_R010NYY_partial_25_0801 := by
  native_decide

/-- Coefficient term 802 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0802 : Poly :=
[
  term ((-363534495967615059 : Rat) / 9401265638203852) [(3, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 802 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0802 : Poly :=
[
  term ((-363534495967615059 : Rat) / 4700632819101926) [(3, 1), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(3, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 802 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0802_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0802
        rs_R010_ueqv_R010NYY_generator_25_0800_0899 =
      rs_R010_ueqv_R010NYY_partial_25_0802 := by
  native_decide

/-- Coefficient term 803 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0803 : Poly :=
[
  term ((121178165322538353 : Rat) / 3958427637138464) [(3, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 803 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0803 : Poly :=
[
  term ((121178165322538353 : Rat) / 1979213818569232) [(3, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-121178165322538353 : Rat) / 3958427637138464) [(3, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 803 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0803_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0803
        rs_R010_ueqv_R010NYY_generator_25_0800_0899 =
      rs_R010_ueqv_R010NYY_partial_25_0803 := by
  native_decide

/-- Coefficient term 804 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0804 : Poly :=
[
  term ((-666437606924626277563 : Rat) / 8423534011830651392) [(3, 1), (8, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 804 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0804 : Poly :=
[
  term ((-666437606924626277563 : Rat) / 4211767005915325696) [(3, 1), (8, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((666437606924626277563 : Rat) / 8423534011830651392) [(3, 1), (8, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 804 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0804_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0804
        rs_R010_ueqv_R010NYY_generator_25_0800_0899 =
      rs_R010_ueqv_R010NYY_partial_25_0804 := by
  native_decide

/-- Coefficient term 805 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0805 : Poly :=
[
  term ((-99531357907294325865 : Rat) / 1052941751478831424) [(3, 1), (8, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 805 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0805 : Poly :=
[
  term ((-99531357907294325865 : Rat) / 526470875739415712) [(3, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((99531357907294325865 : Rat) / 1052941751478831424) [(3, 1), (8, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 805 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0805_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0805
        rs_R010_ueqv_R010NYY_generator_25_0800_0899 =
      rs_R010_ueqv_R010NYY_partial_25_0805 := by
  native_decide

/-- Coefficient term 806 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0806 : Poly :=
[
  term ((-333796423576923 : Rat) / 53264961122968) [(3, 1), (8, 1), (11, 1), (15, 4), (16, 1)]
]

/-- Partial product 806 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0806 : Poly :=
[
  term ((-333796423576923 : Rat) / 26632480561484) [(3, 1), (8, 1), (11, 1), (12, 1), (15, 4), (16, 1)],
  term ((333796423576923 : Rat) / 53264961122968) [(3, 1), (8, 1), (11, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 806 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0806_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0806
        rs_R010_ueqv_R010NYY_generator_25_0800_0899 =
      rs_R010_ueqv_R010NYY_partial_25_0806 := by
  native_decide

/-- Coefficient term 807 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0807 : Poly :=
[
  term ((-165037943769065016833 : Rat) / 1203362001690093056) [(3, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 807 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0807 : Poly :=
[
  term ((-165037943769065016833 : Rat) / 601681000845046528) [(3, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((165037943769065016833 : Rat) / 1203362001690093056) [(3, 1), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 807 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0807_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0807
        rs_R010_ueqv_R010NYY_generator_25_0800_0899 =
      rs_R010_ueqv_R010NYY_partial_25_0807 := by
  native_decide

/-- Coefficient term 808 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0808 : Poly :=
[
  term ((-1228626950032067571841 : Rat) / 4211767005915325696) [(3, 1), (8, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 808 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0808 : Poly :=
[
  term ((-1228626950032067571841 : Rat) / 2105883502957662848) [(3, 1), (8, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((1228626950032067571841 : Rat) / 4211767005915325696) [(3, 1), (8, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 808 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0808_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0808
        rs_R010_ueqv_R010NYY_generator_25_0800_0899 =
      rs_R010_ueqv_R010NYY_partial_25_0808 := by
  native_decide

/-- Coefficient term 809 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0809 : Poly :=
[
  term ((363534495967615059 : Rat) / 4700632819101926) [(3, 1), (8, 1), (11, 2), (15, 3), (16, 1)]
]

/-- Partial product 809 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0809 : Poly :=
[
  term ((363534495967615059 : Rat) / 2350316409550963) [(3, 1), (8, 1), (11, 2), (12, 1), (15, 3), (16, 1)],
  term ((-363534495967615059 : Rat) / 4700632819101926) [(3, 1), (8, 1), (11, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 809 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0809_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0809
        rs_R010_ueqv_R010NYY_generator_25_0800_0899 =
      rs_R010_ueqv_R010NYY_partial_25_0809 := by
  native_decide

/-- Coefficient term 810 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0810 : Poly :=
[
  term ((-137004120164657951 : Rat) / 11931351291544832) [(3, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 810 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0810 : Poly :=
[
  term ((137004120164657951 : Rat) / 11931351291544832) [(3, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-137004120164657951 : Rat) / 5965675645772416) [(3, 1), (8, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 810 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0810_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0810
        rs_R010_ueqv_R010NYY_generator_25_0800_0899 =
      rs_R010_ueqv_R010NYY_partial_25_0810 := by
  native_decide

/-- Coefficient term 811 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0811 : Poly :=
[
  term ((-333796423576923 : Rat) / 106529922245936) [(3, 1), (8, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 811 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0811 : Poly :=
[
  term ((333796423576923 : Rat) / 106529922245936) [(3, 1), (8, 1), (12, 1), (15, 3), (16, 1)],
  term ((-333796423576923 : Rat) / 53264961122968) [(3, 1), (8, 1), (12, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 811 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0811_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0811
        rs_R010_ueqv_R010NYY_generator_25_0800_0899 =
      rs_R010_ueqv_R010NYY_partial_25_0811 := by
  native_decide

/-- Coefficient term 812 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0812 : Poly :=
[
  term ((333796423576923 : Rat) / 106529922245936) [(3, 1), (8, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 812 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0812 : Poly :=
[
  term ((333796423576923 : Rat) / 53264961122968) [(3, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(3, 1), (8, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 812 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0812_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0812
        rs_R010_ueqv_R010NYY_generator_25_0800_0899 =
      rs_R010_ueqv_R010NYY_partial_25_0812 := by
  native_decide

/-- Coefficient term 813 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0813 : Poly :=
[
  term ((-111265474525641 : Rat) / 44854704103552) [(3, 1), (8, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 813 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0813 : Poly :=
[
  term ((-111265474525641 : Rat) / 22427352051776) [(3, 1), (8, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((111265474525641 : Rat) / 44854704103552) [(3, 1), (8, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 813 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0813_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0813
        rs_R010_ueqv_R010NYY_generator_25_0800_0899 =
      rs_R010_ueqv_R010NYY_partial_25_0813 := by
  native_decide

/-- Coefficient term 814 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0814 : Poly :=
[
  term ((-561645947889961853 : Rat) / 23862702583089664) [(3, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 814 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0814 : Poly :=
[
  term ((-561645947889961853 : Rat) / 11931351291544832) [(3, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((561645947889961853 : Rat) / 23862702583089664) [(3, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 814 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0814_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0814
        rs_R010_ueqv_R010NYY_generator_25_0800_0899 =
      rs_R010_ueqv_R010NYY_partial_25_0814 := by
  native_decide

/-- Coefficient term 815 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0815 : Poly :=
[
  term ((-240588711020704381 : Rat) / 6817915023739904) [(3, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 815 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0815 : Poly :=
[
  term ((-240588711020704381 : Rat) / 3408957511869952) [(3, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((240588711020704381 : Rat) / 6817915023739904) [(3, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 815 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0815_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0815
        rs_R010_ueqv_R010NYY_generator_25_0800_0899 =
      rs_R010_ueqv_R010NYY_partial_25_0815 := by
  native_decide

/-- Coefficient term 816 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0816 : Poly :=
[
  term ((1891513066935897 : Rat) / 852239377967488) [(3, 1), (8, 1), (15, 3), (16, 1)]
]

/-- Partial product 816 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0816 : Poly :=
[
  term ((1891513066935897 : Rat) / 426119688983744) [(3, 1), (8, 1), (12, 1), (15, 3), (16, 1)],
  term ((-1891513066935897 : Rat) / 852239377967488) [(3, 1), (8, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 816 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0816_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0816
        rs_R010_ueqv_R010NYY_generator_25_0800_0899 =
      rs_R010_ueqv_R010NYY_partial_25_0816 := by
  native_decide

/-- Coefficient term 817 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0817 : Poly :=
[
  term ((363534495967615059 : Rat) / 9401265638203852) [(3, 1), (8, 2), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 817 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0817 : Poly :=
[
  term ((363534495967615059 : Rat) / 4700632819101926) [(3, 1), (8, 2), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(3, 1), (8, 2), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 817 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0817_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0817
        rs_R010_ueqv_R010NYY_generator_25_0800_0899 =
      rs_R010_ueqv_R010NYY_partial_25_0817 := by
  native_decide

/-- Coefficient term 818 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0818 : Poly :=
[
  term ((-363534495967615059 : Rat) / 4700632819101926) [(3, 1), (8, 2), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 818 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0818 : Poly :=
[
  term ((-363534495967615059 : Rat) / 2350316409550963) [(3, 1), (8, 2), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((363534495967615059 : Rat) / 4700632819101926) [(3, 1), (8, 2), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 818 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0818_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0818
        rs_R010_ueqv_R010NYY_generator_25_0800_0899 =
      rs_R010_ueqv_R010NYY_partial_25_0818 := by
  native_decide

/-- Coefficient term 819 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0819 : Poly :=
[
  term ((320032617216188139077 : Rat) / 1052941751478831424) [(3, 1), (8, 2), (11, 1), (16, 1)]
]

/-- Partial product 819 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0819 : Poly :=
[
  term ((320032617216188139077 : Rat) / 526470875739415712) [(3, 1), (8, 2), (11, 1), (12, 1), (16, 1)],
  term ((-320032617216188139077 : Rat) / 1052941751478831424) [(3, 1), (8, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 819 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0819_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0819
        rs_R010_ueqv_R010NYY_generator_25_0800_0899 =
      rs_R010_ueqv_R010NYY_partial_25_0819 := by
  native_decide

/-- Coefficient term 820 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0820 : Poly :=
[
  term ((-333796423576923 : Rat) / 106529922245936) [(3, 1), (8, 2), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 820 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0820 : Poly :=
[
  term ((-333796423576923 : Rat) / 53264961122968) [(3, 1), (8, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(3, 1), (8, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 820 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0820_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0820
        rs_R010_ueqv_R010NYY_generator_25_0800_0899 =
      rs_R010_ueqv_R010NYY_partial_25_0820 := by
  native_decide

/-- Coefficient term 821 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0821 : Poly :=
[
  term ((792038122205226483 : Rat) / 11931351291544832) [(3, 1), (8, 2), (15, 1), (16, 1)]
]

/-- Partial product 821 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0821 : Poly :=
[
  term ((792038122205226483 : Rat) / 5965675645772416) [(3, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((-792038122205226483 : Rat) / 11931351291544832) [(3, 1), (8, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 821 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0821_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0821
        rs_R010_ueqv_R010NYY_generator_25_0800_0899 =
      rs_R010_ueqv_R010NYY_partial_25_0821 := by
  native_decide

/-- Coefficient term 822 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0822 : Poly :=
[
  term ((333796423576923 : Rat) / 53264961122968) [(3, 1), (8, 2), (15, 3), (16, 1)]
]

/-- Partial product 822 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0822 : Poly :=
[
  term ((333796423576923 : Rat) / 26632480561484) [(3, 1), (8, 2), (12, 1), (15, 3), (16, 1)],
  term ((-333796423576923 : Rat) / 53264961122968) [(3, 1), (8, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 822 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0822_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0822
        rs_R010_ueqv_R010NYY_generator_25_0800_0899 =
      rs_R010_ueqv_R010NYY_partial_25_0822 := by
  native_decide

/-- Coefficient term 823 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0823 : Poly :=
[
  term ((363534495967615059 : Rat) / 9401265638203852) [(3, 1), (9, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 823 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0823 : Poly :=
[
  term ((-363534495967615059 : Rat) / 9401265638203852) [(3, 1), (9, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 4700632819101926) [(3, 1), (9, 1), (10, 1), (11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 823 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0823_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0823
        rs_R010_ueqv_R010NYY_generator_25_0800_0899 =
      rs_R010_ueqv_R010NYY_partial_25_0823 := by
  native_decide

/-- Coefficient term 824 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0824 : Poly :=
[
  term ((-363534495967615059 : Rat) / 4700632819101926) [(3, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 824 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0824 : Poly :=
[
  term ((-363534495967615059 : Rat) / 2350316409550963) [(3, 1), (9, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 4700632819101926) [(3, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 824 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0824_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0824
        rs_R010_ueqv_R010NYY_generator_25_0800_0899 =
      rs_R010_ueqv_R010NYY_partial_25_0824 := by
  native_decide

/-- Coefficient term 825 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0825 : Poly :=
[
  term ((-333796423576923 : Rat) / 106529922245936) [(3, 1), (9, 1), (10, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 825 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0825 : Poly :=
[
  term ((333796423576923 : Rat) / 106529922245936) [(3, 1), (9, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-333796423576923 : Rat) / 53264961122968) [(3, 1), (9, 1), (10, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 825 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0825_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0825
        rs_R010_ueqv_R010NYY_generator_25_0800_0899 =
      rs_R010_ueqv_R010NYY_partial_25_0825 := by
  native_decide

/-- Coefficient term 826 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0826 : Poly :=
[
  term ((333796423576923 : Rat) / 53264961122968) [(3, 1), (9, 1), (10, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 826 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0826 : Poly :=
[
  term ((333796423576923 : Rat) / 26632480561484) [(3, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-333796423576923 : Rat) / 53264961122968) [(3, 1), (9, 1), (10, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 826 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0826_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0826
        rs_R010_ueqv_R010NYY_generator_25_0800_0899 =
      rs_R010_ueqv_R010NYY_partial_25_0826 := by
  native_decide

/-- Coefficient term 827 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0827 : Poly :=
[
  term ((-4078593481799756331 : Rat) / 126669684388430848) [(3, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 827 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0827 : Poly :=
[
  term ((4078593481799756331 : Rat) / 126669684388430848) [(3, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4078593481799756331 : Rat) / 63334842194215424) [(3, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 827 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0827_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0827
        rs_R010_ueqv_R010NYY_generator_25_0800_0899 =
      rs_R010_ueqv_R010NYY_partial_25_0827 := by
  native_decide

/-- Coefficient term 828 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0828 : Poly :=
[
  term ((536084824294706049045 : Rat) / 16847068023661302784) [(3, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 828 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0828 : Poly :=
[
  term ((536084824294706049045 : Rat) / 8423534011830651392) [(3, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-536084824294706049045 : Rat) / 16847068023661302784) [(3, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 828 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0828_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0828
        rs_R010_ueqv_R010NYY_generator_25_0800_0899 =
      rs_R010_ueqv_R010NYY_partial_25_0828 := by
  native_decide

/-- Coefficient term 829 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0829 : Poly :=
[
  term ((590372642359203231189 : Rat) / 33694136047322605568) [(3, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 829 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0829 : Poly :=
[
  term ((590372642359203231189 : Rat) / 16847068023661302784) [(3, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-590372642359203231189 : Rat) / 33694136047322605568) [(3, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 829 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0829_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0829
        rs_R010_ueqv_R010NYY_generator_25_0800_0899 =
      rs_R010_ueqv_R010NYY_partial_25_0829 := by
  native_decide

/-- Coefficient term 830 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0830 : Poly :=
[
  term ((2953975112298767450295 : Rat) / 33694136047322605568) [(3, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 830 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0830 : Poly :=
[
  term ((2953975112298767450295 : Rat) / 16847068023661302784) [(3, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2953975112298767450295 : Rat) / 33694136047322605568) [(3, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 830 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0830_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0830
        rs_R010_ueqv_R010NYY_generator_25_0800_0899 =
      rs_R010_ueqv_R010NYY_partial_25_0830 := by
  native_decide

/-- Coefficient term 831 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0831 : Poly :=
[
  term ((333796423576923 : Rat) / 53264961122968) [(3, 1), (9, 1), (11, 1), (14, 1), (15, 3), (16, 1)]
]

/-- Partial product 831 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0831 : Poly :=
[
  term ((333796423576923 : Rat) / 26632480561484) [(3, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-333796423576923 : Rat) / 53264961122968) [(3, 1), (9, 1), (11, 1), (14, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 831 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0831_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0831
        rs_R010_ueqv_R010NYY_generator_25_0800_0899 =
      rs_R010_ueqv_R010NYY_partial_25_0831 := by
  native_decide

/-- Coefficient term 832 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0832 : Poly :=
[
  term ((16755351379813953670427 : Rat) / 202164816283935633408) [(3, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 832 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0832 : Poly :=
[
  term ((16755351379813953670427 : Rat) / 101082408141967816704) [(3, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-16755351379813953670427 : Rat) / 202164816283935633408) [(3, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 832 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0832_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0832
        rs_R010_ueqv_R010NYY_generator_25_0800_0899 =
      rs_R010_ueqv_R010NYY_partial_25_0832 := by
  native_decide

/-- Coefficient term 833 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0833 : Poly :=
[
  term ((333796423576923 : Rat) / 106529922245936) [(3, 1), (9, 1), (11, 1), (15, 3), (16, 1)]
]

/-- Partial product 833 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0833 : Poly :=
[
  term ((333796423576923 : Rat) / 53264961122968) [(3, 1), (9, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(3, 1), (9, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 833 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0833_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0833
        rs_R010_ueqv_R010NYY_generator_25_0800_0899 =
      rs_R010_ueqv_R010NYY_partial_25_0833 := by
  native_decide

/-- Coefficient term 834 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0834 : Poly :=
[
  term ((1104993165499089067 : Rat) / 4211767005915325696) [(3, 1), (9, 1), (11, 2), (12, 1), (16, 1)]
]

/-- Partial product 834 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0834 : Poly :=
[
  term ((-1104993165499089067 : Rat) / 4211767005915325696) [(3, 1), (9, 1), (11, 2), (12, 1), (16, 1)],
  term ((1104993165499089067 : Rat) / 2105883502957662848) [(3, 1), (9, 1), (11, 2), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 834 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0834_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0834
        rs_R010_ueqv_R010NYY_generator_25_0800_0899 =
      rs_R010_ueqv_R010NYY_partial_25_0834 := by
  native_decide

/-- Coefficient term 835 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0835 : Poly :=
[
  term ((-363534495967615059 : Rat) / 4700632819101926) [(3, 1), (9, 1), (11, 2), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 835 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0835 : Poly :=
[
  term ((-363534495967615059 : Rat) / 2350316409550963) [(3, 1), (9, 1), (11, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((363534495967615059 : Rat) / 4700632819101926) [(3, 1), (9, 1), (11, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 835 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0835_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0835
        rs_R010_ueqv_R010NYY_generator_25_0800_0899 =
      rs_R010_ueqv_R010NYY_partial_25_0835 := by
  native_decide

/-- Coefficient term 836 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0836 : Poly :=
[
  term ((2389324849160611452179 : Rat) / 8423534011830651392) [(3, 1), (9, 1), (11, 2), (14, 1), (16, 1)]
]

/-- Partial product 836 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0836 : Poly :=
[
  term ((2389324849160611452179 : Rat) / 4211767005915325696) [(3, 1), (9, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-2389324849160611452179 : Rat) / 8423534011830651392) [(3, 1), (9, 1), (11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 836 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0836_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0836
        rs_R010_ueqv_R010NYY_generator_25_0800_0899 =
      rs_R010_ueqv_R010NYY_partial_25_0836 := by
  native_decide

/-- Coefficient term 837 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0837 : Poly :=
[
  term ((-363534495967615059 : Rat) / 9401265638203852) [(3, 1), (9, 1), (11, 2), (15, 2), (16, 1)]
]

/-- Partial product 837 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0837 : Poly :=
[
  term ((-363534495967615059 : Rat) / 4700632819101926) [(3, 1), (9, 1), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(3, 1), (9, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 837 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0837_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0837
        rs_R010_ueqv_R010NYY_generator_25_0800_0899 =
      rs_R010_ueqv_R010NYY_partial_25_0837 := by
  native_decide

/-- Coefficient term 838 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0838 : Poly :=
[
  term ((2391534835491609630313 : Rat) / 16847068023661302784) [(3, 1), (9, 1), (11, 2), (16, 1)]
]

/-- Partial product 838 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0838 : Poly :=
[
  term ((2391534835491609630313 : Rat) / 8423534011830651392) [(3, 1), (9, 1), (11, 2), (12, 1), (16, 1)],
  term ((-2391534835491609630313 : Rat) / 16847068023661302784) [(3, 1), (9, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 838 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0838_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0838
        rs_R010_ueqv_R010NYY_generator_25_0800_0899 =
      rs_R010_ueqv_R010NYY_partial_25_0838 := by
  native_decide

/-- Coefficient term 839 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0839 : Poly :=
[
  term ((-297211693362289157 : Rat) / 23862702583089664) [(3, 1), (9, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 839 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0839 : Poly :=
[
  term ((297211693362289157 : Rat) / 23862702583089664) [(3, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-297211693362289157 : Rat) / 11931351291544832) [(3, 1), (9, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 839 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0839_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0839
        rs_R010_ueqv_R010NYY_generator_25_0800_0899 =
      rs_R010_ueqv_R010NYY_partial_25_0839 := by
  native_decide

/-- Coefficient term 840 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0840 : Poly :=
[
  term ((546492365945773 : Rat) / 365245447700352) [(3, 1), (9, 1), (12, 1), (16, 1)]
]

/-- Partial product 840 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0840 : Poly :=
[
  term ((-546492365945773 : Rat) / 365245447700352) [(3, 1), (9, 1), (12, 1), (16, 1)],
  term ((546492365945773 : Rat) / 182622723850176) [(3, 1), (9, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 840 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0840_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0840
        rs_R010_ueqv_R010NYY_generator_25_0800_0899 =
      rs_R010_ueqv_R010NYY_partial_25_0840 := by
  native_decide

/-- Coefficient term 841 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0841 : Poly :=
[
  term ((189099744644419281 : Rat) / 23862702583089664) [(3, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 841 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0841 : Poly :=
[
  term ((189099744644419281 : Rat) / 11931351291544832) [(3, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-189099744644419281 : Rat) / 23862702583089664) [(3, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 841 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0841_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0841
        rs_R010_ueqv_R010NYY_generator_25_0800_0899 =
      rs_R010_ueqv_R010NYY_partial_25_0841 := by
  native_decide

/-- Coefficient term 842 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0842 : Poly :=
[
  term ((182868878070983385 : Rat) / 47725405166179328) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 842 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0842 : Poly :=
[
  term ((182868878070983385 : Rat) / 23862702583089664) [(3, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-182868878070983385 : Rat) / 47725405166179328) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 842 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0842_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0842
        rs_R010_ueqv_R010NYY_generator_25_0800_0899 =
      rs_R010_ueqv_R010NYY_partial_25_0842 := by
  native_decide

/-- Coefficient term 843 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0843 : Poly :=
[
  term ((-590107851045851143 : Rat) / 47725405166179328) [(3, 1), (9, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 843 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0843 : Poly :=
[
  term ((-590107851045851143 : Rat) / 23862702583089664) [(3, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((590107851045851143 : Rat) / 47725405166179328) [(3, 1), (9, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 843 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0843_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0843
        rs_R010_ueqv_R010NYY_generator_25_0800_0899 =
      rs_R010_ueqv_R010NYY_partial_25_0843 := by
  native_decide

/-- Coefficient term 844 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0844 : Poly :=
[
  term ((-546492365945773 : Rat) / 365245447700352) [(3, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 844 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0844 : Poly :=
[
  term ((-546492365945773 : Rat) / 182622723850176) [(3, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((546492365945773 : Rat) / 365245447700352) [(3, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 844 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0844_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0844
        rs_R010_ueqv_R010NYY_generator_25_0800_0899 =
      rs_R010_ueqv_R010NYY_partial_25_0844 := by
  native_decide

/-- Coefficient term 845 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0845 : Poly :=
[
  term ((699897022689981199 : Rat) / 95450810332358656) [(3, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 845 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0845 : Poly :=
[
  term ((699897022689981199 : Rat) / 47725405166179328) [(3, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-699897022689981199 : Rat) / 95450810332358656) [(3, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 845 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0845_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0845
        rs_R010_ueqv_R010NYY_generator_25_0800_0899 =
      rs_R010_ueqv_R010NYY_partial_25_0845 := by
  native_decide

/-- Coefficient term 846 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0846 : Poly :=
[
  term ((122145130947717451615 : Rat) / 4211767005915325696) [(3, 1), (9, 2), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 846 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0846 : Poly :=
[
  term ((-122145130947717451615 : Rat) / 4211767005915325696) [(3, 1), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((122145130947717451615 : Rat) / 2105883502957662848) [(3, 1), (9, 2), (11, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 846 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0846_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0846
        rs_R010_ueqv_R010NYY_generator_25_0800_0899 =
      rs_R010_ueqv_R010NYY_partial_25_0846 := by
  native_decide

/-- Coefficient term 847 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0847 : Poly :=
[
  term ((2301633344300590327 : Rat) / 110835973839876992) [(3, 1), (9, 2), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 847 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0847 : Poly :=
[
  term ((2301633344300590327 : Rat) / 55417986919938496) [(3, 1), (9, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-2301633344300590327 : Rat) / 110835973839876992) [(3, 1), (9, 2), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 847 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0847_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0847
        rs_R010_ueqv_R010NYY_generator_25_0800_0899 =
      rs_R010_ueqv_R010NYY_partial_25_0847 := by
  native_decide

/-- Coefficient term 848 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0848 : Poly :=
[
  term ((5665059406247023893 : Rat) / 227663081400828416) [(3, 1), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 848 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0848 : Poly :=
[
  term ((5665059406247023893 : Rat) / 113831540700414208) [(3, 1), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((-5665059406247023893 : Rat) / 227663081400828416) [(3, 1), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 848 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0848_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0848
        rs_R010_ueqv_R010NYY_generator_25_0800_0899 =
      rs_R010_ueqv_R010NYY_partial_25_0848 := by
  native_decide

/-- Coefficient term 849 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0849 : Poly :=
[
  term ((8690466778600269 : Rat) / 745709455721552) [(3, 1), (9, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 849 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0849 : Poly :=
[
  term ((-8690466778600269 : Rat) / 745709455721552) [(3, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((8690466778600269 : Rat) / 372854727860776) [(3, 1), (9, 2), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 849 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0849_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0849
        rs_R010_ueqv_R010NYY_generator_25_0800_0899 =
      rs_R010_ueqv_R010NYY_partial_25_0849 := by
  native_decide

/-- Coefficient term 850 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0850 : Poly :=
[
  term ((5707104705546903 : Rat) / 745709455721552) [(3, 1), (9, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 850 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0850 : Poly :=
[
  term ((5707104705546903 : Rat) / 372854727860776) [(3, 1), (9, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5707104705546903 : Rat) / 745709455721552) [(3, 1), (9, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 850 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0850_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0850
        rs_R010_ueqv_R010NYY_generator_25_0800_0899 =
      rs_R010_ueqv_R010NYY_partial_25_0850 := by
  native_decide

/-- Coefficient term 851 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0851 : Poly :=
[
  term ((3599392871036793 : Rat) / 372854727860776) [(3, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 851 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0851 : Poly :=
[
  term ((3599392871036793 : Rat) / 186427363930388) [(3, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-3599392871036793 : Rat) / 372854727860776) [(3, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 851 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0851_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0851
        rs_R010_ueqv_R010NYY_generator_25_0800_0899 =
      rs_R010_ueqv_R010NYY_partial_25_0851 := by
  native_decide

/-- Coefficient term 852 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0852 : Poly :=
[
  term ((3297501003327384801 : Rat) / 601681000845046528) [(3, 1), (10, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 852 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0852 : Poly :=
[
  term ((-3297501003327384801 : Rat) / 601681000845046528) [(3, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((3297501003327384801 : Rat) / 300840500422523264) [(3, 1), (10, 1), (11, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 852 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0852_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0852
        rs_R010_ueqv_R010NYY_generator_25_0800_0899 =
      rs_R010_ueqv_R010NYY_partial_25_0852 := by
  native_decide

/-- Coefficient term 853 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0853 : Poly :=
[
  term ((-1090603487902845177 : Rat) / 75210125105630816) [(3, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 853 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0853 : Poly :=
[
  term ((-1090603487902845177 : Rat) / 37605062552815408) [(3, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1090603487902845177 : Rat) / 75210125105630816) [(3, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 853 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0853_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0853
        rs_R010_ueqv_R010NYY_generator_25_0800_0899 =
      rs_R010_ueqv_R010NYY_partial_25_0853 := by
  native_decide

/-- Coefficient term 854 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0854 : Poly :=
[
  term ((-363534495967615059 : Rat) / 7916855274276928) [(3, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 854 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0854 : Poly :=
[
  term ((-363534495967615059 : Rat) / 3958427637138464) [(3, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 7916855274276928) [(3, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 854 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0854_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0854
        rs_R010_ueqv_R010NYY_generator_25_0800_0899 =
      rs_R010_ueqv_R010NYY_partial_25_0854 := by
  native_decide

/-- Coefficient term 855 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0855 : Poly :=
[
  term ((-1817672479838075295 : Rat) / 75210125105630816) [(3, 1), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 855 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0855 : Poly :=
[
  term ((-1817672479838075295 : Rat) / 37605062552815408) [(3, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((1817672479838075295 : Rat) / 75210125105630816) [(3, 1), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 855 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0855_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0855
        rs_R010_ueqv_R010NYY_generator_25_0800_0899 =
      rs_R010_ueqv_R010NYY_partial_25_0855 := by
  native_decide

/-- Coefficient term 856 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0856 : Poly :=
[
  term ((637970958511604579851 : Rat) / 2406724003380186112) [(3, 1), (10, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 856 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0856 : Poly :=
[
  term ((637970958511604579851 : Rat) / 1203362001690093056) [(3, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-637970958511604579851 : Rat) / 2406724003380186112) [(3, 1), (10, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 856 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0856_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0856
        rs_R010_ueqv_R010NYY_generator_25_0800_0899 =
      rs_R010_ueqv_R010NYY_partial_25_0856 := by
  native_decide

/-- Coefficient term 857 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0857 : Poly :=
[
  term ((6180086431449456003 : Rat) / 150420250211261632) [(3, 1), (10, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 857 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0857 : Poly :=
[
  term ((6180086431449456003 : Rat) / 75210125105630816) [(3, 1), (10, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-6180086431449456003 : Rat) / 150420250211261632) [(3, 1), (10, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 857 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0857_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0857
        rs_R010_ueqv_R010NYY_generator_25_0800_0899 =
      rs_R010_ueqv_R010NYY_partial_25_0857 := by
  native_decide

/-- Coefficient term 858 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0858 : Poly :=
[
  term ((16240258092153187389 : Rat) / 2105883502957662848) [(3, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 858 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0858 : Poly :=
[
  term ((16240258092153187389 : Rat) / 1052941751478831424) [(3, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-16240258092153187389 : Rat) / 2105883502957662848) [(3, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 858 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0858_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0858
        rs_R010_ueqv_R010NYY_generator_25_0800_0899 =
      rs_R010_ueqv_R010NYY_partial_25_0858 := by
  native_decide

/-- Coefficient term 859 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0859 : Poly :=
[
  term ((802906227816993 : Rat) / 213059844491872) [(3, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 859 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0859 : Poly :=
[
  term ((-802906227816993 : Rat) / 213059844491872) [(3, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((802906227816993 : Rat) / 106529922245936) [(3, 1), (10, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 859 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0859_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0859
        rs_R010_ueqv_R010NYY_generator_25_0800_0899 =
      rs_R010_ueqv_R010NYY_partial_25_0859 := by
  native_decide

/-- Coefficient term 860 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0860 : Poly :=
[
  term ((1001389270730769 : Rat) / 852239377967488) [(3, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 860 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0860 : Poly :=
[
  term ((1001389270730769 : Rat) / 426119688983744) [(3, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1001389270730769 : Rat) / 852239377967488) [(3, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 860 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0860_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0860
        rs_R010_ueqv_R010NYY_generator_25_0800_0899 =
      rs_R010_ueqv_R010NYY_partial_25_0860 := by
  native_decide

/-- Coefficient term 861 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0861 : Poly :=
[
  term ((333796423576923 : Rat) / 89709408207104) [(3, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 861 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0861 : Poly :=
[
  term ((333796423576923 : Rat) / 44854704103552) [(3, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-333796423576923 : Rat) / 89709408207104) [(3, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 861 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0861_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0861
        rs_R010_ueqv_R010NYY_generator_25_0800_0899 =
      rs_R010_ueqv_R010NYY_partial_25_0861 := by
  native_decide

/-- Coefficient term 862 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0862 : Poly :=
[
  term ((202561326766678947 : Rat) / 3408957511869952) [(3, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 862 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0862 : Poly :=
[
  term ((202561326766678947 : Rat) / 1704478755934976) [(3, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-202561326766678947 : Rat) / 3408957511869952) [(3, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 862 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0862_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0862
        rs_R010_ueqv_R010NYY_generator_25_0800_0899 =
      rs_R010_ueqv_R010NYY_partial_25_0862 := by
  native_decide

/-- Coefficient term 863 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0863 : Poly :=
[
  term ((1668982117884615 : Rat) / 852239377967488) [(3, 1), (10, 1), (14, 1), (15, 3), (16, 1)]
]

/-- Partial product 863 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0863 : Poly :=
[
  term ((1668982117884615 : Rat) / 426119688983744) [(3, 1), (10, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-1668982117884615 : Rat) / 852239377967488) [(3, 1), (10, 1), (14, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 863 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0863_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0863
        rs_R010_ueqv_R010NYY_generator_25_0800_0899 =
      rs_R010_ueqv_R010NYY_partial_25_0863 := by
  native_decide

/-- Coefficient term 864 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0864 : Poly :=
[
  term ((95862255447731177 : Rat) / 23862702583089664) [(3, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 864 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0864 : Poly :=
[
  term ((95862255447731177 : Rat) / 11931351291544832) [(3, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-95862255447731177 : Rat) / 23862702583089664) [(3, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 864 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0864_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0864
        rs_R010_ueqv_R010NYY_generator_25_0800_0899 =
      rs_R010_ueqv_R010NYY_partial_25_0864 := by
  native_decide

/-- Coefficient term 865 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0865 : Poly :=
[
  term ((-5674539200807691 : Rat) / 1704478755934976) [(3, 1), (10, 1), (15, 3), (16, 1)]
]

/-- Partial product 865 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0865 : Poly :=
[
  term ((-5674539200807691 : Rat) / 852239377967488) [(3, 1), (10, 1), (12, 1), (15, 3), (16, 1)],
  term ((5674539200807691 : Rat) / 1704478755934976) [(3, 1), (10, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 865 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0865_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0865
        rs_R010_ueqv_R010NYY_generator_25_0800_0899 =
      rs_R010_ueqv_R010NYY_partial_25_0865 := by
  native_decide

/-- Coefficient term 866 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0866 : Poly :=
[
  term ((-126563136485209545013 : Rat) / 4211767005915325696) [(3, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 866 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0866 : Poly :=
[
  term ((126563136485209545013 : Rat) / 4211767005915325696) [(3, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-126563136485209545013 : Rat) / 2105883502957662848) [(3, 1), (11, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 866 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0866_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0866
        rs_R010_ueqv_R010NYY_generator_25_0800_0899 =
      rs_R010_ueqv_R010NYY_partial_25_0866 := by
  native_decide

/-- Coefficient term 867 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0867 : Poly :=
[
  term ((893650397921630687125 : Rat) / 25270602035491954176) [(3, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 867 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0867 : Poly :=
[
  term ((-893650397921630687125 : Rat) / 25270602035491954176) [(3, 1), (11, 1), (12, 1), (16, 1)],
  term ((893650397921630687125 : Rat) / 12635301017745977088) [(3, 1), (11, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 867 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0867_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0867
        rs_R010_ueqv_R010NYY_generator_25_0800_0899 =
      rs_R010_ueqv_R010NYY_partial_25_0867 := by
  native_decide

/-- Coefficient term 868 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0868 : Poly :=
[
  term ((2119433930691459429 : Rat) / 300840500422523264) [(3, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 868 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0868 : Poly :=
[
  term ((2119433930691459429 : Rat) / 150420250211261632) [(3, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2119433930691459429 : Rat) / 300840500422523264) [(3, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 868 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0868_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0868
        rs_R010_ueqv_R010NYY_generator_25_0800_0899 =
      rs_R010_ueqv_R010NYY_partial_25_0868 := by
  native_decide

/-- Coefficient term 869 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0869 : Poly :=
[
  term ((-1692627396991961967445 : Rat) / 16847068023661302784) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 869 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0869 : Poly :=
[
  term ((-1692627396991961967445 : Rat) / 8423534011830651392) [(3, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1692627396991961967445 : Rat) / 16847068023661302784) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 869 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0869_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0869
        rs_R010_ueqv_R010NYY_generator_25_0800_0899 =
      rs_R010_ueqv_R010NYY_partial_25_0869 := by
  native_decide

/-- Coefficient term 870 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0870 : Poly :=
[
  term ((363534495967615059 : Rat) / 9401265638203852) [(3, 1), (11, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 870 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0870 : Poly :=
[
  term ((363534495967615059 : Rat) / 4700632819101926) [(3, 1), (11, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(3, 1), (11, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 870 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0870_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0870
        rs_R010_ueqv_R010NYY_generator_25_0800_0899 =
      rs_R010_ueqv_R010NYY_partial_25_0870 := by
  native_decide

/-- Coefficient term 871 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0871 : Poly :=
[
  term ((-9943633373080511345 : Rat) / 526470875739415712) [(3, 1), (11, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 871 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0871 : Poly :=
[
  term ((-9943633373080511345 : Rat) / 263235437869707856) [(3, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((9943633373080511345 : Rat) / 526470875739415712) [(3, 1), (11, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 871 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0871_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0871
        rs_R010_ueqv_R010NYY_generator_25_0800_0899 =
      rs_R010_ueqv_R010NYY_partial_25_0871 := by
  native_decide

/-- Coefficient term 872 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0872 : Poly :=
[
  term ((303788861038737598771 : Rat) / 2660063372157047808) [(3, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 872 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0872 : Poly :=
[
  term ((303788861038737598771 : Rat) / 1330031686078523904) [(3, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-303788861038737598771 : Rat) / 2660063372157047808) [(3, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 872 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0872_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0872
        rs_R010_ueqv_R010NYY_generator_25_0800_0899 =
      rs_R010_ueqv_R010NYY_partial_25_0872 := by
  native_decide

/-- Coefficient term 873 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0873 : Poly :=
[
  term ((363534495967615059 : Rat) / 9401265638203852) [(3, 1), (11, 1), (14, 2), (15, 2), (16, 1)]
]

/-- Partial product 873 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0873 : Poly :=
[
  term ((363534495967615059 : Rat) / 4700632819101926) [(3, 1), (11, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(3, 1), (11, 1), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 873 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0873_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0873
        rs_R010_ueqv_R010NYY_generator_25_0800_0899 =
      rs_R010_ueqv_R010NYY_partial_25_0873 := by
  native_decide

/-- Coefficient term 874 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0874 : Poly :=
[
  term ((-2647720545115526336833 : Rat) / 16847068023661302784) [(3, 1), (11, 1), (14, 2), (16, 1)]
]

/-- Partial product 874 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0874 : Poly :=
[
  term ((-2647720545115526336833 : Rat) / 8423534011830651392) [(3, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((2647720545115526336833 : Rat) / 16847068023661302784) [(3, 1), (11, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 874 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0874_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0874
        rs_R010_ueqv_R010NYY_generator_25_0800_0899 =
      rs_R010_ueqv_R010NYY_partial_25_0874 := by
  native_decide

/-- Coefficient term 875 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0875 : Poly :=
[
  term ((-52530395995392235790617 : Rat) / 303247224425903450112) [(3, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 875 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0875 : Poly :=
[
  term ((-52530395995392235790617 : Rat) / 151623612212951725056) [(3, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((52530395995392235790617 : Rat) / 303247224425903450112) [(3, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 875 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0875_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0875
        rs_R010_ueqv_R010NYY_generator_25_0800_0899 =
      rs_R010_ueqv_R010NYY_partial_25_0875 := by
  native_decide

/-- Coefficient term 876 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0876 : Poly :=
[
  term ((-333796423576923 : Rat) / 106529922245936) [(3, 1), (11, 1), (15, 4), (16, 1)]
]

/-- Partial product 876 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0876 : Poly :=
[
  term ((-333796423576923 : Rat) / 53264961122968) [(3, 1), (11, 1), (12, 1), (15, 4), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(3, 1), (11, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 876 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0876_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0876
        rs_R010_ueqv_R010NYY_generator_25_0800_0899 =
      rs_R010_ueqv_R010NYY_partial_25_0876 := by
  native_decide

/-- Coefficient term 877 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0877 : Poly :=
[
  term ((-5057113192811129625839 : Rat) / 33694136047322605568) [(3, 1), (11, 1), (16, 1)]
]

/-- Partial product 877 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0877 : Poly :=
[
  term ((-5057113192811129625839 : Rat) / 16847068023661302784) [(3, 1), (11, 1), (12, 1), (16, 1)],
  term ((5057113192811129625839 : Rat) / 33694136047322605568) [(3, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 877 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0877_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0877
        rs_R010_ueqv_R010NYY_generator_25_0800_0899 =
      rs_R010_ueqv_R010NYY_partial_25_0877 := by
  native_decide

/-- Coefficient term 878 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0878 : Poly :=
[
  term ((-564653406062258611227 : Rat) / 8423534011830651392) [(3, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 878 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0878 : Poly :=
[
  term ((564653406062258611227 : Rat) / 8423534011830651392) [(3, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-564653406062258611227 : Rat) / 4211767005915325696) [(3, 1), (11, 2), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 878 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0878_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0878
        rs_R010_ueqv_R010NYY_generator_25_0800_0899 =
      rs_R010_ueqv_R010NYY_partial_25_0878 := by
  native_decide

/-- Coefficient term 879 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0879 : Poly :=
[
  term ((18310457117411443123 : Rat) / 601681000845046528) [(3, 1), (11, 2), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 879 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0879 : Poly :=
[
  term ((18310457117411443123 : Rat) / 300840500422523264) [(3, 1), (11, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-18310457117411443123 : Rat) / 601681000845046528) [(3, 1), (11, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 879 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0879_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0879
        rs_R010_ueqv_R010NYY_generator_25_0800_0899 =
      rs_R010_ueqv_R010NYY_partial_25_0879 := by
  native_decide

/-- Coefficient term 880 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0880 : Poly :=
[
  term ((18310457117411443123 : Rat) / 1203362001690093056) [(3, 1), (11, 2), (13, 1), (16, 1)]
]

/-- Partial product 880 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0880 : Poly :=
[
  term ((18310457117411443123 : Rat) / 601681000845046528) [(3, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((-18310457117411443123 : Rat) / 1203362001690093056) [(3, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 880 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0880_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0880
        rs_R010_ueqv_R010NYY_generator_25_0800_0899 =
      rs_R010_ueqv_R010NYY_partial_25_0880 := by
  native_decide

/-- Coefficient term 881 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0881 : Poly :=
[
  term ((137235185884509587845 : Rat) / 4211767005915325696) [(3, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 881 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0881 : Poly :=
[
  term ((137235185884509587845 : Rat) / 2105883502957662848) [(3, 1), (11, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-137235185884509587845 : Rat) / 4211767005915325696) [(3, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 881 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0881_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0881
        rs_R010_ueqv_R010NYY_generator_25_0800_0899 =
      rs_R010_ueqv_R010NYY_partial_25_0881 := by
  native_decide

/-- Coefficient term 882 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0882 : Poly :=
[
  term ((-1778615581408672392313 : Rat) / 12635301017745977088) [(3, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 882 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0882 : Poly :=
[
  term ((-1778615581408672392313 : Rat) / 6317650508872988544) [(3, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((1778615581408672392313 : Rat) / 12635301017745977088) [(3, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 882 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0882_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0882
        rs_R010_ueqv_R010NYY_generator_25_0800_0899 =
      rs_R010_ueqv_R010NYY_partial_25_0882 := by
  native_decide

/-- Coefficient term 883 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0883 : Poly :=
[
  term ((363534495967615059 : Rat) / 9401265638203852) [(3, 1), (11, 2), (15, 3), (16, 1)]
]

/-- Partial product 883 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0883 : Poly :=
[
  term ((363534495967615059 : Rat) / 4700632819101926) [(3, 1), (11, 2), (12, 1), (15, 3), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(3, 1), (11, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 883 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0883_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0883
        rs_R010_ueqv_R010NYY_generator_25_0800_0899 =
      rs_R010_ueqv_R010NYY_partial_25_0883 := by
  native_decide

/-- Coefficient term 884 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0884 : Poly :=
[
  term ((712704212218328045 : Rat) / 71588107749268992) [(3, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 884 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0884 : Poly :=
[
  term ((-712704212218328045 : Rat) / 71588107749268992) [(3, 1), (12, 1), (15, 1), (16, 1)],
  term ((712704212218328045 : Rat) / 35794053874634496) [(3, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 884 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0884_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0884
        rs_R010_ueqv_R010NYY_generator_25_0800_0899 =
      rs_R010_ueqv_R010NYY_partial_25_0884 := by
  native_decide

/-- Coefficient term 885 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0885 : Poly :=
[
  term ((1001389270730769 : Rat) / 852239377967488) [(3, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 885 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0885 : Poly :=
[
  term ((-1001389270730769 : Rat) / 852239377967488) [(3, 1), (12, 1), (15, 3), (16, 1)],
  term ((1001389270730769 : Rat) / 426119688983744) [(3, 1), (12, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 885 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0885_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0885
        rs_R010_ueqv_R010NYY_generator_25_0800_0899 =
      rs_R010_ueqv_R010NYY_partial_25_0885 := by
  native_decide

/-- Coefficient term 886 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0886 : Poly :=
[
  term ((111265474525641 : Rat) / 3408957511869952) [(3, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 886 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0886 : Poly :=
[
  term ((111265474525641 : Rat) / 1704478755934976) [(3, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-111265474525641 : Rat) / 3408957511869952) [(3, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 886 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0886_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0886
        rs_R010_ueqv_R010NYY_generator_25_0800_0899 =
      rs_R010_ueqv_R010NYY_partial_25_0886 := by
  native_decide

/-- Coefficient term 887 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0887 : Poly :=
[
  term ((-9184513182051 : Rat) / 15218560320848) [(3, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 887 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0887 : Poly :=
[
  term ((-9184513182051 : Rat) / 7609280160424) [(3, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((9184513182051 : Rat) / 15218560320848) [(3, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 887 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0887_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0887
        rs_R010_ueqv_R010NYY_generator_25_0800_0899 =
      rs_R010_ueqv_R010NYY_partial_25_0887 := by
  native_decide

/-- Coefficient term 888 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0888 : Poly :=
[
  term ((-2047316026338974331 : Rat) / 47725405166179328) [(3, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 888 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0888 : Poly :=
[
  term ((-2047316026338974331 : Rat) / 23862702583089664) [(3, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((2047316026338974331 : Rat) / 47725405166179328) [(3, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 888 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0888_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0888
        rs_R010_ueqv_R010NYY_generator_25_0800_0899 =
      rs_R010_ueqv_R010NYY_partial_25_0888 := by
  native_decide

/-- Coefficient term 889 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0889 : Poly :=
[
  term ((-333796423576923 : Rat) / 106529922245936) [(3, 1), (13, 1), (15, 4), (16, 1)]
]

/-- Partial product 889 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0889 : Poly :=
[
  term ((-333796423576923 : Rat) / 53264961122968) [(3, 1), (12, 1), (13, 1), (15, 4), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(3, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 889 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0889_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0889
        rs_R010_ueqv_R010NYY_generator_25_0800_0899 =
      rs_R010_ueqv_R010NYY_partial_25_0889 := by
  native_decide

/-- Coefficient term 890 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0890 : Poly :=
[
  term ((-9184513182051 : Rat) / 30437120641696) [(3, 1), (13, 1), (16, 1)]
]

/-- Partial product 890 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0890 : Poly :=
[
  term ((-9184513182051 : Rat) / 15218560320848) [(3, 1), (12, 1), (13, 1), (16, 1)],
  term ((9184513182051 : Rat) / 30437120641696) [(3, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 890 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0890_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0890
        rs_R010_ueqv_R010NYY_generator_25_0800_0899 =
      rs_R010_ueqv_R010NYY_partial_25_0890 := by
  native_decide

/-- Coefficient term 891 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0891 : Poly :=
[
  term ((6373198521658675627 : Rat) / 214764323247806976) [(3, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 891 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0891 : Poly :=
[
  term ((6373198521658675627 : Rat) / 107382161623903488) [(3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6373198521658675627 : Rat) / 214764323247806976) [(3, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 891 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0891_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0891
        rs_R010_ueqv_R010NYY_generator_25_0800_0899 =
      rs_R010_ueqv_R010NYY_partial_25_0891 := by
  native_decide

/-- Coefficient term 892 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0892 : Poly :=
[
  term ((6564662997012819 : Rat) / 3408957511869952) [(3, 1), (14, 1), (15, 3), (16, 1)]
]

/-- Partial product 892 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0892 : Poly :=
[
  term ((6564662997012819 : Rat) / 1704478755934976) [(3, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-6564662997012819 : Rat) / 3408957511869952) [(3, 1), (14, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 892 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0892_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0892
        rs_R010_ueqv_R010NYY_generator_25_0800_0899 =
      rs_R010_ueqv_R010NYY_partial_25_0892 := by
  native_decide

/-- Coefficient term 893 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0893 : Poly :=
[
  term ((-921238143868634625 : Rat) / 23862702583089664) [(3, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 893 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0893 : Poly :=
[
  term ((-921238143868634625 : Rat) / 11931351291544832) [(3, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((921238143868634625 : Rat) / 23862702583089664) [(3, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 893 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0893_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0893
        rs_R010_ueqv_R010NYY_generator_25_0800_0899 =
      rs_R010_ueqv_R010NYY_partial_25_0893 := by
  native_decide

/-- Coefficient term 894 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0894 : Poly :=
[
  term ((-333796423576923 : Rat) / 106529922245936) [(3, 1), (14, 2), (15, 3), (16, 1)]
]

/-- Partial product 894 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0894 : Poly :=
[
  term ((-333796423576923 : Rat) / 53264961122968) [(3, 1), (12, 1), (14, 2), (15, 3), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(3, 1), (14, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 894 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0894_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0894
        rs_R010_ueqv_R010NYY_generator_25_0800_0899 =
      rs_R010_ueqv_R010NYY_partial_25_0894 := by
  native_decide

/-- Coefficient term 895 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0895 : Poly :=
[
  term ((-34804622046599220787 : Rat) / 859057292991227904) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 895 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0895 : Poly :=
[
  term ((-34804622046599220787 : Rat) / 429528646495613952) [(3, 1), (12, 1), (15, 1), (16, 1)],
  term ((34804622046599220787 : Rat) / 859057292991227904) [(3, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 895 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0895_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0895
        rs_R010_ueqv_R010NYY_generator_25_0800_0899 =
      rs_R010_ueqv_R010NYY_partial_25_0895 := by
  native_decide

/-- Coefficient term 896 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0896 : Poly :=
[
  term ((-656020175338677619 : Rat) / 23862702583089664) [(3, 1), (15, 3), (16, 1)]
]

/-- Partial product 896 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0896 : Poly :=
[
  term ((-656020175338677619 : Rat) / 11931351291544832) [(3, 1), (12, 1), (15, 3), (16, 1)],
  term ((656020175338677619 : Rat) / 23862702583089664) [(3, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 896 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0896_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0896
        rs_R010_ueqv_R010NYY_generator_25_0800_0899 =
      rs_R010_ueqv_R010NYY_partial_25_0896 := by
  native_decide

/-- Coefficient term 897 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0897 : Poly :=
[
  term ((10925110817965791 : Rat) / 75210125105630816) [(3, 2), (5, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 897 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0897 : Poly :=
[
  term ((10925110817965791 : Rat) / 37605062552815408) [(3, 2), (5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 75210125105630816) [(3, 2), (5, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 897 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0897_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0897
        rs_R010_ueqv_R010NYY_generator_25_0800_0899 =
      rs_R010_ueqv_R010NYY_partial_25_0897 := by
  native_decide

/-- Coefficient term 898 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0898 : Poly :=
[
  term ((-63182343662700161751 : Rat) / 33694136047322605568) [(3, 2), (5, 1), (9, 1), (12, 1), (16, 1)]
]

/-- Partial product 898 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0898 : Poly :=
[
  term ((63182343662700161751 : Rat) / 33694136047322605568) [(3, 2), (5, 1), (9, 1), (12, 1), (16, 1)],
  term ((-63182343662700161751 : Rat) / 16847068023661302784) [(3, 2), (5, 1), (9, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 898 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0898_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0898
        rs_R010_ueqv_R010NYY_generator_25_0800_0899 =
      rs_R010_ueqv_R010NYY_partial_25_0898 := by
  native_decide

/-- Coefficient term 899 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0899 : Poly :=
[
  term ((63998085270441607479 : Rat) / 16847068023661302784) [(3, 2), (5, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 899 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0899 : Poly :=
[
  term ((63998085270441607479 : Rat) / 8423534011830651392) [(3, 2), (5, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-63998085270441607479 : Rat) / 16847068023661302784) [(3, 2), (5, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 899 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0899_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0899
        rs_R010_ueqv_R010NYY_generator_25_0800_0899 =
      rs_R010_ueqv_R010NYY_partial_25_0899 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010NYY_partials_25_0800_0899 : List Poly :=
[
  rs_R010_ueqv_R010NYY_partial_25_0800,
  rs_R010_ueqv_R010NYY_partial_25_0801,
  rs_R010_ueqv_R010NYY_partial_25_0802,
  rs_R010_ueqv_R010NYY_partial_25_0803,
  rs_R010_ueqv_R010NYY_partial_25_0804,
  rs_R010_ueqv_R010NYY_partial_25_0805,
  rs_R010_ueqv_R010NYY_partial_25_0806,
  rs_R010_ueqv_R010NYY_partial_25_0807,
  rs_R010_ueqv_R010NYY_partial_25_0808,
  rs_R010_ueqv_R010NYY_partial_25_0809,
  rs_R010_ueqv_R010NYY_partial_25_0810,
  rs_R010_ueqv_R010NYY_partial_25_0811,
  rs_R010_ueqv_R010NYY_partial_25_0812,
  rs_R010_ueqv_R010NYY_partial_25_0813,
  rs_R010_ueqv_R010NYY_partial_25_0814,
  rs_R010_ueqv_R010NYY_partial_25_0815,
  rs_R010_ueqv_R010NYY_partial_25_0816,
  rs_R010_ueqv_R010NYY_partial_25_0817,
  rs_R010_ueqv_R010NYY_partial_25_0818,
  rs_R010_ueqv_R010NYY_partial_25_0819,
  rs_R010_ueqv_R010NYY_partial_25_0820,
  rs_R010_ueqv_R010NYY_partial_25_0821,
  rs_R010_ueqv_R010NYY_partial_25_0822,
  rs_R010_ueqv_R010NYY_partial_25_0823,
  rs_R010_ueqv_R010NYY_partial_25_0824,
  rs_R010_ueqv_R010NYY_partial_25_0825,
  rs_R010_ueqv_R010NYY_partial_25_0826,
  rs_R010_ueqv_R010NYY_partial_25_0827,
  rs_R010_ueqv_R010NYY_partial_25_0828,
  rs_R010_ueqv_R010NYY_partial_25_0829,
  rs_R010_ueqv_R010NYY_partial_25_0830,
  rs_R010_ueqv_R010NYY_partial_25_0831,
  rs_R010_ueqv_R010NYY_partial_25_0832,
  rs_R010_ueqv_R010NYY_partial_25_0833,
  rs_R010_ueqv_R010NYY_partial_25_0834,
  rs_R010_ueqv_R010NYY_partial_25_0835,
  rs_R010_ueqv_R010NYY_partial_25_0836,
  rs_R010_ueqv_R010NYY_partial_25_0837,
  rs_R010_ueqv_R010NYY_partial_25_0838,
  rs_R010_ueqv_R010NYY_partial_25_0839,
  rs_R010_ueqv_R010NYY_partial_25_0840,
  rs_R010_ueqv_R010NYY_partial_25_0841,
  rs_R010_ueqv_R010NYY_partial_25_0842,
  rs_R010_ueqv_R010NYY_partial_25_0843,
  rs_R010_ueqv_R010NYY_partial_25_0844,
  rs_R010_ueqv_R010NYY_partial_25_0845,
  rs_R010_ueqv_R010NYY_partial_25_0846,
  rs_R010_ueqv_R010NYY_partial_25_0847,
  rs_R010_ueqv_R010NYY_partial_25_0848,
  rs_R010_ueqv_R010NYY_partial_25_0849,
  rs_R010_ueqv_R010NYY_partial_25_0850,
  rs_R010_ueqv_R010NYY_partial_25_0851,
  rs_R010_ueqv_R010NYY_partial_25_0852,
  rs_R010_ueqv_R010NYY_partial_25_0853,
  rs_R010_ueqv_R010NYY_partial_25_0854,
  rs_R010_ueqv_R010NYY_partial_25_0855,
  rs_R010_ueqv_R010NYY_partial_25_0856,
  rs_R010_ueqv_R010NYY_partial_25_0857,
  rs_R010_ueqv_R010NYY_partial_25_0858,
  rs_R010_ueqv_R010NYY_partial_25_0859,
  rs_R010_ueqv_R010NYY_partial_25_0860,
  rs_R010_ueqv_R010NYY_partial_25_0861,
  rs_R010_ueqv_R010NYY_partial_25_0862,
  rs_R010_ueqv_R010NYY_partial_25_0863,
  rs_R010_ueqv_R010NYY_partial_25_0864,
  rs_R010_ueqv_R010NYY_partial_25_0865,
  rs_R010_ueqv_R010NYY_partial_25_0866,
  rs_R010_ueqv_R010NYY_partial_25_0867,
  rs_R010_ueqv_R010NYY_partial_25_0868,
  rs_R010_ueqv_R010NYY_partial_25_0869,
  rs_R010_ueqv_R010NYY_partial_25_0870,
  rs_R010_ueqv_R010NYY_partial_25_0871,
  rs_R010_ueqv_R010NYY_partial_25_0872,
  rs_R010_ueqv_R010NYY_partial_25_0873,
  rs_R010_ueqv_R010NYY_partial_25_0874,
  rs_R010_ueqv_R010NYY_partial_25_0875,
  rs_R010_ueqv_R010NYY_partial_25_0876,
  rs_R010_ueqv_R010NYY_partial_25_0877,
  rs_R010_ueqv_R010NYY_partial_25_0878,
  rs_R010_ueqv_R010NYY_partial_25_0879,
  rs_R010_ueqv_R010NYY_partial_25_0880,
  rs_R010_ueqv_R010NYY_partial_25_0881,
  rs_R010_ueqv_R010NYY_partial_25_0882,
  rs_R010_ueqv_R010NYY_partial_25_0883,
  rs_R010_ueqv_R010NYY_partial_25_0884,
  rs_R010_ueqv_R010NYY_partial_25_0885,
  rs_R010_ueqv_R010NYY_partial_25_0886,
  rs_R010_ueqv_R010NYY_partial_25_0887,
  rs_R010_ueqv_R010NYY_partial_25_0888,
  rs_R010_ueqv_R010NYY_partial_25_0889,
  rs_R010_ueqv_R010NYY_partial_25_0890,
  rs_R010_ueqv_R010NYY_partial_25_0891,
  rs_R010_ueqv_R010NYY_partial_25_0892,
  rs_R010_ueqv_R010NYY_partial_25_0893,
  rs_R010_ueqv_R010NYY_partial_25_0894,
  rs_R010_ueqv_R010NYY_partial_25_0895,
  rs_R010_ueqv_R010NYY_partial_25_0896,
  rs_R010_ueqv_R010NYY_partial_25_0897,
  rs_R010_ueqv_R010NYY_partial_25_0898,
  rs_R010_ueqv_R010NYY_partial_25_0899
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010NYY_block_25_0800_0899 : Poly :=
[
  term ((-363534495967615059 : Rat) / 4700632819101926) [(3, 1), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((121178165322538353 : Rat) / 1979213818569232) [(3, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-666437606924626277563 : Rat) / 4211767005915325696) [(3, 1), (8, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-119889289681480769169 : Rat) / 526470875739415712) [(3, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-333796423576923 : Rat) / 26632480561484) [(3, 1), (8, 1), (11, 1), (12, 1), (15, 4), (16, 1)],
  term ((-1886845714052524094421 : Rat) / 8423534011830651392) [(3, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 4700632819101926) [(3, 1), (8, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((-423685498714386141241 : Rat) / 4211767005915325696) [(3, 1), (8, 1), (11, 1), (12, 2), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(3, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-121178165322538353 : Rat) / 3958427637138464) [(3, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((666437606924626277563 : Rat) / 8423534011830651392) [(3, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((99531357907294325865 : Rat) / 1052941751478831424) [(3, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((333796423576923 : Rat) / 53264961122968) [(3, 1), (8, 1), (11, 1), (15, 4), (16, 1)],
  term ((165037943769065016833 : Rat) / 1203362001690093056) [(3, 1), (8, 1), (11, 1), (16, 1)],
  term ((-1228626950032067571841 : Rat) / 2105883502957662848) [(3, 1), (8, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 2350316409550963) [(3, 1), (8, 1), (11, 2), (12, 1), (15, 3), (16, 1)],
  term ((1228626950032067571841 : Rat) / 4211767005915325696) [(3, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 4700632819101926) [(3, 1), (8, 1), (11, 2), (15, 3), (16, 1)],
  term ((333796423576923 : Rat) / 53264961122968) [(3, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-111265474525641 : Rat) / 22427352051776) [(3, 1), (8, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-561645947889961853 : Rat) / 11931351291544832) [(3, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1410112736815614765 : Rat) / 23862702583089664) [(3, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((3226698761243589 : Rat) / 426119688983744) [(3, 1), (8, 1), (12, 1), (15, 3), (16, 1)],
  term ((-137004120164657951 : Rat) / 5965675645772416) [(3, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 53264961122968) [(3, 1), (8, 1), (12, 2), (15, 3), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(3, 1), (8, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((111265474525641 : Rat) / 44854704103552) [(3, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((561645947889961853 : Rat) / 23862702583089664) [(3, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((240588711020704381 : Rat) / 6817915023739904) [(3, 1), (8, 1), (15, 1), (16, 1)],
  term ((-1891513066935897 : Rat) / 852239377967488) [(3, 1), (8, 1), (15, 3), (16, 1)],
  term ((363534495967615059 : Rat) / 4700632819101926) [(3, 1), (8, 2), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 2350316409550963) [(3, 1), (8, 2), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((320032617216188139077 : Rat) / 526470875739415712) [(3, 1), (8, 2), (11, 1), (12, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(3, 1), (8, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 4700632819101926) [(3, 1), (8, 2), (11, 1), (15, 2), (16, 1)],
  term ((-320032617216188139077 : Rat) / 1052941751478831424) [(3, 1), (8, 2), (11, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 53264961122968) [(3, 1), (8, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((792038122205226483 : Rat) / 5965675645772416) [(3, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 26632480561484) [(3, 1), (8, 2), (12, 1), (15, 3), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(3, 1), (8, 2), (13, 1), (15, 2), (16, 1)],
  term ((-792038122205226483 : Rat) / 11931351291544832) [(3, 1), (8, 2), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 53264961122968) [(3, 1), (8, 2), (15, 3), (16, 1)],
  term ((-363534495967615059 : Rat) / 2350316409550963) [(3, 1), (9, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(3, 1), (9, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 4700632819101926) [(3, 1), (9, 1), (10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 4700632819101926) [(3, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 26632480561484) [(3, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(3, 1), (9, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-333796423576923 : Rat) / 53264961122968) [(3, 1), (9, 1), (10, 1), (12, 2), (15, 2), (16, 1)],
  term ((-333796423576923 : Rat) / 53264961122968) [(3, 1), (9, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((536084824294706049045 : Rat) / 8423534011830651392) [(3, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((590372642359203231189 : Rat) / 16847068023661302784) [(3, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((2953975112298767450295 : Rat) / 16847068023661302784) [(3, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 26632480561484) [(3, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((20010068978290159222565 : Rat) / 101082408141967816704) [(3, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 53264961122968) [(3, 1), (9, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-4078593481799756331 : Rat) / 63334842194215424) [(3, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-536084824294706049045 : Rat) / 16847068023661302784) [(3, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-590372642359203231189 : Rat) / 33694136047322605568) [(3, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-2953975112298767450295 : Rat) / 33694136047322605568) [(3, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 53264961122968) [(3, 1), (9, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((-16755351379813953670427 : Rat) / 202164816283935633408) [(3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(3, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((-363534495967615059 : Rat) / 2350316409550963) [(3, 1), (9, 1), (11, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((2389324849160611452179 : Rat) / 4211767005915325696) [(3, 1), (9, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 4700632819101926) [(3, 1), (9, 1), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((2389324849160611452179 : Rat) / 8423534011830651392) [(3, 1), (9, 1), (11, 2), (12, 1), (16, 1)],
  term ((1104993165499089067 : Rat) / 2105883502957662848) [(3, 1), (9, 1), (11, 2), (12, 2), (16, 1)],
  term ((363534495967615059 : Rat) / 4700632819101926) [(3, 1), (9, 1), (11, 2), (14, 1), (15, 2), (16, 1)],
  term ((-2389324849160611452179 : Rat) / 8423534011830651392) [(3, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(3, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((-2391534835491609630313 : Rat) / 16847068023661302784) [(3, 1), (9, 1), (11, 2), (16, 1)],
  term ((189099744644419281 : Rat) / 11931351291544832) [(3, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((182868878070983385 : Rat) / 23862702583089664) [(3, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-590107851045851143 : Rat) / 23862702583089664) [(3, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-546492365945773 : Rat) / 182622723850176) [(3, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((184902915630651359 : Rat) / 6817915023739904) [(3, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-546492365945773 : Rat) / 365245447700352) [(3, 1), (9, 1), (12, 1), (16, 1)],
  term ((-297211693362289157 : Rat) / 11931351291544832) [(3, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((546492365945773 : Rat) / 182622723850176) [(3, 1), (9, 1), (12, 2), (16, 1)],
  term ((-189099744644419281 : Rat) / 23862702583089664) [(3, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-182868878070983385 : Rat) / 47725405166179328) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((590107851045851143 : Rat) / 47725405166179328) [(3, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((546492365945773 : Rat) / 365245447700352) [(3, 1), (9, 1), (14, 1), (16, 1)],
  term ((-699897022689981199 : Rat) / 95450810332358656) [(3, 1), (9, 1), (15, 2), (16, 1)],
  term ((2301633344300590327 : Rat) / 55417986919938496) [(3, 1), (9, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((2301633344300590327 : Rat) / 110835973839876992) [(3, 1), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((122145130947717451615 : Rat) / 2105883502957662848) [(3, 1), (9, 2), (11, 1), (12, 2), (16, 1)],
  term ((-2301633344300590327 : Rat) / 110835973839876992) [(3, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((-5665059406247023893 : Rat) / 227663081400828416) [(3, 1), (9, 2), (11, 1), (16, 1)],
  term ((5707104705546903 : Rat) / 372854727860776) [(3, 1), (9, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((5707104705546903 : Rat) / 745709455721552) [(3, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((8690466778600269 : Rat) / 372854727860776) [(3, 1), (9, 2), (12, 2), (15, 1), (16, 1)],
  term ((-5707104705546903 : Rat) / 745709455721552) [(3, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-3599392871036793 : Rat) / 372854727860776) [(3, 1), (9, 2), (15, 1), (16, 1)],
  term ((-1090603487902845177 : Rat) / 37605062552815408) [(3, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 3958427637138464) [(3, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1817672479838075295 : Rat) / 37605062552815408) [(3, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((637970958511604579851 : Rat) / 1203362001690093056) [(3, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((6180086431449456003 : Rat) / 75210125105630816) [(3, 1), (10, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((41878525345321055949 : Rat) / 4211767005915325696) [(3, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((3297501003327384801 : Rat) / 300840500422523264) [(3, 1), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((1090603487902845177 : Rat) / 75210125105630816) [(3, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 7916855274276928) [(3, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1817672479838075295 : Rat) / 75210125105630816) [(3, 1), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-637970958511604579851 : Rat) / 2406724003380186112) [(3, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-6180086431449456003 : Rat) / 150420250211261632) [(3, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-16240258092153187389 : Rat) / 2105883502957662848) [(3, 1), (10, 1), (11, 1), (16, 1)],
  term ((1001389270730769 : Rat) / 426119688983744) [(3, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((333796423576923 : Rat) / 44854704103552) [(3, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((202561326766678947 : Rat) / 1704478755934976) [(3, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1668982117884615 : Rat) / 426119688983744) [(3, 1), (10, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((50899506689979569 : Rat) / 11931351291544832) [(3, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-5674539200807691 : Rat) / 852239377967488) [(3, 1), (10, 1), (12, 1), (15, 3), (16, 1)],
  term ((802906227816993 : Rat) / 106529922245936) [(3, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1001389270730769 : Rat) / 852239377967488) [(3, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-333796423576923 : Rat) / 89709408207104) [(3, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-202561326766678947 : Rat) / 3408957511869952) [(3, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1668982117884615 : Rat) / 852239377967488) [(3, 1), (10, 1), (14, 1), (15, 3), (16, 1)],
  term ((-95862255447731177 : Rat) / 23862702583089664) [(3, 1), (10, 1), (15, 1), (16, 1)],
  term ((5674539200807691 : Rat) / 1704478755934976) [(3, 1), (10, 1), (15, 3), (16, 1)],
  term ((2119433930691459429 : Rat) / 150420250211261632) [(3, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1692627396991961967445 : Rat) / 8423534011830651392) [(3, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 4700632819101926) [(3, 1), (11, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-9943633373080511345 : Rat) / 263235437869707856) [(3, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((303788861038737598771 : Rat) / 1330031686078523904) [(3, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 4700632819101926) [(3, 1), (11, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-2647720545115526336833 : Rat) / 8423534011830651392) [(3, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-47974123081924692170149 : Rat) / 151623612212951725056) [(3, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-333796423576923 : Rat) / 53264961122968) [(3, 1), (11, 1), (12, 1), (15, 4), (16, 1)],
  term ((-16958640374276650251767 : Rat) / 50541204070983908352) [(3, 1), (11, 1), (12, 1), (16, 1)],
  term ((-126563136485209545013 : Rat) / 2105883502957662848) [(3, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((893650397921630687125 : Rat) / 12635301017745977088) [(3, 1), (11, 1), (12, 2), (16, 1)],
  term ((-2119433930691459429 : Rat) / 300840500422523264) [(3, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1692627396991961967445 : Rat) / 16847068023661302784) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(3, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((9943633373080511345 : Rat) / 526470875739415712) [(3, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-303788861038737598771 : Rat) / 2660063372157047808) [(3, 1), (11, 1), (14, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(3, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((2647720545115526336833 : Rat) / 16847068023661302784) [(3, 1), (11, 1), (14, 2), (16, 1)],
  term ((52530395995392235790617 : Rat) / 303247224425903450112) [(3, 1), (11, 1), (15, 2), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(3, 1), (11, 1), (15, 4), (16, 1)],
  term ((5057113192811129625839 : Rat) / 33694136047322605568) [(3, 1), (11, 1), (16, 1)],
  term ((18310457117411443123 : Rat) / 300840500422523264) [(3, 1), (11, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((18310457117411443123 : Rat) / 601681000845046528) [(3, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((137235185884509587845 : Rat) / 2105883502957662848) [(3, 1), (11, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2989797080776565767 : Rat) / 13938556004132352) [(3, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 4700632819101926) [(3, 1), (11, 2), (12, 1), (15, 3), (16, 1)],
  term ((-564653406062258611227 : Rat) / 4211767005915325696) [(3, 1), (11, 2), (12, 2), (15, 1), (16, 1)],
  term ((-18310457117411443123 : Rat) / 601681000845046528) [(3, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-18310457117411443123 : Rat) / 1203362001690093056) [(3, 1), (11, 2), (13, 1), (16, 1)],
  term ((-137235185884509587845 : Rat) / 4211767005915325696) [(3, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((1778615581408672392313 : Rat) / 12635301017745977088) [(3, 1), (11, 2), (15, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(3, 1), (11, 2), (15, 3), (16, 1)],
  term ((111265474525641 : Rat) / 1704478755934976) [(3, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-9184513182051 : Rat) / 7609280160424) [(3, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2047316026338974331 : Rat) / 23862702583089664) [(3, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-333796423576923 : Rat) / 53264961122968) [(3, 1), (12, 1), (13, 1), (15, 4), (16, 1)],
  term ((-9184513182051 : Rat) / 15218560320848) [(3, 1), (12, 1), (13, 1), (16, 1)],
  term ((6373198521658675627 : Rat) / 107382161623903488) [(3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((6564662997012819 : Rat) / 1704478755934976) [(3, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-921238143868634625 : Rat) / 11931351291544832) [(3, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 53264961122968) [(3, 1), (12, 1), (14, 2), (15, 3), (16, 1)],
  term ((-39080847319909189057 : Rat) / 429528646495613952) [(3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-670039625128908385 : Rat) / 11931351291544832) [(3, 1), (12, 1), (15, 3), (16, 1)],
  term ((712704212218328045 : Rat) / 35794053874634496) [(3, 1), (12, 2), (15, 1), (16, 1)],
  term ((1001389270730769 : Rat) / 426119688983744) [(3, 1), (12, 2), (15, 3), (16, 1)],
  term ((-111265474525641 : Rat) / 3408957511869952) [(3, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((9184513182051 : Rat) / 15218560320848) [(3, 1), (13, 1), (14, 1), (16, 1)],
  term ((2047316026338974331 : Rat) / 47725405166179328) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(3, 1), (13, 1), (15, 4), (16, 1)],
  term ((9184513182051 : Rat) / 30437120641696) [(3, 1), (13, 1), (16, 1)],
  term ((-6373198521658675627 : Rat) / 214764323247806976) [(3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6564662997012819 : Rat) / 3408957511869952) [(3, 1), (14, 1), (15, 3), (16, 1)],
  term ((921238143868634625 : Rat) / 23862702583089664) [(3, 1), (14, 2), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(3, 1), (14, 2), (15, 3), (16, 1)],
  term ((34804622046599220787 : Rat) / 859057292991227904) [(3, 1), (15, 1), (16, 1)],
  term ((656020175338677619 : Rat) / 23862702583089664) [(3, 1), (15, 3), (16, 1)],
  term ((10925110817965791 : Rat) / 37605062552815408) [(3, 2), (5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 75210125105630816) [(3, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((63998085270441607479 : Rat) / 8423534011830651392) [(3, 2), (5, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((63182343662700161751 : Rat) / 33694136047322605568) [(3, 2), (5, 1), (9, 1), (12, 1), (16, 1)],
  term ((-63182343662700161751 : Rat) / 16847068023661302784) [(3, 2), (5, 1), (9, 1), (12, 2), (16, 1)],
  term ((-63998085270441607479 : Rat) / 16847068023661302784) [(3, 2), (5, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 25, terms 800 through 899. -/
theorem rs_R010_ueqv_R010NYY_block_25_0800_0899_valid :
    checkProductSumEq rs_R010_ueqv_R010NYY_partials_25_0800_0899
      rs_R010_ueqv_R010NYY_block_25_0800_0899 = true := by
  native_decide

end R010UeqvR010NYYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
