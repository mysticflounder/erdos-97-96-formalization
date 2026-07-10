/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R005:u=v:R005NYN, term block 5:700-799

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R005UeqvR005NYNTermShards

/-- Generator polynomial 5 for relaxed split surplus certificate `R005:u=v:R005NYN`. -/
def rs_R005_ueqv_R005NYN_generator_05_0700_0799 : Poly :=
[
  term (-2 : Rat) [(2, 1)],
  term (1 : Rat) [(2, 2)],
  term (1 : Rat) [(3, 2)],
  term (2 : Rat) [(14, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 700 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0700 : Poly :=
[
  term ((-4718720 : Rat) / 52799) [(1, 1), (5, 1), (6, 1), (8, 1), (15, 2)]
]

/-- Partial product 700 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0700 : Poly :=
[
  term ((9437440 : Rat) / 52799) [(1, 1), (2, 1), (5, 1), (6, 1), (8, 1), (15, 2)],
  term ((-4718720 : Rat) / 52799) [(1, 1), (2, 2), (5, 1), (6, 1), (8, 1), (15, 2)],
  term ((-4718720 : Rat) / 52799) [(1, 1), (3, 2), (5, 1), (6, 1), (8, 1), (15, 2)],
  term ((-9437440 : Rat) / 52799) [(1, 1), (5, 1), (6, 1), (8, 1), (14, 1), (15, 2)],
  term ((4718720 : Rat) / 52799) [(1, 1), (5, 1), (6, 1), (8, 1), (14, 2), (15, 2)],
  term ((4718720 : Rat) / 52799) [(1, 1), (5, 1), (6, 1), (8, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 700 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0700_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0700
        rs_R005_ueqv_R005NYN_generator_05_0700_0799 =
      rs_R005_ueqv_R005NYN_partial_05_0700 := by
  native_decide

/-- Coefficient term 701 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0701 : Poly :=
[
  term ((65940144 : Rat) / 385571) [(1, 1), (5, 1), (6, 1), (8, 1), (15, 2), (16, 1)]
]

/-- Partial product 701 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0701 : Poly :=
[
  term ((-131880288 : Rat) / 385571) [(1, 1), (2, 1), (5, 1), (6, 1), (8, 1), (15, 2), (16, 1)],
  term ((65940144 : Rat) / 385571) [(1, 1), (2, 2), (5, 1), (6, 1), (8, 1), (15, 2), (16, 1)],
  term ((65940144 : Rat) / 385571) [(1, 1), (3, 2), (5, 1), (6, 1), (8, 1), (15, 2), (16, 1)],
  term ((131880288 : Rat) / 385571) [(1, 1), (5, 1), (6, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-65940144 : Rat) / 385571) [(1, 1), (5, 1), (6, 1), (8, 1), (14, 2), (15, 2), (16, 1)],
  term ((-65940144 : Rat) / 385571) [(1, 1), (5, 1), (6, 1), (8, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 701 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0701_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0701
        rs_R005_ueqv_R005NYN_generator_05_0700_0799 =
      rs_R005_ueqv_R005NYN_partial_05_0701 := by
  native_decide

/-- Coefficient term 702 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0702 : Poly :=
[
  term ((2359360 : Rat) / 52799) [(1, 1), (5, 1), (6, 1), (9, 1), (15, 1)]
]

/-- Partial product 702 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0702 : Poly :=
[
  term ((-4718720 : Rat) / 52799) [(1, 1), (2, 1), (5, 1), (6, 1), (9, 1), (15, 1)],
  term ((2359360 : Rat) / 52799) [(1, 1), (2, 2), (5, 1), (6, 1), (9, 1), (15, 1)],
  term ((2359360 : Rat) / 52799) [(1, 1), (3, 2), (5, 1), (6, 1), (9, 1), (15, 1)],
  term ((4718720 : Rat) / 52799) [(1, 1), (5, 1), (6, 1), (9, 1), (14, 1), (15, 1)],
  term ((-2359360 : Rat) / 52799) [(1, 1), (5, 1), (6, 1), (9, 1), (14, 2), (15, 1)],
  term ((-2359360 : Rat) / 52799) [(1, 1), (5, 1), (6, 1), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 702 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0702_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0702
        rs_R005_ueqv_R005NYN_generator_05_0700_0799 =
      rs_R005_ueqv_R005NYN_partial_05_0702 := by
  native_decide

/-- Coefficient term 703 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0703 : Poly :=
[
  term ((-32970072 : Rat) / 385571) [(1, 1), (5, 1), (6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 703 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0703 : Poly :=
[
  term ((65940144 : Rat) / 385571) [(1, 1), (2, 1), (5, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-32970072 : Rat) / 385571) [(1, 1), (2, 2), (5, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-32970072 : Rat) / 385571) [(1, 1), (3, 2), (5, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-65940144 : Rat) / 385571) [(1, 1), (5, 1), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((32970072 : Rat) / 385571) [(1, 1), (5, 1), (6, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((32970072 : Rat) / 385571) [(1, 1), (5, 1), (6, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 703 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0703_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0703
        rs_R005_ueqv_R005NYN_generator_05_0700_0799 =
      rs_R005_ueqv_R005NYN_partial_05_0703 := by
  native_decide

/-- Coefficient term 704 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0704 : Poly :=
[
  term ((-4718720 : Rat) / 52799) [(1, 1), (5, 1), (6, 1), (12, 1), (15, 2)]
]

/-- Partial product 704 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0704 : Poly :=
[
  term ((9437440 : Rat) / 52799) [(1, 1), (2, 1), (5, 1), (6, 1), (12, 1), (15, 2)],
  term ((-4718720 : Rat) / 52799) [(1, 1), (2, 2), (5, 1), (6, 1), (12, 1), (15, 2)],
  term ((-4718720 : Rat) / 52799) [(1, 1), (3, 2), (5, 1), (6, 1), (12, 1), (15, 2)],
  term ((-9437440 : Rat) / 52799) [(1, 1), (5, 1), (6, 1), (12, 1), (14, 1), (15, 2)],
  term ((4718720 : Rat) / 52799) [(1, 1), (5, 1), (6, 1), (12, 1), (14, 2), (15, 2)],
  term ((4718720 : Rat) / 52799) [(1, 1), (5, 1), (6, 1), (12, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 704 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0704_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0704
        rs_R005_ueqv_R005NYN_generator_05_0700_0799 =
      rs_R005_ueqv_R005NYN_partial_05_0704 := by
  native_decide

/-- Coefficient term 705 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0705 : Poly :=
[
  term ((65940144 : Rat) / 385571) [(1, 1), (5, 1), (6, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 705 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0705 : Poly :=
[
  term ((-131880288 : Rat) / 385571) [(1, 1), (2, 1), (5, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((65940144 : Rat) / 385571) [(1, 1), (2, 2), (5, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((65940144 : Rat) / 385571) [(1, 1), (3, 2), (5, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((131880288 : Rat) / 385571) [(1, 1), (5, 1), (6, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-65940144 : Rat) / 385571) [(1, 1), (5, 1), (6, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-65940144 : Rat) / 385571) [(1, 1), (5, 1), (6, 1), (12, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 705 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0705_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0705
        rs_R005_ueqv_R005NYN_generator_05_0700_0799 =
      rs_R005_ueqv_R005NYN_partial_05_0705 := by
  native_decide

/-- Coefficient term 706 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0706 : Poly :=
[
  term ((-2359360 : Rat) / 52799) [(1, 1), (5, 1), (6, 1), (15, 2)]
]

/-- Partial product 706 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0706 : Poly :=
[
  term ((4718720 : Rat) / 52799) [(1, 1), (2, 1), (5, 1), (6, 1), (15, 2)],
  term ((-2359360 : Rat) / 52799) [(1, 1), (2, 2), (5, 1), (6, 1), (15, 2)],
  term ((-2359360 : Rat) / 52799) [(1, 1), (3, 2), (5, 1), (6, 1), (15, 2)],
  term ((-4718720 : Rat) / 52799) [(1, 1), (5, 1), (6, 1), (14, 1), (15, 2)],
  term ((2359360 : Rat) / 52799) [(1, 1), (5, 1), (6, 1), (14, 2), (15, 2)],
  term ((2359360 : Rat) / 52799) [(1, 1), (5, 1), (6, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 706 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0706_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0706
        rs_R005_ueqv_R005NYN_generator_05_0700_0799 =
      rs_R005_ueqv_R005NYN_partial_05_0706 := by
  native_decide

/-- Coefficient term 707 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0707 : Poly :=
[
  term ((32970072 : Rat) / 385571) [(1, 1), (5, 1), (6, 1), (15, 2), (16, 1)]
]

/-- Partial product 707 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0707 : Poly :=
[
  term ((-65940144 : Rat) / 385571) [(1, 1), (2, 1), (5, 1), (6, 1), (15, 2), (16, 1)],
  term ((32970072 : Rat) / 385571) [(1, 1), (2, 2), (5, 1), (6, 1), (15, 2), (16, 1)],
  term ((32970072 : Rat) / 385571) [(1, 1), (3, 2), (5, 1), (6, 1), (15, 2), (16, 1)],
  term ((65940144 : Rat) / 385571) [(1, 1), (5, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-32970072 : Rat) / 385571) [(1, 1), (5, 1), (6, 1), (14, 2), (15, 2), (16, 1)],
  term ((-32970072 : Rat) / 385571) [(1, 1), (5, 1), (6, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 707 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0707_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0707
        rs_R005_ueqv_R005NYN_generator_05_0700_0799 =
      rs_R005_ueqv_R005NYN_partial_05_0707 := by
  native_decide

/-- Coefficient term 708 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0708 : Poly :=
[
  term ((-47908480 : Rat) / 158397) [(1, 1), (5, 1), (8, 1), (12, 1), (15, 2)]
]

/-- Partial product 708 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0708 : Poly :=
[
  term ((95816960 : Rat) / 158397) [(1, 1), (2, 1), (5, 1), (8, 1), (12, 1), (15, 2)],
  term ((-47908480 : Rat) / 158397) [(1, 1), (2, 2), (5, 1), (8, 1), (12, 1), (15, 2)],
  term ((-47908480 : Rat) / 158397) [(1, 1), (3, 2), (5, 1), (8, 1), (12, 1), (15, 2)],
  term ((-95816960 : Rat) / 158397) [(1, 1), (5, 1), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((47908480 : Rat) / 158397) [(1, 1), (5, 1), (8, 1), (12, 1), (14, 2), (15, 2)],
  term ((47908480 : Rat) / 158397) [(1, 1), (5, 1), (8, 1), (12, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 708 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0708_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0708
        rs_R005_ueqv_R005NYN_generator_05_0700_0799 =
      rs_R005_ueqv_R005NYN_partial_05_0708 := by
  native_decide

/-- Coefficient term 709 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0709 : Poly :=
[
  term ((215464720 : Rat) / 385571) [(1, 1), (5, 1), (8, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 709 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0709 : Poly :=
[
  term ((-430929440 : Rat) / 385571) [(1, 1), (2, 1), (5, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((215464720 : Rat) / 385571) [(1, 1), (2, 2), (5, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((215464720 : Rat) / 385571) [(1, 1), (3, 2), (5, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((430929440 : Rat) / 385571) [(1, 1), (5, 1), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-215464720 : Rat) / 385571) [(1, 1), (5, 1), (8, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-215464720 : Rat) / 385571) [(1, 1), (5, 1), (8, 1), (12, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 709 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0709_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0709
        rs_R005_ueqv_R005NYN_generator_05_0700_0799 =
      rs_R005_ueqv_R005NYN_partial_05_0709 := by
  native_decide

/-- Coefficient term 710 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0710 : Poly :=
[
  term ((-6617984 : Rat) / 158397) [(1, 1), (5, 1), (8, 1), (13, 1), (15, 1)]
]

/-- Partial product 710 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0710 : Poly :=
[
  term ((13235968 : Rat) / 158397) [(1, 1), (2, 1), (5, 1), (8, 1), (13, 1), (15, 1)],
  term ((-6617984 : Rat) / 158397) [(1, 1), (2, 2), (5, 1), (8, 1), (13, 1), (15, 1)],
  term ((-6617984 : Rat) / 158397) [(1, 1), (3, 2), (5, 1), (8, 1), (13, 1), (15, 1)],
  term ((-13235968 : Rat) / 158397) [(1, 1), (5, 1), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((6617984 : Rat) / 158397) [(1, 1), (5, 1), (8, 1), (13, 1), (14, 2), (15, 1)],
  term ((6617984 : Rat) / 158397) [(1, 1), (5, 1), (8, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 710 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0710_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0710
        rs_R005_ueqv_R005NYN_generator_05_0700_0799 =
      rs_R005_ueqv_R005NYN_partial_05_0710 := by
  native_decide

/-- Coefficient term 711 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0711 : Poly :=
[
  term ((35232080 : Rat) / 385571) [(1, 1), (5, 1), (8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 711 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0711 : Poly :=
[
  term ((-70464160 : Rat) / 385571) [(1, 1), (2, 1), (5, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((35232080 : Rat) / 385571) [(1, 1), (2, 2), (5, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((35232080 : Rat) / 385571) [(1, 1), (3, 2), (5, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((70464160 : Rat) / 385571) [(1, 1), (5, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-35232080 : Rat) / 385571) [(1, 1), (5, 1), (8, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-35232080 : Rat) / 385571) [(1, 1), (5, 1), (8, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 711 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0711_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0711
        rs_R005_ueqv_R005NYN_generator_05_0700_0799 =
      rs_R005_ueqv_R005NYN_partial_05_0711 := by
  native_decide

/-- Coefficient term 712 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0712 : Poly :=
[
  term ((6617984 : Rat) / 158397) [(1, 1), (5, 1), (8, 1), (15, 2)]
]

/-- Partial product 712 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0712 : Poly :=
[
  term ((-13235968 : Rat) / 158397) [(1, 1), (2, 1), (5, 1), (8, 1), (15, 2)],
  term ((6617984 : Rat) / 158397) [(1, 1), (2, 2), (5, 1), (8, 1), (15, 2)],
  term ((6617984 : Rat) / 158397) [(1, 1), (3, 2), (5, 1), (8, 1), (15, 2)],
  term ((13235968 : Rat) / 158397) [(1, 1), (5, 1), (8, 1), (14, 1), (15, 2)],
  term ((-6617984 : Rat) / 158397) [(1, 1), (5, 1), (8, 1), (14, 2), (15, 2)],
  term ((-6617984 : Rat) / 158397) [(1, 1), (5, 1), (8, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 712 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0712_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0712
        rs_R005_ueqv_R005NYN_generator_05_0700_0799 =
      rs_R005_ueqv_R005NYN_partial_05_0712 := by
  native_decide

/-- Coefficient term 713 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0713 : Poly :=
[
  term ((-35232080 : Rat) / 385571) [(1, 1), (5, 1), (8, 1), (15, 2), (16, 1)]
]

/-- Partial product 713 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0713 : Poly :=
[
  term ((70464160 : Rat) / 385571) [(1, 1), (2, 1), (5, 1), (8, 1), (15, 2), (16, 1)],
  term ((-35232080 : Rat) / 385571) [(1, 1), (2, 2), (5, 1), (8, 1), (15, 2), (16, 1)],
  term ((-35232080 : Rat) / 385571) [(1, 1), (3, 2), (5, 1), (8, 1), (15, 2), (16, 1)],
  term ((-70464160 : Rat) / 385571) [(1, 1), (5, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((35232080 : Rat) / 385571) [(1, 1), (5, 1), (8, 1), (14, 2), (15, 2), (16, 1)],
  term ((35232080 : Rat) / 385571) [(1, 1), (5, 1), (8, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 713 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0713_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0713
        rs_R005_ueqv_R005NYN_generator_05_0700_0799 =
      rs_R005_ueqv_R005NYN_partial_05_0713 := by
  native_decide

/-- Coefficient term 714 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0714 : Poly :=
[
  term ((-3308992 : Rat) / 158397) [(1, 1), (5, 1), (9, 1), (15, 1)]
]

/-- Partial product 714 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0714 : Poly :=
[
  term ((6617984 : Rat) / 158397) [(1, 1), (2, 1), (5, 1), (9, 1), (15, 1)],
  term ((-3308992 : Rat) / 158397) [(1, 1), (2, 2), (5, 1), (9, 1), (15, 1)],
  term ((-3308992 : Rat) / 158397) [(1, 1), (3, 2), (5, 1), (9, 1), (15, 1)],
  term ((-6617984 : Rat) / 158397) [(1, 1), (5, 1), (9, 1), (14, 1), (15, 1)],
  term ((3308992 : Rat) / 158397) [(1, 1), (5, 1), (9, 1), (14, 2), (15, 1)],
  term ((3308992 : Rat) / 158397) [(1, 1), (5, 1), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 714 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0714_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0714
        rs_R005_ueqv_R005NYN_generator_05_0700_0799 =
      rs_R005_ueqv_R005NYN_partial_05_0714 := by
  native_decide

/-- Coefficient term 715 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0715 : Poly :=
[
  term ((17616040 : Rat) / 385571) [(1, 1), (5, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 715 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0715 : Poly :=
[
  term ((-35232080 : Rat) / 385571) [(1, 1), (2, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((17616040 : Rat) / 385571) [(1, 1), (2, 2), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((17616040 : Rat) / 385571) [(1, 1), (3, 2), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((35232080 : Rat) / 385571) [(1, 1), (5, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-17616040 : Rat) / 385571) [(1, 1), (5, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-17616040 : Rat) / 385571) [(1, 1), (5, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 715 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0715_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0715
        rs_R005_ueqv_R005NYN_generator_05_0700_0799 =
      rs_R005_ueqv_R005NYN_partial_05_0715 := by
  native_decide

/-- Coefficient term 716 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0716 : Poly :=
[
  term ((47908480 : Rat) / 158397) [(1, 1), (5, 1), (12, 1), (15, 2)]
]

/-- Partial product 716 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0716 : Poly :=
[
  term ((-95816960 : Rat) / 158397) [(1, 1), (2, 1), (5, 1), (12, 1), (15, 2)],
  term ((47908480 : Rat) / 158397) [(1, 1), (2, 2), (5, 1), (12, 1), (15, 2)],
  term ((47908480 : Rat) / 158397) [(1, 1), (3, 2), (5, 1), (12, 1), (15, 2)],
  term ((95816960 : Rat) / 158397) [(1, 1), (5, 1), (12, 1), (14, 1), (15, 2)],
  term ((-47908480 : Rat) / 158397) [(1, 1), (5, 1), (12, 1), (14, 2), (15, 2)],
  term ((-47908480 : Rat) / 158397) [(1, 1), (5, 1), (12, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 716 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0716_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0716
        rs_R005_ueqv_R005NYN_generator_05_0700_0799 =
      rs_R005_ueqv_R005NYN_partial_05_0716 := by
  native_decide

/-- Coefficient term 717 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0717 : Poly :=
[
  term ((-215464720 : Rat) / 385571) [(1, 1), (5, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 717 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0717 : Poly :=
[
  term ((430929440 : Rat) / 385571) [(1, 1), (2, 1), (5, 1), (12, 1), (15, 2), (16, 1)],
  term ((-215464720 : Rat) / 385571) [(1, 1), (2, 2), (5, 1), (12, 1), (15, 2), (16, 1)],
  term ((-215464720 : Rat) / 385571) [(1, 1), (3, 2), (5, 1), (12, 1), (15, 2), (16, 1)],
  term ((-430929440 : Rat) / 385571) [(1, 1), (5, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((215464720 : Rat) / 385571) [(1, 1), (5, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((215464720 : Rat) / 385571) [(1, 1), (5, 1), (12, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 717 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0717_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0717
        rs_R005_ueqv_R005NYN_generator_05_0700_0799 =
      rs_R005_ueqv_R005NYN_partial_05_0717 := by
  native_decide

/-- Coefficient term 718 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0718 : Poly :=
[
  term ((-14492672 : Rat) / 52799) [(1, 1), (5, 1), (13, 1), (15, 1)]
]

/-- Partial product 718 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0718 : Poly :=
[
  term ((28985344 : Rat) / 52799) [(1, 1), (2, 1), (5, 1), (13, 1), (15, 1)],
  term ((-14492672 : Rat) / 52799) [(1, 1), (2, 2), (5, 1), (13, 1), (15, 1)],
  term ((-14492672 : Rat) / 52799) [(1, 1), (3, 2), (5, 1), (13, 1), (15, 1)],
  term ((-28985344 : Rat) / 52799) [(1, 1), (5, 1), (13, 1), (14, 1), (15, 1)],
  term ((14492672 : Rat) / 52799) [(1, 1), (5, 1), (13, 1), (14, 2), (15, 1)],
  term ((14492672 : Rat) / 52799) [(1, 1), (5, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 718 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0718_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0718
        rs_R005_ueqv_R005NYN_generator_05_0700_0799 =
      rs_R005_ueqv_R005NYN_partial_05_0718 := by
  native_decide

/-- Coefficient term 719 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0719 : Poly :=
[
  term ((78621312 : Rat) / 385571) [(1, 1), (5, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 719 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0719 : Poly :=
[
  term ((-157242624 : Rat) / 385571) [(1, 1), (2, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((78621312 : Rat) / 385571) [(1, 1), (2, 2), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((78621312 : Rat) / 385571) [(1, 1), (3, 2), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((157242624 : Rat) / 385571) [(1, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-78621312 : Rat) / 385571) [(1, 1), (5, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-78621312 : Rat) / 385571) [(1, 1), (5, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 719 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0719_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0719
        rs_R005_ueqv_R005NYN_generator_05_0700_0799 =
      rs_R005_ueqv_R005NYN_partial_05_0719 := by
  native_decide

/-- Coefficient term 720 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0720 : Poly :=
[
  term ((-3381616 : Rat) / 158397) [(1, 1), (5, 1), (14, 1)]
]

/-- Partial product 720 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0720 : Poly :=
[
  term ((6763232 : Rat) / 158397) [(1, 1), (2, 1), (5, 1), (14, 1)],
  term ((-3381616 : Rat) / 158397) [(1, 1), (2, 2), (5, 1), (14, 1)],
  term ((-3381616 : Rat) / 158397) [(1, 1), (3, 2), (5, 1), (14, 1)],
  term ((3381616 : Rat) / 158397) [(1, 1), (5, 1), (14, 1), (15, 2)],
  term ((-6763232 : Rat) / 158397) [(1, 1), (5, 1), (14, 2)],
  term ((3381616 : Rat) / 158397) [(1, 1), (5, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 720 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0720_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0720
        rs_R005_ueqv_R005NYN_generator_05_0700_0799 =
      rs_R005_ueqv_R005NYN_partial_05_0720 := by
  native_decide

/-- Coefficient term 721 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0721 : Poly :=
[
  term ((37061056 : Rat) / 158397) [(1, 1), (5, 1), (15, 2)]
]

/-- Partial product 721 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0721 : Poly :=
[
  term ((-74122112 : Rat) / 158397) [(1, 1), (2, 1), (5, 1), (15, 2)],
  term ((37061056 : Rat) / 158397) [(1, 1), (2, 2), (5, 1), (15, 2)],
  term ((37061056 : Rat) / 158397) [(1, 1), (3, 2), (5, 1), (15, 2)],
  term ((74122112 : Rat) / 158397) [(1, 1), (5, 1), (14, 1), (15, 2)],
  term ((-37061056 : Rat) / 158397) [(1, 1), (5, 1), (14, 2), (15, 2)],
  term ((-37061056 : Rat) / 158397) [(1, 1), (5, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 721 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0721_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0721
        rs_R005_ueqv_R005NYN_generator_05_0700_0799 =
      rs_R005_ueqv_R005NYN_partial_05_0721 := by
  native_decide

/-- Coefficient term 722 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0722 : Poly :=
[
  term ((-54011560 : Rat) / 385571) [(1, 1), (5, 1), (15, 2), (16, 1)]
]

/-- Partial product 722 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0722 : Poly :=
[
  term ((108023120 : Rat) / 385571) [(1, 1), (2, 1), (5, 1), (15, 2), (16, 1)],
  term ((-54011560 : Rat) / 385571) [(1, 1), (2, 2), (5, 1), (15, 2), (16, 1)],
  term ((-54011560 : Rat) / 385571) [(1, 1), (3, 2), (5, 1), (15, 2), (16, 1)],
  term ((-108023120 : Rat) / 385571) [(1, 1), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((54011560 : Rat) / 385571) [(1, 1), (5, 1), (14, 2), (15, 2), (16, 1)],
  term ((54011560 : Rat) / 385571) [(1, 1), (5, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 722 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0722_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0722
        rs_R005_ueqv_R005NYN_generator_05_0700_0799 =
      rs_R005_ueqv_R005NYN_partial_05_0722 := by
  native_decide

/-- Coefficient term 723 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0723 : Poly :=
[
  term ((-4718720 : Rat) / 52799) [(1, 1), (6, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 723 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0723 : Poly :=
[
  term ((9437440 : Rat) / 52799) [(1, 1), (2, 1), (6, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-4718720 : Rat) / 52799) [(1, 1), (2, 2), (6, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-4718720 : Rat) / 52799) [(1, 1), (3, 2), (6, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-9437440 : Rat) / 52799) [(1, 1), (6, 1), (7, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((4718720 : Rat) / 52799) [(1, 1), (6, 1), (7, 1), (8, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((4718720 : Rat) / 52799) [(1, 1), (6, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 723 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0723_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0723
        rs_R005_ueqv_R005NYN_generator_05_0700_0799 =
      rs_R005_ueqv_R005NYN_partial_05_0723 := by
  native_decide

/-- Coefficient term 724 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0724 : Poly :=
[
  term ((65940144 : Rat) / 385571) [(1, 1), (6, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 724 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0724 : Poly :=
[
  term ((-131880288 : Rat) / 385571) [(1, 1), (2, 1), (6, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((65940144 : Rat) / 385571) [(1, 1), (2, 2), (6, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((65940144 : Rat) / 385571) [(1, 1), (3, 2), (6, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((131880288 : Rat) / 385571) [(1, 1), (6, 1), (7, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-65940144 : Rat) / 385571) [(1, 1), (6, 1), (7, 1), (8, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-65940144 : Rat) / 385571) [(1, 1), (6, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 724 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0724_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0724
        rs_R005_ueqv_R005NYN_generator_05_0700_0799 =
      rs_R005_ueqv_R005NYN_partial_05_0724 := by
  native_decide

/-- Coefficient term 725 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0725 : Poly :=
[
  term ((4718720 : Rat) / 52799) [(1, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 725 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0725 : Poly :=
[
  term ((-9437440 : Rat) / 52799) [(1, 1), (2, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((4718720 : Rat) / 52799) [(1, 1), (2, 2), (6, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((4718720 : Rat) / 52799) [(1, 1), (3, 2), (6, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((9437440 : Rat) / 52799) [(1, 1), (6, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-4718720 : Rat) / 52799) [(1, 1), (6, 1), (7, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-4718720 : Rat) / 52799) [(1, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 725 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0725_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0725
        rs_R005_ueqv_R005NYN_generator_05_0700_0799 =
      rs_R005_ueqv_R005NYN_partial_05_0725 := by
  native_decide

/-- Coefficient term 726 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0726 : Poly :=
[
  term ((-65940144 : Rat) / 385571) [(1, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 726 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0726 : Poly :=
[
  term ((131880288 : Rat) / 385571) [(1, 1), (2, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-65940144 : Rat) / 385571) [(1, 1), (2, 2), (6, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-65940144 : Rat) / 385571) [(1, 1), (3, 2), (6, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-131880288 : Rat) / 385571) [(1, 1), (6, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((65940144 : Rat) / 385571) [(1, 1), (6, 1), (7, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((65940144 : Rat) / 385571) [(1, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 726 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0726_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0726
        rs_R005_ueqv_R005NYN_generator_05_0700_0799 =
      rs_R005_ueqv_R005NYN_partial_05_0726 := by
  native_decide

/-- Coefficient term 727 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0727 : Poly :=
[
  term ((-2359360 : Rat) / 52799) [(1, 1), (6, 1), (8, 1), (10, 1), (14, 1), (15, 1)]
]

/-- Partial product 727 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0727 : Poly :=
[
  term ((4718720 : Rat) / 52799) [(1, 1), (2, 1), (6, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((-2359360 : Rat) / 52799) [(1, 1), (2, 2), (6, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((-2359360 : Rat) / 52799) [(1, 1), (3, 2), (6, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((2359360 : Rat) / 52799) [(1, 1), (6, 1), (8, 1), (10, 1), (14, 1), (15, 3)],
  term ((-4718720 : Rat) / 52799) [(1, 1), (6, 1), (8, 1), (10, 1), (14, 2), (15, 1)],
  term ((2359360 : Rat) / 52799) [(1, 1), (6, 1), (8, 1), (10, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 727 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0727_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0727
        rs_R005_ueqv_R005NYN_generator_05_0700_0799 =
      rs_R005_ueqv_R005NYN_partial_05_0727 := by
  native_decide

/-- Coefficient term 728 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0728 : Poly :=
[
  term ((32970072 : Rat) / 385571) [(1, 1), (6, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 728 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0728 : Poly :=
[
  term ((-65940144 : Rat) / 385571) [(1, 1), (2, 1), (6, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((32970072 : Rat) / 385571) [(1, 1), (2, 2), (6, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((32970072 : Rat) / 385571) [(1, 1), (3, 2), (6, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-32970072 : Rat) / 385571) [(1, 1), (6, 1), (8, 1), (10, 1), (14, 1), (15, 3), (16, 1)],
  term ((65940144 : Rat) / 385571) [(1, 1), (6, 1), (8, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-32970072 : Rat) / 385571) [(1, 1), (6, 1), (8, 1), (10, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 728 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0728_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0728
        rs_R005_ueqv_R005NYN_generator_05_0700_0799 =
      rs_R005_ueqv_R005NYN_partial_05_0728 := by
  native_decide

/-- Coefficient term 729 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0729 : Poly :=
[
  term ((-1179680 : Rat) / 52799) [(1, 1), (6, 1), (8, 1), (10, 1), (15, 1)]
]

/-- Partial product 729 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0729 : Poly :=
[
  term ((2359360 : Rat) / 52799) [(1, 1), (2, 1), (6, 1), (8, 1), (10, 1), (15, 1)],
  term ((-1179680 : Rat) / 52799) [(1, 1), (2, 2), (6, 1), (8, 1), (10, 1), (15, 1)],
  term ((-1179680 : Rat) / 52799) [(1, 1), (3, 2), (6, 1), (8, 1), (10, 1), (15, 1)],
  term ((-2359360 : Rat) / 52799) [(1, 1), (6, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((1179680 : Rat) / 52799) [(1, 1), (6, 1), (8, 1), (10, 1), (14, 2), (15, 1)],
  term ((1179680 : Rat) / 52799) [(1, 1), (6, 1), (8, 1), (10, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 729 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0729_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0729
        rs_R005_ueqv_R005NYN_generator_05_0700_0799 =
      rs_R005_ueqv_R005NYN_partial_05_0729 := by
  native_decide

/-- Coefficient term 730 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0730 : Poly :=
[
  term ((16485036 : Rat) / 385571) [(1, 1), (6, 1), (8, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 730 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0730 : Poly :=
[
  term ((-32970072 : Rat) / 385571) [(1, 1), (2, 1), (6, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((16485036 : Rat) / 385571) [(1, 1), (2, 2), (6, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((16485036 : Rat) / 385571) [(1, 1), (3, 2), (6, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((32970072 : Rat) / 385571) [(1, 1), (6, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-16485036 : Rat) / 385571) [(1, 1), (6, 1), (8, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-16485036 : Rat) / 385571) [(1, 1), (6, 1), (8, 1), (10, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 730 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0730_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0730
        rs_R005_ueqv_R005NYN_generator_05_0700_0799 =
      rs_R005_ueqv_R005NYN_partial_05_0730 := by
  native_decide

/-- Coefficient term 731 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0731 : Poly :=
[
  term ((-47908480 : Rat) / 158397) [(1, 1), (6, 1), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 731 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0731 : Poly :=
[
  term ((95816960 : Rat) / 158397) [(1, 1), (2, 1), (6, 1), (8, 1), (12, 1), (15, 1)],
  term ((-47908480 : Rat) / 158397) [(1, 1), (2, 2), (6, 1), (8, 1), (12, 1), (15, 1)],
  term ((-47908480 : Rat) / 158397) [(1, 1), (3, 2), (6, 1), (8, 1), (12, 1), (15, 1)],
  term ((-95816960 : Rat) / 158397) [(1, 1), (6, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((47908480 : Rat) / 158397) [(1, 1), (6, 1), (8, 1), (12, 1), (14, 2), (15, 1)],
  term ((47908480 : Rat) / 158397) [(1, 1), (6, 1), (8, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 731 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0731_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0731
        rs_R005_ueqv_R005NYN_generator_05_0700_0799 =
      rs_R005_ueqv_R005NYN_partial_05_0731 := by
  native_decide

/-- Coefficient term 732 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0732 : Poly :=
[
  term ((215464720 : Rat) / 385571) [(1, 1), (6, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 732 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0732 : Poly :=
[
  term ((-430929440 : Rat) / 385571) [(1, 1), (2, 1), (6, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((215464720 : Rat) / 385571) [(1, 1), (2, 2), (6, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((215464720 : Rat) / 385571) [(1, 1), (3, 2), (6, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((430929440 : Rat) / 385571) [(1, 1), (6, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-215464720 : Rat) / 385571) [(1, 1), (6, 1), (8, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-215464720 : Rat) / 385571) [(1, 1), (6, 1), (8, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 732 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0732_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0732
        rs_R005_ueqv_R005NYN_generator_05_0700_0799 =
      rs_R005_ueqv_R005NYN_partial_05_0732 := by
  native_decide

/-- Coefficient term 733 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0733 : Poly :=
[
  term ((62064640 : Rat) / 158397) [(1, 1), (6, 1), (8, 1), (12, 2), (15, 1)]
]

/-- Partial product 733 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0733 : Poly :=
[
  term ((-124129280 : Rat) / 158397) [(1, 1), (2, 1), (6, 1), (8, 1), (12, 2), (15, 1)],
  term ((62064640 : Rat) / 158397) [(1, 1), (2, 2), (6, 1), (8, 1), (12, 2), (15, 1)],
  term ((62064640 : Rat) / 158397) [(1, 1), (3, 2), (6, 1), (8, 1), (12, 2), (15, 1)],
  term ((124129280 : Rat) / 158397) [(1, 1), (6, 1), (8, 1), (12, 2), (14, 1), (15, 1)],
  term ((-62064640 : Rat) / 158397) [(1, 1), (6, 1), (8, 1), (12, 2), (14, 2), (15, 1)],
  term ((-62064640 : Rat) / 158397) [(1, 1), (6, 1), (8, 1), (12, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 733 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0733_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0733
        rs_R005_ueqv_R005NYN_generator_05_0700_0799 =
      rs_R005_ueqv_R005NYN_partial_05_0733 := by
  native_decide

/-- Coefficient term 734 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0734 : Poly :=
[
  term ((-281404864 : Rat) / 385571) [(1, 1), (6, 1), (8, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 734 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0734 : Poly :=
[
  term ((562809728 : Rat) / 385571) [(1, 1), (2, 1), (6, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-281404864 : Rat) / 385571) [(1, 1), (2, 2), (6, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-281404864 : Rat) / 385571) [(1, 1), (3, 2), (6, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-562809728 : Rat) / 385571) [(1, 1), (6, 1), (8, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((281404864 : Rat) / 385571) [(1, 1), (6, 1), (8, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((281404864 : Rat) / 385571) [(1, 1), (6, 1), (8, 1), (12, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 734 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0734_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0734
        rs_R005_ueqv_R005NYN_generator_05_0700_0799 =
      rs_R005_ueqv_R005NYN_partial_05_0734 := by
  native_decide

/-- Coefficient term 735 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0735 : Poly :=
[
  term ((1179680 : Rat) / 52799) [(1, 1), (6, 1), (8, 1), (14, 1), (15, 1)]
]

/-- Partial product 735 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0735 : Poly :=
[
  term ((-2359360 : Rat) / 52799) [(1, 1), (2, 1), (6, 1), (8, 1), (14, 1), (15, 1)],
  term ((1179680 : Rat) / 52799) [(1, 1), (2, 2), (6, 1), (8, 1), (14, 1), (15, 1)],
  term ((1179680 : Rat) / 52799) [(1, 1), (3, 2), (6, 1), (8, 1), (14, 1), (15, 1)],
  term ((-1179680 : Rat) / 52799) [(1, 1), (6, 1), (8, 1), (14, 1), (15, 3)],
  term ((2359360 : Rat) / 52799) [(1, 1), (6, 1), (8, 1), (14, 2), (15, 1)],
  term ((-1179680 : Rat) / 52799) [(1, 1), (6, 1), (8, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 735 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0735_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0735
        rs_R005_ueqv_R005NYN_generator_05_0700_0799 =
      rs_R005_ueqv_R005NYN_partial_05_0735 := by
  native_decide

/-- Coefficient term 736 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0736 : Poly :=
[
  term ((-16485036 : Rat) / 385571) [(1, 1), (6, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 736 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0736 : Poly :=
[
  term ((32970072 : Rat) / 385571) [(1, 1), (2, 1), (6, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-16485036 : Rat) / 385571) [(1, 1), (2, 2), (6, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-16485036 : Rat) / 385571) [(1, 1), (3, 2), (6, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((16485036 : Rat) / 385571) [(1, 1), (6, 1), (8, 1), (14, 1), (15, 3), (16, 1)],
  term ((-32970072 : Rat) / 385571) [(1, 1), (6, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((16485036 : Rat) / 385571) [(1, 1), (6, 1), (8, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 736 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0736_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0736
        rs_R005_ueqv_R005NYN_generator_05_0700_0799 =
      rs_R005_ueqv_R005NYN_partial_05_0736 := by
  native_decide

/-- Coefficient term 737 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0737 : Poly :=
[
  term ((-1769520 : Rat) / 52799) [(1, 1), (6, 1), (8, 1), (15, 1)]
]

/-- Partial product 737 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0737 : Poly :=
[
  term ((3539040 : Rat) / 52799) [(1, 1), (2, 1), (6, 1), (8, 1), (15, 1)],
  term ((-1769520 : Rat) / 52799) [(1, 1), (2, 2), (6, 1), (8, 1), (15, 1)],
  term ((-1769520 : Rat) / 52799) [(1, 1), (3, 2), (6, 1), (8, 1), (15, 1)],
  term ((-3539040 : Rat) / 52799) [(1, 1), (6, 1), (8, 1), (14, 1), (15, 1)],
  term ((1769520 : Rat) / 52799) [(1, 1), (6, 1), (8, 1), (14, 2), (15, 1)],
  term ((1769520 : Rat) / 52799) [(1, 1), (6, 1), (8, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 737 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0737_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0737
        rs_R005_ueqv_R005NYN_generator_05_0700_0799 =
      rs_R005_ueqv_R005NYN_partial_05_0737 := by
  native_decide

/-- Coefficient term 738 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0738 : Poly :=
[
  term ((24727554 : Rat) / 385571) [(1, 1), (6, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 738 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0738 : Poly :=
[
  term ((-49455108 : Rat) / 385571) [(1, 1), (2, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((24727554 : Rat) / 385571) [(1, 1), (2, 2), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((24727554 : Rat) / 385571) [(1, 1), (3, 2), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((49455108 : Rat) / 385571) [(1, 1), (6, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-24727554 : Rat) / 385571) [(1, 1), (6, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((-24727554 : Rat) / 385571) [(1, 1), (6, 1), (8, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 738 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0738_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0738
        rs_R005_ueqv_R005NYN_generator_05_0700_0799 =
      rs_R005_ueqv_R005NYN_partial_05_0738 := by
  native_decide

/-- Coefficient term 739 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0739 : Poly :=
[
  term ((2359360 : Rat) / 52799) [(1, 1), (6, 1), (10, 1), (14, 1), (15, 1)]
]

/-- Partial product 739 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0739 : Poly :=
[
  term ((-4718720 : Rat) / 52799) [(1, 1), (2, 1), (6, 1), (10, 1), (14, 1), (15, 1)],
  term ((2359360 : Rat) / 52799) [(1, 1), (2, 2), (6, 1), (10, 1), (14, 1), (15, 1)],
  term ((2359360 : Rat) / 52799) [(1, 1), (3, 2), (6, 1), (10, 1), (14, 1), (15, 1)],
  term ((-2359360 : Rat) / 52799) [(1, 1), (6, 1), (10, 1), (14, 1), (15, 3)],
  term ((4718720 : Rat) / 52799) [(1, 1), (6, 1), (10, 1), (14, 2), (15, 1)],
  term ((-2359360 : Rat) / 52799) [(1, 1), (6, 1), (10, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 739 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0739_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0739
        rs_R005_ueqv_R005NYN_generator_05_0700_0799 =
      rs_R005_ueqv_R005NYN_partial_05_0739 := by
  native_decide

/-- Coefficient term 740 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0740 : Poly :=
[
  term ((-32970072 : Rat) / 385571) [(1, 1), (6, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 740 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0740 : Poly :=
[
  term ((65940144 : Rat) / 385571) [(1, 1), (2, 1), (6, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-32970072 : Rat) / 385571) [(1, 1), (2, 2), (6, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-32970072 : Rat) / 385571) [(1, 1), (3, 2), (6, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((32970072 : Rat) / 385571) [(1, 1), (6, 1), (10, 1), (14, 1), (15, 3), (16, 1)],
  term ((-65940144 : Rat) / 385571) [(1, 1), (6, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((32970072 : Rat) / 385571) [(1, 1), (6, 1), (10, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 740 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0740_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0740
        rs_R005_ueqv_R005NYN_generator_05_0700_0799 =
      rs_R005_ueqv_R005NYN_partial_05_0740 := by
  native_decide

/-- Coefficient term 741 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0741 : Poly :=
[
  term ((1179680 : Rat) / 52799) [(1, 1), (6, 1), (10, 1), (15, 1)]
]

/-- Partial product 741 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0741 : Poly :=
[
  term ((-2359360 : Rat) / 52799) [(1, 1), (2, 1), (6, 1), (10, 1), (15, 1)],
  term ((1179680 : Rat) / 52799) [(1, 1), (2, 2), (6, 1), (10, 1), (15, 1)],
  term ((1179680 : Rat) / 52799) [(1, 1), (3, 2), (6, 1), (10, 1), (15, 1)],
  term ((2359360 : Rat) / 52799) [(1, 1), (6, 1), (10, 1), (14, 1), (15, 1)],
  term ((-1179680 : Rat) / 52799) [(1, 1), (6, 1), (10, 1), (14, 2), (15, 1)],
  term ((-1179680 : Rat) / 52799) [(1, 1), (6, 1), (10, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 741 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0741_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0741
        rs_R005_ueqv_R005NYN_generator_05_0700_0799 =
      rs_R005_ueqv_R005NYN_partial_05_0741 := by
  native_decide

/-- Coefficient term 742 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0742 : Poly :=
[
  term ((-16485036 : Rat) / 385571) [(1, 1), (6, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 742 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0742 : Poly :=
[
  term ((32970072 : Rat) / 385571) [(1, 1), (2, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((-16485036 : Rat) / 385571) [(1, 1), (2, 2), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((-16485036 : Rat) / 385571) [(1, 1), (3, 2), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((-32970072 : Rat) / 385571) [(1, 1), (6, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((16485036 : Rat) / 385571) [(1, 1), (6, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((16485036 : Rat) / 385571) [(1, 1), (6, 1), (10, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 742 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0742_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0742
        rs_R005_ueqv_R005NYN_generator_05_0700_0799 =
      rs_R005_ueqv_R005NYN_partial_05_0742 := by
  native_decide

/-- Coefficient term 743 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0743 : Poly :=
[
  term ((79191392 : Rat) / 158397) [(1, 1), (6, 1), (12, 1), (15, 1)]
]

/-- Partial product 743 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0743 : Poly :=
[
  term ((-158382784 : Rat) / 158397) [(1, 1), (2, 1), (6, 1), (12, 1), (15, 1)],
  term ((79191392 : Rat) / 158397) [(1, 1), (2, 2), (6, 1), (12, 1), (15, 1)],
  term ((79191392 : Rat) / 158397) [(1, 1), (3, 2), (6, 1), (12, 1), (15, 1)],
  term ((158382784 : Rat) / 158397) [(1, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((-79191392 : Rat) / 158397) [(1, 1), (6, 1), (12, 1), (14, 2), (15, 1)],
  term ((-79191392 : Rat) / 158397) [(1, 1), (6, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 743 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0743_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0743
        rs_R005_ueqv_R005NYN_generator_05_0700_0799 =
      rs_R005_ueqv_R005NYN_partial_05_0743 := by
  native_decide

/-- Coefficient term 744 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0744 : Poly :=
[
  term ((-349258148 : Rat) / 385571) [(1, 1), (6, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 744 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0744 : Poly :=
[
  term ((698516296 : Rat) / 385571) [(1, 1), (2, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-349258148 : Rat) / 385571) [(1, 1), (2, 2), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-349258148 : Rat) / 385571) [(1, 1), (3, 2), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-698516296 : Rat) / 385571) [(1, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((349258148 : Rat) / 385571) [(1, 1), (6, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((349258148 : Rat) / 385571) [(1, 1), (6, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 744 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0744_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0744
        rs_R005_ueqv_R005NYN_generator_05_0700_0799 =
      rs_R005_ueqv_R005NYN_partial_05_0744 := by
  native_decide

/-- Coefficient term 745 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0745 : Poly :=
[
  term ((-62064640 : Rat) / 158397) [(1, 1), (6, 1), (12, 2), (15, 1)]
]

/-- Partial product 745 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0745 : Poly :=
[
  term ((124129280 : Rat) / 158397) [(1, 1), (2, 1), (6, 1), (12, 2), (15, 1)],
  term ((-62064640 : Rat) / 158397) [(1, 1), (2, 2), (6, 1), (12, 2), (15, 1)],
  term ((-62064640 : Rat) / 158397) [(1, 1), (3, 2), (6, 1), (12, 2), (15, 1)],
  term ((-124129280 : Rat) / 158397) [(1, 1), (6, 1), (12, 2), (14, 1), (15, 1)],
  term ((62064640 : Rat) / 158397) [(1, 1), (6, 1), (12, 2), (14, 2), (15, 1)],
  term ((62064640 : Rat) / 158397) [(1, 1), (6, 1), (12, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 745 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0745_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0745
        rs_R005_ueqv_R005NYN_generator_05_0700_0799 =
      rs_R005_ueqv_R005NYN_partial_05_0745 := by
  native_decide

/-- Coefficient term 746 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0746 : Poly :=
[
  term ((281404864 : Rat) / 385571) [(1, 1), (6, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 746 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0746 : Poly :=
[
  term ((-562809728 : Rat) / 385571) [(1, 1), (2, 1), (6, 1), (12, 2), (15, 1), (16, 1)],
  term ((281404864 : Rat) / 385571) [(1, 1), (2, 2), (6, 1), (12, 2), (15, 1), (16, 1)],
  term ((281404864 : Rat) / 385571) [(1, 1), (3, 2), (6, 1), (12, 2), (15, 1), (16, 1)],
  term ((562809728 : Rat) / 385571) [(1, 1), (6, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-281404864 : Rat) / 385571) [(1, 1), (6, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((-281404864 : Rat) / 385571) [(1, 1), (6, 1), (12, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 746 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0746_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0746
        rs_R005_ueqv_R005NYN_generator_05_0700_0799 =
      rs_R005_ueqv_R005NYN_partial_05_0746 := by
  native_decide

/-- Coefficient term 747 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0747 : Poly :=
[
  term ((-322720 : Rat) / 158397) [(1, 1), (6, 1), (14, 1), (15, 1)]
]

/-- Partial product 747 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0747 : Poly :=
[
  term ((645440 : Rat) / 158397) [(1, 1), (2, 1), (6, 1), (14, 1), (15, 1)],
  term ((-322720 : Rat) / 158397) [(1, 1), (2, 2), (6, 1), (14, 1), (15, 1)],
  term ((-322720 : Rat) / 158397) [(1, 1), (3, 2), (6, 1), (14, 1), (15, 1)],
  term ((322720 : Rat) / 158397) [(1, 1), (6, 1), (14, 1), (15, 3)],
  term ((-645440 : Rat) / 158397) [(1, 1), (6, 1), (14, 2), (15, 1)],
  term ((322720 : Rat) / 158397) [(1, 1), (6, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 747 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0747_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0747
        rs_R005_ueqv_R005NYN_generator_05_0700_0799 =
      rs_R005_ueqv_R005NYN_partial_05_0747 := by
  native_decide

/-- Coefficient term 748 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0748 : Poly :=
[
  term ((-7342580 : Rat) / 385571) [(1, 1), (6, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 748 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0748 : Poly :=
[
  term ((14685160 : Rat) / 385571) [(1, 1), (2, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7342580 : Rat) / 385571) [(1, 1), (2, 2), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7342580 : Rat) / 385571) [(1, 1), (3, 2), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((7342580 : Rat) / 385571) [(1, 1), (6, 1), (14, 1), (15, 3), (16, 1)],
  term ((-14685160 : Rat) / 385571) [(1, 1), (6, 1), (14, 2), (15, 1), (16, 1)],
  term ((7342580 : Rat) / 385571) [(1, 1), (6, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 748 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0748_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0748
        rs_R005_ueqv_R005NYN_generator_05_0700_0799 =
      rs_R005_ueqv_R005NYN_partial_05_0748 := by
  native_decide

/-- Coefficient term 749 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0749 : Poly :=
[
  term ((-5762704 : Rat) / 52799) [(1, 1), (6, 1), (15, 1)]
]

/-- Partial product 749 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0749 : Poly :=
[
  term ((11525408 : Rat) / 52799) [(1, 1), (2, 1), (6, 1), (15, 1)],
  term ((-5762704 : Rat) / 52799) [(1, 1), (2, 2), (6, 1), (15, 1)],
  term ((-5762704 : Rat) / 52799) [(1, 1), (3, 2), (6, 1), (15, 1)],
  term ((-11525408 : Rat) / 52799) [(1, 1), (6, 1), (14, 1), (15, 1)],
  term ((5762704 : Rat) / 52799) [(1, 1), (6, 1), (14, 2), (15, 1)],
  term ((5762704 : Rat) / 52799) [(1, 1), (6, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 749 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0749_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0749
        rs_R005_ueqv_R005NYN_generator_05_0700_0799 =
      rs_R005_ueqv_R005NYN_partial_05_0749 := by
  native_decide

/-- Coefficient term 750 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0750 : Poly :=
[
  term ((64181994 : Rat) / 385571) [(1, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 750 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0750 : Poly :=
[
  term ((-128363988 : Rat) / 385571) [(1, 1), (2, 1), (6, 1), (15, 1), (16, 1)],
  term ((64181994 : Rat) / 385571) [(1, 1), (2, 2), (6, 1), (15, 1), (16, 1)],
  term ((64181994 : Rat) / 385571) [(1, 1), (3, 2), (6, 1), (15, 1), (16, 1)],
  term ((128363988 : Rat) / 385571) [(1, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-64181994 : Rat) / 385571) [(1, 1), (6, 1), (14, 2), (15, 1), (16, 1)],
  term ((-64181994 : Rat) / 385571) [(1, 1), (6, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 750 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0750_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0750
        rs_R005_ueqv_R005NYN_generator_05_0700_0799 =
      rs_R005_ueqv_R005NYN_partial_05_0750 := by
  native_decide

/-- Coefficient term 751 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0751 : Poly :=
[
  term ((4718720 : Rat) / 52799) [(1, 1), (6, 2), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 751 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0751 : Poly :=
[
  term ((-9437440 : Rat) / 52799) [(1, 1), (2, 1), (6, 2), (8, 1), (12, 1), (15, 1)],
  term ((4718720 : Rat) / 52799) [(1, 1), (2, 2), (6, 2), (8, 1), (12, 1), (15, 1)],
  term ((4718720 : Rat) / 52799) [(1, 1), (3, 2), (6, 2), (8, 1), (12, 1), (15, 1)],
  term ((9437440 : Rat) / 52799) [(1, 1), (6, 2), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-4718720 : Rat) / 52799) [(1, 1), (6, 2), (8, 1), (12, 1), (14, 2), (15, 1)],
  term ((-4718720 : Rat) / 52799) [(1, 1), (6, 2), (8, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 751 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0751_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0751
        rs_R005_ueqv_R005NYN_generator_05_0700_0799 =
      rs_R005_ueqv_R005NYN_partial_05_0751 := by
  native_decide

/-- Coefficient term 752 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0752 : Poly :=
[
  term ((-65940144 : Rat) / 385571) [(1, 1), (6, 2), (8, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 752 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0752 : Poly :=
[
  term ((131880288 : Rat) / 385571) [(1, 1), (2, 1), (6, 2), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-65940144 : Rat) / 385571) [(1, 1), (2, 2), (6, 2), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-65940144 : Rat) / 385571) [(1, 1), (3, 2), (6, 2), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-131880288 : Rat) / 385571) [(1, 1), (6, 2), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((65940144 : Rat) / 385571) [(1, 1), (6, 2), (8, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((65940144 : Rat) / 385571) [(1, 1), (6, 2), (8, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 752 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0752_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0752
        rs_R005_ueqv_R005NYN_generator_05_0700_0799 =
      rs_R005_ueqv_R005NYN_partial_05_0752 := by
  native_decide

/-- Coefficient term 753 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0753 : Poly :=
[
  term ((-4718720 : Rat) / 52799) [(1, 1), (6, 2), (8, 1), (12, 2), (15, 1)]
]

/-- Partial product 753 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0753 : Poly :=
[
  term ((9437440 : Rat) / 52799) [(1, 1), (2, 1), (6, 2), (8, 1), (12, 2), (15, 1)],
  term ((-4718720 : Rat) / 52799) [(1, 1), (2, 2), (6, 2), (8, 1), (12, 2), (15, 1)],
  term ((-4718720 : Rat) / 52799) [(1, 1), (3, 2), (6, 2), (8, 1), (12, 2), (15, 1)],
  term ((-9437440 : Rat) / 52799) [(1, 1), (6, 2), (8, 1), (12, 2), (14, 1), (15, 1)],
  term ((4718720 : Rat) / 52799) [(1, 1), (6, 2), (8, 1), (12, 2), (14, 2), (15, 1)],
  term ((4718720 : Rat) / 52799) [(1, 1), (6, 2), (8, 1), (12, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 753 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0753_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0753
        rs_R005_ueqv_R005NYN_generator_05_0700_0799 =
      rs_R005_ueqv_R005NYN_partial_05_0753 := by
  native_decide

/-- Coefficient term 754 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0754 : Poly :=
[
  term ((65940144 : Rat) / 385571) [(1, 1), (6, 2), (8, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 754 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0754 : Poly :=
[
  term ((-131880288 : Rat) / 385571) [(1, 1), (2, 1), (6, 2), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((65940144 : Rat) / 385571) [(1, 1), (2, 2), (6, 2), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((65940144 : Rat) / 385571) [(1, 1), (3, 2), (6, 2), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((131880288 : Rat) / 385571) [(1, 1), (6, 2), (8, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-65940144 : Rat) / 385571) [(1, 1), (6, 2), (8, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((-65940144 : Rat) / 385571) [(1, 1), (6, 2), (8, 1), (12, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 754 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0754_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0754
        rs_R005_ueqv_R005NYN_generator_05_0700_0799 =
      rs_R005_ueqv_R005NYN_partial_05_0754 := by
  native_decide

/-- Coefficient term 755 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0755 : Poly :=
[
  term ((-4718720 : Rat) / 52799) [(1, 1), (6, 2), (12, 1), (15, 1)]
]

/-- Partial product 755 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0755 : Poly :=
[
  term ((9437440 : Rat) / 52799) [(1, 1), (2, 1), (6, 2), (12, 1), (15, 1)],
  term ((-4718720 : Rat) / 52799) [(1, 1), (2, 2), (6, 2), (12, 1), (15, 1)],
  term ((-4718720 : Rat) / 52799) [(1, 1), (3, 2), (6, 2), (12, 1), (15, 1)],
  term ((-9437440 : Rat) / 52799) [(1, 1), (6, 2), (12, 1), (14, 1), (15, 1)],
  term ((4718720 : Rat) / 52799) [(1, 1), (6, 2), (12, 1), (14, 2), (15, 1)],
  term ((4718720 : Rat) / 52799) [(1, 1), (6, 2), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 755 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0755_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0755
        rs_R005_ueqv_R005NYN_generator_05_0700_0799 =
      rs_R005_ueqv_R005NYN_partial_05_0755 := by
  native_decide

/-- Coefficient term 756 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0756 : Poly :=
[
  term ((65940144 : Rat) / 385571) [(1, 1), (6, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 756 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0756 : Poly :=
[
  term ((-131880288 : Rat) / 385571) [(1, 1), (2, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((65940144 : Rat) / 385571) [(1, 1), (2, 2), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((65940144 : Rat) / 385571) [(1, 1), (3, 2), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((131880288 : Rat) / 385571) [(1, 1), (6, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-65940144 : Rat) / 385571) [(1, 1), (6, 2), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-65940144 : Rat) / 385571) [(1, 1), (6, 2), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 756 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0756_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0756
        rs_R005_ueqv_R005NYN_generator_05_0700_0799 =
      rs_R005_ueqv_R005NYN_partial_05_0756 := by
  native_decide

/-- Coefficient term 757 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0757 : Poly :=
[
  term ((4718720 : Rat) / 52799) [(1, 1), (6, 2), (12, 2), (15, 1)]
]

/-- Partial product 757 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0757 : Poly :=
[
  term ((-9437440 : Rat) / 52799) [(1, 1), (2, 1), (6, 2), (12, 2), (15, 1)],
  term ((4718720 : Rat) / 52799) [(1, 1), (2, 2), (6, 2), (12, 2), (15, 1)],
  term ((4718720 : Rat) / 52799) [(1, 1), (3, 2), (6, 2), (12, 2), (15, 1)],
  term ((9437440 : Rat) / 52799) [(1, 1), (6, 2), (12, 2), (14, 1), (15, 1)],
  term ((-4718720 : Rat) / 52799) [(1, 1), (6, 2), (12, 2), (14, 2), (15, 1)],
  term ((-4718720 : Rat) / 52799) [(1, 1), (6, 2), (12, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 757 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0757_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0757
        rs_R005_ueqv_R005NYN_generator_05_0700_0799 =
      rs_R005_ueqv_R005NYN_partial_05_0757 := by
  native_decide

/-- Coefficient term 758 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0758 : Poly :=
[
  term ((-65940144 : Rat) / 385571) [(1, 1), (6, 2), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 758 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0758 : Poly :=
[
  term ((131880288 : Rat) / 385571) [(1, 1), (2, 1), (6, 2), (12, 2), (15, 1), (16, 1)],
  term ((-65940144 : Rat) / 385571) [(1, 1), (2, 2), (6, 2), (12, 2), (15, 1), (16, 1)],
  term ((-65940144 : Rat) / 385571) [(1, 1), (3, 2), (6, 2), (12, 2), (15, 1), (16, 1)],
  term ((-131880288 : Rat) / 385571) [(1, 1), (6, 2), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((65940144 : Rat) / 385571) [(1, 1), (6, 2), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((65940144 : Rat) / 385571) [(1, 1), (6, 2), (12, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 758 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0758_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0758
        rs_R005_ueqv_R005NYN_generator_05_0700_0799 =
      rs_R005_ueqv_R005NYN_partial_05_0758 := by
  native_decide

/-- Coefficient term 759 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0759 : Poly :=
[
  term ((47908480 : Rat) / 158397) [(1, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 759 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0759 : Poly :=
[
  term ((-95816960 : Rat) / 158397) [(1, 1), (2, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((47908480 : Rat) / 158397) [(1, 1), (2, 2), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((47908480 : Rat) / 158397) [(1, 1), (3, 2), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((95816960 : Rat) / 158397) [(1, 1), (7, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-47908480 : Rat) / 158397) [(1, 1), (7, 1), (8, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-47908480 : Rat) / 158397) [(1, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 759 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0759_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0759
        rs_R005_ueqv_R005NYN_generator_05_0700_0799 =
      rs_R005_ueqv_R005NYN_partial_05_0759 := by
  native_decide

/-- Coefficient term 760 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0760 : Poly :=
[
  term ((-215464720 : Rat) / 385571) [(1, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 760 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0760 : Poly :=
[
  term ((430929440 : Rat) / 385571) [(1, 1), (2, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-215464720 : Rat) / 385571) [(1, 1), (2, 2), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-215464720 : Rat) / 385571) [(1, 1), (3, 2), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-430929440 : Rat) / 385571) [(1, 1), (7, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((215464720 : Rat) / 385571) [(1, 1), (7, 1), (8, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((215464720 : Rat) / 385571) [(1, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 760 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0760_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0760
        rs_R005_ueqv_R005NYN_generator_05_0700_0799 =
      rs_R005_ueqv_R005NYN_partial_05_0760 := by
  native_decide

/-- Coefficient term 761 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0761 : Poly :=
[
  term ((-47908480 : Rat) / 158397) [(1, 1), (7, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 761 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0761 : Poly :=
[
  term ((95816960 : Rat) / 158397) [(1, 1), (2, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((-47908480 : Rat) / 158397) [(1, 1), (2, 2), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((-47908480 : Rat) / 158397) [(1, 1), (3, 2), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((-95816960 : Rat) / 158397) [(1, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((47908480 : Rat) / 158397) [(1, 1), (7, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((47908480 : Rat) / 158397) [(1, 1), (7, 1), (12, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 761 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0761_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0761
        rs_R005_ueqv_R005NYN_generator_05_0700_0799 =
      rs_R005_ueqv_R005NYN_partial_05_0761 := by
  native_decide

/-- Coefficient term 762 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0762 : Poly :=
[
  term ((215464720 : Rat) / 385571) [(1, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 762 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0762 : Poly :=
[
  term ((-430929440 : Rat) / 385571) [(1, 1), (2, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((215464720 : Rat) / 385571) [(1, 1), (2, 2), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((215464720 : Rat) / 385571) [(1, 1), (3, 2), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((430929440 : Rat) / 385571) [(1, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-215464720 : Rat) / 385571) [(1, 1), (7, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-215464720 : Rat) / 385571) [(1, 1), (7, 1), (12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 762 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0762_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0762
        rs_R005_ueqv_R005NYN_generator_05_0700_0799 =
      rs_R005_ueqv_R005NYN_partial_05_0762 := by
  native_decide

/-- Coefficient term 763 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0763 : Poly :=
[
  term ((7994144 : Rat) / 52799) [(1, 1), (7, 1), (13, 1), (15, 1)]
]

/-- Partial product 763 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0763 : Poly :=
[
  term ((-15988288 : Rat) / 52799) [(1, 1), (2, 1), (7, 1), (13, 1), (15, 1)],
  term ((7994144 : Rat) / 52799) [(1, 1), (2, 2), (7, 1), (13, 1), (15, 1)],
  term ((7994144 : Rat) / 52799) [(1, 1), (3, 2), (7, 1), (13, 1), (15, 1)],
  term ((15988288 : Rat) / 52799) [(1, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((-7994144 : Rat) / 52799) [(1, 1), (7, 1), (13, 1), (14, 2), (15, 1)],
  term ((-7994144 : Rat) / 52799) [(1, 1), (7, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 763 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0763_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0763
        rs_R005_ueqv_R005NYN_generator_05_0700_0799 =
      rs_R005_ueqv_R005NYN_partial_05_0763 := by
  native_decide

/-- Coefficient term 764 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0764 : Poly :=
[
  term ((-170554020 : Rat) / 385571) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 764 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0764 : Poly :=
[
  term ((341108040 : Rat) / 385571) [(1, 1), (2, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-170554020 : Rat) / 385571) [(1, 1), (2, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-170554020 : Rat) / 385571) [(1, 1), (3, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-341108040 : Rat) / 385571) [(1, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((170554020 : Rat) / 385571) [(1, 1), (7, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((170554020 : Rat) / 385571) [(1, 1), (7, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 764 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0764_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0764
        rs_R005_ueqv_R005NYN_generator_05_0700_0799 =
      rs_R005_ueqv_R005NYN_partial_05_0764 := by
  native_decide

/-- Coefficient term 765 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0765 : Poly :=
[
  term ((-9537760 : Rat) / 158397) [(1, 1), (7, 1), (15, 2)]
]

/-- Partial product 765 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0765 : Poly :=
[
  term ((19075520 : Rat) / 158397) [(1, 1), (2, 1), (7, 1), (15, 2)],
  term ((-9537760 : Rat) / 158397) [(1, 1), (2, 2), (7, 1), (15, 2)],
  term ((-9537760 : Rat) / 158397) [(1, 1), (3, 2), (7, 1), (15, 2)],
  term ((-19075520 : Rat) / 158397) [(1, 1), (7, 1), (14, 1), (15, 2)],
  term ((9537760 : Rat) / 158397) [(1, 1), (7, 1), (14, 2), (15, 2)],
  term ((9537760 : Rat) / 158397) [(1, 1), (7, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 765 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0765_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0765
        rs_R005_ueqv_R005NYN_generator_05_0700_0799 =
      rs_R005_ueqv_R005NYN_partial_05_0765 := by
  native_decide

/-- Coefficient term 766 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0766 : Poly :=
[
  term ((106348180 : Rat) / 385571) [(1, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 766 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0766 : Poly :=
[
  term ((-212696360 : Rat) / 385571) [(1, 1), (2, 1), (7, 1), (15, 2), (16, 1)],
  term ((106348180 : Rat) / 385571) [(1, 1), (2, 2), (7, 1), (15, 2), (16, 1)],
  term ((106348180 : Rat) / 385571) [(1, 1), (3, 2), (7, 1), (15, 2), (16, 1)],
  term ((212696360 : Rat) / 385571) [(1, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((-106348180 : Rat) / 385571) [(1, 1), (7, 1), (14, 2), (15, 2), (16, 1)],
  term ((-106348180 : Rat) / 385571) [(1, 1), (7, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 766 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0766_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0766
        rs_R005_ueqv_R005NYN_generator_05_0700_0799 =
      rs_R005_ueqv_R005NYN_partial_05_0766 := by
  native_decide

/-- Coefficient term 767 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0767 : Poly :=
[
  term ((3145984 : Rat) / 158397) [(1, 1), (8, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 767 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0767 : Poly :=
[
  term ((-6291968 : Rat) / 158397) [(1, 1), (2, 1), (8, 1), (9, 1), (13, 1), (15, 1)],
  term ((3145984 : Rat) / 158397) [(1, 1), (2, 2), (8, 1), (9, 1), (13, 1), (15, 1)],
  term ((3145984 : Rat) / 158397) [(1, 1), (3, 2), (8, 1), (9, 1), (13, 1), (15, 1)],
  term ((6291968 : Rat) / 158397) [(1, 1), (8, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((-3145984 : Rat) / 158397) [(1, 1), (8, 1), (9, 1), (13, 1), (14, 2), (15, 1)],
  term ((-3145984 : Rat) / 158397) [(1, 1), (8, 1), (9, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 767 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0767_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0767
        rs_R005_ueqv_R005NYN_generator_05_0700_0799 =
      rs_R005_ueqv_R005NYN_partial_05_0767 := by
  native_decide

/-- Coefficient term 768 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0768 : Poly :=
[
  term ((-90072736 : Rat) / 385571) [(1, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 768 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0768 : Poly :=
[
  term ((180145472 : Rat) / 385571) [(1, 1), (2, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-90072736 : Rat) / 385571) [(1, 1), (2, 2), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-90072736 : Rat) / 385571) [(1, 1), (3, 2), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-180145472 : Rat) / 385571) [(1, 1), (8, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((90072736 : Rat) / 385571) [(1, 1), (8, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((90072736 : Rat) / 385571) [(1, 1), (8, 1), (9, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 768 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0768_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0768
        rs_R005_ueqv_R005NYN_generator_05_0700_0799 =
      rs_R005_ueqv_R005NYN_partial_05_0768 := by
  native_decide

/-- Coefficient term 769 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0769 : Poly :=
[
  term ((-3145984 : Rat) / 158397) [(1, 1), (8, 1), (9, 1), (15, 2)]
]

/-- Partial product 769 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0769 : Poly :=
[
  term ((6291968 : Rat) / 158397) [(1, 1), (2, 1), (8, 1), (9, 1), (15, 2)],
  term ((-3145984 : Rat) / 158397) [(1, 1), (2, 2), (8, 1), (9, 1), (15, 2)],
  term ((-3145984 : Rat) / 158397) [(1, 1), (3, 2), (8, 1), (9, 1), (15, 2)],
  term ((-6291968 : Rat) / 158397) [(1, 1), (8, 1), (9, 1), (14, 1), (15, 2)],
  term ((3145984 : Rat) / 158397) [(1, 1), (8, 1), (9, 1), (14, 2), (15, 2)],
  term ((3145984 : Rat) / 158397) [(1, 1), (8, 1), (9, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 769 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0769_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0769
        rs_R005_ueqv_R005NYN_generator_05_0700_0799 =
      rs_R005_ueqv_R005NYN_partial_05_0769 := by
  native_decide

/-- Coefficient term 770 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0770 : Poly :=
[
  term ((90072736 : Rat) / 385571) [(1, 1), (8, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 770 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0770 : Poly :=
[
  term ((-180145472 : Rat) / 385571) [(1, 1), (2, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((90072736 : Rat) / 385571) [(1, 1), (2, 2), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((90072736 : Rat) / 385571) [(1, 1), (3, 2), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((180145472 : Rat) / 385571) [(1, 1), (8, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-90072736 : Rat) / 385571) [(1, 1), (8, 1), (9, 1), (14, 2), (15, 2), (16, 1)],
  term ((-90072736 : Rat) / 385571) [(1, 1), (8, 1), (9, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 770 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0770_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0770
        rs_R005_ueqv_R005NYN_generator_05_0700_0799 =
      rs_R005_ueqv_R005NYN_partial_05_0770 := by
  native_decide

/-- Coefficient term 771 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0771 : Poly :=
[
  term ((23954240 : Rat) / 158397) [(1, 1), (8, 1), (10, 1), (14, 1), (15, 1)]
]

/-- Partial product 771 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0771 : Poly :=
[
  term ((-47908480 : Rat) / 158397) [(1, 1), (2, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((23954240 : Rat) / 158397) [(1, 1), (2, 2), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((23954240 : Rat) / 158397) [(1, 1), (3, 2), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((-23954240 : Rat) / 158397) [(1, 1), (8, 1), (10, 1), (14, 1), (15, 3)],
  term ((47908480 : Rat) / 158397) [(1, 1), (8, 1), (10, 1), (14, 2), (15, 1)],
  term ((-23954240 : Rat) / 158397) [(1, 1), (8, 1), (10, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 771 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0771_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0771
        rs_R005_ueqv_R005NYN_generator_05_0700_0799 =
      rs_R005_ueqv_R005NYN_partial_05_0771 := by
  native_decide

/-- Coefficient term 772 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0772 : Poly :=
[
  term ((-107732360 : Rat) / 385571) [(1, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 772 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0772 : Poly :=
[
  term ((215464720 : Rat) / 385571) [(1, 1), (2, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-107732360 : Rat) / 385571) [(1, 1), (2, 2), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-107732360 : Rat) / 385571) [(1, 1), (3, 2), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((107732360 : Rat) / 385571) [(1, 1), (8, 1), (10, 1), (14, 1), (15, 3), (16, 1)],
  term ((-215464720 : Rat) / 385571) [(1, 1), (8, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((107732360 : Rat) / 385571) [(1, 1), (8, 1), (10, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 772 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0772_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0772
        rs_R005_ueqv_R005NYN_generator_05_0700_0799 =
      rs_R005_ueqv_R005NYN_partial_05_0772 := by
  native_decide

/-- Coefficient term 773 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0773 : Poly :=
[
  term ((2217440 : Rat) / 52799) [(1, 1), (8, 1), (10, 1), (15, 1)]
]

/-- Partial product 773 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0773 : Poly :=
[
  term ((-4434880 : Rat) / 52799) [(1, 1), (2, 1), (8, 1), (10, 1), (15, 1)],
  term ((2217440 : Rat) / 52799) [(1, 1), (2, 2), (8, 1), (10, 1), (15, 1)],
  term ((2217440 : Rat) / 52799) [(1, 1), (3, 2), (8, 1), (10, 1), (15, 1)],
  term ((4434880 : Rat) / 52799) [(1, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((-2217440 : Rat) / 52799) [(1, 1), (8, 1), (10, 1), (14, 2), (15, 1)],
  term ((-2217440 : Rat) / 52799) [(1, 1), (8, 1), (10, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 773 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0773_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0773
        rs_R005_ueqv_R005NYN_generator_05_0700_0799 =
      rs_R005_ueqv_R005NYN_partial_05_0773 := by
  native_decide

/-- Coefficient term 774 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0774 : Poly :=
[
  term ((-64646340 : Rat) / 385571) [(1, 1), (8, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 774 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0774 : Poly :=
[
  term ((129292680 : Rat) / 385571) [(1, 1), (2, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-64646340 : Rat) / 385571) [(1, 1), (2, 2), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-64646340 : Rat) / 385571) [(1, 1), (3, 2), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-129292680 : Rat) / 385571) [(1, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((64646340 : Rat) / 385571) [(1, 1), (8, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((64646340 : Rat) / 385571) [(1, 1), (8, 1), (10, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 774 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0774_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0774
        rs_R005_ueqv_R005NYN_generator_05_0700_0799 =
      rs_R005_ueqv_R005NYN_partial_05_0774 := by
  native_decide

/-- Coefficient term 775 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0775 : Poly :=
[
  term ((1351680 : Rat) / 52799) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 775 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0775 : Poly :=
[
  term ((-2703360 : Rat) / 52799) [(1, 1), (2, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((1351680 : Rat) / 52799) [(1, 1), (2, 2), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((1351680 : Rat) / 52799) [(1, 1), (3, 2), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((2703360 : Rat) / 52799) [(1, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1351680 : Rat) / 52799) [(1, 1), (8, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((-1351680 : Rat) / 52799) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 775 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0775_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0775
        rs_R005_ueqv_R005NYN_generator_05_0700_0799 =
      rs_R005_ueqv_R005NYN_partial_05_0775 := by
  native_decide

/-- Coefficient term 776 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0776 : Poly :=
[
  term ((15227712 : Rat) / 385571) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 776 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0776 : Poly :=
[
  term ((-30455424 : Rat) / 385571) [(1, 1), (2, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((15227712 : Rat) / 385571) [(1, 1), (2, 2), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((15227712 : Rat) / 385571) [(1, 1), (3, 2), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((30455424 : Rat) / 385571) [(1, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-15227712 : Rat) / 385571) [(1, 1), (8, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-15227712 : Rat) / 385571) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 776 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0776_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0776
        rs_R005_ueqv_R005NYN_generator_05_0700_0799 =
      rs_R005_ueqv_R005NYN_partial_05_0776 := by
  native_decide

/-- Coefficient term 777 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0777 : Poly :=
[
  term ((-1351680 : Rat) / 52799) [(1, 1), (8, 1), (11, 1), (15, 2)]
]

/-- Partial product 777 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0777 : Poly :=
[
  term ((2703360 : Rat) / 52799) [(1, 1), (2, 1), (8, 1), (11, 1), (15, 2)],
  term ((-1351680 : Rat) / 52799) [(1, 1), (2, 2), (8, 1), (11, 1), (15, 2)],
  term ((-1351680 : Rat) / 52799) [(1, 1), (3, 2), (8, 1), (11, 1), (15, 2)],
  term ((-2703360 : Rat) / 52799) [(1, 1), (8, 1), (11, 1), (14, 1), (15, 2)],
  term ((1351680 : Rat) / 52799) [(1, 1), (8, 1), (11, 1), (14, 2), (15, 2)],
  term ((1351680 : Rat) / 52799) [(1, 1), (8, 1), (11, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 777 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0777_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0777
        rs_R005_ueqv_R005NYN_generator_05_0700_0799 =
      rs_R005_ueqv_R005NYN_partial_05_0777 := by
  native_decide

/-- Coefficient term 778 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0778 : Poly :=
[
  term ((-15227712 : Rat) / 385571) [(1, 1), (8, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 778 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0778 : Poly :=
[
  term ((30455424 : Rat) / 385571) [(1, 1), (2, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-15227712 : Rat) / 385571) [(1, 1), (2, 2), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-15227712 : Rat) / 385571) [(1, 1), (3, 2), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-30455424 : Rat) / 385571) [(1, 1), (8, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((15227712 : Rat) / 385571) [(1, 1), (8, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((15227712 : Rat) / 385571) [(1, 1), (8, 1), (11, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 778 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0778_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0778
        rs_R005_ueqv_R005NYN_generator_05_0700_0799 =
      rs_R005_ueqv_R005NYN_partial_05_0778 := by
  native_decide

/-- Coefficient term 779 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0779 : Poly :=
[
  term ((38326784 : Rat) / 158397) [(1, 1), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 779 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0779 : Poly :=
[
  term ((-76653568 : Rat) / 158397) [(1, 1), (2, 1), (8, 1), (12, 1), (15, 1)],
  term ((38326784 : Rat) / 158397) [(1, 1), (2, 2), (8, 1), (12, 1), (15, 1)],
  term ((38326784 : Rat) / 158397) [(1, 1), (3, 2), (8, 1), (12, 1), (15, 1)],
  term ((76653568 : Rat) / 158397) [(1, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-38326784 : Rat) / 158397) [(1, 1), (8, 1), (12, 1), (14, 2), (15, 1)],
  term ((-38326784 : Rat) / 158397) [(1, 1), (8, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 779 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0779_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0779
        rs_R005_ueqv_R005NYN_generator_05_0700_0799 =
      rs_R005_ueqv_R005NYN_partial_05_0779 := by
  native_decide

/-- Coefficient term 780 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0780 : Poly :=
[
  term ((-172371776 : Rat) / 385571) [(1, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 780 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0780 : Poly :=
[
  term ((344743552 : Rat) / 385571) [(1, 1), (2, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-172371776 : Rat) / 385571) [(1, 1), (2, 2), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-172371776 : Rat) / 385571) [(1, 1), (3, 2), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-344743552 : Rat) / 385571) [(1, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((172371776 : Rat) / 385571) [(1, 1), (8, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((172371776 : Rat) / 385571) [(1, 1), (8, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 780 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0780_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0780
        rs_R005_ueqv_R005NYN_generator_05_0700_0799 =
      rs_R005_ueqv_R005NYN_partial_05_0780 := by
  native_decide

/-- Coefficient term 781 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0781 : Poly :=
[
  term ((-47908480 : Rat) / 158397) [(1, 1), (8, 1), (12, 2), (15, 1)]
]

/-- Partial product 781 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0781 : Poly :=
[
  term ((95816960 : Rat) / 158397) [(1, 1), (2, 1), (8, 1), (12, 2), (15, 1)],
  term ((-47908480 : Rat) / 158397) [(1, 1), (2, 2), (8, 1), (12, 2), (15, 1)],
  term ((-47908480 : Rat) / 158397) [(1, 1), (3, 2), (8, 1), (12, 2), (15, 1)],
  term ((-95816960 : Rat) / 158397) [(1, 1), (8, 1), (12, 2), (14, 1), (15, 1)],
  term ((47908480 : Rat) / 158397) [(1, 1), (8, 1), (12, 2), (14, 2), (15, 1)],
  term ((47908480 : Rat) / 158397) [(1, 1), (8, 1), (12, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 781 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0781_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0781
        rs_R005_ueqv_R005NYN_generator_05_0700_0799 =
      rs_R005_ueqv_R005NYN_partial_05_0781 := by
  native_decide

/-- Coefficient term 782 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0782 : Poly :=
[
  term ((215464720 : Rat) / 385571) [(1, 1), (8, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 782 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0782 : Poly :=
[
  term ((-430929440 : Rat) / 385571) [(1, 1), (2, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((215464720 : Rat) / 385571) [(1, 1), (2, 2), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((215464720 : Rat) / 385571) [(1, 1), (3, 2), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((430929440 : Rat) / 385571) [(1, 1), (8, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-215464720 : Rat) / 385571) [(1, 1), (8, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((-215464720 : Rat) / 385571) [(1, 1), (8, 1), (12, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 782 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0782_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0782
        rs_R005_ueqv_R005NYN_generator_05_0700_0799 =
      rs_R005_ueqv_R005NYN_partial_05_0782 := by
  native_decide

/-- Coefficient term 783 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0783 : Poly :=
[
  term ((5734400 : Rat) / 158397) [(1, 1), (8, 1), (13, 1), (15, 2)]
]

/-- Partial product 783 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0783 : Poly :=
[
  term ((-11468800 : Rat) / 158397) [(1, 1), (2, 1), (8, 1), (13, 1), (15, 2)],
  term ((5734400 : Rat) / 158397) [(1, 1), (2, 2), (8, 1), (13, 1), (15, 2)],
  term ((5734400 : Rat) / 158397) [(1, 1), (3, 2), (8, 1), (13, 1), (15, 2)],
  term ((11468800 : Rat) / 158397) [(1, 1), (8, 1), (13, 1), (14, 1), (15, 2)],
  term ((-5734400 : Rat) / 158397) [(1, 1), (8, 1), (13, 1), (14, 2), (15, 2)],
  term ((-5734400 : Rat) / 158397) [(1, 1), (8, 1), (13, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 783 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0783_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0783
        rs_R005_ueqv_R005NYN_generator_05_0700_0799 =
      rs_R005_ueqv_R005NYN_partial_05_0783 := by
  native_decide

/-- Coefficient term 784 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0784 : Poly :=
[
  term ((-2427008 : Rat) / 385571) [(1, 1), (8, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 784 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0784 : Poly :=
[
  term ((4854016 : Rat) / 385571) [(1, 1), (2, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2427008 : Rat) / 385571) [(1, 1), (2, 2), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2427008 : Rat) / 385571) [(1, 1), (3, 2), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((-4854016 : Rat) / 385571) [(1, 1), (8, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((2427008 : Rat) / 385571) [(1, 1), (8, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((2427008 : Rat) / 385571) [(1, 1), (8, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 784 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0784_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0784
        rs_R005_ueqv_R005NYN_generator_05_0700_0799 =
      rs_R005_ueqv_R005NYN_partial_05_0784 := by
  native_decide

/-- Coefficient term 785 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0785 : Poly :=
[
  term ((-16767968 : Rat) / 158397) [(1, 1), (8, 1), (14, 1), (15, 1)]
]

/-- Partial product 785 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0785 : Poly :=
[
  term ((33535936 : Rat) / 158397) [(1, 1), (2, 1), (8, 1), (14, 1), (15, 1)],
  term ((-16767968 : Rat) / 158397) [(1, 1), (2, 2), (8, 1), (14, 1), (15, 1)],
  term ((-16767968 : Rat) / 158397) [(1, 1), (3, 2), (8, 1), (14, 1), (15, 1)],
  term ((16767968 : Rat) / 158397) [(1, 1), (8, 1), (14, 1), (15, 3)],
  term ((-33535936 : Rat) / 158397) [(1, 1), (8, 1), (14, 2), (15, 1)],
  term ((16767968 : Rat) / 158397) [(1, 1), (8, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 785 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0785_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0785
        rs_R005_ueqv_R005NYN_generator_05_0700_0799 =
      rs_R005_ueqv_R005NYN_partial_05_0785 := by
  native_decide

/-- Coefficient term 786 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0786 : Poly :=
[
  term ((75412652 : Rat) / 385571) [(1, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 786 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0786 : Poly :=
[
  term ((-150825304 : Rat) / 385571) [(1, 1), (2, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((75412652 : Rat) / 385571) [(1, 1), (2, 2), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((75412652 : Rat) / 385571) [(1, 1), (3, 2), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-75412652 : Rat) / 385571) [(1, 1), (8, 1), (14, 1), (15, 3), (16, 1)],
  term ((150825304 : Rat) / 385571) [(1, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((-75412652 : Rat) / 385571) [(1, 1), (8, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 786 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0786_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0786
        rs_R005_ueqv_R005NYN_generator_05_0700_0799 =
      rs_R005_ueqv_R005NYN_partial_05_0786 := by
  native_decide

/-- Coefficient term 787 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0787 : Poly :=
[
  term ((-1197712 : Rat) / 52799) [(1, 1), (8, 1), (15, 1)]
]

/-- Partial product 787 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0787 : Poly :=
[
  term ((2395424 : Rat) / 52799) [(1, 1), (2, 1), (8, 1), (15, 1)],
  term ((-1197712 : Rat) / 52799) [(1, 1), (2, 2), (8, 1), (15, 1)],
  term ((-1197712 : Rat) / 52799) [(1, 1), (3, 2), (8, 1), (15, 1)],
  term ((-2395424 : Rat) / 52799) [(1, 1), (8, 1), (14, 1), (15, 1)],
  term ((1197712 : Rat) / 52799) [(1, 1), (8, 1), (14, 2), (15, 1)],
  term ((1197712 : Rat) / 52799) [(1, 1), (8, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 787 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0787_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0787
        rs_R005_ueqv_R005NYN_generator_05_0700_0799 =
      rs_R005_ueqv_R005NYN_partial_05_0787 := by
  native_decide

/-- Coefficient term 788 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0788 : Poly :=
[
  term ((16159854 : Rat) / 385571) [(1, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 788 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0788 : Poly :=
[
  term ((-32319708 : Rat) / 385571) [(1, 1), (2, 1), (8, 1), (15, 1), (16, 1)],
  term ((16159854 : Rat) / 385571) [(1, 1), (2, 2), (8, 1), (15, 1), (16, 1)],
  term ((16159854 : Rat) / 385571) [(1, 1), (3, 2), (8, 1), (15, 1), (16, 1)],
  term ((32319708 : Rat) / 385571) [(1, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-16159854 : Rat) / 385571) [(1, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((-16159854 : Rat) / 385571) [(1, 1), (8, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 788 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0788_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0788
        rs_R005_ueqv_R005NYN_generator_05_0700_0799 =
      rs_R005_ueqv_R005NYN_partial_05_0788 := by
  native_decide

/-- Coefficient term 789 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0789 : Poly :=
[
  term ((-5734400 : Rat) / 158397) [(1, 1), (8, 1), (15, 3)]
]

/-- Partial product 789 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0789 : Poly :=
[
  term ((11468800 : Rat) / 158397) [(1, 1), (2, 1), (8, 1), (15, 3)],
  term ((-5734400 : Rat) / 158397) [(1, 1), (2, 2), (8, 1), (15, 3)],
  term ((-5734400 : Rat) / 158397) [(1, 1), (3, 2), (8, 1), (15, 3)],
  term ((-11468800 : Rat) / 158397) [(1, 1), (8, 1), (14, 1), (15, 3)],
  term ((5734400 : Rat) / 158397) [(1, 1), (8, 1), (14, 2), (15, 3)],
  term ((5734400 : Rat) / 158397) [(1, 1), (8, 1), (15, 5)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 789 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0789_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0789
        rs_R005_ueqv_R005NYN_generator_05_0700_0799 =
      rs_R005_ueqv_R005NYN_partial_05_0789 := by
  native_decide

/-- Coefficient term 790 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0790 : Poly :=
[
  term ((2427008 : Rat) / 385571) [(1, 1), (8, 1), (15, 3), (16, 1)]
]

/-- Partial product 790 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0790 : Poly :=
[
  term ((-4854016 : Rat) / 385571) [(1, 1), (2, 1), (8, 1), (15, 3), (16, 1)],
  term ((2427008 : Rat) / 385571) [(1, 1), (2, 2), (8, 1), (15, 3), (16, 1)],
  term ((2427008 : Rat) / 385571) [(1, 1), (3, 2), (8, 1), (15, 3), (16, 1)],
  term ((4854016 : Rat) / 385571) [(1, 1), (8, 1), (14, 1), (15, 3), (16, 1)],
  term ((-2427008 : Rat) / 385571) [(1, 1), (8, 1), (14, 2), (15, 3), (16, 1)],
  term ((-2427008 : Rat) / 385571) [(1, 1), (8, 1), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 790 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0790_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0790
        rs_R005_ueqv_R005NYN_generator_05_0700_0799 =
      rs_R005_ueqv_R005NYN_partial_05_0790 := by
  native_decide

/-- Coefficient term 791 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0791 : Poly :=
[
  term ((-102400 : Rat) / 158397) [(1, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 791 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0791 : Poly :=
[
  term ((204800 : Rat) / 158397) [(1, 1), (2, 1), (9, 1), (11, 1), (15, 1)],
  term ((-102400 : Rat) / 158397) [(1, 1), (2, 2), (9, 1), (11, 1), (15, 1)],
  term ((-102400 : Rat) / 158397) [(1, 1), (3, 2), (9, 1), (11, 1), (15, 1)],
  term ((-204800 : Rat) / 158397) [(1, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((102400 : Rat) / 158397) [(1, 1), (9, 1), (11, 1), (14, 2), (15, 1)],
  term ((102400 : Rat) / 158397) [(1, 1), (9, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 791 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0791_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0791
        rs_R005_ueqv_R005NYN_generator_05_0700_0799 =
      rs_R005_ueqv_R005NYN_partial_05_0791 := by
  native_decide

/-- Coefficient term 792 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0792 : Poly :=
[
  term ((3301792 : Rat) / 385571) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 792 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0792 : Poly :=
[
  term ((-6603584 : Rat) / 385571) [(1, 1), (2, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((3301792 : Rat) / 385571) [(1, 1), (2, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((3301792 : Rat) / 385571) [(1, 1), (3, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((6603584 : Rat) / 385571) [(1, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3301792 : Rat) / 385571) [(1, 1), (9, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3301792 : Rat) / 385571) [(1, 1), (9, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 792 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0792_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0792
        rs_R005_ueqv_R005NYN_generator_05_0700_0799 =
      rs_R005_ueqv_R005NYN_partial_05_0792 := by
  native_decide

/-- Coefficient term 793 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0793 : Poly :=
[
  term ((17379328 : Rat) / 158397) [(1, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 793 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0793 : Poly :=
[
  term ((-34758656 : Rat) / 158397) [(1, 1), (2, 1), (9, 1), (13, 1), (15, 1)],
  term ((17379328 : Rat) / 158397) [(1, 1), (2, 2), (9, 1), (13, 1), (15, 1)],
  term ((17379328 : Rat) / 158397) [(1, 1), (3, 2), (9, 1), (13, 1), (15, 1)],
  term ((34758656 : Rat) / 158397) [(1, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((-17379328 : Rat) / 158397) [(1, 1), (9, 1), (13, 1), (14, 2), (15, 1)],
  term ((-17379328 : Rat) / 158397) [(1, 1), (9, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 793 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0793_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0793
        rs_R005_ueqv_R005NYN_generator_05_0700_0799 =
      rs_R005_ueqv_R005NYN_partial_05_0793 := by
  native_decide

/-- Coefficient term 794 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0794 : Poly :=
[
  term ((10153184 : Rat) / 385571) [(1, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 794 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0794 : Poly :=
[
  term ((-20306368 : Rat) / 385571) [(1, 1), (2, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((10153184 : Rat) / 385571) [(1, 1), (2, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((10153184 : Rat) / 385571) [(1, 1), (3, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((20306368 : Rat) / 385571) [(1, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10153184 : Rat) / 385571) [(1, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-10153184 : Rat) / 385571) [(1, 1), (9, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 794 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0794_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0794
        rs_R005_ueqv_R005NYN_generator_05_0700_0799 =
      rs_R005_ueqv_R005NYN_partial_05_0794 := by
  native_decide

/-- Coefficient term 795 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0795 : Poly :=
[
  term ((-15659008 : Rat) / 158397) [(1, 1), (9, 1), (15, 2)]
]

/-- Partial product 795 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0795 : Poly :=
[
  term ((31318016 : Rat) / 158397) [(1, 1), (2, 1), (9, 1), (15, 2)],
  term ((-15659008 : Rat) / 158397) [(1, 1), (2, 2), (9, 1), (15, 2)],
  term ((-15659008 : Rat) / 158397) [(1, 1), (3, 2), (9, 1), (15, 2)],
  term ((-31318016 : Rat) / 158397) [(1, 1), (9, 1), (14, 1), (15, 2)],
  term ((15659008 : Rat) / 158397) [(1, 1), (9, 1), (14, 2), (15, 2)],
  term ((15659008 : Rat) / 158397) [(1, 1), (9, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 795 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0795_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0795
        rs_R005_ueqv_R005NYN_generator_05_0700_0799 =
      rs_R005_ueqv_R005NYN_partial_05_0795 := by
  native_decide

/-- Coefficient term 796 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0796 : Poly :=
[
  term ((-15443120 : Rat) / 385571) [(1, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 796 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0796 : Poly :=
[
  term ((30886240 : Rat) / 385571) [(1, 1), (2, 1), (9, 1), (15, 2), (16, 1)],
  term ((-15443120 : Rat) / 385571) [(1, 1), (2, 2), (9, 1), (15, 2), (16, 1)],
  term ((-15443120 : Rat) / 385571) [(1, 1), (3, 2), (9, 1), (15, 2), (16, 1)],
  term ((-30886240 : Rat) / 385571) [(1, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((15443120 : Rat) / 385571) [(1, 1), (9, 1), (14, 2), (15, 2), (16, 1)],
  term ((15443120 : Rat) / 385571) [(1, 1), (9, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 796 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0796_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0796
        rs_R005_ueqv_R005NYN_generator_05_0700_0799 =
      rs_R005_ueqv_R005NYN_partial_05_0796 := by
  native_decide

/-- Coefficient term 797 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0797 : Poly :=
[
  term ((-2129920 : Rat) / 158397) [(1, 1), (9, 2), (10, 1), (15, 1)]
]

/-- Partial product 797 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0797 : Poly :=
[
  term ((4259840 : Rat) / 158397) [(1, 1), (2, 1), (9, 2), (10, 1), (15, 1)],
  term ((-2129920 : Rat) / 158397) [(1, 1), (2, 2), (9, 2), (10, 1), (15, 1)],
  term ((-2129920 : Rat) / 158397) [(1, 1), (3, 2), (9, 2), (10, 1), (15, 1)],
  term ((-4259840 : Rat) / 158397) [(1, 1), (9, 2), (10, 1), (14, 1), (15, 1)],
  term ((2129920 : Rat) / 158397) [(1, 1), (9, 2), (10, 1), (14, 2), (15, 1)],
  term ((2129920 : Rat) / 158397) [(1, 1), (9, 2), (10, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 797 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0797_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0797
        rs_R005_ueqv_R005NYN_generator_05_0700_0799 =
      rs_R005_ueqv_R005NYN_partial_05_0797 := by
  native_decide

/-- Coefficient term 798 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0798 : Poly :=
[
  term ((-4312064 : Rat) / 385571) [(1, 1), (9, 2), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 798 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0798 : Poly :=
[
  term ((8624128 : Rat) / 385571) [(1, 1), (2, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-4312064 : Rat) / 385571) [(1, 1), (2, 2), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-4312064 : Rat) / 385571) [(1, 1), (3, 2), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-8624128 : Rat) / 385571) [(1, 1), (9, 2), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((4312064 : Rat) / 385571) [(1, 1), (9, 2), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((4312064 : Rat) / 385571) [(1, 1), (9, 2), (10, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 798 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0798_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0798
        rs_R005_ueqv_R005NYN_generator_05_0700_0799 =
      rs_R005_ueqv_R005NYN_partial_05_0798 := by
  native_decide

/-- Coefficient term 799 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0799 : Poly :=
[
  term ((1064960 : Rat) / 158397) [(1, 1), (9, 2), (14, 1), (15, 1)]
]

/-- Partial product 799 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0799 : Poly :=
[
  term ((-2129920 : Rat) / 158397) [(1, 1), (2, 1), (9, 2), (14, 1), (15, 1)],
  term ((1064960 : Rat) / 158397) [(1, 1), (2, 2), (9, 2), (14, 1), (15, 1)],
  term ((1064960 : Rat) / 158397) [(1, 1), (3, 2), (9, 2), (14, 1), (15, 1)],
  term ((-1064960 : Rat) / 158397) [(1, 1), (9, 2), (14, 1), (15, 3)],
  term ((2129920 : Rat) / 158397) [(1, 1), (9, 2), (14, 2), (15, 1)],
  term ((-1064960 : Rat) / 158397) [(1, 1), (9, 2), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 799 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0799_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0799
        rs_R005_ueqv_R005NYN_generator_05_0700_0799 =
      rs_R005_ueqv_R005NYN_partial_05_0799 := by
  native_decide

/-- Partial products in this block. -/
def rs_R005_ueqv_R005NYN_partials_05_0700_0799 : List Poly :=
[
  rs_R005_ueqv_R005NYN_partial_05_0700,
  rs_R005_ueqv_R005NYN_partial_05_0701,
  rs_R005_ueqv_R005NYN_partial_05_0702,
  rs_R005_ueqv_R005NYN_partial_05_0703,
  rs_R005_ueqv_R005NYN_partial_05_0704,
  rs_R005_ueqv_R005NYN_partial_05_0705,
  rs_R005_ueqv_R005NYN_partial_05_0706,
  rs_R005_ueqv_R005NYN_partial_05_0707,
  rs_R005_ueqv_R005NYN_partial_05_0708,
  rs_R005_ueqv_R005NYN_partial_05_0709,
  rs_R005_ueqv_R005NYN_partial_05_0710,
  rs_R005_ueqv_R005NYN_partial_05_0711,
  rs_R005_ueqv_R005NYN_partial_05_0712,
  rs_R005_ueqv_R005NYN_partial_05_0713,
  rs_R005_ueqv_R005NYN_partial_05_0714,
  rs_R005_ueqv_R005NYN_partial_05_0715,
  rs_R005_ueqv_R005NYN_partial_05_0716,
  rs_R005_ueqv_R005NYN_partial_05_0717,
  rs_R005_ueqv_R005NYN_partial_05_0718,
  rs_R005_ueqv_R005NYN_partial_05_0719,
  rs_R005_ueqv_R005NYN_partial_05_0720,
  rs_R005_ueqv_R005NYN_partial_05_0721,
  rs_R005_ueqv_R005NYN_partial_05_0722,
  rs_R005_ueqv_R005NYN_partial_05_0723,
  rs_R005_ueqv_R005NYN_partial_05_0724,
  rs_R005_ueqv_R005NYN_partial_05_0725,
  rs_R005_ueqv_R005NYN_partial_05_0726,
  rs_R005_ueqv_R005NYN_partial_05_0727,
  rs_R005_ueqv_R005NYN_partial_05_0728,
  rs_R005_ueqv_R005NYN_partial_05_0729,
  rs_R005_ueqv_R005NYN_partial_05_0730,
  rs_R005_ueqv_R005NYN_partial_05_0731,
  rs_R005_ueqv_R005NYN_partial_05_0732,
  rs_R005_ueqv_R005NYN_partial_05_0733,
  rs_R005_ueqv_R005NYN_partial_05_0734,
  rs_R005_ueqv_R005NYN_partial_05_0735,
  rs_R005_ueqv_R005NYN_partial_05_0736,
  rs_R005_ueqv_R005NYN_partial_05_0737,
  rs_R005_ueqv_R005NYN_partial_05_0738,
  rs_R005_ueqv_R005NYN_partial_05_0739,
  rs_R005_ueqv_R005NYN_partial_05_0740,
  rs_R005_ueqv_R005NYN_partial_05_0741,
  rs_R005_ueqv_R005NYN_partial_05_0742,
  rs_R005_ueqv_R005NYN_partial_05_0743,
  rs_R005_ueqv_R005NYN_partial_05_0744,
  rs_R005_ueqv_R005NYN_partial_05_0745,
  rs_R005_ueqv_R005NYN_partial_05_0746,
  rs_R005_ueqv_R005NYN_partial_05_0747,
  rs_R005_ueqv_R005NYN_partial_05_0748,
  rs_R005_ueqv_R005NYN_partial_05_0749,
  rs_R005_ueqv_R005NYN_partial_05_0750,
  rs_R005_ueqv_R005NYN_partial_05_0751,
  rs_R005_ueqv_R005NYN_partial_05_0752,
  rs_R005_ueqv_R005NYN_partial_05_0753,
  rs_R005_ueqv_R005NYN_partial_05_0754,
  rs_R005_ueqv_R005NYN_partial_05_0755,
  rs_R005_ueqv_R005NYN_partial_05_0756,
  rs_R005_ueqv_R005NYN_partial_05_0757,
  rs_R005_ueqv_R005NYN_partial_05_0758,
  rs_R005_ueqv_R005NYN_partial_05_0759,
  rs_R005_ueqv_R005NYN_partial_05_0760,
  rs_R005_ueqv_R005NYN_partial_05_0761,
  rs_R005_ueqv_R005NYN_partial_05_0762,
  rs_R005_ueqv_R005NYN_partial_05_0763,
  rs_R005_ueqv_R005NYN_partial_05_0764,
  rs_R005_ueqv_R005NYN_partial_05_0765,
  rs_R005_ueqv_R005NYN_partial_05_0766,
  rs_R005_ueqv_R005NYN_partial_05_0767,
  rs_R005_ueqv_R005NYN_partial_05_0768,
  rs_R005_ueqv_R005NYN_partial_05_0769,
  rs_R005_ueqv_R005NYN_partial_05_0770,
  rs_R005_ueqv_R005NYN_partial_05_0771,
  rs_R005_ueqv_R005NYN_partial_05_0772,
  rs_R005_ueqv_R005NYN_partial_05_0773,
  rs_R005_ueqv_R005NYN_partial_05_0774,
  rs_R005_ueqv_R005NYN_partial_05_0775,
  rs_R005_ueqv_R005NYN_partial_05_0776,
  rs_R005_ueqv_R005NYN_partial_05_0777,
  rs_R005_ueqv_R005NYN_partial_05_0778,
  rs_R005_ueqv_R005NYN_partial_05_0779,
  rs_R005_ueqv_R005NYN_partial_05_0780,
  rs_R005_ueqv_R005NYN_partial_05_0781,
  rs_R005_ueqv_R005NYN_partial_05_0782,
  rs_R005_ueqv_R005NYN_partial_05_0783,
  rs_R005_ueqv_R005NYN_partial_05_0784,
  rs_R005_ueqv_R005NYN_partial_05_0785,
  rs_R005_ueqv_R005NYN_partial_05_0786,
  rs_R005_ueqv_R005NYN_partial_05_0787,
  rs_R005_ueqv_R005NYN_partial_05_0788,
  rs_R005_ueqv_R005NYN_partial_05_0789,
  rs_R005_ueqv_R005NYN_partial_05_0790,
  rs_R005_ueqv_R005NYN_partial_05_0791,
  rs_R005_ueqv_R005NYN_partial_05_0792,
  rs_R005_ueqv_R005NYN_partial_05_0793,
  rs_R005_ueqv_R005NYN_partial_05_0794,
  rs_R005_ueqv_R005NYN_partial_05_0795,
  rs_R005_ueqv_R005NYN_partial_05_0796,
  rs_R005_ueqv_R005NYN_partial_05_0797,
  rs_R005_ueqv_R005NYN_partial_05_0798,
  rs_R005_ueqv_R005NYN_partial_05_0799
]

/-- Sum of partial products in this block. -/
def rs_R005_ueqv_R005NYN_block_05_0700_0799 : Poly :=
[
  term ((9437440 : Rat) / 52799) [(1, 1), (2, 1), (5, 1), (6, 1), (8, 1), (15, 2)],
  term ((-131880288 : Rat) / 385571) [(1, 1), (2, 1), (5, 1), (6, 1), (8, 1), (15, 2), (16, 1)],
  term ((-4718720 : Rat) / 52799) [(1, 1), (2, 1), (5, 1), (6, 1), (9, 1), (15, 1)],
  term ((65940144 : Rat) / 385571) [(1, 1), (2, 1), (5, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((9437440 : Rat) / 52799) [(1, 1), (2, 1), (5, 1), (6, 1), (12, 1), (15, 2)],
  term ((-131880288 : Rat) / 385571) [(1, 1), (2, 1), (5, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((4718720 : Rat) / 52799) [(1, 1), (2, 1), (5, 1), (6, 1), (15, 2)],
  term ((-65940144 : Rat) / 385571) [(1, 1), (2, 1), (5, 1), (6, 1), (15, 2), (16, 1)],
  term ((95816960 : Rat) / 158397) [(1, 1), (2, 1), (5, 1), (8, 1), (12, 1), (15, 2)],
  term ((-430929440 : Rat) / 385571) [(1, 1), (2, 1), (5, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((13235968 : Rat) / 158397) [(1, 1), (2, 1), (5, 1), (8, 1), (13, 1), (15, 1)],
  term ((-70464160 : Rat) / 385571) [(1, 1), (2, 1), (5, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-13235968 : Rat) / 158397) [(1, 1), (2, 1), (5, 1), (8, 1), (15, 2)],
  term ((70464160 : Rat) / 385571) [(1, 1), (2, 1), (5, 1), (8, 1), (15, 2), (16, 1)],
  term ((6617984 : Rat) / 158397) [(1, 1), (2, 1), (5, 1), (9, 1), (15, 1)],
  term ((-35232080 : Rat) / 385571) [(1, 1), (2, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-95816960 : Rat) / 158397) [(1, 1), (2, 1), (5, 1), (12, 1), (15, 2)],
  term ((430929440 : Rat) / 385571) [(1, 1), (2, 1), (5, 1), (12, 1), (15, 2), (16, 1)],
  term ((28985344 : Rat) / 52799) [(1, 1), (2, 1), (5, 1), (13, 1), (15, 1)],
  term ((-157242624 : Rat) / 385571) [(1, 1), (2, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((6763232 : Rat) / 158397) [(1, 1), (2, 1), (5, 1), (14, 1)],
  term ((-74122112 : Rat) / 158397) [(1, 1), (2, 1), (5, 1), (15, 2)],
  term ((108023120 : Rat) / 385571) [(1, 1), (2, 1), (5, 1), (15, 2), (16, 1)],
  term ((9437440 : Rat) / 52799) [(1, 1), (2, 1), (6, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-131880288 : Rat) / 385571) [(1, 1), (2, 1), (6, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-9437440 : Rat) / 52799) [(1, 1), (2, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((131880288 : Rat) / 385571) [(1, 1), (2, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((4718720 : Rat) / 52799) [(1, 1), (2, 1), (6, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((-65940144 : Rat) / 385571) [(1, 1), (2, 1), (6, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((2359360 : Rat) / 52799) [(1, 1), (2, 1), (6, 1), (8, 1), (10, 1), (15, 1)],
  term ((-32970072 : Rat) / 385571) [(1, 1), (2, 1), (6, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((95816960 : Rat) / 158397) [(1, 1), (2, 1), (6, 1), (8, 1), (12, 1), (15, 1)],
  term ((-430929440 : Rat) / 385571) [(1, 1), (2, 1), (6, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-124129280 : Rat) / 158397) [(1, 1), (2, 1), (6, 1), (8, 1), (12, 2), (15, 1)],
  term ((562809728 : Rat) / 385571) [(1, 1), (2, 1), (6, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-2359360 : Rat) / 52799) [(1, 1), (2, 1), (6, 1), (8, 1), (14, 1), (15, 1)],
  term ((32970072 : Rat) / 385571) [(1, 1), (2, 1), (6, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((3539040 : Rat) / 52799) [(1, 1), (2, 1), (6, 1), (8, 1), (15, 1)],
  term ((-49455108 : Rat) / 385571) [(1, 1), (2, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-4718720 : Rat) / 52799) [(1, 1), (2, 1), (6, 1), (10, 1), (14, 1), (15, 1)],
  term ((65940144 : Rat) / 385571) [(1, 1), (2, 1), (6, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2359360 : Rat) / 52799) [(1, 1), (2, 1), (6, 1), (10, 1), (15, 1)],
  term ((32970072 : Rat) / 385571) [(1, 1), (2, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((-158382784 : Rat) / 158397) [(1, 1), (2, 1), (6, 1), (12, 1), (15, 1)],
  term ((698516296 : Rat) / 385571) [(1, 1), (2, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((124129280 : Rat) / 158397) [(1, 1), (2, 1), (6, 1), (12, 2), (15, 1)],
  term ((-562809728 : Rat) / 385571) [(1, 1), (2, 1), (6, 1), (12, 2), (15, 1), (16, 1)],
  term ((645440 : Rat) / 158397) [(1, 1), (2, 1), (6, 1), (14, 1), (15, 1)],
  term ((14685160 : Rat) / 385571) [(1, 1), (2, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((11525408 : Rat) / 52799) [(1, 1), (2, 1), (6, 1), (15, 1)],
  term ((-128363988 : Rat) / 385571) [(1, 1), (2, 1), (6, 1), (15, 1), (16, 1)],
  term ((-9437440 : Rat) / 52799) [(1, 1), (2, 1), (6, 2), (8, 1), (12, 1), (15, 1)],
  term ((131880288 : Rat) / 385571) [(1, 1), (2, 1), (6, 2), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((9437440 : Rat) / 52799) [(1, 1), (2, 1), (6, 2), (8, 1), (12, 2), (15, 1)],
  term ((-131880288 : Rat) / 385571) [(1, 1), (2, 1), (6, 2), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((9437440 : Rat) / 52799) [(1, 1), (2, 1), (6, 2), (12, 1), (15, 1)],
  term ((-131880288 : Rat) / 385571) [(1, 1), (2, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((-9437440 : Rat) / 52799) [(1, 1), (2, 1), (6, 2), (12, 2), (15, 1)],
  term ((131880288 : Rat) / 385571) [(1, 1), (2, 1), (6, 2), (12, 2), (15, 1), (16, 1)],
  term ((-95816960 : Rat) / 158397) [(1, 1), (2, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((430929440 : Rat) / 385571) [(1, 1), (2, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((95816960 : Rat) / 158397) [(1, 1), (2, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((-430929440 : Rat) / 385571) [(1, 1), (2, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-15988288 : Rat) / 52799) [(1, 1), (2, 1), (7, 1), (13, 1), (15, 1)],
  term ((341108040 : Rat) / 385571) [(1, 1), (2, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((19075520 : Rat) / 158397) [(1, 1), (2, 1), (7, 1), (15, 2)],
  term ((-212696360 : Rat) / 385571) [(1, 1), (2, 1), (7, 1), (15, 2), (16, 1)],
  term ((-6291968 : Rat) / 158397) [(1, 1), (2, 1), (8, 1), (9, 1), (13, 1), (15, 1)],
  term ((180145472 : Rat) / 385571) [(1, 1), (2, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((6291968 : Rat) / 158397) [(1, 1), (2, 1), (8, 1), (9, 1), (15, 2)],
  term ((-180145472 : Rat) / 385571) [(1, 1), (2, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-47908480 : Rat) / 158397) [(1, 1), (2, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((215464720 : Rat) / 385571) [(1, 1), (2, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4434880 : Rat) / 52799) [(1, 1), (2, 1), (8, 1), (10, 1), (15, 1)],
  term ((129292680 : Rat) / 385571) [(1, 1), (2, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-2703360 : Rat) / 52799) [(1, 1), (2, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-30455424 : Rat) / 385571) [(1, 1), (2, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((2703360 : Rat) / 52799) [(1, 1), (2, 1), (8, 1), (11, 1), (15, 2)],
  term ((30455424 : Rat) / 385571) [(1, 1), (2, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-76653568 : Rat) / 158397) [(1, 1), (2, 1), (8, 1), (12, 1), (15, 1)],
  term ((344743552 : Rat) / 385571) [(1, 1), (2, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((95816960 : Rat) / 158397) [(1, 1), (2, 1), (8, 1), (12, 2), (15, 1)],
  term ((-430929440 : Rat) / 385571) [(1, 1), (2, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-11468800 : Rat) / 158397) [(1, 1), (2, 1), (8, 1), (13, 1), (15, 2)],
  term ((4854016 : Rat) / 385571) [(1, 1), (2, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((33535936 : Rat) / 158397) [(1, 1), (2, 1), (8, 1), (14, 1), (15, 1)],
  term ((-150825304 : Rat) / 385571) [(1, 1), (2, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((2395424 : Rat) / 52799) [(1, 1), (2, 1), (8, 1), (15, 1)],
  term ((-32319708 : Rat) / 385571) [(1, 1), (2, 1), (8, 1), (15, 1), (16, 1)],
  term ((11468800 : Rat) / 158397) [(1, 1), (2, 1), (8, 1), (15, 3)],
  term ((-4854016 : Rat) / 385571) [(1, 1), (2, 1), (8, 1), (15, 3), (16, 1)],
  term ((204800 : Rat) / 158397) [(1, 1), (2, 1), (9, 1), (11, 1), (15, 1)],
  term ((-6603584 : Rat) / 385571) [(1, 1), (2, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-34758656 : Rat) / 158397) [(1, 1), (2, 1), (9, 1), (13, 1), (15, 1)],
  term ((-20306368 : Rat) / 385571) [(1, 1), (2, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((31318016 : Rat) / 158397) [(1, 1), (2, 1), (9, 1), (15, 2)],
  term ((30886240 : Rat) / 385571) [(1, 1), (2, 1), (9, 1), (15, 2), (16, 1)],
  term ((4259840 : Rat) / 158397) [(1, 1), (2, 1), (9, 2), (10, 1), (15, 1)],
  term ((8624128 : Rat) / 385571) [(1, 1), (2, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-2129920 : Rat) / 158397) [(1, 1), (2, 1), (9, 2), (14, 1), (15, 1)],
  term ((-4718720 : Rat) / 52799) [(1, 1), (2, 2), (5, 1), (6, 1), (8, 1), (15, 2)],
  term ((65940144 : Rat) / 385571) [(1, 1), (2, 2), (5, 1), (6, 1), (8, 1), (15, 2), (16, 1)],
  term ((2359360 : Rat) / 52799) [(1, 1), (2, 2), (5, 1), (6, 1), (9, 1), (15, 1)],
  term ((-32970072 : Rat) / 385571) [(1, 1), (2, 2), (5, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-4718720 : Rat) / 52799) [(1, 1), (2, 2), (5, 1), (6, 1), (12, 1), (15, 2)],
  term ((65940144 : Rat) / 385571) [(1, 1), (2, 2), (5, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-2359360 : Rat) / 52799) [(1, 1), (2, 2), (5, 1), (6, 1), (15, 2)],
  term ((32970072 : Rat) / 385571) [(1, 1), (2, 2), (5, 1), (6, 1), (15, 2), (16, 1)],
  term ((-47908480 : Rat) / 158397) [(1, 1), (2, 2), (5, 1), (8, 1), (12, 1), (15, 2)],
  term ((215464720 : Rat) / 385571) [(1, 1), (2, 2), (5, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-6617984 : Rat) / 158397) [(1, 1), (2, 2), (5, 1), (8, 1), (13, 1), (15, 1)],
  term ((35232080 : Rat) / 385571) [(1, 1), (2, 2), (5, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((6617984 : Rat) / 158397) [(1, 1), (2, 2), (5, 1), (8, 1), (15, 2)],
  term ((-35232080 : Rat) / 385571) [(1, 1), (2, 2), (5, 1), (8, 1), (15, 2), (16, 1)],
  term ((-3308992 : Rat) / 158397) [(1, 1), (2, 2), (5, 1), (9, 1), (15, 1)],
  term ((17616040 : Rat) / 385571) [(1, 1), (2, 2), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((47908480 : Rat) / 158397) [(1, 1), (2, 2), (5, 1), (12, 1), (15, 2)],
  term ((-215464720 : Rat) / 385571) [(1, 1), (2, 2), (5, 1), (12, 1), (15, 2), (16, 1)],
  term ((-14492672 : Rat) / 52799) [(1, 1), (2, 2), (5, 1), (13, 1), (15, 1)],
  term ((78621312 : Rat) / 385571) [(1, 1), (2, 2), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3381616 : Rat) / 158397) [(1, 1), (2, 2), (5, 1), (14, 1)],
  term ((37061056 : Rat) / 158397) [(1, 1), (2, 2), (5, 1), (15, 2)],
  term ((-54011560 : Rat) / 385571) [(1, 1), (2, 2), (5, 1), (15, 2), (16, 1)],
  term ((-4718720 : Rat) / 52799) [(1, 1), (2, 2), (6, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((65940144 : Rat) / 385571) [(1, 1), (2, 2), (6, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((4718720 : Rat) / 52799) [(1, 1), (2, 2), (6, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((-65940144 : Rat) / 385571) [(1, 1), (2, 2), (6, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2359360 : Rat) / 52799) [(1, 1), (2, 2), (6, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((32970072 : Rat) / 385571) [(1, 1), (2, 2), (6, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1179680 : Rat) / 52799) [(1, 1), (2, 2), (6, 1), (8, 1), (10, 1), (15, 1)],
  term ((16485036 : Rat) / 385571) [(1, 1), (2, 2), (6, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-47908480 : Rat) / 158397) [(1, 1), (2, 2), (6, 1), (8, 1), (12, 1), (15, 1)],
  term ((215464720 : Rat) / 385571) [(1, 1), (2, 2), (6, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((62064640 : Rat) / 158397) [(1, 1), (2, 2), (6, 1), (8, 1), (12, 2), (15, 1)],
  term ((-281404864 : Rat) / 385571) [(1, 1), (2, 2), (6, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((1179680 : Rat) / 52799) [(1, 1), (2, 2), (6, 1), (8, 1), (14, 1), (15, 1)],
  term ((-16485036 : Rat) / 385571) [(1, 1), (2, 2), (6, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1769520 : Rat) / 52799) [(1, 1), (2, 2), (6, 1), (8, 1), (15, 1)],
  term ((24727554 : Rat) / 385571) [(1, 1), (2, 2), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((2359360 : Rat) / 52799) [(1, 1), (2, 2), (6, 1), (10, 1), (14, 1), (15, 1)],
  term ((-32970072 : Rat) / 385571) [(1, 1), (2, 2), (6, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((1179680 : Rat) / 52799) [(1, 1), (2, 2), (6, 1), (10, 1), (15, 1)],
  term ((-16485036 : Rat) / 385571) [(1, 1), (2, 2), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((79191392 : Rat) / 158397) [(1, 1), (2, 2), (6, 1), (12, 1), (15, 1)],
  term ((-349258148 : Rat) / 385571) [(1, 1), (2, 2), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-62064640 : Rat) / 158397) [(1, 1), (2, 2), (6, 1), (12, 2), (15, 1)],
  term ((281404864 : Rat) / 385571) [(1, 1), (2, 2), (6, 1), (12, 2), (15, 1), (16, 1)],
  term ((-322720 : Rat) / 158397) [(1, 1), (2, 2), (6, 1), (14, 1), (15, 1)],
  term ((-7342580 : Rat) / 385571) [(1, 1), (2, 2), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5762704 : Rat) / 52799) [(1, 1), (2, 2), (6, 1), (15, 1)],
  term ((64181994 : Rat) / 385571) [(1, 1), (2, 2), (6, 1), (15, 1), (16, 1)],
  term ((4718720 : Rat) / 52799) [(1, 1), (2, 2), (6, 2), (8, 1), (12, 1), (15, 1)],
  term ((-65940144 : Rat) / 385571) [(1, 1), (2, 2), (6, 2), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4718720 : Rat) / 52799) [(1, 1), (2, 2), (6, 2), (8, 1), (12, 2), (15, 1)],
  term ((65940144 : Rat) / 385571) [(1, 1), (2, 2), (6, 2), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-4718720 : Rat) / 52799) [(1, 1), (2, 2), (6, 2), (12, 1), (15, 1)],
  term ((65940144 : Rat) / 385571) [(1, 1), (2, 2), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((4718720 : Rat) / 52799) [(1, 1), (2, 2), (6, 2), (12, 2), (15, 1)],
  term ((-65940144 : Rat) / 385571) [(1, 1), (2, 2), (6, 2), (12, 2), (15, 1), (16, 1)],
  term ((47908480 : Rat) / 158397) [(1, 1), (2, 2), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-215464720 : Rat) / 385571) [(1, 1), (2, 2), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-47908480 : Rat) / 158397) [(1, 1), (2, 2), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((215464720 : Rat) / 385571) [(1, 1), (2, 2), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((7994144 : Rat) / 52799) [(1, 1), (2, 2), (7, 1), (13, 1), (15, 1)],
  term ((-170554020 : Rat) / 385571) [(1, 1), (2, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-9537760 : Rat) / 158397) [(1, 1), (2, 2), (7, 1), (15, 2)],
  term ((106348180 : Rat) / 385571) [(1, 1), (2, 2), (7, 1), (15, 2), (16, 1)],
  term ((3145984 : Rat) / 158397) [(1, 1), (2, 2), (8, 1), (9, 1), (13, 1), (15, 1)],
  term ((-90072736 : Rat) / 385571) [(1, 1), (2, 2), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3145984 : Rat) / 158397) [(1, 1), (2, 2), (8, 1), (9, 1), (15, 2)],
  term ((90072736 : Rat) / 385571) [(1, 1), (2, 2), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((23954240 : Rat) / 158397) [(1, 1), (2, 2), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((-107732360 : Rat) / 385571) [(1, 1), (2, 2), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((2217440 : Rat) / 52799) [(1, 1), (2, 2), (8, 1), (10, 1), (15, 1)],
  term ((-64646340 : Rat) / 385571) [(1, 1), (2, 2), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((1351680 : Rat) / 52799) [(1, 1), (2, 2), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((15227712 : Rat) / 385571) [(1, 1), (2, 2), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1351680 : Rat) / 52799) [(1, 1), (2, 2), (8, 1), (11, 1), (15, 2)],
  term ((-15227712 : Rat) / 385571) [(1, 1), (2, 2), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((38326784 : Rat) / 158397) [(1, 1), (2, 2), (8, 1), (12, 1), (15, 1)],
  term ((-172371776 : Rat) / 385571) [(1, 1), (2, 2), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-47908480 : Rat) / 158397) [(1, 1), (2, 2), (8, 1), (12, 2), (15, 1)],
  term ((215464720 : Rat) / 385571) [(1, 1), (2, 2), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((5734400 : Rat) / 158397) [(1, 1), (2, 2), (8, 1), (13, 1), (15, 2)],
  term ((-2427008 : Rat) / 385571) [(1, 1), (2, 2), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((-16767968 : Rat) / 158397) [(1, 1), (2, 2), (8, 1), (14, 1), (15, 1)],
  term ((75412652 : Rat) / 385571) [(1, 1), (2, 2), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1197712 : Rat) / 52799) [(1, 1), (2, 2), (8, 1), (15, 1)],
  term ((16159854 : Rat) / 385571) [(1, 1), (2, 2), (8, 1), (15, 1), (16, 1)],
  term ((-5734400 : Rat) / 158397) [(1, 1), (2, 2), (8, 1), (15, 3)],
  term ((2427008 : Rat) / 385571) [(1, 1), (2, 2), (8, 1), (15, 3), (16, 1)],
  term ((-102400 : Rat) / 158397) [(1, 1), (2, 2), (9, 1), (11, 1), (15, 1)],
  term ((3301792 : Rat) / 385571) [(1, 1), (2, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((17379328 : Rat) / 158397) [(1, 1), (2, 2), (9, 1), (13, 1), (15, 1)],
  term ((10153184 : Rat) / 385571) [(1, 1), (2, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-15659008 : Rat) / 158397) [(1, 1), (2, 2), (9, 1), (15, 2)],
  term ((-15443120 : Rat) / 385571) [(1, 1), (2, 2), (9, 1), (15, 2), (16, 1)],
  term ((-2129920 : Rat) / 158397) [(1, 1), (2, 2), (9, 2), (10, 1), (15, 1)],
  term ((-4312064 : Rat) / 385571) [(1, 1), (2, 2), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((1064960 : Rat) / 158397) [(1, 1), (2, 2), (9, 2), (14, 1), (15, 1)],
  term ((-4718720 : Rat) / 52799) [(1, 1), (3, 2), (5, 1), (6, 1), (8, 1), (15, 2)],
  term ((65940144 : Rat) / 385571) [(1, 1), (3, 2), (5, 1), (6, 1), (8, 1), (15, 2), (16, 1)],
  term ((2359360 : Rat) / 52799) [(1, 1), (3, 2), (5, 1), (6, 1), (9, 1), (15, 1)],
  term ((-32970072 : Rat) / 385571) [(1, 1), (3, 2), (5, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-4718720 : Rat) / 52799) [(1, 1), (3, 2), (5, 1), (6, 1), (12, 1), (15, 2)],
  term ((65940144 : Rat) / 385571) [(1, 1), (3, 2), (5, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-2359360 : Rat) / 52799) [(1, 1), (3, 2), (5, 1), (6, 1), (15, 2)],
  term ((32970072 : Rat) / 385571) [(1, 1), (3, 2), (5, 1), (6, 1), (15, 2), (16, 1)],
  term ((-47908480 : Rat) / 158397) [(1, 1), (3, 2), (5, 1), (8, 1), (12, 1), (15, 2)],
  term ((215464720 : Rat) / 385571) [(1, 1), (3, 2), (5, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-6617984 : Rat) / 158397) [(1, 1), (3, 2), (5, 1), (8, 1), (13, 1), (15, 1)],
  term ((35232080 : Rat) / 385571) [(1, 1), (3, 2), (5, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((6617984 : Rat) / 158397) [(1, 1), (3, 2), (5, 1), (8, 1), (15, 2)],
  term ((-35232080 : Rat) / 385571) [(1, 1), (3, 2), (5, 1), (8, 1), (15, 2), (16, 1)],
  term ((-3308992 : Rat) / 158397) [(1, 1), (3, 2), (5, 1), (9, 1), (15, 1)],
  term ((17616040 : Rat) / 385571) [(1, 1), (3, 2), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((47908480 : Rat) / 158397) [(1, 1), (3, 2), (5, 1), (12, 1), (15, 2)],
  term ((-215464720 : Rat) / 385571) [(1, 1), (3, 2), (5, 1), (12, 1), (15, 2), (16, 1)],
  term ((-14492672 : Rat) / 52799) [(1, 1), (3, 2), (5, 1), (13, 1), (15, 1)],
  term ((78621312 : Rat) / 385571) [(1, 1), (3, 2), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3381616 : Rat) / 158397) [(1, 1), (3, 2), (5, 1), (14, 1)],
  term ((37061056 : Rat) / 158397) [(1, 1), (3, 2), (5, 1), (15, 2)],
  term ((-54011560 : Rat) / 385571) [(1, 1), (3, 2), (5, 1), (15, 2), (16, 1)],
  term ((-4718720 : Rat) / 52799) [(1, 1), (3, 2), (6, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((65940144 : Rat) / 385571) [(1, 1), (3, 2), (6, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((4718720 : Rat) / 52799) [(1, 1), (3, 2), (6, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((-65940144 : Rat) / 385571) [(1, 1), (3, 2), (6, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2359360 : Rat) / 52799) [(1, 1), (3, 2), (6, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((32970072 : Rat) / 385571) [(1, 1), (3, 2), (6, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1179680 : Rat) / 52799) [(1, 1), (3, 2), (6, 1), (8, 1), (10, 1), (15, 1)],
  term ((16485036 : Rat) / 385571) [(1, 1), (3, 2), (6, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-47908480 : Rat) / 158397) [(1, 1), (3, 2), (6, 1), (8, 1), (12, 1), (15, 1)],
  term ((215464720 : Rat) / 385571) [(1, 1), (3, 2), (6, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((62064640 : Rat) / 158397) [(1, 1), (3, 2), (6, 1), (8, 1), (12, 2), (15, 1)],
  term ((-281404864 : Rat) / 385571) [(1, 1), (3, 2), (6, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((1179680 : Rat) / 52799) [(1, 1), (3, 2), (6, 1), (8, 1), (14, 1), (15, 1)],
  term ((-16485036 : Rat) / 385571) [(1, 1), (3, 2), (6, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1769520 : Rat) / 52799) [(1, 1), (3, 2), (6, 1), (8, 1), (15, 1)],
  term ((24727554 : Rat) / 385571) [(1, 1), (3, 2), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((2359360 : Rat) / 52799) [(1, 1), (3, 2), (6, 1), (10, 1), (14, 1), (15, 1)],
  term ((-32970072 : Rat) / 385571) [(1, 1), (3, 2), (6, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((1179680 : Rat) / 52799) [(1, 1), (3, 2), (6, 1), (10, 1), (15, 1)],
  term ((-16485036 : Rat) / 385571) [(1, 1), (3, 2), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((79191392 : Rat) / 158397) [(1, 1), (3, 2), (6, 1), (12, 1), (15, 1)],
  term ((-349258148 : Rat) / 385571) [(1, 1), (3, 2), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-62064640 : Rat) / 158397) [(1, 1), (3, 2), (6, 1), (12, 2), (15, 1)],
  term ((281404864 : Rat) / 385571) [(1, 1), (3, 2), (6, 1), (12, 2), (15, 1), (16, 1)],
  term ((-322720 : Rat) / 158397) [(1, 1), (3, 2), (6, 1), (14, 1), (15, 1)],
  term ((-7342580 : Rat) / 385571) [(1, 1), (3, 2), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5762704 : Rat) / 52799) [(1, 1), (3, 2), (6, 1), (15, 1)],
  term ((64181994 : Rat) / 385571) [(1, 1), (3, 2), (6, 1), (15, 1), (16, 1)],
  term ((4718720 : Rat) / 52799) [(1, 1), (3, 2), (6, 2), (8, 1), (12, 1), (15, 1)],
  term ((-65940144 : Rat) / 385571) [(1, 1), (3, 2), (6, 2), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4718720 : Rat) / 52799) [(1, 1), (3, 2), (6, 2), (8, 1), (12, 2), (15, 1)],
  term ((65940144 : Rat) / 385571) [(1, 1), (3, 2), (6, 2), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-4718720 : Rat) / 52799) [(1, 1), (3, 2), (6, 2), (12, 1), (15, 1)],
  term ((65940144 : Rat) / 385571) [(1, 1), (3, 2), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((4718720 : Rat) / 52799) [(1, 1), (3, 2), (6, 2), (12, 2), (15, 1)],
  term ((-65940144 : Rat) / 385571) [(1, 1), (3, 2), (6, 2), (12, 2), (15, 1), (16, 1)],
  term ((47908480 : Rat) / 158397) [(1, 1), (3, 2), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-215464720 : Rat) / 385571) [(1, 1), (3, 2), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-47908480 : Rat) / 158397) [(1, 1), (3, 2), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((215464720 : Rat) / 385571) [(1, 1), (3, 2), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((7994144 : Rat) / 52799) [(1, 1), (3, 2), (7, 1), (13, 1), (15, 1)],
  term ((-170554020 : Rat) / 385571) [(1, 1), (3, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-9537760 : Rat) / 158397) [(1, 1), (3, 2), (7, 1), (15, 2)],
  term ((106348180 : Rat) / 385571) [(1, 1), (3, 2), (7, 1), (15, 2), (16, 1)],
  term ((3145984 : Rat) / 158397) [(1, 1), (3, 2), (8, 1), (9, 1), (13, 1), (15, 1)],
  term ((-90072736 : Rat) / 385571) [(1, 1), (3, 2), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3145984 : Rat) / 158397) [(1, 1), (3, 2), (8, 1), (9, 1), (15, 2)],
  term ((90072736 : Rat) / 385571) [(1, 1), (3, 2), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((23954240 : Rat) / 158397) [(1, 1), (3, 2), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((-107732360 : Rat) / 385571) [(1, 1), (3, 2), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((2217440 : Rat) / 52799) [(1, 1), (3, 2), (8, 1), (10, 1), (15, 1)],
  term ((-64646340 : Rat) / 385571) [(1, 1), (3, 2), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((1351680 : Rat) / 52799) [(1, 1), (3, 2), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((15227712 : Rat) / 385571) [(1, 1), (3, 2), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1351680 : Rat) / 52799) [(1, 1), (3, 2), (8, 1), (11, 1), (15, 2)],
  term ((-15227712 : Rat) / 385571) [(1, 1), (3, 2), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((38326784 : Rat) / 158397) [(1, 1), (3, 2), (8, 1), (12, 1), (15, 1)],
  term ((-172371776 : Rat) / 385571) [(1, 1), (3, 2), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-47908480 : Rat) / 158397) [(1, 1), (3, 2), (8, 1), (12, 2), (15, 1)],
  term ((215464720 : Rat) / 385571) [(1, 1), (3, 2), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((5734400 : Rat) / 158397) [(1, 1), (3, 2), (8, 1), (13, 1), (15, 2)],
  term ((-2427008 : Rat) / 385571) [(1, 1), (3, 2), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((-16767968 : Rat) / 158397) [(1, 1), (3, 2), (8, 1), (14, 1), (15, 1)],
  term ((75412652 : Rat) / 385571) [(1, 1), (3, 2), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1197712 : Rat) / 52799) [(1, 1), (3, 2), (8, 1), (15, 1)],
  term ((16159854 : Rat) / 385571) [(1, 1), (3, 2), (8, 1), (15, 1), (16, 1)],
  term ((-5734400 : Rat) / 158397) [(1, 1), (3, 2), (8, 1), (15, 3)],
  term ((2427008 : Rat) / 385571) [(1, 1), (3, 2), (8, 1), (15, 3), (16, 1)],
  term ((-102400 : Rat) / 158397) [(1, 1), (3, 2), (9, 1), (11, 1), (15, 1)],
  term ((3301792 : Rat) / 385571) [(1, 1), (3, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((17379328 : Rat) / 158397) [(1, 1), (3, 2), (9, 1), (13, 1), (15, 1)],
  term ((10153184 : Rat) / 385571) [(1, 1), (3, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-15659008 : Rat) / 158397) [(1, 1), (3, 2), (9, 1), (15, 2)],
  term ((-15443120 : Rat) / 385571) [(1, 1), (3, 2), (9, 1), (15, 2), (16, 1)],
  term ((-2129920 : Rat) / 158397) [(1, 1), (3, 2), (9, 2), (10, 1), (15, 1)],
  term ((-4312064 : Rat) / 385571) [(1, 1), (3, 2), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((1064960 : Rat) / 158397) [(1, 1), (3, 2), (9, 2), (14, 1), (15, 1)],
  term ((-9437440 : Rat) / 52799) [(1, 1), (5, 1), (6, 1), (8, 1), (14, 1), (15, 2)],
  term ((131880288 : Rat) / 385571) [(1, 1), (5, 1), (6, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((4718720 : Rat) / 52799) [(1, 1), (5, 1), (6, 1), (8, 1), (14, 2), (15, 2)],
  term ((-65940144 : Rat) / 385571) [(1, 1), (5, 1), (6, 1), (8, 1), (14, 2), (15, 2), (16, 1)],
  term ((4718720 : Rat) / 52799) [(1, 1), (5, 1), (6, 1), (8, 1), (15, 4)],
  term ((-65940144 : Rat) / 385571) [(1, 1), (5, 1), (6, 1), (8, 1), (15, 4), (16, 1)],
  term ((4718720 : Rat) / 52799) [(1, 1), (5, 1), (6, 1), (9, 1), (14, 1), (15, 1)],
  term ((-65940144 : Rat) / 385571) [(1, 1), (5, 1), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2359360 : Rat) / 52799) [(1, 1), (5, 1), (6, 1), (9, 1), (14, 2), (15, 1)],
  term ((32970072 : Rat) / 385571) [(1, 1), (5, 1), (6, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2359360 : Rat) / 52799) [(1, 1), (5, 1), (6, 1), (9, 1), (15, 3)],
  term ((32970072 : Rat) / 385571) [(1, 1), (5, 1), (6, 1), (9, 1), (15, 3), (16, 1)],
  term ((-9437440 : Rat) / 52799) [(1, 1), (5, 1), (6, 1), (12, 1), (14, 1), (15, 2)],
  term ((131880288 : Rat) / 385571) [(1, 1), (5, 1), (6, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((4718720 : Rat) / 52799) [(1, 1), (5, 1), (6, 1), (12, 1), (14, 2), (15, 2)],
  term ((-65940144 : Rat) / 385571) [(1, 1), (5, 1), (6, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((4718720 : Rat) / 52799) [(1, 1), (5, 1), (6, 1), (12, 1), (15, 4)],
  term ((-65940144 : Rat) / 385571) [(1, 1), (5, 1), (6, 1), (12, 1), (15, 4), (16, 1)],
  term ((-4718720 : Rat) / 52799) [(1, 1), (5, 1), (6, 1), (14, 1), (15, 2)],
  term ((65940144 : Rat) / 385571) [(1, 1), (5, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((2359360 : Rat) / 52799) [(1, 1), (5, 1), (6, 1), (14, 2), (15, 2)],
  term ((-32970072 : Rat) / 385571) [(1, 1), (5, 1), (6, 1), (14, 2), (15, 2), (16, 1)],
  term ((2359360 : Rat) / 52799) [(1, 1), (5, 1), (6, 1), (15, 4)],
  term ((-32970072 : Rat) / 385571) [(1, 1), (5, 1), (6, 1), (15, 4), (16, 1)],
  term ((-95816960 : Rat) / 158397) [(1, 1), (5, 1), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((430929440 : Rat) / 385571) [(1, 1), (5, 1), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((47908480 : Rat) / 158397) [(1, 1), (5, 1), (8, 1), (12, 1), (14, 2), (15, 2)],
  term ((-215464720 : Rat) / 385571) [(1, 1), (5, 1), (8, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((47908480 : Rat) / 158397) [(1, 1), (5, 1), (8, 1), (12, 1), (15, 4)],
  term ((-215464720 : Rat) / 385571) [(1, 1), (5, 1), (8, 1), (12, 1), (15, 4), (16, 1)],
  term ((-13235968 : Rat) / 158397) [(1, 1), (5, 1), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((70464160 : Rat) / 385571) [(1, 1), (5, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((6617984 : Rat) / 158397) [(1, 1), (5, 1), (8, 1), (13, 1), (14, 2), (15, 1)],
  term ((-35232080 : Rat) / 385571) [(1, 1), (5, 1), (8, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((6617984 : Rat) / 158397) [(1, 1), (5, 1), (8, 1), (13, 1), (15, 3)],
  term ((-35232080 : Rat) / 385571) [(1, 1), (5, 1), (8, 1), (13, 1), (15, 3), (16, 1)],
  term ((13235968 : Rat) / 158397) [(1, 1), (5, 1), (8, 1), (14, 1), (15, 2)],
  term ((-70464160 : Rat) / 385571) [(1, 1), (5, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-6617984 : Rat) / 158397) [(1, 1), (5, 1), (8, 1), (14, 2), (15, 2)],
  term ((35232080 : Rat) / 385571) [(1, 1), (5, 1), (8, 1), (14, 2), (15, 2), (16, 1)],
  term ((-6617984 : Rat) / 158397) [(1, 1), (5, 1), (8, 1), (15, 4)],
  term ((35232080 : Rat) / 385571) [(1, 1), (5, 1), (8, 1), (15, 4), (16, 1)],
  term ((-6617984 : Rat) / 158397) [(1, 1), (5, 1), (9, 1), (14, 1), (15, 1)],
  term ((35232080 : Rat) / 385571) [(1, 1), (5, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((3308992 : Rat) / 158397) [(1, 1), (5, 1), (9, 1), (14, 2), (15, 1)],
  term ((-17616040 : Rat) / 385571) [(1, 1), (5, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((3308992 : Rat) / 158397) [(1, 1), (5, 1), (9, 1), (15, 3)],
  term ((-17616040 : Rat) / 385571) [(1, 1), (5, 1), (9, 1), (15, 3), (16, 1)],
  term ((95816960 : Rat) / 158397) [(1, 1), (5, 1), (12, 1), (14, 1), (15, 2)],
  term ((-430929440 : Rat) / 385571) [(1, 1), (5, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-47908480 : Rat) / 158397) [(1, 1), (5, 1), (12, 1), (14, 2), (15, 2)],
  term ((215464720 : Rat) / 385571) [(1, 1), (5, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-47908480 : Rat) / 158397) [(1, 1), (5, 1), (12, 1), (15, 4)],
  term ((215464720 : Rat) / 385571) [(1, 1), (5, 1), (12, 1), (15, 4), (16, 1)],
  term ((-28985344 : Rat) / 52799) [(1, 1), (5, 1), (13, 1), (14, 1), (15, 1)],
  term ((157242624 : Rat) / 385571) [(1, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((14492672 : Rat) / 52799) [(1, 1), (5, 1), (13, 1), (14, 2), (15, 1)],
  term ((-78621312 : Rat) / 385571) [(1, 1), (5, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((14492672 : Rat) / 52799) [(1, 1), (5, 1), (13, 1), (15, 3)],
  term ((-78621312 : Rat) / 385571) [(1, 1), (5, 1), (13, 1), (15, 3), (16, 1)],
  term ((25834576 : Rat) / 52799) [(1, 1), (5, 1), (14, 1), (15, 2)],
  term ((-108023120 : Rat) / 385571) [(1, 1), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((-6763232 : Rat) / 158397) [(1, 1), (5, 1), (14, 2)],
  term ((-37061056 : Rat) / 158397) [(1, 1), (5, 1), (14, 2), (15, 2)],
  term ((54011560 : Rat) / 385571) [(1, 1), (5, 1), (14, 2), (15, 2), (16, 1)],
  term ((3381616 : Rat) / 158397) [(1, 1), (5, 1), (14, 3)],
  term ((-37061056 : Rat) / 158397) [(1, 1), (5, 1), (15, 4)],
  term ((54011560 : Rat) / 385571) [(1, 1), (5, 1), (15, 4), (16, 1)],
  term ((-9437440 : Rat) / 52799) [(1, 1), (6, 1), (7, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((131880288 : Rat) / 385571) [(1, 1), (6, 1), (7, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((4718720 : Rat) / 52799) [(1, 1), (6, 1), (7, 1), (8, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-65940144 : Rat) / 385571) [(1, 1), (6, 1), (7, 1), (8, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((4718720 : Rat) / 52799) [(1, 1), (6, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 3)],
  term ((-65940144 : Rat) / 385571) [(1, 1), (6, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((9437440 : Rat) / 52799) [(1, 1), (6, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-131880288 : Rat) / 385571) [(1, 1), (6, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4718720 : Rat) / 52799) [(1, 1), (6, 1), (7, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((65940144 : Rat) / 385571) [(1, 1), (6, 1), (7, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-4718720 : Rat) / 52799) [(1, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 3)],
  term ((65940144 : Rat) / 385571) [(1, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-2359360 : Rat) / 52799) [(1, 1), (6, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((32970072 : Rat) / 385571) [(1, 1), (6, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((2359360 : Rat) / 52799) [(1, 1), (6, 1), (8, 1), (10, 1), (14, 1), (15, 3)],
  term ((-32970072 : Rat) / 385571) [(1, 1), (6, 1), (8, 1), (10, 1), (14, 1), (15, 3), (16, 1)],
  term ((-3539040 : Rat) / 52799) [(1, 1), (6, 1), (8, 1), (10, 1), (14, 2), (15, 1)],
  term ((49455108 : Rat) / 385571) [(1, 1), (6, 1), (8, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((2359360 : Rat) / 52799) [(1, 1), (6, 1), (8, 1), (10, 1), (14, 3), (15, 1)],
  term ((-32970072 : Rat) / 385571) [(1, 1), (6, 1), (8, 1), (10, 1), (14, 3), (15, 1), (16, 1)],
  term ((1179680 : Rat) / 52799) [(1, 1), (6, 1), (8, 1), (10, 1), (15, 3)],
  term ((-16485036 : Rat) / 385571) [(1, 1), (6, 1), (8, 1), (10, 1), (15, 3), (16, 1)],
  term ((-95816960 : Rat) / 158397) [(1, 1), (6, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((430929440 : Rat) / 385571) [(1, 1), (6, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((47908480 : Rat) / 158397) [(1, 1), (6, 1), (8, 1), (12, 1), (14, 2), (15, 1)],
  term ((-215464720 : Rat) / 385571) [(1, 1), (6, 1), (8, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((47908480 : Rat) / 158397) [(1, 1), (6, 1), (8, 1), (12, 1), (15, 3)],
  term ((-215464720 : Rat) / 385571) [(1, 1), (6, 1), (8, 1), (12, 1), (15, 3), (16, 1)],
  term ((124129280 : Rat) / 158397) [(1, 1), (6, 1), (8, 1), (12, 2), (14, 1), (15, 1)],
  term ((-562809728 : Rat) / 385571) [(1, 1), (6, 1), (8, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-62064640 : Rat) / 158397) [(1, 1), (6, 1), (8, 1), (12, 2), (14, 2), (15, 1)],
  term ((281404864 : Rat) / 385571) [(1, 1), (6, 1), (8, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((-62064640 : Rat) / 158397) [(1, 1), (6, 1), (8, 1), (12, 2), (15, 3)],
  term ((281404864 : Rat) / 385571) [(1, 1), (6, 1), (8, 1), (12, 2), (15, 3), (16, 1)],
  term ((-3539040 : Rat) / 52799) [(1, 1), (6, 1), (8, 1), (14, 1), (15, 1)],
  term ((49455108 : Rat) / 385571) [(1, 1), (6, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1179680 : Rat) / 52799) [(1, 1), (6, 1), (8, 1), (14, 1), (15, 3)],
  term ((16485036 : Rat) / 385571) [(1, 1), (6, 1), (8, 1), (14, 1), (15, 3), (16, 1)],
  term ((4128880 : Rat) / 52799) [(1, 1), (6, 1), (8, 1), (14, 2), (15, 1)],
  term ((-57697626 : Rat) / 385571) [(1, 1), (6, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1179680 : Rat) / 52799) [(1, 1), (6, 1), (8, 1), (14, 3), (15, 1)],
  term ((16485036 : Rat) / 385571) [(1, 1), (6, 1), (8, 1), (14, 3), (15, 1), (16, 1)],
  term ((1769520 : Rat) / 52799) [(1, 1), (6, 1), (8, 1), (15, 3)],
  term ((-24727554 : Rat) / 385571) [(1, 1), (6, 1), (8, 1), (15, 3), (16, 1)],
  term ((2359360 : Rat) / 52799) [(1, 1), (6, 1), (10, 1), (14, 1), (15, 1)],
  term ((-32970072 : Rat) / 385571) [(1, 1), (6, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2359360 : Rat) / 52799) [(1, 1), (6, 1), (10, 1), (14, 1), (15, 3)],
  term ((32970072 : Rat) / 385571) [(1, 1), (6, 1), (10, 1), (14, 1), (15, 3), (16, 1)],
  term ((3539040 : Rat) / 52799) [(1, 1), (6, 1), (10, 1), (14, 2), (15, 1)],
  term ((-49455108 : Rat) / 385571) [(1, 1), (6, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2359360 : Rat) / 52799) [(1, 1), (6, 1), (10, 1), (14, 3), (15, 1)],
  term ((32970072 : Rat) / 385571) [(1, 1), (6, 1), (10, 1), (14, 3), (15, 1), (16, 1)],
  term ((-1179680 : Rat) / 52799) [(1, 1), (6, 1), (10, 1), (15, 3)],
  term ((16485036 : Rat) / 385571) [(1, 1), (6, 1), (10, 1), (15, 3), (16, 1)],
  term ((158382784 : Rat) / 158397) [(1, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((-698516296 : Rat) / 385571) [(1, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-79191392 : Rat) / 158397) [(1, 1), (6, 1), (12, 1), (14, 2), (15, 1)],
  term ((349258148 : Rat) / 385571) [(1, 1), (6, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-79191392 : Rat) / 158397) [(1, 1), (6, 1), (12, 1), (15, 3)],
  term ((349258148 : Rat) / 385571) [(1, 1), (6, 1), (12, 1), (15, 3), (16, 1)],
  term ((-124129280 : Rat) / 158397) [(1, 1), (6, 1), (12, 2), (14, 1), (15, 1)],
  term ((562809728 : Rat) / 385571) [(1, 1), (6, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((62064640 : Rat) / 158397) [(1, 1), (6, 1), (12, 2), (14, 2), (15, 1)],
  term ((-281404864 : Rat) / 385571) [(1, 1), (6, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((62064640 : Rat) / 158397) [(1, 1), (6, 1), (12, 2), (15, 3)],
  term ((-281404864 : Rat) / 385571) [(1, 1), (6, 1), (12, 2), (15, 3), (16, 1)],
  term ((-11525408 : Rat) / 52799) [(1, 1), (6, 1), (14, 1), (15, 1)],
  term ((128363988 : Rat) / 385571) [(1, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((322720 : Rat) / 158397) [(1, 1), (6, 1), (14, 1), (15, 3)],
  term ((7342580 : Rat) / 385571) [(1, 1), (6, 1), (14, 1), (15, 3), (16, 1)],
  term ((16642672 : Rat) / 158397) [(1, 1), (6, 1), (14, 2), (15, 1)],
  term ((-78867154 : Rat) / 385571) [(1, 1), (6, 1), (14, 2), (15, 1), (16, 1)],
  term ((322720 : Rat) / 158397) [(1, 1), (6, 1), (14, 3), (15, 1)],
  term ((7342580 : Rat) / 385571) [(1, 1), (6, 1), (14, 3), (15, 1), (16, 1)],
  term ((5762704 : Rat) / 52799) [(1, 1), (6, 1), (15, 3)],
  term ((-64181994 : Rat) / 385571) [(1, 1), (6, 1), (15, 3), (16, 1)],
  term ((9437440 : Rat) / 52799) [(1, 1), (6, 2), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-131880288 : Rat) / 385571) [(1, 1), (6, 2), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4718720 : Rat) / 52799) [(1, 1), (6, 2), (8, 1), (12, 1), (14, 2), (15, 1)],
  term ((65940144 : Rat) / 385571) [(1, 1), (6, 2), (8, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-4718720 : Rat) / 52799) [(1, 1), (6, 2), (8, 1), (12, 1), (15, 3)],
  term ((65940144 : Rat) / 385571) [(1, 1), (6, 2), (8, 1), (12, 1), (15, 3), (16, 1)],
  term ((-9437440 : Rat) / 52799) [(1, 1), (6, 2), (8, 1), (12, 2), (14, 1), (15, 1)],
  term ((131880288 : Rat) / 385571) [(1, 1), (6, 2), (8, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((4718720 : Rat) / 52799) [(1, 1), (6, 2), (8, 1), (12, 2), (14, 2), (15, 1)],
  term ((-65940144 : Rat) / 385571) [(1, 1), (6, 2), (8, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((4718720 : Rat) / 52799) [(1, 1), (6, 2), (8, 1), (12, 2), (15, 3)],
  term ((-65940144 : Rat) / 385571) [(1, 1), (6, 2), (8, 1), (12, 2), (15, 3), (16, 1)],
  term ((-9437440 : Rat) / 52799) [(1, 1), (6, 2), (12, 1), (14, 1), (15, 1)],
  term ((131880288 : Rat) / 385571) [(1, 1), (6, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((4718720 : Rat) / 52799) [(1, 1), (6, 2), (12, 1), (14, 2), (15, 1)],
  term ((-65940144 : Rat) / 385571) [(1, 1), (6, 2), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((4718720 : Rat) / 52799) [(1, 1), (6, 2), (12, 1), (15, 3)],
  term ((-65940144 : Rat) / 385571) [(1, 1), (6, 2), (12, 1), (15, 3), (16, 1)],
  term ((9437440 : Rat) / 52799) [(1, 1), (6, 2), (12, 2), (14, 1), (15, 1)],
  term ((-131880288 : Rat) / 385571) [(1, 1), (6, 2), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-4718720 : Rat) / 52799) [(1, 1), (6, 2), (12, 2), (14, 2), (15, 1)],
  term ((65940144 : Rat) / 385571) [(1, 1), (6, 2), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((-4718720 : Rat) / 52799) [(1, 1), (6, 2), (12, 2), (15, 3)],
  term ((65940144 : Rat) / 385571) [(1, 1), (6, 2), (12, 2), (15, 3), (16, 1)],
  term ((95816960 : Rat) / 158397) [(1, 1), (7, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-430929440 : Rat) / 385571) [(1, 1), (7, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-47908480 : Rat) / 158397) [(1, 1), (7, 1), (8, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((215464720 : Rat) / 385571) [(1, 1), (7, 1), (8, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-47908480 : Rat) / 158397) [(1, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 3)],
  term ((215464720 : Rat) / 385571) [(1, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-95816960 : Rat) / 158397) [(1, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((430929440 : Rat) / 385571) [(1, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((47908480 : Rat) / 158397) [(1, 1), (7, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-215464720 : Rat) / 385571) [(1, 1), (7, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((47908480 : Rat) / 158397) [(1, 1), (7, 1), (12, 1), (13, 1), (15, 3)],
  term ((-215464720 : Rat) / 385571) [(1, 1), (7, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((15988288 : Rat) / 52799) [(1, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((-341108040 : Rat) / 385571) [(1, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7994144 : Rat) / 52799) [(1, 1), (7, 1), (13, 1), (14, 2), (15, 1)],
  term ((170554020 : Rat) / 385571) [(1, 1), (7, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-7994144 : Rat) / 52799) [(1, 1), (7, 1), (13, 1), (15, 3)],
  term ((170554020 : Rat) / 385571) [(1, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((-19075520 : Rat) / 158397) [(1, 1), (7, 1), (14, 1), (15, 2)],
  term ((212696360 : Rat) / 385571) [(1, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((9537760 : Rat) / 158397) [(1, 1), (7, 1), (14, 2), (15, 2)],
  term ((-106348180 : Rat) / 385571) [(1, 1), (7, 1), (14, 2), (15, 2), (16, 1)],
  term ((9537760 : Rat) / 158397) [(1, 1), (7, 1), (15, 4)],
  term ((-106348180 : Rat) / 385571) [(1, 1), (7, 1), (15, 4), (16, 1)],
  term ((6291968 : Rat) / 158397) [(1, 1), (8, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((-180145472 : Rat) / 385571) [(1, 1), (8, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3145984 : Rat) / 158397) [(1, 1), (8, 1), (9, 1), (13, 1), (14, 2), (15, 1)],
  term ((90072736 : Rat) / 385571) [(1, 1), (8, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3145984 : Rat) / 158397) [(1, 1), (8, 1), (9, 1), (13, 1), (15, 3)],
  term ((90072736 : Rat) / 385571) [(1, 1), (8, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((-6291968 : Rat) / 158397) [(1, 1), (8, 1), (9, 1), (14, 1), (15, 2)],
  term ((180145472 : Rat) / 385571) [(1, 1), (8, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((3145984 : Rat) / 158397) [(1, 1), (8, 1), (9, 1), (14, 2), (15, 2)],
  term ((-90072736 : Rat) / 385571) [(1, 1), (8, 1), (9, 1), (14, 2), (15, 2), (16, 1)],
  term ((3145984 : Rat) / 158397) [(1, 1), (8, 1), (9, 1), (15, 4)],
  term ((-90072736 : Rat) / 385571) [(1, 1), (8, 1), (9, 1), (15, 4), (16, 1)],
  term ((4434880 : Rat) / 52799) [(1, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((-129292680 : Rat) / 385571) [(1, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-23954240 : Rat) / 158397) [(1, 1), (8, 1), (10, 1), (14, 1), (15, 3)],
  term ((107732360 : Rat) / 385571) [(1, 1), (8, 1), (10, 1), (14, 1), (15, 3), (16, 1)],
  term ((41256160 : Rat) / 158397) [(1, 1), (8, 1), (10, 1), (14, 2), (15, 1)],
  term ((-150818380 : Rat) / 385571) [(1, 1), (8, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-23954240 : Rat) / 158397) [(1, 1), (8, 1), (10, 1), (14, 3), (15, 1)],
  term ((107732360 : Rat) / 385571) [(1, 1), (8, 1), (10, 1), (14, 3), (15, 1), (16, 1)],
  term ((-2217440 : Rat) / 52799) [(1, 1), (8, 1), (10, 1), (15, 3)],
  term ((64646340 : Rat) / 385571) [(1, 1), (8, 1), (10, 1), (15, 3), (16, 1)],
  term ((2703360 : Rat) / 52799) [(1, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((30455424 : Rat) / 385571) [(1, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1351680 : Rat) / 52799) [(1, 1), (8, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((-15227712 : Rat) / 385571) [(1, 1), (8, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1351680 : Rat) / 52799) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 3)],
  term ((-15227712 : Rat) / 385571) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-2703360 : Rat) / 52799) [(1, 1), (8, 1), (11, 1), (14, 1), (15, 2)],
  term ((-30455424 : Rat) / 385571) [(1, 1), (8, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((1351680 : Rat) / 52799) [(1, 1), (8, 1), (11, 1), (14, 2), (15, 2)],
  term ((15227712 : Rat) / 385571) [(1, 1), (8, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((1351680 : Rat) / 52799) [(1, 1), (8, 1), (11, 1), (15, 4)],
  term ((15227712 : Rat) / 385571) [(1, 1), (8, 1), (11, 1), (15, 4), (16, 1)],
  term ((76653568 : Rat) / 158397) [(1, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-344743552 : Rat) / 385571) [(1, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-38326784 : Rat) / 158397) [(1, 1), (8, 1), (12, 1), (14, 2), (15, 1)],
  term ((172371776 : Rat) / 385571) [(1, 1), (8, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-38326784 : Rat) / 158397) [(1, 1), (8, 1), (12, 1), (15, 3)],
  term ((172371776 : Rat) / 385571) [(1, 1), (8, 1), (12, 1), (15, 3), (16, 1)],
  term ((-95816960 : Rat) / 158397) [(1, 1), (8, 1), (12, 2), (14, 1), (15, 1)],
  term ((430929440 : Rat) / 385571) [(1, 1), (8, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((47908480 : Rat) / 158397) [(1, 1), (8, 1), (12, 2), (14, 2), (15, 1)],
  term ((-215464720 : Rat) / 385571) [(1, 1), (8, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((47908480 : Rat) / 158397) [(1, 1), (8, 1), (12, 2), (15, 3)],
  term ((-215464720 : Rat) / 385571) [(1, 1), (8, 1), (12, 2), (15, 3), (16, 1)],
  term ((11468800 : Rat) / 158397) [(1, 1), (8, 1), (13, 1), (14, 1), (15, 2)],
  term ((-4854016 : Rat) / 385571) [(1, 1), (8, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-5734400 : Rat) / 158397) [(1, 1), (8, 1), (13, 1), (14, 2), (15, 2)],
  term ((2427008 : Rat) / 385571) [(1, 1), (8, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-5734400 : Rat) / 158397) [(1, 1), (8, 1), (13, 1), (15, 4)],
  term ((2427008 : Rat) / 385571) [(1, 1), (8, 1), (13, 1), (15, 4), (16, 1)],
  term ((-2395424 : Rat) / 52799) [(1, 1), (8, 1), (14, 1), (15, 1)],
  term ((32319708 : Rat) / 385571) [(1, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((5299168 : Rat) / 158397) [(1, 1), (8, 1), (14, 1), (15, 3)],
  term ((-70558636 : Rat) / 385571) [(1, 1), (8, 1), (14, 1), (15, 3), (16, 1)],
  term ((-29942800 : Rat) / 158397) [(1, 1), (8, 1), (14, 2), (15, 1)],
  term ((134665450 : Rat) / 385571) [(1, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((5734400 : Rat) / 158397) [(1, 1), (8, 1), (14, 2), (15, 3)],
  term ((-2427008 : Rat) / 385571) [(1, 1), (8, 1), (14, 2), (15, 3), (16, 1)],
  term ((16767968 : Rat) / 158397) [(1, 1), (8, 1), (14, 3), (15, 1)],
  term ((-75412652 : Rat) / 385571) [(1, 1), (8, 1), (14, 3), (15, 1), (16, 1)],
  term ((1197712 : Rat) / 52799) [(1, 1), (8, 1), (15, 3)],
  term ((-16159854 : Rat) / 385571) [(1, 1), (8, 1), (15, 3), (16, 1)],
  term ((5734400 : Rat) / 158397) [(1, 1), (8, 1), (15, 5)],
  term ((-2427008 : Rat) / 385571) [(1, 1), (8, 1), (15, 5), (16, 1)],
  term ((-204800 : Rat) / 158397) [(1, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((6603584 : Rat) / 385571) [(1, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((102400 : Rat) / 158397) [(1, 1), (9, 1), (11, 1), (14, 2), (15, 1)],
  term ((-3301792 : Rat) / 385571) [(1, 1), (9, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((102400 : Rat) / 158397) [(1, 1), (9, 1), (11, 1), (15, 3)],
  term ((-3301792 : Rat) / 385571) [(1, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((34758656 : Rat) / 158397) [(1, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((20306368 : Rat) / 385571) [(1, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-17379328 : Rat) / 158397) [(1, 1), (9, 1), (13, 1), (14, 2), (15, 1)],
  term ((-10153184 : Rat) / 385571) [(1, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-17379328 : Rat) / 158397) [(1, 1), (9, 1), (13, 1), (15, 3)],
  term ((-10153184 : Rat) / 385571) [(1, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((-31318016 : Rat) / 158397) [(1, 1), (9, 1), (14, 1), (15, 2)],
  term ((-30886240 : Rat) / 385571) [(1, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((15659008 : Rat) / 158397) [(1, 1), (9, 1), (14, 2), (15, 2)],
  term ((15443120 : Rat) / 385571) [(1, 1), (9, 1), (14, 2), (15, 2), (16, 1)],
  term ((15659008 : Rat) / 158397) [(1, 1), (9, 1), (15, 4)],
  term ((15443120 : Rat) / 385571) [(1, 1), (9, 1), (15, 4), (16, 1)],
  term ((-4259840 : Rat) / 158397) [(1, 1), (9, 2), (10, 1), (14, 1), (15, 1)],
  term ((-8624128 : Rat) / 385571) [(1, 1), (9, 2), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((2129920 : Rat) / 158397) [(1, 1), (9, 2), (10, 1), (14, 2), (15, 1)],
  term ((4312064 : Rat) / 385571) [(1, 1), (9, 2), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((2129920 : Rat) / 158397) [(1, 1), (9, 2), (10, 1), (15, 3)],
  term ((4312064 : Rat) / 385571) [(1, 1), (9, 2), (10, 1), (15, 3), (16, 1)],
  term ((-1064960 : Rat) / 158397) [(1, 1), (9, 2), (14, 1), (15, 3)],
  term ((2129920 : Rat) / 158397) [(1, 1), (9, 2), (14, 2), (15, 1)],
  term ((-1064960 : Rat) / 158397) [(1, 1), (9, 2), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 5, terms 700 through 799. -/
theorem rs_R005_ueqv_R005NYN_block_05_0700_0799_valid :
    checkProductSumEq rs_R005_ueqv_R005NYN_partials_05_0700_0799
      rs_R005_ueqv_R005NYN_block_05_0700_0799 = true := by
  native_decide

end R005UeqvR005NYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
