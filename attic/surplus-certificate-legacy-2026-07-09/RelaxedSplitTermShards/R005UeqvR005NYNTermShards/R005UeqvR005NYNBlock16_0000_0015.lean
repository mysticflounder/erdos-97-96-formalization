/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R005:u=v:R005NYN, term block 16:0-15

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R005UeqvR005NYNTermShards

/-- Generator polynomial 16 for relaxed split surplus certificate `R005:u=v:R005NYN`. -/
def rs_R005_ueqv_R005NYN_generator_16_0000_0015 : Poly :=
[
  term (1 : Rat) [],
  term (2 : Rat) [(2, 1), (6, 1)],
  term (-1 : Rat) [(2, 2)],
  term (2 : Rat) [(3, 1), (7, 1)],
  term (-1 : Rat) [(3, 2)],
  term (-2 : Rat) [(6, 1)]
]

/-- Coefficient term 0 from coefficient polynomial 16. -/
def rs_R005_ueqv_R005NYN_coefficient_16_0000 : Poly :=
[
  term ((-500800 : Rat) / 52799) [(0, 1), (3, 1), (15, 1)]
]

/-- Partial product 0 for generator 16. -/
def rs_R005_ueqv_R005NYN_partial_16_0000 : Poly :=
[
  term ((-1001600 : Rat) / 52799) [(0, 1), (2, 1), (3, 1), (6, 1), (15, 1)],
  term ((500800 : Rat) / 52799) [(0, 1), (2, 2), (3, 1), (15, 1)],
  term ((1001600 : Rat) / 52799) [(0, 1), (3, 1), (6, 1), (15, 1)],
  term ((-500800 : Rat) / 52799) [(0, 1), (3, 1), (15, 1)],
  term ((-1001600 : Rat) / 52799) [(0, 1), (3, 2), (7, 1), (15, 1)],
  term ((500800 : Rat) / 52799) [(0, 1), (3, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 16. -/
theorem rs_R005_ueqv_R005NYN_partial_16_0000_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_16_0000
        rs_R005_ueqv_R005NYN_generator_16_0000_0015 =
      rs_R005_ueqv_R005NYN_partial_16_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 16. -/
def rs_R005_ueqv_R005NYN_coefficient_16_0001 : Poly :=
[
  term ((-1847568 : Rat) / 385571) [(0, 1), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 1 for generator 16. -/
def rs_R005_ueqv_R005NYN_partial_16_0001 : Poly :=
[
  term ((-3695136 : Rat) / 385571) [(0, 1), (2, 1), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((1847568 : Rat) / 385571) [(0, 1), (2, 2), (3, 1), (15, 1), (16, 1)],
  term ((3695136 : Rat) / 385571) [(0, 1), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-1847568 : Rat) / 385571) [(0, 1), (3, 1), (15, 1), (16, 1)],
  term ((-3695136 : Rat) / 385571) [(0, 1), (3, 2), (7, 1), (15, 1), (16, 1)],
  term ((1847568 : Rat) / 385571) [(0, 1), (3, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 16. -/
theorem rs_R005_ueqv_R005NYN_partial_16_0001_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_16_0001
        rs_R005_ueqv_R005NYN_generator_16_0000_0015 =
      rs_R005_ueqv_R005NYN_partial_16_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 16. -/
def rs_R005_ueqv_R005NYN_coefficient_16_0002 : Poly :=
[
  term ((6432640 : Rat) / 158397) [(0, 1), (9, 1), (15, 1)]
]

/-- Partial product 2 for generator 16. -/
def rs_R005_ueqv_R005NYN_partial_16_0002 : Poly :=
[
  term ((12865280 : Rat) / 158397) [(0, 1), (2, 1), (6, 1), (9, 1), (15, 1)],
  term ((-6432640 : Rat) / 158397) [(0, 1), (2, 2), (9, 1), (15, 1)],
  term ((12865280 : Rat) / 158397) [(0, 1), (3, 1), (7, 1), (9, 1), (15, 1)],
  term ((-6432640 : Rat) / 158397) [(0, 1), (3, 2), (9, 1), (15, 1)],
  term ((-12865280 : Rat) / 158397) [(0, 1), (6, 1), (9, 1), (15, 1)],
  term ((6432640 : Rat) / 158397) [(0, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 16. -/
theorem rs_R005_ueqv_R005NYN_partial_16_0002_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_16_0002
        rs_R005_ueqv_R005NYN_generator_16_0000_0015 =
      rs_R005_ueqv_R005NYN_partial_16_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 16. -/
def rs_R005_ueqv_R005NYN_coefficient_16_0003 : Poly :=
[
  term ((-47655232 : Rat) / 385571) [(0, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 3 for generator 16. -/
def rs_R005_ueqv_R005NYN_partial_16_0003 : Poly :=
[
  term ((-95310464 : Rat) / 385571) [(0, 1), (2, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((47655232 : Rat) / 385571) [(0, 1), (2, 2), (9, 1), (15, 1), (16, 1)],
  term ((-95310464 : Rat) / 385571) [(0, 1), (3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((47655232 : Rat) / 385571) [(0, 1), (3, 2), (9, 1), (15, 1), (16, 1)],
  term ((95310464 : Rat) / 385571) [(0, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-47655232 : Rat) / 385571) [(0, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 16. -/
theorem rs_R005_ueqv_R005NYN_partial_16_0003_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_16_0003
        rs_R005_ueqv_R005NYN_generator_16_0000_0015 =
      rs_R005_ueqv_R005NYN_partial_16_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 16. -/
def rs_R005_ueqv_R005NYN_coefficient_16_0004 : Poly :=
[
  term ((1001600 : Rat) / 52799) [(0, 1), (15, 2)]
]

/-- Partial product 4 for generator 16. -/
def rs_R005_ueqv_R005NYN_partial_16_0004 : Poly :=
[
  term ((2003200 : Rat) / 52799) [(0, 1), (2, 1), (6, 1), (15, 2)],
  term ((-1001600 : Rat) / 52799) [(0, 1), (2, 2), (15, 2)],
  term ((2003200 : Rat) / 52799) [(0, 1), (3, 1), (7, 1), (15, 2)],
  term ((-1001600 : Rat) / 52799) [(0, 1), (3, 2), (15, 2)],
  term ((-2003200 : Rat) / 52799) [(0, 1), (6, 1), (15, 2)],
  term ((1001600 : Rat) / 52799) [(0, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 16. -/
theorem rs_R005_ueqv_R005NYN_partial_16_0004_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_16_0004
        rs_R005_ueqv_R005NYN_generator_16_0000_0015 =
      rs_R005_ueqv_R005NYN_partial_16_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 16. -/
def rs_R005_ueqv_R005NYN_coefficient_16_0005 : Poly :=
[
  term ((3695136 : Rat) / 385571) [(0, 1), (15, 2), (16, 1)]
]

/-- Partial product 5 for generator 16. -/
def rs_R005_ueqv_R005NYN_partial_16_0005 : Poly :=
[
  term ((7390272 : Rat) / 385571) [(0, 1), (2, 1), (6, 1), (15, 2), (16, 1)],
  term ((-3695136 : Rat) / 385571) [(0, 1), (2, 2), (15, 2), (16, 1)],
  term ((7390272 : Rat) / 385571) [(0, 1), (3, 1), (7, 1), (15, 2), (16, 1)],
  term ((-3695136 : Rat) / 385571) [(0, 1), (3, 2), (15, 2), (16, 1)],
  term ((-7390272 : Rat) / 385571) [(0, 1), (6, 1), (15, 2), (16, 1)],
  term ((3695136 : Rat) / 385571) [(0, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 16. -/
theorem rs_R005_ueqv_R005NYN_partial_16_0005_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_16_0005
        rs_R005_ueqv_R005NYN_generator_16_0000_0015 =
      rs_R005_ueqv_R005NYN_partial_16_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 16. -/
def rs_R005_ueqv_R005NYN_coefficient_16_0006 : Poly :=
[
  term ((250400 : Rat) / 52799) [(1, 1), (15, 1)]
]

/-- Partial product 6 for generator 16. -/
def rs_R005_ueqv_R005NYN_partial_16_0006 : Poly :=
[
  term ((500800 : Rat) / 52799) [(1, 1), (2, 1), (6, 1), (15, 1)],
  term ((-250400 : Rat) / 52799) [(1, 1), (2, 2), (15, 1)],
  term ((500800 : Rat) / 52799) [(1, 1), (3, 1), (7, 1), (15, 1)],
  term ((-250400 : Rat) / 52799) [(1, 1), (3, 2), (15, 1)],
  term ((-500800 : Rat) / 52799) [(1, 1), (6, 1), (15, 1)],
  term ((250400 : Rat) / 52799) [(1, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 16. -/
theorem rs_R005_ueqv_R005NYN_partial_16_0006_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_16_0006
        rs_R005_ueqv_R005NYN_generator_16_0000_0015 =
      rs_R005_ueqv_R005NYN_partial_16_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 16. -/
def rs_R005_ueqv_R005NYN_coefficient_16_0007 : Poly :=
[
  term ((923784 : Rat) / 385571) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 7 for generator 16. -/
def rs_R005_ueqv_R005NYN_partial_16_0007 : Poly :=
[
  term ((1847568 : Rat) / 385571) [(1, 1), (2, 1), (6, 1), (15, 1), (16, 1)],
  term ((-923784 : Rat) / 385571) [(1, 1), (2, 2), (15, 1), (16, 1)],
  term ((1847568 : Rat) / 385571) [(1, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((-923784 : Rat) / 385571) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((-1847568 : Rat) / 385571) [(1, 1), (6, 1), (15, 1), (16, 1)],
  term ((923784 : Rat) / 385571) [(1, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 16. -/
theorem rs_R005_ueqv_R005NYN_partial_16_0007_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_16_0007
        rs_R005_ueqv_R005NYN_generator_16_0000_0015 =
      rs_R005_ueqv_R005NYN_partial_16_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 16. -/
def rs_R005_ueqv_R005NYN_coefficient_16_0008 : Poly :=
[
  term ((500800 : Rat) / 52799) [(3, 1), (4, 1), (15, 1)]
]

/-- Partial product 8 for generator 16. -/
def rs_R005_ueqv_R005NYN_partial_16_0008 : Poly :=
[
  term ((1001600 : Rat) / 52799) [(2, 1), (3, 1), (4, 1), (6, 1), (15, 1)],
  term ((-500800 : Rat) / 52799) [(2, 2), (3, 1), (4, 1), (15, 1)],
  term ((-1001600 : Rat) / 52799) [(3, 1), (4, 1), (6, 1), (15, 1)],
  term ((500800 : Rat) / 52799) [(3, 1), (4, 1), (15, 1)],
  term ((1001600 : Rat) / 52799) [(3, 2), (4, 1), (7, 1), (15, 1)],
  term ((-500800 : Rat) / 52799) [(3, 3), (4, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 16. -/
theorem rs_R005_ueqv_R005NYN_partial_16_0008_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_16_0008
        rs_R005_ueqv_R005NYN_generator_16_0000_0015 =
      rs_R005_ueqv_R005NYN_partial_16_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 16. -/
def rs_R005_ueqv_R005NYN_coefficient_16_0009 : Poly :=
[
  term ((1847568 : Rat) / 385571) [(3, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 9 for generator 16. -/
def rs_R005_ueqv_R005NYN_partial_16_0009 : Poly :=
[
  term ((3695136 : Rat) / 385571) [(2, 1), (3, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((-1847568 : Rat) / 385571) [(2, 2), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((-3695136 : Rat) / 385571) [(3, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((1847568 : Rat) / 385571) [(3, 1), (4, 1), (15, 1), (16, 1)],
  term ((3695136 : Rat) / 385571) [(3, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-1847568 : Rat) / 385571) [(3, 3), (4, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 16. -/
theorem rs_R005_ueqv_R005NYN_partial_16_0009_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_16_0009
        rs_R005_ueqv_R005NYN_generator_16_0000_0015 =
      rs_R005_ueqv_R005NYN_partial_16_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 16. -/
def rs_R005_ueqv_R005NYN_coefficient_16_0010 : Poly :=
[
  term ((-6432640 : Rat) / 158397) [(4, 1), (9, 1), (15, 1)]
]

/-- Partial product 10 for generator 16. -/
def rs_R005_ueqv_R005NYN_partial_16_0010 : Poly :=
[
  term ((-12865280 : Rat) / 158397) [(2, 1), (4, 1), (6, 1), (9, 1), (15, 1)],
  term ((6432640 : Rat) / 158397) [(2, 2), (4, 1), (9, 1), (15, 1)],
  term ((-12865280 : Rat) / 158397) [(3, 1), (4, 1), (7, 1), (9, 1), (15, 1)],
  term ((6432640 : Rat) / 158397) [(3, 2), (4, 1), (9, 1), (15, 1)],
  term ((12865280 : Rat) / 158397) [(4, 1), (6, 1), (9, 1), (15, 1)],
  term ((-6432640 : Rat) / 158397) [(4, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 16. -/
theorem rs_R005_ueqv_R005NYN_partial_16_0010_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_16_0010
        rs_R005_ueqv_R005NYN_generator_16_0000_0015 =
      rs_R005_ueqv_R005NYN_partial_16_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 16. -/
def rs_R005_ueqv_R005NYN_coefficient_16_0011 : Poly :=
[
  term ((47655232 : Rat) / 385571) [(4, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 11 for generator 16. -/
def rs_R005_ueqv_R005NYN_partial_16_0011 : Poly :=
[
  term ((95310464 : Rat) / 385571) [(2, 1), (4, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-47655232 : Rat) / 385571) [(2, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((95310464 : Rat) / 385571) [(3, 1), (4, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-47655232 : Rat) / 385571) [(3, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-95310464 : Rat) / 385571) [(4, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((47655232 : Rat) / 385571) [(4, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 16. -/
theorem rs_R005_ueqv_R005NYN_partial_16_0011_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_16_0011
        rs_R005_ueqv_R005NYN_generator_16_0000_0015 =
      rs_R005_ueqv_R005NYN_partial_16_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 16. -/
def rs_R005_ueqv_R005NYN_coefficient_16_0012 : Poly :=
[
  term ((-1001600 : Rat) / 52799) [(4, 1), (15, 2)]
]

/-- Partial product 12 for generator 16. -/
def rs_R005_ueqv_R005NYN_partial_16_0012 : Poly :=
[
  term ((-2003200 : Rat) / 52799) [(2, 1), (4, 1), (6, 1), (15, 2)],
  term ((1001600 : Rat) / 52799) [(2, 2), (4, 1), (15, 2)],
  term ((-2003200 : Rat) / 52799) [(3, 1), (4, 1), (7, 1), (15, 2)],
  term ((1001600 : Rat) / 52799) [(3, 2), (4, 1), (15, 2)],
  term ((2003200 : Rat) / 52799) [(4, 1), (6, 1), (15, 2)],
  term ((-1001600 : Rat) / 52799) [(4, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 16. -/
theorem rs_R005_ueqv_R005NYN_partial_16_0012_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_16_0012
        rs_R005_ueqv_R005NYN_generator_16_0000_0015 =
      rs_R005_ueqv_R005NYN_partial_16_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 16. -/
def rs_R005_ueqv_R005NYN_coefficient_16_0013 : Poly :=
[
  term ((-3695136 : Rat) / 385571) [(4, 1), (15, 2), (16, 1)]
]

/-- Partial product 13 for generator 16. -/
def rs_R005_ueqv_R005NYN_partial_16_0013 : Poly :=
[
  term ((-7390272 : Rat) / 385571) [(2, 1), (4, 1), (6, 1), (15, 2), (16, 1)],
  term ((3695136 : Rat) / 385571) [(2, 2), (4, 1), (15, 2), (16, 1)],
  term ((-7390272 : Rat) / 385571) [(3, 1), (4, 1), (7, 1), (15, 2), (16, 1)],
  term ((3695136 : Rat) / 385571) [(3, 2), (4, 1), (15, 2), (16, 1)],
  term ((7390272 : Rat) / 385571) [(4, 1), (6, 1), (15, 2), (16, 1)],
  term ((-3695136 : Rat) / 385571) [(4, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 16. -/
theorem rs_R005_ueqv_R005NYN_partial_16_0013_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_16_0013
        rs_R005_ueqv_R005NYN_generator_16_0000_0015 =
      rs_R005_ueqv_R005NYN_partial_16_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 16. -/
def rs_R005_ueqv_R005NYN_coefficient_16_0014 : Poly :=
[
  term ((-250400 : Rat) / 52799) [(5, 1), (15, 1)]
]

/-- Partial product 14 for generator 16. -/
def rs_R005_ueqv_R005NYN_partial_16_0014 : Poly :=
[
  term ((-500800 : Rat) / 52799) [(2, 1), (5, 1), (6, 1), (15, 1)],
  term ((250400 : Rat) / 52799) [(2, 2), (5, 1), (15, 1)],
  term ((-500800 : Rat) / 52799) [(3, 1), (5, 1), (7, 1), (15, 1)],
  term ((250400 : Rat) / 52799) [(3, 2), (5, 1), (15, 1)],
  term ((500800 : Rat) / 52799) [(5, 1), (6, 1), (15, 1)],
  term ((-250400 : Rat) / 52799) [(5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 16. -/
theorem rs_R005_ueqv_R005NYN_partial_16_0014_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_16_0014
        rs_R005_ueqv_R005NYN_generator_16_0000_0015 =
      rs_R005_ueqv_R005NYN_partial_16_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 16. -/
def rs_R005_ueqv_R005NYN_coefficient_16_0015 : Poly :=
[
  term ((-923784 : Rat) / 385571) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 15 for generator 16. -/
def rs_R005_ueqv_R005NYN_partial_16_0015 : Poly :=
[
  term ((-1847568 : Rat) / 385571) [(2, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((923784 : Rat) / 385571) [(2, 2), (5, 1), (15, 1), (16, 1)],
  term ((-1847568 : Rat) / 385571) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((923784 : Rat) / 385571) [(3, 2), (5, 1), (15, 1), (16, 1)],
  term ((1847568 : Rat) / 385571) [(5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-923784 : Rat) / 385571) [(5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 16. -/
theorem rs_R005_ueqv_R005NYN_partial_16_0015_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_16_0015
        rs_R005_ueqv_R005NYN_generator_16_0000_0015 =
      rs_R005_ueqv_R005NYN_partial_16_0015 := by
  native_decide

/-- Partial products in this block. -/
def rs_R005_ueqv_R005NYN_partials_16_0000_0015 : List Poly :=
[
  rs_R005_ueqv_R005NYN_partial_16_0000,
  rs_R005_ueqv_R005NYN_partial_16_0001,
  rs_R005_ueqv_R005NYN_partial_16_0002,
  rs_R005_ueqv_R005NYN_partial_16_0003,
  rs_R005_ueqv_R005NYN_partial_16_0004,
  rs_R005_ueqv_R005NYN_partial_16_0005,
  rs_R005_ueqv_R005NYN_partial_16_0006,
  rs_R005_ueqv_R005NYN_partial_16_0007,
  rs_R005_ueqv_R005NYN_partial_16_0008,
  rs_R005_ueqv_R005NYN_partial_16_0009,
  rs_R005_ueqv_R005NYN_partial_16_0010,
  rs_R005_ueqv_R005NYN_partial_16_0011,
  rs_R005_ueqv_R005NYN_partial_16_0012,
  rs_R005_ueqv_R005NYN_partial_16_0013,
  rs_R005_ueqv_R005NYN_partial_16_0014,
  rs_R005_ueqv_R005NYN_partial_16_0015
]

/-- Sum of partial products in this block. -/
def rs_R005_ueqv_R005NYN_block_16_0000_0015 : Poly :=
[
  term ((-1001600 : Rat) / 52799) [(0, 1), (2, 1), (3, 1), (6, 1), (15, 1)],
  term ((-3695136 : Rat) / 385571) [(0, 1), (2, 1), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((12865280 : Rat) / 158397) [(0, 1), (2, 1), (6, 1), (9, 1), (15, 1)],
  term ((-95310464 : Rat) / 385571) [(0, 1), (2, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((2003200 : Rat) / 52799) [(0, 1), (2, 1), (6, 1), (15, 2)],
  term ((7390272 : Rat) / 385571) [(0, 1), (2, 1), (6, 1), (15, 2), (16, 1)],
  term ((500800 : Rat) / 52799) [(0, 1), (2, 2), (3, 1), (15, 1)],
  term ((1847568 : Rat) / 385571) [(0, 1), (2, 2), (3, 1), (15, 1), (16, 1)],
  term ((-6432640 : Rat) / 158397) [(0, 1), (2, 2), (9, 1), (15, 1)],
  term ((47655232 : Rat) / 385571) [(0, 1), (2, 2), (9, 1), (15, 1), (16, 1)],
  term ((-1001600 : Rat) / 52799) [(0, 1), (2, 2), (15, 2)],
  term ((-3695136 : Rat) / 385571) [(0, 1), (2, 2), (15, 2), (16, 1)],
  term ((1001600 : Rat) / 52799) [(0, 1), (3, 1), (6, 1), (15, 1)],
  term ((3695136 : Rat) / 385571) [(0, 1), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((12865280 : Rat) / 158397) [(0, 1), (3, 1), (7, 1), (9, 1), (15, 1)],
  term ((-95310464 : Rat) / 385571) [(0, 1), (3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((2003200 : Rat) / 52799) [(0, 1), (3, 1), (7, 1), (15, 2)],
  term ((7390272 : Rat) / 385571) [(0, 1), (3, 1), (7, 1), (15, 2), (16, 1)],
  term ((-500800 : Rat) / 52799) [(0, 1), (3, 1), (15, 1)],
  term ((-1847568 : Rat) / 385571) [(0, 1), (3, 1), (15, 1), (16, 1)],
  term ((-1001600 : Rat) / 52799) [(0, 1), (3, 2), (7, 1), (15, 1)],
  term ((-3695136 : Rat) / 385571) [(0, 1), (3, 2), (7, 1), (15, 1), (16, 1)],
  term ((-6432640 : Rat) / 158397) [(0, 1), (3, 2), (9, 1), (15, 1)],
  term ((47655232 : Rat) / 385571) [(0, 1), (3, 2), (9, 1), (15, 1), (16, 1)],
  term ((-1001600 : Rat) / 52799) [(0, 1), (3, 2), (15, 2)],
  term ((-3695136 : Rat) / 385571) [(0, 1), (3, 2), (15, 2), (16, 1)],
  term ((500800 : Rat) / 52799) [(0, 1), (3, 3), (15, 1)],
  term ((1847568 : Rat) / 385571) [(0, 1), (3, 3), (15, 1), (16, 1)],
  term ((-12865280 : Rat) / 158397) [(0, 1), (6, 1), (9, 1), (15, 1)],
  term ((95310464 : Rat) / 385571) [(0, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-2003200 : Rat) / 52799) [(0, 1), (6, 1), (15, 2)],
  term ((-7390272 : Rat) / 385571) [(0, 1), (6, 1), (15, 2), (16, 1)],
  term ((6432640 : Rat) / 158397) [(0, 1), (9, 1), (15, 1)],
  term ((-47655232 : Rat) / 385571) [(0, 1), (9, 1), (15, 1), (16, 1)],
  term ((1001600 : Rat) / 52799) [(0, 1), (15, 2)],
  term ((3695136 : Rat) / 385571) [(0, 1), (15, 2), (16, 1)],
  term ((500800 : Rat) / 52799) [(1, 1), (2, 1), (6, 1), (15, 1)],
  term ((1847568 : Rat) / 385571) [(1, 1), (2, 1), (6, 1), (15, 1), (16, 1)],
  term ((-250400 : Rat) / 52799) [(1, 1), (2, 2), (15, 1)],
  term ((-923784 : Rat) / 385571) [(1, 1), (2, 2), (15, 1), (16, 1)],
  term ((500800 : Rat) / 52799) [(1, 1), (3, 1), (7, 1), (15, 1)],
  term ((1847568 : Rat) / 385571) [(1, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((-250400 : Rat) / 52799) [(1, 1), (3, 2), (15, 1)],
  term ((-923784 : Rat) / 385571) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((-500800 : Rat) / 52799) [(1, 1), (6, 1), (15, 1)],
  term ((-1847568 : Rat) / 385571) [(1, 1), (6, 1), (15, 1), (16, 1)],
  term ((250400 : Rat) / 52799) [(1, 1), (15, 1)],
  term ((923784 : Rat) / 385571) [(1, 1), (15, 1), (16, 1)],
  term ((1001600 : Rat) / 52799) [(2, 1), (3, 1), (4, 1), (6, 1), (15, 1)],
  term ((3695136 : Rat) / 385571) [(2, 1), (3, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((-12865280 : Rat) / 158397) [(2, 1), (4, 1), (6, 1), (9, 1), (15, 1)],
  term ((95310464 : Rat) / 385571) [(2, 1), (4, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-2003200 : Rat) / 52799) [(2, 1), (4, 1), (6, 1), (15, 2)],
  term ((-7390272 : Rat) / 385571) [(2, 1), (4, 1), (6, 1), (15, 2), (16, 1)],
  term ((-500800 : Rat) / 52799) [(2, 1), (5, 1), (6, 1), (15, 1)],
  term ((-1847568 : Rat) / 385571) [(2, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-500800 : Rat) / 52799) [(2, 2), (3, 1), (4, 1), (15, 1)],
  term ((-1847568 : Rat) / 385571) [(2, 2), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((6432640 : Rat) / 158397) [(2, 2), (4, 1), (9, 1), (15, 1)],
  term ((-47655232 : Rat) / 385571) [(2, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((1001600 : Rat) / 52799) [(2, 2), (4, 1), (15, 2)],
  term ((3695136 : Rat) / 385571) [(2, 2), (4, 1), (15, 2), (16, 1)],
  term ((250400 : Rat) / 52799) [(2, 2), (5, 1), (15, 1)],
  term ((923784 : Rat) / 385571) [(2, 2), (5, 1), (15, 1), (16, 1)],
  term ((-1001600 : Rat) / 52799) [(3, 1), (4, 1), (6, 1), (15, 1)],
  term ((-3695136 : Rat) / 385571) [(3, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((-12865280 : Rat) / 158397) [(3, 1), (4, 1), (7, 1), (9, 1), (15, 1)],
  term ((95310464 : Rat) / 385571) [(3, 1), (4, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-2003200 : Rat) / 52799) [(3, 1), (4, 1), (7, 1), (15, 2)],
  term ((-7390272 : Rat) / 385571) [(3, 1), (4, 1), (7, 1), (15, 2), (16, 1)],
  term ((500800 : Rat) / 52799) [(3, 1), (4, 1), (15, 1)],
  term ((1847568 : Rat) / 385571) [(3, 1), (4, 1), (15, 1), (16, 1)],
  term ((-500800 : Rat) / 52799) [(3, 1), (5, 1), (7, 1), (15, 1)],
  term ((-1847568 : Rat) / 385571) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((1001600 : Rat) / 52799) [(3, 2), (4, 1), (7, 1), (15, 1)],
  term ((3695136 : Rat) / 385571) [(3, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((6432640 : Rat) / 158397) [(3, 2), (4, 1), (9, 1), (15, 1)],
  term ((-47655232 : Rat) / 385571) [(3, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((1001600 : Rat) / 52799) [(3, 2), (4, 1), (15, 2)],
  term ((3695136 : Rat) / 385571) [(3, 2), (4, 1), (15, 2), (16, 1)],
  term ((250400 : Rat) / 52799) [(3, 2), (5, 1), (15, 1)],
  term ((923784 : Rat) / 385571) [(3, 2), (5, 1), (15, 1), (16, 1)],
  term ((-500800 : Rat) / 52799) [(3, 3), (4, 1), (15, 1)],
  term ((-1847568 : Rat) / 385571) [(3, 3), (4, 1), (15, 1), (16, 1)],
  term ((12865280 : Rat) / 158397) [(4, 1), (6, 1), (9, 1), (15, 1)],
  term ((-95310464 : Rat) / 385571) [(4, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((2003200 : Rat) / 52799) [(4, 1), (6, 1), (15, 2)],
  term ((7390272 : Rat) / 385571) [(4, 1), (6, 1), (15, 2), (16, 1)],
  term ((-6432640 : Rat) / 158397) [(4, 1), (9, 1), (15, 1)],
  term ((47655232 : Rat) / 385571) [(4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1001600 : Rat) / 52799) [(4, 1), (15, 2)],
  term ((-3695136 : Rat) / 385571) [(4, 1), (15, 2), (16, 1)],
  term ((500800 : Rat) / 52799) [(5, 1), (6, 1), (15, 1)],
  term ((1847568 : Rat) / 385571) [(5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-250400 : Rat) / 52799) [(5, 1), (15, 1)],
  term ((-923784 : Rat) / 385571) [(5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 16, terms 0 through 15. -/
theorem rs_R005_ueqv_R005NYN_block_16_0000_0015_valid :
    checkProductSumEq rs_R005_ueqv_R005NYN_partials_16_0000_0015
      rs_R005_ueqv_R005NYN_block_16_0000_0015 = true := by
  native_decide

end R005UeqvR005NYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
