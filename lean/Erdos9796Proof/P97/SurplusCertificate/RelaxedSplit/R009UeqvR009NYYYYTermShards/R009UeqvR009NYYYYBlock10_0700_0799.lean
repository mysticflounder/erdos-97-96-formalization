/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NYYYY, term block 10:700-799

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NYYYYTermShards

/-- Generator polynomial 10 for relaxed split surplus certificate `R009:u=v:R009NYYYY`. -/
def rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(2, 1)]
]

/-- Coefficient term 700 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0700 : Poly :=
[
  term ((-16789423421 : Rat) / 3186190560) [(8, 1), (15, 2)]
]

/-- Partial product 700 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0700 : Poly :=
[
  term ((-16789423421 : Rat) / 1593095280) [(2, 1), (8, 1), (15, 2)],
  term ((16789423421 : Rat) / 3186190560) [(8, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 700 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0700_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0700
        rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 =
      rs_R009_ueqv_R009NYYYY_partial_10_0700 := by
  native_decide

/-- Coefficient term 701 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0701 : Poly :=
[
  term ((252275 : Rat) / 196194) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 701 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0701 : Poly :=
[
  term ((252275 : Rat) / 98097) [(2, 1), (8, 1), (15, 2), (16, 1)],
  term ((-252275 : Rat) / 196194) [(8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 701 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0701_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0701
        rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 =
      rs_R009_ueqv_R009NYYYY_partial_10_0701 := by
  native_decide

/-- Coefficient term 702 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0702 : Poly :=
[
  term ((-20 : Rat) / 29) [(9, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 702 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0702 : Poly :=
[
  term ((-40 : Rat) / 29) [(2, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((20 : Rat) / 29) [(9, 1), (10, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 702 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0702_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0702
        rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 =
      rs_R009_ueqv_R009NYYYY_partial_10_0702 := by
  native_decide

/-- Coefficient term 703 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0703 : Poly :=
[
  term ((32 : Rat) / 29) [(9, 1), (10, 1), (12, 1), (15, 3)]
]

/-- Partial product 703 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0703 : Poly :=
[
  term ((64 : Rat) / 29) [(2, 1), (9, 1), (10, 1), (12, 1), (15, 3)],
  term ((-32 : Rat) / 29) [(9, 1), (10, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 703 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0703_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0703
        rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 =
      rs_R009_ueqv_R009NYYYY_partial_10_0703 := by
  native_decide

/-- Coefficient term 704 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0704 : Poly :=
[
  term ((-16 : Rat) / 29) [(9, 1), (10, 1), (13, 1), (15, 2)]
]

/-- Partial product 704 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0704 : Poly :=
[
  term ((-32 : Rat) / 29) [(2, 1), (9, 1), (10, 1), (13, 1), (15, 2)],
  term ((16 : Rat) / 29) [(9, 1), (10, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 704 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0704_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0704
        rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 =
      rs_R009_ueqv_R009NYYYY_partial_10_0704 := by
  native_decide

/-- Coefficient term 705 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0705 : Poly :=
[
  term ((-12 : Rat) / 29) [(9, 1), (10, 1), (15, 3)]
]

/-- Partial product 705 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0705 : Poly :=
[
  term ((-24 : Rat) / 29) [(2, 1), (9, 1), (10, 1), (15, 3)],
  term ((12 : Rat) / 29) [(9, 1), (10, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 705 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0705_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0705
        rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 =
      rs_R009_ueqv_R009NYYYY_partial_10_0705 := by
  native_decide

/-- Coefficient term 706 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0706 : Poly :=
[
  term ((-77513480 : Rat) / 19913691) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 706 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0706 : Poly :=
[
  term ((-155026960 : Rat) / 19913691) [(2, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((77513480 : Rat) / 19913691) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 706 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0706_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0706
        rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 =
      rs_R009_ueqv_R009NYYYY_partial_10_0706 := by
  native_decide

/-- Coefficient term 707 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0707 : Poly :=
[
  term ((73600 : Rat) / 98097) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 707 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0707 : Poly :=
[
  term ((147200 : Rat) / 98097) [(2, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-73600 : Rat) / 98097) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 707 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0707_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0707
        rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 =
      rs_R009_ueqv_R009NYYYY_partial_10_0707 := by
  native_decide

/-- Coefficient term 708 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0708 : Poly :=
[
  term ((3937576 : Rat) / 5240445) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 3)]
]

/-- Partial product 708 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0708 : Poly :=
[
  term ((7875152 : Rat) / 5240445) [(2, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 3)],
  term ((-3937576 : Rat) / 5240445) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 708 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0708_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0708
        rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 =
      rs_R009_ueqv_R009NYYYY_partial_10_0708 := by
  native_decide

/-- Coefficient term 709 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0709 : Poly :=
[
  term ((-2944 : Rat) / 5163) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 709 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0709 : Poly :=
[
  term ((-5888 : Rat) / 5163) [(2, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((2944 : Rat) / 5163) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 709 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0709_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0709
        rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 =
      rs_R009_ueqv_R009NYYYY_partial_10_0709 := by
  native_decide

/-- Coefficient term 710 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0710 : Poly :=
[
  term ((-31005392 : Rat) / 6637897) [(9, 1), (11, 1), (12, 1), (13, 2), (15, 2)]
]

/-- Partial product 710 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0710 : Poly :=
[
  term ((-62010784 : Rat) / 6637897) [(2, 1), (9, 1), (11, 1), (12, 1), (13, 2), (15, 2)],
  term ((31005392 : Rat) / 6637897) [(9, 1), (11, 1), (12, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 710 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0710_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0710
        rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 =
      rs_R009_ueqv_R009NYYYY_partial_10_0710 := by
  native_decide

/-- Coefficient term 711 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0711 : Poly :=
[
  term ((29440 : Rat) / 32699) [(9, 1), (11, 1), (12, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 711 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0711 : Poly :=
[
  term ((58880 : Rat) / 32699) [(2, 1), (9, 1), (11, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-29440 : Rat) / 32699) [(9, 1), (11, 1), (12, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 711 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0711_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0711
        rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 =
      rs_R009_ueqv_R009NYYYY_partial_10_0711 := by
  native_decide

/-- Coefficient term 712 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0712 : Poly :=
[
  term ((-540351292 : Rat) / 99568455) [(9, 1), (11, 1), (12, 1), (15, 2)]
]

/-- Partial product 712 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0712 : Poly :=
[
  term ((-1080702584 : Rat) / 99568455) [(2, 1), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((540351292 : Rat) / 99568455) [(9, 1), (11, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 712 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0712_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0712
        rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 =
      rs_R009_ueqv_R009NYYYY_partial_10_0712 := by
  native_decide

/-- Coefficient term 713 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0713 : Poly :=
[
  term ((19136 : Rat) / 32699) [(9, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 713 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0713 : Poly :=
[
  term ((38272 : Rat) / 32699) [(2, 1), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-19136 : Rat) / 32699) [(9, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 713 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0713_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0713
        rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 =
      rs_R009_ueqv_R009NYYYY_partial_10_0713 := by
  native_decide

/-- Coefficient term 714 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0714 : Poly :=
[
  term ((681900208 : Rat) / 99568455) [(9, 1), (11, 1), (12, 1), (15, 4)]
]

/-- Partial product 714 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0714 : Poly :=
[
  term ((1363800416 : Rat) / 99568455) [(2, 1), (9, 1), (11, 1), (12, 1), (15, 4)],
  term ((-681900208 : Rat) / 99568455) [(9, 1), (11, 1), (12, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 714 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0714_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0714
        rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 =
      rs_R009_ueqv_R009NYYYY_partial_10_0714 := by
  native_decide

/-- Coefficient term 715 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0715 : Poly :=
[
  term ((-17664 : Rat) / 32699) [(9, 1), (11, 1), (12, 1), (15, 4), (16, 1)]
]

/-- Partial product 715 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0715 : Poly :=
[
  term ((-35328 : Rat) / 32699) [(2, 1), (9, 1), (11, 1), (12, 1), (15, 4), (16, 1)],
  term ((17664 : Rat) / 32699) [(9, 1), (11, 1), (12, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 715 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0715_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0715
        rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 =
      rs_R009_ueqv_R009NYYYY_partial_10_0715 := by
  native_decide

/-- Coefficient term 716 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0716 : Poly :=
[
  term ((15502696 : Rat) / 6637897) [(9, 1), (11, 1), (12, 2), (13, 1), (15, 1)]
]

/-- Partial product 716 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0716 : Poly :=
[
  term ((31005392 : Rat) / 6637897) [(2, 1), (9, 1), (11, 1), (12, 2), (13, 1), (15, 1)],
  term ((-15502696 : Rat) / 6637897) [(9, 1), (11, 1), (12, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 716 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0716_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0716
        rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 =
      rs_R009_ueqv_R009NYYYY_partial_10_0716 := by
  native_decide

/-- Coefficient term 717 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0717 : Poly :=
[
  term ((-14720 : Rat) / 32699) [(9, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 717 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0717 : Poly :=
[
  term ((-29440 : Rat) / 32699) [(2, 1), (9, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((14720 : Rat) / 32699) [(9, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 717 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0717_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0717
        rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 =
      rs_R009_ueqv_R009NYYYY_partial_10_0717 := by
  native_decide

/-- Coefficient term 718 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0718 : Poly :=
[
  term ((22827272 : Rat) / 6637897) [(9, 1), (11, 1), (12, 2), (15, 2)]
]

/-- Partial product 718 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0718 : Poly :=
[
  term ((45654544 : Rat) / 6637897) [(2, 1), (9, 1), (11, 1), (12, 2), (15, 2)],
  term ((-22827272 : Rat) / 6637897) [(9, 1), (11, 1), (12, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 718 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0718_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0718
        rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 =
      rs_R009_ueqv_R009NYYYY_partial_10_0718 := by
  native_decide

/-- Coefficient term 719 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0719 : Poly :=
[
  term ((-14720 : Rat) / 32699) [(9, 1), (11, 1), (12, 2), (15, 2), (16, 1)]
]

/-- Partial product 719 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0719 : Poly :=
[
  term ((-29440 : Rat) / 32699) [(2, 1), (9, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((14720 : Rat) / 32699) [(9, 1), (11, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 719 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0719_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0719
        rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 =
      rs_R009_ueqv_R009NYYYY_partial_10_0719 := by
  native_decide

/-- Coefficient term 720 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0720 : Poly :=
[
  term ((4268062 : Rat) / 2844813) [(9, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 720 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0720 : Poly :=
[
  term ((8536124 : Rat) / 2844813) [(2, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-4268062 : Rat) / 2844813) [(9, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 720 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0720_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0720
        rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 =
      rs_R009_ueqv_R009NYYYY_partial_10_0720 := by
  native_decide

/-- Coefficient term 721 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0721 : Poly :=
[
  term ((-25760 : Rat) / 98097) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 721 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0721 : Poly :=
[
  term ((-51520 : Rat) / 98097) [(2, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((25760 : Rat) / 98097) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 721 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0721_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0721
        rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 =
      rs_R009_ueqv_R009NYYYY_partial_10_0721 := by
  native_decide

/-- Coefficient term 722 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0722 : Poly :=
[
  term ((-99569912 : Rat) / 33189485) [(9, 1), (11, 1), (13, 1), (15, 3)]
]

/-- Partial product 722 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0722 : Poly :=
[
  term ((-199139824 : Rat) / 33189485) [(2, 1), (9, 1), (11, 1), (13, 1), (15, 3)],
  term ((99569912 : Rat) / 33189485) [(9, 1), (11, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 722 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0722_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0722
        rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 =
      rs_R009_ueqv_R009NYYYY_partial_10_0722 := by
  native_decide

/-- Coefficient term 723 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0723 : Poly :=
[
  term ((32384 : Rat) / 98097) [(9, 1), (11, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 723 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0723 : Poly :=
[
  term ((64768 : Rat) / 98097) [(2, 1), (9, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-32384 : Rat) / 98097) [(9, 1), (11, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 723 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0723_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0723
        rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 =
      rs_R009_ueqv_R009NYYYY_partial_10_0723 := by
  native_decide

/-- Coefficient term 724 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0724 : Poly :=
[
  term ((7751348 : Rat) / 99568455) [(9, 1), (11, 1), (13, 2), (15, 2)]
]

/-- Partial product 724 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0724 : Poly :=
[
  term ((15502696 : Rat) / 99568455) [(2, 1), (9, 1), (11, 1), (13, 2), (15, 2)],
  term ((-7751348 : Rat) / 99568455) [(9, 1), (11, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 724 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0724_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0724
        rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 =
      rs_R009_ueqv_R009NYYYY_partial_10_0724 := by
  native_decide

/-- Coefficient term 725 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0725 : Poly :=
[
  term ((-1472 : Rat) / 98097) [(9, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 725 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0725 : Poly :=
[
  term ((-2944 : Rat) / 98097) [(2, 1), (9, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((1472 : Rat) / 98097) [(9, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 725 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0725_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0725
        rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 =
      rs_R009_ueqv_R009NYYYY_partial_10_0725 := by
  native_decide

/-- Coefficient term 726 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0726 : Poly :=
[
  term ((122266103 : Rat) / 99568455) [(9, 1), (11, 1), (15, 2)]
]

/-- Partial product 726 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0726 : Poly :=
[
  term ((244532206 : Rat) / 99568455) [(2, 1), (9, 1), (11, 1), (15, 2)],
  term ((-122266103 : Rat) / 99568455) [(9, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 726 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0726_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0726
        rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 =
      rs_R009_ueqv_R009NYYYY_partial_10_0726 := by
  native_decide

/-- Coefficient term 727 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0727 : Poly :=
[
  term ((-8464 : Rat) / 32699) [(9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 727 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0727 : Poly :=
[
  term ((-16928 : Rat) / 32699) [(2, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((8464 : Rat) / 32699) [(9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 727 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0727_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0727
        rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 =
      rs_R009_ueqv_R009NYYYY_partial_10_0727 := by
  native_decide

/-- Coefficient term 728 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0728 : Poly :=
[
  term ((-59876924 : Rat) / 99568455) [(9, 1), (11, 1), (15, 4)]
]

/-- Partial product 728 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0728 : Poly :=
[
  term ((-119753848 : Rat) / 99568455) [(2, 1), (9, 1), (11, 1), (15, 4)],
  term ((59876924 : Rat) / 99568455) [(9, 1), (11, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 728 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0728_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0728
        rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 =
      rs_R009_ueqv_R009NYYYY_partial_10_0728 := by
  native_decide

/-- Coefficient term 729 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0729 : Poly :=
[
  term ((1472 : Rat) / 32699) [(9, 1), (11, 1), (15, 4), (16, 1)]
]

/-- Partial product 729 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0729 : Poly :=
[
  term ((2944 : Rat) / 32699) [(2, 1), (9, 1), (11, 1), (15, 4), (16, 1)],
  term ((-1472 : Rat) / 32699) [(9, 1), (11, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 729 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0729_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0729
        rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 =
      rs_R009_ueqv_R009NYYYY_partial_10_0729 := by
  native_decide

/-- Coefficient term 730 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0730 : Poly :=
[
  term ((-25 : Rat) / 12) [(9, 1), (12, 1), (13, 1)]
]

/-- Partial product 730 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0730 : Poly :=
[
  term ((-25 : Rat) / 6) [(2, 1), (9, 1), (12, 1), (13, 1)],
  term ((25 : Rat) / 12) [(9, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 730 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0730_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0730
        rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 =
      rs_R009_ueqv_R009NYYYY_partial_10_0730 := by
  native_decide

/-- Coefficient term 731 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0731 : Poly :=
[
  term ((-63 : Rat) / 4) [(9, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 731 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0731 : Poly :=
[
  term ((-63 : Rat) / 2) [(2, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((63 : Rat) / 4) [(9, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 731 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0731_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0731
        rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 =
      rs_R009_ueqv_R009NYYYY_partial_10_0731 := by
  native_decide

/-- Coefficient term 732 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0732 : Poly :=
[
  term ((440 : Rat) / 87) [(9, 1), (12, 1), (13, 1), (15, 4)]
]

/-- Partial product 732 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0732 : Poly :=
[
  term ((880 : Rat) / 87) [(2, 1), (9, 1), (12, 1), (13, 1), (15, 4)],
  term ((-440 : Rat) / 87) [(9, 1), (12, 1), (13, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 732 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0732_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0732
        rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 =
      rs_R009_ueqv_R009NYYYY_partial_10_0732 := by
  native_decide

/-- Coefficient term 733 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0733 : Poly :=
[
  term ((-5 : Rat) / 2) [(9, 1), (12, 1), (13, 2), (15, 1)]
]

/-- Partial product 733 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0733 : Poly :=
[
  term (-5 : Rat) [(2, 1), (9, 1), (12, 1), (13, 2), (15, 1)],
  term ((5 : Rat) / 2) [(9, 1), (12, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 733 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0733_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0733
        rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 =
      rs_R009_ueqv_R009NYYYY_partial_10_0733 := by
  native_decide

/-- Coefficient term 734 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0734 : Poly :=
[
  term ((-80 : Rat) / 29) [(9, 1), (12, 1), (13, 2), (15, 3)]
]

/-- Partial product 734 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0734 : Poly :=
[
  term ((-160 : Rat) / 29) [(2, 1), (9, 1), (12, 1), (13, 2), (15, 3)],
  term ((80 : Rat) / 29) [(9, 1), (12, 1), (13, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 734 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0734_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0734
        rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 =
      rs_R009_ueqv_R009NYYYY_partial_10_0734 := by
  native_decide

/-- Coefficient term 735 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0735 : Poly :=
[
  term ((-1951 : Rat) / 696) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 735 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0735 : Poly :=
[
  term ((-1951 : Rat) / 348) [(2, 1), (9, 1), (12, 1), (15, 1)],
  term ((1951 : Rat) / 696) [(9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 735 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0735_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0735
        rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 =
      rs_R009_ueqv_R009NYYYY_partial_10_0735 := by
  native_decide

/-- Coefficient term 736 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0736 : Poly :=
[
  term ((1045 : Rat) / 174) [(9, 1), (12, 1), (15, 3)]
]

/-- Partial product 736 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0736 : Poly :=
[
  term ((1045 : Rat) / 87) [(2, 1), (9, 1), (12, 1), (15, 3)],
  term ((-1045 : Rat) / 174) [(9, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 736 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0736_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0736
        rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 =
      rs_R009_ueqv_R009NYYYY_partial_10_0736 := by
  native_decide

/-- Coefficient term 737 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0737 : Poly :=
[
  term ((5 : Rat) / 4) [(9, 1), (12, 2), (13, 1)]
]

/-- Partial product 737 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0737 : Poly :=
[
  term ((5 : Rat) / 2) [(2, 1), (9, 1), (12, 2), (13, 1)],
  term ((-5 : Rat) / 4) [(9, 1), (12, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 737 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0737_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0737
        rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 =
      rs_R009_ueqv_R009NYYYY_partial_10_0737 := by
  native_decide

/-- Coefficient term 738 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0738 : Poly :=
[
  term ((40 : Rat) / 29) [(9, 1), (12, 2), (13, 1), (15, 2)]
]

/-- Partial product 738 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0738 : Poly :=
[
  term ((80 : Rat) / 29) [(2, 1), (9, 1), (12, 2), (13, 1), (15, 2)],
  term ((-40 : Rat) / 29) [(9, 1), (12, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 738 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0738_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0738
        rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 =
      rs_R009_ueqv_R009NYYYY_partial_10_0738 := by
  native_decide

/-- Coefficient term 739 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0739 : Poly :=
[
  term ((13 : Rat) / 4) [(9, 1), (12, 2), (15, 1)]
]

/-- Partial product 739 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0739 : Poly :=
[
  term ((13 : Rat) / 2) [(2, 1), (9, 1), (12, 2), (15, 1)],
  term ((-13 : Rat) / 4) [(9, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 739 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0739_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0739
        rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 =
      rs_R009_ueqv_R009NYYYY_partial_10_0739 := by
  native_decide

/-- Coefficient term 740 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0740 : Poly :=
[
  term ((40 : Rat) / 29) [(9, 1), (12, 2), (15, 3)]
]

/-- Partial product 740 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0740 : Poly :=
[
  term ((80 : Rat) / 29) [(2, 1), (9, 1), (12, 2), (15, 3)],
  term ((-40 : Rat) / 29) [(9, 1), (12, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 740 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0740_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0740
        rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 =
      rs_R009_ueqv_R009NYYYY_partial_10_0740 := by
  native_decide

/-- Coefficient term 741 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0741 : Poly :=
[
  term ((35 : Rat) / 48) [(9, 1), (13, 1)]
]

/-- Partial product 741 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0741 : Poly :=
[
  term ((35 : Rat) / 24) [(2, 1), (9, 1), (13, 1)],
  term ((-35 : Rat) / 48) [(9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 741 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0741_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0741
        rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 =
      rs_R009_ueqv_R009NYYYY_partial_10_0741 := by
  native_decide

/-- Coefficient term 742 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0742 : Poly :=
[
  term ((-95 : Rat) / 348) [(9, 1), (13, 1), (15, 2)]
]

/-- Partial product 742 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0742 : Poly :=
[
  term ((-95 : Rat) / 174) [(2, 1), (9, 1), (13, 1), (15, 2)],
  term ((95 : Rat) / 348) [(9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 742 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0742_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0742
        rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 =
      rs_R009_ueqv_R009NYYYY_partial_10_0742 := by
  native_decide

/-- Coefficient term 743 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0743 : Poly :=
[
  term ((-40 : Rat) / 87) [(9, 1), (13, 1), (15, 4)]
]

/-- Partial product 743 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0743 : Poly :=
[
  term ((-80 : Rat) / 87) [(2, 1), (9, 1), (13, 1), (15, 4)],
  term ((40 : Rat) / 87) [(9, 1), (13, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 743 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0743_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0743
        rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 =
      rs_R009_ueqv_R009NYYYY_partial_10_0743 := by
  native_decide

/-- Coefficient term 744 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0744 : Poly :=
[
  term ((3197 : Rat) / 696) [(9, 1), (13, 2), (15, 1)]
]

/-- Partial product 744 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0744 : Poly :=
[
  term ((3197 : Rat) / 348) [(2, 1), (9, 1), (13, 2), (15, 1)],
  term ((-3197 : Rat) / 696) [(9, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 744 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0744_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0744
        rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 =
      rs_R009_ueqv_R009NYYYY_partial_10_0744 := by
  native_decide

/-- Coefficient term 745 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0745 : Poly :=
[
  term ((-140 : Rat) / 87) [(9, 1), (13, 2), (15, 3)]
]

/-- Partial product 745 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0745 : Poly :=
[
  term ((-280 : Rat) / 87) [(2, 1), (9, 1), (13, 2), (15, 3)],
  term ((140 : Rat) / 87) [(9, 1), (13, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 745 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0745_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0745
        rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 =
      rs_R009_ueqv_R009NYYYY_partial_10_0745 := by
  native_decide

/-- Coefficient term 746 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0746 : Poly :=
[
  term ((1793 : Rat) / 2784) [(9, 1), (15, 1)]
]

/-- Partial product 746 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0746 : Poly :=
[
  term ((1793 : Rat) / 1392) [(2, 1), (9, 1), (15, 1)],
  term ((-1793 : Rat) / 2784) [(9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 746 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0746_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0746
        rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 =
      rs_R009_ueqv_R009NYYYY_partial_10_0746 := by
  native_decide

/-- Coefficient term 747 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0747 : Poly :=
[
  term ((793 : Rat) / 696) [(9, 1), (15, 3)]
]

/-- Partial product 747 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0747 : Poly :=
[
  term ((793 : Rat) / 348) [(2, 1), (9, 1), (15, 3)],
  term ((-793 : Rat) / 696) [(9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 747 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0747_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0747
        rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 =
      rs_R009_ueqv_R009NYYYY_partial_10_0747 := by
  native_decide

/-- Coefficient term 748 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0748 : Poly :=
[
  term ((6232083792 : Rat) / 33189485) [(10, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 748 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0748 : Poly :=
[
  term ((12464167584 : Rat) / 33189485) [(2, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-6232083792 : Rat) / 33189485) [(10, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 748 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0748_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0748
        rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 =
      rs_R009_ueqv_R009NYYYY_partial_10_0748 := by
  native_decide

/-- Coefficient term 749 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0749 : Poly :=
[
  term ((-1183488 : Rat) / 32699) [(10, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 749 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0749 : Poly :=
[
  term ((-2366976 : Rat) / 32699) [(2, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1183488 : Rat) / 32699) [(10, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 749 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0749_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0749
        rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 =
      rs_R009_ueqv_R009NYYYY_partial_10_0749 := by
  native_decide

/-- Coefficient term 750 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0750 : Poly :=
[
  term ((-10324795536 : Rat) / 33189485) [(10, 1), (11, 1), (12, 1), (15, 3)]
]

/-- Partial product 750 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0750 : Poly :=
[
  term ((-20649591072 : Rat) / 33189485) [(2, 1), (10, 1), (11, 1), (12, 1), (15, 3)],
  term ((10324795536 : Rat) / 33189485) [(10, 1), (11, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 750 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0750_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0750
        rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 =
      rs_R009_ueqv_R009NYYYY_partial_10_0750 := by
  native_decide

/-- Coefficient term 751 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0751 : Poly :=
[
  term ((1960704 : Rat) / 32699) [(10, 1), (11, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 751 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0751 : Poly :=
[
  term ((3921408 : Rat) / 32699) [(2, 1), (10, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-1960704 : Rat) / 32699) [(10, 1), (11, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 751 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0751_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0751
        rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 =
      rs_R009_ueqv_R009NYYYY_partial_10_0751 := by
  native_decide

/-- Coefficient term 752 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0752 : Poly :=
[
  term ((5162397768 : Rat) / 33189485) [(10, 1), (11, 1), (13, 1), (15, 2)]
]

/-- Partial product 752 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0752 : Poly :=
[
  term ((10324795536 : Rat) / 33189485) [(2, 1), (10, 1), (11, 1), (13, 1), (15, 2)],
  term ((-5162397768 : Rat) / 33189485) [(10, 1), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 752 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0752_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0752
        rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 =
      rs_R009_ueqv_R009NYYYY_partial_10_0752 := by
  native_decide

/-- Coefficient term 753 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0753 : Poly :=
[
  term ((-980352 : Rat) / 32699) [(10, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 753 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0753 : Poly :=
[
  term ((-1960704 : Rat) / 32699) [(2, 1), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((980352 : Rat) / 32699) [(10, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 753 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0753_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0753
        rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 =
      rs_R009_ueqv_R009NYYYY_partial_10_0753 := by
  native_decide

/-- Coefficient term 754 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0754 : Poly :=
[
  term ((-62010784 : Rat) / 33189485) [(10, 1), (11, 1), (15, 1)]
]

/-- Partial product 754 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0754 : Poly :=
[
  term ((-124021568 : Rat) / 33189485) [(2, 1), (10, 1), (11, 1), (15, 1)],
  term ((62010784 : Rat) / 33189485) [(10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 754 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0754_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0754
        rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 =
      rs_R009_ueqv_R009NYYYY_partial_10_0754 := by
  native_decide

/-- Coefficient term 755 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0755 : Poly :=
[
  term ((11776 : Rat) / 32699) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 755 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0755 : Poly :=
[
  term ((23552 : Rat) / 32699) [(2, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-11776 : Rat) / 32699) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 755 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0755_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0755
        rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 =
      rs_R009_ueqv_R009NYYYY_partial_10_0755 := by
  native_decide

/-- Coefficient term 756 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0756 : Poly :=
[
  term ((3844668608 : Rat) / 33189485) [(10, 1), (11, 1), (15, 3)]
]

/-- Partial product 756 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0756 : Poly :=
[
  term ((7689337216 : Rat) / 33189485) [(2, 1), (10, 1), (11, 1), (15, 3)],
  term ((-3844668608 : Rat) / 33189485) [(10, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 756 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0756_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0756
        rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 =
      rs_R009_ueqv_R009NYYYY_partial_10_0756 := by
  native_decide

/-- Coefficient term 757 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0757 : Poly :=
[
  term ((-730112 : Rat) / 32699) [(10, 1), (11, 1), (15, 3), (16, 1)]
]

/-- Partial product 757 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0757 : Poly :=
[
  term ((-1460224 : Rat) / 32699) [(2, 1), (10, 1), (11, 1), (15, 3), (16, 1)],
  term ((730112 : Rat) / 32699) [(10, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 757 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0757_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0757
        rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 =
      rs_R009_ueqv_R009NYYYY_partial_10_0757 := by
  native_decide

/-- Coefficient term 758 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0758 : Poly :=
[
  term ((-31005392 : Rat) / 33189485) [(10, 1), (11, 2), (13, 1), (15, 1)]
]

/-- Partial product 758 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0758 : Poly :=
[
  term ((-62010784 : Rat) / 33189485) [(2, 1), (10, 1), (11, 2), (13, 1), (15, 1)],
  term ((31005392 : Rat) / 33189485) [(10, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 758 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0758_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0758
        rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 =
      rs_R009_ueqv_R009NYYYY_partial_10_0758 := by
  native_decide

/-- Coefficient term 759 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0759 : Poly :=
[
  term ((5888 : Rat) / 32699) [(10, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 759 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0759 : Poly :=
[
  term ((11776 : Rat) / 32699) [(2, 1), (10, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-5888 : Rat) / 32699) [(10, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 759 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0759_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0759
        rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 =
      rs_R009_ueqv_R009NYYYY_partial_10_0759 := by
  native_decide

/-- Coefficient term 760 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0760 : Poly :=
[
  term ((15502696 : Rat) / 33189485) [(10, 1), (11, 2), (15, 2)]
]

/-- Partial product 760 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0760 : Poly :=
[
  term ((31005392 : Rat) / 33189485) [(2, 1), (10, 1), (11, 2), (15, 2)],
  term ((-15502696 : Rat) / 33189485) [(10, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 760 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0760_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0760
        rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 =
      rs_R009_ueqv_R009NYYYY_partial_10_0760 := by
  native_decide

/-- Coefficient term 761 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0761 : Poly :=
[
  term ((-2944 : Rat) / 32699) [(10, 1), (11, 2), (15, 2), (16, 1)]
]

/-- Partial product 761 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0761 : Poly :=
[
  term ((-5888 : Rat) / 32699) [(2, 1), (10, 1), (11, 2), (15, 2), (16, 1)],
  term ((2944 : Rat) / 32699) [(10, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 761 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0761_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0761
        rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 =
      rs_R009_ueqv_R009NYYYY_partial_10_0761 := by
  native_decide

/-- Coefficient term 762 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0762 : Poly :=
[
  term ((17939286324 : Rat) / 33189485) [(10, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 762 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0762 : Poly :=
[
  term ((35878572648 : Rat) / 33189485) [(2, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-17939286324 : Rat) / 33189485) [(10, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 762 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0762_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0762
        rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 =
      rs_R009_ueqv_R009NYYYY_partial_10_0762 := by
  native_decide

/-- Coefficient term 763 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0763 : Poly :=
[
  term ((-3431160 : Rat) / 32699) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 763 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0763 : Poly :=
[
  term ((-6862320 : Rat) / 32699) [(2, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((3431160 : Rat) / 32699) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 763 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0763_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0763
        rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 =
      rs_R009_ueqv_R009NYYYY_partial_10_0763 := by
  native_decide

/-- Coefficient term 764 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0764 : Poly :=
[
  term ((-35878572648 : Rat) / 33189485) [(10, 1), (12, 1), (13, 1), (15, 3)]
]

/-- Partial product 764 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0764 : Poly :=
[
  term ((-71757145296 : Rat) / 33189485) [(2, 1), (10, 1), (12, 1), (13, 1), (15, 3)],
  term ((35878572648 : Rat) / 33189485) [(10, 1), (12, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 764 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0764_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0764
        rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 =
      rs_R009_ueqv_R009NYYYY_partial_10_0764 := by
  native_decide

/-- Coefficient term 765 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0765 : Poly :=
[
  term ((6862320 : Rat) / 32699) [(10, 1), (12, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 765 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0765 : Poly :=
[
  term ((13724640 : Rat) / 32699) [(2, 1), (10, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-6862320 : Rat) / 32699) [(10, 1), (12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 765 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0765_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0765
        rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 =
      rs_R009_ueqv_R009NYYYY_partial_10_0765 := by
  native_decide

/-- Coefficient term 766 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0766 : Poly :=
[
  term ((5533809065 : Rat) / 19913691) [(10, 1), (12, 1), (15, 2)]
]

/-- Partial product 766 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0766 : Poly :=
[
  term ((11067618130 : Rat) / 19913691) [(2, 1), (10, 1), (12, 1), (15, 2)],
  term ((-5533809065 : Rat) / 19913691) [(10, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 766 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0766_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0766
        rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 =
      rs_R009_ueqv_R009NYYYY_partial_10_0766 := by
  native_decide

/-- Coefficient term 767 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0767 : Poly :=
[
  term ((-5241727 : Rat) / 98097) [(10, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 767 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0767 : Poly :=
[
  term ((-10483454 : Rat) / 98097) [(2, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((5241727 : Rat) / 98097) [(10, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 767 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0767_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0767
        rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 =
      rs_R009_ueqv_R009NYYYY_partial_10_0767 := by
  native_decide

/-- Coefficient term 768 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0768 : Poly :=
[
  term ((-3654299066 : Rat) / 33189485) [(10, 1), (12, 1), (15, 4)]
]

/-- Partial product 768 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0768 : Poly :=
[
  term ((-7308598132 : Rat) / 33189485) [(2, 1), (10, 1), (12, 1), (15, 4)],
  term ((3654299066 : Rat) / 33189485) [(10, 1), (12, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 768 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0768_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0768
        rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 =
      rs_R009_ueqv_R009NYYYY_partial_10_0768 := by
  native_decide

/-- Coefficient term 769 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0769 : Poly :=
[
  term ((698940 : Rat) / 32699) [(10, 1), (12, 1), (15, 4), (16, 1)]
]

/-- Partial product 769 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0769 : Poly :=
[
  term ((1397880 : Rat) / 32699) [(2, 1), (10, 1), (12, 1), (15, 4), (16, 1)],
  term ((-698940 : Rat) / 32699) [(10, 1), (12, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 769 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0769_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0769
        rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 =
      rs_R009_ueqv_R009NYYYY_partial_10_0769 := by
  native_decide

/-- Coefficient term 770 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0770 : Poly :=
[
  term ((-3986508072 : Rat) / 33189485) [(10, 1), (12, 2), (13, 1), (15, 1)]
]

/-- Partial product 770 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0770 : Poly :=
[
  term ((-7973016144 : Rat) / 33189485) [(2, 1), (10, 1), (12, 2), (13, 1), (15, 1)],
  term ((3986508072 : Rat) / 33189485) [(10, 1), (12, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 770 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0770_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0770
        rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 =
      rs_R009_ueqv_R009NYYYY_partial_10_0770 := by
  native_decide

/-- Coefficient term 771 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0771 : Poly :=
[
  term ((762480 : Rat) / 32699) [(10, 1), (12, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 771 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0771 : Poly :=
[
  term ((1524960 : Rat) / 32699) [(2, 1), (10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-762480 : Rat) / 32699) [(10, 1), (12, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 771 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0771_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0771
        rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 =
      rs_R009_ueqv_R009NYYYY_partial_10_0771 := by
  native_decide

/-- Coefficient term 772 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0772 : Poly :=
[
  term ((-996627018 : Rat) / 1746815) [(10, 1), (12, 2), (15, 2)]
]

/-- Partial product 772 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0772 : Poly :=
[
  term ((-1993254036 : Rat) / 1746815) [(2, 1), (10, 1), (12, 2), (15, 2)],
  term ((996627018 : Rat) / 1746815) [(10, 1), (12, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 772 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0772_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0772
        rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 =
      rs_R009_ueqv_R009NYYYY_partial_10_0772 := by
  native_decide

/-- Coefficient term 773 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0773 : Poly :=
[
  term ((190620 : Rat) / 1721) [(10, 1), (12, 2), (15, 2), (16, 1)]
]

/-- Partial product 773 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0773 : Poly :=
[
  term ((381240 : Rat) / 1721) [(2, 1), (10, 1), (12, 2), (15, 2), (16, 1)],
  term ((-190620 : Rat) / 1721) [(10, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 773 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0773_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0773
        rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 =
      rs_R009_ueqv_R009NYYYY_partial_10_0773 := by
  native_decide

/-- Coefficient term 774 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0774 : Poly :=
[
  term ((-15069491621 : Rat) / 99568455) [(10, 1), (13, 1), (15, 1)]
]

/-- Partial product 774 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0774 : Poly :=
[
  term ((-30138983242 : Rat) / 99568455) [(2, 1), (10, 1), (13, 1), (15, 1)],
  term ((15069491621 : Rat) / 99568455) [(10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 774 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0774_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0774
        rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 =
      rs_R009_ueqv_R009NYYYY_partial_10_0774 := by
  native_decide

/-- Coefficient term 775 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0775 : Poly :=
[
  term ((2858219 : Rat) / 98097) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 775 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0775 : Poly :=
[
  term ((5716438 : Rat) / 98097) [(2, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2858219 : Rat) / 98097) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 775 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0775_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0775
        rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 =
      rs_R009_ueqv_R009NYYYY_partial_10_0775 := by
  native_decide

/-- Coefficient term 776 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0776 : Poly :=
[
  term ((664418012 : Rat) / 6637897) [(10, 1), (13, 1), (15, 3)]
]

/-- Partial product 776 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0776 : Poly :=
[
  term ((1328836024 : Rat) / 6637897) [(2, 1), (10, 1), (13, 1), (15, 3)],
  term ((-664418012 : Rat) / 6637897) [(10, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 776 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0776_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0776
        rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 =
      rs_R009_ueqv_R009NYYYY_partial_10_0776 := by
  native_decide

/-- Coefficient term 777 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0777 : Poly :=
[
  term ((-635400 : Rat) / 32699) [(10, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 777 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0777 : Poly :=
[
  term ((-1270800 : Rat) / 32699) [(2, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((635400 : Rat) / 32699) [(10, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 777 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0777_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0777
        rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 =
      rs_R009_ueqv_R009NYYYY_partial_10_0777 := by
  native_decide

/-- Coefficient term 778 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0778 : Poly :=
[
  term ((996627018 : Rat) / 1746815) [(10, 1), (13, 2), (15, 2)]
]

/-- Partial product 778 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0778 : Poly :=
[
  term ((1993254036 : Rat) / 1746815) [(2, 1), (10, 1), (13, 2), (15, 2)],
  term ((-996627018 : Rat) / 1746815) [(10, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 778 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0778_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0778
        rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 =
      rs_R009_ueqv_R009NYYYY_partial_10_0778 := by
  native_decide

/-- Coefficient term 779 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0779 : Poly :=
[
  term ((-190620 : Rat) / 1721) [(10, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 779 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0779 : Poly :=
[
  term ((-381240 : Rat) / 1721) [(2, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((190620 : Rat) / 1721) [(10, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 779 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0779_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0779
        rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 =
      rs_R009_ueqv_R009NYYYY_partial_10_0779 := by
  native_decide

/-- Coefficient term 780 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0780 : Poly :=
[
  term ((3986508072 : Rat) / 33189485) [(10, 1), (13, 3), (15, 1)]
]

/-- Partial product 780 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0780 : Poly :=
[
  term ((7973016144 : Rat) / 33189485) [(2, 1), (10, 1), (13, 3), (15, 1)],
  term ((-3986508072 : Rat) / 33189485) [(10, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 780 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0780_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0780
        rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 =
      rs_R009_ueqv_R009NYYYY_partial_10_0780 := by
  native_decide

/-- Coefficient term 781 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0781 : Poly :=
[
  term ((-762480 : Rat) / 32699) [(10, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 781 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0781 : Poly :=
[
  term ((-1524960 : Rat) / 32699) [(2, 1), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((762480 : Rat) / 32699) [(10, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 781 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0781_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0781
        rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 =
      rs_R009_ueqv_R009NYYYY_partial_10_0781 := by
  native_decide

/-- Coefficient term 782 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0782 : Poly :=
[
  term ((-16342892113 : Rat) / 106206352) [(10, 1), (15, 2)]
]

/-- Partial product 782 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0782 : Poly :=
[
  term ((-16342892113 : Rat) / 53103176) [(2, 1), (10, 1), (15, 2)],
  term ((16342892113 : Rat) / 106206352) [(10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 782 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0782_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0782
        rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 =
      rs_R009_ueqv_R009NYYYY_partial_10_0782 := by
  native_decide

/-- Coefficient term 783 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0783 : Poly :=
[
  term ((3889409 : Rat) / 130796) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 783 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0783 : Poly :=
[
  term ((3889409 : Rat) / 65398) [(2, 1), (10, 1), (15, 2), (16, 1)],
  term ((-3889409 : Rat) / 130796) [(10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 783 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0783_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0783
        rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 =
      rs_R009_ueqv_R009NYYYY_partial_10_0783 := by
  native_decide

/-- Coefficient term 784 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0784 : Poly :=
[
  term ((166104503 : Rat) / 13275794) [(10, 1), (15, 4)]
]

/-- Partial product 784 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0784 : Poly :=
[
  term ((166104503 : Rat) / 6637897) [(2, 1), (10, 1), (15, 4)],
  term ((-166104503 : Rat) / 13275794) [(10, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 784 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0784_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0784
        rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 =
      rs_R009_ueqv_R009NYYYY_partial_10_0784 := by
  native_decide

/-- Coefficient term 785 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0785 : Poly :=
[
  term ((-79425 : Rat) / 32699) [(10, 1), (15, 4), (16, 1)]
]

/-- Partial product 785 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0785 : Poly :=
[
  term ((-158850 : Rat) / 32699) [(2, 1), (10, 1), (15, 4), (16, 1)],
  term ((79425 : Rat) / 32699) [(10, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 785 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0785_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0785
        rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 =
      rs_R009_ueqv_R009NYYYY_partial_10_0785 := by
  native_decide

/-- Coefficient term 786 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0786 : Poly :=
[
  term ((-64891722351 : Rat) / 33189485) [(11, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 786 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0786 : Poly :=
[
  term ((-129783444702 : Rat) / 33189485) [(2, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((64891722351 : Rat) / 33189485) [(11, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 786 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0786_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0786
        rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 =
      rs_R009_ueqv_R009NYYYY_partial_10_0786 := by
  native_decide

/-- Coefficient term 787 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0787 : Poly :=
[
  term ((12465588 : Rat) / 32699) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 787 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0787 : Poly :=
[
  term ((24931176 : Rat) / 32699) [(2, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-12465588 : Rat) / 32699) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 787 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0787_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0787
        rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 =
      rs_R009_ueqv_R009NYYYY_partial_10_0787 := by
  native_decide

/-- Coefficient term 788 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0788 : Poly :=
[
  term ((-10658103500 : Rat) / 6637897) [(11, 1), (12, 1), (13, 1), (15, 4)]
]

/-- Partial product 788 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0788 : Poly :=
[
  term ((-21316207000 : Rat) / 6637897) [(2, 1), (11, 1), (12, 1), (13, 1), (15, 4)],
  term ((10658103500 : Rat) / 6637897) [(11, 1), (12, 1), (13, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 788 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0788_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0788
        rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 =
      rs_R009_ueqv_R009NYYYY_partial_10_0788 := by
  native_decide

/-- Coefficient term 789 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0789 : Poly :=
[
  term ((10120000 : Rat) / 32699) [(11, 1), (12, 1), (13, 1), (15, 4), (16, 1)]
]

/-- Partial product 789 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0789 : Poly :=
[
  term ((20240000 : Rat) / 32699) [(2, 1), (11, 1), (12, 1), (13, 1), (15, 4), (16, 1)],
  term ((-10120000 : Rat) / 32699) [(11, 1), (12, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 789 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0789_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0789
        rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 =
      rs_R009_ueqv_R009NYYYY_partial_10_0789 := by
  native_decide

/-- Coefficient term 790 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0790 : Poly :=
[
  term ((5813511000 : Rat) / 6637897) [(11, 1), (12, 1), (13, 2), (15, 3)]
]

/-- Partial product 790 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0790 : Poly :=
[
  term ((11627022000 : Rat) / 6637897) [(2, 1), (11, 1), (12, 1), (13, 2), (15, 3)],
  term ((-5813511000 : Rat) / 6637897) [(11, 1), (12, 1), (13, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 790 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0790_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0790
        rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 =
      rs_R009_ueqv_R009NYYYY_partial_10_0790 := by
  native_decide

/-- Coefficient term 791 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0791 : Poly :=
[
  term ((-5520000 : Rat) / 32699) [(11, 1), (12, 1), (13, 2), (15, 3), (16, 1)]
]

/-- Partial product 791 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0791 : Poly :=
[
  term ((-11040000 : Rat) / 32699) [(2, 1), (11, 1), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((5520000 : Rat) / 32699) [(11, 1), (12, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 791 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0791_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0791
        rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 =
      rs_R009_ueqv_R009NYYYY_partial_10_0791 := by
  native_decide

/-- Coefficient term 792 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0792 : Poly :=
[
  term ((-12592246549 : Rat) / 56896260) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 792 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0792 : Poly :=
[
  term ((-12592246549 : Rat) / 28448130) [(2, 1), (11, 1), (12, 1), (15, 1)],
  term ((12592246549 : Rat) / 56896260) [(11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 792 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0792_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0792
        rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 =
      rs_R009_ueqv_R009NYYYY_partial_10_0792 := by
  native_decide

/-- Coefficient term 793 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0793 : Poly :=
[
  term ((4245724 : Rat) / 98097) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 793 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0793 : Poly :=
[
  term ((8491448 : Rat) / 98097) [(2, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4245724 : Rat) / 98097) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 793 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0793_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0793
        rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 =
      rs_R009_ueqv_R009NYYYY_partial_10_0793 := by
  native_decide

/-- Coefficient term 794 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0794 : Poly :=
[
  term ((5103808439 : Rat) / 6637897) [(11, 1), (12, 1), (15, 3)]
]

/-- Partial product 794 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0794 : Poly :=
[
  term ((10207616878 : Rat) / 6637897) [(2, 1), (11, 1), (12, 1), (15, 3)],
  term ((-5103808439 : Rat) / 6637897) [(11, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 794 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0794_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0794
        rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 =
      rs_R009_ueqv_R009NYYYY_partial_10_0794 := by
  native_decide

/-- Coefficient term 795 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0795 : Poly :=
[
  term ((-4834390 : Rat) / 32699) [(11, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 795 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0795 : Poly :=
[
  term ((-9668780 : Rat) / 32699) [(2, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((4834390 : Rat) / 32699) [(11, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 795 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0795_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0795
        rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 =
      rs_R009_ueqv_R009NYYYY_partial_10_0795 := by
  native_decide

/-- Coefficient term 796 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0796 : Poly :=
[
  term ((-2906755500 : Rat) / 6637897) [(11, 1), (12, 2), (13, 1), (15, 2)]
]

/-- Partial product 796 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0796 : Poly :=
[
  term ((-5813511000 : Rat) / 6637897) [(2, 1), (11, 1), (12, 2), (13, 1), (15, 2)],
  term ((2906755500 : Rat) / 6637897) [(11, 1), (12, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 796 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0796_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0796
        rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 =
      rs_R009_ueqv_R009NYYYY_partial_10_0796 := by
  native_decide

/-- Coefficient term 797 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0797 : Poly :=
[
  term ((2760000 : Rat) / 32699) [(11, 1), (12, 2), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 797 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0797 : Poly :=
[
  term ((5520000 : Rat) / 32699) [(2, 1), (11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-2760000 : Rat) / 32699) [(11, 1), (12, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 797 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0797_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0797
        rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 =
      rs_R009_ueqv_R009NYYYY_partial_10_0797 := by
  native_decide

/-- Coefficient term 798 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0798 : Poly :=
[
  term ((15534102733 : Rat) / 33189485) [(11, 1), (12, 2), (15, 1)]
]

/-- Partial product 798 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0798 : Poly :=
[
  term ((31068205466 : Rat) / 33189485) [(2, 1), (11, 1), (12, 2), (15, 1)],
  term ((-15534102733 : Rat) / 33189485) [(11, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 798 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0798_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0798
        rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 =
      rs_R009_ueqv_R009NYYYY_partial_10_0798 := by
  native_decide

/-- Coefficient term 799 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0799 : Poly :=
[
  term ((-2984994 : Rat) / 32699) [(11, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 799 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0799 : Poly :=
[
  term ((-5969988 : Rat) / 32699) [(2, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((2984994 : Rat) / 32699) [(11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 799 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0799_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0799
        rs_R009_ueqv_R009NYYYY_generator_10_0700_0799 =
      rs_R009_ueqv_R009NYYYY_partial_10_0799 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NYYYY_partials_10_0700_0799 : List Poly :=
[
  rs_R009_ueqv_R009NYYYY_partial_10_0700,
  rs_R009_ueqv_R009NYYYY_partial_10_0701,
  rs_R009_ueqv_R009NYYYY_partial_10_0702,
  rs_R009_ueqv_R009NYYYY_partial_10_0703,
  rs_R009_ueqv_R009NYYYY_partial_10_0704,
  rs_R009_ueqv_R009NYYYY_partial_10_0705,
  rs_R009_ueqv_R009NYYYY_partial_10_0706,
  rs_R009_ueqv_R009NYYYY_partial_10_0707,
  rs_R009_ueqv_R009NYYYY_partial_10_0708,
  rs_R009_ueqv_R009NYYYY_partial_10_0709,
  rs_R009_ueqv_R009NYYYY_partial_10_0710,
  rs_R009_ueqv_R009NYYYY_partial_10_0711,
  rs_R009_ueqv_R009NYYYY_partial_10_0712,
  rs_R009_ueqv_R009NYYYY_partial_10_0713,
  rs_R009_ueqv_R009NYYYY_partial_10_0714,
  rs_R009_ueqv_R009NYYYY_partial_10_0715,
  rs_R009_ueqv_R009NYYYY_partial_10_0716,
  rs_R009_ueqv_R009NYYYY_partial_10_0717,
  rs_R009_ueqv_R009NYYYY_partial_10_0718,
  rs_R009_ueqv_R009NYYYY_partial_10_0719,
  rs_R009_ueqv_R009NYYYY_partial_10_0720,
  rs_R009_ueqv_R009NYYYY_partial_10_0721,
  rs_R009_ueqv_R009NYYYY_partial_10_0722,
  rs_R009_ueqv_R009NYYYY_partial_10_0723,
  rs_R009_ueqv_R009NYYYY_partial_10_0724,
  rs_R009_ueqv_R009NYYYY_partial_10_0725,
  rs_R009_ueqv_R009NYYYY_partial_10_0726,
  rs_R009_ueqv_R009NYYYY_partial_10_0727,
  rs_R009_ueqv_R009NYYYY_partial_10_0728,
  rs_R009_ueqv_R009NYYYY_partial_10_0729,
  rs_R009_ueqv_R009NYYYY_partial_10_0730,
  rs_R009_ueqv_R009NYYYY_partial_10_0731,
  rs_R009_ueqv_R009NYYYY_partial_10_0732,
  rs_R009_ueqv_R009NYYYY_partial_10_0733,
  rs_R009_ueqv_R009NYYYY_partial_10_0734,
  rs_R009_ueqv_R009NYYYY_partial_10_0735,
  rs_R009_ueqv_R009NYYYY_partial_10_0736,
  rs_R009_ueqv_R009NYYYY_partial_10_0737,
  rs_R009_ueqv_R009NYYYY_partial_10_0738,
  rs_R009_ueqv_R009NYYYY_partial_10_0739,
  rs_R009_ueqv_R009NYYYY_partial_10_0740,
  rs_R009_ueqv_R009NYYYY_partial_10_0741,
  rs_R009_ueqv_R009NYYYY_partial_10_0742,
  rs_R009_ueqv_R009NYYYY_partial_10_0743,
  rs_R009_ueqv_R009NYYYY_partial_10_0744,
  rs_R009_ueqv_R009NYYYY_partial_10_0745,
  rs_R009_ueqv_R009NYYYY_partial_10_0746,
  rs_R009_ueqv_R009NYYYY_partial_10_0747,
  rs_R009_ueqv_R009NYYYY_partial_10_0748,
  rs_R009_ueqv_R009NYYYY_partial_10_0749,
  rs_R009_ueqv_R009NYYYY_partial_10_0750,
  rs_R009_ueqv_R009NYYYY_partial_10_0751,
  rs_R009_ueqv_R009NYYYY_partial_10_0752,
  rs_R009_ueqv_R009NYYYY_partial_10_0753,
  rs_R009_ueqv_R009NYYYY_partial_10_0754,
  rs_R009_ueqv_R009NYYYY_partial_10_0755,
  rs_R009_ueqv_R009NYYYY_partial_10_0756,
  rs_R009_ueqv_R009NYYYY_partial_10_0757,
  rs_R009_ueqv_R009NYYYY_partial_10_0758,
  rs_R009_ueqv_R009NYYYY_partial_10_0759,
  rs_R009_ueqv_R009NYYYY_partial_10_0760,
  rs_R009_ueqv_R009NYYYY_partial_10_0761,
  rs_R009_ueqv_R009NYYYY_partial_10_0762,
  rs_R009_ueqv_R009NYYYY_partial_10_0763,
  rs_R009_ueqv_R009NYYYY_partial_10_0764,
  rs_R009_ueqv_R009NYYYY_partial_10_0765,
  rs_R009_ueqv_R009NYYYY_partial_10_0766,
  rs_R009_ueqv_R009NYYYY_partial_10_0767,
  rs_R009_ueqv_R009NYYYY_partial_10_0768,
  rs_R009_ueqv_R009NYYYY_partial_10_0769,
  rs_R009_ueqv_R009NYYYY_partial_10_0770,
  rs_R009_ueqv_R009NYYYY_partial_10_0771,
  rs_R009_ueqv_R009NYYYY_partial_10_0772,
  rs_R009_ueqv_R009NYYYY_partial_10_0773,
  rs_R009_ueqv_R009NYYYY_partial_10_0774,
  rs_R009_ueqv_R009NYYYY_partial_10_0775,
  rs_R009_ueqv_R009NYYYY_partial_10_0776,
  rs_R009_ueqv_R009NYYYY_partial_10_0777,
  rs_R009_ueqv_R009NYYYY_partial_10_0778,
  rs_R009_ueqv_R009NYYYY_partial_10_0779,
  rs_R009_ueqv_R009NYYYY_partial_10_0780,
  rs_R009_ueqv_R009NYYYY_partial_10_0781,
  rs_R009_ueqv_R009NYYYY_partial_10_0782,
  rs_R009_ueqv_R009NYYYY_partial_10_0783,
  rs_R009_ueqv_R009NYYYY_partial_10_0784,
  rs_R009_ueqv_R009NYYYY_partial_10_0785,
  rs_R009_ueqv_R009NYYYY_partial_10_0786,
  rs_R009_ueqv_R009NYYYY_partial_10_0787,
  rs_R009_ueqv_R009NYYYY_partial_10_0788,
  rs_R009_ueqv_R009NYYYY_partial_10_0789,
  rs_R009_ueqv_R009NYYYY_partial_10_0790,
  rs_R009_ueqv_R009NYYYY_partial_10_0791,
  rs_R009_ueqv_R009NYYYY_partial_10_0792,
  rs_R009_ueqv_R009NYYYY_partial_10_0793,
  rs_R009_ueqv_R009NYYYY_partial_10_0794,
  rs_R009_ueqv_R009NYYYY_partial_10_0795,
  rs_R009_ueqv_R009NYYYY_partial_10_0796,
  rs_R009_ueqv_R009NYYYY_partial_10_0797,
  rs_R009_ueqv_R009NYYYY_partial_10_0798,
  rs_R009_ueqv_R009NYYYY_partial_10_0799
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NYYYY_block_10_0700_0799 : Poly :=
[
  term ((-16789423421 : Rat) / 1593095280) [(2, 1), (8, 1), (15, 2)],
  term ((252275 : Rat) / 98097) [(2, 1), (8, 1), (15, 2), (16, 1)],
  term ((-40 : Rat) / 29) [(2, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((64 : Rat) / 29) [(2, 1), (9, 1), (10, 1), (12, 1), (15, 3)],
  term ((-32 : Rat) / 29) [(2, 1), (9, 1), (10, 1), (13, 1), (15, 2)],
  term ((-24 : Rat) / 29) [(2, 1), (9, 1), (10, 1), (15, 3)],
  term ((-155026960 : Rat) / 19913691) [(2, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((147200 : Rat) / 98097) [(2, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((7875152 : Rat) / 5240445) [(2, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 3)],
  term ((-5888 : Rat) / 5163) [(2, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-62010784 : Rat) / 6637897) [(2, 1), (9, 1), (11, 1), (12, 1), (13, 2), (15, 2)],
  term ((58880 : Rat) / 32699) [(2, 1), (9, 1), (11, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-1080702584 : Rat) / 99568455) [(2, 1), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((38272 : Rat) / 32699) [(2, 1), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((1363800416 : Rat) / 99568455) [(2, 1), (9, 1), (11, 1), (12, 1), (15, 4)],
  term ((-35328 : Rat) / 32699) [(2, 1), (9, 1), (11, 1), (12, 1), (15, 4), (16, 1)],
  term ((31005392 : Rat) / 6637897) [(2, 1), (9, 1), (11, 1), (12, 2), (13, 1), (15, 1)],
  term ((-29440 : Rat) / 32699) [(2, 1), (9, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((45654544 : Rat) / 6637897) [(2, 1), (9, 1), (11, 1), (12, 2), (15, 2)],
  term ((-29440 : Rat) / 32699) [(2, 1), (9, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((8536124 : Rat) / 2844813) [(2, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-51520 : Rat) / 98097) [(2, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-199139824 : Rat) / 33189485) [(2, 1), (9, 1), (11, 1), (13, 1), (15, 3)],
  term ((64768 : Rat) / 98097) [(2, 1), (9, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((15502696 : Rat) / 99568455) [(2, 1), (9, 1), (11, 1), (13, 2), (15, 2)],
  term ((-2944 : Rat) / 98097) [(2, 1), (9, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((244532206 : Rat) / 99568455) [(2, 1), (9, 1), (11, 1), (15, 2)],
  term ((-16928 : Rat) / 32699) [(2, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-119753848 : Rat) / 99568455) [(2, 1), (9, 1), (11, 1), (15, 4)],
  term ((2944 : Rat) / 32699) [(2, 1), (9, 1), (11, 1), (15, 4), (16, 1)],
  term ((-25 : Rat) / 6) [(2, 1), (9, 1), (12, 1), (13, 1)],
  term ((-63 : Rat) / 2) [(2, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((880 : Rat) / 87) [(2, 1), (9, 1), (12, 1), (13, 1), (15, 4)],
  term (-5 : Rat) [(2, 1), (9, 1), (12, 1), (13, 2), (15, 1)],
  term ((-160 : Rat) / 29) [(2, 1), (9, 1), (12, 1), (13, 2), (15, 3)],
  term ((-1951 : Rat) / 348) [(2, 1), (9, 1), (12, 1), (15, 1)],
  term ((1045 : Rat) / 87) [(2, 1), (9, 1), (12, 1), (15, 3)],
  term ((5 : Rat) / 2) [(2, 1), (9, 1), (12, 2), (13, 1)],
  term ((80 : Rat) / 29) [(2, 1), (9, 1), (12, 2), (13, 1), (15, 2)],
  term ((13 : Rat) / 2) [(2, 1), (9, 1), (12, 2), (15, 1)],
  term ((80 : Rat) / 29) [(2, 1), (9, 1), (12, 2), (15, 3)],
  term ((35 : Rat) / 24) [(2, 1), (9, 1), (13, 1)],
  term ((-95 : Rat) / 174) [(2, 1), (9, 1), (13, 1), (15, 2)],
  term ((-80 : Rat) / 87) [(2, 1), (9, 1), (13, 1), (15, 4)],
  term ((3197 : Rat) / 348) [(2, 1), (9, 1), (13, 2), (15, 1)],
  term ((-280 : Rat) / 87) [(2, 1), (9, 1), (13, 2), (15, 3)],
  term ((1793 : Rat) / 1392) [(2, 1), (9, 1), (15, 1)],
  term ((793 : Rat) / 348) [(2, 1), (9, 1), (15, 3)],
  term ((12464167584 : Rat) / 33189485) [(2, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-2366976 : Rat) / 32699) [(2, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-20649591072 : Rat) / 33189485) [(2, 1), (10, 1), (11, 1), (12, 1), (15, 3)],
  term ((3921408 : Rat) / 32699) [(2, 1), (10, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((10324795536 : Rat) / 33189485) [(2, 1), (10, 1), (11, 1), (13, 1), (15, 2)],
  term ((-1960704 : Rat) / 32699) [(2, 1), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-124021568 : Rat) / 33189485) [(2, 1), (10, 1), (11, 1), (15, 1)],
  term ((23552 : Rat) / 32699) [(2, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((7689337216 : Rat) / 33189485) [(2, 1), (10, 1), (11, 1), (15, 3)],
  term ((-1460224 : Rat) / 32699) [(2, 1), (10, 1), (11, 1), (15, 3), (16, 1)],
  term ((-62010784 : Rat) / 33189485) [(2, 1), (10, 1), (11, 2), (13, 1), (15, 1)],
  term ((11776 : Rat) / 32699) [(2, 1), (10, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((31005392 : Rat) / 33189485) [(2, 1), (10, 1), (11, 2), (15, 2)],
  term ((-5888 : Rat) / 32699) [(2, 1), (10, 1), (11, 2), (15, 2), (16, 1)],
  term ((35878572648 : Rat) / 33189485) [(2, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-6862320 : Rat) / 32699) [(2, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-71757145296 : Rat) / 33189485) [(2, 1), (10, 1), (12, 1), (13, 1), (15, 3)],
  term ((13724640 : Rat) / 32699) [(2, 1), (10, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((11067618130 : Rat) / 19913691) [(2, 1), (10, 1), (12, 1), (15, 2)],
  term ((-10483454 : Rat) / 98097) [(2, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-7308598132 : Rat) / 33189485) [(2, 1), (10, 1), (12, 1), (15, 4)],
  term ((1397880 : Rat) / 32699) [(2, 1), (10, 1), (12, 1), (15, 4), (16, 1)],
  term ((-7973016144 : Rat) / 33189485) [(2, 1), (10, 1), (12, 2), (13, 1), (15, 1)],
  term ((1524960 : Rat) / 32699) [(2, 1), (10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1993254036 : Rat) / 1746815) [(2, 1), (10, 1), (12, 2), (15, 2)],
  term ((381240 : Rat) / 1721) [(2, 1), (10, 1), (12, 2), (15, 2), (16, 1)],
  term ((-30138983242 : Rat) / 99568455) [(2, 1), (10, 1), (13, 1), (15, 1)],
  term ((5716438 : Rat) / 98097) [(2, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((1328836024 : Rat) / 6637897) [(2, 1), (10, 1), (13, 1), (15, 3)],
  term ((-1270800 : Rat) / 32699) [(2, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((1993254036 : Rat) / 1746815) [(2, 1), (10, 1), (13, 2), (15, 2)],
  term ((-381240 : Rat) / 1721) [(2, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((7973016144 : Rat) / 33189485) [(2, 1), (10, 1), (13, 3), (15, 1)],
  term ((-1524960 : Rat) / 32699) [(2, 1), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((-16342892113 : Rat) / 53103176) [(2, 1), (10, 1), (15, 2)],
  term ((3889409 : Rat) / 65398) [(2, 1), (10, 1), (15, 2), (16, 1)],
  term ((166104503 : Rat) / 6637897) [(2, 1), (10, 1), (15, 4)],
  term ((-158850 : Rat) / 32699) [(2, 1), (10, 1), (15, 4), (16, 1)],
  term ((-129783444702 : Rat) / 33189485) [(2, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((24931176 : Rat) / 32699) [(2, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-21316207000 : Rat) / 6637897) [(2, 1), (11, 1), (12, 1), (13, 1), (15, 4)],
  term ((20240000 : Rat) / 32699) [(2, 1), (11, 1), (12, 1), (13, 1), (15, 4), (16, 1)],
  term ((11627022000 : Rat) / 6637897) [(2, 1), (11, 1), (12, 1), (13, 2), (15, 3)],
  term ((-11040000 : Rat) / 32699) [(2, 1), (11, 1), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((-12592246549 : Rat) / 28448130) [(2, 1), (11, 1), (12, 1), (15, 1)],
  term ((8491448 : Rat) / 98097) [(2, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((10207616878 : Rat) / 6637897) [(2, 1), (11, 1), (12, 1), (15, 3)],
  term ((-9668780 : Rat) / 32699) [(2, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-5813511000 : Rat) / 6637897) [(2, 1), (11, 1), (12, 2), (13, 1), (15, 2)],
  term ((5520000 : Rat) / 32699) [(2, 1), (11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((31068205466 : Rat) / 33189485) [(2, 1), (11, 1), (12, 2), (15, 1)],
  term ((-5969988 : Rat) / 32699) [(2, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((16789423421 : Rat) / 3186190560) [(8, 1), (15, 2)],
  term ((-252275 : Rat) / 196194) [(8, 1), (15, 2), (16, 1)],
  term ((20 : Rat) / 29) [(9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-32 : Rat) / 29) [(9, 1), (10, 1), (12, 1), (15, 3)],
  term ((16 : Rat) / 29) [(9, 1), (10, 1), (13, 1), (15, 2)],
  term ((12 : Rat) / 29) [(9, 1), (10, 1), (15, 3)],
  term ((77513480 : Rat) / 19913691) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-73600 : Rat) / 98097) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3937576 : Rat) / 5240445) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 3)],
  term ((2944 : Rat) / 5163) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((31005392 : Rat) / 6637897) [(9, 1), (11, 1), (12, 1), (13, 2), (15, 2)],
  term ((-29440 : Rat) / 32699) [(9, 1), (11, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((540351292 : Rat) / 99568455) [(9, 1), (11, 1), (12, 1), (15, 2)],
  term ((-19136 : Rat) / 32699) [(9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-681900208 : Rat) / 99568455) [(9, 1), (11, 1), (12, 1), (15, 4)],
  term ((17664 : Rat) / 32699) [(9, 1), (11, 1), (12, 1), (15, 4), (16, 1)],
  term ((-15502696 : Rat) / 6637897) [(9, 1), (11, 1), (12, 2), (13, 1), (15, 1)],
  term ((14720 : Rat) / 32699) [(9, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-22827272 : Rat) / 6637897) [(9, 1), (11, 1), (12, 2), (15, 2)],
  term ((14720 : Rat) / 32699) [(9, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((-4268062 : Rat) / 2844813) [(9, 1), (11, 1), (13, 1), (15, 1)],
  term ((25760 : Rat) / 98097) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((99569912 : Rat) / 33189485) [(9, 1), (11, 1), (13, 1), (15, 3)],
  term ((-32384 : Rat) / 98097) [(9, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-7751348 : Rat) / 99568455) [(9, 1), (11, 1), (13, 2), (15, 2)],
  term ((1472 : Rat) / 98097) [(9, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-122266103 : Rat) / 99568455) [(9, 1), (11, 1), (15, 2)],
  term ((8464 : Rat) / 32699) [(9, 1), (11, 1), (15, 2), (16, 1)],
  term ((59876924 : Rat) / 99568455) [(9, 1), (11, 1), (15, 4)],
  term ((-1472 : Rat) / 32699) [(9, 1), (11, 1), (15, 4), (16, 1)],
  term ((25 : Rat) / 12) [(9, 1), (12, 1), (13, 1)],
  term ((63 : Rat) / 4) [(9, 1), (12, 1), (13, 1), (15, 2)],
  term ((-440 : Rat) / 87) [(9, 1), (12, 1), (13, 1), (15, 4)],
  term ((5 : Rat) / 2) [(9, 1), (12, 1), (13, 2), (15, 1)],
  term ((80 : Rat) / 29) [(9, 1), (12, 1), (13, 2), (15, 3)],
  term ((1951 : Rat) / 696) [(9, 1), (12, 1), (15, 1)],
  term ((-1045 : Rat) / 174) [(9, 1), (12, 1), (15, 3)],
  term ((-5 : Rat) / 4) [(9, 1), (12, 2), (13, 1)],
  term ((-40 : Rat) / 29) [(9, 1), (12, 2), (13, 1), (15, 2)],
  term ((-13 : Rat) / 4) [(9, 1), (12, 2), (15, 1)],
  term ((-40 : Rat) / 29) [(9, 1), (12, 2), (15, 3)],
  term ((-35 : Rat) / 48) [(9, 1), (13, 1)],
  term ((95 : Rat) / 348) [(9, 1), (13, 1), (15, 2)],
  term ((40 : Rat) / 87) [(9, 1), (13, 1), (15, 4)],
  term ((-3197 : Rat) / 696) [(9, 1), (13, 2), (15, 1)],
  term ((140 : Rat) / 87) [(9, 1), (13, 2), (15, 3)],
  term ((-1793 : Rat) / 2784) [(9, 1), (15, 1)],
  term ((-793 : Rat) / 696) [(9, 1), (15, 3)],
  term ((-6232083792 : Rat) / 33189485) [(10, 1), (11, 1), (12, 1), (15, 1)],
  term ((1183488 : Rat) / 32699) [(10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((10324795536 : Rat) / 33189485) [(10, 1), (11, 1), (12, 1), (15, 3)],
  term ((-1960704 : Rat) / 32699) [(10, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-5162397768 : Rat) / 33189485) [(10, 1), (11, 1), (13, 1), (15, 2)],
  term ((980352 : Rat) / 32699) [(10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((62010784 : Rat) / 33189485) [(10, 1), (11, 1), (15, 1)],
  term ((-11776 : Rat) / 32699) [(10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3844668608 : Rat) / 33189485) [(10, 1), (11, 1), (15, 3)],
  term ((730112 : Rat) / 32699) [(10, 1), (11, 1), (15, 3), (16, 1)],
  term ((31005392 : Rat) / 33189485) [(10, 1), (11, 2), (13, 1), (15, 1)],
  term ((-5888 : Rat) / 32699) [(10, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-15502696 : Rat) / 33189485) [(10, 1), (11, 2), (15, 2)],
  term ((2944 : Rat) / 32699) [(10, 1), (11, 2), (15, 2), (16, 1)],
  term ((-17939286324 : Rat) / 33189485) [(10, 1), (12, 1), (13, 1), (15, 1)],
  term ((3431160 : Rat) / 32699) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((35878572648 : Rat) / 33189485) [(10, 1), (12, 1), (13, 1), (15, 3)],
  term ((-6862320 : Rat) / 32699) [(10, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-5533809065 : Rat) / 19913691) [(10, 1), (12, 1), (15, 2)],
  term ((5241727 : Rat) / 98097) [(10, 1), (12, 1), (15, 2), (16, 1)],
  term ((3654299066 : Rat) / 33189485) [(10, 1), (12, 1), (15, 4)],
  term ((-698940 : Rat) / 32699) [(10, 1), (12, 1), (15, 4), (16, 1)],
  term ((3986508072 : Rat) / 33189485) [(10, 1), (12, 2), (13, 1), (15, 1)],
  term ((-762480 : Rat) / 32699) [(10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((996627018 : Rat) / 1746815) [(10, 1), (12, 2), (15, 2)],
  term ((-190620 : Rat) / 1721) [(10, 1), (12, 2), (15, 2), (16, 1)],
  term ((15069491621 : Rat) / 99568455) [(10, 1), (13, 1), (15, 1)],
  term ((-2858219 : Rat) / 98097) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-664418012 : Rat) / 6637897) [(10, 1), (13, 1), (15, 3)],
  term ((635400 : Rat) / 32699) [(10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-996627018 : Rat) / 1746815) [(10, 1), (13, 2), (15, 2)],
  term ((190620 : Rat) / 1721) [(10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-3986508072 : Rat) / 33189485) [(10, 1), (13, 3), (15, 1)],
  term ((762480 : Rat) / 32699) [(10, 1), (13, 3), (15, 1), (16, 1)],
  term ((16342892113 : Rat) / 106206352) [(10, 1), (15, 2)],
  term ((-3889409 : Rat) / 130796) [(10, 1), (15, 2), (16, 1)],
  term ((-166104503 : Rat) / 13275794) [(10, 1), (15, 4)],
  term ((79425 : Rat) / 32699) [(10, 1), (15, 4), (16, 1)],
  term ((64891722351 : Rat) / 33189485) [(11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-12465588 : Rat) / 32699) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((10658103500 : Rat) / 6637897) [(11, 1), (12, 1), (13, 1), (15, 4)],
  term ((-10120000 : Rat) / 32699) [(11, 1), (12, 1), (13, 1), (15, 4), (16, 1)],
  term ((-5813511000 : Rat) / 6637897) [(11, 1), (12, 1), (13, 2), (15, 3)],
  term ((5520000 : Rat) / 32699) [(11, 1), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((12592246549 : Rat) / 56896260) [(11, 1), (12, 1), (15, 1)],
  term ((-4245724 : Rat) / 98097) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-5103808439 : Rat) / 6637897) [(11, 1), (12, 1), (15, 3)],
  term ((4834390 : Rat) / 32699) [(11, 1), (12, 1), (15, 3), (16, 1)],
  term ((2906755500 : Rat) / 6637897) [(11, 1), (12, 2), (13, 1), (15, 2)],
  term ((-2760000 : Rat) / 32699) [(11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-15534102733 : Rat) / 33189485) [(11, 1), (12, 2), (15, 1)],
  term ((2984994 : Rat) / 32699) [(11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 10, terms 700 through 799. -/
theorem rs_R009_ueqv_R009NYYYY_block_10_0700_0799_valid :
    checkProductSumEq rs_R009_ueqv_R009NYYYY_partials_10_0700_0799
      rs_R009_ueqv_R009NYYYY_block_10_0700_0799 = true := by
  native_decide

end R009UeqvR009NYYYYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
