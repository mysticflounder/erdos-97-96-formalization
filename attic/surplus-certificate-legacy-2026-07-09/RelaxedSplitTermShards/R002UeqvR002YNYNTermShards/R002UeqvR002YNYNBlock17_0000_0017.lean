/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R002:u=v:R002YNYN, term block 17:0-17

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R002UeqvR002YNYNTermShards

/-- Generator polynomial 17 for relaxed split surplus certificate `R002:u=v:R002YNYN`. -/
def rs_R002_ueqv_R002YNYN_generator_17_0000_0017 : Poly :=
[
  term (-2 : Rat) [(0, 1), (6, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (7, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(2, 1), (6, 1)],
  term (-1 : Rat) [(2, 2)],
  term (2 : Rat) [(3, 1), (7, 1)],
  term (-1 : Rat) [(3, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 17. -/
def rs_R002_ueqv_R002YNYN_coefficient_17_0000 : Poly :=
[
  term (3 : Rat) []
]

/-- Partial product 0 for generator 17. -/
def rs_R002_ueqv_R002YNYN_partial_17_0000 : Poly :=
[
  term (-6 : Rat) [(0, 1), (6, 1)],
  term (3 : Rat) [(0, 2)],
  term (-6 : Rat) [(1, 1), (7, 1)],
  term (3 : Rat) [(1, 2)],
  term (6 : Rat) [(2, 1), (6, 1)],
  term (-3 : Rat) [(2, 2)],
  term (6 : Rat) [(3, 1), (7, 1)],
  term (-3 : Rat) [(3, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 17. -/
theorem rs_R002_ueqv_R002YNYN_partial_17_0000_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_17_0000
        rs_R002_ueqv_R002YNYN_generator_17_0000_0017 =
      rs_R002_ueqv_R002YNYN_partial_17_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 17. -/
def rs_R002_ueqv_R002YNYN_coefficient_17_0001 : Poly :=
[
  term (-8 : Rat) [(3, 1), (13, 1)]
]

/-- Partial product 1 for generator 17. -/
def rs_R002_ueqv_R002YNYN_partial_17_0001 : Poly :=
[
  term (16 : Rat) [(0, 1), (3, 1), (6, 1), (13, 1)],
  term (-8 : Rat) [(0, 2), (3, 1), (13, 1)],
  term (16 : Rat) [(1, 1), (3, 1), (7, 1), (13, 1)],
  term (-8 : Rat) [(1, 2), (3, 1), (13, 1)],
  term (-16 : Rat) [(2, 1), (3, 1), (6, 1), (13, 1)],
  term (8 : Rat) [(2, 2), (3, 1), (13, 1)],
  term (-16 : Rat) [(3, 2), (7, 1), (13, 1)],
  term (8 : Rat) [(3, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 17. -/
theorem rs_R002_ueqv_R002YNYN_partial_17_0001_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_17_0001
        rs_R002_ueqv_R002YNYN_generator_17_0000_0017 =
      rs_R002_ueqv_R002YNYN_partial_17_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 17. -/
def rs_R002_ueqv_R002YNYN_coefficient_17_0002 : Poly :=
[
  term ((16 : Rat) / 3) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 2 for generator 17. -/
def rs_R002_ueqv_R002YNYN_partial_17_0002 : Poly :=
[
  term ((-32 : Rat) / 3) [(0, 1), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 3) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 3) [(1, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 3) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 3) [(2, 1), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 3) [(2, 2), (3, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 3) [(3, 2), (7, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 3) [(3, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 17. -/
theorem rs_R002_ueqv_R002YNYN_partial_17_0002_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_17_0002
        rs_R002_ueqv_R002YNYN_generator_17_0000_0017 =
      rs_R002_ueqv_R002YNYN_partial_17_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 17. -/
def rs_R002_ueqv_R002YNYN_coefficient_17_0003 : Poly :=
[
  term (-24 : Rat) [(5, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 3 for generator 17. -/
def rs_R002_ueqv_R002YNYN_partial_17_0003 : Poly :=
[
  term (48 : Rat) [(0, 1), (5, 1), (6, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(0, 2), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term (48 : Rat) [(1, 1), (5, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(1, 2), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term (-48 : Rat) [(2, 1), (5, 1), (6, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(2, 2), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term (-48 : Rat) [(3, 1), (5, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(3, 2), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 17. -/
theorem rs_R002_ueqv_R002YNYN_partial_17_0003_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_17_0003
        rs_R002_ueqv_R002YNYN_generator_17_0000_0017 =
      rs_R002_ueqv_R002YNYN_partial_17_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 17. -/
def rs_R002_ueqv_R002YNYN_coefficient_17_0004 : Poly :=
[
  term (24 : Rat) [(5, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 4 for generator 17. -/
def rs_R002_ueqv_R002YNYN_partial_17_0004 : Poly :=
[
  term (-48 : Rat) [(0, 1), (5, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(0, 2), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term (-48 : Rat) [(1, 1), (5, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(1, 2), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term (48 : Rat) [(2, 1), (5, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(2, 2), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term (48 : Rat) [(3, 1), (5, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(3, 2), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 17. -/
theorem rs_R002_ueqv_R002YNYN_partial_17_0004_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_17_0004
        rs_R002_ueqv_R002YNYN_generator_17_0000_0017 =
      rs_R002_ueqv_R002YNYN_partial_17_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 17. -/
def rs_R002_ueqv_R002YNYN_coefficient_17_0005 : Poly :=
[
  term (8 : Rat) [(5, 1), (13, 1)]
]

/-- Partial product 5 for generator 17. -/
def rs_R002_ueqv_R002YNYN_partial_17_0005 : Poly :=
[
  term (-16 : Rat) [(0, 1), (5, 1), (6, 1), (13, 1)],
  term (8 : Rat) [(0, 2), (5, 1), (13, 1)],
  term (-16 : Rat) [(1, 1), (5, 1), (7, 1), (13, 1)],
  term (8 : Rat) [(1, 2), (5, 1), (13, 1)],
  term (16 : Rat) [(2, 1), (5, 1), (6, 1), (13, 1)],
  term (-8 : Rat) [(2, 2), (5, 1), (13, 1)],
  term (16 : Rat) [(3, 1), (5, 1), (7, 1), (13, 1)],
  term (-8 : Rat) [(3, 2), (5, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 17. -/
theorem rs_R002_ueqv_R002YNYN_partial_17_0005_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_17_0005
        rs_R002_ueqv_R002YNYN_generator_17_0000_0017 =
      rs_R002_ueqv_R002YNYN_partial_17_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 17. -/
def rs_R002_ueqv_R002YNYN_coefficient_17_0006 : Poly :=
[
  term (-8 : Rat) [(5, 1), (15, 1)]
]

/-- Partial product 6 for generator 17. -/
def rs_R002_ueqv_R002YNYN_partial_17_0006 : Poly :=
[
  term (16 : Rat) [(0, 1), (5, 1), (6, 1), (15, 1)],
  term (-8 : Rat) [(0, 2), (5, 1), (15, 1)],
  term (16 : Rat) [(1, 1), (5, 1), (7, 1), (15, 1)],
  term (-8 : Rat) [(1, 2), (5, 1), (15, 1)],
  term (-16 : Rat) [(2, 1), (5, 1), (6, 1), (15, 1)],
  term (8 : Rat) [(2, 2), (5, 1), (15, 1)],
  term (-16 : Rat) [(3, 1), (5, 1), (7, 1), (15, 1)],
  term (8 : Rat) [(3, 2), (5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 17. -/
theorem rs_R002_ueqv_R002YNYN_partial_17_0006_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_17_0006
        rs_R002_ueqv_R002YNYN_generator_17_0000_0017 =
      rs_R002_ueqv_R002YNYN_partial_17_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 17. -/
def rs_R002_ueqv_R002YNYN_coefficient_17_0007 : Poly :=
[
  term (-6 : Rat) [(6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 7 for generator 17. -/
def rs_R002_ueqv_R002YNYN_partial_17_0007 : Poly :=
[
  term (12 : Rat) [(0, 1), (6, 2), (9, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(0, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(1, 1), (6, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(1, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(2, 1), (6, 2), (9, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(2, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(3, 1), (6, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(3, 2), (6, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 17. -/
theorem rs_R002_ueqv_R002YNYN_partial_17_0007_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_17_0007
        rs_R002_ueqv_R002YNYN_generator_17_0000_0017 =
      rs_R002_ueqv_R002YNYN_partial_17_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 17. -/
def rs_R002_ueqv_R002YNYN_coefficient_17_0008 : Poly :=
[
  term (-24 : Rat) [(7, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 8 for generator 17. -/
def rs_R002_ueqv_R002YNYN_partial_17_0008 : Poly :=
[
  term (48 : Rat) [(0, 1), (6, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(0, 2), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term (48 : Rat) [(1, 1), (7, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(1, 2), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term (-48 : Rat) [(2, 1), (6, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(2, 2), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term (-48 : Rat) [(3, 1), (7, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(3, 2), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 17. -/
theorem rs_R002_ueqv_R002YNYN_partial_17_0008_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_17_0008
        rs_R002_ueqv_R002YNYN_generator_17_0000_0017 =
      rs_R002_ueqv_R002YNYN_partial_17_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 17. -/
def rs_R002_ueqv_R002YNYN_coefficient_17_0009 : Poly :=
[
  term ((3 : Rat) / 2) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 9 for generator 17. -/
def rs_R002_ueqv_R002YNYN_partial_17_0009 : Poly :=
[
  term (-3 : Rat) [(0, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((3 : Rat) / 2) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(1, 1), (7, 2), (15, 1), (16, 1)],
  term ((3 : Rat) / 2) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(2, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(2, 2), (7, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(3, 1), (7, 2), (15, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(3, 2), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 17. -/
theorem rs_R002_ueqv_R002YNYN_partial_17_0009_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_17_0009
        rs_R002_ueqv_R002YNYN_generator_17_0000_0017 =
      rs_R002_ueqv_R002YNYN_partial_17_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 17. -/
def rs_R002_ueqv_R002YNYN_coefficient_17_0010 : Poly :=
[
  term (-6 : Rat) [(7, 1), (15, 3), (16, 1)]
]

/-- Partial product 10 for generator 17. -/
def rs_R002_ueqv_R002YNYN_partial_17_0010 : Poly :=
[
  term (12 : Rat) [(0, 1), (6, 1), (7, 1), (15, 3), (16, 1)],
  term (-6 : Rat) [(0, 2), (7, 1), (15, 3), (16, 1)],
  term (12 : Rat) [(1, 1), (7, 2), (15, 3), (16, 1)],
  term (-6 : Rat) [(1, 2), (7, 1), (15, 3), (16, 1)],
  term (-12 : Rat) [(2, 1), (6, 1), (7, 1), (15, 3), (16, 1)],
  term (6 : Rat) [(2, 2), (7, 1), (15, 3), (16, 1)],
  term (-12 : Rat) [(3, 1), (7, 2), (15, 3), (16, 1)],
  term (6 : Rat) [(3, 2), (7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 17. -/
theorem rs_R002_ueqv_R002YNYN_partial_17_0010_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_17_0010
        rs_R002_ueqv_R002YNYN_generator_17_0000_0017 =
      rs_R002_ueqv_R002YNYN_partial_17_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 17. -/
def rs_R002_ueqv_R002YNYN_coefficient_17_0011 : Poly :=
[
  term (-8 : Rat) [(9, 1), (13, 1)]
]

/-- Partial product 11 for generator 17. -/
def rs_R002_ueqv_R002YNYN_partial_17_0011 : Poly :=
[
  term (16 : Rat) [(0, 1), (6, 1), (9, 1), (13, 1)],
  term (-8 : Rat) [(0, 2), (9, 1), (13, 1)],
  term (16 : Rat) [(1, 1), (7, 1), (9, 1), (13, 1)],
  term (-8 : Rat) [(1, 2), (9, 1), (13, 1)],
  term (-16 : Rat) [(2, 1), (6, 1), (9, 1), (13, 1)],
  term (8 : Rat) [(2, 2), (9, 1), (13, 1)],
  term (-16 : Rat) [(3, 1), (7, 1), (9, 1), (13, 1)],
  term (8 : Rat) [(3, 2), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 17. -/
theorem rs_R002_ueqv_R002YNYN_partial_17_0011_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_17_0011
        rs_R002_ueqv_R002YNYN_generator_17_0000_0017 =
      rs_R002_ueqv_R002YNYN_partial_17_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 17. -/
def rs_R002_ueqv_R002YNYN_coefficient_17_0012 : Poly :=
[
  term (8 : Rat) [(9, 1), (15, 1)]
]

/-- Partial product 12 for generator 17. -/
def rs_R002_ueqv_R002YNYN_partial_17_0012 : Poly :=
[
  term (-16 : Rat) [(0, 1), (6, 1), (9, 1), (15, 1)],
  term (8 : Rat) [(0, 2), (9, 1), (15, 1)],
  term (-16 : Rat) [(1, 1), (7, 1), (9, 1), (15, 1)],
  term (8 : Rat) [(1, 2), (9, 1), (15, 1)],
  term (16 : Rat) [(2, 1), (6, 1), (9, 1), (15, 1)],
  term (-8 : Rat) [(2, 2), (9, 1), (15, 1)],
  term (16 : Rat) [(3, 1), (7, 1), (9, 1), (15, 1)],
  term (-8 : Rat) [(3, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 17. -/
theorem rs_R002_ueqv_R002YNYN_partial_17_0012_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_17_0012
        rs_R002_ueqv_R002YNYN_generator_17_0000_0017 =
      rs_R002_ueqv_R002YNYN_partial_17_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 17. -/
def rs_R002_ueqv_R002YNYN_coefficient_17_0013 : Poly :=
[
  term (4 : Rat) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 13 for generator 17. -/
def rs_R002_ueqv_R002YNYN_partial_17_0013 : Poly :=
[
  term (-8 : Rat) [(0, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(1, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(2, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(3, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 17. -/
theorem rs_R002_ueqv_R002YNYN_partial_17_0013_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_17_0013
        rs_R002_ueqv_R002YNYN_generator_17_0000_0017 =
      rs_R002_ueqv_R002YNYN_partial_17_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 17. -/
def rs_R002_ueqv_R002YNYN_coefficient_17_0014 : Poly :=
[
  term (4 : Rat) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 14 for generator 17. -/
def rs_R002_ueqv_R002YNYN_partial_17_0014 : Poly :=
[
  term (-8 : Rat) [(0, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(2, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(3, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 17. -/
theorem rs_R002_ueqv_R002YNYN_partial_17_0014_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_17_0014
        rs_R002_ueqv_R002YNYN_generator_17_0000_0017 =
      rs_R002_ueqv_R002YNYN_partial_17_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 17. -/
def rs_R002_ueqv_R002YNYN_coefficient_17_0015 : Poly :=
[
  term (-8 : Rat) [(13, 1), (15, 1)]
]

/-- Partial product 15 for generator 17. -/
def rs_R002_ueqv_R002YNYN_partial_17_0015 : Poly :=
[
  term (16 : Rat) [(0, 1), (6, 1), (13, 1), (15, 1)],
  term (-8 : Rat) [(0, 2), (13, 1), (15, 1)],
  term (16 : Rat) [(1, 1), (7, 1), (13, 1), (15, 1)],
  term (-8 : Rat) [(1, 2), (13, 1), (15, 1)],
  term (-16 : Rat) [(2, 1), (6, 1), (13, 1), (15, 1)],
  term (8 : Rat) [(2, 2), (13, 1), (15, 1)],
  term (-16 : Rat) [(3, 1), (7, 1), (13, 1), (15, 1)],
  term (8 : Rat) [(3, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 17. -/
theorem rs_R002_ueqv_R002YNYN_partial_17_0015_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_17_0015
        rs_R002_ueqv_R002YNYN_generator_17_0000_0017 =
      rs_R002_ueqv_R002YNYN_partial_17_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 17. -/
def rs_R002_ueqv_R002YNYN_coefficient_17_0016 : Poly :=
[
  term ((-4 : Rat) / 3) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 16 for generator 17. -/
def rs_R002_ueqv_R002YNYN_partial_17_0016 : Poly :=
[
  term ((8 : Rat) / 3) [(0, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 3) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-8 : Rat) / 3) [(2, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((4 : Rat) / 3) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((-8 : Rat) / 3) [(3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((4 : Rat) / 3) [(3, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 17. -/
theorem rs_R002_ueqv_R002YNYN_partial_17_0016_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_17_0016
        rs_R002_ueqv_R002YNYN_generator_17_0000_0017 =
      rs_R002_ueqv_R002YNYN_partial_17_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 17. -/
def rs_R002_ueqv_R002YNYN_coefficient_17_0017 : Poly :=
[
  term (-12 : Rat) [(15, 2)]
]

/-- Partial product 17 for generator 17. -/
def rs_R002_ueqv_R002YNYN_partial_17_0017 : Poly :=
[
  term (24 : Rat) [(0, 1), (6, 1), (15, 2)],
  term (-12 : Rat) [(0, 2), (15, 2)],
  term (24 : Rat) [(1, 1), (7, 1), (15, 2)],
  term (-12 : Rat) [(1, 2), (15, 2)],
  term (-24 : Rat) [(2, 1), (6, 1), (15, 2)],
  term (12 : Rat) [(2, 2), (15, 2)],
  term (-24 : Rat) [(3, 1), (7, 1), (15, 2)],
  term (12 : Rat) [(3, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 17. -/
theorem rs_R002_ueqv_R002YNYN_partial_17_0017_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_17_0017
        rs_R002_ueqv_R002YNYN_generator_17_0000_0017 =
      rs_R002_ueqv_R002YNYN_partial_17_0017 := by
  native_decide

/-- Partial products in this block. -/
def rs_R002_ueqv_R002YNYN_partials_17_0000_0017 : List Poly :=
[
  rs_R002_ueqv_R002YNYN_partial_17_0000,
  rs_R002_ueqv_R002YNYN_partial_17_0001,
  rs_R002_ueqv_R002YNYN_partial_17_0002,
  rs_R002_ueqv_R002YNYN_partial_17_0003,
  rs_R002_ueqv_R002YNYN_partial_17_0004,
  rs_R002_ueqv_R002YNYN_partial_17_0005,
  rs_R002_ueqv_R002YNYN_partial_17_0006,
  rs_R002_ueqv_R002YNYN_partial_17_0007,
  rs_R002_ueqv_R002YNYN_partial_17_0008,
  rs_R002_ueqv_R002YNYN_partial_17_0009,
  rs_R002_ueqv_R002YNYN_partial_17_0010,
  rs_R002_ueqv_R002YNYN_partial_17_0011,
  rs_R002_ueqv_R002YNYN_partial_17_0012,
  rs_R002_ueqv_R002YNYN_partial_17_0013,
  rs_R002_ueqv_R002YNYN_partial_17_0014,
  rs_R002_ueqv_R002YNYN_partial_17_0015,
  rs_R002_ueqv_R002YNYN_partial_17_0016,
  rs_R002_ueqv_R002YNYN_partial_17_0017
]

/-- Sum of partial products in this block. -/
def rs_R002_ueqv_R002YNYN_block_17_0000_0017 : Poly :=
[
  term (16 : Rat) [(0, 1), (3, 1), (6, 1), (13, 1)],
  term ((-32 : Rat) / 3) [(0, 1), (3, 1), (6, 1), (15, 1), (16, 1)],
  term (48 : Rat) [(0, 1), (5, 1), (6, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term (-48 : Rat) [(0, 1), (5, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term (-16 : Rat) [(0, 1), (5, 1), (6, 1), (13, 1)],
  term (16 : Rat) [(0, 1), (5, 1), (6, 1), (15, 1)],
  term (-6 : Rat) [(0, 1), (6, 1)],
  term (48 : Rat) [(0, 1), (6, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(0, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(0, 1), (6, 1), (7, 1), (15, 3), (16, 1)],
  term (16 : Rat) [(0, 1), (6, 1), (9, 1), (13, 1)],
  term (-16 : Rat) [(0, 1), (6, 1), (9, 1), (15, 1)],
  term (-8 : Rat) [(0, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(0, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term (16 : Rat) [(0, 1), (6, 1), (13, 1), (15, 1)],
  term ((8 : Rat) / 3) [(0, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(0, 1), (6, 1), (15, 2)],
  term (12 : Rat) [(0, 1), (6, 2), (9, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(0, 2)],
  term (-8 : Rat) [(0, 2), (3, 1), (13, 1)],
  term ((16 : Rat) / 3) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(0, 2), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(0, 2), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(0, 2), (5, 1), (13, 1)],
  term (-8 : Rat) [(0, 2), (5, 1), (15, 1)],
  term (-6 : Rat) [(0, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(0, 2), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((3 : Rat) / 2) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(0, 2), (7, 1), (15, 3), (16, 1)],
  term (-8 : Rat) [(0, 2), (9, 1), (13, 1)],
  term (8 : Rat) [(0, 2), (9, 1), (15, 1)],
  term (4 : Rat) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(0, 2), (13, 1), (15, 1)],
  term ((-4 : Rat) / 3) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(0, 2), (15, 2)],
  term (16 : Rat) [(1, 1), (3, 1), (7, 1), (13, 1)],
  term ((-32 : Rat) / 3) [(1, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term (-16 : Rat) [(1, 1), (5, 1), (7, 1), (13, 1)],
  term (16 : Rat) [(1, 1), (5, 1), (7, 1), (15, 1)],
  term (48 : Rat) [(1, 1), (5, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term (-48 : Rat) [(1, 1), (5, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(1, 1), (6, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(1, 1), (7, 1)],
  term (16 : Rat) [(1, 1), (7, 1), (9, 1), (13, 1)],
  term (-16 : Rat) [(1, 1), (7, 1), (9, 1), (15, 1)],
  term (-8 : Rat) [(1, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term (16 : Rat) [(1, 1), (7, 1), (13, 1), (15, 1)],
  term ((8 : Rat) / 3) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(1, 1), (7, 1), (15, 2)],
  term (48 : Rat) [(1, 1), (7, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(1, 1), (7, 2), (15, 1), (16, 1)],
  term (12 : Rat) [(1, 1), (7, 2), (15, 3), (16, 1)],
  term (3 : Rat) [(1, 2)],
  term (-8 : Rat) [(1, 2), (3, 1), (13, 1)],
  term ((16 : Rat) / 3) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(1, 2), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(1, 2), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(1, 2), (5, 1), (13, 1)],
  term (-8 : Rat) [(1, 2), (5, 1), (15, 1)],
  term (-6 : Rat) [(1, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(1, 2), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((3 : Rat) / 2) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(1, 2), (7, 1), (15, 3), (16, 1)],
  term (-8 : Rat) [(1, 2), (9, 1), (13, 1)],
  term (8 : Rat) [(1, 2), (9, 1), (15, 1)],
  term (4 : Rat) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(1, 2), (13, 1), (15, 1)],
  term ((-4 : Rat) / 3) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(1, 2), (15, 2)],
  term (-16 : Rat) [(2, 1), (3, 1), (6, 1), (13, 1)],
  term ((32 : Rat) / 3) [(2, 1), (3, 1), (6, 1), (15, 1), (16, 1)],
  term (-48 : Rat) [(2, 1), (5, 1), (6, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term (48 : Rat) [(2, 1), (5, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term (16 : Rat) [(2, 1), (5, 1), (6, 1), (13, 1)],
  term (-16 : Rat) [(2, 1), (5, 1), (6, 1), (15, 1)],
  term (6 : Rat) [(2, 1), (6, 1)],
  term (-48 : Rat) [(2, 1), (6, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(2, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(2, 1), (6, 1), (7, 1), (15, 3), (16, 1)],
  term (-16 : Rat) [(2, 1), (6, 1), (9, 1), (13, 1)],
  term (16 : Rat) [(2, 1), (6, 1), (9, 1), (15, 1)],
  term (8 : Rat) [(2, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(2, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term (-16 : Rat) [(2, 1), (6, 1), (13, 1), (15, 1)],
  term ((-8 : Rat) / 3) [(2, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(2, 1), (6, 1), (15, 2)],
  term (-12 : Rat) [(2, 1), (6, 2), (9, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(2, 2)],
  term (8 : Rat) [(2, 2), (3, 1), (13, 1)],
  term ((-16 : Rat) / 3) [(2, 2), (3, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(2, 2), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(2, 2), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(2, 2), (5, 1), (13, 1)],
  term (8 : Rat) [(2, 2), (5, 1), (15, 1)],
  term (6 : Rat) [(2, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(2, 2), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(2, 2), (7, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(2, 2), (7, 1), (15, 3), (16, 1)],
  term (8 : Rat) [(2, 2), (9, 1), (13, 1)],
  term (-8 : Rat) [(2, 2), (9, 1), (15, 1)],
  term (-4 : Rat) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(2, 2), (13, 1), (15, 1)],
  term ((4 : Rat) / 3) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(2, 2), (15, 2)],
  term (16 : Rat) [(3, 1), (5, 1), (7, 1), (13, 1)],
  term (-16 : Rat) [(3, 1), (5, 1), (7, 1), (15, 1)],
  term (-48 : Rat) [(3, 1), (5, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term (48 : Rat) [(3, 1), (5, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(3, 1), (6, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(3, 1), (7, 1)],
  term (-16 : Rat) [(3, 1), (7, 1), (9, 1), (13, 1)],
  term (16 : Rat) [(3, 1), (7, 1), (9, 1), (15, 1)],
  term (8 : Rat) [(3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term (-16 : Rat) [(3, 1), (7, 1), (13, 1), (15, 1)],
  term ((-8 : Rat) / 3) [(3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(3, 1), (7, 1), (15, 2)],
  term (-48 : Rat) [(3, 1), (7, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(3, 1), (7, 2), (15, 1), (16, 1)],
  term (-12 : Rat) [(3, 1), (7, 2), (15, 3), (16, 1)],
  term (-3 : Rat) [(3, 2)],
  term (24 : Rat) [(3, 2), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(3, 2), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(3, 2), (5, 1), (13, 1)],
  term (8 : Rat) [(3, 2), (5, 1), (15, 1)],
  term (6 : Rat) [(3, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(3, 2), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term (-16 : Rat) [(3, 2), (7, 1), (13, 1)],
  term ((55 : Rat) / 6) [(3, 2), (7, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(3, 2), (7, 1), (15, 3), (16, 1)],
  term (8 : Rat) [(3, 2), (9, 1), (13, 1)],
  term (-8 : Rat) [(3, 2), (9, 1), (15, 1)],
  term (-4 : Rat) [(3, 2), (9, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(3, 2), (13, 1), (15, 1)],
  term ((4 : Rat) / 3) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(3, 2), (15, 2)],
  term (8 : Rat) [(3, 3), (13, 1)],
  term ((-16 : Rat) / 3) [(3, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 17, terms 0 through 17. -/
theorem rs_R002_ueqv_R002YNYN_block_17_0000_0017_valid :
    checkProductSumEq rs_R002_ueqv_R002YNYN_partials_17_0000_0017
      rs_R002_ueqv_R002YNYN_block_17_0000_0017 = true := by
  native_decide

end R002UeqvR002YNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
