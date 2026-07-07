/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010NYN, term block 18:0-29

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010NYNTermShards

/-- Generator polynomial 18 for relaxed split surplus certificate `R010:u=v:R010NYN`. -/
def rs_R010_ueqv_R010NYN_generator_18_0000_0029 : Poly :=
[
  term (-2 : Rat) [(0, 1), (6, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (7, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(6, 1), (14, 1)],
  term (2 : Rat) [(7, 1), (15, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010NYN_coefficient_18_0000 : Poly :=
[
  term ((-21072 : Rat) / 599) [(0, 1)]
]

/-- Partial product 0 for generator 18. -/
def rs_R010_ueqv_R010NYN_partial_18_0000 : Poly :=
[
  term ((42144 : Rat) / 599) [(0, 1), (1, 1), (7, 1)],
  term ((-21072 : Rat) / 599) [(0, 1), (1, 2)],
  term ((-42144 : Rat) / 599) [(0, 1), (6, 1), (14, 1)],
  term ((-42144 : Rat) / 599) [(0, 1), (7, 1), (15, 1)],
  term ((21072 : Rat) / 599) [(0, 1), (14, 2)],
  term ((21072 : Rat) / 599) [(0, 1), (15, 2)],
  term ((42144 : Rat) / 599) [(0, 2), (6, 1)],
  term ((-21072 : Rat) / 599) [(0, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 18. -/
theorem rs_R010_ueqv_R010NYN_partial_18_0000_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_18_0000
        rs_R010_ueqv_R010NYN_generator_18_0000_0029 =
      rs_R010_ueqv_R010NYN_partial_18_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010NYN_coefficient_18_0001 : Poly :=
[
  term ((107136 : Rat) / 2995) [(0, 1), (1, 1), (11, 1)]
]

/-- Partial product 1 for generator 18. -/
def rs_R010_ueqv_R010NYN_partial_18_0001 : Poly :=
[
  term ((214272 : Rat) / 2995) [(0, 1), (1, 1), (6, 1), (11, 1), (14, 1)],
  term ((214272 : Rat) / 2995) [(0, 1), (1, 1), (7, 1), (11, 1), (15, 1)],
  term ((-107136 : Rat) / 2995) [(0, 1), (1, 1), (11, 1), (14, 2)],
  term ((-107136 : Rat) / 2995) [(0, 1), (1, 1), (11, 1), (15, 2)],
  term ((-214272 : Rat) / 2995) [(0, 1), (1, 2), (7, 1), (11, 1)],
  term ((107136 : Rat) / 2995) [(0, 1), (1, 3), (11, 1)],
  term ((-214272 : Rat) / 2995) [(0, 2), (1, 1), (6, 1), (11, 1)],
  term ((107136 : Rat) / 2995) [(0, 3), (1, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 18. -/
theorem rs_R010_ueqv_R010NYN_partial_18_0001_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_18_0001
        rs_R010_ueqv_R010NYN_generator_18_0000_0029 =
      rs_R010_ueqv_R010NYN_partial_18_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010NYN_coefficient_18_0002 : Poly :=
[
  term ((-170688 : Rat) / 2995) [(0, 1), (1, 1), (15, 1)]
]

/-- Partial product 2 for generator 18. -/
def rs_R010_ueqv_R010NYN_partial_18_0002 : Poly :=
[
  term ((-341376 : Rat) / 2995) [(0, 1), (1, 1), (6, 1), (14, 1), (15, 1)],
  term ((-341376 : Rat) / 2995) [(0, 1), (1, 1), (7, 1), (15, 2)],
  term ((170688 : Rat) / 2995) [(0, 1), (1, 1), (14, 2), (15, 1)],
  term ((170688 : Rat) / 2995) [(0, 1), (1, 1), (15, 3)],
  term ((341376 : Rat) / 2995) [(0, 1), (1, 2), (7, 1), (15, 1)],
  term ((-170688 : Rat) / 2995) [(0, 1), (1, 3), (15, 1)],
  term ((341376 : Rat) / 2995) [(0, 2), (1, 1), (6, 1), (15, 1)],
  term ((-170688 : Rat) / 2995) [(0, 3), (1, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 18. -/
theorem rs_R010_ueqv_R010NYN_partial_18_0002_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_18_0002
        rs_R010_ueqv_R010NYN_generator_18_0000_0029 =
      rs_R010_ueqv_R010NYN_partial_18_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010NYN_coefficient_18_0003 : Poly :=
[
  term ((64 : Rat) / 5) [(0, 1), (1, 1), (15, 1), (16, 1)]
]

/-- Partial product 3 for generator 18. -/
def rs_R010_ueqv_R010NYN_partial_18_0003 : Poly :=
[
  term ((128 : Rat) / 5) [(0, 1), (1, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((128 : Rat) / 5) [(0, 1), (1, 1), (7, 1), (15, 2), (16, 1)],
  term ((-64 : Rat) / 5) [(0, 1), (1, 1), (14, 2), (15, 1), (16, 1)],
  term ((-64 : Rat) / 5) [(0, 1), (1, 1), (15, 3), (16, 1)],
  term ((-128 : Rat) / 5) [(0, 1), (1, 2), (7, 1), (15, 1), (16, 1)],
  term ((64 : Rat) / 5) [(0, 1), (1, 3), (15, 1), (16, 1)],
  term ((-128 : Rat) / 5) [(0, 2), (1, 1), (6, 1), (15, 1), (16, 1)],
  term ((64 : Rat) / 5) [(0, 3), (1, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 18. -/
theorem rs_R010_ueqv_R010NYN_partial_18_0003_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_18_0003
        rs_R010_ueqv_R010NYN_generator_18_0000_0029 =
      rs_R010_ueqv_R010NYN_partial_18_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010NYN_coefficient_18_0004 : Poly :=
[
  term ((2571264 : Rat) / 2995) [(0, 1), (3, 1), (11, 1)]
]

/-- Partial product 4 for generator 18. -/
def rs_R010_ueqv_R010NYN_partial_18_0004 : Poly :=
[
  term ((-5142528 : Rat) / 2995) [(0, 1), (1, 1), (3, 1), (7, 1), (11, 1)],
  term ((2571264 : Rat) / 2995) [(0, 1), (1, 2), (3, 1), (11, 1)],
  term ((5142528 : Rat) / 2995) [(0, 1), (3, 1), (6, 1), (11, 1), (14, 1)],
  term ((5142528 : Rat) / 2995) [(0, 1), (3, 1), (7, 1), (11, 1), (15, 1)],
  term ((-2571264 : Rat) / 2995) [(0, 1), (3, 1), (11, 1), (14, 2)],
  term ((-2571264 : Rat) / 2995) [(0, 1), (3, 1), (11, 1), (15, 2)],
  term ((-5142528 : Rat) / 2995) [(0, 2), (3, 1), (6, 1), (11, 1)],
  term ((2571264 : Rat) / 2995) [(0, 3), (3, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 18. -/
theorem rs_R010_ueqv_R010NYN_partial_18_0004_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_18_0004
        rs_R010_ueqv_R010NYN_generator_18_0000_0029 =
      rs_R010_ueqv_R010NYN_partial_18_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010NYN_coefficient_18_0005 : Poly :=
[
  term ((-2757312 : Rat) / 2995) [(0, 1), (3, 1), (15, 1)]
]

/-- Partial product 5 for generator 18. -/
def rs_R010_ueqv_R010NYN_partial_18_0005 : Poly :=
[
  term ((5514624 : Rat) / 2995) [(0, 1), (1, 1), (3, 1), (7, 1), (15, 1)],
  term ((-2757312 : Rat) / 2995) [(0, 1), (1, 2), (3, 1), (15, 1)],
  term ((-5514624 : Rat) / 2995) [(0, 1), (3, 1), (6, 1), (14, 1), (15, 1)],
  term ((-5514624 : Rat) / 2995) [(0, 1), (3, 1), (7, 1), (15, 2)],
  term ((2757312 : Rat) / 2995) [(0, 1), (3, 1), (14, 2), (15, 1)],
  term ((2757312 : Rat) / 2995) [(0, 1), (3, 1), (15, 3)],
  term ((5514624 : Rat) / 2995) [(0, 2), (3, 1), (6, 1), (15, 1)],
  term ((-2757312 : Rat) / 2995) [(0, 3), (3, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 18. -/
theorem rs_R010_ueqv_R010NYN_partial_18_0005_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_18_0005
        rs_R010_ueqv_R010NYN_generator_18_0000_0029 =
      rs_R010_ueqv_R010NYN_partial_18_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010NYN_coefficient_18_0006 : Poly :=
[
  term ((636 : Rat) / 5) [(0, 1), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 6 for generator 18. -/
def rs_R010_ueqv_R010NYN_partial_18_0006 : Poly :=
[
  term ((-1272 : Rat) / 5) [(0, 1), (1, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((636 : Rat) / 5) [(0, 1), (1, 2), (3, 1), (15, 1), (16, 1)],
  term ((1272 : Rat) / 5) [(0, 1), (3, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((1272 : Rat) / 5) [(0, 1), (3, 1), (7, 1), (15, 2), (16, 1)],
  term ((-636 : Rat) / 5) [(0, 1), (3, 1), (14, 2), (15, 1), (16, 1)],
  term ((-636 : Rat) / 5) [(0, 1), (3, 1), (15, 3), (16, 1)],
  term ((-1272 : Rat) / 5) [(0, 2), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((636 : Rat) / 5) [(0, 3), (3, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 18. -/
theorem rs_R010_ueqv_R010NYN_partial_18_0006_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_18_0006
        rs_R010_ueqv_R010NYN_generator_18_0000_0029 =
      rs_R010_ueqv_R010NYN_partial_18_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010NYN_coefficient_18_0007 : Poly :=
[
  term ((-4983552 : Rat) / 2995) [(0, 1), (11, 1), (15, 1)]
]

/-- Partial product 7 for generator 18. -/
def rs_R010_ueqv_R010NYN_partial_18_0007 : Poly :=
[
  term ((9967104 : Rat) / 2995) [(0, 1), (1, 1), (7, 1), (11, 1), (15, 1)],
  term ((-4983552 : Rat) / 2995) [(0, 1), (1, 2), (11, 1), (15, 1)],
  term ((-9967104 : Rat) / 2995) [(0, 1), (6, 1), (11, 1), (14, 1), (15, 1)],
  term ((-9967104 : Rat) / 2995) [(0, 1), (7, 1), (11, 1), (15, 2)],
  term ((4983552 : Rat) / 2995) [(0, 1), (11, 1), (14, 2), (15, 1)],
  term ((4983552 : Rat) / 2995) [(0, 1), (11, 1), (15, 3)],
  term ((9967104 : Rat) / 2995) [(0, 2), (6, 1), (11, 1), (15, 1)],
  term ((-4983552 : Rat) / 2995) [(0, 3), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 18. -/
theorem rs_R010_ueqv_R010NYN_partial_18_0007_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_18_0007
        rs_R010_ueqv_R010NYN_generator_18_0000_0029 =
      rs_R010_ueqv_R010NYN_partial_18_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010NYN_coefficient_18_0008 : Poly :=
[
  term ((948 : Rat) / 5) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 8 for generator 18. -/
def rs_R010_ueqv_R010NYN_partial_18_0008 : Poly :=
[
  term ((-1896 : Rat) / 5) [(0, 1), (1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((948 : Rat) / 5) [(0, 1), (1, 2), (11, 1), (15, 1), (16, 1)],
  term ((1896 : Rat) / 5) [(0, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1896 : Rat) / 5) [(0, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-948 : Rat) / 5) [(0, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-948 : Rat) / 5) [(0, 1), (11, 1), (15, 3), (16, 1)],
  term ((-1896 : Rat) / 5) [(0, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((948 : Rat) / 5) [(0, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 18. -/
theorem rs_R010_ueqv_R010NYN_partial_18_0008_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_18_0008
        rs_R010_ueqv_R010NYN_generator_18_0000_0029 =
      rs_R010_ueqv_R010NYN_partial_18_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010NYN_coefficient_18_0009 : Poly :=
[
  term ((2892672 : Rat) / 2995) [(0, 1), (11, 2)]
]

/-- Partial product 9 for generator 18. -/
def rs_R010_ueqv_R010NYN_partial_18_0009 : Poly :=
[
  term ((-5785344 : Rat) / 2995) [(0, 1), (1, 1), (7, 1), (11, 2)],
  term ((2892672 : Rat) / 2995) [(0, 1), (1, 2), (11, 2)],
  term ((5785344 : Rat) / 2995) [(0, 1), (6, 1), (11, 2), (14, 1)],
  term ((5785344 : Rat) / 2995) [(0, 1), (7, 1), (11, 2), (15, 1)],
  term ((-2892672 : Rat) / 2995) [(0, 1), (11, 2), (14, 2)],
  term ((-2892672 : Rat) / 2995) [(0, 1), (11, 2), (15, 2)],
  term ((-5785344 : Rat) / 2995) [(0, 2), (6, 1), (11, 2)],
  term ((2892672 : Rat) / 2995) [(0, 3), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 18. -/
theorem rs_R010_ueqv_R010NYN_partial_18_0009_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_18_0009
        rs_R010_ueqv_R010NYN_generator_18_0000_0029 =
      rs_R010_ueqv_R010NYN_partial_18_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010NYN_coefficient_18_0010 : Poly :=
[
  term ((2423808 : Rat) / 2995) [(0, 1), (15, 2)]
]

/-- Partial product 10 for generator 18. -/
def rs_R010_ueqv_R010NYN_partial_18_0010 : Poly :=
[
  term ((-4847616 : Rat) / 2995) [(0, 1), (1, 1), (7, 1), (15, 2)],
  term ((2423808 : Rat) / 2995) [(0, 1), (1, 2), (15, 2)],
  term ((4847616 : Rat) / 2995) [(0, 1), (6, 1), (14, 1), (15, 2)],
  term ((4847616 : Rat) / 2995) [(0, 1), (7, 1), (15, 3)],
  term ((-2423808 : Rat) / 2995) [(0, 1), (14, 2), (15, 2)],
  term ((-2423808 : Rat) / 2995) [(0, 1), (15, 4)],
  term ((-4847616 : Rat) / 2995) [(0, 2), (6, 1), (15, 2)],
  term ((2423808 : Rat) / 2995) [(0, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 18. -/
theorem rs_R010_ueqv_R010NYN_partial_18_0010_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_18_0010
        rs_R010_ueqv_R010NYN_generator_18_0000_0029 =
      rs_R010_ueqv_R010NYN_partial_18_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010NYN_coefficient_18_0011 : Poly :=
[
  term ((-534 : Rat) / 5) [(0, 1), (15, 2), (16, 1)]
]

/-- Partial product 11 for generator 18. -/
def rs_R010_ueqv_R010NYN_partial_18_0011 : Poly :=
[
  term ((1068 : Rat) / 5) [(0, 1), (1, 1), (7, 1), (15, 2), (16, 1)],
  term ((-534 : Rat) / 5) [(0, 1), (1, 2), (15, 2), (16, 1)],
  term ((-1068 : Rat) / 5) [(0, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1068 : Rat) / 5) [(0, 1), (7, 1), (15, 3), (16, 1)],
  term ((534 : Rat) / 5) [(0, 1), (14, 2), (15, 2), (16, 1)],
  term ((534 : Rat) / 5) [(0, 1), (15, 4), (16, 1)],
  term ((1068 : Rat) / 5) [(0, 2), (6, 1), (15, 2), (16, 1)],
  term ((-534 : Rat) / 5) [(0, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 18. -/
theorem rs_R010_ueqv_R010NYN_partial_18_0011_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_18_0011
        rs_R010_ueqv_R010NYN_generator_18_0000_0029 =
      rs_R010_ueqv_R010NYN_partial_18_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010NYN_coefficient_18_0012 : Poly :=
[
  term ((-107136 : Rat) / 2995) [(1, 1), (8, 1), (11, 1)]
]

/-- Partial product 12 for generator 18. -/
def rs_R010_ueqv_R010NYN_partial_18_0012 : Poly :=
[
  term ((214272 : Rat) / 2995) [(0, 1), (1, 1), (6, 1), (8, 1), (11, 1)],
  term ((-107136 : Rat) / 2995) [(0, 2), (1, 1), (8, 1), (11, 1)],
  term ((-214272 : Rat) / 2995) [(1, 1), (6, 1), (8, 1), (11, 1), (14, 1)],
  term ((-214272 : Rat) / 2995) [(1, 1), (7, 1), (8, 1), (11, 1), (15, 1)],
  term ((107136 : Rat) / 2995) [(1, 1), (8, 1), (11, 1), (14, 2)],
  term ((107136 : Rat) / 2995) [(1, 1), (8, 1), (11, 1), (15, 2)],
  term ((214272 : Rat) / 2995) [(1, 2), (7, 1), (8, 1), (11, 1)],
  term ((-107136 : Rat) / 2995) [(1, 3), (8, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 18. -/
theorem rs_R010_ueqv_R010NYN_partial_18_0012_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_18_0012
        rs_R010_ueqv_R010NYN_generator_18_0000_0029 =
      rs_R010_ueqv_R010NYN_partial_18_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010NYN_coefficient_18_0013 : Poly :=
[
  term ((170688 : Rat) / 2995) [(1, 1), (8, 1), (15, 1)]
]

/-- Partial product 13 for generator 18. -/
def rs_R010_ueqv_R010NYN_partial_18_0013 : Poly :=
[
  term ((-341376 : Rat) / 2995) [(0, 1), (1, 1), (6, 1), (8, 1), (15, 1)],
  term ((170688 : Rat) / 2995) [(0, 2), (1, 1), (8, 1), (15, 1)],
  term ((341376 : Rat) / 2995) [(1, 1), (6, 1), (8, 1), (14, 1), (15, 1)],
  term ((341376 : Rat) / 2995) [(1, 1), (7, 1), (8, 1), (15, 2)],
  term ((-170688 : Rat) / 2995) [(1, 1), (8, 1), (14, 2), (15, 1)],
  term ((-170688 : Rat) / 2995) [(1, 1), (8, 1), (15, 3)],
  term ((-341376 : Rat) / 2995) [(1, 2), (7, 1), (8, 1), (15, 1)],
  term ((170688 : Rat) / 2995) [(1, 3), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 18. -/
theorem rs_R010_ueqv_R010NYN_partial_18_0013_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_18_0013
        rs_R010_ueqv_R010NYN_generator_18_0000_0029 =
      rs_R010_ueqv_R010NYN_partial_18_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010NYN_coefficient_18_0014 : Poly :=
[
  term ((-64 : Rat) / 5) [(1, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 14 for generator 18. -/
def rs_R010_ueqv_R010NYN_partial_18_0014 : Poly :=
[
  term ((128 : Rat) / 5) [(0, 1), (1, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-64 : Rat) / 5) [(0, 2), (1, 1), (8, 1), (15, 1), (16, 1)],
  term ((-128 : Rat) / 5) [(1, 1), (6, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-128 : Rat) / 5) [(1, 1), (7, 1), (8, 1), (15, 2), (16, 1)],
  term ((64 : Rat) / 5) [(1, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((64 : Rat) / 5) [(1, 1), (8, 1), (15, 3), (16, 1)],
  term ((128 : Rat) / 5) [(1, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-64 : Rat) / 5) [(1, 3), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 18. -/
theorem rs_R010_ueqv_R010NYN_partial_18_0014_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_18_0014
        rs_R010_ueqv_R010NYN_generator_18_0000_0029 =
      rs_R010_ueqv_R010NYN_partial_18_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010NYN_coefficient_18_0015 : Poly :=
[
  term ((80352 : Rat) / 2995) [(1, 1), (11, 1)]
]

/-- Partial product 15 for generator 18. -/
def rs_R010_ueqv_R010NYN_partial_18_0015 : Poly :=
[
  term ((-160704 : Rat) / 2995) [(0, 1), (1, 1), (6, 1), (11, 1)],
  term ((80352 : Rat) / 2995) [(0, 2), (1, 1), (11, 1)],
  term ((160704 : Rat) / 2995) [(1, 1), (6, 1), (11, 1), (14, 1)],
  term ((160704 : Rat) / 2995) [(1, 1), (7, 1), (11, 1), (15, 1)],
  term ((-80352 : Rat) / 2995) [(1, 1), (11, 1), (14, 2)],
  term ((-80352 : Rat) / 2995) [(1, 1), (11, 1), (15, 2)],
  term ((-160704 : Rat) / 2995) [(1, 2), (7, 1), (11, 1)],
  term ((80352 : Rat) / 2995) [(1, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 18. -/
theorem rs_R010_ueqv_R010NYN_partial_18_0015_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_18_0015
        rs_R010_ueqv_R010NYN_generator_18_0000_0029 =
      rs_R010_ueqv_R010NYN_partial_18_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010NYN_coefficient_18_0016 : Poly :=
[
  term ((28224 : Rat) / 2995) [(1, 1), (15, 1)]
]

/-- Partial product 16 for generator 18. -/
def rs_R010_ueqv_R010NYN_partial_18_0016 : Poly :=
[
  term ((-56448 : Rat) / 2995) [(0, 1), (1, 1), (6, 1), (15, 1)],
  term ((28224 : Rat) / 2995) [(0, 2), (1, 1), (15, 1)],
  term ((56448 : Rat) / 2995) [(1, 1), (6, 1), (14, 1), (15, 1)],
  term ((56448 : Rat) / 2995) [(1, 1), (7, 1), (15, 2)],
  term ((-28224 : Rat) / 2995) [(1, 1), (14, 2), (15, 1)],
  term ((-28224 : Rat) / 2995) [(1, 1), (15, 3)],
  term ((-56448 : Rat) / 2995) [(1, 2), (7, 1), (15, 1)],
  term ((28224 : Rat) / 2995) [(1, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 18. -/
theorem rs_R010_ueqv_R010NYN_partial_18_0016_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_18_0016
        rs_R010_ueqv_R010NYN_generator_18_0000_0029 =
      rs_R010_ueqv_R010NYN_partial_18_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010NYN_coefficient_18_0017 : Poly :=
[
  term ((13 : Rat) / 5) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 17 for generator 18. -/
def rs_R010_ueqv_R010NYN_partial_18_0017 : Poly :=
[
  term ((-26 : Rat) / 5) [(0, 1), (1, 1), (6, 1), (15, 1), (16, 1)],
  term ((13 : Rat) / 5) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term ((26 : Rat) / 5) [(1, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((26 : Rat) / 5) [(1, 1), (7, 1), (15, 2), (16, 1)],
  term ((-13 : Rat) / 5) [(1, 1), (14, 2), (15, 1), (16, 1)],
  term ((-13 : Rat) / 5) [(1, 1), (15, 3), (16, 1)],
  term ((-26 : Rat) / 5) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((13 : Rat) / 5) [(1, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 18. -/
theorem rs_R010_ueqv_R010NYN_partial_18_0017_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_18_0017
        rs_R010_ueqv_R010NYN_generator_18_0000_0029 =
      rs_R010_ueqv_R010NYN_partial_18_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010NYN_coefficient_18_0018 : Poly :=
[
  term ((-2571264 : Rat) / 2995) [(3, 1), (8, 1), (11, 1)]
]

/-- Partial product 18 for generator 18. -/
def rs_R010_ueqv_R010NYN_partial_18_0018 : Poly :=
[
  term ((5142528 : Rat) / 2995) [(0, 1), (3, 1), (6, 1), (8, 1), (11, 1)],
  term ((-2571264 : Rat) / 2995) [(0, 2), (3, 1), (8, 1), (11, 1)],
  term ((5142528 : Rat) / 2995) [(1, 1), (3, 1), (7, 1), (8, 1), (11, 1)],
  term ((-2571264 : Rat) / 2995) [(1, 2), (3, 1), (8, 1), (11, 1)],
  term ((-5142528 : Rat) / 2995) [(3, 1), (6, 1), (8, 1), (11, 1), (14, 1)],
  term ((-5142528 : Rat) / 2995) [(3, 1), (7, 1), (8, 1), (11, 1), (15, 1)],
  term ((2571264 : Rat) / 2995) [(3, 1), (8, 1), (11, 1), (14, 2)],
  term ((2571264 : Rat) / 2995) [(3, 1), (8, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 18. -/
theorem rs_R010_ueqv_R010NYN_partial_18_0018_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_18_0018
        rs_R010_ueqv_R010NYN_generator_18_0000_0029 =
      rs_R010_ueqv_R010NYN_partial_18_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010NYN_coefficient_18_0019 : Poly :=
[
  term ((2757312 : Rat) / 2995) [(3, 1), (8, 1), (15, 1)]
]

/-- Partial product 19 for generator 18. -/
def rs_R010_ueqv_R010NYN_partial_18_0019 : Poly :=
[
  term ((-5514624 : Rat) / 2995) [(0, 1), (3, 1), (6, 1), (8, 1), (15, 1)],
  term ((2757312 : Rat) / 2995) [(0, 2), (3, 1), (8, 1), (15, 1)],
  term ((-5514624 : Rat) / 2995) [(1, 1), (3, 1), (7, 1), (8, 1), (15, 1)],
  term ((2757312 : Rat) / 2995) [(1, 2), (3, 1), (8, 1), (15, 1)],
  term ((5514624 : Rat) / 2995) [(3, 1), (6, 1), (8, 1), (14, 1), (15, 1)],
  term ((5514624 : Rat) / 2995) [(3, 1), (7, 1), (8, 1), (15, 2)],
  term ((-2757312 : Rat) / 2995) [(3, 1), (8, 1), (14, 2), (15, 1)],
  term ((-2757312 : Rat) / 2995) [(3, 1), (8, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 18. -/
theorem rs_R010_ueqv_R010NYN_partial_18_0019_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_18_0019
        rs_R010_ueqv_R010NYN_generator_18_0000_0029 =
      rs_R010_ueqv_R010NYN_partial_18_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010NYN_coefficient_18_0020 : Poly :=
[
  term ((-636 : Rat) / 5) [(3, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 20 for generator 18. -/
def rs_R010_ueqv_R010NYN_partial_18_0020 : Poly :=
[
  term ((1272 : Rat) / 5) [(0, 1), (3, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-636 : Rat) / 5) [(0, 2), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((1272 : Rat) / 5) [(1, 1), (3, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-636 : Rat) / 5) [(1, 2), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((-1272 : Rat) / 5) [(3, 1), (6, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1272 : Rat) / 5) [(3, 1), (7, 1), (8, 1), (15, 2), (16, 1)],
  term ((636 : Rat) / 5) [(3, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((636 : Rat) / 5) [(3, 1), (8, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 18. -/
theorem rs_R010_ueqv_R010NYN_partial_18_0020_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_18_0020
        rs_R010_ueqv_R010NYN_generator_18_0000_0029 =
      rs_R010_ueqv_R010NYN_partial_18_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010NYN_coefficient_18_0021 : Poly :=
[
  term ((21072 : Rat) / 599) [(8, 1)]
]

/-- Partial product 21 for generator 18. -/
def rs_R010_ueqv_R010NYN_partial_18_0021 : Poly :=
[
  term ((-42144 : Rat) / 599) [(0, 1), (6, 1), (8, 1)],
  term ((21072 : Rat) / 599) [(0, 2), (8, 1)],
  term ((-42144 : Rat) / 599) [(1, 1), (7, 1), (8, 1)],
  term ((21072 : Rat) / 599) [(1, 2), (8, 1)],
  term ((42144 : Rat) / 599) [(6, 1), (8, 1), (14, 1)],
  term ((42144 : Rat) / 599) [(7, 1), (8, 1), (15, 1)],
  term ((-21072 : Rat) / 599) [(8, 1), (14, 2)],
  term ((-21072 : Rat) / 599) [(8, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 18. -/
theorem rs_R010_ueqv_R010NYN_partial_18_0021_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_18_0021
        rs_R010_ueqv_R010NYN_generator_18_0000_0029 =
      rs_R010_ueqv_R010NYN_partial_18_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010NYN_coefficient_18_0022 : Poly :=
[
  term ((4983552 : Rat) / 2995) [(8, 1), (11, 1), (15, 1)]
]

/-- Partial product 22 for generator 18. -/
def rs_R010_ueqv_R010NYN_partial_18_0022 : Poly :=
[
  term ((-9967104 : Rat) / 2995) [(0, 1), (6, 1), (8, 1), (11, 1), (15, 1)],
  term ((4983552 : Rat) / 2995) [(0, 2), (8, 1), (11, 1), (15, 1)],
  term ((-9967104 : Rat) / 2995) [(1, 1), (7, 1), (8, 1), (11, 1), (15, 1)],
  term ((4983552 : Rat) / 2995) [(1, 2), (8, 1), (11, 1), (15, 1)],
  term ((9967104 : Rat) / 2995) [(6, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((9967104 : Rat) / 2995) [(7, 1), (8, 1), (11, 1), (15, 2)],
  term ((-4983552 : Rat) / 2995) [(8, 1), (11, 1), (14, 2), (15, 1)],
  term ((-4983552 : Rat) / 2995) [(8, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 18. -/
theorem rs_R010_ueqv_R010NYN_partial_18_0022_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_18_0022
        rs_R010_ueqv_R010NYN_generator_18_0000_0029 =
      rs_R010_ueqv_R010NYN_partial_18_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010NYN_coefficient_18_0023 : Poly :=
[
  term ((-948 : Rat) / 5) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 23 for generator 18. -/
def rs_R010_ueqv_R010NYN_partial_18_0023 : Poly :=
[
  term ((1896 : Rat) / 5) [(0, 1), (6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-948 : Rat) / 5) [(0, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((1896 : Rat) / 5) [(1, 1), (7, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-948 : Rat) / 5) [(1, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1896 : Rat) / 5) [(6, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1896 : Rat) / 5) [(7, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((948 : Rat) / 5) [(8, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((948 : Rat) / 5) [(8, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 18. -/
theorem rs_R010_ueqv_R010NYN_partial_18_0023_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_18_0023
        rs_R010_ueqv_R010NYN_generator_18_0000_0029 =
      rs_R010_ueqv_R010NYN_partial_18_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010NYN_coefficient_18_0024 : Poly :=
[
  term ((-2892672 : Rat) / 2995) [(8, 1), (11, 2)]
]

/-- Partial product 24 for generator 18. -/
def rs_R010_ueqv_R010NYN_partial_18_0024 : Poly :=
[
  term ((5785344 : Rat) / 2995) [(0, 1), (6, 1), (8, 1), (11, 2)],
  term ((-2892672 : Rat) / 2995) [(0, 2), (8, 1), (11, 2)],
  term ((5785344 : Rat) / 2995) [(1, 1), (7, 1), (8, 1), (11, 2)],
  term ((-2892672 : Rat) / 2995) [(1, 2), (8, 1), (11, 2)],
  term ((-5785344 : Rat) / 2995) [(6, 1), (8, 1), (11, 2), (14, 1)],
  term ((-5785344 : Rat) / 2995) [(7, 1), (8, 1), (11, 2), (15, 1)],
  term ((2892672 : Rat) / 2995) [(8, 1), (11, 2), (14, 2)],
  term ((2892672 : Rat) / 2995) [(8, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 18. -/
theorem rs_R010_ueqv_R010NYN_partial_18_0024_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_18_0024
        rs_R010_ueqv_R010NYN_generator_18_0000_0029 =
      rs_R010_ueqv_R010NYN_partial_18_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010NYN_coefficient_18_0025 : Poly :=
[
  term ((-2423808 : Rat) / 2995) [(8, 1), (15, 2)]
]

/-- Partial product 25 for generator 18. -/
def rs_R010_ueqv_R010NYN_partial_18_0025 : Poly :=
[
  term ((4847616 : Rat) / 2995) [(0, 1), (6, 1), (8, 1), (15, 2)],
  term ((-2423808 : Rat) / 2995) [(0, 2), (8, 1), (15, 2)],
  term ((4847616 : Rat) / 2995) [(1, 1), (7, 1), (8, 1), (15, 2)],
  term ((-2423808 : Rat) / 2995) [(1, 2), (8, 1), (15, 2)],
  term ((-4847616 : Rat) / 2995) [(6, 1), (8, 1), (14, 1), (15, 2)],
  term ((-4847616 : Rat) / 2995) [(7, 1), (8, 1), (15, 3)],
  term ((2423808 : Rat) / 2995) [(8, 1), (14, 2), (15, 2)],
  term ((2423808 : Rat) / 2995) [(8, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 18. -/
theorem rs_R010_ueqv_R010NYN_partial_18_0025_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_18_0025
        rs_R010_ueqv_R010NYN_generator_18_0000_0029 =
      rs_R010_ueqv_R010NYN_partial_18_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010NYN_coefficient_18_0026 : Poly :=
[
  term ((534 : Rat) / 5) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 26 for generator 18. -/
def rs_R010_ueqv_R010NYN_partial_18_0026 : Poly :=
[
  term ((-1068 : Rat) / 5) [(0, 1), (6, 1), (8, 1), (15, 2), (16, 1)],
  term ((534 : Rat) / 5) [(0, 2), (8, 1), (15, 2), (16, 1)],
  term ((-1068 : Rat) / 5) [(1, 1), (7, 1), (8, 1), (15, 2), (16, 1)],
  term ((534 : Rat) / 5) [(1, 2), (8, 1), (15, 2), (16, 1)],
  term ((1068 : Rat) / 5) [(6, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((1068 : Rat) / 5) [(7, 1), (8, 1), (15, 3), (16, 1)],
  term ((-534 : Rat) / 5) [(8, 1), (14, 2), (15, 2), (16, 1)],
  term ((-534 : Rat) / 5) [(8, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 18. -/
theorem rs_R010_ueqv_R010NYN_partial_18_0026_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_18_0026
        rs_R010_ueqv_R010NYN_generator_18_0000_0029 =
      rs_R010_ueqv_R010NYN_partial_18_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010NYN_coefficient_18_0027 : Poly :=
[
  term ((-80352 : Rat) / 2995) [(9, 1), (11, 1)]
]

/-- Partial product 27 for generator 18. -/
def rs_R010_ueqv_R010NYN_partial_18_0027 : Poly :=
[
  term ((160704 : Rat) / 2995) [(0, 1), (6, 1), (9, 1), (11, 1)],
  term ((-80352 : Rat) / 2995) [(0, 2), (9, 1), (11, 1)],
  term ((160704 : Rat) / 2995) [(1, 1), (7, 1), (9, 1), (11, 1)],
  term ((-80352 : Rat) / 2995) [(1, 2), (9, 1), (11, 1)],
  term ((-160704 : Rat) / 2995) [(6, 1), (9, 1), (11, 1), (14, 1)],
  term ((-160704 : Rat) / 2995) [(7, 1), (9, 1), (11, 1), (15, 1)],
  term ((80352 : Rat) / 2995) [(9, 1), (11, 1), (14, 2)],
  term ((80352 : Rat) / 2995) [(9, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 18. -/
theorem rs_R010_ueqv_R010NYN_partial_18_0027_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_18_0027
        rs_R010_ueqv_R010NYN_generator_18_0000_0029 =
      rs_R010_ueqv_R010NYN_partial_18_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010NYN_coefficient_18_0028 : Poly :=
[
  term ((-28224 : Rat) / 2995) [(9, 1), (15, 1)]
]

/-- Partial product 28 for generator 18. -/
def rs_R010_ueqv_R010NYN_partial_18_0028 : Poly :=
[
  term ((56448 : Rat) / 2995) [(0, 1), (6, 1), (9, 1), (15, 1)],
  term ((-28224 : Rat) / 2995) [(0, 2), (9, 1), (15, 1)],
  term ((56448 : Rat) / 2995) [(1, 1), (7, 1), (9, 1), (15, 1)],
  term ((-28224 : Rat) / 2995) [(1, 2), (9, 1), (15, 1)],
  term ((-56448 : Rat) / 2995) [(6, 1), (9, 1), (14, 1), (15, 1)],
  term ((-56448 : Rat) / 2995) [(7, 1), (9, 1), (15, 2)],
  term ((28224 : Rat) / 2995) [(9, 1), (14, 2), (15, 1)],
  term ((28224 : Rat) / 2995) [(9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 18. -/
theorem rs_R010_ueqv_R010NYN_partial_18_0028_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_18_0028
        rs_R010_ueqv_R010NYN_generator_18_0000_0029 =
      rs_R010_ueqv_R010NYN_partial_18_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010NYN_coefficient_18_0029 : Poly :=
[
  term ((-13 : Rat) / 5) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 29 for generator 18. -/
def rs_R010_ueqv_R010NYN_partial_18_0029 : Poly :=
[
  term ((26 : Rat) / 5) [(0, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-13 : Rat) / 5) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((26 : Rat) / 5) [(1, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-13 : Rat) / 5) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((-26 : Rat) / 5) [(6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-26 : Rat) / 5) [(7, 1), (9, 1), (15, 2), (16, 1)],
  term ((13 : Rat) / 5) [(9, 1), (14, 2), (15, 1), (16, 1)],
  term ((13 : Rat) / 5) [(9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 18. -/
theorem rs_R010_ueqv_R010NYN_partial_18_0029_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_18_0029
        rs_R010_ueqv_R010NYN_generator_18_0000_0029 =
      rs_R010_ueqv_R010NYN_partial_18_0029 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010NYN_partials_18_0000_0029 : List Poly :=
[
  rs_R010_ueqv_R010NYN_partial_18_0000,
  rs_R010_ueqv_R010NYN_partial_18_0001,
  rs_R010_ueqv_R010NYN_partial_18_0002,
  rs_R010_ueqv_R010NYN_partial_18_0003,
  rs_R010_ueqv_R010NYN_partial_18_0004,
  rs_R010_ueqv_R010NYN_partial_18_0005,
  rs_R010_ueqv_R010NYN_partial_18_0006,
  rs_R010_ueqv_R010NYN_partial_18_0007,
  rs_R010_ueqv_R010NYN_partial_18_0008,
  rs_R010_ueqv_R010NYN_partial_18_0009,
  rs_R010_ueqv_R010NYN_partial_18_0010,
  rs_R010_ueqv_R010NYN_partial_18_0011,
  rs_R010_ueqv_R010NYN_partial_18_0012,
  rs_R010_ueqv_R010NYN_partial_18_0013,
  rs_R010_ueqv_R010NYN_partial_18_0014,
  rs_R010_ueqv_R010NYN_partial_18_0015,
  rs_R010_ueqv_R010NYN_partial_18_0016,
  rs_R010_ueqv_R010NYN_partial_18_0017,
  rs_R010_ueqv_R010NYN_partial_18_0018,
  rs_R010_ueqv_R010NYN_partial_18_0019,
  rs_R010_ueqv_R010NYN_partial_18_0020,
  rs_R010_ueqv_R010NYN_partial_18_0021,
  rs_R010_ueqv_R010NYN_partial_18_0022,
  rs_R010_ueqv_R010NYN_partial_18_0023,
  rs_R010_ueqv_R010NYN_partial_18_0024,
  rs_R010_ueqv_R010NYN_partial_18_0025,
  rs_R010_ueqv_R010NYN_partial_18_0026,
  rs_R010_ueqv_R010NYN_partial_18_0027,
  rs_R010_ueqv_R010NYN_partial_18_0028,
  rs_R010_ueqv_R010NYN_partial_18_0029
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010NYN_block_18_0000_0029 : Poly :=
[
  term ((-5142528 : Rat) / 2995) [(0, 1), (1, 1), (3, 1), (7, 1), (11, 1)],
  term ((5514624 : Rat) / 2995) [(0, 1), (1, 1), (3, 1), (7, 1), (15, 1)],
  term ((-1272 : Rat) / 5) [(0, 1), (1, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((214272 : Rat) / 2995) [(0, 1), (1, 1), (6, 1), (8, 1), (11, 1)],
  term ((-341376 : Rat) / 2995) [(0, 1), (1, 1), (6, 1), (8, 1), (15, 1)],
  term ((128 : Rat) / 5) [(0, 1), (1, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-160704 : Rat) / 2995) [(0, 1), (1, 1), (6, 1), (11, 1)],
  term ((214272 : Rat) / 2995) [(0, 1), (1, 1), (6, 1), (11, 1), (14, 1)],
  term ((-341376 : Rat) / 2995) [(0, 1), (1, 1), (6, 1), (14, 1), (15, 1)],
  term ((128 : Rat) / 5) [(0, 1), (1, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-56448 : Rat) / 2995) [(0, 1), (1, 1), (6, 1), (15, 1)],
  term ((-26 : Rat) / 5) [(0, 1), (1, 1), (6, 1), (15, 1), (16, 1)],
  term ((42144 : Rat) / 599) [(0, 1), (1, 1), (7, 1)],
  term ((10181376 : Rat) / 2995) [(0, 1), (1, 1), (7, 1), (11, 1), (15, 1)],
  term ((-1896 : Rat) / 5) [(0, 1), (1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-5785344 : Rat) / 2995) [(0, 1), (1, 1), (7, 1), (11, 2)],
  term ((-5188992 : Rat) / 2995) [(0, 1), (1, 1), (7, 1), (15, 2)],
  term ((1196 : Rat) / 5) [(0, 1), (1, 1), (7, 1), (15, 2), (16, 1)],
  term ((-107136 : Rat) / 2995) [(0, 1), (1, 1), (11, 1), (14, 2)],
  term ((-107136 : Rat) / 2995) [(0, 1), (1, 1), (11, 1), (15, 2)],
  term ((170688 : Rat) / 2995) [(0, 1), (1, 1), (14, 2), (15, 1)],
  term ((-64 : Rat) / 5) [(0, 1), (1, 1), (14, 2), (15, 1), (16, 1)],
  term ((170688 : Rat) / 2995) [(0, 1), (1, 1), (15, 3)],
  term ((-64 : Rat) / 5) [(0, 1), (1, 1), (15, 3), (16, 1)],
  term ((-21072 : Rat) / 599) [(0, 1), (1, 2)],
  term ((2571264 : Rat) / 2995) [(0, 1), (1, 2), (3, 1), (11, 1)],
  term ((-2757312 : Rat) / 2995) [(0, 1), (1, 2), (3, 1), (15, 1)],
  term ((636 : Rat) / 5) [(0, 1), (1, 2), (3, 1), (15, 1), (16, 1)],
  term ((-214272 : Rat) / 2995) [(0, 1), (1, 2), (7, 1), (11, 1)],
  term ((341376 : Rat) / 2995) [(0, 1), (1, 2), (7, 1), (15, 1)],
  term ((-128 : Rat) / 5) [(0, 1), (1, 2), (7, 1), (15, 1), (16, 1)],
  term ((-4983552 : Rat) / 2995) [(0, 1), (1, 2), (11, 1), (15, 1)],
  term ((948 : Rat) / 5) [(0, 1), (1, 2), (11, 1), (15, 1), (16, 1)],
  term ((2892672 : Rat) / 2995) [(0, 1), (1, 2), (11, 2)],
  term ((2423808 : Rat) / 2995) [(0, 1), (1, 2), (15, 2)],
  term ((-534 : Rat) / 5) [(0, 1), (1, 2), (15, 2), (16, 1)],
  term ((107136 : Rat) / 2995) [(0, 1), (1, 3), (11, 1)],
  term ((-170688 : Rat) / 2995) [(0, 1), (1, 3), (15, 1)],
  term ((64 : Rat) / 5) [(0, 1), (1, 3), (15, 1), (16, 1)],
  term ((5142528 : Rat) / 2995) [(0, 1), (3, 1), (6, 1), (8, 1), (11, 1)],
  term ((-5514624 : Rat) / 2995) [(0, 1), (3, 1), (6, 1), (8, 1), (15, 1)],
  term ((1272 : Rat) / 5) [(0, 1), (3, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((5142528 : Rat) / 2995) [(0, 1), (3, 1), (6, 1), (11, 1), (14, 1)],
  term ((-5514624 : Rat) / 2995) [(0, 1), (3, 1), (6, 1), (14, 1), (15, 1)],
  term ((1272 : Rat) / 5) [(0, 1), (3, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((5142528 : Rat) / 2995) [(0, 1), (3, 1), (7, 1), (11, 1), (15, 1)],
  term ((-5514624 : Rat) / 2995) [(0, 1), (3, 1), (7, 1), (15, 2)],
  term ((1272 : Rat) / 5) [(0, 1), (3, 1), (7, 1), (15, 2), (16, 1)],
  term ((-2571264 : Rat) / 2995) [(0, 1), (3, 1), (11, 1), (14, 2)],
  term ((-2571264 : Rat) / 2995) [(0, 1), (3, 1), (11, 1), (15, 2)],
  term ((2757312 : Rat) / 2995) [(0, 1), (3, 1), (14, 2), (15, 1)],
  term ((-636 : Rat) / 5) [(0, 1), (3, 1), (14, 2), (15, 1), (16, 1)],
  term ((2757312 : Rat) / 2995) [(0, 1), (3, 1), (15, 3)],
  term ((-636 : Rat) / 5) [(0, 1), (3, 1), (15, 3), (16, 1)],
  term ((-42144 : Rat) / 599) [(0, 1), (6, 1), (8, 1)],
  term ((-9967104 : Rat) / 2995) [(0, 1), (6, 1), (8, 1), (11, 1), (15, 1)],
  term ((1896 : Rat) / 5) [(0, 1), (6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((5785344 : Rat) / 2995) [(0, 1), (6, 1), (8, 1), (11, 2)],
  term ((4847616 : Rat) / 2995) [(0, 1), (6, 1), (8, 1), (15, 2)],
  term ((-1068 : Rat) / 5) [(0, 1), (6, 1), (8, 1), (15, 2), (16, 1)],
  term ((160704 : Rat) / 2995) [(0, 1), (6, 1), (9, 1), (11, 1)],
  term ((56448 : Rat) / 2995) [(0, 1), (6, 1), (9, 1), (15, 1)],
  term ((26 : Rat) / 5) [(0, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-9967104 : Rat) / 2995) [(0, 1), (6, 1), (11, 1), (14, 1), (15, 1)],
  term ((1896 : Rat) / 5) [(0, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((5785344 : Rat) / 2995) [(0, 1), (6, 1), (11, 2), (14, 1)],
  term ((-42144 : Rat) / 599) [(0, 1), (6, 1), (14, 1)],
  term ((4847616 : Rat) / 2995) [(0, 1), (6, 1), (14, 1), (15, 2)],
  term ((-1068 : Rat) / 5) [(0, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-9967104 : Rat) / 2995) [(0, 1), (7, 1), (11, 1), (15, 2)],
  term ((1896 : Rat) / 5) [(0, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((5785344 : Rat) / 2995) [(0, 1), (7, 1), (11, 2), (15, 1)],
  term ((-42144 : Rat) / 599) [(0, 1), (7, 1), (15, 1)],
  term ((4847616 : Rat) / 2995) [(0, 1), (7, 1), (15, 3)],
  term ((-1068 : Rat) / 5) [(0, 1), (7, 1), (15, 3), (16, 1)],
  term ((4983552 : Rat) / 2995) [(0, 1), (11, 1), (14, 2), (15, 1)],
  term ((-948 : Rat) / 5) [(0, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((4983552 : Rat) / 2995) [(0, 1), (11, 1), (15, 3)],
  term ((-948 : Rat) / 5) [(0, 1), (11, 1), (15, 3), (16, 1)],
  term ((-2892672 : Rat) / 2995) [(0, 1), (11, 2), (14, 2)],
  term ((-2892672 : Rat) / 2995) [(0, 1), (11, 2), (15, 2)],
  term ((21072 : Rat) / 599) [(0, 1), (14, 2)],
  term ((-2423808 : Rat) / 2995) [(0, 1), (14, 2), (15, 2)],
  term ((534 : Rat) / 5) [(0, 1), (14, 2), (15, 2), (16, 1)],
  term ((21072 : Rat) / 599) [(0, 1), (15, 2)],
  term ((-2423808 : Rat) / 2995) [(0, 1), (15, 4)],
  term ((534 : Rat) / 5) [(0, 1), (15, 4), (16, 1)],
  term ((-214272 : Rat) / 2995) [(0, 2), (1, 1), (6, 1), (11, 1)],
  term ((341376 : Rat) / 2995) [(0, 2), (1, 1), (6, 1), (15, 1)],
  term ((-128 : Rat) / 5) [(0, 2), (1, 1), (6, 1), (15, 1), (16, 1)],
  term ((-107136 : Rat) / 2995) [(0, 2), (1, 1), (8, 1), (11, 1)],
  term ((170688 : Rat) / 2995) [(0, 2), (1, 1), (8, 1), (15, 1)],
  term ((-64 : Rat) / 5) [(0, 2), (1, 1), (8, 1), (15, 1), (16, 1)],
  term ((80352 : Rat) / 2995) [(0, 2), (1, 1), (11, 1)],
  term ((28224 : Rat) / 2995) [(0, 2), (1, 1), (15, 1)],
  term ((13 : Rat) / 5) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term ((-5142528 : Rat) / 2995) [(0, 2), (3, 1), (6, 1), (11, 1)],
  term ((5514624 : Rat) / 2995) [(0, 2), (3, 1), (6, 1), (15, 1)],
  term ((-1272 : Rat) / 5) [(0, 2), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-2571264 : Rat) / 2995) [(0, 2), (3, 1), (8, 1), (11, 1)],
  term ((2757312 : Rat) / 2995) [(0, 2), (3, 1), (8, 1), (15, 1)],
  term ((-636 : Rat) / 5) [(0, 2), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((42144 : Rat) / 599) [(0, 2), (6, 1)],
  term ((9967104 : Rat) / 2995) [(0, 2), (6, 1), (11, 1), (15, 1)],
  term ((-1896 : Rat) / 5) [(0, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-5785344 : Rat) / 2995) [(0, 2), (6, 1), (11, 2)],
  term ((-4847616 : Rat) / 2995) [(0, 2), (6, 1), (15, 2)],
  term ((1068 : Rat) / 5) [(0, 2), (6, 1), (15, 2), (16, 1)],
  term ((21072 : Rat) / 599) [(0, 2), (8, 1)],
  term ((4983552 : Rat) / 2995) [(0, 2), (8, 1), (11, 1), (15, 1)],
  term ((-948 : Rat) / 5) [(0, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2892672 : Rat) / 2995) [(0, 2), (8, 1), (11, 2)],
  term ((-2423808 : Rat) / 2995) [(0, 2), (8, 1), (15, 2)],
  term ((534 : Rat) / 5) [(0, 2), (8, 1), (15, 2), (16, 1)],
  term ((-80352 : Rat) / 2995) [(0, 2), (9, 1), (11, 1)],
  term ((-28224 : Rat) / 2995) [(0, 2), (9, 1), (15, 1)],
  term ((-13 : Rat) / 5) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((-21072 : Rat) / 599) [(0, 3)],
  term ((107136 : Rat) / 2995) [(0, 3), (1, 1), (11, 1)],
  term ((-170688 : Rat) / 2995) [(0, 3), (1, 1), (15, 1)],
  term ((64 : Rat) / 5) [(0, 3), (1, 1), (15, 1), (16, 1)],
  term ((2571264 : Rat) / 2995) [(0, 3), (3, 1), (11, 1)],
  term ((-2757312 : Rat) / 2995) [(0, 3), (3, 1), (15, 1)],
  term ((636 : Rat) / 5) [(0, 3), (3, 1), (15, 1), (16, 1)],
  term ((-4983552 : Rat) / 2995) [(0, 3), (11, 1), (15, 1)],
  term ((948 : Rat) / 5) [(0, 3), (11, 1), (15, 1), (16, 1)],
  term ((2892672 : Rat) / 2995) [(0, 3), (11, 2)],
  term ((2423808 : Rat) / 2995) [(0, 3), (15, 2)],
  term ((-534 : Rat) / 5) [(0, 3), (15, 2), (16, 1)],
  term ((5142528 : Rat) / 2995) [(1, 1), (3, 1), (7, 1), (8, 1), (11, 1)],
  term ((-5514624 : Rat) / 2995) [(1, 1), (3, 1), (7, 1), (8, 1), (15, 1)],
  term ((1272 : Rat) / 5) [(1, 1), (3, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-214272 : Rat) / 2995) [(1, 1), (6, 1), (8, 1), (11, 1), (14, 1)],
  term ((341376 : Rat) / 2995) [(1, 1), (6, 1), (8, 1), (14, 1), (15, 1)],
  term ((-128 : Rat) / 5) [(1, 1), (6, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((160704 : Rat) / 2995) [(1, 1), (6, 1), (11, 1), (14, 1)],
  term ((56448 : Rat) / 2995) [(1, 1), (6, 1), (14, 1), (15, 1)],
  term ((26 : Rat) / 5) [(1, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-42144 : Rat) / 599) [(1, 1), (7, 1), (8, 1)],
  term ((-10181376 : Rat) / 2995) [(1, 1), (7, 1), (8, 1), (11, 1), (15, 1)],
  term ((1896 : Rat) / 5) [(1, 1), (7, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((5785344 : Rat) / 2995) [(1, 1), (7, 1), (8, 1), (11, 2)],
  term ((5188992 : Rat) / 2995) [(1, 1), (7, 1), (8, 1), (15, 2)],
  term ((-1196 : Rat) / 5) [(1, 1), (7, 1), (8, 1), (15, 2), (16, 1)],
  term ((160704 : Rat) / 2995) [(1, 1), (7, 1), (9, 1), (11, 1)],
  term ((56448 : Rat) / 2995) [(1, 1), (7, 1), (9, 1), (15, 1)],
  term ((26 : Rat) / 5) [(1, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((160704 : Rat) / 2995) [(1, 1), (7, 1), (11, 1), (15, 1)],
  term ((56448 : Rat) / 2995) [(1, 1), (7, 1), (15, 2)],
  term ((26 : Rat) / 5) [(1, 1), (7, 1), (15, 2), (16, 1)],
  term ((107136 : Rat) / 2995) [(1, 1), (8, 1), (11, 1), (14, 2)],
  term ((107136 : Rat) / 2995) [(1, 1), (8, 1), (11, 1), (15, 2)],
  term ((-170688 : Rat) / 2995) [(1, 1), (8, 1), (14, 2), (15, 1)],
  term ((64 : Rat) / 5) [(1, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((-170688 : Rat) / 2995) [(1, 1), (8, 1), (15, 3)],
  term ((64 : Rat) / 5) [(1, 1), (8, 1), (15, 3), (16, 1)],
  term ((-80352 : Rat) / 2995) [(1, 1), (11, 1), (14, 2)],
  term ((-80352 : Rat) / 2995) [(1, 1), (11, 1), (15, 2)],
  term ((-28224 : Rat) / 2995) [(1, 1), (14, 2), (15, 1)],
  term ((-13 : Rat) / 5) [(1, 1), (14, 2), (15, 1), (16, 1)],
  term ((-28224 : Rat) / 2995) [(1, 1), (15, 3)],
  term ((-13 : Rat) / 5) [(1, 1), (15, 3), (16, 1)],
  term ((-2571264 : Rat) / 2995) [(1, 2), (3, 1), (8, 1), (11, 1)],
  term ((2757312 : Rat) / 2995) [(1, 2), (3, 1), (8, 1), (15, 1)],
  term ((-636 : Rat) / 5) [(1, 2), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((214272 : Rat) / 2995) [(1, 2), (7, 1), (8, 1), (11, 1)],
  term ((-341376 : Rat) / 2995) [(1, 2), (7, 1), (8, 1), (15, 1)],
  term ((128 : Rat) / 5) [(1, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-160704 : Rat) / 2995) [(1, 2), (7, 1), (11, 1)],
  term ((-56448 : Rat) / 2995) [(1, 2), (7, 1), (15, 1)],
  term ((-26 : Rat) / 5) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((21072 : Rat) / 599) [(1, 2), (8, 1)],
  term ((4983552 : Rat) / 2995) [(1, 2), (8, 1), (11, 1), (15, 1)],
  term ((-948 : Rat) / 5) [(1, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2892672 : Rat) / 2995) [(1, 2), (8, 1), (11, 2)],
  term ((-2423808 : Rat) / 2995) [(1, 2), (8, 1), (15, 2)],
  term ((534 : Rat) / 5) [(1, 2), (8, 1), (15, 2), (16, 1)],
  term ((-80352 : Rat) / 2995) [(1, 2), (9, 1), (11, 1)],
  term ((-28224 : Rat) / 2995) [(1, 2), (9, 1), (15, 1)],
  term ((-13 : Rat) / 5) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((-107136 : Rat) / 2995) [(1, 3), (8, 1), (11, 1)],
  term ((170688 : Rat) / 2995) [(1, 3), (8, 1), (15, 1)],
  term ((-64 : Rat) / 5) [(1, 3), (8, 1), (15, 1), (16, 1)],
  term ((80352 : Rat) / 2995) [(1, 3), (11, 1)],
  term ((28224 : Rat) / 2995) [(1, 3), (15, 1)],
  term ((13 : Rat) / 5) [(1, 3), (15, 1), (16, 1)],
  term ((-5142528 : Rat) / 2995) [(3, 1), (6, 1), (8, 1), (11, 1), (14, 1)],
  term ((5514624 : Rat) / 2995) [(3, 1), (6, 1), (8, 1), (14, 1), (15, 1)],
  term ((-1272 : Rat) / 5) [(3, 1), (6, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5142528 : Rat) / 2995) [(3, 1), (7, 1), (8, 1), (11, 1), (15, 1)],
  term ((5514624 : Rat) / 2995) [(3, 1), (7, 1), (8, 1), (15, 2)],
  term ((-1272 : Rat) / 5) [(3, 1), (7, 1), (8, 1), (15, 2), (16, 1)],
  term ((2571264 : Rat) / 2995) [(3, 1), (8, 1), (11, 1), (14, 2)],
  term ((2571264 : Rat) / 2995) [(3, 1), (8, 1), (11, 1), (15, 2)],
  term ((-2757312 : Rat) / 2995) [(3, 1), (8, 1), (14, 2), (15, 1)],
  term ((636 : Rat) / 5) [(3, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2757312 : Rat) / 2995) [(3, 1), (8, 1), (15, 3)],
  term ((636 : Rat) / 5) [(3, 1), (8, 1), (15, 3), (16, 1)],
  term ((9967104 : Rat) / 2995) [(6, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((-1896 : Rat) / 5) [(6, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5785344 : Rat) / 2995) [(6, 1), (8, 1), (11, 2), (14, 1)],
  term ((42144 : Rat) / 599) [(6, 1), (8, 1), (14, 1)],
  term ((-4847616 : Rat) / 2995) [(6, 1), (8, 1), (14, 1), (15, 2)],
  term ((1068 : Rat) / 5) [(6, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-160704 : Rat) / 2995) [(6, 1), (9, 1), (11, 1), (14, 1)],
  term ((-56448 : Rat) / 2995) [(6, 1), (9, 1), (14, 1), (15, 1)],
  term ((-26 : Rat) / 5) [(6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((9967104 : Rat) / 2995) [(7, 1), (8, 1), (11, 1), (15, 2)],
  term ((-1896 : Rat) / 5) [(7, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-5785344 : Rat) / 2995) [(7, 1), (8, 1), (11, 2), (15, 1)],
  term ((42144 : Rat) / 599) [(7, 1), (8, 1), (15, 1)],
  term ((-4847616 : Rat) / 2995) [(7, 1), (8, 1), (15, 3)],
  term ((1068 : Rat) / 5) [(7, 1), (8, 1), (15, 3), (16, 1)],
  term ((-160704 : Rat) / 2995) [(7, 1), (9, 1), (11, 1), (15, 1)],
  term ((-56448 : Rat) / 2995) [(7, 1), (9, 1), (15, 2)],
  term ((-26 : Rat) / 5) [(7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-4983552 : Rat) / 2995) [(8, 1), (11, 1), (14, 2), (15, 1)],
  term ((948 : Rat) / 5) [(8, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-4983552 : Rat) / 2995) [(8, 1), (11, 1), (15, 3)],
  term ((948 : Rat) / 5) [(8, 1), (11, 1), (15, 3), (16, 1)],
  term ((2892672 : Rat) / 2995) [(8, 1), (11, 2), (14, 2)],
  term ((2892672 : Rat) / 2995) [(8, 1), (11, 2), (15, 2)],
  term ((-21072 : Rat) / 599) [(8, 1), (14, 2)],
  term ((2423808 : Rat) / 2995) [(8, 1), (14, 2), (15, 2)],
  term ((-534 : Rat) / 5) [(8, 1), (14, 2), (15, 2), (16, 1)],
  term ((-21072 : Rat) / 599) [(8, 1), (15, 2)],
  term ((2423808 : Rat) / 2995) [(8, 1), (15, 4)],
  term ((-534 : Rat) / 5) [(8, 1), (15, 4), (16, 1)],
  term ((80352 : Rat) / 2995) [(9, 1), (11, 1), (14, 2)],
  term ((80352 : Rat) / 2995) [(9, 1), (11, 1), (15, 2)],
  term ((28224 : Rat) / 2995) [(9, 1), (14, 2), (15, 1)],
  term ((13 : Rat) / 5) [(9, 1), (14, 2), (15, 1), (16, 1)],
  term ((28224 : Rat) / 2995) [(9, 1), (15, 3)],
  term ((13 : Rat) / 5) [(9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 18, terms 0 through 29. -/
theorem rs_R010_ueqv_R010NYN_block_18_0000_0029_valid :
    checkProductSumEq rs_R010_ueqv_R010NYN_partials_18_0000_0029
      rs_R010_ueqv_R010NYN_block_18_0000_0029 = true := by
  native_decide

end R010UeqvR010NYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
