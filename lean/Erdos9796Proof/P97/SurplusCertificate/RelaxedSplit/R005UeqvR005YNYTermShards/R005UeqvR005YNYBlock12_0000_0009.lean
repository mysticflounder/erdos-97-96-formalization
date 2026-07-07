/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R005:u=v:R005YNY, term block 12:0-9

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R005UeqvR005YNYTermShards

/-- Generator polynomial 12 for relaxed split surplus certificate `R005:u=v:R005YNY`. -/
def rs_R005_ueqv_R005YNY_generator_12_0000_0009 : Poly :=
[
  term (-2 : Rat) [(0, 1), (2, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (3, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(2, 1), (12, 1)],
  term (2 : Rat) [(3, 1), (13, 1)],
  term (-1 : Rat) [(12, 2)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 12. -/
def rs_R005_ueqv_R005YNY_coefficient_12_0000 : Poly :=
[
  term ((51660 : Rat) / 3749) [(4, 1), (16, 1)]
]

/-- Partial product 0 for generator 12. -/
def rs_R005_ueqv_R005YNY_partial_12_0000 : Poly :=
[
  term ((-103320 : Rat) / 3749) [(0, 1), (2, 1), (4, 1), (16, 1)],
  term ((51660 : Rat) / 3749) [(0, 2), (4, 1), (16, 1)],
  term ((-103320 : Rat) / 3749) [(1, 1), (3, 1), (4, 1), (16, 1)],
  term ((51660 : Rat) / 3749) [(1, 2), (4, 1), (16, 1)],
  term ((103320 : Rat) / 3749) [(2, 1), (4, 1), (12, 1), (16, 1)],
  term ((103320 : Rat) / 3749) [(3, 1), (4, 1), (13, 1), (16, 1)],
  term ((-51660 : Rat) / 3749) [(4, 1), (12, 2), (16, 1)],
  term ((-51660 : Rat) / 3749) [(4, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 12. -/
theorem rs_R005_ueqv_R005YNY_partial_12_0000_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_12_0000
        rs_R005_ueqv_R005YNY_generator_12_0000_0009 =
      rs_R005_ueqv_R005YNY_partial_12_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 12. -/
def rs_R005_ueqv_R005YNY_coefficient_12_0001 : Poly :=
[
  term ((-871112 : Rat) / 26243) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 1 for generator 12. -/
def rs_R005_ueqv_R005YNY_partial_12_0001 : Poly :=
[
  term ((1742224 : Rat) / 26243) [(0, 1), (2, 1), (7, 1), (13, 1), (16, 1)],
  term ((-871112 : Rat) / 26243) [(0, 2), (7, 1), (13, 1), (16, 1)],
  term ((1742224 : Rat) / 26243) [(1, 1), (3, 1), (7, 1), (13, 1), (16, 1)],
  term ((-871112 : Rat) / 26243) [(1, 2), (7, 1), (13, 1), (16, 1)],
  term ((-1742224 : Rat) / 26243) [(2, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1742224 : Rat) / 26243) [(3, 1), (7, 1), (13, 2), (16, 1)],
  term ((871112 : Rat) / 26243) [(7, 1), (12, 2), (13, 1), (16, 1)],
  term ((871112 : Rat) / 26243) [(7, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 12. -/
theorem rs_R005_ueqv_R005YNY_partial_12_0001_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_12_0001
        rs_R005_ueqv_R005YNY_generator_12_0000_0009 =
      rs_R005_ueqv_R005YNY_partial_12_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 12. -/
def rs_R005_ueqv_R005YNY_coefficient_12_0002 : Poly :=
[
  term ((1742224 : Rat) / 26243) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 2 for generator 12. -/
def rs_R005_ueqv_R005YNY_partial_12_0002 : Poly :=
[
  term ((-3484448 : Rat) / 26243) [(0, 1), (2, 1), (7, 1), (15, 1), (16, 1)],
  term ((1742224 : Rat) / 26243) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((-3484448 : Rat) / 26243) [(1, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((1742224 : Rat) / 26243) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((3484448 : Rat) / 26243) [(2, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((3484448 : Rat) / 26243) [(3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1742224 : Rat) / 26243) [(7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1742224 : Rat) / 26243) [(7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 12. -/
theorem rs_R005_ueqv_R005YNY_partial_12_0002_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_12_0002
        rs_R005_ueqv_R005YNY_generator_12_0000_0009 =
      rs_R005_ueqv_R005YNY_partial_12_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 12. -/
def rs_R005_ueqv_R005YNY_coefficient_12_0003 : Poly :=
[
  term ((51660 : Rat) / 3749) [(8, 1), (16, 1)]
]

/-- Partial product 3 for generator 12. -/
def rs_R005_ueqv_R005YNY_partial_12_0003 : Poly :=
[
  term ((-103320 : Rat) / 3749) [(0, 1), (2, 1), (8, 1), (16, 1)],
  term ((51660 : Rat) / 3749) [(0, 2), (8, 1), (16, 1)],
  term ((-103320 : Rat) / 3749) [(1, 1), (3, 1), (8, 1), (16, 1)],
  term ((51660 : Rat) / 3749) [(1, 2), (8, 1), (16, 1)],
  term ((103320 : Rat) / 3749) [(2, 1), (8, 1), (12, 1), (16, 1)],
  term ((103320 : Rat) / 3749) [(3, 1), (8, 1), (13, 1), (16, 1)],
  term ((-51660 : Rat) / 3749) [(8, 1), (12, 2), (16, 1)],
  term ((-51660 : Rat) / 3749) [(8, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 12. -/
theorem rs_R005_ueqv_R005YNY_partial_12_0003_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_12_0003
        rs_R005_ueqv_R005YNY_generator_12_0000_0009 =
      rs_R005_ueqv_R005YNY_partial_12_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 12. -/
def rs_R005_ueqv_R005YNY_coefficient_12_0004 : Poly :=
[
  term ((-2613336 : Rat) / 26243) [(10, 1), (16, 1)]
]

/-- Partial product 4 for generator 12. -/
def rs_R005_ueqv_R005YNY_partial_12_0004 : Poly :=
[
  term ((5226672 : Rat) / 26243) [(0, 1), (2, 1), (10, 1), (16, 1)],
  term ((-2613336 : Rat) / 26243) [(0, 2), (10, 1), (16, 1)],
  term ((5226672 : Rat) / 26243) [(1, 1), (3, 1), (10, 1), (16, 1)],
  term ((-2613336 : Rat) / 26243) [(1, 2), (10, 1), (16, 1)],
  term ((-5226672 : Rat) / 26243) [(2, 1), (10, 1), (12, 1), (16, 1)],
  term ((-5226672 : Rat) / 26243) [(3, 1), (10, 1), (13, 1), (16, 1)],
  term ((2613336 : Rat) / 26243) [(10, 1), (12, 2), (16, 1)],
  term ((2613336 : Rat) / 26243) [(10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 12. -/
theorem rs_R005_ueqv_R005YNY_partial_12_0004_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_12_0004
        rs_R005_ueqv_R005YNY_generator_12_0000_0009 =
      rs_R005_ueqv_R005YNY_partial_12_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 12. -/
def rs_R005_ueqv_R005YNY_coefficient_12_0005 : Poly :=
[
  term ((-3484448 : Rat) / 26243) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 5 for generator 12. -/
def rs_R005_ueqv_R005YNY_partial_12_0005 : Poly :=
[
  term ((6968896 : Rat) / 26243) [(0, 1), (2, 1), (11, 1), (13, 1), (16, 1)],
  term ((-3484448 : Rat) / 26243) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term ((6968896 : Rat) / 26243) [(1, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((-3484448 : Rat) / 26243) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term ((-6968896 : Rat) / 26243) [(2, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-6968896 : Rat) / 26243) [(3, 1), (11, 1), (13, 2), (16, 1)],
  term ((3484448 : Rat) / 26243) [(11, 1), (12, 2), (13, 1), (16, 1)],
  term ((3484448 : Rat) / 26243) [(11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 12. -/
theorem rs_R005_ueqv_R005YNY_partial_12_0005_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_12_0005
        rs_R005_ueqv_R005YNY_generator_12_0000_0009 =
      rs_R005_ueqv_R005YNY_partial_12_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 12. -/
def rs_R005_ueqv_R005YNY_coefficient_12_0006 : Poly :=
[
  term ((6968896 : Rat) / 26243) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 6 for generator 12. -/
def rs_R005_ueqv_R005YNY_partial_12_0006 : Poly :=
[
  term ((-13937792 : Rat) / 26243) [(0, 1), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((6968896 : Rat) / 26243) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((-13937792 : Rat) / 26243) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((6968896 : Rat) / 26243) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((13937792 : Rat) / 26243) [(2, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((13937792 : Rat) / 26243) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6968896 : Rat) / 26243) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-6968896 : Rat) / 26243) [(11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 12. -/
theorem rs_R005_ueqv_R005YNY_partial_12_0006_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_12_0006
        rs_R005_ueqv_R005YNY_generator_12_0000_0009 =
      rs_R005_ueqv_R005YNY_partial_12_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 12. -/
def rs_R005_ueqv_R005YNY_coefficient_12_0007 : Poly :=
[
  term ((871112 : Rat) / 26243) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 7 for generator 12. -/
def rs_R005_ueqv_R005YNY_partial_12_0007 : Poly :=
[
  term ((-1742224 : Rat) / 26243) [(0, 1), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((871112 : Rat) / 26243) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1742224 : Rat) / 26243) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((871112 : Rat) / 26243) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((1742224 : Rat) / 26243) [(2, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1742224 : Rat) / 26243) [(3, 1), (13, 2), (15, 1), (16, 1)],
  term ((-871112 : Rat) / 26243) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-871112 : Rat) / 26243) [(13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 12. -/
theorem rs_R005_ueqv_R005YNY_partial_12_0007_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_12_0007
        rs_R005_ueqv_R005YNY_generator_12_0000_0009 =
      rs_R005_ueqv_R005YNY_partial_12_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 12. -/
def rs_R005_ueqv_R005YNY_coefficient_12_0008 : Poly :=
[
  term ((-1742224 : Rat) / 26243) [(15, 2), (16, 1)]
]

/-- Partial product 8 for generator 12. -/
def rs_R005_ueqv_R005YNY_partial_12_0008 : Poly :=
[
  term ((3484448 : Rat) / 26243) [(0, 1), (2, 1), (15, 2), (16, 1)],
  term ((-1742224 : Rat) / 26243) [(0, 2), (15, 2), (16, 1)],
  term ((3484448 : Rat) / 26243) [(1, 1), (3, 1), (15, 2), (16, 1)],
  term ((-1742224 : Rat) / 26243) [(1, 2), (15, 2), (16, 1)],
  term ((-3484448 : Rat) / 26243) [(2, 1), (12, 1), (15, 2), (16, 1)],
  term ((-3484448 : Rat) / 26243) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((1742224 : Rat) / 26243) [(12, 2), (15, 2), (16, 1)],
  term ((1742224 : Rat) / 26243) [(13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 12. -/
theorem rs_R005_ueqv_R005YNY_partial_12_0008_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_12_0008
        rs_R005_ueqv_R005YNY_generator_12_0000_0009 =
      rs_R005_ueqv_R005YNY_partial_12_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 12. -/
def rs_R005_ueqv_R005YNY_coefficient_12_0009 : Poly :=
[
  term ((1816160 : Rat) / 26243) [(16, 1)]
]

/-- Partial product 9 for generator 12. -/
def rs_R005_ueqv_R005YNY_partial_12_0009 : Poly :=
[
  term ((-3632320 : Rat) / 26243) [(0, 1), (2, 1), (16, 1)],
  term ((1816160 : Rat) / 26243) [(0, 2), (16, 1)],
  term ((-3632320 : Rat) / 26243) [(1, 1), (3, 1), (16, 1)],
  term ((1816160 : Rat) / 26243) [(1, 2), (16, 1)],
  term ((3632320 : Rat) / 26243) [(2, 1), (12, 1), (16, 1)],
  term ((3632320 : Rat) / 26243) [(3, 1), (13, 1), (16, 1)],
  term ((-1816160 : Rat) / 26243) [(12, 2), (16, 1)],
  term ((-1816160 : Rat) / 26243) [(13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 12. -/
theorem rs_R005_ueqv_R005YNY_partial_12_0009_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_12_0009
        rs_R005_ueqv_R005YNY_generator_12_0000_0009 =
      rs_R005_ueqv_R005YNY_partial_12_0009 := by
  native_decide

/-- Partial products in this block. -/
def rs_R005_ueqv_R005YNY_partials_12_0000_0009 : List Poly :=
[
  rs_R005_ueqv_R005YNY_partial_12_0000,
  rs_R005_ueqv_R005YNY_partial_12_0001,
  rs_R005_ueqv_R005YNY_partial_12_0002,
  rs_R005_ueqv_R005YNY_partial_12_0003,
  rs_R005_ueqv_R005YNY_partial_12_0004,
  rs_R005_ueqv_R005YNY_partial_12_0005,
  rs_R005_ueqv_R005YNY_partial_12_0006,
  rs_R005_ueqv_R005YNY_partial_12_0007,
  rs_R005_ueqv_R005YNY_partial_12_0008,
  rs_R005_ueqv_R005YNY_partial_12_0009
]

/-- Sum of partial products in this block. -/
def rs_R005_ueqv_R005YNY_block_12_0000_0009 : Poly :=
[
  term ((-103320 : Rat) / 3749) [(0, 1), (2, 1), (4, 1), (16, 1)],
  term ((1742224 : Rat) / 26243) [(0, 1), (2, 1), (7, 1), (13, 1), (16, 1)],
  term ((-3484448 : Rat) / 26243) [(0, 1), (2, 1), (7, 1), (15, 1), (16, 1)],
  term ((-103320 : Rat) / 3749) [(0, 1), (2, 1), (8, 1), (16, 1)],
  term ((5226672 : Rat) / 26243) [(0, 1), (2, 1), (10, 1), (16, 1)],
  term ((6968896 : Rat) / 26243) [(0, 1), (2, 1), (11, 1), (13, 1), (16, 1)],
  term ((-13937792 : Rat) / 26243) [(0, 1), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1742224 : Rat) / 26243) [(0, 1), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((3484448 : Rat) / 26243) [(0, 1), (2, 1), (15, 2), (16, 1)],
  term ((-3632320 : Rat) / 26243) [(0, 1), (2, 1), (16, 1)],
  term ((51660 : Rat) / 3749) [(0, 2), (4, 1), (16, 1)],
  term ((-871112 : Rat) / 26243) [(0, 2), (7, 1), (13, 1), (16, 1)],
  term ((1742224 : Rat) / 26243) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((51660 : Rat) / 3749) [(0, 2), (8, 1), (16, 1)],
  term ((-2613336 : Rat) / 26243) [(0, 2), (10, 1), (16, 1)],
  term ((-3484448 : Rat) / 26243) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term ((6968896 : Rat) / 26243) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((871112 : Rat) / 26243) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1742224 : Rat) / 26243) [(0, 2), (15, 2), (16, 1)],
  term ((1816160 : Rat) / 26243) [(0, 2), (16, 1)],
  term ((-103320 : Rat) / 3749) [(1, 1), (3, 1), (4, 1), (16, 1)],
  term ((1742224 : Rat) / 26243) [(1, 1), (3, 1), (7, 1), (13, 1), (16, 1)],
  term ((-3484448 : Rat) / 26243) [(1, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((-103320 : Rat) / 3749) [(1, 1), (3, 1), (8, 1), (16, 1)],
  term ((5226672 : Rat) / 26243) [(1, 1), (3, 1), (10, 1), (16, 1)],
  term ((6968896 : Rat) / 26243) [(1, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((-13937792 : Rat) / 26243) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1742224 : Rat) / 26243) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((3484448 : Rat) / 26243) [(1, 1), (3, 1), (15, 2), (16, 1)],
  term ((-3632320 : Rat) / 26243) [(1, 1), (3, 1), (16, 1)],
  term ((51660 : Rat) / 3749) [(1, 2), (4, 1), (16, 1)],
  term ((-871112 : Rat) / 26243) [(1, 2), (7, 1), (13, 1), (16, 1)],
  term ((1742224 : Rat) / 26243) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((51660 : Rat) / 3749) [(1, 2), (8, 1), (16, 1)],
  term ((-2613336 : Rat) / 26243) [(1, 2), (10, 1), (16, 1)],
  term ((-3484448 : Rat) / 26243) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term ((6968896 : Rat) / 26243) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((871112 : Rat) / 26243) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1742224 : Rat) / 26243) [(1, 2), (15, 2), (16, 1)],
  term ((1816160 : Rat) / 26243) [(1, 2), (16, 1)],
  term ((103320 : Rat) / 3749) [(2, 1), (4, 1), (12, 1), (16, 1)],
  term ((-1742224 : Rat) / 26243) [(2, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((3484448 : Rat) / 26243) [(2, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((103320 : Rat) / 3749) [(2, 1), (8, 1), (12, 1), (16, 1)],
  term ((-5226672 : Rat) / 26243) [(2, 1), (10, 1), (12, 1), (16, 1)],
  term ((-6968896 : Rat) / 26243) [(2, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((13937792 : Rat) / 26243) [(2, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1742224 : Rat) / 26243) [(2, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3484448 : Rat) / 26243) [(2, 1), (12, 1), (15, 2), (16, 1)],
  term ((3632320 : Rat) / 26243) [(2, 1), (12, 1), (16, 1)],
  term ((103320 : Rat) / 3749) [(3, 1), (4, 1), (13, 1), (16, 1)],
  term ((3484448 : Rat) / 26243) [(3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1742224 : Rat) / 26243) [(3, 1), (7, 1), (13, 2), (16, 1)],
  term ((103320 : Rat) / 3749) [(3, 1), (8, 1), (13, 1), (16, 1)],
  term ((-5226672 : Rat) / 26243) [(3, 1), (10, 1), (13, 1), (16, 1)],
  term ((13937792 : Rat) / 26243) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6968896 : Rat) / 26243) [(3, 1), (11, 1), (13, 2), (16, 1)],
  term ((-3484448 : Rat) / 26243) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((3632320 : Rat) / 26243) [(3, 1), (13, 1), (16, 1)],
  term ((1742224 : Rat) / 26243) [(3, 1), (13, 2), (15, 1), (16, 1)],
  term ((-51660 : Rat) / 3749) [(4, 1), (12, 2), (16, 1)],
  term ((-51660 : Rat) / 3749) [(4, 1), (13, 2), (16, 1)],
  term ((871112 : Rat) / 26243) [(7, 1), (12, 2), (13, 1), (16, 1)],
  term ((-1742224 : Rat) / 26243) [(7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1742224 : Rat) / 26243) [(7, 1), (13, 2), (15, 1), (16, 1)],
  term ((871112 : Rat) / 26243) [(7, 1), (13, 3), (16, 1)],
  term ((-51660 : Rat) / 3749) [(8, 1), (12, 2), (16, 1)],
  term ((-51660 : Rat) / 3749) [(8, 1), (13, 2), (16, 1)],
  term ((2613336 : Rat) / 26243) [(10, 1), (12, 2), (16, 1)],
  term ((2613336 : Rat) / 26243) [(10, 1), (13, 2), (16, 1)],
  term ((3484448 : Rat) / 26243) [(11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-6968896 : Rat) / 26243) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-6968896 : Rat) / 26243) [(11, 1), (13, 2), (15, 1), (16, 1)],
  term ((3484448 : Rat) / 26243) [(11, 1), (13, 3), (16, 1)],
  term ((-871112 : Rat) / 26243) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((1742224 : Rat) / 26243) [(12, 2), (15, 2), (16, 1)],
  term ((-1816160 : Rat) / 26243) [(12, 2), (16, 1)],
  term ((1742224 : Rat) / 26243) [(13, 2), (15, 2), (16, 1)],
  term ((-1816160 : Rat) / 26243) [(13, 2), (16, 1)],
  term ((-871112 : Rat) / 26243) [(13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 12, terms 0 through 9. -/
theorem rs_R005_ueqv_R005YNY_block_12_0000_0009_valid :
    checkProductSumEq rs_R005_ueqv_R005YNY_partials_12_0000_0009
      rs_R005_ueqv_R005YNY_block_12_0000_0009 = true := by
  native_decide

end R005UeqvR005YNYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
