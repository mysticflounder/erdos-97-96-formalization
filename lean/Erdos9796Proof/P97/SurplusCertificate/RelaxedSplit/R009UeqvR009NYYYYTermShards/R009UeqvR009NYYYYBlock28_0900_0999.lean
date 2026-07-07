/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NYYYY, term block 28:900-999

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NYYYYTermShards

/-- Generator polynomial 28 for relaxed split surplus certificate `R009:u=v:R009NYYYY`. -/
def rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(14, 1)]
]

/-- Coefficient term 900 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0900 : Poly :=
[
  term ((542375944 : Rat) / 99568455) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 3)]
]

/-- Partial product 900 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0900 : Poly :=
[
  term ((-542375944 : Rat) / 99568455) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 3)],
  term ((1084751888 : Rat) / 99568455) [(9, 1), (11, 1), (13, 1), (14, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 900 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0900_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0900
        rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYYYY_partial_28_0900 := by
  native_decide

/-- Coefficient term 901 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0901 : Poly :=
[
  term ((-8832 : Rat) / 32699) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 3), (16, 1)]
]

/-- Partial product 901 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0901 : Poly :=
[
  term ((8832 : Rat) / 32699) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-17664 : Rat) / 32699) [(9, 1), (11, 1), (13, 1), (14, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 901 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0901_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0901
        rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYYYY_partial_28_0901 := by
  native_decide

/-- Coefficient term 902 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0902 : Poly :=
[
  term ((-409936886 : Rat) / 99568455) [(9, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 902 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0902 : Poly :=
[
  term ((-819873772 : Rat) / 99568455) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((409936886 : Rat) / 99568455) [(9, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 902 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0902_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0902
        rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYYYY_partial_28_0902 := by
  native_decide

/-- Coefficient term 903 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0903 : Poly :=
[
  term ((76544 : Rat) / 98097) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 903 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0903 : Poly :=
[
  term ((153088 : Rat) / 98097) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-76544 : Rat) / 98097) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 903 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0903_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0903
        rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYYYY_partial_28_0903 := by
  native_decide

/-- Coefficient term 904 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0904 : Poly :=
[
  term ((37655084 : Rat) / 19913691) [(9, 1), (11, 1), (13, 1), (15, 3)]
]

/-- Partial product 904 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0904 : Poly :=
[
  term ((75310168 : Rat) / 19913691) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 3)],
  term ((-37655084 : Rat) / 19913691) [(9, 1), (11, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 904 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0904_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0904
        rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYYYY_partial_28_0904 := by
  native_decide

/-- Coefficient term 905 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0905 : Poly :=
[
  term ((-80960 : Rat) / 98097) [(9, 1), (11, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 905 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0905 : Poly :=
[
  term ((-161920 : Rat) / 98097) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((80960 : Rat) / 98097) [(9, 1), (11, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 905 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0905_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0905
        rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYYYY_partial_28_0905 := by
  native_decide

/-- Coefficient term 906 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0906 : Poly :=
[
  term ((573599752 : Rat) / 99568455) [(9, 1), (11, 1), (13, 2), (14, 1), (15, 2)]
]

/-- Partial product 906 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0906 : Poly :=
[
  term ((-573599752 : Rat) / 99568455) [(9, 1), (11, 1), (13, 2), (14, 1), (15, 2)],
  term ((1147199504 : Rat) / 99568455) [(9, 1), (11, 1), (13, 2), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 906 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0906_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0906
        rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYYYY_partial_28_0906 := by
  native_decide

/-- Coefficient term 907 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0907 : Poly :=
[
  term ((-108928 : Rat) / 98097) [(9, 1), (11, 1), (13, 2), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 907 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0907 : Poly :=
[
  term ((108928 : Rat) / 98097) [(9, 1), (11, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-217856 : Rat) / 98097) [(9, 1), (11, 1), (13, 2), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 907 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0907_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0907
        rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYYYY_partial_28_0907 := by
  native_decide

/-- Coefficient term 908 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0908 : Poly :=
[
  term ((-643361884 : Rat) / 99568455) [(9, 1), (11, 1), (13, 2), (15, 2)]
]

/-- Partial product 908 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0908 : Poly :=
[
  term ((-1286723768 : Rat) / 99568455) [(9, 1), (11, 1), (13, 2), (14, 1), (15, 2)],
  term ((643361884 : Rat) / 99568455) [(9, 1), (11, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 908 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0908_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0908
        rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYYYY_partial_28_0908 := by
  native_decide

/-- Coefficient term 909 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0909 : Poly :=
[
  term ((122176 : Rat) / 98097) [(9, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 909 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0909 : Poly :=
[
  term ((244352 : Rat) / 98097) [(9, 1), (11, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-122176 : Rat) / 98097) [(9, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 909 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0909_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0909
        rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYYYY_partial_28_0909 := by
  native_decide

/-- Coefficient term 910 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0910 : Poly :=
[
  term ((-50903576 : Rat) / 33189485) [(9, 1), (11, 1), (14, 1), (15, 2)]
]

/-- Partial product 910 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0910 : Poly :=
[
  term ((50903576 : Rat) / 33189485) [(9, 1), (11, 1), (14, 1), (15, 2)],
  term ((-101807152 : Rat) / 33189485) [(9, 1), (11, 1), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 910 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0910_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0910
        rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYYYY_partial_28_0910 := by
  native_decide

/-- Coefficient term 911 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0911 : Poly :=
[
  term ((6624 : Rat) / 32699) [(9, 1), (11, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 911 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0911 : Poly :=
[
  term ((-6624 : Rat) / 32699) [(9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((13248 : Rat) / 32699) [(9, 1), (11, 1), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 911 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0911_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0911
        rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYYYY_partial_28_0911 := by
  native_decide

/-- Coefficient term 912 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0912 : Poly :=
[
  term ((-412080026 : Rat) / 99568455) [(9, 1), (11, 1), (15, 2)]
]

/-- Partial product 912 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0912 : Poly :=
[
  term ((-824160052 : Rat) / 99568455) [(9, 1), (11, 1), (14, 1), (15, 2)],
  term ((412080026 : Rat) / 99568455) [(9, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 912 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0912_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0912
        rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYYYY_partial_28_0912 := by
  native_decide

/-- Coefficient term 913 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0913 : Poly :=
[
  term ((18768 : Rat) / 32699) [(9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 913 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0913 : Poly :=
[
  term ((37536 : Rat) / 32699) [(9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-18768 : Rat) / 32699) [(9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 913 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0913_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0913
        rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYYYY_partial_28_0913 := by
  native_decide

/-- Coefficient term 914 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0914 : Poly :=
[
  term ((349376336 : Rat) / 99568455) [(9, 1), (11, 1), (15, 4)]
]

/-- Partial product 914 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0914 : Poly :=
[
  term ((698752672 : Rat) / 99568455) [(9, 1), (11, 1), (14, 1), (15, 4)],
  term ((-349376336 : Rat) / 99568455) [(9, 1), (11, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 914 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0914_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0914
        rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYYYY_partial_28_0914 := by
  native_decide

/-- Coefficient term 915 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0915 : Poly :=
[
  term ((-5888 : Rat) / 32699) [(9, 1), (11, 1), (15, 4), (16, 1)]
]

/-- Partial product 915 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0915 : Poly :=
[
  term ((-11776 : Rat) / 32699) [(9, 1), (11, 1), (14, 1), (15, 4), (16, 1)],
  term ((5888 : Rat) / 32699) [(9, 1), (11, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 915 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0915_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0915
        rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYYYY_partial_28_0915 := by
  native_decide

/-- Coefficient term 916 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0916 : Poly :=
[
  term ((-62010784 : Rat) / 33189485) [(9, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 916 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0916 : Poly :=
[
  term ((-124021568 : Rat) / 33189485) [(9, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((62010784 : Rat) / 33189485) [(9, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 916 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0916_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0916
        rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYYYY_partial_28_0916 := by
  native_decide

/-- Coefficient term 917 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0917 : Poly :=
[
  term ((11776 : Rat) / 32699) [(9, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 917 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0917 : Poly :=
[
  term ((23552 : Rat) / 32699) [(9, 1), (11, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11776 : Rat) / 32699) [(9, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 917 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0917_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0917
        rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYYYY_partial_28_0917 := by
  native_decide

/-- Coefficient term 918 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0918 : Poly :=
[
  term ((31005392 : Rat) / 33189485) [(9, 1), (11, 2), (14, 1), (15, 1)]
]

/-- Partial product 918 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0918 : Poly :=
[
  term ((-31005392 : Rat) / 33189485) [(9, 1), (11, 2), (14, 1), (15, 1)],
  term ((62010784 : Rat) / 33189485) [(9, 1), (11, 2), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 918 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0918_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0918
        rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYYYY_partial_28_0918 := by
  native_decide

/-- Coefficient term 919 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0919 : Poly :=
[
  term ((-5888 : Rat) / 32699) [(9, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 919 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0919 : Poly :=
[
  term ((5888 : Rat) / 32699) [(9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-11776 : Rat) / 32699) [(9, 1), (11, 2), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 919 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0919_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0919
        rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYYYY_partial_28_0919 := by
  native_decide

/-- Coefficient term 920 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0920 : Poly :=
[
  term ((15502696 : Rat) / 33189485) [(9, 1), (11, 2), (15, 1)]
]

/-- Partial product 920 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0920 : Poly :=
[
  term ((31005392 : Rat) / 33189485) [(9, 1), (11, 2), (14, 1), (15, 1)],
  term ((-15502696 : Rat) / 33189485) [(9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 920 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0920_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0920
        rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYYYY_partial_28_0920 := by
  native_decide

/-- Coefficient term 921 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0921 : Poly :=
[
  term ((-2944 : Rat) / 32699) [(9, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 921 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0921 : Poly :=
[
  term ((-5888 : Rat) / 32699) [(9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((2944 : Rat) / 32699) [(9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 921 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0921_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0921
        rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYYYY_partial_28_0921 := by
  native_decide

/-- Coefficient term 922 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0922 : Poly :=
[
  term ((125 : Rat) / 24) [(9, 1), (12, 1), (13, 1)]
]

/-- Partial product 922 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0922 : Poly :=
[
  term ((-125 : Rat) / 24) [(9, 1), (12, 1), (13, 1)],
  term ((125 : Rat) / 12) [(9, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 922 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0922_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0922
        rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYYYY_partial_28_0922 := by
  native_decide

/-- Coefficient term 923 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0923 : Poly :=
[
  term ((28 : Rat) / 29) [(9, 1), (12, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 923 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0923 : Poly :=
[
  term ((-28 : Rat) / 29) [(9, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((56 : Rat) / 29) [(9, 1), (12, 1), (13, 1), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 923 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0923_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0923
        rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYYYY_partial_28_0923 := by
  native_decide

/-- Coefficient term 924 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0924 : Poly :=
[
  term ((949 : Rat) / 116) [(9, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 924 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0924 : Poly :=
[
  term ((949 : Rat) / 58) [(9, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-949 : Rat) / 116) [(9, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 924 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0924_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0924
        rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYYYY_partial_28_0924 := by
  native_decide

/-- Coefficient term 925 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0925 : Poly :=
[
  term ((-440 : Rat) / 87) [(9, 1), (12, 1), (13, 1), (15, 4)]
]

/-- Partial product 925 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0925 : Poly :=
[
  term ((-880 : Rat) / 87) [(9, 1), (12, 1), (13, 1), (14, 1), (15, 4)],
  term ((440 : Rat) / 87) [(9, 1), (12, 1), (13, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 925 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0925_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0925
        rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYYYY_partial_28_0925 := by
  native_decide

/-- Coefficient term 926 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0926 : Poly :=
[
  term ((399 : Rat) / 232) [(9, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 926 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0926 : Poly :=
[
  term ((-399 : Rat) / 232) [(9, 1), (12, 1), (14, 1), (15, 1)],
  term ((399 : Rat) / 116) [(9, 1), (12, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 926 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0926_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0926
        rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYYYY_partial_28_0926 := by
  native_decide

/-- Coefficient term 927 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0927 : Poly :=
[
  term ((9109 : Rat) / 696) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 927 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0927 : Poly :=
[
  term ((9109 : Rat) / 348) [(9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-9109 : Rat) / 696) [(9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 927 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0927_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0927
        rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYYYY_partial_28_0927 := by
  native_decide

/-- Coefficient term 928 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0928 : Poly :=
[
  term ((-49 : Rat) / 12) [(9, 1), (12, 1), (15, 3)]
]

/-- Partial product 928 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0928 : Poly :=
[
  term ((-49 : Rat) / 6) [(9, 1), (12, 1), (14, 1), (15, 3)],
  term ((49 : Rat) / 12) [(9, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 928 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0928_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0928
        rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYYYY_partial_28_0928 := by
  native_decide

/-- Coefficient term 929 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0929 : Poly :=
[
  term ((-5 : Rat) / 4) [(9, 1), (12, 2), (13, 1)]
]

/-- Partial product 929 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0929 : Poly :=
[
  term ((5 : Rat) / 4) [(9, 1), (12, 2), (13, 1)],
  term ((-5 : Rat) / 2) [(9, 1), (12, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 929 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0929_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0929
        rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYYYY_partial_28_0929 := by
  native_decide

/-- Coefficient term 930 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0930 : Poly :=
[
  term ((-40 : Rat) / 29) [(9, 1), (12, 2), (13, 1), (15, 2)]
]

/-- Partial product 930 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0930 : Poly :=
[
  term ((-80 : Rat) / 29) [(9, 1), (12, 2), (13, 1), (14, 1), (15, 2)],
  term ((40 : Rat) / 29) [(9, 1), (12, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 930 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0930_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0930
        rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYYYY_partial_28_0930 := by
  native_decide

/-- Coefficient term 931 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0931 : Poly :=
[
  term ((-583 : Rat) / 116) [(9, 1), (12, 2), (15, 1)]
]

/-- Partial product 931 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0931 : Poly :=
[
  term ((-583 : Rat) / 58) [(9, 1), (12, 2), (14, 1), (15, 1)],
  term ((583 : Rat) / 116) [(9, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 931 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0931_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0931
        rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYYYY_partial_28_0931 := by
  native_decide

/-- Coefficient term 932 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0932 : Poly :=
[
  term ((-28 : Rat) / 29) [(9, 1), (12, 2), (15, 3)]
]

/-- Partial product 932 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0932 : Poly :=
[
  term ((-56 : Rat) / 29) [(9, 1), (12, 2), (14, 1), (15, 3)],
  term ((28 : Rat) / 29) [(9, 1), (12, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 932 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0932_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0932
        rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYYYY_partial_28_0932 := by
  native_decide

/-- Coefficient term 933 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0933 : Poly :=
[
  term ((-35 : Rat) / 12) [(9, 1), (13, 1)]
]

/-- Partial product 933 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0933 : Poly :=
[
  term ((35 : Rat) / 12) [(9, 1), (13, 1)],
  term ((-35 : Rat) / 6) [(9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 933 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0933_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0933
        rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYYYY_partial_28_0933 := by
  native_decide

/-- Coefficient term 934 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0934 : Poly :=
[
  term ((-1 : Rat) / 8) [(9, 1), (13, 1), (14, 1)]
]

/-- Partial product 934 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0934 : Poly :=
[
  term ((1 : Rat) / 8) [(9, 1), (13, 1), (14, 1)],
  term ((-1 : Rat) / 4) [(9, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 934 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0934_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0934
        rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYYYY_partial_28_0934 := by
  native_decide

/-- Coefficient term 935 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0935 : Poly :=
[
  term ((941 : Rat) / 348) [(9, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 935 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0935 : Poly :=
[
  term ((-941 : Rat) / 348) [(9, 1), (13, 1), (14, 1), (15, 2)],
  term ((941 : Rat) / 174) [(9, 1), (13, 1), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 935 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0935_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0935
        rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYYYY_partial_28_0935 := by
  native_decide

/-- Coefficient term 936 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0936 : Poly :=
[
  term ((-3661 : Rat) / 696) [(9, 1), (13, 1), (15, 2)]
]

/-- Partial product 936 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0936 : Poly :=
[
  term ((-3661 : Rat) / 348) [(9, 1), (13, 1), (14, 1), (15, 2)],
  term ((3661 : Rat) / 696) [(9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 936 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0936_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0936
        rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYYYY_partial_28_0936 := by
  native_decide

/-- Coefficient term 937 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0937 : Poly :=
[
  term ((280 : Rat) / 87) [(9, 1), (13, 1), (15, 4)]
]

/-- Partial product 937 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0937 : Poly :=
[
  term ((560 : Rat) / 87) [(9, 1), (13, 1), (14, 1), (15, 4)],
  term ((-280 : Rat) / 87) [(9, 1), (13, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 937 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0937_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0937
        rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYYYY_partial_28_0937 := by
  native_decide

/-- Coefficient term 938 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0938 : Poly :=
[
  term ((-511 : Rat) / 348) [(9, 1), (13, 2), (14, 1), (15, 1)]
]

/-- Partial product 938 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0938 : Poly :=
[
  term ((511 : Rat) / 348) [(9, 1), (13, 2), (14, 1), (15, 1)],
  term ((-511 : Rat) / 174) [(9, 1), (13, 2), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 938 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0938_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0938
        rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYYYY_partial_28_0938 := by
  native_decide

/-- Coefficient term 939 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0939 : Poly :=
[
  term ((440 : Rat) / 87) [(9, 1), (13, 2), (14, 1), (15, 3)]
]

/-- Partial product 939 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0939 : Poly :=
[
  term ((-440 : Rat) / 87) [(9, 1), (13, 2), (14, 1), (15, 3)],
  term ((880 : Rat) / 87) [(9, 1), (13, 2), (14, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 939 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0939_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0939
        rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYYYY_partial_28_0939 := by
  native_decide

/-- Coefficient term 940 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0940 : Poly :=
[
  term ((-3991 : Rat) / 696) [(9, 1), (13, 2), (15, 1)]
]

/-- Partial product 940 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0940 : Poly :=
[
  term ((-3991 : Rat) / 348) [(9, 1), (13, 2), (14, 1), (15, 1)],
  term ((3991 : Rat) / 696) [(9, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 940 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0940_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0940
        rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYYYY_partial_28_0940 := by
  native_decide

/-- Coefficient term 941 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0941 : Poly :=
[
  term ((-260 : Rat) / 87) [(9, 1), (13, 2), (15, 3)]
]

/-- Partial product 941 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0941 : Poly :=
[
  term ((-520 : Rat) / 87) [(9, 1), (13, 2), (14, 1), (15, 3)],
  term ((260 : Rat) / 87) [(9, 1), (13, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 941 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0941_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0941
        rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYYYY_partial_28_0941 := by
  native_decide

/-- Coefficient term 942 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0942 : Poly :=
[
  term ((-1205 : Rat) / 464) [(9, 1), (14, 1), (15, 1)]
]

/-- Partial product 942 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0942 : Poly :=
[
  term ((1205 : Rat) / 464) [(9, 1), (14, 1), (15, 1)],
  term ((-1205 : Rat) / 232) [(9, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 942 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0942_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0942
        rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYYYY_partial_28_0942 := by
  native_decide

/-- Coefficient term 943 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0943 : Poly :=
[
  term ((-13637 : Rat) / 2784) [(9, 1), (15, 1)]
]

/-- Partial product 943 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0943 : Poly :=
[
  term ((-13637 : Rat) / 1392) [(9, 1), (14, 1), (15, 1)],
  term ((13637 : Rat) / 2784) [(9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 943 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0943_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0943
        rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYYYY_partial_28_0943 := by
  native_decide

/-- Coefficient term 944 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0944 : Poly :=
[
  term ((7 : Rat) / 6) [(9, 1), (15, 3)]
]

/-- Partial product 944 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0944 : Poly :=
[
  term ((7 : Rat) / 3) [(9, 1), (14, 1), (15, 3)],
  term ((-7 : Rat) / 6) [(9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 944 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0944_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0944
        rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYYYY_partial_28_0944 := by
  native_decide

/-- Coefficient term 945 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0945 : Poly :=
[
  term ((2805987976 : Rat) / 33189485) [(10, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 945 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0945 : Poly :=
[
  term ((5611975952 : Rat) / 33189485) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-2805987976 : Rat) / 33189485) [(10, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 945 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0945_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0945
        rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYYYY_partial_28_0945 := by
  native_decide

/-- Coefficient term 946 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0946 : Poly :=
[
  term ((-532864 : Rat) / 32699) [(10, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 946 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0946 : Poly :=
[
  term ((-1065728 : Rat) / 32699) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((532864 : Rat) / 32699) [(10, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 946 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0946_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0946
        rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYYYY_partial_28_0946 := by
  native_decide

/-- Coefficient term 947 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0947 : Poly :=
[
  term ((-2511436752 : Rat) / 33189485) [(10, 1), (11, 1), (12, 1), (15, 3)]
]

/-- Partial product 947 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0947 : Poly :=
[
  term ((-5022873504 : Rat) / 33189485) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 3)],
  term ((2511436752 : Rat) / 33189485) [(10, 1), (11, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 947 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0947_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0947
        rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYYYY_partial_28_0947 := by
  native_decide

/-- Coefficient term 948 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0948 : Poly :=
[
  term ((476928 : Rat) / 32699) [(10, 1), (11, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 948 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0948 : Poly :=
[
  term ((953856 : Rat) / 32699) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-476928 : Rat) / 32699) [(10, 1), (11, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 948 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0948_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0948
        rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYYYY_partial_28_0948 := by
  native_decide

/-- Coefficient term 949 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0949 : Poly :=
[
  term ((2511436752 : Rat) / 33189485) [(10, 1), (11, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 949 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0949 : Poly :=
[
  term ((-2511436752 : Rat) / 33189485) [(10, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((5022873504 : Rat) / 33189485) [(10, 1), (11, 1), (13, 1), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 949 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0949_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0949
        rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYYYY_partial_28_0949 := by
  native_decide

/-- Coefficient term 950 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0950 : Poly :=
[
  term ((-476928 : Rat) / 32699) [(10, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 950 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0950 : Poly :=
[
  term ((476928 : Rat) / 32699) [(10, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-953856 : Rat) / 32699) [(10, 1), (11, 1), (13, 1), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 950 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0950_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0950
        rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYYYY_partial_28_0950 := by
  native_decide

/-- Coefficient term 951 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0951 : Poly :=
[
  term ((-6557640408 : Rat) / 33189485) [(10, 1), (11, 1), (13, 1), (15, 2)]
]

/-- Partial product 951 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0951 : Poly :=
[
  term ((-13115280816 : Rat) / 33189485) [(10, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((6557640408 : Rat) / 33189485) [(10, 1), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 951 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0951_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0951
        rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYYYY_partial_28_0951 := by
  native_decide

/-- Coefficient term 952 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0952 : Poly :=
[
  term ((1245312 : Rat) / 32699) [(10, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 952 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0952 : Poly :=
[
  term ((2490624 : Rat) / 32699) [(10, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1245312 : Rat) / 32699) [(10, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 952 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0952_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0952
        rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYYYY_partial_28_0952 := by
  native_decide

/-- Coefficient term 953 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0953 : Poly :=
[
  term ((69762132 : Rat) / 948271) [(10, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 953 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0953 : Poly :=
[
  term ((-69762132 : Rat) / 948271) [(10, 1), (11, 1), (14, 1), (15, 1)],
  term ((139524264 : Rat) / 948271) [(10, 1), (11, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 953 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0953_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0953
        rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYYYY_partial_28_0953 := by
  native_decide

/-- Coefficient term 954 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0954 : Poly :=
[
  term ((-463680 : Rat) / 32699) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 954 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0954 : Poly :=
[
  term ((463680 : Rat) / 32699) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-927360 : Rat) / 32699) [(10, 1), (11, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 954 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0954_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0954
        rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYYYY_partial_28_0954 := by
  native_decide

/-- Coefficient term 955 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0955 : Poly :=
[
  term ((-5379435512 : Rat) / 33189485) [(10, 1), (11, 1), (15, 1)]
]

/-- Partial product 955 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0955 : Poly :=
[
  term ((-10758871024 : Rat) / 33189485) [(10, 1), (11, 1), (14, 1), (15, 1)],
  term ((5379435512 : Rat) / 33189485) [(10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 955 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0955_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0955
        rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYYYY_partial_28_0955 := by
  native_decide

/-- Coefficient term 956 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0956 : Poly :=
[
  term ((1021568 : Rat) / 32699) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 956 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0956 : Poly :=
[
  term ((2043136 : Rat) / 32699) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1021568 : Rat) / 32699) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 956 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0956_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0956
        rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYYYY_partial_28_0956 := by
  native_decide

/-- Coefficient term 957 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0957 : Poly :=
[
  term ((5720494824 : Rat) / 33189485) [(10, 1), (11, 1), (15, 3)]
]

/-- Partial product 957 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0957 : Poly :=
[
  term ((11440989648 : Rat) / 33189485) [(10, 1), (11, 1), (14, 1), (15, 3)],
  term ((-5720494824 : Rat) / 33189485) [(10, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 957 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0957_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0957
        rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYYYY_partial_28_0957 := by
  native_decide

/-- Coefficient term 958 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0958 : Poly :=
[
  term ((-1086336 : Rat) / 32699) [(10, 1), (11, 1), (15, 3), (16, 1)]
]

/-- Partial product 958 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0958 : Poly :=
[
  term ((-2172672 : Rat) / 32699) [(10, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((1086336 : Rat) / 32699) [(10, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 958 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0958_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0958
        rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYYYY_partial_28_0958 := by
  native_decide

/-- Coefficient term 959 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0959 : Poly :=
[
  term ((-124021568 : Rat) / 33189485) [(10, 1), (11, 2), (12, 1), (15, 2)]
]

/-- Partial product 959 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0959 : Poly :=
[
  term ((-248043136 : Rat) / 33189485) [(10, 1), (11, 2), (12, 1), (14, 1), (15, 2)],
  term ((124021568 : Rat) / 33189485) [(10, 1), (11, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 959 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0959_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0959
        rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYYYY_partial_28_0959 := by
  native_decide

/-- Coefficient term 960 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0960 : Poly :=
[
  term ((23552 : Rat) / 32699) [(10, 1), (11, 2), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 960 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0960 : Poly :=
[
  term ((47104 : Rat) / 32699) [(10, 1), (11, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-23552 : Rat) / 32699) [(10, 1), (11, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 960 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0960_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0960
        rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYYYY_partial_28_0960 := by
  native_decide

/-- Coefficient term 961 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0961 : Poly :=
[
  term ((31005392 : Rat) / 33189485) [(10, 1), (11, 2), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 961 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0961 : Poly :=
[
  term ((-31005392 : Rat) / 33189485) [(10, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((62010784 : Rat) / 33189485) [(10, 1), (11, 2), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 961 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0961_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0961
        rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYYYY_partial_28_0961 := by
  native_decide

/-- Coefficient term 962 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0962 : Poly :=
[
  term ((-5888 : Rat) / 32699) [(10, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 962 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0962 : Poly :=
[
  term ((5888 : Rat) / 32699) [(10, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11776 : Rat) / 32699) [(10, 1), (11, 2), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 962 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0962_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0962
        rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYYYY_partial_28_0962 := by
  native_decide

/-- Coefficient term 963 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0963 : Poly :=
[
  term ((-31005392 : Rat) / 33189485) [(10, 1), (11, 2), (13, 1), (15, 1)]
]

/-- Partial product 963 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0963 : Poly :=
[
  term ((-62010784 : Rat) / 33189485) [(10, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((31005392 : Rat) / 33189485) [(10, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 963 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0963_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0963
        rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYYYY_partial_28_0963 := by
  native_decide

/-- Coefficient term 964 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0964 : Poly :=
[
  term ((5888 : Rat) / 32699) [(10, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 964 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0964 : Poly :=
[
  term ((11776 : Rat) / 32699) [(10, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5888 : Rat) / 32699) [(10, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 964 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0964_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0964
        rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYYYY_partial_28_0964 := by
  native_decide

/-- Coefficient term 965 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0965 : Poly :=
[
  term ((-46508088 : Rat) / 33189485) [(10, 1), (11, 2), (15, 2)]
]

/-- Partial product 965 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0965 : Poly :=
[
  term ((-93016176 : Rat) / 33189485) [(10, 1), (11, 2), (14, 1), (15, 2)],
  term ((46508088 : Rat) / 33189485) [(10, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 965 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0965_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0965
        rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYYYY_partial_28_0965 := by
  native_decide

/-- Coefficient term 966 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0966 : Poly :=
[
  term ((8832 : Rat) / 32699) [(10, 1), (11, 2), (15, 2), (16, 1)]
]

/-- Partial product 966 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0966 : Poly :=
[
  term ((17664 : Rat) / 32699) [(10, 1), (11, 2), (14, 1), (15, 2), (16, 1)],
  term ((-8832 : Rat) / 32699) [(10, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 966 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0966_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0966
        rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYYYY_partial_28_0966 := by
  native_decide

/-- Coefficient term 967 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0967 : Poly :=
[
  term ((498313509 : Rat) / 33189485) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 967 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0967 : Poly :=
[
  term ((-498313509 : Rat) / 33189485) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((996627018 : Rat) / 33189485) [(10, 1), (12, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 967 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0967_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0967
        rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYYYY_partial_28_0967 := by
  native_decide

/-- Coefficient term 968 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0968 : Poly :=
[
  term ((-95310 : Rat) / 32699) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 968 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0968 : Poly :=
[
  term ((95310 : Rat) / 32699) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-190620 : Rat) / 32699) [(10, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 968 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0968_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0968
        rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYYYY_partial_28_0968 := by
  native_decide

/-- Coefficient term 969 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0969 : Poly :=
[
  term ((-1494940527 : Rat) / 1746815) [(10, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 969 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0969 : Poly :=
[
  term ((-2989881054 : Rat) / 1746815) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((1494940527 : Rat) / 1746815) [(10, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 969 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0969_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0969
        rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYYYY_partial_28_0969 := by
  native_decide

/-- Coefficient term 970 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0970 : Poly :=
[
  term ((285930 : Rat) / 1721) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 970 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0970 : Poly :=
[
  term ((571860 : Rat) / 1721) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-285930 : Rat) / 1721) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 970 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0970_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0970
        rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYYYY_partial_28_0970 := by
  native_decide

/-- Coefficient term 971 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0971 : Poly :=
[
  term ((8969643162 : Rat) / 6637897) [(10, 1), (12, 1), (13, 1), (15, 3)]
]

/-- Partial product 971 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0971 : Poly :=
[
  term ((17939286324 : Rat) / 6637897) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 3)],
  term ((-8969643162 : Rat) / 6637897) [(10, 1), (12, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 971 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0971_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0971
        rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYYYY_partial_28_0971 := by
  native_decide

/-- Coefficient term 972 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0972 : Poly :=
[
  term ((-8577900 : Rat) / 32699) [(10, 1), (12, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 972 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0972 : Poly :=
[
  term ((-17155800 : Rat) / 32699) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((8577900 : Rat) / 32699) [(10, 1), (12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 972 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0972_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0972
        rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYYYY_partial_28_0972 := by
  native_decide

/-- Coefficient term 973 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0973 : Poly :=
[
  term ((3986508072 : Rat) / 33189485) [(10, 1), (12, 1), (13, 2), (15, 2)]
]

/-- Partial product 973 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0973 : Poly :=
[
  term ((7973016144 : Rat) / 33189485) [(10, 1), (12, 1), (13, 2), (14, 1), (15, 2)],
  term ((-3986508072 : Rat) / 33189485) [(10, 1), (12, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 973 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0973_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0973
        rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYYYY_partial_28_0973 := by
  native_decide

/-- Coefficient term 974 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0974 : Poly :=
[
  term ((-762480 : Rat) / 32699) [(10, 1), (12, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 974 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0974 : Poly :=
[
  term ((-1524960 : Rat) / 32699) [(10, 1), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((762480 : Rat) / 32699) [(10, 1), (12, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 974 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0974_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0974
        rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYYYY_partial_28_0974 := by
  native_decide

/-- Coefficient term 975 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0975 : Poly :=
[
  term ((-498313509 : Rat) / 66378970) [(10, 1), (12, 1), (14, 1), (15, 2)]
]

/-- Partial product 975 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0975 : Poly :=
[
  term ((498313509 : Rat) / 66378970) [(10, 1), (12, 1), (14, 1), (15, 2)],
  term ((-498313509 : Rat) / 33189485) [(10, 1), (12, 1), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 975 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0975_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0975
        rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYYYY_partial_28_0975 := by
  native_decide

/-- Coefficient term 976 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0976 : Poly :=
[
  term ((47655 : Rat) / 32699) [(10, 1), (12, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 976 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0976 : Poly :=
[
  term ((-47655 : Rat) / 32699) [(10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((95310 : Rat) / 32699) [(10, 1), (12, 1), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 976 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0976_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0976
        rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYYYY_partial_28_0976 := by
  native_decide

/-- Coefficient term 977 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0977 : Poly :=
[
  term ((-6808840147 : Rat) / 20961780) [(10, 1), (12, 1), (15, 2)]
]

/-- Partial product 977 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0977 : Poly :=
[
  term ((-6808840147 : Rat) / 10480890) [(10, 1), (12, 1), (14, 1), (15, 2)],
  term ((6808840147 : Rat) / 20961780) [(10, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 977 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0977_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0977
        rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYYYY_partial_28_0977 := by
  native_decide

/-- Coefficient term 978 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0978 : Poly :=
[
  term ((325504 : Rat) / 5163) [(10, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 978 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0978 : Poly :=
[
  term ((651008 : Rat) / 5163) [(10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-325504 : Rat) / 5163) [(10, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 978 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0978_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0978
        rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYYYY_partial_28_0978 := by
  native_decide

/-- Coefficient term 979 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0979 : Poly :=
[
  term ((166104503 : Rat) / 1746815) [(10, 1), (12, 1), (15, 4)]
]

/-- Partial product 979 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0979 : Poly :=
[
  term ((332209006 : Rat) / 1746815) [(10, 1), (12, 1), (14, 1), (15, 4)],
  term ((-166104503 : Rat) / 1746815) [(10, 1), (12, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 979 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0979_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0979
        rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYYYY_partial_28_0979 := by
  native_decide

/-- Coefficient term 980 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0980 : Poly :=
[
  term ((-31770 : Rat) / 1721) [(10, 1), (12, 1), (15, 4), (16, 1)]
]

/-- Partial product 980 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0980 : Poly :=
[
  term ((-63540 : Rat) / 1721) [(10, 1), (12, 1), (14, 1), (15, 4), (16, 1)],
  term ((31770 : Rat) / 1721) [(10, 1), (12, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 980 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0980_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0980
        rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYYYY_partial_28_0980 := by
  native_decide

/-- Coefficient term 981 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0981 : Poly :=
[
  term ((1993254036 : Rat) / 33189485) [(10, 1), (12, 2), (13, 1), (15, 1)]
]

/-- Partial product 981 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0981 : Poly :=
[
  term ((3986508072 : Rat) / 33189485) [(10, 1), (12, 2), (13, 1), (14, 1), (15, 1)],
  term ((-1993254036 : Rat) / 33189485) [(10, 1), (12, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 981 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0981_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0981
        rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYYYY_partial_28_0981 := by
  native_decide

/-- Coefficient term 982 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0982 : Poly :=
[
  term ((-381240 : Rat) / 32699) [(10, 1), (12, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 982 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0982 : Poly :=
[
  term ((-762480 : Rat) / 32699) [(10, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((381240 : Rat) / 32699) [(10, 1), (12, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 982 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0982_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0982
        rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYYYY_partial_28_0982 := by
  native_decide

/-- Coefficient term 983 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0983 : Poly :=
[
  term ((3986508072 : Rat) / 33189485) [(10, 1), (12, 2), (15, 2)]
]

/-- Partial product 983 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0983 : Poly :=
[
  term ((7973016144 : Rat) / 33189485) [(10, 1), (12, 2), (14, 1), (15, 2)],
  term ((-3986508072 : Rat) / 33189485) [(10, 1), (12, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 983 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0983_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0983
        rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYYYY_partial_28_0983 := by
  native_decide

/-- Coefficient term 984 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0984 : Poly :=
[
  term ((-762480 : Rat) / 32699) [(10, 1), (12, 2), (15, 2), (16, 1)]
]

/-- Partial product 984 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0984 : Poly :=
[
  term ((-1524960 : Rat) / 32699) [(10, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((762480 : Rat) / 32699) [(10, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 984 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0984_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0984
        rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYYYY_partial_28_0984 := by
  native_decide

/-- Coefficient term 985 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0985 : Poly :=
[
  term ((13296046453 : Rat) / 159309528) [(10, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 985 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0985 : Poly :=
[
  term ((-13296046453 : Rat) / 159309528) [(10, 1), (13, 1), (14, 1), (15, 1)],
  term ((13296046453 : Rat) / 79654764) [(10, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 985 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0985_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0985
        rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYYYY_partial_28_0985 := by
  native_decide

/-- Coefficient term 986 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0986 : Poly :=
[
  term ((-1597423 : Rat) / 98097) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 986 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0986 : Poly :=
[
  term ((1597423 : Rat) / 98097) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3194846 : Rat) / 98097) [(10, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 986 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0986_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0986
        rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYYYY_partial_28_0986 := by
  native_decide

/-- Coefficient term 987 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0987 : Poly :=
[
  term ((-166104503 : Rat) / 1746815) [(10, 1), (13, 1), (14, 1), (15, 3)]
]

/-- Partial product 987 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0987 : Poly :=
[
  term ((166104503 : Rat) / 1746815) [(10, 1), (13, 1), (14, 1), (15, 3)],
  term ((-332209006 : Rat) / 1746815) [(10, 1), (13, 1), (14, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 987 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0987_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0987
        rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYYYY_partial_28_0987 := by
  native_decide

/-- Coefficient term 988 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0988 : Poly :=
[
  term ((31770 : Rat) / 1721) [(10, 1), (13, 1), (14, 1), (15, 3), (16, 1)]
]

/-- Partial product 988 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0988 : Poly :=
[
  term ((-31770 : Rat) / 1721) [(10, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((63540 : Rat) / 1721) [(10, 1), (13, 1), (14, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 988 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0988_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0988
        rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYYYY_partial_28_0988 := by
  native_decide

/-- Coefficient term 989 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0989 : Poly :=
[
  term ((15695078723 : Rat) / 39827382) [(10, 1), (13, 1), (15, 1)]
]

/-- Partial product 989 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0989 : Poly :=
[
  term ((15695078723 : Rat) / 19913691) [(10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-15695078723 : Rat) / 39827382) [(10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 989 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0989_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0989
        rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYYYY_partial_28_0989 := by
  native_decide

/-- Coefficient term 990 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0990 : Poly :=
[
  term ((-7480754 : Rat) / 98097) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 990 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0990 : Poly :=
[
  term ((-14961508 : Rat) / 98097) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((7480754 : Rat) / 98097) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 990 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0990_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0990
        rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYYYY_partial_28_0990 := by
  native_decide

/-- Coefficient term 991 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0991 : Poly :=
[
  term ((-41692230253 : Rat) / 66378970) [(10, 1), (13, 1), (15, 3)]
]

/-- Partial product 991 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0991 : Poly :=
[
  term ((-41692230253 : Rat) / 33189485) [(10, 1), (13, 1), (14, 1), (15, 3)],
  term ((41692230253 : Rat) / 66378970) [(10, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 991 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0991_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0991
        rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYYYY_partial_28_0991 := by
  native_decide

/-- Coefficient term 992 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0992 : Poly :=
[
  term ((3987135 : Rat) / 32699) [(10, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 992 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0992 : Poly :=
[
  term ((7974270 : Rat) / 32699) [(10, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-3987135 : Rat) / 32699) [(10, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 992 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0992_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0992
        rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYYYY_partial_28_0992 := by
  native_decide

/-- Coefficient term 993 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0993 : Poly :=
[
  term ((-8969643162 : Rat) / 6637897) [(10, 1), (13, 2), (14, 1), (15, 2)]
]

/-- Partial product 993 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0993 : Poly :=
[
  term ((8969643162 : Rat) / 6637897) [(10, 1), (13, 2), (14, 1), (15, 2)],
  term ((-17939286324 : Rat) / 6637897) [(10, 1), (13, 2), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 993 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0993_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0993
        rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYYYY_partial_28_0993 := by
  native_decide

/-- Coefficient term 994 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0994 : Poly :=
[
  term ((8577900 : Rat) / 32699) [(10, 1), (13, 2), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 994 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0994 : Poly :=
[
  term ((-8577900 : Rat) / 32699) [(10, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((17155800 : Rat) / 32699) [(10, 1), (13, 2), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 994 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0994_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0994
        rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYYYY_partial_28_0994 := by
  native_decide

/-- Coefficient term 995 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0995 : Poly :=
[
  term ((498313509 : Rat) / 948271) [(10, 1), (13, 2), (15, 2)]
]

/-- Partial product 995 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0995 : Poly :=
[
  term ((996627018 : Rat) / 948271) [(10, 1), (13, 2), (14, 1), (15, 2)],
  term ((-498313509 : Rat) / 948271) [(10, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 995 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0995_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0995
        rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYYYY_partial_28_0995 := by
  native_decide

/-- Coefficient term 996 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0996 : Poly :=
[
  term ((-3335850 : Rat) / 32699) [(10, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 996 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0996 : Poly :=
[
  term ((-6671700 : Rat) / 32699) [(10, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((3335850 : Rat) / 32699) [(10, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 996 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0996_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0996
        rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYYYY_partial_28_0996 := by
  native_decide

/-- Coefficient term 997 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0997 : Poly :=
[
  term ((-3986508072 : Rat) / 33189485) [(10, 1), (13, 3), (14, 1), (15, 1)]
]

/-- Partial product 997 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0997 : Poly :=
[
  term ((3986508072 : Rat) / 33189485) [(10, 1), (13, 3), (14, 1), (15, 1)],
  term ((-7973016144 : Rat) / 33189485) [(10, 1), (13, 3), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 997 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0997_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0997
        rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYYYY_partial_28_0997 := by
  native_decide

/-- Coefficient term 998 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0998 : Poly :=
[
  term ((762480 : Rat) / 32699) [(10, 1), (13, 3), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 998 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0998 : Poly :=
[
  term ((-762480 : Rat) / 32699) [(10, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((1524960 : Rat) / 32699) [(10, 1), (13, 3), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 998 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0998_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0998
        rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYYYY_partial_28_0998 := by
  native_decide

/-- Coefficient term 999 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0999 : Poly :=
[
  term ((-1993254036 : Rat) / 33189485) [(10, 1), (13, 3), (15, 1)]
]

/-- Partial product 999 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0999 : Poly :=
[
  term ((-3986508072 : Rat) / 33189485) [(10, 1), (13, 3), (14, 1), (15, 1)],
  term ((1993254036 : Rat) / 33189485) [(10, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 999 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0999_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0999
        rs_R009_ueqv_R009NYYYY_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYYYY_partial_28_0999 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NYYYY_partials_28_0900_0999 : List Poly :=
[
  rs_R009_ueqv_R009NYYYY_partial_28_0900,
  rs_R009_ueqv_R009NYYYY_partial_28_0901,
  rs_R009_ueqv_R009NYYYY_partial_28_0902,
  rs_R009_ueqv_R009NYYYY_partial_28_0903,
  rs_R009_ueqv_R009NYYYY_partial_28_0904,
  rs_R009_ueqv_R009NYYYY_partial_28_0905,
  rs_R009_ueqv_R009NYYYY_partial_28_0906,
  rs_R009_ueqv_R009NYYYY_partial_28_0907,
  rs_R009_ueqv_R009NYYYY_partial_28_0908,
  rs_R009_ueqv_R009NYYYY_partial_28_0909,
  rs_R009_ueqv_R009NYYYY_partial_28_0910,
  rs_R009_ueqv_R009NYYYY_partial_28_0911,
  rs_R009_ueqv_R009NYYYY_partial_28_0912,
  rs_R009_ueqv_R009NYYYY_partial_28_0913,
  rs_R009_ueqv_R009NYYYY_partial_28_0914,
  rs_R009_ueqv_R009NYYYY_partial_28_0915,
  rs_R009_ueqv_R009NYYYY_partial_28_0916,
  rs_R009_ueqv_R009NYYYY_partial_28_0917,
  rs_R009_ueqv_R009NYYYY_partial_28_0918,
  rs_R009_ueqv_R009NYYYY_partial_28_0919,
  rs_R009_ueqv_R009NYYYY_partial_28_0920,
  rs_R009_ueqv_R009NYYYY_partial_28_0921,
  rs_R009_ueqv_R009NYYYY_partial_28_0922,
  rs_R009_ueqv_R009NYYYY_partial_28_0923,
  rs_R009_ueqv_R009NYYYY_partial_28_0924,
  rs_R009_ueqv_R009NYYYY_partial_28_0925,
  rs_R009_ueqv_R009NYYYY_partial_28_0926,
  rs_R009_ueqv_R009NYYYY_partial_28_0927,
  rs_R009_ueqv_R009NYYYY_partial_28_0928,
  rs_R009_ueqv_R009NYYYY_partial_28_0929,
  rs_R009_ueqv_R009NYYYY_partial_28_0930,
  rs_R009_ueqv_R009NYYYY_partial_28_0931,
  rs_R009_ueqv_R009NYYYY_partial_28_0932,
  rs_R009_ueqv_R009NYYYY_partial_28_0933,
  rs_R009_ueqv_R009NYYYY_partial_28_0934,
  rs_R009_ueqv_R009NYYYY_partial_28_0935,
  rs_R009_ueqv_R009NYYYY_partial_28_0936,
  rs_R009_ueqv_R009NYYYY_partial_28_0937,
  rs_R009_ueqv_R009NYYYY_partial_28_0938,
  rs_R009_ueqv_R009NYYYY_partial_28_0939,
  rs_R009_ueqv_R009NYYYY_partial_28_0940,
  rs_R009_ueqv_R009NYYYY_partial_28_0941,
  rs_R009_ueqv_R009NYYYY_partial_28_0942,
  rs_R009_ueqv_R009NYYYY_partial_28_0943,
  rs_R009_ueqv_R009NYYYY_partial_28_0944,
  rs_R009_ueqv_R009NYYYY_partial_28_0945,
  rs_R009_ueqv_R009NYYYY_partial_28_0946,
  rs_R009_ueqv_R009NYYYY_partial_28_0947,
  rs_R009_ueqv_R009NYYYY_partial_28_0948,
  rs_R009_ueqv_R009NYYYY_partial_28_0949,
  rs_R009_ueqv_R009NYYYY_partial_28_0950,
  rs_R009_ueqv_R009NYYYY_partial_28_0951,
  rs_R009_ueqv_R009NYYYY_partial_28_0952,
  rs_R009_ueqv_R009NYYYY_partial_28_0953,
  rs_R009_ueqv_R009NYYYY_partial_28_0954,
  rs_R009_ueqv_R009NYYYY_partial_28_0955,
  rs_R009_ueqv_R009NYYYY_partial_28_0956,
  rs_R009_ueqv_R009NYYYY_partial_28_0957,
  rs_R009_ueqv_R009NYYYY_partial_28_0958,
  rs_R009_ueqv_R009NYYYY_partial_28_0959,
  rs_R009_ueqv_R009NYYYY_partial_28_0960,
  rs_R009_ueqv_R009NYYYY_partial_28_0961,
  rs_R009_ueqv_R009NYYYY_partial_28_0962,
  rs_R009_ueqv_R009NYYYY_partial_28_0963,
  rs_R009_ueqv_R009NYYYY_partial_28_0964,
  rs_R009_ueqv_R009NYYYY_partial_28_0965,
  rs_R009_ueqv_R009NYYYY_partial_28_0966,
  rs_R009_ueqv_R009NYYYY_partial_28_0967,
  rs_R009_ueqv_R009NYYYY_partial_28_0968,
  rs_R009_ueqv_R009NYYYY_partial_28_0969,
  rs_R009_ueqv_R009NYYYY_partial_28_0970,
  rs_R009_ueqv_R009NYYYY_partial_28_0971,
  rs_R009_ueqv_R009NYYYY_partial_28_0972,
  rs_R009_ueqv_R009NYYYY_partial_28_0973,
  rs_R009_ueqv_R009NYYYY_partial_28_0974,
  rs_R009_ueqv_R009NYYYY_partial_28_0975,
  rs_R009_ueqv_R009NYYYY_partial_28_0976,
  rs_R009_ueqv_R009NYYYY_partial_28_0977,
  rs_R009_ueqv_R009NYYYY_partial_28_0978,
  rs_R009_ueqv_R009NYYYY_partial_28_0979,
  rs_R009_ueqv_R009NYYYY_partial_28_0980,
  rs_R009_ueqv_R009NYYYY_partial_28_0981,
  rs_R009_ueqv_R009NYYYY_partial_28_0982,
  rs_R009_ueqv_R009NYYYY_partial_28_0983,
  rs_R009_ueqv_R009NYYYY_partial_28_0984,
  rs_R009_ueqv_R009NYYYY_partial_28_0985,
  rs_R009_ueqv_R009NYYYY_partial_28_0986,
  rs_R009_ueqv_R009NYYYY_partial_28_0987,
  rs_R009_ueqv_R009NYYYY_partial_28_0988,
  rs_R009_ueqv_R009NYYYY_partial_28_0989,
  rs_R009_ueqv_R009NYYYY_partial_28_0990,
  rs_R009_ueqv_R009NYYYY_partial_28_0991,
  rs_R009_ueqv_R009NYYYY_partial_28_0992,
  rs_R009_ueqv_R009NYYYY_partial_28_0993,
  rs_R009_ueqv_R009NYYYY_partial_28_0994,
  rs_R009_ueqv_R009NYYYY_partial_28_0995,
  rs_R009_ueqv_R009NYYYY_partial_28_0996,
  rs_R009_ueqv_R009NYYYY_partial_28_0997,
  rs_R009_ueqv_R009NYYYY_partial_28_0998,
  rs_R009_ueqv_R009NYYYY_partial_28_0999
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NYYYY_block_28_0900_0999 : Poly :=
[
  term ((-819873772 : Rat) / 99568455) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((153088 : Rat) / 98097) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-165825104 : Rat) / 99568455) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 3)],
  term ((-135424 : Rat) / 98097) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((1084751888 : Rat) / 99568455) [(9, 1), (11, 1), (13, 1), (14, 2), (15, 3)],
  term ((-17664 : Rat) / 32699) [(9, 1), (11, 1), (13, 1), (14, 2), (15, 3), (16, 1)],
  term ((409936886 : Rat) / 99568455) [(9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-76544 : Rat) / 98097) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-37655084 : Rat) / 19913691) [(9, 1), (11, 1), (13, 1), (15, 3)],
  term ((80960 : Rat) / 98097) [(9, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-124021568 : Rat) / 6637897) [(9, 1), (11, 1), (13, 2), (14, 1), (15, 2)],
  term ((117760 : Rat) / 32699) [(9, 1), (11, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((1147199504 : Rat) / 99568455) [(9, 1), (11, 1), (13, 2), (14, 2), (15, 2)],
  term ((-217856 : Rat) / 98097) [(9, 1), (11, 1), (13, 2), (14, 2), (15, 2), (16, 1)],
  term ((643361884 : Rat) / 99568455) [(9, 1), (11, 1), (13, 2), (15, 2)],
  term ((-122176 : Rat) / 98097) [(9, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-95921332 : Rat) / 14224065) [(9, 1), (11, 1), (14, 1), (15, 2)],
  term ((30912 : Rat) / 32699) [(9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((698752672 : Rat) / 99568455) [(9, 1), (11, 1), (14, 1), (15, 4)],
  term ((-11776 : Rat) / 32699) [(9, 1), (11, 1), (14, 1), (15, 4), (16, 1)],
  term ((-101807152 : Rat) / 33189485) [(9, 1), (11, 1), (14, 2), (15, 2)],
  term ((13248 : Rat) / 32699) [(9, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((412080026 : Rat) / 99568455) [(9, 1), (11, 1), (15, 2)],
  term ((-18768 : Rat) / 32699) [(9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-349376336 : Rat) / 99568455) [(9, 1), (11, 1), (15, 4)],
  term ((5888 : Rat) / 32699) [(9, 1), (11, 1), (15, 4), (16, 1)],
  term ((-124021568 : Rat) / 33189485) [(9, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((23552 : Rat) / 32699) [(9, 1), (11, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((62010784 : Rat) / 33189485) [(9, 1), (11, 2), (12, 1), (15, 1)],
  term ((-11776 : Rat) / 32699) [(9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((62010784 : Rat) / 33189485) [(9, 1), (11, 2), (14, 2), (15, 1)],
  term ((-11776 : Rat) / 32699) [(9, 1), (11, 2), (14, 2), (15, 1), (16, 1)],
  term ((-15502696 : Rat) / 33189485) [(9, 1), (11, 2), (15, 1)],
  term ((2944 : Rat) / 32699) [(9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-125 : Rat) / 24) [(9, 1), (12, 1), (13, 1)],
  term ((125 : Rat) / 12) [(9, 1), (12, 1), (13, 1), (14, 1)],
  term ((893 : Rat) / 58) [(9, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-880 : Rat) / 87) [(9, 1), (12, 1), (13, 1), (14, 1), (15, 4)],
  term ((56 : Rat) / 29) [(9, 1), (12, 1), (13, 1), (14, 2), (15, 2)],
  term ((-949 : Rat) / 116) [(9, 1), (12, 1), (13, 1), (15, 2)],
  term ((440 : Rat) / 87) [(9, 1), (12, 1), (13, 1), (15, 4)],
  term ((17021 : Rat) / 696) [(9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-49 : Rat) / 6) [(9, 1), (12, 1), (14, 1), (15, 3)],
  term ((399 : Rat) / 116) [(9, 1), (12, 1), (14, 2), (15, 1)],
  term ((-9109 : Rat) / 696) [(9, 1), (12, 1), (15, 1)],
  term ((49 : Rat) / 12) [(9, 1), (12, 1), (15, 3)],
  term ((5 : Rat) / 4) [(9, 1), (12, 2), (13, 1)],
  term ((-5 : Rat) / 2) [(9, 1), (12, 2), (13, 1), (14, 1)],
  term ((-80 : Rat) / 29) [(9, 1), (12, 2), (13, 1), (14, 1), (15, 2)],
  term ((40 : Rat) / 29) [(9, 1), (12, 2), (13, 1), (15, 2)],
  term ((-583 : Rat) / 58) [(9, 1), (12, 2), (14, 1), (15, 1)],
  term ((-56 : Rat) / 29) [(9, 1), (12, 2), (14, 1), (15, 3)],
  term ((583 : Rat) / 116) [(9, 1), (12, 2), (15, 1)],
  term ((28 : Rat) / 29) [(9, 1), (12, 2), (15, 3)],
  term ((35 : Rat) / 12) [(9, 1), (13, 1)],
  term ((-137 : Rat) / 24) [(9, 1), (13, 1), (14, 1)],
  term ((-767 : Rat) / 58) [(9, 1), (13, 1), (14, 1), (15, 2)],
  term ((560 : Rat) / 87) [(9, 1), (13, 1), (14, 1), (15, 4)],
  term ((-1 : Rat) / 4) [(9, 1), (13, 1), (14, 2)],
  term ((941 : Rat) / 174) [(9, 1), (13, 1), (14, 2), (15, 2)],
  term ((3661 : Rat) / 696) [(9, 1), (13, 1), (15, 2)],
  term ((-280 : Rat) / 87) [(9, 1), (13, 1), (15, 4)],
  term (-10 : Rat) [(9, 1), (13, 2), (14, 1), (15, 1)],
  term ((-320 : Rat) / 29) [(9, 1), (13, 2), (14, 1), (15, 3)],
  term ((-511 : Rat) / 174) [(9, 1), (13, 2), (14, 2), (15, 1)],
  term ((880 : Rat) / 87) [(9, 1), (13, 2), (14, 2), (15, 3)],
  term ((3991 : Rat) / 696) [(9, 1), (13, 2), (15, 1)],
  term ((260 : Rat) / 87) [(9, 1), (13, 2), (15, 3)],
  term ((-5011 : Rat) / 696) [(9, 1), (14, 1), (15, 1)],
  term ((7 : Rat) / 3) [(9, 1), (14, 1), (15, 3)],
  term ((-1205 : Rat) / 232) [(9, 1), (14, 2), (15, 1)],
  term ((13637 : Rat) / 2784) [(9, 1), (15, 1)],
  term ((-7 : Rat) / 6) [(9, 1), (15, 3)],
  term ((5611975952 : Rat) / 33189485) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1065728 : Rat) / 32699) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5022873504 : Rat) / 33189485) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 3)],
  term ((953856 : Rat) / 32699) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-2805987976 : Rat) / 33189485) [(10, 1), (11, 1), (12, 1), (15, 1)],
  term ((532864 : Rat) / 32699) [(10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((2511436752 : Rat) / 33189485) [(10, 1), (11, 1), (12, 1), (15, 3)],
  term ((-476928 : Rat) / 32699) [(10, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-2232388224 : Rat) / 4741355) [(10, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((2967552 : Rat) / 32699) [(10, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((5022873504 : Rat) / 33189485) [(10, 1), (11, 1), (13, 1), (14, 2), (15, 2)],
  term ((-953856 : Rat) / 32699) [(10, 1), (11, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((6557640408 : Rat) / 33189485) [(10, 1), (11, 1), (13, 1), (15, 2)],
  term ((-1245312 : Rat) / 32699) [(10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-13200545644 : Rat) / 33189485) [(10, 1), (11, 1), (14, 1), (15, 1)],
  term ((2506816 : Rat) / 32699) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((11440989648 : Rat) / 33189485) [(10, 1), (11, 1), (14, 1), (15, 3)],
  term ((-2172672 : Rat) / 32699) [(10, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((139524264 : Rat) / 948271) [(10, 1), (11, 1), (14, 2), (15, 1)],
  term ((-927360 : Rat) / 32699) [(10, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((5379435512 : Rat) / 33189485) [(10, 1), (11, 1), (15, 1)],
  term ((-1021568 : Rat) / 32699) [(10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-5720494824 : Rat) / 33189485) [(10, 1), (11, 1), (15, 3)],
  term ((1086336 : Rat) / 32699) [(10, 1), (11, 1), (15, 3), (16, 1)],
  term ((-248043136 : Rat) / 33189485) [(10, 1), (11, 2), (12, 1), (14, 1), (15, 2)],
  term ((47104 : Rat) / 32699) [(10, 1), (11, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((124021568 : Rat) / 33189485) [(10, 1), (11, 2), (12, 1), (15, 2)],
  term ((-23552 : Rat) / 32699) [(10, 1), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((-93016176 : Rat) / 33189485) [(10, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((17664 : Rat) / 32699) [(10, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((62010784 : Rat) / 33189485) [(10, 1), (11, 2), (13, 1), (14, 2), (15, 1)],
  term ((-11776 : Rat) / 32699) [(10, 1), (11, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((31005392 : Rat) / 33189485) [(10, 1), (11, 2), (13, 1), (15, 1)],
  term ((-5888 : Rat) / 32699) [(10, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-93016176 : Rat) / 33189485) [(10, 1), (11, 2), (14, 1), (15, 2)],
  term ((17664 : Rat) / 32699) [(10, 1), (11, 2), (14, 1), (15, 2), (16, 1)],
  term ((46508088 : Rat) / 33189485) [(10, 1), (11, 2), (15, 2)],
  term ((-8832 : Rat) / 32699) [(10, 1), (11, 2), (15, 2), (16, 1)],
  term ((-11461210707 : Rat) / 6637897) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((10960650 : Rat) / 32699) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((17939286324 : Rat) / 6637897) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 3)],
  term ((-17155800 : Rat) / 32699) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((996627018 : Rat) / 33189485) [(10, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-190620 : Rat) / 32699) [(10, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((1494940527 : Rat) / 1746815) [(10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-285930 : Rat) / 1721) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-8969643162 : Rat) / 6637897) [(10, 1), (12, 1), (13, 1), (15, 3)],
  term ((8577900 : Rat) / 32699) [(10, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((7973016144 : Rat) / 33189485) [(10, 1), (12, 1), (13, 2), (14, 1), (15, 2)],
  term ((-1524960 : Rat) / 32699) [(10, 1), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-3986508072 : Rat) / 33189485) [(10, 1), (12, 1), (13, 2), (15, 2)],
  term ((762480 : Rat) / 32699) [(10, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-63936511133 : Rat) / 99568455) [(10, 1), (12, 1), (14, 1), (15, 2)],
  term ((12226187 : Rat) / 98097) [(10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((332209006 : Rat) / 1746815) [(10, 1), (12, 1), (14, 1), (15, 4)],
  term ((-63540 : Rat) / 1721) [(10, 1), (12, 1), (14, 1), (15, 4), (16, 1)],
  term ((-498313509 : Rat) / 33189485) [(10, 1), (12, 1), (14, 2), (15, 2)],
  term ((95310 : Rat) / 32699) [(10, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((6808840147 : Rat) / 20961780) [(10, 1), (12, 1), (15, 2)],
  term ((-325504 : Rat) / 5163) [(10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-166104503 : Rat) / 1746815) [(10, 1), (12, 1), (15, 4)],
  term ((31770 : Rat) / 1721) [(10, 1), (12, 1), (15, 4), (16, 1)],
  term ((3986508072 : Rat) / 33189485) [(10, 1), (12, 2), (13, 1), (14, 1), (15, 1)],
  term ((-762480 : Rat) / 32699) [(10, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1993254036 : Rat) / 33189485) [(10, 1), (12, 2), (13, 1), (15, 1)],
  term ((381240 : Rat) / 32699) [(10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((7973016144 : Rat) / 33189485) [(10, 1), (12, 2), (14, 1), (15, 2)],
  term ((-1524960 : Rat) / 32699) [(10, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-3986508072 : Rat) / 33189485) [(10, 1), (12, 2), (15, 2)],
  term ((762480 : Rat) / 32699) [(10, 1), (12, 2), (15, 2), (16, 1)],
  term ((37421527777 : Rat) / 53103176) [(10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-4454695 : Rat) / 32699) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1328836024 : Rat) / 1144465) [(10, 1), (13, 1), (14, 1), (15, 3)],
  term ((7370640 : Rat) / 32699) [(10, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((13296046453 : Rat) / 79654764) [(10, 1), (13, 1), (14, 2), (15, 1)],
  term ((-3194846 : Rat) / 98097) [(10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-332209006 : Rat) / 1746815) [(10, 1), (13, 1), (14, 2), (15, 3)],
  term ((63540 : Rat) / 1721) [(10, 1), (13, 1), (14, 2), (15, 3), (16, 1)],
  term ((-15695078723 : Rat) / 39827382) [(10, 1), (13, 1), (15, 1)],
  term ((7480754 : Rat) / 98097) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term ((41692230253 : Rat) / 66378970) [(10, 1), (13, 1), (15, 3)],
  term ((-3987135 : Rat) / 32699) [(10, 1), (13, 1), (15, 3), (16, 1)],
  term ((15946032288 : Rat) / 6637897) [(10, 1), (13, 2), (14, 1), (15, 2)],
  term ((-15249600 : Rat) / 32699) [(10, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-17939286324 : Rat) / 6637897) [(10, 1), (13, 2), (14, 2), (15, 2)],
  term ((17155800 : Rat) / 32699) [(10, 1), (13, 2), (14, 2), (15, 2), (16, 1)],
  term ((-498313509 : Rat) / 948271) [(10, 1), (13, 2), (15, 2)],
  term ((3335850 : Rat) / 32699) [(10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-762480 : Rat) / 32699) [(10, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-7973016144 : Rat) / 33189485) [(10, 1), (13, 3), (14, 2), (15, 1)],
  term ((1524960 : Rat) / 32699) [(10, 1), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((1993254036 : Rat) / 33189485) [(10, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 28, terms 900 through 999. -/
theorem rs_R009_ueqv_R009NYYYY_block_28_0900_0999_valid :
    checkProductSumEq rs_R009_ueqv_R009NYYYY_partials_28_0900_0999
      rs_R009_ueqv_R009NYYYY_block_28_0900_0999 = true := by
  native_decide

end R009UeqvR009NYYYYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
