/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R013:u=v:R013NNYN, term block 27:0-15

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R013UeqvR013NNYNTermShards

/-- Generator polynomial 27 for relaxed split surplus certificate `R013:u=v:R013NNYN`. -/
def rs_R013_ueqv_R013NNYN_generator_27_0000_0015 : Poly :=
[
  term (-2 : Rat) [(0, 1), (12, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (13, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(12, 1), (14, 1)],
  term (2 : Rat) [(13, 1), (15, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013NNYN_coefficient_27_0000 : Poly :=
[
  term ((288 : Rat) / 103) [(0, 1), (13, 2), (16, 1)]
]

/-- Partial product 0 for generator 27. -/
def rs_R013_ueqv_R013NNYN_partial_27_0000 : Poly :=
[
  term ((-576 : Rat) / 103) [(0, 1), (1, 1), (13, 3), (16, 1)],
  term ((288 : Rat) / 103) [(0, 1), (1, 2), (13, 2), (16, 1)],
  term ((576 : Rat) / 103) [(0, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-288 : Rat) / 103) [(0, 1), (13, 2), (14, 2), (16, 1)],
  term ((-288 : Rat) / 103) [(0, 1), (13, 2), (15, 2), (16, 1)],
  term ((576 : Rat) / 103) [(0, 1), (13, 3), (15, 1), (16, 1)],
  term ((-576 : Rat) / 103) [(0, 2), (12, 1), (13, 2), (16, 1)],
  term ((288 : Rat) / 103) [(0, 3), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 27. -/
theorem rs_R013_ueqv_R013NNYN_partial_27_0000_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_27_0000
        rs_R013_ueqv_R013NNYN_generator_27_0000_0015 =
      rs_R013_ueqv_R013NNYN_partial_27_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013NNYN_coefficient_27_0001 : Poly :=
[
  term ((-624 : Rat) / 103) [(0, 1), (14, 1), (16, 1)]
]

/-- Partial product 1 for generator 27. -/
def rs_R013_ueqv_R013NNYN_partial_27_0001 : Poly :=
[
  term ((1248 : Rat) / 103) [(0, 1), (1, 1), (13, 1), (14, 1), (16, 1)],
  term ((-624 : Rat) / 103) [(0, 1), (1, 2), (14, 1), (16, 1)],
  term ((-1248 : Rat) / 103) [(0, 1), (12, 1), (14, 2), (16, 1)],
  term ((-1248 : Rat) / 103) [(0, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((624 : Rat) / 103) [(0, 1), (14, 1), (15, 2), (16, 1)],
  term ((624 : Rat) / 103) [(0, 1), (14, 3), (16, 1)],
  term ((1248 : Rat) / 103) [(0, 2), (12, 1), (14, 1), (16, 1)],
  term ((-624 : Rat) / 103) [(0, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 27. -/
theorem rs_R013_ueqv_R013NNYN_partial_27_0001_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_27_0001
        rs_R013_ueqv_R013NNYN_generator_27_0000_0015 =
      rs_R013_ueqv_R013NNYN_partial_27_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013NNYN_coefficient_27_0002 : Poly :=
[
  term ((288 : Rat) / 103) [(0, 1), (16, 1)]
]

/-- Partial product 2 for generator 27. -/
def rs_R013_ueqv_R013NNYN_partial_27_0002 : Poly :=
[
  term ((-576 : Rat) / 103) [(0, 1), (1, 1), (13, 1), (16, 1)],
  term ((288 : Rat) / 103) [(0, 1), (1, 2), (16, 1)],
  term ((576 : Rat) / 103) [(0, 1), (12, 1), (14, 1), (16, 1)],
  term ((576 : Rat) / 103) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term ((-288 : Rat) / 103) [(0, 1), (14, 2), (16, 1)],
  term ((-288 : Rat) / 103) [(0, 1), (15, 2), (16, 1)],
  term ((-576 : Rat) / 103) [(0, 2), (12, 1), (16, 1)],
  term ((288 : Rat) / 103) [(0, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 27. -/
theorem rs_R013_ueqv_R013NNYN_partial_27_0002_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_27_0002
        rs_R013_ueqv_R013NNYN_generator_27_0000_0015 =
      rs_R013_ueqv_R013NNYN_partial_27_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013NNYN_coefficient_27_0003 : Poly :=
[
  term ((-288 : Rat) / 103) [(1, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 3 for generator 27. -/
def rs_R013_ueqv_R013NNYN_partial_27_0003 : Poly :=
[
  term ((576 : Rat) / 103) [(0, 1), (1, 1), (12, 2), (13, 1), (16, 1)],
  term ((-288 : Rat) / 103) [(0, 2), (1, 1), (12, 1), (13, 1), (16, 1)],
  term ((288 : Rat) / 103) [(1, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((288 : Rat) / 103) [(1, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-576 : Rat) / 103) [(1, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-576 : Rat) / 103) [(1, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((576 : Rat) / 103) [(1, 2), (12, 1), (13, 2), (16, 1)],
  term ((-288 : Rat) / 103) [(1, 3), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 27. -/
theorem rs_R013_ueqv_R013NNYN_partial_27_0003_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_27_0003
        rs_R013_ueqv_R013NNYN_generator_27_0000_0015 =
      rs_R013_ueqv_R013NNYN_partial_27_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013NNYN_coefficient_27_0004 : Poly :=
[
  term ((3456 : Rat) / 103) [(1, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 4 for generator 27. -/
def rs_R013_ueqv_R013NNYN_partial_27_0004 : Poly :=
[
  term ((-6912 : Rat) / 103) [(0, 1), (1, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((3456 : Rat) / 103) [(0, 2), (1, 1), (13, 1), (14, 1), (16, 1)],
  term ((6912 : Rat) / 103) [(1, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-3456 : Rat) / 103) [(1, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3456 : Rat) / 103) [(1, 1), (13, 1), (14, 3), (16, 1)],
  term ((6912 : Rat) / 103) [(1, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-6912 : Rat) / 103) [(1, 2), (13, 2), (14, 1), (16, 1)],
  term ((3456 : Rat) / 103) [(1, 3), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 27. -/
theorem rs_R013_ueqv_R013NNYN_partial_27_0004_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_27_0004
        rs_R013_ueqv_R013NNYN_generator_27_0000_0015 =
      rs_R013_ueqv_R013NNYN_partial_27_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013NNYN_coefficient_27_0005 : Poly :=
[
  term ((576 : Rat) / 103) [(1, 1), (13, 1), (16, 1)]
]

/-- Partial product 5 for generator 27. -/
def rs_R013_ueqv_R013NNYN_partial_27_0005 : Poly :=
[
  term ((-1152 : Rat) / 103) [(0, 1), (1, 1), (12, 1), (13, 1), (16, 1)],
  term ((576 : Rat) / 103) [(0, 2), (1, 1), (13, 1), (16, 1)],
  term ((1152 : Rat) / 103) [(1, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-576 : Rat) / 103) [(1, 1), (13, 1), (14, 2), (16, 1)],
  term ((-576 : Rat) / 103) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((1152 : Rat) / 103) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1152 : Rat) / 103) [(1, 2), (13, 2), (16, 1)],
  term ((576 : Rat) / 103) [(1, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 27. -/
theorem rs_R013_ueqv_R013NNYN_partial_27_0005_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_27_0005
        rs_R013_ueqv_R013NNYN_generator_27_0000_0015 =
      rs_R013_ueqv_R013NNYN_partial_27_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013NNYN_coefficient_27_0006 : Poly :=
[
  term ((-5472 : Rat) / 103) [(1, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 6 for generator 27. -/
def rs_R013_ueqv_R013NNYN_partial_27_0006 : Poly :=
[
  term ((10944 : Rat) / 103) [(0, 1), (1, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5472 : Rat) / 103) [(0, 2), (1, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10944 : Rat) / 103) [(1, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-10944 : Rat) / 103) [(1, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((5472 : Rat) / 103) [(1, 1), (14, 1), (15, 3), (16, 1)],
  term ((5472 : Rat) / 103) [(1, 1), (14, 3), (15, 1), (16, 1)],
  term ((10944 : Rat) / 103) [(1, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5472 : Rat) / 103) [(1, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 27. -/
theorem rs_R013_ueqv_R013NNYN_partial_27_0006_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_27_0006
        rs_R013_ueqv_R013NNYN_generator_27_0000_0015 =
      rs_R013_ueqv_R013NNYN_partial_27_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013NNYN_coefficient_27_0007 : Poly :=
[
  term ((288 : Rat) / 103) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 7 for generator 27. -/
def rs_R013_ueqv_R013NNYN_partial_27_0007 : Poly :=
[
  term ((-576 : Rat) / 103) [(0, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((288 : Rat) / 103) [(0, 2), (7, 1), (13, 1), (16, 1)],
  term ((-576 : Rat) / 103) [(1, 1), (7, 1), (13, 2), (16, 1)],
  term ((288 : Rat) / 103) [(1, 2), (7, 1), (13, 1), (16, 1)],
  term ((576 : Rat) / 103) [(7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-288 : Rat) / 103) [(7, 1), (13, 1), (14, 2), (16, 1)],
  term ((-288 : Rat) / 103) [(7, 1), (13, 1), (15, 2), (16, 1)],
  term ((576 : Rat) / 103) [(7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 27. -/
theorem rs_R013_ueqv_R013NNYN_partial_27_0007_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_27_0007
        rs_R013_ueqv_R013NNYN_generator_27_0000_0015 =
      rs_R013_ueqv_R013NNYN_partial_27_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013NNYN_coefficient_27_0008 : Poly :=
[
  term ((-864 : Rat) / 103) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 8 for generator 27. -/
def rs_R013_ueqv_R013NNYN_partial_27_0008 : Poly :=
[
  term ((1728 : Rat) / 103) [(0, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-864 : Rat) / 103) [(0, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1728 : Rat) / 103) [(1, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-864 : Rat) / 103) [(1, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((864 : Rat) / 103) [(12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((864 : Rat) / 103) [(12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-1728 : Rat) / 103) [(12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-1728 : Rat) / 103) [(12, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 27. -/
theorem rs_R013_ueqv_R013NNYN_partial_27_0008_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_27_0008
        rs_R013_ueqv_R013NNYN_generator_27_0000_0015 =
      rs_R013_ueqv_R013NNYN_partial_27_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013NNYN_coefficient_27_0009 : Poly :=
[
  term ((-576 : Rat) / 103) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 9 for generator 27. -/
def rs_R013_ueqv_R013NNYN_partial_27_0009 : Poly :=
[
  term ((1152 : Rat) / 103) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-576 : Rat) / 103) [(0, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1152 : Rat) / 103) [(1, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-576 : Rat) / 103) [(1, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1152 : Rat) / 103) [(12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((576 : Rat) / 103) [(13, 1), (14, 1), (15, 3), (16, 1)],
  term ((576 : Rat) / 103) [(13, 1), (14, 3), (15, 1), (16, 1)],
  term ((-1152 : Rat) / 103) [(13, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 27. -/
theorem rs_R013_ueqv_R013NNYN_partial_27_0009_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_27_0009
        rs_R013_ueqv_R013NNYN_generator_27_0000_0015 =
      rs_R013_ueqv_R013NNYN_partial_27_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013NNYN_coefficient_27_0010 : Poly :=
[
  term ((864 : Rat) / 103) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 10 for generator 27. -/
def rs_R013_ueqv_R013NNYN_partial_27_0010 : Poly :=
[
  term ((-1728 : Rat) / 103) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((864 : Rat) / 103) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1728 : Rat) / 103) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((864 : Rat) / 103) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((1728 : Rat) / 103) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-864 : Rat) / 103) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-864 : Rat) / 103) [(13, 1), (15, 3), (16, 1)],
  term ((1728 : Rat) / 103) [(13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 27. -/
theorem rs_R013_ueqv_R013NNYN_partial_27_0010_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_27_0010
        rs_R013_ueqv_R013NNYN_generator_27_0000_0015 =
      rs_R013_ueqv_R013NNYN_partial_27_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013NNYN_coefficient_27_0011 : Poly :=
[
  term ((864 : Rat) / 103) [(13, 2), (14, 1), (16, 1)]
]

/-- Partial product 11 for generator 27. -/
def rs_R013_ueqv_R013NNYN_partial_27_0011 : Poly :=
[
  term ((-1728 : Rat) / 103) [(0, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((864 : Rat) / 103) [(0, 2), (13, 2), (14, 1), (16, 1)],
  term ((-1728 : Rat) / 103) [(1, 1), (13, 3), (14, 1), (16, 1)],
  term ((864 : Rat) / 103) [(1, 2), (13, 2), (14, 1), (16, 1)],
  term ((1728 : Rat) / 103) [(12, 1), (13, 2), (14, 2), (16, 1)],
  term ((-864 : Rat) / 103) [(13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-864 : Rat) / 103) [(13, 2), (14, 3), (16, 1)],
  term ((1728 : Rat) / 103) [(13, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 27. -/
theorem rs_R013_ueqv_R013NNYN_partial_27_0011_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_27_0011
        rs_R013_ueqv_R013NNYN_generator_27_0000_0015 =
      rs_R013_ueqv_R013NNYN_partial_27_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013NNYN_coefficient_27_0012 : Poly :=
[
  term ((-1152 : Rat) / 103) [(13, 2), (16, 1)]
]

/-- Partial product 12 for generator 27. -/
def rs_R013_ueqv_R013NNYN_partial_27_0012 : Poly :=
[
  term ((2304 : Rat) / 103) [(0, 1), (12, 1), (13, 2), (16, 1)],
  term ((-1152 : Rat) / 103) [(0, 2), (13, 2), (16, 1)],
  term ((2304 : Rat) / 103) [(1, 1), (13, 3), (16, 1)],
  term ((-1152 : Rat) / 103) [(1, 2), (13, 2), (16, 1)],
  term ((-2304 : Rat) / 103) [(12, 1), (13, 2), (14, 1), (16, 1)],
  term ((1152 : Rat) / 103) [(13, 2), (14, 2), (16, 1)],
  term ((1152 : Rat) / 103) [(13, 2), (15, 2), (16, 1)],
  term ((-2304 : Rat) / 103) [(13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 27. -/
theorem rs_R013_ueqv_R013NNYN_partial_27_0012_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_27_0012
        rs_R013_ueqv_R013NNYN_generator_27_0000_0015 =
      rs_R013_ueqv_R013NNYN_partial_27_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013NNYN_coefficient_27_0013 : Poly :=
[
  term ((696 : Rat) / 103) [(14, 1), (16, 1)]
]

/-- Partial product 13 for generator 27. -/
def rs_R013_ueqv_R013NNYN_partial_27_0013 : Poly :=
[
  term ((-1392 : Rat) / 103) [(0, 1), (12, 1), (14, 1), (16, 1)],
  term ((696 : Rat) / 103) [(0, 2), (14, 1), (16, 1)],
  term ((-1392 : Rat) / 103) [(1, 1), (13, 1), (14, 1), (16, 1)],
  term ((696 : Rat) / 103) [(1, 2), (14, 1), (16, 1)],
  term ((1392 : Rat) / 103) [(12, 1), (14, 2), (16, 1)],
  term ((1392 : Rat) / 103) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-696 : Rat) / 103) [(14, 1), (15, 2), (16, 1)],
  term ((-696 : Rat) / 103) [(14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 27. -/
theorem rs_R013_ueqv_R013NNYN_partial_27_0013_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_27_0013
        rs_R013_ueqv_R013NNYN_generator_27_0000_0015 =
      rs_R013_ueqv_R013NNYN_partial_27_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013NNYN_coefficient_27_0014 : Poly :=
[
  term ((-144 : Rat) / 103) [(15, 2), (16, 1)]
]

/-- Partial product 14 for generator 27. -/
def rs_R013_ueqv_R013NNYN_partial_27_0014 : Poly :=
[
  term ((288 : Rat) / 103) [(0, 1), (12, 1), (15, 2), (16, 1)],
  term ((-144 : Rat) / 103) [(0, 2), (15, 2), (16, 1)],
  term ((288 : Rat) / 103) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((-144 : Rat) / 103) [(1, 2), (15, 2), (16, 1)],
  term ((-288 : Rat) / 103) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-288 : Rat) / 103) [(13, 1), (15, 3), (16, 1)],
  term ((144 : Rat) / 103) [(14, 2), (15, 2), (16, 1)],
  term ((144 : Rat) / 103) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 27. -/
theorem rs_R013_ueqv_R013NNYN_partial_27_0014_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_27_0014
        rs_R013_ueqv_R013NNYN_generator_27_0000_0015 =
      rs_R013_ueqv_R013NNYN_partial_27_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013NNYN_coefficient_27_0015 : Poly :=
[
  term ((-41 : Rat) / 103) [(16, 1)]
]

/-- Partial product 15 for generator 27. -/
def rs_R013_ueqv_R013NNYN_partial_27_0015 : Poly :=
[
  term ((82 : Rat) / 103) [(0, 1), (12, 1), (16, 1)],
  term ((-41 : Rat) / 103) [(0, 2), (16, 1)],
  term ((82 : Rat) / 103) [(1, 1), (13, 1), (16, 1)],
  term ((-41 : Rat) / 103) [(1, 2), (16, 1)],
  term ((-82 : Rat) / 103) [(12, 1), (14, 1), (16, 1)],
  term ((-82 : Rat) / 103) [(13, 1), (15, 1), (16, 1)],
  term ((41 : Rat) / 103) [(14, 2), (16, 1)],
  term ((41 : Rat) / 103) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 27. -/
theorem rs_R013_ueqv_R013NNYN_partial_27_0015_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_27_0015
        rs_R013_ueqv_R013NNYN_generator_27_0000_0015 =
      rs_R013_ueqv_R013NNYN_partial_27_0015 := by
  native_decide

/-- Partial products in this block. -/
def rs_R013_ueqv_R013NNYN_partials_27_0000_0015 : List Poly :=
[
  rs_R013_ueqv_R013NNYN_partial_27_0000,
  rs_R013_ueqv_R013NNYN_partial_27_0001,
  rs_R013_ueqv_R013NNYN_partial_27_0002,
  rs_R013_ueqv_R013NNYN_partial_27_0003,
  rs_R013_ueqv_R013NNYN_partial_27_0004,
  rs_R013_ueqv_R013NNYN_partial_27_0005,
  rs_R013_ueqv_R013NNYN_partial_27_0006,
  rs_R013_ueqv_R013NNYN_partial_27_0007,
  rs_R013_ueqv_R013NNYN_partial_27_0008,
  rs_R013_ueqv_R013NNYN_partial_27_0009,
  rs_R013_ueqv_R013NNYN_partial_27_0010,
  rs_R013_ueqv_R013NNYN_partial_27_0011,
  rs_R013_ueqv_R013NNYN_partial_27_0012,
  rs_R013_ueqv_R013NNYN_partial_27_0013,
  rs_R013_ueqv_R013NNYN_partial_27_0014,
  rs_R013_ueqv_R013NNYN_partial_27_0015
]

/-- Sum of partial products in this block. -/
def rs_R013_ueqv_R013NNYN_block_27_0000_0015 : Poly :=
[
  term ((-6912 : Rat) / 103) [(0, 1), (1, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1152 : Rat) / 103) [(0, 1), (1, 1), (12, 1), (13, 1), (16, 1)],
  term ((10944 : Rat) / 103) [(0, 1), (1, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((576 : Rat) / 103) [(0, 1), (1, 1), (12, 2), (13, 1), (16, 1)],
  term ((1248 : Rat) / 103) [(0, 1), (1, 1), (13, 1), (14, 1), (16, 1)],
  term ((-576 : Rat) / 103) [(0, 1), (1, 1), (13, 1), (16, 1)],
  term ((-576 : Rat) / 103) [(0, 1), (1, 1), (13, 3), (16, 1)],
  term ((288 : Rat) / 103) [(0, 1), (1, 2), (13, 2), (16, 1)],
  term ((-624 : Rat) / 103) [(0, 1), (1, 2), (14, 1), (16, 1)],
  term ((288 : Rat) / 103) [(0, 1), (1, 2), (16, 1)],
  term ((-576 : Rat) / 103) [(0, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((1152 : Rat) / 103) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1728 : Rat) / 103) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1152 : Rat) / 103) [(0, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((2304 : Rat) / 103) [(0, 1), (12, 1), (13, 2), (16, 1)],
  term ((-816 : Rat) / 103) [(0, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1248 : Rat) / 103) [(0, 1), (12, 1), (14, 2), (16, 1)],
  term ((288 : Rat) / 103) [(0, 1), (12, 1), (15, 2), (16, 1)],
  term ((82 : Rat) / 103) [(0, 1), (12, 1), (16, 1)],
  term ((1728 : Rat) / 103) [(0, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1248 : Rat) / 103) [(0, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((576 : Rat) / 103) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term ((-288 : Rat) / 103) [(0, 1), (13, 2), (14, 2), (16, 1)],
  term ((-288 : Rat) / 103) [(0, 1), (13, 2), (15, 2), (16, 1)],
  term ((576 : Rat) / 103) [(0, 1), (13, 3), (15, 1), (16, 1)],
  term ((624 : Rat) / 103) [(0, 1), (14, 1), (15, 2), (16, 1)],
  term ((-288 : Rat) / 103) [(0, 1), (14, 2), (16, 1)],
  term ((624 : Rat) / 103) [(0, 1), (14, 3), (16, 1)],
  term ((-288 : Rat) / 103) [(0, 1), (15, 2), (16, 1)],
  term ((-288 : Rat) / 103) [(0, 2), (1, 1), (12, 1), (13, 1), (16, 1)],
  term ((3456 : Rat) / 103) [(0, 2), (1, 1), (13, 1), (14, 1), (16, 1)],
  term ((576 : Rat) / 103) [(0, 2), (1, 1), (13, 1), (16, 1)],
  term ((-5472 : Rat) / 103) [(0, 2), (1, 1), (14, 1), (15, 1), (16, 1)],
  term ((288 : Rat) / 103) [(0, 2), (7, 1), (13, 1), (16, 1)],
  term ((-864 : Rat) / 103) [(0, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-576 : Rat) / 103) [(0, 2), (12, 1), (13, 2), (16, 1)],
  term ((1248 : Rat) / 103) [(0, 2), (12, 1), (14, 1), (16, 1)],
  term ((-576 : Rat) / 103) [(0, 2), (12, 1), (16, 1)],
  term ((-576 : Rat) / 103) [(0, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((864 : Rat) / 103) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((864 : Rat) / 103) [(0, 2), (13, 2), (14, 1), (16, 1)],
  term ((-1152 : Rat) / 103) [(0, 2), (13, 2), (16, 1)],
  term ((696 : Rat) / 103) [(0, 2), (14, 1), (16, 1)],
  term ((-144 : Rat) / 103) [(0, 2), (15, 2), (16, 1)],
  term ((-41 : Rat) / 103) [(0, 2), (16, 1)],
  term ((288 : Rat) / 103) [(0, 3), (13, 2), (16, 1)],
  term ((-624 : Rat) / 103) [(0, 3), (14, 1), (16, 1)],
  term ((288 : Rat) / 103) [(0, 3), (16, 1)],
  term ((-576 : Rat) / 103) [(1, 1), (7, 1), (13, 2), (16, 1)],
  term ((1152 : Rat) / 103) [(1, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((7200 : Rat) / 103) [(1, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((288 : Rat) / 103) [(1, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((1152 : Rat) / 103) [(1, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-10944 : Rat) / 103) [(1, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-576 : Rat) / 103) [(1, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-14400 : Rat) / 103) [(1, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1392 : Rat) / 103) [(1, 1), (13, 1), (14, 1), (16, 1)],
  term ((-576 : Rat) / 103) [(1, 1), (13, 1), (14, 2), (16, 1)],
  term ((-3456 : Rat) / 103) [(1, 1), (13, 1), (14, 3), (16, 1)],
  term ((-288 : Rat) / 103) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((82 : Rat) / 103) [(1, 1), (13, 1), (16, 1)],
  term ((8064 : Rat) / 103) [(1, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-576 : Rat) / 103) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1728 : Rat) / 103) [(1, 1), (13, 3), (14, 1), (16, 1)],
  term ((2304 : Rat) / 103) [(1, 1), (13, 3), (16, 1)],
  term ((5472 : Rat) / 103) [(1, 1), (14, 1), (15, 3), (16, 1)],
  term ((5472 : Rat) / 103) [(1, 1), (14, 3), (15, 1), (16, 1)],
  term ((288 : Rat) / 103) [(1, 2), (7, 1), (13, 1), (16, 1)],
  term ((-864 : Rat) / 103) [(1, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((576 : Rat) / 103) [(1, 2), (12, 1), (13, 2), (16, 1)],
  term ((10368 : Rat) / 103) [(1, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((864 : Rat) / 103) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-6048 : Rat) / 103) [(1, 2), (13, 2), (14, 1), (16, 1)],
  term ((-2304 : Rat) / 103) [(1, 2), (13, 2), (16, 1)],
  term ((696 : Rat) / 103) [(1, 2), (14, 1), (16, 1)],
  term ((-144 : Rat) / 103) [(1, 2), (15, 2), (16, 1)],
  term ((-41 : Rat) / 103) [(1, 2), (16, 1)],
  term ((-288 : Rat) / 103) [(1, 3), (12, 1), (13, 1), (16, 1)],
  term ((3456 : Rat) / 103) [(1, 3), (13, 1), (14, 1), (16, 1)],
  term ((576 : Rat) / 103) [(1, 3), (13, 1), (16, 1)],
  term ((-5472 : Rat) / 103) [(1, 3), (14, 1), (15, 1), (16, 1)],
  term ((576 : Rat) / 103) [(7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-288 : Rat) / 103) [(7, 1), (13, 1), (14, 2), (16, 1)],
  term ((-288 : Rat) / 103) [(7, 1), (13, 1), (15, 2), (16, 1)],
  term ((576 : Rat) / 103) [(7, 1), (13, 2), (15, 1), (16, 1)],
  term ((1728 : Rat) / 103) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-288 : Rat) / 103) [(12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((864 : Rat) / 103) [(12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-2304 : Rat) / 103) [(12, 1), (13, 2), (14, 1), (16, 1)],
  term ((1728 : Rat) / 103) [(12, 1), (13, 2), (14, 2), (16, 1)],
  term ((-1728 : Rat) / 103) [(12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-288 : Rat) / 103) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-82 : Rat) / 103) [(12, 1), (14, 1), (16, 1)],
  term ((1392 : Rat) / 103) [(12, 1), (14, 2), (16, 1)],
  term ((-1728 : Rat) / 103) [(12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1392 : Rat) / 103) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((576 : Rat) / 103) [(13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-864 : Rat) / 103) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((576 : Rat) / 103) [(13, 1), (14, 3), (15, 1), (16, 1)],
  term ((-82 : Rat) / 103) [(13, 1), (15, 1), (16, 1)],
  term ((-1152 : Rat) / 103) [(13, 1), (15, 3), (16, 1)],
  term ((-2016 : Rat) / 103) [(13, 2), (14, 1), (15, 2), (16, 1)],
  term ((1152 : Rat) / 103) [(13, 2), (14, 2), (16, 1)],
  term ((-864 : Rat) / 103) [(13, 2), (14, 3), (16, 1)],
  term ((2880 : Rat) / 103) [(13, 2), (15, 2), (16, 1)],
  term ((1728 : Rat) / 103) [(13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-2304 : Rat) / 103) [(13, 3), (15, 1), (16, 1)],
  term ((-696 : Rat) / 103) [(14, 1), (15, 2), (16, 1)],
  term ((144 : Rat) / 103) [(14, 2), (15, 2), (16, 1)],
  term ((41 : Rat) / 103) [(14, 2), (16, 1)],
  term ((-696 : Rat) / 103) [(14, 3), (16, 1)],
  term ((41 : Rat) / 103) [(15, 2), (16, 1)],
  term ((144 : Rat) / 103) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 27, terms 0 through 15. -/
theorem rs_R013_ueqv_R013NNYN_block_27_0000_0015_valid :
    checkProductSumEq rs_R013_ueqv_R013NNYN_partials_27_0000_0015
      rs_R013_ueqv_R013NNYN_block_27_0000_0015 = true := by
  native_decide

end R013UeqvR013NNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
