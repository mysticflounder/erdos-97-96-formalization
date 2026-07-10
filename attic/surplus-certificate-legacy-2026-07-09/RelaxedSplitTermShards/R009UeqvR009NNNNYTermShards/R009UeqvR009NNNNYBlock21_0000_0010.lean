/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NNNNY, term block 21:0-10

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NNNNYTermShards

/-- Generator polynomial 21 for relaxed split surplus certificate `R009:u=v:R009NNNNY`. -/
def rs_R009_ueqv_R009NNNNY_generator_21_0000_0010 : Poly :=
[
  term (-2 : Rat) [(0, 1), (8, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (9, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(4, 1), (8, 1)],
  term (-1 : Rat) [(4, 2)],
  term (2 : Rat) [(5, 1), (9, 1)],
  term (-1 : Rat) [(5, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNNY_coefficient_21_0000 : Poly :=
[
  term ((91 : Rat) / 93) [(0, 1), (16, 1)]
]

/-- Partial product 0 for generator 21. -/
def rs_R009_ueqv_R009NNNNY_partial_21_0000 : Poly :=
[
  term ((-182 : Rat) / 93) [(0, 1), (1, 1), (9, 1), (16, 1)],
  term ((91 : Rat) / 93) [(0, 1), (1, 2), (16, 1)],
  term ((182 : Rat) / 93) [(0, 1), (4, 1), (8, 1), (16, 1)],
  term ((-91 : Rat) / 93) [(0, 1), (4, 2), (16, 1)],
  term ((182 : Rat) / 93) [(0, 1), (5, 1), (9, 1), (16, 1)],
  term ((-91 : Rat) / 93) [(0, 1), (5, 2), (16, 1)],
  term ((-182 : Rat) / 93) [(0, 2), (8, 1), (16, 1)],
  term ((91 : Rat) / 93) [(0, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 21. -/
theorem rs_R009_ueqv_R009NNNNY_partial_21_0000_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_21_0000
        rs_R009_ueqv_R009NNNNY_generator_21_0000_0010 =
      rs_R009_ueqv_R009NNNNY_partial_21_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNNY_coefficient_21_0001 : Poly :=
[
  term ((-91 : Rat) / 93) [(2, 1), (16, 1)]
]

/-- Partial product 1 for generator 21. -/
def rs_R009_ueqv_R009NNNNY_partial_21_0001 : Poly :=
[
  term ((182 : Rat) / 93) [(0, 1), (2, 1), (8, 1), (16, 1)],
  term ((-91 : Rat) / 93) [(0, 2), (2, 1), (16, 1)],
  term ((182 : Rat) / 93) [(1, 1), (2, 1), (9, 1), (16, 1)],
  term ((-91 : Rat) / 93) [(1, 2), (2, 1), (16, 1)],
  term ((-182 : Rat) / 93) [(2, 1), (4, 1), (8, 1), (16, 1)],
  term ((91 : Rat) / 93) [(2, 1), (4, 2), (16, 1)],
  term ((-182 : Rat) / 93) [(2, 1), (5, 1), (9, 1), (16, 1)],
  term ((91 : Rat) / 93) [(2, 1), (5, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 21. -/
theorem rs_R009_ueqv_R009NNNNY_partial_21_0001_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_21_0001
        rs_R009_ueqv_R009NNNNY_generator_21_0000_0010 =
      rs_R009_ueqv_R009NNNNY_partial_21_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNNY_coefficient_21_0002 : Poly :=
[
  term ((-16 : Rat) / 93) [(3, 1), (13, 1), (16, 1)]
]

/-- Partial product 2 for generator 21. -/
def rs_R009_ueqv_R009NNNNY_partial_21_0002 : Poly :=
[
  term ((32 : Rat) / 93) [(0, 1), (3, 1), (8, 1), (13, 1), (16, 1)],
  term ((-16 : Rat) / 93) [(0, 2), (3, 1), (13, 1), (16, 1)],
  term ((32 : Rat) / 93) [(1, 1), (3, 1), (9, 1), (13, 1), (16, 1)],
  term ((-16 : Rat) / 93) [(1, 2), (3, 1), (13, 1), (16, 1)],
  term ((-32 : Rat) / 93) [(3, 1), (4, 1), (8, 1), (13, 1), (16, 1)],
  term ((16 : Rat) / 93) [(3, 1), (4, 2), (13, 1), (16, 1)],
  term ((-32 : Rat) / 93) [(3, 1), (5, 1), (9, 1), (13, 1), (16, 1)],
  term ((16 : Rat) / 93) [(3, 1), (5, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 21. -/
theorem rs_R009_ueqv_R009NNNNY_partial_21_0002_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_21_0002
        rs_R009_ueqv_R009NNNNY_generator_21_0000_0010 =
      rs_R009_ueqv_R009NNNNY_partial_21_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNNY_coefficient_21_0003 : Poly :=
[
  term ((-197 : Rat) / 93) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 3 for generator 21. -/
def rs_R009_ueqv_R009NNNNY_partial_21_0003 : Poly :=
[
  term ((394 : Rat) / 93) [(0, 1), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((-197 : Rat) / 93) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((394 : Rat) / 93) [(1, 1), (3, 1), (9, 1), (15, 1), (16, 1)],
  term ((-197 : Rat) / 93) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((-394 : Rat) / 93) [(3, 1), (4, 1), (8, 1), (15, 1), (16, 1)],
  term ((197 : Rat) / 93) [(3, 1), (4, 2), (15, 1), (16, 1)],
  term ((-394 : Rat) / 93) [(3, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((197 : Rat) / 93) [(3, 1), (5, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 21. -/
theorem rs_R009_ueqv_R009NNNNY_partial_21_0003_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_21_0003
        rs_R009_ueqv_R009NNNNY_generator_21_0000_0010 =
      rs_R009_ueqv_R009NNNNY_partial_21_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNNY_coefficient_21_0004 : Poly :=
[
  term ((49 : Rat) / 31) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 4 for generator 21. -/
def rs_R009_ueqv_R009NNNNY_partial_21_0004 : Poly :=
[
  term ((-98 : Rat) / 31) [(0, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((49 : Rat) / 31) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((-98 : Rat) / 31) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((49 : Rat) / 31) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((98 : Rat) / 31) [(4, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-49 : Rat) / 31) [(4, 2), (11, 1), (15, 1), (16, 1)],
  term ((98 : Rat) / 31) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-49 : Rat) / 31) [(5, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 21. -/
theorem rs_R009_ueqv_R009NNNNY_partial_21_0004_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_21_0004
        rs_R009_ueqv_R009NNNNY_generator_21_0000_0010 =
      rs_R009_ueqv_R009NNNNY_partial_21_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNNY_coefficient_21_0005 : Poly :=
[
  term ((116 : Rat) / 93) [(11, 2), (16, 1)]
]

/-- Partial product 5 for generator 21. -/
def rs_R009_ueqv_R009NNNNY_partial_21_0005 : Poly :=
[
  term ((-232 : Rat) / 93) [(0, 1), (8, 1), (11, 2), (16, 1)],
  term ((116 : Rat) / 93) [(0, 2), (11, 2), (16, 1)],
  term ((-232 : Rat) / 93) [(1, 1), (9, 1), (11, 2), (16, 1)],
  term ((116 : Rat) / 93) [(1, 2), (11, 2), (16, 1)],
  term ((232 : Rat) / 93) [(4, 1), (8, 1), (11, 2), (16, 1)],
  term ((-116 : Rat) / 93) [(4, 2), (11, 2), (16, 1)],
  term ((232 : Rat) / 93) [(5, 1), (9, 1), (11, 2), (16, 1)],
  term ((-116 : Rat) / 93) [(5, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 21. -/
theorem rs_R009_ueqv_R009NNNNY_partial_21_0005_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_21_0005
        rs_R009_ueqv_R009NNNNY_generator_21_0000_0010 =
      rs_R009_ueqv_R009NNNNY_partial_21_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNNY_coefficient_21_0006 : Poly :=
[
  term ((-4 : Rat) / 93) [(12, 1), (16, 1)]
]

/-- Partial product 6 for generator 21. -/
def rs_R009_ueqv_R009NNNNY_partial_21_0006 : Poly :=
[
  term ((8 : Rat) / 93) [(0, 1), (8, 1), (12, 1), (16, 1)],
  term ((-4 : Rat) / 93) [(0, 2), (12, 1), (16, 1)],
  term ((8 : Rat) / 93) [(1, 1), (9, 1), (12, 1), (16, 1)],
  term ((-4 : Rat) / 93) [(1, 2), (12, 1), (16, 1)],
  term ((-8 : Rat) / 93) [(4, 1), (8, 1), (12, 1), (16, 1)],
  term ((4 : Rat) / 93) [(4, 2), (12, 1), (16, 1)],
  term ((-8 : Rat) / 93) [(5, 1), (9, 1), (12, 1), (16, 1)],
  term ((4 : Rat) / 93) [(5, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 21. -/
theorem rs_R009_ueqv_R009NNNNY_partial_21_0006_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_21_0006
        rs_R009_ueqv_R009NNNNY_generator_21_0000_0010 =
      rs_R009_ueqv_R009NNNNY_partial_21_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNNY_coefficient_21_0007 : Poly :=
[
  term ((8 : Rat) / 93) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 7 for generator 21. -/
def rs_R009_ueqv_R009NNNNY_partial_21_0007 : Poly :=
[
  term ((-16 : Rat) / 93) [(0, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 93) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 93) [(1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 93) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 93) [(4, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-8 : Rat) / 93) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 93) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-8 : Rat) / 93) [(5, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 21. -/
theorem rs_R009_ueqv_R009NNNNY_partial_21_0007_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_21_0007
        rs_R009_ueqv_R009NNNNY_generator_21_0000_0010 =
      rs_R009_ueqv_R009NNNNY_partial_21_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNNY_coefficient_21_0008 : Poly :=
[
  term ((160 : Rat) / 93) [(14, 1), (16, 1)]
]

/-- Partial product 8 for generator 21. -/
def rs_R009_ueqv_R009NNNNY_partial_21_0008 : Poly :=
[
  term ((-320 : Rat) / 93) [(0, 1), (8, 1), (14, 1), (16, 1)],
  term ((160 : Rat) / 93) [(0, 2), (14, 1), (16, 1)],
  term ((-320 : Rat) / 93) [(1, 1), (9, 1), (14, 1), (16, 1)],
  term ((160 : Rat) / 93) [(1, 2), (14, 1), (16, 1)],
  term ((320 : Rat) / 93) [(4, 1), (8, 1), (14, 1), (16, 1)],
  term ((-160 : Rat) / 93) [(4, 2), (14, 1), (16, 1)],
  term ((320 : Rat) / 93) [(5, 1), (9, 1), (14, 1), (16, 1)],
  term ((-160 : Rat) / 93) [(5, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 21. -/
theorem rs_R009_ueqv_R009NNNNY_partial_21_0008_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_21_0008
        rs_R009_ueqv_R009NNNNY_generator_21_0000_0010 =
      rs_R009_ueqv_R009NNNNY_partial_21_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNNY_coefficient_21_0009 : Poly :=
[
  term ((-4 : Rat) / 93) [(15, 2), (16, 1)]
]

/-- Partial product 9 for generator 21. -/
def rs_R009_ueqv_R009NNNNY_partial_21_0009 : Poly :=
[
  term ((8 : Rat) / 93) [(0, 1), (8, 1), (15, 2), (16, 1)],
  term ((-4 : Rat) / 93) [(0, 2), (15, 2), (16, 1)],
  term ((8 : Rat) / 93) [(1, 1), (9, 1), (15, 2), (16, 1)],
  term ((-4 : Rat) / 93) [(1, 2), (15, 2), (16, 1)],
  term ((-8 : Rat) / 93) [(4, 1), (8, 1), (15, 2), (16, 1)],
  term ((4 : Rat) / 93) [(4, 2), (15, 2), (16, 1)],
  term ((-8 : Rat) / 93) [(5, 1), (9, 1), (15, 2), (16, 1)],
  term ((4 : Rat) / 93) [(5, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 21. -/
theorem rs_R009_ueqv_R009NNNNY_partial_21_0009_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_21_0009
        rs_R009_ueqv_R009NNNNY_generator_21_0000_0010 =
      rs_R009_ueqv_R009NNNNY_partial_21_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNNY_coefficient_21_0010 : Poly :=
[
  term ((-77 : Rat) / 93) [(16, 1)]
]

/-- Partial product 10 for generator 21. -/
def rs_R009_ueqv_R009NNNNY_partial_21_0010 : Poly :=
[
  term ((154 : Rat) / 93) [(0, 1), (8, 1), (16, 1)],
  term ((-77 : Rat) / 93) [(0, 2), (16, 1)],
  term ((154 : Rat) / 93) [(1, 1), (9, 1), (16, 1)],
  term ((-77 : Rat) / 93) [(1, 2), (16, 1)],
  term ((-154 : Rat) / 93) [(4, 1), (8, 1), (16, 1)],
  term ((77 : Rat) / 93) [(4, 2), (16, 1)],
  term ((-154 : Rat) / 93) [(5, 1), (9, 1), (16, 1)],
  term ((77 : Rat) / 93) [(5, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 21. -/
theorem rs_R009_ueqv_R009NNNNY_partial_21_0010_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_21_0010
        rs_R009_ueqv_R009NNNNY_generator_21_0000_0010 =
      rs_R009_ueqv_R009NNNNY_partial_21_0010 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NNNNY_partials_21_0000_0010 : List Poly :=
[
  rs_R009_ueqv_R009NNNNY_partial_21_0000,
  rs_R009_ueqv_R009NNNNY_partial_21_0001,
  rs_R009_ueqv_R009NNNNY_partial_21_0002,
  rs_R009_ueqv_R009NNNNY_partial_21_0003,
  rs_R009_ueqv_R009NNNNY_partial_21_0004,
  rs_R009_ueqv_R009NNNNY_partial_21_0005,
  rs_R009_ueqv_R009NNNNY_partial_21_0006,
  rs_R009_ueqv_R009NNNNY_partial_21_0007,
  rs_R009_ueqv_R009NNNNY_partial_21_0008,
  rs_R009_ueqv_R009NNNNY_partial_21_0009,
  rs_R009_ueqv_R009NNNNY_partial_21_0010
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NNNNY_block_21_0000_0010 : Poly :=
[
  term ((-182 : Rat) / 93) [(0, 1), (1, 1), (9, 1), (16, 1)],
  term ((91 : Rat) / 93) [(0, 1), (1, 2), (16, 1)],
  term ((182 : Rat) / 93) [(0, 1), (2, 1), (8, 1), (16, 1)],
  term ((32 : Rat) / 93) [(0, 1), (3, 1), (8, 1), (13, 1), (16, 1)],
  term ((394 : Rat) / 93) [(0, 1), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((182 : Rat) / 93) [(0, 1), (4, 1), (8, 1), (16, 1)],
  term ((-91 : Rat) / 93) [(0, 1), (4, 2), (16, 1)],
  term ((182 : Rat) / 93) [(0, 1), (5, 1), (9, 1), (16, 1)],
  term ((-91 : Rat) / 93) [(0, 1), (5, 2), (16, 1)],
  term ((-98 : Rat) / 31) [(0, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-232 : Rat) / 93) [(0, 1), (8, 1), (11, 2), (16, 1)],
  term ((8 : Rat) / 93) [(0, 1), (8, 1), (12, 1), (16, 1)],
  term ((-16 : Rat) / 93) [(0, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-320 : Rat) / 93) [(0, 1), (8, 1), (14, 1), (16, 1)],
  term ((8 : Rat) / 93) [(0, 1), (8, 1), (15, 2), (16, 1)],
  term ((154 : Rat) / 93) [(0, 1), (8, 1), (16, 1)],
  term ((-91 : Rat) / 93) [(0, 2), (2, 1), (16, 1)],
  term ((-16 : Rat) / 93) [(0, 2), (3, 1), (13, 1), (16, 1)],
  term ((-197 : Rat) / 93) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((-182 : Rat) / 93) [(0, 2), (8, 1), (16, 1)],
  term ((49 : Rat) / 31) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((116 : Rat) / 93) [(0, 2), (11, 2), (16, 1)],
  term ((-4 : Rat) / 93) [(0, 2), (12, 1), (16, 1)],
  term ((8 : Rat) / 93) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((160 : Rat) / 93) [(0, 2), (14, 1), (16, 1)],
  term ((-4 : Rat) / 93) [(0, 2), (15, 2), (16, 1)],
  term ((-77 : Rat) / 93) [(0, 2), (16, 1)],
  term ((91 : Rat) / 93) [(0, 3), (16, 1)],
  term ((182 : Rat) / 93) [(1, 1), (2, 1), (9, 1), (16, 1)],
  term ((32 : Rat) / 93) [(1, 1), (3, 1), (9, 1), (13, 1), (16, 1)],
  term ((394 : Rat) / 93) [(1, 1), (3, 1), (9, 1), (15, 1), (16, 1)],
  term ((-98 : Rat) / 31) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-232 : Rat) / 93) [(1, 1), (9, 1), (11, 2), (16, 1)],
  term ((8 : Rat) / 93) [(1, 1), (9, 1), (12, 1), (16, 1)],
  term ((-16 : Rat) / 93) [(1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-320 : Rat) / 93) [(1, 1), (9, 1), (14, 1), (16, 1)],
  term ((8 : Rat) / 93) [(1, 1), (9, 1), (15, 2), (16, 1)],
  term ((154 : Rat) / 93) [(1, 1), (9, 1), (16, 1)],
  term ((-91 : Rat) / 93) [(1, 2), (2, 1), (16, 1)],
  term ((-16 : Rat) / 93) [(1, 2), (3, 1), (13, 1), (16, 1)],
  term ((-197 : Rat) / 93) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((49 : Rat) / 31) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((116 : Rat) / 93) [(1, 2), (11, 2), (16, 1)],
  term ((-4 : Rat) / 93) [(1, 2), (12, 1), (16, 1)],
  term ((8 : Rat) / 93) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((160 : Rat) / 93) [(1, 2), (14, 1), (16, 1)],
  term ((-4 : Rat) / 93) [(1, 2), (15, 2), (16, 1)],
  term ((-77 : Rat) / 93) [(1, 2), (16, 1)],
  term ((-182 : Rat) / 93) [(2, 1), (4, 1), (8, 1), (16, 1)],
  term ((91 : Rat) / 93) [(2, 1), (4, 2), (16, 1)],
  term ((-182 : Rat) / 93) [(2, 1), (5, 1), (9, 1), (16, 1)],
  term ((91 : Rat) / 93) [(2, 1), (5, 2), (16, 1)],
  term ((-32 : Rat) / 93) [(3, 1), (4, 1), (8, 1), (13, 1), (16, 1)],
  term ((-394 : Rat) / 93) [(3, 1), (4, 1), (8, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 93) [(3, 1), (4, 2), (13, 1), (16, 1)],
  term ((197 : Rat) / 93) [(3, 1), (4, 2), (15, 1), (16, 1)],
  term ((-32 : Rat) / 93) [(3, 1), (5, 1), (9, 1), (13, 1), (16, 1)],
  term ((-394 : Rat) / 93) [(3, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 93) [(3, 1), (5, 2), (13, 1), (16, 1)],
  term ((197 : Rat) / 93) [(3, 1), (5, 2), (15, 1), (16, 1)],
  term ((98 : Rat) / 31) [(4, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((232 : Rat) / 93) [(4, 1), (8, 1), (11, 2), (16, 1)],
  term ((-8 : Rat) / 93) [(4, 1), (8, 1), (12, 1), (16, 1)],
  term ((16 : Rat) / 93) [(4, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((320 : Rat) / 93) [(4, 1), (8, 1), (14, 1), (16, 1)],
  term ((-8 : Rat) / 93) [(4, 1), (8, 1), (15, 2), (16, 1)],
  term ((-154 : Rat) / 93) [(4, 1), (8, 1), (16, 1)],
  term ((-49 : Rat) / 31) [(4, 2), (11, 1), (15, 1), (16, 1)],
  term ((-116 : Rat) / 93) [(4, 2), (11, 2), (16, 1)],
  term ((4 : Rat) / 93) [(4, 2), (12, 1), (16, 1)],
  term ((-8 : Rat) / 93) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term ((-160 : Rat) / 93) [(4, 2), (14, 1), (16, 1)],
  term ((4 : Rat) / 93) [(4, 2), (15, 2), (16, 1)],
  term ((77 : Rat) / 93) [(4, 2), (16, 1)],
  term ((98 : Rat) / 31) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((232 : Rat) / 93) [(5, 1), (9, 1), (11, 2), (16, 1)],
  term ((-8 : Rat) / 93) [(5, 1), (9, 1), (12, 1), (16, 1)],
  term ((16 : Rat) / 93) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((320 : Rat) / 93) [(5, 1), (9, 1), (14, 1), (16, 1)],
  term ((-8 : Rat) / 93) [(5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-154 : Rat) / 93) [(5, 1), (9, 1), (16, 1)],
  term ((-49 : Rat) / 31) [(5, 2), (11, 1), (15, 1), (16, 1)],
  term ((-116 : Rat) / 93) [(5, 2), (11, 2), (16, 1)],
  term ((4 : Rat) / 93) [(5, 2), (12, 1), (16, 1)],
  term ((-8 : Rat) / 93) [(5, 2), (13, 1), (15, 1), (16, 1)],
  term ((-160 : Rat) / 93) [(5, 2), (14, 1), (16, 1)],
  term ((4 : Rat) / 93) [(5, 2), (15, 2), (16, 1)],
  term ((77 : Rat) / 93) [(5, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 21, terms 0 through 10. -/
theorem rs_R009_ueqv_R009NNNNY_block_21_0000_0010_valid :
    checkProductSumEq rs_R009_ueqv_R009NNNNY_partials_21_0000_0010
      rs_R009_ueqv_R009NNNNY_block_21_0000_0010 = true := by
  native_decide

end R009UeqvR009NNNNYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
