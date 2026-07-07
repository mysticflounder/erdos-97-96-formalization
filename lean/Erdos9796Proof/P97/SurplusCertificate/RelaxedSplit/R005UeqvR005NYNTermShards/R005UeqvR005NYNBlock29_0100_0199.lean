/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R005:u=v:R005NYN, term block 29:100-199

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R005UeqvR005NYNTermShards

/-- Generator polynomial 29 for relaxed split surplus certificate `R005:u=v:R005NYN`. -/
def rs_R005_ueqv_R005NYN_generator_29_0100_0199 : Poly :=
[
  term (-2 : Rat) [(0, 1), (14, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (15, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(4, 1), (14, 1)],
  term (-1 : Rat) [(4, 2)],
  term (2 : Rat) [(5, 1), (15, 1)],
  term (-1 : Rat) [(5, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0100 : Poly :=
[
  term ((32970072 : Rat) / 385571) [(1, 1), (6, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 100 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0100 : Poly :=
[
  term ((-65940144 : Rat) / 385571) [(0, 1), (1, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((32970072 : Rat) / 385571) [(0, 2), (1, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((65940144 : Rat) / 385571) [(1, 1), (4, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-32970072 : Rat) / 385571) [(1, 1), (4, 2), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((65940144 : Rat) / 385571) [(1, 1), (5, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-32970072 : Rat) / 385571) [(1, 1), (5, 2), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-65940144 : Rat) / 385571) [(1, 2), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((32970072 : Rat) / 385571) [(1, 3), (6, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0100_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0100
        rs_R005_ueqv_R005NYN_generator_29_0100_0199 =
      rs_R005_ueqv_R005NYN_partial_29_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0101 : Poly :=
[
  term ((47908480 : Rat) / 158397) [(1, 1), (8, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 101 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0101 : Poly :=
[
  term ((-95816960 : Rat) / 158397) [(0, 1), (1, 1), (8, 1), (12, 1), (14, 2), (15, 1)],
  term ((47908480 : Rat) / 158397) [(0, 2), (1, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((95816960 : Rat) / 158397) [(1, 1), (4, 1), (8, 1), (12, 1), (14, 2), (15, 1)],
  term ((-47908480 : Rat) / 158397) [(1, 1), (4, 2), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((95816960 : Rat) / 158397) [(1, 1), (5, 1), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((-47908480 : Rat) / 158397) [(1, 1), (5, 2), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-95816960 : Rat) / 158397) [(1, 2), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((47908480 : Rat) / 158397) [(1, 3), (8, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0101_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0101
        rs_R005_ueqv_R005NYN_generator_29_0100_0199 =
      rs_R005_ueqv_R005NYN_partial_29_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0102 : Poly :=
[
  term ((-215464720 : Rat) / 385571) [(1, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 102 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0102 : Poly :=
[
  term ((430929440 : Rat) / 385571) [(0, 1), (1, 1), (8, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-215464720 : Rat) / 385571) [(0, 2), (1, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-430929440 : Rat) / 385571) [(1, 1), (4, 1), (8, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((215464720 : Rat) / 385571) [(1, 1), (4, 2), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-430929440 : Rat) / 385571) [(1, 1), (5, 1), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((215464720 : Rat) / 385571) [(1, 1), (5, 2), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((430929440 : Rat) / 385571) [(1, 2), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-215464720 : Rat) / 385571) [(1, 3), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0102_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0102
        rs_R005_ueqv_R005NYN_generator_29_0100_0199 =
      rs_R005_ueqv_R005NYN_partial_29_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0103 : Poly :=
[
  term ((-23954240 : Rat) / 158397) [(1, 1), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 103 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0103 : Poly :=
[
  term ((47908480 : Rat) / 158397) [(0, 1), (1, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-23954240 : Rat) / 158397) [(0, 2), (1, 1), (8, 1), (12, 1), (15, 1)],
  term ((-47908480 : Rat) / 158397) [(1, 1), (4, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((23954240 : Rat) / 158397) [(1, 1), (4, 2), (8, 1), (12, 1), (15, 1)],
  term ((-47908480 : Rat) / 158397) [(1, 1), (5, 1), (8, 1), (12, 1), (15, 2)],
  term ((23954240 : Rat) / 158397) [(1, 1), (5, 2), (8, 1), (12, 1), (15, 1)],
  term ((47908480 : Rat) / 158397) [(1, 2), (8, 1), (12, 1), (15, 2)],
  term ((-23954240 : Rat) / 158397) [(1, 3), (8, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0103_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0103
        rs_R005_ueqv_R005NYN_generator_29_0100_0199 =
      rs_R005_ueqv_R005NYN_partial_29_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0104 : Poly :=
[
  term ((107732360 : Rat) / 385571) [(1, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 104 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0104 : Poly :=
[
  term ((-215464720 : Rat) / 385571) [(0, 1), (1, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((107732360 : Rat) / 385571) [(0, 2), (1, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((215464720 : Rat) / 385571) [(1, 1), (4, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-107732360 : Rat) / 385571) [(1, 1), (4, 2), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((215464720 : Rat) / 385571) [(1, 1), (5, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-107732360 : Rat) / 385571) [(1, 1), (5, 2), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-215464720 : Rat) / 385571) [(1, 2), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((107732360 : Rat) / 385571) [(1, 3), (8, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0104_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0104
        rs_R005_ueqv_R005NYN_generator_29_0100_0199 =
      rs_R005_ueqv_R005NYN_partial_29_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0105 : Poly :=
[
  term ((-1064960 : Rat) / 158397) [(1, 1), (8, 1), (15, 1)]
]

/-- Partial product 105 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0105 : Poly :=
[
  term ((2129920 : Rat) / 158397) [(0, 1), (1, 1), (8, 1), (14, 1), (15, 1)],
  term ((-1064960 : Rat) / 158397) [(0, 2), (1, 1), (8, 1), (15, 1)],
  term ((-2129920 : Rat) / 158397) [(1, 1), (4, 1), (8, 1), (14, 1), (15, 1)],
  term ((1064960 : Rat) / 158397) [(1, 1), (4, 2), (8, 1), (15, 1)],
  term ((-2129920 : Rat) / 158397) [(1, 1), (5, 1), (8, 1), (15, 2)],
  term ((1064960 : Rat) / 158397) [(1, 1), (5, 2), (8, 1), (15, 1)],
  term ((2129920 : Rat) / 158397) [(1, 2), (8, 1), (15, 2)],
  term ((-1064960 : Rat) / 158397) [(1, 3), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0105_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0105
        rs_R005_ueqv_R005NYN_generator_29_0100_0199 =
      rs_R005_ueqv_R005NYN_partial_29_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0106 : Poly :=
[
  term ((-2156032 : Rat) / 385571) [(1, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 106 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0106 : Poly :=
[
  term ((4312064 : Rat) / 385571) [(0, 1), (1, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2156032 : Rat) / 385571) [(0, 2), (1, 1), (8, 1), (15, 1), (16, 1)],
  term ((-4312064 : Rat) / 385571) [(1, 1), (4, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((2156032 : Rat) / 385571) [(1, 1), (4, 2), (8, 1), (15, 1), (16, 1)],
  term ((-4312064 : Rat) / 385571) [(1, 1), (5, 1), (8, 1), (15, 2), (16, 1)],
  term ((2156032 : Rat) / 385571) [(1, 1), (5, 2), (8, 1), (15, 1), (16, 1)],
  term ((4312064 : Rat) / 385571) [(1, 2), (8, 1), (15, 2), (16, 1)],
  term ((-2156032 : Rat) / 385571) [(1, 3), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0106_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0106
        rs_R005_ueqv_R005NYN_generator_29_0100_0199 =
      rs_R005_ueqv_R005NYN_partial_29_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0107 : Poly :=
[
  term ((-47908480 : Rat) / 158397) [(1, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 107 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0107 : Poly :=
[
  term ((95816960 : Rat) / 158397) [(0, 1), (1, 1), (12, 1), (14, 2), (15, 1)],
  term ((-47908480 : Rat) / 158397) [(0, 2), (1, 1), (12, 1), (14, 1), (15, 1)],
  term ((-95816960 : Rat) / 158397) [(1, 1), (4, 1), (12, 1), (14, 2), (15, 1)],
  term ((47908480 : Rat) / 158397) [(1, 1), (4, 2), (12, 1), (14, 1), (15, 1)],
  term ((-95816960 : Rat) / 158397) [(1, 1), (5, 1), (12, 1), (14, 1), (15, 2)],
  term ((47908480 : Rat) / 158397) [(1, 1), (5, 2), (12, 1), (14, 1), (15, 1)],
  term ((95816960 : Rat) / 158397) [(1, 2), (12, 1), (14, 1), (15, 2)],
  term ((-47908480 : Rat) / 158397) [(1, 3), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0107_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0107
        rs_R005_ueqv_R005NYN_generator_29_0100_0199 =
      rs_R005_ueqv_R005NYN_partial_29_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0108 : Poly :=
[
  term ((215464720 : Rat) / 385571) [(1, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 108 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0108 : Poly :=
[
  term ((-430929440 : Rat) / 385571) [(0, 1), (1, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((215464720 : Rat) / 385571) [(0, 2), (1, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((430929440 : Rat) / 385571) [(1, 1), (4, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-215464720 : Rat) / 385571) [(1, 1), (4, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((430929440 : Rat) / 385571) [(1, 1), (5, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-215464720 : Rat) / 385571) [(1, 1), (5, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-430929440 : Rat) / 385571) [(1, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((215464720 : Rat) / 385571) [(1, 3), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0108_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0108
        rs_R005_ueqv_R005NYN_generator_29_0100_0199 =
      rs_R005_ueqv_R005NYN_partial_29_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0109 : Poly :=
[
  term ((23954240 : Rat) / 158397) [(1, 1), (12, 1), (15, 1)]
]

/-- Partial product 109 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0109 : Poly :=
[
  term ((-47908480 : Rat) / 158397) [(0, 1), (1, 1), (12, 1), (14, 1), (15, 1)],
  term ((23954240 : Rat) / 158397) [(0, 2), (1, 1), (12, 1), (15, 1)],
  term ((47908480 : Rat) / 158397) [(1, 1), (4, 1), (12, 1), (14, 1), (15, 1)],
  term ((-23954240 : Rat) / 158397) [(1, 1), (4, 2), (12, 1), (15, 1)],
  term ((47908480 : Rat) / 158397) [(1, 1), (5, 1), (12, 1), (15, 2)],
  term ((-23954240 : Rat) / 158397) [(1, 1), (5, 2), (12, 1), (15, 1)],
  term ((-47908480 : Rat) / 158397) [(1, 2), (12, 1), (15, 2)],
  term ((23954240 : Rat) / 158397) [(1, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0109_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0109
        rs_R005_ueqv_R005NYN_generator_29_0100_0199 =
      rs_R005_ueqv_R005NYN_partial_29_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0110 : Poly :=
[
  term ((-107732360 : Rat) / 385571) [(1, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 110 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0110 : Poly :=
[
  term ((215464720 : Rat) / 385571) [(0, 1), (1, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-107732360 : Rat) / 385571) [(0, 2), (1, 1), (12, 1), (15, 1), (16, 1)],
  term ((-215464720 : Rat) / 385571) [(1, 1), (4, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((107732360 : Rat) / 385571) [(1, 1), (4, 2), (12, 1), (15, 1), (16, 1)],
  term ((-215464720 : Rat) / 385571) [(1, 1), (5, 1), (12, 1), (15, 2), (16, 1)],
  term ((107732360 : Rat) / 385571) [(1, 1), (5, 2), (12, 1), (15, 1), (16, 1)],
  term ((215464720 : Rat) / 385571) [(1, 2), (12, 1), (15, 2), (16, 1)],
  term ((-107732360 : Rat) / 385571) [(1, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0110_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0110
        rs_R005_ueqv_R005NYN_generator_29_0100_0199 =
      rs_R005_ueqv_R005NYN_partial_29_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0111 : Poly :=
[
  term ((2563104 : Rat) / 52799) [(1, 1), (14, 1), (15, 1)]
]

/-- Partial product 111 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0111 : Poly :=
[
  term ((-5126208 : Rat) / 52799) [(0, 1), (1, 1), (14, 2), (15, 1)],
  term ((2563104 : Rat) / 52799) [(0, 2), (1, 1), (14, 1), (15, 1)],
  term ((5126208 : Rat) / 52799) [(1, 1), (4, 1), (14, 2), (15, 1)],
  term ((-2563104 : Rat) / 52799) [(1, 1), (4, 2), (14, 1), (15, 1)],
  term ((5126208 : Rat) / 52799) [(1, 1), (5, 1), (14, 1), (15, 2)],
  term ((-2563104 : Rat) / 52799) [(1, 1), (5, 2), (14, 1), (15, 1)],
  term ((-5126208 : Rat) / 52799) [(1, 2), (14, 1), (15, 2)],
  term ((2563104 : Rat) / 52799) [(1, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0111_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0111
        rs_R005_ueqv_R005NYN_generator_29_0100_0199 =
      rs_R005_ueqv_R005NYN_partial_29_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0112 : Poly :=
[
  term ((-23893188 : Rat) / 385571) [(1, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 112 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0112 : Poly :=
[
  term ((47786376 : Rat) / 385571) [(0, 1), (1, 1), (14, 2), (15, 1), (16, 1)],
  term ((-23893188 : Rat) / 385571) [(0, 2), (1, 1), (14, 1), (15, 1), (16, 1)],
  term ((-47786376 : Rat) / 385571) [(1, 1), (4, 1), (14, 2), (15, 1), (16, 1)],
  term ((23893188 : Rat) / 385571) [(1, 1), (4, 2), (14, 1), (15, 1), (16, 1)],
  term ((-47786376 : Rat) / 385571) [(1, 1), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((23893188 : Rat) / 385571) [(1, 1), (5, 2), (14, 1), (15, 1), (16, 1)],
  term ((47786376 : Rat) / 385571) [(1, 2), (14, 1), (15, 2), (16, 1)],
  term ((-23893188 : Rat) / 385571) [(1, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0112_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0112
        rs_R005_ueqv_R005NYN_generator_29_0100_0199 =
      rs_R005_ueqv_R005NYN_partial_29_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0113 : Poly :=
[
  term ((-8562340 : Rat) / 158397) [(1, 1), (15, 1)]
]

/-- Partial product 113 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0113 : Poly :=
[
  term ((17124680 : Rat) / 158397) [(0, 1), (1, 1), (14, 1), (15, 1)],
  term ((-8562340 : Rat) / 158397) [(0, 2), (1, 1), (15, 1)],
  term ((-17124680 : Rat) / 158397) [(1, 1), (4, 1), (14, 1), (15, 1)],
  term ((8562340 : Rat) / 158397) [(1, 1), (4, 2), (15, 1)],
  term ((-17124680 : Rat) / 158397) [(1, 1), (5, 1), (15, 2)],
  term ((8562340 : Rat) / 158397) [(1, 1), (5, 2), (15, 1)],
  term ((17124680 : Rat) / 158397) [(1, 2), (15, 2)],
  term ((-8562340 : Rat) / 158397) [(1, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0113_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0113
        rs_R005_ueqv_R005NYN_generator_29_0100_0199 =
      rs_R005_ueqv_R005NYN_partial_29_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0114 : Poly :=
[
  term ((9608818 : Rat) / 385571) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 114 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0114 : Poly :=
[
  term ((-19217636 : Rat) / 385571) [(0, 1), (1, 1), (14, 1), (15, 1), (16, 1)],
  term ((9608818 : Rat) / 385571) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term ((19217636 : Rat) / 385571) [(1, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9608818 : Rat) / 385571) [(1, 1), (4, 2), (15, 1), (16, 1)],
  term ((19217636 : Rat) / 385571) [(1, 1), (5, 1), (15, 2), (16, 1)],
  term ((-9608818 : Rat) / 385571) [(1, 1), (5, 2), (15, 1), (16, 1)],
  term ((-19217636 : Rat) / 385571) [(1, 2), (15, 2), (16, 1)],
  term ((9608818 : Rat) / 385571) [(1, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0114_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0114
        rs_R005_ueqv_R005NYN_generator_29_0100_0199 =
      rs_R005_ueqv_R005NYN_partial_29_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0115 : Poly :=
[
  term ((1690808 : Rat) / 52799) [(1, 2)]
]

/-- Partial product 115 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0115 : Poly :=
[
  term ((-3381616 : Rat) / 52799) [(0, 1), (1, 2), (14, 1)],
  term ((1690808 : Rat) / 52799) [(0, 2), (1, 2)],
  term ((3381616 : Rat) / 52799) [(1, 2), (4, 1), (14, 1)],
  term ((-1690808 : Rat) / 52799) [(1, 2), (4, 2)],
  term ((3381616 : Rat) / 52799) [(1, 2), (5, 1), (15, 1)],
  term ((-1690808 : Rat) / 52799) [(1, 2), (5, 2)],
  term ((-3381616 : Rat) / 52799) [(1, 3), (15, 1)],
  term ((1690808 : Rat) / 52799) [(1, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0115_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0115
        rs_R005_ueqv_R005NYN_generator_29_0100_0199 =
      rs_R005_ueqv_R005NYN_partial_29_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0116 : Poly :=
[
  term ((-3112960 : Rat) / 52799) [(3, 1), (4, 1), (8, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 116 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0116 : Poly :=
[
  term ((6225920 : Rat) / 52799) [(0, 1), (3, 1), (4, 1), (8, 1), (12, 1), (14, 2), (15, 1)],
  term ((-3112960 : Rat) / 52799) [(0, 2), (3, 1), (4, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((6225920 : Rat) / 52799) [(1, 1), (3, 1), (4, 1), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((-3112960 : Rat) / 52799) [(1, 2), (3, 1), (4, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-6225920 : Rat) / 52799) [(3, 1), (4, 1), (5, 1), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((3112960 : Rat) / 52799) [(3, 1), (4, 1), (5, 2), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-6225920 : Rat) / 52799) [(3, 1), (4, 2), (8, 1), (12, 1), (14, 2), (15, 1)],
  term ((3112960 : Rat) / 52799) [(3, 1), (4, 3), (8, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0116_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0116
        rs_R005_ueqv_R005NYN_generator_29_0100_0199 =
      rs_R005_ueqv_R005NYN_partial_29_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0117 : Poly :=
[
  term ((9166080 : Rat) / 385571) [(3, 1), (4, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 117 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0117 : Poly :=
[
  term ((-18332160 : Rat) / 385571) [(0, 1), (3, 1), (4, 1), (8, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((9166080 : Rat) / 385571) [(0, 2), (3, 1), (4, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-18332160 : Rat) / 385571) [(1, 1), (3, 1), (4, 1), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((9166080 : Rat) / 385571) [(1, 2), (3, 1), (4, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((18332160 : Rat) / 385571) [(3, 1), (4, 1), (5, 1), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-9166080 : Rat) / 385571) [(3, 1), (4, 1), (5, 2), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((18332160 : Rat) / 385571) [(3, 1), (4, 2), (8, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-9166080 : Rat) / 385571) [(3, 1), (4, 3), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0117_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0117
        rs_R005_ueqv_R005NYN_generator_29_0100_0199 =
      rs_R005_ueqv_R005NYN_partial_29_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0118 : Poly :=
[
  term ((1556480 : Rat) / 52799) [(3, 1), (4, 1), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 118 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0118 : Poly :=
[
  term ((-3112960 : Rat) / 52799) [(0, 1), (3, 1), (4, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((1556480 : Rat) / 52799) [(0, 2), (3, 1), (4, 1), (8, 1), (12, 1), (15, 1)],
  term ((-3112960 : Rat) / 52799) [(1, 1), (3, 1), (4, 1), (8, 1), (12, 1), (15, 2)],
  term ((1556480 : Rat) / 52799) [(1, 2), (3, 1), (4, 1), (8, 1), (12, 1), (15, 1)],
  term ((3112960 : Rat) / 52799) [(3, 1), (4, 1), (5, 1), (8, 1), (12, 1), (15, 2)],
  term ((-1556480 : Rat) / 52799) [(3, 1), (4, 1), (5, 2), (8, 1), (12, 1), (15, 1)],
  term ((3112960 : Rat) / 52799) [(3, 1), (4, 2), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1556480 : Rat) / 52799) [(3, 1), (4, 3), (8, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0118_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0118
        rs_R005_ueqv_R005NYN_generator_29_0100_0199 =
      rs_R005_ueqv_R005NYN_partial_29_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0119 : Poly :=
[
  term ((-4583040 : Rat) / 385571) [(3, 1), (4, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 119 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0119 : Poly :=
[
  term ((9166080 : Rat) / 385571) [(0, 1), (3, 1), (4, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(0, 2), (3, 1), (4, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((9166080 : Rat) / 385571) [(1, 1), (3, 1), (4, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(1, 2), (3, 1), (4, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-9166080 : Rat) / 385571) [(3, 1), (4, 1), (5, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((4583040 : Rat) / 385571) [(3, 1), (4, 1), (5, 2), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-9166080 : Rat) / 385571) [(3, 1), (4, 2), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((4583040 : Rat) / 385571) [(3, 1), (4, 3), (8, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0119_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0119
        rs_R005_ueqv_R005NYN_generator_29_0100_0199 =
      rs_R005_ueqv_R005NYN_partial_29_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0120 : Poly :=
[
  term ((3112960 : Rat) / 52799) [(3, 1), (4, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 120 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0120 : Poly :=
[
  term ((-6225920 : Rat) / 52799) [(0, 1), (3, 1), (4, 1), (12, 1), (14, 2), (15, 1)],
  term ((3112960 : Rat) / 52799) [(0, 2), (3, 1), (4, 1), (12, 1), (14, 1), (15, 1)],
  term ((-6225920 : Rat) / 52799) [(1, 1), (3, 1), (4, 1), (12, 1), (14, 1), (15, 2)],
  term ((3112960 : Rat) / 52799) [(1, 2), (3, 1), (4, 1), (12, 1), (14, 1), (15, 1)],
  term ((6225920 : Rat) / 52799) [(3, 1), (4, 1), (5, 1), (12, 1), (14, 1), (15, 2)],
  term ((-3112960 : Rat) / 52799) [(3, 1), (4, 1), (5, 2), (12, 1), (14, 1), (15, 1)],
  term ((6225920 : Rat) / 52799) [(3, 1), (4, 2), (12, 1), (14, 2), (15, 1)],
  term ((-3112960 : Rat) / 52799) [(3, 1), (4, 3), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0120_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0120
        rs_R005_ueqv_R005NYN_generator_29_0100_0199 =
      rs_R005_ueqv_R005NYN_partial_29_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0121 : Poly :=
[
  term ((-9166080 : Rat) / 385571) [(3, 1), (4, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 121 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0121 : Poly :=
[
  term ((18332160 : Rat) / 385571) [(0, 1), (3, 1), (4, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-9166080 : Rat) / 385571) [(0, 2), (3, 1), (4, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((18332160 : Rat) / 385571) [(1, 1), (3, 1), (4, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-9166080 : Rat) / 385571) [(1, 2), (3, 1), (4, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-18332160 : Rat) / 385571) [(3, 1), (4, 1), (5, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((9166080 : Rat) / 385571) [(3, 1), (4, 1), (5, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-18332160 : Rat) / 385571) [(3, 1), (4, 2), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((9166080 : Rat) / 385571) [(3, 1), (4, 3), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0121_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0121
        rs_R005_ueqv_R005NYN_generator_29_0100_0199 =
      rs_R005_ueqv_R005NYN_partial_29_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0122 : Poly :=
[
  term ((-1556480 : Rat) / 52799) [(3, 1), (4, 1), (12, 1), (15, 1)]
]

/-- Partial product 122 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0122 : Poly :=
[
  term ((3112960 : Rat) / 52799) [(0, 1), (3, 1), (4, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1556480 : Rat) / 52799) [(0, 2), (3, 1), (4, 1), (12, 1), (15, 1)],
  term ((3112960 : Rat) / 52799) [(1, 1), (3, 1), (4, 1), (12, 1), (15, 2)],
  term ((-1556480 : Rat) / 52799) [(1, 2), (3, 1), (4, 1), (12, 1), (15, 1)],
  term ((-3112960 : Rat) / 52799) [(3, 1), (4, 1), (5, 1), (12, 1), (15, 2)],
  term ((1556480 : Rat) / 52799) [(3, 1), (4, 1), (5, 2), (12, 1), (15, 1)],
  term ((-3112960 : Rat) / 52799) [(3, 1), (4, 2), (12, 1), (14, 1), (15, 1)],
  term ((1556480 : Rat) / 52799) [(3, 1), (4, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0122_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0122
        rs_R005_ueqv_R005NYN_generator_29_0100_0199 =
      rs_R005_ueqv_R005NYN_partial_29_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0123 : Poly :=
[
  term ((4583040 : Rat) / 385571) [(3, 1), (4, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 123 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0123 : Poly :=
[
  term ((-9166080 : Rat) / 385571) [(0, 1), (3, 1), (4, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((4583040 : Rat) / 385571) [(0, 2), (3, 1), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((-9166080 : Rat) / 385571) [(1, 1), (3, 1), (4, 1), (12, 1), (15, 2), (16, 1)],
  term ((4583040 : Rat) / 385571) [(1, 2), (3, 1), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((9166080 : Rat) / 385571) [(3, 1), (4, 1), (5, 1), (12, 1), (15, 2), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(3, 1), (4, 1), (5, 2), (12, 1), (15, 1), (16, 1)],
  term ((9166080 : Rat) / 385571) [(3, 1), (4, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(3, 1), (4, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0123_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0123
        rs_R005_ueqv_R005NYN_generator_29_0100_0199 =
      rs_R005_ueqv_R005NYN_partial_29_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0124 : Poly :=
[
  term ((6348800 : Rat) / 158397) [(3, 1), (8, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 124 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0124 : Poly :=
[
  term ((-12697600 : Rat) / 158397) [(0, 1), (3, 1), (8, 1), (12, 1), (14, 2), (15, 1)],
  term ((6348800 : Rat) / 158397) [(0, 2), (3, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-12697600 : Rat) / 158397) [(1, 1), (3, 1), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((6348800 : Rat) / 158397) [(1, 2), (3, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((12697600 : Rat) / 158397) [(3, 1), (4, 1), (8, 1), (12, 1), (14, 2), (15, 1)],
  term ((-6348800 : Rat) / 158397) [(3, 1), (4, 2), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((12697600 : Rat) / 158397) [(3, 1), (5, 1), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((-6348800 : Rat) / 158397) [(3, 1), (5, 2), (8, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0124_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0124
        rs_R005_ueqv_R005NYN_generator_29_0100_0199 =
      rs_R005_ueqv_R005NYN_partial_29_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0125 : Poly :=
[
  term ((-22237760 : Rat) / 385571) [(3, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 125 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0125 : Poly :=
[
  term ((44475520 : Rat) / 385571) [(0, 1), (3, 1), (8, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-22237760 : Rat) / 385571) [(0, 2), (3, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((44475520 : Rat) / 385571) [(1, 1), (3, 1), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-22237760 : Rat) / 385571) [(1, 2), (3, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-44475520 : Rat) / 385571) [(3, 1), (4, 1), (8, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((22237760 : Rat) / 385571) [(3, 1), (4, 2), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-44475520 : Rat) / 385571) [(3, 1), (5, 1), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((22237760 : Rat) / 385571) [(3, 1), (5, 2), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0125_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0125
        rs_R005_ueqv_R005NYN_generator_29_0100_0199 =
      rs_R005_ueqv_R005NYN_partial_29_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0126 : Poly :=
[
  term ((-3174400 : Rat) / 158397) [(3, 1), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 126 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0126 : Poly :=
[
  term ((6348800 : Rat) / 158397) [(0, 1), (3, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-3174400 : Rat) / 158397) [(0, 2), (3, 1), (8, 1), (12, 1), (15, 1)],
  term ((6348800 : Rat) / 158397) [(1, 1), (3, 1), (8, 1), (12, 1), (15, 2)],
  term ((-3174400 : Rat) / 158397) [(1, 2), (3, 1), (8, 1), (12, 1), (15, 1)],
  term ((-6348800 : Rat) / 158397) [(3, 1), (4, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((3174400 : Rat) / 158397) [(3, 1), (4, 2), (8, 1), (12, 1), (15, 1)],
  term ((-6348800 : Rat) / 158397) [(3, 1), (5, 1), (8, 1), (12, 1), (15, 2)],
  term ((3174400 : Rat) / 158397) [(3, 1), (5, 2), (8, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0126_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0126
        rs_R005_ueqv_R005NYN_generator_29_0100_0199 =
      rs_R005_ueqv_R005NYN_partial_29_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0127 : Poly :=
[
  term ((11118880 : Rat) / 385571) [(3, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 127 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0127 : Poly :=
[
  term ((-22237760 : Rat) / 385571) [(0, 1), (3, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((11118880 : Rat) / 385571) [(0, 2), (3, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-22237760 : Rat) / 385571) [(1, 1), (3, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((11118880 : Rat) / 385571) [(1, 2), (3, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((22237760 : Rat) / 385571) [(3, 1), (4, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11118880 : Rat) / 385571) [(3, 1), (4, 2), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((22237760 : Rat) / 385571) [(3, 1), (5, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-11118880 : Rat) / 385571) [(3, 1), (5, 2), (8, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0127_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0127
        rs_R005_ueqv_R005NYN_generator_29_0100_0199 =
      rs_R005_ueqv_R005NYN_partial_29_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0128 : Poly :=
[
  term ((-6348800 : Rat) / 158397) [(3, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 128 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0128 : Poly :=
[
  term ((12697600 : Rat) / 158397) [(0, 1), (3, 1), (12, 1), (14, 2), (15, 1)],
  term ((-6348800 : Rat) / 158397) [(0, 2), (3, 1), (12, 1), (14, 1), (15, 1)],
  term ((12697600 : Rat) / 158397) [(1, 1), (3, 1), (12, 1), (14, 1), (15, 2)],
  term ((-6348800 : Rat) / 158397) [(1, 2), (3, 1), (12, 1), (14, 1), (15, 1)],
  term ((-12697600 : Rat) / 158397) [(3, 1), (4, 1), (12, 1), (14, 2), (15, 1)],
  term ((6348800 : Rat) / 158397) [(3, 1), (4, 2), (12, 1), (14, 1), (15, 1)],
  term ((-12697600 : Rat) / 158397) [(3, 1), (5, 1), (12, 1), (14, 1), (15, 2)],
  term ((6348800 : Rat) / 158397) [(3, 1), (5, 2), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0128_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0128
        rs_R005_ueqv_R005NYN_generator_29_0100_0199 =
      rs_R005_ueqv_R005NYN_partial_29_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0129 : Poly :=
[
  term ((22237760 : Rat) / 385571) [(3, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 129 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0129 : Poly :=
[
  term ((-44475520 : Rat) / 385571) [(0, 1), (3, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((22237760 : Rat) / 385571) [(0, 2), (3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-44475520 : Rat) / 385571) [(1, 1), (3, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((22237760 : Rat) / 385571) [(1, 2), (3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((44475520 : Rat) / 385571) [(3, 1), (4, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-22237760 : Rat) / 385571) [(3, 1), (4, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((44475520 : Rat) / 385571) [(3, 1), (5, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-22237760 : Rat) / 385571) [(3, 1), (5, 2), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0129_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0129
        rs_R005_ueqv_R005NYN_generator_29_0100_0199 =
      rs_R005_ueqv_R005NYN_partial_29_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0130 : Poly :=
[
  term ((3174400 : Rat) / 158397) [(3, 1), (12, 1), (15, 1)]
]

/-- Partial product 130 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0130 : Poly :=
[
  term ((-6348800 : Rat) / 158397) [(0, 1), (3, 1), (12, 1), (14, 1), (15, 1)],
  term ((3174400 : Rat) / 158397) [(0, 2), (3, 1), (12, 1), (15, 1)],
  term ((-6348800 : Rat) / 158397) [(1, 1), (3, 1), (12, 1), (15, 2)],
  term ((3174400 : Rat) / 158397) [(1, 2), (3, 1), (12, 1), (15, 1)],
  term ((6348800 : Rat) / 158397) [(3, 1), (4, 1), (12, 1), (14, 1), (15, 1)],
  term ((-3174400 : Rat) / 158397) [(3, 1), (4, 2), (12, 1), (15, 1)],
  term ((6348800 : Rat) / 158397) [(3, 1), (5, 1), (12, 1), (15, 2)],
  term ((-3174400 : Rat) / 158397) [(3, 1), (5, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0130_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0130
        rs_R005_ueqv_R005NYN_generator_29_0100_0199 =
      rs_R005_ueqv_R005NYN_partial_29_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0131 : Poly :=
[
  term ((-11118880 : Rat) / 385571) [(3, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 131 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0131 : Poly :=
[
  term ((22237760 : Rat) / 385571) [(0, 1), (3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11118880 : Rat) / 385571) [(0, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((22237760 : Rat) / 385571) [(1, 1), (3, 1), (12, 1), (15, 2), (16, 1)],
  term ((-11118880 : Rat) / 385571) [(1, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-22237760 : Rat) / 385571) [(3, 1), (4, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((11118880 : Rat) / 385571) [(3, 1), (4, 2), (12, 1), (15, 1), (16, 1)],
  term ((-22237760 : Rat) / 385571) [(3, 1), (5, 1), (12, 1), (15, 2), (16, 1)],
  term ((11118880 : Rat) / 385571) [(3, 1), (5, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0131_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0131
        rs_R005_ueqv_R005NYN_generator_29_0100_0199 =
      rs_R005_ueqv_R005NYN_partial_29_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0132 : Poly :=
[
  term ((1556480 : Rat) / 52799) [(3, 1), (14, 1), (15, 1)]
]

/-- Partial product 132 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0132 : Poly :=
[
  term ((-3112960 : Rat) / 52799) [(0, 1), (3, 1), (14, 2), (15, 1)],
  term ((1556480 : Rat) / 52799) [(0, 2), (3, 1), (14, 1), (15, 1)],
  term ((-3112960 : Rat) / 52799) [(1, 1), (3, 1), (14, 1), (15, 2)],
  term ((1556480 : Rat) / 52799) [(1, 2), (3, 1), (14, 1), (15, 1)],
  term ((3112960 : Rat) / 52799) [(3, 1), (4, 1), (14, 2), (15, 1)],
  term ((-1556480 : Rat) / 52799) [(3, 1), (4, 2), (14, 1), (15, 1)],
  term ((3112960 : Rat) / 52799) [(3, 1), (5, 1), (14, 1), (15, 2)],
  term ((-1556480 : Rat) / 52799) [(3, 1), (5, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0132_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0132
        rs_R005_ueqv_R005NYN_generator_29_0100_0199 =
      rs_R005_ueqv_R005NYN_partial_29_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0133 : Poly :=
[
  term ((-4583040 : Rat) / 385571) [(3, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 133 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0133 : Poly :=
[
  term ((9166080 : Rat) / 385571) [(0, 1), (3, 1), (14, 2), (15, 1), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(0, 2), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((9166080 : Rat) / 385571) [(1, 1), (3, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(1, 2), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9166080 : Rat) / 385571) [(3, 1), (4, 1), (14, 2), (15, 1), (16, 1)],
  term ((4583040 : Rat) / 385571) [(3, 1), (4, 2), (14, 1), (15, 1), (16, 1)],
  term ((-9166080 : Rat) / 385571) [(3, 1), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((4583040 : Rat) / 385571) [(3, 1), (5, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0133_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0133
        rs_R005_ueqv_R005NYN_generator_29_0100_0199 =
      rs_R005_ueqv_R005NYN_partial_29_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0134 : Poly :=
[
  term ((1014176 : Rat) / 158397) [(3, 1), (15, 1)]
]

/-- Partial product 134 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0134 : Poly :=
[
  term ((-2028352 : Rat) / 158397) [(0, 1), (3, 1), (14, 1), (15, 1)],
  term ((1014176 : Rat) / 158397) [(0, 2), (3, 1), (15, 1)],
  term ((-2028352 : Rat) / 158397) [(1, 1), (3, 1), (15, 2)],
  term ((1014176 : Rat) / 158397) [(1, 2), (3, 1), (15, 1)],
  term ((2028352 : Rat) / 158397) [(3, 1), (4, 1), (14, 1), (15, 1)],
  term ((-1014176 : Rat) / 158397) [(3, 1), (4, 2), (15, 1)],
  term ((2028352 : Rat) / 158397) [(3, 1), (5, 1), (15, 2)],
  term ((-1014176 : Rat) / 158397) [(3, 1), (5, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0134_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0134
        rs_R005_ueqv_R005NYN_generator_29_0100_0199 =
      rs_R005_ueqv_R005NYN_partial_29_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0135 : Poly :=
[
  term ((9690132 : Rat) / 385571) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 135 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0135 : Poly :=
[
  term ((-19380264 : Rat) / 385571) [(0, 1), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((9690132 : Rat) / 385571) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((-19380264 : Rat) / 385571) [(1, 1), (3, 1), (15, 2), (16, 1)],
  term ((9690132 : Rat) / 385571) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((19380264 : Rat) / 385571) [(3, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9690132 : Rat) / 385571) [(3, 1), (4, 2), (15, 1), (16, 1)],
  term ((19380264 : Rat) / 385571) [(3, 1), (5, 1), (15, 2), (16, 1)],
  term ((-9690132 : Rat) / 385571) [(3, 1), (5, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0135_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0135
        rs_R005_ueqv_R005NYN_generator_29_0100_0199 =
      rs_R005_ueqv_R005NYN_partial_29_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0136 : Poly :=
[
  term ((-422702 : Rat) / 158397) [(4, 1)]
]

/-- Partial product 136 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0136 : Poly :=
[
  term ((845404 : Rat) / 158397) [(0, 1), (4, 1), (14, 1)],
  term ((-422702 : Rat) / 158397) [(0, 2), (4, 1)],
  term ((845404 : Rat) / 158397) [(1, 1), (4, 1), (15, 1)],
  term ((-422702 : Rat) / 158397) [(1, 2), (4, 1)],
  term ((-845404 : Rat) / 158397) [(4, 1), (5, 1), (15, 1)],
  term ((422702 : Rat) / 158397) [(4, 1), (5, 2)],
  term ((-845404 : Rat) / 158397) [(4, 2), (14, 1)],
  term ((422702 : Rat) / 158397) [(4, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0136_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0136
        rs_R005_ueqv_R005NYN_generator_29_0100_0199 =
      rs_R005_ueqv_R005NYN_partial_29_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0137 : Poly :=
[
  term ((-11960320 : Rat) / 52799) [(4, 1), (5, 1), (8, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 137 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0137 : Poly :=
[
  term ((23920640 : Rat) / 52799) [(0, 1), (4, 1), (5, 1), (8, 1), (12, 1), (14, 2), (15, 1)],
  term ((-11960320 : Rat) / 52799) [(0, 2), (4, 1), (5, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((23920640 : Rat) / 52799) [(1, 1), (4, 1), (5, 1), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((-11960320 : Rat) / 52799) [(1, 2), (4, 1), (5, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-23920640 : Rat) / 52799) [(4, 1), (5, 2), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((11960320 : Rat) / 52799) [(4, 1), (5, 3), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-23920640 : Rat) / 52799) [(4, 2), (5, 1), (8, 1), (12, 1), (14, 2), (15, 1)],
  term ((11960320 : Rat) / 52799) [(4, 3), (5, 1), (8, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0137_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0137
        rs_R005_ueqv_R005NYN_generator_29_0100_0199 =
      rs_R005_ueqv_R005NYN_partial_29_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0138 : Poly :=
[
  term ((25613184 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 138 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0138 : Poly :=
[
  term ((-51226368 : Rat) / 385571) [(0, 1), (4, 1), (5, 1), (8, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((25613184 : Rat) / 385571) [(0, 2), (4, 1), (5, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-51226368 : Rat) / 385571) [(1, 1), (4, 1), (5, 1), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((25613184 : Rat) / 385571) [(1, 2), (4, 1), (5, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((51226368 : Rat) / 385571) [(4, 1), (5, 2), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-25613184 : Rat) / 385571) [(4, 1), (5, 3), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((51226368 : Rat) / 385571) [(4, 2), (5, 1), (8, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-25613184 : Rat) / 385571) [(4, 3), (5, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0138_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0138
        rs_R005_ueqv_R005NYN_generator_29_0100_0199 =
      rs_R005_ueqv_R005NYN_partial_29_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0139 : Poly :=
[
  term ((5980160 : Rat) / 52799) [(4, 1), (5, 1), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 139 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0139 : Poly :=
[
  term ((-11960320 : Rat) / 52799) [(0, 1), (4, 1), (5, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((5980160 : Rat) / 52799) [(0, 2), (4, 1), (5, 1), (8, 1), (12, 1), (15, 1)],
  term ((-11960320 : Rat) / 52799) [(1, 1), (4, 1), (5, 1), (8, 1), (12, 1), (15, 2)],
  term ((5980160 : Rat) / 52799) [(1, 2), (4, 1), (5, 1), (8, 1), (12, 1), (15, 1)],
  term ((11960320 : Rat) / 52799) [(4, 1), (5, 2), (8, 1), (12, 1), (15, 2)],
  term ((-5980160 : Rat) / 52799) [(4, 1), (5, 3), (8, 1), (12, 1), (15, 1)],
  term ((11960320 : Rat) / 52799) [(4, 2), (5, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-5980160 : Rat) / 52799) [(4, 3), (5, 1), (8, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0139_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0139
        rs_R005_ueqv_R005NYN_generator_29_0100_0199 =
      rs_R005_ueqv_R005NYN_partial_29_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0140 : Poly :=
[
  term ((-12806592 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 140 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0140 : Poly :=
[
  term ((25613184 : Rat) / 385571) [(0, 1), (4, 1), (5, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12806592 : Rat) / 385571) [(0, 2), (4, 1), (5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((25613184 : Rat) / 385571) [(1, 1), (4, 1), (5, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-12806592 : Rat) / 385571) [(1, 2), (4, 1), (5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-25613184 : Rat) / 385571) [(4, 1), (5, 2), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((12806592 : Rat) / 385571) [(4, 1), (5, 3), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-25613184 : Rat) / 385571) [(4, 2), (5, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((12806592 : Rat) / 385571) [(4, 3), (5, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0140_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0140
        rs_R005_ueqv_R005NYN_generator_29_0100_0199 =
      rs_R005_ueqv_R005NYN_partial_29_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0141 : Poly :=
[
  term ((11960320 : Rat) / 52799) [(4, 1), (5, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 141 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0141 : Poly :=
[
  term ((-23920640 : Rat) / 52799) [(0, 1), (4, 1), (5, 1), (12, 1), (14, 2), (15, 1)],
  term ((11960320 : Rat) / 52799) [(0, 2), (4, 1), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((-23920640 : Rat) / 52799) [(1, 1), (4, 1), (5, 1), (12, 1), (14, 1), (15, 2)],
  term ((11960320 : Rat) / 52799) [(1, 2), (4, 1), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((23920640 : Rat) / 52799) [(4, 1), (5, 2), (12, 1), (14, 1), (15, 2)],
  term ((-11960320 : Rat) / 52799) [(4, 1), (5, 3), (12, 1), (14, 1), (15, 1)],
  term ((23920640 : Rat) / 52799) [(4, 2), (5, 1), (12, 1), (14, 2), (15, 1)],
  term ((-11960320 : Rat) / 52799) [(4, 3), (5, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0141_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0141
        rs_R005_ueqv_R005NYN_generator_29_0100_0199 =
      rs_R005_ueqv_R005NYN_partial_29_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0142 : Poly :=
[
  term ((-25613184 : Rat) / 385571) [(4, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 142 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0142 : Poly :=
[
  term ((51226368 : Rat) / 385571) [(0, 1), (4, 1), (5, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-25613184 : Rat) / 385571) [(0, 2), (4, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((51226368 : Rat) / 385571) [(1, 1), (4, 1), (5, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-25613184 : Rat) / 385571) [(1, 2), (4, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-51226368 : Rat) / 385571) [(4, 1), (5, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((25613184 : Rat) / 385571) [(4, 1), (5, 3), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-51226368 : Rat) / 385571) [(4, 2), (5, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((25613184 : Rat) / 385571) [(4, 3), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0142_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0142
        rs_R005_ueqv_R005NYN_generator_29_0100_0199 =
      rs_R005_ueqv_R005NYN_partial_29_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0143 : Poly :=
[
  term ((-5980160 : Rat) / 52799) [(4, 1), (5, 1), (12, 1), (15, 1)]
]

/-- Partial product 143 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0143 : Poly :=
[
  term ((11960320 : Rat) / 52799) [(0, 1), (4, 1), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((-5980160 : Rat) / 52799) [(0, 2), (4, 1), (5, 1), (12, 1), (15, 1)],
  term ((11960320 : Rat) / 52799) [(1, 1), (4, 1), (5, 1), (12, 1), (15, 2)],
  term ((-5980160 : Rat) / 52799) [(1, 2), (4, 1), (5, 1), (12, 1), (15, 1)],
  term ((-11960320 : Rat) / 52799) [(4, 1), (5, 2), (12, 1), (15, 2)],
  term ((5980160 : Rat) / 52799) [(4, 1), (5, 3), (12, 1), (15, 1)],
  term ((-11960320 : Rat) / 52799) [(4, 2), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((5980160 : Rat) / 52799) [(4, 3), (5, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0143_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0143
        rs_R005_ueqv_R005NYN_generator_29_0100_0199 =
      rs_R005_ueqv_R005NYN_partial_29_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0144 : Poly :=
[
  term ((12806592 : Rat) / 385571) [(4, 1), (5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 144 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0144 : Poly :=
[
  term ((-25613184 : Rat) / 385571) [(0, 1), (4, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((12806592 : Rat) / 385571) [(0, 2), (4, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-25613184 : Rat) / 385571) [(1, 1), (4, 1), (5, 1), (12, 1), (15, 2), (16, 1)],
  term ((12806592 : Rat) / 385571) [(1, 2), (4, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((25613184 : Rat) / 385571) [(4, 1), (5, 2), (12, 1), (15, 2), (16, 1)],
  term ((-12806592 : Rat) / 385571) [(4, 1), (5, 3), (12, 1), (15, 1), (16, 1)],
  term ((25613184 : Rat) / 385571) [(4, 2), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12806592 : Rat) / 385571) [(4, 3), (5, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0144_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0144
        rs_R005_ueqv_R005NYN_generator_29_0100_0199 =
      rs_R005_ueqv_R005NYN_partial_29_0144 := by
  native_decide

/-- Coefficient term 145 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0145 : Poly :=
[
  term ((11574400 : Rat) / 158397) [(4, 1), (7, 1), (8, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 145 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0145 : Poly :=
[
  term ((-23148800 : Rat) / 158397) [(0, 1), (4, 1), (7, 1), (8, 1), (12, 1), (14, 2), (15, 1)],
  term ((11574400 : Rat) / 158397) [(0, 2), (4, 1), (7, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-23148800 : Rat) / 158397) [(1, 1), (4, 1), (7, 1), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((11574400 : Rat) / 158397) [(1, 2), (4, 1), (7, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((23148800 : Rat) / 158397) [(4, 1), (5, 1), (7, 1), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((-11574400 : Rat) / 158397) [(4, 1), (5, 2), (7, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((23148800 : Rat) / 158397) [(4, 2), (7, 1), (8, 1), (12, 1), (14, 2), (15, 1)],
  term ((-11574400 : Rat) / 158397) [(4, 3), (7, 1), (8, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 145 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0145_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0145
        rs_R005_ueqv_R005NYN_generator_29_0100_0199 =
      rs_R005_ueqv_R005NYN_partial_29_0145 := by
  native_decide

/-- Coefficient term 146 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0146 : Poly :=
[
  term ((-124680784 : Rat) / 385571) [(4, 1), (7, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 146 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0146 : Poly :=
[
  term ((249361568 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (8, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-124680784 : Rat) / 385571) [(0, 2), (4, 1), (7, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((249361568 : Rat) / 385571) [(1, 1), (4, 1), (7, 1), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-124680784 : Rat) / 385571) [(1, 2), (4, 1), (7, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-249361568 : Rat) / 385571) [(4, 1), (5, 1), (7, 1), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((124680784 : Rat) / 385571) [(4, 1), (5, 2), (7, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-249361568 : Rat) / 385571) [(4, 2), (7, 1), (8, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((124680784 : Rat) / 385571) [(4, 3), (7, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 146 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0146_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0146
        rs_R005_ueqv_R005NYN_generator_29_0100_0199 =
      rs_R005_ueqv_R005NYN_partial_29_0146 := by
  native_decide

/-- Coefficient term 147 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0147 : Poly :=
[
  term ((-5787200 : Rat) / 158397) [(4, 1), (7, 1), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 147 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0147 : Poly :=
[
  term ((11574400 : Rat) / 158397) [(0, 1), (4, 1), (7, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-5787200 : Rat) / 158397) [(0, 2), (4, 1), (7, 1), (8, 1), (12, 1), (15, 1)],
  term ((11574400 : Rat) / 158397) [(1, 1), (4, 1), (7, 1), (8, 1), (12, 1), (15, 2)],
  term ((-5787200 : Rat) / 158397) [(1, 2), (4, 1), (7, 1), (8, 1), (12, 1), (15, 1)],
  term ((-11574400 : Rat) / 158397) [(4, 1), (5, 1), (7, 1), (8, 1), (12, 1), (15, 2)],
  term ((5787200 : Rat) / 158397) [(4, 1), (5, 2), (7, 1), (8, 1), (12, 1), (15, 1)],
  term ((-11574400 : Rat) / 158397) [(4, 2), (7, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((5787200 : Rat) / 158397) [(4, 3), (7, 1), (8, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 147 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0147_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0147
        rs_R005_ueqv_R005NYN_generator_29_0100_0199 =
      rs_R005_ueqv_R005NYN_partial_29_0147 := by
  native_decide

/-- Coefficient term 148 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0148 : Poly :=
[
  term ((62340392 : Rat) / 385571) [(4, 1), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 148 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0148 : Poly :=
[
  term ((-124680784 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((62340392 : Rat) / 385571) [(0, 2), (4, 1), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-124680784 : Rat) / 385571) [(1, 1), (4, 1), (7, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((62340392 : Rat) / 385571) [(1, 2), (4, 1), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((124680784 : Rat) / 385571) [(4, 1), (5, 1), (7, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-62340392 : Rat) / 385571) [(4, 1), (5, 2), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((124680784 : Rat) / 385571) [(4, 2), (7, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-62340392 : Rat) / 385571) [(4, 3), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 148 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0148_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0148
        rs_R005_ueqv_R005NYN_generator_29_0100_0199 =
      rs_R005_ueqv_R005NYN_partial_29_0148 := by
  native_decide

/-- Coefficient term 149 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0149 : Poly :=
[
  term ((-11574400 : Rat) / 158397) [(4, 1), (7, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 149 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0149 : Poly :=
[
  term ((23148800 : Rat) / 158397) [(0, 1), (4, 1), (7, 1), (12, 1), (14, 2), (15, 1)],
  term ((-11574400 : Rat) / 158397) [(0, 2), (4, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((23148800 : Rat) / 158397) [(1, 1), (4, 1), (7, 1), (12, 1), (14, 1), (15, 2)],
  term ((-11574400 : Rat) / 158397) [(1, 2), (4, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-23148800 : Rat) / 158397) [(4, 1), (5, 1), (7, 1), (12, 1), (14, 1), (15, 2)],
  term ((11574400 : Rat) / 158397) [(4, 1), (5, 2), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-23148800 : Rat) / 158397) [(4, 2), (7, 1), (12, 1), (14, 2), (15, 1)],
  term ((11574400 : Rat) / 158397) [(4, 3), (7, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 149 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0149_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0149
        rs_R005_ueqv_R005NYN_generator_29_0100_0199 =
      rs_R005_ueqv_R005NYN_partial_29_0149 := by
  native_decide

/-- Coefficient term 150 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0150 : Poly :=
[
  term ((124680784 : Rat) / 385571) [(4, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 150 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0150 : Poly :=
[
  term ((-249361568 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((124680784 : Rat) / 385571) [(0, 2), (4, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-249361568 : Rat) / 385571) [(1, 1), (4, 1), (7, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((124680784 : Rat) / 385571) [(1, 2), (4, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((249361568 : Rat) / 385571) [(4, 1), (5, 1), (7, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-124680784 : Rat) / 385571) [(4, 1), (5, 2), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((249361568 : Rat) / 385571) [(4, 2), (7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-124680784 : Rat) / 385571) [(4, 3), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 150 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0150_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0150
        rs_R005_ueqv_R005NYN_generator_29_0100_0199 =
      rs_R005_ueqv_R005NYN_partial_29_0150 := by
  native_decide

/-- Coefficient term 151 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0151 : Poly :=
[
  term ((5787200 : Rat) / 158397) [(4, 1), (7, 1), (12, 1), (15, 1)]
]

/-- Partial product 151 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0151 : Poly :=
[
  term ((-11574400 : Rat) / 158397) [(0, 1), (4, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((5787200 : Rat) / 158397) [(0, 2), (4, 1), (7, 1), (12, 1), (15, 1)],
  term ((-11574400 : Rat) / 158397) [(1, 1), (4, 1), (7, 1), (12, 1), (15, 2)],
  term ((5787200 : Rat) / 158397) [(1, 2), (4, 1), (7, 1), (12, 1), (15, 1)],
  term ((11574400 : Rat) / 158397) [(4, 1), (5, 1), (7, 1), (12, 1), (15, 2)],
  term ((-5787200 : Rat) / 158397) [(4, 1), (5, 2), (7, 1), (12, 1), (15, 1)],
  term ((11574400 : Rat) / 158397) [(4, 2), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-5787200 : Rat) / 158397) [(4, 3), (7, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 151 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0151_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0151
        rs_R005_ueqv_R005NYN_generator_29_0100_0199 =
      rs_R005_ueqv_R005NYN_partial_29_0151 := by
  native_decide

/-- Coefficient term 152 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0152 : Poly :=
[
  term ((-62340392 : Rat) / 385571) [(4, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 152 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0152 : Poly :=
[
  term ((124680784 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-62340392 : Rat) / 385571) [(0, 2), (4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((124680784 : Rat) / 385571) [(1, 1), (4, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((-62340392 : Rat) / 385571) [(1, 2), (4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-124680784 : Rat) / 385571) [(4, 1), (5, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((62340392 : Rat) / 385571) [(4, 1), (5, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-124680784 : Rat) / 385571) [(4, 2), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((62340392 : Rat) / 385571) [(4, 3), (7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 152 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0152_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0152
        rs_R005_ueqv_R005NYN_generator_29_0100_0199 =
      rs_R005_ueqv_R005NYN_partial_29_0152 := by
  native_decide

/-- Coefficient term 153 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0153 : Poly :=
[
  term ((24238592 : Rat) / 158397) [(4, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 153 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0153 : Poly :=
[
  term ((-48477184 : Rat) / 158397) [(0, 1), (4, 1), (8, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((24238592 : Rat) / 158397) [(0, 2), (4, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-48477184 : Rat) / 158397) [(1, 1), (4, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 2)],
  term ((24238592 : Rat) / 158397) [(1, 2), (4, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((48477184 : Rat) / 158397) [(4, 1), (5, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 2)],
  term ((-24238592 : Rat) / 158397) [(4, 1), (5, 2), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((48477184 : Rat) / 158397) [(4, 2), (8, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((-24238592 : Rat) / 158397) [(4, 3), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 153 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0153_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0153
        rs_R005_ueqv_R005NYN_generator_29_0100_0199 =
      rs_R005_ueqv_R005NYN_partial_29_0153 := by
  native_decide

/-- Coefficient term 154 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0154 : Poly :=
[
  term ((-3682016 : Rat) / 385571) [(4, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 154 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0154 : Poly :=
[
  term ((7364032 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3682016 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((7364032 : Rat) / 385571) [(1, 1), (4, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3682016 : Rat) / 385571) [(1, 2), (4, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7364032 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((3682016 : Rat) / 385571) [(4, 1), (5, 2), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7364032 : Rat) / 385571) [(4, 2), (8, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((3682016 : Rat) / 385571) [(4, 3), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 154 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0154_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0154
        rs_R005_ueqv_R005NYN_generator_29_0100_0199 =
      rs_R005_ueqv_R005NYN_partial_29_0154 := by
  native_decide

/-- Coefficient term 155 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0155 : Poly :=
[
  term ((-12119296 : Rat) / 158397) [(4, 1), (8, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 155 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0155 : Poly :=
[
  term ((24238592 : Rat) / 158397) [(0, 1), (4, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-12119296 : Rat) / 158397) [(0, 2), (4, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((24238592 : Rat) / 158397) [(1, 1), (4, 1), (8, 1), (9, 1), (12, 1), (15, 2)],
  term ((-12119296 : Rat) / 158397) [(1, 2), (4, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-24238592 : Rat) / 158397) [(4, 1), (5, 1), (8, 1), (9, 1), (12, 1), (15, 2)],
  term ((12119296 : Rat) / 158397) [(4, 1), (5, 2), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-24238592 : Rat) / 158397) [(4, 2), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((12119296 : Rat) / 158397) [(4, 3), (8, 1), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 155 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0155_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0155
        rs_R005_ueqv_R005NYN_generator_29_0100_0199 =
      rs_R005_ueqv_R005NYN_partial_29_0155 := by
  native_decide

/-- Coefficient term 156 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0156 : Poly :=
[
  term ((1841008 : Rat) / 385571) [(4, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 156 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0156 : Poly :=
[
  term ((-3682016 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1841008 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3682016 : Rat) / 385571) [(1, 1), (4, 1), (8, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((1841008 : Rat) / 385571) [(1, 2), (4, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((3682016 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1841008 : Rat) / 385571) [(4, 1), (5, 2), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((3682016 : Rat) / 385571) [(4, 2), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1841008 : Rat) / 385571) [(4, 3), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 156 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0156_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0156
        rs_R005_ueqv_R005NYN_generator_29_0100_0199 =
      rs_R005_ueqv_R005NYN_partial_29_0156 := by
  native_decide

/-- Coefficient term 157 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0157 : Poly :=
[
  term ((3112960 : Rat) / 52799) [(4, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 157 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0157 : Poly :=
[
  term ((-6225920 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((3112960 : Rat) / 52799) [(0, 2), (4, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-6225920 : Rat) / 52799) [(1, 1), (4, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((3112960 : Rat) / 52799) [(1, 2), (4, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((6225920 : Rat) / 52799) [(4, 1), (5, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((-3112960 : Rat) / 52799) [(4, 1), (5, 2), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((6225920 : Rat) / 52799) [(4, 2), (8, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-3112960 : Rat) / 52799) [(4, 3), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 157 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0157_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0157
        rs_R005_ueqv_R005NYN_generator_29_0100_0199 =
      rs_R005_ueqv_R005NYN_partial_29_0157 := by
  native_decide

/-- Coefficient term 158 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0158 : Poly :=
[
  term ((-9166080 : Rat) / 385571) [(4, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 158 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0158 : Poly :=
[
  term ((18332160 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-9166080 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((18332160 : Rat) / 385571) [(1, 1), (4, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-9166080 : Rat) / 385571) [(1, 2), (4, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-18332160 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((9166080 : Rat) / 385571) [(4, 1), (5, 2), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-18332160 : Rat) / 385571) [(4, 2), (8, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((9166080 : Rat) / 385571) [(4, 3), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 158 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0158_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0158
        rs_R005_ueqv_R005NYN_generator_29_0100_0199 =
      rs_R005_ueqv_R005NYN_partial_29_0158 := by
  native_decide

/-- Coefficient term 159 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0159 : Poly :=
[
  term ((-1556480 : Rat) / 52799) [(4, 1), (8, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 159 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0159 : Poly :=
[
  term ((3112960 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1556480 : Rat) / 52799) [(0, 2), (4, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((3112960 : Rat) / 52799) [(1, 1), (4, 1), (8, 1), (11, 1), (12, 1), (15, 2)],
  term ((-1556480 : Rat) / 52799) [(1, 2), (4, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-3112960 : Rat) / 52799) [(4, 1), (5, 1), (8, 1), (11, 1), (12, 1), (15, 2)],
  term ((1556480 : Rat) / 52799) [(4, 1), (5, 2), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-3112960 : Rat) / 52799) [(4, 2), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((1556480 : Rat) / 52799) [(4, 3), (8, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 159 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0159_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0159
        rs_R005_ueqv_R005NYN_generator_29_0100_0199 =
      rs_R005_ueqv_R005NYN_partial_29_0159 := by
  native_decide

/-- Coefficient term 160 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0160 : Poly :=
[
  term ((4583040 : Rat) / 385571) [(4, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 160 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0160 : Poly :=
[
  term ((-9166080 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((4583040 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-9166080 : Rat) / 385571) [(1, 1), (4, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((4583040 : Rat) / 385571) [(1, 2), (4, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((9166080 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(4, 1), (5, 2), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((9166080 : Rat) / 385571) [(4, 2), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(4, 3), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 160 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0160_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0160
        rs_R005_ueqv_R005NYN_generator_29_0100_0199 =
      rs_R005_ueqv_R005NYN_partial_29_0160 := by
  native_decide

/-- Coefficient term 161 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0161 : Poly :=
[
  term ((-1556480 : Rat) / 52799) [(4, 1), (8, 1), (12, 1), (14, 1), (15, 2)]
]

/-- Partial product 161 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0161 : Poly :=
[
  term ((3112960 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (12, 1), (14, 2), (15, 2)],
  term ((-1556480 : Rat) / 52799) [(0, 2), (4, 1), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((3112960 : Rat) / 52799) [(1, 1), (4, 1), (8, 1), (12, 1), (14, 1), (15, 3)],
  term ((-1556480 : Rat) / 52799) [(1, 2), (4, 1), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((-3112960 : Rat) / 52799) [(4, 1), (5, 1), (8, 1), (12, 1), (14, 1), (15, 3)],
  term ((1556480 : Rat) / 52799) [(4, 1), (5, 2), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((-3112960 : Rat) / 52799) [(4, 2), (8, 1), (12, 1), (14, 2), (15, 2)],
  term ((1556480 : Rat) / 52799) [(4, 3), (8, 1), (12, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 161 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0161_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0161
        rs_R005_ueqv_R005NYN_generator_29_0100_0199 =
      rs_R005_ueqv_R005NYN_partial_29_0161 := by
  native_decide

/-- Coefficient term 162 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0162 : Poly :=
[
  term ((4583040 : Rat) / 385571) [(4, 1), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 162 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0162 : Poly :=
[
  term ((-9166080 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((4583040 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-9166080 : Rat) / 385571) [(1, 1), (4, 1), (8, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((4583040 : Rat) / 385571) [(1, 2), (4, 1), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((9166080 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(4, 1), (5, 2), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((9166080 : Rat) / 385571) [(4, 2), (8, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(4, 3), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 162 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0162_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0162
        rs_R005_ueqv_R005NYN_generator_29_0100_0199 =
      rs_R005_ueqv_R005NYN_partial_29_0162 := by
  native_decide

/-- Coefficient term 163 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0163 : Poly :=
[
  term ((778240 : Rat) / 52799) [(4, 1), (8, 1), (12, 1), (15, 2)]
]

/-- Partial product 163 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0163 : Poly :=
[
  term ((-1556480 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((778240 : Rat) / 52799) [(0, 2), (4, 1), (8, 1), (12, 1), (15, 2)],
  term ((-1556480 : Rat) / 52799) [(1, 1), (4, 1), (8, 1), (12, 1), (15, 3)],
  term ((778240 : Rat) / 52799) [(1, 2), (4, 1), (8, 1), (12, 1), (15, 2)],
  term ((1556480 : Rat) / 52799) [(4, 1), (5, 1), (8, 1), (12, 1), (15, 3)],
  term ((-778240 : Rat) / 52799) [(4, 1), (5, 2), (8, 1), (12, 1), (15, 2)],
  term ((1556480 : Rat) / 52799) [(4, 2), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((-778240 : Rat) / 52799) [(4, 3), (8, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 163 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0163_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0163
        rs_R005_ueqv_R005NYN_generator_29_0100_0199 =
      rs_R005_ueqv_R005NYN_partial_29_0163 := by
  native_decide

/-- Coefficient term 164 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0164 : Poly :=
[
  term ((-2291520 : Rat) / 385571) [(4, 1), (8, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 164 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0164 : Poly :=
[
  term ((4583040 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2291520 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((4583040 : Rat) / 385571) [(1, 1), (4, 1), (8, 1), (12, 1), (15, 3), (16, 1)],
  term ((-2291520 : Rat) / 385571) [(1, 2), (4, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (12, 1), (15, 3), (16, 1)],
  term ((2291520 : Rat) / 385571) [(4, 1), (5, 2), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(4, 2), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((2291520 : Rat) / 385571) [(4, 3), (8, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 164 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0164_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0164
        rs_R005_ueqv_R005NYN_generator_29_0100_0199 =
      rs_R005_ueqv_R005NYN_partial_29_0164 := by
  native_decide

/-- Coefficient term 165 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0165 : Poly :=
[
  term ((-24238592 : Rat) / 158397) [(4, 1), (9, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 165 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0165 : Poly :=
[
  term ((48477184 : Rat) / 158397) [(0, 1), (4, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((-24238592 : Rat) / 158397) [(0, 2), (4, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((48477184 : Rat) / 158397) [(1, 1), (4, 1), (9, 1), (12, 1), (14, 1), (15, 2)],
  term ((-24238592 : Rat) / 158397) [(1, 2), (4, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-48477184 : Rat) / 158397) [(4, 1), (5, 1), (9, 1), (12, 1), (14, 1), (15, 2)],
  term ((24238592 : Rat) / 158397) [(4, 1), (5, 2), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-48477184 : Rat) / 158397) [(4, 2), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((24238592 : Rat) / 158397) [(4, 3), (9, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 165 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0165_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0165
        rs_R005_ueqv_R005NYN_generator_29_0100_0199 =
      rs_R005_ueqv_R005NYN_partial_29_0165 := by
  native_decide

/-- Coefficient term 166 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0166 : Poly :=
[
  term ((3682016 : Rat) / 385571) [(4, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 166 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0166 : Poly :=
[
  term ((-7364032 : Rat) / 385571) [(0, 1), (4, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((3682016 : Rat) / 385571) [(0, 2), (4, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7364032 : Rat) / 385571) [(1, 1), (4, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((3682016 : Rat) / 385571) [(1, 2), (4, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((7364032 : Rat) / 385571) [(4, 1), (5, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3682016 : Rat) / 385571) [(4, 1), (5, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((7364032 : Rat) / 385571) [(4, 2), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3682016 : Rat) / 385571) [(4, 3), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 166 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0166_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0166
        rs_R005_ueqv_R005NYN_generator_29_0100_0199 =
      rs_R005_ueqv_R005NYN_partial_29_0166 := by
  native_decide

/-- Coefficient term 167 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0167 : Poly :=
[
  term ((12119296 : Rat) / 158397) [(4, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 167 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0167 : Poly :=
[
  term ((-24238592 : Rat) / 158397) [(0, 1), (4, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((12119296 : Rat) / 158397) [(0, 2), (4, 1), (9, 1), (12, 1), (15, 1)],
  term ((-24238592 : Rat) / 158397) [(1, 1), (4, 1), (9, 1), (12, 1), (15, 2)],
  term ((12119296 : Rat) / 158397) [(1, 2), (4, 1), (9, 1), (12, 1), (15, 1)],
  term ((24238592 : Rat) / 158397) [(4, 1), (5, 1), (9, 1), (12, 1), (15, 2)],
  term ((-12119296 : Rat) / 158397) [(4, 1), (5, 2), (9, 1), (12, 1), (15, 1)],
  term ((24238592 : Rat) / 158397) [(4, 2), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-12119296 : Rat) / 158397) [(4, 3), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 167 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0167_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0167
        rs_R005_ueqv_R005NYN_generator_29_0100_0199 =
      rs_R005_ueqv_R005NYN_partial_29_0167 := by
  native_decide

/-- Coefficient term 168 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0168 : Poly :=
[
  term ((-1841008 : Rat) / 385571) [(4, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 168 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0168 : Poly :=
[
  term ((3682016 : Rat) / 385571) [(0, 1), (4, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1841008 : Rat) / 385571) [(0, 2), (4, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((3682016 : Rat) / 385571) [(1, 1), (4, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1841008 : Rat) / 385571) [(1, 2), (4, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3682016 : Rat) / 385571) [(4, 1), (5, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((1841008 : Rat) / 385571) [(4, 1), (5, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3682016 : Rat) / 385571) [(4, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1841008 : Rat) / 385571) [(4, 3), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 168 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0168_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0168
        rs_R005_ueqv_R005NYN_generator_29_0100_0199 =
      rs_R005_ueqv_R005NYN_partial_29_0168 := by
  native_decide

/-- Coefficient term 169 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0169 : Poly :=
[
  term ((-778240 : Rat) / 52799) [(4, 1), (9, 1), (15, 1)]
]

/-- Partial product 169 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0169 : Poly :=
[
  term ((1556480 : Rat) / 52799) [(0, 1), (4, 1), (9, 1), (14, 1), (15, 1)],
  term ((-778240 : Rat) / 52799) [(0, 2), (4, 1), (9, 1), (15, 1)],
  term ((1556480 : Rat) / 52799) [(1, 1), (4, 1), (9, 1), (15, 2)],
  term ((-778240 : Rat) / 52799) [(1, 2), (4, 1), (9, 1), (15, 1)],
  term ((-1556480 : Rat) / 52799) [(4, 1), (5, 1), (9, 1), (15, 2)],
  term ((778240 : Rat) / 52799) [(4, 1), (5, 2), (9, 1), (15, 1)],
  term ((-1556480 : Rat) / 52799) [(4, 2), (9, 1), (14, 1), (15, 1)],
  term ((778240 : Rat) / 52799) [(4, 3), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 169 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0169_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0169
        rs_R005_ueqv_R005NYN_generator_29_0100_0199 =
      rs_R005_ueqv_R005NYN_partial_29_0169 := by
  native_decide

/-- Coefficient term 170 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0170 : Poly :=
[
  term ((2291520 : Rat) / 385571) [(4, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 170 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0170 : Poly :=
[
  term ((-4583040 : Rat) / 385571) [(0, 1), (4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((2291520 : Rat) / 385571) [(0, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(1, 1), (4, 1), (9, 1), (15, 2), (16, 1)],
  term ((2291520 : Rat) / 385571) [(1, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((4583040 : Rat) / 385571) [(4, 1), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-2291520 : Rat) / 385571) [(4, 1), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((4583040 : Rat) / 385571) [(4, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2291520 : Rat) / 385571) [(4, 3), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 170 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0170_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0170
        rs_R005_ueqv_R005NYN_generator_29_0100_0199 =
      rs_R005_ueqv_R005NYN_partial_29_0170 := by
  native_decide

/-- Coefficient term 171 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0171 : Poly :=
[
  term ((-3112960 : Rat) / 52799) [(4, 1), (11, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 171 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0171 : Poly :=
[
  term ((6225920 : Rat) / 52799) [(0, 1), (4, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-3112960 : Rat) / 52799) [(0, 2), (4, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((6225920 : Rat) / 52799) [(1, 1), (4, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((-3112960 : Rat) / 52799) [(1, 2), (4, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-6225920 : Rat) / 52799) [(4, 1), (5, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((3112960 : Rat) / 52799) [(4, 1), (5, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-6225920 : Rat) / 52799) [(4, 2), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((3112960 : Rat) / 52799) [(4, 3), (11, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 171 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0171_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0171
        rs_R005_ueqv_R005NYN_generator_29_0100_0199 =
      rs_R005_ueqv_R005NYN_partial_29_0171 := by
  native_decide

/-- Coefficient term 172 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0172 : Poly :=
[
  term ((9166080 : Rat) / 385571) [(4, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 172 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0172 : Poly :=
[
  term ((-18332160 : Rat) / 385571) [(0, 1), (4, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((9166080 : Rat) / 385571) [(0, 2), (4, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-18332160 : Rat) / 385571) [(1, 1), (4, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((9166080 : Rat) / 385571) [(1, 2), (4, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((18332160 : Rat) / 385571) [(4, 1), (5, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-9166080 : Rat) / 385571) [(4, 1), (5, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((18332160 : Rat) / 385571) [(4, 2), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-9166080 : Rat) / 385571) [(4, 3), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 172 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0172_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0172
        rs_R005_ueqv_R005NYN_generator_29_0100_0199 =
      rs_R005_ueqv_R005NYN_partial_29_0172 := by
  native_decide

/-- Coefficient term 173 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0173 : Poly :=
[
  term ((1556480 : Rat) / 52799) [(4, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 173 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0173 : Poly :=
[
  term ((-3112960 : Rat) / 52799) [(0, 1), (4, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((1556480 : Rat) / 52799) [(0, 2), (4, 1), (11, 1), (12, 1), (15, 1)],
  term ((-3112960 : Rat) / 52799) [(1, 1), (4, 1), (11, 1), (12, 1), (15, 2)],
  term ((1556480 : Rat) / 52799) [(1, 2), (4, 1), (11, 1), (12, 1), (15, 1)],
  term ((3112960 : Rat) / 52799) [(4, 1), (5, 1), (11, 1), (12, 1), (15, 2)],
  term ((-1556480 : Rat) / 52799) [(4, 1), (5, 2), (11, 1), (12, 1), (15, 1)],
  term ((3112960 : Rat) / 52799) [(4, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1556480 : Rat) / 52799) [(4, 3), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 173 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0173_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0173
        rs_R005_ueqv_R005NYN_generator_29_0100_0199 =
      rs_R005_ueqv_R005NYN_partial_29_0173 := by
  native_decide

/-- Coefficient term 174 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0174 : Poly :=
[
  term ((-4583040 : Rat) / 385571) [(4, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 174 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0174 : Poly :=
[
  term ((9166080 : Rat) / 385571) [(0, 1), (4, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(0, 2), (4, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((9166080 : Rat) / 385571) [(1, 1), (4, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(1, 2), (4, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-9166080 : Rat) / 385571) [(4, 1), (5, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((4583040 : Rat) / 385571) [(4, 1), (5, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-9166080 : Rat) / 385571) [(4, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((4583040 : Rat) / 385571) [(4, 3), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 174 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0174_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0174
        rs_R005_ueqv_R005NYN_generator_29_0100_0199 =
      rs_R005_ueqv_R005NYN_partial_29_0174 := by
  native_decide

/-- Coefficient term 175 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0175 : Poly :=
[
  term ((1556480 : Rat) / 52799) [(4, 1), (12, 1), (14, 1), (15, 2)]
]

/-- Partial product 175 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0175 : Poly :=
[
  term ((-3112960 : Rat) / 52799) [(0, 1), (4, 1), (12, 1), (14, 2), (15, 2)],
  term ((1556480 : Rat) / 52799) [(0, 2), (4, 1), (12, 1), (14, 1), (15, 2)],
  term ((-3112960 : Rat) / 52799) [(1, 1), (4, 1), (12, 1), (14, 1), (15, 3)],
  term ((1556480 : Rat) / 52799) [(1, 2), (4, 1), (12, 1), (14, 1), (15, 2)],
  term ((3112960 : Rat) / 52799) [(4, 1), (5, 1), (12, 1), (14, 1), (15, 3)],
  term ((-1556480 : Rat) / 52799) [(4, 1), (5, 2), (12, 1), (14, 1), (15, 2)],
  term ((3112960 : Rat) / 52799) [(4, 2), (12, 1), (14, 2), (15, 2)],
  term ((-1556480 : Rat) / 52799) [(4, 3), (12, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 175 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0175_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0175
        rs_R005_ueqv_R005NYN_generator_29_0100_0199 =
      rs_R005_ueqv_R005NYN_partial_29_0175 := by
  native_decide

/-- Coefficient term 176 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0176 : Poly :=
[
  term ((-4583040 : Rat) / 385571) [(4, 1), (12, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 176 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0176 : Poly :=
[
  term ((9166080 : Rat) / 385571) [(0, 1), (4, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(0, 2), (4, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((9166080 : Rat) / 385571) [(1, 1), (4, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(1, 2), (4, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-9166080 : Rat) / 385571) [(4, 1), (5, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((4583040 : Rat) / 385571) [(4, 1), (5, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-9166080 : Rat) / 385571) [(4, 2), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((4583040 : Rat) / 385571) [(4, 3), (12, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 176 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0176_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0176
        rs_R005_ueqv_R005NYN_generator_29_0100_0199 =
      rs_R005_ueqv_R005NYN_partial_29_0176 := by
  native_decide

/-- Coefficient term 177 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0177 : Poly :=
[
  term ((-778240 : Rat) / 52799) [(4, 1), (12, 1), (15, 2)]
]

/-- Partial product 177 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0177 : Poly :=
[
  term ((1556480 : Rat) / 52799) [(0, 1), (4, 1), (12, 1), (14, 1), (15, 2)],
  term ((-778240 : Rat) / 52799) [(0, 2), (4, 1), (12, 1), (15, 2)],
  term ((1556480 : Rat) / 52799) [(1, 1), (4, 1), (12, 1), (15, 3)],
  term ((-778240 : Rat) / 52799) [(1, 2), (4, 1), (12, 1), (15, 2)],
  term ((-1556480 : Rat) / 52799) [(4, 1), (5, 1), (12, 1), (15, 3)],
  term ((778240 : Rat) / 52799) [(4, 1), (5, 2), (12, 1), (15, 2)],
  term ((-1556480 : Rat) / 52799) [(4, 2), (12, 1), (14, 1), (15, 2)],
  term ((778240 : Rat) / 52799) [(4, 3), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 177 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0177_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0177
        rs_R005_ueqv_R005NYN_generator_29_0100_0199 =
      rs_R005_ueqv_R005NYN_partial_29_0177 := by
  native_decide

/-- Coefficient term 178 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0178 : Poly :=
[
  term ((2291520 : Rat) / 385571) [(4, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 178 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0178 : Poly :=
[
  term ((-4583040 : Rat) / 385571) [(0, 1), (4, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((2291520 : Rat) / 385571) [(0, 2), (4, 1), (12, 1), (15, 2), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(1, 1), (4, 1), (12, 1), (15, 3), (16, 1)],
  term ((2291520 : Rat) / 385571) [(1, 2), (4, 1), (12, 1), (15, 2), (16, 1)],
  term ((4583040 : Rat) / 385571) [(4, 1), (5, 1), (12, 1), (15, 3), (16, 1)],
  term ((-2291520 : Rat) / 385571) [(4, 1), (5, 2), (12, 1), (15, 2), (16, 1)],
  term ((4583040 : Rat) / 385571) [(4, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2291520 : Rat) / 385571) [(4, 3), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 178 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0178_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0178
        rs_R005_ueqv_R005NYN_generator_29_0100_0199 =
      rs_R005_ueqv_R005NYN_partial_29_0178 := by
  native_decide

/-- Coefficient term 179 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0179 : Poly :=
[
  term ((1743232 : Rat) / 158397) [(4, 1), (15, 2)]
]

/-- Partial product 179 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0179 : Poly :=
[
  term ((-3486464 : Rat) / 158397) [(0, 1), (4, 1), (14, 1), (15, 2)],
  term ((1743232 : Rat) / 158397) [(0, 2), (4, 1), (15, 2)],
  term ((-3486464 : Rat) / 158397) [(1, 1), (4, 1), (15, 3)],
  term ((1743232 : Rat) / 158397) [(1, 2), (4, 1), (15, 2)],
  term ((3486464 : Rat) / 158397) [(4, 1), (5, 1), (15, 3)],
  term ((-1743232 : Rat) / 158397) [(4, 1), (5, 2), (15, 2)],
  term ((3486464 : Rat) / 158397) [(4, 2), (14, 1), (15, 2)],
  term ((-1743232 : Rat) / 158397) [(4, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 179 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0179_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0179
        rs_R005_ueqv_R005NYN_generator_29_0100_0199 =
      rs_R005_ueqv_R005NYN_partial_29_0179 := by
  native_decide

/-- Coefficient term 180 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0180 : Poly :=
[
  term ((-4337032 : Rat) / 385571) [(4, 1), (15, 2), (16, 1)]
]

/-- Partial product 180 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0180 : Poly :=
[
  term ((8674064 : Rat) / 385571) [(0, 1), (4, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4337032 : Rat) / 385571) [(0, 2), (4, 1), (15, 2), (16, 1)],
  term ((8674064 : Rat) / 385571) [(1, 1), (4, 1), (15, 3), (16, 1)],
  term ((-4337032 : Rat) / 385571) [(1, 2), (4, 1), (15, 2), (16, 1)],
  term ((-8674064 : Rat) / 385571) [(4, 1), (5, 1), (15, 3), (16, 1)],
  term ((4337032 : Rat) / 385571) [(4, 1), (5, 2), (15, 2), (16, 1)],
  term ((-8674064 : Rat) / 385571) [(4, 2), (14, 1), (15, 2), (16, 1)],
  term ((4337032 : Rat) / 385571) [(4, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 180 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0180_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0180
        rs_R005_ueqv_R005NYN_generator_29_0100_0199 =
      rs_R005_ueqv_R005NYN_partial_29_0180 := by
  native_decide

/-- Coefficient term 181 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0181 : Poly :=
[
  term ((4718720 : Rat) / 52799) [(5, 1), (6, 1), (8, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 181 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0181 : Poly :=
[
  term ((-9437440 : Rat) / 52799) [(0, 1), (5, 1), (6, 1), (8, 1), (12, 1), (14, 2), (15, 1)],
  term ((4718720 : Rat) / 52799) [(0, 2), (5, 1), (6, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-9437440 : Rat) / 52799) [(1, 1), (5, 1), (6, 1), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((4718720 : Rat) / 52799) [(1, 2), (5, 1), (6, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((9437440 : Rat) / 52799) [(4, 1), (5, 1), (6, 1), (8, 1), (12, 1), (14, 2), (15, 1)],
  term ((-4718720 : Rat) / 52799) [(4, 2), (5, 1), (6, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((9437440 : Rat) / 52799) [(5, 2), (6, 1), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((-4718720 : Rat) / 52799) [(5, 3), (6, 1), (8, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 181 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0181_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0181
        rs_R005_ueqv_R005NYN_generator_29_0100_0199 =
      rs_R005_ueqv_R005NYN_partial_29_0181 := by
  native_decide

/-- Coefficient term 182 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0182 : Poly :=
[
  term ((-65940144 : Rat) / 385571) [(5, 1), (6, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 182 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0182 : Poly :=
[
  term ((131880288 : Rat) / 385571) [(0, 1), (5, 1), (6, 1), (8, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-65940144 : Rat) / 385571) [(0, 2), (5, 1), (6, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((131880288 : Rat) / 385571) [(1, 1), (5, 1), (6, 1), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-65940144 : Rat) / 385571) [(1, 2), (5, 1), (6, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-131880288 : Rat) / 385571) [(4, 1), (5, 1), (6, 1), (8, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((65940144 : Rat) / 385571) [(4, 2), (5, 1), (6, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-131880288 : Rat) / 385571) [(5, 2), (6, 1), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((65940144 : Rat) / 385571) [(5, 3), (6, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 182 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0182_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0182
        rs_R005_ueqv_R005NYN_generator_29_0100_0199 =
      rs_R005_ueqv_R005NYN_partial_29_0182 := by
  native_decide

/-- Coefficient term 183 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0183 : Poly :=
[
  term ((-2359360 : Rat) / 52799) [(5, 1), (6, 1), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 183 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0183 : Poly :=
[
  term ((4718720 : Rat) / 52799) [(0, 1), (5, 1), (6, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-2359360 : Rat) / 52799) [(0, 2), (5, 1), (6, 1), (8, 1), (12, 1), (15, 1)],
  term ((4718720 : Rat) / 52799) [(1, 1), (5, 1), (6, 1), (8, 1), (12, 1), (15, 2)],
  term ((-2359360 : Rat) / 52799) [(1, 2), (5, 1), (6, 1), (8, 1), (12, 1), (15, 1)],
  term ((-4718720 : Rat) / 52799) [(4, 1), (5, 1), (6, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((2359360 : Rat) / 52799) [(4, 2), (5, 1), (6, 1), (8, 1), (12, 1), (15, 1)],
  term ((-4718720 : Rat) / 52799) [(5, 2), (6, 1), (8, 1), (12, 1), (15, 2)],
  term ((2359360 : Rat) / 52799) [(5, 3), (6, 1), (8, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 183 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0183_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0183
        rs_R005_ueqv_R005NYN_generator_29_0100_0199 =
      rs_R005_ueqv_R005NYN_partial_29_0183 := by
  native_decide

/-- Coefficient term 184 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0184 : Poly :=
[
  term ((32970072 : Rat) / 385571) [(5, 1), (6, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 184 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0184 : Poly :=
[
  term ((-65940144 : Rat) / 385571) [(0, 1), (5, 1), (6, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((32970072 : Rat) / 385571) [(0, 2), (5, 1), (6, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-65940144 : Rat) / 385571) [(1, 1), (5, 1), (6, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((32970072 : Rat) / 385571) [(1, 2), (5, 1), (6, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((65940144 : Rat) / 385571) [(4, 1), (5, 1), (6, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-32970072 : Rat) / 385571) [(4, 2), (5, 1), (6, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((65940144 : Rat) / 385571) [(5, 2), (6, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-32970072 : Rat) / 385571) [(5, 3), (6, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 184 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0184_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0184
        rs_R005_ueqv_R005NYN_generator_29_0100_0199 =
      rs_R005_ueqv_R005NYN_partial_29_0184 := by
  native_decide

/-- Coefficient term 185 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0185 : Poly :=
[
  term ((-4718720 : Rat) / 52799) [(5, 1), (6, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 185 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0185 : Poly :=
[
  term ((9437440 : Rat) / 52799) [(0, 1), (5, 1), (6, 1), (12, 1), (14, 2), (15, 1)],
  term ((-4718720 : Rat) / 52799) [(0, 2), (5, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((9437440 : Rat) / 52799) [(1, 1), (5, 1), (6, 1), (12, 1), (14, 1), (15, 2)],
  term ((-4718720 : Rat) / 52799) [(1, 2), (5, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((-9437440 : Rat) / 52799) [(4, 1), (5, 1), (6, 1), (12, 1), (14, 2), (15, 1)],
  term ((4718720 : Rat) / 52799) [(4, 2), (5, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((-9437440 : Rat) / 52799) [(5, 2), (6, 1), (12, 1), (14, 1), (15, 2)],
  term ((4718720 : Rat) / 52799) [(5, 3), (6, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 185 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0185_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0185
        rs_R005_ueqv_R005NYN_generator_29_0100_0199 =
      rs_R005_ueqv_R005NYN_partial_29_0185 := by
  native_decide

/-- Coefficient term 186 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0186 : Poly :=
[
  term ((65940144 : Rat) / 385571) [(5, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 186 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0186 : Poly :=
[
  term ((-131880288 : Rat) / 385571) [(0, 1), (5, 1), (6, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((65940144 : Rat) / 385571) [(0, 2), (5, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-131880288 : Rat) / 385571) [(1, 1), (5, 1), (6, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((65940144 : Rat) / 385571) [(1, 2), (5, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((131880288 : Rat) / 385571) [(4, 1), (5, 1), (6, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-65940144 : Rat) / 385571) [(4, 2), (5, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((131880288 : Rat) / 385571) [(5, 2), (6, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-65940144 : Rat) / 385571) [(5, 3), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 186 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0186_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0186
        rs_R005_ueqv_R005NYN_generator_29_0100_0199 =
      rs_R005_ueqv_R005NYN_partial_29_0186 := by
  native_decide

/-- Coefficient term 187 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0187 : Poly :=
[
  term ((2359360 : Rat) / 52799) [(5, 1), (6, 1), (12, 1), (15, 1)]
]

/-- Partial product 187 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0187 : Poly :=
[
  term ((-4718720 : Rat) / 52799) [(0, 1), (5, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((2359360 : Rat) / 52799) [(0, 2), (5, 1), (6, 1), (12, 1), (15, 1)],
  term ((-4718720 : Rat) / 52799) [(1, 1), (5, 1), (6, 1), (12, 1), (15, 2)],
  term ((2359360 : Rat) / 52799) [(1, 2), (5, 1), (6, 1), (12, 1), (15, 1)],
  term ((4718720 : Rat) / 52799) [(4, 1), (5, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((-2359360 : Rat) / 52799) [(4, 2), (5, 1), (6, 1), (12, 1), (15, 1)],
  term ((4718720 : Rat) / 52799) [(5, 2), (6, 1), (12, 1), (15, 2)],
  term ((-2359360 : Rat) / 52799) [(5, 3), (6, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 187 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0187_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0187
        rs_R005_ueqv_R005NYN_generator_29_0100_0199 =
      rs_R005_ueqv_R005NYN_partial_29_0187 := by
  native_decide

/-- Coefficient term 188 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0188 : Poly :=
[
  term ((-32970072 : Rat) / 385571) [(5, 1), (6, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 188 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0188 : Poly :=
[
  term ((65940144 : Rat) / 385571) [(0, 1), (5, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-32970072 : Rat) / 385571) [(0, 2), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((65940144 : Rat) / 385571) [(1, 1), (5, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-32970072 : Rat) / 385571) [(1, 2), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-65940144 : Rat) / 385571) [(4, 1), (5, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((32970072 : Rat) / 385571) [(4, 2), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-65940144 : Rat) / 385571) [(5, 2), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((32970072 : Rat) / 385571) [(5, 3), (6, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 188 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0188_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0188
        rs_R005_ueqv_R005NYN_generator_29_0100_0199 =
      rs_R005_ueqv_R005NYN_partial_29_0188 := by
  native_decide

/-- Coefficient term 189 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0189 : Poly :=
[
  term ((-33089920 : Rat) / 158397) [(5, 1), (8, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 189 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0189 : Poly :=
[
  term ((66179840 : Rat) / 158397) [(0, 1), (5, 1), (8, 1), (12, 1), (14, 2), (15, 1)],
  term ((-33089920 : Rat) / 158397) [(0, 2), (5, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((66179840 : Rat) / 158397) [(1, 1), (5, 1), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((-33089920 : Rat) / 158397) [(1, 2), (5, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-66179840 : Rat) / 158397) [(4, 1), (5, 1), (8, 1), (12, 1), (14, 2), (15, 1)],
  term ((33089920 : Rat) / 158397) [(4, 2), (5, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-66179840 : Rat) / 158397) [(5, 2), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((33089920 : Rat) / 158397) [(5, 3), (8, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 189 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0189_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0189
        rs_R005_ueqv_R005NYN_generator_29_0100_0199 =
      rs_R005_ueqv_R005NYN_partial_29_0189 := by
  native_decide

/-- Coefficient term 190 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0190 : Poly :=
[
  term ((176160400 : Rat) / 385571) [(5, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 190 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0190 : Poly :=
[
  term ((-352320800 : Rat) / 385571) [(0, 1), (5, 1), (8, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((176160400 : Rat) / 385571) [(0, 2), (5, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-352320800 : Rat) / 385571) [(1, 1), (5, 1), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((176160400 : Rat) / 385571) [(1, 2), (5, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((352320800 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-176160400 : Rat) / 385571) [(4, 2), (5, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((352320800 : Rat) / 385571) [(5, 2), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-176160400 : Rat) / 385571) [(5, 3), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 190 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0190_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0190
        rs_R005_ueqv_R005NYN_generator_29_0100_0199 =
      rs_R005_ueqv_R005NYN_partial_29_0190 := by
  native_decide

/-- Coefficient term 191 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0191 : Poly :=
[
  term ((16544960 : Rat) / 158397) [(5, 1), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 191 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0191 : Poly :=
[
  term ((-33089920 : Rat) / 158397) [(0, 1), (5, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((16544960 : Rat) / 158397) [(0, 2), (5, 1), (8, 1), (12, 1), (15, 1)],
  term ((-33089920 : Rat) / 158397) [(1, 1), (5, 1), (8, 1), (12, 1), (15, 2)],
  term ((16544960 : Rat) / 158397) [(1, 2), (5, 1), (8, 1), (12, 1), (15, 1)],
  term ((33089920 : Rat) / 158397) [(4, 1), (5, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-16544960 : Rat) / 158397) [(4, 2), (5, 1), (8, 1), (12, 1), (15, 1)],
  term ((33089920 : Rat) / 158397) [(5, 2), (8, 1), (12, 1), (15, 2)],
  term ((-16544960 : Rat) / 158397) [(5, 3), (8, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 191 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0191_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0191
        rs_R005_ueqv_R005NYN_generator_29_0100_0199 =
      rs_R005_ueqv_R005NYN_partial_29_0191 := by
  native_decide

/-- Coefficient term 192 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0192 : Poly :=
[
  term ((-88080200 : Rat) / 385571) [(5, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 192 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0192 : Poly :=
[
  term ((176160400 : Rat) / 385571) [(0, 1), (5, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-88080200 : Rat) / 385571) [(0, 2), (5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((176160400 : Rat) / 385571) [(1, 1), (5, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-88080200 : Rat) / 385571) [(1, 2), (5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-176160400 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((88080200 : Rat) / 385571) [(4, 2), (5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-176160400 : Rat) / 385571) [(5, 2), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((88080200 : Rat) / 385571) [(5, 3), (8, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 192 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0192_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0192
        rs_R005_ueqv_R005NYN_generator_29_0100_0199 =
      rs_R005_ueqv_R005NYN_partial_29_0192 := by
  native_decide

/-- Coefficient term 193 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0193 : Poly :=
[
  term ((778240 : Rat) / 52799) [(5, 1), (8, 1), (15, 1)]
]

/-- Partial product 193 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0193 : Poly :=
[
  term ((-1556480 : Rat) / 52799) [(0, 1), (5, 1), (8, 1), (14, 1), (15, 1)],
  term ((778240 : Rat) / 52799) [(0, 2), (5, 1), (8, 1), (15, 1)],
  term ((-1556480 : Rat) / 52799) [(1, 1), (5, 1), (8, 1), (15, 2)],
  term ((778240 : Rat) / 52799) [(1, 2), (5, 1), (8, 1), (15, 1)],
  term ((1556480 : Rat) / 52799) [(4, 1), (5, 1), (8, 1), (14, 1), (15, 1)],
  term ((-778240 : Rat) / 52799) [(4, 2), (5, 1), (8, 1), (15, 1)],
  term ((1556480 : Rat) / 52799) [(5, 2), (8, 1), (15, 2)],
  term ((-778240 : Rat) / 52799) [(5, 3), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 193 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0193_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0193
        rs_R005_ueqv_R005NYN_generator_29_0100_0199 =
      rs_R005_ueqv_R005NYN_partial_29_0193 := by
  native_decide

/-- Coefficient term 194 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0194 : Poly :=
[
  term ((-2291520 : Rat) / 385571) [(5, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 194 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0194 : Poly :=
[
  term ((4583040 : Rat) / 385571) [(0, 1), (5, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2291520 : Rat) / 385571) [(0, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((4583040 : Rat) / 385571) [(1, 1), (5, 1), (8, 1), (15, 2), (16, 1)],
  term ((-2291520 : Rat) / 385571) [(1, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((2291520 : Rat) / 385571) [(4, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(5, 2), (8, 1), (15, 2), (16, 1)],
  term ((2291520 : Rat) / 385571) [(5, 3), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 194 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0194_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0194
        rs_R005_ueqv_R005NYN_generator_29_0100_0199 =
      rs_R005_ueqv_R005NYN_partial_29_0194 := by
  native_decide

/-- Coefficient term 195 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0195 : Poly :=
[
  term ((33089920 : Rat) / 158397) [(5, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 195 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0195 : Poly :=
[
  term ((-66179840 : Rat) / 158397) [(0, 1), (5, 1), (12, 1), (14, 2), (15, 1)],
  term ((33089920 : Rat) / 158397) [(0, 2), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((-66179840 : Rat) / 158397) [(1, 1), (5, 1), (12, 1), (14, 1), (15, 2)],
  term ((33089920 : Rat) / 158397) [(1, 2), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((66179840 : Rat) / 158397) [(4, 1), (5, 1), (12, 1), (14, 2), (15, 1)],
  term ((-33089920 : Rat) / 158397) [(4, 2), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((66179840 : Rat) / 158397) [(5, 2), (12, 1), (14, 1), (15, 2)],
  term ((-33089920 : Rat) / 158397) [(5, 3), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 195 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0195_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0195
        rs_R005_ueqv_R005NYN_generator_29_0100_0199 =
      rs_R005_ueqv_R005NYN_partial_29_0195 := by
  native_decide

/-- Coefficient term 196 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0196 : Poly :=
[
  term ((-176160400 : Rat) / 385571) [(5, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 196 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0196 : Poly :=
[
  term ((352320800 : Rat) / 385571) [(0, 1), (5, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-176160400 : Rat) / 385571) [(0, 2), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((352320800 : Rat) / 385571) [(1, 1), (5, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-176160400 : Rat) / 385571) [(1, 2), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-352320800 : Rat) / 385571) [(4, 1), (5, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((176160400 : Rat) / 385571) [(4, 2), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-352320800 : Rat) / 385571) [(5, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((176160400 : Rat) / 385571) [(5, 3), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 196 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0196_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0196
        rs_R005_ueqv_R005NYN_generator_29_0100_0199 =
      rs_R005_ueqv_R005NYN_partial_29_0196 := by
  native_decide

/-- Coefficient term 197 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0197 : Poly :=
[
  term ((-16544960 : Rat) / 158397) [(5, 1), (12, 1), (15, 1)]
]

/-- Partial product 197 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0197 : Poly :=
[
  term ((33089920 : Rat) / 158397) [(0, 1), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((-16544960 : Rat) / 158397) [(0, 2), (5, 1), (12, 1), (15, 1)],
  term ((33089920 : Rat) / 158397) [(1, 1), (5, 1), (12, 1), (15, 2)],
  term ((-16544960 : Rat) / 158397) [(1, 2), (5, 1), (12, 1), (15, 1)],
  term ((-33089920 : Rat) / 158397) [(4, 1), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((16544960 : Rat) / 158397) [(4, 2), (5, 1), (12, 1), (15, 1)],
  term ((-33089920 : Rat) / 158397) [(5, 2), (12, 1), (15, 2)],
  term ((16544960 : Rat) / 158397) [(5, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 197 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0197_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0197
        rs_R005_ueqv_R005NYN_generator_29_0100_0199 =
      rs_R005_ueqv_R005NYN_partial_29_0197 := by
  native_decide

/-- Coefficient term 198 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0198 : Poly :=
[
  term ((88080200 : Rat) / 385571) [(5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 198 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0198 : Poly :=
[
  term ((-176160400 : Rat) / 385571) [(0, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((88080200 : Rat) / 385571) [(0, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-176160400 : Rat) / 385571) [(1, 1), (5, 1), (12, 1), (15, 2), (16, 1)],
  term ((88080200 : Rat) / 385571) [(1, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((176160400 : Rat) / 385571) [(4, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-88080200 : Rat) / 385571) [(4, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((176160400 : Rat) / 385571) [(5, 2), (12, 1), (15, 2), (16, 1)],
  term ((-88080200 : Rat) / 385571) [(5, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 198 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0198_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0198
        rs_R005_ueqv_R005NYN_generator_29_0100_0199 =
      rs_R005_ueqv_R005NYN_partial_29_0198 := by
  native_decide

/-- Coefficient term 199 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0199 : Poly :=
[
  term ((5980160 : Rat) / 52799) [(5, 1), (14, 1), (15, 1)]
]

/-- Partial product 199 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0199 : Poly :=
[
  term ((-11960320 : Rat) / 52799) [(0, 1), (5, 1), (14, 2), (15, 1)],
  term ((5980160 : Rat) / 52799) [(0, 2), (5, 1), (14, 1), (15, 1)],
  term ((-11960320 : Rat) / 52799) [(1, 1), (5, 1), (14, 1), (15, 2)],
  term ((5980160 : Rat) / 52799) [(1, 2), (5, 1), (14, 1), (15, 1)],
  term ((11960320 : Rat) / 52799) [(4, 1), (5, 1), (14, 2), (15, 1)],
  term ((-5980160 : Rat) / 52799) [(4, 2), (5, 1), (14, 1), (15, 1)],
  term ((11960320 : Rat) / 52799) [(5, 2), (14, 1), (15, 2)],
  term ((-5980160 : Rat) / 52799) [(5, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 199 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0199_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0199
        rs_R005_ueqv_R005NYN_generator_29_0100_0199 =
      rs_R005_ueqv_R005NYN_partial_29_0199 := by
  native_decide

/-- Partial products in this block. -/
def rs_R005_ueqv_R005NYN_partials_29_0100_0199 : List Poly :=
[
  rs_R005_ueqv_R005NYN_partial_29_0100,
  rs_R005_ueqv_R005NYN_partial_29_0101,
  rs_R005_ueqv_R005NYN_partial_29_0102,
  rs_R005_ueqv_R005NYN_partial_29_0103,
  rs_R005_ueqv_R005NYN_partial_29_0104,
  rs_R005_ueqv_R005NYN_partial_29_0105,
  rs_R005_ueqv_R005NYN_partial_29_0106,
  rs_R005_ueqv_R005NYN_partial_29_0107,
  rs_R005_ueqv_R005NYN_partial_29_0108,
  rs_R005_ueqv_R005NYN_partial_29_0109,
  rs_R005_ueqv_R005NYN_partial_29_0110,
  rs_R005_ueqv_R005NYN_partial_29_0111,
  rs_R005_ueqv_R005NYN_partial_29_0112,
  rs_R005_ueqv_R005NYN_partial_29_0113,
  rs_R005_ueqv_R005NYN_partial_29_0114,
  rs_R005_ueqv_R005NYN_partial_29_0115,
  rs_R005_ueqv_R005NYN_partial_29_0116,
  rs_R005_ueqv_R005NYN_partial_29_0117,
  rs_R005_ueqv_R005NYN_partial_29_0118,
  rs_R005_ueqv_R005NYN_partial_29_0119,
  rs_R005_ueqv_R005NYN_partial_29_0120,
  rs_R005_ueqv_R005NYN_partial_29_0121,
  rs_R005_ueqv_R005NYN_partial_29_0122,
  rs_R005_ueqv_R005NYN_partial_29_0123,
  rs_R005_ueqv_R005NYN_partial_29_0124,
  rs_R005_ueqv_R005NYN_partial_29_0125,
  rs_R005_ueqv_R005NYN_partial_29_0126,
  rs_R005_ueqv_R005NYN_partial_29_0127,
  rs_R005_ueqv_R005NYN_partial_29_0128,
  rs_R005_ueqv_R005NYN_partial_29_0129,
  rs_R005_ueqv_R005NYN_partial_29_0130,
  rs_R005_ueqv_R005NYN_partial_29_0131,
  rs_R005_ueqv_R005NYN_partial_29_0132,
  rs_R005_ueqv_R005NYN_partial_29_0133,
  rs_R005_ueqv_R005NYN_partial_29_0134,
  rs_R005_ueqv_R005NYN_partial_29_0135,
  rs_R005_ueqv_R005NYN_partial_29_0136,
  rs_R005_ueqv_R005NYN_partial_29_0137,
  rs_R005_ueqv_R005NYN_partial_29_0138,
  rs_R005_ueqv_R005NYN_partial_29_0139,
  rs_R005_ueqv_R005NYN_partial_29_0140,
  rs_R005_ueqv_R005NYN_partial_29_0141,
  rs_R005_ueqv_R005NYN_partial_29_0142,
  rs_R005_ueqv_R005NYN_partial_29_0143,
  rs_R005_ueqv_R005NYN_partial_29_0144,
  rs_R005_ueqv_R005NYN_partial_29_0145,
  rs_R005_ueqv_R005NYN_partial_29_0146,
  rs_R005_ueqv_R005NYN_partial_29_0147,
  rs_R005_ueqv_R005NYN_partial_29_0148,
  rs_R005_ueqv_R005NYN_partial_29_0149,
  rs_R005_ueqv_R005NYN_partial_29_0150,
  rs_R005_ueqv_R005NYN_partial_29_0151,
  rs_R005_ueqv_R005NYN_partial_29_0152,
  rs_R005_ueqv_R005NYN_partial_29_0153,
  rs_R005_ueqv_R005NYN_partial_29_0154,
  rs_R005_ueqv_R005NYN_partial_29_0155,
  rs_R005_ueqv_R005NYN_partial_29_0156,
  rs_R005_ueqv_R005NYN_partial_29_0157,
  rs_R005_ueqv_R005NYN_partial_29_0158,
  rs_R005_ueqv_R005NYN_partial_29_0159,
  rs_R005_ueqv_R005NYN_partial_29_0160,
  rs_R005_ueqv_R005NYN_partial_29_0161,
  rs_R005_ueqv_R005NYN_partial_29_0162,
  rs_R005_ueqv_R005NYN_partial_29_0163,
  rs_R005_ueqv_R005NYN_partial_29_0164,
  rs_R005_ueqv_R005NYN_partial_29_0165,
  rs_R005_ueqv_R005NYN_partial_29_0166,
  rs_R005_ueqv_R005NYN_partial_29_0167,
  rs_R005_ueqv_R005NYN_partial_29_0168,
  rs_R005_ueqv_R005NYN_partial_29_0169,
  rs_R005_ueqv_R005NYN_partial_29_0170,
  rs_R005_ueqv_R005NYN_partial_29_0171,
  rs_R005_ueqv_R005NYN_partial_29_0172,
  rs_R005_ueqv_R005NYN_partial_29_0173,
  rs_R005_ueqv_R005NYN_partial_29_0174,
  rs_R005_ueqv_R005NYN_partial_29_0175,
  rs_R005_ueqv_R005NYN_partial_29_0176,
  rs_R005_ueqv_R005NYN_partial_29_0177,
  rs_R005_ueqv_R005NYN_partial_29_0178,
  rs_R005_ueqv_R005NYN_partial_29_0179,
  rs_R005_ueqv_R005NYN_partial_29_0180,
  rs_R005_ueqv_R005NYN_partial_29_0181,
  rs_R005_ueqv_R005NYN_partial_29_0182,
  rs_R005_ueqv_R005NYN_partial_29_0183,
  rs_R005_ueqv_R005NYN_partial_29_0184,
  rs_R005_ueqv_R005NYN_partial_29_0185,
  rs_R005_ueqv_R005NYN_partial_29_0186,
  rs_R005_ueqv_R005NYN_partial_29_0187,
  rs_R005_ueqv_R005NYN_partial_29_0188,
  rs_R005_ueqv_R005NYN_partial_29_0189,
  rs_R005_ueqv_R005NYN_partial_29_0190,
  rs_R005_ueqv_R005NYN_partial_29_0191,
  rs_R005_ueqv_R005NYN_partial_29_0192,
  rs_R005_ueqv_R005NYN_partial_29_0193,
  rs_R005_ueqv_R005NYN_partial_29_0194,
  rs_R005_ueqv_R005NYN_partial_29_0195,
  rs_R005_ueqv_R005NYN_partial_29_0196,
  rs_R005_ueqv_R005NYN_partial_29_0197,
  rs_R005_ueqv_R005NYN_partial_29_0198,
  rs_R005_ueqv_R005NYN_partial_29_0199
]

/-- Sum of partial products in this block. -/
def rs_R005_ueqv_R005NYN_block_29_0100_0199 : Poly :=
[
  term ((-65940144 : Rat) / 385571) [(0, 1), (1, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((47908480 : Rat) / 158397) [(0, 1), (1, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-215464720 : Rat) / 385571) [(0, 1), (1, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-95816960 : Rat) / 158397) [(0, 1), (1, 1), (8, 1), (12, 1), (14, 2), (15, 1)],
  term ((430929440 : Rat) / 385571) [(0, 1), (1, 1), (8, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((2129920 : Rat) / 158397) [(0, 1), (1, 1), (8, 1), (14, 1), (15, 1)],
  term ((4312064 : Rat) / 385571) [(0, 1), (1, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-47908480 : Rat) / 158397) [(0, 1), (1, 1), (12, 1), (14, 1), (15, 1)],
  term ((215464720 : Rat) / 385571) [(0, 1), (1, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((95816960 : Rat) / 158397) [(0, 1), (1, 1), (12, 1), (14, 2), (15, 1)],
  term ((-430929440 : Rat) / 385571) [(0, 1), (1, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((17124680 : Rat) / 158397) [(0, 1), (1, 1), (14, 1), (15, 1)],
  term ((-19217636 : Rat) / 385571) [(0, 1), (1, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5126208 : Rat) / 52799) [(0, 1), (1, 1), (14, 2), (15, 1)],
  term ((47786376 : Rat) / 385571) [(0, 1), (1, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3381616 : Rat) / 52799) [(0, 1), (1, 2), (14, 1)],
  term ((-3112960 : Rat) / 52799) [(0, 1), (3, 1), (4, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((9166080 : Rat) / 385571) [(0, 1), (3, 1), (4, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((6225920 : Rat) / 52799) [(0, 1), (3, 1), (4, 1), (8, 1), (12, 1), (14, 2), (15, 1)],
  term ((-18332160 : Rat) / 385571) [(0, 1), (3, 1), (4, 1), (8, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((3112960 : Rat) / 52799) [(0, 1), (3, 1), (4, 1), (12, 1), (14, 1), (15, 1)],
  term ((-9166080 : Rat) / 385571) [(0, 1), (3, 1), (4, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6225920 : Rat) / 52799) [(0, 1), (3, 1), (4, 1), (12, 1), (14, 2), (15, 1)],
  term ((18332160 : Rat) / 385571) [(0, 1), (3, 1), (4, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((6348800 : Rat) / 158397) [(0, 1), (3, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-22237760 : Rat) / 385571) [(0, 1), (3, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12697600 : Rat) / 158397) [(0, 1), (3, 1), (8, 1), (12, 1), (14, 2), (15, 1)],
  term ((44475520 : Rat) / 385571) [(0, 1), (3, 1), (8, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-6348800 : Rat) / 158397) [(0, 1), (3, 1), (12, 1), (14, 1), (15, 1)],
  term ((22237760 : Rat) / 385571) [(0, 1), (3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((12697600 : Rat) / 158397) [(0, 1), (3, 1), (12, 1), (14, 2), (15, 1)],
  term ((-44475520 : Rat) / 385571) [(0, 1), (3, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2028352 : Rat) / 158397) [(0, 1), (3, 1), (14, 1), (15, 1)],
  term ((-19380264 : Rat) / 385571) [(0, 1), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3112960 : Rat) / 52799) [(0, 1), (3, 1), (14, 2), (15, 1)],
  term ((9166080 : Rat) / 385571) [(0, 1), (3, 1), (14, 2), (15, 1), (16, 1)],
  term ((-11960320 : Rat) / 52799) [(0, 1), (4, 1), (5, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((25613184 : Rat) / 385571) [(0, 1), (4, 1), (5, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((23920640 : Rat) / 52799) [(0, 1), (4, 1), (5, 1), (8, 1), (12, 1), (14, 2), (15, 1)],
  term ((-51226368 : Rat) / 385571) [(0, 1), (4, 1), (5, 1), (8, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((11960320 : Rat) / 52799) [(0, 1), (4, 1), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((-25613184 : Rat) / 385571) [(0, 1), (4, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-23920640 : Rat) / 52799) [(0, 1), (4, 1), (5, 1), (12, 1), (14, 2), (15, 1)],
  term ((51226368 : Rat) / 385571) [(0, 1), (4, 1), (5, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((11574400 : Rat) / 158397) [(0, 1), (4, 1), (7, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-124680784 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-23148800 : Rat) / 158397) [(0, 1), (4, 1), (7, 1), (8, 1), (12, 1), (14, 2), (15, 1)],
  term ((249361568 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (8, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-11574400 : Rat) / 158397) [(0, 1), (4, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((124680784 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((23148800 : Rat) / 158397) [(0, 1), (4, 1), (7, 1), (12, 1), (14, 2), (15, 1)],
  term ((-249361568 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((24238592 : Rat) / 158397) [(0, 1), (4, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-3682016 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-48477184 : Rat) / 158397) [(0, 1), (4, 1), (8, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((7364032 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((3112960 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-9166080 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6225920 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((18332160 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((4583040 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((3112960 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (12, 1), (14, 2), (15, 2)],
  term ((-9166080 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-24238592 : Rat) / 158397) [(0, 1), (4, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((3682016 : Rat) / 385571) [(0, 1), (4, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((48477184 : Rat) / 158397) [(0, 1), (4, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((-7364032 : Rat) / 385571) [(0, 1), (4, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((1556480 : Rat) / 52799) [(0, 1), (4, 1), (9, 1), (14, 1), (15, 1)],
  term ((-4583040 : Rat) / 385571) [(0, 1), (4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3112960 : Rat) / 52799) [(0, 1), (4, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((9166080 : Rat) / 385571) [(0, 1), (4, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((6225920 : Rat) / 52799) [(0, 1), (4, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-18332160 : Rat) / 385571) [(0, 1), (4, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((1556480 : Rat) / 52799) [(0, 1), (4, 1), (12, 1), (14, 1), (15, 2)],
  term ((-4583040 : Rat) / 385571) [(0, 1), (4, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3112960 : Rat) / 52799) [(0, 1), (4, 1), (12, 1), (14, 2), (15, 2)],
  term ((9166080 : Rat) / 385571) [(0, 1), (4, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((845404 : Rat) / 158397) [(0, 1), (4, 1), (14, 1)],
  term ((-3486464 : Rat) / 158397) [(0, 1), (4, 1), (14, 1), (15, 2)],
  term ((8674064 : Rat) / 385571) [(0, 1), (4, 1), (14, 1), (15, 2), (16, 1)],
  term ((4718720 : Rat) / 52799) [(0, 1), (5, 1), (6, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-65940144 : Rat) / 385571) [(0, 1), (5, 1), (6, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9437440 : Rat) / 52799) [(0, 1), (5, 1), (6, 1), (8, 1), (12, 1), (14, 2), (15, 1)],
  term ((131880288 : Rat) / 385571) [(0, 1), (5, 1), (6, 1), (8, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-4718720 : Rat) / 52799) [(0, 1), (5, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((65940144 : Rat) / 385571) [(0, 1), (5, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((9437440 : Rat) / 52799) [(0, 1), (5, 1), (6, 1), (12, 1), (14, 2), (15, 1)],
  term ((-131880288 : Rat) / 385571) [(0, 1), (5, 1), (6, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-33089920 : Rat) / 158397) [(0, 1), (5, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((176160400 : Rat) / 385571) [(0, 1), (5, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((66179840 : Rat) / 158397) [(0, 1), (5, 1), (8, 1), (12, 1), (14, 2), (15, 1)],
  term ((-352320800 : Rat) / 385571) [(0, 1), (5, 1), (8, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(0, 1), (5, 1), (8, 1), (14, 1), (15, 1)],
  term ((4583040 : Rat) / 385571) [(0, 1), (5, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((33089920 : Rat) / 158397) [(0, 1), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((-176160400 : Rat) / 385571) [(0, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-66179840 : Rat) / 158397) [(0, 1), (5, 1), (12, 1), (14, 2), (15, 1)],
  term ((352320800 : Rat) / 385571) [(0, 1), (5, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-11960320 : Rat) / 52799) [(0, 1), (5, 1), (14, 2), (15, 1)],
  term ((32970072 : Rat) / 385571) [(0, 2), (1, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((47908480 : Rat) / 158397) [(0, 2), (1, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-215464720 : Rat) / 385571) [(0, 2), (1, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-23954240 : Rat) / 158397) [(0, 2), (1, 1), (8, 1), (12, 1), (15, 1)],
  term ((107732360 : Rat) / 385571) [(0, 2), (1, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1064960 : Rat) / 158397) [(0, 2), (1, 1), (8, 1), (15, 1)],
  term ((-2156032 : Rat) / 385571) [(0, 2), (1, 1), (8, 1), (15, 1), (16, 1)],
  term ((-47908480 : Rat) / 158397) [(0, 2), (1, 1), (12, 1), (14, 1), (15, 1)],
  term ((215464720 : Rat) / 385571) [(0, 2), (1, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((23954240 : Rat) / 158397) [(0, 2), (1, 1), (12, 1), (15, 1)],
  term ((-107732360 : Rat) / 385571) [(0, 2), (1, 1), (12, 1), (15, 1), (16, 1)],
  term ((2563104 : Rat) / 52799) [(0, 2), (1, 1), (14, 1), (15, 1)],
  term ((-23893188 : Rat) / 385571) [(0, 2), (1, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8562340 : Rat) / 158397) [(0, 2), (1, 1), (15, 1)],
  term ((9608818 : Rat) / 385571) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term ((1690808 : Rat) / 52799) [(0, 2), (1, 2)],
  term ((-3112960 : Rat) / 52799) [(0, 2), (3, 1), (4, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((9166080 : Rat) / 385571) [(0, 2), (3, 1), (4, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1556480 : Rat) / 52799) [(0, 2), (3, 1), (4, 1), (8, 1), (12, 1), (15, 1)],
  term ((-4583040 : Rat) / 385571) [(0, 2), (3, 1), (4, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((3112960 : Rat) / 52799) [(0, 2), (3, 1), (4, 1), (12, 1), (14, 1), (15, 1)],
  term ((-9166080 : Rat) / 385571) [(0, 2), (3, 1), (4, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(0, 2), (3, 1), (4, 1), (12, 1), (15, 1)],
  term ((4583040 : Rat) / 385571) [(0, 2), (3, 1), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((6348800 : Rat) / 158397) [(0, 2), (3, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-22237760 : Rat) / 385571) [(0, 2), (3, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3174400 : Rat) / 158397) [(0, 2), (3, 1), (8, 1), (12, 1), (15, 1)],
  term ((11118880 : Rat) / 385571) [(0, 2), (3, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-6348800 : Rat) / 158397) [(0, 2), (3, 1), (12, 1), (14, 1), (15, 1)],
  term ((22237760 : Rat) / 385571) [(0, 2), (3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((3174400 : Rat) / 158397) [(0, 2), (3, 1), (12, 1), (15, 1)],
  term ((-11118880 : Rat) / 385571) [(0, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((1556480 : Rat) / 52799) [(0, 2), (3, 1), (14, 1), (15, 1)],
  term ((-4583040 : Rat) / 385571) [(0, 2), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((1014176 : Rat) / 158397) [(0, 2), (3, 1), (15, 1)],
  term ((9690132 : Rat) / 385571) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((-422702 : Rat) / 158397) [(0, 2), (4, 1)],
  term ((-11960320 : Rat) / 52799) [(0, 2), (4, 1), (5, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((25613184 : Rat) / 385571) [(0, 2), (4, 1), (5, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((5980160 : Rat) / 52799) [(0, 2), (4, 1), (5, 1), (8, 1), (12, 1), (15, 1)],
  term ((-12806592 : Rat) / 385571) [(0, 2), (4, 1), (5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((11960320 : Rat) / 52799) [(0, 2), (4, 1), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((-25613184 : Rat) / 385571) [(0, 2), (4, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5980160 : Rat) / 52799) [(0, 2), (4, 1), (5, 1), (12, 1), (15, 1)],
  term ((12806592 : Rat) / 385571) [(0, 2), (4, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((11574400 : Rat) / 158397) [(0, 2), (4, 1), (7, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-124680784 : Rat) / 385571) [(0, 2), (4, 1), (7, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5787200 : Rat) / 158397) [(0, 2), (4, 1), (7, 1), (8, 1), (12, 1), (15, 1)],
  term ((62340392 : Rat) / 385571) [(0, 2), (4, 1), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-11574400 : Rat) / 158397) [(0, 2), (4, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((124680784 : Rat) / 385571) [(0, 2), (4, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((5787200 : Rat) / 158397) [(0, 2), (4, 1), (7, 1), (12, 1), (15, 1)],
  term ((-62340392 : Rat) / 385571) [(0, 2), (4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((24238592 : Rat) / 158397) [(0, 2), (4, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-3682016 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12119296 : Rat) / 158397) [(0, 2), (4, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((1841008 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((3112960 : Rat) / 52799) [(0, 2), (4, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-9166080 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(0, 2), (4, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((4583040 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(0, 2), (4, 1), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((4583040 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((778240 : Rat) / 52799) [(0, 2), (4, 1), (8, 1), (12, 1), (15, 2)],
  term ((-2291520 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-24238592 : Rat) / 158397) [(0, 2), (4, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((3682016 : Rat) / 385571) [(0, 2), (4, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((12119296 : Rat) / 158397) [(0, 2), (4, 1), (9, 1), (12, 1), (15, 1)],
  term ((-1841008 : Rat) / 385571) [(0, 2), (4, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-778240 : Rat) / 52799) [(0, 2), (4, 1), (9, 1), (15, 1)],
  term ((2291520 : Rat) / 385571) [(0, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-3112960 : Rat) / 52799) [(0, 2), (4, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((9166080 : Rat) / 385571) [(0, 2), (4, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1556480 : Rat) / 52799) [(0, 2), (4, 1), (11, 1), (12, 1), (15, 1)],
  term ((-4583040 : Rat) / 385571) [(0, 2), (4, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1556480 : Rat) / 52799) [(0, 2), (4, 1), (12, 1), (14, 1), (15, 2)],
  term ((-4583040 : Rat) / 385571) [(0, 2), (4, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-778240 : Rat) / 52799) [(0, 2), (4, 1), (12, 1), (15, 2)],
  term ((2291520 : Rat) / 385571) [(0, 2), (4, 1), (12, 1), (15, 2), (16, 1)],
  term ((1743232 : Rat) / 158397) [(0, 2), (4, 1), (15, 2)],
  term ((-4337032 : Rat) / 385571) [(0, 2), (4, 1), (15, 2), (16, 1)],
  term ((4718720 : Rat) / 52799) [(0, 2), (5, 1), (6, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-65940144 : Rat) / 385571) [(0, 2), (5, 1), (6, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2359360 : Rat) / 52799) [(0, 2), (5, 1), (6, 1), (8, 1), (12, 1), (15, 1)],
  term ((32970072 : Rat) / 385571) [(0, 2), (5, 1), (6, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4718720 : Rat) / 52799) [(0, 2), (5, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((65940144 : Rat) / 385571) [(0, 2), (5, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((2359360 : Rat) / 52799) [(0, 2), (5, 1), (6, 1), (12, 1), (15, 1)],
  term ((-32970072 : Rat) / 385571) [(0, 2), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-33089920 : Rat) / 158397) [(0, 2), (5, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((176160400 : Rat) / 385571) [(0, 2), (5, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((16544960 : Rat) / 158397) [(0, 2), (5, 1), (8, 1), (12, 1), (15, 1)],
  term ((-88080200 : Rat) / 385571) [(0, 2), (5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((778240 : Rat) / 52799) [(0, 2), (5, 1), (8, 1), (15, 1)],
  term ((-2291520 : Rat) / 385571) [(0, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((33089920 : Rat) / 158397) [(0, 2), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((-176160400 : Rat) / 385571) [(0, 2), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-16544960 : Rat) / 158397) [(0, 2), (5, 1), (12, 1), (15, 1)],
  term ((88080200 : Rat) / 385571) [(0, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((5980160 : Rat) / 52799) [(0, 2), (5, 1), (14, 1), (15, 1)],
  term ((6225920 : Rat) / 52799) [(1, 1), (3, 1), (4, 1), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((-18332160 : Rat) / 385571) [(1, 1), (3, 1), (4, 1), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3112960 : Rat) / 52799) [(1, 1), (3, 1), (4, 1), (8, 1), (12, 1), (15, 2)],
  term ((9166080 : Rat) / 385571) [(1, 1), (3, 1), (4, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-6225920 : Rat) / 52799) [(1, 1), (3, 1), (4, 1), (12, 1), (14, 1), (15, 2)],
  term ((18332160 : Rat) / 385571) [(1, 1), (3, 1), (4, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((3112960 : Rat) / 52799) [(1, 1), (3, 1), (4, 1), (12, 1), (15, 2)],
  term ((-9166080 : Rat) / 385571) [(1, 1), (3, 1), (4, 1), (12, 1), (15, 2), (16, 1)],
  term ((-12697600 : Rat) / 158397) [(1, 1), (3, 1), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((44475520 : Rat) / 385571) [(1, 1), (3, 1), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((6348800 : Rat) / 158397) [(1, 1), (3, 1), (8, 1), (12, 1), (15, 2)],
  term ((-22237760 : Rat) / 385571) [(1, 1), (3, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((12697600 : Rat) / 158397) [(1, 1), (3, 1), (12, 1), (14, 1), (15, 2)],
  term ((-44475520 : Rat) / 385571) [(1, 1), (3, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-6348800 : Rat) / 158397) [(1, 1), (3, 1), (12, 1), (15, 2)],
  term ((22237760 : Rat) / 385571) [(1, 1), (3, 1), (12, 1), (15, 2), (16, 1)],
  term ((-3112960 : Rat) / 52799) [(1, 1), (3, 1), (14, 1), (15, 2)],
  term ((9166080 : Rat) / 385571) [(1, 1), (3, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2028352 : Rat) / 158397) [(1, 1), (3, 1), (15, 2)],
  term ((-19380264 : Rat) / 385571) [(1, 1), (3, 1), (15, 2), (16, 1)],
  term ((23920640 : Rat) / 52799) [(1, 1), (4, 1), (5, 1), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((-51226368 : Rat) / 385571) [(1, 1), (4, 1), (5, 1), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-11960320 : Rat) / 52799) [(1, 1), (4, 1), (5, 1), (8, 1), (12, 1), (15, 2)],
  term ((25613184 : Rat) / 385571) [(1, 1), (4, 1), (5, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-23920640 : Rat) / 52799) [(1, 1), (4, 1), (5, 1), (12, 1), (14, 1), (15, 2)],
  term ((51226368 : Rat) / 385571) [(1, 1), (4, 1), (5, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((11960320 : Rat) / 52799) [(1, 1), (4, 1), (5, 1), (12, 1), (15, 2)],
  term ((-25613184 : Rat) / 385571) [(1, 1), (4, 1), (5, 1), (12, 1), (15, 2), (16, 1)],
  term ((65940144 : Rat) / 385571) [(1, 1), (4, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-23148800 : Rat) / 158397) [(1, 1), (4, 1), (7, 1), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((249361568 : Rat) / 385571) [(1, 1), (4, 1), (7, 1), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((11574400 : Rat) / 158397) [(1, 1), (4, 1), (7, 1), (8, 1), (12, 1), (15, 2)],
  term ((-124680784 : Rat) / 385571) [(1, 1), (4, 1), (7, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((23148800 : Rat) / 158397) [(1, 1), (4, 1), (7, 1), (12, 1), (14, 1), (15, 2)],
  term ((-249361568 : Rat) / 385571) [(1, 1), (4, 1), (7, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-11574400 : Rat) / 158397) [(1, 1), (4, 1), (7, 1), (12, 1), (15, 2)],
  term ((124680784 : Rat) / 385571) [(1, 1), (4, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((-48477184 : Rat) / 158397) [(1, 1), (4, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 2)],
  term ((7364032 : Rat) / 385571) [(1, 1), (4, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((24238592 : Rat) / 158397) [(1, 1), (4, 1), (8, 1), (9, 1), (12, 1), (15, 2)],
  term ((-3682016 : Rat) / 385571) [(1, 1), (4, 1), (8, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-6225920 : Rat) / 52799) [(1, 1), (4, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((18332160 : Rat) / 385571) [(1, 1), (4, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((3112960 : Rat) / 52799) [(1, 1), (4, 1), (8, 1), (11, 1), (12, 1), (15, 2)],
  term ((-9166080 : Rat) / 385571) [(1, 1), (4, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-47908480 : Rat) / 158397) [(1, 1), (4, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((215464720 : Rat) / 385571) [(1, 1), (4, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((3112960 : Rat) / 52799) [(1, 1), (4, 1), (8, 1), (12, 1), (14, 1), (15, 3)],
  term ((-9166080 : Rat) / 385571) [(1, 1), (4, 1), (8, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((95816960 : Rat) / 158397) [(1, 1), (4, 1), (8, 1), (12, 1), (14, 2), (15, 1)],
  term ((-430929440 : Rat) / 385571) [(1, 1), (4, 1), (8, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(1, 1), (4, 1), (8, 1), (12, 1), (15, 3)],
  term ((4583040 : Rat) / 385571) [(1, 1), (4, 1), (8, 1), (12, 1), (15, 3), (16, 1)],
  term ((-2129920 : Rat) / 158397) [(1, 1), (4, 1), (8, 1), (14, 1), (15, 1)],
  term ((-4312064 : Rat) / 385571) [(1, 1), (4, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((48477184 : Rat) / 158397) [(1, 1), (4, 1), (9, 1), (12, 1), (14, 1), (15, 2)],
  term ((-7364032 : Rat) / 385571) [(1, 1), (4, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-24238592 : Rat) / 158397) [(1, 1), (4, 1), (9, 1), (12, 1), (15, 2)],
  term ((3682016 : Rat) / 385571) [(1, 1), (4, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((1556480 : Rat) / 52799) [(1, 1), (4, 1), (9, 1), (15, 2)],
  term ((-4583040 : Rat) / 385571) [(1, 1), (4, 1), (9, 1), (15, 2), (16, 1)],
  term ((6225920 : Rat) / 52799) [(1, 1), (4, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((-18332160 : Rat) / 385571) [(1, 1), (4, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3112960 : Rat) / 52799) [(1, 1), (4, 1), (11, 1), (12, 1), (15, 2)],
  term ((9166080 : Rat) / 385571) [(1, 1), (4, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((47908480 : Rat) / 158397) [(1, 1), (4, 1), (12, 1), (14, 1), (15, 1)],
  term ((-215464720 : Rat) / 385571) [(1, 1), (4, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3112960 : Rat) / 52799) [(1, 1), (4, 1), (12, 1), (14, 1), (15, 3)],
  term ((9166080 : Rat) / 385571) [(1, 1), (4, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-95816960 : Rat) / 158397) [(1, 1), (4, 1), (12, 1), (14, 2), (15, 1)],
  term ((430929440 : Rat) / 385571) [(1, 1), (4, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((1556480 : Rat) / 52799) [(1, 1), (4, 1), (12, 1), (15, 3)],
  term ((-4583040 : Rat) / 385571) [(1, 1), (4, 1), (12, 1), (15, 3), (16, 1)],
  term ((-17124680 : Rat) / 158397) [(1, 1), (4, 1), (14, 1), (15, 1)],
  term ((19217636 : Rat) / 385571) [(1, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((5126208 : Rat) / 52799) [(1, 1), (4, 1), (14, 2), (15, 1)],
  term ((-47786376 : Rat) / 385571) [(1, 1), (4, 1), (14, 2), (15, 1), (16, 1)],
  term ((845404 : Rat) / 158397) [(1, 1), (4, 1), (15, 1)],
  term ((-3486464 : Rat) / 158397) [(1, 1), (4, 1), (15, 3)],
  term ((8674064 : Rat) / 385571) [(1, 1), (4, 1), (15, 3), (16, 1)],
  term ((-32970072 : Rat) / 385571) [(1, 1), (4, 2), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-47908480 : Rat) / 158397) [(1, 1), (4, 2), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((215464720 : Rat) / 385571) [(1, 1), (4, 2), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((23954240 : Rat) / 158397) [(1, 1), (4, 2), (8, 1), (12, 1), (15, 1)],
  term ((-107732360 : Rat) / 385571) [(1, 1), (4, 2), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((1064960 : Rat) / 158397) [(1, 1), (4, 2), (8, 1), (15, 1)],
  term ((2156032 : Rat) / 385571) [(1, 1), (4, 2), (8, 1), (15, 1), (16, 1)],
  term ((47908480 : Rat) / 158397) [(1, 1), (4, 2), (12, 1), (14, 1), (15, 1)],
  term ((-215464720 : Rat) / 385571) [(1, 1), (4, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-23954240 : Rat) / 158397) [(1, 1), (4, 2), (12, 1), (15, 1)],
  term ((107732360 : Rat) / 385571) [(1, 1), (4, 2), (12, 1), (15, 1), (16, 1)],
  term ((-2563104 : Rat) / 52799) [(1, 1), (4, 2), (14, 1), (15, 1)],
  term ((23893188 : Rat) / 385571) [(1, 1), (4, 2), (14, 1), (15, 1), (16, 1)],
  term ((8562340 : Rat) / 158397) [(1, 1), (4, 2), (15, 1)],
  term ((-9608818 : Rat) / 385571) [(1, 1), (4, 2), (15, 1), (16, 1)],
  term ((-9437440 : Rat) / 52799) [(1, 1), (5, 1), (6, 1), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((131880288 : Rat) / 385571) [(1, 1), (5, 1), (6, 1), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((4718720 : Rat) / 52799) [(1, 1), (5, 1), (6, 1), (8, 1), (12, 1), (15, 2)],
  term ((-65940144 : Rat) / 385571) [(1, 1), (5, 1), (6, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((9437440 : Rat) / 52799) [(1, 1), (5, 1), (6, 1), (12, 1), (14, 1), (15, 2)],
  term ((-131880288 : Rat) / 385571) [(1, 1), (5, 1), (6, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4718720 : Rat) / 52799) [(1, 1), (5, 1), (6, 1), (12, 1), (15, 2)],
  term ((131880288 : Rat) / 385571) [(1, 1), (5, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((161996800 : Rat) / 158397) [(1, 1), (5, 1), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((-783250240 : Rat) / 385571) [(1, 1), (5, 1), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-80998400 : Rat) / 158397) [(1, 1), (5, 1), (8, 1), (12, 1), (15, 2)],
  term ((391625120 : Rat) / 385571) [(1, 1), (5, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-6799360 : Rat) / 158397) [(1, 1), (5, 1), (8, 1), (15, 2)],
  term ((270976 : Rat) / 385571) [(1, 1), (5, 1), (8, 1), (15, 2), (16, 1)],
  term ((-161996800 : Rat) / 158397) [(1, 1), (5, 1), (12, 1), (14, 1), (15, 2)],
  term ((783250240 : Rat) / 385571) [(1, 1), (5, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((80998400 : Rat) / 158397) [(1, 1), (5, 1), (12, 1), (15, 2)],
  term ((-391625120 : Rat) / 385571) [(1, 1), (5, 1), (12, 1), (15, 2), (16, 1)],
  term ((-6834112 : Rat) / 52799) [(1, 1), (5, 1), (14, 1), (15, 2)],
  term ((-47786376 : Rat) / 385571) [(1, 1), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((-17124680 : Rat) / 158397) [(1, 1), (5, 1), (15, 2)],
  term ((19217636 : Rat) / 385571) [(1, 1), (5, 1), (15, 2), (16, 1)],
  term ((-32970072 : Rat) / 385571) [(1, 1), (5, 2), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-47908480 : Rat) / 158397) [(1, 1), (5, 2), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((215464720 : Rat) / 385571) [(1, 1), (5, 2), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((23954240 : Rat) / 158397) [(1, 1), (5, 2), (8, 1), (12, 1), (15, 1)],
  term ((-107732360 : Rat) / 385571) [(1, 1), (5, 2), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((1064960 : Rat) / 158397) [(1, 1), (5, 2), (8, 1), (15, 1)],
  term ((2156032 : Rat) / 385571) [(1, 1), (5, 2), (8, 1), (15, 1), (16, 1)],
  term ((47908480 : Rat) / 158397) [(1, 1), (5, 2), (12, 1), (14, 1), (15, 1)],
  term ((-215464720 : Rat) / 385571) [(1, 1), (5, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-23954240 : Rat) / 158397) [(1, 1), (5, 2), (12, 1), (15, 1)],
  term ((107732360 : Rat) / 385571) [(1, 1), (5, 2), (12, 1), (15, 1), (16, 1)],
  term ((-2563104 : Rat) / 52799) [(1, 1), (5, 2), (14, 1), (15, 1)],
  term ((23893188 : Rat) / 385571) [(1, 1), (5, 2), (14, 1), (15, 1), (16, 1)],
  term ((8562340 : Rat) / 158397) [(1, 1), (5, 2), (15, 1)],
  term ((-9608818 : Rat) / 385571) [(1, 1), (5, 2), (15, 1), (16, 1)],
  term ((-3112960 : Rat) / 52799) [(1, 2), (3, 1), (4, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((9166080 : Rat) / 385571) [(1, 2), (3, 1), (4, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1556480 : Rat) / 52799) [(1, 2), (3, 1), (4, 1), (8, 1), (12, 1), (15, 1)],
  term ((-4583040 : Rat) / 385571) [(1, 2), (3, 1), (4, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((3112960 : Rat) / 52799) [(1, 2), (3, 1), (4, 1), (12, 1), (14, 1), (15, 1)],
  term ((-9166080 : Rat) / 385571) [(1, 2), (3, 1), (4, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(1, 2), (3, 1), (4, 1), (12, 1), (15, 1)],
  term ((4583040 : Rat) / 385571) [(1, 2), (3, 1), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((6348800 : Rat) / 158397) [(1, 2), (3, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-22237760 : Rat) / 385571) [(1, 2), (3, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3174400 : Rat) / 158397) [(1, 2), (3, 1), (8, 1), (12, 1), (15, 1)],
  term ((11118880 : Rat) / 385571) [(1, 2), (3, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-6348800 : Rat) / 158397) [(1, 2), (3, 1), (12, 1), (14, 1), (15, 1)],
  term ((22237760 : Rat) / 385571) [(1, 2), (3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((3174400 : Rat) / 158397) [(1, 2), (3, 1), (12, 1), (15, 1)],
  term ((-11118880 : Rat) / 385571) [(1, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((1556480 : Rat) / 52799) [(1, 2), (3, 1), (14, 1), (15, 1)],
  term ((-4583040 : Rat) / 385571) [(1, 2), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((1014176 : Rat) / 158397) [(1, 2), (3, 1), (15, 1)],
  term ((9690132 : Rat) / 385571) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((-422702 : Rat) / 158397) [(1, 2), (4, 1)],
  term ((-11960320 : Rat) / 52799) [(1, 2), (4, 1), (5, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((25613184 : Rat) / 385571) [(1, 2), (4, 1), (5, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((5980160 : Rat) / 52799) [(1, 2), (4, 1), (5, 1), (8, 1), (12, 1), (15, 1)],
  term ((-12806592 : Rat) / 385571) [(1, 2), (4, 1), (5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((11960320 : Rat) / 52799) [(1, 2), (4, 1), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((-25613184 : Rat) / 385571) [(1, 2), (4, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5980160 : Rat) / 52799) [(1, 2), (4, 1), (5, 1), (12, 1), (15, 1)],
  term ((12806592 : Rat) / 385571) [(1, 2), (4, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((11574400 : Rat) / 158397) [(1, 2), (4, 1), (7, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-124680784 : Rat) / 385571) [(1, 2), (4, 1), (7, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5787200 : Rat) / 158397) [(1, 2), (4, 1), (7, 1), (8, 1), (12, 1), (15, 1)],
  term ((62340392 : Rat) / 385571) [(1, 2), (4, 1), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-11574400 : Rat) / 158397) [(1, 2), (4, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((124680784 : Rat) / 385571) [(1, 2), (4, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((5787200 : Rat) / 158397) [(1, 2), (4, 1), (7, 1), (12, 1), (15, 1)],
  term ((-62340392 : Rat) / 385571) [(1, 2), (4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((24238592 : Rat) / 158397) [(1, 2), (4, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-3682016 : Rat) / 385571) [(1, 2), (4, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12119296 : Rat) / 158397) [(1, 2), (4, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((1841008 : Rat) / 385571) [(1, 2), (4, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((3112960 : Rat) / 52799) [(1, 2), (4, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-9166080 : Rat) / 385571) [(1, 2), (4, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(1, 2), (4, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((4583040 : Rat) / 385571) [(1, 2), (4, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(1, 2), (4, 1), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((4583040 : Rat) / 385571) [(1, 2), (4, 1), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((778240 : Rat) / 52799) [(1, 2), (4, 1), (8, 1), (12, 1), (15, 2)],
  term ((-2291520 : Rat) / 385571) [(1, 2), (4, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-24238592 : Rat) / 158397) [(1, 2), (4, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((3682016 : Rat) / 385571) [(1, 2), (4, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((12119296 : Rat) / 158397) [(1, 2), (4, 1), (9, 1), (12, 1), (15, 1)],
  term ((-1841008 : Rat) / 385571) [(1, 2), (4, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-778240 : Rat) / 52799) [(1, 2), (4, 1), (9, 1), (15, 1)],
  term ((2291520 : Rat) / 385571) [(1, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-3112960 : Rat) / 52799) [(1, 2), (4, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((9166080 : Rat) / 385571) [(1, 2), (4, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1556480 : Rat) / 52799) [(1, 2), (4, 1), (11, 1), (12, 1), (15, 1)],
  term ((-4583040 : Rat) / 385571) [(1, 2), (4, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1556480 : Rat) / 52799) [(1, 2), (4, 1), (12, 1), (14, 1), (15, 2)],
  term ((-4583040 : Rat) / 385571) [(1, 2), (4, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-778240 : Rat) / 52799) [(1, 2), (4, 1), (12, 1), (15, 2)],
  term ((2291520 : Rat) / 385571) [(1, 2), (4, 1), (12, 1), (15, 2), (16, 1)],
  term ((3381616 : Rat) / 52799) [(1, 2), (4, 1), (14, 1)],
  term ((1743232 : Rat) / 158397) [(1, 2), (4, 1), (15, 2)],
  term ((-4337032 : Rat) / 385571) [(1, 2), (4, 1), (15, 2), (16, 1)],
  term ((-1690808 : Rat) / 52799) [(1, 2), (4, 2)],
  term ((4718720 : Rat) / 52799) [(1, 2), (5, 1), (6, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-65940144 : Rat) / 385571) [(1, 2), (5, 1), (6, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2359360 : Rat) / 52799) [(1, 2), (5, 1), (6, 1), (8, 1), (12, 1), (15, 1)],
  term ((32970072 : Rat) / 385571) [(1, 2), (5, 1), (6, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4718720 : Rat) / 52799) [(1, 2), (5, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((65940144 : Rat) / 385571) [(1, 2), (5, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((2359360 : Rat) / 52799) [(1, 2), (5, 1), (6, 1), (12, 1), (15, 1)],
  term ((-32970072 : Rat) / 385571) [(1, 2), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-33089920 : Rat) / 158397) [(1, 2), (5, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((176160400 : Rat) / 385571) [(1, 2), (5, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((16544960 : Rat) / 158397) [(1, 2), (5, 1), (8, 1), (12, 1), (15, 1)],
  term ((-88080200 : Rat) / 385571) [(1, 2), (5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((778240 : Rat) / 52799) [(1, 2), (5, 1), (8, 1), (15, 1)],
  term ((-2291520 : Rat) / 385571) [(1, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((33089920 : Rat) / 158397) [(1, 2), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((-176160400 : Rat) / 385571) [(1, 2), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-16544960 : Rat) / 158397) [(1, 2), (5, 1), (12, 1), (15, 1)],
  term ((88080200 : Rat) / 385571) [(1, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((5980160 : Rat) / 52799) [(1, 2), (5, 1), (14, 1), (15, 1)],
  term ((3381616 : Rat) / 52799) [(1, 2), (5, 1), (15, 1)],
  term ((-1690808 : Rat) / 52799) [(1, 2), (5, 2)],
  term ((-65940144 : Rat) / 385571) [(1, 2), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-95816960 : Rat) / 158397) [(1, 2), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((430929440 : Rat) / 385571) [(1, 2), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((47908480 : Rat) / 158397) [(1, 2), (8, 1), (12, 1), (15, 2)],
  term ((-215464720 : Rat) / 385571) [(1, 2), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((2129920 : Rat) / 158397) [(1, 2), (8, 1), (15, 2)],
  term ((4312064 : Rat) / 385571) [(1, 2), (8, 1), (15, 2), (16, 1)],
  term ((95816960 : Rat) / 158397) [(1, 2), (12, 1), (14, 1), (15, 2)],
  term ((-430929440 : Rat) / 385571) [(1, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-47908480 : Rat) / 158397) [(1, 2), (12, 1), (15, 2)],
  term ((215464720 : Rat) / 385571) [(1, 2), (12, 1), (15, 2), (16, 1)],
  term ((-5126208 : Rat) / 52799) [(1, 2), (14, 1), (15, 2)],
  term ((47786376 : Rat) / 385571) [(1, 2), (14, 1), (15, 2), (16, 1)],
  term ((17124680 : Rat) / 158397) [(1, 2), (15, 2)],
  term ((-19217636 : Rat) / 385571) [(1, 2), (15, 2), (16, 1)],
  term ((32970072 : Rat) / 385571) [(1, 3), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((47908480 : Rat) / 158397) [(1, 3), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-215464720 : Rat) / 385571) [(1, 3), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-23954240 : Rat) / 158397) [(1, 3), (8, 1), (12, 1), (15, 1)],
  term ((107732360 : Rat) / 385571) [(1, 3), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1064960 : Rat) / 158397) [(1, 3), (8, 1), (15, 1)],
  term ((-2156032 : Rat) / 385571) [(1, 3), (8, 1), (15, 1), (16, 1)],
  term ((-47908480 : Rat) / 158397) [(1, 3), (12, 1), (14, 1), (15, 1)],
  term ((215464720 : Rat) / 385571) [(1, 3), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((23954240 : Rat) / 158397) [(1, 3), (12, 1), (15, 1)],
  term ((-107732360 : Rat) / 385571) [(1, 3), (12, 1), (15, 1), (16, 1)],
  term ((2563104 : Rat) / 52799) [(1, 3), (14, 1), (15, 1)],
  term ((-23893188 : Rat) / 385571) [(1, 3), (14, 1), (15, 1), (16, 1)],
  term ((-18707188 : Rat) / 158397) [(1, 3), (15, 1)],
  term ((9608818 : Rat) / 385571) [(1, 3), (15, 1), (16, 1)],
  term ((1690808 : Rat) / 52799) [(1, 4)],
  term ((-6225920 : Rat) / 52799) [(3, 1), (4, 1), (5, 1), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((18332160 : Rat) / 385571) [(3, 1), (4, 1), (5, 1), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((3112960 : Rat) / 52799) [(3, 1), (4, 1), (5, 1), (8, 1), (12, 1), (15, 2)],
  term ((-9166080 : Rat) / 385571) [(3, 1), (4, 1), (5, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((6225920 : Rat) / 52799) [(3, 1), (4, 1), (5, 1), (12, 1), (14, 1), (15, 2)],
  term ((-18332160 : Rat) / 385571) [(3, 1), (4, 1), (5, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3112960 : Rat) / 52799) [(3, 1), (4, 1), (5, 1), (12, 1), (15, 2)],
  term ((9166080 : Rat) / 385571) [(3, 1), (4, 1), (5, 1), (12, 1), (15, 2), (16, 1)],
  term ((3112960 : Rat) / 52799) [(3, 1), (4, 1), (5, 2), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-9166080 : Rat) / 385571) [(3, 1), (4, 1), (5, 2), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(3, 1), (4, 1), (5, 2), (8, 1), (12, 1), (15, 1)],
  term ((4583040 : Rat) / 385571) [(3, 1), (4, 1), (5, 2), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3112960 : Rat) / 52799) [(3, 1), (4, 1), (5, 2), (12, 1), (14, 1), (15, 1)],
  term ((9166080 : Rat) / 385571) [(3, 1), (4, 1), (5, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1556480 : Rat) / 52799) [(3, 1), (4, 1), (5, 2), (12, 1), (15, 1)],
  term ((-4583040 : Rat) / 385571) [(3, 1), (4, 1), (5, 2), (12, 1), (15, 1), (16, 1)],
  term ((-6348800 : Rat) / 158397) [(3, 1), (4, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((22237760 : Rat) / 385571) [(3, 1), (4, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((12697600 : Rat) / 158397) [(3, 1), (4, 1), (8, 1), (12, 1), (14, 2), (15, 1)],
  term ((-44475520 : Rat) / 385571) [(3, 1), (4, 1), (8, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((6348800 : Rat) / 158397) [(3, 1), (4, 1), (12, 1), (14, 1), (15, 1)],
  term ((-22237760 : Rat) / 385571) [(3, 1), (4, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12697600 : Rat) / 158397) [(3, 1), (4, 1), (12, 1), (14, 2), (15, 1)],
  term ((44475520 : Rat) / 385571) [(3, 1), (4, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((2028352 : Rat) / 158397) [(3, 1), (4, 1), (14, 1), (15, 1)],
  term ((19380264 : Rat) / 385571) [(3, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((3112960 : Rat) / 52799) [(3, 1), (4, 1), (14, 2), (15, 1)],
  term ((-9166080 : Rat) / 385571) [(3, 1), (4, 1), (14, 2), (15, 1), (16, 1)],
  term ((2990080 : Rat) / 158397) [(3, 1), (4, 2), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((13071680 : Rat) / 385571) [(3, 1), (4, 2), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6225920 : Rat) / 52799) [(3, 1), (4, 2), (8, 1), (12, 1), (14, 2), (15, 1)],
  term ((18332160 : Rat) / 385571) [(3, 1), (4, 2), (8, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((3174400 : Rat) / 158397) [(3, 1), (4, 2), (8, 1), (12, 1), (15, 1)],
  term ((-11118880 : Rat) / 385571) [(3, 1), (4, 2), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2990080 : Rat) / 158397) [(3, 1), (4, 2), (12, 1), (14, 1), (15, 1)],
  term ((-13071680 : Rat) / 385571) [(3, 1), (4, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((6225920 : Rat) / 52799) [(3, 1), (4, 2), (12, 1), (14, 2), (15, 1)],
  term ((-18332160 : Rat) / 385571) [(3, 1), (4, 2), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3174400 : Rat) / 158397) [(3, 1), (4, 2), (12, 1), (15, 1)],
  term ((11118880 : Rat) / 385571) [(3, 1), (4, 2), (12, 1), (15, 1), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(3, 1), (4, 2), (14, 1), (15, 1)],
  term ((4583040 : Rat) / 385571) [(3, 1), (4, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1014176 : Rat) / 158397) [(3, 1), (4, 2), (15, 1)],
  term ((-9690132 : Rat) / 385571) [(3, 1), (4, 2), (15, 1), (16, 1)],
  term ((3112960 : Rat) / 52799) [(3, 1), (4, 3), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-9166080 : Rat) / 385571) [(3, 1), (4, 3), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(3, 1), (4, 3), (8, 1), (12, 1), (15, 1)],
  term ((4583040 : Rat) / 385571) [(3, 1), (4, 3), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3112960 : Rat) / 52799) [(3, 1), (4, 3), (12, 1), (14, 1), (15, 1)],
  term ((9166080 : Rat) / 385571) [(3, 1), (4, 3), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1556480 : Rat) / 52799) [(3, 1), (4, 3), (12, 1), (15, 1)],
  term ((-4583040 : Rat) / 385571) [(3, 1), (4, 3), (12, 1), (15, 1), (16, 1)],
  term ((12697600 : Rat) / 158397) [(3, 1), (5, 1), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((-44475520 : Rat) / 385571) [(3, 1), (5, 1), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-6348800 : Rat) / 158397) [(3, 1), (5, 1), (8, 1), (12, 1), (15, 2)],
  term ((22237760 : Rat) / 385571) [(3, 1), (5, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-12697600 : Rat) / 158397) [(3, 1), (5, 1), (12, 1), (14, 1), (15, 2)],
  term ((44475520 : Rat) / 385571) [(3, 1), (5, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((6348800 : Rat) / 158397) [(3, 1), (5, 1), (12, 1), (15, 2)],
  term ((-22237760 : Rat) / 385571) [(3, 1), (5, 1), (12, 1), (15, 2), (16, 1)],
  term ((3112960 : Rat) / 52799) [(3, 1), (5, 1), (14, 1), (15, 2)],
  term ((-9166080 : Rat) / 385571) [(3, 1), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((2028352 : Rat) / 158397) [(3, 1), (5, 1), (15, 2)],
  term ((19380264 : Rat) / 385571) [(3, 1), (5, 1), (15, 2), (16, 1)],
  term ((-6348800 : Rat) / 158397) [(3, 1), (5, 2), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((22237760 : Rat) / 385571) [(3, 1), (5, 2), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((3174400 : Rat) / 158397) [(3, 1), (5, 2), (8, 1), (12, 1), (15, 1)],
  term ((-11118880 : Rat) / 385571) [(3, 1), (5, 2), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((6348800 : Rat) / 158397) [(3, 1), (5, 2), (12, 1), (14, 1), (15, 1)],
  term ((-22237760 : Rat) / 385571) [(3, 1), (5, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3174400 : Rat) / 158397) [(3, 1), (5, 2), (12, 1), (15, 1)],
  term ((11118880 : Rat) / 385571) [(3, 1), (5, 2), (12, 1), (15, 1), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(3, 1), (5, 2), (14, 1), (15, 1)],
  term ((4583040 : Rat) / 385571) [(3, 1), (5, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1014176 : Rat) / 158397) [(3, 1), (5, 2), (15, 1)],
  term ((-9690132 : Rat) / 385571) [(3, 1), (5, 2), (15, 1), (16, 1)],
  term ((-4718720 : Rat) / 52799) [(4, 1), (5, 1), (6, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((65940144 : Rat) / 385571) [(4, 1), (5, 1), (6, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((9437440 : Rat) / 52799) [(4, 1), (5, 1), (6, 1), (8, 1), (12, 1), (14, 2), (15, 1)],
  term ((-131880288 : Rat) / 385571) [(4, 1), (5, 1), (6, 1), (8, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((4718720 : Rat) / 52799) [(4, 1), (5, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((-65940144 : Rat) / 385571) [(4, 1), (5, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9437440 : Rat) / 52799) [(4, 1), (5, 1), (6, 1), (12, 1), (14, 2), (15, 1)],
  term ((131880288 : Rat) / 385571) [(4, 1), (5, 1), (6, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((23148800 : Rat) / 158397) [(4, 1), (5, 1), (7, 1), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((-249361568 : Rat) / 385571) [(4, 1), (5, 1), (7, 1), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-11574400 : Rat) / 158397) [(4, 1), (5, 1), (7, 1), (8, 1), (12, 1), (15, 2)],
  term ((124680784 : Rat) / 385571) [(4, 1), (5, 1), (7, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-23148800 : Rat) / 158397) [(4, 1), (5, 1), (7, 1), (12, 1), (14, 1), (15, 2)],
  term ((249361568 : Rat) / 385571) [(4, 1), (5, 1), (7, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((11574400 : Rat) / 158397) [(4, 1), (5, 1), (7, 1), (12, 1), (15, 2)],
  term ((-124680784 : Rat) / 385571) [(4, 1), (5, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((48477184 : Rat) / 158397) [(4, 1), (5, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 2)],
  term ((-7364032 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-24238592 : Rat) / 158397) [(4, 1), (5, 1), (8, 1), (9, 1), (12, 1), (15, 2)],
  term ((3682016 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((6225920 : Rat) / 52799) [(4, 1), (5, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((-18332160 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3112960 : Rat) / 52799) [(4, 1), (5, 1), (8, 1), (11, 1), (12, 1), (15, 2)],
  term ((9166080 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((33089920 : Rat) / 158397) [(4, 1), (5, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-176160400 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3112960 : Rat) / 52799) [(4, 1), (5, 1), (8, 1), (12, 1), (14, 1), (15, 3)],
  term ((9166080 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-66179840 : Rat) / 158397) [(4, 1), (5, 1), (8, 1), (12, 1), (14, 2), (15, 1)],
  term ((352320800 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((1556480 : Rat) / 52799) [(4, 1), (5, 1), (8, 1), (12, 1), (15, 3)],
  term ((-4583040 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (12, 1), (15, 3), (16, 1)],
  term ((1556480 : Rat) / 52799) [(4, 1), (5, 1), (8, 1), (14, 1), (15, 1)],
  term ((-4583040 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-48477184 : Rat) / 158397) [(4, 1), (5, 1), (9, 1), (12, 1), (14, 1), (15, 2)],
  term ((7364032 : Rat) / 385571) [(4, 1), (5, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((24238592 : Rat) / 158397) [(4, 1), (5, 1), (9, 1), (12, 1), (15, 2)],
  term ((-3682016 : Rat) / 385571) [(4, 1), (5, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(4, 1), (5, 1), (9, 1), (15, 2)],
  term ((4583040 : Rat) / 385571) [(4, 1), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-6225920 : Rat) / 52799) [(4, 1), (5, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((18332160 : Rat) / 385571) [(4, 1), (5, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((3112960 : Rat) / 52799) [(4, 1), (5, 1), (11, 1), (12, 1), (15, 2)],
  term ((-9166080 : Rat) / 385571) [(4, 1), (5, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-33089920 : Rat) / 158397) [(4, 1), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((176160400 : Rat) / 385571) [(4, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((3112960 : Rat) / 52799) [(4, 1), (5, 1), (12, 1), (14, 1), (15, 3)],
  term ((-9166080 : Rat) / 385571) [(4, 1), (5, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((66179840 : Rat) / 158397) [(4, 1), (5, 1), (12, 1), (14, 2), (15, 1)],
  term ((-352320800 : Rat) / 385571) [(4, 1), (5, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(4, 1), (5, 1), (12, 1), (15, 3)],
  term ((4583040 : Rat) / 385571) [(4, 1), (5, 1), (12, 1), (15, 3), (16, 1)],
  term ((11960320 : Rat) / 52799) [(4, 1), (5, 1), (14, 2), (15, 1)],
  term ((-845404 : Rat) / 158397) [(4, 1), (5, 1), (15, 1)],
  term ((3486464 : Rat) / 158397) [(4, 1), (5, 1), (15, 3)],
  term ((-8674064 : Rat) / 385571) [(4, 1), (5, 1), (15, 3), (16, 1)],
  term ((422702 : Rat) / 158397) [(4, 1), (5, 2)],
  term ((-11574400 : Rat) / 158397) [(4, 1), (5, 2), (7, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((124680784 : Rat) / 385571) [(4, 1), (5, 2), (7, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((5787200 : Rat) / 158397) [(4, 1), (5, 2), (7, 1), (8, 1), (12, 1), (15, 1)],
  term ((-62340392 : Rat) / 385571) [(4, 1), (5, 2), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((11574400 : Rat) / 158397) [(4, 1), (5, 2), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-124680784 : Rat) / 385571) [(4, 1), (5, 2), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5787200 : Rat) / 158397) [(4, 1), (5, 2), (7, 1), (12, 1), (15, 1)],
  term ((62340392 : Rat) / 385571) [(4, 1), (5, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-24238592 : Rat) / 158397) [(4, 1), (5, 2), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((3682016 : Rat) / 385571) [(4, 1), (5, 2), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((12119296 : Rat) / 158397) [(4, 1), (5, 2), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-1841008 : Rat) / 385571) [(4, 1), (5, 2), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3112960 : Rat) / 52799) [(4, 1), (5, 2), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((9166080 : Rat) / 385571) [(4, 1), (5, 2), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1556480 : Rat) / 52799) [(4, 1), (5, 2), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-4583040 : Rat) / 385571) [(4, 1), (5, 2), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-22364160 : Rat) / 52799) [(4, 1), (5, 2), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((46643328 : Rat) / 385571) [(4, 1), (5, 2), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((11182080 : Rat) / 52799) [(4, 1), (5, 2), (8, 1), (12, 1), (15, 2)],
  term ((-23321664 : Rat) / 385571) [(4, 1), (5, 2), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((24238592 : Rat) / 158397) [(4, 1), (5, 2), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-3682016 : Rat) / 385571) [(4, 1), (5, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12119296 : Rat) / 158397) [(4, 1), (5, 2), (9, 1), (12, 1), (15, 1)],
  term ((1841008 : Rat) / 385571) [(4, 1), (5, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((778240 : Rat) / 52799) [(4, 1), (5, 2), (9, 1), (15, 1)],
  term ((-2291520 : Rat) / 385571) [(4, 1), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((3112960 : Rat) / 52799) [(4, 1), (5, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-9166080 : Rat) / 385571) [(4, 1), (5, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(4, 1), (5, 2), (11, 1), (12, 1), (15, 1)],
  term ((4583040 : Rat) / 385571) [(4, 1), (5, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((22364160 : Rat) / 52799) [(4, 1), (5, 2), (12, 1), (14, 1), (15, 2)],
  term ((-46643328 : Rat) / 385571) [(4, 1), (5, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-11182080 : Rat) / 52799) [(4, 1), (5, 2), (12, 1), (15, 2)],
  term ((23321664 : Rat) / 385571) [(4, 1), (5, 2), (12, 1), (15, 2), (16, 1)],
  term ((-1743232 : Rat) / 158397) [(4, 1), (5, 2), (15, 2)],
  term ((4337032 : Rat) / 385571) [(4, 1), (5, 2), (15, 2), (16, 1)],
  term ((11960320 : Rat) / 52799) [(4, 1), (5, 3), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-25613184 : Rat) / 385571) [(4, 1), (5, 3), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5980160 : Rat) / 52799) [(4, 1), (5, 3), (8, 1), (12, 1), (15, 1)],
  term ((12806592 : Rat) / 385571) [(4, 1), (5, 3), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-11960320 : Rat) / 52799) [(4, 1), (5, 3), (12, 1), (14, 1), (15, 1)],
  term ((25613184 : Rat) / 385571) [(4, 1), (5, 3), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((5980160 : Rat) / 52799) [(4, 1), (5, 3), (12, 1), (15, 1)],
  term ((-12806592 : Rat) / 385571) [(4, 1), (5, 3), (12, 1), (15, 1), (16, 1)],
  term ((-4718720 : Rat) / 52799) [(4, 2), (5, 1), (6, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((65940144 : Rat) / 385571) [(4, 2), (5, 1), (6, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((2359360 : Rat) / 52799) [(4, 2), (5, 1), (6, 1), (8, 1), (12, 1), (15, 1)],
  term ((-32970072 : Rat) / 385571) [(4, 2), (5, 1), (6, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((4718720 : Rat) / 52799) [(4, 2), (5, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((-65940144 : Rat) / 385571) [(4, 2), (5, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2359360 : Rat) / 52799) [(4, 2), (5, 1), (6, 1), (12, 1), (15, 1)],
  term ((32970072 : Rat) / 385571) [(4, 2), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((68970880 : Rat) / 158397) [(4, 2), (5, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-201773584 : Rat) / 385571) [(4, 2), (5, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-23920640 : Rat) / 52799) [(4, 2), (5, 1), (8, 1), (12, 1), (14, 2), (15, 1)],
  term ((51226368 : Rat) / 385571) [(4, 2), (5, 1), (8, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-16544960 : Rat) / 158397) [(4, 2), (5, 1), (8, 1), (12, 1), (15, 1)],
  term ((88080200 : Rat) / 385571) [(4, 2), (5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-778240 : Rat) / 52799) [(4, 2), (5, 1), (8, 1), (15, 1)],
  term ((2291520 : Rat) / 385571) [(4, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-68970880 : Rat) / 158397) [(4, 2), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((201773584 : Rat) / 385571) [(4, 2), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((23920640 : Rat) / 52799) [(4, 2), (5, 1), (12, 1), (14, 2), (15, 1)],
  term ((-51226368 : Rat) / 385571) [(4, 2), (5, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((16544960 : Rat) / 158397) [(4, 2), (5, 1), (12, 1), (15, 1)],
  term ((-88080200 : Rat) / 385571) [(4, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-5980160 : Rat) / 52799) [(4, 2), (5, 1), (14, 1), (15, 1)],
  term ((-11574400 : Rat) / 158397) [(4, 2), (7, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((124680784 : Rat) / 385571) [(4, 2), (7, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((23148800 : Rat) / 158397) [(4, 2), (7, 1), (8, 1), (12, 1), (14, 2), (15, 1)],
  term ((-249361568 : Rat) / 385571) [(4, 2), (7, 1), (8, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((11574400 : Rat) / 158397) [(4, 2), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-124680784 : Rat) / 385571) [(4, 2), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-23148800 : Rat) / 158397) [(4, 2), (7, 1), (12, 1), (14, 2), (15, 1)],
  term ((249361568 : Rat) / 385571) [(4, 2), (7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-24238592 : Rat) / 158397) [(4, 2), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((3682016 : Rat) / 385571) [(4, 2), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((48477184 : Rat) / 158397) [(4, 2), (8, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((-7364032 : Rat) / 385571) [(4, 2), (8, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3112960 : Rat) / 52799) [(4, 2), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((9166080 : Rat) / 385571) [(4, 2), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((6225920 : Rat) / 52799) [(4, 2), (8, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-18332160 : Rat) / 385571) [(4, 2), (8, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((1556480 : Rat) / 52799) [(4, 2), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((-4583040 : Rat) / 385571) [(4, 2), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3112960 : Rat) / 52799) [(4, 2), (8, 1), (12, 1), (14, 2), (15, 2)],
  term ((9166080 : Rat) / 385571) [(4, 2), (8, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((24238592 : Rat) / 158397) [(4, 2), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-3682016 : Rat) / 385571) [(4, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-48477184 : Rat) / 158397) [(4, 2), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((7364032 : Rat) / 385571) [(4, 2), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(4, 2), (9, 1), (14, 1), (15, 1)],
  term ((4583040 : Rat) / 385571) [(4, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((3112960 : Rat) / 52799) [(4, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-9166080 : Rat) / 385571) [(4, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6225920 : Rat) / 52799) [(4, 2), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((18332160 : Rat) / 385571) [(4, 2), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(4, 2), (12, 1), (14, 1), (15, 2)],
  term ((4583040 : Rat) / 385571) [(4, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((3112960 : Rat) / 52799) [(4, 2), (12, 1), (14, 2), (15, 2)],
  term ((-9166080 : Rat) / 385571) [(4, 2), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-845404 : Rat) / 158397) [(4, 2), (14, 1)],
  term ((3486464 : Rat) / 158397) [(4, 2), (14, 1), (15, 2)],
  term ((-8674064 : Rat) / 385571) [(4, 2), (14, 1), (15, 2), (16, 1)],
  term ((422702 : Rat) / 158397) [(4, 3)],
  term ((11960320 : Rat) / 52799) [(4, 3), (5, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-25613184 : Rat) / 385571) [(4, 3), (5, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5980160 : Rat) / 52799) [(4, 3), (5, 1), (8, 1), (12, 1), (15, 1)],
  term ((12806592 : Rat) / 385571) [(4, 3), (5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-11960320 : Rat) / 52799) [(4, 3), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((25613184 : Rat) / 385571) [(4, 3), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((5980160 : Rat) / 52799) [(4, 3), (5, 1), (12, 1), (15, 1)],
  term ((-12806592 : Rat) / 385571) [(4, 3), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-11574400 : Rat) / 158397) [(4, 3), (7, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((124680784 : Rat) / 385571) [(4, 3), (7, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((5787200 : Rat) / 158397) [(4, 3), (7, 1), (8, 1), (12, 1), (15, 1)],
  term ((-62340392 : Rat) / 385571) [(4, 3), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((11574400 : Rat) / 158397) [(4, 3), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-124680784 : Rat) / 385571) [(4, 3), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5787200 : Rat) / 158397) [(4, 3), (7, 1), (12, 1), (15, 1)],
  term ((62340392 : Rat) / 385571) [(4, 3), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-24238592 : Rat) / 158397) [(4, 3), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((3682016 : Rat) / 385571) [(4, 3), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((12119296 : Rat) / 158397) [(4, 3), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-1841008 : Rat) / 385571) [(4, 3), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3112960 : Rat) / 52799) [(4, 3), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((9166080 : Rat) / 385571) [(4, 3), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1556480 : Rat) / 52799) [(4, 3), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-4583040 : Rat) / 385571) [(4, 3), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1556480 : Rat) / 52799) [(4, 3), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((-4583040 : Rat) / 385571) [(4, 3), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-778240 : Rat) / 52799) [(4, 3), (8, 1), (12, 1), (15, 2)],
  term ((2291520 : Rat) / 385571) [(4, 3), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((24238592 : Rat) / 158397) [(4, 3), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-3682016 : Rat) / 385571) [(4, 3), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12119296 : Rat) / 158397) [(4, 3), (9, 1), (12, 1), (15, 1)],
  term ((1841008 : Rat) / 385571) [(4, 3), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((778240 : Rat) / 52799) [(4, 3), (9, 1), (15, 1)],
  term ((-2291520 : Rat) / 385571) [(4, 3), (9, 1), (15, 1), (16, 1)],
  term ((3112960 : Rat) / 52799) [(4, 3), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-9166080 : Rat) / 385571) [(4, 3), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(4, 3), (11, 1), (12, 1), (15, 1)],
  term ((4583040 : Rat) / 385571) [(4, 3), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(4, 3), (12, 1), (14, 1), (15, 2)],
  term ((4583040 : Rat) / 385571) [(4, 3), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((778240 : Rat) / 52799) [(4, 3), (12, 1), (15, 2)],
  term ((-2291520 : Rat) / 385571) [(4, 3), (12, 1), (15, 2), (16, 1)],
  term ((-1743232 : Rat) / 158397) [(4, 3), (15, 2)],
  term ((4337032 : Rat) / 385571) [(4, 3), (15, 2), (16, 1)],
  term ((9437440 : Rat) / 52799) [(5, 2), (6, 1), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((-131880288 : Rat) / 385571) [(5, 2), (6, 1), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4718720 : Rat) / 52799) [(5, 2), (6, 1), (8, 1), (12, 1), (15, 2)],
  term ((65940144 : Rat) / 385571) [(5, 2), (6, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-9437440 : Rat) / 52799) [(5, 2), (6, 1), (12, 1), (14, 1), (15, 2)],
  term ((131880288 : Rat) / 385571) [(5, 2), (6, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((4718720 : Rat) / 52799) [(5, 2), (6, 1), (12, 1), (15, 2)],
  term ((-65940144 : Rat) / 385571) [(5, 2), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-66179840 : Rat) / 158397) [(5, 2), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((352320800 : Rat) / 385571) [(5, 2), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((33089920 : Rat) / 158397) [(5, 2), (8, 1), (12, 1), (15, 2)],
  term ((-176160400 : Rat) / 385571) [(5, 2), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((1556480 : Rat) / 52799) [(5, 2), (8, 1), (15, 2)],
  term ((-4583040 : Rat) / 385571) [(5, 2), (8, 1), (15, 2), (16, 1)],
  term ((66179840 : Rat) / 158397) [(5, 2), (12, 1), (14, 1), (15, 2)],
  term ((-352320800 : Rat) / 385571) [(5, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-33089920 : Rat) / 158397) [(5, 2), (12, 1), (15, 2)],
  term ((176160400 : Rat) / 385571) [(5, 2), (12, 1), (15, 2), (16, 1)],
  term ((11960320 : Rat) / 52799) [(5, 2), (14, 1), (15, 2)],
  term ((-4718720 : Rat) / 52799) [(5, 3), (6, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((65940144 : Rat) / 385571) [(5, 3), (6, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((2359360 : Rat) / 52799) [(5, 3), (6, 1), (8, 1), (12, 1), (15, 1)],
  term ((-32970072 : Rat) / 385571) [(5, 3), (6, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((4718720 : Rat) / 52799) [(5, 3), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((-65940144 : Rat) / 385571) [(5, 3), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2359360 : Rat) / 52799) [(5, 3), (6, 1), (12, 1), (15, 1)],
  term ((32970072 : Rat) / 385571) [(5, 3), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((33089920 : Rat) / 158397) [(5, 3), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-176160400 : Rat) / 385571) [(5, 3), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-16544960 : Rat) / 158397) [(5, 3), (8, 1), (12, 1), (15, 1)],
  term ((88080200 : Rat) / 385571) [(5, 3), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-778240 : Rat) / 52799) [(5, 3), (8, 1), (15, 1)],
  term ((2291520 : Rat) / 385571) [(5, 3), (8, 1), (15, 1), (16, 1)],
  term ((-33089920 : Rat) / 158397) [(5, 3), (12, 1), (14, 1), (15, 1)],
  term ((176160400 : Rat) / 385571) [(5, 3), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((16544960 : Rat) / 158397) [(5, 3), (12, 1), (15, 1)],
  term ((-88080200 : Rat) / 385571) [(5, 3), (12, 1), (15, 1), (16, 1)],
  term ((-5980160 : Rat) / 52799) [(5, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 29, terms 100 through 199. -/
theorem rs_R005_ueqv_R005NYN_block_29_0100_0199_valid :
    checkProductSumEq rs_R005_ueqv_R005NYN_partials_29_0100_0199
      rs_R005_ueqv_R005NYN_block_29_0100_0199 = true := by
  native_decide

end R005UeqvR005NYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
