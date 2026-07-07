/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R003:u=v:R003NY, term block 17:0-7

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R003UeqvR003NYTermShards

/-- Generator polynomial 17 for relaxed split surplus certificate `R003:u=v:R003NY`. -/
def rs_R003_ueqv_R003NY_generator_17_0000_0007 : Poly :=
[
  term (1 : Rat) [],
  term (-2 : Rat) [(6, 1)],
  term (2 : Rat) [(6, 1), (10, 1)],
  term (2 : Rat) [(7, 1), (11, 1)],
  term (-1 : Rat) [(10, 2)],
  term (-1 : Rat) [(11, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 17. -/
def rs_R003_ueqv_R003NY_coefficient_17_0000 : Poly :=
[
  term ((-2160 : Rat) / 299) [(0, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 0 for generator 17. -/
def rs_R003_ueqv_R003NY_partial_17_0000 : Poly :=
[
  term ((-4320 : Rat) / 299) [(0, 1), (5, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(0, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(0, 1), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(0, 1), (5, 1), (10, 2), (15, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(0, 1), (5, 1), (11, 2), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(0, 1), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 17. -/
theorem rs_R003_ueqv_R003NY_partial_17_0000_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_17_0000
        rs_R003_ueqv_R003NY_generator_17_0000_0007 =
      rs_R003_ueqv_R003NY_partial_17_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 17. -/
def rs_R003_ueqv_R003NY_coefficient_17_0001 : Poly :=
[
  term ((1080 : Rat) / 299) [(0, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 1 for generator 17. -/
def rs_R003_ueqv_R003NY_partial_17_0001 : Poly :=
[
  term ((2160 : Rat) / 299) [(0, 1), (6, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(0, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(0, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1080 : Rat) / 299) [(0, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-1080 : Rat) / 299) [(0, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((1080 : Rat) / 299) [(0, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 17. -/
theorem rs_R003_ueqv_R003NY_partial_17_0001_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_17_0001
        rs_R003_ueqv_R003NY_generator_17_0000_0007 =
      rs_R003_ueqv_R003NY_partial_17_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 17. -/
def rs_R003_ueqv_R003NY_coefficient_17_0002 : Poly :=
[
  term ((2160 : Rat) / 299) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 2 for generator 17. -/
def rs_R003_ueqv_R003NY_partial_17_0002 : Poly :=
[
  term ((4320 : Rat) / 299) [(0, 1), (6, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(0, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(0, 1), (7, 1), (11, 2), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(0, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(0, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(0, 1), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 17. -/
theorem rs_R003_ueqv_R003NY_partial_17_0002_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_17_0002
        rs_R003_ueqv_R003NY_generator_17_0000_0007 =
      rs_R003_ueqv_R003NY_partial_17_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 17. -/
def rs_R003_ueqv_R003NY_coefficient_17_0003 : Poly :=
[
  term ((-1080 : Rat) / 299) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 3 for generator 17. -/
def rs_R003_ueqv_R003NY_partial_17_0003 : Poly :=
[
  term ((-2160 : Rat) / 299) [(0, 1), (6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(0, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(0, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1080 : Rat) / 299) [(0, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((1080 : Rat) / 299) [(0, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1080 : Rat) / 299) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 17. -/
theorem rs_R003_ueqv_R003NY_partial_17_0003_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_17_0003
        rs_R003_ueqv_R003NY_generator_17_0000_0007 =
      rs_R003_ueqv_R003NY_partial_17_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 17. -/
def rs_R003_ueqv_R003NY_coefficient_17_0004 : Poly :=
[
  term ((2160 : Rat) / 299) [(2, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 4 for generator 17. -/
def rs_R003_ueqv_R003NY_partial_17_0004 : Poly :=
[
  term ((4320 : Rat) / 299) [(2, 1), (5, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(2, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(2, 1), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(2, 1), (5, 1), (10, 2), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(2, 1), (5, 1), (11, 2), (15, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(2, 1), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 17. -/
theorem rs_R003_ueqv_R003NY_partial_17_0004_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_17_0004
        rs_R003_ueqv_R003NY_generator_17_0000_0007 =
      rs_R003_ueqv_R003NY_partial_17_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 17. -/
def rs_R003_ueqv_R003NY_coefficient_17_0005 : Poly :=
[
  term ((-1080 : Rat) / 299) [(2, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 5 for generator 17. -/
def rs_R003_ueqv_R003NY_partial_17_0005 : Poly :=
[
  term ((-2160 : Rat) / 299) [(2, 1), (6, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(2, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(2, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((1080 : Rat) / 299) [(2, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((1080 : Rat) / 299) [(2, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-1080 : Rat) / 299) [(2, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 17. -/
theorem rs_R003_ueqv_R003NY_partial_17_0005_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_17_0005
        rs_R003_ueqv_R003NY_generator_17_0000_0007 =
      rs_R003_ueqv_R003NY_partial_17_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 17. -/
def rs_R003_ueqv_R003NY_coefficient_17_0006 : Poly :=
[
  term ((-2160 : Rat) / 299) [(2, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 6 for generator 17. -/
def rs_R003_ueqv_R003NY_partial_17_0006 : Poly :=
[
  term ((-4320 : Rat) / 299) [(2, 1), (6, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(2, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(2, 1), (7, 1), (11, 2), (15, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(2, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(2, 1), (11, 1), (15, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(2, 1), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 17. -/
theorem rs_R003_ueqv_R003NY_partial_17_0006_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_17_0006
        rs_R003_ueqv_R003NY_generator_17_0000_0007 =
      rs_R003_ueqv_R003NY_partial_17_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 17. -/
def rs_R003_ueqv_R003NY_coefficient_17_0007 : Poly :=
[
  term ((1080 : Rat) / 299) [(2, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 7 for generator 17. -/
def rs_R003_ueqv_R003NY_partial_17_0007 : Poly :=
[
  term ((2160 : Rat) / 299) [(2, 1), (6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(2, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(2, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1080 : Rat) / 299) [(2, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1080 : Rat) / 299) [(2, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((1080 : Rat) / 299) [(2, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 17. -/
theorem rs_R003_ueqv_R003NY_partial_17_0007_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_17_0007
        rs_R003_ueqv_R003NY_generator_17_0000_0007 =
      rs_R003_ueqv_R003NY_partial_17_0007 := by
  native_decide

/-- Partial products in this block. -/
def rs_R003_ueqv_R003NY_partials_17_0000_0007 : List Poly :=
[
  rs_R003_ueqv_R003NY_partial_17_0000,
  rs_R003_ueqv_R003NY_partial_17_0001,
  rs_R003_ueqv_R003NY_partial_17_0002,
  rs_R003_ueqv_R003NY_partial_17_0003,
  rs_R003_ueqv_R003NY_partial_17_0004,
  rs_R003_ueqv_R003NY_partial_17_0005,
  rs_R003_ueqv_R003NY_partial_17_0006,
  rs_R003_ueqv_R003NY_partial_17_0007
]

/-- Sum of partial products in this block. -/
def rs_R003_ueqv_R003NY_block_17_0000_0007 : Poly :=
[
  term ((-4320 : Rat) / 299) [(0, 1), (5, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(0, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(0, 1), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(0, 1), (5, 1), (10, 2), (15, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(0, 1), (5, 1), (11, 2), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(0, 1), (5, 1), (15, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(0, 1), (6, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(0, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(0, 1), (6, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(0, 1), (6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(0, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(0, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(0, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(0, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(0, 1), (7, 1), (11, 2), (15, 1), (16, 1)],
  term ((-1080 : Rat) / 299) [(0, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-1080 : Rat) / 299) [(0, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((1080 : Rat) / 299) [(0, 1), (9, 1), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(0, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((1080 : Rat) / 299) [(0, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(0, 1), (11, 1), (15, 1), (16, 1)],
  term ((1080 : Rat) / 299) [(0, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(0, 1), (11, 3), (15, 1), (16, 1)],
  term ((-1080 : Rat) / 299) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(2, 1), (5, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(2, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(2, 1), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(2, 1), (5, 1), (10, 2), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(2, 1), (5, 1), (11, 2), (15, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(2, 1), (5, 1), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(2, 1), (6, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(2, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(2, 1), (6, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(2, 1), (6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(2, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(2, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(2, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(2, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(2, 1), (7, 1), (11, 2), (15, 1), (16, 1)],
  term ((1080 : Rat) / 299) [(2, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((1080 : Rat) / 299) [(2, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-1080 : Rat) / 299) [(2, 1), (9, 1), (15, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(2, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1080 : Rat) / 299) [(2, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(2, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1080 : Rat) / 299) [(2, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(2, 1), (11, 3), (15, 1), (16, 1)],
  term ((1080 : Rat) / 299) [(2, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 17, terms 0 through 7. -/
theorem rs_R003_ueqv_R003NY_block_17_0000_0007_valid :
    checkProductSumEq rs_R003_ueqv_R003NY_partials_17_0000_0007
      rs_R003_ueqv_R003NY_block_17_0000_0007 = true := by
  native_decide

end R003UeqvR003NYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
