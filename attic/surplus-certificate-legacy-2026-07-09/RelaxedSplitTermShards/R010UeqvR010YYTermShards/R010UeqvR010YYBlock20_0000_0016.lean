/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010YY, term block 20:0-16

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010YYTermShards

/-- Generator polynomial 20 for relaxed split surplus certificate `R010:u=v:R010YY`. -/
def rs_R010_ueqv_R010YY_generator_20_0000_0016 : Poly :=
[
  term (2 : Rat) [(6, 1), (8, 1)],
  term (-1 : Rat) [(6, 2)],
  term (2 : Rat) [(7, 1), (9, 1)],
  term (-1 : Rat) [(7, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010YY_coefficient_20_0000 : Poly :=
[
  term ((2876 : Rat) / 5) [(0, 1), (1, 1), (15, 1), (16, 1)]
]

/-- Partial product 0 for generator 20. -/
def rs_R010_ueqv_R010YY_partial_20_0000 : Poly :=
[
  term ((5752 : Rat) / 5) [(0, 1), (1, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-2876 : Rat) / 5) [(0, 1), (1, 1), (6, 2), (15, 1), (16, 1)],
  term ((5752 : Rat) / 5) [(0, 1), (1, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-2876 : Rat) / 5) [(0, 1), (1, 1), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 20. -/
theorem rs_R010_ueqv_R010YY_partial_20_0000_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_20_0000
        rs_R010_ueqv_R010YY_generator_20_0000_0016 =
      rs_R010_ueqv_R010YY_partial_20_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010YY_coefficient_20_0001 : Poly :=
[
  term ((4208 : Rat) / 25) [(0, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 1 for generator 20. -/
def rs_R010_ueqv_R010YY_partial_20_0001 : Poly :=
[
  term ((8416 : Rat) / 25) [(0, 1), (6, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-4208 : Rat) / 25) [(0, 1), (6, 2), (7, 1), (15, 1), (16, 1)],
  term ((8416 : Rat) / 25) [(0, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-4208 : Rat) / 25) [(0, 1), (7, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 20. -/
theorem rs_R010_ueqv_R010YY_partial_20_0001_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_20_0001
        rs_R010_ueqv_R010YY_generator_20_0000_0016 =
      rs_R010_ueqv_R010YY_partial_20_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010YY_coefficient_20_0002 : Poly :=
[
  term ((-1792 : Rat) / 25) [(0, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 2 for generator 20. -/
def rs_R010_ueqv_R010YY_partial_20_0002 : Poly :=
[
  term ((-3584 : Rat) / 25) [(0, 1), (6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(0, 1), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(0, 1), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(0, 1), (7, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 20. -/
theorem rs_R010_ueqv_R010YY_partial_20_0002_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_20_0002
        rs_R010_ueqv_R010YY_generator_20_0000_0016 =
      rs_R010_ueqv_R010YY_partial_20_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010YY_coefficient_20_0003 : Poly :=
[
  term ((-32796 : Rat) / 25) [(0, 1), (15, 2), (16, 1)]
]

/-- Partial product 3 for generator 20. -/
def rs_R010_ueqv_R010YY_partial_20_0003 : Poly :=
[
  term ((-65592 : Rat) / 25) [(0, 1), (6, 1), (8, 1), (15, 2), (16, 1)],
  term ((32796 : Rat) / 25) [(0, 1), (6, 2), (15, 2), (16, 1)],
  term ((-65592 : Rat) / 25) [(0, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((32796 : Rat) / 25) [(0, 1), (7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 20. -/
theorem rs_R010_ueqv_R010YY_partial_20_0003_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_20_0003
        rs_R010_ueqv_R010YY_generator_20_0000_0016 =
      rs_R010_ueqv_R010YY_partial_20_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010YY_coefficient_20_0004 : Poly :=
[
  term ((-2876 : Rat) / 5) [(1, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 4 for generator 20. -/
def rs_R010_ueqv_R010YY_partial_20_0004 : Poly :=
[
  term ((-5752 : Rat) / 5) [(1, 1), (6, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((2876 : Rat) / 5) [(1, 1), (6, 2), (14, 1), (15, 1), (16, 1)],
  term ((-5752 : Rat) / 5) [(1, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((2876 : Rat) / 5) [(1, 1), (7, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 20. -/
theorem rs_R010_ueqv_R010YY_partial_20_0004_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_20_0004
        rs_R010_ueqv_R010YY_generator_20_0000_0016 =
      rs_R010_ueqv_R010YY_partial_20_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010YY_coefficient_20_0005 : Poly :=
[
  term ((-524 : Rat) / 5) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 5 for generator 20. -/
def rs_R010_ueqv_R010YY_partial_20_0005 : Poly :=
[
  term ((-1048 : Rat) / 5) [(1, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((524 : Rat) / 5) [(1, 1), (6, 2), (15, 1), (16, 1)],
  term ((-1048 : Rat) / 5) [(1, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((524 : Rat) / 5) [(1, 1), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 20. -/
theorem rs_R010_ueqv_R010YY_partial_20_0005_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_20_0005
        rs_R010_ueqv_R010YY_generator_20_0000_0016 =
      rs_R010_ueqv_R010YY_partial_20_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010YY_coefficient_20_0006 : Poly :=
[
  term ((1592 : Rat) / 25) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 6 for generator 20. -/
def rs_R010_ueqv_R010YY_partial_20_0006 : Poly :=
[
  term ((3184 : Rat) / 25) [(3, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-1592 : Rat) / 25) [(3, 1), (6, 2), (15, 1), (16, 1)],
  term ((3184 : Rat) / 25) [(3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1592 : Rat) / 25) [(3, 1), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 20. -/
theorem rs_R010_ueqv_R010YY_partial_20_0006_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_20_0006
        rs_R010_ueqv_R010YY_generator_20_0000_0016 =
      rs_R010_ueqv_R010YY_partial_20_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010YY_coefficient_20_0007 : Poly :=
[
  term ((-448 : Rat) / 25) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 7 for generator 20. -/
def rs_R010_ueqv_R010YY_partial_20_0007 : Poly :=
[
  term ((-896 : Rat) / 25) [(5, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((448 : Rat) / 25) [(5, 1), (6, 2), (15, 1), (16, 1)],
  term ((-896 : Rat) / 25) [(5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((448 : Rat) / 25) [(5, 1), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 20. -/
theorem rs_R010_ueqv_R010YY_partial_20_0007_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_20_0007
        rs_R010_ueqv_R010YY_generator_20_0000_0016 =
      rs_R010_ueqv_R010YY_partial_20_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010YY_coefficient_20_0008 : Poly :=
[
  term ((-4208 : Rat) / 25) [(7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 8 for generator 20. -/
def rs_R010_ueqv_R010YY_partial_20_0008 : Poly :=
[
  term ((-8416 : Rat) / 25) [(6, 1), (7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((4208 : Rat) / 25) [(6, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8416 : Rat) / 25) [(7, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((4208 : Rat) / 25) [(7, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 20. -/
theorem rs_R010_ueqv_R010YY_partial_20_0008_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_20_0008
        rs_R010_ueqv_R010YY_generator_20_0000_0016 =
      rs_R010_ueqv_R010YY_partial_20_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010YY_coefficient_20_0009 : Poly :=
[
  term ((-1792 : Rat) / 25) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 9 for generator 20. -/
def rs_R010_ueqv_R010YY_partial_20_0009 : Poly :=
[
  term ((-3584 : Rat) / 25) [(6, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(6, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(7, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(7, 2), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 20. -/
theorem rs_R010_ueqv_R010YY_partial_20_0009_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_20_0009
        rs_R010_ueqv_R010YY_generator_20_0000_0016 =
      rs_R010_ueqv_R010YY_partial_20_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010YY_coefficient_20_0010 : Poly :=
[
  term (240 : Rat) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 10 for generator 20. -/
def rs_R010_ueqv_R010YY_partial_20_0010 : Poly :=
[
  term (480 : Rat) [(6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term (-240 : Rat) [(6, 2), (9, 1), (15, 1), (16, 1)],
  term (480 : Rat) [(7, 1), (9, 2), (15, 1), (16, 1)],
  term (-240 : Rat) [(7, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 20. -/
theorem rs_R010_ueqv_R010YY_partial_20_0010_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_20_0010
        rs_R010_ueqv_R010YY_generator_20_0000_0016 =
      rs_R010_ueqv_R010YY_partial_20_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010YY_coefficient_20_0011 : Poly :=
[
  term ((-3584 : Rat) / 25) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 11 for generator 20. -/
def rs_R010_ueqv_R010YY_partial_20_0011 : Poly :=
[
  term ((-7168 : Rat) / 25) [(6, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(6, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7168 : Rat) / 25) [(7, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(7, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 20. -/
theorem rs_R010_ueqv_R010YY_partial_20_0011_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_20_0011
        rs_R010_ueqv_R010YY_generator_20_0000_0016 =
      rs_R010_ueqv_R010YY_partial_20_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010YY_coefficient_20_0012 : Poly :=
[
  term ((7096 : Rat) / 25) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 12 for generator 20. -/
def rs_R010_ueqv_R010YY_partial_20_0012 : Poly :=
[
  term ((14192 : Rat) / 25) [(6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-7096 : Rat) / 25) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term ((14192 : Rat) / 25) [(7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-7096 : Rat) / 25) [(7, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 20. -/
theorem rs_R010_ueqv_R010YY_partial_20_0012_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_20_0012
        rs_R010_ueqv_R010YY_generator_20_0000_0016 =
      rs_R010_ueqv_R010YY_partial_20_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010YY_coefficient_20_0013 : Poly :=
[
  term ((32796 : Rat) / 25) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 13 for generator 20. -/
def rs_R010_ueqv_R010YY_partial_20_0013 : Poly :=
[
  term ((65592 : Rat) / 25) [(6, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-32796 : Rat) / 25) [(6, 2), (14, 1), (15, 2), (16, 1)],
  term ((65592 : Rat) / 25) [(7, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-32796 : Rat) / 25) [(7, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 20. -/
theorem rs_R010_ueqv_R010YY_partial_20_0013_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_20_0013
        rs_R010_ueqv_R010YY_generator_20_0000_0016 =
      rs_R010_ueqv_R010YY_partial_20_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010YY_coefficient_20_0014 : Poly :=
[
  term (4 : Rat) [(14, 1), (16, 1)]
]

/-- Partial product 14 for generator 20. -/
def rs_R010_ueqv_R010YY_partial_20_0014 : Poly :=
[
  term (8 : Rat) [(6, 1), (8, 1), (14, 1), (16, 1)],
  term (-4 : Rat) [(6, 2), (14, 1), (16, 1)],
  term (8 : Rat) [(7, 1), (9, 1), (14, 1), (16, 1)],
  term (-4 : Rat) [(7, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 20. -/
theorem rs_R010_ueqv_R010YY_partial_20_0014_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_20_0014
        rs_R010_ueqv_R010YY_generator_20_0000_0016 =
      rs_R010_ueqv_R010YY_partial_20_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010YY_coefficient_20_0015 : Poly :=
[
  term ((108 : Rat) / 25) [(15, 2), (16, 1)]
]

/-- Partial product 15 for generator 20. -/
def rs_R010_ueqv_R010YY_partial_20_0015 : Poly :=
[
  term ((216 : Rat) / 25) [(6, 1), (8, 1), (15, 2), (16, 1)],
  term ((-108 : Rat) / 25) [(6, 2), (15, 2), (16, 1)],
  term ((216 : Rat) / 25) [(7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-108 : Rat) / 25) [(7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 20. -/
theorem rs_R010_ueqv_R010YY_partial_20_0015_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_20_0015
        rs_R010_ueqv_R010YY_generator_20_0000_0016 =
      rs_R010_ueqv_R010YY_partial_20_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010YY_coefficient_20_0016 : Poly :=
[
  term (-3 : Rat) [(16, 1)]
]

/-- Partial product 16 for generator 20. -/
def rs_R010_ueqv_R010YY_partial_20_0016 : Poly :=
[
  term (-6 : Rat) [(6, 1), (8, 1), (16, 1)],
  term (3 : Rat) [(6, 2), (16, 1)],
  term (-6 : Rat) [(7, 1), (9, 1), (16, 1)],
  term (3 : Rat) [(7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 20. -/
theorem rs_R010_ueqv_R010YY_partial_20_0016_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_20_0016
        rs_R010_ueqv_R010YY_generator_20_0000_0016 =
      rs_R010_ueqv_R010YY_partial_20_0016 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010YY_partials_20_0000_0016 : List Poly :=
[
  rs_R010_ueqv_R010YY_partial_20_0000,
  rs_R010_ueqv_R010YY_partial_20_0001,
  rs_R010_ueqv_R010YY_partial_20_0002,
  rs_R010_ueqv_R010YY_partial_20_0003,
  rs_R010_ueqv_R010YY_partial_20_0004,
  rs_R010_ueqv_R010YY_partial_20_0005,
  rs_R010_ueqv_R010YY_partial_20_0006,
  rs_R010_ueqv_R010YY_partial_20_0007,
  rs_R010_ueqv_R010YY_partial_20_0008,
  rs_R010_ueqv_R010YY_partial_20_0009,
  rs_R010_ueqv_R010YY_partial_20_0010,
  rs_R010_ueqv_R010YY_partial_20_0011,
  rs_R010_ueqv_R010YY_partial_20_0012,
  rs_R010_ueqv_R010YY_partial_20_0013,
  rs_R010_ueqv_R010YY_partial_20_0014,
  rs_R010_ueqv_R010YY_partial_20_0015,
  rs_R010_ueqv_R010YY_partial_20_0016
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010YY_block_20_0000_0016 : Poly :=
[
  term ((5752 : Rat) / 5) [(0, 1), (1, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-2876 : Rat) / 5) [(0, 1), (1, 1), (6, 2), (15, 1), (16, 1)],
  term ((5752 : Rat) / 5) [(0, 1), (1, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-2876 : Rat) / 5) [(0, 1), (1, 1), (7, 2), (15, 1), (16, 1)],
  term ((8416 : Rat) / 25) [(0, 1), (6, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(0, 1), (6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-65592 : Rat) / 25) [(0, 1), (6, 1), (8, 1), (15, 2), (16, 1)],
  term ((-4208 : Rat) / 25) [(0, 1), (6, 2), (7, 1), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(0, 1), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((32796 : Rat) / 25) [(0, 1), (6, 2), (15, 2), (16, 1)],
  term ((-65592 : Rat) / 25) [(0, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-3584 : Rat) / 25) [(0, 1), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((10208 : Rat) / 25) [(0, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((32796 : Rat) / 25) [(0, 1), (7, 2), (15, 2), (16, 1)],
  term ((-4208 : Rat) / 25) [(0, 1), (7, 3), (15, 1), (16, 1)],
  term ((-5752 : Rat) / 5) [(1, 1), (6, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1048 : Rat) / 5) [(1, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((2876 : Rat) / 5) [(1, 1), (6, 2), (14, 1), (15, 1), (16, 1)],
  term ((524 : Rat) / 5) [(1, 1), (6, 2), (15, 1), (16, 1)],
  term ((-5752 : Rat) / 5) [(1, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1048 : Rat) / 5) [(1, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((2876 : Rat) / 5) [(1, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((524 : Rat) / 5) [(1, 1), (7, 2), (15, 1), (16, 1)],
  term ((3184 : Rat) / 25) [(3, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-1592 : Rat) / 25) [(3, 1), (6, 2), (15, 1), (16, 1)],
  term ((3184 : Rat) / 25) [(3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1592 : Rat) / 25) [(3, 1), (7, 2), (15, 1), (16, 1)],
  term ((-896 : Rat) / 25) [(5, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((448 : Rat) / 25) [(5, 1), (6, 2), (15, 1), (16, 1)],
  term ((-896 : Rat) / 25) [(5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((448 : Rat) / 25) [(5, 1), (7, 2), (15, 1), (16, 1)],
  term ((-8416 : Rat) / 25) [(6, 1), (7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(6, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term (480 : Rat) [(6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-7168 : Rat) / 25) [(6, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((14192 : Rat) / 25) [(6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((65592 : Rat) / 25) [(6, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term (8 : Rat) [(6, 1), (8, 1), (14, 1), (16, 1)],
  term ((216 : Rat) / 25) [(6, 1), (8, 1), (15, 2), (16, 1)],
  term (-6 : Rat) [(6, 1), (8, 1), (16, 1)],
  term ((4208 : Rat) / 25) [(6, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(6, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term (-240 : Rat) [(6, 2), (9, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(6, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7096 : Rat) / 25) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-32796 : Rat) / 25) [(6, 2), (14, 1), (15, 2), (16, 1)],
  term (-4 : Rat) [(6, 2), (14, 1), (16, 1)],
  term ((-108 : Rat) / 25) [(6, 2), (15, 2), (16, 1)],
  term (3 : Rat) [(6, 2), (16, 1)],
  term ((-7168 : Rat) / 25) [(7, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((14192 : Rat) / 25) [(7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((65592 : Rat) / 25) [(7, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term (8 : Rat) [(7, 1), (9, 1), (14, 1), (16, 1)],
  term ((216 : Rat) / 25) [(7, 1), (9, 1), (15, 2), (16, 1)],
  term (-6 : Rat) [(7, 1), (9, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(7, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term (480 : Rat) [(7, 1), (9, 2), (15, 1), (16, 1)],
  term ((-6624 : Rat) / 25) [(7, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term (-240 : Rat) [(7, 2), (9, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(7, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7096 : Rat) / 25) [(7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-32796 : Rat) / 25) [(7, 2), (14, 1), (15, 2), (16, 1)],
  term (-4 : Rat) [(7, 2), (14, 1), (16, 1)],
  term ((-108 : Rat) / 25) [(7, 2), (15, 2), (16, 1)],
  term (3 : Rat) [(7, 2), (16, 1)],
  term ((4208 : Rat) / 25) [(7, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 20, terms 0 through 16. -/
theorem rs_R010_ueqv_R010YY_block_20_0000_0016_valid :
    checkProductSumEq rs_R010_ueqv_R010YY_partials_20_0000_0016
      rs_R010_ueqv_R010YY_block_20_0000_0016 = true := by
  native_decide

end R010UeqvR010YYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
