/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R005:u=v:R005YNY, term block 14:0-36

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R005UeqvR005YNYTermShards

/-- Generator polynomial 14 for relaxed split surplus certificate `R005:u=v:R005YNY`. -/
def rs_R005_ueqv_R005YNY_generator_14_0000_0036 : Poly :=
[
  term (2 : Rat) [(4, 1), (6, 1)],
  term (2 : Rat) [(5, 1), (7, 1)],
  term (-1 : Rat) [(6, 2)],
  term (-1 : Rat) [(7, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 14. -/
def rs_R005_ueqv_R005YNY_coefficient_14_0000 : Poly :=
[
  term ((103320 : Rat) / 3749) [(3, 1), (9, 1), (16, 1)]
]

/-- Partial product 0 for generator 14. -/
def rs_R005_ueqv_R005YNY_partial_14_0000 : Poly :=
[
  term ((206640 : Rat) / 3749) [(3, 1), (4, 1), (6, 1), (9, 1), (16, 1)],
  term ((206640 : Rat) / 3749) [(3, 1), (5, 1), (7, 1), (9, 1), (16, 1)],
  term ((-103320 : Rat) / 3749) [(3, 1), (6, 2), (9, 1), (16, 1)],
  term ((-103320 : Rat) / 3749) [(3, 1), (7, 2), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 14. -/
theorem rs_R005_ueqv_R005YNY_partial_14_0000_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_14_0000
        rs_R005_ueqv_R005YNY_generator_14_0000_0036 =
      rs_R005_ueqv_R005YNY_partial_14_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 14. -/
def rs_R005_ueqv_R005YNY_coefficient_14_0001 : Poly :=
[
  term ((-1594352 : Rat) / 26243) [(3, 1), (13, 1), (16, 1)]
]

/-- Partial product 1 for generator 14. -/
def rs_R005_ueqv_R005YNY_partial_14_0001 : Poly :=
[
  term ((-3188704 : Rat) / 26243) [(3, 1), (4, 1), (6, 1), (13, 1), (16, 1)],
  term ((-3188704 : Rat) / 26243) [(3, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((1594352 : Rat) / 26243) [(3, 1), (6, 2), (13, 1), (16, 1)],
  term ((1594352 : Rat) / 26243) [(3, 1), (7, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 14. -/
theorem rs_R005_ueqv_R005YNY_partial_14_0001_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_14_0001
        rs_R005_ueqv_R005YNY_generator_14_0000_0036 =
      rs_R005_ueqv_R005YNY_partial_14_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 14. -/
def rs_R005_ueqv_R005YNY_coefficient_14_0002 : Poly :=
[
  term ((1742224 : Rat) / 26243) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 2 for generator 14. -/
def rs_R005_ueqv_R005YNY_partial_14_0002 : Poly :=
[
  term ((3484448 : Rat) / 26243) [(3, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((3484448 : Rat) / 26243) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-1742224 : Rat) / 26243) [(3, 1), (6, 2), (15, 1), (16, 1)],
  term ((-1742224 : Rat) / 26243) [(3, 1), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 14. -/
theorem rs_R005_ueqv_R005YNY_partial_14_0002_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_14_0002
        rs_R005_ueqv_R005YNY_generator_14_0000_0036 =
      rs_R005_ueqv_R005YNY_partial_14_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 14. -/
def rs_R005_ueqv_R005YNY_coefficient_14_0003 : Poly :=
[
  term ((166320 : Rat) / 3749) [(4, 1), (8, 1), (13, 2), (16, 1)]
]

/-- Partial product 3 for generator 14. -/
def rs_R005_ueqv_R005YNY_partial_14_0003 : Poly :=
[
  term ((332640 : Rat) / 3749) [(4, 1), (5, 1), (7, 1), (8, 1), (13, 2), (16, 1)],
  term ((-166320 : Rat) / 3749) [(4, 1), (6, 2), (8, 1), (13, 2), (16, 1)],
  term ((-166320 : Rat) / 3749) [(4, 1), (7, 2), (8, 1), (13, 2), (16, 1)],
  term ((332640 : Rat) / 3749) [(4, 2), (6, 1), (8, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 14. -/
theorem rs_R005_ueqv_R005YNY_partial_14_0003_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_14_0003
        rs_R005_ueqv_R005YNY_generator_14_0000_0036 =
      rs_R005_ueqv_R005YNY_partial_14_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 14. -/
def rs_R005_ueqv_R005YNY_coefficient_14_0004 : Poly :=
[
  term ((319620 : Rat) / 3749) [(4, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 4 for generator 14. -/
def rs_R005_ueqv_R005YNY_partial_14_0004 : Poly :=
[
  term ((639240 : Rat) / 3749) [(4, 1), (5, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((-319620 : Rat) / 3749) [(4, 1), (6, 2), (9, 1), (13, 1), (16, 1)],
  term ((-319620 : Rat) / 3749) [(4, 1), (7, 2), (9, 1), (13, 1), (16, 1)],
  term ((639240 : Rat) / 3749) [(4, 2), (6, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 14. -/
theorem rs_R005_ueqv_R005YNY_partial_14_0004_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_14_0004
        rs_R005_ueqv_R005YNY_generator_14_0000_0036 =
      rs_R005_ueqv_R005YNY_partial_14_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 14. -/
def rs_R005_ueqv_R005YNY_coefficient_14_0005 : Poly :=
[
  term ((-39060 : Rat) / 3749) [(4, 1), (10, 1), (13, 2), (16, 1)]
]

/-- Partial product 5 for generator 14. -/
def rs_R005_ueqv_R005YNY_partial_14_0005 : Poly :=
[
  term ((-78120 : Rat) / 3749) [(4, 1), (5, 1), (7, 1), (10, 1), (13, 2), (16, 1)],
  term ((39060 : Rat) / 3749) [(4, 1), (6, 2), (10, 1), (13, 2), (16, 1)],
  term ((39060 : Rat) / 3749) [(4, 1), (7, 2), (10, 1), (13, 2), (16, 1)],
  term ((-78120 : Rat) / 3749) [(4, 2), (6, 1), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 14. -/
theorem rs_R005_ueqv_R005YNY_partial_14_0005_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_14_0005
        rs_R005_ueqv_R005YNY_generator_14_0000_0036 =
      rs_R005_ueqv_R005YNY_partial_14_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 14. -/
def rs_R005_ueqv_R005YNY_coefficient_14_0006 : Poly :=
[
  term ((118944 : Rat) / 3749) [(4, 1), (10, 1), (16, 1)]
]

/-- Partial product 6 for generator 14. -/
def rs_R005_ueqv_R005YNY_partial_14_0006 : Poly :=
[
  term ((237888 : Rat) / 3749) [(4, 1), (5, 1), (7, 1), (10, 1), (16, 1)],
  term ((-118944 : Rat) / 3749) [(4, 1), (6, 2), (10, 1), (16, 1)],
  term ((-118944 : Rat) / 3749) [(4, 1), (7, 2), (10, 1), (16, 1)],
  term ((237888 : Rat) / 3749) [(4, 2), (6, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 14. -/
theorem rs_R005_ueqv_R005YNY_partial_14_0006_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_14_0006
        rs_R005_ueqv_R005YNY_generator_14_0000_0036 =
      rs_R005_ueqv_R005YNY_partial_14_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 14. -/
def rs_R005_ueqv_R005YNY_coefficient_14_0007 : Poly :=
[
  term ((-11130 : Rat) / 163) [(4, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 7 for generator 14. -/
def rs_R005_ueqv_R005YNY_partial_14_0007 : Poly :=
[
  term ((-22260 : Rat) / 163) [(4, 1), (5, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((11130 : Rat) / 163) [(4, 1), (6, 2), (11, 1), (13, 1), (16, 1)],
  term ((11130 : Rat) / 163) [(4, 1), (7, 2), (11, 1), (13, 1), (16, 1)],
  term ((-22260 : Rat) / 163) [(4, 2), (6, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 14. -/
theorem rs_R005_ueqv_R005YNY_partial_14_0007_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_14_0007
        rs_R005_ueqv_R005YNY_generator_14_0000_0036 =
      rs_R005_ueqv_R005YNY_partial_14_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 14. -/
def rs_R005_ueqv_R005YNY_coefficient_14_0008 : Poly :=
[
  term ((311661 : Rat) / 7498) [(4, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 8 for generator 14. -/
def rs_R005_ueqv_R005YNY_partial_14_0008 : Poly :=
[
  term ((311661 : Rat) / 3749) [(4, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-311661 : Rat) / 7498) [(4, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-311661 : Rat) / 7498) [(4, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((311661 : Rat) / 3749) [(4, 2), (6, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 14. -/
theorem rs_R005_ueqv_R005YNY_partial_14_0008_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_14_0008
        rs_R005_ueqv_R005YNY_generator_14_0000_0036 =
      rs_R005_ueqv_R005YNY_partial_14_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 14. -/
def rs_R005_ueqv_R005YNY_coefficient_14_0009 : Poly :=
[
  term ((-373485 : Rat) / 3749) [(4, 1), (13, 2), (16, 1)]
]

/-- Partial product 9 for generator 14. -/
def rs_R005_ueqv_R005YNY_partial_14_0009 : Poly :=
[
  term ((-746970 : Rat) / 3749) [(4, 1), (5, 1), (7, 1), (13, 2), (16, 1)],
  term ((373485 : Rat) / 3749) [(4, 1), (6, 2), (13, 2), (16, 1)],
  term ((373485 : Rat) / 3749) [(4, 1), (7, 2), (13, 2), (16, 1)],
  term ((-746970 : Rat) / 3749) [(4, 2), (6, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 14. -/
theorem rs_R005_ueqv_R005YNY_partial_14_0009_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_14_0009
        rs_R005_ueqv_R005YNY_generator_14_0000_0036 =
      rs_R005_ueqv_R005YNY_partial_14_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 14. -/
def rs_R005_ueqv_R005YNY_coefficient_14_0010 : Poly :=
[
  term ((-19530 : Rat) / 3749) [(4, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 10 for generator 14. -/
def rs_R005_ueqv_R005YNY_partial_14_0010 : Poly :=
[
  term ((-39060 : Rat) / 3749) [(4, 1), (5, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((19530 : Rat) / 3749) [(4, 1), (6, 2), (13, 3), (15, 1), (16, 1)],
  term ((19530 : Rat) / 3749) [(4, 1), (7, 2), (13, 3), (15, 1), (16, 1)],
  term ((-39060 : Rat) / 3749) [(4, 2), (6, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 14. -/
theorem rs_R005_ueqv_R005YNY_partial_14_0010_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_14_0010
        rs_R005_ueqv_R005YNY_generator_14_0000_0036 =
      rs_R005_ueqv_R005YNY_partial_14_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 14. -/
def rs_R005_ueqv_R005YNY_coefficient_14_0011 : Poly :=
[
  term ((-89208 : Rat) / 3749) [(4, 1), (16, 1)]
]

/-- Partial product 11 for generator 14. -/
def rs_R005_ueqv_R005YNY_partial_14_0011 : Poly :=
[
  term ((-178416 : Rat) / 3749) [(4, 1), (5, 1), (7, 1), (16, 1)],
  term ((89208 : Rat) / 3749) [(4, 1), (6, 2), (16, 1)],
  term ((89208 : Rat) / 3749) [(4, 1), (7, 2), (16, 1)],
  term ((-178416 : Rat) / 3749) [(4, 2), (6, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 14. -/
theorem rs_R005_ueqv_R005YNY_partial_14_0011_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_14_0011
        rs_R005_ueqv_R005YNY_generator_14_0000_0036 =
      rs_R005_ueqv_R005YNY_partial_14_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 14. -/
def rs_R005_ueqv_R005YNY_coefficient_14_0012 : Poly :=
[
  term ((-141120 : Rat) / 41239) [(5, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 12 for generator 14. -/
def rs_R005_ueqv_R005YNY_partial_14_0012 : Poly :=
[
  term ((-282240 : Rat) / 41239) [(4, 1), (5, 1), (6, 1), (8, 1), (13, 1), (16, 1)],
  term ((141120 : Rat) / 41239) [(5, 1), (6, 2), (8, 1), (13, 1), (16, 1)],
  term ((141120 : Rat) / 41239) [(5, 1), (7, 2), (8, 1), (13, 1), (16, 1)],
  term ((-282240 : Rat) / 41239) [(5, 2), (7, 1), (8, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 14. -/
theorem rs_R005_ueqv_R005YNY_partial_14_0012_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_14_0012
        rs_R005_ueqv_R005YNY_generator_14_0000_0036 =
      rs_R005_ueqv_R005YNY_partial_14_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 14. -/
def rs_R005_ueqv_R005YNY_coefficient_14_0013 : Poly :=
[
  term ((-84210 : Rat) / 1793) [(5, 1), (9, 1), (16, 1)]
]

/-- Partial product 13 for generator 14. -/
def rs_R005_ueqv_R005YNY_partial_14_0013 : Poly :=
[
  term ((-168420 : Rat) / 1793) [(4, 1), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((84210 : Rat) / 1793) [(5, 1), (6, 2), (9, 1), (16, 1)],
  term ((84210 : Rat) / 1793) [(5, 1), (7, 2), (9, 1), (16, 1)],
  term ((-168420 : Rat) / 1793) [(5, 2), (7, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 14. -/
theorem rs_R005_ueqv_R005YNY_partial_14_0013_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_14_0013
        rs_R005_ueqv_R005YNY_generator_14_0000_0036 =
      rs_R005_ueqv_R005YNY_partial_14_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 14. -/
def rs_R005_ueqv_R005YNY_coefficient_14_0014 : Poly :=
[
  term ((2014866 : Rat) / 41239) [(5, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 14 for generator 14. -/
def rs_R005_ueqv_R005YNY_partial_14_0014 : Poly :=
[
  term ((4029732 : Rat) / 41239) [(4, 1), (5, 1), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((-2014866 : Rat) / 41239) [(5, 1), (6, 2), (10, 1), (13, 1), (16, 1)],
  term ((-2014866 : Rat) / 41239) [(5, 1), (7, 2), (10, 1), (13, 1), (16, 1)],
  term ((4029732 : Rat) / 41239) [(5, 2), (7, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 14. -/
theorem rs_R005_ueqv_R005YNY_partial_14_0014_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_14_0014
        rs_R005_ueqv_R005YNY_generator_14_0000_0036 =
      rs_R005_ueqv_R005YNY_partial_14_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 14. -/
def rs_R005_ueqv_R005YNY_coefficient_14_0015 : Poly :=
[
  term ((2873703 : Rat) / 41239) [(5, 1), (11, 1), (16, 1)]
]

/-- Partial product 15 for generator 14. -/
def rs_R005_ueqv_R005YNY_partial_14_0015 : Poly :=
[
  term ((5747406 : Rat) / 41239) [(4, 1), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((-2873703 : Rat) / 41239) [(5, 1), (6, 2), (11, 1), (16, 1)],
  term ((-2873703 : Rat) / 41239) [(5, 1), (7, 2), (11, 1), (16, 1)],
  term ((5747406 : Rat) / 41239) [(5, 2), (7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 14. -/
theorem rs_R005_ueqv_R005YNY_partial_14_0015_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_14_0015
        rs_R005_ueqv_R005YNY_generator_14_0000_0036 =
      rs_R005_ueqv_R005YNY_partial_14_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 14. -/
def rs_R005_ueqv_R005YNY_coefficient_14_0016 : Poly :=
[
  term ((234801 : Rat) / 82478) [(5, 1), (13, 1), (16, 1)]
]

/-- Partial product 16 for generator 14. -/
def rs_R005_ueqv_R005YNY_partial_14_0016 : Poly :=
[
  term ((234801 : Rat) / 41239) [(4, 1), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((-234801 : Rat) / 82478) [(5, 1), (6, 2), (13, 1), (16, 1)],
  term ((-234801 : Rat) / 82478) [(5, 1), (7, 2), (13, 1), (16, 1)],
  term ((234801 : Rat) / 41239) [(5, 2), (7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 14. -/
theorem rs_R005_ueqv_R005YNY_partial_14_0016_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_14_0016
        rs_R005_ueqv_R005YNY_generator_14_0000_0036 =
      rs_R005_ueqv_R005YNY_partial_14_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 14. -/
def rs_R005_ueqv_R005YNY_coefficient_14_0017 : Poly :=
[
  term ((1007433 : Rat) / 41239) [(5, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 17 for generator 14. -/
def rs_R005_ueqv_R005YNY_partial_14_0017 : Poly :=
[
  term ((2014866 : Rat) / 41239) [(4, 1), (5, 1), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1007433 : Rat) / 41239) [(5, 1), (6, 2), (13, 2), (15, 1), (16, 1)],
  term ((-1007433 : Rat) / 41239) [(5, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((2014866 : Rat) / 41239) [(5, 2), (7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 14. -/
theorem rs_R005_ueqv_R005YNY_partial_14_0017_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_14_0017
        rs_R005_ueqv_R005YNY_generator_14_0000_0036 =
      rs_R005_ueqv_R005YNY_partial_14_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 14. -/
def rs_R005_ueqv_R005YNY_coefficient_14_0018 : Poly :=
[
  term ((-2939601 : Rat) / 164956) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 18 for generator 14. -/
def rs_R005_ueqv_R005YNY_partial_14_0018 : Poly :=
[
  term ((-2939601 : Rat) / 82478) [(4, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((2939601 : Rat) / 164956) [(5, 1), (6, 2), (15, 1), (16, 1)],
  term ((2939601 : Rat) / 164956) [(5, 1), (7, 2), (15, 1), (16, 1)],
  term ((-2939601 : Rat) / 82478) [(5, 2), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 14. -/
theorem rs_R005_ueqv_R005YNY_partial_14_0018_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_14_0018
        rs_R005_ueqv_R005YNY_generator_14_0000_0036 =
      rs_R005_ueqv_R005YNY_partial_14_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 14. -/
def rs_R005_ueqv_R005YNY_coefficient_14_0019 : Poly :=
[
  term ((74592 : Rat) / 3749) [(7, 1), (9, 1), (16, 1)]
]

/-- Partial product 19 for generator 14. -/
def rs_R005_ueqv_R005YNY_partial_14_0019 : Poly :=
[
  term ((149184 : Rat) / 3749) [(4, 1), (6, 1), (7, 1), (9, 1), (16, 1)],
  term ((149184 : Rat) / 3749) [(5, 1), (7, 2), (9, 1), (16, 1)],
  term ((-74592 : Rat) / 3749) [(6, 2), (7, 1), (9, 1), (16, 1)],
  term ((-74592 : Rat) / 3749) [(7, 3), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 14. -/
theorem rs_R005_ueqv_R005YNY_partial_14_0019_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_14_0019
        rs_R005_ueqv_R005YNY_generator_14_0000_0036 =
      rs_R005_ueqv_R005YNY_partial_14_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 14. -/
def rs_R005_ueqv_R005YNY_coefficient_14_0020 : Poly :=
[
  term ((-86588 : Rat) / 26243) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 20 for generator 14. -/
def rs_R005_ueqv_R005YNY_partial_14_0020 : Poly :=
[
  term ((-173176 : Rat) / 26243) [(4, 1), (6, 1), (7, 1), (13, 1), (16, 1)],
  term ((-173176 : Rat) / 26243) [(5, 1), (7, 2), (13, 1), (16, 1)],
  term ((86588 : Rat) / 26243) [(6, 2), (7, 1), (13, 1), (16, 1)],
  term ((86588 : Rat) / 26243) [(7, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 14. -/
theorem rs_R005_ueqv_R005YNY_partial_14_0020_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_14_0020
        rs_R005_ueqv_R005YNY_generator_14_0000_0036 =
      rs_R005_ueqv_R005YNY_partial_14_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 14. -/
def rs_R005_ueqv_R005YNY_coefficient_14_0021 : Poly :=
[
  term ((-662960 : Rat) / 26243) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 21 for generator 14. -/
def rs_R005_ueqv_R005YNY_partial_14_0021 : Poly :=
[
  term ((-1325920 : Rat) / 26243) [(4, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-1325920 : Rat) / 26243) [(5, 1), (7, 2), (15, 1), (16, 1)],
  term ((662960 : Rat) / 26243) [(6, 2), (7, 1), (15, 1), (16, 1)],
  term ((662960 : Rat) / 26243) [(7, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 14. -/
theorem rs_R005_ueqv_R005YNY_partial_14_0021_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_14_0021
        rs_R005_ueqv_R005YNY_generator_14_0000_0036 =
      rs_R005_ueqv_R005YNY_partial_14_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 14. -/
def rs_R005_ueqv_R005YNY_coefficient_14_0022 : Poly :=
[
  term ((224220 : Rat) / 3749) [(8, 1), (13, 2), (16, 1)]
]

/-- Partial product 22 for generator 14. -/
def rs_R005_ueqv_R005YNY_partial_14_0022 : Poly :=
[
  term ((448440 : Rat) / 3749) [(4, 1), (6, 1), (8, 1), (13, 2), (16, 1)],
  term ((448440 : Rat) / 3749) [(5, 1), (7, 1), (8, 1), (13, 2), (16, 1)],
  term ((-224220 : Rat) / 3749) [(6, 2), (8, 1), (13, 2), (16, 1)],
  term ((-224220 : Rat) / 3749) [(7, 2), (8, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 14. -/
theorem rs_R005_ueqv_R005YNY_partial_14_0022_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_14_0022
        rs_R005_ueqv_R005YNY_generator_14_0000_0036 =
      rs_R005_ueqv_R005YNY_partial_14_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 14. -/
def rs_R005_ueqv_R005YNY_coefficient_14_0023 : Poly :=
[
  term ((-51708 : Rat) / 3749) [(8, 1), (16, 1)]
]

/-- Partial product 23 for generator 14. -/
def rs_R005_ueqv_R005YNY_partial_14_0023 : Poly :=
[
  term ((-103416 : Rat) / 3749) [(4, 1), (6, 1), (8, 1), (16, 1)],
  term ((-103416 : Rat) / 3749) [(5, 1), (7, 1), (8, 1), (16, 1)],
  term ((51708 : Rat) / 3749) [(6, 2), (8, 1), (16, 1)],
  term ((51708 : Rat) / 3749) [(7, 2), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 14. -/
theorem rs_R005_ueqv_R005YNY_partial_14_0023_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_14_0023
        rs_R005_ueqv_R005YNY_generator_14_0000_0036 =
      rs_R005_ueqv_R005YNY_partial_14_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 14. -/
def rs_R005_ueqv_R005YNY_coefficient_14_0024 : Poly :=
[
  term ((-167013 : Rat) / 3749) [(9, 1), (11, 1), (16, 1)]
]

/-- Partial product 24 for generator 14. -/
def rs_R005_ueqv_R005YNY_partial_14_0024 : Poly :=
[
  term ((-334026 : Rat) / 3749) [(4, 1), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-334026 : Rat) / 3749) [(5, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((167013 : Rat) / 3749) [(6, 2), (9, 1), (11, 1), (16, 1)],
  term ((167013 : Rat) / 3749) [(7, 2), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 14. -/
theorem rs_R005_ueqv_R005YNY_partial_14_0024_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_14_0024
        rs_R005_ueqv_R005YNY_generator_14_0000_0036 =
      rs_R005_ueqv_R005YNY_partial_14_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 14. -/
def rs_R005_ueqv_R005YNY_coefficient_14_0025 : Poly :=
[
  term ((1116587 : Rat) / 52486) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 25 for generator 14. -/
def rs_R005_ueqv_R005YNY_partial_14_0025 : Poly :=
[
  term ((1116587 : Rat) / 26243) [(4, 1), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((1116587 : Rat) / 26243) [(5, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((-1116587 : Rat) / 52486) [(6, 2), (9, 1), (13, 1), (16, 1)],
  term ((-1116587 : Rat) / 52486) [(7, 2), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 14. -/
theorem rs_R005_ueqv_R005YNY_partial_14_0025_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_14_0025
        rs_R005_ueqv_R005YNY_generator_14_0000_0036 =
      rs_R005_ueqv_R005YNY_partial_14_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 14. -/
def rs_R005_ueqv_R005YNY_coefficient_14_0026 : Poly :=
[
  term ((-6895863 : Rat) / 52486) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 26 for generator 14. -/
def rs_R005_ueqv_R005YNY_partial_14_0026 : Poly :=
[
  term ((-6895863 : Rat) / 26243) [(4, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-6895863 : Rat) / 26243) [(5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((6895863 : Rat) / 52486) [(6, 2), (9, 1), (15, 1), (16, 1)],
  term ((6895863 : Rat) / 52486) [(7, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 14. -/
theorem rs_R005_ueqv_R005YNY_partial_14_0026_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_14_0026
        rs_R005_ueqv_R005YNY_generator_14_0000_0036 =
      rs_R005_ueqv_R005YNY_partial_14_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 14. -/
def rs_R005_ueqv_R005YNY_coefficient_14_0027 : Poly :=
[
  term ((182637 : Rat) / 3749) [(9, 2), (16, 1)]
]

/-- Partial product 27 for generator 14. -/
def rs_R005_ueqv_R005YNY_partial_14_0027 : Poly :=
[
  term ((365274 : Rat) / 3749) [(4, 1), (6, 1), (9, 2), (16, 1)],
  term ((365274 : Rat) / 3749) [(5, 1), (7, 1), (9, 2), (16, 1)],
  term ((-182637 : Rat) / 3749) [(6, 2), (9, 2), (16, 1)],
  term ((-182637 : Rat) / 3749) [(7, 2), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 14. -/
theorem rs_R005_ueqv_R005YNY_partial_14_0027_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_14_0027
        rs_R005_ueqv_R005YNY_generator_14_0000_0036 =
      rs_R005_ueqv_R005YNY_partial_14_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 14. -/
def rs_R005_ueqv_R005YNY_coefficient_14_0028 : Poly :=
[
  term ((2049441 : Rat) / 52486) [(10, 1), (13, 2), (16, 1)]
]

/-- Partial product 28 for generator 14. -/
def rs_R005_ueqv_R005YNY_partial_14_0028 : Poly :=
[
  term ((2049441 : Rat) / 26243) [(4, 1), (6, 1), (10, 1), (13, 2), (16, 1)],
  term ((2049441 : Rat) / 26243) [(5, 1), (7, 1), (10, 1), (13, 2), (16, 1)],
  term ((-2049441 : Rat) / 52486) [(6, 2), (10, 1), (13, 2), (16, 1)],
  term ((-2049441 : Rat) / 52486) [(7, 2), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 14. -/
theorem rs_R005_ueqv_R005YNY_partial_14_0028_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_14_0028
        rs_R005_ueqv_R005YNY_generator_14_0000_0036 =
      rs_R005_ueqv_R005YNY_partial_14_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 14. -/
def rs_R005_ueqv_R005YNY_coefficient_14_0029 : Poly :=
[
  term ((452199 : Rat) / 26243) [(10, 1), (16, 1)]
]

/-- Partial product 29 for generator 14. -/
def rs_R005_ueqv_R005YNY_partial_14_0029 : Poly :=
[
  term ((904398 : Rat) / 26243) [(4, 1), (6, 1), (10, 1), (16, 1)],
  term ((904398 : Rat) / 26243) [(5, 1), (7, 1), (10, 1), (16, 1)],
  term ((-452199 : Rat) / 26243) [(6, 2), (10, 1), (16, 1)],
  term ((-452199 : Rat) / 26243) [(7, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 14. -/
theorem rs_R005_ueqv_R005YNY_partial_14_0029_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_14_0029
        rs_R005_ueqv_R005YNY_generator_14_0000_0036 =
      rs_R005_ueqv_R005YNY_partial_14_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 14. -/
def rs_R005_ueqv_R005YNY_coefficient_14_0030 : Poly :=
[
  term ((-612027 : Rat) / 14996) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 30 for generator 14. -/
def rs_R005_ueqv_R005YNY_partial_14_0030 : Poly :=
[
  term ((-612027 : Rat) / 7498) [(4, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-612027 : Rat) / 7498) [(5, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((612027 : Rat) / 14996) [(6, 2), (11, 1), (13, 1), (16, 1)],
  term ((612027 : Rat) / 14996) [(7, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 14. -/
theorem rs_R005_ueqv_R005YNY_partial_14_0030_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_14_0030
        rs_R005_ueqv_R005YNY_generator_14_0000_0036 =
      rs_R005_ueqv_R005YNY_partial_14_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 14. -/
def rs_R005_ueqv_R005YNY_coefficient_14_0031 : Poly :=
[
  term ((878939 : Rat) / 52486) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 31 for generator 14. -/
def rs_R005_ueqv_R005YNY_partial_14_0031 : Poly :=
[
  term ((878939 : Rat) / 26243) [(4, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((878939 : Rat) / 26243) [(5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-878939 : Rat) / 52486) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-878939 : Rat) / 52486) [(7, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 14. -/
theorem rs_R005_ueqv_R005YNY_partial_14_0031_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_14_0031
        rs_R005_ueqv_R005YNY_generator_14_0000_0036 =
      rs_R005_ueqv_R005YNY_partial_14_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 14. -/
def rs_R005_ueqv_R005YNY_coefficient_14_0032 : Poly :=
[
  term ((4218801 : Rat) / 18256) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 32 for generator 14. -/
def rs_R005_ueqv_R005YNY_partial_14_0032 : Poly :=
[
  term ((4218801 : Rat) / 9128) [(4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((4218801 : Rat) / 9128) [(5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4218801 : Rat) / 18256) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-4218801 : Rat) / 18256) [(7, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 14. -/
theorem rs_R005_ueqv_R005YNY_partial_14_0032_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_14_0032
        rs_R005_ueqv_R005YNY_generator_14_0000_0036 =
      rs_R005_ueqv_R005YNY_partial_14_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 14. -/
def rs_R005_ueqv_R005YNY_coefficient_14_0033 : Poly :=
[
  term ((-31917407 : Rat) / 209944) [(13, 2), (16, 1)]
]

/-- Partial product 33 for generator 14. -/
def rs_R005_ueqv_R005YNY_partial_14_0033 : Poly :=
[
  term ((-31917407 : Rat) / 104972) [(4, 1), (6, 1), (13, 2), (16, 1)],
  term ((-31917407 : Rat) / 104972) [(5, 1), (7, 1), (13, 2), (16, 1)],
  term ((31917407 : Rat) / 209944) [(6, 2), (13, 2), (16, 1)],
  term ((31917407 : Rat) / 209944) [(7, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 14. -/
theorem rs_R005_ueqv_R005YNY_partial_14_0033_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_14_0033
        rs_R005_ueqv_R005YNY_generator_14_0000_0036 =
      rs_R005_ueqv_R005YNY_partial_14_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 14. -/
def rs_R005_ueqv_R005YNY_coefficient_14_0034 : Poly :=
[
  term ((2049441 : Rat) / 104972) [(13, 3), (15, 1), (16, 1)]
]

/-- Partial product 34 for generator 14. -/
def rs_R005_ueqv_R005YNY_partial_14_0034 : Poly :=
[
  term ((2049441 : Rat) / 52486) [(4, 1), (6, 1), (13, 3), (15, 1), (16, 1)],
  term ((2049441 : Rat) / 52486) [(5, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((-2049441 : Rat) / 104972) [(6, 2), (13, 3), (15, 1), (16, 1)],
  term ((-2049441 : Rat) / 104972) [(7, 2), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 14. -/
theorem rs_R005_ueqv_R005YNY_partial_14_0034_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_14_0034
        rs_R005_ueqv_R005YNY_generator_14_0000_0036 =
      rs_R005_ueqv_R005YNY_partial_14_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 14. -/
def rs_R005_ueqv_R005YNY_coefficient_14_0035 : Poly :=
[
  term ((-1744833 : Rat) / 26243) [(15, 2), (16, 1)]
]

/-- Partial product 35 for generator 14. -/
def rs_R005_ueqv_R005YNY_partial_14_0035 : Poly :=
[
  term ((-3489666 : Rat) / 26243) [(4, 1), (6, 1), (15, 2), (16, 1)],
  term ((-3489666 : Rat) / 26243) [(5, 1), (7, 1), (15, 2), (16, 1)],
  term ((1744833 : Rat) / 26243) [(6, 2), (15, 2), (16, 1)],
  term ((1744833 : Rat) / 26243) [(7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 14. -/
theorem rs_R005_ueqv_R005YNY_partial_14_0035_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_14_0035
        rs_R005_ueqv_R005YNY_generator_14_0000_0036 =
      rs_R005_ueqv_R005YNY_partial_14_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 14. -/
def rs_R005_ueqv_R005YNY_coefficient_14_0036 : Poly :=
[
  term ((-226046 : Rat) / 26243) [(16, 1)]
]

/-- Partial product 36 for generator 14. -/
def rs_R005_ueqv_R005YNY_partial_14_0036 : Poly :=
[
  term ((-452092 : Rat) / 26243) [(4, 1), (6, 1), (16, 1)],
  term ((-452092 : Rat) / 26243) [(5, 1), (7, 1), (16, 1)],
  term ((226046 : Rat) / 26243) [(6, 2), (16, 1)],
  term ((226046 : Rat) / 26243) [(7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 14. -/
theorem rs_R005_ueqv_R005YNY_partial_14_0036_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_14_0036
        rs_R005_ueqv_R005YNY_generator_14_0000_0036 =
      rs_R005_ueqv_R005YNY_partial_14_0036 := by
  native_decide

/-- Partial products in this block. -/
def rs_R005_ueqv_R005YNY_partials_14_0000_0036 : List Poly :=
[
  rs_R005_ueqv_R005YNY_partial_14_0000,
  rs_R005_ueqv_R005YNY_partial_14_0001,
  rs_R005_ueqv_R005YNY_partial_14_0002,
  rs_R005_ueqv_R005YNY_partial_14_0003,
  rs_R005_ueqv_R005YNY_partial_14_0004,
  rs_R005_ueqv_R005YNY_partial_14_0005,
  rs_R005_ueqv_R005YNY_partial_14_0006,
  rs_R005_ueqv_R005YNY_partial_14_0007,
  rs_R005_ueqv_R005YNY_partial_14_0008,
  rs_R005_ueqv_R005YNY_partial_14_0009,
  rs_R005_ueqv_R005YNY_partial_14_0010,
  rs_R005_ueqv_R005YNY_partial_14_0011,
  rs_R005_ueqv_R005YNY_partial_14_0012,
  rs_R005_ueqv_R005YNY_partial_14_0013,
  rs_R005_ueqv_R005YNY_partial_14_0014,
  rs_R005_ueqv_R005YNY_partial_14_0015,
  rs_R005_ueqv_R005YNY_partial_14_0016,
  rs_R005_ueqv_R005YNY_partial_14_0017,
  rs_R005_ueqv_R005YNY_partial_14_0018,
  rs_R005_ueqv_R005YNY_partial_14_0019,
  rs_R005_ueqv_R005YNY_partial_14_0020,
  rs_R005_ueqv_R005YNY_partial_14_0021,
  rs_R005_ueqv_R005YNY_partial_14_0022,
  rs_R005_ueqv_R005YNY_partial_14_0023,
  rs_R005_ueqv_R005YNY_partial_14_0024,
  rs_R005_ueqv_R005YNY_partial_14_0025,
  rs_R005_ueqv_R005YNY_partial_14_0026,
  rs_R005_ueqv_R005YNY_partial_14_0027,
  rs_R005_ueqv_R005YNY_partial_14_0028,
  rs_R005_ueqv_R005YNY_partial_14_0029,
  rs_R005_ueqv_R005YNY_partial_14_0030,
  rs_R005_ueqv_R005YNY_partial_14_0031,
  rs_R005_ueqv_R005YNY_partial_14_0032,
  rs_R005_ueqv_R005YNY_partial_14_0033,
  rs_R005_ueqv_R005YNY_partial_14_0034,
  rs_R005_ueqv_R005YNY_partial_14_0035,
  rs_R005_ueqv_R005YNY_partial_14_0036
]

/-- Sum of partial products in this block. -/
def rs_R005_ueqv_R005YNY_block_14_0000_0036 : Poly :=
[
  term ((206640 : Rat) / 3749) [(3, 1), (4, 1), (6, 1), (9, 1), (16, 1)],
  term ((-3188704 : Rat) / 26243) [(3, 1), (4, 1), (6, 1), (13, 1), (16, 1)],
  term ((3484448 : Rat) / 26243) [(3, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((206640 : Rat) / 3749) [(3, 1), (5, 1), (7, 1), (9, 1), (16, 1)],
  term ((-3188704 : Rat) / 26243) [(3, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((3484448 : Rat) / 26243) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-103320 : Rat) / 3749) [(3, 1), (6, 2), (9, 1), (16, 1)],
  term ((1594352 : Rat) / 26243) [(3, 1), (6, 2), (13, 1), (16, 1)],
  term ((-1742224 : Rat) / 26243) [(3, 1), (6, 2), (15, 1), (16, 1)],
  term ((-103320 : Rat) / 3749) [(3, 1), (7, 2), (9, 1), (16, 1)],
  term ((1594352 : Rat) / 26243) [(3, 1), (7, 2), (13, 1), (16, 1)],
  term ((-1742224 : Rat) / 26243) [(3, 1), (7, 2), (15, 1), (16, 1)],
  term ((-282240 : Rat) / 41239) [(4, 1), (5, 1), (6, 1), (8, 1), (13, 1), (16, 1)],
  term ((-168420 : Rat) / 1793) [(4, 1), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((4029732 : Rat) / 41239) [(4, 1), (5, 1), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((5747406 : Rat) / 41239) [(4, 1), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((234801 : Rat) / 41239) [(4, 1), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((2014866 : Rat) / 41239) [(4, 1), (5, 1), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((-2939601 : Rat) / 82478) [(4, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((332640 : Rat) / 3749) [(4, 1), (5, 1), (7, 1), (8, 1), (13, 2), (16, 1)],
  term ((639240 : Rat) / 3749) [(4, 1), (5, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((-78120 : Rat) / 3749) [(4, 1), (5, 1), (7, 1), (10, 1), (13, 2), (16, 1)],
  term ((237888 : Rat) / 3749) [(4, 1), (5, 1), (7, 1), (10, 1), (16, 1)],
  term ((-22260 : Rat) / 163) [(4, 1), (5, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((311661 : Rat) / 3749) [(4, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-746970 : Rat) / 3749) [(4, 1), (5, 1), (7, 1), (13, 2), (16, 1)],
  term ((-39060 : Rat) / 3749) [(4, 1), (5, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((-178416 : Rat) / 3749) [(4, 1), (5, 1), (7, 1), (16, 1)],
  term ((149184 : Rat) / 3749) [(4, 1), (6, 1), (7, 1), (9, 1), (16, 1)],
  term ((-173176 : Rat) / 26243) [(4, 1), (6, 1), (7, 1), (13, 1), (16, 1)],
  term ((-1325920 : Rat) / 26243) [(4, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((448440 : Rat) / 3749) [(4, 1), (6, 1), (8, 1), (13, 2), (16, 1)],
  term ((-103416 : Rat) / 3749) [(4, 1), (6, 1), (8, 1), (16, 1)],
  term ((-334026 : Rat) / 3749) [(4, 1), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((1116587 : Rat) / 26243) [(4, 1), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-6895863 : Rat) / 26243) [(4, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((365274 : Rat) / 3749) [(4, 1), (6, 1), (9, 2), (16, 1)],
  term ((2049441 : Rat) / 26243) [(4, 1), (6, 1), (10, 1), (13, 2), (16, 1)],
  term ((904398 : Rat) / 26243) [(4, 1), (6, 1), (10, 1), (16, 1)],
  term ((-612027 : Rat) / 7498) [(4, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((878939 : Rat) / 26243) [(4, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((4218801 : Rat) / 9128) [(4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-31917407 : Rat) / 104972) [(4, 1), (6, 1), (13, 2), (16, 1)],
  term ((2049441 : Rat) / 52486) [(4, 1), (6, 1), (13, 3), (15, 1), (16, 1)],
  term ((-3489666 : Rat) / 26243) [(4, 1), (6, 1), (15, 2), (16, 1)],
  term ((-452092 : Rat) / 26243) [(4, 1), (6, 1), (16, 1)],
  term ((-166320 : Rat) / 3749) [(4, 1), (6, 2), (8, 1), (13, 2), (16, 1)],
  term ((-319620 : Rat) / 3749) [(4, 1), (6, 2), (9, 1), (13, 1), (16, 1)],
  term ((39060 : Rat) / 3749) [(4, 1), (6, 2), (10, 1), (13, 2), (16, 1)],
  term ((-118944 : Rat) / 3749) [(4, 1), (6, 2), (10, 1), (16, 1)],
  term ((11130 : Rat) / 163) [(4, 1), (6, 2), (11, 1), (13, 1), (16, 1)],
  term ((-311661 : Rat) / 7498) [(4, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((373485 : Rat) / 3749) [(4, 1), (6, 2), (13, 2), (16, 1)],
  term ((19530 : Rat) / 3749) [(4, 1), (6, 2), (13, 3), (15, 1), (16, 1)],
  term ((89208 : Rat) / 3749) [(4, 1), (6, 2), (16, 1)],
  term ((-166320 : Rat) / 3749) [(4, 1), (7, 2), (8, 1), (13, 2), (16, 1)],
  term ((-319620 : Rat) / 3749) [(4, 1), (7, 2), (9, 1), (13, 1), (16, 1)],
  term ((39060 : Rat) / 3749) [(4, 1), (7, 2), (10, 1), (13, 2), (16, 1)],
  term ((-118944 : Rat) / 3749) [(4, 1), (7, 2), (10, 1), (16, 1)],
  term ((11130 : Rat) / 163) [(4, 1), (7, 2), (11, 1), (13, 1), (16, 1)],
  term ((-311661 : Rat) / 7498) [(4, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((373485 : Rat) / 3749) [(4, 1), (7, 2), (13, 2), (16, 1)],
  term ((19530 : Rat) / 3749) [(4, 1), (7, 2), (13, 3), (15, 1), (16, 1)],
  term ((89208 : Rat) / 3749) [(4, 1), (7, 2), (16, 1)],
  term ((332640 : Rat) / 3749) [(4, 2), (6, 1), (8, 1), (13, 2), (16, 1)],
  term ((639240 : Rat) / 3749) [(4, 2), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-78120 : Rat) / 3749) [(4, 2), (6, 1), (10, 1), (13, 2), (16, 1)],
  term ((237888 : Rat) / 3749) [(4, 2), (6, 1), (10, 1), (16, 1)],
  term ((-22260 : Rat) / 163) [(4, 2), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((311661 : Rat) / 3749) [(4, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-746970 : Rat) / 3749) [(4, 2), (6, 1), (13, 2), (16, 1)],
  term ((-39060 : Rat) / 3749) [(4, 2), (6, 1), (13, 3), (15, 1), (16, 1)],
  term ((-178416 : Rat) / 3749) [(4, 2), (6, 1), (16, 1)],
  term ((141120 : Rat) / 41239) [(5, 1), (6, 2), (8, 1), (13, 1), (16, 1)],
  term ((84210 : Rat) / 1793) [(5, 1), (6, 2), (9, 1), (16, 1)],
  term ((-2014866 : Rat) / 41239) [(5, 1), (6, 2), (10, 1), (13, 1), (16, 1)],
  term ((-2873703 : Rat) / 41239) [(5, 1), (6, 2), (11, 1), (16, 1)],
  term ((-234801 : Rat) / 82478) [(5, 1), (6, 2), (13, 1), (16, 1)],
  term ((-1007433 : Rat) / 41239) [(5, 1), (6, 2), (13, 2), (15, 1), (16, 1)],
  term ((2939601 : Rat) / 164956) [(5, 1), (6, 2), (15, 1), (16, 1)],
  term ((448440 : Rat) / 3749) [(5, 1), (7, 1), (8, 1), (13, 2), (16, 1)],
  term ((-103416 : Rat) / 3749) [(5, 1), (7, 1), (8, 1), (16, 1)],
  term ((-334026 : Rat) / 3749) [(5, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((1116587 : Rat) / 26243) [(5, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((-6895863 : Rat) / 26243) [(5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((365274 : Rat) / 3749) [(5, 1), (7, 1), (9, 2), (16, 1)],
  term ((2049441 : Rat) / 26243) [(5, 1), (7, 1), (10, 1), (13, 2), (16, 1)],
  term ((904398 : Rat) / 26243) [(5, 1), (7, 1), (10, 1), (16, 1)],
  term ((-612027 : Rat) / 7498) [(5, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((878939 : Rat) / 26243) [(5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((4218801 : Rat) / 9128) [(5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-31917407 : Rat) / 104972) [(5, 1), (7, 1), (13, 2), (16, 1)],
  term ((2049441 : Rat) / 52486) [(5, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((-3489666 : Rat) / 26243) [(5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-452092 : Rat) / 26243) [(5, 1), (7, 1), (16, 1)],
  term ((141120 : Rat) / 41239) [(5, 1), (7, 2), (8, 1), (13, 1), (16, 1)],
  term ((3577854 : Rat) / 41239) [(5, 1), (7, 2), (9, 1), (16, 1)],
  term ((-2014866 : Rat) / 41239) [(5, 1), (7, 2), (10, 1), (13, 1), (16, 1)],
  term ((-2873703 : Rat) / 41239) [(5, 1), (7, 2), (11, 1), (16, 1)],
  term ((-5453479 : Rat) / 577346) [(5, 1), (7, 2), (13, 1), (16, 1)],
  term ((-1007433 : Rat) / 41239) [(5, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((-37763273 : Rat) / 1154692) [(5, 1), (7, 2), (15, 1), (16, 1)],
  term ((-282240 : Rat) / 41239) [(5, 2), (7, 1), (8, 1), (13, 1), (16, 1)],
  term ((-168420 : Rat) / 1793) [(5, 2), (7, 1), (9, 1), (16, 1)],
  term ((4029732 : Rat) / 41239) [(5, 2), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((5747406 : Rat) / 41239) [(5, 2), (7, 1), (11, 1), (16, 1)],
  term ((234801 : Rat) / 41239) [(5, 2), (7, 1), (13, 1), (16, 1)],
  term ((2014866 : Rat) / 41239) [(5, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-2939601 : Rat) / 82478) [(5, 2), (7, 1), (15, 1), (16, 1)],
  term ((-74592 : Rat) / 3749) [(6, 2), (7, 1), (9, 1), (16, 1)],
  term ((86588 : Rat) / 26243) [(6, 2), (7, 1), (13, 1), (16, 1)],
  term ((662960 : Rat) / 26243) [(6, 2), (7, 1), (15, 1), (16, 1)],
  term ((-224220 : Rat) / 3749) [(6, 2), (8, 1), (13, 2), (16, 1)],
  term ((51708 : Rat) / 3749) [(6, 2), (8, 1), (16, 1)],
  term ((167013 : Rat) / 3749) [(6, 2), (9, 1), (11, 1), (16, 1)],
  term ((-1116587 : Rat) / 52486) [(6, 2), (9, 1), (13, 1), (16, 1)],
  term ((6895863 : Rat) / 52486) [(6, 2), (9, 1), (15, 1), (16, 1)],
  term ((-182637 : Rat) / 3749) [(6, 2), (9, 2), (16, 1)],
  term ((-2049441 : Rat) / 52486) [(6, 2), (10, 1), (13, 2), (16, 1)],
  term ((-452199 : Rat) / 26243) [(6, 2), (10, 1), (16, 1)],
  term ((612027 : Rat) / 14996) [(6, 2), (11, 1), (13, 1), (16, 1)],
  term ((-878939 : Rat) / 52486) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-4218801 : Rat) / 18256) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((31917407 : Rat) / 209944) [(6, 2), (13, 2), (16, 1)],
  term ((-2049441 : Rat) / 104972) [(6, 2), (13, 3), (15, 1), (16, 1)],
  term ((1744833 : Rat) / 26243) [(6, 2), (15, 2), (16, 1)],
  term ((226046 : Rat) / 26243) [(6, 2), (16, 1)],
  term ((-224220 : Rat) / 3749) [(7, 2), (8, 1), (13, 2), (16, 1)],
  term ((51708 : Rat) / 3749) [(7, 2), (8, 1), (16, 1)],
  term ((167013 : Rat) / 3749) [(7, 2), (9, 1), (11, 1), (16, 1)],
  term ((-1116587 : Rat) / 52486) [(7, 2), (9, 1), (13, 1), (16, 1)],
  term ((6895863 : Rat) / 52486) [(7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-182637 : Rat) / 3749) [(7, 2), (9, 2), (16, 1)],
  term ((-2049441 : Rat) / 52486) [(7, 2), (10, 1), (13, 2), (16, 1)],
  term ((-452199 : Rat) / 26243) [(7, 2), (10, 1), (16, 1)],
  term ((612027 : Rat) / 14996) [(7, 2), (11, 1), (13, 1), (16, 1)],
  term ((-878939 : Rat) / 52486) [(7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-4218801 : Rat) / 18256) [(7, 2), (13, 1), (15, 1), (16, 1)],
  term ((31917407 : Rat) / 209944) [(7, 2), (13, 2), (16, 1)],
  term ((-2049441 : Rat) / 104972) [(7, 2), (13, 3), (15, 1), (16, 1)],
  term ((1744833 : Rat) / 26243) [(7, 2), (15, 2), (16, 1)],
  term ((226046 : Rat) / 26243) [(7, 2), (16, 1)],
  term ((-74592 : Rat) / 3749) [(7, 3), (9, 1), (16, 1)],
  term ((86588 : Rat) / 26243) [(7, 3), (13, 1), (16, 1)],
  term ((662960 : Rat) / 26243) [(7, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 14, terms 0 through 36. -/
theorem rs_R005_ueqv_R005YNY_block_14_0000_0036_valid :
    checkProductSumEq rs_R005_ueqv_R005YNY_partials_14_0000_0036
      rs_R005_ueqv_R005YNY_block_14_0000_0036 = true := by
  native_decide

end R005UeqvR005YNYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
