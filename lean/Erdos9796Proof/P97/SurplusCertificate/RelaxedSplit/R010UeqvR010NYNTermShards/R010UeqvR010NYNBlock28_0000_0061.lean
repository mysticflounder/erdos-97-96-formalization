/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010NYN, term block 28:0-61

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010NYNTermShards

/-- Generator polynomial 28 for relaxed split surplus certificate `R010:u=v:R010NYN`. -/
def rs_R010_ueqv_R010NYN_generator_28_0000_0061 : Poly :=
[
  term (2 : Rat) [(2, 1), (14, 1)],
  term (-1 : Rat) [(2, 2)],
  term (2 : Rat) [(3, 1), (15, 1)],
  term (-1 : Rat) [(3, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010NYN_coefficient_28_0000 : Poly :=
[
  term ((-10804 : Rat) / 599) []
]

/-- Partial product 0 for generator 28. -/
def rs_R010_ueqv_R010NYN_partial_28_0000 : Poly :=
[
  term ((-21608 : Rat) / 599) [(2, 1), (14, 1)],
  term ((10804 : Rat) / 599) [(2, 2)],
  term ((-21608 : Rat) / 599) [(3, 1), (15, 1)],
  term ((10804 : Rat) / 599) [(3, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 28. -/
theorem rs_R010_ueqv_R010NYN_partial_28_0000_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_28_0000
        rs_R010_ueqv_R010NYN_generator_28_0000_0061 =
      rs_R010_ueqv_R010NYN_partial_28_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010NYN_coefficient_28_0001 : Poly :=
[
  term (-6 : Rat) [(0, 1)]
]

/-- Partial product 1 for generator 28. -/
def rs_R010_ueqv_R010NYN_partial_28_0001 : Poly :=
[
  term (-12 : Rat) [(0, 1), (2, 1), (14, 1)],
  term (6 : Rat) [(0, 1), (2, 2)],
  term (-12 : Rat) [(0, 1), (3, 1), (15, 1)],
  term (6 : Rat) [(0, 1), (3, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 28. -/
theorem rs_R010_ueqv_R010NYN_partial_28_0001_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_28_0001
        rs_R010_ueqv_R010NYN_generator_28_0000_0061 =
      rs_R010_ueqv_R010NYN_partial_28_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010NYN_coefficient_28_0002 : Poly :=
[
  term ((-244224 : Rat) / 2995) [(0, 1), (11, 1), (15, 1)]
]

/-- Partial product 2 for generator 28. -/
def rs_R010_ueqv_R010NYN_partial_28_0002 : Poly :=
[
  term ((-488448 : Rat) / 2995) [(0, 1), (2, 1), (11, 1), (14, 1), (15, 1)],
  term ((244224 : Rat) / 2995) [(0, 1), (2, 2), (11, 1), (15, 1)],
  term ((-488448 : Rat) / 2995) [(0, 1), (3, 1), (11, 1), (15, 2)],
  term ((244224 : Rat) / 2995) [(0, 1), (3, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 28. -/
theorem rs_R010_ueqv_R010NYN_partial_28_0002_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_28_0002
        rs_R010_ueqv_R010NYN_generator_28_0000_0061 =
      rs_R010_ueqv_R010NYN_partial_28_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010NYN_coefficient_28_0003 : Poly :=
[
  term ((132 : Rat) / 5) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 3 for generator 28. -/
def rs_R010_ueqv_R010NYN_partial_28_0003 : Poly :=
[
  term ((264 : Rat) / 5) [(0, 1), (2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-132 : Rat) / 5) [(0, 1), (2, 2), (11, 1), (15, 1), (16, 1)],
  term ((264 : Rat) / 5) [(0, 1), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((-132 : Rat) / 5) [(0, 1), (3, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 28. -/
theorem rs_R010_ueqv_R010NYN_partial_28_0003_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_28_0003
        rs_R010_ueqv_R010NYN_generator_28_0000_0061 =
      rs_R010_ueqv_R010NYN_partial_28_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010NYN_coefficient_28_0004 : Poly :=
[
  term ((321408 : Rat) / 2995) [(0, 1), (11, 2)]
]

/-- Partial product 4 for generator 28. -/
def rs_R010_ueqv_R010NYN_partial_28_0004 : Poly :=
[
  term ((642816 : Rat) / 2995) [(0, 1), (2, 1), (11, 2), (14, 1)],
  term ((-321408 : Rat) / 2995) [(0, 1), (2, 2), (11, 2)],
  term ((642816 : Rat) / 2995) [(0, 1), (3, 1), (11, 2), (15, 1)],
  term ((-321408 : Rat) / 2995) [(0, 1), (3, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 28. -/
theorem rs_R010_ueqv_R010NYN_partial_28_0004_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_28_0004
        rs_R010_ueqv_R010NYN_generator_28_0000_0061 =
      rs_R010_ueqv_R010NYN_partial_28_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010NYN_coefficient_28_0005 : Poly :=
[
  term ((13392 : Rat) / 2995) [(1, 1), (11, 1)]
]

/-- Partial product 5 for generator 28. -/
def rs_R010_ueqv_R010NYN_partial_28_0005 : Poly :=
[
  term ((26784 : Rat) / 2995) [(1, 1), (2, 1), (11, 1), (14, 1)],
  term ((-13392 : Rat) / 2995) [(1, 1), (2, 2), (11, 1)],
  term ((26784 : Rat) / 2995) [(1, 1), (3, 1), (11, 1), (15, 1)],
  term ((-13392 : Rat) / 2995) [(1, 1), (3, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 28. -/
theorem rs_R010_ueqv_R010NYN_partial_28_0005_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_28_0005
        rs_R010_ueqv_R010NYN_generator_28_0000_0061 =
      rs_R010_ueqv_R010NYN_partial_28_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010NYN_coefficient_28_0006 : Poly :=
[
  term ((-107136 : Rat) / 2995) [(1, 1), (11, 1), (14, 1)]
]

/-- Partial product 6 for generator 28. -/
def rs_R010_ueqv_R010NYN_partial_28_0006 : Poly :=
[
  term ((-214272 : Rat) / 2995) [(1, 1), (2, 1), (11, 1), (14, 2)],
  term ((107136 : Rat) / 2995) [(1, 1), (2, 2), (11, 1), (14, 1)],
  term ((-214272 : Rat) / 2995) [(1, 1), (3, 1), (11, 1), (14, 1), (15, 1)],
  term ((107136 : Rat) / 2995) [(1, 1), (3, 2), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 28. -/
theorem rs_R010_ueqv_R010NYN_partial_28_0006_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_28_0006
        rs_R010_ueqv_R010NYN_generator_28_0000_0061 =
      rs_R010_ueqv_R010NYN_partial_28_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010NYN_coefficient_28_0007 : Poly :=
[
  term ((194112 : Rat) / 599) [(1, 1), (11, 1), (15, 2)]
]

/-- Partial product 7 for generator 28. -/
def rs_R010_ueqv_R010NYN_partial_28_0007 : Poly :=
[
  term ((388224 : Rat) / 599) [(1, 1), (2, 1), (11, 1), (14, 1), (15, 2)],
  term ((-194112 : Rat) / 599) [(1, 1), (2, 2), (11, 1), (15, 2)],
  term ((388224 : Rat) / 599) [(1, 1), (3, 1), (11, 1), (15, 3)],
  term ((-194112 : Rat) / 599) [(1, 1), (3, 2), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 28. -/
theorem rs_R010_ueqv_R010NYN_partial_28_0007_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_28_0007
        rs_R010_ueqv_R010NYN_generator_28_0000_0061 =
      rs_R010_ueqv_R010NYN_partial_28_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010NYN_coefficient_28_0008 : Poly :=
[
  term ((-264 : Rat) / 5) [(1, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 8 for generator 28. -/
def rs_R010_ueqv_R010NYN_partial_28_0008 : Poly :=
[
  term ((-528 : Rat) / 5) [(1, 1), (2, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((264 : Rat) / 5) [(1, 1), (2, 2), (11, 1), (15, 2), (16, 1)],
  term ((-528 : Rat) / 5) [(1, 1), (3, 1), (11, 1), (15, 3), (16, 1)],
  term ((264 : Rat) / 5) [(1, 1), (3, 2), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 28. -/
theorem rs_R010_ueqv_R010NYN_partial_28_0008_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_28_0008
        rs_R010_ueqv_R010NYN_generator_28_0000_0061 =
      rs_R010_ueqv_R010NYN_partial_28_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010NYN_coefficient_28_0009 : Poly :=
[
  term ((-642816 : Rat) / 2995) [(1, 1), (11, 2), (15, 1)]
]

/-- Partial product 9 for generator 28. -/
def rs_R010_ueqv_R010NYN_partial_28_0009 : Poly :=
[
  term ((-1285632 : Rat) / 2995) [(1, 1), (2, 1), (11, 2), (14, 1), (15, 1)],
  term ((642816 : Rat) / 2995) [(1, 1), (2, 2), (11, 2), (15, 1)],
  term ((-1285632 : Rat) / 2995) [(1, 1), (3, 1), (11, 2), (15, 2)],
  term ((642816 : Rat) / 2995) [(1, 1), (3, 2), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 28. -/
theorem rs_R010_ueqv_R010NYN_partial_28_0009_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_28_0009
        rs_R010_ueqv_R010NYN_generator_28_0000_0061 =
      rs_R010_ueqv_R010NYN_partial_28_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010NYN_coefficient_28_0010 : Poly :=
[
  term ((170688 : Rat) / 2995) [(1, 1), (14, 1), (15, 1)]
]

/-- Partial product 10 for generator 28. -/
def rs_R010_ueqv_R010NYN_partial_28_0010 : Poly :=
[
  term ((341376 : Rat) / 2995) [(1, 1), (2, 1), (14, 2), (15, 1)],
  term ((-170688 : Rat) / 2995) [(1, 1), (2, 2), (14, 1), (15, 1)],
  term ((341376 : Rat) / 2995) [(1, 1), (3, 1), (14, 1), (15, 2)],
  term ((-170688 : Rat) / 2995) [(1, 1), (3, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 28. -/
theorem rs_R010_ueqv_R010NYN_partial_28_0010_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_28_0010
        rs_R010_ueqv_R010NYN_generator_28_0000_0061 =
      rs_R010_ueqv_R010NYN_partial_28_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010NYN_coefficient_28_0011 : Poly :=
[
  term ((-64 : Rat) / 5) [(1, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 11 for generator 28. -/
def rs_R010_ueqv_R010NYN_partial_28_0011 : Poly :=
[
  term ((-128 : Rat) / 5) [(1, 1), (2, 1), (14, 2), (15, 1), (16, 1)],
  term ((64 : Rat) / 5) [(1, 1), (2, 2), (14, 1), (15, 1), (16, 1)],
  term ((-128 : Rat) / 5) [(1, 1), (3, 1), (14, 1), (15, 2), (16, 1)],
  term ((64 : Rat) / 5) [(1, 1), (3, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 28. -/
theorem rs_R010_ueqv_R010NYN_partial_28_0011_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_28_0011
        rs_R010_ueqv_R010NYN_generator_28_0000_0061 =
      rs_R010_ueqv_R010NYN_partial_28_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010NYN_coefficient_28_0012 : Poly :=
[
  term ((48084 : Rat) / 2995) [(1, 1), (15, 1)]
]

/-- Partial product 12 for generator 28. -/
def rs_R010_ueqv_R010NYN_partial_28_0012 : Poly :=
[
  term ((96168 : Rat) / 2995) [(1, 1), (2, 1), (14, 1), (15, 1)],
  term ((-48084 : Rat) / 2995) [(1, 1), (2, 2), (15, 1)],
  term ((96168 : Rat) / 2995) [(1, 1), (3, 1), (15, 2)],
  term ((-48084 : Rat) / 2995) [(1, 1), (3, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 28. -/
theorem rs_R010_ueqv_R010NYN_partial_28_0012_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_28_0012
        rs_R010_ueqv_R010NYN_generator_28_0000_0061 =
      rs_R010_ueqv_R010NYN_partial_28_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010NYN_coefficient_28_0013 : Poly :=
[
  term ((-7 : Rat) / 5) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 13 for generator 28. -/
def rs_R010_ueqv_R010NYN_partial_28_0013 : Poly :=
[
  term ((-14 : Rat) / 5) [(1, 1), (2, 1), (14, 1), (15, 1), (16, 1)],
  term ((7 : Rat) / 5) [(1, 1), (2, 2), (15, 1), (16, 1)],
  term ((-14 : Rat) / 5) [(1, 1), (3, 1), (15, 2), (16, 1)],
  term ((7 : Rat) / 5) [(1, 1), (3, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 28. -/
theorem rs_R010_ueqv_R010NYN_partial_28_0013_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_28_0013
        rs_R010_ueqv_R010NYN_generator_28_0000_0061 =
      rs_R010_ueqv_R010NYN_partial_28_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010NYN_coefficient_28_0014 : Poly :=
[
  term ((-98496 : Rat) / 2995) [(1, 1), (15, 3)]
]

/-- Partial product 14 for generator 28. -/
def rs_R010_ueqv_R010NYN_partial_28_0014 : Poly :=
[
  term ((-196992 : Rat) / 2995) [(1, 1), (2, 1), (14, 1), (15, 3)],
  term ((98496 : Rat) / 2995) [(1, 1), (2, 2), (15, 3)],
  term ((-196992 : Rat) / 2995) [(1, 1), (3, 1), (15, 4)],
  term ((98496 : Rat) / 2995) [(1, 1), (3, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 28. -/
theorem rs_R010_ueqv_R010NYN_partial_28_0014_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_28_0014
        rs_R010_ueqv_R010NYN_generator_28_0000_0061 =
      rs_R010_ueqv_R010NYN_partial_28_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010NYN_coefficient_28_0015 : Poly :=
[
  term ((-12 : Rat) / 5) [(1, 1), (15, 3), (16, 1)]
]

/-- Partial product 15 for generator 28. -/
def rs_R010_ueqv_R010NYN_partial_28_0015 : Poly :=
[
  term ((-24 : Rat) / 5) [(1, 1), (2, 1), (14, 1), (15, 3), (16, 1)],
  term ((12 : Rat) / 5) [(1, 1), (2, 2), (15, 3), (16, 1)],
  term ((-24 : Rat) / 5) [(1, 1), (3, 1), (15, 4), (16, 1)],
  term ((12 : Rat) / 5) [(1, 1), (3, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 28. -/
theorem rs_R010_ueqv_R010NYN_partial_28_0015_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_28_0015
        rs_R010_ueqv_R010NYN_generator_28_0000_0061 =
      rs_R010_ueqv_R010NYN_partial_28_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010NYN_coefficient_28_0016 : Poly :=
[
  term (6 : Rat) [(2, 1)]
]

/-- Partial product 16 for generator 28. -/
def rs_R010_ueqv_R010NYN_partial_28_0016 : Poly :=
[
  term (12 : Rat) [(2, 1), (3, 1), (15, 1)],
  term (-6 : Rat) [(2, 1), (3, 2)],
  term (12 : Rat) [(2, 2), (14, 1)],
  term (-6 : Rat) [(2, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 28. -/
theorem rs_R010_ueqv_R010NYN_partial_28_0016_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_28_0016
        rs_R010_ueqv_R010NYN_generator_28_0000_0061 =
      rs_R010_ueqv_R010NYN_partial_28_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010NYN_coefficient_28_0017 : Poly :=
[
  term (-12 : Rat) [(2, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 17 for generator 28. -/
def rs_R010_ueqv_R010NYN_partial_28_0017 : Poly :=
[
  term (-24 : Rat) [(2, 1), (3, 1), (11, 1), (15, 2), (16, 1)],
  term (12 : Rat) [(2, 1), (3, 2), (11, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(2, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(2, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 28. -/
theorem rs_R010_ueqv_R010NYN_partial_28_0017_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_28_0017
        rs_R010_ueqv_R010NYN_generator_28_0000_0061 =
      rs_R010_ueqv_R010NYN_partial_28_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010NYN_coefficient_28_0018 : Poly :=
[
  term ((1285632 : Rat) / 2995) [(3, 1), (11, 1)]
]

/-- Partial product 18 for generator 28. -/
def rs_R010_ueqv_R010NYN_partial_28_0018 : Poly :=
[
  term ((2571264 : Rat) / 2995) [(2, 1), (3, 1), (11, 1), (14, 1)],
  term ((-1285632 : Rat) / 2995) [(2, 2), (3, 1), (11, 1)],
  term ((2571264 : Rat) / 2995) [(3, 2), (11, 1), (15, 1)],
  term ((-1285632 : Rat) / 2995) [(3, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 28. -/
theorem rs_R010_ueqv_R010NYN_partial_28_0018_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_28_0018
        rs_R010_ueqv_R010NYN_generator_28_0000_0061 =
      rs_R010_ueqv_R010NYN_partial_28_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010NYN_coefficient_28_0019 : Poly :=
[
  term ((-2571264 : Rat) / 2995) [(3, 1), (11, 1), (14, 1)]
]

/-- Partial product 19 for generator 28. -/
def rs_R010_ueqv_R010NYN_partial_28_0019 : Poly :=
[
  term ((-5142528 : Rat) / 2995) [(2, 1), (3, 1), (11, 1), (14, 2)],
  term ((2571264 : Rat) / 2995) [(2, 2), (3, 1), (11, 1), (14, 1)],
  term ((-5142528 : Rat) / 2995) [(3, 2), (11, 1), (14, 1), (15, 1)],
  term ((2571264 : Rat) / 2995) [(3, 3), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 28. -/
theorem rs_R010_ueqv_R010NYN_partial_28_0019_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_28_0019
        rs_R010_ueqv_R010NYN_generator_28_0000_0061 =
      rs_R010_ueqv_R010NYN_partial_28_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010NYN_coefficient_28_0020 : Poly :=
[
  term ((2757312 : Rat) / 2995) [(3, 1), (14, 1), (15, 1)]
]

/-- Partial product 20 for generator 28. -/
def rs_R010_ueqv_R010NYN_partial_28_0020 : Poly :=
[
  term ((5514624 : Rat) / 2995) [(2, 1), (3, 1), (14, 2), (15, 1)],
  term ((-2757312 : Rat) / 2995) [(2, 2), (3, 1), (14, 1), (15, 1)],
  term ((5514624 : Rat) / 2995) [(3, 2), (14, 1), (15, 2)],
  term ((-2757312 : Rat) / 2995) [(3, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 28. -/
theorem rs_R010_ueqv_R010NYN_partial_28_0020_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_28_0020
        rs_R010_ueqv_R010NYN_generator_28_0000_0061 =
      rs_R010_ueqv_R010NYN_partial_28_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010NYN_coefficient_28_0021 : Poly :=
[
  term ((-636 : Rat) / 5) [(3, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 21 for generator 28. -/
def rs_R010_ueqv_R010NYN_partial_28_0021 : Poly :=
[
  term ((-1272 : Rat) / 5) [(2, 1), (3, 1), (14, 2), (15, 1), (16, 1)],
  term ((636 : Rat) / 5) [(2, 2), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1272 : Rat) / 5) [(3, 2), (14, 1), (15, 2), (16, 1)],
  term ((636 : Rat) / 5) [(3, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 28. -/
theorem rs_R010_ueqv_R010NYN_partial_28_0021_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_28_0021
        rs_R010_ueqv_R010NYN_generator_28_0000_0061 =
      rs_R010_ueqv_R010NYN_partial_28_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010NYN_coefficient_28_0022 : Poly :=
[
  term ((-1342716 : Rat) / 2995) [(3, 1), (15, 1)]
]

/-- Partial product 22 for generator 28. -/
def rs_R010_ueqv_R010NYN_partial_28_0022 : Poly :=
[
  term ((-2685432 : Rat) / 2995) [(2, 1), (3, 1), (14, 1), (15, 1)],
  term ((1342716 : Rat) / 2995) [(2, 2), (3, 1), (15, 1)],
  term ((-2685432 : Rat) / 2995) [(3, 2), (15, 2)],
  term ((1342716 : Rat) / 2995) [(3, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 28. -/
theorem rs_R010_ueqv_R010NYN_partial_28_0022_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_28_0022
        rs_R010_ueqv_R010NYN_generator_28_0000_0061 =
      rs_R010_ueqv_R010NYN_partial_28_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010NYN_coefficient_28_0023 : Poly :=
[
  term ((298 : Rat) / 5) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 23 for generator 28. -/
def rs_R010_ueqv_R010NYN_partial_28_0023 : Poly :=
[
  term ((596 : Rat) / 5) [(2, 1), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-298 : Rat) / 5) [(2, 2), (3, 1), (15, 1), (16, 1)],
  term ((596 : Rat) / 5) [(3, 2), (15, 2), (16, 1)],
  term ((-298 : Rat) / 5) [(3, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 28. -/
theorem rs_R010_ueqv_R010NYN_partial_28_0023_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_28_0023
        rs_R010_ueqv_R010NYN_generator_28_0000_0061 =
      rs_R010_ueqv_R010NYN_partial_28_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010NYN_coefficient_28_0024 : Poly :=
[
  term (6 : Rat) [(8, 1)]
]

/-- Partial product 24 for generator 28. -/
def rs_R010_ueqv_R010NYN_partial_28_0024 : Poly :=
[
  term (12 : Rat) [(2, 1), (8, 1), (14, 1)],
  term (-6 : Rat) [(2, 2), (8, 1)],
  term (12 : Rat) [(3, 1), (8, 1), (15, 1)],
  term (-6 : Rat) [(3, 2), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 28. -/
theorem rs_R010_ueqv_R010NYN_partial_28_0024_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_28_0024
        rs_R010_ueqv_R010NYN_generator_28_0000_0061 =
      rs_R010_ueqv_R010NYN_partial_28_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010NYN_coefficient_28_0025 : Poly :=
[
  term ((857088 : Rat) / 2995) [(8, 1), (11, 1), (13, 1)]
]

/-- Partial product 25 for generator 28. -/
def rs_R010_ueqv_R010NYN_partial_28_0025 : Poly :=
[
  term ((1714176 : Rat) / 2995) [(2, 1), (8, 1), (11, 1), (13, 1), (14, 1)],
  term ((-857088 : Rat) / 2995) [(2, 2), (8, 1), (11, 1), (13, 1)],
  term ((1714176 : Rat) / 2995) [(3, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-857088 : Rat) / 2995) [(3, 2), (8, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 28. -/
theorem rs_R010_ueqv_R010NYN_partial_28_0025_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_28_0025
        rs_R010_ueqv_R010NYN_generator_28_0000_0061 =
      rs_R010_ueqv_R010NYN_partial_28_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010NYN_coefficient_28_0026 : Poly :=
[
  term ((903312 : Rat) / 2995) [(8, 1), (11, 1), (15, 1)]
]

/-- Partial product 26 for generator 28. -/
def rs_R010_ueqv_R010NYN_partial_28_0026 : Poly :=
[
  term ((1806624 : Rat) / 2995) [(2, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((-903312 : Rat) / 2995) [(2, 2), (8, 1), (11, 1), (15, 1)],
  term ((1806624 : Rat) / 2995) [(3, 1), (8, 1), (11, 1), (15, 2)],
  term ((-903312 : Rat) / 2995) [(3, 2), (8, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 28. -/
theorem rs_R010_ueqv_R010NYN_partial_28_0026_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_28_0026
        rs_R010_ueqv_R010NYN_generator_28_0000_0061 =
      rs_R010_ueqv_R010NYN_partial_28_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010NYN_coefficient_28_0027 : Poly :=
[
  term ((-864 : Rat) / 5) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 27 for generator 28. -/
def rs_R010_ueqv_R010NYN_partial_28_0027 : Poly :=
[
  term ((-1728 : Rat) / 5) [(2, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((864 : Rat) / 5) [(2, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1728 : Rat) / 5) [(3, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((864 : Rat) / 5) [(3, 2), (8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 28. -/
theorem rs_R010_ueqv_R010NYN_partial_28_0027_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_28_0027
        rs_R010_ueqv_R010NYN_generator_28_0000_0061 =
      rs_R010_ueqv_R010NYN_partial_28_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010NYN_coefficient_28_0028 : Poly :=
[
  term ((-2651616 : Rat) / 2995) [(8, 1), (11, 2)]
]

/-- Partial product 28 for generator 28. -/
def rs_R010_ueqv_R010NYN_partial_28_0028 : Poly :=
[
  term ((-5303232 : Rat) / 2995) [(2, 1), (8, 1), (11, 2), (14, 1)],
  term ((2651616 : Rat) / 2995) [(2, 2), (8, 1), (11, 2)],
  term ((-5303232 : Rat) / 2995) [(3, 1), (8, 1), (11, 2), (15, 1)],
  term ((2651616 : Rat) / 2995) [(3, 2), (8, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 28. -/
theorem rs_R010_ueqv_R010NYN_partial_28_0028_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_28_0028
        rs_R010_ueqv_R010NYN_generator_28_0000_0061 =
      rs_R010_ueqv_R010NYN_partial_28_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010NYN_coefficient_28_0029 : Poly :=
[
  term ((-919104 : Rat) / 2995) [(8, 1), (13, 1), (15, 1)]
]

/-- Partial product 29 for generator 28. -/
def rs_R010_ueqv_R010NYN_partial_28_0029 : Poly :=
[
  term ((-1838208 : Rat) / 2995) [(2, 1), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((919104 : Rat) / 2995) [(2, 2), (8, 1), (13, 1), (15, 1)],
  term ((-1838208 : Rat) / 2995) [(3, 1), (8, 1), (13, 1), (15, 2)],
  term ((919104 : Rat) / 2995) [(3, 2), (8, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 28. -/
theorem rs_R010_ueqv_R010NYN_partial_28_0029_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_28_0029
        rs_R010_ueqv_R010NYN_generator_28_0000_0061 =
      rs_R010_ueqv_R010NYN_partial_28_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010NYN_coefficient_28_0030 : Poly :=
[
  term ((212 : Rat) / 5) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 30 for generator 28. -/
def rs_R010_ueqv_R010NYN_partial_28_0030 : Poly :=
[
  term ((424 : Rat) / 5) [(2, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-212 : Rat) / 5) [(2, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((424 : Rat) / 5) [(3, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((-212 : Rat) / 5) [(3, 2), (8, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 28. -/
theorem rs_R010_ueqv_R010NYN_partial_28_0030_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_28_0030
        rs_R010_ueqv_R010NYN_generator_28_0000_0061 =
      rs_R010_ueqv_R010NYN_partial_28_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010NYN_coefficient_28_0031 : Poly :=
[
  term ((1838208 : Rat) / 2995) [(8, 1), (15, 2)]
]

/-- Partial product 31 for generator 28. -/
def rs_R010_ueqv_R010NYN_partial_28_0031 : Poly :=
[
  term ((3676416 : Rat) / 2995) [(2, 1), (8, 1), (14, 1), (15, 2)],
  term ((-1838208 : Rat) / 2995) [(2, 2), (8, 1), (15, 2)],
  term ((3676416 : Rat) / 2995) [(3, 1), (8, 1), (15, 3)],
  term ((-1838208 : Rat) / 2995) [(3, 2), (8, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 28. -/
theorem rs_R010_ueqv_R010NYN_partial_28_0031_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_28_0031
        rs_R010_ueqv_R010NYN_generator_28_0000_0061 =
      rs_R010_ueqv_R010NYN_partial_28_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010NYN_coefficient_28_0032 : Poly :=
[
  term ((-424 : Rat) / 5) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 32 for generator 28. -/
def rs_R010_ueqv_R010NYN_partial_28_0032 : Poly :=
[
  term ((-848 : Rat) / 5) [(2, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((424 : Rat) / 5) [(2, 2), (8, 1), (15, 2), (16, 1)],
  term ((-848 : Rat) / 5) [(3, 1), (8, 1), (15, 3), (16, 1)],
  term ((424 : Rat) / 5) [(3, 2), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 28. -/
theorem rs_R010_ueqv_R010NYN_partial_28_0032_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_28_0032
        rs_R010_ueqv_R010NYN_generator_28_0000_0061 =
      rs_R010_ueqv_R010NYN_partial_28_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010NYN_coefficient_28_0033 : Poly :=
[
  term ((-40176 : Rat) / 2995) [(9, 1), (11, 1)]
]

/-- Partial product 33 for generator 28. -/
def rs_R010_ueqv_R010NYN_partial_28_0033 : Poly :=
[
  term ((-80352 : Rat) / 2995) [(2, 1), (9, 1), (11, 1), (14, 1)],
  term ((40176 : Rat) / 2995) [(2, 2), (9, 1), (11, 1)],
  term ((-80352 : Rat) / 2995) [(3, 1), (9, 1), (11, 1), (15, 1)],
  term ((40176 : Rat) / 2995) [(3, 2), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 28. -/
theorem rs_R010_ueqv_R010NYN_partial_28_0033_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_28_0033
        rs_R010_ueqv_R010NYN_generator_28_0000_0061 =
      rs_R010_ueqv_R010NYN_partial_28_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010NYN_coefficient_28_0034 : Poly :=
[
  term ((256032 : Rat) / 2995) [(9, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 34 for generator 28. -/
def rs_R010_ueqv_R010NYN_partial_28_0034 : Poly :=
[
  term ((512064 : Rat) / 2995) [(2, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-256032 : Rat) / 2995) [(2, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((512064 : Rat) / 2995) [(3, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((-256032 : Rat) / 2995) [(3, 2), (9, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 28. -/
theorem rs_R010_ueqv_R010NYN_partial_28_0034_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_28_0034
        rs_R010_ueqv_R010NYN_generator_28_0000_0061 =
      rs_R010_ueqv_R010NYN_partial_28_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010NYN_coefficient_28_0035 : Poly :=
[
  term ((-96 : Rat) / 5) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 35 for generator 28. -/
def rs_R010_ueqv_R010NYN_partial_28_0035 : Poly :=
[
  term ((-192 : Rat) / 5) [(2, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((96 : Rat) / 5) [(2, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-192 : Rat) / 5) [(3, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((96 : Rat) / 5) [(3, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 28. -/
theorem rs_R010_ueqv_R010NYN_partial_28_0035_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_28_0035
        rs_R010_ueqv_R010NYN_generator_28_0000_0061 =
      rs_R010_ueqv_R010NYN_partial_28_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010NYN_coefficient_28_0036 : Poly :=
[
  term ((458496 : Rat) / 2995) [(9, 1), (11, 1), (15, 2)]
]

/-- Partial product 36 for generator 28. -/
def rs_R010_ueqv_R010NYN_partial_28_0036 : Poly :=
[
  term ((916992 : Rat) / 2995) [(2, 1), (9, 1), (11, 1), (14, 1), (15, 2)],
  term ((-458496 : Rat) / 2995) [(2, 2), (9, 1), (11, 1), (15, 2)],
  term ((916992 : Rat) / 2995) [(3, 1), (9, 1), (11, 1), (15, 3)],
  term ((-458496 : Rat) / 2995) [(3, 2), (9, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 28. -/
theorem rs_R010_ueqv_R010NYN_partial_28_0036_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_28_0036
        rs_R010_ueqv_R010NYN_generator_28_0000_0061 =
      rs_R010_ueqv_R010NYN_partial_28_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010NYN_coefficient_28_0037 : Poly :=
[
  term ((-72 : Rat) / 5) [(9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 37 for generator 28. -/
def rs_R010_ueqv_R010NYN_partial_28_0037 : Poly :=
[
  term ((-144 : Rat) / 5) [(2, 1), (9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((72 : Rat) / 5) [(2, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-144 : Rat) / 5) [(3, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((72 : Rat) / 5) [(3, 2), (9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 28. -/
theorem rs_R010_ueqv_R010NYN_partial_28_0037_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_28_0037
        rs_R010_ueqv_R010NYN_generator_28_0000_0061 =
      rs_R010_ueqv_R010NYN_partial_28_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010NYN_coefficient_28_0038 : Poly :=
[
  term ((-160704 : Rat) / 2995) [(9, 1), (11, 2), (13, 1)]
]

/-- Partial product 38 for generator 28. -/
def rs_R010_ueqv_R010NYN_partial_28_0038 : Poly :=
[
  term ((-321408 : Rat) / 2995) [(2, 1), (9, 1), (11, 2), (13, 1), (14, 1)],
  term ((160704 : Rat) / 2995) [(2, 2), (9, 1), (11, 2), (13, 1)],
  term ((-321408 : Rat) / 2995) [(3, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((160704 : Rat) / 2995) [(3, 2), (9, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 28. -/
theorem rs_R010_ueqv_R010NYN_partial_28_0038_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_28_0038
        rs_R010_ueqv_R010NYN_generator_28_0000_0061 =
      rs_R010_ueqv_R010NYN_partial_28_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010NYN_coefficient_28_0039 : Poly :=
[
  term ((-321408 : Rat) / 2995) [(9, 1), (11, 2), (15, 1)]
]

/-- Partial product 39 for generator 28. -/
def rs_R010_ueqv_R010NYN_partial_28_0039 : Poly :=
[
  term ((-642816 : Rat) / 2995) [(2, 1), (9, 1), (11, 2), (14, 1), (15, 1)],
  term ((321408 : Rat) / 2995) [(2, 2), (9, 1), (11, 2), (15, 1)],
  term ((-642816 : Rat) / 2995) [(3, 1), (9, 1), (11, 2), (15, 2)],
  term ((321408 : Rat) / 2995) [(3, 2), (9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 28. -/
theorem rs_R010_ueqv_R010NYN_partial_28_0039_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_28_0039
        rs_R010_ueqv_R010NYN_generator_28_0000_0061 =
      rs_R010_ueqv_R010NYN_partial_28_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010NYN_coefficient_28_0040 : Poly :=
[
  term ((44148 : Rat) / 2995) [(9, 1), (15, 1)]
]

/-- Partial product 40 for generator 28. -/
def rs_R010_ueqv_R010NYN_partial_28_0040 : Poly :=
[
  term ((88296 : Rat) / 2995) [(2, 1), (9, 1), (14, 1), (15, 1)],
  term ((-44148 : Rat) / 2995) [(2, 2), (9, 1), (15, 1)],
  term ((88296 : Rat) / 2995) [(3, 1), (9, 1), (15, 2)],
  term ((-44148 : Rat) / 2995) [(3, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 28. -/
theorem rs_R010_ueqv_R010NYN_partial_28_0040_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_28_0040
        rs_R010_ueqv_R010NYN_generator_28_0000_0061 =
      rs_R010_ueqv_R010NYN_partial_28_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010NYN_coefficient_28_0041 : Poly :=
[
  term ((1 : Rat) / 5) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 41 for generator 28. -/
def rs_R010_ueqv_R010NYN_partial_28_0041 : Poly :=
[
  term ((2 : Rat) / 5) [(2, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1 : Rat) / 5) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((2 : Rat) / 5) [(3, 1), (9, 1), (15, 2), (16, 1)],
  term ((-1 : Rat) / 5) [(3, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 28. -/
theorem rs_R010_ueqv_R010NYN_partial_28_0041_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_28_0041
        rs_R010_ueqv_R010NYN_generator_28_0000_0061 =
      rs_R010_ueqv_R010NYN_partial_28_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010NYN_coefficient_28_0042 : Poly :=
[
  term ((-98496 : Rat) / 2995) [(9, 1), (15, 3)]
]

/-- Partial product 42 for generator 28. -/
def rs_R010_ueqv_R010NYN_partial_28_0042 : Poly :=
[
  term ((-196992 : Rat) / 2995) [(2, 1), (9, 1), (14, 1), (15, 3)],
  term ((98496 : Rat) / 2995) [(2, 2), (9, 1), (15, 3)],
  term ((-196992 : Rat) / 2995) [(3, 1), (9, 1), (15, 4)],
  term ((98496 : Rat) / 2995) [(3, 2), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 28. -/
theorem rs_R010_ueqv_R010NYN_partial_28_0042_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_28_0042
        rs_R010_ueqv_R010NYN_generator_28_0000_0061 =
      rs_R010_ueqv_R010NYN_partial_28_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010NYN_coefficient_28_0043 : Poly :=
[
  term ((-12 : Rat) / 5) [(9, 1), (15, 3), (16, 1)]
]

/-- Partial product 43 for generator 28. -/
def rs_R010_ueqv_R010NYN_partial_28_0043 : Poly :=
[
  term ((-24 : Rat) / 5) [(2, 1), (9, 1), (14, 1), (15, 3), (16, 1)],
  term ((12 : Rat) / 5) [(2, 2), (9, 1), (15, 3), (16, 1)],
  term ((-24 : Rat) / 5) [(3, 1), (9, 1), (15, 4), (16, 1)],
  term ((12 : Rat) / 5) [(3, 2), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 28. -/
theorem rs_R010_ueqv_R010NYN_partial_28_0043_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_28_0043
        rs_R010_ueqv_R010NYN_generator_28_0000_0061 =
      rs_R010_ueqv_R010NYN_partial_28_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010NYN_coefficient_28_0044 : Poly :=
[
  term (6 : Rat) [(10, 1)]
]

/-- Partial product 44 for generator 28. -/
def rs_R010_ueqv_R010NYN_partial_28_0044 : Poly :=
[
  term (12 : Rat) [(2, 1), (10, 1), (14, 1)],
  term (-6 : Rat) [(2, 2), (10, 1)],
  term (12 : Rat) [(3, 1), (10, 1), (15, 1)],
  term (-6 : Rat) [(3, 2), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 28. -/
theorem rs_R010_ueqv_R010NYN_partial_28_0044_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_28_0044
        rs_R010_ueqv_R010NYN_generator_28_0000_0061 =
      rs_R010_ueqv_R010NYN_partial_28_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010NYN_coefficient_28_0045 : Poly :=
[
  term ((-325872 : Rat) / 2995) [(11, 1), (13, 1)]
]

/-- Partial product 45 for generator 28. -/
def rs_R010_ueqv_R010NYN_partial_28_0045 : Poly :=
[
  term ((-651744 : Rat) / 2995) [(2, 1), (11, 1), (13, 1), (14, 1)],
  term ((325872 : Rat) / 2995) [(2, 2), (11, 1), (13, 1)],
  term ((-651744 : Rat) / 2995) [(3, 1), (11, 1), (13, 1), (15, 1)],
  term ((325872 : Rat) / 2995) [(3, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 28. -/
theorem rs_R010_ueqv_R010NYN_partial_28_0045_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_28_0045
        rs_R010_ueqv_R010NYN_generator_28_0000_0061 =
      rs_R010_ueqv_R010NYN_partial_28_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010NYN_coefficient_28_0046 : Poly :=
[
  term ((4983552 : Rat) / 2995) [(11, 1), (14, 1), (15, 1)]
]

/-- Partial product 46 for generator 28. -/
def rs_R010_ueqv_R010NYN_partial_28_0046 : Poly :=
[
  term ((9967104 : Rat) / 2995) [(2, 1), (11, 1), (14, 2), (15, 1)],
  term ((-4983552 : Rat) / 2995) [(2, 2), (11, 1), (14, 1), (15, 1)],
  term ((9967104 : Rat) / 2995) [(3, 1), (11, 1), (14, 1), (15, 2)],
  term ((-4983552 : Rat) / 2995) [(3, 2), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 28. -/
theorem rs_R010_ueqv_R010NYN_partial_28_0046_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_28_0046
        rs_R010_ueqv_R010NYN_generator_28_0000_0061 =
      rs_R010_ueqv_R010NYN_partial_28_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010NYN_coefficient_28_0047 : Poly :=
[
  term ((-948 : Rat) / 5) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 47 for generator 28. -/
def rs_R010_ueqv_R010NYN_partial_28_0047 : Poly :=
[
  term ((-1896 : Rat) / 5) [(2, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((948 : Rat) / 5) [(2, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1896 : Rat) / 5) [(3, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((948 : Rat) / 5) [(3, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 28. -/
theorem rs_R010_ueqv_R010NYN_partial_28_0047_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_28_0047
        rs_R010_ueqv_R010NYN_generator_28_0000_0061 =
      rs_R010_ueqv_R010NYN_partial_28_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010NYN_coefficient_28_0048 : Poly :=
[
  term ((-2791692 : Rat) / 2995) [(11, 1), (15, 1)]
]

/-- Partial product 48 for generator 28. -/
def rs_R010_ueqv_R010NYN_partial_28_0048 : Poly :=
[
  term ((-5583384 : Rat) / 2995) [(2, 1), (11, 1), (14, 1), (15, 1)],
  term ((2791692 : Rat) / 2995) [(2, 2), (11, 1), (15, 1)],
  term ((-5583384 : Rat) / 2995) [(3, 1), (11, 1), (15, 2)],
  term ((2791692 : Rat) / 2995) [(3, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 28. -/
theorem rs_R010_ueqv_R010NYN_partial_28_0048_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_28_0048
        rs_R010_ueqv_R010NYN_generator_28_0000_0061 =
      rs_R010_ueqv_R010NYN_partial_28_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010NYN_coefficient_28_0049 : Poly :=
[
  term ((1759 : Rat) / 10) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 49 for generator 28. -/
def rs_R010_ueqv_R010NYN_partial_28_0049 : Poly :=
[
  term ((1759 : Rat) / 5) [(2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1759 : Rat) / 10) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((1759 : Rat) / 5) [(3, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1759 : Rat) / 10) [(3, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 28. -/
theorem rs_R010_ueqv_R010NYN_partial_28_0049_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_28_0049
        rs_R010_ueqv_R010NYN_generator_28_0000_0061 =
      rs_R010_ueqv_R010NYN_partial_28_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010NYN_coefficient_28_0050 : Poly :=
[
  term ((-366336 : Rat) / 2995) [(11, 1), (15, 3)]
]

/-- Partial product 50 for generator 28. -/
def rs_R010_ueqv_R010NYN_partial_28_0050 : Poly :=
[
  term ((-732672 : Rat) / 2995) [(2, 1), (11, 1), (14, 1), (15, 3)],
  term ((366336 : Rat) / 2995) [(2, 2), (11, 1), (15, 3)],
  term ((-732672 : Rat) / 2995) [(3, 1), (11, 1), (15, 4)],
  term ((366336 : Rat) / 2995) [(3, 2), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 28. -/
theorem rs_R010_ueqv_R010NYN_partial_28_0050_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_28_0050
        rs_R010_ueqv_R010NYN_generator_28_0000_0061 =
      rs_R010_ueqv_R010NYN_partial_28_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010NYN_coefficient_28_0051 : Poly :=
[
  term ((198 : Rat) / 5) [(11, 1), (15, 3), (16, 1)]
]

/-- Partial product 51 for generator 28. -/
def rs_R010_ueqv_R010NYN_partial_28_0051 : Poly :=
[
  term ((396 : Rat) / 5) [(2, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((-198 : Rat) / 5) [(2, 2), (11, 1), (15, 3), (16, 1)],
  term ((396 : Rat) / 5) [(3, 1), (11, 1), (15, 4), (16, 1)],
  term ((-198 : Rat) / 5) [(3, 2), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 28. -/
theorem rs_R010_ueqv_R010NYN_partial_28_0051_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_28_0051
        rs_R010_ueqv_R010NYN_generator_28_0000_0061 =
      rs_R010_ueqv_R010NYN_partial_28_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010NYN_coefficient_28_0052 : Poly :=
[
  term ((2798928 : Rat) / 2995) [(11, 2)]
]

/-- Partial product 52 for generator 28. -/
def rs_R010_ueqv_R010NYN_partial_28_0052 : Poly :=
[
  term ((5597856 : Rat) / 2995) [(2, 1), (11, 2), (14, 1)],
  term ((-2798928 : Rat) / 2995) [(2, 2), (11, 2)],
  term ((5597856 : Rat) / 2995) [(3, 1), (11, 2), (15, 1)],
  term ((-2798928 : Rat) / 2995) [(3, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 28. -/
theorem rs_R010_ueqv_R010NYN_partial_28_0052_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_28_0052
        rs_R010_ueqv_R010NYN_generator_28_0000_0061 =
      rs_R010_ueqv_R010NYN_partial_28_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010NYN_coefficient_28_0053 : Poly :=
[
  term ((-2892672 : Rat) / 2995) [(11, 2), (14, 1)]
]

/-- Partial product 53 for generator 28. -/
def rs_R010_ueqv_R010NYN_partial_28_0053 : Poly :=
[
  term ((-5785344 : Rat) / 2995) [(2, 1), (11, 2), (14, 2)],
  term ((2892672 : Rat) / 2995) [(2, 2), (11, 2), (14, 1)],
  term ((-5785344 : Rat) / 2995) [(3, 1), (11, 2), (14, 1), (15, 1)],
  term ((2892672 : Rat) / 2995) [(3, 2), (11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 28. -/
theorem rs_R010_ueqv_R010NYN_partial_28_0053_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_28_0053
        rs_R010_ueqv_R010NYN_generator_28_0000_0061 =
      rs_R010_ueqv_R010NYN_partial_28_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010NYN_coefficient_28_0054 : Poly :=
[
  term ((482112 : Rat) / 2995) [(11, 2), (15, 2)]
]

/-- Partial product 54 for generator 28. -/
def rs_R010_ueqv_R010NYN_partial_28_0054 : Poly :=
[
  term ((964224 : Rat) / 2995) [(2, 1), (11, 2), (14, 1), (15, 2)],
  term ((-482112 : Rat) / 2995) [(2, 2), (11, 2), (15, 2)],
  term ((964224 : Rat) / 2995) [(3, 1), (11, 2), (15, 3)],
  term ((-482112 : Rat) / 2995) [(3, 2), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 28. -/
theorem rs_R010_ueqv_R010NYN_partial_28_0054_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_28_0054
        rs_R010_ueqv_R010NYN_generator_28_0000_0061 =
      rs_R010_ueqv_R010NYN_partial_28_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010NYN_coefficient_28_0055 : Poly :=
[
  term ((370376 : Rat) / 2995) [(13, 1), (15, 1)]
]

/-- Partial product 55 for generator 28. -/
def rs_R010_ueqv_R010NYN_partial_28_0055 : Poly :=
[
  term ((740752 : Rat) / 2995) [(2, 1), (13, 1), (14, 1), (15, 1)],
  term ((-370376 : Rat) / 2995) [(2, 2), (13, 1), (15, 1)],
  term ((740752 : Rat) / 2995) [(3, 1), (13, 1), (15, 2)],
  term ((-370376 : Rat) / 2995) [(3, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 28. -/
theorem rs_R010_ueqv_R010NYN_partial_28_0055_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_28_0055
        rs_R010_ueqv_R010NYN_generator_28_0000_0061 =
      rs_R010_ueqv_R010NYN_partial_28_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010NYN_coefficient_28_0056 : Poly :=
[
  term ((-78 : Rat) / 5) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 56 for generator 28. -/
def rs_R010_ueqv_R010NYN_partial_28_0056 : Poly :=
[
  term ((-156 : Rat) / 5) [(2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((78 : Rat) / 5) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((-156 : Rat) / 5) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((78 : Rat) / 5) [(3, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 28. -/
theorem rs_R010_ueqv_R010NYN_partial_28_0056_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_28_0056
        rs_R010_ueqv_R010NYN_generator_28_0000_0061 =
      rs_R010_ueqv_R010NYN_partial_28_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010NYN_coefficient_28_0057 : Poly :=
[
  term ((21072 : Rat) / 599) [(14, 1)]
]

/-- Partial product 57 for generator 28. -/
def rs_R010_ueqv_R010NYN_partial_28_0057 : Poly :=
[
  term ((42144 : Rat) / 599) [(2, 1), (14, 2)],
  term ((-21072 : Rat) / 599) [(2, 2), (14, 1)],
  term ((42144 : Rat) / 599) [(3, 1), (14, 1), (15, 1)],
  term ((-21072 : Rat) / 599) [(3, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 28. -/
theorem rs_R010_ueqv_R010NYN_partial_28_0057_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_28_0057
        rs_R010_ueqv_R010NYN_generator_28_0000_0061 =
      rs_R010_ueqv_R010NYN_partial_28_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010NYN_coefficient_28_0058 : Poly :=
[
  term ((-2423808 : Rat) / 2995) [(14, 1), (15, 2)]
]

/-- Partial product 58 for generator 28. -/
def rs_R010_ueqv_R010NYN_partial_28_0058 : Poly :=
[
  term ((-4847616 : Rat) / 2995) [(2, 1), (14, 2), (15, 2)],
  term ((2423808 : Rat) / 2995) [(2, 2), (14, 1), (15, 2)],
  term ((-4847616 : Rat) / 2995) [(3, 1), (14, 1), (15, 3)],
  term ((2423808 : Rat) / 2995) [(3, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 28. -/
theorem rs_R010_ueqv_R010NYN_partial_28_0058_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_28_0058
        rs_R010_ueqv_R010NYN_generator_28_0000_0061 =
      rs_R010_ueqv_R010NYN_partial_28_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010NYN_coefficient_28_0059 : Poly :=
[
  term ((534 : Rat) / 5) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 59 for generator 28. -/
def rs_R010_ueqv_R010NYN_partial_28_0059 : Poly :=
[
  term ((1068 : Rat) / 5) [(2, 1), (14, 2), (15, 2), (16, 1)],
  term ((-534 : Rat) / 5) [(2, 2), (14, 1), (15, 2), (16, 1)],
  term ((1068 : Rat) / 5) [(3, 1), (14, 1), (15, 3), (16, 1)],
  term ((-534 : Rat) / 5) [(3, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 28. -/
theorem rs_R010_ueqv_R010NYN_partial_28_0059_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_28_0059
        rs_R010_ueqv_R010NYN_generator_28_0000_0061 =
      rs_R010_ueqv_R010NYN_partial_28_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010NYN_coefficient_28_0060 : Poly :=
[
  term ((254504 : Rat) / 2995) [(15, 2)]
]

/-- Partial product 60 for generator 28. -/
def rs_R010_ueqv_R010NYN_partial_28_0060 : Poly :=
[
  term ((509008 : Rat) / 2995) [(2, 1), (14, 1), (15, 2)],
  term ((-254504 : Rat) / 2995) [(2, 2), (15, 2)],
  term ((509008 : Rat) / 2995) [(3, 1), (15, 3)],
  term ((-254504 : Rat) / 2995) [(3, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 28. -/
theorem rs_R010_ueqv_R010NYN_partial_28_0060_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_28_0060
        rs_R010_ueqv_R010NYN_generator_28_0000_0061 =
      rs_R010_ueqv_R010NYN_partial_28_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010NYN_coefficient_28_0061 : Poly :=
[
  term ((-47 : Rat) / 5) [(15, 2), (16, 1)]
]

/-- Partial product 61 for generator 28. -/
def rs_R010_ueqv_R010NYN_partial_28_0061 : Poly :=
[
  term ((-94 : Rat) / 5) [(2, 1), (14, 1), (15, 2), (16, 1)],
  term ((47 : Rat) / 5) [(2, 2), (15, 2), (16, 1)],
  term ((-94 : Rat) / 5) [(3, 1), (15, 3), (16, 1)],
  term ((47 : Rat) / 5) [(3, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 28. -/
theorem rs_R010_ueqv_R010NYN_partial_28_0061_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_28_0061
        rs_R010_ueqv_R010NYN_generator_28_0000_0061 =
      rs_R010_ueqv_R010NYN_partial_28_0061 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010NYN_partials_28_0000_0061 : List Poly :=
[
  rs_R010_ueqv_R010NYN_partial_28_0000,
  rs_R010_ueqv_R010NYN_partial_28_0001,
  rs_R010_ueqv_R010NYN_partial_28_0002,
  rs_R010_ueqv_R010NYN_partial_28_0003,
  rs_R010_ueqv_R010NYN_partial_28_0004,
  rs_R010_ueqv_R010NYN_partial_28_0005,
  rs_R010_ueqv_R010NYN_partial_28_0006,
  rs_R010_ueqv_R010NYN_partial_28_0007,
  rs_R010_ueqv_R010NYN_partial_28_0008,
  rs_R010_ueqv_R010NYN_partial_28_0009,
  rs_R010_ueqv_R010NYN_partial_28_0010,
  rs_R010_ueqv_R010NYN_partial_28_0011,
  rs_R010_ueqv_R010NYN_partial_28_0012,
  rs_R010_ueqv_R010NYN_partial_28_0013,
  rs_R010_ueqv_R010NYN_partial_28_0014,
  rs_R010_ueqv_R010NYN_partial_28_0015,
  rs_R010_ueqv_R010NYN_partial_28_0016,
  rs_R010_ueqv_R010NYN_partial_28_0017,
  rs_R010_ueqv_R010NYN_partial_28_0018,
  rs_R010_ueqv_R010NYN_partial_28_0019,
  rs_R010_ueqv_R010NYN_partial_28_0020,
  rs_R010_ueqv_R010NYN_partial_28_0021,
  rs_R010_ueqv_R010NYN_partial_28_0022,
  rs_R010_ueqv_R010NYN_partial_28_0023,
  rs_R010_ueqv_R010NYN_partial_28_0024,
  rs_R010_ueqv_R010NYN_partial_28_0025,
  rs_R010_ueqv_R010NYN_partial_28_0026,
  rs_R010_ueqv_R010NYN_partial_28_0027,
  rs_R010_ueqv_R010NYN_partial_28_0028,
  rs_R010_ueqv_R010NYN_partial_28_0029,
  rs_R010_ueqv_R010NYN_partial_28_0030,
  rs_R010_ueqv_R010NYN_partial_28_0031,
  rs_R010_ueqv_R010NYN_partial_28_0032,
  rs_R010_ueqv_R010NYN_partial_28_0033,
  rs_R010_ueqv_R010NYN_partial_28_0034,
  rs_R010_ueqv_R010NYN_partial_28_0035,
  rs_R010_ueqv_R010NYN_partial_28_0036,
  rs_R010_ueqv_R010NYN_partial_28_0037,
  rs_R010_ueqv_R010NYN_partial_28_0038,
  rs_R010_ueqv_R010NYN_partial_28_0039,
  rs_R010_ueqv_R010NYN_partial_28_0040,
  rs_R010_ueqv_R010NYN_partial_28_0041,
  rs_R010_ueqv_R010NYN_partial_28_0042,
  rs_R010_ueqv_R010NYN_partial_28_0043,
  rs_R010_ueqv_R010NYN_partial_28_0044,
  rs_R010_ueqv_R010NYN_partial_28_0045,
  rs_R010_ueqv_R010NYN_partial_28_0046,
  rs_R010_ueqv_R010NYN_partial_28_0047,
  rs_R010_ueqv_R010NYN_partial_28_0048,
  rs_R010_ueqv_R010NYN_partial_28_0049,
  rs_R010_ueqv_R010NYN_partial_28_0050,
  rs_R010_ueqv_R010NYN_partial_28_0051,
  rs_R010_ueqv_R010NYN_partial_28_0052,
  rs_R010_ueqv_R010NYN_partial_28_0053,
  rs_R010_ueqv_R010NYN_partial_28_0054,
  rs_R010_ueqv_R010NYN_partial_28_0055,
  rs_R010_ueqv_R010NYN_partial_28_0056,
  rs_R010_ueqv_R010NYN_partial_28_0057,
  rs_R010_ueqv_R010NYN_partial_28_0058,
  rs_R010_ueqv_R010NYN_partial_28_0059,
  rs_R010_ueqv_R010NYN_partial_28_0060,
  rs_R010_ueqv_R010NYN_partial_28_0061
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010NYN_block_28_0000_0061 : Poly :=
[
  term ((-488448 : Rat) / 2995) [(0, 1), (2, 1), (11, 1), (14, 1), (15, 1)],
  term ((264 : Rat) / 5) [(0, 1), (2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((642816 : Rat) / 2995) [(0, 1), (2, 1), (11, 2), (14, 1)],
  term (-12 : Rat) [(0, 1), (2, 1), (14, 1)],
  term (6 : Rat) [(0, 1), (2, 2)],
  term ((244224 : Rat) / 2995) [(0, 1), (2, 2), (11, 1), (15, 1)],
  term ((-132 : Rat) / 5) [(0, 1), (2, 2), (11, 1), (15, 1), (16, 1)],
  term ((-321408 : Rat) / 2995) [(0, 1), (2, 2), (11, 2)],
  term ((-488448 : Rat) / 2995) [(0, 1), (3, 1), (11, 1), (15, 2)],
  term ((264 : Rat) / 5) [(0, 1), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((642816 : Rat) / 2995) [(0, 1), (3, 1), (11, 2), (15, 1)],
  term (-12 : Rat) [(0, 1), (3, 1), (15, 1)],
  term (6 : Rat) [(0, 1), (3, 2)],
  term ((244224 : Rat) / 2995) [(0, 1), (3, 2), (11, 1), (15, 1)],
  term ((-132 : Rat) / 5) [(0, 1), (3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-321408 : Rat) / 2995) [(0, 1), (3, 2), (11, 2)],
  term ((26784 : Rat) / 2995) [(1, 1), (2, 1), (11, 1), (14, 1)],
  term ((388224 : Rat) / 599) [(1, 1), (2, 1), (11, 1), (14, 1), (15, 2)],
  term ((-528 : Rat) / 5) [(1, 1), (2, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-214272 : Rat) / 2995) [(1, 1), (2, 1), (11, 1), (14, 2)],
  term ((-1285632 : Rat) / 2995) [(1, 1), (2, 1), (11, 2), (14, 1), (15, 1)],
  term ((96168 : Rat) / 2995) [(1, 1), (2, 1), (14, 1), (15, 1)],
  term ((-14 : Rat) / 5) [(1, 1), (2, 1), (14, 1), (15, 1), (16, 1)],
  term ((-196992 : Rat) / 2995) [(1, 1), (2, 1), (14, 1), (15, 3)],
  term ((-24 : Rat) / 5) [(1, 1), (2, 1), (14, 1), (15, 3), (16, 1)],
  term ((341376 : Rat) / 2995) [(1, 1), (2, 1), (14, 2), (15, 1)],
  term ((-128 : Rat) / 5) [(1, 1), (2, 1), (14, 2), (15, 1), (16, 1)],
  term ((-13392 : Rat) / 2995) [(1, 1), (2, 2), (11, 1)],
  term ((107136 : Rat) / 2995) [(1, 1), (2, 2), (11, 1), (14, 1)],
  term ((-194112 : Rat) / 599) [(1, 1), (2, 2), (11, 1), (15, 2)],
  term ((264 : Rat) / 5) [(1, 1), (2, 2), (11, 1), (15, 2), (16, 1)],
  term ((642816 : Rat) / 2995) [(1, 1), (2, 2), (11, 2), (15, 1)],
  term ((-170688 : Rat) / 2995) [(1, 1), (2, 2), (14, 1), (15, 1)],
  term ((64 : Rat) / 5) [(1, 1), (2, 2), (14, 1), (15, 1), (16, 1)],
  term ((-48084 : Rat) / 2995) [(1, 1), (2, 2), (15, 1)],
  term ((7 : Rat) / 5) [(1, 1), (2, 2), (15, 1), (16, 1)],
  term ((98496 : Rat) / 2995) [(1, 1), (2, 2), (15, 3)],
  term ((12 : Rat) / 5) [(1, 1), (2, 2), (15, 3), (16, 1)],
  term ((-214272 : Rat) / 2995) [(1, 1), (3, 1), (11, 1), (14, 1), (15, 1)],
  term ((26784 : Rat) / 2995) [(1, 1), (3, 1), (11, 1), (15, 1)],
  term ((388224 : Rat) / 599) [(1, 1), (3, 1), (11, 1), (15, 3)],
  term ((-528 : Rat) / 5) [(1, 1), (3, 1), (11, 1), (15, 3), (16, 1)],
  term ((-1285632 : Rat) / 2995) [(1, 1), (3, 1), (11, 2), (15, 2)],
  term ((341376 : Rat) / 2995) [(1, 1), (3, 1), (14, 1), (15, 2)],
  term ((-128 : Rat) / 5) [(1, 1), (3, 1), (14, 1), (15, 2), (16, 1)],
  term ((96168 : Rat) / 2995) [(1, 1), (3, 1), (15, 2)],
  term ((-14 : Rat) / 5) [(1, 1), (3, 1), (15, 2), (16, 1)],
  term ((-196992 : Rat) / 2995) [(1, 1), (3, 1), (15, 4)],
  term ((-24 : Rat) / 5) [(1, 1), (3, 1), (15, 4), (16, 1)],
  term ((-13392 : Rat) / 2995) [(1, 1), (3, 2), (11, 1)],
  term ((107136 : Rat) / 2995) [(1, 1), (3, 2), (11, 1), (14, 1)],
  term ((-194112 : Rat) / 599) [(1, 1), (3, 2), (11, 1), (15, 2)],
  term ((264 : Rat) / 5) [(1, 1), (3, 2), (11, 1), (15, 2), (16, 1)],
  term ((642816 : Rat) / 2995) [(1, 1), (3, 2), (11, 2), (15, 1)],
  term ((-170688 : Rat) / 2995) [(1, 1), (3, 2), (14, 1), (15, 1)],
  term ((64 : Rat) / 5) [(1, 1), (3, 2), (14, 1), (15, 1), (16, 1)],
  term ((-48084 : Rat) / 2995) [(1, 1), (3, 2), (15, 1)],
  term ((7 : Rat) / 5) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((98496 : Rat) / 2995) [(1, 1), (3, 2), (15, 3)],
  term ((12 : Rat) / 5) [(1, 1), (3, 2), (15, 3), (16, 1)],
  term ((2571264 : Rat) / 2995) [(2, 1), (3, 1), (11, 1), (14, 1)],
  term ((-5142528 : Rat) / 2995) [(2, 1), (3, 1), (11, 1), (14, 2)],
  term (-24 : Rat) [(2, 1), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((-2685432 : Rat) / 2995) [(2, 1), (3, 1), (14, 1), (15, 1)],
  term ((596 : Rat) / 5) [(2, 1), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((5514624 : Rat) / 2995) [(2, 1), (3, 1), (14, 2), (15, 1)],
  term ((-1272 : Rat) / 5) [(2, 1), (3, 1), (14, 2), (15, 1), (16, 1)],
  term (12 : Rat) [(2, 1), (3, 1), (15, 1)],
  term (-6 : Rat) [(2, 1), (3, 2)],
  term (12 : Rat) [(2, 1), (3, 2), (11, 1), (15, 1), (16, 1)],
  term ((1714176 : Rat) / 2995) [(2, 1), (8, 1), (11, 1), (13, 1), (14, 1)],
  term ((1806624 : Rat) / 2995) [(2, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((-1728 : Rat) / 5) [(2, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5303232 : Rat) / 2995) [(2, 1), (8, 1), (11, 2), (14, 1)],
  term ((-1838208 : Rat) / 2995) [(2, 1), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((424 : Rat) / 5) [(2, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(2, 1), (8, 1), (14, 1)],
  term ((3676416 : Rat) / 2995) [(2, 1), (8, 1), (14, 1), (15, 2)],
  term ((-848 : Rat) / 5) [(2, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((512064 : Rat) / 2995) [(2, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-192 : Rat) / 5) [(2, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-80352 : Rat) / 2995) [(2, 1), (9, 1), (11, 1), (14, 1)],
  term ((916992 : Rat) / 2995) [(2, 1), (9, 1), (11, 1), (14, 1), (15, 2)],
  term ((-144 : Rat) / 5) [(2, 1), (9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-321408 : Rat) / 2995) [(2, 1), (9, 1), (11, 2), (13, 1), (14, 1)],
  term ((-642816 : Rat) / 2995) [(2, 1), (9, 1), (11, 2), (14, 1), (15, 1)],
  term ((88296 : Rat) / 2995) [(2, 1), (9, 1), (14, 1), (15, 1)],
  term ((2 : Rat) / 5) [(2, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-196992 : Rat) / 2995) [(2, 1), (9, 1), (14, 1), (15, 3)],
  term ((-24 : Rat) / 5) [(2, 1), (9, 1), (14, 1), (15, 3), (16, 1)],
  term (12 : Rat) [(2, 1), (10, 1), (14, 1)],
  term ((-651744 : Rat) / 2995) [(2, 1), (11, 1), (13, 1), (14, 1)],
  term ((-5583384 : Rat) / 2995) [(2, 1), (11, 1), (14, 1), (15, 1)],
  term ((1759 : Rat) / 5) [(2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-732672 : Rat) / 2995) [(2, 1), (11, 1), (14, 1), (15, 3)],
  term ((396 : Rat) / 5) [(2, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((9967104 : Rat) / 2995) [(2, 1), (11, 1), (14, 2), (15, 1)],
  term ((-1896 : Rat) / 5) [(2, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((5597856 : Rat) / 2995) [(2, 1), (11, 2), (14, 1)],
  term ((964224 : Rat) / 2995) [(2, 1), (11, 2), (14, 1), (15, 2)],
  term ((-5785344 : Rat) / 2995) [(2, 1), (11, 2), (14, 2)],
  term ((740752 : Rat) / 2995) [(2, 1), (13, 1), (14, 1), (15, 1)],
  term ((-156 : Rat) / 5) [(2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-21608 : Rat) / 599) [(2, 1), (14, 1)],
  term ((509008 : Rat) / 2995) [(2, 1), (14, 1), (15, 2)],
  term ((-94 : Rat) / 5) [(2, 1), (14, 1), (15, 2), (16, 1)],
  term ((42144 : Rat) / 599) [(2, 1), (14, 2)],
  term ((-4847616 : Rat) / 2995) [(2, 1), (14, 2), (15, 2)],
  term ((1068 : Rat) / 5) [(2, 1), (14, 2), (15, 2), (16, 1)],
  term ((10804 : Rat) / 599) [(2, 2)],
  term ((-1285632 : Rat) / 2995) [(2, 2), (3, 1), (11, 1)],
  term ((2571264 : Rat) / 2995) [(2, 2), (3, 1), (11, 1), (14, 1)],
  term ((-2757312 : Rat) / 2995) [(2, 2), (3, 1), (14, 1), (15, 1)],
  term ((636 : Rat) / 5) [(2, 2), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((1342716 : Rat) / 2995) [(2, 2), (3, 1), (15, 1)],
  term ((-298 : Rat) / 5) [(2, 2), (3, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(2, 2), (8, 1)],
  term ((-857088 : Rat) / 2995) [(2, 2), (8, 1), (11, 1), (13, 1)],
  term ((-903312 : Rat) / 2995) [(2, 2), (8, 1), (11, 1), (15, 1)],
  term ((864 : Rat) / 5) [(2, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((2651616 : Rat) / 2995) [(2, 2), (8, 1), (11, 2)],
  term ((919104 : Rat) / 2995) [(2, 2), (8, 1), (13, 1), (15, 1)],
  term ((-212 : Rat) / 5) [(2, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1838208 : Rat) / 2995) [(2, 2), (8, 1), (15, 2)],
  term ((424 : Rat) / 5) [(2, 2), (8, 1), (15, 2), (16, 1)],
  term ((40176 : Rat) / 2995) [(2, 2), (9, 1), (11, 1)],
  term ((-256032 : Rat) / 2995) [(2, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((96 : Rat) / 5) [(2, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-458496 : Rat) / 2995) [(2, 2), (9, 1), (11, 1), (15, 2)],
  term ((72 : Rat) / 5) [(2, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((160704 : Rat) / 2995) [(2, 2), (9, 1), (11, 2), (13, 1)],
  term ((321408 : Rat) / 2995) [(2, 2), (9, 1), (11, 2), (15, 1)],
  term ((-44148 : Rat) / 2995) [(2, 2), (9, 1), (15, 1)],
  term ((-1 : Rat) / 5) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((98496 : Rat) / 2995) [(2, 2), (9, 1), (15, 3)],
  term ((12 : Rat) / 5) [(2, 2), (9, 1), (15, 3), (16, 1)],
  term (-6 : Rat) [(2, 2), (10, 1)],
  term ((325872 : Rat) / 2995) [(2, 2), (11, 1), (13, 1)],
  term ((-4983552 : Rat) / 2995) [(2, 2), (11, 1), (14, 1), (15, 1)],
  term ((828 : Rat) / 5) [(2, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((2791692 : Rat) / 2995) [(2, 2), (11, 1), (15, 1)],
  term ((-1759 : Rat) / 10) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((366336 : Rat) / 2995) [(2, 2), (11, 1), (15, 3)],
  term ((-198 : Rat) / 5) [(2, 2), (11, 1), (15, 3), (16, 1)],
  term ((-2798928 : Rat) / 2995) [(2, 2), (11, 2)],
  term ((2892672 : Rat) / 2995) [(2, 2), (11, 2), (14, 1)],
  term ((-482112 : Rat) / 2995) [(2, 2), (11, 2), (15, 2)],
  term ((-370376 : Rat) / 2995) [(2, 2), (13, 1), (15, 1)],
  term ((78 : Rat) / 5) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((-13884 : Rat) / 599) [(2, 2), (14, 1)],
  term ((2423808 : Rat) / 2995) [(2, 2), (14, 1), (15, 2)],
  term ((-534 : Rat) / 5) [(2, 2), (14, 1), (15, 2), (16, 1)],
  term ((-254504 : Rat) / 2995) [(2, 2), (15, 2)],
  term ((47 : Rat) / 5) [(2, 2), (15, 2), (16, 1)],
  term (-6 : Rat) [(2, 3)],
  term (12 : Rat) [(2, 3), (11, 1), (15, 1), (16, 1)],
  term ((1714176 : Rat) / 2995) [(3, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((1806624 : Rat) / 2995) [(3, 1), (8, 1), (11, 1), (15, 2)],
  term ((-1728 : Rat) / 5) [(3, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-5303232 : Rat) / 2995) [(3, 1), (8, 1), (11, 2), (15, 1)],
  term ((-1838208 : Rat) / 2995) [(3, 1), (8, 1), (13, 1), (15, 2)],
  term ((424 : Rat) / 5) [(3, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term (12 : Rat) [(3, 1), (8, 1), (15, 1)],
  term ((3676416 : Rat) / 2995) [(3, 1), (8, 1), (15, 3)],
  term ((-848 : Rat) / 5) [(3, 1), (8, 1), (15, 3), (16, 1)],
  term ((512064 : Rat) / 2995) [(3, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((-192 : Rat) / 5) [(3, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-80352 : Rat) / 2995) [(3, 1), (9, 1), (11, 1), (15, 1)],
  term ((916992 : Rat) / 2995) [(3, 1), (9, 1), (11, 1), (15, 3)],
  term ((-144 : Rat) / 5) [(3, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((-321408 : Rat) / 2995) [(3, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((-642816 : Rat) / 2995) [(3, 1), (9, 1), (11, 2), (15, 2)],
  term ((88296 : Rat) / 2995) [(3, 1), (9, 1), (15, 2)],
  term ((2 : Rat) / 5) [(3, 1), (9, 1), (15, 2), (16, 1)],
  term ((-196992 : Rat) / 2995) [(3, 1), (9, 1), (15, 4)],
  term ((-24 : Rat) / 5) [(3, 1), (9, 1), (15, 4), (16, 1)],
  term (12 : Rat) [(3, 1), (10, 1), (15, 1)],
  term ((-651744 : Rat) / 2995) [(3, 1), (11, 1), (13, 1), (15, 1)],
  term ((9967104 : Rat) / 2995) [(3, 1), (11, 1), (14, 1), (15, 2)],
  term ((-1896 : Rat) / 5) [(3, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-5583384 : Rat) / 2995) [(3, 1), (11, 1), (15, 2)],
  term ((1759 : Rat) / 5) [(3, 1), (11, 1), (15, 2), (16, 1)],
  term ((-732672 : Rat) / 2995) [(3, 1), (11, 1), (15, 4)],
  term ((396 : Rat) / 5) [(3, 1), (11, 1), (15, 4), (16, 1)],
  term ((-5785344 : Rat) / 2995) [(3, 1), (11, 2), (14, 1), (15, 1)],
  term ((5597856 : Rat) / 2995) [(3, 1), (11, 2), (15, 1)],
  term ((964224 : Rat) / 2995) [(3, 1), (11, 2), (15, 3)],
  term ((740752 : Rat) / 2995) [(3, 1), (13, 1), (15, 2)],
  term ((-156 : Rat) / 5) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((42144 : Rat) / 599) [(3, 1), (14, 1), (15, 1)],
  term ((-4847616 : Rat) / 2995) [(3, 1), (14, 1), (15, 3)],
  term ((1068 : Rat) / 5) [(3, 1), (14, 1), (15, 3), (16, 1)],
  term ((-21608 : Rat) / 599) [(3, 1), (15, 1)],
  term ((509008 : Rat) / 2995) [(3, 1), (15, 3)],
  term ((-94 : Rat) / 5) [(3, 1), (15, 3), (16, 1)],
  term ((10804 : Rat) / 599) [(3, 2)],
  term (-6 : Rat) [(3, 2), (8, 1)],
  term ((-857088 : Rat) / 2995) [(3, 2), (8, 1), (11, 1), (13, 1)],
  term ((-903312 : Rat) / 2995) [(3, 2), (8, 1), (11, 1), (15, 1)],
  term ((864 : Rat) / 5) [(3, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((2651616 : Rat) / 2995) [(3, 2), (8, 1), (11, 2)],
  term ((919104 : Rat) / 2995) [(3, 2), (8, 1), (13, 1), (15, 1)],
  term ((-212 : Rat) / 5) [(3, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1838208 : Rat) / 2995) [(3, 2), (8, 1), (15, 2)],
  term ((424 : Rat) / 5) [(3, 2), (8, 1), (15, 2), (16, 1)],
  term ((40176 : Rat) / 2995) [(3, 2), (9, 1), (11, 1)],
  term ((-256032 : Rat) / 2995) [(3, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((96 : Rat) / 5) [(3, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-458496 : Rat) / 2995) [(3, 2), (9, 1), (11, 1), (15, 2)],
  term ((72 : Rat) / 5) [(3, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((160704 : Rat) / 2995) [(3, 2), (9, 1), (11, 2), (13, 1)],
  term ((321408 : Rat) / 2995) [(3, 2), (9, 1), (11, 2), (15, 1)],
  term ((-44148 : Rat) / 2995) [(3, 2), (9, 1), (15, 1)],
  term ((-1 : Rat) / 5) [(3, 2), (9, 1), (15, 1), (16, 1)],
  term ((98496 : Rat) / 2995) [(3, 2), (9, 1), (15, 3)],
  term ((12 : Rat) / 5) [(3, 2), (9, 1), (15, 3), (16, 1)],
  term (-6 : Rat) [(3, 2), (10, 1)],
  term ((325872 : Rat) / 2995) [(3, 2), (11, 1), (13, 1)],
  term ((-2025216 : Rat) / 599) [(3, 2), (11, 1), (14, 1), (15, 1)],
  term ((948 : Rat) / 5) [(3, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((5362956 : Rat) / 2995) [(3, 2), (11, 1), (15, 1)],
  term ((-1759 : Rat) / 10) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((366336 : Rat) / 2995) [(3, 2), (11, 1), (15, 3)],
  term ((-198 : Rat) / 5) [(3, 2), (11, 1), (15, 3), (16, 1)],
  term ((-2798928 : Rat) / 2995) [(3, 2), (11, 2)],
  term ((2892672 : Rat) / 2995) [(3, 2), (11, 2), (14, 1)],
  term ((-482112 : Rat) / 2995) [(3, 2), (11, 2), (15, 2)],
  term ((-370376 : Rat) / 2995) [(3, 2), (13, 1), (15, 1)],
  term ((78 : Rat) / 5) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-21072 : Rat) / 599) [(3, 2), (14, 1)],
  term ((7938432 : Rat) / 2995) [(3, 2), (14, 1), (15, 2)],
  term ((-1806 : Rat) / 5) [(3, 2), (14, 1), (15, 2), (16, 1)],
  term ((-2939936 : Rat) / 2995) [(3, 2), (15, 2)],
  term ((643 : Rat) / 5) [(3, 2), (15, 2), (16, 1)],
  term ((-1285632 : Rat) / 2995) [(3, 3), (11, 1)],
  term ((2571264 : Rat) / 2995) [(3, 3), (11, 1), (14, 1)],
  term ((-2757312 : Rat) / 2995) [(3, 3), (14, 1), (15, 1)],
  term ((636 : Rat) / 5) [(3, 3), (14, 1), (15, 1), (16, 1)],
  term ((1342716 : Rat) / 2995) [(3, 3), (15, 1)],
  term ((-298 : Rat) / 5) [(3, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 28, terms 0 through 61. -/
theorem rs_R010_ueqv_R010NYN_block_28_0000_0061_valid :
    checkProductSumEq rs_R010_ueqv_R010NYN_partials_28_0000_0061
      rs_R010_ueqv_R010NYN_block_28_0000_0061 = true := by
  native_decide

end R010UeqvR010NYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
