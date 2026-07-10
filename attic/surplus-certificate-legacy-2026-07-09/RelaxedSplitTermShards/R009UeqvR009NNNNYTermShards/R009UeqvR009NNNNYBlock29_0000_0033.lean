/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NNNNY, term block 29:0-33

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NNNNYTermShards

/-- Generator polynomial 29 for relaxed split surplus certificate `R009:u=v:R009NNNNY`. -/
def rs_R009_ueqv_R009NNNNY_generator_29_0000_0033 : Poly :=
[
  term (-2 : Rat) [(0, 1), (14, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (15, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(2, 1), (14, 1)],
  term (-1 : Rat) [(2, 2)],
  term (2 : Rat) [(3, 1), (15, 1)],
  term (-1 : Rat) [(3, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNNY_coefficient_29_0000 : Poly :=
[
  term ((245 : Rat) / 93) [(0, 1), (14, 1), (16, 1)]
]

/-- Partial product 0 for generator 29. -/
def rs_R009_ueqv_R009NNNNY_partial_29_0000 : Poly :=
[
  term ((-490 : Rat) / 93) [(0, 1), (1, 1), (14, 1), (15, 1), (16, 1)],
  term ((245 : Rat) / 93) [(0, 1), (1, 2), (14, 1), (16, 1)],
  term ((490 : Rat) / 93) [(0, 1), (2, 1), (14, 2), (16, 1)],
  term ((-245 : Rat) / 93) [(0, 1), (2, 2), (14, 1), (16, 1)],
  term ((490 : Rat) / 93) [(0, 1), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-245 : Rat) / 93) [(0, 1), (3, 2), (14, 1), (16, 1)],
  term ((-490 : Rat) / 93) [(0, 2), (14, 2), (16, 1)],
  term ((245 : Rat) / 93) [(0, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 29. -/
theorem rs_R009_ueqv_R009NNNNY_partial_29_0000_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_29_0000
        rs_R009_ueqv_R009NNNNY_generator_29_0000_0033 =
      rs_R009_ueqv_R009NNNNY_partial_29_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNNY_coefficient_29_0001 : Poly :=
[
  term ((-103 : Rat) / 186) [(0, 1), (16, 1)]
]

/-- Partial product 1 for generator 29. -/
def rs_R009_ueqv_R009NNNNY_partial_29_0001 : Poly :=
[
  term ((103 : Rat) / 93) [(0, 1), (1, 1), (15, 1), (16, 1)],
  term ((-103 : Rat) / 186) [(0, 1), (1, 2), (16, 1)],
  term ((-103 : Rat) / 93) [(0, 1), (2, 1), (14, 1), (16, 1)],
  term ((103 : Rat) / 186) [(0, 1), (2, 2), (16, 1)],
  term ((-103 : Rat) / 93) [(0, 1), (3, 1), (15, 1), (16, 1)],
  term ((103 : Rat) / 186) [(0, 1), (3, 2), (16, 1)],
  term ((103 : Rat) / 93) [(0, 2), (14, 1), (16, 1)],
  term ((-103 : Rat) / 186) [(0, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 29. -/
theorem rs_R009_ueqv_R009NNNNY_partial_29_0001_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_29_0001
        rs_R009_ueqv_R009NNNNY_generator_29_0000_0033 =
      rs_R009_ueqv_R009NNNNY_partial_29_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNNY_coefficient_29_0002 : Poly :=
[
  term ((-42 : Rat) / 31) [(1, 1), (5, 1), (16, 1)]
]

/-- Partial product 2 for generator 29. -/
def rs_R009_ueqv_R009NNNNY_partial_29_0002 : Poly :=
[
  term ((84 : Rat) / 31) [(0, 1), (1, 1), (5, 1), (14, 1), (16, 1)],
  term ((-42 : Rat) / 31) [(0, 2), (1, 1), (5, 1), (16, 1)],
  term ((-84 : Rat) / 31) [(1, 1), (2, 1), (5, 1), (14, 1), (16, 1)],
  term ((42 : Rat) / 31) [(1, 1), (2, 2), (5, 1), (16, 1)],
  term ((-84 : Rat) / 31) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((42 : Rat) / 31) [(1, 1), (3, 2), (5, 1), (16, 1)],
  term ((84 : Rat) / 31) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((-42 : Rat) / 31) [(1, 3), (5, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 29. -/
theorem rs_R009_ueqv_R009NNNNY_partial_29_0002_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_29_0002
        rs_R009_ueqv_R009NNNNY_generator_29_0000_0033 =
      rs_R009_ueqv_R009NNNNY_partial_29_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNNY_coefficient_29_0003 : Poly :=
[
  term ((-221 : Rat) / 186) [(2, 1), (16, 1)]
]

/-- Partial product 3 for generator 29. -/
def rs_R009_ueqv_R009NNNNY_partial_29_0003 : Poly :=
[
  term ((221 : Rat) / 93) [(0, 1), (2, 1), (14, 1), (16, 1)],
  term ((-221 : Rat) / 186) [(0, 2), (2, 1), (16, 1)],
  term ((221 : Rat) / 93) [(1, 1), (2, 1), (15, 1), (16, 1)],
  term ((-221 : Rat) / 186) [(1, 2), (2, 1), (16, 1)],
  term ((-221 : Rat) / 93) [(2, 1), (3, 1), (15, 1), (16, 1)],
  term ((221 : Rat) / 186) [(2, 1), (3, 2), (16, 1)],
  term ((-221 : Rat) / 93) [(2, 2), (14, 1), (16, 1)],
  term ((221 : Rat) / 186) [(2, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 29. -/
theorem rs_R009_ueqv_R009NNNNY_partial_29_0003_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_29_0003
        rs_R009_ueqv_R009NNNNY_generator_29_0000_0033 =
      rs_R009_ueqv_R009NNNNY_partial_29_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNNY_coefficient_29_0004 : Poly :=
[
  term ((-442 : Rat) / 93) [(3, 1), (5, 1), (16, 1)]
]

/-- Partial product 4 for generator 29. -/
def rs_R009_ueqv_R009NNNNY_partial_29_0004 : Poly :=
[
  term ((884 : Rat) / 93) [(0, 1), (3, 1), (5, 1), (14, 1), (16, 1)],
  term ((-442 : Rat) / 93) [(0, 2), (3, 1), (5, 1), (16, 1)],
  term ((884 : Rat) / 93) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((-442 : Rat) / 93) [(1, 2), (3, 1), (5, 1), (16, 1)],
  term ((-884 : Rat) / 93) [(2, 1), (3, 1), (5, 1), (14, 1), (16, 1)],
  term ((442 : Rat) / 93) [(2, 2), (3, 1), (5, 1), (16, 1)],
  term ((-884 : Rat) / 93) [(3, 2), (5, 1), (15, 1), (16, 1)],
  term ((442 : Rat) / 93) [(3, 3), (5, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 29. -/
theorem rs_R009_ueqv_R009NNNNY_partial_29_0004_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_29_0004
        rs_R009_ueqv_R009NNNNY_generator_29_0000_0033 =
      rs_R009_ueqv_R009NNNNY_partial_29_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNNY_coefficient_29_0005 : Poly :=
[
  term ((-442 : Rat) / 93) [(3, 1), (11, 1), (16, 1)]
]

/-- Partial product 5 for generator 29. -/
def rs_R009_ueqv_R009NNNNY_partial_29_0005 : Poly :=
[
  term ((884 : Rat) / 93) [(0, 1), (3, 1), (11, 1), (14, 1), (16, 1)],
  term ((-442 : Rat) / 93) [(0, 2), (3, 1), (11, 1), (16, 1)],
  term ((884 : Rat) / 93) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((-442 : Rat) / 93) [(1, 2), (3, 1), (11, 1), (16, 1)],
  term ((-884 : Rat) / 93) [(2, 1), (3, 1), (11, 1), (14, 1), (16, 1)],
  term ((442 : Rat) / 93) [(2, 2), (3, 1), (11, 1), (16, 1)],
  term ((-884 : Rat) / 93) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((442 : Rat) / 93) [(3, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 29. -/
theorem rs_R009_ueqv_R009NNNNY_partial_29_0005_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_29_0005
        rs_R009_ueqv_R009NNNNY_generator_29_0000_0033 =
      rs_R009_ueqv_R009NNNNY_partial_29_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNNY_coefficient_29_0006 : Poly :=
[
  term ((221 : Rat) / 93) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 6 for generator 29. -/
def rs_R009_ueqv_R009NNNNY_partial_29_0006 : Poly :=
[
  term ((-442 : Rat) / 93) [(0, 1), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((221 : Rat) / 93) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((-442 : Rat) / 93) [(1, 1), (3, 1), (15, 2), (16, 1)],
  term ((221 : Rat) / 93) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((442 : Rat) / 93) [(2, 1), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-221 : Rat) / 93) [(2, 2), (3, 1), (15, 1), (16, 1)],
  term ((442 : Rat) / 93) [(3, 2), (15, 2), (16, 1)],
  term ((-221 : Rat) / 93) [(3, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 29. -/
theorem rs_R009_ueqv_R009NNNNY_partial_29_0006_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_29_0006
        rs_R009_ueqv_R009NNNNY_generator_29_0000_0033 =
      rs_R009_ueqv_R009NNNNY_partial_29_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNNY_coefficient_29_0007 : Poly :=
[
  term ((190 : Rat) / 93) [(5, 1), (9, 1), (16, 1)]
]

/-- Partial product 7 for generator 29. -/
def rs_R009_ueqv_R009NNNNY_partial_29_0007 : Poly :=
[
  term ((-380 : Rat) / 93) [(0, 1), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((190 : Rat) / 93) [(0, 2), (5, 1), (9, 1), (16, 1)],
  term ((-380 : Rat) / 93) [(1, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((190 : Rat) / 93) [(1, 2), (5, 1), (9, 1), (16, 1)],
  term ((380 : Rat) / 93) [(2, 1), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((-190 : Rat) / 93) [(2, 2), (5, 1), (9, 1), (16, 1)],
  term ((380 : Rat) / 93) [(3, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-190 : Rat) / 93) [(3, 2), (5, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 29. -/
theorem rs_R009_ueqv_R009NNNNY_partial_29_0007_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_29_0007
        rs_R009_ueqv_R009NNNNY_generator_29_0000_0033 =
      rs_R009_ueqv_R009NNNNY_partial_29_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNNY_coefficient_29_0008 : Poly :=
[
  term ((335 : Rat) / 31) [(5, 1), (11, 1), (16, 1)]
]

/-- Partial product 8 for generator 29. -/
def rs_R009_ueqv_R009NNNNY_partial_29_0008 : Poly :=
[
  term ((-670 : Rat) / 31) [(0, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((335 : Rat) / 31) [(0, 2), (5, 1), (11, 1), (16, 1)],
  term ((-670 : Rat) / 31) [(1, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((335 : Rat) / 31) [(1, 2), (5, 1), (11, 1), (16, 1)],
  term ((670 : Rat) / 31) [(2, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-335 : Rat) / 31) [(2, 2), (5, 1), (11, 1), (16, 1)],
  term ((670 : Rat) / 31) [(3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-335 : Rat) / 31) [(3, 2), (5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 29. -/
theorem rs_R009_ueqv_R009NNNNY_partial_29_0008_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_29_0008
        rs_R009_ueqv_R009NNNNY_generator_29_0000_0033 =
      rs_R009_ueqv_R009NNNNY_partial_29_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNNY_coefficient_29_0009 : Poly :=
[
  term ((-16 : Rat) / 93) [(5, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 9 for generator 29. -/
def rs_R009_ueqv_R009NNNNY_partial_29_0009 : Poly :=
[
  term ((32 : Rat) / 93) [(0, 1), (5, 1), (13, 1), (14, 2), (16, 1)],
  term ((-16 : Rat) / 93) [(0, 2), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((32 : Rat) / 93) [(1, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 93) [(1, 2), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((-32 : Rat) / 93) [(2, 1), (5, 1), (13, 1), (14, 2), (16, 1)],
  term ((16 : Rat) / 93) [(2, 2), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((-32 : Rat) / 93) [(3, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 93) [(3, 2), (5, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 29. -/
theorem rs_R009_ueqv_R009NNNNY_partial_29_0009_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_29_0009
        rs_R009_ueqv_R009NNNNY_generator_29_0000_0033 =
      rs_R009_ueqv_R009NNNNY_partial_29_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNNY_coefficient_29_0010 : Poly :=
[
  term ((-413 : Rat) / 31) [(5, 1), (13, 1), (16, 1)]
]

/-- Partial product 10 for generator 29. -/
def rs_R009_ueqv_R009NNNNY_partial_29_0010 : Poly :=
[
  term ((826 : Rat) / 31) [(0, 1), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((-413 : Rat) / 31) [(0, 2), (5, 1), (13, 1), (16, 1)],
  term ((826 : Rat) / 31) [(1, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-413 : Rat) / 31) [(1, 2), (5, 1), (13, 1), (16, 1)],
  term ((-826 : Rat) / 31) [(2, 1), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((413 : Rat) / 31) [(2, 2), (5, 1), (13, 1), (16, 1)],
  term ((-826 : Rat) / 31) [(3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((413 : Rat) / 31) [(3, 2), (5, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 29. -/
theorem rs_R009_ueqv_R009NNNNY_partial_29_0010_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_29_0010
        rs_R009_ueqv_R009NNNNY_generator_29_0000_0033 =
      rs_R009_ueqv_R009NNNNY_partial_29_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNNY_coefficient_29_0011 : Poly :=
[
  term ((-197 : Rat) / 93) [(5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 11 for generator 29. -/
def rs_R009_ueqv_R009NNNNY_partial_29_0011 : Poly :=
[
  term ((394 : Rat) / 93) [(0, 1), (5, 1), (14, 2), (15, 1), (16, 1)],
  term ((-197 : Rat) / 93) [(0, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((394 : Rat) / 93) [(1, 1), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((-197 : Rat) / 93) [(1, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-394 : Rat) / 93) [(2, 1), (5, 1), (14, 2), (15, 1), (16, 1)],
  term ((197 : Rat) / 93) [(2, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-394 : Rat) / 93) [(3, 1), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((197 : Rat) / 93) [(3, 2), (5, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 29. -/
theorem rs_R009_ueqv_R009NNNNY_partial_29_0011_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_29_0011
        rs_R009_ueqv_R009NNNNY_generator_29_0000_0033 =
      rs_R009_ueqv_R009NNNNY_partial_29_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNNY_coefficient_29_0012 : Poly :=
[
  term ((-379 : Rat) / 62) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 12 for generator 29. -/
def rs_R009_ueqv_R009NNNNY_partial_29_0012 : Poly :=
[
  term ((379 : Rat) / 31) [(0, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-379 : Rat) / 62) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((379 : Rat) / 31) [(1, 1), (5, 1), (15, 2), (16, 1)],
  term ((-379 : Rat) / 62) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((-379 : Rat) / 31) [(2, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((379 : Rat) / 62) [(2, 2), (5, 1), (15, 1), (16, 1)],
  term ((-379 : Rat) / 31) [(3, 1), (5, 1), (15, 2), (16, 1)],
  term ((379 : Rat) / 62) [(3, 2), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 29. -/
theorem rs_R009_ueqv_R009NNNNY_partial_29_0012_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_29_0012
        rs_R009_ueqv_R009NNNNY_generator_29_0000_0033 =
      rs_R009_ueqv_R009NNNNY_partial_29_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNNY_coefficient_29_0013 : Poly :=
[
  term ((8 : Rat) / 93) [(5, 2), (16, 1)]
]

/-- Partial product 13 for generator 29. -/
def rs_R009_ueqv_R009NNNNY_partial_29_0013 : Poly :=
[
  term ((-16 : Rat) / 93) [(0, 1), (5, 2), (14, 1), (16, 1)],
  term ((8 : Rat) / 93) [(0, 2), (5, 2), (16, 1)],
  term ((-16 : Rat) / 93) [(1, 1), (5, 2), (15, 1), (16, 1)],
  term ((8 : Rat) / 93) [(1, 2), (5, 2), (16, 1)],
  term ((16 : Rat) / 93) [(2, 1), (5, 2), (14, 1), (16, 1)],
  term ((-8 : Rat) / 93) [(2, 2), (5, 2), (16, 1)],
  term ((16 : Rat) / 93) [(3, 1), (5, 2), (15, 1), (16, 1)],
  term ((-8 : Rat) / 93) [(3, 2), (5, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 29. -/
theorem rs_R009_ueqv_R009NNNNY_partial_29_0013_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_29_0013
        rs_R009_ueqv_R009NNNNY_generator_29_0000_0033 =
      rs_R009_ueqv_R009NNNNY_partial_29_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNNY_coefficient_29_0014 : Poly :=
[
  term ((148 : Rat) / 93) [(8, 1), (16, 1)]
]

/-- Partial product 14 for generator 29. -/
def rs_R009_ueqv_R009NNNNY_partial_29_0014 : Poly :=
[
  term ((-296 : Rat) / 93) [(0, 1), (8, 1), (14, 1), (16, 1)],
  term ((148 : Rat) / 93) [(0, 2), (8, 1), (16, 1)],
  term ((-296 : Rat) / 93) [(1, 1), (8, 1), (15, 1), (16, 1)],
  term ((148 : Rat) / 93) [(1, 2), (8, 1), (16, 1)],
  term ((296 : Rat) / 93) [(2, 1), (8, 1), (14, 1), (16, 1)],
  term ((-148 : Rat) / 93) [(2, 2), (8, 1), (16, 1)],
  term ((296 : Rat) / 93) [(3, 1), (8, 1), (15, 1), (16, 1)],
  term ((-148 : Rat) / 93) [(3, 2), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 29. -/
theorem rs_R009_ueqv_R009NNNNY_partial_29_0014_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_29_0014
        rs_R009_ueqv_R009NNNNY_generator_29_0000_0033 =
      rs_R009_ueqv_R009NNNNY_partial_29_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNNY_coefficient_29_0015 : Poly :=
[
  term ((-182 : Rat) / 93) [(9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 15 for generator 29. -/
def rs_R009_ueqv_R009NNNNY_partial_29_0015 : Poly :=
[
  term ((364 : Rat) / 93) [(0, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-182 : Rat) / 93) [(0, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((364 : Rat) / 93) [(1, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-182 : Rat) / 93) [(1, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-364 : Rat) / 93) [(2, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((182 : Rat) / 93) [(2, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-364 : Rat) / 93) [(3, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((182 : Rat) / 93) [(3, 2), (9, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 29. -/
theorem rs_R009_ueqv_R009NNNNY_partial_29_0015_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_29_0015
        rs_R009_ueqv_R009NNNNY_generator_29_0000_0033 =
      rs_R009_ueqv_R009NNNNY_partial_29_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNNY_coefficient_29_0016 : Poly :=
[
  term ((-11 : Rat) / 31) [(9, 1), (11, 1), (16, 1)]
]

/-- Partial product 16 for generator 29. -/
def rs_R009_ueqv_R009NNNNY_partial_29_0016 : Poly :=
[
  term ((22 : Rat) / 31) [(0, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-11 : Rat) / 31) [(0, 2), (9, 1), (11, 1), (16, 1)],
  term ((22 : Rat) / 31) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-11 : Rat) / 31) [(1, 2), (9, 1), (11, 1), (16, 1)],
  term ((-22 : Rat) / 31) [(2, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((11 : Rat) / 31) [(2, 2), (9, 1), (11, 1), (16, 1)],
  term ((-22 : Rat) / 31) [(3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((11 : Rat) / 31) [(3, 2), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 29. -/
theorem rs_R009_ueqv_R009NNNNY_partial_29_0016_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_29_0016
        rs_R009_ueqv_R009NNNNY_generator_29_0000_0033 =
      rs_R009_ueqv_R009NNNNY_partial_29_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNNY_coefficient_29_0017 : Poly :=
[
  term ((-8 : Rat) / 93) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 17 for generator 29. -/
def rs_R009_ueqv_R009NNNNY_partial_29_0017 : Poly :=
[
  term ((16 : Rat) / 93) [(0, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-8 : Rat) / 93) [(0, 2), (9, 1), (13, 1), (16, 1)],
  term ((16 : Rat) / 93) [(1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-8 : Rat) / 93) [(1, 2), (9, 1), (13, 1), (16, 1)],
  term ((-16 : Rat) / 93) [(2, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((8 : Rat) / 93) [(2, 2), (9, 1), (13, 1), (16, 1)],
  term ((-16 : Rat) / 93) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 93) [(3, 2), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 29. -/
theorem rs_R009_ueqv_R009NNNNY_partial_29_0017_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_29_0017
        rs_R009_ueqv_R009NNNNY_generator_29_0000_0033 =
      rs_R009_ueqv_R009NNNNY_partial_29_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNNY_coefficient_29_0018 : Poly :=
[
  term ((221 : Rat) / 93) [(10, 1), (14, 1), (16, 1)]
]

/-- Partial product 18 for generator 29. -/
def rs_R009_ueqv_R009NNNNY_partial_29_0018 : Poly :=
[
  term ((-442 : Rat) / 93) [(0, 1), (10, 1), (14, 2), (16, 1)],
  term ((221 : Rat) / 93) [(0, 2), (10, 1), (14, 1), (16, 1)],
  term ((-442 : Rat) / 93) [(1, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((221 : Rat) / 93) [(1, 2), (10, 1), (14, 1), (16, 1)],
  term ((442 : Rat) / 93) [(2, 1), (10, 1), (14, 2), (16, 1)],
  term ((-221 : Rat) / 93) [(2, 2), (10, 1), (14, 1), (16, 1)],
  term ((442 : Rat) / 93) [(3, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-221 : Rat) / 93) [(3, 2), (10, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 29. -/
theorem rs_R009_ueqv_R009NNNNY_partial_29_0018_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_29_0018
        rs_R009_ueqv_R009NNNNY_generator_29_0000_0033 =
      rs_R009_ueqv_R009NNNNY_partial_29_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNNY_coefficient_29_0019 : Poly :=
[
  term ((-135 : Rat) / 62) [(10, 1), (16, 1)]
]

/-- Partial product 19 for generator 29. -/
def rs_R009_ueqv_R009NNNNY_partial_29_0019 : Poly :=
[
  term ((135 : Rat) / 31) [(0, 1), (10, 1), (14, 1), (16, 1)],
  term ((-135 : Rat) / 62) [(0, 2), (10, 1), (16, 1)],
  term ((135 : Rat) / 31) [(1, 1), (10, 1), (15, 1), (16, 1)],
  term ((-135 : Rat) / 62) [(1, 2), (10, 1), (16, 1)],
  term ((-135 : Rat) / 31) [(2, 1), (10, 1), (14, 1), (16, 1)],
  term ((135 : Rat) / 62) [(2, 2), (10, 1), (16, 1)],
  term ((-135 : Rat) / 31) [(3, 1), (10, 1), (15, 1), (16, 1)],
  term ((135 : Rat) / 62) [(3, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 29. -/
theorem rs_R009_ueqv_R009NNNNY_partial_29_0019_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_29_0019
        rs_R009_ueqv_R009NNNNY_generator_29_0000_0033 =
      rs_R009_ueqv_R009NNNNY_partial_29_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNNY_coefficient_29_0020 : Poly :=
[
  term ((1139 : Rat) / 93) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 20 for generator 29. -/
def rs_R009_ueqv_R009NNNNY_partial_29_0020 : Poly :=
[
  term ((-2278 : Rat) / 93) [(0, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((1139 : Rat) / 93) [(0, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2278 : Rat) / 93) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1139 : Rat) / 93) [(1, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((2278 : Rat) / 93) [(2, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-1139 : Rat) / 93) [(2, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((2278 : Rat) / 93) [(3, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1139 : Rat) / 93) [(3, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 29. -/
theorem rs_R009_ueqv_R009NNNNY_partial_29_0020_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_29_0020
        rs_R009_ueqv_R009NNNNY_generator_29_0000_0033 =
      rs_R009_ueqv_R009NNNNY_partial_29_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNNY_coefficient_29_0021 : Poly :=
[
  term ((1697 : Rat) / 186) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 21 for generator 29. -/
def rs_R009_ueqv_R009NNNNY_partial_29_0021 : Poly :=
[
  term ((-1697 : Rat) / 93) [(0, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((1697 : Rat) / 186) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term ((-1697 : Rat) / 93) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1697 : Rat) / 186) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term ((1697 : Rat) / 93) [(2, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1697 : Rat) / 186) [(2, 2), (11, 1), (13, 1), (16, 1)],
  term ((1697 : Rat) / 93) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1697 : Rat) / 186) [(3, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 29. -/
theorem rs_R009_ueqv_R009NNNNY_partial_29_0021_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_29_0021
        rs_R009_ueqv_R009NNNNY_generator_29_0000_0033 =
      rs_R009_ueqv_R009NNNNY_partial_29_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNNY_coefficient_29_0022 : Poly :=
[
  term ((58 : Rat) / 93) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 22 for generator 29. -/
def rs_R009_ueqv_R009NNNNY_partial_29_0022 : Poly :=
[
  term ((-116 : Rat) / 93) [(0, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((58 : Rat) / 93) [(0, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-116 : Rat) / 93) [(1, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((58 : Rat) / 93) [(1, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((116 : Rat) / 93) [(2, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-58 : Rat) / 93) [(2, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((116 : Rat) / 93) [(3, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-58 : Rat) / 93) [(3, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 29. -/
theorem rs_R009_ueqv_R009NNNNY_partial_29_0022_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_29_0022
        rs_R009_ueqv_R009NNNNY_generator_29_0000_0033 =
      rs_R009_ueqv_R009NNNNY_partial_29_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNNY_coefficient_29_0023 : Poly :=
[
  term ((-361 : Rat) / 93) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 23 for generator 29. -/
def rs_R009_ueqv_R009NNNNY_partial_29_0023 : Poly :=
[
  term ((722 : Rat) / 93) [(0, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-361 : Rat) / 93) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((722 : Rat) / 93) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term ((-361 : Rat) / 93) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-722 : Rat) / 93) [(2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((361 : Rat) / 93) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((-722 : Rat) / 93) [(3, 1), (11, 1), (15, 2), (16, 1)],
  term ((361 : Rat) / 93) [(3, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 29. -/
theorem rs_R009_ueqv_R009NNNNY_partial_29_0023_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_29_0023
        rs_R009_ueqv_R009NNNNY_generator_29_0000_0033 =
      rs_R009_ueqv_R009NNNNY_partial_29_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNNY_coefficient_29_0024 : Poly :=
[
  term (-9 : Rat) [(11, 2), (14, 1), (16, 1)]
]

/-- Partial product 24 for generator 29. -/
def rs_R009_ueqv_R009NNNNY_partial_29_0024 : Poly :=
[
  term (18 : Rat) [(0, 1), (11, 2), (14, 2), (16, 1)],
  term (-9 : Rat) [(0, 2), (11, 2), (14, 1), (16, 1)],
  term (18 : Rat) [(1, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term (-9 : Rat) [(1, 2), (11, 2), (14, 1), (16, 1)],
  term (-18 : Rat) [(2, 1), (11, 2), (14, 2), (16, 1)],
  term (9 : Rat) [(2, 2), (11, 2), (14, 1), (16, 1)],
  term (-18 : Rat) [(3, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term (9 : Rat) [(3, 2), (11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 29. -/
theorem rs_R009_ueqv_R009NNNNY_partial_29_0024_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_29_0024
        rs_R009_ueqv_R009NNNNY_generator_29_0000_0033 =
      rs_R009_ueqv_R009NNNNY_partial_29_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNNY_coefficient_29_0025 : Poly :=
[
  term ((-9 : Rat) / 2) [(11, 2), (16, 1)]
]

/-- Partial product 25 for generator 29. -/
def rs_R009_ueqv_R009NNNNY_partial_29_0025 : Poly :=
[
  term (9 : Rat) [(0, 1), (11, 2), (14, 1), (16, 1)],
  term ((-9 : Rat) / 2) [(0, 2), (11, 2), (16, 1)],
  term (9 : Rat) [(1, 1), (11, 2), (15, 1), (16, 1)],
  term ((-9 : Rat) / 2) [(1, 2), (11, 2), (16, 1)],
  term (-9 : Rat) [(2, 1), (11, 2), (14, 1), (16, 1)],
  term ((9 : Rat) / 2) [(2, 2), (11, 2), (16, 1)],
  term (-9 : Rat) [(3, 1), (11, 2), (15, 1), (16, 1)],
  term ((9 : Rat) / 2) [(3, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 29. -/
theorem rs_R009_ueqv_R009NNNNY_partial_29_0025_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_29_0025
        rs_R009_ueqv_R009NNNNY_generator_29_0000_0033 =
      rs_R009_ueqv_R009NNNNY_partial_29_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNNY_coefficient_29_0026 : Poly :=
[
  term ((-4 : Rat) / 93) [(12, 1), (14, 1), (16, 1)]
]

/-- Partial product 26 for generator 29. -/
def rs_R009_ueqv_R009NNNNY_partial_29_0026 : Poly :=
[
  term ((8 : Rat) / 93) [(0, 1), (12, 1), (14, 2), (16, 1)],
  term ((-4 : Rat) / 93) [(0, 2), (12, 1), (14, 1), (16, 1)],
  term ((8 : Rat) / 93) [(1, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4 : Rat) / 93) [(1, 2), (12, 1), (14, 1), (16, 1)],
  term ((-8 : Rat) / 93) [(2, 1), (12, 1), (14, 2), (16, 1)],
  term ((4 : Rat) / 93) [(2, 2), (12, 1), (14, 1), (16, 1)],
  term ((-8 : Rat) / 93) [(3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((4 : Rat) / 93) [(3, 2), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 29. -/
theorem rs_R009_ueqv_R009NNNNY_partial_29_0026_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_29_0026
        rs_R009_ueqv_R009NNNNY_generator_29_0000_0033 =
      rs_R009_ueqv_R009NNNNY_partial_29_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNNY_coefficient_29_0027 : Poly :=
[
  term ((125 : Rat) / 93) [(12, 1), (16, 1)]
]

/-- Partial product 27 for generator 29. -/
def rs_R009_ueqv_R009NNNNY_partial_29_0027 : Poly :=
[
  term ((-250 : Rat) / 93) [(0, 1), (12, 1), (14, 1), (16, 1)],
  term ((125 : Rat) / 93) [(0, 2), (12, 1), (16, 1)],
  term ((-250 : Rat) / 93) [(1, 1), (12, 1), (15, 1), (16, 1)],
  term ((125 : Rat) / 93) [(1, 2), (12, 1), (16, 1)],
  term ((250 : Rat) / 93) [(2, 1), (12, 1), (14, 1), (16, 1)],
  term ((-125 : Rat) / 93) [(2, 2), (12, 1), (16, 1)],
  term ((250 : Rat) / 93) [(3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-125 : Rat) / 93) [(3, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 29. -/
theorem rs_R009_ueqv_R009NNNNY_partial_29_0027_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_29_0027
        rs_R009_ueqv_R009NNNNY_generator_29_0000_0033 =
      rs_R009_ueqv_R009NNNNY_partial_29_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNNY_coefficient_29_0028 : Poly :=
[
  term ((-8 : Rat) / 93) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 28 for generator 29. -/
def rs_R009_ueqv_R009NNNNY_partial_29_0028 : Poly :=
[
  term ((16 : Rat) / 93) [(0, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-8 : Rat) / 93) [(0, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 93) [(1, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-8 : Rat) / 93) [(1, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 93) [(2, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((8 : Rat) / 93) [(2, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 93) [(3, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((8 : Rat) / 93) [(3, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 29. -/
theorem rs_R009_ueqv_R009NNNNY_partial_29_0028_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_29_0028
        rs_R009_ueqv_R009NNNNY_generator_29_0000_0033 =
      rs_R009_ueqv_R009NNNNY_partial_29_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNNY_coefficient_29_0029 : Poly :=
[
  term ((90 : Rat) / 31) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 29 for generator 29. -/
def rs_R009_ueqv_R009NNNNY_partial_29_0029 : Poly :=
[
  term ((-180 : Rat) / 31) [(0, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((90 : Rat) / 31) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-180 : Rat) / 31) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((90 : Rat) / 31) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((180 : Rat) / 31) [(2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-90 : Rat) / 31) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((180 : Rat) / 31) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-90 : Rat) / 31) [(3, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 29. -/
theorem rs_R009_ueqv_R009NNNNY_partial_29_0029_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_29_0029
        rs_R009_ueqv_R009NNNNY_generator_29_0000_0033 =
      rs_R009_ueqv_R009NNNNY_partial_29_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNNY_coefficient_29_0030 : Poly :=
[
  term ((4 : Rat) / 93) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 30 for generator 29. -/
def rs_R009_ueqv_R009NNNNY_partial_29_0030 : Poly :=
[
  term ((-8 : Rat) / 93) [(0, 1), (14, 2), (15, 2), (16, 1)],
  term ((4 : Rat) / 93) [(0, 2), (14, 1), (15, 2), (16, 1)],
  term ((-8 : Rat) / 93) [(1, 1), (14, 1), (15, 3), (16, 1)],
  term ((4 : Rat) / 93) [(1, 2), (14, 1), (15, 2), (16, 1)],
  term ((8 : Rat) / 93) [(2, 1), (14, 2), (15, 2), (16, 1)],
  term ((-4 : Rat) / 93) [(2, 2), (14, 1), (15, 2), (16, 1)],
  term ((8 : Rat) / 93) [(3, 1), (14, 1), (15, 3), (16, 1)],
  term ((-4 : Rat) / 93) [(3, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 29. -/
theorem rs_R009_ueqv_R009NNNNY_partial_29_0030_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_29_0030
        rs_R009_ueqv_R009NNNNY_generator_29_0000_0033 =
      rs_R009_ueqv_R009NNNNY_partial_29_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNNY_coefficient_29_0031 : Poly :=
[
  term ((5 : Rat) / 4) [(14, 1), (16, 1)]
]

/-- Partial product 31 for generator 29. -/
def rs_R009_ueqv_R009NNNNY_partial_29_0031 : Poly :=
[
  term ((-5 : Rat) / 2) [(0, 1), (14, 2), (16, 1)],
  term ((5 : Rat) / 4) [(0, 2), (14, 1), (16, 1)],
  term ((-5 : Rat) / 2) [(1, 1), (14, 1), (15, 1), (16, 1)],
  term ((5 : Rat) / 4) [(1, 2), (14, 1), (16, 1)],
  term ((5 : Rat) / 2) [(2, 1), (14, 2), (16, 1)],
  term ((-5 : Rat) / 4) [(2, 2), (14, 1), (16, 1)],
  term ((5 : Rat) / 2) [(3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5 : Rat) / 4) [(3, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 29. -/
theorem rs_R009_ueqv_R009NNNNY_partial_29_0031_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_29_0031
        rs_R009_ueqv_R009NNNNY_generator_29_0000_0033 =
      rs_R009_ueqv_R009NNNNY_partial_29_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNNY_coefficient_29_0032 : Poly :=
[
  term ((1357 : Rat) / 186) [(15, 2), (16, 1)]
]

/-- Partial product 32 for generator 29. -/
def rs_R009_ueqv_R009NNNNY_partial_29_0032 : Poly :=
[
  term ((-1357 : Rat) / 93) [(0, 1), (14, 1), (15, 2), (16, 1)],
  term ((1357 : Rat) / 186) [(0, 2), (15, 2), (16, 1)],
  term ((-1357 : Rat) / 93) [(1, 1), (15, 3), (16, 1)],
  term ((1357 : Rat) / 186) [(1, 2), (15, 2), (16, 1)],
  term ((1357 : Rat) / 93) [(2, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1357 : Rat) / 186) [(2, 2), (15, 2), (16, 1)],
  term ((1357 : Rat) / 93) [(3, 1), (15, 3), (16, 1)],
  term ((-1357 : Rat) / 186) [(3, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 29. -/
theorem rs_R009_ueqv_R009NNNNY_partial_29_0032_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_29_0032
        rs_R009_ueqv_R009NNNNY_generator_29_0000_0033 =
      rs_R009_ueqv_R009NNNNY_partial_29_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNNY_coefficient_29_0033 : Poly :=
[
  term ((-995 : Rat) / 372) [(16, 1)]
]

/-- Partial product 33 for generator 29. -/
def rs_R009_ueqv_R009NNNNY_partial_29_0033 : Poly :=
[
  term ((995 : Rat) / 186) [(0, 1), (14, 1), (16, 1)],
  term ((-995 : Rat) / 372) [(0, 2), (16, 1)],
  term ((995 : Rat) / 186) [(1, 1), (15, 1), (16, 1)],
  term ((-995 : Rat) / 372) [(1, 2), (16, 1)],
  term ((-995 : Rat) / 186) [(2, 1), (14, 1), (16, 1)],
  term ((995 : Rat) / 372) [(2, 2), (16, 1)],
  term ((-995 : Rat) / 186) [(3, 1), (15, 1), (16, 1)],
  term ((995 : Rat) / 372) [(3, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 29. -/
theorem rs_R009_ueqv_R009NNNNY_partial_29_0033_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_29_0033
        rs_R009_ueqv_R009NNNNY_generator_29_0000_0033 =
      rs_R009_ueqv_R009NNNNY_partial_29_0033 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NNNNY_partials_29_0000_0033 : List Poly :=
[
  rs_R009_ueqv_R009NNNNY_partial_29_0000,
  rs_R009_ueqv_R009NNNNY_partial_29_0001,
  rs_R009_ueqv_R009NNNNY_partial_29_0002,
  rs_R009_ueqv_R009NNNNY_partial_29_0003,
  rs_R009_ueqv_R009NNNNY_partial_29_0004,
  rs_R009_ueqv_R009NNNNY_partial_29_0005,
  rs_R009_ueqv_R009NNNNY_partial_29_0006,
  rs_R009_ueqv_R009NNNNY_partial_29_0007,
  rs_R009_ueqv_R009NNNNY_partial_29_0008,
  rs_R009_ueqv_R009NNNNY_partial_29_0009,
  rs_R009_ueqv_R009NNNNY_partial_29_0010,
  rs_R009_ueqv_R009NNNNY_partial_29_0011,
  rs_R009_ueqv_R009NNNNY_partial_29_0012,
  rs_R009_ueqv_R009NNNNY_partial_29_0013,
  rs_R009_ueqv_R009NNNNY_partial_29_0014,
  rs_R009_ueqv_R009NNNNY_partial_29_0015,
  rs_R009_ueqv_R009NNNNY_partial_29_0016,
  rs_R009_ueqv_R009NNNNY_partial_29_0017,
  rs_R009_ueqv_R009NNNNY_partial_29_0018,
  rs_R009_ueqv_R009NNNNY_partial_29_0019,
  rs_R009_ueqv_R009NNNNY_partial_29_0020,
  rs_R009_ueqv_R009NNNNY_partial_29_0021,
  rs_R009_ueqv_R009NNNNY_partial_29_0022,
  rs_R009_ueqv_R009NNNNY_partial_29_0023,
  rs_R009_ueqv_R009NNNNY_partial_29_0024,
  rs_R009_ueqv_R009NNNNY_partial_29_0025,
  rs_R009_ueqv_R009NNNNY_partial_29_0026,
  rs_R009_ueqv_R009NNNNY_partial_29_0027,
  rs_R009_ueqv_R009NNNNY_partial_29_0028,
  rs_R009_ueqv_R009NNNNY_partial_29_0029,
  rs_R009_ueqv_R009NNNNY_partial_29_0030,
  rs_R009_ueqv_R009NNNNY_partial_29_0031,
  rs_R009_ueqv_R009NNNNY_partial_29_0032,
  rs_R009_ueqv_R009NNNNY_partial_29_0033
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NNNNY_block_29_0000_0033 : Poly :=
[
  term ((84 : Rat) / 31) [(0, 1), (1, 1), (5, 1), (14, 1), (16, 1)],
  term ((-490 : Rat) / 93) [(0, 1), (1, 1), (14, 1), (15, 1), (16, 1)],
  term ((103 : Rat) / 93) [(0, 1), (1, 1), (15, 1), (16, 1)],
  term ((245 : Rat) / 93) [(0, 1), (1, 2), (14, 1), (16, 1)],
  term ((-103 : Rat) / 186) [(0, 1), (1, 2), (16, 1)],
  term ((118 : Rat) / 93) [(0, 1), (2, 1), (14, 1), (16, 1)],
  term ((490 : Rat) / 93) [(0, 1), (2, 1), (14, 2), (16, 1)],
  term ((-245 : Rat) / 93) [(0, 1), (2, 2), (14, 1), (16, 1)],
  term ((103 : Rat) / 186) [(0, 1), (2, 2), (16, 1)],
  term ((884 : Rat) / 93) [(0, 1), (3, 1), (5, 1), (14, 1), (16, 1)],
  term ((884 : Rat) / 93) [(0, 1), (3, 1), (11, 1), (14, 1), (16, 1)],
  term ((16 : Rat) / 31) [(0, 1), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-103 : Rat) / 93) [(0, 1), (3, 1), (15, 1), (16, 1)],
  term ((-245 : Rat) / 93) [(0, 1), (3, 2), (14, 1), (16, 1)],
  term ((103 : Rat) / 186) [(0, 1), (3, 2), (16, 1)],
  term ((-380 : Rat) / 93) [(0, 1), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((-670 : Rat) / 31) [(0, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((826 : Rat) / 31) [(0, 1), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((32 : Rat) / 93) [(0, 1), (5, 1), (13, 1), (14, 2), (16, 1)],
  term ((379 : Rat) / 31) [(0, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((394 : Rat) / 93) [(0, 1), (5, 1), (14, 2), (15, 1), (16, 1)],
  term ((-16 : Rat) / 93) [(0, 1), (5, 2), (14, 1), (16, 1)],
  term ((-296 : Rat) / 93) [(0, 1), (8, 1), (14, 1), (16, 1)],
  term ((22 : Rat) / 31) [(0, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((364 : Rat) / 93) [(0, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((16 : Rat) / 93) [(0, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((135 : Rat) / 31) [(0, 1), (10, 1), (14, 1), (16, 1)],
  term ((-442 : Rat) / 93) [(0, 1), (10, 1), (14, 2), (16, 1)],
  term ((-1697 : Rat) / 93) [(0, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2278 : Rat) / 93) [(0, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((722 : Rat) / 93) [(0, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-116 : Rat) / 93) [(0, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term (9 : Rat) [(0, 1), (11, 2), (14, 1), (16, 1)],
  term (18 : Rat) [(0, 1), (11, 2), (14, 2), (16, 1)],
  term ((-250 : Rat) / 93) [(0, 1), (12, 1), (14, 1), (16, 1)],
  term ((8 : Rat) / 93) [(0, 1), (12, 1), (14, 2), (16, 1)],
  term ((-180 : Rat) / 31) [(0, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 93) [(0, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1357 : Rat) / 93) [(0, 1), (14, 1), (15, 2), (16, 1)],
  term ((995 : Rat) / 186) [(0, 1), (14, 1), (16, 1)],
  term ((-8 : Rat) / 93) [(0, 1), (14, 2), (15, 2), (16, 1)],
  term ((-5 : Rat) / 2) [(0, 1), (14, 2), (16, 1)],
  term ((-42 : Rat) / 31) [(0, 2), (1, 1), (5, 1), (16, 1)],
  term ((-221 : Rat) / 186) [(0, 2), (2, 1), (16, 1)],
  term ((-442 : Rat) / 93) [(0, 2), (3, 1), (5, 1), (16, 1)],
  term ((-442 : Rat) / 93) [(0, 2), (3, 1), (11, 1), (16, 1)],
  term ((221 : Rat) / 93) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((190 : Rat) / 93) [(0, 2), (5, 1), (9, 1), (16, 1)],
  term ((335 : Rat) / 31) [(0, 2), (5, 1), (11, 1), (16, 1)],
  term ((-16 : Rat) / 93) [(0, 2), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((-413 : Rat) / 31) [(0, 2), (5, 1), (13, 1), (16, 1)],
  term ((-197 : Rat) / 93) [(0, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-379 : Rat) / 62) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 93) [(0, 2), (5, 2), (16, 1)],
  term ((148 : Rat) / 93) [(0, 2), (8, 1), (16, 1)],
  term ((-182 : Rat) / 93) [(0, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-11 : Rat) / 31) [(0, 2), (9, 1), (11, 1), (16, 1)],
  term ((-8 : Rat) / 93) [(0, 2), (9, 1), (13, 1), (16, 1)],
  term ((221 : Rat) / 93) [(0, 2), (10, 1), (14, 1), (16, 1)],
  term ((-135 : Rat) / 62) [(0, 2), (10, 1), (16, 1)],
  term ((1139 : Rat) / 93) [(0, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((1697 : Rat) / 186) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term ((58 : Rat) / 93) [(0, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-361 : Rat) / 93) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term (-9 : Rat) [(0, 2), (11, 2), (14, 1), (16, 1)],
  term ((-9 : Rat) / 2) [(0, 2), (11, 2), (16, 1)],
  term ((-4 : Rat) / 93) [(0, 2), (12, 1), (14, 1), (16, 1)],
  term ((125 : Rat) / 93) [(0, 2), (12, 1), (16, 1)],
  term ((-8 : Rat) / 93) [(0, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((90 : Rat) / 31) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((4 : Rat) / 93) [(0, 2), (14, 1), (15, 2), (16, 1)],
  term ((877 : Rat) / 372) [(0, 2), (14, 1), (16, 1)],
  term ((-490 : Rat) / 93) [(0, 2), (14, 2), (16, 1)],
  term ((1357 : Rat) / 186) [(0, 2), (15, 2), (16, 1)],
  term ((-995 : Rat) / 372) [(0, 2), (16, 1)],
  term ((245 : Rat) / 93) [(0, 3), (14, 1), (16, 1)],
  term ((-103 : Rat) / 186) [(0, 3), (16, 1)],
  term ((-84 : Rat) / 31) [(1, 1), (2, 1), (5, 1), (14, 1), (16, 1)],
  term ((221 : Rat) / 93) [(1, 1), (2, 1), (15, 1), (16, 1)],
  term ((42 : Rat) / 31) [(1, 1), (2, 2), (5, 1), (16, 1)],
  term ((632 : Rat) / 93) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((884 : Rat) / 93) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((-442 : Rat) / 93) [(1, 1), (3, 1), (15, 2), (16, 1)],
  term ((42 : Rat) / 31) [(1, 1), (3, 2), (5, 1), (16, 1)],
  term ((-380 : Rat) / 93) [(1, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-670 : Rat) / 31) [(1, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 93) [(1, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((826 : Rat) / 31) [(1, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((394 : Rat) / 93) [(1, 1), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((379 : Rat) / 31) [(1, 1), (5, 1), (15, 2), (16, 1)],
  term ((-16 : Rat) / 93) [(1, 1), (5, 2), (15, 1), (16, 1)],
  term ((-296 : Rat) / 93) [(1, 1), (8, 1), (15, 1), (16, 1)],
  term ((364 : Rat) / 93) [(1, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((22 : Rat) / 31) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 93) [(1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-442 : Rat) / 93) [(1, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((135 : Rat) / 31) [(1, 1), (10, 1), (15, 1), (16, 1)],
  term ((-2278 : Rat) / 93) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1697 : Rat) / 93) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-116 : Rat) / 93) [(1, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((722 : Rat) / 93) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term (18 : Rat) [(1, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term (9 : Rat) [(1, 1), (11, 2), (15, 1), (16, 1)],
  term ((8 : Rat) / 93) [(1, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-250 : Rat) / 93) [(1, 1), (12, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 93) [(1, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-180 : Rat) / 31) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((-5 : Rat) / 2) [(1, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8 : Rat) / 93) [(1, 1), (14, 1), (15, 3), (16, 1)],
  term ((995 : Rat) / 186) [(1, 1), (15, 1), (16, 1)],
  term ((-1357 : Rat) / 93) [(1, 1), (15, 3), (16, 1)],
  term ((-221 : Rat) / 186) [(1, 2), (2, 1), (16, 1)],
  term ((-442 : Rat) / 93) [(1, 2), (3, 1), (5, 1), (16, 1)],
  term ((-442 : Rat) / 93) [(1, 2), (3, 1), (11, 1), (16, 1)],
  term ((221 : Rat) / 93) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((190 : Rat) / 93) [(1, 2), (5, 1), (9, 1), (16, 1)],
  term ((335 : Rat) / 31) [(1, 2), (5, 1), (11, 1), (16, 1)],
  term ((-16 : Rat) / 93) [(1, 2), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((-413 : Rat) / 31) [(1, 2), (5, 1), (13, 1), (16, 1)],
  term ((-197 : Rat) / 93) [(1, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-211 : Rat) / 62) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 93) [(1, 2), (5, 2), (16, 1)],
  term ((148 : Rat) / 93) [(1, 2), (8, 1), (16, 1)],
  term ((-182 : Rat) / 93) [(1, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-11 : Rat) / 31) [(1, 2), (9, 1), (11, 1), (16, 1)],
  term ((-8 : Rat) / 93) [(1, 2), (9, 1), (13, 1), (16, 1)],
  term ((221 : Rat) / 93) [(1, 2), (10, 1), (14, 1), (16, 1)],
  term ((-135 : Rat) / 62) [(1, 2), (10, 1), (16, 1)],
  term ((1139 : Rat) / 93) [(1, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((1697 : Rat) / 186) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term ((58 : Rat) / 93) [(1, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-361 : Rat) / 93) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term (-9 : Rat) [(1, 2), (11, 2), (14, 1), (16, 1)],
  term ((-9 : Rat) / 2) [(1, 2), (11, 2), (16, 1)],
  term ((-4 : Rat) / 93) [(1, 2), (12, 1), (14, 1), (16, 1)],
  term ((125 : Rat) / 93) [(1, 2), (12, 1), (16, 1)],
  term ((-8 : Rat) / 93) [(1, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((90 : Rat) / 31) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((4 : Rat) / 93) [(1, 2), (14, 1), (15, 2), (16, 1)],
  term ((5 : Rat) / 4) [(1, 2), (14, 1), (16, 1)],
  term ((1357 : Rat) / 186) [(1, 2), (15, 2), (16, 1)],
  term ((-995 : Rat) / 372) [(1, 2), (16, 1)],
  term ((-42 : Rat) / 31) [(1, 3), (5, 1), (16, 1)],
  term ((-884 : Rat) / 93) [(2, 1), (3, 1), (5, 1), (14, 1), (16, 1)],
  term ((-884 : Rat) / 93) [(2, 1), (3, 1), (11, 1), (14, 1), (16, 1)],
  term ((442 : Rat) / 93) [(2, 1), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-221 : Rat) / 93) [(2, 1), (3, 1), (15, 1), (16, 1)],
  term ((221 : Rat) / 186) [(2, 1), (3, 2), (16, 1)],
  term ((380 : Rat) / 93) [(2, 1), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((670 : Rat) / 31) [(2, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-826 : Rat) / 31) [(2, 1), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((-32 : Rat) / 93) [(2, 1), (5, 1), (13, 1), (14, 2), (16, 1)],
  term ((-379 : Rat) / 31) [(2, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-394 : Rat) / 93) [(2, 1), (5, 1), (14, 2), (15, 1), (16, 1)],
  term ((16 : Rat) / 93) [(2, 1), (5, 2), (14, 1), (16, 1)],
  term ((296 : Rat) / 93) [(2, 1), (8, 1), (14, 1), (16, 1)],
  term ((-22 : Rat) / 31) [(2, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-364 : Rat) / 93) [(2, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-16 : Rat) / 93) [(2, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-135 : Rat) / 31) [(2, 1), (10, 1), (14, 1), (16, 1)],
  term ((442 : Rat) / 93) [(2, 1), (10, 1), (14, 2), (16, 1)],
  term ((1697 : Rat) / 93) [(2, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((2278 : Rat) / 93) [(2, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-722 : Rat) / 93) [(2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((116 : Rat) / 93) [(2, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term (-9 : Rat) [(2, 1), (11, 2), (14, 1), (16, 1)],
  term (-18 : Rat) [(2, 1), (11, 2), (14, 2), (16, 1)],
  term ((250 : Rat) / 93) [(2, 1), (12, 1), (14, 1), (16, 1)],
  term ((-8 : Rat) / 93) [(2, 1), (12, 1), (14, 2), (16, 1)],
  term ((180 : Rat) / 31) [(2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 93) [(2, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((1357 : Rat) / 93) [(2, 1), (14, 1), (15, 2), (16, 1)],
  term ((-995 : Rat) / 186) [(2, 1), (14, 1), (16, 1)],
  term ((8 : Rat) / 93) [(2, 1), (14, 2), (15, 2), (16, 1)],
  term ((5 : Rat) / 2) [(2, 1), (14, 2), (16, 1)],
  term ((442 : Rat) / 93) [(2, 2), (3, 1), (5, 1), (16, 1)],
  term ((442 : Rat) / 93) [(2, 2), (3, 1), (11, 1), (16, 1)],
  term ((-221 : Rat) / 93) [(2, 2), (3, 1), (15, 1), (16, 1)],
  term ((-190 : Rat) / 93) [(2, 2), (5, 1), (9, 1), (16, 1)],
  term ((-335 : Rat) / 31) [(2, 2), (5, 1), (11, 1), (16, 1)],
  term ((16 : Rat) / 93) [(2, 2), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((413 : Rat) / 31) [(2, 2), (5, 1), (13, 1), (16, 1)],
  term ((197 : Rat) / 93) [(2, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((379 : Rat) / 62) [(2, 2), (5, 1), (15, 1), (16, 1)],
  term ((-8 : Rat) / 93) [(2, 2), (5, 2), (16, 1)],
  term ((-148 : Rat) / 93) [(2, 2), (8, 1), (16, 1)],
  term ((182 : Rat) / 93) [(2, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((11 : Rat) / 31) [(2, 2), (9, 1), (11, 1), (16, 1)],
  term ((8 : Rat) / 93) [(2, 2), (9, 1), (13, 1), (16, 1)],
  term ((-221 : Rat) / 93) [(2, 2), (10, 1), (14, 1), (16, 1)],
  term ((135 : Rat) / 62) [(2, 2), (10, 1), (16, 1)],
  term ((-1139 : Rat) / 93) [(2, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1697 : Rat) / 186) [(2, 2), (11, 1), (13, 1), (16, 1)],
  term ((-58 : Rat) / 93) [(2, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((361 : Rat) / 93) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term (9 : Rat) [(2, 2), (11, 2), (14, 1), (16, 1)],
  term ((9 : Rat) / 2) [(2, 2), (11, 2), (16, 1)],
  term ((4 : Rat) / 93) [(2, 2), (12, 1), (14, 1), (16, 1)],
  term ((-125 : Rat) / 93) [(2, 2), (12, 1), (16, 1)],
  term ((8 : Rat) / 93) [(2, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-90 : Rat) / 31) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((-4 : Rat) / 93) [(2, 2), (14, 1), (15, 2), (16, 1)],
  term ((-1349 : Rat) / 372) [(2, 2), (14, 1), (16, 1)],
  term ((-1357 : Rat) / 186) [(2, 2), (15, 2), (16, 1)],
  term ((995 : Rat) / 372) [(2, 2), (16, 1)],
  term ((221 : Rat) / 186) [(2, 3), (16, 1)],
  term ((380 : Rat) / 93) [(3, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((670 : Rat) / 31) [(3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 93) [(3, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-826 : Rat) / 31) [(3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-394 : Rat) / 93) [(3, 1), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((-379 : Rat) / 31) [(3, 1), (5, 1), (15, 2), (16, 1)],
  term ((16 : Rat) / 93) [(3, 1), (5, 2), (15, 1), (16, 1)],
  term ((296 : Rat) / 93) [(3, 1), (8, 1), (15, 1), (16, 1)],
  term ((-364 : Rat) / 93) [(3, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-22 : Rat) / 31) [(3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 93) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((442 : Rat) / 93) [(3, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-135 : Rat) / 31) [(3, 1), (10, 1), (15, 1), (16, 1)],
  term ((2278 : Rat) / 93) [(3, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1697 : Rat) / 93) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((116 : Rat) / 93) [(3, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-722 : Rat) / 93) [(3, 1), (11, 1), (15, 2), (16, 1)],
  term (-18 : Rat) [(3, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term (-9 : Rat) [(3, 1), (11, 2), (15, 1), (16, 1)],
  term ((-8 : Rat) / 93) [(3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((250 : Rat) / 93) [(3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 93) [(3, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((180 : Rat) / 31) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((5 : Rat) / 2) [(3, 1), (14, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 93) [(3, 1), (14, 1), (15, 3), (16, 1)],
  term ((-995 : Rat) / 186) [(3, 1), (15, 1), (16, 1)],
  term ((1357 : Rat) / 93) [(3, 1), (15, 3), (16, 1)],
  term ((-190 : Rat) / 93) [(3, 2), (5, 1), (9, 1), (16, 1)],
  term ((-335 : Rat) / 31) [(3, 2), (5, 1), (11, 1), (16, 1)],
  term ((16 : Rat) / 93) [(3, 2), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((413 : Rat) / 31) [(3, 2), (5, 1), (13, 1), (16, 1)],
  term ((197 : Rat) / 93) [(3, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-631 : Rat) / 186) [(3, 2), (5, 1), (15, 1), (16, 1)],
  term ((-8 : Rat) / 93) [(3, 2), (5, 2), (16, 1)],
  term ((-148 : Rat) / 93) [(3, 2), (8, 1), (16, 1)],
  term ((182 : Rat) / 93) [(3, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((11 : Rat) / 31) [(3, 2), (9, 1), (11, 1), (16, 1)],
  term ((8 : Rat) / 93) [(3, 2), (9, 1), (13, 1), (16, 1)],
  term ((-221 : Rat) / 93) [(3, 2), (10, 1), (14, 1), (16, 1)],
  term ((135 : Rat) / 62) [(3, 2), (10, 1), (16, 1)],
  term ((-1139 : Rat) / 93) [(3, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1697 : Rat) / 186) [(3, 2), (11, 1), (13, 1), (16, 1)],
  term ((-58 : Rat) / 93) [(3, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-523 : Rat) / 93) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term (9 : Rat) [(3, 2), (11, 2), (14, 1), (16, 1)],
  term ((9 : Rat) / 2) [(3, 2), (11, 2), (16, 1)],
  term ((4 : Rat) / 93) [(3, 2), (12, 1), (14, 1), (16, 1)],
  term ((-125 : Rat) / 93) [(3, 2), (12, 1), (16, 1)],
  term ((8 : Rat) / 93) [(3, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-90 : Rat) / 31) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-4 : Rat) / 93) [(3, 2), (14, 1), (15, 2), (16, 1)],
  term ((-5 : Rat) / 4) [(3, 2), (14, 1), (16, 1)],
  term ((-473 : Rat) / 186) [(3, 2), (15, 2), (16, 1)],
  term ((995 : Rat) / 372) [(3, 2), (16, 1)],
  term ((442 : Rat) / 93) [(3, 3), (5, 1), (16, 1)],
  term ((442 : Rat) / 93) [(3, 3), (11, 1), (16, 1)],
  term ((-221 : Rat) / 93) [(3, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 29, terms 0 through 33. -/
theorem rs_R009_ueqv_R009NNNNY_block_29_0000_0033_valid :
    checkProductSumEq rs_R009_ueqv_R009NNNNY_partials_29_0000_0033
      rs_R009_ueqv_R009NNNNY_block_29_0000_0033 = true := by
  native_decide

end R009UeqvR009NNNNYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
