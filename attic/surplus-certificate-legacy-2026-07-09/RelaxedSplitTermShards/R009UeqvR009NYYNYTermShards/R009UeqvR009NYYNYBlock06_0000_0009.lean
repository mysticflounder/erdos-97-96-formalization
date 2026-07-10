/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NYYNY, term block 6:0-9

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NYYNYTermShards

/-- Generator polynomial 6 for relaxed split surplus certificate `R009:u=v:R009NYYNY`. -/
def rs_R009_ueqv_R009NYYNY_generator_06_0000_0009 : Poly :=
[
  term (-1 : Rat) [],
  term (1 : Rat) [(0, 2), (16, 1)],
  term (1 : Rat) [(1, 2), (16, 1)]
]

/-- Coefficient term 0 from coefficient polynomial 6. -/
def rs_R009_ueqv_R009NYYNY_coefficient_06_0000 : Poly :=
[
  term (4 : Rat) [(1, 1), (7, 1)]
]

/-- Partial product 0 for generator 6. -/
def rs_R009_ueqv_R009NYYNY_partial_06_0000 : Poly :=
[
  term (4 : Rat) [(0, 2), (1, 1), (7, 1), (16, 1)],
  term (-4 : Rat) [(1, 1), (7, 1)],
  term (4 : Rat) [(1, 3), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 6. -/
theorem rs_R009_ueqv_R009NYYNY_partial_06_0000_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_06_0000
        rs_R009_ueqv_R009NYYNY_generator_06_0000_0009 =
      rs_R009_ueqv_R009NYYNY_partial_06_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 6. -/
def rs_R009_ueqv_R009NYYNY_coefficient_06_0001 : Poly :=
[
  term (-8 : Rat) [(1, 1), (7, 1), (14, 1)]
]

/-- Partial product 1 for generator 6. -/
def rs_R009_ueqv_R009NYYNY_partial_06_0001 : Poly :=
[
  term (-8 : Rat) [(0, 2), (1, 1), (7, 1), (14, 1), (16, 1)],
  term (8 : Rat) [(1, 1), (7, 1), (14, 1)],
  term (-8 : Rat) [(1, 3), (7, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 6. -/
theorem rs_R009_ueqv_R009NYYNY_partial_06_0001_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_06_0001
        rs_R009_ueqv_R009NYYNY_generator_06_0000_0009 =
      rs_R009_ueqv_R009NYYNY_partial_06_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 6. -/
def rs_R009_ueqv_R009NYYNY_coefficient_06_0002 : Poly :=
[
  term (-8 : Rat) [(1, 1), (9, 1)]
]

/-- Partial product 2 for generator 6. -/
def rs_R009_ueqv_R009NYYNY_partial_06_0002 : Poly :=
[
  term (-8 : Rat) [(0, 2), (1, 1), (9, 1), (16, 1)],
  term (8 : Rat) [(1, 1), (9, 1)],
  term (-8 : Rat) [(1, 3), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 6. -/
theorem rs_R009_ueqv_R009NYYNY_partial_06_0002_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_06_0002
        rs_R009_ueqv_R009NYYNY_generator_06_0000_0009 =
      rs_R009_ueqv_R009NYYNY_partial_06_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 6. -/
def rs_R009_ueqv_R009NYYNY_coefficient_06_0003 : Poly :=
[
  term (16 : Rat) [(1, 1), (9, 1), (14, 1)]
]

/-- Partial product 3 for generator 6. -/
def rs_R009_ueqv_R009NYYNY_partial_06_0003 : Poly :=
[
  term (16 : Rat) [(0, 2), (1, 1), (9, 1), (14, 1), (16, 1)],
  term (-16 : Rat) [(1, 1), (9, 1), (14, 1)],
  term (16 : Rat) [(1, 3), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 6. -/
theorem rs_R009_ueqv_R009NYYNY_partial_06_0003_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_06_0003
        rs_R009_ueqv_R009NYYNY_generator_06_0000_0009 =
      rs_R009_ueqv_R009NYYNY_partial_06_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 6. -/
def rs_R009_ueqv_R009NYYNY_coefficient_06_0004 : Poly :=
[
  term (3 : Rat) [(7, 1), (10, 1), (15, 1)]
]

/-- Partial product 4 for generator 6. -/
def rs_R009_ueqv_R009NYYNY_partial_06_0004 : Poly :=
[
  term (3 : Rat) [(0, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(1, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(7, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 6. -/
theorem rs_R009_ueqv_R009NYYNY_partial_06_0004_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_06_0004
        rs_R009_ueqv_R009NYYNY_generator_06_0000_0009 =
      rs_R009_ueqv_R009NYYNY_partial_06_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 6. -/
def rs_R009_ueqv_R009NYYNY_coefficient_06_0005 : Poly :=
[
  term ((-19 : Rat) / 4) [(7, 1), (15, 1)]
]

/-- Partial product 5 for generator 6. -/
def rs_R009_ueqv_R009NYYNY_partial_06_0005 : Poly :=
[
  term ((-19 : Rat) / 4) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((-19 : Rat) / 4) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((19 : Rat) / 4) [(7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 6. -/
theorem rs_R009_ueqv_R009NYYNY_partial_06_0005_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_06_0005
        rs_R009_ueqv_R009NYYNY_generator_06_0000_0009 =
      rs_R009_ueqv_R009NYYNY_partial_06_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 6. -/
def rs_R009_ueqv_R009NYYNY_coefficient_06_0006 : Poly :=
[
  term (-6 : Rat) [(9, 1), (10, 1), (15, 1)]
]

/-- Partial product 6 for generator 6. -/
def rs_R009_ueqv_R009NYYNY_partial_06_0006 : Poly :=
[
  term (-6 : Rat) [(0, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(1, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(9, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 6. -/
theorem rs_R009_ueqv_R009NYYNY_partial_06_0006_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_06_0006
        rs_R009_ueqv_R009NYYNY_generator_06_0000_0009 =
      rs_R009_ueqv_R009NYYNY_partial_06_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 6. -/
def rs_R009_ueqv_R009NYYNY_coefficient_06_0007 : Poly :=
[
  term ((19 : Rat) / 2) [(9, 1), (15, 1)]
]

/-- Partial product 7 for generator 6. -/
def rs_R009_ueqv_R009NYYNY_partial_06_0007 : Poly :=
[
  term ((19 : Rat) / 2) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((19 : Rat) / 2) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((-19 : Rat) / 2) [(9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 6. -/
theorem rs_R009_ueqv_R009NYYNY_partial_06_0007_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_06_0007
        rs_R009_ueqv_R009NYYNY_generator_06_0000_0009 =
      rs_R009_ueqv_R009NYYNY_partial_06_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 6. -/
def rs_R009_ueqv_R009NYYNY_coefficient_06_0008 : Poly :=
[
  term ((3 : Rat) / 2) [(11, 1), (15, 1)]
]

/-- Partial product 8 for generator 6. -/
def rs_R009_ueqv_R009NYYNY_partial_06_0008 : Poly :=
[
  term ((3 : Rat) / 2) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((3 : Rat) / 2) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 6. -/
theorem rs_R009_ueqv_R009NYYNY_partial_06_0008_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_06_0008
        rs_R009_ueqv_R009NYYNY_generator_06_0000_0009 =
      rs_R009_ueqv_R009NYYNY_partial_06_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 6. -/
def rs_R009_ueqv_R009NYYNY_coefficient_06_0009 : Poly :=
[
  term ((-3 : Rat) / 4) [(13, 1), (15, 1)]
]

/-- Partial product 9 for generator 6. -/
def rs_R009_ueqv_R009NYYNY_partial_06_0009 : Poly :=
[
  term ((-3 : Rat) / 4) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-3 : Rat) / 4) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((3 : Rat) / 4) [(13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 6. -/
theorem rs_R009_ueqv_R009NYYNY_partial_06_0009_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_06_0009
        rs_R009_ueqv_R009NYYNY_generator_06_0000_0009 =
      rs_R009_ueqv_R009NYYNY_partial_06_0009 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NYYNY_partials_06_0000_0009 : List Poly :=
[
  rs_R009_ueqv_R009NYYNY_partial_06_0000,
  rs_R009_ueqv_R009NYYNY_partial_06_0001,
  rs_R009_ueqv_R009NYYNY_partial_06_0002,
  rs_R009_ueqv_R009NYYNY_partial_06_0003,
  rs_R009_ueqv_R009NYYNY_partial_06_0004,
  rs_R009_ueqv_R009NYYNY_partial_06_0005,
  rs_R009_ueqv_R009NYYNY_partial_06_0006,
  rs_R009_ueqv_R009NYYNY_partial_06_0007,
  rs_R009_ueqv_R009NYYNY_partial_06_0008,
  rs_R009_ueqv_R009NYYNY_partial_06_0009
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NYYNY_block_06_0000_0009 : Poly :=
[
  term (-8 : Rat) [(0, 2), (1, 1), (7, 1), (14, 1), (16, 1)],
  term (4 : Rat) [(0, 2), (1, 1), (7, 1), (16, 1)],
  term (16 : Rat) [(0, 2), (1, 1), (9, 1), (14, 1), (16, 1)],
  term (-8 : Rat) [(0, 2), (1, 1), (9, 1), (16, 1)],
  term (3 : Rat) [(0, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-19 : Rat) / 4) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(0, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((19 : Rat) / 2) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((3 : Rat) / 2) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((-3 : Rat) / 4) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(1, 1), (7, 1)],
  term (8 : Rat) [(1, 1), (7, 1), (14, 1)],
  term (8 : Rat) [(1, 1), (9, 1)],
  term (-16 : Rat) [(1, 1), (9, 1), (14, 1)],
  term (3 : Rat) [(1, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-19 : Rat) / 4) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(1, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((19 : Rat) / 2) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((3 : Rat) / 2) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-3 : Rat) / 4) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(1, 3), (7, 1), (14, 1), (16, 1)],
  term (4 : Rat) [(1, 3), (7, 1), (16, 1)],
  term (16 : Rat) [(1, 3), (9, 1), (14, 1), (16, 1)],
  term (-8 : Rat) [(1, 3), (9, 1), (16, 1)],
  term (-3 : Rat) [(7, 1), (10, 1), (15, 1)],
  term ((19 : Rat) / 4) [(7, 1), (15, 1)],
  term (6 : Rat) [(9, 1), (10, 1), (15, 1)],
  term ((-19 : Rat) / 2) [(9, 1), (15, 1)],
  term ((-3 : Rat) / 2) [(11, 1), (15, 1)],
  term ((3 : Rat) / 4) [(13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 6, terms 0 through 9. -/
theorem rs_R009_ueqv_R009NYYNY_block_06_0000_0009_valid :
    checkProductSumEq rs_R009_ueqv_R009NYYNY_partials_06_0000_0009
      rs_R009_ueqv_R009NYYNY_block_06_0000_0009 = true := by
  native_decide

end R009UeqvR009NYYNYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
