/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R005:u=v:R005NNNN, term block 8:0-99

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R005UeqvR005NNNNTermShards

/-- Generator polynomial 8 for relaxed split surplus certificate `R005:u=v:R005NNNN`. -/
def rs_R005_ueqv_R005NNNN_generator_08_0000_0099 : Poly :=
[
  term (-2 : Rat) [(0, 1), (4, 1)],
  term (2 : Rat) [(0, 1), (10, 1)],
  term (-2 : Rat) [(1, 1), (5, 1)],
  term (2 : Rat) [(1, 1), (11, 1)],
  term (1 : Rat) [(4, 2)],
  term (1 : Rat) [(5, 2)],
  term (-1 : Rat) [(10, 2)],
  term (-1 : Rat) [(11, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NNNN_coefficient_08_0000 : Poly :=
[
  term ((6 : Rat) / 7) [(0, 1), (16, 1)]
]

/-- Partial product 0 for generator 8. -/
def rs_R005_ueqv_R005NNNN_partial_08_0000 : Poly :=
[
  term ((-12 : Rat) / 7) [(0, 1), (1, 1), (5, 1), (16, 1)],
  term ((12 : Rat) / 7) [(0, 1), (1, 1), (11, 1), (16, 1)],
  term ((6 : Rat) / 7) [(0, 1), (4, 2), (16, 1)],
  term ((6 : Rat) / 7) [(0, 1), (5, 2), (16, 1)],
  term ((-6 : Rat) / 7) [(0, 1), (10, 2), (16, 1)],
  term ((-6 : Rat) / 7) [(0, 1), (11, 2), (16, 1)],
  term ((-12 : Rat) / 7) [(0, 2), (4, 1), (16, 1)],
  term ((12 : Rat) / 7) [(0, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 8. -/
theorem rs_R005_ueqv_R005NNNN_partial_08_0000_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_08_0000
        rs_R005_ueqv_R005NNNN_generator_08_0000_0099 =
      rs_R005_ueqv_R005NNNN_partial_08_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NNNN_coefficient_08_0001 : Poly :=
[
  term ((6 : Rat) / 7) [(1, 1), (7, 1), (16, 1)]
]

/-- Partial product 1 for generator 8. -/
def rs_R005_ueqv_R005NNNN_partial_08_0001 : Poly :=
[
  term ((-12 : Rat) / 7) [(0, 1), (1, 1), (4, 1), (7, 1), (16, 1)],
  term ((12 : Rat) / 7) [(0, 1), (1, 1), (7, 1), (10, 1), (16, 1)],
  term ((6 : Rat) / 7) [(1, 1), (4, 2), (7, 1), (16, 1)],
  term ((6 : Rat) / 7) [(1, 1), (5, 2), (7, 1), (16, 1)],
  term ((-6 : Rat) / 7) [(1, 1), (7, 1), (10, 2), (16, 1)],
  term ((-6 : Rat) / 7) [(1, 1), (7, 1), (11, 2), (16, 1)],
  term ((-12 : Rat) / 7) [(1, 2), (5, 1), (7, 1), (16, 1)],
  term ((12 : Rat) / 7) [(1, 2), (7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 8. -/
theorem rs_R005_ueqv_R005NNNN_partial_08_0001_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_08_0001
        rs_R005_ueqv_R005NNNN_generator_08_0000_0099 =
      rs_R005_ueqv_R005NNNN_partial_08_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NNNN_coefficient_08_0002 : Poly :=
[
  term ((-24 : Rat) / 7) [(1, 1), (9, 1), (16, 1)]
]

/-- Partial product 2 for generator 8. -/
def rs_R005_ueqv_R005NNNN_partial_08_0002 : Poly :=
[
  term ((48 : Rat) / 7) [(0, 1), (1, 1), (4, 1), (9, 1), (16, 1)],
  term ((-48 : Rat) / 7) [(0, 1), (1, 1), (9, 1), (10, 1), (16, 1)],
  term ((-24 : Rat) / 7) [(1, 1), (4, 2), (9, 1), (16, 1)],
  term ((-24 : Rat) / 7) [(1, 1), (5, 2), (9, 1), (16, 1)],
  term ((24 : Rat) / 7) [(1, 1), (9, 1), (10, 2), (16, 1)],
  term ((24 : Rat) / 7) [(1, 1), (9, 1), (11, 2), (16, 1)],
  term ((48 : Rat) / 7) [(1, 2), (5, 1), (9, 1), (16, 1)],
  term ((-48 : Rat) / 7) [(1, 2), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 8. -/
theorem rs_R005_ueqv_R005NNNN_partial_08_0002_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_08_0002
        rs_R005_ueqv_R005NNNN_generator_08_0000_0099 =
      rs_R005_ueqv_R005NNNN_partial_08_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NNNN_coefficient_08_0003 : Poly :=
[
  term ((-12 : Rat) / 7) [(1, 1), (13, 1), (16, 1)]
]

/-- Partial product 3 for generator 8. -/
def rs_R005_ueqv_R005NNNN_partial_08_0003 : Poly :=
[
  term ((24 : Rat) / 7) [(0, 1), (1, 1), (4, 1), (13, 1), (16, 1)],
  term ((-24 : Rat) / 7) [(0, 1), (1, 1), (10, 1), (13, 1), (16, 1)],
  term ((-12 : Rat) / 7) [(1, 1), (4, 2), (13, 1), (16, 1)],
  term ((-12 : Rat) / 7) [(1, 1), (5, 2), (13, 1), (16, 1)],
  term ((12 : Rat) / 7) [(1, 1), (10, 2), (13, 1), (16, 1)],
  term ((12 : Rat) / 7) [(1, 1), (11, 2), (13, 1), (16, 1)],
  term ((24 : Rat) / 7) [(1, 2), (5, 1), (13, 1), (16, 1)],
  term ((-24 : Rat) / 7) [(1, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 8. -/
theorem rs_R005_ueqv_R005NNNN_partial_08_0003_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_08_0003
        rs_R005_ueqv_R005NNNN_generator_08_0000_0099 =
      rs_R005_ueqv_R005NNNN_partial_08_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NNNN_coefficient_08_0004 : Poly :=
[
  term ((-24 : Rat) / 7) [(3, 1), (4, 1), (9, 1), (16, 1)]
]

/-- Partial product 4 for generator 8. -/
def rs_R005_ueqv_R005NNNN_partial_08_0004 : Poly :=
[
  term ((-48 : Rat) / 7) [(0, 1), (3, 1), (4, 1), (9, 1), (10, 1), (16, 1)],
  term ((48 : Rat) / 7) [(0, 1), (3, 1), (4, 2), (9, 1), (16, 1)],
  term ((48 : Rat) / 7) [(1, 1), (3, 1), (4, 1), (5, 1), (9, 1), (16, 1)],
  term ((-48 : Rat) / 7) [(1, 1), (3, 1), (4, 1), (9, 1), (11, 1), (16, 1)],
  term ((-24 : Rat) / 7) [(3, 1), (4, 1), (5, 2), (9, 1), (16, 1)],
  term ((24 : Rat) / 7) [(3, 1), (4, 1), (9, 1), (10, 2), (16, 1)],
  term ((24 : Rat) / 7) [(3, 1), (4, 1), (9, 1), (11, 2), (16, 1)],
  term ((-24 : Rat) / 7) [(3, 1), (4, 3), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 8. -/
theorem rs_R005_ueqv_R005NNNN_partial_08_0004_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_08_0004
        rs_R005_ueqv_R005NNNN_generator_08_0000_0099 =
      rs_R005_ueqv_R005NNNN_partial_08_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NNNN_coefficient_08_0005 : Poly :=
[
  term ((-6 : Rat) / 7) [(3, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 5 for generator 8. -/
def rs_R005_ueqv_R005NNNN_partial_08_0005 : Poly :=
[
  term ((-12 : Rat) / 7) [(0, 1), (3, 1), (4, 1), (10, 1), (15, 1), (16, 1)],
  term ((12 : Rat) / 7) [(0, 1), (3, 1), (4, 2), (15, 1), (16, 1)],
  term ((12 : Rat) / 7) [(1, 1), (3, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-12 : Rat) / 7) [(1, 1), (3, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-6 : Rat) / 7) [(3, 1), (4, 1), (5, 2), (15, 1), (16, 1)],
  term ((6 : Rat) / 7) [(3, 1), (4, 1), (10, 2), (15, 1), (16, 1)],
  term ((6 : Rat) / 7) [(3, 1), (4, 1), (11, 2), (15, 1), (16, 1)],
  term ((-6 : Rat) / 7) [(3, 1), (4, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 8. -/
theorem rs_R005_ueqv_R005NNNN_partial_08_0005_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_08_0005
        rs_R005_ueqv_R005NNNN_generator_08_0000_0099 =
      rs_R005_ueqv_R005NNNN_partial_08_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NNNN_coefficient_08_0006 : Poly :=
[
  term ((-48 : Rat) / 7) [(3, 1), (5, 1), (8, 1), (16, 1)]
]

/-- Partial product 6 for generator 8. -/
def rs_R005_ueqv_R005NNNN_partial_08_0006 : Poly :=
[
  term ((96 : Rat) / 7) [(0, 1), (3, 1), (4, 1), (5, 1), (8, 1), (16, 1)],
  term ((-96 : Rat) / 7) [(0, 1), (3, 1), (5, 1), (8, 1), (10, 1), (16, 1)],
  term ((-96 : Rat) / 7) [(1, 1), (3, 1), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((96 : Rat) / 7) [(1, 1), (3, 1), (5, 2), (8, 1), (16, 1)],
  term ((-48 : Rat) / 7) [(3, 1), (4, 2), (5, 1), (8, 1), (16, 1)],
  term ((48 : Rat) / 7) [(3, 1), (5, 1), (8, 1), (10, 2), (16, 1)],
  term ((48 : Rat) / 7) [(3, 1), (5, 1), (8, 1), (11, 2), (16, 1)],
  term ((-48 : Rat) / 7) [(3, 1), (5, 3), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 8. -/
theorem rs_R005_ueqv_R005NNNN_partial_08_0006_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_08_0006
        rs_R005_ueqv_R005NNNN_generator_08_0000_0099 =
      rs_R005_ueqv_R005NNNN_partial_08_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NNNN_coefficient_08_0007 : Poly :=
[
  term ((256 : Rat) / 7) [(3, 1), (5, 1), (9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 7 for generator 8. -/
def rs_R005_ueqv_R005NNNN_partial_08_0007 : Poly :=
[
  term ((-512 : Rat) / 7) [(0, 1), (3, 1), (4, 1), (5, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((512 : Rat) / 7) [(0, 1), (3, 1), (5, 1), (9, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((512 : Rat) / 7) [(1, 1), (3, 1), (5, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((-512 : Rat) / 7) [(1, 1), (3, 1), (5, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((256 : Rat) / 7) [(3, 1), (4, 2), (5, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-256 : Rat) / 7) [(3, 1), (5, 1), (9, 1), (10, 2), (11, 1), (15, 2), (16, 1)],
  term ((-256 : Rat) / 7) [(3, 1), (5, 1), (9, 1), (11, 3), (15, 2), (16, 1)],
  term ((256 : Rat) / 7) [(3, 1), (5, 3), (9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 8. -/
theorem rs_R005_ueqv_R005NNNN_partial_08_0007_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_08_0007
        rs_R005_ueqv_R005NNNN_generator_08_0000_0099 =
      rs_R005_ueqv_R005NNNN_partial_08_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NNNN_coefficient_08_0008 : Poly :=
[
  term ((-386 : Rat) / 7) [(3, 1), (5, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 8 for generator 8. -/
def rs_R005_ueqv_R005NNNN_partial_08_0008 : Poly :=
[
  term ((772 : Rat) / 7) [(0, 1), (3, 1), (4, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-772 : Rat) / 7) [(0, 1), (3, 1), (5, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-772 : Rat) / 7) [(1, 1), (3, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((772 : Rat) / 7) [(1, 1), (3, 1), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-386 : Rat) / 7) [(3, 1), (4, 2), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((386 : Rat) / 7) [(3, 1), (5, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((386 : Rat) / 7) [(3, 1), (5, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-386 : Rat) / 7) [(3, 1), (5, 3), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 8. -/
theorem rs_R005_ueqv_R005NNNN_partial_08_0008_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_08_0008
        rs_R005_ueqv_R005NNNN_generator_08_0000_0099 =
      rs_R005_ueqv_R005NNNN_partial_08_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NNNN_coefficient_08_0009 : Poly :=
[
  term ((768 : Rat) / 7) [(3, 1), (5, 1), (9, 1), (15, 3), (16, 1)]
]

/-- Partial product 9 for generator 8. -/
def rs_R005_ueqv_R005NNNN_partial_08_0009 : Poly :=
[
  term ((-1536 : Rat) / 7) [(0, 1), (3, 1), (4, 1), (5, 1), (9, 1), (15, 3), (16, 1)],
  term ((1536 : Rat) / 7) [(0, 1), (3, 1), (5, 1), (9, 1), (10, 1), (15, 3), (16, 1)],
  term ((1536 : Rat) / 7) [(1, 1), (3, 1), (5, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((-1536 : Rat) / 7) [(1, 1), (3, 1), (5, 2), (9, 1), (15, 3), (16, 1)],
  term ((768 : Rat) / 7) [(3, 1), (4, 2), (5, 1), (9, 1), (15, 3), (16, 1)],
  term ((-768 : Rat) / 7) [(3, 1), (5, 1), (9, 1), (10, 2), (15, 3), (16, 1)],
  term ((-768 : Rat) / 7) [(3, 1), (5, 1), (9, 1), (11, 2), (15, 3), (16, 1)],
  term ((768 : Rat) / 7) [(3, 1), (5, 3), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 8. -/
theorem rs_R005_ueqv_R005NNNN_partial_08_0009_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_08_0009
        rs_R005_ueqv_R005NNNN_generator_08_0000_0099 =
      rs_R005_ueqv_R005NNNN_partial_08_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NNNN_coefficient_08_0010 : Poly :=
[
  term ((-320 : Rat) / 7) [(3, 1), (5, 1), (9, 2), (15, 2), (16, 1)]
]

/-- Partial product 10 for generator 8. -/
def rs_R005_ueqv_R005NNNN_partial_08_0010 : Poly :=
[
  term ((640 : Rat) / 7) [(0, 1), (3, 1), (4, 1), (5, 1), (9, 2), (15, 2), (16, 1)],
  term ((-640 : Rat) / 7) [(0, 1), (3, 1), (5, 1), (9, 2), (10, 1), (15, 2), (16, 1)],
  term ((-640 : Rat) / 7) [(1, 1), (3, 1), (5, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((640 : Rat) / 7) [(1, 1), (3, 1), (5, 2), (9, 2), (15, 2), (16, 1)],
  term ((-320 : Rat) / 7) [(3, 1), (4, 2), (5, 1), (9, 2), (15, 2), (16, 1)],
  term ((320 : Rat) / 7) [(3, 1), (5, 1), (9, 2), (10, 2), (15, 2), (16, 1)],
  term ((320 : Rat) / 7) [(3, 1), (5, 1), (9, 2), (11, 2), (15, 2), (16, 1)],
  term ((-320 : Rat) / 7) [(3, 1), (5, 3), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 8. -/
theorem rs_R005_ueqv_R005NNNN_partial_08_0010_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_08_0010
        rs_R005_ueqv_R005NNNN_generator_08_0000_0099 =
      rs_R005_ueqv_R005NNNN_partial_08_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NNNN_coefficient_08_0011 : Poly :=
[
  term ((-144 : Rat) / 7) [(3, 1), (5, 1), (9, 2), (16, 1)]
]

/-- Partial product 11 for generator 8. -/
def rs_R005_ueqv_R005NNNN_partial_08_0011 : Poly :=
[
  term ((288 : Rat) / 7) [(0, 1), (3, 1), (4, 1), (5, 1), (9, 2), (16, 1)],
  term ((-288 : Rat) / 7) [(0, 1), (3, 1), (5, 1), (9, 2), (10, 1), (16, 1)],
  term ((-288 : Rat) / 7) [(1, 1), (3, 1), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((288 : Rat) / 7) [(1, 1), (3, 1), (5, 2), (9, 2), (16, 1)],
  term ((-144 : Rat) / 7) [(3, 1), (4, 2), (5, 1), (9, 2), (16, 1)],
  term ((144 : Rat) / 7) [(3, 1), (5, 1), (9, 2), (10, 2), (16, 1)],
  term ((144 : Rat) / 7) [(3, 1), (5, 1), (9, 2), (11, 2), (16, 1)],
  term ((-144 : Rat) / 7) [(3, 1), (5, 3), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 8. -/
theorem rs_R005_ueqv_R005NNNN_partial_08_0011_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_08_0011
        rs_R005_ueqv_R005NNNN_generator_08_0000_0099 =
      rs_R005_ueqv_R005NNNN_partial_08_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NNNN_coefficient_08_0012 : Poly :=
[
  term ((64 : Rat) / 7) [(3, 1), (5, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 12 for generator 8. -/
def rs_R005_ueqv_R005NNNN_partial_08_0012 : Poly :=
[
  term ((-128 : Rat) / 7) [(0, 1), (3, 1), (4, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((128 : Rat) / 7) [(0, 1), (3, 1), (5, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((128 : Rat) / 7) [(1, 1), (3, 1), (5, 1), (11, 2), (15, 1), (16, 1)],
  term ((-128 : Rat) / 7) [(1, 1), (3, 1), (5, 2), (11, 1), (15, 1), (16, 1)],
  term ((64 : Rat) / 7) [(3, 1), (4, 2), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-64 : Rat) / 7) [(3, 1), (5, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-64 : Rat) / 7) [(3, 1), (5, 1), (11, 3), (15, 1), (16, 1)],
  term ((64 : Rat) / 7) [(3, 1), (5, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 8. -/
theorem rs_R005_ueqv_R005NNNN_partial_08_0012_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_08_0012
        rs_R005_ueqv_R005NNNN_generator_08_0000_0099 =
      rs_R005_ueqv_R005NNNN_partial_08_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NNNN_coefficient_08_0013 : Poly :=
[
  term (36 : Rat) [(3, 1), (5, 1), (15, 2), (16, 1)]
]

/-- Partial product 13 for generator 8. -/
def rs_R005_ueqv_R005NNNN_partial_08_0013 : Poly :=
[
  term (-72 : Rat) [(0, 1), (3, 1), (4, 1), (5, 1), (15, 2), (16, 1)],
  term (72 : Rat) [(0, 1), (3, 1), (5, 1), (10, 1), (15, 2), (16, 1)],
  term (72 : Rat) [(1, 1), (3, 1), (5, 1), (11, 1), (15, 2), (16, 1)],
  term (-72 : Rat) [(1, 1), (3, 1), (5, 2), (15, 2), (16, 1)],
  term (36 : Rat) [(3, 1), (4, 2), (5, 1), (15, 2), (16, 1)],
  term (-36 : Rat) [(3, 1), (5, 1), (10, 2), (15, 2), (16, 1)],
  term (-36 : Rat) [(3, 1), (5, 1), (11, 2), (15, 2), (16, 1)],
  term (36 : Rat) [(3, 1), (5, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 8. -/
theorem rs_R005_ueqv_R005NNNN_partial_08_0013_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_08_0013
        rs_R005_ueqv_R005NNNN_generator_08_0000_0099 =
      rs_R005_ueqv_R005NNNN_partial_08_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NNNN_coefficient_08_0014 : Poly :=
[
  term ((-24 : Rat) / 7) [(3, 1), (5, 1), (16, 1)]
]

/-- Partial product 14 for generator 8. -/
def rs_R005_ueqv_R005NNNN_partial_08_0014 : Poly :=
[
  term ((48 : Rat) / 7) [(0, 1), (3, 1), (4, 1), (5, 1), (16, 1)],
  term ((-48 : Rat) / 7) [(0, 1), (3, 1), (5, 1), (10, 1), (16, 1)],
  term ((-48 : Rat) / 7) [(1, 1), (3, 1), (5, 1), (11, 1), (16, 1)],
  term ((48 : Rat) / 7) [(1, 1), (3, 1), (5, 2), (16, 1)],
  term ((-24 : Rat) / 7) [(3, 1), (4, 2), (5, 1), (16, 1)],
  term ((24 : Rat) / 7) [(3, 1), (5, 1), (10, 2), (16, 1)],
  term ((24 : Rat) / 7) [(3, 1), (5, 1), (11, 2), (16, 1)],
  term ((-24 : Rat) / 7) [(3, 1), (5, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 8. -/
theorem rs_R005_ueqv_R005NNNN_partial_08_0014_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_08_0014
        rs_R005_ueqv_R005NNNN_generator_08_0000_0099 =
      rs_R005_ueqv_R005NNNN_partial_08_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NNNN_coefficient_08_0015 : Poly :=
[
  term ((-64 : Rat) / 7) [(3, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 15 for generator 8. -/
def rs_R005_ueqv_R005NNNN_partial_08_0015 : Poly :=
[
  term ((128 : Rat) / 7) [(0, 1), (3, 1), (4, 1), (8, 1), (15, 1), (16, 1)],
  term ((-128 : Rat) / 7) [(0, 1), (3, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((128 : Rat) / 7) [(1, 1), (3, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-128 : Rat) / 7) [(1, 1), (3, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-64 : Rat) / 7) [(3, 1), (4, 2), (8, 1), (15, 1), (16, 1)],
  term ((-64 : Rat) / 7) [(3, 1), (5, 2), (8, 1), (15, 1), (16, 1)],
  term ((64 : Rat) / 7) [(3, 1), (8, 1), (10, 2), (15, 1), (16, 1)],
  term ((64 : Rat) / 7) [(3, 1), (8, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 8. -/
theorem rs_R005_ueqv_R005NNNN_partial_08_0015_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_08_0015
        rs_R005_ueqv_R005NNNN_generator_08_0000_0099 =
      rs_R005_ueqv_R005NNNN_partial_08_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NNNN_coefficient_08_0016 : Poly :=
[
  term ((128 : Rat) / 7) [(3, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 16 for generator 8. -/
def rs_R005_ueqv_R005NNNN_partial_08_0016 : Poly :=
[
  term ((-256 : Rat) / 7) [(0, 1), (3, 1), (4, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((256 : Rat) / 7) [(0, 1), (3, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-256 : Rat) / 7) [(1, 1), (3, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((256 : Rat) / 7) [(1, 1), (3, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((128 : Rat) / 7) [(3, 1), (4, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((128 : Rat) / 7) [(3, 1), (5, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-128 : Rat) / 7) [(3, 1), (9, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-128 : Rat) / 7) [(3, 1), (9, 1), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 8. -/
theorem rs_R005_ueqv_R005NNNN_partial_08_0016_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_08_0016
        rs_R005_ueqv_R005NNNN_generator_08_0000_0099 =
      rs_R005_ueqv_R005NNNN_partial_08_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NNNN_coefficient_08_0017 : Poly :=
[
  term ((344 : Rat) / 7) [(3, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 17 for generator 8. -/
def rs_R005_ueqv_R005NNNN_partial_08_0017 : Poly :=
[
  term ((-688 : Rat) / 7) [(0, 1), (3, 1), (4, 1), (9, 1), (15, 2), (16, 1)],
  term ((688 : Rat) / 7) [(0, 1), (3, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-688 : Rat) / 7) [(1, 1), (3, 1), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((688 : Rat) / 7) [(1, 1), (3, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((344 : Rat) / 7) [(3, 1), (4, 2), (9, 1), (15, 2), (16, 1)],
  term ((344 : Rat) / 7) [(3, 1), (5, 2), (9, 1), (15, 2), (16, 1)],
  term ((-344 : Rat) / 7) [(3, 1), (9, 1), (10, 2), (15, 2), (16, 1)],
  term ((-344 : Rat) / 7) [(3, 1), (9, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 8. -/
theorem rs_R005_ueqv_R005NNNN_partial_08_0017_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_08_0017
        rs_R005_ueqv_R005NNNN_generator_08_0000_0099 =
      rs_R005_ueqv_R005NNNN_partial_08_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NNNN_coefficient_08_0018 : Poly :=
[
  term ((-137 : Rat) / 14) [(3, 1), (9, 1), (16, 1)]
]

/-- Partial product 18 for generator 8. -/
def rs_R005_ueqv_R005NNNN_partial_08_0018 : Poly :=
[
  term ((137 : Rat) / 7) [(0, 1), (3, 1), (4, 1), (9, 1), (16, 1)],
  term ((-137 : Rat) / 7) [(0, 1), (3, 1), (9, 1), (10, 1), (16, 1)],
  term ((137 : Rat) / 7) [(1, 1), (3, 1), (5, 1), (9, 1), (16, 1)],
  term ((-137 : Rat) / 7) [(1, 1), (3, 1), (9, 1), (11, 1), (16, 1)],
  term ((-137 : Rat) / 14) [(3, 1), (4, 2), (9, 1), (16, 1)],
  term ((-137 : Rat) / 14) [(3, 1), (5, 2), (9, 1), (16, 1)],
  term ((137 : Rat) / 14) [(3, 1), (9, 1), (10, 2), (16, 1)],
  term ((137 : Rat) / 14) [(3, 1), (9, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 8. -/
theorem rs_R005_ueqv_R005NNNN_partial_08_0018_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_08_0018
        rs_R005_ueqv_R005NNNN_generator_08_0000_0099 =
      rs_R005_ueqv_R005NNNN_partial_08_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NNNN_coefficient_08_0019 : Poly :=
[
  term ((-136 : Rat) / 7) [(3, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 19 for generator 8. -/
def rs_R005_ueqv_R005NNNN_partial_08_0019 : Poly :=
[
  term ((272 : Rat) / 7) [(0, 1), (3, 1), (4, 1), (9, 2), (15, 1), (16, 1)],
  term ((-272 : Rat) / 7) [(0, 1), (3, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((272 : Rat) / 7) [(1, 1), (3, 1), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-272 : Rat) / 7) [(1, 1), (3, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-136 : Rat) / 7) [(3, 1), (4, 2), (9, 2), (15, 1), (16, 1)],
  term ((-136 : Rat) / 7) [(3, 1), (5, 2), (9, 2), (15, 1), (16, 1)],
  term ((136 : Rat) / 7) [(3, 1), (9, 2), (10, 2), (15, 1), (16, 1)],
  term ((136 : Rat) / 7) [(3, 1), (9, 2), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 8. -/
theorem rs_R005_ueqv_R005NNNN_partial_08_0019_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_08_0019
        rs_R005_ueqv_R005NNNN_generator_08_0000_0099 =
      rs_R005_ueqv_R005NNNN_partial_08_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NNNN_coefficient_08_0020 : Poly :=
[
  term ((-768 : Rat) / 7) [(3, 1), (9, 2), (15, 3), (16, 1)]
]

/-- Partial product 20 for generator 8. -/
def rs_R005_ueqv_R005NNNN_partial_08_0020 : Poly :=
[
  term ((1536 : Rat) / 7) [(0, 1), (3, 1), (4, 1), (9, 2), (15, 3), (16, 1)],
  term ((-1536 : Rat) / 7) [(0, 1), (3, 1), (9, 2), (10, 1), (15, 3), (16, 1)],
  term ((1536 : Rat) / 7) [(1, 1), (3, 1), (5, 1), (9, 2), (15, 3), (16, 1)],
  term ((-1536 : Rat) / 7) [(1, 1), (3, 1), (9, 2), (11, 1), (15, 3), (16, 1)],
  term ((-768 : Rat) / 7) [(3, 1), (4, 2), (9, 2), (15, 3), (16, 1)],
  term ((-768 : Rat) / 7) [(3, 1), (5, 2), (9, 2), (15, 3), (16, 1)],
  term ((768 : Rat) / 7) [(3, 1), (9, 2), (10, 2), (15, 3), (16, 1)],
  term ((768 : Rat) / 7) [(3, 1), (9, 2), (11, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 8. -/
theorem rs_R005_ueqv_R005NNNN_partial_08_0020_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_08_0020
        rs_R005_ueqv_R005NNNN_generator_08_0000_0099 =
      rs_R005_ueqv_R005NNNN_partial_08_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NNNN_coefficient_08_0021 : Poly :=
[
  term ((-160 : Rat) / 7) [(3, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 21 for generator 8. -/
def rs_R005_ueqv_R005NNNN_partial_08_0021 : Poly :=
[
  term ((320 : Rat) / 7) [(0, 1), (3, 1), (4, 1), (11, 1), (15, 2), (16, 1)],
  term ((-320 : Rat) / 7) [(0, 1), (3, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((320 : Rat) / 7) [(1, 1), (3, 1), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((-320 : Rat) / 7) [(1, 1), (3, 1), (11, 2), (15, 2), (16, 1)],
  term ((-160 : Rat) / 7) [(3, 1), (4, 2), (11, 1), (15, 2), (16, 1)],
  term ((-160 : Rat) / 7) [(3, 1), (5, 2), (11, 1), (15, 2), (16, 1)],
  term ((160 : Rat) / 7) [(3, 1), (10, 2), (11, 1), (15, 2), (16, 1)],
  term ((160 : Rat) / 7) [(3, 1), (11, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 8. -/
theorem rs_R005_ueqv_R005NNNN_partial_08_0021_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_08_0021
        rs_R005_ueqv_R005NNNN_generator_08_0000_0099 =
      rs_R005_ueqv_R005NNNN_partial_08_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NNNN_coefficient_08_0022 : Poly :=
[
  term ((109 : Rat) / 28) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 22 for generator 8. -/
def rs_R005_ueqv_R005NNNN_partial_08_0022 : Poly :=
[
  term ((-109 : Rat) / 14) [(0, 1), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((109 : Rat) / 14) [(0, 1), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-109 : Rat) / 14) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((109 : Rat) / 14) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((109 : Rat) / 28) [(3, 1), (4, 2), (15, 1), (16, 1)],
  term ((109 : Rat) / 28) [(3, 1), (5, 2), (15, 1), (16, 1)],
  term ((-109 : Rat) / 28) [(3, 1), (10, 2), (15, 1), (16, 1)],
  term ((-109 : Rat) / 28) [(3, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 8. -/
theorem rs_R005_ueqv_R005NNNN_partial_08_0022_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_08_0022
        rs_R005_ueqv_R005NNNN_generator_08_0000_0099 =
      rs_R005_ueqv_R005NNNN_partial_08_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NNNN_coefficient_08_0023 : Poly :=
[
  term ((-48 : Rat) / 7) [(3, 1), (15, 3), (16, 1)]
]

/-- Partial product 23 for generator 8. -/
def rs_R005_ueqv_R005NNNN_partial_08_0023 : Poly :=
[
  term ((96 : Rat) / 7) [(0, 1), (3, 1), (4, 1), (15, 3), (16, 1)],
  term ((-96 : Rat) / 7) [(0, 1), (3, 1), (10, 1), (15, 3), (16, 1)],
  term ((96 : Rat) / 7) [(1, 1), (3, 1), (5, 1), (15, 3), (16, 1)],
  term ((-96 : Rat) / 7) [(1, 1), (3, 1), (11, 1), (15, 3), (16, 1)],
  term ((-48 : Rat) / 7) [(3, 1), (4, 2), (15, 3), (16, 1)],
  term ((-48 : Rat) / 7) [(3, 1), (5, 2), (15, 3), (16, 1)],
  term ((48 : Rat) / 7) [(3, 1), (10, 2), (15, 3), (16, 1)],
  term ((48 : Rat) / 7) [(3, 1), (11, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 8. -/
theorem rs_R005_ueqv_R005NNNN_partial_08_0023_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_08_0023
        rs_R005_ueqv_R005NNNN_generator_08_0000_0099 =
      rs_R005_ueqv_R005NNNN_partial_08_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NNNN_coefficient_08_0024 : Poly :=
[
  term ((12 : Rat) / 7) [(4, 1), (7, 1), (9, 1), (16, 1)]
]

/-- Partial product 24 for generator 8. -/
def rs_R005_ueqv_R005NNNN_partial_08_0024 : Poly :=
[
  term ((24 : Rat) / 7) [(0, 1), (4, 1), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((-24 : Rat) / 7) [(0, 1), (4, 2), (7, 1), (9, 1), (16, 1)],
  term ((-24 : Rat) / 7) [(1, 1), (4, 1), (5, 1), (7, 1), (9, 1), (16, 1)],
  term ((24 : Rat) / 7) [(1, 1), (4, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((12 : Rat) / 7) [(4, 1), (5, 2), (7, 1), (9, 1), (16, 1)],
  term ((-12 : Rat) / 7) [(4, 1), (7, 1), (9, 1), (10, 2), (16, 1)],
  term ((-12 : Rat) / 7) [(4, 1), (7, 1), (9, 1), (11, 2), (16, 1)],
  term ((12 : Rat) / 7) [(4, 3), (7, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 8. -/
theorem rs_R005_ueqv_R005NNNN_partial_08_0024_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_08_0024
        rs_R005_ueqv_R005NNNN_generator_08_0000_0099 =
      rs_R005_ueqv_R005NNNN_partial_08_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NNNN_coefficient_08_0025 : Poly :=
[
  term ((-3 : Rat) / 14) [(4, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 25 for generator 8. -/
def rs_R005_ueqv_R005NNNN_partial_08_0025 : Poly :=
[
  term ((-3 : Rat) / 7) [(0, 1), (4, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((3 : Rat) / 7) [(0, 1), (4, 2), (7, 1), (15, 1), (16, 1)],
  term ((3 : Rat) / 7) [(1, 1), (4, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-3 : Rat) / 7) [(1, 1), (4, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3 : Rat) / 14) [(4, 1), (5, 2), (7, 1), (15, 1), (16, 1)],
  term ((3 : Rat) / 14) [(4, 1), (7, 1), (10, 2), (15, 1), (16, 1)],
  term ((3 : Rat) / 14) [(4, 1), (7, 1), (11, 2), (15, 1), (16, 1)],
  term ((-3 : Rat) / 14) [(4, 3), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 8. -/
theorem rs_R005_ueqv_R005NNNN_partial_08_0025_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_08_0025
        rs_R005_ueqv_R005NNNN_generator_08_0000_0099 =
      rs_R005_ueqv_R005NNNN_partial_08_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NNNN_coefficient_08_0026 : Poly :=
[
  term ((24 : Rat) / 7) [(4, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 26 for generator 8. -/
def rs_R005_ueqv_R005NNNN_partial_08_0026 : Poly :=
[
  term ((48 : Rat) / 7) [(0, 1), (4, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-48 : Rat) / 7) [(0, 1), (4, 2), (9, 1), (13, 1), (16, 1)],
  term ((-48 : Rat) / 7) [(1, 1), (4, 1), (5, 1), (9, 1), (13, 1), (16, 1)],
  term ((48 : Rat) / 7) [(1, 1), (4, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((24 : Rat) / 7) [(4, 1), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((-24 : Rat) / 7) [(4, 1), (9, 1), (10, 2), (13, 1), (16, 1)],
  term ((-24 : Rat) / 7) [(4, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((24 : Rat) / 7) [(4, 3), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 8. -/
theorem rs_R005_ueqv_R005NNNN_partial_08_0026_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_08_0026
        rs_R005_ueqv_R005NNNN_generator_08_0000_0099 =
      rs_R005_ueqv_R005NNNN_partial_08_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NNNN_coefficient_08_0027 : Poly :=
[
  term ((-27 : Rat) / 7) [(4, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 27 for generator 8. -/
def rs_R005_ueqv_R005NNNN_partial_08_0027 : Poly :=
[
  term ((-54 : Rat) / 7) [(0, 1), (4, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((54 : Rat) / 7) [(0, 1), (4, 2), (9, 1), (15, 1), (16, 1)],
  term ((54 : Rat) / 7) [(1, 1), (4, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-54 : Rat) / 7) [(1, 1), (4, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-27 : Rat) / 7) [(4, 1), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((27 : Rat) / 7) [(4, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((27 : Rat) / 7) [(4, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-27 : Rat) / 7) [(4, 3), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 8. -/
theorem rs_R005_ueqv_R005NNNN_partial_08_0027_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_08_0027
        rs_R005_ueqv_R005NNNN_generator_08_0000_0099 =
      rs_R005_ueqv_R005NNNN_partial_08_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NNNN_coefficient_08_0028 : Poly :=
[
  term ((-12 : Rat) / 7) [(4, 1), (9, 2), (16, 1)]
]

/-- Partial product 28 for generator 8. -/
def rs_R005_ueqv_R005NNNN_partial_08_0028 : Poly :=
[
  term ((-24 : Rat) / 7) [(0, 1), (4, 1), (9, 2), (10, 1), (16, 1)],
  term ((24 : Rat) / 7) [(0, 1), (4, 2), (9, 2), (16, 1)],
  term ((24 : Rat) / 7) [(1, 1), (4, 1), (5, 1), (9, 2), (16, 1)],
  term ((-24 : Rat) / 7) [(1, 1), (4, 1), (9, 2), (11, 1), (16, 1)],
  term ((-12 : Rat) / 7) [(4, 1), (5, 2), (9, 2), (16, 1)],
  term ((12 : Rat) / 7) [(4, 1), (9, 2), (10, 2), (16, 1)],
  term ((12 : Rat) / 7) [(4, 1), (9, 2), (11, 2), (16, 1)],
  term ((-12 : Rat) / 7) [(4, 3), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 8. -/
theorem rs_R005_ueqv_R005NNNN_partial_08_0028_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_08_0028
        rs_R005_ueqv_R005NNNN_generator_08_0000_0099 =
      rs_R005_ueqv_R005NNNN_partial_08_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NNNN_coefficient_08_0029 : Poly :=
[
  term ((15 : Rat) / 14) [(4, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 29 for generator 8. -/
def rs_R005_ueqv_R005NNNN_partial_08_0029 : Poly :=
[
  term ((15 : Rat) / 7) [(0, 1), (4, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-15 : Rat) / 7) [(0, 1), (4, 2), (13, 1), (15, 1), (16, 1)],
  term ((-15 : Rat) / 7) [(1, 1), (4, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((15 : Rat) / 7) [(1, 1), (4, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((15 : Rat) / 14) [(4, 1), (5, 2), (13, 1), (15, 1), (16, 1)],
  term ((-15 : Rat) / 14) [(4, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-15 : Rat) / 14) [(4, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((15 : Rat) / 14) [(4, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 8. -/
theorem rs_R005_ueqv_R005NNNN_partial_08_0029_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_08_0029
        rs_R005_ueqv_R005NNNN_generator_08_0000_0099 =
      rs_R005_ueqv_R005NNNN_partial_08_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NNNN_coefficient_08_0030 : Poly :=
[
  term ((-9 : Rat) / 7) [(4, 1), (15, 2), (16, 1)]
]

/-- Partial product 30 for generator 8. -/
def rs_R005_ueqv_R005NNNN_partial_08_0030 : Poly :=
[
  term ((-18 : Rat) / 7) [(0, 1), (4, 1), (10, 1), (15, 2), (16, 1)],
  term ((18 : Rat) / 7) [(0, 1), (4, 2), (15, 2), (16, 1)],
  term ((18 : Rat) / 7) [(1, 1), (4, 1), (5, 1), (15, 2), (16, 1)],
  term ((-18 : Rat) / 7) [(1, 1), (4, 1), (11, 1), (15, 2), (16, 1)],
  term ((-9 : Rat) / 7) [(4, 1), (5, 2), (15, 2), (16, 1)],
  term ((9 : Rat) / 7) [(4, 1), (10, 2), (15, 2), (16, 1)],
  term ((9 : Rat) / 7) [(4, 1), (11, 2), (15, 2), (16, 1)],
  term ((-9 : Rat) / 7) [(4, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 8. -/
theorem rs_R005_ueqv_R005NNNN_partial_08_0030_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_08_0030
        rs_R005_ueqv_R005NNNN_generator_08_0000_0099 =
      rs_R005_ueqv_R005NNNN_partial_08_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NNNN_coefficient_08_0031 : Poly :=
[
  term ((3 : Rat) / 7) [(4, 1), (16, 1)]
]

/-- Partial product 31 for generator 8. -/
def rs_R005_ueqv_R005NNNN_partial_08_0031 : Poly :=
[
  term ((6 : Rat) / 7) [(0, 1), (4, 1), (10, 1), (16, 1)],
  term ((-6 : Rat) / 7) [(0, 1), (4, 2), (16, 1)],
  term ((-6 : Rat) / 7) [(1, 1), (4, 1), (5, 1), (16, 1)],
  term ((6 : Rat) / 7) [(1, 1), (4, 1), (11, 1), (16, 1)],
  term ((3 : Rat) / 7) [(4, 1), (5, 2), (16, 1)],
  term ((-3 : Rat) / 7) [(4, 1), (10, 2), (16, 1)],
  term ((-3 : Rat) / 7) [(4, 1), (11, 2), (16, 1)],
  term ((3 : Rat) / 7) [(4, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 8. -/
theorem rs_R005_ueqv_R005NNNN_partial_08_0031_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_08_0031
        rs_R005_ueqv_R005NNNN_generator_08_0000_0099 =
      rs_R005_ueqv_R005NNNN_partial_08_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NNNN_coefficient_08_0032 : Poly :=
[
  term ((12 : Rat) / 7) [(5, 1), (7, 1), (8, 1), (16, 1)]
]

/-- Partial product 32 for generator 8. -/
def rs_R005_ueqv_R005NNNN_partial_08_0032 : Poly :=
[
  term ((-24 : Rat) / 7) [(0, 1), (4, 1), (5, 1), (7, 1), (8, 1), (16, 1)],
  term ((24 : Rat) / 7) [(0, 1), (5, 1), (7, 1), (8, 1), (10, 1), (16, 1)],
  term ((24 : Rat) / 7) [(1, 1), (5, 1), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((-24 : Rat) / 7) [(1, 1), (5, 2), (7, 1), (8, 1), (16, 1)],
  term ((12 : Rat) / 7) [(4, 2), (5, 1), (7, 1), (8, 1), (16, 1)],
  term ((-12 : Rat) / 7) [(5, 1), (7, 1), (8, 1), (10, 2), (16, 1)],
  term ((-12 : Rat) / 7) [(5, 1), (7, 1), (8, 1), (11, 2), (16, 1)],
  term ((12 : Rat) / 7) [(5, 3), (7, 1), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 8. -/
theorem rs_R005_ueqv_R005NNNN_partial_08_0032_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_08_0032
        rs_R005_ueqv_R005NNNN_generator_08_0000_0099 =
      rs_R005_ueqv_R005NNNN_partial_08_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NNNN_coefficient_08_0033 : Poly :=
[
  term ((-8 : Rat) / 7) [(5, 1), (7, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 33 for generator 8. -/
def rs_R005_ueqv_R005NNNN_partial_08_0033 : Poly :=
[
  term ((16 : Rat) / 7) [(0, 1), (4, 1), (5, 1), (7, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 7) [(0, 1), (5, 1), (7, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-16 : Rat) / 7) [(1, 1), (5, 1), (7, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 7) [(1, 1), (5, 2), (7, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-8 : Rat) / 7) [(4, 2), (5, 1), (7, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 7) [(5, 1), (7, 1), (9, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((8 : Rat) / 7) [(5, 1), (7, 1), (9, 1), (10, 3), (15, 1), (16, 1)],
  term ((-8 : Rat) / 7) [(5, 3), (7, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 8. -/
theorem rs_R005_ueqv_R005NNNN_partial_08_0033_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_08_0033
        rs_R005_ueqv_R005NNNN_generator_08_0000_0099 =
      rs_R005_ueqv_R005NNNN_partial_08_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NNNN_coefficient_08_0034 : Poly :=
[
  term ((-64 : Rat) / 7) [(5, 1), (7, 1), (9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 34 for generator 8. -/
def rs_R005_ueqv_R005NNNN_partial_08_0034 : Poly :=
[
  term ((128 : Rat) / 7) [(0, 1), (4, 1), (5, 1), (7, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-128 : Rat) / 7) [(0, 1), (5, 1), (7, 1), (9, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-128 : Rat) / 7) [(1, 1), (5, 1), (7, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((128 : Rat) / 7) [(1, 1), (5, 2), (7, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-64 : Rat) / 7) [(4, 2), (5, 1), (7, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((64 : Rat) / 7) [(5, 1), (7, 1), (9, 1), (10, 2), (11, 1), (15, 2), (16, 1)],
  term ((64 : Rat) / 7) [(5, 1), (7, 1), (9, 1), (11, 3), (15, 2), (16, 1)],
  term ((-64 : Rat) / 7) [(5, 3), (7, 1), (9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 8. -/
theorem rs_R005_ueqv_R005NNNN_partial_08_0034_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_08_0034
        rs_R005_ueqv_R005NNNN_generator_08_0000_0099 =
      rs_R005_ueqv_R005NNNN_partial_08_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NNNN_coefficient_08_0035 : Poly :=
[
  term ((36 : Rat) / 7) [(5, 1), (7, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 35 for generator 8. -/
def rs_R005_ueqv_R005NNNN_partial_08_0035 : Poly :=
[
  term ((-72 : Rat) / 7) [(0, 1), (4, 1), (5, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((72 : Rat) / 7) [(0, 1), (5, 1), (7, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((72 : Rat) / 7) [(1, 1), (5, 1), (7, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-72 : Rat) / 7) [(1, 1), (5, 2), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((36 : Rat) / 7) [(4, 2), (5, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((-36 : Rat) / 7) [(5, 1), (7, 1), (9, 1), (10, 2), (13, 1), (16, 1)],
  term ((-36 : Rat) / 7) [(5, 1), (7, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((36 : Rat) / 7) [(5, 3), (7, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 8. -/
theorem rs_R005_ueqv_R005NNNN_partial_08_0035_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_08_0035
        rs_R005_ueqv_R005NNNN_generator_08_0000_0099 =
      rs_R005_ueqv_R005NNNN_partial_08_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NNNN_coefficient_08_0036 : Poly :=
[
  term ((24 : Rat) / 7) [(5, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 36 for generator 8. -/
def rs_R005_ueqv_R005NNNN_partial_08_0036 : Poly :=
[
  term ((-48 : Rat) / 7) [(0, 1), (4, 1), (5, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((48 : Rat) / 7) [(0, 1), (5, 1), (7, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((48 : Rat) / 7) [(1, 1), (5, 1), (7, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-48 : Rat) / 7) [(1, 1), (5, 2), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((24 : Rat) / 7) [(4, 2), (5, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-24 : Rat) / 7) [(5, 1), (7, 1), (9, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-24 : Rat) / 7) [(5, 1), (7, 1), (9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((24 : Rat) / 7) [(5, 3), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 8. -/
theorem rs_R005_ueqv_R005NNNN_partial_08_0036_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_08_0036
        rs_R005_ueqv_R005NNNN_generator_08_0000_0099 =
      rs_R005_ueqv_R005NNNN_partial_08_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NNNN_coefficient_08_0037 : Poly :=
[
  term ((41 : Rat) / 14) [(5, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 37 for generator 8. -/
def rs_R005_ueqv_R005NNNN_partial_08_0037 : Poly :=
[
  term ((-41 : Rat) / 7) [(0, 1), (4, 1), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((41 : Rat) / 7) [(0, 1), (5, 1), (7, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((41 : Rat) / 7) [(1, 1), (5, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-41 : Rat) / 7) [(1, 1), (5, 2), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((41 : Rat) / 14) [(4, 2), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-41 : Rat) / 14) [(5, 1), (7, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-41 : Rat) / 14) [(5, 1), (7, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((41 : Rat) / 14) [(5, 3), (7, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 8. -/
theorem rs_R005_ueqv_R005NNNN_partial_08_0037_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_08_0037
        rs_R005_ueqv_R005NNNN_generator_08_0000_0099 =
      rs_R005_ueqv_R005NNNN_partial_08_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NNNN_coefficient_08_0038 : Poly :=
[
  term ((-192 : Rat) / 7) [(5, 1), (7, 1), (9, 1), (15, 3), (16, 1)]
]

/-- Partial product 38 for generator 8. -/
def rs_R005_ueqv_R005NNNN_partial_08_0038 : Poly :=
[
  term ((384 : Rat) / 7) [(0, 1), (4, 1), (5, 1), (7, 1), (9, 1), (15, 3), (16, 1)],
  term ((-384 : Rat) / 7) [(0, 1), (5, 1), (7, 1), (9, 1), (10, 1), (15, 3), (16, 1)],
  term ((-384 : Rat) / 7) [(1, 1), (5, 1), (7, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((384 : Rat) / 7) [(1, 1), (5, 2), (7, 1), (9, 1), (15, 3), (16, 1)],
  term ((-192 : Rat) / 7) [(4, 2), (5, 1), (7, 1), (9, 1), (15, 3), (16, 1)],
  term ((192 : Rat) / 7) [(5, 1), (7, 1), (9, 1), (10, 2), (15, 3), (16, 1)],
  term ((192 : Rat) / 7) [(5, 1), (7, 1), (9, 1), (11, 2), (15, 3), (16, 1)],
  term ((-192 : Rat) / 7) [(5, 3), (7, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 8. -/
theorem rs_R005_ueqv_R005NNNN_partial_08_0038_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_08_0038
        rs_R005_ueqv_R005NNNN_generator_08_0000_0099 =
      rs_R005_ueqv_R005NNNN_partial_08_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NNNN_coefficient_08_0039 : Poly :=
[
  term ((80 : Rat) / 7) [(5, 1), (7, 1), (9, 2), (15, 2), (16, 1)]
]

/-- Partial product 39 for generator 8. -/
def rs_R005_ueqv_R005NNNN_partial_08_0039 : Poly :=
[
  term ((-160 : Rat) / 7) [(0, 1), (4, 1), (5, 1), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((160 : Rat) / 7) [(0, 1), (5, 1), (7, 1), (9, 2), (10, 1), (15, 2), (16, 1)],
  term ((160 : Rat) / 7) [(1, 1), (5, 1), (7, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((-160 : Rat) / 7) [(1, 1), (5, 2), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((80 : Rat) / 7) [(4, 2), (5, 1), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((-80 : Rat) / 7) [(5, 1), (7, 1), (9, 2), (10, 2), (15, 2), (16, 1)],
  term ((-80 : Rat) / 7) [(5, 1), (7, 1), (9, 2), (11, 2), (15, 2), (16, 1)],
  term ((80 : Rat) / 7) [(5, 3), (7, 1), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 8. -/
theorem rs_R005_ueqv_R005NNNN_partial_08_0039_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_08_0039
        rs_R005_ueqv_R005NNNN_generator_08_0000_0099 =
      rs_R005_ueqv_R005NNNN_partial_08_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NNNN_coefficient_08_0040 : Poly :=
[
  term ((36 : Rat) / 7) [(5, 1), (7, 1), (9, 2), (16, 1)]
]

/-- Partial product 40 for generator 8. -/
def rs_R005_ueqv_R005NNNN_partial_08_0040 : Poly :=
[
  term ((-72 : Rat) / 7) [(0, 1), (4, 1), (5, 1), (7, 1), (9, 2), (16, 1)],
  term ((72 : Rat) / 7) [(0, 1), (5, 1), (7, 1), (9, 2), (10, 1), (16, 1)],
  term ((72 : Rat) / 7) [(1, 1), (5, 1), (7, 1), (9, 2), (11, 1), (16, 1)],
  term ((-72 : Rat) / 7) [(1, 1), (5, 2), (7, 1), (9, 2), (16, 1)],
  term ((36 : Rat) / 7) [(4, 2), (5, 1), (7, 1), (9, 2), (16, 1)],
  term ((-36 : Rat) / 7) [(5, 1), (7, 1), (9, 2), (10, 2), (16, 1)],
  term ((-36 : Rat) / 7) [(5, 1), (7, 1), (9, 2), (11, 2), (16, 1)],
  term ((36 : Rat) / 7) [(5, 3), (7, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 8. -/
theorem rs_R005_ueqv_R005NNNN_partial_08_0040_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_08_0040
        rs_R005_ueqv_R005NNNN_generator_08_0000_0099 =
      rs_R005_ueqv_R005NNNN_partial_08_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NNNN_coefficient_08_0041 : Poly :=
[
  term ((4 : Rat) / 7) [(5, 1), (7, 1), (10, 1), (16, 1)]
]

/-- Partial product 41 for generator 8. -/
def rs_R005_ueqv_R005NNNN_partial_08_0041 : Poly :=
[
  term ((-8 : Rat) / 7) [(0, 1), (4, 1), (5, 1), (7, 1), (10, 1), (16, 1)],
  term ((8 : Rat) / 7) [(0, 1), (5, 1), (7, 1), (10, 2), (16, 1)],
  term ((8 : Rat) / 7) [(1, 1), (5, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((-8 : Rat) / 7) [(1, 1), (5, 2), (7, 1), (10, 1), (16, 1)],
  term ((4 : Rat) / 7) [(4, 2), (5, 1), (7, 1), (10, 1), (16, 1)],
  term ((-4 : Rat) / 7) [(5, 1), (7, 1), (10, 1), (11, 2), (16, 1)],
  term ((-4 : Rat) / 7) [(5, 1), (7, 1), (10, 3), (16, 1)],
  term ((4 : Rat) / 7) [(5, 3), (7, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 8. -/
theorem rs_R005_ueqv_R005NNNN_partial_08_0041_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_08_0041
        rs_R005_ueqv_R005NNNN_generator_08_0000_0099 =
      rs_R005_ueqv_R005NNNN_partial_08_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NNNN_coefficient_08_0042 : Poly :=
[
  term ((-16 : Rat) / 7) [(5, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 42 for generator 8. -/
def rs_R005_ueqv_R005NNNN_partial_08_0042 : Poly :=
[
  term ((32 : Rat) / 7) [(0, 1), (4, 1), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 7) [(0, 1), (5, 1), (7, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 7) [(1, 1), (5, 1), (7, 1), (11, 2), (15, 1), (16, 1)],
  term ((32 : Rat) / 7) [(1, 1), (5, 2), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 7) [(4, 2), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 7) [(5, 1), (7, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 7) [(5, 1), (7, 1), (11, 3), (15, 1), (16, 1)],
  term ((-16 : Rat) / 7) [(5, 3), (7, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 8. -/
theorem rs_R005_ueqv_R005NNNN_partial_08_0042_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_08_0042
        rs_R005_ueqv_R005NNNN_generator_08_0000_0099 =
      rs_R005_ueqv_R005NNNN_partial_08_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NNNN_coefficient_08_0043 : Poly :=
[
  term ((-15 : Rat) / 14) [(5, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 43 for generator 8. -/
def rs_R005_ueqv_R005NNNN_partial_08_0043 : Poly :=
[
  term ((15 : Rat) / 7) [(0, 1), (4, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-15 : Rat) / 7) [(0, 1), (5, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-15 : Rat) / 7) [(1, 1), (5, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((15 : Rat) / 7) [(1, 1), (5, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-15 : Rat) / 14) [(4, 2), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((15 : Rat) / 14) [(5, 1), (7, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((15 : Rat) / 14) [(5, 1), (7, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-15 : Rat) / 14) [(5, 3), (7, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 8. -/
theorem rs_R005_ueqv_R005NNNN_partial_08_0043_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_08_0043
        rs_R005_ueqv_R005NNNN_generator_08_0000_0099 =
      rs_R005_ueqv_R005NNNN_partial_08_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NNNN_coefficient_08_0044 : Poly :=
[
  term ((12 : Rat) / 7) [(5, 1), (7, 1), (14, 1), (16, 1)]
]

/-- Partial product 44 for generator 8. -/
def rs_R005_ueqv_R005NNNN_partial_08_0044 : Poly :=
[
  term ((-24 : Rat) / 7) [(0, 1), (4, 1), (5, 1), (7, 1), (14, 1), (16, 1)],
  term ((24 : Rat) / 7) [(0, 1), (5, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term ((24 : Rat) / 7) [(1, 1), (5, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-24 : Rat) / 7) [(1, 1), (5, 2), (7, 1), (14, 1), (16, 1)],
  term ((12 : Rat) / 7) [(4, 2), (5, 1), (7, 1), (14, 1), (16, 1)],
  term ((-12 : Rat) / 7) [(5, 1), (7, 1), (10, 2), (14, 1), (16, 1)],
  term ((-12 : Rat) / 7) [(5, 1), (7, 1), (11, 2), (14, 1), (16, 1)],
  term ((12 : Rat) / 7) [(5, 3), (7, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 8. -/
theorem rs_R005_ueqv_R005NNNN_partial_08_0044_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_08_0044
        rs_R005_ueqv_R005NNNN_generator_08_0000_0099 =
      rs_R005_ueqv_R005NNNN_partial_08_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NNNN_coefficient_08_0045 : Poly :=
[
  term ((-96 : Rat) / 7) [(5, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 45 for generator 8. -/
def rs_R005_ueqv_R005NNNN_partial_08_0045 : Poly :=
[
  term ((192 : Rat) / 7) [(0, 1), (4, 1), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-192 : Rat) / 7) [(0, 1), (5, 1), (7, 1), (10, 1), (15, 2), (16, 1)],
  term ((-192 : Rat) / 7) [(1, 1), (5, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((192 : Rat) / 7) [(1, 1), (5, 2), (7, 1), (15, 2), (16, 1)],
  term ((-96 : Rat) / 7) [(4, 2), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((96 : Rat) / 7) [(5, 1), (7, 1), (10, 2), (15, 2), (16, 1)],
  term ((96 : Rat) / 7) [(5, 1), (7, 1), (11, 2), (15, 2), (16, 1)],
  term ((-96 : Rat) / 7) [(5, 3), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 8. -/
theorem rs_R005_ueqv_R005NNNN_partial_08_0045_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_08_0045
        rs_R005_ueqv_R005NNNN_generator_08_0000_0099 =
      rs_R005_ueqv_R005NNNN_partial_08_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NNNN_coefficient_08_0046 : Poly :=
[
  term ((32 : Rat) / 7) [(5, 1), (7, 1), (16, 1)]
]

/-- Partial product 46 for generator 8. -/
def rs_R005_ueqv_R005NNNN_partial_08_0046 : Poly :=
[
  term ((-64 : Rat) / 7) [(0, 1), (4, 1), (5, 1), (7, 1), (16, 1)],
  term ((64 : Rat) / 7) [(0, 1), (5, 1), (7, 1), (10, 1), (16, 1)],
  term ((64 : Rat) / 7) [(1, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((-64 : Rat) / 7) [(1, 1), (5, 2), (7, 1), (16, 1)],
  term ((32 : Rat) / 7) [(4, 2), (5, 1), (7, 1), (16, 1)],
  term ((-32 : Rat) / 7) [(5, 1), (7, 1), (10, 2), (16, 1)],
  term ((-32 : Rat) / 7) [(5, 1), (7, 1), (11, 2), (16, 1)],
  term ((32 : Rat) / 7) [(5, 3), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 8. -/
theorem rs_R005_ueqv_R005NNNN_partial_08_0046_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_08_0046
        rs_R005_ueqv_R005NNNN_generator_08_0000_0099 =
      rs_R005_ueqv_R005NNNN_partial_08_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NNNN_coefficient_08_0047 : Poly :=
[
  term ((-24 : Rat) / 7) [(5, 1), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 47 for generator 8. -/
def rs_R005_ueqv_R005NNNN_partial_08_0047 : Poly :=
[
  term ((48 : Rat) / 7) [(0, 1), (4, 1), (5, 1), (8, 1), (9, 1), (16, 1)],
  term ((-48 : Rat) / 7) [(0, 1), (5, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((-48 : Rat) / 7) [(1, 1), (5, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((48 : Rat) / 7) [(1, 1), (5, 2), (8, 1), (9, 1), (16, 1)],
  term ((-24 : Rat) / 7) [(4, 2), (5, 1), (8, 1), (9, 1), (16, 1)],
  term ((24 : Rat) / 7) [(5, 1), (8, 1), (9, 1), (10, 2), (16, 1)],
  term ((24 : Rat) / 7) [(5, 1), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((-24 : Rat) / 7) [(5, 3), (8, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 8. -/
theorem rs_R005_ueqv_R005NNNN_partial_08_0047_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_08_0047
        rs_R005_ueqv_R005NNNN_generator_08_0000_0099 =
      rs_R005_ueqv_R005NNNN_partial_08_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NNNN_coefficient_08_0048 : Poly :=
[
  term ((24 : Rat) / 7) [(5, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 48 for generator 8. -/
def rs_R005_ueqv_R005NNNN_partial_08_0048 : Poly :=
[
  term ((-48 : Rat) / 7) [(0, 1), (4, 1), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((48 : Rat) / 7) [(0, 1), (5, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((48 : Rat) / 7) [(1, 1), (5, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-48 : Rat) / 7) [(1, 1), (5, 2), (8, 1), (13, 1), (16, 1)],
  term ((24 : Rat) / 7) [(4, 2), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((-24 : Rat) / 7) [(5, 1), (8, 1), (10, 2), (13, 1), (16, 1)],
  term ((-24 : Rat) / 7) [(5, 1), (8, 1), (11, 2), (13, 1), (16, 1)],
  term ((24 : Rat) / 7) [(5, 3), (8, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 8. -/
theorem rs_R005_ueqv_R005NNNN_partial_08_0048_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_08_0048
        rs_R005_ueqv_R005NNNN_generator_08_0000_0099 =
      rs_R005_ueqv_R005NNNN_partial_08_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NNNN_coefficient_08_0049 : Poly :=
[
  term ((-32 : Rat) / 7) [(5, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 49 for generator 8. -/
def rs_R005_ueqv_R005NNNN_partial_08_0049 : Poly :=
[
  term ((64 : Rat) / 7) [(0, 1), (4, 1), (5, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-64 : Rat) / 7) [(0, 1), (5, 1), (9, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-64 : Rat) / 7) [(1, 1), (5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((64 : Rat) / 7) [(1, 1), (5, 2), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 7) [(4, 2), (5, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 7) [(5, 1), (9, 1), (10, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 7) [(5, 1), (9, 1), (10, 3), (13, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 7) [(5, 3), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 8. -/
theorem rs_R005_ueqv_R005NNNN_partial_08_0049_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_08_0049
        rs_R005_ueqv_R005NNNN_generator_08_0000_0099 =
      rs_R005_ueqv_R005NNNN_partial_08_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NNNN_coefficient_08_0050 : Poly :=
[
  term ((64 : Rat) / 7) [(5, 1), (9, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 50 for generator 8. -/
def rs_R005_ueqv_R005NNNN_partial_08_0050 : Poly :=
[
  term ((-128 : Rat) / 7) [(0, 1), (4, 1), (5, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((128 : Rat) / 7) [(0, 1), (5, 1), (9, 1), (10, 2), (15, 2), (16, 1)],
  term ((128 : Rat) / 7) [(1, 1), (5, 1), (9, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-128 : Rat) / 7) [(1, 1), (5, 2), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((64 : Rat) / 7) [(4, 2), (5, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-64 : Rat) / 7) [(5, 1), (9, 1), (10, 1), (11, 2), (15, 2), (16, 1)],
  term ((-64 : Rat) / 7) [(5, 1), (9, 1), (10, 3), (15, 2), (16, 1)],
  term ((64 : Rat) / 7) [(5, 3), (9, 1), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 8. -/
theorem rs_R005_ueqv_R005NNNN_partial_08_0050_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_08_0050
        rs_R005_ueqv_R005NNNN_generator_08_0000_0099 =
      rs_R005_ueqv_R005NNNN_partial_08_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NNNN_coefficient_08_0051 : Poly :=
[
  term ((-128 : Rat) / 7) [(5, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 51 for generator 8. -/
def rs_R005_ueqv_R005NNNN_partial_08_0051 : Poly :=
[
  term ((256 : Rat) / 7) [(0, 1), (4, 1), (5, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-256 : Rat) / 7) [(0, 1), (5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-256 : Rat) / 7) [(1, 1), (5, 1), (9, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((256 : Rat) / 7) [(1, 1), (5, 2), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-128 : Rat) / 7) [(4, 2), (5, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((128 : Rat) / 7) [(5, 1), (9, 1), (10, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((128 : Rat) / 7) [(5, 1), (9, 1), (11, 3), (13, 1), (15, 2), (16, 1)],
  term ((-128 : Rat) / 7) [(5, 3), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 8. -/
theorem rs_R005_ueqv_R005NNNN_partial_08_0051_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_08_0051
        rs_R005_ueqv_R005NNNN_generator_08_0000_0099 =
      rs_R005_ueqv_R005NNNN_partial_08_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NNNN_coefficient_08_0052 : Poly :=
[
  term ((32 : Rat) / 7) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 52 for generator 8. -/
def rs_R005_ueqv_R005NNNN_partial_08_0052 : Poly :=
[
  term ((-64 : Rat) / 7) [(0, 1), (4, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((64 : Rat) / 7) [(0, 1), (5, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((64 : Rat) / 7) [(1, 1), (5, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-64 : Rat) / 7) [(1, 1), (5, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 7) [(4, 2), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 7) [(5, 1), (9, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 7) [(5, 1), (9, 1), (11, 3), (15, 1), (16, 1)],
  term ((32 : Rat) / 7) [(5, 3), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 8. -/
theorem rs_R005_ueqv_R005NNNN_partial_08_0052_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_08_0052
        rs_R005_ueqv_R005NNNN_generator_08_0000_0099 =
      rs_R005_ueqv_R005NNNN_partial_08_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NNNN_coefficient_08_0053 : Poly :=
[
  term ((96 : Rat) / 7) [(5, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 53 for generator 8. -/
def rs_R005_ueqv_R005NNNN_partial_08_0053 : Poly :=
[
  term ((-192 : Rat) / 7) [(0, 1), (4, 1), (5, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((192 : Rat) / 7) [(0, 1), (5, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((192 : Rat) / 7) [(1, 1), (5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-192 : Rat) / 7) [(1, 1), (5, 2), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((96 : Rat) / 7) [(4, 2), (5, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-96 : Rat) / 7) [(5, 1), (9, 1), (10, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-96 : Rat) / 7) [(5, 1), (9, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((96 : Rat) / 7) [(5, 3), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 8. -/
theorem rs_R005_ueqv_R005NNNN_partial_08_0053_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_08_0053
        rs_R005_ueqv_R005NNNN_generator_08_0000_0099 =
      rs_R005_ueqv_R005NNNN_partial_08_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NNNN_coefficient_08_0054 : Poly :=
[
  term ((-31 : Rat) / 7) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 54 for generator 8. -/
def rs_R005_ueqv_R005NNNN_partial_08_0054 : Poly :=
[
  term ((62 : Rat) / 7) [(0, 1), (4, 1), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-62 : Rat) / 7) [(0, 1), (5, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-62 : Rat) / 7) [(1, 1), (5, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((62 : Rat) / 7) [(1, 1), (5, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-31 : Rat) / 7) [(4, 2), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((31 : Rat) / 7) [(5, 1), (9, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((31 : Rat) / 7) [(5, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-31 : Rat) / 7) [(5, 3), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 8. -/
theorem rs_R005_ueqv_R005NNNN_partial_08_0054_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_08_0054
        rs_R005_ueqv_R005NNNN_generator_08_0000_0099 =
      rs_R005_ueqv_R005NNNN_partial_08_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NNNN_coefficient_08_0055 : Poly :=
[
  term ((-384 : Rat) / 7) [(5, 1), (9, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 55 for generator 8. -/
def rs_R005_ueqv_R005NNNN_partial_08_0055 : Poly :=
[
  term ((768 : Rat) / 7) [(0, 1), (4, 1), (5, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((-768 : Rat) / 7) [(0, 1), (5, 1), (9, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-768 : Rat) / 7) [(1, 1), (5, 1), (9, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((768 : Rat) / 7) [(1, 1), (5, 2), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((-384 : Rat) / 7) [(4, 2), (5, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((384 : Rat) / 7) [(5, 1), (9, 1), (10, 2), (13, 1), (15, 3), (16, 1)],
  term ((384 : Rat) / 7) [(5, 1), (9, 1), (11, 2), (13, 1), (15, 3), (16, 1)],
  term ((-384 : Rat) / 7) [(5, 3), (9, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 8. -/
theorem rs_R005_ueqv_R005NNNN_partial_08_0055_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_08_0055
        rs_R005_ueqv_R005NNNN_generator_08_0000_0099 =
      rs_R005_ueqv_R005NNNN_partial_08_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NNNN_coefficient_08_0056 : Poly :=
[
  term ((144 : Rat) / 7) [(5, 1), (9, 1), (13, 2), (16, 1)]
]

/-- Partial product 56 for generator 8. -/
def rs_R005_ueqv_R005NNNN_partial_08_0056 : Poly :=
[
  term ((-288 : Rat) / 7) [(0, 1), (4, 1), (5, 1), (9, 1), (13, 2), (16, 1)],
  term ((288 : Rat) / 7) [(0, 1), (5, 1), (9, 1), (10, 1), (13, 2), (16, 1)],
  term ((288 : Rat) / 7) [(1, 1), (5, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-288 : Rat) / 7) [(1, 1), (5, 2), (9, 1), (13, 2), (16, 1)],
  term ((144 : Rat) / 7) [(4, 2), (5, 1), (9, 1), (13, 2), (16, 1)],
  term ((-144 : Rat) / 7) [(5, 1), (9, 1), (10, 2), (13, 2), (16, 1)],
  term ((-144 : Rat) / 7) [(5, 1), (9, 1), (11, 2), (13, 2), (16, 1)],
  term ((144 : Rat) / 7) [(5, 3), (9, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 8. -/
theorem rs_R005_ueqv_R005NNNN_partial_08_0056_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_08_0056
        rs_R005_ueqv_R005NNNN_generator_08_0000_0099 =
      rs_R005_ueqv_R005NNNN_partial_08_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NNNN_coefficient_08_0057 : Poly :=
[
  term ((-192 : Rat) / 7) [(5, 1), (9, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 57 for generator 8. -/
def rs_R005_ueqv_R005NNNN_partial_08_0057 : Poly :=
[
  term ((384 : Rat) / 7) [(0, 1), (4, 1), (5, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-384 : Rat) / 7) [(0, 1), (5, 1), (9, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-384 : Rat) / 7) [(1, 1), (5, 1), (9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((384 : Rat) / 7) [(1, 1), (5, 2), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-192 : Rat) / 7) [(4, 2), (5, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((192 : Rat) / 7) [(5, 1), (9, 1), (10, 2), (14, 1), (15, 2), (16, 1)],
  term ((192 : Rat) / 7) [(5, 1), (9, 1), (11, 2), (14, 1), (15, 2), (16, 1)],
  term ((-192 : Rat) / 7) [(5, 3), (9, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 8. -/
theorem rs_R005_ueqv_R005NNNN_partial_08_0057_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_08_0057
        rs_R005_ueqv_R005NNNN_generator_08_0000_0099 =
      rs_R005_ueqv_R005NNNN_partial_08_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NNNN_coefficient_08_0058 : Poly :=
[
  term ((144 : Rat) / 7) [(5, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 58 for generator 8. -/
def rs_R005_ueqv_R005NNNN_partial_08_0058 : Poly :=
[
  term ((-288 : Rat) / 7) [(0, 1), (4, 1), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((288 : Rat) / 7) [(0, 1), (5, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((288 : Rat) / 7) [(1, 1), (5, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-288 : Rat) / 7) [(1, 1), (5, 2), (9, 1), (14, 1), (16, 1)],
  term ((144 : Rat) / 7) [(4, 2), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((-144 : Rat) / 7) [(5, 1), (9, 1), (10, 2), (14, 1), (16, 1)],
  term ((-144 : Rat) / 7) [(5, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((144 : Rat) / 7) [(5, 3), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 8. -/
theorem rs_R005_ueqv_R005NNNN_partial_08_0058_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_08_0058
        rs_R005_ueqv_R005NNNN_generator_08_0000_0099 =
      rs_R005_ueqv_R005NNNN_partial_08_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NNNN_coefficient_08_0059 : Poly :=
[
  term ((310 : Rat) / 7) [(5, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 59 for generator 8. -/
def rs_R005_ueqv_R005NNNN_partial_08_0059 : Poly :=
[
  term ((-620 : Rat) / 7) [(0, 1), (4, 1), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((620 : Rat) / 7) [(0, 1), (5, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((620 : Rat) / 7) [(1, 1), (5, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-620 : Rat) / 7) [(1, 1), (5, 2), (9, 1), (15, 2), (16, 1)],
  term ((310 : Rat) / 7) [(4, 2), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-310 : Rat) / 7) [(5, 1), (9, 1), (10, 2), (15, 2), (16, 1)],
  term ((-310 : Rat) / 7) [(5, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((310 : Rat) / 7) [(5, 3), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 8. -/
theorem rs_R005_ueqv_R005NNNN_partial_08_0059_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_08_0059
        rs_R005_ueqv_R005NNNN_generator_08_0000_0099 =
      rs_R005_ueqv_R005NNNN_partial_08_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NNNN_coefficient_08_0060 : Poly :=
[
  term ((-134 : Rat) / 7) [(5, 1), (9, 1), (16, 1)]
]

/-- Partial product 60 for generator 8. -/
def rs_R005_ueqv_R005NNNN_partial_08_0060 : Poly :=
[
  term ((268 : Rat) / 7) [(0, 1), (4, 1), (5, 1), (9, 1), (16, 1)],
  term ((-268 : Rat) / 7) [(0, 1), (5, 1), (9, 1), (10, 1), (16, 1)],
  term ((-268 : Rat) / 7) [(1, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((268 : Rat) / 7) [(1, 1), (5, 2), (9, 1), (16, 1)],
  term ((-134 : Rat) / 7) [(4, 2), (5, 1), (9, 1), (16, 1)],
  term ((134 : Rat) / 7) [(5, 1), (9, 1), (10, 2), (16, 1)],
  term ((134 : Rat) / 7) [(5, 1), (9, 1), (11, 2), (16, 1)],
  term ((-134 : Rat) / 7) [(5, 3), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 8. -/
theorem rs_R005_ueqv_R005NNNN_partial_08_0060_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_08_0060
        rs_R005_ueqv_R005NNNN_generator_08_0000_0099 =
      rs_R005_ueqv_R005NNNN_partial_08_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NNNN_coefficient_08_0061 : Poly :=
[
  term ((128 : Rat) / 7) [(5, 1), (9, 2), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 61 for generator 8. -/
def rs_R005_ueqv_R005NNNN_partial_08_0061 : Poly :=
[
  term ((-256 : Rat) / 7) [(0, 1), (4, 1), (5, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((256 : Rat) / 7) [(0, 1), (5, 1), (9, 2), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((256 : Rat) / 7) [(1, 1), (5, 1), (9, 2), (11, 2), (15, 2), (16, 1)],
  term ((-256 : Rat) / 7) [(1, 1), (5, 2), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((128 : Rat) / 7) [(4, 2), (5, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((-128 : Rat) / 7) [(5, 1), (9, 2), (10, 2), (11, 1), (15, 2), (16, 1)],
  term ((-128 : Rat) / 7) [(5, 1), (9, 2), (11, 3), (15, 2), (16, 1)],
  term ((128 : Rat) / 7) [(5, 3), (9, 2), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 8. -/
theorem rs_R005_ueqv_R005NNNN_partial_08_0061_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_08_0061
        rs_R005_ueqv_R005NNNN_generator_08_0000_0099 =
      rs_R005_ueqv_R005NNNN_partial_08_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NNNN_coefficient_08_0062 : Poly :=
[
  term ((160 : Rat) / 7) [(5, 1), (9, 2), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 62 for generator 8. -/
def rs_R005_ueqv_R005NNNN_partial_08_0062 : Poly :=
[
  term ((-320 : Rat) / 7) [(0, 1), (4, 1), (5, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((320 : Rat) / 7) [(0, 1), (5, 1), (9, 2), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((320 : Rat) / 7) [(1, 1), (5, 1), (9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-320 : Rat) / 7) [(1, 1), (5, 2), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((160 : Rat) / 7) [(4, 2), (5, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((-160 : Rat) / 7) [(5, 1), (9, 2), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((-160 : Rat) / 7) [(5, 1), (9, 2), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((160 : Rat) / 7) [(5, 3), (9, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 8. -/
theorem rs_R005_ueqv_R005NNNN_partial_08_0062_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_08_0062
        rs_R005_ueqv_R005NNNN_generator_08_0000_0099 =
      rs_R005_ueqv_R005NNNN_partial_08_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NNNN_coefficient_08_0063 : Poly :=
[
  term ((72 : Rat) / 7) [(5, 1), (9, 2), (13, 1), (16, 1)]
]

/-- Partial product 63 for generator 8. -/
def rs_R005_ueqv_R005NNNN_partial_08_0063 : Poly :=
[
  term ((-144 : Rat) / 7) [(0, 1), (4, 1), (5, 1), (9, 2), (13, 1), (16, 1)],
  term ((144 : Rat) / 7) [(0, 1), (5, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((144 : Rat) / 7) [(1, 1), (5, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-144 : Rat) / 7) [(1, 1), (5, 2), (9, 2), (13, 1), (16, 1)],
  term ((72 : Rat) / 7) [(4, 2), (5, 1), (9, 2), (13, 1), (16, 1)],
  term ((-72 : Rat) / 7) [(5, 1), (9, 2), (10, 2), (13, 1), (16, 1)],
  term ((-72 : Rat) / 7) [(5, 1), (9, 2), (11, 2), (13, 1), (16, 1)],
  term ((72 : Rat) / 7) [(5, 3), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 8. -/
theorem rs_R005_ueqv_R005NNNN_partial_08_0063_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_08_0063
        rs_R005_ueqv_R005NNNN_generator_08_0000_0099 =
      rs_R005_ueqv_R005NNNN_partial_08_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NNNN_coefficient_08_0064 : Poly :=
[
  term ((-201 : Rat) / 7) [(5, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 64 for generator 8. -/
def rs_R005_ueqv_R005NNNN_partial_08_0064 : Poly :=
[
  term ((402 : Rat) / 7) [(0, 1), (4, 1), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-402 : Rat) / 7) [(0, 1), (5, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-402 : Rat) / 7) [(1, 1), (5, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((402 : Rat) / 7) [(1, 1), (5, 2), (9, 2), (15, 1), (16, 1)],
  term ((-201 : Rat) / 7) [(4, 2), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((201 : Rat) / 7) [(5, 1), (9, 2), (10, 2), (15, 1), (16, 1)],
  term ((201 : Rat) / 7) [(5, 1), (9, 2), (11, 2), (15, 1), (16, 1)],
  term ((-201 : Rat) / 7) [(5, 3), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 8. -/
theorem rs_R005_ueqv_R005NNNN_partial_08_0064_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_08_0064
        rs_R005_ueqv_R005NNNN_generator_08_0000_0099 =
      rs_R005_ueqv_R005NNNN_partial_08_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NNNN_coefficient_08_0065 : Poly :=
[
  term ((384 : Rat) / 7) [(5, 1), (9, 2), (15, 3), (16, 1)]
]

/-- Partial product 65 for generator 8. -/
def rs_R005_ueqv_R005NNNN_partial_08_0065 : Poly :=
[
  term ((-768 : Rat) / 7) [(0, 1), (4, 1), (5, 1), (9, 2), (15, 3), (16, 1)],
  term ((768 : Rat) / 7) [(0, 1), (5, 1), (9, 2), (10, 1), (15, 3), (16, 1)],
  term ((768 : Rat) / 7) [(1, 1), (5, 1), (9, 2), (11, 1), (15, 3), (16, 1)],
  term ((-768 : Rat) / 7) [(1, 1), (5, 2), (9, 2), (15, 3), (16, 1)],
  term ((384 : Rat) / 7) [(4, 2), (5, 1), (9, 2), (15, 3), (16, 1)],
  term ((-384 : Rat) / 7) [(5, 1), (9, 2), (10, 2), (15, 3), (16, 1)],
  term ((-384 : Rat) / 7) [(5, 1), (9, 2), (11, 2), (15, 3), (16, 1)],
  term ((384 : Rat) / 7) [(5, 3), (9, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 8. -/
theorem rs_R005_ueqv_R005NNNN_partial_08_0065_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_08_0065
        rs_R005_ueqv_R005NNNN_generator_08_0000_0099 =
      rs_R005_ueqv_R005NNNN_partial_08_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NNNN_coefficient_08_0066 : Poly :=
[
  term ((-160 : Rat) / 7) [(5, 1), (9, 3), (15, 2), (16, 1)]
]

/-- Partial product 66 for generator 8. -/
def rs_R005_ueqv_R005NNNN_partial_08_0066 : Poly :=
[
  term ((320 : Rat) / 7) [(0, 1), (4, 1), (5, 1), (9, 3), (15, 2), (16, 1)],
  term ((-320 : Rat) / 7) [(0, 1), (5, 1), (9, 3), (10, 1), (15, 2), (16, 1)],
  term ((-320 : Rat) / 7) [(1, 1), (5, 1), (9, 3), (11, 1), (15, 2), (16, 1)],
  term ((320 : Rat) / 7) [(1, 1), (5, 2), (9, 3), (15, 2), (16, 1)],
  term ((-160 : Rat) / 7) [(4, 2), (5, 1), (9, 3), (15, 2), (16, 1)],
  term ((160 : Rat) / 7) [(5, 1), (9, 3), (10, 2), (15, 2), (16, 1)],
  term ((160 : Rat) / 7) [(5, 1), (9, 3), (11, 2), (15, 2), (16, 1)],
  term ((-160 : Rat) / 7) [(5, 3), (9, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 8. -/
theorem rs_R005_ueqv_R005NNNN_partial_08_0066_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_08_0066
        rs_R005_ueqv_R005NNNN_generator_08_0000_0099 =
      rs_R005_ueqv_R005NNNN_partial_08_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NNNN_coefficient_08_0067 : Poly :=
[
  term ((-72 : Rat) / 7) [(5, 1), (9, 3), (16, 1)]
]

/-- Partial product 67 for generator 8. -/
def rs_R005_ueqv_R005NNNN_partial_08_0067 : Poly :=
[
  term ((144 : Rat) / 7) [(0, 1), (4, 1), (5, 1), (9, 3), (16, 1)],
  term ((-144 : Rat) / 7) [(0, 1), (5, 1), (9, 3), (10, 1), (16, 1)],
  term ((-144 : Rat) / 7) [(1, 1), (5, 1), (9, 3), (11, 1), (16, 1)],
  term ((144 : Rat) / 7) [(1, 1), (5, 2), (9, 3), (16, 1)],
  term ((-72 : Rat) / 7) [(4, 2), (5, 1), (9, 3), (16, 1)],
  term ((72 : Rat) / 7) [(5, 1), (9, 3), (10, 2), (16, 1)],
  term ((72 : Rat) / 7) [(5, 1), (9, 3), (11, 2), (16, 1)],
  term ((-72 : Rat) / 7) [(5, 3), (9, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 8. -/
theorem rs_R005_ueqv_R005NNNN_partial_08_0067_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_08_0067
        rs_R005_ueqv_R005NNNN_generator_08_0000_0099 =
      rs_R005_ueqv_R005NNNN_partial_08_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NNNN_coefficient_08_0068 : Poly :=
[
  term ((-8 : Rat) / 7) [(5, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 68 for generator 8. -/
def rs_R005_ueqv_R005NNNN_partial_08_0068 : Poly :=
[
  term ((16 : Rat) / 7) [(0, 1), (4, 1), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((-16 : Rat) / 7) [(0, 1), (5, 1), (10, 2), (13, 1), (16, 1)],
  term ((-16 : Rat) / 7) [(1, 1), (5, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((16 : Rat) / 7) [(1, 1), (5, 2), (10, 1), (13, 1), (16, 1)],
  term ((-8 : Rat) / 7) [(4, 2), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((8 : Rat) / 7) [(5, 1), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((8 : Rat) / 7) [(5, 1), (10, 3), (13, 1), (16, 1)],
  term ((-8 : Rat) / 7) [(5, 3), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 8. -/
theorem rs_R005_ueqv_R005NNNN_partial_08_0068_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_08_0068
        rs_R005_ueqv_R005NNNN_generator_08_0000_0099 =
      rs_R005_ueqv_R005NNNN_partial_08_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NNNN_coefficient_08_0069 : Poly :=
[
  term ((-80 : Rat) / 7) [(5, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 69 for generator 8. -/
def rs_R005_ueqv_R005NNNN_partial_08_0069 : Poly :=
[
  term ((160 : Rat) / 7) [(0, 1), (4, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-160 : Rat) / 7) [(0, 1), (5, 1), (10, 2), (15, 1), (16, 1)],
  term ((-160 : Rat) / 7) [(1, 1), (5, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((160 : Rat) / 7) [(1, 1), (5, 2), (10, 1), (15, 1), (16, 1)],
  term ((-80 : Rat) / 7) [(4, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((80 : Rat) / 7) [(5, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((80 : Rat) / 7) [(5, 1), (10, 3), (15, 1), (16, 1)],
  term ((-80 : Rat) / 7) [(5, 3), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 8. -/
theorem rs_R005_ueqv_R005NNNN_partial_08_0069_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_08_0069
        rs_R005_ueqv_R005NNNN_generator_08_0000_0099 =
      rs_R005_ueqv_R005NNNN_partial_08_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NNNN_coefficient_08_0070 : Poly :=
[
  term ((-32 : Rat) / 7) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 70 for generator 8. -/
def rs_R005_ueqv_R005NNNN_partial_08_0070 : Poly :=
[
  term ((64 : Rat) / 7) [(0, 1), (4, 1), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-64 : Rat) / 7) [(0, 1), (5, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-64 : Rat) / 7) [(1, 1), (5, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((64 : Rat) / 7) [(1, 1), (5, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 7) [(4, 2), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 7) [(5, 1), (10, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 7) [(5, 1), (11, 3), (13, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 7) [(5, 3), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 8. -/
theorem rs_R005_ueqv_R005NNNN_partial_08_0070_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_08_0070
        rs_R005_ueqv_R005NNNN_generator_08_0000_0099 =
      rs_R005_ueqv_R005NNNN_partial_08_0070 := by
  native_decide

/-- Coefficient term 71 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NNNN_coefficient_08_0071 : Poly :=
[
  term ((24 : Rat) / 7) [(5, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 71 for generator 8. -/
def rs_R005_ueqv_R005NNNN_partial_08_0071 : Poly :=
[
  term ((-48 : Rat) / 7) [(0, 1), (4, 1), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((48 : Rat) / 7) [(0, 1), (5, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((48 : Rat) / 7) [(1, 1), (5, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-48 : Rat) / 7) [(1, 1), (5, 2), (13, 1), (14, 1), (16, 1)],
  term ((24 : Rat) / 7) [(4, 2), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((-24 : Rat) / 7) [(5, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((-24 : Rat) / 7) [(5, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((24 : Rat) / 7) [(5, 3), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 71 for generator 8. -/
theorem rs_R005_ueqv_R005NNNN_partial_08_0071_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_08_0071
        rs_R005_ueqv_R005NNNN_generator_08_0000_0099 =
      rs_R005_ueqv_R005NNNN_partial_08_0071 := by
  native_decide

/-- Coefficient term 72 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NNNN_coefficient_08_0072 : Poly :=
[
  term ((-66 : Rat) / 7) [(5, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 72 for generator 8. -/
def rs_R005_ueqv_R005NNNN_partial_08_0072 : Poly :=
[
  term ((132 : Rat) / 7) [(0, 1), (4, 1), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((-132 : Rat) / 7) [(0, 1), (5, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-132 : Rat) / 7) [(1, 1), (5, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((132 : Rat) / 7) [(1, 1), (5, 2), (13, 1), (15, 2), (16, 1)],
  term ((-66 : Rat) / 7) [(4, 2), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((66 : Rat) / 7) [(5, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((66 : Rat) / 7) [(5, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-66 : Rat) / 7) [(5, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 72 for generator 8. -/
theorem rs_R005_ueqv_R005NNNN_partial_08_0072_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_08_0072
        rs_R005_ueqv_R005NNNN_generator_08_0000_0099 =
      rs_R005_ueqv_R005NNNN_partial_08_0072 := by
  native_decide

/-- Coefficient term 73 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NNNN_coefficient_08_0073 : Poly :=
[
  term ((34 : Rat) / 7) [(5, 1), (13, 1), (16, 1)]
]

/-- Partial product 73 for generator 8. -/
def rs_R005_ueqv_R005NNNN_partial_08_0073 : Poly :=
[
  term ((-68 : Rat) / 7) [(0, 1), (4, 1), (5, 1), (13, 1), (16, 1)],
  term ((68 : Rat) / 7) [(0, 1), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((68 : Rat) / 7) [(1, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((-68 : Rat) / 7) [(1, 1), (5, 2), (13, 1), (16, 1)],
  term ((34 : Rat) / 7) [(4, 2), (5, 1), (13, 1), (16, 1)],
  term ((-34 : Rat) / 7) [(5, 1), (10, 2), (13, 1), (16, 1)],
  term ((-34 : Rat) / 7) [(5, 1), (11, 2), (13, 1), (16, 1)],
  term ((34 : Rat) / 7) [(5, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 73 for generator 8. -/
theorem rs_R005_ueqv_R005NNNN_partial_08_0073_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_08_0073
        rs_R005_ueqv_R005NNNN_generator_08_0000_0099 =
      rs_R005_ueqv_R005NNNN_partial_08_0073 := by
  native_decide

/-- Coefficient term 74 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NNNN_coefficient_08_0074 : Poly :=
[
  term ((-30 : Rat) / 7) [(5, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 74 for generator 8. -/
def rs_R005_ueqv_R005NNNN_partial_08_0074 : Poly :=
[
  term ((60 : Rat) / 7) [(0, 1), (4, 1), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((-60 : Rat) / 7) [(0, 1), (5, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-60 : Rat) / 7) [(1, 1), (5, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((60 : Rat) / 7) [(1, 1), (5, 2), (13, 2), (15, 1), (16, 1)],
  term ((-30 : Rat) / 7) [(4, 2), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((30 : Rat) / 7) [(5, 1), (10, 2), (13, 2), (15, 1), (16, 1)],
  term ((30 : Rat) / 7) [(5, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((-30 : Rat) / 7) [(5, 3), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 74 for generator 8. -/
theorem rs_R005_ueqv_R005NNNN_partial_08_0074_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_08_0074
        rs_R005_ueqv_R005NNNN_generator_08_0000_0099 =
      rs_R005_ueqv_R005NNNN_partial_08_0074 := by
  native_decide

/-- Coefficient term 75 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NNNN_coefficient_08_0075 : Poly :=
[
  term ((-78 : Rat) / 7) [(5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 75 for generator 8. -/
def rs_R005_ueqv_R005NNNN_partial_08_0075 : Poly :=
[
  term ((156 : Rat) / 7) [(0, 1), (4, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-156 : Rat) / 7) [(0, 1), (5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-156 : Rat) / 7) [(1, 1), (5, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((156 : Rat) / 7) [(1, 1), (5, 2), (14, 1), (15, 1), (16, 1)],
  term ((-78 : Rat) / 7) [(4, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((78 : Rat) / 7) [(5, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((78 : Rat) / 7) [(5, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-78 : Rat) / 7) [(5, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 75 for generator 8. -/
theorem rs_R005_ueqv_R005NNNN_partial_08_0075_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_08_0075
        rs_R005_ueqv_R005NNNN_generator_08_0000_0099 =
      rs_R005_ueqv_R005NNNN_partial_08_0075 := by
  native_decide

/-- Coefficient term 76 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NNNN_coefficient_08_0076 : Poly :=
[
  term ((97 : Rat) / 28) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 76 for generator 8. -/
def rs_R005_ueqv_R005NNNN_partial_08_0076 : Poly :=
[
  term ((-97 : Rat) / 14) [(0, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((97 : Rat) / 14) [(0, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((97 : Rat) / 14) [(1, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-97 : Rat) / 14) [(1, 1), (5, 2), (15, 1), (16, 1)],
  term ((97 : Rat) / 28) [(4, 2), (5, 1), (15, 1), (16, 1)],
  term ((-97 : Rat) / 28) [(5, 1), (10, 2), (15, 1), (16, 1)],
  term ((-97 : Rat) / 28) [(5, 1), (11, 2), (15, 1), (16, 1)],
  term ((97 : Rat) / 28) [(5, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 76 for generator 8. -/
theorem rs_R005_ueqv_R005NNNN_partial_08_0076_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_08_0076
        rs_R005_ueqv_R005NNNN_generator_08_0000_0099 =
      rs_R005_ueqv_R005NNNN_partial_08_0076 := by
  native_decide

/-- Coefficient term 77 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NNNN_coefficient_08_0077 : Poly :=
[
  term ((16 : Rat) / 7) [(7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 77 for generator 8. -/
def rs_R005_ueqv_R005NNNN_partial_08_0077 : Poly :=
[
  term ((-32 : Rat) / 7) [(0, 1), (4, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 7) [(0, 1), (7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 7) [(1, 1), (5, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 7) [(1, 1), (7, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 7) [(4, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 7) [(5, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 7) [(7, 1), (8, 1), (10, 2), (15, 1), (16, 1)],
  term ((-16 : Rat) / 7) [(7, 1), (8, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 77 for generator 8. -/
theorem rs_R005_ueqv_R005NNNN_partial_08_0077_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_08_0077
        rs_R005_ueqv_R005NNNN_generator_08_0000_0099 =
      rs_R005_ueqv_R005NNNN_partial_08_0077 := by
  native_decide

/-- Coefficient term 78 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NNNN_coefficient_08_0078 : Poly :=
[
  term ((-4 : Rat) / 7) [(7, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 78 for generator 8. -/
def rs_R005_ueqv_R005NNNN_partial_08_0078 : Poly :=
[
  term ((8 : Rat) / 7) [(0, 1), (4, 1), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((-8 : Rat) / 7) [(0, 1), (7, 1), (9, 1), (10, 2), (16, 1)],
  term ((8 : Rat) / 7) [(1, 1), (5, 1), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((-8 : Rat) / 7) [(1, 1), (7, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-4 : Rat) / 7) [(4, 2), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((-4 : Rat) / 7) [(5, 2), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((4 : Rat) / 7) [(7, 1), (9, 1), (10, 1), (11, 2), (16, 1)],
  term ((4 : Rat) / 7) [(7, 1), (9, 1), (10, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 78 for generator 8. -/
theorem rs_R005_ueqv_R005NNNN_partial_08_0078_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_08_0078
        rs_R005_ueqv_R005NNNN_generator_08_0000_0099 =
      rs_R005_ueqv_R005NNNN_partial_08_0078 := by
  native_decide

/-- Coefficient term 79 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NNNN_coefficient_08_0079 : Poly :=
[
  term ((-32 : Rat) / 7) [(7, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 79 for generator 8. -/
def rs_R005_ueqv_R005NNNN_partial_08_0079 : Poly :=
[
  term ((64 : Rat) / 7) [(0, 1), (4, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-64 : Rat) / 7) [(0, 1), (7, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((64 : Rat) / 7) [(1, 1), (5, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-64 : Rat) / 7) [(1, 1), (7, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-32 : Rat) / 7) [(4, 2), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 7) [(5, 2), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 7) [(7, 1), (9, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 7) [(7, 1), (9, 1), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 79 for generator 8. -/
theorem rs_R005_ueqv_R005NNNN_partial_08_0079_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_08_0079
        rs_R005_ueqv_R005NNNN_generator_08_0000_0099 =
      rs_R005_ueqv_R005NNNN_partial_08_0079 := by
  native_decide

/-- Coefficient term 80 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NNNN_coefficient_08_0080 : Poly :=
[
  term ((-6 : Rat) / 7) [(7, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 80 for generator 8. -/
def rs_R005_ueqv_R005NNNN_partial_08_0080 : Poly :=
[
  term ((12 : Rat) / 7) [(0, 1), (4, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-12 : Rat) / 7) [(0, 1), (7, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((12 : Rat) / 7) [(1, 1), (5, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-12 : Rat) / 7) [(1, 1), (7, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6 : Rat) / 7) [(4, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6 : Rat) / 7) [(5, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((6 : Rat) / 7) [(7, 1), (9, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((6 : Rat) / 7) [(7, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 80 for generator 8. -/
theorem rs_R005_ueqv_R005NNNN_partial_08_0080_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_08_0080
        rs_R005_ueqv_R005NNNN_generator_08_0000_0099 =
      rs_R005_ueqv_R005NNNN_partial_08_0080 := by
  native_decide

/-- Coefficient term 81 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NNNN_coefficient_08_0081 : Poly :=
[
  term ((24 : Rat) / 7) [(7, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 81 for generator 8. -/
def rs_R005_ueqv_R005NNNN_partial_08_0081 : Poly :=
[
  term ((-48 : Rat) / 7) [(0, 1), (4, 1), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((48 : Rat) / 7) [(0, 1), (7, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-48 : Rat) / 7) [(1, 1), (5, 1), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((48 : Rat) / 7) [(1, 1), (7, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((24 : Rat) / 7) [(4, 2), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((24 : Rat) / 7) [(5, 2), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((-24 : Rat) / 7) [(7, 1), (9, 1), (10, 2), (14, 1), (16, 1)],
  term ((-24 : Rat) / 7) [(7, 1), (9, 1), (11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 81 for generator 8. -/
theorem rs_R005_ueqv_R005NNNN_partial_08_0081_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_08_0081
        rs_R005_ueqv_R005NNNN_generator_08_0000_0099 =
      rs_R005_ueqv_R005NNNN_partial_08_0081 := by
  native_decide

/-- Coefficient term 82 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NNNN_coefficient_08_0082 : Poly :=
[
  term ((-122 : Rat) / 7) [(7, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 82 for generator 8. -/
def rs_R005_ueqv_R005NNNN_partial_08_0082 : Poly :=
[
  term ((244 : Rat) / 7) [(0, 1), (4, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-244 : Rat) / 7) [(0, 1), (7, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((244 : Rat) / 7) [(1, 1), (5, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-244 : Rat) / 7) [(1, 1), (7, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-122 : Rat) / 7) [(4, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-122 : Rat) / 7) [(5, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((122 : Rat) / 7) [(7, 1), (9, 1), (10, 2), (15, 2), (16, 1)],
  term ((122 : Rat) / 7) [(7, 1), (9, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 82 for generator 8. -/
theorem rs_R005_ueqv_R005NNNN_partial_08_0082_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_08_0082
        rs_R005_ueqv_R005NNNN_generator_08_0000_0099 =
      rs_R005_ueqv_R005NNNN_partial_08_0082 := by
  native_decide

/-- Coefficient term 83 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NNNN_coefficient_08_0083 : Poly :=
[
  term ((-1 : Rat) / 8) [(7, 1), (9, 1), (16, 1)]
]

/-- Partial product 83 for generator 8. -/
def rs_R005_ueqv_R005NNNN_partial_08_0083 : Poly :=
[
  term ((1 : Rat) / 4) [(0, 1), (4, 1), (7, 1), (9, 1), (16, 1)],
  term ((-1 : Rat) / 4) [(0, 1), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((1 : Rat) / 4) [(1, 1), (5, 1), (7, 1), (9, 1), (16, 1)],
  term ((-1 : Rat) / 4) [(1, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((-1 : Rat) / 8) [(4, 2), (7, 1), (9, 1), (16, 1)],
  term ((-1 : Rat) / 8) [(5, 2), (7, 1), (9, 1), (16, 1)],
  term ((1 : Rat) / 8) [(7, 1), (9, 1), (10, 2), (16, 1)],
  term ((1 : Rat) / 8) [(7, 1), (9, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 83 for generator 8. -/
theorem rs_R005_ueqv_R005NNNN_partial_08_0083_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_08_0083
        rs_R005_ueqv_R005NNNN_generator_08_0000_0099 =
      rs_R005_ueqv_R005NNNN_partial_08_0083 := by
  native_decide

/-- Coefficient term 84 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NNNN_coefficient_08_0084 : Poly :=
[
  term ((34 : Rat) / 7) [(7, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 84 for generator 8. -/
def rs_R005_ueqv_R005NNNN_partial_08_0084 : Poly :=
[
  term ((-68 : Rat) / 7) [(0, 1), (4, 1), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((68 : Rat) / 7) [(0, 1), (7, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-68 : Rat) / 7) [(1, 1), (5, 1), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((68 : Rat) / 7) [(1, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((34 : Rat) / 7) [(4, 2), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((34 : Rat) / 7) [(5, 2), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((-34 : Rat) / 7) [(7, 1), (9, 2), (10, 2), (15, 1), (16, 1)],
  term ((-34 : Rat) / 7) [(7, 1), (9, 2), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 84 for generator 8. -/
theorem rs_R005_ueqv_R005NNNN_partial_08_0084_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_08_0084
        rs_R005_ueqv_R005NNNN_generator_08_0000_0099 =
      rs_R005_ueqv_R005NNNN_partial_08_0084 := by
  native_decide

/-- Coefficient term 85 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NNNN_coefficient_08_0085 : Poly :=
[
  term ((192 : Rat) / 7) [(7, 1), (9, 2), (15, 3), (16, 1)]
]

/-- Partial product 85 for generator 8. -/
def rs_R005_ueqv_R005NNNN_partial_08_0085 : Poly :=
[
  term ((-384 : Rat) / 7) [(0, 1), (4, 1), (7, 1), (9, 2), (15, 3), (16, 1)],
  term ((384 : Rat) / 7) [(0, 1), (7, 1), (9, 2), (10, 1), (15, 3), (16, 1)],
  term ((-384 : Rat) / 7) [(1, 1), (5, 1), (7, 1), (9, 2), (15, 3), (16, 1)],
  term ((384 : Rat) / 7) [(1, 1), (7, 1), (9, 2), (11, 1), (15, 3), (16, 1)],
  term ((192 : Rat) / 7) [(4, 2), (7, 1), (9, 2), (15, 3), (16, 1)],
  term ((192 : Rat) / 7) [(5, 2), (7, 1), (9, 2), (15, 3), (16, 1)],
  term ((-192 : Rat) / 7) [(7, 1), (9, 2), (10, 2), (15, 3), (16, 1)],
  term ((-192 : Rat) / 7) [(7, 1), (9, 2), (11, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 85 for generator 8. -/
theorem rs_R005_ueqv_R005NNNN_partial_08_0085_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_08_0085
        rs_R005_ueqv_R005NNNN_generator_08_0000_0099 =
      rs_R005_ueqv_R005NNNN_partial_08_0085 := by
  native_decide

/-- Coefficient term 86 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NNNN_coefficient_08_0086 : Poly :=
[
  term ((-13 : Rat) / 28) [(7, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 86 for generator 8. -/
def rs_R005_ueqv_R005NNNN_partial_08_0086 : Poly :=
[
  term ((13 : Rat) / 14) [(0, 1), (4, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-13 : Rat) / 14) [(0, 1), (7, 1), (10, 2), (15, 1), (16, 1)],
  term ((13 : Rat) / 14) [(1, 1), (5, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-13 : Rat) / 14) [(1, 1), (7, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-13 : Rat) / 28) [(4, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-13 : Rat) / 28) [(5, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((13 : Rat) / 28) [(7, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((13 : Rat) / 28) [(7, 1), (10, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 86 for generator 8. -/
theorem rs_R005_ueqv_R005NNNN_partial_08_0086_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_08_0086
        rs_R005_ueqv_R005NNNN_generator_08_0000_0099 =
      rs_R005_ueqv_R005NNNN_partial_08_0086 := by
  native_decide

/-- Coefficient term 87 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NNNN_coefficient_08_0087 : Poly :=
[
  term ((40 : Rat) / 7) [(7, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 87 for generator 8. -/
def rs_R005_ueqv_R005NNNN_partial_08_0087 : Poly :=
[
  term ((-80 : Rat) / 7) [(0, 1), (4, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((80 : Rat) / 7) [(0, 1), (7, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-80 : Rat) / 7) [(1, 1), (5, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((80 : Rat) / 7) [(1, 1), (7, 1), (11, 2), (15, 2), (16, 1)],
  term ((40 : Rat) / 7) [(4, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((40 : Rat) / 7) [(5, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-40 : Rat) / 7) [(7, 1), (10, 2), (11, 1), (15, 2), (16, 1)],
  term ((-40 : Rat) / 7) [(7, 1), (11, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 87 for generator 8. -/
theorem rs_R005_ueqv_R005NNNN_partial_08_0087_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_08_0087
        rs_R005_ueqv_R005NNNN_generator_08_0000_0099 =
      rs_R005_ueqv_R005NNNN_partial_08_0087 := by
  native_decide

/-- Coefficient term 88 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NNNN_coefficient_08_0088 : Poly :=
[
  term ((-10 : Rat) / 7) [(7, 1), (11, 1), (16, 1)]
]

/-- Partial product 88 for generator 8. -/
def rs_R005_ueqv_R005NNNN_partial_08_0088 : Poly :=
[
  term ((20 : Rat) / 7) [(0, 1), (4, 1), (7, 1), (11, 1), (16, 1)],
  term ((-20 : Rat) / 7) [(0, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((20 : Rat) / 7) [(1, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((-20 : Rat) / 7) [(1, 1), (7, 1), (11, 2), (16, 1)],
  term ((-10 : Rat) / 7) [(4, 2), (7, 1), (11, 1), (16, 1)],
  term ((-10 : Rat) / 7) [(5, 2), (7, 1), (11, 1), (16, 1)],
  term ((10 : Rat) / 7) [(7, 1), (10, 2), (11, 1), (16, 1)],
  term ((10 : Rat) / 7) [(7, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 88 for generator 8. -/
theorem rs_R005_ueqv_R005NNNN_partial_08_0088_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_08_0088
        rs_R005_ueqv_R005NNNN_generator_08_0000_0099 =
      rs_R005_ueqv_R005NNNN_partial_08_0088 := by
  native_decide

/-- Coefficient term 89 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NNNN_coefficient_08_0089 : Poly :=
[
  term ((89 : Rat) / 56) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 89 for generator 8. -/
def rs_R005_ueqv_R005NNNN_partial_08_0089 : Poly :=
[
  term ((-89 : Rat) / 28) [(0, 1), (4, 1), (7, 1), (13, 1), (16, 1)],
  term ((89 : Rat) / 28) [(0, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-89 : Rat) / 28) [(1, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((89 : Rat) / 28) [(1, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((89 : Rat) / 56) [(4, 2), (7, 1), (13, 1), (16, 1)],
  term ((89 : Rat) / 56) [(5, 2), (7, 1), (13, 1), (16, 1)],
  term ((-89 : Rat) / 56) [(7, 1), (10, 2), (13, 1), (16, 1)],
  term ((-89 : Rat) / 56) [(7, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 89 for generator 8. -/
theorem rs_R005_ueqv_R005NNNN_partial_08_0089_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_08_0089
        rs_R005_ueqv_R005NNNN_generator_08_0000_0099 =
      rs_R005_ueqv_R005NNNN_partial_08_0089 := by
  native_decide

/-- Coefficient term 90 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NNNN_coefficient_08_0090 : Poly :=
[
  term ((89 : Rat) / 56) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 90 for generator 8. -/
def rs_R005_ueqv_R005NNNN_partial_08_0090 : Poly :=
[
  term ((-89 : Rat) / 28) [(0, 1), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((89 : Rat) / 28) [(0, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-89 : Rat) / 28) [(1, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((89 : Rat) / 28) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((89 : Rat) / 56) [(4, 2), (7, 1), (15, 1), (16, 1)],
  term ((89 : Rat) / 56) [(5, 2), (7, 1), (15, 1), (16, 1)],
  term ((-89 : Rat) / 56) [(7, 1), (10, 2), (15, 1), (16, 1)],
  term ((-89 : Rat) / 56) [(7, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 90 for generator 8. -/
theorem rs_R005_ueqv_R005NNNN_partial_08_0090_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_08_0090
        rs_R005_ueqv_R005NNNN_generator_08_0000_0099 =
      rs_R005_ueqv_R005NNNN_partial_08_0090 := by
  native_decide

/-- Coefficient term 91 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NNNN_coefficient_08_0091 : Poly :=
[
  term ((-32 : Rat) / 7) [(8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 91 for generator 8. -/
def rs_R005_ueqv_R005NNNN_partial_08_0091 : Poly :=
[
  term ((64 : Rat) / 7) [(0, 1), (4, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-64 : Rat) / 7) [(0, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((64 : Rat) / 7) [(1, 1), (5, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-64 : Rat) / 7) [(1, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 7) [(4, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 7) [(5, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 7) [(8, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((32 : Rat) / 7) [(8, 1), (9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 91 for generator 8. -/
theorem rs_R005_ueqv_R005NNNN_partial_08_0091_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_08_0091
        rs_R005_ueqv_R005NNNN_generator_08_0000_0099 =
      rs_R005_ueqv_R005NNNN_partial_08_0091 := by
  native_decide

/-- Coefficient term 92 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NNNN_coefficient_08_0092 : Poly :=
[
  term ((32 : Rat) / 7) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 92 for generator 8. -/
def rs_R005_ueqv_R005NNNN_partial_08_0092 : Poly :=
[
  term ((-64 : Rat) / 7) [(0, 1), (4, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((64 : Rat) / 7) [(0, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-64 : Rat) / 7) [(1, 1), (5, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((64 : Rat) / 7) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 7) [(4, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 7) [(5, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 7) [(8, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 7) [(8, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 92 for generator 8. -/
theorem rs_R005_ueqv_R005NNNN_partial_08_0092_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_08_0092
        rs_R005_ueqv_R005NNNN_generator_08_0000_0099 =
      rs_R005_ueqv_R005NNNN_partial_08_0092 := by
  native_decide

/-- Coefficient term 93 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NNNN_coefficient_08_0093 : Poly :=
[
  term ((-16 : Rat) / 7) [(9, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 93 for generator 8. -/
def rs_R005_ueqv_R005NNNN_partial_08_0093 : Poly :=
[
  term ((32 : Rat) / 7) [(0, 1), (4, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-32 : Rat) / 7) [(0, 1), (9, 1), (10, 2), (13, 1), (16, 1)],
  term ((32 : Rat) / 7) [(1, 1), (5, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-32 : Rat) / 7) [(1, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-16 : Rat) / 7) [(4, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-16 : Rat) / 7) [(5, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((16 : Rat) / 7) [(9, 1), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((16 : Rat) / 7) [(9, 1), (10, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 93 for generator 8. -/
theorem rs_R005_ueqv_R005NNNN_partial_08_0093_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_08_0093
        rs_R005_ueqv_R005NNNN_generator_08_0000_0099 =
      rs_R005_ueqv_R005NNNN_partial_08_0093 := by
  native_decide

/-- Coefficient term 94 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NNNN_coefficient_08_0094 : Poly :=
[
  term ((32 : Rat) / 7) [(9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 94 for generator 8. -/
def rs_R005_ueqv_R005NNNN_partial_08_0094 : Poly :=
[
  term ((-64 : Rat) / 7) [(0, 1), (4, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((64 : Rat) / 7) [(0, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-64 : Rat) / 7) [(1, 1), (5, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((64 : Rat) / 7) [(1, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 7) [(4, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 7) [(5, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 7) [(9, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((-32 : Rat) / 7) [(9, 1), (10, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 94 for generator 8. -/
theorem rs_R005_ueqv_R005NNNN_partial_08_0094_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_08_0094
        rs_R005_ueqv_R005NNNN_generator_08_0000_0099 =
      rs_R005_ueqv_R005NNNN_partial_08_0094 := by
  native_decide

/-- Coefficient term 95 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NNNN_coefficient_08_0095 : Poly :=
[
  term ((-64 : Rat) / 7) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 95 for generator 8. -/
def rs_R005_ueqv_R005NNNN_partial_08_0095 : Poly :=
[
  term ((128 : Rat) / 7) [(0, 1), (4, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-128 : Rat) / 7) [(0, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((128 : Rat) / 7) [(1, 1), (5, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-128 : Rat) / 7) [(1, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-64 : Rat) / 7) [(4, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-64 : Rat) / 7) [(5, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((64 : Rat) / 7) [(9, 1), (10, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((64 : Rat) / 7) [(9, 1), (11, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 95 for generator 8. -/
theorem rs_R005_ueqv_R005NNNN_partial_08_0095_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_08_0095
        rs_R005_ueqv_R005NNNN_generator_08_0000_0099 =
      rs_R005_ueqv_R005NNNN_partial_08_0095 := by
  native_decide

/-- Coefficient term 96 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NNNN_coefficient_08_0096 : Poly :=
[
  term ((-80 : Rat) / 7) [(9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 96 for generator 8. -/
def rs_R005_ueqv_R005NNNN_partial_08_0096 : Poly :=
[
  term ((160 : Rat) / 7) [(0, 1), (4, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-160 : Rat) / 7) [(0, 1), (9, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((160 : Rat) / 7) [(1, 1), (5, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-160 : Rat) / 7) [(1, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((-80 : Rat) / 7) [(4, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-80 : Rat) / 7) [(5, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((80 : Rat) / 7) [(9, 1), (10, 2), (11, 1), (15, 2), (16, 1)],
  term ((80 : Rat) / 7) [(9, 1), (11, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 96 for generator 8. -/
theorem rs_R005_ueqv_R005NNNN_partial_08_0096_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_08_0096
        rs_R005_ueqv_R005NNNN_generator_08_0000_0099 =
      rs_R005_ueqv_R005NNNN_partial_08_0096 := by
  native_decide

/-- Coefficient term 97 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NNNN_coefficient_08_0097 : Poly :=
[
  term ((24 : Rat) / 7) [(9, 1), (11, 1), (16, 1)]
]

/-- Partial product 97 for generator 8. -/
def rs_R005_ueqv_R005NNNN_partial_08_0097 : Poly :=
[
  term ((-48 : Rat) / 7) [(0, 1), (4, 1), (9, 1), (11, 1), (16, 1)],
  term ((48 : Rat) / 7) [(0, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-48 : Rat) / 7) [(1, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((48 : Rat) / 7) [(1, 1), (9, 1), (11, 2), (16, 1)],
  term ((24 : Rat) / 7) [(4, 2), (9, 1), (11, 1), (16, 1)],
  term ((24 : Rat) / 7) [(5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-24 : Rat) / 7) [(9, 1), (10, 2), (11, 1), (16, 1)],
  term ((-24 : Rat) / 7) [(9, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 97 for generator 8. -/
theorem rs_R005_ueqv_R005NNNN_partial_08_0097_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_08_0097
        rs_R005_ueqv_R005NNNN_generator_08_0000_0099 =
      rs_R005_ueqv_R005NNNN_partial_08_0097 := by
  native_decide

/-- Coefficient term 98 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NNNN_coefficient_08_0098 : Poly :=
[
  term ((48 : Rat) / 7) [(9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 98 for generator 8. -/
def rs_R005_ueqv_R005NNNN_partial_08_0098 : Poly :=
[
  term ((-96 : Rat) / 7) [(0, 1), (4, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((96 : Rat) / 7) [(0, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-96 : Rat) / 7) [(1, 1), (5, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((96 : Rat) / 7) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((48 : Rat) / 7) [(4, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((48 : Rat) / 7) [(5, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-48 : Rat) / 7) [(9, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((-48 : Rat) / 7) [(9, 1), (11, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 98 for generator 8. -/
theorem rs_R005_ueqv_R005NNNN_partial_08_0098_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_08_0098
        rs_R005_ueqv_R005NNNN_generator_08_0000_0099 =
      rs_R005_ueqv_R005NNNN_partial_08_0098 := by
  native_decide

/-- Coefficient term 99 from coefficient polynomial 8. -/
def rs_R005_ueqv_R005NNNN_coefficient_08_0099 : Poly :=
[
  term ((-100 : Rat) / 7) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 99 for generator 8. -/
def rs_R005_ueqv_R005NNNN_partial_08_0099 : Poly :=
[
  term ((200 : Rat) / 7) [(0, 1), (4, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-200 : Rat) / 7) [(0, 1), (9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((200 : Rat) / 7) [(1, 1), (5, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-200 : Rat) / 7) [(1, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-100 : Rat) / 7) [(4, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-100 : Rat) / 7) [(5, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((100 : Rat) / 7) [(9, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((100 : Rat) / 7) [(9, 1), (11, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 99 for generator 8. -/
theorem rs_R005_ueqv_R005NNNN_partial_08_0099_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_08_0099
        rs_R005_ueqv_R005NNNN_generator_08_0000_0099 =
      rs_R005_ueqv_R005NNNN_partial_08_0099 := by
  native_decide

/-- Partial products in this block. -/
def rs_R005_ueqv_R005NNNN_partials_08_0000_0099 : List Poly :=
[
  rs_R005_ueqv_R005NNNN_partial_08_0000,
  rs_R005_ueqv_R005NNNN_partial_08_0001,
  rs_R005_ueqv_R005NNNN_partial_08_0002,
  rs_R005_ueqv_R005NNNN_partial_08_0003,
  rs_R005_ueqv_R005NNNN_partial_08_0004,
  rs_R005_ueqv_R005NNNN_partial_08_0005,
  rs_R005_ueqv_R005NNNN_partial_08_0006,
  rs_R005_ueqv_R005NNNN_partial_08_0007,
  rs_R005_ueqv_R005NNNN_partial_08_0008,
  rs_R005_ueqv_R005NNNN_partial_08_0009,
  rs_R005_ueqv_R005NNNN_partial_08_0010,
  rs_R005_ueqv_R005NNNN_partial_08_0011,
  rs_R005_ueqv_R005NNNN_partial_08_0012,
  rs_R005_ueqv_R005NNNN_partial_08_0013,
  rs_R005_ueqv_R005NNNN_partial_08_0014,
  rs_R005_ueqv_R005NNNN_partial_08_0015,
  rs_R005_ueqv_R005NNNN_partial_08_0016,
  rs_R005_ueqv_R005NNNN_partial_08_0017,
  rs_R005_ueqv_R005NNNN_partial_08_0018,
  rs_R005_ueqv_R005NNNN_partial_08_0019,
  rs_R005_ueqv_R005NNNN_partial_08_0020,
  rs_R005_ueqv_R005NNNN_partial_08_0021,
  rs_R005_ueqv_R005NNNN_partial_08_0022,
  rs_R005_ueqv_R005NNNN_partial_08_0023,
  rs_R005_ueqv_R005NNNN_partial_08_0024,
  rs_R005_ueqv_R005NNNN_partial_08_0025,
  rs_R005_ueqv_R005NNNN_partial_08_0026,
  rs_R005_ueqv_R005NNNN_partial_08_0027,
  rs_R005_ueqv_R005NNNN_partial_08_0028,
  rs_R005_ueqv_R005NNNN_partial_08_0029,
  rs_R005_ueqv_R005NNNN_partial_08_0030,
  rs_R005_ueqv_R005NNNN_partial_08_0031,
  rs_R005_ueqv_R005NNNN_partial_08_0032,
  rs_R005_ueqv_R005NNNN_partial_08_0033,
  rs_R005_ueqv_R005NNNN_partial_08_0034,
  rs_R005_ueqv_R005NNNN_partial_08_0035,
  rs_R005_ueqv_R005NNNN_partial_08_0036,
  rs_R005_ueqv_R005NNNN_partial_08_0037,
  rs_R005_ueqv_R005NNNN_partial_08_0038,
  rs_R005_ueqv_R005NNNN_partial_08_0039,
  rs_R005_ueqv_R005NNNN_partial_08_0040,
  rs_R005_ueqv_R005NNNN_partial_08_0041,
  rs_R005_ueqv_R005NNNN_partial_08_0042,
  rs_R005_ueqv_R005NNNN_partial_08_0043,
  rs_R005_ueqv_R005NNNN_partial_08_0044,
  rs_R005_ueqv_R005NNNN_partial_08_0045,
  rs_R005_ueqv_R005NNNN_partial_08_0046,
  rs_R005_ueqv_R005NNNN_partial_08_0047,
  rs_R005_ueqv_R005NNNN_partial_08_0048,
  rs_R005_ueqv_R005NNNN_partial_08_0049,
  rs_R005_ueqv_R005NNNN_partial_08_0050,
  rs_R005_ueqv_R005NNNN_partial_08_0051,
  rs_R005_ueqv_R005NNNN_partial_08_0052,
  rs_R005_ueqv_R005NNNN_partial_08_0053,
  rs_R005_ueqv_R005NNNN_partial_08_0054,
  rs_R005_ueqv_R005NNNN_partial_08_0055,
  rs_R005_ueqv_R005NNNN_partial_08_0056,
  rs_R005_ueqv_R005NNNN_partial_08_0057,
  rs_R005_ueqv_R005NNNN_partial_08_0058,
  rs_R005_ueqv_R005NNNN_partial_08_0059,
  rs_R005_ueqv_R005NNNN_partial_08_0060,
  rs_R005_ueqv_R005NNNN_partial_08_0061,
  rs_R005_ueqv_R005NNNN_partial_08_0062,
  rs_R005_ueqv_R005NNNN_partial_08_0063,
  rs_R005_ueqv_R005NNNN_partial_08_0064,
  rs_R005_ueqv_R005NNNN_partial_08_0065,
  rs_R005_ueqv_R005NNNN_partial_08_0066,
  rs_R005_ueqv_R005NNNN_partial_08_0067,
  rs_R005_ueqv_R005NNNN_partial_08_0068,
  rs_R005_ueqv_R005NNNN_partial_08_0069,
  rs_R005_ueqv_R005NNNN_partial_08_0070,
  rs_R005_ueqv_R005NNNN_partial_08_0071,
  rs_R005_ueqv_R005NNNN_partial_08_0072,
  rs_R005_ueqv_R005NNNN_partial_08_0073,
  rs_R005_ueqv_R005NNNN_partial_08_0074,
  rs_R005_ueqv_R005NNNN_partial_08_0075,
  rs_R005_ueqv_R005NNNN_partial_08_0076,
  rs_R005_ueqv_R005NNNN_partial_08_0077,
  rs_R005_ueqv_R005NNNN_partial_08_0078,
  rs_R005_ueqv_R005NNNN_partial_08_0079,
  rs_R005_ueqv_R005NNNN_partial_08_0080,
  rs_R005_ueqv_R005NNNN_partial_08_0081,
  rs_R005_ueqv_R005NNNN_partial_08_0082,
  rs_R005_ueqv_R005NNNN_partial_08_0083,
  rs_R005_ueqv_R005NNNN_partial_08_0084,
  rs_R005_ueqv_R005NNNN_partial_08_0085,
  rs_R005_ueqv_R005NNNN_partial_08_0086,
  rs_R005_ueqv_R005NNNN_partial_08_0087,
  rs_R005_ueqv_R005NNNN_partial_08_0088,
  rs_R005_ueqv_R005NNNN_partial_08_0089,
  rs_R005_ueqv_R005NNNN_partial_08_0090,
  rs_R005_ueqv_R005NNNN_partial_08_0091,
  rs_R005_ueqv_R005NNNN_partial_08_0092,
  rs_R005_ueqv_R005NNNN_partial_08_0093,
  rs_R005_ueqv_R005NNNN_partial_08_0094,
  rs_R005_ueqv_R005NNNN_partial_08_0095,
  rs_R005_ueqv_R005NNNN_partial_08_0096,
  rs_R005_ueqv_R005NNNN_partial_08_0097,
  rs_R005_ueqv_R005NNNN_partial_08_0098,
  rs_R005_ueqv_R005NNNN_partial_08_0099
]

/-- Sum of partial products in this block. -/
def rs_R005_ueqv_R005NNNN_block_08_0000_0099 : Poly :=
[
  term ((-12 : Rat) / 7) [(0, 1), (1, 1), (4, 1), (7, 1), (16, 1)],
  term ((48 : Rat) / 7) [(0, 1), (1, 1), (4, 1), (9, 1), (16, 1)],
  term ((24 : Rat) / 7) [(0, 1), (1, 1), (4, 1), (13, 1), (16, 1)],
  term ((-12 : Rat) / 7) [(0, 1), (1, 1), (5, 1), (16, 1)],
  term ((12 : Rat) / 7) [(0, 1), (1, 1), (7, 1), (10, 1), (16, 1)],
  term ((-48 : Rat) / 7) [(0, 1), (1, 1), (9, 1), (10, 1), (16, 1)],
  term ((-24 : Rat) / 7) [(0, 1), (1, 1), (10, 1), (13, 1), (16, 1)],
  term ((12 : Rat) / 7) [(0, 1), (1, 1), (11, 1), (16, 1)],
  term ((96 : Rat) / 7) [(0, 1), (3, 1), (4, 1), (5, 1), (8, 1), (16, 1)],
  term ((-512 : Rat) / 7) [(0, 1), (3, 1), (4, 1), (5, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((772 : Rat) / 7) [(0, 1), (3, 1), (4, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1536 : Rat) / 7) [(0, 1), (3, 1), (4, 1), (5, 1), (9, 1), (15, 3), (16, 1)],
  term ((640 : Rat) / 7) [(0, 1), (3, 1), (4, 1), (5, 1), (9, 2), (15, 2), (16, 1)],
  term ((288 : Rat) / 7) [(0, 1), (3, 1), (4, 1), (5, 1), (9, 2), (16, 1)],
  term ((-128 : Rat) / 7) [(0, 1), (3, 1), (4, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term (-72 : Rat) [(0, 1), (3, 1), (4, 1), (5, 1), (15, 2), (16, 1)],
  term ((48 : Rat) / 7) [(0, 1), (3, 1), (4, 1), (5, 1), (16, 1)],
  term ((128 : Rat) / 7) [(0, 1), (3, 1), (4, 1), (8, 1), (15, 1), (16, 1)],
  term ((-48 : Rat) / 7) [(0, 1), (3, 1), (4, 1), (9, 1), (10, 1), (16, 1)],
  term ((-256 : Rat) / 7) [(0, 1), (3, 1), (4, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-688 : Rat) / 7) [(0, 1), (3, 1), (4, 1), (9, 1), (15, 2), (16, 1)],
  term ((137 : Rat) / 7) [(0, 1), (3, 1), (4, 1), (9, 1), (16, 1)],
  term ((272 : Rat) / 7) [(0, 1), (3, 1), (4, 1), (9, 2), (15, 1), (16, 1)],
  term ((1536 : Rat) / 7) [(0, 1), (3, 1), (4, 1), (9, 2), (15, 3), (16, 1)],
  term ((-12 : Rat) / 7) [(0, 1), (3, 1), (4, 1), (10, 1), (15, 1), (16, 1)],
  term ((320 : Rat) / 7) [(0, 1), (3, 1), (4, 1), (11, 1), (15, 2), (16, 1)],
  term ((-109 : Rat) / 14) [(0, 1), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((96 : Rat) / 7) [(0, 1), (3, 1), (4, 1), (15, 3), (16, 1)],
  term ((48 : Rat) / 7) [(0, 1), (3, 1), (4, 2), (9, 1), (16, 1)],
  term ((12 : Rat) / 7) [(0, 1), (3, 1), (4, 2), (15, 1), (16, 1)],
  term ((-96 : Rat) / 7) [(0, 1), (3, 1), (5, 1), (8, 1), (10, 1), (16, 1)],
  term ((512 : Rat) / 7) [(0, 1), (3, 1), (5, 1), (9, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-772 : Rat) / 7) [(0, 1), (3, 1), (5, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((1536 : Rat) / 7) [(0, 1), (3, 1), (5, 1), (9, 1), (10, 1), (15, 3), (16, 1)],
  term ((-640 : Rat) / 7) [(0, 1), (3, 1), (5, 1), (9, 2), (10, 1), (15, 2), (16, 1)],
  term ((-288 : Rat) / 7) [(0, 1), (3, 1), (5, 1), (9, 2), (10, 1), (16, 1)],
  term ((128 : Rat) / 7) [(0, 1), (3, 1), (5, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term (72 : Rat) [(0, 1), (3, 1), (5, 1), (10, 1), (15, 2), (16, 1)],
  term ((-48 : Rat) / 7) [(0, 1), (3, 1), (5, 1), (10, 1), (16, 1)],
  term ((-128 : Rat) / 7) [(0, 1), (3, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((256 : Rat) / 7) [(0, 1), (3, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((688 : Rat) / 7) [(0, 1), (3, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-137 : Rat) / 7) [(0, 1), (3, 1), (9, 1), (10, 1), (16, 1)],
  term ((-272 : Rat) / 7) [(0, 1), (3, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-1536 : Rat) / 7) [(0, 1), (3, 1), (9, 2), (10, 1), (15, 3), (16, 1)],
  term ((-320 : Rat) / 7) [(0, 1), (3, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((109 : Rat) / 14) [(0, 1), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-96 : Rat) / 7) [(0, 1), (3, 1), (10, 1), (15, 3), (16, 1)],
  term ((-24 : Rat) / 7) [(0, 1), (4, 1), (5, 1), (7, 1), (8, 1), (16, 1)],
  term ((16 : Rat) / 7) [(0, 1), (4, 1), (5, 1), (7, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((128 : Rat) / 7) [(0, 1), (4, 1), (5, 1), (7, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-72 : Rat) / 7) [(0, 1), (4, 1), (5, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((-48 : Rat) / 7) [(0, 1), (4, 1), (5, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-41 : Rat) / 7) [(0, 1), (4, 1), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((384 : Rat) / 7) [(0, 1), (4, 1), (5, 1), (7, 1), (9, 1), (15, 3), (16, 1)],
  term ((-160 : Rat) / 7) [(0, 1), (4, 1), (5, 1), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((-72 : Rat) / 7) [(0, 1), (4, 1), (5, 1), (7, 1), (9, 2), (16, 1)],
  term ((-8 : Rat) / 7) [(0, 1), (4, 1), (5, 1), (7, 1), (10, 1), (16, 1)],
  term ((32 : Rat) / 7) [(0, 1), (4, 1), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((15 : Rat) / 7) [(0, 1), (4, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-24 : Rat) / 7) [(0, 1), (4, 1), (5, 1), (7, 1), (14, 1), (16, 1)],
  term ((192 : Rat) / 7) [(0, 1), (4, 1), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-64 : Rat) / 7) [(0, 1), (4, 1), (5, 1), (7, 1), (16, 1)],
  term ((48 : Rat) / 7) [(0, 1), (4, 1), (5, 1), (8, 1), (9, 1), (16, 1)],
  term ((-48 : Rat) / 7) [(0, 1), (4, 1), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((64 : Rat) / 7) [(0, 1), (4, 1), (5, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-128 : Rat) / 7) [(0, 1), (4, 1), (5, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((256 : Rat) / 7) [(0, 1), (4, 1), (5, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-64 : Rat) / 7) [(0, 1), (4, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-192 : Rat) / 7) [(0, 1), (4, 1), (5, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((62 : Rat) / 7) [(0, 1), (4, 1), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((768 : Rat) / 7) [(0, 1), (4, 1), (5, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((-288 : Rat) / 7) [(0, 1), (4, 1), (5, 1), (9, 1), (13, 2), (16, 1)],
  term ((384 : Rat) / 7) [(0, 1), (4, 1), (5, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-288 : Rat) / 7) [(0, 1), (4, 1), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((-620 : Rat) / 7) [(0, 1), (4, 1), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((268 : Rat) / 7) [(0, 1), (4, 1), (5, 1), (9, 1), (16, 1)],
  term ((-256 : Rat) / 7) [(0, 1), (4, 1), (5, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((-320 : Rat) / 7) [(0, 1), (4, 1), (5, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((-144 : Rat) / 7) [(0, 1), (4, 1), (5, 1), (9, 2), (13, 1), (16, 1)],
  term ((402 : Rat) / 7) [(0, 1), (4, 1), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-768 : Rat) / 7) [(0, 1), (4, 1), (5, 1), (9, 2), (15, 3), (16, 1)],
  term ((320 : Rat) / 7) [(0, 1), (4, 1), (5, 1), (9, 3), (15, 2), (16, 1)],
  term ((144 : Rat) / 7) [(0, 1), (4, 1), (5, 1), (9, 3), (16, 1)],
  term ((16 : Rat) / 7) [(0, 1), (4, 1), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((160 : Rat) / 7) [(0, 1), (4, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((64 : Rat) / 7) [(0, 1), (4, 1), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-48 : Rat) / 7) [(0, 1), (4, 1), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((132 : Rat) / 7) [(0, 1), (4, 1), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((-68 : Rat) / 7) [(0, 1), (4, 1), (5, 1), (13, 1), (16, 1)],
  term ((60 : Rat) / 7) [(0, 1), (4, 1), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((156 : Rat) / 7) [(0, 1), (4, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-97 : Rat) / 14) [(0, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 7) [(0, 1), (4, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 7) [(0, 1), (4, 1), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((64 : Rat) / 7) [(0, 1), (4, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((12 : Rat) / 7) [(0, 1), (4, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-48 : Rat) / 7) [(0, 1), (4, 1), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((244 : Rat) / 7) [(0, 1), (4, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((1 : Rat) / 4) [(0, 1), (4, 1), (7, 1), (9, 1), (16, 1)],
  term ((-68 : Rat) / 7) [(0, 1), (4, 1), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((-384 : Rat) / 7) [(0, 1), (4, 1), (7, 1), (9, 2), (15, 3), (16, 1)],
  term ((1 : Rat) / 2) [(0, 1), (4, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-80 : Rat) / 7) [(0, 1), (4, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((20 : Rat) / 7) [(0, 1), (4, 1), (7, 1), (11, 1), (16, 1)],
  term ((-89 : Rat) / 28) [(0, 1), (4, 1), (7, 1), (13, 1), (16, 1)],
  term ((-89 : Rat) / 28) [(0, 1), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((64 : Rat) / 7) [(0, 1), (4, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-64 : Rat) / 7) [(0, 1), (4, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((80 : Rat) / 7) [(0, 1), (4, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-118 : Rat) / 7) [(0, 1), (4, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((128 : Rat) / 7) [(0, 1), (4, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((160 : Rat) / 7) [(0, 1), (4, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-48 : Rat) / 7) [(0, 1), (4, 1), (9, 1), (11, 1), (16, 1)],
  term ((-96 : Rat) / 7) [(0, 1), (4, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((200 : Rat) / 7) [(0, 1), (4, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-24 : Rat) / 7) [(0, 1), (4, 1), (9, 2), (10, 1), (16, 1)],
  term ((15 : Rat) / 7) [(0, 1), (4, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-18 : Rat) / 7) [(0, 1), (4, 1), (10, 1), (15, 2), (16, 1)],
  term ((6 : Rat) / 7) [(0, 1), (4, 1), (10, 1), (16, 1)],
  term ((-24 : Rat) / 7) [(0, 1), (4, 2), (7, 1), (9, 1), (16, 1)],
  term ((3 : Rat) / 7) [(0, 1), (4, 2), (7, 1), (15, 1), (16, 1)],
  term ((-48 : Rat) / 7) [(0, 1), (4, 2), (9, 1), (13, 1), (16, 1)],
  term ((54 : Rat) / 7) [(0, 1), (4, 2), (9, 1), (15, 1), (16, 1)],
  term ((24 : Rat) / 7) [(0, 1), (4, 2), (9, 2), (16, 1)],
  term ((-15 : Rat) / 7) [(0, 1), (4, 2), (13, 1), (15, 1), (16, 1)],
  term ((18 : Rat) / 7) [(0, 1), (4, 2), (15, 2), (16, 1)],
  term ((24 : Rat) / 7) [(0, 1), (5, 1), (7, 1), (8, 1), (10, 1), (16, 1)],
  term ((-128 : Rat) / 7) [(0, 1), (5, 1), (7, 1), (9, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((72 : Rat) / 7) [(0, 1), (5, 1), (7, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((48 : Rat) / 7) [(0, 1), (5, 1), (7, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((41 : Rat) / 7) [(0, 1), (5, 1), (7, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-384 : Rat) / 7) [(0, 1), (5, 1), (7, 1), (9, 1), (10, 1), (15, 3), (16, 1)],
  term ((-16 : Rat) / 7) [(0, 1), (5, 1), (7, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((160 : Rat) / 7) [(0, 1), (5, 1), (7, 1), (9, 2), (10, 1), (15, 2), (16, 1)],
  term ((72 : Rat) / 7) [(0, 1), (5, 1), (7, 1), (9, 2), (10, 1), (16, 1)],
  term ((-32 : Rat) / 7) [(0, 1), (5, 1), (7, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-15 : Rat) / 7) [(0, 1), (5, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((24 : Rat) / 7) [(0, 1), (5, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term ((-192 : Rat) / 7) [(0, 1), (5, 1), (7, 1), (10, 1), (15, 2), (16, 1)],
  term ((64 : Rat) / 7) [(0, 1), (5, 1), (7, 1), (10, 1), (16, 1)],
  term ((8 : Rat) / 7) [(0, 1), (5, 1), (7, 1), (10, 2), (16, 1)],
  term ((-48 : Rat) / 7) [(0, 1), (5, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((48 : Rat) / 7) [(0, 1), (5, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((-256 : Rat) / 7) [(0, 1), (5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((64 : Rat) / 7) [(0, 1), (5, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((192 : Rat) / 7) [(0, 1), (5, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-62 : Rat) / 7) [(0, 1), (5, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-768 : Rat) / 7) [(0, 1), (5, 1), (9, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((288 : Rat) / 7) [(0, 1), (5, 1), (9, 1), (10, 1), (13, 2), (16, 1)],
  term ((-384 : Rat) / 7) [(0, 1), (5, 1), (9, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((288 : Rat) / 7) [(0, 1), (5, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((620 : Rat) / 7) [(0, 1), (5, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-268 : Rat) / 7) [(0, 1), (5, 1), (9, 1), (10, 1), (16, 1)],
  term ((-64 : Rat) / 7) [(0, 1), (5, 1), (9, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((128 : Rat) / 7) [(0, 1), (5, 1), (9, 1), (10, 2), (15, 2), (16, 1)],
  term ((256 : Rat) / 7) [(0, 1), (5, 1), (9, 2), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((320 : Rat) / 7) [(0, 1), (5, 1), (9, 2), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((144 : Rat) / 7) [(0, 1), (5, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((-402 : Rat) / 7) [(0, 1), (5, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((768 : Rat) / 7) [(0, 1), (5, 1), (9, 2), (10, 1), (15, 3), (16, 1)],
  term ((-320 : Rat) / 7) [(0, 1), (5, 1), (9, 3), (10, 1), (15, 2), (16, 1)],
  term ((-144 : Rat) / 7) [(0, 1), (5, 1), (9, 3), (10, 1), (16, 1)],
  term ((-64 : Rat) / 7) [(0, 1), (5, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((48 : Rat) / 7) [(0, 1), (5, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-132 : Rat) / 7) [(0, 1), (5, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((68 : Rat) / 7) [(0, 1), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((-60 : Rat) / 7) [(0, 1), (5, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-156 : Rat) / 7) [(0, 1), (5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((97 : Rat) / 14) [(0, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 7) [(0, 1), (5, 1), (10, 2), (13, 1), (16, 1)],
  term ((-160 : Rat) / 7) [(0, 1), (5, 1), (10, 2), (15, 1), (16, 1)],
  term ((6 : Rat) / 7) [(0, 1), (5, 2), (16, 1)],
  term ((32 : Rat) / 7) [(0, 1), (7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-64 : Rat) / 7) [(0, 1), (7, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-12 : Rat) / 7) [(0, 1), (7, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((48 : Rat) / 7) [(0, 1), (7, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-244 : Rat) / 7) [(0, 1), (7, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-1 : Rat) / 4) [(0, 1), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((-8 : Rat) / 7) [(0, 1), (7, 1), (9, 1), (10, 2), (16, 1)],
  term ((68 : Rat) / 7) [(0, 1), (7, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((384 : Rat) / 7) [(0, 1), (7, 1), (9, 2), (10, 1), (15, 3), (16, 1)],
  term ((80 : Rat) / 7) [(0, 1), (7, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-20 : Rat) / 7) [(0, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((89 : Rat) / 28) [(0, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((89 : Rat) / 28) [(0, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-13 : Rat) / 14) [(0, 1), (7, 1), (10, 2), (15, 1), (16, 1)],
  term ((-64 : Rat) / 7) [(0, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((64 : Rat) / 7) [(0, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-128 : Rat) / 7) [(0, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-160 : Rat) / 7) [(0, 1), (9, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((48 : Rat) / 7) [(0, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((96 : Rat) / 7) [(0, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-200 : Rat) / 7) [(0, 1), (9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-32 : Rat) / 7) [(0, 1), (9, 1), (10, 2), (13, 1), (16, 1)],
  term ((64 : Rat) / 7) [(0, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-6 : Rat) / 7) [(0, 1), (10, 2), (16, 1)],
  term ((-6 : Rat) / 7) [(0, 1), (11, 2), (16, 1)],
  term ((-12 : Rat) / 7) [(0, 2), (4, 1), (16, 1)],
  term ((12 : Rat) / 7) [(0, 2), (10, 1), (16, 1)],
  term ((48 : Rat) / 7) [(1, 1), (3, 1), (4, 1), (5, 1), (9, 1), (16, 1)],
  term ((12 : Rat) / 7) [(1, 1), (3, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-48 : Rat) / 7) [(1, 1), (3, 1), (4, 1), (9, 1), (11, 1), (16, 1)],
  term ((-12 : Rat) / 7) [(1, 1), (3, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-96 : Rat) / 7) [(1, 1), (3, 1), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((128 : Rat) / 7) [(1, 1), (3, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-1028 : Rat) / 7) [(1, 1), (3, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((1536 : Rat) / 7) [(1, 1), (3, 1), (5, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((512 : Rat) / 7) [(1, 1), (3, 1), (5, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((-688 : Rat) / 7) [(1, 1), (3, 1), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((137 : Rat) / 7) [(1, 1), (3, 1), (5, 1), (9, 1), (16, 1)],
  term ((-640 : Rat) / 7) [(1, 1), (3, 1), (5, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((-288 : Rat) / 7) [(1, 1), (3, 1), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((272 : Rat) / 7) [(1, 1), (3, 1), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((1536 : Rat) / 7) [(1, 1), (3, 1), (5, 1), (9, 2), (15, 3), (16, 1)],
  term ((824 : Rat) / 7) [(1, 1), (3, 1), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((-48 : Rat) / 7) [(1, 1), (3, 1), (5, 1), (11, 1), (16, 1)],
  term ((128 : Rat) / 7) [(1, 1), (3, 1), (5, 1), (11, 2), (15, 1), (16, 1)],
  term ((-109 : Rat) / 14) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((96 : Rat) / 7) [(1, 1), (3, 1), (5, 1), (15, 3), (16, 1)],
  term ((96 : Rat) / 7) [(1, 1), (3, 1), (5, 2), (8, 1), (16, 1)],
  term ((-512 : Rat) / 7) [(1, 1), (3, 1), (5, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((772 : Rat) / 7) [(1, 1), (3, 1), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-1536 : Rat) / 7) [(1, 1), (3, 1), (5, 2), (9, 1), (15, 3), (16, 1)],
  term ((640 : Rat) / 7) [(1, 1), (3, 1), (5, 2), (9, 2), (15, 2), (16, 1)],
  term ((288 : Rat) / 7) [(1, 1), (3, 1), (5, 2), (9, 2), (16, 1)],
  term ((-128 : Rat) / 7) [(1, 1), (3, 1), (5, 2), (11, 1), (15, 1), (16, 1)],
  term (-72 : Rat) [(1, 1), (3, 1), (5, 2), (15, 2), (16, 1)],
  term ((48 : Rat) / 7) [(1, 1), (3, 1), (5, 2), (16, 1)],
  term ((-128 : Rat) / 7) [(1, 1), (3, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((688 : Rat) / 7) [(1, 1), (3, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-137 : Rat) / 7) [(1, 1), (3, 1), (9, 1), (11, 1), (16, 1)],
  term ((256 : Rat) / 7) [(1, 1), (3, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-272 : Rat) / 7) [(1, 1), (3, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1536 : Rat) / 7) [(1, 1), (3, 1), (9, 2), (11, 1), (15, 3), (16, 1)],
  term ((109 : Rat) / 14) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((-96 : Rat) / 7) [(1, 1), (3, 1), (11, 1), (15, 3), (16, 1)],
  term ((-320 : Rat) / 7) [(1, 1), (3, 1), (11, 2), (15, 2), (16, 1)],
  term ((-24 : Rat) / 7) [(1, 1), (4, 1), (5, 1), (7, 1), (9, 1), (16, 1)],
  term ((3 : Rat) / 7) [(1, 1), (4, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-48 : Rat) / 7) [(1, 1), (4, 1), (5, 1), (9, 1), (13, 1), (16, 1)],
  term ((54 : Rat) / 7) [(1, 1), (4, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((24 : Rat) / 7) [(1, 1), (4, 1), (5, 1), (9, 2), (16, 1)],
  term ((-15 : Rat) / 7) [(1, 1), (4, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((18 : Rat) / 7) [(1, 1), (4, 1), (5, 1), (15, 2), (16, 1)],
  term ((-6 : Rat) / 7) [(1, 1), (4, 1), (5, 1), (16, 1)],
  term ((24 : Rat) / 7) [(1, 1), (4, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((-3 : Rat) / 7) [(1, 1), (4, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((48 : Rat) / 7) [(1, 1), (4, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-54 : Rat) / 7) [(1, 1), (4, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-24 : Rat) / 7) [(1, 1), (4, 1), (9, 2), (11, 1), (16, 1)],
  term ((15 : Rat) / 7) [(1, 1), (4, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-18 : Rat) / 7) [(1, 1), (4, 1), (11, 1), (15, 2), (16, 1)],
  term ((6 : Rat) / 7) [(1, 1), (4, 1), (11, 1), (16, 1)],
  term ((6 : Rat) / 7) [(1, 1), (4, 2), (7, 1), (16, 1)],
  term ((-24 : Rat) / 7) [(1, 1), (4, 2), (9, 1), (16, 1)],
  term ((-12 : Rat) / 7) [(1, 1), (4, 2), (13, 1), (16, 1)],
  term ((24 : Rat) / 7) [(1, 1), (5, 1), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((-32 : Rat) / 7) [(1, 1), (5, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 7) [(1, 1), (5, 1), (7, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 7) [(1, 1), (5, 1), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((72 : Rat) / 7) [(1, 1), (5, 1), (7, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((48 : Rat) / 7) [(1, 1), (5, 1), (7, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term (15 : Rat) [(1, 1), (5, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-384 : Rat) / 7) [(1, 1), (5, 1), (7, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((-128 : Rat) / 7) [(1, 1), (5, 1), (7, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((12 : Rat) / 7) [(1, 1), (5, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-48 : Rat) / 7) [(1, 1), (5, 1), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((244 : Rat) / 7) [(1, 1), (5, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((1 : Rat) / 4) [(1, 1), (5, 1), (7, 1), (9, 1), (16, 1)],
  term ((160 : Rat) / 7) [(1, 1), (5, 1), (7, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((72 : Rat) / 7) [(1, 1), (5, 1), (7, 1), (9, 2), (11, 1), (16, 1)],
  term ((-68 : Rat) / 7) [(1, 1), (5, 1), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((-384 : Rat) / 7) [(1, 1), (5, 1), (7, 1), (9, 2), (15, 3), (16, 1)],
  term ((8 : Rat) / 7) [(1, 1), (5, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((13 : Rat) / 14) [(1, 1), (5, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-15 : Rat) / 7) [(1, 1), (5, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((24 : Rat) / 7) [(1, 1), (5, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-272 : Rat) / 7) [(1, 1), (5, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term (12 : Rat) [(1, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((-32 : Rat) / 7) [(1, 1), (5, 1), (7, 1), (11, 2), (15, 1), (16, 1)],
  term ((-89 : Rat) / 28) [(1, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((-89 : Rat) / 28) [(1, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-48 : Rat) / 7) [(1, 1), (5, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((64 : Rat) / 7) [(1, 1), (5, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((48 : Rat) / 7) [(1, 1), (5, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-64 : Rat) / 7) [(1, 1), (5, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-64 : Rat) / 7) [(1, 1), (5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((128 : Rat) / 7) [(1, 1), (5, 1), (9, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((32 : Rat) / 7) [(1, 1), (5, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-64 : Rat) / 7) [(1, 1), (5, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((192 : Rat) / 7) [(1, 1), (5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((66 : Rat) / 7) [(1, 1), (5, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-768 : Rat) / 7) [(1, 1), (5, 1), (9, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((288 : Rat) / 7) [(1, 1), (5, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-384 : Rat) / 7) [(1, 1), (5, 1), (9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((288 : Rat) / 7) [(1, 1), (5, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((780 : Rat) / 7) [(1, 1), (5, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-316 : Rat) / 7) [(1, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((-256 : Rat) / 7) [(1, 1), (5, 1), (9, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((64 : Rat) / 7) [(1, 1), (5, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-96 : Rat) / 7) [(1, 1), (5, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((200 : Rat) / 7) [(1, 1), (5, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((320 : Rat) / 7) [(1, 1), (5, 1), (9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((144 : Rat) / 7) [(1, 1), (5, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-402 : Rat) / 7) [(1, 1), (5, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((768 : Rat) / 7) [(1, 1), (5, 1), (9, 2), (11, 1), (15, 3), (16, 1)],
  term ((256 : Rat) / 7) [(1, 1), (5, 1), (9, 2), (11, 2), (15, 2), (16, 1)],
  term ((-320 : Rat) / 7) [(1, 1), (5, 1), (9, 3), (11, 1), (15, 2), (16, 1)],
  term ((-144 : Rat) / 7) [(1, 1), (5, 1), (9, 3), (11, 1), (16, 1)],
  term ((-16 : Rat) / 7) [(1, 1), (5, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-160 : Rat) / 7) [(1, 1), (5, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((48 : Rat) / 7) [(1, 1), (5, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-132 : Rat) / 7) [(1, 1), (5, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((68 : Rat) / 7) [(1, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((-60 : Rat) / 7) [(1, 1), (5, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-156 : Rat) / 7) [(1, 1), (5, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((97 : Rat) / 14) [(1, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-64 : Rat) / 7) [(1, 1), (5, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-24 : Rat) / 7) [(1, 1), (5, 2), (7, 1), (8, 1), (16, 1)],
  term ((16 : Rat) / 7) [(1, 1), (5, 2), (7, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((128 : Rat) / 7) [(1, 1), (5, 2), (7, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-72 : Rat) / 7) [(1, 1), (5, 2), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((-48 : Rat) / 7) [(1, 1), (5, 2), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-41 : Rat) / 7) [(1, 1), (5, 2), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((384 : Rat) / 7) [(1, 1), (5, 2), (7, 1), (9, 1), (15, 3), (16, 1)],
  term ((-160 : Rat) / 7) [(1, 1), (5, 2), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((-72 : Rat) / 7) [(1, 1), (5, 2), (7, 1), (9, 2), (16, 1)],
  term ((-8 : Rat) / 7) [(1, 1), (5, 2), (7, 1), (10, 1), (16, 1)],
  term ((32 : Rat) / 7) [(1, 1), (5, 2), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((15 : Rat) / 7) [(1, 1), (5, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-24 : Rat) / 7) [(1, 1), (5, 2), (7, 1), (14, 1), (16, 1)],
  term ((192 : Rat) / 7) [(1, 1), (5, 2), (7, 1), (15, 2), (16, 1)],
  term ((-58 : Rat) / 7) [(1, 1), (5, 2), (7, 1), (16, 1)],
  term ((48 : Rat) / 7) [(1, 1), (5, 2), (8, 1), (9, 1), (16, 1)],
  term ((-48 : Rat) / 7) [(1, 1), (5, 2), (8, 1), (13, 1), (16, 1)],
  term ((64 : Rat) / 7) [(1, 1), (5, 2), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-128 : Rat) / 7) [(1, 1), (5, 2), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((256 : Rat) / 7) [(1, 1), (5, 2), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-64 : Rat) / 7) [(1, 1), (5, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-192 : Rat) / 7) [(1, 1), (5, 2), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((62 : Rat) / 7) [(1, 1), (5, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((768 : Rat) / 7) [(1, 1), (5, 2), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((-288 : Rat) / 7) [(1, 1), (5, 2), (9, 1), (13, 2), (16, 1)],
  term ((384 : Rat) / 7) [(1, 1), (5, 2), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-288 : Rat) / 7) [(1, 1), (5, 2), (9, 1), (14, 1), (16, 1)],
  term ((-620 : Rat) / 7) [(1, 1), (5, 2), (9, 1), (15, 2), (16, 1)],
  term ((244 : Rat) / 7) [(1, 1), (5, 2), (9, 1), (16, 1)],
  term ((-256 : Rat) / 7) [(1, 1), (5, 2), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((-320 : Rat) / 7) [(1, 1), (5, 2), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((-144 : Rat) / 7) [(1, 1), (5, 2), (9, 2), (13, 1), (16, 1)],
  term ((402 : Rat) / 7) [(1, 1), (5, 2), (9, 2), (15, 1), (16, 1)],
  term ((-768 : Rat) / 7) [(1, 1), (5, 2), (9, 2), (15, 3), (16, 1)],
  term ((320 : Rat) / 7) [(1, 1), (5, 2), (9, 3), (15, 2), (16, 1)],
  term ((144 : Rat) / 7) [(1, 1), (5, 2), (9, 3), (16, 1)],
  term ((16 : Rat) / 7) [(1, 1), (5, 2), (10, 1), (13, 1), (16, 1)],
  term ((160 : Rat) / 7) [(1, 1), (5, 2), (10, 1), (15, 1), (16, 1)],
  term ((64 : Rat) / 7) [(1, 1), (5, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-48 : Rat) / 7) [(1, 1), (5, 2), (13, 1), (14, 1), (16, 1)],
  term ((132 : Rat) / 7) [(1, 1), (5, 2), (13, 1), (15, 2), (16, 1)],
  term ((-80 : Rat) / 7) [(1, 1), (5, 2), (13, 1), (16, 1)],
  term ((60 : Rat) / 7) [(1, 1), (5, 2), (13, 2), (15, 1), (16, 1)],
  term ((156 : Rat) / 7) [(1, 1), (5, 2), (14, 1), (15, 1), (16, 1)],
  term ((-97 : Rat) / 14) [(1, 1), (5, 2), (15, 1), (16, 1)],
  term ((32 : Rat) / 7) [(1, 1), (7, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-8 : Rat) / 7) [(1, 1), (7, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-12 : Rat) / 7) [(1, 1), (7, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((48 : Rat) / 7) [(1, 1), (7, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-244 : Rat) / 7) [(1, 1), (7, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1 : Rat) / 4) [(1, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((-64 : Rat) / 7) [(1, 1), (7, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((68 : Rat) / 7) [(1, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((384 : Rat) / 7) [(1, 1), (7, 1), (9, 2), (11, 1), (15, 3), (16, 1)],
  term ((-13 : Rat) / 14) [(1, 1), (7, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-6 : Rat) / 7) [(1, 1), (7, 1), (10, 2), (16, 1)],
  term ((89 : Rat) / 28) [(1, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((89 : Rat) / 28) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((80 : Rat) / 7) [(1, 1), (7, 1), (11, 2), (15, 2), (16, 1)],
  term ((-26 : Rat) / 7) [(1, 1), (7, 1), (11, 2), (16, 1)],
  term ((-64 : Rat) / 7) [(1, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((64 : Rat) / 7) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 7) [(1, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((64 : Rat) / 7) [(1, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((24 : Rat) / 7) [(1, 1), (9, 1), (10, 2), (16, 1)],
  term ((96 : Rat) / 7) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-200 : Rat) / 7) [(1, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-128 : Rat) / 7) [(1, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-160 : Rat) / 7) [(1, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((72 : Rat) / 7) [(1, 1), (9, 1), (11, 2), (16, 1)],
  term ((12 : Rat) / 7) [(1, 1), (10, 2), (13, 1), (16, 1)],
  term ((12 : Rat) / 7) [(1, 1), (11, 2), (13, 1), (16, 1)],
  term ((-12 : Rat) / 7) [(1, 2), (5, 1), (7, 1), (16, 1)],
  term ((48 : Rat) / 7) [(1, 2), (5, 1), (9, 1), (16, 1)],
  term ((24 : Rat) / 7) [(1, 2), (5, 1), (13, 1), (16, 1)],
  term ((12 : Rat) / 7) [(1, 2), (7, 1), (11, 1), (16, 1)],
  term ((-48 : Rat) / 7) [(1, 2), (9, 1), (11, 1), (16, 1)],
  term ((-24 : Rat) / 7) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term ((-24 : Rat) / 7) [(3, 1), (4, 1), (5, 2), (9, 1), (16, 1)],
  term ((-6 : Rat) / 7) [(3, 1), (4, 1), (5, 2), (15, 1), (16, 1)],
  term ((24 : Rat) / 7) [(3, 1), (4, 1), (9, 1), (10, 2), (16, 1)],
  term ((24 : Rat) / 7) [(3, 1), (4, 1), (9, 1), (11, 2), (16, 1)],
  term ((6 : Rat) / 7) [(3, 1), (4, 1), (10, 2), (15, 1), (16, 1)],
  term ((6 : Rat) / 7) [(3, 1), (4, 1), (11, 2), (15, 1), (16, 1)],
  term ((-48 : Rat) / 7) [(3, 1), (4, 2), (5, 1), (8, 1), (16, 1)],
  term ((256 : Rat) / 7) [(3, 1), (4, 2), (5, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-386 : Rat) / 7) [(3, 1), (4, 2), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((768 : Rat) / 7) [(3, 1), (4, 2), (5, 1), (9, 1), (15, 3), (16, 1)],
  term ((-320 : Rat) / 7) [(3, 1), (4, 2), (5, 1), (9, 2), (15, 2), (16, 1)],
  term ((-144 : Rat) / 7) [(3, 1), (4, 2), (5, 1), (9, 2), (16, 1)],
  term ((64 : Rat) / 7) [(3, 1), (4, 2), (5, 1), (11, 1), (15, 1), (16, 1)],
  term (36 : Rat) [(3, 1), (4, 2), (5, 1), (15, 2), (16, 1)],
  term ((-24 : Rat) / 7) [(3, 1), (4, 2), (5, 1), (16, 1)],
  term ((-64 : Rat) / 7) [(3, 1), (4, 2), (8, 1), (15, 1), (16, 1)],
  term ((128 : Rat) / 7) [(3, 1), (4, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((344 : Rat) / 7) [(3, 1), (4, 2), (9, 1), (15, 2), (16, 1)],
  term ((-137 : Rat) / 14) [(3, 1), (4, 2), (9, 1), (16, 1)],
  term ((-136 : Rat) / 7) [(3, 1), (4, 2), (9, 2), (15, 1), (16, 1)],
  term ((-768 : Rat) / 7) [(3, 1), (4, 2), (9, 2), (15, 3), (16, 1)],
  term ((-160 : Rat) / 7) [(3, 1), (4, 2), (11, 1), (15, 2), (16, 1)],
  term ((109 : Rat) / 28) [(3, 1), (4, 2), (15, 1), (16, 1)],
  term ((-48 : Rat) / 7) [(3, 1), (4, 2), (15, 3), (16, 1)],
  term ((-24 : Rat) / 7) [(3, 1), (4, 3), (9, 1), (16, 1)],
  term ((-6 : Rat) / 7) [(3, 1), (4, 3), (15, 1), (16, 1)],
  term ((48 : Rat) / 7) [(3, 1), (5, 1), (8, 1), (10, 2), (16, 1)],
  term ((48 : Rat) / 7) [(3, 1), (5, 1), (8, 1), (11, 2), (16, 1)],
  term ((-256 : Rat) / 7) [(3, 1), (5, 1), (9, 1), (10, 2), (11, 1), (15, 2), (16, 1)],
  term ((386 : Rat) / 7) [(3, 1), (5, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-768 : Rat) / 7) [(3, 1), (5, 1), (9, 1), (10, 2), (15, 3), (16, 1)],
  term ((386 : Rat) / 7) [(3, 1), (5, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-768 : Rat) / 7) [(3, 1), (5, 1), (9, 1), (11, 2), (15, 3), (16, 1)],
  term ((-256 : Rat) / 7) [(3, 1), (5, 1), (9, 1), (11, 3), (15, 2), (16, 1)],
  term ((320 : Rat) / 7) [(3, 1), (5, 1), (9, 2), (10, 2), (15, 2), (16, 1)],
  term ((144 : Rat) / 7) [(3, 1), (5, 1), (9, 2), (10, 2), (16, 1)],
  term ((320 : Rat) / 7) [(3, 1), (5, 1), (9, 2), (11, 2), (15, 2), (16, 1)],
  term ((144 : Rat) / 7) [(3, 1), (5, 1), (9, 2), (11, 2), (16, 1)],
  term ((-64 : Rat) / 7) [(3, 1), (5, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term (-36 : Rat) [(3, 1), (5, 1), (10, 2), (15, 2), (16, 1)],
  term ((24 : Rat) / 7) [(3, 1), (5, 1), (10, 2), (16, 1)],
  term (-36 : Rat) [(3, 1), (5, 1), (11, 2), (15, 2), (16, 1)],
  term ((24 : Rat) / 7) [(3, 1), (5, 1), (11, 2), (16, 1)],
  term ((-64 : Rat) / 7) [(3, 1), (5, 1), (11, 3), (15, 1), (16, 1)],
  term ((-64 : Rat) / 7) [(3, 1), (5, 2), (8, 1), (15, 1), (16, 1)],
  term ((128 : Rat) / 7) [(3, 1), (5, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((344 : Rat) / 7) [(3, 1), (5, 2), (9, 1), (15, 2), (16, 1)],
  term ((-137 : Rat) / 14) [(3, 1), (5, 2), (9, 1), (16, 1)],
  term ((-136 : Rat) / 7) [(3, 1), (5, 2), (9, 2), (15, 1), (16, 1)],
  term ((-768 : Rat) / 7) [(3, 1), (5, 2), (9, 2), (15, 3), (16, 1)],
  term ((-160 : Rat) / 7) [(3, 1), (5, 2), (11, 1), (15, 2), (16, 1)],
  term ((109 : Rat) / 28) [(3, 1), (5, 2), (15, 1), (16, 1)],
  term ((-48 : Rat) / 7) [(3, 1), (5, 2), (15, 3), (16, 1)],
  term ((-48 : Rat) / 7) [(3, 1), (5, 3), (8, 1), (16, 1)],
  term ((256 : Rat) / 7) [(3, 1), (5, 3), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-386 : Rat) / 7) [(3, 1), (5, 3), (9, 1), (15, 1), (16, 1)],
  term ((768 : Rat) / 7) [(3, 1), (5, 3), (9, 1), (15, 3), (16, 1)],
  term ((-320 : Rat) / 7) [(3, 1), (5, 3), (9, 2), (15, 2), (16, 1)],
  term ((-144 : Rat) / 7) [(3, 1), (5, 3), (9, 2), (16, 1)],
  term ((64 : Rat) / 7) [(3, 1), (5, 3), (11, 1), (15, 1), (16, 1)],
  term (36 : Rat) [(3, 1), (5, 3), (15, 2), (16, 1)],
  term ((-24 : Rat) / 7) [(3, 1), (5, 3), (16, 1)],
  term ((64 : Rat) / 7) [(3, 1), (8, 1), (10, 2), (15, 1), (16, 1)],
  term ((64 : Rat) / 7) [(3, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((-128 : Rat) / 7) [(3, 1), (9, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-344 : Rat) / 7) [(3, 1), (9, 1), (10, 2), (15, 2), (16, 1)],
  term ((137 : Rat) / 14) [(3, 1), (9, 1), (10, 2), (16, 1)],
  term ((-344 : Rat) / 7) [(3, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((137 : Rat) / 14) [(3, 1), (9, 1), (11, 2), (16, 1)],
  term ((-128 : Rat) / 7) [(3, 1), (9, 1), (11, 3), (15, 1), (16, 1)],
  term ((136 : Rat) / 7) [(3, 1), (9, 2), (10, 2), (15, 1), (16, 1)],
  term ((768 : Rat) / 7) [(3, 1), (9, 2), (10, 2), (15, 3), (16, 1)],
  term ((136 : Rat) / 7) [(3, 1), (9, 2), (11, 2), (15, 1), (16, 1)],
  term ((768 : Rat) / 7) [(3, 1), (9, 2), (11, 2), (15, 3), (16, 1)],
  term ((160 : Rat) / 7) [(3, 1), (10, 2), (11, 1), (15, 2), (16, 1)],
  term ((-109 : Rat) / 28) [(3, 1), (10, 2), (15, 1), (16, 1)],
  term ((48 : Rat) / 7) [(3, 1), (10, 2), (15, 3), (16, 1)],
  term ((-109 : Rat) / 28) [(3, 1), (11, 2), (15, 1), (16, 1)],
  term ((48 : Rat) / 7) [(3, 1), (11, 2), (15, 3), (16, 1)],
  term ((160 : Rat) / 7) [(3, 1), (11, 3), (15, 2), (16, 1)],
  term ((12 : Rat) / 7) [(4, 1), (5, 2), (7, 1), (9, 1), (16, 1)],
  term ((-3 : Rat) / 14) [(4, 1), (5, 2), (7, 1), (15, 1), (16, 1)],
  term ((24 : Rat) / 7) [(4, 1), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((-27 : Rat) / 7) [(4, 1), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-12 : Rat) / 7) [(4, 1), (5, 2), (9, 2), (16, 1)],
  term ((15 : Rat) / 14) [(4, 1), (5, 2), (13, 1), (15, 1), (16, 1)],
  term ((-9 : Rat) / 7) [(4, 1), (5, 2), (15, 2), (16, 1)],
  term ((3 : Rat) / 7) [(4, 1), (5, 2), (16, 1)],
  term ((-12 : Rat) / 7) [(4, 1), (7, 1), (9, 1), (10, 2), (16, 1)],
  term ((-12 : Rat) / 7) [(4, 1), (7, 1), (9, 1), (11, 2), (16, 1)],
  term ((3 : Rat) / 14) [(4, 1), (7, 1), (10, 2), (15, 1), (16, 1)],
  term ((3 : Rat) / 14) [(4, 1), (7, 1), (11, 2), (15, 1), (16, 1)],
  term ((-24 : Rat) / 7) [(4, 1), (9, 1), (10, 2), (13, 1), (16, 1)],
  term ((27 : Rat) / 7) [(4, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-24 : Rat) / 7) [(4, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((27 : Rat) / 7) [(4, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((12 : Rat) / 7) [(4, 1), (9, 2), (10, 2), (16, 1)],
  term ((12 : Rat) / 7) [(4, 1), (9, 2), (11, 2), (16, 1)],
  term ((-15 : Rat) / 14) [(4, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((9 : Rat) / 7) [(4, 1), (10, 2), (15, 2), (16, 1)],
  term ((-3 : Rat) / 7) [(4, 1), (10, 2), (16, 1)],
  term ((-15 : Rat) / 14) [(4, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((9 : Rat) / 7) [(4, 1), (11, 2), (15, 2), (16, 1)],
  term ((-3 : Rat) / 7) [(4, 1), (11, 2), (16, 1)],
  term ((12 : Rat) / 7) [(4, 2), (5, 1), (7, 1), (8, 1), (16, 1)],
  term ((-8 : Rat) / 7) [(4, 2), (5, 1), (7, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-64 : Rat) / 7) [(4, 2), (5, 1), (7, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((36 : Rat) / 7) [(4, 2), (5, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((24 : Rat) / 7) [(4, 2), (5, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((41 : Rat) / 14) [(4, 2), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-192 : Rat) / 7) [(4, 2), (5, 1), (7, 1), (9, 1), (15, 3), (16, 1)],
  term ((80 : Rat) / 7) [(4, 2), (5, 1), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((36 : Rat) / 7) [(4, 2), (5, 1), (7, 1), (9, 2), (16, 1)],
  term ((4 : Rat) / 7) [(4, 2), (5, 1), (7, 1), (10, 1), (16, 1)],
  term ((-16 : Rat) / 7) [(4, 2), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-15 : Rat) / 14) [(4, 2), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((12 : Rat) / 7) [(4, 2), (5, 1), (7, 1), (14, 1), (16, 1)],
  term ((-96 : Rat) / 7) [(4, 2), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((32 : Rat) / 7) [(4, 2), (5, 1), (7, 1), (16, 1)],
  term ((-24 : Rat) / 7) [(4, 2), (5, 1), (8, 1), (9, 1), (16, 1)],
  term ((24 : Rat) / 7) [(4, 2), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((-32 : Rat) / 7) [(4, 2), (5, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((64 : Rat) / 7) [(4, 2), (5, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-128 : Rat) / 7) [(4, 2), (5, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((32 : Rat) / 7) [(4, 2), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((96 : Rat) / 7) [(4, 2), (5, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-31 : Rat) / 7) [(4, 2), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-384 : Rat) / 7) [(4, 2), (5, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((144 : Rat) / 7) [(4, 2), (5, 1), (9, 1), (13, 2), (16, 1)],
  term ((-192 : Rat) / 7) [(4, 2), (5, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((144 : Rat) / 7) [(4, 2), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((310 : Rat) / 7) [(4, 2), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-134 : Rat) / 7) [(4, 2), (5, 1), (9, 1), (16, 1)],
  term ((128 : Rat) / 7) [(4, 2), (5, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((160 : Rat) / 7) [(4, 2), (5, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((72 : Rat) / 7) [(4, 2), (5, 1), (9, 2), (13, 1), (16, 1)],
  term ((-201 : Rat) / 7) [(4, 2), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((384 : Rat) / 7) [(4, 2), (5, 1), (9, 2), (15, 3), (16, 1)],
  term ((-160 : Rat) / 7) [(4, 2), (5, 1), (9, 3), (15, 2), (16, 1)],
  term ((-72 : Rat) / 7) [(4, 2), (5, 1), (9, 3), (16, 1)],
  term ((-8 : Rat) / 7) [(4, 2), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((-80 : Rat) / 7) [(4, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 7) [(4, 2), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((24 : Rat) / 7) [(4, 2), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((-66 : Rat) / 7) [(4, 2), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((34 : Rat) / 7) [(4, 2), (5, 1), (13, 1), (16, 1)],
  term ((-30 : Rat) / 7) [(4, 2), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((-78 : Rat) / 7) [(4, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((97 : Rat) / 28) [(4, 2), (5, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 7) [(4, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-4 : Rat) / 7) [(4, 2), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((-32 : Rat) / 7) [(4, 2), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-6 : Rat) / 7) [(4, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((24 : Rat) / 7) [(4, 2), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((-122 : Rat) / 7) [(4, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-1 : Rat) / 8) [(4, 2), (7, 1), (9, 1), (16, 1)],
  term ((34 : Rat) / 7) [(4, 2), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((192 : Rat) / 7) [(4, 2), (7, 1), (9, 2), (15, 3), (16, 1)],
  term ((-13 : Rat) / 28) [(4, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((40 : Rat) / 7) [(4, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-10 : Rat) / 7) [(4, 2), (7, 1), (11, 1), (16, 1)],
  term ((89 : Rat) / 56) [(4, 2), (7, 1), (13, 1), (16, 1)],
  term ((89 : Rat) / 56) [(4, 2), (7, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 7) [(4, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 7) [(4, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 7) [(4, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((32 : Rat) / 7) [(4, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-64 : Rat) / 7) [(4, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-80 : Rat) / 7) [(4, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((24 : Rat) / 7) [(4, 2), (9, 1), (11, 1), (16, 1)],
  term ((48 : Rat) / 7) [(4, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-100 : Rat) / 7) [(4, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((12 : Rat) / 7) [(4, 3), (7, 1), (9, 1), (16, 1)],
  term ((-3 : Rat) / 14) [(4, 3), (7, 1), (15, 1), (16, 1)],
  term ((24 : Rat) / 7) [(4, 3), (9, 1), (13, 1), (16, 1)],
  term ((-27 : Rat) / 7) [(4, 3), (9, 1), (15, 1), (16, 1)],
  term ((-12 : Rat) / 7) [(4, 3), (9, 2), (16, 1)],
  term ((15 : Rat) / 14) [(4, 3), (13, 1), (15, 1), (16, 1)],
  term ((-9 : Rat) / 7) [(4, 3), (15, 2), (16, 1)],
  term ((3 : Rat) / 7) [(4, 3), (16, 1)],
  term ((-12 : Rat) / 7) [(5, 1), (7, 1), (8, 1), (10, 2), (16, 1)],
  term ((-12 : Rat) / 7) [(5, 1), (7, 1), (8, 1), (11, 2), (16, 1)],
  term ((8 : Rat) / 7) [(5, 1), (7, 1), (9, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((64 : Rat) / 7) [(5, 1), (7, 1), (9, 1), (10, 2), (11, 1), (15, 2), (16, 1)],
  term ((-36 : Rat) / 7) [(5, 1), (7, 1), (9, 1), (10, 2), (13, 1), (16, 1)],
  term ((-24 : Rat) / 7) [(5, 1), (7, 1), (9, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-41 : Rat) / 14) [(5, 1), (7, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((192 : Rat) / 7) [(5, 1), (7, 1), (9, 1), (10, 2), (15, 3), (16, 1)],
  term ((8 : Rat) / 7) [(5, 1), (7, 1), (9, 1), (10, 3), (15, 1), (16, 1)],
  term ((-36 : Rat) / 7) [(5, 1), (7, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-24 : Rat) / 7) [(5, 1), (7, 1), (9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-41 : Rat) / 14) [(5, 1), (7, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((192 : Rat) / 7) [(5, 1), (7, 1), (9, 1), (11, 2), (15, 3), (16, 1)],
  term ((64 : Rat) / 7) [(5, 1), (7, 1), (9, 1), (11, 3), (15, 2), (16, 1)],
  term ((-80 : Rat) / 7) [(5, 1), (7, 1), (9, 2), (10, 2), (15, 2), (16, 1)],
  term ((-36 : Rat) / 7) [(5, 1), (7, 1), (9, 2), (10, 2), (16, 1)],
  term ((-80 : Rat) / 7) [(5, 1), (7, 1), (9, 2), (11, 2), (15, 2), (16, 1)],
  term ((-36 : Rat) / 7) [(5, 1), (7, 1), (9, 2), (11, 2), (16, 1)],
  term ((-4 : Rat) / 7) [(5, 1), (7, 1), (10, 1), (11, 2), (16, 1)],
  term ((16 : Rat) / 7) [(5, 1), (7, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((15 : Rat) / 14) [(5, 1), (7, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-12 : Rat) / 7) [(5, 1), (7, 1), (10, 2), (14, 1), (16, 1)],
  term ((96 : Rat) / 7) [(5, 1), (7, 1), (10, 2), (15, 2), (16, 1)],
  term ((-32 : Rat) / 7) [(5, 1), (7, 1), (10, 2), (16, 1)],
  term ((-4 : Rat) / 7) [(5, 1), (7, 1), (10, 3), (16, 1)],
  term ((15 : Rat) / 14) [(5, 1), (7, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-12 : Rat) / 7) [(5, 1), (7, 1), (11, 2), (14, 1), (16, 1)],
  term ((96 : Rat) / 7) [(5, 1), (7, 1), (11, 2), (15, 2), (16, 1)],
  term ((-32 : Rat) / 7) [(5, 1), (7, 1), (11, 2), (16, 1)],
  term ((16 : Rat) / 7) [(5, 1), (7, 1), (11, 3), (15, 1), (16, 1)],
  term ((24 : Rat) / 7) [(5, 1), (8, 1), (9, 1), (10, 2), (16, 1)],
  term ((24 : Rat) / 7) [(5, 1), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((-24 : Rat) / 7) [(5, 1), (8, 1), (10, 2), (13, 1), (16, 1)],
  term ((-24 : Rat) / 7) [(5, 1), (8, 1), (11, 2), (13, 1), (16, 1)],
  term ((32 : Rat) / 7) [(5, 1), (9, 1), (10, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-64 : Rat) / 7) [(5, 1), (9, 1), (10, 1), (11, 2), (15, 2), (16, 1)],
  term ((128 : Rat) / 7) [(5, 1), (9, 1), (10, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-32 : Rat) / 7) [(5, 1), (9, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-96 : Rat) / 7) [(5, 1), (9, 1), (10, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((31 : Rat) / 7) [(5, 1), (9, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((384 : Rat) / 7) [(5, 1), (9, 1), (10, 2), (13, 1), (15, 3), (16, 1)],
  term ((-144 : Rat) / 7) [(5, 1), (9, 1), (10, 2), (13, 2), (16, 1)],
  term ((192 : Rat) / 7) [(5, 1), (9, 1), (10, 2), (14, 1), (15, 2), (16, 1)],
  term ((-144 : Rat) / 7) [(5, 1), (9, 1), (10, 2), (14, 1), (16, 1)],
  term ((-310 : Rat) / 7) [(5, 1), (9, 1), (10, 2), (15, 2), (16, 1)],
  term ((134 : Rat) / 7) [(5, 1), (9, 1), (10, 2), (16, 1)],
  term ((32 : Rat) / 7) [(5, 1), (9, 1), (10, 3), (13, 1), (15, 1), (16, 1)],
  term ((-64 : Rat) / 7) [(5, 1), (9, 1), (10, 3), (15, 2), (16, 1)],
  term ((-96 : Rat) / 7) [(5, 1), (9, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((31 : Rat) / 7) [(5, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((384 : Rat) / 7) [(5, 1), (9, 1), (11, 2), (13, 1), (15, 3), (16, 1)],
  term ((-144 : Rat) / 7) [(5, 1), (9, 1), (11, 2), (13, 2), (16, 1)],
  term ((192 : Rat) / 7) [(5, 1), (9, 1), (11, 2), (14, 1), (15, 2), (16, 1)],
  term ((-144 : Rat) / 7) [(5, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((-310 : Rat) / 7) [(5, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((134 : Rat) / 7) [(5, 1), (9, 1), (11, 2), (16, 1)],
  term ((128 : Rat) / 7) [(5, 1), (9, 1), (11, 3), (13, 1), (15, 2), (16, 1)],
  term ((-32 : Rat) / 7) [(5, 1), (9, 1), (11, 3), (15, 1), (16, 1)],
  term ((-128 : Rat) / 7) [(5, 1), (9, 2), (10, 2), (11, 1), (15, 2), (16, 1)],
  term ((-160 : Rat) / 7) [(5, 1), (9, 2), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((-72 : Rat) / 7) [(5, 1), (9, 2), (10, 2), (13, 1), (16, 1)],
  term ((201 : Rat) / 7) [(5, 1), (9, 2), (10, 2), (15, 1), (16, 1)],
  term ((-384 : Rat) / 7) [(5, 1), (9, 2), (10, 2), (15, 3), (16, 1)],
  term ((-160 : Rat) / 7) [(5, 1), (9, 2), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-72 : Rat) / 7) [(5, 1), (9, 2), (11, 2), (13, 1), (16, 1)],
  term ((201 : Rat) / 7) [(5, 1), (9, 2), (11, 2), (15, 1), (16, 1)],
  term ((-384 : Rat) / 7) [(5, 1), (9, 2), (11, 2), (15, 3), (16, 1)],
  term ((-128 : Rat) / 7) [(5, 1), (9, 2), (11, 3), (15, 2), (16, 1)],
  term ((160 : Rat) / 7) [(5, 1), (9, 3), (10, 2), (15, 2), (16, 1)],
  term ((72 : Rat) / 7) [(5, 1), (9, 3), (10, 2), (16, 1)],
  term ((160 : Rat) / 7) [(5, 1), (9, 3), (11, 2), (15, 2), (16, 1)],
  term ((72 : Rat) / 7) [(5, 1), (9, 3), (11, 2), (16, 1)],
  term ((8 : Rat) / 7) [(5, 1), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((80 : Rat) / 7) [(5, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((32 : Rat) / 7) [(5, 1), (10, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-24 : Rat) / 7) [(5, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((66 : Rat) / 7) [(5, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((-34 : Rat) / 7) [(5, 1), (10, 2), (13, 1), (16, 1)],
  term ((30 : Rat) / 7) [(5, 1), (10, 2), (13, 2), (15, 1), (16, 1)],
  term ((78 : Rat) / 7) [(5, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-97 : Rat) / 28) [(5, 1), (10, 2), (15, 1), (16, 1)],
  term ((8 : Rat) / 7) [(5, 1), (10, 3), (13, 1), (16, 1)],
  term ((80 : Rat) / 7) [(5, 1), (10, 3), (15, 1), (16, 1)],
  term ((-24 : Rat) / 7) [(5, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((66 : Rat) / 7) [(5, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-34 : Rat) / 7) [(5, 1), (11, 2), (13, 1), (16, 1)],
  term ((30 : Rat) / 7) [(5, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((78 : Rat) / 7) [(5, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-97 : Rat) / 28) [(5, 1), (11, 2), (15, 1), (16, 1)],
  term ((32 : Rat) / 7) [(5, 1), (11, 3), (13, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 7) [(5, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-4 : Rat) / 7) [(5, 2), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((-32 : Rat) / 7) [(5, 2), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-6 : Rat) / 7) [(5, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((24 : Rat) / 7) [(5, 2), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((-122 : Rat) / 7) [(5, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-1 : Rat) / 8) [(5, 2), (7, 1), (9, 1), (16, 1)],
  term ((34 : Rat) / 7) [(5, 2), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((192 : Rat) / 7) [(5, 2), (7, 1), (9, 2), (15, 3), (16, 1)],
  term ((-13 : Rat) / 28) [(5, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((40 : Rat) / 7) [(5, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-10 : Rat) / 7) [(5, 2), (7, 1), (11, 1), (16, 1)],
  term ((89 : Rat) / 56) [(5, 2), (7, 1), (13, 1), (16, 1)],
  term ((89 : Rat) / 56) [(5, 2), (7, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 7) [(5, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 7) [(5, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 7) [(5, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((32 : Rat) / 7) [(5, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-64 : Rat) / 7) [(5, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-80 : Rat) / 7) [(5, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((24 : Rat) / 7) [(5, 2), (9, 1), (11, 1), (16, 1)],
  term ((48 : Rat) / 7) [(5, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-100 : Rat) / 7) [(5, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((12 : Rat) / 7) [(5, 3), (7, 1), (8, 1), (16, 1)],
  term ((-8 : Rat) / 7) [(5, 3), (7, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-64 : Rat) / 7) [(5, 3), (7, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((36 : Rat) / 7) [(5, 3), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((24 : Rat) / 7) [(5, 3), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((41 : Rat) / 14) [(5, 3), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-192 : Rat) / 7) [(5, 3), (7, 1), (9, 1), (15, 3), (16, 1)],
  term ((80 : Rat) / 7) [(5, 3), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((36 : Rat) / 7) [(5, 3), (7, 1), (9, 2), (16, 1)],
  term ((4 : Rat) / 7) [(5, 3), (7, 1), (10, 1), (16, 1)],
  term ((-16 : Rat) / 7) [(5, 3), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-15 : Rat) / 14) [(5, 3), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((12 : Rat) / 7) [(5, 3), (7, 1), (14, 1), (16, 1)],
  term ((-96 : Rat) / 7) [(5, 3), (7, 1), (15, 2), (16, 1)],
  term ((32 : Rat) / 7) [(5, 3), (7, 1), (16, 1)],
  term ((-24 : Rat) / 7) [(5, 3), (8, 1), (9, 1), (16, 1)],
  term ((24 : Rat) / 7) [(5, 3), (8, 1), (13, 1), (16, 1)],
  term ((-32 : Rat) / 7) [(5, 3), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((64 : Rat) / 7) [(5, 3), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-128 : Rat) / 7) [(5, 3), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((32 : Rat) / 7) [(5, 3), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((96 : Rat) / 7) [(5, 3), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-31 : Rat) / 7) [(5, 3), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-384 : Rat) / 7) [(5, 3), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((144 : Rat) / 7) [(5, 3), (9, 1), (13, 2), (16, 1)],
  term ((-192 : Rat) / 7) [(5, 3), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((144 : Rat) / 7) [(5, 3), (9, 1), (14, 1), (16, 1)],
  term ((310 : Rat) / 7) [(5, 3), (9, 1), (15, 2), (16, 1)],
  term ((-134 : Rat) / 7) [(5, 3), (9, 1), (16, 1)],
  term ((128 : Rat) / 7) [(5, 3), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((160 : Rat) / 7) [(5, 3), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((72 : Rat) / 7) [(5, 3), (9, 2), (13, 1), (16, 1)],
  term ((-201 : Rat) / 7) [(5, 3), (9, 2), (15, 1), (16, 1)],
  term ((384 : Rat) / 7) [(5, 3), (9, 2), (15, 3), (16, 1)],
  term ((-160 : Rat) / 7) [(5, 3), (9, 3), (15, 2), (16, 1)],
  term ((-72 : Rat) / 7) [(5, 3), (9, 3), (16, 1)],
  term ((-8 : Rat) / 7) [(5, 3), (10, 1), (13, 1), (16, 1)],
  term ((-80 : Rat) / 7) [(5, 3), (10, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 7) [(5, 3), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((24 : Rat) / 7) [(5, 3), (13, 1), (14, 1), (16, 1)],
  term ((-66 : Rat) / 7) [(5, 3), (13, 1), (15, 2), (16, 1)],
  term ((34 : Rat) / 7) [(5, 3), (13, 1), (16, 1)],
  term ((-30 : Rat) / 7) [(5, 3), (13, 2), (15, 1), (16, 1)],
  term ((-78 : Rat) / 7) [(5, 3), (14, 1), (15, 1), (16, 1)],
  term ((97 : Rat) / 28) [(5, 3), (15, 1), (16, 1)],
  term ((-16 : Rat) / 7) [(7, 1), (8, 1), (10, 2), (15, 1), (16, 1)],
  term ((-16 : Rat) / 7) [(7, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((4 : Rat) / 7) [(7, 1), (9, 1), (10, 1), (11, 2), (16, 1)],
  term ((32 : Rat) / 7) [(7, 1), (9, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((6 : Rat) / 7) [(7, 1), (9, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-24 : Rat) / 7) [(7, 1), (9, 1), (10, 2), (14, 1), (16, 1)],
  term ((122 : Rat) / 7) [(7, 1), (9, 1), (10, 2), (15, 2), (16, 1)],
  term ((1 : Rat) / 8) [(7, 1), (9, 1), (10, 2), (16, 1)],
  term ((4 : Rat) / 7) [(7, 1), (9, 1), (10, 3), (16, 1)],
  term ((6 : Rat) / 7) [(7, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-24 : Rat) / 7) [(7, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((122 : Rat) / 7) [(7, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((1 : Rat) / 8) [(7, 1), (9, 1), (11, 2), (16, 1)],
  term ((32 : Rat) / 7) [(7, 1), (9, 1), (11, 3), (15, 1), (16, 1)],
  term ((-34 : Rat) / 7) [(7, 1), (9, 2), (10, 2), (15, 1), (16, 1)],
  term ((-192 : Rat) / 7) [(7, 1), (9, 2), (10, 2), (15, 3), (16, 1)],
  term ((-34 : Rat) / 7) [(7, 1), (9, 2), (11, 2), (15, 1), (16, 1)],
  term ((-192 : Rat) / 7) [(7, 1), (9, 2), (11, 2), (15, 3), (16, 1)],
  term ((13 : Rat) / 28) [(7, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((-40 : Rat) / 7) [(7, 1), (10, 2), (11, 1), (15, 2), (16, 1)],
  term ((10 : Rat) / 7) [(7, 1), (10, 2), (11, 1), (16, 1)],
  term ((-89 : Rat) / 56) [(7, 1), (10, 2), (13, 1), (16, 1)],
  term ((-89 : Rat) / 56) [(7, 1), (10, 2), (15, 1), (16, 1)],
  term ((13 : Rat) / 28) [(7, 1), (10, 3), (15, 1), (16, 1)],
  term ((-89 : Rat) / 56) [(7, 1), (11, 2), (13, 1), (16, 1)],
  term ((-89 : Rat) / 56) [(7, 1), (11, 2), (15, 1), (16, 1)],
  term ((-40 : Rat) / 7) [(7, 1), (11, 3), (15, 2), (16, 1)],
  term ((10 : Rat) / 7) [(7, 1), (11, 3), (16, 1)],
  term ((32 : Rat) / 7) [(8, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((32 : Rat) / 7) [(8, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-32 : Rat) / 7) [(8, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 7) [(8, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 7) [(9, 1), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((-32 : Rat) / 7) [(9, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((64 : Rat) / 7) [(9, 1), (10, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((80 : Rat) / 7) [(9, 1), (10, 2), (11, 1), (15, 2), (16, 1)],
  term ((-24 : Rat) / 7) [(9, 1), (10, 2), (11, 1), (16, 1)],
  term ((-48 : Rat) / 7) [(9, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((100 : Rat) / 7) [(9, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((16 : Rat) / 7) [(9, 1), (10, 3), (13, 1), (16, 1)],
  term ((-32 : Rat) / 7) [(9, 1), (10, 3), (15, 1), (16, 1)],
  term ((-48 : Rat) / 7) [(9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((100 : Rat) / 7) [(9, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((64 : Rat) / 7) [(9, 1), (11, 3), (13, 1), (15, 1), (16, 1)],
  term ((80 : Rat) / 7) [(9, 1), (11, 3), (15, 2), (16, 1)],
  term ((-24 : Rat) / 7) [(9, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 8, terms 0 through 99. -/
theorem rs_R005_ueqv_R005NNNN_block_08_0000_0099_valid :
    checkProductSumEq rs_R005_ueqv_R005NNNN_partials_08_0000_0099
      rs_R005_ueqv_R005NNNN_block_08_0000_0099 = true := by
  native_decide

end R005UeqvR005NNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
