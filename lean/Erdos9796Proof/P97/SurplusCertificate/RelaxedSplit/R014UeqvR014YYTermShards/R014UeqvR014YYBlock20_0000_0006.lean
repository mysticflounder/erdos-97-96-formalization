/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R014:u=v:R014YY, term block 20:0-6

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R014UeqvR014YYTermShards

/-- Generator polynomial 20 for relaxed split surplus certificate `R014:u=v:R014YY`. -/
def rs_R014_ueqv_R014YY_generator_20_0000_0006 : Poly :=
[
  term (-2 : Rat) [(0, 1), (8, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (9, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(2, 1), (8, 1)],
  term (-1 : Rat) [(2, 2)],
  term (2 : Rat) [(3, 1), (9, 1)],
  term (-1 : Rat) [(3, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 20. -/
def rs_R014_ueqv_R014YY_coefficient_20_0000 : Poly :=
[
  term ((-1 : Rat) / 24) []
]

/-- Partial product 0 for generator 20. -/
def rs_R014_ueqv_R014YY_partial_20_0000 : Poly :=
[
  term ((1 : Rat) / 12) [(0, 1), (8, 1)],
  term ((-1 : Rat) / 24) [(0, 2)],
  term ((1 : Rat) / 12) [(1, 1), (9, 1)],
  term ((-1 : Rat) / 24) [(1, 2)],
  term ((-1 : Rat) / 12) [(2, 1), (8, 1)],
  term ((1 : Rat) / 24) [(2, 2)],
  term ((-1 : Rat) / 12) [(3, 1), (9, 1)],
  term ((1 : Rat) / 24) [(3, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 20. -/
theorem rs_R014_ueqv_R014YY_partial_20_0000_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_20_0000
        rs_R014_ueqv_R014YY_generator_20_0000_0006 =
      rs_R014_ueqv_R014YY_partial_20_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 20. -/
def rs_R014_ueqv_R014YY_coefficient_20_0001 : Poly :=
[
  term (-1 : Rat) [(1, 1), (14, 1), (15, 1)]
]

/-- Partial product 1 for generator 20. -/
def rs_R014_ueqv_R014YY_partial_20_0001 : Poly :=
[
  term (2 : Rat) [(0, 1), (1, 1), (8, 1), (14, 1), (15, 1)],
  term (-1 : Rat) [(0, 2), (1, 1), (14, 1), (15, 1)],
  term (-2 : Rat) [(1, 1), (2, 1), (8, 1), (14, 1), (15, 1)],
  term (1 : Rat) [(1, 1), (2, 2), (14, 1), (15, 1)],
  term (-2 : Rat) [(1, 1), (3, 1), (9, 1), (14, 1), (15, 1)],
  term (1 : Rat) [(1, 1), (3, 2), (14, 1), (15, 1)],
  term (2 : Rat) [(1, 2), (9, 1), (14, 1), (15, 1)],
  term (-1 : Rat) [(1, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 20. -/
theorem rs_R014_ueqv_R014YY_partial_20_0001_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_20_0001
        rs_R014_ueqv_R014YY_generator_20_0000_0006 =
      rs_R014_ueqv_R014YY_partial_20_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 20. -/
def rs_R014_ueqv_R014YY_coefficient_20_0002 : Poly :=
[
  term ((-7 : Rat) / 6) [(10, 1)]
]

/-- Partial product 2 for generator 20. -/
def rs_R014_ueqv_R014YY_partial_20_0002 : Poly :=
[
  term ((7 : Rat) / 3) [(0, 1), (8, 1), (10, 1)],
  term ((-7 : Rat) / 6) [(0, 2), (10, 1)],
  term ((7 : Rat) / 3) [(1, 1), (9, 1), (10, 1)],
  term ((-7 : Rat) / 6) [(1, 2), (10, 1)],
  term ((-7 : Rat) / 3) [(2, 1), (8, 1), (10, 1)],
  term ((7 : Rat) / 6) [(2, 2), (10, 1)],
  term ((-7 : Rat) / 3) [(3, 1), (9, 1), (10, 1)],
  term ((7 : Rat) / 6) [(3, 2), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 20. -/
theorem rs_R014_ueqv_R014YY_partial_20_0002_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_20_0002
        rs_R014_ueqv_R014YY_generator_20_0000_0006 =
      rs_R014_ueqv_R014YY_partial_20_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 20. -/
def rs_R014_ueqv_R014YY_coefficient_20_0003 : Poly :=
[
  term ((25 : Rat) / 3) [(11, 1), (15, 1)]
]

/-- Partial product 3 for generator 20. -/
def rs_R014_ueqv_R014YY_partial_20_0003 : Poly :=
[
  term ((-50 : Rat) / 3) [(0, 1), (8, 1), (11, 1), (15, 1)],
  term ((25 : Rat) / 3) [(0, 2), (11, 1), (15, 1)],
  term ((-50 : Rat) / 3) [(1, 1), (9, 1), (11, 1), (15, 1)],
  term ((25 : Rat) / 3) [(1, 2), (11, 1), (15, 1)],
  term ((50 : Rat) / 3) [(2, 1), (8, 1), (11, 1), (15, 1)],
  term ((-25 : Rat) / 3) [(2, 2), (11, 1), (15, 1)],
  term ((50 : Rat) / 3) [(3, 1), (9, 1), (11, 1), (15, 1)],
  term ((-25 : Rat) / 3) [(3, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 20. -/
theorem rs_R014_ueqv_R014YY_partial_20_0003_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_20_0003
        rs_R014_ueqv_R014YY_generator_20_0000_0006 =
      rs_R014_ueqv_R014YY_partial_20_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 20. -/
def rs_R014_ueqv_R014YY_coefficient_20_0004 : Poly :=
[
  term ((-25 : Rat) / 6) [(13, 1), (15, 1)]
]

/-- Partial product 4 for generator 20. -/
def rs_R014_ueqv_R014YY_partial_20_0004 : Poly :=
[
  term ((25 : Rat) / 3) [(0, 1), (8, 1), (13, 1), (15, 1)],
  term ((-25 : Rat) / 6) [(0, 2), (13, 1), (15, 1)],
  term ((25 : Rat) / 3) [(1, 1), (9, 1), (13, 1), (15, 1)],
  term ((-25 : Rat) / 6) [(1, 2), (13, 1), (15, 1)],
  term ((-25 : Rat) / 3) [(2, 1), (8, 1), (13, 1), (15, 1)],
  term ((25 : Rat) / 6) [(2, 2), (13, 1), (15, 1)],
  term ((-25 : Rat) / 3) [(3, 1), (9, 1), (13, 1), (15, 1)],
  term ((25 : Rat) / 6) [(3, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 20. -/
theorem rs_R014_ueqv_R014YY_partial_20_0004_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_20_0004
        rs_R014_ueqv_R014YY_generator_20_0000_0006 =
      rs_R014_ueqv_R014YY_partial_20_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 20. -/
def rs_R014_ueqv_R014YY_coefficient_20_0005 : Poly :=
[
  term ((-1 : Rat) / 12) [(14, 1)]
]

/-- Partial product 5 for generator 20. -/
def rs_R014_ueqv_R014YY_partial_20_0005 : Poly :=
[
  term ((1 : Rat) / 6) [(0, 1), (8, 1), (14, 1)],
  term ((-1 : Rat) / 12) [(0, 2), (14, 1)],
  term ((1 : Rat) / 6) [(1, 1), (9, 1), (14, 1)],
  term ((-1 : Rat) / 12) [(1, 2), (14, 1)],
  term ((-1 : Rat) / 6) [(2, 1), (8, 1), (14, 1)],
  term ((1 : Rat) / 12) [(2, 2), (14, 1)],
  term ((-1 : Rat) / 6) [(3, 1), (9, 1), (14, 1)],
  term ((1 : Rat) / 12) [(3, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 20. -/
theorem rs_R014_ueqv_R014YY_partial_20_0005_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_20_0005
        rs_R014_ueqv_R014YY_generator_20_0000_0006 =
      rs_R014_ueqv_R014YY_partial_20_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 20. -/
def rs_R014_ueqv_R014YY_coefficient_20_0006 : Poly :=
[
  term ((1 : Rat) / 2) [(15, 2)]
]

/-- Partial product 6 for generator 20. -/
def rs_R014_ueqv_R014YY_partial_20_0006 : Poly :=
[
  term (-1 : Rat) [(0, 1), (8, 1), (15, 2)],
  term ((1 : Rat) / 2) [(0, 2), (15, 2)],
  term (-1 : Rat) [(1, 1), (9, 1), (15, 2)],
  term ((1 : Rat) / 2) [(1, 2), (15, 2)],
  term (1 : Rat) [(2, 1), (8, 1), (15, 2)],
  term ((-1 : Rat) / 2) [(2, 2), (15, 2)],
  term (1 : Rat) [(3, 1), (9, 1), (15, 2)],
  term ((-1 : Rat) / 2) [(3, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 20. -/
theorem rs_R014_ueqv_R014YY_partial_20_0006_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_20_0006
        rs_R014_ueqv_R014YY_generator_20_0000_0006 =
      rs_R014_ueqv_R014YY_partial_20_0006 := by
  native_decide

/-- Partial products in this block. -/
def rs_R014_ueqv_R014YY_partials_20_0000_0006 : List Poly :=
[
  rs_R014_ueqv_R014YY_partial_20_0000,
  rs_R014_ueqv_R014YY_partial_20_0001,
  rs_R014_ueqv_R014YY_partial_20_0002,
  rs_R014_ueqv_R014YY_partial_20_0003,
  rs_R014_ueqv_R014YY_partial_20_0004,
  rs_R014_ueqv_R014YY_partial_20_0005,
  rs_R014_ueqv_R014YY_partial_20_0006
]

/-- Sum of partial products in this block. -/
def rs_R014_ueqv_R014YY_block_20_0000_0006 : Poly :=
[
  term (2 : Rat) [(0, 1), (1, 1), (8, 1), (14, 1), (15, 1)],
  term ((1 : Rat) / 12) [(0, 1), (8, 1)],
  term ((7 : Rat) / 3) [(0, 1), (8, 1), (10, 1)],
  term ((-50 : Rat) / 3) [(0, 1), (8, 1), (11, 1), (15, 1)],
  term ((25 : Rat) / 3) [(0, 1), (8, 1), (13, 1), (15, 1)],
  term ((1 : Rat) / 6) [(0, 1), (8, 1), (14, 1)],
  term (-1 : Rat) [(0, 1), (8, 1), (15, 2)],
  term ((-1 : Rat) / 24) [(0, 2)],
  term (-1 : Rat) [(0, 2), (1, 1), (14, 1), (15, 1)],
  term ((-7 : Rat) / 6) [(0, 2), (10, 1)],
  term ((25 : Rat) / 3) [(0, 2), (11, 1), (15, 1)],
  term ((-25 : Rat) / 6) [(0, 2), (13, 1), (15, 1)],
  term ((-1 : Rat) / 12) [(0, 2), (14, 1)],
  term ((1 : Rat) / 2) [(0, 2), (15, 2)],
  term (-2 : Rat) [(1, 1), (2, 1), (8, 1), (14, 1), (15, 1)],
  term (1 : Rat) [(1, 1), (2, 2), (14, 1), (15, 1)],
  term (-2 : Rat) [(1, 1), (3, 1), (9, 1), (14, 1), (15, 1)],
  term (1 : Rat) [(1, 1), (3, 2), (14, 1), (15, 1)],
  term ((1 : Rat) / 12) [(1, 1), (9, 1)],
  term ((7 : Rat) / 3) [(1, 1), (9, 1), (10, 1)],
  term ((-50 : Rat) / 3) [(1, 1), (9, 1), (11, 1), (15, 1)],
  term ((25 : Rat) / 3) [(1, 1), (9, 1), (13, 1), (15, 1)],
  term ((1 : Rat) / 6) [(1, 1), (9, 1), (14, 1)],
  term (-1 : Rat) [(1, 1), (9, 1), (15, 2)],
  term ((-1 : Rat) / 24) [(1, 2)],
  term (2 : Rat) [(1, 2), (9, 1), (14, 1), (15, 1)],
  term ((-7 : Rat) / 6) [(1, 2), (10, 1)],
  term ((25 : Rat) / 3) [(1, 2), (11, 1), (15, 1)],
  term ((-25 : Rat) / 6) [(1, 2), (13, 1), (15, 1)],
  term ((-1 : Rat) / 12) [(1, 2), (14, 1)],
  term ((1 : Rat) / 2) [(1, 2), (15, 2)],
  term (-1 : Rat) [(1, 3), (14, 1), (15, 1)],
  term ((-1 : Rat) / 12) [(2, 1), (8, 1)],
  term ((-7 : Rat) / 3) [(2, 1), (8, 1), (10, 1)],
  term ((50 : Rat) / 3) [(2, 1), (8, 1), (11, 1), (15, 1)],
  term ((-25 : Rat) / 3) [(2, 1), (8, 1), (13, 1), (15, 1)],
  term ((-1 : Rat) / 6) [(2, 1), (8, 1), (14, 1)],
  term (1 : Rat) [(2, 1), (8, 1), (15, 2)],
  term ((1 : Rat) / 24) [(2, 2)],
  term ((7 : Rat) / 6) [(2, 2), (10, 1)],
  term ((-25 : Rat) / 3) [(2, 2), (11, 1), (15, 1)],
  term ((25 : Rat) / 6) [(2, 2), (13, 1), (15, 1)],
  term ((1 : Rat) / 12) [(2, 2), (14, 1)],
  term ((-1 : Rat) / 2) [(2, 2), (15, 2)],
  term ((-1 : Rat) / 12) [(3, 1), (9, 1)],
  term ((-7 : Rat) / 3) [(3, 1), (9, 1), (10, 1)],
  term ((50 : Rat) / 3) [(3, 1), (9, 1), (11, 1), (15, 1)],
  term ((-25 : Rat) / 3) [(3, 1), (9, 1), (13, 1), (15, 1)],
  term ((-1 : Rat) / 6) [(3, 1), (9, 1), (14, 1)],
  term (1 : Rat) [(3, 1), (9, 1), (15, 2)],
  term ((1 : Rat) / 24) [(3, 2)],
  term ((7 : Rat) / 6) [(3, 2), (10, 1)],
  term ((-25 : Rat) / 3) [(3, 2), (11, 1), (15, 1)],
  term ((25 : Rat) / 6) [(3, 2), (13, 1), (15, 1)],
  term ((1 : Rat) / 12) [(3, 2), (14, 1)],
  term ((-1 : Rat) / 2) [(3, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 20, terms 0 through 6. -/
theorem rs_R014_ueqv_R014YY_block_20_0000_0006_valid :
    checkProductSumEq rs_R014_ueqv_R014YY_partials_20_0000_0006
      rs_R014_ueqv_R014YY_block_20_0000_0006 = true := by
  native_decide

end R014UeqvR014YYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
