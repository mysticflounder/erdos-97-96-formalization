/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R003:u=v:R003YY, term block 22:0-8

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R003UeqvR003YYTermShards

/-- Generator polynomial 22 for relaxed split surplus certificate `R003:u=v:R003YY`. -/
def rs_R003_ueqv_R003YY_generator_22_0000_0008 : Poly :=
[
  term (-2 : Rat) [(0, 1), (10, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (11, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(2, 1), (10, 1)],
  term (-1 : Rat) [(2, 2)],
  term (2 : Rat) [(3, 1), (11, 1)],
  term (-1 : Rat) [(3, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 22. -/
def rs_R003_ueqv_R003YY_coefficient_22_0000 : Poly :=
[
  term ((-9 : Rat) / 20) [(0, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 0 for generator 22. -/
def rs_R003_ueqv_R003YY_partial_22_0000 : Poly :=
[
  term ((9 : Rat) / 10) [(0, 1), (1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-9 : Rat) / 20) [(0, 1), (1, 2), (7, 1), (15, 1), (16, 1)],
  term ((-9 : Rat) / 10) [(0, 1), (2, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((9 : Rat) / 20) [(0, 1), (2, 2), (7, 1), (15, 1), (16, 1)],
  term ((-9 : Rat) / 10) [(0, 1), (3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((9 : Rat) / 20) [(0, 1), (3, 2), (7, 1), (15, 1), (16, 1)],
  term ((9 : Rat) / 10) [(0, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-9 : Rat) / 20) [(0, 3), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 22. -/
theorem rs_R003_ueqv_R003YY_partial_22_0000_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_22_0000
        rs_R003_ueqv_R003YY_generator_22_0000_0008 =
      rs_R003_ueqv_R003YY_partial_22_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 22. -/
def rs_R003_ueqv_R003YY_coefficient_22_0001 : Poly :=
[
  term ((-27 : Rat) / 20) [(0, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 1 for generator 22. -/
def rs_R003_ueqv_R003YY_partial_22_0001 : Poly :=
[
  term ((27 : Rat) / 10) [(0, 1), (1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-27 : Rat) / 20) [(0, 1), (1, 2), (9, 1), (15, 1), (16, 1)],
  term ((-27 : Rat) / 10) [(0, 1), (2, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((27 : Rat) / 20) [(0, 1), (2, 2), (9, 1), (15, 1), (16, 1)],
  term ((-27 : Rat) / 10) [(0, 1), (3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((27 : Rat) / 20) [(0, 1), (3, 2), (9, 1), (15, 1), (16, 1)],
  term ((27 : Rat) / 10) [(0, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-27 : Rat) / 20) [(0, 3), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 22. -/
theorem rs_R003_ueqv_R003YY_partial_22_0001_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_22_0001
        rs_R003_ueqv_R003YY_generator_22_0000_0008 =
      rs_R003_ueqv_R003YY_partial_22_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 22. -/
def rs_R003_ueqv_R003YY_coefficient_22_0002 : Poly :=
[
  term ((18 : Rat) / 5) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 2 for generator 22. -/
def rs_R003_ueqv_R003YY_partial_22_0002 : Poly :=
[
  term ((-36 : Rat) / 5) [(0, 1), (1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((18 : Rat) / 5) [(0, 1), (1, 2), (13, 1), (15, 1), (16, 1)],
  term ((36 : Rat) / 5) [(0, 1), (2, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-18 : Rat) / 5) [(0, 1), (2, 2), (13, 1), (15, 1), (16, 1)],
  term ((36 : Rat) / 5) [(0, 1), (3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-18 : Rat) / 5) [(0, 1), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-36 : Rat) / 5) [(0, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((18 : Rat) / 5) [(0, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 22. -/
theorem rs_R003_ueqv_R003YY_partial_22_0002_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_22_0002
        rs_R003_ueqv_R003YY_generator_22_0000_0008 =
      rs_R003_ueqv_R003YY_partial_22_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 22. -/
def rs_R003_ueqv_R003YY_coefficient_22_0003 : Poly :=
[
  term ((-81 : Rat) / 20) [(7, 1), (15, 1)]
]

/-- Partial product 3 for generator 22. -/
def rs_R003_ueqv_R003YY_partial_22_0003 : Poly :=
[
  term ((81 : Rat) / 10) [(0, 1), (7, 1), (10, 1), (15, 1)],
  term ((-81 : Rat) / 20) [(0, 2), (7, 1), (15, 1)],
  term ((81 : Rat) / 10) [(1, 1), (7, 1), (11, 1), (15, 1)],
  term ((-81 : Rat) / 20) [(1, 2), (7, 1), (15, 1)],
  term ((-81 : Rat) / 10) [(2, 1), (7, 1), (10, 1), (15, 1)],
  term ((81 : Rat) / 20) [(2, 2), (7, 1), (15, 1)],
  term ((-81 : Rat) / 10) [(3, 1), (7, 1), (11, 1), (15, 1)],
  term ((81 : Rat) / 20) [(3, 2), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 22. -/
theorem rs_R003_ueqv_R003YY_partial_22_0003_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_22_0003
        rs_R003_ueqv_R003YY_generator_22_0000_0008 =
      rs_R003_ueqv_R003YY_partial_22_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 22. -/
def rs_R003_ueqv_R003YY_coefficient_22_0004 : Poly :=
[
  term ((9 : Rat) / 20) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 4 for generator 22. -/
def rs_R003_ueqv_R003YY_partial_22_0004 : Poly :=
[
  term ((-9 : Rat) / 10) [(0, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((9 : Rat) / 20) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((-9 : Rat) / 10) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((9 : Rat) / 20) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((9 : Rat) / 10) [(2, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-9 : Rat) / 20) [(2, 2), (7, 1), (15, 1), (16, 1)],
  term ((9 : Rat) / 10) [(3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-9 : Rat) / 20) [(3, 2), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 22. -/
theorem rs_R003_ueqv_R003YY_partial_22_0004_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_22_0004
        rs_R003_ueqv_R003YY_generator_22_0000_0008 =
      rs_R003_ueqv_R003YY_partial_22_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 22. -/
def rs_R003_ueqv_R003YY_coefficient_22_0005 : Poly :=
[
  term ((-243 : Rat) / 20) [(9, 1), (15, 1)]
]

/-- Partial product 5 for generator 22. -/
def rs_R003_ueqv_R003YY_partial_22_0005 : Poly :=
[
  term ((243 : Rat) / 10) [(0, 1), (9, 1), (10, 1), (15, 1)],
  term ((-243 : Rat) / 20) [(0, 2), (9, 1), (15, 1)],
  term ((243 : Rat) / 10) [(1, 1), (9, 1), (11, 1), (15, 1)],
  term ((-243 : Rat) / 20) [(1, 2), (9, 1), (15, 1)],
  term ((-243 : Rat) / 10) [(2, 1), (9, 1), (10, 1), (15, 1)],
  term ((243 : Rat) / 20) [(2, 2), (9, 1), (15, 1)],
  term ((-243 : Rat) / 10) [(3, 1), (9, 1), (11, 1), (15, 1)],
  term ((243 : Rat) / 20) [(3, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 22. -/
theorem rs_R003_ueqv_R003YY_partial_22_0005_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_22_0005
        rs_R003_ueqv_R003YY_generator_22_0000_0008 =
      rs_R003_ueqv_R003YY_partial_22_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 22. -/
def rs_R003_ueqv_R003YY_coefficient_22_0006 : Poly :=
[
  term ((27 : Rat) / 20) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 6 for generator 22. -/
def rs_R003_ueqv_R003YY_partial_22_0006 : Poly :=
[
  term ((-27 : Rat) / 10) [(0, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((27 : Rat) / 20) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((-27 : Rat) / 10) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((27 : Rat) / 20) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((27 : Rat) / 10) [(2, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-27 : Rat) / 20) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((27 : Rat) / 10) [(3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-27 : Rat) / 20) [(3, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 22. -/
theorem rs_R003_ueqv_R003YY_partial_22_0006_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_22_0006
        rs_R003_ueqv_R003YY_generator_22_0000_0008 =
      rs_R003_ueqv_R003YY_partial_22_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 22. -/
def rs_R003_ueqv_R003YY_coefficient_22_0007 : Poly :=
[
  term ((162 : Rat) / 5) [(13, 1), (15, 1)]
]

/-- Partial product 7 for generator 22. -/
def rs_R003_ueqv_R003YY_partial_22_0007 : Poly :=
[
  term ((-324 : Rat) / 5) [(0, 1), (10, 1), (13, 1), (15, 1)],
  term ((162 : Rat) / 5) [(0, 2), (13, 1), (15, 1)],
  term ((-324 : Rat) / 5) [(1, 1), (11, 1), (13, 1), (15, 1)],
  term ((162 : Rat) / 5) [(1, 2), (13, 1), (15, 1)],
  term ((324 : Rat) / 5) [(2, 1), (10, 1), (13, 1), (15, 1)],
  term ((-162 : Rat) / 5) [(2, 2), (13, 1), (15, 1)],
  term ((324 : Rat) / 5) [(3, 1), (11, 1), (13, 1), (15, 1)],
  term ((-162 : Rat) / 5) [(3, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 22. -/
theorem rs_R003_ueqv_R003YY_partial_22_0007_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_22_0007
        rs_R003_ueqv_R003YY_generator_22_0000_0008 =
      rs_R003_ueqv_R003YY_partial_22_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 22. -/
def rs_R003_ueqv_R003YY_coefficient_22_0008 : Poly :=
[
  term ((-18 : Rat) / 5) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 8 for generator 22. -/
def rs_R003_ueqv_R003YY_partial_22_0008 : Poly :=
[
  term ((36 : Rat) / 5) [(0, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-18 : Rat) / 5) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((36 : Rat) / 5) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-18 : Rat) / 5) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-36 : Rat) / 5) [(2, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((18 : Rat) / 5) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((-36 : Rat) / 5) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((18 : Rat) / 5) [(3, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 22. -/
theorem rs_R003_ueqv_R003YY_partial_22_0008_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_22_0008
        rs_R003_ueqv_R003YY_generator_22_0000_0008 =
      rs_R003_ueqv_R003YY_partial_22_0008 := by
  native_decide

/-- Partial products in this block. -/
def rs_R003_ueqv_R003YY_partials_22_0000_0008 : List Poly :=
[
  rs_R003_ueqv_R003YY_partial_22_0000,
  rs_R003_ueqv_R003YY_partial_22_0001,
  rs_R003_ueqv_R003YY_partial_22_0002,
  rs_R003_ueqv_R003YY_partial_22_0003,
  rs_R003_ueqv_R003YY_partial_22_0004,
  rs_R003_ueqv_R003YY_partial_22_0005,
  rs_R003_ueqv_R003YY_partial_22_0006,
  rs_R003_ueqv_R003YY_partial_22_0007,
  rs_R003_ueqv_R003YY_partial_22_0008
]

/-- Sum of partial products in this block. -/
def rs_R003_ueqv_R003YY_block_22_0000_0008 : Poly :=
[
  term ((9 : Rat) / 10) [(0, 1), (1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((27 : Rat) / 10) [(0, 1), (1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-36 : Rat) / 5) [(0, 1), (1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-9 : Rat) / 20) [(0, 1), (1, 2), (7, 1), (15, 1), (16, 1)],
  term ((-27 : Rat) / 20) [(0, 1), (1, 2), (9, 1), (15, 1), (16, 1)],
  term ((18 : Rat) / 5) [(0, 1), (1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-9 : Rat) / 10) [(0, 1), (2, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-27 : Rat) / 10) [(0, 1), (2, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((36 : Rat) / 5) [(0, 1), (2, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((9 : Rat) / 20) [(0, 1), (2, 2), (7, 1), (15, 1), (16, 1)],
  term ((27 : Rat) / 20) [(0, 1), (2, 2), (9, 1), (15, 1), (16, 1)],
  term ((-18 : Rat) / 5) [(0, 1), (2, 2), (13, 1), (15, 1), (16, 1)],
  term ((-9 : Rat) / 10) [(0, 1), (3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-27 : Rat) / 10) [(0, 1), (3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((36 : Rat) / 5) [(0, 1), (3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((9 : Rat) / 20) [(0, 1), (3, 2), (7, 1), (15, 1), (16, 1)],
  term ((27 : Rat) / 20) [(0, 1), (3, 2), (9, 1), (15, 1), (16, 1)],
  term ((-18 : Rat) / 5) [(0, 1), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((81 : Rat) / 10) [(0, 1), (7, 1), (10, 1), (15, 1)],
  term ((-9 : Rat) / 10) [(0, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((243 : Rat) / 10) [(0, 1), (9, 1), (10, 1), (15, 1)],
  term ((-27 : Rat) / 10) [(0, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-324 : Rat) / 5) [(0, 1), (10, 1), (13, 1), (15, 1)],
  term ((36 : Rat) / 5) [(0, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((9 : Rat) / 10) [(0, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-81 : Rat) / 20) [(0, 2), (7, 1), (15, 1)],
  term ((9 : Rat) / 20) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((27 : Rat) / 10) [(0, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-243 : Rat) / 20) [(0, 2), (9, 1), (15, 1)],
  term ((27 : Rat) / 20) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((-36 : Rat) / 5) [(0, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((162 : Rat) / 5) [(0, 2), (13, 1), (15, 1)],
  term ((-18 : Rat) / 5) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-9 : Rat) / 20) [(0, 3), (7, 1), (15, 1), (16, 1)],
  term ((-27 : Rat) / 20) [(0, 3), (9, 1), (15, 1), (16, 1)],
  term ((18 : Rat) / 5) [(0, 3), (13, 1), (15, 1), (16, 1)],
  term ((81 : Rat) / 10) [(1, 1), (7, 1), (11, 1), (15, 1)],
  term ((-9 : Rat) / 10) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((243 : Rat) / 10) [(1, 1), (9, 1), (11, 1), (15, 1)],
  term ((-27 : Rat) / 10) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-324 : Rat) / 5) [(1, 1), (11, 1), (13, 1), (15, 1)],
  term ((36 : Rat) / 5) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-81 : Rat) / 20) [(1, 2), (7, 1), (15, 1)],
  term ((9 : Rat) / 20) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((-243 : Rat) / 20) [(1, 2), (9, 1), (15, 1)],
  term ((27 : Rat) / 20) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((162 : Rat) / 5) [(1, 2), (13, 1), (15, 1)],
  term ((-18 : Rat) / 5) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-81 : Rat) / 10) [(2, 1), (7, 1), (10, 1), (15, 1)],
  term ((9 : Rat) / 10) [(2, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-243 : Rat) / 10) [(2, 1), (9, 1), (10, 1), (15, 1)],
  term ((27 : Rat) / 10) [(2, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((324 : Rat) / 5) [(2, 1), (10, 1), (13, 1), (15, 1)],
  term ((-36 : Rat) / 5) [(2, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((81 : Rat) / 20) [(2, 2), (7, 1), (15, 1)],
  term ((-9 : Rat) / 20) [(2, 2), (7, 1), (15, 1), (16, 1)],
  term ((243 : Rat) / 20) [(2, 2), (9, 1), (15, 1)],
  term ((-27 : Rat) / 20) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((-162 : Rat) / 5) [(2, 2), (13, 1), (15, 1)],
  term ((18 : Rat) / 5) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((-81 : Rat) / 10) [(3, 1), (7, 1), (11, 1), (15, 1)],
  term ((9 : Rat) / 10) [(3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-243 : Rat) / 10) [(3, 1), (9, 1), (11, 1), (15, 1)],
  term ((27 : Rat) / 10) [(3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((324 : Rat) / 5) [(3, 1), (11, 1), (13, 1), (15, 1)],
  term ((-36 : Rat) / 5) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((81 : Rat) / 20) [(3, 2), (7, 1), (15, 1)],
  term ((-9 : Rat) / 20) [(3, 2), (7, 1), (15, 1), (16, 1)],
  term ((243 : Rat) / 20) [(3, 2), (9, 1), (15, 1)],
  term ((-27 : Rat) / 20) [(3, 2), (9, 1), (15, 1), (16, 1)],
  term ((-162 : Rat) / 5) [(3, 2), (13, 1), (15, 1)],
  term ((18 : Rat) / 5) [(3, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 22, terms 0 through 8. -/
theorem rs_R003_ueqv_R003YY_block_22_0000_0008_valid :
    checkProductSumEq rs_R003_ueqv_R003YY_partials_22_0000_0008
      rs_R003_ueqv_R003YY_block_22_0000_0008 = true := by
  native_decide

end R003UeqvR003YYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
