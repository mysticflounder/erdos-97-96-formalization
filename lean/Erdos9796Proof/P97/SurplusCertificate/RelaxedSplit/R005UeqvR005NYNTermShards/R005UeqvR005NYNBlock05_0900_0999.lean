/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R005:u=v:R005NYN, term block 5:900-999

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R005UeqvR005NYNTermShards

/-- Generator polynomial 5 for relaxed split surplus certificate `R005:u=v:R005NYN`. -/
def rs_R005_ueqv_R005NYN_generator_05_0900_0999 : Poly :=
[
  term (-2 : Rat) [(2, 1)],
  term (1 : Rat) [(2, 2)],
  term (1 : Rat) [(3, 2)],
  term (2 : Rat) [(14, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 900 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0900 : Poly :=
[
  term ((22237760 : Rat) / 385571) [(3, 1), (5, 1), (8, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 900 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0900 : Poly :=
[
  term ((-44475520 : Rat) / 385571) [(2, 1), (3, 1), (5, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((22237760 : Rat) / 385571) [(2, 2), (3, 1), (5, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((44475520 : Rat) / 385571) [(3, 1), (5, 1), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-22237760 : Rat) / 385571) [(3, 1), (5, 1), (8, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-22237760 : Rat) / 385571) [(3, 1), (5, 1), (8, 1), (12, 1), (15, 4), (16, 1)],
  term ((22237760 : Rat) / 385571) [(3, 3), (5, 1), (8, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 900 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0900_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0900
        rs_R005_ueqv_R005NYN_generator_05_0900_0999 =
      rs_R005_ueqv_R005NYN_partial_05_0900 := by
  native_decide

/-- Coefficient term 901 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0901 : Poly :=
[
  term ((6348800 : Rat) / 158397) [(3, 1), (5, 1), (12, 1), (15, 2)]
]

/-- Partial product 901 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0901 : Poly :=
[
  term ((-12697600 : Rat) / 158397) [(2, 1), (3, 1), (5, 1), (12, 1), (15, 2)],
  term ((6348800 : Rat) / 158397) [(2, 2), (3, 1), (5, 1), (12, 1), (15, 2)],
  term ((12697600 : Rat) / 158397) [(3, 1), (5, 1), (12, 1), (14, 1), (15, 2)],
  term ((-6348800 : Rat) / 158397) [(3, 1), (5, 1), (12, 1), (14, 2), (15, 2)],
  term ((-6348800 : Rat) / 158397) [(3, 1), (5, 1), (12, 1), (15, 4)],
  term ((6348800 : Rat) / 158397) [(3, 3), (5, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 901 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0901_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0901
        rs_R005_ueqv_R005NYN_generator_05_0900_0999 =
      rs_R005_ueqv_R005NYN_partial_05_0901 := by
  native_decide

/-- Coefficient term 902 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0902 : Poly :=
[
  term ((-22237760 : Rat) / 385571) [(3, 1), (5, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 902 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0902 : Poly :=
[
  term ((44475520 : Rat) / 385571) [(2, 1), (3, 1), (5, 1), (12, 1), (15, 2), (16, 1)],
  term ((-22237760 : Rat) / 385571) [(2, 2), (3, 1), (5, 1), (12, 1), (15, 2), (16, 1)],
  term ((-44475520 : Rat) / 385571) [(3, 1), (5, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((22237760 : Rat) / 385571) [(3, 1), (5, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((22237760 : Rat) / 385571) [(3, 1), (5, 1), (12, 1), (15, 4), (16, 1)],
  term ((-22237760 : Rat) / 385571) [(3, 3), (5, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 902 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0902_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0902
        rs_R005_ueqv_R005NYN_generator_05_0900_0999 =
      rs_R005_ueqv_R005NYN_partial_05_0902 := by
  native_decide

/-- Coefficient term 903 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0903 : Poly :=
[
  term ((-877600 : Rat) / 52799) [(3, 1), (5, 1), (15, 2)]
]

/-- Partial product 903 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0903 : Poly :=
[
  term ((1755200 : Rat) / 52799) [(2, 1), (3, 1), (5, 1), (15, 2)],
  term ((-877600 : Rat) / 52799) [(2, 2), (3, 1), (5, 1), (15, 2)],
  term ((-1755200 : Rat) / 52799) [(3, 1), (5, 1), (14, 1), (15, 2)],
  term ((877600 : Rat) / 52799) [(3, 1), (5, 1), (14, 2), (15, 2)],
  term ((877600 : Rat) / 52799) [(3, 1), (5, 1), (15, 4)],
  term ((-877600 : Rat) / 52799) [(3, 3), (5, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 903 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0903_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0903
        rs_R005_ueqv_R005NYN_generator_05_0900_0999 =
      rs_R005_ueqv_R005NYN_partial_05_0903 := by
  native_decide

/-- Coefficient term 904 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0904 : Poly :=
[
  term ((-13749564 : Rat) / 385571) [(3, 1), (5, 1), (15, 2), (16, 1)]
]

/-- Partial product 904 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0904 : Poly :=
[
  term ((27499128 : Rat) / 385571) [(2, 1), (3, 1), (5, 1), (15, 2), (16, 1)],
  term ((-13749564 : Rat) / 385571) [(2, 2), (3, 1), (5, 1), (15, 2), (16, 1)],
  term ((-27499128 : Rat) / 385571) [(3, 1), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((13749564 : Rat) / 385571) [(3, 1), (5, 1), (14, 2), (15, 2), (16, 1)],
  term ((13749564 : Rat) / 385571) [(3, 1), (5, 1), (15, 4), (16, 1)],
  term ((-13749564 : Rat) / 385571) [(3, 3), (5, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 904 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0904_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0904
        rs_R005_ueqv_R005NYN_generator_05_0900_0999 =
      rs_R005_ueqv_R005NYN_partial_05_0904 := by
  native_decide

/-- Coefficient term 905 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0905 : Poly :=
[
  term ((-6348800 : Rat) / 158397) [(3, 1), (6, 1), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 905 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0905 : Poly :=
[
  term ((12697600 : Rat) / 158397) [(2, 1), (3, 1), (6, 1), (8, 1), (12, 1), (15, 1)],
  term ((-6348800 : Rat) / 158397) [(2, 2), (3, 1), (6, 1), (8, 1), (12, 1), (15, 1)],
  term ((-12697600 : Rat) / 158397) [(3, 1), (6, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((6348800 : Rat) / 158397) [(3, 1), (6, 1), (8, 1), (12, 1), (14, 2), (15, 1)],
  term ((6348800 : Rat) / 158397) [(3, 1), (6, 1), (8, 1), (12, 1), (15, 3)],
  term ((-6348800 : Rat) / 158397) [(3, 3), (6, 1), (8, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 905 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0905_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0905
        rs_R005_ueqv_R005NYN_generator_05_0900_0999 =
      rs_R005_ueqv_R005NYN_partial_05_0905 := by
  native_decide

/-- Coefficient term 906 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0906 : Poly :=
[
  term ((22237760 : Rat) / 385571) [(3, 1), (6, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 906 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0906 : Poly :=
[
  term ((-44475520 : Rat) / 385571) [(2, 1), (3, 1), (6, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((22237760 : Rat) / 385571) [(2, 2), (3, 1), (6, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((44475520 : Rat) / 385571) [(3, 1), (6, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-22237760 : Rat) / 385571) [(3, 1), (6, 1), (8, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-22237760 : Rat) / 385571) [(3, 1), (6, 1), (8, 1), (12, 1), (15, 3), (16, 1)],
  term ((22237760 : Rat) / 385571) [(3, 3), (6, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 906 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0906_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0906
        rs_R005_ueqv_R005NYN_generator_05_0900_0999 =
      rs_R005_ueqv_R005NYN_partial_05_0906 := by
  native_decide

/-- Coefficient term 907 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0907 : Poly :=
[
  term ((6348800 : Rat) / 158397) [(3, 1), (6, 1), (8, 1), (12, 2), (15, 1)]
]

/-- Partial product 907 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0907 : Poly :=
[
  term ((-12697600 : Rat) / 158397) [(2, 1), (3, 1), (6, 1), (8, 1), (12, 2), (15, 1)],
  term ((6348800 : Rat) / 158397) [(2, 2), (3, 1), (6, 1), (8, 1), (12, 2), (15, 1)],
  term ((12697600 : Rat) / 158397) [(3, 1), (6, 1), (8, 1), (12, 2), (14, 1), (15, 1)],
  term ((-6348800 : Rat) / 158397) [(3, 1), (6, 1), (8, 1), (12, 2), (14, 2), (15, 1)],
  term ((-6348800 : Rat) / 158397) [(3, 1), (6, 1), (8, 1), (12, 2), (15, 3)],
  term ((6348800 : Rat) / 158397) [(3, 3), (6, 1), (8, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 907 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0907_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0907
        rs_R005_ueqv_R005NYN_generator_05_0900_0999 =
      rs_R005_ueqv_R005NYN_partial_05_0907 := by
  native_decide

/-- Coefficient term 908 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0908 : Poly :=
[
  term ((-22237760 : Rat) / 385571) [(3, 1), (6, 1), (8, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 908 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0908 : Poly :=
[
  term ((44475520 : Rat) / 385571) [(2, 1), (3, 1), (6, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-22237760 : Rat) / 385571) [(2, 2), (3, 1), (6, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-44475520 : Rat) / 385571) [(3, 1), (6, 1), (8, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((22237760 : Rat) / 385571) [(3, 1), (6, 1), (8, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((22237760 : Rat) / 385571) [(3, 1), (6, 1), (8, 1), (12, 2), (15, 3), (16, 1)],
  term ((-22237760 : Rat) / 385571) [(3, 3), (6, 1), (8, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 908 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0908_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0908
        rs_R005_ueqv_R005NYN_generator_05_0900_0999 =
      rs_R005_ueqv_R005NYN_partial_05_0908 := by
  native_decide

/-- Coefficient term 909 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0909 : Poly :=
[
  term ((11018240 : Rat) / 158397) [(3, 1), (6, 1), (12, 1), (15, 1)]
]

/-- Partial product 909 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0909 : Poly :=
[
  term ((-22036480 : Rat) / 158397) [(2, 1), (3, 1), (6, 1), (12, 1), (15, 1)],
  term ((11018240 : Rat) / 158397) [(2, 2), (3, 1), (6, 1), (12, 1), (15, 1)],
  term ((22036480 : Rat) / 158397) [(3, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((-11018240 : Rat) / 158397) [(3, 1), (6, 1), (12, 1), (14, 2), (15, 1)],
  term ((-11018240 : Rat) / 158397) [(3, 1), (6, 1), (12, 1), (15, 3)],
  term ((11018240 : Rat) / 158397) [(3, 3), (6, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 909 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0909_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0909
        rs_R005_ueqv_R005NYN_generator_05_0900_0999 =
      rs_R005_ueqv_R005NYN_partial_05_0909 := by
  native_decide

/-- Coefficient term 910 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0910 : Poly :=
[
  term ((-26820800 : Rat) / 385571) [(3, 1), (6, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 910 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0910 : Poly :=
[
  term ((53641600 : Rat) / 385571) [(2, 1), (3, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-26820800 : Rat) / 385571) [(2, 2), (3, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-53641600 : Rat) / 385571) [(3, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((26820800 : Rat) / 385571) [(3, 1), (6, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((26820800 : Rat) / 385571) [(3, 1), (6, 1), (12, 1), (15, 3), (16, 1)],
  term ((-26820800 : Rat) / 385571) [(3, 3), (6, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 910 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0910_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0910
        rs_R005_ueqv_R005NYN_generator_05_0900_0999 =
      rs_R005_ueqv_R005NYN_partial_05_0910 := by
  native_decide

/-- Coefficient term 911 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0911 : Poly :=
[
  term ((-6348800 : Rat) / 158397) [(3, 1), (6, 1), (12, 2), (15, 1)]
]

/-- Partial product 911 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0911 : Poly :=
[
  term ((12697600 : Rat) / 158397) [(2, 1), (3, 1), (6, 1), (12, 2), (15, 1)],
  term ((-6348800 : Rat) / 158397) [(2, 2), (3, 1), (6, 1), (12, 2), (15, 1)],
  term ((-12697600 : Rat) / 158397) [(3, 1), (6, 1), (12, 2), (14, 1), (15, 1)],
  term ((6348800 : Rat) / 158397) [(3, 1), (6, 1), (12, 2), (14, 2), (15, 1)],
  term ((6348800 : Rat) / 158397) [(3, 1), (6, 1), (12, 2), (15, 3)],
  term ((-6348800 : Rat) / 158397) [(3, 3), (6, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 911 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0911_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0911
        rs_R005_ueqv_R005NYN_generator_05_0900_0999 =
      rs_R005_ueqv_R005NYN_partial_05_0911 := by
  native_decide

/-- Coefficient term 912 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0912 : Poly :=
[
  term ((22237760 : Rat) / 385571) [(3, 1), (6, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 912 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0912 : Poly :=
[
  term ((-44475520 : Rat) / 385571) [(2, 1), (3, 1), (6, 1), (12, 2), (15, 1), (16, 1)],
  term ((22237760 : Rat) / 385571) [(2, 2), (3, 1), (6, 1), (12, 2), (15, 1), (16, 1)],
  term ((44475520 : Rat) / 385571) [(3, 1), (6, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-22237760 : Rat) / 385571) [(3, 1), (6, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((-22237760 : Rat) / 385571) [(3, 1), (6, 1), (12, 2), (15, 3), (16, 1)],
  term ((22237760 : Rat) / 385571) [(3, 3), (6, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 912 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0912_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0912
        rs_R005_ueqv_R005NYN_generator_05_0900_0999 =
      rs_R005_ueqv_R005NYN_partial_05_0912 := by
  native_decide

/-- Coefficient term 913 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0913 : Poly :=
[
  term ((-1556480 : Rat) / 52799) [(3, 1), (6, 1), (15, 1)]
]

/-- Partial product 913 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0913 : Poly :=
[
  term ((3112960 : Rat) / 52799) [(2, 1), (3, 1), (6, 1), (15, 1)],
  term ((-1556480 : Rat) / 52799) [(2, 2), (3, 1), (6, 1), (15, 1)],
  term ((-3112960 : Rat) / 52799) [(3, 1), (6, 1), (14, 1), (15, 1)],
  term ((1556480 : Rat) / 52799) [(3, 1), (6, 1), (14, 2), (15, 1)],
  term ((1556480 : Rat) / 52799) [(3, 1), (6, 1), (15, 3)],
  term ((-1556480 : Rat) / 52799) [(3, 3), (6, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 913 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0913_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0913
        rs_R005_ueqv_R005NYN_generator_05_0900_0999 =
      rs_R005_ueqv_R005NYN_partial_05_0913 := by
  native_decide

/-- Coefficient term 914 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0914 : Poly :=
[
  term ((4583040 : Rat) / 385571) [(3, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 914 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0914 : Poly :=
[
  term ((-9166080 : Rat) / 385571) [(2, 1), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((4583040 : Rat) / 385571) [(2, 2), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((9166080 : Rat) / 385571) [(3, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(3, 1), (6, 1), (14, 2), (15, 1), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(3, 1), (6, 1), (15, 3), (16, 1)],
  term ((4583040 : Rat) / 385571) [(3, 3), (6, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 914 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0914_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0914
        rs_R005_ueqv_R005NYN_generator_05_0900_0999 =
      rs_R005_ueqv_R005NYN_partial_05_0914 := by
  native_decide

/-- Coefficient term 915 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0915 : Poly :=
[
  term ((6348800 : Rat) / 158397) [(3, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 915 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0915 : Poly :=
[
  term ((-12697600 : Rat) / 158397) [(2, 1), (3, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((6348800 : Rat) / 158397) [(2, 2), (3, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((12697600 : Rat) / 158397) [(3, 1), (7, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-6348800 : Rat) / 158397) [(3, 1), (7, 1), (8, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-6348800 : Rat) / 158397) [(3, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 3)],
  term ((6348800 : Rat) / 158397) [(3, 3), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 915 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0915_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0915
        rs_R005_ueqv_R005NYN_generator_05_0900_0999 =
      rs_R005_ueqv_R005NYN_partial_05_0915 := by
  native_decide

/-- Coefficient term 916 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0916 : Poly :=
[
  term ((-22237760 : Rat) / 385571) [(3, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 916 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0916 : Poly :=
[
  term ((44475520 : Rat) / 385571) [(2, 1), (3, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-22237760 : Rat) / 385571) [(2, 2), (3, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-44475520 : Rat) / 385571) [(3, 1), (7, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((22237760 : Rat) / 385571) [(3, 1), (7, 1), (8, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((22237760 : Rat) / 385571) [(3, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-22237760 : Rat) / 385571) [(3, 3), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 916 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0916_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0916
        rs_R005_ueqv_R005NYN_generator_05_0900_0999 =
      rs_R005_ueqv_R005NYN_partial_05_0916 := by
  native_decide

/-- Coefficient term 917 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0917 : Poly :=
[
  term ((-6348800 : Rat) / 158397) [(3, 1), (7, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 917 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0917 : Poly :=
[
  term ((12697600 : Rat) / 158397) [(2, 1), (3, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((-6348800 : Rat) / 158397) [(2, 2), (3, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((-12697600 : Rat) / 158397) [(3, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((6348800 : Rat) / 158397) [(3, 1), (7, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((6348800 : Rat) / 158397) [(3, 1), (7, 1), (12, 1), (13, 1), (15, 3)],
  term ((-6348800 : Rat) / 158397) [(3, 3), (7, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 917 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0917_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0917
        rs_R005_ueqv_R005NYN_generator_05_0900_0999 =
      rs_R005_ueqv_R005NYN_partial_05_0917 := by
  native_decide

/-- Coefficient term 918 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0918 : Poly :=
[
  term ((22237760 : Rat) / 385571) [(3, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 918 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0918 : Poly :=
[
  term ((-44475520 : Rat) / 385571) [(2, 1), (3, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((22237760 : Rat) / 385571) [(2, 2), (3, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((44475520 : Rat) / 385571) [(3, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-22237760 : Rat) / 385571) [(3, 1), (7, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-22237760 : Rat) / 385571) [(3, 1), (7, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((22237760 : Rat) / 385571) [(3, 3), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 918 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0918_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0918
        rs_R005_ueqv_R005NYN_generator_05_0900_0999 =
      rs_R005_ueqv_R005NYN_partial_05_0918 := by
  native_decide

/-- Coefficient term 919 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0919 : Poly :=
[
  term ((1556480 : Rat) / 52799) [(3, 1), (7, 1), (13, 1), (15, 1)]
]

/-- Partial product 919 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0919 : Poly :=
[
  term ((-3112960 : Rat) / 52799) [(2, 1), (3, 1), (7, 1), (13, 1), (15, 1)],
  term ((1556480 : Rat) / 52799) [(2, 2), (3, 1), (7, 1), (13, 1), (15, 1)],
  term ((3112960 : Rat) / 52799) [(3, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1556480 : Rat) / 52799) [(3, 1), (7, 1), (13, 1), (14, 2), (15, 1)],
  term ((-1556480 : Rat) / 52799) [(3, 1), (7, 1), (13, 1), (15, 3)],
  term ((1556480 : Rat) / 52799) [(3, 3), (7, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 919 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0919_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0919
        rs_R005_ueqv_R005NYN_generator_05_0900_0999 =
      rs_R005_ueqv_R005NYN_partial_05_0919 := by
  native_decide

/-- Coefficient term 920 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0920 : Poly :=
[
  term ((-4583040 : Rat) / 385571) [(3, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 920 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0920 : Poly :=
[
  term ((9166080 : Rat) / 385571) [(2, 1), (3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(2, 2), (3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-9166080 : Rat) / 385571) [(3, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((4583040 : Rat) / 385571) [(3, 1), (7, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((4583040 : Rat) / 385571) [(3, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(3, 3), (7, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 920 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0920_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0920
        rs_R005_ueqv_R005NYN_generator_05_0900_0999 =
      rs_R005_ueqv_R005NYN_partial_05_0920 := by
  native_decide

/-- Coefficient term 921 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0921 : Poly :=
[
  term ((3174400 : Rat) / 158397) [(3, 1), (8, 1), (10, 1), (14, 1), (15, 1)]
]

/-- Partial product 921 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0921 : Poly :=
[
  term ((-6348800 : Rat) / 158397) [(2, 1), (3, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((3174400 : Rat) / 158397) [(2, 2), (3, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((-3174400 : Rat) / 158397) [(3, 1), (8, 1), (10, 1), (14, 1), (15, 3)],
  term ((6348800 : Rat) / 158397) [(3, 1), (8, 1), (10, 1), (14, 2), (15, 1)],
  term ((-3174400 : Rat) / 158397) [(3, 1), (8, 1), (10, 1), (14, 3), (15, 1)],
  term ((3174400 : Rat) / 158397) [(3, 3), (8, 1), (10, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 921 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0921_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0921
        rs_R005_ueqv_R005NYN_generator_05_0900_0999 =
      rs_R005_ueqv_R005NYN_partial_05_0921 := by
  native_decide

/-- Coefficient term 922 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0922 : Poly :=
[
  term ((-11118880 : Rat) / 385571) [(3, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 922 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0922 : Poly :=
[
  term ((22237760 : Rat) / 385571) [(2, 1), (3, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11118880 : Rat) / 385571) [(2, 2), (3, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((11118880 : Rat) / 385571) [(3, 1), (8, 1), (10, 1), (14, 1), (15, 3), (16, 1)],
  term ((-22237760 : Rat) / 385571) [(3, 1), (8, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((11118880 : Rat) / 385571) [(3, 1), (8, 1), (10, 1), (14, 3), (15, 1), (16, 1)],
  term ((-11118880 : Rat) / 385571) [(3, 3), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 922 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0922_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0922
        rs_R005_ueqv_R005NYN_generator_05_0900_0999 =
      rs_R005_ueqv_R005NYN_partial_05_0922 := by
  native_decide

/-- Coefficient term 923 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0923 : Poly :=
[
  term ((686080 : Rat) / 158397) [(3, 1), (8, 1), (10, 1), (15, 1)]
]

/-- Partial product 923 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0923 : Poly :=
[
  term ((-1372160 : Rat) / 158397) [(2, 1), (3, 1), (8, 1), (10, 1), (15, 1)],
  term ((686080 : Rat) / 158397) [(2, 2), (3, 1), (8, 1), (10, 1), (15, 1)],
  term ((1372160 : Rat) / 158397) [(3, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((-686080 : Rat) / 158397) [(3, 1), (8, 1), (10, 1), (14, 2), (15, 1)],
  term ((-686080 : Rat) / 158397) [(3, 1), (8, 1), (10, 1), (15, 3)],
  term ((686080 : Rat) / 158397) [(3, 3), (8, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 923 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0923_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0923
        rs_R005_ueqv_R005NYN_generator_05_0900_0999 =
      rs_R005_ueqv_R005NYN_partial_05_0923 := by
  native_decide

/-- Coefficient term 924 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0924 : Poly :=
[
  term ((11331440 : Rat) / 385571) [(3, 1), (8, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 924 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0924 : Poly :=
[
  term ((-22662880 : Rat) / 385571) [(2, 1), (3, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((11331440 : Rat) / 385571) [(2, 2), (3, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((22662880 : Rat) / 385571) [(3, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11331440 : Rat) / 385571) [(3, 1), (8, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-11331440 : Rat) / 385571) [(3, 1), (8, 1), (10, 1), (15, 3), (16, 1)],
  term ((11331440 : Rat) / 385571) [(3, 3), (8, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 924 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0924_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0924
        rs_R005_ueqv_R005NYN_generator_05_0900_0999 =
      rs_R005_ueqv_R005NYN_partial_05_0924 := by
  native_decide

/-- Coefficient term 925 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0925 : Poly :=
[
  term ((5079040 : Rat) / 158397) [(3, 1), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 925 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0925 : Poly :=
[
  term ((-10158080 : Rat) / 158397) [(2, 1), (3, 1), (8, 1), (12, 1), (15, 1)],
  term ((5079040 : Rat) / 158397) [(2, 2), (3, 1), (8, 1), (12, 1), (15, 1)],
  term ((10158080 : Rat) / 158397) [(3, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-5079040 : Rat) / 158397) [(3, 1), (8, 1), (12, 1), (14, 2), (15, 1)],
  term ((-5079040 : Rat) / 158397) [(3, 1), (8, 1), (12, 1), (15, 3)],
  term ((5079040 : Rat) / 158397) [(3, 3), (8, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 925 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0925_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0925
        rs_R005_ueqv_R005NYN_generator_05_0900_0999 =
      rs_R005_ueqv_R005NYN_partial_05_0925 := by
  native_decide

/-- Coefficient term 926 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0926 : Poly :=
[
  term ((-17790208 : Rat) / 385571) [(3, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 926 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0926 : Poly :=
[
  term ((35580416 : Rat) / 385571) [(2, 1), (3, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-17790208 : Rat) / 385571) [(2, 2), (3, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-35580416 : Rat) / 385571) [(3, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((17790208 : Rat) / 385571) [(3, 1), (8, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((17790208 : Rat) / 385571) [(3, 1), (8, 1), (12, 1), (15, 3), (16, 1)],
  term ((-17790208 : Rat) / 385571) [(3, 3), (8, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 926 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0926_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0926
        rs_R005_ueqv_R005NYN_generator_05_0900_0999 =
      rs_R005_ueqv_R005NYN_partial_05_0926 := by
  native_decide

/-- Coefficient term 927 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0927 : Poly :=
[
  term ((-6348800 : Rat) / 158397) [(3, 1), (8, 1), (12, 2), (15, 1)]
]

/-- Partial product 927 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0927 : Poly :=
[
  term ((12697600 : Rat) / 158397) [(2, 1), (3, 1), (8, 1), (12, 2), (15, 1)],
  term ((-6348800 : Rat) / 158397) [(2, 2), (3, 1), (8, 1), (12, 2), (15, 1)],
  term ((-12697600 : Rat) / 158397) [(3, 1), (8, 1), (12, 2), (14, 1), (15, 1)],
  term ((6348800 : Rat) / 158397) [(3, 1), (8, 1), (12, 2), (14, 2), (15, 1)],
  term ((6348800 : Rat) / 158397) [(3, 1), (8, 1), (12, 2), (15, 3)],
  term ((-6348800 : Rat) / 158397) [(3, 3), (8, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 927 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0927_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0927
        rs_R005_ueqv_R005NYN_generator_05_0900_0999 =
      rs_R005_ueqv_R005NYN_partial_05_0927 := by
  native_decide

/-- Coefficient term 928 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0928 : Poly :=
[
  term ((22237760 : Rat) / 385571) [(3, 1), (8, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 928 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0928 : Poly :=
[
  term ((-44475520 : Rat) / 385571) [(2, 1), (3, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((22237760 : Rat) / 385571) [(2, 2), (3, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((44475520 : Rat) / 385571) [(3, 1), (8, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-22237760 : Rat) / 385571) [(3, 1), (8, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((-22237760 : Rat) / 385571) [(3, 1), (8, 1), (12, 2), (15, 3), (16, 1)],
  term ((22237760 : Rat) / 385571) [(3, 3), (8, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 928 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0928_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0928
        rs_R005_ueqv_R005NYN_generator_05_0900_0999 =
      rs_R005_ueqv_R005NYN_partial_05_0928 := by
  native_decide

/-- Coefficient term 929 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0929 : Poly :=
[
  term ((-2222080 : Rat) / 158397) [(3, 1), (8, 1), (14, 1), (15, 1)]
]

/-- Partial product 929 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0929 : Poly :=
[
  term ((4444160 : Rat) / 158397) [(2, 1), (3, 1), (8, 1), (14, 1), (15, 1)],
  term ((-2222080 : Rat) / 158397) [(2, 2), (3, 1), (8, 1), (14, 1), (15, 1)],
  term ((2222080 : Rat) / 158397) [(3, 1), (8, 1), (14, 1), (15, 3)],
  term ((-4444160 : Rat) / 158397) [(3, 1), (8, 1), (14, 2), (15, 1)],
  term ((2222080 : Rat) / 158397) [(3, 1), (8, 1), (14, 3), (15, 1)],
  term ((-2222080 : Rat) / 158397) [(3, 3), (8, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 929 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0929_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0929
        rs_R005_ueqv_R005NYN_generator_05_0900_0999 =
      rs_R005_ueqv_R005NYN_partial_05_0929 := by
  native_decide

/-- Coefficient term 930 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0930 : Poly :=
[
  term ((180160 : Rat) / 385571) [(3, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 930 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0930 : Poly :=
[
  term ((-360320 : Rat) / 385571) [(2, 1), (3, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((180160 : Rat) / 385571) [(2, 2), (3, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-180160 : Rat) / 385571) [(3, 1), (8, 1), (14, 1), (15, 3), (16, 1)],
  term ((360320 : Rat) / 385571) [(3, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((-180160 : Rat) / 385571) [(3, 1), (8, 1), (14, 3), (15, 1), (16, 1)],
  term ((180160 : Rat) / 385571) [(3, 3), (8, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 930 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0930_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0930
        rs_R005_ueqv_R005NYN_generator_05_0900_0999 =
      rs_R005_ueqv_R005NYN_partial_05_0930 := by
  native_decide

/-- Coefficient term 931 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0931 : Poly :=
[
  term ((-158720 : Rat) / 52799) [(3, 1), (8, 1), (15, 1)]
]

/-- Partial product 931 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0931 : Poly :=
[
  term ((317440 : Rat) / 52799) [(2, 1), (3, 1), (8, 1), (15, 1)],
  term ((-158720 : Rat) / 52799) [(2, 2), (3, 1), (8, 1), (15, 1)],
  term ((-317440 : Rat) / 52799) [(3, 1), (8, 1), (14, 1), (15, 1)],
  term ((158720 : Rat) / 52799) [(3, 1), (8, 1), (14, 2), (15, 1)],
  term ((158720 : Rat) / 52799) [(3, 1), (8, 1), (15, 3)],
  term ((-158720 : Rat) / 52799) [(3, 3), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 931 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0931_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0931
        rs_R005_ueqv_R005NYN_generator_05_0900_0999 =
      rs_R005_ueqv_R005NYN_partial_05_0931 := by
  native_decide

/-- Coefficient term 932 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0932 : Poly :=
[
  term ((-2133696 : Rat) / 385571) [(3, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 932 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0932 : Poly :=
[
  term ((4267392 : Rat) / 385571) [(2, 1), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((-2133696 : Rat) / 385571) [(2, 2), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((-4267392 : Rat) / 385571) [(3, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((2133696 : Rat) / 385571) [(3, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((2133696 : Rat) / 385571) [(3, 1), (8, 1), (15, 3), (16, 1)],
  term ((-2133696 : Rat) / 385571) [(3, 3), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 932 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0932_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0932
        rs_R005_ueqv_R005NYN_generator_05_0900_0999 =
      rs_R005_ueqv_R005NYN_partial_05_0932 := by
  native_decide

/-- Coefficient term 933 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0933 : Poly :=
[
  term ((-3174400 : Rat) / 158397) [(3, 1), (10, 1), (14, 1), (15, 1)]
]

/-- Partial product 933 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0933 : Poly :=
[
  term ((6348800 : Rat) / 158397) [(2, 1), (3, 1), (10, 1), (14, 1), (15, 1)],
  term ((-3174400 : Rat) / 158397) [(2, 2), (3, 1), (10, 1), (14, 1), (15, 1)],
  term ((3174400 : Rat) / 158397) [(3, 1), (10, 1), (14, 1), (15, 3)],
  term ((-6348800 : Rat) / 158397) [(3, 1), (10, 1), (14, 2), (15, 1)],
  term ((3174400 : Rat) / 158397) [(3, 1), (10, 1), (14, 3), (15, 1)],
  term ((-3174400 : Rat) / 158397) [(3, 3), (10, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 933 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0933_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0933
        rs_R005_ueqv_R005NYN_generator_05_0900_0999 =
      rs_R005_ueqv_R005NYN_partial_05_0933 := by
  native_decide

/-- Coefficient term 934 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0934 : Poly :=
[
  term ((11118880 : Rat) / 385571) [(3, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 934 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0934 : Poly :=
[
  term ((-22237760 : Rat) / 385571) [(2, 1), (3, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((11118880 : Rat) / 385571) [(2, 2), (3, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11118880 : Rat) / 385571) [(3, 1), (10, 1), (14, 1), (15, 3), (16, 1)],
  term ((22237760 : Rat) / 385571) [(3, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-11118880 : Rat) / 385571) [(3, 1), (10, 1), (14, 3), (15, 1), (16, 1)],
  term ((11118880 : Rat) / 385571) [(3, 3), (10, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 934 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0934_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0934
        rs_R005_ueqv_R005NYN_generator_05_0900_0999 =
      rs_R005_ueqv_R005NYN_partial_05_0934 := by
  native_decide

/-- Coefficient term 935 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0935 : Poly :=
[
  term ((-255040 : Rat) / 52799) [(3, 1), (10, 1), (15, 1)]
]

/-- Partial product 935 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0935 : Poly :=
[
  term ((510080 : Rat) / 52799) [(2, 1), (3, 1), (10, 1), (15, 1)],
  term ((-255040 : Rat) / 52799) [(2, 2), (3, 1), (10, 1), (15, 1)],
  term ((-510080 : Rat) / 52799) [(3, 1), (10, 1), (14, 1), (15, 1)],
  term ((255040 : Rat) / 52799) [(3, 1), (10, 1), (14, 2), (15, 1)],
  term ((255040 : Rat) / 52799) [(3, 1), (10, 1), (15, 3)],
  term ((-255040 : Rat) / 52799) [(3, 3), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 935 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0935_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0935
        rs_R005_ueqv_R005NYN_generator_05_0900_0999 =
      rs_R005_ueqv_R005NYN_partial_05_0935 := by
  native_decide

/-- Coefficient term 936 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0936 : Poly :=
[
  term ((-3571608 : Rat) / 385571) [(3, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 936 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0936 : Poly :=
[
  term ((7143216 : Rat) / 385571) [(2, 1), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-3571608 : Rat) / 385571) [(2, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-7143216 : Rat) / 385571) [(3, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((3571608 : Rat) / 385571) [(3, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((3571608 : Rat) / 385571) [(3, 1), (10, 1), (15, 3), (16, 1)],
  term ((-3571608 : Rat) / 385571) [(3, 3), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 936 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0936_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0936
        rs_R005_ueqv_R005NYN_generator_05_0900_0999 =
      rs_R005_ueqv_R005NYN_partial_05_0936 := by
  native_decide

/-- Coefficient term 937 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0937 : Poly :=
[
  term ((-1556480 : Rat) / 158397) [(3, 1), (10, 2), (15, 1)]
]

/-- Partial product 937 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0937 : Poly :=
[
  term ((3112960 : Rat) / 158397) [(2, 1), (3, 1), (10, 2), (15, 1)],
  term ((-1556480 : Rat) / 158397) [(2, 2), (3, 1), (10, 2), (15, 1)],
  term ((-3112960 : Rat) / 158397) [(3, 1), (10, 2), (14, 1), (15, 1)],
  term ((1556480 : Rat) / 158397) [(3, 1), (10, 2), (14, 2), (15, 1)],
  term ((1556480 : Rat) / 158397) [(3, 1), (10, 2), (15, 3)],
  term ((-1556480 : Rat) / 158397) [(3, 3), (10, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 937 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0937_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0937
        rs_R005_ueqv_R005NYN_generator_05_0900_0999 =
      rs_R005_ueqv_R005NYN_partial_05_0937 := by
  native_decide

/-- Coefficient term 938 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0938 : Poly :=
[
  term ((1527680 : Rat) / 385571) [(3, 1), (10, 2), (15, 1), (16, 1)]
]

/-- Partial product 938 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0938 : Poly :=
[
  term ((-3055360 : Rat) / 385571) [(2, 1), (3, 1), (10, 2), (15, 1), (16, 1)],
  term ((1527680 : Rat) / 385571) [(2, 2), (3, 1), (10, 2), (15, 1), (16, 1)],
  term ((3055360 : Rat) / 385571) [(3, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1527680 : Rat) / 385571) [(3, 1), (10, 2), (14, 2), (15, 1), (16, 1)],
  term ((-1527680 : Rat) / 385571) [(3, 1), (10, 2), (15, 3), (16, 1)],
  term ((1527680 : Rat) / 385571) [(3, 3), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 938 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0938_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0938
        rs_R005_ueqv_R005NYN_generator_05_0900_0999 =
      rs_R005_ueqv_R005NYN_partial_05_0938 := by
  native_decide

/-- Coefficient term 939 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0939 : Poly :=
[
  term ((-2252800 : Rat) / 52799) [(3, 1), (12, 1), (15, 1)]
]

/-- Partial product 939 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0939 : Poly :=
[
  term ((4505600 : Rat) / 52799) [(2, 1), (3, 1), (12, 1), (15, 1)],
  term ((-2252800 : Rat) / 52799) [(2, 2), (3, 1), (12, 1), (15, 1)],
  term ((-4505600 : Rat) / 52799) [(3, 1), (12, 1), (14, 1), (15, 1)],
  term ((2252800 : Rat) / 52799) [(3, 1), (12, 1), (14, 2), (15, 1)],
  term ((2252800 : Rat) / 52799) [(3, 1), (12, 1), (15, 3)],
  term ((-2252800 : Rat) / 52799) [(3, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 939 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0939_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0939
        rs_R005_ueqv_R005NYN_generator_05_0900_0999 =
      rs_R005_ueqv_R005NYN_partial_05_0939 := by
  native_decide

/-- Coefficient term 940 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0940 : Poly :=
[
  term ((35444928 : Rat) / 385571) [(3, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 940 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0940 : Poly :=
[
  term ((-70889856 : Rat) / 385571) [(2, 1), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((35444928 : Rat) / 385571) [(2, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((70889856 : Rat) / 385571) [(3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-35444928 : Rat) / 385571) [(3, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-35444928 : Rat) / 385571) [(3, 1), (12, 1), (15, 3), (16, 1)],
  term ((35444928 : Rat) / 385571) [(3, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 940 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0940_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0940
        rs_R005_ueqv_R005NYN_generator_05_0900_0999 =
      rs_R005_ueqv_R005NYN_partial_05_0940 := by
  native_decide

/-- Coefficient term 941 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0941 : Poly :=
[
  term ((6348800 : Rat) / 158397) [(3, 1), (12, 2), (15, 1)]
]

/-- Partial product 941 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0941 : Poly :=
[
  term ((-12697600 : Rat) / 158397) [(2, 1), (3, 1), (12, 2), (15, 1)],
  term ((6348800 : Rat) / 158397) [(2, 2), (3, 1), (12, 2), (15, 1)],
  term ((12697600 : Rat) / 158397) [(3, 1), (12, 2), (14, 1), (15, 1)],
  term ((-6348800 : Rat) / 158397) [(3, 1), (12, 2), (14, 2), (15, 1)],
  term ((-6348800 : Rat) / 158397) [(3, 1), (12, 2), (15, 3)],
  term ((6348800 : Rat) / 158397) [(3, 3), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 941 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0941_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0941
        rs_R005_ueqv_R005NYN_generator_05_0900_0999 =
      rs_R005_ueqv_R005NYN_partial_05_0941 := by
  native_decide

/-- Coefficient term 942 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0942 : Poly :=
[
  term ((-22237760 : Rat) / 385571) [(3, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 942 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0942 : Poly :=
[
  term ((44475520 : Rat) / 385571) [(2, 1), (3, 1), (12, 2), (15, 1), (16, 1)],
  term ((-22237760 : Rat) / 385571) [(2, 2), (3, 1), (12, 2), (15, 1), (16, 1)],
  term ((-44475520 : Rat) / 385571) [(3, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((22237760 : Rat) / 385571) [(3, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((22237760 : Rat) / 385571) [(3, 1), (12, 2), (15, 3), (16, 1)],
  term ((-22237760 : Rat) / 385571) [(3, 3), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 942 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0942_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0942
        rs_R005_ueqv_R005NYN_generator_05_0900_0999 =
      rs_R005_ueqv_R005NYN_partial_05_0942 := by
  native_decide

/-- Coefficient term 943 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0943 : Poly :=
[
  term ((-1357760 : Rat) / 52799) [(3, 1), (13, 1), (15, 2)]
]

/-- Partial product 943 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0943 : Poly :=
[
  term ((2715520 : Rat) / 52799) [(2, 1), (3, 1), (13, 1), (15, 2)],
  term ((-1357760 : Rat) / 52799) [(2, 2), (3, 1), (13, 1), (15, 2)],
  term ((-2715520 : Rat) / 52799) [(3, 1), (13, 1), (14, 1), (15, 2)],
  term ((1357760 : Rat) / 52799) [(3, 1), (13, 1), (14, 2), (15, 2)],
  term ((1357760 : Rat) / 52799) [(3, 1), (13, 1), (15, 4)],
  term ((-1357760 : Rat) / 52799) [(3, 3), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 943 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0943_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0943
        rs_R005_ueqv_R005NYN_generator_05_0900_0999 =
      rs_R005_ueqv_R005NYN_partial_05_0943 := by
  native_decide

/-- Coefficient term 944 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0944 : Poly :=
[
  term ((36665208 : Rat) / 385571) [(3, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 944 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0944 : Poly :=
[
  term ((-73330416 : Rat) / 385571) [(2, 1), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((36665208 : Rat) / 385571) [(2, 2), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((73330416 : Rat) / 385571) [(3, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-36665208 : Rat) / 385571) [(3, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-36665208 : Rat) / 385571) [(3, 1), (13, 1), (15, 4), (16, 1)],
  term ((36665208 : Rat) / 385571) [(3, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 944 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0944_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0944
        rs_R005_ueqv_R005NYN_generator_05_0900_0999 =
      rs_R005_ueqv_R005NYN_partial_05_0944 := by
  native_decide

/-- Coefficient term 945 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0945 : Poly :=
[
  term ((792160 : Rat) / 158397) [(3, 1), (14, 1), (15, 1)]
]

/-- Partial product 945 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0945 : Poly :=
[
  term ((-1584320 : Rat) / 158397) [(2, 1), (3, 1), (14, 1), (15, 1)],
  term ((792160 : Rat) / 158397) [(2, 2), (3, 1), (14, 1), (15, 1)],
  term ((-792160 : Rat) / 158397) [(3, 1), (14, 1), (15, 3)],
  term ((1584320 : Rat) / 158397) [(3, 1), (14, 2), (15, 1)],
  term ((-792160 : Rat) / 158397) [(3, 1), (14, 3), (15, 1)],
  term ((792160 : Rat) / 158397) [(3, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 945 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0945_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0945
        rs_R005_ueqv_R005NYN_generator_05_0900_0999 =
      rs_R005_ueqv_R005NYN_partial_05_0945 := by
  native_decide

/-- Coefficient term 946 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0946 : Poly :=
[
  term ((1883984 : Rat) / 385571) [(3, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 946 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0946 : Poly :=
[
  term ((-3767968 : Rat) / 385571) [(2, 1), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((1883984 : Rat) / 385571) [(2, 2), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1883984 : Rat) / 385571) [(3, 1), (14, 1), (15, 3), (16, 1)],
  term ((3767968 : Rat) / 385571) [(3, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1883984 : Rat) / 385571) [(3, 1), (14, 3), (15, 1), (16, 1)],
  term ((1883984 : Rat) / 385571) [(3, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 946 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0946_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0946
        rs_R005_ueqv_R005NYN_generator_05_0900_0999 =
      rs_R005_ueqv_R005NYN_partial_05_0946 := by
  native_decide

/-- Coefficient term 947 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0947 : Poly :=
[
  term ((14301452 : Rat) / 158397) [(3, 1), (15, 1)]
]

/-- Partial product 947 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0947 : Poly :=
[
  term ((-28602904 : Rat) / 158397) [(2, 1), (3, 1), (15, 1)],
  term ((14301452 : Rat) / 158397) [(2, 2), (3, 1), (15, 1)],
  term ((28602904 : Rat) / 158397) [(3, 1), (14, 1), (15, 1)],
  term ((-14301452 : Rat) / 158397) [(3, 1), (14, 2), (15, 1)],
  term ((-14301452 : Rat) / 158397) [(3, 1), (15, 3)],
  term ((14301452 : Rat) / 158397) [(3, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 947 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0947_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0947
        rs_R005_ueqv_R005NYN_generator_05_0900_0999 =
      rs_R005_ueqv_R005NYN_partial_05_0947 := by
  native_decide

/-- Coefficient term 948 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0948 : Poly :=
[
  term ((-7491220 : Rat) / 385571) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 948 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0948 : Poly :=
[
  term ((14982440 : Rat) / 385571) [(2, 1), (3, 1), (15, 1), (16, 1)],
  term ((-7491220 : Rat) / 385571) [(2, 2), (3, 1), (15, 1), (16, 1)],
  term ((-14982440 : Rat) / 385571) [(3, 1), (14, 1), (15, 1), (16, 1)],
  term ((7491220 : Rat) / 385571) [(3, 1), (14, 2), (15, 1), (16, 1)],
  term ((7491220 : Rat) / 385571) [(3, 1), (15, 3), (16, 1)],
  term ((-7491220 : Rat) / 385571) [(3, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 948 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0948_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0948
        rs_R005_ueqv_R005NYN_generator_05_0900_0999 =
      rs_R005_ueqv_R005NYN_partial_05_0948 := by
  native_decide

/-- Coefficient term 949 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0949 : Poly :=
[
  term ((-4718720 : Rat) / 52799) [(4, 1), (5, 1), (6, 1), (8, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 949 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0949 : Poly :=
[
  term ((9437440 : Rat) / 52799) [(2, 1), (4, 1), (5, 1), (6, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-4718720 : Rat) / 52799) [(2, 2), (4, 1), (5, 1), (6, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-4718720 : Rat) / 52799) [(3, 2), (4, 1), (5, 1), (6, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((4718720 : Rat) / 52799) [(4, 1), (5, 1), (6, 1), (8, 1), (12, 1), (14, 1), (15, 3)],
  term ((-9437440 : Rat) / 52799) [(4, 1), (5, 1), (6, 1), (8, 1), (12, 1), (14, 2), (15, 1)],
  term ((4718720 : Rat) / 52799) [(4, 1), (5, 1), (6, 1), (8, 1), (12, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 949 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0949_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0949
        rs_R005_ueqv_R005NYN_generator_05_0900_0999 =
      rs_R005_ueqv_R005NYN_partial_05_0949 := by
  native_decide

/-- Coefficient term 950 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0950 : Poly :=
[
  term ((65940144 : Rat) / 385571) [(4, 1), (5, 1), (6, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 950 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0950 : Poly :=
[
  term ((-131880288 : Rat) / 385571) [(2, 1), (4, 1), (5, 1), (6, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((65940144 : Rat) / 385571) [(2, 2), (4, 1), (5, 1), (6, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((65940144 : Rat) / 385571) [(3, 2), (4, 1), (5, 1), (6, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-65940144 : Rat) / 385571) [(4, 1), (5, 1), (6, 1), (8, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((131880288 : Rat) / 385571) [(4, 1), (5, 1), (6, 1), (8, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-65940144 : Rat) / 385571) [(4, 1), (5, 1), (6, 1), (8, 1), (12, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 950 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0950_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0950
        rs_R005_ueqv_R005NYN_generator_05_0900_0999 =
      rs_R005_ueqv_R005NYN_partial_05_0950 := by
  native_decide

/-- Coefficient term 951 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0951 : Poly :=
[
  term ((11960320 : Rat) / 52799) [(4, 1), (5, 1), (6, 1), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 951 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0951 : Poly :=
[
  term ((-23920640 : Rat) / 52799) [(2, 1), (4, 1), (5, 1), (6, 1), (8, 1), (12, 1), (15, 1)],
  term ((11960320 : Rat) / 52799) [(2, 2), (4, 1), (5, 1), (6, 1), (8, 1), (12, 1), (15, 1)],
  term ((11960320 : Rat) / 52799) [(3, 2), (4, 1), (5, 1), (6, 1), (8, 1), (12, 1), (15, 1)],
  term ((23920640 : Rat) / 52799) [(4, 1), (5, 1), (6, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-11960320 : Rat) / 52799) [(4, 1), (5, 1), (6, 1), (8, 1), (12, 1), (14, 2), (15, 1)],
  term ((-11960320 : Rat) / 52799) [(4, 1), (5, 1), (6, 1), (8, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 951 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0951_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0951
        rs_R005_ueqv_R005NYN_generator_05_0900_0999 =
      rs_R005_ueqv_R005NYN_partial_05_0951 := by
  native_decide

/-- Coefficient term 952 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0952 : Poly :=
[
  term ((-25613184 : Rat) / 385571) [(4, 1), (5, 1), (6, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 952 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0952 : Poly :=
[
  term ((51226368 : Rat) / 385571) [(2, 1), (4, 1), (5, 1), (6, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-25613184 : Rat) / 385571) [(2, 2), (4, 1), (5, 1), (6, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-25613184 : Rat) / 385571) [(3, 2), (4, 1), (5, 1), (6, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-51226368 : Rat) / 385571) [(4, 1), (5, 1), (6, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((25613184 : Rat) / 385571) [(4, 1), (5, 1), (6, 1), (8, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((25613184 : Rat) / 385571) [(4, 1), (5, 1), (6, 1), (8, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 952 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0952_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0952
        rs_R005_ueqv_R005NYN_generator_05_0900_0999 =
      rs_R005_ueqv_R005NYN_partial_05_0952 := by
  native_decide

/-- Coefficient term 953 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0953 : Poly :=
[
  term ((-11960320 : Rat) / 52799) [(4, 1), (5, 1), (6, 1), (8, 1), (12, 2), (15, 1)]
]

/-- Partial product 953 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0953 : Poly :=
[
  term ((23920640 : Rat) / 52799) [(2, 1), (4, 1), (5, 1), (6, 1), (8, 1), (12, 2), (15, 1)],
  term ((-11960320 : Rat) / 52799) [(2, 2), (4, 1), (5, 1), (6, 1), (8, 1), (12, 2), (15, 1)],
  term ((-11960320 : Rat) / 52799) [(3, 2), (4, 1), (5, 1), (6, 1), (8, 1), (12, 2), (15, 1)],
  term ((-23920640 : Rat) / 52799) [(4, 1), (5, 1), (6, 1), (8, 1), (12, 2), (14, 1), (15, 1)],
  term ((11960320 : Rat) / 52799) [(4, 1), (5, 1), (6, 1), (8, 1), (12, 2), (14, 2), (15, 1)],
  term ((11960320 : Rat) / 52799) [(4, 1), (5, 1), (6, 1), (8, 1), (12, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 953 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0953_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0953
        rs_R005_ueqv_R005NYN_generator_05_0900_0999 =
      rs_R005_ueqv_R005NYN_partial_05_0953 := by
  native_decide

/-- Coefficient term 954 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0954 : Poly :=
[
  term ((25613184 : Rat) / 385571) [(4, 1), (5, 1), (6, 1), (8, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 954 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0954 : Poly :=
[
  term ((-51226368 : Rat) / 385571) [(2, 1), (4, 1), (5, 1), (6, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((25613184 : Rat) / 385571) [(2, 2), (4, 1), (5, 1), (6, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((25613184 : Rat) / 385571) [(3, 2), (4, 1), (5, 1), (6, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((51226368 : Rat) / 385571) [(4, 1), (5, 1), (6, 1), (8, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-25613184 : Rat) / 385571) [(4, 1), (5, 1), (6, 1), (8, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((-25613184 : Rat) / 385571) [(4, 1), (5, 1), (6, 1), (8, 1), (12, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 954 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0954_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0954
        rs_R005_ueqv_R005NYN_generator_05_0900_0999 =
      rs_R005_ueqv_R005NYN_partial_05_0954 := by
  native_decide

/-- Coefficient term 955 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0955 : Poly :=
[
  term ((4718720 : Rat) / 52799) [(4, 1), (5, 1), (6, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 955 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0955 : Poly :=
[
  term ((-9437440 : Rat) / 52799) [(2, 1), (4, 1), (5, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((4718720 : Rat) / 52799) [(2, 2), (4, 1), (5, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((4718720 : Rat) / 52799) [(3, 2), (4, 1), (5, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((-4718720 : Rat) / 52799) [(4, 1), (5, 1), (6, 1), (12, 1), (14, 1), (15, 3)],
  term ((9437440 : Rat) / 52799) [(4, 1), (5, 1), (6, 1), (12, 1), (14, 2), (15, 1)],
  term ((-4718720 : Rat) / 52799) [(4, 1), (5, 1), (6, 1), (12, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 955 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0955_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0955
        rs_R005_ueqv_R005NYN_generator_05_0900_0999 =
      rs_R005_ueqv_R005NYN_partial_05_0955 := by
  native_decide

/-- Coefficient term 956 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0956 : Poly :=
[
  term ((-65940144 : Rat) / 385571) [(4, 1), (5, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 956 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0956 : Poly :=
[
  term ((131880288 : Rat) / 385571) [(2, 1), (4, 1), (5, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-65940144 : Rat) / 385571) [(2, 2), (4, 1), (5, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-65940144 : Rat) / 385571) [(3, 2), (4, 1), (5, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((65940144 : Rat) / 385571) [(4, 1), (5, 1), (6, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-131880288 : Rat) / 385571) [(4, 1), (5, 1), (6, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((65940144 : Rat) / 385571) [(4, 1), (5, 1), (6, 1), (12, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 956 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0956_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0956
        rs_R005_ueqv_R005NYN_generator_05_0900_0999 =
      rs_R005_ueqv_R005NYN_partial_05_0956 := by
  native_decide

/-- Coefficient term 957 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0957 : Poly :=
[
  term ((-11960320 : Rat) / 52799) [(4, 1), (5, 1), (6, 1), (12, 1), (15, 1)]
]

/-- Partial product 957 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0957 : Poly :=
[
  term ((23920640 : Rat) / 52799) [(2, 1), (4, 1), (5, 1), (6, 1), (12, 1), (15, 1)],
  term ((-11960320 : Rat) / 52799) [(2, 2), (4, 1), (5, 1), (6, 1), (12, 1), (15, 1)],
  term ((-11960320 : Rat) / 52799) [(3, 2), (4, 1), (5, 1), (6, 1), (12, 1), (15, 1)],
  term ((-23920640 : Rat) / 52799) [(4, 1), (5, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((11960320 : Rat) / 52799) [(4, 1), (5, 1), (6, 1), (12, 1), (14, 2), (15, 1)],
  term ((11960320 : Rat) / 52799) [(4, 1), (5, 1), (6, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 957 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0957_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0957
        rs_R005_ueqv_R005NYN_generator_05_0900_0999 =
      rs_R005_ueqv_R005NYN_partial_05_0957 := by
  native_decide

/-- Coefficient term 958 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0958 : Poly :=
[
  term ((25613184 : Rat) / 385571) [(4, 1), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 958 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0958 : Poly :=
[
  term ((-51226368 : Rat) / 385571) [(2, 1), (4, 1), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((25613184 : Rat) / 385571) [(2, 2), (4, 1), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((25613184 : Rat) / 385571) [(3, 2), (4, 1), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((51226368 : Rat) / 385571) [(4, 1), (5, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-25613184 : Rat) / 385571) [(4, 1), (5, 1), (6, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-25613184 : Rat) / 385571) [(4, 1), (5, 1), (6, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 958 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0958_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0958
        rs_R005_ueqv_R005NYN_generator_05_0900_0999 =
      rs_R005_ueqv_R005NYN_partial_05_0958 := by
  native_decide

/-- Coefficient term 959 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0959 : Poly :=
[
  term ((11960320 : Rat) / 52799) [(4, 1), (5, 1), (6, 1), (12, 2), (15, 1)]
]

/-- Partial product 959 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0959 : Poly :=
[
  term ((-23920640 : Rat) / 52799) [(2, 1), (4, 1), (5, 1), (6, 1), (12, 2), (15, 1)],
  term ((11960320 : Rat) / 52799) [(2, 2), (4, 1), (5, 1), (6, 1), (12, 2), (15, 1)],
  term ((11960320 : Rat) / 52799) [(3, 2), (4, 1), (5, 1), (6, 1), (12, 2), (15, 1)],
  term ((23920640 : Rat) / 52799) [(4, 1), (5, 1), (6, 1), (12, 2), (14, 1), (15, 1)],
  term ((-11960320 : Rat) / 52799) [(4, 1), (5, 1), (6, 1), (12, 2), (14, 2), (15, 1)],
  term ((-11960320 : Rat) / 52799) [(4, 1), (5, 1), (6, 1), (12, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 959 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0959_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0959
        rs_R005_ueqv_R005NYN_generator_05_0900_0999 =
      rs_R005_ueqv_R005NYN_partial_05_0959 := by
  native_decide

/-- Coefficient term 960 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0960 : Poly :=
[
  term ((-25613184 : Rat) / 385571) [(4, 1), (5, 1), (6, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 960 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0960 : Poly :=
[
  term ((51226368 : Rat) / 385571) [(2, 1), (4, 1), (5, 1), (6, 1), (12, 2), (15, 1), (16, 1)],
  term ((-25613184 : Rat) / 385571) [(2, 2), (4, 1), (5, 1), (6, 1), (12, 2), (15, 1), (16, 1)],
  term ((-25613184 : Rat) / 385571) [(3, 2), (4, 1), (5, 1), (6, 1), (12, 2), (15, 1), (16, 1)],
  term ((-51226368 : Rat) / 385571) [(4, 1), (5, 1), (6, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((25613184 : Rat) / 385571) [(4, 1), (5, 1), (6, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((25613184 : Rat) / 385571) [(4, 1), (5, 1), (6, 1), (12, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 960 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0960_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0960
        rs_R005_ueqv_R005NYN_generator_05_0900_0999 =
      rs_R005_ueqv_R005NYN_partial_05_0960 := by
  native_decide

/-- Coefficient term 961 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0961 : Poly :=
[
  term ((-11960320 : Rat) / 52799) [(4, 1), (5, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 961 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0961 : Poly :=
[
  term ((23920640 : Rat) / 52799) [(2, 1), (4, 1), (5, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-11960320 : Rat) / 52799) [(2, 2), (4, 1), (5, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-11960320 : Rat) / 52799) [(3, 2), (4, 1), (5, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-23920640 : Rat) / 52799) [(4, 1), (5, 1), (7, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((11960320 : Rat) / 52799) [(4, 1), (5, 1), (7, 1), (8, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((11960320 : Rat) / 52799) [(4, 1), (5, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 961 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0961_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0961
        rs_R005_ueqv_R005NYN_generator_05_0900_0999 =
      rs_R005_ueqv_R005NYN_partial_05_0961 := by
  native_decide

/-- Coefficient term 962 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0962 : Poly :=
[
  term ((25613184 : Rat) / 385571) [(4, 1), (5, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 962 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0962 : Poly :=
[
  term ((-51226368 : Rat) / 385571) [(2, 1), (4, 1), (5, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((25613184 : Rat) / 385571) [(2, 2), (4, 1), (5, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((25613184 : Rat) / 385571) [(3, 2), (4, 1), (5, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((51226368 : Rat) / 385571) [(4, 1), (5, 1), (7, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-25613184 : Rat) / 385571) [(4, 1), (5, 1), (7, 1), (8, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-25613184 : Rat) / 385571) [(4, 1), (5, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 962 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0962_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0962
        rs_R005_ueqv_R005NYN_generator_05_0900_0999 =
      rs_R005_ueqv_R005NYN_partial_05_0962 := by
  native_decide

/-- Coefficient term 963 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0963 : Poly :=
[
  term ((-11574400 : Rat) / 158397) [(4, 1), (5, 1), (7, 1), (8, 1), (12, 1), (15, 2)]
]

/-- Partial product 963 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0963 : Poly :=
[
  term ((23148800 : Rat) / 158397) [(2, 1), (4, 1), (5, 1), (7, 1), (8, 1), (12, 1), (15, 2)],
  term ((-11574400 : Rat) / 158397) [(2, 2), (4, 1), (5, 1), (7, 1), (8, 1), (12, 1), (15, 2)],
  term ((-11574400 : Rat) / 158397) [(3, 2), (4, 1), (5, 1), (7, 1), (8, 1), (12, 1), (15, 2)],
  term ((-23148800 : Rat) / 158397) [(4, 1), (5, 1), (7, 1), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((11574400 : Rat) / 158397) [(4, 1), (5, 1), (7, 1), (8, 1), (12, 1), (14, 2), (15, 2)],
  term ((11574400 : Rat) / 158397) [(4, 1), (5, 1), (7, 1), (8, 1), (12, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 963 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0963_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0963
        rs_R005_ueqv_R005NYN_generator_05_0900_0999 =
      rs_R005_ueqv_R005NYN_partial_05_0963 := by
  native_decide

/-- Coefficient term 964 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0964 : Poly :=
[
  term ((124680784 : Rat) / 385571) [(4, 1), (5, 1), (7, 1), (8, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 964 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0964 : Poly :=
[
  term ((-249361568 : Rat) / 385571) [(2, 1), (4, 1), (5, 1), (7, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((124680784 : Rat) / 385571) [(2, 2), (4, 1), (5, 1), (7, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((124680784 : Rat) / 385571) [(3, 2), (4, 1), (5, 1), (7, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((249361568 : Rat) / 385571) [(4, 1), (5, 1), (7, 1), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-124680784 : Rat) / 385571) [(4, 1), (5, 1), (7, 1), (8, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-124680784 : Rat) / 385571) [(4, 1), (5, 1), (7, 1), (8, 1), (12, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 964 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0964_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0964
        rs_R005_ueqv_R005NYN_generator_05_0900_0999 =
      rs_R005_ueqv_R005NYN_partial_05_0964 := by
  native_decide

/-- Coefficient term 965 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0965 : Poly :=
[
  term ((11960320 : Rat) / 52799) [(4, 1), (5, 1), (7, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 965 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0965 : Poly :=
[
  term ((-23920640 : Rat) / 52799) [(2, 1), (4, 1), (5, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((11960320 : Rat) / 52799) [(2, 2), (4, 1), (5, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((11960320 : Rat) / 52799) [(3, 2), (4, 1), (5, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((23920640 : Rat) / 52799) [(4, 1), (5, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-11960320 : Rat) / 52799) [(4, 1), (5, 1), (7, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-11960320 : Rat) / 52799) [(4, 1), (5, 1), (7, 1), (12, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 965 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0965_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0965
        rs_R005_ueqv_R005NYN_generator_05_0900_0999 =
      rs_R005_ueqv_R005NYN_partial_05_0965 := by
  native_decide

/-- Coefficient term 966 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0966 : Poly :=
[
  term ((-25613184 : Rat) / 385571) [(4, 1), (5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 966 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0966 : Poly :=
[
  term ((51226368 : Rat) / 385571) [(2, 1), (4, 1), (5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-25613184 : Rat) / 385571) [(2, 2), (4, 1), (5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-25613184 : Rat) / 385571) [(3, 2), (4, 1), (5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-51226368 : Rat) / 385571) [(4, 1), (5, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((25613184 : Rat) / 385571) [(4, 1), (5, 1), (7, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((25613184 : Rat) / 385571) [(4, 1), (5, 1), (7, 1), (12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 966 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0966_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0966
        rs_R005_ueqv_R005NYN_generator_05_0900_0999 =
      rs_R005_ueqv_R005NYN_partial_05_0966 := by
  native_decide

/-- Coefficient term 967 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0967 : Poly :=
[
  term ((11574400 : Rat) / 158397) [(4, 1), (5, 1), (7, 1), (12, 1), (15, 2)]
]

/-- Partial product 967 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0967 : Poly :=
[
  term ((-23148800 : Rat) / 158397) [(2, 1), (4, 1), (5, 1), (7, 1), (12, 1), (15, 2)],
  term ((11574400 : Rat) / 158397) [(2, 2), (4, 1), (5, 1), (7, 1), (12, 1), (15, 2)],
  term ((11574400 : Rat) / 158397) [(3, 2), (4, 1), (5, 1), (7, 1), (12, 1), (15, 2)],
  term ((23148800 : Rat) / 158397) [(4, 1), (5, 1), (7, 1), (12, 1), (14, 1), (15, 2)],
  term ((-11574400 : Rat) / 158397) [(4, 1), (5, 1), (7, 1), (12, 1), (14, 2), (15, 2)],
  term ((-11574400 : Rat) / 158397) [(4, 1), (5, 1), (7, 1), (12, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 967 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0967_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0967
        rs_R005_ueqv_R005NYN_generator_05_0900_0999 =
      rs_R005_ueqv_R005NYN_partial_05_0967 := by
  native_decide

/-- Coefficient term 968 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0968 : Poly :=
[
  term ((-124680784 : Rat) / 385571) [(4, 1), (5, 1), (7, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 968 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0968 : Poly :=
[
  term ((249361568 : Rat) / 385571) [(2, 1), (4, 1), (5, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((-124680784 : Rat) / 385571) [(2, 2), (4, 1), (5, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((-124680784 : Rat) / 385571) [(3, 2), (4, 1), (5, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((-249361568 : Rat) / 385571) [(4, 1), (5, 1), (7, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((124680784 : Rat) / 385571) [(4, 1), (5, 1), (7, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((124680784 : Rat) / 385571) [(4, 1), (5, 1), (7, 1), (12, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 968 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0968_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0968
        rs_R005_ueqv_R005NYN_generator_05_0900_0999 =
      rs_R005_ueqv_R005NYN_partial_05_0968 := by
  native_decide

/-- Coefficient term 969 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0969 : Poly :=
[
  term ((-24238592 : Rat) / 158397) [(4, 1), (5, 1), (8, 1), (9, 1), (12, 1), (15, 2)]
]

/-- Partial product 969 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0969 : Poly :=
[
  term ((48477184 : Rat) / 158397) [(2, 1), (4, 1), (5, 1), (8, 1), (9, 1), (12, 1), (15, 2)],
  term ((-24238592 : Rat) / 158397) [(2, 2), (4, 1), (5, 1), (8, 1), (9, 1), (12, 1), (15, 2)],
  term ((-24238592 : Rat) / 158397) [(3, 2), (4, 1), (5, 1), (8, 1), (9, 1), (12, 1), (15, 2)],
  term ((-48477184 : Rat) / 158397) [(4, 1), (5, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 2)],
  term ((24238592 : Rat) / 158397) [(4, 1), (5, 1), (8, 1), (9, 1), (12, 1), (14, 2), (15, 2)],
  term ((24238592 : Rat) / 158397) [(4, 1), (5, 1), (8, 1), (9, 1), (12, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 969 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0969_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0969
        rs_R005_ueqv_R005NYN_generator_05_0900_0999 =
      rs_R005_ueqv_R005NYN_partial_05_0969 := by
  native_decide

/-- Coefficient term 970 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0970 : Poly :=
[
  term ((3682016 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (9, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 970 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0970 : Poly :=
[
  term ((-7364032 : Rat) / 385571) [(2, 1), (4, 1), (5, 1), (8, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((3682016 : Rat) / 385571) [(2, 2), (4, 1), (5, 1), (8, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((3682016 : Rat) / 385571) [(3, 2), (4, 1), (5, 1), (8, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((7364032 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3682016 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (9, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-3682016 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (9, 1), (12, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 970 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0970_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0970
        rs_R005_ueqv_R005NYN_generator_05_0900_0999 =
      rs_R005_ueqv_R005NYN_partial_05_0970 := by
  native_decide

/-- Coefficient term 971 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0971 : Poly :=
[
  term ((-5980160 : Rat) / 52799) [(4, 1), (5, 1), (8, 1), (10, 1), (14, 1), (15, 1)]
]

/-- Partial product 971 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0971 : Poly :=
[
  term ((11960320 : Rat) / 52799) [(2, 1), (4, 1), (5, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((-5980160 : Rat) / 52799) [(2, 2), (4, 1), (5, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((-5980160 : Rat) / 52799) [(3, 2), (4, 1), (5, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((5980160 : Rat) / 52799) [(4, 1), (5, 1), (8, 1), (10, 1), (14, 1), (15, 3)],
  term ((-11960320 : Rat) / 52799) [(4, 1), (5, 1), (8, 1), (10, 1), (14, 2), (15, 1)],
  term ((5980160 : Rat) / 52799) [(4, 1), (5, 1), (8, 1), (10, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 971 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0971_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0971
        rs_R005_ueqv_R005NYN_generator_05_0900_0999 =
      rs_R005_ueqv_R005NYN_partial_05_0971 := by
  native_decide

/-- Coefficient term 972 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0972 : Poly :=
[
  term ((12806592 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 972 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0972 : Poly :=
[
  term ((-25613184 : Rat) / 385571) [(2, 1), (4, 1), (5, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((12806592 : Rat) / 385571) [(2, 2), (4, 1), (5, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((12806592 : Rat) / 385571) [(3, 2), (4, 1), (5, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12806592 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (10, 1), (14, 1), (15, 3), (16, 1)],
  term ((25613184 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-12806592 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (10, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 972 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0972_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0972
        rs_R005_ueqv_R005NYN_generator_05_0900_0999 =
      rs_R005_ueqv_R005NYN_partial_05_0972 := by
  native_decide

/-- Coefficient term 973 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0973 : Poly :=
[
  term ((-2990080 : Rat) / 52799) [(4, 1), (5, 1), (8, 1), (10, 1), (15, 1)]
]

/-- Partial product 973 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0973 : Poly :=
[
  term ((5980160 : Rat) / 52799) [(2, 1), (4, 1), (5, 1), (8, 1), (10, 1), (15, 1)],
  term ((-2990080 : Rat) / 52799) [(2, 2), (4, 1), (5, 1), (8, 1), (10, 1), (15, 1)],
  term ((-2990080 : Rat) / 52799) [(3, 2), (4, 1), (5, 1), (8, 1), (10, 1), (15, 1)],
  term ((-5980160 : Rat) / 52799) [(4, 1), (5, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((2990080 : Rat) / 52799) [(4, 1), (5, 1), (8, 1), (10, 1), (14, 2), (15, 1)],
  term ((2990080 : Rat) / 52799) [(4, 1), (5, 1), (8, 1), (10, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 973 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0973_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0973
        rs_R005_ueqv_R005NYN_generator_05_0900_0999 =
      rs_R005_ueqv_R005NYN_partial_05_0973 := by
  native_decide

/-- Coefficient term 974 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0974 : Poly :=
[
  term ((6403296 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 974 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0974 : Poly :=
[
  term ((-12806592 : Rat) / 385571) [(2, 1), (4, 1), (5, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((6403296 : Rat) / 385571) [(2, 2), (4, 1), (5, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((6403296 : Rat) / 385571) [(3, 2), (4, 1), (5, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((12806592 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6403296 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-6403296 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (10, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 974 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0974_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0974
        rs_R005_ueqv_R005NYN_generator_05_0900_0999 =
      rs_R005_ueqv_R005NYN_partial_05_0974 := by
  native_decide

/-- Coefficient term 975 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0975 : Poly :=
[
  term ((-3112960 : Rat) / 52799) [(4, 1), (5, 1), (8, 1), (11, 1), (12, 1), (15, 2)]
]

/-- Partial product 975 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0975 : Poly :=
[
  term ((6225920 : Rat) / 52799) [(2, 1), (4, 1), (5, 1), (8, 1), (11, 1), (12, 1), (15, 2)],
  term ((-3112960 : Rat) / 52799) [(2, 2), (4, 1), (5, 1), (8, 1), (11, 1), (12, 1), (15, 2)],
  term ((-3112960 : Rat) / 52799) [(3, 2), (4, 1), (5, 1), (8, 1), (11, 1), (12, 1), (15, 2)],
  term ((-6225920 : Rat) / 52799) [(4, 1), (5, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((3112960 : Rat) / 52799) [(4, 1), (5, 1), (8, 1), (11, 1), (12, 1), (14, 2), (15, 2)],
  term ((3112960 : Rat) / 52799) [(4, 1), (5, 1), (8, 1), (11, 1), (12, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 975 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0975_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0975
        rs_R005_ueqv_R005NYN_generator_05_0900_0999 =
      rs_R005_ueqv_R005NYN_partial_05_0975 := by
  native_decide

/-- Coefficient term 976 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0976 : Poly :=
[
  term ((9166080 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 976 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0976 : Poly :=
[
  term ((-18332160 : Rat) / 385571) [(2, 1), (4, 1), (5, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((9166080 : Rat) / 385571) [(2, 2), (4, 1), (5, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((9166080 : Rat) / 385571) [(3, 2), (4, 1), (5, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((18332160 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-9166080 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (11, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-9166080 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (11, 1), (12, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 976 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0976_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0976
        rs_R005_ueqv_R005NYN_generator_05_0900_0999 =
      rs_R005_ueqv_R005NYN_partial_05_0976 := by
  native_decide

/-- Coefficient term 977 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0977 : Poly :=
[
  term ((33089920 : Rat) / 158397) [(4, 1), (5, 1), (8, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 977 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0977 : Poly :=
[
  term ((-66179840 : Rat) / 158397) [(2, 1), (4, 1), (5, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((33089920 : Rat) / 158397) [(2, 2), (4, 1), (5, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((33089920 : Rat) / 158397) [(3, 2), (4, 1), (5, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-33089920 : Rat) / 158397) [(4, 1), (5, 1), (8, 1), (12, 1), (14, 1), (15, 3)],
  term ((66179840 : Rat) / 158397) [(4, 1), (5, 1), (8, 1), (12, 1), (14, 2), (15, 1)],
  term ((-33089920 : Rat) / 158397) [(4, 1), (5, 1), (8, 1), (12, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 977 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0977_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0977
        rs_R005_ueqv_R005NYN_generator_05_0900_0999 =
      rs_R005_ueqv_R005NYN_partial_05_0977 := by
  native_decide

/-- Coefficient term 978 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0978 : Poly :=
[
  term ((-176160400 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 978 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0978 : Poly :=
[
  term ((352320800 : Rat) / 385571) [(2, 1), (4, 1), (5, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-176160400 : Rat) / 385571) [(2, 2), (4, 1), (5, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-176160400 : Rat) / 385571) [(3, 2), (4, 1), (5, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((176160400 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-352320800 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((176160400 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (12, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 978 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0978_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0978
        rs_R005_ueqv_R005NYN_generator_05_0900_0999 =
      rs_R005_ueqv_R005NYN_partial_05_0978 := by
  native_decide

/-- Coefficient term 979 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0979 : Poly :=
[
  term ((1556480 : Rat) / 52799) [(4, 1), (5, 1), (8, 1), (12, 1), (15, 3)]
]

/-- Partial product 979 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0979 : Poly :=
[
  term ((-3112960 : Rat) / 52799) [(2, 1), (4, 1), (5, 1), (8, 1), (12, 1), (15, 3)],
  term ((1556480 : Rat) / 52799) [(2, 2), (4, 1), (5, 1), (8, 1), (12, 1), (15, 3)],
  term ((1556480 : Rat) / 52799) [(3, 2), (4, 1), (5, 1), (8, 1), (12, 1), (15, 3)],
  term ((3112960 : Rat) / 52799) [(4, 1), (5, 1), (8, 1), (12, 1), (14, 1), (15, 3)],
  term ((-1556480 : Rat) / 52799) [(4, 1), (5, 1), (8, 1), (12, 1), (14, 2), (15, 3)],
  term ((-1556480 : Rat) / 52799) [(4, 1), (5, 1), (8, 1), (12, 1), (15, 5)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 979 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0979_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0979
        rs_R005_ueqv_R005NYN_generator_05_0900_0999 =
      rs_R005_ueqv_R005NYN_partial_05_0979 := by
  native_decide

/-- Coefficient term 980 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0980 : Poly :=
[
  term ((-4583040 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 980 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0980 : Poly :=
[
  term ((9166080 : Rat) / 385571) [(2, 1), (4, 1), (5, 1), (8, 1), (12, 1), (15, 3), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(2, 2), (4, 1), (5, 1), (8, 1), (12, 1), (15, 3), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(3, 2), (4, 1), (5, 1), (8, 1), (12, 1), (15, 3), (16, 1)],
  term ((-9166080 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((4583040 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (12, 1), (14, 2), (15, 3), (16, 1)],
  term ((4583040 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (12, 1), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 980 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0980_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0980
        rs_R005_ueqv_R005NYN_generator_05_0900_0999 =
      rs_R005_ueqv_R005NYN_partial_05_0980 := by
  native_decide

/-- Coefficient term 981 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0981 : Poly :=
[
  term ((11960320 : Rat) / 52799) [(4, 1), (5, 1), (8, 1), (12, 2), (15, 1)]
]

/-- Partial product 981 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0981 : Poly :=
[
  term ((-23920640 : Rat) / 52799) [(2, 1), (4, 1), (5, 1), (8, 1), (12, 2), (15, 1)],
  term ((11960320 : Rat) / 52799) [(2, 2), (4, 1), (5, 1), (8, 1), (12, 2), (15, 1)],
  term ((11960320 : Rat) / 52799) [(3, 2), (4, 1), (5, 1), (8, 1), (12, 2), (15, 1)],
  term ((23920640 : Rat) / 52799) [(4, 1), (5, 1), (8, 1), (12, 2), (14, 1), (15, 1)],
  term ((-11960320 : Rat) / 52799) [(4, 1), (5, 1), (8, 1), (12, 2), (14, 2), (15, 1)],
  term ((-11960320 : Rat) / 52799) [(4, 1), (5, 1), (8, 1), (12, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 981 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0981_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0981
        rs_R005_ueqv_R005NYN_generator_05_0900_0999 =
      rs_R005_ueqv_R005NYN_partial_05_0981 := by
  native_decide

/-- Coefficient term 982 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0982 : Poly :=
[
  term ((-25613184 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 982 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0982 : Poly :=
[
  term ((51226368 : Rat) / 385571) [(2, 1), (4, 1), (5, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-25613184 : Rat) / 385571) [(2, 2), (4, 1), (5, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-25613184 : Rat) / 385571) [(3, 2), (4, 1), (5, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-51226368 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((25613184 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((25613184 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (12, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 982 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0982_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0982
        rs_R005_ueqv_R005NYN_generator_05_0900_0999 =
      rs_R005_ueqv_R005NYN_partial_05_0982 := by
  native_decide

/-- Coefficient term 983 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0983 : Poly :=
[
  term ((2990080 : Rat) / 52799) [(4, 1), (5, 1), (8, 1), (14, 1), (15, 1)]
]

/-- Partial product 983 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0983 : Poly :=
[
  term ((-5980160 : Rat) / 52799) [(2, 1), (4, 1), (5, 1), (8, 1), (14, 1), (15, 1)],
  term ((2990080 : Rat) / 52799) [(2, 2), (4, 1), (5, 1), (8, 1), (14, 1), (15, 1)],
  term ((2990080 : Rat) / 52799) [(3, 2), (4, 1), (5, 1), (8, 1), (14, 1), (15, 1)],
  term ((-2990080 : Rat) / 52799) [(4, 1), (5, 1), (8, 1), (14, 1), (15, 3)],
  term ((5980160 : Rat) / 52799) [(4, 1), (5, 1), (8, 1), (14, 2), (15, 1)],
  term ((-2990080 : Rat) / 52799) [(4, 1), (5, 1), (8, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 983 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0983_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0983
        rs_R005_ueqv_R005NYN_generator_05_0900_0999 =
      rs_R005_ueqv_R005NYN_partial_05_0983 := by
  native_decide

/-- Coefficient term 984 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0984 : Poly :=
[
  term ((-6403296 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 984 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0984 : Poly :=
[
  term ((12806592 : Rat) / 385571) [(2, 1), (4, 1), (5, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6403296 : Rat) / 385571) [(2, 2), (4, 1), (5, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6403296 : Rat) / 385571) [(3, 2), (4, 1), (5, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((6403296 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (14, 1), (15, 3), (16, 1)],
  term ((-12806592 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((6403296 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 984 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0984_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0984
        rs_R005_ueqv_R005NYN_generator_05_0900_0999 =
      rs_R005_ueqv_R005NYN_partial_05_0984 := by
  native_decide

/-- Coefficient term 985 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0985 : Poly :=
[
  term ((-5263360 : Rat) / 52799) [(4, 1), (5, 1), (8, 1), (15, 1)]
]

/-- Partial product 985 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0985 : Poly :=
[
  term ((10526720 : Rat) / 52799) [(2, 1), (4, 1), (5, 1), (8, 1), (15, 1)],
  term ((-5263360 : Rat) / 52799) [(2, 2), (4, 1), (5, 1), (8, 1), (15, 1)],
  term ((-5263360 : Rat) / 52799) [(3, 2), (4, 1), (5, 1), (8, 1), (15, 1)],
  term ((-10526720 : Rat) / 52799) [(4, 1), (5, 1), (8, 1), (14, 1), (15, 1)],
  term ((5263360 : Rat) / 52799) [(4, 1), (5, 1), (8, 1), (14, 2), (15, 1)],
  term ((5263360 : Rat) / 52799) [(4, 1), (5, 1), (8, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 985 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0985_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0985
        rs_R005_ueqv_R005NYN_generator_05_0900_0999 =
      rs_R005_ueqv_R005NYN_partial_05_0985 := by
  native_decide

/-- Coefficient term 986 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0986 : Poly :=
[
  term ((11896464 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 986 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0986 : Poly :=
[
  term ((-23792928 : Rat) / 385571) [(2, 1), (4, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((11896464 : Rat) / 385571) [(2, 2), (4, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((11896464 : Rat) / 385571) [(3, 2), (4, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((23792928 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11896464 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((-11896464 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 986 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0986_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0986
        rs_R005_ueqv_R005NYN_generator_05_0900_0999 =
      rs_R005_ueqv_R005NYN_partial_05_0986 := by
  native_decide

/-- Coefficient term 987 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0987 : Poly :=
[
  term ((24238592 : Rat) / 158397) [(4, 1), (5, 1), (9, 1), (12, 1), (15, 2)]
]

/-- Partial product 987 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0987 : Poly :=
[
  term ((-48477184 : Rat) / 158397) [(2, 1), (4, 1), (5, 1), (9, 1), (12, 1), (15, 2)],
  term ((24238592 : Rat) / 158397) [(2, 2), (4, 1), (5, 1), (9, 1), (12, 1), (15, 2)],
  term ((24238592 : Rat) / 158397) [(3, 2), (4, 1), (5, 1), (9, 1), (12, 1), (15, 2)],
  term ((48477184 : Rat) / 158397) [(4, 1), (5, 1), (9, 1), (12, 1), (14, 1), (15, 2)],
  term ((-24238592 : Rat) / 158397) [(4, 1), (5, 1), (9, 1), (12, 1), (14, 2), (15, 2)],
  term ((-24238592 : Rat) / 158397) [(4, 1), (5, 1), (9, 1), (12, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 987 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0987_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0987
        rs_R005_ueqv_R005NYN_generator_05_0900_0999 =
      rs_R005_ueqv_R005NYN_partial_05_0987 := by
  native_decide

/-- Coefficient term 988 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0988 : Poly :=
[
  term ((-3682016 : Rat) / 385571) [(4, 1), (5, 1), (9, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 988 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0988 : Poly :=
[
  term ((7364032 : Rat) / 385571) [(2, 1), (4, 1), (5, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-3682016 : Rat) / 385571) [(2, 2), (4, 1), (5, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-3682016 : Rat) / 385571) [(3, 2), (4, 1), (5, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-7364032 : Rat) / 385571) [(4, 1), (5, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((3682016 : Rat) / 385571) [(4, 1), (5, 1), (9, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((3682016 : Rat) / 385571) [(4, 1), (5, 1), (9, 1), (12, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 988 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0988_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0988
        rs_R005_ueqv_R005NYN_generator_05_0900_0999 =
      rs_R005_ueqv_R005NYN_partial_05_0988 := by
  native_decide

/-- Coefficient term 989 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0989 : Poly :=
[
  term ((5980160 : Rat) / 52799) [(4, 1), (5, 1), (10, 1), (14, 1), (15, 1)]
]

/-- Partial product 989 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0989 : Poly :=
[
  term ((-11960320 : Rat) / 52799) [(2, 1), (4, 1), (5, 1), (10, 1), (14, 1), (15, 1)],
  term ((5980160 : Rat) / 52799) [(2, 2), (4, 1), (5, 1), (10, 1), (14, 1), (15, 1)],
  term ((5980160 : Rat) / 52799) [(3, 2), (4, 1), (5, 1), (10, 1), (14, 1), (15, 1)],
  term ((-5980160 : Rat) / 52799) [(4, 1), (5, 1), (10, 1), (14, 1), (15, 3)],
  term ((11960320 : Rat) / 52799) [(4, 1), (5, 1), (10, 1), (14, 2), (15, 1)],
  term ((-5980160 : Rat) / 52799) [(4, 1), (5, 1), (10, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 989 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0989_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0989
        rs_R005_ueqv_R005NYN_generator_05_0900_0999 =
      rs_R005_ueqv_R005NYN_partial_05_0989 := by
  native_decide

/-- Coefficient term 990 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0990 : Poly :=
[
  term ((-12806592 : Rat) / 385571) [(4, 1), (5, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 990 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0990 : Poly :=
[
  term ((25613184 : Rat) / 385571) [(2, 1), (4, 1), (5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12806592 : Rat) / 385571) [(2, 2), (4, 1), (5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12806592 : Rat) / 385571) [(3, 2), (4, 1), (5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((12806592 : Rat) / 385571) [(4, 1), (5, 1), (10, 1), (14, 1), (15, 3), (16, 1)],
  term ((-25613184 : Rat) / 385571) [(4, 1), (5, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((12806592 : Rat) / 385571) [(4, 1), (5, 1), (10, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 990 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0990_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0990
        rs_R005_ueqv_R005NYN_generator_05_0900_0999 =
      rs_R005_ueqv_R005NYN_partial_05_0990 := by
  native_decide

/-- Coefficient term 991 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0991 : Poly :=
[
  term ((2990080 : Rat) / 52799) [(4, 1), (5, 1), (10, 1), (15, 1)]
]

/-- Partial product 991 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0991 : Poly :=
[
  term ((-5980160 : Rat) / 52799) [(2, 1), (4, 1), (5, 1), (10, 1), (15, 1)],
  term ((2990080 : Rat) / 52799) [(2, 2), (4, 1), (5, 1), (10, 1), (15, 1)],
  term ((2990080 : Rat) / 52799) [(3, 2), (4, 1), (5, 1), (10, 1), (15, 1)],
  term ((5980160 : Rat) / 52799) [(4, 1), (5, 1), (10, 1), (14, 1), (15, 1)],
  term ((-2990080 : Rat) / 52799) [(4, 1), (5, 1), (10, 1), (14, 2), (15, 1)],
  term ((-2990080 : Rat) / 52799) [(4, 1), (5, 1), (10, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 991 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0991_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0991
        rs_R005_ueqv_R005NYN_generator_05_0900_0999 =
      rs_R005_ueqv_R005NYN_partial_05_0991 := by
  native_decide

/-- Coefficient term 992 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0992 : Poly :=
[
  term ((-6403296 : Rat) / 385571) [(4, 1), (5, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 992 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0992 : Poly :=
[
  term ((12806592 : Rat) / 385571) [(2, 1), (4, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-6403296 : Rat) / 385571) [(2, 2), (4, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-6403296 : Rat) / 385571) [(3, 2), (4, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-12806592 : Rat) / 385571) [(4, 1), (5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((6403296 : Rat) / 385571) [(4, 1), (5, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((6403296 : Rat) / 385571) [(4, 1), (5, 1), (10, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 992 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0992_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0992
        rs_R005_ueqv_R005NYN_generator_05_0900_0999 =
      rs_R005_ueqv_R005NYN_partial_05_0992 := by
  native_decide

/-- Coefficient term 993 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0993 : Poly :=
[
  term ((3112960 : Rat) / 52799) [(4, 1), (5, 1), (11, 1), (12, 1), (15, 2)]
]

/-- Partial product 993 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0993 : Poly :=
[
  term ((-6225920 : Rat) / 52799) [(2, 1), (4, 1), (5, 1), (11, 1), (12, 1), (15, 2)],
  term ((3112960 : Rat) / 52799) [(2, 2), (4, 1), (5, 1), (11, 1), (12, 1), (15, 2)],
  term ((3112960 : Rat) / 52799) [(3, 2), (4, 1), (5, 1), (11, 1), (12, 1), (15, 2)],
  term ((6225920 : Rat) / 52799) [(4, 1), (5, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((-3112960 : Rat) / 52799) [(4, 1), (5, 1), (11, 1), (12, 1), (14, 2), (15, 2)],
  term ((-3112960 : Rat) / 52799) [(4, 1), (5, 1), (11, 1), (12, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 993 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0993_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0993
        rs_R005_ueqv_R005NYN_generator_05_0900_0999 =
      rs_R005_ueqv_R005NYN_partial_05_0993 := by
  native_decide

/-- Coefficient term 994 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0994 : Poly :=
[
  term ((-9166080 : Rat) / 385571) [(4, 1), (5, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 994 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0994 : Poly :=
[
  term ((18332160 : Rat) / 385571) [(2, 1), (4, 1), (5, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-9166080 : Rat) / 385571) [(2, 2), (4, 1), (5, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-9166080 : Rat) / 385571) [(3, 2), (4, 1), (5, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-18332160 : Rat) / 385571) [(4, 1), (5, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((9166080 : Rat) / 385571) [(4, 1), (5, 1), (11, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((9166080 : Rat) / 385571) [(4, 1), (5, 1), (11, 1), (12, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 994 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0994_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0994
        rs_R005_ueqv_R005NYN_generator_05_0900_0999 =
      rs_R005_ueqv_R005NYN_partial_05_0994 := by
  native_decide

/-- Coefficient term 995 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0995 : Poly :=
[
  term ((-33089920 : Rat) / 158397) [(4, 1), (5, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 995 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0995 : Poly :=
[
  term ((66179840 : Rat) / 158397) [(2, 1), (4, 1), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((-33089920 : Rat) / 158397) [(2, 2), (4, 1), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((-33089920 : Rat) / 158397) [(3, 2), (4, 1), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((33089920 : Rat) / 158397) [(4, 1), (5, 1), (12, 1), (14, 1), (15, 3)],
  term ((-66179840 : Rat) / 158397) [(4, 1), (5, 1), (12, 1), (14, 2), (15, 1)],
  term ((33089920 : Rat) / 158397) [(4, 1), (5, 1), (12, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 995 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0995_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0995
        rs_R005_ueqv_R005NYN_generator_05_0900_0999 =
      rs_R005_ueqv_R005NYN_partial_05_0995 := by
  native_decide

/-- Coefficient term 996 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0996 : Poly :=
[
  term ((176160400 : Rat) / 385571) [(4, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 996 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0996 : Poly :=
[
  term ((-352320800 : Rat) / 385571) [(2, 1), (4, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((176160400 : Rat) / 385571) [(2, 2), (4, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((176160400 : Rat) / 385571) [(3, 2), (4, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-176160400 : Rat) / 385571) [(4, 1), (5, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((352320800 : Rat) / 385571) [(4, 1), (5, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-176160400 : Rat) / 385571) [(4, 1), (5, 1), (12, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 996 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0996_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0996
        rs_R005_ueqv_R005NYN_generator_05_0900_0999 =
      rs_R005_ueqv_R005NYN_partial_05_0996 := by
  native_decide

/-- Coefficient term 997 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0997 : Poly :=
[
  term ((11281440 : Rat) / 52799) [(4, 1), (5, 1), (12, 1), (15, 1)]
]

/-- Partial product 997 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0997 : Poly :=
[
  term ((-22562880 : Rat) / 52799) [(2, 1), (4, 1), (5, 1), (12, 1), (15, 1)],
  term ((11281440 : Rat) / 52799) [(2, 2), (4, 1), (5, 1), (12, 1), (15, 1)],
  term ((11281440 : Rat) / 52799) [(3, 2), (4, 1), (5, 1), (12, 1), (15, 1)],
  term ((22562880 : Rat) / 52799) [(4, 1), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((-11281440 : Rat) / 52799) [(4, 1), (5, 1), (12, 1), (14, 2), (15, 1)],
  term ((-11281440 : Rat) / 52799) [(4, 1), (5, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 997 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0997_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0997
        rs_R005_ueqv_R005NYN_generator_05_0900_0999 =
      rs_R005_ueqv_R005NYN_partial_05_0997 := by
  native_decide

/-- Coefficient term 998 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0998 : Poly :=
[
  term ((-7280580 : Rat) / 385571) [(4, 1), (5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 998 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0998 : Poly :=
[
  term ((14561160 : Rat) / 385571) [(2, 1), (4, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-7280580 : Rat) / 385571) [(2, 2), (4, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-7280580 : Rat) / 385571) [(3, 2), (4, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-14561160 : Rat) / 385571) [(4, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((7280580 : Rat) / 385571) [(4, 1), (5, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((7280580 : Rat) / 385571) [(4, 1), (5, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 998 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0998_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0998
        rs_R005_ueqv_R005NYN_generator_05_0900_0999 =
      rs_R005_ueqv_R005NYN_partial_05_0998 := by
  native_decide

/-- Coefficient term 999 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_0999 : Poly :=
[
  term ((-1556480 : Rat) / 52799) [(4, 1), (5, 1), (12, 1), (15, 3)]
]

/-- Partial product 999 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_0999 : Poly :=
[
  term ((3112960 : Rat) / 52799) [(2, 1), (4, 1), (5, 1), (12, 1), (15, 3)],
  term ((-1556480 : Rat) / 52799) [(2, 2), (4, 1), (5, 1), (12, 1), (15, 3)],
  term ((-1556480 : Rat) / 52799) [(3, 2), (4, 1), (5, 1), (12, 1), (15, 3)],
  term ((-3112960 : Rat) / 52799) [(4, 1), (5, 1), (12, 1), (14, 1), (15, 3)],
  term ((1556480 : Rat) / 52799) [(4, 1), (5, 1), (12, 1), (14, 2), (15, 3)],
  term ((1556480 : Rat) / 52799) [(4, 1), (5, 1), (12, 1), (15, 5)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 999 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_0999_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_0999
        rs_R005_ueqv_R005NYN_generator_05_0900_0999 =
      rs_R005_ueqv_R005NYN_partial_05_0999 := by
  native_decide

/-- Partial products in this block. -/
def rs_R005_ueqv_R005NYN_partials_05_0900_0999 : List Poly :=
[
  rs_R005_ueqv_R005NYN_partial_05_0900,
  rs_R005_ueqv_R005NYN_partial_05_0901,
  rs_R005_ueqv_R005NYN_partial_05_0902,
  rs_R005_ueqv_R005NYN_partial_05_0903,
  rs_R005_ueqv_R005NYN_partial_05_0904,
  rs_R005_ueqv_R005NYN_partial_05_0905,
  rs_R005_ueqv_R005NYN_partial_05_0906,
  rs_R005_ueqv_R005NYN_partial_05_0907,
  rs_R005_ueqv_R005NYN_partial_05_0908,
  rs_R005_ueqv_R005NYN_partial_05_0909,
  rs_R005_ueqv_R005NYN_partial_05_0910,
  rs_R005_ueqv_R005NYN_partial_05_0911,
  rs_R005_ueqv_R005NYN_partial_05_0912,
  rs_R005_ueqv_R005NYN_partial_05_0913,
  rs_R005_ueqv_R005NYN_partial_05_0914,
  rs_R005_ueqv_R005NYN_partial_05_0915,
  rs_R005_ueqv_R005NYN_partial_05_0916,
  rs_R005_ueqv_R005NYN_partial_05_0917,
  rs_R005_ueqv_R005NYN_partial_05_0918,
  rs_R005_ueqv_R005NYN_partial_05_0919,
  rs_R005_ueqv_R005NYN_partial_05_0920,
  rs_R005_ueqv_R005NYN_partial_05_0921,
  rs_R005_ueqv_R005NYN_partial_05_0922,
  rs_R005_ueqv_R005NYN_partial_05_0923,
  rs_R005_ueqv_R005NYN_partial_05_0924,
  rs_R005_ueqv_R005NYN_partial_05_0925,
  rs_R005_ueqv_R005NYN_partial_05_0926,
  rs_R005_ueqv_R005NYN_partial_05_0927,
  rs_R005_ueqv_R005NYN_partial_05_0928,
  rs_R005_ueqv_R005NYN_partial_05_0929,
  rs_R005_ueqv_R005NYN_partial_05_0930,
  rs_R005_ueqv_R005NYN_partial_05_0931,
  rs_R005_ueqv_R005NYN_partial_05_0932,
  rs_R005_ueqv_R005NYN_partial_05_0933,
  rs_R005_ueqv_R005NYN_partial_05_0934,
  rs_R005_ueqv_R005NYN_partial_05_0935,
  rs_R005_ueqv_R005NYN_partial_05_0936,
  rs_R005_ueqv_R005NYN_partial_05_0937,
  rs_R005_ueqv_R005NYN_partial_05_0938,
  rs_R005_ueqv_R005NYN_partial_05_0939,
  rs_R005_ueqv_R005NYN_partial_05_0940,
  rs_R005_ueqv_R005NYN_partial_05_0941,
  rs_R005_ueqv_R005NYN_partial_05_0942,
  rs_R005_ueqv_R005NYN_partial_05_0943,
  rs_R005_ueqv_R005NYN_partial_05_0944,
  rs_R005_ueqv_R005NYN_partial_05_0945,
  rs_R005_ueqv_R005NYN_partial_05_0946,
  rs_R005_ueqv_R005NYN_partial_05_0947,
  rs_R005_ueqv_R005NYN_partial_05_0948,
  rs_R005_ueqv_R005NYN_partial_05_0949,
  rs_R005_ueqv_R005NYN_partial_05_0950,
  rs_R005_ueqv_R005NYN_partial_05_0951,
  rs_R005_ueqv_R005NYN_partial_05_0952,
  rs_R005_ueqv_R005NYN_partial_05_0953,
  rs_R005_ueqv_R005NYN_partial_05_0954,
  rs_R005_ueqv_R005NYN_partial_05_0955,
  rs_R005_ueqv_R005NYN_partial_05_0956,
  rs_R005_ueqv_R005NYN_partial_05_0957,
  rs_R005_ueqv_R005NYN_partial_05_0958,
  rs_R005_ueqv_R005NYN_partial_05_0959,
  rs_R005_ueqv_R005NYN_partial_05_0960,
  rs_R005_ueqv_R005NYN_partial_05_0961,
  rs_R005_ueqv_R005NYN_partial_05_0962,
  rs_R005_ueqv_R005NYN_partial_05_0963,
  rs_R005_ueqv_R005NYN_partial_05_0964,
  rs_R005_ueqv_R005NYN_partial_05_0965,
  rs_R005_ueqv_R005NYN_partial_05_0966,
  rs_R005_ueqv_R005NYN_partial_05_0967,
  rs_R005_ueqv_R005NYN_partial_05_0968,
  rs_R005_ueqv_R005NYN_partial_05_0969,
  rs_R005_ueqv_R005NYN_partial_05_0970,
  rs_R005_ueqv_R005NYN_partial_05_0971,
  rs_R005_ueqv_R005NYN_partial_05_0972,
  rs_R005_ueqv_R005NYN_partial_05_0973,
  rs_R005_ueqv_R005NYN_partial_05_0974,
  rs_R005_ueqv_R005NYN_partial_05_0975,
  rs_R005_ueqv_R005NYN_partial_05_0976,
  rs_R005_ueqv_R005NYN_partial_05_0977,
  rs_R005_ueqv_R005NYN_partial_05_0978,
  rs_R005_ueqv_R005NYN_partial_05_0979,
  rs_R005_ueqv_R005NYN_partial_05_0980,
  rs_R005_ueqv_R005NYN_partial_05_0981,
  rs_R005_ueqv_R005NYN_partial_05_0982,
  rs_R005_ueqv_R005NYN_partial_05_0983,
  rs_R005_ueqv_R005NYN_partial_05_0984,
  rs_R005_ueqv_R005NYN_partial_05_0985,
  rs_R005_ueqv_R005NYN_partial_05_0986,
  rs_R005_ueqv_R005NYN_partial_05_0987,
  rs_R005_ueqv_R005NYN_partial_05_0988,
  rs_R005_ueqv_R005NYN_partial_05_0989,
  rs_R005_ueqv_R005NYN_partial_05_0990,
  rs_R005_ueqv_R005NYN_partial_05_0991,
  rs_R005_ueqv_R005NYN_partial_05_0992,
  rs_R005_ueqv_R005NYN_partial_05_0993,
  rs_R005_ueqv_R005NYN_partial_05_0994,
  rs_R005_ueqv_R005NYN_partial_05_0995,
  rs_R005_ueqv_R005NYN_partial_05_0996,
  rs_R005_ueqv_R005NYN_partial_05_0997,
  rs_R005_ueqv_R005NYN_partial_05_0998,
  rs_R005_ueqv_R005NYN_partial_05_0999
]

/-- Sum of partial products in this block. -/
def rs_R005_ueqv_R005NYN_block_05_0900_0999 : Poly :=
[
  term ((-44475520 : Rat) / 385571) [(2, 1), (3, 1), (5, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-12697600 : Rat) / 158397) [(2, 1), (3, 1), (5, 1), (12, 1), (15, 2)],
  term ((44475520 : Rat) / 385571) [(2, 1), (3, 1), (5, 1), (12, 1), (15, 2), (16, 1)],
  term ((1755200 : Rat) / 52799) [(2, 1), (3, 1), (5, 1), (15, 2)],
  term ((27499128 : Rat) / 385571) [(2, 1), (3, 1), (5, 1), (15, 2), (16, 1)],
  term ((12697600 : Rat) / 158397) [(2, 1), (3, 1), (6, 1), (8, 1), (12, 1), (15, 1)],
  term ((-44475520 : Rat) / 385571) [(2, 1), (3, 1), (6, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-12697600 : Rat) / 158397) [(2, 1), (3, 1), (6, 1), (8, 1), (12, 2), (15, 1)],
  term ((44475520 : Rat) / 385571) [(2, 1), (3, 1), (6, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-22036480 : Rat) / 158397) [(2, 1), (3, 1), (6, 1), (12, 1), (15, 1)],
  term ((53641600 : Rat) / 385571) [(2, 1), (3, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((12697600 : Rat) / 158397) [(2, 1), (3, 1), (6, 1), (12, 2), (15, 1)],
  term ((-44475520 : Rat) / 385571) [(2, 1), (3, 1), (6, 1), (12, 2), (15, 1), (16, 1)],
  term ((3112960 : Rat) / 52799) [(2, 1), (3, 1), (6, 1), (15, 1)],
  term ((-9166080 : Rat) / 385571) [(2, 1), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-12697600 : Rat) / 158397) [(2, 1), (3, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((44475520 : Rat) / 385571) [(2, 1), (3, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((12697600 : Rat) / 158397) [(2, 1), (3, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((-44475520 : Rat) / 385571) [(2, 1), (3, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3112960 : Rat) / 52799) [(2, 1), (3, 1), (7, 1), (13, 1), (15, 1)],
  term ((9166080 : Rat) / 385571) [(2, 1), (3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6348800 : Rat) / 158397) [(2, 1), (3, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((22237760 : Rat) / 385571) [(2, 1), (3, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1372160 : Rat) / 158397) [(2, 1), (3, 1), (8, 1), (10, 1), (15, 1)],
  term ((-22662880 : Rat) / 385571) [(2, 1), (3, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-10158080 : Rat) / 158397) [(2, 1), (3, 1), (8, 1), (12, 1), (15, 1)],
  term ((35580416 : Rat) / 385571) [(2, 1), (3, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((12697600 : Rat) / 158397) [(2, 1), (3, 1), (8, 1), (12, 2), (15, 1)],
  term ((-44475520 : Rat) / 385571) [(2, 1), (3, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((4444160 : Rat) / 158397) [(2, 1), (3, 1), (8, 1), (14, 1), (15, 1)],
  term ((-360320 : Rat) / 385571) [(2, 1), (3, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((317440 : Rat) / 52799) [(2, 1), (3, 1), (8, 1), (15, 1)],
  term ((4267392 : Rat) / 385571) [(2, 1), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((6348800 : Rat) / 158397) [(2, 1), (3, 1), (10, 1), (14, 1), (15, 1)],
  term ((-22237760 : Rat) / 385571) [(2, 1), (3, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((510080 : Rat) / 52799) [(2, 1), (3, 1), (10, 1), (15, 1)],
  term ((7143216 : Rat) / 385571) [(2, 1), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((3112960 : Rat) / 158397) [(2, 1), (3, 1), (10, 2), (15, 1)],
  term ((-3055360 : Rat) / 385571) [(2, 1), (3, 1), (10, 2), (15, 1), (16, 1)],
  term ((4505600 : Rat) / 52799) [(2, 1), (3, 1), (12, 1), (15, 1)],
  term ((-70889856 : Rat) / 385571) [(2, 1), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-12697600 : Rat) / 158397) [(2, 1), (3, 1), (12, 2), (15, 1)],
  term ((44475520 : Rat) / 385571) [(2, 1), (3, 1), (12, 2), (15, 1), (16, 1)],
  term ((2715520 : Rat) / 52799) [(2, 1), (3, 1), (13, 1), (15, 2)],
  term ((-73330416 : Rat) / 385571) [(2, 1), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1584320 : Rat) / 158397) [(2, 1), (3, 1), (14, 1), (15, 1)],
  term ((-3767968 : Rat) / 385571) [(2, 1), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-28602904 : Rat) / 158397) [(2, 1), (3, 1), (15, 1)],
  term ((14982440 : Rat) / 385571) [(2, 1), (3, 1), (15, 1), (16, 1)],
  term ((9437440 : Rat) / 52799) [(2, 1), (4, 1), (5, 1), (6, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-131880288 : Rat) / 385571) [(2, 1), (4, 1), (5, 1), (6, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-23920640 : Rat) / 52799) [(2, 1), (4, 1), (5, 1), (6, 1), (8, 1), (12, 1), (15, 1)],
  term ((51226368 : Rat) / 385571) [(2, 1), (4, 1), (5, 1), (6, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((23920640 : Rat) / 52799) [(2, 1), (4, 1), (5, 1), (6, 1), (8, 1), (12, 2), (15, 1)],
  term ((-51226368 : Rat) / 385571) [(2, 1), (4, 1), (5, 1), (6, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-9437440 : Rat) / 52799) [(2, 1), (4, 1), (5, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((131880288 : Rat) / 385571) [(2, 1), (4, 1), (5, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((23920640 : Rat) / 52799) [(2, 1), (4, 1), (5, 1), (6, 1), (12, 1), (15, 1)],
  term ((-51226368 : Rat) / 385571) [(2, 1), (4, 1), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-23920640 : Rat) / 52799) [(2, 1), (4, 1), (5, 1), (6, 1), (12, 2), (15, 1)],
  term ((51226368 : Rat) / 385571) [(2, 1), (4, 1), (5, 1), (6, 1), (12, 2), (15, 1), (16, 1)],
  term ((23920640 : Rat) / 52799) [(2, 1), (4, 1), (5, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-51226368 : Rat) / 385571) [(2, 1), (4, 1), (5, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((23148800 : Rat) / 158397) [(2, 1), (4, 1), (5, 1), (7, 1), (8, 1), (12, 1), (15, 2)],
  term ((-249361568 : Rat) / 385571) [(2, 1), (4, 1), (5, 1), (7, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-23920640 : Rat) / 52799) [(2, 1), (4, 1), (5, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((51226368 : Rat) / 385571) [(2, 1), (4, 1), (5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-23148800 : Rat) / 158397) [(2, 1), (4, 1), (5, 1), (7, 1), (12, 1), (15, 2)],
  term ((249361568 : Rat) / 385571) [(2, 1), (4, 1), (5, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((48477184 : Rat) / 158397) [(2, 1), (4, 1), (5, 1), (8, 1), (9, 1), (12, 1), (15, 2)],
  term ((-7364032 : Rat) / 385571) [(2, 1), (4, 1), (5, 1), (8, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((11960320 : Rat) / 52799) [(2, 1), (4, 1), (5, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((-25613184 : Rat) / 385571) [(2, 1), (4, 1), (5, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((5980160 : Rat) / 52799) [(2, 1), (4, 1), (5, 1), (8, 1), (10, 1), (15, 1)],
  term ((-12806592 : Rat) / 385571) [(2, 1), (4, 1), (5, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((6225920 : Rat) / 52799) [(2, 1), (4, 1), (5, 1), (8, 1), (11, 1), (12, 1), (15, 2)],
  term ((-18332160 : Rat) / 385571) [(2, 1), (4, 1), (5, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-66179840 : Rat) / 158397) [(2, 1), (4, 1), (5, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((352320800 : Rat) / 385571) [(2, 1), (4, 1), (5, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3112960 : Rat) / 52799) [(2, 1), (4, 1), (5, 1), (8, 1), (12, 1), (15, 3)],
  term ((9166080 : Rat) / 385571) [(2, 1), (4, 1), (5, 1), (8, 1), (12, 1), (15, 3), (16, 1)],
  term ((-23920640 : Rat) / 52799) [(2, 1), (4, 1), (5, 1), (8, 1), (12, 2), (15, 1)],
  term ((51226368 : Rat) / 385571) [(2, 1), (4, 1), (5, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-5980160 : Rat) / 52799) [(2, 1), (4, 1), (5, 1), (8, 1), (14, 1), (15, 1)],
  term ((12806592 : Rat) / 385571) [(2, 1), (4, 1), (5, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((10526720 : Rat) / 52799) [(2, 1), (4, 1), (5, 1), (8, 1), (15, 1)],
  term ((-23792928 : Rat) / 385571) [(2, 1), (4, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-48477184 : Rat) / 158397) [(2, 1), (4, 1), (5, 1), (9, 1), (12, 1), (15, 2)],
  term ((7364032 : Rat) / 385571) [(2, 1), (4, 1), (5, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-11960320 : Rat) / 52799) [(2, 1), (4, 1), (5, 1), (10, 1), (14, 1), (15, 1)],
  term ((25613184 : Rat) / 385571) [(2, 1), (4, 1), (5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5980160 : Rat) / 52799) [(2, 1), (4, 1), (5, 1), (10, 1), (15, 1)],
  term ((12806592 : Rat) / 385571) [(2, 1), (4, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-6225920 : Rat) / 52799) [(2, 1), (4, 1), (5, 1), (11, 1), (12, 1), (15, 2)],
  term ((18332160 : Rat) / 385571) [(2, 1), (4, 1), (5, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((66179840 : Rat) / 158397) [(2, 1), (4, 1), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((-352320800 : Rat) / 385571) [(2, 1), (4, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-22562880 : Rat) / 52799) [(2, 1), (4, 1), (5, 1), (12, 1), (15, 1)],
  term ((14561160 : Rat) / 385571) [(2, 1), (4, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((3112960 : Rat) / 52799) [(2, 1), (4, 1), (5, 1), (12, 1), (15, 3)],
  term ((22237760 : Rat) / 385571) [(2, 2), (3, 1), (5, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((6348800 : Rat) / 158397) [(2, 2), (3, 1), (5, 1), (12, 1), (15, 2)],
  term ((-22237760 : Rat) / 385571) [(2, 2), (3, 1), (5, 1), (12, 1), (15, 2), (16, 1)],
  term ((-877600 : Rat) / 52799) [(2, 2), (3, 1), (5, 1), (15, 2)],
  term ((-13749564 : Rat) / 385571) [(2, 2), (3, 1), (5, 1), (15, 2), (16, 1)],
  term ((-6348800 : Rat) / 158397) [(2, 2), (3, 1), (6, 1), (8, 1), (12, 1), (15, 1)],
  term ((22237760 : Rat) / 385571) [(2, 2), (3, 1), (6, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((6348800 : Rat) / 158397) [(2, 2), (3, 1), (6, 1), (8, 1), (12, 2), (15, 1)],
  term ((-22237760 : Rat) / 385571) [(2, 2), (3, 1), (6, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((11018240 : Rat) / 158397) [(2, 2), (3, 1), (6, 1), (12, 1), (15, 1)],
  term ((-26820800 : Rat) / 385571) [(2, 2), (3, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-6348800 : Rat) / 158397) [(2, 2), (3, 1), (6, 1), (12, 2), (15, 1)],
  term ((22237760 : Rat) / 385571) [(2, 2), (3, 1), (6, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(2, 2), (3, 1), (6, 1), (15, 1)],
  term ((4583040 : Rat) / 385571) [(2, 2), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((6348800 : Rat) / 158397) [(2, 2), (3, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-22237760 : Rat) / 385571) [(2, 2), (3, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6348800 : Rat) / 158397) [(2, 2), (3, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((22237760 : Rat) / 385571) [(2, 2), (3, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1556480 : Rat) / 52799) [(2, 2), (3, 1), (7, 1), (13, 1), (15, 1)],
  term ((-4583040 : Rat) / 385571) [(2, 2), (3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((3174400 : Rat) / 158397) [(2, 2), (3, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((-11118880 : Rat) / 385571) [(2, 2), (3, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((686080 : Rat) / 158397) [(2, 2), (3, 1), (8, 1), (10, 1), (15, 1)],
  term ((11331440 : Rat) / 385571) [(2, 2), (3, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((5079040 : Rat) / 158397) [(2, 2), (3, 1), (8, 1), (12, 1), (15, 1)],
  term ((-17790208 : Rat) / 385571) [(2, 2), (3, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-6348800 : Rat) / 158397) [(2, 2), (3, 1), (8, 1), (12, 2), (15, 1)],
  term ((22237760 : Rat) / 385571) [(2, 2), (3, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-2222080 : Rat) / 158397) [(2, 2), (3, 1), (8, 1), (14, 1), (15, 1)],
  term ((180160 : Rat) / 385571) [(2, 2), (3, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-158720 : Rat) / 52799) [(2, 2), (3, 1), (8, 1), (15, 1)],
  term ((-2133696 : Rat) / 385571) [(2, 2), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((-3174400 : Rat) / 158397) [(2, 2), (3, 1), (10, 1), (14, 1), (15, 1)],
  term ((11118880 : Rat) / 385571) [(2, 2), (3, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-255040 : Rat) / 52799) [(2, 2), (3, 1), (10, 1), (15, 1)],
  term ((-3571608 : Rat) / 385571) [(2, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1556480 : Rat) / 158397) [(2, 2), (3, 1), (10, 2), (15, 1)],
  term ((1527680 : Rat) / 385571) [(2, 2), (3, 1), (10, 2), (15, 1), (16, 1)],
  term ((-2252800 : Rat) / 52799) [(2, 2), (3, 1), (12, 1), (15, 1)],
  term ((35444928 : Rat) / 385571) [(2, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((6348800 : Rat) / 158397) [(2, 2), (3, 1), (12, 2), (15, 1)],
  term ((-22237760 : Rat) / 385571) [(2, 2), (3, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1357760 : Rat) / 52799) [(2, 2), (3, 1), (13, 1), (15, 2)],
  term ((36665208 : Rat) / 385571) [(2, 2), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((792160 : Rat) / 158397) [(2, 2), (3, 1), (14, 1), (15, 1)],
  term ((1883984 : Rat) / 385571) [(2, 2), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((14301452 : Rat) / 158397) [(2, 2), (3, 1), (15, 1)],
  term ((-7491220 : Rat) / 385571) [(2, 2), (3, 1), (15, 1), (16, 1)],
  term ((-4718720 : Rat) / 52799) [(2, 2), (4, 1), (5, 1), (6, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((65940144 : Rat) / 385571) [(2, 2), (4, 1), (5, 1), (6, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((11960320 : Rat) / 52799) [(2, 2), (4, 1), (5, 1), (6, 1), (8, 1), (12, 1), (15, 1)],
  term ((-25613184 : Rat) / 385571) [(2, 2), (4, 1), (5, 1), (6, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-11960320 : Rat) / 52799) [(2, 2), (4, 1), (5, 1), (6, 1), (8, 1), (12, 2), (15, 1)],
  term ((25613184 : Rat) / 385571) [(2, 2), (4, 1), (5, 1), (6, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((4718720 : Rat) / 52799) [(2, 2), (4, 1), (5, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((-65940144 : Rat) / 385571) [(2, 2), (4, 1), (5, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11960320 : Rat) / 52799) [(2, 2), (4, 1), (5, 1), (6, 1), (12, 1), (15, 1)],
  term ((25613184 : Rat) / 385571) [(2, 2), (4, 1), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((11960320 : Rat) / 52799) [(2, 2), (4, 1), (5, 1), (6, 1), (12, 2), (15, 1)],
  term ((-25613184 : Rat) / 385571) [(2, 2), (4, 1), (5, 1), (6, 1), (12, 2), (15, 1), (16, 1)],
  term ((-11960320 : Rat) / 52799) [(2, 2), (4, 1), (5, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((25613184 : Rat) / 385571) [(2, 2), (4, 1), (5, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-11574400 : Rat) / 158397) [(2, 2), (4, 1), (5, 1), (7, 1), (8, 1), (12, 1), (15, 2)],
  term ((124680784 : Rat) / 385571) [(2, 2), (4, 1), (5, 1), (7, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((11960320 : Rat) / 52799) [(2, 2), (4, 1), (5, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((-25613184 : Rat) / 385571) [(2, 2), (4, 1), (5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((11574400 : Rat) / 158397) [(2, 2), (4, 1), (5, 1), (7, 1), (12, 1), (15, 2)],
  term ((-124680784 : Rat) / 385571) [(2, 2), (4, 1), (5, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((-24238592 : Rat) / 158397) [(2, 2), (4, 1), (5, 1), (8, 1), (9, 1), (12, 1), (15, 2)],
  term ((3682016 : Rat) / 385571) [(2, 2), (4, 1), (5, 1), (8, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-5980160 : Rat) / 52799) [(2, 2), (4, 1), (5, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((12806592 : Rat) / 385571) [(2, 2), (4, 1), (5, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2990080 : Rat) / 52799) [(2, 2), (4, 1), (5, 1), (8, 1), (10, 1), (15, 1)],
  term ((6403296 : Rat) / 385571) [(2, 2), (4, 1), (5, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-3112960 : Rat) / 52799) [(2, 2), (4, 1), (5, 1), (8, 1), (11, 1), (12, 1), (15, 2)],
  term ((9166080 : Rat) / 385571) [(2, 2), (4, 1), (5, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((33089920 : Rat) / 158397) [(2, 2), (4, 1), (5, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-176160400 : Rat) / 385571) [(2, 2), (4, 1), (5, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1556480 : Rat) / 52799) [(2, 2), (4, 1), (5, 1), (8, 1), (12, 1), (15, 3)],
  term ((-4583040 : Rat) / 385571) [(2, 2), (4, 1), (5, 1), (8, 1), (12, 1), (15, 3), (16, 1)],
  term ((11960320 : Rat) / 52799) [(2, 2), (4, 1), (5, 1), (8, 1), (12, 2), (15, 1)],
  term ((-25613184 : Rat) / 385571) [(2, 2), (4, 1), (5, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((2990080 : Rat) / 52799) [(2, 2), (4, 1), (5, 1), (8, 1), (14, 1), (15, 1)],
  term ((-6403296 : Rat) / 385571) [(2, 2), (4, 1), (5, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5263360 : Rat) / 52799) [(2, 2), (4, 1), (5, 1), (8, 1), (15, 1)],
  term ((11896464 : Rat) / 385571) [(2, 2), (4, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((24238592 : Rat) / 158397) [(2, 2), (4, 1), (5, 1), (9, 1), (12, 1), (15, 2)],
  term ((-3682016 : Rat) / 385571) [(2, 2), (4, 1), (5, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((5980160 : Rat) / 52799) [(2, 2), (4, 1), (5, 1), (10, 1), (14, 1), (15, 1)],
  term ((-12806592 : Rat) / 385571) [(2, 2), (4, 1), (5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((2990080 : Rat) / 52799) [(2, 2), (4, 1), (5, 1), (10, 1), (15, 1)],
  term ((-6403296 : Rat) / 385571) [(2, 2), (4, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((3112960 : Rat) / 52799) [(2, 2), (4, 1), (5, 1), (11, 1), (12, 1), (15, 2)],
  term ((-9166080 : Rat) / 385571) [(2, 2), (4, 1), (5, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-33089920 : Rat) / 158397) [(2, 2), (4, 1), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((176160400 : Rat) / 385571) [(2, 2), (4, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((11281440 : Rat) / 52799) [(2, 2), (4, 1), (5, 1), (12, 1), (15, 1)],
  term ((-7280580 : Rat) / 385571) [(2, 2), (4, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(2, 2), (4, 1), (5, 1), (12, 1), (15, 3)],
  term ((44475520 : Rat) / 385571) [(3, 1), (5, 1), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-22237760 : Rat) / 385571) [(3, 1), (5, 1), (8, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-22237760 : Rat) / 385571) [(3, 1), (5, 1), (8, 1), (12, 1), (15, 4), (16, 1)],
  term ((12697600 : Rat) / 158397) [(3, 1), (5, 1), (12, 1), (14, 1), (15, 2)],
  term ((-44475520 : Rat) / 385571) [(3, 1), (5, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-6348800 : Rat) / 158397) [(3, 1), (5, 1), (12, 1), (14, 2), (15, 2)],
  term ((22237760 : Rat) / 385571) [(3, 1), (5, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-6348800 : Rat) / 158397) [(3, 1), (5, 1), (12, 1), (15, 4)],
  term ((22237760 : Rat) / 385571) [(3, 1), (5, 1), (12, 1), (15, 4), (16, 1)],
  term ((-1755200 : Rat) / 52799) [(3, 1), (5, 1), (14, 1), (15, 2)],
  term ((-27499128 : Rat) / 385571) [(3, 1), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((877600 : Rat) / 52799) [(3, 1), (5, 1), (14, 2), (15, 2)],
  term ((13749564 : Rat) / 385571) [(3, 1), (5, 1), (14, 2), (15, 2), (16, 1)],
  term ((877600 : Rat) / 52799) [(3, 1), (5, 1), (15, 4)],
  term ((13749564 : Rat) / 385571) [(3, 1), (5, 1), (15, 4), (16, 1)],
  term ((-12697600 : Rat) / 158397) [(3, 1), (6, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((44475520 : Rat) / 385571) [(3, 1), (6, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((6348800 : Rat) / 158397) [(3, 1), (6, 1), (8, 1), (12, 1), (14, 2), (15, 1)],
  term ((-22237760 : Rat) / 385571) [(3, 1), (6, 1), (8, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((6348800 : Rat) / 158397) [(3, 1), (6, 1), (8, 1), (12, 1), (15, 3)],
  term ((-22237760 : Rat) / 385571) [(3, 1), (6, 1), (8, 1), (12, 1), (15, 3), (16, 1)],
  term ((12697600 : Rat) / 158397) [(3, 1), (6, 1), (8, 1), (12, 2), (14, 1), (15, 1)],
  term ((-44475520 : Rat) / 385571) [(3, 1), (6, 1), (8, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-6348800 : Rat) / 158397) [(3, 1), (6, 1), (8, 1), (12, 2), (14, 2), (15, 1)],
  term ((22237760 : Rat) / 385571) [(3, 1), (6, 1), (8, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((-6348800 : Rat) / 158397) [(3, 1), (6, 1), (8, 1), (12, 2), (15, 3)],
  term ((22237760 : Rat) / 385571) [(3, 1), (6, 1), (8, 1), (12, 2), (15, 3), (16, 1)],
  term ((22036480 : Rat) / 158397) [(3, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((-53641600 : Rat) / 385571) [(3, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11018240 : Rat) / 158397) [(3, 1), (6, 1), (12, 1), (14, 2), (15, 1)],
  term ((26820800 : Rat) / 385571) [(3, 1), (6, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-11018240 : Rat) / 158397) [(3, 1), (6, 1), (12, 1), (15, 3)],
  term ((26820800 : Rat) / 385571) [(3, 1), (6, 1), (12, 1), (15, 3), (16, 1)],
  term ((-12697600 : Rat) / 158397) [(3, 1), (6, 1), (12, 2), (14, 1), (15, 1)],
  term ((44475520 : Rat) / 385571) [(3, 1), (6, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((6348800 : Rat) / 158397) [(3, 1), (6, 1), (12, 2), (14, 2), (15, 1)],
  term ((-22237760 : Rat) / 385571) [(3, 1), (6, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((6348800 : Rat) / 158397) [(3, 1), (6, 1), (12, 2), (15, 3)],
  term ((-22237760 : Rat) / 385571) [(3, 1), (6, 1), (12, 2), (15, 3), (16, 1)],
  term ((-3112960 : Rat) / 52799) [(3, 1), (6, 1), (14, 1), (15, 1)],
  term ((9166080 : Rat) / 385571) [(3, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((1556480 : Rat) / 52799) [(3, 1), (6, 1), (14, 2), (15, 1)],
  term ((-4583040 : Rat) / 385571) [(3, 1), (6, 1), (14, 2), (15, 1), (16, 1)],
  term ((1556480 : Rat) / 52799) [(3, 1), (6, 1), (15, 3)],
  term ((-4583040 : Rat) / 385571) [(3, 1), (6, 1), (15, 3), (16, 1)],
  term ((12697600 : Rat) / 158397) [(3, 1), (7, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-44475520 : Rat) / 385571) [(3, 1), (7, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6348800 : Rat) / 158397) [(3, 1), (7, 1), (8, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((22237760 : Rat) / 385571) [(3, 1), (7, 1), (8, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-6348800 : Rat) / 158397) [(3, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 3)],
  term ((22237760 : Rat) / 385571) [(3, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-12697600 : Rat) / 158397) [(3, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((44475520 : Rat) / 385571) [(3, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((6348800 : Rat) / 158397) [(3, 1), (7, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-22237760 : Rat) / 385571) [(3, 1), (7, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((6348800 : Rat) / 158397) [(3, 1), (7, 1), (12, 1), (13, 1), (15, 3)],
  term ((-22237760 : Rat) / 385571) [(3, 1), (7, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((3112960 : Rat) / 52799) [(3, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((-9166080 : Rat) / 385571) [(3, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(3, 1), (7, 1), (13, 1), (14, 2), (15, 1)],
  term ((4583040 : Rat) / 385571) [(3, 1), (7, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(3, 1), (7, 1), (13, 1), (15, 3)],
  term ((4583040 : Rat) / 385571) [(3, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((1372160 : Rat) / 158397) [(3, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((22662880 : Rat) / 385571) [(3, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3174400 : Rat) / 158397) [(3, 1), (8, 1), (10, 1), (14, 1), (15, 3)],
  term ((11118880 : Rat) / 385571) [(3, 1), (8, 1), (10, 1), (14, 1), (15, 3), (16, 1)],
  term ((5662720 : Rat) / 158397) [(3, 1), (8, 1), (10, 1), (14, 2), (15, 1)],
  term ((-33569200 : Rat) / 385571) [(3, 1), (8, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3174400 : Rat) / 158397) [(3, 1), (8, 1), (10, 1), (14, 3), (15, 1)],
  term ((11118880 : Rat) / 385571) [(3, 1), (8, 1), (10, 1), (14, 3), (15, 1), (16, 1)],
  term ((-686080 : Rat) / 158397) [(3, 1), (8, 1), (10, 1), (15, 3)],
  term ((-11331440 : Rat) / 385571) [(3, 1), (8, 1), (10, 1), (15, 3), (16, 1)],
  term ((10158080 : Rat) / 158397) [(3, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-35580416 : Rat) / 385571) [(3, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5079040 : Rat) / 158397) [(3, 1), (8, 1), (12, 1), (14, 2), (15, 1)],
  term ((17790208 : Rat) / 385571) [(3, 1), (8, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-5079040 : Rat) / 158397) [(3, 1), (8, 1), (12, 1), (15, 3)],
  term ((17790208 : Rat) / 385571) [(3, 1), (8, 1), (12, 1), (15, 3), (16, 1)],
  term ((-12697600 : Rat) / 158397) [(3, 1), (8, 1), (12, 2), (14, 1), (15, 1)],
  term ((44475520 : Rat) / 385571) [(3, 1), (8, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((6348800 : Rat) / 158397) [(3, 1), (8, 1), (12, 2), (14, 2), (15, 1)],
  term ((-22237760 : Rat) / 385571) [(3, 1), (8, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((6348800 : Rat) / 158397) [(3, 1), (8, 1), (12, 2), (15, 3)],
  term ((-22237760 : Rat) / 385571) [(3, 1), (8, 1), (12, 2), (15, 3), (16, 1)],
  term ((-317440 : Rat) / 52799) [(3, 1), (8, 1), (14, 1), (15, 1)],
  term ((-4267392 : Rat) / 385571) [(3, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((2222080 : Rat) / 158397) [(3, 1), (8, 1), (14, 1), (15, 3)],
  term ((-180160 : Rat) / 385571) [(3, 1), (8, 1), (14, 1), (15, 3), (16, 1)],
  term ((-3968000 : Rat) / 158397) [(3, 1), (8, 1), (14, 2), (15, 1)],
  term ((2494016 : Rat) / 385571) [(3, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((2222080 : Rat) / 158397) [(3, 1), (8, 1), (14, 3), (15, 1)],
  term ((-180160 : Rat) / 385571) [(3, 1), (8, 1), (14, 3), (15, 1), (16, 1)],
  term ((158720 : Rat) / 52799) [(3, 1), (8, 1), (15, 3)],
  term ((2133696 : Rat) / 385571) [(3, 1), (8, 1), (15, 3), (16, 1)],
  term ((-510080 : Rat) / 52799) [(3, 1), (10, 1), (14, 1), (15, 1)],
  term ((-7143216 : Rat) / 385571) [(3, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((3174400 : Rat) / 158397) [(3, 1), (10, 1), (14, 1), (15, 3)],
  term ((-11118880 : Rat) / 385571) [(3, 1), (10, 1), (14, 1), (15, 3), (16, 1)],
  term ((-5583680 : Rat) / 158397) [(3, 1), (10, 1), (14, 2), (15, 1)],
  term ((25809368 : Rat) / 385571) [(3, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((3174400 : Rat) / 158397) [(3, 1), (10, 1), (14, 3), (15, 1)],
  term ((-11118880 : Rat) / 385571) [(3, 1), (10, 1), (14, 3), (15, 1), (16, 1)],
  term ((255040 : Rat) / 52799) [(3, 1), (10, 1), (15, 3)],
  term ((3571608 : Rat) / 385571) [(3, 1), (10, 1), (15, 3), (16, 1)],
  term ((-3112960 : Rat) / 158397) [(3, 1), (10, 2), (14, 1), (15, 1)],
  term ((3055360 : Rat) / 385571) [(3, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((1556480 : Rat) / 158397) [(3, 1), (10, 2), (14, 2), (15, 1)],
  term ((-1527680 : Rat) / 385571) [(3, 1), (10, 2), (14, 2), (15, 1), (16, 1)],
  term ((1556480 : Rat) / 158397) [(3, 1), (10, 2), (15, 3)],
  term ((-1527680 : Rat) / 385571) [(3, 1), (10, 2), (15, 3), (16, 1)],
  term ((-4505600 : Rat) / 52799) [(3, 1), (12, 1), (14, 1), (15, 1)],
  term ((70889856 : Rat) / 385571) [(3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((2252800 : Rat) / 52799) [(3, 1), (12, 1), (14, 2), (15, 1)],
  term ((-35444928 : Rat) / 385571) [(3, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((2252800 : Rat) / 52799) [(3, 1), (12, 1), (15, 3)],
  term ((-35444928 : Rat) / 385571) [(3, 1), (12, 1), (15, 3), (16, 1)],
  term ((12697600 : Rat) / 158397) [(3, 1), (12, 2), (14, 1), (15, 1)],
  term ((-44475520 : Rat) / 385571) [(3, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-6348800 : Rat) / 158397) [(3, 1), (12, 2), (14, 2), (15, 1)],
  term ((22237760 : Rat) / 385571) [(3, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((-6348800 : Rat) / 158397) [(3, 1), (12, 2), (15, 3)],
  term ((22237760 : Rat) / 385571) [(3, 1), (12, 2), (15, 3), (16, 1)],
  term ((-2715520 : Rat) / 52799) [(3, 1), (13, 1), (14, 1), (15, 2)],
  term ((73330416 : Rat) / 385571) [(3, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1357760 : Rat) / 52799) [(3, 1), (13, 1), (14, 2), (15, 2)],
  term ((-36665208 : Rat) / 385571) [(3, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((1357760 : Rat) / 52799) [(3, 1), (13, 1), (15, 4)],
  term ((-36665208 : Rat) / 385571) [(3, 1), (13, 1), (15, 4), (16, 1)],
  term ((28602904 : Rat) / 158397) [(3, 1), (14, 1), (15, 1)],
  term ((-14982440 : Rat) / 385571) [(3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-792160 : Rat) / 158397) [(3, 1), (14, 1), (15, 3)],
  term ((-1883984 : Rat) / 385571) [(3, 1), (14, 1), (15, 3), (16, 1)],
  term ((-4239044 : Rat) / 52799) [(3, 1), (14, 2), (15, 1)],
  term ((11259188 : Rat) / 385571) [(3, 1), (14, 2), (15, 1), (16, 1)],
  term ((-792160 : Rat) / 158397) [(3, 1), (14, 3), (15, 1)],
  term ((-1883984 : Rat) / 385571) [(3, 1), (14, 3), (15, 1), (16, 1)],
  term ((-14301452 : Rat) / 158397) [(3, 1), (15, 3)],
  term ((7491220 : Rat) / 385571) [(3, 1), (15, 3), (16, 1)],
  term ((-4718720 : Rat) / 52799) [(3, 2), (4, 1), (5, 1), (6, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((65940144 : Rat) / 385571) [(3, 2), (4, 1), (5, 1), (6, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((11960320 : Rat) / 52799) [(3, 2), (4, 1), (5, 1), (6, 1), (8, 1), (12, 1), (15, 1)],
  term ((-25613184 : Rat) / 385571) [(3, 2), (4, 1), (5, 1), (6, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-11960320 : Rat) / 52799) [(3, 2), (4, 1), (5, 1), (6, 1), (8, 1), (12, 2), (15, 1)],
  term ((25613184 : Rat) / 385571) [(3, 2), (4, 1), (5, 1), (6, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((4718720 : Rat) / 52799) [(3, 2), (4, 1), (5, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((-65940144 : Rat) / 385571) [(3, 2), (4, 1), (5, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11960320 : Rat) / 52799) [(3, 2), (4, 1), (5, 1), (6, 1), (12, 1), (15, 1)],
  term ((25613184 : Rat) / 385571) [(3, 2), (4, 1), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((11960320 : Rat) / 52799) [(3, 2), (4, 1), (5, 1), (6, 1), (12, 2), (15, 1)],
  term ((-25613184 : Rat) / 385571) [(3, 2), (4, 1), (5, 1), (6, 1), (12, 2), (15, 1), (16, 1)],
  term ((-11960320 : Rat) / 52799) [(3, 2), (4, 1), (5, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((25613184 : Rat) / 385571) [(3, 2), (4, 1), (5, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-11574400 : Rat) / 158397) [(3, 2), (4, 1), (5, 1), (7, 1), (8, 1), (12, 1), (15, 2)],
  term ((124680784 : Rat) / 385571) [(3, 2), (4, 1), (5, 1), (7, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((11960320 : Rat) / 52799) [(3, 2), (4, 1), (5, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((-25613184 : Rat) / 385571) [(3, 2), (4, 1), (5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((11574400 : Rat) / 158397) [(3, 2), (4, 1), (5, 1), (7, 1), (12, 1), (15, 2)],
  term ((-124680784 : Rat) / 385571) [(3, 2), (4, 1), (5, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((-24238592 : Rat) / 158397) [(3, 2), (4, 1), (5, 1), (8, 1), (9, 1), (12, 1), (15, 2)],
  term ((3682016 : Rat) / 385571) [(3, 2), (4, 1), (5, 1), (8, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-5980160 : Rat) / 52799) [(3, 2), (4, 1), (5, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((12806592 : Rat) / 385571) [(3, 2), (4, 1), (5, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2990080 : Rat) / 52799) [(3, 2), (4, 1), (5, 1), (8, 1), (10, 1), (15, 1)],
  term ((6403296 : Rat) / 385571) [(3, 2), (4, 1), (5, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-3112960 : Rat) / 52799) [(3, 2), (4, 1), (5, 1), (8, 1), (11, 1), (12, 1), (15, 2)],
  term ((9166080 : Rat) / 385571) [(3, 2), (4, 1), (5, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((33089920 : Rat) / 158397) [(3, 2), (4, 1), (5, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-176160400 : Rat) / 385571) [(3, 2), (4, 1), (5, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1556480 : Rat) / 52799) [(3, 2), (4, 1), (5, 1), (8, 1), (12, 1), (15, 3)],
  term ((-4583040 : Rat) / 385571) [(3, 2), (4, 1), (5, 1), (8, 1), (12, 1), (15, 3), (16, 1)],
  term ((11960320 : Rat) / 52799) [(3, 2), (4, 1), (5, 1), (8, 1), (12, 2), (15, 1)],
  term ((-25613184 : Rat) / 385571) [(3, 2), (4, 1), (5, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((2990080 : Rat) / 52799) [(3, 2), (4, 1), (5, 1), (8, 1), (14, 1), (15, 1)],
  term ((-6403296 : Rat) / 385571) [(3, 2), (4, 1), (5, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5263360 : Rat) / 52799) [(3, 2), (4, 1), (5, 1), (8, 1), (15, 1)],
  term ((11896464 : Rat) / 385571) [(3, 2), (4, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((24238592 : Rat) / 158397) [(3, 2), (4, 1), (5, 1), (9, 1), (12, 1), (15, 2)],
  term ((-3682016 : Rat) / 385571) [(3, 2), (4, 1), (5, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((5980160 : Rat) / 52799) [(3, 2), (4, 1), (5, 1), (10, 1), (14, 1), (15, 1)],
  term ((-12806592 : Rat) / 385571) [(3, 2), (4, 1), (5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((2990080 : Rat) / 52799) [(3, 2), (4, 1), (5, 1), (10, 1), (15, 1)],
  term ((-6403296 : Rat) / 385571) [(3, 2), (4, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((3112960 : Rat) / 52799) [(3, 2), (4, 1), (5, 1), (11, 1), (12, 1), (15, 2)],
  term ((-9166080 : Rat) / 385571) [(3, 2), (4, 1), (5, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-33089920 : Rat) / 158397) [(3, 2), (4, 1), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((176160400 : Rat) / 385571) [(3, 2), (4, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((11281440 : Rat) / 52799) [(3, 2), (4, 1), (5, 1), (12, 1), (15, 1)],
  term ((-7280580 : Rat) / 385571) [(3, 2), (4, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(3, 2), (4, 1), (5, 1), (12, 1), (15, 3)],
  term ((22237760 : Rat) / 385571) [(3, 3), (5, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((6348800 : Rat) / 158397) [(3, 3), (5, 1), (12, 1), (15, 2)],
  term ((-22237760 : Rat) / 385571) [(3, 3), (5, 1), (12, 1), (15, 2), (16, 1)],
  term ((-877600 : Rat) / 52799) [(3, 3), (5, 1), (15, 2)],
  term ((-13749564 : Rat) / 385571) [(3, 3), (5, 1), (15, 2), (16, 1)],
  term ((-6348800 : Rat) / 158397) [(3, 3), (6, 1), (8, 1), (12, 1), (15, 1)],
  term ((22237760 : Rat) / 385571) [(3, 3), (6, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((6348800 : Rat) / 158397) [(3, 3), (6, 1), (8, 1), (12, 2), (15, 1)],
  term ((-22237760 : Rat) / 385571) [(3, 3), (6, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((11018240 : Rat) / 158397) [(3, 3), (6, 1), (12, 1), (15, 1)],
  term ((-26820800 : Rat) / 385571) [(3, 3), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-6348800 : Rat) / 158397) [(3, 3), (6, 1), (12, 2), (15, 1)],
  term ((22237760 : Rat) / 385571) [(3, 3), (6, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(3, 3), (6, 1), (15, 1)],
  term ((4583040 : Rat) / 385571) [(3, 3), (6, 1), (15, 1), (16, 1)],
  term ((6348800 : Rat) / 158397) [(3, 3), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-22237760 : Rat) / 385571) [(3, 3), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6348800 : Rat) / 158397) [(3, 3), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((22237760 : Rat) / 385571) [(3, 3), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1556480 : Rat) / 52799) [(3, 3), (7, 1), (13, 1), (15, 1)],
  term ((-4583040 : Rat) / 385571) [(3, 3), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((3174400 : Rat) / 158397) [(3, 3), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((-11118880 : Rat) / 385571) [(3, 3), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((686080 : Rat) / 158397) [(3, 3), (8, 1), (10, 1), (15, 1)],
  term ((11331440 : Rat) / 385571) [(3, 3), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((5079040 : Rat) / 158397) [(3, 3), (8, 1), (12, 1), (15, 1)],
  term ((-17790208 : Rat) / 385571) [(3, 3), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-6348800 : Rat) / 158397) [(3, 3), (8, 1), (12, 2), (15, 1)],
  term ((22237760 : Rat) / 385571) [(3, 3), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-2222080 : Rat) / 158397) [(3, 3), (8, 1), (14, 1), (15, 1)],
  term ((180160 : Rat) / 385571) [(3, 3), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-158720 : Rat) / 52799) [(3, 3), (8, 1), (15, 1)],
  term ((-2133696 : Rat) / 385571) [(3, 3), (8, 1), (15, 1), (16, 1)],
  term ((-3174400 : Rat) / 158397) [(3, 3), (10, 1), (14, 1), (15, 1)],
  term ((11118880 : Rat) / 385571) [(3, 3), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-255040 : Rat) / 52799) [(3, 3), (10, 1), (15, 1)],
  term ((-3571608 : Rat) / 385571) [(3, 3), (10, 1), (15, 1), (16, 1)],
  term ((-1556480 : Rat) / 158397) [(3, 3), (10, 2), (15, 1)],
  term ((1527680 : Rat) / 385571) [(3, 3), (10, 2), (15, 1), (16, 1)],
  term ((-2252800 : Rat) / 52799) [(3, 3), (12, 1), (15, 1)],
  term ((35444928 : Rat) / 385571) [(3, 3), (12, 1), (15, 1), (16, 1)],
  term ((6348800 : Rat) / 158397) [(3, 3), (12, 2), (15, 1)],
  term ((-22237760 : Rat) / 385571) [(3, 3), (12, 2), (15, 1), (16, 1)],
  term ((-1357760 : Rat) / 52799) [(3, 3), (13, 1), (15, 2)],
  term ((36665208 : Rat) / 385571) [(3, 3), (13, 1), (15, 2), (16, 1)],
  term ((792160 : Rat) / 158397) [(3, 3), (14, 1), (15, 1)],
  term ((1883984 : Rat) / 385571) [(3, 3), (14, 1), (15, 1), (16, 1)],
  term ((14301452 : Rat) / 158397) [(3, 3), (15, 1)],
  term ((-7491220 : Rat) / 385571) [(3, 3), (15, 1), (16, 1)],
  term ((23920640 : Rat) / 52799) [(4, 1), (5, 1), (6, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-51226368 : Rat) / 385571) [(4, 1), (5, 1), (6, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((4718720 : Rat) / 52799) [(4, 1), (5, 1), (6, 1), (8, 1), (12, 1), (14, 1), (15, 3)],
  term ((-65940144 : Rat) / 385571) [(4, 1), (5, 1), (6, 1), (8, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-21397760 : Rat) / 52799) [(4, 1), (5, 1), (6, 1), (8, 1), (12, 1), (14, 2), (15, 1)],
  term ((157493472 : Rat) / 385571) [(4, 1), (5, 1), (6, 1), (8, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((4718720 : Rat) / 52799) [(4, 1), (5, 1), (6, 1), (8, 1), (12, 1), (14, 3), (15, 1)],
  term ((-65940144 : Rat) / 385571) [(4, 1), (5, 1), (6, 1), (8, 1), (12, 1), (14, 3), (15, 1), (16, 1)],
  term ((-11960320 : Rat) / 52799) [(4, 1), (5, 1), (6, 1), (8, 1), (12, 1), (15, 3)],
  term ((25613184 : Rat) / 385571) [(4, 1), (5, 1), (6, 1), (8, 1), (12, 1), (15, 3), (16, 1)],
  term ((-23920640 : Rat) / 52799) [(4, 1), (5, 1), (6, 1), (8, 1), (12, 2), (14, 1), (15, 1)],
  term ((51226368 : Rat) / 385571) [(4, 1), (5, 1), (6, 1), (8, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((11960320 : Rat) / 52799) [(4, 1), (5, 1), (6, 1), (8, 1), (12, 2), (14, 2), (15, 1)],
  term ((-25613184 : Rat) / 385571) [(4, 1), (5, 1), (6, 1), (8, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((11960320 : Rat) / 52799) [(4, 1), (5, 1), (6, 1), (8, 1), (12, 2), (15, 3)],
  term ((-25613184 : Rat) / 385571) [(4, 1), (5, 1), (6, 1), (8, 1), (12, 2), (15, 3), (16, 1)],
  term ((-23920640 : Rat) / 52799) [(4, 1), (5, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((51226368 : Rat) / 385571) [(4, 1), (5, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4718720 : Rat) / 52799) [(4, 1), (5, 1), (6, 1), (12, 1), (14, 1), (15, 3)],
  term ((65940144 : Rat) / 385571) [(4, 1), (5, 1), (6, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((21397760 : Rat) / 52799) [(4, 1), (5, 1), (6, 1), (12, 1), (14, 2), (15, 1)],
  term ((-157493472 : Rat) / 385571) [(4, 1), (5, 1), (6, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-4718720 : Rat) / 52799) [(4, 1), (5, 1), (6, 1), (12, 1), (14, 3), (15, 1)],
  term ((65940144 : Rat) / 385571) [(4, 1), (5, 1), (6, 1), (12, 1), (14, 3), (15, 1), (16, 1)],
  term ((11960320 : Rat) / 52799) [(4, 1), (5, 1), (6, 1), (12, 1), (15, 3)],
  term ((-25613184 : Rat) / 385571) [(4, 1), (5, 1), (6, 1), (12, 1), (15, 3), (16, 1)],
  term ((23920640 : Rat) / 52799) [(4, 1), (5, 1), (6, 1), (12, 2), (14, 1), (15, 1)],
  term ((-51226368 : Rat) / 385571) [(4, 1), (5, 1), (6, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-11960320 : Rat) / 52799) [(4, 1), (5, 1), (6, 1), (12, 2), (14, 2), (15, 1)],
  term ((25613184 : Rat) / 385571) [(4, 1), (5, 1), (6, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((-11960320 : Rat) / 52799) [(4, 1), (5, 1), (6, 1), (12, 2), (15, 3)],
  term ((25613184 : Rat) / 385571) [(4, 1), (5, 1), (6, 1), (12, 2), (15, 3), (16, 1)],
  term ((-23920640 : Rat) / 52799) [(4, 1), (5, 1), (7, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((51226368 : Rat) / 385571) [(4, 1), (5, 1), (7, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((11960320 : Rat) / 52799) [(4, 1), (5, 1), (7, 1), (8, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-25613184 : Rat) / 385571) [(4, 1), (5, 1), (7, 1), (8, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((11960320 : Rat) / 52799) [(4, 1), (5, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 3)],
  term ((-25613184 : Rat) / 385571) [(4, 1), (5, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-23148800 : Rat) / 158397) [(4, 1), (5, 1), (7, 1), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((249361568 : Rat) / 385571) [(4, 1), (5, 1), (7, 1), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((11574400 : Rat) / 158397) [(4, 1), (5, 1), (7, 1), (8, 1), (12, 1), (14, 2), (15, 2)],
  term ((-124680784 : Rat) / 385571) [(4, 1), (5, 1), (7, 1), (8, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((11574400 : Rat) / 158397) [(4, 1), (5, 1), (7, 1), (8, 1), (12, 1), (15, 4)],
  term ((-124680784 : Rat) / 385571) [(4, 1), (5, 1), (7, 1), (8, 1), (12, 1), (15, 4), (16, 1)],
  term ((23920640 : Rat) / 52799) [(4, 1), (5, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-51226368 : Rat) / 385571) [(4, 1), (5, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11960320 : Rat) / 52799) [(4, 1), (5, 1), (7, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((25613184 : Rat) / 385571) [(4, 1), (5, 1), (7, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-11960320 : Rat) / 52799) [(4, 1), (5, 1), (7, 1), (12, 1), (13, 1), (15, 3)],
  term ((25613184 : Rat) / 385571) [(4, 1), (5, 1), (7, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((23148800 : Rat) / 158397) [(4, 1), (5, 1), (7, 1), (12, 1), (14, 1), (15, 2)],
  term ((-249361568 : Rat) / 385571) [(4, 1), (5, 1), (7, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-11574400 : Rat) / 158397) [(4, 1), (5, 1), (7, 1), (12, 1), (14, 2), (15, 2)],
  term ((124680784 : Rat) / 385571) [(4, 1), (5, 1), (7, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-11574400 : Rat) / 158397) [(4, 1), (5, 1), (7, 1), (12, 1), (15, 4)],
  term ((124680784 : Rat) / 385571) [(4, 1), (5, 1), (7, 1), (12, 1), (15, 4), (16, 1)],
  term ((-48477184 : Rat) / 158397) [(4, 1), (5, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 2)],
  term ((7364032 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((24238592 : Rat) / 158397) [(4, 1), (5, 1), (8, 1), (9, 1), (12, 1), (14, 2), (15, 2)],
  term ((-3682016 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (9, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((24238592 : Rat) / 158397) [(4, 1), (5, 1), (8, 1), (9, 1), (12, 1), (15, 4)],
  term ((-3682016 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (9, 1), (12, 1), (15, 4), (16, 1)],
  term ((-5980160 : Rat) / 52799) [(4, 1), (5, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((12806592 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((5980160 : Rat) / 52799) [(4, 1), (5, 1), (8, 1), (10, 1), (14, 1), (15, 3)],
  term ((-12806592 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (10, 1), (14, 1), (15, 3), (16, 1)],
  term ((-8970240 : Rat) / 52799) [(4, 1), (5, 1), (8, 1), (10, 1), (14, 2), (15, 1)],
  term ((19209888 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((5980160 : Rat) / 52799) [(4, 1), (5, 1), (8, 1), (10, 1), (14, 3), (15, 1)],
  term ((-12806592 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (10, 1), (14, 3), (15, 1), (16, 1)],
  term ((2990080 : Rat) / 52799) [(4, 1), (5, 1), (8, 1), (10, 1), (15, 3)],
  term ((-6403296 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (10, 1), (15, 3), (16, 1)],
  term ((-6225920 : Rat) / 52799) [(4, 1), (5, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((18332160 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((3112960 : Rat) / 52799) [(4, 1), (5, 1), (8, 1), (11, 1), (12, 1), (14, 2), (15, 2)],
  term ((-9166080 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (11, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((3112960 : Rat) / 52799) [(4, 1), (5, 1), (8, 1), (11, 1), (12, 1), (15, 4)],
  term ((-9166080 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (11, 1), (12, 1), (15, 4), (16, 1)],
  term ((-641920 : Rat) / 4281) [(4, 1), (5, 1), (8, 1), (12, 1), (14, 1), (15, 3)],
  term ((166994320 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((66179840 : Rat) / 158397) [(4, 1), (5, 1), (8, 1), (12, 1), (14, 2), (15, 1)],
  term ((-352320800 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(4, 1), (5, 1), (8, 1), (12, 1), (14, 2), (15, 3)],
  term ((4583040 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (12, 1), (14, 2), (15, 3), (16, 1)],
  term ((-33089920 : Rat) / 158397) [(4, 1), (5, 1), (8, 1), (12, 1), (14, 3), (15, 1)],
  term ((176160400 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (12, 1), (14, 3), (15, 1), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(4, 1), (5, 1), (8, 1), (12, 1), (15, 5)],
  term ((4583040 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (12, 1), (15, 5), (16, 1)],
  term ((23920640 : Rat) / 52799) [(4, 1), (5, 1), (8, 1), (12, 2), (14, 1), (15, 1)],
  term ((-51226368 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-11960320 : Rat) / 52799) [(4, 1), (5, 1), (8, 1), (12, 2), (14, 2), (15, 1)],
  term ((25613184 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((-11960320 : Rat) / 52799) [(4, 1), (5, 1), (8, 1), (12, 2), (15, 3)],
  term ((25613184 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (12, 2), (15, 3), (16, 1)],
  term ((-10526720 : Rat) / 52799) [(4, 1), (5, 1), (8, 1), (14, 1), (15, 1)],
  term ((23792928 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2990080 : Rat) / 52799) [(4, 1), (5, 1), (8, 1), (14, 1), (15, 3)],
  term ((6403296 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (14, 1), (15, 3), (16, 1)],
  term ((11243520 : Rat) / 52799) [(4, 1), (5, 1), (8, 1), (14, 2), (15, 1)],
  term ((-24703056 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2990080 : Rat) / 52799) [(4, 1), (5, 1), (8, 1), (14, 3), (15, 1)],
  term ((6403296 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (14, 3), (15, 1), (16, 1)],
  term ((5263360 : Rat) / 52799) [(4, 1), (5, 1), (8, 1), (15, 3)],
  term ((-11896464 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (15, 3), (16, 1)],
  term ((48477184 : Rat) / 158397) [(4, 1), (5, 1), (9, 1), (12, 1), (14, 1), (15, 2)],
  term ((-7364032 : Rat) / 385571) [(4, 1), (5, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-24238592 : Rat) / 158397) [(4, 1), (5, 1), (9, 1), (12, 1), (14, 2), (15, 2)],
  term ((3682016 : Rat) / 385571) [(4, 1), (5, 1), (9, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-24238592 : Rat) / 158397) [(4, 1), (5, 1), (9, 1), (12, 1), (15, 4)],
  term ((3682016 : Rat) / 385571) [(4, 1), (5, 1), (9, 1), (12, 1), (15, 4), (16, 1)],
  term ((5980160 : Rat) / 52799) [(4, 1), (5, 1), (10, 1), (14, 1), (15, 1)],
  term ((-12806592 : Rat) / 385571) [(4, 1), (5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5980160 : Rat) / 52799) [(4, 1), (5, 1), (10, 1), (14, 1), (15, 3)],
  term ((12806592 : Rat) / 385571) [(4, 1), (5, 1), (10, 1), (14, 1), (15, 3), (16, 1)],
  term ((8970240 : Rat) / 52799) [(4, 1), (5, 1), (10, 1), (14, 2), (15, 1)],
  term ((-19209888 : Rat) / 385571) [(4, 1), (5, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-5980160 : Rat) / 52799) [(4, 1), (5, 1), (10, 1), (14, 3), (15, 1)],
  term ((12806592 : Rat) / 385571) [(4, 1), (5, 1), (10, 1), (14, 3), (15, 1), (16, 1)],
  term ((-2990080 : Rat) / 52799) [(4, 1), (5, 1), (10, 1), (15, 3)],
  term ((6403296 : Rat) / 385571) [(4, 1), (5, 1), (10, 1), (15, 3), (16, 1)],
  term ((6225920 : Rat) / 52799) [(4, 1), (5, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((-18332160 : Rat) / 385571) [(4, 1), (5, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3112960 : Rat) / 52799) [(4, 1), (5, 1), (11, 1), (12, 1), (14, 2), (15, 2)],
  term ((9166080 : Rat) / 385571) [(4, 1), (5, 1), (11, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-3112960 : Rat) / 52799) [(4, 1), (5, 1), (11, 1), (12, 1), (15, 4)],
  term ((9166080 : Rat) / 385571) [(4, 1), (5, 1), (11, 1), (12, 1), (15, 4), (16, 1)],
  term ((22562880 : Rat) / 52799) [(4, 1), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((-14561160 : Rat) / 385571) [(4, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((641920 : Rat) / 4281) [(4, 1), (5, 1), (12, 1), (14, 1), (15, 3)],
  term ((-176160400 : Rat) / 385571) [(4, 1), (5, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-100024160 : Rat) / 158397) [(4, 1), (5, 1), (12, 1), (14, 2), (15, 1)],
  term ((359601380 : Rat) / 385571) [(4, 1), (5, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((1556480 : Rat) / 52799) [(4, 1), (5, 1), (12, 1), (14, 2), (15, 3)],
  term ((33089920 : Rat) / 158397) [(4, 1), (5, 1), (12, 1), (14, 3), (15, 1)],
  term ((-176160400 : Rat) / 385571) [(4, 1), (5, 1), (12, 1), (14, 3), (15, 1), (16, 1)],
  term ((-11281440 : Rat) / 52799) [(4, 1), (5, 1), (12, 1), (15, 3)],
  term ((7280580 : Rat) / 385571) [(4, 1), (5, 1), (12, 1), (15, 3), (16, 1)],
  term ((1556480 : Rat) / 52799) [(4, 1), (5, 1), (12, 1), (15, 5)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 5, terms 900 through 999. -/
theorem rs_R005_ueqv_R005NYN_block_05_0900_0999_valid :
    checkProductSumEq rs_R005_ueqv_R005NYN_partials_05_0900_0999
      rs_R005_ueqv_R005NYN_block_05_0900_0999 = true := by
  native_decide

end R005UeqvR005NYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
