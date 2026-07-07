/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R002:u=v:R002YNYN, term block 18:0-12

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R002UeqvR002YNYNTermShards

/-- Generator polynomial 18 for relaxed split surplus certificate `R002:u=v:R002YNYN`. -/
def rs_R002_ueqv_R002YNYN_generator_18_0000_0012 : Poly :=
[
  term (-2 : Rat) [(0, 1), (6, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (7, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(4, 1), (6, 1)],
  term (-1 : Rat) [(4, 2)],
  term (2 : Rat) [(5, 1), (7, 1)],
  term (-1 : Rat) [(5, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 18. -/
def rs_R002_ueqv_R002YNYN_coefficient_18_0000 : Poly :=
[
  term (-2 : Rat) []
]

/-- Partial product 0 for generator 18. -/
def rs_R002_ueqv_R002YNYN_partial_18_0000 : Poly :=
[
  term (4 : Rat) [(0, 1), (6, 1)],
  term (-2 : Rat) [(0, 2)],
  term (4 : Rat) [(1, 1), (7, 1)],
  term (-2 : Rat) [(1, 2)],
  term (-4 : Rat) [(4, 1), (6, 1)],
  term (2 : Rat) [(4, 2)],
  term (-4 : Rat) [(5, 1), (7, 1)],
  term (2 : Rat) [(5, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 18. -/
theorem rs_R002_ueqv_R002YNYN_partial_18_0000_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_18_0000
        rs_R002_ueqv_R002YNYN_generator_18_0000_0012 =
      rs_R002_ueqv_R002YNYN_partial_18_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 18. -/
def rs_R002_ueqv_R002YNYN_coefficient_18_0001 : Poly :=
[
  term (24 : Rat) [(0, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1 for generator 18. -/
def rs_R002_ueqv_R002YNYN_partial_18_0001 : Poly :=
[
  term (-48 : Rat) [(0, 1), (1, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(0, 1), (1, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term (48 : Rat) [(0, 1), (4, 1), (6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(0, 1), (4, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term (48 : Rat) [(0, 1), (5, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(0, 1), (5, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term (-48 : Rat) [(0, 2), (6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(0, 3), (7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 18. -/
theorem rs_R002_ueqv_R002YNYN_partial_18_0001_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_18_0001
        rs_R002_ueqv_R002YNYN_generator_18_0000_0012 =
      rs_R002_ueqv_R002YNYN_partial_18_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 18. -/
def rs_R002_ueqv_R002YNYN_coefficient_18_0002 : Poly :=
[
  term (-12 : Rat) [(0, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 2 for generator 18. -/
def rs_R002_ueqv_R002YNYN_partial_18_0002 : Poly :=
[
  term (24 : Rat) [(0, 1), (1, 1), (7, 2), (15, 1), (16, 1)],
  term (-12 : Rat) [(0, 1), (1, 2), (7, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(0, 1), (4, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(0, 1), (4, 2), (7, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(0, 1), (5, 1), (7, 2), (15, 1), (16, 1)],
  term (12 : Rat) [(0, 1), (5, 2), (7, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(0, 2), (6, 1), (7, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(0, 3), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 18. -/
theorem rs_R002_ueqv_R002YNYN_partial_18_0002_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_18_0002
        rs_R002_ueqv_R002YNYN_generator_18_0000_0012 =
      rs_R002_ueqv_R002YNYN_partial_18_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 18. -/
def rs_R002_ueqv_R002YNYN_coefficient_18_0003 : Poly :=
[
  term (-24 : Rat) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 3 for generator 18. -/
def rs_R002_ueqv_R002YNYN_partial_18_0003 : Poly :=
[
  term (48 : Rat) [(0, 1), (1, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(0, 2), (1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term (-48 : Rat) [(1, 1), (4, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(1, 1), (4, 2), (7, 1), (11, 1), (15, 1), (16, 1)],
  term (-48 : Rat) [(1, 1), (5, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(1, 1), (5, 2), (7, 1), (11, 1), (15, 1), (16, 1)],
  term (48 : Rat) [(1, 2), (7, 2), (11, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(1, 3), (7, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 18. -/
theorem rs_R002_ueqv_R002YNYN_partial_18_0003_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_18_0003
        rs_R002_ueqv_R002YNYN_generator_18_0000_0012 =
      rs_R002_ueqv_R002YNYN_partial_18_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 18. -/
def rs_R002_ueqv_R002YNYN_coefficient_18_0004 : Poly :=
[
  term (24 : Rat) [(1, 2), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 4 for generator 18. -/
def rs_R002_ueqv_R002YNYN_partial_18_0004 : Poly :=
[
  term (-48 : Rat) [(0, 1), (1, 2), (6, 1), (7, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(0, 2), (1, 2), (7, 1), (15, 1), (16, 1)],
  term (48 : Rat) [(1, 2), (4, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(1, 2), (4, 2), (7, 1), (15, 1), (16, 1)],
  term (48 : Rat) [(1, 2), (5, 1), (7, 2), (15, 1), (16, 1)],
  term (-24 : Rat) [(1, 2), (5, 2), (7, 1), (15, 1), (16, 1)],
  term (-48 : Rat) [(1, 3), (7, 2), (15, 1), (16, 1)],
  term (24 : Rat) [(1, 4), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 18. -/
theorem rs_R002_ueqv_R002YNYN_partial_18_0004_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_18_0004
        rs_R002_ueqv_R002YNYN_generator_18_0000_0012 =
      rs_R002_ueqv_R002YNYN_partial_18_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 18. -/
def rs_R002_ueqv_R002YNYN_coefficient_18_0005 : Poly :=
[
  term (-24 : Rat) [(7, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 5 for generator 18. -/
def rs_R002_ueqv_R002YNYN_partial_18_0005 : Poly :=
[
  term (48 : Rat) [(0, 1), (6, 1), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(0, 2), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term (48 : Rat) [(1, 1), (7, 2), (8, 1), (12, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(1, 2), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term (-48 : Rat) [(4, 1), (6, 1), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(4, 2), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term (-48 : Rat) [(5, 1), (7, 2), (8, 1), (12, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(5, 2), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 18. -/
theorem rs_R002_ueqv_R002YNYN_partial_18_0005_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_18_0005
        rs_R002_ueqv_R002YNYN_generator_18_0000_0012 =
      rs_R002_ueqv_R002YNYN_partial_18_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 18. -/
def rs_R002_ueqv_R002YNYN_coefficient_18_0006 : Poly :=
[
  term (12 : Rat) [(7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 6 for generator 18. -/
def rs_R002_ueqv_R002YNYN_partial_18_0006 : Poly :=
[
  term (-24 : Rat) [(0, 1), (6, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(0, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(1, 1), (7, 2), (8, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(1, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(4, 1), (6, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(4, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(5, 1), (7, 2), (8, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(5, 2), (7, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 18. -/
theorem rs_R002_ueqv_R002YNYN_partial_18_0006_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_18_0006
        rs_R002_ueqv_R002YNYN_generator_18_0000_0012 =
      rs_R002_ueqv_R002YNYN_partial_18_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 18. -/
def rs_R002_ueqv_R002YNYN_coefficient_18_0007 : Poly :=
[
  term (-24 : Rat) [(7, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 7 for generator 18. -/
def rs_R002_ueqv_R002YNYN_partial_18_0007 : Poly :=
[
  term (48 : Rat) [(0, 1), (6, 1), (7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(0, 2), (7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term (48 : Rat) [(1, 1), (7, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(1, 2), (7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term (-48 : Rat) [(4, 1), (6, 1), (7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(4, 2), (7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term (-48 : Rat) [(5, 1), (7, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(5, 2), (7, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 18. -/
theorem rs_R002_ueqv_R002YNYN_partial_18_0007_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_18_0007
        rs_R002_ueqv_R002YNYN_generator_18_0000_0012 =
      rs_R002_ueqv_R002YNYN_partial_18_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 18. -/
def rs_R002_ueqv_R002YNYN_coefficient_18_0008 : Poly :=
[
  term (12 : Rat) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 8 for generator 18. -/
def rs_R002_ueqv_R002YNYN_partial_18_0008 : Poly :=
[
  term (-24 : Rat) [(0, 1), (6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(0, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(1, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(1, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(4, 1), (6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(4, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(5, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(5, 2), (7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 18. -/
theorem rs_R002_ueqv_R002YNYN_partial_18_0008_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_18_0008
        rs_R002_ueqv_R002YNYN_generator_18_0000_0012 =
      rs_R002_ueqv_R002YNYN_partial_18_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 18. -/
def rs_R002_ueqv_R002YNYN_coefficient_18_0009 : Poly :=
[
  term (-3 : Rat) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 9 for generator 18. -/
def rs_R002_ueqv_R002YNYN_partial_18_0009 : Poly :=
[
  term (6 : Rat) [(0, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(1, 1), (7, 2), (15, 1), (16, 1)],
  term (-3 : Rat) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(4, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(4, 2), (7, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(5, 1), (7, 2), (15, 1), (16, 1)],
  term (3 : Rat) [(5, 2), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 18. -/
theorem rs_R002_ueqv_R002YNYN_partial_18_0009_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_18_0009
        rs_R002_ueqv_R002YNYN_generator_18_0000_0012 =
      rs_R002_ueqv_R002YNYN_partial_18_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 18. -/
def rs_R002_ueqv_R002YNYN_coefficient_18_0010 : Poly :=
[
  term (-12 : Rat) [(7, 1), (15, 3), (16, 1)]
]

/-- Partial product 10 for generator 18. -/
def rs_R002_ueqv_R002YNYN_partial_18_0010 : Poly :=
[
  term (24 : Rat) [(0, 1), (6, 1), (7, 1), (15, 3), (16, 1)],
  term (-12 : Rat) [(0, 2), (7, 1), (15, 3), (16, 1)],
  term (24 : Rat) [(1, 1), (7, 2), (15, 3), (16, 1)],
  term (-12 : Rat) [(1, 2), (7, 1), (15, 3), (16, 1)],
  term (-24 : Rat) [(4, 1), (6, 1), (7, 1), (15, 3), (16, 1)],
  term (12 : Rat) [(4, 2), (7, 1), (15, 3), (16, 1)],
  term (-24 : Rat) [(5, 1), (7, 2), (15, 3), (16, 1)],
  term (12 : Rat) [(5, 2), (7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 18. -/
theorem rs_R002_ueqv_R002YNYN_partial_18_0010_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_18_0010
        rs_R002_ueqv_R002YNYN_generator_18_0000_0012 =
      rs_R002_ueqv_R002YNYN_partial_18_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 18. -/
def rs_R002_ueqv_R002YNYN_coefficient_18_0011 : Poly :=
[
  term (8 : Rat) [(13, 1), (15, 1)]
]

/-- Partial product 11 for generator 18. -/
def rs_R002_ueqv_R002YNYN_partial_18_0011 : Poly :=
[
  term (-16 : Rat) [(0, 1), (6, 1), (13, 1), (15, 1)],
  term (8 : Rat) [(0, 2), (13, 1), (15, 1)],
  term (-16 : Rat) [(1, 1), (7, 1), (13, 1), (15, 1)],
  term (8 : Rat) [(1, 2), (13, 1), (15, 1)],
  term (16 : Rat) [(4, 1), (6, 1), (13, 1), (15, 1)],
  term (-8 : Rat) [(4, 2), (13, 1), (15, 1)],
  term (16 : Rat) [(5, 1), (7, 1), (13, 1), (15, 1)],
  term (-8 : Rat) [(5, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 18. -/
theorem rs_R002_ueqv_R002YNYN_partial_18_0011_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_18_0011
        rs_R002_ueqv_R002YNYN_generator_18_0000_0012 =
      rs_R002_ueqv_R002YNYN_partial_18_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 18. -/
def rs_R002_ueqv_R002YNYN_coefficient_18_0012 : Poly :=
[
  term (-16 : Rat) [(15, 2)]
]

/-- Partial product 12 for generator 18. -/
def rs_R002_ueqv_R002YNYN_partial_18_0012 : Poly :=
[
  term (32 : Rat) [(0, 1), (6, 1), (15, 2)],
  term (-16 : Rat) [(0, 2), (15, 2)],
  term (32 : Rat) [(1, 1), (7, 1), (15, 2)],
  term (-16 : Rat) [(1, 2), (15, 2)],
  term (-32 : Rat) [(4, 1), (6, 1), (15, 2)],
  term (16 : Rat) [(4, 2), (15, 2)],
  term (-32 : Rat) [(5, 1), (7, 1), (15, 2)],
  term (16 : Rat) [(5, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 18. -/
theorem rs_R002_ueqv_R002YNYN_partial_18_0012_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_18_0012
        rs_R002_ueqv_R002YNYN_generator_18_0000_0012 =
      rs_R002_ueqv_R002YNYN_partial_18_0012 := by
  native_decide

/-- Partial products in this block. -/
def rs_R002_ueqv_R002YNYN_partials_18_0000_0012 : List Poly :=
[
  rs_R002_ueqv_R002YNYN_partial_18_0000,
  rs_R002_ueqv_R002YNYN_partial_18_0001,
  rs_R002_ueqv_R002YNYN_partial_18_0002,
  rs_R002_ueqv_R002YNYN_partial_18_0003,
  rs_R002_ueqv_R002YNYN_partial_18_0004,
  rs_R002_ueqv_R002YNYN_partial_18_0005,
  rs_R002_ueqv_R002YNYN_partial_18_0006,
  rs_R002_ueqv_R002YNYN_partial_18_0007,
  rs_R002_ueqv_R002YNYN_partial_18_0008,
  rs_R002_ueqv_R002YNYN_partial_18_0009,
  rs_R002_ueqv_R002YNYN_partial_18_0010,
  rs_R002_ueqv_R002YNYN_partial_18_0011,
  rs_R002_ueqv_R002YNYN_partial_18_0012
]

/-- Sum of partial products in this block. -/
def rs_R002_ueqv_R002YNYN_block_18_0000_0012 : Poly :=
[
  term (48 : Rat) [(0, 1), (1, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term (-48 : Rat) [(0, 1), (1, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(0, 1), (1, 1), (7, 2), (15, 1), (16, 1)],
  term (-48 : Rat) [(0, 1), (1, 2), (6, 1), (7, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(0, 1), (1, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(0, 1), (1, 2), (7, 1), (15, 1), (16, 1)],
  term (48 : Rat) [(0, 1), (4, 1), (6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(0, 1), (4, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(0, 1), (4, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(0, 1), (4, 2), (7, 1), (15, 1), (16, 1)],
  term (48 : Rat) [(0, 1), (5, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(0, 1), (5, 1), (7, 2), (15, 1), (16, 1)],
  term (-24 : Rat) [(0, 1), (5, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(0, 1), (5, 2), (7, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(0, 1), (6, 1)],
  term (48 : Rat) [(0, 1), (6, 1), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(0, 1), (6, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term (48 : Rat) [(0, 1), (6, 1), (7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(0, 1), (6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(0, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(0, 1), (6, 1), (7, 1), (15, 3), (16, 1)],
  term (-16 : Rat) [(0, 1), (6, 1), (13, 1), (15, 1)],
  term (32 : Rat) [(0, 1), (6, 1), (15, 2)],
  term (-2 : Rat) [(0, 2)],
  term (-24 : Rat) [(0, 2), (1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(0, 2), (1, 2), (7, 1), (15, 1), (16, 1)],
  term (-48 : Rat) [(0, 2), (6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(0, 2), (6, 1), (7, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(0, 2), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(0, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(0, 2), (7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(0, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(0, 2), (7, 1), (15, 3), (16, 1)],
  term (8 : Rat) [(0, 2), (13, 1), (15, 1)],
  term (-16 : Rat) [(0, 2), (15, 2)],
  term (24 : Rat) [(0, 3), (7, 1), (12, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(0, 3), (7, 1), (15, 1), (16, 1)],
  term (-48 : Rat) [(1, 1), (4, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(1, 1), (4, 2), (7, 1), (11, 1), (15, 1), (16, 1)],
  term (-48 : Rat) [(1, 1), (5, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(1, 1), (5, 2), (7, 1), (11, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(1, 1), (7, 1)],
  term (-16 : Rat) [(1, 1), (7, 1), (13, 1), (15, 1)],
  term (32 : Rat) [(1, 1), (7, 1), (15, 2)],
  term (48 : Rat) [(1, 1), (7, 2), (8, 1), (12, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(1, 1), (7, 2), (8, 1), (15, 1), (16, 1)],
  term (48 : Rat) [(1, 1), (7, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(1, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(1, 1), (7, 2), (15, 1), (16, 1)],
  term (24 : Rat) [(1, 1), (7, 2), (15, 3), (16, 1)],
  term (-2 : Rat) [(1, 2)],
  term (48 : Rat) [(1, 2), (4, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(1, 2), (4, 2), (7, 1), (15, 1), (16, 1)],
  term (48 : Rat) [(1, 2), (5, 1), (7, 2), (15, 1), (16, 1)],
  term (-24 : Rat) [(1, 2), (5, 2), (7, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(1, 2), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(1, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(1, 2), (7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(1, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(1, 2), (7, 1), (15, 3), (16, 1)],
  term (48 : Rat) [(1, 2), (7, 2), (11, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(1, 2), (13, 1), (15, 1)],
  term (-16 : Rat) [(1, 2), (15, 2)],
  term (-24 : Rat) [(1, 3), (7, 1), (11, 1), (15, 1), (16, 1)],
  term (-48 : Rat) [(1, 3), (7, 2), (15, 1), (16, 1)],
  term (24 : Rat) [(1, 4), (7, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(4, 1), (6, 1)],
  term (-48 : Rat) [(4, 1), (6, 1), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(4, 1), (6, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term (-48 : Rat) [(4, 1), (6, 1), (7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(4, 1), (6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(4, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(4, 1), (6, 1), (7, 1), (15, 3), (16, 1)],
  term (16 : Rat) [(4, 1), (6, 1), (13, 1), (15, 1)],
  term (-32 : Rat) [(4, 1), (6, 1), (15, 2)],
  term (2 : Rat) [(4, 2)],
  term (24 : Rat) [(4, 2), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(4, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(4, 2), (7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(4, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(4, 2), (7, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(4, 2), (7, 1), (15, 3), (16, 1)],
  term (-8 : Rat) [(4, 2), (13, 1), (15, 1)],
  term (16 : Rat) [(4, 2), (15, 2)],
  term (-4 : Rat) [(5, 1), (7, 1)],
  term (16 : Rat) [(5, 1), (7, 1), (13, 1), (15, 1)],
  term (-32 : Rat) [(5, 1), (7, 1), (15, 2)],
  term (-48 : Rat) [(5, 1), (7, 2), (8, 1), (12, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(5, 1), (7, 2), (8, 1), (15, 1), (16, 1)],
  term (-48 : Rat) [(5, 1), (7, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(5, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(5, 1), (7, 2), (15, 1), (16, 1)],
  term (-24 : Rat) [(5, 1), (7, 2), (15, 3), (16, 1)],
  term (2 : Rat) [(5, 2)],
  term (24 : Rat) [(5, 2), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(5, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(5, 2), (7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(5, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(5, 2), (7, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(5, 2), (7, 1), (15, 3), (16, 1)],
  term (-8 : Rat) [(5, 2), (13, 1), (15, 1)],
  term (16 : Rat) [(5, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 18, terms 0 through 12. -/
theorem rs_R002_ueqv_R002YNYN_block_18_0000_0012_valid :
    checkProductSumEq rs_R002_ueqv_R002YNYN_partials_18_0000_0012
      rs_R002_ueqv_R002YNYN_block_18_0000_0012 = true := by
  native_decide

end R002UeqvR002YNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
