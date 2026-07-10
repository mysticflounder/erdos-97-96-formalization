/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R003:u=v:R003YY, term block 16:900-999

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R003UeqvR003YYTermShards

/-- Generator polynomial 16 for relaxed split surplus certificate `R003:u=v:R003YY`. -/
def rs_R003_ueqv_R003YY_generator_16_0900_0999 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(6, 1)]
]

/-- Coefficient term 900 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_0900 : Poly :=
[
  term ((-1244 : Rat) / 5) [(3, 1), (7, 1), (12, 1)]
]

/-- Partial product 900 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_0900 : Poly :=
[
  term ((-2488 : Rat) / 5) [(3, 1), (6, 1), (7, 1), (12, 1)],
  term ((1244 : Rat) / 5) [(3, 1), (7, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 900 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_0900_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_0900
        rs_R003_ueqv_R003YY_generator_16_0900_0999 =
      rs_R003_ueqv_R003YY_partial_16_0900 := by
  native_decide

/-- Coefficient term 901 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_0901 : Poly :=
[
  term ((1176 : Rat) / 5) [(3, 1), (7, 1), (12, 1), (14, 1)]
]

/-- Partial product 901 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_0901 : Poly :=
[
  term ((2352 : Rat) / 5) [(3, 1), (6, 1), (7, 1), (12, 1), (14, 1)],
  term ((-1176 : Rat) / 5) [(3, 1), (7, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 901 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_0901_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_0901
        rs_R003_ueqv_R003YY_generator_16_0900_0999 =
      rs_R003_ueqv_R003YY_partial_16_0901 := by
  native_decide

/-- Coefficient term 902 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_0902 : Poly :=
[
  term ((-1634 : Rat) / 35) [(3, 1), (7, 1), (14, 1)]
]

/-- Partial product 902 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_0902 : Poly :=
[
  term ((-3268 : Rat) / 35) [(3, 1), (6, 1), (7, 1), (14, 1)],
  term ((1634 : Rat) / 35) [(3, 1), (7, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 902 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_0902_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_0902
        rs_R003_ueqv_R003YY_generator_16_0900_0999 =
      rs_R003_ueqv_R003YY_partial_16_0902 := by
  native_decide

/-- Coefficient term 903 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_0903 : Poly :=
[
  term ((-27 : Rat) / 35) [(3, 1), (7, 1), (14, 1), (16, 1)]
]

/-- Partial product 903 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_0903 : Poly :=
[
  term ((-54 : Rat) / 35) [(3, 1), (6, 1), (7, 1), (14, 1), (16, 1)],
  term ((27 : Rat) / 35) [(3, 1), (7, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 903 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_0903_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_0903
        rs_R003_ueqv_R003YY_generator_16_0900_0999 =
      rs_R003_ueqv_R003YY_partial_16_0903 := by
  native_decide

/-- Coefficient term 904 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_0904 : Poly :=
[
  term ((-47 : Rat) / 35) [(3, 1), (7, 1), (16, 1)]
]

/-- Partial product 904 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_0904 : Poly :=
[
  term ((-94 : Rat) / 35) [(3, 1), (6, 1), (7, 1), (16, 1)],
  term ((47 : Rat) / 35) [(3, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 904 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_0904_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_0904
        rs_R003_ueqv_R003YY_generator_16_0900_0999 =
      rs_R003_ueqv_R003YY_partial_16_0904 := by
  native_decide

/-- Coefficient term 905 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_0905 : Poly :=
[
  term ((-156 : Rat) / 7) [(3, 1), (9, 1)]
]

/-- Partial product 905 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_0905 : Poly :=
[
  term ((-312 : Rat) / 7) [(3, 1), (6, 1), (9, 1)],
  term ((156 : Rat) / 7) [(3, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 905 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_0905_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_0905
        rs_R003_ueqv_R003YY_generator_16_0900_0999 =
      rs_R003_ueqv_R003YY_partial_16_0905 := by
  native_decide

/-- Coefficient term 906 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_0906 : Poly :=
[
  term ((-792 : Rat) / 35) [(3, 1), (9, 1), (10, 1)]
]

/-- Partial product 906 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_0906 : Poly :=
[
  term ((-1584 : Rat) / 35) [(3, 1), (6, 1), (9, 1), (10, 1)],
  term ((792 : Rat) / 35) [(3, 1), (9, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 906 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_0906_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_0906
        rs_R003_ueqv_R003YY_generator_16_0900_0999 =
      rs_R003_ueqv_R003YY_partial_16_0906 := by
  native_decide

/-- Coefficient term 907 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_0907 : Poly :=
[
  term ((1584 : Rat) / 35) [(3, 1), (9, 1), (10, 1), (12, 1)]
]

/-- Partial product 907 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_0907 : Poly :=
[
  term ((3168 : Rat) / 35) [(3, 1), (6, 1), (9, 1), (10, 1), (12, 1)],
  term ((-1584 : Rat) / 35) [(3, 1), (9, 1), (10, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 907 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_0907_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_0907
        rs_R003_ueqv_R003YY_generator_16_0900_0999 =
      rs_R003_ueqv_R003YY_partial_16_0907 := by
  native_decide

/-- Coefficient term 908 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_0908 : Poly :=
[
  term ((792 : Rat) / 35) [(3, 1), (9, 1), (10, 1), (12, 1), (14, 1)]
]

/-- Partial product 908 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_0908 : Poly :=
[
  term ((1584 : Rat) / 35) [(3, 1), (6, 1), (9, 1), (10, 1), (12, 1), (14, 1)],
  term ((-792 : Rat) / 35) [(3, 1), (9, 1), (10, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 908 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_0908_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_0908
        rs_R003_ueqv_R003YY_generator_16_0900_0999 =
      rs_R003_ueqv_R003YY_partial_16_0908 := by
  native_decide

/-- Coefficient term 909 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_0909 : Poly :=
[
  term ((-264 : Rat) / 35) [(3, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 909 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_0909 : Poly :=
[
  term ((-528 : Rat) / 35) [(3, 1), (6, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((264 : Rat) / 35) [(3, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 909 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_0909_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_0909
        rs_R003_ueqv_R003YY_generator_16_0900_0999 =
      rs_R003_ueqv_R003YY_partial_16_0909 := by
  native_decide

/-- Coefficient term 910 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_0910 : Poly :=
[
  term ((-528 : Rat) / 35) [(3, 1), (9, 1), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 910 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_0910 : Poly :=
[
  term ((-1056 : Rat) / 35) [(3, 1), (6, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((528 : Rat) / 35) [(3, 1), (9, 1), (10, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 910 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_0910_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_0910
        rs_R003_ueqv_R003YY_generator_16_0900_0999 =
      rs_R003_ueqv_R003YY_partial_16_0910 := by
  native_decide

/-- Coefficient term 911 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_0911 : Poly :=
[
  term ((-396 : Rat) / 35) [(3, 1), (9, 1), (10, 1), (14, 1)]
]

/-- Partial product 911 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_0911 : Poly :=
[
  term ((-792 : Rat) / 35) [(3, 1), (6, 1), (9, 1), (10, 1), (14, 1)],
  term ((396 : Rat) / 35) [(3, 1), (9, 1), (10, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 911 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_0911_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_0911
        rs_R003_ueqv_R003YY_generator_16_0900_0999 =
      rs_R003_ueqv_R003YY_partial_16_0911 := by
  native_decide

/-- Coefficient term 912 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_0912 : Poly :=
[
  term ((132 : Rat) / 35) [(3, 1), (9, 1), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 912 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_0912 : Poly :=
[
  term ((264 : Rat) / 35) [(3, 1), (6, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-132 : Rat) / 35) [(3, 1), (9, 1), (10, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 912 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_0912_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_0912
        rs_R003_ueqv_R003YY_generator_16_0900_0999 =
      rs_R003_ueqv_R003YY_partial_16_0912 := by
  native_decide

/-- Coefficient term 913 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_0913 : Poly :=
[
  term ((264 : Rat) / 35) [(3, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 913 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_0913 : Poly :=
[
  term ((528 : Rat) / 35) [(3, 1), (6, 1), (9, 1), (10, 1), (16, 1)],
  term ((-264 : Rat) / 35) [(3, 1), (9, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 913 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_0913_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_0913
        rs_R003_ueqv_R003YY_generator_16_0900_0999 =
      rs_R003_ueqv_R003YY_partial_16_0913 := by
  native_decide

/-- Coefficient term 914 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_0914 : Poly :=
[
  term ((6507456 : Rat) / 10675) [(3, 1), (9, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 914 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_0914 : Poly :=
[
  term ((13014912 : Rat) / 10675) [(3, 1), (6, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((-6507456 : Rat) / 10675) [(3, 1), (9, 1), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 914 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_0914_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_0914
        rs_R003_ueqv_R003YY_generator_16_0900_0999 =
      rs_R003_ueqv_R003YY_partial_16_0914 := by
  native_decide

/-- Coefficient term 915 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_0915 : Poly :=
[
  term ((-2304 : Rat) / 35) [(3, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 915 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_0915 : Poly :=
[
  term ((-4608 : Rat) / 35) [(3, 1), (6, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((2304 : Rat) / 35) [(3, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 915 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_0915_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_0915
        rs_R003_ueqv_R003YY_generator_16_0900_0999 =
      rs_R003_ueqv_R003YY_partial_16_0915 := by
  native_decide

/-- Coefficient term 916 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_0916 : Poly :=
[
  term ((768 : Rat) / 35) [(3, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 916 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_0916 : Poly :=
[
  term ((1536 : Rat) / 35) [(3, 1), (6, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-768 : Rat) / 35) [(3, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 916 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_0916_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_0916
        rs_R003_ueqv_R003YY_generator_16_0900_0999 =
      rs_R003_ueqv_R003YY_partial_16_0916 := by
  native_decide

/-- Coefficient term 917 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_0917 : Poly :=
[
  term ((-7104 : Rat) / 35) [(3, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 917 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_0917 : Poly :=
[
  term ((-14208 : Rat) / 35) [(3, 1), (6, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((7104 : Rat) / 35) [(3, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 917 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_0917_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_0917
        rs_R003_ueqv_R003YY_generator_16_0900_0999 =
      rs_R003_ueqv_R003YY_partial_16_0917 := by
  native_decide

/-- Coefficient term 918 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_0918 : Poly :=
[
  term ((6022 : Rat) / 35) [(3, 1), (9, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 918 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_0918 : Poly :=
[
  term ((12044 : Rat) / 35) [(3, 1), (6, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((-6022 : Rat) / 35) [(3, 1), (9, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 918 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_0918_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_0918
        rs_R003_ueqv_R003YY_generator_16_0900_0999 =
      rs_R003_ueqv_R003YY_partial_16_0918 := by
  native_decide

/-- Coefficient term 919 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_0919 : Poly :=
[
  term ((-726 : Rat) / 35) [(3, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 919 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_0919 : Poly :=
[
  term ((-1452 : Rat) / 35) [(3, 1), (6, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((726 : Rat) / 35) [(3, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 919 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_0919_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_0919
        rs_R003_ueqv_R003YY_generator_16_0900_0999 =
      rs_R003_ueqv_R003YY_partial_16_0919 := by
  native_decide

/-- Coefficient term 920 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_0920 : Poly :=
[
  term ((-1145568 : Rat) / 10675) [(3, 1), (9, 1), (11, 1), (12, 2), (13, 1)]
]

/-- Partial product 920 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_0920 : Poly :=
[
  term ((-2291136 : Rat) / 10675) [(3, 1), (6, 1), (9, 1), (11, 1), (12, 2), (13, 1)],
  term ((1145568 : Rat) / 10675) [(3, 1), (9, 1), (11, 1), (12, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 920 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_0920_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_0920
        rs_R003_ueqv_R003YY_generator_16_0900_0999 =
      rs_R003_ueqv_R003YY_partial_16_0920 := by
  native_decide

/-- Coefficient term 921 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_0921 : Poly :=
[
  term ((4608 : Rat) / 35) [(3, 1), (9, 1), (11, 1), (12, 2), (13, 1), (14, 1)]
]

/-- Partial product 921 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_0921 : Poly :=
[
  term ((9216 : Rat) / 35) [(3, 1), (6, 1), (9, 1), (11, 1), (12, 2), (13, 1), (14, 1)],
  term ((-4608 : Rat) / 35) [(3, 1), (9, 1), (11, 1), (12, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 921 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_0921_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_0921
        rs_R003_ueqv_R003YY_generator_16_0900_0999 =
      rs_R003_ueqv_R003YY_partial_16_0921 := by
  native_decide

/-- Coefficient term 922 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_0922 : Poly :=
[
  term ((-1536 : Rat) / 35) [(3, 1), (9, 1), (11, 1), (12, 2), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 922 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_0922 : Poly :=
[
  term ((-3072 : Rat) / 35) [(3, 1), (6, 1), (9, 1), (11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((1536 : Rat) / 35) [(3, 1), (9, 1), (11, 1), (12, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 922 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_0922_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_0922
        rs_R003_ueqv_R003YY_generator_16_0900_0999 =
      rs_R003_ueqv_R003YY_partial_16_0922 := by
  native_decide

/-- Coefficient term 923 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_0923 : Poly :=
[
  term ((1248 : Rat) / 35) [(3, 1), (9, 1), (11, 1), (12, 2), (13, 1), (16, 1)]
]

/-- Partial product 923 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_0923 : Poly :=
[
  term ((2496 : Rat) / 35) [(3, 1), (6, 1), (9, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-1248 : Rat) / 35) [(3, 1), (9, 1), (11, 1), (12, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 923 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_0923_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_0923
        rs_R003_ueqv_R003YY_generator_16_0900_0999 =
      rs_R003_ueqv_R003YY_partial_16_0923 := by
  native_decide

/-- Coefficient term 924 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_0924 : Poly :=
[
  term ((-2444 : Rat) / 35) [(3, 1), (9, 1), (11, 1), (12, 2), (15, 1)]
]

/-- Partial product 924 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_0924 : Poly :=
[
  term ((-4888 : Rat) / 35) [(3, 1), (6, 1), (9, 1), (11, 1), (12, 2), (15, 1)],
  term ((2444 : Rat) / 35) [(3, 1), (9, 1), (11, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 924 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_0924_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_0924
        rs_R003_ueqv_R003YY_generator_16_0900_0999 =
      rs_R003_ueqv_R003YY_partial_16_0924 := by
  native_decide

/-- Coefficient term 925 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_0925 : Poly :=
[
  term ((60 : Rat) / 7) [(3, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 925 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_0925 : Poly :=
[
  term ((120 : Rat) / 7) [(3, 1), (6, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-60 : Rat) / 7) [(3, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 925 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_0925_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_0925
        rs_R003_ueqv_R003YY_generator_16_0900_0999 =
      rs_R003_ueqv_R003YY_partial_16_0925 := by
  native_decide

/-- Coefficient term 926 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_0926 : Poly :=
[
  term ((144048 : Rat) / 1525) [(3, 1), (9, 1), (11, 1), (13, 1)]
]

/-- Partial product 926 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_0926 : Poly :=
[
  term ((288096 : Rat) / 1525) [(3, 1), (6, 1), (9, 1), (11, 1), (13, 1)],
  term ((-144048 : Rat) / 1525) [(3, 1), (9, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 926 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_0926_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_0926
        rs_R003_ueqv_R003YY_generator_16_0900_0999 =
      rs_R003_ueqv_R003YY_partial_16_0926 := by
  native_decide

/-- Coefficient term 927 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_0927 : Poly :=
[
  term ((4896 : Rat) / 35) [(3, 1), (9, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 927 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_0927 : Poly :=
[
  term ((9792 : Rat) / 35) [(3, 1), (6, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((-4896 : Rat) / 35) [(3, 1), (9, 1), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 927 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_0927_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_0927
        rs_R003_ueqv_R003YY_generator_16_0900_0999 =
      rs_R003_ueqv_R003YY_partial_16_0927 := by
  native_decide

/-- Coefficient term 928 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_0928 : Poly :=
[
  term ((-1632 : Rat) / 35) [(3, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 928 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_0928 : Poly :=
[
  term ((-3264 : Rat) / 35) [(3, 1), (6, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((1632 : Rat) / 35) [(3, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 928 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_0928_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_0928
        rs_R003_ueqv_R003YY_generator_16_0900_0999 =
      rs_R003_ueqv_R003YY_partial_16_0928 := by
  native_decide

/-- Coefficient term 929 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_0929 : Poly :=
[
  term ((-1104 : Rat) / 35) [(3, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 929 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_0929 : Poly :=
[
  term ((-2208 : Rat) / 35) [(3, 1), (6, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((1104 : Rat) / 35) [(3, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 929 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_0929_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_0929
        rs_R003_ueqv_R003YY_generator_16_0900_0999 =
      rs_R003_ueqv_R003YY_partial_16_0929 := by
  native_decide

/-- Coefficient term 930 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_0930 : Poly :=
[
  term ((-2356 : Rat) / 35) [(3, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 930 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_0930 : Poly :=
[
  term ((-4712 : Rat) / 35) [(3, 1), (6, 1), (9, 1), (11, 1), (15, 1)],
  term ((2356 : Rat) / 35) [(3, 1), (9, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 930 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_0930_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_0930
        rs_R003_ueqv_R003YY_generator_16_0900_0999 =
      rs_R003_ueqv_R003YY_partial_16_0930 := by
  native_decide

/-- Coefficient term 931 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_0931 : Poly :=
[
  term ((276 : Rat) / 35) [(3, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 931 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_0931 : Poly :=
[
  term ((552 : Rat) / 35) [(3, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-276 : Rat) / 35) [(3, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 931 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_0931_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_0931
        rs_R003_ueqv_R003YY_generator_16_0900_0999 =
      rs_R003_ueqv_R003YY_partial_16_0931 := by
  native_decide

/-- Coefficient term 932 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_0932 : Poly :=
[
  term ((-1152 : Rat) / 35) [(3, 1), (9, 1), (11, 2)]
]

/-- Partial product 932 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_0932 : Poly :=
[
  term ((-2304 : Rat) / 35) [(3, 1), (6, 1), (9, 1), (11, 2)],
  term ((1152 : Rat) / 35) [(3, 1), (9, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 932 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_0932_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_0932
        rs_R003_ueqv_R003YY_generator_16_0900_0999 =
      rs_R003_ueqv_R003YY_partial_16_0932 := by
  native_decide

/-- Coefficient term 933 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_0933 : Poly :=
[
  term ((7488 : Rat) / 35) [(3, 1), (9, 1), (11, 2), (12, 1)]
]

/-- Partial product 933 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_0933 : Poly :=
[
  term ((14976 : Rat) / 35) [(3, 1), (6, 1), (9, 1), (11, 2), (12, 1)],
  term ((-7488 : Rat) / 35) [(3, 1), (9, 1), (11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 933 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_0933_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_0933
        rs_R003_ueqv_R003YY_generator_16_0900_0999 =
      rs_R003_ueqv_R003YY_partial_16_0933 := by
  native_decide

/-- Coefficient term 934 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_0934 : Poly :=
[
  term ((3744 : Rat) / 35) [(3, 1), (9, 1), (11, 2), (12, 1), (14, 1)]
]

/-- Partial product 934 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_0934 : Poly :=
[
  term ((7488 : Rat) / 35) [(3, 1), (6, 1), (9, 1), (11, 2), (12, 1), (14, 1)],
  term ((-3744 : Rat) / 35) [(3, 1), (9, 1), (11, 2), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 934 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_0934_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_0934
        rs_R003_ueqv_R003YY_generator_16_0900_0999 =
      rs_R003_ueqv_R003YY_partial_16_0934 := by
  native_decide

/-- Coefficient term 935 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_0935 : Poly :=
[
  term ((-1248 : Rat) / 35) [(3, 1), (9, 1), (11, 2), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 935 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_0935 : Poly :=
[
  term ((-2496 : Rat) / 35) [(3, 1), (6, 1), (9, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((1248 : Rat) / 35) [(3, 1), (9, 1), (11, 2), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 935 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_0935_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_0935
        rs_R003_ueqv_R003YY_generator_16_0900_0999 =
      rs_R003_ueqv_R003YY_partial_16_0935 := by
  native_decide

/-- Coefficient term 936 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_0936 : Poly :=
[
  term ((-2496 : Rat) / 35) [(3, 1), (9, 1), (11, 2), (12, 1), (16, 1)]
]

/-- Partial product 936 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_0936 : Poly :=
[
  term ((-4992 : Rat) / 35) [(3, 1), (6, 1), (9, 1), (11, 2), (12, 1), (16, 1)],
  term ((2496 : Rat) / 35) [(3, 1), (9, 1), (11, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 936 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_0936_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_0936
        rs_R003_ueqv_R003YY_generator_16_0900_0999 =
      rs_R003_ueqv_R003YY_partial_16_0936 := by
  native_decide

/-- Coefficient term 937 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_0937 : Poly :=
[
  term ((-576 : Rat) / 35) [(3, 1), (9, 1), (11, 2), (14, 1)]
]

/-- Partial product 937 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_0937 : Poly :=
[
  term ((-1152 : Rat) / 35) [(3, 1), (6, 1), (9, 1), (11, 2), (14, 1)],
  term ((576 : Rat) / 35) [(3, 1), (9, 1), (11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 937 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_0937_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_0937
        rs_R003_ueqv_R003YY_generator_16_0900_0999 =
      rs_R003_ueqv_R003YY_partial_16_0937 := by
  native_decide

/-- Coefficient term 938 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_0938 : Poly :=
[
  term ((192 : Rat) / 35) [(3, 1), (9, 1), (11, 2), (14, 1), (16, 1)]
]

/-- Partial product 938 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_0938 : Poly :=
[
  term ((384 : Rat) / 35) [(3, 1), (6, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((-192 : Rat) / 35) [(3, 1), (9, 1), (11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 938 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_0938_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_0938
        rs_R003_ueqv_R003YY_generator_16_0900_0999 =
      rs_R003_ueqv_R003YY_partial_16_0938 := by
  native_decide

/-- Coefficient term 939 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_0939 : Poly :=
[
  term ((384 : Rat) / 35) [(3, 1), (9, 1), (11, 2), (16, 1)]
]

/-- Partial product 939 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_0939 : Poly :=
[
  term ((768 : Rat) / 35) [(3, 1), (6, 1), (9, 1), (11, 2), (16, 1)],
  term ((-384 : Rat) / 35) [(3, 1), (9, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 939 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_0939_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_0939
        rs_R003_ueqv_R003YY_generator_16_0900_0999 =
      rs_R003_ueqv_R003YY_partial_16_0939 := by
  native_decide

/-- Coefficient term 940 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_0940 : Poly :=
[
  term ((3732 : Rat) / 35) [(3, 1), (9, 1), (12, 1)]
]

/-- Partial product 940 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_0940 : Poly :=
[
  term ((7464 : Rat) / 35) [(3, 1), (6, 1), (9, 1), (12, 1)],
  term ((-3732 : Rat) / 35) [(3, 1), (9, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 940 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_0940_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_0940
        rs_R003_ueqv_R003YY_generator_16_0900_0999 =
      rs_R003_ueqv_R003YY_partial_16_0940 := by
  native_decide

/-- Coefficient term 941 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_0941 : Poly :=
[
  term ((1026 : Rat) / 5) [(3, 1), (9, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 941 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_0941 : Poly :=
[
  term ((2052 : Rat) / 5) [(3, 1), (6, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-1026 : Rat) / 5) [(3, 1), (9, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 941 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_0941_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_0941
        rs_R003_ueqv_R003YY_generator_16_0900_0999 =
      rs_R003_ueqv_R003YY_partial_16_0941 := by
  native_decide

/-- Coefficient term 942 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_0942 : Poly :=
[
  term ((-162 : Rat) / 5) [(3, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 942 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_0942 : Poly :=
[
  term ((-324 : Rat) / 5) [(3, 1), (6, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((162 : Rat) / 5) [(3, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 942 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_0942_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_0942
        rs_R003_ueqv_R003YY_generator_16_0900_0999 =
      rs_R003_ueqv_R003YY_partial_16_0942 := by
  native_decide

/-- Coefficient term 943 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_0943 : Poly :=
[
  term ((-2348 : Rat) / 35) [(3, 1), (9, 1), (12, 1), (14, 1)]
]

/-- Partial product 943 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_0943 : Poly :=
[
  term ((-4696 : Rat) / 35) [(3, 1), (6, 1), (9, 1), (12, 1), (14, 1)],
  term ((2348 : Rat) / 35) [(3, 1), (9, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 943 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_0943_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_0943
        rs_R003_ueqv_R003YY_generator_16_0900_0999 =
      rs_R003_ueqv_R003YY_partial_16_0943 := by
  native_decide

/-- Coefficient term 944 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_0944 : Poly :=
[
  term ((-132 : Rat) / 35) [(3, 1), (9, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 944 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_0944 : Poly :=
[
  term ((-264 : Rat) / 35) [(3, 1), (6, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((132 : Rat) / 35) [(3, 1), (9, 1), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 944 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_0944_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_0944
        rs_R003_ueqv_R003YY_generator_16_0900_0999 =
      rs_R003_ueqv_R003YY_partial_16_0944 := by
  native_decide

/-- Coefficient term 945 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_0945 : Poly :=
[
  term ((-488 : Rat) / 35) [(3, 1), (9, 1), (12, 1), (16, 1)]
]

/-- Partial product 945 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_0945 : Poly :=
[
  term ((-976 : Rat) / 35) [(3, 1), (6, 1), (9, 1), (12, 1), (16, 1)],
  term ((488 : Rat) / 35) [(3, 1), (9, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 945 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_0945_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_0945
        rs_R003_ueqv_R003YY_generator_16_0900_0999 =
      rs_R003_ueqv_R003YY_partial_16_0945 := by
  native_decide

/-- Coefficient term 946 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_0946 : Poly :=
[
  term ((-1056 : Rat) / 35) [(3, 1), (9, 1), (12, 2)]
]

/-- Partial product 946 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_0946 : Poly :=
[
  term ((-2112 : Rat) / 35) [(3, 1), (6, 1), (9, 1), (12, 2)],
  term ((1056 : Rat) / 35) [(3, 1), (9, 1), (12, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 946 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_0946_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_0946
        rs_R003_ueqv_R003YY_generator_16_0900_0999 =
      rs_R003_ueqv_R003YY_partial_16_0946 := by
  native_decide

/-- Coefficient term 947 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_0947 : Poly :=
[
  term ((320 : Rat) / 7) [(3, 1), (9, 1), (12, 2), (14, 1)]
]

/-- Partial product 947 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_0947 : Poly :=
[
  term ((640 : Rat) / 7) [(3, 1), (6, 1), (9, 1), (12, 2), (14, 1)],
  term ((-320 : Rat) / 7) [(3, 1), (9, 1), (12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 947 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_0947_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_0947
        rs_R003_ueqv_R003YY_generator_16_0900_0999 =
      rs_R003_ueqv_R003YY_partial_16_0947 := by
  native_decide

/-- Coefficient term 948 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_0948 : Poly :=
[
  term ((-48 : Rat) / 35) [(3, 1), (9, 1), (12, 2), (14, 1), (16, 1)]
]

/-- Partial product 948 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_0948 : Poly :=
[
  term ((-96 : Rat) / 35) [(3, 1), (6, 1), (9, 1), (12, 2), (14, 1), (16, 1)],
  term ((48 : Rat) / 35) [(3, 1), (9, 1), (12, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 948 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_0948_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_0948
        rs_R003_ueqv_R003YY_generator_16_0900_0999 =
      rs_R003_ueqv_R003YY_partial_16_0948 := by
  native_decide

/-- Coefficient term 949 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_0949 : Poly :=
[
  term ((-68 : Rat) / 35) [(3, 1), (9, 1), (12, 2), (16, 1)]
]

/-- Partial product 949 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_0949 : Poly :=
[
  term ((-136 : Rat) / 35) [(3, 1), (6, 1), (9, 1), (12, 2), (16, 1)],
  term ((68 : Rat) / 35) [(3, 1), (9, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 949 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_0949_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_0949
        rs_R003_ueqv_R003YY_generator_16_0900_0999 =
      rs_R003_ueqv_R003YY_partial_16_0949 := by
  native_decide

/-- Coefficient term 950 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_0950 : Poly :=
[
  term ((1269 : Rat) / 10) [(3, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 950 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_0950 : Poly :=
[
  term ((1269 : Rat) / 5) [(3, 1), (6, 1), (9, 1), (13, 1), (15, 1)],
  term ((-1269 : Rat) / 10) [(3, 1), (9, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 950 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_0950_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_0950
        rs_R003_ueqv_R003YY_generator_16_0900_0999 =
      rs_R003_ueqv_R003YY_partial_16_0950 := by
  native_decide

/-- Coefficient term 951 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_0951 : Poly :=
[
  term ((-33 : Rat) / 2) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 951 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_0951 : Poly :=
[
  term (-33 : Rat) [(3, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((33 : Rat) / 2) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 951 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_0951_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_0951
        rs_R003_ueqv_R003YY_generator_16_0900_0999 =
      rs_R003_ueqv_R003YY_partial_16_0951 := by
  native_decide

/-- Coefficient term 952 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_0952 : Poly :=
[
  term ((674 : Rat) / 35) [(3, 1), (9, 1), (14, 1)]
]

/-- Partial product 952 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_0952 : Poly :=
[
  term ((1348 : Rat) / 35) [(3, 1), (6, 1), (9, 1), (14, 1)],
  term ((-674 : Rat) / 35) [(3, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 952 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_0952_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_0952
        rs_R003_ueqv_R003YY_generator_16_0900_0999 =
      rs_R003_ueqv_R003YY_partial_16_0952 := by
  native_decide

/-- Coefficient term 953 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_0953 : Poly :=
[
  term ((12 : Rat) / 7) [(3, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 953 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_0953 : Poly :=
[
  term ((24 : Rat) / 7) [(3, 1), (6, 1), (9, 1), (14, 1), (16, 1)],
  term ((-12 : Rat) / 7) [(3, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 953 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_0953_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_0953
        rs_R003_ueqv_R003YY_generator_16_0900_0999 =
      rs_R003_ueqv_R003YY_partial_16_0953 := by
  native_decide

/-- Coefficient term 954 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_0954 : Poly :=
[
  term ((134 : Rat) / 35) [(3, 1), (9, 1), (16, 1)]
]

/-- Partial product 954 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_0954 : Poly :=
[
  term ((268 : Rat) / 35) [(3, 1), (6, 1), (9, 1), (16, 1)],
  term ((-134 : Rat) / 35) [(3, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 954 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_0954_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_0954
        rs_R003_ueqv_R003YY_generator_16_0900_0999 =
      rs_R003_ueqv_R003YY_partial_16_0954 := by
  native_decide

/-- Coefficient term 955 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_0955 : Poly :=
[
  term ((-13824 : Rat) / 35) [(3, 1), (9, 2), (11, 1), (12, 1)]
]

/-- Partial product 955 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_0955 : Poly :=
[
  term ((-27648 : Rat) / 35) [(3, 1), (6, 1), (9, 2), (11, 1), (12, 1)],
  term ((13824 : Rat) / 35) [(3, 1), (9, 2), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 955 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_0955_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_0955
        rs_R003_ueqv_R003YY_generator_16_0900_0999 =
      rs_R003_ueqv_R003YY_partial_16_0955 := by
  native_decide

/-- Coefficient term 956 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_0956 : Poly :=
[
  term ((-6912 : Rat) / 35) [(3, 1), (9, 2), (11, 1), (12, 1), (14, 1)]
]

/-- Partial product 956 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_0956 : Poly :=
[
  term ((-13824 : Rat) / 35) [(3, 1), (6, 1), (9, 2), (11, 1), (12, 1), (14, 1)],
  term ((6912 : Rat) / 35) [(3, 1), (9, 2), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 956 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_0956_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_0956
        rs_R003_ueqv_R003YY_generator_16_0900_0999 =
      rs_R003_ueqv_R003YY_partial_16_0956 := by
  native_decide

/-- Coefficient term 957 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_0957 : Poly :=
[
  term ((2304 : Rat) / 35) [(3, 1), (9, 2), (11, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 957 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_0957 : Poly :=
[
  term ((4608 : Rat) / 35) [(3, 1), (6, 1), (9, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-2304 : Rat) / 35) [(3, 1), (9, 2), (11, 1), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 957 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_0957_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_0957
        rs_R003_ueqv_R003YY_generator_16_0900_0999 =
      rs_R003_ueqv_R003YY_partial_16_0957 := by
  native_decide

/-- Coefficient term 958 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_0958 : Poly :=
[
  term ((4608 : Rat) / 35) [(3, 1), (9, 2), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 958 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_0958 : Poly :=
[
  term ((9216 : Rat) / 35) [(3, 1), (6, 1), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((-4608 : Rat) / 35) [(3, 1), (9, 2), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 958 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_0958_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_0958
        rs_R003_ueqv_R003YY_generator_16_0900_0999 =
      rs_R003_ueqv_R003YY_partial_16_0958 := by
  native_decide

/-- Coefficient term 959 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_0959 : Poly :=
[
  term (-189 : Rat) [(3, 1), (9, 2), (12, 1), (15, 1)]
]

/-- Partial product 959 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_0959 : Poly :=
[
  term (-378 : Rat) [(3, 1), (6, 1), (9, 2), (12, 1), (15, 1)],
  term (189 : Rat) [(3, 1), (9, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 959 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_0959_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_0959
        rs_R003_ueqv_R003YY_generator_16_0900_0999 =
      rs_R003_ueqv_R003YY_partial_16_0959 := by
  native_decide

/-- Coefficient term 960 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_0960 : Poly :=
[
  term ((129 : Rat) / 5) [(3, 1), (9, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 960 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_0960 : Poly :=
[
  term ((258 : Rat) / 5) [(3, 1), (6, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-129 : Rat) / 5) [(3, 1), (9, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 960 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_0960_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_0960
        rs_R003_ueqv_R003YY_generator_16_0900_0999 =
      rs_R003_ueqv_R003YY_partial_16_0960 := by
  native_decide

/-- Coefficient term 961 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_0961 : Poly :=
[
  term ((-576 : Rat) / 35) [(3, 1), (10, 1), (11, 1)]
]

/-- Partial product 961 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_0961 : Poly :=
[
  term ((-1152 : Rat) / 35) [(3, 1), (6, 1), (10, 1), (11, 1)],
  term ((576 : Rat) / 35) [(3, 1), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 961 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_0961_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_0961
        rs_R003_ueqv_R003YY_generator_16_0900_0999 =
      rs_R003_ueqv_R003YY_partial_16_0961 := by
  native_decide

/-- Coefficient term 962 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_0962 : Poly :=
[
  term ((-288 : Rat) / 35) [(3, 1), (10, 1), (11, 1), (14, 1)]
]

/-- Partial product 962 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_0962 : Poly :=
[
  term ((-576 : Rat) / 35) [(3, 1), (6, 1), (10, 1), (11, 1), (14, 1)],
  term ((288 : Rat) / 35) [(3, 1), (10, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 962 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_0962_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_0962
        rs_R003_ueqv_R003YY_generator_16_0900_0999 =
      rs_R003_ueqv_R003YY_partial_16_0962 := by
  native_decide

/-- Coefficient term 963 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_0963 : Poly :=
[
  term ((96 : Rat) / 35) [(3, 1), (10, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 963 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_0963 : Poly :=
[
  term ((192 : Rat) / 35) [(3, 1), (6, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-96 : Rat) / 35) [(3, 1), (10, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 963 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_0963_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_0963
        rs_R003_ueqv_R003YY_generator_16_0900_0999 =
      rs_R003_ueqv_R003YY_partial_16_0963 := by
  native_decide

/-- Coefficient term 964 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_0964 : Poly :=
[
  term ((192 : Rat) / 35) [(3, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 964 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_0964 : Poly :=
[
  term ((384 : Rat) / 35) [(3, 1), (6, 1), (10, 1), (11, 1), (16, 1)],
  term ((-192 : Rat) / 35) [(3, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 964 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_0964_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_0964
        rs_R003_ueqv_R003YY_generator_16_0900_0999 =
      rs_R003_ueqv_R003YY_partial_16_0964 := by
  native_decide

/-- Coefficient term 965 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_0965 : Poly :=
[
  term ((-81 : Rat) / 5) [(3, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 965 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_0965 : Poly :=
[
  term ((-162 : Rat) / 5) [(3, 1), (6, 1), (10, 1), (12, 1), (15, 1)],
  term ((81 : Rat) / 5) [(3, 1), (10, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 965 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_0965_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_0965
        rs_R003_ueqv_R003YY_generator_16_0900_0999 =
      rs_R003_ueqv_R003YY_partial_16_0965 := by
  native_decide

/-- Coefficient term 966 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_0966 : Poly :=
[
  term ((9 : Rat) / 5) [(3, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 966 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_0966 : Poly :=
[
  term ((18 : Rat) / 5) [(3, 1), (6, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-9 : Rat) / 5) [(3, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 966 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_0966_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_0966
        rs_R003_ueqv_R003YY_generator_16_0900_0999 =
      rs_R003_ueqv_R003YY_partial_16_0966 := by
  native_decide

/-- Coefficient term 967 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_0967 : Poly :=
[
  term ((-792 : Rat) / 35) [(3, 1), (10, 1), (13, 1)]
]

/-- Partial product 967 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_0967 : Poly :=
[
  term ((-1584 : Rat) / 35) [(3, 1), (6, 1), (10, 1), (13, 1)],
  term ((792 : Rat) / 35) [(3, 1), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 967 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_0967_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_0967
        rs_R003_ueqv_R003YY_generator_16_0900_0999 =
      rs_R003_ueqv_R003YY_partial_16_0967 := by
  native_decide

/-- Coefficient term 968 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_0968 : Poly :=
[
  term ((-396 : Rat) / 35) [(3, 1), (10, 1), (13, 1), (14, 1)]
]

/-- Partial product 968 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_0968 : Poly :=
[
  term ((-792 : Rat) / 35) [(3, 1), (6, 1), (10, 1), (13, 1), (14, 1)],
  term ((396 : Rat) / 35) [(3, 1), (10, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 968 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_0968_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_0968
        rs_R003_ueqv_R003YY_generator_16_0900_0999 =
      rs_R003_ueqv_R003YY_partial_16_0968 := by
  native_decide

/-- Coefficient term 969 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_0969 : Poly :=
[
  term ((132 : Rat) / 35) [(3, 1), (10, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 969 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_0969 : Poly :=
[
  term ((264 : Rat) / 35) [(3, 1), (6, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-132 : Rat) / 35) [(3, 1), (10, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 969 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_0969_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_0969
        rs_R003_ueqv_R003YY_generator_16_0900_0999 =
      rs_R003_ueqv_R003YY_partial_16_0969 := by
  native_decide

/-- Coefficient term 970 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_0970 : Poly :=
[
  term ((264 : Rat) / 35) [(3, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 970 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_0970 : Poly :=
[
  term ((528 : Rat) / 35) [(3, 1), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((-264 : Rat) / 35) [(3, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 970 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_0970_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_0970
        rs_R003_ueqv_R003YY_generator_16_0900_0999 =
      rs_R003_ueqv_R003YY_partial_16_0970 := by
  native_decide

/-- Coefficient term 971 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_0971 : Poly :=
[
  term ((-81 : Rat) / 20) [(3, 1), (10, 1), (15, 1)]
]

/-- Partial product 971 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_0971 : Poly :=
[
  term ((-81 : Rat) / 10) [(3, 1), (6, 1), (10, 1), (15, 1)],
  term ((81 : Rat) / 20) [(3, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 971 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_0971_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_0971
        rs_R003_ueqv_R003YY_generator_16_0900_0999 =
      rs_R003_ueqv_R003YY_partial_16_0971 := by
  native_decide

/-- Coefficient term 972 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_0972 : Poly :=
[
  term ((9 : Rat) / 20) [(3, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 972 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_0972 : Poly :=
[
  term ((9 : Rat) / 10) [(3, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((-9 : Rat) / 20) [(3, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 972 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_0972_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_0972
        rs_R003_ueqv_R003YY_generator_16_0900_0999 =
      rs_R003_ueqv_R003YY_partial_16_0972 := by
  native_decide

/-- Coefficient term 973 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_0973 : Poly :=
[
  term ((-324 : Rat) / 35) [(3, 1), (11, 1)]
]

/-- Partial product 973 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_0973 : Poly :=
[
  term ((-648 : Rat) / 35) [(3, 1), (6, 1), (11, 1)],
  term ((324 : Rat) / 35) [(3, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 973 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_0973_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_0973
        rs_R003_ueqv_R003YY_generator_16_0900_0999 =
      rs_R003_ueqv_R003YY_partial_16_0973 := by
  native_decide

/-- Coefficient term 974 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_0974 : Poly :=
[
  term ((6336 : Rat) / 35) [(3, 1), (11, 1), (12, 1)]
]

/-- Partial product 974 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_0974 : Poly :=
[
  term ((12672 : Rat) / 35) [(3, 1), (6, 1), (11, 1), (12, 1)],
  term ((-6336 : Rat) / 35) [(3, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 974 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_0974_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_0974
        rs_R003_ueqv_R003YY_generator_16_0900_0999 =
      rs_R003_ueqv_R003YY_partial_16_0974 := by
  native_decide

/-- Coefficient term 975 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_0975 : Poly :=
[
  term ((-1222 : Rat) / 35) [(3, 1), (11, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 975 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_0975 : Poly :=
[
  term ((-2444 : Rat) / 35) [(3, 1), (6, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((1222 : Rat) / 35) [(3, 1), (11, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 975 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_0975_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_0975
        rs_R003_ueqv_R003YY_generator_16_0900_0999 =
      rs_R003_ueqv_R003YY_partial_16_0975 := by
  native_decide

/-- Coefficient term 976 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_0976 : Poly :=
[
  term ((30 : Rat) / 7) [(3, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 976 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_0976 : Poly :=
[
  term ((60 : Rat) / 7) [(3, 1), (6, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-30 : Rat) / 7) [(3, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 976 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_0976_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_0976
        rs_R003_ueqv_R003YY_generator_16_0900_0999 =
      rs_R003_ueqv_R003YY_partial_16_0976 := by
  native_decide

/-- Coefficient term 977 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_0977 : Poly :=
[
  term ((-572784 : Rat) / 10675) [(3, 1), (11, 1), (12, 1), (13, 2)]
]

/-- Partial product 977 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_0977 : Poly :=
[
  term ((-1145568 : Rat) / 10675) [(3, 1), (6, 1), (11, 1), (12, 1), (13, 2)],
  term ((572784 : Rat) / 10675) [(3, 1), (11, 1), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 977 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_0977_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_0977
        rs_R003_ueqv_R003YY_generator_16_0900_0999 =
      rs_R003_ueqv_R003YY_partial_16_0977 := by
  native_decide

/-- Coefficient term 978 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_0978 : Poly :=
[
  term ((2304 : Rat) / 35) [(3, 1), (11, 1), (12, 1), (13, 2), (14, 1)]
]

/-- Partial product 978 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_0978 : Poly :=
[
  term ((4608 : Rat) / 35) [(3, 1), (6, 1), (11, 1), (12, 1), (13, 2), (14, 1)],
  term ((-2304 : Rat) / 35) [(3, 1), (11, 1), (12, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 978 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_0978_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_0978
        rs_R003_ueqv_R003YY_generator_16_0900_0999 =
      rs_R003_ueqv_R003YY_partial_16_0978 := by
  native_decide

/-- Coefficient term 979 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_0979 : Poly :=
[
  term ((-768 : Rat) / 35) [(3, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 979 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_0979 : Poly :=
[
  term ((-1536 : Rat) / 35) [(3, 1), (6, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((768 : Rat) / 35) [(3, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 979 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_0979_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_0979
        rs_R003_ueqv_R003YY_generator_16_0900_0999 =
      rs_R003_ueqv_R003YY_partial_16_0979 := by
  native_decide

/-- Coefficient term 980 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_0980 : Poly :=
[
  term ((624 : Rat) / 35) [(3, 1), (11, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 980 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_0980 : Poly :=
[
  term ((1248 : Rat) / 35) [(3, 1), (6, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-624 : Rat) / 35) [(3, 1), (11, 1), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 980 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_0980_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_0980
        rs_R003_ueqv_R003YY_generator_16_0900_0999 =
      rs_R003_ueqv_R003YY_partial_16_0980 := by
  native_decide

/-- Coefficient term 981 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_0981 : Poly :=
[
  term ((3168 : Rat) / 35) [(3, 1), (11, 1), (12, 1), (14, 1)]
]

/-- Partial product 981 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_0981 : Poly :=
[
  term ((6336 : Rat) / 35) [(3, 1), (6, 1), (11, 1), (12, 1), (14, 1)],
  term ((-3168 : Rat) / 35) [(3, 1), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 981 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_0981_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_0981
        rs_R003_ueqv_R003YY_generator_16_0900_0999 =
      rs_R003_ueqv_R003YY_partial_16_0981 := by
  native_decide

/-- Coefficient term 982 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_0982 : Poly :=
[
  term ((-1056 : Rat) / 35) [(3, 1), (11, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 982 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_0982 : Poly :=
[
  term ((-2112 : Rat) / 35) [(3, 1), (6, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((1056 : Rat) / 35) [(3, 1), (11, 1), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 982 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_0982_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_0982
        rs_R003_ueqv_R003YY_generator_16_0900_0999 =
      rs_R003_ueqv_R003YY_partial_16_0982 := by
  native_decide

/-- Coefficient term 983 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_0983 : Poly :=
[
  term ((-2112 : Rat) / 35) [(3, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 983 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_0983 : Poly :=
[
  term ((-4224 : Rat) / 35) [(3, 1), (6, 1), (11, 1), (12, 1), (16, 1)],
  term ((2112 : Rat) / 35) [(3, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 983 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_0983_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_0983
        rs_R003_ueqv_R003YY_generator_16_0900_0999 =
      rs_R003_ueqv_R003YY_partial_16_0983 := by
  native_decide

/-- Coefficient term 984 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_0984 : Poly :=
[
  term ((-1152 : Rat) / 7) [(3, 1), (11, 1), (12, 2)]
]

/-- Partial product 984 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_0984 : Poly :=
[
  term ((-2304 : Rat) / 7) [(3, 1), (6, 1), (11, 1), (12, 2)],
  term ((1152 : Rat) / 7) [(3, 1), (11, 1), (12, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 984 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_0984_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_0984
        rs_R003_ueqv_R003YY_generator_16_0900_0999 =
      rs_R003_ueqv_R003YY_partial_16_0984 := by
  native_decide

/-- Coefficient term 985 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_0985 : Poly :=
[
  term ((-576 : Rat) / 7) [(3, 1), (11, 1), (12, 2), (14, 1)]
]

/-- Partial product 985 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_0985 : Poly :=
[
  term ((-1152 : Rat) / 7) [(3, 1), (6, 1), (11, 1), (12, 2), (14, 1)],
  term ((576 : Rat) / 7) [(3, 1), (11, 1), (12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 985 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_0985_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_0985
        rs_R003_ueqv_R003YY_generator_16_0900_0999 =
      rs_R003_ueqv_R003YY_partial_16_0985 := by
  native_decide

/-- Coefficient term 986 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_0986 : Poly :=
[
  term ((192 : Rat) / 7) [(3, 1), (11, 1), (12, 2), (14, 1), (16, 1)]
]

/-- Partial product 986 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_0986 : Poly :=
[
  term ((384 : Rat) / 7) [(3, 1), (6, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((-192 : Rat) / 7) [(3, 1), (11, 1), (12, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 986 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_0986_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_0986
        rs_R003_ueqv_R003YY_generator_16_0900_0999 =
      rs_R003_ueqv_R003YY_partial_16_0986 := by
  native_decide

/-- Coefficient term 987 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_0987 : Poly :=
[
  term ((384 : Rat) / 7) [(3, 1), (11, 1), (12, 2), (16, 1)]
]

/-- Partial product 987 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_0987 : Poly :=
[
  term ((768 : Rat) / 7) [(3, 1), (6, 1), (11, 1), (12, 2), (16, 1)],
  term ((-384 : Rat) / 7) [(3, 1), (11, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 987 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_0987_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_0987
        rs_R003_ueqv_R003YY_generator_16_0900_0999 =
      rs_R003_ueqv_R003YY_partial_16_0987 := by
  native_decide

/-- Coefficient term 988 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_0988 : Poly :=
[
  term ((162 : Rat) / 5) [(3, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 988 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_0988 : Poly :=
[
  term ((324 : Rat) / 5) [(3, 1), (6, 1), (11, 1), (13, 1), (15, 1)],
  term ((-162 : Rat) / 5) [(3, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 988 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_0988_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_0988
        rs_R003_ueqv_R003YY_generator_16_0900_0999 =
      rs_R003_ueqv_R003YY_partial_16_0988 := by
  native_decide

/-- Coefficient term 989 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_0989 : Poly :=
[
  term ((-18 : Rat) / 5) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 989 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_0989 : Poly :=
[
  term ((-36 : Rat) / 5) [(3, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((18 : Rat) / 5) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 989 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_0989_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_0989
        rs_R003_ueqv_R003YY_generator_16_0900_0999 =
      rs_R003_ueqv_R003YY_partial_16_0989 := by
  native_decide

/-- Coefficient term 990 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_0990 : Poly :=
[
  term ((-1152 : Rat) / 35) [(3, 1), (11, 1), (13, 2)]
]

/-- Partial product 990 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_0990 : Poly :=
[
  term ((-2304 : Rat) / 35) [(3, 1), (6, 1), (11, 1), (13, 2)],
  term ((1152 : Rat) / 35) [(3, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 990 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_0990_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_0990
        rs_R003_ueqv_R003YY_generator_16_0900_0999 =
      rs_R003_ueqv_R003YY_partial_16_0990 := by
  native_decide

/-- Coefficient term 991 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_0991 : Poly :=
[
  term ((-576 : Rat) / 35) [(3, 1), (11, 1), (13, 2), (14, 1)]
]

/-- Partial product 991 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_0991 : Poly :=
[
  term ((-1152 : Rat) / 35) [(3, 1), (6, 1), (11, 1), (13, 2), (14, 1)],
  term ((576 : Rat) / 35) [(3, 1), (11, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 991 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_0991_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_0991
        rs_R003_ueqv_R003YY_generator_16_0900_0999 =
      rs_R003_ueqv_R003YY_partial_16_0991 := by
  native_decide

/-- Coefficient term 992 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_0992 : Poly :=
[
  term ((192 : Rat) / 35) [(3, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 992 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_0992 : Poly :=
[
  term ((384 : Rat) / 35) [(3, 1), (6, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-192 : Rat) / 35) [(3, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 992 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_0992_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_0992
        rs_R003_ueqv_R003YY_generator_16_0900_0999 =
      rs_R003_ueqv_R003YY_partial_16_0992 := by
  native_decide

/-- Coefficient term 993 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_0993 : Poly :=
[
  term ((384 : Rat) / 35) [(3, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 993 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_0993 : Poly :=
[
  term ((768 : Rat) / 35) [(3, 1), (6, 1), (11, 1), (13, 2), (16, 1)],
  term ((-384 : Rat) / 35) [(3, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 993 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_0993_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_0993
        rs_R003_ueqv_R003YY_generator_16_0900_0999 =
      rs_R003_ueqv_R003YY_partial_16_0993 := by
  native_decide

/-- Coefficient term 994 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_0994 : Poly :=
[
  term ((-162 : Rat) / 35) [(3, 1), (11, 1), (14, 1)]
]

/-- Partial product 994 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_0994 : Poly :=
[
  term ((-324 : Rat) / 35) [(3, 1), (6, 1), (11, 1), (14, 1)],
  term ((162 : Rat) / 35) [(3, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 994 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_0994_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_0994
        rs_R003_ueqv_R003YY_generator_16_0900_0999 =
      rs_R003_ueqv_R003YY_partial_16_0994 := by
  native_decide

/-- Coefficient term 995 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_0995 : Poly :=
[
  term ((54 : Rat) / 35) [(3, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 995 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_0995 : Poly :=
[
  term ((108 : Rat) / 35) [(3, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((-54 : Rat) / 35) [(3, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 995 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_0995_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_0995
        rs_R003_ueqv_R003YY_generator_16_0900_0999 =
      rs_R003_ueqv_R003YY_partial_16_0995 := by
  native_decide

/-- Coefficient term 996 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_0996 : Poly :=
[
  term ((108 : Rat) / 35) [(3, 1), (11, 1), (16, 1)]
]

/-- Partial product 996 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_0996 : Poly :=
[
  term ((216 : Rat) / 35) [(3, 1), (6, 1), (11, 1), (16, 1)],
  term ((-108 : Rat) / 35) [(3, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 996 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_0996_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_0996
        rs_R003_ueqv_R003YY_generator_16_0900_0999 =
      rs_R003_ueqv_R003YY_partial_16_0996 := by
  native_decide

/-- Coefficient term 997 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_0997 : Poly :=
[
  term ((-3744 : Rat) / 35) [(3, 1), (11, 2), (13, 1)]
]

/-- Partial product 997 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_0997 : Poly :=
[
  term ((-7488 : Rat) / 35) [(3, 1), (6, 1), (11, 2), (13, 1)],
  term ((3744 : Rat) / 35) [(3, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 997 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_0997_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_0997
        rs_R003_ueqv_R003YY_generator_16_0900_0999 =
      rs_R003_ueqv_R003YY_partial_16_0997 := by
  native_decide

/-- Coefficient term 998 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_0998 : Poly :=
[
  term ((-1872 : Rat) / 35) [(3, 1), (11, 2), (13, 1), (14, 1)]
]

/-- Partial product 998 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_0998 : Poly :=
[
  term ((-3744 : Rat) / 35) [(3, 1), (6, 1), (11, 2), (13, 1), (14, 1)],
  term ((1872 : Rat) / 35) [(3, 1), (11, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 998 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_0998_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_0998
        rs_R003_ueqv_R003YY_generator_16_0900_0999 =
      rs_R003_ueqv_R003YY_partial_16_0998 := by
  native_decide

/-- Coefficient term 999 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_0999 : Poly :=
[
  term ((624 : Rat) / 35) [(3, 1), (11, 2), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 999 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_0999 : Poly :=
[
  term ((1248 : Rat) / 35) [(3, 1), (6, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-624 : Rat) / 35) [(3, 1), (11, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 999 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_0999_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_0999
        rs_R003_ueqv_R003YY_generator_16_0900_0999 =
      rs_R003_ueqv_R003YY_partial_16_0999 := by
  native_decide

/-- Partial products in this block. -/
def rs_R003_ueqv_R003YY_partials_16_0900_0999 : List Poly :=
[
  rs_R003_ueqv_R003YY_partial_16_0900,
  rs_R003_ueqv_R003YY_partial_16_0901,
  rs_R003_ueqv_R003YY_partial_16_0902,
  rs_R003_ueqv_R003YY_partial_16_0903,
  rs_R003_ueqv_R003YY_partial_16_0904,
  rs_R003_ueqv_R003YY_partial_16_0905,
  rs_R003_ueqv_R003YY_partial_16_0906,
  rs_R003_ueqv_R003YY_partial_16_0907,
  rs_R003_ueqv_R003YY_partial_16_0908,
  rs_R003_ueqv_R003YY_partial_16_0909,
  rs_R003_ueqv_R003YY_partial_16_0910,
  rs_R003_ueqv_R003YY_partial_16_0911,
  rs_R003_ueqv_R003YY_partial_16_0912,
  rs_R003_ueqv_R003YY_partial_16_0913,
  rs_R003_ueqv_R003YY_partial_16_0914,
  rs_R003_ueqv_R003YY_partial_16_0915,
  rs_R003_ueqv_R003YY_partial_16_0916,
  rs_R003_ueqv_R003YY_partial_16_0917,
  rs_R003_ueqv_R003YY_partial_16_0918,
  rs_R003_ueqv_R003YY_partial_16_0919,
  rs_R003_ueqv_R003YY_partial_16_0920,
  rs_R003_ueqv_R003YY_partial_16_0921,
  rs_R003_ueqv_R003YY_partial_16_0922,
  rs_R003_ueqv_R003YY_partial_16_0923,
  rs_R003_ueqv_R003YY_partial_16_0924,
  rs_R003_ueqv_R003YY_partial_16_0925,
  rs_R003_ueqv_R003YY_partial_16_0926,
  rs_R003_ueqv_R003YY_partial_16_0927,
  rs_R003_ueqv_R003YY_partial_16_0928,
  rs_R003_ueqv_R003YY_partial_16_0929,
  rs_R003_ueqv_R003YY_partial_16_0930,
  rs_R003_ueqv_R003YY_partial_16_0931,
  rs_R003_ueqv_R003YY_partial_16_0932,
  rs_R003_ueqv_R003YY_partial_16_0933,
  rs_R003_ueqv_R003YY_partial_16_0934,
  rs_R003_ueqv_R003YY_partial_16_0935,
  rs_R003_ueqv_R003YY_partial_16_0936,
  rs_R003_ueqv_R003YY_partial_16_0937,
  rs_R003_ueqv_R003YY_partial_16_0938,
  rs_R003_ueqv_R003YY_partial_16_0939,
  rs_R003_ueqv_R003YY_partial_16_0940,
  rs_R003_ueqv_R003YY_partial_16_0941,
  rs_R003_ueqv_R003YY_partial_16_0942,
  rs_R003_ueqv_R003YY_partial_16_0943,
  rs_R003_ueqv_R003YY_partial_16_0944,
  rs_R003_ueqv_R003YY_partial_16_0945,
  rs_R003_ueqv_R003YY_partial_16_0946,
  rs_R003_ueqv_R003YY_partial_16_0947,
  rs_R003_ueqv_R003YY_partial_16_0948,
  rs_R003_ueqv_R003YY_partial_16_0949,
  rs_R003_ueqv_R003YY_partial_16_0950,
  rs_R003_ueqv_R003YY_partial_16_0951,
  rs_R003_ueqv_R003YY_partial_16_0952,
  rs_R003_ueqv_R003YY_partial_16_0953,
  rs_R003_ueqv_R003YY_partial_16_0954,
  rs_R003_ueqv_R003YY_partial_16_0955,
  rs_R003_ueqv_R003YY_partial_16_0956,
  rs_R003_ueqv_R003YY_partial_16_0957,
  rs_R003_ueqv_R003YY_partial_16_0958,
  rs_R003_ueqv_R003YY_partial_16_0959,
  rs_R003_ueqv_R003YY_partial_16_0960,
  rs_R003_ueqv_R003YY_partial_16_0961,
  rs_R003_ueqv_R003YY_partial_16_0962,
  rs_R003_ueqv_R003YY_partial_16_0963,
  rs_R003_ueqv_R003YY_partial_16_0964,
  rs_R003_ueqv_R003YY_partial_16_0965,
  rs_R003_ueqv_R003YY_partial_16_0966,
  rs_R003_ueqv_R003YY_partial_16_0967,
  rs_R003_ueqv_R003YY_partial_16_0968,
  rs_R003_ueqv_R003YY_partial_16_0969,
  rs_R003_ueqv_R003YY_partial_16_0970,
  rs_R003_ueqv_R003YY_partial_16_0971,
  rs_R003_ueqv_R003YY_partial_16_0972,
  rs_R003_ueqv_R003YY_partial_16_0973,
  rs_R003_ueqv_R003YY_partial_16_0974,
  rs_R003_ueqv_R003YY_partial_16_0975,
  rs_R003_ueqv_R003YY_partial_16_0976,
  rs_R003_ueqv_R003YY_partial_16_0977,
  rs_R003_ueqv_R003YY_partial_16_0978,
  rs_R003_ueqv_R003YY_partial_16_0979,
  rs_R003_ueqv_R003YY_partial_16_0980,
  rs_R003_ueqv_R003YY_partial_16_0981,
  rs_R003_ueqv_R003YY_partial_16_0982,
  rs_R003_ueqv_R003YY_partial_16_0983,
  rs_R003_ueqv_R003YY_partial_16_0984,
  rs_R003_ueqv_R003YY_partial_16_0985,
  rs_R003_ueqv_R003YY_partial_16_0986,
  rs_R003_ueqv_R003YY_partial_16_0987,
  rs_R003_ueqv_R003YY_partial_16_0988,
  rs_R003_ueqv_R003YY_partial_16_0989,
  rs_R003_ueqv_R003YY_partial_16_0990,
  rs_R003_ueqv_R003YY_partial_16_0991,
  rs_R003_ueqv_R003YY_partial_16_0992,
  rs_R003_ueqv_R003YY_partial_16_0993,
  rs_R003_ueqv_R003YY_partial_16_0994,
  rs_R003_ueqv_R003YY_partial_16_0995,
  rs_R003_ueqv_R003YY_partial_16_0996,
  rs_R003_ueqv_R003YY_partial_16_0997,
  rs_R003_ueqv_R003YY_partial_16_0998,
  rs_R003_ueqv_R003YY_partial_16_0999
]

/-- Sum of partial products in this block. -/
def rs_R003_ueqv_R003YY_block_16_0900_0999 : Poly :=
[
  term ((-2488 : Rat) / 5) [(3, 1), (6, 1), (7, 1), (12, 1)],
  term ((2352 : Rat) / 5) [(3, 1), (6, 1), (7, 1), (12, 1), (14, 1)],
  term ((-3268 : Rat) / 35) [(3, 1), (6, 1), (7, 1), (14, 1)],
  term ((-54 : Rat) / 35) [(3, 1), (6, 1), (7, 1), (14, 1), (16, 1)],
  term ((-94 : Rat) / 35) [(3, 1), (6, 1), (7, 1), (16, 1)],
  term ((-312 : Rat) / 7) [(3, 1), (6, 1), (9, 1)],
  term ((-1584 : Rat) / 35) [(3, 1), (6, 1), (9, 1), (10, 1)],
  term ((3168 : Rat) / 35) [(3, 1), (6, 1), (9, 1), (10, 1), (12, 1)],
  term ((1584 : Rat) / 35) [(3, 1), (6, 1), (9, 1), (10, 1), (12, 1), (14, 1)],
  term ((-528 : Rat) / 35) [(3, 1), (6, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1056 : Rat) / 35) [(3, 1), (6, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((-792 : Rat) / 35) [(3, 1), (6, 1), (9, 1), (10, 1), (14, 1)],
  term ((264 : Rat) / 35) [(3, 1), (6, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((528 : Rat) / 35) [(3, 1), (6, 1), (9, 1), (10, 1), (16, 1)],
  term ((13014912 : Rat) / 10675) [(3, 1), (6, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((-4608 : Rat) / 35) [(3, 1), (6, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((1536 : Rat) / 35) [(3, 1), (6, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-14208 : Rat) / 35) [(3, 1), (6, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((12044 : Rat) / 35) [(3, 1), (6, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((-1452 : Rat) / 35) [(3, 1), (6, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2291136 : Rat) / 10675) [(3, 1), (6, 1), (9, 1), (11, 1), (12, 2), (13, 1)],
  term ((9216 : Rat) / 35) [(3, 1), (6, 1), (9, 1), (11, 1), (12, 2), (13, 1), (14, 1)],
  term ((-3072 : Rat) / 35) [(3, 1), (6, 1), (9, 1), (11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((2496 : Rat) / 35) [(3, 1), (6, 1), (9, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-4888 : Rat) / 35) [(3, 1), (6, 1), (9, 1), (11, 1), (12, 2), (15, 1)],
  term ((120 : Rat) / 7) [(3, 1), (6, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((288096 : Rat) / 1525) [(3, 1), (6, 1), (9, 1), (11, 1), (13, 1)],
  term ((9792 : Rat) / 35) [(3, 1), (6, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((-3264 : Rat) / 35) [(3, 1), (6, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2208 : Rat) / 35) [(3, 1), (6, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-4712 : Rat) / 35) [(3, 1), (6, 1), (9, 1), (11, 1), (15, 1)],
  term ((552 : Rat) / 35) [(3, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2304 : Rat) / 35) [(3, 1), (6, 1), (9, 1), (11, 2)],
  term ((14976 : Rat) / 35) [(3, 1), (6, 1), (9, 1), (11, 2), (12, 1)],
  term ((7488 : Rat) / 35) [(3, 1), (6, 1), (9, 1), (11, 2), (12, 1), (14, 1)],
  term ((-2496 : Rat) / 35) [(3, 1), (6, 1), (9, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-4992 : Rat) / 35) [(3, 1), (6, 1), (9, 1), (11, 2), (12, 1), (16, 1)],
  term ((-1152 : Rat) / 35) [(3, 1), (6, 1), (9, 1), (11, 2), (14, 1)],
  term ((384 : Rat) / 35) [(3, 1), (6, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((768 : Rat) / 35) [(3, 1), (6, 1), (9, 1), (11, 2), (16, 1)],
  term ((7464 : Rat) / 35) [(3, 1), (6, 1), (9, 1), (12, 1)],
  term ((2052 : Rat) / 5) [(3, 1), (6, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-324 : Rat) / 5) [(3, 1), (6, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4696 : Rat) / 35) [(3, 1), (6, 1), (9, 1), (12, 1), (14, 1)],
  term ((-264 : Rat) / 35) [(3, 1), (6, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-976 : Rat) / 35) [(3, 1), (6, 1), (9, 1), (12, 1), (16, 1)],
  term ((-2112 : Rat) / 35) [(3, 1), (6, 1), (9, 1), (12, 2)],
  term ((640 : Rat) / 7) [(3, 1), (6, 1), (9, 1), (12, 2), (14, 1)],
  term ((-96 : Rat) / 35) [(3, 1), (6, 1), (9, 1), (12, 2), (14, 1), (16, 1)],
  term ((-136 : Rat) / 35) [(3, 1), (6, 1), (9, 1), (12, 2), (16, 1)],
  term ((1269 : Rat) / 5) [(3, 1), (6, 1), (9, 1), (13, 1), (15, 1)],
  term (-33 : Rat) [(3, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((1348 : Rat) / 35) [(3, 1), (6, 1), (9, 1), (14, 1)],
  term ((24 : Rat) / 7) [(3, 1), (6, 1), (9, 1), (14, 1), (16, 1)],
  term ((268 : Rat) / 35) [(3, 1), (6, 1), (9, 1), (16, 1)],
  term ((-27648 : Rat) / 35) [(3, 1), (6, 1), (9, 2), (11, 1), (12, 1)],
  term ((-13824 : Rat) / 35) [(3, 1), (6, 1), (9, 2), (11, 1), (12, 1), (14, 1)],
  term ((4608 : Rat) / 35) [(3, 1), (6, 1), (9, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((9216 : Rat) / 35) [(3, 1), (6, 1), (9, 2), (11, 1), (12, 1), (16, 1)],
  term (-378 : Rat) [(3, 1), (6, 1), (9, 2), (12, 1), (15, 1)],
  term ((258 : Rat) / 5) [(3, 1), (6, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-1152 : Rat) / 35) [(3, 1), (6, 1), (10, 1), (11, 1)],
  term ((-576 : Rat) / 35) [(3, 1), (6, 1), (10, 1), (11, 1), (14, 1)],
  term ((192 : Rat) / 35) [(3, 1), (6, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((384 : Rat) / 35) [(3, 1), (6, 1), (10, 1), (11, 1), (16, 1)],
  term ((-162 : Rat) / 5) [(3, 1), (6, 1), (10, 1), (12, 1), (15, 1)],
  term ((18 : Rat) / 5) [(3, 1), (6, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1584 : Rat) / 35) [(3, 1), (6, 1), (10, 1), (13, 1)],
  term ((-792 : Rat) / 35) [(3, 1), (6, 1), (10, 1), (13, 1), (14, 1)],
  term ((264 : Rat) / 35) [(3, 1), (6, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((528 : Rat) / 35) [(3, 1), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((-81 : Rat) / 10) [(3, 1), (6, 1), (10, 1), (15, 1)],
  term ((9 : Rat) / 10) [(3, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((-648 : Rat) / 35) [(3, 1), (6, 1), (11, 1)],
  term ((12672 : Rat) / 35) [(3, 1), (6, 1), (11, 1), (12, 1)],
  term ((-2444 : Rat) / 35) [(3, 1), (6, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((60 : Rat) / 7) [(3, 1), (6, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1145568 : Rat) / 10675) [(3, 1), (6, 1), (11, 1), (12, 1), (13, 2)],
  term ((4608 : Rat) / 35) [(3, 1), (6, 1), (11, 1), (12, 1), (13, 2), (14, 1)],
  term ((-1536 : Rat) / 35) [(3, 1), (6, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((1248 : Rat) / 35) [(3, 1), (6, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((6336 : Rat) / 35) [(3, 1), (6, 1), (11, 1), (12, 1), (14, 1)],
  term ((-2112 : Rat) / 35) [(3, 1), (6, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-4224 : Rat) / 35) [(3, 1), (6, 1), (11, 1), (12, 1), (16, 1)],
  term ((-2304 : Rat) / 7) [(3, 1), (6, 1), (11, 1), (12, 2)],
  term ((-1152 : Rat) / 7) [(3, 1), (6, 1), (11, 1), (12, 2), (14, 1)],
  term ((384 : Rat) / 7) [(3, 1), (6, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((768 : Rat) / 7) [(3, 1), (6, 1), (11, 1), (12, 2), (16, 1)],
  term ((324 : Rat) / 5) [(3, 1), (6, 1), (11, 1), (13, 1), (15, 1)],
  term ((-36 : Rat) / 5) [(3, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2304 : Rat) / 35) [(3, 1), (6, 1), (11, 1), (13, 2)],
  term ((-1152 : Rat) / 35) [(3, 1), (6, 1), (11, 1), (13, 2), (14, 1)],
  term ((384 : Rat) / 35) [(3, 1), (6, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((768 : Rat) / 35) [(3, 1), (6, 1), (11, 1), (13, 2), (16, 1)],
  term ((-324 : Rat) / 35) [(3, 1), (6, 1), (11, 1), (14, 1)],
  term ((108 : Rat) / 35) [(3, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((216 : Rat) / 35) [(3, 1), (6, 1), (11, 1), (16, 1)],
  term ((-7488 : Rat) / 35) [(3, 1), (6, 1), (11, 2), (13, 1)],
  term ((-3744 : Rat) / 35) [(3, 1), (6, 1), (11, 2), (13, 1), (14, 1)],
  term ((1248 : Rat) / 35) [(3, 1), (6, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((1244 : Rat) / 5) [(3, 1), (7, 1), (12, 1)],
  term ((-1176 : Rat) / 5) [(3, 1), (7, 1), (12, 1), (14, 1)],
  term ((1634 : Rat) / 35) [(3, 1), (7, 1), (14, 1)],
  term ((27 : Rat) / 35) [(3, 1), (7, 1), (14, 1), (16, 1)],
  term ((47 : Rat) / 35) [(3, 1), (7, 1), (16, 1)],
  term ((156 : Rat) / 7) [(3, 1), (9, 1)],
  term ((792 : Rat) / 35) [(3, 1), (9, 1), (10, 1)],
  term ((-1584 : Rat) / 35) [(3, 1), (9, 1), (10, 1), (12, 1)],
  term ((-792 : Rat) / 35) [(3, 1), (9, 1), (10, 1), (12, 1), (14, 1)],
  term ((264 : Rat) / 35) [(3, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((528 : Rat) / 35) [(3, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((396 : Rat) / 35) [(3, 1), (9, 1), (10, 1), (14, 1)],
  term ((-132 : Rat) / 35) [(3, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-264 : Rat) / 35) [(3, 1), (9, 1), (10, 1), (16, 1)],
  term ((-6507456 : Rat) / 10675) [(3, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((2304 : Rat) / 35) [(3, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-768 : Rat) / 35) [(3, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((7104 : Rat) / 35) [(3, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-6022 : Rat) / 35) [(3, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((726 : Rat) / 35) [(3, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1145568 : Rat) / 10675) [(3, 1), (9, 1), (11, 1), (12, 2), (13, 1)],
  term ((-4608 : Rat) / 35) [(3, 1), (9, 1), (11, 1), (12, 2), (13, 1), (14, 1)],
  term ((1536 : Rat) / 35) [(3, 1), (9, 1), (11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-1248 : Rat) / 35) [(3, 1), (9, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((2444 : Rat) / 35) [(3, 1), (9, 1), (11, 1), (12, 2), (15, 1)],
  term ((-60 : Rat) / 7) [(3, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-144048 : Rat) / 1525) [(3, 1), (9, 1), (11, 1), (13, 1)],
  term ((-4896 : Rat) / 35) [(3, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((1632 : Rat) / 35) [(3, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((1104 : Rat) / 35) [(3, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((2356 : Rat) / 35) [(3, 1), (9, 1), (11, 1), (15, 1)],
  term ((-276 : Rat) / 35) [(3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((1152 : Rat) / 35) [(3, 1), (9, 1), (11, 2)],
  term ((-7488 : Rat) / 35) [(3, 1), (9, 1), (11, 2), (12, 1)],
  term ((-3744 : Rat) / 35) [(3, 1), (9, 1), (11, 2), (12, 1), (14, 1)],
  term ((1248 : Rat) / 35) [(3, 1), (9, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((2496 : Rat) / 35) [(3, 1), (9, 1), (11, 2), (12, 1), (16, 1)],
  term ((576 : Rat) / 35) [(3, 1), (9, 1), (11, 2), (14, 1)],
  term ((-192 : Rat) / 35) [(3, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((-384 : Rat) / 35) [(3, 1), (9, 1), (11, 2), (16, 1)],
  term ((-3732 : Rat) / 35) [(3, 1), (9, 1), (12, 1)],
  term ((-1026 : Rat) / 5) [(3, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((162 : Rat) / 5) [(3, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((2348 : Rat) / 35) [(3, 1), (9, 1), (12, 1), (14, 1)],
  term ((132 : Rat) / 35) [(3, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((488 : Rat) / 35) [(3, 1), (9, 1), (12, 1), (16, 1)],
  term ((1056 : Rat) / 35) [(3, 1), (9, 1), (12, 2)],
  term ((-320 : Rat) / 7) [(3, 1), (9, 1), (12, 2), (14, 1)],
  term ((48 : Rat) / 35) [(3, 1), (9, 1), (12, 2), (14, 1), (16, 1)],
  term ((68 : Rat) / 35) [(3, 1), (9, 1), (12, 2), (16, 1)],
  term ((-1269 : Rat) / 10) [(3, 1), (9, 1), (13, 1), (15, 1)],
  term ((33 : Rat) / 2) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-674 : Rat) / 35) [(3, 1), (9, 1), (14, 1)],
  term ((-12 : Rat) / 7) [(3, 1), (9, 1), (14, 1), (16, 1)],
  term ((-134 : Rat) / 35) [(3, 1), (9, 1), (16, 1)],
  term ((13824 : Rat) / 35) [(3, 1), (9, 2), (11, 1), (12, 1)],
  term ((6912 : Rat) / 35) [(3, 1), (9, 2), (11, 1), (12, 1), (14, 1)],
  term ((-2304 : Rat) / 35) [(3, 1), (9, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-4608 : Rat) / 35) [(3, 1), (9, 2), (11, 1), (12, 1), (16, 1)],
  term (189 : Rat) [(3, 1), (9, 2), (12, 1), (15, 1)],
  term ((-129 : Rat) / 5) [(3, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((576 : Rat) / 35) [(3, 1), (10, 1), (11, 1)],
  term ((288 : Rat) / 35) [(3, 1), (10, 1), (11, 1), (14, 1)],
  term ((-96 : Rat) / 35) [(3, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-192 : Rat) / 35) [(3, 1), (10, 1), (11, 1), (16, 1)],
  term ((81 : Rat) / 5) [(3, 1), (10, 1), (12, 1), (15, 1)],
  term ((-9 : Rat) / 5) [(3, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((792 : Rat) / 35) [(3, 1), (10, 1), (13, 1)],
  term ((396 : Rat) / 35) [(3, 1), (10, 1), (13, 1), (14, 1)],
  term ((-132 : Rat) / 35) [(3, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-264 : Rat) / 35) [(3, 1), (10, 1), (13, 1), (16, 1)],
  term ((81 : Rat) / 20) [(3, 1), (10, 1), (15, 1)],
  term ((-9 : Rat) / 20) [(3, 1), (10, 1), (15, 1), (16, 1)],
  term ((324 : Rat) / 35) [(3, 1), (11, 1)],
  term ((-6336 : Rat) / 35) [(3, 1), (11, 1), (12, 1)],
  term ((1222 : Rat) / 35) [(3, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-30 : Rat) / 7) [(3, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((572784 : Rat) / 10675) [(3, 1), (11, 1), (12, 1), (13, 2)],
  term ((-2304 : Rat) / 35) [(3, 1), (11, 1), (12, 1), (13, 2), (14, 1)],
  term ((768 : Rat) / 35) [(3, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-624 : Rat) / 35) [(3, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-3168 : Rat) / 35) [(3, 1), (11, 1), (12, 1), (14, 1)],
  term ((1056 : Rat) / 35) [(3, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((2112 : Rat) / 35) [(3, 1), (11, 1), (12, 1), (16, 1)],
  term ((1152 : Rat) / 7) [(3, 1), (11, 1), (12, 2)],
  term ((576 : Rat) / 7) [(3, 1), (11, 1), (12, 2), (14, 1)],
  term ((-192 : Rat) / 7) [(3, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((-384 : Rat) / 7) [(3, 1), (11, 1), (12, 2), (16, 1)],
  term ((-162 : Rat) / 5) [(3, 1), (11, 1), (13, 1), (15, 1)],
  term ((18 : Rat) / 5) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1152 : Rat) / 35) [(3, 1), (11, 1), (13, 2)],
  term ((576 : Rat) / 35) [(3, 1), (11, 1), (13, 2), (14, 1)],
  term ((-192 : Rat) / 35) [(3, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-384 : Rat) / 35) [(3, 1), (11, 1), (13, 2), (16, 1)],
  term ((162 : Rat) / 35) [(3, 1), (11, 1), (14, 1)],
  term ((-54 : Rat) / 35) [(3, 1), (11, 1), (14, 1), (16, 1)],
  term ((-108 : Rat) / 35) [(3, 1), (11, 1), (16, 1)],
  term ((3744 : Rat) / 35) [(3, 1), (11, 2), (13, 1)],
  term ((1872 : Rat) / 35) [(3, 1), (11, 2), (13, 1), (14, 1)],
  term ((-624 : Rat) / 35) [(3, 1), (11, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 16, terms 900 through 999. -/
theorem rs_R003_ueqv_R003YY_block_16_0900_0999_valid :
    checkProductSumEq rs_R003_ueqv_R003YY_partials_16_0900_0999
      rs_R003_ueqv_R003YY_block_16_0900_0999 = true := by
  native_decide

end R003UeqvR003YYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
