/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R011:u=v:R011NNNY, term block 23:0-10

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R011UeqvR011NNNYTermShards

/-- Generator polynomial 23 for relaxed split surplus certificate `R011:u=v:R011NNNY`. -/
def rs_R011_ueqv_R011NNNY_generator_23_0000_0010 : Poly :=
[
  term (-2 : Rat) [(0, 1), (10, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (11, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(8, 1), (10, 1)],
  term (-1 : Rat) [(8, 2)],
  term (2 : Rat) [(9, 1), (11, 1)],
  term (-1 : Rat) [(9, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 23. -/
def rs_R011_ueqv_R011NNNY_coefficient_23_0000 : Poly :=
[
  term ((12 : Rat) / 7) [(3, 1), (7, 1), (16, 1)]
]

/-- Partial product 0 for generator 23. -/
def rs_R011_ueqv_R011NNNY_partial_23_0000 : Poly :=
[
  term ((-24 : Rat) / 7) [(0, 1), (3, 1), (7, 1), (10, 1), (16, 1)],
  term ((12 : Rat) / 7) [(0, 2), (3, 1), (7, 1), (16, 1)],
  term ((-24 : Rat) / 7) [(1, 1), (3, 1), (7, 1), (11, 1), (16, 1)],
  term ((12 : Rat) / 7) [(1, 2), (3, 1), (7, 1), (16, 1)],
  term ((24 : Rat) / 7) [(3, 1), (7, 1), (8, 1), (10, 1), (16, 1)],
  term ((-12 : Rat) / 7) [(3, 1), (7, 1), (8, 2), (16, 1)],
  term ((24 : Rat) / 7) [(3, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((-12 : Rat) / 7) [(3, 1), (7, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 23. -/
theorem rs_R011_ueqv_R011NNNY_partial_23_0000_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_23_0000
        rs_R011_ueqv_R011NNNY_generator_23_0000_0010 =
      rs_R011_ueqv_R011NNNY_partial_23_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 23. -/
def rs_R011_ueqv_R011NNNY_coefficient_23_0001 : Poly :=
[
  term ((-40 : Rat) / 7) [(3, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 1 for generator 23. -/
def rs_R011_ueqv_R011NNNY_partial_23_0001 : Poly :=
[
  term ((80 : Rat) / 7) [(0, 1), (3, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-40 : Rat) / 7) [(0, 2), (3, 1), (9, 1), (15, 2), (16, 1)],
  term ((80 : Rat) / 7) [(1, 1), (3, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-40 : Rat) / 7) [(1, 2), (3, 1), (9, 1), (15, 2), (16, 1)],
  term ((-80 : Rat) / 7) [(3, 1), (8, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((40 : Rat) / 7) [(3, 1), (8, 2), (9, 1), (15, 2), (16, 1)],
  term ((-80 : Rat) / 7) [(3, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((40 : Rat) / 7) [(3, 1), (9, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 23. -/
theorem rs_R011_ueqv_R011NNNY_partial_23_0001_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_23_0001
        rs_R011_ueqv_R011NNNY_generator_23_0000_0010 =
      rs_R011_ueqv_R011NNNY_partial_23_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 23. -/
def rs_R011_ueqv_R011NNNY_coefficient_23_0002 : Poly :=
[
  term ((-18 : Rat) / 7) [(3, 1), (9, 1), (16, 1)]
]

/-- Partial product 2 for generator 23. -/
def rs_R011_ueqv_R011NNNY_partial_23_0002 : Poly :=
[
  term ((36 : Rat) / 7) [(0, 1), (3, 1), (9, 1), (10, 1), (16, 1)],
  term ((-18 : Rat) / 7) [(0, 2), (3, 1), (9, 1), (16, 1)],
  term ((36 : Rat) / 7) [(1, 1), (3, 1), (9, 1), (11, 1), (16, 1)],
  term ((-18 : Rat) / 7) [(1, 2), (3, 1), (9, 1), (16, 1)],
  term ((-36 : Rat) / 7) [(3, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((18 : Rat) / 7) [(3, 1), (8, 2), (9, 1), (16, 1)],
  term ((-36 : Rat) / 7) [(3, 1), (9, 2), (11, 1), (16, 1)],
  term ((18 : Rat) / 7) [(3, 1), (9, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 23. -/
theorem rs_R011_ueqv_R011NNNY_partial_23_0002_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_23_0002
        rs_R011_ueqv_R011NNNY_generator_23_0000_0010 =
      rs_R011_ueqv_R011NNNY_partial_23_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 23. -/
def rs_R011_ueqv_R011NNNY_coefficient_23_0003 : Poly :=
[
  term ((-31 : Rat) / 4) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 3 for generator 23. -/
def rs_R011_ueqv_R011NNNY_partial_23_0003 : Poly :=
[
  term ((31 : Rat) / 2) [(0, 1), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-31 : Rat) / 4) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((31 : Rat) / 2) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((-31 : Rat) / 4) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((-31 : Rat) / 2) [(3, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((31 : Rat) / 4) [(3, 1), (8, 2), (15, 1), (16, 1)],
  term ((-31 : Rat) / 2) [(3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((31 : Rat) / 4) [(3, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 23. -/
theorem rs_R011_ueqv_R011NNNY_partial_23_0003_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_23_0003
        rs_R011_ueqv_R011NNNY_generator_23_0000_0010 =
      rs_R011_ueqv_R011NNNY_partial_23_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 23. -/
def rs_R011_ueqv_R011NNNY_coefficient_23_0004 : Poly :=
[
  term ((12 : Rat) / 7) [(8, 1), (16, 1)]
]

/-- Partial product 4 for generator 23. -/
def rs_R011_ueqv_R011NNNY_partial_23_0004 : Poly :=
[
  term ((-24 : Rat) / 7) [(0, 1), (8, 1), (10, 1), (16, 1)],
  term ((12 : Rat) / 7) [(0, 2), (8, 1), (16, 1)],
  term ((-24 : Rat) / 7) [(1, 1), (8, 1), (11, 1), (16, 1)],
  term ((12 : Rat) / 7) [(1, 2), (8, 1), (16, 1)],
  term ((24 : Rat) / 7) [(8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-12 : Rat) / 7) [(8, 1), (9, 2), (16, 1)],
  term ((24 : Rat) / 7) [(8, 2), (10, 1), (16, 1)],
  term ((-12 : Rat) / 7) [(8, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 23. -/
theorem rs_R011_ueqv_R011NNNY_partial_23_0004_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_23_0004
        rs_R011_ueqv_R011NNNY_generator_23_0000_0010 =
      rs_R011_ueqv_R011NNNY_partial_23_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 23. -/
def rs_R011_ueqv_R011NNNY_coefficient_23_0005 : Poly :=
[
  term ((-17 : Rat) / 7) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 5 for generator 23. -/
def rs_R011_ueqv_R011NNNY_partial_23_0005 : Poly :=
[
  term ((34 : Rat) / 7) [(0, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-17 : Rat) / 7) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((34 : Rat) / 7) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-17 : Rat) / 7) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((-34 : Rat) / 7) [(8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((17 : Rat) / 7) [(8, 2), (9, 1), (15, 1), (16, 1)],
  term ((-34 : Rat) / 7) [(9, 2), (11, 1), (15, 1), (16, 1)],
  term ((17 : Rat) / 7) [(9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 23. -/
theorem rs_R011_ueqv_R011NNNY_partial_23_0005_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_23_0005
        rs_R011_ueqv_R011NNNY_generator_23_0000_0010 =
      rs_R011_ueqv_R011NNNY_partial_23_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 23. -/
def rs_R011_ueqv_R011NNNY_coefficient_23_0006 : Poly :=
[
  term ((-96 : Rat) / 7) [(9, 1), (15, 3), (16, 1)]
]

/-- Partial product 6 for generator 23. -/
def rs_R011_ueqv_R011NNNY_partial_23_0006 : Poly :=
[
  term ((192 : Rat) / 7) [(0, 1), (9, 1), (10, 1), (15, 3), (16, 1)],
  term ((-96 : Rat) / 7) [(0, 2), (9, 1), (15, 3), (16, 1)],
  term ((192 : Rat) / 7) [(1, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((-96 : Rat) / 7) [(1, 2), (9, 1), (15, 3), (16, 1)],
  term ((-192 : Rat) / 7) [(8, 1), (9, 1), (10, 1), (15, 3), (16, 1)],
  term ((96 : Rat) / 7) [(8, 2), (9, 1), (15, 3), (16, 1)],
  term ((-192 : Rat) / 7) [(9, 2), (11, 1), (15, 3), (16, 1)],
  term ((96 : Rat) / 7) [(9, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 23. -/
theorem rs_R011_ueqv_R011NNNY_partial_23_0006_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_23_0006
        rs_R011_ueqv_R011NNNY_generator_23_0000_0010 =
      rs_R011_ueqv_R011NNNY_partial_23_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 23. -/
def rs_R011_ueqv_R011NNNY_coefficient_23_0007 : Poly :=
[
  term ((-12 : Rat) / 7) [(10, 1), (16, 1)]
]

/-- Partial product 7 for generator 23. -/
def rs_R011_ueqv_R011NNNY_partial_23_0007 : Poly :=
[
  term ((24 : Rat) / 7) [(0, 1), (10, 2), (16, 1)],
  term ((-12 : Rat) / 7) [(0, 2), (10, 1), (16, 1)],
  term ((24 : Rat) / 7) [(1, 1), (10, 1), (11, 1), (16, 1)],
  term ((-12 : Rat) / 7) [(1, 2), (10, 1), (16, 1)],
  term ((-24 : Rat) / 7) [(8, 1), (10, 2), (16, 1)],
  term ((12 : Rat) / 7) [(8, 2), (10, 1), (16, 1)],
  term ((-24 : Rat) / 7) [(9, 1), (10, 1), (11, 1), (16, 1)],
  term ((12 : Rat) / 7) [(9, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 23. -/
theorem rs_R011_ueqv_R011NNNY_partial_23_0007_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_23_0007
        rs_R011_ueqv_R011NNNY_generator_23_0000_0010 =
      rs_R011_ueqv_R011NNNY_partial_23_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 23. -/
def rs_R011_ueqv_R011NNNY_coefficient_23_0008 : Poly :=
[
  term ((8 : Rat) / 7) [(14, 1), (16, 1)]
]

/-- Partial product 8 for generator 23. -/
def rs_R011_ueqv_R011NNNY_partial_23_0008 : Poly :=
[
  term ((-16 : Rat) / 7) [(0, 1), (10, 1), (14, 1), (16, 1)],
  term ((8 : Rat) / 7) [(0, 2), (14, 1), (16, 1)],
  term ((-16 : Rat) / 7) [(1, 1), (11, 1), (14, 1), (16, 1)],
  term ((8 : Rat) / 7) [(1, 2), (14, 1), (16, 1)],
  term ((16 : Rat) / 7) [(8, 1), (10, 1), (14, 1), (16, 1)],
  term ((-8 : Rat) / 7) [(8, 2), (14, 1), (16, 1)],
  term ((16 : Rat) / 7) [(9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-8 : Rat) / 7) [(9, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 23. -/
theorem rs_R011_ueqv_R011NNNY_partial_23_0008_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_23_0008
        rs_R011_ueqv_R011NNNY_generator_23_0000_0010 =
      rs_R011_ueqv_R011NNNY_partial_23_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 23. -/
def rs_R011_ueqv_R011NNNY_coefficient_23_0009 : Poly :=
[
  term ((19 : Rat) / 7) [(15, 2), (16, 1)]
]

/-- Partial product 9 for generator 23. -/
def rs_R011_ueqv_R011NNNY_partial_23_0009 : Poly :=
[
  term ((-38 : Rat) / 7) [(0, 1), (10, 1), (15, 2), (16, 1)],
  term ((19 : Rat) / 7) [(0, 2), (15, 2), (16, 1)],
  term ((-38 : Rat) / 7) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term ((19 : Rat) / 7) [(1, 2), (15, 2), (16, 1)],
  term ((38 : Rat) / 7) [(8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-19 : Rat) / 7) [(8, 2), (15, 2), (16, 1)],
  term ((38 : Rat) / 7) [(9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-19 : Rat) / 7) [(9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 23. -/
theorem rs_R011_ueqv_R011NNNY_partial_23_0009_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_23_0009
        rs_R011_ueqv_R011NNNY_generator_23_0000_0010 =
      rs_R011_ueqv_R011NNNY_partial_23_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 23. -/
def rs_R011_ueqv_R011NNNY_coefficient_23_0010 : Poly :=
[
  term ((-97 : Rat) / 112) [(16, 1)]
]

/-- Partial product 10 for generator 23. -/
def rs_R011_ueqv_R011NNNY_partial_23_0010 : Poly :=
[
  term ((97 : Rat) / 56) [(0, 1), (10, 1), (16, 1)],
  term ((-97 : Rat) / 112) [(0, 2), (16, 1)],
  term ((97 : Rat) / 56) [(1, 1), (11, 1), (16, 1)],
  term ((-97 : Rat) / 112) [(1, 2), (16, 1)],
  term ((-97 : Rat) / 56) [(8, 1), (10, 1), (16, 1)],
  term ((97 : Rat) / 112) [(8, 2), (16, 1)],
  term ((-97 : Rat) / 56) [(9, 1), (11, 1), (16, 1)],
  term ((97 : Rat) / 112) [(9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 23. -/
theorem rs_R011_ueqv_R011NNNY_partial_23_0010_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_23_0010
        rs_R011_ueqv_R011NNNY_generator_23_0000_0010 =
      rs_R011_ueqv_R011NNNY_partial_23_0010 := by
  native_decide

/-- Partial products in this block. -/
def rs_R011_ueqv_R011NNNY_partials_23_0000_0010 : List Poly :=
[
  rs_R011_ueqv_R011NNNY_partial_23_0000,
  rs_R011_ueqv_R011NNNY_partial_23_0001,
  rs_R011_ueqv_R011NNNY_partial_23_0002,
  rs_R011_ueqv_R011NNNY_partial_23_0003,
  rs_R011_ueqv_R011NNNY_partial_23_0004,
  rs_R011_ueqv_R011NNNY_partial_23_0005,
  rs_R011_ueqv_R011NNNY_partial_23_0006,
  rs_R011_ueqv_R011NNNY_partial_23_0007,
  rs_R011_ueqv_R011NNNY_partial_23_0008,
  rs_R011_ueqv_R011NNNY_partial_23_0009,
  rs_R011_ueqv_R011NNNY_partial_23_0010
]

/-- Sum of partial products in this block. -/
def rs_R011_ueqv_R011NNNY_block_23_0000_0010 : Poly :=
[
  term ((-24 : Rat) / 7) [(0, 1), (3, 1), (7, 1), (10, 1), (16, 1)],
  term ((80 : Rat) / 7) [(0, 1), (3, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((36 : Rat) / 7) [(0, 1), (3, 1), (9, 1), (10, 1), (16, 1)],
  term ((31 : Rat) / 2) [(0, 1), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-24 : Rat) / 7) [(0, 1), (8, 1), (10, 1), (16, 1)],
  term ((34 : Rat) / 7) [(0, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((192 : Rat) / 7) [(0, 1), (9, 1), (10, 1), (15, 3), (16, 1)],
  term ((-16 : Rat) / 7) [(0, 1), (10, 1), (14, 1), (16, 1)],
  term ((-38 : Rat) / 7) [(0, 1), (10, 1), (15, 2), (16, 1)],
  term ((97 : Rat) / 56) [(0, 1), (10, 1), (16, 1)],
  term ((24 : Rat) / 7) [(0, 1), (10, 2), (16, 1)],
  term ((12 : Rat) / 7) [(0, 2), (3, 1), (7, 1), (16, 1)],
  term ((-40 : Rat) / 7) [(0, 2), (3, 1), (9, 1), (15, 2), (16, 1)],
  term ((-18 : Rat) / 7) [(0, 2), (3, 1), (9, 1), (16, 1)],
  term ((-31 : Rat) / 4) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((12 : Rat) / 7) [(0, 2), (8, 1), (16, 1)],
  term ((-17 : Rat) / 7) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((-96 : Rat) / 7) [(0, 2), (9, 1), (15, 3), (16, 1)],
  term ((-12 : Rat) / 7) [(0, 2), (10, 1), (16, 1)],
  term ((8 : Rat) / 7) [(0, 2), (14, 1), (16, 1)],
  term ((19 : Rat) / 7) [(0, 2), (15, 2), (16, 1)],
  term ((-97 : Rat) / 112) [(0, 2), (16, 1)],
  term ((-24 : Rat) / 7) [(1, 1), (3, 1), (7, 1), (11, 1), (16, 1)],
  term ((80 : Rat) / 7) [(1, 1), (3, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((36 : Rat) / 7) [(1, 1), (3, 1), (9, 1), (11, 1), (16, 1)],
  term ((31 : Rat) / 2) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((-24 : Rat) / 7) [(1, 1), (8, 1), (11, 1), (16, 1)],
  term ((34 : Rat) / 7) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((192 : Rat) / 7) [(1, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((24 : Rat) / 7) [(1, 1), (10, 1), (11, 1), (16, 1)],
  term ((-16 : Rat) / 7) [(1, 1), (11, 1), (14, 1), (16, 1)],
  term ((-38 : Rat) / 7) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term ((97 : Rat) / 56) [(1, 1), (11, 1), (16, 1)],
  term ((12 : Rat) / 7) [(1, 2), (3, 1), (7, 1), (16, 1)],
  term ((-40 : Rat) / 7) [(1, 2), (3, 1), (9, 1), (15, 2), (16, 1)],
  term ((-18 : Rat) / 7) [(1, 2), (3, 1), (9, 1), (16, 1)],
  term ((-31 : Rat) / 4) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((12 : Rat) / 7) [(1, 2), (8, 1), (16, 1)],
  term ((-17 : Rat) / 7) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((-96 : Rat) / 7) [(1, 2), (9, 1), (15, 3), (16, 1)],
  term ((-12 : Rat) / 7) [(1, 2), (10, 1), (16, 1)],
  term ((8 : Rat) / 7) [(1, 2), (14, 1), (16, 1)],
  term ((19 : Rat) / 7) [(1, 2), (15, 2), (16, 1)],
  term ((-97 : Rat) / 112) [(1, 2), (16, 1)],
  term ((24 : Rat) / 7) [(3, 1), (7, 1), (8, 1), (10, 1), (16, 1)],
  term ((-12 : Rat) / 7) [(3, 1), (7, 1), (8, 2), (16, 1)],
  term ((24 : Rat) / 7) [(3, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((-12 : Rat) / 7) [(3, 1), (7, 1), (9, 2), (16, 1)],
  term ((-80 : Rat) / 7) [(3, 1), (8, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-36 : Rat) / 7) [(3, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((-31 : Rat) / 2) [(3, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((40 : Rat) / 7) [(3, 1), (8, 2), (9, 1), (15, 2), (16, 1)],
  term ((18 : Rat) / 7) [(3, 1), (8, 2), (9, 1), (16, 1)],
  term ((31 : Rat) / 4) [(3, 1), (8, 2), (15, 1), (16, 1)],
  term ((-31 : Rat) / 2) [(3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-80 : Rat) / 7) [(3, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((-36 : Rat) / 7) [(3, 1), (9, 2), (11, 1), (16, 1)],
  term ((31 : Rat) / 4) [(3, 1), (9, 2), (15, 1), (16, 1)],
  term ((40 : Rat) / 7) [(3, 1), (9, 3), (15, 2), (16, 1)],
  term ((18 : Rat) / 7) [(3, 1), (9, 3), (16, 1)],
  term ((-34 : Rat) / 7) [(8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-192 : Rat) / 7) [(8, 1), (9, 1), (10, 1), (15, 3), (16, 1)],
  term ((24 : Rat) / 7) [(8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-12 : Rat) / 7) [(8, 1), (9, 2), (16, 1)],
  term ((16 : Rat) / 7) [(8, 1), (10, 1), (14, 1), (16, 1)],
  term ((38 : Rat) / 7) [(8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-97 : Rat) / 56) [(8, 1), (10, 1), (16, 1)],
  term ((-24 : Rat) / 7) [(8, 1), (10, 2), (16, 1)],
  term ((17 : Rat) / 7) [(8, 2), (9, 1), (15, 1), (16, 1)],
  term ((96 : Rat) / 7) [(8, 2), (9, 1), (15, 3), (16, 1)],
  term ((36 : Rat) / 7) [(8, 2), (10, 1), (16, 1)],
  term ((-8 : Rat) / 7) [(8, 2), (14, 1), (16, 1)],
  term ((-19 : Rat) / 7) [(8, 2), (15, 2), (16, 1)],
  term ((97 : Rat) / 112) [(8, 2), (16, 1)],
  term ((-12 : Rat) / 7) [(8, 3), (16, 1)],
  term ((-24 : Rat) / 7) [(9, 1), (10, 1), (11, 1), (16, 1)],
  term ((16 : Rat) / 7) [(9, 1), (11, 1), (14, 1), (16, 1)],
  term ((38 : Rat) / 7) [(9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-97 : Rat) / 56) [(9, 1), (11, 1), (16, 1)],
  term ((12 : Rat) / 7) [(9, 2), (10, 1), (16, 1)],
  term ((-34 : Rat) / 7) [(9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-192 : Rat) / 7) [(9, 2), (11, 1), (15, 3), (16, 1)],
  term ((-8 : Rat) / 7) [(9, 2), (14, 1), (16, 1)],
  term ((-19 : Rat) / 7) [(9, 2), (15, 2), (16, 1)],
  term ((97 : Rat) / 112) [(9, 2), (16, 1)],
  term ((17 : Rat) / 7) [(9, 3), (15, 1), (16, 1)],
  term ((96 : Rat) / 7) [(9, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 23, terms 0 through 10. -/
theorem rs_R011_ueqv_R011NNNY_block_23_0000_0010_valid :
    checkProductSumEq rs_R011_ueqv_R011NNNY_partials_23_0000_0010
      rs_R011_ueqv_R011NNNY_block_23_0000_0010 = true := by
  native_decide

end R011UeqvR011NNNYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
