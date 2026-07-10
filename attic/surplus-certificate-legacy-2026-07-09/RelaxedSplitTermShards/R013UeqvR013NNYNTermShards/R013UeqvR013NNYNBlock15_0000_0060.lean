/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R013:u=v:R013NNYN, term block 15:0-60

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R013UeqvR013NNYNTermShards

/-- Generator polynomial 15 for relaxed split surplus certificate `R013:u=v:R013NNYN`. -/
def rs_R013_ueqv_R013NNYN_generator_15_0000_0060 : Poly :=
[
  term (1 : Rat) [],
  term (-2 : Rat) [(4, 1)],
  term (2 : Rat) [(4, 1), (14, 1)],
  term (2 : Rat) [(5, 1), (15, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013NNYN_coefficient_15_0000 : Poly :=
[
  term ((756 : Rat) / 103) [(0, 1), (4, 1), (16, 1)]
]

/-- Partial product 0 for generator 15. -/
def rs_R013_ueqv_R013NNYN_partial_15_0000 : Poly :=
[
  term ((1512 : Rat) / 103) [(0, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-756 : Rat) / 103) [(0, 1), (4, 1), (14, 2), (16, 1)],
  term ((-756 : Rat) / 103) [(0, 1), (4, 1), (15, 2), (16, 1)],
  term ((756 : Rat) / 103) [(0, 1), (4, 1), (16, 1)],
  term ((1512 : Rat) / 103) [(0, 1), (4, 2), (14, 1), (16, 1)],
  term ((-1512 : Rat) / 103) [(0, 1), (4, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 15. -/
theorem rs_R013_ueqv_R013NNYN_partial_15_0000_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_15_0000
        rs_R013_ueqv_R013NNYN_generator_15_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_15_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013NNYN_coefficient_15_0001 : Poly :=
[
  term ((5760 : Rat) / 103) [(0, 1), (5, 1), (7, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 1 for generator 15. -/
def rs_R013_ueqv_R013NNYN_partial_15_0001 : Poly :=
[
  term ((11520 : Rat) / 103) [(0, 1), (4, 1), (5, 1), (7, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-11520 : Rat) / 103) [(0, 1), (4, 1), (5, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((-5760 : Rat) / 103) [(0, 1), (5, 1), (7, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-5760 : Rat) / 103) [(0, 1), (5, 1), (7, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((5760 : Rat) / 103) [(0, 1), (5, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((11520 : Rat) / 103) [(0, 1), (5, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 15. -/
theorem rs_R013_ueqv_R013NNYN_partial_15_0001_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_15_0001
        rs_R013_ueqv_R013NNYN_generator_15_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_15_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013NNYN_coefficient_15_0002 : Poly :=
[
  term ((-9024 : Rat) / 103) [(0, 1), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 2 for generator 15. -/
def rs_R013_ueqv_R013NNYN_partial_15_0002 : Poly :=
[
  term ((-18048 : Rat) / 103) [(0, 1), (4, 1), (5, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((18048 : Rat) / 103) [(0, 1), (4, 1), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((9024 : Rat) / 103) [(0, 1), (5, 1), (7, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-9024 : Rat) / 103) [(0, 1), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((9024 : Rat) / 103) [(0, 1), (5, 1), (7, 1), (9, 1), (15, 3), (16, 1)],
  term ((-18048 : Rat) / 103) [(0, 1), (5, 2), (7, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 15. -/
theorem rs_R013_ueqv_R013NNYN_partial_15_0002_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_15_0002
        rs_R013_ueqv_R013NNYN_generator_15_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_15_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013NNYN_coefficient_15_0003 : Poly :=
[
  term ((-11520 : Rat) / 103) [(0, 1), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 3 for generator 15. -/
def rs_R013_ueqv_R013NNYN_partial_15_0003 : Poly :=
[
  term ((-23040 : Rat) / 103) [(0, 1), (4, 1), (5, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((23040 : Rat) / 103) [(0, 1), (4, 1), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((11520 : Rat) / 103) [(0, 1), (5, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-11520 : Rat) / 103) [(0, 1), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((11520 : Rat) / 103) [(0, 1), (5, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((-23040 : Rat) / 103) [(0, 1), (5, 2), (9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 15. -/
theorem rs_R013_ueqv_R013NNYN_partial_15_0003_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_15_0003
        rs_R013_ueqv_R013NNYN_generator_15_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_15_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013NNYN_coefficient_15_0004 : Poly :=
[
  term ((18048 : Rat) / 103) [(0, 1), (5, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 4 for generator 15. -/
def rs_R013_ueqv_R013NNYN_partial_15_0004 : Poly :=
[
  term ((36096 : Rat) / 103) [(0, 1), (4, 1), (5, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-36096 : Rat) / 103) [(0, 1), (4, 1), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-18048 : Rat) / 103) [(0, 1), (5, 1), (9, 1), (14, 2), (15, 2), (16, 1)],
  term ((18048 : Rat) / 103) [(0, 1), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-18048 : Rat) / 103) [(0, 1), (5, 1), (9, 1), (15, 4), (16, 1)],
  term ((36096 : Rat) / 103) [(0, 1), (5, 2), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 15. -/
theorem rs_R013_ueqv_R013NNYN_partial_15_0004_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_15_0004
        rs_R013_ueqv_R013NNYN_generator_15_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_15_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013NNYN_coefficient_15_0005 : Poly :=
[
  term ((11520 : Rat) / 103) [(0, 1), (5, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 5 for generator 15. -/
def rs_R013_ueqv_R013NNYN_partial_15_0005 : Poly :=
[
  term ((-23040 : Rat) / 103) [(0, 1), (4, 1), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((23040 : Rat) / 103) [(0, 1), (4, 1), (5, 1), (13, 1), (14, 2), (16, 1)],
  term ((-11520 : Rat) / 103) [(0, 1), (5, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((11520 : Rat) / 103) [(0, 1), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((-11520 : Rat) / 103) [(0, 1), (5, 1), (13, 1), (14, 3), (16, 1)],
  term ((23040 : Rat) / 103) [(0, 1), (5, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 15. -/
theorem rs_R013_ueqv_R013NNYN_partial_15_0005_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_15_0005
        rs_R013_ueqv_R013NNYN_generator_15_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_15_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013NNYN_coefficient_15_0006 : Poly :=
[
  term ((-7776 : Rat) / 103) [(0, 1), (5, 1), (13, 1), (16, 1)]
]

/-- Partial product 6 for generator 15. -/
def rs_R013_ueqv_R013NNYN_partial_15_0006 : Poly :=
[
  term ((-15552 : Rat) / 103) [(0, 1), (4, 1), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((15552 : Rat) / 103) [(0, 1), (4, 1), (5, 1), (13, 1), (16, 1)],
  term ((7776 : Rat) / 103) [(0, 1), (5, 1), (13, 1), (14, 2), (16, 1)],
  term ((7776 : Rat) / 103) [(0, 1), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((-7776 : Rat) / 103) [(0, 1), (5, 1), (13, 1), (16, 1)],
  term ((-15552 : Rat) / 103) [(0, 1), (5, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 15. -/
theorem rs_R013_ueqv_R013NNYN_partial_15_0006_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_15_0006
        rs_R013_ueqv_R013NNYN_generator_15_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_15_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013NNYN_coefficient_15_0007 : Poly :=
[
  term ((-18048 : Rat) / 103) [(0, 1), (5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 7 for generator 15. -/
def rs_R013_ueqv_R013NNYN_partial_15_0007 : Poly :=
[
  term ((36096 : Rat) / 103) [(0, 1), (4, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-36096 : Rat) / 103) [(0, 1), (4, 1), (5, 1), (14, 2), (15, 1), (16, 1)],
  term ((-18048 : Rat) / 103) [(0, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((18048 : Rat) / 103) [(0, 1), (5, 1), (14, 1), (15, 3), (16, 1)],
  term ((18048 : Rat) / 103) [(0, 1), (5, 1), (14, 3), (15, 1), (16, 1)],
  term ((-36096 : Rat) / 103) [(0, 1), (5, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 15. -/
theorem rs_R013_ueqv_R013NNYN_partial_15_0007_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_15_0007
        rs_R013_ueqv_R013NNYN_generator_15_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_15_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013NNYN_coefficient_15_0008 : Poly :=
[
  term ((12168 : Rat) / 103) [(0, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 8 for generator 15. -/
def rs_R013_ueqv_R013NNYN_partial_15_0008 : Poly :=
[
  term ((24336 : Rat) / 103) [(0, 1), (4, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-24336 : Rat) / 103) [(0, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-12168 : Rat) / 103) [(0, 1), (5, 1), (14, 2), (15, 1), (16, 1)],
  term ((12168 : Rat) / 103) [(0, 1), (5, 1), (15, 1), (16, 1)],
  term ((-12168 : Rat) / 103) [(0, 1), (5, 1), (15, 3), (16, 1)],
  term ((24336 : Rat) / 103) [(0, 1), (5, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 15. -/
theorem rs_R013_ueqv_R013NNYN_partial_15_0008_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_15_0008
        rs_R013_ueqv_R013NNYN_generator_15_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_15_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013NNYN_coefficient_15_0009 : Poly :=
[
  term ((-416 : Rat) / 103) [(0, 1), (7, 1), (9, 1), (16, 1)]
]

/-- Partial product 9 for generator 15. -/
def rs_R013_ueqv_R013NNYN_partial_15_0009 : Poly :=
[
  term ((-832 : Rat) / 103) [(0, 1), (4, 1), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((832 : Rat) / 103) [(0, 1), (4, 1), (7, 1), (9, 1), (16, 1)],
  term ((-832 : Rat) / 103) [(0, 1), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((416 : Rat) / 103) [(0, 1), (7, 1), (9, 1), (14, 2), (16, 1)],
  term ((416 : Rat) / 103) [(0, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-416 : Rat) / 103) [(0, 1), (7, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 15. -/
theorem rs_R013_ueqv_R013NNYN_partial_15_0009_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_15_0009
        rs_R013_ueqv_R013NNYN_generator_15_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_15_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013NNYN_coefficient_15_0010 : Poly :=
[
  term ((-288 : Rat) / 103) [(0, 1), (7, 1), (13, 1), (16, 1)]
]

/-- Partial product 10 for generator 15. -/
def rs_R013_ueqv_R013NNYN_partial_15_0010 : Poly :=
[
  term ((-576 : Rat) / 103) [(0, 1), (4, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((576 : Rat) / 103) [(0, 1), (4, 1), (7, 1), (13, 1), (16, 1)],
  term ((-576 : Rat) / 103) [(0, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((288 : Rat) / 103) [(0, 1), (7, 1), (13, 1), (14, 2), (16, 1)],
  term ((288 : Rat) / 103) [(0, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-288 : Rat) / 103) [(0, 1), (7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 15. -/
theorem rs_R013_ueqv_R013NNYN_partial_15_0010_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_15_0010
        rs_R013_ueqv_R013NNYN_generator_15_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_15_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013NNYN_coefficient_15_0011 : Poly :=
[
  term ((480 : Rat) / 103) [(0, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 11 for generator 15. -/
def rs_R013_ueqv_R013NNYN_partial_15_0011 : Poly :=
[
  term ((960 : Rat) / 103) [(0, 1), (4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-960 : Rat) / 103) [(0, 1), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((960 : Rat) / 103) [(0, 1), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-480 : Rat) / 103) [(0, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((480 : Rat) / 103) [(0, 1), (7, 1), (15, 1), (16, 1)],
  term ((-480 : Rat) / 103) [(0, 1), (7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 15. -/
theorem rs_R013_ueqv_R013NNYN_partial_15_0011_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_15_0011
        rs_R013_ueqv_R013NNYN_generator_15_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_15_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013NNYN_coefficient_15_0012 : Poly :=
[
  term ((-1440 : Rat) / 103) [(0, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 12 for generator 15. -/
def rs_R013_ueqv_R013NNYN_partial_15_0012 : Poly :=
[
  term ((-2880 : Rat) / 103) [(0, 1), (4, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((2880 : Rat) / 103) [(0, 1), (4, 1), (9, 1), (13, 1), (16, 1)],
  term ((-2880 : Rat) / 103) [(0, 1), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((1440 : Rat) / 103) [(0, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((1440 : Rat) / 103) [(0, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1440 : Rat) / 103) [(0, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 15. -/
theorem rs_R013_ueqv_R013NNYN_partial_15_0012_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_15_0012
        rs_R013_ueqv_R013NNYN_generator_15_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_15_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013NNYN_coefficient_15_0013 : Poly :=
[
  term ((3088 : Rat) / 103) [(0, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 13 for generator 15. -/
def rs_R013_ueqv_R013NNYN_partial_15_0013 : Poly :=
[
  term ((6176 : Rat) / 103) [(0, 1), (4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6176 : Rat) / 103) [(0, 1), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((6176 : Rat) / 103) [(0, 1), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-3088 : Rat) / 103) [(0, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((3088 : Rat) / 103) [(0, 1), (9, 1), (15, 1), (16, 1)],
  term ((-3088 : Rat) / 103) [(0, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 15. -/
theorem rs_R013_ueqv_R013NNYN_partial_15_0013_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_15_0013
        rs_R013_ueqv_R013NNYN_generator_15_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_15_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013NNYN_coefficient_15_0014 : Poly :=
[
  term ((-624 : Rat) / 103) [(0, 1), (12, 1), (16, 1)]
]

/-- Partial product 14 for generator 15. -/
def rs_R013_ueqv_R013NNYN_partial_15_0014 : Poly :=
[
  term ((-1248 : Rat) / 103) [(0, 1), (4, 1), (12, 1), (14, 1), (16, 1)],
  term ((1248 : Rat) / 103) [(0, 1), (4, 1), (12, 1), (16, 1)],
  term ((-1248 : Rat) / 103) [(0, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((624 : Rat) / 103) [(0, 1), (12, 1), (14, 2), (16, 1)],
  term ((624 : Rat) / 103) [(0, 1), (12, 1), (15, 2), (16, 1)],
  term ((-624 : Rat) / 103) [(0, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 15. -/
theorem rs_R013_ueqv_R013NNYN_partial_15_0014_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_15_0014
        rs_R013_ueqv_R013NNYN_generator_15_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_15_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013NNYN_coefficient_15_0015 : Poly :=
[
  term ((1152 : Rat) / 103) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 15 for generator 15. -/
def rs_R013_ueqv_R013NNYN_partial_15_0015 : Poly :=
[
  term ((2304 : Rat) / 103) [(0, 1), (4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2304 : Rat) / 103) [(0, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((2304 : Rat) / 103) [(0, 1), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1152 : Rat) / 103) [(0, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((1152 : Rat) / 103) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1152 : Rat) / 103) [(0, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 15. -/
theorem rs_R013_ueqv_R013NNYN_partial_15_0015_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_15_0015
        rs_R013_ueqv_R013NNYN_generator_15_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_15_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013NNYN_coefficient_15_0016 : Poly :=
[
  term ((668 : Rat) / 103) [(0, 1), (14, 1), (16, 1)]
]

/-- Partial product 16 for generator 15. -/
def rs_R013_ueqv_R013NNYN_partial_15_0016 : Poly :=
[
  term ((-1336 : Rat) / 103) [(0, 1), (4, 1), (14, 1), (16, 1)],
  term ((1336 : Rat) / 103) [(0, 1), (4, 1), (14, 2), (16, 1)],
  term ((1336 : Rat) / 103) [(0, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-668 : Rat) / 103) [(0, 1), (14, 1), (15, 2), (16, 1)],
  term ((668 : Rat) / 103) [(0, 1), (14, 1), (16, 1)],
  term ((-668 : Rat) / 103) [(0, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 15. -/
theorem rs_R013_ueqv_R013NNYN_partial_15_0016_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_15_0016
        rs_R013_ueqv_R013NNYN_generator_15_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_15_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013NNYN_coefficient_15_0017 : Poly :=
[
  term ((-1848 : Rat) / 103) [(0, 1), (15, 2), (16, 1)]
]

/-- Partial product 17 for generator 15. -/
def rs_R013_ueqv_R013NNYN_partial_15_0017 : Poly :=
[
  term ((-3696 : Rat) / 103) [(0, 1), (4, 1), (14, 1), (15, 2), (16, 1)],
  term ((3696 : Rat) / 103) [(0, 1), (4, 1), (15, 2), (16, 1)],
  term ((-3696 : Rat) / 103) [(0, 1), (5, 1), (15, 3), (16, 1)],
  term ((1848 : Rat) / 103) [(0, 1), (14, 2), (15, 2), (16, 1)],
  term ((-1848 : Rat) / 103) [(0, 1), (15, 2), (16, 1)],
  term ((1848 : Rat) / 103) [(0, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 15. -/
theorem rs_R013_ueqv_R013NNYN_partial_15_0017_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_15_0017
        rs_R013_ueqv_R013NNYN_generator_15_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_15_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013NNYN_coefficient_15_0018 : Poly :=
[
  term ((-468 : Rat) / 103) [(0, 1), (16, 1)]
]

/-- Partial product 18 for generator 15. -/
def rs_R013_ueqv_R013NNYN_partial_15_0018 : Poly :=
[
  term ((-936 : Rat) / 103) [(0, 1), (4, 1), (14, 1), (16, 1)],
  term ((936 : Rat) / 103) [(0, 1), (4, 1), (16, 1)],
  term ((-936 : Rat) / 103) [(0, 1), (5, 1), (15, 1), (16, 1)],
  term ((468 : Rat) / 103) [(0, 1), (14, 2), (16, 1)],
  term ((468 : Rat) / 103) [(0, 1), (15, 2), (16, 1)],
  term ((-468 : Rat) / 103) [(0, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 15. -/
theorem rs_R013_ueqv_R013NNYN_partial_15_0018_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_15_0018
        rs_R013_ueqv_R013NNYN_generator_15_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_15_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013NNYN_coefficient_15_0019 : Poly :=
[
  term ((2016 : Rat) / 103) [(1, 1), (4, 1), (13, 1), (16, 1)]
]

/-- Partial product 19 for generator 15. -/
def rs_R013_ueqv_R013NNYN_partial_15_0019 : Poly :=
[
  term ((4032 : Rat) / 103) [(1, 1), (4, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2016 : Rat) / 103) [(1, 1), (4, 1), (13, 1), (14, 2), (16, 1)],
  term ((-2016 : Rat) / 103) [(1, 1), (4, 1), (13, 1), (15, 2), (16, 1)],
  term ((2016 : Rat) / 103) [(1, 1), (4, 1), (13, 1), (16, 1)],
  term ((4032 : Rat) / 103) [(1, 1), (4, 2), (13, 1), (14, 1), (16, 1)],
  term ((-4032 : Rat) / 103) [(1, 1), (4, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 15. -/
theorem rs_R013_ueqv_R013NNYN_partial_15_0019_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_15_0019
        rs_R013_ueqv_R013NNYN_generator_15_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_15_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013NNYN_coefficient_15_0020 : Poly :=
[
  term ((-2376 : Rat) / 103) [(1, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 20 for generator 15. -/
def rs_R013_ueqv_R013NNYN_partial_15_0020 : Poly :=
[
  term ((-4752 : Rat) / 103) [(1, 1), (4, 1), (5, 1), (15, 2), (16, 1)],
  term ((2376 : Rat) / 103) [(1, 1), (4, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2376 : Rat) / 103) [(1, 1), (4, 1), (15, 1), (16, 1)],
  term ((2376 : Rat) / 103) [(1, 1), (4, 1), (15, 3), (16, 1)],
  term ((-4752 : Rat) / 103) [(1, 1), (4, 2), (14, 1), (15, 1), (16, 1)],
  term ((4752 : Rat) / 103) [(1, 1), (4, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 15. -/
theorem rs_R013_ueqv_R013NNYN_partial_15_0020_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_15_0020
        rs_R013_ueqv_R013NNYN_generator_15_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_15_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013NNYN_coefficient_15_0021 : Poly :=
[
  term ((-416 : Rat) / 103) [(1, 1), (5, 1), (7, 1), (9, 1), (16, 1)]
]

/-- Partial product 21 for generator 15. -/
def rs_R013_ueqv_R013NNYN_partial_15_0021 : Poly :=
[
  term ((-832 : Rat) / 103) [(1, 1), (4, 1), (5, 1), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((832 : Rat) / 103) [(1, 1), (4, 1), (5, 1), (7, 1), (9, 1), (16, 1)],
  term ((416 : Rat) / 103) [(1, 1), (5, 1), (7, 1), (9, 1), (14, 2), (16, 1)],
  term ((416 : Rat) / 103) [(1, 1), (5, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-416 : Rat) / 103) [(1, 1), (5, 1), (7, 1), (9, 1), (16, 1)],
  term ((-832 : Rat) / 103) [(1, 1), (5, 2), (7, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 15. -/
theorem rs_R013_ueqv_R013NNYN_partial_15_0021_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_15_0021
        rs_R013_ueqv_R013NNYN_generator_15_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_15_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013NNYN_coefficient_15_0022 : Poly :=
[
  term ((832 : Rat) / 103) [(1, 1), (5, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 22 for generator 15. -/
def rs_R013_ueqv_R013NNYN_partial_15_0022 : Poly :=
[
  term ((1664 : Rat) / 103) [(1, 1), (4, 1), (5, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1664 : Rat) / 103) [(1, 1), (4, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-832 : Rat) / 103) [(1, 1), (5, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((832 : Rat) / 103) [(1, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-832 : Rat) / 103) [(1, 1), (5, 1), (9, 1), (15, 3), (16, 1)],
  term ((1664 : Rat) / 103) [(1, 1), (5, 2), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 15. -/
theorem rs_R013_ueqv_R013NNYN_partial_15_0022_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_15_0022
        rs_R013_ueqv_R013NNYN_generator_15_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_15_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013NNYN_coefficient_15_0023 : Poly :=
[
  term ((-832 : Rat) / 103) [(1, 1), (5, 1), (14, 1), (16, 1)]
]

/-- Partial product 23 for generator 15. -/
def rs_R013_ueqv_R013NNYN_partial_15_0023 : Poly :=
[
  term ((1664 : Rat) / 103) [(1, 1), (4, 1), (5, 1), (14, 1), (16, 1)],
  term ((-1664 : Rat) / 103) [(1, 1), (4, 1), (5, 1), (14, 2), (16, 1)],
  term ((832 : Rat) / 103) [(1, 1), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((-832 : Rat) / 103) [(1, 1), (5, 1), (14, 1), (16, 1)],
  term ((832 : Rat) / 103) [(1, 1), (5, 1), (14, 3), (16, 1)],
  term ((-1664 : Rat) / 103) [(1, 1), (5, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 15. -/
theorem rs_R013_ueqv_R013NNYN_partial_15_0023_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_15_0023
        rs_R013_ueqv_R013NNYN_generator_15_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_15_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013NNYN_coefficient_15_0024 : Poly :=
[
  term ((372 : Rat) / 103) [(1, 1), (5, 1), (16, 1)]
]

/-- Partial product 24 for generator 15. -/
def rs_R013_ueqv_R013NNYN_partial_15_0024 : Poly :=
[
  term ((744 : Rat) / 103) [(1, 1), (4, 1), (5, 1), (14, 1), (16, 1)],
  term ((-744 : Rat) / 103) [(1, 1), (4, 1), (5, 1), (16, 1)],
  term ((-372 : Rat) / 103) [(1, 1), (5, 1), (14, 2), (16, 1)],
  term ((-372 : Rat) / 103) [(1, 1), (5, 1), (15, 2), (16, 1)],
  term ((372 : Rat) / 103) [(1, 1), (5, 1), (16, 1)],
  term ((744 : Rat) / 103) [(1, 1), (5, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 15. -/
theorem rs_R013_ueqv_R013NNYN_partial_15_0024_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_15_0024
        rs_R013_ueqv_R013NNYN_generator_15_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_15_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013NNYN_coefficient_15_0025 : Poly :=
[
  term ((4224 : Rat) / 103) [(1, 1), (7, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 25 for generator 15. -/
def rs_R013_ueqv_R013NNYN_partial_15_0025 : Poly :=
[
  term ((8448 : Rat) / 103) [(1, 1), (4, 1), (7, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-8448 : Rat) / 103) [(1, 1), (4, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((8448 : Rat) / 103) [(1, 1), (5, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4224 : Rat) / 103) [(1, 1), (7, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-4224 : Rat) / 103) [(1, 1), (7, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((4224 : Rat) / 103) [(1, 1), (7, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 15. -/
theorem rs_R013_ueqv_R013NNYN_partial_15_0025_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_15_0025
        rs_R013_ueqv_R013NNYN_generator_15_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_15_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013NNYN_coefficient_15_0026 : Poly :=
[
  term ((-5760 : Rat) / 103) [(1, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 26 for generator 15. -/
def rs_R013_ueqv_R013NNYN_partial_15_0026 : Poly :=
[
  term ((-11520 : Rat) / 103) [(1, 1), (4, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((11520 : Rat) / 103) [(1, 1), (4, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-11520 : Rat) / 103) [(1, 1), (5, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((5760 : Rat) / 103) [(1, 1), (7, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-5760 : Rat) / 103) [(1, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((5760 : Rat) / 103) [(1, 1), (7, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 15. -/
theorem rs_R013_ueqv_R013NNYN_partial_15_0026_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_15_0026
        rs_R013_ueqv_R013NNYN_generator_15_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_15_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013NNYN_coefficient_15_0027 : Poly :=
[
  term ((64 : Rat) / 103) [(1, 1), (7, 1), (16, 1)]
]

/-- Partial product 27 for generator 15. -/
def rs_R013_ueqv_R013NNYN_partial_15_0027 : Poly :=
[
  term ((128 : Rat) / 103) [(1, 1), (4, 1), (7, 1), (14, 1), (16, 1)],
  term ((-128 : Rat) / 103) [(1, 1), (4, 1), (7, 1), (16, 1)],
  term ((128 : Rat) / 103) [(1, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-64 : Rat) / 103) [(1, 1), (7, 1), (14, 2), (16, 1)],
  term ((-64 : Rat) / 103) [(1, 1), (7, 1), (15, 2), (16, 1)],
  term ((64 : Rat) / 103) [(1, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 15. -/
theorem rs_R013_ueqv_R013NNYN_partial_15_0027_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_15_0027
        rs_R013_ueqv_R013NNYN_generator_15_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_15_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013NNYN_coefficient_15_0028 : Poly :=
[
  term ((-8448 : Rat) / 103) [(1, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 28 for generator 15. -/
def rs_R013_ueqv_R013NNYN_partial_15_0028 : Poly :=
[
  term ((-16896 : Rat) / 103) [(1, 1), (4, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((16896 : Rat) / 103) [(1, 1), (4, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-16896 : Rat) / 103) [(1, 1), (5, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((8448 : Rat) / 103) [(1, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-8448 : Rat) / 103) [(1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((8448 : Rat) / 103) [(1, 1), (9, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 15. -/
theorem rs_R013_ueqv_R013NNYN_partial_15_0028_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_15_0028
        rs_R013_ueqv_R013NNYN_generator_15_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_15_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013NNYN_coefficient_15_0029 : Poly :=
[
  term ((11520 : Rat) / 103) [(1, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 29 for generator 15. -/
def rs_R013_ueqv_R013NNYN_partial_15_0029 : Poly :=
[
  term ((23040 : Rat) / 103) [(1, 1), (4, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-23040 : Rat) / 103) [(1, 1), (4, 1), (9, 1), (15, 2), (16, 1)],
  term ((23040 : Rat) / 103) [(1, 1), (5, 1), (9, 1), (15, 3), (16, 1)],
  term ((-11520 : Rat) / 103) [(1, 1), (9, 1), (14, 2), (15, 2), (16, 1)],
  term ((11520 : Rat) / 103) [(1, 1), (9, 1), (15, 2), (16, 1)],
  term ((-11520 : Rat) / 103) [(1, 1), (9, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 15. -/
theorem rs_R013_ueqv_R013NNYN_partial_15_0029_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_15_0029
        rs_R013_ueqv_R013NNYN_generator_15_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_15_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013NNYN_coefficient_15_0030 : Poly :=
[
  term ((104 : Rat) / 103) [(1, 1), (9, 1), (16, 1)]
]

/-- Partial product 30 for generator 15. -/
def rs_R013_ueqv_R013NNYN_partial_15_0030 : Poly :=
[
  term ((208 : Rat) / 103) [(1, 1), (4, 1), (9, 1), (14, 1), (16, 1)],
  term ((-208 : Rat) / 103) [(1, 1), (4, 1), (9, 1), (16, 1)],
  term ((208 : Rat) / 103) [(1, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-104 : Rat) / 103) [(1, 1), (9, 1), (14, 2), (16, 1)],
  term ((-104 : Rat) / 103) [(1, 1), (9, 1), (15, 2), (16, 1)],
  term ((104 : Rat) / 103) [(1, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 15. -/
theorem rs_R013_ueqv_R013NNYN_partial_15_0030_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_15_0030
        rs_R013_ueqv_R013NNYN_generator_15_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_15_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013NNYN_coefficient_15_0031 : Poly :=
[
  term ((3456 : Rat) / 103) [(1, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 31 for generator 15. -/
def rs_R013_ueqv_R013NNYN_partial_15_0031 : Poly :=
[
  term ((6912 : Rat) / 103) [(1, 1), (4, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-6912 : Rat) / 103) [(1, 1), (4, 1), (12, 1), (13, 1), (16, 1)],
  term ((6912 : Rat) / 103) [(1, 1), (5, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3456 : Rat) / 103) [(1, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-3456 : Rat) / 103) [(1, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((3456 : Rat) / 103) [(1, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 15. -/
theorem rs_R013_ueqv_R013NNYN_partial_15_0031_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_15_0031
        rs_R013_ueqv_R013NNYN_generator_15_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_15_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013NNYN_coefficient_15_0032 : Poly :=
[
  term ((-5472 : Rat) / 103) [(1, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 32 for generator 15. -/
def rs_R013_ueqv_R013NNYN_partial_15_0032 : Poly :=
[
  term ((-10944 : Rat) / 103) [(1, 1), (4, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((10944 : Rat) / 103) [(1, 1), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((-10944 : Rat) / 103) [(1, 1), (5, 1), (12, 1), (15, 2), (16, 1)],
  term ((5472 : Rat) / 103) [(1, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-5472 : Rat) / 103) [(1, 1), (12, 1), (15, 1), (16, 1)],
  term ((5472 : Rat) / 103) [(1, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 15. -/
theorem rs_R013_ueqv_R013NNYN_partial_15_0032_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_15_0032
        rs_R013_ueqv_R013NNYN_generator_15_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_15_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013NNYN_coefficient_15_0033 : Poly :=
[
  term ((1824 : Rat) / 103) [(1, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 33 for generator 15. -/
def rs_R013_ueqv_R013NNYN_partial_15_0033 : Poly :=
[
  term ((-3648 : Rat) / 103) [(1, 1), (4, 1), (13, 1), (14, 1), (16, 1)],
  term ((3648 : Rat) / 103) [(1, 1), (4, 1), (13, 1), (14, 2), (16, 1)],
  term ((3648 : Rat) / 103) [(1, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1824 : Rat) / 103) [(1, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1824 : Rat) / 103) [(1, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1824 : Rat) / 103) [(1, 1), (13, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 15. -/
theorem rs_R013_ueqv_R013NNYN_partial_15_0033_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_15_0033
        rs_R013_ueqv_R013NNYN_generator_15_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_15_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013NNYN_coefficient_15_0034 : Poly :=
[
  term ((-4608 : Rat) / 103) [(1, 1), (13, 1), (16, 1)]
]

/-- Partial product 34 for generator 15. -/
def rs_R013_ueqv_R013NNYN_partial_15_0034 : Poly :=
[
  term ((-9216 : Rat) / 103) [(1, 1), (4, 1), (13, 1), (14, 1), (16, 1)],
  term ((9216 : Rat) / 103) [(1, 1), (4, 1), (13, 1), (16, 1)],
  term ((-9216 : Rat) / 103) [(1, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((4608 : Rat) / 103) [(1, 1), (13, 1), (14, 2), (16, 1)],
  term ((4608 : Rat) / 103) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((-4608 : Rat) / 103) [(1, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 15. -/
theorem rs_R013_ueqv_R013NNYN_partial_15_0034_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_15_0034
        rs_R013_ueqv_R013NNYN_generator_15_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_15_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013NNYN_coefficient_15_0035 : Poly :=
[
  term ((-1368 : Rat) / 103) [(1, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 35 for generator 15. -/
def rs_R013_ueqv_R013NNYN_partial_15_0035 : Poly :=
[
  term ((2736 : Rat) / 103) [(1, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2736 : Rat) / 103) [(1, 1), (4, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2736 : Rat) / 103) [(1, 1), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1368 : Rat) / 103) [(1, 1), (14, 1), (15, 1), (16, 1)],
  term ((1368 : Rat) / 103) [(1, 1), (14, 1), (15, 3), (16, 1)],
  term ((1368 : Rat) / 103) [(1, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 15. -/
theorem rs_R013_ueqv_R013NNYN_partial_15_0035_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_15_0035
        rs_R013_ueqv_R013NNYN_generator_15_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_15_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013NNYN_coefficient_15_0036 : Poly :=
[
  term ((5564 : Rat) / 103) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 36 for generator 15. -/
def rs_R013_ueqv_R013NNYN_partial_15_0036 : Poly :=
[
  term ((11128 : Rat) / 103) [(1, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11128 : Rat) / 103) [(1, 1), (4, 1), (15, 1), (16, 1)],
  term ((11128 : Rat) / 103) [(1, 1), (5, 1), (15, 2), (16, 1)],
  term ((-5564 : Rat) / 103) [(1, 1), (14, 2), (15, 1), (16, 1)],
  term ((5564 : Rat) / 103) [(1, 1), (15, 1), (16, 1)],
  term ((-5564 : Rat) / 103) [(1, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 15. -/
theorem rs_R013_ueqv_R013NNYN_partial_15_0036_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_15_0036
        rs_R013_ueqv_R013NNYN_generator_15_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_15_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013NNYN_coefficient_15_0037 : Poly :=
[
  term ((-432 : Rat) / 103) [(4, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 37 for generator 15. -/
def rs_R013_ueqv_R013NNYN_partial_15_0037 : Poly :=
[
  term ((-864 : Rat) / 103) [(4, 1), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((432 : Rat) / 103) [(4, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-432 : Rat) / 103) [(4, 1), (13, 1), (15, 1), (16, 1)],
  term ((432 : Rat) / 103) [(4, 1), (13, 1), (15, 3), (16, 1)],
  term ((-864 : Rat) / 103) [(4, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((864 : Rat) / 103) [(4, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 15. -/
theorem rs_R013_ueqv_R013NNYN_partial_15_0037_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_15_0037
        rs_R013_ueqv_R013NNYN_generator_15_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_15_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013NNYN_coefficient_15_0038 : Poly :=
[
  term ((-459 : Rat) / 103) [(4, 1), (16, 1)]
]

/-- Partial product 38 for generator 15. -/
def rs_R013_ueqv_R013NNYN_partial_15_0038 : Poly :=
[
  term ((-918 : Rat) / 103) [(4, 1), (5, 1), (15, 1), (16, 1)],
  term ((459 : Rat) / 103) [(4, 1), (14, 2), (16, 1)],
  term ((459 : Rat) / 103) [(4, 1), (15, 2), (16, 1)],
  term ((-459 : Rat) / 103) [(4, 1), (16, 1)],
  term ((-918 : Rat) / 103) [(4, 2), (14, 1), (16, 1)],
  term ((918 : Rat) / 103) [(4, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 15. -/
theorem rs_R013_ueqv_R013NNYN_partial_15_0038_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_15_0038
        rs_R013_ueqv_R013NNYN_generator_15_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_15_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013NNYN_coefficient_15_0039 : Poly :=
[
  term ((-3792 : Rat) / 103) [(5, 1), (7, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 39 for generator 15. -/
def rs_R013_ueqv_R013NNYN_partial_15_0039 : Poly :=
[
  term ((-7584 : Rat) / 103) [(4, 1), (5, 1), (7, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((7584 : Rat) / 103) [(4, 1), (5, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((3792 : Rat) / 103) [(5, 1), (7, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((3792 : Rat) / 103) [(5, 1), (7, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3792 : Rat) / 103) [(5, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((-7584 : Rat) / 103) [(5, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 15. -/
theorem rs_R013_ueqv_R013NNYN_partial_15_0039_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_15_0039
        rs_R013_ueqv_R013NNYN_generator_15_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_15_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013NNYN_coefficient_15_0040 : Poly :=
[
  term ((5424 : Rat) / 103) [(5, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 40 for generator 15. -/
def rs_R013_ueqv_R013NNYN_partial_15_0040 : Poly :=
[
  term ((10848 : Rat) / 103) [(4, 1), (5, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10848 : Rat) / 103) [(4, 1), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-5424 : Rat) / 103) [(5, 1), (7, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((5424 : Rat) / 103) [(5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-5424 : Rat) / 103) [(5, 1), (7, 1), (9, 1), (15, 3), (16, 1)],
  term ((10848 : Rat) / 103) [(5, 2), (7, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 15. -/
theorem rs_R013_ueqv_R013NNYN_partial_15_0040_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_15_0040
        rs_R013_ueqv_R013NNYN_generator_15_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_15_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013NNYN_coefficient_15_0041 : Poly :=
[
  term ((7584 : Rat) / 103) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 41 for generator 15. -/
def rs_R013_ueqv_R013NNYN_partial_15_0041 : Poly :=
[
  term ((15168 : Rat) / 103) [(4, 1), (5, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-15168 : Rat) / 103) [(4, 1), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-7584 : Rat) / 103) [(5, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((7584 : Rat) / 103) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-7584 : Rat) / 103) [(5, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((15168 : Rat) / 103) [(5, 2), (9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 15. -/
theorem rs_R013_ueqv_R013NNYN_partial_15_0041_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_15_0041
        rs_R013_ueqv_R013NNYN_generator_15_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_15_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013NNYN_coefficient_15_0042 : Poly :=
[
  term ((-10848 : Rat) / 103) [(5, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 42 for generator 15. -/
def rs_R013_ueqv_R013NNYN_partial_15_0042 : Poly :=
[
  term ((-21696 : Rat) / 103) [(4, 1), (5, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((21696 : Rat) / 103) [(4, 1), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((10848 : Rat) / 103) [(5, 1), (9, 1), (14, 2), (15, 2), (16, 1)],
  term ((-10848 : Rat) / 103) [(5, 1), (9, 1), (15, 2), (16, 1)],
  term ((10848 : Rat) / 103) [(5, 1), (9, 1), (15, 4), (16, 1)],
  term ((-21696 : Rat) / 103) [(5, 2), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 15. -/
theorem rs_R013_ueqv_R013NNYN_partial_15_0042_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_15_0042
        rs_R013_ueqv_R013NNYN_generator_15_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_15_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013NNYN_coefficient_15_0043 : Poly :=
[
  term ((-7584 : Rat) / 103) [(5, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 43 for generator 15. -/
def rs_R013_ueqv_R013NNYN_partial_15_0043 : Poly :=
[
  term ((15168 : Rat) / 103) [(4, 1), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((-15168 : Rat) / 103) [(4, 1), (5, 1), (13, 1), (14, 2), (16, 1)],
  term ((7584 : Rat) / 103) [(5, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-7584 : Rat) / 103) [(5, 1), (13, 1), (14, 1), (16, 1)],
  term ((7584 : Rat) / 103) [(5, 1), (13, 1), (14, 3), (16, 1)],
  term ((-15168 : Rat) / 103) [(5, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 15. -/
theorem rs_R013_ueqv_R013NNYN_partial_15_0043_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_15_0043
        rs_R013_ueqv_R013NNYN_generator_15_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_15_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013NNYN_coefficient_15_0044 : Poly :=
[
  term ((4836 : Rat) / 103) [(5, 1), (13, 1), (16, 1)]
]

/-- Partial product 44 for generator 15. -/
def rs_R013_ueqv_R013NNYN_partial_15_0044 : Poly :=
[
  term ((9672 : Rat) / 103) [(4, 1), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((-9672 : Rat) / 103) [(4, 1), (5, 1), (13, 1), (16, 1)],
  term ((-4836 : Rat) / 103) [(5, 1), (13, 1), (14, 2), (16, 1)],
  term ((-4836 : Rat) / 103) [(5, 1), (13, 1), (15, 2), (16, 1)],
  term ((4836 : Rat) / 103) [(5, 1), (13, 1), (16, 1)],
  term ((9672 : Rat) / 103) [(5, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 15. -/
theorem rs_R013_ueqv_R013NNYN_partial_15_0044_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_15_0044
        rs_R013_ueqv_R013NNYN_generator_15_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_15_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013NNYN_coefficient_15_0045 : Poly :=
[
  term ((10848 : Rat) / 103) [(5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 45 for generator 15. -/
def rs_R013_ueqv_R013NNYN_partial_15_0045 : Poly :=
[
  term ((-21696 : Rat) / 103) [(4, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((21696 : Rat) / 103) [(4, 1), (5, 1), (14, 2), (15, 1), (16, 1)],
  term ((10848 : Rat) / 103) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10848 : Rat) / 103) [(5, 1), (14, 1), (15, 3), (16, 1)],
  term ((-10848 : Rat) / 103) [(5, 1), (14, 3), (15, 1), (16, 1)],
  term ((21696 : Rat) / 103) [(5, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 15. -/
theorem rs_R013_ueqv_R013NNYN_partial_15_0045_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_15_0045
        rs_R013_ueqv_R013NNYN_generator_15_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_15_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013NNYN_coefficient_15_0046 : Poly :=
[
  term ((-6768 : Rat) / 103) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 46 for generator 15. -/
def rs_R013_ueqv_R013NNYN_partial_15_0046 : Poly :=
[
  term ((-13536 : Rat) / 103) [(4, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((13536 : Rat) / 103) [(4, 1), (5, 1), (15, 1), (16, 1)],
  term ((6768 : Rat) / 103) [(5, 1), (14, 2), (15, 1), (16, 1)],
  term ((-6768 : Rat) / 103) [(5, 1), (15, 1), (16, 1)],
  term ((6768 : Rat) / 103) [(5, 1), (15, 3), (16, 1)],
  term ((-13536 : Rat) / 103) [(5, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 15. -/
theorem rs_R013_ueqv_R013NNYN_partial_15_0046_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_15_0046
        rs_R013_ueqv_R013NNYN_generator_15_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_15_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013NNYN_coefficient_15_0047 : Poly :=
[
  term ((464 : Rat) / 103) [(7, 1), (9, 1), (16, 1)]
]

/-- Partial product 47 for generator 15. -/
def rs_R013_ueqv_R013NNYN_partial_15_0047 : Poly :=
[
  term ((928 : Rat) / 103) [(4, 1), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((-928 : Rat) / 103) [(4, 1), (7, 1), (9, 1), (16, 1)],
  term ((928 : Rat) / 103) [(5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-464 : Rat) / 103) [(7, 1), (9, 1), (14, 2), (16, 1)],
  term ((-464 : Rat) / 103) [(7, 1), (9, 1), (15, 2), (16, 1)],
  term ((464 : Rat) / 103) [(7, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 15. -/
theorem rs_R013_ueqv_R013NNYN_partial_15_0047_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_15_0047
        rs_R013_ueqv_R013NNYN_generator_15_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_15_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013NNYN_coefficient_15_0048 : Poly :=
[
  term ((1252 : Rat) / 103) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 48 for generator 15. -/
def rs_R013_ueqv_R013NNYN_partial_15_0048 : Poly :=
[
  term ((2504 : Rat) / 103) [(4, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2504 : Rat) / 103) [(4, 1), (7, 1), (13, 1), (16, 1)],
  term ((2504 : Rat) / 103) [(5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1252 : Rat) / 103) [(7, 1), (13, 1), (14, 2), (16, 1)],
  term ((-1252 : Rat) / 103) [(7, 1), (13, 1), (15, 2), (16, 1)],
  term ((1252 : Rat) / 103) [(7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 15. -/
theorem rs_R013_ueqv_R013NNYN_partial_15_0048_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_15_0048
        rs_R013_ueqv_R013NNYN_generator_15_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_15_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013NNYN_coefficient_15_0049 : Poly :=
[
  term (-12 : Rat) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 49 for generator 15. -/
def rs_R013_ueqv_R013NNYN_partial_15_0049 : Poly :=
[
  term (-24 : Rat) [(4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(4, 1), (7, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(5, 1), (7, 1), (15, 2), (16, 1)],
  term (12 : Rat) [(7, 1), (14, 2), (15, 1), (16, 1)],
  term (-12 : Rat) [(7, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 15. -/
theorem rs_R013_ueqv_R013NNYN_partial_15_0049_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_15_0049
        rs_R013_ueqv_R013NNYN_generator_15_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_15_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013NNYN_coefficient_15_0050 : Poly :=
[
  term ((948 : Rat) / 103) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 50 for generator 15. -/
def rs_R013_ueqv_R013NNYN_partial_15_0050 : Poly :=
[
  term ((1896 : Rat) / 103) [(4, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1896 : Rat) / 103) [(4, 1), (9, 1), (13, 1), (16, 1)],
  term ((1896 : Rat) / 103) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-948 : Rat) / 103) [(9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-948 : Rat) / 103) [(9, 1), (13, 1), (15, 2), (16, 1)],
  term ((948 : Rat) / 103) [(9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 15. -/
theorem rs_R013_ueqv_R013NNYN_partial_15_0050_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_15_0050
        rs_R013_ueqv_R013NNYN_generator_15_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_15_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013NNYN_coefficient_15_0051 : Poly :=
[
  term ((-2284 : Rat) / 103) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 51 for generator 15. -/
def rs_R013_ueqv_R013NNYN_partial_15_0051 : Poly :=
[
  term ((-4568 : Rat) / 103) [(4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((4568 : Rat) / 103) [(4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-4568 : Rat) / 103) [(5, 1), (9, 1), (15, 2), (16, 1)],
  term ((2284 : Rat) / 103) [(9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2284 : Rat) / 103) [(9, 1), (15, 1), (16, 1)],
  term ((2284 : Rat) / 103) [(9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 15. -/
theorem rs_R013_ueqv_R013NNYN_partial_15_0051_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_15_0051
        rs_R013_ueqv_R013NNYN_generator_15_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_15_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013NNYN_coefficient_15_0052 : Poly :=
[
  term ((-576 : Rat) / 103) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 52 for generator 15. -/
def rs_R013_ueqv_R013NNYN_partial_15_0052 : Poly :=
[
  term ((-1152 : Rat) / 103) [(4, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1152 : Rat) / 103) [(4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1152 : Rat) / 103) [(5, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((576 : Rat) / 103) [(12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-576 : Rat) / 103) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((576 : Rat) / 103) [(12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 15. -/
theorem rs_R013_ueqv_R013NNYN_partial_15_0052_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_15_0052
        rs_R013_ueqv_R013NNYN_generator_15_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_15_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013NNYN_coefficient_15_0053 : Poly :=
[
  term ((696 : Rat) / 103) [(12, 1), (16, 1)]
]

/-- Partial product 53 for generator 15. -/
def rs_R013_ueqv_R013NNYN_partial_15_0053 : Poly :=
[
  term ((1392 : Rat) / 103) [(4, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1392 : Rat) / 103) [(4, 1), (12, 1), (16, 1)],
  term ((1392 : Rat) / 103) [(5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-696 : Rat) / 103) [(12, 1), (14, 2), (16, 1)],
  term ((-696 : Rat) / 103) [(12, 1), (15, 2), (16, 1)],
  term ((696 : Rat) / 103) [(12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 15. -/
theorem rs_R013_ueqv_R013NNYN_partial_15_0053_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_15_0053
        rs_R013_ueqv_R013NNYN_generator_15_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_15_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013NNYN_coefficient_15_0054 : Poly :=
[
  term ((-1296 : Rat) / 103) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 54 for generator 15. -/
def rs_R013_ueqv_R013NNYN_partial_15_0054 : Poly :=
[
  term ((2592 : Rat) / 103) [(4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2592 : Rat) / 103) [(4, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2592 : Rat) / 103) [(5, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1296 : Rat) / 103) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1296 : Rat) / 103) [(13, 1), (14, 1), (15, 3), (16, 1)],
  term ((1296 : Rat) / 103) [(13, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 15. -/
theorem rs_R013_ueqv_R013NNYN_partial_15_0054_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_15_0054
        rs_R013_ueqv_R013NNYN_generator_15_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_15_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013NNYN_coefficient_15_0055 : Poly :=
[
  term ((-296 : Rat) / 103) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 55 for generator 15. -/
def rs_R013_ueqv_R013NNYN_partial_15_0055 : Poly :=
[
  term ((-592 : Rat) / 103) [(4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((592 : Rat) / 103) [(4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-592 : Rat) / 103) [(5, 1), (13, 1), (15, 2), (16, 1)],
  term ((296 : Rat) / 103) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-296 : Rat) / 103) [(13, 1), (15, 1), (16, 1)],
  term ((296 : Rat) / 103) [(13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 15. -/
theorem rs_R013_ueqv_R013NNYN_partial_15_0055_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_15_0055
        rs_R013_ueqv_R013NNYN_generator_15_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_15_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013NNYN_coefficient_15_0056 : Poly :=
[
  term ((768 : Rat) / 103) [(13, 2), (14, 1), (16, 1)]
]

/-- Partial product 56 for generator 15. -/
def rs_R013_ueqv_R013NNYN_partial_15_0056 : Poly :=
[
  term ((-1536 : Rat) / 103) [(4, 1), (13, 2), (14, 1), (16, 1)],
  term ((1536 : Rat) / 103) [(4, 1), (13, 2), (14, 2), (16, 1)],
  term ((1536 : Rat) / 103) [(5, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-768 : Rat) / 103) [(13, 2), (14, 1), (15, 2), (16, 1)],
  term ((768 : Rat) / 103) [(13, 2), (14, 1), (16, 1)],
  term ((-768 : Rat) / 103) [(13, 2), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 15. -/
theorem rs_R013_ueqv_R013NNYN_partial_15_0056_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_15_0056
        rs_R013_ueqv_R013NNYN_generator_15_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_15_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013NNYN_coefficient_15_0057 : Poly :=
[
  term ((-576 : Rat) / 103) [(13, 2), (16, 1)]
]

/-- Partial product 57 for generator 15. -/
def rs_R013_ueqv_R013NNYN_partial_15_0057 : Poly :=
[
  term ((-1152 : Rat) / 103) [(4, 1), (13, 2), (14, 1), (16, 1)],
  term ((1152 : Rat) / 103) [(4, 1), (13, 2), (16, 1)],
  term ((-1152 : Rat) / 103) [(5, 1), (13, 2), (15, 1), (16, 1)],
  term ((576 : Rat) / 103) [(13, 2), (14, 2), (16, 1)],
  term ((576 : Rat) / 103) [(13, 2), (15, 2), (16, 1)],
  term ((-576 : Rat) / 103) [(13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 15. -/
theorem rs_R013_ueqv_R013NNYN_partial_15_0057_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_15_0057
        rs_R013_ueqv_R013NNYN_generator_15_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_15_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013NNYN_coefficient_15_0058 : Poly :=
[
  term ((-713 : Rat) / 103) [(14, 1), (16, 1)]
]

/-- Partial product 58 for generator 15. -/
def rs_R013_ueqv_R013NNYN_partial_15_0058 : Poly :=
[
  term ((1426 : Rat) / 103) [(4, 1), (14, 1), (16, 1)],
  term ((-1426 : Rat) / 103) [(4, 1), (14, 2), (16, 1)],
  term ((-1426 : Rat) / 103) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term ((713 : Rat) / 103) [(14, 1), (15, 2), (16, 1)],
  term ((-713 : Rat) / 103) [(14, 1), (16, 1)],
  term ((713 : Rat) / 103) [(14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 15. -/
theorem rs_R013_ueqv_R013NNYN_partial_15_0058_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_15_0058
        rs_R013_ueqv_R013NNYN_generator_15_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_15_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013NNYN_coefficient_15_0059 : Poly :=
[
  term ((2748 : Rat) / 103) [(15, 2), (16, 1)]
]

/-- Partial product 59 for generator 15. -/
def rs_R013_ueqv_R013NNYN_partial_15_0059 : Poly :=
[
  term ((5496 : Rat) / 103) [(4, 1), (14, 1), (15, 2), (16, 1)],
  term ((-5496 : Rat) / 103) [(4, 1), (15, 2), (16, 1)],
  term ((5496 : Rat) / 103) [(5, 1), (15, 3), (16, 1)],
  term ((-2748 : Rat) / 103) [(14, 2), (15, 2), (16, 1)],
  term ((2748 : Rat) / 103) [(15, 2), (16, 1)],
  term ((-2748 : Rat) / 103) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 15. -/
theorem rs_R013_ueqv_R013NNYN_partial_15_0059_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_15_0059
        rs_R013_ueqv_R013NNYN_generator_15_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_15_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 15. -/
def rs_R013_ueqv_R013NNYN_coefficient_15_0060 : Poly :=
[
  term ((243 : Rat) / 103) [(16, 1)]
]

/-- Partial product 60 for generator 15. -/
def rs_R013_ueqv_R013NNYN_partial_15_0060 : Poly :=
[
  term ((486 : Rat) / 103) [(4, 1), (14, 1), (16, 1)],
  term ((-486 : Rat) / 103) [(4, 1), (16, 1)],
  term ((486 : Rat) / 103) [(5, 1), (15, 1), (16, 1)],
  term ((-243 : Rat) / 103) [(14, 2), (16, 1)],
  term ((-243 : Rat) / 103) [(15, 2), (16, 1)],
  term ((243 : Rat) / 103) [(16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 15. -/
theorem rs_R013_ueqv_R013NNYN_partial_15_0060_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_15_0060
        rs_R013_ueqv_R013NNYN_generator_15_0000_0060 =
      rs_R013_ueqv_R013NNYN_partial_15_0060 := by
  native_decide

/-- Partial products in this block. -/
def rs_R013_ueqv_R013NNYN_partials_15_0000_0060 : List Poly :=
[
  rs_R013_ueqv_R013NNYN_partial_15_0000,
  rs_R013_ueqv_R013NNYN_partial_15_0001,
  rs_R013_ueqv_R013NNYN_partial_15_0002,
  rs_R013_ueqv_R013NNYN_partial_15_0003,
  rs_R013_ueqv_R013NNYN_partial_15_0004,
  rs_R013_ueqv_R013NNYN_partial_15_0005,
  rs_R013_ueqv_R013NNYN_partial_15_0006,
  rs_R013_ueqv_R013NNYN_partial_15_0007,
  rs_R013_ueqv_R013NNYN_partial_15_0008,
  rs_R013_ueqv_R013NNYN_partial_15_0009,
  rs_R013_ueqv_R013NNYN_partial_15_0010,
  rs_R013_ueqv_R013NNYN_partial_15_0011,
  rs_R013_ueqv_R013NNYN_partial_15_0012,
  rs_R013_ueqv_R013NNYN_partial_15_0013,
  rs_R013_ueqv_R013NNYN_partial_15_0014,
  rs_R013_ueqv_R013NNYN_partial_15_0015,
  rs_R013_ueqv_R013NNYN_partial_15_0016,
  rs_R013_ueqv_R013NNYN_partial_15_0017,
  rs_R013_ueqv_R013NNYN_partial_15_0018,
  rs_R013_ueqv_R013NNYN_partial_15_0019,
  rs_R013_ueqv_R013NNYN_partial_15_0020,
  rs_R013_ueqv_R013NNYN_partial_15_0021,
  rs_R013_ueqv_R013NNYN_partial_15_0022,
  rs_R013_ueqv_R013NNYN_partial_15_0023,
  rs_R013_ueqv_R013NNYN_partial_15_0024,
  rs_R013_ueqv_R013NNYN_partial_15_0025,
  rs_R013_ueqv_R013NNYN_partial_15_0026,
  rs_R013_ueqv_R013NNYN_partial_15_0027,
  rs_R013_ueqv_R013NNYN_partial_15_0028,
  rs_R013_ueqv_R013NNYN_partial_15_0029,
  rs_R013_ueqv_R013NNYN_partial_15_0030,
  rs_R013_ueqv_R013NNYN_partial_15_0031,
  rs_R013_ueqv_R013NNYN_partial_15_0032,
  rs_R013_ueqv_R013NNYN_partial_15_0033,
  rs_R013_ueqv_R013NNYN_partial_15_0034,
  rs_R013_ueqv_R013NNYN_partial_15_0035,
  rs_R013_ueqv_R013NNYN_partial_15_0036,
  rs_R013_ueqv_R013NNYN_partial_15_0037,
  rs_R013_ueqv_R013NNYN_partial_15_0038,
  rs_R013_ueqv_R013NNYN_partial_15_0039,
  rs_R013_ueqv_R013NNYN_partial_15_0040,
  rs_R013_ueqv_R013NNYN_partial_15_0041,
  rs_R013_ueqv_R013NNYN_partial_15_0042,
  rs_R013_ueqv_R013NNYN_partial_15_0043,
  rs_R013_ueqv_R013NNYN_partial_15_0044,
  rs_R013_ueqv_R013NNYN_partial_15_0045,
  rs_R013_ueqv_R013NNYN_partial_15_0046,
  rs_R013_ueqv_R013NNYN_partial_15_0047,
  rs_R013_ueqv_R013NNYN_partial_15_0048,
  rs_R013_ueqv_R013NNYN_partial_15_0049,
  rs_R013_ueqv_R013NNYN_partial_15_0050,
  rs_R013_ueqv_R013NNYN_partial_15_0051,
  rs_R013_ueqv_R013NNYN_partial_15_0052,
  rs_R013_ueqv_R013NNYN_partial_15_0053,
  rs_R013_ueqv_R013NNYN_partial_15_0054,
  rs_R013_ueqv_R013NNYN_partial_15_0055,
  rs_R013_ueqv_R013NNYN_partial_15_0056,
  rs_R013_ueqv_R013NNYN_partial_15_0057,
  rs_R013_ueqv_R013NNYN_partial_15_0058,
  rs_R013_ueqv_R013NNYN_partial_15_0059,
  rs_R013_ueqv_R013NNYN_partial_15_0060
]

/-- Sum of partial products in this block. -/
def rs_R013_ueqv_R013NNYN_block_15_0000_0060 : Poly :=
[
  term ((11520 : Rat) / 103) [(0, 1), (4, 1), (5, 1), (7, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-11520 : Rat) / 103) [(0, 1), (4, 1), (5, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((-18048 : Rat) / 103) [(0, 1), (4, 1), (5, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((18048 : Rat) / 103) [(0, 1), (4, 1), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-23040 : Rat) / 103) [(0, 1), (4, 1), (5, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((23040 : Rat) / 103) [(0, 1), (4, 1), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((36096 : Rat) / 103) [(0, 1), (4, 1), (5, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-36096 : Rat) / 103) [(0, 1), (4, 1), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-38592 : Rat) / 103) [(0, 1), (4, 1), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((23040 : Rat) / 103) [(0, 1), (4, 1), (5, 1), (13, 1), (14, 2), (16, 1)],
  term ((15552 : Rat) / 103) [(0, 1), (4, 1), (5, 1), (13, 1), (16, 1)],
  term ((60432 : Rat) / 103) [(0, 1), (4, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-36096 : Rat) / 103) [(0, 1), (4, 1), (5, 1), (14, 2), (15, 1), (16, 1)],
  term ((-22824 : Rat) / 103) [(0, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-832 : Rat) / 103) [(0, 1), (4, 1), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((832 : Rat) / 103) [(0, 1), (4, 1), (7, 1), (9, 1), (16, 1)],
  term ((-576 : Rat) / 103) [(0, 1), (4, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((576 : Rat) / 103) [(0, 1), (4, 1), (7, 1), (13, 1), (16, 1)],
  term ((960 : Rat) / 103) [(0, 1), (4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-960 : Rat) / 103) [(0, 1), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-2880 : Rat) / 103) [(0, 1), (4, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((2880 : Rat) / 103) [(0, 1), (4, 1), (9, 1), (13, 1), (16, 1)],
  term ((6176 : Rat) / 103) [(0, 1), (4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6176 : Rat) / 103) [(0, 1), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1248 : Rat) / 103) [(0, 1), (4, 1), (12, 1), (14, 1), (16, 1)],
  term ((1248 : Rat) / 103) [(0, 1), (4, 1), (12, 1), (16, 1)],
  term ((2304 : Rat) / 103) [(0, 1), (4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2304 : Rat) / 103) [(0, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3696 : Rat) / 103) [(0, 1), (4, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2272 : Rat) / 103) [(0, 1), (4, 1), (14, 1), (16, 1)],
  term ((580 : Rat) / 103) [(0, 1), (4, 1), (14, 2), (16, 1)],
  term ((2940 : Rat) / 103) [(0, 1), (4, 1), (15, 2), (16, 1)],
  term ((1692 : Rat) / 103) [(0, 1), (4, 1), (16, 1)],
  term ((1512 : Rat) / 103) [(0, 1), (4, 2), (14, 1), (16, 1)],
  term ((-1512 : Rat) / 103) [(0, 1), (4, 2), (16, 1)],
  term ((-5760 : Rat) / 103) [(0, 1), (5, 1), (7, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-5760 : Rat) / 103) [(0, 1), (5, 1), (7, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((5760 : Rat) / 103) [(0, 1), (5, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((9024 : Rat) / 103) [(0, 1), (5, 1), (7, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-9856 : Rat) / 103) [(0, 1), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((9024 : Rat) / 103) [(0, 1), (5, 1), (7, 1), (9, 1), (15, 3), (16, 1)],
  term ((-576 : Rat) / 103) [(0, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((960 : Rat) / 103) [(0, 1), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((11520 : Rat) / 103) [(0, 1), (5, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-14400 : Rat) / 103) [(0, 1), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((11520 : Rat) / 103) [(0, 1), (5, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((-18048 : Rat) / 103) [(0, 1), (5, 1), (9, 1), (14, 2), (15, 2), (16, 1)],
  term ((24224 : Rat) / 103) [(0, 1), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-18048 : Rat) / 103) [(0, 1), (5, 1), (9, 1), (15, 4), (16, 1)],
  term ((-1248 : Rat) / 103) [(0, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-11520 : Rat) / 103) [(0, 1), (5, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((11520 : Rat) / 103) [(0, 1), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((7776 : Rat) / 103) [(0, 1), (5, 1), (13, 1), (14, 2), (16, 1)],
  term ((-11520 : Rat) / 103) [(0, 1), (5, 1), (13, 1), (14, 3), (16, 1)],
  term ((10080 : Rat) / 103) [(0, 1), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((-7776 : Rat) / 103) [(0, 1), (5, 1), (13, 1), (16, 1)],
  term ((-16712 : Rat) / 103) [(0, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((18048 : Rat) / 103) [(0, 1), (5, 1), (14, 1), (15, 3), (16, 1)],
  term ((-12168 : Rat) / 103) [(0, 1), (5, 1), (14, 2), (15, 1), (16, 1)],
  term ((18048 : Rat) / 103) [(0, 1), (5, 1), (14, 3), (15, 1), (16, 1)],
  term ((11232 : Rat) / 103) [(0, 1), (5, 1), (15, 1), (16, 1)],
  term ((-15864 : Rat) / 103) [(0, 1), (5, 1), (15, 3), (16, 1)],
  term ((11520 : Rat) / 103) [(0, 1), (5, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-18048 : Rat) / 103) [(0, 1), (5, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-23040 : Rat) / 103) [(0, 1), (5, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((36096 : Rat) / 103) [(0, 1), (5, 2), (9, 1), (15, 3), (16, 1)],
  term ((23040 : Rat) / 103) [(0, 1), (5, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-15552 : Rat) / 103) [(0, 1), (5, 2), (13, 1), (15, 1), (16, 1)],
  term ((-36096 : Rat) / 103) [(0, 1), (5, 2), (14, 1), (15, 2), (16, 1)],
  term ((24336 : Rat) / 103) [(0, 1), (5, 2), (15, 2), (16, 1)],
  term ((416 : Rat) / 103) [(0, 1), (7, 1), (9, 1), (14, 2), (16, 1)],
  term ((416 : Rat) / 103) [(0, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-416 : Rat) / 103) [(0, 1), (7, 1), (9, 1), (16, 1)],
  term ((288 : Rat) / 103) [(0, 1), (7, 1), (13, 1), (14, 2), (16, 1)],
  term ((288 : Rat) / 103) [(0, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-288 : Rat) / 103) [(0, 1), (7, 1), (13, 1), (16, 1)],
  term ((-480 : Rat) / 103) [(0, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((480 : Rat) / 103) [(0, 1), (7, 1), (15, 1), (16, 1)],
  term ((-480 : Rat) / 103) [(0, 1), (7, 1), (15, 3), (16, 1)],
  term ((1440 : Rat) / 103) [(0, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((1440 : Rat) / 103) [(0, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1440 : Rat) / 103) [(0, 1), (9, 1), (13, 1), (16, 1)],
  term ((-3088 : Rat) / 103) [(0, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((3088 : Rat) / 103) [(0, 1), (9, 1), (15, 1), (16, 1)],
  term ((-3088 : Rat) / 103) [(0, 1), (9, 1), (15, 3), (16, 1)],
  term ((624 : Rat) / 103) [(0, 1), (12, 1), (14, 2), (16, 1)],
  term ((624 : Rat) / 103) [(0, 1), (12, 1), (15, 2), (16, 1)],
  term ((-624 : Rat) / 103) [(0, 1), (12, 1), (16, 1)],
  term ((-1152 : Rat) / 103) [(0, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((1152 : Rat) / 103) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1152 : Rat) / 103) [(0, 1), (13, 1), (15, 3), (16, 1)],
  term ((-668 : Rat) / 103) [(0, 1), (14, 1), (15, 2), (16, 1)],
  term ((668 : Rat) / 103) [(0, 1), (14, 1), (16, 1)],
  term ((1848 : Rat) / 103) [(0, 1), (14, 2), (15, 2), (16, 1)],
  term ((468 : Rat) / 103) [(0, 1), (14, 2), (16, 1)],
  term ((-668 : Rat) / 103) [(0, 1), (14, 3), (16, 1)],
  term ((-1380 : Rat) / 103) [(0, 1), (15, 2), (16, 1)],
  term ((1848 : Rat) / 103) [(0, 1), (15, 4), (16, 1)],
  term ((-468 : Rat) / 103) [(0, 1), (16, 1)],
  term ((-832 : Rat) / 103) [(1, 1), (4, 1), (5, 1), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((832 : Rat) / 103) [(1, 1), (4, 1), (5, 1), (7, 1), (9, 1), (16, 1)],
  term ((1664 : Rat) / 103) [(1, 1), (4, 1), (5, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1664 : Rat) / 103) [(1, 1), (4, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((4032 : Rat) / 103) [(1, 1), (4, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((2408 : Rat) / 103) [(1, 1), (4, 1), (5, 1), (14, 1), (16, 1)],
  term ((-1664 : Rat) / 103) [(1, 1), (4, 1), (5, 1), (14, 2), (16, 1)],
  term ((-4752 : Rat) / 103) [(1, 1), (4, 1), (5, 1), (15, 2), (16, 1)],
  term ((-744 : Rat) / 103) [(1, 1), (4, 1), (5, 1), (16, 1)],
  term ((8448 : Rat) / 103) [(1, 1), (4, 1), (7, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-8448 : Rat) / 103) [(1, 1), (4, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((-11520 : Rat) / 103) [(1, 1), (4, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((11520 : Rat) / 103) [(1, 1), (4, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((128 : Rat) / 103) [(1, 1), (4, 1), (7, 1), (14, 1), (16, 1)],
  term ((-128 : Rat) / 103) [(1, 1), (4, 1), (7, 1), (16, 1)],
  term ((-16896 : Rat) / 103) [(1, 1), (4, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((16896 : Rat) / 103) [(1, 1), (4, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((23040 : Rat) / 103) [(1, 1), (4, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((208 : Rat) / 103) [(1, 1), (4, 1), (9, 1), (14, 1), (16, 1)],
  term ((-23040 : Rat) / 103) [(1, 1), (4, 1), (9, 1), (15, 2), (16, 1)],
  term ((-208 : Rat) / 103) [(1, 1), (4, 1), (9, 1), (16, 1)],
  term ((6912 : Rat) / 103) [(1, 1), (4, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-6912 : Rat) / 103) [(1, 1), (4, 1), (12, 1), (13, 1), (16, 1)],
  term ((-10944 : Rat) / 103) [(1, 1), (4, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((10944 : Rat) / 103) [(1, 1), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((-12864 : Rat) / 103) [(1, 1), (4, 1), (13, 1), (14, 1), (16, 1)],
  term ((1632 : Rat) / 103) [(1, 1), (4, 1), (13, 1), (14, 2), (16, 1)],
  term ((-2016 : Rat) / 103) [(1, 1), (4, 1), (13, 1), (15, 2), (16, 1)],
  term ((11232 : Rat) / 103) [(1, 1), (4, 1), (13, 1), (16, 1)],
  term ((13864 : Rat) / 103) [(1, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((-360 : Rat) / 103) [(1, 1), (4, 1), (14, 2), (15, 1), (16, 1)],
  term ((-13504 : Rat) / 103) [(1, 1), (4, 1), (15, 1), (16, 1)],
  term ((2376 : Rat) / 103) [(1, 1), (4, 1), (15, 3), (16, 1)],
  term ((4032 : Rat) / 103) [(1, 1), (4, 2), (13, 1), (14, 1), (16, 1)],
  term ((-4032 : Rat) / 103) [(1, 1), (4, 2), (13, 1), (16, 1)],
  term ((-4752 : Rat) / 103) [(1, 1), (4, 2), (14, 1), (15, 1), (16, 1)],
  term ((4752 : Rat) / 103) [(1, 1), (4, 2), (15, 1), (16, 1)],
  term ((8448 : Rat) / 103) [(1, 1), (5, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((416 : Rat) / 103) [(1, 1), (5, 1), (7, 1), (9, 1), (14, 2), (16, 1)],
  term ((-11104 : Rat) / 103) [(1, 1), (5, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-416 : Rat) / 103) [(1, 1), (5, 1), (7, 1), (9, 1), (16, 1)],
  term ((128 : Rat) / 103) [(1, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-16896 : Rat) / 103) [(1, 1), (5, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-832 : Rat) / 103) [(1, 1), (5, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((1040 : Rat) / 103) [(1, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((22208 : Rat) / 103) [(1, 1), (5, 1), (9, 1), (15, 3), (16, 1)],
  term ((6912 : Rat) / 103) [(1, 1), (5, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-10944 : Rat) / 103) [(1, 1), (5, 1), (12, 1), (15, 2), (16, 1)],
  term ((3648 : Rat) / 103) [(1, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9216 : Rat) / 103) [(1, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1904 : Rat) / 103) [(1, 1), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((-832 : Rat) / 103) [(1, 1), (5, 1), (14, 1), (16, 1)],
  term ((-372 : Rat) / 103) [(1, 1), (5, 1), (14, 2), (16, 1)],
  term ((832 : Rat) / 103) [(1, 1), (5, 1), (14, 3), (16, 1)],
  term ((10756 : Rat) / 103) [(1, 1), (5, 1), (15, 2), (16, 1)],
  term ((372 : Rat) / 103) [(1, 1), (5, 1), (16, 1)],
  term ((-832 : Rat) / 103) [(1, 1), (5, 2), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((1664 : Rat) / 103) [(1, 1), (5, 2), (9, 1), (15, 2), (16, 1)],
  term ((-1664 : Rat) / 103) [(1, 1), (5, 2), (14, 1), (15, 1), (16, 1)],
  term ((744 : Rat) / 103) [(1, 1), (5, 2), (15, 1), (16, 1)],
  term ((-4224 : Rat) / 103) [(1, 1), (7, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-4224 : Rat) / 103) [(1, 1), (7, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((4224 : Rat) / 103) [(1, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((5760 : Rat) / 103) [(1, 1), (7, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-5760 : Rat) / 103) [(1, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((5760 : Rat) / 103) [(1, 1), (7, 1), (9, 1), (15, 3), (16, 1)],
  term ((-64 : Rat) / 103) [(1, 1), (7, 1), (14, 2), (16, 1)],
  term ((-64 : Rat) / 103) [(1, 1), (7, 1), (15, 2), (16, 1)],
  term ((64 : Rat) / 103) [(1, 1), (7, 1), (16, 1)],
  term ((8448 : Rat) / 103) [(1, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-8448 : Rat) / 103) [(1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((8448 : Rat) / 103) [(1, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((-11520 : Rat) / 103) [(1, 1), (9, 1), (14, 2), (15, 2), (16, 1)],
  term ((-104 : Rat) / 103) [(1, 1), (9, 1), (14, 2), (16, 1)],
  term ((11416 : Rat) / 103) [(1, 1), (9, 1), (15, 2), (16, 1)],
  term ((-11520 : Rat) / 103) [(1, 1), (9, 1), (15, 4), (16, 1)],
  term ((104 : Rat) / 103) [(1, 1), (9, 1), (16, 1)],
  term ((-3456 : Rat) / 103) [(1, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-3456 : Rat) / 103) [(1, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((3456 : Rat) / 103) [(1, 1), (12, 1), (13, 1), (16, 1)],
  term ((5472 : Rat) / 103) [(1, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-5472 : Rat) / 103) [(1, 1), (12, 1), (15, 1), (16, 1)],
  term ((5472 : Rat) / 103) [(1, 1), (12, 1), (15, 3), (16, 1)],
  term ((-1824 : Rat) / 103) [(1, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1824 : Rat) / 103) [(1, 1), (13, 1), (14, 1), (16, 1)],
  term ((4608 : Rat) / 103) [(1, 1), (13, 1), (14, 2), (16, 1)],
  term ((-1824 : Rat) / 103) [(1, 1), (13, 1), (14, 3), (16, 1)],
  term ((4608 : Rat) / 103) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((-4608 : Rat) / 103) [(1, 1), (13, 1), (16, 1)],
  term ((-1368 : Rat) / 103) [(1, 1), (14, 1), (15, 1), (16, 1)],
  term ((1368 : Rat) / 103) [(1, 1), (14, 1), (15, 3), (16, 1)],
  term ((-5564 : Rat) / 103) [(1, 1), (14, 2), (15, 1), (16, 1)],
  term ((1368 : Rat) / 103) [(1, 1), (14, 3), (15, 1), (16, 1)],
  term ((5564 : Rat) / 103) [(1, 1), (15, 1), (16, 1)],
  term ((-5564 : Rat) / 103) [(1, 1), (15, 3), (16, 1)],
  term ((-7584 : Rat) / 103) [(4, 1), (5, 1), (7, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((7584 : Rat) / 103) [(4, 1), (5, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((10848 : Rat) / 103) [(4, 1), (5, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10848 : Rat) / 103) [(4, 1), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((15168 : Rat) / 103) [(4, 1), (5, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-15168 : Rat) / 103) [(4, 1), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-21696 : Rat) / 103) [(4, 1), (5, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((21696 : Rat) / 103) [(4, 1), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((24840 : Rat) / 103) [(4, 1), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((-15168 : Rat) / 103) [(4, 1), (5, 1), (13, 1), (14, 2), (16, 1)],
  term ((-864 : Rat) / 103) [(4, 1), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((-9672 : Rat) / 103) [(4, 1), (5, 1), (13, 1), (16, 1)],
  term ((-35232 : Rat) / 103) [(4, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((21696 : Rat) / 103) [(4, 1), (5, 1), (14, 2), (15, 1), (16, 1)],
  term ((12618 : Rat) / 103) [(4, 1), (5, 1), (15, 1), (16, 1)],
  term ((928 : Rat) / 103) [(4, 1), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((-928 : Rat) / 103) [(4, 1), (7, 1), (9, 1), (16, 1)],
  term ((2504 : Rat) / 103) [(4, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2504 : Rat) / 103) [(4, 1), (7, 1), (13, 1), (16, 1)],
  term (-24 : Rat) [(4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(4, 1), (7, 1), (15, 1), (16, 1)],
  term ((1896 : Rat) / 103) [(4, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1896 : Rat) / 103) [(4, 1), (9, 1), (13, 1), (16, 1)],
  term ((-4568 : Rat) / 103) [(4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((4568 : Rat) / 103) [(4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1152 : Rat) / 103) [(4, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1152 : Rat) / 103) [(4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1392 : Rat) / 103) [(4, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1392 : Rat) / 103) [(4, 1), (12, 1), (16, 1)],
  term ((2000 : Rat) / 103) [(4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 103) [(4, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((160 : Rat) / 103) [(4, 1), (13, 1), (15, 1), (16, 1)],
  term ((432 : Rat) / 103) [(4, 1), (13, 1), (15, 3), (16, 1)],
  term ((-2688 : Rat) / 103) [(4, 1), (13, 2), (14, 1), (16, 1)],
  term ((1536 : Rat) / 103) [(4, 1), (13, 2), (14, 2), (16, 1)],
  term ((1152 : Rat) / 103) [(4, 1), (13, 2), (16, 1)],
  term ((5496 : Rat) / 103) [(4, 1), (14, 1), (15, 2), (16, 1)],
  term ((1912 : Rat) / 103) [(4, 1), (14, 1), (16, 1)],
  term ((-967 : Rat) / 103) [(4, 1), (14, 2), (16, 1)],
  term ((-5037 : Rat) / 103) [(4, 1), (15, 2), (16, 1)],
  term ((-945 : Rat) / 103) [(4, 1), (16, 1)],
  term ((-864 : Rat) / 103) [(4, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((864 : Rat) / 103) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term ((-918 : Rat) / 103) [(4, 2), (14, 1), (16, 1)],
  term ((918 : Rat) / 103) [(4, 2), (16, 1)],
  term ((3792 : Rat) / 103) [(5, 1), (7, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((3792 : Rat) / 103) [(5, 1), (7, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3792 : Rat) / 103) [(5, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((-5424 : Rat) / 103) [(5, 1), (7, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((6352 : Rat) / 103) [(5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-5424 : Rat) / 103) [(5, 1), (7, 1), (9, 1), (15, 3), (16, 1)],
  term ((2504 : Rat) / 103) [(5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-7584 : Rat) / 103) [(5, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((9480 : Rat) / 103) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-7584 : Rat) / 103) [(5, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((10848 : Rat) / 103) [(5, 1), (9, 1), (14, 2), (15, 2), (16, 1)],
  term ((-15416 : Rat) / 103) [(5, 1), (9, 1), (15, 2), (16, 1)],
  term ((10848 : Rat) / 103) [(5, 1), (9, 1), (15, 4), (16, 1)],
  term ((-1152 : Rat) / 103) [(5, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((1392 : Rat) / 103) [(5, 1), (12, 1), (15, 1), (16, 1)],
  term ((4992 : Rat) / 103) [(5, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-7584 : Rat) / 103) [(5, 1), (13, 1), (14, 1), (16, 1)],
  term ((-4836 : Rat) / 103) [(5, 1), (13, 1), (14, 2), (16, 1)],
  term ((7584 : Rat) / 103) [(5, 1), (13, 1), (14, 3), (16, 1)],
  term ((-5428 : Rat) / 103) [(5, 1), (13, 1), (15, 2), (16, 1)],
  term ((4836 : Rat) / 103) [(5, 1), (13, 1), (16, 1)],
  term ((1536 : Rat) / 103) [(5, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1152 : Rat) / 103) [(5, 1), (13, 2), (15, 1), (16, 1)],
  term ((9422 : Rat) / 103) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10848 : Rat) / 103) [(5, 1), (14, 1), (15, 3), (16, 1)],
  term ((6768 : Rat) / 103) [(5, 1), (14, 2), (15, 1), (16, 1)],
  term ((-10848 : Rat) / 103) [(5, 1), (14, 3), (15, 1), (16, 1)],
  term ((-6282 : Rat) / 103) [(5, 1), (15, 1), (16, 1)],
  term ((12264 : Rat) / 103) [(5, 1), (15, 3), (16, 1)],
  term ((-7584 : Rat) / 103) [(5, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((10848 : Rat) / 103) [(5, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((15168 : Rat) / 103) [(5, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-21696 : Rat) / 103) [(5, 2), (9, 1), (15, 3), (16, 1)],
  term ((-15168 : Rat) / 103) [(5, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((9672 : Rat) / 103) [(5, 2), (13, 1), (15, 1), (16, 1)],
  term ((21696 : Rat) / 103) [(5, 2), (14, 1), (15, 2), (16, 1)],
  term ((-13536 : Rat) / 103) [(5, 2), (15, 2), (16, 1)],
  term ((-464 : Rat) / 103) [(7, 1), (9, 1), (14, 2), (16, 1)],
  term ((-464 : Rat) / 103) [(7, 1), (9, 1), (15, 2), (16, 1)],
  term ((464 : Rat) / 103) [(7, 1), (9, 1), (16, 1)],
  term ((-1252 : Rat) / 103) [(7, 1), (13, 1), (14, 2), (16, 1)],
  term ((-1252 : Rat) / 103) [(7, 1), (13, 1), (15, 2), (16, 1)],
  term ((1252 : Rat) / 103) [(7, 1), (13, 1), (16, 1)],
  term (12 : Rat) [(7, 1), (14, 2), (15, 1), (16, 1)],
  term (-12 : Rat) [(7, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(7, 1), (15, 3), (16, 1)],
  term ((-948 : Rat) / 103) [(9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-948 : Rat) / 103) [(9, 1), (13, 1), (15, 2), (16, 1)],
  term ((948 : Rat) / 103) [(9, 1), (13, 1), (16, 1)],
  term ((2284 : Rat) / 103) [(9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2284 : Rat) / 103) [(9, 1), (15, 1), (16, 1)],
  term ((2284 : Rat) / 103) [(9, 1), (15, 3), (16, 1)],
  term ((576 : Rat) / 103) [(12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-576 : Rat) / 103) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((576 : Rat) / 103) [(12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-696 : Rat) / 103) [(12, 1), (14, 2), (16, 1)],
  term ((-696 : Rat) / 103) [(12, 1), (15, 2), (16, 1)],
  term ((696 : Rat) / 103) [(12, 1), (16, 1)],
  term ((-1296 : Rat) / 103) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1296 : Rat) / 103) [(13, 1), (14, 1), (15, 3), (16, 1)],
  term ((296 : Rat) / 103) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((1296 : Rat) / 103) [(13, 1), (14, 3), (15, 1), (16, 1)],
  term ((-296 : Rat) / 103) [(13, 1), (15, 1), (16, 1)],
  term ((296 : Rat) / 103) [(13, 1), (15, 3), (16, 1)],
  term ((-768 : Rat) / 103) [(13, 2), (14, 1), (15, 2), (16, 1)],
  term ((768 : Rat) / 103) [(13, 2), (14, 1), (16, 1)],
  term ((576 : Rat) / 103) [(13, 2), (14, 2), (16, 1)],
  term ((-768 : Rat) / 103) [(13, 2), (14, 3), (16, 1)],
  term ((576 : Rat) / 103) [(13, 2), (15, 2), (16, 1)],
  term ((-576 : Rat) / 103) [(13, 2), (16, 1)],
  term ((713 : Rat) / 103) [(14, 1), (15, 2), (16, 1)],
  term ((-713 : Rat) / 103) [(14, 1), (16, 1)],
  term ((-2748 : Rat) / 103) [(14, 2), (15, 2), (16, 1)],
  term ((-243 : Rat) / 103) [(14, 2), (16, 1)],
  term ((713 : Rat) / 103) [(14, 3), (16, 1)],
  term ((2505 : Rat) / 103) [(15, 2), (16, 1)],
  term ((-2748 : Rat) / 103) [(15, 4), (16, 1)],
  term ((243 : Rat) / 103) [(16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 15, terms 0 through 60. -/
theorem rs_R013_ueqv_R013NNYN_block_15_0000_0060_valid :
    checkProductSumEq rs_R013_ueqv_R013NNYN_partials_15_0000_0060
      rs_R013_ueqv_R013NNYN_block_15_0000_0060 = true := by
  native_decide

end R013UeqvR013NNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
