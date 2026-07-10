/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010YY, term block 22:0-52

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010YYTermShards

/-- Generator polynomial 22 for relaxed split surplus certificate `R010:u=v:R010YY`. -/
def rs_R010_ueqv_R010YY_generator_22_0000_0052 : Poly :=
[
  term (-2 : Rat) [(0, 1), (10, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (11, 1)],
  term (1 : Rat) [(1, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 22. -/
def rs_R010_ueqv_R010YY_coefficient_22_0000 : Poly :=
[
  term ((-22016 : Rat) / 25) [(0, 1), (1, 1), (15, 1), (16, 1)]
]

/-- Partial product 0 for generator 22. -/
def rs_R010_ueqv_R010YY_partial_22_0000 : Poly :=
[
  term ((44032 : Rat) / 25) [(0, 1), (1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-22016 : Rat) / 25) [(0, 1), (1, 3), (15, 1), (16, 1)],
  term ((44032 : Rat) / 25) [(0, 2), (1, 1), (10, 1), (15, 1), (16, 1)],
  term ((-22016 : Rat) / 25) [(0, 3), (1, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 22. -/
theorem rs_R010_ueqv_R010YY_partial_22_0000_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_22_0000
        rs_R010_ueqv_R010YY_generator_22_0000_0052 =
      rs_R010_ueqv_R010YY_partial_22_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 22. -/
def rs_R010_ueqv_R010YY_coefficient_22_0001 : Poly :=
[
  term ((9712 : Rat) / 25) [(0, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 1 for generator 22. -/
def rs_R010_ueqv_R010YY_partial_22_0001 : Poly :=
[
  term ((-19424 : Rat) / 25) [(0, 1), (1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((9712 : Rat) / 25) [(0, 1), (1, 2), (7, 1), (15, 1), (16, 1)],
  term ((-19424 : Rat) / 25) [(0, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((9712 : Rat) / 25) [(0, 3), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 22. -/
theorem rs_R010_ueqv_R010YY_partial_22_0001_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_22_0001
        rs_R010_ueqv_R010YY_generator_22_0000_0052 =
      rs_R010_ueqv_R010YY_partial_22_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 22. -/
def rs_R010_ueqv_R010YY_coefficient_22_0002 : Poly :=
[
  term ((27168 : Rat) / 25) [(0, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 2 for generator 22. -/
def rs_R010_ueqv_R010YY_partial_22_0002 : Poly :=
[
  term ((-54336 : Rat) / 25) [(0, 1), (1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((27168 : Rat) / 25) [(0, 1), (1, 2), (9, 1), (15, 1), (16, 1)],
  term ((-54336 : Rat) / 25) [(0, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((27168 : Rat) / 25) [(0, 3), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 22. -/
theorem rs_R010_ueqv_R010YY_partial_22_0002_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_22_0002
        rs_R010_ueqv_R010YY_generator_22_0000_0052 =
      rs_R010_ueqv_R010YY_partial_22_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 22. -/
def rs_R010_ueqv_R010YY_coefficient_22_0003 : Poly :=
[
  term ((32556 : Rat) / 25) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 3 for generator 22. -/
def rs_R010_ueqv_R010YY_partial_22_0003 : Poly :=
[
  term ((-65112 : Rat) / 25) [(0, 1), (1, 1), (11, 2), (15, 1), (16, 1)],
  term ((32556 : Rat) / 25) [(0, 1), (1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-65112 : Rat) / 25) [(0, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((32556 : Rat) / 25) [(0, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 22. -/
theorem rs_R010_ueqv_R010YY_partial_22_0003_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_22_0003
        rs_R010_ueqv_R010YY_generator_22_0000_0052 =
      rs_R010_ueqv_R010YY_partial_22_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 22. -/
def rs_R010_ueqv_R010YY_coefficient_22_0004 : Poly :=
[
  term ((-2076 : Rat) / 25) [(0, 1), (15, 2), (16, 1)]
]

/-- Partial product 4 for generator 22. -/
def rs_R010_ueqv_R010YY_partial_22_0004 : Poly :=
[
  term ((4152 : Rat) / 25) [(0, 1), (1, 1), (11, 1), (15, 2), (16, 1)],
  term ((-2076 : Rat) / 25) [(0, 1), (1, 2), (15, 2), (16, 1)],
  term ((4152 : Rat) / 25) [(0, 2), (10, 1), (15, 2), (16, 1)],
  term ((-2076 : Rat) / 25) [(0, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 22. -/
theorem rs_R010_ueqv_R010YY_partial_22_0004_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_22_0004
        rs_R010_ueqv_R010YY_generator_22_0000_0052 =
      rs_R010_ueqv_R010YY_partial_22_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 22. -/
def rs_R010_ueqv_R010YY_coefficient_22_0005 : Poly :=
[
  term ((-11436 : Rat) / 25) [(1, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 5 for generator 22. -/
def rs_R010_ueqv_R010YY_partial_22_0005 : Poly :=
[
  term ((22872 : Rat) / 25) [(0, 1), (1, 1), (4, 1), (10, 1), (15, 1), (16, 1)],
  term ((-11436 : Rat) / 25) [(0, 2), (1, 1), (4, 1), (15, 1), (16, 1)],
  term ((22872 : Rat) / 25) [(1, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-11436 : Rat) / 25) [(1, 3), (4, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 22. -/
theorem rs_R010_ueqv_R010YY_partial_22_0005_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_22_0005
        rs_R010_ueqv_R010YY_generator_22_0000_0052 =
      rs_R010_ueqv_R010YY_partial_22_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 22. -/
def rs_R010_ueqv_R010YY_coefficient_22_0006 : Poly :=
[
  term ((5132 : Rat) / 25) [(1, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 6 for generator 22. -/
def rs_R010_ueqv_R010YY_partial_22_0006 : Poly :=
[
  term ((-10264 : Rat) / 25) [(0, 1), (1, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((5132 : Rat) / 25) [(0, 2), (1, 1), (8, 1), (15, 1), (16, 1)],
  term ((-10264 : Rat) / 25) [(1, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((5132 : Rat) / 25) [(1, 3), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 22. -/
theorem rs_R010_ueqv_R010YY_partial_22_0006_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_22_0006
        rs_R010_ueqv_R010YY_generator_22_0000_0052 =
      rs_R010_ueqv_R010YY_partial_22_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 22. -/
def rs_R010_ueqv_R010YY_coefficient_22_0007 : Poly :=
[
  term ((896 : Rat) / 25) [(1, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 7 for generator 22. -/
def rs_R010_ueqv_R010YY_partial_22_0007 : Poly :=
[
  term ((-1792 : Rat) / 25) [(0, 1), (1, 1), (10, 2), (15, 1), (16, 1)],
  term ((896 : Rat) / 25) [(0, 2), (1, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(1, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((896 : Rat) / 25) [(1, 3), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 22. -/
theorem rs_R010_ueqv_R010YY_partial_22_0007_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_22_0007
        rs_R010_ueqv_R010YY_generator_22_0000_0052 =
      rs_R010_ueqv_R010YY_partial_22_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 22. -/
def rs_R010_ueqv_R010YY_coefficient_22_0008 : Poly :=
[
  term ((5308 : Rat) / 5) [(1, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 8 for generator 22. -/
def rs_R010_ueqv_R010YY_partial_22_0008 : Poly :=
[
  term ((-10616 : Rat) / 5) [(0, 1), (1, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((5308 : Rat) / 5) [(0, 2), (1, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10616 : Rat) / 5) [(1, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((5308 : Rat) / 5) [(1, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 22. -/
theorem rs_R010_ueqv_R010YY_partial_22_0008_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_22_0008
        rs_R010_ueqv_R010YY_generator_22_0000_0052 =
      rs_R010_ueqv_R010YY_partial_22_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 22. -/
def rs_R010_ueqv_R010YY_coefficient_22_0009 : Poly :=
[
  term ((25002 : Rat) / 25) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 9 for generator 22. -/
def rs_R010_ueqv_R010YY_partial_22_0009 : Poly :=
[
  term ((-50004 : Rat) / 25) [(0, 1), (1, 1), (10, 1), (15, 1), (16, 1)],
  term ((25002 : Rat) / 25) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term ((-50004 : Rat) / 25) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((25002 : Rat) / 25) [(1, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 22. -/
theorem rs_R010_ueqv_R010YY_partial_22_0009_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_22_0009
        rs_R010_ueqv_R010YY_generator_22_0000_0052 =
      rs_R010_ueqv_R010YY_partial_22_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 22. -/
def rs_R010_ueqv_R010YY_coefficient_22_0010 : Poly :=
[
  term ((7036 : Rat) / 25) [(3, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 10 for generator 22. -/
def rs_R010_ueqv_R010YY_partial_22_0010 : Poly :=
[
  term ((-14072 : Rat) / 25) [(0, 1), (3, 1), (4, 1), (10, 1), (15, 1), (16, 1)],
  term ((7036 : Rat) / 25) [(0, 2), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((-14072 : Rat) / 25) [(1, 1), (3, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((7036 : Rat) / 25) [(1, 2), (3, 1), (4, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 22. -/
theorem rs_R010_ueqv_R010YY_partial_22_0010_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_22_0010
        rs_R010_ueqv_R010YY_generator_22_0000_0052 =
      rs_R010_ueqv_R010YY_partial_22_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 22. -/
def rs_R010_ueqv_R010YY_coefficient_22_0011 : Poly :=
[
  term ((-4152 : Rat) / 25) [(3, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 11 for generator 22. -/
def rs_R010_ueqv_R010YY_partial_22_0011 : Poly :=
[
  term ((8304 : Rat) / 25) [(0, 1), (3, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((-4152 : Rat) / 25) [(0, 2), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((8304 : Rat) / 25) [(1, 1), (3, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-4152 : Rat) / 25) [(1, 2), (3, 1), (6, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 22. -/
theorem rs_R010_ueqv_R010YY_partial_22_0011_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_22_0011
        rs_R010_ueqv_R010YY_generator_22_0000_0052 =
      rs_R010_ueqv_R010YY_partial_22_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 22. -/
def rs_R010_ueqv_R010YY_coefficient_22_0012 : Poly :=
[
  term ((-1792 : Rat) / 25) [(3, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 12 for generator 22. -/
def rs_R010_ueqv_R010YY_partial_22_0012 : Poly :=
[
  term ((3584 : Rat) / 25) [(0, 1), (3, 1), (7, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(0, 2), (3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(1, 1), (3, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(1, 2), (3, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 22. -/
theorem rs_R010_ueqv_R010YY_partial_22_0012_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_22_0012
        rs_R010_ueqv_R010YY_generator_22_0000_0052 =
      rs_R010_ueqv_R010YY_partial_22_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 22. -/
def rs_R010_ueqv_R010YY_coefficient_22_0013 : Poly :=
[
  term ((-1792 : Rat) / 25) [(3, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 13 for generator 22. -/
def rs_R010_ueqv_R010YY_partial_22_0013 : Poly :=
[
  term ((3584 : Rat) / 25) [(0, 1), (3, 1), (7, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(0, 2), (3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(1, 1), (3, 1), (7, 1), (11, 2), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(1, 2), (3, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 22. -/
theorem rs_R010_ueqv_R010YY_partial_22_0013_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_22_0013
        rs_R010_ueqv_R010YY_generator_22_0000_0052 =
      rs_R010_ueqv_R010YY_partial_22_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 22. -/
def rs_R010_ueqv_R010YY_coefficient_22_0014 : Poly :=
[
  term (2 : Rat) [(3, 1), (7, 1), (16, 1)]
]

/-- Partial product 14 for generator 22. -/
def rs_R010_ueqv_R010YY_partial_22_0014 : Poly :=
[
  term (-4 : Rat) [(0, 1), (3, 1), (7, 1), (10, 1), (16, 1)],
  term (2 : Rat) [(0, 2), (3, 1), (7, 1), (16, 1)],
  term (-4 : Rat) [(1, 1), (3, 1), (7, 1), (11, 1), (16, 1)],
  term (2 : Rat) [(1, 2), (3, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 22. -/
theorem rs_R010_ueqv_R010YY_partial_22_0014_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_22_0014
        rs_R010_ueqv_R010YY_generator_22_0000_0052 =
      rs_R010_ueqv_R010YY_partial_22_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 22. -/
def rs_R010_ueqv_R010YY_coefficient_22_0015 : Poly :=
[
  term ((-3936 : Rat) / 25) [(3, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 15 for generator 22. -/
def rs_R010_ueqv_R010YY_partial_22_0015 : Poly :=
[
  term ((7872 : Rat) / 25) [(0, 1), (3, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-3936 : Rat) / 25) [(0, 2), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((7872 : Rat) / 25) [(1, 1), (3, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3936 : Rat) / 25) [(1, 2), (3, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 22. -/
theorem rs_R010_ueqv_R010YY_partial_22_0015_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_22_0015
        rs_R010_ueqv_R010YY_generator_22_0000_0052 =
      rs_R010_ueqv_R010YY_partial_22_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 22. -/
def rs_R010_ueqv_R010YY_coefficient_22_0016 : Poly :=
[
  term ((-1792 : Rat) / 25) [(3, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 16 for generator 22. -/
def rs_R010_ueqv_R010YY_partial_22_0016 : Poly :=
[
  term ((3584 : Rat) / 25) [(0, 1), (3, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(0, 2), (3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(1, 1), (3, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(1, 2), (3, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 22. -/
theorem rs_R010_ueqv_R010YY_partial_22_0016_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_22_0016
        rs_R010_ueqv_R010YY_generator_22_0000_0052 =
      rs_R010_ueqv_R010YY_partial_22_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 22. -/
def rs_R010_ueqv_R010YY_coefficient_22_0017 : Poly :=
[
  term ((-1792 : Rat) / 25) [(3, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 17 for generator 22. -/
def rs_R010_ueqv_R010YY_partial_22_0017 : Poly :=
[
  term ((3584 : Rat) / 25) [(0, 1), (3, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(0, 2), (3, 1), (9, 2), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(1, 1), (3, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(1, 2), (3, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 22. -/
theorem rs_R010_ueqv_R010YY_partial_22_0017_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_22_0017
        rs_R010_ueqv_R010YY_generator_22_0000_0052 =
      rs_R010_ueqv_R010YY_partial_22_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 22. -/
def rs_R010_ueqv_R010YY_coefficient_22_0018 : Poly :=
[
  term ((-5256 : Rat) / 25) [(3, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 18 for generator 22. -/
def rs_R010_ueqv_R010YY_partial_22_0018 : Poly :=
[
  term ((10512 : Rat) / 25) [(0, 1), (3, 1), (10, 2), (15, 1), (16, 1)],
  term ((-5256 : Rat) / 25) [(0, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((10512 : Rat) / 25) [(1, 1), (3, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-5256 : Rat) / 25) [(1, 2), (3, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 22. -/
theorem rs_R010_ueqv_R010YY_partial_22_0018_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_22_0018
        rs_R010_ueqv_R010YY_generator_22_0000_0052 =
      rs_R010_ueqv_R010YY_partial_22_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 22. -/
def rs_R010_ueqv_R010YY_coefficient_22_0019 : Poly :=
[
  term ((-356 : Rat) / 5) [(3, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 19 for generator 22. -/
def rs_R010_ueqv_R010YY_partial_22_0019 : Poly :=
[
  term ((712 : Rat) / 5) [(0, 1), (3, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-356 : Rat) / 5) [(0, 2), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((712 : Rat) / 5) [(1, 1), (3, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-356 : Rat) / 5) [(1, 2), (3, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 22. -/
theorem rs_R010_ueqv_R010YY_partial_22_0019_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_22_0019
        rs_R010_ueqv_R010YY_generator_22_0000_0052 =
      rs_R010_ueqv_R010YY_partial_22_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 22. -/
def rs_R010_ueqv_R010YY_coefficient_22_0020 : Poly :=
[
  term ((4928 : Rat) / 25) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 20 for generator 22. -/
def rs_R010_ueqv_R010YY_partial_22_0020 : Poly :=
[
  term ((-9856 : Rat) / 25) [(0, 1), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((4928 : Rat) / 25) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((-9856 : Rat) / 25) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((4928 : Rat) / 25) [(1, 2), (3, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 22. -/
theorem rs_R010_ueqv_R010YY_partial_22_0020_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_22_0020
        rs_R010_ueqv_R010YY_generator_22_0000_0052 =
      rs_R010_ueqv_R010YY_partial_22_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 22. -/
def rs_R010_ueqv_R010YY_coefficient_22_0021 : Poly :=
[
  term ((-2688 : Rat) / 25) [(4, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 21 for generator 22. -/
def rs_R010_ueqv_R010YY_partial_22_0021 : Poly :=
[
  term ((5376 : Rat) / 25) [(0, 1), (4, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-2688 : Rat) / 25) [(0, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((5376 : Rat) / 25) [(1, 1), (4, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2688 : Rat) / 25) [(1, 2), (4, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 22. -/
theorem rs_R010_ueqv_R010YY_partial_22_0021_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_22_0021
        rs_R010_ueqv_R010YY_generator_22_0000_0052 =
      rs_R010_ueqv_R010YY_partial_22_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 22. -/
def rs_R010_ueqv_R010YY_coefficient_22_0022 : Poly :=
[
  term ((2688 : Rat) / 25) [(4, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 22 for generator 22. -/
def rs_R010_ueqv_R010YY_partial_22_0022 : Poly :=
[
  term ((-5376 : Rat) / 25) [(0, 1), (4, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((2688 : Rat) / 25) [(0, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-5376 : Rat) / 25) [(1, 1), (4, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((2688 : Rat) / 25) [(1, 2), (4, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 22. -/
theorem rs_R010_ueqv_R010YY_partial_22_0022_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_22_0022
        rs_R010_ueqv_R010YY_generator_22_0000_0052 =
      rs_R010_ueqv_R010YY_partial_22_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 22. -/
def rs_R010_ueqv_R010YY_coefficient_22_0023 : Poly :=
[
  term ((-2636 : Rat) / 25) [(4, 1), (15, 2), (16, 1)]
]

/-- Partial product 23 for generator 22. -/
def rs_R010_ueqv_R010YY_partial_22_0023 : Poly :=
[
  term ((5272 : Rat) / 25) [(0, 1), (4, 1), (10, 1), (15, 2), (16, 1)],
  term ((-2636 : Rat) / 25) [(0, 2), (4, 1), (15, 2), (16, 1)],
  term ((5272 : Rat) / 25) [(1, 1), (4, 1), (11, 1), (15, 2), (16, 1)],
  term ((-2636 : Rat) / 25) [(1, 2), (4, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 22. -/
theorem rs_R010_ueqv_R010YY_partial_22_0023_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_22_0023
        rs_R010_ueqv_R010YY_generator_22_0000_0052 =
      rs_R010_ueqv_R010YY_partial_22_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 22. -/
def rs_R010_ueqv_R010YY_coefficient_22_0024 : Poly :=
[
  term ((-1792 : Rat) / 25) [(5, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 24 for generator 22. -/
def rs_R010_ueqv_R010YY_partial_22_0024 : Poly :=
[
  term ((3584 : Rat) / 25) [(0, 1), (5, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(0, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(1, 1), (5, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(1, 2), (5, 1), (6, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 22. -/
theorem rs_R010_ueqv_R010YY_partial_22_0024_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_22_0024
        rs_R010_ueqv_R010YY_generator_22_0000_0052 =
      rs_R010_ueqv_R010YY_partial_22_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 22. -/
def rs_R010_ueqv_R010YY_coefficient_22_0025 : Poly :=
[
  term ((-14072 : Rat) / 25) [(5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 25 for generator 22. -/
def rs_R010_ueqv_R010YY_partial_22_0025 : Poly :=
[
  term ((28144 : Rat) / 25) [(0, 1), (5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-14072 : Rat) / 25) [(0, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((28144 : Rat) / 25) [(1, 1), (5, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-14072 : Rat) / 25) [(1, 2), (5, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 22. -/
theorem rs_R010_ueqv_R010YY_partial_22_0025_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_22_0025
        rs_R010_ueqv_R010YY_generator_22_0000_0052 =
      rs_R010_ueqv_R010YY_partial_22_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 22. -/
def rs_R010_ueqv_R010YY_coefficient_22_0026 : Poly :=
[
  term (458 : Rat) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 26 for generator 22. -/
def rs_R010_ueqv_R010YY_partial_22_0026 : Poly :=
[
  term (-916 : Rat) [(0, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term (458 : Rat) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term (-916 : Rat) [(1, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term (458 : Rat) [(1, 2), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 22. -/
theorem rs_R010_ueqv_R010YY_partial_22_0026_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_22_0026
        rs_R010_ueqv_R010YY_generator_22_0000_0052 =
      rs_R010_ueqv_R010YY_partial_22_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 22. -/
def rs_R010_ueqv_R010YY_coefficient_22_0027 : Poly :=
[
  term ((-2416 : Rat) / 25) [(6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 27 for generator 22. -/
def rs_R010_ueqv_R010YY_partial_22_0027 : Poly :=
[
  term ((4832 : Rat) / 25) [(0, 1), (6, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-2416 : Rat) / 25) [(0, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((4832 : Rat) / 25) [(1, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2416 : Rat) / 25) [(1, 2), (6, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 22. -/
theorem rs_R010_ueqv_R010YY_partial_22_0027_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_22_0027
        rs_R010_ueqv_R010YY_generator_22_0000_0052 =
      rs_R010_ueqv_R010YY_partial_22_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 22. -/
def rs_R010_ueqv_R010YY_coefficient_22_0028 : Poly :=
[
  term ((-6128 : Rat) / 25) [(6, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 28 for generator 22. -/
def rs_R010_ueqv_R010YY_partial_22_0028 : Poly :=
[
  term ((12256 : Rat) / 25) [(0, 1), (6, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-6128 : Rat) / 25) [(0, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((12256 : Rat) / 25) [(1, 1), (6, 1), (11, 2), (15, 1), (16, 1)],
  term ((-6128 : Rat) / 25) [(1, 2), (6, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 22. -/
theorem rs_R010_ueqv_R010YY_partial_22_0028_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_22_0028
        rs_R010_ueqv_R010YY_generator_22_0000_0052 =
      rs_R010_ueqv_R010YY_partial_22_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 22. -/
def rs_R010_ueqv_R010YY_coefficient_22_0029 : Poly :=
[
  term ((12488 : Rat) / 25) [(6, 1), (15, 2), (16, 1)]
]

/-- Partial product 29 for generator 22. -/
def rs_R010_ueqv_R010YY_partial_22_0029 : Poly :=
[
  term ((-24976 : Rat) / 25) [(0, 1), (6, 1), (10, 1), (15, 2), (16, 1)],
  term ((12488 : Rat) / 25) [(0, 2), (6, 1), (15, 2), (16, 1)],
  term ((-24976 : Rat) / 25) [(1, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((12488 : Rat) / 25) [(1, 2), (6, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 22. -/
theorem rs_R010_ueqv_R010YY_partial_22_0029_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_22_0029
        rs_R010_ueqv_R010YY_generator_22_0000_0052 =
      rs_R010_ueqv_R010YY_partial_22_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 22. -/
def rs_R010_ueqv_R010YY_coefficient_22_0030 : Poly :=
[
  term (-1 : Rat) [(6, 1), (16, 1)]
]

/-- Partial product 30 for generator 22. -/
def rs_R010_ueqv_R010YY_partial_22_0030 : Poly :=
[
  term (2 : Rat) [(0, 1), (6, 1), (10, 1), (16, 1)],
  term (-1 : Rat) [(0, 2), (6, 1), (16, 1)],
  term (2 : Rat) [(1, 1), (6, 1), (11, 1), (16, 1)],
  term (-1 : Rat) [(1, 2), (6, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 22. -/
theorem rs_R010_ueqv_R010YY_partial_22_0030_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_22_0030
        rs_R010_ueqv_R010YY_generator_22_0000_0052 =
      rs_R010_ueqv_R010YY_partial_22_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 22. -/
def rs_R010_ueqv_R010YY_coefficient_22_0031 : Poly :=
[
  term ((-384 : Rat) / 5) [(7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 31 for generator 22. -/
def rs_R010_ueqv_R010YY_partial_22_0031 : Poly :=
[
  term ((768 : Rat) / 5) [(0, 1), (7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-384 : Rat) / 5) [(0, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((768 : Rat) / 5) [(1, 1), (7, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-384 : Rat) / 5) [(1, 2), (7, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 22. -/
theorem rs_R010_ueqv_R010YY_partial_22_0031_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_22_0031
        rs_R010_ueqv_R010YY_generator_22_0000_0052 =
      rs_R010_ueqv_R010YY_partial_22_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 22. -/
def rs_R010_ueqv_R010YY_coefficient_22_0032 : Poly :=
[
  term ((1792 : Rat) / 25) [(7, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 32 for generator 22. -/
def rs_R010_ueqv_R010YY_partial_22_0032 : Poly :=
[
  term ((-3584 : Rat) / 25) [(0, 1), (7, 1), (10, 2), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(0, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(1, 1), (7, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(1, 2), (7, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 22. -/
theorem rs_R010_ueqv_R010YY_partial_22_0032_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_22_0032
        rs_R010_ueqv_R010YY_generator_22_0000_0052 =
      rs_R010_ueqv_R010YY_partial_22_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 22. -/
def rs_R010_ueqv_R010YY_coefficient_22_0033 : Poly :=
[
  term ((-12488 : Rat) / 25) [(7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 33 for generator 22. -/
def rs_R010_ueqv_R010YY_partial_22_0033 : Poly :=
[
  term ((24976 : Rat) / 25) [(0, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12488 : Rat) / 25) [(0, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((24976 : Rat) / 25) [(1, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12488 : Rat) / 25) [(1, 2), (7, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 22. -/
theorem rs_R010_ueqv_R010YY_partial_22_0033_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_22_0033
        rs_R010_ueqv_R010YY_generator_22_0000_0052 =
      rs_R010_ueqv_R010YY_partial_22_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 22. -/
def rs_R010_ueqv_R010YY_coefficient_22_0034 : Poly :=
[
  term (36 : Rat) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 34 for generator 22. -/
def rs_R010_ueqv_R010YY_partial_22_0034 : Poly :=
[
  term (-72 : Rat) [(0, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term (36 : Rat) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term (-72 : Rat) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term (36 : Rat) [(1, 2), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 22. -/
theorem rs_R010_ueqv_R010YY_partial_22_0034_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_22_0034
        rs_R010_ueqv_R010YY_generator_22_0000_0052 =
      rs_R010_ueqv_R010YY_partial_22_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 22. -/
def rs_R010_ueqv_R010YY_coefficient_22_0035 : Poly :=
[
  term ((2688 : Rat) / 25) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 35 for generator 22. -/
def rs_R010_ueqv_R010YY_partial_22_0035 : Poly :=
[
  term ((-5376 : Rat) / 25) [(0, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((2688 : Rat) / 25) [(0, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-5376 : Rat) / 25) [(1, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((2688 : Rat) / 25) [(1, 2), (8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 22. -/
theorem rs_R010_ueqv_R010YY_partial_22_0035_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_22_0035
        rs_R010_ueqv_R010YY_generator_22_0000_0052 =
      rs_R010_ueqv_R010YY_partial_22_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 22. -/
def rs_R010_ueqv_R010YY_coefficient_22_0036 : Poly :=
[
  term ((-5072 : Rat) / 25) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 36 for generator 22. -/
def rs_R010_ueqv_R010YY_partial_22_0036 : Poly :=
[
  term ((10144 : Rat) / 25) [(0, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5072 : Rat) / 25) [(0, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((10144 : Rat) / 25) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5072 : Rat) / 25) [(1, 2), (8, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 22. -/
theorem rs_R010_ueqv_R010YY_partial_22_0036_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_22_0036
        rs_R010_ueqv_R010YY_generator_22_0000_0052 =
      rs_R010_ueqv_R010YY_partial_22_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 22. -/
def rs_R010_ueqv_R010YY_coefficient_22_0037 : Poly :=
[
  term ((1492 : Rat) / 25) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 37 for generator 22. -/
def rs_R010_ueqv_R010YY_partial_22_0037 : Poly :=
[
  term ((-2984 : Rat) / 25) [(0, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((1492 : Rat) / 25) [(0, 2), (8, 1), (15, 2), (16, 1)],
  term ((-2984 : Rat) / 25) [(1, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((1492 : Rat) / 25) [(1, 2), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 22. -/
theorem rs_R010_ueqv_R010YY_partial_22_0037_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_22_0037
        rs_R010_ueqv_R010YY_generator_22_0000_0052 =
      rs_R010_ueqv_R010YY_partial_22_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 22. -/
def rs_R010_ueqv_R010YY_coefficient_22_0038 : Poly :=
[
  term ((-2688 : Rat) / 25) [(9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 38 for generator 22. -/
def rs_R010_ueqv_R010YY_partial_22_0038 : Poly :=
[
  term ((5376 : Rat) / 25) [(0, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-2688 : Rat) / 25) [(0, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((5376 : Rat) / 25) [(1, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2688 : Rat) / 25) [(1, 2), (9, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 22. -/
theorem rs_R010_ueqv_R010YY_partial_22_0038_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_22_0038
        rs_R010_ueqv_R010YY_generator_22_0000_0052 =
      rs_R010_ueqv_R010YY_partial_22_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 22. -/
def rs_R010_ueqv_R010YY_coefficient_22_0039 : Poly :=
[
  term ((3584 : Rat) / 25) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 39 for generator 22. -/
def rs_R010_ueqv_R010YY_partial_22_0039 : Poly :=
[
  term ((-7168 : Rat) / 25) [(0, 1), (9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((3584 : Rat) / 25) [(0, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-7168 : Rat) / 25) [(1, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((3584 : Rat) / 25) [(1, 2), (9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 22. -/
theorem rs_R010_ueqv_R010YY_partial_22_0039_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_22_0039
        rs_R010_ueqv_R010YY_generator_22_0000_0052 =
      rs_R010_ueqv_R010YY_partial_22_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 22. -/
def rs_R010_ueqv_R010YY_coefficient_22_0040 : Poly :=
[
  term ((-5664 : Rat) / 5) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 40 for generator 22. -/
def rs_R010_ueqv_R010YY_partial_22_0040 : Poly :=
[
  term ((11328 : Rat) / 5) [(0, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5664 : Rat) / 5) [(0, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((11328 : Rat) / 5) [(1, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5664 : Rat) / 5) [(1, 2), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 22. -/
theorem rs_R010_ueqv_R010YY_partial_22_0040_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_22_0040
        rs_R010_ueqv_R010YY_generator_22_0000_0052 =
      rs_R010_ueqv_R010YY_partial_22_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 22. -/
def rs_R010_ueqv_R010YY_coefficient_22_0041 : Poly :=
[
  term ((4312 : Rat) / 25) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 41 for generator 22. -/
def rs_R010_ueqv_R010YY_partial_22_0041 : Poly :=
[
  term ((-8624 : Rat) / 25) [(0, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((4312 : Rat) / 25) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((-8624 : Rat) / 25) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((4312 : Rat) / 25) [(1, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 22. -/
theorem rs_R010_ueqv_R010YY_partial_22_0041_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_22_0041
        rs_R010_ueqv_R010YY_generator_22_0000_0052 =
      rs_R010_ueqv_R010YY_partial_22_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 22. -/
def rs_R010_ueqv_R010YY_coefficient_22_0042 : Poly :=
[
  term ((-356 : Rat) / 5) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 42 for generator 22. -/
def rs_R010_ueqv_R010YY_partial_22_0042 : Poly :=
[
  term ((712 : Rat) / 5) [(0, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-356 : Rat) / 5) [(0, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((712 : Rat) / 5) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-356 : Rat) / 5) [(1, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 22. -/
theorem rs_R010_ueqv_R010YY_partial_22_0042_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_22_0042
        rs_R010_ueqv_R010YY_generator_22_0000_0052 =
      rs_R010_ueqv_R010YY_partial_22_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 22. -/
def rs_R010_ueqv_R010YY_coefficient_22_0043 : Poly :=
[
  term ((14072 : Rat) / 25) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 43 for generator 22. -/
def rs_R010_ueqv_R010YY_partial_22_0043 : Poly :=
[
  term ((-28144 : Rat) / 25) [(0, 1), (10, 2), (15, 2), (16, 1)],
  term ((14072 : Rat) / 25) [(0, 2), (10, 1), (15, 2), (16, 1)],
  term ((-28144 : Rat) / 25) [(1, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((14072 : Rat) / 25) [(1, 2), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 22. -/
theorem rs_R010_ueqv_R010YY_partial_22_0043_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_22_0043
        rs_R010_ueqv_R010YY_generator_22_0000_0052 =
      rs_R010_ueqv_R010YY_partial_22_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 22. -/
def rs_R010_ueqv_R010YY_coefficient_22_0044 : Poly :=
[
  term ((3584 : Rat) / 25) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 44 for generator 22. -/
def rs_R010_ueqv_R010YY_partial_22_0044 : Poly :=
[
  term ((-7168 : Rat) / 25) [(0, 1), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((3584 : Rat) / 25) [(0, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-7168 : Rat) / 25) [(1, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((3584 : Rat) / 25) [(1, 2), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 22. -/
theorem rs_R010_ueqv_R010YY_partial_22_0044_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_22_0044
        rs_R010_ueqv_R010YY_generator_22_0000_0052 =
      rs_R010_ueqv_R010YY_partial_22_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 22. -/
def rs_R010_ueqv_R010YY_coefficient_22_0045 : Poly :=
[
  term ((-4724 : Rat) / 5) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 45 for generator 22. -/
def rs_R010_ueqv_R010YY_partial_22_0045 : Poly :=
[
  term ((9448 : Rat) / 5) [(0, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4724 : Rat) / 5) [(0, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((9448 : Rat) / 5) [(1, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-4724 : Rat) / 5) [(1, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 22. -/
theorem rs_R010_ueqv_R010YY_partial_22_0045_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_22_0045
        rs_R010_ueqv_R010YY_generator_22_0000_0052 =
      rs_R010_ueqv_R010YY_partial_22_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 22. -/
def rs_R010_ueqv_R010YY_coefficient_22_0046 : Poly :=
[
  term ((-8154 : Rat) / 25) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 46 for generator 22. -/
def rs_R010_ueqv_R010YY_partial_22_0046 : Poly :=
[
  term ((16308 : Rat) / 25) [(0, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-8154 : Rat) / 25) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((16308 : Rat) / 25) [(1, 1), (11, 2), (15, 1), (16, 1)],
  term ((-8154 : Rat) / 25) [(1, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 22. -/
theorem rs_R010_ueqv_R010YY_partial_22_0046_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_22_0046
        rs_R010_ueqv_R010YY_generator_22_0000_0052 =
      rs_R010_ueqv_R010YY_partial_22_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 22. -/
def rs_R010_ueqv_R010YY_coefficient_22_0047 : Poly :=
[
  term ((6852 : Rat) / 25) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 47 for generator 22. -/
def rs_R010_ueqv_R010YY_partial_22_0047 : Poly :=
[
  term ((-13704 : Rat) / 25) [(0, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((6852 : Rat) / 25) [(0, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-13704 : Rat) / 25) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((6852 : Rat) / 25) [(1, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 22. -/
theorem rs_R010_ueqv_R010YY_partial_22_0047_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_22_0047
        rs_R010_ueqv_R010YY_generator_22_0000_0052 =
      rs_R010_ueqv_R010YY_partial_22_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 22. -/
def rs_R010_ueqv_R010YY_coefficient_22_0048 : Poly :=
[
  term ((-2836 : Rat) / 25) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 48 for generator 22. -/
def rs_R010_ueqv_R010YY_partial_22_0048 : Poly :=
[
  term ((5672 : Rat) / 25) [(0, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2836 : Rat) / 25) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((5672 : Rat) / 25) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2836 : Rat) / 25) [(1, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 22. -/
theorem rs_R010_ueqv_R010YY_partial_22_0048_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_22_0048
        rs_R010_ueqv_R010YY_generator_22_0000_0052 =
      rs_R010_ueqv_R010YY_partial_22_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 22. -/
def rs_R010_ueqv_R010YY_coefficient_22_0049 : Poly :=
[
  term (-10 : Rat) [(14, 1), (16, 1)]
]

/-- Partial product 49 for generator 22. -/
def rs_R010_ueqv_R010YY_partial_22_0049 : Poly :=
[
  term (20 : Rat) [(0, 1), (10, 1), (14, 1), (16, 1)],
  term (-10 : Rat) [(0, 2), (14, 1), (16, 1)],
  term (20 : Rat) [(1, 1), (11, 1), (14, 1), (16, 1)],
  term (-10 : Rat) [(1, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 22. -/
theorem rs_R010_ueqv_R010YY_partial_22_0049_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_22_0049
        rs_R010_ueqv_R010YY_generator_22_0000_0052 =
      rs_R010_ueqv_R010YY_partial_22_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 22. -/
def rs_R010_ueqv_R010YY_coefficient_22_0050 : Poly :=
[
  term (8 : Rat) [(14, 2), (16, 1)]
]

/-- Partial product 50 for generator 22. -/
def rs_R010_ueqv_R010YY_partial_22_0050 : Poly :=
[
  term (-16 : Rat) [(0, 1), (10, 1), (14, 2), (16, 1)],
  term (8 : Rat) [(0, 2), (14, 2), (16, 1)],
  term (-16 : Rat) [(1, 1), (11, 1), (14, 2), (16, 1)],
  term (8 : Rat) [(1, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 22. -/
theorem rs_R010_ueqv_R010YY_partial_22_0050_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_22_0050
        rs_R010_ueqv_R010YY_generator_22_0000_0052 =
      rs_R010_ueqv_R010YY_partial_22_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 22. -/
def rs_R010_ueqv_R010YY_coefficient_22_0051 : Poly :=
[
  term ((-33122 : Rat) / 25) [(15, 2), (16, 1)]
]

/-- Partial product 51 for generator 22. -/
def rs_R010_ueqv_R010YY_partial_22_0051 : Poly :=
[
  term ((66244 : Rat) / 25) [(0, 1), (10, 1), (15, 2), (16, 1)],
  term ((-33122 : Rat) / 25) [(0, 2), (15, 2), (16, 1)],
  term ((66244 : Rat) / 25) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term ((-33122 : Rat) / 25) [(1, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 22. -/
theorem rs_R010_ueqv_R010YY_partial_22_0051_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_22_0051
        rs_R010_ueqv_R010YY_generator_22_0000_0052 =
      rs_R010_ueqv_R010YY_partial_22_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 22. -/
def rs_R010_ueqv_R010YY_coefficient_22_0052 : Poly :=
[
  term (2 : Rat) [(16, 1)]
]

/-- Partial product 52 for generator 22. -/
def rs_R010_ueqv_R010YY_partial_22_0052 : Poly :=
[
  term (-4 : Rat) [(0, 1), (10, 1), (16, 1)],
  term (2 : Rat) [(0, 2), (16, 1)],
  term (-4 : Rat) [(1, 1), (11, 1), (16, 1)],
  term (2 : Rat) [(1, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 22. -/
theorem rs_R010_ueqv_R010YY_partial_22_0052_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_22_0052
        rs_R010_ueqv_R010YY_generator_22_0000_0052 =
      rs_R010_ueqv_R010YY_partial_22_0052 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010YY_partials_22_0000_0052 : List Poly :=
[
  rs_R010_ueqv_R010YY_partial_22_0000,
  rs_R010_ueqv_R010YY_partial_22_0001,
  rs_R010_ueqv_R010YY_partial_22_0002,
  rs_R010_ueqv_R010YY_partial_22_0003,
  rs_R010_ueqv_R010YY_partial_22_0004,
  rs_R010_ueqv_R010YY_partial_22_0005,
  rs_R010_ueqv_R010YY_partial_22_0006,
  rs_R010_ueqv_R010YY_partial_22_0007,
  rs_R010_ueqv_R010YY_partial_22_0008,
  rs_R010_ueqv_R010YY_partial_22_0009,
  rs_R010_ueqv_R010YY_partial_22_0010,
  rs_R010_ueqv_R010YY_partial_22_0011,
  rs_R010_ueqv_R010YY_partial_22_0012,
  rs_R010_ueqv_R010YY_partial_22_0013,
  rs_R010_ueqv_R010YY_partial_22_0014,
  rs_R010_ueqv_R010YY_partial_22_0015,
  rs_R010_ueqv_R010YY_partial_22_0016,
  rs_R010_ueqv_R010YY_partial_22_0017,
  rs_R010_ueqv_R010YY_partial_22_0018,
  rs_R010_ueqv_R010YY_partial_22_0019,
  rs_R010_ueqv_R010YY_partial_22_0020,
  rs_R010_ueqv_R010YY_partial_22_0021,
  rs_R010_ueqv_R010YY_partial_22_0022,
  rs_R010_ueqv_R010YY_partial_22_0023,
  rs_R010_ueqv_R010YY_partial_22_0024,
  rs_R010_ueqv_R010YY_partial_22_0025,
  rs_R010_ueqv_R010YY_partial_22_0026,
  rs_R010_ueqv_R010YY_partial_22_0027,
  rs_R010_ueqv_R010YY_partial_22_0028,
  rs_R010_ueqv_R010YY_partial_22_0029,
  rs_R010_ueqv_R010YY_partial_22_0030,
  rs_R010_ueqv_R010YY_partial_22_0031,
  rs_R010_ueqv_R010YY_partial_22_0032,
  rs_R010_ueqv_R010YY_partial_22_0033,
  rs_R010_ueqv_R010YY_partial_22_0034,
  rs_R010_ueqv_R010YY_partial_22_0035,
  rs_R010_ueqv_R010YY_partial_22_0036,
  rs_R010_ueqv_R010YY_partial_22_0037,
  rs_R010_ueqv_R010YY_partial_22_0038,
  rs_R010_ueqv_R010YY_partial_22_0039,
  rs_R010_ueqv_R010YY_partial_22_0040,
  rs_R010_ueqv_R010YY_partial_22_0041,
  rs_R010_ueqv_R010YY_partial_22_0042,
  rs_R010_ueqv_R010YY_partial_22_0043,
  rs_R010_ueqv_R010YY_partial_22_0044,
  rs_R010_ueqv_R010YY_partial_22_0045,
  rs_R010_ueqv_R010YY_partial_22_0046,
  rs_R010_ueqv_R010YY_partial_22_0047,
  rs_R010_ueqv_R010YY_partial_22_0048,
  rs_R010_ueqv_R010YY_partial_22_0049,
  rs_R010_ueqv_R010YY_partial_22_0050,
  rs_R010_ueqv_R010YY_partial_22_0051,
  rs_R010_ueqv_R010YY_partial_22_0052
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010YY_block_22_0000_0052 : Poly :=
[
  term ((22872 : Rat) / 25) [(0, 1), (1, 1), (4, 1), (10, 1), (15, 1), (16, 1)],
  term ((-19424 : Rat) / 25) [(0, 1), (1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-10264 : Rat) / 25) [(0, 1), (1, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-54336 : Rat) / 25) [(0, 1), (1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-10616 : Rat) / 5) [(0, 1), (1, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-50004 : Rat) / 25) [(0, 1), (1, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(0, 1), (1, 1), (10, 2), (15, 1), (16, 1)],
  term ((4152 : Rat) / 25) [(0, 1), (1, 1), (11, 1), (15, 2), (16, 1)],
  term ((-65112 : Rat) / 25) [(0, 1), (1, 1), (11, 2), (15, 1), (16, 1)],
  term ((9712 : Rat) / 25) [(0, 1), (1, 2), (7, 1), (15, 1), (16, 1)],
  term ((27168 : Rat) / 25) [(0, 1), (1, 2), (9, 1), (15, 1), (16, 1)],
  term ((76588 : Rat) / 25) [(0, 1), (1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-2076 : Rat) / 25) [(0, 1), (1, 2), (15, 2), (16, 1)],
  term ((-22016 : Rat) / 25) [(0, 1), (1, 3), (15, 1), (16, 1)],
  term ((-14072 : Rat) / 25) [(0, 1), (3, 1), (4, 1), (10, 1), (15, 1), (16, 1)],
  term ((8304 : Rat) / 25) [(0, 1), (3, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(0, 1), (3, 1), (7, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(0, 1), (3, 1), (7, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(0, 1), (3, 1), (7, 1), (10, 1), (16, 1)],
  term ((7872 : Rat) / 25) [(0, 1), (3, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(0, 1), (3, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(0, 1), (3, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((712 : Rat) / 5) [(0, 1), (3, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9856 : Rat) / 25) [(0, 1), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((10512 : Rat) / 25) [(0, 1), (3, 1), (10, 2), (15, 1), (16, 1)],
  term ((5376 : Rat) / 25) [(0, 1), (4, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-5376 : Rat) / 25) [(0, 1), (4, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((5272 : Rat) / 25) [(0, 1), (4, 1), (10, 1), (15, 2), (16, 1)],
  term ((3584 : Rat) / 25) [(0, 1), (5, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((28144 : Rat) / 25) [(0, 1), (5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term (-916 : Rat) [(0, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((4832 : Rat) / 25) [(0, 1), (6, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((12256 : Rat) / 25) [(0, 1), (6, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-24976 : Rat) / 25) [(0, 1), (6, 1), (10, 1), (15, 2), (16, 1)],
  term (2 : Rat) [(0, 1), (6, 1), (10, 1), (16, 1)],
  term ((768 : Rat) / 5) [(0, 1), (7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((24976 : Rat) / 25) [(0, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term (-72 : Rat) [(0, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(0, 1), (7, 1), (10, 2), (15, 1), (16, 1)],
  term ((-5376 : Rat) / 25) [(0, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((10144 : Rat) / 25) [(0, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2984 : Rat) / 25) [(0, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-7168 : Rat) / 25) [(0, 1), (9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((11328 : Rat) / 5) [(0, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8624 : Rat) / 25) [(0, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((5376 : Rat) / 25) [(0, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-7168 : Rat) / 25) [(0, 1), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((9448 : Rat) / 5) [(0, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((16308 : Rat) / 25) [(0, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-13704 : Rat) / 25) [(0, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((5672 : Rat) / 25) [(0, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term (20 : Rat) [(0, 1), (10, 1), (14, 1), (16, 1)],
  term (-16 : Rat) [(0, 1), (10, 1), (14, 2), (16, 1)],
  term ((66244 : Rat) / 25) [(0, 1), (10, 1), (15, 2), (16, 1)],
  term (-4 : Rat) [(0, 1), (10, 1), (16, 1)],
  term ((712 : Rat) / 5) [(0, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-28144 : Rat) / 25) [(0, 1), (10, 2), (15, 2), (16, 1)],
  term ((-11436 : Rat) / 25) [(0, 2), (1, 1), (4, 1), (15, 1), (16, 1)],
  term ((5132 : Rat) / 25) [(0, 2), (1, 1), (8, 1), (15, 1), (16, 1)],
  term ((44928 : Rat) / 25) [(0, 2), (1, 1), (10, 1), (15, 1), (16, 1)],
  term ((5308 : Rat) / 5) [(0, 2), (1, 1), (14, 1), (15, 1), (16, 1)],
  term ((25002 : Rat) / 25) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term ((7036 : Rat) / 25) [(0, 2), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((-4152 : Rat) / 25) [(0, 2), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(0, 2), (3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(0, 2), (3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(0, 2), (3, 1), (7, 1), (16, 1)],
  term ((-3936 : Rat) / 25) [(0, 2), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(0, 2), (3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(0, 2), (3, 1), (9, 2), (15, 1), (16, 1)],
  term ((-5256 : Rat) / 25) [(0, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-356 : Rat) / 5) [(0, 2), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((4928 : Rat) / 25) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((-2688 : Rat) / 25) [(0, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((2688 : Rat) / 25) [(0, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-2636 : Rat) / 25) [(0, 2), (4, 1), (15, 2), (16, 1)],
  term ((-1792 : Rat) / 25) [(0, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-14072 : Rat) / 25) [(0, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term (458 : Rat) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((-2416 : Rat) / 25) [(0, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-6128 : Rat) / 25) [(0, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((12488 : Rat) / 25) [(0, 2), (6, 1), (15, 2), (16, 1)],
  term (-1 : Rat) [(0, 2), (6, 1), (16, 1)],
  term ((-384 : Rat) / 5) [(0, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-17632 : Rat) / 25) [(0, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-12488 : Rat) / 25) [(0, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term (36 : Rat) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((2688 : Rat) / 25) [(0, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-5072 : Rat) / 25) [(0, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((1492 : Rat) / 25) [(0, 2), (8, 1), (15, 2), (16, 1)],
  term ((-57024 : Rat) / 25) [(0, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(0, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-5664 : Rat) / 5) [(0, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((4312 : Rat) / 25) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((-65112 : Rat) / 25) [(0, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-356 : Rat) / 5) [(0, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((18224 : Rat) / 25) [(0, 2), (10, 1), (15, 2), (16, 1)],
  term ((3584 : Rat) / 25) [(0, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-4724 : Rat) / 5) [(0, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8154 : Rat) / 25) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((6852 : Rat) / 25) [(0, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2836 : Rat) / 25) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term (-10 : Rat) [(0, 2), (14, 1), (16, 1)],
  term (8 : Rat) [(0, 2), (14, 2), (16, 1)],
  term ((-33122 : Rat) / 25) [(0, 2), (15, 2), (16, 1)],
  term (2 : Rat) [(0, 2), (16, 1)],
  term ((-22016 : Rat) / 25) [(0, 3), (1, 1), (15, 1), (16, 1)],
  term ((9712 : Rat) / 25) [(0, 3), (7, 1), (15, 1), (16, 1)],
  term ((27168 : Rat) / 25) [(0, 3), (9, 1), (15, 1), (16, 1)],
  term ((32556 : Rat) / 25) [(0, 3), (11, 1), (15, 1), (16, 1)],
  term ((-2076 : Rat) / 25) [(0, 3), (15, 2), (16, 1)],
  term ((-14072 : Rat) / 25) [(1, 1), (3, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((8304 : Rat) / 25) [(1, 1), (3, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(1, 1), (3, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(1, 1), (3, 1), (7, 1), (11, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(1, 1), (3, 1), (7, 1), (11, 2), (15, 1), (16, 1)],
  term ((7872 : Rat) / 25) [(1, 1), (3, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(1, 1), (3, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(1, 1), (3, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((10512 : Rat) / 25) [(1, 1), (3, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((712 : Rat) / 5) [(1, 1), (3, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9856 : Rat) / 25) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((5376 : Rat) / 25) [(1, 1), (4, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-5376 : Rat) / 25) [(1, 1), (4, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((5272 : Rat) / 25) [(1, 1), (4, 1), (11, 1), (15, 2), (16, 1)],
  term ((3584 : Rat) / 25) [(1, 1), (5, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((28144 : Rat) / 25) [(1, 1), (5, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term (-916 : Rat) [(1, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((4832 : Rat) / 25) [(1, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-24976 : Rat) / 25) [(1, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term (2 : Rat) [(1, 1), (6, 1), (11, 1), (16, 1)],
  term ((12256 : Rat) / 25) [(1, 1), (6, 1), (11, 2), (15, 1), (16, 1)],
  term ((768 : Rat) / 5) [(1, 1), (7, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(1, 1), (7, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((24976 : Rat) / 25) [(1, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term (-72 : Rat) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((10144 : Rat) / 25) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2984 : Rat) / 25) [(1, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-5376 : Rat) / 25) [(1, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((5376 : Rat) / 25) [(1, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-7168 : Rat) / 25) [(1, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((11328 : Rat) / 5) [(1, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8624 : Rat) / 25) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((712 : Rat) / 5) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-28144 : Rat) / 25) [(1, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-13704 : Rat) / 25) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((5672 : Rat) / 25) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term (20 : Rat) [(1, 1), (11, 1), (14, 1), (16, 1)],
  term (-16 : Rat) [(1, 1), (11, 1), (14, 2), (16, 1)],
  term ((66244 : Rat) / 25) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term (-4 : Rat) [(1, 1), (11, 1), (16, 1)],
  term ((-7168 : Rat) / 25) [(1, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((9448 : Rat) / 5) [(1, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((16308 : Rat) / 25) [(1, 1), (11, 2), (15, 1), (16, 1)],
  term ((7036 : Rat) / 25) [(1, 2), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((-4152 : Rat) / 25) [(1, 2), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(1, 2), (3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(1, 2), (3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(1, 2), (3, 1), (7, 1), (16, 1)],
  term ((-3936 : Rat) / 25) [(1, 2), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(1, 2), (3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(1, 2), (3, 1), (9, 2), (15, 1), (16, 1)],
  term ((-5256 : Rat) / 25) [(1, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-356 : Rat) / 5) [(1, 2), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((4928 : Rat) / 25) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((-2688 : Rat) / 25) [(1, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((2688 : Rat) / 25) [(1, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((22872 : Rat) / 25) [(1, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2636 : Rat) / 25) [(1, 2), (4, 1), (15, 2), (16, 1)],
  term ((-1792 : Rat) / 25) [(1, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-14072 : Rat) / 25) [(1, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term (458 : Rat) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((-2416 : Rat) / 25) [(1, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-6128 : Rat) / 25) [(1, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((12488 : Rat) / 25) [(1, 2), (6, 1), (15, 2), (16, 1)],
  term (-1 : Rat) [(1, 2), (6, 1), (16, 1)],
  term ((-384 : Rat) / 5) [(1, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(1, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-12488 : Rat) / 25) [(1, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term (36 : Rat) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((-7576 : Rat) / 25) [(1, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-5072 : Rat) / 25) [(1, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((1492 : Rat) / 25) [(1, 2), (8, 1), (15, 2), (16, 1)],
  term ((-2688 : Rat) / 25) [(1, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(1, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-5664 : Rat) / 5) [(1, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((4312 : Rat) / 25) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(1, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-356 : Rat) / 5) [(1, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((14072 : Rat) / 25) [(1, 2), (10, 1), (15, 2), (16, 1)],
  term ((3584 : Rat) / 25) [(1, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term (-3068 : Rat) [(1, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-58158 : Rat) / 25) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((6852 : Rat) / 25) [(1, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2836 : Rat) / 25) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term (-10 : Rat) [(1, 2), (14, 1), (16, 1)],
  term (8 : Rat) [(1, 2), (14, 2), (16, 1)],
  term ((-33122 : Rat) / 25) [(1, 2), (15, 2), (16, 1)],
  term (2 : Rat) [(1, 2), (16, 1)],
  term ((-11436 : Rat) / 25) [(1, 3), (4, 1), (15, 1), (16, 1)],
  term ((5132 : Rat) / 25) [(1, 3), (8, 1), (15, 1), (16, 1)],
  term ((896 : Rat) / 25) [(1, 3), (10, 1), (15, 1), (16, 1)],
  term ((5308 : Rat) / 5) [(1, 3), (14, 1), (15, 1), (16, 1)],
  term ((25002 : Rat) / 25) [(1, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 22, terms 0 through 52. -/
theorem rs_R010_ueqv_R010YY_block_22_0000_0052_valid :
    checkProductSumEq rs_R010_ueqv_R010YY_partials_22_0000_0052
      rs_R010_ueqv_R010YY_block_22_0000_0052 = true := by
  native_decide

end R010UeqvR010YYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
