/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010NYN, term block 25:700-799

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010NYNTermShards

/-- Generator polynomial 25 for relaxed split surplus certificate `R010:u=v:R010NYN`. -/
def rs_R010_ueqv_R010NYN_generator_25_0700_0799 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(12, 1)]
]

/-- Coefficient term 700 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0700 : Poly :=
[
  term ((8627904 : Rat) / 2995) [(8, 1), (11, 2), (15, 2)]
]

/-- Partial product 700 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0700 : Poly :=
[
  term ((17255808 : Rat) / 2995) [(8, 1), (11, 2), (12, 1), (15, 2)],
  term ((-8627904 : Rat) / 2995) [(8, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 700 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0700_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0700
        rs_R010_ueqv_R010NYN_generator_25_0700_0799 =
      rs_R010_ueqv_R010NYN_partial_25_0700 := by
  native_decide

/-- Coefficient term 701 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0701 : Poly :=
[
  term ((-1896 : Rat) / 5) [(8, 1), (11, 2), (15, 2), (16, 1)]
]

/-- Partial product 701 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0701 : Poly :=
[
  term ((-3792 : Rat) / 5) [(8, 1), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((1896 : Rat) / 5) [(8, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 701 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0701_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0701
        rs_R010_ueqv_R010NYN_generator_25_0700_0799 =
      rs_R010_ueqv_R010NYN_partial_25_0701 := by
  native_decide

/-- Coefficient term 702 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0702 : Poly :=
[
  term ((-5785344 : Rat) / 2995) [(8, 1), (11, 3), (15, 1)]
]

/-- Partial product 702 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0702 : Poly :=
[
  term ((-11570688 : Rat) / 2995) [(8, 1), (11, 3), (12, 1), (15, 1)],
  term ((5785344 : Rat) / 2995) [(8, 1), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 702 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0702_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0702
        rs_R010_ueqv_R010NYN_generator_25_0700_0799 =
      rs_R010_ueqv_R010NYN_partial_25_0702 := by
  native_decide

/-- Coefficient term 703 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0703 : Poly :=
[
  term ((-1301184 : Rat) / 2995) [(8, 1), (12, 1), (15, 2)]
]

/-- Partial product 703 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0703 : Poly :=
[
  term ((1301184 : Rat) / 2995) [(8, 1), (12, 1), (15, 2)],
  term ((-2602368 : Rat) / 2995) [(8, 1), (12, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 703 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0703_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0703
        rs_R010_ueqv_R010NYN_generator_25_0700_0799 =
      rs_R010_ueqv_R010NYN_partial_25_0703 := by
  native_decide

/-- Coefficient term 704 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0704 : Poly :=
[
  term ((262 : Rat) / 5) [(8, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 704 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0704 : Poly :=
[
  term ((-262 : Rat) / 5) [(8, 1), (12, 1), (15, 2), (16, 1)],
  term ((524 : Rat) / 5) [(8, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 704 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0704_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0704
        rs_R010_ueqv_R010NYN_generator_25_0700_0799 =
      rs_R010_ueqv_R010NYN_partial_25_0704 := by
  native_decide

/-- Coefficient term 705 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0705 : Poly :=
[
  term ((76416 : Rat) / 599) [(8, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 705 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0705 : Poly :=
[
  term ((152832 : Rat) / 599) [(8, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-76416 : Rat) / 599) [(8, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 705 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0705_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0705
        rs_R010_ueqv_R010NYN_generator_25_0700_0799 =
      rs_R010_ueqv_R010NYN_partial_25_0705 := by
  native_decide

/-- Coefficient term 706 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0706 : Poly :=
[
  term (-10 : Rat) [(8, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 706 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0706 : Poly :=
[
  term (-20 : Rat) [(8, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term (10 : Rat) [(8, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 706 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0706_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0706
        rs_R010_ueqv_R010NYN_generator_25_0700_0799 =
      rs_R010_ueqv_R010NYN_partial_25_0706 := by
  native_decide

/-- Coefficient term 707 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0707 : Poly :=
[
  term ((333832 : Rat) / 2995) [(8, 1), (13, 1), (15, 1)]
]

/-- Partial product 707 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0707 : Poly :=
[
  term ((667664 : Rat) / 2995) [(8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-333832 : Rat) / 2995) [(8, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 707 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0707_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0707
        rs_R010_ueqv_R010NYN_generator_25_0700_0799 =
      rs_R010_ueqv_R010NYN_partial_25_0707 := by
  native_decide

/-- Coefficient term 708 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0708 : Poly :=
[
  term ((-66 : Rat) / 5) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 708 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0708 : Poly :=
[
  term ((-132 : Rat) / 5) [(8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((66 : Rat) / 5) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 708 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0708_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0708
        rs_R010_ueqv_R010NYN_generator_25_0700_0799 =
      rs_R010_ueqv_R010NYN_partial_25_0708 := by
  native_decide

/-- Coefficient term 709 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0709 : Poly :=
[
  term ((5700 : Rat) / 599) [(8, 1), (14, 1)]
]

/-- Partial product 709 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0709 : Poly :=
[
  term ((11400 : Rat) / 599) [(8, 1), (12, 1), (14, 1)],
  term ((-5700 : Rat) / 599) [(8, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 709 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0709_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0709
        rs_R010_ueqv_R010NYN_generator_25_0700_0799 =
      rs_R010_ueqv_R010NYN_partial_25_0709 := by
  native_decide

/-- Coefficient term 710 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0710 : Poly :=
[
  term ((919104 : Rat) / 2995) [(8, 1), (14, 1), (15, 2)]
]

/-- Partial product 710 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0710 : Poly :=
[
  term ((1838208 : Rat) / 2995) [(8, 1), (12, 1), (14, 1), (15, 2)],
  term ((-919104 : Rat) / 2995) [(8, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 710 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0710_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0710
        rs_R010_ueqv_R010NYN_generator_25_0700_0799 =
      rs_R010_ueqv_R010NYN_partial_25_0710 := by
  native_decide

/-- Coefficient term 711 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0711 : Poly :=
[
  term ((-212 : Rat) / 5) [(8, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 711 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0711 : Poly :=
[
  term ((-424 : Rat) / 5) [(8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((212 : Rat) / 5) [(8, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 711 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0711_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0711
        rs_R010_ueqv_R010NYN_generator_25_0700_0799 =
      rs_R010_ueqv_R010NYN_partial_25_0711 := by
  native_decide

/-- Coefficient term 712 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0712 : Poly :=
[
  term ((-707284 : Rat) / 599) [(8, 1), (15, 2)]
]

/-- Partial product 712 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0712 : Poly :=
[
  term ((-1414568 : Rat) / 599) [(8, 1), (12, 1), (15, 2)],
  term ((707284 : Rat) / 599) [(8, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 712 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0712_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0712
        rs_R010_ueqv_R010NYN_generator_25_0700_0799 =
      rs_R010_ueqv_R010NYN_partial_25_0712 := by
  native_decide

/-- Coefficient term 713 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0713 : Poly :=
[
  term (148 : Rat) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 713 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0713 : Poly :=
[
  term (296 : Rat) [(8, 1), (12, 1), (15, 2), (16, 1)],
  term (-148 : Rat) [(8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 713 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0713_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0713
        rs_R010_ueqv_R010NYN_generator_25_0700_0799 =
      rs_R010_ueqv_R010NYN_partial_25_0713 := by
  native_decide

/-- Coefficient term 714 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0714 : Poly :=
[
  term ((-1362 : Rat) / 599) [(8, 2)]
]

/-- Partial product 714 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0714 : Poly :=
[
  term ((1362 : Rat) / 599) [(8, 2)],
  term ((-2724 : Rat) / 599) [(8, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 714 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0714_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0714
        rs_R010_ueqv_R010NYN_generator_25_0700_0799 =
      rs_R010_ueqv_R010NYN_partial_25_0714 := by
  native_decide

/-- Coefficient term 715 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0715 : Poly :=
[
  term ((1124928 : Rat) / 2995) [(8, 2), (11, 1), (13, 1)]
]

/-- Partial product 715 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0715 : Poly :=
[
  term ((2249856 : Rat) / 2995) [(8, 2), (11, 1), (12, 1), (13, 1)],
  term ((-1124928 : Rat) / 2995) [(8, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 715 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0715_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0715
        rs_R010_ueqv_R010NYN_generator_25_0700_0799 =
      rs_R010_ueqv_R010NYN_partial_25_0715 := by
  native_decide

/-- Coefficient term 716 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0716 : Poly :=
[
  term ((-1570176 : Rat) / 599) [(8, 2), (11, 1), (15, 1)]
]

/-- Partial product 716 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0716 : Poly :=
[
  term ((-3140352 : Rat) / 599) [(8, 2), (11, 1), (12, 1), (15, 1)],
  term ((1570176 : Rat) / 599) [(8, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 716 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0716_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0716
        rs_R010_ueqv_R010NYN_generator_25_0700_0799 =
      rs_R010_ueqv_R010NYN_partial_25_0716 := by
  native_decide

/-- Coefficient term 717 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0717 : Poly :=
[
  term ((132 : Rat) / 5) [(8, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 717 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0717 : Poly :=
[
  term ((264 : Rat) / 5) [(8, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-132 : Rat) / 5) [(8, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 717 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0717_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0717
        rs_R010_ueqv_R010NYN_generator_25_0700_0799 =
      rs_R010_ueqv_R010NYN_partial_25_0717 := by
  native_decide

/-- Coefficient term 718 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0718 : Poly :=
[
  term ((321408 : Rat) / 2995) [(8, 2), (11, 2)]
]

/-- Partial product 718 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0718 : Poly :=
[
  term ((-321408 : Rat) / 2995) [(8, 2), (11, 2)],
  term ((642816 : Rat) / 2995) [(8, 2), (11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 718 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0718_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0718
        rs_R010_ueqv_R010NYN_generator_25_0700_0799 =
      rs_R010_ueqv_R010NYN_partial_25_0718 := by
  native_decide

/-- Coefficient term 719 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0719 : Poly :=
[
  term ((-1301184 : Rat) / 2995) [(8, 2), (13, 1), (15, 1)]
]

/-- Partial product 719 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0719 : Poly :=
[
  term ((-2602368 : Rat) / 2995) [(8, 2), (12, 1), (13, 1), (15, 1)],
  term ((1301184 : Rat) / 2995) [(8, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 719 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0719_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0719
        rs_R010_ueqv_R010NYN_generator_25_0700_0799 =
      rs_R010_ueqv_R010NYN_partial_25_0719 := by
  native_decide

/-- Coefficient term 720 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0720 : Poly :=
[
  term ((262 : Rat) / 5) [(8, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 720 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0720 : Poly :=
[
  term ((524 : Rat) / 5) [(8, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-262 : Rat) / 5) [(8, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 720 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0720_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0720
        rs_R010_ueqv_R010NYN_generator_25_0700_0799 =
      rs_R010_ueqv_R010NYN_partial_25_0720 := by
  native_decide

/-- Coefficient term 721 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0721 : Poly :=
[
  term ((8458368 : Rat) / 2995) [(8, 2), (15, 2)]
]

/-- Partial product 721 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0721 : Poly :=
[
  term ((16916736 : Rat) / 2995) [(8, 2), (12, 1), (15, 2)],
  term ((-8458368 : Rat) / 2995) [(8, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 721 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0721_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0721
        rs_R010_ueqv_R010NYN_generator_25_0700_0799 =
      rs_R010_ueqv_R010NYN_partial_25_0721 := by
  native_decide

/-- Coefficient term 722 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0722 : Poly :=
[
  term ((-1924 : Rat) / 5) [(8, 2), (15, 2), (16, 1)]
]

/-- Partial product 722 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0722 : Poly :=
[
  term ((-3848 : Rat) / 5) [(8, 2), (12, 1), (15, 2), (16, 1)],
  term ((1924 : Rat) / 5) [(8, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 722 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0722_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0722
        rs_R010_ueqv_R010NYN_generator_25_0700_0799 =
      rs_R010_ueqv_R010NYN_partial_25_0722 := by
  native_decide

/-- Coefficient term 723 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0723 : Poly :=
[
  term ((-964224 : Rat) / 2995) [(9, 1), (10, 1), (11, 1), (12, 1)]
]

/-- Partial product 723 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0723 : Poly :=
[
  term ((964224 : Rat) / 2995) [(9, 1), (10, 1), (11, 1), (12, 1)],
  term ((-1928448 : Rat) / 2995) [(9, 1), (10, 1), (11, 1), (12, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 723 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0723_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0723
        rs_R010_ueqv_R010NYN_generator_25_0700_0799 =
      rs_R010_ueqv_R010NYN_partial_25_0723 := by
  native_decide

/-- Coefficient term 724 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0724 : Poly :=
[
  term ((642816 : Rat) / 2995) [(9, 1), (10, 1), (11, 1), (14, 1)]
]

/-- Partial product 724 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0724 : Poly :=
[
  term ((1285632 : Rat) / 2995) [(9, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((-642816 : Rat) / 2995) [(9, 1), (10, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 724 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0724_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0724
        rs_R010_ueqv_R010NYN_generator_25_0700_0799 =
      rs_R010_ueqv_R010NYN_partial_25_0724 := by
  native_decide

/-- Coefficient term 725 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0725 : Poly :=
[
  term ((1045152 : Rat) / 2995) [(9, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 725 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0725 : Poly :=
[
  term ((-1045152 : Rat) / 2995) [(9, 1), (10, 1), (12, 1), (15, 1)],
  term ((2090304 : Rat) / 2995) [(9, 1), (10, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 725 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0725_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0725
        rs_R010_ueqv_R010NYN_generator_25_0700_0799 =
      rs_R010_ueqv_R010NYN_partial_25_0725 := by
  native_decide

/-- Coefficient term 726 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0726 : Poly :=
[
  term ((-206 : Rat) / 5) [(9, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 726 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0726 : Poly :=
[
  term ((206 : Rat) / 5) [(9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-412 : Rat) / 5) [(9, 1), (10, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 726 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0726_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0726
        rs_R010_ueqv_R010NYN_generator_25_0700_0799 =
      rs_R010_ueqv_R010NYN_partial_25_0726 := by
  native_decide

/-- Coefficient term 727 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0727 : Poly :=
[
  term ((-711648 : Rat) / 2995) [(9, 1), (10, 1), (14, 1), (15, 1)]
]

/-- Partial product 727 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0727 : Poly :=
[
  term ((-1423296 : Rat) / 2995) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((711648 : Rat) / 2995) [(9, 1), (10, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 727 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0727_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0727
        rs_R010_ueqv_R010NYN_generator_25_0700_0799 =
      rs_R010_ueqv_R010NYN_partial_25_0727 := by
  native_decide

/-- Coefficient term 728 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0728 : Poly :=
[
  term ((154 : Rat) / 5) [(9, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 728 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0728 : Poly :=
[
  term ((308 : Rat) / 5) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-154 : Rat) / 5) [(9, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 728 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0728_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0728
        rs_R010_ueqv_R010NYN_generator_25_0700_0799 =
      rs_R010_ueqv_R010NYN_partial_25_0728 := by
  native_decide

/-- Coefficient term 729 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0729 : Poly :=
[
  term ((63744 : Rat) / 599) [(9, 1), (11, 1)]
]

/-- Partial product 729 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0729 : Poly :=
[
  term ((-63744 : Rat) / 599) [(9, 1), (11, 1)],
  term ((127488 : Rat) / 599) [(9, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 729 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0729_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0729
        rs_R010_ueqv_R010NYN_generator_25_0700_0799 =
      rs_R010_ueqv_R010NYN_partial_25_0729 := by
  native_decide

/-- Coefficient term 730 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0730 : Poly :=
[
  term ((517824 : Rat) / 2995) [(9, 1), (11, 1), (12, 1)]
]

/-- Partial product 730 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0730 : Poly :=
[
  term ((-517824 : Rat) / 2995) [(9, 1), (11, 1), (12, 1)],
  term ((1035648 : Rat) / 2995) [(9, 1), (11, 1), (12, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 730 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0730_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0730
        rs_R010_ueqv_R010NYN_generator_25_0700_0799 =
      rs_R010_ueqv_R010NYN_partial_25_0730 := by
  native_decide

/-- Coefficient term 731 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0731 : Poly :=
[
  term ((756288 : Rat) / 2995) [(9, 1), (11, 1), (12, 1), (15, 2)]
]

/-- Partial product 731 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0731 : Poly :=
[
  term ((-756288 : Rat) / 2995) [(9, 1), (11, 1), (12, 1), (15, 2)],
  term ((1512576 : Rat) / 2995) [(9, 1), (11, 1), (12, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 731 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0731_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0731
        rs_R010_ueqv_R010NYN_generator_25_0700_0799 =
      rs_R010_ueqv_R010NYN_partial_25_0731 := by
  native_decide

/-- Coefficient term 732 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0732 : Poly :=
[
  term ((-204 : Rat) / 5) [(9, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 732 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0732 : Poly :=
[
  term ((204 : Rat) / 5) [(9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-408 : Rat) / 5) [(9, 1), (11, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 732 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0732_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0732
        rs_R010_ueqv_R010NYN_generator_25_0700_0799 =
      rs_R010_ueqv_R010NYN_partial_25_0732 := by
  native_decide

/-- Coefficient term 733 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0733 : Poly :=
[
  term ((-2243136 : Rat) / 2995) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 733 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0733 : Poly :=
[
  term ((-4486272 : Rat) / 2995) [(9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((2243136 : Rat) / 2995) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 733 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0733_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0733
        rs_R010_ueqv_R010NYN_generator_25_0700_0799 =
      rs_R010_ueqv_R010NYN_partial_25_0733 := by
  native_decide

/-- Coefficient term 734 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0734 : Poly :=
[
  term ((596 : Rat) / 5) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 734 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0734 : Poly :=
[
  term ((1192 : Rat) / 5) [(9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-596 : Rat) / 5) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 734 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0734_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0734
        rs_R010_ueqv_R010NYN_generator_25_0700_0799 =
      rs_R010_ueqv_R010NYN_partial_25_0734 := by
  native_decide

/-- Coefficient term 735 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0735 : Poly :=
[
  term ((-399360 : Rat) / 599) [(9, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 735 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0735 : Poly :=
[
  term ((-798720 : Rat) / 599) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((399360 : Rat) / 599) [(9, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 735 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0735_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0735
        rs_R010_ueqv_R010NYN_generator_25_0700_0799 =
      rs_R010_ueqv_R010NYN_partial_25_0735 := by
  native_decide

/-- Coefficient term 736 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0736 : Poly :=
[
  term ((466 : Rat) / 5) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 736 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0736 : Poly :=
[
  term ((932 : Rat) / 5) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-466 : Rat) / 5) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 736 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0736_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0736
        rs_R010_ueqv_R010NYN_generator_25_0700_0799 =
      rs_R010_ueqv_R010NYN_partial_25_0736 := by
  native_decide

/-- Coefficient term 737 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0737 : Poly :=
[
  term ((-5049696 : Rat) / 2995) [(9, 1), (11, 1), (14, 1)]
]

/-- Partial product 737 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0737 : Poly :=
[
  term ((-10099392 : Rat) / 2995) [(9, 1), (11, 1), (12, 1), (14, 1)],
  term ((5049696 : Rat) / 2995) [(9, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 737 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0737_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0737
        rs_R010_ueqv_R010NYN_generator_25_0700_0799 =
      rs_R010_ueqv_R010NYN_partial_25_0737 := by
  native_decide

/-- Coefficient term 738 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0738 : Poly :=
[
  term ((3495744 : Rat) / 2995) [(9, 1), (11, 1), (14, 1), (15, 2)]
]

/-- Partial product 738 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0738 : Poly :=
[
  term ((6991488 : Rat) / 2995) [(9, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((-3495744 : Rat) / 2995) [(9, 1), (11, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 738 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0738_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0738
        rs_R010_ueqv_R010NYN_generator_25_0700_0799 =
      rs_R010_ueqv_R010NYN_partial_25_0738 := by
  native_decide

/-- Coefficient term 739 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0739 : Poly :=
[
  term (-132 : Rat) [(9, 1), (11, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 739 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0739 : Poly :=
[
  term (-264 : Rat) [(9, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term (132 : Rat) [(9, 1), (11, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 739 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0739_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0739
        rs_R010_ueqv_R010NYN_generator_25_0700_0799 =
      rs_R010_ueqv_R010NYN_partial_25_0739 := by
  native_decide

/-- Coefficient term 740 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0740 : Poly :=
[
  term ((581184 : Rat) / 599) [(9, 1), (11, 1), (15, 2)]
]

/-- Partial product 740 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0740 : Poly :=
[
  term ((1162368 : Rat) / 599) [(9, 1), (11, 1), (12, 1), (15, 2)],
  term ((-581184 : Rat) / 599) [(9, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 740 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0740_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0740
        rs_R010_ueqv_R010NYN_generator_25_0700_0799 =
      rs_R010_ueqv_R010NYN_partial_25_0740 := by
  native_decide

/-- Coefficient term 741 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0741 : Poly :=
[
  term ((-504 : Rat) / 5) [(9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 741 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0741 : Poly :=
[
  term ((-1008 : Rat) / 5) [(9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((504 : Rat) / 5) [(9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 741 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0741_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0741
        rs_R010_ueqv_R010NYN_generator_25_0700_0799 =
      rs_R010_ueqv_R010NYN_partial_25_0741 := by
  native_decide

/-- Coefficient term 742 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0742 : Poly :=
[
  term ((-642816 : Rat) / 2995) [(9, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 742 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0742 : Poly :=
[
  term ((642816 : Rat) / 2995) [(9, 1), (11, 2), (12, 1), (15, 1)],
  term ((-1285632 : Rat) / 2995) [(9, 1), (11, 2), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 742 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0742_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0742
        rs_R010_ueqv_R010NYN_generator_25_0700_0799 =
      rs_R010_ueqv_R010NYN_partial_25_0742 := by
  native_decide

/-- Coefficient term 743 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0743 : Poly :=
[
  term ((1499904 : Rat) / 2995) [(9, 1), (11, 2), (13, 1)]
]

/-- Partial product 743 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0743 : Poly :=
[
  term ((2999808 : Rat) / 2995) [(9, 1), (11, 2), (12, 1), (13, 1)],
  term ((-1499904 : Rat) / 2995) [(9, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 743 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0743_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0743
        rs_R010_ueqv_R010NYN_generator_25_0700_0799 =
      rs_R010_ueqv_R010NYN_partial_25_0743 := by
  native_decide

/-- Coefficient term 744 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0744 : Poly :=
[
  term ((2035584 : Rat) / 2995) [(9, 1), (11, 2), (13, 1), (14, 1)]
]

/-- Partial product 744 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0744 : Poly :=
[
  term ((4071168 : Rat) / 2995) [(9, 1), (11, 2), (12, 1), (13, 1), (14, 1)],
  term ((-2035584 : Rat) / 2995) [(9, 1), (11, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 744 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0744_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0744
        rs_R010_ueqv_R010NYN_generator_25_0700_0799 =
      rs_R010_ueqv_R010NYN_partial_25_0744 := by
  native_decide

/-- Coefficient term 745 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0745 : Poly :=
[
  term ((-8681472 : Rat) / 2995) [(9, 1), (11, 2), (14, 1), (15, 1)]
]

/-- Partial product 745 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0745 : Poly :=
[
  term ((-17362944 : Rat) / 2995) [(9, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((8681472 : Rat) / 2995) [(9, 1), (11, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 745 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0745_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0745
        rs_R010_ueqv_R010NYN_generator_25_0700_0799 =
      rs_R010_ueqv_R010NYN_partial_25_0745 := by
  native_decide

/-- Coefficient term 746 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0746 : Poly :=
[
  term ((1896 : Rat) / 5) [(9, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 746 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0746 : Poly :=
[
  term ((3792 : Rat) / 5) [(9, 1), (11, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1896 : Rat) / 5) [(9, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 746 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0746_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0746
        rs_R010_ueqv_R010NYN_generator_25_0700_0799 =
      rs_R010_ueqv_R010NYN_partial_25_0746 := by
  native_decide

/-- Coefficient term 747 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0747 : Poly :=
[
  term ((-4983552 : Rat) / 2995) [(9, 1), (11, 2), (15, 1)]
]

/-- Partial product 747 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0747 : Poly :=
[
  term ((-9967104 : Rat) / 2995) [(9, 1), (11, 2), (12, 1), (15, 1)],
  term ((4983552 : Rat) / 2995) [(9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 747 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0747_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0747
        rs_R010_ueqv_R010NYN_generator_25_0700_0799 =
      rs_R010_ueqv_R010NYN_partial_25_0747 := by
  native_decide

/-- Coefficient term 748 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0748 : Poly :=
[
  term ((948 : Rat) / 5) [(9, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 748 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0748 : Poly :=
[
  term ((1896 : Rat) / 5) [(9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-948 : Rat) / 5) [(9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 748 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0748_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0748
        rs_R010_ueqv_R010NYN_generator_25_0700_0799 =
      rs_R010_ueqv_R010NYN_partial_25_0748 := by
  native_decide

/-- Coefficient term 749 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0749 : Poly :=
[
  term ((2892672 : Rat) / 2995) [(9, 1), (11, 3)]
]

/-- Partial product 749 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0749 : Poly :=
[
  term ((-2892672 : Rat) / 2995) [(9, 1), (11, 3)],
  term ((5785344 : Rat) / 2995) [(9, 1), (11, 3), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 749 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0749_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0749
        rs_R010_ueqv_R010NYN_generator_25_0700_0799 =
      rs_R010_ueqv_R010NYN_partial_25_0749 := by
  native_decide

/-- Coefficient term 750 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0750 : Poly :=
[
  term ((5785344 : Rat) / 2995) [(9, 1), (11, 3), (14, 1)]
]

/-- Partial product 750 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0750 : Poly :=
[
  term ((11570688 : Rat) / 2995) [(9, 1), (11, 3), (12, 1), (14, 1)],
  term ((-5785344 : Rat) / 2995) [(9, 1), (11, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 750 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0750_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0750
        rs_R010_ueqv_R010NYN_generator_25_0700_0799 =
      rs_R010_ueqv_R010NYN_partial_25_0750 := by
  native_decide

/-- Coefficient term 751 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0751 : Poly :=
[
  term ((-526512 : Rat) / 2995) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 751 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0751 : Poly :=
[
  term ((526512 : Rat) / 2995) [(9, 1), (12, 1), (15, 1)],
  term ((-1053024 : Rat) / 2995) [(9, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 751 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0751_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0751
        rs_R010_ueqv_R010NYN_generator_25_0700_0799 =
      rs_R010_ueqv_R010NYN_partial_25_0751 := by
  native_decide

/-- Coefficient term 752 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0752 : Poly :=
[
  term ((91 : Rat) / 5) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 752 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0752 : Poly :=
[
  term ((-91 : Rat) / 5) [(9, 1), (12, 1), (15, 1), (16, 1)],
  term ((182 : Rat) / 5) [(9, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 752 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0752_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0752
        rs_R010_ueqv_R010NYN_generator_25_0700_0799 =
      rs_R010_ueqv_R010NYN_partial_25_0752 := by
  native_decide

/-- Coefficient term 753 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0753 : Poly :=
[
  term ((-3758 : Rat) / 599) [(9, 1), (13, 1)]
]

/-- Partial product 753 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0753 : Poly :=
[
  term ((-7516 : Rat) / 599) [(9, 1), (12, 1), (13, 1)],
  term ((3758 : Rat) / 599) [(9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 753 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0753_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0753
        rs_R010_ueqv_R010NYN_generator_25_0700_0799 =
      rs_R010_ueqv_R010NYN_partial_25_0753 := by
  native_decide

/-- Coefficient term 754 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0754 : Poly :=
[
  term ((-2068 : Rat) / 599) [(9, 1), (13, 1), (14, 1)]
]

/-- Partial product 754 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0754 : Poly :=
[
  term ((-4136 : Rat) / 599) [(9, 1), (12, 1), (13, 1), (14, 1)],
  term ((2068 : Rat) / 599) [(9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 754 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0754_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0754
        rs_R010_ueqv_R010NYN_generator_25_0700_0799 =
      rs_R010_ueqv_R010NYN_partial_25_0754 := by
  native_decide

/-- Coefficient term 755 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0755 : Poly :=
[
  term ((32832 : Rat) / 2995) [(9, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 755 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0755 : Poly :=
[
  term ((65664 : Rat) / 2995) [(9, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-32832 : Rat) / 2995) [(9, 1), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 755 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0755_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0755
        rs_R010_ueqv_R010NYN_generator_25_0700_0799 =
      rs_R010_ueqv_R010NYN_partial_25_0755 := by
  native_decide

/-- Coefficient term 756 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0756 : Poly :=
[
  term ((4 : Rat) / 5) [(9, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 756 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0756 : Poly :=
[
  term ((8 : Rat) / 5) [(9, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4 : Rat) / 5) [(9, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 756 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0756_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0756
        rs_R010_ueqv_R010NYN_generator_25_0700_0799 =
      rs_R010_ueqv_R010NYN_partial_25_0756 := by
  native_decide

/-- Coefficient term 757 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0757 : Poly :=
[
  term ((147744 : Rat) / 2995) [(9, 1), (13, 1), (15, 2)]
]

/-- Partial product 757 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0757 : Poly :=
[
  term ((295488 : Rat) / 2995) [(9, 1), (12, 1), (13, 1), (15, 2)],
  term ((-147744 : Rat) / 2995) [(9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 757 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0757_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0757
        rs_R010_ueqv_R010NYN_generator_25_0700_0799 =
      rs_R010_ueqv_R010NYN_partial_25_0757 := by
  native_decide

/-- Coefficient term 758 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0758 : Poly :=
[
  term ((18 : Rat) / 5) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 758 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0758 : Poly :=
[
  term ((36 : Rat) / 5) [(9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-18 : Rat) / 5) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 758 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0758_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0758
        rs_R010_ueqv_R010NYN_generator_25_0700_0799 =
      rs_R010_ueqv_R010NYN_partial_25_0758 := by
  native_decide

/-- Coefficient term 759 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0759 : Poly :=
[
  term ((5215248 : Rat) / 2995) [(9, 1), (14, 1), (15, 1)]
]

/-- Partial product 759 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0759 : Poly :=
[
  term ((10430496 : Rat) / 2995) [(9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-5215248 : Rat) / 2995) [(9, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 759 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0759_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0759
        rs_R010_ueqv_R010NYN_generator_25_0700_0799 =
      rs_R010_ueqv_R010NYN_partial_25_0759 := by
  native_decide

/-- Coefficient term 760 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0760 : Poly :=
[
  term ((-1179 : Rat) / 5) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 760 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0760 : Poly :=
[
  term ((-2358 : Rat) / 5) [(9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1179 : Rat) / 5) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 760 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0760_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0760
        rs_R010_ueqv_R010NYN_generator_25_0700_0799 =
      rs_R010_ueqv_R010NYN_partial_25_0760 := by
  native_decide

/-- Coefficient term 761 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0761 : Poly :=
[
  term ((-32832 : Rat) / 2995) [(9, 1), (14, 1), (15, 3)]
]

/-- Partial product 761 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0761 : Poly :=
[
  term ((-65664 : Rat) / 2995) [(9, 1), (12, 1), (14, 1), (15, 3)],
  term ((32832 : Rat) / 2995) [(9, 1), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 761 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0761_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0761
        rs_R010_ueqv_R010NYN_generator_25_0700_0799 =
      rs_R010_ueqv_R010NYN_partial_25_0761 := by
  native_decide

/-- Coefficient term 762 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0762 : Poly :=
[
  term ((-4 : Rat) / 5) [(9, 1), (14, 1), (15, 3), (16, 1)]
]

/-- Partial product 762 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0762 : Poly :=
[
  term ((-8 : Rat) / 5) [(9, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((4 : Rat) / 5) [(9, 1), (14, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 762 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0762_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0762
        rs_R010_ueqv_R010NYN_generator_25_0700_0799 =
      rs_R010_ueqv_R010NYN_partial_25_0762 := by
  native_decide

/-- Coefficient term 763 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0763 : Poly :=
[
  term ((-59580 : Rat) / 599) [(9, 1), (15, 1)]
]

/-- Partial product 763 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0763 : Poly :=
[
  term ((-119160 : Rat) / 599) [(9, 1), (12, 1), (15, 1)],
  term ((59580 : Rat) / 599) [(9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 763 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0763_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0763
        rs_R010_ueqv_R010NYN_generator_25_0700_0799 =
      rs_R010_ueqv_R010NYN_partial_25_0763 := by
  native_decide

/-- Coefficient term 764 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0764 : Poly :=
[
  term (15 : Rat) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 764 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0764 : Poly :=
[
  term (30 : Rat) [(9, 1), (12, 1), (15, 1), (16, 1)],
  term (-15 : Rat) [(9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 764 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0764_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0764
        rs_R010_ueqv_R010NYN_generator_25_0700_0799 =
      rs_R010_ueqv_R010NYN_partial_25_0764 := by
  native_decide

/-- Coefficient term 765 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0765 : Poly :=
[
  term ((-180576 : Rat) / 2995) [(9, 1), (15, 3)]
]

/-- Partial product 765 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0765 : Poly :=
[
  term ((-361152 : Rat) / 2995) [(9, 1), (12, 1), (15, 3)],
  term ((180576 : Rat) / 2995) [(9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 765 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0765_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0765
        rs_R010_ueqv_R010NYN_generator_25_0700_0799 =
      rs_R010_ueqv_R010NYN_partial_25_0765 := by
  native_decide

/-- Coefficient term 766 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0766 : Poly :=
[
  term ((-22 : Rat) / 5) [(9, 1), (15, 3), (16, 1)]
]

/-- Partial product 766 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0766 : Poly :=
[
  term ((-44 : Rat) / 5) [(9, 1), (12, 1), (15, 3), (16, 1)],
  term ((22 : Rat) / 5) [(9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 766 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0766_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0766
        rs_R010_ueqv_R010NYN_generator_25_0700_0799 =
      rs_R010_ueqv_R010NYN_partial_25_0766 := by
  native_decide

/-- Coefficient term 767 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0767 : Poly :=
[
  term ((-1362 : Rat) / 599) [(9, 2)]
]

/-- Partial product 767 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0767 : Poly :=
[
  term ((1362 : Rat) / 599) [(9, 2)],
  term ((-2724 : Rat) / 599) [(9, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 767 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0767_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0767
        rs_R010_ueqv_R010NYN_generator_25_0700_0799 =
      rs_R010_ueqv_R010NYN_partial_25_0767 := by
  native_decide

/-- Coefficient term 768 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0768 : Poly :=
[
  term ((123840 : Rat) / 599) [(9, 2), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 768 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0768 : Poly :=
[
  term ((-123840 : Rat) / 599) [(9, 2), (11, 1), (12, 1), (15, 1)],
  term ((247680 : Rat) / 599) [(9, 2), (11, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 768 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0768_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0768
        rs_R010_ueqv_R010NYN_generator_25_0700_0799 =
      rs_R010_ueqv_R010NYN_partial_25_0768 := by
  native_decide

/-- Coefficient term 769 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0769 : Poly :=
[
  term ((-72 : Rat) / 5) [(9, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 769 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0769 : Poly :=
[
  term ((72 : Rat) / 5) [(9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-144 : Rat) / 5) [(9, 2), (11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 769 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0769_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0769
        rs_R010_ueqv_R010NYN_generator_25_0700_0799 =
      rs_R010_ueqv_R010NYN_partial_25_0769 := by
  native_decide

/-- Coefficient term 770 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0770 : Poly :=
[
  term ((-247680 : Rat) / 599) [(9, 2), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 770 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0770 : Poly :=
[
  term ((-495360 : Rat) / 599) [(9, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((247680 : Rat) / 599) [(9, 2), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 770 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0770_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0770
        rs_R010_ueqv_R010NYN_generator_25_0700_0799 =
      rs_R010_ueqv_R010NYN_partial_25_0770 := by
  native_decide

/-- Coefficient term 771 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0771 : Poly :=
[
  term ((144 : Rat) / 5) [(9, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 771 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0771 : Poly :=
[
  term ((288 : Rat) / 5) [(9, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-144 : Rat) / 5) [(9, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 771 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0771_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0771
        rs_R010_ueqv_R010NYN_generator_25_0700_0799 =
      rs_R010_ueqv_R010NYN_partial_25_0771 := by
  native_decide

/-- Coefficient term 772 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0772 : Poly :=
[
  term ((-61920 : Rat) / 599) [(9, 2), (11, 1), (15, 1)]
]

/-- Partial product 772 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0772 : Poly :=
[
  term ((-123840 : Rat) / 599) [(9, 2), (11, 1), (12, 1), (15, 1)],
  term ((61920 : Rat) / 599) [(9, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 772 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0772_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0772
        rs_R010_ueqv_R010NYN_generator_25_0700_0799 =
      rs_R010_ueqv_R010NYN_partial_25_0772 := by
  native_decide

/-- Coefficient term 773 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0773 : Poly :=
[
  term ((36 : Rat) / 5) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 773 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0773 : Poly :=
[
  term ((72 : Rat) / 5) [(9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-36 : Rat) / 5) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 773 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0773_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0773
        rs_R010_ueqv_R010NYN_generator_25_0700_0799 =
      rs_R010_ueqv_R010NYN_partial_25_0773 := by
  native_decide

/-- Coefficient term 774 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0774 : Poly :=
[
  term ((160704 : Rat) / 2995) [(9, 2), (11, 2)]
]

/-- Partial product 774 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0774 : Poly :=
[
  term ((-160704 : Rat) / 2995) [(9, 2), (11, 2)],
  term ((321408 : Rat) / 2995) [(9, 2), (11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 774 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0774_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0774
        rs_R010_ueqv_R010NYN_generator_25_0700_0799 =
      rs_R010_ueqv_R010NYN_partial_25_0774 := by
  native_decide

/-- Coefficient term 775 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0775 : Poly :=
[
  term ((-321408 : Rat) / 2995) [(9, 2), (11, 2), (12, 1)]
]

/-- Partial product 775 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0775 : Poly :=
[
  term ((321408 : Rat) / 2995) [(9, 2), (11, 2), (12, 1)],
  term ((-642816 : Rat) / 2995) [(9, 2), (11, 2), (12, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 775 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0775_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0775
        rs_R010_ueqv_R010NYN_generator_25_0700_0799 =
      rs_R010_ueqv_R010NYN_partial_25_0775 := by
  native_decide

/-- Coefficient term 776 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0776 : Poly :=
[
  term ((642816 : Rat) / 2995) [(9, 2), (11, 2), (14, 1)]
]

/-- Partial product 776 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0776 : Poly :=
[
  term ((1285632 : Rat) / 2995) [(9, 2), (11, 2), (12, 1), (14, 1)],
  term ((-642816 : Rat) / 2995) [(9, 2), (11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 776 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0776_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0776
        rs_R010_ueqv_R010NYN_generator_25_0700_0799 =
      rs_R010_ueqv_R010NYN_partial_25_0776 := by
  native_decide

/-- Coefficient term 777 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0777 : Poly :=
[
  term ((2724 : Rat) / 599) [(9, 2), (12, 1)]
]

/-- Partial product 777 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0777 : Poly :=
[
  term ((-2724 : Rat) / 599) [(9, 2), (12, 1)],
  term ((5448 : Rat) / 599) [(9, 2), (12, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 777 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0777_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0777
        rs_R010_ueqv_R010NYN_generator_25_0700_0799 =
      rs_R010_ueqv_R010NYN_partial_25_0777 := by
  native_decide

/-- Coefficient term 778 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0778 : Poly :=
[
  term ((-131328 : Rat) / 2995) [(9, 2), (12, 1), (15, 2)]
]

/-- Partial product 778 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0778 : Poly :=
[
  term ((131328 : Rat) / 2995) [(9, 2), (12, 1), (15, 2)],
  term ((-262656 : Rat) / 2995) [(9, 2), (12, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 778 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0778_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0778
        rs_R010_ueqv_R010NYN_generator_25_0700_0799 =
      rs_R010_ueqv_R010NYN_partial_25_0778 := by
  native_decide

/-- Coefficient term 779 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0779 : Poly :=
[
  term ((-16 : Rat) / 5) [(9, 2), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 779 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0779 : Poly :=
[
  term ((16 : Rat) / 5) [(9, 2), (12, 1), (15, 2), (16, 1)],
  term ((-32 : Rat) / 5) [(9, 2), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 779 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0779_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0779
        rs_R010_ueqv_R010NYN_generator_25_0700_0799 =
      rs_R010_ueqv_R010NYN_partial_25_0779 := by
  native_decide

/-- Coefficient term 780 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0780 : Poly :=
[
  term ((-5448 : Rat) / 599) [(9, 2), (14, 1)]
]

/-- Partial product 780 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0780 : Poly :=
[
  term ((-10896 : Rat) / 599) [(9, 2), (12, 1), (14, 1)],
  term ((5448 : Rat) / 599) [(9, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 780 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0780_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0780
        rs_R010_ueqv_R010NYN_generator_25_0700_0799 =
      rs_R010_ueqv_R010NYN_partial_25_0780 := by
  native_decide

/-- Coefficient term 781 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0781 : Poly :=
[
  term ((262656 : Rat) / 2995) [(9, 2), (14, 1), (15, 2)]
]

/-- Partial product 781 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0781 : Poly :=
[
  term ((525312 : Rat) / 2995) [(9, 2), (12, 1), (14, 1), (15, 2)],
  term ((-262656 : Rat) / 2995) [(9, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 781 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0781_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0781
        rs_R010_ueqv_R010NYN_generator_25_0700_0799 =
      rs_R010_ueqv_R010NYN_partial_25_0781 := by
  native_decide

/-- Coefficient term 782 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0782 : Poly :=
[
  term ((32 : Rat) / 5) [(9, 2), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 782 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0782 : Poly :=
[
  term ((64 : Rat) / 5) [(9, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-32 : Rat) / 5) [(9, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 782 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0782_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0782
        rs_R010_ueqv_R010NYN_generator_25_0700_0799 =
      rs_R010_ueqv_R010NYN_partial_25_0782 := by
  native_decide

/-- Coefficient term 783 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0783 : Poly :=
[
  term ((65664 : Rat) / 2995) [(9, 2), (15, 2)]
]

/-- Partial product 783 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0783 : Poly :=
[
  term ((131328 : Rat) / 2995) [(9, 2), (12, 1), (15, 2)],
  term ((-65664 : Rat) / 2995) [(9, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 783 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0783_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0783
        rs_R010_ueqv_R010NYN_generator_25_0700_0799 =
      rs_R010_ueqv_R010NYN_partial_25_0783 := by
  native_decide

/-- Coefficient term 784 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0784 : Poly :=
[
  term ((8 : Rat) / 5) [(9, 2), (15, 2), (16, 1)]
]

/-- Partial product 784 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0784 : Poly :=
[
  term ((16 : Rat) / 5) [(9, 2), (12, 1), (15, 2), (16, 1)],
  term ((-8 : Rat) / 5) [(9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 784 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0784_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0784
        rs_R010_ueqv_R010NYN_generator_25_0700_0799 =
      rs_R010_ueqv_R010NYN_partial_25_0784 := by
  native_decide

/-- Coefficient term 785 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0785 : Poly :=
[
  term (-6 : Rat) [(10, 1)]
]

/-- Partial product 785 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0785 : Poly :=
[
  term (6 : Rat) [(10, 1)],
  term (-12 : Rat) [(10, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 785 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0785_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0785
        rs_R010_ueqv_R010NYN_generator_25_0700_0799 =
      rs_R010_ueqv_R010NYN_partial_25_0785 := by
  native_decide

/-- Coefficient term 786 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0786 : Poly :=
[
  term ((1232064 : Rat) / 2995) [(10, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 786 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0786 : Poly :=
[
  term ((-1232064 : Rat) / 2995) [(10, 1), (11, 1), (12, 1), (15, 1)],
  term ((2464128 : Rat) / 2995) [(10, 1), (11, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 786 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0786_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0786
        rs_R010_ueqv_R010NYN_generator_25_0700_0799 =
      rs_R010_ueqv_R010NYN_partial_25_0786 := by
  native_decide

/-- Coefficient term 787 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0787 : Poly :=
[
  term ((-53568 : Rat) / 599) [(10, 1), (11, 1), (13, 1)]
]

/-- Partial product 787 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0787 : Poly :=
[
  term ((-107136 : Rat) / 599) [(10, 1), (11, 1), (12, 1), (13, 1)],
  term ((53568 : Rat) / 599) [(10, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 787 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0787_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0787
        rs_R010_ueqv_R010NYN_generator_25_0700_0799 =
      rs_R010_ueqv_R010NYN_partial_25_0787 := by
  native_decide

/-- Coefficient term 788 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0788 : Poly :=
[
  term ((-1232064 : Rat) / 2995) [(10, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 788 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0788 : Poly :=
[
  term ((-2464128 : Rat) / 2995) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((1232064 : Rat) / 2995) [(10, 1), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 788 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0788_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0788
        rs_R010_ueqv_R010NYN_generator_25_0700_0799 =
      rs_R010_ueqv_R010NYN_partial_25_0788 := by
  native_decide

/-- Coefficient term 789 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0789 : Poly :=
[
  term ((-4983552 : Rat) / 2995) [(10, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 789 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0789 : Poly :=
[
  term ((-9967104 : Rat) / 2995) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((4983552 : Rat) / 2995) [(10, 1), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 789 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0789_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0789
        rs_R010_ueqv_R010NYN_generator_25_0700_0799 =
      rs_R010_ueqv_R010NYN_partial_25_0789 := by
  native_decide

/-- Coefficient term 790 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0790 : Poly :=
[
  term ((948 : Rat) / 5) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 790 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0790 : Poly :=
[
  term ((1896 : Rat) / 5) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-948 : Rat) / 5) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 790 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0790_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0790
        rs_R010_ueqv_R010NYN_generator_25_0700_0799 =
      rs_R010_ueqv_R010NYN_partial_25_0790 := by
  native_decide

/-- Coefficient term 791 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0791 : Poly :=
[
  term ((214272 : Rat) / 2995) [(10, 1), (11, 1), (15, 1)]
]

/-- Partial product 791 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0791 : Poly :=
[
  term ((428544 : Rat) / 2995) [(10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-214272 : Rat) / 2995) [(10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 791 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0791_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0791
        rs_R010_ueqv_R010NYN_generator_25_0700_0799 =
      rs_R010_ueqv_R010NYN_partial_25_0791 := by
  native_decide

/-- Coefficient term 792 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0792 : Poly :=
[
  term ((2892672 : Rat) / 2995) [(10, 1), (11, 2), (14, 1)]
]

/-- Partial product 792 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0792 : Poly :=
[
  term ((5785344 : Rat) / 2995) [(10, 1), (11, 2), (12, 1), (14, 1)],
  term ((-2892672 : Rat) / 2995) [(10, 1), (11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 792 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0792_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0792
        rs_R010_ueqv_R010NYN_generator_25_0700_0799 =
      rs_R010_ueqv_R010NYN_partial_25_0792 := by
  native_decide

/-- Coefficient term 793 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0793 : Poly :=
[
  term ((-1293312 : Rat) / 2995) [(10, 1), (12, 1), (15, 2)]
]

/-- Partial product 793 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0793 : Poly :=
[
  term ((1293312 : Rat) / 2995) [(10, 1), (12, 1), (15, 2)],
  term ((-2586624 : Rat) / 2995) [(10, 1), (12, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 793 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0793_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0793
        rs_R010_ueqv_R010NYN_generator_25_0700_0799 =
      rs_R010_ueqv_R010NYN_partial_25_0793 := by
  native_decide

/-- Coefficient term 794 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0794 : Poly :=
[
  term ((326 : Rat) / 5) [(10, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 794 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0794 : Poly :=
[
  term ((-326 : Rat) / 5) [(10, 1), (12, 1), (15, 2), (16, 1)],
  term ((652 : Rat) / 5) [(10, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 794 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0794_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0794
        rs_R010_ueqv_R010NYN_generator_25_0700_0799 =
      rs_R010_ueqv_R010NYN_partial_25_0794 := by
  native_decide

/-- Coefficient term 795 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0795 : Poly :=
[
  term ((1293312 : Rat) / 2995) [(10, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 795 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0795 : Poly :=
[
  term ((2586624 : Rat) / 2995) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1293312 : Rat) / 2995) [(10, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 795 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0795_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0795
        rs_R010_ueqv_R010NYN_generator_25_0700_0799 =
      rs_R010_ueqv_R010NYN_partial_25_0795 := by
  native_decide

/-- Coefficient term 796 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0796 : Poly :=
[
  term ((-326 : Rat) / 5) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 796 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0796 : Poly :=
[
  term ((-652 : Rat) / 5) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((326 : Rat) / 5) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 796 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0796_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0796
        rs_R010_ueqv_R010NYN_generator_25_0700_0799 =
      rs_R010_ueqv_R010NYN_partial_25_0796 := by
  native_decide

/-- Coefficient term 797 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0797 : Poly :=
[
  term ((49632 : Rat) / 599) [(10, 1), (13, 1), (15, 1)]
]

/-- Partial product 797 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0797 : Poly :=
[
  term ((99264 : Rat) / 599) [(10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-49632 : Rat) / 599) [(10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 797 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0797_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0797
        rs_R010_ueqv_R010NYN_generator_25_0700_0799 =
      rs_R010_ueqv_R010NYN_partial_25_0797 := by
  native_decide

/-- Coefficient term 798 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0798 : Poly :=
[
  term (-16 : Rat) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 798 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0798 : Poly :=
[
  term (-32 : Rat) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (16 : Rat) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 798 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0798_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0798
        rs_R010_ueqv_R010NYN_generator_25_0700_0799 =
      rs_R010_ueqv_R010NYN_partial_25_0798 := by
  native_decide

/-- Coefficient term 799 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0799 : Poly :=
[
  term ((-19275 : Rat) / 599) [(10, 1), (14, 1)]
]

/-- Partial product 799 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0799 : Poly :=
[
  term ((-38550 : Rat) / 599) [(10, 1), (12, 1), (14, 1)],
  term ((19275 : Rat) / 599) [(10, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 799 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0799_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0799
        rs_R010_ueqv_R010NYN_generator_25_0700_0799 =
      rs_R010_ueqv_R010NYN_partial_25_0799 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010NYN_partials_25_0700_0799 : List Poly :=
[
  rs_R010_ueqv_R010NYN_partial_25_0700,
  rs_R010_ueqv_R010NYN_partial_25_0701,
  rs_R010_ueqv_R010NYN_partial_25_0702,
  rs_R010_ueqv_R010NYN_partial_25_0703,
  rs_R010_ueqv_R010NYN_partial_25_0704,
  rs_R010_ueqv_R010NYN_partial_25_0705,
  rs_R010_ueqv_R010NYN_partial_25_0706,
  rs_R010_ueqv_R010NYN_partial_25_0707,
  rs_R010_ueqv_R010NYN_partial_25_0708,
  rs_R010_ueqv_R010NYN_partial_25_0709,
  rs_R010_ueqv_R010NYN_partial_25_0710,
  rs_R010_ueqv_R010NYN_partial_25_0711,
  rs_R010_ueqv_R010NYN_partial_25_0712,
  rs_R010_ueqv_R010NYN_partial_25_0713,
  rs_R010_ueqv_R010NYN_partial_25_0714,
  rs_R010_ueqv_R010NYN_partial_25_0715,
  rs_R010_ueqv_R010NYN_partial_25_0716,
  rs_R010_ueqv_R010NYN_partial_25_0717,
  rs_R010_ueqv_R010NYN_partial_25_0718,
  rs_R010_ueqv_R010NYN_partial_25_0719,
  rs_R010_ueqv_R010NYN_partial_25_0720,
  rs_R010_ueqv_R010NYN_partial_25_0721,
  rs_R010_ueqv_R010NYN_partial_25_0722,
  rs_R010_ueqv_R010NYN_partial_25_0723,
  rs_R010_ueqv_R010NYN_partial_25_0724,
  rs_R010_ueqv_R010NYN_partial_25_0725,
  rs_R010_ueqv_R010NYN_partial_25_0726,
  rs_R010_ueqv_R010NYN_partial_25_0727,
  rs_R010_ueqv_R010NYN_partial_25_0728,
  rs_R010_ueqv_R010NYN_partial_25_0729,
  rs_R010_ueqv_R010NYN_partial_25_0730,
  rs_R010_ueqv_R010NYN_partial_25_0731,
  rs_R010_ueqv_R010NYN_partial_25_0732,
  rs_R010_ueqv_R010NYN_partial_25_0733,
  rs_R010_ueqv_R010NYN_partial_25_0734,
  rs_R010_ueqv_R010NYN_partial_25_0735,
  rs_R010_ueqv_R010NYN_partial_25_0736,
  rs_R010_ueqv_R010NYN_partial_25_0737,
  rs_R010_ueqv_R010NYN_partial_25_0738,
  rs_R010_ueqv_R010NYN_partial_25_0739,
  rs_R010_ueqv_R010NYN_partial_25_0740,
  rs_R010_ueqv_R010NYN_partial_25_0741,
  rs_R010_ueqv_R010NYN_partial_25_0742,
  rs_R010_ueqv_R010NYN_partial_25_0743,
  rs_R010_ueqv_R010NYN_partial_25_0744,
  rs_R010_ueqv_R010NYN_partial_25_0745,
  rs_R010_ueqv_R010NYN_partial_25_0746,
  rs_R010_ueqv_R010NYN_partial_25_0747,
  rs_R010_ueqv_R010NYN_partial_25_0748,
  rs_R010_ueqv_R010NYN_partial_25_0749,
  rs_R010_ueqv_R010NYN_partial_25_0750,
  rs_R010_ueqv_R010NYN_partial_25_0751,
  rs_R010_ueqv_R010NYN_partial_25_0752,
  rs_R010_ueqv_R010NYN_partial_25_0753,
  rs_R010_ueqv_R010NYN_partial_25_0754,
  rs_R010_ueqv_R010NYN_partial_25_0755,
  rs_R010_ueqv_R010NYN_partial_25_0756,
  rs_R010_ueqv_R010NYN_partial_25_0757,
  rs_R010_ueqv_R010NYN_partial_25_0758,
  rs_R010_ueqv_R010NYN_partial_25_0759,
  rs_R010_ueqv_R010NYN_partial_25_0760,
  rs_R010_ueqv_R010NYN_partial_25_0761,
  rs_R010_ueqv_R010NYN_partial_25_0762,
  rs_R010_ueqv_R010NYN_partial_25_0763,
  rs_R010_ueqv_R010NYN_partial_25_0764,
  rs_R010_ueqv_R010NYN_partial_25_0765,
  rs_R010_ueqv_R010NYN_partial_25_0766,
  rs_R010_ueqv_R010NYN_partial_25_0767,
  rs_R010_ueqv_R010NYN_partial_25_0768,
  rs_R010_ueqv_R010NYN_partial_25_0769,
  rs_R010_ueqv_R010NYN_partial_25_0770,
  rs_R010_ueqv_R010NYN_partial_25_0771,
  rs_R010_ueqv_R010NYN_partial_25_0772,
  rs_R010_ueqv_R010NYN_partial_25_0773,
  rs_R010_ueqv_R010NYN_partial_25_0774,
  rs_R010_ueqv_R010NYN_partial_25_0775,
  rs_R010_ueqv_R010NYN_partial_25_0776,
  rs_R010_ueqv_R010NYN_partial_25_0777,
  rs_R010_ueqv_R010NYN_partial_25_0778,
  rs_R010_ueqv_R010NYN_partial_25_0779,
  rs_R010_ueqv_R010NYN_partial_25_0780,
  rs_R010_ueqv_R010NYN_partial_25_0781,
  rs_R010_ueqv_R010NYN_partial_25_0782,
  rs_R010_ueqv_R010NYN_partial_25_0783,
  rs_R010_ueqv_R010NYN_partial_25_0784,
  rs_R010_ueqv_R010NYN_partial_25_0785,
  rs_R010_ueqv_R010NYN_partial_25_0786,
  rs_R010_ueqv_R010NYN_partial_25_0787,
  rs_R010_ueqv_R010NYN_partial_25_0788,
  rs_R010_ueqv_R010NYN_partial_25_0789,
  rs_R010_ueqv_R010NYN_partial_25_0790,
  rs_R010_ueqv_R010NYN_partial_25_0791,
  rs_R010_ueqv_R010NYN_partial_25_0792,
  rs_R010_ueqv_R010NYN_partial_25_0793,
  rs_R010_ueqv_R010NYN_partial_25_0794,
  rs_R010_ueqv_R010NYN_partial_25_0795,
  rs_R010_ueqv_R010NYN_partial_25_0796,
  rs_R010_ueqv_R010NYN_partial_25_0797,
  rs_R010_ueqv_R010NYN_partial_25_0798,
  rs_R010_ueqv_R010NYN_partial_25_0799
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010NYN_block_25_0700_0799 : Poly :=
[
  term ((17255808 : Rat) / 2995) [(8, 1), (11, 2), (12, 1), (15, 2)],
  term ((-3792 : Rat) / 5) [(8, 1), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((-8627904 : Rat) / 2995) [(8, 1), (11, 2), (15, 2)],
  term ((1896 : Rat) / 5) [(8, 1), (11, 2), (15, 2), (16, 1)],
  term ((-11570688 : Rat) / 2995) [(8, 1), (11, 3), (12, 1), (15, 1)],
  term ((5785344 : Rat) / 2995) [(8, 1), (11, 3), (15, 1)],
  term ((152832 : Rat) / 599) [(8, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term (-20 : Rat) [(8, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((667664 : Rat) / 2995) [(8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-132 : Rat) / 5) [(8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((11400 : Rat) / 599) [(8, 1), (12, 1), (14, 1)],
  term ((1838208 : Rat) / 2995) [(8, 1), (12, 1), (14, 1), (15, 2)],
  term ((-424 : Rat) / 5) [(8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-5771656 : Rat) / 2995) [(8, 1), (12, 1), (15, 2)],
  term ((1218 : Rat) / 5) [(8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-2602368 : Rat) / 2995) [(8, 1), (12, 2), (15, 2)],
  term ((524 : Rat) / 5) [(8, 1), (12, 2), (15, 2), (16, 1)],
  term ((-76416 : Rat) / 599) [(8, 1), (13, 1), (14, 1), (15, 1)],
  term (10 : Rat) [(8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-333832 : Rat) / 2995) [(8, 1), (13, 1), (15, 1)],
  term ((66 : Rat) / 5) [(8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5700 : Rat) / 599) [(8, 1), (14, 1)],
  term ((-919104 : Rat) / 2995) [(8, 1), (14, 1), (15, 2)],
  term ((212 : Rat) / 5) [(8, 1), (14, 1), (15, 2), (16, 1)],
  term ((707284 : Rat) / 599) [(8, 1), (15, 2)],
  term (-148 : Rat) [(8, 1), (15, 2), (16, 1)],
  term ((1362 : Rat) / 599) [(8, 2)],
  term ((2249856 : Rat) / 2995) [(8, 2), (11, 1), (12, 1), (13, 1)],
  term ((-3140352 : Rat) / 599) [(8, 2), (11, 1), (12, 1), (15, 1)],
  term ((264 : Rat) / 5) [(8, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1124928 : Rat) / 2995) [(8, 2), (11, 1), (13, 1)],
  term ((1570176 : Rat) / 599) [(8, 2), (11, 1), (15, 1)],
  term ((-132 : Rat) / 5) [(8, 2), (11, 1), (15, 1), (16, 1)],
  term ((-321408 : Rat) / 2995) [(8, 2), (11, 2)],
  term ((642816 : Rat) / 2995) [(8, 2), (11, 2), (12, 1)],
  term ((-2724 : Rat) / 599) [(8, 2), (12, 1)],
  term ((-2602368 : Rat) / 2995) [(8, 2), (12, 1), (13, 1), (15, 1)],
  term ((524 : Rat) / 5) [(8, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((16916736 : Rat) / 2995) [(8, 2), (12, 1), (15, 2)],
  term ((-3848 : Rat) / 5) [(8, 2), (12, 1), (15, 2), (16, 1)],
  term ((1301184 : Rat) / 2995) [(8, 2), (13, 1), (15, 1)],
  term ((-262 : Rat) / 5) [(8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-8458368 : Rat) / 2995) [(8, 2), (15, 2)],
  term ((1924 : Rat) / 5) [(8, 2), (15, 2), (16, 1)],
  term ((964224 : Rat) / 2995) [(9, 1), (10, 1), (11, 1), (12, 1)],
  term ((1285632 : Rat) / 2995) [(9, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((-1928448 : Rat) / 2995) [(9, 1), (10, 1), (11, 1), (12, 2)],
  term ((-642816 : Rat) / 2995) [(9, 1), (10, 1), (11, 1), (14, 1)],
  term ((-1423296 : Rat) / 2995) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((308 : Rat) / 5) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1045152 : Rat) / 2995) [(9, 1), (10, 1), (12, 1), (15, 1)],
  term ((206 : Rat) / 5) [(9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((2090304 : Rat) / 2995) [(9, 1), (10, 1), (12, 2), (15, 1)],
  term ((-412 : Rat) / 5) [(9, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((711648 : Rat) / 2995) [(9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-154 : Rat) / 5) [(9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-63744 : Rat) / 599) [(9, 1), (11, 1)],
  term ((119616 : Rat) / 2995) [(9, 1), (11, 1), (12, 1)],
  term ((-4486272 : Rat) / 2995) [(9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((1192 : Rat) / 5) [(9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-798720 : Rat) / 599) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((932 : Rat) / 5) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-10099392 : Rat) / 2995) [(9, 1), (11, 1), (12, 1), (14, 1)],
  term ((6991488 : Rat) / 2995) [(9, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term (-264 : Rat) [(9, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((5055552 : Rat) / 2995) [(9, 1), (11, 1), (12, 1), (15, 2)],
  term ((-804 : Rat) / 5) [(9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((1035648 : Rat) / 2995) [(9, 1), (11, 1), (12, 2)],
  term ((1512576 : Rat) / 2995) [(9, 1), (11, 1), (12, 2), (15, 2)],
  term ((-408 : Rat) / 5) [(9, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((2243136 : Rat) / 2995) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-596 : Rat) / 5) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((399360 : Rat) / 599) [(9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-466 : Rat) / 5) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((5049696 : Rat) / 2995) [(9, 1), (11, 1), (14, 1)],
  term ((-3495744 : Rat) / 2995) [(9, 1), (11, 1), (14, 1), (15, 2)],
  term (132 : Rat) [(9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-581184 : Rat) / 599) [(9, 1), (11, 1), (15, 2)],
  term ((504 : Rat) / 5) [(9, 1), (11, 1), (15, 2), (16, 1)],
  term ((2999808 : Rat) / 2995) [(9, 1), (11, 2), (12, 1), (13, 1)],
  term ((4071168 : Rat) / 2995) [(9, 1), (11, 2), (12, 1), (13, 1), (14, 1)],
  term ((-17362944 : Rat) / 2995) [(9, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((3792 : Rat) / 5) [(9, 1), (11, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9324288 : Rat) / 2995) [(9, 1), (11, 2), (12, 1), (15, 1)],
  term ((1896 : Rat) / 5) [(9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-1285632 : Rat) / 2995) [(9, 1), (11, 2), (12, 2), (15, 1)],
  term ((-1499904 : Rat) / 2995) [(9, 1), (11, 2), (13, 1)],
  term ((-2035584 : Rat) / 2995) [(9, 1), (11, 2), (13, 1), (14, 1)],
  term ((8681472 : Rat) / 2995) [(9, 1), (11, 2), (14, 1), (15, 1)],
  term ((-1896 : Rat) / 5) [(9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((4983552 : Rat) / 2995) [(9, 1), (11, 2), (15, 1)],
  term ((-948 : Rat) / 5) [(9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-2892672 : Rat) / 2995) [(9, 1), (11, 3)],
  term ((5785344 : Rat) / 2995) [(9, 1), (11, 3), (12, 1)],
  term ((11570688 : Rat) / 2995) [(9, 1), (11, 3), (12, 1), (14, 1)],
  term ((-5785344 : Rat) / 2995) [(9, 1), (11, 3), (14, 1)],
  term ((-7516 : Rat) / 599) [(9, 1), (12, 1), (13, 1)],
  term ((-4136 : Rat) / 599) [(9, 1), (12, 1), (13, 1), (14, 1)],
  term ((65664 : Rat) / 2995) [(9, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((8 : Rat) / 5) [(9, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((295488 : Rat) / 2995) [(9, 1), (12, 1), (13, 1), (15, 2)],
  term ((36 : Rat) / 5) [(9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((10430496 : Rat) / 2995) [(9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-2358 : Rat) / 5) [(9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-65664 : Rat) / 2995) [(9, 1), (12, 1), (14, 1), (15, 3)],
  term ((-8 : Rat) / 5) [(9, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-69288 : Rat) / 2995) [(9, 1), (12, 1), (15, 1)],
  term ((59 : Rat) / 5) [(9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-361152 : Rat) / 2995) [(9, 1), (12, 1), (15, 3)],
  term ((-44 : Rat) / 5) [(9, 1), (12, 1), (15, 3), (16, 1)],
  term ((-1053024 : Rat) / 2995) [(9, 1), (12, 2), (15, 1)],
  term ((182 : Rat) / 5) [(9, 1), (12, 2), (15, 1), (16, 1)],
  term ((3758 : Rat) / 599) [(9, 1), (13, 1)],
  term ((2068 : Rat) / 599) [(9, 1), (13, 1), (14, 1)],
  term ((-32832 : Rat) / 2995) [(9, 1), (13, 1), (14, 1), (15, 2)],
  term ((-4 : Rat) / 5) [(9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-147744 : Rat) / 2995) [(9, 1), (13, 1), (15, 2)],
  term ((-18 : Rat) / 5) [(9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-5215248 : Rat) / 2995) [(9, 1), (14, 1), (15, 1)],
  term ((1179 : Rat) / 5) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term ((32832 : Rat) / 2995) [(9, 1), (14, 1), (15, 3)],
  term ((4 : Rat) / 5) [(9, 1), (14, 1), (15, 3), (16, 1)],
  term ((59580 : Rat) / 599) [(9, 1), (15, 1)],
  term (-15 : Rat) [(9, 1), (15, 1), (16, 1)],
  term ((180576 : Rat) / 2995) [(9, 1), (15, 3)],
  term ((22 : Rat) / 5) [(9, 1), (15, 3), (16, 1)],
  term ((1362 : Rat) / 599) [(9, 2)],
  term ((-495360 : Rat) / 599) [(9, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((288 : Rat) / 5) [(9, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-247680 : Rat) / 599) [(9, 2), (11, 1), (12, 1), (15, 1)],
  term ((144 : Rat) / 5) [(9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((247680 : Rat) / 599) [(9, 2), (11, 1), (12, 2), (15, 1)],
  term ((-144 : Rat) / 5) [(9, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((247680 : Rat) / 599) [(9, 2), (11, 1), (14, 1), (15, 1)],
  term ((-144 : Rat) / 5) [(9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((61920 : Rat) / 599) [(9, 2), (11, 1), (15, 1)],
  term ((-36 : Rat) / 5) [(9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-160704 : Rat) / 2995) [(9, 2), (11, 2)],
  term ((642816 : Rat) / 2995) [(9, 2), (11, 2), (12, 1)],
  term ((1285632 : Rat) / 2995) [(9, 2), (11, 2), (12, 1), (14, 1)],
  term ((-642816 : Rat) / 2995) [(9, 2), (11, 2), (12, 2)],
  term ((-642816 : Rat) / 2995) [(9, 2), (11, 2), (14, 1)],
  term ((-5448 : Rat) / 599) [(9, 2), (12, 1)],
  term ((-10896 : Rat) / 599) [(9, 2), (12, 1), (14, 1)],
  term ((525312 : Rat) / 2995) [(9, 2), (12, 1), (14, 1), (15, 2)],
  term ((64 : Rat) / 5) [(9, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((262656 : Rat) / 2995) [(9, 2), (12, 1), (15, 2)],
  term ((32 : Rat) / 5) [(9, 2), (12, 1), (15, 2), (16, 1)],
  term ((5448 : Rat) / 599) [(9, 2), (12, 2)],
  term ((-262656 : Rat) / 2995) [(9, 2), (12, 2), (15, 2)],
  term ((-32 : Rat) / 5) [(9, 2), (12, 2), (15, 2), (16, 1)],
  term ((5448 : Rat) / 599) [(9, 2), (14, 1)],
  term ((-262656 : Rat) / 2995) [(9, 2), (14, 1), (15, 2)],
  term ((-32 : Rat) / 5) [(9, 2), (14, 1), (15, 2), (16, 1)],
  term ((-65664 : Rat) / 2995) [(9, 2), (15, 2)],
  term ((-8 : Rat) / 5) [(9, 2), (15, 2), (16, 1)],
  term (6 : Rat) [(10, 1)],
  term ((-107136 : Rat) / 599) [(10, 1), (11, 1), (12, 1), (13, 1)],
  term ((-2464128 : Rat) / 2995) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-9967104 : Rat) / 2995) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((1896 : Rat) / 5) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-160704 : Rat) / 599) [(10, 1), (11, 1), (12, 1), (15, 1)],
  term ((2464128 : Rat) / 2995) [(10, 1), (11, 1), (12, 2), (15, 1)],
  term ((53568 : Rat) / 599) [(10, 1), (11, 1), (13, 1)],
  term ((1232064 : Rat) / 2995) [(10, 1), (11, 1), (13, 1), (14, 1)],
  term ((4983552 : Rat) / 2995) [(10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-948 : Rat) / 5) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-214272 : Rat) / 2995) [(10, 1), (11, 1), (15, 1)],
  term ((5785344 : Rat) / 2995) [(10, 1), (11, 2), (12, 1), (14, 1)],
  term ((-2892672 : Rat) / 2995) [(10, 1), (11, 2), (14, 1)],
  term (-12 : Rat) [(10, 1), (12, 1)],
  term ((2586624 : Rat) / 2995) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-652 : Rat) / 5) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((99264 : Rat) / 599) [(10, 1), (12, 1), (13, 1), (15, 1)],
  term (-32 : Rat) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-38550 : Rat) / 599) [(10, 1), (12, 1), (14, 1)],
  term ((1293312 : Rat) / 2995) [(10, 1), (12, 1), (15, 2)],
  term ((-326 : Rat) / 5) [(10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-2586624 : Rat) / 2995) [(10, 1), (12, 2), (15, 2)],
  term ((652 : Rat) / 5) [(10, 1), (12, 2), (15, 2), (16, 1)],
  term ((-1293312 : Rat) / 2995) [(10, 1), (13, 1), (14, 1), (15, 1)],
  term ((326 : Rat) / 5) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-49632 : Rat) / 599) [(10, 1), (13, 1), (15, 1)],
  term (16 : Rat) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term ((19275 : Rat) / 599) [(10, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 25, terms 700 through 799. -/
theorem rs_R010_ueqv_R010NYN_block_25_0700_0799_valid :
    checkProductSumEq rs_R010_ueqv_R010NYN_partials_25_0700_0799
      rs_R010_ueqv_R010NYN_block_25_0700_0799 = true := by
  native_decide

end R010UeqvR010NYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
