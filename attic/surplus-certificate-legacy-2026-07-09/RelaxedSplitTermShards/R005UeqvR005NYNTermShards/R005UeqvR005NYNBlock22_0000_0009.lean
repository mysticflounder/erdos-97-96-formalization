/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R005:u=v:R005NYN, term block 22:0-9

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R005UeqvR005NYNTermShards

/-- Generator polynomial 22 for relaxed split surplus certificate `R005:u=v:R005NYN`. -/
def rs_R005_ueqv_R005NYN_generator_22_0000_0009 : Poly :=
[
  term (-2 : Rat) [(0, 1), (10, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (11, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(4, 1), (10, 1)],
  term (-1 : Rat) [(4, 2)],
  term (2 : Rat) [(5, 1), (11, 1)],
  term (-1 : Rat) [(5, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 22. -/
def rs_R005_ueqv_R005NYN_coefficient_22_0000 : Poly :=
[
  term ((266240 : Rat) / 52799) [(0, 1), (15, 2)]
]

/-- Partial product 0 for generator 22. -/
def rs_R005_ueqv_R005NYN_partial_22_0000 : Poly :=
[
  term ((-532480 : Rat) / 52799) [(0, 1), (1, 1), (11, 1), (15, 2)],
  term ((266240 : Rat) / 52799) [(0, 1), (1, 2), (15, 2)],
  term ((532480 : Rat) / 52799) [(0, 1), (4, 1), (10, 1), (15, 2)],
  term ((-266240 : Rat) / 52799) [(0, 1), (4, 2), (15, 2)],
  term ((532480 : Rat) / 52799) [(0, 1), (5, 1), (11, 1), (15, 2)],
  term ((-266240 : Rat) / 52799) [(0, 1), (5, 2), (15, 2)],
  term ((-532480 : Rat) / 52799) [(0, 2), (10, 1), (15, 2)],
  term ((266240 : Rat) / 52799) [(0, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 22. -/
theorem rs_R005_ueqv_R005NYN_partial_22_0000_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_22_0000
        rs_R005_ueqv_R005NYN_generator_22_0000_0009 =
      rs_R005_ueqv_R005NYN_partial_22_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 22. -/
def rs_R005_ueqv_R005NYN_coefficient_22_0001 : Poly :=
[
  term ((1617024 : Rat) / 385571) [(0, 1), (15, 2), (16, 1)]
]

/-- Partial product 1 for generator 22. -/
def rs_R005_ueqv_R005NYN_partial_22_0001 : Poly :=
[
  term ((-3234048 : Rat) / 385571) [(0, 1), (1, 1), (11, 1), (15, 2), (16, 1)],
  term ((1617024 : Rat) / 385571) [(0, 1), (1, 2), (15, 2), (16, 1)],
  term ((3234048 : Rat) / 385571) [(0, 1), (4, 1), (10, 1), (15, 2), (16, 1)],
  term ((-1617024 : Rat) / 385571) [(0, 1), (4, 2), (15, 2), (16, 1)],
  term ((3234048 : Rat) / 385571) [(0, 1), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1617024 : Rat) / 385571) [(0, 1), (5, 2), (15, 2), (16, 1)],
  term ((-3234048 : Rat) / 385571) [(0, 2), (10, 1), (15, 2), (16, 1)],
  term ((1617024 : Rat) / 385571) [(0, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 22. -/
theorem rs_R005_ueqv_R005NYN_partial_22_0001_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_22_0001
        rs_R005_ueqv_R005NYN_generator_22_0000_0009 =
      rs_R005_ueqv_R005NYN_partial_22_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 22. -/
def rs_R005_ueqv_R005NYN_coefficient_22_0002 : Poly :=
[
  term ((-1556480 : Rat) / 52799) [(8, 1), (11, 1), (15, 1)]
]

/-- Partial product 2 for generator 22. -/
def rs_R005_ueqv_R005NYN_partial_22_0002 : Poly :=
[
  term ((3112960 : Rat) / 52799) [(0, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-1556480 : Rat) / 52799) [(0, 2), (8, 1), (11, 1), (15, 1)],
  term ((3112960 : Rat) / 52799) [(1, 1), (8, 1), (11, 2), (15, 1)],
  term ((-1556480 : Rat) / 52799) [(1, 2), (8, 1), (11, 1), (15, 1)],
  term ((-3112960 : Rat) / 52799) [(4, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((1556480 : Rat) / 52799) [(4, 2), (8, 1), (11, 1), (15, 1)],
  term ((-3112960 : Rat) / 52799) [(5, 1), (8, 1), (11, 2), (15, 1)],
  term ((1556480 : Rat) / 52799) [(5, 2), (8, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 22. -/
theorem rs_R005_ueqv_R005NYN_partial_22_0002_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_22_0002
        rs_R005_ueqv_R005NYN_generator_22_0000_0009 =
      rs_R005_ueqv_R005NYN_partial_22_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 22. -/
def rs_R005_ueqv_R005NYN_coefficient_22_0003 : Poly :=
[
  term ((4583040 : Rat) / 385571) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 3 for generator 22. -/
def rs_R005_ueqv_R005NYN_partial_22_0003 : Poly :=
[
  term ((-9166080 : Rat) / 385571) [(0, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((4583040 : Rat) / 385571) [(0, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-9166080 : Rat) / 385571) [(1, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((4583040 : Rat) / 385571) [(1, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((9166080 : Rat) / 385571) [(4, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(4, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((9166080 : Rat) / 385571) [(5, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(5, 2), (8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 22. -/
theorem rs_R005_ueqv_R005NYN_partial_22_0003_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_22_0003
        rs_R005_ueqv_R005NYN_generator_22_0000_0009 =
      rs_R005_ueqv_R005NYN_partial_22_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 22. -/
def rs_R005_ueqv_R005NYN_coefficient_22_0004 : Poly :=
[
  term ((-2723840 : Rat) / 52799) [(9, 1), (15, 1)]
]

/-- Partial product 4 for generator 22. -/
def rs_R005_ueqv_R005NYN_partial_22_0004 : Poly :=
[
  term ((5447680 : Rat) / 52799) [(0, 1), (9, 1), (10, 1), (15, 1)],
  term ((-2723840 : Rat) / 52799) [(0, 2), (9, 1), (15, 1)],
  term ((5447680 : Rat) / 52799) [(1, 1), (9, 1), (11, 1), (15, 1)],
  term ((-2723840 : Rat) / 52799) [(1, 2), (9, 1), (15, 1)],
  term ((-5447680 : Rat) / 52799) [(4, 1), (9, 1), (10, 1), (15, 1)],
  term ((2723840 : Rat) / 52799) [(4, 2), (9, 1), (15, 1)],
  term ((-5447680 : Rat) / 52799) [(5, 1), (9, 1), (11, 1), (15, 1)],
  term ((2723840 : Rat) / 52799) [(5, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 22. -/
theorem rs_R005_ueqv_R005NYN_partial_22_0004_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_22_0004
        rs_R005_ueqv_R005NYN_generator_22_0000_0009 =
      rs_R005_ueqv_R005NYN_partial_22_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 22. -/
def rs_R005_ueqv_R005NYN_coefficient_22_0005 : Poly :=
[
  term ((8020320 : Rat) / 385571) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 5 for generator 22. -/
def rs_R005_ueqv_R005NYN_partial_22_0005 : Poly :=
[
  term ((-16040640 : Rat) / 385571) [(0, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((8020320 : Rat) / 385571) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((-16040640 : Rat) / 385571) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((8020320 : Rat) / 385571) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((16040640 : Rat) / 385571) [(4, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-8020320 : Rat) / 385571) [(4, 2), (9, 1), (15, 1), (16, 1)],
  term ((16040640 : Rat) / 385571) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-8020320 : Rat) / 385571) [(5, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 22. -/
theorem rs_R005_ueqv_R005NYN_partial_22_0005_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_22_0005
        rs_R005_ueqv_R005NYN_generator_22_0000_0009 =
      rs_R005_ueqv_R005NYN_partial_22_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 22. -/
def rs_R005_ueqv_R005NYN_coefficient_22_0006 : Poly :=
[
  term ((1556480 : Rat) / 52799) [(11, 1), (15, 1)]
]

/-- Partial product 6 for generator 22. -/
def rs_R005_ueqv_R005NYN_partial_22_0006 : Poly :=
[
  term ((-3112960 : Rat) / 52799) [(0, 1), (10, 1), (11, 1), (15, 1)],
  term ((1556480 : Rat) / 52799) [(0, 2), (11, 1), (15, 1)],
  term ((-3112960 : Rat) / 52799) [(1, 1), (11, 2), (15, 1)],
  term ((1556480 : Rat) / 52799) [(1, 2), (11, 1), (15, 1)],
  term ((3112960 : Rat) / 52799) [(4, 1), (10, 1), (11, 1), (15, 1)],
  term ((-1556480 : Rat) / 52799) [(4, 2), (11, 1), (15, 1)],
  term ((3112960 : Rat) / 52799) [(5, 1), (11, 2), (15, 1)],
  term ((-1556480 : Rat) / 52799) [(5, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 22. -/
theorem rs_R005_ueqv_R005NYN_partial_22_0006_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_22_0006
        rs_R005_ueqv_R005NYN_generator_22_0000_0009 =
      rs_R005_ueqv_R005NYN_partial_22_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 22. -/
def rs_R005_ueqv_R005NYN_coefficient_22_0007 : Poly :=
[
  term ((-4583040 : Rat) / 385571) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 7 for generator 22. -/
def rs_R005_ueqv_R005NYN_partial_22_0007 : Poly :=
[
  term ((9166080 : Rat) / 385571) [(0, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((9166080 : Rat) / 385571) [(1, 1), (11, 2), (15, 1), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-9166080 : Rat) / 385571) [(4, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((4583040 : Rat) / 385571) [(4, 2), (11, 1), (15, 1), (16, 1)],
  term ((-9166080 : Rat) / 385571) [(5, 1), (11, 2), (15, 1), (16, 1)],
  term ((4583040 : Rat) / 385571) [(5, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 22. -/
theorem rs_R005_ueqv_R005NYN_partial_22_0007_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_22_0007
        rs_R005_ueqv_R005NYN_generator_22_0000_0009 =
      rs_R005_ueqv_R005NYN_partial_22_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 22. -/
def rs_R005_ueqv_R005NYN_coefficient_22_0008 : Poly :=
[
  term ((2555936 : Rat) / 52799) [(15, 2)]
]

/-- Partial product 8 for generator 22. -/
def rs_R005_ueqv_R005NYN_partial_22_0008 : Poly :=
[
  term ((-5111872 : Rat) / 52799) [(0, 1), (10, 1), (15, 2)],
  term ((2555936 : Rat) / 52799) [(0, 2), (15, 2)],
  term ((-5111872 : Rat) / 52799) [(1, 1), (11, 1), (15, 2)],
  term ((2555936 : Rat) / 52799) [(1, 2), (15, 2)],
  term ((5111872 : Rat) / 52799) [(4, 1), (10, 1), (15, 2)],
  term ((-2555936 : Rat) / 52799) [(4, 2), (15, 2)],
  term ((5111872 : Rat) / 52799) [(5, 1), (11, 1), (15, 2)],
  term ((-2555936 : Rat) / 52799) [(5, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 22. -/
theorem rs_R005_ueqv_R005NYN_partial_22_0008_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_22_0008
        rs_R005_ueqv_R005NYN_generator_22_0000_0009 =
      rs_R005_ueqv_R005NYN_partial_22_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 22. -/
def rs_R005_ueqv_R005NYN_coefficient_22_0009 : Poly :=
[
  term ((-12834312 : Rat) / 385571) [(15, 2), (16, 1)]
]

/-- Partial product 9 for generator 22. -/
def rs_R005_ueqv_R005NYN_partial_22_0009 : Poly :=
[
  term ((25668624 : Rat) / 385571) [(0, 1), (10, 1), (15, 2), (16, 1)],
  term ((-12834312 : Rat) / 385571) [(0, 2), (15, 2), (16, 1)],
  term ((25668624 : Rat) / 385571) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term ((-12834312 : Rat) / 385571) [(1, 2), (15, 2), (16, 1)],
  term ((-25668624 : Rat) / 385571) [(4, 1), (10, 1), (15, 2), (16, 1)],
  term ((12834312 : Rat) / 385571) [(4, 2), (15, 2), (16, 1)],
  term ((-25668624 : Rat) / 385571) [(5, 1), (11, 1), (15, 2), (16, 1)],
  term ((12834312 : Rat) / 385571) [(5, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 22. -/
theorem rs_R005_ueqv_R005NYN_partial_22_0009_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_22_0009
        rs_R005_ueqv_R005NYN_generator_22_0000_0009 =
      rs_R005_ueqv_R005NYN_partial_22_0009 := by
  native_decide

/-- Partial products in this block. -/
def rs_R005_ueqv_R005NYN_partials_22_0000_0009 : List Poly :=
[
  rs_R005_ueqv_R005NYN_partial_22_0000,
  rs_R005_ueqv_R005NYN_partial_22_0001,
  rs_R005_ueqv_R005NYN_partial_22_0002,
  rs_R005_ueqv_R005NYN_partial_22_0003,
  rs_R005_ueqv_R005NYN_partial_22_0004,
  rs_R005_ueqv_R005NYN_partial_22_0005,
  rs_R005_ueqv_R005NYN_partial_22_0006,
  rs_R005_ueqv_R005NYN_partial_22_0007,
  rs_R005_ueqv_R005NYN_partial_22_0008,
  rs_R005_ueqv_R005NYN_partial_22_0009
]

/-- Sum of partial products in this block. -/
def rs_R005_ueqv_R005NYN_block_22_0000_0009 : Poly :=
[
  term ((-532480 : Rat) / 52799) [(0, 1), (1, 1), (11, 1), (15, 2)],
  term ((-3234048 : Rat) / 385571) [(0, 1), (1, 1), (11, 1), (15, 2), (16, 1)],
  term ((266240 : Rat) / 52799) [(0, 1), (1, 2), (15, 2)],
  term ((1617024 : Rat) / 385571) [(0, 1), (1, 2), (15, 2), (16, 1)],
  term ((532480 : Rat) / 52799) [(0, 1), (4, 1), (10, 1), (15, 2)],
  term ((3234048 : Rat) / 385571) [(0, 1), (4, 1), (10, 1), (15, 2), (16, 1)],
  term ((-266240 : Rat) / 52799) [(0, 1), (4, 2), (15, 2)],
  term ((-1617024 : Rat) / 385571) [(0, 1), (4, 2), (15, 2), (16, 1)],
  term ((532480 : Rat) / 52799) [(0, 1), (5, 1), (11, 1), (15, 2)],
  term ((3234048 : Rat) / 385571) [(0, 1), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((-266240 : Rat) / 52799) [(0, 1), (5, 2), (15, 2)],
  term ((-1617024 : Rat) / 385571) [(0, 1), (5, 2), (15, 2), (16, 1)],
  term ((3112960 : Rat) / 52799) [(0, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-9166080 : Rat) / 385571) [(0, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((5447680 : Rat) / 52799) [(0, 1), (9, 1), (10, 1), (15, 1)],
  term ((-16040640 : Rat) / 385571) [(0, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-3112960 : Rat) / 52799) [(0, 1), (10, 1), (11, 1), (15, 1)],
  term ((9166080 : Rat) / 385571) [(0, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-5111872 : Rat) / 52799) [(0, 1), (10, 1), (15, 2)],
  term ((25668624 : Rat) / 385571) [(0, 1), (10, 1), (15, 2), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(0, 2), (8, 1), (11, 1), (15, 1)],
  term ((4583040 : Rat) / 385571) [(0, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2723840 : Rat) / 52799) [(0, 2), (9, 1), (15, 1)],
  term ((8020320 : Rat) / 385571) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((-532480 : Rat) / 52799) [(0, 2), (10, 1), (15, 2)],
  term ((-3234048 : Rat) / 385571) [(0, 2), (10, 1), (15, 2), (16, 1)],
  term ((1556480 : Rat) / 52799) [(0, 2), (11, 1), (15, 1)],
  term ((-4583040 : Rat) / 385571) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((2555936 : Rat) / 52799) [(0, 2), (15, 2)],
  term ((-12834312 : Rat) / 385571) [(0, 2), (15, 2), (16, 1)],
  term ((266240 : Rat) / 52799) [(0, 3), (15, 2)],
  term ((1617024 : Rat) / 385571) [(0, 3), (15, 2), (16, 1)],
  term ((3112960 : Rat) / 52799) [(1, 1), (8, 1), (11, 2), (15, 1)],
  term ((-9166080 : Rat) / 385571) [(1, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((5447680 : Rat) / 52799) [(1, 1), (9, 1), (11, 1), (15, 1)],
  term ((-16040640 : Rat) / 385571) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-5111872 : Rat) / 52799) [(1, 1), (11, 1), (15, 2)],
  term ((25668624 : Rat) / 385571) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term ((-3112960 : Rat) / 52799) [(1, 1), (11, 2), (15, 1)],
  term ((9166080 : Rat) / 385571) [(1, 1), (11, 2), (15, 1), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(1, 2), (8, 1), (11, 1), (15, 1)],
  term ((4583040 : Rat) / 385571) [(1, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2723840 : Rat) / 52799) [(1, 2), (9, 1), (15, 1)],
  term ((8020320 : Rat) / 385571) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((1556480 : Rat) / 52799) [(1, 2), (11, 1), (15, 1)],
  term ((-4583040 : Rat) / 385571) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((2555936 : Rat) / 52799) [(1, 2), (15, 2)],
  term ((-12834312 : Rat) / 385571) [(1, 2), (15, 2), (16, 1)],
  term ((-3112960 : Rat) / 52799) [(4, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((9166080 : Rat) / 385571) [(4, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-5447680 : Rat) / 52799) [(4, 1), (9, 1), (10, 1), (15, 1)],
  term ((16040640 : Rat) / 385571) [(4, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((3112960 : Rat) / 52799) [(4, 1), (10, 1), (11, 1), (15, 1)],
  term ((-9166080 : Rat) / 385571) [(4, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((5111872 : Rat) / 52799) [(4, 1), (10, 1), (15, 2)],
  term ((-25668624 : Rat) / 385571) [(4, 1), (10, 1), (15, 2), (16, 1)],
  term ((1556480 : Rat) / 52799) [(4, 2), (8, 1), (11, 1), (15, 1)],
  term ((-4583040 : Rat) / 385571) [(4, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((2723840 : Rat) / 52799) [(4, 2), (9, 1), (15, 1)],
  term ((-8020320 : Rat) / 385571) [(4, 2), (9, 1), (15, 1), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(4, 2), (11, 1), (15, 1)],
  term ((4583040 : Rat) / 385571) [(4, 2), (11, 1), (15, 1), (16, 1)],
  term ((-2555936 : Rat) / 52799) [(4, 2), (15, 2)],
  term ((12834312 : Rat) / 385571) [(4, 2), (15, 2), (16, 1)],
  term ((-3112960 : Rat) / 52799) [(5, 1), (8, 1), (11, 2), (15, 1)],
  term ((9166080 : Rat) / 385571) [(5, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((-5447680 : Rat) / 52799) [(5, 1), (9, 1), (11, 1), (15, 1)],
  term ((16040640 : Rat) / 385571) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((5111872 : Rat) / 52799) [(5, 1), (11, 1), (15, 2)],
  term ((-25668624 : Rat) / 385571) [(5, 1), (11, 1), (15, 2), (16, 1)],
  term ((3112960 : Rat) / 52799) [(5, 1), (11, 2), (15, 1)],
  term ((-9166080 : Rat) / 385571) [(5, 1), (11, 2), (15, 1), (16, 1)],
  term ((1556480 : Rat) / 52799) [(5, 2), (8, 1), (11, 1), (15, 1)],
  term ((-4583040 : Rat) / 385571) [(5, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((2723840 : Rat) / 52799) [(5, 2), (9, 1), (15, 1)],
  term ((-8020320 : Rat) / 385571) [(5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(5, 2), (11, 1), (15, 1)],
  term ((4583040 : Rat) / 385571) [(5, 2), (11, 1), (15, 1), (16, 1)],
  term ((-2555936 : Rat) / 52799) [(5, 2), (15, 2)],
  term ((12834312 : Rat) / 385571) [(5, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 22, terms 0 through 9. -/
theorem rs_R005_ueqv_R005NYN_block_22_0000_0009_valid :
    checkProductSumEq rs_R005_ueqv_R005NYN_partials_22_0000_0009
      rs_R005_ueqv_R005NYN_block_22_0000_0009 = true := by
  native_decide

end R005UeqvR005NYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
