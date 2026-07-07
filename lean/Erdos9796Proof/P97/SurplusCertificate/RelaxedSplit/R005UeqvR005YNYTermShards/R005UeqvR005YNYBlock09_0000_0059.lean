/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R005:u=v:R005YNY, term block 9:0-59

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R005UeqvR005YNYTermShards

/-- Generator polynomial 9 for relaxed split surplus certificate `R005:u=v:R005YNY`. -/
def rs_R005_ueqv_R005YNY_generator_09_0000_0059 : Poly :=
[
  term (-2 : Rat) [(0, 1), (4, 1)],
  term (2 : Rat) [(0, 1), (12, 1)],
  term (-2 : Rat) [(1, 1), (5, 1)],
  term (2 : Rat) [(1, 1), (13, 1)],
  term (1 : Rat) [(4, 2)],
  term (1 : Rat) [(5, 2)],
  term (-1 : Rat) [(12, 2)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 9. -/
def rs_R005_ueqv_R005YNY_coefficient_09_0000 : Poly :=
[
  term ((6968896 : Rat) / 26243) [(3, 1), (13, 1), (16, 1)]
]

/-- Partial product 0 for generator 9. -/
def rs_R005_ueqv_R005YNY_partial_09_0000 : Poly :=
[
  term ((-13937792 : Rat) / 26243) [(0, 1), (3, 1), (4, 1), (13, 1), (16, 1)],
  term ((13937792 : Rat) / 26243) [(0, 1), (3, 1), (12, 1), (13, 1), (16, 1)],
  term ((-13937792 : Rat) / 26243) [(1, 1), (3, 1), (5, 1), (13, 1), (16, 1)],
  term ((13937792 : Rat) / 26243) [(1, 1), (3, 1), (13, 2), (16, 1)],
  term ((6968896 : Rat) / 26243) [(3, 1), (4, 2), (13, 1), (16, 1)],
  term ((6968896 : Rat) / 26243) [(3, 1), (5, 2), (13, 1), (16, 1)],
  term ((-6968896 : Rat) / 26243) [(3, 1), (12, 2), (13, 1), (16, 1)],
  term ((-6968896 : Rat) / 26243) [(3, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 9. -/
theorem rs_R005_ueqv_R005YNY_partial_09_0000_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_09_0000
        rs_R005_ueqv_R005YNY_generator_09_0000_0059 =
      rs_R005_ueqv_R005YNY_partial_09_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 9. -/
def rs_R005_ueqv_R005YNY_coefficient_09_0001 : Poly :=
[
  term ((-3484448 : Rat) / 26243) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 1 for generator 9. -/
def rs_R005_ueqv_R005YNY_partial_09_0001 : Poly :=
[
  term ((6968896 : Rat) / 26243) [(0, 1), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((-6968896 : Rat) / 26243) [(0, 1), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((6968896 : Rat) / 26243) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((-6968896 : Rat) / 26243) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3484448 : Rat) / 26243) [(3, 1), (4, 2), (15, 1), (16, 1)],
  term ((-3484448 : Rat) / 26243) [(3, 1), (5, 2), (15, 1), (16, 1)],
  term ((3484448 : Rat) / 26243) [(3, 1), (12, 2), (15, 1), (16, 1)],
  term ((3484448 : Rat) / 26243) [(3, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 9. -/
theorem rs_R005_ueqv_R005YNY_partial_09_0001_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_09_0001
        rs_R005_ueqv_R005YNY_generator_09_0000_0059 =
      rs_R005_ueqv_R005YNY_partial_09_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 9. -/
def rs_R005_ueqv_R005YNY_coefficient_09_0002 : Poly :=
[
  term ((329364 : Rat) / 3749) [(4, 1), (7, 1), (13, 1), (16, 1)]
]

/-- Partial product 2 for generator 9. -/
def rs_R005_ueqv_R005YNY_partial_09_0002 : Poly :=
[
  term ((658728 : Rat) / 3749) [(0, 1), (4, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-658728 : Rat) / 3749) [(0, 1), (4, 2), (7, 1), (13, 1), (16, 1)],
  term ((-658728 : Rat) / 3749) [(1, 1), (4, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((658728 : Rat) / 3749) [(1, 1), (4, 1), (7, 1), (13, 2), (16, 1)],
  term ((329364 : Rat) / 3749) [(4, 1), (5, 2), (7, 1), (13, 1), (16, 1)],
  term ((-329364 : Rat) / 3749) [(4, 1), (7, 1), (12, 2), (13, 1), (16, 1)],
  term ((-329364 : Rat) / 3749) [(4, 1), (7, 1), (13, 3), (16, 1)],
  term ((329364 : Rat) / 3749) [(4, 3), (7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 9. -/
theorem rs_R005_ueqv_R005YNY_partial_09_0002_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_09_0002
        rs_R005_ueqv_R005YNY_generator_09_0000_0059 =
      rs_R005_ueqv_R005YNY_partial_09_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 9. -/
def rs_R005_ueqv_R005YNY_coefficient_09_0003 : Poly :=
[
  term ((-78120 : Rat) / 3749) [(4, 1), (7, 1), (13, 3), (16, 1)]
]

/-- Partial product 3 for generator 9. -/
def rs_R005_ueqv_R005YNY_partial_09_0003 : Poly :=
[
  term ((-156240 : Rat) / 3749) [(0, 1), (4, 1), (7, 1), (12, 1), (13, 3), (16, 1)],
  term ((156240 : Rat) / 3749) [(0, 1), (4, 2), (7, 1), (13, 3), (16, 1)],
  term ((156240 : Rat) / 3749) [(1, 1), (4, 1), (5, 1), (7, 1), (13, 3), (16, 1)],
  term ((-156240 : Rat) / 3749) [(1, 1), (4, 1), (7, 1), (13, 4), (16, 1)],
  term ((-78120 : Rat) / 3749) [(4, 1), (5, 2), (7, 1), (13, 3), (16, 1)],
  term ((78120 : Rat) / 3749) [(4, 1), (7, 1), (12, 2), (13, 3), (16, 1)],
  term ((78120 : Rat) / 3749) [(4, 1), (7, 1), (13, 5), (16, 1)],
  term ((-78120 : Rat) / 3749) [(4, 3), (7, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 9. -/
theorem rs_R005_ueqv_R005YNY_partial_09_0003_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_09_0003
        rs_R005_ueqv_R005YNY_generator_09_0000_0059 =
      rs_R005_ueqv_R005YNY_partial_09_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 9. -/
def rs_R005_ueqv_R005YNY_coefficient_09_0004 : Poly :=
[
  term ((465696 : Rat) / 3749) [(4, 1), (8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 4 for generator 9. -/
def rs_R005_ueqv_R005YNY_partial_09_0004 : Poly :=
[
  term ((931392 : Rat) / 3749) [(0, 1), (4, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-931392 : Rat) / 3749) [(0, 1), (4, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-931392 : Rat) / 3749) [(1, 1), (4, 1), (5, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((931392 : Rat) / 3749) [(1, 1), (4, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((465696 : Rat) / 3749) [(4, 1), (5, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-465696 : Rat) / 3749) [(4, 1), (8, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-465696 : Rat) / 3749) [(4, 1), (8, 1), (13, 3), (15, 1), (16, 1)],
  term ((465696 : Rat) / 3749) [(4, 3), (8, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 9. -/
theorem rs_R005_ueqv_R005YNY_partial_09_0004_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_09_0004
        rs_R005_ueqv_R005YNY_generator_09_0000_0059 =
      rs_R005_ueqv_R005YNY_partial_09_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 9. -/
def rs_R005_ueqv_R005YNY_coefficient_09_0005 : Poly :=
[
  term ((-831600 : Rat) / 3749) [(4, 1), (8, 1), (13, 2), (16, 1)]
]

/-- Partial product 5 for generator 9. -/
def rs_R005_ueqv_R005YNY_partial_09_0005 : Poly :=
[
  term ((-1663200 : Rat) / 3749) [(0, 1), (4, 1), (8, 1), (12, 1), (13, 2), (16, 1)],
  term ((1663200 : Rat) / 3749) [(0, 1), (4, 2), (8, 1), (13, 2), (16, 1)],
  term ((1663200 : Rat) / 3749) [(1, 1), (4, 1), (5, 1), (8, 1), (13, 2), (16, 1)],
  term ((-1663200 : Rat) / 3749) [(1, 1), (4, 1), (8, 1), (13, 3), (16, 1)],
  term ((-831600 : Rat) / 3749) [(4, 1), (5, 2), (8, 1), (13, 2), (16, 1)],
  term ((831600 : Rat) / 3749) [(4, 1), (8, 1), (12, 2), (13, 2), (16, 1)],
  term ((831600 : Rat) / 3749) [(4, 1), (8, 1), (13, 4), (16, 1)],
  term ((-831600 : Rat) / 3749) [(4, 3), (8, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 9. -/
theorem rs_R005_ueqv_R005YNY_partial_09_0005_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_09_0005
        rs_R005_ueqv_R005YNY_generator_09_0000_0059 =
      rs_R005_ueqv_R005YNY_partial_09_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 9. -/
def rs_R005_ueqv_R005YNY_coefficient_09_0006 : Poly :=
[
  term ((52038 : Rat) / 3749) [(4, 1), (8, 1), (16, 1)]
]

/-- Partial product 6 for generator 9. -/
def rs_R005_ueqv_R005YNY_partial_09_0006 : Poly :=
[
  term ((104076 : Rat) / 3749) [(0, 1), (4, 1), (8, 1), (12, 1), (16, 1)],
  term ((-104076 : Rat) / 3749) [(0, 1), (4, 2), (8, 1), (16, 1)],
  term ((-104076 : Rat) / 3749) [(1, 1), (4, 1), (5, 1), (8, 1), (16, 1)],
  term ((104076 : Rat) / 3749) [(1, 1), (4, 1), (8, 1), (13, 1), (16, 1)],
  term ((52038 : Rat) / 3749) [(4, 1), (5, 2), (8, 1), (16, 1)],
  term ((-52038 : Rat) / 3749) [(4, 1), (8, 1), (12, 2), (16, 1)],
  term ((-52038 : Rat) / 3749) [(4, 1), (8, 1), (13, 2), (16, 1)],
  term ((52038 : Rat) / 3749) [(4, 3), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 9. -/
theorem rs_R005_ueqv_R005YNY_partial_09_0006_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_09_0006
        rs_R005_ueqv_R005YNY_generator_09_0000_0059 =
      rs_R005_ueqv_R005YNY_partial_09_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 9. -/
def rs_R005_ueqv_R005YNY_coefficient_09_0007 : Poly :=
[
  term ((-468300 : Rat) / 3749) [(4, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 7 for generator 9. -/
def rs_R005_ueqv_R005YNY_partial_09_0007 : Poly :=
[
  term ((-936600 : Rat) / 3749) [(0, 1), (4, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((936600 : Rat) / 3749) [(0, 1), (4, 2), (9, 1), (13, 1), (16, 1)],
  term ((936600 : Rat) / 3749) [(1, 1), (4, 1), (5, 1), (9, 1), (13, 1), (16, 1)],
  term ((-936600 : Rat) / 3749) [(1, 1), (4, 1), (9, 1), (13, 2), (16, 1)],
  term ((-468300 : Rat) / 3749) [(4, 1), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((468300 : Rat) / 3749) [(4, 1), (9, 1), (12, 2), (13, 1), (16, 1)],
  term ((468300 : Rat) / 3749) [(4, 1), (9, 1), (13, 3), (16, 1)],
  term ((-468300 : Rat) / 3749) [(4, 3), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 9. -/
theorem rs_R005_ueqv_R005YNY_partial_09_0007_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_09_0007
        rs_R005_ueqv_R005YNY_generator_09_0000_0059 =
      rs_R005_ueqv_R005YNY_partial_09_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 9. -/
def rs_R005_ueqv_R005YNY_coefficient_09_0008 : Poly :=
[
  term ((74340 : Rat) / 3749) [(4, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 8 for generator 9. -/
def rs_R005_ueqv_R005YNY_partial_09_0008 : Poly :=
[
  term ((148680 : Rat) / 3749) [(0, 1), (4, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-148680 : Rat) / 3749) [(0, 1), (4, 2), (9, 1), (15, 1), (16, 1)],
  term ((-148680 : Rat) / 3749) [(1, 1), (4, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((148680 : Rat) / 3749) [(1, 1), (4, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((74340 : Rat) / 3749) [(4, 1), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-74340 : Rat) / 3749) [(4, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-74340 : Rat) / 3749) [(4, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((74340 : Rat) / 3749) [(4, 3), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 9. -/
theorem rs_R005_ueqv_R005YNY_partial_09_0008_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_09_0008
        rs_R005_ueqv_R005YNY_generator_09_0000_0059 =
      rs_R005_ueqv_R005YNY_partial_09_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 9. -/
def rs_R005_ueqv_R005YNY_coefficient_09_0009 : Poly :=
[
  term ((-338436 : Rat) / 3749) [(4, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 9 for generator 9. -/
def rs_R005_ueqv_R005YNY_partial_09_0009 : Poly :=
[
  term ((-676872 : Rat) / 3749) [(0, 1), (4, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((676872 : Rat) / 3749) [(0, 1), (4, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((676872 : Rat) / 3749) [(1, 1), (4, 1), (5, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-676872 : Rat) / 3749) [(1, 1), (4, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-338436 : Rat) / 3749) [(4, 1), (5, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((338436 : Rat) / 3749) [(4, 1), (10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((338436 : Rat) / 3749) [(4, 1), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((-338436 : Rat) / 3749) [(4, 3), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 9. -/
theorem rs_R005_ueqv_R005YNY_partial_09_0009_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_09_0009
        rs_R005_ueqv_R005YNY_generator_09_0000_0059 =
      rs_R005_ueqv_R005YNY_partial_09_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 9. -/
def rs_R005_ueqv_R005YNY_coefficient_09_0010 : Poly :=
[
  term ((377496 : Rat) / 3749) [(4, 1), (10, 1), (13, 2), (16, 1)]
]

/-- Partial product 10 for generator 9. -/
def rs_R005_ueqv_R005YNY_partial_09_0010 : Poly :=
[
  term ((754992 : Rat) / 3749) [(0, 1), (4, 1), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((-754992 : Rat) / 3749) [(0, 1), (4, 2), (10, 1), (13, 2), (16, 1)],
  term ((-754992 : Rat) / 3749) [(1, 1), (4, 1), (5, 1), (10, 1), (13, 2), (16, 1)],
  term ((754992 : Rat) / 3749) [(1, 1), (4, 1), (10, 1), (13, 3), (16, 1)],
  term ((377496 : Rat) / 3749) [(4, 1), (5, 2), (10, 1), (13, 2), (16, 1)],
  term ((-377496 : Rat) / 3749) [(4, 1), (10, 1), (12, 2), (13, 2), (16, 1)],
  term ((-377496 : Rat) / 3749) [(4, 1), (10, 1), (13, 4), (16, 1)],
  term ((377496 : Rat) / 3749) [(4, 3), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 9. -/
theorem rs_R005_ueqv_R005YNY_partial_09_0010_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_09_0010
        rs_R005_ueqv_R005YNY_generator_09_0000_0059 =
      rs_R005_ueqv_R005YNY_partial_09_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 9. -/
def rs_R005_ueqv_R005YNY_coefficient_09_0011 : Poly :=
[
  term ((66906 : Rat) / 3749) [(4, 1), (10, 1), (16, 1)]
]

/-- Partial product 11 for generator 9. -/
def rs_R005_ueqv_R005YNY_partial_09_0011 : Poly :=
[
  term ((133812 : Rat) / 3749) [(0, 1), (4, 1), (10, 1), (12, 1), (16, 1)],
  term ((-133812 : Rat) / 3749) [(0, 1), (4, 2), (10, 1), (16, 1)],
  term ((-133812 : Rat) / 3749) [(1, 1), (4, 1), (5, 1), (10, 1), (16, 1)],
  term ((133812 : Rat) / 3749) [(1, 1), (4, 1), (10, 1), (13, 1), (16, 1)],
  term ((66906 : Rat) / 3749) [(4, 1), (5, 2), (10, 1), (16, 1)],
  term ((-66906 : Rat) / 3749) [(4, 1), (10, 1), (12, 2), (16, 1)],
  term ((-66906 : Rat) / 3749) [(4, 1), (10, 1), (13, 2), (16, 1)],
  term ((66906 : Rat) / 3749) [(4, 3), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 9. -/
theorem rs_R005_ueqv_R005YNY_partial_09_0011_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_09_0011
        rs_R005_ueqv_R005YNY_generator_09_0000_0059 =
      rs_R005_ueqv_R005YNY_partial_09_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 9. -/
def rs_R005_ueqv_R005YNY_coefficient_09_0012 : Poly :=
[
  term ((258426 : Rat) / 3749) [(4, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 12 for generator 9. -/
def rs_R005_ueqv_R005YNY_partial_09_0012 : Poly :=
[
  term ((516852 : Rat) / 3749) [(0, 1), (4, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-516852 : Rat) / 3749) [(0, 1), (4, 2), (11, 1), (13, 1), (16, 1)],
  term ((-516852 : Rat) / 3749) [(1, 1), (4, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((516852 : Rat) / 3749) [(1, 1), (4, 1), (11, 1), (13, 2), (16, 1)],
  term ((258426 : Rat) / 3749) [(4, 1), (5, 2), (11, 1), (13, 1), (16, 1)],
  term ((-258426 : Rat) / 3749) [(4, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-258426 : Rat) / 3749) [(4, 1), (11, 1), (13, 3), (16, 1)],
  term ((258426 : Rat) / 3749) [(4, 3), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 9. -/
theorem rs_R005_ueqv_R005YNY_partial_09_0012_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_09_0012
        rs_R005_ueqv_R005YNY_generator_09_0000_0059 =
      rs_R005_ueqv_R005YNY_partial_09_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 9. -/
def rs_R005_ueqv_R005YNY_coefficient_09_0013 : Poly :=
[
  term ((199584 : Rat) / 3749) [(4, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 13 for generator 9. -/
def rs_R005_ueqv_R005YNY_partial_09_0013 : Poly :=
[
  term ((399168 : Rat) / 3749) [(0, 1), (4, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-399168 : Rat) / 3749) [(0, 1), (4, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-399168 : Rat) / 3749) [(1, 1), (4, 1), (5, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((399168 : Rat) / 3749) [(1, 1), (4, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((199584 : Rat) / 3749) [(4, 1), (5, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-199584 : Rat) / 3749) [(4, 1), (11, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-199584 : Rat) / 3749) [(4, 1), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((199584 : Rat) / 3749) [(4, 3), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 9. -/
theorem rs_R005_ueqv_R005YNY_partial_09_0013_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_09_0013
        rs_R005_ueqv_R005YNY_generator_09_0000_0059 =
      rs_R005_ueqv_R005YNY_partial_09_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 9. -/
def rs_R005_ueqv_R005YNY_coefficient_09_0014 : Poly :=
[
  term ((-399168 : Rat) / 3749) [(4, 1), (11, 1), (13, 3), (16, 1)]
]

/-- Partial product 14 for generator 9. -/
def rs_R005_ueqv_R005YNY_partial_09_0014 : Poly :=
[
  term ((-798336 : Rat) / 3749) [(0, 1), (4, 1), (11, 1), (12, 1), (13, 3), (16, 1)],
  term ((798336 : Rat) / 3749) [(0, 1), (4, 2), (11, 1), (13, 3), (16, 1)],
  term ((798336 : Rat) / 3749) [(1, 1), (4, 1), (5, 1), (11, 1), (13, 3), (16, 1)],
  term ((-798336 : Rat) / 3749) [(1, 1), (4, 1), (11, 1), (13, 4), (16, 1)],
  term ((-399168 : Rat) / 3749) [(4, 1), (5, 2), (11, 1), (13, 3), (16, 1)],
  term ((399168 : Rat) / 3749) [(4, 1), (11, 1), (12, 2), (13, 3), (16, 1)],
  term ((399168 : Rat) / 3749) [(4, 1), (11, 1), (13, 5), (16, 1)],
  term ((-399168 : Rat) / 3749) [(4, 3), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 9. -/
theorem rs_R005_ueqv_R005YNY_partial_09_0014_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_09_0014
        rs_R005_ueqv_R005YNY_generator_09_0000_0059 =
      rs_R005_ueqv_R005YNY_partial_09_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 9. -/
def rs_R005_ueqv_R005YNY_coefficient_09_0015 : Poly :=
[
  term ((-44604 : Rat) / 3749) [(4, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 15 for generator 9. -/
def rs_R005_ueqv_R005YNY_partial_09_0015 : Poly :=
[
  term ((-89208 : Rat) / 3749) [(0, 1), (4, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((89208 : Rat) / 3749) [(0, 1), (4, 2), (11, 1), (15, 1), (16, 1)],
  term ((89208 : Rat) / 3749) [(1, 1), (4, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-89208 : Rat) / 3749) [(1, 1), (4, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-44604 : Rat) / 3749) [(4, 1), (5, 2), (11, 1), (15, 1), (16, 1)],
  term ((44604 : Rat) / 3749) [(4, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((44604 : Rat) / 3749) [(4, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-44604 : Rat) / 3749) [(4, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 9. -/
theorem rs_R005_ueqv_R005YNY_partial_09_0015_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_09_0015
        rs_R005_ueqv_R005YNY_generator_09_0000_0059 =
      rs_R005_ueqv_R005YNY_partial_09_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 9. -/
def rs_R005_ueqv_R005YNY_coefficient_09_0016 : Poly :=
[
  term ((-76503 : Rat) / 3749) [(4, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 16 for generator 9. -/
def rs_R005_ueqv_R005YNY_partial_09_0016 : Poly :=
[
  term ((-153006 : Rat) / 3749) [(0, 1), (4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((153006 : Rat) / 3749) [(0, 1), (4, 2), (13, 1), (15, 1), (16, 1)],
  term ((153006 : Rat) / 3749) [(1, 1), (4, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-153006 : Rat) / 3749) [(1, 1), (4, 1), (13, 2), (15, 1), (16, 1)],
  term ((-76503 : Rat) / 3749) [(4, 1), (5, 2), (13, 1), (15, 1), (16, 1)],
  term ((76503 : Rat) / 3749) [(4, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((76503 : Rat) / 3749) [(4, 1), (13, 3), (15, 1), (16, 1)],
  term ((-76503 : Rat) / 3749) [(4, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 9. -/
theorem rs_R005_ueqv_R005YNY_partial_09_0016_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_09_0016
        rs_R005_ueqv_R005YNY_generator_09_0000_0059 =
      rs_R005_ueqv_R005YNY_partial_09_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 9. -/
def rs_R005_ueqv_R005YNY_coefficient_09_0017 : Poly :=
[
  term ((-19530 : Rat) / 3749) [(4, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 17 for generator 9. -/
def rs_R005_ueqv_R005YNY_partial_09_0017 : Poly :=
[
  term ((-39060 : Rat) / 3749) [(0, 1), (4, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((39060 : Rat) / 3749) [(0, 1), (4, 2), (13, 2), (15, 2), (16, 1)],
  term ((39060 : Rat) / 3749) [(1, 1), (4, 1), (5, 1), (13, 2), (15, 2), (16, 1)],
  term ((-39060 : Rat) / 3749) [(1, 1), (4, 1), (13, 3), (15, 2), (16, 1)],
  term ((-19530 : Rat) / 3749) [(4, 1), (5, 2), (13, 2), (15, 2), (16, 1)],
  term ((19530 : Rat) / 3749) [(4, 1), (12, 2), (13, 2), (15, 2), (16, 1)],
  term ((19530 : Rat) / 3749) [(4, 1), (13, 4), (15, 2), (16, 1)],
  term ((-19530 : Rat) / 3749) [(4, 3), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 9. -/
theorem rs_R005_ueqv_R005YNY_partial_09_0017_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_09_0017
        rs_R005_ueqv_R005YNY_generator_09_0000_0059 =
      rs_R005_ueqv_R005YNY_partial_09_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 9. -/
def rs_R005_ueqv_R005YNY_coefficient_09_0018 : Poly :=
[
  term ((1283373 : Rat) / 7498) [(4, 1), (13, 2), (16, 1)]
]

/-- Partial product 18 for generator 9. -/
def rs_R005_ueqv_R005YNY_partial_09_0018 : Poly :=
[
  term ((1283373 : Rat) / 3749) [(0, 1), (4, 1), (12, 1), (13, 2), (16, 1)],
  term ((-1283373 : Rat) / 3749) [(0, 1), (4, 2), (13, 2), (16, 1)],
  term ((-1283373 : Rat) / 3749) [(1, 1), (4, 1), (5, 1), (13, 2), (16, 1)],
  term ((1283373 : Rat) / 3749) [(1, 1), (4, 1), (13, 3), (16, 1)],
  term ((1283373 : Rat) / 7498) [(4, 1), (5, 2), (13, 2), (16, 1)],
  term ((-1283373 : Rat) / 7498) [(4, 1), (12, 2), (13, 2), (16, 1)],
  term ((-1283373 : Rat) / 7498) [(4, 1), (13, 4), (16, 1)],
  term ((1283373 : Rat) / 7498) [(4, 3), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 9. -/
theorem rs_R005_ueqv_R005YNY_partial_09_0018_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_09_0018
        rs_R005_ueqv_R005YNY_generator_09_0000_0059 =
      rs_R005_ueqv_R005YNY_partial_09_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 9. -/
def rs_R005_ueqv_R005YNY_coefficient_09_0019 : Poly :=
[
  term ((-173544 : Rat) / 3749) [(4, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 19 for generator 9. -/
def rs_R005_ueqv_R005YNY_partial_09_0019 : Poly :=
[
  term ((-347088 : Rat) / 3749) [(0, 1), (4, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((347088 : Rat) / 3749) [(0, 1), (4, 2), (13, 3), (15, 1), (16, 1)],
  term ((347088 : Rat) / 3749) [(1, 1), (4, 1), (5, 1), (13, 3), (15, 1), (16, 1)],
  term ((-347088 : Rat) / 3749) [(1, 1), (4, 1), (13, 4), (15, 1), (16, 1)],
  term ((-173544 : Rat) / 3749) [(4, 1), (5, 2), (13, 3), (15, 1), (16, 1)],
  term ((173544 : Rat) / 3749) [(4, 1), (12, 2), (13, 3), (15, 1), (16, 1)],
  term ((173544 : Rat) / 3749) [(4, 1), (13, 5), (15, 1), (16, 1)],
  term ((-173544 : Rat) / 3749) [(4, 3), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 9. -/
theorem rs_R005_ueqv_R005YNY_partial_09_0019_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_09_0019
        rs_R005_ueqv_R005YNY_generator_09_0000_0059 =
      rs_R005_ueqv_R005YNY_partial_09_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 9. -/
def rs_R005_ueqv_R005YNY_coefficient_09_0020 : Poly :=
[
  term ((425208 : Rat) / 3749) [(4, 1), (13, 4), (16, 1)]
]

/-- Partial product 20 for generator 9. -/
def rs_R005_ueqv_R005YNY_partial_09_0020 : Poly :=
[
  term ((850416 : Rat) / 3749) [(0, 1), (4, 1), (12, 1), (13, 4), (16, 1)],
  term ((-850416 : Rat) / 3749) [(0, 1), (4, 2), (13, 4), (16, 1)],
  term ((-850416 : Rat) / 3749) [(1, 1), (4, 1), (5, 1), (13, 4), (16, 1)],
  term ((850416 : Rat) / 3749) [(1, 1), (4, 1), (13, 5), (16, 1)],
  term ((425208 : Rat) / 3749) [(4, 1), (5, 2), (13, 4), (16, 1)],
  term ((-425208 : Rat) / 3749) [(4, 1), (12, 2), (13, 4), (16, 1)],
  term ((-425208 : Rat) / 3749) [(4, 1), (13, 6), (16, 1)],
  term ((425208 : Rat) / 3749) [(4, 3), (13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 9. -/
theorem rs_R005_ueqv_R005YNY_partial_09_0020_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_09_0020
        rs_R005_ueqv_R005YNY_generator_09_0000_0059 =
      rs_R005_ueqv_R005YNY_partial_09_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 9. -/
def rs_R005_ueqv_R005YNY_coefficient_09_0021 : Poly :=
[
  term ((59472 : Rat) / 3749) [(4, 1), (15, 2), (16, 1)]
]

/-- Partial product 21 for generator 9. -/
def rs_R005_ueqv_R005YNY_partial_09_0021 : Poly :=
[
  term ((118944 : Rat) / 3749) [(0, 1), (4, 1), (12, 1), (15, 2), (16, 1)],
  term ((-118944 : Rat) / 3749) [(0, 1), (4, 2), (15, 2), (16, 1)],
  term ((-118944 : Rat) / 3749) [(1, 1), (4, 1), (5, 1), (15, 2), (16, 1)],
  term ((118944 : Rat) / 3749) [(1, 1), (4, 1), (13, 1), (15, 2), (16, 1)],
  term ((59472 : Rat) / 3749) [(4, 1), (5, 2), (15, 2), (16, 1)],
  term ((-59472 : Rat) / 3749) [(4, 1), (12, 2), (15, 2), (16, 1)],
  term ((-59472 : Rat) / 3749) [(4, 1), (13, 2), (15, 2), (16, 1)],
  term ((59472 : Rat) / 3749) [(4, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 9. -/
theorem rs_R005_ueqv_R005YNY_partial_09_0021_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_09_0021
        rs_R005_ueqv_R005YNY_generator_09_0000_0059 =
      rs_R005_ueqv_R005YNY_partial_09_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 9. -/
def rs_R005_ueqv_R005YNY_coefficient_09_0022 : Poly :=
[
  term ((-59094 : Rat) / 3749) [(4, 1), (16, 1)]
]

/-- Partial product 22 for generator 9. -/
def rs_R005_ueqv_R005YNY_partial_09_0022 : Poly :=
[
  term ((-118188 : Rat) / 3749) [(0, 1), (4, 1), (12, 1), (16, 1)],
  term ((118188 : Rat) / 3749) [(0, 1), (4, 2), (16, 1)],
  term ((118188 : Rat) / 3749) [(1, 1), (4, 1), (5, 1), (16, 1)],
  term ((-118188 : Rat) / 3749) [(1, 1), (4, 1), (13, 1), (16, 1)],
  term ((-59094 : Rat) / 3749) [(4, 1), (5, 2), (16, 1)],
  term ((59094 : Rat) / 3749) [(4, 1), (12, 2), (16, 1)],
  term ((59094 : Rat) / 3749) [(4, 1), (13, 2), (16, 1)],
  term ((-59094 : Rat) / 3749) [(4, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 9. -/
theorem rs_R005_ueqv_R005YNY_partial_09_0022_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_09_0022
        rs_R005_ueqv_R005YNY_generator_09_0000_0059 =
      rs_R005_ueqv_R005YNY_partial_09_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 9. -/
def rs_R005_ueqv_R005YNY_coefficient_09_0023 : Poly :=
[
  term ((4029732 : Rat) / 41239) [(5, 1), (7, 1), (13, 2), (16, 1)]
]

/-- Partial product 23 for generator 9. -/
def rs_R005_ueqv_R005YNY_partial_09_0023 : Poly :=
[
  term ((-8059464 : Rat) / 41239) [(0, 1), (4, 1), (5, 1), (7, 1), (13, 2), (16, 1)],
  term ((8059464 : Rat) / 41239) [(0, 1), (5, 1), (7, 1), (12, 1), (13, 2), (16, 1)],
  term ((8059464 : Rat) / 41239) [(1, 1), (5, 1), (7, 1), (13, 3), (16, 1)],
  term ((-8059464 : Rat) / 41239) [(1, 1), (5, 2), (7, 1), (13, 2), (16, 1)],
  term ((4029732 : Rat) / 41239) [(4, 2), (5, 1), (7, 1), (13, 2), (16, 1)],
  term ((-4029732 : Rat) / 41239) [(5, 1), (7, 1), (12, 2), (13, 2), (16, 1)],
  term ((-4029732 : Rat) / 41239) [(5, 1), (7, 1), (13, 4), (16, 1)],
  term ((4029732 : Rat) / 41239) [(5, 3), (7, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 9. -/
theorem rs_R005_ueqv_R005YNY_partial_09_0023_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_09_0023
        rs_R005_ueqv_R005YNY_generator_09_0000_0059 =
      rs_R005_ueqv_R005YNY_partial_09_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 9. -/
def rs_R005_ueqv_R005YNY_coefficient_09_0024 : Poly :=
[
  term ((-1240722 : Rat) / 41239) [(5, 1), (7, 1), (16, 1)]
]

/-- Partial product 24 for generator 9. -/
def rs_R005_ueqv_R005YNY_partial_09_0024 : Poly :=
[
  term ((2481444 : Rat) / 41239) [(0, 1), (4, 1), (5, 1), (7, 1), (16, 1)],
  term ((-2481444 : Rat) / 41239) [(0, 1), (5, 1), (7, 1), (12, 1), (16, 1)],
  term ((-2481444 : Rat) / 41239) [(1, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((2481444 : Rat) / 41239) [(1, 1), (5, 2), (7, 1), (16, 1)],
  term ((-1240722 : Rat) / 41239) [(4, 2), (5, 1), (7, 1), (16, 1)],
  term ((1240722 : Rat) / 41239) [(5, 1), (7, 1), (12, 2), (16, 1)],
  term ((1240722 : Rat) / 41239) [(5, 1), (7, 1), (13, 2), (16, 1)],
  term ((-1240722 : Rat) / 41239) [(5, 3), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 9. -/
theorem rs_R005_ueqv_R005YNY_partial_09_0024_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_09_0024
        rs_R005_ueqv_R005YNY_generator_09_0000_0059 =
      rs_R005_ueqv_R005YNY_partial_09_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 9. -/
def rs_R005_ueqv_R005YNY_coefficient_09_0025 : Poly :=
[
  term ((5358024 : Rat) / 41239) [(5, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 25 for generator 9. -/
def rs_R005_ueqv_R005YNY_partial_09_0025 : Poly :=
[
  term ((-10716048 : Rat) / 41239) [(0, 1), (4, 1), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((10716048 : Rat) / 41239) [(0, 1), (5, 1), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((10716048 : Rat) / 41239) [(1, 1), (5, 1), (8, 1), (13, 2), (16, 1)],
  term ((-10716048 : Rat) / 41239) [(1, 1), (5, 2), (8, 1), (13, 1), (16, 1)],
  term ((5358024 : Rat) / 41239) [(4, 2), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((-5358024 : Rat) / 41239) [(5, 1), (8, 1), (12, 2), (13, 1), (16, 1)],
  term ((-5358024 : Rat) / 41239) [(5, 1), (8, 1), (13, 3), (16, 1)],
  term ((5358024 : Rat) / 41239) [(5, 3), (8, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 9. -/
theorem rs_R005_ueqv_R005YNY_partial_09_0025_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_09_0025
        rs_R005_ueqv_R005YNY_generator_09_0000_0059 =
      rs_R005_ueqv_R005YNY_partial_09_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 9. -/
def rs_R005_ueqv_R005YNY_coefficient_09_0026 : Poly :=
[
  term ((-2721348 : Rat) / 41239) [(5, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 26 for generator 9. -/
def rs_R005_ueqv_R005YNY_partial_09_0026 : Poly :=
[
  term ((5442696 : Rat) / 41239) [(0, 1), (4, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-5442696 : Rat) / 41239) [(0, 1), (5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-5442696 : Rat) / 41239) [(1, 1), (5, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((5442696 : Rat) / 41239) [(1, 1), (5, 2), (8, 1), (15, 1), (16, 1)],
  term ((-2721348 : Rat) / 41239) [(4, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((2721348 : Rat) / 41239) [(5, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((2721348 : Rat) / 41239) [(5, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((-2721348 : Rat) / 41239) [(5, 3), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 9. -/
theorem rs_R005_ueqv_R005YNY_partial_09_0026_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_09_0026
        rs_R005_ueqv_R005YNY_generator_09_0000_0059 =
      rs_R005_ueqv_R005YNY_partial_09_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 9. -/
def rs_R005_ueqv_R005YNY_coefficient_09_0027 : Poly :=
[
  term ((3099936 : Rat) / 41239) [(5, 1), (9, 1), (16, 1)]
]

/-- Partial product 27 for generator 9. -/
def rs_R005_ueqv_R005YNY_partial_09_0027 : Poly :=
[
  term ((-6199872 : Rat) / 41239) [(0, 1), (4, 1), (5, 1), (9, 1), (16, 1)],
  term ((6199872 : Rat) / 41239) [(0, 1), (5, 1), (9, 1), (12, 1), (16, 1)],
  term ((6199872 : Rat) / 41239) [(1, 1), (5, 1), (9, 1), (13, 1), (16, 1)],
  term ((-6199872 : Rat) / 41239) [(1, 1), (5, 2), (9, 1), (16, 1)],
  term ((3099936 : Rat) / 41239) [(4, 2), (5, 1), (9, 1), (16, 1)],
  term ((-3099936 : Rat) / 41239) [(5, 1), (9, 1), (12, 2), (16, 1)],
  term ((-3099936 : Rat) / 41239) [(5, 1), (9, 1), (13, 2), (16, 1)],
  term ((3099936 : Rat) / 41239) [(5, 3), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 9. -/
theorem rs_R005_ueqv_R005YNY_partial_09_0027_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_09_0027
        rs_R005_ueqv_R005YNY_generator_09_0000_0059 =
      rs_R005_ueqv_R005YNY_partial_09_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 9. -/
def rs_R005_ueqv_R005YNY_coefficient_09_0028 : Poly :=
[
  term ((-4283748 : Rat) / 41239) [(5, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 28 for generator 9. -/
def rs_R005_ueqv_R005YNY_partial_09_0028 : Poly :=
[
  term ((8567496 : Rat) / 41239) [(0, 1), (4, 1), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((-8567496 : Rat) / 41239) [(0, 1), (5, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-8567496 : Rat) / 41239) [(1, 1), (5, 1), (10, 1), (13, 2), (16, 1)],
  term ((8567496 : Rat) / 41239) [(1, 1), (5, 2), (10, 1), (13, 1), (16, 1)],
  term ((-4283748 : Rat) / 41239) [(4, 2), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((4283748 : Rat) / 41239) [(5, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((4283748 : Rat) / 41239) [(5, 1), (10, 1), (13, 3), (16, 1)],
  term ((-4283748 : Rat) / 41239) [(5, 3), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 9. -/
theorem rs_R005_ueqv_R005YNY_partial_09_0028_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_09_0028
        rs_R005_ueqv_R005YNY_generator_09_0000_0059 =
      rs_R005_ueqv_R005YNY_partial_09_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 9. -/
def rs_R005_ueqv_R005YNY_coefficient_09_0029 : Poly :=
[
  term ((206262 : Rat) / 3749) [(5, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 29 for generator 9. -/
def rs_R005_ueqv_R005YNY_partial_09_0029 : Poly :=
[
  term ((-412524 : Rat) / 3749) [(0, 1), (4, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((412524 : Rat) / 3749) [(0, 1), (5, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((412524 : Rat) / 3749) [(1, 1), (5, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-412524 : Rat) / 3749) [(1, 1), (5, 2), (10, 1), (15, 1), (16, 1)],
  term ((206262 : Rat) / 3749) [(4, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-206262 : Rat) / 3749) [(5, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-206262 : Rat) / 3749) [(5, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((206262 : Rat) / 3749) [(5, 3), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 9. -/
theorem rs_R005_ueqv_R005YNY_partial_09_0029_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_09_0029
        rs_R005_ueqv_R005YNY_generator_09_0000_0059 =
      rs_R005_ueqv_R005YNY_partial_09_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 9. -/
def rs_R005_ueqv_R005YNY_coefficient_09_0030 : Poly :=
[
  term ((-169344 : Rat) / 41239) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 30 for generator 9. -/
def rs_R005_ueqv_R005YNY_partial_09_0030 : Poly :=
[
  term ((338688 : Rat) / 41239) [(0, 1), (4, 1), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-338688 : Rat) / 41239) [(0, 1), (5, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-338688 : Rat) / 41239) [(1, 1), (5, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((338688 : Rat) / 41239) [(1, 1), (5, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-169344 : Rat) / 41239) [(4, 2), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((169344 : Rat) / 41239) [(5, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((169344 : Rat) / 41239) [(5, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-169344 : Rat) / 41239) [(5, 3), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 9. -/
theorem rs_R005_ueqv_R005YNY_partial_09_0030_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_09_0030
        rs_R005_ueqv_R005YNY_generator_09_0000_0059 =
      rs_R005_ueqv_R005YNY_partial_09_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 9. -/
def rs_R005_ueqv_R005YNY_coefficient_09_0031 : Poly :=
[
  term ((338688 : Rat) / 41239) [(5, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 31 for generator 9. -/
def rs_R005_ueqv_R005YNY_partial_09_0031 : Poly :=
[
  term ((-677376 : Rat) / 41239) [(0, 1), (4, 1), (5, 1), (11, 1), (13, 2), (16, 1)],
  term ((677376 : Rat) / 41239) [(0, 1), (5, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((677376 : Rat) / 41239) [(1, 1), (5, 1), (11, 1), (13, 3), (16, 1)],
  term ((-677376 : Rat) / 41239) [(1, 1), (5, 2), (11, 1), (13, 2), (16, 1)],
  term ((338688 : Rat) / 41239) [(4, 2), (5, 1), (11, 1), (13, 2), (16, 1)],
  term ((-338688 : Rat) / 41239) [(5, 1), (11, 1), (12, 2), (13, 2), (16, 1)],
  term ((-338688 : Rat) / 41239) [(5, 1), (11, 1), (13, 4), (16, 1)],
  term ((338688 : Rat) / 41239) [(5, 3), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 9. -/
theorem rs_R005_ueqv_R005YNY_partial_09_0031_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_09_0031
        rs_R005_ueqv_R005YNY_generator_09_0000_0059 =
      rs_R005_ueqv_R005YNY_partial_09_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 9. -/
def rs_R005_ueqv_R005YNY_coefficient_09_0032 : Poly :=
[
  term ((-103131 : Rat) / 3749) [(5, 1), (11, 1), (16, 1)]
]

/-- Partial product 32 for generator 9. -/
def rs_R005_ueqv_R005YNY_partial_09_0032 : Poly :=
[
  term ((206262 : Rat) / 3749) [(0, 1), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((-206262 : Rat) / 3749) [(0, 1), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((-206262 : Rat) / 3749) [(1, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((206262 : Rat) / 3749) [(1, 1), (5, 2), (11, 1), (16, 1)],
  term ((-103131 : Rat) / 3749) [(4, 2), (5, 1), (11, 1), (16, 1)],
  term ((103131 : Rat) / 3749) [(5, 1), (11, 1), (12, 2), (16, 1)],
  term ((103131 : Rat) / 3749) [(5, 1), (11, 1), (13, 2), (16, 1)],
  term ((-103131 : Rat) / 3749) [(5, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 9. -/
theorem rs_R005_ueqv_R005YNY_partial_09_0032_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_09_0032
        rs_R005_ueqv_R005YNY_generator_09_0000_0059 =
      rs_R005_ueqv_R005YNY_partial_09_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 9. -/
def rs_R005_ueqv_R005YNY_coefficient_09_0033 : Poly :=
[
  term ((1007433 : Rat) / 41239) [(5, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 33 for generator 9. -/
def rs_R005_ueqv_R005YNY_partial_09_0033 : Poly :=
[
  term ((-2014866 : Rat) / 41239) [(0, 1), (4, 1), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((2014866 : Rat) / 41239) [(0, 1), (5, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((2014866 : Rat) / 41239) [(1, 1), (5, 1), (13, 2), (15, 2), (16, 1)],
  term ((-2014866 : Rat) / 41239) [(1, 1), (5, 2), (13, 1), (15, 2), (16, 1)],
  term ((1007433 : Rat) / 41239) [(4, 2), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1007433 : Rat) / 41239) [(5, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-1007433 : Rat) / 41239) [(5, 1), (13, 3), (15, 2), (16, 1)],
  term ((1007433 : Rat) / 41239) [(5, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 9. -/
theorem rs_R005_ueqv_R005YNY_partial_09_0033_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_09_0033
        rs_R005_ueqv_R005YNY_generator_09_0000_0059 =
      rs_R005_ueqv_R005YNY_partial_09_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 9. -/
def rs_R005_ueqv_R005YNY_coefficient_09_0034 : Poly :=
[
  term ((230223 : Rat) / 164956) [(5, 1), (13, 1), (16, 1)]
]

/-- Partial product 34 for generator 9. -/
def rs_R005_ueqv_R005YNY_partial_09_0034 : Poly :=
[
  term ((-230223 : Rat) / 82478) [(0, 1), (4, 1), (5, 1), (13, 1), (16, 1)],
  term ((230223 : Rat) / 82478) [(0, 1), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((230223 : Rat) / 82478) [(1, 1), (5, 1), (13, 2), (16, 1)],
  term ((-230223 : Rat) / 82478) [(1, 1), (5, 2), (13, 1), (16, 1)],
  term ((230223 : Rat) / 164956) [(4, 2), (5, 1), (13, 1), (16, 1)],
  term ((-230223 : Rat) / 164956) [(5, 1), (12, 2), (13, 1), (16, 1)],
  term ((-230223 : Rat) / 164956) [(5, 1), (13, 3), (16, 1)],
  term ((230223 : Rat) / 164956) [(5, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 9. -/
theorem rs_R005_ueqv_R005YNY_partial_09_0034_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_09_0034
        rs_R005_ueqv_R005YNY_generator_09_0000_0059 =
      rs_R005_ueqv_R005YNY_partial_09_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 9. -/
def rs_R005_ueqv_R005YNY_coefficient_09_0035 : Poly :=
[
  term ((-1173900 : Rat) / 41239) [(5, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 35 for generator 9. -/
def rs_R005_ueqv_R005YNY_partial_09_0035 : Poly :=
[
  term ((2347800 : Rat) / 41239) [(0, 1), (4, 1), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((-2347800 : Rat) / 41239) [(0, 1), (5, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-2347800 : Rat) / 41239) [(1, 1), (5, 1), (13, 3), (15, 1), (16, 1)],
  term ((2347800 : Rat) / 41239) [(1, 1), (5, 2), (13, 2), (15, 1), (16, 1)],
  term ((-1173900 : Rat) / 41239) [(4, 2), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((1173900 : Rat) / 41239) [(5, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((1173900 : Rat) / 41239) [(5, 1), (13, 4), (15, 1), (16, 1)],
  term ((-1173900 : Rat) / 41239) [(5, 3), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 9. -/
theorem rs_R005_ueqv_R005YNY_partial_09_0035_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_09_0035
        rs_R005_ueqv_R005YNY_generator_09_0000_0059 =
      rs_R005_ueqv_R005YNY_partial_09_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 9. -/
def rs_R005_ueqv_R005YNY_coefficient_09_0036 : Poly :=
[
  term ((-1681932 : Rat) / 41239) [(5, 1), (13, 3), (16, 1)]
]

/-- Partial product 36 for generator 9. -/
def rs_R005_ueqv_R005YNY_partial_09_0036 : Poly :=
[
  term ((3363864 : Rat) / 41239) [(0, 1), (4, 1), (5, 1), (13, 3), (16, 1)],
  term ((-3363864 : Rat) / 41239) [(0, 1), (5, 1), (12, 1), (13, 3), (16, 1)],
  term ((-3363864 : Rat) / 41239) [(1, 1), (5, 1), (13, 4), (16, 1)],
  term ((3363864 : Rat) / 41239) [(1, 1), (5, 2), (13, 3), (16, 1)],
  term ((-1681932 : Rat) / 41239) [(4, 2), (5, 1), (13, 3), (16, 1)],
  term ((1681932 : Rat) / 41239) [(5, 1), (12, 2), (13, 3), (16, 1)],
  term ((1681932 : Rat) / 41239) [(5, 1), (13, 5), (16, 1)],
  term ((-1681932 : Rat) / 41239) [(5, 3), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 9. -/
theorem rs_R005_ueqv_R005YNY_partial_09_0036_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_09_0036
        rs_R005_ueqv_R005YNY_generator_09_0000_0059 =
      rs_R005_ueqv_R005YNY_partial_09_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 9. -/
def rs_R005_ueqv_R005YNY_coefficient_09_0037 : Poly :=
[
  term ((-3578253 : Rat) / 82478) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 37 for generator 9. -/
def rs_R005_ueqv_R005YNY_partial_09_0037 : Poly :=
[
  term ((3578253 : Rat) / 41239) [(0, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-3578253 : Rat) / 41239) [(0, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3578253 : Rat) / 41239) [(1, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((3578253 : Rat) / 41239) [(1, 1), (5, 2), (15, 1), (16, 1)],
  term ((-3578253 : Rat) / 82478) [(4, 2), (5, 1), (15, 1), (16, 1)],
  term ((3578253 : Rat) / 82478) [(5, 1), (12, 2), (15, 1), (16, 1)],
  term ((3578253 : Rat) / 82478) [(5, 1), (13, 2), (15, 1), (16, 1)],
  term ((-3578253 : Rat) / 82478) [(5, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 9. -/
theorem rs_R005_ueqv_R005YNY_partial_09_0037_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_09_0037
        rs_R005_ueqv_R005YNY_generator_09_0000_0059 =
      rs_R005_ueqv_R005YNY_partial_09_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 9. -/
def rs_R005_ueqv_R005YNY_coefficient_09_0038 : Poly :=
[
  term ((1767645 : Rat) / 26243) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 38 for generator 9. -/
def rs_R005_ueqv_R005YNY_partial_09_0038 : Poly :=
[
  term ((-3535290 : Rat) / 26243) [(0, 1), (4, 1), (7, 1), (13, 1), (16, 1)],
  term ((3535290 : Rat) / 26243) [(0, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-3535290 : Rat) / 26243) [(1, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((3535290 : Rat) / 26243) [(1, 1), (7, 1), (13, 2), (16, 1)],
  term ((1767645 : Rat) / 26243) [(4, 2), (7, 1), (13, 1), (16, 1)],
  term ((1767645 : Rat) / 26243) [(5, 2), (7, 1), (13, 1), (16, 1)],
  term ((-1767645 : Rat) / 26243) [(7, 1), (12, 2), (13, 1), (16, 1)],
  term ((-1767645 : Rat) / 26243) [(7, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 9. -/
theorem rs_R005_ueqv_R005YNY_partial_09_0038_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_09_0038
        rs_R005_ueqv_R005YNY_generator_09_0000_0059 =
      rs_R005_ueqv_R005YNY_partial_09_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 9. -/
def rs_R005_ueqv_R005YNY_coefficient_09_0039 : Poly :=
[
  term ((2049441 : Rat) / 26243) [(7, 1), (13, 3), (16, 1)]
]

/-- Partial product 39 for generator 9. -/
def rs_R005_ueqv_R005YNY_partial_09_0039 : Poly :=
[
  term ((-4098882 : Rat) / 26243) [(0, 1), (4, 1), (7, 1), (13, 3), (16, 1)],
  term ((4098882 : Rat) / 26243) [(0, 1), (7, 1), (12, 1), (13, 3), (16, 1)],
  term ((-4098882 : Rat) / 26243) [(1, 1), (5, 1), (7, 1), (13, 3), (16, 1)],
  term ((4098882 : Rat) / 26243) [(1, 1), (7, 1), (13, 4), (16, 1)],
  term ((2049441 : Rat) / 26243) [(4, 2), (7, 1), (13, 3), (16, 1)],
  term ((2049441 : Rat) / 26243) [(5, 2), (7, 1), (13, 3), (16, 1)],
  term ((-2049441 : Rat) / 26243) [(7, 1), (12, 2), (13, 3), (16, 1)],
  term ((-2049441 : Rat) / 26243) [(7, 1), (13, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 9. -/
theorem rs_R005_ueqv_R005YNY_partial_09_0039_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_09_0039
        rs_R005_ueqv_R005YNY_generator_09_0000_0059 =
      rs_R005_ueqv_R005YNY_partial_09_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 9. -/
def rs_R005_ueqv_R005YNY_coefficient_09_0040 : Poly :=
[
  term ((627816 : Rat) / 3749) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 40 for generator 9. -/
def rs_R005_ueqv_R005YNY_partial_09_0040 : Poly :=
[
  term ((-1255632 : Rat) / 3749) [(0, 1), (4, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((1255632 : Rat) / 3749) [(0, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1255632 : Rat) / 3749) [(1, 1), (5, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((1255632 : Rat) / 3749) [(1, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((627816 : Rat) / 3749) [(4, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((627816 : Rat) / 3749) [(5, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-627816 : Rat) / 3749) [(8, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-627816 : Rat) / 3749) [(8, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 9. -/
theorem rs_R005_ueqv_R005YNY_partial_09_0040_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_09_0040
        rs_R005_ueqv_R005YNY_generator_09_0000_0059 =
      rs_R005_ueqv_R005YNY_partial_09_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 9. -/
def rs_R005_ueqv_R005YNY_coefficient_09_0041 : Poly :=
[
  term ((-1121100 : Rat) / 3749) [(8, 1), (13, 2), (16, 1)]
]

/-- Partial product 41 for generator 9. -/
def rs_R005_ueqv_R005YNY_partial_09_0041 : Poly :=
[
  term ((2242200 : Rat) / 3749) [(0, 1), (4, 1), (8, 1), (13, 2), (16, 1)],
  term ((-2242200 : Rat) / 3749) [(0, 1), (8, 1), (12, 1), (13, 2), (16, 1)],
  term ((2242200 : Rat) / 3749) [(1, 1), (5, 1), (8, 1), (13, 2), (16, 1)],
  term ((-2242200 : Rat) / 3749) [(1, 1), (8, 1), (13, 3), (16, 1)],
  term ((-1121100 : Rat) / 3749) [(4, 2), (8, 1), (13, 2), (16, 1)],
  term ((-1121100 : Rat) / 3749) [(5, 2), (8, 1), (13, 2), (16, 1)],
  term ((1121100 : Rat) / 3749) [(8, 1), (12, 2), (13, 2), (16, 1)],
  term ((1121100 : Rat) / 3749) [(8, 1), (13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 9. -/
theorem rs_R005_ueqv_R005YNY_partial_09_0041_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_09_0041
        rs_R005_ueqv_R005YNY_generator_09_0000_0059 =
      rs_R005_ueqv_R005YNY_partial_09_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 9. -/
def rs_R005_ueqv_R005YNY_coefficient_09_0042 : Poly :=
[
  term ((36990 : Rat) / 3749) [(8, 1), (16, 1)]
]

/-- Partial product 42 for generator 9. -/
def rs_R005_ueqv_R005YNY_partial_09_0042 : Poly :=
[
  term ((-73980 : Rat) / 3749) [(0, 1), (4, 1), (8, 1), (16, 1)],
  term ((73980 : Rat) / 3749) [(0, 1), (8, 1), (12, 1), (16, 1)],
  term ((-73980 : Rat) / 3749) [(1, 1), (5, 1), (8, 1), (16, 1)],
  term ((73980 : Rat) / 3749) [(1, 1), (8, 1), (13, 1), (16, 1)],
  term ((36990 : Rat) / 3749) [(4, 2), (8, 1), (16, 1)],
  term ((36990 : Rat) / 3749) [(5, 2), (8, 1), (16, 1)],
  term ((-36990 : Rat) / 3749) [(8, 1), (12, 2), (16, 1)],
  term ((-36990 : Rat) / 3749) [(8, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 9. -/
theorem rs_R005_ueqv_R005YNY_partial_09_0042_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_09_0042
        rs_R005_ueqv_R005YNY_generator_09_0000_0059 =
      rs_R005_ueqv_R005YNY_partial_09_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 9. -/
def rs_R005_ueqv_R005YNY_coefficient_09_0043 : Poly :=
[
  term ((1591741 : Rat) / 52486) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 43 for generator 9. -/
def rs_R005_ueqv_R005YNY_partial_09_0043 : Poly :=
[
  term ((-1591741 : Rat) / 26243) [(0, 1), (4, 1), (9, 1), (13, 1), (16, 1)],
  term ((1591741 : Rat) / 26243) [(0, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1591741 : Rat) / 26243) [(1, 1), (5, 1), (9, 1), (13, 1), (16, 1)],
  term ((1591741 : Rat) / 26243) [(1, 1), (9, 1), (13, 2), (16, 1)],
  term ((1591741 : Rat) / 52486) [(4, 2), (9, 1), (13, 1), (16, 1)],
  term ((1591741 : Rat) / 52486) [(5, 2), (9, 1), (13, 1), (16, 1)],
  term ((-1591741 : Rat) / 52486) [(9, 1), (12, 2), (13, 1), (16, 1)],
  term ((-1591741 : Rat) / 52486) [(9, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 9. -/
theorem rs_R005_ueqv_R005YNY_partial_09_0043_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_09_0043
        rs_R005_ueqv_R005YNY_generator_09_0000_0059 =
      rs_R005_ueqv_R005YNY_partial_09_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 9. -/
def rs_R005_ueqv_R005YNY_coefficient_09_0044 : Poly :=
[
  term ((3571311 : Rat) / 52486) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 44 for generator 9. -/
def rs_R005_ueqv_R005YNY_partial_09_0044 : Poly :=
[
  term ((-3571311 : Rat) / 26243) [(0, 1), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((3571311 : Rat) / 26243) [(0, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3571311 : Rat) / 26243) [(1, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((3571311 : Rat) / 26243) [(1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((3571311 : Rat) / 52486) [(4, 2), (9, 1), (15, 1), (16, 1)],
  term ((3571311 : Rat) / 52486) [(5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-3571311 : Rat) / 52486) [(9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-3571311 : Rat) / 52486) [(9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 9. -/
theorem rs_R005_ueqv_R005YNY_partial_09_0044_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_09_0044
        rs_R005_ueqv_R005YNY_generator_09_0000_0059 =
      rs_R005_ueqv_R005YNY_partial_09_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 9. -/
def rs_R005_ueqv_R005YNY_coefficient_09_0045 : Poly :=
[
  term ((-256977 : Rat) / 3749) [(9, 2), (16, 1)]
]

/-- Partial product 45 for generator 9. -/
def rs_R005_ueqv_R005YNY_partial_09_0045 : Poly :=
[
  term ((513954 : Rat) / 3749) [(0, 1), (4, 1), (9, 2), (16, 1)],
  term ((-513954 : Rat) / 3749) [(0, 1), (9, 2), (12, 1), (16, 1)],
  term ((513954 : Rat) / 3749) [(1, 1), (5, 1), (9, 2), (16, 1)],
  term ((-513954 : Rat) / 3749) [(1, 1), (9, 2), (13, 1), (16, 1)],
  term ((-256977 : Rat) / 3749) [(4, 2), (9, 2), (16, 1)],
  term ((-256977 : Rat) / 3749) [(5, 2), (9, 2), (16, 1)],
  term ((256977 : Rat) / 3749) [(9, 2), (12, 2), (16, 1)],
  term ((256977 : Rat) / 3749) [(9, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 9. -/
theorem rs_R005_ueqv_R005YNY_partial_09_0045_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_09_0045
        rs_R005_ueqv_R005YNY_generator_09_0000_0059 =
      rs_R005_ueqv_R005YNY_partial_09_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 9. -/
def rs_R005_ueqv_R005YNY_coefficient_09_0046 : Poly :=
[
  term ((-156561 : Rat) / 2282) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 46 for generator 9. -/
def rs_R005_ueqv_R005YNY_partial_09_0046 : Poly :=
[
  term ((156561 : Rat) / 1141) [(0, 1), (4, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-156561 : Rat) / 1141) [(0, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((156561 : Rat) / 1141) [(1, 1), (5, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-156561 : Rat) / 1141) [(1, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-156561 : Rat) / 2282) [(4, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-156561 : Rat) / 2282) [(5, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((156561 : Rat) / 2282) [(10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((156561 : Rat) / 2282) [(10, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 9. -/
theorem rs_R005_ueqv_R005YNY_partial_09_0046_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_09_0046
        rs_R005_ueqv_R005YNY_generator_09_0000_0059 =
      rs_R005_ueqv_R005YNY_partial_09_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 9. -/
def rs_R005_ueqv_R005YNY_coefficient_09_0047 : Poly :=
[
  term ((775731 : Rat) / 26243) [(10, 1), (13, 2), (16, 1)]
]

/-- Partial product 47 for generator 9. -/
def rs_R005_ueqv_R005YNY_partial_09_0047 : Poly :=
[
  term ((-1551462 : Rat) / 26243) [(0, 1), (4, 1), (10, 1), (13, 2), (16, 1)],
  term ((1551462 : Rat) / 26243) [(0, 1), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((-1551462 : Rat) / 26243) [(1, 1), (5, 1), (10, 1), (13, 2), (16, 1)],
  term ((1551462 : Rat) / 26243) [(1, 1), (10, 1), (13, 3), (16, 1)],
  term ((775731 : Rat) / 26243) [(4, 2), (10, 1), (13, 2), (16, 1)],
  term ((775731 : Rat) / 26243) [(5, 2), (10, 1), (13, 2), (16, 1)],
  term ((-775731 : Rat) / 26243) [(10, 1), (12, 2), (13, 2), (16, 1)],
  term ((-775731 : Rat) / 26243) [(10, 1), (13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 9. -/
theorem rs_R005_ueqv_R005YNY_partial_09_0047_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_09_0047
        rs_R005_ueqv_R005YNY_generator_09_0000_0059 =
      rs_R005_ueqv_R005YNY_partial_09_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 9. -/
def rs_R005_ueqv_R005YNY_coefficient_09_0048 : Poly :=
[
  term ((154953 : Rat) / 3749) [(10, 1), (16, 1)]
]

/-- Partial product 48 for generator 9. -/
def rs_R005_ueqv_R005YNY_partial_09_0048 : Poly :=
[
  term ((-309906 : Rat) / 3749) [(0, 1), (4, 1), (10, 1), (16, 1)],
  term ((309906 : Rat) / 3749) [(0, 1), (10, 1), (12, 1), (16, 1)],
  term ((-309906 : Rat) / 3749) [(1, 1), (5, 1), (10, 1), (16, 1)],
  term ((309906 : Rat) / 3749) [(1, 1), (10, 1), (13, 1), (16, 1)],
  term ((154953 : Rat) / 3749) [(4, 2), (10, 1), (16, 1)],
  term ((154953 : Rat) / 3749) [(5, 2), (10, 1), (16, 1)],
  term ((-154953 : Rat) / 3749) [(10, 1), (12, 2), (16, 1)],
  term ((-154953 : Rat) / 3749) [(10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 9. -/
theorem rs_R005_ueqv_R005YNY_partial_09_0048_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_09_0048
        rs_R005_ueqv_R005YNY_generator_09_0000_0059 =
      rs_R005_ueqv_R005YNY_partial_09_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 9. -/
def rs_R005_ueqv_R005YNY_coefficient_09_0049 : Poly :=
[
  term ((14423799 : Rat) / 104972) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 49 for generator 9. -/
def rs_R005_ueqv_R005YNY_partial_09_0049 : Poly :=
[
  term ((-14423799 : Rat) / 52486) [(0, 1), (4, 1), (11, 1), (13, 1), (16, 1)],
  term ((14423799 : Rat) / 52486) [(0, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-14423799 : Rat) / 52486) [(1, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((14423799 : Rat) / 52486) [(1, 1), (11, 1), (13, 2), (16, 1)],
  term ((14423799 : Rat) / 104972) [(4, 2), (11, 1), (13, 1), (16, 1)],
  term ((14423799 : Rat) / 104972) [(5, 2), (11, 1), (13, 1), (16, 1)],
  term ((-14423799 : Rat) / 104972) [(11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-14423799 : Rat) / 104972) [(11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 9. -/
theorem rs_R005_ueqv_R005YNY_partial_09_0049_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_09_0049
        rs_R005_ueqv_R005YNY_generator_09_0000_0059 =
      rs_R005_ueqv_R005YNY_partial_09_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 9. -/
def rs_R005_ueqv_R005YNY_coefficient_09_0050 : Poly :=
[
  term ((269064 : Rat) / 3749) [(11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 50 for generator 9. -/
def rs_R005_ueqv_R005YNY_partial_09_0050 : Poly :=
[
  term ((-538128 : Rat) / 3749) [(0, 1), (4, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((538128 : Rat) / 3749) [(0, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-538128 : Rat) / 3749) [(1, 1), (5, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((538128 : Rat) / 3749) [(1, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((269064 : Rat) / 3749) [(4, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((269064 : Rat) / 3749) [(5, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-269064 : Rat) / 3749) [(11, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-269064 : Rat) / 3749) [(11, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 9. -/
theorem rs_R005_ueqv_R005YNY_partial_09_0050_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_09_0050
        rs_R005_ueqv_R005YNY_generator_09_0000_0059 =
      rs_R005_ueqv_R005YNY_partial_09_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 9. -/
def rs_R005_ueqv_R005YNY_coefficient_09_0051 : Poly :=
[
  term ((-538128 : Rat) / 3749) [(11, 1), (13, 3), (16, 1)]
]

/-- Partial product 51 for generator 9. -/
def rs_R005_ueqv_R005YNY_partial_09_0051 : Poly :=
[
  term ((1076256 : Rat) / 3749) [(0, 1), (4, 1), (11, 1), (13, 3), (16, 1)],
  term ((-1076256 : Rat) / 3749) [(0, 1), (11, 1), (12, 1), (13, 3), (16, 1)],
  term ((1076256 : Rat) / 3749) [(1, 1), (5, 1), (11, 1), (13, 3), (16, 1)],
  term ((-1076256 : Rat) / 3749) [(1, 1), (11, 1), (13, 4), (16, 1)],
  term ((-538128 : Rat) / 3749) [(4, 2), (11, 1), (13, 3), (16, 1)],
  term ((-538128 : Rat) / 3749) [(5, 2), (11, 1), (13, 3), (16, 1)],
  term ((538128 : Rat) / 3749) [(11, 1), (12, 2), (13, 3), (16, 1)],
  term ((538128 : Rat) / 3749) [(11, 1), (13, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 9. -/
theorem rs_R005_ueqv_R005YNY_partial_09_0051_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_09_0051
        rs_R005_ueqv_R005YNY_generator_09_0000_0059 =
      rs_R005_ueqv_R005YNY_partial_09_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 9. -/
def rs_R005_ueqv_R005YNY_coefficient_09_0052 : Poly :=
[
  term ((-193266 : Rat) / 3749) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 52 for generator 9. -/
def rs_R005_ueqv_R005YNY_partial_09_0052 : Poly :=
[
  term ((386532 : Rat) / 3749) [(0, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-386532 : Rat) / 3749) [(0, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((386532 : Rat) / 3749) [(1, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-386532 : Rat) / 3749) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-193266 : Rat) / 3749) [(4, 2), (11, 1), (15, 1), (16, 1)],
  term ((-193266 : Rat) / 3749) [(5, 2), (11, 1), (15, 1), (16, 1)],
  term ((193266 : Rat) / 3749) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((193266 : Rat) / 3749) [(11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 9. -/
theorem rs_R005_ueqv_R005YNY_partial_09_0052_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_09_0052
        rs_R005_ueqv_R005YNY_generator_09_0000_0059 =
      rs_R005_ueqv_R005YNY_partial_09_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 9. -/
def rs_R005_ueqv_R005YNY_coefficient_09_0053 : Poly :=
[
  term ((-74523285 : Rat) / 209944) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 53 for generator 9. -/
def rs_R005_ueqv_R005YNY_partial_09_0053 : Poly :=
[
  term ((74523285 : Rat) / 104972) [(0, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-74523285 : Rat) / 104972) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((74523285 : Rat) / 104972) [(1, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-74523285 : Rat) / 104972) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((-74523285 : Rat) / 209944) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term ((-74523285 : Rat) / 209944) [(5, 2), (13, 1), (15, 1), (16, 1)],
  term ((74523285 : Rat) / 209944) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((74523285 : Rat) / 209944) [(13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 9. -/
theorem rs_R005_ueqv_R005YNY_partial_09_0053_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_09_0053
        rs_R005_ueqv_R005YNY_generator_09_0000_0059 =
      rs_R005_ueqv_R005YNY_partial_09_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 9. -/
def rs_R005_ueqv_R005YNY_coefficient_09_0054 : Poly :=
[
  term ((2049441 : Rat) / 104972) [(13, 2), (15, 2), (16, 1)]
]

/-- Partial product 54 for generator 9. -/
def rs_R005_ueqv_R005YNY_partial_09_0054 : Poly :=
[
  term ((-2049441 : Rat) / 52486) [(0, 1), (4, 1), (13, 2), (15, 2), (16, 1)],
  term ((2049441 : Rat) / 52486) [(0, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-2049441 : Rat) / 52486) [(1, 1), (5, 1), (13, 2), (15, 2), (16, 1)],
  term ((2049441 : Rat) / 52486) [(1, 1), (13, 3), (15, 2), (16, 1)],
  term ((2049441 : Rat) / 104972) [(4, 2), (13, 2), (15, 2), (16, 1)],
  term ((2049441 : Rat) / 104972) [(5, 2), (13, 2), (15, 2), (16, 1)],
  term ((-2049441 : Rat) / 104972) [(12, 2), (13, 2), (15, 2), (16, 1)],
  term ((-2049441 : Rat) / 104972) [(13, 4), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 9. -/
theorem rs_R005_ueqv_R005YNY_partial_09_0054_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_09_0054
        rs_R005_ueqv_R005YNY_generator_09_0000_0059 =
      rs_R005_ueqv_R005YNY_partial_09_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 9. -/
def rs_R005_ueqv_R005YNY_coefficient_09_0055 : Poly :=
[
  term ((7426305 : Rat) / 59984) [(13, 2), (16, 1)]
]

/-- Partial product 55 for generator 9. -/
def rs_R005_ueqv_R005YNY_partial_09_0055 : Poly :=
[
  term ((-7426305 : Rat) / 29992) [(0, 1), (4, 1), (13, 2), (16, 1)],
  term ((7426305 : Rat) / 29992) [(0, 1), (12, 1), (13, 2), (16, 1)],
  term ((-7426305 : Rat) / 29992) [(1, 1), (5, 1), (13, 2), (16, 1)],
  term ((7426305 : Rat) / 29992) [(1, 1), (13, 3), (16, 1)],
  term ((7426305 : Rat) / 59984) [(4, 2), (13, 2), (16, 1)],
  term ((7426305 : Rat) / 59984) [(5, 2), (13, 2), (16, 1)],
  term ((-7426305 : Rat) / 59984) [(12, 2), (13, 2), (16, 1)],
  term ((-7426305 : Rat) / 59984) [(13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 9. -/
theorem rs_R005_ueqv_R005YNY_partial_09_0055_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_09_0055
        rs_R005_ueqv_R005YNY_generator_09_0000_0059 =
      rs_R005_ueqv_R005YNY_partial_09_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 9. -/
def rs_R005_ueqv_R005YNY_coefficient_09_0056 : Poly :=
[
  term ((-2566595 : Rat) / 26243) [(13, 3), (15, 1), (16, 1)]
]

/-- Partial product 56 for generator 9. -/
def rs_R005_ueqv_R005YNY_partial_09_0056 : Poly :=
[
  term ((5133190 : Rat) / 26243) [(0, 1), (4, 1), (13, 3), (15, 1), (16, 1)],
  term ((-5133190 : Rat) / 26243) [(0, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((5133190 : Rat) / 26243) [(1, 1), (5, 1), (13, 3), (15, 1), (16, 1)],
  term ((-5133190 : Rat) / 26243) [(1, 1), (13, 4), (15, 1), (16, 1)],
  term ((-2566595 : Rat) / 26243) [(4, 2), (13, 3), (15, 1), (16, 1)],
  term ((-2566595 : Rat) / 26243) [(5, 2), (13, 3), (15, 1), (16, 1)],
  term ((2566595 : Rat) / 26243) [(12, 2), (13, 3), (15, 1), (16, 1)],
  term ((2566595 : Rat) / 26243) [(13, 5), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 9. -/
theorem rs_R005_ueqv_R005YNY_partial_09_0056_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_09_0056
        rs_R005_ueqv_R005YNY_generator_09_0000_0059 =
      rs_R005_ueqv_R005YNY_partial_09_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 9. -/
def rs_R005_ueqv_R005YNY_coefficient_09_0057 : Poly :=
[
  term ((3083749 : Rat) / 26243) [(13, 4), (16, 1)]
]

/-- Partial product 57 for generator 9. -/
def rs_R005_ueqv_R005YNY_partial_09_0057 : Poly :=
[
  term ((-6167498 : Rat) / 26243) [(0, 1), (4, 1), (13, 4), (16, 1)],
  term ((6167498 : Rat) / 26243) [(0, 1), (12, 1), (13, 4), (16, 1)],
  term ((-6167498 : Rat) / 26243) [(1, 1), (5, 1), (13, 4), (16, 1)],
  term ((6167498 : Rat) / 26243) [(1, 1), (13, 5), (16, 1)],
  term ((3083749 : Rat) / 26243) [(4, 2), (13, 4), (16, 1)],
  term ((3083749 : Rat) / 26243) [(5, 2), (13, 4), (16, 1)],
  term ((-3083749 : Rat) / 26243) [(12, 2), (13, 4), (16, 1)],
  term ((-3083749 : Rat) / 26243) [(13, 6), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 9. -/
theorem rs_R005_ueqv_R005YNY_partial_09_0057_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_09_0057
        rs_R005_ueqv_R005YNY_generator_09_0000_0059 =
      rs_R005_ueqv_R005YNY_partial_09_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 9. -/
def rs_R005_ueqv_R005YNY_coefficient_09_0058 : Poly :=
[
  term ((10915979 : Rat) / 52486) [(15, 2), (16, 1)]
]

/-- Partial product 58 for generator 9. -/
def rs_R005_ueqv_R005YNY_partial_09_0058 : Poly :=
[
  term ((-10915979 : Rat) / 26243) [(0, 1), (4, 1), (15, 2), (16, 1)],
  term ((10915979 : Rat) / 26243) [(0, 1), (12, 1), (15, 2), (16, 1)],
  term ((-10915979 : Rat) / 26243) [(1, 1), (5, 1), (15, 2), (16, 1)],
  term ((10915979 : Rat) / 26243) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((10915979 : Rat) / 52486) [(4, 2), (15, 2), (16, 1)],
  term ((10915979 : Rat) / 52486) [(5, 2), (15, 2), (16, 1)],
  term ((-10915979 : Rat) / 52486) [(12, 2), (15, 2), (16, 1)],
  term ((-10915979 : Rat) / 52486) [(13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 9. -/
theorem rs_R005_ueqv_R005YNY_partial_09_0058_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_09_0058
        rs_R005_ueqv_R005YNY_generator_09_0000_0059 =
      rs_R005_ueqv_R005YNY_partial_09_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 9. -/
def rs_R005_ueqv_R005YNY_coefficient_09_0059 : Poly :=
[
  term ((-4330331 : Rat) / 209944) [(16, 1)]
]

/-- Partial product 59 for generator 9. -/
def rs_R005_ueqv_R005YNY_partial_09_0059 : Poly :=
[
  term ((4330331 : Rat) / 104972) [(0, 1), (4, 1), (16, 1)],
  term ((-4330331 : Rat) / 104972) [(0, 1), (12, 1), (16, 1)],
  term ((4330331 : Rat) / 104972) [(1, 1), (5, 1), (16, 1)],
  term ((-4330331 : Rat) / 104972) [(1, 1), (13, 1), (16, 1)],
  term ((-4330331 : Rat) / 209944) [(4, 2), (16, 1)],
  term ((-4330331 : Rat) / 209944) [(5, 2), (16, 1)],
  term ((4330331 : Rat) / 209944) [(12, 2), (16, 1)],
  term ((4330331 : Rat) / 209944) [(13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 9. -/
theorem rs_R005_ueqv_R005YNY_partial_09_0059_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_09_0059
        rs_R005_ueqv_R005YNY_generator_09_0000_0059 =
      rs_R005_ueqv_R005YNY_partial_09_0059 := by
  native_decide

/-- Partial products in this block. -/
def rs_R005_ueqv_R005YNY_partials_09_0000_0059 : List Poly :=
[
  rs_R005_ueqv_R005YNY_partial_09_0000,
  rs_R005_ueqv_R005YNY_partial_09_0001,
  rs_R005_ueqv_R005YNY_partial_09_0002,
  rs_R005_ueqv_R005YNY_partial_09_0003,
  rs_R005_ueqv_R005YNY_partial_09_0004,
  rs_R005_ueqv_R005YNY_partial_09_0005,
  rs_R005_ueqv_R005YNY_partial_09_0006,
  rs_R005_ueqv_R005YNY_partial_09_0007,
  rs_R005_ueqv_R005YNY_partial_09_0008,
  rs_R005_ueqv_R005YNY_partial_09_0009,
  rs_R005_ueqv_R005YNY_partial_09_0010,
  rs_R005_ueqv_R005YNY_partial_09_0011,
  rs_R005_ueqv_R005YNY_partial_09_0012,
  rs_R005_ueqv_R005YNY_partial_09_0013,
  rs_R005_ueqv_R005YNY_partial_09_0014,
  rs_R005_ueqv_R005YNY_partial_09_0015,
  rs_R005_ueqv_R005YNY_partial_09_0016,
  rs_R005_ueqv_R005YNY_partial_09_0017,
  rs_R005_ueqv_R005YNY_partial_09_0018,
  rs_R005_ueqv_R005YNY_partial_09_0019,
  rs_R005_ueqv_R005YNY_partial_09_0020,
  rs_R005_ueqv_R005YNY_partial_09_0021,
  rs_R005_ueqv_R005YNY_partial_09_0022,
  rs_R005_ueqv_R005YNY_partial_09_0023,
  rs_R005_ueqv_R005YNY_partial_09_0024,
  rs_R005_ueqv_R005YNY_partial_09_0025,
  rs_R005_ueqv_R005YNY_partial_09_0026,
  rs_R005_ueqv_R005YNY_partial_09_0027,
  rs_R005_ueqv_R005YNY_partial_09_0028,
  rs_R005_ueqv_R005YNY_partial_09_0029,
  rs_R005_ueqv_R005YNY_partial_09_0030,
  rs_R005_ueqv_R005YNY_partial_09_0031,
  rs_R005_ueqv_R005YNY_partial_09_0032,
  rs_R005_ueqv_R005YNY_partial_09_0033,
  rs_R005_ueqv_R005YNY_partial_09_0034,
  rs_R005_ueqv_R005YNY_partial_09_0035,
  rs_R005_ueqv_R005YNY_partial_09_0036,
  rs_R005_ueqv_R005YNY_partial_09_0037,
  rs_R005_ueqv_R005YNY_partial_09_0038,
  rs_R005_ueqv_R005YNY_partial_09_0039,
  rs_R005_ueqv_R005YNY_partial_09_0040,
  rs_R005_ueqv_R005YNY_partial_09_0041,
  rs_R005_ueqv_R005YNY_partial_09_0042,
  rs_R005_ueqv_R005YNY_partial_09_0043,
  rs_R005_ueqv_R005YNY_partial_09_0044,
  rs_R005_ueqv_R005YNY_partial_09_0045,
  rs_R005_ueqv_R005YNY_partial_09_0046,
  rs_R005_ueqv_R005YNY_partial_09_0047,
  rs_R005_ueqv_R005YNY_partial_09_0048,
  rs_R005_ueqv_R005YNY_partial_09_0049,
  rs_R005_ueqv_R005YNY_partial_09_0050,
  rs_R005_ueqv_R005YNY_partial_09_0051,
  rs_R005_ueqv_R005YNY_partial_09_0052,
  rs_R005_ueqv_R005YNY_partial_09_0053,
  rs_R005_ueqv_R005YNY_partial_09_0054,
  rs_R005_ueqv_R005YNY_partial_09_0055,
  rs_R005_ueqv_R005YNY_partial_09_0056,
  rs_R005_ueqv_R005YNY_partial_09_0057,
  rs_R005_ueqv_R005YNY_partial_09_0058,
  rs_R005_ueqv_R005YNY_partial_09_0059
]

/-- Sum of partial products in this block. -/
def rs_R005_ueqv_R005YNY_block_09_0000_0059 : Poly :=
[
  term ((-13937792 : Rat) / 26243) [(0, 1), (3, 1), (4, 1), (13, 1), (16, 1)],
  term ((6968896 : Rat) / 26243) [(0, 1), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((13937792 : Rat) / 26243) [(0, 1), (3, 1), (12, 1), (13, 1), (16, 1)],
  term ((-6968896 : Rat) / 26243) [(0, 1), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-8059464 : Rat) / 41239) [(0, 1), (4, 1), (5, 1), (7, 1), (13, 2), (16, 1)],
  term ((2481444 : Rat) / 41239) [(0, 1), (4, 1), (5, 1), (7, 1), (16, 1)],
  term ((-10716048 : Rat) / 41239) [(0, 1), (4, 1), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((5442696 : Rat) / 41239) [(0, 1), (4, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-6199872 : Rat) / 41239) [(0, 1), (4, 1), (5, 1), (9, 1), (16, 1)],
  term ((8567496 : Rat) / 41239) [(0, 1), (4, 1), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((-412524 : Rat) / 3749) [(0, 1), (4, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((338688 : Rat) / 41239) [(0, 1), (4, 1), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-677376 : Rat) / 41239) [(0, 1), (4, 1), (5, 1), (11, 1), (13, 2), (16, 1)],
  term ((206262 : Rat) / 3749) [(0, 1), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((-2014866 : Rat) / 41239) [(0, 1), (4, 1), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((-230223 : Rat) / 82478) [(0, 1), (4, 1), (5, 1), (13, 1), (16, 1)],
  term ((2347800 : Rat) / 41239) [(0, 1), (4, 1), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((3363864 : Rat) / 41239) [(0, 1), (4, 1), (5, 1), (13, 3), (16, 1)],
  term ((3578253 : Rat) / 41239) [(0, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((658728 : Rat) / 3749) [(0, 1), (4, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-156240 : Rat) / 3749) [(0, 1), (4, 1), (7, 1), (12, 1), (13, 3), (16, 1)],
  term ((-3535290 : Rat) / 26243) [(0, 1), (4, 1), (7, 1), (13, 1), (16, 1)],
  term ((-4098882 : Rat) / 26243) [(0, 1), (4, 1), (7, 1), (13, 3), (16, 1)],
  term ((931392 : Rat) / 3749) [(0, 1), (4, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1663200 : Rat) / 3749) [(0, 1), (4, 1), (8, 1), (12, 1), (13, 2), (16, 1)],
  term ((104076 : Rat) / 3749) [(0, 1), (4, 1), (8, 1), (12, 1), (16, 1)],
  term ((-1255632 : Rat) / 3749) [(0, 1), (4, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((2242200 : Rat) / 3749) [(0, 1), (4, 1), (8, 1), (13, 2), (16, 1)],
  term ((-73980 : Rat) / 3749) [(0, 1), (4, 1), (8, 1), (16, 1)],
  term ((-936600 : Rat) / 3749) [(0, 1), (4, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((148680 : Rat) / 3749) [(0, 1), (4, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1591741 : Rat) / 26243) [(0, 1), (4, 1), (9, 1), (13, 1), (16, 1)],
  term ((-3571311 : Rat) / 26243) [(0, 1), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((513954 : Rat) / 3749) [(0, 1), (4, 1), (9, 2), (16, 1)],
  term ((-676872 : Rat) / 3749) [(0, 1), (4, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((754992 : Rat) / 3749) [(0, 1), (4, 1), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((133812 : Rat) / 3749) [(0, 1), (4, 1), (10, 1), (12, 1), (16, 1)],
  term ((156561 : Rat) / 1141) [(0, 1), (4, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1551462 : Rat) / 26243) [(0, 1), (4, 1), (10, 1), (13, 2), (16, 1)],
  term ((-309906 : Rat) / 3749) [(0, 1), (4, 1), (10, 1), (16, 1)],
  term ((516852 : Rat) / 3749) [(0, 1), (4, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((399168 : Rat) / 3749) [(0, 1), (4, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-798336 : Rat) / 3749) [(0, 1), (4, 1), (11, 1), (12, 1), (13, 3), (16, 1)],
  term ((-89208 : Rat) / 3749) [(0, 1), (4, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-14423799 : Rat) / 52486) [(0, 1), (4, 1), (11, 1), (13, 1), (16, 1)],
  term ((-538128 : Rat) / 3749) [(0, 1), (4, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((1076256 : Rat) / 3749) [(0, 1), (4, 1), (11, 1), (13, 3), (16, 1)],
  term ((386532 : Rat) / 3749) [(0, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-153006 : Rat) / 3749) [(0, 1), (4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-39060 : Rat) / 3749) [(0, 1), (4, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((1283373 : Rat) / 3749) [(0, 1), (4, 1), (12, 1), (13, 2), (16, 1)],
  term ((-347088 : Rat) / 3749) [(0, 1), (4, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((850416 : Rat) / 3749) [(0, 1), (4, 1), (12, 1), (13, 4), (16, 1)],
  term ((118944 : Rat) / 3749) [(0, 1), (4, 1), (12, 1), (15, 2), (16, 1)],
  term ((-118188 : Rat) / 3749) [(0, 1), (4, 1), (12, 1), (16, 1)],
  term ((74523285 : Rat) / 104972) [(0, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2049441 : Rat) / 52486) [(0, 1), (4, 1), (13, 2), (15, 2), (16, 1)],
  term ((-7426305 : Rat) / 29992) [(0, 1), (4, 1), (13, 2), (16, 1)],
  term ((5133190 : Rat) / 26243) [(0, 1), (4, 1), (13, 3), (15, 1), (16, 1)],
  term ((-6167498 : Rat) / 26243) [(0, 1), (4, 1), (13, 4), (16, 1)],
  term ((-10915979 : Rat) / 26243) [(0, 1), (4, 1), (15, 2), (16, 1)],
  term ((4330331 : Rat) / 104972) [(0, 1), (4, 1), (16, 1)],
  term ((-658728 : Rat) / 3749) [(0, 1), (4, 2), (7, 1), (13, 1), (16, 1)],
  term ((156240 : Rat) / 3749) [(0, 1), (4, 2), (7, 1), (13, 3), (16, 1)],
  term ((-931392 : Rat) / 3749) [(0, 1), (4, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((1663200 : Rat) / 3749) [(0, 1), (4, 2), (8, 1), (13, 2), (16, 1)],
  term ((-104076 : Rat) / 3749) [(0, 1), (4, 2), (8, 1), (16, 1)],
  term ((936600 : Rat) / 3749) [(0, 1), (4, 2), (9, 1), (13, 1), (16, 1)],
  term ((-148680 : Rat) / 3749) [(0, 1), (4, 2), (9, 1), (15, 1), (16, 1)],
  term ((676872 : Rat) / 3749) [(0, 1), (4, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-754992 : Rat) / 3749) [(0, 1), (4, 2), (10, 1), (13, 2), (16, 1)],
  term ((-133812 : Rat) / 3749) [(0, 1), (4, 2), (10, 1), (16, 1)],
  term ((-516852 : Rat) / 3749) [(0, 1), (4, 2), (11, 1), (13, 1), (16, 1)],
  term ((-399168 : Rat) / 3749) [(0, 1), (4, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((798336 : Rat) / 3749) [(0, 1), (4, 2), (11, 1), (13, 3), (16, 1)],
  term ((89208 : Rat) / 3749) [(0, 1), (4, 2), (11, 1), (15, 1), (16, 1)],
  term ((153006 : Rat) / 3749) [(0, 1), (4, 2), (13, 1), (15, 1), (16, 1)],
  term ((39060 : Rat) / 3749) [(0, 1), (4, 2), (13, 2), (15, 2), (16, 1)],
  term ((-1283373 : Rat) / 3749) [(0, 1), (4, 2), (13, 2), (16, 1)],
  term ((347088 : Rat) / 3749) [(0, 1), (4, 2), (13, 3), (15, 1), (16, 1)],
  term ((-850416 : Rat) / 3749) [(0, 1), (4, 2), (13, 4), (16, 1)],
  term ((-118944 : Rat) / 3749) [(0, 1), (4, 2), (15, 2), (16, 1)],
  term ((118188 : Rat) / 3749) [(0, 1), (4, 2), (16, 1)],
  term ((8059464 : Rat) / 41239) [(0, 1), (5, 1), (7, 1), (12, 1), (13, 2), (16, 1)],
  term ((-2481444 : Rat) / 41239) [(0, 1), (5, 1), (7, 1), (12, 1), (16, 1)],
  term ((10716048 : Rat) / 41239) [(0, 1), (5, 1), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((-5442696 : Rat) / 41239) [(0, 1), (5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((6199872 : Rat) / 41239) [(0, 1), (5, 1), (9, 1), (12, 1), (16, 1)],
  term ((-8567496 : Rat) / 41239) [(0, 1), (5, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((412524 : Rat) / 3749) [(0, 1), (5, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-338688 : Rat) / 41239) [(0, 1), (5, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((677376 : Rat) / 41239) [(0, 1), (5, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-206262 : Rat) / 3749) [(0, 1), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((2014866 : Rat) / 41239) [(0, 1), (5, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((230223 : Rat) / 82478) [(0, 1), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((-2347800 : Rat) / 41239) [(0, 1), (5, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-3363864 : Rat) / 41239) [(0, 1), (5, 1), (12, 1), (13, 3), (16, 1)],
  term ((-3578253 : Rat) / 41239) [(0, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((3535290 : Rat) / 26243) [(0, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((4098882 : Rat) / 26243) [(0, 1), (7, 1), (12, 1), (13, 3), (16, 1)],
  term ((1255632 : Rat) / 3749) [(0, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2242200 : Rat) / 3749) [(0, 1), (8, 1), (12, 1), (13, 2), (16, 1)],
  term ((73980 : Rat) / 3749) [(0, 1), (8, 1), (12, 1), (16, 1)],
  term ((1591741 : Rat) / 26243) [(0, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((3571311 : Rat) / 26243) [(0, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-513954 : Rat) / 3749) [(0, 1), (9, 2), (12, 1), (16, 1)],
  term ((-156561 : Rat) / 1141) [(0, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1551462 : Rat) / 26243) [(0, 1), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((309906 : Rat) / 3749) [(0, 1), (10, 1), (12, 1), (16, 1)],
  term ((14423799 : Rat) / 52486) [(0, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((538128 : Rat) / 3749) [(0, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1076256 : Rat) / 3749) [(0, 1), (11, 1), (12, 1), (13, 3), (16, 1)],
  term ((-386532 : Rat) / 3749) [(0, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-74523285 : Rat) / 104972) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((2049441 : Rat) / 52486) [(0, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((7426305 : Rat) / 29992) [(0, 1), (12, 1), (13, 2), (16, 1)],
  term ((-5133190 : Rat) / 26243) [(0, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((6167498 : Rat) / 26243) [(0, 1), (12, 1), (13, 4), (16, 1)],
  term ((10915979 : Rat) / 26243) [(0, 1), (12, 1), (15, 2), (16, 1)],
  term ((-4330331 : Rat) / 104972) [(0, 1), (12, 1), (16, 1)],
  term ((-13937792 : Rat) / 26243) [(1, 1), (3, 1), (5, 1), (13, 1), (16, 1)],
  term ((6968896 : Rat) / 26243) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((-6968896 : Rat) / 26243) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((13937792 : Rat) / 26243) [(1, 1), (3, 1), (13, 2), (16, 1)],
  term ((-658728 : Rat) / 3749) [(1, 1), (4, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((156240 : Rat) / 3749) [(1, 1), (4, 1), (5, 1), (7, 1), (13, 3), (16, 1)],
  term ((-931392 : Rat) / 3749) [(1, 1), (4, 1), (5, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((1663200 : Rat) / 3749) [(1, 1), (4, 1), (5, 1), (8, 1), (13, 2), (16, 1)],
  term ((-104076 : Rat) / 3749) [(1, 1), (4, 1), (5, 1), (8, 1), (16, 1)],
  term ((936600 : Rat) / 3749) [(1, 1), (4, 1), (5, 1), (9, 1), (13, 1), (16, 1)],
  term ((-148680 : Rat) / 3749) [(1, 1), (4, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((676872 : Rat) / 3749) [(1, 1), (4, 1), (5, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-754992 : Rat) / 3749) [(1, 1), (4, 1), (5, 1), (10, 1), (13, 2), (16, 1)],
  term ((-133812 : Rat) / 3749) [(1, 1), (4, 1), (5, 1), (10, 1), (16, 1)],
  term ((-516852 : Rat) / 3749) [(1, 1), (4, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((-399168 : Rat) / 3749) [(1, 1), (4, 1), (5, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((798336 : Rat) / 3749) [(1, 1), (4, 1), (5, 1), (11, 1), (13, 3), (16, 1)],
  term ((89208 : Rat) / 3749) [(1, 1), (4, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((153006 : Rat) / 3749) [(1, 1), (4, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((39060 : Rat) / 3749) [(1, 1), (4, 1), (5, 1), (13, 2), (15, 2), (16, 1)],
  term ((-1283373 : Rat) / 3749) [(1, 1), (4, 1), (5, 1), (13, 2), (16, 1)],
  term ((347088 : Rat) / 3749) [(1, 1), (4, 1), (5, 1), (13, 3), (15, 1), (16, 1)],
  term ((-850416 : Rat) / 3749) [(1, 1), (4, 1), (5, 1), (13, 4), (16, 1)],
  term ((-118944 : Rat) / 3749) [(1, 1), (4, 1), (5, 1), (15, 2), (16, 1)],
  term ((118188 : Rat) / 3749) [(1, 1), (4, 1), (5, 1), (16, 1)],
  term ((658728 : Rat) / 3749) [(1, 1), (4, 1), (7, 1), (13, 2), (16, 1)],
  term ((-156240 : Rat) / 3749) [(1, 1), (4, 1), (7, 1), (13, 4), (16, 1)],
  term ((104076 : Rat) / 3749) [(1, 1), (4, 1), (8, 1), (13, 1), (16, 1)],
  term ((931392 : Rat) / 3749) [(1, 1), (4, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1663200 : Rat) / 3749) [(1, 1), (4, 1), (8, 1), (13, 3), (16, 1)],
  term ((148680 : Rat) / 3749) [(1, 1), (4, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-936600 : Rat) / 3749) [(1, 1), (4, 1), (9, 1), (13, 2), (16, 1)],
  term ((133812 : Rat) / 3749) [(1, 1), (4, 1), (10, 1), (13, 1), (16, 1)],
  term ((-676872 : Rat) / 3749) [(1, 1), (4, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((754992 : Rat) / 3749) [(1, 1), (4, 1), (10, 1), (13, 3), (16, 1)],
  term ((-89208 : Rat) / 3749) [(1, 1), (4, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((516852 : Rat) / 3749) [(1, 1), (4, 1), (11, 1), (13, 2), (16, 1)],
  term ((399168 : Rat) / 3749) [(1, 1), (4, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-798336 : Rat) / 3749) [(1, 1), (4, 1), (11, 1), (13, 4), (16, 1)],
  term ((118944 : Rat) / 3749) [(1, 1), (4, 1), (13, 1), (15, 2), (16, 1)],
  term ((-118188 : Rat) / 3749) [(1, 1), (4, 1), (13, 1), (16, 1)],
  term ((-153006 : Rat) / 3749) [(1, 1), (4, 1), (13, 2), (15, 1), (16, 1)],
  term ((-39060 : Rat) / 3749) [(1, 1), (4, 1), (13, 3), (15, 2), (16, 1)],
  term ((1283373 : Rat) / 3749) [(1, 1), (4, 1), (13, 3), (16, 1)],
  term ((-347088 : Rat) / 3749) [(1, 1), (4, 1), (13, 4), (15, 1), (16, 1)],
  term ((850416 : Rat) / 3749) [(1, 1), (4, 1), (13, 5), (16, 1)],
  term ((-56258298 : Rat) / 288673) [(1, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((11328546 : Rat) / 288673) [(1, 1), (5, 1), (7, 1), (13, 3), (16, 1)],
  term ((-19254648 : Rat) / 41239) [(1, 1), (5, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((35380248 : Rat) / 41239) [(1, 1), (5, 1), (8, 1), (13, 2), (16, 1)],
  term ((-73980 : Rat) / 3749) [(1, 1), (5, 1), (8, 1), (16, 1)],
  term ((25889953 : Rat) / 288673) [(1, 1), (5, 1), (9, 1), (13, 1), (16, 1)],
  term ((-3571311 : Rat) / 26243) [(1, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((513954 : Rat) / 3749) [(1, 1), (5, 1), (9, 2), (16, 1)],
  term ((6488571 : Rat) / 26243) [(1, 1), (5, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-77038554 : Rat) / 288673) [(1, 1), (5, 1), (10, 1), (13, 2), (16, 1)],
  term ((-309906 : Rat) / 3749) [(1, 1), (5, 1), (10, 1), (16, 1)],
  term ((-17311467 : Rat) / 52486) [(1, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((-6258096 : Rat) / 41239) [(1, 1), (5, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((12516192 : Rat) / 41239) [(1, 1), (5, 1), (11, 1), (13, 3), (16, 1)],
  term ((386532 : Rat) / 3749) [(1, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((31285437 : Rat) / 50204) [(1, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((5664273 : Rat) / 577346) [(1, 1), (5, 1), (13, 2), (15, 2), (16, 1)],
  term ((-80768463 : Rat) / 329912) [(1, 1), (5, 1), (13, 2), (16, 1)],
  term ((40030490 : Rat) / 288673) [(1, 1), (5, 1), (13, 3), (15, 1), (16, 1)],
  term ((-91389526 : Rat) / 288673) [(1, 1), (5, 1), (13, 4), (16, 1)],
  term ((-10915979 : Rat) / 26243) [(1, 1), (5, 1), (15, 2), (16, 1)],
  term ((4330331 : Rat) / 104972) [(1, 1), (5, 1), (16, 1)],
  term ((-8059464 : Rat) / 41239) [(1, 1), (5, 2), (7, 1), (13, 2), (16, 1)],
  term ((2481444 : Rat) / 41239) [(1, 1), (5, 2), (7, 1), (16, 1)],
  term ((-10716048 : Rat) / 41239) [(1, 1), (5, 2), (8, 1), (13, 1), (16, 1)],
  term ((5442696 : Rat) / 41239) [(1, 1), (5, 2), (8, 1), (15, 1), (16, 1)],
  term ((-6199872 : Rat) / 41239) [(1, 1), (5, 2), (9, 1), (16, 1)],
  term ((8567496 : Rat) / 41239) [(1, 1), (5, 2), (10, 1), (13, 1), (16, 1)],
  term ((-412524 : Rat) / 3749) [(1, 1), (5, 2), (10, 1), (15, 1), (16, 1)],
  term ((338688 : Rat) / 41239) [(1, 1), (5, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-677376 : Rat) / 41239) [(1, 1), (5, 2), (11, 1), (13, 2), (16, 1)],
  term ((206262 : Rat) / 3749) [(1, 1), (5, 2), (11, 1), (16, 1)],
  term ((-2014866 : Rat) / 41239) [(1, 1), (5, 2), (13, 1), (15, 2), (16, 1)],
  term ((-230223 : Rat) / 82478) [(1, 1), (5, 2), (13, 1), (16, 1)],
  term ((2347800 : Rat) / 41239) [(1, 1), (5, 2), (13, 2), (15, 1), (16, 1)],
  term ((3363864 : Rat) / 41239) [(1, 1), (5, 2), (13, 3), (16, 1)],
  term ((3578253 : Rat) / 41239) [(1, 1), (5, 2), (15, 1), (16, 1)],
  term ((3535290 : Rat) / 26243) [(1, 1), (7, 1), (13, 2), (16, 1)],
  term ((4098882 : Rat) / 26243) [(1, 1), (7, 1), (13, 4), (16, 1)],
  term ((73980 : Rat) / 3749) [(1, 1), (8, 1), (13, 1), (16, 1)],
  term ((1255632 : Rat) / 3749) [(1, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((-2242200 : Rat) / 3749) [(1, 1), (8, 1), (13, 3), (16, 1)],
  term ((3571311 : Rat) / 26243) [(1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((1591741 : Rat) / 26243) [(1, 1), (9, 1), (13, 2), (16, 1)],
  term ((-513954 : Rat) / 3749) [(1, 1), (9, 2), (13, 1), (16, 1)],
  term ((309906 : Rat) / 3749) [(1, 1), (10, 1), (13, 1), (16, 1)],
  term ((-156561 : Rat) / 1141) [(1, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((1551462 : Rat) / 26243) [(1, 1), (10, 1), (13, 3), (16, 1)],
  term ((-386532 : Rat) / 3749) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((14423799 : Rat) / 52486) [(1, 1), (11, 1), (13, 2), (16, 1)],
  term ((538128 : Rat) / 3749) [(1, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-1076256 : Rat) / 3749) [(1, 1), (11, 1), (13, 4), (16, 1)],
  term ((10915979 : Rat) / 26243) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((-4330331 : Rat) / 104972) [(1, 1), (13, 1), (16, 1)],
  term ((-74523285 : Rat) / 104972) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((2049441 : Rat) / 52486) [(1, 1), (13, 3), (15, 2), (16, 1)],
  term ((7426305 : Rat) / 29992) [(1, 1), (13, 3), (16, 1)],
  term ((-5133190 : Rat) / 26243) [(1, 1), (13, 4), (15, 1), (16, 1)],
  term ((6167498 : Rat) / 26243) [(1, 1), (13, 5), (16, 1)],
  term ((6968896 : Rat) / 26243) [(3, 1), (4, 2), (13, 1), (16, 1)],
  term ((-3484448 : Rat) / 26243) [(3, 1), (4, 2), (15, 1), (16, 1)],
  term ((6968896 : Rat) / 26243) [(3, 1), (5, 2), (13, 1), (16, 1)],
  term ((-3484448 : Rat) / 26243) [(3, 1), (5, 2), (15, 1), (16, 1)],
  term ((-6968896 : Rat) / 26243) [(3, 1), (12, 2), (13, 1), (16, 1)],
  term ((3484448 : Rat) / 26243) [(3, 1), (12, 2), (15, 1), (16, 1)],
  term ((3484448 : Rat) / 26243) [(3, 1), (13, 2), (15, 1), (16, 1)],
  term ((-6968896 : Rat) / 26243) [(3, 1), (13, 3), (16, 1)],
  term ((329364 : Rat) / 3749) [(4, 1), (5, 2), (7, 1), (13, 1), (16, 1)],
  term ((-78120 : Rat) / 3749) [(4, 1), (5, 2), (7, 1), (13, 3), (16, 1)],
  term ((465696 : Rat) / 3749) [(4, 1), (5, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-831600 : Rat) / 3749) [(4, 1), (5, 2), (8, 1), (13, 2), (16, 1)],
  term ((52038 : Rat) / 3749) [(4, 1), (5, 2), (8, 1), (16, 1)],
  term ((-468300 : Rat) / 3749) [(4, 1), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((74340 : Rat) / 3749) [(4, 1), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-338436 : Rat) / 3749) [(4, 1), (5, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((377496 : Rat) / 3749) [(4, 1), (5, 2), (10, 1), (13, 2), (16, 1)],
  term ((66906 : Rat) / 3749) [(4, 1), (5, 2), (10, 1), (16, 1)],
  term ((258426 : Rat) / 3749) [(4, 1), (5, 2), (11, 1), (13, 1), (16, 1)],
  term ((199584 : Rat) / 3749) [(4, 1), (5, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-399168 : Rat) / 3749) [(4, 1), (5, 2), (11, 1), (13, 3), (16, 1)],
  term ((-44604 : Rat) / 3749) [(4, 1), (5, 2), (11, 1), (15, 1), (16, 1)],
  term ((-76503 : Rat) / 3749) [(4, 1), (5, 2), (13, 1), (15, 1), (16, 1)],
  term ((-19530 : Rat) / 3749) [(4, 1), (5, 2), (13, 2), (15, 2), (16, 1)],
  term ((1283373 : Rat) / 7498) [(4, 1), (5, 2), (13, 2), (16, 1)],
  term ((-173544 : Rat) / 3749) [(4, 1), (5, 2), (13, 3), (15, 1), (16, 1)],
  term ((425208 : Rat) / 3749) [(4, 1), (5, 2), (13, 4), (16, 1)],
  term ((59472 : Rat) / 3749) [(4, 1), (5, 2), (15, 2), (16, 1)],
  term ((-59094 : Rat) / 3749) [(4, 1), (5, 2), (16, 1)],
  term ((-329364 : Rat) / 3749) [(4, 1), (7, 1), (12, 2), (13, 1), (16, 1)],
  term ((78120 : Rat) / 3749) [(4, 1), (7, 1), (12, 2), (13, 3), (16, 1)],
  term ((-329364 : Rat) / 3749) [(4, 1), (7, 1), (13, 3), (16, 1)],
  term ((78120 : Rat) / 3749) [(4, 1), (7, 1), (13, 5), (16, 1)],
  term ((-465696 : Rat) / 3749) [(4, 1), (8, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((831600 : Rat) / 3749) [(4, 1), (8, 1), (12, 2), (13, 2), (16, 1)],
  term ((-52038 : Rat) / 3749) [(4, 1), (8, 1), (12, 2), (16, 1)],
  term ((-52038 : Rat) / 3749) [(4, 1), (8, 1), (13, 2), (16, 1)],
  term ((-465696 : Rat) / 3749) [(4, 1), (8, 1), (13, 3), (15, 1), (16, 1)],
  term ((831600 : Rat) / 3749) [(4, 1), (8, 1), (13, 4), (16, 1)],
  term ((468300 : Rat) / 3749) [(4, 1), (9, 1), (12, 2), (13, 1), (16, 1)],
  term ((-74340 : Rat) / 3749) [(4, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-74340 : Rat) / 3749) [(4, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((468300 : Rat) / 3749) [(4, 1), (9, 1), (13, 3), (16, 1)],
  term ((338436 : Rat) / 3749) [(4, 1), (10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-377496 : Rat) / 3749) [(4, 1), (10, 1), (12, 2), (13, 2), (16, 1)],
  term ((-66906 : Rat) / 3749) [(4, 1), (10, 1), (12, 2), (16, 1)],
  term ((-66906 : Rat) / 3749) [(4, 1), (10, 1), (13, 2), (16, 1)],
  term ((338436 : Rat) / 3749) [(4, 1), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((-377496 : Rat) / 3749) [(4, 1), (10, 1), (13, 4), (16, 1)],
  term ((-258426 : Rat) / 3749) [(4, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-199584 : Rat) / 3749) [(4, 1), (11, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((399168 : Rat) / 3749) [(4, 1), (11, 1), (12, 2), (13, 3), (16, 1)],
  term ((44604 : Rat) / 3749) [(4, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((44604 : Rat) / 3749) [(4, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-258426 : Rat) / 3749) [(4, 1), (11, 1), (13, 3), (16, 1)],
  term ((-199584 : Rat) / 3749) [(4, 1), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((399168 : Rat) / 3749) [(4, 1), (11, 1), (13, 5), (16, 1)],
  term ((76503 : Rat) / 3749) [(4, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((19530 : Rat) / 3749) [(4, 1), (12, 2), (13, 2), (15, 2), (16, 1)],
  term ((-1283373 : Rat) / 7498) [(4, 1), (12, 2), (13, 2), (16, 1)],
  term ((173544 : Rat) / 3749) [(4, 1), (12, 2), (13, 3), (15, 1), (16, 1)],
  term ((-425208 : Rat) / 3749) [(4, 1), (12, 2), (13, 4), (16, 1)],
  term ((-59472 : Rat) / 3749) [(4, 1), (12, 2), (15, 2), (16, 1)],
  term ((59094 : Rat) / 3749) [(4, 1), (12, 2), (16, 1)],
  term ((-59472 : Rat) / 3749) [(4, 1), (13, 2), (15, 2), (16, 1)],
  term ((59094 : Rat) / 3749) [(4, 1), (13, 2), (16, 1)],
  term ((76503 : Rat) / 3749) [(4, 1), (13, 3), (15, 1), (16, 1)],
  term ((19530 : Rat) / 3749) [(4, 1), (13, 4), (15, 2), (16, 1)],
  term ((-1283373 : Rat) / 7498) [(4, 1), (13, 4), (16, 1)],
  term ((173544 : Rat) / 3749) [(4, 1), (13, 5), (15, 1), (16, 1)],
  term ((-425208 : Rat) / 3749) [(4, 1), (13, 6), (16, 1)],
  term ((4029732 : Rat) / 41239) [(4, 2), (5, 1), (7, 1), (13, 2), (16, 1)],
  term ((-1240722 : Rat) / 41239) [(4, 2), (5, 1), (7, 1), (16, 1)],
  term ((5358024 : Rat) / 41239) [(4, 2), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((-2721348 : Rat) / 41239) [(4, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((3099936 : Rat) / 41239) [(4, 2), (5, 1), (9, 1), (16, 1)],
  term ((-4283748 : Rat) / 41239) [(4, 2), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((206262 : Rat) / 3749) [(4, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-169344 : Rat) / 41239) [(4, 2), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((338688 : Rat) / 41239) [(4, 2), (5, 1), (11, 1), (13, 2), (16, 1)],
  term ((-103131 : Rat) / 3749) [(4, 2), (5, 1), (11, 1), (16, 1)],
  term ((1007433 : Rat) / 41239) [(4, 2), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((230223 : Rat) / 164956) [(4, 2), (5, 1), (13, 1), (16, 1)],
  term ((-1173900 : Rat) / 41239) [(4, 2), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1681932 : Rat) / 41239) [(4, 2), (5, 1), (13, 3), (16, 1)],
  term ((-3578253 : Rat) / 82478) [(4, 2), (5, 1), (15, 1), (16, 1)],
  term ((1767645 : Rat) / 26243) [(4, 2), (7, 1), (13, 1), (16, 1)],
  term ((2049441 : Rat) / 26243) [(4, 2), (7, 1), (13, 3), (16, 1)],
  term ((627816 : Rat) / 3749) [(4, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1121100 : Rat) / 3749) [(4, 2), (8, 1), (13, 2), (16, 1)],
  term ((36990 : Rat) / 3749) [(4, 2), (8, 1), (16, 1)],
  term ((1591741 : Rat) / 52486) [(4, 2), (9, 1), (13, 1), (16, 1)],
  term ((3571311 : Rat) / 52486) [(4, 2), (9, 1), (15, 1), (16, 1)],
  term ((-256977 : Rat) / 3749) [(4, 2), (9, 2), (16, 1)],
  term ((-156561 : Rat) / 2282) [(4, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((775731 : Rat) / 26243) [(4, 2), (10, 1), (13, 2), (16, 1)],
  term ((154953 : Rat) / 3749) [(4, 2), (10, 1), (16, 1)],
  term ((14423799 : Rat) / 104972) [(4, 2), (11, 1), (13, 1), (16, 1)],
  term ((269064 : Rat) / 3749) [(4, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-538128 : Rat) / 3749) [(4, 2), (11, 1), (13, 3), (16, 1)],
  term ((-193266 : Rat) / 3749) [(4, 2), (11, 1), (15, 1), (16, 1)],
  term ((-74523285 : Rat) / 209944) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term ((2049441 : Rat) / 104972) [(4, 2), (13, 2), (15, 2), (16, 1)],
  term ((7426305 : Rat) / 59984) [(4, 2), (13, 2), (16, 1)],
  term ((-2566595 : Rat) / 26243) [(4, 2), (13, 3), (15, 1), (16, 1)],
  term ((3083749 : Rat) / 26243) [(4, 2), (13, 4), (16, 1)],
  term ((10915979 : Rat) / 52486) [(4, 2), (15, 2), (16, 1)],
  term ((-4330331 : Rat) / 209944) [(4, 2), (16, 1)],
  term ((329364 : Rat) / 3749) [(4, 3), (7, 1), (13, 1), (16, 1)],
  term ((-78120 : Rat) / 3749) [(4, 3), (7, 1), (13, 3), (16, 1)],
  term ((465696 : Rat) / 3749) [(4, 3), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-831600 : Rat) / 3749) [(4, 3), (8, 1), (13, 2), (16, 1)],
  term ((52038 : Rat) / 3749) [(4, 3), (8, 1), (16, 1)],
  term ((-468300 : Rat) / 3749) [(4, 3), (9, 1), (13, 1), (16, 1)],
  term ((74340 : Rat) / 3749) [(4, 3), (9, 1), (15, 1), (16, 1)],
  term ((-338436 : Rat) / 3749) [(4, 3), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((377496 : Rat) / 3749) [(4, 3), (10, 1), (13, 2), (16, 1)],
  term ((66906 : Rat) / 3749) [(4, 3), (10, 1), (16, 1)],
  term ((258426 : Rat) / 3749) [(4, 3), (11, 1), (13, 1), (16, 1)],
  term ((199584 : Rat) / 3749) [(4, 3), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-399168 : Rat) / 3749) [(4, 3), (11, 1), (13, 3), (16, 1)],
  term ((-44604 : Rat) / 3749) [(4, 3), (11, 1), (15, 1), (16, 1)],
  term ((-76503 : Rat) / 3749) [(4, 3), (13, 1), (15, 1), (16, 1)],
  term ((-19530 : Rat) / 3749) [(4, 3), (13, 2), (15, 2), (16, 1)],
  term ((1283373 : Rat) / 7498) [(4, 3), (13, 2), (16, 1)],
  term ((-173544 : Rat) / 3749) [(4, 3), (13, 3), (15, 1), (16, 1)],
  term ((425208 : Rat) / 3749) [(4, 3), (13, 4), (16, 1)],
  term ((59472 : Rat) / 3749) [(4, 3), (15, 2), (16, 1)],
  term ((-59094 : Rat) / 3749) [(4, 3), (16, 1)],
  term ((-4029732 : Rat) / 41239) [(5, 1), (7, 1), (12, 2), (13, 2), (16, 1)],
  term ((1240722 : Rat) / 41239) [(5, 1), (7, 1), (12, 2), (16, 1)],
  term ((1240722 : Rat) / 41239) [(5, 1), (7, 1), (13, 2), (16, 1)],
  term ((-4029732 : Rat) / 41239) [(5, 1), (7, 1), (13, 4), (16, 1)],
  term ((-5358024 : Rat) / 41239) [(5, 1), (8, 1), (12, 2), (13, 1), (16, 1)],
  term ((2721348 : Rat) / 41239) [(5, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((2721348 : Rat) / 41239) [(5, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((-5358024 : Rat) / 41239) [(5, 1), (8, 1), (13, 3), (16, 1)],
  term ((-3099936 : Rat) / 41239) [(5, 1), (9, 1), (12, 2), (16, 1)],
  term ((-3099936 : Rat) / 41239) [(5, 1), (9, 1), (13, 2), (16, 1)],
  term ((4283748 : Rat) / 41239) [(5, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((-206262 : Rat) / 3749) [(5, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-206262 : Rat) / 3749) [(5, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((4283748 : Rat) / 41239) [(5, 1), (10, 1), (13, 3), (16, 1)],
  term ((169344 : Rat) / 41239) [(5, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-338688 : Rat) / 41239) [(5, 1), (11, 1), (12, 2), (13, 2), (16, 1)],
  term ((103131 : Rat) / 3749) [(5, 1), (11, 1), (12, 2), (16, 1)],
  term ((103131 : Rat) / 3749) [(5, 1), (11, 1), (13, 2), (16, 1)],
  term ((169344 : Rat) / 41239) [(5, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-338688 : Rat) / 41239) [(5, 1), (11, 1), (13, 4), (16, 1)],
  term ((-1007433 : Rat) / 41239) [(5, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-230223 : Rat) / 164956) [(5, 1), (12, 2), (13, 1), (16, 1)],
  term ((1173900 : Rat) / 41239) [(5, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((1681932 : Rat) / 41239) [(5, 1), (12, 2), (13, 3), (16, 1)],
  term ((3578253 : Rat) / 82478) [(5, 1), (12, 2), (15, 1), (16, 1)],
  term ((3578253 : Rat) / 82478) [(5, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1007433 : Rat) / 41239) [(5, 1), (13, 3), (15, 2), (16, 1)],
  term ((-230223 : Rat) / 164956) [(5, 1), (13, 3), (16, 1)],
  term ((1173900 : Rat) / 41239) [(5, 1), (13, 4), (15, 1), (16, 1)],
  term ((1681932 : Rat) / 41239) [(5, 1), (13, 5), (16, 1)],
  term ((1767645 : Rat) / 26243) [(5, 2), (7, 1), (13, 1), (16, 1)],
  term ((2049441 : Rat) / 26243) [(5, 2), (7, 1), (13, 3), (16, 1)],
  term ((627816 : Rat) / 3749) [(5, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1121100 : Rat) / 3749) [(5, 2), (8, 1), (13, 2), (16, 1)],
  term ((36990 : Rat) / 3749) [(5, 2), (8, 1), (16, 1)],
  term ((1591741 : Rat) / 52486) [(5, 2), (9, 1), (13, 1), (16, 1)],
  term ((3571311 : Rat) / 52486) [(5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-256977 : Rat) / 3749) [(5, 2), (9, 2), (16, 1)],
  term ((-156561 : Rat) / 2282) [(5, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((775731 : Rat) / 26243) [(5, 2), (10, 1), (13, 2), (16, 1)],
  term ((154953 : Rat) / 3749) [(5, 2), (10, 1), (16, 1)],
  term ((14423799 : Rat) / 104972) [(5, 2), (11, 1), (13, 1), (16, 1)],
  term ((269064 : Rat) / 3749) [(5, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-538128 : Rat) / 3749) [(5, 2), (11, 1), (13, 3), (16, 1)],
  term ((-193266 : Rat) / 3749) [(5, 2), (11, 1), (15, 1), (16, 1)],
  term ((-74523285 : Rat) / 209944) [(5, 2), (13, 1), (15, 1), (16, 1)],
  term ((2049441 : Rat) / 104972) [(5, 2), (13, 2), (15, 2), (16, 1)],
  term ((7426305 : Rat) / 59984) [(5, 2), (13, 2), (16, 1)],
  term ((-2566595 : Rat) / 26243) [(5, 2), (13, 3), (15, 1), (16, 1)],
  term ((3083749 : Rat) / 26243) [(5, 2), (13, 4), (16, 1)],
  term ((10915979 : Rat) / 52486) [(5, 2), (15, 2), (16, 1)],
  term ((-4330331 : Rat) / 209944) [(5, 2), (16, 1)],
  term ((4029732 : Rat) / 41239) [(5, 3), (7, 1), (13, 2), (16, 1)],
  term ((-1240722 : Rat) / 41239) [(5, 3), (7, 1), (16, 1)],
  term ((5358024 : Rat) / 41239) [(5, 3), (8, 1), (13, 1), (16, 1)],
  term ((-2721348 : Rat) / 41239) [(5, 3), (8, 1), (15, 1), (16, 1)],
  term ((3099936 : Rat) / 41239) [(5, 3), (9, 1), (16, 1)],
  term ((-4283748 : Rat) / 41239) [(5, 3), (10, 1), (13, 1), (16, 1)],
  term ((206262 : Rat) / 3749) [(5, 3), (10, 1), (15, 1), (16, 1)],
  term ((-169344 : Rat) / 41239) [(5, 3), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((338688 : Rat) / 41239) [(5, 3), (11, 1), (13, 2), (16, 1)],
  term ((-103131 : Rat) / 3749) [(5, 3), (11, 1), (16, 1)],
  term ((1007433 : Rat) / 41239) [(5, 3), (13, 1), (15, 2), (16, 1)],
  term ((230223 : Rat) / 164956) [(5, 3), (13, 1), (16, 1)],
  term ((-1173900 : Rat) / 41239) [(5, 3), (13, 2), (15, 1), (16, 1)],
  term ((-1681932 : Rat) / 41239) [(5, 3), (13, 3), (16, 1)],
  term ((-3578253 : Rat) / 82478) [(5, 3), (15, 1), (16, 1)],
  term ((-1767645 : Rat) / 26243) [(7, 1), (12, 2), (13, 1), (16, 1)],
  term ((-2049441 : Rat) / 26243) [(7, 1), (12, 2), (13, 3), (16, 1)],
  term ((-1767645 : Rat) / 26243) [(7, 1), (13, 3), (16, 1)],
  term ((-2049441 : Rat) / 26243) [(7, 1), (13, 5), (16, 1)],
  term ((-627816 : Rat) / 3749) [(8, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((1121100 : Rat) / 3749) [(8, 1), (12, 2), (13, 2), (16, 1)],
  term ((-36990 : Rat) / 3749) [(8, 1), (12, 2), (16, 1)],
  term ((-36990 : Rat) / 3749) [(8, 1), (13, 2), (16, 1)],
  term ((-627816 : Rat) / 3749) [(8, 1), (13, 3), (15, 1), (16, 1)],
  term ((1121100 : Rat) / 3749) [(8, 1), (13, 4), (16, 1)],
  term ((-1591741 : Rat) / 52486) [(9, 1), (12, 2), (13, 1), (16, 1)],
  term ((-3571311 : Rat) / 52486) [(9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-3571311 : Rat) / 52486) [(9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1591741 : Rat) / 52486) [(9, 1), (13, 3), (16, 1)],
  term ((256977 : Rat) / 3749) [(9, 2), (12, 2), (16, 1)],
  term ((256977 : Rat) / 3749) [(9, 2), (13, 2), (16, 1)],
  term ((156561 : Rat) / 2282) [(10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-775731 : Rat) / 26243) [(10, 1), (12, 2), (13, 2), (16, 1)],
  term ((-154953 : Rat) / 3749) [(10, 1), (12, 2), (16, 1)],
  term ((-154953 : Rat) / 3749) [(10, 1), (13, 2), (16, 1)],
  term ((156561 : Rat) / 2282) [(10, 1), (13, 3), (15, 1), (16, 1)],
  term ((-775731 : Rat) / 26243) [(10, 1), (13, 4), (16, 1)],
  term ((-14423799 : Rat) / 104972) [(11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-269064 : Rat) / 3749) [(11, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((538128 : Rat) / 3749) [(11, 1), (12, 2), (13, 3), (16, 1)],
  term ((193266 : Rat) / 3749) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((193266 : Rat) / 3749) [(11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-14423799 : Rat) / 104972) [(11, 1), (13, 3), (16, 1)],
  term ((-269064 : Rat) / 3749) [(11, 1), (13, 4), (15, 1), (16, 1)],
  term ((538128 : Rat) / 3749) [(11, 1), (13, 5), (16, 1)],
  term ((74523285 : Rat) / 209944) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2049441 : Rat) / 104972) [(12, 2), (13, 2), (15, 2), (16, 1)],
  term ((-7426305 : Rat) / 59984) [(12, 2), (13, 2), (16, 1)],
  term ((2566595 : Rat) / 26243) [(12, 2), (13, 3), (15, 1), (16, 1)],
  term ((-3083749 : Rat) / 26243) [(12, 2), (13, 4), (16, 1)],
  term ((-10915979 : Rat) / 52486) [(12, 2), (15, 2), (16, 1)],
  term ((4330331 : Rat) / 209944) [(12, 2), (16, 1)],
  term ((-10915979 : Rat) / 52486) [(13, 2), (15, 2), (16, 1)],
  term ((4330331 : Rat) / 209944) [(13, 2), (16, 1)],
  term ((74523285 : Rat) / 209944) [(13, 3), (15, 1), (16, 1)],
  term ((-2049441 : Rat) / 104972) [(13, 4), (15, 2), (16, 1)],
  term ((-7426305 : Rat) / 59984) [(13, 4), (16, 1)],
  term ((2566595 : Rat) / 26243) [(13, 5), (15, 1), (16, 1)],
  term ((-3083749 : Rat) / 26243) [(13, 6), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 9, terms 0 through 59. -/
theorem rs_R005_ueqv_R005YNY_block_09_0000_0059_valid :
    checkProductSumEq rs_R005_ueqv_R005YNY_partials_09_0000_0059
      rs_R005_ueqv_R005YNY_block_09_0000_0059 = true := by
  native_decide

end R005UeqvR005YNYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
