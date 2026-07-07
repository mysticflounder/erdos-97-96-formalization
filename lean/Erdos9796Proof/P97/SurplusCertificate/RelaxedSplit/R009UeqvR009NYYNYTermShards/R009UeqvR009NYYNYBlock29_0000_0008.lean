/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NYYNY, term block 29:0-8

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NYYNYTermShards

/-- Generator polynomial 29 for relaxed split surplus certificate `R009:u=v:R009NYYNY`. -/
def rs_R009_ueqv_R009NYYNY_generator_29_0000_0008 : Poly :=
[
  term (1 : Rat) [],
  term (2 : Rat) [(4, 1), (14, 1)],
  term (-1 : Rat) [(4, 2)],
  term (2 : Rat) [(5, 1), (15, 1)],
  term (-1 : Rat) [(5, 2)],
  term (-2 : Rat) [(14, 1)]
]

/-- Coefficient term 0 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYYNY_coefficient_29_0000 : Poly :=
[
  term ((4 : Rat) / 3) []
]

/-- Partial product 0 for generator 29. -/
def rs_R009_ueqv_R009NYYNY_partial_29_0000 : Poly :=
[
  term ((4 : Rat) / 3) [],
  term ((8 : Rat) / 3) [(4, 1), (14, 1)],
  term ((-4 : Rat) / 3) [(4, 2)],
  term ((8 : Rat) / 3) [(5, 1), (15, 1)],
  term ((-4 : Rat) / 3) [(5, 2)],
  term ((-8 : Rat) / 3) [(14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 29. -/
theorem rs_R009_ueqv_R009NYYNY_partial_29_0000_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_29_0000
        rs_R009_ueqv_R009NYYNY_generator_29_0000_0008 =
      rs_R009_ueqv_R009NYYNY_partial_29_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYYNY_coefficient_29_0001 : Poly :=
[
  term (-16 : Rat) [(1, 1), (9, 1)]
]

/-- Partial product 1 for generator 29. -/
def rs_R009_ueqv_R009NYYNY_partial_29_0001 : Poly :=
[
  term (-32 : Rat) [(1, 1), (4, 1), (9, 1), (14, 1)],
  term (16 : Rat) [(1, 1), (4, 2), (9, 1)],
  term (-32 : Rat) [(1, 1), (5, 1), (9, 1), (15, 1)],
  term (16 : Rat) [(1, 1), (5, 2), (9, 1)],
  term (-16 : Rat) [(1, 1), (9, 1)],
  term (32 : Rat) [(1, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 29. -/
theorem rs_R009_ueqv_R009NYYNY_partial_29_0001_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_29_0001
        rs_R009_ueqv_R009NYYNY_generator_29_0000_0008 =
      rs_R009_ueqv_R009NYYNY_partial_29_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYYNY_coefficient_29_0002 : Poly :=
[
  term (32 : Rat) [(1, 1), (13, 1)]
]

/-- Partial product 2 for generator 29. -/
def rs_R009_ueqv_R009NYYNY_partial_29_0002 : Poly :=
[
  term (64 : Rat) [(1, 1), (4, 1), (13, 1), (14, 1)],
  term (-32 : Rat) [(1, 1), (4, 2), (13, 1)],
  term (64 : Rat) [(1, 1), (5, 1), (13, 1), (15, 1)],
  term (-32 : Rat) [(1, 1), (5, 2), (13, 1)],
  term (32 : Rat) [(1, 1), (13, 1)],
  term (-64 : Rat) [(1, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 29. -/
theorem rs_R009_ueqv_R009NYYNY_partial_29_0002_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_29_0002
        rs_R009_ueqv_R009NYYNY_generator_29_0000_0008 =
      rs_R009_ueqv_R009NYYNY_partial_29_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYYNY_coefficient_29_0003 : Poly :=
[
  term ((-4 : Rat) / 3) [(2, 1)]
]

/-- Partial product 3 for generator 29. -/
def rs_R009_ueqv_R009NYYNY_partial_29_0003 : Poly :=
[
  term ((-4 : Rat) / 3) [(2, 1)],
  term ((-8 : Rat) / 3) [(2, 1), (4, 1), (14, 1)],
  term ((4 : Rat) / 3) [(2, 1), (4, 2)],
  term ((-8 : Rat) / 3) [(2, 1), (5, 1), (15, 1)],
  term ((4 : Rat) / 3) [(2, 1), (5, 2)],
  term ((8 : Rat) / 3) [(2, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 29. -/
theorem rs_R009_ueqv_R009NYYNY_partial_29_0003_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_29_0003
        rs_R009_ueqv_R009NYYNY_generator_29_0000_0008 =
      rs_R009_ueqv_R009NYYNY_partial_29_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYYNY_coefficient_29_0004 : Poly :=
[
  term (-5 : Rat) [(3, 1), (9, 1)]
]

/-- Partial product 4 for generator 29. -/
def rs_R009_ueqv_R009NYYNY_partial_29_0004 : Poly :=
[
  term (-10 : Rat) [(3, 1), (4, 1), (9, 1), (14, 1)],
  term (5 : Rat) [(3, 1), (4, 2), (9, 1)],
  term (-10 : Rat) [(3, 1), (5, 1), (9, 1), (15, 1)],
  term (5 : Rat) [(3, 1), (5, 2), (9, 1)],
  term (-5 : Rat) [(3, 1), (9, 1)],
  term (10 : Rat) [(3, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 29. -/
theorem rs_R009_ueqv_R009NYYNY_partial_29_0004_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_29_0004
        rs_R009_ueqv_R009NYYNY_generator_29_0000_0008 =
      rs_R009_ueqv_R009NYYNY_partial_29_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYYNY_coefficient_29_0005 : Poly :=
[
  term (4 : Rat) [(3, 1), (13, 1)]
]

/-- Partial product 5 for generator 29. -/
def rs_R009_ueqv_R009NYYNY_partial_29_0005 : Poly :=
[
  term (8 : Rat) [(3, 1), (4, 1), (13, 1), (14, 1)],
  term (-4 : Rat) [(3, 1), (4, 2), (13, 1)],
  term (8 : Rat) [(3, 1), (5, 1), (13, 1), (15, 1)],
  term (-4 : Rat) [(3, 1), (5, 2), (13, 1)],
  term (4 : Rat) [(3, 1), (13, 1)],
  term (-8 : Rat) [(3, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 29. -/
theorem rs_R009_ueqv_R009NYYNY_partial_29_0005_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_29_0005
        rs_R009_ueqv_R009NYYNY_generator_29_0000_0008 =
      rs_R009_ueqv_R009NYYNY_partial_29_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYYNY_coefficient_29_0006 : Poly :=
[
  term ((-4 : Rat) / 3) [(9, 1), (13, 1)]
]

/-- Partial product 6 for generator 29. -/
def rs_R009_ueqv_R009NYYNY_partial_29_0006 : Poly :=
[
  term ((-8 : Rat) / 3) [(4, 1), (9, 1), (13, 1), (14, 1)],
  term ((4 : Rat) / 3) [(4, 2), (9, 1), (13, 1)],
  term ((-8 : Rat) / 3) [(5, 1), (9, 1), (13, 1), (15, 1)],
  term ((4 : Rat) / 3) [(5, 2), (9, 1), (13, 1)],
  term ((-4 : Rat) / 3) [(9, 1), (13, 1)],
  term ((8 : Rat) / 3) [(9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 29. -/
theorem rs_R009_ueqv_R009NYYNY_partial_29_0006_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_29_0006
        rs_R009_ueqv_R009NYYNY_generator_29_0000_0008 =
      rs_R009_ueqv_R009NYYNY_partial_29_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYYNY_coefficient_29_0007 : Poly :=
[
  term ((16 : Rat) / 3) [(9, 1), (15, 1)]
]

/-- Partial product 7 for generator 29. -/
def rs_R009_ueqv_R009NYYNY_partial_29_0007 : Poly :=
[
  term ((32 : Rat) / 3) [(4, 1), (9, 1), (14, 1), (15, 1)],
  term ((-16 : Rat) / 3) [(4, 2), (9, 1), (15, 1)],
  term ((32 : Rat) / 3) [(5, 1), (9, 1), (15, 2)],
  term ((-16 : Rat) / 3) [(5, 2), (9, 1), (15, 1)],
  term ((-32 : Rat) / 3) [(9, 1), (14, 1), (15, 1)],
  term ((16 : Rat) / 3) [(9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 29. -/
theorem rs_R009_ueqv_R009NYYNY_partial_29_0007_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_29_0007
        rs_R009_ueqv_R009NYYNY_generator_29_0000_0008 =
      rs_R009_ueqv_R009NYYNY_partial_29_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYYNY_coefficient_29_0008 : Poly :=
[
  term ((52 : Rat) / 3) [(13, 1), (15, 1)]
]

/-- Partial product 8 for generator 29. -/
def rs_R009_ueqv_R009NYYNY_partial_29_0008 : Poly :=
[
  term ((104 : Rat) / 3) [(4, 1), (13, 1), (14, 1), (15, 1)],
  term ((-52 : Rat) / 3) [(4, 2), (13, 1), (15, 1)],
  term ((104 : Rat) / 3) [(5, 1), (13, 1), (15, 2)],
  term ((-52 : Rat) / 3) [(5, 2), (13, 1), (15, 1)],
  term ((-104 : Rat) / 3) [(13, 1), (14, 1), (15, 1)],
  term ((52 : Rat) / 3) [(13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 29. -/
theorem rs_R009_ueqv_R009NYYNY_partial_29_0008_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_29_0008
        rs_R009_ueqv_R009NYYNY_generator_29_0000_0008 =
      rs_R009_ueqv_R009NYYNY_partial_29_0008 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NYYNY_partials_29_0000_0008 : List Poly :=
[
  rs_R009_ueqv_R009NYYNY_partial_29_0000,
  rs_R009_ueqv_R009NYYNY_partial_29_0001,
  rs_R009_ueqv_R009NYYNY_partial_29_0002,
  rs_R009_ueqv_R009NYYNY_partial_29_0003,
  rs_R009_ueqv_R009NYYNY_partial_29_0004,
  rs_R009_ueqv_R009NYYNY_partial_29_0005,
  rs_R009_ueqv_R009NYYNY_partial_29_0006,
  rs_R009_ueqv_R009NYYNY_partial_29_0007,
  rs_R009_ueqv_R009NYYNY_partial_29_0008
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NYYNY_block_29_0000_0008 : Poly :=
[
  term ((4 : Rat) / 3) [],
  term (-32 : Rat) [(1, 1), (4, 1), (9, 1), (14, 1)],
  term (64 : Rat) [(1, 1), (4, 1), (13, 1), (14, 1)],
  term (16 : Rat) [(1, 1), (4, 2), (9, 1)],
  term (-32 : Rat) [(1, 1), (4, 2), (13, 1)],
  term (-32 : Rat) [(1, 1), (5, 1), (9, 1), (15, 1)],
  term (64 : Rat) [(1, 1), (5, 1), (13, 1), (15, 1)],
  term (16 : Rat) [(1, 1), (5, 2), (9, 1)],
  term (-32 : Rat) [(1, 1), (5, 2), (13, 1)],
  term (-16 : Rat) [(1, 1), (9, 1)],
  term (32 : Rat) [(1, 1), (9, 1), (14, 1)],
  term (32 : Rat) [(1, 1), (13, 1)],
  term (-64 : Rat) [(1, 1), (13, 1), (14, 1)],
  term ((-4 : Rat) / 3) [(2, 1)],
  term ((-8 : Rat) / 3) [(2, 1), (4, 1), (14, 1)],
  term ((4 : Rat) / 3) [(2, 1), (4, 2)],
  term ((-8 : Rat) / 3) [(2, 1), (5, 1), (15, 1)],
  term ((4 : Rat) / 3) [(2, 1), (5, 2)],
  term ((8 : Rat) / 3) [(2, 1), (14, 1)],
  term (-10 : Rat) [(3, 1), (4, 1), (9, 1), (14, 1)],
  term (8 : Rat) [(3, 1), (4, 1), (13, 1), (14, 1)],
  term (5 : Rat) [(3, 1), (4, 2), (9, 1)],
  term (-4 : Rat) [(3, 1), (4, 2), (13, 1)],
  term (-10 : Rat) [(3, 1), (5, 1), (9, 1), (15, 1)],
  term (8 : Rat) [(3, 1), (5, 1), (13, 1), (15, 1)],
  term (5 : Rat) [(3, 1), (5, 2), (9, 1)],
  term (-4 : Rat) [(3, 1), (5, 2), (13, 1)],
  term (-5 : Rat) [(3, 1), (9, 1)],
  term (10 : Rat) [(3, 1), (9, 1), (14, 1)],
  term (4 : Rat) [(3, 1), (13, 1)],
  term (-8 : Rat) [(3, 1), (13, 1), (14, 1)],
  term ((-8 : Rat) / 3) [(4, 1), (9, 1), (13, 1), (14, 1)],
  term ((32 : Rat) / 3) [(4, 1), (9, 1), (14, 1), (15, 1)],
  term ((104 : Rat) / 3) [(4, 1), (13, 1), (14, 1), (15, 1)],
  term ((8 : Rat) / 3) [(4, 1), (14, 1)],
  term ((-4 : Rat) / 3) [(4, 2)],
  term ((4 : Rat) / 3) [(4, 2), (9, 1), (13, 1)],
  term ((-16 : Rat) / 3) [(4, 2), (9, 1), (15, 1)],
  term ((-52 : Rat) / 3) [(4, 2), (13, 1), (15, 1)],
  term ((-8 : Rat) / 3) [(5, 1), (9, 1), (13, 1), (15, 1)],
  term ((32 : Rat) / 3) [(5, 1), (9, 1), (15, 2)],
  term ((104 : Rat) / 3) [(5, 1), (13, 1), (15, 2)],
  term ((8 : Rat) / 3) [(5, 1), (15, 1)],
  term ((-4 : Rat) / 3) [(5, 2)],
  term ((4 : Rat) / 3) [(5, 2), (9, 1), (13, 1)],
  term ((-16 : Rat) / 3) [(5, 2), (9, 1), (15, 1)],
  term ((-52 : Rat) / 3) [(5, 2), (13, 1), (15, 1)],
  term ((-4 : Rat) / 3) [(9, 1), (13, 1)],
  term ((8 : Rat) / 3) [(9, 1), (13, 1), (14, 1)],
  term ((-32 : Rat) / 3) [(9, 1), (14, 1), (15, 1)],
  term ((16 : Rat) / 3) [(9, 1), (15, 1)],
  term ((-104 : Rat) / 3) [(13, 1), (14, 1), (15, 1)],
  term ((52 : Rat) / 3) [(13, 1), (15, 1)],
  term ((-8 : Rat) / 3) [(14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 29, terms 0 through 8. -/
theorem rs_R009_ueqv_R009NYYNY_block_29_0000_0008_valid :
    checkProductSumEq rs_R009_ueqv_R009NYYNY_partials_29_0000_0008
      rs_R009_ueqv_R009NYYNY_block_29_0000_0008 = true := by
  native_decide

end R009UeqvR009NYYNYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
