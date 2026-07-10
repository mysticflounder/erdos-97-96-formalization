/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R005:u=v:R005NYN, term block 7:0-15

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R005UeqvR005NYNTermShards

/-- Generator polynomial 7 for relaxed split surplus certificate `R005:u=v:R005NYN`. -/
def rs_R005_ueqv_R005NYN_generator_07_0000_0015 : Poly :=
[
  term (-2 : Rat) [(0, 1), (4, 1)],
  term (2 : Rat) [(0, 1), (6, 1)],
  term (-2 : Rat) [(1, 1), (5, 1)],
  term (2 : Rat) [(1, 1), (7, 1)],
  term (1 : Rat) [(4, 2)],
  term (1 : Rat) [(5, 2)],
  term (-1 : Rat) [(6, 2)],
  term (-1 : Rat) [(7, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 7. -/
def rs_R005_ueqv_R005NYN_coefficient_07_0000 : Poly :=
[
  term ((-250400 : Rat) / 52799) [(3, 1), (15, 1)]
]

/-- Partial product 0 for generator 7. -/
def rs_R005_ueqv_R005NYN_partial_07_0000 : Poly :=
[
  term ((500800 : Rat) / 52799) [(0, 1), (3, 1), (4, 1), (15, 1)],
  term ((-500800 : Rat) / 52799) [(0, 1), (3, 1), (6, 1), (15, 1)],
  term ((500800 : Rat) / 52799) [(1, 1), (3, 1), (5, 1), (15, 1)],
  term ((-500800 : Rat) / 52799) [(1, 1), (3, 1), (7, 1), (15, 1)],
  term ((-250400 : Rat) / 52799) [(3, 1), (4, 2), (15, 1)],
  term ((-250400 : Rat) / 52799) [(3, 1), (5, 2), (15, 1)],
  term ((250400 : Rat) / 52799) [(3, 1), (6, 2), (15, 1)],
  term ((250400 : Rat) / 52799) [(3, 1), (7, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 7. -/
theorem rs_R005_ueqv_R005NYN_partial_07_0000_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_07_0000
        rs_R005_ueqv_R005NYN_generator_07_0000_0015 =
      rs_R005_ueqv_R005NYN_partial_07_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 7. -/
def rs_R005_ueqv_R005NYN_coefficient_07_0001 : Poly :=
[
  term ((-923784 : Rat) / 385571) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 1 for generator 7. -/
def rs_R005_ueqv_R005NYN_partial_07_0001 : Poly :=
[
  term ((1847568 : Rat) / 385571) [(0, 1), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((-1847568 : Rat) / 385571) [(0, 1), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((1847568 : Rat) / 385571) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((-1847568 : Rat) / 385571) [(1, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((-923784 : Rat) / 385571) [(3, 1), (4, 2), (15, 1), (16, 1)],
  term ((-923784 : Rat) / 385571) [(3, 1), (5, 2), (15, 1), (16, 1)],
  term ((923784 : Rat) / 385571) [(3, 1), (6, 2), (15, 1), (16, 1)],
  term ((923784 : Rat) / 385571) [(3, 1), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 7. -/
theorem rs_R005_ueqv_R005NYN_partial_07_0001_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_07_0001
        rs_R005_ueqv_R005NYN_generator_07_0000_0015 =
      rs_R005_ueqv_R005NYN_partial_07_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 7. -/
def rs_R005_ueqv_R005NYN_coefficient_07_0002 : Poly :=
[
  term ((4718720 : Rat) / 158397) [(5, 1), (14, 1), (15, 1)]
]

/-- Partial product 2 for generator 7. -/
def rs_R005_ueqv_R005NYN_partial_07_0002 : Poly :=
[
  term ((-9437440 : Rat) / 158397) [(0, 1), (4, 1), (5, 1), (14, 1), (15, 1)],
  term ((9437440 : Rat) / 158397) [(0, 1), (5, 1), (6, 1), (14, 1), (15, 1)],
  term ((9437440 : Rat) / 158397) [(1, 1), (5, 1), (7, 1), (14, 1), (15, 1)],
  term ((-9437440 : Rat) / 158397) [(1, 1), (5, 2), (14, 1), (15, 1)],
  term ((4718720 : Rat) / 158397) [(4, 2), (5, 1), (14, 1), (15, 1)],
  term ((-4718720 : Rat) / 158397) [(5, 1), (6, 2), (14, 1), (15, 1)],
  term ((-4718720 : Rat) / 158397) [(5, 1), (7, 2), (14, 1), (15, 1)],
  term ((4718720 : Rat) / 158397) [(5, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 7. -/
theorem rs_R005_ueqv_R005NYN_partial_07_0002_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_07_0002
        rs_R005_ueqv_R005NYN_generator_07_0000_0015 =
      rs_R005_ueqv_R005NYN_partial_07_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 7. -/
def rs_R005_ueqv_R005NYN_coefficient_07_0003 : Poly :=
[
  term ((-21980048 : Rat) / 385571) [(5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 3 for generator 7. -/
def rs_R005_ueqv_R005NYN_partial_07_0003 : Poly :=
[
  term ((43960096 : Rat) / 385571) [(0, 1), (4, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-43960096 : Rat) / 385571) [(0, 1), (5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-43960096 : Rat) / 385571) [(1, 1), (5, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((43960096 : Rat) / 385571) [(1, 1), (5, 2), (14, 1), (15, 1), (16, 1)],
  term ((-21980048 : Rat) / 385571) [(4, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((21980048 : Rat) / 385571) [(5, 1), (6, 2), (14, 1), (15, 1), (16, 1)],
  term ((21980048 : Rat) / 385571) [(5, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((-21980048 : Rat) / 385571) [(5, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 7. -/
theorem rs_R005_ueqv_R005NYN_partial_07_0003_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_07_0003
        rs_R005_ueqv_R005NYN_generator_07_0000_0015 =
      rs_R005_ueqv_R005NYN_partial_07_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 7. -/
def rs_R005_ueqv_R005NYN_coefficient_07_0004 : Poly :=
[
  term ((-2359360 : Rat) / 52799) [(5, 1), (15, 1)]
]

/-- Partial product 4 for generator 7. -/
def rs_R005_ueqv_R005NYN_partial_07_0004 : Poly :=
[
  term ((4718720 : Rat) / 52799) [(0, 1), (4, 1), (5, 1), (15, 1)],
  term ((-4718720 : Rat) / 52799) [(0, 1), (5, 1), (6, 1), (15, 1)],
  term ((-4718720 : Rat) / 52799) [(1, 1), (5, 1), (7, 1), (15, 1)],
  term ((4718720 : Rat) / 52799) [(1, 1), (5, 2), (15, 1)],
  term ((-2359360 : Rat) / 52799) [(4, 2), (5, 1), (15, 1)],
  term ((2359360 : Rat) / 52799) [(5, 1), (6, 2), (15, 1)],
  term ((2359360 : Rat) / 52799) [(5, 1), (7, 2), (15, 1)],
  term ((-2359360 : Rat) / 52799) [(5, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 7. -/
theorem rs_R005_ueqv_R005NYN_partial_07_0004_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_07_0004
        rs_R005_ueqv_R005NYN_generator_07_0000_0015 =
      rs_R005_ueqv_R005NYN_partial_07_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 7. -/
def rs_R005_ueqv_R005NYN_coefficient_07_0005 : Poly :=
[
  term ((32970072 : Rat) / 385571) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 5 for generator 7. -/
def rs_R005_ueqv_R005NYN_partial_07_0005 : Poly :=
[
  term ((-65940144 : Rat) / 385571) [(0, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((65940144 : Rat) / 385571) [(0, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((65940144 : Rat) / 385571) [(1, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-65940144 : Rat) / 385571) [(1, 1), (5, 2), (15, 1), (16, 1)],
  term ((32970072 : Rat) / 385571) [(4, 2), (5, 1), (15, 1), (16, 1)],
  term ((-32970072 : Rat) / 385571) [(5, 1), (6, 2), (15, 1), (16, 1)],
  term ((-32970072 : Rat) / 385571) [(5, 1), (7, 2), (15, 1), (16, 1)],
  term ((32970072 : Rat) / 385571) [(5, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 7. -/
theorem rs_R005_ueqv_R005NYN_partial_07_0005_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_07_0005
        rs_R005_ueqv_R005NYN_generator_07_0000_0015 =
      rs_R005_ueqv_R005NYN_partial_07_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 7. -/
def rs_R005_ueqv_R005NYN_coefficient_07_0006 : Poly :=
[
  term ((6432640 : Rat) / 158397) [(8, 1), (9, 1), (15, 1)]
]

/-- Partial product 6 for generator 7. -/
def rs_R005_ueqv_R005NYN_partial_07_0006 : Poly :=
[
  term ((-12865280 : Rat) / 158397) [(0, 1), (4, 1), (8, 1), (9, 1), (15, 1)],
  term ((12865280 : Rat) / 158397) [(0, 1), (6, 1), (8, 1), (9, 1), (15, 1)],
  term ((-12865280 : Rat) / 158397) [(1, 1), (5, 1), (8, 1), (9, 1), (15, 1)],
  term ((12865280 : Rat) / 158397) [(1, 1), (7, 1), (8, 1), (9, 1), (15, 1)],
  term ((6432640 : Rat) / 158397) [(4, 2), (8, 1), (9, 1), (15, 1)],
  term ((6432640 : Rat) / 158397) [(5, 2), (8, 1), (9, 1), (15, 1)],
  term ((-6432640 : Rat) / 158397) [(6, 2), (8, 1), (9, 1), (15, 1)],
  term ((-6432640 : Rat) / 158397) [(7, 2), (8, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 7. -/
theorem rs_R005_ueqv_R005NYN_partial_07_0006_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_07_0006
        rs_R005_ueqv_R005NYN_generator_07_0000_0015 =
      rs_R005_ueqv_R005NYN_partial_07_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 7. -/
def rs_R005_ueqv_R005NYN_coefficient_07_0007 : Poly :=
[
  term ((-47655232 : Rat) / 385571) [(8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 7 for generator 7. -/
def rs_R005_ueqv_R005NYN_partial_07_0007 : Poly :=
[
  term ((95310464 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-95310464 : Rat) / 385571) [(0, 1), (6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((95310464 : Rat) / 385571) [(1, 1), (5, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-95310464 : Rat) / 385571) [(1, 1), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-47655232 : Rat) / 385571) [(4, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-47655232 : Rat) / 385571) [(5, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((47655232 : Rat) / 385571) [(6, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((47655232 : Rat) / 385571) [(7, 2), (8, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 7. -/
theorem rs_R005_ueqv_R005NYN_partial_07_0007_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_07_0007
        rs_R005_ueqv_R005NYN_generator_07_0000_0015 =
      rs_R005_ueqv_R005NYN_partial_07_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 7. -/
def rs_R005_ueqv_R005NYN_coefficient_07_0008 : Poly :=
[
  term ((322720 : Rat) / 158397) [(9, 1), (15, 1)]
]

/-- Partial product 8 for generator 7. -/
def rs_R005_ueqv_R005NYN_partial_07_0008 : Poly :=
[
  term ((-645440 : Rat) / 158397) [(0, 1), (4, 1), (9, 1), (15, 1)],
  term ((645440 : Rat) / 158397) [(0, 1), (6, 1), (9, 1), (15, 1)],
  term ((-645440 : Rat) / 158397) [(1, 1), (5, 1), (9, 1), (15, 1)],
  term ((645440 : Rat) / 158397) [(1, 1), (7, 1), (9, 1), (15, 1)],
  term ((322720 : Rat) / 158397) [(4, 2), (9, 1), (15, 1)],
  term ((322720 : Rat) / 158397) [(5, 2), (9, 1), (15, 1)],
  term ((-322720 : Rat) / 158397) [(6, 2), (9, 1), (15, 1)],
  term ((-322720 : Rat) / 158397) [(7, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 7. -/
theorem rs_R005_ueqv_R005NYN_partial_07_0008_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_07_0008
        rs_R005_ueqv_R005NYN_generator_07_0000_0015 =
      rs_R005_ueqv_R005NYN_partial_07_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 7. -/
def rs_R005_ueqv_R005NYN_coefficient_07_0009 : Poly :=
[
  term ((7342580 : Rat) / 385571) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 9 for generator 7. -/
def rs_R005_ueqv_R005NYN_partial_07_0009 : Poly :=
[
  term ((-14685160 : Rat) / 385571) [(0, 1), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((14685160 : Rat) / 385571) [(0, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-14685160 : Rat) / 385571) [(1, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((14685160 : Rat) / 385571) [(1, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((7342580 : Rat) / 385571) [(4, 2), (9, 1), (15, 1), (16, 1)],
  term ((7342580 : Rat) / 385571) [(5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-7342580 : Rat) / 385571) [(6, 2), (9, 1), (15, 1), (16, 1)],
  term ((-7342580 : Rat) / 385571) [(7, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 7. -/
theorem rs_R005_ueqv_R005NYN_partial_07_0009_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_07_0009
        rs_R005_ueqv_R005NYN_generator_07_0000_0015 =
      rs_R005_ueqv_R005NYN_partial_07_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 7. -/
def rs_R005_ueqv_R005NYN_coefficient_07_0010 : Poly :=
[
  term ((-678880 : Rat) / 52799) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 10 for generator 7. -/
def rs_R005_ueqv_R005NYN_partial_07_0010 : Poly :=
[
  term ((1357760 : Rat) / 52799) [(0, 1), (4, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1357760 : Rat) / 52799) [(0, 1), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((1357760 : Rat) / 52799) [(1, 1), (5, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1357760 : Rat) / 52799) [(1, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((-678880 : Rat) / 52799) [(4, 2), (13, 1), (14, 1), (15, 1)],
  term ((-678880 : Rat) / 52799) [(5, 2), (13, 1), (14, 1), (15, 1)],
  term ((678880 : Rat) / 52799) [(6, 2), (13, 1), (14, 1), (15, 1)],
  term ((678880 : Rat) / 52799) [(7, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 7. -/
theorem rs_R005_ueqv_R005NYN_partial_07_0010_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_07_0010
        rs_R005_ueqv_R005NYN_generator_07_0000_0015 =
      rs_R005_ueqv_R005NYN_partial_07_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 7. -/
def rs_R005_ueqv_R005NYN_coefficient_07_0011 : Poly :=
[
  term ((18332604 : Rat) / 385571) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 11 for generator 7. -/
def rs_R005_ueqv_R005NYN_partial_07_0011 : Poly :=
[
  term ((-36665208 : Rat) / 385571) [(0, 1), (4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((36665208 : Rat) / 385571) [(0, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-36665208 : Rat) / 385571) [(1, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((36665208 : Rat) / 385571) [(1, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((18332604 : Rat) / 385571) [(4, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((18332604 : Rat) / 385571) [(5, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-18332604 : Rat) / 385571) [(6, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-18332604 : Rat) / 385571) [(7, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 7. -/
theorem rs_R005_ueqv_R005NYN_partial_07_0011_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_07_0011
        rs_R005_ueqv_R005NYN_generator_07_0000_0015 =
      rs_R005_ueqv_R005NYN_partial_07_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 7. -/
def rs_R005_ueqv_R005NYN_coefficient_07_0012 : Poly :=
[
  term ((1018320 : Rat) / 52799) [(13, 1), (15, 1)]
]

/-- Partial product 12 for generator 7. -/
def rs_R005_ueqv_R005NYN_partial_07_0012 : Poly :=
[
  term ((-2036640 : Rat) / 52799) [(0, 1), (4, 1), (13, 1), (15, 1)],
  term ((2036640 : Rat) / 52799) [(0, 1), (6, 1), (13, 1), (15, 1)],
  term ((-2036640 : Rat) / 52799) [(1, 1), (5, 1), (13, 1), (15, 1)],
  term ((2036640 : Rat) / 52799) [(1, 1), (7, 1), (13, 1), (15, 1)],
  term ((1018320 : Rat) / 52799) [(4, 2), (13, 1), (15, 1)],
  term ((1018320 : Rat) / 52799) [(5, 2), (13, 1), (15, 1)],
  term ((-1018320 : Rat) / 52799) [(6, 2), (13, 1), (15, 1)],
  term ((-1018320 : Rat) / 52799) [(7, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 7. -/
theorem rs_R005_ueqv_R005NYN_partial_07_0012_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_07_0012
        rs_R005_ueqv_R005NYN_generator_07_0000_0015 =
      rs_R005_ueqv_R005NYN_partial_07_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 7. -/
def rs_R005_ueqv_R005NYN_coefficient_07_0013 : Poly :=
[
  term ((-27498906 : Rat) / 385571) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 13 for generator 7. -/
def rs_R005_ueqv_R005NYN_partial_07_0013 : Poly :=
[
  term ((54997812 : Rat) / 385571) [(0, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-54997812 : Rat) / 385571) [(0, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((54997812 : Rat) / 385571) [(1, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-54997812 : Rat) / 385571) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-27498906 : Rat) / 385571) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term ((-27498906 : Rat) / 385571) [(5, 2), (13, 1), (15, 1), (16, 1)],
  term ((27498906 : Rat) / 385571) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((27498906 : Rat) / 385571) [(7, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 7. -/
theorem rs_R005_ueqv_R005NYN_partial_07_0013_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_07_0013
        rs_R005_ueqv_R005NYN_generator_07_0000_0015 =
      rs_R005_ueqv_R005NYN_partial_07_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 7. -/
def rs_R005_ueqv_R005NYN_coefficient_07_0014 : Poly :=
[
  term ((-105760 : Rat) / 158397) [(15, 2)]
]

/-- Partial product 14 for generator 7. -/
def rs_R005_ueqv_R005NYN_partial_07_0014 : Poly :=
[
  term ((211520 : Rat) / 158397) [(0, 1), (4, 1), (15, 2)],
  term ((-211520 : Rat) / 158397) [(0, 1), (6, 1), (15, 2)],
  term ((211520 : Rat) / 158397) [(1, 1), (5, 1), (15, 2)],
  term ((-211520 : Rat) / 158397) [(1, 1), (7, 1), (15, 2)],
  term ((-105760 : Rat) / 158397) [(4, 2), (15, 2)],
  term ((-105760 : Rat) / 158397) [(5, 2), (15, 2)],
  term ((105760 : Rat) / 158397) [(6, 2), (15, 2)],
  term ((105760 : Rat) / 158397) [(7, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 7. -/
theorem rs_R005_ueqv_R005NYN_partial_07_0014_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_07_0014
        rs_R005_ueqv_R005NYN_generator_07_0000_0015 =
      rs_R005_ueqv_R005NYN_partial_07_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 7. -/
def rs_R005_ueqv_R005NYN_coefficient_07_0015 : Poly :=
[
  term ((13761376 : Rat) / 385571) [(15, 2), (16, 1)]
]

/-- Partial product 15 for generator 7. -/
def rs_R005_ueqv_R005NYN_partial_07_0015 : Poly :=
[
  term ((-27522752 : Rat) / 385571) [(0, 1), (4, 1), (15, 2), (16, 1)],
  term ((27522752 : Rat) / 385571) [(0, 1), (6, 1), (15, 2), (16, 1)],
  term ((-27522752 : Rat) / 385571) [(1, 1), (5, 1), (15, 2), (16, 1)],
  term ((27522752 : Rat) / 385571) [(1, 1), (7, 1), (15, 2), (16, 1)],
  term ((13761376 : Rat) / 385571) [(4, 2), (15, 2), (16, 1)],
  term ((13761376 : Rat) / 385571) [(5, 2), (15, 2), (16, 1)],
  term ((-13761376 : Rat) / 385571) [(6, 2), (15, 2), (16, 1)],
  term ((-13761376 : Rat) / 385571) [(7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 7. -/
theorem rs_R005_ueqv_R005NYN_partial_07_0015_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_07_0015
        rs_R005_ueqv_R005NYN_generator_07_0000_0015 =
      rs_R005_ueqv_R005NYN_partial_07_0015 := by
  native_decide

/-- Partial products in this block. -/
def rs_R005_ueqv_R005NYN_partials_07_0000_0015 : List Poly :=
[
  rs_R005_ueqv_R005NYN_partial_07_0000,
  rs_R005_ueqv_R005NYN_partial_07_0001,
  rs_R005_ueqv_R005NYN_partial_07_0002,
  rs_R005_ueqv_R005NYN_partial_07_0003,
  rs_R005_ueqv_R005NYN_partial_07_0004,
  rs_R005_ueqv_R005NYN_partial_07_0005,
  rs_R005_ueqv_R005NYN_partial_07_0006,
  rs_R005_ueqv_R005NYN_partial_07_0007,
  rs_R005_ueqv_R005NYN_partial_07_0008,
  rs_R005_ueqv_R005NYN_partial_07_0009,
  rs_R005_ueqv_R005NYN_partial_07_0010,
  rs_R005_ueqv_R005NYN_partial_07_0011,
  rs_R005_ueqv_R005NYN_partial_07_0012,
  rs_R005_ueqv_R005NYN_partial_07_0013,
  rs_R005_ueqv_R005NYN_partial_07_0014,
  rs_R005_ueqv_R005NYN_partial_07_0015
]

/-- Sum of partial products in this block. -/
def rs_R005_ueqv_R005NYN_block_07_0000_0015 : Poly :=
[
  term ((500800 : Rat) / 52799) [(0, 1), (3, 1), (4, 1), (15, 1)],
  term ((1847568 : Rat) / 385571) [(0, 1), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((-500800 : Rat) / 52799) [(0, 1), (3, 1), (6, 1), (15, 1)],
  term ((-1847568 : Rat) / 385571) [(0, 1), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-9437440 : Rat) / 158397) [(0, 1), (4, 1), (5, 1), (14, 1), (15, 1)],
  term ((43960096 : Rat) / 385571) [(0, 1), (4, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((4718720 : Rat) / 52799) [(0, 1), (4, 1), (5, 1), (15, 1)],
  term ((-65940144 : Rat) / 385571) [(0, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-12865280 : Rat) / 158397) [(0, 1), (4, 1), (8, 1), (9, 1), (15, 1)],
  term ((95310464 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-645440 : Rat) / 158397) [(0, 1), (4, 1), (9, 1), (15, 1)],
  term ((-14685160 : Rat) / 385571) [(0, 1), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((1357760 : Rat) / 52799) [(0, 1), (4, 1), (13, 1), (14, 1), (15, 1)],
  term ((-36665208 : Rat) / 385571) [(0, 1), (4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2036640 : Rat) / 52799) [(0, 1), (4, 1), (13, 1), (15, 1)],
  term ((54997812 : Rat) / 385571) [(0, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((211520 : Rat) / 158397) [(0, 1), (4, 1), (15, 2)],
  term ((-27522752 : Rat) / 385571) [(0, 1), (4, 1), (15, 2), (16, 1)],
  term ((9437440 : Rat) / 158397) [(0, 1), (5, 1), (6, 1), (14, 1), (15, 1)],
  term ((-43960096 : Rat) / 385571) [(0, 1), (5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4718720 : Rat) / 52799) [(0, 1), (5, 1), (6, 1), (15, 1)],
  term ((65940144 : Rat) / 385571) [(0, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((12865280 : Rat) / 158397) [(0, 1), (6, 1), (8, 1), (9, 1), (15, 1)],
  term ((-95310464 : Rat) / 385571) [(0, 1), (6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((645440 : Rat) / 158397) [(0, 1), (6, 1), (9, 1), (15, 1)],
  term ((14685160 : Rat) / 385571) [(0, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1357760 : Rat) / 52799) [(0, 1), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((36665208 : Rat) / 385571) [(0, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2036640 : Rat) / 52799) [(0, 1), (6, 1), (13, 1), (15, 1)],
  term ((-54997812 : Rat) / 385571) [(0, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-211520 : Rat) / 158397) [(0, 1), (6, 1), (15, 2)],
  term ((27522752 : Rat) / 385571) [(0, 1), (6, 1), (15, 2), (16, 1)],
  term ((500800 : Rat) / 52799) [(1, 1), (3, 1), (5, 1), (15, 1)],
  term ((1847568 : Rat) / 385571) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((-500800 : Rat) / 52799) [(1, 1), (3, 1), (7, 1), (15, 1)],
  term ((-1847568 : Rat) / 385571) [(1, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((9437440 : Rat) / 158397) [(1, 1), (5, 1), (7, 1), (14, 1), (15, 1)],
  term ((-43960096 : Rat) / 385571) [(1, 1), (5, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4718720 : Rat) / 52799) [(1, 1), (5, 1), (7, 1), (15, 1)],
  term ((65940144 : Rat) / 385571) [(1, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-12865280 : Rat) / 158397) [(1, 1), (5, 1), (8, 1), (9, 1), (15, 1)],
  term ((95310464 : Rat) / 385571) [(1, 1), (5, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-645440 : Rat) / 158397) [(1, 1), (5, 1), (9, 1), (15, 1)],
  term ((-14685160 : Rat) / 385571) [(1, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((1357760 : Rat) / 52799) [(1, 1), (5, 1), (13, 1), (14, 1), (15, 1)],
  term ((-36665208 : Rat) / 385571) [(1, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2036640 : Rat) / 52799) [(1, 1), (5, 1), (13, 1), (15, 1)],
  term ((54997812 : Rat) / 385571) [(1, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((211520 : Rat) / 158397) [(1, 1), (5, 1), (15, 2)],
  term ((-27522752 : Rat) / 385571) [(1, 1), (5, 1), (15, 2), (16, 1)],
  term ((-9437440 : Rat) / 158397) [(1, 1), (5, 2), (14, 1), (15, 1)],
  term ((43960096 : Rat) / 385571) [(1, 1), (5, 2), (14, 1), (15, 1), (16, 1)],
  term ((4718720 : Rat) / 52799) [(1, 1), (5, 2), (15, 1)],
  term ((-65940144 : Rat) / 385571) [(1, 1), (5, 2), (15, 1), (16, 1)],
  term ((12865280 : Rat) / 158397) [(1, 1), (7, 1), (8, 1), (9, 1), (15, 1)],
  term ((-95310464 : Rat) / 385571) [(1, 1), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((645440 : Rat) / 158397) [(1, 1), (7, 1), (9, 1), (15, 1)],
  term ((14685160 : Rat) / 385571) [(1, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1357760 : Rat) / 52799) [(1, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((36665208 : Rat) / 385571) [(1, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2036640 : Rat) / 52799) [(1, 1), (7, 1), (13, 1), (15, 1)],
  term ((-54997812 : Rat) / 385571) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-211520 : Rat) / 158397) [(1, 1), (7, 1), (15, 2)],
  term ((27522752 : Rat) / 385571) [(1, 1), (7, 1), (15, 2), (16, 1)],
  term ((-250400 : Rat) / 52799) [(3, 1), (4, 2), (15, 1)],
  term ((-923784 : Rat) / 385571) [(3, 1), (4, 2), (15, 1), (16, 1)],
  term ((-250400 : Rat) / 52799) [(3, 1), (5, 2), (15, 1)],
  term ((-923784 : Rat) / 385571) [(3, 1), (5, 2), (15, 1), (16, 1)],
  term ((250400 : Rat) / 52799) [(3, 1), (6, 2), (15, 1)],
  term ((923784 : Rat) / 385571) [(3, 1), (6, 2), (15, 1), (16, 1)],
  term ((250400 : Rat) / 52799) [(3, 1), (7, 2), (15, 1)],
  term ((923784 : Rat) / 385571) [(3, 1), (7, 2), (15, 1), (16, 1)],
  term ((4718720 : Rat) / 158397) [(4, 2), (5, 1), (14, 1), (15, 1)],
  term ((-21980048 : Rat) / 385571) [(4, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2359360 : Rat) / 52799) [(4, 2), (5, 1), (15, 1)],
  term ((32970072 : Rat) / 385571) [(4, 2), (5, 1), (15, 1), (16, 1)],
  term ((6432640 : Rat) / 158397) [(4, 2), (8, 1), (9, 1), (15, 1)],
  term ((-47655232 : Rat) / 385571) [(4, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((322720 : Rat) / 158397) [(4, 2), (9, 1), (15, 1)],
  term ((7342580 : Rat) / 385571) [(4, 2), (9, 1), (15, 1), (16, 1)],
  term ((-678880 : Rat) / 52799) [(4, 2), (13, 1), (14, 1), (15, 1)],
  term ((18332604 : Rat) / 385571) [(4, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1018320 : Rat) / 52799) [(4, 2), (13, 1), (15, 1)],
  term ((-27498906 : Rat) / 385571) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term ((-105760 : Rat) / 158397) [(4, 2), (15, 2)],
  term ((13761376 : Rat) / 385571) [(4, 2), (15, 2), (16, 1)],
  term ((-4718720 : Rat) / 158397) [(5, 1), (6, 2), (14, 1), (15, 1)],
  term ((21980048 : Rat) / 385571) [(5, 1), (6, 2), (14, 1), (15, 1), (16, 1)],
  term ((2359360 : Rat) / 52799) [(5, 1), (6, 2), (15, 1)],
  term ((-32970072 : Rat) / 385571) [(5, 1), (6, 2), (15, 1), (16, 1)],
  term ((-4718720 : Rat) / 158397) [(5, 1), (7, 2), (14, 1), (15, 1)],
  term ((21980048 : Rat) / 385571) [(5, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((2359360 : Rat) / 52799) [(5, 1), (7, 2), (15, 1)],
  term ((-32970072 : Rat) / 385571) [(5, 1), (7, 2), (15, 1), (16, 1)],
  term ((6432640 : Rat) / 158397) [(5, 2), (8, 1), (9, 1), (15, 1)],
  term ((-47655232 : Rat) / 385571) [(5, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((322720 : Rat) / 158397) [(5, 2), (9, 1), (15, 1)],
  term ((7342580 : Rat) / 385571) [(5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-678880 : Rat) / 52799) [(5, 2), (13, 1), (14, 1), (15, 1)],
  term ((18332604 : Rat) / 385571) [(5, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1018320 : Rat) / 52799) [(5, 2), (13, 1), (15, 1)],
  term ((-27498906 : Rat) / 385571) [(5, 2), (13, 1), (15, 1), (16, 1)],
  term ((-105760 : Rat) / 158397) [(5, 2), (15, 2)],
  term ((13761376 : Rat) / 385571) [(5, 2), (15, 2), (16, 1)],
  term ((4718720 : Rat) / 158397) [(5, 3), (14, 1), (15, 1)],
  term ((-21980048 : Rat) / 385571) [(5, 3), (14, 1), (15, 1), (16, 1)],
  term ((-2359360 : Rat) / 52799) [(5, 3), (15, 1)],
  term ((32970072 : Rat) / 385571) [(5, 3), (15, 1), (16, 1)],
  term ((-6432640 : Rat) / 158397) [(6, 2), (8, 1), (9, 1), (15, 1)],
  term ((47655232 : Rat) / 385571) [(6, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-322720 : Rat) / 158397) [(6, 2), (9, 1), (15, 1)],
  term ((-7342580 : Rat) / 385571) [(6, 2), (9, 1), (15, 1), (16, 1)],
  term ((678880 : Rat) / 52799) [(6, 2), (13, 1), (14, 1), (15, 1)],
  term ((-18332604 : Rat) / 385571) [(6, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1018320 : Rat) / 52799) [(6, 2), (13, 1), (15, 1)],
  term ((27498906 : Rat) / 385571) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((105760 : Rat) / 158397) [(6, 2), (15, 2)],
  term ((-13761376 : Rat) / 385571) [(6, 2), (15, 2), (16, 1)],
  term ((-6432640 : Rat) / 158397) [(7, 2), (8, 1), (9, 1), (15, 1)],
  term ((47655232 : Rat) / 385571) [(7, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-322720 : Rat) / 158397) [(7, 2), (9, 1), (15, 1)],
  term ((-7342580 : Rat) / 385571) [(7, 2), (9, 1), (15, 1), (16, 1)],
  term ((678880 : Rat) / 52799) [(7, 2), (13, 1), (14, 1), (15, 1)],
  term ((-18332604 : Rat) / 385571) [(7, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1018320 : Rat) / 52799) [(7, 2), (13, 1), (15, 1)],
  term ((27498906 : Rat) / 385571) [(7, 2), (13, 1), (15, 1), (16, 1)],
  term ((105760 : Rat) / 158397) [(7, 2), (15, 2)],
  term ((-13761376 : Rat) / 385571) [(7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 7, terms 0 through 15. -/
theorem rs_R005_ueqv_R005NYN_block_07_0000_0015_valid :
    checkProductSumEq rs_R005_ueqv_R005NYN_partials_07_0000_0015
      rs_R005_ueqv_R005NYN_block_07_0000_0015 = true := by
  native_decide

end R005UeqvR005NYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
