/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R005:u=v:R005YNY, term block 10:0-34

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R005UeqvR005YNYTermShards

/-- Generator polynomial 10 for relaxed split surplus certificate `R005:u=v:R005YNY`. -/
def rs_R005_ueqv_R005YNY_generator_10_0000_0034 : Poly :=
[
  term (-2 : Rat) [(0, 1), (2, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (3, 1)],
  term (1 : Rat) [(1, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 10. -/
def rs_R005_ueqv_R005YNY_coefficient_10_0000 : Poly :=
[
  term ((871112 : Rat) / 26243) [(3, 1), (13, 1), (16, 1)]
]

/-- Partial product 0 for generator 10. -/
def rs_R005_ueqv_R005YNY_partial_10_0000 : Poly :=
[
  term ((-1742224 : Rat) / 26243) [(0, 1), (2, 1), (3, 1), (13, 1), (16, 1)],
  term ((871112 : Rat) / 26243) [(0, 2), (3, 1), (13, 1), (16, 1)],
  term ((-1742224 : Rat) / 26243) [(1, 1), (3, 2), (13, 1), (16, 1)],
  term ((871112 : Rat) / 26243) [(1, 2), (3, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 10. -/
theorem rs_R005_ueqv_R005YNY_partial_10_0000_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_10_0000
        rs_R005_ueqv_R005YNY_generator_10_0000_0034 =
      rs_R005_ueqv_R005YNY_partial_10_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 10. -/
def rs_R005_ueqv_R005YNY_coefficient_10_0001 : Poly :=
[
  term ((-1742224 : Rat) / 26243) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 1 for generator 10. -/
def rs_R005_ueqv_R005YNY_partial_10_0001 : Poly :=
[
  term ((3484448 : Rat) / 26243) [(0, 1), (2, 1), (3, 1), (15, 1), (16, 1)],
  term ((-1742224 : Rat) / 26243) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((3484448 : Rat) / 26243) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((-1742224 : Rat) / 26243) [(1, 2), (3, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 10. -/
theorem rs_R005_ueqv_R005YNY_partial_10_0001_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_10_0001
        rs_R005_ueqv_R005YNY_generator_10_0000_0034 =
      rs_R005_ueqv_R005YNY_partial_10_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 10. -/
def rs_R005_ueqv_R005YNY_coefficient_10_0002 : Poly :=
[
  term ((-166320 : Rat) / 3749) [(4, 1), (8, 1), (13, 2), (16, 1)]
]

/-- Partial product 2 for generator 10. -/
def rs_R005_ueqv_R005YNY_partial_10_0002 : Poly :=
[
  term ((332640 : Rat) / 3749) [(0, 1), (2, 1), (4, 1), (8, 1), (13, 2), (16, 1)],
  term ((-166320 : Rat) / 3749) [(0, 2), (4, 1), (8, 1), (13, 2), (16, 1)],
  term ((332640 : Rat) / 3749) [(1, 1), (3, 1), (4, 1), (8, 1), (13, 2), (16, 1)],
  term ((-166320 : Rat) / 3749) [(1, 2), (4, 1), (8, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 10. -/
theorem rs_R005_ueqv_R005YNY_partial_10_0002_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_10_0002
        rs_R005_ueqv_R005YNY_generator_10_0000_0034 =
      rs_R005_ueqv_R005YNY_partial_10_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 10. -/
def rs_R005_ueqv_R005YNY_coefficient_10_0003 : Poly :=
[
  term ((-319620 : Rat) / 3749) [(4, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 3 for generator 10. -/
def rs_R005_ueqv_R005YNY_partial_10_0003 : Poly :=
[
  term ((639240 : Rat) / 3749) [(0, 1), (2, 1), (4, 1), (9, 1), (13, 1), (16, 1)],
  term ((-319620 : Rat) / 3749) [(0, 2), (4, 1), (9, 1), (13, 1), (16, 1)],
  term ((639240 : Rat) / 3749) [(1, 1), (3, 1), (4, 1), (9, 1), (13, 1), (16, 1)],
  term ((-319620 : Rat) / 3749) [(1, 2), (4, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 10. -/
theorem rs_R005_ueqv_R005YNY_partial_10_0003_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_10_0003
        rs_R005_ueqv_R005YNY_generator_10_0000_0034 =
      rs_R005_ueqv_R005YNY_partial_10_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 10. -/
def rs_R005_ueqv_R005YNY_coefficient_10_0004 : Poly :=
[
  term ((39060 : Rat) / 3749) [(4, 1), (10, 1), (13, 2), (16, 1)]
]

/-- Partial product 4 for generator 10. -/
def rs_R005_ueqv_R005YNY_partial_10_0004 : Poly :=
[
  term ((-78120 : Rat) / 3749) [(0, 1), (2, 1), (4, 1), (10, 1), (13, 2), (16, 1)],
  term ((39060 : Rat) / 3749) [(0, 2), (4, 1), (10, 1), (13, 2), (16, 1)],
  term ((-78120 : Rat) / 3749) [(1, 1), (3, 1), (4, 1), (10, 1), (13, 2), (16, 1)],
  term ((39060 : Rat) / 3749) [(1, 2), (4, 1), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 10. -/
theorem rs_R005_ueqv_R005YNY_partial_10_0004_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_10_0004
        rs_R005_ueqv_R005YNY_generator_10_0000_0034 =
      rs_R005_ueqv_R005YNY_partial_10_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 10. -/
def rs_R005_ueqv_R005YNY_coefficient_10_0005 : Poly :=
[
  term ((-118944 : Rat) / 3749) [(4, 1), (10, 1), (16, 1)]
]

/-- Partial product 5 for generator 10. -/
def rs_R005_ueqv_R005YNY_partial_10_0005 : Poly :=
[
  term ((237888 : Rat) / 3749) [(0, 1), (2, 1), (4, 1), (10, 1), (16, 1)],
  term ((-118944 : Rat) / 3749) [(0, 2), (4, 1), (10, 1), (16, 1)],
  term ((237888 : Rat) / 3749) [(1, 1), (3, 1), (4, 1), (10, 1), (16, 1)],
  term ((-118944 : Rat) / 3749) [(1, 2), (4, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 10. -/
theorem rs_R005_ueqv_R005YNY_partial_10_0005_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_10_0005
        rs_R005_ueqv_R005YNY_generator_10_0000_0034 =
      rs_R005_ueqv_R005YNY_partial_10_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 10. -/
def rs_R005_ueqv_R005YNY_coefficient_10_0006 : Poly :=
[
  term ((11130 : Rat) / 163) [(4, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 6 for generator 10. -/
def rs_R005_ueqv_R005YNY_partial_10_0006 : Poly :=
[
  term ((-22260 : Rat) / 163) [(0, 1), (2, 1), (4, 1), (11, 1), (13, 1), (16, 1)],
  term ((11130 : Rat) / 163) [(0, 2), (4, 1), (11, 1), (13, 1), (16, 1)],
  term ((-22260 : Rat) / 163) [(1, 1), (3, 1), (4, 1), (11, 1), (13, 1), (16, 1)],
  term ((11130 : Rat) / 163) [(1, 2), (4, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 10. -/
theorem rs_R005_ueqv_R005YNY_partial_10_0006_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_10_0006
        rs_R005_ueqv_R005YNY_generator_10_0000_0034 =
      rs_R005_ueqv_R005YNY_partial_10_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 10. -/
def rs_R005_ueqv_R005YNY_coefficient_10_0007 : Poly :=
[
  term ((-311661 : Rat) / 7498) [(4, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 7 for generator 10. -/
def rs_R005_ueqv_R005YNY_partial_10_0007 : Poly :=
[
  term ((311661 : Rat) / 3749) [(0, 1), (2, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-311661 : Rat) / 7498) [(0, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((311661 : Rat) / 3749) [(1, 1), (3, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-311661 : Rat) / 7498) [(1, 2), (4, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 10. -/
theorem rs_R005_ueqv_R005YNY_partial_10_0007_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_10_0007
        rs_R005_ueqv_R005YNY_generator_10_0000_0034 =
      rs_R005_ueqv_R005YNY_partial_10_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 10. -/
def rs_R005_ueqv_R005YNY_coefficient_10_0008 : Poly :=
[
  term ((373485 : Rat) / 3749) [(4, 1), (13, 2), (16, 1)]
]

/-- Partial product 8 for generator 10. -/
def rs_R005_ueqv_R005YNY_partial_10_0008 : Poly :=
[
  term ((-746970 : Rat) / 3749) [(0, 1), (2, 1), (4, 1), (13, 2), (16, 1)],
  term ((373485 : Rat) / 3749) [(0, 2), (4, 1), (13, 2), (16, 1)],
  term ((-746970 : Rat) / 3749) [(1, 1), (3, 1), (4, 1), (13, 2), (16, 1)],
  term ((373485 : Rat) / 3749) [(1, 2), (4, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 10. -/
theorem rs_R005_ueqv_R005YNY_partial_10_0008_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_10_0008
        rs_R005_ueqv_R005YNY_generator_10_0000_0034 =
      rs_R005_ueqv_R005YNY_partial_10_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 10. -/
def rs_R005_ueqv_R005YNY_coefficient_10_0009 : Poly :=
[
  term ((19530 : Rat) / 3749) [(4, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 9 for generator 10. -/
def rs_R005_ueqv_R005YNY_partial_10_0009 : Poly :=
[
  term ((-39060 : Rat) / 3749) [(0, 1), (2, 1), (4, 1), (13, 3), (15, 1), (16, 1)],
  term ((19530 : Rat) / 3749) [(0, 2), (4, 1), (13, 3), (15, 1), (16, 1)],
  term ((-39060 : Rat) / 3749) [(1, 1), (3, 1), (4, 1), (13, 3), (15, 1), (16, 1)],
  term ((19530 : Rat) / 3749) [(1, 2), (4, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 10. -/
theorem rs_R005_ueqv_R005YNY_partial_10_0009_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_10_0009
        rs_R005_ueqv_R005YNY_generator_10_0000_0034 =
      rs_R005_ueqv_R005YNY_partial_10_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 10. -/
def rs_R005_ueqv_R005YNY_coefficient_10_0010 : Poly :=
[
  term ((37548 : Rat) / 3749) [(4, 1), (16, 1)]
]

/-- Partial product 10 for generator 10. -/
def rs_R005_ueqv_R005YNY_partial_10_0010 : Poly :=
[
  term ((-75096 : Rat) / 3749) [(0, 1), (2, 1), (4, 1), (16, 1)],
  term ((37548 : Rat) / 3749) [(0, 2), (4, 1), (16, 1)],
  term ((-75096 : Rat) / 3749) [(1, 1), (3, 1), (4, 1), (16, 1)],
  term ((37548 : Rat) / 3749) [(1, 2), (4, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 10. -/
theorem rs_R005_ueqv_R005YNY_partial_10_0010_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_10_0010
        rs_R005_ueqv_R005YNY_generator_10_0000_0034 =
      rs_R005_ueqv_R005YNY_partial_10_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 10. -/
def rs_R005_ueqv_R005YNY_coefficient_10_0011 : Poly :=
[
  term ((141120 : Rat) / 41239) [(5, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 11 for generator 10. -/
def rs_R005_ueqv_R005YNY_partial_10_0011 : Poly :=
[
  term ((-282240 : Rat) / 41239) [(0, 1), (2, 1), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((141120 : Rat) / 41239) [(0, 2), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((-282240 : Rat) / 41239) [(1, 1), (3, 1), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((141120 : Rat) / 41239) [(1, 2), (5, 1), (8, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 10. -/
theorem rs_R005_ueqv_R005YNY_partial_10_0011_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_10_0011
        rs_R005_ueqv_R005YNY_generator_10_0000_0034 =
      rs_R005_ueqv_R005YNY_partial_10_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 10. -/
def rs_R005_ueqv_R005YNY_coefficient_10_0012 : Poly :=
[
  term ((84210 : Rat) / 1793) [(5, 1), (9, 1), (16, 1)]
]

/-- Partial product 12 for generator 10. -/
def rs_R005_ueqv_R005YNY_partial_10_0012 : Poly :=
[
  term ((-168420 : Rat) / 1793) [(0, 1), (2, 1), (5, 1), (9, 1), (16, 1)],
  term ((84210 : Rat) / 1793) [(0, 2), (5, 1), (9, 1), (16, 1)],
  term ((-168420 : Rat) / 1793) [(1, 1), (3, 1), (5, 1), (9, 1), (16, 1)],
  term ((84210 : Rat) / 1793) [(1, 2), (5, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 10. -/
theorem rs_R005_ueqv_R005YNY_partial_10_0012_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_10_0012
        rs_R005_ueqv_R005YNY_generator_10_0000_0034 =
      rs_R005_ueqv_R005YNY_partial_10_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 10. -/
def rs_R005_ueqv_R005YNY_coefficient_10_0013 : Poly :=
[
  term ((-2014866 : Rat) / 41239) [(5, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 13 for generator 10. -/
def rs_R005_ueqv_R005YNY_partial_10_0013 : Poly :=
[
  term ((4029732 : Rat) / 41239) [(0, 1), (2, 1), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((-2014866 : Rat) / 41239) [(0, 2), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((4029732 : Rat) / 41239) [(1, 1), (3, 1), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((-2014866 : Rat) / 41239) [(1, 2), (5, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 10. -/
theorem rs_R005_ueqv_R005YNY_partial_10_0013_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_10_0013
        rs_R005_ueqv_R005YNY_generator_10_0000_0034 =
      rs_R005_ueqv_R005YNY_partial_10_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 10. -/
def rs_R005_ueqv_R005YNY_coefficient_10_0014 : Poly :=
[
  term ((-2873703 : Rat) / 41239) [(5, 1), (11, 1), (16, 1)]
]

/-- Partial product 14 for generator 10. -/
def rs_R005_ueqv_R005YNY_partial_10_0014 : Poly :=
[
  term ((5747406 : Rat) / 41239) [(0, 1), (2, 1), (5, 1), (11, 1), (16, 1)],
  term ((-2873703 : Rat) / 41239) [(0, 2), (5, 1), (11, 1), (16, 1)],
  term ((5747406 : Rat) / 41239) [(1, 1), (3, 1), (5, 1), (11, 1), (16, 1)],
  term ((-2873703 : Rat) / 41239) [(1, 2), (5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 10. -/
theorem rs_R005_ueqv_R005YNY_partial_10_0014_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_10_0014
        rs_R005_ueqv_R005YNY_generator_10_0000_0034 =
      rs_R005_ueqv_R005YNY_partial_10_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 10. -/
def rs_R005_ueqv_R005YNY_coefficient_10_0015 : Poly :=
[
  term ((-234801 : Rat) / 82478) [(5, 1), (13, 1), (16, 1)]
]

/-- Partial product 15 for generator 10. -/
def rs_R005_ueqv_R005YNY_partial_10_0015 : Poly :=
[
  term ((234801 : Rat) / 41239) [(0, 1), (2, 1), (5, 1), (13, 1), (16, 1)],
  term ((-234801 : Rat) / 82478) [(0, 2), (5, 1), (13, 1), (16, 1)],
  term ((234801 : Rat) / 41239) [(1, 1), (3, 1), (5, 1), (13, 1), (16, 1)],
  term ((-234801 : Rat) / 82478) [(1, 2), (5, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 10. -/
theorem rs_R005_ueqv_R005YNY_partial_10_0015_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_10_0015
        rs_R005_ueqv_R005YNY_generator_10_0000_0034 =
      rs_R005_ueqv_R005YNY_partial_10_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 10. -/
def rs_R005_ueqv_R005YNY_coefficient_10_0016 : Poly :=
[
  term ((-1007433 : Rat) / 41239) [(5, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 16 for generator 10. -/
def rs_R005_ueqv_R005YNY_partial_10_0016 : Poly :=
[
  term ((2014866 : Rat) / 41239) [(0, 1), (2, 1), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1007433 : Rat) / 41239) [(0, 2), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((2014866 : Rat) / 41239) [(1, 1), (3, 1), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1007433 : Rat) / 41239) [(1, 2), (5, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 10. -/
theorem rs_R005_ueqv_R005YNY_partial_10_0016_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_10_0016
        rs_R005_ueqv_R005YNY_generator_10_0000_0034 =
      rs_R005_ueqv_R005YNY_partial_10_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 10. -/
def rs_R005_ueqv_R005YNY_coefficient_10_0017 : Poly :=
[
  term ((2939601 : Rat) / 164956) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 17 for generator 10. -/
def rs_R005_ueqv_R005YNY_partial_10_0017 : Poly :=
[
  term ((-2939601 : Rat) / 82478) [(0, 1), (2, 1), (5, 1), (15, 1), (16, 1)],
  term ((2939601 : Rat) / 164956) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((-2939601 : Rat) / 82478) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((2939601 : Rat) / 164956) [(1, 2), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 10. -/
theorem rs_R005_ueqv_R005YNY_partial_10_0017_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_10_0017
        rs_R005_ueqv_R005YNY_generator_10_0000_0034 =
      rs_R005_ueqv_R005YNY_partial_10_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 10. -/
def rs_R005_ueqv_R005YNY_coefficient_10_0018 : Poly :=
[
  term ((435556 : Rat) / 26243) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 18 for generator 10. -/
def rs_R005_ueqv_R005YNY_partial_10_0018 : Poly :=
[
  term ((-871112 : Rat) / 26243) [(0, 1), (2, 1), (7, 1), (13, 1), (16, 1)],
  term ((435556 : Rat) / 26243) [(0, 2), (7, 1), (13, 1), (16, 1)],
  term ((-871112 : Rat) / 26243) [(1, 1), (3, 1), (7, 1), (13, 1), (16, 1)],
  term ((435556 : Rat) / 26243) [(1, 2), (7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 10. -/
theorem rs_R005_ueqv_R005YNY_partial_10_0018_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_10_0018
        rs_R005_ueqv_R005YNY_generator_10_0000_0034 =
      rs_R005_ueqv_R005YNY_partial_10_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 10. -/
def rs_R005_ueqv_R005YNY_coefficient_10_0019 : Poly :=
[
  term ((-871112 : Rat) / 26243) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 19 for generator 10. -/
def rs_R005_ueqv_R005YNY_partial_10_0019 : Poly :=
[
  term ((1742224 : Rat) / 26243) [(0, 1), (2, 1), (7, 1), (15, 1), (16, 1)],
  term ((-871112 : Rat) / 26243) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((1742224 : Rat) / 26243) [(1, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((-871112 : Rat) / 26243) [(1, 2), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 10. -/
theorem rs_R005_ueqv_R005YNY_partial_10_0019_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_10_0019
        rs_R005_ueqv_R005YNY_generator_10_0000_0034 =
      rs_R005_ueqv_R005YNY_partial_10_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 10. -/
def rs_R005_ueqv_R005YNY_coefficient_10_0020 : Poly :=
[
  term ((-224220 : Rat) / 3749) [(8, 1), (13, 2), (16, 1)]
]

/-- Partial product 20 for generator 10. -/
def rs_R005_ueqv_R005YNY_partial_10_0020 : Poly :=
[
  term ((448440 : Rat) / 3749) [(0, 1), (2, 1), (8, 1), (13, 2), (16, 1)],
  term ((-224220 : Rat) / 3749) [(0, 2), (8, 1), (13, 2), (16, 1)],
  term ((448440 : Rat) / 3749) [(1, 1), (3, 1), (8, 1), (13, 2), (16, 1)],
  term ((-224220 : Rat) / 3749) [(1, 2), (8, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 10. -/
theorem rs_R005_ueqv_R005YNY_partial_10_0020_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_10_0020
        rs_R005_ueqv_R005YNY_generator_10_0000_0034 =
      rs_R005_ueqv_R005YNY_partial_10_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 10. -/
def rs_R005_ueqv_R005YNY_coefficient_10_0021 : Poly :=
[
  term ((-148254 : Rat) / 3749) [(8, 1), (16, 1)]
]

/-- Partial product 21 for generator 10. -/
def rs_R005_ueqv_R005YNY_partial_10_0021 : Poly :=
[
  term ((296508 : Rat) / 3749) [(0, 1), (2, 1), (8, 1), (16, 1)],
  term ((-148254 : Rat) / 3749) [(0, 2), (8, 1), (16, 1)],
  term ((296508 : Rat) / 3749) [(1, 1), (3, 1), (8, 1), (16, 1)],
  term ((-148254 : Rat) / 3749) [(1, 2), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 10. -/
theorem rs_R005_ueqv_R005YNY_partial_10_0021_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_10_0021
        rs_R005_ueqv_R005YNY_generator_10_0000_0034 =
      rs_R005_ueqv_R005YNY_partial_10_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 10. -/
def rs_R005_ueqv_R005YNY_coefficient_10_0022 : Poly :=
[
  term ((256977 : Rat) / 3749) [(9, 1), (11, 1), (16, 1)]
]

/-- Partial product 22 for generator 10. -/
def rs_R005_ueqv_R005YNY_partial_10_0022 : Poly :=
[
  term ((-513954 : Rat) / 3749) [(0, 1), (2, 1), (9, 1), (11, 1), (16, 1)],
  term ((256977 : Rat) / 3749) [(0, 2), (9, 1), (11, 1), (16, 1)],
  term ((-513954 : Rat) / 3749) [(1, 1), (3, 1), (9, 1), (11, 1), (16, 1)],
  term ((256977 : Rat) / 3749) [(1, 2), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 10. -/
theorem rs_R005_ueqv_R005YNY_partial_10_0022_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_10_0022
        rs_R005_ueqv_R005YNY_generator_10_0000_0034 =
      rs_R005_ueqv_R005YNY_partial_10_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 10. -/
def rs_R005_ueqv_R005YNY_coefficient_10_0023 : Poly :=
[
  term ((-2164403 : Rat) / 52486) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 23 for generator 10. -/
def rs_R005_ueqv_R005YNY_partial_10_0023 : Poly :=
[
  term ((2164403 : Rat) / 26243) [(0, 1), (2, 1), (9, 1), (13, 1), (16, 1)],
  term ((-2164403 : Rat) / 52486) [(0, 2), (9, 1), (13, 1), (16, 1)],
  term ((2164403 : Rat) / 26243) [(1, 1), (3, 1), (9, 1), (13, 1), (16, 1)],
  term ((-2164403 : Rat) / 52486) [(1, 2), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 10. -/
theorem rs_R005_ueqv_R005YNY_partial_10_0023_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_10_0023
        rs_R005_ueqv_R005YNY_generator_10_0000_0034 =
      rs_R005_ueqv_R005YNY_partial_10_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 10. -/
def rs_R005_ueqv_R005YNY_coefficient_10_0024 : Poly :=
[
  term ((5449383 : Rat) / 52486) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 24 for generator 10. -/
def rs_R005_ueqv_R005YNY_partial_10_0024 : Poly :=
[
  term ((-5449383 : Rat) / 26243) [(0, 1), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((5449383 : Rat) / 52486) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((-5449383 : Rat) / 26243) [(1, 1), (3, 1), (9, 1), (15, 1), (16, 1)],
  term ((5449383 : Rat) / 52486) [(1, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 10. -/
theorem rs_R005_ueqv_R005YNY_partial_10_0024_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_10_0024
        rs_R005_ueqv_R005YNY_generator_10_0000_0034 =
      rs_R005_ueqv_R005YNY_partial_10_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 10. -/
def rs_R005_ueqv_R005YNY_coefficient_10_0025 : Poly :=
[
  term ((-256977 : Rat) / 3749) [(9, 2), (16, 1)]
]

/-- Partial product 25 for generator 10. -/
def rs_R005_ueqv_R005YNY_partial_10_0025 : Poly :=
[
  term ((513954 : Rat) / 3749) [(0, 1), (2, 1), (9, 2), (16, 1)],
  term ((-256977 : Rat) / 3749) [(0, 2), (9, 2), (16, 1)],
  term ((513954 : Rat) / 3749) [(1, 1), (3, 1), (9, 2), (16, 1)],
  term ((-256977 : Rat) / 3749) [(1, 2), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 10. -/
theorem rs_R005_ueqv_R005YNY_partial_10_0025_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_10_0025
        rs_R005_ueqv_R005YNY_generator_10_0000_0034 =
      rs_R005_ueqv_R005YNY_partial_10_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 10. -/
def rs_R005_ueqv_R005YNY_coefficient_10_0026 : Poly :=
[
  term ((-2049441 : Rat) / 52486) [(10, 1), (13, 2), (16, 1)]
]

/-- Partial product 26 for generator 10. -/
def rs_R005_ueqv_R005YNY_partial_10_0026 : Poly :=
[
  term ((2049441 : Rat) / 26243) [(0, 1), (2, 1), (10, 1), (13, 2), (16, 1)],
  term ((-2049441 : Rat) / 52486) [(0, 2), (10, 1), (13, 2), (16, 1)],
  term ((2049441 : Rat) / 26243) [(1, 1), (3, 1), (10, 1), (13, 2), (16, 1)],
  term ((-2049441 : Rat) / 52486) [(1, 2), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 10. -/
theorem rs_R005_ueqv_R005YNY_partial_10_0026_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_10_0026
        rs_R005_ueqv_R005YNY_generator_10_0000_0034 =
      rs_R005_ueqv_R005YNY_partial_10_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 10. -/
def rs_R005_ueqv_R005YNY_coefficient_10_0027 : Poly :=
[
  term ((2161137 : Rat) / 26243) [(10, 1), (16, 1)]
]

/-- Partial product 27 for generator 10. -/
def rs_R005_ueqv_R005YNY_partial_10_0027 : Poly :=
[
  term ((-4322274 : Rat) / 26243) [(0, 1), (2, 1), (10, 1), (16, 1)],
  term ((2161137 : Rat) / 26243) [(0, 2), (10, 1), (16, 1)],
  term ((-4322274 : Rat) / 26243) [(1, 1), (3, 1), (10, 1), (16, 1)],
  term ((2161137 : Rat) / 26243) [(1, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 10. -/
theorem rs_R005_ueqv_R005YNY_partial_10_0027_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_10_0027
        rs_R005_ueqv_R005YNY_generator_10_0000_0034 =
      rs_R005_ueqv_R005YNY_partial_10_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 10. -/
def rs_R005_ueqv_R005YNY_coefficient_10_0028 : Poly :=
[
  term ((15702989 : Rat) / 104972) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 28 for generator 10. -/
def rs_R005_ueqv_R005YNY_partial_10_0028 : Poly :=
[
  term ((-15702989 : Rat) / 52486) [(0, 1), (2, 1), (11, 1), (13, 1), (16, 1)],
  term ((15702989 : Rat) / 104972) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term ((-15702989 : Rat) / 52486) [(1, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((15702989 : Rat) / 104972) [(1, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 10. -/
theorem rs_R005_ueqv_R005YNY_partial_10_0028_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_10_0028
        rs_R005_ueqv_R005YNY_generator_10_0000_0034 =
      rs_R005_ueqv_R005YNY_partial_10_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 10. -/
def rs_R005_ueqv_R005YNY_coefficient_10_0029 : Poly :=
[
  term ((-14816731 : Rat) / 52486) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 29 for generator 10. -/
def rs_R005_ueqv_R005YNY_partial_10_0029 : Poly :=
[
  term ((14816731 : Rat) / 26243) [(0, 1), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((-14816731 : Rat) / 52486) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((14816731 : Rat) / 26243) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((-14816731 : Rat) / 52486) [(1, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 10. -/
theorem rs_R005_ueqv_R005YNY_partial_10_0029_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_10_0029
        rs_R005_ueqv_R005YNY_generator_10_0000_0034 =
      rs_R005_ueqv_R005YNY_partial_10_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 10. -/
def rs_R005_ueqv_R005YNY_coefficient_10_0030 : Poly :=
[
  term ((-106059239 : Rat) / 419888) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 30 for generator 10. -/
def rs_R005_ueqv_R005YNY_partial_10_0030 : Poly :=
[
  term ((106059239 : Rat) / 209944) [(0, 1), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((-106059239 : Rat) / 419888) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((106059239 : Rat) / 209944) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((-106059239 : Rat) / 419888) [(1, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 10. -/
theorem rs_R005_ueqv_R005YNY_partial_10_0030_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_10_0030
        rs_R005_ueqv_R005YNY_generator_10_0000_0034 =
      rs_R005_ueqv_R005YNY_partial_10_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 10. -/
def rs_R005_ueqv_R005YNY_coefficient_10_0031 : Poly :=
[
  term ((40271711 : Rat) / 209944) [(13, 2), (16, 1)]
]

/-- Partial product 31 for generator 10. -/
def rs_R005_ueqv_R005YNY_partial_10_0031 : Poly :=
[
  term ((-40271711 : Rat) / 104972) [(0, 1), (2, 1), (13, 2), (16, 1)],
  term ((40271711 : Rat) / 209944) [(0, 2), (13, 2), (16, 1)],
  term ((-40271711 : Rat) / 104972) [(1, 1), (3, 1), (13, 2), (16, 1)],
  term ((40271711 : Rat) / 209944) [(1, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 10. -/
theorem rs_R005_ueqv_R005YNY_partial_10_0031_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_10_0031
        rs_R005_ueqv_R005YNY_generator_10_0000_0034 =
      rs_R005_ueqv_R005YNY_partial_10_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 10. -/
def rs_R005_ueqv_R005YNY_coefficient_10_0032 : Poly :=
[
  term ((-2049441 : Rat) / 104972) [(13, 3), (15, 1), (16, 1)]
]

/-- Partial product 32 for generator 10. -/
def rs_R005_ueqv_R005YNY_partial_10_0032 : Poly :=
[
  term ((2049441 : Rat) / 52486) [(0, 1), (2, 1), (13, 3), (15, 1), (16, 1)],
  term ((-2049441 : Rat) / 104972) [(0, 2), (13, 3), (15, 1), (16, 1)],
  term ((2049441 : Rat) / 52486) [(1, 1), (3, 1), (13, 3), (15, 1), (16, 1)],
  term ((-2049441 : Rat) / 104972) [(1, 2), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 10. -/
theorem rs_R005_ueqv_R005YNY_partial_10_0032_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_10_0032
        rs_R005_ueqv_R005YNY_generator_10_0000_0034 =
      rs_R005_ueqv_R005YNY_partial_10_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 10. -/
def rs_R005_ueqv_R005YNY_coefficient_10_0033 : Poly :=
[
  term ((498151 : Rat) / 3749) [(15, 2), (16, 1)]
]

/-- Partial product 33 for generator 10. -/
def rs_R005_ueqv_R005YNY_partial_10_0033 : Poly :=
[
  term ((-996302 : Rat) / 3749) [(0, 1), (2, 1), (15, 2), (16, 1)],
  term ((498151 : Rat) / 3749) [(0, 2), (15, 2), (16, 1)],
  term ((-996302 : Rat) / 3749) [(1, 1), (3, 1), (15, 2), (16, 1)],
  term ((498151 : Rat) / 3749) [(1, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 10. -/
theorem rs_R005_ueqv_R005YNY_partial_10_0033_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_10_0033
        rs_R005_ueqv_R005YNY_generator_10_0000_0034 =
      rs_R005_ueqv_R005YNY_partial_10_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 10. -/
def rs_R005_ueqv_R005YNY_coefficient_10_0034 : Poly :=
[
  term ((-1202034 : Rat) / 26243) [(16, 1)]
]

/-- Partial product 34 for generator 10. -/
def rs_R005_ueqv_R005YNY_partial_10_0034 : Poly :=
[
  term ((2404068 : Rat) / 26243) [(0, 1), (2, 1), (16, 1)],
  term ((-1202034 : Rat) / 26243) [(0, 2), (16, 1)],
  term ((2404068 : Rat) / 26243) [(1, 1), (3, 1), (16, 1)],
  term ((-1202034 : Rat) / 26243) [(1, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 10. -/
theorem rs_R005_ueqv_R005YNY_partial_10_0034_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_10_0034
        rs_R005_ueqv_R005YNY_generator_10_0000_0034 =
      rs_R005_ueqv_R005YNY_partial_10_0034 := by
  native_decide

/-- Partial products in this block. -/
def rs_R005_ueqv_R005YNY_partials_10_0000_0034 : List Poly :=
[
  rs_R005_ueqv_R005YNY_partial_10_0000,
  rs_R005_ueqv_R005YNY_partial_10_0001,
  rs_R005_ueqv_R005YNY_partial_10_0002,
  rs_R005_ueqv_R005YNY_partial_10_0003,
  rs_R005_ueqv_R005YNY_partial_10_0004,
  rs_R005_ueqv_R005YNY_partial_10_0005,
  rs_R005_ueqv_R005YNY_partial_10_0006,
  rs_R005_ueqv_R005YNY_partial_10_0007,
  rs_R005_ueqv_R005YNY_partial_10_0008,
  rs_R005_ueqv_R005YNY_partial_10_0009,
  rs_R005_ueqv_R005YNY_partial_10_0010,
  rs_R005_ueqv_R005YNY_partial_10_0011,
  rs_R005_ueqv_R005YNY_partial_10_0012,
  rs_R005_ueqv_R005YNY_partial_10_0013,
  rs_R005_ueqv_R005YNY_partial_10_0014,
  rs_R005_ueqv_R005YNY_partial_10_0015,
  rs_R005_ueqv_R005YNY_partial_10_0016,
  rs_R005_ueqv_R005YNY_partial_10_0017,
  rs_R005_ueqv_R005YNY_partial_10_0018,
  rs_R005_ueqv_R005YNY_partial_10_0019,
  rs_R005_ueqv_R005YNY_partial_10_0020,
  rs_R005_ueqv_R005YNY_partial_10_0021,
  rs_R005_ueqv_R005YNY_partial_10_0022,
  rs_R005_ueqv_R005YNY_partial_10_0023,
  rs_R005_ueqv_R005YNY_partial_10_0024,
  rs_R005_ueqv_R005YNY_partial_10_0025,
  rs_R005_ueqv_R005YNY_partial_10_0026,
  rs_R005_ueqv_R005YNY_partial_10_0027,
  rs_R005_ueqv_R005YNY_partial_10_0028,
  rs_R005_ueqv_R005YNY_partial_10_0029,
  rs_R005_ueqv_R005YNY_partial_10_0030,
  rs_R005_ueqv_R005YNY_partial_10_0031,
  rs_R005_ueqv_R005YNY_partial_10_0032,
  rs_R005_ueqv_R005YNY_partial_10_0033,
  rs_R005_ueqv_R005YNY_partial_10_0034
]

/-- Sum of partial products in this block. -/
def rs_R005_ueqv_R005YNY_block_10_0000_0034 : Poly :=
[
  term ((-1742224 : Rat) / 26243) [(0, 1), (2, 1), (3, 1), (13, 1), (16, 1)],
  term ((3484448 : Rat) / 26243) [(0, 1), (2, 1), (3, 1), (15, 1), (16, 1)],
  term ((332640 : Rat) / 3749) [(0, 1), (2, 1), (4, 1), (8, 1), (13, 2), (16, 1)],
  term ((639240 : Rat) / 3749) [(0, 1), (2, 1), (4, 1), (9, 1), (13, 1), (16, 1)],
  term ((-78120 : Rat) / 3749) [(0, 1), (2, 1), (4, 1), (10, 1), (13, 2), (16, 1)],
  term ((237888 : Rat) / 3749) [(0, 1), (2, 1), (4, 1), (10, 1), (16, 1)],
  term ((-22260 : Rat) / 163) [(0, 1), (2, 1), (4, 1), (11, 1), (13, 1), (16, 1)],
  term ((311661 : Rat) / 3749) [(0, 1), (2, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-746970 : Rat) / 3749) [(0, 1), (2, 1), (4, 1), (13, 2), (16, 1)],
  term ((-39060 : Rat) / 3749) [(0, 1), (2, 1), (4, 1), (13, 3), (15, 1), (16, 1)],
  term ((-75096 : Rat) / 3749) [(0, 1), (2, 1), (4, 1), (16, 1)],
  term ((-282240 : Rat) / 41239) [(0, 1), (2, 1), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((-168420 : Rat) / 1793) [(0, 1), (2, 1), (5, 1), (9, 1), (16, 1)],
  term ((4029732 : Rat) / 41239) [(0, 1), (2, 1), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((5747406 : Rat) / 41239) [(0, 1), (2, 1), (5, 1), (11, 1), (16, 1)],
  term ((234801 : Rat) / 41239) [(0, 1), (2, 1), (5, 1), (13, 1), (16, 1)],
  term ((2014866 : Rat) / 41239) [(0, 1), (2, 1), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((-2939601 : Rat) / 82478) [(0, 1), (2, 1), (5, 1), (15, 1), (16, 1)],
  term ((-871112 : Rat) / 26243) [(0, 1), (2, 1), (7, 1), (13, 1), (16, 1)],
  term ((1742224 : Rat) / 26243) [(0, 1), (2, 1), (7, 1), (15, 1), (16, 1)],
  term ((448440 : Rat) / 3749) [(0, 1), (2, 1), (8, 1), (13, 2), (16, 1)],
  term ((296508 : Rat) / 3749) [(0, 1), (2, 1), (8, 1), (16, 1)],
  term ((-513954 : Rat) / 3749) [(0, 1), (2, 1), (9, 1), (11, 1), (16, 1)],
  term ((2164403 : Rat) / 26243) [(0, 1), (2, 1), (9, 1), (13, 1), (16, 1)],
  term ((-5449383 : Rat) / 26243) [(0, 1), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((513954 : Rat) / 3749) [(0, 1), (2, 1), (9, 2), (16, 1)],
  term ((2049441 : Rat) / 26243) [(0, 1), (2, 1), (10, 1), (13, 2), (16, 1)],
  term ((-4322274 : Rat) / 26243) [(0, 1), (2, 1), (10, 1), (16, 1)],
  term ((-15702989 : Rat) / 52486) [(0, 1), (2, 1), (11, 1), (13, 1), (16, 1)],
  term ((14816731 : Rat) / 26243) [(0, 1), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((106059239 : Rat) / 209944) [(0, 1), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((-40271711 : Rat) / 104972) [(0, 1), (2, 1), (13, 2), (16, 1)],
  term ((2049441 : Rat) / 52486) [(0, 1), (2, 1), (13, 3), (15, 1), (16, 1)],
  term ((-996302 : Rat) / 3749) [(0, 1), (2, 1), (15, 2), (16, 1)],
  term ((2404068 : Rat) / 26243) [(0, 1), (2, 1), (16, 1)],
  term ((871112 : Rat) / 26243) [(0, 2), (3, 1), (13, 1), (16, 1)],
  term ((-1742224 : Rat) / 26243) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((-166320 : Rat) / 3749) [(0, 2), (4, 1), (8, 1), (13, 2), (16, 1)],
  term ((-319620 : Rat) / 3749) [(0, 2), (4, 1), (9, 1), (13, 1), (16, 1)],
  term ((39060 : Rat) / 3749) [(0, 2), (4, 1), (10, 1), (13, 2), (16, 1)],
  term ((-118944 : Rat) / 3749) [(0, 2), (4, 1), (10, 1), (16, 1)],
  term ((11130 : Rat) / 163) [(0, 2), (4, 1), (11, 1), (13, 1), (16, 1)],
  term ((-311661 : Rat) / 7498) [(0, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((373485 : Rat) / 3749) [(0, 2), (4, 1), (13, 2), (16, 1)],
  term ((19530 : Rat) / 3749) [(0, 2), (4, 1), (13, 3), (15, 1), (16, 1)],
  term ((37548 : Rat) / 3749) [(0, 2), (4, 1), (16, 1)],
  term ((141120 : Rat) / 41239) [(0, 2), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((84210 : Rat) / 1793) [(0, 2), (5, 1), (9, 1), (16, 1)],
  term ((-2014866 : Rat) / 41239) [(0, 2), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((-2873703 : Rat) / 41239) [(0, 2), (5, 1), (11, 1), (16, 1)],
  term ((-234801 : Rat) / 82478) [(0, 2), (5, 1), (13, 1), (16, 1)],
  term ((-1007433 : Rat) / 41239) [(0, 2), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((2939601 : Rat) / 164956) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((435556 : Rat) / 26243) [(0, 2), (7, 1), (13, 1), (16, 1)],
  term ((-871112 : Rat) / 26243) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((-224220 : Rat) / 3749) [(0, 2), (8, 1), (13, 2), (16, 1)],
  term ((-148254 : Rat) / 3749) [(0, 2), (8, 1), (16, 1)],
  term ((256977 : Rat) / 3749) [(0, 2), (9, 1), (11, 1), (16, 1)],
  term ((-2164403 : Rat) / 52486) [(0, 2), (9, 1), (13, 1), (16, 1)],
  term ((5449383 : Rat) / 52486) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((-256977 : Rat) / 3749) [(0, 2), (9, 2), (16, 1)],
  term ((-2049441 : Rat) / 52486) [(0, 2), (10, 1), (13, 2), (16, 1)],
  term ((2161137 : Rat) / 26243) [(0, 2), (10, 1), (16, 1)],
  term ((15702989 : Rat) / 104972) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term ((-14816731 : Rat) / 52486) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((-106059239 : Rat) / 419888) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((40271711 : Rat) / 209944) [(0, 2), (13, 2), (16, 1)],
  term ((-2049441 : Rat) / 104972) [(0, 2), (13, 3), (15, 1), (16, 1)],
  term ((498151 : Rat) / 3749) [(0, 2), (15, 2), (16, 1)],
  term ((-1202034 : Rat) / 26243) [(0, 2), (16, 1)],
  term ((332640 : Rat) / 3749) [(1, 1), (3, 1), (4, 1), (8, 1), (13, 2), (16, 1)],
  term ((639240 : Rat) / 3749) [(1, 1), (3, 1), (4, 1), (9, 1), (13, 1), (16, 1)],
  term ((-78120 : Rat) / 3749) [(1, 1), (3, 1), (4, 1), (10, 1), (13, 2), (16, 1)],
  term ((237888 : Rat) / 3749) [(1, 1), (3, 1), (4, 1), (10, 1), (16, 1)],
  term ((-22260 : Rat) / 163) [(1, 1), (3, 1), (4, 1), (11, 1), (13, 1), (16, 1)],
  term ((311661 : Rat) / 3749) [(1, 1), (3, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-746970 : Rat) / 3749) [(1, 1), (3, 1), (4, 1), (13, 2), (16, 1)],
  term ((-39060 : Rat) / 3749) [(1, 1), (3, 1), (4, 1), (13, 3), (15, 1), (16, 1)],
  term ((-75096 : Rat) / 3749) [(1, 1), (3, 1), (4, 1), (16, 1)],
  term ((-282240 : Rat) / 41239) [(1, 1), (3, 1), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((-168420 : Rat) / 1793) [(1, 1), (3, 1), (5, 1), (9, 1), (16, 1)],
  term ((4029732 : Rat) / 41239) [(1, 1), (3, 1), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((5747406 : Rat) / 41239) [(1, 1), (3, 1), (5, 1), (11, 1), (16, 1)],
  term ((234801 : Rat) / 41239) [(1, 1), (3, 1), (5, 1), (13, 1), (16, 1)],
  term ((2014866 : Rat) / 41239) [(1, 1), (3, 1), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((-2939601 : Rat) / 82478) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((-871112 : Rat) / 26243) [(1, 1), (3, 1), (7, 1), (13, 1), (16, 1)],
  term ((1742224 : Rat) / 26243) [(1, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((448440 : Rat) / 3749) [(1, 1), (3, 1), (8, 1), (13, 2), (16, 1)],
  term ((296508 : Rat) / 3749) [(1, 1), (3, 1), (8, 1), (16, 1)],
  term ((-513954 : Rat) / 3749) [(1, 1), (3, 1), (9, 1), (11, 1), (16, 1)],
  term ((2164403 : Rat) / 26243) [(1, 1), (3, 1), (9, 1), (13, 1), (16, 1)],
  term ((-5449383 : Rat) / 26243) [(1, 1), (3, 1), (9, 1), (15, 1), (16, 1)],
  term ((513954 : Rat) / 3749) [(1, 1), (3, 1), (9, 2), (16, 1)],
  term ((2049441 : Rat) / 26243) [(1, 1), (3, 1), (10, 1), (13, 2), (16, 1)],
  term ((-4322274 : Rat) / 26243) [(1, 1), (3, 1), (10, 1), (16, 1)],
  term ((-15702989 : Rat) / 52486) [(1, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((14816731 : Rat) / 26243) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((106059239 : Rat) / 209944) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((-40271711 : Rat) / 104972) [(1, 1), (3, 1), (13, 2), (16, 1)],
  term ((2049441 : Rat) / 52486) [(1, 1), (3, 1), (13, 3), (15, 1), (16, 1)],
  term ((-996302 : Rat) / 3749) [(1, 1), (3, 1), (15, 2), (16, 1)],
  term ((2404068 : Rat) / 26243) [(1, 1), (3, 1), (16, 1)],
  term ((-1742224 : Rat) / 26243) [(1, 1), (3, 2), (13, 1), (16, 1)],
  term ((3484448 : Rat) / 26243) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((871112 : Rat) / 26243) [(1, 2), (3, 1), (13, 1), (16, 1)],
  term ((-1742224 : Rat) / 26243) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((-166320 : Rat) / 3749) [(1, 2), (4, 1), (8, 1), (13, 2), (16, 1)],
  term ((-319620 : Rat) / 3749) [(1, 2), (4, 1), (9, 1), (13, 1), (16, 1)],
  term ((39060 : Rat) / 3749) [(1, 2), (4, 1), (10, 1), (13, 2), (16, 1)],
  term ((-118944 : Rat) / 3749) [(1, 2), (4, 1), (10, 1), (16, 1)],
  term ((11130 : Rat) / 163) [(1, 2), (4, 1), (11, 1), (13, 1), (16, 1)],
  term ((-311661 : Rat) / 7498) [(1, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((373485 : Rat) / 3749) [(1, 2), (4, 1), (13, 2), (16, 1)],
  term ((19530 : Rat) / 3749) [(1, 2), (4, 1), (13, 3), (15, 1), (16, 1)],
  term ((37548 : Rat) / 3749) [(1, 2), (4, 1), (16, 1)],
  term ((141120 : Rat) / 41239) [(1, 2), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((84210 : Rat) / 1793) [(1, 2), (5, 1), (9, 1), (16, 1)],
  term ((-2014866 : Rat) / 41239) [(1, 2), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((-2873703 : Rat) / 41239) [(1, 2), (5, 1), (11, 1), (16, 1)],
  term ((-234801 : Rat) / 82478) [(1, 2), (5, 1), (13, 1), (16, 1)],
  term ((-1007433 : Rat) / 41239) [(1, 2), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((2939601 : Rat) / 164956) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((435556 : Rat) / 26243) [(1, 2), (7, 1), (13, 1), (16, 1)],
  term ((-871112 : Rat) / 26243) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((-224220 : Rat) / 3749) [(1, 2), (8, 1), (13, 2), (16, 1)],
  term ((-148254 : Rat) / 3749) [(1, 2), (8, 1), (16, 1)],
  term ((256977 : Rat) / 3749) [(1, 2), (9, 1), (11, 1), (16, 1)],
  term ((-2164403 : Rat) / 52486) [(1, 2), (9, 1), (13, 1), (16, 1)],
  term ((5449383 : Rat) / 52486) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((-256977 : Rat) / 3749) [(1, 2), (9, 2), (16, 1)],
  term ((-2049441 : Rat) / 52486) [(1, 2), (10, 1), (13, 2), (16, 1)],
  term ((2161137 : Rat) / 26243) [(1, 2), (10, 1), (16, 1)],
  term ((15702989 : Rat) / 104972) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term ((-14816731 : Rat) / 52486) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-106059239 : Rat) / 419888) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((40271711 : Rat) / 209944) [(1, 2), (13, 2), (16, 1)],
  term ((-2049441 : Rat) / 104972) [(1, 2), (13, 3), (15, 1), (16, 1)],
  term ((498151 : Rat) / 3749) [(1, 2), (15, 2), (16, 1)],
  term ((-1202034 : Rat) / 26243) [(1, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 10, terms 0 through 34. -/
theorem rs_R005_ueqv_R005YNY_block_10_0000_0034_valid :
    checkProductSumEq rs_R005_ueqv_R005YNY_partials_10_0000_0034
      rs_R005_ueqv_R005YNY_block_10_0000_0034 = true := by
  native_decide

end R005UeqvR005YNYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
