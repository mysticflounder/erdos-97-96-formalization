/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R005:u=v:R005NYN, term block 5:1000-1099

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R005UeqvR005NYNTermShards

/-- Generator polynomial 5 for relaxed split surplus certificate `R005:u=v:R005NYN`. -/
def rs_R005_ueqv_R005NYN_generator_05_1000_1099 : Poly :=
[
  term (-2 : Rat) [(2, 1)],
  term (1 : Rat) [(2, 2)],
  term (1 : Rat) [(3, 2)],
  term (2 : Rat) [(14, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 1000 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_1000 : Poly :=
[
  term ((4583040 : Rat) / 385571) [(4, 1), (5, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 1000 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_1000 : Poly :=
[
  term ((-9166080 : Rat) / 385571) [(2, 1), (4, 1), (5, 1), (12, 1), (15, 3), (16, 1)],
  term ((4583040 : Rat) / 385571) [(2, 2), (4, 1), (5, 1), (12, 1), (15, 3), (16, 1)],
  term ((4583040 : Rat) / 385571) [(3, 2), (4, 1), (5, 1), (12, 1), (15, 3), (16, 1)],
  term ((9166080 : Rat) / 385571) [(4, 1), (5, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(4, 1), (5, 1), (12, 1), (14, 2), (15, 3), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(4, 1), (5, 1), (12, 1), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1000 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_1000_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_1000
        rs_R005_ueqv_R005NYN_generator_05_1000_1099 =
      rs_R005_ueqv_R005NYN_partial_05_1000 := by
  native_decide

/-- Coefficient term 1001 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_1001 : Poly :=
[
  term ((-11960320 : Rat) / 52799) [(4, 1), (5, 1), (12, 2), (15, 1)]
]

/-- Partial product 1001 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_1001 : Poly :=
[
  term ((23920640 : Rat) / 52799) [(2, 1), (4, 1), (5, 1), (12, 2), (15, 1)],
  term ((-11960320 : Rat) / 52799) [(2, 2), (4, 1), (5, 1), (12, 2), (15, 1)],
  term ((-11960320 : Rat) / 52799) [(3, 2), (4, 1), (5, 1), (12, 2), (15, 1)],
  term ((-23920640 : Rat) / 52799) [(4, 1), (5, 1), (12, 2), (14, 1), (15, 1)],
  term ((11960320 : Rat) / 52799) [(4, 1), (5, 1), (12, 2), (14, 2), (15, 1)],
  term ((11960320 : Rat) / 52799) [(4, 1), (5, 1), (12, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1001 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_1001_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_1001
        rs_R005_ueqv_R005NYN_generator_05_1000_1099 =
      rs_R005_ueqv_R005NYN_partial_05_1001 := by
  native_decide

/-- Coefficient term 1002 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_1002 : Poly :=
[
  term ((25613184 : Rat) / 385571) [(4, 1), (5, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 1002 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_1002 : Poly :=
[
  term ((-51226368 : Rat) / 385571) [(2, 1), (4, 1), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((25613184 : Rat) / 385571) [(2, 2), (4, 1), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((25613184 : Rat) / 385571) [(3, 2), (4, 1), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((51226368 : Rat) / 385571) [(4, 1), (5, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-25613184 : Rat) / 385571) [(4, 1), (5, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((-25613184 : Rat) / 385571) [(4, 1), (5, 1), (12, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1002 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_1002_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_1002
        rs_R005_ueqv_R005NYN_generator_05_1000_1099 =
      rs_R005_ueqv_R005NYN_partial_05_1002 := by
  native_decide

/-- Coefficient term 1003 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_1003 : Poly :=
[
  term ((-25167488 : Rat) / 158397) [(4, 1), (5, 1), (14, 1), (15, 1)]
]

/-- Partial product 1003 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_1003 : Poly :=
[
  term ((50334976 : Rat) / 158397) [(2, 1), (4, 1), (5, 1), (14, 1), (15, 1)],
  term ((-25167488 : Rat) / 158397) [(2, 2), (4, 1), (5, 1), (14, 1), (15, 1)],
  term ((-25167488 : Rat) / 158397) [(3, 2), (4, 1), (5, 1), (14, 1), (15, 1)],
  term ((25167488 : Rat) / 158397) [(4, 1), (5, 1), (14, 1), (15, 3)],
  term ((-50334976 : Rat) / 158397) [(4, 1), (5, 1), (14, 2), (15, 1)],
  term ((25167488 : Rat) / 158397) [(4, 1), (5, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1003 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_1003_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_1003
        rs_R005_ueqv_R005NYN_generator_05_1000_1099 =
      rs_R005_ueqv_R005NYN_partial_05_1003 := by
  native_decide

/-- Coefficient term 1004 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_1004 : Poly :=
[
  term ((14872856 : Rat) / 385571) [(4, 1), (5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1004 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_1004 : Poly :=
[
  term ((-29745712 : Rat) / 385571) [(2, 1), (4, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((14872856 : Rat) / 385571) [(2, 2), (4, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((14872856 : Rat) / 385571) [(3, 2), (4, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-14872856 : Rat) / 385571) [(4, 1), (5, 1), (14, 1), (15, 3), (16, 1)],
  term ((29745712 : Rat) / 385571) [(4, 1), (5, 1), (14, 2), (15, 1), (16, 1)],
  term ((-14872856 : Rat) / 385571) [(4, 1), (5, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1004 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_1004_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_1004
        rs_R005_ueqv_R005NYN_generator_05_1000_1099 =
      rs_R005_ueqv_R005NYN_partial_05_1004 := by
  native_decide

/-- Coefficient term 1005 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_1005 : Poly :=
[
  term ((-5330524 : Rat) / 158397) [(4, 1), (5, 1), (15, 1)]
]

/-- Partial product 1005 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_1005 : Poly :=
[
  term ((10661048 : Rat) / 158397) [(2, 1), (4, 1), (5, 1), (15, 1)],
  term ((-5330524 : Rat) / 158397) [(2, 2), (4, 1), (5, 1), (15, 1)],
  term ((-5330524 : Rat) / 158397) [(3, 2), (4, 1), (5, 1), (15, 1)],
  term ((-10661048 : Rat) / 158397) [(4, 1), (5, 1), (14, 1), (15, 1)],
  term ((5330524 : Rat) / 158397) [(4, 1), (5, 1), (14, 2), (15, 1)],
  term ((5330524 : Rat) / 158397) [(4, 1), (5, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1005 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_1005_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_1005
        rs_R005_ueqv_R005NYN_generator_05_1000_1099 =
      rs_R005_ueqv_R005NYN_partial_05_1005 := by
  native_decide

/-- Coefficient term 1006 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_1006 : Poly :=
[
  term ((3201648 : Rat) / 385571) [(4, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 1006 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_1006 : Poly :=
[
  term ((-6403296 : Rat) / 385571) [(2, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((3201648 : Rat) / 385571) [(2, 2), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((3201648 : Rat) / 385571) [(3, 2), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((6403296 : Rat) / 385571) [(4, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3201648 : Rat) / 385571) [(4, 1), (5, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3201648 : Rat) / 385571) [(4, 1), (5, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1006 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_1006_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_1006
        rs_R005_ueqv_R005NYN_generator_05_1000_1099 =
      rs_R005_ueqv_R005NYN_partial_05_1006 := by
  native_decide

/-- Coefficient term 1007 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_1007 : Poly :=
[
  term ((11960320 : Rat) / 52799) [(4, 1), (5, 2), (8, 1), (12, 1), (15, 2)]
]

/-- Partial product 1007 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_1007 : Poly :=
[
  term ((-23920640 : Rat) / 52799) [(2, 1), (4, 1), (5, 2), (8, 1), (12, 1), (15, 2)],
  term ((11960320 : Rat) / 52799) [(2, 2), (4, 1), (5, 2), (8, 1), (12, 1), (15, 2)],
  term ((11960320 : Rat) / 52799) [(3, 2), (4, 1), (5, 2), (8, 1), (12, 1), (15, 2)],
  term ((23920640 : Rat) / 52799) [(4, 1), (5, 2), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((-11960320 : Rat) / 52799) [(4, 1), (5, 2), (8, 1), (12, 1), (14, 2), (15, 2)],
  term ((-11960320 : Rat) / 52799) [(4, 1), (5, 2), (8, 1), (12, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1007 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_1007_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_1007
        rs_R005_ueqv_R005NYN_generator_05_1000_1099 =
      rs_R005_ueqv_R005NYN_partial_05_1007 := by
  native_decide

/-- Coefficient term 1008 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_1008 : Poly :=
[
  term ((-25613184 : Rat) / 385571) [(4, 1), (5, 2), (8, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1008 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_1008 : Poly :=
[
  term ((51226368 : Rat) / 385571) [(2, 1), (4, 1), (5, 2), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-25613184 : Rat) / 385571) [(2, 2), (4, 1), (5, 2), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-25613184 : Rat) / 385571) [(3, 2), (4, 1), (5, 2), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-51226368 : Rat) / 385571) [(4, 1), (5, 2), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((25613184 : Rat) / 385571) [(4, 1), (5, 2), (8, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((25613184 : Rat) / 385571) [(4, 1), (5, 2), (8, 1), (12, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1008 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_1008_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_1008
        rs_R005_ueqv_R005NYN_generator_05_1000_1099 =
      rs_R005_ueqv_R005NYN_partial_05_1008 := by
  native_decide

/-- Coefficient term 1009 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_1009 : Poly :=
[
  term ((-11960320 : Rat) / 52799) [(4, 1), (5, 2), (12, 1), (15, 2)]
]

/-- Partial product 1009 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_1009 : Poly :=
[
  term ((23920640 : Rat) / 52799) [(2, 1), (4, 1), (5, 2), (12, 1), (15, 2)],
  term ((-11960320 : Rat) / 52799) [(2, 2), (4, 1), (5, 2), (12, 1), (15, 2)],
  term ((-11960320 : Rat) / 52799) [(3, 2), (4, 1), (5, 2), (12, 1), (15, 2)],
  term ((-23920640 : Rat) / 52799) [(4, 1), (5, 2), (12, 1), (14, 1), (15, 2)],
  term ((11960320 : Rat) / 52799) [(4, 1), (5, 2), (12, 1), (14, 2), (15, 2)],
  term ((11960320 : Rat) / 52799) [(4, 1), (5, 2), (12, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1009 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_1009_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_1009
        rs_R005_ueqv_R005NYN_generator_05_1000_1099 =
      rs_R005_ueqv_R005NYN_partial_05_1009 := by
  native_decide

/-- Coefficient term 1010 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_1010 : Poly :=
[
  term ((25613184 : Rat) / 385571) [(4, 1), (5, 2), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1010 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_1010 : Poly :=
[
  term ((-51226368 : Rat) / 385571) [(2, 1), (4, 1), (5, 2), (12, 1), (15, 2), (16, 1)],
  term ((25613184 : Rat) / 385571) [(2, 2), (4, 1), (5, 2), (12, 1), (15, 2), (16, 1)],
  term ((25613184 : Rat) / 385571) [(3, 2), (4, 1), (5, 2), (12, 1), (15, 2), (16, 1)],
  term ((51226368 : Rat) / 385571) [(4, 1), (5, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-25613184 : Rat) / 385571) [(4, 1), (5, 2), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-25613184 : Rat) / 385571) [(4, 1), (5, 2), (12, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1010 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_1010_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_1010
        rs_R005_ueqv_R005NYN_generator_05_1000_1099 =
      rs_R005_ueqv_R005NYN_partial_05_1010 := by
  native_decide

/-- Coefficient term 1011 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_1011 : Poly :=
[
  term ((-11574400 : Rat) / 158397) [(4, 1), (6, 1), (7, 1), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 1011 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_1011 : Poly :=
[
  term ((23148800 : Rat) / 158397) [(2, 1), (4, 1), (6, 1), (7, 1), (8, 1), (12, 1), (15, 1)],
  term ((-11574400 : Rat) / 158397) [(2, 2), (4, 1), (6, 1), (7, 1), (8, 1), (12, 1), (15, 1)],
  term ((-11574400 : Rat) / 158397) [(3, 2), (4, 1), (6, 1), (7, 1), (8, 1), (12, 1), (15, 1)],
  term ((-23148800 : Rat) / 158397) [(4, 1), (6, 1), (7, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((11574400 : Rat) / 158397) [(4, 1), (6, 1), (7, 1), (8, 1), (12, 1), (14, 2), (15, 1)],
  term ((11574400 : Rat) / 158397) [(4, 1), (6, 1), (7, 1), (8, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1011 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_1011_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_1011
        rs_R005_ueqv_R005NYN_generator_05_1000_1099 =
      rs_R005_ueqv_R005NYN_partial_05_1011 := by
  native_decide

/-- Coefficient term 1012 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_1012 : Poly :=
[
  term ((124680784 : Rat) / 385571) [(4, 1), (6, 1), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1012 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_1012 : Poly :=
[
  term ((-249361568 : Rat) / 385571) [(2, 1), (4, 1), (6, 1), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((124680784 : Rat) / 385571) [(2, 2), (4, 1), (6, 1), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((124680784 : Rat) / 385571) [(3, 2), (4, 1), (6, 1), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((249361568 : Rat) / 385571) [(4, 1), (6, 1), (7, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-124680784 : Rat) / 385571) [(4, 1), (6, 1), (7, 1), (8, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-124680784 : Rat) / 385571) [(4, 1), (6, 1), (7, 1), (8, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1012 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_1012_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_1012
        rs_R005_ueqv_R005NYN_generator_05_1000_1099 =
      rs_R005_ueqv_R005NYN_partial_05_1012 := by
  native_decide

/-- Coefficient term 1013 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_1013 : Poly :=
[
  term ((11574400 : Rat) / 158397) [(4, 1), (6, 1), (7, 1), (8, 1), (12, 2), (15, 1)]
]

/-- Partial product 1013 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_1013 : Poly :=
[
  term ((-23148800 : Rat) / 158397) [(2, 1), (4, 1), (6, 1), (7, 1), (8, 1), (12, 2), (15, 1)],
  term ((11574400 : Rat) / 158397) [(2, 2), (4, 1), (6, 1), (7, 1), (8, 1), (12, 2), (15, 1)],
  term ((11574400 : Rat) / 158397) [(3, 2), (4, 1), (6, 1), (7, 1), (8, 1), (12, 2), (15, 1)],
  term ((23148800 : Rat) / 158397) [(4, 1), (6, 1), (7, 1), (8, 1), (12, 2), (14, 1), (15, 1)],
  term ((-11574400 : Rat) / 158397) [(4, 1), (6, 1), (7, 1), (8, 1), (12, 2), (14, 2), (15, 1)],
  term ((-11574400 : Rat) / 158397) [(4, 1), (6, 1), (7, 1), (8, 1), (12, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1013 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_1013_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_1013
        rs_R005_ueqv_R005NYN_generator_05_1000_1099 =
      rs_R005_ueqv_R005NYN_partial_05_1013 := by
  native_decide

/-- Coefficient term 1014 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_1014 : Poly :=
[
  term ((-124680784 : Rat) / 385571) [(4, 1), (6, 1), (7, 1), (8, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 1014 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_1014 : Poly :=
[
  term ((249361568 : Rat) / 385571) [(2, 1), (4, 1), (6, 1), (7, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-124680784 : Rat) / 385571) [(2, 2), (4, 1), (6, 1), (7, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-124680784 : Rat) / 385571) [(3, 2), (4, 1), (6, 1), (7, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-249361568 : Rat) / 385571) [(4, 1), (6, 1), (7, 1), (8, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((124680784 : Rat) / 385571) [(4, 1), (6, 1), (7, 1), (8, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((124680784 : Rat) / 385571) [(4, 1), (6, 1), (7, 1), (8, 1), (12, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1014 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_1014_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_1014
        rs_R005_ueqv_R005NYN_generator_05_1000_1099 =
      rs_R005_ueqv_R005NYN_partial_05_1014 := by
  native_decide

/-- Coefficient term 1015 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_1015 : Poly :=
[
  term ((11574400 : Rat) / 158397) [(4, 1), (6, 1), (7, 1), (12, 1), (15, 1)]
]

/-- Partial product 1015 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_1015 : Poly :=
[
  term ((-23148800 : Rat) / 158397) [(2, 1), (4, 1), (6, 1), (7, 1), (12, 1), (15, 1)],
  term ((11574400 : Rat) / 158397) [(2, 2), (4, 1), (6, 1), (7, 1), (12, 1), (15, 1)],
  term ((11574400 : Rat) / 158397) [(3, 2), (4, 1), (6, 1), (7, 1), (12, 1), (15, 1)],
  term ((23148800 : Rat) / 158397) [(4, 1), (6, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-11574400 : Rat) / 158397) [(4, 1), (6, 1), (7, 1), (12, 1), (14, 2), (15, 1)],
  term ((-11574400 : Rat) / 158397) [(4, 1), (6, 1), (7, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1015 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_1015_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_1015
        rs_R005_ueqv_R005NYN_generator_05_1000_1099 =
      rs_R005_ueqv_R005NYN_partial_05_1015 := by
  native_decide

/-- Coefficient term 1016 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_1016 : Poly :=
[
  term ((-124680784 : Rat) / 385571) [(4, 1), (6, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1016 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_1016 : Poly :=
[
  term ((249361568 : Rat) / 385571) [(2, 1), (4, 1), (6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-124680784 : Rat) / 385571) [(2, 2), (4, 1), (6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-124680784 : Rat) / 385571) [(3, 2), (4, 1), (6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-249361568 : Rat) / 385571) [(4, 1), (6, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((124680784 : Rat) / 385571) [(4, 1), (6, 1), (7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((124680784 : Rat) / 385571) [(4, 1), (6, 1), (7, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1016 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_1016_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_1016
        rs_R005_ueqv_R005NYN_generator_05_1000_1099 =
      rs_R005_ueqv_R005NYN_partial_05_1016 := by
  native_decide

/-- Coefficient term 1017 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_1017 : Poly :=
[
  term ((-11574400 : Rat) / 158397) [(4, 1), (6, 1), (7, 1), (12, 2), (15, 1)]
]

/-- Partial product 1017 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_1017 : Poly :=
[
  term ((23148800 : Rat) / 158397) [(2, 1), (4, 1), (6, 1), (7, 1), (12, 2), (15, 1)],
  term ((-11574400 : Rat) / 158397) [(2, 2), (4, 1), (6, 1), (7, 1), (12, 2), (15, 1)],
  term ((-11574400 : Rat) / 158397) [(3, 2), (4, 1), (6, 1), (7, 1), (12, 2), (15, 1)],
  term ((-23148800 : Rat) / 158397) [(4, 1), (6, 1), (7, 1), (12, 2), (14, 1), (15, 1)],
  term ((11574400 : Rat) / 158397) [(4, 1), (6, 1), (7, 1), (12, 2), (14, 2), (15, 1)],
  term ((11574400 : Rat) / 158397) [(4, 1), (6, 1), (7, 1), (12, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1017 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_1017_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_1017
        rs_R005_ueqv_R005NYN_generator_05_1000_1099 =
      rs_R005_ueqv_R005NYN_partial_05_1017 := by
  native_decide

/-- Coefficient term 1018 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_1018 : Poly :=
[
  term ((124680784 : Rat) / 385571) [(4, 1), (6, 1), (7, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 1018 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_1018 : Poly :=
[
  term ((-249361568 : Rat) / 385571) [(2, 1), (4, 1), (6, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((124680784 : Rat) / 385571) [(2, 2), (4, 1), (6, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((124680784 : Rat) / 385571) [(3, 2), (4, 1), (6, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((249361568 : Rat) / 385571) [(4, 1), (6, 1), (7, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-124680784 : Rat) / 385571) [(4, 1), (6, 1), (7, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((-124680784 : Rat) / 385571) [(4, 1), (6, 1), (7, 1), (12, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1018 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_1018_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_1018
        rs_R005_ueqv_R005NYN_generator_05_1000_1099 =
      rs_R005_ueqv_R005NYN_partial_05_1018 := by
  native_decide

/-- Coefficient term 1019 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_1019 : Poly :=
[
  term ((-24238592 : Rat) / 158397) [(4, 1), (6, 1), (8, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 1019 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_1019 : Poly :=
[
  term ((48477184 : Rat) / 158397) [(2, 1), (4, 1), (6, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-24238592 : Rat) / 158397) [(2, 2), (4, 1), (6, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-24238592 : Rat) / 158397) [(3, 2), (4, 1), (6, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-48477184 : Rat) / 158397) [(4, 1), (6, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((24238592 : Rat) / 158397) [(4, 1), (6, 1), (8, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((24238592 : Rat) / 158397) [(4, 1), (6, 1), (8, 1), (9, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1019 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_1019_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_1019
        rs_R005_ueqv_R005NYN_generator_05_1000_1099 =
      rs_R005_ueqv_R005NYN_partial_05_1019 := by
  native_decide

/-- Coefficient term 1020 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_1020 : Poly :=
[
  term ((3682016 : Rat) / 385571) [(4, 1), (6, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1020 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_1020 : Poly :=
[
  term ((-7364032 : Rat) / 385571) [(2, 1), (4, 1), (6, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((3682016 : Rat) / 385571) [(2, 2), (4, 1), (6, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((3682016 : Rat) / 385571) [(3, 2), (4, 1), (6, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((7364032 : Rat) / 385571) [(4, 1), (6, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3682016 : Rat) / 385571) [(4, 1), (6, 1), (8, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3682016 : Rat) / 385571) [(4, 1), (6, 1), (8, 1), (9, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1020 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_1020_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_1020
        rs_R005_ueqv_R005NYN_generator_05_1000_1099 =
      rs_R005_ueqv_R005NYN_partial_05_1020 := by
  native_decide

/-- Coefficient term 1021 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_1021 : Poly :=
[
  term ((24238592 : Rat) / 158397) [(4, 1), (6, 1), (8, 1), (9, 1), (12, 2), (15, 1)]
]

/-- Partial product 1021 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_1021 : Poly :=
[
  term ((-48477184 : Rat) / 158397) [(2, 1), (4, 1), (6, 1), (8, 1), (9, 1), (12, 2), (15, 1)],
  term ((24238592 : Rat) / 158397) [(2, 2), (4, 1), (6, 1), (8, 1), (9, 1), (12, 2), (15, 1)],
  term ((24238592 : Rat) / 158397) [(3, 2), (4, 1), (6, 1), (8, 1), (9, 1), (12, 2), (15, 1)],
  term ((48477184 : Rat) / 158397) [(4, 1), (6, 1), (8, 1), (9, 1), (12, 2), (14, 1), (15, 1)],
  term ((-24238592 : Rat) / 158397) [(4, 1), (6, 1), (8, 1), (9, 1), (12, 2), (14, 2), (15, 1)],
  term ((-24238592 : Rat) / 158397) [(4, 1), (6, 1), (8, 1), (9, 1), (12, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1021 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_1021_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_1021
        rs_R005_ueqv_R005NYN_generator_05_1000_1099 =
      rs_R005_ueqv_R005NYN_partial_05_1021 := by
  native_decide

/-- Coefficient term 1022 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_1022 : Poly :=
[
  term ((-3682016 : Rat) / 385571) [(4, 1), (6, 1), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 1022 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_1022 : Poly :=
[
  term ((7364032 : Rat) / 385571) [(2, 1), (4, 1), (6, 1), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-3682016 : Rat) / 385571) [(2, 2), (4, 1), (6, 1), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-3682016 : Rat) / 385571) [(3, 2), (4, 1), (6, 1), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-7364032 : Rat) / 385571) [(4, 1), (6, 1), (8, 1), (9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((3682016 : Rat) / 385571) [(4, 1), (6, 1), (8, 1), (9, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((3682016 : Rat) / 385571) [(4, 1), (6, 1), (8, 1), (9, 1), (12, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1022 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_1022_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_1022
        rs_R005_ueqv_R005NYN_generator_05_1000_1099 =
      rs_R005_ueqv_R005NYN_partial_05_1022 := by
  native_decide

/-- Coefficient term 1023 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_1023 : Poly :=
[
  term ((-3112960 : Rat) / 52799) [(4, 1), (6, 1), (8, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 1023 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_1023 : Poly :=
[
  term ((6225920 : Rat) / 52799) [(2, 1), (4, 1), (6, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-3112960 : Rat) / 52799) [(2, 2), (4, 1), (6, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-3112960 : Rat) / 52799) [(3, 2), (4, 1), (6, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-6225920 : Rat) / 52799) [(4, 1), (6, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((3112960 : Rat) / 52799) [(4, 1), (6, 1), (8, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((3112960 : Rat) / 52799) [(4, 1), (6, 1), (8, 1), (11, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1023 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_1023_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_1023
        rs_R005_ueqv_R005NYN_generator_05_1000_1099 =
      rs_R005_ueqv_R005NYN_partial_05_1023 := by
  native_decide

/-- Coefficient term 1024 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_1024 : Poly :=
[
  term ((9166080 : Rat) / 385571) [(4, 1), (6, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1024 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_1024 : Poly :=
[
  term ((-18332160 : Rat) / 385571) [(2, 1), (4, 1), (6, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((9166080 : Rat) / 385571) [(2, 2), (4, 1), (6, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((9166080 : Rat) / 385571) [(3, 2), (4, 1), (6, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((18332160 : Rat) / 385571) [(4, 1), (6, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9166080 : Rat) / 385571) [(4, 1), (6, 1), (8, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-9166080 : Rat) / 385571) [(4, 1), (6, 1), (8, 1), (11, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1024 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_1024_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_1024
        rs_R005_ueqv_R005NYN_generator_05_1000_1099 =
      rs_R005_ueqv_R005NYN_partial_05_1024 := by
  native_decide

/-- Coefficient term 1025 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_1025 : Poly :=
[
  term ((3112960 : Rat) / 52799) [(4, 1), (6, 1), (8, 1), (11, 1), (12, 2), (15, 1)]
]

/-- Partial product 1025 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_1025 : Poly :=
[
  term ((-6225920 : Rat) / 52799) [(2, 1), (4, 1), (6, 1), (8, 1), (11, 1), (12, 2), (15, 1)],
  term ((3112960 : Rat) / 52799) [(2, 2), (4, 1), (6, 1), (8, 1), (11, 1), (12, 2), (15, 1)],
  term ((3112960 : Rat) / 52799) [(3, 2), (4, 1), (6, 1), (8, 1), (11, 1), (12, 2), (15, 1)],
  term ((6225920 : Rat) / 52799) [(4, 1), (6, 1), (8, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((-3112960 : Rat) / 52799) [(4, 1), (6, 1), (8, 1), (11, 1), (12, 2), (14, 2), (15, 1)],
  term ((-3112960 : Rat) / 52799) [(4, 1), (6, 1), (8, 1), (11, 1), (12, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1025 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_1025_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_1025
        rs_R005_ueqv_R005NYN_generator_05_1000_1099 =
      rs_R005_ueqv_R005NYN_partial_05_1025 := by
  native_decide

/-- Coefficient term 1026 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_1026 : Poly :=
[
  term ((-9166080 : Rat) / 385571) [(4, 1), (6, 1), (8, 1), (11, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 1026 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_1026 : Poly :=
[
  term ((18332160 : Rat) / 385571) [(2, 1), (4, 1), (6, 1), (8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-9166080 : Rat) / 385571) [(2, 2), (4, 1), (6, 1), (8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-9166080 : Rat) / 385571) [(3, 2), (4, 1), (6, 1), (8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-18332160 : Rat) / 385571) [(4, 1), (6, 1), (8, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((9166080 : Rat) / 385571) [(4, 1), (6, 1), (8, 1), (11, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((9166080 : Rat) / 385571) [(4, 1), (6, 1), (8, 1), (11, 1), (12, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1026 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_1026_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_1026
        rs_R005_ueqv_R005NYN_generator_05_1000_1099 =
      rs_R005_ueqv_R005NYN_partial_05_1026 := by
  native_decide

/-- Coefficient term 1027 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_1027 : Poly :=
[
  term ((1556480 : Rat) / 52799) [(4, 1), (6, 1), (8, 1), (12, 1), (15, 2)]
]

/-- Partial product 1027 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_1027 : Poly :=
[
  term ((-3112960 : Rat) / 52799) [(2, 1), (4, 1), (6, 1), (8, 1), (12, 1), (15, 2)],
  term ((1556480 : Rat) / 52799) [(2, 2), (4, 1), (6, 1), (8, 1), (12, 1), (15, 2)],
  term ((1556480 : Rat) / 52799) [(3, 2), (4, 1), (6, 1), (8, 1), (12, 1), (15, 2)],
  term ((3112960 : Rat) / 52799) [(4, 1), (6, 1), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((-1556480 : Rat) / 52799) [(4, 1), (6, 1), (8, 1), (12, 1), (14, 2), (15, 2)],
  term ((-1556480 : Rat) / 52799) [(4, 1), (6, 1), (8, 1), (12, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1027 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_1027_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_1027
        rs_R005_ueqv_R005NYN_generator_05_1000_1099 =
      rs_R005_ueqv_R005NYN_partial_05_1027 := by
  native_decide

/-- Coefficient term 1028 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_1028 : Poly :=
[
  term ((-4583040 : Rat) / 385571) [(4, 1), (6, 1), (8, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1028 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_1028 : Poly :=
[
  term ((9166080 : Rat) / 385571) [(2, 1), (4, 1), (6, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(2, 2), (4, 1), (6, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(3, 2), (4, 1), (6, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-9166080 : Rat) / 385571) [(4, 1), (6, 1), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((4583040 : Rat) / 385571) [(4, 1), (6, 1), (8, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((4583040 : Rat) / 385571) [(4, 1), (6, 1), (8, 1), (12, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1028 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_1028_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_1028
        rs_R005_ueqv_R005NYN_generator_05_1000_1099 =
      rs_R005_ueqv_R005NYN_partial_05_1028 := by
  native_decide

/-- Coefficient term 1029 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_1029 : Poly :=
[
  term ((-1556480 : Rat) / 52799) [(4, 1), (6, 1), (8, 1), (12, 2), (15, 2)]
]

/-- Partial product 1029 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_1029 : Poly :=
[
  term ((3112960 : Rat) / 52799) [(2, 1), (4, 1), (6, 1), (8, 1), (12, 2), (15, 2)],
  term ((-1556480 : Rat) / 52799) [(2, 2), (4, 1), (6, 1), (8, 1), (12, 2), (15, 2)],
  term ((-1556480 : Rat) / 52799) [(3, 2), (4, 1), (6, 1), (8, 1), (12, 2), (15, 2)],
  term ((-3112960 : Rat) / 52799) [(4, 1), (6, 1), (8, 1), (12, 2), (14, 1), (15, 2)],
  term ((1556480 : Rat) / 52799) [(4, 1), (6, 1), (8, 1), (12, 2), (14, 2), (15, 2)],
  term ((1556480 : Rat) / 52799) [(4, 1), (6, 1), (8, 1), (12, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1029 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_1029_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_1029
        rs_R005_ueqv_R005NYN_generator_05_1000_1099 =
      rs_R005_ueqv_R005NYN_partial_05_1029 := by
  native_decide

/-- Coefficient term 1030 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_1030 : Poly :=
[
  term ((4583040 : Rat) / 385571) [(4, 1), (6, 1), (8, 1), (12, 2), (15, 2), (16, 1)]
]

/-- Partial product 1030 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_1030 : Poly :=
[
  term ((-9166080 : Rat) / 385571) [(2, 1), (4, 1), (6, 1), (8, 1), (12, 2), (15, 2), (16, 1)],
  term ((4583040 : Rat) / 385571) [(2, 2), (4, 1), (6, 1), (8, 1), (12, 2), (15, 2), (16, 1)],
  term ((4583040 : Rat) / 385571) [(3, 2), (4, 1), (6, 1), (8, 1), (12, 2), (15, 2), (16, 1)],
  term ((9166080 : Rat) / 385571) [(4, 1), (6, 1), (8, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(4, 1), (6, 1), (8, 1), (12, 2), (14, 2), (15, 2), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(4, 1), (6, 1), (8, 1), (12, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1030 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_1030_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_1030
        rs_R005_ueqv_R005NYN_generator_05_1000_1099 =
      rs_R005_ueqv_R005NYN_partial_05_1030 := by
  native_decide

/-- Coefficient term 1031 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_1031 : Poly :=
[
  term ((24238592 : Rat) / 158397) [(4, 1), (6, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 1031 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_1031 : Poly :=
[
  term ((-48477184 : Rat) / 158397) [(2, 1), (4, 1), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((24238592 : Rat) / 158397) [(2, 2), (4, 1), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((24238592 : Rat) / 158397) [(3, 2), (4, 1), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((48477184 : Rat) / 158397) [(4, 1), (6, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-24238592 : Rat) / 158397) [(4, 1), (6, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((-24238592 : Rat) / 158397) [(4, 1), (6, 1), (9, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1031 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_1031_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_1031
        rs_R005_ueqv_R005NYN_generator_05_1000_1099 =
      rs_R005_ueqv_R005NYN_partial_05_1031 := by
  native_decide

/-- Coefficient term 1032 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_1032 : Poly :=
[
  term ((-3682016 : Rat) / 385571) [(4, 1), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1032 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_1032 : Poly :=
[
  term ((7364032 : Rat) / 385571) [(2, 1), (4, 1), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3682016 : Rat) / 385571) [(2, 2), (4, 1), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3682016 : Rat) / 385571) [(3, 2), (4, 1), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-7364032 : Rat) / 385571) [(4, 1), (6, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((3682016 : Rat) / 385571) [(4, 1), (6, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((3682016 : Rat) / 385571) [(4, 1), (6, 1), (9, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1032 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_1032_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_1032
        rs_R005_ueqv_R005NYN_generator_05_1000_1099 =
      rs_R005_ueqv_R005NYN_partial_05_1032 := by
  native_decide

/-- Coefficient term 1033 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_1033 : Poly :=
[
  term ((-24238592 : Rat) / 158397) [(4, 1), (6, 1), (9, 1), (12, 2), (15, 1)]
]

/-- Partial product 1033 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_1033 : Poly :=
[
  term ((48477184 : Rat) / 158397) [(2, 1), (4, 1), (6, 1), (9, 1), (12, 2), (15, 1)],
  term ((-24238592 : Rat) / 158397) [(2, 2), (4, 1), (6, 1), (9, 1), (12, 2), (15, 1)],
  term ((-24238592 : Rat) / 158397) [(3, 2), (4, 1), (6, 1), (9, 1), (12, 2), (15, 1)],
  term ((-48477184 : Rat) / 158397) [(4, 1), (6, 1), (9, 1), (12, 2), (14, 1), (15, 1)],
  term ((24238592 : Rat) / 158397) [(4, 1), (6, 1), (9, 1), (12, 2), (14, 2), (15, 1)],
  term ((24238592 : Rat) / 158397) [(4, 1), (6, 1), (9, 1), (12, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1033 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_1033_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_1033
        rs_R005_ueqv_R005NYN_generator_05_1000_1099 =
      rs_R005_ueqv_R005NYN_partial_05_1033 := by
  native_decide

/-- Coefficient term 1034 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_1034 : Poly :=
[
  term ((3682016 : Rat) / 385571) [(4, 1), (6, 1), (9, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 1034 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_1034 : Poly :=
[
  term ((-7364032 : Rat) / 385571) [(2, 1), (4, 1), (6, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((3682016 : Rat) / 385571) [(2, 2), (4, 1), (6, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((3682016 : Rat) / 385571) [(3, 2), (4, 1), (6, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((7364032 : Rat) / 385571) [(4, 1), (6, 1), (9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-3682016 : Rat) / 385571) [(4, 1), (6, 1), (9, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((-3682016 : Rat) / 385571) [(4, 1), (6, 1), (9, 1), (12, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1034 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_1034_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_1034
        rs_R005_ueqv_R005NYN_generator_05_1000_1099 =
      rs_R005_ueqv_R005NYN_partial_05_1034 := by
  native_decide

/-- Coefficient term 1035 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_1035 : Poly :=
[
  term ((3112960 : Rat) / 52799) [(4, 1), (6, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 1035 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_1035 : Poly :=
[
  term ((-6225920 : Rat) / 52799) [(2, 1), (4, 1), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((3112960 : Rat) / 52799) [(2, 2), (4, 1), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((3112960 : Rat) / 52799) [(3, 2), (4, 1), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((6225920 : Rat) / 52799) [(4, 1), (6, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-3112960 : Rat) / 52799) [(4, 1), (6, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-3112960 : Rat) / 52799) [(4, 1), (6, 1), (11, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1035 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_1035_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_1035
        rs_R005_ueqv_R005NYN_generator_05_1000_1099 =
      rs_R005_ueqv_R005NYN_partial_05_1035 := by
  native_decide

/-- Coefficient term 1036 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_1036 : Poly :=
[
  term ((-9166080 : Rat) / 385571) [(4, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1036 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_1036 : Poly :=
[
  term ((18332160 : Rat) / 385571) [(2, 1), (4, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-9166080 : Rat) / 385571) [(2, 2), (4, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-9166080 : Rat) / 385571) [(3, 2), (4, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-18332160 : Rat) / 385571) [(4, 1), (6, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((9166080 : Rat) / 385571) [(4, 1), (6, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((9166080 : Rat) / 385571) [(4, 1), (6, 1), (11, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1036 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_1036_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_1036
        rs_R005_ueqv_R005NYN_generator_05_1000_1099 =
      rs_R005_ueqv_R005NYN_partial_05_1036 := by
  native_decide

/-- Coefficient term 1037 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_1037 : Poly :=
[
  term ((-3112960 : Rat) / 52799) [(4, 1), (6, 1), (11, 1), (12, 2), (15, 1)]
]

/-- Partial product 1037 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_1037 : Poly :=
[
  term ((6225920 : Rat) / 52799) [(2, 1), (4, 1), (6, 1), (11, 1), (12, 2), (15, 1)],
  term ((-3112960 : Rat) / 52799) [(2, 2), (4, 1), (6, 1), (11, 1), (12, 2), (15, 1)],
  term ((-3112960 : Rat) / 52799) [(3, 2), (4, 1), (6, 1), (11, 1), (12, 2), (15, 1)],
  term ((-6225920 : Rat) / 52799) [(4, 1), (6, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((3112960 : Rat) / 52799) [(4, 1), (6, 1), (11, 1), (12, 2), (14, 2), (15, 1)],
  term ((3112960 : Rat) / 52799) [(4, 1), (6, 1), (11, 1), (12, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1037 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_1037_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_1037
        rs_R005_ueqv_R005NYN_generator_05_1000_1099 =
      rs_R005_ueqv_R005NYN_partial_05_1037 := by
  native_decide

/-- Coefficient term 1038 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_1038 : Poly :=
[
  term ((9166080 : Rat) / 385571) [(4, 1), (6, 1), (11, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 1038 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_1038 : Poly :=
[
  term ((-18332160 : Rat) / 385571) [(2, 1), (4, 1), (6, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((9166080 : Rat) / 385571) [(2, 2), (4, 1), (6, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((9166080 : Rat) / 385571) [(3, 2), (4, 1), (6, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((18332160 : Rat) / 385571) [(4, 1), (6, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-9166080 : Rat) / 385571) [(4, 1), (6, 1), (11, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((-9166080 : Rat) / 385571) [(4, 1), (6, 1), (11, 1), (12, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1038 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_1038_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_1038
        rs_R005_ueqv_R005NYN_generator_05_1000_1099 =
      rs_R005_ueqv_R005NYN_partial_05_1038 := by
  native_decide

/-- Coefficient term 1039 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_1039 : Poly :=
[
  term ((-1556480 : Rat) / 52799) [(4, 1), (6, 1), (12, 1), (15, 2)]
]

/-- Partial product 1039 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_1039 : Poly :=
[
  term ((3112960 : Rat) / 52799) [(2, 1), (4, 1), (6, 1), (12, 1), (15, 2)],
  term ((-1556480 : Rat) / 52799) [(2, 2), (4, 1), (6, 1), (12, 1), (15, 2)],
  term ((-1556480 : Rat) / 52799) [(3, 2), (4, 1), (6, 1), (12, 1), (15, 2)],
  term ((-3112960 : Rat) / 52799) [(4, 1), (6, 1), (12, 1), (14, 1), (15, 2)],
  term ((1556480 : Rat) / 52799) [(4, 1), (6, 1), (12, 1), (14, 2), (15, 2)],
  term ((1556480 : Rat) / 52799) [(4, 1), (6, 1), (12, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1039 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_1039_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_1039
        rs_R005_ueqv_R005NYN_generator_05_1000_1099 =
      rs_R005_ueqv_R005NYN_partial_05_1039 := by
  native_decide

/-- Coefficient term 1040 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_1040 : Poly :=
[
  term ((4583040 : Rat) / 385571) [(4, 1), (6, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1040 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_1040 : Poly :=
[
  term ((-9166080 : Rat) / 385571) [(2, 1), (4, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((4583040 : Rat) / 385571) [(2, 2), (4, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((4583040 : Rat) / 385571) [(3, 2), (4, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((9166080 : Rat) / 385571) [(4, 1), (6, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(4, 1), (6, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(4, 1), (6, 1), (12, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1040 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_1040_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_1040
        rs_R005_ueqv_R005NYN_generator_05_1000_1099 =
      rs_R005_ueqv_R005NYN_partial_05_1040 := by
  native_decide

/-- Coefficient term 1041 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_1041 : Poly :=
[
  term ((1556480 : Rat) / 52799) [(4, 1), (6, 1), (12, 2), (15, 2)]
]

/-- Partial product 1041 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_1041 : Poly :=
[
  term ((-3112960 : Rat) / 52799) [(2, 1), (4, 1), (6, 1), (12, 2), (15, 2)],
  term ((1556480 : Rat) / 52799) [(2, 2), (4, 1), (6, 1), (12, 2), (15, 2)],
  term ((1556480 : Rat) / 52799) [(3, 2), (4, 1), (6, 1), (12, 2), (15, 2)],
  term ((3112960 : Rat) / 52799) [(4, 1), (6, 1), (12, 2), (14, 1), (15, 2)],
  term ((-1556480 : Rat) / 52799) [(4, 1), (6, 1), (12, 2), (14, 2), (15, 2)],
  term ((-1556480 : Rat) / 52799) [(4, 1), (6, 1), (12, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1041 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_1041_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_1041
        rs_R005_ueqv_R005NYN_generator_05_1000_1099 =
      rs_R005_ueqv_R005NYN_partial_05_1041 := by
  native_decide

/-- Coefficient term 1042 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_1042 : Poly :=
[
  term ((-4583040 : Rat) / 385571) [(4, 1), (6, 1), (12, 2), (15, 2), (16, 1)]
]

/-- Partial product 1042 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_1042 : Poly :=
[
  term ((9166080 : Rat) / 385571) [(2, 1), (4, 1), (6, 1), (12, 2), (15, 2), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(2, 2), (4, 1), (6, 1), (12, 2), (15, 2), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(3, 2), (4, 1), (6, 1), (12, 2), (15, 2), (16, 1)],
  term ((-9166080 : Rat) / 385571) [(4, 1), (6, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((4583040 : Rat) / 385571) [(4, 1), (6, 1), (12, 2), (14, 2), (15, 2), (16, 1)],
  term ((4583040 : Rat) / 385571) [(4, 1), (6, 1), (12, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1042 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_1042_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_1042
        rs_R005_ueqv_R005NYN_generator_05_1000_1099 =
      rs_R005_ueqv_R005NYN_partial_05_1042 := by
  native_decide

/-- Coefficient term 1043 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_1043 : Poly :=
[
  term ((3216320 : Rat) / 158397) [(4, 1), (6, 1), (15, 2)]
]

/-- Partial product 1043 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_1043 : Poly :=
[
  term ((-6432640 : Rat) / 158397) [(2, 1), (4, 1), (6, 1), (15, 2)],
  term ((3216320 : Rat) / 158397) [(2, 2), (4, 1), (6, 1), (15, 2)],
  term ((3216320 : Rat) / 158397) [(3, 2), (4, 1), (6, 1), (15, 2)],
  term ((6432640 : Rat) / 158397) [(4, 1), (6, 1), (14, 1), (15, 2)],
  term ((-3216320 : Rat) / 158397) [(4, 1), (6, 1), (14, 2), (15, 2)],
  term ((-3216320 : Rat) / 158397) [(4, 1), (6, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1043 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_1043_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_1043
        rs_R005_ueqv_R005NYN_generator_05_1000_1099 =
      rs_R005_ueqv_R005NYN_partial_05_1043 := by
  native_decide

/-- Coefficient term 1044 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_1044 : Poly :=
[
  term ((-23827616 : Rat) / 385571) [(4, 1), (6, 1), (15, 2), (16, 1)]
]

/-- Partial product 1044 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_1044 : Poly :=
[
  term ((47655232 : Rat) / 385571) [(2, 1), (4, 1), (6, 1), (15, 2), (16, 1)],
  term ((-23827616 : Rat) / 385571) [(2, 2), (4, 1), (6, 1), (15, 2), (16, 1)],
  term ((-23827616 : Rat) / 385571) [(3, 2), (4, 1), (6, 1), (15, 2), (16, 1)],
  term ((-47655232 : Rat) / 385571) [(4, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((23827616 : Rat) / 385571) [(4, 1), (6, 1), (14, 2), (15, 2), (16, 1)],
  term ((23827616 : Rat) / 385571) [(4, 1), (6, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1044 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_1044_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_1044
        rs_R005_ueqv_R005NYN_generator_05_1000_1099 =
      rs_R005_ueqv_R005NYN_partial_05_1044 := by
  native_decide

/-- Coefficient term 1045 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_1045 : Poly :=
[
  term ((24238592 : Rat) / 158397) [(4, 1), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 1045 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_1045 : Poly :=
[
  term ((-48477184 : Rat) / 158397) [(2, 1), (4, 1), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((24238592 : Rat) / 158397) [(2, 2), (4, 1), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((24238592 : Rat) / 158397) [(3, 2), (4, 1), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((48477184 : Rat) / 158397) [(4, 1), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-24238592 : Rat) / 158397) [(4, 1), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-24238592 : Rat) / 158397) [(4, 1), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1045 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_1045_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_1045
        rs_R005_ueqv_R005NYN_generator_05_1000_1099 =
      rs_R005_ueqv_R005NYN_partial_05_1045 := by
  native_decide

/-- Coefficient term 1046 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_1046 : Poly :=
[
  term ((-3682016 : Rat) / 385571) [(4, 1), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1046 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_1046 : Poly :=
[
  term ((7364032 : Rat) / 385571) [(2, 1), (4, 1), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3682016 : Rat) / 385571) [(2, 2), (4, 1), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3682016 : Rat) / 385571) [(3, 2), (4, 1), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-7364032 : Rat) / 385571) [(4, 1), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3682016 : Rat) / 385571) [(4, 1), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((3682016 : Rat) / 385571) [(4, 1), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1046 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_1046_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_1046
        rs_R005_ueqv_R005NYN_generator_05_1000_1099 =
      rs_R005_ueqv_R005NYN_partial_05_1046 := by
  native_decide

/-- Coefficient term 1047 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_1047 : Poly :=
[
  term ((5787200 : Rat) / 158397) [(4, 1), (7, 1), (8, 1), (10, 1), (14, 1), (15, 1)]
]

/-- Partial product 1047 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_1047 : Poly :=
[
  term ((-11574400 : Rat) / 158397) [(2, 1), (4, 1), (7, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((5787200 : Rat) / 158397) [(2, 2), (4, 1), (7, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((5787200 : Rat) / 158397) [(3, 2), (4, 1), (7, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((-5787200 : Rat) / 158397) [(4, 1), (7, 1), (8, 1), (10, 1), (14, 1), (15, 3)],
  term ((11574400 : Rat) / 158397) [(4, 1), (7, 1), (8, 1), (10, 1), (14, 2), (15, 1)],
  term ((-5787200 : Rat) / 158397) [(4, 1), (7, 1), (8, 1), (10, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1047 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_1047_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_1047
        rs_R005_ueqv_R005NYN_generator_05_1000_1099 =
      rs_R005_ueqv_R005NYN_partial_05_1047 := by
  native_decide

/-- Coefficient term 1048 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_1048 : Poly :=
[
  term ((-62340392 : Rat) / 385571) [(4, 1), (7, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1048 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_1048 : Poly :=
[
  term ((124680784 : Rat) / 385571) [(2, 1), (4, 1), (7, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-62340392 : Rat) / 385571) [(2, 2), (4, 1), (7, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-62340392 : Rat) / 385571) [(3, 2), (4, 1), (7, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((62340392 : Rat) / 385571) [(4, 1), (7, 1), (8, 1), (10, 1), (14, 1), (15, 3), (16, 1)],
  term ((-124680784 : Rat) / 385571) [(4, 1), (7, 1), (8, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((62340392 : Rat) / 385571) [(4, 1), (7, 1), (8, 1), (10, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1048 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_1048_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_1048
        rs_R005_ueqv_R005NYN_generator_05_1000_1099 =
      rs_R005_ueqv_R005NYN_partial_05_1048 := by
  native_decide

/-- Coefficient term 1049 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_1049 : Poly :=
[
  term ((2893600 : Rat) / 158397) [(4, 1), (7, 1), (8, 1), (10, 1), (15, 1)]
]

/-- Partial product 1049 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_1049 : Poly :=
[
  term ((-5787200 : Rat) / 158397) [(2, 1), (4, 1), (7, 1), (8, 1), (10, 1), (15, 1)],
  term ((2893600 : Rat) / 158397) [(2, 2), (4, 1), (7, 1), (8, 1), (10, 1), (15, 1)],
  term ((2893600 : Rat) / 158397) [(3, 2), (4, 1), (7, 1), (8, 1), (10, 1), (15, 1)],
  term ((5787200 : Rat) / 158397) [(4, 1), (7, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((-2893600 : Rat) / 158397) [(4, 1), (7, 1), (8, 1), (10, 1), (14, 2), (15, 1)],
  term ((-2893600 : Rat) / 158397) [(4, 1), (7, 1), (8, 1), (10, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1049 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_1049_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_1049
        rs_R005_ueqv_R005NYN_generator_05_1000_1099 =
      rs_R005_ueqv_R005NYN_partial_05_1049 := by
  native_decide

/-- Coefficient term 1050 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_1050 : Poly :=
[
  term ((-31170196 : Rat) / 385571) [(4, 1), (7, 1), (8, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 1050 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_1050 : Poly :=
[
  term ((62340392 : Rat) / 385571) [(2, 1), (4, 1), (7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-31170196 : Rat) / 385571) [(2, 2), (4, 1), (7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-31170196 : Rat) / 385571) [(3, 2), (4, 1), (7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-62340392 : Rat) / 385571) [(4, 1), (7, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((31170196 : Rat) / 385571) [(4, 1), (7, 1), (8, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((31170196 : Rat) / 385571) [(4, 1), (7, 1), (8, 1), (10, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1050 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_1050_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_1050
        rs_R005_ueqv_R005NYN_generator_05_1000_1099 =
      rs_R005_ueqv_R005NYN_partial_05_1050 := by
  native_decide

/-- Coefficient term 1051 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_1051 : Poly :=
[
  term ((3112960 : Rat) / 52799) [(4, 1), (7, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 1051 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_1051 : Poly :=
[
  term ((-6225920 : Rat) / 52799) [(2, 1), (4, 1), (7, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((3112960 : Rat) / 52799) [(2, 2), (4, 1), (7, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((3112960 : Rat) / 52799) [(3, 2), (4, 1), (7, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((6225920 : Rat) / 52799) [(4, 1), (7, 1), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-3112960 : Rat) / 52799) [(4, 1), (7, 1), (8, 1), (11, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-3112960 : Rat) / 52799) [(4, 1), (7, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1051 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_1051_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_1051
        rs_R005_ueqv_R005NYN_generator_05_1000_1099 =
      rs_R005_ueqv_R005NYN_partial_05_1051 := by
  native_decide

/-- Coefficient term 1052 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_1052 : Poly :=
[
  term ((-9166080 : Rat) / 385571) [(4, 1), (7, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1052 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_1052 : Poly :=
[
  term ((18332160 : Rat) / 385571) [(2, 1), (4, 1), (7, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-9166080 : Rat) / 385571) [(2, 2), (4, 1), (7, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-9166080 : Rat) / 385571) [(3, 2), (4, 1), (7, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-18332160 : Rat) / 385571) [(4, 1), (7, 1), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((9166080 : Rat) / 385571) [(4, 1), (7, 1), (8, 1), (11, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((9166080 : Rat) / 385571) [(4, 1), (7, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1052 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_1052_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_1052
        rs_R005_ueqv_R005NYN_generator_05_1000_1099 =
      rs_R005_ueqv_R005NYN_partial_05_1052 := by
  native_decide

/-- Coefficient term 1053 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_1053 : Poly :=
[
  term ((-1556480 : Rat) / 52799) [(4, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 1053 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_1053 : Poly :=
[
  term ((3112960 : Rat) / 52799) [(2, 1), (4, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 2)],
  term ((-1556480 : Rat) / 52799) [(2, 2), (4, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 2)],
  term ((-1556480 : Rat) / 52799) [(3, 2), (4, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 2)],
  term ((-3112960 : Rat) / 52799) [(4, 1), (7, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((1556480 : Rat) / 52799) [(4, 1), (7, 1), (8, 1), (12, 1), (13, 1), (14, 2), (15, 2)],
  term ((1556480 : Rat) / 52799) [(4, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1053 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_1053_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_1053
        rs_R005_ueqv_R005NYN_generator_05_1000_1099 =
      rs_R005_ueqv_R005NYN_partial_05_1053 := by
  native_decide

/-- Coefficient term 1054 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_1054 : Poly :=
[
  term ((4583040 : Rat) / 385571) [(4, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1054 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_1054 : Poly :=
[
  term ((-9166080 : Rat) / 385571) [(2, 1), (4, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((4583040 : Rat) / 385571) [(2, 2), (4, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((4583040 : Rat) / 385571) [(3, 2), (4, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((9166080 : Rat) / 385571) [(4, 1), (7, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(4, 1), (7, 1), (8, 1), (12, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(4, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1054 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_1054_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_1054
        rs_R005_ueqv_R005NYN_generator_05_1000_1099 =
      rs_R005_ueqv_R005NYN_partial_05_1054 := by
  native_decide

/-- Coefficient term 1055 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_1055 : Poly :=
[
  term ((-11574400 : Rat) / 158397) [(4, 1), (7, 1), (8, 1), (12, 2), (15, 1)]
]

/-- Partial product 1055 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_1055 : Poly :=
[
  term ((23148800 : Rat) / 158397) [(2, 1), (4, 1), (7, 1), (8, 1), (12, 2), (15, 1)],
  term ((-11574400 : Rat) / 158397) [(2, 2), (4, 1), (7, 1), (8, 1), (12, 2), (15, 1)],
  term ((-11574400 : Rat) / 158397) [(3, 2), (4, 1), (7, 1), (8, 1), (12, 2), (15, 1)],
  term ((-23148800 : Rat) / 158397) [(4, 1), (7, 1), (8, 1), (12, 2), (14, 1), (15, 1)],
  term ((11574400 : Rat) / 158397) [(4, 1), (7, 1), (8, 1), (12, 2), (14, 2), (15, 1)],
  term ((11574400 : Rat) / 158397) [(4, 1), (7, 1), (8, 1), (12, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1055 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_1055_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_1055
        rs_R005_ueqv_R005NYN_generator_05_1000_1099 =
      rs_R005_ueqv_R005NYN_partial_05_1055 := by
  native_decide

/-- Coefficient term 1056 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_1056 : Poly :=
[
  term ((124680784 : Rat) / 385571) [(4, 1), (7, 1), (8, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 1056 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_1056 : Poly :=
[
  term ((-249361568 : Rat) / 385571) [(2, 1), (4, 1), (7, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((124680784 : Rat) / 385571) [(2, 2), (4, 1), (7, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((124680784 : Rat) / 385571) [(3, 2), (4, 1), (7, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((249361568 : Rat) / 385571) [(4, 1), (7, 1), (8, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-124680784 : Rat) / 385571) [(4, 1), (7, 1), (8, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((-124680784 : Rat) / 385571) [(4, 1), (7, 1), (8, 1), (12, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1056 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_1056_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_1056
        rs_R005_ueqv_R005NYN_generator_05_1000_1099 =
      rs_R005_ueqv_R005NYN_partial_05_1056 := by
  native_decide

/-- Coefficient term 1057 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_1057 : Poly :=
[
  term ((-2893600 : Rat) / 158397) [(4, 1), (7, 1), (8, 1), (14, 1), (15, 1)]
]

/-- Partial product 1057 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_1057 : Poly :=
[
  term ((5787200 : Rat) / 158397) [(2, 1), (4, 1), (7, 1), (8, 1), (14, 1), (15, 1)],
  term ((-2893600 : Rat) / 158397) [(2, 2), (4, 1), (7, 1), (8, 1), (14, 1), (15, 1)],
  term ((-2893600 : Rat) / 158397) [(3, 2), (4, 1), (7, 1), (8, 1), (14, 1), (15, 1)],
  term ((2893600 : Rat) / 158397) [(4, 1), (7, 1), (8, 1), (14, 1), (15, 3)],
  term ((-5787200 : Rat) / 158397) [(4, 1), (7, 1), (8, 1), (14, 2), (15, 1)],
  term ((2893600 : Rat) / 158397) [(4, 1), (7, 1), (8, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1057 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_1057_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_1057
        rs_R005_ueqv_R005NYN_generator_05_1000_1099 =
      rs_R005_ueqv_R005NYN_partial_05_1057 := by
  native_decide

/-- Coefficient term 1058 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_1058 : Poly :=
[
  term ((31170196 : Rat) / 385571) [(4, 1), (7, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1058 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_1058 : Poly :=
[
  term ((-62340392 : Rat) / 385571) [(2, 1), (4, 1), (7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((31170196 : Rat) / 385571) [(2, 2), (4, 1), (7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((31170196 : Rat) / 385571) [(3, 2), (4, 1), (7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-31170196 : Rat) / 385571) [(4, 1), (7, 1), (8, 1), (14, 1), (15, 3), (16, 1)],
  term ((62340392 : Rat) / 385571) [(4, 1), (7, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((-31170196 : Rat) / 385571) [(4, 1), (7, 1), (8, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1058 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_1058_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_1058
        rs_R005_ueqv_R005NYN_generator_05_1000_1099 =
      rs_R005_ueqv_R005NYN_partial_05_1058 := by
  native_decide

/-- Coefficient term 1059 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_1059 : Poly :=
[
  term ((1446800 : Rat) / 52799) [(4, 1), (7, 1), (8, 1), (15, 1)]
]

/-- Partial product 1059 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_1059 : Poly :=
[
  term ((-2893600 : Rat) / 52799) [(2, 1), (4, 1), (7, 1), (8, 1), (15, 1)],
  term ((1446800 : Rat) / 52799) [(2, 2), (4, 1), (7, 1), (8, 1), (15, 1)],
  term ((1446800 : Rat) / 52799) [(3, 2), (4, 1), (7, 1), (8, 1), (15, 1)],
  term ((2893600 : Rat) / 52799) [(4, 1), (7, 1), (8, 1), (14, 1), (15, 1)],
  term ((-1446800 : Rat) / 52799) [(4, 1), (7, 1), (8, 1), (14, 2), (15, 1)],
  term ((-1446800 : Rat) / 52799) [(4, 1), (7, 1), (8, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1059 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_1059_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_1059
        rs_R005_ueqv_R005NYN_generator_05_1000_1099 =
      rs_R005_ueqv_R005NYN_partial_05_1059 := by
  native_decide

/-- Coefficient term 1060 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_1060 : Poly :=
[
  term ((-46755294 : Rat) / 385571) [(4, 1), (7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 1060 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_1060 : Poly :=
[
  term ((93510588 : Rat) / 385571) [(2, 1), (4, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-46755294 : Rat) / 385571) [(2, 2), (4, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-46755294 : Rat) / 385571) [(3, 2), (4, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-93510588 : Rat) / 385571) [(4, 1), (7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((46755294 : Rat) / 385571) [(4, 1), (7, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((46755294 : Rat) / 385571) [(4, 1), (7, 1), (8, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1060 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_1060_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_1060
        rs_R005_ueqv_R005NYN_generator_05_1000_1099 =
      rs_R005_ueqv_R005NYN_partial_05_1060 := by
  native_decide

/-- Coefficient term 1061 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_1061 : Poly :=
[
  term ((-24238592 : Rat) / 158397) [(4, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 1061 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_1061 : Poly :=
[
  term ((48477184 : Rat) / 158397) [(2, 1), (4, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-24238592 : Rat) / 158397) [(2, 2), (4, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-24238592 : Rat) / 158397) [(3, 2), (4, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-48477184 : Rat) / 158397) [(4, 1), (7, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((24238592 : Rat) / 158397) [(4, 1), (7, 1), (9, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((24238592 : Rat) / 158397) [(4, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1061 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_1061_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_1061
        rs_R005_ueqv_R005NYN_generator_05_1000_1099 =
      rs_R005_ueqv_R005NYN_partial_05_1061 := by
  native_decide

/-- Coefficient term 1062 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_1062 : Poly :=
[
  term ((3682016 : Rat) / 385571) [(4, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1062 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_1062 : Poly :=
[
  term ((-7364032 : Rat) / 385571) [(2, 1), (4, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((3682016 : Rat) / 385571) [(2, 2), (4, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((3682016 : Rat) / 385571) [(3, 2), (4, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((7364032 : Rat) / 385571) [(4, 1), (7, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3682016 : Rat) / 385571) [(4, 1), (7, 1), (9, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3682016 : Rat) / 385571) [(4, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1062 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_1062_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_1062
        rs_R005_ueqv_R005NYN_generator_05_1000_1099 =
      rs_R005_ueqv_R005NYN_partial_05_1062 := by
  native_decide

/-- Coefficient term 1063 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_1063 : Poly :=
[
  term ((-5787200 : Rat) / 158397) [(4, 1), (7, 1), (10, 1), (14, 1), (15, 1)]
]

/-- Partial product 1063 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_1063 : Poly :=
[
  term ((11574400 : Rat) / 158397) [(2, 1), (4, 1), (7, 1), (10, 1), (14, 1), (15, 1)],
  term ((-5787200 : Rat) / 158397) [(2, 2), (4, 1), (7, 1), (10, 1), (14, 1), (15, 1)],
  term ((-5787200 : Rat) / 158397) [(3, 2), (4, 1), (7, 1), (10, 1), (14, 1), (15, 1)],
  term ((5787200 : Rat) / 158397) [(4, 1), (7, 1), (10, 1), (14, 1), (15, 3)],
  term ((-11574400 : Rat) / 158397) [(4, 1), (7, 1), (10, 1), (14, 2), (15, 1)],
  term ((5787200 : Rat) / 158397) [(4, 1), (7, 1), (10, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1063 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_1063_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_1063
        rs_R005_ueqv_R005NYN_generator_05_1000_1099 =
      rs_R005_ueqv_R005NYN_partial_05_1063 := by
  native_decide

/-- Coefficient term 1064 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_1064 : Poly :=
[
  term ((62340392 : Rat) / 385571) [(4, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1064 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_1064 : Poly :=
[
  term ((-124680784 : Rat) / 385571) [(2, 1), (4, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((62340392 : Rat) / 385571) [(2, 2), (4, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((62340392 : Rat) / 385571) [(3, 2), (4, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-62340392 : Rat) / 385571) [(4, 1), (7, 1), (10, 1), (14, 1), (15, 3), (16, 1)],
  term ((124680784 : Rat) / 385571) [(4, 1), (7, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-62340392 : Rat) / 385571) [(4, 1), (7, 1), (10, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1064 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_1064_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_1064
        rs_R005_ueqv_R005NYN_generator_05_1000_1099 =
      rs_R005_ueqv_R005NYN_partial_05_1064 := by
  native_decide

/-- Coefficient term 1065 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_1065 : Poly :=
[
  term ((-2893600 : Rat) / 158397) [(4, 1), (7, 1), (10, 1), (15, 1)]
]

/-- Partial product 1065 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_1065 : Poly :=
[
  term ((5787200 : Rat) / 158397) [(2, 1), (4, 1), (7, 1), (10, 1), (15, 1)],
  term ((-2893600 : Rat) / 158397) [(2, 2), (4, 1), (7, 1), (10, 1), (15, 1)],
  term ((-2893600 : Rat) / 158397) [(3, 2), (4, 1), (7, 1), (10, 1), (15, 1)],
  term ((-5787200 : Rat) / 158397) [(4, 1), (7, 1), (10, 1), (14, 1), (15, 1)],
  term ((2893600 : Rat) / 158397) [(4, 1), (7, 1), (10, 1), (14, 2), (15, 1)],
  term ((2893600 : Rat) / 158397) [(4, 1), (7, 1), (10, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1065 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_1065_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_1065
        rs_R005_ueqv_R005NYN_generator_05_1000_1099 =
      rs_R005_ueqv_R005NYN_partial_05_1065 := by
  native_decide

/-- Coefficient term 1066 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_1066 : Poly :=
[
  term ((31170196 : Rat) / 385571) [(4, 1), (7, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 1066 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_1066 : Poly :=
[
  term ((-62340392 : Rat) / 385571) [(2, 1), (4, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((31170196 : Rat) / 385571) [(2, 2), (4, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((31170196 : Rat) / 385571) [(3, 2), (4, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((62340392 : Rat) / 385571) [(4, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-31170196 : Rat) / 385571) [(4, 1), (7, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-31170196 : Rat) / 385571) [(4, 1), (7, 1), (10, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1066 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_1066_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_1066
        rs_R005_ueqv_R005NYN_generator_05_1000_1099 =
      rs_R005_ueqv_R005NYN_partial_05_1066 := by
  native_decide

/-- Coefficient term 1067 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_1067 : Poly :=
[
  term ((-3112960 : Rat) / 52799) [(4, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 1067 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_1067 : Poly :=
[
  term ((6225920 : Rat) / 52799) [(2, 1), (4, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-3112960 : Rat) / 52799) [(2, 2), (4, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-3112960 : Rat) / 52799) [(3, 2), (4, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-6225920 : Rat) / 52799) [(4, 1), (7, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((3112960 : Rat) / 52799) [(4, 1), (7, 1), (11, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((3112960 : Rat) / 52799) [(4, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1067 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_1067_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_1067
        rs_R005_ueqv_R005NYN_generator_05_1000_1099 =
      rs_R005_ueqv_R005NYN_partial_05_1067 := by
  native_decide

/-- Coefficient term 1068 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_1068 : Poly :=
[
  term ((9166080 : Rat) / 385571) [(4, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1068 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_1068 : Poly :=
[
  term ((-18332160 : Rat) / 385571) [(2, 1), (4, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((9166080 : Rat) / 385571) [(2, 2), (4, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((9166080 : Rat) / 385571) [(3, 2), (4, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((18332160 : Rat) / 385571) [(4, 1), (7, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9166080 : Rat) / 385571) [(4, 1), (7, 1), (11, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-9166080 : Rat) / 385571) [(4, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1068 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_1068_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_1068
        rs_R005_ueqv_R005NYN_generator_05_1000_1099 =
      rs_R005_ueqv_R005NYN_partial_05_1068 := by
  native_decide

/-- Coefficient term 1069 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_1069 : Poly :=
[
  term ((1556480 : Rat) / 52799) [(4, 1), (7, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 1069 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_1069 : Poly :=
[
  term ((-3112960 : Rat) / 52799) [(2, 1), (4, 1), (7, 1), (12, 1), (13, 1), (15, 2)],
  term ((1556480 : Rat) / 52799) [(2, 2), (4, 1), (7, 1), (12, 1), (13, 1), (15, 2)],
  term ((1556480 : Rat) / 52799) [(3, 2), (4, 1), (7, 1), (12, 1), (13, 1), (15, 2)],
  term ((3112960 : Rat) / 52799) [(4, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-1556480 : Rat) / 52799) [(4, 1), (7, 1), (12, 1), (13, 1), (14, 2), (15, 2)],
  term ((-1556480 : Rat) / 52799) [(4, 1), (7, 1), (12, 1), (13, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1069 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_1069_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_1069
        rs_R005_ueqv_R005NYN_generator_05_1000_1099 =
      rs_R005_ueqv_R005NYN_partial_05_1069 := by
  native_decide

/-- Coefficient term 1070 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_1070 : Poly :=
[
  term ((-4583040 : Rat) / 385571) [(4, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1070 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_1070 : Poly :=
[
  term ((9166080 : Rat) / 385571) [(2, 1), (4, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(2, 2), (4, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(3, 2), (4, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-9166080 : Rat) / 385571) [(4, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((4583040 : Rat) / 385571) [(4, 1), (7, 1), (12, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((4583040 : Rat) / 385571) [(4, 1), (7, 1), (12, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1070 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_1070_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_1070
        rs_R005_ueqv_R005NYN_generator_05_1000_1099 =
      rs_R005_ueqv_R005NYN_partial_05_1070 := by
  native_decide

/-- Coefficient term 1071 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_1071 : Poly :=
[
  term ((-11574400 : Rat) / 158397) [(4, 1), (7, 1), (12, 1), (15, 1)]
]

/-- Partial product 1071 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_1071 : Poly :=
[
  term ((23148800 : Rat) / 158397) [(2, 1), (4, 1), (7, 1), (12, 1), (15, 1)],
  term ((-11574400 : Rat) / 158397) [(2, 2), (4, 1), (7, 1), (12, 1), (15, 1)],
  term ((-11574400 : Rat) / 158397) [(3, 2), (4, 1), (7, 1), (12, 1), (15, 1)],
  term ((-23148800 : Rat) / 158397) [(4, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((11574400 : Rat) / 158397) [(4, 1), (7, 1), (12, 1), (14, 2), (15, 1)],
  term ((11574400 : Rat) / 158397) [(4, 1), (7, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1071 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_1071_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_1071
        rs_R005_ueqv_R005NYN_generator_05_1000_1099 =
      rs_R005_ueqv_R005NYN_partial_05_1071 := by
  native_decide

/-- Coefficient term 1072 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_1072 : Poly :=
[
  term ((124680784 : Rat) / 385571) [(4, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1072 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_1072 : Poly :=
[
  term ((-249361568 : Rat) / 385571) [(2, 1), (4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((124680784 : Rat) / 385571) [(2, 2), (4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((124680784 : Rat) / 385571) [(3, 2), (4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((249361568 : Rat) / 385571) [(4, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-124680784 : Rat) / 385571) [(4, 1), (7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-124680784 : Rat) / 385571) [(4, 1), (7, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1072 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_1072_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_1072
        rs_R005_ueqv_R005NYN_generator_05_1000_1099 =
      rs_R005_ueqv_R005NYN_partial_05_1072 := by
  native_decide

/-- Coefficient term 1073 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_1073 : Poly :=
[
  term ((11574400 : Rat) / 158397) [(4, 1), (7, 1), (12, 2), (15, 1)]
]

/-- Partial product 1073 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_1073 : Poly :=
[
  term ((-23148800 : Rat) / 158397) [(2, 1), (4, 1), (7, 1), (12, 2), (15, 1)],
  term ((11574400 : Rat) / 158397) [(2, 2), (4, 1), (7, 1), (12, 2), (15, 1)],
  term ((11574400 : Rat) / 158397) [(3, 2), (4, 1), (7, 1), (12, 2), (15, 1)],
  term ((23148800 : Rat) / 158397) [(4, 1), (7, 1), (12, 2), (14, 1), (15, 1)],
  term ((-11574400 : Rat) / 158397) [(4, 1), (7, 1), (12, 2), (14, 2), (15, 1)],
  term ((-11574400 : Rat) / 158397) [(4, 1), (7, 1), (12, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1073 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_1073_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_1073
        rs_R005_ueqv_R005NYN_generator_05_1000_1099 =
      rs_R005_ueqv_R005NYN_partial_05_1073 := by
  native_decide

/-- Coefficient term 1074 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_1074 : Poly :=
[
  term ((-124680784 : Rat) / 385571) [(4, 1), (7, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 1074 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_1074 : Poly :=
[
  term ((249361568 : Rat) / 385571) [(2, 1), (4, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-124680784 : Rat) / 385571) [(2, 2), (4, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-124680784 : Rat) / 385571) [(3, 2), (4, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-249361568 : Rat) / 385571) [(4, 1), (7, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((124680784 : Rat) / 385571) [(4, 1), (7, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((124680784 : Rat) / 385571) [(4, 1), (7, 1), (12, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1074 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_1074_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_1074
        rs_R005_ueqv_R005NYN_generator_05_1000_1099 =
      rs_R005_ueqv_R005NYN_partial_05_1074 := by
  native_decide

/-- Coefficient term 1075 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_1075 : Poly :=
[
  term ((4284800 : Rat) / 158397) [(4, 1), (7, 1), (14, 1), (15, 1)]
]

/-- Partial product 1075 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_1075 : Poly :=
[
  term ((-8569600 : Rat) / 158397) [(2, 1), (4, 1), (7, 1), (14, 1), (15, 1)],
  term ((4284800 : Rat) / 158397) [(2, 2), (4, 1), (7, 1), (14, 1), (15, 1)],
  term ((4284800 : Rat) / 158397) [(3, 2), (4, 1), (7, 1), (14, 1), (15, 1)],
  term ((-4284800 : Rat) / 158397) [(4, 1), (7, 1), (14, 1), (15, 3)],
  term ((8569600 : Rat) / 158397) [(4, 1), (7, 1), (14, 2), (15, 1)],
  term ((-4284800 : Rat) / 158397) [(4, 1), (7, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1075 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_1075_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_1075
        rs_R005_ueqv_R005NYN_generator_05_1000_1099 =
      rs_R005_ueqv_R005NYN_partial_05_1075 := by
  native_decide

/-- Coefficient term 1076 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_1076 : Poly :=
[
  term ((-64187960 : Rat) / 385571) [(4, 1), (7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1076 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_1076 : Poly :=
[
  term ((128375920 : Rat) / 385571) [(2, 1), (4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-64187960 : Rat) / 385571) [(2, 2), (4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-64187960 : Rat) / 385571) [(3, 2), (4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((64187960 : Rat) / 385571) [(4, 1), (7, 1), (14, 1), (15, 3), (16, 1)],
  term ((-128375920 : Rat) / 385571) [(4, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((64187960 : Rat) / 385571) [(4, 1), (7, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1076 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_1076_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_1076
        rs_R005_ueqv_R005NYN_generator_05_1000_1099 =
      rs_R005_ueqv_R005NYN_partial_05_1076 := by
  native_decide

/-- Coefficient term 1077 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_1077 : Poly :=
[
  term ((16720 : Rat) / 52799) [(4, 1), (7, 1), (15, 1)]
]

/-- Partial product 1077 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_1077 : Poly :=
[
  term ((-33440 : Rat) / 52799) [(2, 1), (4, 1), (7, 1), (15, 1)],
  term ((16720 : Rat) / 52799) [(2, 2), (4, 1), (7, 1), (15, 1)],
  term ((16720 : Rat) / 52799) [(3, 2), (4, 1), (7, 1), (15, 1)],
  term ((33440 : Rat) / 52799) [(4, 1), (7, 1), (14, 1), (15, 1)],
  term ((-16720 : Rat) / 52799) [(4, 1), (7, 1), (14, 2), (15, 1)],
  term ((-16720 : Rat) / 52799) [(4, 1), (7, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1077 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_1077_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_1077
        rs_R005_ueqv_R005NYN_generator_05_1000_1099 =
      rs_R005_ueqv_R005NYN_partial_05_1077 := by
  native_decide

/-- Coefficient term 1078 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_1078 : Poly :=
[
  term ((-31194042 : Rat) / 385571) [(4, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 1078 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_1078 : Poly :=
[
  term ((62388084 : Rat) / 385571) [(2, 1), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-31194042 : Rat) / 385571) [(2, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-31194042 : Rat) / 385571) [(3, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-62388084 : Rat) / 385571) [(4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((31194042 : Rat) / 385571) [(4, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((31194042 : Rat) / 385571) [(4, 1), (7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1078 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_1078_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_1078
        rs_R005_ueqv_R005NYN_generator_05_1000_1099 =
      rs_R005_ueqv_R005NYN_partial_05_1078 := by
  native_decide

/-- Coefficient term 1079 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_1079 : Poly :=
[
  term ((11574400 : Rat) / 158397) [(4, 1), (7, 2), (8, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 1079 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_1079 : Poly :=
[
  term ((-23148800 : Rat) / 158397) [(2, 1), (4, 1), (7, 2), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((11574400 : Rat) / 158397) [(2, 2), (4, 1), (7, 2), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((11574400 : Rat) / 158397) [(3, 2), (4, 1), (7, 2), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((23148800 : Rat) / 158397) [(4, 1), (7, 2), (8, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-11574400 : Rat) / 158397) [(4, 1), (7, 2), (8, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-11574400 : Rat) / 158397) [(4, 1), (7, 2), (8, 1), (12, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1079 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_1079_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_1079
        rs_R005_ueqv_R005NYN_generator_05_1000_1099 =
      rs_R005_ueqv_R005NYN_partial_05_1079 := by
  native_decide

/-- Coefficient term 1080 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_1080 : Poly :=
[
  term ((-124680784 : Rat) / 385571) [(4, 1), (7, 2), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1080 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_1080 : Poly :=
[
  term ((249361568 : Rat) / 385571) [(2, 1), (4, 1), (7, 2), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-124680784 : Rat) / 385571) [(2, 2), (4, 1), (7, 2), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-124680784 : Rat) / 385571) [(3, 2), (4, 1), (7, 2), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-249361568 : Rat) / 385571) [(4, 1), (7, 2), (8, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((124680784 : Rat) / 385571) [(4, 1), (7, 2), (8, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((124680784 : Rat) / 385571) [(4, 1), (7, 2), (8, 1), (12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1080 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_1080_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_1080
        rs_R005_ueqv_R005NYN_generator_05_1000_1099 =
      rs_R005_ueqv_R005NYN_partial_05_1080 := by
  native_decide

/-- Coefficient term 1081 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_1081 : Poly :=
[
  term ((-11574400 : Rat) / 158397) [(4, 1), (7, 2), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 1081 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_1081 : Poly :=
[
  term ((23148800 : Rat) / 158397) [(2, 1), (4, 1), (7, 2), (12, 1), (13, 1), (15, 1)],
  term ((-11574400 : Rat) / 158397) [(2, 2), (4, 1), (7, 2), (12, 1), (13, 1), (15, 1)],
  term ((-11574400 : Rat) / 158397) [(3, 2), (4, 1), (7, 2), (12, 1), (13, 1), (15, 1)],
  term ((-23148800 : Rat) / 158397) [(4, 1), (7, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((11574400 : Rat) / 158397) [(4, 1), (7, 2), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((11574400 : Rat) / 158397) [(4, 1), (7, 2), (12, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1081 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_1081_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_1081
        rs_R005_ueqv_R005NYN_generator_05_1000_1099 =
      rs_R005_ueqv_R005NYN_partial_05_1081 := by
  native_decide

/-- Coefficient term 1082 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_1082 : Poly :=
[
  term ((124680784 : Rat) / 385571) [(4, 1), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1082 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_1082 : Poly :=
[
  term ((-249361568 : Rat) / 385571) [(2, 1), (4, 1), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((124680784 : Rat) / 385571) [(2, 2), (4, 1), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((124680784 : Rat) / 385571) [(3, 2), (4, 1), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((249361568 : Rat) / 385571) [(4, 1), (7, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-124680784 : Rat) / 385571) [(4, 1), (7, 2), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-124680784 : Rat) / 385571) [(4, 1), (7, 2), (12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1082 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_1082_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_1082
        rs_R005_ueqv_R005NYN_generator_05_1000_1099 =
      rs_R005_ueqv_R005NYN_partial_05_1082 := by
  native_decide

/-- Coefficient term 1083 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_1083 : Poly :=
[
  term ((12119296 : Rat) / 158397) [(4, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1)]
]

/-- Partial product 1083 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_1083 : Poly :=
[
  term ((-24238592 : Rat) / 158397) [(2, 1), (4, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((12119296 : Rat) / 158397) [(2, 2), (4, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((12119296 : Rat) / 158397) [(3, 2), (4, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-12119296 : Rat) / 158397) [(4, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 3)],
  term ((24238592 : Rat) / 158397) [(4, 1), (8, 1), (9, 1), (10, 1), (14, 2), (15, 1)],
  term ((-12119296 : Rat) / 158397) [(4, 1), (8, 1), (9, 1), (10, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1083 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_1083_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_1083
        rs_R005_ueqv_R005NYN_generator_05_1000_1099 =
      rs_R005_ueqv_R005NYN_partial_05_1083 := by
  native_decide

/-- Coefficient term 1084 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_1084 : Poly :=
[
  term ((-1841008 : Rat) / 385571) [(4, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1084 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_1084 : Poly :=
[
  term ((3682016 : Rat) / 385571) [(2, 1), (4, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1841008 : Rat) / 385571) [(2, 2), (4, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1841008 : Rat) / 385571) [(3, 2), (4, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((1841008 : Rat) / 385571) [(4, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 3), (16, 1)],
  term ((-3682016 : Rat) / 385571) [(4, 1), (8, 1), (9, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((1841008 : Rat) / 385571) [(4, 1), (8, 1), (9, 1), (10, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1084 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_1084_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_1084
        rs_R005_ueqv_R005NYN_generator_05_1000_1099 =
      rs_R005_ueqv_R005NYN_partial_05_1084 := by
  native_decide

/-- Coefficient term 1085 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_1085 : Poly :=
[
  term ((6059648 : Rat) / 158397) [(4, 1), (8, 1), (9, 1), (10, 1), (15, 1)]
]

/-- Partial product 1085 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_1085 : Poly :=
[
  term ((-12119296 : Rat) / 158397) [(2, 1), (4, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((6059648 : Rat) / 158397) [(2, 2), (4, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((6059648 : Rat) / 158397) [(3, 2), (4, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((12119296 : Rat) / 158397) [(4, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-6059648 : Rat) / 158397) [(4, 1), (8, 1), (9, 1), (10, 1), (14, 2), (15, 1)],
  term ((-6059648 : Rat) / 158397) [(4, 1), (8, 1), (9, 1), (10, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1085 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_1085_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_1085
        rs_R005_ueqv_R005NYN_generator_05_1000_1099 =
      rs_R005_ueqv_R005NYN_partial_05_1085 := by
  native_decide

/-- Coefficient term 1086 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_1086 : Poly :=
[
  term ((-920504 : Rat) / 385571) [(4, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 1086 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_1086 : Poly :=
[
  term ((1841008 : Rat) / 385571) [(2, 1), (4, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-920504 : Rat) / 385571) [(2, 2), (4, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-920504 : Rat) / 385571) [(3, 2), (4, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1841008 : Rat) / 385571) [(4, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((920504 : Rat) / 385571) [(4, 1), (8, 1), (9, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((920504 : Rat) / 385571) [(4, 1), (8, 1), (9, 1), (10, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1086 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_1086_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_1086
        rs_R005_ueqv_R005NYN_generator_05_1000_1099 =
      rs_R005_ueqv_R005NYN_partial_05_1086 := by
  native_decide

/-- Coefficient term 1087 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_1087 : Poly :=
[
  term ((2781440 : Rat) / 158397) [(4, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 1087 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_1087 : Poly :=
[
  term ((-5562880 : Rat) / 158397) [(2, 1), (4, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((2781440 : Rat) / 158397) [(2, 2), (4, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((2781440 : Rat) / 158397) [(3, 2), (4, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-2781440 : Rat) / 158397) [(4, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 3)],
  term ((5562880 : Rat) / 158397) [(4, 1), (8, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((-2781440 : Rat) / 158397) [(4, 1), (8, 1), (9, 1), (12, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1087 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_1087_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_1087
        rs_R005_ueqv_R005NYN_generator_05_1000_1099 =
      rs_R005_ueqv_R005NYN_partial_05_1087 := by
  native_decide

/-- Coefficient term 1088 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_1088 : Poly :=
[
  term ((74351008 : Rat) / 385571) [(4, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1088 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_1088 : Poly :=
[
  term ((-148702016 : Rat) / 385571) [(2, 1), (4, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((74351008 : Rat) / 385571) [(2, 2), (4, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((74351008 : Rat) / 385571) [(3, 2), (4, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-74351008 : Rat) / 385571) [(4, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((148702016 : Rat) / 385571) [(4, 1), (8, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-74351008 : Rat) / 385571) [(4, 1), (8, 1), (9, 1), (12, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1088 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_1088_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_1088
        rs_R005_ueqv_R005NYN_generator_05_1000_1099 =
      rs_R005_ueqv_R005NYN_partial_05_1088 := by
  native_decide

/-- Coefficient term 1089 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_1089 : Poly :=
[
  term ((-24238592 : Rat) / 158397) [(4, 1), (8, 1), (9, 1), (12, 2), (15, 1)]
]

/-- Partial product 1089 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_1089 : Poly :=
[
  term ((48477184 : Rat) / 158397) [(2, 1), (4, 1), (8, 1), (9, 1), (12, 2), (15, 1)],
  term ((-24238592 : Rat) / 158397) [(2, 2), (4, 1), (8, 1), (9, 1), (12, 2), (15, 1)],
  term ((-24238592 : Rat) / 158397) [(3, 2), (4, 1), (8, 1), (9, 1), (12, 2), (15, 1)],
  term ((-48477184 : Rat) / 158397) [(4, 1), (8, 1), (9, 1), (12, 2), (14, 1), (15, 1)],
  term ((24238592 : Rat) / 158397) [(4, 1), (8, 1), (9, 1), (12, 2), (14, 2), (15, 1)],
  term ((24238592 : Rat) / 158397) [(4, 1), (8, 1), (9, 1), (12, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1089 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_1089_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_1089
        rs_R005_ueqv_R005NYN_generator_05_1000_1099 =
      rs_R005_ueqv_R005NYN_partial_05_1089 := by
  native_decide

/-- Coefficient term 1090 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_1090 : Poly :=
[
  term ((3682016 : Rat) / 385571) [(4, 1), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 1090 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_1090 : Poly :=
[
  term ((-7364032 : Rat) / 385571) [(2, 1), (4, 1), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((3682016 : Rat) / 385571) [(2, 2), (4, 1), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((3682016 : Rat) / 385571) [(3, 2), (4, 1), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((7364032 : Rat) / 385571) [(4, 1), (8, 1), (9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-3682016 : Rat) / 385571) [(4, 1), (8, 1), (9, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((-3682016 : Rat) / 385571) [(4, 1), (8, 1), (9, 1), (12, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1090 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_1090_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_1090
        rs_R005_ueqv_R005NYN_generator_05_1000_1099 =
      rs_R005_ueqv_R005NYN_partial_05_1090 := by
  native_decide

/-- Coefficient term 1091 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_1091 : Poly :=
[
  term ((-6059648 : Rat) / 158397) [(4, 1), (8, 1), (9, 1), (14, 1), (15, 1)]
]

/-- Partial product 1091 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_1091 : Poly :=
[
  term ((12119296 : Rat) / 158397) [(2, 1), (4, 1), (8, 1), (9, 1), (14, 1), (15, 1)],
  term ((-6059648 : Rat) / 158397) [(2, 2), (4, 1), (8, 1), (9, 1), (14, 1), (15, 1)],
  term ((-6059648 : Rat) / 158397) [(3, 2), (4, 1), (8, 1), (9, 1), (14, 1), (15, 1)],
  term ((6059648 : Rat) / 158397) [(4, 1), (8, 1), (9, 1), (14, 1), (15, 3)],
  term ((-12119296 : Rat) / 158397) [(4, 1), (8, 1), (9, 1), (14, 2), (15, 1)],
  term ((6059648 : Rat) / 158397) [(4, 1), (8, 1), (9, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1091 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_1091_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_1091
        rs_R005_ueqv_R005NYN_generator_05_1000_1099 =
      rs_R005_ueqv_R005NYN_partial_05_1091 := by
  native_decide

/-- Coefficient term 1092 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_1092 : Poly :=
[
  term ((920504 : Rat) / 385571) [(4, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1092 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_1092 : Poly :=
[
  term ((-1841008 : Rat) / 385571) [(2, 1), (4, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((920504 : Rat) / 385571) [(2, 2), (4, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((920504 : Rat) / 385571) [(3, 2), (4, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-920504 : Rat) / 385571) [(4, 1), (8, 1), (9, 1), (14, 1), (15, 3), (16, 1)],
  term ((1841008 : Rat) / 385571) [(4, 1), (8, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-920504 : Rat) / 385571) [(4, 1), (8, 1), (9, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1092 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_1092_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_1092
        rs_R005_ueqv_R005NYN_generator_05_1000_1099 =
      rs_R005_ueqv_R005NYN_partial_05_1092 := by
  native_decide

/-- Coefficient term 1093 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_1093 : Poly :=
[
  term ((-948160 : Rat) / 52799) [(4, 1), (8, 1), (9, 1), (15, 1)]
]

/-- Partial product 1093 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_1093 : Poly :=
[
  term ((1896320 : Rat) / 52799) [(2, 1), (4, 1), (8, 1), (9, 1), (15, 1)],
  term ((-948160 : Rat) / 52799) [(2, 2), (4, 1), (8, 1), (9, 1), (15, 1)],
  term ((-948160 : Rat) / 52799) [(3, 2), (4, 1), (8, 1), (9, 1), (15, 1)],
  term ((-1896320 : Rat) / 52799) [(4, 1), (8, 1), (9, 1), (14, 1), (15, 1)],
  term ((948160 : Rat) / 52799) [(4, 1), (8, 1), (9, 1), (14, 2), (15, 1)],
  term ((948160 : Rat) / 52799) [(4, 1), (8, 1), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1093 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_1093_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_1093
        rs_R005_ueqv_R005NYN_generator_05_1000_1099 =
      rs_R005_ueqv_R005NYN_partial_05_1093 := by
  native_decide

/-- Coefficient term 1094 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_1094 : Poly :=
[
  term ((12883404 : Rat) / 385571) [(4, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 1094 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_1094 : Poly :=
[
  term ((-25766808 : Rat) / 385571) [(2, 1), (4, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((12883404 : Rat) / 385571) [(2, 2), (4, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((12883404 : Rat) / 385571) [(3, 2), (4, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((25766808 : Rat) / 385571) [(4, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12883404 : Rat) / 385571) [(4, 1), (8, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-12883404 : Rat) / 385571) [(4, 1), (8, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1094 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_1094_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_1094
        rs_R005_ueqv_R005NYN_generator_05_1000_1099 =
      rs_R005_ueqv_R005NYN_partial_05_1094 := by
  native_decide

/-- Coefficient term 1095 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_1095 : Poly :=
[
  term ((1556480 : Rat) / 52799) [(4, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 1095 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_1095 : Poly :=
[
  term ((-3112960 : Rat) / 52799) [(2, 1), (4, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((1556480 : Rat) / 52799) [(2, 2), (4, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((1556480 : Rat) / 52799) [(3, 2), (4, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-1556480 : Rat) / 52799) [(4, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 3)],
  term ((3112960 : Rat) / 52799) [(4, 1), (8, 1), (10, 1), (11, 1), (14, 2), (15, 1)],
  term ((-1556480 : Rat) / 52799) [(4, 1), (8, 1), (10, 1), (11, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1095 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_1095_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_1095
        rs_R005_ueqv_R005NYN_generator_05_1000_1099 =
      rs_R005_ueqv_R005NYN_partial_05_1095 := by
  native_decide

/-- Coefficient term 1096 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_1096 : Poly :=
[
  term ((-4583040 : Rat) / 385571) [(4, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1096 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_1096 : Poly :=
[
  term ((9166080 : Rat) / 385571) [(2, 1), (4, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(2, 2), (4, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(3, 2), (4, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((4583040 : Rat) / 385571) [(4, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((-9166080 : Rat) / 385571) [(4, 1), (8, 1), (10, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((4583040 : Rat) / 385571) [(4, 1), (8, 1), (10, 1), (11, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1096 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_1096_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_1096
        rs_R005_ueqv_R005NYN_generator_05_1000_1099 =
      rs_R005_ueqv_R005NYN_partial_05_1096 := by
  native_decide

/-- Coefficient term 1097 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_1097 : Poly :=
[
  term ((778240 : Rat) / 52799) [(4, 1), (8, 1), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 1097 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_1097 : Poly :=
[
  term ((-1556480 : Rat) / 52799) [(2, 1), (4, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((778240 : Rat) / 52799) [(2, 2), (4, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((778240 : Rat) / 52799) [(3, 2), (4, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((1556480 : Rat) / 52799) [(4, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-778240 : Rat) / 52799) [(4, 1), (8, 1), (10, 1), (11, 1), (14, 2), (15, 1)],
  term ((-778240 : Rat) / 52799) [(4, 1), (8, 1), (10, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1097 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_1097_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_1097
        rs_R005_ueqv_R005NYN_generator_05_1000_1099 =
      rs_R005_ueqv_R005NYN_partial_05_1097 := by
  native_decide

/-- Coefficient term 1098 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_1098 : Poly :=
[
  term ((-2291520 : Rat) / 385571) [(4, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1098 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_1098 : Poly :=
[
  term ((4583040 : Rat) / 385571) [(2, 1), (4, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2291520 : Rat) / 385571) [(2, 2), (4, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2291520 : Rat) / 385571) [(3, 2), (4, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(4, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((2291520 : Rat) / 385571) [(4, 1), (8, 1), (10, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((2291520 : Rat) / 385571) [(4, 1), (8, 1), (10, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1098 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_1098_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_1098
        rs_R005_ueqv_R005NYN_generator_05_1000_1099 =
      rs_R005_ueqv_R005NYN_partial_05_1098 := by
  native_decide

/-- Coefficient term 1099 from coefficient polynomial 5. -/
def rs_R005_ueqv_R005NYN_coefficient_05_1099 : Poly :=
[
  term ((-778240 : Rat) / 52799) [(4, 1), (8, 1), (10, 1), (14, 1), (15, 2)]
]

/-- Partial product 1099 for generator 5. -/
def rs_R005_ueqv_R005NYN_partial_05_1099 : Poly :=
[
  term ((1556480 : Rat) / 52799) [(2, 1), (4, 1), (8, 1), (10, 1), (14, 1), (15, 2)],
  term ((-778240 : Rat) / 52799) [(2, 2), (4, 1), (8, 1), (10, 1), (14, 1), (15, 2)],
  term ((-778240 : Rat) / 52799) [(3, 2), (4, 1), (8, 1), (10, 1), (14, 1), (15, 2)],
  term ((778240 : Rat) / 52799) [(4, 1), (8, 1), (10, 1), (14, 1), (15, 4)],
  term ((-1556480 : Rat) / 52799) [(4, 1), (8, 1), (10, 1), (14, 2), (15, 2)],
  term ((778240 : Rat) / 52799) [(4, 1), (8, 1), (10, 1), (14, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1099 for generator 5. -/
theorem rs_R005_ueqv_R005NYN_partial_05_1099_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_05_1099
        rs_R005_ueqv_R005NYN_generator_05_1000_1099 =
      rs_R005_ueqv_R005NYN_partial_05_1099 := by
  native_decide

/-- Partial products in this block. -/
def rs_R005_ueqv_R005NYN_partials_05_1000_1099 : List Poly :=
[
  rs_R005_ueqv_R005NYN_partial_05_1000,
  rs_R005_ueqv_R005NYN_partial_05_1001,
  rs_R005_ueqv_R005NYN_partial_05_1002,
  rs_R005_ueqv_R005NYN_partial_05_1003,
  rs_R005_ueqv_R005NYN_partial_05_1004,
  rs_R005_ueqv_R005NYN_partial_05_1005,
  rs_R005_ueqv_R005NYN_partial_05_1006,
  rs_R005_ueqv_R005NYN_partial_05_1007,
  rs_R005_ueqv_R005NYN_partial_05_1008,
  rs_R005_ueqv_R005NYN_partial_05_1009,
  rs_R005_ueqv_R005NYN_partial_05_1010,
  rs_R005_ueqv_R005NYN_partial_05_1011,
  rs_R005_ueqv_R005NYN_partial_05_1012,
  rs_R005_ueqv_R005NYN_partial_05_1013,
  rs_R005_ueqv_R005NYN_partial_05_1014,
  rs_R005_ueqv_R005NYN_partial_05_1015,
  rs_R005_ueqv_R005NYN_partial_05_1016,
  rs_R005_ueqv_R005NYN_partial_05_1017,
  rs_R005_ueqv_R005NYN_partial_05_1018,
  rs_R005_ueqv_R005NYN_partial_05_1019,
  rs_R005_ueqv_R005NYN_partial_05_1020,
  rs_R005_ueqv_R005NYN_partial_05_1021,
  rs_R005_ueqv_R005NYN_partial_05_1022,
  rs_R005_ueqv_R005NYN_partial_05_1023,
  rs_R005_ueqv_R005NYN_partial_05_1024,
  rs_R005_ueqv_R005NYN_partial_05_1025,
  rs_R005_ueqv_R005NYN_partial_05_1026,
  rs_R005_ueqv_R005NYN_partial_05_1027,
  rs_R005_ueqv_R005NYN_partial_05_1028,
  rs_R005_ueqv_R005NYN_partial_05_1029,
  rs_R005_ueqv_R005NYN_partial_05_1030,
  rs_R005_ueqv_R005NYN_partial_05_1031,
  rs_R005_ueqv_R005NYN_partial_05_1032,
  rs_R005_ueqv_R005NYN_partial_05_1033,
  rs_R005_ueqv_R005NYN_partial_05_1034,
  rs_R005_ueqv_R005NYN_partial_05_1035,
  rs_R005_ueqv_R005NYN_partial_05_1036,
  rs_R005_ueqv_R005NYN_partial_05_1037,
  rs_R005_ueqv_R005NYN_partial_05_1038,
  rs_R005_ueqv_R005NYN_partial_05_1039,
  rs_R005_ueqv_R005NYN_partial_05_1040,
  rs_R005_ueqv_R005NYN_partial_05_1041,
  rs_R005_ueqv_R005NYN_partial_05_1042,
  rs_R005_ueqv_R005NYN_partial_05_1043,
  rs_R005_ueqv_R005NYN_partial_05_1044,
  rs_R005_ueqv_R005NYN_partial_05_1045,
  rs_R005_ueqv_R005NYN_partial_05_1046,
  rs_R005_ueqv_R005NYN_partial_05_1047,
  rs_R005_ueqv_R005NYN_partial_05_1048,
  rs_R005_ueqv_R005NYN_partial_05_1049,
  rs_R005_ueqv_R005NYN_partial_05_1050,
  rs_R005_ueqv_R005NYN_partial_05_1051,
  rs_R005_ueqv_R005NYN_partial_05_1052,
  rs_R005_ueqv_R005NYN_partial_05_1053,
  rs_R005_ueqv_R005NYN_partial_05_1054,
  rs_R005_ueqv_R005NYN_partial_05_1055,
  rs_R005_ueqv_R005NYN_partial_05_1056,
  rs_R005_ueqv_R005NYN_partial_05_1057,
  rs_R005_ueqv_R005NYN_partial_05_1058,
  rs_R005_ueqv_R005NYN_partial_05_1059,
  rs_R005_ueqv_R005NYN_partial_05_1060,
  rs_R005_ueqv_R005NYN_partial_05_1061,
  rs_R005_ueqv_R005NYN_partial_05_1062,
  rs_R005_ueqv_R005NYN_partial_05_1063,
  rs_R005_ueqv_R005NYN_partial_05_1064,
  rs_R005_ueqv_R005NYN_partial_05_1065,
  rs_R005_ueqv_R005NYN_partial_05_1066,
  rs_R005_ueqv_R005NYN_partial_05_1067,
  rs_R005_ueqv_R005NYN_partial_05_1068,
  rs_R005_ueqv_R005NYN_partial_05_1069,
  rs_R005_ueqv_R005NYN_partial_05_1070,
  rs_R005_ueqv_R005NYN_partial_05_1071,
  rs_R005_ueqv_R005NYN_partial_05_1072,
  rs_R005_ueqv_R005NYN_partial_05_1073,
  rs_R005_ueqv_R005NYN_partial_05_1074,
  rs_R005_ueqv_R005NYN_partial_05_1075,
  rs_R005_ueqv_R005NYN_partial_05_1076,
  rs_R005_ueqv_R005NYN_partial_05_1077,
  rs_R005_ueqv_R005NYN_partial_05_1078,
  rs_R005_ueqv_R005NYN_partial_05_1079,
  rs_R005_ueqv_R005NYN_partial_05_1080,
  rs_R005_ueqv_R005NYN_partial_05_1081,
  rs_R005_ueqv_R005NYN_partial_05_1082,
  rs_R005_ueqv_R005NYN_partial_05_1083,
  rs_R005_ueqv_R005NYN_partial_05_1084,
  rs_R005_ueqv_R005NYN_partial_05_1085,
  rs_R005_ueqv_R005NYN_partial_05_1086,
  rs_R005_ueqv_R005NYN_partial_05_1087,
  rs_R005_ueqv_R005NYN_partial_05_1088,
  rs_R005_ueqv_R005NYN_partial_05_1089,
  rs_R005_ueqv_R005NYN_partial_05_1090,
  rs_R005_ueqv_R005NYN_partial_05_1091,
  rs_R005_ueqv_R005NYN_partial_05_1092,
  rs_R005_ueqv_R005NYN_partial_05_1093,
  rs_R005_ueqv_R005NYN_partial_05_1094,
  rs_R005_ueqv_R005NYN_partial_05_1095,
  rs_R005_ueqv_R005NYN_partial_05_1096,
  rs_R005_ueqv_R005NYN_partial_05_1097,
  rs_R005_ueqv_R005NYN_partial_05_1098,
  rs_R005_ueqv_R005NYN_partial_05_1099
]

/-- Sum of partial products in this block. -/
def rs_R005_ueqv_R005NYN_block_05_1000_1099 : Poly :=
[
  term ((-9166080 : Rat) / 385571) [(2, 1), (4, 1), (5, 1), (12, 1), (15, 3), (16, 1)],
  term ((23920640 : Rat) / 52799) [(2, 1), (4, 1), (5, 1), (12, 2), (15, 1)],
  term ((-51226368 : Rat) / 385571) [(2, 1), (4, 1), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((50334976 : Rat) / 158397) [(2, 1), (4, 1), (5, 1), (14, 1), (15, 1)],
  term ((-29745712 : Rat) / 385571) [(2, 1), (4, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((10661048 : Rat) / 158397) [(2, 1), (4, 1), (5, 1), (15, 1)],
  term ((-6403296 : Rat) / 385571) [(2, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-23920640 : Rat) / 52799) [(2, 1), (4, 1), (5, 2), (8, 1), (12, 1), (15, 2)],
  term ((51226368 : Rat) / 385571) [(2, 1), (4, 1), (5, 2), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((23920640 : Rat) / 52799) [(2, 1), (4, 1), (5, 2), (12, 1), (15, 2)],
  term ((-51226368 : Rat) / 385571) [(2, 1), (4, 1), (5, 2), (12, 1), (15, 2), (16, 1)],
  term ((23148800 : Rat) / 158397) [(2, 1), (4, 1), (6, 1), (7, 1), (8, 1), (12, 1), (15, 1)],
  term ((-249361568 : Rat) / 385571) [(2, 1), (4, 1), (6, 1), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-23148800 : Rat) / 158397) [(2, 1), (4, 1), (6, 1), (7, 1), (8, 1), (12, 2), (15, 1)],
  term ((249361568 : Rat) / 385571) [(2, 1), (4, 1), (6, 1), (7, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-23148800 : Rat) / 158397) [(2, 1), (4, 1), (6, 1), (7, 1), (12, 1), (15, 1)],
  term ((249361568 : Rat) / 385571) [(2, 1), (4, 1), (6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((23148800 : Rat) / 158397) [(2, 1), (4, 1), (6, 1), (7, 1), (12, 2), (15, 1)],
  term ((-249361568 : Rat) / 385571) [(2, 1), (4, 1), (6, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((48477184 : Rat) / 158397) [(2, 1), (4, 1), (6, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-7364032 : Rat) / 385571) [(2, 1), (4, 1), (6, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-48477184 : Rat) / 158397) [(2, 1), (4, 1), (6, 1), (8, 1), (9, 1), (12, 2), (15, 1)],
  term ((7364032 : Rat) / 385571) [(2, 1), (4, 1), (6, 1), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((6225920 : Rat) / 52799) [(2, 1), (4, 1), (6, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-18332160 : Rat) / 385571) [(2, 1), (4, 1), (6, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-6225920 : Rat) / 52799) [(2, 1), (4, 1), (6, 1), (8, 1), (11, 1), (12, 2), (15, 1)],
  term ((18332160 : Rat) / 385571) [(2, 1), (4, 1), (6, 1), (8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-3112960 : Rat) / 52799) [(2, 1), (4, 1), (6, 1), (8, 1), (12, 1), (15, 2)],
  term ((9166080 : Rat) / 385571) [(2, 1), (4, 1), (6, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((3112960 : Rat) / 52799) [(2, 1), (4, 1), (6, 1), (8, 1), (12, 2), (15, 2)],
  term ((-9166080 : Rat) / 385571) [(2, 1), (4, 1), (6, 1), (8, 1), (12, 2), (15, 2), (16, 1)],
  term ((-48477184 : Rat) / 158397) [(2, 1), (4, 1), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((7364032 : Rat) / 385571) [(2, 1), (4, 1), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((48477184 : Rat) / 158397) [(2, 1), (4, 1), (6, 1), (9, 1), (12, 2), (15, 1)],
  term ((-7364032 : Rat) / 385571) [(2, 1), (4, 1), (6, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-6225920 : Rat) / 52799) [(2, 1), (4, 1), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((18332160 : Rat) / 385571) [(2, 1), (4, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((6225920 : Rat) / 52799) [(2, 1), (4, 1), (6, 1), (11, 1), (12, 2), (15, 1)],
  term ((-18332160 : Rat) / 385571) [(2, 1), (4, 1), (6, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((3112960 : Rat) / 52799) [(2, 1), (4, 1), (6, 1), (12, 1), (15, 2)],
  term ((-9166080 : Rat) / 385571) [(2, 1), (4, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-3112960 : Rat) / 52799) [(2, 1), (4, 1), (6, 1), (12, 2), (15, 2)],
  term ((9166080 : Rat) / 385571) [(2, 1), (4, 1), (6, 1), (12, 2), (15, 2), (16, 1)],
  term ((-6432640 : Rat) / 158397) [(2, 1), (4, 1), (6, 1), (15, 2)],
  term ((47655232 : Rat) / 385571) [(2, 1), (4, 1), (6, 1), (15, 2), (16, 1)],
  term ((-48477184 : Rat) / 158397) [(2, 1), (4, 1), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((7364032 : Rat) / 385571) [(2, 1), (4, 1), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-11574400 : Rat) / 158397) [(2, 1), (4, 1), (7, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((124680784 : Rat) / 385571) [(2, 1), (4, 1), (7, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5787200 : Rat) / 158397) [(2, 1), (4, 1), (7, 1), (8, 1), (10, 1), (15, 1)],
  term ((62340392 : Rat) / 385571) [(2, 1), (4, 1), (7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-6225920 : Rat) / 52799) [(2, 1), (4, 1), (7, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((18332160 : Rat) / 385571) [(2, 1), (4, 1), (7, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((3112960 : Rat) / 52799) [(2, 1), (4, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 2)],
  term ((-9166080 : Rat) / 385571) [(2, 1), (4, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((23148800 : Rat) / 158397) [(2, 1), (4, 1), (7, 1), (8, 1), (12, 2), (15, 1)],
  term ((-249361568 : Rat) / 385571) [(2, 1), (4, 1), (7, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((5787200 : Rat) / 158397) [(2, 1), (4, 1), (7, 1), (8, 1), (14, 1), (15, 1)],
  term ((-62340392 : Rat) / 385571) [(2, 1), (4, 1), (7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2893600 : Rat) / 52799) [(2, 1), (4, 1), (7, 1), (8, 1), (15, 1)],
  term ((93510588 : Rat) / 385571) [(2, 1), (4, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((48477184 : Rat) / 158397) [(2, 1), (4, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-7364032 : Rat) / 385571) [(2, 1), (4, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((11574400 : Rat) / 158397) [(2, 1), (4, 1), (7, 1), (10, 1), (14, 1), (15, 1)],
  term ((-124680784 : Rat) / 385571) [(2, 1), (4, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((5787200 : Rat) / 158397) [(2, 1), (4, 1), (7, 1), (10, 1), (15, 1)],
  term ((-62340392 : Rat) / 385571) [(2, 1), (4, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((6225920 : Rat) / 52799) [(2, 1), (4, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-18332160 : Rat) / 385571) [(2, 1), (4, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3112960 : Rat) / 52799) [(2, 1), (4, 1), (7, 1), (12, 1), (13, 1), (15, 2)],
  term ((9166080 : Rat) / 385571) [(2, 1), (4, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((23148800 : Rat) / 158397) [(2, 1), (4, 1), (7, 1), (12, 1), (15, 1)],
  term ((-249361568 : Rat) / 385571) [(2, 1), (4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-23148800 : Rat) / 158397) [(2, 1), (4, 1), (7, 1), (12, 2), (15, 1)],
  term ((249361568 : Rat) / 385571) [(2, 1), (4, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-8569600 : Rat) / 158397) [(2, 1), (4, 1), (7, 1), (14, 1), (15, 1)],
  term ((128375920 : Rat) / 385571) [(2, 1), (4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-33440 : Rat) / 52799) [(2, 1), (4, 1), (7, 1), (15, 1)],
  term ((62388084 : Rat) / 385571) [(2, 1), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-23148800 : Rat) / 158397) [(2, 1), (4, 1), (7, 2), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((249361568 : Rat) / 385571) [(2, 1), (4, 1), (7, 2), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((23148800 : Rat) / 158397) [(2, 1), (4, 1), (7, 2), (12, 1), (13, 1), (15, 1)],
  term ((-249361568 : Rat) / 385571) [(2, 1), (4, 1), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-24238592 : Rat) / 158397) [(2, 1), (4, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((3682016 : Rat) / 385571) [(2, 1), (4, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12119296 : Rat) / 158397) [(2, 1), (4, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((1841008 : Rat) / 385571) [(2, 1), (4, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-5562880 : Rat) / 158397) [(2, 1), (4, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-148702016 : Rat) / 385571) [(2, 1), (4, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((48477184 : Rat) / 158397) [(2, 1), (4, 1), (8, 1), (9, 1), (12, 2), (15, 1)],
  term ((-7364032 : Rat) / 385571) [(2, 1), (4, 1), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((12119296 : Rat) / 158397) [(2, 1), (4, 1), (8, 1), (9, 1), (14, 1), (15, 1)],
  term ((-1841008 : Rat) / 385571) [(2, 1), (4, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((1896320 : Rat) / 52799) [(2, 1), (4, 1), (8, 1), (9, 1), (15, 1)],
  term ((-25766808 : Rat) / 385571) [(2, 1), (4, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-3112960 : Rat) / 52799) [(2, 1), (4, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((9166080 : Rat) / 385571) [(2, 1), (4, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(2, 1), (4, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((4583040 : Rat) / 385571) [(2, 1), (4, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((1556480 : Rat) / 52799) [(2, 1), (4, 1), (8, 1), (10, 1), (14, 1), (15, 2)],
  term ((4583040 : Rat) / 385571) [(2, 2), (4, 1), (5, 1), (12, 1), (15, 3), (16, 1)],
  term ((-11960320 : Rat) / 52799) [(2, 2), (4, 1), (5, 1), (12, 2), (15, 1)],
  term ((25613184 : Rat) / 385571) [(2, 2), (4, 1), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((-25167488 : Rat) / 158397) [(2, 2), (4, 1), (5, 1), (14, 1), (15, 1)],
  term ((14872856 : Rat) / 385571) [(2, 2), (4, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5330524 : Rat) / 158397) [(2, 2), (4, 1), (5, 1), (15, 1)],
  term ((3201648 : Rat) / 385571) [(2, 2), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((11960320 : Rat) / 52799) [(2, 2), (4, 1), (5, 2), (8, 1), (12, 1), (15, 2)],
  term ((-25613184 : Rat) / 385571) [(2, 2), (4, 1), (5, 2), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-11960320 : Rat) / 52799) [(2, 2), (4, 1), (5, 2), (12, 1), (15, 2)],
  term ((25613184 : Rat) / 385571) [(2, 2), (4, 1), (5, 2), (12, 1), (15, 2), (16, 1)],
  term ((-11574400 : Rat) / 158397) [(2, 2), (4, 1), (6, 1), (7, 1), (8, 1), (12, 1), (15, 1)],
  term ((124680784 : Rat) / 385571) [(2, 2), (4, 1), (6, 1), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((11574400 : Rat) / 158397) [(2, 2), (4, 1), (6, 1), (7, 1), (8, 1), (12, 2), (15, 1)],
  term ((-124680784 : Rat) / 385571) [(2, 2), (4, 1), (6, 1), (7, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((11574400 : Rat) / 158397) [(2, 2), (4, 1), (6, 1), (7, 1), (12, 1), (15, 1)],
  term ((-124680784 : Rat) / 385571) [(2, 2), (4, 1), (6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-11574400 : Rat) / 158397) [(2, 2), (4, 1), (6, 1), (7, 1), (12, 2), (15, 1)],
  term ((124680784 : Rat) / 385571) [(2, 2), (4, 1), (6, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-24238592 : Rat) / 158397) [(2, 2), (4, 1), (6, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((3682016 : Rat) / 385571) [(2, 2), (4, 1), (6, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((24238592 : Rat) / 158397) [(2, 2), (4, 1), (6, 1), (8, 1), (9, 1), (12, 2), (15, 1)],
  term ((-3682016 : Rat) / 385571) [(2, 2), (4, 1), (6, 1), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-3112960 : Rat) / 52799) [(2, 2), (4, 1), (6, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((9166080 : Rat) / 385571) [(2, 2), (4, 1), (6, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((3112960 : Rat) / 52799) [(2, 2), (4, 1), (6, 1), (8, 1), (11, 1), (12, 2), (15, 1)],
  term ((-9166080 : Rat) / 385571) [(2, 2), (4, 1), (6, 1), (8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((1556480 : Rat) / 52799) [(2, 2), (4, 1), (6, 1), (8, 1), (12, 1), (15, 2)],
  term ((-4583040 : Rat) / 385571) [(2, 2), (4, 1), (6, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(2, 2), (4, 1), (6, 1), (8, 1), (12, 2), (15, 2)],
  term ((4583040 : Rat) / 385571) [(2, 2), (4, 1), (6, 1), (8, 1), (12, 2), (15, 2), (16, 1)],
  term ((24238592 : Rat) / 158397) [(2, 2), (4, 1), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((-3682016 : Rat) / 385571) [(2, 2), (4, 1), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-24238592 : Rat) / 158397) [(2, 2), (4, 1), (6, 1), (9, 1), (12, 2), (15, 1)],
  term ((3682016 : Rat) / 385571) [(2, 2), (4, 1), (6, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((3112960 : Rat) / 52799) [(2, 2), (4, 1), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((-9166080 : Rat) / 385571) [(2, 2), (4, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3112960 : Rat) / 52799) [(2, 2), (4, 1), (6, 1), (11, 1), (12, 2), (15, 1)],
  term ((9166080 : Rat) / 385571) [(2, 2), (4, 1), (6, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(2, 2), (4, 1), (6, 1), (12, 1), (15, 2)],
  term ((4583040 : Rat) / 385571) [(2, 2), (4, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((1556480 : Rat) / 52799) [(2, 2), (4, 1), (6, 1), (12, 2), (15, 2)],
  term ((-4583040 : Rat) / 385571) [(2, 2), (4, 1), (6, 1), (12, 2), (15, 2), (16, 1)],
  term ((3216320 : Rat) / 158397) [(2, 2), (4, 1), (6, 1), (15, 2)],
  term ((-23827616 : Rat) / 385571) [(2, 2), (4, 1), (6, 1), (15, 2), (16, 1)],
  term ((24238592 : Rat) / 158397) [(2, 2), (4, 1), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-3682016 : Rat) / 385571) [(2, 2), (4, 1), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((5787200 : Rat) / 158397) [(2, 2), (4, 1), (7, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((-62340392 : Rat) / 385571) [(2, 2), (4, 1), (7, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((2893600 : Rat) / 158397) [(2, 2), (4, 1), (7, 1), (8, 1), (10, 1), (15, 1)],
  term ((-31170196 : Rat) / 385571) [(2, 2), (4, 1), (7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((3112960 : Rat) / 52799) [(2, 2), (4, 1), (7, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-9166080 : Rat) / 385571) [(2, 2), (4, 1), (7, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(2, 2), (4, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 2)],
  term ((4583040 : Rat) / 385571) [(2, 2), (4, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-11574400 : Rat) / 158397) [(2, 2), (4, 1), (7, 1), (8, 1), (12, 2), (15, 1)],
  term ((124680784 : Rat) / 385571) [(2, 2), (4, 1), (7, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-2893600 : Rat) / 158397) [(2, 2), (4, 1), (7, 1), (8, 1), (14, 1), (15, 1)],
  term ((31170196 : Rat) / 385571) [(2, 2), (4, 1), (7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((1446800 : Rat) / 52799) [(2, 2), (4, 1), (7, 1), (8, 1), (15, 1)],
  term ((-46755294 : Rat) / 385571) [(2, 2), (4, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-24238592 : Rat) / 158397) [(2, 2), (4, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((3682016 : Rat) / 385571) [(2, 2), (4, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5787200 : Rat) / 158397) [(2, 2), (4, 1), (7, 1), (10, 1), (14, 1), (15, 1)],
  term ((62340392 : Rat) / 385571) [(2, 2), (4, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2893600 : Rat) / 158397) [(2, 2), (4, 1), (7, 1), (10, 1), (15, 1)],
  term ((31170196 : Rat) / 385571) [(2, 2), (4, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-3112960 : Rat) / 52799) [(2, 2), (4, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((9166080 : Rat) / 385571) [(2, 2), (4, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1556480 : Rat) / 52799) [(2, 2), (4, 1), (7, 1), (12, 1), (13, 1), (15, 2)],
  term ((-4583040 : Rat) / 385571) [(2, 2), (4, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-11574400 : Rat) / 158397) [(2, 2), (4, 1), (7, 1), (12, 1), (15, 1)],
  term ((124680784 : Rat) / 385571) [(2, 2), (4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((11574400 : Rat) / 158397) [(2, 2), (4, 1), (7, 1), (12, 2), (15, 1)],
  term ((-124680784 : Rat) / 385571) [(2, 2), (4, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((4284800 : Rat) / 158397) [(2, 2), (4, 1), (7, 1), (14, 1), (15, 1)],
  term ((-64187960 : Rat) / 385571) [(2, 2), (4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((16720 : Rat) / 52799) [(2, 2), (4, 1), (7, 1), (15, 1)],
  term ((-31194042 : Rat) / 385571) [(2, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((11574400 : Rat) / 158397) [(2, 2), (4, 1), (7, 2), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-124680784 : Rat) / 385571) [(2, 2), (4, 1), (7, 2), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-11574400 : Rat) / 158397) [(2, 2), (4, 1), (7, 2), (12, 1), (13, 1), (15, 1)],
  term ((124680784 : Rat) / 385571) [(2, 2), (4, 1), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((12119296 : Rat) / 158397) [(2, 2), (4, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-1841008 : Rat) / 385571) [(2, 2), (4, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((6059648 : Rat) / 158397) [(2, 2), (4, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((-920504 : Rat) / 385571) [(2, 2), (4, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((2781440 : Rat) / 158397) [(2, 2), (4, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((74351008 : Rat) / 385571) [(2, 2), (4, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-24238592 : Rat) / 158397) [(2, 2), (4, 1), (8, 1), (9, 1), (12, 2), (15, 1)],
  term ((3682016 : Rat) / 385571) [(2, 2), (4, 1), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-6059648 : Rat) / 158397) [(2, 2), (4, 1), (8, 1), (9, 1), (14, 1), (15, 1)],
  term ((920504 : Rat) / 385571) [(2, 2), (4, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-948160 : Rat) / 52799) [(2, 2), (4, 1), (8, 1), (9, 1), (15, 1)],
  term ((12883404 : Rat) / 385571) [(2, 2), (4, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((1556480 : Rat) / 52799) [(2, 2), (4, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-4583040 : Rat) / 385571) [(2, 2), (4, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((778240 : Rat) / 52799) [(2, 2), (4, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-2291520 : Rat) / 385571) [(2, 2), (4, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-778240 : Rat) / 52799) [(2, 2), (4, 1), (8, 1), (10, 1), (14, 1), (15, 2)],
  term ((4583040 : Rat) / 385571) [(3, 2), (4, 1), (5, 1), (12, 1), (15, 3), (16, 1)],
  term ((-11960320 : Rat) / 52799) [(3, 2), (4, 1), (5, 1), (12, 2), (15, 1)],
  term ((25613184 : Rat) / 385571) [(3, 2), (4, 1), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((-25167488 : Rat) / 158397) [(3, 2), (4, 1), (5, 1), (14, 1), (15, 1)],
  term ((14872856 : Rat) / 385571) [(3, 2), (4, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5330524 : Rat) / 158397) [(3, 2), (4, 1), (5, 1), (15, 1)],
  term ((3201648 : Rat) / 385571) [(3, 2), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((11960320 : Rat) / 52799) [(3, 2), (4, 1), (5, 2), (8, 1), (12, 1), (15, 2)],
  term ((-25613184 : Rat) / 385571) [(3, 2), (4, 1), (5, 2), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-11960320 : Rat) / 52799) [(3, 2), (4, 1), (5, 2), (12, 1), (15, 2)],
  term ((25613184 : Rat) / 385571) [(3, 2), (4, 1), (5, 2), (12, 1), (15, 2), (16, 1)],
  term ((-11574400 : Rat) / 158397) [(3, 2), (4, 1), (6, 1), (7, 1), (8, 1), (12, 1), (15, 1)],
  term ((124680784 : Rat) / 385571) [(3, 2), (4, 1), (6, 1), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((11574400 : Rat) / 158397) [(3, 2), (4, 1), (6, 1), (7, 1), (8, 1), (12, 2), (15, 1)],
  term ((-124680784 : Rat) / 385571) [(3, 2), (4, 1), (6, 1), (7, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((11574400 : Rat) / 158397) [(3, 2), (4, 1), (6, 1), (7, 1), (12, 1), (15, 1)],
  term ((-124680784 : Rat) / 385571) [(3, 2), (4, 1), (6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-11574400 : Rat) / 158397) [(3, 2), (4, 1), (6, 1), (7, 1), (12, 2), (15, 1)],
  term ((124680784 : Rat) / 385571) [(3, 2), (4, 1), (6, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-24238592 : Rat) / 158397) [(3, 2), (4, 1), (6, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((3682016 : Rat) / 385571) [(3, 2), (4, 1), (6, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((24238592 : Rat) / 158397) [(3, 2), (4, 1), (6, 1), (8, 1), (9, 1), (12, 2), (15, 1)],
  term ((-3682016 : Rat) / 385571) [(3, 2), (4, 1), (6, 1), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-3112960 : Rat) / 52799) [(3, 2), (4, 1), (6, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((9166080 : Rat) / 385571) [(3, 2), (4, 1), (6, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((3112960 : Rat) / 52799) [(3, 2), (4, 1), (6, 1), (8, 1), (11, 1), (12, 2), (15, 1)],
  term ((-9166080 : Rat) / 385571) [(3, 2), (4, 1), (6, 1), (8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((1556480 : Rat) / 52799) [(3, 2), (4, 1), (6, 1), (8, 1), (12, 1), (15, 2)],
  term ((-4583040 : Rat) / 385571) [(3, 2), (4, 1), (6, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(3, 2), (4, 1), (6, 1), (8, 1), (12, 2), (15, 2)],
  term ((4583040 : Rat) / 385571) [(3, 2), (4, 1), (6, 1), (8, 1), (12, 2), (15, 2), (16, 1)],
  term ((24238592 : Rat) / 158397) [(3, 2), (4, 1), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((-3682016 : Rat) / 385571) [(3, 2), (4, 1), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-24238592 : Rat) / 158397) [(3, 2), (4, 1), (6, 1), (9, 1), (12, 2), (15, 1)],
  term ((3682016 : Rat) / 385571) [(3, 2), (4, 1), (6, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((3112960 : Rat) / 52799) [(3, 2), (4, 1), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((-9166080 : Rat) / 385571) [(3, 2), (4, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3112960 : Rat) / 52799) [(3, 2), (4, 1), (6, 1), (11, 1), (12, 2), (15, 1)],
  term ((9166080 : Rat) / 385571) [(3, 2), (4, 1), (6, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(3, 2), (4, 1), (6, 1), (12, 1), (15, 2)],
  term ((4583040 : Rat) / 385571) [(3, 2), (4, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((1556480 : Rat) / 52799) [(3, 2), (4, 1), (6, 1), (12, 2), (15, 2)],
  term ((-4583040 : Rat) / 385571) [(3, 2), (4, 1), (6, 1), (12, 2), (15, 2), (16, 1)],
  term ((3216320 : Rat) / 158397) [(3, 2), (4, 1), (6, 1), (15, 2)],
  term ((-23827616 : Rat) / 385571) [(3, 2), (4, 1), (6, 1), (15, 2), (16, 1)],
  term ((24238592 : Rat) / 158397) [(3, 2), (4, 1), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-3682016 : Rat) / 385571) [(3, 2), (4, 1), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((5787200 : Rat) / 158397) [(3, 2), (4, 1), (7, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((-62340392 : Rat) / 385571) [(3, 2), (4, 1), (7, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((2893600 : Rat) / 158397) [(3, 2), (4, 1), (7, 1), (8, 1), (10, 1), (15, 1)],
  term ((-31170196 : Rat) / 385571) [(3, 2), (4, 1), (7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((3112960 : Rat) / 52799) [(3, 2), (4, 1), (7, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-9166080 : Rat) / 385571) [(3, 2), (4, 1), (7, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(3, 2), (4, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 2)],
  term ((4583040 : Rat) / 385571) [(3, 2), (4, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-11574400 : Rat) / 158397) [(3, 2), (4, 1), (7, 1), (8, 1), (12, 2), (15, 1)],
  term ((124680784 : Rat) / 385571) [(3, 2), (4, 1), (7, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-2893600 : Rat) / 158397) [(3, 2), (4, 1), (7, 1), (8, 1), (14, 1), (15, 1)],
  term ((31170196 : Rat) / 385571) [(3, 2), (4, 1), (7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((1446800 : Rat) / 52799) [(3, 2), (4, 1), (7, 1), (8, 1), (15, 1)],
  term ((-46755294 : Rat) / 385571) [(3, 2), (4, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-24238592 : Rat) / 158397) [(3, 2), (4, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((3682016 : Rat) / 385571) [(3, 2), (4, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5787200 : Rat) / 158397) [(3, 2), (4, 1), (7, 1), (10, 1), (14, 1), (15, 1)],
  term ((62340392 : Rat) / 385571) [(3, 2), (4, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2893600 : Rat) / 158397) [(3, 2), (4, 1), (7, 1), (10, 1), (15, 1)],
  term ((31170196 : Rat) / 385571) [(3, 2), (4, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-3112960 : Rat) / 52799) [(3, 2), (4, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((9166080 : Rat) / 385571) [(3, 2), (4, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1556480 : Rat) / 52799) [(3, 2), (4, 1), (7, 1), (12, 1), (13, 1), (15, 2)],
  term ((-4583040 : Rat) / 385571) [(3, 2), (4, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-11574400 : Rat) / 158397) [(3, 2), (4, 1), (7, 1), (12, 1), (15, 1)],
  term ((124680784 : Rat) / 385571) [(3, 2), (4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((11574400 : Rat) / 158397) [(3, 2), (4, 1), (7, 1), (12, 2), (15, 1)],
  term ((-124680784 : Rat) / 385571) [(3, 2), (4, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((4284800 : Rat) / 158397) [(3, 2), (4, 1), (7, 1), (14, 1), (15, 1)],
  term ((-64187960 : Rat) / 385571) [(3, 2), (4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((16720 : Rat) / 52799) [(3, 2), (4, 1), (7, 1), (15, 1)],
  term ((-31194042 : Rat) / 385571) [(3, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((11574400 : Rat) / 158397) [(3, 2), (4, 1), (7, 2), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-124680784 : Rat) / 385571) [(3, 2), (4, 1), (7, 2), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-11574400 : Rat) / 158397) [(3, 2), (4, 1), (7, 2), (12, 1), (13, 1), (15, 1)],
  term ((124680784 : Rat) / 385571) [(3, 2), (4, 1), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((12119296 : Rat) / 158397) [(3, 2), (4, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-1841008 : Rat) / 385571) [(3, 2), (4, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((6059648 : Rat) / 158397) [(3, 2), (4, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((-920504 : Rat) / 385571) [(3, 2), (4, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((2781440 : Rat) / 158397) [(3, 2), (4, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((74351008 : Rat) / 385571) [(3, 2), (4, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-24238592 : Rat) / 158397) [(3, 2), (4, 1), (8, 1), (9, 1), (12, 2), (15, 1)],
  term ((3682016 : Rat) / 385571) [(3, 2), (4, 1), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-6059648 : Rat) / 158397) [(3, 2), (4, 1), (8, 1), (9, 1), (14, 1), (15, 1)],
  term ((920504 : Rat) / 385571) [(3, 2), (4, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-948160 : Rat) / 52799) [(3, 2), (4, 1), (8, 1), (9, 1), (15, 1)],
  term ((12883404 : Rat) / 385571) [(3, 2), (4, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((1556480 : Rat) / 52799) [(3, 2), (4, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-4583040 : Rat) / 385571) [(3, 2), (4, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((778240 : Rat) / 52799) [(3, 2), (4, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-2291520 : Rat) / 385571) [(3, 2), (4, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-778240 : Rat) / 52799) [(3, 2), (4, 1), (8, 1), (10, 1), (14, 1), (15, 2)],
  term ((9166080 : Rat) / 385571) [(4, 1), (5, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(4, 1), (5, 1), (12, 1), (14, 2), (15, 3), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(4, 1), (5, 1), (12, 1), (15, 5), (16, 1)],
  term ((-23920640 : Rat) / 52799) [(4, 1), (5, 1), (12, 2), (14, 1), (15, 1)],
  term ((51226368 : Rat) / 385571) [(4, 1), (5, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((11960320 : Rat) / 52799) [(4, 1), (5, 1), (12, 2), (14, 2), (15, 1)],
  term ((-25613184 : Rat) / 385571) [(4, 1), (5, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((11960320 : Rat) / 52799) [(4, 1), (5, 1), (12, 2), (15, 3)],
  term ((-25613184 : Rat) / 385571) [(4, 1), (5, 1), (12, 2), (15, 3), (16, 1)],
  term ((-10661048 : Rat) / 158397) [(4, 1), (5, 1), (14, 1), (15, 1)],
  term ((6403296 : Rat) / 385571) [(4, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((25167488 : Rat) / 158397) [(4, 1), (5, 1), (14, 1), (15, 3)],
  term ((-14872856 : Rat) / 385571) [(4, 1), (5, 1), (14, 1), (15, 3), (16, 1)],
  term ((-15001484 : Rat) / 52799) [(4, 1), (5, 1), (14, 2), (15, 1)],
  term ((26544064 : Rat) / 385571) [(4, 1), (5, 1), (14, 2), (15, 1), (16, 1)],
  term ((25167488 : Rat) / 158397) [(4, 1), (5, 1), (14, 3), (15, 1)],
  term ((-14872856 : Rat) / 385571) [(4, 1), (5, 1), (14, 3), (15, 1), (16, 1)],
  term ((5330524 : Rat) / 158397) [(4, 1), (5, 1), (15, 3)],
  term ((-3201648 : Rat) / 385571) [(4, 1), (5, 1), (15, 3), (16, 1)],
  term ((23920640 : Rat) / 52799) [(4, 1), (5, 2), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((-51226368 : Rat) / 385571) [(4, 1), (5, 2), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-11960320 : Rat) / 52799) [(4, 1), (5, 2), (8, 1), (12, 1), (14, 2), (15, 2)],
  term ((25613184 : Rat) / 385571) [(4, 1), (5, 2), (8, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-11960320 : Rat) / 52799) [(4, 1), (5, 2), (8, 1), (12, 1), (15, 4)],
  term ((25613184 : Rat) / 385571) [(4, 1), (5, 2), (8, 1), (12, 1), (15, 4), (16, 1)],
  term ((-23920640 : Rat) / 52799) [(4, 1), (5, 2), (12, 1), (14, 1), (15, 2)],
  term ((51226368 : Rat) / 385571) [(4, 1), (5, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((11960320 : Rat) / 52799) [(4, 1), (5, 2), (12, 1), (14, 2), (15, 2)],
  term ((-25613184 : Rat) / 385571) [(4, 1), (5, 2), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((11960320 : Rat) / 52799) [(4, 1), (5, 2), (12, 1), (15, 4)],
  term ((-25613184 : Rat) / 385571) [(4, 1), (5, 2), (12, 1), (15, 4), (16, 1)],
  term ((-23148800 : Rat) / 158397) [(4, 1), (6, 1), (7, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((249361568 : Rat) / 385571) [(4, 1), (6, 1), (7, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((11574400 : Rat) / 158397) [(4, 1), (6, 1), (7, 1), (8, 1), (12, 1), (14, 2), (15, 1)],
  term ((-124680784 : Rat) / 385571) [(4, 1), (6, 1), (7, 1), (8, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((11574400 : Rat) / 158397) [(4, 1), (6, 1), (7, 1), (8, 1), (12, 1), (15, 3)],
  term ((-124680784 : Rat) / 385571) [(4, 1), (6, 1), (7, 1), (8, 1), (12, 1), (15, 3), (16, 1)],
  term ((23148800 : Rat) / 158397) [(4, 1), (6, 1), (7, 1), (8, 1), (12, 2), (14, 1), (15, 1)],
  term ((-249361568 : Rat) / 385571) [(4, 1), (6, 1), (7, 1), (8, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-11574400 : Rat) / 158397) [(4, 1), (6, 1), (7, 1), (8, 1), (12, 2), (14, 2), (15, 1)],
  term ((124680784 : Rat) / 385571) [(4, 1), (6, 1), (7, 1), (8, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((-11574400 : Rat) / 158397) [(4, 1), (6, 1), (7, 1), (8, 1), (12, 2), (15, 3)],
  term ((124680784 : Rat) / 385571) [(4, 1), (6, 1), (7, 1), (8, 1), (12, 2), (15, 3), (16, 1)],
  term ((23148800 : Rat) / 158397) [(4, 1), (6, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-249361568 : Rat) / 385571) [(4, 1), (6, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11574400 : Rat) / 158397) [(4, 1), (6, 1), (7, 1), (12, 1), (14, 2), (15, 1)],
  term ((124680784 : Rat) / 385571) [(4, 1), (6, 1), (7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-11574400 : Rat) / 158397) [(4, 1), (6, 1), (7, 1), (12, 1), (15, 3)],
  term ((124680784 : Rat) / 385571) [(4, 1), (6, 1), (7, 1), (12, 1), (15, 3), (16, 1)],
  term ((-23148800 : Rat) / 158397) [(4, 1), (6, 1), (7, 1), (12, 2), (14, 1), (15, 1)],
  term ((249361568 : Rat) / 385571) [(4, 1), (6, 1), (7, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((11574400 : Rat) / 158397) [(4, 1), (6, 1), (7, 1), (12, 2), (14, 2), (15, 1)],
  term ((-124680784 : Rat) / 385571) [(4, 1), (6, 1), (7, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((11574400 : Rat) / 158397) [(4, 1), (6, 1), (7, 1), (12, 2), (15, 3)],
  term ((-124680784 : Rat) / 385571) [(4, 1), (6, 1), (7, 1), (12, 2), (15, 3), (16, 1)],
  term ((-48477184 : Rat) / 158397) [(4, 1), (6, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((7364032 : Rat) / 385571) [(4, 1), (6, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((24238592 : Rat) / 158397) [(4, 1), (6, 1), (8, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((-3682016 : Rat) / 385571) [(4, 1), (6, 1), (8, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((24238592 : Rat) / 158397) [(4, 1), (6, 1), (8, 1), (9, 1), (12, 1), (15, 3)],
  term ((-3682016 : Rat) / 385571) [(4, 1), (6, 1), (8, 1), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((48477184 : Rat) / 158397) [(4, 1), (6, 1), (8, 1), (9, 1), (12, 2), (14, 1), (15, 1)],
  term ((-7364032 : Rat) / 385571) [(4, 1), (6, 1), (8, 1), (9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-24238592 : Rat) / 158397) [(4, 1), (6, 1), (8, 1), (9, 1), (12, 2), (14, 2), (15, 1)],
  term ((3682016 : Rat) / 385571) [(4, 1), (6, 1), (8, 1), (9, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((-24238592 : Rat) / 158397) [(4, 1), (6, 1), (8, 1), (9, 1), (12, 2), (15, 3)],
  term ((3682016 : Rat) / 385571) [(4, 1), (6, 1), (8, 1), (9, 1), (12, 2), (15, 3), (16, 1)],
  term ((-6225920 : Rat) / 52799) [(4, 1), (6, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((18332160 : Rat) / 385571) [(4, 1), (6, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((3112960 : Rat) / 52799) [(4, 1), (6, 1), (8, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-9166080 : Rat) / 385571) [(4, 1), (6, 1), (8, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((3112960 : Rat) / 52799) [(4, 1), (6, 1), (8, 1), (11, 1), (12, 1), (15, 3)],
  term ((-9166080 : Rat) / 385571) [(4, 1), (6, 1), (8, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((6225920 : Rat) / 52799) [(4, 1), (6, 1), (8, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((-18332160 : Rat) / 385571) [(4, 1), (6, 1), (8, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-3112960 : Rat) / 52799) [(4, 1), (6, 1), (8, 1), (11, 1), (12, 2), (14, 2), (15, 1)],
  term ((9166080 : Rat) / 385571) [(4, 1), (6, 1), (8, 1), (11, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((-3112960 : Rat) / 52799) [(4, 1), (6, 1), (8, 1), (11, 1), (12, 2), (15, 3)],
  term ((9166080 : Rat) / 385571) [(4, 1), (6, 1), (8, 1), (11, 1), (12, 2), (15, 3), (16, 1)],
  term ((3112960 : Rat) / 52799) [(4, 1), (6, 1), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((-9166080 : Rat) / 385571) [(4, 1), (6, 1), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(4, 1), (6, 1), (8, 1), (12, 1), (14, 2), (15, 2)],
  term ((4583040 : Rat) / 385571) [(4, 1), (6, 1), (8, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(4, 1), (6, 1), (8, 1), (12, 1), (15, 4)],
  term ((4583040 : Rat) / 385571) [(4, 1), (6, 1), (8, 1), (12, 1), (15, 4), (16, 1)],
  term ((-3112960 : Rat) / 52799) [(4, 1), (6, 1), (8, 1), (12, 2), (14, 1), (15, 2)],
  term ((9166080 : Rat) / 385571) [(4, 1), (6, 1), (8, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((1556480 : Rat) / 52799) [(4, 1), (6, 1), (8, 1), (12, 2), (14, 2), (15, 2)],
  term ((-4583040 : Rat) / 385571) [(4, 1), (6, 1), (8, 1), (12, 2), (14, 2), (15, 2), (16, 1)],
  term ((1556480 : Rat) / 52799) [(4, 1), (6, 1), (8, 1), (12, 2), (15, 4)],
  term ((-4583040 : Rat) / 385571) [(4, 1), (6, 1), (8, 1), (12, 2), (15, 4), (16, 1)],
  term ((48477184 : Rat) / 158397) [(4, 1), (6, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-7364032 : Rat) / 385571) [(4, 1), (6, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-24238592 : Rat) / 158397) [(4, 1), (6, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((3682016 : Rat) / 385571) [(4, 1), (6, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-24238592 : Rat) / 158397) [(4, 1), (6, 1), (9, 1), (12, 1), (15, 3)],
  term ((3682016 : Rat) / 385571) [(4, 1), (6, 1), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((-48477184 : Rat) / 158397) [(4, 1), (6, 1), (9, 1), (12, 2), (14, 1), (15, 1)],
  term ((7364032 : Rat) / 385571) [(4, 1), (6, 1), (9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((24238592 : Rat) / 158397) [(4, 1), (6, 1), (9, 1), (12, 2), (14, 2), (15, 1)],
  term ((-3682016 : Rat) / 385571) [(4, 1), (6, 1), (9, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((24238592 : Rat) / 158397) [(4, 1), (6, 1), (9, 1), (12, 2), (15, 3)],
  term ((-3682016 : Rat) / 385571) [(4, 1), (6, 1), (9, 1), (12, 2), (15, 3), (16, 1)],
  term ((6225920 : Rat) / 52799) [(4, 1), (6, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-18332160 : Rat) / 385571) [(4, 1), (6, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3112960 : Rat) / 52799) [(4, 1), (6, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((9166080 : Rat) / 385571) [(4, 1), (6, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3112960 : Rat) / 52799) [(4, 1), (6, 1), (11, 1), (12, 1), (15, 3)],
  term ((9166080 : Rat) / 385571) [(4, 1), (6, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-6225920 : Rat) / 52799) [(4, 1), (6, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((18332160 : Rat) / 385571) [(4, 1), (6, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((3112960 : Rat) / 52799) [(4, 1), (6, 1), (11, 1), (12, 2), (14, 2), (15, 1)],
  term ((-9166080 : Rat) / 385571) [(4, 1), (6, 1), (11, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((3112960 : Rat) / 52799) [(4, 1), (6, 1), (11, 1), (12, 2), (15, 3)],
  term ((-9166080 : Rat) / 385571) [(4, 1), (6, 1), (11, 1), (12, 2), (15, 3), (16, 1)],
  term ((-3112960 : Rat) / 52799) [(4, 1), (6, 1), (12, 1), (14, 1), (15, 2)],
  term ((9166080 : Rat) / 385571) [(4, 1), (6, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((1556480 : Rat) / 52799) [(4, 1), (6, 1), (12, 1), (14, 2), (15, 2)],
  term ((-4583040 : Rat) / 385571) [(4, 1), (6, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((1556480 : Rat) / 52799) [(4, 1), (6, 1), (12, 1), (15, 4)],
  term ((-4583040 : Rat) / 385571) [(4, 1), (6, 1), (12, 1), (15, 4), (16, 1)],
  term ((3112960 : Rat) / 52799) [(4, 1), (6, 1), (12, 2), (14, 1), (15, 2)],
  term ((-9166080 : Rat) / 385571) [(4, 1), (6, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(4, 1), (6, 1), (12, 2), (14, 2), (15, 2)],
  term ((4583040 : Rat) / 385571) [(4, 1), (6, 1), (12, 2), (14, 2), (15, 2), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(4, 1), (6, 1), (12, 2), (15, 4)],
  term ((4583040 : Rat) / 385571) [(4, 1), (6, 1), (12, 2), (15, 4), (16, 1)],
  term ((6432640 : Rat) / 158397) [(4, 1), (6, 1), (14, 1), (15, 2)],
  term ((-47655232 : Rat) / 385571) [(4, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3216320 : Rat) / 158397) [(4, 1), (6, 1), (14, 2), (15, 2)],
  term ((23827616 : Rat) / 385571) [(4, 1), (6, 1), (14, 2), (15, 2), (16, 1)],
  term ((-3216320 : Rat) / 158397) [(4, 1), (6, 1), (15, 4)],
  term ((23827616 : Rat) / 385571) [(4, 1), (6, 1), (15, 4), (16, 1)],
  term ((48477184 : Rat) / 158397) [(4, 1), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-7364032 : Rat) / 385571) [(4, 1), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-24238592 : Rat) / 158397) [(4, 1), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((3682016 : Rat) / 385571) [(4, 1), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-24238592 : Rat) / 158397) [(4, 1), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 3)],
  term ((3682016 : Rat) / 385571) [(4, 1), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((5787200 : Rat) / 158397) [(4, 1), (7, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((-62340392 : Rat) / 385571) [(4, 1), (7, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5787200 : Rat) / 158397) [(4, 1), (7, 1), (8, 1), (10, 1), (14, 1), (15, 3)],
  term ((62340392 : Rat) / 385571) [(4, 1), (7, 1), (8, 1), (10, 1), (14, 1), (15, 3), (16, 1)],
  term ((2893600 : Rat) / 52799) [(4, 1), (7, 1), (8, 1), (10, 1), (14, 2), (15, 1)],
  term ((-93510588 : Rat) / 385571) [(4, 1), (7, 1), (8, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-5787200 : Rat) / 158397) [(4, 1), (7, 1), (8, 1), (10, 1), (14, 3), (15, 1)],
  term ((62340392 : Rat) / 385571) [(4, 1), (7, 1), (8, 1), (10, 1), (14, 3), (15, 1), (16, 1)],
  term ((-2893600 : Rat) / 158397) [(4, 1), (7, 1), (8, 1), (10, 1), (15, 3)],
  term ((31170196 : Rat) / 385571) [(4, 1), (7, 1), (8, 1), (10, 1), (15, 3), (16, 1)],
  term ((6225920 : Rat) / 52799) [(4, 1), (7, 1), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-18332160 : Rat) / 385571) [(4, 1), (7, 1), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3112960 : Rat) / 52799) [(4, 1), (7, 1), (8, 1), (11, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((9166080 : Rat) / 385571) [(4, 1), (7, 1), (8, 1), (11, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3112960 : Rat) / 52799) [(4, 1), (7, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 3)],
  term ((9166080 : Rat) / 385571) [(4, 1), (7, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-3112960 : Rat) / 52799) [(4, 1), (7, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((9166080 : Rat) / 385571) [(4, 1), (7, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1556480 : Rat) / 52799) [(4, 1), (7, 1), (8, 1), (12, 1), (13, 1), (14, 2), (15, 2)],
  term ((-4583040 : Rat) / 385571) [(4, 1), (7, 1), (8, 1), (12, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((1556480 : Rat) / 52799) [(4, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 4)],
  term ((-4583040 : Rat) / 385571) [(4, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 4), (16, 1)],
  term ((-23148800 : Rat) / 158397) [(4, 1), (7, 1), (8, 1), (12, 2), (14, 1), (15, 1)],
  term ((249361568 : Rat) / 385571) [(4, 1), (7, 1), (8, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((11574400 : Rat) / 158397) [(4, 1), (7, 1), (8, 1), (12, 2), (14, 2), (15, 1)],
  term ((-124680784 : Rat) / 385571) [(4, 1), (7, 1), (8, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((11574400 : Rat) / 158397) [(4, 1), (7, 1), (8, 1), (12, 2), (15, 3)],
  term ((-124680784 : Rat) / 385571) [(4, 1), (7, 1), (8, 1), (12, 2), (15, 3), (16, 1)],
  term ((2893600 : Rat) / 52799) [(4, 1), (7, 1), (8, 1), (14, 1), (15, 1)],
  term ((-93510588 : Rat) / 385571) [(4, 1), (7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((2893600 : Rat) / 158397) [(4, 1), (7, 1), (8, 1), (14, 1), (15, 3)],
  term ((-31170196 : Rat) / 385571) [(4, 1), (7, 1), (8, 1), (14, 1), (15, 3), (16, 1)],
  term ((-10127600 : Rat) / 158397) [(4, 1), (7, 1), (8, 1), (14, 2), (15, 1)],
  term ((109095686 : Rat) / 385571) [(4, 1), (7, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((2893600 : Rat) / 158397) [(4, 1), (7, 1), (8, 1), (14, 3), (15, 1)],
  term ((-31170196 : Rat) / 385571) [(4, 1), (7, 1), (8, 1), (14, 3), (15, 1), (16, 1)],
  term ((-1446800 : Rat) / 52799) [(4, 1), (7, 1), (8, 1), (15, 3)],
  term ((46755294 : Rat) / 385571) [(4, 1), (7, 1), (8, 1), (15, 3), (16, 1)],
  term ((-48477184 : Rat) / 158397) [(4, 1), (7, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((7364032 : Rat) / 385571) [(4, 1), (7, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((24238592 : Rat) / 158397) [(4, 1), (7, 1), (9, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-3682016 : Rat) / 385571) [(4, 1), (7, 1), (9, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((24238592 : Rat) / 158397) [(4, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 3)],
  term ((-3682016 : Rat) / 385571) [(4, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-5787200 : Rat) / 158397) [(4, 1), (7, 1), (10, 1), (14, 1), (15, 1)],
  term ((62340392 : Rat) / 385571) [(4, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((5787200 : Rat) / 158397) [(4, 1), (7, 1), (10, 1), (14, 1), (15, 3)],
  term ((-62340392 : Rat) / 385571) [(4, 1), (7, 1), (10, 1), (14, 1), (15, 3), (16, 1)],
  term ((-2893600 : Rat) / 52799) [(4, 1), (7, 1), (10, 1), (14, 2), (15, 1)],
  term ((93510588 : Rat) / 385571) [(4, 1), (7, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((5787200 : Rat) / 158397) [(4, 1), (7, 1), (10, 1), (14, 3), (15, 1)],
  term ((-62340392 : Rat) / 385571) [(4, 1), (7, 1), (10, 1), (14, 3), (15, 1), (16, 1)],
  term ((2893600 : Rat) / 158397) [(4, 1), (7, 1), (10, 1), (15, 3)],
  term ((-31170196 : Rat) / 385571) [(4, 1), (7, 1), (10, 1), (15, 3), (16, 1)],
  term ((-6225920 : Rat) / 52799) [(4, 1), (7, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((18332160 : Rat) / 385571) [(4, 1), (7, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3112960 : Rat) / 52799) [(4, 1), (7, 1), (11, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-9166080 : Rat) / 385571) [(4, 1), (7, 1), (11, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((3112960 : Rat) / 52799) [(4, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 3)],
  term ((-9166080 : Rat) / 385571) [(4, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((3112960 : Rat) / 52799) [(4, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-9166080 : Rat) / 385571) [(4, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(4, 1), (7, 1), (12, 1), (13, 1), (14, 2), (15, 2)],
  term ((4583040 : Rat) / 385571) [(4, 1), (7, 1), (12, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(4, 1), (7, 1), (12, 1), (13, 1), (15, 4)],
  term ((4583040 : Rat) / 385571) [(4, 1), (7, 1), (12, 1), (13, 1), (15, 4), (16, 1)],
  term ((-23148800 : Rat) / 158397) [(4, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((249361568 : Rat) / 385571) [(4, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((11574400 : Rat) / 158397) [(4, 1), (7, 1), (12, 1), (14, 2), (15, 1)],
  term ((-124680784 : Rat) / 385571) [(4, 1), (7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((11574400 : Rat) / 158397) [(4, 1), (7, 1), (12, 1), (15, 3)],
  term ((-124680784 : Rat) / 385571) [(4, 1), (7, 1), (12, 1), (15, 3), (16, 1)],
  term ((23148800 : Rat) / 158397) [(4, 1), (7, 1), (12, 2), (14, 1), (15, 1)],
  term ((-249361568 : Rat) / 385571) [(4, 1), (7, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-11574400 : Rat) / 158397) [(4, 1), (7, 1), (12, 2), (14, 2), (15, 1)],
  term ((124680784 : Rat) / 385571) [(4, 1), (7, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((-11574400 : Rat) / 158397) [(4, 1), (7, 1), (12, 2), (15, 3)],
  term ((124680784 : Rat) / 385571) [(4, 1), (7, 1), (12, 2), (15, 3), (16, 1)],
  term ((33440 : Rat) / 52799) [(4, 1), (7, 1), (14, 1), (15, 1)],
  term ((-62388084 : Rat) / 385571) [(4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4284800 : Rat) / 158397) [(4, 1), (7, 1), (14, 1), (15, 3)],
  term ((64187960 : Rat) / 385571) [(4, 1), (7, 1), (14, 1), (15, 3), (16, 1)],
  term ((8519440 : Rat) / 158397) [(4, 1), (7, 1), (14, 2), (15, 1)],
  term ((-97181878 : Rat) / 385571) [(4, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-4284800 : Rat) / 158397) [(4, 1), (7, 1), (14, 3), (15, 1)],
  term ((64187960 : Rat) / 385571) [(4, 1), (7, 1), (14, 3), (15, 1), (16, 1)],
  term ((-16720 : Rat) / 52799) [(4, 1), (7, 1), (15, 3)],
  term ((31194042 : Rat) / 385571) [(4, 1), (7, 1), (15, 3), (16, 1)],
  term ((23148800 : Rat) / 158397) [(4, 1), (7, 2), (8, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-249361568 : Rat) / 385571) [(4, 1), (7, 2), (8, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11574400 : Rat) / 158397) [(4, 1), (7, 2), (8, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((124680784 : Rat) / 385571) [(4, 1), (7, 2), (8, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-11574400 : Rat) / 158397) [(4, 1), (7, 2), (8, 1), (12, 1), (13, 1), (15, 3)],
  term ((124680784 : Rat) / 385571) [(4, 1), (7, 2), (8, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-23148800 : Rat) / 158397) [(4, 1), (7, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((249361568 : Rat) / 385571) [(4, 1), (7, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((11574400 : Rat) / 158397) [(4, 1), (7, 2), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-124680784 : Rat) / 385571) [(4, 1), (7, 2), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((11574400 : Rat) / 158397) [(4, 1), (7, 2), (12, 1), (13, 1), (15, 3)],
  term ((-124680784 : Rat) / 385571) [(4, 1), (7, 2), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((12119296 : Rat) / 158397) [(4, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-1841008 : Rat) / 385571) [(4, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12119296 : Rat) / 158397) [(4, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 3)],
  term ((1841008 : Rat) / 385571) [(4, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 3), (16, 1)],
  term ((6059648 : Rat) / 52799) [(4, 1), (8, 1), (9, 1), (10, 1), (14, 2), (15, 1)],
  term ((-2761512 : Rat) / 385571) [(4, 1), (8, 1), (9, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-12119296 : Rat) / 158397) [(4, 1), (8, 1), (9, 1), (10, 1), (14, 3), (15, 1)],
  term ((1841008 : Rat) / 385571) [(4, 1), (8, 1), (9, 1), (10, 1), (14, 3), (15, 1), (16, 1)],
  term ((-6059648 : Rat) / 158397) [(4, 1), (8, 1), (9, 1), (10, 1), (15, 3)],
  term ((920504 : Rat) / 385571) [(4, 1), (8, 1), (9, 1), (10, 1), (15, 3), (16, 1)],
  term ((-2781440 : Rat) / 158397) [(4, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 3)],
  term ((-74351008 : Rat) / 385571) [(4, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((5562880 : Rat) / 158397) [(4, 1), (8, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((148702016 : Rat) / 385571) [(4, 1), (8, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2781440 : Rat) / 158397) [(4, 1), (8, 1), (9, 1), (12, 1), (14, 3), (15, 1)],
  term ((-74351008 : Rat) / 385571) [(4, 1), (8, 1), (9, 1), (12, 1), (14, 3), (15, 1), (16, 1)],
  term ((-48477184 : Rat) / 158397) [(4, 1), (8, 1), (9, 1), (12, 2), (14, 1), (15, 1)],
  term ((7364032 : Rat) / 385571) [(4, 1), (8, 1), (9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((24238592 : Rat) / 158397) [(4, 1), (8, 1), (9, 1), (12, 2), (14, 2), (15, 1)],
  term ((-3682016 : Rat) / 385571) [(4, 1), (8, 1), (9, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((24238592 : Rat) / 158397) [(4, 1), (8, 1), (9, 1), (12, 2), (15, 3)],
  term ((-3682016 : Rat) / 385571) [(4, 1), (8, 1), (9, 1), (12, 2), (15, 3), (16, 1)],
  term ((-1896320 : Rat) / 52799) [(4, 1), (8, 1), (9, 1), (14, 1), (15, 1)],
  term ((25766808 : Rat) / 385571) [(4, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((6059648 : Rat) / 158397) [(4, 1), (8, 1), (9, 1), (14, 1), (15, 3)],
  term ((-920504 : Rat) / 385571) [(4, 1), (8, 1), (9, 1), (14, 1), (15, 3), (16, 1)],
  term ((-9274816 : Rat) / 158397) [(4, 1), (8, 1), (9, 1), (14, 2), (15, 1)],
  term ((-11042396 : Rat) / 385571) [(4, 1), (8, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((6059648 : Rat) / 158397) [(4, 1), (8, 1), (9, 1), (14, 3), (15, 1)],
  term ((-920504 : Rat) / 385571) [(4, 1), (8, 1), (9, 1), (14, 3), (15, 1), (16, 1)],
  term ((948160 : Rat) / 52799) [(4, 1), (8, 1), (9, 1), (15, 3)],
  term ((-12883404 : Rat) / 385571) [(4, 1), (8, 1), (9, 1), (15, 3), (16, 1)],
  term ((1556480 : Rat) / 52799) [(4, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-4583040 : Rat) / 385571) [(4, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(4, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 3)],
  term ((4583040 : Rat) / 385571) [(4, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((2334720 : Rat) / 52799) [(4, 1), (8, 1), (10, 1), (11, 1), (14, 2), (15, 1)],
  term ((-6874560 : Rat) / 385571) [(4, 1), (8, 1), (10, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(4, 1), (8, 1), (10, 1), (11, 1), (14, 3), (15, 1)],
  term ((4583040 : Rat) / 385571) [(4, 1), (8, 1), (10, 1), (11, 1), (14, 3), (15, 1), (16, 1)],
  term ((-778240 : Rat) / 52799) [(4, 1), (8, 1), (10, 1), (11, 1), (15, 3)],
  term ((2291520 : Rat) / 385571) [(4, 1), (8, 1), (10, 1), (11, 1), (15, 3), (16, 1)],
  term ((778240 : Rat) / 52799) [(4, 1), (8, 1), (10, 1), (14, 1), (15, 4)],
  term ((-1556480 : Rat) / 52799) [(4, 1), (8, 1), (10, 1), (14, 2), (15, 2)],
  term ((778240 : Rat) / 52799) [(4, 1), (8, 1), (10, 1), (14, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 5, terms 1000 through 1099. -/
theorem rs_R005_ueqv_R005NYN_block_05_1000_1099_valid :
    checkProductSumEq rs_R005_ueqv_R005NYN_partials_05_1000_1099
      rs_R005_ueqv_R005NYN_block_05_1000_1099 = true := by
  native_decide

end R005UeqvR005NYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
