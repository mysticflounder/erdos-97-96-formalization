/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009YNNNN, term block 15:0-9

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009YNNNNTermShards

/-- Generator polynomial 15 for relaxed split surplus certificate `R009:u=v:R009YNNNN`. -/
def rs_R009_ueqv_R009YNNNN_generator_15_0000_0009 : Poly :=
[
  term (2 : Rat) [(4, 1), (8, 1)],
  term (2 : Rat) [(5, 1), (9, 1)],
  term (-1 : Rat) [(8, 2)],
  term (-1 : Rat) [(9, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009YNNNN_coefficient_15_0000 : Poly :=
[
  term ((640 : Rat) / 21) [(3, 1), (9, 1)]
]

/-- Partial product 0 for generator 15. -/
def rs_R009_ueqv_R009YNNNN_partial_15_0000 : Poly :=
[
  term ((1280 : Rat) / 21) [(3, 1), (4, 1), (8, 1), (9, 1)],
  term ((1280 : Rat) / 21) [(3, 1), (5, 1), (9, 2)],
  term ((-640 : Rat) / 21) [(3, 1), (8, 2), (9, 1)],
  term ((-640 : Rat) / 21) [(3, 1), (9, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 15. -/
theorem rs_R009_ueqv_R009YNNNN_partial_15_0000_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_15_0000
        rs_R009_ueqv_R009YNNNN_generator_15_0000_0009 =
      rs_R009_ueqv_R009YNNNN_partial_15_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009YNNNN_coefficient_15_0001 : Poly :=
[
  term ((-320 : Rat) / 7) [(3, 1), (9, 1), (14, 1)]
]

/-- Partial product 1 for generator 15. -/
def rs_R009_ueqv_R009YNNNN_partial_15_0001 : Poly :=
[
  term ((-640 : Rat) / 7) [(3, 1), (4, 1), (8, 1), (9, 1), (14, 1)],
  term ((-640 : Rat) / 7) [(3, 1), (5, 1), (9, 2), (14, 1)],
  term ((320 : Rat) / 7) [(3, 1), (8, 2), (9, 1), (14, 1)],
  term ((320 : Rat) / 7) [(3, 1), (9, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 15. -/
theorem rs_R009_ueqv_R009YNNNN_partial_15_0001_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_15_0001
        rs_R009_ueqv_R009YNNNN_generator_15_0000_0009 =
      rs_R009_ueqv_R009YNNNN_partial_15_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009YNNNN_coefficient_15_0002 : Poly :=
[
  term ((-97280 : Rat) / 343) [(3, 1), (9, 1), (15, 2)]
]

/-- Partial product 2 for generator 15. -/
def rs_R009_ueqv_R009YNNNN_partial_15_0002 : Poly :=
[
  term ((-194560 : Rat) / 343) [(3, 1), (4, 1), (8, 1), (9, 1), (15, 2)],
  term ((-194560 : Rat) / 343) [(3, 1), (5, 1), (9, 2), (15, 2)],
  term ((97280 : Rat) / 343) [(3, 1), (8, 2), (9, 1), (15, 2)],
  term ((97280 : Rat) / 343) [(3, 1), (9, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 15. -/
theorem rs_R009_ueqv_R009YNNNN_partial_15_0002_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_15_0002
        rs_R009_ueqv_R009YNNNN_generator_15_0000_0009 =
      rs_R009_ueqv_R009YNNNN_partial_15_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009YNNNN_coefficient_15_0003 : Poly :=
[
  term ((-1280 : Rat) / 21) [(3, 1), (13, 1)]
]

/-- Partial product 3 for generator 15. -/
def rs_R009_ueqv_R009YNNNN_partial_15_0003 : Poly :=
[
  term ((-2560 : Rat) / 21) [(3, 1), (4, 1), (8, 1), (13, 1)],
  term ((-2560 : Rat) / 21) [(3, 1), (5, 1), (9, 1), (13, 1)],
  term ((1280 : Rat) / 21) [(3, 1), (8, 2), (13, 1)],
  term ((1280 : Rat) / 21) [(3, 1), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 15. -/
theorem rs_R009_ueqv_R009YNNNN_partial_15_0003_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_15_0003
        rs_R009_ueqv_R009YNNNN_generator_15_0000_0009 =
      rs_R009_ueqv_R009YNNNN_partial_15_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009YNNNN_coefficient_15_0004 : Poly :=
[
  term ((640 : Rat) / 7) [(3, 1), (13, 1), (14, 1)]
]

/-- Partial product 4 for generator 15. -/
def rs_R009_ueqv_R009YNNNN_partial_15_0004 : Poly :=
[
  term ((1280 : Rat) / 7) [(3, 1), (4, 1), (8, 1), (13, 1), (14, 1)],
  term ((1280 : Rat) / 7) [(3, 1), (5, 1), (9, 1), (13, 1), (14, 1)],
  term ((-640 : Rat) / 7) [(3, 1), (8, 2), (13, 1), (14, 1)],
  term ((-640 : Rat) / 7) [(3, 1), (9, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 15. -/
theorem rs_R009_ueqv_R009YNNNN_partial_15_0004_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_15_0004
        rs_R009_ueqv_R009YNNNN_generator_15_0000_0009 =
      rs_R009_ueqv_R009YNNNN_partial_15_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009YNNNN_coefficient_15_0005 : Poly :=
[
  term ((194560 : Rat) / 343) [(3, 1), (13, 1), (15, 2)]
]

/-- Partial product 5 for generator 15. -/
def rs_R009_ueqv_R009YNNNN_partial_15_0005 : Poly :=
[
  term ((389120 : Rat) / 343) [(3, 1), (4, 1), (8, 1), (13, 1), (15, 2)],
  term ((389120 : Rat) / 343) [(3, 1), (5, 1), (9, 1), (13, 1), (15, 2)],
  term ((-194560 : Rat) / 343) [(3, 1), (8, 2), (13, 1), (15, 2)],
  term ((-194560 : Rat) / 343) [(3, 1), (9, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 15. -/
theorem rs_R009_ueqv_R009YNNNN_partial_15_0005_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_15_0005
        rs_R009_ueqv_R009YNNNN_generator_15_0000_0009 =
      rs_R009_ueqv_R009YNNNN_partial_15_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009YNNNN_coefficient_15_0006 : Poly :=
[
  term ((-8 : Rat) / 3) [(9, 1), (15, 1)]
]

/-- Partial product 6 for generator 15. -/
def rs_R009_ueqv_R009YNNNN_partial_15_0006 : Poly :=
[
  term ((-16 : Rat) / 3) [(4, 1), (8, 1), (9, 1), (15, 1)],
  term ((-16 : Rat) / 3) [(5, 1), (9, 2), (15, 1)],
  term ((8 : Rat) / 3) [(8, 2), (9, 1), (15, 1)],
  term ((8 : Rat) / 3) [(9, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 15. -/
theorem rs_R009_ueqv_R009YNNNN_partial_15_0006_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_15_0006
        rs_R009_ueqv_R009YNNNN_generator_15_0000_0009 =
      rs_R009_ueqv_R009YNNNN_partial_15_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009YNNNN_coefficient_15_0007 : Poly :=
[
  term ((4 : Rat) / 3) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 7 for generator 15. -/
def rs_R009_ueqv_R009YNNNN_partial_15_0007 : Poly :=
[
  term ((8 : Rat) / 3) [(4, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 3) [(5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(8, 2), (9, 1), (15, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 15. -/
theorem rs_R009_ueqv_R009YNNNN_partial_15_0007_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_15_0007
        rs_R009_ueqv_R009YNNNN_generator_15_0000_0009 =
      rs_R009_ueqv_R009YNNNN_partial_15_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009YNNNN_coefficient_15_0008 : Poly :=
[
  term ((16 : Rat) / 3) [(13, 1), (15, 1)]
]

/-- Partial product 8 for generator 15. -/
def rs_R009_ueqv_R009YNNNN_partial_15_0008 : Poly :=
[
  term ((32 : Rat) / 3) [(4, 1), (8, 1), (13, 1), (15, 1)],
  term ((32 : Rat) / 3) [(5, 1), (9, 1), (13, 1), (15, 1)],
  term ((-16 : Rat) / 3) [(8, 2), (13, 1), (15, 1)],
  term ((-16 : Rat) / 3) [(9, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 15. -/
theorem rs_R009_ueqv_R009YNNNN_partial_15_0008_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_15_0008
        rs_R009_ueqv_R009YNNNN_generator_15_0000_0009 =
      rs_R009_ueqv_R009YNNNN_partial_15_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009YNNNN_coefficient_15_0009 : Poly :=
[
  term ((-4 : Rat) / 3) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 9 for generator 15. -/
def rs_R009_ueqv_R009YNNNN_partial_15_0009 : Poly :=
[
  term ((-8 : Rat) / 3) [(4, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-8 : Rat) / 3) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((4 : Rat) / 3) [(8, 2), (13, 1), (15, 1), (16, 1)],
  term ((4 : Rat) / 3) [(9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 15. -/
theorem rs_R009_ueqv_R009YNNNN_partial_15_0009_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_15_0009
        rs_R009_ueqv_R009YNNNN_generator_15_0000_0009 =
      rs_R009_ueqv_R009YNNNN_partial_15_0009 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_partials_15_0000_0009 : List Poly :=
[
  rs_R009_ueqv_R009YNNNN_partial_15_0000,
  rs_R009_ueqv_R009YNNNN_partial_15_0001,
  rs_R009_ueqv_R009YNNNN_partial_15_0002,
  rs_R009_ueqv_R009YNNNN_partial_15_0003,
  rs_R009_ueqv_R009YNNNN_partial_15_0004,
  rs_R009_ueqv_R009YNNNN_partial_15_0005,
  rs_R009_ueqv_R009YNNNN_partial_15_0006,
  rs_R009_ueqv_R009YNNNN_partial_15_0007,
  rs_R009_ueqv_R009YNNNN_partial_15_0008,
  rs_R009_ueqv_R009YNNNN_partial_15_0009
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_block_15_0000_0009 : Poly :=
[
  term ((1280 : Rat) / 21) [(3, 1), (4, 1), (8, 1), (9, 1)],
  term ((-640 : Rat) / 7) [(3, 1), (4, 1), (8, 1), (9, 1), (14, 1)],
  term ((-194560 : Rat) / 343) [(3, 1), (4, 1), (8, 1), (9, 1), (15, 2)],
  term ((-2560 : Rat) / 21) [(3, 1), (4, 1), (8, 1), (13, 1)],
  term ((1280 : Rat) / 7) [(3, 1), (4, 1), (8, 1), (13, 1), (14, 1)],
  term ((389120 : Rat) / 343) [(3, 1), (4, 1), (8, 1), (13, 1), (15, 2)],
  term ((-2560 : Rat) / 21) [(3, 1), (5, 1), (9, 1), (13, 1)],
  term ((1280 : Rat) / 7) [(3, 1), (5, 1), (9, 1), (13, 1), (14, 1)],
  term ((389120 : Rat) / 343) [(3, 1), (5, 1), (9, 1), (13, 1), (15, 2)],
  term ((1280 : Rat) / 21) [(3, 1), (5, 1), (9, 2)],
  term ((-640 : Rat) / 7) [(3, 1), (5, 1), (9, 2), (14, 1)],
  term ((-194560 : Rat) / 343) [(3, 1), (5, 1), (9, 2), (15, 2)],
  term ((-640 : Rat) / 21) [(3, 1), (8, 2), (9, 1)],
  term ((320 : Rat) / 7) [(3, 1), (8, 2), (9, 1), (14, 1)],
  term ((97280 : Rat) / 343) [(3, 1), (8, 2), (9, 1), (15, 2)],
  term ((1280 : Rat) / 21) [(3, 1), (8, 2), (13, 1)],
  term ((-640 : Rat) / 7) [(3, 1), (8, 2), (13, 1), (14, 1)],
  term ((-194560 : Rat) / 343) [(3, 1), (8, 2), (13, 1), (15, 2)],
  term ((1280 : Rat) / 21) [(3, 1), (9, 2), (13, 1)],
  term ((-640 : Rat) / 7) [(3, 1), (9, 2), (13, 1), (14, 1)],
  term ((-194560 : Rat) / 343) [(3, 1), (9, 2), (13, 1), (15, 2)],
  term ((-640 : Rat) / 21) [(3, 1), (9, 3)],
  term ((320 : Rat) / 7) [(3, 1), (9, 3), (14, 1)],
  term ((97280 : Rat) / 343) [(3, 1), (9, 3), (15, 2)],
  term ((-16 : Rat) / 3) [(4, 1), (8, 1), (9, 1), (15, 1)],
  term ((8 : Rat) / 3) [(4, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 3) [(4, 1), (8, 1), (13, 1), (15, 1)],
  term ((-8 : Rat) / 3) [(4, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 3) [(5, 1), (9, 1), (13, 1), (15, 1)],
  term ((-8 : Rat) / 3) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 3) [(5, 1), (9, 2), (15, 1)],
  term ((8 : Rat) / 3) [(5, 1), (9, 2), (15, 1), (16, 1)],
  term ((8 : Rat) / 3) [(8, 2), (9, 1), (15, 1)],
  term ((-4 : Rat) / 3) [(8, 2), (9, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 3) [(8, 2), (13, 1), (15, 1)],
  term ((4 : Rat) / 3) [(8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 3) [(9, 2), (13, 1), (15, 1)],
  term ((4 : Rat) / 3) [(9, 2), (13, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 3) [(9, 3), (15, 1)],
  term ((-4 : Rat) / 3) [(9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 15, terms 0 through 9. -/
theorem rs_R009_ueqv_R009YNNNN_block_15_0000_0009_valid :
    checkProductSumEq rs_R009_ueqv_R009YNNNN_partials_15_0000_0009
      rs_R009_ueqv_R009YNNNN_block_15_0000_0009 = true := by
  native_decide

end R009UeqvR009YNNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
