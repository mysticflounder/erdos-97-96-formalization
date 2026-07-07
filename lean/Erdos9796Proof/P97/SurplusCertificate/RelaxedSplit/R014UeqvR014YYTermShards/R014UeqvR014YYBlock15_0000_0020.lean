/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R014:u=v:R014YY, term block 15:0-20

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R014UeqvR014YYTermShards

/-- Generator polynomial 15 for relaxed split surplus certificate `R014:u=v:R014YY`. -/
def rs_R014_ueqv_R014YY_generator_15_0000_0020 : Poly :=
[
  term (1 : Rat) [],
  term (-2 : Rat) [(4, 1)],
  term (2 : Rat) [(4, 1), (14, 1)],
  term (2 : Rat) [(5, 1), (15, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 15. -/
def rs_R014_ueqv_R014YY_coefficient_15_0000 : Poly :=
[
  term ((904391 : Rat) / 9240) []
]

/-- Partial product 0 for generator 15. -/
def rs_R014_ueqv_R014YY_partial_15_0000 : Poly :=
[
  term ((904391 : Rat) / 9240) [],
  term ((-904391 : Rat) / 4620) [(4, 1)],
  term ((904391 : Rat) / 4620) [(4, 1), (14, 1)],
  term ((904391 : Rat) / 4620) [(5, 1), (15, 1)],
  term ((-904391 : Rat) / 9240) [(14, 2)],
  term ((-904391 : Rat) / 9240) [(15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 15. -/
theorem rs_R014_ueqv_R014YY_partial_15_0000_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_15_0000
        rs_R014_ueqv_R014YY_generator_15_0000_0020 =
      rs_R014_ueqv_R014YY_partial_15_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 15. -/
def rs_R014_ueqv_R014YY_coefficient_15_0001 : Poly :=
[
  term ((-150411 : Rat) / 385) [(0, 1), (8, 1)]
]

/-- Partial product 1 for generator 15. -/
def rs_R014_ueqv_R014YY_partial_15_0001 : Poly :=
[
  term ((300822 : Rat) / 385) [(0, 1), (4, 1), (8, 1)],
  term ((-300822 : Rat) / 385) [(0, 1), (4, 1), (8, 1), (14, 1)],
  term ((-300822 : Rat) / 385) [(0, 1), (5, 1), (8, 1), (15, 1)],
  term ((-150411 : Rat) / 385) [(0, 1), (8, 1)],
  term ((150411 : Rat) / 385) [(0, 1), (8, 1), (14, 2)],
  term ((150411 : Rat) / 385) [(0, 1), (8, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 15. -/
theorem rs_R014_ueqv_R014YY_partial_15_0001_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_15_0001
        rs_R014_ueqv_R014YY_generator_15_0000_0020 =
      rs_R014_ueqv_R014YY_partial_15_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 15. -/
def rs_R014_ueqv_R014YY_coefficient_15_0002 : Poly :=
[
  term ((-150411 : Rat) / 385) [(1, 1), (9, 1)]
]

/-- Partial product 2 for generator 15. -/
def rs_R014_ueqv_R014YY_partial_15_0002 : Poly :=
[
  term ((300822 : Rat) / 385) [(1, 1), (4, 1), (9, 1)],
  term ((-300822 : Rat) / 385) [(1, 1), (4, 1), (9, 1), (14, 1)],
  term ((-300822 : Rat) / 385) [(1, 1), (5, 1), (9, 1), (15, 1)],
  term ((-150411 : Rat) / 385) [(1, 1), (9, 1)],
  term ((150411 : Rat) / 385) [(1, 1), (9, 1), (14, 2)],
  term ((150411 : Rat) / 385) [(1, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 15. -/
theorem rs_R014_ueqv_R014YY_partial_15_0002_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_15_0002
        rs_R014_ueqv_R014YY_generator_15_0000_0020 =
      rs_R014_ueqv_R014YY_partial_15_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 15. -/
def rs_R014_ueqv_R014YY_coefficient_15_0003 : Poly :=
[
  term ((301207 : Rat) / 1540) [(4, 1), (10, 1)]
]

/-- Partial product 3 for generator 15. -/
def rs_R014_ueqv_R014YY_partial_15_0003 : Poly :=
[
  term ((301207 : Rat) / 770) [(4, 1), (5, 1), (10, 1), (15, 1)],
  term ((301207 : Rat) / 1540) [(4, 1), (10, 1)],
  term ((-301207 : Rat) / 1540) [(4, 1), (10, 1), (14, 2)],
  term ((-301207 : Rat) / 1540) [(4, 1), (10, 1), (15, 2)],
  term ((-301207 : Rat) / 770) [(4, 2), (10, 1)],
  term ((301207 : Rat) / 770) [(4, 2), (10, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 15. -/
theorem rs_R014_ueqv_R014YY_partial_15_0003_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_15_0003
        rs_R014_ueqv_R014YY_generator_15_0000_0020 =
      rs_R014_ueqv_R014YY_partial_15_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 15. -/
def rs_R014_ueqv_R014YY_coefficient_15_0004 : Poly :=
[
  term ((-301207 : Rat) / 3080) [(4, 1), (14, 1)]
]

/-- Partial product 4 for generator 15. -/
def rs_R014_ueqv_R014YY_partial_15_0004 : Poly :=
[
  term ((-301207 : Rat) / 1540) [(4, 1), (5, 1), (14, 1), (15, 1)],
  term ((-301207 : Rat) / 3080) [(4, 1), (14, 1)],
  term ((301207 : Rat) / 3080) [(4, 1), (14, 1), (15, 2)],
  term ((301207 : Rat) / 3080) [(4, 1), (14, 3)],
  term ((301207 : Rat) / 1540) [(4, 2), (14, 1)],
  term ((-301207 : Rat) / 1540) [(4, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 15. -/
theorem rs_R014_ueqv_R014YY_partial_15_0004_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_15_0004
        rs_R014_ueqv_R014YY_generator_15_0000_0020 =
      rs_R014_ueqv_R014YY_partial_15_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 15. -/
def rs_R014_ueqv_R014YY_coefficient_15_0005 : Poly :=
[
  term ((301207 : Rat) / 3080) [(5, 1), (15, 1)]
]

/-- Partial product 5 for generator 15. -/
def rs_R014_ueqv_R014YY_partial_15_0005 : Poly :=
[
  term ((301207 : Rat) / 1540) [(4, 1), (5, 1), (14, 1), (15, 1)],
  term ((-301207 : Rat) / 1540) [(4, 1), (5, 1), (15, 1)],
  term ((-301207 : Rat) / 3080) [(5, 1), (14, 2), (15, 1)],
  term ((301207 : Rat) / 3080) [(5, 1), (15, 1)],
  term ((-301207 : Rat) / 3080) [(5, 1), (15, 3)],
  term ((301207 : Rat) / 1540) [(5, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 15. -/
theorem rs_R014_ueqv_R014YY_partial_15_0005_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_15_0005
        rs_R014_ueqv_R014YY_generator_15_0000_0020 =
      rs_R014_ueqv_R014YY_partial_15_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 15. -/
def rs_R014_ueqv_R014YY_coefficient_15_0006 : Poly :=
[
  term ((-2 : Rat) / 3) [(7, 1), (11, 1)]
]

/-- Partial product 6 for generator 15. -/
def rs_R014_ueqv_R014YY_partial_15_0006 : Poly :=
[
  term ((4 : Rat) / 3) [(4, 1), (7, 1), (11, 1)],
  term ((-4 : Rat) / 3) [(4, 1), (7, 1), (11, 1), (14, 1)],
  term ((-4 : Rat) / 3) [(5, 1), (7, 1), (11, 1), (15, 1)],
  term ((-2 : Rat) / 3) [(7, 1), (11, 1)],
  term ((2 : Rat) / 3) [(7, 1), (11, 1), (14, 2)],
  term ((2 : Rat) / 3) [(7, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 15. -/
theorem rs_R014_ueqv_R014YY_partial_15_0006_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_15_0006
        rs_R014_ueqv_R014YY_generator_15_0000_0020 =
      rs_R014_ueqv_R014YY_partial_15_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 15. -/
def rs_R014_ueqv_R014YY_coefficient_15_0007 : Poly :=
[
  term ((-19 : Rat) / 6) [(7, 1), (13, 1)]
]

/-- Partial product 7 for generator 15. -/
def rs_R014_ueqv_R014YY_partial_15_0007 : Poly :=
[
  term ((19 : Rat) / 3) [(4, 1), (7, 1), (13, 1)],
  term ((-19 : Rat) / 3) [(4, 1), (7, 1), (13, 1), (14, 1)],
  term ((-19 : Rat) / 3) [(5, 1), (7, 1), (13, 1), (15, 1)],
  term ((-19 : Rat) / 6) [(7, 1), (13, 1)],
  term ((19 : Rat) / 6) [(7, 1), (13, 1), (14, 2)],
  term ((19 : Rat) / 6) [(7, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 15. -/
theorem rs_R014_ueqv_R014YY_partial_15_0007_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_15_0007
        rs_R014_ueqv_R014YY_generator_15_0000_0020 =
      rs_R014_ueqv_R014YY_partial_15_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 15. -/
def rs_R014_ueqv_R014YY_coefficient_15_0008 : Poly :=
[
  term ((301207 : Rat) / 3080) [(8, 1)]
]

/-- Partial product 8 for generator 15. -/
def rs_R014_ueqv_R014YY_partial_15_0008 : Poly :=
[
  term ((-301207 : Rat) / 1540) [(4, 1), (8, 1)],
  term ((301207 : Rat) / 1540) [(4, 1), (8, 1), (14, 1)],
  term ((301207 : Rat) / 1540) [(5, 1), (8, 1), (15, 1)],
  term ((301207 : Rat) / 3080) [(8, 1)],
  term ((-301207 : Rat) / 3080) [(8, 1), (14, 2)],
  term ((-301207 : Rat) / 3080) [(8, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 15. -/
theorem rs_R014_ueqv_R014YY_partial_15_0008_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_15_0008
        rs_R014_ueqv_R014YY_generator_15_0000_0020 =
      rs_R014_ueqv_R014YY_partial_15_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 15. -/
def rs_R014_ueqv_R014YY_coefficient_15_0009 : Poly :=
[
  term ((-301207 : Rat) / 1540) [(8, 1), (10, 1)]
]

/-- Partial product 9 for generator 15. -/
def rs_R014_ueqv_R014YY_partial_15_0009 : Poly :=
[
  term ((301207 : Rat) / 770) [(4, 1), (8, 1), (10, 1)],
  term ((-301207 : Rat) / 770) [(4, 1), (8, 1), (10, 1), (14, 1)],
  term ((-301207 : Rat) / 770) [(5, 1), (8, 1), (10, 1), (15, 1)],
  term ((-301207 : Rat) / 1540) [(8, 1), (10, 1)],
  term ((301207 : Rat) / 1540) [(8, 1), (10, 1), (14, 2)],
  term ((301207 : Rat) / 1540) [(8, 1), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 15. -/
theorem rs_R014_ueqv_R014YY_partial_15_0009_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_15_0009
        rs_R014_ueqv_R014YY_generator_15_0000_0020 =
      rs_R014_ueqv_R014YY_partial_15_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 15. -/
def rs_R014_ueqv_R014YY_coefficient_15_0010 : Poly :=
[
  term ((-1 : Rat) / 2) [(10, 1)]
]

/-- Partial product 10 for generator 15. -/
def rs_R014_ueqv_R014YY_partial_15_0010 : Poly :=
[
  term (1 : Rat) [(4, 1), (10, 1)],
  term (-1 : Rat) [(4, 1), (10, 1), (14, 1)],
  term (-1 : Rat) [(5, 1), (10, 1), (15, 1)],
  term ((-1 : Rat) / 2) [(10, 1)],
  term ((1 : Rat) / 2) [(10, 1), (14, 2)],
  term ((1 : Rat) / 2) [(10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 15. -/
theorem rs_R014_ueqv_R014YY_partial_15_0010_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_15_0010
        rs_R014_ueqv_R014YY_generator_15_0000_0020 =
      rs_R014_ueqv_R014YY_partial_15_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 15. -/
def rs_R014_ueqv_R014YY_coefficient_15_0011 : Poly :=
[
  term ((-150411 : Rat) / 385) [(10, 1), (14, 1)]
]

/-- Partial product 11 for generator 15. -/
def rs_R014_ueqv_R014YY_partial_15_0011 : Poly :=
[
  term ((300822 : Rat) / 385) [(4, 1), (10, 1), (14, 1)],
  term ((-300822 : Rat) / 385) [(4, 1), (10, 1), (14, 2)],
  term ((-300822 : Rat) / 385) [(5, 1), (10, 1), (14, 1), (15, 1)],
  term ((-150411 : Rat) / 385) [(10, 1), (14, 1)],
  term ((150411 : Rat) / 385) [(10, 1), (14, 1), (15, 2)],
  term ((150411 : Rat) / 385) [(10, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 15. -/
theorem rs_R014_ueqv_R014YY_partial_15_0011_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_15_0011
        rs_R014_ueqv_R014YY_generator_15_0000_0020 =
      rs_R014_ueqv_R014YY_partial_15_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 15. -/
def rs_R014_ueqv_R014YY_coefficient_15_0012 : Poly :=
[
  term (-14 : Rat) [(11, 1), (13, 1)]
]

/-- Partial product 12 for generator 15. -/
def rs_R014_ueqv_R014YY_partial_15_0012 : Poly :=
[
  term (28 : Rat) [(4, 1), (11, 1), (13, 1)],
  term (-28 : Rat) [(4, 1), (11, 1), (13, 1), (14, 1)],
  term (-28 : Rat) [(5, 1), (11, 1), (13, 1), (15, 1)],
  term (-14 : Rat) [(11, 1), (13, 1)],
  term (14 : Rat) [(11, 1), (13, 1), (14, 2)],
  term (14 : Rat) [(11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 15. -/
theorem rs_R014_ueqv_R014YY_partial_15_0012_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_15_0012
        rs_R014_ueqv_R014YY_generator_15_0000_0020 =
      rs_R014_ueqv_R014YY_partial_15_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 15. -/
def rs_R014_ueqv_R014YY_coefficient_15_0013 : Poly :=
[
  term ((-3 : Rat) / 2) [(11, 1), (14, 1), (15, 1)]
]

/-- Partial product 13 for generator 15. -/
def rs_R014_ueqv_R014YY_partial_15_0013 : Poly :=
[
  term (3 : Rat) [(4, 1), (11, 1), (14, 1), (15, 1)],
  term (-3 : Rat) [(4, 1), (11, 1), (14, 2), (15, 1)],
  term (-3 : Rat) [(5, 1), (11, 1), (14, 1), (15, 2)],
  term ((-3 : Rat) / 2) [(11, 1), (14, 1), (15, 1)],
  term ((3 : Rat) / 2) [(11, 1), (14, 1), (15, 3)],
  term ((3 : Rat) / 2) [(11, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 15. -/
theorem rs_R014_ueqv_R014YY_partial_15_0013_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_15_0013
        rs_R014_ueqv_R014YY_generator_15_0000_0020 =
      rs_R014_ueqv_R014YY_partial_15_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 15. -/
def rs_R014_ueqv_R014YY_coefficient_15_0014 : Poly :=
[
  term ((2 : Rat) / 3) [(11, 1), (15, 1)]
]

/-- Partial product 14 for generator 15. -/
def rs_R014_ueqv_R014YY_partial_15_0014 : Poly :=
[
  term ((4 : Rat) / 3) [(4, 1), (11, 1), (14, 1), (15, 1)],
  term ((-4 : Rat) / 3) [(4, 1), (11, 1), (15, 1)],
  term ((4 : Rat) / 3) [(5, 1), (11, 1), (15, 2)],
  term ((-2 : Rat) / 3) [(11, 1), (14, 2), (15, 1)],
  term ((2 : Rat) / 3) [(11, 1), (15, 1)],
  term ((-2 : Rat) / 3) [(11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 15. -/
theorem rs_R014_ueqv_R014YY_partial_15_0014_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_15_0014
        rs_R014_ueqv_R014YY_generator_15_0000_0020 =
      rs_R014_ueqv_R014YY_partial_15_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 15. -/
def rs_R014_ueqv_R014YY_coefficient_15_0015 : Poly :=
[
  term ((3 : Rat) / 4) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 15 for generator 15. -/
def rs_R014_ueqv_R014YY_partial_15_0015 : Poly :=
[
  term ((-3 : Rat) / 2) [(4, 1), (13, 1), (14, 1), (15, 1)],
  term ((3 : Rat) / 2) [(4, 1), (13, 1), (14, 2), (15, 1)],
  term ((3 : Rat) / 2) [(5, 1), (13, 1), (14, 1), (15, 2)],
  term ((3 : Rat) / 4) [(13, 1), (14, 1), (15, 1)],
  term ((-3 : Rat) / 4) [(13, 1), (14, 1), (15, 3)],
  term ((-3 : Rat) / 4) [(13, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 15. -/
theorem rs_R014_ueqv_R014YY_partial_15_0015_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_15_0015
        rs_R014_ueqv_R014YY_generator_15_0000_0020 =
      rs_R014_ueqv_R014YY_partial_15_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 15. -/
def rs_R014_ueqv_R014YY_coefficient_15_0016 : Poly :=
[
  term ((-906701 : Rat) / 9240) [(13, 1), (15, 1)]
]

/-- Partial product 16 for generator 15. -/
def rs_R014_ueqv_R014YY_partial_15_0016 : Poly :=
[
  term ((-906701 : Rat) / 4620) [(4, 1), (13, 1), (14, 1), (15, 1)],
  term ((906701 : Rat) / 4620) [(4, 1), (13, 1), (15, 1)],
  term ((-906701 : Rat) / 4620) [(5, 1), (13, 1), (15, 2)],
  term ((906701 : Rat) / 9240) [(13, 1), (14, 2), (15, 1)],
  term ((-906701 : Rat) / 9240) [(13, 1), (15, 1)],
  term ((906701 : Rat) / 9240) [(13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 15. -/
theorem rs_R014_ueqv_R014YY_partial_15_0016_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_15_0016
        rs_R014_ueqv_R014YY_generator_15_0000_0020 =
      rs_R014_ueqv_R014YY_partial_15_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 15. -/
def rs_R014_ueqv_R014YY_coefficient_15_0017 : Poly :=
[
  term ((21 : Rat) / 2) [(13, 2)]
]

/-- Partial product 17 for generator 15. -/
def rs_R014_ueqv_R014YY_partial_15_0017 : Poly :=
[
  term (-21 : Rat) [(4, 1), (13, 2)],
  term (21 : Rat) [(4, 1), (13, 2), (14, 1)],
  term (21 : Rat) [(5, 1), (13, 2), (15, 1)],
  term ((21 : Rat) / 2) [(13, 2)],
  term ((-21 : Rat) / 2) [(13, 2), (14, 2)],
  term ((-21 : Rat) / 2) [(13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 15. -/
theorem rs_R014_ueqv_R014YY_partial_15_0017_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_15_0017
        rs_R014_ueqv_R014YY_generator_15_0000_0020 =
      rs_R014_ueqv_R014YY_partial_15_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 15. -/
def rs_R014_ueqv_R014YY_coefficient_15_0018 : Poly :=
[
  term ((-902081 : Rat) / 18480) [(14, 1)]
]

/-- Partial product 18 for generator 15. -/
def rs_R014_ueqv_R014YY_partial_15_0018 : Poly :=
[
  term ((902081 : Rat) / 9240) [(4, 1), (14, 1)],
  term ((-902081 : Rat) / 9240) [(4, 1), (14, 2)],
  term ((-902081 : Rat) / 9240) [(5, 1), (14, 1), (15, 1)],
  term ((-902081 : Rat) / 18480) [(14, 1)],
  term ((902081 : Rat) / 18480) [(14, 1), (15, 2)],
  term ((902081 : Rat) / 18480) [(14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 15. -/
theorem rs_R014_ueqv_R014YY_partial_15_0018_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_15_0018
        rs_R014_ueqv_R014YY_generator_15_0000_0020 =
      rs_R014_ueqv_R014YY_partial_15_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 15. -/
def rs_R014_ueqv_R014YY_coefficient_15_0019 : Poly :=
[
  term ((150411 : Rat) / 770) [(14, 2)]
]

/-- Partial product 19 for generator 15. -/
def rs_R014_ueqv_R014YY_partial_15_0019 : Poly :=
[
  term ((-150411 : Rat) / 385) [(4, 1), (14, 2)],
  term ((150411 : Rat) / 385) [(4, 1), (14, 3)],
  term ((150411 : Rat) / 385) [(5, 1), (14, 2), (15, 1)],
  term ((150411 : Rat) / 770) [(14, 2)],
  term ((-150411 : Rat) / 770) [(14, 2), (15, 2)],
  term ((-150411 : Rat) / 770) [(14, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 15. -/
theorem rs_R014_ueqv_R014YY_partial_15_0019_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_15_0019
        rs_R014_ueqv_R014YY_generator_15_0000_0020 =
      rs_R014_ueqv_R014YY_partial_15_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 15. -/
def rs_R014_ueqv_R014YY_coefficient_15_0020 : Poly :=
[
  term ((600489 : Rat) / 3080) [(15, 2)]
]

/-- Partial product 20 for generator 15. -/
def rs_R014_ueqv_R014YY_partial_15_0020 : Poly :=
[
  term ((600489 : Rat) / 1540) [(4, 1), (14, 1), (15, 2)],
  term ((-600489 : Rat) / 1540) [(4, 1), (15, 2)],
  term ((600489 : Rat) / 1540) [(5, 1), (15, 3)],
  term ((-600489 : Rat) / 3080) [(14, 2), (15, 2)],
  term ((600489 : Rat) / 3080) [(15, 2)],
  term ((-600489 : Rat) / 3080) [(15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 15. -/
theorem rs_R014_ueqv_R014YY_partial_15_0020_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_15_0020
        rs_R014_ueqv_R014YY_generator_15_0000_0020 =
      rs_R014_ueqv_R014YY_partial_15_0020 := by
  native_decide

/-- Partial products in this block. -/
def rs_R014_ueqv_R014YY_partials_15_0000_0020 : List Poly :=
[
  rs_R014_ueqv_R014YY_partial_15_0000,
  rs_R014_ueqv_R014YY_partial_15_0001,
  rs_R014_ueqv_R014YY_partial_15_0002,
  rs_R014_ueqv_R014YY_partial_15_0003,
  rs_R014_ueqv_R014YY_partial_15_0004,
  rs_R014_ueqv_R014YY_partial_15_0005,
  rs_R014_ueqv_R014YY_partial_15_0006,
  rs_R014_ueqv_R014YY_partial_15_0007,
  rs_R014_ueqv_R014YY_partial_15_0008,
  rs_R014_ueqv_R014YY_partial_15_0009,
  rs_R014_ueqv_R014YY_partial_15_0010,
  rs_R014_ueqv_R014YY_partial_15_0011,
  rs_R014_ueqv_R014YY_partial_15_0012,
  rs_R014_ueqv_R014YY_partial_15_0013,
  rs_R014_ueqv_R014YY_partial_15_0014,
  rs_R014_ueqv_R014YY_partial_15_0015,
  rs_R014_ueqv_R014YY_partial_15_0016,
  rs_R014_ueqv_R014YY_partial_15_0017,
  rs_R014_ueqv_R014YY_partial_15_0018,
  rs_R014_ueqv_R014YY_partial_15_0019,
  rs_R014_ueqv_R014YY_partial_15_0020
]

/-- Sum of partial products in this block. -/
def rs_R014_ueqv_R014YY_block_15_0000_0020 : Poly :=
[
  term ((904391 : Rat) / 9240) [],
  term ((300822 : Rat) / 385) [(0, 1), (4, 1), (8, 1)],
  term ((-300822 : Rat) / 385) [(0, 1), (4, 1), (8, 1), (14, 1)],
  term ((-300822 : Rat) / 385) [(0, 1), (5, 1), (8, 1), (15, 1)],
  term ((-150411 : Rat) / 385) [(0, 1), (8, 1)],
  term ((150411 : Rat) / 385) [(0, 1), (8, 1), (14, 2)],
  term ((150411 : Rat) / 385) [(0, 1), (8, 1), (15, 2)],
  term ((300822 : Rat) / 385) [(1, 1), (4, 1), (9, 1)],
  term ((-300822 : Rat) / 385) [(1, 1), (4, 1), (9, 1), (14, 1)],
  term ((-300822 : Rat) / 385) [(1, 1), (5, 1), (9, 1), (15, 1)],
  term ((-150411 : Rat) / 385) [(1, 1), (9, 1)],
  term ((150411 : Rat) / 385) [(1, 1), (9, 1), (14, 2)],
  term ((150411 : Rat) / 385) [(1, 1), (9, 1), (15, 2)],
  term ((-904391 : Rat) / 4620) [(4, 1)],
  term ((301207 : Rat) / 770) [(4, 1), (5, 1), (10, 1), (15, 1)],
  term ((-301207 : Rat) / 1540) [(4, 1), (5, 1), (15, 1)],
  term ((4 : Rat) / 3) [(4, 1), (7, 1), (11, 1)],
  term ((-4 : Rat) / 3) [(4, 1), (7, 1), (11, 1), (14, 1)],
  term ((19 : Rat) / 3) [(4, 1), (7, 1), (13, 1)],
  term ((-19 : Rat) / 3) [(4, 1), (7, 1), (13, 1), (14, 1)],
  term ((-301207 : Rat) / 1540) [(4, 1), (8, 1)],
  term ((301207 : Rat) / 770) [(4, 1), (8, 1), (10, 1)],
  term ((-301207 : Rat) / 770) [(4, 1), (8, 1), (10, 1), (14, 1)],
  term ((301207 : Rat) / 1540) [(4, 1), (8, 1), (14, 1)],
  term ((302747 : Rat) / 1540) [(4, 1), (10, 1)],
  term ((300437 : Rat) / 385) [(4, 1), (10, 1), (14, 1)],
  term ((-300899 : Rat) / 308) [(4, 1), (10, 1), (14, 2)],
  term ((-301207 : Rat) / 1540) [(4, 1), (10, 1), (15, 2)],
  term (28 : Rat) [(4, 1), (11, 1), (13, 1)],
  term (-28 : Rat) [(4, 1), (11, 1), (13, 1), (14, 1)],
  term ((13 : Rat) / 3) [(4, 1), (11, 1), (14, 1), (15, 1)],
  term (-3 : Rat) [(4, 1), (11, 1), (14, 2), (15, 1)],
  term ((-4 : Rat) / 3) [(4, 1), (11, 1), (15, 1)],
  term ((-913631 : Rat) / 4620) [(4, 1), (13, 1), (14, 1), (15, 1)],
  term ((3 : Rat) / 2) [(4, 1), (13, 1), (14, 2), (15, 1)],
  term ((906701 : Rat) / 4620) [(4, 1), (13, 1), (15, 1)],
  term (-21 : Rat) [(4, 1), (13, 2)],
  term (21 : Rat) [(4, 1), (13, 2), (14, 1)],
  term ((301207 : Rat) / 1540) [(4, 1), (14, 1)],
  term ((300437 : Rat) / 616) [(4, 1), (14, 1), (15, 2)],
  term ((-902389 : Rat) / 1848) [(4, 1), (14, 2)],
  term ((300899 : Rat) / 616) [(4, 1), (14, 3)],
  term ((-600489 : Rat) / 1540) [(4, 1), (15, 2)],
  term ((-301207 : Rat) / 770) [(4, 2), (10, 1)],
  term ((301207 : Rat) / 770) [(4, 2), (10, 1), (14, 1)],
  term ((301207 : Rat) / 1540) [(4, 2), (14, 1)],
  term ((-301207 : Rat) / 1540) [(4, 2), (14, 2)],
  term ((-4 : Rat) / 3) [(5, 1), (7, 1), (11, 1), (15, 1)],
  term ((-19 : Rat) / 3) [(5, 1), (7, 1), (13, 1), (15, 1)],
  term ((-301207 : Rat) / 770) [(5, 1), (8, 1), (10, 1), (15, 1)],
  term ((301207 : Rat) / 1540) [(5, 1), (8, 1), (15, 1)],
  term ((-300822 : Rat) / 385) [(5, 1), (10, 1), (14, 1), (15, 1)],
  term (-1 : Rat) [(5, 1), (10, 1), (15, 1)],
  term (-28 : Rat) [(5, 1), (11, 1), (13, 1), (15, 1)],
  term (-3 : Rat) [(5, 1), (11, 1), (14, 1), (15, 2)],
  term ((4 : Rat) / 3) [(5, 1), (11, 1), (15, 2)],
  term ((3 : Rat) / 2) [(5, 1), (13, 1), (14, 1), (15, 2)],
  term ((-906701 : Rat) / 4620) [(5, 1), (13, 1), (15, 2)],
  term (21 : Rat) [(5, 1), (13, 2), (15, 1)],
  term ((-902081 : Rat) / 9240) [(5, 1), (14, 1), (15, 1)],
  term ((902081 : Rat) / 3080) [(5, 1), (14, 2), (15, 1)],
  term ((2712403 : Rat) / 9240) [(5, 1), (15, 1)],
  term ((899771 : Rat) / 3080) [(5, 1), (15, 3)],
  term ((301207 : Rat) / 1540) [(5, 2), (15, 2)],
  term ((-2 : Rat) / 3) [(7, 1), (11, 1)],
  term ((2 : Rat) / 3) [(7, 1), (11, 1), (14, 2)],
  term ((2 : Rat) / 3) [(7, 1), (11, 1), (15, 2)],
  term ((-19 : Rat) / 6) [(7, 1), (13, 1)],
  term ((19 : Rat) / 6) [(7, 1), (13, 1), (14, 2)],
  term ((19 : Rat) / 6) [(7, 1), (13, 1), (15, 2)],
  term ((301207 : Rat) / 3080) [(8, 1)],
  term ((-301207 : Rat) / 1540) [(8, 1), (10, 1)],
  term ((301207 : Rat) / 1540) [(8, 1), (10, 1), (14, 2)],
  term ((301207 : Rat) / 1540) [(8, 1), (10, 1), (15, 2)],
  term ((-301207 : Rat) / 3080) [(8, 1), (14, 2)],
  term ((-301207 : Rat) / 3080) [(8, 1), (15, 2)],
  term ((-1 : Rat) / 2) [(10, 1)],
  term ((-150411 : Rat) / 385) [(10, 1), (14, 1)],
  term ((150411 : Rat) / 385) [(10, 1), (14, 1), (15, 2)],
  term ((1 : Rat) / 2) [(10, 1), (14, 2)],
  term ((150411 : Rat) / 385) [(10, 1), (14, 3)],
  term ((1 : Rat) / 2) [(10, 1), (15, 2)],
  term (-14 : Rat) [(11, 1), (13, 1)],
  term (14 : Rat) [(11, 1), (13, 1), (14, 2)],
  term (14 : Rat) [(11, 1), (13, 1), (15, 2)],
  term ((-3 : Rat) / 2) [(11, 1), (14, 1), (15, 1)],
  term ((3 : Rat) / 2) [(11, 1), (14, 1), (15, 3)],
  term ((-2 : Rat) / 3) [(11, 1), (14, 2), (15, 1)],
  term ((3 : Rat) / 2) [(11, 1), (14, 3), (15, 1)],
  term ((2 : Rat) / 3) [(11, 1), (15, 1)],
  term ((-2 : Rat) / 3) [(11, 1), (15, 3)],
  term ((3 : Rat) / 4) [(13, 1), (14, 1), (15, 1)],
  term ((-3 : Rat) / 4) [(13, 1), (14, 1), (15, 3)],
  term ((906701 : Rat) / 9240) [(13, 1), (14, 2), (15, 1)],
  term ((-3 : Rat) / 4) [(13, 1), (14, 3), (15, 1)],
  term ((-906701 : Rat) / 9240) [(13, 1), (15, 1)],
  term ((906701 : Rat) / 9240) [(13, 1), (15, 3)],
  term ((21 : Rat) / 2) [(13, 2)],
  term ((-21 : Rat) / 2) [(13, 2), (14, 2)],
  term ((-21 : Rat) / 2) [(13, 2), (15, 2)],
  term ((-902081 : Rat) / 18480) [(14, 1)],
  term ((902081 : Rat) / 18480) [(14, 1), (15, 2)],
  term ((900541 : Rat) / 9240) [(14, 2)],
  term ((-1202133 : Rat) / 3080) [(14, 2), (15, 2)],
  term ((902081 : Rat) / 18480) [(14, 3)],
  term ((-150411 : Rat) / 770) [(14, 4)],
  term ((224269 : Rat) / 2310) [(15, 2)],
  term ((-600489 : Rat) / 3080) [(15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 15, terms 0 through 20. -/
theorem rs_R014_ueqv_R014YY_block_15_0000_0020_valid :
    checkProductSumEq rs_R014_ueqv_R014YY_partials_15_0000_0020
      rs_R014_ueqv_R014YY_block_15_0000_0020 = true := by
  native_decide

end R014UeqvR014YYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
