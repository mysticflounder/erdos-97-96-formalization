/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R014:u=v:R014YY, term block 25:700-746

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R014UeqvR014YYTermShards

/-- Generator polynomial 25 for relaxed split surplus certificate `R014:u=v:R014YY`. -/
def rs_R014_ueqv_R014YY_generator_25_0700_0746 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(12, 1)]
]

/-- Coefficient term 700 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0700 : Poly :=
[
  term ((1759199 : Rat) / 18480) [(11, 1), (15, 1)]
]

/-- Partial product 700 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0700 : Poly :=
[
  term ((1759199 : Rat) / 9240) [(11, 1), (12, 1), (15, 1)],
  term ((-1759199 : Rat) / 18480) [(11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 700 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0700_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0700
        rs_R014_ueqv_R014YY_generator_25_0700_0746 =
      rs_R014_ueqv_R014YY_partial_25_0700 := by
  native_decide

/-- Coefficient term 701 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0701 : Poly :=
[
  term ((-17 : Rat) / 2) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 701 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0701 : Poly :=
[
  term (-17 : Rat) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term ((17 : Rat) / 2) [(11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 701 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0701_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0701
        rs_R014_ueqv_R014YY_generator_25_0700_0746 =
      rs_R014_ueqv_R014YY_partial_25_0701 := by
  native_decide

/-- Coefficient term 702 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0702 : Poly :=
[
  term (-2 : Rat) [(11, 1), (15, 3)]
]

/-- Partial product 702 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0702 : Poly :=
[
  term (-4 : Rat) [(11, 1), (12, 1), (15, 3)],
  term (2 : Rat) [(11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 702 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0702_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0702
        rs_R014_ueqv_R014YY_generator_25_0700_0746 =
      rs_R014_ueqv_R014YY_partial_25_0702 := by
  native_decide

/-- Coefficient term 703 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0703 : Poly :=
[
  term ((9 : Rat) / 5) [(11, 1), (15, 3), (16, 1)]
]

/-- Partial product 703 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0703 : Poly :=
[
  term ((18 : Rat) / 5) [(11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-9 : Rat) / 5) [(11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 703 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0703_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0703
        rs_R014_ueqv_R014YY_generator_25_0700_0746 =
      rs_R014_ueqv_R014YY_partial_25_0703 := by
  native_decide

/-- Coefficient term 704 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0704 : Poly :=
[
  term ((-933651 : Rat) / 6160) [(11, 2)]
]

/-- Partial product 704 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0704 : Poly :=
[
  term ((933651 : Rat) / 6160) [(11, 2)],
  term ((-933651 : Rat) / 3080) [(11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 704 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0704_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0704
        rs_R014_ueqv_R014YY_generator_25_0700_0746 =
      rs_R014_ueqv_R014YY_partial_25_0704 := by
  native_decide

/-- Coefficient term 705 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0705 : Poly :=
[
  term ((311217 : Rat) / 3080) [(11, 2), (12, 1)]
]

/-- Partial product 705 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0705 : Poly :=
[
  term ((-311217 : Rat) / 3080) [(11, 2), (12, 1)],
  term ((311217 : Rat) / 1540) [(11, 2), (12, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 705 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0705_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0705
        rs_R014_ueqv_R014YY_generator_25_0700_0746 =
      rs_R014_ueqv_R014YY_partial_25_0705 := by
  native_decide

/-- Coefficient term 706 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0706 : Poly :=
[
  term ((231337 : Rat) / 27720) [(11, 2), (12, 1), (14, 1)]
]

/-- Partial product 706 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0706 : Poly :=
[
  term ((-231337 : Rat) / 27720) [(11, 2), (12, 1), (14, 1)],
  term ((231337 : Rat) / 13860) [(11, 2), (12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 706 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0706_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0706
        rs_R014_ueqv_R014YY_generator_25_0700_0746 =
      rs_R014_ueqv_R014YY_partial_25_0706 := by
  native_decide

/-- Coefficient term 707 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0707 : Poly :=
[
  term ((1 : Rat) / 6) [(11, 2), (12, 1), (15, 2)]
]

/-- Partial product 707 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0707 : Poly :=
[
  term ((-1 : Rat) / 6) [(11, 2), (12, 1), (15, 2)],
  term ((1 : Rat) / 3) [(11, 2), (12, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 707 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0707_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0707
        rs_R014_ueqv_R014YY_generator_25_0700_0746 =
      rs_R014_ueqv_R014YY_partial_25_0707 := by
  native_decide

/-- Coefficient term 708 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0708 : Poly :=
[
  term ((11 : Rat) / 5) [(11, 2), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 708 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0708 : Poly :=
[
  term ((-11 : Rat) / 5) [(11, 2), (12, 1), (15, 2), (16, 1)],
  term ((22 : Rat) / 5) [(11, 2), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 708 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0708_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0708
        rs_R014_ueqv_R014YY_generator_25_0700_0746 =
      rs_R014_ueqv_R014YY_partial_25_0708 := by
  native_decide

/-- Coefficient term 709 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0709 : Poly :=
[
  term ((-566563 : Rat) / 2640) [(11, 2), (14, 1)]
]

/-- Partial product 709 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0709 : Poly :=
[
  term ((-566563 : Rat) / 1320) [(11, 2), (12, 1), (14, 1)],
  term ((566563 : Rat) / 2640) [(11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 709 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0709_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0709
        rs_R014_ueqv_R014YY_generator_25_0700_0746 =
      rs_R014_ueqv_R014YY_partial_25_0709 := by
  native_decide

/-- Coefficient term 710 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0710 : Poly :=
[
  term ((-1 : Rat) / 3) [(11, 2), (14, 1), (15, 2)]
]

/-- Partial product 710 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0710 : Poly :=
[
  term ((-2 : Rat) / 3) [(11, 2), (12, 1), (14, 1), (15, 2)],
  term ((1 : Rat) / 3) [(11, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 710 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0710_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0710
        rs_R014_ueqv_R014YY_generator_25_0700_0746 =
      rs_R014_ueqv_R014YY_partial_25_0710 := by
  native_decide

/-- Coefficient term 711 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0711 : Poly :=
[
  term ((-12 : Rat) / 5) [(11, 2), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 711 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0711 : Poly :=
[
  term ((-24 : Rat) / 5) [(11, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((12 : Rat) / 5) [(11, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 711 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0711_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0711
        rs_R014_ueqv_R014YY_generator_25_0700_0746 =
      rs_R014_ueqv_R014YY_partial_25_0711 := by
  native_decide

/-- Coefficient term 712 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0712 : Poly :=
[
  term ((-231337 : Rat) / 13860) [(11, 2), (14, 2)]
]

/-- Partial product 712 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0712 : Poly :=
[
  term ((-231337 : Rat) / 6930) [(11, 2), (12, 1), (14, 2)],
  term ((231337 : Rat) / 13860) [(11, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 712 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0712_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0712
        rs_R014_ueqv_R014YY_generator_25_0700_0746 =
      rs_R014_ueqv_R014YY_partial_25_0712 := by
  native_decide

/-- Coefficient term 713 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0713 : Poly :=
[
  term ((-1 : Rat) / 4) [(11, 2), (15, 2)]
]

/-- Partial product 713 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0713 : Poly :=
[
  term ((-1 : Rat) / 2) [(11, 2), (12, 1), (15, 2)],
  term ((1 : Rat) / 4) [(11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 713 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0713_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0713
        rs_R014_ueqv_R014YY_generator_25_0700_0746 =
      rs_R014_ueqv_R014YY_partial_25_0713 := by
  native_decide

/-- Coefficient term 714 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0714 : Poly :=
[
  term ((-13 : Rat) / 10) [(11, 2), (15, 2), (16, 1)]
]

/-- Partial product 714 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0714 : Poly :=
[
  term ((-13 : Rat) / 5) [(11, 2), (12, 1), (15, 2), (16, 1)],
  term ((13 : Rat) / 10) [(11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 714 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0714_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0714
        rs_R014_ueqv_R014YY_generator_25_0700_0746 =
      rs_R014_ueqv_R014YY_partial_25_0714 := by
  native_decide

/-- Coefficient term 715 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0715 : Poly :=
[
  term ((3 : Rat) / 8) [(12, 1)]
]

/-- Partial product 715 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0715 : Poly :=
[
  term ((-3 : Rat) / 8) [(12, 1)],
  term ((3 : Rat) / 4) [(12, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 715 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0715_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0715
        rs_R014_ueqv_R014YY_generator_25_0700_0746 =
      rs_R014_ueqv_R014YY_partial_25_0715 := by
  native_decide

/-- Coefficient term 716 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0716 : Poly :=
[
  term ((-21 : Rat) / 2) [(12, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 716 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0716 : Poly :=
[
  term ((21 : Rat) / 2) [(12, 1), (13, 1), (14, 1), (15, 1)],
  term (-21 : Rat) [(12, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 716 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0716_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0716
        rs_R014_ueqv_R014YY_generator_25_0700_0746 =
      rs_R014_ueqv_R014YY_partial_25_0716 := by
  native_decide

/-- Coefficient term 717 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0717 : Poly :=
[
  term ((-35 : Rat) / 4) [(12, 1), (13, 1), (15, 1)]
]

/-- Partial product 717 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0717 : Poly :=
[
  term ((35 : Rat) / 4) [(12, 1), (13, 1), (15, 1)],
  term ((-35 : Rat) / 2) [(12, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 717 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0717_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0717
        rs_R014_ueqv_R014YY_generator_25_0700_0746 =
      rs_R014_ueqv_R014YY_partial_25_0717 := by
  native_decide

/-- Coefficient term 718 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0718 : Poly :=
[
  term (-3 : Rat) [(12, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 718 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0718 : Poly :=
[
  term (3 : Rat) [(12, 1), (13, 1), (15, 3), (16, 1)],
  term (-6 : Rat) [(12, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 718 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0718_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0718
        rs_R014_ueqv_R014YY_generator_25_0700_0746 =
      rs_R014_ueqv_R014YY_partial_25_0718 := by
  native_decide

/-- Coefficient term 719 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0719 : Poly :=
[
  term ((-983 : Rat) / 4620) [(12, 1), (14, 1), (15, 2)]
]

/-- Partial product 719 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0719 : Poly :=
[
  term ((983 : Rat) / 4620) [(12, 1), (14, 1), (15, 2)],
  term ((-983 : Rat) / 2310) [(12, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 719 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0719_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0719
        rs_R014_ueqv_R014YY_generator_25_0700_0746 =
      rs_R014_ueqv_R014YY_partial_25_0719 := by
  native_decide

/-- Coefficient term 720 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0720 : Poly :=
[
  term ((-39 : Rat) / 10) [(12, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 720 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0720 : Poly :=
[
  term ((39 : Rat) / 10) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-39 : Rat) / 5) [(12, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 720 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0720_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0720
        rs_R014_ueqv_R014YY_generator_25_0700_0746 =
      rs_R014_ueqv_R014YY_partial_25_0720 := by
  native_decide

/-- Coefficient term 721 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0721 : Poly :=
[
  term ((-3 : Rat) / 2) [(12, 1), (14, 2), (15, 2)]
]

/-- Partial product 721 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0721 : Poly :=
[
  term ((3 : Rat) / 2) [(12, 1), (14, 2), (15, 2)],
  term (-3 : Rat) [(12, 2), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 721 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0721_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0721
        rs_R014_ueqv_R014YY_generator_25_0700_0746 =
      rs_R014_ueqv_R014YY_partial_25_0721 := by
  native_decide

/-- Coefficient term 722 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0722 : Poly :=
[
  term ((-310363 : Rat) / 5544) [(12, 1), (15, 2)]
]

/-- Partial product 722 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0722 : Poly :=
[
  term ((310363 : Rat) / 5544) [(12, 1), (15, 2)],
  term ((-310363 : Rat) / 2772) [(12, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 722 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0722_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0722
        rs_R014_ueqv_R014YY_generator_25_0700_0746 =
      rs_R014_ueqv_R014YY_partial_25_0722 := by
  native_decide

/-- Coefficient term 723 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0723 : Poly :=
[
  term ((22 : Rat) / 5) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 723 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0723 : Poly :=
[
  term ((-22 : Rat) / 5) [(12, 1), (15, 2), (16, 1)],
  term ((44 : Rat) / 5) [(12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 723 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0723_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0723
        rs_R014_ueqv_R014YY_generator_25_0700_0746 =
      rs_R014_ueqv_R014YY_partial_25_0723 := by
  native_decide

/-- Coefficient term 724 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0724 : Poly :=
[
  term ((-3 : Rat) / 2) [(12, 1), (15, 4)]
]

/-- Partial product 724 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0724 : Poly :=
[
  term ((3 : Rat) / 2) [(12, 1), (15, 4)],
  term (-3 : Rat) [(12, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 724 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0724_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0724
        rs_R014_ueqv_R014YY_generator_25_0700_0746 =
      rs_R014_ueqv_R014YY_partial_25_0724 := by
  native_decide

/-- Coefficient term 725 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0725 : Poly :=
[
  term ((145711 : Rat) / 1980) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 725 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0725 : Poly :=
[
  term ((145711 : Rat) / 990) [(12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-145711 : Rat) / 1980) [(13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 725 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0725_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0725
        rs_R014_ueqv_R014YY_generator_25_0700_0746 =
      rs_R014_ueqv_R014YY_partial_25_0725 := by
  native_decide

/-- Coefficient term 726 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0726 : Poly :=
[
  term ((-221 : Rat) / 20) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 726 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0726 : Poly :=
[
  term ((-221 : Rat) / 10) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((221 : Rat) / 20) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 726 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0726_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0726
        rs_R014_ueqv_R014YY_generator_25_0700_0746 =
      rs_R014_ueqv_R014YY_partial_25_0726 := by
  native_decide

/-- Coefficient term 727 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0727 : Poly :=
[
  term ((3 : Rat) / 2) [(13, 1), (14, 1), (15, 3)]
]

/-- Partial product 727 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0727 : Poly :=
[
  term (3 : Rat) [(12, 1), (13, 1), (14, 1), (15, 3)],
  term ((-3 : Rat) / 2) [(13, 1), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 727 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0727_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0727
        rs_R014_ueqv_R014YY_generator_25_0700_0746 =
      rs_R014_ueqv_R014YY_partial_25_0727 := by
  native_decide

/-- Coefficient term 728 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0728 : Poly :=
[
  term ((983 : Rat) / 4620) [(13, 1), (14, 2), (15, 1)]
]

/-- Partial product 728 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0728 : Poly :=
[
  term ((983 : Rat) / 2310) [(12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-983 : Rat) / 4620) [(13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 728 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0728_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0728
        rs_R014_ueqv_R014YY_generator_25_0700_0746 =
      rs_R014_ueqv_R014YY_partial_25_0728 := by
  native_decide

/-- Coefficient term 729 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0729 : Poly :=
[
  term ((27 : Rat) / 5) [(13, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 729 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0729 : Poly :=
[
  term ((54 : Rat) / 5) [(12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-27 : Rat) / 5) [(13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 729 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0729_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0729
        rs_R014_ueqv_R014YY_generator_25_0700_0746 =
      rs_R014_ueqv_R014YY_partial_25_0729 := by
  native_decide

/-- Coefficient term 730 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0730 : Poly :=
[
  term ((3 : Rat) / 2) [(13, 1), (14, 3), (15, 1)]
]

/-- Partial product 730 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0730 : Poly :=
[
  term (3 : Rat) [(12, 1), (13, 1), (14, 3), (15, 1)],
  term ((-3 : Rat) / 2) [(13, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 730 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0730_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0730
        rs_R014_ueqv_R014YY_generator_25_0700_0746 =
      rs_R014_ueqv_R014YY_partial_25_0730 := by
  native_decide

/-- Coefficient term 731 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0731 : Poly :=
[
  term ((-7853 : Rat) / 1232) [(13, 1), (15, 1)]
]

/-- Partial product 731 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0731 : Poly :=
[
  term ((-7853 : Rat) / 616) [(12, 1), (13, 1), (15, 1)],
  term ((7853 : Rat) / 1232) [(13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 731 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0731_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0731
        rs_R014_ueqv_R014YY_generator_25_0700_0746 =
      rs_R014_ueqv_R014YY_partial_25_0731 := by
  native_decide

/-- Coefficient term 732 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0732 : Poly :=
[
  term ((-103 : Rat) / 10) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 732 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0732 : Poly :=
[
  term ((-103 : Rat) / 5) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((103 : Rat) / 10) [(13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 732 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0732_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0732
        rs_R014_ueqv_R014YY_generator_25_0700_0746 =
      rs_R014_ueqv_R014YY_partial_25_0732 := by
  native_decide

/-- Coefficient term 733 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0733 : Poly :=
[
  term ((-5 : Rat) / 2) [(13, 1), (15, 3), (16, 1)]
]

/-- Partial product 733 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0733 : Poly :=
[
  term (-5 : Rat) [(12, 1), (13, 1), (15, 3), (16, 1)],
  term ((5 : Rat) / 2) [(13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 733 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0733_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0733
        rs_R014_ueqv_R014YY_generator_25_0700_0746 =
      rs_R014_ueqv_R014YY_partial_25_0733 := by
  native_decide

/-- Coefficient term 734 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0734 : Poly :=
[
  term (7 : Rat) [(13, 2)]
]

/-- Partial product 734 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0734 : Poly :=
[
  term (14 : Rat) [(12, 1), (13, 2)],
  term (-7 : Rat) [(13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 734 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0734_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0734
        rs_R014_ueqv_R014YY_generator_25_0700_0746 =
      rs_R014_ueqv_R014YY_partial_25_0734 := by
  native_decide

/-- Coefficient term 735 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0735 : Poly :=
[
  term ((7 : Rat) / 4) [(13, 2), (14, 1)]
]

/-- Partial product 735 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0735 : Poly :=
[
  term ((7 : Rat) / 2) [(12, 1), (13, 2), (14, 1)],
  term ((-7 : Rat) / 4) [(13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 735 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0735_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0735
        rs_R014_ueqv_R014YY_generator_25_0700_0746 =
      rs_R014_ueqv_R014YY_partial_25_0735 := by
  native_decide

/-- Coefficient term 736 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0736 : Poly :=
[
  term (3 : Rat) [(13, 2), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 736 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0736 : Poly :=
[
  term (6 : Rat) [(12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term (-3 : Rat) [(13, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 736 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0736_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0736
        rs_R014_ueqv_R014YY_generator_25_0700_0746 =
      rs_R014_ueqv_R014YY_partial_25_0736 := by
  native_decide

/-- Coefficient term 737 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0737 : Poly :=
[
  term ((21 : Rat) / 2) [(13, 2), (14, 2)]
]

/-- Partial product 737 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0737 : Poly :=
[
  term (21 : Rat) [(12, 1), (13, 2), (14, 2)],
  term ((-21 : Rat) / 2) [(13, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 737 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0737_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0737
        rs_R014_ueqv_R014YY_generator_25_0700_0746 =
      rs_R014_ueqv_R014YY_partial_25_0737 := by
  native_decide

/-- Coefficient term 738 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0738 : Poly :=
[
  term ((21737 : Rat) / 792) [(14, 1)]
]

/-- Partial product 738 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0738 : Poly :=
[
  term ((21737 : Rat) / 396) [(12, 1), (14, 1)],
  term ((-21737 : Rat) / 792) [(14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 738 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0738_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0738
        rs_R014_ueqv_R014YY_generator_25_0700_0746 =
      rs_R014_ueqv_R014YY_partial_25_0738 := by
  native_decide

/-- Coefficient term 739 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0739 : Poly :=
[
  term ((3822803 : Rat) / 18480) [(14, 1), (15, 2)]
]

/-- Partial product 739 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0739 : Poly :=
[
  term ((3822803 : Rat) / 9240) [(12, 1), (14, 1), (15, 2)],
  term ((-3822803 : Rat) / 18480) [(14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 739 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0739_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0739
        rs_R014_ueqv_R014YY_generator_25_0700_0746 =
      rs_R014_ueqv_R014YY_partial_25_0739 := by
  native_decide

/-- Coefficient term 740 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0740 : Poly :=
[
  term ((137 : Rat) / 20) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 740 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0740 : Poly :=
[
  term ((137 : Rat) / 10) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-137 : Rat) / 20) [(14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 740 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0740_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0740
        rs_R014_ueqv_R014YY_generator_25_0700_0746 =
      rs_R014_ueqv_R014YY_partial_25_0740 := by
  native_decide

/-- Coefficient term 741 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0741 : Poly :=
[
  term ((-822797 : Rat) / 27720) [(14, 2)]
]

/-- Partial product 741 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0741 : Poly :=
[
  term ((-822797 : Rat) / 13860) [(12, 1), (14, 2)],
  term ((822797 : Rat) / 27720) [(14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 741 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0741_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0741
        rs_R014_ueqv_R014YY_generator_25_0700_0746 =
      rs_R014_ueqv_R014YY_partial_25_0741 := by
  native_decide

/-- Coefficient term 742 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0742 : Poly :=
[
  term ((9 : Rat) / 4) [(14, 2), (15, 2)]
]

/-- Partial product 742 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0742 : Poly :=
[
  term ((9 : Rat) / 2) [(12, 1), (14, 2), (15, 2)],
  term ((-9 : Rat) / 4) [(14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 742 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0742_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0742
        rs_R014_ueqv_R014YY_generator_25_0700_0746 =
      rs_R014_ueqv_R014YY_partial_25_0742 := by
  native_decide

/-- Coefficient term 743 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0743 : Poly :=
[
  term ((548743 : Rat) / 2640) [(14, 3)]
]

/-- Partial product 743 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0743 : Poly :=
[
  term ((548743 : Rat) / 1320) [(12, 1), (14, 3)],
  term ((-548743 : Rat) / 2640) [(14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 743 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0743_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0743
        rs_R014_ueqv_R014YY_generator_25_0700_0746 =
      rs_R014_ueqv_R014YY_partial_25_0743 := by
  native_decide

/-- Coefficient term 744 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0744 : Poly :=
[
  term ((4901 : Rat) / 9240) [(15, 2)]
]

/-- Partial product 744 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0744 : Poly :=
[
  term ((4901 : Rat) / 4620) [(12, 1), (15, 2)],
  term ((-4901 : Rat) / 9240) [(15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 744 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0744_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0744
        rs_R014_ueqv_R014YY_generator_25_0700_0746 =
      rs_R014_ueqv_R014YY_partial_25_0744 := by
  native_decide

/-- Coefficient term 745 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0745 : Poly :=
[
  term ((-37 : Rat) / 5) [(15, 2), (16, 1)]
]

/-- Partial product 745 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0745 : Poly :=
[
  term ((-74 : Rat) / 5) [(12, 1), (15, 2), (16, 1)],
  term ((37 : Rat) / 5) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 745 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0745_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0745
        rs_R014_ueqv_R014YY_generator_25_0700_0746 =
      rs_R014_ueqv_R014YY_partial_25_0745 := by
  native_decide

/-- Coefficient term 746 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0746 : Poly :=
[
  term ((9 : Rat) / 4) [(15, 4)]
]

/-- Partial product 746 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0746 : Poly :=
[
  term ((9 : Rat) / 2) [(12, 1), (15, 4)],
  term ((-9 : Rat) / 4) [(15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 746 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0746_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0746
        rs_R014_ueqv_R014YY_generator_25_0700_0746 =
      rs_R014_ueqv_R014YY_partial_25_0746 := by
  native_decide

/-- Partial products in this block. -/
def rs_R014_ueqv_R014YY_partials_25_0700_0746 : List Poly :=
[
  rs_R014_ueqv_R014YY_partial_25_0700,
  rs_R014_ueqv_R014YY_partial_25_0701,
  rs_R014_ueqv_R014YY_partial_25_0702,
  rs_R014_ueqv_R014YY_partial_25_0703,
  rs_R014_ueqv_R014YY_partial_25_0704,
  rs_R014_ueqv_R014YY_partial_25_0705,
  rs_R014_ueqv_R014YY_partial_25_0706,
  rs_R014_ueqv_R014YY_partial_25_0707,
  rs_R014_ueqv_R014YY_partial_25_0708,
  rs_R014_ueqv_R014YY_partial_25_0709,
  rs_R014_ueqv_R014YY_partial_25_0710,
  rs_R014_ueqv_R014YY_partial_25_0711,
  rs_R014_ueqv_R014YY_partial_25_0712,
  rs_R014_ueqv_R014YY_partial_25_0713,
  rs_R014_ueqv_R014YY_partial_25_0714,
  rs_R014_ueqv_R014YY_partial_25_0715,
  rs_R014_ueqv_R014YY_partial_25_0716,
  rs_R014_ueqv_R014YY_partial_25_0717,
  rs_R014_ueqv_R014YY_partial_25_0718,
  rs_R014_ueqv_R014YY_partial_25_0719,
  rs_R014_ueqv_R014YY_partial_25_0720,
  rs_R014_ueqv_R014YY_partial_25_0721,
  rs_R014_ueqv_R014YY_partial_25_0722,
  rs_R014_ueqv_R014YY_partial_25_0723,
  rs_R014_ueqv_R014YY_partial_25_0724,
  rs_R014_ueqv_R014YY_partial_25_0725,
  rs_R014_ueqv_R014YY_partial_25_0726,
  rs_R014_ueqv_R014YY_partial_25_0727,
  rs_R014_ueqv_R014YY_partial_25_0728,
  rs_R014_ueqv_R014YY_partial_25_0729,
  rs_R014_ueqv_R014YY_partial_25_0730,
  rs_R014_ueqv_R014YY_partial_25_0731,
  rs_R014_ueqv_R014YY_partial_25_0732,
  rs_R014_ueqv_R014YY_partial_25_0733,
  rs_R014_ueqv_R014YY_partial_25_0734,
  rs_R014_ueqv_R014YY_partial_25_0735,
  rs_R014_ueqv_R014YY_partial_25_0736,
  rs_R014_ueqv_R014YY_partial_25_0737,
  rs_R014_ueqv_R014YY_partial_25_0738,
  rs_R014_ueqv_R014YY_partial_25_0739,
  rs_R014_ueqv_R014YY_partial_25_0740,
  rs_R014_ueqv_R014YY_partial_25_0741,
  rs_R014_ueqv_R014YY_partial_25_0742,
  rs_R014_ueqv_R014YY_partial_25_0743,
  rs_R014_ueqv_R014YY_partial_25_0744,
  rs_R014_ueqv_R014YY_partial_25_0745,
  rs_R014_ueqv_R014YY_partial_25_0746
]

/-- Sum of partial products in this block. -/
def rs_R014_ueqv_R014YY_block_25_0700_0746 : Poly :=
[
  term ((1759199 : Rat) / 9240) [(11, 1), (12, 1), (15, 1)],
  term (-17 : Rat) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(11, 1), (12, 1), (15, 3)],
  term ((18 : Rat) / 5) [(11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-1759199 : Rat) / 18480) [(11, 1), (15, 1)],
  term ((17 : Rat) / 2) [(11, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(11, 1), (15, 3)],
  term ((-9 : Rat) / 5) [(11, 1), (15, 3), (16, 1)],
  term ((933651 : Rat) / 6160) [(11, 2)],
  term ((-311217 : Rat) / 770) [(11, 2), (12, 1)],
  term ((-303229 : Rat) / 693) [(11, 2), (12, 1), (14, 1)],
  term ((-2 : Rat) / 3) [(11, 2), (12, 1), (14, 1), (15, 2)],
  term ((-24 : Rat) / 5) [(11, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-231337 : Rat) / 6930) [(11, 2), (12, 1), (14, 2)],
  term ((-2 : Rat) / 3) [(11, 2), (12, 1), (15, 2)],
  term ((-24 : Rat) / 5) [(11, 2), (12, 1), (15, 2), (16, 1)],
  term ((311217 : Rat) / 1540) [(11, 2), (12, 2)],
  term ((231337 : Rat) / 13860) [(11, 2), (12, 2), (14, 1)],
  term ((1 : Rat) / 3) [(11, 2), (12, 2), (15, 2)],
  term ((22 : Rat) / 5) [(11, 2), (12, 2), (15, 2), (16, 1)],
  term ((566563 : Rat) / 2640) [(11, 2), (14, 1)],
  term ((1 : Rat) / 3) [(11, 2), (14, 1), (15, 2)],
  term ((12 : Rat) / 5) [(11, 2), (14, 1), (15, 2), (16, 1)],
  term ((231337 : Rat) / 13860) [(11, 2), (14, 2)],
  term ((1 : Rat) / 4) [(11, 2), (15, 2)],
  term ((13 : Rat) / 10) [(11, 2), (15, 2), (16, 1)],
  term ((-3 : Rat) / 8) [(12, 1)],
  term ((78053 : Rat) / 495) [(12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-221 : Rat) / 10) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(12, 1), (13, 1), (14, 1), (15, 3)],
  term ((983 : Rat) / 2310) [(12, 1), (13, 1), (14, 2), (15, 1)],
  term ((54 : Rat) / 5) [(12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term (3 : Rat) [(12, 1), (13, 1), (14, 3), (15, 1)],
  term ((-2463 : Rat) / 616) [(12, 1), (13, 1), (15, 1)],
  term ((-103 : Rat) / 5) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(12, 1), (13, 1), (15, 3), (16, 1)],
  term (14 : Rat) [(12, 1), (13, 2)],
  term ((7 : Rat) / 2) [(12, 1), (13, 2), (14, 1)],
  term (6 : Rat) [(12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term (21 : Rat) [(12, 1), (13, 2), (14, 2)],
  term ((21737 : Rat) / 396) [(12, 1), (14, 1)],
  term ((1274923 : Rat) / 3080) [(12, 1), (14, 1), (15, 2)],
  term ((88 : Rat) / 5) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-822797 : Rat) / 13860) [(12, 1), (14, 2)],
  term (6 : Rat) [(12, 1), (14, 2), (15, 2)],
  term ((548743 : Rat) / 1320) [(12, 1), (14, 3)],
  term ((1581221 : Rat) / 27720) [(12, 1), (15, 2)],
  term ((-96 : Rat) / 5) [(12, 1), (15, 2), (16, 1)],
  term (6 : Rat) [(12, 1), (15, 4)],
  term ((3 : Rat) / 4) [(12, 2)],
  term (-21 : Rat) [(12, 2), (13, 1), (14, 1), (15, 1)],
  term ((-35 : Rat) / 2) [(12, 2), (13, 1), (15, 1)],
  term (-6 : Rat) [(12, 2), (13, 1), (15, 3), (16, 1)],
  term ((-983 : Rat) / 2310) [(12, 2), (14, 1), (15, 2)],
  term ((-39 : Rat) / 5) [(12, 2), (14, 1), (15, 2), (16, 1)],
  term (-3 : Rat) [(12, 2), (14, 2), (15, 2)],
  term ((-310363 : Rat) / 2772) [(12, 2), (15, 2)],
  term ((44 : Rat) / 5) [(12, 2), (15, 2), (16, 1)],
  term (-3 : Rat) [(12, 2), (15, 4)],
  term ((-145711 : Rat) / 1980) [(13, 1), (14, 1), (15, 1)],
  term ((221 : Rat) / 20) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(13, 1), (14, 1), (15, 3)],
  term ((-983 : Rat) / 4620) [(13, 1), (14, 2), (15, 1)],
  term ((-27 : Rat) / 5) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(13, 1), (14, 3), (15, 1)],
  term ((7853 : Rat) / 1232) [(13, 1), (15, 1)],
  term ((103 : Rat) / 10) [(13, 1), (15, 1), (16, 1)],
  term ((5 : Rat) / 2) [(13, 1), (15, 3), (16, 1)],
  term (-7 : Rat) [(13, 2)],
  term ((-7 : Rat) / 4) [(13, 2), (14, 1)],
  term (-3 : Rat) [(13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-21 : Rat) / 2) [(13, 2), (14, 2)],
  term ((-21737 : Rat) / 792) [(14, 1)],
  term ((-3822803 : Rat) / 18480) [(14, 1), (15, 2)],
  term ((-137 : Rat) / 20) [(14, 1), (15, 2), (16, 1)],
  term ((822797 : Rat) / 27720) [(14, 2)],
  term ((-9 : Rat) / 4) [(14, 2), (15, 2)],
  term ((-548743 : Rat) / 2640) [(14, 3)],
  term ((-4901 : Rat) / 9240) [(15, 2)],
  term ((37 : Rat) / 5) [(15, 2), (16, 1)],
  term ((-9 : Rat) / 4) [(15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 25, terms 700 through 746. -/
theorem rs_R014_ueqv_R014YY_block_25_0700_0746_valid :
    checkProductSumEq rs_R014_ueqv_R014YY_partials_25_0700_0746
      rs_R014_ueqv_R014YY_block_25_0700_0746 = true := by
  native_decide

end R014UeqvR014YYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
