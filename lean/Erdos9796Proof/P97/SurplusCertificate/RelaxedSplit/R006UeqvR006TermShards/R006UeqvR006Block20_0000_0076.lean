/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R006:u=v:R006, term block 20:0-76

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R006UeqvR006TermShards

/-- Generator polynomial 20 for relaxed split surplus certificate `R006:u=v:R006`. -/
def rs_R006_ueqv_R006_generator_20_0000_0076 : Poly :=
[
  term (-2 : Rat) [(0, 1), (8, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (9, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(6, 1), (8, 1)],
  term (-1 : Rat) [(6, 2)],
  term (2 : Rat) [(7, 1), (9, 1)],
  term (-1 : Rat) [(7, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 20. -/
def rs_R006_ueqv_R006_coefficient_20_0000 : Poly :=
[
  term ((69 : Rat) / 5) []
]

/-- Partial product 0 for generator 20. -/
def rs_R006_ueqv_R006_partial_20_0000 : Poly :=
[
  term ((-138 : Rat) / 5) [(0, 1), (8, 1)],
  term ((69 : Rat) / 5) [(0, 2)],
  term ((-138 : Rat) / 5) [(1, 1), (9, 1)],
  term ((69 : Rat) / 5) [(1, 2)],
  term ((138 : Rat) / 5) [(6, 1), (8, 1)],
  term ((-69 : Rat) / 5) [(6, 2)],
  term ((138 : Rat) / 5) [(7, 1), (9, 1)],
  term ((-69 : Rat) / 5) [(7, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 20. -/
theorem rs_R006_ueqv_R006_partial_20_0000_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_20_0000
        rs_R006_ueqv_R006_generator_20_0000_0076 =
      rs_R006_ueqv_R006_partial_20_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 20. -/
def rs_R006_ueqv_R006_coefficient_20_0001 : Poly :=
[
  term ((-138 : Rat) / 5) [(0, 1)]
]

/-- Partial product 1 for generator 20. -/
def rs_R006_ueqv_R006_partial_20_0001 : Poly :=
[
  term ((276 : Rat) / 5) [(0, 1), (1, 1), (9, 1)],
  term ((-138 : Rat) / 5) [(0, 1), (1, 2)],
  term ((-276 : Rat) / 5) [(0, 1), (6, 1), (8, 1)],
  term ((138 : Rat) / 5) [(0, 1), (6, 2)],
  term ((-276 : Rat) / 5) [(0, 1), (7, 1), (9, 1)],
  term ((138 : Rat) / 5) [(0, 1), (7, 2)],
  term ((276 : Rat) / 5) [(0, 2), (8, 1)],
  term ((-138 : Rat) / 5) [(0, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 20. -/
theorem rs_R006_ueqv_R006_partial_20_0001_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_20_0001
        rs_R006_ueqv_R006_generator_20_0000_0076 =
      rs_R006_ueqv_R006_partial_20_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 20. -/
def rs_R006_ueqv_R006_coefficient_20_0002 : Poly :=
[
  term (192 : Rat) [(0, 1), (1, 1), (15, 1)]
]

/-- Partial product 2 for generator 20. -/
def rs_R006_ueqv_R006_partial_20_0002 : Poly :=
[
  term (384 : Rat) [(0, 1), (1, 1), (6, 1), (8, 1), (15, 1)],
  term (-192 : Rat) [(0, 1), (1, 1), (6, 2), (15, 1)],
  term (384 : Rat) [(0, 1), (1, 1), (7, 1), (9, 1), (15, 1)],
  term (-192 : Rat) [(0, 1), (1, 1), (7, 2), (15, 1)],
  term (-384 : Rat) [(0, 1), (1, 2), (9, 1), (15, 1)],
  term (192 : Rat) [(0, 1), (1, 3), (15, 1)],
  term (-384 : Rat) [(0, 2), (1, 1), (8, 1), (15, 1)],
  term (192 : Rat) [(0, 3), (1, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 20. -/
theorem rs_R006_ueqv_R006_partial_20_0002_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_20_0002
        rs_R006_ueqv_R006_generator_20_0000_0076 =
      rs_R006_ueqv_R006_partial_20_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 20. -/
def rs_R006_ueqv_R006_coefficient_20_0003 : Poly :=
[
  term (-48 : Rat) [(0, 1), (1, 1), (15, 1), (16, 1)]
]

/-- Partial product 3 for generator 20. -/
def rs_R006_ueqv_R006_partial_20_0003 : Poly :=
[
  term (-96 : Rat) [(0, 1), (1, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term (48 : Rat) [(0, 1), (1, 1), (6, 2), (15, 1), (16, 1)],
  term (-96 : Rat) [(0, 1), (1, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term (48 : Rat) [(0, 1), (1, 1), (7, 2), (15, 1), (16, 1)],
  term (96 : Rat) [(0, 1), (1, 2), (9, 1), (15, 1), (16, 1)],
  term (-48 : Rat) [(0, 1), (1, 3), (15, 1), (16, 1)],
  term (96 : Rat) [(0, 2), (1, 1), (8, 1), (15, 1), (16, 1)],
  term (-48 : Rat) [(0, 3), (1, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 20. -/
theorem rs_R006_ueqv_R006_partial_20_0003_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_20_0003
        rs_R006_ueqv_R006_generator_20_0000_0076 =
      rs_R006_ueqv_R006_partial_20_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 20. -/
def rs_R006_ueqv_R006_coefficient_20_0004 : Poly :=
[
  term ((-3456 : Rat) / 5) [(0, 1), (2, 1), (9, 1), (15, 1)]
]

/-- Partial product 4 for generator 20. -/
def rs_R006_ueqv_R006_partial_20_0004 : Poly :=
[
  term ((6912 : Rat) / 5) [(0, 1), (1, 1), (2, 1), (9, 2), (15, 1)],
  term ((-3456 : Rat) / 5) [(0, 1), (1, 2), (2, 1), (9, 1), (15, 1)],
  term ((-6912 : Rat) / 5) [(0, 1), (2, 1), (6, 1), (8, 1), (9, 1), (15, 1)],
  term ((3456 : Rat) / 5) [(0, 1), (2, 1), (6, 2), (9, 1), (15, 1)],
  term ((-6912 : Rat) / 5) [(0, 1), (2, 1), (7, 1), (9, 2), (15, 1)],
  term ((3456 : Rat) / 5) [(0, 1), (2, 1), (7, 2), (9, 1), (15, 1)],
  term ((6912 : Rat) / 5) [(0, 2), (2, 1), (8, 1), (9, 1), (15, 1)],
  term ((-3456 : Rat) / 5) [(0, 3), (2, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 20. -/
theorem rs_R006_ueqv_R006_partial_20_0004_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_20_0004
        rs_R006_ueqv_R006_generator_20_0000_0076 =
      rs_R006_ueqv_R006_partial_20_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 20. -/
def rs_R006_ueqv_R006_coefficient_20_0005 : Poly :=
[
  term ((1152 : Rat) / 5) [(0, 1), (2, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 5 for generator 20. -/
def rs_R006_ueqv_R006_partial_20_0005 : Poly :=
[
  term ((-2304 : Rat) / 5) [(0, 1), (1, 1), (2, 1), (9, 2), (15, 1), (16, 1)],
  term ((1152 : Rat) / 5) [(0, 1), (1, 2), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((2304 : Rat) / 5) [(0, 1), (2, 1), (6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1152 : Rat) / 5) [(0, 1), (2, 1), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((2304 : Rat) / 5) [(0, 1), (2, 1), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((-1152 : Rat) / 5) [(0, 1), (2, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-2304 : Rat) / 5) [(0, 2), (2, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((1152 : Rat) / 5) [(0, 3), (2, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 20. -/
theorem rs_R006_ueqv_R006_partial_20_0005_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_20_0005
        rs_R006_ueqv_R006_generator_20_0000_0076 =
      rs_R006_ueqv_R006_partial_20_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 20. -/
def rs_R006_ueqv_R006_coefficient_20_0006 : Poly :=
[
  term ((1728 : Rat) / 5) [(0, 1), (3, 1), (9, 1)]
]

/-- Partial product 6 for generator 20. -/
def rs_R006_ueqv_R006_partial_20_0006 : Poly :=
[
  term ((-3456 : Rat) / 5) [(0, 1), (1, 1), (3, 1), (9, 2)],
  term ((1728 : Rat) / 5) [(0, 1), (1, 2), (3, 1), (9, 1)],
  term ((3456 : Rat) / 5) [(0, 1), (3, 1), (6, 1), (8, 1), (9, 1)],
  term ((-1728 : Rat) / 5) [(0, 1), (3, 1), (6, 2), (9, 1)],
  term ((3456 : Rat) / 5) [(0, 1), (3, 1), (7, 1), (9, 2)],
  term ((-1728 : Rat) / 5) [(0, 1), (3, 1), (7, 2), (9, 1)],
  term ((-3456 : Rat) / 5) [(0, 2), (3, 1), (8, 1), (9, 1)],
  term ((1728 : Rat) / 5) [(0, 3), (3, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 20. -/
theorem rs_R006_ueqv_R006_partial_20_0006_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_20_0006
        rs_R006_ueqv_R006_generator_20_0000_0076 =
      rs_R006_ueqv_R006_partial_20_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 20. -/
def rs_R006_ueqv_R006_coefficient_20_0007 : Poly :=
[
  term ((864 : Rat) / 5) [(0, 1), (3, 1), (9, 1), (14, 1)]
]

/-- Partial product 7 for generator 20. -/
def rs_R006_ueqv_R006_partial_20_0007 : Poly :=
[
  term ((-1728 : Rat) / 5) [(0, 1), (1, 1), (3, 1), (9, 2), (14, 1)],
  term ((864 : Rat) / 5) [(0, 1), (1, 2), (3, 1), (9, 1), (14, 1)],
  term ((1728 : Rat) / 5) [(0, 1), (3, 1), (6, 1), (8, 1), (9, 1), (14, 1)],
  term ((-864 : Rat) / 5) [(0, 1), (3, 1), (6, 2), (9, 1), (14, 1)],
  term ((1728 : Rat) / 5) [(0, 1), (3, 1), (7, 1), (9, 2), (14, 1)],
  term ((-864 : Rat) / 5) [(0, 1), (3, 1), (7, 2), (9, 1), (14, 1)],
  term ((-1728 : Rat) / 5) [(0, 2), (3, 1), (8, 1), (9, 1), (14, 1)],
  term ((864 : Rat) / 5) [(0, 3), (3, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 20. -/
theorem rs_R006_ueqv_R006_partial_20_0007_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_20_0007
        rs_R006_ueqv_R006_generator_20_0000_0076 =
      rs_R006_ueqv_R006_partial_20_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 20. -/
def rs_R006_ueqv_R006_coefficient_20_0008 : Poly :=
[
  term ((-288 : Rat) / 5) [(0, 1), (3, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 8 for generator 20. -/
def rs_R006_ueqv_R006_partial_20_0008 : Poly :=
[
  term ((576 : Rat) / 5) [(0, 1), (1, 1), (3, 1), (9, 2), (14, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(0, 1), (1, 2), (3, 1), (9, 1), (14, 1), (16, 1)],
  term ((-576 : Rat) / 5) [(0, 1), (3, 1), (6, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((288 : Rat) / 5) [(0, 1), (3, 1), (6, 2), (9, 1), (14, 1), (16, 1)],
  term ((-576 : Rat) / 5) [(0, 1), (3, 1), (7, 1), (9, 2), (14, 1), (16, 1)],
  term ((288 : Rat) / 5) [(0, 1), (3, 1), (7, 2), (9, 1), (14, 1), (16, 1)],
  term ((576 : Rat) / 5) [(0, 2), (3, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(0, 3), (3, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 20. -/
theorem rs_R006_ueqv_R006_partial_20_0008_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_20_0008
        rs_R006_ueqv_R006_generator_20_0000_0076 =
      rs_R006_ueqv_R006_partial_20_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 20. -/
def rs_R006_ueqv_R006_coefficient_20_0009 : Poly :=
[
  term ((-576 : Rat) / 5) [(0, 1), (3, 1), (9, 1), (16, 1)]
]

/-- Partial product 9 for generator 20. -/
def rs_R006_ueqv_R006_partial_20_0009 : Poly :=
[
  term ((1152 : Rat) / 5) [(0, 1), (1, 1), (3, 1), (9, 2), (16, 1)],
  term ((-576 : Rat) / 5) [(0, 1), (1, 2), (3, 1), (9, 1), (16, 1)],
  term ((-1152 : Rat) / 5) [(0, 1), (3, 1), (6, 1), (8, 1), (9, 1), (16, 1)],
  term ((576 : Rat) / 5) [(0, 1), (3, 1), (6, 2), (9, 1), (16, 1)],
  term ((-1152 : Rat) / 5) [(0, 1), (3, 1), (7, 1), (9, 2), (16, 1)],
  term ((576 : Rat) / 5) [(0, 1), (3, 1), (7, 2), (9, 1), (16, 1)],
  term ((1152 : Rat) / 5) [(0, 2), (3, 1), (8, 1), (9, 1), (16, 1)],
  term ((-576 : Rat) / 5) [(0, 3), (3, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 20. -/
theorem rs_R006_ueqv_R006_partial_20_0009_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_20_0009
        rs_R006_ueqv_R006_generator_20_0000_0076 =
      rs_R006_ueqv_R006_partial_20_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 20. -/
def rs_R006_ueqv_R006_coefficient_20_0010 : Poly :=
[
  term ((288 : Rat) / 35) [(0, 1), (5, 1), (13, 1)]
]

/-- Partial product 10 for generator 20. -/
def rs_R006_ueqv_R006_partial_20_0010 : Poly :=
[
  term ((-576 : Rat) / 35) [(0, 1), (1, 1), (5, 1), (9, 1), (13, 1)],
  term ((288 : Rat) / 35) [(0, 1), (1, 2), (5, 1), (13, 1)],
  term ((576 : Rat) / 35) [(0, 1), (5, 1), (6, 1), (8, 1), (13, 1)],
  term ((-288 : Rat) / 35) [(0, 1), (5, 1), (6, 2), (13, 1)],
  term ((576 : Rat) / 35) [(0, 1), (5, 1), (7, 1), (9, 1), (13, 1)],
  term ((-288 : Rat) / 35) [(0, 1), (5, 1), (7, 2), (13, 1)],
  term ((-576 : Rat) / 35) [(0, 2), (5, 1), (8, 1), (13, 1)],
  term ((288 : Rat) / 35) [(0, 3), (5, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 20. -/
theorem rs_R006_ueqv_R006_partial_20_0010_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_20_0010
        rs_R006_ueqv_R006_generator_20_0000_0076 =
      rs_R006_ueqv_R006_partial_20_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 20. -/
def rs_R006_ueqv_R006_coefficient_20_0011 : Poly :=
[
  term (-192 : Rat) [(0, 1), (7, 1), (15, 1)]
]

/-- Partial product 11 for generator 20. -/
def rs_R006_ueqv_R006_partial_20_0011 : Poly :=
[
  term (384 : Rat) [(0, 1), (1, 1), (7, 1), (9, 1), (15, 1)],
  term (-192 : Rat) [(0, 1), (1, 2), (7, 1), (15, 1)],
  term (-384 : Rat) [(0, 1), (6, 1), (7, 1), (8, 1), (15, 1)],
  term (192 : Rat) [(0, 1), (6, 2), (7, 1), (15, 1)],
  term (-384 : Rat) [(0, 1), (7, 2), (9, 1), (15, 1)],
  term (192 : Rat) [(0, 1), (7, 3), (15, 1)],
  term (384 : Rat) [(0, 2), (7, 1), (8, 1), (15, 1)],
  term (-192 : Rat) [(0, 3), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 20. -/
theorem rs_R006_ueqv_R006_partial_20_0011_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_20_0011
        rs_R006_ueqv_R006_generator_20_0000_0076 =
      rs_R006_ueqv_R006_partial_20_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 20. -/
def rs_R006_ueqv_R006_coefficient_20_0012 : Poly :=
[
  term (48 : Rat) [(0, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 12 for generator 20. -/
def rs_R006_ueqv_R006_partial_20_0012 : Poly :=
[
  term (-96 : Rat) [(0, 1), (1, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term (48 : Rat) [(0, 1), (1, 2), (7, 1), (15, 1), (16, 1)],
  term (96 : Rat) [(0, 1), (6, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term (-48 : Rat) [(0, 1), (6, 2), (7, 1), (15, 1), (16, 1)],
  term (96 : Rat) [(0, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term (-48 : Rat) [(0, 1), (7, 3), (15, 1), (16, 1)],
  term (-96 : Rat) [(0, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term (48 : Rat) [(0, 3), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 20. -/
theorem rs_R006_ueqv_R006_partial_20_0012_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_20_0012
        rs_R006_ueqv_R006_generator_20_0000_0076 =
      rs_R006_ueqv_R006_partial_20_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 20. -/
def rs_R006_ueqv_R006_coefficient_20_0013 : Poly :=
[
  term ((1152 : Rat) / 7) [(0, 1), (9, 1), (13, 1)]
]

/-- Partial product 13 for generator 20. -/
def rs_R006_ueqv_R006_partial_20_0013 : Poly :=
[
  term ((-2304 : Rat) / 7) [(0, 1), (1, 1), (9, 2), (13, 1)],
  term ((1152 : Rat) / 7) [(0, 1), (1, 2), (9, 1), (13, 1)],
  term ((2304 : Rat) / 7) [(0, 1), (6, 1), (8, 1), (9, 1), (13, 1)],
  term ((-1152 : Rat) / 7) [(0, 1), (6, 2), (9, 1), (13, 1)],
  term ((2304 : Rat) / 7) [(0, 1), (7, 1), (9, 2), (13, 1)],
  term ((-1152 : Rat) / 7) [(0, 1), (7, 2), (9, 1), (13, 1)],
  term ((-2304 : Rat) / 7) [(0, 2), (8, 1), (9, 1), (13, 1)],
  term ((1152 : Rat) / 7) [(0, 3), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 20. -/
theorem rs_R006_ueqv_R006_partial_20_0013_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_20_0013
        rs_R006_ueqv_R006_generator_20_0000_0076 =
      rs_R006_ueqv_R006_partial_20_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 20. -/
def rs_R006_ueqv_R006_coefficient_20_0014 : Poly :=
[
  term ((-1728 : Rat) / 5) [(0, 1), (9, 1), (13, 1), (14, 1)]
]

/-- Partial product 14 for generator 20. -/
def rs_R006_ueqv_R006_partial_20_0014 : Poly :=
[
  term ((3456 : Rat) / 5) [(0, 1), (1, 1), (9, 2), (13, 1), (14, 1)],
  term ((-1728 : Rat) / 5) [(0, 1), (1, 2), (9, 1), (13, 1), (14, 1)],
  term ((-3456 : Rat) / 5) [(0, 1), (6, 1), (8, 1), (9, 1), (13, 1), (14, 1)],
  term ((1728 : Rat) / 5) [(0, 1), (6, 2), (9, 1), (13, 1), (14, 1)],
  term ((-3456 : Rat) / 5) [(0, 1), (7, 1), (9, 2), (13, 1), (14, 1)],
  term ((1728 : Rat) / 5) [(0, 1), (7, 2), (9, 1), (13, 1), (14, 1)],
  term ((3456 : Rat) / 5) [(0, 2), (8, 1), (9, 1), (13, 1), (14, 1)],
  term ((-1728 : Rat) / 5) [(0, 3), (9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 20. -/
theorem rs_R006_ueqv_R006_partial_20_0014_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_20_0014
        rs_R006_ueqv_R006_generator_20_0000_0076 =
      rs_R006_ueqv_R006_partial_20_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 20. -/
def rs_R006_ueqv_R006_coefficient_20_0015 : Poly :=
[
  term ((576 : Rat) / 5) [(0, 1), (9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 15 for generator 20. -/
def rs_R006_ueqv_R006_partial_20_0015 : Poly :=
[
  term ((-1152 : Rat) / 5) [(0, 1), (1, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((576 : Rat) / 5) [(0, 1), (1, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((1152 : Rat) / 5) [(0, 1), (6, 1), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-576 : Rat) / 5) [(0, 1), (6, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((1152 : Rat) / 5) [(0, 1), (7, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((-576 : Rat) / 5) [(0, 1), (7, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1152 : Rat) / 5) [(0, 2), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((576 : Rat) / 5) [(0, 3), (9, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 20. -/
theorem rs_R006_ueqv_R006_partial_20_0015_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_20_0015
        rs_R006_ueqv_R006_generator_20_0000_0076 =
      rs_R006_ueqv_R006_partial_20_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 20. -/
def rs_R006_ueqv_R006_coefficient_20_0016 : Poly :=
[
  term ((-288 : Rat) / 5) [(0, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 16 for generator 20. -/
def rs_R006_ueqv_R006_partial_20_0016 : Poly :=
[
  term ((576 : Rat) / 5) [(0, 1), (1, 1), (9, 2), (13, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(0, 1), (1, 2), (9, 1), (13, 1), (16, 1)],
  term ((-576 : Rat) / 5) [(0, 1), (6, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((288 : Rat) / 5) [(0, 1), (6, 2), (9, 1), (13, 1), (16, 1)],
  term ((-576 : Rat) / 5) [(0, 1), (7, 1), (9, 2), (13, 1), (16, 1)],
  term ((288 : Rat) / 5) [(0, 1), (7, 2), (9, 1), (13, 1), (16, 1)],
  term ((576 : Rat) / 5) [(0, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(0, 3), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 20. -/
theorem rs_R006_ueqv_R006_partial_20_0016_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_20_0016
        rs_R006_ueqv_R006_generator_20_0000_0076 =
      rs_R006_ueqv_R006_partial_20_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 20. -/
def rs_R006_ueqv_R006_coefficient_20_0017 : Poly :=
[
  term ((2016 : Rat) / 5) [(0, 1), (9, 1), (15, 1)]
]

/-- Partial product 17 for generator 20. -/
def rs_R006_ueqv_R006_partial_20_0017 : Poly :=
[
  term ((-4032 : Rat) / 5) [(0, 1), (1, 1), (9, 2), (15, 1)],
  term ((2016 : Rat) / 5) [(0, 1), (1, 2), (9, 1), (15, 1)],
  term ((4032 : Rat) / 5) [(0, 1), (6, 1), (8, 1), (9, 1), (15, 1)],
  term ((-2016 : Rat) / 5) [(0, 1), (6, 2), (9, 1), (15, 1)],
  term ((4032 : Rat) / 5) [(0, 1), (7, 1), (9, 2), (15, 1)],
  term ((-2016 : Rat) / 5) [(0, 1), (7, 2), (9, 1), (15, 1)],
  term ((-4032 : Rat) / 5) [(0, 2), (8, 1), (9, 1), (15, 1)],
  term ((2016 : Rat) / 5) [(0, 3), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 20. -/
theorem rs_R006_ueqv_R006_partial_20_0017_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_20_0017
        rs_R006_ueqv_R006_generator_20_0000_0076 =
      rs_R006_ueqv_R006_partial_20_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 20. -/
def rs_R006_ueqv_R006_coefficient_20_0018 : Poly :=
[
  term ((-648 : Rat) / 5) [(0, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 18 for generator 20. -/
def rs_R006_ueqv_R006_partial_20_0018 : Poly :=
[
  term ((1296 : Rat) / 5) [(0, 1), (1, 1), (9, 2), (15, 1), (16, 1)],
  term ((-648 : Rat) / 5) [(0, 1), (1, 2), (9, 1), (15, 1), (16, 1)],
  term ((-1296 : Rat) / 5) [(0, 1), (6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((648 : Rat) / 5) [(0, 1), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((-1296 : Rat) / 5) [(0, 1), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((648 : Rat) / 5) [(0, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((1296 : Rat) / 5) [(0, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-648 : Rat) / 5) [(0, 3), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 20. -/
theorem rs_R006_ueqv_R006_partial_20_0018_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_20_0018
        rs_R006_ueqv_R006_generator_20_0000_0076 =
      rs_R006_ueqv_R006_partial_20_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 20. -/
def rs_R006_ueqv_R006_coefficient_20_0019 : Poly :=
[
  term ((-144 : Rat) / 5) [(0, 1), (11, 1), (15, 1)]
]

/-- Partial product 19 for generator 20. -/
def rs_R006_ueqv_R006_partial_20_0019 : Poly :=
[
  term ((288 : Rat) / 5) [(0, 1), (1, 1), (9, 1), (11, 1), (15, 1)],
  term ((-144 : Rat) / 5) [(0, 1), (1, 2), (11, 1), (15, 1)],
  term ((-288 : Rat) / 5) [(0, 1), (6, 1), (8, 1), (11, 1), (15, 1)],
  term ((144 : Rat) / 5) [(0, 1), (6, 2), (11, 1), (15, 1)],
  term ((-288 : Rat) / 5) [(0, 1), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((144 : Rat) / 5) [(0, 1), (7, 2), (11, 1), (15, 1)],
  term ((288 : Rat) / 5) [(0, 2), (8, 1), (11, 1), (15, 1)],
  term ((-144 : Rat) / 5) [(0, 3), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 20. -/
theorem rs_R006_ueqv_R006_partial_20_0019_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_20_0019
        rs_R006_ueqv_R006_generator_20_0000_0076 =
      rs_R006_ueqv_R006_partial_20_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 20. -/
def rs_R006_ueqv_R006_coefficient_20_0020 : Poly :=
[
  term ((36 : Rat) / 5) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 20 for generator 20. -/
def rs_R006_ueqv_R006_partial_20_0020 : Poly :=
[
  term ((-72 : Rat) / 5) [(0, 1), (1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((36 : Rat) / 5) [(0, 1), (1, 2), (11, 1), (15, 1), (16, 1)],
  term ((72 : Rat) / 5) [(0, 1), (6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-36 : Rat) / 5) [(0, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((72 : Rat) / 5) [(0, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-36 : Rat) / 5) [(0, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-72 : Rat) / 5) [(0, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((36 : Rat) / 5) [(0, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 20. -/
theorem rs_R006_ueqv_R006_partial_20_0020_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_20_0020
        rs_R006_ueqv_R006_generator_20_0000_0076 =
      rs_R006_ueqv_R006_partial_20_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 20. -/
def rs_R006_ueqv_R006_coefficient_20_0021 : Poly :=
[
  term ((108 : Rat) / 5) [(0, 1), (14, 1)]
]

/-- Partial product 21 for generator 20. -/
def rs_R006_ueqv_R006_partial_20_0021 : Poly :=
[
  term ((-216 : Rat) / 5) [(0, 1), (1, 1), (9, 1), (14, 1)],
  term ((108 : Rat) / 5) [(0, 1), (1, 2), (14, 1)],
  term ((216 : Rat) / 5) [(0, 1), (6, 1), (8, 1), (14, 1)],
  term ((-108 : Rat) / 5) [(0, 1), (6, 2), (14, 1)],
  term ((216 : Rat) / 5) [(0, 1), (7, 1), (9, 1), (14, 1)],
  term ((-108 : Rat) / 5) [(0, 1), (7, 2), (14, 1)],
  term ((-216 : Rat) / 5) [(0, 2), (8, 1), (14, 1)],
  term ((108 : Rat) / 5) [(0, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 20. -/
theorem rs_R006_ueqv_R006_partial_20_0021_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_20_0021
        rs_R006_ueqv_R006_generator_20_0000_0076 =
      rs_R006_ueqv_R006_partial_20_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 20. -/
def rs_R006_ueqv_R006_coefficient_20_0022 : Poly :=
[
  term ((-1152 : Rat) / 5) [(0, 2), (9, 1), (15, 1)]
]

/-- Partial product 22 for generator 20. -/
def rs_R006_ueqv_R006_partial_20_0022 : Poly :=
[
  term ((2304 : Rat) / 5) [(0, 2), (1, 1), (9, 2), (15, 1)],
  term ((-1152 : Rat) / 5) [(0, 2), (1, 2), (9, 1), (15, 1)],
  term ((-2304 : Rat) / 5) [(0, 2), (6, 1), (8, 1), (9, 1), (15, 1)],
  term ((1152 : Rat) / 5) [(0, 2), (6, 2), (9, 1), (15, 1)],
  term ((-2304 : Rat) / 5) [(0, 2), (7, 1), (9, 2), (15, 1)],
  term ((1152 : Rat) / 5) [(0, 2), (7, 2), (9, 1), (15, 1)],
  term ((2304 : Rat) / 5) [(0, 3), (8, 1), (9, 1), (15, 1)],
  term ((-1152 : Rat) / 5) [(0, 4), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 20. -/
theorem rs_R006_ueqv_R006_partial_20_0022_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_20_0022
        rs_R006_ueqv_R006_generator_20_0000_0076 =
      rs_R006_ueqv_R006_partial_20_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 20. -/
def rs_R006_ueqv_R006_coefficient_20_0023 : Poly :=
[
  term ((288 : Rat) / 5) [(0, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 23 for generator 20. -/
def rs_R006_ueqv_R006_partial_20_0023 : Poly :=
[
  term ((-576 : Rat) / 5) [(0, 2), (1, 1), (9, 2), (15, 1), (16, 1)],
  term ((288 : Rat) / 5) [(0, 2), (1, 2), (9, 1), (15, 1), (16, 1)],
  term ((576 : Rat) / 5) [(0, 2), (6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(0, 2), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((576 : Rat) / 5) [(0, 2), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(0, 2), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-576 : Rat) / 5) [(0, 3), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((288 : Rat) / 5) [(0, 4), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 20. -/
theorem rs_R006_ueqv_R006_partial_20_0023_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_20_0023
        rs_R006_ueqv_R006_generator_20_0000_0076 =
      rs_R006_ueqv_R006_partial_20_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 20. -/
def rs_R006_ueqv_R006_coefficient_20_0024 : Poly :=
[
  term ((144 : Rat) / 35) [(1, 1), (2, 1), (13, 1)]
]

/-- Partial product 24 for generator 20. -/
def rs_R006_ueqv_R006_partial_20_0024 : Poly :=
[
  term ((-288 : Rat) / 35) [(0, 1), (1, 1), (2, 1), (8, 1), (13, 1)],
  term ((144 : Rat) / 35) [(0, 2), (1, 1), (2, 1), (13, 1)],
  term ((288 : Rat) / 35) [(1, 1), (2, 1), (6, 1), (8, 1), (13, 1)],
  term ((-144 : Rat) / 35) [(1, 1), (2, 1), (6, 2), (13, 1)],
  term ((288 : Rat) / 35) [(1, 1), (2, 1), (7, 1), (9, 1), (13, 1)],
  term ((-144 : Rat) / 35) [(1, 1), (2, 1), (7, 2), (13, 1)],
  term ((-288 : Rat) / 35) [(1, 2), (2, 1), (9, 1), (13, 1)],
  term ((144 : Rat) / 35) [(1, 3), (2, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 20. -/
theorem rs_R006_ueqv_R006_partial_20_0024_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_20_0024
        rs_R006_ueqv_R006_generator_20_0000_0076 =
      rs_R006_ueqv_R006_partial_20_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 20. -/
def rs_R006_ueqv_R006_coefficient_20_0025 : Poly :=
[
  term (576 : Rat) [(1, 1), (2, 1), (15, 1)]
]

/-- Partial product 25 for generator 20. -/
def rs_R006_ueqv_R006_partial_20_0025 : Poly :=
[
  term (-1152 : Rat) [(0, 1), (1, 1), (2, 1), (8, 1), (15, 1)],
  term (576 : Rat) [(0, 2), (1, 1), (2, 1), (15, 1)],
  term (1152 : Rat) [(1, 1), (2, 1), (6, 1), (8, 1), (15, 1)],
  term (-576 : Rat) [(1, 1), (2, 1), (6, 2), (15, 1)],
  term (1152 : Rat) [(1, 1), (2, 1), (7, 1), (9, 1), (15, 1)],
  term (-576 : Rat) [(1, 1), (2, 1), (7, 2), (15, 1)],
  term (-1152 : Rat) [(1, 2), (2, 1), (9, 1), (15, 1)],
  term (576 : Rat) [(1, 3), (2, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 20. -/
theorem rs_R006_ueqv_R006_partial_20_0025_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_20_0025
        rs_R006_ueqv_R006_generator_20_0000_0076 =
      rs_R006_ueqv_R006_partial_20_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 20. -/
def rs_R006_ueqv_R006_coefficient_20_0026 : Poly :=
[
  term (-192 : Rat) [(1, 1), (2, 1), (15, 1), (16, 1)]
]

/-- Partial product 26 for generator 20. -/
def rs_R006_ueqv_R006_partial_20_0026 : Poly :=
[
  term (384 : Rat) [(0, 1), (1, 1), (2, 1), (8, 1), (15, 1), (16, 1)],
  term (-192 : Rat) [(0, 2), (1, 1), (2, 1), (15, 1), (16, 1)],
  term (-384 : Rat) [(1, 1), (2, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term (192 : Rat) [(1, 1), (2, 1), (6, 2), (15, 1), (16, 1)],
  term (-384 : Rat) [(1, 1), (2, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term (192 : Rat) [(1, 1), (2, 1), (7, 2), (15, 1), (16, 1)],
  term (384 : Rat) [(1, 2), (2, 1), (9, 1), (15, 1), (16, 1)],
  term (-192 : Rat) [(1, 3), (2, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 20. -/
theorem rs_R006_ueqv_R006_partial_20_0026_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_20_0026
        rs_R006_ueqv_R006_generator_20_0000_0076 =
      rs_R006_ueqv_R006_partial_20_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 20. -/
def rs_R006_ueqv_R006_coefficient_20_0027 : Poly :=
[
  term (-288 : Rat) [(1, 1), (3, 1)]
]

/-- Partial product 27 for generator 20. -/
def rs_R006_ueqv_R006_partial_20_0027 : Poly :=
[
  term (576 : Rat) [(0, 1), (1, 1), (3, 1), (8, 1)],
  term (-288 : Rat) [(0, 2), (1, 1), (3, 1)],
  term (-576 : Rat) [(1, 1), (3, 1), (6, 1), (8, 1)],
  term (288 : Rat) [(1, 1), (3, 1), (6, 2)],
  term (-576 : Rat) [(1, 1), (3, 1), (7, 1), (9, 1)],
  term (288 : Rat) [(1, 1), (3, 1), (7, 2)],
  term (576 : Rat) [(1, 2), (3, 1), (9, 1)],
  term (-288 : Rat) [(1, 3), (3, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 20. -/
theorem rs_R006_ueqv_R006_partial_20_0027_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_20_0027
        rs_R006_ueqv_R006_generator_20_0000_0076 =
      rs_R006_ueqv_R006_partial_20_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 20. -/
def rs_R006_ueqv_R006_coefficient_20_0028 : Poly :=
[
  term (-144 : Rat) [(1, 1), (3, 1), (14, 1)]
]

/-- Partial product 28 for generator 20. -/
def rs_R006_ueqv_R006_partial_20_0028 : Poly :=
[
  term (288 : Rat) [(0, 1), (1, 1), (3, 1), (8, 1), (14, 1)],
  term (-144 : Rat) [(0, 2), (1, 1), (3, 1), (14, 1)],
  term (-288 : Rat) [(1, 1), (3, 1), (6, 1), (8, 1), (14, 1)],
  term (144 : Rat) [(1, 1), (3, 1), (6, 2), (14, 1)],
  term (-288 : Rat) [(1, 1), (3, 1), (7, 1), (9, 1), (14, 1)],
  term (144 : Rat) [(1, 1), (3, 1), (7, 2), (14, 1)],
  term (288 : Rat) [(1, 2), (3, 1), (9, 1), (14, 1)],
  term (-144 : Rat) [(1, 3), (3, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 20. -/
theorem rs_R006_ueqv_R006_partial_20_0028_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_20_0028
        rs_R006_ueqv_R006_generator_20_0000_0076 =
      rs_R006_ueqv_R006_partial_20_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 20. -/
def rs_R006_ueqv_R006_coefficient_20_0029 : Poly :=
[
  term (48 : Rat) [(1, 1), (3, 1), (14, 1), (16, 1)]
]

/-- Partial product 29 for generator 20. -/
def rs_R006_ueqv_R006_partial_20_0029 : Poly :=
[
  term (-96 : Rat) [(0, 1), (1, 1), (3, 1), (8, 1), (14, 1), (16, 1)],
  term (48 : Rat) [(0, 2), (1, 1), (3, 1), (14, 1), (16, 1)],
  term (96 : Rat) [(1, 1), (3, 1), (6, 1), (8, 1), (14, 1), (16, 1)],
  term (-48 : Rat) [(1, 1), (3, 1), (6, 2), (14, 1), (16, 1)],
  term (96 : Rat) [(1, 1), (3, 1), (7, 1), (9, 1), (14, 1), (16, 1)],
  term (-48 : Rat) [(1, 1), (3, 1), (7, 2), (14, 1), (16, 1)],
  term (-96 : Rat) [(1, 2), (3, 1), (9, 1), (14, 1), (16, 1)],
  term (48 : Rat) [(1, 3), (3, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 20. -/
theorem rs_R006_ueqv_R006_partial_20_0029_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_20_0029
        rs_R006_ueqv_R006_generator_20_0000_0076 =
      rs_R006_ueqv_R006_partial_20_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 20. -/
def rs_R006_ueqv_R006_coefficient_20_0030 : Poly :=
[
  term (96 : Rat) [(1, 1), (3, 1), (16, 1)]
]

/-- Partial product 30 for generator 20. -/
def rs_R006_ueqv_R006_partial_20_0030 : Poly :=
[
  term (-192 : Rat) [(0, 1), (1, 1), (3, 1), (8, 1), (16, 1)],
  term (96 : Rat) [(0, 2), (1, 1), (3, 1), (16, 1)],
  term (192 : Rat) [(1, 1), (3, 1), (6, 1), (8, 1), (16, 1)],
  term (-96 : Rat) [(1, 1), (3, 1), (6, 2), (16, 1)],
  term (192 : Rat) [(1, 1), (3, 1), (7, 1), (9, 1), (16, 1)],
  term (-96 : Rat) [(1, 1), (3, 1), (7, 2), (16, 1)],
  term (-192 : Rat) [(1, 2), (3, 1), (9, 1), (16, 1)],
  term (96 : Rat) [(1, 3), (3, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 20. -/
theorem rs_R006_ueqv_R006_partial_20_0030_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_20_0030
        rs_R006_ueqv_R006_generator_20_0000_0076 =
      rs_R006_ueqv_R006_partial_20_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 20. -/
def rs_R006_ueqv_R006_coefficient_20_0031 : Poly :=
[
  term ((-144 : Rat) / 35) [(1, 1), (4, 1), (13, 1)]
]

/-- Partial product 31 for generator 20. -/
def rs_R006_ueqv_R006_partial_20_0031 : Poly :=
[
  term ((288 : Rat) / 35) [(0, 1), (1, 1), (4, 1), (8, 1), (13, 1)],
  term ((-144 : Rat) / 35) [(0, 2), (1, 1), (4, 1), (13, 1)],
  term ((-288 : Rat) / 35) [(1, 1), (4, 1), (6, 1), (8, 1), (13, 1)],
  term ((144 : Rat) / 35) [(1, 1), (4, 1), (6, 2), (13, 1)],
  term ((-288 : Rat) / 35) [(1, 1), (4, 1), (7, 1), (9, 1), (13, 1)],
  term ((144 : Rat) / 35) [(1, 1), (4, 1), (7, 2), (13, 1)],
  term ((288 : Rat) / 35) [(1, 2), (4, 1), (9, 1), (13, 1)],
  term ((-144 : Rat) / 35) [(1, 3), (4, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 20. -/
theorem rs_R006_ueqv_R006_partial_20_0031_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_20_0031
        rs_R006_ueqv_R006_generator_20_0000_0076 =
      rs_R006_ueqv_R006_partial_20_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 20. -/
def rs_R006_ueqv_R006_coefficient_20_0032 : Poly :=
[
  term ((-996 : Rat) / 7) [(1, 1), (13, 1)]
]

/-- Partial product 32 for generator 20. -/
def rs_R006_ueqv_R006_partial_20_0032 : Poly :=
[
  term ((1992 : Rat) / 7) [(0, 1), (1, 1), (8, 1), (13, 1)],
  term ((-996 : Rat) / 7) [(0, 2), (1, 1), (13, 1)],
  term ((-1992 : Rat) / 7) [(1, 1), (6, 1), (8, 1), (13, 1)],
  term ((996 : Rat) / 7) [(1, 1), (6, 2), (13, 1)],
  term ((-1992 : Rat) / 7) [(1, 1), (7, 1), (9, 1), (13, 1)],
  term ((996 : Rat) / 7) [(1, 1), (7, 2), (13, 1)],
  term ((1992 : Rat) / 7) [(1, 2), (9, 1), (13, 1)],
  term ((-996 : Rat) / 7) [(1, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 20. -/
theorem rs_R006_ueqv_R006_partial_20_0032_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_20_0032
        rs_R006_ueqv_R006_generator_20_0000_0076 =
      rs_R006_ueqv_R006_partial_20_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 20. -/
def rs_R006_ueqv_R006_coefficient_20_0033 : Poly :=
[
  term (288 : Rat) [(1, 1), (13, 1), (14, 1)]
]

/-- Partial product 33 for generator 20. -/
def rs_R006_ueqv_R006_partial_20_0033 : Poly :=
[
  term (-576 : Rat) [(0, 1), (1, 1), (8, 1), (13, 1), (14, 1)],
  term (288 : Rat) [(0, 2), (1, 1), (13, 1), (14, 1)],
  term (576 : Rat) [(1, 1), (6, 1), (8, 1), (13, 1), (14, 1)],
  term (-288 : Rat) [(1, 1), (6, 2), (13, 1), (14, 1)],
  term (576 : Rat) [(1, 1), (7, 1), (9, 1), (13, 1), (14, 1)],
  term (-288 : Rat) [(1, 1), (7, 2), (13, 1), (14, 1)],
  term (-576 : Rat) [(1, 2), (9, 1), (13, 1), (14, 1)],
  term (288 : Rat) [(1, 3), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 20. -/
theorem rs_R006_ueqv_R006_partial_20_0033_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_20_0033
        rs_R006_ueqv_R006_generator_20_0000_0076 =
      rs_R006_ueqv_R006_partial_20_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 20. -/
def rs_R006_ueqv_R006_coefficient_20_0034 : Poly :=
[
  term (-96 : Rat) [(1, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 34 for generator 20. -/
def rs_R006_ueqv_R006_partial_20_0034 : Poly :=
[
  term (192 : Rat) [(0, 1), (1, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term (-96 : Rat) [(0, 2), (1, 1), (13, 1), (14, 1), (16, 1)],
  term (-192 : Rat) [(1, 1), (6, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term (96 : Rat) [(1, 1), (6, 2), (13, 1), (14, 1), (16, 1)],
  term (-192 : Rat) [(1, 1), (7, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term (96 : Rat) [(1, 1), (7, 2), (13, 1), (14, 1), (16, 1)],
  term (192 : Rat) [(1, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term (-96 : Rat) [(1, 3), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 20. -/
theorem rs_R006_ueqv_R006_partial_20_0034_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_20_0034
        rs_R006_ueqv_R006_generator_20_0000_0076 =
      rs_R006_ueqv_R006_partial_20_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 20. -/
def rs_R006_ueqv_R006_coefficient_20_0035 : Poly :=
[
  term (48 : Rat) [(1, 1), (13, 1), (16, 1)]
]

/-- Partial product 35 for generator 20. -/
def rs_R006_ueqv_R006_partial_20_0035 : Poly :=
[
  term (-96 : Rat) [(0, 1), (1, 1), (8, 1), (13, 1), (16, 1)],
  term (48 : Rat) [(0, 2), (1, 1), (13, 1), (16, 1)],
  term (96 : Rat) [(1, 1), (6, 1), (8, 1), (13, 1), (16, 1)],
  term (-48 : Rat) [(1, 1), (6, 2), (13, 1), (16, 1)],
  term (96 : Rat) [(1, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term (-48 : Rat) [(1, 1), (7, 2), (13, 1), (16, 1)],
  term (-96 : Rat) [(1, 2), (9, 1), (13, 1), (16, 1)],
  term (48 : Rat) [(1, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 20. -/
theorem rs_R006_ueqv_R006_partial_20_0035_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_20_0035
        rs_R006_ueqv_R006_generator_20_0000_0076 =
      rs_R006_ueqv_R006_partial_20_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 20. -/
def rs_R006_ueqv_R006_coefficient_20_0036 : Poly :=
[
  term (-288 : Rat) [(1, 1), (15, 1)]
]

/-- Partial product 36 for generator 20. -/
def rs_R006_ueqv_R006_partial_20_0036 : Poly :=
[
  term (576 : Rat) [(0, 1), (1, 1), (8, 1), (15, 1)],
  term (-288 : Rat) [(0, 2), (1, 1), (15, 1)],
  term (-576 : Rat) [(1, 1), (6, 1), (8, 1), (15, 1)],
  term (288 : Rat) [(1, 1), (6, 2), (15, 1)],
  term (-576 : Rat) [(1, 1), (7, 1), (9, 1), (15, 1)],
  term (288 : Rat) [(1, 1), (7, 2), (15, 1)],
  term (576 : Rat) [(1, 2), (9, 1), (15, 1)],
  term (-288 : Rat) [(1, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 20. -/
theorem rs_R006_ueqv_R006_partial_20_0036_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_20_0036
        rs_R006_ueqv_R006_generator_20_0000_0076 =
      rs_R006_ueqv_R006_partial_20_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 20. -/
def rs_R006_ueqv_R006_coefficient_20_0037 : Poly :=
[
  term (96 : Rat) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 37 for generator 20. -/
def rs_R006_ueqv_R006_partial_20_0037 : Poly :=
[
  term (-192 : Rat) [(0, 1), (1, 1), (8, 1), (15, 1), (16, 1)],
  term (96 : Rat) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term (192 : Rat) [(1, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term (-96 : Rat) [(1, 1), (6, 2), (15, 1), (16, 1)],
  term (192 : Rat) [(1, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term (-96 : Rat) [(1, 1), (7, 2), (15, 1), (16, 1)],
  term (-192 : Rat) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term (96 : Rat) [(1, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 20. -/
theorem rs_R006_ueqv_R006_partial_20_0037_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_20_0037
        rs_R006_ueqv_R006_generator_20_0000_0076 =
      rs_R006_ueqv_R006_partial_20_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 20. -/
def rs_R006_ueqv_R006_coefficient_20_0038 : Poly :=
[
  term ((-144 : Rat) / 35) [(2, 1), (7, 1), (13, 1)]
]

/-- Partial product 38 for generator 20. -/
def rs_R006_ueqv_R006_partial_20_0038 : Poly :=
[
  term ((288 : Rat) / 35) [(0, 1), (2, 1), (7, 1), (8, 1), (13, 1)],
  term ((-144 : Rat) / 35) [(0, 2), (2, 1), (7, 1), (13, 1)],
  term ((288 : Rat) / 35) [(1, 1), (2, 1), (7, 1), (9, 1), (13, 1)],
  term ((-144 : Rat) / 35) [(1, 2), (2, 1), (7, 1), (13, 1)],
  term ((-288 : Rat) / 35) [(2, 1), (6, 1), (7, 1), (8, 1), (13, 1)],
  term ((144 : Rat) / 35) [(2, 1), (6, 2), (7, 1), (13, 1)],
  term ((-288 : Rat) / 35) [(2, 1), (7, 2), (9, 1), (13, 1)],
  term ((144 : Rat) / 35) [(2, 1), (7, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 20. -/
theorem rs_R006_ueqv_R006_partial_20_0038_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_20_0038
        rs_R006_ueqv_R006_generator_20_0000_0076 =
      rs_R006_ueqv_R006_partial_20_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 20. -/
def rs_R006_ueqv_R006_coefficient_20_0039 : Poly :=
[
  term (-576 : Rat) [(2, 1), (7, 1), (15, 1)]
]

/-- Partial product 39 for generator 20. -/
def rs_R006_ueqv_R006_partial_20_0039 : Poly :=
[
  term (1152 : Rat) [(0, 1), (2, 1), (7, 1), (8, 1), (15, 1)],
  term (-576 : Rat) [(0, 2), (2, 1), (7, 1), (15, 1)],
  term (1152 : Rat) [(1, 1), (2, 1), (7, 1), (9, 1), (15, 1)],
  term (-576 : Rat) [(1, 2), (2, 1), (7, 1), (15, 1)],
  term (-1152 : Rat) [(2, 1), (6, 1), (7, 1), (8, 1), (15, 1)],
  term (576 : Rat) [(2, 1), (6, 2), (7, 1), (15, 1)],
  term (-1152 : Rat) [(2, 1), (7, 2), (9, 1), (15, 1)],
  term (576 : Rat) [(2, 1), (7, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 20. -/
theorem rs_R006_ueqv_R006_partial_20_0039_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_20_0039
        rs_R006_ueqv_R006_generator_20_0000_0076 =
      rs_R006_ueqv_R006_partial_20_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 20. -/
def rs_R006_ueqv_R006_coefficient_20_0040 : Poly :=
[
  term (192 : Rat) [(2, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 40 for generator 20. -/
def rs_R006_ueqv_R006_partial_20_0040 : Poly :=
[
  term (-384 : Rat) [(0, 1), (2, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term (192 : Rat) [(0, 2), (2, 1), (7, 1), (15, 1), (16, 1)],
  term (-384 : Rat) [(1, 1), (2, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term (192 : Rat) [(1, 2), (2, 1), (7, 1), (15, 1), (16, 1)],
  term (384 : Rat) [(2, 1), (6, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term (-192 : Rat) [(2, 1), (6, 2), (7, 1), (15, 1), (16, 1)],
  term (384 : Rat) [(2, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term (-192 : Rat) [(2, 1), (7, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 20. -/
theorem rs_R006_ueqv_R006_partial_20_0040_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_20_0040
        rs_R006_ueqv_R006_generator_20_0000_0076 =
      rs_R006_ueqv_R006_partial_20_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 20. -/
def rs_R006_ueqv_R006_coefficient_20_0041 : Poly :=
[
  term ((864 : Rat) / 5) [(2, 1), (9, 1), (15, 1)]
]

/-- Partial product 41 for generator 20. -/
def rs_R006_ueqv_R006_partial_20_0041 : Poly :=
[
  term ((-1728 : Rat) / 5) [(0, 1), (2, 1), (8, 1), (9, 1), (15, 1)],
  term ((864 : Rat) / 5) [(0, 2), (2, 1), (9, 1), (15, 1)],
  term ((-1728 : Rat) / 5) [(1, 1), (2, 1), (9, 2), (15, 1)],
  term ((864 : Rat) / 5) [(1, 2), (2, 1), (9, 1), (15, 1)],
  term ((1728 : Rat) / 5) [(2, 1), (6, 1), (8, 1), (9, 1), (15, 1)],
  term ((-864 : Rat) / 5) [(2, 1), (6, 2), (9, 1), (15, 1)],
  term ((1728 : Rat) / 5) [(2, 1), (7, 1), (9, 2), (15, 1)],
  term ((-864 : Rat) / 5) [(2, 1), (7, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 20. -/
theorem rs_R006_ueqv_R006_partial_20_0041_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_20_0041
        rs_R006_ueqv_R006_generator_20_0000_0076 =
      rs_R006_ueqv_R006_partial_20_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 20. -/
def rs_R006_ueqv_R006_coefficient_20_0042 : Poly :=
[
  term ((-288 : Rat) / 5) [(2, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 42 for generator 20. -/
def rs_R006_ueqv_R006_partial_20_0042 : Poly :=
[
  term ((576 : Rat) / 5) [(0, 1), (2, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(0, 2), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((576 : Rat) / 5) [(1, 1), (2, 1), (9, 2), (15, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(1, 2), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((-576 : Rat) / 5) [(2, 1), (6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((288 : Rat) / 5) [(2, 1), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((-576 : Rat) / 5) [(2, 1), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((288 : Rat) / 5) [(2, 1), (7, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 20. -/
theorem rs_R006_ueqv_R006_partial_20_0042_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_20_0042
        rs_R006_ueqv_R006_generator_20_0000_0076 =
      rs_R006_ueqv_R006_partial_20_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 20. -/
def rs_R006_ueqv_R006_coefficient_20_0043 : Poly :=
[
  term ((-432 : Rat) / 5) [(2, 1), (11, 1), (15, 1)]
]

/-- Partial product 43 for generator 20. -/
def rs_R006_ueqv_R006_partial_20_0043 : Poly :=
[
  term ((864 : Rat) / 5) [(0, 1), (2, 1), (8, 1), (11, 1), (15, 1)],
  term ((-432 : Rat) / 5) [(0, 2), (2, 1), (11, 1), (15, 1)],
  term ((864 : Rat) / 5) [(1, 1), (2, 1), (9, 1), (11, 1), (15, 1)],
  term ((-432 : Rat) / 5) [(1, 2), (2, 1), (11, 1), (15, 1)],
  term ((-864 : Rat) / 5) [(2, 1), (6, 1), (8, 1), (11, 1), (15, 1)],
  term ((432 : Rat) / 5) [(2, 1), (6, 2), (11, 1), (15, 1)],
  term ((-864 : Rat) / 5) [(2, 1), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((432 : Rat) / 5) [(2, 1), (7, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 20. -/
theorem rs_R006_ueqv_R006_partial_20_0043_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_20_0043
        rs_R006_ueqv_R006_generator_20_0000_0076 =
      rs_R006_ueqv_R006_partial_20_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 20. -/
def rs_R006_ueqv_R006_coefficient_20_0044 : Poly :=
[
  term ((144 : Rat) / 5) [(2, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 44 for generator 20. -/
def rs_R006_ueqv_R006_partial_20_0044 : Poly :=
[
  term ((-288 : Rat) / 5) [(0, 1), (2, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((144 : Rat) / 5) [(0, 2), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(1, 1), (2, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((144 : Rat) / 5) [(1, 2), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((288 : Rat) / 5) [(2, 1), (6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-144 : Rat) / 5) [(2, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((288 : Rat) / 5) [(2, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-144 : Rat) / 5) [(2, 1), (7, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 20. -/
theorem rs_R006_ueqv_R006_partial_20_0044_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_20_0044
        rs_R006_ueqv_R006_generator_20_0000_0076 =
      rs_R006_ueqv_R006_partial_20_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 20. -/
def rs_R006_ueqv_R006_coefficient_20_0045 : Poly :=
[
  term (288 : Rat) [(3, 1), (7, 1)]
]

/-- Partial product 45 for generator 20. -/
def rs_R006_ueqv_R006_partial_20_0045 : Poly :=
[
  term (-576 : Rat) [(0, 1), (3, 1), (7, 1), (8, 1)],
  term (288 : Rat) [(0, 2), (3, 1), (7, 1)],
  term (-576 : Rat) [(1, 1), (3, 1), (7, 1), (9, 1)],
  term (288 : Rat) [(1, 2), (3, 1), (7, 1)],
  term (576 : Rat) [(3, 1), (6, 1), (7, 1), (8, 1)],
  term (-288 : Rat) [(3, 1), (6, 2), (7, 1)],
  term (576 : Rat) [(3, 1), (7, 2), (9, 1)],
  term (-288 : Rat) [(3, 1), (7, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 20. -/
theorem rs_R006_ueqv_R006_partial_20_0045_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_20_0045
        rs_R006_ueqv_R006_generator_20_0000_0076 =
      rs_R006_ueqv_R006_partial_20_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 20. -/
def rs_R006_ueqv_R006_coefficient_20_0046 : Poly :=
[
  term (144 : Rat) [(3, 1), (7, 1), (14, 1)]
]

/-- Partial product 46 for generator 20. -/
def rs_R006_ueqv_R006_partial_20_0046 : Poly :=
[
  term (-288 : Rat) [(0, 1), (3, 1), (7, 1), (8, 1), (14, 1)],
  term (144 : Rat) [(0, 2), (3, 1), (7, 1), (14, 1)],
  term (-288 : Rat) [(1, 1), (3, 1), (7, 1), (9, 1), (14, 1)],
  term (144 : Rat) [(1, 2), (3, 1), (7, 1), (14, 1)],
  term (288 : Rat) [(3, 1), (6, 1), (7, 1), (8, 1), (14, 1)],
  term (-144 : Rat) [(3, 1), (6, 2), (7, 1), (14, 1)],
  term (288 : Rat) [(3, 1), (7, 2), (9, 1), (14, 1)],
  term (-144 : Rat) [(3, 1), (7, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 20. -/
theorem rs_R006_ueqv_R006_partial_20_0046_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_20_0046
        rs_R006_ueqv_R006_generator_20_0000_0076 =
      rs_R006_ueqv_R006_partial_20_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 20. -/
def rs_R006_ueqv_R006_coefficient_20_0047 : Poly :=
[
  term (-48 : Rat) [(3, 1), (7, 1), (14, 1), (16, 1)]
]

/-- Partial product 47 for generator 20. -/
def rs_R006_ueqv_R006_partial_20_0047 : Poly :=
[
  term (96 : Rat) [(0, 1), (3, 1), (7, 1), (8, 1), (14, 1), (16, 1)],
  term (-48 : Rat) [(0, 2), (3, 1), (7, 1), (14, 1), (16, 1)],
  term (96 : Rat) [(1, 1), (3, 1), (7, 1), (9, 1), (14, 1), (16, 1)],
  term (-48 : Rat) [(1, 2), (3, 1), (7, 1), (14, 1), (16, 1)],
  term (-96 : Rat) [(3, 1), (6, 1), (7, 1), (8, 1), (14, 1), (16, 1)],
  term (48 : Rat) [(3, 1), (6, 2), (7, 1), (14, 1), (16, 1)],
  term (-96 : Rat) [(3, 1), (7, 2), (9, 1), (14, 1), (16, 1)],
  term (48 : Rat) [(3, 1), (7, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 20. -/
theorem rs_R006_ueqv_R006_partial_20_0047_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_20_0047
        rs_R006_ueqv_R006_generator_20_0000_0076 =
      rs_R006_ueqv_R006_partial_20_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 20. -/
def rs_R006_ueqv_R006_coefficient_20_0048 : Poly :=
[
  term (-96 : Rat) [(3, 1), (7, 1), (16, 1)]
]

/-- Partial product 48 for generator 20. -/
def rs_R006_ueqv_R006_partial_20_0048 : Poly :=
[
  term (192 : Rat) [(0, 1), (3, 1), (7, 1), (8, 1), (16, 1)],
  term (-96 : Rat) [(0, 2), (3, 1), (7, 1), (16, 1)],
  term (192 : Rat) [(1, 1), (3, 1), (7, 1), (9, 1), (16, 1)],
  term (-96 : Rat) [(1, 2), (3, 1), (7, 1), (16, 1)],
  term (-192 : Rat) [(3, 1), (6, 1), (7, 1), (8, 1), (16, 1)],
  term (96 : Rat) [(3, 1), (6, 2), (7, 1), (16, 1)],
  term (-192 : Rat) [(3, 1), (7, 2), (9, 1), (16, 1)],
  term (96 : Rat) [(3, 1), (7, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 20. -/
theorem rs_R006_ueqv_R006_partial_20_0048_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_20_0048
        rs_R006_ueqv_R006_generator_20_0000_0076 =
      rs_R006_ueqv_R006_partial_20_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 20. -/
def rs_R006_ueqv_R006_coefficient_20_0049 : Poly :=
[
  term ((-432 : Rat) / 5) [(3, 1), (9, 1)]
]

/-- Partial product 49 for generator 20. -/
def rs_R006_ueqv_R006_partial_20_0049 : Poly :=
[
  term ((864 : Rat) / 5) [(0, 1), (3, 1), (8, 1), (9, 1)],
  term ((-432 : Rat) / 5) [(0, 2), (3, 1), (9, 1)],
  term ((864 : Rat) / 5) [(1, 1), (3, 1), (9, 2)],
  term ((-432 : Rat) / 5) [(1, 2), (3, 1), (9, 1)],
  term ((-864 : Rat) / 5) [(3, 1), (6, 1), (8, 1), (9, 1)],
  term ((432 : Rat) / 5) [(3, 1), (6, 2), (9, 1)],
  term ((-864 : Rat) / 5) [(3, 1), (7, 1), (9, 2)],
  term ((432 : Rat) / 5) [(3, 1), (7, 2), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 20. -/
theorem rs_R006_ueqv_R006_partial_20_0049_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_20_0049
        rs_R006_ueqv_R006_generator_20_0000_0076 =
      rs_R006_ueqv_R006_partial_20_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 20. -/
def rs_R006_ueqv_R006_coefficient_20_0050 : Poly :=
[
  term ((-216 : Rat) / 5) [(3, 1), (9, 1), (14, 1)]
]

/-- Partial product 50 for generator 20. -/
def rs_R006_ueqv_R006_partial_20_0050 : Poly :=
[
  term ((432 : Rat) / 5) [(0, 1), (3, 1), (8, 1), (9, 1), (14, 1)],
  term ((-216 : Rat) / 5) [(0, 2), (3, 1), (9, 1), (14, 1)],
  term ((432 : Rat) / 5) [(1, 1), (3, 1), (9, 2), (14, 1)],
  term ((-216 : Rat) / 5) [(1, 2), (3, 1), (9, 1), (14, 1)],
  term ((-432 : Rat) / 5) [(3, 1), (6, 1), (8, 1), (9, 1), (14, 1)],
  term ((216 : Rat) / 5) [(3, 1), (6, 2), (9, 1), (14, 1)],
  term ((-432 : Rat) / 5) [(3, 1), (7, 1), (9, 2), (14, 1)],
  term ((216 : Rat) / 5) [(3, 1), (7, 2), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 20. -/
theorem rs_R006_ueqv_R006_partial_20_0050_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_20_0050
        rs_R006_ueqv_R006_generator_20_0000_0076 =
      rs_R006_ueqv_R006_partial_20_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 20. -/
def rs_R006_ueqv_R006_coefficient_20_0051 : Poly :=
[
  term ((72 : Rat) / 5) [(3, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 51 for generator 20. -/
def rs_R006_ueqv_R006_partial_20_0051 : Poly :=
[
  term ((-144 : Rat) / 5) [(0, 1), (3, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((72 : Rat) / 5) [(0, 2), (3, 1), (9, 1), (14, 1), (16, 1)],
  term ((-144 : Rat) / 5) [(1, 1), (3, 1), (9, 2), (14, 1), (16, 1)],
  term ((72 : Rat) / 5) [(1, 2), (3, 1), (9, 1), (14, 1), (16, 1)],
  term ((144 : Rat) / 5) [(3, 1), (6, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((-72 : Rat) / 5) [(3, 1), (6, 2), (9, 1), (14, 1), (16, 1)],
  term ((144 : Rat) / 5) [(3, 1), (7, 1), (9, 2), (14, 1), (16, 1)],
  term ((-72 : Rat) / 5) [(3, 1), (7, 2), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 20. -/
theorem rs_R006_ueqv_R006_partial_20_0051_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_20_0051
        rs_R006_ueqv_R006_generator_20_0000_0076 =
      rs_R006_ueqv_R006_partial_20_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 20. -/
def rs_R006_ueqv_R006_coefficient_20_0052 : Poly :=
[
  term ((144 : Rat) / 5) [(3, 1), (9, 1), (16, 1)]
]

/-- Partial product 52 for generator 20. -/
def rs_R006_ueqv_R006_partial_20_0052 : Poly :=
[
  term ((-288 : Rat) / 5) [(0, 1), (3, 1), (8, 1), (9, 1), (16, 1)],
  term ((144 : Rat) / 5) [(0, 2), (3, 1), (9, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(1, 1), (3, 1), (9, 2), (16, 1)],
  term ((144 : Rat) / 5) [(1, 2), (3, 1), (9, 1), (16, 1)],
  term ((288 : Rat) / 5) [(3, 1), (6, 1), (8, 1), (9, 1), (16, 1)],
  term ((-144 : Rat) / 5) [(3, 1), (6, 2), (9, 1), (16, 1)],
  term ((288 : Rat) / 5) [(3, 1), (7, 1), (9, 2), (16, 1)],
  term ((-144 : Rat) / 5) [(3, 1), (7, 2), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 20. -/
theorem rs_R006_ueqv_R006_partial_20_0052_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_20_0052
        rs_R006_ueqv_R006_generator_20_0000_0076 =
      rs_R006_ueqv_R006_partial_20_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 20. -/
def rs_R006_ueqv_R006_coefficient_20_0053 : Poly :=
[
  term ((216 : Rat) / 5) [(3, 1), (11, 1)]
]

/-- Partial product 53 for generator 20. -/
def rs_R006_ueqv_R006_partial_20_0053 : Poly :=
[
  term ((-432 : Rat) / 5) [(0, 1), (3, 1), (8, 1), (11, 1)],
  term ((216 : Rat) / 5) [(0, 2), (3, 1), (11, 1)],
  term ((-432 : Rat) / 5) [(1, 1), (3, 1), (9, 1), (11, 1)],
  term ((216 : Rat) / 5) [(1, 2), (3, 1), (11, 1)],
  term ((432 : Rat) / 5) [(3, 1), (6, 1), (8, 1), (11, 1)],
  term ((-216 : Rat) / 5) [(3, 1), (6, 2), (11, 1)],
  term ((432 : Rat) / 5) [(3, 1), (7, 1), (9, 1), (11, 1)],
  term ((-216 : Rat) / 5) [(3, 1), (7, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 20. -/
theorem rs_R006_ueqv_R006_partial_20_0053_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_20_0053
        rs_R006_ueqv_R006_generator_20_0000_0076 =
      rs_R006_ueqv_R006_partial_20_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 20. -/
def rs_R006_ueqv_R006_coefficient_20_0054 : Poly :=
[
  term ((108 : Rat) / 5) [(3, 1), (11, 1), (14, 1)]
]

/-- Partial product 54 for generator 20. -/
def rs_R006_ueqv_R006_partial_20_0054 : Poly :=
[
  term ((-216 : Rat) / 5) [(0, 1), (3, 1), (8, 1), (11, 1), (14, 1)],
  term ((108 : Rat) / 5) [(0, 2), (3, 1), (11, 1), (14, 1)],
  term ((-216 : Rat) / 5) [(1, 1), (3, 1), (9, 1), (11, 1), (14, 1)],
  term ((108 : Rat) / 5) [(1, 2), (3, 1), (11, 1), (14, 1)],
  term ((216 : Rat) / 5) [(3, 1), (6, 1), (8, 1), (11, 1), (14, 1)],
  term ((-108 : Rat) / 5) [(3, 1), (6, 2), (11, 1), (14, 1)],
  term ((216 : Rat) / 5) [(3, 1), (7, 1), (9, 1), (11, 1), (14, 1)],
  term ((-108 : Rat) / 5) [(3, 1), (7, 2), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 20. -/
theorem rs_R006_ueqv_R006_partial_20_0054_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_20_0054
        rs_R006_ueqv_R006_generator_20_0000_0076 =
      rs_R006_ueqv_R006_partial_20_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 20. -/
def rs_R006_ueqv_R006_coefficient_20_0055 : Poly :=
[
  term ((-36 : Rat) / 5) [(3, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 55 for generator 20. -/
def rs_R006_ueqv_R006_partial_20_0055 : Poly :=
[
  term ((72 : Rat) / 5) [(0, 1), (3, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-36 : Rat) / 5) [(0, 2), (3, 1), (11, 1), (14, 1), (16, 1)],
  term ((72 : Rat) / 5) [(1, 1), (3, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-36 : Rat) / 5) [(1, 2), (3, 1), (11, 1), (14, 1), (16, 1)],
  term ((-72 : Rat) / 5) [(3, 1), (6, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((36 : Rat) / 5) [(3, 1), (6, 2), (11, 1), (14, 1), (16, 1)],
  term ((-72 : Rat) / 5) [(3, 1), (7, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((36 : Rat) / 5) [(3, 1), (7, 2), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 20. -/
theorem rs_R006_ueqv_R006_partial_20_0055_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_20_0055
        rs_R006_ueqv_R006_generator_20_0000_0076 =
      rs_R006_ueqv_R006_partial_20_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 20. -/
def rs_R006_ueqv_R006_coefficient_20_0056 : Poly :=
[
  term ((-72 : Rat) / 5) [(3, 1), (11, 1), (16, 1)]
]

/-- Partial product 56 for generator 20. -/
def rs_R006_ueqv_R006_partial_20_0056 : Poly :=
[
  term ((144 : Rat) / 5) [(0, 1), (3, 1), (8, 1), (11, 1), (16, 1)],
  term ((-72 : Rat) / 5) [(0, 2), (3, 1), (11, 1), (16, 1)],
  term ((144 : Rat) / 5) [(1, 1), (3, 1), (9, 1), (11, 1), (16, 1)],
  term ((-72 : Rat) / 5) [(1, 2), (3, 1), (11, 1), (16, 1)],
  term ((-144 : Rat) / 5) [(3, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((72 : Rat) / 5) [(3, 1), (6, 2), (11, 1), (16, 1)],
  term ((-144 : Rat) / 5) [(3, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((72 : Rat) / 5) [(3, 1), (7, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 20. -/
theorem rs_R006_ueqv_R006_partial_20_0056_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_20_0056
        rs_R006_ueqv_R006_generator_20_0000_0076 =
      rs_R006_ueqv_R006_partial_20_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 20. -/
def rs_R006_ueqv_R006_coefficient_20_0057 : Poly :=
[
  term ((144 : Rat) / 35) [(4, 1), (7, 1), (13, 1)]
]

/-- Partial product 57 for generator 20. -/
def rs_R006_ueqv_R006_partial_20_0057 : Poly :=
[
  term ((-288 : Rat) / 35) [(0, 1), (4, 1), (7, 1), (8, 1), (13, 1)],
  term ((144 : Rat) / 35) [(0, 2), (4, 1), (7, 1), (13, 1)],
  term ((-288 : Rat) / 35) [(1, 1), (4, 1), (7, 1), (9, 1), (13, 1)],
  term ((144 : Rat) / 35) [(1, 2), (4, 1), (7, 1), (13, 1)],
  term ((288 : Rat) / 35) [(4, 1), (6, 1), (7, 1), (8, 1), (13, 1)],
  term ((-144 : Rat) / 35) [(4, 1), (6, 2), (7, 1), (13, 1)],
  term ((288 : Rat) / 35) [(4, 1), (7, 2), (9, 1), (13, 1)],
  term ((-144 : Rat) / 35) [(4, 1), (7, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 20. -/
theorem rs_R006_ueqv_R006_partial_20_0057_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_20_0057
        rs_R006_ueqv_R006_generator_20_0000_0076 =
      rs_R006_ueqv_R006_partial_20_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 20. -/
def rs_R006_ueqv_R006_coefficient_20_0058 : Poly :=
[
  term ((4908 : Rat) / 35) [(7, 1), (13, 1)]
]

/-- Partial product 58 for generator 20. -/
def rs_R006_ueqv_R006_partial_20_0058 : Poly :=
[
  term ((-9816 : Rat) / 35) [(0, 1), (7, 1), (8, 1), (13, 1)],
  term ((4908 : Rat) / 35) [(0, 2), (7, 1), (13, 1)],
  term ((-9816 : Rat) / 35) [(1, 1), (7, 1), (9, 1), (13, 1)],
  term ((4908 : Rat) / 35) [(1, 2), (7, 1), (13, 1)],
  term ((9816 : Rat) / 35) [(6, 1), (7, 1), (8, 1), (13, 1)],
  term ((-4908 : Rat) / 35) [(6, 2), (7, 1), (13, 1)],
  term ((9816 : Rat) / 35) [(7, 2), (9, 1), (13, 1)],
  term ((-4908 : Rat) / 35) [(7, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 20. -/
theorem rs_R006_ueqv_R006_partial_20_0058_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_20_0058
        rs_R006_ueqv_R006_generator_20_0000_0076 =
      rs_R006_ueqv_R006_partial_20_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 20. -/
def rs_R006_ueqv_R006_coefficient_20_0059 : Poly :=
[
  term (-288 : Rat) [(7, 1), (13, 1), (14, 1)]
]

/-- Partial product 59 for generator 20. -/
def rs_R006_ueqv_R006_partial_20_0059 : Poly :=
[
  term (576 : Rat) [(0, 1), (7, 1), (8, 1), (13, 1), (14, 1)],
  term (-288 : Rat) [(0, 2), (7, 1), (13, 1), (14, 1)],
  term (576 : Rat) [(1, 1), (7, 1), (9, 1), (13, 1), (14, 1)],
  term (-288 : Rat) [(1, 2), (7, 1), (13, 1), (14, 1)],
  term (-576 : Rat) [(6, 1), (7, 1), (8, 1), (13, 1), (14, 1)],
  term (288 : Rat) [(6, 2), (7, 1), (13, 1), (14, 1)],
  term (-576 : Rat) [(7, 2), (9, 1), (13, 1), (14, 1)],
  term (288 : Rat) [(7, 3), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 20. -/
theorem rs_R006_ueqv_R006_partial_20_0059_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_20_0059
        rs_R006_ueqv_R006_generator_20_0000_0076 =
      rs_R006_ueqv_R006_partial_20_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 20. -/
def rs_R006_ueqv_R006_coefficient_20_0060 : Poly :=
[
  term (96 : Rat) [(7, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 60 for generator 20. -/
def rs_R006_ueqv_R006_partial_20_0060 : Poly :=
[
  term (-192 : Rat) [(0, 1), (7, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term (96 : Rat) [(0, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term (-192 : Rat) [(1, 1), (7, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term (96 : Rat) [(1, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term (192 : Rat) [(6, 1), (7, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term (-96 : Rat) [(6, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term (192 : Rat) [(7, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term (-96 : Rat) [(7, 3), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 20. -/
theorem rs_R006_ueqv_R006_partial_20_0060_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_20_0060
        rs_R006_ueqv_R006_generator_20_0000_0076 =
      rs_R006_ueqv_R006_partial_20_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 20. -/
def rs_R006_ueqv_R006_coefficient_20_0061 : Poly :=
[
  term (-48 : Rat) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 61 for generator 20. -/
def rs_R006_ueqv_R006_partial_20_0061 : Poly :=
[
  term (96 : Rat) [(0, 1), (7, 1), (8, 1), (13, 1), (16, 1)],
  term (-48 : Rat) [(0, 2), (7, 1), (13, 1), (16, 1)],
  term (96 : Rat) [(1, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term (-48 : Rat) [(1, 2), (7, 1), (13, 1), (16, 1)],
  term (-96 : Rat) [(6, 1), (7, 1), (8, 1), (13, 1), (16, 1)],
  term (48 : Rat) [(6, 2), (7, 1), (13, 1), (16, 1)],
  term (-96 : Rat) [(7, 2), (9, 1), (13, 1), (16, 1)],
  term (48 : Rat) [(7, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 20. -/
theorem rs_R006_ueqv_R006_partial_20_0061_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_20_0061
        rs_R006_ueqv_R006_generator_20_0000_0076 =
      rs_R006_ueqv_R006_partial_20_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 20. -/
def rs_R006_ueqv_R006_coefficient_20_0062 : Poly :=
[
  term (288 : Rat) [(7, 1), (15, 1)]
]

/-- Partial product 62 for generator 20. -/
def rs_R006_ueqv_R006_partial_20_0062 : Poly :=
[
  term (-576 : Rat) [(0, 1), (7, 1), (8, 1), (15, 1)],
  term (288 : Rat) [(0, 2), (7, 1), (15, 1)],
  term (-576 : Rat) [(1, 1), (7, 1), (9, 1), (15, 1)],
  term (288 : Rat) [(1, 2), (7, 1), (15, 1)],
  term (576 : Rat) [(6, 1), (7, 1), (8, 1), (15, 1)],
  term (-288 : Rat) [(6, 2), (7, 1), (15, 1)],
  term (576 : Rat) [(7, 2), (9, 1), (15, 1)],
  term (-288 : Rat) [(7, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 20. -/
theorem rs_R006_ueqv_R006_partial_20_0062_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_20_0062
        rs_R006_ueqv_R006_generator_20_0000_0076 =
      rs_R006_ueqv_R006_partial_20_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 20. -/
def rs_R006_ueqv_R006_coefficient_20_0063 : Poly :=
[
  term (-96 : Rat) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 63 for generator 20. -/
def rs_R006_ueqv_R006_partial_20_0063 : Poly :=
[
  term (192 : Rat) [(0, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term (-96 : Rat) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term (192 : Rat) [(1, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term (-96 : Rat) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term (-192 : Rat) [(6, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term (96 : Rat) [(6, 2), (7, 1), (15, 1), (16, 1)],
  term (-192 : Rat) [(7, 2), (9, 1), (15, 1), (16, 1)],
  term (96 : Rat) [(7, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 20. -/
theorem rs_R006_ueqv_R006_partial_20_0063_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_20_0063
        rs_R006_ueqv_R006_generator_20_0000_0076 =
      rs_R006_ueqv_R006_partial_20_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 20. -/
def rs_R006_ueqv_R006_coefficient_20_0064 : Poly :=
[
  term ((-288 : Rat) / 7) [(9, 1), (13, 1)]
]

/-- Partial product 64 for generator 20. -/
def rs_R006_ueqv_R006_partial_20_0064 : Poly :=
[
  term ((576 : Rat) / 7) [(0, 1), (8, 1), (9, 1), (13, 1)],
  term ((-288 : Rat) / 7) [(0, 2), (9, 1), (13, 1)],
  term ((576 : Rat) / 7) [(1, 1), (9, 2), (13, 1)],
  term ((-288 : Rat) / 7) [(1, 2), (9, 1), (13, 1)],
  term ((-576 : Rat) / 7) [(6, 1), (8, 1), (9, 1), (13, 1)],
  term ((288 : Rat) / 7) [(6, 2), (9, 1), (13, 1)],
  term ((-576 : Rat) / 7) [(7, 1), (9, 2), (13, 1)],
  term ((288 : Rat) / 7) [(7, 2), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 20. -/
theorem rs_R006_ueqv_R006_partial_20_0064_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_20_0064
        rs_R006_ueqv_R006_generator_20_0000_0076 =
      rs_R006_ueqv_R006_partial_20_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 20. -/
def rs_R006_ueqv_R006_coefficient_20_0065 : Poly :=
[
  term ((432 : Rat) / 5) [(9, 1), (13, 1), (14, 1)]
]

/-- Partial product 65 for generator 20. -/
def rs_R006_ueqv_R006_partial_20_0065 : Poly :=
[
  term ((-864 : Rat) / 5) [(0, 1), (8, 1), (9, 1), (13, 1), (14, 1)],
  term ((432 : Rat) / 5) [(0, 2), (9, 1), (13, 1), (14, 1)],
  term ((-864 : Rat) / 5) [(1, 1), (9, 2), (13, 1), (14, 1)],
  term ((432 : Rat) / 5) [(1, 2), (9, 1), (13, 1), (14, 1)],
  term ((864 : Rat) / 5) [(6, 1), (8, 1), (9, 1), (13, 1), (14, 1)],
  term ((-432 : Rat) / 5) [(6, 2), (9, 1), (13, 1), (14, 1)],
  term ((864 : Rat) / 5) [(7, 1), (9, 2), (13, 1), (14, 1)],
  term ((-432 : Rat) / 5) [(7, 2), (9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 20. -/
theorem rs_R006_ueqv_R006_partial_20_0065_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_20_0065
        rs_R006_ueqv_R006_generator_20_0000_0076 =
      rs_R006_ueqv_R006_partial_20_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 20. -/
def rs_R006_ueqv_R006_coefficient_20_0066 : Poly :=
[
  term ((-144 : Rat) / 5) [(9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 66 for generator 20. -/
def rs_R006_ueqv_R006_partial_20_0066 : Poly :=
[
  term ((288 : Rat) / 5) [(0, 1), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-144 : Rat) / 5) [(0, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((288 : Rat) / 5) [(1, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((-144 : Rat) / 5) [(1, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(6, 1), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((144 : Rat) / 5) [(6, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(7, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((144 : Rat) / 5) [(7, 2), (9, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 20. -/
theorem rs_R006_ueqv_R006_partial_20_0066_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_20_0066
        rs_R006_ueqv_R006_generator_20_0000_0076 =
      rs_R006_ueqv_R006_partial_20_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 20. -/
def rs_R006_ueqv_R006_coefficient_20_0067 : Poly :=
[
  term ((72 : Rat) / 5) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 67 for generator 20. -/
def rs_R006_ueqv_R006_partial_20_0067 : Poly :=
[
  term ((-144 : Rat) / 5) [(0, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((72 : Rat) / 5) [(0, 2), (9, 1), (13, 1), (16, 1)],
  term ((-144 : Rat) / 5) [(1, 1), (9, 2), (13, 1), (16, 1)],
  term ((72 : Rat) / 5) [(1, 2), (9, 1), (13, 1), (16, 1)],
  term ((144 : Rat) / 5) [(6, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-72 : Rat) / 5) [(6, 2), (9, 1), (13, 1), (16, 1)],
  term ((144 : Rat) / 5) [(7, 1), (9, 2), (13, 1), (16, 1)],
  term ((-72 : Rat) / 5) [(7, 2), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 20. -/
theorem rs_R006_ueqv_R006_partial_20_0067_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_20_0067
        rs_R006_ueqv_R006_generator_20_0000_0076 =
      rs_R006_ueqv_R006_partial_20_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 20. -/
def rs_R006_ueqv_R006_coefficient_20_0068 : Poly :=
[
  term ((-432 : Rat) / 5) [(9, 1), (15, 1)]
]

/-- Partial product 68 for generator 20. -/
def rs_R006_ueqv_R006_partial_20_0068 : Poly :=
[
  term ((864 : Rat) / 5) [(0, 1), (8, 1), (9, 1), (15, 1)],
  term ((-432 : Rat) / 5) [(0, 2), (9, 1), (15, 1)],
  term ((864 : Rat) / 5) [(1, 1), (9, 2), (15, 1)],
  term ((-432 : Rat) / 5) [(1, 2), (9, 1), (15, 1)],
  term ((-864 : Rat) / 5) [(6, 1), (8, 1), (9, 1), (15, 1)],
  term ((432 : Rat) / 5) [(6, 2), (9, 1), (15, 1)],
  term ((-864 : Rat) / 5) [(7, 1), (9, 2), (15, 1)],
  term ((432 : Rat) / 5) [(7, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 20. -/
theorem rs_R006_ueqv_R006_partial_20_0068_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_20_0068
        rs_R006_ueqv_R006_generator_20_0000_0076 =
      rs_R006_ueqv_R006_partial_20_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 20. -/
def rs_R006_ueqv_R006_coefficient_20_0069 : Poly :=
[
  term ((144 : Rat) / 5) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 69 for generator 20. -/
def rs_R006_ueqv_R006_partial_20_0069 : Poly :=
[
  term ((-288 : Rat) / 5) [(0, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((144 : Rat) / 5) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(1, 1), (9, 2), (15, 1), (16, 1)],
  term ((144 : Rat) / 5) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((288 : Rat) / 5) [(6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-144 : Rat) / 5) [(6, 2), (9, 1), (15, 1), (16, 1)],
  term ((288 : Rat) / 5) [(7, 1), (9, 2), (15, 1), (16, 1)],
  term ((-144 : Rat) / 5) [(7, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 20. -/
theorem rs_R006_ueqv_R006_partial_20_0069_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_20_0069
        rs_R006_ueqv_R006_generator_20_0000_0076 =
      rs_R006_ueqv_R006_partial_20_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 20. -/
def rs_R006_ueqv_R006_coefficient_20_0070 : Poly :=
[
  term ((864 : Rat) / 35) [(11, 1), (13, 1)]
]

/-- Partial product 70 for generator 20. -/
def rs_R006_ueqv_R006_partial_20_0070 : Poly :=
[
  term ((-1728 : Rat) / 35) [(0, 1), (8, 1), (11, 1), (13, 1)],
  term ((864 : Rat) / 35) [(0, 2), (11, 1), (13, 1)],
  term ((-1728 : Rat) / 35) [(1, 1), (9, 1), (11, 1), (13, 1)],
  term ((864 : Rat) / 35) [(1, 2), (11, 1), (13, 1)],
  term ((1728 : Rat) / 35) [(6, 1), (8, 1), (11, 1), (13, 1)],
  term ((-864 : Rat) / 35) [(6, 2), (11, 1), (13, 1)],
  term ((1728 : Rat) / 35) [(7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-864 : Rat) / 35) [(7, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 20. -/
theorem rs_R006_ueqv_R006_partial_20_0070_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_20_0070
        rs_R006_ueqv_R006_generator_20_0000_0076 =
      rs_R006_ueqv_R006_partial_20_0070 := by
  native_decide

/-- Coefficient term 71 from coefficient polynomial 20. -/
def rs_R006_ueqv_R006_coefficient_20_0071 : Poly :=
[
  term ((-216 : Rat) / 5) [(11, 1), (13, 1), (14, 1)]
]

/-- Partial product 71 for generator 20. -/
def rs_R006_ueqv_R006_partial_20_0071 : Poly :=
[
  term ((432 : Rat) / 5) [(0, 1), (8, 1), (11, 1), (13, 1), (14, 1)],
  term ((-216 : Rat) / 5) [(0, 2), (11, 1), (13, 1), (14, 1)],
  term ((432 : Rat) / 5) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((-216 : Rat) / 5) [(1, 2), (11, 1), (13, 1), (14, 1)],
  term ((-432 : Rat) / 5) [(6, 1), (8, 1), (11, 1), (13, 1), (14, 1)],
  term ((216 : Rat) / 5) [(6, 2), (11, 1), (13, 1), (14, 1)],
  term ((-432 : Rat) / 5) [(7, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((216 : Rat) / 5) [(7, 2), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 71 for generator 20. -/
theorem rs_R006_ueqv_R006_partial_20_0071_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_20_0071
        rs_R006_ueqv_R006_generator_20_0000_0076 =
      rs_R006_ueqv_R006_partial_20_0071 := by
  native_decide

/-- Coefficient term 72 from coefficient polynomial 20. -/
def rs_R006_ueqv_R006_coefficient_20_0072 : Poly :=
[
  term ((72 : Rat) / 5) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 72 for generator 20. -/
def rs_R006_ueqv_R006_partial_20_0072 : Poly :=
[
  term ((-144 : Rat) / 5) [(0, 1), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((72 : Rat) / 5) [(0, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-144 : Rat) / 5) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((72 : Rat) / 5) [(1, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((144 : Rat) / 5) [(6, 1), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-72 : Rat) / 5) [(6, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((144 : Rat) / 5) [(7, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-72 : Rat) / 5) [(7, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 72 for generator 20. -/
theorem rs_R006_ueqv_R006_partial_20_0072_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_20_0072
        rs_R006_ueqv_R006_generator_20_0000_0076 =
      rs_R006_ueqv_R006_partial_20_0072 := by
  native_decide

/-- Coefficient term 73 from coefficient polynomial 20. -/
def rs_R006_ueqv_R006_coefficient_20_0073 : Poly :=
[
  term ((-36 : Rat) / 5) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 73 for generator 20. -/
def rs_R006_ueqv_R006_partial_20_0073 : Poly :=
[
  term ((72 : Rat) / 5) [(0, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-36 : Rat) / 5) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term ((72 : Rat) / 5) [(1, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-36 : Rat) / 5) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term ((-72 : Rat) / 5) [(6, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((36 : Rat) / 5) [(6, 2), (11, 1), (13, 1), (16, 1)],
  term ((-72 : Rat) / 5) [(7, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((36 : Rat) / 5) [(7, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 73 for generator 20. -/
theorem rs_R006_ueqv_R006_partial_20_0073_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_20_0073
        rs_R006_ueqv_R006_generator_20_0000_0076 =
      rs_R006_ueqv_R006_partial_20_0073 := by
  native_decide

/-- Coefficient term 74 from coefficient polynomial 20. -/
def rs_R006_ueqv_R006_coefficient_20_0074 : Poly :=
[
  term ((216 : Rat) / 5) [(11, 1), (15, 1)]
]

/-- Partial product 74 for generator 20. -/
def rs_R006_ueqv_R006_partial_20_0074 : Poly :=
[
  term ((-432 : Rat) / 5) [(0, 1), (8, 1), (11, 1), (15, 1)],
  term ((216 : Rat) / 5) [(0, 2), (11, 1), (15, 1)],
  term ((-432 : Rat) / 5) [(1, 1), (9, 1), (11, 1), (15, 1)],
  term ((216 : Rat) / 5) [(1, 2), (11, 1), (15, 1)],
  term ((432 : Rat) / 5) [(6, 1), (8, 1), (11, 1), (15, 1)],
  term ((-216 : Rat) / 5) [(6, 2), (11, 1), (15, 1)],
  term ((432 : Rat) / 5) [(7, 1), (9, 1), (11, 1), (15, 1)],
  term ((-216 : Rat) / 5) [(7, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 74 for generator 20. -/
theorem rs_R006_ueqv_R006_partial_20_0074_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_20_0074
        rs_R006_ueqv_R006_generator_20_0000_0076 =
      rs_R006_ueqv_R006_partial_20_0074 := by
  native_decide

/-- Coefficient term 75 from coefficient polynomial 20. -/
def rs_R006_ueqv_R006_coefficient_20_0075 : Poly :=
[
  term ((-72 : Rat) / 5) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 75 for generator 20. -/
def rs_R006_ueqv_R006_partial_20_0075 : Poly :=
[
  term ((144 : Rat) / 5) [(0, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-72 : Rat) / 5) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((144 : Rat) / 5) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-72 : Rat) / 5) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-144 : Rat) / 5) [(6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((72 : Rat) / 5) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-144 : Rat) / 5) [(7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((72 : Rat) / 5) [(7, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 75 for generator 20. -/
theorem rs_R006_ueqv_R006_partial_20_0075_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_20_0075
        rs_R006_ueqv_R006_generator_20_0000_0076 =
      rs_R006_ueqv_R006_partial_20_0075 := by
  native_decide

/-- Coefficient term 76 from coefficient polynomial 20. -/
def rs_R006_ueqv_R006_coefficient_20_0076 : Poly :=
[
  term ((-54 : Rat) / 5) [(14, 1)]
]

/-- Partial product 76 for generator 20. -/
def rs_R006_ueqv_R006_partial_20_0076 : Poly :=
[
  term ((108 : Rat) / 5) [(0, 1), (8, 1), (14, 1)],
  term ((-54 : Rat) / 5) [(0, 2), (14, 1)],
  term ((108 : Rat) / 5) [(1, 1), (9, 1), (14, 1)],
  term ((-54 : Rat) / 5) [(1, 2), (14, 1)],
  term ((-108 : Rat) / 5) [(6, 1), (8, 1), (14, 1)],
  term ((54 : Rat) / 5) [(6, 2), (14, 1)],
  term ((-108 : Rat) / 5) [(7, 1), (9, 1), (14, 1)],
  term ((54 : Rat) / 5) [(7, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 76 for generator 20. -/
theorem rs_R006_ueqv_R006_partial_20_0076_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_20_0076
        rs_R006_ueqv_R006_generator_20_0000_0076 =
      rs_R006_ueqv_R006_partial_20_0076 := by
  native_decide

/-- Partial products in this block. -/
def rs_R006_ueqv_R006_partials_20_0000_0076 : List Poly :=
[
  rs_R006_ueqv_R006_partial_20_0000,
  rs_R006_ueqv_R006_partial_20_0001,
  rs_R006_ueqv_R006_partial_20_0002,
  rs_R006_ueqv_R006_partial_20_0003,
  rs_R006_ueqv_R006_partial_20_0004,
  rs_R006_ueqv_R006_partial_20_0005,
  rs_R006_ueqv_R006_partial_20_0006,
  rs_R006_ueqv_R006_partial_20_0007,
  rs_R006_ueqv_R006_partial_20_0008,
  rs_R006_ueqv_R006_partial_20_0009,
  rs_R006_ueqv_R006_partial_20_0010,
  rs_R006_ueqv_R006_partial_20_0011,
  rs_R006_ueqv_R006_partial_20_0012,
  rs_R006_ueqv_R006_partial_20_0013,
  rs_R006_ueqv_R006_partial_20_0014,
  rs_R006_ueqv_R006_partial_20_0015,
  rs_R006_ueqv_R006_partial_20_0016,
  rs_R006_ueqv_R006_partial_20_0017,
  rs_R006_ueqv_R006_partial_20_0018,
  rs_R006_ueqv_R006_partial_20_0019,
  rs_R006_ueqv_R006_partial_20_0020,
  rs_R006_ueqv_R006_partial_20_0021,
  rs_R006_ueqv_R006_partial_20_0022,
  rs_R006_ueqv_R006_partial_20_0023,
  rs_R006_ueqv_R006_partial_20_0024,
  rs_R006_ueqv_R006_partial_20_0025,
  rs_R006_ueqv_R006_partial_20_0026,
  rs_R006_ueqv_R006_partial_20_0027,
  rs_R006_ueqv_R006_partial_20_0028,
  rs_R006_ueqv_R006_partial_20_0029,
  rs_R006_ueqv_R006_partial_20_0030,
  rs_R006_ueqv_R006_partial_20_0031,
  rs_R006_ueqv_R006_partial_20_0032,
  rs_R006_ueqv_R006_partial_20_0033,
  rs_R006_ueqv_R006_partial_20_0034,
  rs_R006_ueqv_R006_partial_20_0035,
  rs_R006_ueqv_R006_partial_20_0036,
  rs_R006_ueqv_R006_partial_20_0037,
  rs_R006_ueqv_R006_partial_20_0038,
  rs_R006_ueqv_R006_partial_20_0039,
  rs_R006_ueqv_R006_partial_20_0040,
  rs_R006_ueqv_R006_partial_20_0041,
  rs_R006_ueqv_R006_partial_20_0042,
  rs_R006_ueqv_R006_partial_20_0043,
  rs_R006_ueqv_R006_partial_20_0044,
  rs_R006_ueqv_R006_partial_20_0045,
  rs_R006_ueqv_R006_partial_20_0046,
  rs_R006_ueqv_R006_partial_20_0047,
  rs_R006_ueqv_R006_partial_20_0048,
  rs_R006_ueqv_R006_partial_20_0049,
  rs_R006_ueqv_R006_partial_20_0050,
  rs_R006_ueqv_R006_partial_20_0051,
  rs_R006_ueqv_R006_partial_20_0052,
  rs_R006_ueqv_R006_partial_20_0053,
  rs_R006_ueqv_R006_partial_20_0054,
  rs_R006_ueqv_R006_partial_20_0055,
  rs_R006_ueqv_R006_partial_20_0056,
  rs_R006_ueqv_R006_partial_20_0057,
  rs_R006_ueqv_R006_partial_20_0058,
  rs_R006_ueqv_R006_partial_20_0059,
  rs_R006_ueqv_R006_partial_20_0060,
  rs_R006_ueqv_R006_partial_20_0061,
  rs_R006_ueqv_R006_partial_20_0062,
  rs_R006_ueqv_R006_partial_20_0063,
  rs_R006_ueqv_R006_partial_20_0064,
  rs_R006_ueqv_R006_partial_20_0065,
  rs_R006_ueqv_R006_partial_20_0066,
  rs_R006_ueqv_R006_partial_20_0067,
  rs_R006_ueqv_R006_partial_20_0068,
  rs_R006_ueqv_R006_partial_20_0069,
  rs_R006_ueqv_R006_partial_20_0070,
  rs_R006_ueqv_R006_partial_20_0071,
  rs_R006_ueqv_R006_partial_20_0072,
  rs_R006_ueqv_R006_partial_20_0073,
  rs_R006_ueqv_R006_partial_20_0074,
  rs_R006_ueqv_R006_partial_20_0075,
  rs_R006_ueqv_R006_partial_20_0076
]

/-- Sum of partial products in this block. -/
def rs_R006_ueqv_R006_block_20_0000_0076 : Poly :=
[
  term ((-288 : Rat) / 35) [(0, 1), (1, 1), (2, 1), (8, 1), (13, 1)],
  term (-1152 : Rat) [(0, 1), (1, 1), (2, 1), (8, 1), (15, 1)],
  term (384 : Rat) [(0, 1), (1, 1), (2, 1), (8, 1), (15, 1), (16, 1)],
  term ((6912 : Rat) / 5) [(0, 1), (1, 1), (2, 1), (9, 2), (15, 1)],
  term ((-2304 : Rat) / 5) [(0, 1), (1, 1), (2, 1), (9, 2), (15, 1), (16, 1)],
  term (576 : Rat) [(0, 1), (1, 1), (3, 1), (8, 1)],
  term (288 : Rat) [(0, 1), (1, 1), (3, 1), (8, 1), (14, 1)],
  term (-96 : Rat) [(0, 1), (1, 1), (3, 1), (8, 1), (14, 1), (16, 1)],
  term (-192 : Rat) [(0, 1), (1, 1), (3, 1), (8, 1), (16, 1)],
  term ((-3456 : Rat) / 5) [(0, 1), (1, 1), (3, 1), (9, 2)],
  term ((-1728 : Rat) / 5) [(0, 1), (1, 1), (3, 1), (9, 2), (14, 1)],
  term ((576 : Rat) / 5) [(0, 1), (1, 1), (3, 1), (9, 2), (14, 1), (16, 1)],
  term ((1152 : Rat) / 5) [(0, 1), (1, 1), (3, 1), (9, 2), (16, 1)],
  term ((288 : Rat) / 35) [(0, 1), (1, 1), (4, 1), (8, 1), (13, 1)],
  term ((-576 : Rat) / 35) [(0, 1), (1, 1), (5, 1), (9, 1), (13, 1)],
  term (384 : Rat) [(0, 1), (1, 1), (6, 1), (8, 1), (15, 1)],
  term (-96 : Rat) [(0, 1), (1, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term (-192 : Rat) [(0, 1), (1, 1), (6, 2), (15, 1)],
  term (48 : Rat) [(0, 1), (1, 1), (6, 2), (15, 1), (16, 1)],
  term (768 : Rat) [(0, 1), (1, 1), (7, 1), (9, 1), (15, 1)],
  term (-192 : Rat) [(0, 1), (1, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term (-192 : Rat) [(0, 1), (1, 1), (7, 2), (15, 1)],
  term (48 : Rat) [(0, 1), (1, 1), (7, 2), (15, 1), (16, 1)],
  term ((1992 : Rat) / 7) [(0, 1), (1, 1), (8, 1), (13, 1)],
  term (-576 : Rat) [(0, 1), (1, 1), (8, 1), (13, 1), (14, 1)],
  term (192 : Rat) [(0, 1), (1, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term (-96 : Rat) [(0, 1), (1, 1), (8, 1), (13, 1), (16, 1)],
  term (576 : Rat) [(0, 1), (1, 1), (8, 1), (15, 1)],
  term (-192 : Rat) [(0, 1), (1, 1), (8, 1), (15, 1), (16, 1)],
  term ((276 : Rat) / 5) [(0, 1), (1, 1), (9, 1)],
  term ((288 : Rat) / 5) [(0, 1), (1, 1), (9, 1), (11, 1), (15, 1)],
  term ((-72 : Rat) / 5) [(0, 1), (1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-216 : Rat) / 5) [(0, 1), (1, 1), (9, 1), (14, 1)],
  term ((-2304 : Rat) / 7) [(0, 1), (1, 1), (9, 2), (13, 1)],
  term ((3456 : Rat) / 5) [(0, 1), (1, 1), (9, 2), (13, 1), (14, 1)],
  term ((-1152 : Rat) / 5) [(0, 1), (1, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((576 : Rat) / 5) [(0, 1), (1, 1), (9, 2), (13, 1), (16, 1)],
  term ((-4032 : Rat) / 5) [(0, 1), (1, 1), (9, 2), (15, 1)],
  term ((1296 : Rat) / 5) [(0, 1), (1, 1), (9, 2), (15, 1), (16, 1)],
  term ((-138 : Rat) / 5) [(0, 1), (1, 2)],
  term ((-3456 : Rat) / 5) [(0, 1), (1, 2), (2, 1), (9, 1), (15, 1)],
  term ((1152 : Rat) / 5) [(0, 1), (1, 2), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((1728 : Rat) / 5) [(0, 1), (1, 2), (3, 1), (9, 1)],
  term ((864 : Rat) / 5) [(0, 1), (1, 2), (3, 1), (9, 1), (14, 1)],
  term ((-288 : Rat) / 5) [(0, 1), (1, 2), (3, 1), (9, 1), (14, 1), (16, 1)],
  term ((-576 : Rat) / 5) [(0, 1), (1, 2), (3, 1), (9, 1), (16, 1)],
  term ((288 : Rat) / 35) [(0, 1), (1, 2), (5, 1), (13, 1)],
  term (-192 : Rat) [(0, 1), (1, 2), (7, 1), (15, 1)],
  term (48 : Rat) [(0, 1), (1, 2), (7, 1), (15, 1), (16, 1)],
  term ((1152 : Rat) / 7) [(0, 1), (1, 2), (9, 1), (13, 1)],
  term ((-1728 : Rat) / 5) [(0, 1), (1, 2), (9, 1), (13, 1), (14, 1)],
  term ((576 : Rat) / 5) [(0, 1), (1, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(0, 1), (1, 2), (9, 1), (13, 1), (16, 1)],
  term ((96 : Rat) / 5) [(0, 1), (1, 2), (9, 1), (15, 1)],
  term ((-168 : Rat) / 5) [(0, 1), (1, 2), (9, 1), (15, 1), (16, 1)],
  term ((-144 : Rat) / 5) [(0, 1), (1, 2), (11, 1), (15, 1)],
  term ((36 : Rat) / 5) [(0, 1), (1, 2), (11, 1), (15, 1), (16, 1)],
  term ((108 : Rat) / 5) [(0, 1), (1, 2), (14, 1)],
  term (192 : Rat) [(0, 1), (1, 3), (15, 1)],
  term (-48 : Rat) [(0, 1), (1, 3), (15, 1), (16, 1)],
  term ((-6912 : Rat) / 5) [(0, 1), (2, 1), (6, 1), (8, 1), (9, 1), (15, 1)],
  term ((2304 : Rat) / 5) [(0, 1), (2, 1), (6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((3456 : Rat) / 5) [(0, 1), (2, 1), (6, 2), (9, 1), (15, 1)],
  term ((-1152 : Rat) / 5) [(0, 1), (2, 1), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((288 : Rat) / 35) [(0, 1), (2, 1), (7, 1), (8, 1), (13, 1)],
  term (1152 : Rat) [(0, 1), (2, 1), (7, 1), (8, 1), (15, 1)],
  term (-384 : Rat) [(0, 1), (2, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-6912 : Rat) / 5) [(0, 1), (2, 1), (7, 1), (9, 2), (15, 1)],
  term ((2304 : Rat) / 5) [(0, 1), (2, 1), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((3456 : Rat) / 5) [(0, 1), (2, 1), (7, 2), (9, 1), (15, 1)],
  term ((-1152 : Rat) / 5) [(0, 1), (2, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-1728 : Rat) / 5) [(0, 1), (2, 1), (8, 1), (9, 1), (15, 1)],
  term ((576 : Rat) / 5) [(0, 1), (2, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((864 : Rat) / 5) [(0, 1), (2, 1), (8, 1), (11, 1), (15, 1)],
  term ((-288 : Rat) / 5) [(0, 1), (2, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((3456 : Rat) / 5) [(0, 1), (3, 1), (6, 1), (8, 1), (9, 1)],
  term ((1728 : Rat) / 5) [(0, 1), (3, 1), (6, 1), (8, 1), (9, 1), (14, 1)],
  term ((-576 : Rat) / 5) [(0, 1), (3, 1), (6, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((-1152 : Rat) / 5) [(0, 1), (3, 1), (6, 1), (8, 1), (9, 1), (16, 1)],
  term ((-1728 : Rat) / 5) [(0, 1), (3, 1), (6, 2), (9, 1)],
  term ((-864 : Rat) / 5) [(0, 1), (3, 1), (6, 2), (9, 1), (14, 1)],
  term ((288 : Rat) / 5) [(0, 1), (3, 1), (6, 2), (9, 1), (14, 1), (16, 1)],
  term ((576 : Rat) / 5) [(0, 1), (3, 1), (6, 2), (9, 1), (16, 1)],
  term (-576 : Rat) [(0, 1), (3, 1), (7, 1), (8, 1)],
  term (-288 : Rat) [(0, 1), (3, 1), (7, 1), (8, 1), (14, 1)],
  term (96 : Rat) [(0, 1), (3, 1), (7, 1), (8, 1), (14, 1), (16, 1)],
  term (192 : Rat) [(0, 1), (3, 1), (7, 1), (8, 1), (16, 1)],
  term ((3456 : Rat) / 5) [(0, 1), (3, 1), (7, 1), (9, 2)],
  term ((1728 : Rat) / 5) [(0, 1), (3, 1), (7, 1), (9, 2), (14, 1)],
  term ((-576 : Rat) / 5) [(0, 1), (3, 1), (7, 1), (9, 2), (14, 1), (16, 1)],
  term ((-1152 : Rat) / 5) [(0, 1), (3, 1), (7, 1), (9, 2), (16, 1)],
  term ((-1728 : Rat) / 5) [(0, 1), (3, 1), (7, 2), (9, 1)],
  term ((-864 : Rat) / 5) [(0, 1), (3, 1), (7, 2), (9, 1), (14, 1)],
  term ((288 : Rat) / 5) [(0, 1), (3, 1), (7, 2), (9, 1), (14, 1), (16, 1)],
  term ((576 : Rat) / 5) [(0, 1), (3, 1), (7, 2), (9, 1), (16, 1)],
  term ((864 : Rat) / 5) [(0, 1), (3, 1), (8, 1), (9, 1)],
  term ((432 : Rat) / 5) [(0, 1), (3, 1), (8, 1), (9, 1), (14, 1)],
  term ((-144 : Rat) / 5) [(0, 1), (3, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(0, 1), (3, 1), (8, 1), (9, 1), (16, 1)],
  term ((-432 : Rat) / 5) [(0, 1), (3, 1), (8, 1), (11, 1)],
  term ((-216 : Rat) / 5) [(0, 1), (3, 1), (8, 1), (11, 1), (14, 1)],
  term ((72 : Rat) / 5) [(0, 1), (3, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((144 : Rat) / 5) [(0, 1), (3, 1), (8, 1), (11, 1), (16, 1)],
  term ((-288 : Rat) / 35) [(0, 1), (4, 1), (7, 1), (8, 1), (13, 1)],
  term ((576 : Rat) / 35) [(0, 1), (5, 1), (6, 1), (8, 1), (13, 1)],
  term ((-288 : Rat) / 35) [(0, 1), (5, 1), (6, 2), (13, 1)],
  term ((576 : Rat) / 35) [(0, 1), (5, 1), (7, 1), (9, 1), (13, 1)],
  term ((-288 : Rat) / 35) [(0, 1), (5, 1), (7, 2), (13, 1)],
  term (-384 : Rat) [(0, 1), (6, 1), (7, 1), (8, 1), (15, 1)],
  term (96 : Rat) [(0, 1), (6, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-276 : Rat) / 5) [(0, 1), (6, 1), (8, 1)],
  term ((2304 : Rat) / 7) [(0, 1), (6, 1), (8, 1), (9, 1), (13, 1)],
  term ((-3456 : Rat) / 5) [(0, 1), (6, 1), (8, 1), (9, 1), (13, 1), (14, 1)],
  term ((1152 : Rat) / 5) [(0, 1), (6, 1), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-576 : Rat) / 5) [(0, 1), (6, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((4032 : Rat) / 5) [(0, 1), (6, 1), (8, 1), (9, 1), (15, 1)],
  term ((-1296 : Rat) / 5) [(0, 1), (6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(0, 1), (6, 1), (8, 1), (11, 1), (15, 1)],
  term ((72 : Rat) / 5) [(0, 1), (6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((216 : Rat) / 5) [(0, 1), (6, 1), (8, 1), (14, 1)],
  term ((138 : Rat) / 5) [(0, 1), (6, 2)],
  term (192 : Rat) [(0, 1), (6, 2), (7, 1), (15, 1)],
  term (-48 : Rat) [(0, 1), (6, 2), (7, 1), (15, 1), (16, 1)],
  term ((-1152 : Rat) / 7) [(0, 1), (6, 2), (9, 1), (13, 1)],
  term ((1728 : Rat) / 5) [(0, 1), (6, 2), (9, 1), (13, 1), (14, 1)],
  term ((-576 : Rat) / 5) [(0, 1), (6, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((288 : Rat) / 5) [(0, 1), (6, 2), (9, 1), (13, 1), (16, 1)],
  term ((-2016 : Rat) / 5) [(0, 1), (6, 2), (9, 1), (15, 1)],
  term ((648 : Rat) / 5) [(0, 1), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((144 : Rat) / 5) [(0, 1), (6, 2), (11, 1), (15, 1)],
  term ((-36 : Rat) / 5) [(0, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-108 : Rat) / 5) [(0, 1), (6, 2), (14, 1)],
  term ((-9816 : Rat) / 35) [(0, 1), (7, 1), (8, 1), (13, 1)],
  term (576 : Rat) [(0, 1), (7, 1), (8, 1), (13, 1), (14, 1)],
  term (-192 : Rat) [(0, 1), (7, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term (96 : Rat) [(0, 1), (7, 1), (8, 1), (13, 1), (16, 1)],
  term (-576 : Rat) [(0, 1), (7, 1), (8, 1), (15, 1)],
  term (192 : Rat) [(0, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-276 : Rat) / 5) [(0, 1), (7, 1), (9, 1)],
  term ((-288 : Rat) / 5) [(0, 1), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((72 : Rat) / 5) [(0, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((216 : Rat) / 5) [(0, 1), (7, 1), (9, 1), (14, 1)],
  term ((2304 : Rat) / 7) [(0, 1), (7, 1), (9, 2), (13, 1)],
  term ((-3456 : Rat) / 5) [(0, 1), (7, 1), (9, 2), (13, 1), (14, 1)],
  term ((1152 : Rat) / 5) [(0, 1), (7, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((-576 : Rat) / 5) [(0, 1), (7, 1), (9, 2), (13, 1), (16, 1)],
  term ((4032 : Rat) / 5) [(0, 1), (7, 1), (9, 2), (15, 1)],
  term ((-1296 : Rat) / 5) [(0, 1), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((138 : Rat) / 5) [(0, 1), (7, 2)],
  term ((-1152 : Rat) / 7) [(0, 1), (7, 2), (9, 1), (13, 1)],
  term ((1728 : Rat) / 5) [(0, 1), (7, 2), (9, 1), (13, 1), (14, 1)],
  term ((-576 : Rat) / 5) [(0, 1), (7, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((288 : Rat) / 5) [(0, 1), (7, 2), (9, 1), (13, 1), (16, 1)],
  term ((-3936 : Rat) / 5) [(0, 1), (7, 2), (9, 1), (15, 1)],
  term ((1128 : Rat) / 5) [(0, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((144 : Rat) / 5) [(0, 1), (7, 2), (11, 1), (15, 1)],
  term ((-36 : Rat) / 5) [(0, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-108 : Rat) / 5) [(0, 1), (7, 2), (14, 1)],
  term (192 : Rat) [(0, 1), (7, 3), (15, 1)],
  term (-48 : Rat) [(0, 1), (7, 3), (15, 1), (16, 1)],
  term ((-138 : Rat) / 5) [(0, 1), (8, 1)],
  term ((576 : Rat) / 7) [(0, 1), (8, 1), (9, 1), (13, 1)],
  term ((-864 : Rat) / 5) [(0, 1), (8, 1), (9, 1), (13, 1), (14, 1)],
  term ((288 : Rat) / 5) [(0, 1), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-144 : Rat) / 5) [(0, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((864 : Rat) / 5) [(0, 1), (8, 1), (9, 1), (15, 1)],
  term ((-288 : Rat) / 5) [(0, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1728 : Rat) / 35) [(0, 1), (8, 1), (11, 1), (13, 1)],
  term ((432 : Rat) / 5) [(0, 1), (8, 1), (11, 1), (13, 1), (14, 1)],
  term ((-144 : Rat) / 5) [(0, 1), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((72 : Rat) / 5) [(0, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-432 : Rat) / 5) [(0, 1), (8, 1), (11, 1), (15, 1)],
  term ((144 : Rat) / 5) [(0, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((108 : Rat) / 5) [(0, 1), (8, 1), (14, 1)],
  term ((69 : Rat) / 5) [(0, 2)],
  term ((144 : Rat) / 35) [(0, 2), (1, 1), (2, 1), (13, 1)],
  term (576 : Rat) [(0, 2), (1, 1), (2, 1), (15, 1)],
  term (-192 : Rat) [(0, 2), (1, 1), (2, 1), (15, 1), (16, 1)],
  term (-288 : Rat) [(0, 2), (1, 1), (3, 1)],
  term (-144 : Rat) [(0, 2), (1, 1), (3, 1), (14, 1)],
  term (48 : Rat) [(0, 2), (1, 1), (3, 1), (14, 1), (16, 1)],
  term (96 : Rat) [(0, 2), (1, 1), (3, 1), (16, 1)],
  term ((-144 : Rat) / 35) [(0, 2), (1, 1), (4, 1), (13, 1)],
  term (-384 : Rat) [(0, 2), (1, 1), (8, 1), (15, 1)],
  term (96 : Rat) [(0, 2), (1, 1), (8, 1), (15, 1), (16, 1)],
  term ((2304 : Rat) / 5) [(0, 2), (1, 1), (9, 2), (15, 1)],
  term ((-576 : Rat) / 5) [(0, 2), (1, 1), (9, 2), (15, 1), (16, 1)],
  term ((-996 : Rat) / 7) [(0, 2), (1, 1), (13, 1)],
  term (288 : Rat) [(0, 2), (1, 1), (13, 1), (14, 1)],
  term (-96 : Rat) [(0, 2), (1, 1), (13, 1), (14, 1), (16, 1)],
  term (48 : Rat) [(0, 2), (1, 1), (13, 1), (16, 1)],
  term (-288 : Rat) [(0, 2), (1, 1), (15, 1)],
  term (96 : Rat) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term ((-1152 : Rat) / 5) [(0, 2), (1, 2), (9, 1), (15, 1)],
  term ((288 : Rat) / 5) [(0, 2), (1, 2), (9, 1), (15, 1), (16, 1)],
  term ((-144 : Rat) / 35) [(0, 2), (2, 1), (7, 1), (13, 1)],
  term (-576 : Rat) [(0, 2), (2, 1), (7, 1), (15, 1)],
  term (192 : Rat) [(0, 2), (2, 1), (7, 1), (15, 1), (16, 1)],
  term ((6912 : Rat) / 5) [(0, 2), (2, 1), (8, 1), (9, 1), (15, 1)],
  term ((-2304 : Rat) / 5) [(0, 2), (2, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((864 : Rat) / 5) [(0, 2), (2, 1), (9, 1), (15, 1)],
  term ((-288 : Rat) / 5) [(0, 2), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((-432 : Rat) / 5) [(0, 2), (2, 1), (11, 1), (15, 1)],
  term ((144 : Rat) / 5) [(0, 2), (2, 1), (11, 1), (15, 1), (16, 1)],
  term (288 : Rat) [(0, 2), (3, 1), (7, 1)],
  term (144 : Rat) [(0, 2), (3, 1), (7, 1), (14, 1)],
  term (-48 : Rat) [(0, 2), (3, 1), (7, 1), (14, 1), (16, 1)],
  term (-96 : Rat) [(0, 2), (3, 1), (7, 1), (16, 1)],
  term ((-3456 : Rat) / 5) [(0, 2), (3, 1), (8, 1), (9, 1)],
  term ((-1728 : Rat) / 5) [(0, 2), (3, 1), (8, 1), (9, 1), (14, 1)],
  term ((576 : Rat) / 5) [(0, 2), (3, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((1152 : Rat) / 5) [(0, 2), (3, 1), (8, 1), (9, 1), (16, 1)],
  term ((-432 : Rat) / 5) [(0, 2), (3, 1), (9, 1)],
  term ((-216 : Rat) / 5) [(0, 2), (3, 1), (9, 1), (14, 1)],
  term ((72 : Rat) / 5) [(0, 2), (3, 1), (9, 1), (14, 1), (16, 1)],
  term ((144 : Rat) / 5) [(0, 2), (3, 1), (9, 1), (16, 1)],
  term ((216 : Rat) / 5) [(0, 2), (3, 1), (11, 1)],
  term ((108 : Rat) / 5) [(0, 2), (3, 1), (11, 1), (14, 1)],
  term ((-36 : Rat) / 5) [(0, 2), (3, 1), (11, 1), (14, 1), (16, 1)],
  term ((-72 : Rat) / 5) [(0, 2), (3, 1), (11, 1), (16, 1)],
  term ((144 : Rat) / 35) [(0, 2), (4, 1), (7, 1), (13, 1)],
  term ((-576 : Rat) / 35) [(0, 2), (5, 1), (8, 1), (13, 1)],
  term ((-2304 : Rat) / 5) [(0, 2), (6, 1), (8, 1), (9, 1), (15, 1)],
  term ((576 : Rat) / 5) [(0, 2), (6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((1152 : Rat) / 5) [(0, 2), (6, 2), (9, 1), (15, 1)],
  term ((-288 : Rat) / 5) [(0, 2), (6, 2), (9, 1), (15, 1), (16, 1)],
  term (384 : Rat) [(0, 2), (7, 1), (8, 1), (15, 1)],
  term (-96 : Rat) [(0, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-2304 : Rat) / 5) [(0, 2), (7, 1), (9, 2), (15, 1)],
  term ((576 : Rat) / 5) [(0, 2), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((4908 : Rat) / 35) [(0, 2), (7, 1), (13, 1)],
  term (-288 : Rat) [(0, 2), (7, 1), (13, 1), (14, 1)],
  term (96 : Rat) [(0, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term (-48 : Rat) [(0, 2), (7, 1), (13, 1), (16, 1)],
  term (288 : Rat) [(0, 2), (7, 1), (15, 1)],
  term (-96 : Rat) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((1152 : Rat) / 5) [(0, 2), (7, 2), (9, 1), (15, 1)],
  term ((-288 : Rat) / 5) [(0, 2), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((276 : Rat) / 5) [(0, 2), (8, 1)],
  term ((-2304 : Rat) / 7) [(0, 2), (8, 1), (9, 1), (13, 1)],
  term ((3456 : Rat) / 5) [(0, 2), (8, 1), (9, 1), (13, 1), (14, 1)],
  term ((-1152 : Rat) / 5) [(0, 2), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((576 : Rat) / 5) [(0, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-4032 : Rat) / 5) [(0, 2), (8, 1), (9, 1), (15, 1)],
  term ((1296 : Rat) / 5) [(0, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((288 : Rat) / 5) [(0, 2), (8, 1), (11, 1), (15, 1)],
  term ((-72 : Rat) / 5) [(0, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-216 : Rat) / 5) [(0, 2), (8, 1), (14, 1)],
  term ((-288 : Rat) / 7) [(0, 2), (9, 1), (13, 1)],
  term ((432 : Rat) / 5) [(0, 2), (9, 1), (13, 1), (14, 1)],
  term ((-144 : Rat) / 5) [(0, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((72 : Rat) / 5) [(0, 2), (9, 1), (13, 1), (16, 1)],
  term ((-432 : Rat) / 5) [(0, 2), (9, 1), (15, 1)],
  term ((144 : Rat) / 5) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((864 : Rat) / 35) [(0, 2), (11, 1), (13, 1)],
  term ((-216 : Rat) / 5) [(0, 2), (11, 1), (13, 1), (14, 1)],
  term ((72 : Rat) / 5) [(0, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-36 : Rat) / 5) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term ((216 : Rat) / 5) [(0, 2), (11, 1), (15, 1)],
  term ((-72 : Rat) / 5) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((-54 : Rat) / 5) [(0, 2), (14, 1)],
  term ((-138 : Rat) / 5) [(0, 3)],
  term (192 : Rat) [(0, 3), (1, 1), (15, 1)],
  term (-48 : Rat) [(0, 3), (1, 1), (15, 1), (16, 1)],
  term ((-3456 : Rat) / 5) [(0, 3), (2, 1), (9, 1), (15, 1)],
  term ((1152 : Rat) / 5) [(0, 3), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((1728 : Rat) / 5) [(0, 3), (3, 1), (9, 1)],
  term ((864 : Rat) / 5) [(0, 3), (3, 1), (9, 1), (14, 1)],
  term ((-288 : Rat) / 5) [(0, 3), (3, 1), (9, 1), (14, 1), (16, 1)],
  term ((-576 : Rat) / 5) [(0, 3), (3, 1), (9, 1), (16, 1)],
  term ((288 : Rat) / 35) [(0, 3), (5, 1), (13, 1)],
  term (-192 : Rat) [(0, 3), (7, 1), (15, 1)],
  term (48 : Rat) [(0, 3), (7, 1), (15, 1), (16, 1)],
  term ((2304 : Rat) / 5) [(0, 3), (8, 1), (9, 1), (15, 1)],
  term ((-576 : Rat) / 5) [(0, 3), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((1152 : Rat) / 7) [(0, 3), (9, 1), (13, 1)],
  term ((-1728 : Rat) / 5) [(0, 3), (9, 1), (13, 1), (14, 1)],
  term ((576 : Rat) / 5) [(0, 3), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(0, 3), (9, 1), (13, 1), (16, 1)],
  term ((2016 : Rat) / 5) [(0, 3), (9, 1), (15, 1)],
  term ((-648 : Rat) / 5) [(0, 3), (9, 1), (15, 1), (16, 1)],
  term ((-144 : Rat) / 5) [(0, 3), (11, 1), (15, 1)],
  term ((36 : Rat) / 5) [(0, 3), (11, 1), (15, 1), (16, 1)],
  term ((108 : Rat) / 5) [(0, 3), (14, 1)],
  term ((-1152 : Rat) / 5) [(0, 4), (9, 1), (15, 1)],
  term ((288 : Rat) / 5) [(0, 4), (9, 1), (15, 1), (16, 1)],
  term ((288 : Rat) / 35) [(1, 1), (2, 1), (6, 1), (8, 1), (13, 1)],
  term (1152 : Rat) [(1, 1), (2, 1), (6, 1), (8, 1), (15, 1)],
  term (-384 : Rat) [(1, 1), (2, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-144 : Rat) / 35) [(1, 1), (2, 1), (6, 2), (13, 1)],
  term (-576 : Rat) [(1, 1), (2, 1), (6, 2), (15, 1)],
  term (192 : Rat) [(1, 1), (2, 1), (6, 2), (15, 1), (16, 1)],
  term ((576 : Rat) / 35) [(1, 1), (2, 1), (7, 1), (9, 1), (13, 1)],
  term (2304 : Rat) [(1, 1), (2, 1), (7, 1), (9, 1), (15, 1)],
  term (-768 : Rat) [(1, 1), (2, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-144 : Rat) / 35) [(1, 1), (2, 1), (7, 2), (13, 1)],
  term (-576 : Rat) [(1, 1), (2, 1), (7, 2), (15, 1)],
  term (192 : Rat) [(1, 1), (2, 1), (7, 2), (15, 1), (16, 1)],
  term ((864 : Rat) / 5) [(1, 1), (2, 1), (9, 1), (11, 1), (15, 1)],
  term ((-288 : Rat) / 5) [(1, 1), (2, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1728 : Rat) / 5) [(1, 1), (2, 1), (9, 2), (15, 1)],
  term ((576 : Rat) / 5) [(1, 1), (2, 1), (9, 2), (15, 1), (16, 1)],
  term (-576 : Rat) [(1, 1), (3, 1), (6, 1), (8, 1)],
  term (-288 : Rat) [(1, 1), (3, 1), (6, 1), (8, 1), (14, 1)],
  term (96 : Rat) [(1, 1), (3, 1), (6, 1), (8, 1), (14, 1), (16, 1)],
  term (192 : Rat) [(1, 1), (3, 1), (6, 1), (8, 1), (16, 1)],
  term (288 : Rat) [(1, 1), (3, 1), (6, 2)],
  term (144 : Rat) [(1, 1), (3, 1), (6, 2), (14, 1)],
  term (-48 : Rat) [(1, 1), (3, 1), (6, 2), (14, 1), (16, 1)],
  term (-96 : Rat) [(1, 1), (3, 1), (6, 2), (16, 1)],
  term (-1152 : Rat) [(1, 1), (3, 1), (7, 1), (9, 1)],
  term (-576 : Rat) [(1, 1), (3, 1), (7, 1), (9, 1), (14, 1)],
  term (192 : Rat) [(1, 1), (3, 1), (7, 1), (9, 1), (14, 1), (16, 1)],
  term (384 : Rat) [(1, 1), (3, 1), (7, 1), (9, 1), (16, 1)],
  term (288 : Rat) [(1, 1), (3, 1), (7, 2)],
  term (144 : Rat) [(1, 1), (3, 1), (7, 2), (14, 1)],
  term (-48 : Rat) [(1, 1), (3, 1), (7, 2), (14, 1), (16, 1)],
  term (-96 : Rat) [(1, 1), (3, 1), (7, 2), (16, 1)],
  term ((-432 : Rat) / 5) [(1, 1), (3, 1), (9, 1), (11, 1)],
  term ((-216 : Rat) / 5) [(1, 1), (3, 1), (9, 1), (11, 1), (14, 1)],
  term ((72 : Rat) / 5) [(1, 1), (3, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((144 : Rat) / 5) [(1, 1), (3, 1), (9, 1), (11, 1), (16, 1)],
  term ((864 : Rat) / 5) [(1, 1), (3, 1), (9, 2)],
  term ((432 : Rat) / 5) [(1, 1), (3, 1), (9, 2), (14, 1)],
  term ((-144 : Rat) / 5) [(1, 1), (3, 1), (9, 2), (14, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(1, 1), (3, 1), (9, 2), (16, 1)],
  term ((-288 : Rat) / 35) [(1, 1), (4, 1), (6, 1), (8, 1), (13, 1)],
  term ((144 : Rat) / 35) [(1, 1), (4, 1), (6, 2), (13, 1)],
  term ((-576 : Rat) / 35) [(1, 1), (4, 1), (7, 1), (9, 1), (13, 1)],
  term ((144 : Rat) / 35) [(1, 1), (4, 1), (7, 2), (13, 1)],
  term ((-1992 : Rat) / 7) [(1, 1), (6, 1), (8, 1), (13, 1)],
  term (576 : Rat) [(1, 1), (6, 1), (8, 1), (13, 1), (14, 1)],
  term (-192 : Rat) [(1, 1), (6, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term (96 : Rat) [(1, 1), (6, 1), (8, 1), (13, 1), (16, 1)],
  term (-576 : Rat) [(1, 1), (6, 1), (8, 1), (15, 1)],
  term (192 : Rat) [(1, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((996 : Rat) / 7) [(1, 1), (6, 2), (13, 1)],
  term (-288 : Rat) [(1, 1), (6, 2), (13, 1), (14, 1)],
  term (96 : Rat) [(1, 1), (6, 2), (13, 1), (14, 1), (16, 1)],
  term (-48 : Rat) [(1, 1), (6, 2), (13, 1), (16, 1)],
  term (288 : Rat) [(1, 1), (6, 2), (15, 1)],
  term (-96 : Rat) [(1, 1), (6, 2), (15, 1), (16, 1)],
  term ((-19776 : Rat) / 35) [(1, 1), (7, 1), (9, 1), (13, 1)],
  term (1152 : Rat) [(1, 1), (7, 1), (9, 1), (13, 1), (14, 1)],
  term (-384 : Rat) [(1, 1), (7, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term (192 : Rat) [(1, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term (-1152 : Rat) [(1, 1), (7, 1), (9, 1), (15, 1)],
  term (384 : Rat) [(1, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((996 : Rat) / 7) [(1, 1), (7, 2), (13, 1)],
  term (-288 : Rat) [(1, 1), (7, 2), (13, 1), (14, 1)],
  term (96 : Rat) [(1, 1), (7, 2), (13, 1), (14, 1), (16, 1)],
  term (-48 : Rat) [(1, 1), (7, 2), (13, 1), (16, 1)],
  term (288 : Rat) [(1, 1), (7, 2), (15, 1)],
  term (-96 : Rat) [(1, 1), (7, 2), (15, 1), (16, 1)],
  term ((-138 : Rat) / 5) [(1, 1), (9, 1)],
  term ((-1728 : Rat) / 35) [(1, 1), (9, 1), (11, 1), (13, 1)],
  term ((432 : Rat) / 5) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((-144 : Rat) / 5) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((72 : Rat) / 5) [(1, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-432 : Rat) / 5) [(1, 1), (9, 1), (11, 1), (15, 1)],
  term ((144 : Rat) / 5) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((108 : Rat) / 5) [(1, 1), (9, 1), (14, 1)],
  term ((576 : Rat) / 7) [(1, 1), (9, 2), (13, 1)],
  term ((-864 : Rat) / 5) [(1, 1), (9, 2), (13, 1), (14, 1)],
  term ((288 : Rat) / 5) [(1, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((-144 : Rat) / 5) [(1, 1), (9, 2), (13, 1), (16, 1)],
  term ((864 : Rat) / 5) [(1, 1), (9, 2), (15, 1)],
  term ((-288 : Rat) / 5) [(1, 1), (9, 2), (15, 1), (16, 1)],
  term ((69 : Rat) / 5) [(1, 2)],
  term ((-144 : Rat) / 35) [(1, 2), (2, 1), (7, 1), (13, 1)],
  term (-576 : Rat) [(1, 2), (2, 1), (7, 1), (15, 1)],
  term (192 : Rat) [(1, 2), (2, 1), (7, 1), (15, 1), (16, 1)],
  term ((-288 : Rat) / 35) [(1, 2), (2, 1), (9, 1), (13, 1)],
  term ((-4896 : Rat) / 5) [(1, 2), (2, 1), (9, 1), (15, 1)],
  term ((1632 : Rat) / 5) [(1, 2), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((-432 : Rat) / 5) [(1, 2), (2, 1), (11, 1), (15, 1)],
  term ((144 : Rat) / 5) [(1, 2), (2, 1), (11, 1), (15, 1), (16, 1)],
  term (288 : Rat) [(1, 2), (3, 1), (7, 1)],
  term (144 : Rat) [(1, 2), (3, 1), (7, 1), (14, 1)],
  term (-48 : Rat) [(1, 2), (3, 1), (7, 1), (14, 1), (16, 1)],
  term (-96 : Rat) [(1, 2), (3, 1), (7, 1), (16, 1)],
  term ((2448 : Rat) / 5) [(1, 2), (3, 1), (9, 1)],
  term ((1224 : Rat) / 5) [(1, 2), (3, 1), (9, 1), (14, 1)],
  term ((-408 : Rat) / 5) [(1, 2), (3, 1), (9, 1), (14, 1), (16, 1)],
  term ((-816 : Rat) / 5) [(1, 2), (3, 1), (9, 1), (16, 1)],
  term ((216 : Rat) / 5) [(1, 2), (3, 1), (11, 1)],
  term ((108 : Rat) / 5) [(1, 2), (3, 1), (11, 1), (14, 1)],
  term ((-36 : Rat) / 5) [(1, 2), (3, 1), (11, 1), (14, 1), (16, 1)],
  term ((-72 : Rat) / 5) [(1, 2), (3, 1), (11, 1), (16, 1)],
  term ((144 : Rat) / 35) [(1, 2), (4, 1), (7, 1), (13, 1)],
  term ((288 : Rat) / 35) [(1, 2), (4, 1), (9, 1), (13, 1)],
  term ((4908 : Rat) / 35) [(1, 2), (7, 1), (13, 1)],
  term (-288 : Rat) [(1, 2), (7, 1), (13, 1), (14, 1)],
  term (96 : Rat) [(1, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term (-48 : Rat) [(1, 2), (7, 1), (13, 1), (16, 1)],
  term (288 : Rat) [(1, 2), (7, 1), (15, 1)],
  term (-96 : Rat) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((1704 : Rat) / 7) [(1, 2), (9, 1), (13, 1)],
  term ((-2448 : Rat) / 5) [(1, 2), (9, 1), (13, 1), (14, 1)],
  term ((816 : Rat) / 5) [(1, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-408 : Rat) / 5) [(1, 2), (9, 1), (13, 1), (16, 1)],
  term ((2448 : Rat) / 5) [(1, 2), (9, 1), (15, 1)],
  term ((-816 : Rat) / 5) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((864 : Rat) / 35) [(1, 2), (11, 1), (13, 1)],
  term ((-216 : Rat) / 5) [(1, 2), (11, 1), (13, 1), (14, 1)],
  term ((72 : Rat) / 5) [(1, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-36 : Rat) / 5) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term ((216 : Rat) / 5) [(1, 2), (11, 1), (15, 1)],
  term ((-72 : Rat) / 5) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-54 : Rat) / 5) [(1, 2), (14, 1)],
  term ((144 : Rat) / 35) [(1, 3), (2, 1), (13, 1)],
  term (576 : Rat) [(1, 3), (2, 1), (15, 1)],
  term (-192 : Rat) [(1, 3), (2, 1), (15, 1), (16, 1)],
  term (-288 : Rat) [(1, 3), (3, 1)],
  term (-144 : Rat) [(1, 3), (3, 1), (14, 1)],
  term (48 : Rat) [(1, 3), (3, 1), (14, 1), (16, 1)],
  term (96 : Rat) [(1, 3), (3, 1), (16, 1)],
  term ((-144 : Rat) / 35) [(1, 3), (4, 1), (13, 1)],
  term ((-996 : Rat) / 7) [(1, 3), (13, 1)],
  term (288 : Rat) [(1, 3), (13, 1), (14, 1)],
  term (-96 : Rat) [(1, 3), (13, 1), (14, 1), (16, 1)],
  term (48 : Rat) [(1, 3), (13, 1), (16, 1)],
  term (-288 : Rat) [(1, 3), (15, 1)],
  term (96 : Rat) [(1, 3), (15, 1), (16, 1)],
  term ((-288 : Rat) / 35) [(2, 1), (6, 1), (7, 1), (8, 1), (13, 1)],
  term (-1152 : Rat) [(2, 1), (6, 1), (7, 1), (8, 1), (15, 1)],
  term (384 : Rat) [(2, 1), (6, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((1728 : Rat) / 5) [(2, 1), (6, 1), (8, 1), (9, 1), (15, 1)],
  term ((-576 : Rat) / 5) [(2, 1), (6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-864 : Rat) / 5) [(2, 1), (6, 1), (8, 1), (11, 1), (15, 1)],
  term ((288 : Rat) / 5) [(2, 1), (6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((144 : Rat) / 35) [(2, 1), (6, 2), (7, 1), (13, 1)],
  term (576 : Rat) [(2, 1), (6, 2), (7, 1), (15, 1)],
  term (-192 : Rat) [(2, 1), (6, 2), (7, 1), (15, 1), (16, 1)],
  term ((-864 : Rat) / 5) [(2, 1), (6, 2), (9, 1), (15, 1)],
  term ((288 : Rat) / 5) [(2, 1), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((432 : Rat) / 5) [(2, 1), (6, 2), (11, 1), (15, 1)],
  term ((-144 : Rat) / 5) [(2, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-864 : Rat) / 5) [(2, 1), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((288 : Rat) / 5) [(2, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((1728 : Rat) / 5) [(2, 1), (7, 1), (9, 2), (15, 1)],
  term ((-576 : Rat) / 5) [(2, 1), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((-288 : Rat) / 35) [(2, 1), (7, 2), (9, 1), (13, 1)],
  term ((-6624 : Rat) / 5) [(2, 1), (7, 2), (9, 1), (15, 1)],
  term ((2208 : Rat) / 5) [(2, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((432 : Rat) / 5) [(2, 1), (7, 2), (11, 1), (15, 1)],
  term ((-144 : Rat) / 5) [(2, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((144 : Rat) / 35) [(2, 1), (7, 3), (13, 1)],
  term (576 : Rat) [(2, 1), (7, 3), (15, 1)],
  term (-192 : Rat) [(2, 1), (7, 3), (15, 1), (16, 1)],
  term (576 : Rat) [(3, 1), (6, 1), (7, 1), (8, 1)],
  term (288 : Rat) [(3, 1), (6, 1), (7, 1), (8, 1), (14, 1)],
  term (-96 : Rat) [(3, 1), (6, 1), (7, 1), (8, 1), (14, 1), (16, 1)],
  term (-192 : Rat) [(3, 1), (6, 1), (7, 1), (8, 1), (16, 1)],
  term ((-864 : Rat) / 5) [(3, 1), (6, 1), (8, 1), (9, 1)],
  term ((-432 : Rat) / 5) [(3, 1), (6, 1), (8, 1), (9, 1), (14, 1)],
  term ((144 : Rat) / 5) [(3, 1), (6, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((288 : Rat) / 5) [(3, 1), (6, 1), (8, 1), (9, 1), (16, 1)],
  term ((432 : Rat) / 5) [(3, 1), (6, 1), (8, 1), (11, 1)],
  term ((216 : Rat) / 5) [(3, 1), (6, 1), (8, 1), (11, 1), (14, 1)],
  term ((-72 : Rat) / 5) [(3, 1), (6, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-144 : Rat) / 5) [(3, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term (-288 : Rat) [(3, 1), (6, 2), (7, 1)],
  term (-144 : Rat) [(3, 1), (6, 2), (7, 1), (14, 1)],
  term (48 : Rat) [(3, 1), (6, 2), (7, 1), (14, 1), (16, 1)],
  term (96 : Rat) [(3, 1), (6, 2), (7, 1), (16, 1)],
  term ((432 : Rat) / 5) [(3, 1), (6, 2), (9, 1)],
  term ((216 : Rat) / 5) [(3, 1), (6, 2), (9, 1), (14, 1)],
  term ((-72 : Rat) / 5) [(3, 1), (6, 2), (9, 1), (14, 1), (16, 1)],
  term ((-144 : Rat) / 5) [(3, 1), (6, 2), (9, 1), (16, 1)],
  term ((-216 : Rat) / 5) [(3, 1), (6, 2), (11, 1)],
  term ((-108 : Rat) / 5) [(3, 1), (6, 2), (11, 1), (14, 1)],
  term ((36 : Rat) / 5) [(3, 1), (6, 2), (11, 1), (14, 1), (16, 1)],
  term ((72 : Rat) / 5) [(3, 1), (6, 2), (11, 1), (16, 1)],
  term ((432 : Rat) / 5) [(3, 1), (7, 1), (9, 1), (11, 1)],
  term ((216 : Rat) / 5) [(3, 1), (7, 1), (9, 1), (11, 1), (14, 1)],
  term ((-72 : Rat) / 5) [(3, 1), (7, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-144 : Rat) / 5) [(3, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((-864 : Rat) / 5) [(3, 1), (7, 1), (9, 2)],
  term ((-432 : Rat) / 5) [(3, 1), (7, 1), (9, 2), (14, 1)],
  term ((144 : Rat) / 5) [(3, 1), (7, 1), (9, 2), (14, 1), (16, 1)],
  term ((288 : Rat) / 5) [(3, 1), (7, 1), (9, 2), (16, 1)],
  term ((3312 : Rat) / 5) [(3, 1), (7, 2), (9, 1)],
  term ((1656 : Rat) / 5) [(3, 1), (7, 2), (9, 1), (14, 1)],
  term ((-552 : Rat) / 5) [(3, 1), (7, 2), (9, 1), (14, 1), (16, 1)],
  term ((-1104 : Rat) / 5) [(3, 1), (7, 2), (9, 1), (16, 1)],
  term ((-216 : Rat) / 5) [(3, 1), (7, 2), (11, 1)],
  term ((-108 : Rat) / 5) [(3, 1), (7, 2), (11, 1), (14, 1)],
  term ((36 : Rat) / 5) [(3, 1), (7, 2), (11, 1), (14, 1), (16, 1)],
  term ((72 : Rat) / 5) [(3, 1), (7, 2), (11, 1), (16, 1)],
  term (-288 : Rat) [(3, 1), (7, 3)],
  term (-144 : Rat) [(3, 1), (7, 3), (14, 1)],
  term (48 : Rat) [(3, 1), (7, 3), (14, 1), (16, 1)],
  term (96 : Rat) [(3, 1), (7, 3), (16, 1)],
  term ((288 : Rat) / 35) [(4, 1), (6, 1), (7, 1), (8, 1), (13, 1)],
  term ((-144 : Rat) / 35) [(4, 1), (6, 2), (7, 1), (13, 1)],
  term ((288 : Rat) / 35) [(4, 1), (7, 2), (9, 1), (13, 1)],
  term ((-144 : Rat) / 35) [(4, 1), (7, 3), (13, 1)],
  term ((9816 : Rat) / 35) [(6, 1), (7, 1), (8, 1), (13, 1)],
  term (-576 : Rat) [(6, 1), (7, 1), (8, 1), (13, 1), (14, 1)],
  term (192 : Rat) [(6, 1), (7, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term (-96 : Rat) [(6, 1), (7, 1), (8, 1), (13, 1), (16, 1)],
  term (576 : Rat) [(6, 1), (7, 1), (8, 1), (15, 1)],
  term (-192 : Rat) [(6, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((138 : Rat) / 5) [(6, 1), (8, 1)],
  term ((-576 : Rat) / 7) [(6, 1), (8, 1), (9, 1), (13, 1)],
  term ((864 : Rat) / 5) [(6, 1), (8, 1), (9, 1), (13, 1), (14, 1)],
  term ((-288 : Rat) / 5) [(6, 1), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((144 : Rat) / 5) [(6, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-864 : Rat) / 5) [(6, 1), (8, 1), (9, 1), (15, 1)],
  term ((288 : Rat) / 5) [(6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((1728 : Rat) / 35) [(6, 1), (8, 1), (11, 1), (13, 1)],
  term ((-432 : Rat) / 5) [(6, 1), (8, 1), (11, 1), (13, 1), (14, 1)],
  term ((144 : Rat) / 5) [(6, 1), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-72 : Rat) / 5) [(6, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((432 : Rat) / 5) [(6, 1), (8, 1), (11, 1), (15, 1)],
  term ((-144 : Rat) / 5) [(6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-108 : Rat) / 5) [(6, 1), (8, 1), (14, 1)],
  term ((-69 : Rat) / 5) [(6, 2)],
  term ((-4908 : Rat) / 35) [(6, 2), (7, 1), (13, 1)],
  term (288 : Rat) [(6, 2), (7, 1), (13, 1), (14, 1)],
  term (-96 : Rat) [(6, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term (48 : Rat) [(6, 2), (7, 1), (13, 1), (16, 1)],
  term (-288 : Rat) [(6, 2), (7, 1), (15, 1)],
  term (96 : Rat) [(6, 2), (7, 1), (15, 1), (16, 1)],
  term ((288 : Rat) / 7) [(6, 2), (9, 1), (13, 1)],
  term ((-432 : Rat) / 5) [(6, 2), (9, 1), (13, 1), (14, 1)],
  term ((144 : Rat) / 5) [(6, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-72 : Rat) / 5) [(6, 2), (9, 1), (13, 1), (16, 1)],
  term ((432 : Rat) / 5) [(6, 2), (9, 1), (15, 1)],
  term ((-144 : Rat) / 5) [(6, 2), (9, 1), (15, 1), (16, 1)],
  term ((-864 : Rat) / 35) [(6, 2), (11, 1), (13, 1)],
  term ((216 : Rat) / 5) [(6, 2), (11, 1), (13, 1), (14, 1)],
  term ((-72 : Rat) / 5) [(6, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((36 : Rat) / 5) [(6, 2), (11, 1), (13, 1), (16, 1)],
  term ((-216 : Rat) / 5) [(6, 2), (11, 1), (15, 1)],
  term ((72 : Rat) / 5) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term ((54 : Rat) / 5) [(6, 2), (14, 1)],
  term ((138 : Rat) / 5) [(7, 1), (9, 1)],
  term ((1728 : Rat) / 35) [(7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-432 : Rat) / 5) [(7, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((144 : Rat) / 5) [(7, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-72 : Rat) / 5) [(7, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((432 : Rat) / 5) [(7, 1), (9, 1), (11, 1), (15, 1)],
  term ((-144 : Rat) / 5) [(7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-108 : Rat) / 5) [(7, 1), (9, 1), (14, 1)],
  term ((-576 : Rat) / 7) [(7, 1), (9, 2), (13, 1)],
  term ((864 : Rat) / 5) [(7, 1), (9, 2), (13, 1), (14, 1)],
  term ((-288 : Rat) / 5) [(7, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((144 : Rat) / 5) [(7, 1), (9, 2), (13, 1), (16, 1)],
  term ((-864 : Rat) / 5) [(7, 1), (9, 2), (15, 1)],
  term ((288 : Rat) / 5) [(7, 1), (9, 2), (15, 1), (16, 1)],
  term ((-69 : Rat) / 5) [(7, 2)],
  term ((1608 : Rat) / 5) [(7, 2), (9, 1), (13, 1)],
  term ((-3312 : Rat) / 5) [(7, 2), (9, 1), (13, 1), (14, 1)],
  term ((1104 : Rat) / 5) [(7, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-552 : Rat) / 5) [(7, 2), (9, 1), (13, 1), (16, 1)],
  term ((3312 : Rat) / 5) [(7, 2), (9, 1), (15, 1)],
  term ((-1104 : Rat) / 5) [(7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-864 : Rat) / 35) [(7, 2), (11, 1), (13, 1)],
  term ((216 : Rat) / 5) [(7, 2), (11, 1), (13, 1), (14, 1)],
  term ((-72 : Rat) / 5) [(7, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((36 : Rat) / 5) [(7, 2), (11, 1), (13, 1), (16, 1)],
  term ((-216 : Rat) / 5) [(7, 2), (11, 1), (15, 1)],
  term ((72 : Rat) / 5) [(7, 2), (11, 1), (15, 1), (16, 1)],
  term ((54 : Rat) / 5) [(7, 2), (14, 1)],
  term ((-4908 : Rat) / 35) [(7, 3), (13, 1)],
  term (288 : Rat) [(7, 3), (13, 1), (14, 1)],
  term (-96 : Rat) [(7, 3), (13, 1), (14, 1), (16, 1)],
  term (48 : Rat) [(7, 3), (13, 1), (16, 1)],
  term (-288 : Rat) [(7, 3), (15, 1)],
  term (96 : Rat) [(7, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 20, terms 0 through 76. -/
theorem rs_R006_ueqv_R006_block_20_0000_0076_valid :
    checkProductSumEq rs_R006_ueqv_R006_partials_20_0000_0076
      rs_R006_ueqv_R006_block_20_0000_0076 = true := by
  native_decide

end R006UeqvR006TermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
