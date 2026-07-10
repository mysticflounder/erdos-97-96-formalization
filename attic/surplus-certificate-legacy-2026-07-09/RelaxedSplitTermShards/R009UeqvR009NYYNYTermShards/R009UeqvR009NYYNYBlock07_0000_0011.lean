/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NYYNY, term block 7:0-11

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NYYNYTermShards

/-- Generator polynomial 7 for relaxed split surplus certificate `R009:u=v:R009NYYNY`. -/
def rs_R009_ueqv_R009NYYNY_generator_07_0000_0011 : Poly :=
[
  term (-2 : Rat) [(0, 1), (2, 1)],
  term (2 : Rat) [(0, 1), (6, 1)],
  term (-2 : Rat) [(1, 1), (3, 1)],
  term (2 : Rat) [(1, 1), (7, 1)],
  term (1 : Rat) [(2, 2)],
  term (1 : Rat) [(3, 2)],
  term (-1 : Rat) [(6, 2)],
  term (-1 : Rat) [(7, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009NYYNY_coefficient_07_0000 : Poly :=
[
  term (-8 : Rat) [(1, 1), (3, 1)]
]

/-- Partial product 0 for generator 7. -/
def rs_R009_ueqv_R009NYYNY_partial_07_0000 : Poly :=
[
  term (16 : Rat) [(0, 1), (1, 1), (2, 1), (3, 1)],
  term (-16 : Rat) [(0, 1), (1, 1), (3, 1), (6, 1)],
  term (-8 : Rat) [(1, 1), (2, 2), (3, 1)],
  term (8 : Rat) [(1, 1), (3, 1), (6, 2)],
  term (8 : Rat) [(1, 1), (3, 1), (7, 2)],
  term (-8 : Rat) [(1, 1), (3, 3)],
  term (-16 : Rat) [(1, 2), (3, 1), (7, 1)],
  term (16 : Rat) [(1, 2), (3, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 7. -/
theorem rs_R009_ueqv_R009NYYNY_partial_07_0000_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_07_0000
        rs_R009_ueqv_R009NYYNY_generator_07_0000_0011 =
      rs_R009_ueqv_R009NYYNY_partial_07_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009NYYNY_coefficient_07_0001 : Poly :=
[
  term (-4 : Rat) [(1, 1), (7, 1)]
]

/-- Partial product 1 for generator 7. -/
def rs_R009_ueqv_R009NYYNY_partial_07_0001 : Poly :=
[
  term (8 : Rat) [(0, 1), (1, 1), (2, 1), (7, 1)],
  term (-8 : Rat) [(0, 1), (1, 1), (6, 1), (7, 1)],
  term (-4 : Rat) [(1, 1), (2, 2), (7, 1)],
  term (-4 : Rat) [(1, 1), (3, 2), (7, 1)],
  term (4 : Rat) [(1, 1), (6, 2), (7, 1)],
  term (4 : Rat) [(1, 1), (7, 3)],
  term (8 : Rat) [(1, 2), (3, 1), (7, 1)],
  term (-8 : Rat) [(1, 2), (7, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 7. -/
theorem rs_R009_ueqv_R009NYYNY_partial_07_0001_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_07_0001
        rs_R009_ueqv_R009NYYNY_generator_07_0000_0011 =
      rs_R009_ueqv_R009NYYNY_partial_07_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009NYYNY_coefficient_07_0002 : Poly :=
[
  term (20 : Rat) [(1, 1), (9, 1)]
]

/-- Partial product 2 for generator 7. -/
def rs_R009_ueqv_R009NYYNY_partial_07_0002 : Poly :=
[
  term (-40 : Rat) [(0, 1), (1, 1), (2, 1), (9, 1)],
  term (40 : Rat) [(0, 1), (1, 1), (6, 1), (9, 1)],
  term (20 : Rat) [(1, 1), (2, 2), (9, 1)],
  term (20 : Rat) [(1, 1), (3, 2), (9, 1)],
  term (-20 : Rat) [(1, 1), (6, 2), (9, 1)],
  term (-20 : Rat) [(1, 1), (7, 2), (9, 1)],
  term (-40 : Rat) [(1, 2), (3, 1), (9, 1)],
  term (40 : Rat) [(1, 2), (7, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 7. -/
theorem rs_R009_ueqv_R009NYYNY_partial_07_0002_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_07_0002
        rs_R009_ueqv_R009NYYNY_generator_07_0000_0011 =
      rs_R009_ueqv_R009NYYNY_partial_07_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009NYYNY_coefficient_07_0003 : Poly :=
[
  term (2 : Rat) [(3, 1), (7, 1), (14, 1)]
]

/-- Partial product 3 for generator 7. -/
def rs_R009_ueqv_R009NYYNY_partial_07_0003 : Poly :=
[
  term (-4 : Rat) [(0, 1), (2, 1), (3, 1), (7, 1), (14, 1)],
  term (4 : Rat) [(0, 1), (3, 1), (6, 1), (7, 1), (14, 1)],
  term (4 : Rat) [(1, 1), (3, 1), (7, 2), (14, 1)],
  term (-4 : Rat) [(1, 1), (3, 2), (7, 1), (14, 1)],
  term (2 : Rat) [(2, 2), (3, 1), (7, 1), (14, 1)],
  term (-2 : Rat) [(3, 1), (6, 2), (7, 1), (14, 1)],
  term (-2 : Rat) [(3, 1), (7, 3), (14, 1)],
  term (2 : Rat) [(3, 3), (7, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 7. -/
theorem rs_R009_ueqv_R009NYYNY_partial_07_0003_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_07_0003
        rs_R009_ueqv_R009NYYNY_generator_07_0000_0011 =
      rs_R009_ueqv_R009NYYNY_partial_07_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009NYYNY_coefficient_07_0004 : Poly :=
[
  term (-4 : Rat) [(3, 1), (9, 1), (14, 1)]
]

/-- Partial product 4 for generator 7. -/
def rs_R009_ueqv_R009NYYNY_partial_07_0004 : Poly :=
[
  term (8 : Rat) [(0, 1), (2, 1), (3, 1), (9, 1), (14, 1)],
  term (-8 : Rat) [(0, 1), (3, 1), (6, 1), (9, 1), (14, 1)],
  term (-8 : Rat) [(1, 1), (3, 1), (7, 1), (9, 1), (14, 1)],
  term (8 : Rat) [(1, 1), (3, 2), (9, 1), (14, 1)],
  term (-4 : Rat) [(2, 2), (3, 1), (9, 1), (14, 1)],
  term (4 : Rat) [(3, 1), (6, 2), (9, 1), (14, 1)],
  term (4 : Rat) [(3, 1), (7, 2), (9, 1), (14, 1)],
  term (-4 : Rat) [(3, 3), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 7. -/
theorem rs_R009_ueqv_R009NYYNY_partial_07_0004_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_07_0004
        rs_R009_ueqv_R009NYYNY_generator_07_0000_0011 =
      rs_R009_ueqv_R009NYYNY_partial_07_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009NYYNY_coefficient_07_0005 : Poly :=
[
  term (7 : Rat) [(3, 1), (15, 1)]
]

/-- Partial product 5 for generator 7. -/
def rs_R009_ueqv_R009NYYNY_partial_07_0005 : Poly :=
[
  term (-14 : Rat) [(0, 1), (2, 1), (3, 1), (15, 1)],
  term (14 : Rat) [(0, 1), (3, 1), (6, 1), (15, 1)],
  term (14 : Rat) [(1, 1), (3, 1), (7, 1), (15, 1)],
  term (-14 : Rat) [(1, 1), (3, 2), (15, 1)],
  term (7 : Rat) [(2, 2), (3, 1), (15, 1)],
  term (-7 : Rat) [(3, 1), (6, 2), (15, 1)],
  term (-7 : Rat) [(3, 1), (7, 2), (15, 1)],
  term (7 : Rat) [(3, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 7. -/
theorem rs_R009_ueqv_R009NYYNY_partial_07_0005_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_07_0005
        rs_R009_ueqv_R009NYYNY_generator_07_0000_0011 =
      rs_R009_ueqv_R009NYYNY_partial_07_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009NYYNY_coefficient_07_0006 : Poly :=
[
  term (-8 : Rat) [(7, 1), (14, 1), (15, 1)]
]

/-- Partial product 6 for generator 7. -/
def rs_R009_ueqv_R009NYYNY_partial_07_0006 : Poly :=
[
  term (16 : Rat) [(0, 1), (2, 1), (7, 1), (14, 1), (15, 1)],
  term (-16 : Rat) [(0, 1), (6, 1), (7, 1), (14, 1), (15, 1)],
  term (16 : Rat) [(1, 1), (3, 1), (7, 1), (14, 1), (15, 1)],
  term (-16 : Rat) [(1, 1), (7, 2), (14, 1), (15, 1)],
  term (-8 : Rat) [(2, 2), (7, 1), (14, 1), (15, 1)],
  term (-8 : Rat) [(3, 2), (7, 1), (14, 1), (15, 1)],
  term (8 : Rat) [(6, 2), (7, 1), (14, 1), (15, 1)],
  term (8 : Rat) [(7, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 7. -/
theorem rs_R009_ueqv_R009NYYNY_partial_07_0006_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_07_0006
        rs_R009_ueqv_R009NYYNY_generator_07_0000_0011 =
      rs_R009_ueqv_R009NYYNY_partial_07_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009NYYNY_coefficient_07_0007 : Poly :=
[
  term (3 : Rat) [(7, 1), (15, 1)]
]

/-- Partial product 7 for generator 7. -/
def rs_R009_ueqv_R009NYYNY_partial_07_0007 : Poly :=
[
  term (-6 : Rat) [(0, 1), (2, 1), (7, 1), (15, 1)],
  term (6 : Rat) [(0, 1), (6, 1), (7, 1), (15, 1)],
  term (-6 : Rat) [(1, 1), (3, 1), (7, 1), (15, 1)],
  term (6 : Rat) [(1, 1), (7, 2), (15, 1)],
  term (3 : Rat) [(2, 2), (7, 1), (15, 1)],
  term (3 : Rat) [(3, 2), (7, 1), (15, 1)],
  term (-3 : Rat) [(6, 2), (7, 1), (15, 1)],
  term (-3 : Rat) [(7, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 7. -/
theorem rs_R009_ueqv_R009NYYNY_partial_07_0007_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_07_0007
        rs_R009_ueqv_R009NYYNY_generator_07_0000_0011 =
      rs_R009_ueqv_R009NYYNY_partial_07_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009NYYNY_coefficient_07_0008 : Poly :=
[
  term (-6 : Rat) [(9, 1), (11, 1)]
]

/-- Partial product 8 for generator 7. -/
def rs_R009_ueqv_R009NYYNY_partial_07_0008 : Poly :=
[
  term (12 : Rat) [(0, 1), (2, 1), (9, 1), (11, 1)],
  term (-12 : Rat) [(0, 1), (6, 1), (9, 1), (11, 1)],
  term (12 : Rat) [(1, 1), (3, 1), (9, 1), (11, 1)],
  term (-12 : Rat) [(1, 1), (7, 1), (9, 1), (11, 1)],
  term (-6 : Rat) [(2, 2), (9, 1), (11, 1)],
  term (-6 : Rat) [(3, 2), (9, 1), (11, 1)],
  term (6 : Rat) [(6, 2), (9, 1), (11, 1)],
  term (6 : Rat) [(7, 2), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 7. -/
theorem rs_R009_ueqv_R009NYYNY_partial_07_0008_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_07_0008
        rs_R009_ueqv_R009NYYNY_generator_07_0000_0011 =
      rs_R009_ueqv_R009NYYNY_partial_07_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009NYYNY_coefficient_07_0009 : Poly :=
[
  term (16 : Rat) [(9, 1), (14, 1), (15, 1)]
]

/-- Partial product 9 for generator 7. -/
def rs_R009_ueqv_R009NYYNY_partial_07_0009 : Poly :=
[
  term (-32 : Rat) [(0, 1), (2, 1), (9, 1), (14, 1), (15, 1)],
  term (32 : Rat) [(0, 1), (6, 1), (9, 1), (14, 1), (15, 1)],
  term (-32 : Rat) [(1, 1), (3, 1), (9, 1), (14, 1), (15, 1)],
  term (32 : Rat) [(1, 1), (7, 1), (9, 1), (14, 1), (15, 1)],
  term (16 : Rat) [(2, 2), (9, 1), (14, 1), (15, 1)],
  term (16 : Rat) [(3, 2), (9, 1), (14, 1), (15, 1)],
  term (-16 : Rat) [(6, 2), (9, 1), (14, 1), (15, 1)],
  term (-16 : Rat) [(7, 2), (9, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 7. -/
theorem rs_R009_ueqv_R009NYYNY_partial_07_0009_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_07_0009
        rs_R009_ueqv_R009NYYNY_generator_07_0000_0011 =
      rs_R009_ueqv_R009NYYNY_partial_07_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009NYYNY_coefficient_07_0010 : Poly :=
[
  term (-9 : Rat) [(9, 1), (15, 1)]
]

/-- Partial product 10 for generator 7. -/
def rs_R009_ueqv_R009NYYNY_partial_07_0010 : Poly :=
[
  term (18 : Rat) [(0, 1), (2, 1), (9, 1), (15, 1)],
  term (-18 : Rat) [(0, 1), (6, 1), (9, 1), (15, 1)],
  term (18 : Rat) [(1, 1), (3, 1), (9, 1), (15, 1)],
  term (-18 : Rat) [(1, 1), (7, 1), (9, 1), (15, 1)],
  term (-9 : Rat) [(2, 2), (9, 1), (15, 1)],
  term (-9 : Rat) [(3, 2), (9, 1), (15, 1)],
  term (9 : Rat) [(6, 2), (9, 1), (15, 1)],
  term (9 : Rat) [(7, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 7. -/
theorem rs_R009_ueqv_R009NYYNY_partial_07_0010_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_07_0010
        rs_R009_ueqv_R009NYYNY_generator_07_0000_0011 =
      rs_R009_ueqv_R009NYYNY_partial_07_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 7. -/
def rs_R009_ueqv_R009NYYNY_coefficient_07_0011 : Poly :=
[
  term (-4 : Rat) [(15, 2)]
]

/-- Partial product 11 for generator 7. -/
def rs_R009_ueqv_R009NYYNY_partial_07_0011 : Poly :=
[
  term (8 : Rat) [(0, 1), (2, 1), (15, 2)],
  term (-8 : Rat) [(0, 1), (6, 1), (15, 2)],
  term (8 : Rat) [(1, 1), (3, 1), (15, 2)],
  term (-8 : Rat) [(1, 1), (7, 1), (15, 2)],
  term (-4 : Rat) [(2, 2), (15, 2)],
  term (-4 : Rat) [(3, 2), (15, 2)],
  term (4 : Rat) [(6, 2), (15, 2)],
  term (4 : Rat) [(7, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 7. -/
theorem rs_R009_ueqv_R009NYYNY_partial_07_0011_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_07_0011
        rs_R009_ueqv_R009NYYNY_generator_07_0000_0011 =
      rs_R009_ueqv_R009NYYNY_partial_07_0011 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NYYNY_partials_07_0000_0011 : List Poly :=
[
  rs_R009_ueqv_R009NYYNY_partial_07_0000,
  rs_R009_ueqv_R009NYYNY_partial_07_0001,
  rs_R009_ueqv_R009NYYNY_partial_07_0002,
  rs_R009_ueqv_R009NYYNY_partial_07_0003,
  rs_R009_ueqv_R009NYYNY_partial_07_0004,
  rs_R009_ueqv_R009NYYNY_partial_07_0005,
  rs_R009_ueqv_R009NYYNY_partial_07_0006,
  rs_R009_ueqv_R009NYYNY_partial_07_0007,
  rs_R009_ueqv_R009NYYNY_partial_07_0008,
  rs_R009_ueqv_R009NYYNY_partial_07_0009,
  rs_R009_ueqv_R009NYYNY_partial_07_0010,
  rs_R009_ueqv_R009NYYNY_partial_07_0011
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NYYNY_block_07_0000_0011 : Poly :=
[
  term (16 : Rat) [(0, 1), (1, 1), (2, 1), (3, 1)],
  term (8 : Rat) [(0, 1), (1, 1), (2, 1), (7, 1)],
  term (-40 : Rat) [(0, 1), (1, 1), (2, 1), (9, 1)],
  term (-16 : Rat) [(0, 1), (1, 1), (3, 1), (6, 1)],
  term (-8 : Rat) [(0, 1), (1, 1), (6, 1), (7, 1)],
  term (40 : Rat) [(0, 1), (1, 1), (6, 1), (9, 1)],
  term (-4 : Rat) [(0, 1), (2, 1), (3, 1), (7, 1), (14, 1)],
  term (8 : Rat) [(0, 1), (2, 1), (3, 1), (9, 1), (14, 1)],
  term (-14 : Rat) [(0, 1), (2, 1), (3, 1), (15, 1)],
  term (16 : Rat) [(0, 1), (2, 1), (7, 1), (14, 1), (15, 1)],
  term (-6 : Rat) [(0, 1), (2, 1), (7, 1), (15, 1)],
  term (12 : Rat) [(0, 1), (2, 1), (9, 1), (11, 1)],
  term (-32 : Rat) [(0, 1), (2, 1), (9, 1), (14, 1), (15, 1)],
  term (18 : Rat) [(0, 1), (2, 1), (9, 1), (15, 1)],
  term (8 : Rat) [(0, 1), (2, 1), (15, 2)],
  term (4 : Rat) [(0, 1), (3, 1), (6, 1), (7, 1), (14, 1)],
  term (-8 : Rat) [(0, 1), (3, 1), (6, 1), (9, 1), (14, 1)],
  term (14 : Rat) [(0, 1), (3, 1), (6, 1), (15, 1)],
  term (-16 : Rat) [(0, 1), (6, 1), (7, 1), (14, 1), (15, 1)],
  term (6 : Rat) [(0, 1), (6, 1), (7, 1), (15, 1)],
  term (-12 : Rat) [(0, 1), (6, 1), (9, 1), (11, 1)],
  term (32 : Rat) [(0, 1), (6, 1), (9, 1), (14, 1), (15, 1)],
  term (-18 : Rat) [(0, 1), (6, 1), (9, 1), (15, 1)],
  term (-8 : Rat) [(0, 1), (6, 1), (15, 2)],
  term (-8 : Rat) [(1, 1), (2, 2), (3, 1)],
  term (-4 : Rat) [(1, 1), (2, 2), (7, 1)],
  term (20 : Rat) [(1, 1), (2, 2), (9, 1)],
  term (8 : Rat) [(1, 1), (3, 1), (6, 2)],
  term (-8 : Rat) [(1, 1), (3, 1), (7, 1), (9, 1), (14, 1)],
  term (16 : Rat) [(1, 1), (3, 1), (7, 1), (14, 1), (15, 1)],
  term (8 : Rat) [(1, 1), (3, 1), (7, 1), (15, 1)],
  term (8 : Rat) [(1, 1), (3, 1), (7, 2)],
  term (4 : Rat) [(1, 1), (3, 1), (7, 2), (14, 1)],
  term (12 : Rat) [(1, 1), (3, 1), (9, 1), (11, 1)],
  term (-32 : Rat) [(1, 1), (3, 1), (9, 1), (14, 1), (15, 1)],
  term (18 : Rat) [(1, 1), (3, 1), (9, 1), (15, 1)],
  term (8 : Rat) [(1, 1), (3, 1), (15, 2)],
  term (-4 : Rat) [(1, 1), (3, 2), (7, 1)],
  term (-4 : Rat) [(1, 1), (3, 2), (7, 1), (14, 1)],
  term (20 : Rat) [(1, 1), (3, 2), (9, 1)],
  term (8 : Rat) [(1, 1), (3, 2), (9, 1), (14, 1)],
  term (-14 : Rat) [(1, 1), (3, 2), (15, 1)],
  term (-8 : Rat) [(1, 1), (3, 3)],
  term (4 : Rat) [(1, 1), (6, 2), (7, 1)],
  term (-20 : Rat) [(1, 1), (6, 2), (9, 1)],
  term (-12 : Rat) [(1, 1), (7, 1), (9, 1), (11, 1)],
  term (32 : Rat) [(1, 1), (7, 1), (9, 1), (14, 1), (15, 1)],
  term (-18 : Rat) [(1, 1), (7, 1), (9, 1), (15, 1)],
  term (-8 : Rat) [(1, 1), (7, 1), (15, 2)],
  term (-20 : Rat) [(1, 1), (7, 2), (9, 1)],
  term (-16 : Rat) [(1, 1), (7, 2), (14, 1), (15, 1)],
  term (6 : Rat) [(1, 1), (7, 2), (15, 1)],
  term (4 : Rat) [(1, 1), (7, 3)],
  term (-8 : Rat) [(1, 2), (3, 1), (7, 1)],
  term (-40 : Rat) [(1, 2), (3, 1), (9, 1)],
  term (16 : Rat) [(1, 2), (3, 2)],
  term (40 : Rat) [(1, 2), (7, 1), (9, 1)],
  term (-8 : Rat) [(1, 2), (7, 2)],
  term (2 : Rat) [(2, 2), (3, 1), (7, 1), (14, 1)],
  term (-4 : Rat) [(2, 2), (3, 1), (9, 1), (14, 1)],
  term (7 : Rat) [(2, 2), (3, 1), (15, 1)],
  term (-8 : Rat) [(2, 2), (7, 1), (14, 1), (15, 1)],
  term (3 : Rat) [(2, 2), (7, 1), (15, 1)],
  term (-6 : Rat) [(2, 2), (9, 1), (11, 1)],
  term (16 : Rat) [(2, 2), (9, 1), (14, 1), (15, 1)],
  term (-9 : Rat) [(2, 2), (9, 1), (15, 1)],
  term (-4 : Rat) [(2, 2), (15, 2)],
  term (-2 : Rat) [(3, 1), (6, 2), (7, 1), (14, 1)],
  term (4 : Rat) [(3, 1), (6, 2), (9, 1), (14, 1)],
  term (-7 : Rat) [(3, 1), (6, 2), (15, 1)],
  term (4 : Rat) [(3, 1), (7, 2), (9, 1), (14, 1)],
  term (-7 : Rat) [(3, 1), (7, 2), (15, 1)],
  term (-2 : Rat) [(3, 1), (7, 3), (14, 1)],
  term (-8 : Rat) [(3, 2), (7, 1), (14, 1), (15, 1)],
  term (3 : Rat) [(3, 2), (7, 1), (15, 1)],
  term (-6 : Rat) [(3, 2), (9, 1), (11, 1)],
  term (16 : Rat) [(3, 2), (9, 1), (14, 1), (15, 1)],
  term (-9 : Rat) [(3, 2), (9, 1), (15, 1)],
  term (-4 : Rat) [(3, 2), (15, 2)],
  term (2 : Rat) [(3, 3), (7, 1), (14, 1)],
  term (-4 : Rat) [(3, 3), (9, 1), (14, 1)],
  term (7 : Rat) [(3, 3), (15, 1)],
  term (8 : Rat) [(6, 2), (7, 1), (14, 1), (15, 1)],
  term (-3 : Rat) [(6, 2), (7, 1), (15, 1)],
  term (6 : Rat) [(6, 2), (9, 1), (11, 1)],
  term (-16 : Rat) [(6, 2), (9, 1), (14, 1), (15, 1)],
  term (9 : Rat) [(6, 2), (9, 1), (15, 1)],
  term (4 : Rat) [(6, 2), (15, 2)],
  term (6 : Rat) [(7, 2), (9, 1), (11, 1)],
  term (-16 : Rat) [(7, 2), (9, 1), (14, 1), (15, 1)],
  term (9 : Rat) [(7, 2), (9, 1), (15, 1)],
  term (4 : Rat) [(7, 2), (15, 2)],
  term (8 : Rat) [(7, 3), (14, 1), (15, 1)],
  term (-3 : Rat) [(7, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 7, terms 0 through 11. -/
theorem rs_R009_ueqv_R009NYYNY_block_07_0000_0011_valid :
    checkProductSumEq rs_R009_ueqv_R009NYYNY_partials_07_0000_0011
      rs_R009_ueqv_R009NYYNY_block_07_0000_0011 = true := by
  native_decide

end R009UeqvR009NYYNYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
