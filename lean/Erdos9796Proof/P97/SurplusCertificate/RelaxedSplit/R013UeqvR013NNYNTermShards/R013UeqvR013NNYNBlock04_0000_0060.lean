/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R013:u=v:R013NNYN, term block 4:0-60

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R013UeqvR013NNYNTermShards

/-- Generator polynomial 4 for relaxed split surplus certificate `R013:u=v:R013NNYN`. -/
def rs_R013_ueqv_R013NNYN_generator_04_0000_0060 : Poly :=
[
  term (-2 : Rat) [(6, 1)],
  term (1 : Rat) [(6, 2)],
  term (1 : Rat) [(7, 2)],
  term (2 : Rat) [(12, 1)],
  term (-1 : Rat) [(12, 2)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013NNYN_coefficient_04_0000 : Poly :=
[
  term ((576 : Rat) / 103) [(0, 1), (4, 1), (16, 1)]
]

/-- Partial product 0 for generator 4. -/
def rs_R013_ueqv_R013NNYN_partial_04_0000 : Poly :=
[
  term ((-1152 : Rat) / 103) [(0, 1), (4, 1), (6, 1), (16, 1)],
  term ((576 : Rat) / 103) [(0, 1), (4, 1), (6, 2), (16, 1)],
  term ((576 : Rat) / 103) [(0, 1), (4, 1), (7, 2), (16, 1)],
  term ((1152 : Rat) / 103) [(0, 1), (4, 1), (12, 1), (16, 1)],
  term ((-576 : Rat) / 103) [(0, 1), (4, 1), (12, 2), (16, 1)],
  term ((-576 : Rat) / 103) [(0, 1), (4, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 4. -/
theorem rs_R013_ueqv_R013NNYN_partial_04_0000_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_04_0000
        rs_R013_ueqv_R013NNYN_generator_04_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_04_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013NNYN_coefficient_04_0001 : Poly :=
[
  term ((-2496 : Rat) / 103) [(0, 1), (5, 1), (7, 1), (16, 1)]
]

/-- Partial product 1 for generator 4. -/
def rs_R013_ueqv_R013NNYN_partial_04_0001 : Poly :=
[
  term ((4992 : Rat) / 103) [(0, 1), (5, 1), (6, 1), (7, 1), (16, 1)],
  term ((-2496 : Rat) / 103) [(0, 1), (5, 1), (6, 2), (7, 1), (16, 1)],
  term ((-4992 : Rat) / 103) [(0, 1), (5, 1), (7, 1), (12, 1), (16, 1)],
  term ((2496 : Rat) / 103) [(0, 1), (5, 1), (7, 1), (12, 2), (16, 1)],
  term ((2496 : Rat) / 103) [(0, 1), (5, 1), (7, 1), (13, 2), (16, 1)],
  term ((-2496 : Rat) / 103) [(0, 1), (5, 1), (7, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 4. -/
theorem rs_R013_ueqv_R013NNYN_partial_04_0001_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_04_0001
        rs_R013_ueqv_R013NNYN_generator_04_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_04_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013NNYN_coefficient_04_0002 : Poly :=
[
  term ((-1248 : Rat) / 103) [(0, 1), (5, 1), (9, 1), (16, 1)]
]

/-- Partial product 2 for generator 4. -/
def rs_R013_ueqv_R013NNYN_partial_04_0002 : Poly :=
[
  term ((2496 : Rat) / 103) [(0, 1), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((-1248 : Rat) / 103) [(0, 1), (5, 1), (6, 2), (9, 1), (16, 1)],
  term ((-1248 : Rat) / 103) [(0, 1), (5, 1), (7, 2), (9, 1), (16, 1)],
  term ((-2496 : Rat) / 103) [(0, 1), (5, 1), (9, 1), (12, 1), (16, 1)],
  term ((1248 : Rat) / 103) [(0, 1), (5, 1), (9, 1), (12, 2), (16, 1)],
  term ((1248 : Rat) / 103) [(0, 1), (5, 1), (9, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 4. -/
theorem rs_R013_ueqv_R013NNYN_partial_04_0002_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_04_0002
        rs_R013_ueqv_R013NNYN_generator_04_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_04_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013NNYN_coefficient_04_0003 : Poly :=
[
  term ((-576 : Rat) / 103) [(0, 1), (5, 1), (13, 1), (16, 1)]
]

/-- Partial product 3 for generator 4. -/
def rs_R013_ueqv_R013NNYN_partial_04_0003 : Poly :=
[
  term ((1152 : Rat) / 103) [(0, 1), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((-576 : Rat) / 103) [(0, 1), (5, 1), (6, 2), (13, 1), (16, 1)],
  term ((-576 : Rat) / 103) [(0, 1), (5, 1), (7, 2), (13, 1), (16, 1)],
  term ((-1152 : Rat) / 103) [(0, 1), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((576 : Rat) / 103) [(0, 1), (5, 1), (12, 2), (13, 1), (16, 1)],
  term ((576 : Rat) / 103) [(0, 1), (5, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 4. -/
theorem rs_R013_ueqv_R013NNYN_partial_04_0003_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_04_0003
        rs_R013_ueqv_R013NNYN_generator_04_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_04_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013NNYN_coefficient_04_0004 : Poly :=
[
  term ((2496 : Rat) / 103) [(0, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 4 for generator 4. -/
def rs_R013_ueqv_R013NNYN_partial_04_0004 : Poly :=
[
  term ((-4992 : Rat) / 103) [(0, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((2496 : Rat) / 103) [(0, 1), (5, 1), (6, 2), (15, 1), (16, 1)],
  term ((2496 : Rat) / 103) [(0, 1), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((4992 : Rat) / 103) [(0, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2496 : Rat) / 103) [(0, 1), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((-2496 : Rat) / 103) [(0, 1), (5, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 4. -/
theorem rs_R013_ueqv_R013NNYN_partial_04_0004_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_04_0004
        rs_R013_ueqv_R013NNYN_generator_04_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_04_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013NNYN_coefficient_04_0005 : Poly :=
[
  term ((-1152 : Rat) / 103) [(0, 1), (7, 1), (13, 1), (16, 1)]
]

/-- Partial product 5 for generator 4. -/
def rs_R013_ueqv_R013NNYN_partial_04_0005 : Poly :=
[
  term ((2304 : Rat) / 103) [(0, 1), (6, 1), (7, 1), (13, 1), (16, 1)],
  term ((-1152 : Rat) / 103) [(0, 1), (6, 2), (7, 1), (13, 1), (16, 1)],
  term ((-2304 : Rat) / 103) [(0, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((1152 : Rat) / 103) [(0, 1), (7, 1), (12, 2), (13, 1), (16, 1)],
  term ((1152 : Rat) / 103) [(0, 1), (7, 1), (13, 3), (16, 1)],
  term ((-1152 : Rat) / 103) [(0, 1), (7, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 4. -/
theorem rs_R013_ueqv_R013NNYN_partial_04_0005_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_04_0005
        rs_R013_ueqv_R013NNYN_generator_04_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_04_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013NNYN_coefficient_04_0006 : Poly :=
[
  term ((1824 : Rat) / 103) [(0, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 6 for generator 4. -/
def rs_R013_ueqv_R013NNYN_partial_04_0006 : Poly :=
[
  term ((-3648 : Rat) / 103) [(0, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((1824 : Rat) / 103) [(0, 1), (6, 2), (7, 1), (15, 1), (16, 1)],
  term ((3648 : Rat) / 103) [(0, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1824 : Rat) / 103) [(0, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1824 : Rat) / 103) [(0, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((1824 : Rat) / 103) [(0, 1), (7, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 4. -/
theorem rs_R013_ueqv_R013NNYN_partial_04_0006_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_04_0006
        rs_R013_ueqv_R013NNYN_generator_04_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_04_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013NNYN_coefficient_04_0007 : Poly :=
[
  term ((1152 : Rat) / 103) [(0, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 7 for generator 4. -/
def rs_R013_ueqv_R013NNYN_partial_04_0007 : Poly :=
[
  term ((-2304 : Rat) / 103) [(0, 1), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((1152 : Rat) / 103) [(0, 1), (6, 2), (9, 1), (13, 1), (16, 1)],
  term ((1152 : Rat) / 103) [(0, 1), (7, 2), (9, 1), (13, 1), (16, 1)],
  term ((2304 : Rat) / 103) [(0, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1152 : Rat) / 103) [(0, 1), (9, 1), (12, 2), (13, 1), (16, 1)],
  term ((-1152 : Rat) / 103) [(0, 1), (9, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 4. -/
theorem rs_R013_ueqv_R013NNYN_partial_04_0007_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_04_0007
        rs_R013_ueqv_R013NNYN_generator_04_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_04_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013NNYN_coefficient_04_0008 : Poly :=
[
  term ((-912 : Rat) / 103) [(0, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 8 for generator 4. -/
def rs_R013_ueqv_R013NNYN_partial_04_0008 : Poly :=
[
  term ((1824 : Rat) / 103) [(0, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-912 : Rat) / 103) [(0, 1), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((-912 : Rat) / 103) [(0, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-1824 : Rat) / 103) [(0, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((912 : Rat) / 103) [(0, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((912 : Rat) / 103) [(0, 1), (9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 4. -/
theorem rs_R013_ueqv_R013NNYN_partial_04_0008_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_04_0008
        rs_R013_ueqv_R013NNYN_generator_04_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_04_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013NNYN_coefficient_04_0009 : Poly :=
[
  term ((624 : Rat) / 103) [(0, 1), (12, 1), (16, 1)]
]

/-- Partial product 9 for generator 4. -/
def rs_R013_ueqv_R013NNYN_partial_04_0009 : Poly :=
[
  term ((-1248 : Rat) / 103) [(0, 1), (6, 1), (12, 1), (16, 1)],
  term ((624 : Rat) / 103) [(0, 1), (6, 2), (12, 1), (16, 1)],
  term ((624 : Rat) / 103) [(0, 1), (7, 2), (12, 1), (16, 1)],
  term ((-624 : Rat) / 103) [(0, 1), (12, 1), (13, 2), (16, 1)],
  term ((1248 : Rat) / 103) [(0, 1), (12, 2), (16, 1)],
  term ((-624 : Rat) / 103) [(0, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 4. -/
theorem rs_R013_ueqv_R013NNYN_partial_04_0009_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_04_0009
        rs_R013_ueqv_R013NNYN_generator_04_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_04_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013NNYN_coefficient_04_0010 : Poly :=
[
  term ((-624 : Rat) / 103) [(0, 1), (14, 1), (16, 1)]
]

/-- Partial product 10 for generator 4. -/
def rs_R013_ueqv_R013NNYN_partial_04_0010 : Poly :=
[
  term ((1248 : Rat) / 103) [(0, 1), (6, 1), (14, 1), (16, 1)],
  term ((-624 : Rat) / 103) [(0, 1), (6, 2), (14, 1), (16, 1)],
  term ((-624 : Rat) / 103) [(0, 1), (7, 2), (14, 1), (16, 1)],
  term ((-1248 : Rat) / 103) [(0, 1), (12, 1), (14, 1), (16, 1)],
  term ((624 : Rat) / 103) [(0, 1), (12, 2), (14, 1), (16, 1)],
  term ((624 : Rat) / 103) [(0, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 4. -/
theorem rs_R013_ueqv_R013NNYN_partial_04_0010_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_04_0010
        rs_R013_ueqv_R013NNYN_generator_04_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_04_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013NNYN_coefficient_04_0011 : Poly :=
[
  term ((-60 : Rat) / 103) [(0, 1), (16, 1)]
]

/-- Partial product 11 for generator 4. -/
def rs_R013_ueqv_R013NNYN_partial_04_0011 : Poly :=
[
  term ((120 : Rat) / 103) [(0, 1), (6, 1), (16, 1)],
  term ((-60 : Rat) / 103) [(0, 1), (6, 2), (16, 1)],
  term ((-60 : Rat) / 103) [(0, 1), (7, 2), (16, 1)],
  term ((-120 : Rat) / 103) [(0, 1), (12, 1), (16, 1)],
  term ((60 : Rat) / 103) [(0, 1), (12, 2), (16, 1)],
  term ((60 : Rat) / 103) [(0, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 4. -/
theorem rs_R013_ueqv_R013NNYN_partial_04_0011_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_04_0011
        rs_R013_ueqv_R013NNYN_generator_04_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_04_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013NNYN_coefficient_04_0012 : Poly :=
[
  term ((576 : Rat) / 103) [(1, 1), (4, 1), (13, 1), (16, 1)]
]

/-- Partial product 12 for generator 4. -/
def rs_R013_ueqv_R013NNYN_partial_04_0012 : Poly :=
[
  term ((-1152 : Rat) / 103) [(1, 1), (4, 1), (6, 1), (13, 1), (16, 1)],
  term ((576 : Rat) / 103) [(1, 1), (4, 1), (6, 2), (13, 1), (16, 1)],
  term ((576 : Rat) / 103) [(1, 1), (4, 1), (7, 2), (13, 1), (16, 1)],
  term ((1152 : Rat) / 103) [(1, 1), (4, 1), (12, 1), (13, 1), (16, 1)],
  term ((-576 : Rat) / 103) [(1, 1), (4, 1), (12, 2), (13, 1), (16, 1)],
  term ((-576 : Rat) / 103) [(1, 1), (4, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 4. -/
theorem rs_R013_ueqv_R013NNYN_partial_04_0012_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_04_0012
        rs_R013_ueqv_R013NNYN_generator_04_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_04_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013NNYN_coefficient_04_0013 : Poly :=
[
  term ((13824 : Rat) / 103) [(1, 1), (5, 1), (7, 1), (13, 1), (16, 1)]
]

/-- Partial product 13 for generator 4. -/
def rs_R013_ueqv_R013NNYN_partial_04_0013 : Poly :=
[
  term ((-27648 : Rat) / 103) [(1, 1), (5, 1), (6, 1), (7, 1), (13, 1), (16, 1)],
  term ((13824 : Rat) / 103) [(1, 1), (5, 1), (6, 2), (7, 1), (13, 1), (16, 1)],
  term ((27648 : Rat) / 103) [(1, 1), (5, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-13824 : Rat) / 103) [(1, 1), (5, 1), (7, 1), (12, 2), (13, 1), (16, 1)],
  term ((-13824 : Rat) / 103) [(1, 1), (5, 1), (7, 1), (13, 3), (16, 1)],
  term ((13824 : Rat) / 103) [(1, 1), (5, 1), (7, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 4. -/
theorem rs_R013_ueqv_R013NNYN_partial_04_0013_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_04_0013
        rs_R013_ueqv_R013NNYN_generator_04_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_04_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013NNYN_coefficient_04_0014 : Poly :=
[
  term ((-21888 : Rat) / 103) [(1, 1), (5, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 14 for generator 4. -/
def rs_R013_ueqv_R013NNYN_partial_04_0014 : Poly :=
[
  term ((43776 : Rat) / 103) [(1, 1), (5, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-21888 : Rat) / 103) [(1, 1), (5, 1), (6, 2), (7, 1), (15, 1), (16, 1)],
  term ((-43776 : Rat) / 103) [(1, 1), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((21888 : Rat) / 103) [(1, 1), (5, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((21888 : Rat) / 103) [(1, 1), (5, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-21888 : Rat) / 103) [(1, 1), (5, 1), (7, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 4. -/
theorem rs_R013_ueqv_R013NNYN_partial_04_0014_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_04_0014
        rs_R013_ueqv_R013NNYN_generator_04_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_04_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013NNYN_coefficient_04_0015 : Poly :=
[
  term ((6912 : Rat) / 103) [(1, 1), (5, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 15 for generator 4. -/
def rs_R013_ueqv_R013NNYN_partial_04_0015 : Poly :=
[
  term ((-13824 : Rat) / 103) [(1, 1), (5, 1), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((6912 : Rat) / 103) [(1, 1), (5, 1), (6, 2), (9, 1), (13, 1), (16, 1)],
  term ((6912 : Rat) / 103) [(1, 1), (5, 1), (7, 2), (9, 1), (13, 1), (16, 1)],
  term ((13824 : Rat) / 103) [(1, 1), (5, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-6912 : Rat) / 103) [(1, 1), (5, 1), (9, 1), (12, 2), (13, 1), (16, 1)],
  term ((-6912 : Rat) / 103) [(1, 1), (5, 1), (9, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 4. -/
theorem rs_R013_ueqv_R013NNYN_partial_04_0015_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_04_0015
        rs_R013_ueqv_R013NNYN_generator_04_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_04_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013NNYN_coefficient_04_0016 : Poly :=
[
  term ((-10944 : Rat) / 103) [(1, 1), (5, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 16 for generator 4. -/
def rs_R013_ueqv_R013NNYN_partial_04_0016 : Poly :=
[
  term ((21888 : Rat) / 103) [(1, 1), (5, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-10944 : Rat) / 103) [(1, 1), (5, 1), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((-10944 : Rat) / 103) [(1, 1), (5, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-21888 : Rat) / 103) [(1, 1), (5, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((10944 : Rat) / 103) [(1, 1), (5, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((10944 : Rat) / 103) [(1, 1), (5, 1), (9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 4. -/
theorem rs_R013_ueqv_R013NNYN_partial_04_0016_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_04_0016
        rs_R013_ueqv_R013NNYN_generator_04_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_04_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013NNYN_coefficient_04_0017 : Poly :=
[
  term ((-13824 : Rat) / 103) [(1, 1), (5, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 17 for generator 4. -/
def rs_R013_ueqv_R013NNYN_partial_04_0017 : Poly :=
[
  term ((27648 : Rat) / 103) [(1, 1), (5, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-13824 : Rat) / 103) [(1, 1), (5, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-13824 : Rat) / 103) [(1, 1), (5, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-27648 : Rat) / 103) [(1, 1), (5, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((13824 : Rat) / 103) [(1, 1), (5, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((13824 : Rat) / 103) [(1, 1), (5, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 4. -/
theorem rs_R013_ueqv_R013NNYN_partial_04_0017_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_04_0017
        rs_R013_ueqv_R013NNYN_generator_04_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_04_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013NNYN_coefficient_04_0018 : Poly :=
[
  term ((21888 : Rat) / 103) [(1, 1), (5, 1), (15, 2), (16, 1)]
]

/-- Partial product 18 for generator 4. -/
def rs_R013_ueqv_R013NNYN_partial_04_0018 : Poly :=
[
  term ((-43776 : Rat) / 103) [(1, 1), (5, 1), (6, 1), (15, 2), (16, 1)],
  term ((21888 : Rat) / 103) [(1, 1), (5, 1), (6, 2), (15, 2), (16, 1)],
  term ((21888 : Rat) / 103) [(1, 1), (5, 1), (7, 2), (15, 2), (16, 1)],
  term ((43776 : Rat) / 103) [(1, 1), (5, 1), (12, 1), (15, 2), (16, 1)],
  term ((-21888 : Rat) / 103) [(1, 1), (5, 1), (12, 2), (15, 2), (16, 1)],
  term ((-21888 : Rat) / 103) [(1, 1), (5, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 4. -/
theorem rs_R013_ueqv_R013NNYN_partial_04_0018_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_04_0018
        rs_R013_ueqv_R013NNYN_generator_04_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_04_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013NNYN_coefficient_04_0019 : Poly :=
[
  term ((2304 : Rat) / 103) [(1, 1), (7, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 19 for generator 4. -/
def rs_R013_ueqv_R013NNYN_partial_04_0019 : Poly :=
[
  term ((-4608 : Rat) / 103) [(1, 1), (6, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((2304 : Rat) / 103) [(1, 1), (6, 2), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((4608 : Rat) / 103) [(1, 1), (7, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-2304 : Rat) / 103) [(1, 1), (7, 1), (9, 1), (12, 2), (13, 1), (16, 1)],
  term ((-2304 : Rat) / 103) [(1, 1), (7, 1), (9, 1), (13, 3), (16, 1)],
  term ((2304 : Rat) / 103) [(1, 1), (7, 3), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 4. -/
theorem rs_R013_ueqv_R013NNYN_partial_04_0019_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_04_0019
        rs_R013_ueqv_R013NNYN_generator_04_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_04_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013NNYN_coefficient_04_0020 : Poly :=
[
  term ((-3648 : Rat) / 103) [(1, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 20 for generator 4. -/
def rs_R013_ueqv_R013NNYN_partial_04_0020 : Poly :=
[
  term ((7296 : Rat) / 103) [(1, 1), (6, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-3648 : Rat) / 103) [(1, 1), (6, 2), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-7296 : Rat) / 103) [(1, 1), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((3648 : Rat) / 103) [(1, 1), (7, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((3648 : Rat) / 103) [(1, 1), (7, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-3648 : Rat) / 103) [(1, 1), (7, 3), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 4. -/
theorem rs_R013_ueqv_R013NNYN_partial_04_0020_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_04_0020
        rs_R013_ueqv_R013NNYN_generator_04_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_04_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013NNYN_coefficient_04_0021 : Poly :=
[
  term ((-4608 : Rat) / 103) [(1, 1), (7, 2), (13, 1), (16, 1)]
]

/-- Partial product 21 for generator 4. -/
def rs_R013_ueqv_R013NNYN_partial_04_0021 : Poly :=
[
  term ((9216 : Rat) / 103) [(1, 1), (6, 1), (7, 2), (13, 1), (16, 1)],
  term ((-4608 : Rat) / 103) [(1, 1), (6, 2), (7, 2), (13, 1), (16, 1)],
  term ((-9216 : Rat) / 103) [(1, 1), (7, 2), (12, 1), (13, 1), (16, 1)],
  term ((4608 : Rat) / 103) [(1, 1), (7, 2), (12, 2), (13, 1), (16, 1)],
  term ((4608 : Rat) / 103) [(1, 1), (7, 2), (13, 3), (16, 1)],
  term ((-4608 : Rat) / 103) [(1, 1), (7, 4), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 4. -/
theorem rs_R013_ueqv_R013NNYN_partial_04_0021_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_04_0021
        rs_R013_ueqv_R013NNYN_generator_04_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_04_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013NNYN_coefficient_04_0022 : Poly :=
[
  term ((7296 : Rat) / 103) [(1, 1), (7, 2), (15, 1), (16, 1)]
]

/-- Partial product 22 for generator 4. -/
def rs_R013_ueqv_R013NNYN_partial_04_0022 : Poly :=
[
  term ((-14592 : Rat) / 103) [(1, 1), (6, 1), (7, 2), (15, 1), (16, 1)],
  term ((7296 : Rat) / 103) [(1, 1), (6, 2), (7, 2), (15, 1), (16, 1)],
  term ((14592 : Rat) / 103) [(1, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((-7296 : Rat) / 103) [(1, 1), (7, 2), (12, 2), (15, 1), (16, 1)],
  term ((-7296 : Rat) / 103) [(1, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((7296 : Rat) / 103) [(1, 1), (7, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 4. -/
theorem rs_R013_ueqv_R013NNYN_partial_04_0022_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_04_0022
        rs_R013_ueqv_R013NNYN_generator_04_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_04_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013NNYN_coefficient_04_0023 : Poly :=
[
  term ((-456 : Rat) / 103) [(1, 1), (9, 1), (16, 1)]
]

/-- Partial product 23 for generator 4. -/
def rs_R013_ueqv_R013NNYN_partial_04_0023 : Poly :=
[
  term ((912 : Rat) / 103) [(1, 1), (6, 1), (9, 1), (16, 1)],
  term ((-456 : Rat) / 103) [(1, 1), (6, 2), (9, 1), (16, 1)],
  term ((-456 : Rat) / 103) [(1, 1), (7, 2), (9, 1), (16, 1)],
  term ((-912 : Rat) / 103) [(1, 1), (9, 1), (12, 1), (16, 1)],
  term ((456 : Rat) / 103) [(1, 1), (9, 1), (12, 2), (16, 1)],
  term ((456 : Rat) / 103) [(1, 1), (9, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 4. -/
theorem rs_R013_ueqv_R013NNYN_partial_04_0023_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_04_0023
        rs_R013_ueqv_R013NNYN_generator_04_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_04_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013NNYN_coefficient_04_0024 : Poly :=
[
  term ((3456 : Rat) / 103) [(1, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 24 for generator 4. -/
def rs_R013_ueqv_R013NNYN_partial_04_0024 : Poly :=
[
  term ((-6912 : Rat) / 103) [(1, 1), (6, 1), (13, 1), (14, 1), (16, 1)],
  term ((3456 : Rat) / 103) [(1, 1), (6, 2), (13, 1), (14, 1), (16, 1)],
  term ((3456 : Rat) / 103) [(1, 1), (7, 2), (13, 1), (14, 1), (16, 1)],
  term ((6912 : Rat) / 103) [(1, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3456 : Rat) / 103) [(1, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-3456 : Rat) / 103) [(1, 1), (13, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 4. -/
theorem rs_R013_ueqv_R013NNYN_partial_04_0024_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_04_0024
        rs_R013_ueqv_R013NNYN_generator_04_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_04_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013NNYN_coefficient_04_0025 : Poly :=
[
  term ((48 : Rat) / 103) [(1, 1), (13, 1), (16, 1)]
]

/-- Partial product 25 for generator 4. -/
def rs_R013_ueqv_R013NNYN_partial_04_0025 : Poly :=
[
  term ((-96 : Rat) / 103) [(1, 1), (6, 1), (13, 1), (16, 1)],
  term ((48 : Rat) / 103) [(1, 1), (6, 2), (13, 1), (16, 1)],
  term ((48 : Rat) / 103) [(1, 1), (7, 2), (13, 1), (16, 1)],
  term ((96 : Rat) / 103) [(1, 1), (12, 1), (13, 1), (16, 1)],
  term ((-48 : Rat) / 103) [(1, 1), (12, 2), (13, 1), (16, 1)],
  term ((-48 : Rat) / 103) [(1, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 4. -/
theorem rs_R013_ueqv_R013NNYN_partial_04_0025_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_04_0025
        rs_R013_ueqv_R013NNYN_generator_04_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_04_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013NNYN_coefficient_04_0026 : Poly :=
[
  term ((-5472 : Rat) / 103) [(1, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 26 for generator 4. -/
def rs_R013_ueqv_R013NNYN_partial_04_0026 : Poly :=
[
  term ((10944 : Rat) / 103) [(1, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5472 : Rat) / 103) [(1, 1), (6, 2), (14, 1), (15, 1), (16, 1)],
  term ((-5472 : Rat) / 103) [(1, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((-10944 : Rat) / 103) [(1, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((5472 : Rat) / 103) [(1, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((5472 : Rat) / 103) [(1, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 4. -/
theorem rs_R013_ueqv_R013NNYN_partial_04_0026_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_04_0026
        rs_R013_ueqv_R013NNYN_generator_04_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_04_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013NNYN_coefficient_04_0027 : Poly :=
[
  term ((1368 : Rat) / 103) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 27 for generator 4. -/
def rs_R013_ueqv_R013NNYN_partial_04_0027 : Poly :=
[
  term ((-2736 : Rat) / 103) [(1, 1), (6, 1), (15, 1), (16, 1)],
  term ((1368 : Rat) / 103) [(1, 1), (6, 2), (15, 1), (16, 1)],
  term ((1368 : Rat) / 103) [(1, 1), (7, 2), (15, 1), (16, 1)],
  term ((2736 : Rat) / 103) [(1, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1368 : Rat) / 103) [(1, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1368 : Rat) / 103) [(1, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 4. -/
theorem rs_R013_ueqv_R013NNYN_partial_04_0027_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_04_0027
        rs_R013_ueqv_R013NNYN_generator_04_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_04_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013NNYN_coefficient_04_0028 : Poly :=
[
  term ((-288 : Rat) / 103) [(4, 1), (12, 1), (16, 1)]
]

/-- Partial product 28 for generator 4. -/
def rs_R013_ueqv_R013NNYN_partial_04_0028 : Poly :=
[
  term ((576 : Rat) / 103) [(4, 1), (6, 1), (12, 1), (16, 1)],
  term ((-288 : Rat) / 103) [(4, 1), (6, 2), (12, 1), (16, 1)],
  term ((-288 : Rat) / 103) [(4, 1), (7, 2), (12, 1), (16, 1)],
  term ((288 : Rat) / 103) [(4, 1), (12, 1), (13, 2), (16, 1)],
  term ((-576 : Rat) / 103) [(4, 1), (12, 2), (16, 1)],
  term ((288 : Rat) / 103) [(4, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 4. -/
theorem rs_R013_ueqv_R013NNYN_partial_04_0028_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_04_0028
        rs_R013_ueqv_R013NNYN_generator_04_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_04_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013NNYN_coefficient_04_0029 : Poly :=
[
  term ((1728 : Rat) / 103) [(4, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 29 for generator 4. -/
def rs_R013_ueqv_R013NNYN_partial_04_0029 : Poly :=
[
  term ((-3456 : Rat) / 103) [(4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((1728 : Rat) / 103) [(4, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((1728 : Rat) / 103) [(4, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((3456 : Rat) / 103) [(4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1728 : Rat) / 103) [(4, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1728 : Rat) / 103) [(4, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 4. -/
theorem rs_R013_ueqv_R013NNYN_partial_04_0029_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_04_0029
        rs_R013_ueqv_R013NNYN_generator_04_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_04_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013NNYN_coefficient_04_0030 : Poly :=
[
  term ((-1152 : Rat) / 103) [(4, 1), (13, 2), (16, 1)]
]

/-- Partial product 30 for generator 4. -/
def rs_R013_ueqv_R013NNYN_partial_04_0030 : Poly :=
[
  term ((2304 : Rat) / 103) [(4, 1), (6, 1), (13, 2), (16, 1)],
  term ((-1152 : Rat) / 103) [(4, 1), (6, 2), (13, 2), (16, 1)],
  term ((-1152 : Rat) / 103) [(4, 1), (7, 2), (13, 2), (16, 1)],
  term ((-2304 : Rat) / 103) [(4, 1), (12, 1), (13, 2), (16, 1)],
  term ((1152 : Rat) / 103) [(4, 1), (12, 2), (13, 2), (16, 1)],
  term ((1152 : Rat) / 103) [(4, 1), (13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 4. -/
theorem rs_R013_ueqv_R013NNYN_partial_04_0030_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_04_0030
        rs_R013_ueqv_R013NNYN_generator_04_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_04_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013NNYN_coefficient_04_0031 : Poly :=
[
  term ((-144 : Rat) / 103) [(4, 1), (14, 1), (16, 1)]
]

/-- Partial product 31 for generator 4. -/
def rs_R013_ueqv_R013NNYN_partial_04_0031 : Poly :=
[
  term ((288 : Rat) / 103) [(4, 1), (6, 1), (14, 1), (16, 1)],
  term ((-144 : Rat) / 103) [(4, 1), (6, 2), (14, 1), (16, 1)],
  term ((-144 : Rat) / 103) [(4, 1), (7, 2), (14, 1), (16, 1)],
  term ((-288 : Rat) / 103) [(4, 1), (12, 1), (14, 1), (16, 1)],
  term ((144 : Rat) / 103) [(4, 1), (12, 2), (14, 1), (16, 1)],
  term ((144 : Rat) / 103) [(4, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 4. -/
theorem rs_R013_ueqv_R013NNYN_partial_04_0031_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_04_0031
        rs_R013_ueqv_R013NNYN_generator_04_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_04_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013NNYN_coefficient_04_0032 : Poly :=
[
  term ((-144 : Rat) / 103) [(4, 1), (16, 1)]
]

/-- Partial product 32 for generator 4. -/
def rs_R013_ueqv_R013NNYN_partial_04_0032 : Poly :=
[
  term ((288 : Rat) / 103) [(4, 1), (6, 1), (16, 1)],
  term ((-144 : Rat) / 103) [(4, 1), (6, 2), (16, 1)],
  term ((-144 : Rat) / 103) [(4, 1), (7, 2), (16, 1)],
  term ((-288 : Rat) / 103) [(4, 1), (12, 1), (16, 1)],
  term ((144 : Rat) / 103) [(4, 1), (12, 2), (16, 1)],
  term ((144 : Rat) / 103) [(4, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 4. -/
theorem rs_R013_ueqv_R013NNYN_partial_04_0032_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_04_0032
        rs_R013_ueqv_R013NNYN_generator_04_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_04_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013NNYN_coefficient_04_0033 : Poly :=
[
  term ((2784 : Rat) / 103) [(5, 1), (7, 1), (16, 1)]
]

/-- Partial product 33 for generator 4. -/
def rs_R013_ueqv_R013NNYN_partial_04_0033 : Poly :=
[
  term ((-5568 : Rat) / 103) [(5, 1), (6, 1), (7, 1), (16, 1)],
  term ((2784 : Rat) / 103) [(5, 1), (6, 2), (7, 1), (16, 1)],
  term ((5568 : Rat) / 103) [(5, 1), (7, 1), (12, 1), (16, 1)],
  term ((-2784 : Rat) / 103) [(5, 1), (7, 1), (12, 2), (16, 1)],
  term ((-2784 : Rat) / 103) [(5, 1), (7, 1), (13, 2), (16, 1)],
  term ((2784 : Rat) / 103) [(5, 1), (7, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 4. -/
theorem rs_R013_ueqv_R013NNYN_partial_04_0033_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_04_0033
        rs_R013_ueqv_R013NNYN_generator_04_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_04_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013NNYN_coefficient_04_0034 : Poly :=
[
  term ((1392 : Rat) / 103) [(5, 1), (9, 1), (16, 1)]
]

/-- Partial product 34 for generator 4. -/
def rs_R013_ueqv_R013NNYN_partial_04_0034 : Poly :=
[
  term ((-2784 : Rat) / 103) [(5, 1), (6, 1), (9, 1), (16, 1)],
  term ((1392 : Rat) / 103) [(5, 1), (6, 2), (9, 1), (16, 1)],
  term ((1392 : Rat) / 103) [(5, 1), (7, 2), (9, 1), (16, 1)],
  term ((2784 : Rat) / 103) [(5, 1), (9, 1), (12, 1), (16, 1)],
  term ((-1392 : Rat) / 103) [(5, 1), (9, 1), (12, 2), (16, 1)],
  term ((-1392 : Rat) / 103) [(5, 1), (9, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 4. -/
theorem rs_R013_ueqv_R013NNYN_partial_04_0034_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_04_0034
        rs_R013_ueqv_R013NNYN_generator_04_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_04_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013NNYN_coefficient_04_0035 : Poly :=
[
  term ((1152 : Rat) / 103) [(5, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 35 for generator 4. -/
def rs_R013_ueqv_R013NNYN_partial_04_0035 : Poly :=
[
  term ((-2304 : Rat) / 103) [(5, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term ((1152 : Rat) / 103) [(5, 1), (6, 2), (12, 1), (13, 1), (16, 1)],
  term ((1152 : Rat) / 103) [(5, 1), (7, 2), (12, 1), (13, 1), (16, 1)],
  term ((-1152 : Rat) / 103) [(5, 1), (12, 1), (13, 3), (16, 1)],
  term ((2304 : Rat) / 103) [(5, 1), (12, 2), (13, 1), (16, 1)],
  term ((-1152 : Rat) / 103) [(5, 1), (12, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 4. -/
theorem rs_R013_ueqv_R013NNYN_partial_04_0035_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_04_0035
        rs_R013_ueqv_R013NNYN_generator_04_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_04_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013NNYN_coefficient_04_0036 : Poly :=
[
  term ((-1152 : Rat) / 103) [(5, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 36 for generator 4. -/
def rs_R013_ueqv_R013NNYN_partial_04_0036 : Poly :=
[
  term ((2304 : Rat) / 103) [(5, 1), (6, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1152 : Rat) / 103) [(5, 1), (6, 2), (13, 1), (14, 1), (16, 1)],
  term ((-1152 : Rat) / 103) [(5, 1), (7, 2), (13, 1), (14, 1), (16, 1)],
  term ((-2304 : Rat) / 103) [(5, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((1152 : Rat) / 103) [(5, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((1152 : Rat) / 103) [(5, 1), (13, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 4. -/
theorem rs_R013_ueqv_R013NNYN_partial_04_0036_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_04_0036
        rs_R013_ueqv_R013NNYN_generator_04_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_04_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013NNYN_coefficient_04_0037 : Poly :=
[
  term ((864 : Rat) / 103) [(5, 1), (13, 1), (16, 1)]
]

/-- Partial product 37 for generator 4. -/
def rs_R013_ueqv_R013NNYN_partial_04_0037 : Poly :=
[
  term ((-1728 : Rat) / 103) [(5, 1), (6, 1), (13, 1), (16, 1)],
  term ((864 : Rat) / 103) [(5, 1), (6, 2), (13, 1), (16, 1)],
  term ((864 : Rat) / 103) [(5, 1), (7, 2), (13, 1), (16, 1)],
  term ((1728 : Rat) / 103) [(5, 1), (12, 1), (13, 1), (16, 1)],
  term ((-864 : Rat) / 103) [(5, 1), (12, 2), (13, 1), (16, 1)],
  term ((-864 : Rat) / 103) [(5, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 4. -/
theorem rs_R013_ueqv_R013NNYN_partial_04_0037_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_04_0037
        rs_R013_ueqv_R013NNYN_generator_04_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_04_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013NNYN_coefficient_04_0038 : Poly :=
[
  term ((-2784 : Rat) / 103) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 38 for generator 4. -/
def rs_R013_ueqv_R013NNYN_partial_04_0038 : Poly :=
[
  term ((5568 : Rat) / 103) [(5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-2784 : Rat) / 103) [(5, 1), (6, 2), (15, 1), (16, 1)],
  term ((-2784 : Rat) / 103) [(5, 1), (7, 2), (15, 1), (16, 1)],
  term ((-5568 : Rat) / 103) [(5, 1), (12, 1), (15, 1), (16, 1)],
  term ((2784 : Rat) / 103) [(5, 1), (12, 2), (15, 1), (16, 1)],
  term ((2784 : Rat) / 103) [(5, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 4. -/
theorem rs_R013_ueqv_R013NNYN_partial_04_0038_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_04_0038
        rs_R013_ueqv_R013NNYN_generator_04_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_04_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013NNYN_coefficient_04_0039 : Poly :=
[
  term ((-384 : Rat) / 103) [(7, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 39 for generator 4. -/
def rs_R013_ueqv_R013NNYN_partial_04_0039 : Poly :=
[
  term ((768 : Rat) / 103) [(6, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-384 : Rat) / 103) [(6, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-768 : Rat) / 103) [(7, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((384 : Rat) / 103) [(7, 1), (9, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((384 : Rat) / 103) [(7, 1), (9, 1), (13, 3), (15, 1), (16, 1)],
  term ((-384 : Rat) / 103) [(7, 3), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 4. -/
theorem rs_R013_ueqv_R013NNYN_partial_04_0039_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_04_0039
        rs_R013_ueqv_R013NNYN_generator_04_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_04_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013NNYN_coefficient_04_0040 : Poly :=
[
  term ((704 : Rat) / 103) [(7, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 40 for generator 4. -/
def rs_R013_ueqv_R013NNYN_partial_04_0040 : Poly :=
[
  term ((-1408 : Rat) / 103) [(6, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((704 : Rat) / 103) [(6, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((1408 : Rat) / 103) [(7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-704 : Rat) / 103) [(7, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-704 : Rat) / 103) [(7, 1), (13, 3), (14, 1), (16, 1)],
  term ((704 : Rat) / 103) [(7, 3), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 4. -/
theorem rs_R013_ueqv_R013NNYN_partial_04_0040_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_04_0040
        rs_R013_ueqv_R013NNYN_generator_04_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_04_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013NNYN_coefficient_04_0041 : Poly :=
[
  term ((-576 : Rat) / 103) [(7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 41 for generator 4. -/
def rs_R013_ueqv_R013NNYN_partial_04_0041 : Poly :=
[
  term ((1152 : Rat) / 103) [(6, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-576 : Rat) / 103) [(6, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1152 : Rat) / 103) [(7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((576 : Rat) / 103) [(7, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((576 : Rat) / 103) [(7, 1), (13, 3), (15, 2), (16, 1)],
  term ((-576 : Rat) / 103) [(7, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 4. -/
theorem rs_R013_ueqv_R013NNYN_partial_04_0041_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_04_0041
        rs_R013_ueqv_R013NNYN_generator_04_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_04_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013NNYN_coefficient_04_0042 : Poly :=
[
  term ((224 : Rat) / 103) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 42 for generator 4. -/
def rs_R013_ueqv_R013NNYN_partial_04_0042 : Poly :=
[
  term ((-448 : Rat) / 103) [(6, 1), (7, 1), (13, 1), (16, 1)],
  term ((224 : Rat) / 103) [(6, 2), (7, 1), (13, 1), (16, 1)],
  term ((448 : Rat) / 103) [(7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-224 : Rat) / 103) [(7, 1), (12, 2), (13, 1), (16, 1)],
  term ((-224 : Rat) / 103) [(7, 1), (13, 3), (16, 1)],
  term ((224 : Rat) / 103) [(7, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 4. -/
theorem rs_R013_ueqv_R013NNYN_partial_04_0042_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_04_0042
        rs_R013_ueqv_R013NNYN_generator_04_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_04_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013NNYN_coefficient_04_0043 : Poly :=
[
  term ((-912 : Rat) / 103) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 43 for generator 4. -/
def rs_R013_ueqv_R013NNYN_partial_04_0043 : Poly :=
[
  term ((1824 : Rat) / 103) [(6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-912 : Rat) / 103) [(6, 2), (7, 1), (15, 1), (16, 1)],
  term ((-1824 : Rat) / 103) [(7, 1), (12, 1), (15, 1), (16, 1)],
  term ((912 : Rat) / 103) [(7, 1), (12, 2), (15, 1), (16, 1)],
  term ((912 : Rat) / 103) [(7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-912 : Rat) / 103) [(7, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 4. -/
theorem rs_R013_ueqv_R013NNYN_partial_04_0043_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_04_0043
        rs_R013_ueqv_R013NNYN_generator_04_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_04_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013NNYN_coefficient_04_0044 : Poly :=
[
  term ((768 : Rat) / 103) [(7, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 44 for generator 4. -/
def rs_R013_ueqv_R013NNYN_partial_04_0044 : Poly :=
[
  term ((-1536 : Rat) / 103) [(6, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((768 : Rat) / 103) [(6, 2), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((1536 : Rat) / 103) [(7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-768 : Rat) / 103) [(7, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-768 : Rat) / 103) [(7, 2), (13, 3), (15, 1), (16, 1)],
  term ((768 : Rat) / 103) [(7, 4), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 4. -/
theorem rs_R013_ueqv_R013NNYN_partial_04_0044_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_04_0044
        rs_R013_ueqv_R013NNYN_generator_04_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_04_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013NNYN_coefficient_04_0045 : Poly :=
[
  term ((-288 : Rat) / 103) [(9, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 45 for generator 4. -/
def rs_R013_ueqv_R013NNYN_partial_04_0045 : Poly :=
[
  term ((576 : Rat) / 103) [(6, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-288 : Rat) / 103) [(6, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-288 : Rat) / 103) [(7, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((288 : Rat) / 103) [(9, 1), (12, 1), (13, 3), (16, 1)],
  term ((-576 : Rat) / 103) [(9, 1), (12, 2), (13, 1), (16, 1)],
  term ((288 : Rat) / 103) [(9, 1), (12, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 4. -/
theorem rs_R013_ueqv_R013NNYN_partial_04_0045_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_04_0045
        rs_R013_ueqv_R013NNYN_generator_04_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_04_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013NNYN_coefficient_04_0046 : Poly :=
[
  term ((-256 : Rat) / 103) [(9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 46 for generator 4. -/
def rs_R013_ueqv_R013NNYN_partial_04_0046 : Poly :=
[
  term ((512 : Rat) / 103) [(6, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-256 : Rat) / 103) [(6, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-256 : Rat) / 103) [(7, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-512 : Rat) / 103) [(9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((256 : Rat) / 103) [(9, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((256 : Rat) / 103) [(9, 1), (13, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 4. -/
theorem rs_R013_ueqv_R013NNYN_partial_04_0046_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_04_0046
        rs_R013_ueqv_R013NNYN_generator_04_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_04_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013NNYN_coefficient_04_0047 : Poly :=
[
  term ((288 : Rat) / 103) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 47 for generator 4. -/
def rs_R013_ueqv_R013NNYN_partial_04_0047 : Poly :=
[
  term ((-576 : Rat) / 103) [(6, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((288 : Rat) / 103) [(6, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((288 : Rat) / 103) [(7, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((576 : Rat) / 103) [(9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-288 : Rat) / 103) [(9, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-288 : Rat) / 103) [(9, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 4. -/
theorem rs_R013_ueqv_R013NNYN_partial_04_0047_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_04_0047
        rs_R013_ueqv_R013NNYN_generator_04_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_04_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013NNYN_coefficient_04_0048 : Poly :=
[
  term ((-848 : Rat) / 103) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 48 for generator 4. -/
def rs_R013_ueqv_R013NNYN_partial_04_0048 : Poly :=
[
  term ((1696 : Rat) / 103) [(6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-848 : Rat) / 103) [(6, 2), (9, 1), (13, 1), (16, 1)],
  term ((-848 : Rat) / 103) [(7, 2), (9, 1), (13, 1), (16, 1)],
  term ((-1696 : Rat) / 103) [(9, 1), (12, 1), (13, 1), (16, 1)],
  term ((848 : Rat) / 103) [(9, 1), (12, 2), (13, 1), (16, 1)],
  term ((848 : Rat) / 103) [(9, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 4. -/
theorem rs_R013_ueqv_R013NNYN_partial_04_0048_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_04_0048
        rs_R013_ueqv_R013NNYN_generator_04_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_04_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013NNYN_coefficient_04_0049 : Poly :=
[
  term ((456 : Rat) / 103) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 49 for generator 4. -/
def rs_R013_ueqv_R013NNYN_partial_04_0049 : Poly :=
[
  term ((-912 : Rat) / 103) [(6, 1), (9, 1), (15, 1), (16, 1)],
  term ((456 : Rat) / 103) [(6, 2), (9, 1), (15, 1), (16, 1)],
  term ((456 : Rat) / 103) [(7, 2), (9, 1), (15, 1), (16, 1)],
  term ((912 : Rat) / 103) [(9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-456 : Rat) / 103) [(9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-456 : Rat) / 103) [(9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 4. -/
theorem rs_R013_ueqv_R013NNYN_partial_04_0049_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_04_0049
        rs_R013_ueqv_R013NNYN_generator_04_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_04_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013NNYN_coefficient_04_0050 : Poly :=
[
  term ((-864 : Rat) / 103) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 50 for generator 4. -/
def rs_R013_ueqv_R013NNYN_partial_04_0050 : Poly :=
[
  term ((1728 : Rat) / 103) [(6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-864 : Rat) / 103) [(6, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-864 : Rat) / 103) [(7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((864 : Rat) / 103) [(12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-1728 : Rat) / 103) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((864 : Rat) / 103) [(12, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 4. -/
theorem rs_R013_ueqv_R013NNYN_partial_04_0050_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_04_0050
        rs_R013_ueqv_R013NNYN_generator_04_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_04_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013NNYN_coefficient_04_0051 : Poly :=
[
  term ((-624 : Rat) / 103) [(12, 1), (14, 1), (16, 1)]
]

/-- Partial product 51 for generator 4. -/
def rs_R013_ueqv_R013NNYN_partial_04_0051 : Poly :=
[
  term ((1248 : Rat) / 103) [(6, 1), (12, 1), (14, 1), (16, 1)],
  term ((-624 : Rat) / 103) [(6, 2), (12, 1), (14, 1), (16, 1)],
  term ((-624 : Rat) / 103) [(7, 2), (12, 1), (14, 1), (16, 1)],
  term ((624 : Rat) / 103) [(12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-1248 : Rat) / 103) [(12, 2), (14, 1), (16, 1)],
  term ((624 : Rat) / 103) [(12, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 4. -/
theorem rs_R013_ueqv_R013NNYN_partial_04_0051_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_04_0051
        rs_R013_ueqv_R013NNYN_generator_04_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_04_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013NNYN_coefficient_04_0052 : Poly :=
[
  term ((216 : Rat) / 103) [(12, 1), (16, 1)]
]

/-- Partial product 52 for generator 4. -/
def rs_R013_ueqv_R013NNYN_partial_04_0052 : Poly :=
[
  term ((-432 : Rat) / 103) [(6, 1), (12, 1), (16, 1)],
  term ((216 : Rat) / 103) [(6, 2), (12, 1), (16, 1)],
  term ((216 : Rat) / 103) [(7, 2), (12, 1), (16, 1)],
  term ((-216 : Rat) / 103) [(12, 1), (13, 2), (16, 1)],
  term ((432 : Rat) / 103) [(12, 2), (16, 1)],
  term ((-216 : Rat) / 103) [(12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 4. -/
theorem rs_R013_ueqv_R013NNYN_partial_04_0052_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_04_0052
        rs_R013_ueqv_R013NNYN_generator_04_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_04_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013NNYN_coefficient_04_0053 : Poly :=
[
  term ((-432 : Rat) / 103) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 53 for generator 4. -/
def rs_R013_ueqv_R013NNYN_partial_04_0053 : Poly :=
[
  term ((864 : Rat) / 103) [(6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-432 : Rat) / 103) [(6, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-432 : Rat) / 103) [(7, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-864 : Rat) / 103) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((432 : Rat) / 103) [(12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((432 : Rat) / 103) [(13, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 4. -/
theorem rs_R013_ueqv_R013NNYN_partial_04_0053_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_04_0053
        rs_R013_ueqv_R013NNYN_generator_04_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_04_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013NNYN_coefficient_04_0054 : Poly :=
[
  term ((-992 : Rat) / 103) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 54 for generator 4. -/
def rs_R013_ueqv_R013NNYN_partial_04_0054 : Poly :=
[
  term ((1984 : Rat) / 103) [(6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-992 : Rat) / 103) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-992 : Rat) / 103) [(7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1984 : Rat) / 103) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((992 : Rat) / 103) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((992 : Rat) / 103) [(13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 4. -/
theorem rs_R013_ueqv_R013NNYN_partial_04_0054_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_04_0054
        rs_R013_ueqv_R013NNYN_generator_04_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_04_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013NNYN_coefficient_04_0055 : Poly :=
[
  term ((864 : Rat) / 103) [(13, 2), (14, 1), (16, 1)]
]

/-- Partial product 55 for generator 4. -/
def rs_R013_ueqv_R013NNYN_partial_04_0055 : Poly :=
[
  term ((-1728 : Rat) / 103) [(6, 1), (13, 2), (14, 1), (16, 1)],
  term ((864 : Rat) / 103) [(6, 2), (13, 2), (14, 1), (16, 1)],
  term ((864 : Rat) / 103) [(7, 2), (13, 2), (14, 1), (16, 1)],
  term ((1728 : Rat) / 103) [(12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-864 : Rat) / 103) [(12, 2), (13, 2), (14, 1), (16, 1)],
  term ((-864 : Rat) / 103) [(13, 4), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 4. -/
theorem rs_R013_ueqv_R013NNYN_partial_04_0055_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_04_0055
        rs_R013_ueqv_R013NNYN_generator_04_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_04_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013NNYN_coefficient_04_0056 : Poly :=
[
  term ((144 : Rat) / 103) [(13, 2), (16, 1)]
]

/-- Partial product 56 for generator 4. -/
def rs_R013_ueqv_R013NNYN_partial_04_0056 : Poly :=
[
  term ((-288 : Rat) / 103) [(6, 1), (13, 2), (16, 1)],
  term ((144 : Rat) / 103) [(6, 2), (13, 2), (16, 1)],
  term ((144 : Rat) / 103) [(7, 2), (13, 2), (16, 1)],
  term ((288 : Rat) / 103) [(12, 1), (13, 2), (16, 1)],
  term ((-144 : Rat) / 103) [(12, 2), (13, 2), (16, 1)],
  term ((-144 : Rat) / 103) [(13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 4. -/
theorem rs_R013_ueqv_R013NNYN_partial_04_0056_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_04_0056
        rs_R013_ueqv_R013NNYN_generator_04_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_04_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013NNYN_coefficient_04_0057 : Poly :=
[
  term ((1932 : Rat) / 103) [(14, 1), (16, 1)]
]

/-- Partial product 57 for generator 4. -/
def rs_R013_ueqv_R013NNYN_partial_04_0057 : Poly :=
[
  term ((-3864 : Rat) / 103) [(6, 1), (14, 1), (16, 1)],
  term ((1932 : Rat) / 103) [(6, 2), (14, 1), (16, 1)],
  term ((1932 : Rat) / 103) [(7, 2), (14, 1), (16, 1)],
  term ((3864 : Rat) / 103) [(12, 1), (14, 1), (16, 1)],
  term ((-1932 : Rat) / 103) [(12, 2), (14, 1), (16, 1)],
  term ((-1932 : Rat) / 103) [(13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 4. -/
theorem rs_R013_ueqv_R013NNYN_partial_04_0057_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_04_0057
        rs_R013_ueqv_R013NNYN_generator_04_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_04_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013NNYN_coefficient_04_0058 : Poly :=
[
  term ((-312 : Rat) / 103) [(14, 2), (16, 1)]
]

/-- Partial product 58 for generator 4. -/
def rs_R013_ueqv_R013NNYN_partial_04_0058 : Poly :=
[
  term ((624 : Rat) / 103) [(6, 1), (14, 2), (16, 1)],
  term ((-312 : Rat) / 103) [(6, 2), (14, 2), (16, 1)],
  term ((-312 : Rat) / 103) [(7, 2), (14, 2), (16, 1)],
  term ((-624 : Rat) / 103) [(12, 1), (14, 2), (16, 1)],
  term ((312 : Rat) / 103) [(12, 2), (14, 2), (16, 1)],
  term ((312 : Rat) / 103) [(13, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 4. -/
theorem rs_R013_ueqv_R013NNYN_partial_04_0058_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_04_0058
        rs_R013_ueqv_R013NNYN_generator_04_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_04_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013NNYN_coefficient_04_0059 : Poly :=
[
  term ((-456 : Rat) / 103) [(15, 2), (16, 1)]
]

/-- Partial product 59 for generator 4. -/
def rs_R013_ueqv_R013NNYN_partial_04_0059 : Poly :=
[
  term ((912 : Rat) / 103) [(6, 1), (15, 2), (16, 1)],
  term ((-456 : Rat) / 103) [(6, 2), (15, 2), (16, 1)],
  term ((-456 : Rat) / 103) [(7, 2), (15, 2), (16, 1)],
  term ((-912 : Rat) / 103) [(12, 1), (15, 2), (16, 1)],
  term ((456 : Rat) / 103) [(12, 2), (15, 2), (16, 1)],
  term ((456 : Rat) / 103) [(13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 4. -/
theorem rs_R013_ueqv_R013NNYN_partial_04_0059_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_04_0059
        rs_R013_ueqv_R013NNYN_generator_04_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_04_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 4. -/
def rs_R013_ueqv_R013NNYN_coefficient_04_0060 : Poly :=
[
  term ((-660 : Rat) / 103) [(16, 1)]
]

/-- Partial product 60 for generator 4. -/
def rs_R013_ueqv_R013NNYN_partial_04_0060 : Poly :=
[
  term ((1320 : Rat) / 103) [(6, 1), (16, 1)],
  term ((-660 : Rat) / 103) [(6, 2), (16, 1)],
  term ((-660 : Rat) / 103) [(7, 2), (16, 1)],
  term ((-1320 : Rat) / 103) [(12, 1), (16, 1)],
  term ((660 : Rat) / 103) [(12, 2), (16, 1)],
  term ((660 : Rat) / 103) [(13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 4. -/
theorem rs_R013_ueqv_R013NNYN_partial_04_0060_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_04_0060
        rs_R013_ueqv_R013NNYN_generator_04_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_04_0060 := by
  native_decide

/-- Partial products in this block. -/
def rs_R013_ueqv_R013NNYN_partials_04_0000_0060 : List Poly :=
[
  rs_R013_ueqv_R013NNYN_partial_04_0000,
  rs_R013_ueqv_R013NNYN_partial_04_0001,
  rs_R013_ueqv_R013NNYN_partial_04_0002,
  rs_R013_ueqv_R013NNYN_partial_04_0003,
  rs_R013_ueqv_R013NNYN_partial_04_0004,
  rs_R013_ueqv_R013NNYN_partial_04_0005,
  rs_R013_ueqv_R013NNYN_partial_04_0006,
  rs_R013_ueqv_R013NNYN_partial_04_0007,
  rs_R013_ueqv_R013NNYN_partial_04_0008,
  rs_R013_ueqv_R013NNYN_partial_04_0009,
  rs_R013_ueqv_R013NNYN_partial_04_0010,
  rs_R013_ueqv_R013NNYN_partial_04_0011,
  rs_R013_ueqv_R013NNYN_partial_04_0012,
  rs_R013_ueqv_R013NNYN_partial_04_0013,
  rs_R013_ueqv_R013NNYN_partial_04_0014,
  rs_R013_ueqv_R013NNYN_partial_04_0015,
  rs_R013_ueqv_R013NNYN_partial_04_0016,
  rs_R013_ueqv_R013NNYN_partial_04_0017,
  rs_R013_ueqv_R013NNYN_partial_04_0018,
  rs_R013_ueqv_R013NNYN_partial_04_0019,
  rs_R013_ueqv_R013NNYN_partial_04_0020,
  rs_R013_ueqv_R013NNYN_partial_04_0021,
  rs_R013_ueqv_R013NNYN_partial_04_0022,
  rs_R013_ueqv_R013NNYN_partial_04_0023,
  rs_R013_ueqv_R013NNYN_partial_04_0024,
  rs_R013_ueqv_R013NNYN_partial_04_0025,
  rs_R013_ueqv_R013NNYN_partial_04_0026,
  rs_R013_ueqv_R013NNYN_partial_04_0027,
  rs_R013_ueqv_R013NNYN_partial_04_0028,
  rs_R013_ueqv_R013NNYN_partial_04_0029,
  rs_R013_ueqv_R013NNYN_partial_04_0030,
  rs_R013_ueqv_R013NNYN_partial_04_0031,
  rs_R013_ueqv_R013NNYN_partial_04_0032,
  rs_R013_ueqv_R013NNYN_partial_04_0033,
  rs_R013_ueqv_R013NNYN_partial_04_0034,
  rs_R013_ueqv_R013NNYN_partial_04_0035,
  rs_R013_ueqv_R013NNYN_partial_04_0036,
  rs_R013_ueqv_R013NNYN_partial_04_0037,
  rs_R013_ueqv_R013NNYN_partial_04_0038,
  rs_R013_ueqv_R013NNYN_partial_04_0039,
  rs_R013_ueqv_R013NNYN_partial_04_0040,
  rs_R013_ueqv_R013NNYN_partial_04_0041,
  rs_R013_ueqv_R013NNYN_partial_04_0042,
  rs_R013_ueqv_R013NNYN_partial_04_0043,
  rs_R013_ueqv_R013NNYN_partial_04_0044,
  rs_R013_ueqv_R013NNYN_partial_04_0045,
  rs_R013_ueqv_R013NNYN_partial_04_0046,
  rs_R013_ueqv_R013NNYN_partial_04_0047,
  rs_R013_ueqv_R013NNYN_partial_04_0048,
  rs_R013_ueqv_R013NNYN_partial_04_0049,
  rs_R013_ueqv_R013NNYN_partial_04_0050,
  rs_R013_ueqv_R013NNYN_partial_04_0051,
  rs_R013_ueqv_R013NNYN_partial_04_0052,
  rs_R013_ueqv_R013NNYN_partial_04_0053,
  rs_R013_ueqv_R013NNYN_partial_04_0054,
  rs_R013_ueqv_R013NNYN_partial_04_0055,
  rs_R013_ueqv_R013NNYN_partial_04_0056,
  rs_R013_ueqv_R013NNYN_partial_04_0057,
  rs_R013_ueqv_R013NNYN_partial_04_0058,
  rs_R013_ueqv_R013NNYN_partial_04_0059,
  rs_R013_ueqv_R013NNYN_partial_04_0060
]

/-- Sum of partial products in this block. -/
def rs_R013_ueqv_R013NNYN_block_04_0000_0060 : Poly :=
[
  term ((-1152 : Rat) / 103) [(0, 1), (4, 1), (6, 1), (16, 1)],
  term ((576 : Rat) / 103) [(0, 1), (4, 1), (6, 2), (16, 1)],
  term ((576 : Rat) / 103) [(0, 1), (4, 1), (7, 2), (16, 1)],
  term ((1152 : Rat) / 103) [(0, 1), (4, 1), (12, 1), (16, 1)],
  term ((-576 : Rat) / 103) [(0, 1), (4, 1), (12, 2), (16, 1)],
  term ((-576 : Rat) / 103) [(0, 1), (4, 1), (13, 2), (16, 1)],
  term ((4992 : Rat) / 103) [(0, 1), (5, 1), (6, 1), (7, 1), (16, 1)],
  term ((2496 : Rat) / 103) [(0, 1), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((1152 : Rat) / 103) [(0, 1), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((-4992 : Rat) / 103) [(0, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-2496 : Rat) / 103) [(0, 1), (5, 1), (6, 2), (7, 1), (16, 1)],
  term ((-1248 : Rat) / 103) [(0, 1), (5, 1), (6, 2), (9, 1), (16, 1)],
  term ((-576 : Rat) / 103) [(0, 1), (5, 1), (6, 2), (13, 1), (16, 1)],
  term ((2496 : Rat) / 103) [(0, 1), (5, 1), (6, 2), (15, 1), (16, 1)],
  term ((-4992 : Rat) / 103) [(0, 1), (5, 1), (7, 1), (12, 1), (16, 1)],
  term ((2496 : Rat) / 103) [(0, 1), (5, 1), (7, 1), (12, 2), (16, 1)],
  term ((2496 : Rat) / 103) [(0, 1), (5, 1), (7, 1), (13, 2), (16, 1)],
  term ((-1248 : Rat) / 103) [(0, 1), (5, 1), (7, 2), (9, 1), (16, 1)],
  term ((-576 : Rat) / 103) [(0, 1), (5, 1), (7, 2), (13, 1), (16, 1)],
  term ((2496 : Rat) / 103) [(0, 1), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((-2496 : Rat) / 103) [(0, 1), (5, 1), (7, 3), (16, 1)],
  term ((-2496 : Rat) / 103) [(0, 1), (5, 1), (9, 1), (12, 1), (16, 1)],
  term ((1248 : Rat) / 103) [(0, 1), (5, 1), (9, 1), (12, 2), (16, 1)],
  term ((1248 : Rat) / 103) [(0, 1), (5, 1), (9, 1), (13, 2), (16, 1)],
  term ((-1152 : Rat) / 103) [(0, 1), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((4992 : Rat) / 103) [(0, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((576 : Rat) / 103) [(0, 1), (5, 1), (12, 2), (13, 1), (16, 1)],
  term ((-2496 : Rat) / 103) [(0, 1), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((-2496 : Rat) / 103) [(0, 1), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((576 : Rat) / 103) [(0, 1), (5, 1), (13, 3), (16, 1)],
  term ((2304 : Rat) / 103) [(0, 1), (6, 1), (7, 1), (13, 1), (16, 1)],
  term ((-3648 : Rat) / 103) [(0, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-2304 : Rat) / 103) [(0, 1), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((1824 : Rat) / 103) [(0, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1248 : Rat) / 103) [(0, 1), (6, 1), (12, 1), (16, 1)],
  term ((1248 : Rat) / 103) [(0, 1), (6, 1), (14, 1), (16, 1)],
  term ((120 : Rat) / 103) [(0, 1), (6, 1), (16, 1)],
  term ((-1152 : Rat) / 103) [(0, 1), (6, 2), (7, 1), (13, 1), (16, 1)],
  term ((1824 : Rat) / 103) [(0, 1), (6, 2), (7, 1), (15, 1), (16, 1)],
  term ((1152 : Rat) / 103) [(0, 1), (6, 2), (9, 1), (13, 1), (16, 1)],
  term ((-912 : Rat) / 103) [(0, 1), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((624 : Rat) / 103) [(0, 1), (6, 2), (12, 1), (16, 1)],
  term ((-624 : Rat) / 103) [(0, 1), (6, 2), (14, 1), (16, 1)],
  term ((-60 : Rat) / 103) [(0, 1), (6, 2), (16, 1)],
  term ((-2304 : Rat) / 103) [(0, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((3648 : Rat) / 103) [(0, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((1152 : Rat) / 103) [(0, 1), (7, 1), (12, 2), (13, 1), (16, 1)],
  term ((-1824 : Rat) / 103) [(0, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1824 : Rat) / 103) [(0, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((1152 : Rat) / 103) [(0, 1), (7, 1), (13, 3), (16, 1)],
  term ((1152 : Rat) / 103) [(0, 1), (7, 2), (9, 1), (13, 1), (16, 1)],
  term ((-912 : Rat) / 103) [(0, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((624 : Rat) / 103) [(0, 1), (7, 2), (12, 1), (16, 1)],
  term ((-624 : Rat) / 103) [(0, 1), (7, 2), (14, 1), (16, 1)],
  term ((-60 : Rat) / 103) [(0, 1), (7, 2), (16, 1)],
  term ((-1152 : Rat) / 103) [(0, 1), (7, 3), (13, 1), (16, 1)],
  term ((1824 : Rat) / 103) [(0, 1), (7, 3), (15, 1), (16, 1)],
  term ((2304 : Rat) / 103) [(0, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1824 : Rat) / 103) [(0, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1152 : Rat) / 103) [(0, 1), (9, 1), (12, 2), (13, 1), (16, 1)],
  term ((912 : Rat) / 103) [(0, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((912 : Rat) / 103) [(0, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1152 : Rat) / 103) [(0, 1), (9, 1), (13, 3), (16, 1)],
  term ((-624 : Rat) / 103) [(0, 1), (12, 1), (13, 2), (16, 1)],
  term ((-1248 : Rat) / 103) [(0, 1), (12, 1), (14, 1), (16, 1)],
  term ((-120 : Rat) / 103) [(0, 1), (12, 1), (16, 1)],
  term ((624 : Rat) / 103) [(0, 1), (12, 2), (14, 1), (16, 1)],
  term ((1308 : Rat) / 103) [(0, 1), (12, 2), (16, 1)],
  term ((-624 : Rat) / 103) [(0, 1), (12, 3), (16, 1)],
  term ((624 : Rat) / 103) [(0, 1), (13, 2), (14, 1), (16, 1)],
  term ((60 : Rat) / 103) [(0, 1), (13, 2), (16, 1)],
  term ((-1152 : Rat) / 103) [(1, 1), (4, 1), (6, 1), (13, 1), (16, 1)],
  term ((576 : Rat) / 103) [(1, 1), (4, 1), (6, 2), (13, 1), (16, 1)],
  term ((576 : Rat) / 103) [(1, 1), (4, 1), (7, 2), (13, 1), (16, 1)],
  term ((1152 : Rat) / 103) [(1, 1), (4, 1), (12, 1), (13, 1), (16, 1)],
  term ((-576 : Rat) / 103) [(1, 1), (4, 1), (12, 2), (13, 1), (16, 1)],
  term ((-576 : Rat) / 103) [(1, 1), (4, 1), (13, 3), (16, 1)],
  term ((-27648 : Rat) / 103) [(1, 1), (5, 1), (6, 1), (7, 1), (13, 1), (16, 1)],
  term ((43776 : Rat) / 103) [(1, 1), (5, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-13824 : Rat) / 103) [(1, 1), (5, 1), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((21888 : Rat) / 103) [(1, 1), (5, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((27648 : Rat) / 103) [(1, 1), (5, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-43776 : Rat) / 103) [(1, 1), (5, 1), (6, 1), (15, 2), (16, 1)],
  term ((13824 : Rat) / 103) [(1, 1), (5, 1), (6, 2), (7, 1), (13, 1), (16, 1)],
  term ((-21888 : Rat) / 103) [(1, 1), (5, 1), (6, 2), (7, 1), (15, 1), (16, 1)],
  term ((6912 : Rat) / 103) [(1, 1), (5, 1), (6, 2), (9, 1), (13, 1), (16, 1)],
  term ((-10944 : Rat) / 103) [(1, 1), (5, 1), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((-13824 : Rat) / 103) [(1, 1), (5, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((21888 : Rat) / 103) [(1, 1), (5, 1), (6, 2), (15, 2), (16, 1)],
  term ((27648 : Rat) / 103) [(1, 1), (5, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-43776 : Rat) / 103) [(1, 1), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-13824 : Rat) / 103) [(1, 1), (5, 1), (7, 1), (12, 2), (13, 1), (16, 1)],
  term ((21888 : Rat) / 103) [(1, 1), (5, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((21888 : Rat) / 103) [(1, 1), (5, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-13824 : Rat) / 103) [(1, 1), (5, 1), (7, 1), (13, 3), (16, 1)],
  term ((6912 : Rat) / 103) [(1, 1), (5, 1), (7, 2), (9, 1), (13, 1), (16, 1)],
  term ((-10944 : Rat) / 103) [(1, 1), (5, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-13824 : Rat) / 103) [(1, 1), (5, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((21888 : Rat) / 103) [(1, 1), (5, 1), (7, 2), (15, 2), (16, 1)],
  term ((13824 : Rat) / 103) [(1, 1), (5, 1), (7, 3), (13, 1), (16, 1)],
  term ((-21888 : Rat) / 103) [(1, 1), (5, 1), (7, 3), (15, 1), (16, 1)],
  term ((13824 : Rat) / 103) [(1, 1), (5, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-21888 : Rat) / 103) [(1, 1), (5, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-6912 : Rat) / 103) [(1, 1), (5, 1), (9, 1), (12, 2), (13, 1), (16, 1)],
  term ((10944 : Rat) / 103) [(1, 1), (5, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((10944 : Rat) / 103) [(1, 1), (5, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-6912 : Rat) / 103) [(1, 1), (5, 1), (9, 1), (13, 3), (16, 1)],
  term ((-27648 : Rat) / 103) [(1, 1), (5, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((43776 : Rat) / 103) [(1, 1), (5, 1), (12, 1), (15, 2), (16, 1)],
  term ((13824 : Rat) / 103) [(1, 1), (5, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-21888 : Rat) / 103) [(1, 1), (5, 1), (12, 2), (15, 2), (16, 1)],
  term ((-21888 : Rat) / 103) [(1, 1), (5, 1), (13, 2), (15, 2), (16, 1)],
  term ((13824 : Rat) / 103) [(1, 1), (5, 1), (13, 3), (15, 1), (16, 1)],
  term ((-4608 : Rat) / 103) [(1, 1), (6, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((7296 : Rat) / 103) [(1, 1), (6, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((9216 : Rat) / 103) [(1, 1), (6, 1), (7, 2), (13, 1), (16, 1)],
  term ((-14592 : Rat) / 103) [(1, 1), (6, 1), (7, 2), (15, 1), (16, 1)],
  term ((912 : Rat) / 103) [(1, 1), (6, 1), (9, 1), (16, 1)],
  term ((-6912 : Rat) / 103) [(1, 1), (6, 1), (13, 1), (14, 1), (16, 1)],
  term ((-96 : Rat) / 103) [(1, 1), (6, 1), (13, 1), (16, 1)],
  term ((10944 : Rat) / 103) [(1, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2736 : Rat) / 103) [(1, 1), (6, 1), (15, 1), (16, 1)],
  term ((2304 : Rat) / 103) [(1, 1), (6, 2), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((-3648 : Rat) / 103) [(1, 1), (6, 2), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-4608 : Rat) / 103) [(1, 1), (6, 2), (7, 2), (13, 1), (16, 1)],
  term ((7296 : Rat) / 103) [(1, 1), (6, 2), (7, 2), (15, 1), (16, 1)],
  term ((-456 : Rat) / 103) [(1, 1), (6, 2), (9, 1), (16, 1)],
  term ((3456 : Rat) / 103) [(1, 1), (6, 2), (13, 1), (14, 1), (16, 1)],
  term ((48 : Rat) / 103) [(1, 1), (6, 2), (13, 1), (16, 1)],
  term ((-5472 : Rat) / 103) [(1, 1), (6, 2), (14, 1), (15, 1), (16, 1)],
  term ((1368 : Rat) / 103) [(1, 1), (6, 2), (15, 1), (16, 1)],
  term ((4608 : Rat) / 103) [(1, 1), (7, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-7296 : Rat) / 103) [(1, 1), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2304 : Rat) / 103) [(1, 1), (7, 1), (9, 1), (12, 2), (13, 1), (16, 1)],
  term ((3648 : Rat) / 103) [(1, 1), (7, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((3648 : Rat) / 103) [(1, 1), (7, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-2304 : Rat) / 103) [(1, 1), (7, 1), (9, 1), (13, 3), (16, 1)],
  term ((-456 : Rat) / 103) [(1, 1), (7, 2), (9, 1), (16, 1)],
  term ((-9216 : Rat) / 103) [(1, 1), (7, 2), (12, 1), (13, 1), (16, 1)],
  term ((14592 : Rat) / 103) [(1, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((4608 : Rat) / 103) [(1, 1), (7, 2), (12, 2), (13, 1), (16, 1)],
  term ((-7296 : Rat) / 103) [(1, 1), (7, 2), (12, 2), (15, 1), (16, 1)],
  term ((3456 : Rat) / 103) [(1, 1), (7, 2), (13, 1), (14, 1), (16, 1)],
  term ((48 : Rat) / 103) [(1, 1), (7, 2), (13, 1), (16, 1)],
  term ((-7296 : Rat) / 103) [(1, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((4608 : Rat) / 103) [(1, 1), (7, 2), (13, 3), (16, 1)],
  term ((-5472 : Rat) / 103) [(1, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((1368 : Rat) / 103) [(1, 1), (7, 2), (15, 1), (16, 1)],
  term ((2304 : Rat) / 103) [(1, 1), (7, 3), (9, 1), (13, 1), (16, 1)],
  term ((-3648 : Rat) / 103) [(1, 1), (7, 3), (9, 1), (15, 1), (16, 1)],
  term ((-4608 : Rat) / 103) [(1, 1), (7, 4), (13, 1), (16, 1)],
  term ((7296 : Rat) / 103) [(1, 1), (7, 4), (15, 1), (16, 1)],
  term ((-912 : Rat) / 103) [(1, 1), (9, 1), (12, 1), (16, 1)],
  term ((456 : Rat) / 103) [(1, 1), (9, 1), (12, 2), (16, 1)],
  term ((456 : Rat) / 103) [(1, 1), (9, 1), (13, 2), (16, 1)],
  term ((6912 : Rat) / 103) [(1, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((96 : Rat) / 103) [(1, 1), (12, 1), (13, 1), (16, 1)],
  term ((-10944 : Rat) / 103) [(1, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((2736 : Rat) / 103) [(1, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3456 : Rat) / 103) [(1, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-48 : Rat) / 103) [(1, 1), (12, 2), (13, 1), (16, 1)],
  term ((5472 : Rat) / 103) [(1, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1368 : Rat) / 103) [(1, 1), (12, 2), (15, 1), (16, 1)],
  term ((5472 : Rat) / 103) [(1, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1368 : Rat) / 103) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((-3456 : Rat) / 103) [(1, 1), (13, 3), (14, 1), (16, 1)],
  term ((-48 : Rat) / 103) [(1, 1), (13, 3), (16, 1)],
  term ((576 : Rat) / 103) [(4, 1), (6, 1), (12, 1), (16, 1)],
  term ((-3456 : Rat) / 103) [(4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((2304 : Rat) / 103) [(4, 1), (6, 1), (13, 2), (16, 1)],
  term ((288 : Rat) / 103) [(4, 1), (6, 1), (14, 1), (16, 1)],
  term ((288 : Rat) / 103) [(4, 1), (6, 1), (16, 1)],
  term ((-288 : Rat) / 103) [(4, 1), (6, 2), (12, 1), (16, 1)],
  term ((1728 : Rat) / 103) [(4, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1152 : Rat) / 103) [(4, 1), (6, 2), (13, 2), (16, 1)],
  term ((-144 : Rat) / 103) [(4, 1), (6, 2), (14, 1), (16, 1)],
  term ((-144 : Rat) / 103) [(4, 1), (6, 2), (16, 1)],
  term ((-288 : Rat) / 103) [(4, 1), (7, 2), (12, 1), (16, 1)],
  term ((1728 : Rat) / 103) [(4, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1152 : Rat) / 103) [(4, 1), (7, 2), (13, 2), (16, 1)],
  term ((-144 : Rat) / 103) [(4, 1), (7, 2), (14, 1), (16, 1)],
  term ((-144 : Rat) / 103) [(4, 1), (7, 2), (16, 1)],
  term ((3456 : Rat) / 103) [(4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2016 : Rat) / 103) [(4, 1), (12, 1), (13, 2), (16, 1)],
  term ((-288 : Rat) / 103) [(4, 1), (12, 1), (14, 1), (16, 1)],
  term ((-288 : Rat) / 103) [(4, 1), (12, 1), (16, 1)],
  term ((-1728 : Rat) / 103) [(4, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((1152 : Rat) / 103) [(4, 1), (12, 2), (13, 2), (16, 1)],
  term ((144 : Rat) / 103) [(4, 1), (12, 2), (14, 1), (16, 1)],
  term ((-432 : Rat) / 103) [(4, 1), (12, 2), (16, 1)],
  term ((288 : Rat) / 103) [(4, 1), (12, 3), (16, 1)],
  term ((144 : Rat) / 103) [(4, 1), (13, 2), (14, 1), (16, 1)],
  term ((144 : Rat) / 103) [(4, 1), (13, 2), (16, 1)],
  term ((-1728 : Rat) / 103) [(4, 1), (13, 3), (15, 1), (16, 1)],
  term ((1152 : Rat) / 103) [(4, 1), (13, 4), (16, 1)],
  term ((-5568 : Rat) / 103) [(5, 1), (6, 1), (7, 1), (16, 1)],
  term ((-2784 : Rat) / 103) [(5, 1), (6, 1), (9, 1), (16, 1)],
  term ((-2304 : Rat) / 103) [(5, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term ((2304 : Rat) / 103) [(5, 1), (6, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1728 : Rat) / 103) [(5, 1), (6, 1), (13, 1), (16, 1)],
  term ((5568 : Rat) / 103) [(5, 1), (6, 1), (15, 1), (16, 1)],
  term ((2784 : Rat) / 103) [(5, 1), (6, 2), (7, 1), (16, 1)],
  term ((1392 : Rat) / 103) [(5, 1), (6, 2), (9, 1), (16, 1)],
  term ((1152 : Rat) / 103) [(5, 1), (6, 2), (12, 1), (13, 1), (16, 1)],
  term ((-1152 : Rat) / 103) [(5, 1), (6, 2), (13, 1), (14, 1), (16, 1)],
  term ((864 : Rat) / 103) [(5, 1), (6, 2), (13, 1), (16, 1)],
  term ((-2784 : Rat) / 103) [(5, 1), (6, 2), (15, 1), (16, 1)],
  term ((5568 : Rat) / 103) [(5, 1), (7, 1), (12, 1), (16, 1)],
  term ((-2784 : Rat) / 103) [(5, 1), (7, 1), (12, 2), (16, 1)],
  term ((-2784 : Rat) / 103) [(5, 1), (7, 1), (13, 2), (16, 1)],
  term ((1392 : Rat) / 103) [(5, 1), (7, 2), (9, 1), (16, 1)],
  term ((1152 : Rat) / 103) [(5, 1), (7, 2), (12, 1), (13, 1), (16, 1)],
  term ((-1152 : Rat) / 103) [(5, 1), (7, 2), (13, 1), (14, 1), (16, 1)],
  term ((864 : Rat) / 103) [(5, 1), (7, 2), (13, 1), (16, 1)],
  term ((-2784 : Rat) / 103) [(5, 1), (7, 2), (15, 1), (16, 1)],
  term ((2784 : Rat) / 103) [(5, 1), (7, 3), (16, 1)],
  term ((2784 : Rat) / 103) [(5, 1), (9, 1), (12, 1), (16, 1)],
  term ((-1392 : Rat) / 103) [(5, 1), (9, 1), (12, 2), (16, 1)],
  term ((-1392 : Rat) / 103) [(5, 1), (9, 1), (13, 2), (16, 1)],
  term ((-2304 : Rat) / 103) [(5, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((1728 : Rat) / 103) [(5, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1152 : Rat) / 103) [(5, 1), (12, 1), (13, 3), (16, 1)],
  term ((-5568 : Rat) / 103) [(5, 1), (12, 1), (15, 1), (16, 1)],
  term ((1152 : Rat) / 103) [(5, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((1440 : Rat) / 103) [(5, 1), (12, 2), (13, 1), (16, 1)],
  term ((2784 : Rat) / 103) [(5, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1152 : Rat) / 103) [(5, 1), (12, 3), (13, 1), (16, 1)],
  term ((2784 : Rat) / 103) [(5, 1), (13, 2), (15, 1), (16, 1)],
  term ((1152 : Rat) / 103) [(5, 1), (13, 3), (14, 1), (16, 1)],
  term ((-864 : Rat) / 103) [(5, 1), (13, 3), (16, 1)],
  term ((768 : Rat) / 103) [(6, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1408 : Rat) / 103) [(6, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((1152 : Rat) / 103) [(6, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-448 : Rat) / 103) [(6, 1), (7, 1), (13, 1), (16, 1)],
  term ((1824 : Rat) / 103) [(6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-1536 : Rat) / 103) [(6, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((576 : Rat) / 103) [(6, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((512 : Rat) / 103) [(6, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-576 : Rat) / 103) [(6, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((1696 : Rat) / 103) [(6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-912 : Rat) / 103) [(6, 1), (9, 1), (15, 1), (16, 1)],
  term ((1728 : Rat) / 103) [(6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1248 : Rat) / 103) [(6, 1), (12, 1), (14, 1), (16, 1)],
  term ((-432 : Rat) / 103) [(6, 1), (12, 1), (16, 1)],
  term ((864 : Rat) / 103) [(6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1984 : Rat) / 103) [(6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1728 : Rat) / 103) [(6, 1), (13, 2), (14, 1), (16, 1)],
  term ((-288 : Rat) / 103) [(6, 1), (13, 2), (16, 1)],
  term ((-3864 : Rat) / 103) [(6, 1), (14, 1), (16, 1)],
  term ((624 : Rat) / 103) [(6, 1), (14, 2), (16, 1)],
  term ((912 : Rat) / 103) [(6, 1), (15, 2), (16, 1)],
  term ((1320 : Rat) / 103) [(6, 1), (16, 1)],
  term ((-384 : Rat) / 103) [(6, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((704 : Rat) / 103) [(6, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-576 : Rat) / 103) [(6, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((224 : Rat) / 103) [(6, 2), (7, 1), (13, 1), (16, 1)],
  term ((-912 : Rat) / 103) [(6, 2), (7, 1), (15, 1), (16, 1)],
  term ((768 : Rat) / 103) [(6, 2), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-288 : Rat) / 103) [(6, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-256 : Rat) / 103) [(6, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((288 : Rat) / 103) [(6, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-848 : Rat) / 103) [(6, 2), (9, 1), (13, 1), (16, 1)],
  term ((456 : Rat) / 103) [(6, 2), (9, 1), (15, 1), (16, 1)],
  term ((-864 : Rat) / 103) [(6, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-624 : Rat) / 103) [(6, 2), (12, 1), (14, 1), (16, 1)],
  term ((216 : Rat) / 103) [(6, 2), (12, 1), (16, 1)],
  term ((-432 : Rat) / 103) [(6, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-992 : Rat) / 103) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((864 : Rat) / 103) [(6, 2), (13, 2), (14, 1), (16, 1)],
  term ((144 : Rat) / 103) [(6, 2), (13, 2), (16, 1)],
  term ((1932 : Rat) / 103) [(6, 2), (14, 1), (16, 1)],
  term ((-312 : Rat) / 103) [(6, 2), (14, 2), (16, 1)],
  term ((-456 : Rat) / 103) [(6, 2), (15, 2), (16, 1)],
  term ((-660 : Rat) / 103) [(6, 2), (16, 1)],
  term ((-768 : Rat) / 103) [(7, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((384 : Rat) / 103) [(7, 1), (9, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((384 : Rat) / 103) [(7, 1), (9, 1), (13, 3), (15, 1), (16, 1)],
  term ((1408 : Rat) / 103) [(7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1152 : Rat) / 103) [(7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((448 : Rat) / 103) [(7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1824 : Rat) / 103) [(7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-704 : Rat) / 103) [(7, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((576 : Rat) / 103) [(7, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-224 : Rat) / 103) [(7, 1), (12, 2), (13, 1), (16, 1)],
  term ((912 : Rat) / 103) [(7, 1), (12, 2), (15, 1), (16, 1)],
  term ((912 : Rat) / 103) [(7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-704 : Rat) / 103) [(7, 1), (13, 3), (14, 1), (16, 1)],
  term ((576 : Rat) / 103) [(7, 1), (13, 3), (15, 2), (16, 1)],
  term ((-224 : Rat) / 103) [(7, 1), (13, 3), (16, 1)],
  term ((-288 : Rat) / 103) [(7, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-256 : Rat) / 103) [(7, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((288 : Rat) / 103) [(7, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-848 : Rat) / 103) [(7, 2), (9, 1), (13, 1), (16, 1)],
  term ((456 : Rat) / 103) [(7, 2), (9, 1), (15, 1), (16, 1)],
  term ((672 : Rat) / 103) [(7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-624 : Rat) / 103) [(7, 2), (12, 1), (14, 1), (16, 1)],
  term ((216 : Rat) / 103) [(7, 2), (12, 1), (16, 1)],
  term ((-768 : Rat) / 103) [(7, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-432 : Rat) / 103) [(7, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-992 : Rat) / 103) [(7, 2), (13, 1), (15, 1), (16, 1)],
  term ((864 : Rat) / 103) [(7, 2), (13, 2), (14, 1), (16, 1)],
  term ((144 : Rat) / 103) [(7, 2), (13, 2), (16, 1)],
  term ((-768 : Rat) / 103) [(7, 2), (13, 3), (15, 1), (16, 1)],
  term ((1932 : Rat) / 103) [(7, 2), (14, 1), (16, 1)],
  term ((-312 : Rat) / 103) [(7, 2), (14, 2), (16, 1)],
  term ((-456 : Rat) / 103) [(7, 2), (15, 2), (16, 1)],
  term ((-660 : Rat) / 103) [(7, 2), (16, 1)],
  term ((-384 : Rat) / 103) [(7, 3), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((704 : Rat) / 103) [(7, 3), (13, 1), (14, 1), (16, 1)],
  term ((-576 : Rat) / 103) [(7, 3), (13, 1), (15, 2), (16, 1)],
  term ((224 : Rat) / 103) [(7, 3), (13, 1), (16, 1)],
  term ((-912 : Rat) / 103) [(7, 3), (15, 1), (16, 1)],
  term ((768 : Rat) / 103) [(7, 4), (13, 1), (15, 1), (16, 1)],
  term ((-512 : Rat) / 103) [(9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((576 : Rat) / 103) [(9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1696 : Rat) / 103) [(9, 1), (12, 1), (13, 1), (16, 1)],
  term ((288 : Rat) / 103) [(9, 1), (12, 1), (13, 3), (16, 1)],
  term ((912 : Rat) / 103) [(9, 1), (12, 1), (15, 1), (16, 1)],
  term ((256 : Rat) / 103) [(9, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-288 : Rat) / 103) [(9, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((272 : Rat) / 103) [(9, 1), (12, 2), (13, 1), (16, 1)],
  term ((-456 : Rat) / 103) [(9, 1), (12, 2), (15, 1), (16, 1)],
  term ((288 : Rat) / 103) [(9, 1), (12, 3), (13, 1), (16, 1)],
  term ((-456 : Rat) / 103) [(9, 1), (13, 2), (15, 1), (16, 1)],
  term ((256 : Rat) / 103) [(9, 1), (13, 3), (14, 1), (16, 1)],
  term ((-288 : Rat) / 103) [(9, 1), (13, 3), (15, 2), (16, 1)],
  term ((848 : Rat) / 103) [(9, 1), (13, 3), (16, 1)],
  term ((-864 : Rat) / 103) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1984 : Rat) / 103) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((2352 : Rat) / 103) [(12, 1), (13, 2), (14, 1), (16, 1)],
  term ((72 : Rat) / 103) [(12, 1), (13, 2), (16, 1)],
  term ((864 : Rat) / 103) [(12, 1), (13, 3), (15, 1), (16, 1)],
  term ((3864 : Rat) / 103) [(12, 1), (14, 1), (16, 1)],
  term ((-624 : Rat) / 103) [(12, 1), (14, 2), (16, 1)],
  term ((-912 : Rat) / 103) [(12, 1), (15, 2), (16, 1)],
  term ((-1320 : Rat) / 103) [(12, 1), (16, 1)],
  term ((432 : Rat) / 103) [(12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-736 : Rat) / 103) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-864 : Rat) / 103) [(12, 2), (13, 2), (14, 1), (16, 1)],
  term ((-144 : Rat) / 103) [(12, 2), (13, 2), (16, 1)],
  term ((-3180 : Rat) / 103) [(12, 2), (14, 1), (16, 1)],
  term ((312 : Rat) / 103) [(12, 2), (14, 2), (16, 1)],
  term ((456 : Rat) / 103) [(12, 2), (15, 2), (16, 1)],
  term ((1092 : Rat) / 103) [(12, 2), (16, 1)],
  term ((864 : Rat) / 103) [(12, 3), (13, 1), (15, 1), (16, 1)],
  term ((624 : Rat) / 103) [(12, 3), (14, 1), (16, 1)],
  term ((-216 : Rat) / 103) [(12, 3), (16, 1)],
  term ((-1932 : Rat) / 103) [(13, 2), (14, 1), (16, 1)],
  term ((312 : Rat) / 103) [(13, 2), (14, 2), (16, 1)],
  term ((456 : Rat) / 103) [(13, 2), (15, 2), (16, 1)],
  term ((660 : Rat) / 103) [(13, 2), (16, 1)],
  term ((432 : Rat) / 103) [(13, 3), (14, 1), (15, 1), (16, 1)],
  term ((992 : Rat) / 103) [(13, 3), (15, 1), (16, 1)],
  term ((-864 : Rat) / 103) [(13, 4), (14, 1), (16, 1)],
  term ((-144 : Rat) / 103) [(13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 4, terms 0 through 60. -/
theorem rs_R013_ueqv_R013NNYN_block_04_0000_0060_valid :
    checkProductSumEq rs_R013_ueqv_R013NNYN_partials_04_0000_0060
      rs_R013_ueqv_R013NNYN_block_04_0000_0060 = true := by
  native_decide

end R013UeqvR013NNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
