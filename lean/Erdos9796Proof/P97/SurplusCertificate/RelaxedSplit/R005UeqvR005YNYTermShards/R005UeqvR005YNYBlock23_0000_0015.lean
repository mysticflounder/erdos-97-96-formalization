/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R005:u=v:R005YNY, term block 23:0-15

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R005UeqvR005YNYTermShards

/-- Generator polynomial 23 for relaxed split surplus certificate `R005:u=v:R005YNY`. -/
def rs_R005_ueqv_R005YNY_generator_23_0000_0015 : Poly :=
[
  term (-2 : Rat) [(0, 1), (10, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (11, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(8, 1), (10, 1)],
  term (-1 : Rat) [(8, 2)],
  term (2 : Rat) [(9, 1), (11, 1)],
  term (-1 : Rat) [(9, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 23. -/
def rs_R005_ueqv_R005YNY_coefficient_23_0000 : Poly :=
[
  term ((-74340 : Rat) / 3749) [(4, 1), (8, 1), (16, 1)]
]

/-- Partial product 0 for generator 23. -/
def rs_R005_ueqv_R005YNY_partial_23_0000 : Poly :=
[
  term ((148680 : Rat) / 3749) [(0, 1), (4, 1), (8, 1), (10, 1), (16, 1)],
  term ((-74340 : Rat) / 3749) [(0, 2), (4, 1), (8, 1), (16, 1)],
  term ((148680 : Rat) / 3749) [(1, 1), (4, 1), (8, 1), (11, 1), (16, 1)],
  term ((-74340 : Rat) / 3749) [(1, 2), (4, 1), (8, 1), (16, 1)],
  term ((-148680 : Rat) / 3749) [(4, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((74340 : Rat) / 3749) [(4, 1), (8, 1), (9, 2), (16, 1)],
  term ((-148680 : Rat) / 3749) [(4, 1), (8, 2), (10, 1), (16, 1)],
  term ((74340 : Rat) / 3749) [(4, 1), (8, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 23. -/
theorem rs_R005_ueqv_R005YNY_partial_23_0000_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_23_0000
        rs_R005_ueqv_R005YNY_generator_23_0000_0015 =
      rs_R005_ueqv_R005YNY_partial_23_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 23. -/
def rs_R005_ueqv_R005YNY_coefficient_23_0001 : Poly :=
[
  term ((199584 : Rat) / 3749) [(4, 1), (10, 1), (13, 2), (16, 1)]
]

/-- Partial product 1 for generator 23. -/
def rs_R005_ueqv_R005YNY_partial_23_0001 : Poly :=
[
  term ((-399168 : Rat) / 3749) [(0, 1), (4, 1), (10, 2), (13, 2), (16, 1)],
  term ((199584 : Rat) / 3749) [(0, 2), (4, 1), (10, 1), (13, 2), (16, 1)],
  term ((-399168 : Rat) / 3749) [(1, 1), (4, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((199584 : Rat) / 3749) [(1, 2), (4, 1), (10, 1), (13, 2), (16, 1)],
  term ((399168 : Rat) / 3749) [(4, 1), (8, 1), (10, 2), (13, 2), (16, 1)],
  term ((-199584 : Rat) / 3749) [(4, 1), (8, 2), (10, 1), (13, 2), (16, 1)],
  term ((399168 : Rat) / 3749) [(4, 1), (9, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((-199584 : Rat) / 3749) [(4, 1), (9, 2), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 23. -/
theorem rs_R005_ueqv_R005YNY_partial_23_0001_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_23_0001
        rs_R005_ueqv_R005YNY_generator_23_0000_0015 =
      rs_R005_ueqv_R005YNY_partial_23_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 23. -/
def rs_R005_ueqv_R005YNY_coefficient_23_0002 : Poly :=
[
  term ((-44604 : Rat) / 3749) [(4, 1), (10, 1), (16, 1)]
]

/-- Partial product 2 for generator 23. -/
def rs_R005_ueqv_R005YNY_partial_23_0002 : Poly :=
[
  term ((89208 : Rat) / 3749) [(0, 1), (4, 1), (10, 2), (16, 1)],
  term ((-44604 : Rat) / 3749) [(0, 2), (4, 1), (10, 1), (16, 1)],
  term ((89208 : Rat) / 3749) [(1, 1), (4, 1), (10, 1), (11, 1), (16, 1)],
  term ((-44604 : Rat) / 3749) [(1, 2), (4, 1), (10, 1), (16, 1)],
  term ((-89208 : Rat) / 3749) [(4, 1), (8, 1), (10, 2), (16, 1)],
  term ((44604 : Rat) / 3749) [(4, 1), (8, 2), (10, 1), (16, 1)],
  term ((-89208 : Rat) / 3749) [(4, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((44604 : Rat) / 3749) [(4, 1), (9, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 23. -/
theorem rs_R005_ueqv_R005YNY_partial_23_0002_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_23_0002
        rs_R005_ueqv_R005YNY_generator_23_0000_0015 =
      rs_R005_ueqv_R005YNY_partial_23_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 23. -/
def rs_R005_ueqv_R005YNY_coefficient_23_0003 : Poly :=
[
  term ((-232848 : Rat) / 3749) [(4, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 3 for generator 23. -/
def rs_R005_ueqv_R005YNY_partial_23_0003 : Poly :=
[
  term ((465696 : Rat) / 3749) [(0, 1), (4, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-232848 : Rat) / 3749) [(0, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((465696 : Rat) / 3749) [(1, 1), (4, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-232848 : Rat) / 3749) [(1, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-465696 : Rat) / 3749) [(4, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((232848 : Rat) / 3749) [(4, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-465696 : Rat) / 3749) [(4, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((232848 : Rat) / 3749) [(4, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 23. -/
theorem rs_R005_ueqv_R005YNY_partial_23_0003_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_23_0003
        rs_R005_ueqv_R005YNY_generator_23_0000_0015 =
      rs_R005_ueqv_R005YNY_partial_23_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 23. -/
def rs_R005_ueqv_R005YNY_coefficient_23_0004 : Poly :=
[
  term ((-149688 : Rat) / 3749) [(4, 1), (13, 2), (16, 1)]
]

/-- Partial product 4 for generator 23. -/
def rs_R005_ueqv_R005YNY_partial_23_0004 : Poly :=
[
  term ((299376 : Rat) / 3749) [(0, 1), (4, 1), (10, 1), (13, 2), (16, 1)],
  term ((-149688 : Rat) / 3749) [(0, 2), (4, 1), (13, 2), (16, 1)],
  term ((299376 : Rat) / 3749) [(1, 1), (4, 1), (11, 1), (13, 2), (16, 1)],
  term ((-149688 : Rat) / 3749) [(1, 2), (4, 1), (13, 2), (16, 1)],
  term ((-299376 : Rat) / 3749) [(4, 1), (8, 1), (10, 1), (13, 2), (16, 1)],
  term ((149688 : Rat) / 3749) [(4, 1), (8, 2), (13, 2), (16, 1)],
  term ((-299376 : Rat) / 3749) [(4, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((149688 : Rat) / 3749) [(4, 1), (9, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 23. -/
theorem rs_R005_ueqv_R005YNY_partial_23_0004_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_23_0004
        rs_R005_ueqv_R005YNY_generator_23_0000_0015 =
      rs_R005_ueqv_R005YNY_partial_23_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 23. -/
def rs_R005_ueqv_R005YNY_coefficient_23_0005 : Poly :=
[
  term ((44226 : Rat) / 3749) [(4, 1), (16, 1)]
]

/-- Partial product 5 for generator 23. -/
def rs_R005_ueqv_R005YNY_partial_23_0005 : Poly :=
[
  term ((-88452 : Rat) / 3749) [(0, 1), (4, 1), (10, 1), (16, 1)],
  term ((44226 : Rat) / 3749) [(0, 2), (4, 1), (16, 1)],
  term ((-88452 : Rat) / 3749) [(1, 1), (4, 1), (11, 1), (16, 1)],
  term ((44226 : Rat) / 3749) [(1, 2), (4, 1), (16, 1)],
  term ((88452 : Rat) / 3749) [(4, 1), (8, 1), (10, 1), (16, 1)],
  term ((-44226 : Rat) / 3749) [(4, 1), (8, 2), (16, 1)],
  term ((88452 : Rat) / 3749) [(4, 1), (9, 1), (11, 1), (16, 1)],
  term ((-44226 : Rat) / 3749) [(4, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 23. -/
theorem rs_R005_ueqv_R005YNY_partial_23_0005_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_23_0005
        rs_R005_ueqv_R005YNY_generator_23_0000_0015 =
      rs_R005_ueqv_R005YNY_partial_23_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 23. -/
def rs_R005_ueqv_R005YNY_coefficient_23_0006 : Poly :=
[
  term ((-1163106 : Rat) / 41239) [(5, 1), (7, 1), (16, 1)]
]

/-- Partial product 6 for generator 23. -/
def rs_R005_ueqv_R005YNY_partial_23_0006 : Poly :=
[
  term ((2326212 : Rat) / 41239) [(0, 1), (5, 1), (7, 1), (10, 1), (16, 1)],
  term ((-1163106 : Rat) / 41239) [(0, 2), (5, 1), (7, 1), (16, 1)],
  term ((2326212 : Rat) / 41239) [(1, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((-1163106 : Rat) / 41239) [(1, 2), (5, 1), (7, 1), (16, 1)],
  term ((-2326212 : Rat) / 41239) [(5, 1), (7, 1), (8, 1), (10, 1), (16, 1)],
  term ((1163106 : Rat) / 41239) [(5, 1), (7, 1), (8, 2), (16, 1)],
  term ((-2326212 : Rat) / 41239) [(5, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((1163106 : Rat) / 41239) [(5, 1), (7, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 23. -/
theorem rs_R005_ueqv_R005YNY_partial_23_0006_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_23_0006
        rs_R005_ueqv_R005YNY_generator_23_0000_0015 =
      rs_R005_ueqv_R005YNY_partial_23_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 23. -/
def rs_R005_ueqv_R005YNY_coefficient_23_0007 : Poly :=
[
  term ((-169344 : Rat) / 41239) [(5, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 7 for generator 23. -/
def rs_R005_ueqv_R005YNY_partial_23_0007 : Poly :=
[
  term ((338688 : Rat) / 41239) [(0, 1), (5, 1), (10, 2), (13, 1), (16, 1)],
  term ((-169344 : Rat) / 41239) [(0, 2), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((338688 : Rat) / 41239) [(1, 1), (5, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-169344 : Rat) / 41239) [(1, 2), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((-338688 : Rat) / 41239) [(5, 1), (8, 1), (10, 2), (13, 1), (16, 1)],
  term ((169344 : Rat) / 41239) [(5, 1), (8, 2), (10, 1), (13, 1), (16, 1)],
  term ((-338688 : Rat) / 41239) [(5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((169344 : Rat) / 41239) [(5, 1), (9, 2), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 23. -/
theorem rs_R005_ueqv_R005YNY_partial_23_0007_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_23_0007
        rs_R005_ueqv_R005YNY_generator_23_0000_0015 =
      rs_R005_ueqv_R005YNY_partial_23_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 23. -/
def rs_R005_ueqv_R005YNY_coefficient_23_0008 : Poly :=
[
  term ((127008 : Rat) / 41239) [(5, 1), (13, 1), (16, 1)]
]

/-- Partial product 8 for generator 23. -/
def rs_R005_ueqv_R005YNY_partial_23_0008 : Poly :=
[
  term ((-254016 : Rat) / 41239) [(0, 1), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((127008 : Rat) / 41239) [(0, 2), (5, 1), (13, 1), (16, 1)],
  term ((-254016 : Rat) / 41239) [(1, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((127008 : Rat) / 41239) [(1, 2), (5, 1), (13, 1), (16, 1)],
  term ((254016 : Rat) / 41239) [(5, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((-127008 : Rat) / 41239) [(5, 1), (8, 2), (13, 1), (16, 1)],
  term ((254016 : Rat) / 41239) [(5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-127008 : Rat) / 41239) [(5, 1), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 23. -/
theorem rs_R005_ueqv_R005YNY_partial_23_0008_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_23_0008
        rs_R005_ueqv_R005YNY_generator_23_0000_0015 =
      rs_R005_ueqv_R005YNY_partial_23_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 23. -/
def rs_R005_ueqv_R005YNY_coefficient_23_0009 : Poly :=
[
  term ((1360674 : Rat) / 41239) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 9 for generator 23. -/
def rs_R005_ueqv_R005YNY_partial_23_0009 : Poly :=
[
  term ((-2721348 : Rat) / 41239) [(0, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((1360674 : Rat) / 41239) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((-2721348 : Rat) / 41239) [(1, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((1360674 : Rat) / 41239) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((2721348 : Rat) / 41239) [(5, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1360674 : Rat) / 41239) [(5, 1), (8, 2), (15, 1), (16, 1)],
  term ((2721348 : Rat) / 41239) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1360674 : Rat) / 41239) [(5, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 23. -/
theorem rs_R005_ueqv_R005YNY_partial_23_0009_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_23_0009
        rs_R005_ueqv_R005YNY_generator_23_0000_0015 =
      rs_R005_ueqv_R005YNY_partial_23_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 23. -/
def rs_R005_ueqv_R005YNY_coefficient_23_0010 : Poly :=
[
  term ((37170 : Rat) / 3749) [(8, 1), (16, 1)]
]

/-- Partial product 10 for generator 23. -/
def rs_R005_ueqv_R005YNY_partial_23_0010 : Poly :=
[
  term ((-74340 : Rat) / 3749) [(0, 1), (8, 1), (10, 1), (16, 1)],
  term ((37170 : Rat) / 3749) [(0, 2), (8, 1), (16, 1)],
  term ((-74340 : Rat) / 3749) [(1, 1), (8, 1), (11, 1), (16, 1)],
  term ((37170 : Rat) / 3749) [(1, 2), (8, 1), (16, 1)],
  term ((74340 : Rat) / 3749) [(8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-37170 : Rat) / 3749) [(8, 1), (9, 2), (16, 1)],
  term ((74340 : Rat) / 3749) [(8, 2), (10, 1), (16, 1)],
  term ((-37170 : Rat) / 3749) [(8, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 23. -/
theorem rs_R005_ueqv_R005YNY_partial_23_0010_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_23_0010
        rs_R005_ueqv_R005YNY_generator_23_0000_0015 =
      rs_R005_ueqv_R005YNY_partial_23_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 23. -/
def rs_R005_ueqv_R005YNY_coefficient_23_0011 : Poly :=
[
  term ((269064 : Rat) / 3749) [(10, 1), (13, 2), (16, 1)]
]

/-- Partial product 11 for generator 23. -/
def rs_R005_ueqv_R005YNY_partial_23_0011 : Poly :=
[
  term ((-538128 : Rat) / 3749) [(0, 1), (10, 2), (13, 2), (16, 1)],
  term ((269064 : Rat) / 3749) [(0, 2), (10, 1), (13, 2), (16, 1)],
  term ((-538128 : Rat) / 3749) [(1, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((269064 : Rat) / 3749) [(1, 2), (10, 1), (13, 2), (16, 1)],
  term ((538128 : Rat) / 3749) [(8, 1), (10, 2), (13, 2), (16, 1)],
  term ((-269064 : Rat) / 3749) [(8, 2), (10, 1), (13, 2), (16, 1)],
  term ((538128 : Rat) / 3749) [(9, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((-269064 : Rat) / 3749) [(9, 2), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 23. -/
theorem rs_R005_ueqv_R005YNY_partial_23_0011_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_23_0011
        rs_R005_ueqv_R005YNY_generator_23_0000_0015 =
      rs_R005_ueqv_R005YNY_partial_23_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 23. -/
def rs_R005_ueqv_R005YNY_coefficient_23_0012 : Poly :=
[
  term ((-103302 : Rat) / 3749) [(10, 1), (16, 1)]
]

/-- Partial product 12 for generator 23. -/
def rs_R005_ueqv_R005YNY_partial_23_0012 : Poly :=
[
  term ((206604 : Rat) / 3749) [(0, 1), (10, 2), (16, 1)],
  term ((-103302 : Rat) / 3749) [(0, 2), (10, 1), (16, 1)],
  term ((206604 : Rat) / 3749) [(1, 1), (10, 1), (11, 1), (16, 1)],
  term ((-103302 : Rat) / 3749) [(1, 2), (10, 1), (16, 1)],
  term ((-206604 : Rat) / 3749) [(8, 1), (10, 2), (16, 1)],
  term ((103302 : Rat) / 3749) [(8, 2), (10, 1), (16, 1)],
  term ((-206604 : Rat) / 3749) [(9, 1), (10, 1), (11, 1), (16, 1)],
  term ((103302 : Rat) / 3749) [(9, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 23. -/
theorem rs_R005_ueqv_R005YNY_partial_23_0012_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_23_0012
        rs_R005_ueqv_R005YNY_generator_23_0000_0015 =
      rs_R005_ueqv_R005YNY_partial_23_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 23. -/
def rs_R005_ueqv_R005YNY_coefficient_23_0013 : Poly :=
[
  term ((-313908 : Rat) / 3749) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 13 for generator 23. -/
def rs_R005_ueqv_R005YNY_partial_23_0013 : Poly :=
[
  term ((627816 : Rat) / 3749) [(0, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-313908 : Rat) / 3749) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((627816 : Rat) / 3749) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-313908 : Rat) / 3749) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-627816 : Rat) / 3749) [(8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((313908 : Rat) / 3749) [(8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-627816 : Rat) / 3749) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((313908 : Rat) / 3749) [(9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 23. -/
theorem rs_R005_ueqv_R005YNY_partial_23_0013_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_23_0013
        rs_R005_ueqv_R005YNY_generator_23_0000_0015 =
      rs_R005_ueqv_R005YNY_partial_23_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 23. -/
def rs_R005_ueqv_R005YNY_coefficient_23_0014 : Poly :=
[
  term ((-201798 : Rat) / 3749) [(13, 2), (16, 1)]
]

/-- Partial product 14 for generator 23. -/
def rs_R005_ueqv_R005YNY_partial_23_0014 : Poly :=
[
  term ((403596 : Rat) / 3749) [(0, 1), (10, 1), (13, 2), (16, 1)],
  term ((-201798 : Rat) / 3749) [(0, 2), (13, 2), (16, 1)],
  term ((403596 : Rat) / 3749) [(1, 1), (11, 1), (13, 2), (16, 1)],
  term ((-201798 : Rat) / 3749) [(1, 2), (13, 2), (16, 1)],
  term ((-403596 : Rat) / 3749) [(8, 1), (10, 1), (13, 2), (16, 1)],
  term ((201798 : Rat) / 3749) [(8, 2), (13, 2), (16, 1)],
  term ((-403596 : Rat) / 3749) [(9, 1), (11, 1), (13, 2), (16, 1)],
  term ((201798 : Rat) / 3749) [(9, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 23. -/
theorem rs_R005_ueqv_R005YNY_partial_23_0014_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_23_0014
        rs_R005_ueqv_R005YNY_generator_23_0000_0015 =
      rs_R005_ueqv_R005YNY_partial_23_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 23. -/
def rs_R005_ueqv_R005YNY_coefficient_23_0015 : Poly :=
[
  term ((32523 : Rat) / 7498) [(16, 1)]
]

/-- Partial product 15 for generator 23. -/
def rs_R005_ueqv_R005YNY_partial_23_0015 : Poly :=
[
  term ((-32523 : Rat) / 3749) [(0, 1), (10, 1), (16, 1)],
  term ((32523 : Rat) / 7498) [(0, 2), (16, 1)],
  term ((-32523 : Rat) / 3749) [(1, 1), (11, 1), (16, 1)],
  term ((32523 : Rat) / 7498) [(1, 2), (16, 1)],
  term ((32523 : Rat) / 3749) [(8, 1), (10, 1), (16, 1)],
  term ((-32523 : Rat) / 7498) [(8, 2), (16, 1)],
  term ((32523 : Rat) / 3749) [(9, 1), (11, 1), (16, 1)],
  term ((-32523 : Rat) / 7498) [(9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 23. -/
theorem rs_R005_ueqv_R005YNY_partial_23_0015_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_23_0015
        rs_R005_ueqv_R005YNY_generator_23_0000_0015 =
      rs_R005_ueqv_R005YNY_partial_23_0015 := by
  native_decide

/-- Partial products in this block. -/
def rs_R005_ueqv_R005YNY_partials_23_0000_0015 : List Poly :=
[
  rs_R005_ueqv_R005YNY_partial_23_0000,
  rs_R005_ueqv_R005YNY_partial_23_0001,
  rs_R005_ueqv_R005YNY_partial_23_0002,
  rs_R005_ueqv_R005YNY_partial_23_0003,
  rs_R005_ueqv_R005YNY_partial_23_0004,
  rs_R005_ueqv_R005YNY_partial_23_0005,
  rs_R005_ueqv_R005YNY_partial_23_0006,
  rs_R005_ueqv_R005YNY_partial_23_0007,
  rs_R005_ueqv_R005YNY_partial_23_0008,
  rs_R005_ueqv_R005YNY_partial_23_0009,
  rs_R005_ueqv_R005YNY_partial_23_0010,
  rs_R005_ueqv_R005YNY_partial_23_0011,
  rs_R005_ueqv_R005YNY_partial_23_0012,
  rs_R005_ueqv_R005YNY_partial_23_0013,
  rs_R005_ueqv_R005YNY_partial_23_0014,
  rs_R005_ueqv_R005YNY_partial_23_0015
]

/-- Sum of partial products in this block. -/
def rs_R005_ueqv_R005YNY_block_23_0000_0015 : Poly :=
[
  term ((148680 : Rat) / 3749) [(0, 1), (4, 1), (8, 1), (10, 1), (16, 1)],
  term ((465696 : Rat) / 3749) [(0, 1), (4, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((299376 : Rat) / 3749) [(0, 1), (4, 1), (10, 1), (13, 2), (16, 1)],
  term ((-88452 : Rat) / 3749) [(0, 1), (4, 1), (10, 1), (16, 1)],
  term ((-399168 : Rat) / 3749) [(0, 1), (4, 1), (10, 2), (13, 2), (16, 1)],
  term ((89208 : Rat) / 3749) [(0, 1), (4, 1), (10, 2), (16, 1)],
  term ((2326212 : Rat) / 41239) [(0, 1), (5, 1), (7, 1), (10, 1), (16, 1)],
  term ((-254016 : Rat) / 41239) [(0, 1), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((-2721348 : Rat) / 41239) [(0, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((338688 : Rat) / 41239) [(0, 1), (5, 1), (10, 2), (13, 1), (16, 1)],
  term ((-74340 : Rat) / 3749) [(0, 1), (8, 1), (10, 1), (16, 1)],
  term ((627816 : Rat) / 3749) [(0, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((403596 : Rat) / 3749) [(0, 1), (10, 1), (13, 2), (16, 1)],
  term ((-32523 : Rat) / 3749) [(0, 1), (10, 1), (16, 1)],
  term ((-538128 : Rat) / 3749) [(0, 1), (10, 2), (13, 2), (16, 1)],
  term ((206604 : Rat) / 3749) [(0, 1), (10, 2), (16, 1)],
  term ((-74340 : Rat) / 3749) [(0, 2), (4, 1), (8, 1), (16, 1)],
  term ((199584 : Rat) / 3749) [(0, 2), (4, 1), (10, 1), (13, 2), (16, 1)],
  term ((-44604 : Rat) / 3749) [(0, 2), (4, 1), (10, 1), (16, 1)],
  term ((-232848 : Rat) / 3749) [(0, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-149688 : Rat) / 3749) [(0, 2), (4, 1), (13, 2), (16, 1)],
  term ((44226 : Rat) / 3749) [(0, 2), (4, 1), (16, 1)],
  term ((-1163106 : Rat) / 41239) [(0, 2), (5, 1), (7, 1), (16, 1)],
  term ((-169344 : Rat) / 41239) [(0, 2), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((127008 : Rat) / 41239) [(0, 2), (5, 1), (13, 1), (16, 1)],
  term ((1360674 : Rat) / 41239) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((37170 : Rat) / 3749) [(0, 2), (8, 1), (16, 1)],
  term ((269064 : Rat) / 3749) [(0, 2), (10, 1), (13, 2), (16, 1)],
  term ((-103302 : Rat) / 3749) [(0, 2), (10, 1), (16, 1)],
  term ((-313908 : Rat) / 3749) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-201798 : Rat) / 3749) [(0, 2), (13, 2), (16, 1)],
  term ((32523 : Rat) / 7498) [(0, 2), (16, 1)],
  term ((148680 : Rat) / 3749) [(1, 1), (4, 1), (8, 1), (11, 1), (16, 1)],
  term ((-399168 : Rat) / 3749) [(1, 1), (4, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((89208 : Rat) / 3749) [(1, 1), (4, 1), (10, 1), (11, 1), (16, 1)],
  term ((465696 : Rat) / 3749) [(1, 1), (4, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((299376 : Rat) / 3749) [(1, 1), (4, 1), (11, 1), (13, 2), (16, 1)],
  term ((-88452 : Rat) / 3749) [(1, 1), (4, 1), (11, 1), (16, 1)],
  term ((2326212 : Rat) / 41239) [(1, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((338688 : Rat) / 41239) [(1, 1), (5, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-254016 : Rat) / 41239) [(1, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((-2721348 : Rat) / 41239) [(1, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-74340 : Rat) / 3749) [(1, 1), (8, 1), (11, 1), (16, 1)],
  term ((-538128 : Rat) / 3749) [(1, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((206604 : Rat) / 3749) [(1, 1), (10, 1), (11, 1), (16, 1)],
  term ((627816 : Rat) / 3749) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((403596 : Rat) / 3749) [(1, 1), (11, 1), (13, 2), (16, 1)],
  term ((-32523 : Rat) / 3749) [(1, 1), (11, 1), (16, 1)],
  term ((-74340 : Rat) / 3749) [(1, 2), (4, 1), (8, 1), (16, 1)],
  term ((199584 : Rat) / 3749) [(1, 2), (4, 1), (10, 1), (13, 2), (16, 1)],
  term ((-44604 : Rat) / 3749) [(1, 2), (4, 1), (10, 1), (16, 1)],
  term ((-232848 : Rat) / 3749) [(1, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-149688 : Rat) / 3749) [(1, 2), (4, 1), (13, 2), (16, 1)],
  term ((44226 : Rat) / 3749) [(1, 2), (4, 1), (16, 1)],
  term ((-1163106 : Rat) / 41239) [(1, 2), (5, 1), (7, 1), (16, 1)],
  term ((-169344 : Rat) / 41239) [(1, 2), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((127008 : Rat) / 41239) [(1, 2), (5, 1), (13, 1), (16, 1)],
  term ((1360674 : Rat) / 41239) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((37170 : Rat) / 3749) [(1, 2), (8, 1), (16, 1)],
  term ((269064 : Rat) / 3749) [(1, 2), (10, 1), (13, 2), (16, 1)],
  term ((-103302 : Rat) / 3749) [(1, 2), (10, 1), (16, 1)],
  term ((-313908 : Rat) / 3749) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-201798 : Rat) / 3749) [(1, 2), (13, 2), (16, 1)],
  term ((32523 : Rat) / 7498) [(1, 2), (16, 1)],
  term ((-148680 : Rat) / 3749) [(4, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((74340 : Rat) / 3749) [(4, 1), (8, 1), (9, 2), (16, 1)],
  term ((-465696 : Rat) / 3749) [(4, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-299376 : Rat) / 3749) [(4, 1), (8, 1), (10, 1), (13, 2), (16, 1)],
  term ((88452 : Rat) / 3749) [(4, 1), (8, 1), (10, 1), (16, 1)],
  term ((399168 : Rat) / 3749) [(4, 1), (8, 1), (10, 2), (13, 2), (16, 1)],
  term ((-89208 : Rat) / 3749) [(4, 1), (8, 1), (10, 2), (16, 1)],
  term ((-199584 : Rat) / 3749) [(4, 1), (8, 2), (10, 1), (13, 2), (16, 1)],
  term ((-104076 : Rat) / 3749) [(4, 1), (8, 2), (10, 1), (16, 1)],
  term ((232848 : Rat) / 3749) [(4, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((149688 : Rat) / 3749) [(4, 1), (8, 2), (13, 2), (16, 1)],
  term ((-44226 : Rat) / 3749) [(4, 1), (8, 2), (16, 1)],
  term ((74340 : Rat) / 3749) [(4, 1), (8, 3), (16, 1)],
  term ((399168 : Rat) / 3749) [(4, 1), (9, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((-89208 : Rat) / 3749) [(4, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-465696 : Rat) / 3749) [(4, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-299376 : Rat) / 3749) [(4, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((88452 : Rat) / 3749) [(4, 1), (9, 1), (11, 1), (16, 1)],
  term ((-199584 : Rat) / 3749) [(4, 1), (9, 2), (10, 1), (13, 2), (16, 1)],
  term ((44604 : Rat) / 3749) [(4, 1), (9, 2), (10, 1), (16, 1)],
  term ((232848 : Rat) / 3749) [(4, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((149688 : Rat) / 3749) [(4, 1), (9, 2), (13, 2), (16, 1)],
  term ((-44226 : Rat) / 3749) [(4, 1), (9, 2), (16, 1)],
  term ((-2326212 : Rat) / 41239) [(5, 1), (7, 1), (8, 1), (10, 1), (16, 1)],
  term ((1163106 : Rat) / 41239) [(5, 1), (7, 1), (8, 2), (16, 1)],
  term ((-2326212 : Rat) / 41239) [(5, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((1163106 : Rat) / 41239) [(5, 1), (7, 1), (9, 2), (16, 1)],
  term ((254016 : Rat) / 41239) [(5, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((2721348 : Rat) / 41239) [(5, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-338688 : Rat) / 41239) [(5, 1), (8, 1), (10, 2), (13, 1), (16, 1)],
  term ((169344 : Rat) / 41239) [(5, 1), (8, 2), (10, 1), (13, 1), (16, 1)],
  term ((-127008 : Rat) / 41239) [(5, 1), (8, 2), (13, 1), (16, 1)],
  term ((-1360674 : Rat) / 41239) [(5, 1), (8, 2), (15, 1), (16, 1)],
  term ((-338688 : Rat) / 41239) [(5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((254016 : Rat) / 41239) [(5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((2721348 : Rat) / 41239) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((169344 : Rat) / 41239) [(5, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((-127008 : Rat) / 41239) [(5, 1), (9, 2), (13, 1), (16, 1)],
  term ((-1360674 : Rat) / 41239) [(5, 1), (9, 2), (15, 1), (16, 1)],
  term ((74340 : Rat) / 3749) [(8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-37170 : Rat) / 3749) [(8, 1), (9, 2), (16, 1)],
  term ((-627816 : Rat) / 3749) [(8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-403596 : Rat) / 3749) [(8, 1), (10, 1), (13, 2), (16, 1)],
  term ((32523 : Rat) / 3749) [(8, 1), (10, 1), (16, 1)],
  term ((538128 : Rat) / 3749) [(8, 1), (10, 2), (13, 2), (16, 1)],
  term ((-206604 : Rat) / 3749) [(8, 1), (10, 2), (16, 1)],
  term ((-269064 : Rat) / 3749) [(8, 2), (10, 1), (13, 2), (16, 1)],
  term ((177642 : Rat) / 3749) [(8, 2), (10, 1), (16, 1)],
  term ((313908 : Rat) / 3749) [(8, 2), (13, 1), (15, 1), (16, 1)],
  term ((201798 : Rat) / 3749) [(8, 2), (13, 2), (16, 1)],
  term ((-32523 : Rat) / 7498) [(8, 2), (16, 1)],
  term ((-37170 : Rat) / 3749) [(8, 3), (16, 1)],
  term ((538128 : Rat) / 3749) [(9, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((-206604 : Rat) / 3749) [(9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-627816 : Rat) / 3749) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-403596 : Rat) / 3749) [(9, 1), (11, 1), (13, 2), (16, 1)],
  term ((32523 : Rat) / 3749) [(9, 1), (11, 1), (16, 1)],
  term ((-269064 : Rat) / 3749) [(9, 2), (10, 1), (13, 2), (16, 1)],
  term ((103302 : Rat) / 3749) [(9, 2), (10, 1), (16, 1)],
  term ((313908 : Rat) / 3749) [(9, 2), (13, 1), (15, 1), (16, 1)],
  term ((201798 : Rat) / 3749) [(9, 2), (13, 2), (16, 1)],
  term ((-32523 : Rat) / 7498) [(9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 23, terms 0 through 15. -/
theorem rs_R005_ueqv_R005YNY_block_23_0000_0015_valid :
    checkProductSumEq rs_R005_ueqv_R005YNY_partials_23_0000_0015
      rs_R005_ueqv_R005YNY_block_23_0000_0015 = true := by
  native_decide

end R005UeqvR005YNYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
