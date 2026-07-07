/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R003:u=v:R003NY, term block 26:0-5

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R003UeqvR003NYTermShards

/-- Generator polynomial 26 for relaxed split surplus certificate `R003:u=v:R003NY`. -/
def rs_R003_ueqv_R003NY_generator_26_0000_0005 : Poly :=
[
  term (-2 : Rat) [(0, 1), (12, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (13, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(6, 1), (12, 1)],
  term (-1 : Rat) [(6, 2)],
  term (2 : Rat) [(7, 1), (13, 1)],
  term (-1 : Rat) [(7, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003NY_coefficient_26_0000 : Poly :=
[
  term ((-2160 : Rat) / 299) [(0, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 0 for generator 26. -/
def rs_R003_ueqv_R003NY_partial_26_0000 : Poly :=
[
  term ((4320 : Rat) / 299) [(0, 1), (1, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(0, 1), (1, 2), (5, 1), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(0, 1), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(0, 1), (5, 1), (6, 2), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(0, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(0, 1), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(0, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(0, 3), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 26. -/
theorem rs_R003_ueqv_R003NY_partial_26_0000_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_26_0000
        rs_R003_ueqv_R003NY_generator_26_0000_0005 =
      rs_R003_ueqv_R003NY_partial_26_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003NY_coefficient_26_0001 : Poly :=
[
  term ((2160 : Rat) / 299) [(0, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 1 for generator 26. -/
def rs_R003_ueqv_R003NY_partial_26_0001 : Poly :=
[
  term ((-4320 : Rat) / 299) [(0, 1), (1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(0, 1), (1, 2), (9, 1), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(0, 1), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(0, 1), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(0, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(0, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(0, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(0, 3), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 26. -/
theorem rs_R003_ueqv_R003NY_partial_26_0001_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_26_0001
        rs_R003_ueqv_R003NY_generator_26_0000_0005 =
      rs_R003_ueqv_R003NY_partial_26_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003NY_coefficient_26_0002 : Poly :=
[
  term ((1080 : Rat) / 299) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 2 for generator 26. -/
def rs_R003_ueqv_R003NY_partial_26_0002 : Poly :=
[
  term ((-2160 : Rat) / 299) [(0, 1), (1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1080 : Rat) / 299) [(0, 1), (1, 2), (11, 1), (15, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(0, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1080 : Rat) / 299) [(0, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(0, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1080 : Rat) / 299) [(0, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(0, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1080 : Rat) / 299) [(0, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 26. -/
theorem rs_R003_ueqv_R003NY_partial_26_0002_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_26_0002
        rs_R003_ueqv_R003NY_generator_26_0000_0005 =
      rs_R003_ueqv_R003NY_partial_26_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003NY_coefficient_26_0003 : Poly :=
[
  term ((2160 : Rat) / 299) [(2, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 3 for generator 26. -/
def rs_R003_ueqv_R003NY_partial_26_0003 : Poly :=
[
  term ((-4320 : Rat) / 299) [(0, 1), (2, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(0, 2), (2, 1), (5, 1), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(1, 1), (2, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(1, 2), (2, 1), (5, 1), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(2, 1), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(2, 1), (5, 1), (6, 2), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(2, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(2, 1), (5, 1), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 26. -/
theorem rs_R003_ueqv_R003NY_partial_26_0003_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_26_0003
        rs_R003_ueqv_R003NY_generator_26_0000_0005 =
      rs_R003_ueqv_R003NY_partial_26_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003NY_coefficient_26_0004 : Poly :=
[
  term ((-2160 : Rat) / 299) [(2, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 4 for generator 26. -/
def rs_R003_ueqv_R003NY_partial_26_0004 : Poly :=
[
  term ((4320 : Rat) / 299) [(0, 1), (2, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(0, 2), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(1, 1), (2, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(1, 2), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(2, 1), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(2, 1), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(2, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(2, 1), (7, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 26. -/
theorem rs_R003_ueqv_R003NY_partial_26_0004_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_26_0004
        rs_R003_ueqv_R003NY_generator_26_0000_0005 =
      rs_R003_ueqv_R003NY_partial_26_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 26. -/
def rs_R003_ueqv_R003NY_coefficient_26_0005 : Poly :=
[
  term ((-1080 : Rat) / 299) [(2, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 5 for generator 26. -/
def rs_R003_ueqv_R003NY_partial_26_0005 : Poly :=
[
  term ((2160 : Rat) / 299) [(0, 1), (2, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1080 : Rat) / 299) [(0, 2), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(1, 1), (2, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1080 : Rat) / 299) [(1, 2), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(2, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1080 : Rat) / 299) [(2, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(2, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1080 : Rat) / 299) [(2, 1), (7, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 26. -/
theorem rs_R003_ueqv_R003NY_partial_26_0005_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_26_0005
        rs_R003_ueqv_R003NY_generator_26_0000_0005 =
      rs_R003_ueqv_R003NY_partial_26_0005 := by
  native_decide

/-- Partial products in this block. -/
def rs_R003_ueqv_R003NY_partials_26_0000_0005 : List Poly :=
[
  rs_R003_ueqv_R003NY_partial_26_0000,
  rs_R003_ueqv_R003NY_partial_26_0001,
  rs_R003_ueqv_R003NY_partial_26_0002,
  rs_R003_ueqv_R003NY_partial_26_0003,
  rs_R003_ueqv_R003NY_partial_26_0004,
  rs_R003_ueqv_R003NY_partial_26_0005
]

/-- Sum of partial products in this block. -/
def rs_R003_ueqv_R003NY_block_26_0000_0005 : Poly :=
[
  term ((4320 : Rat) / 299) [(0, 1), (1, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(0, 1), (1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(0, 1), (1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(0, 1), (1, 2), (5, 1), (15, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(0, 1), (1, 2), (9, 1), (15, 1), (16, 1)],
  term ((1080 : Rat) / 299) [(0, 1), (1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(0, 1), (2, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(0, 1), (2, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(0, 1), (2, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(0, 1), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(0, 1), (5, 1), (6, 2), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(0, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(0, 1), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(0, 1), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(0, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(0, 1), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((-1080 : Rat) / 299) [(0, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(0, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(0, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(0, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-1080 : Rat) / 299) [(0, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(0, 2), (2, 1), (5, 1), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(0, 2), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1080 : Rat) / 299) [(0, 2), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(0, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(0, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(0, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(0, 3), (5, 1), (15, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(0, 3), (9, 1), (15, 1), (16, 1)],
  term ((1080 : Rat) / 299) [(0, 3), (11, 1), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(1, 1), (2, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(1, 1), (2, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(1, 1), (2, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(1, 2), (2, 1), (5, 1), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(1, 2), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1080 : Rat) / 299) [(1, 2), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(2, 1), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(2, 1), (5, 1), (6, 2), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(2, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(2, 1), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(2, 1), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(2, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(2, 1), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((1080 : Rat) / 299) [(2, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(2, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(2, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(2, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((1080 : Rat) / 299) [(2, 1), (7, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 26, terms 0 through 5. -/
theorem rs_R003_ueqv_R003NY_block_26_0000_0005_valid :
    checkProductSumEq rs_R003_ueqv_R003NY_partials_26_0000_0005
      rs_R003_ueqv_R003NY_block_26_0000_0005 = true := by
  native_decide

end R003UeqvR003NYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
