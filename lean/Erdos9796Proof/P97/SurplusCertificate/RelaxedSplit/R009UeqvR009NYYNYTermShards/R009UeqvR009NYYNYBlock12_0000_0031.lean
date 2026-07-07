/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NYYNY, term block 12:0-31

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NYYNYTermShards

/-- Generator polynomial 12 for relaxed split surplus certificate `R009:u=v:R009NYYNY`. -/
def rs_R009_ueqv_R009NYYNY_generator_12_0000_0031 : Poly :=
[
  term (-2 : Rat) [(0, 1), (2, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (3, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(2, 1), (14, 1)],
  term (2 : Rat) [(3, 1), (15, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYNY_coefficient_12_0000 : Poly :=
[
  term ((1 : Rat) / 6) []
]

/-- Partial product 0 for generator 12. -/
def rs_R009_ueqv_R009NYYNY_partial_12_0000 : Poly :=
[
  term ((-1 : Rat) / 3) [(0, 1), (2, 1)],
  term ((1 : Rat) / 6) [(0, 2)],
  term ((-1 : Rat) / 3) [(1, 1), (3, 1)],
  term ((1 : Rat) / 6) [(1, 2)],
  term ((1 : Rat) / 3) [(2, 1), (14, 1)],
  term ((1 : Rat) / 3) [(3, 1), (15, 1)],
  term ((-1 : Rat) / 6) [(14, 2)],
  term ((-1 : Rat) / 6) [(15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 12. -/
theorem rs_R009_ueqv_R009NYYNY_partial_12_0000_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_12_0000
        rs_R009_ueqv_R009NYYNY_generator_12_0000_0031 =
      rs_R009_ueqv_R009NYYNY_partial_12_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYNY_coefficient_12_0001 : Poly :=
[
  term (4 : Rat) [(0, 1)]
]

/-- Partial product 1 for generator 12. -/
def rs_R009_ueqv_R009NYYNY_partial_12_0001 : Poly :=
[
  term (-8 : Rat) [(0, 1), (1, 1), (3, 1)],
  term (4 : Rat) [(0, 1), (1, 2)],
  term (8 : Rat) [(0, 1), (2, 1), (14, 1)],
  term (8 : Rat) [(0, 1), (3, 1), (15, 1)],
  term (-4 : Rat) [(0, 1), (14, 2)],
  term (-4 : Rat) [(0, 1), (15, 2)],
  term (-8 : Rat) [(0, 2), (2, 1)],
  term (4 : Rat) [(0, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 12. -/
theorem rs_R009_ueqv_R009NYYNY_partial_12_0001_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_12_0001
        rs_R009_ueqv_R009NYYNY_generator_12_0000_0031 =
      rs_R009_ueqv_R009NYYNY_partial_12_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYNY_coefficient_12_0002 : Poly :=
[
  term (8 : Rat) [(0, 1), (1, 1), (7, 1)]
]

/-- Partial product 2 for generator 12. -/
def rs_R009_ueqv_R009NYYNY_partial_12_0002 : Poly :=
[
  term (16 : Rat) [(0, 1), (1, 1), (2, 1), (7, 1), (14, 1)],
  term (16 : Rat) [(0, 1), (1, 1), (3, 1), (7, 1), (15, 1)],
  term (-8 : Rat) [(0, 1), (1, 1), (7, 1), (14, 2)],
  term (-8 : Rat) [(0, 1), (1, 1), (7, 1), (15, 2)],
  term (-16 : Rat) [(0, 1), (1, 2), (3, 1), (7, 1)],
  term (8 : Rat) [(0, 1), (1, 3), (7, 1)],
  term (-16 : Rat) [(0, 2), (1, 1), (2, 1), (7, 1)],
  term (8 : Rat) [(0, 3), (1, 1), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 12. -/
theorem rs_R009_ueqv_R009NYYNY_partial_12_0002_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_12_0002
        rs_R009_ueqv_R009NYYNY_generator_12_0000_0031 =
      rs_R009_ueqv_R009NYYNY_partial_12_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYNY_coefficient_12_0003 : Poly :=
[
  term (-16 : Rat) [(0, 1), (1, 1), (9, 1)]
]

/-- Partial product 3 for generator 12. -/
def rs_R009_ueqv_R009NYYNY_partial_12_0003 : Poly :=
[
  term (-32 : Rat) [(0, 1), (1, 1), (2, 1), (9, 1), (14, 1)],
  term (-32 : Rat) [(0, 1), (1, 1), (3, 1), (9, 1), (15, 1)],
  term (16 : Rat) [(0, 1), (1, 1), (9, 1), (14, 2)],
  term (16 : Rat) [(0, 1), (1, 1), (9, 1), (15, 2)],
  term (32 : Rat) [(0, 1), (1, 2), (3, 1), (9, 1)],
  term (-16 : Rat) [(0, 1), (1, 3), (9, 1)],
  term (32 : Rat) [(0, 2), (1, 1), (2, 1), (9, 1)],
  term (-16 : Rat) [(0, 3), (1, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 12. -/
theorem rs_R009_ueqv_R009NYYNY_partial_12_0003_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_12_0003
        rs_R009_ueqv_R009NYYNY_generator_12_0000_0031 =
      rs_R009_ueqv_R009NYYNY_partial_12_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYNY_coefficient_12_0004 : Poly :=
[
  term (-6 : Rat) [(0, 1), (7, 1), (15, 1)]
]

/-- Partial product 4 for generator 12. -/
def rs_R009_ueqv_R009NYYNY_partial_12_0004 : Poly :=
[
  term (12 : Rat) [(0, 1), (1, 1), (3, 1), (7, 1), (15, 1)],
  term (-6 : Rat) [(0, 1), (1, 2), (7, 1), (15, 1)],
  term (-12 : Rat) [(0, 1), (2, 1), (7, 1), (14, 1), (15, 1)],
  term (-12 : Rat) [(0, 1), (3, 1), (7, 1), (15, 2)],
  term (6 : Rat) [(0, 1), (7, 1), (14, 2), (15, 1)],
  term (6 : Rat) [(0, 1), (7, 1), (15, 3)],
  term (12 : Rat) [(0, 2), (2, 1), (7, 1), (15, 1)],
  term (-6 : Rat) [(0, 3), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 12. -/
theorem rs_R009_ueqv_R009NYYNY_partial_12_0004_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_12_0004
        rs_R009_ueqv_R009NYYNY_generator_12_0000_0031 =
      rs_R009_ueqv_R009NYYNY_partial_12_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYNY_coefficient_12_0005 : Poly :=
[
  term (12 : Rat) [(0, 1), (9, 1), (15, 1)]
]

/-- Partial product 5 for generator 12. -/
def rs_R009_ueqv_R009NYYNY_partial_12_0005 : Poly :=
[
  term (-24 : Rat) [(0, 1), (1, 1), (3, 1), (9, 1), (15, 1)],
  term (12 : Rat) [(0, 1), (1, 2), (9, 1), (15, 1)],
  term (24 : Rat) [(0, 1), (2, 1), (9, 1), (14, 1), (15, 1)],
  term (24 : Rat) [(0, 1), (3, 1), (9, 1), (15, 2)],
  term (-12 : Rat) [(0, 1), (9, 1), (14, 2), (15, 1)],
  term (-12 : Rat) [(0, 1), (9, 1), (15, 3)],
  term (-24 : Rat) [(0, 2), (2, 1), (9, 1), (15, 1)],
  term (12 : Rat) [(0, 3), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 12. -/
theorem rs_R009_ueqv_R009NYYNY_partial_12_0005_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_12_0005
        rs_R009_ueqv_R009NYYNY_generator_12_0000_0031 =
      rs_R009_ueqv_R009NYYNY_partial_12_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYNY_coefficient_12_0006 : Poly :=
[
  term (-4 : Rat) [(1, 1), (7, 1)]
]

/-- Partial product 6 for generator 12. -/
def rs_R009_ueqv_R009NYYNY_partial_12_0006 : Poly :=
[
  term (8 : Rat) [(0, 1), (1, 1), (2, 1), (7, 1)],
  term (-4 : Rat) [(0, 2), (1, 1), (7, 1)],
  term (-8 : Rat) [(1, 1), (2, 1), (7, 1), (14, 1)],
  term (-8 : Rat) [(1, 1), (3, 1), (7, 1), (15, 1)],
  term (4 : Rat) [(1, 1), (7, 1), (14, 2)],
  term (4 : Rat) [(1, 1), (7, 1), (15, 2)],
  term (8 : Rat) [(1, 2), (3, 1), (7, 1)],
  term (-4 : Rat) [(1, 3), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 12. -/
theorem rs_R009_ueqv_R009NYYNY_partial_12_0006_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_12_0006
        rs_R009_ueqv_R009NYYNY_generator_12_0000_0031 =
      rs_R009_ueqv_R009NYYNY_partial_12_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYNY_coefficient_12_0007 : Poly :=
[
  term (-8 : Rat) [(1, 1), (9, 1)]
]

/-- Partial product 7 for generator 12. -/
def rs_R009_ueqv_R009NYYNY_partial_12_0007 : Poly :=
[
  term (16 : Rat) [(0, 1), (1, 1), (2, 1), (9, 1)],
  term (-8 : Rat) [(0, 2), (1, 1), (9, 1)],
  term (-16 : Rat) [(1, 1), (2, 1), (9, 1), (14, 1)],
  term (-16 : Rat) [(1, 1), (3, 1), (9, 1), (15, 1)],
  term (8 : Rat) [(1, 1), (9, 1), (14, 2)],
  term (8 : Rat) [(1, 1), (9, 1), (15, 2)],
  term (16 : Rat) [(1, 2), (3, 1), (9, 1)],
  term (-8 : Rat) [(1, 3), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 12. -/
theorem rs_R009_ueqv_R009NYYNY_partial_12_0007_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_12_0007
        rs_R009_ueqv_R009NYYNY_generator_12_0000_0031 =
      rs_R009_ueqv_R009NYYNY_partial_12_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYNY_coefficient_12_0008 : Poly :=
[
  term (4 : Rat) [(1, 1), (13, 1)]
]

/-- Partial product 8 for generator 12. -/
def rs_R009_ueqv_R009NYYNY_partial_12_0008 : Poly :=
[
  term (-8 : Rat) [(0, 1), (1, 1), (2, 1), (13, 1)],
  term (4 : Rat) [(0, 2), (1, 1), (13, 1)],
  term (8 : Rat) [(1, 1), (2, 1), (13, 1), (14, 1)],
  term (8 : Rat) [(1, 1), (3, 1), (13, 1), (15, 1)],
  term (-4 : Rat) [(1, 1), (13, 1), (14, 2)],
  term (-4 : Rat) [(1, 1), (13, 1), (15, 2)],
  term (-8 : Rat) [(1, 2), (3, 1), (13, 1)],
  term (4 : Rat) [(1, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 12. -/
theorem rs_R009_ueqv_R009NYYNY_partial_12_0008_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_12_0008
        rs_R009_ueqv_R009NYYNY_generator_12_0000_0031 =
      rs_R009_ueqv_R009NYYNY_partial_12_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYNY_coefficient_12_0009 : Poly :=
[
  term (-3 : Rat) [(1, 1), (15, 1)]
]

/-- Partial product 9 for generator 12. -/
def rs_R009_ueqv_R009NYYNY_partial_12_0009 : Poly :=
[
  term (6 : Rat) [(0, 1), (1, 1), (2, 1), (15, 1)],
  term (-3 : Rat) [(0, 2), (1, 1), (15, 1)],
  term (-6 : Rat) [(1, 1), (2, 1), (14, 1), (15, 1)],
  term (-6 : Rat) [(1, 1), (3, 1), (15, 2)],
  term (3 : Rat) [(1, 1), (14, 2), (15, 1)],
  term (3 : Rat) [(1, 1), (15, 3)],
  term (6 : Rat) [(1, 2), (3, 1), (15, 1)],
  term (-3 : Rat) [(1, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 12. -/
theorem rs_R009_ueqv_R009NYYNY_partial_12_0009_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_12_0009
        rs_R009_ueqv_R009NYYNY_generator_12_0000_0031 =
      rs_R009_ueqv_R009NYYNY_partial_12_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYNY_coefficient_12_0010 : Poly :=
[
  term (4 : Rat) [(1, 2)]
]

/-- Partial product 10 for generator 12. -/
def rs_R009_ueqv_R009NYYNY_partial_12_0010 : Poly :=
[
  term (-8 : Rat) [(0, 1), (1, 2), (2, 1)],
  term (4 : Rat) [(0, 2), (1, 2)],
  term (8 : Rat) [(1, 2), (2, 1), (14, 1)],
  term (8 : Rat) [(1, 2), (3, 1), (15, 1)],
  term (-4 : Rat) [(1, 2), (14, 2)],
  term (-4 : Rat) [(1, 2), (15, 2)],
  term (-8 : Rat) [(1, 3), (3, 1)],
  term (4 : Rat) [(1, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 12. -/
theorem rs_R009_ueqv_R009NYYNY_partial_12_0010_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_12_0010
        rs_R009_ueqv_R009NYYNY_generator_12_0000_0031 =
      rs_R009_ueqv_R009NYYNY_partial_12_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYNY_coefficient_12_0011 : Poly :=
[
  term ((29 : Rat) / 6) [(2, 1)]
]

/-- Partial product 11 for generator 12. -/
def rs_R009_ueqv_R009NYYNY_partial_12_0011 : Poly :=
[
  term ((-29 : Rat) / 3) [(0, 1), (2, 2)],
  term ((29 : Rat) / 6) [(0, 2), (2, 1)],
  term ((-29 : Rat) / 3) [(1, 1), (2, 1), (3, 1)],
  term ((29 : Rat) / 6) [(1, 2), (2, 1)],
  term ((29 : Rat) / 3) [(2, 1), (3, 1), (15, 1)],
  term ((-29 : Rat) / 6) [(2, 1), (14, 2)],
  term ((-29 : Rat) / 6) [(2, 1), (15, 2)],
  term ((29 : Rat) / 3) [(2, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 12. -/
theorem rs_R009_ueqv_R009NYYNY_partial_12_0011_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_12_0011
        rs_R009_ueqv_R009NYYNY_generator_12_0000_0031 =
      rs_R009_ueqv_R009NYYNY_partial_12_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYNY_coefficient_12_0012 : Poly :=
[
  term ((-4 : Rat) / 3) [(2, 1), (14, 1)]
]

/-- Partial product 12 for generator 12. -/
def rs_R009_ueqv_R009NYYNY_partial_12_0012 : Poly :=
[
  term ((8 : Rat) / 3) [(0, 1), (2, 2), (14, 1)],
  term ((-4 : Rat) / 3) [(0, 2), (2, 1), (14, 1)],
  term ((8 : Rat) / 3) [(1, 1), (2, 1), (3, 1), (14, 1)],
  term ((-4 : Rat) / 3) [(1, 2), (2, 1), (14, 1)],
  term ((-8 : Rat) / 3) [(2, 1), (3, 1), (14, 1), (15, 1)],
  term ((4 : Rat) / 3) [(2, 1), (14, 1), (15, 2)],
  term ((4 : Rat) / 3) [(2, 1), (14, 3)],
  term ((-8 : Rat) / 3) [(2, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 12. -/
theorem rs_R009_ueqv_R009NYYNY_partial_12_0012_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_12_0012
        rs_R009_ueqv_R009NYYNY_generator_12_0000_0031 =
      rs_R009_ueqv_R009NYYNY_partial_12_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYNY_coefficient_12_0013 : Poly :=
[
  term (1 : Rat) [(3, 1), (7, 1)]
]

/-- Partial product 13 for generator 12. -/
def rs_R009_ueqv_R009NYYNY_partial_12_0013 : Poly :=
[
  term (-2 : Rat) [(0, 1), (2, 1), (3, 1), (7, 1)],
  term (1 : Rat) [(0, 2), (3, 1), (7, 1)],
  term (-2 : Rat) [(1, 1), (3, 2), (7, 1)],
  term (1 : Rat) [(1, 2), (3, 1), (7, 1)],
  term (2 : Rat) [(2, 1), (3, 1), (7, 1), (14, 1)],
  term (-1 : Rat) [(3, 1), (7, 1), (14, 2)],
  term (-1 : Rat) [(3, 1), (7, 1), (15, 2)],
  term (2 : Rat) [(3, 2), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 12. -/
theorem rs_R009_ueqv_R009NYYNY_partial_12_0013_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_12_0013
        rs_R009_ueqv_R009NYYNY_generator_12_0000_0031 =
      rs_R009_ueqv_R009NYYNY_partial_12_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYNY_coefficient_12_0014 : Poly :=
[
  term (-2 : Rat) [(3, 1), (7, 1), (14, 1)]
]

/-- Partial product 14 for generator 12. -/
def rs_R009_ueqv_R009NYYNY_partial_12_0014 : Poly :=
[
  term (4 : Rat) [(0, 1), (2, 1), (3, 1), (7, 1), (14, 1)],
  term (-2 : Rat) [(0, 2), (3, 1), (7, 1), (14, 1)],
  term (4 : Rat) [(1, 1), (3, 2), (7, 1), (14, 1)],
  term (-2 : Rat) [(1, 2), (3, 1), (7, 1), (14, 1)],
  term (-4 : Rat) [(2, 1), (3, 1), (7, 1), (14, 2)],
  term (2 : Rat) [(3, 1), (7, 1), (14, 1), (15, 2)],
  term (2 : Rat) [(3, 1), (7, 1), (14, 3)],
  term (-4 : Rat) [(3, 2), (7, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 12. -/
theorem rs_R009_ueqv_R009NYYNY_partial_12_0014_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_12_0014
        rs_R009_ueqv_R009NYYNY_generator_12_0000_0031 =
      rs_R009_ueqv_R009NYYNY_partial_12_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYNY_coefficient_12_0015 : Poly :=
[
  term ((2 : Rat) / 3) [(3, 1), (9, 1)]
]

/-- Partial product 15 for generator 12. -/
def rs_R009_ueqv_R009NYYNY_partial_12_0015 : Poly :=
[
  term ((-4 : Rat) / 3) [(0, 1), (2, 1), (3, 1), (9, 1)],
  term ((2 : Rat) / 3) [(0, 2), (3, 1), (9, 1)],
  term ((-4 : Rat) / 3) [(1, 1), (3, 2), (9, 1)],
  term ((2 : Rat) / 3) [(1, 2), (3, 1), (9, 1)],
  term ((4 : Rat) / 3) [(2, 1), (3, 1), (9, 1), (14, 1)],
  term ((-2 : Rat) / 3) [(3, 1), (9, 1), (14, 2)],
  term ((-2 : Rat) / 3) [(3, 1), (9, 1), (15, 2)],
  term ((4 : Rat) / 3) [(3, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 12. -/
theorem rs_R009_ueqv_R009NYYNY_partial_12_0015_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_12_0015
        rs_R009_ueqv_R009NYYNY_generator_12_0000_0031 =
      rs_R009_ueqv_R009NYYNY_partial_12_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYNY_coefficient_12_0016 : Poly :=
[
  term (4 : Rat) [(3, 1), (9, 1), (14, 1)]
]

/-- Partial product 16 for generator 12. -/
def rs_R009_ueqv_R009NYYNY_partial_12_0016 : Poly :=
[
  term (-8 : Rat) [(0, 1), (2, 1), (3, 1), (9, 1), (14, 1)],
  term (4 : Rat) [(0, 2), (3, 1), (9, 1), (14, 1)],
  term (-8 : Rat) [(1, 1), (3, 2), (9, 1), (14, 1)],
  term (4 : Rat) [(1, 2), (3, 1), (9, 1), (14, 1)],
  term (8 : Rat) [(2, 1), (3, 1), (9, 1), (14, 2)],
  term (-4 : Rat) [(3, 1), (9, 1), (14, 1), (15, 2)],
  term (-4 : Rat) [(3, 1), (9, 1), (14, 3)],
  term (8 : Rat) [(3, 2), (9, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 12. -/
theorem rs_R009_ueqv_R009NYYNY_partial_12_0016_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_12_0016
        rs_R009_ueqv_R009NYYNY_generator_12_0000_0031 =
      rs_R009_ueqv_R009NYYNY_partial_12_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYNY_coefficient_12_0017 : Poly :=
[
  term ((-8 : Rat) / 3) [(3, 1), (13, 1)]
]

/-- Partial product 17 for generator 12. -/
def rs_R009_ueqv_R009NYYNY_partial_12_0017 : Poly :=
[
  term ((16 : Rat) / 3) [(0, 1), (2, 1), (3, 1), (13, 1)],
  term ((-8 : Rat) / 3) [(0, 2), (3, 1), (13, 1)],
  term ((16 : Rat) / 3) [(1, 1), (3, 2), (13, 1)],
  term ((-8 : Rat) / 3) [(1, 2), (3, 1), (13, 1)],
  term ((-16 : Rat) / 3) [(2, 1), (3, 1), (13, 1), (14, 1)],
  term ((8 : Rat) / 3) [(3, 1), (13, 1), (14, 2)],
  term ((8 : Rat) / 3) [(3, 1), (13, 1), (15, 2)],
  term ((-16 : Rat) / 3) [(3, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 12. -/
theorem rs_R009_ueqv_R009NYYNY_partial_12_0017_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_12_0017
        rs_R009_ueqv_R009NYYNY_generator_12_0000_0031 =
      rs_R009_ueqv_R009NYYNY_partial_12_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYNY_coefficient_12_0018 : Poly :=
[
  term ((7 : Rat) / 3) [(3, 1), (15, 1)]
]

/-- Partial product 18 for generator 12. -/
def rs_R009_ueqv_R009NYYNY_partial_12_0018 : Poly :=
[
  term ((-14 : Rat) / 3) [(0, 1), (2, 1), (3, 1), (15, 1)],
  term ((7 : Rat) / 3) [(0, 2), (3, 1), (15, 1)],
  term ((-14 : Rat) / 3) [(1, 1), (3, 2), (15, 1)],
  term ((7 : Rat) / 3) [(1, 2), (3, 1), (15, 1)],
  term ((14 : Rat) / 3) [(2, 1), (3, 1), (14, 1), (15, 1)],
  term ((-7 : Rat) / 3) [(3, 1), (14, 2), (15, 1)],
  term ((-7 : Rat) / 3) [(3, 1), (15, 3)],
  term ((14 : Rat) / 3) [(3, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 12. -/
theorem rs_R009_ueqv_R009NYYNY_partial_12_0018_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_12_0018
        rs_R009_ueqv_R009NYYNY_generator_12_0000_0031 =
      rs_R009_ueqv_R009NYYNY_partial_12_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYNY_coefficient_12_0019 : Poly :=
[
  term ((4 : Rat) / 3) [(5, 1), (9, 1)]
]

/-- Partial product 19 for generator 12. -/
def rs_R009_ueqv_R009NYYNY_partial_12_0019 : Poly :=
[
  term ((-8 : Rat) / 3) [(0, 1), (2, 1), (5, 1), (9, 1)],
  term ((4 : Rat) / 3) [(0, 2), (5, 1), (9, 1)],
  term ((-8 : Rat) / 3) [(1, 1), (3, 1), (5, 1), (9, 1)],
  term ((4 : Rat) / 3) [(1, 2), (5, 1), (9, 1)],
  term ((8 : Rat) / 3) [(2, 1), (5, 1), (9, 1), (14, 1)],
  term ((8 : Rat) / 3) [(3, 1), (5, 1), (9, 1), (15, 1)],
  term ((-4 : Rat) / 3) [(5, 1), (9, 1), (14, 2)],
  term ((-4 : Rat) / 3) [(5, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 12. -/
theorem rs_R009_ueqv_R009NYYNY_partial_12_0019_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_12_0019
        rs_R009_ueqv_R009NYYNY_generator_12_0000_0031 =
      rs_R009_ueqv_R009NYYNY_partial_12_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYNY_coefficient_12_0020 : Poly :=
[
  term ((-8 : Rat) / 3) [(5, 1), (15, 1)]
]

/-- Partial product 20 for generator 12. -/
def rs_R009_ueqv_R009NYYNY_partial_12_0020 : Poly :=
[
  term ((16 : Rat) / 3) [(0, 1), (2, 1), (5, 1), (15, 1)],
  term ((-8 : Rat) / 3) [(0, 2), (5, 1), (15, 1)],
  term ((16 : Rat) / 3) [(1, 1), (3, 1), (5, 1), (15, 1)],
  term ((-8 : Rat) / 3) [(1, 2), (5, 1), (15, 1)],
  term ((-16 : Rat) / 3) [(2, 1), (5, 1), (14, 1), (15, 1)],
  term ((-16 : Rat) / 3) [(3, 1), (5, 1), (15, 2)],
  term ((8 : Rat) / 3) [(5, 1), (14, 2), (15, 1)],
  term ((8 : Rat) / 3) [(5, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 12. -/
theorem rs_R009_ueqv_R009NYYNY_partial_12_0020_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_12_0020
        rs_R009_ueqv_R009NYYNY_generator_12_0000_0031 =
      rs_R009_ueqv_R009NYYNY_partial_12_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYNY_coefficient_12_0021 : Poly :=
[
  term (8 : Rat) [(7, 1), (14, 1), (15, 1)]
]

/-- Partial product 21 for generator 12. -/
def rs_R009_ueqv_R009NYYNY_partial_12_0021 : Poly :=
[
  term (-16 : Rat) [(0, 1), (2, 1), (7, 1), (14, 1), (15, 1)],
  term (8 : Rat) [(0, 2), (7, 1), (14, 1), (15, 1)],
  term (-16 : Rat) [(1, 1), (3, 1), (7, 1), (14, 1), (15, 1)],
  term (8 : Rat) [(1, 2), (7, 1), (14, 1), (15, 1)],
  term (16 : Rat) [(2, 1), (7, 1), (14, 2), (15, 1)],
  term (16 : Rat) [(3, 1), (7, 1), (14, 1), (15, 2)],
  term (-8 : Rat) [(7, 1), (14, 1), (15, 3)],
  term (-8 : Rat) [(7, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 12. -/
theorem rs_R009_ueqv_R009NYYNY_partial_12_0021_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_12_0021
        rs_R009_ueqv_R009NYYNY_generator_12_0000_0031 =
      rs_R009_ueqv_R009NYYNY_partial_12_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYNY_coefficient_12_0022 : Poly :=
[
  term (-1 : Rat) [(7, 1), (15, 1)]
]

/-- Partial product 22 for generator 12. -/
def rs_R009_ueqv_R009NYYNY_partial_12_0022 : Poly :=
[
  term (2 : Rat) [(0, 1), (2, 1), (7, 1), (15, 1)],
  term (-1 : Rat) [(0, 2), (7, 1), (15, 1)],
  term (2 : Rat) [(1, 1), (3, 1), (7, 1), (15, 1)],
  term (-1 : Rat) [(1, 2), (7, 1), (15, 1)],
  term (-2 : Rat) [(2, 1), (7, 1), (14, 1), (15, 1)],
  term (-2 : Rat) [(3, 1), (7, 1), (15, 2)],
  term (1 : Rat) [(7, 1), (14, 2), (15, 1)],
  term (1 : Rat) [(7, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 12. -/
theorem rs_R009_ueqv_R009NYYNY_partial_12_0022_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_12_0022
        rs_R009_ueqv_R009NYYNY_generator_12_0000_0031 =
      rs_R009_ueqv_R009NYYNY_partial_12_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYNY_coefficient_12_0023 : Poly :=
[
  term ((-4 : Rat) / 3) [(9, 1), (13, 1)]
]

/-- Partial product 23 for generator 12. -/
def rs_R009_ueqv_R009NYYNY_partial_12_0023 : Poly :=
[
  term ((8 : Rat) / 3) [(0, 1), (2, 1), (9, 1), (13, 1)],
  term ((-4 : Rat) / 3) [(0, 2), (9, 1), (13, 1)],
  term ((8 : Rat) / 3) [(1, 1), (3, 1), (9, 1), (13, 1)],
  term ((-4 : Rat) / 3) [(1, 2), (9, 1), (13, 1)],
  term ((-8 : Rat) / 3) [(2, 1), (9, 1), (13, 1), (14, 1)],
  term ((-8 : Rat) / 3) [(3, 1), (9, 1), (13, 1), (15, 1)],
  term ((4 : Rat) / 3) [(9, 1), (13, 1), (14, 2)],
  term ((4 : Rat) / 3) [(9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 12. -/
theorem rs_R009_ueqv_R009NYYNY_partial_12_0023_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_12_0023
        rs_R009_ueqv_R009NYYNY_generator_12_0000_0031 =
      rs_R009_ueqv_R009NYYNY_partial_12_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYNY_coefficient_12_0024 : Poly :=
[
  term (-16 : Rat) [(9, 1), (14, 1), (15, 1)]
]

/-- Partial product 24 for generator 12. -/
def rs_R009_ueqv_R009NYYNY_partial_12_0024 : Poly :=
[
  term (32 : Rat) [(0, 1), (2, 1), (9, 1), (14, 1), (15, 1)],
  term (-16 : Rat) [(0, 2), (9, 1), (14, 1), (15, 1)],
  term (32 : Rat) [(1, 1), (3, 1), (9, 1), (14, 1), (15, 1)],
  term (-16 : Rat) [(1, 2), (9, 1), (14, 1), (15, 1)],
  term (-32 : Rat) [(2, 1), (9, 1), (14, 2), (15, 1)],
  term (-32 : Rat) [(3, 1), (9, 1), (14, 1), (15, 2)],
  term (16 : Rat) [(9, 1), (14, 1), (15, 3)],
  term (16 : Rat) [(9, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 12. -/
theorem rs_R009_ueqv_R009NYYNY_partial_12_0024_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_12_0024
        rs_R009_ueqv_R009NYYNY_generator_12_0000_0031 =
      rs_R009_ueqv_R009NYYNY_partial_12_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYNY_coefficient_12_0025 : Poly :=
[
  term ((41 : Rat) / 3) [(9, 1), (15, 1)]
]

/-- Partial product 25 for generator 12. -/
def rs_R009_ueqv_R009NYYNY_partial_12_0025 : Poly :=
[
  term ((-82 : Rat) / 3) [(0, 1), (2, 1), (9, 1), (15, 1)],
  term ((41 : Rat) / 3) [(0, 2), (9, 1), (15, 1)],
  term ((-82 : Rat) / 3) [(1, 1), (3, 1), (9, 1), (15, 1)],
  term ((41 : Rat) / 3) [(1, 2), (9, 1), (15, 1)],
  term ((82 : Rat) / 3) [(2, 1), (9, 1), (14, 1), (15, 1)],
  term ((82 : Rat) / 3) [(3, 1), (9, 1), (15, 2)],
  term ((-41 : Rat) / 3) [(9, 1), (14, 2), (15, 1)],
  term ((-41 : Rat) / 3) [(9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 12. -/
theorem rs_R009_ueqv_R009NYYNY_partial_12_0025_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_12_0025
        rs_R009_ueqv_R009NYYNY_generator_12_0000_0031 =
      rs_R009_ueqv_R009NYYNY_partial_12_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYNY_coefficient_12_0026 : Poly :=
[
  term ((-8 : Rat) / 3) [(9, 2)]
]

/-- Partial product 26 for generator 12. -/
def rs_R009_ueqv_R009NYYNY_partial_12_0026 : Poly :=
[
  term ((16 : Rat) / 3) [(0, 1), (2, 1), (9, 2)],
  term ((-8 : Rat) / 3) [(0, 2), (9, 2)],
  term ((16 : Rat) / 3) [(1, 1), (3, 1), (9, 2)],
  term ((-8 : Rat) / 3) [(1, 2), (9, 2)],
  term ((-16 : Rat) / 3) [(2, 1), (9, 2), (14, 1)],
  term ((-16 : Rat) / 3) [(3, 1), (9, 2), (15, 1)],
  term ((8 : Rat) / 3) [(9, 2), (14, 2)],
  term ((8 : Rat) / 3) [(9, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 12. -/
theorem rs_R009_ueqv_R009NYYNY_partial_12_0026_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_12_0026
        rs_R009_ueqv_R009NYYNY_generator_12_0000_0031 =
      rs_R009_ueqv_R009NYYNY_partial_12_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYNY_coefficient_12_0027 : Poly :=
[
  term (6 : Rat) [(11, 2)]
]

/-- Partial product 27 for generator 12. -/
def rs_R009_ueqv_R009NYYNY_partial_12_0027 : Poly :=
[
  term (-12 : Rat) [(0, 1), (2, 1), (11, 2)],
  term (6 : Rat) [(0, 2), (11, 2)],
  term (-12 : Rat) [(1, 1), (3, 1), (11, 2)],
  term (6 : Rat) [(1, 2), (11, 2)],
  term (12 : Rat) [(2, 1), (11, 2), (14, 1)],
  term (12 : Rat) [(3, 1), (11, 2), (15, 1)],
  term (-6 : Rat) [(11, 2), (14, 2)],
  term (-6 : Rat) [(11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 12. -/
theorem rs_R009_ueqv_R009NYYNY_partial_12_0027_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_12_0027
        rs_R009_ueqv_R009NYYNY_generator_12_0000_0031 =
      rs_R009_ueqv_R009NYYNY_partial_12_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYNY_coefficient_12_0028 : Poly :=
[
  term ((-1 : Rat) / 3) [(13, 1), (15, 1)]
]

/-- Partial product 28 for generator 12. -/
def rs_R009_ueqv_R009NYYNY_partial_12_0028 : Poly :=
[
  term ((2 : Rat) / 3) [(0, 1), (2, 1), (13, 1), (15, 1)],
  term ((-1 : Rat) / 3) [(0, 2), (13, 1), (15, 1)],
  term ((2 : Rat) / 3) [(1, 1), (3, 1), (13, 1), (15, 1)],
  term ((-1 : Rat) / 3) [(1, 2), (13, 1), (15, 1)],
  term ((-2 : Rat) / 3) [(2, 1), (13, 1), (14, 1), (15, 1)],
  term ((-2 : Rat) / 3) [(3, 1), (13, 1), (15, 2)],
  term ((1 : Rat) / 3) [(13, 1), (14, 2), (15, 1)],
  term ((1 : Rat) / 3) [(13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 12. -/
theorem rs_R009_ueqv_R009NYYNY_partial_12_0028_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_12_0028
        rs_R009_ueqv_R009NYYNY_generator_12_0000_0031 =
      rs_R009_ueqv_R009NYYNY_partial_12_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYNY_coefficient_12_0029 : Poly :=
[
  term ((-31 : Rat) / 6) [(14, 1)]
]

/-- Partial product 29 for generator 12. -/
def rs_R009_ueqv_R009NYYNY_partial_12_0029 : Poly :=
[
  term ((31 : Rat) / 3) [(0, 1), (2, 1), (14, 1)],
  term ((-31 : Rat) / 6) [(0, 2), (14, 1)],
  term ((31 : Rat) / 3) [(1, 1), (3, 1), (14, 1)],
  term ((-31 : Rat) / 6) [(1, 2), (14, 1)],
  term ((-31 : Rat) / 3) [(2, 1), (14, 2)],
  term ((-31 : Rat) / 3) [(3, 1), (14, 1), (15, 1)],
  term ((31 : Rat) / 6) [(14, 1), (15, 2)],
  term ((31 : Rat) / 6) [(14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 12. -/
theorem rs_R009_ueqv_R009NYYNY_partial_12_0029_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_12_0029
        rs_R009_ueqv_R009NYYNY_generator_12_0000_0031 =
      rs_R009_ueqv_R009NYYNY_partial_12_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYNY_coefficient_12_0030 : Poly :=
[
  term (2 : Rat) [(14, 2)]
]

/-- Partial product 30 for generator 12. -/
def rs_R009_ueqv_R009NYYNY_partial_12_0030 : Poly :=
[
  term (-4 : Rat) [(0, 1), (2, 1), (14, 2)],
  term (2 : Rat) [(0, 2), (14, 2)],
  term (-4 : Rat) [(1, 1), (3, 1), (14, 2)],
  term (2 : Rat) [(1, 2), (14, 2)],
  term (4 : Rat) [(2, 1), (14, 3)],
  term (4 : Rat) [(3, 1), (14, 2), (15, 1)],
  term (-2 : Rat) [(14, 2), (15, 2)],
  term (-2 : Rat) [(14, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 12. -/
theorem rs_R009_ueqv_R009NYYNY_partial_12_0030_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_12_0030
        rs_R009_ueqv_R009NYYNY_generator_12_0000_0031 =
      rs_R009_ueqv_R009NYYNY_partial_12_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NYYNY_coefficient_12_0031 : Poly :=
[
  term ((-14 : Rat) / 3) [(15, 2)]
]

/-- Partial product 31 for generator 12. -/
def rs_R009_ueqv_R009NYYNY_partial_12_0031 : Poly :=
[
  term ((28 : Rat) / 3) [(0, 1), (2, 1), (15, 2)],
  term ((-14 : Rat) / 3) [(0, 2), (15, 2)],
  term ((28 : Rat) / 3) [(1, 1), (3, 1), (15, 2)],
  term ((-14 : Rat) / 3) [(1, 2), (15, 2)],
  term ((-28 : Rat) / 3) [(2, 1), (14, 1), (15, 2)],
  term ((-28 : Rat) / 3) [(3, 1), (15, 3)],
  term ((14 : Rat) / 3) [(14, 2), (15, 2)],
  term ((14 : Rat) / 3) [(15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 12. -/
theorem rs_R009_ueqv_R009NYYNY_partial_12_0031_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_12_0031
        rs_R009_ueqv_R009NYYNY_generator_12_0000_0031 =
      rs_R009_ueqv_R009NYYNY_partial_12_0031 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NYYNY_partials_12_0000_0031 : List Poly :=
[
  rs_R009_ueqv_R009NYYNY_partial_12_0000,
  rs_R009_ueqv_R009NYYNY_partial_12_0001,
  rs_R009_ueqv_R009NYYNY_partial_12_0002,
  rs_R009_ueqv_R009NYYNY_partial_12_0003,
  rs_R009_ueqv_R009NYYNY_partial_12_0004,
  rs_R009_ueqv_R009NYYNY_partial_12_0005,
  rs_R009_ueqv_R009NYYNY_partial_12_0006,
  rs_R009_ueqv_R009NYYNY_partial_12_0007,
  rs_R009_ueqv_R009NYYNY_partial_12_0008,
  rs_R009_ueqv_R009NYYNY_partial_12_0009,
  rs_R009_ueqv_R009NYYNY_partial_12_0010,
  rs_R009_ueqv_R009NYYNY_partial_12_0011,
  rs_R009_ueqv_R009NYYNY_partial_12_0012,
  rs_R009_ueqv_R009NYYNY_partial_12_0013,
  rs_R009_ueqv_R009NYYNY_partial_12_0014,
  rs_R009_ueqv_R009NYYNY_partial_12_0015,
  rs_R009_ueqv_R009NYYNY_partial_12_0016,
  rs_R009_ueqv_R009NYYNY_partial_12_0017,
  rs_R009_ueqv_R009NYYNY_partial_12_0018,
  rs_R009_ueqv_R009NYYNY_partial_12_0019,
  rs_R009_ueqv_R009NYYNY_partial_12_0020,
  rs_R009_ueqv_R009NYYNY_partial_12_0021,
  rs_R009_ueqv_R009NYYNY_partial_12_0022,
  rs_R009_ueqv_R009NYYNY_partial_12_0023,
  rs_R009_ueqv_R009NYYNY_partial_12_0024,
  rs_R009_ueqv_R009NYYNY_partial_12_0025,
  rs_R009_ueqv_R009NYYNY_partial_12_0026,
  rs_R009_ueqv_R009NYYNY_partial_12_0027,
  rs_R009_ueqv_R009NYYNY_partial_12_0028,
  rs_R009_ueqv_R009NYYNY_partial_12_0029,
  rs_R009_ueqv_R009NYYNY_partial_12_0030,
  rs_R009_ueqv_R009NYYNY_partial_12_0031
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NYYNY_block_12_0000_0031 : Poly :=
[
  term (8 : Rat) [(0, 1), (1, 1), (2, 1), (7, 1)],
  term (16 : Rat) [(0, 1), (1, 1), (2, 1), (7, 1), (14, 1)],
  term (16 : Rat) [(0, 1), (1, 1), (2, 1), (9, 1)],
  term (-32 : Rat) [(0, 1), (1, 1), (2, 1), (9, 1), (14, 1)],
  term (-8 : Rat) [(0, 1), (1, 1), (2, 1), (13, 1)],
  term (6 : Rat) [(0, 1), (1, 1), (2, 1), (15, 1)],
  term (-8 : Rat) [(0, 1), (1, 1), (3, 1)],
  term (28 : Rat) [(0, 1), (1, 1), (3, 1), (7, 1), (15, 1)],
  term (-56 : Rat) [(0, 1), (1, 1), (3, 1), (9, 1), (15, 1)],
  term (-8 : Rat) [(0, 1), (1, 1), (7, 1), (14, 2)],
  term (-8 : Rat) [(0, 1), (1, 1), (7, 1), (15, 2)],
  term (16 : Rat) [(0, 1), (1, 1), (9, 1), (14, 2)],
  term (16 : Rat) [(0, 1), (1, 1), (9, 1), (15, 2)],
  term (4 : Rat) [(0, 1), (1, 2)],
  term (-8 : Rat) [(0, 1), (1, 2), (2, 1)],
  term (-16 : Rat) [(0, 1), (1, 2), (3, 1), (7, 1)],
  term (32 : Rat) [(0, 1), (1, 2), (3, 1), (9, 1)],
  term (-6 : Rat) [(0, 1), (1, 2), (7, 1), (15, 1)],
  term (12 : Rat) [(0, 1), (1, 2), (9, 1), (15, 1)],
  term (8 : Rat) [(0, 1), (1, 3), (7, 1)],
  term (-16 : Rat) [(0, 1), (1, 3), (9, 1)],
  term ((-1 : Rat) / 3) [(0, 1), (2, 1)],
  term (-2 : Rat) [(0, 1), (2, 1), (3, 1), (7, 1)],
  term (4 : Rat) [(0, 1), (2, 1), (3, 1), (7, 1), (14, 1)],
  term ((-4 : Rat) / 3) [(0, 1), (2, 1), (3, 1), (9, 1)],
  term (-8 : Rat) [(0, 1), (2, 1), (3, 1), (9, 1), (14, 1)],
  term ((16 : Rat) / 3) [(0, 1), (2, 1), (3, 1), (13, 1)],
  term ((-14 : Rat) / 3) [(0, 1), (2, 1), (3, 1), (15, 1)],
  term ((-8 : Rat) / 3) [(0, 1), (2, 1), (5, 1), (9, 1)],
  term ((16 : Rat) / 3) [(0, 1), (2, 1), (5, 1), (15, 1)],
  term (-28 : Rat) [(0, 1), (2, 1), (7, 1), (14, 1), (15, 1)],
  term (2 : Rat) [(0, 1), (2, 1), (7, 1), (15, 1)],
  term ((8 : Rat) / 3) [(0, 1), (2, 1), (9, 1), (13, 1)],
  term (56 : Rat) [(0, 1), (2, 1), (9, 1), (14, 1), (15, 1)],
  term ((-82 : Rat) / 3) [(0, 1), (2, 1), (9, 1), (15, 1)],
  term ((16 : Rat) / 3) [(0, 1), (2, 1), (9, 2)],
  term (-12 : Rat) [(0, 1), (2, 1), (11, 2)],
  term ((2 : Rat) / 3) [(0, 1), (2, 1), (13, 1), (15, 1)],
  term ((55 : Rat) / 3) [(0, 1), (2, 1), (14, 1)],
  term (-4 : Rat) [(0, 1), (2, 1), (14, 2)],
  term ((28 : Rat) / 3) [(0, 1), (2, 1), (15, 2)],
  term ((-29 : Rat) / 3) [(0, 1), (2, 2)],
  term ((8 : Rat) / 3) [(0, 1), (2, 2), (14, 1)],
  term (-12 : Rat) [(0, 1), (3, 1), (7, 1), (15, 2)],
  term (24 : Rat) [(0, 1), (3, 1), (9, 1), (15, 2)],
  term (8 : Rat) [(0, 1), (3, 1), (15, 1)],
  term (6 : Rat) [(0, 1), (7, 1), (14, 2), (15, 1)],
  term (6 : Rat) [(0, 1), (7, 1), (15, 3)],
  term (-12 : Rat) [(0, 1), (9, 1), (14, 2), (15, 1)],
  term (-12 : Rat) [(0, 1), (9, 1), (15, 3)],
  term (-4 : Rat) [(0, 1), (14, 2)],
  term (-4 : Rat) [(0, 1), (15, 2)],
  term ((1 : Rat) / 6) [(0, 2)],
  term (-16 : Rat) [(0, 2), (1, 1), (2, 1), (7, 1)],
  term (32 : Rat) [(0, 2), (1, 1), (2, 1), (9, 1)],
  term (-4 : Rat) [(0, 2), (1, 1), (7, 1)],
  term (-8 : Rat) [(0, 2), (1, 1), (9, 1)],
  term (4 : Rat) [(0, 2), (1, 1), (13, 1)],
  term (-3 : Rat) [(0, 2), (1, 1), (15, 1)],
  term (4 : Rat) [(0, 2), (1, 2)],
  term ((-19 : Rat) / 6) [(0, 2), (2, 1)],
  term (12 : Rat) [(0, 2), (2, 1), (7, 1), (15, 1)],
  term (-24 : Rat) [(0, 2), (2, 1), (9, 1), (15, 1)],
  term ((-4 : Rat) / 3) [(0, 2), (2, 1), (14, 1)],
  term (1 : Rat) [(0, 2), (3, 1), (7, 1)],
  term (-2 : Rat) [(0, 2), (3, 1), (7, 1), (14, 1)],
  term ((2 : Rat) / 3) [(0, 2), (3, 1), (9, 1)],
  term (4 : Rat) [(0, 2), (3, 1), (9, 1), (14, 1)],
  term ((-8 : Rat) / 3) [(0, 2), (3, 1), (13, 1)],
  term ((7 : Rat) / 3) [(0, 2), (3, 1), (15, 1)],
  term ((4 : Rat) / 3) [(0, 2), (5, 1), (9, 1)],
  term ((-8 : Rat) / 3) [(0, 2), (5, 1), (15, 1)],
  term (8 : Rat) [(0, 2), (7, 1), (14, 1), (15, 1)],
  term (-1 : Rat) [(0, 2), (7, 1), (15, 1)],
  term ((-4 : Rat) / 3) [(0, 2), (9, 1), (13, 1)],
  term (-16 : Rat) [(0, 2), (9, 1), (14, 1), (15, 1)],
  term ((41 : Rat) / 3) [(0, 2), (9, 1), (15, 1)],
  term ((-8 : Rat) / 3) [(0, 2), (9, 2)],
  term (6 : Rat) [(0, 2), (11, 2)],
  term ((-1 : Rat) / 3) [(0, 2), (13, 1), (15, 1)],
  term ((-31 : Rat) / 6) [(0, 2), (14, 1)],
  term (2 : Rat) [(0, 2), (14, 2)],
  term ((-14 : Rat) / 3) [(0, 2), (15, 2)],
  term (4 : Rat) [(0, 3)],
  term (8 : Rat) [(0, 3), (1, 1), (7, 1)],
  term (-16 : Rat) [(0, 3), (1, 1), (9, 1)],
  term (-6 : Rat) [(0, 3), (7, 1), (15, 1)],
  term (12 : Rat) [(0, 3), (9, 1), (15, 1)],
  term ((-29 : Rat) / 3) [(1, 1), (2, 1), (3, 1)],
  term ((8 : Rat) / 3) [(1, 1), (2, 1), (3, 1), (14, 1)],
  term (-8 : Rat) [(1, 1), (2, 1), (7, 1), (14, 1)],
  term (-16 : Rat) [(1, 1), (2, 1), (9, 1), (14, 1)],
  term (8 : Rat) [(1, 1), (2, 1), (13, 1), (14, 1)],
  term (-6 : Rat) [(1, 1), (2, 1), (14, 1), (15, 1)],
  term ((-1 : Rat) / 3) [(1, 1), (3, 1)],
  term ((-8 : Rat) / 3) [(1, 1), (3, 1), (5, 1), (9, 1)],
  term ((16 : Rat) / 3) [(1, 1), (3, 1), (5, 1), (15, 1)],
  term (-16 : Rat) [(1, 1), (3, 1), (7, 1), (14, 1), (15, 1)],
  term (-6 : Rat) [(1, 1), (3, 1), (7, 1), (15, 1)],
  term ((8 : Rat) / 3) [(1, 1), (3, 1), (9, 1), (13, 1)],
  term (32 : Rat) [(1, 1), (3, 1), (9, 1), (14, 1), (15, 1)],
  term ((-130 : Rat) / 3) [(1, 1), (3, 1), (9, 1), (15, 1)],
  term ((16 : Rat) / 3) [(1, 1), (3, 1), (9, 2)],
  term (-12 : Rat) [(1, 1), (3, 1), (11, 2)],
  term ((26 : Rat) / 3) [(1, 1), (3, 1), (13, 1), (15, 1)],
  term ((31 : Rat) / 3) [(1, 1), (3, 1), (14, 1)],
  term (-4 : Rat) [(1, 1), (3, 1), (14, 2)],
  term ((10 : Rat) / 3) [(1, 1), (3, 1), (15, 2)],
  term (-2 : Rat) [(1, 1), (3, 2), (7, 1)],
  term (4 : Rat) [(1, 1), (3, 2), (7, 1), (14, 1)],
  term ((-4 : Rat) / 3) [(1, 1), (3, 2), (9, 1)],
  term (-8 : Rat) [(1, 1), (3, 2), (9, 1), (14, 1)],
  term ((16 : Rat) / 3) [(1, 1), (3, 2), (13, 1)],
  term ((-14 : Rat) / 3) [(1, 1), (3, 2), (15, 1)],
  term (4 : Rat) [(1, 1), (7, 1), (14, 2)],
  term (4 : Rat) [(1, 1), (7, 1), (15, 2)],
  term (8 : Rat) [(1, 1), (9, 1), (14, 2)],
  term (8 : Rat) [(1, 1), (9, 1), (15, 2)],
  term (-4 : Rat) [(1, 1), (13, 1), (14, 2)],
  term (-4 : Rat) [(1, 1), (13, 1), (15, 2)],
  term (3 : Rat) [(1, 1), (14, 2), (15, 1)],
  term (3 : Rat) [(1, 1), (15, 3)],
  term ((1 : Rat) / 6) [(1, 2)],
  term ((29 : Rat) / 6) [(1, 2), (2, 1)],
  term ((20 : Rat) / 3) [(1, 2), (2, 1), (14, 1)],
  term (9 : Rat) [(1, 2), (3, 1), (7, 1)],
  term (-2 : Rat) [(1, 2), (3, 1), (7, 1), (14, 1)],
  term ((50 : Rat) / 3) [(1, 2), (3, 1), (9, 1)],
  term (4 : Rat) [(1, 2), (3, 1), (9, 1), (14, 1)],
  term ((-32 : Rat) / 3) [(1, 2), (3, 1), (13, 1)],
  term ((49 : Rat) / 3) [(1, 2), (3, 1), (15, 1)],
  term ((4 : Rat) / 3) [(1, 2), (5, 1), (9, 1)],
  term ((-8 : Rat) / 3) [(1, 2), (5, 1), (15, 1)],
  term (8 : Rat) [(1, 2), (7, 1), (14, 1), (15, 1)],
  term (-1 : Rat) [(1, 2), (7, 1), (15, 1)],
  term ((-4 : Rat) / 3) [(1, 2), (9, 1), (13, 1)],
  term (-16 : Rat) [(1, 2), (9, 1), (14, 1), (15, 1)],
  term ((41 : Rat) / 3) [(1, 2), (9, 1), (15, 1)],
  term ((-8 : Rat) / 3) [(1, 2), (9, 2)],
  term (6 : Rat) [(1, 2), (11, 2)],
  term ((-1 : Rat) / 3) [(1, 2), (13, 1), (15, 1)],
  term ((-31 : Rat) / 6) [(1, 2), (14, 1)],
  term (-2 : Rat) [(1, 2), (14, 2)],
  term ((-26 : Rat) / 3) [(1, 2), (15, 2)],
  term (-8 : Rat) [(1, 3), (3, 1)],
  term (-4 : Rat) [(1, 3), (7, 1)],
  term (-8 : Rat) [(1, 3), (9, 1)],
  term (4 : Rat) [(1, 3), (13, 1)],
  term (-3 : Rat) [(1, 3), (15, 1)],
  term (4 : Rat) [(1, 4)],
  term (2 : Rat) [(2, 1), (3, 1), (7, 1), (14, 1)],
  term (-4 : Rat) [(2, 1), (3, 1), (7, 1), (14, 2)],
  term ((4 : Rat) / 3) [(2, 1), (3, 1), (9, 1), (14, 1)],
  term (8 : Rat) [(2, 1), (3, 1), (9, 1), (14, 2)],
  term ((-16 : Rat) / 3) [(2, 1), (3, 1), (13, 1), (14, 1)],
  term (2 : Rat) [(2, 1), (3, 1), (14, 1), (15, 1)],
  term ((29 : Rat) / 3) [(2, 1), (3, 1), (15, 1)],
  term ((8 : Rat) / 3) [(2, 1), (5, 1), (9, 1), (14, 1)],
  term ((-16 : Rat) / 3) [(2, 1), (5, 1), (14, 1), (15, 1)],
  term (-2 : Rat) [(2, 1), (7, 1), (14, 1), (15, 1)],
  term (16 : Rat) [(2, 1), (7, 1), (14, 2), (15, 1)],
  term ((-8 : Rat) / 3) [(2, 1), (9, 1), (13, 1), (14, 1)],
  term ((82 : Rat) / 3) [(2, 1), (9, 1), (14, 1), (15, 1)],
  term (-32 : Rat) [(2, 1), (9, 1), (14, 2), (15, 1)],
  term ((-16 : Rat) / 3) [(2, 1), (9, 2), (14, 1)],
  term (12 : Rat) [(2, 1), (11, 2), (14, 1)],
  term ((-2 : Rat) / 3) [(2, 1), (13, 1), (14, 1), (15, 1)],
  term ((1 : Rat) / 3) [(2, 1), (14, 1)],
  term (-8 : Rat) [(2, 1), (14, 1), (15, 2)],
  term ((-91 : Rat) / 6) [(2, 1), (14, 2)],
  term ((16 : Rat) / 3) [(2, 1), (14, 3)],
  term ((-29 : Rat) / 6) [(2, 1), (15, 2)],
  term ((29 : Rat) / 3) [(2, 2), (14, 1)],
  term ((-8 : Rat) / 3) [(2, 2), (14, 2)],
  term ((8 : Rat) / 3) [(3, 1), (5, 1), (9, 1), (15, 1)],
  term ((-16 : Rat) / 3) [(3, 1), (5, 1), (15, 2)],
  term (18 : Rat) [(3, 1), (7, 1), (14, 1), (15, 2)],
  term (-1 : Rat) [(3, 1), (7, 1), (14, 2)],
  term (2 : Rat) [(3, 1), (7, 1), (14, 3)],
  term (-3 : Rat) [(3, 1), (7, 1), (15, 2)],
  term ((-8 : Rat) / 3) [(3, 1), (9, 1), (13, 1), (15, 1)],
  term (-36 : Rat) [(3, 1), (9, 1), (14, 1), (15, 2)],
  term ((-2 : Rat) / 3) [(3, 1), (9, 1), (14, 2)],
  term (-4 : Rat) [(3, 1), (9, 1), (14, 3)],
  term ((80 : Rat) / 3) [(3, 1), (9, 1), (15, 2)],
  term ((-16 : Rat) / 3) [(3, 1), (9, 2), (15, 1)],
  term (12 : Rat) [(3, 1), (11, 2), (15, 1)],
  term ((8 : Rat) / 3) [(3, 1), (13, 1), (14, 2)],
  term (2 : Rat) [(3, 1), (13, 1), (15, 2)],
  term ((-31 : Rat) / 3) [(3, 1), (14, 1), (15, 1)],
  term ((5 : Rat) / 3) [(3, 1), (14, 2), (15, 1)],
  term ((1 : Rat) / 3) [(3, 1), (15, 1)],
  term ((-35 : Rat) / 3) [(3, 1), (15, 3)],
  term (-4 : Rat) [(3, 2), (7, 1), (14, 1), (15, 1)],
  term (2 : Rat) [(3, 2), (7, 1), (15, 1)],
  term (8 : Rat) [(3, 2), (9, 1), (14, 1), (15, 1)],
  term ((4 : Rat) / 3) [(3, 2), (9, 1), (15, 1)],
  term ((-16 : Rat) / 3) [(3, 2), (13, 1), (15, 1)],
  term ((14 : Rat) / 3) [(3, 2), (15, 2)],
  term ((-4 : Rat) / 3) [(5, 1), (9, 1), (14, 2)],
  term ((-4 : Rat) / 3) [(5, 1), (9, 1), (15, 2)],
  term ((8 : Rat) / 3) [(5, 1), (14, 2), (15, 1)],
  term ((8 : Rat) / 3) [(5, 1), (15, 3)],
  term (-8 : Rat) [(7, 1), (14, 1), (15, 3)],
  term (1 : Rat) [(7, 1), (14, 2), (15, 1)],
  term (-8 : Rat) [(7, 1), (14, 3), (15, 1)],
  term (1 : Rat) [(7, 1), (15, 3)],
  term ((4 : Rat) / 3) [(9, 1), (13, 1), (14, 2)],
  term ((4 : Rat) / 3) [(9, 1), (13, 1), (15, 2)],
  term (16 : Rat) [(9, 1), (14, 1), (15, 3)],
  term ((-41 : Rat) / 3) [(9, 1), (14, 2), (15, 1)],
  term (16 : Rat) [(9, 1), (14, 3), (15, 1)],
  term ((-41 : Rat) / 3) [(9, 1), (15, 3)],
  term ((8 : Rat) / 3) [(9, 2), (14, 2)],
  term ((8 : Rat) / 3) [(9, 2), (15, 2)],
  term (-6 : Rat) [(11, 2), (14, 2)],
  term (-6 : Rat) [(11, 2), (15, 2)],
  term ((1 : Rat) / 3) [(13, 1), (14, 2), (15, 1)],
  term ((1 : Rat) / 3) [(13, 1), (15, 3)],
  term ((31 : Rat) / 6) [(14, 1), (15, 2)],
  term ((-1 : Rat) / 6) [(14, 2)],
  term ((8 : Rat) / 3) [(14, 2), (15, 2)],
  term ((31 : Rat) / 6) [(14, 3)],
  term (-2 : Rat) [(14, 4)],
  term ((-1 : Rat) / 6) [(15, 2)],
  term ((14 : Rat) / 3) [(15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 12, terms 0 through 31. -/
theorem rs_R009_ueqv_R009NYYNY_block_12_0000_0031_valid :
    checkProductSumEq rs_R009_ueqv_R009NYYNY_partials_12_0000_0031
      rs_R009_ueqv_R009NYYNY_block_12_0000_0031 = true := by
  native_decide

end R009UeqvR009NYYNYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
