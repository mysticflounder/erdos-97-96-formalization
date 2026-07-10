/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R011:u=v:R011YYY, term block 7:0-9

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R011UeqvR011YYYTermShards

/-- Generator polynomial 7 for relaxed split surplus certificate `R011:u=v:R011YYY`. -/
def rs_R011_ueqv_R011YYY_generator_07_0000_0009 : Poly :=
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
def rs_R011_ueqv_R011YYY_coefficient_07_0000 : Poly :=
[
  term ((158972 : Rat) / 3405) [(1, 1), (11, 1), (16, 1)]
]

/-- Partial product 0 for generator 7. -/
def rs_R011_ueqv_R011YYY_partial_07_0000 : Poly :=
[
  term ((-317944 : Rat) / 3405) [(0, 1), (1, 1), (2, 1), (11, 1), (16, 1)],
  term ((317944 : Rat) / 3405) [(0, 1), (1, 1), (6, 1), (11, 1), (16, 1)],
  term ((158972 : Rat) / 3405) [(1, 1), (2, 2), (11, 1), (16, 1)],
  term ((158972 : Rat) / 3405) [(1, 1), (3, 2), (11, 1), (16, 1)],
  term ((-158972 : Rat) / 3405) [(1, 1), (6, 2), (11, 1), (16, 1)],
  term ((-158972 : Rat) / 3405) [(1, 1), (7, 2), (11, 1), (16, 1)],
  term ((-317944 : Rat) / 3405) [(1, 2), (3, 1), (11, 1), (16, 1)],
  term ((317944 : Rat) / 3405) [(1, 2), (7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 7. -/
theorem rs_R011_ueqv_R011YYY_partial_07_0000_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_07_0000
        rs_R011_ueqv_R011YYY_generator_07_0000_0009 =
      rs_R011_ueqv_R011YYY_partial_07_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 7. -/
def rs_R011_ueqv_R011YYY_coefficient_07_0001 : Poly :=
[
  term ((-158972 : Rat) / 3405) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 1 for generator 7. -/
def rs_R011_ueqv_R011YYY_partial_07_0001 : Poly :=
[
  term ((317944 : Rat) / 3405) [(0, 1), (1, 1), (2, 1), (15, 1), (16, 1)],
  term ((-317944 : Rat) / 3405) [(0, 1), (1, 1), (6, 1), (15, 1), (16, 1)],
  term ((-158972 : Rat) / 3405) [(1, 1), (2, 2), (15, 1), (16, 1)],
  term ((-158972 : Rat) / 3405) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((158972 : Rat) / 3405) [(1, 1), (6, 2), (15, 1), (16, 1)],
  term ((158972 : Rat) / 3405) [(1, 1), (7, 2), (15, 1), (16, 1)],
  term ((317944 : Rat) / 3405) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((-317944 : Rat) / 3405) [(1, 2), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 7. -/
theorem rs_R011_ueqv_R011YYY_partial_07_0001_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_07_0001
        rs_R011_ueqv_R011YYY_generator_07_0000_0009 =
      rs_R011_ueqv_R011YYY_partial_07_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 7. -/
def rs_R011_ueqv_R011YYY_coefficient_07_0002 : Poly :=
[
  term (4 : Rat) [(10, 1), (12, 1), (16, 1)]
]

/-- Partial product 2 for generator 7. -/
def rs_R011_ueqv_R011YYY_partial_07_0002 : Poly :=
[
  term (-8 : Rat) [(0, 1), (2, 1), (10, 1), (12, 1), (16, 1)],
  term (8 : Rat) [(0, 1), (6, 1), (10, 1), (12, 1), (16, 1)],
  term (-8 : Rat) [(1, 1), (3, 1), (10, 1), (12, 1), (16, 1)],
  term (8 : Rat) [(1, 1), (7, 1), (10, 1), (12, 1), (16, 1)],
  term (4 : Rat) [(2, 2), (10, 1), (12, 1), (16, 1)],
  term (4 : Rat) [(3, 2), (10, 1), (12, 1), (16, 1)],
  term (-4 : Rat) [(6, 2), (10, 1), (12, 1), (16, 1)],
  term (-4 : Rat) [(7, 2), (10, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 7. -/
theorem rs_R011_ueqv_R011YYY_partial_07_0002_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_07_0002
        rs_R011_ueqv_R011YYY_generator_07_0000_0009 =
      rs_R011_ueqv_R011YYY_partial_07_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 7. -/
def rs_R011_ueqv_R011YYY_coefficient_07_0003 : Poly :=
[
  term (-4 : Rat) [(10, 1), (16, 1)]
]

/-- Partial product 3 for generator 7. -/
def rs_R011_ueqv_R011YYY_partial_07_0003 : Poly :=
[
  term (8 : Rat) [(0, 1), (2, 1), (10, 1), (16, 1)],
  term (-8 : Rat) [(0, 1), (6, 1), (10, 1), (16, 1)],
  term (8 : Rat) [(1, 1), (3, 1), (10, 1), (16, 1)],
  term (-8 : Rat) [(1, 1), (7, 1), (10, 1), (16, 1)],
  term (-4 : Rat) [(2, 2), (10, 1), (16, 1)],
  term (-4 : Rat) [(3, 2), (10, 1), (16, 1)],
  term (4 : Rat) [(6, 2), (10, 1), (16, 1)],
  term (4 : Rat) [(7, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 7. -/
theorem rs_R011_ueqv_R011YYY_partial_07_0003_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_07_0003
        rs_R011_ueqv_R011YYY_generator_07_0000_0009 =
      rs_R011_ueqv_R011YYY_partial_07_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 7. -/
def rs_R011_ueqv_R011YYY_coefficient_07_0004 : Poly :=
[
  term (-28 : Rat) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 4 for generator 7. -/
def rs_R011_ueqv_R011YYY_partial_07_0004 : Poly :=
[
  term (56 : Rat) [(0, 1), (2, 1), (11, 1), (13, 1), (16, 1)],
  term (-56 : Rat) [(0, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term (56 : Rat) [(1, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term (-56 : Rat) [(1, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term (-28 : Rat) [(2, 2), (11, 1), (13, 1), (16, 1)],
  term (-28 : Rat) [(3, 2), (11, 1), (13, 1), (16, 1)],
  term (28 : Rat) [(6, 2), (11, 1), (13, 1), (16, 1)],
  term (28 : Rat) [(7, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 7. -/
theorem rs_R011_ueqv_R011YYY_partial_07_0004_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_07_0004
        rs_R011_ueqv_R011YYY_generator_07_0000_0009 =
      rs_R011_ueqv_R011YYY_partial_07_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 7. -/
def rs_R011_ueqv_R011YYY_coefficient_07_0005 : Poly :=
[
  term ((-512 : Rat) / 681) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 5 for generator 7. -/
def rs_R011_ueqv_R011YYY_partial_07_0005 : Poly :=
[
  term ((1024 : Rat) / 681) [(0, 1), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1024 : Rat) / 681) [(0, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((1024 : Rat) / 681) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1024 : Rat) / 681) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-512 : Rat) / 681) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((-512 : Rat) / 681) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((512 : Rat) / 681) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term ((512 : Rat) / 681) [(7, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 7. -/
theorem rs_R011_ueqv_R011YYY_partial_07_0005_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_07_0005
        rs_R011_ueqv_R011YYY_generator_07_0000_0009 =
      rs_R011_ueqv_R011YYY_partial_07_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 7. -/
def rs_R011_ueqv_R011YYY_coefficient_07_0006 : Poly :=
[
  term ((512 : Rat) / 681) [(11, 2), (16, 1)]
]

/-- Partial product 6 for generator 7. -/
def rs_R011_ueqv_R011YYY_partial_07_0006 : Poly :=
[
  term ((-1024 : Rat) / 681) [(0, 1), (2, 1), (11, 2), (16, 1)],
  term ((1024 : Rat) / 681) [(0, 1), (6, 1), (11, 2), (16, 1)],
  term ((-1024 : Rat) / 681) [(1, 1), (3, 1), (11, 2), (16, 1)],
  term ((1024 : Rat) / 681) [(1, 1), (7, 1), (11, 2), (16, 1)],
  term ((512 : Rat) / 681) [(2, 2), (11, 2), (16, 1)],
  term ((512 : Rat) / 681) [(3, 2), (11, 2), (16, 1)],
  term ((-512 : Rat) / 681) [(6, 2), (11, 2), (16, 1)],
  term ((-512 : Rat) / 681) [(7, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 7. -/
theorem rs_R011_ueqv_R011YYY_partial_07_0006_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_07_0006
        rs_R011_ueqv_R011YYY_generator_07_0000_0009 =
      rs_R011_ueqv_R011YYY_partial_07_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 7. -/
def rs_R011_ueqv_R011YYY_coefficient_07_0007 : Poly :=
[
  term (-4 : Rat) [(12, 1), (14, 1), (16, 1)]
]

/-- Partial product 7 for generator 7. -/
def rs_R011_ueqv_R011YYY_partial_07_0007 : Poly :=
[
  term (8 : Rat) [(0, 1), (2, 1), (12, 1), (14, 1), (16, 1)],
  term (-8 : Rat) [(0, 1), (6, 1), (12, 1), (14, 1), (16, 1)],
  term (8 : Rat) [(1, 1), (3, 1), (12, 1), (14, 1), (16, 1)],
  term (-8 : Rat) [(1, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term (-4 : Rat) [(2, 2), (12, 1), (14, 1), (16, 1)],
  term (-4 : Rat) [(3, 2), (12, 1), (14, 1), (16, 1)],
  term (4 : Rat) [(6, 2), (12, 1), (14, 1), (16, 1)],
  term (4 : Rat) [(7, 2), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 7. -/
theorem rs_R011_ueqv_R011YYY_partial_07_0007_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_07_0007
        rs_R011_ueqv_R011YYY_generator_07_0000_0009 =
      rs_R011_ueqv_R011YYY_partial_07_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 7. -/
def rs_R011_ueqv_R011YYY_coefficient_07_0008 : Poly :=
[
  term (28 : Rat) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 8 for generator 7. -/
def rs_R011_ueqv_R011YYY_partial_07_0008 : Poly :=
[
  term (-56 : Rat) [(0, 1), (2, 1), (13, 1), (15, 1), (16, 1)],
  term (56 : Rat) [(0, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term (-56 : Rat) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term (56 : Rat) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term (28 : Rat) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term (28 : Rat) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term (-28 : Rat) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term (-28 : Rat) [(7, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 7. -/
theorem rs_R011_ueqv_R011YYY_partial_07_0008_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_07_0008
        rs_R011_ueqv_R011YYY_generator_07_0000_0009 =
      rs_R011_ueqv_R011YYY_partial_07_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 7. -/
def rs_R011_ueqv_R011YYY_coefficient_07_0009 : Poly :=
[
  term (4 : Rat) [(14, 1), (16, 1)]
]

/-- Partial product 9 for generator 7. -/
def rs_R011_ueqv_R011YYY_partial_07_0009 : Poly :=
[
  term (-8 : Rat) [(0, 1), (2, 1), (14, 1), (16, 1)],
  term (8 : Rat) [(0, 1), (6, 1), (14, 1), (16, 1)],
  term (-8 : Rat) [(1, 1), (3, 1), (14, 1), (16, 1)],
  term (8 : Rat) [(1, 1), (7, 1), (14, 1), (16, 1)],
  term (4 : Rat) [(2, 2), (14, 1), (16, 1)],
  term (4 : Rat) [(3, 2), (14, 1), (16, 1)],
  term (-4 : Rat) [(6, 2), (14, 1), (16, 1)],
  term (-4 : Rat) [(7, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 7. -/
theorem rs_R011_ueqv_R011YYY_partial_07_0009_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_07_0009
        rs_R011_ueqv_R011YYY_generator_07_0000_0009 =
      rs_R011_ueqv_R011YYY_partial_07_0009 := by
  native_decide

/-- Partial products in this block. -/
def rs_R011_ueqv_R011YYY_partials_07_0000_0009 : List Poly :=
[
  rs_R011_ueqv_R011YYY_partial_07_0000,
  rs_R011_ueqv_R011YYY_partial_07_0001,
  rs_R011_ueqv_R011YYY_partial_07_0002,
  rs_R011_ueqv_R011YYY_partial_07_0003,
  rs_R011_ueqv_R011YYY_partial_07_0004,
  rs_R011_ueqv_R011YYY_partial_07_0005,
  rs_R011_ueqv_R011YYY_partial_07_0006,
  rs_R011_ueqv_R011YYY_partial_07_0007,
  rs_R011_ueqv_R011YYY_partial_07_0008,
  rs_R011_ueqv_R011YYY_partial_07_0009
]

/-- Sum of partial products in this block. -/
def rs_R011_ueqv_R011YYY_block_07_0000_0009 : Poly :=
[
  term ((-317944 : Rat) / 3405) [(0, 1), (1, 1), (2, 1), (11, 1), (16, 1)],
  term ((317944 : Rat) / 3405) [(0, 1), (1, 1), (2, 1), (15, 1), (16, 1)],
  term ((317944 : Rat) / 3405) [(0, 1), (1, 1), (6, 1), (11, 1), (16, 1)],
  term ((-317944 : Rat) / 3405) [(0, 1), (1, 1), (6, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(0, 1), (2, 1), (10, 1), (12, 1), (16, 1)],
  term (8 : Rat) [(0, 1), (2, 1), (10, 1), (16, 1)],
  term (56 : Rat) [(0, 1), (2, 1), (11, 1), (13, 1), (16, 1)],
  term ((1024 : Rat) / 681) [(0, 1), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1024 : Rat) / 681) [(0, 1), (2, 1), (11, 2), (16, 1)],
  term (8 : Rat) [(0, 1), (2, 1), (12, 1), (14, 1), (16, 1)],
  term (-56 : Rat) [(0, 1), (2, 1), (13, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(0, 1), (2, 1), (14, 1), (16, 1)],
  term (8 : Rat) [(0, 1), (6, 1), (10, 1), (12, 1), (16, 1)],
  term (-8 : Rat) [(0, 1), (6, 1), (10, 1), (16, 1)],
  term (-56 : Rat) [(0, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1024 : Rat) / 681) [(0, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((1024 : Rat) / 681) [(0, 1), (6, 1), (11, 2), (16, 1)],
  term (-8 : Rat) [(0, 1), (6, 1), (12, 1), (14, 1), (16, 1)],
  term (56 : Rat) [(0, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(0, 1), (6, 1), (14, 1), (16, 1)],
  term ((158972 : Rat) / 3405) [(1, 1), (2, 2), (11, 1), (16, 1)],
  term ((-158972 : Rat) / 3405) [(1, 1), (2, 2), (15, 1), (16, 1)],
  term (-8 : Rat) [(1, 1), (3, 1), (10, 1), (12, 1), (16, 1)],
  term (8 : Rat) [(1, 1), (3, 1), (10, 1), (16, 1)],
  term (56 : Rat) [(1, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((1024 : Rat) / 681) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1024 : Rat) / 681) [(1, 1), (3, 1), (11, 2), (16, 1)],
  term (8 : Rat) [(1, 1), (3, 1), (12, 1), (14, 1), (16, 1)],
  term (-56 : Rat) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(1, 1), (3, 1), (14, 1), (16, 1)],
  term ((158972 : Rat) / 3405) [(1, 1), (3, 2), (11, 1), (16, 1)],
  term ((-158972 : Rat) / 3405) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((-158972 : Rat) / 3405) [(1, 1), (6, 2), (11, 1), (16, 1)],
  term ((158972 : Rat) / 3405) [(1, 1), (6, 2), (15, 1), (16, 1)],
  term (8 : Rat) [(1, 1), (7, 1), (10, 1), (12, 1), (16, 1)],
  term (-8 : Rat) [(1, 1), (7, 1), (10, 1), (16, 1)],
  term (-56 : Rat) [(1, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1024 : Rat) / 681) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((1024 : Rat) / 681) [(1, 1), (7, 1), (11, 2), (16, 1)],
  term (-8 : Rat) [(1, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term (56 : Rat) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(1, 1), (7, 1), (14, 1), (16, 1)],
  term ((-158972 : Rat) / 3405) [(1, 1), (7, 2), (11, 1), (16, 1)],
  term ((158972 : Rat) / 3405) [(1, 1), (7, 2), (15, 1), (16, 1)],
  term ((-317944 : Rat) / 3405) [(1, 2), (3, 1), (11, 1), (16, 1)],
  term ((317944 : Rat) / 3405) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((317944 : Rat) / 3405) [(1, 2), (7, 1), (11, 1), (16, 1)],
  term ((-317944 : Rat) / 3405) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(2, 2), (10, 1), (12, 1), (16, 1)],
  term (-4 : Rat) [(2, 2), (10, 1), (16, 1)],
  term (-28 : Rat) [(2, 2), (11, 1), (13, 1), (16, 1)],
  term ((-512 : Rat) / 681) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((512 : Rat) / 681) [(2, 2), (11, 2), (16, 1)],
  term (-4 : Rat) [(2, 2), (12, 1), (14, 1), (16, 1)],
  term (28 : Rat) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(2, 2), (14, 1), (16, 1)],
  term (4 : Rat) [(3, 2), (10, 1), (12, 1), (16, 1)],
  term (-4 : Rat) [(3, 2), (10, 1), (16, 1)],
  term (-28 : Rat) [(3, 2), (11, 1), (13, 1), (16, 1)],
  term ((-512 : Rat) / 681) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((512 : Rat) / 681) [(3, 2), (11, 2), (16, 1)],
  term (-4 : Rat) [(3, 2), (12, 1), (14, 1), (16, 1)],
  term (28 : Rat) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(3, 2), (14, 1), (16, 1)],
  term (-4 : Rat) [(6, 2), (10, 1), (12, 1), (16, 1)],
  term (4 : Rat) [(6, 2), (10, 1), (16, 1)],
  term (28 : Rat) [(6, 2), (11, 1), (13, 1), (16, 1)],
  term ((512 : Rat) / 681) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-512 : Rat) / 681) [(6, 2), (11, 2), (16, 1)],
  term (4 : Rat) [(6, 2), (12, 1), (14, 1), (16, 1)],
  term (-28 : Rat) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(6, 2), (14, 1), (16, 1)],
  term (-4 : Rat) [(7, 2), (10, 1), (12, 1), (16, 1)],
  term (4 : Rat) [(7, 2), (10, 1), (16, 1)],
  term (28 : Rat) [(7, 2), (11, 1), (13, 1), (16, 1)],
  term ((512 : Rat) / 681) [(7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-512 : Rat) / 681) [(7, 2), (11, 2), (16, 1)],
  term (4 : Rat) [(7, 2), (12, 1), (14, 1), (16, 1)],
  term (-28 : Rat) [(7, 2), (13, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(7, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 7, terms 0 through 9. -/
theorem rs_R011_ueqv_R011YYY_block_07_0000_0009_valid :
    checkProductSumEq rs_R011_ueqv_R011YYY_partials_07_0000_0009
      rs_R011_ueqv_R011YYY_block_07_0000_0009 = true := by
  native_decide

end R011UeqvR011YYYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
