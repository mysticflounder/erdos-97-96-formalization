/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010NYN, term block 20:0-23

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010NYNTermShards

/-- Generator polynomial 20 for relaxed split surplus certificate `R010:u=v:R010NYN`. -/
def rs_R010_ueqv_R010NYN_generator_20_0000_0023 : Poly :=
[
  term (2 : Rat) [(6, 1), (8, 1)],
  term (-1 : Rat) [(6, 2)],
  term (2 : Rat) [(7, 1), (9, 1)],
  term (-1 : Rat) [(7, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010NYN_coefficient_20_0000 : Poly :=
[
  term ((-10536 : Rat) / 599) []
]

/-- Partial product 0 for generator 20. -/
def rs_R010_ueqv_R010NYN_partial_20_0000 : Poly :=
[
  term ((-21072 : Rat) / 599) [(6, 1), (8, 1)],
  term ((10536 : Rat) / 599) [(6, 2)],
  term ((-21072 : Rat) / 599) [(7, 1), (9, 1)],
  term ((10536 : Rat) / 599) [(7, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 20. -/
theorem rs_R010_ueqv_R010NYN_partial_20_0000_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_20_0000
        rs_R010_ueqv_R010NYN_generator_20_0000_0023 =
      rs_R010_ueqv_R010NYN_partial_20_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010NYN_coefficient_20_0001 : Poly :=
[
  term ((21072 : Rat) / 599) [(0, 1)]
]

/-- Partial product 1 for generator 20. -/
def rs_R010_ueqv_R010NYN_partial_20_0001 : Poly :=
[
  term ((42144 : Rat) / 599) [(0, 1), (6, 1), (8, 1)],
  term ((-21072 : Rat) / 599) [(0, 1), (6, 2)],
  term ((42144 : Rat) / 599) [(0, 1), (7, 1), (9, 1)],
  term ((-21072 : Rat) / 599) [(0, 1), (7, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 20. -/
theorem rs_R010_ueqv_R010NYN_partial_20_0001_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_20_0001
        rs_R010_ueqv_R010NYN_generator_20_0000_0023 =
      rs_R010_ueqv_R010NYN_partial_20_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010NYN_coefficient_20_0002 : Poly :=
[
  term ((-107136 : Rat) / 2995) [(0, 1), (1, 1), (11, 1)]
]

/-- Partial product 2 for generator 20. -/
def rs_R010_ueqv_R010NYN_partial_20_0002 : Poly :=
[
  term ((-214272 : Rat) / 2995) [(0, 1), (1, 1), (6, 1), (8, 1), (11, 1)],
  term ((107136 : Rat) / 2995) [(0, 1), (1, 1), (6, 2), (11, 1)],
  term ((-214272 : Rat) / 2995) [(0, 1), (1, 1), (7, 1), (9, 1), (11, 1)],
  term ((107136 : Rat) / 2995) [(0, 1), (1, 1), (7, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 20. -/
theorem rs_R010_ueqv_R010NYN_partial_20_0002_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_20_0002
        rs_R010_ueqv_R010NYN_generator_20_0000_0023 =
      rs_R010_ueqv_R010NYN_partial_20_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010NYN_coefficient_20_0003 : Poly :=
[
  term ((170688 : Rat) / 2995) [(0, 1), (1, 1), (15, 1)]
]

/-- Partial product 3 for generator 20. -/
def rs_R010_ueqv_R010NYN_partial_20_0003 : Poly :=
[
  term ((341376 : Rat) / 2995) [(0, 1), (1, 1), (6, 1), (8, 1), (15, 1)],
  term ((-170688 : Rat) / 2995) [(0, 1), (1, 1), (6, 2), (15, 1)],
  term ((341376 : Rat) / 2995) [(0, 1), (1, 1), (7, 1), (9, 1), (15, 1)],
  term ((-170688 : Rat) / 2995) [(0, 1), (1, 1), (7, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 20. -/
theorem rs_R010_ueqv_R010NYN_partial_20_0003_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_20_0003
        rs_R010_ueqv_R010NYN_generator_20_0000_0023 =
      rs_R010_ueqv_R010NYN_partial_20_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010NYN_coefficient_20_0004 : Poly :=
[
  term ((-64 : Rat) / 5) [(0, 1), (1, 1), (15, 1), (16, 1)]
]

/-- Partial product 4 for generator 20. -/
def rs_R010_ueqv_R010NYN_partial_20_0004 : Poly :=
[
  term ((-128 : Rat) / 5) [(0, 1), (1, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((64 : Rat) / 5) [(0, 1), (1, 1), (6, 2), (15, 1), (16, 1)],
  term ((-128 : Rat) / 5) [(0, 1), (1, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((64 : Rat) / 5) [(0, 1), (1, 1), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 20. -/
theorem rs_R010_ueqv_R010NYN_partial_20_0004_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_20_0004
        rs_R010_ueqv_R010NYN_generator_20_0000_0023 =
      rs_R010_ueqv_R010NYN_partial_20_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010NYN_coefficient_20_0005 : Poly :=
[
  term ((-2571264 : Rat) / 2995) [(0, 1), (3, 1), (11, 1)]
]

/-- Partial product 5 for generator 20. -/
def rs_R010_ueqv_R010NYN_partial_20_0005 : Poly :=
[
  term ((-5142528 : Rat) / 2995) [(0, 1), (3, 1), (6, 1), (8, 1), (11, 1)],
  term ((2571264 : Rat) / 2995) [(0, 1), (3, 1), (6, 2), (11, 1)],
  term ((-5142528 : Rat) / 2995) [(0, 1), (3, 1), (7, 1), (9, 1), (11, 1)],
  term ((2571264 : Rat) / 2995) [(0, 1), (3, 1), (7, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 20. -/
theorem rs_R010_ueqv_R010NYN_partial_20_0005_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_20_0005
        rs_R010_ueqv_R010NYN_generator_20_0000_0023 =
      rs_R010_ueqv_R010NYN_partial_20_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010NYN_coefficient_20_0006 : Poly :=
[
  term ((2757312 : Rat) / 2995) [(0, 1), (3, 1), (15, 1)]
]

/-- Partial product 6 for generator 20. -/
def rs_R010_ueqv_R010NYN_partial_20_0006 : Poly :=
[
  term ((5514624 : Rat) / 2995) [(0, 1), (3, 1), (6, 1), (8, 1), (15, 1)],
  term ((-2757312 : Rat) / 2995) [(0, 1), (3, 1), (6, 2), (15, 1)],
  term ((5514624 : Rat) / 2995) [(0, 1), (3, 1), (7, 1), (9, 1), (15, 1)],
  term ((-2757312 : Rat) / 2995) [(0, 1), (3, 1), (7, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 20. -/
theorem rs_R010_ueqv_R010NYN_partial_20_0006_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_20_0006
        rs_R010_ueqv_R010NYN_generator_20_0000_0023 =
      rs_R010_ueqv_R010NYN_partial_20_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010NYN_coefficient_20_0007 : Poly :=
[
  term ((-636 : Rat) / 5) [(0, 1), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 7 for generator 20. -/
def rs_R010_ueqv_R010NYN_partial_20_0007 : Poly :=
[
  term ((-1272 : Rat) / 5) [(0, 1), (3, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((636 : Rat) / 5) [(0, 1), (3, 1), (6, 2), (15, 1), (16, 1)],
  term ((-1272 : Rat) / 5) [(0, 1), (3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((636 : Rat) / 5) [(0, 1), (3, 1), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 20. -/
theorem rs_R010_ueqv_R010NYN_partial_20_0007_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_20_0007
        rs_R010_ueqv_R010NYN_generator_20_0000_0023 =
      rs_R010_ueqv_R010NYN_partial_20_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010NYN_coefficient_20_0008 : Poly :=
[
  term ((4983552 : Rat) / 2995) [(0, 1), (11, 1), (15, 1)]
]

/-- Partial product 8 for generator 20. -/
def rs_R010_ueqv_R010NYN_partial_20_0008 : Poly :=
[
  term ((9967104 : Rat) / 2995) [(0, 1), (6, 1), (8, 1), (11, 1), (15, 1)],
  term ((-4983552 : Rat) / 2995) [(0, 1), (6, 2), (11, 1), (15, 1)],
  term ((9967104 : Rat) / 2995) [(0, 1), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((-4983552 : Rat) / 2995) [(0, 1), (7, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 20. -/
theorem rs_R010_ueqv_R010NYN_partial_20_0008_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_20_0008
        rs_R010_ueqv_R010NYN_generator_20_0000_0023 =
      rs_R010_ueqv_R010NYN_partial_20_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010NYN_coefficient_20_0009 : Poly :=
[
  term ((-948 : Rat) / 5) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 9 for generator 20. -/
def rs_R010_ueqv_R010NYN_partial_20_0009 : Poly :=
[
  term ((-1896 : Rat) / 5) [(0, 1), (6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((948 : Rat) / 5) [(0, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1896 : Rat) / 5) [(0, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((948 : Rat) / 5) [(0, 1), (7, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 20. -/
theorem rs_R010_ueqv_R010NYN_partial_20_0009_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_20_0009
        rs_R010_ueqv_R010NYN_generator_20_0000_0023 =
      rs_R010_ueqv_R010NYN_partial_20_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010NYN_coefficient_20_0010 : Poly :=
[
  term ((-2892672 : Rat) / 2995) [(0, 1), (11, 2)]
]

/-- Partial product 10 for generator 20. -/
def rs_R010_ueqv_R010NYN_partial_20_0010 : Poly :=
[
  term ((-5785344 : Rat) / 2995) [(0, 1), (6, 1), (8, 1), (11, 2)],
  term ((2892672 : Rat) / 2995) [(0, 1), (6, 2), (11, 2)],
  term ((-5785344 : Rat) / 2995) [(0, 1), (7, 1), (9, 1), (11, 2)],
  term ((2892672 : Rat) / 2995) [(0, 1), (7, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 20. -/
theorem rs_R010_ueqv_R010NYN_partial_20_0010_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_20_0010
        rs_R010_ueqv_R010NYN_generator_20_0000_0023 =
      rs_R010_ueqv_R010NYN_partial_20_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010NYN_coefficient_20_0011 : Poly :=
[
  term ((-2423808 : Rat) / 2995) [(0, 1), (15, 2)]
]

/-- Partial product 11 for generator 20. -/
def rs_R010_ueqv_R010NYN_partial_20_0011 : Poly :=
[
  term ((-4847616 : Rat) / 2995) [(0, 1), (6, 1), (8, 1), (15, 2)],
  term ((2423808 : Rat) / 2995) [(0, 1), (6, 2), (15, 2)],
  term ((-4847616 : Rat) / 2995) [(0, 1), (7, 1), (9, 1), (15, 2)],
  term ((2423808 : Rat) / 2995) [(0, 1), (7, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 20. -/
theorem rs_R010_ueqv_R010NYN_partial_20_0011_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_20_0011
        rs_R010_ueqv_R010NYN_generator_20_0000_0023 =
      rs_R010_ueqv_R010NYN_partial_20_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010NYN_coefficient_20_0012 : Poly :=
[
  term ((534 : Rat) / 5) [(0, 1), (15, 2), (16, 1)]
]

/-- Partial product 12 for generator 20. -/
def rs_R010_ueqv_R010NYN_partial_20_0012 : Poly :=
[
  term ((1068 : Rat) / 5) [(0, 1), (6, 1), (8, 1), (15, 2), (16, 1)],
  term ((-534 : Rat) / 5) [(0, 1), (6, 2), (15, 2), (16, 1)],
  term ((1068 : Rat) / 5) [(0, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-534 : Rat) / 5) [(0, 1), (7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 20. -/
theorem rs_R010_ueqv_R010NYN_partial_20_0012_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_20_0012
        rs_R010_ueqv_R010NYN_generator_20_0000_0023 =
      rs_R010_ueqv_R010NYN_partial_20_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010NYN_coefficient_20_0013 : Poly :=
[
  term ((-26784 : Rat) / 2995) [(1, 1), (11, 1)]
]

/-- Partial product 13 for generator 20. -/
def rs_R010_ueqv_R010NYN_partial_20_0013 : Poly :=
[
  term ((-53568 : Rat) / 2995) [(1, 1), (6, 1), (8, 1), (11, 1)],
  term ((26784 : Rat) / 2995) [(1, 1), (6, 2), (11, 1)],
  term ((-53568 : Rat) / 2995) [(1, 1), (7, 1), (9, 1), (11, 1)],
  term ((26784 : Rat) / 2995) [(1, 1), (7, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 20. -/
theorem rs_R010_ueqv_R010NYN_partial_20_0013_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_20_0013
        rs_R010_ueqv_R010NYN_generator_20_0000_0023 =
      rs_R010_ueqv_R010NYN_partial_20_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010NYN_coefficient_20_0014 : Poly :=
[
  term ((-113568 : Rat) / 2995) [(1, 1), (15, 1)]
]

/-- Partial product 14 for generator 20. -/
def rs_R010_ueqv_R010NYN_partial_20_0014 : Poly :=
[
  term ((-227136 : Rat) / 2995) [(1, 1), (6, 1), (8, 1), (15, 1)],
  term ((113568 : Rat) / 2995) [(1, 1), (6, 2), (15, 1)],
  term ((-227136 : Rat) / 2995) [(1, 1), (7, 1), (9, 1), (15, 1)],
  term ((113568 : Rat) / 2995) [(1, 1), (7, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 20. -/
theorem rs_R010_ueqv_R010NYN_partial_20_0014_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_20_0014
        rs_R010_ueqv_R010NYN_generator_20_0000_0023 =
      rs_R010_ueqv_R010NYN_partial_20_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010NYN_coefficient_20_0015 : Poly :=
[
  term ((19 : Rat) / 5) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 15 for generator 20. -/
def rs_R010_ueqv_R010NYN_partial_20_0015 : Poly :=
[
  term ((38 : Rat) / 5) [(1, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-19 : Rat) / 5) [(1, 1), (6, 2), (15, 1), (16, 1)],
  term ((38 : Rat) / 5) [(1, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-19 : Rat) / 5) [(1, 1), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 20. -/
theorem rs_R010_ueqv_R010NYN_partial_20_0015_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_20_0015
        rs_R010_ueqv_R010NYN_generator_20_0000_0023 =
      rs_R010_ueqv_R010NYN_partial_20_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010NYN_coefficient_20_0016 : Poly :=
[
  term ((1285632 : Rat) / 2995) [(3, 1), (11, 1)]
]

/-- Partial product 16 for generator 20. -/
def rs_R010_ueqv_R010NYN_partial_20_0016 : Poly :=
[
  term ((2571264 : Rat) / 2995) [(3, 1), (6, 1), (8, 1), (11, 1)],
  term ((-1285632 : Rat) / 2995) [(3, 1), (6, 2), (11, 1)],
  term ((2571264 : Rat) / 2995) [(3, 1), (7, 1), (9, 1), (11, 1)],
  term ((-1285632 : Rat) / 2995) [(3, 1), (7, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 20. -/
theorem rs_R010_ueqv_R010NYN_partial_20_0016_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_20_0016
        rs_R010_ueqv_R010NYN_generator_20_0000_0023 =
      rs_R010_ueqv_R010NYN_partial_20_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010NYN_coefficient_20_0017 : Poly :=
[
  term ((-1378656 : Rat) / 2995) [(3, 1), (15, 1)]
]

/-- Partial product 17 for generator 20. -/
def rs_R010_ueqv_R010NYN_partial_20_0017 : Poly :=
[
  term ((-2757312 : Rat) / 2995) [(3, 1), (6, 1), (8, 1), (15, 1)],
  term ((1378656 : Rat) / 2995) [(3, 1), (6, 2), (15, 1)],
  term ((-2757312 : Rat) / 2995) [(3, 1), (7, 1), (9, 1), (15, 1)],
  term ((1378656 : Rat) / 2995) [(3, 1), (7, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 20. -/
theorem rs_R010_ueqv_R010NYN_partial_20_0017_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_20_0017
        rs_R010_ueqv_R010NYN_generator_20_0000_0023 =
      rs_R010_ueqv_R010NYN_partial_20_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010NYN_coefficient_20_0018 : Poly :=
[
  term ((318 : Rat) / 5) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 18 for generator 20. -/
def rs_R010_ueqv_R010NYN_partial_20_0018 : Poly :=
[
  term ((636 : Rat) / 5) [(3, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-318 : Rat) / 5) [(3, 1), (6, 2), (15, 1), (16, 1)],
  term ((636 : Rat) / 5) [(3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-318 : Rat) / 5) [(3, 1), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 20. -/
theorem rs_R010_ueqv_R010NYN_partial_20_0018_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_20_0018
        rs_R010_ueqv_R010NYN_generator_20_0000_0023 =
      rs_R010_ueqv_R010NYN_partial_20_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010NYN_coefficient_20_0019 : Poly :=
[
  term ((-2411424 : Rat) / 2995) [(11, 1), (15, 1)]
]

/-- Partial product 19 for generator 20. -/
def rs_R010_ueqv_R010NYN_partial_20_0019 : Poly :=
[
  term ((-4822848 : Rat) / 2995) [(6, 1), (8, 1), (11, 1), (15, 1)],
  term ((2411424 : Rat) / 2995) [(6, 2), (11, 1), (15, 1)],
  term ((-4822848 : Rat) / 2995) [(7, 1), (9, 1), (11, 1), (15, 1)],
  term ((2411424 : Rat) / 2995) [(7, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 20. -/
theorem rs_R010_ueqv_R010NYN_partial_20_0019_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_20_0019
        rs_R010_ueqv_R010NYN_generator_20_0000_0023 =
      rs_R010_ueqv_R010NYN_partial_20_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010NYN_coefficient_20_0020 : Poly :=
[
  term ((474 : Rat) / 5) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 20 for generator 20. -/
def rs_R010_ueqv_R010NYN_partial_20_0020 : Poly :=
[
  term ((948 : Rat) / 5) [(6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-474 : Rat) / 5) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term ((948 : Rat) / 5) [(7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-474 : Rat) / 5) [(7, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 20. -/
theorem rs_R010_ueqv_R010NYN_partial_20_0020_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_20_0020
        rs_R010_ueqv_R010NYN_generator_20_0000_0023 =
      rs_R010_ueqv_R010NYN_partial_20_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010NYN_coefficient_20_0021 : Poly :=
[
  term ((1446336 : Rat) / 2995) [(11, 2)]
]

/-- Partial product 21 for generator 20. -/
def rs_R010_ueqv_R010NYN_partial_20_0021 : Poly :=
[
  term ((2892672 : Rat) / 2995) [(6, 1), (8, 1), (11, 2)],
  term ((-1446336 : Rat) / 2995) [(6, 2), (11, 2)],
  term ((2892672 : Rat) / 2995) [(7, 1), (9, 1), (11, 2)],
  term ((-1446336 : Rat) / 2995) [(7, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 20. -/
theorem rs_R010_ueqv_R010NYN_partial_20_0021_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_20_0021
        rs_R010_ueqv_R010NYN_generator_20_0000_0023 =
      rs_R010_ueqv_R010NYN_partial_20_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010NYN_coefficient_20_0022 : Poly :=
[
  term ((1240128 : Rat) / 2995) [(15, 2)]
]

/-- Partial product 22 for generator 20. -/
def rs_R010_ueqv_R010NYN_partial_20_0022 : Poly :=
[
  term ((2480256 : Rat) / 2995) [(6, 1), (8, 1), (15, 2)],
  term ((-1240128 : Rat) / 2995) [(6, 2), (15, 2)],
  term ((2480256 : Rat) / 2995) [(7, 1), (9, 1), (15, 2)],
  term ((-1240128 : Rat) / 2995) [(7, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 20. -/
theorem rs_R010_ueqv_R010NYN_partial_20_0022_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_20_0022
        rs_R010_ueqv_R010NYN_generator_20_0000_0023 =
      rs_R010_ueqv_R010NYN_partial_20_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010NYN_coefficient_20_0023 : Poly :=
[
  term ((-254 : Rat) / 5) [(15, 2), (16, 1)]
]

/-- Partial product 23 for generator 20. -/
def rs_R010_ueqv_R010NYN_partial_20_0023 : Poly :=
[
  term ((-508 : Rat) / 5) [(6, 1), (8, 1), (15, 2), (16, 1)],
  term ((254 : Rat) / 5) [(6, 2), (15, 2), (16, 1)],
  term ((-508 : Rat) / 5) [(7, 1), (9, 1), (15, 2), (16, 1)],
  term ((254 : Rat) / 5) [(7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 20. -/
theorem rs_R010_ueqv_R010NYN_partial_20_0023_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_20_0023
        rs_R010_ueqv_R010NYN_generator_20_0000_0023 =
      rs_R010_ueqv_R010NYN_partial_20_0023 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010NYN_partials_20_0000_0023 : List Poly :=
[
  rs_R010_ueqv_R010NYN_partial_20_0000,
  rs_R010_ueqv_R010NYN_partial_20_0001,
  rs_R010_ueqv_R010NYN_partial_20_0002,
  rs_R010_ueqv_R010NYN_partial_20_0003,
  rs_R010_ueqv_R010NYN_partial_20_0004,
  rs_R010_ueqv_R010NYN_partial_20_0005,
  rs_R010_ueqv_R010NYN_partial_20_0006,
  rs_R010_ueqv_R010NYN_partial_20_0007,
  rs_R010_ueqv_R010NYN_partial_20_0008,
  rs_R010_ueqv_R010NYN_partial_20_0009,
  rs_R010_ueqv_R010NYN_partial_20_0010,
  rs_R010_ueqv_R010NYN_partial_20_0011,
  rs_R010_ueqv_R010NYN_partial_20_0012,
  rs_R010_ueqv_R010NYN_partial_20_0013,
  rs_R010_ueqv_R010NYN_partial_20_0014,
  rs_R010_ueqv_R010NYN_partial_20_0015,
  rs_R010_ueqv_R010NYN_partial_20_0016,
  rs_R010_ueqv_R010NYN_partial_20_0017,
  rs_R010_ueqv_R010NYN_partial_20_0018,
  rs_R010_ueqv_R010NYN_partial_20_0019,
  rs_R010_ueqv_R010NYN_partial_20_0020,
  rs_R010_ueqv_R010NYN_partial_20_0021,
  rs_R010_ueqv_R010NYN_partial_20_0022,
  rs_R010_ueqv_R010NYN_partial_20_0023
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010NYN_block_20_0000_0023 : Poly :=
[
  term ((-214272 : Rat) / 2995) [(0, 1), (1, 1), (6, 1), (8, 1), (11, 1)],
  term ((341376 : Rat) / 2995) [(0, 1), (1, 1), (6, 1), (8, 1), (15, 1)],
  term ((-128 : Rat) / 5) [(0, 1), (1, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((107136 : Rat) / 2995) [(0, 1), (1, 1), (6, 2), (11, 1)],
  term ((-170688 : Rat) / 2995) [(0, 1), (1, 1), (6, 2), (15, 1)],
  term ((64 : Rat) / 5) [(0, 1), (1, 1), (6, 2), (15, 1), (16, 1)],
  term ((-214272 : Rat) / 2995) [(0, 1), (1, 1), (7, 1), (9, 1), (11, 1)],
  term ((341376 : Rat) / 2995) [(0, 1), (1, 1), (7, 1), (9, 1), (15, 1)],
  term ((-128 : Rat) / 5) [(0, 1), (1, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((107136 : Rat) / 2995) [(0, 1), (1, 1), (7, 2), (11, 1)],
  term ((-170688 : Rat) / 2995) [(0, 1), (1, 1), (7, 2), (15, 1)],
  term ((64 : Rat) / 5) [(0, 1), (1, 1), (7, 2), (15, 1), (16, 1)],
  term ((-5142528 : Rat) / 2995) [(0, 1), (3, 1), (6, 1), (8, 1), (11, 1)],
  term ((5514624 : Rat) / 2995) [(0, 1), (3, 1), (6, 1), (8, 1), (15, 1)],
  term ((-1272 : Rat) / 5) [(0, 1), (3, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((2571264 : Rat) / 2995) [(0, 1), (3, 1), (6, 2), (11, 1)],
  term ((-2757312 : Rat) / 2995) [(0, 1), (3, 1), (6, 2), (15, 1)],
  term ((636 : Rat) / 5) [(0, 1), (3, 1), (6, 2), (15, 1), (16, 1)],
  term ((-5142528 : Rat) / 2995) [(0, 1), (3, 1), (7, 1), (9, 1), (11, 1)],
  term ((5514624 : Rat) / 2995) [(0, 1), (3, 1), (7, 1), (9, 1), (15, 1)],
  term ((-1272 : Rat) / 5) [(0, 1), (3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((2571264 : Rat) / 2995) [(0, 1), (3, 1), (7, 2), (11, 1)],
  term ((-2757312 : Rat) / 2995) [(0, 1), (3, 1), (7, 2), (15, 1)],
  term ((636 : Rat) / 5) [(0, 1), (3, 1), (7, 2), (15, 1), (16, 1)],
  term ((42144 : Rat) / 599) [(0, 1), (6, 1), (8, 1)],
  term ((9967104 : Rat) / 2995) [(0, 1), (6, 1), (8, 1), (11, 1), (15, 1)],
  term ((-1896 : Rat) / 5) [(0, 1), (6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-5785344 : Rat) / 2995) [(0, 1), (6, 1), (8, 1), (11, 2)],
  term ((-4847616 : Rat) / 2995) [(0, 1), (6, 1), (8, 1), (15, 2)],
  term ((1068 : Rat) / 5) [(0, 1), (6, 1), (8, 1), (15, 2), (16, 1)],
  term ((-21072 : Rat) / 599) [(0, 1), (6, 2)],
  term ((-4983552 : Rat) / 2995) [(0, 1), (6, 2), (11, 1), (15, 1)],
  term ((948 : Rat) / 5) [(0, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((2892672 : Rat) / 2995) [(0, 1), (6, 2), (11, 2)],
  term ((2423808 : Rat) / 2995) [(0, 1), (6, 2), (15, 2)],
  term ((-534 : Rat) / 5) [(0, 1), (6, 2), (15, 2), (16, 1)],
  term ((42144 : Rat) / 599) [(0, 1), (7, 1), (9, 1)],
  term ((9967104 : Rat) / 2995) [(0, 1), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((-1896 : Rat) / 5) [(0, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-5785344 : Rat) / 2995) [(0, 1), (7, 1), (9, 1), (11, 2)],
  term ((-4847616 : Rat) / 2995) [(0, 1), (7, 1), (9, 1), (15, 2)],
  term ((1068 : Rat) / 5) [(0, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-21072 : Rat) / 599) [(0, 1), (7, 2)],
  term ((-4983552 : Rat) / 2995) [(0, 1), (7, 2), (11, 1), (15, 1)],
  term ((948 : Rat) / 5) [(0, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((2892672 : Rat) / 2995) [(0, 1), (7, 2), (11, 2)],
  term ((2423808 : Rat) / 2995) [(0, 1), (7, 2), (15, 2)],
  term ((-534 : Rat) / 5) [(0, 1), (7, 2), (15, 2), (16, 1)],
  term ((-53568 : Rat) / 2995) [(1, 1), (6, 1), (8, 1), (11, 1)],
  term ((-227136 : Rat) / 2995) [(1, 1), (6, 1), (8, 1), (15, 1)],
  term ((38 : Rat) / 5) [(1, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((26784 : Rat) / 2995) [(1, 1), (6, 2), (11, 1)],
  term ((113568 : Rat) / 2995) [(1, 1), (6, 2), (15, 1)],
  term ((-19 : Rat) / 5) [(1, 1), (6, 2), (15, 1), (16, 1)],
  term ((-53568 : Rat) / 2995) [(1, 1), (7, 1), (9, 1), (11, 1)],
  term ((-227136 : Rat) / 2995) [(1, 1), (7, 1), (9, 1), (15, 1)],
  term ((38 : Rat) / 5) [(1, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((26784 : Rat) / 2995) [(1, 1), (7, 2), (11, 1)],
  term ((113568 : Rat) / 2995) [(1, 1), (7, 2), (15, 1)],
  term ((-19 : Rat) / 5) [(1, 1), (7, 2), (15, 1), (16, 1)],
  term ((2571264 : Rat) / 2995) [(3, 1), (6, 1), (8, 1), (11, 1)],
  term ((-2757312 : Rat) / 2995) [(3, 1), (6, 1), (8, 1), (15, 1)],
  term ((636 : Rat) / 5) [(3, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-1285632 : Rat) / 2995) [(3, 1), (6, 2), (11, 1)],
  term ((1378656 : Rat) / 2995) [(3, 1), (6, 2), (15, 1)],
  term ((-318 : Rat) / 5) [(3, 1), (6, 2), (15, 1), (16, 1)],
  term ((2571264 : Rat) / 2995) [(3, 1), (7, 1), (9, 1), (11, 1)],
  term ((-2757312 : Rat) / 2995) [(3, 1), (7, 1), (9, 1), (15, 1)],
  term ((636 : Rat) / 5) [(3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1285632 : Rat) / 2995) [(3, 1), (7, 2), (11, 1)],
  term ((1378656 : Rat) / 2995) [(3, 1), (7, 2), (15, 1)],
  term ((-318 : Rat) / 5) [(3, 1), (7, 2), (15, 1), (16, 1)],
  term ((-21072 : Rat) / 599) [(6, 1), (8, 1)],
  term ((-4822848 : Rat) / 2995) [(6, 1), (8, 1), (11, 1), (15, 1)],
  term ((948 : Rat) / 5) [(6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((2892672 : Rat) / 2995) [(6, 1), (8, 1), (11, 2)],
  term ((2480256 : Rat) / 2995) [(6, 1), (8, 1), (15, 2)],
  term ((-508 : Rat) / 5) [(6, 1), (8, 1), (15, 2), (16, 1)],
  term ((10536 : Rat) / 599) [(6, 2)],
  term ((2411424 : Rat) / 2995) [(6, 2), (11, 1), (15, 1)],
  term ((-474 : Rat) / 5) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1446336 : Rat) / 2995) [(6, 2), (11, 2)],
  term ((-1240128 : Rat) / 2995) [(6, 2), (15, 2)],
  term ((254 : Rat) / 5) [(6, 2), (15, 2), (16, 1)],
  term ((-21072 : Rat) / 599) [(7, 1), (9, 1)],
  term ((-4822848 : Rat) / 2995) [(7, 1), (9, 1), (11, 1), (15, 1)],
  term ((948 : Rat) / 5) [(7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((2892672 : Rat) / 2995) [(7, 1), (9, 1), (11, 2)],
  term ((2480256 : Rat) / 2995) [(7, 1), (9, 1), (15, 2)],
  term ((-508 : Rat) / 5) [(7, 1), (9, 1), (15, 2), (16, 1)],
  term ((10536 : Rat) / 599) [(7, 2)],
  term ((2411424 : Rat) / 2995) [(7, 2), (11, 1), (15, 1)],
  term ((-474 : Rat) / 5) [(7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1446336 : Rat) / 2995) [(7, 2), (11, 2)],
  term ((-1240128 : Rat) / 2995) [(7, 2), (15, 2)],
  term ((254 : Rat) / 5) [(7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 20, terms 0 through 23. -/
theorem rs_R010_ueqv_R010NYN_block_20_0000_0023_valid :
    checkProductSumEq rs_R010_ueqv_R010NYN_partials_20_0000_0023
      rs_R010_ueqv_R010NYN_block_20_0000_0023 = true := by
  native_decide

end R010UeqvR010NYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
