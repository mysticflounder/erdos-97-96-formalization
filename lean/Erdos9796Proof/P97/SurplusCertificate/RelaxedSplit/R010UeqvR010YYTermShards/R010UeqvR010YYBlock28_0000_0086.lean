/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010YY, term block 28:0-86

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010YYTermShards

/-- Generator polynomial 28 for relaxed split surplus certificate `R010:u=v:R010YY`. -/
def rs_R010_ueqv_R010YY_generator_28_0000_0086 : Poly :=
[
  term (-2 : Rat) [(0, 1), (14, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (15, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(2, 1), (14, 1)],
  term (-1 : Rat) [(2, 2)],
  term (2 : Rat) [(3, 1), (15, 1)],
  term (-1 : Rat) [(3, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YY_coefficient_28_0000 : Poly :=
[
  term ((-22016 : Rat) / 25) [(0, 1), (1, 1), (15, 1), (16, 1)]
]

/-- Partial product 0 for generator 28. -/
def rs_R010_ueqv_R010YY_partial_28_0000 : Poly :=
[
  term ((-44032 : Rat) / 25) [(0, 1), (1, 1), (2, 1), (14, 1), (15, 1), (16, 1)],
  term ((22016 : Rat) / 25) [(0, 1), (1, 1), (2, 2), (15, 1), (16, 1)],
  term ((-44032 : Rat) / 25) [(0, 1), (1, 1), (3, 1), (15, 2), (16, 1)],
  term ((22016 : Rat) / 25) [(0, 1), (1, 1), (3, 2), (15, 1), (16, 1)],
  term ((44032 : Rat) / 25) [(0, 1), (1, 2), (15, 2), (16, 1)],
  term ((-22016 : Rat) / 25) [(0, 1), (1, 3), (15, 1), (16, 1)],
  term ((44032 : Rat) / 25) [(0, 2), (1, 1), (14, 1), (15, 1), (16, 1)],
  term ((-22016 : Rat) / 25) [(0, 3), (1, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 28. -/
theorem rs_R010_ueqv_R010YY_partial_28_0000_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_28_0000
        rs_R010_ueqv_R010YY_generator_28_0000_0086 =
      rs_R010_ueqv_R010YY_partial_28_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YY_coefficient_28_0001 : Poly :=
[
  term ((9712 : Rat) / 25) [(0, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 1 for generator 28. -/
def rs_R010_ueqv_R010YY_partial_28_0001 : Poly :=
[
  term ((-19424 : Rat) / 25) [(0, 1), (1, 1), (7, 1), (15, 2), (16, 1)],
  term ((9712 : Rat) / 25) [(0, 1), (1, 2), (7, 1), (15, 1), (16, 1)],
  term ((19424 : Rat) / 25) [(0, 1), (2, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9712 : Rat) / 25) [(0, 1), (2, 2), (7, 1), (15, 1), (16, 1)],
  term ((19424 : Rat) / 25) [(0, 1), (3, 1), (7, 1), (15, 2), (16, 1)],
  term ((-9712 : Rat) / 25) [(0, 1), (3, 2), (7, 1), (15, 1), (16, 1)],
  term ((-19424 : Rat) / 25) [(0, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((9712 : Rat) / 25) [(0, 3), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 28. -/
theorem rs_R010_ueqv_R010YY_partial_28_0001_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_28_0001
        rs_R010_ueqv_R010YY_generator_28_0000_0086 =
      rs_R010_ueqv_R010YY_partial_28_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YY_coefficient_28_0002 : Poly :=
[
  term ((-28064 : Rat) / 25) [(0, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 2 for generator 28. -/
def rs_R010_ueqv_R010YY_partial_28_0002 : Poly :=
[
  term ((56128 : Rat) / 25) [(0, 1), (1, 1), (9, 1), (15, 2), (16, 1)],
  term ((-28064 : Rat) / 25) [(0, 1), (1, 2), (9, 1), (15, 1), (16, 1)],
  term ((-56128 : Rat) / 25) [(0, 1), (2, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((28064 : Rat) / 25) [(0, 1), (2, 2), (9, 1), (15, 1), (16, 1)],
  term ((-56128 : Rat) / 25) [(0, 1), (3, 1), (9, 1), (15, 2), (16, 1)],
  term ((28064 : Rat) / 25) [(0, 1), (3, 2), (9, 1), (15, 1), (16, 1)],
  term ((56128 : Rat) / 25) [(0, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-28064 : Rat) / 25) [(0, 3), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 28. -/
theorem rs_R010_ueqv_R010YY_partial_28_0002_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_28_0002
        rs_R010_ueqv_R010YY_generator_28_0000_0086 =
      rs_R010_ueqv_R010YY_partial_28_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YY_coefficient_28_0003 : Poly :=
[
  term ((2116 : Rat) / 5) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 3 for generator 28. -/
def rs_R010_ueqv_R010YY_partial_28_0003 : Poly :=
[
  term ((-4232 : Rat) / 5) [(0, 1), (1, 1), (11, 1), (15, 2), (16, 1)],
  term ((2116 : Rat) / 5) [(0, 1), (1, 2), (11, 1), (15, 1), (16, 1)],
  term ((4232 : Rat) / 5) [(0, 1), (2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2116 : Rat) / 5) [(0, 1), (2, 2), (11, 1), (15, 1), (16, 1)],
  term ((4232 : Rat) / 5) [(0, 1), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((-2116 : Rat) / 5) [(0, 1), (3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-4232 : Rat) / 5) [(0, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((2116 : Rat) / 5) [(0, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 28. -/
theorem rs_R010_ueqv_R010YY_partial_28_0003_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_28_0003
        rs_R010_ueqv_R010YY_generator_28_0000_0086 =
      rs_R010_ueqv_R010YY_partial_28_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YY_coefficient_28_0004 : Poly :=
[
  term ((-11436 : Rat) / 25) [(1, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 4 for generator 28. -/
def rs_R010_ueqv_R010YY_partial_28_0004 : Poly :=
[
  term ((22872 : Rat) / 25) [(0, 1), (1, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11436 : Rat) / 25) [(0, 2), (1, 1), (4, 1), (15, 1), (16, 1)],
  term ((-22872 : Rat) / 25) [(1, 1), (2, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((11436 : Rat) / 25) [(1, 1), (2, 2), (4, 1), (15, 1), (16, 1)],
  term ((-22872 : Rat) / 25) [(1, 1), (3, 1), (4, 1), (15, 2), (16, 1)],
  term ((11436 : Rat) / 25) [(1, 1), (3, 2), (4, 1), (15, 1), (16, 1)],
  term ((22872 : Rat) / 25) [(1, 2), (4, 1), (15, 2), (16, 1)],
  term ((-11436 : Rat) / 25) [(1, 3), (4, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 28. -/
theorem rs_R010_ueqv_R010YY_partial_28_0004_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_28_0004
        rs_R010_ueqv_R010YY_generator_28_0000_0086 =
      rs_R010_ueqv_R010YY_partial_28_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YY_coefficient_28_0005 : Poly :=
[
  term ((4208 : Rat) / 25) [(1, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 5 for generator 28. -/
def rs_R010_ueqv_R010YY_partial_28_0005 : Poly :=
[
  term ((-8416 : Rat) / 25) [(0, 1), (1, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((4208 : Rat) / 25) [(0, 2), (1, 1), (6, 1), (15, 1), (16, 1)],
  term ((8416 : Rat) / 25) [(1, 1), (2, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4208 : Rat) / 25) [(1, 1), (2, 2), (6, 1), (15, 1), (16, 1)],
  term ((8416 : Rat) / 25) [(1, 1), (3, 1), (6, 1), (15, 2), (16, 1)],
  term ((-4208 : Rat) / 25) [(1, 1), (3, 2), (6, 1), (15, 1), (16, 1)],
  term ((-8416 : Rat) / 25) [(1, 2), (6, 1), (15, 2), (16, 1)],
  term ((4208 : Rat) / 25) [(1, 3), (6, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 28. -/
theorem rs_R010_ueqv_R010YY_partial_28_0005_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_28_0005
        rs_R010_ueqv_R010YY_generator_28_0000_0086 =
      rs_R010_ueqv_R010YY_partial_28_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YY_coefficient_28_0006 : Poly :=
[
  term ((-8744 : Rat) / 25) [(1, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 6 for generator 28. -/
def rs_R010_ueqv_R010YY_partial_28_0006 : Poly :=
[
  term ((17488 : Rat) / 25) [(0, 1), (1, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8744 : Rat) / 25) [(0, 2), (1, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-17488 : Rat) / 25) [(1, 1), (2, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((8744 : Rat) / 25) [(1, 1), (2, 2), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-17488 : Rat) / 25) [(1, 1), (3, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((8744 : Rat) / 25) [(1, 1), (3, 2), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((17488 : Rat) / 25) [(1, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-8744 : Rat) / 25) [(1, 3), (7, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 28. -/
theorem rs_R010_ueqv_R010YY_partial_28_0006_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_28_0006
        rs_R010_ueqv_R010YY_generator_28_0000_0086 =
      rs_R010_ueqv_R010YY_partial_28_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YY_coefficient_28_0007 : Poly :=
[
  term ((103864 : Rat) / 75) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 7 for generator 28. -/
def rs_R010_ueqv_R010YY_partial_28_0007 : Poly :=
[
  term ((-207728 : Rat) / 75) [(0, 1), (1, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((103864 : Rat) / 75) [(0, 2), (1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((207728 : Rat) / 75) [(1, 1), (2, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-103864 : Rat) / 75) [(1, 1), (2, 2), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((207728 : Rat) / 75) [(1, 1), (3, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-103864 : Rat) / 75) [(1, 1), (3, 2), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-207728 : Rat) / 75) [(1, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((103864 : Rat) / 75) [(1, 3), (7, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 28. -/
theorem rs_R010_ueqv_R010YY_partial_28_0007_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_28_0007
        rs_R010_ueqv_R010YY_generator_28_0000_0086 =
      rs_R010_ueqv_R010YY_partial_28_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YY_coefficient_28_0008 : Poly :=
[
  term ((-5752 : Rat) / 5) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 8 for generator 28. -/
def rs_R010_ueqv_R010YY_partial_28_0008 : Poly :=
[
  term ((11504 : Rat) / 5) [(0, 1), (1, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5752 : Rat) / 5) [(0, 2), (1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-11504 : Rat) / 5) [(1, 1), (2, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((5752 : Rat) / 5) [(1, 1), (2, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-11504 : Rat) / 5) [(1, 1), (3, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((5752 : Rat) / 5) [(1, 1), (3, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((11504 : Rat) / 5) [(1, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-5752 : Rat) / 5) [(1, 3), (7, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 28. -/
theorem rs_R010_ueqv_R010YY_partial_28_0008_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_28_0008
        rs_R010_ueqv_R010YY_generator_28_0000_0086 =
      rs_R010_ueqv_R010YY_partial_28_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YY_coefficient_28_0009 : Poly :=
[
  term ((-8 : Rat) / 3) [(1, 1), (7, 1), (14, 1), (16, 1)]
]

/-- Partial product 9 for generator 28. -/
def rs_R010_ueqv_R010YY_partial_28_0009 : Poly :=
[
  term ((16 : Rat) / 3) [(0, 1), (1, 1), (7, 1), (14, 2), (16, 1)],
  term ((-8 : Rat) / 3) [(0, 2), (1, 1), (7, 1), (14, 1), (16, 1)],
  term ((-16 : Rat) / 3) [(1, 1), (2, 1), (7, 1), (14, 2), (16, 1)],
  term ((8 : Rat) / 3) [(1, 1), (2, 2), (7, 1), (14, 1), (16, 1)],
  term ((-16 : Rat) / 3) [(1, 1), (3, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 3) [(1, 1), (3, 2), (7, 1), (14, 1), (16, 1)],
  term ((16 : Rat) / 3) [(1, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8 : Rat) / 3) [(1, 3), (7, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 28. -/
theorem rs_R010_ueqv_R010YY_partial_28_0009_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_28_0009
        rs_R010_ueqv_R010YY_generator_28_0000_0086 =
      rs_R010_ueqv_R010YY_partial_28_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YY_coefficient_28_0010 : Poly :=
[
  term ((-29072 : Rat) / 75) [(1, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 10 for generator 28. -/
def rs_R010_ueqv_R010YY_partial_28_0010 : Poly :=
[
  term ((58144 : Rat) / 75) [(0, 1), (1, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((-29072 : Rat) / 75) [(0, 2), (1, 1), (7, 1), (15, 2), (16, 1)],
  term ((-58144 : Rat) / 75) [(1, 1), (2, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((29072 : Rat) / 75) [(1, 1), (2, 2), (7, 1), (15, 2), (16, 1)],
  term ((-58144 : Rat) / 75) [(1, 1), (3, 1), (7, 1), (15, 3), (16, 1)],
  term ((29072 : Rat) / 75) [(1, 1), (3, 2), (7, 1), (15, 2), (16, 1)],
  term ((58144 : Rat) / 75) [(1, 2), (7, 1), (15, 3), (16, 1)],
  term ((-29072 : Rat) / 75) [(1, 3), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 28. -/
theorem rs_R010_ueqv_R010YY_partial_28_0010_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_28_0010
        rs_R010_ueqv_R010YY_generator_28_0000_0086 =
      rs_R010_ueqv_R010YY_partial_28_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YY_coefficient_28_0011 : Poly :=
[
  term ((-16 : Rat) / 3) [(1, 1), (7, 1), (16, 1)]
]

/-- Partial product 11 for generator 28. -/
def rs_R010_ueqv_R010YY_partial_28_0011 : Poly :=
[
  term ((32 : Rat) / 3) [(0, 1), (1, 1), (7, 1), (14, 1), (16, 1)],
  term ((-16 : Rat) / 3) [(0, 2), (1, 1), (7, 1), (16, 1)],
  term ((-32 : Rat) / 3) [(1, 1), (2, 1), (7, 1), (14, 1), (16, 1)],
  term ((16 : Rat) / 3) [(1, 1), (2, 2), (7, 1), (16, 1)],
  term ((-32 : Rat) / 3) [(1, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 3) [(1, 1), (3, 2), (7, 1), (16, 1)],
  term ((32 : Rat) / 3) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 3) [(1, 3), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 28. -/
theorem rs_R010_ueqv_R010YY_partial_28_0011_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_28_0011
        rs_R010_ueqv_R010YY_generator_28_0000_0086 =
      rs_R010_ueqv_R010YY_partial_28_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YY_coefficient_28_0012 : Poly :=
[
  term ((21336 : Rat) / 25) [(1, 1), (7, 2), (15, 1), (16, 1)]
]

/-- Partial product 12 for generator 28. -/
def rs_R010_ueqv_R010YY_partial_28_0012 : Poly :=
[
  term ((-42672 : Rat) / 25) [(0, 1), (1, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((21336 : Rat) / 25) [(0, 2), (1, 1), (7, 2), (15, 1), (16, 1)],
  term ((42672 : Rat) / 25) [(1, 1), (2, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((-21336 : Rat) / 25) [(1, 1), (2, 2), (7, 2), (15, 1), (16, 1)],
  term ((42672 : Rat) / 25) [(1, 1), (3, 1), (7, 2), (15, 2), (16, 1)],
  term ((-21336 : Rat) / 25) [(1, 1), (3, 2), (7, 2), (15, 1), (16, 1)],
  term ((-42672 : Rat) / 25) [(1, 2), (7, 2), (15, 2), (16, 1)],
  term ((21336 : Rat) / 25) [(1, 3), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 28. -/
theorem rs_R010_ueqv_R010YY_partial_28_0012_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_28_0012
        rs_R010_ueqv_R010YY_generator_28_0000_0086 =
      rs_R010_ueqv_R010YY_partial_28_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YY_coefficient_28_0013 : Poly :=
[
  term ((33196 : Rat) / 25) [(1, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 13 for generator 28. -/
def rs_R010_ueqv_R010YY_partial_28_0013 : Poly :=
[
  term ((-66392 : Rat) / 25) [(0, 1), (1, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((33196 : Rat) / 25) [(0, 2), (1, 1), (8, 1), (15, 1), (16, 1)],
  term ((66392 : Rat) / 25) [(1, 1), (2, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-33196 : Rat) / 25) [(1, 1), (2, 2), (8, 1), (15, 1), (16, 1)],
  term ((66392 : Rat) / 25) [(1, 1), (3, 1), (8, 1), (15, 2), (16, 1)],
  term ((-33196 : Rat) / 25) [(1, 1), (3, 2), (8, 1), (15, 1), (16, 1)],
  term ((-66392 : Rat) / 25) [(1, 2), (8, 1), (15, 2), (16, 1)],
  term ((33196 : Rat) / 25) [(1, 3), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 28. -/
theorem rs_R010_ueqv_R010YY_partial_28_0013_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_28_0013
        rs_R010_ueqv_R010YY_generator_28_0000_0086 =
      rs_R010_ueqv_R010YY_partial_28_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YY_coefficient_28_0014 : Poly :=
[
  term ((54336 : Rat) / 25) [(1, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 14 for generator 28. -/
def rs_R010_ueqv_R010YY_partial_28_0014 : Poly :=
[
  term ((-108672 : Rat) / 25) [(0, 1), (1, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((54336 : Rat) / 25) [(0, 2), (1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((108672 : Rat) / 25) [(1, 1), (2, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-54336 : Rat) / 25) [(1, 1), (2, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((108672 : Rat) / 25) [(1, 1), (3, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-54336 : Rat) / 25) [(1, 1), (3, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-108672 : Rat) / 25) [(1, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((54336 : Rat) / 25) [(1, 3), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 28. -/
theorem rs_R010_ueqv_R010YY_partial_28_0014_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_28_0014
        rs_R010_ueqv_R010YY_generator_28_0000_0086 =
      rs_R010_ueqv_R010YY_partial_28_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YY_coefficient_28_0015 : Poly :=
[
  term ((-7616 : Rat) / 25) [(1, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 15 for generator 28. -/
def rs_R010_ueqv_R010YY_partial_28_0015 : Poly :=
[
  term ((15232 : Rat) / 25) [(0, 1), (1, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7616 : Rat) / 25) [(0, 2), (1, 1), (10, 1), (15, 1), (16, 1)],
  term ((-15232 : Rat) / 25) [(1, 1), (2, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((7616 : Rat) / 25) [(1, 1), (2, 2), (10, 1), (15, 1), (16, 1)],
  term ((-15232 : Rat) / 25) [(1, 1), (3, 1), (10, 1), (15, 2), (16, 1)],
  term ((7616 : Rat) / 25) [(1, 1), (3, 2), (10, 1), (15, 1), (16, 1)],
  term ((15232 : Rat) / 25) [(1, 2), (10, 1), (15, 2), (16, 1)],
  term ((-7616 : Rat) / 25) [(1, 3), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 28. -/
theorem rs_R010_ueqv_R010YY_partial_28_0015_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_28_0015
        rs_R010_ueqv_R010YY_generator_28_0000_0086 =
      rs_R010_ueqv_R010YY_partial_28_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YY_coefficient_28_0016 : Poly :=
[
  term ((46296 : Rat) / 25) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 16 for generator 28. -/
def rs_R010_ueqv_R010YY_partial_28_0016 : Poly :=
[
  term ((-92592 : Rat) / 25) [(0, 1), (1, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((46296 : Rat) / 25) [(0, 2), (1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((92592 : Rat) / 25) [(1, 1), (2, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-46296 : Rat) / 25) [(1, 1), (2, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((92592 : Rat) / 25) [(1, 1), (3, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-46296 : Rat) / 25) [(1, 1), (3, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-92592 : Rat) / 25) [(1, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((46296 : Rat) / 25) [(1, 3), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 28. -/
theorem rs_R010_ueqv_R010YY_partial_28_0016_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_28_0016
        rs_R010_ueqv_R010YY_generator_28_0000_0086 =
      rs_R010_ueqv_R010YY_partial_28_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YY_coefficient_28_0017 : Poly :=
[
  term ((-85496 : Rat) / 25) [(1, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 17 for generator 28. -/
def rs_R010_ueqv_R010YY_partial_28_0017 : Poly :=
[
  term ((170992 : Rat) / 25) [(0, 1), (1, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-85496 : Rat) / 25) [(0, 2), (1, 1), (13, 1), (15, 2), (16, 1)],
  term ((-170992 : Rat) / 25) [(1, 1), (2, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((85496 : Rat) / 25) [(1, 1), (2, 2), (13, 1), (15, 2), (16, 1)],
  term ((-170992 : Rat) / 25) [(1, 1), (3, 1), (13, 1), (15, 3), (16, 1)],
  term ((85496 : Rat) / 25) [(1, 1), (3, 2), (13, 1), (15, 2), (16, 1)],
  term ((170992 : Rat) / 25) [(1, 2), (13, 1), (15, 3), (16, 1)],
  term ((-85496 : Rat) / 25) [(1, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 28. -/
theorem rs_R010_ueqv_R010YY_partial_28_0017_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_28_0017
        rs_R010_ueqv_R010YY_generator_28_0000_0086 =
      rs_R010_ueqv_R010YY_partial_28_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YY_coefficient_28_0018 : Poly :=
[
  term ((14944 : Rat) / 25) [(1, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 18 for generator 28. -/
def rs_R010_ueqv_R010YY_partial_28_0018 : Poly :=
[
  term ((-29888 : Rat) / 25) [(0, 1), (1, 1), (14, 2), (15, 1), (16, 1)],
  term ((14944 : Rat) / 25) [(0, 2), (1, 1), (14, 1), (15, 1), (16, 1)],
  term ((29888 : Rat) / 25) [(1, 1), (2, 1), (14, 2), (15, 1), (16, 1)],
  term ((-14944 : Rat) / 25) [(1, 1), (2, 2), (14, 1), (15, 1), (16, 1)],
  term ((29888 : Rat) / 25) [(1, 1), (3, 1), (14, 1), (15, 2), (16, 1)],
  term ((-14944 : Rat) / 25) [(1, 1), (3, 2), (14, 1), (15, 1), (16, 1)],
  term ((-29888 : Rat) / 25) [(1, 2), (14, 1), (15, 2), (16, 1)],
  term ((14944 : Rat) / 25) [(1, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 28. -/
theorem rs_R010_ueqv_R010YY_partial_28_0018_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_28_0018
        rs_R010_ueqv_R010YY_generator_28_0000_0086 =
      rs_R010_ueqv_R010YY_partial_28_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YY_coefficient_28_0019 : Poly :=
[
  term ((-11518 : Rat) / 25) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 19 for generator 28. -/
def rs_R010_ueqv_R010YY_partial_28_0019 : Poly :=
[
  term ((23036 : Rat) / 25) [(0, 1), (1, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11518 : Rat) / 25) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term ((-23036 : Rat) / 25) [(1, 1), (2, 1), (14, 1), (15, 1), (16, 1)],
  term ((11518 : Rat) / 25) [(1, 1), (2, 2), (15, 1), (16, 1)],
  term ((-23036 : Rat) / 25) [(1, 1), (3, 1), (15, 2), (16, 1)],
  term ((11518 : Rat) / 25) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((23036 : Rat) / 25) [(1, 2), (15, 2), (16, 1)],
  term ((-11518 : Rat) / 25) [(1, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 28. -/
theorem rs_R010_ueqv_R010YY_partial_28_0019_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_28_0019
        rs_R010_ueqv_R010YY_generator_28_0000_0086 =
      rs_R010_ueqv_R010YY_partial_28_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YY_coefficient_28_0020 : Poly :=
[
  term ((-5752 : Rat) / 15) [(1, 2), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 20 for generator 28. -/
def rs_R010_ueqv_R010YY_partial_28_0020 : Poly :=
[
  term ((11504 : Rat) / 15) [(0, 1), (1, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5752 : Rat) / 15) [(0, 2), (1, 2), (7, 1), (15, 1), (16, 1)],
  term ((-11504 : Rat) / 15) [(1, 2), (2, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((5752 : Rat) / 15) [(1, 2), (2, 2), (7, 1), (15, 1), (16, 1)],
  term ((-11504 : Rat) / 15) [(1, 2), (3, 1), (7, 1), (15, 2), (16, 1)],
  term ((5752 : Rat) / 15) [(1, 2), (3, 2), (7, 1), (15, 1), (16, 1)],
  term ((11504 : Rat) / 15) [(1, 3), (7, 1), (15, 2), (16, 1)],
  term ((-5752 : Rat) / 15) [(1, 4), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 28. -/
theorem rs_R010_ueqv_R010YY_partial_28_0020_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_28_0020
        rs_R010_ueqv_R010YY_generator_28_0000_0086 =
      rs_R010_ueqv_R010YY_partial_28_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YY_coefficient_28_0021 : Poly :=
[
  term ((7036 : Rat) / 25) [(3, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 21 for generator 28. -/
def rs_R010_ueqv_R010YY_partial_28_0021 : Poly :=
[
  term ((-14072 : Rat) / 25) [(0, 1), (3, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((7036 : Rat) / 25) [(0, 2), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((-14072 : Rat) / 25) [(1, 1), (3, 1), (4, 1), (15, 2), (16, 1)],
  term ((7036 : Rat) / 25) [(1, 2), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((14072 : Rat) / 25) [(2, 1), (3, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7036 : Rat) / 25) [(2, 2), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((14072 : Rat) / 25) [(3, 2), (4, 1), (15, 2), (16, 1)],
  term ((-7036 : Rat) / 25) [(3, 3), (4, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 28. -/
theorem rs_R010_ueqv_R010YY_partial_28_0021_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_28_0021
        rs_R010_ueqv_R010YY_generator_28_0000_0086 =
      rs_R010_ueqv_R010YY_partial_28_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YY_coefficient_28_0022 : Poly :=
[
  term ((-896 : Rat) / 25) [(3, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 22 for generator 28. -/
def rs_R010_ueqv_R010YY_partial_28_0022 : Poly :=
[
  term ((1792 : Rat) / 25) [(0, 1), (3, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-896 : Rat) / 25) [(0, 2), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(1, 1), (3, 1), (6, 1), (15, 2), (16, 1)],
  term ((-896 : Rat) / 25) [(1, 2), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(2, 1), (3, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((896 : Rat) / 25) [(2, 2), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(3, 2), (6, 1), (15, 2), (16, 1)],
  term ((896 : Rat) / 25) [(3, 3), (6, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 28. -/
theorem rs_R010_ueqv_R010YY_partial_28_0022_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_28_0022
        rs_R010_ueqv_R010YY_generator_28_0000_0086 =
      rs_R010_ueqv_R010YY_partial_28_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YY_coefficient_28_0023 : Poly :=
[
  term ((-1792 : Rat) / 25) [(3, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 23 for generator 28. -/
def rs_R010_ueqv_R010YY_partial_28_0023 : Poly :=
[
  term ((3584 : Rat) / 25) [(0, 1), (3, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(0, 2), (3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(1, 1), (3, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-1792 : Rat) / 25) [(1, 2), (3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(2, 1), (3, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(2, 2), (3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(3, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((1792 : Rat) / 25) [(3, 3), (7, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 28. -/
theorem rs_R010_ueqv_R010YY_partial_28_0023_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_28_0023
        rs_R010_ueqv_R010YY_generator_28_0000_0086 =
      rs_R010_ueqv_R010YY_partial_28_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YY_coefficient_28_0024 : Poly :=
[
  term ((-1792 : Rat) / 25) [(3, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 24 for generator 28. -/
def rs_R010_ueqv_R010YY_partial_28_0024 : Poly :=
[
  term ((3584 : Rat) / 25) [(0, 1), (3, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(0, 2), (3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(1, 1), (3, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1792 : Rat) / 25) [(1, 2), (3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(2, 1), (3, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(2, 2), (3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(3, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((1792 : Rat) / 25) [(3, 3), (7, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 28. -/
theorem rs_R010_ueqv_R010YY_partial_28_0024_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_28_0024
        rs_R010_ueqv_R010YY_generator_28_0000_0086 =
      rs_R010_ueqv_R010YY_partial_28_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YY_coefficient_28_0025 : Poly :=
[
  term ((-9008 : Rat) / 25) [(3, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 25 for generator 28. -/
def rs_R010_ueqv_R010YY_partial_28_0025 : Poly :=
[
  term ((18016 : Rat) / 25) [(0, 1), (3, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9008 : Rat) / 25) [(0, 2), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((18016 : Rat) / 25) [(1, 1), (3, 1), (8, 1), (15, 2), (16, 1)],
  term ((-9008 : Rat) / 25) [(1, 2), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((-18016 : Rat) / 25) [(2, 1), (3, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((9008 : Rat) / 25) [(2, 2), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((-18016 : Rat) / 25) [(3, 2), (8, 1), (15, 2), (16, 1)],
  term ((9008 : Rat) / 25) [(3, 3), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 28. -/
theorem rs_R010_ueqv_R010YY_partial_28_0025_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_28_0025
        rs_R010_ueqv_R010YY_generator_28_0000_0086 =
      rs_R010_ueqv_R010YY_partial_28_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YY_coefficient_28_0026 : Poly :=
[
  term ((-12292 : Rat) / 25) [(3, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 26 for generator 28. -/
def rs_R010_ueqv_R010YY_partial_28_0026 : Poly :=
[
  term ((24584 : Rat) / 25) [(0, 1), (3, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12292 : Rat) / 25) [(0, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((24584 : Rat) / 25) [(1, 1), (3, 1), (10, 1), (15, 2), (16, 1)],
  term ((-12292 : Rat) / 25) [(1, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-24584 : Rat) / 25) [(2, 1), (3, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((12292 : Rat) / 25) [(2, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-24584 : Rat) / 25) [(3, 2), (10, 1), (15, 2), (16, 1)],
  term ((12292 : Rat) / 25) [(3, 3), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 28. -/
theorem rs_R010_ueqv_R010YY_partial_28_0026_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_28_0026
        rs_R010_ueqv_R010YY_generator_28_0000_0086 =
      rs_R010_ueqv_R010YY_partial_28_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YY_coefficient_28_0027 : Poly :=
[
  term ((-2496 : Rat) / 25) [(3, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 27 for generator 28. -/
def rs_R010_ueqv_R010YY_partial_28_0027 : Poly :=
[
  term ((4992 : Rat) / 25) [(0, 1), (3, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2496 : Rat) / 25) [(0, 2), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((4992 : Rat) / 25) [(1, 1), (3, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2496 : Rat) / 25) [(1, 2), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4992 : Rat) / 25) [(2, 1), (3, 1), (14, 2), (15, 1), (16, 1)],
  term ((2496 : Rat) / 25) [(2, 2), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4992 : Rat) / 25) [(3, 2), (14, 1), (15, 2), (16, 1)],
  term ((2496 : Rat) / 25) [(3, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 28. -/
theorem rs_R010_ueqv_R010YY_partial_28_0027_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_28_0027
        rs_R010_ueqv_R010YY_generator_28_0000_0086 =
      rs_R010_ueqv_R010YY_partial_28_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YY_coefficient_28_0028 : Poly :=
[
  term ((1292 : Rat) / 5) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 28 for generator 28. -/
def rs_R010_ueqv_R010YY_partial_28_0028 : Poly :=
[
  term ((-2584 : Rat) / 5) [(0, 1), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((1292 : Rat) / 5) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((-2584 : Rat) / 5) [(1, 1), (3, 1), (15, 2), (16, 1)],
  term ((1292 : Rat) / 5) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((2584 : Rat) / 5) [(2, 1), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1292 : Rat) / 5) [(2, 2), (3, 1), (15, 1), (16, 1)],
  term ((2584 : Rat) / 5) [(3, 2), (15, 2), (16, 1)],
  term ((-1292 : Rat) / 5) [(3, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 28. -/
theorem rs_R010_ueqv_R010YY_partial_28_0028_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_28_0028
        rs_R010_ueqv_R010YY_generator_28_0000_0086 =
      rs_R010_ueqv_R010YY_partial_28_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YY_coefficient_28_0029 : Poly :=
[
  term ((2688 : Rat) / 25) [(4, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 29 for generator 28. -/
def rs_R010_ueqv_R010YY_partial_28_0029 : Poly :=
[
  term ((-5376 : Rat) / 25) [(0, 1), (4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((2688 : Rat) / 25) [(0, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-5376 : Rat) / 25) [(1, 1), (4, 1), (7, 1), (15, 2), (16, 1)],
  term ((2688 : Rat) / 25) [(1, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((5376 : Rat) / 25) [(2, 1), (4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2688 : Rat) / 25) [(2, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((5376 : Rat) / 25) [(3, 1), (4, 1), (7, 1), (15, 2), (16, 1)],
  term ((-2688 : Rat) / 25) [(3, 2), (4, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 28. -/
theorem rs_R010_ueqv_R010YY_partial_28_0029_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_28_0029
        rs_R010_ueqv_R010YY_generator_28_0000_0086 =
      rs_R010_ueqv_R010YY_partial_28_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YY_coefficient_28_0030 : Poly :=
[
  term ((-2688 : Rat) / 25) [(4, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 30 for generator 28. -/
def rs_R010_ueqv_R010YY_partial_28_0030 : Poly :=
[
  term ((5376 : Rat) / 25) [(0, 1), (4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2688 : Rat) / 25) [(0, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((5376 : Rat) / 25) [(1, 1), (4, 1), (9, 1), (15, 2), (16, 1)],
  term ((-2688 : Rat) / 25) [(1, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-5376 : Rat) / 25) [(2, 1), (4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((2688 : Rat) / 25) [(2, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-5376 : Rat) / 25) [(3, 1), (4, 1), (9, 1), (15, 2), (16, 1)],
  term ((2688 : Rat) / 25) [(3, 2), (4, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 28. -/
theorem rs_R010_ueqv_R010YY_partial_28_0030_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_28_0030
        rs_R010_ueqv_R010YY_generator_28_0000_0086 =
      rs_R010_ueqv_R010YY_partial_28_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YY_coefficient_28_0031 : Poly :=
[
  term ((-2636 : Rat) / 25) [(4, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 31 for generator 28. -/
def rs_R010_ueqv_R010YY_partial_28_0031 : Poly :=
[
  term ((5272 : Rat) / 25) [(0, 1), (4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2636 : Rat) / 25) [(0, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((5272 : Rat) / 25) [(1, 1), (4, 1), (11, 1), (15, 2), (16, 1)],
  term ((-2636 : Rat) / 25) [(1, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-5272 : Rat) / 25) [(2, 1), (4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((2636 : Rat) / 25) [(2, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-5272 : Rat) / 25) [(3, 1), (4, 1), (11, 1), (15, 2), (16, 1)],
  term ((2636 : Rat) / 25) [(3, 2), (4, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 28. -/
theorem rs_R010_ueqv_R010YY_partial_28_0031_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_28_0031
        rs_R010_ueqv_R010YY_generator_28_0000_0086 =
      rs_R010_ueqv_R010YY_partial_28_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YY_coefficient_28_0032 : Poly :=
[
  term ((3584 : Rat) / 25) [(5, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 32 for generator 28. -/
def rs_R010_ueqv_R010YY_partial_28_0032 : Poly :=
[
  term ((-7168 : Rat) / 25) [(0, 1), (5, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(0, 2), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-7168 : Rat) / 25) [(1, 1), (5, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((3584 : Rat) / 25) [(1, 2), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((7168 : Rat) / 25) [(2, 1), (5, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(2, 2), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((7168 : Rat) / 25) [(3, 1), (5, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-3584 : Rat) / 25) [(3, 2), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 28. -/
theorem rs_R010_ueqv_R010YY_partial_28_0032_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_28_0032
        rs_R010_ueqv_R010YY_generator_28_0000_0086 =
      rs_R010_ueqv_R010YY_partial_28_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YY_coefficient_28_0033 : Poly :=
[
  term ((3584 : Rat) / 25) [(5, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 33 for generator 28. -/
def rs_R010_ueqv_R010YY_partial_28_0033 : Poly :=
[
  term ((-7168 : Rat) / 25) [(0, 1), (5, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(0, 2), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-7168 : Rat) / 25) [(1, 1), (5, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((3584 : Rat) / 25) [(1, 2), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((7168 : Rat) / 25) [(2, 1), (5, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(2, 2), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((7168 : Rat) / 25) [(3, 1), (5, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-3584 : Rat) / 25) [(3, 2), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 28. -/
theorem rs_R010_ueqv_R010YY_partial_28_0033_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_28_0033
        rs_R010_ueqv_R010YY_generator_28_0000_0086 =
      rs_R010_ueqv_R010YY_partial_28_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YY_coefficient_28_0034 : Poly :=
[
  term ((-28064 : Rat) / 25) [(5, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 34 for generator 28. -/
def rs_R010_ueqv_R010YY_partial_28_0034 : Poly :=
[
  term ((56128 : Rat) / 25) [(0, 1), (5, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-28064 : Rat) / 25) [(0, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((56128 : Rat) / 25) [(1, 1), (5, 1), (8, 1), (15, 2), (16, 1)],
  term ((-28064 : Rat) / 25) [(1, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-56128 : Rat) / 25) [(2, 1), (5, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((28064 : Rat) / 25) [(2, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-56128 : Rat) / 25) [(3, 1), (5, 1), (8, 1), (15, 2), (16, 1)],
  term ((28064 : Rat) / 25) [(3, 2), (5, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 28. -/
theorem rs_R010_ueqv_R010YY_partial_28_0034_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_28_0034
        rs_R010_ueqv_R010YY_generator_28_0000_0086 =
      rs_R010_ueqv_R010YY_partial_28_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YY_coefficient_28_0035 : Poly :=
[
  term ((-3584 : Rat) / 25) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 35 for generator 28. -/
def rs_R010_ueqv_R010YY_partial_28_0035 : Poly :=
[
  term ((7168 : Rat) / 25) [(0, 1), (5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(0, 2), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((7168 : Rat) / 25) [(1, 1), (5, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-3584 : Rat) / 25) [(1, 2), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-7168 : Rat) / 25) [(2, 1), (5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(2, 2), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-7168 : Rat) / 25) [(3, 1), (5, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((3584 : Rat) / 25) [(3, 2), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 28. -/
theorem rs_R010_ueqv_R010YY_partial_28_0035_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_28_0035
        rs_R010_ueqv_R010YY_generator_28_0000_0086 =
      rs_R010_ueqv_R010YY_partial_28_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YY_coefficient_28_0036 : Poly :=
[
  term ((56128 : Rat) / 25) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 36 for generator 28. -/
def rs_R010_ueqv_R010YY_partial_28_0036 : Poly :=
[
  term ((-112256 : Rat) / 25) [(0, 1), (5, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((56128 : Rat) / 25) [(0, 2), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-112256 : Rat) / 25) [(1, 1), (5, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((56128 : Rat) / 25) [(1, 2), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((112256 : Rat) / 25) [(2, 1), (5, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-56128 : Rat) / 25) [(2, 2), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((112256 : Rat) / 25) [(3, 1), (5, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-56128 : Rat) / 25) [(3, 2), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 28. -/
theorem rs_R010_ueqv_R010YY_partial_28_0036_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_28_0036
        rs_R010_ueqv_R010YY_generator_28_0000_0086 =
      rs_R010_ueqv_R010YY_partial_28_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YY_coefficient_28_0037 : Poly :=
[
  term ((-3584 : Rat) / 25) [(5, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 37 for generator 28. -/
def rs_R010_ueqv_R010YY_partial_28_0037 : Poly :=
[
  term ((7168 : Rat) / 25) [(0, 1), (5, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(0, 2), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((7168 : Rat) / 25) [(1, 1), (5, 1), (9, 2), (15, 2), (16, 1)],
  term ((-3584 : Rat) / 25) [(1, 2), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-7168 : Rat) / 25) [(2, 1), (5, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(2, 2), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-7168 : Rat) / 25) [(3, 1), (5, 1), (9, 2), (15, 2), (16, 1)],
  term ((3584 : Rat) / 25) [(3, 2), (5, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 28. -/
theorem rs_R010_ueqv_R010YY_partial_28_0037_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_28_0037
        rs_R010_ueqv_R010YY_generator_28_0000_0086 =
      rs_R010_ueqv_R010YY_partial_28_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YY_coefficient_28_0038 : Poly :=
[
  term ((14072 : Rat) / 25) [(5, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 38 for generator 28. -/
def rs_R010_ueqv_R010YY_partial_28_0038 : Poly :=
[
  term ((-28144 : Rat) / 25) [(0, 1), (5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((14072 : Rat) / 25) [(0, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-28144 : Rat) / 25) [(1, 1), (5, 1), (10, 1), (15, 2), (16, 1)],
  term ((14072 : Rat) / 25) [(1, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((28144 : Rat) / 25) [(2, 1), (5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-14072 : Rat) / 25) [(2, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((28144 : Rat) / 25) [(3, 1), (5, 1), (10, 1), (15, 2), (16, 1)],
  term ((-14072 : Rat) / 25) [(3, 2), (5, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 28. -/
theorem rs_R010_ueqv_R010YY_partial_28_0038_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_28_0038
        rs_R010_ueqv_R010YY_generator_28_0000_0086 =
      rs_R010_ueqv_R010YY_partial_28_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YY_coefficient_28_0039 : Poly :=
[
  term ((22872 : Rat) / 25) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 39 for generator 28. -/
def rs_R010_ueqv_R010YY_partial_28_0039 : Poly :=
[
  term ((-45744 : Rat) / 25) [(0, 1), (5, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((22872 : Rat) / 25) [(0, 2), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-45744 : Rat) / 25) [(1, 1), (5, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((22872 : Rat) / 25) [(1, 2), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((45744 : Rat) / 25) [(2, 1), (5, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-22872 : Rat) / 25) [(2, 2), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((45744 : Rat) / 25) [(3, 1), (5, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-22872 : Rat) / 25) [(3, 2), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 28. -/
theorem rs_R010_ueqv_R010YY_partial_28_0039_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_28_0039
        rs_R010_ueqv_R010YY_generator_28_0000_0086 =
      rs_R010_ueqv_R010YY_partial_28_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YY_coefficient_28_0040 : Poly :=
[
  term ((-9236 : Rat) / 25) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 40 for generator 28. -/
def rs_R010_ueqv_R010YY_partial_28_0040 : Poly :=
[
  term ((18472 : Rat) / 25) [(0, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9236 : Rat) / 25) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((18472 : Rat) / 25) [(1, 1), (5, 1), (15, 2), (16, 1)],
  term ((-9236 : Rat) / 25) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((-18472 : Rat) / 25) [(2, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((9236 : Rat) / 25) [(2, 2), (5, 1), (15, 1), (16, 1)],
  term ((-18472 : Rat) / 25) [(3, 1), (5, 1), (15, 2), (16, 1)],
  term ((9236 : Rat) / 25) [(3, 2), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 28. -/
theorem rs_R010_ueqv_R010YY_partial_28_0040_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_28_0040
        rs_R010_ueqv_R010YY_generator_28_0000_0086 =
      rs_R010_ueqv_R010YY_partial_28_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YY_coefficient_28_0041 : Poly :=
[
  term ((-22804 : Rat) / 25) [(6, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 41 for generator 28. -/
def rs_R010_ueqv_R010YY_partial_28_0041 : Poly :=
[
  term ((45608 : Rat) / 25) [(0, 1), (6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-22804 : Rat) / 25) [(0, 2), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((45608 : Rat) / 25) [(1, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((-22804 : Rat) / 25) [(1, 2), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-45608 : Rat) / 25) [(2, 1), (6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((22804 : Rat) / 25) [(2, 2), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-45608 : Rat) / 25) [(3, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((22804 : Rat) / 25) [(3, 2), (6, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 28. -/
theorem rs_R010_ueqv_R010YY_partial_28_0041_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_28_0041
        rs_R010_ueqv_R010YY_generator_28_0000_0086 =
      rs_R010_ueqv_R010YY_partial_28_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YY_coefficient_28_0042 : Poly :=
[
  term ((-216 : Rat) / 25) [(6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 42 for generator 28. -/
def rs_R010_ueqv_R010YY_partial_28_0042 : Poly :=
[
  term ((432 : Rat) / 25) [(0, 1), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-216 : Rat) / 25) [(0, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((432 : Rat) / 25) [(1, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((-216 : Rat) / 25) [(1, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-432 : Rat) / 25) [(2, 1), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((216 : Rat) / 25) [(2, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-432 : Rat) / 25) [(3, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((216 : Rat) / 25) [(3, 2), (6, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 28. -/
theorem rs_R010_ueqv_R010YY_partial_28_0042_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_28_0042
        rs_R010_ueqv_R010YY_generator_28_0000_0086 =
      rs_R010_ueqv_R010YY_partial_28_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YY_coefficient_28_0043 : Poly :=
[
  term ((-2416 : Rat) / 25) [(6, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 43 for generator 28. -/
def rs_R010_ueqv_R010YY_partial_28_0043 : Poly :=
[
  term ((4832 : Rat) / 25) [(0, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2416 : Rat) / 25) [(0, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((4832 : Rat) / 25) [(1, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((-2416 : Rat) / 25) [(1, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-4832 : Rat) / 25) [(2, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((2416 : Rat) / 25) [(2, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-4832 : Rat) / 25) [(3, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((2416 : Rat) / 25) [(3, 2), (6, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 28. -/
theorem rs_R010_ueqv_R010YY_partial_28_0043_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_28_0043
        rs_R010_ueqv_R010YY_generator_28_0000_0086 =
      rs_R010_ueqv_R010YY_partial_28_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YY_coefficient_28_0044 : Poly :=
[
  term ((6512 : Rat) / 25) [(6, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 44 for generator 28. -/
def rs_R010_ueqv_R010YY_partial_28_0044 : Poly :=
[
  term ((-13024 : Rat) / 25) [(0, 1), (6, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((6512 : Rat) / 25) [(0, 2), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-13024 : Rat) / 25) [(1, 1), (6, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((6512 : Rat) / 25) [(1, 2), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((13024 : Rat) / 25) [(2, 1), (6, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-6512 : Rat) / 25) [(2, 2), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((13024 : Rat) / 25) [(3, 1), (6, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-6512 : Rat) / 25) [(3, 2), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 28. -/
theorem rs_R010_ueqv_R010YY_partial_28_0044_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_28_0044
        rs_R010_ueqv_R010YY_generator_28_0000_0086 =
      rs_R010_ueqv_R010YY_partial_28_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YY_coefficient_28_0045 : Poly :=
[
  term ((3256 : Rat) / 25) [(6, 1), (15, 2), (16, 1)]
]

/-- Partial product 45 for generator 28. -/
def rs_R010_ueqv_R010YY_partial_28_0045 : Poly :=
[
  term ((-6512 : Rat) / 25) [(0, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((3256 : Rat) / 25) [(0, 2), (6, 1), (15, 2), (16, 1)],
  term ((-6512 : Rat) / 25) [(1, 1), (6, 1), (15, 3), (16, 1)],
  term ((3256 : Rat) / 25) [(1, 2), (6, 1), (15, 2), (16, 1)],
  term ((6512 : Rat) / 25) [(2, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3256 : Rat) / 25) [(2, 2), (6, 1), (15, 2), (16, 1)],
  term ((6512 : Rat) / 25) [(3, 1), (6, 1), (15, 3), (16, 1)],
  term ((-3256 : Rat) / 25) [(3, 2), (6, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 28. -/
theorem rs_R010_ueqv_R010YY_partial_28_0045_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_28_0045
        rs_R010_ueqv_R010YY_generator_28_0000_0086 =
      rs_R010_ueqv_R010YY_partial_28_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YY_coefficient_28_0046 : Poly :=
[
  term ((-15776 : Rat) / 25) [(7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 46 for generator 28. -/
def rs_R010_ueqv_R010YY_partial_28_0046 : Poly :=
[
  term ((31552 : Rat) / 25) [(0, 1), (7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-15776 : Rat) / 25) [(0, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((31552 : Rat) / 25) [(1, 1), (7, 1), (8, 1), (15, 2), (16, 1)],
  term ((-15776 : Rat) / 25) [(1, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-31552 : Rat) / 25) [(2, 1), (7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((15776 : Rat) / 25) [(2, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-31552 : Rat) / 25) [(3, 1), (7, 1), (8, 1), (15, 2), (16, 1)],
  term ((15776 : Rat) / 25) [(3, 2), (7, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 28. -/
theorem rs_R010_ueqv_R010YY_partial_28_0046_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_28_0046
        rs_R010_ueqv_R010YY_generator_28_0000_0086 =
      rs_R010_ueqv_R010YY_partial_28_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YY_coefficient_28_0047 : Poly :=
[
  term ((-7168 : Rat) / 25) [(7, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 47 for generator 28. -/
def rs_R010_ueqv_R010YY_partial_28_0047 : Poly :=
[
  term ((14336 : Rat) / 25) [(0, 1), (7, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7168 : Rat) / 25) [(0, 2), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((14336 : Rat) / 25) [(1, 1), (7, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-7168 : Rat) / 25) [(1, 2), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-14336 : Rat) / 25) [(2, 1), (7, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((7168 : Rat) / 25) [(2, 2), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-14336 : Rat) / 25) [(3, 1), (7, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((7168 : Rat) / 25) [(3, 2), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 28. -/
theorem rs_R010_ueqv_R010YY_partial_28_0047_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_28_0047
        rs_R010_ueqv_R010YY_generator_28_0000_0086 =
      rs_R010_ueqv_R010YY_partial_28_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YY_coefficient_28_0048 : Poly :=
[
  term ((-13456 : Rat) / 25) [(7, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 48 for generator 28. -/
def rs_R010_ueqv_R010YY_partial_28_0048 : Poly :=
[
  term ((26912 : Rat) / 25) [(0, 1), (7, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-13456 : Rat) / 25) [(0, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((26912 : Rat) / 25) [(1, 1), (7, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-13456 : Rat) / 25) [(1, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-26912 : Rat) / 25) [(2, 1), (7, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((13456 : Rat) / 25) [(2, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-26912 : Rat) / 25) [(3, 1), (7, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((13456 : Rat) / 25) [(3, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 28. -/
theorem rs_R010_ueqv_R010YY_partial_28_0048_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_28_0048
        rs_R010_ueqv_R010YY_generator_28_0000_0086 =
      rs_R010_ueqv_R010YY_partial_28_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YY_coefficient_28_0049 : Poly :=
[
  term ((82024 : Rat) / 25) [(7, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 49 for generator 28. -/
def rs_R010_ueqv_R010YY_partial_28_0049 : Poly :=
[
  term ((-164048 : Rat) / 25) [(0, 1), (7, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((82024 : Rat) / 25) [(0, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-164048 : Rat) / 25) [(1, 1), (7, 1), (9, 1), (15, 3), (16, 1)],
  term ((82024 : Rat) / 25) [(1, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((164048 : Rat) / 25) [(2, 1), (7, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-82024 : Rat) / 25) [(2, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((164048 : Rat) / 25) [(3, 1), (7, 1), (9, 1), (15, 3), (16, 1)],
  term ((-82024 : Rat) / 25) [(3, 2), (7, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 28. -/
theorem rs_R010_ueqv_R010YY_partial_28_0049_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_28_0049
        rs_R010_ueqv_R010YY_generator_28_0000_0086 =
      rs_R010_ueqv_R010YY_partial_28_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YY_coefficient_28_0050 : Poly :=
[
  term (8 : Rat) [(7, 1), (9, 1), (16, 1)]
]

/-- Partial product 50 for generator 28. -/
def rs_R010_ueqv_R010YY_partial_28_0050 : Poly :=
[
  term (-16 : Rat) [(0, 1), (7, 1), (9, 1), (14, 1), (16, 1)],
  term (8 : Rat) [(0, 2), (7, 1), (9, 1), (16, 1)],
  term (-16 : Rat) [(1, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(1, 2), (7, 1), (9, 1), (16, 1)],
  term (16 : Rat) [(2, 1), (7, 1), (9, 1), (14, 1), (16, 1)],
  term (-8 : Rat) [(2, 2), (7, 1), (9, 1), (16, 1)],
  term (16 : Rat) [(3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(3, 2), (7, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 28. -/
theorem rs_R010_ueqv_R010YY_partial_28_0050_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_28_0050
        rs_R010_ueqv_R010YY_generator_28_0000_0086 =
      rs_R010_ueqv_R010YY_partial_28_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YY_coefficient_28_0051 : Poly :=
[
  term ((-3584 : Rat) / 25) [(7, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 51 for generator 28. -/
def rs_R010_ueqv_R010YY_partial_28_0051 : Poly :=
[
  term ((7168 : Rat) / 25) [(0, 1), (7, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(0, 2), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((7168 : Rat) / 25) [(1, 1), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((-3584 : Rat) / 25) [(1, 2), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((-7168 : Rat) / 25) [(2, 1), (7, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(2, 2), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((-7168 : Rat) / 25) [(3, 1), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((3584 : Rat) / 25) [(3, 2), (7, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 28. -/
theorem rs_R010_ueqv_R010YY_partial_28_0051_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_28_0051
        rs_R010_ueqv_R010YY_generator_28_0000_0086 =
      rs_R010_ueqv_R010YY_partial_28_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YY_coefficient_28_0052 : Poly :=
[
  term ((1792 : Rat) / 25) [(7, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 52 for generator 28. -/
def rs_R010_ueqv_R010YY_partial_28_0052 : Poly :=
[
  term ((-3584 : Rat) / 25) [(0, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(0, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(1, 1), (7, 1), (10, 1), (15, 2), (16, 1)],
  term ((1792 : Rat) / 25) [(1, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(2, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(2, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(3, 1), (7, 1), (10, 1), (15, 2), (16, 1)],
  term ((-1792 : Rat) / 25) [(3, 2), (7, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 28. -/
theorem rs_R010_ueqv_R010YY_partial_28_0052_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_28_0052
        rs_R010_ueqv_R010YY_generator_28_0000_0086 =
      rs_R010_ueqv_R010YY_partial_28_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YY_coefficient_28_0053 : Poly :=
[
  term ((-35456 : Rat) / 25) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 53 for generator 28. -/
def rs_R010_ueqv_R010YY_partial_28_0053 : Poly :=
[
  term ((70912 : Rat) / 25) [(0, 1), (7, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-35456 : Rat) / 25) [(0, 2), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((70912 : Rat) / 25) [(1, 1), (7, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-35456 : Rat) / 25) [(1, 2), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-70912 : Rat) / 25) [(2, 1), (7, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((35456 : Rat) / 25) [(2, 2), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-70912 : Rat) / 25) [(3, 1), (7, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((35456 : Rat) / 25) [(3, 2), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 28. -/
theorem rs_R010_ueqv_R010YY_partial_28_0053_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_28_0053
        rs_R010_ueqv_R010YY_generator_28_0000_0086 =
      rs_R010_ueqv_R010YY_partial_28_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YY_coefficient_28_0054 : Poly :=
[
  term ((93112 : Rat) / 75) [(7, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 54 for generator 28. -/
def rs_R010_ueqv_R010YY_partial_28_0054 : Poly :=
[
  term ((-186224 : Rat) / 75) [(0, 1), (7, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((93112 : Rat) / 75) [(0, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-186224 : Rat) / 75) [(1, 1), (7, 1), (11, 1), (15, 3), (16, 1)],
  term ((93112 : Rat) / 75) [(1, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((186224 : Rat) / 75) [(2, 1), (7, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-93112 : Rat) / 75) [(2, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((186224 : Rat) / 75) [(3, 1), (7, 1), (11, 1), (15, 3), (16, 1)],
  term ((-93112 : Rat) / 75) [(3, 2), (7, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 28. -/
theorem rs_R010_ueqv_R010YY_partial_28_0054_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_28_0054
        rs_R010_ueqv_R010YY_generator_28_0000_0086 =
      rs_R010_ueqv_R010YY_partial_28_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YY_coefficient_28_0055 : Poly :=
[
  term (-8 : Rat) [(7, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 55 for generator 28. -/
def rs_R010_ueqv_R010YY_partial_28_0055 : Poly :=
[
  term (16 : Rat) [(0, 1), (7, 1), (13, 1), (14, 2), (16, 1)],
  term (-8 : Rat) [(0, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term (16 : Rat) [(1, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(1, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term (-16 : Rat) [(2, 1), (7, 1), (13, 1), (14, 2), (16, 1)],
  term (8 : Rat) [(2, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term (-16 : Rat) [(3, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(3, 2), (7, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 28. -/
theorem rs_R010_ueqv_R010YY_partial_28_0055_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_28_0055
        rs_R010_ueqv_R010YY_generator_28_0000_0086 =
      rs_R010_ueqv_R010YY_partial_28_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YY_coefficient_28_0056 : Poly :=
[
  term ((65576 : Rat) / 25) [(7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 56 for generator 28. -/
def rs_R010_ueqv_R010YY_partial_28_0056 : Poly :=
[
  term ((-131152 : Rat) / 25) [(0, 1), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((65576 : Rat) / 25) [(0, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-131152 : Rat) / 25) [(1, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((65576 : Rat) / 25) [(1, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((131152 : Rat) / 25) [(2, 1), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-65576 : Rat) / 25) [(2, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((131152 : Rat) / 25) [(3, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((-65576 : Rat) / 25) [(3, 2), (7, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 28. -/
theorem rs_R010_ueqv_R010YY_partial_28_0056_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_28_0056
        rs_R010_ueqv_R010YY_generator_28_0000_0086 =
      rs_R010_ueqv_R010YY_partial_28_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YY_coefficient_28_0057 : Poly :=
[
  term (4 : Rat) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 57 for generator 28. -/
def rs_R010_ueqv_R010YY_partial_28_0057 : Poly :=
[
  term (-8 : Rat) [(0, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term (4 : Rat) [(0, 2), (7, 1), (13, 1), (16, 1)],
  term (-8 : Rat) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(1, 2), (7, 1), (13, 1), (16, 1)],
  term (8 : Rat) [(2, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term (-4 : Rat) [(2, 2), (7, 1), (13, 1), (16, 1)],
  term (8 : Rat) [(3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(3, 2), (7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 28. -/
theorem rs_R010_ueqv_R010YY_partial_28_0057_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_28_0057
        rs_R010_ueqv_R010YY_generator_28_0000_0086 =
      rs_R010_ueqv_R010YY_partial_28_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YY_coefficient_28_0058 : Poly :=
[
  term ((40672 : Rat) / 75) [(7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 58 for generator 28. -/
def rs_R010_ueqv_R010YY_partial_28_0058 : Poly :=
[
  term ((-81344 : Rat) / 75) [(0, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((40672 : Rat) / 75) [(0, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-81344 : Rat) / 75) [(1, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((40672 : Rat) / 75) [(1, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((81344 : Rat) / 75) [(2, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-40672 : Rat) / 75) [(2, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((81344 : Rat) / 75) [(3, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((-40672 : Rat) / 75) [(3, 2), (7, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 28. -/
theorem rs_R010_ueqv_R010YY_partial_28_0058_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_28_0058
        rs_R010_ueqv_R010YY_generator_28_0000_0086 =
      rs_R010_ueqv_R010YY_partial_28_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YY_coefficient_28_0059 : Poly :=
[
  term ((6772 : Rat) / 15) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 59 for generator 28. -/
def rs_R010_ueqv_R010YY_partial_28_0059 : Poly :=
[
  term ((-13544 : Rat) / 15) [(0, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((6772 : Rat) / 15) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((-13544 : Rat) / 15) [(1, 1), (7, 1), (15, 2), (16, 1)],
  term ((6772 : Rat) / 15) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((13544 : Rat) / 15) [(2, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6772 : Rat) / 15) [(2, 2), (7, 1), (15, 1), (16, 1)],
  term ((13544 : Rat) / 15) [(3, 1), (7, 1), (15, 2), (16, 1)],
  term ((-6772 : Rat) / 15) [(3, 2), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 28. -/
theorem rs_R010_ueqv_R010YY_partial_28_0059_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_28_0059
        rs_R010_ueqv_R010YY_generator_28_0000_0086 =
      rs_R010_ueqv_R010YY_partial_28_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YY_coefficient_28_0060 : Poly :=
[
  term ((-104 : Rat) / 25) [(7, 1), (15, 3), (16, 1)]
]

/-- Partial product 60 for generator 28. -/
def rs_R010_ueqv_R010YY_partial_28_0060 : Poly :=
[
  term ((208 : Rat) / 25) [(0, 1), (7, 1), (14, 1), (15, 3), (16, 1)],
  term ((-104 : Rat) / 25) [(0, 2), (7, 1), (15, 3), (16, 1)],
  term ((208 : Rat) / 25) [(1, 1), (7, 1), (15, 4), (16, 1)],
  term ((-104 : Rat) / 25) [(1, 2), (7, 1), (15, 3), (16, 1)],
  term ((-208 : Rat) / 25) [(2, 1), (7, 1), (14, 1), (15, 3), (16, 1)],
  term ((104 : Rat) / 25) [(2, 2), (7, 1), (15, 3), (16, 1)],
  term ((-208 : Rat) / 25) [(3, 1), (7, 1), (15, 4), (16, 1)],
  term ((104 : Rat) / 25) [(3, 2), (7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 28. -/
theorem rs_R010_ueqv_R010YY_partial_28_0060_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_28_0060
        rs_R010_ueqv_R010YY_generator_28_0000_0086 =
      rs_R010_ueqv_R010YY_partial_28_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YY_coefficient_28_0061 : Poly :=
[
  term ((-32864 : Rat) / 25) [(7, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 61 for generator 28. -/
def rs_R010_ueqv_R010YY_partial_28_0061 : Poly :=
[
  term ((65728 : Rat) / 25) [(0, 1), (7, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-32864 : Rat) / 25) [(0, 2), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((65728 : Rat) / 25) [(1, 1), (7, 2), (9, 1), (15, 2), (16, 1)],
  term ((-32864 : Rat) / 25) [(1, 2), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-65728 : Rat) / 25) [(2, 1), (7, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((32864 : Rat) / 25) [(2, 2), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-65728 : Rat) / 25) [(3, 1), (7, 2), (9, 1), (15, 2), (16, 1)],
  term ((32864 : Rat) / 25) [(3, 2), (7, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 28. -/
theorem rs_R010_ueqv_R010YY_partial_28_0061_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_28_0061
        rs_R010_ueqv_R010YY_generator_28_0000_0086 =
      rs_R010_ueqv_R010YY_partial_28_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YY_coefficient_28_0062 : Poly :=
[
  term ((-127952 : Rat) / 75) [(7, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 62 for generator 28. -/
def rs_R010_ueqv_R010YY_partial_28_0062 : Poly :=
[
  term ((255904 : Rat) / 75) [(0, 1), (7, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-127952 : Rat) / 75) [(0, 2), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((255904 : Rat) / 75) [(1, 1), (7, 2), (11, 1), (15, 2), (16, 1)],
  term ((-127952 : Rat) / 75) [(1, 2), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-255904 : Rat) / 75) [(2, 1), (7, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((127952 : Rat) / 75) [(2, 2), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-255904 : Rat) / 75) [(3, 1), (7, 2), (11, 1), (15, 2), (16, 1)],
  term ((127952 : Rat) / 75) [(3, 2), (7, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 28. -/
theorem rs_R010_ueqv_R010YY_partial_28_0062_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_28_0062
        rs_R010_ueqv_R010YY_generator_28_0000_0086 =
      rs_R010_ueqv_R010YY_partial_28_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YY_coefficient_28_0063 : Poly :=
[
  term ((6488 : Rat) / 25) [(7, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 63 for generator 28. -/
def rs_R010_ueqv_R010YY_partial_28_0063 : Poly :=
[
  term ((-12976 : Rat) / 25) [(0, 1), (7, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((6488 : Rat) / 25) [(0, 2), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-12976 : Rat) / 25) [(1, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((6488 : Rat) / 25) [(1, 2), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((12976 : Rat) / 25) [(2, 1), (7, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6488 : Rat) / 25) [(2, 2), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((12976 : Rat) / 25) [(3, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((-6488 : Rat) / 25) [(3, 2), (7, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 28. -/
theorem rs_R010_ueqv_R010YY_partial_28_0063_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_28_0063
        rs_R010_ueqv_R010YY_generator_28_0000_0086 =
      rs_R010_ueqv_R010YY_partial_28_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YY_coefficient_28_0064 : Poly :=
[
  term ((16 : Rat) / 3) [(7, 2), (14, 1), (16, 1)]
]

/-- Partial product 64 for generator 28. -/
def rs_R010_ueqv_R010YY_partial_28_0064 : Poly :=
[
  term ((-32 : Rat) / 3) [(0, 1), (7, 2), (14, 2), (16, 1)],
  term ((16 : Rat) / 3) [(0, 2), (7, 2), (14, 1), (16, 1)],
  term ((-32 : Rat) / 3) [(1, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 3) [(1, 2), (7, 2), (14, 1), (16, 1)],
  term ((32 : Rat) / 3) [(2, 1), (7, 2), (14, 2), (16, 1)],
  term ((-16 : Rat) / 3) [(2, 2), (7, 2), (14, 1), (16, 1)],
  term ((32 : Rat) / 3) [(3, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 3) [(3, 2), (7, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 28. -/
theorem rs_R010_ueqv_R010YY_partial_28_0064_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_28_0064
        rs_R010_ueqv_R010YY_generator_28_0000_0086 =
      rs_R010_ueqv_R010YY_partial_28_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YY_coefficient_28_0065 : Poly :=
[
  term ((-17992 : Rat) / 75) [(7, 2), (15, 2), (16, 1)]
]

/-- Partial product 65 for generator 28. -/
def rs_R010_ueqv_R010YY_partial_28_0065 : Poly :=
[
  term ((35984 : Rat) / 75) [(0, 1), (7, 2), (14, 1), (15, 2), (16, 1)],
  term ((-17992 : Rat) / 75) [(0, 2), (7, 2), (15, 2), (16, 1)],
  term ((35984 : Rat) / 75) [(1, 1), (7, 2), (15, 3), (16, 1)],
  term ((-17992 : Rat) / 75) [(1, 2), (7, 2), (15, 2), (16, 1)],
  term ((-35984 : Rat) / 75) [(2, 1), (7, 2), (14, 1), (15, 2), (16, 1)],
  term ((17992 : Rat) / 75) [(2, 2), (7, 2), (15, 2), (16, 1)],
  term ((-35984 : Rat) / 75) [(3, 1), (7, 2), (15, 3), (16, 1)],
  term ((17992 : Rat) / 75) [(3, 2), (7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 28. -/
theorem rs_R010_ueqv_R010YY_partial_28_0065_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_28_0065
        rs_R010_ueqv_R010YY_generator_28_0000_0086 =
      rs_R010_ueqv_R010YY_partial_28_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YY_coefficient_28_0066 : Poly :=
[
  term ((-4 : Rat) / 3) [(7, 2), (16, 1)]
]

/-- Partial product 66 for generator 28. -/
def rs_R010_ueqv_R010YY_partial_28_0066 : Poly :=
[
  term ((8 : Rat) / 3) [(0, 1), (7, 2), (14, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(0, 2), (7, 2), (16, 1)],
  term ((8 : Rat) / 3) [(1, 1), (7, 2), (15, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(1, 2), (7, 2), (16, 1)],
  term ((-8 : Rat) / 3) [(2, 1), (7, 2), (14, 1), (16, 1)],
  term ((4 : Rat) / 3) [(2, 2), (7, 2), (16, 1)],
  term ((-8 : Rat) / 3) [(3, 1), (7, 2), (15, 1), (16, 1)],
  term ((4 : Rat) / 3) [(3, 2), (7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 28. -/
theorem rs_R010_ueqv_R010YY_partial_28_0066_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_28_0066
        rs_R010_ueqv_R010YY_generator_28_0000_0086 =
      rs_R010_ueqv_R010YY_partial_28_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YY_coefficient_28_0067 : Poly :=
[
  term ((-12976 : Rat) / 75) [(7, 3), (15, 1), (16, 1)]
]

/-- Partial product 67 for generator 28. -/
def rs_R010_ueqv_R010YY_partial_28_0067 : Poly :=
[
  term ((25952 : Rat) / 75) [(0, 1), (7, 3), (14, 1), (15, 1), (16, 1)],
  term ((-12976 : Rat) / 75) [(0, 2), (7, 3), (15, 1), (16, 1)],
  term ((25952 : Rat) / 75) [(1, 1), (7, 3), (15, 2), (16, 1)],
  term ((-12976 : Rat) / 75) [(1, 2), (7, 3), (15, 1), (16, 1)],
  term ((-25952 : Rat) / 75) [(2, 1), (7, 3), (14, 1), (15, 1), (16, 1)],
  term ((12976 : Rat) / 75) [(2, 2), (7, 3), (15, 1), (16, 1)],
  term ((-25952 : Rat) / 75) [(3, 1), (7, 3), (15, 2), (16, 1)],
  term ((12976 : Rat) / 75) [(3, 2), (7, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 28. -/
theorem rs_R010_ueqv_R010YY_partial_28_0067_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_28_0067
        rs_R010_ueqv_R010YY_generator_28_0000_0086 =
      rs_R010_ueqv_R010YY_partial_28_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YY_coefficient_28_0068 : Poly :=
[
  term ((22784 : Rat) / 25) [(8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 68 for generator 28. -/
def rs_R010_ueqv_R010YY_partial_28_0068 : Poly :=
[
  term ((-45568 : Rat) / 25) [(0, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((22784 : Rat) / 25) [(0, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-45568 : Rat) / 25) [(1, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((22784 : Rat) / 25) [(1, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((45568 : Rat) / 25) [(2, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-22784 : Rat) / 25) [(2, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((45568 : Rat) / 25) [(3, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-22784 : Rat) / 25) [(3, 2), (8, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 28. -/
theorem rs_R010_ueqv_R010YY_partial_28_0068_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_28_0068
        rs_R010_ueqv_R010YY_generator_28_0000_0086 =
      rs_R010_ueqv_R010YY_partial_28_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YY_coefficient_28_0069 : Poly :=
[
  term ((12884 : Rat) / 25) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 69 for generator 28. -/
def rs_R010_ueqv_R010YY_partial_28_0069 : Poly :=
[
  term ((-25768 : Rat) / 25) [(0, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((12884 : Rat) / 25) [(0, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-25768 : Rat) / 25) [(1, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((12884 : Rat) / 25) [(1, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((25768 : Rat) / 25) [(2, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12884 : Rat) / 25) [(2, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((25768 : Rat) / 25) [(3, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-12884 : Rat) / 25) [(3, 2), (8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 28. -/
theorem rs_R010_ueqv_R010YY_partial_28_0069_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_28_0069
        rs_R010_ueqv_R010YY_generator_28_0000_0086 =
      rs_R010_ueqv_R010YY_partial_28_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YY_coefficient_28_0070 : Poly :=
[
  term ((-5072 : Rat) / 25) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 70 for generator 28. -/
def rs_R010_ueqv_R010YY_partial_28_0070 : Poly :=
[
  term ((10144 : Rat) / 25) [(0, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5072 : Rat) / 25) [(0, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((10144 : Rat) / 25) [(1, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((-5072 : Rat) / 25) [(1, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-10144 : Rat) / 25) [(2, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((5072 : Rat) / 25) [(2, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-10144 : Rat) / 25) [(3, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((5072 : Rat) / 25) [(3, 2), (8, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 28. -/
theorem rs_R010_ueqv_R010YY_partial_28_0070_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_28_0070
        rs_R010_ueqv_R010YY_generator_28_0000_0086 =
      rs_R010_ueqv_R010YY_partial_28_0070 := by
  native_decide

/-- Coefficient term 71 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YY_coefficient_28_0071 : Poly :=
[
  term ((14336 : Rat) / 25) [(9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 71 for generator 28. -/
def rs_R010_ueqv_R010YY_partial_28_0071 : Poly :=
[
  term ((-28672 : Rat) / 25) [(0, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((14336 : Rat) / 25) [(0, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-28672 : Rat) / 25) [(1, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((14336 : Rat) / 25) [(1, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((28672 : Rat) / 25) [(2, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-14336 : Rat) / 25) [(2, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((28672 : Rat) / 25) [(3, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-14336 : Rat) / 25) [(3, 2), (9, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 71 for generator 28. -/
theorem rs_R010_ueqv_R010YY_partial_28_0071_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_28_0071
        rs_R010_ueqv_R010YY_generator_28_0000_0086 =
      rs_R010_ueqv_R010YY_partial_28_0071 := by
  native_decide

/-- Coefficient term 72 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YY_coefficient_28_0072 : Poly :=
[
  term ((-54336 : Rat) / 25) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 72 for generator 28. -/
def rs_R010_ueqv_R010YY_partial_28_0072 : Poly :=
[
  term ((108672 : Rat) / 25) [(0, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-54336 : Rat) / 25) [(0, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((108672 : Rat) / 25) [(1, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-54336 : Rat) / 25) [(1, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-108672 : Rat) / 25) [(2, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((54336 : Rat) / 25) [(2, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-108672 : Rat) / 25) [(3, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((54336 : Rat) / 25) [(3, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 72 for generator 28. -/
theorem rs_R010_ueqv_R010YY_partial_28_0072_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_28_0072
        rs_R010_ueqv_R010YY_generator_28_0000_0086 =
      rs_R010_ueqv_R010YY_partial_28_0072 := by
  native_decide

/-- Coefficient term 73 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YY_coefficient_28_0073 : Poly :=
[
  term ((-56128 : Rat) / 25) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 73 for generator 28. -/
def rs_R010_ueqv_R010YY_partial_28_0073 : Poly :=
[
  term ((112256 : Rat) / 25) [(0, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-56128 : Rat) / 25) [(0, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((112256 : Rat) / 25) [(1, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((-56128 : Rat) / 25) [(1, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-112256 : Rat) / 25) [(2, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((56128 : Rat) / 25) [(2, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-112256 : Rat) / 25) [(3, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((56128 : Rat) / 25) [(3, 2), (9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 73 for generator 28. -/
theorem rs_R010_ueqv_R010YY_partial_28_0073_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_28_0073
        rs_R010_ueqv_R010YY_generator_28_0000_0086 =
      rs_R010_ueqv_R010YY_partial_28_0073 := by
  native_decide

/-- Coefficient term 74 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YY_coefficient_28_0074 : Poly :=
[
  term ((28064 : Rat) / 25) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 74 for generator 28. -/
def rs_R010_ueqv_R010YY_partial_28_0074 : Poly :=
[
  term ((-56128 : Rat) / 25) [(0, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((28064 : Rat) / 25) [(0, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-56128 : Rat) / 25) [(1, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((28064 : Rat) / 25) [(1, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((56128 : Rat) / 25) [(2, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-28064 : Rat) / 25) [(2, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((56128 : Rat) / 25) [(3, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-28064 : Rat) / 25) [(3, 2), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 74 for generator 28. -/
theorem rs_R010_ueqv_R010YY_partial_28_0074_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_28_0074
        rs_R010_ueqv_R010YY_generator_28_0000_0086 =
      rs_R010_ueqv_R010YY_partial_28_0074 := by
  native_decide

/-- Coefficient term 75 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YY_coefficient_28_0075 : Poly :=
[
  term ((8056 : Rat) / 25) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 75 for generator 28. -/
def rs_R010_ueqv_R010YY_partial_28_0075 : Poly :=
[
  term ((-16112 : Rat) / 25) [(0, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((8056 : Rat) / 25) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((-16112 : Rat) / 25) [(1, 1), (9, 1), (15, 2), (16, 1)],
  term ((8056 : Rat) / 25) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((16112 : Rat) / 25) [(2, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8056 : Rat) / 25) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((16112 : Rat) / 25) [(3, 1), (9, 1), (15, 2), (16, 1)],
  term ((-8056 : Rat) / 25) [(3, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 75 for generator 28. -/
theorem rs_R010_ueqv_R010YY_partial_28_0075_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_28_0075
        rs_R010_ueqv_R010YY_generator_28_0000_0086 =
      rs_R010_ueqv_R010YY_partial_28_0075 := by
  native_decide

/-- Coefficient term 76 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YY_coefficient_28_0076 : Poly :=
[
  term ((18128 : Rat) / 25) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 76 for generator 28. -/
def rs_R010_ueqv_R010YY_partial_28_0076 : Poly :=
[
  term ((-36256 : Rat) / 25) [(0, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((18128 : Rat) / 25) [(0, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-36256 : Rat) / 25) [(1, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((18128 : Rat) / 25) [(1, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((36256 : Rat) / 25) [(2, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-18128 : Rat) / 25) [(2, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((36256 : Rat) / 25) [(3, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-18128 : Rat) / 25) [(3, 2), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 76 for generator 28. -/
theorem rs_R010_ueqv_R010YY_partial_28_0076_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_28_0076
        rs_R010_ueqv_R010YY_generator_28_0000_0086 =
      rs_R010_ueqv_R010YY_partial_28_0076 := by
  native_decide

/-- Coefficient term 77 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YY_coefficient_28_0077 : Poly :=
[
  term ((-10124 : Rat) / 25) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 77 for generator 28. -/
def rs_R010_ueqv_R010YY_partial_28_0077 : Poly :=
[
  term ((20248 : Rat) / 25) [(0, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10124 : Rat) / 25) [(0, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((20248 : Rat) / 25) [(1, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-10124 : Rat) / 25) [(1, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-20248 : Rat) / 25) [(2, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((10124 : Rat) / 25) [(2, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-20248 : Rat) / 25) [(3, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((10124 : Rat) / 25) [(3, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 77 for generator 28. -/
theorem rs_R010_ueqv_R010YY_partial_28_0077_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_28_0077
        rs_R010_ueqv_R010YY_generator_28_0000_0086 =
      rs_R010_ueqv_R010YY_partial_28_0077 := by
  native_decide

/-- Coefficient term 78 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YY_coefficient_28_0078 : Poly :=
[
  term ((62624 : Rat) / 25) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 78 for generator 28. -/
def rs_R010_ueqv_R010YY_partial_28_0078 : Poly :=
[
  term ((-125248 : Rat) / 25) [(0, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((62624 : Rat) / 25) [(0, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-125248 : Rat) / 25) [(1, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((62624 : Rat) / 25) [(1, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((125248 : Rat) / 25) [(2, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-62624 : Rat) / 25) [(2, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((125248 : Rat) / 25) [(3, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-62624 : Rat) / 25) [(3, 2), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 78 for generator 28. -/
theorem rs_R010_ueqv_R010YY_partial_28_0078_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_28_0078
        rs_R010_ueqv_R010YY_generator_28_0000_0086 =
      rs_R010_ueqv_R010YY_partial_28_0078 := by
  native_decide

/-- Coefficient term 79 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YY_coefficient_28_0079 : Poly :=
[
  term ((1484 : Rat) / 25) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 79 for generator 28. -/
def rs_R010_ueqv_R010YY_partial_28_0079 : Poly :=
[
  term ((-2968 : Rat) / 25) [(0, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((1484 : Rat) / 25) [(0, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2968 : Rat) / 25) [(1, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((1484 : Rat) / 25) [(1, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((2968 : Rat) / 25) [(2, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1484 : Rat) / 25) [(2, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((2968 : Rat) / 25) [(3, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1484 : Rat) / 25) [(3, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 79 for generator 28. -/
theorem rs_R010_ueqv_R010YY_partial_28_0079_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_28_0079
        rs_R010_ueqv_R010YY_generator_28_0000_0086 =
      rs_R010_ueqv_R010YY_partial_28_0079 := by
  native_decide

/-- Coefficient term 80 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YY_coefficient_28_0080 : Poly :=
[
  term ((1436 : Rat) / 5) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 80 for generator 28. -/
def rs_R010_ueqv_R010YY_partial_28_0080 : Poly :=
[
  term ((-2872 : Rat) / 5) [(0, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1436 : Rat) / 5) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((-2872 : Rat) / 5) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term ((1436 : Rat) / 5) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((2872 : Rat) / 5) [(2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1436 : Rat) / 5) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((2872 : Rat) / 5) [(3, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1436 : Rat) / 5) [(3, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 80 for generator 28. -/
theorem rs_R010_ueqv_R010YY_partial_28_0080_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_28_0080
        rs_R010_ueqv_R010YY_generator_28_0000_0086 =
      rs_R010_ueqv_R010YY_partial_28_0080 := by
  native_decide

/-- Coefficient term 81 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YY_coefficient_28_0081 : Poly :=
[
  term ((-46296 : Rat) / 25) [(11, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 81 for generator 28. -/
def rs_R010_ueqv_R010YY_partial_28_0081 : Poly :=
[
  term ((92592 : Rat) / 25) [(0, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-46296 : Rat) / 25) [(0, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((92592 : Rat) / 25) [(1, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-46296 : Rat) / 25) [(1, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-92592 : Rat) / 25) [(2, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((46296 : Rat) / 25) [(2, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-92592 : Rat) / 25) [(3, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((46296 : Rat) / 25) [(3, 2), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 81 for generator 28. -/
theorem rs_R010_ueqv_R010YY_partial_28_0081_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_28_0081
        rs_R010_ueqv_R010YY_generator_28_0000_0086 =
      rs_R010_ueqv_R010YY_partial_28_0081 := by
  native_decide

/-- Coefficient term 82 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YY_coefficient_28_0082 : Poly :=
[
  term ((3524 : Rat) / 25) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 82 for generator 28. -/
def rs_R010_ueqv_R010YY_partial_28_0082 : Poly :=
[
  term ((-7048 : Rat) / 25) [(0, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((3524 : Rat) / 25) [(0, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7048 : Rat) / 25) [(1, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((3524 : Rat) / 25) [(1, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((7048 : Rat) / 25) [(2, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3524 : Rat) / 25) [(2, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((7048 : Rat) / 25) [(3, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3524 : Rat) / 25) [(3, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 82 for generator 28. -/
theorem rs_R010_ueqv_R010YY_partial_28_0082_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_28_0082
        rs_R010_ueqv_R010YY_generator_28_0000_0086 =
      rs_R010_ueqv_R010YY_partial_28_0082 := by
  native_decide

/-- Coefficient term 83 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YY_coefficient_28_0083 : Poly :=
[
  term ((-6176 : Rat) / 25) [(13, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 83 for generator 28. -/
def rs_R010_ueqv_R010YY_partial_28_0083 : Poly :=
[
  term ((12352 : Rat) / 25) [(0, 1), (13, 1), (14, 3), (15, 1), (16, 1)],
  term ((-6176 : Rat) / 25) [(0, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((12352 : Rat) / 25) [(1, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-6176 : Rat) / 25) [(1, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-12352 : Rat) / 25) [(2, 1), (13, 1), (14, 3), (15, 1), (16, 1)],
  term ((6176 : Rat) / 25) [(2, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-12352 : Rat) / 25) [(3, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((6176 : Rat) / 25) [(3, 2), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 83 for generator 28. -/
theorem rs_R010_ueqv_R010YY_partial_28_0083_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_28_0083
        rs_R010_ueqv_R010YY_generator_28_0000_0086 =
      rs_R010_ueqv_R010YY_partial_28_0083 := by
  native_decide

/-- Coefficient term 84 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YY_coefficient_28_0084 : Poly :=
[
  term ((936 : Rat) / 5) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 84 for generator 28. -/
def rs_R010_ueqv_R010YY_partial_28_0084 : Poly :=
[
  term ((-1872 : Rat) / 5) [(0, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((936 : Rat) / 5) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1872 : Rat) / 5) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((936 : Rat) / 5) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((1872 : Rat) / 5) [(2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-936 : Rat) / 5) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((1872 : Rat) / 5) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-936 : Rat) / 5) [(3, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 84 for generator 28. -/
theorem rs_R010_ueqv_R010YY_partial_28_0084_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_28_0084
        rs_R010_ueqv_R010YY_generator_28_0000_0086 =
      rs_R010_ueqv_R010YY_partial_28_0084 := by
  native_decide

/-- Coefficient term 85 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YY_coefficient_28_0085 : Poly :=
[
  term ((-3088 : Rat) / 25) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 85 for generator 28. -/
def rs_R010_ueqv_R010YY_partial_28_0085 : Poly :=
[
  term ((6176 : Rat) / 25) [(0, 1), (14, 2), (15, 2), (16, 1)],
  term ((-3088 : Rat) / 25) [(0, 2), (14, 1), (15, 2), (16, 1)],
  term ((6176 : Rat) / 25) [(1, 1), (14, 1), (15, 3), (16, 1)],
  term ((-3088 : Rat) / 25) [(1, 2), (14, 1), (15, 2), (16, 1)],
  term ((-6176 : Rat) / 25) [(2, 1), (14, 2), (15, 2), (16, 1)],
  term ((3088 : Rat) / 25) [(2, 2), (14, 1), (15, 2), (16, 1)],
  term ((-6176 : Rat) / 25) [(3, 1), (14, 1), (15, 3), (16, 1)],
  term ((3088 : Rat) / 25) [(3, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 85 for generator 28. -/
theorem rs_R010_ueqv_R010YY_partial_28_0085_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_28_0085
        rs_R010_ueqv_R010YY_generator_28_0000_0086 =
      rs_R010_ueqv_R010YY_partial_28_0085 := by
  native_decide

/-- Coefficient term 86 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YY_coefficient_28_0086 : Poly :=
[
  term ((-78 : Rat) / 25) [(15, 2), (16, 1)]
]

/-- Partial product 86 for generator 28. -/
def rs_R010_ueqv_R010YY_partial_28_0086 : Poly :=
[
  term ((156 : Rat) / 25) [(0, 1), (14, 1), (15, 2), (16, 1)],
  term ((-78 : Rat) / 25) [(0, 2), (15, 2), (16, 1)],
  term ((156 : Rat) / 25) [(1, 1), (15, 3), (16, 1)],
  term ((-78 : Rat) / 25) [(1, 2), (15, 2), (16, 1)],
  term ((-156 : Rat) / 25) [(2, 1), (14, 1), (15, 2), (16, 1)],
  term ((78 : Rat) / 25) [(2, 2), (15, 2), (16, 1)],
  term ((-156 : Rat) / 25) [(3, 1), (15, 3), (16, 1)],
  term ((78 : Rat) / 25) [(3, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 86 for generator 28. -/
theorem rs_R010_ueqv_R010YY_partial_28_0086_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_28_0086
        rs_R010_ueqv_R010YY_generator_28_0000_0086 =
      rs_R010_ueqv_R010YY_partial_28_0086 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010YY_partials_28_0000_0086 : List Poly :=
[
  rs_R010_ueqv_R010YY_partial_28_0000,
  rs_R010_ueqv_R010YY_partial_28_0001,
  rs_R010_ueqv_R010YY_partial_28_0002,
  rs_R010_ueqv_R010YY_partial_28_0003,
  rs_R010_ueqv_R010YY_partial_28_0004,
  rs_R010_ueqv_R010YY_partial_28_0005,
  rs_R010_ueqv_R010YY_partial_28_0006,
  rs_R010_ueqv_R010YY_partial_28_0007,
  rs_R010_ueqv_R010YY_partial_28_0008,
  rs_R010_ueqv_R010YY_partial_28_0009,
  rs_R010_ueqv_R010YY_partial_28_0010,
  rs_R010_ueqv_R010YY_partial_28_0011,
  rs_R010_ueqv_R010YY_partial_28_0012,
  rs_R010_ueqv_R010YY_partial_28_0013,
  rs_R010_ueqv_R010YY_partial_28_0014,
  rs_R010_ueqv_R010YY_partial_28_0015,
  rs_R010_ueqv_R010YY_partial_28_0016,
  rs_R010_ueqv_R010YY_partial_28_0017,
  rs_R010_ueqv_R010YY_partial_28_0018,
  rs_R010_ueqv_R010YY_partial_28_0019,
  rs_R010_ueqv_R010YY_partial_28_0020,
  rs_R010_ueqv_R010YY_partial_28_0021,
  rs_R010_ueqv_R010YY_partial_28_0022,
  rs_R010_ueqv_R010YY_partial_28_0023,
  rs_R010_ueqv_R010YY_partial_28_0024,
  rs_R010_ueqv_R010YY_partial_28_0025,
  rs_R010_ueqv_R010YY_partial_28_0026,
  rs_R010_ueqv_R010YY_partial_28_0027,
  rs_R010_ueqv_R010YY_partial_28_0028,
  rs_R010_ueqv_R010YY_partial_28_0029,
  rs_R010_ueqv_R010YY_partial_28_0030,
  rs_R010_ueqv_R010YY_partial_28_0031,
  rs_R010_ueqv_R010YY_partial_28_0032,
  rs_R010_ueqv_R010YY_partial_28_0033,
  rs_R010_ueqv_R010YY_partial_28_0034,
  rs_R010_ueqv_R010YY_partial_28_0035,
  rs_R010_ueqv_R010YY_partial_28_0036,
  rs_R010_ueqv_R010YY_partial_28_0037,
  rs_R010_ueqv_R010YY_partial_28_0038,
  rs_R010_ueqv_R010YY_partial_28_0039,
  rs_R010_ueqv_R010YY_partial_28_0040,
  rs_R010_ueqv_R010YY_partial_28_0041,
  rs_R010_ueqv_R010YY_partial_28_0042,
  rs_R010_ueqv_R010YY_partial_28_0043,
  rs_R010_ueqv_R010YY_partial_28_0044,
  rs_R010_ueqv_R010YY_partial_28_0045,
  rs_R010_ueqv_R010YY_partial_28_0046,
  rs_R010_ueqv_R010YY_partial_28_0047,
  rs_R010_ueqv_R010YY_partial_28_0048,
  rs_R010_ueqv_R010YY_partial_28_0049,
  rs_R010_ueqv_R010YY_partial_28_0050,
  rs_R010_ueqv_R010YY_partial_28_0051,
  rs_R010_ueqv_R010YY_partial_28_0052,
  rs_R010_ueqv_R010YY_partial_28_0053,
  rs_R010_ueqv_R010YY_partial_28_0054,
  rs_R010_ueqv_R010YY_partial_28_0055,
  rs_R010_ueqv_R010YY_partial_28_0056,
  rs_R010_ueqv_R010YY_partial_28_0057,
  rs_R010_ueqv_R010YY_partial_28_0058,
  rs_R010_ueqv_R010YY_partial_28_0059,
  rs_R010_ueqv_R010YY_partial_28_0060,
  rs_R010_ueqv_R010YY_partial_28_0061,
  rs_R010_ueqv_R010YY_partial_28_0062,
  rs_R010_ueqv_R010YY_partial_28_0063,
  rs_R010_ueqv_R010YY_partial_28_0064,
  rs_R010_ueqv_R010YY_partial_28_0065,
  rs_R010_ueqv_R010YY_partial_28_0066,
  rs_R010_ueqv_R010YY_partial_28_0067,
  rs_R010_ueqv_R010YY_partial_28_0068,
  rs_R010_ueqv_R010YY_partial_28_0069,
  rs_R010_ueqv_R010YY_partial_28_0070,
  rs_R010_ueqv_R010YY_partial_28_0071,
  rs_R010_ueqv_R010YY_partial_28_0072,
  rs_R010_ueqv_R010YY_partial_28_0073,
  rs_R010_ueqv_R010YY_partial_28_0074,
  rs_R010_ueqv_R010YY_partial_28_0075,
  rs_R010_ueqv_R010YY_partial_28_0076,
  rs_R010_ueqv_R010YY_partial_28_0077,
  rs_R010_ueqv_R010YY_partial_28_0078,
  rs_R010_ueqv_R010YY_partial_28_0079,
  rs_R010_ueqv_R010YY_partial_28_0080,
  rs_R010_ueqv_R010YY_partial_28_0081,
  rs_R010_ueqv_R010YY_partial_28_0082,
  rs_R010_ueqv_R010YY_partial_28_0083,
  rs_R010_ueqv_R010YY_partial_28_0084,
  rs_R010_ueqv_R010YY_partial_28_0085,
  rs_R010_ueqv_R010YY_partial_28_0086
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010YY_block_28_0000_0086 : Poly :=
[
  term ((-44032 : Rat) / 25) [(0, 1), (1, 1), (2, 1), (14, 1), (15, 1), (16, 1)],
  term ((22016 : Rat) / 25) [(0, 1), (1, 1), (2, 2), (15, 1), (16, 1)],
  term ((-44032 : Rat) / 25) [(0, 1), (1, 1), (3, 1), (15, 2), (16, 1)],
  term ((22016 : Rat) / 25) [(0, 1), (1, 1), (3, 2), (15, 1), (16, 1)],
  term ((22872 : Rat) / 25) [(0, 1), (1, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8416 : Rat) / 25) [(0, 1), (1, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((17488 : Rat) / 25) [(0, 1), (1, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-207728 : Rat) / 75) [(0, 1), (1, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((11504 : Rat) / 5) [(0, 1), (1, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((58144 : Rat) / 75) [(0, 1), (1, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((32 : Rat) / 3) [(0, 1), (1, 1), (7, 1), (14, 1), (16, 1)],
  term ((16 : Rat) / 3) [(0, 1), (1, 1), (7, 1), (14, 2), (16, 1)],
  term ((-19424 : Rat) / 25) [(0, 1), (1, 1), (7, 1), (15, 2), (16, 1)],
  term ((-42672 : Rat) / 25) [(0, 1), (1, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((-66392 : Rat) / 25) [(0, 1), (1, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-108672 : Rat) / 25) [(0, 1), (1, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((56128 : Rat) / 25) [(0, 1), (1, 1), (9, 1), (15, 2), (16, 1)],
  term ((15232 : Rat) / 25) [(0, 1), (1, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-92592 : Rat) / 25) [(0, 1), (1, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4232 : Rat) / 5) [(0, 1), (1, 1), (11, 1), (15, 2), (16, 1)],
  term ((170992 : Rat) / 25) [(0, 1), (1, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((23036 : Rat) / 25) [(0, 1), (1, 1), (14, 1), (15, 1), (16, 1)],
  term ((-29888 : Rat) / 25) [(0, 1), (1, 1), (14, 2), (15, 1), (16, 1)],
  term ((11504 : Rat) / 15) [(0, 1), (1, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((9712 : Rat) / 25) [(0, 1), (1, 2), (7, 1), (15, 1), (16, 1)],
  term ((-28064 : Rat) / 25) [(0, 1), (1, 2), (9, 1), (15, 1), (16, 1)],
  term ((2116 : Rat) / 5) [(0, 1), (1, 2), (11, 1), (15, 1), (16, 1)],
  term ((44032 : Rat) / 25) [(0, 1), (1, 2), (15, 2), (16, 1)],
  term ((-22016 : Rat) / 25) [(0, 1), (1, 3), (15, 1), (16, 1)],
  term ((19424 : Rat) / 25) [(0, 1), (2, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-56128 : Rat) / 25) [(0, 1), (2, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((4232 : Rat) / 5) [(0, 1), (2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9712 : Rat) / 25) [(0, 1), (2, 2), (7, 1), (15, 1), (16, 1)],
  term ((28064 : Rat) / 25) [(0, 1), (2, 2), (9, 1), (15, 1), (16, 1)],
  term ((-2116 : Rat) / 5) [(0, 1), (2, 2), (11, 1), (15, 1), (16, 1)],
  term ((-14072 : Rat) / 25) [(0, 1), (3, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(0, 1), (3, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(0, 1), (3, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(0, 1), (3, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((19424 : Rat) / 25) [(0, 1), (3, 1), (7, 1), (15, 2), (16, 1)],
  term ((18016 : Rat) / 25) [(0, 1), (3, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-56128 : Rat) / 25) [(0, 1), (3, 1), (9, 1), (15, 2), (16, 1)],
  term ((24584 : Rat) / 25) [(0, 1), (3, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((4232 : Rat) / 5) [(0, 1), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((-2584 : Rat) / 5) [(0, 1), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((4992 : Rat) / 25) [(0, 1), (3, 1), (14, 2), (15, 1), (16, 1)],
  term ((-9712 : Rat) / 25) [(0, 1), (3, 2), (7, 1), (15, 1), (16, 1)],
  term ((28064 : Rat) / 25) [(0, 1), (3, 2), (9, 1), (15, 1), (16, 1)],
  term ((-2116 : Rat) / 5) [(0, 1), (3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-5376 : Rat) / 25) [(0, 1), (4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((5376 : Rat) / 25) [(0, 1), (4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((5272 : Rat) / 25) [(0, 1), (4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7168 : Rat) / 25) [(0, 1), (5, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7168 : Rat) / 25) [(0, 1), (5, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((56128 : Rat) / 25) [(0, 1), (5, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((7168 : Rat) / 25) [(0, 1), (5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-112256 : Rat) / 25) [(0, 1), (5, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((7168 : Rat) / 25) [(0, 1), (5, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-28144 : Rat) / 25) [(0, 1), (5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-45744 : Rat) / 25) [(0, 1), (5, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((18472 : Rat) / 25) [(0, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((45608 : Rat) / 25) [(0, 1), (6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((432 : Rat) / 25) [(0, 1), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((4832 : Rat) / 25) [(0, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-13024 : Rat) / 25) [(0, 1), (6, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-6512 : Rat) / 25) [(0, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((31552 : Rat) / 25) [(0, 1), (7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((14336 : Rat) / 25) [(0, 1), (7, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((26912 : Rat) / 25) [(0, 1), (7, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-164048 : Rat) / 25) [(0, 1), (7, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term (-16 : Rat) [(0, 1), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((7168 : Rat) / 25) [(0, 1), (7, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(0, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((70912 : Rat) / 25) [(0, 1), (7, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-186224 : Rat) / 75) [(0, 1), (7, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-131152 : Rat) / 25) [(0, 1), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term (-8 : Rat) [(0, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term (16 : Rat) [(0, 1), (7, 1), (13, 1), (14, 2), (16, 1)],
  term ((-13544 : Rat) / 15) [(0, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((208 : Rat) / 25) [(0, 1), (7, 1), (14, 1), (15, 3), (16, 1)],
  term ((-81344 : Rat) / 75) [(0, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((65728 : Rat) / 25) [(0, 1), (7, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((255904 : Rat) / 75) [(0, 1), (7, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12976 : Rat) / 25) [(0, 1), (7, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((35984 : Rat) / 75) [(0, 1), (7, 2), (14, 1), (15, 2), (16, 1)],
  term ((8 : Rat) / 3) [(0, 1), (7, 2), (14, 1), (16, 1)],
  term ((-32 : Rat) / 3) [(0, 1), (7, 2), (14, 2), (16, 1)],
  term ((25952 : Rat) / 75) [(0, 1), (7, 3), (14, 1), (15, 1), (16, 1)],
  term ((-45568 : Rat) / 25) [(0, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-25768 : Rat) / 25) [(0, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((10144 : Rat) / 25) [(0, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-28672 : Rat) / 25) [(0, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((108672 : Rat) / 25) [(0, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((112256 : Rat) / 25) [(0, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-16112 : Rat) / 25) [(0, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-56128 : Rat) / 25) [(0, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-36256 : Rat) / 25) [(0, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((20248 : Rat) / 25) [(0, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-125248 : Rat) / 25) [(0, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2872 : Rat) / 5) [(0, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2968 : Rat) / 25) [(0, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((92592 : Rat) / 25) [(0, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1872 : Rat) / 5) [(0, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7048 : Rat) / 25) [(0, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((12352 : Rat) / 25) [(0, 1), (13, 1), (14, 3), (15, 1), (16, 1)],
  term ((156 : Rat) / 25) [(0, 1), (14, 1), (15, 2), (16, 1)],
  term ((6176 : Rat) / 25) [(0, 1), (14, 2), (15, 2), (16, 1)],
  term ((-11436 : Rat) / 25) [(0, 2), (1, 1), (4, 1), (15, 1), (16, 1)],
  term ((4208 : Rat) / 25) [(0, 2), (1, 1), (6, 1), (15, 1), (16, 1)],
  term ((-8744 : Rat) / 25) [(0, 2), (1, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((103864 : Rat) / 75) [(0, 2), (1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-5752 : Rat) / 5) [(0, 2), (1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-8 : Rat) / 3) [(0, 2), (1, 1), (7, 1), (14, 1), (16, 1)],
  term ((-29072 : Rat) / 75) [(0, 2), (1, 1), (7, 1), (15, 2), (16, 1)],
  term ((-16 : Rat) / 3) [(0, 2), (1, 1), (7, 1), (16, 1)],
  term ((21336 : Rat) / 25) [(0, 2), (1, 1), (7, 2), (15, 1), (16, 1)],
  term ((33196 : Rat) / 25) [(0, 2), (1, 1), (8, 1), (15, 1), (16, 1)],
  term ((54336 : Rat) / 25) [(0, 2), (1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-7616 : Rat) / 25) [(0, 2), (1, 1), (10, 1), (15, 1), (16, 1)],
  term ((46296 : Rat) / 25) [(0, 2), (1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-85496 : Rat) / 25) [(0, 2), (1, 1), (13, 1), (15, 2), (16, 1)],
  term ((58976 : Rat) / 25) [(0, 2), (1, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11518 : Rat) / 25) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term ((-5752 : Rat) / 15) [(0, 2), (1, 2), (7, 1), (15, 1), (16, 1)],
  term ((7036 : Rat) / 25) [(0, 2), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((-896 : Rat) / 25) [(0, 2), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(0, 2), (3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(0, 2), (3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-9008 : Rat) / 25) [(0, 2), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((-12292 : Rat) / 25) [(0, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-2496 : Rat) / 25) [(0, 2), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((1292 : Rat) / 5) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((2688 : Rat) / 25) [(0, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-2688 : Rat) / 25) [(0, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-2636 : Rat) / 25) [(0, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(0, 2), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(0, 2), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-28064 : Rat) / 25) [(0, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(0, 2), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((56128 : Rat) / 25) [(0, 2), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(0, 2), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((14072 : Rat) / 25) [(0, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((22872 : Rat) / 25) [(0, 2), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-9236 : Rat) / 25) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((-22804 : Rat) / 25) [(0, 2), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-216 : Rat) / 25) [(0, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-2416 : Rat) / 25) [(0, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((6512 : Rat) / 25) [(0, 2), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3256 : Rat) / 25) [(0, 2), (6, 1), (15, 2), (16, 1)],
  term ((-15776 : Rat) / 25) [(0, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-7168 : Rat) / 25) [(0, 2), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-13456 : Rat) / 25) [(0, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((82024 : Rat) / 25) [(0, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term (8 : Rat) [(0, 2), (7, 1), (9, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(0, 2), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(0, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-35456 : Rat) / 25) [(0, 2), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((93112 : Rat) / 75) [(0, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term (-8 : Rat) [(0, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((65576 : Rat) / 25) [(0, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term (4 : Rat) [(0, 2), (7, 1), (13, 1), (16, 1)],
  term ((-704 : Rat) / 3) [(0, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((6772 : Rat) / 15) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((-104 : Rat) / 25) [(0, 2), (7, 1), (15, 3), (16, 1)],
  term ((-32864 : Rat) / 25) [(0, 2), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-127952 : Rat) / 75) [(0, 2), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((6488 : Rat) / 25) [(0, 2), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 3) [(0, 2), (7, 2), (14, 1), (16, 1)],
  term ((-17992 : Rat) / 75) [(0, 2), (7, 2), (15, 2), (16, 1)],
  term ((-4 : Rat) / 3) [(0, 2), (7, 2), (16, 1)],
  term ((-12976 : Rat) / 75) [(0, 2), (7, 3), (15, 1), (16, 1)],
  term ((22784 : Rat) / 25) [(0, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((12884 : Rat) / 25) [(0, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-5072 : Rat) / 25) [(0, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((14336 : Rat) / 25) [(0, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-54336 : Rat) / 25) [(0, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-56128 : Rat) / 25) [(0, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((84192 : Rat) / 25) [(0, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((8056 : Rat) / 25) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((18128 : Rat) / 25) [(0, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-10124 : Rat) / 25) [(0, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((62624 : Rat) / 25) [(0, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-19676 : Rat) / 25) [(0, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1436 : Rat) / 5) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((-46296 : Rat) / 25) [(0, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((3524 : Rat) / 25) [(0, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6176 : Rat) / 25) [(0, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((936 : Rat) / 5) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-3088 : Rat) / 25) [(0, 2), (14, 1), (15, 2), (16, 1)],
  term ((-78 : Rat) / 25) [(0, 2), (15, 2), (16, 1)],
  term ((-22016 : Rat) / 25) [(0, 3), (1, 1), (15, 1), (16, 1)],
  term ((9712 : Rat) / 25) [(0, 3), (7, 1), (15, 1), (16, 1)],
  term ((-28064 : Rat) / 25) [(0, 3), (9, 1), (15, 1), (16, 1)],
  term ((2116 : Rat) / 5) [(0, 3), (11, 1), (15, 1), (16, 1)],
  term ((-22872 : Rat) / 25) [(1, 1), (2, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((8416 : Rat) / 25) [(1, 1), (2, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-17488 : Rat) / 25) [(1, 1), (2, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((207728 : Rat) / 75) [(1, 1), (2, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11504 : Rat) / 5) [(1, 1), (2, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-58144 : Rat) / 75) [(1, 1), (2, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((-32 : Rat) / 3) [(1, 1), (2, 1), (7, 1), (14, 1), (16, 1)],
  term ((-16 : Rat) / 3) [(1, 1), (2, 1), (7, 1), (14, 2), (16, 1)],
  term ((42672 : Rat) / 25) [(1, 1), (2, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((66392 : Rat) / 25) [(1, 1), (2, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((108672 : Rat) / 25) [(1, 1), (2, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-15232 : Rat) / 25) [(1, 1), (2, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((92592 : Rat) / 25) [(1, 1), (2, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-170992 : Rat) / 25) [(1, 1), (2, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-23036 : Rat) / 25) [(1, 1), (2, 1), (14, 1), (15, 1), (16, 1)],
  term ((29888 : Rat) / 25) [(1, 1), (2, 1), (14, 2), (15, 1), (16, 1)],
  term ((11436 : Rat) / 25) [(1, 1), (2, 2), (4, 1), (15, 1), (16, 1)],
  term ((-4208 : Rat) / 25) [(1, 1), (2, 2), (6, 1), (15, 1), (16, 1)],
  term ((8744 : Rat) / 25) [(1, 1), (2, 2), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-103864 : Rat) / 75) [(1, 1), (2, 2), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((5752 : Rat) / 5) [(1, 1), (2, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 3) [(1, 1), (2, 2), (7, 1), (14, 1), (16, 1)],
  term ((29072 : Rat) / 75) [(1, 1), (2, 2), (7, 1), (15, 2), (16, 1)],
  term ((16 : Rat) / 3) [(1, 1), (2, 2), (7, 1), (16, 1)],
  term ((-21336 : Rat) / 25) [(1, 1), (2, 2), (7, 2), (15, 1), (16, 1)],
  term ((-33196 : Rat) / 25) [(1, 1), (2, 2), (8, 1), (15, 1), (16, 1)],
  term ((-54336 : Rat) / 25) [(1, 1), (2, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((7616 : Rat) / 25) [(1, 1), (2, 2), (10, 1), (15, 1), (16, 1)],
  term ((-46296 : Rat) / 25) [(1, 1), (2, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((85496 : Rat) / 25) [(1, 1), (2, 2), (13, 1), (15, 2), (16, 1)],
  term ((-14944 : Rat) / 25) [(1, 1), (2, 2), (14, 1), (15, 1), (16, 1)],
  term ((11518 : Rat) / 25) [(1, 1), (2, 2), (15, 1), (16, 1)],
  term ((-36944 : Rat) / 25) [(1, 1), (3, 1), (4, 1), (15, 2), (16, 1)],
  term ((10208 : Rat) / 25) [(1, 1), (3, 1), (6, 1), (15, 2), (16, 1)],
  term ((-13904 : Rat) / 25) [(1, 1), (3, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((43696 : Rat) / 15) [(1, 1), (3, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-11504 : Rat) / 5) [(1, 1), (3, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-16 : Rat) / 3) [(1, 1), (3, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 3) [(1, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((-58144 : Rat) / 75) [(1, 1), (3, 1), (7, 1), (15, 3), (16, 1)],
  term ((42672 : Rat) / 25) [(1, 1), (3, 1), (7, 2), (15, 2), (16, 1)],
  term ((84408 : Rat) / 25) [(1, 1), (3, 1), (8, 1), (15, 2), (16, 1)],
  term ((108672 : Rat) / 25) [(1, 1), (3, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((9352 : Rat) / 25) [(1, 1), (3, 1), (10, 1), (15, 2), (16, 1)],
  term ((92592 : Rat) / 25) [(1, 1), (3, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-170992 : Rat) / 25) [(1, 1), (3, 1), (13, 1), (15, 3), (16, 1)],
  term ((6976 : Rat) / 5) [(1, 1), (3, 1), (14, 1), (15, 2), (16, 1)],
  term ((-35956 : Rat) / 25) [(1, 1), (3, 1), (15, 2), (16, 1)],
  term ((11436 : Rat) / 25) [(1, 1), (3, 2), (4, 1), (15, 1), (16, 1)],
  term ((-4208 : Rat) / 25) [(1, 1), (3, 2), (6, 1), (15, 1), (16, 1)],
  term ((8744 : Rat) / 25) [(1, 1), (3, 2), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-103864 : Rat) / 75) [(1, 1), (3, 2), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((5752 : Rat) / 5) [(1, 1), (3, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 3) [(1, 1), (3, 2), (7, 1), (14, 1), (16, 1)],
  term ((29072 : Rat) / 75) [(1, 1), (3, 2), (7, 1), (15, 2), (16, 1)],
  term ((16 : Rat) / 3) [(1, 1), (3, 2), (7, 1), (16, 1)],
  term ((-21336 : Rat) / 25) [(1, 1), (3, 2), (7, 2), (15, 1), (16, 1)],
  term ((-33196 : Rat) / 25) [(1, 1), (3, 2), (8, 1), (15, 1), (16, 1)],
  term ((-54336 : Rat) / 25) [(1, 1), (3, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((7616 : Rat) / 25) [(1, 1), (3, 2), (10, 1), (15, 1), (16, 1)],
  term ((-46296 : Rat) / 25) [(1, 1), (3, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((85496 : Rat) / 25) [(1, 1), (3, 2), (13, 1), (15, 2), (16, 1)],
  term ((-14944 : Rat) / 25) [(1, 1), (3, 2), (14, 1), (15, 1), (16, 1)],
  term ((11518 : Rat) / 25) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((-5376 : Rat) / 25) [(1, 1), (4, 1), (7, 1), (15, 2), (16, 1)],
  term ((5376 : Rat) / 25) [(1, 1), (4, 1), (9, 1), (15, 2), (16, 1)],
  term ((5272 : Rat) / 25) [(1, 1), (4, 1), (11, 1), (15, 2), (16, 1)],
  term ((-7168 : Rat) / 25) [(1, 1), (5, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-7168 : Rat) / 25) [(1, 1), (5, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((56128 : Rat) / 25) [(1, 1), (5, 1), (8, 1), (15, 2), (16, 1)],
  term ((7168 : Rat) / 25) [(1, 1), (5, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-112256 : Rat) / 25) [(1, 1), (5, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((7168 : Rat) / 25) [(1, 1), (5, 1), (9, 2), (15, 2), (16, 1)],
  term ((-28144 : Rat) / 25) [(1, 1), (5, 1), (10, 1), (15, 2), (16, 1)],
  term ((-45744 : Rat) / 25) [(1, 1), (5, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((18472 : Rat) / 25) [(1, 1), (5, 1), (15, 2), (16, 1)],
  term ((45608 : Rat) / 25) [(1, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((432 : Rat) / 25) [(1, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((4832 : Rat) / 25) [(1, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((-13024 : Rat) / 25) [(1, 1), (6, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-6512 : Rat) / 25) [(1, 1), (6, 1), (15, 3), (16, 1)],
  term ((31552 : Rat) / 25) [(1, 1), (7, 1), (8, 1), (15, 2), (16, 1)],
  term ((14336 : Rat) / 25) [(1, 1), (7, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((26912 : Rat) / 25) [(1, 1), (7, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term (-16 : Rat) [(1, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-164048 : Rat) / 25) [(1, 1), (7, 1), (9, 1), (15, 3), (16, 1)],
  term ((7168 : Rat) / 25) [(1, 1), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((-3584 : Rat) / 25) [(1, 1), (7, 1), (10, 1), (15, 2), (16, 1)],
  term ((70912 : Rat) / 25) [(1, 1), (7, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-186224 : Rat) / 75) [(1, 1), (7, 1), (11, 1), (15, 3), (16, 1)],
  term (16 : Rat) [(1, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-131152 : Rat) / 25) [(1, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((-81344 : Rat) / 75) [(1, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((-13544 : Rat) / 15) [(1, 1), (7, 1), (15, 2), (16, 1)],
  term ((208 : Rat) / 25) [(1, 1), (7, 1), (15, 4), (16, 1)],
  term ((65728 : Rat) / 25) [(1, 1), (7, 2), (9, 1), (15, 2), (16, 1)],
  term ((255904 : Rat) / 75) [(1, 1), (7, 2), (11, 1), (15, 2), (16, 1)],
  term ((-12976 : Rat) / 25) [(1, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((-32 : Rat) / 3) [(1, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 3) [(1, 1), (7, 2), (15, 1), (16, 1)],
  term ((35984 : Rat) / 75) [(1, 1), (7, 2), (15, 3), (16, 1)],
  term ((25952 : Rat) / 75) [(1, 1), (7, 3), (15, 2), (16, 1)],
  term ((-45568 : Rat) / 25) [(1, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-25768 : Rat) / 25) [(1, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((10144 : Rat) / 25) [(1, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((-28672 : Rat) / 25) [(1, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((108672 : Rat) / 25) [(1, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((112256 : Rat) / 25) [(1, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((-56128 : Rat) / 25) [(1, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-16112 : Rat) / 25) [(1, 1), (9, 1), (15, 2), (16, 1)],
  term ((-36256 : Rat) / 25) [(1, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((20248 : Rat) / 25) [(1, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-125248 : Rat) / 25) [(1, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-2968 : Rat) / 25) [(1, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2872 : Rat) / 5) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term ((92592 : Rat) / 25) [(1, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-7048 : Rat) / 25) [(1, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((12352 : Rat) / 25) [(1, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-1872 : Rat) / 5) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((6176 : Rat) / 25) [(1, 1), (14, 1), (15, 3), (16, 1)],
  term ((156 : Rat) / 25) [(1, 1), (15, 3), (16, 1)],
  term ((-11504 : Rat) / 15) [(1, 2), (2, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((5752 : Rat) / 15) [(1, 2), (2, 2), (7, 1), (15, 1), (16, 1)],
  term ((7036 : Rat) / 25) [(1, 2), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((-896 : Rat) / 25) [(1, 2), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(1, 2), (3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(1, 2), (3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-11504 : Rat) / 15) [(1, 2), (3, 1), (7, 1), (15, 2), (16, 1)],
  term ((-9008 : Rat) / 25) [(1, 2), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((-12292 : Rat) / 25) [(1, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-2496 : Rat) / 25) [(1, 2), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((1292 : Rat) / 5) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((5752 : Rat) / 15) [(1, 2), (3, 2), (7, 1), (15, 1), (16, 1)],
  term ((2688 : Rat) / 25) [(1, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-2688 : Rat) / 25) [(1, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-2636 : Rat) / 25) [(1, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((22872 : Rat) / 25) [(1, 2), (4, 1), (15, 2), (16, 1)],
  term ((3584 : Rat) / 25) [(1, 2), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(1, 2), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-28064 : Rat) / 25) [(1, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(1, 2), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((56128 : Rat) / 25) [(1, 2), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(1, 2), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((14072 : Rat) / 25) [(1, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((22872 : Rat) / 25) [(1, 2), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-9236 : Rat) / 25) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((-22804 : Rat) / 25) [(1, 2), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-216 : Rat) / 25) [(1, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-2416 : Rat) / 25) [(1, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((6512 : Rat) / 25) [(1, 2), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1032 : Rat) / 5) [(1, 2), (6, 1), (15, 2), (16, 1)],
  term ((-15776 : Rat) / 25) [(1, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-7168 : Rat) / 25) [(1, 2), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-13456 : Rat) / 25) [(1, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((99512 : Rat) / 25) [(1, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term (8 : Rat) [(1, 2), (7, 1), (9, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(1, 2), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(1, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-35456 : Rat) / 25) [(1, 2), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-114616 : Rat) / 75) [(1, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term (-8 : Rat) [(1, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((123096 : Rat) / 25) [(1, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term (4 : Rat) [(1, 2), (7, 1), (13, 1), (16, 1)],
  term ((41072 : Rat) / 75) [(1, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((6932 : Rat) / 15) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((57832 : Rat) / 75) [(1, 2), (7, 1), (15, 3), (16, 1)],
  term ((-32864 : Rat) / 25) [(1, 2), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-127952 : Rat) / 75) [(1, 2), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((6488 : Rat) / 25) [(1, 2), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 3) [(1, 2), (7, 2), (14, 1), (16, 1)],
  term ((-146008 : Rat) / 75) [(1, 2), (7, 2), (15, 2), (16, 1)],
  term ((-4 : Rat) / 3) [(1, 2), (7, 2), (16, 1)],
  term ((-12976 : Rat) / 75) [(1, 2), (7, 3), (15, 1), (16, 1)],
  term ((22784 : Rat) / 25) [(1, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((12884 : Rat) / 25) [(1, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-5072 : Rat) / 25) [(1, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-66392 : Rat) / 25) [(1, 2), (8, 1), (15, 2), (16, 1)],
  term ((14336 : Rat) / 25) [(1, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-54336 : Rat) / 25) [(1, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term (-6592 : Rat) [(1, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((28064 : Rat) / 25) [(1, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((8056 : Rat) / 25) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((18128 : Rat) / 25) [(1, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-10124 : Rat) / 25) [(1, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((15232 : Rat) / 25) [(1, 2), (10, 1), (15, 2), (16, 1)],
  term ((-29968 : Rat) / 25) [(1, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((1484 : Rat) / 25) [(1, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1436 : Rat) / 5) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-46296 : Rat) / 25) [(1, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((3524 : Rat) / 25) [(1, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6176 : Rat) / 25) [(1, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((936 : Rat) / 5) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((170992 : Rat) / 25) [(1, 2), (13, 1), (15, 3), (16, 1)],
  term ((-32976 : Rat) / 25) [(1, 2), (14, 1), (15, 2), (16, 1)],
  term ((22958 : Rat) / 25) [(1, 2), (15, 2), (16, 1)],
  term ((-11436 : Rat) / 25) [(1, 3), (4, 1), (15, 1), (16, 1)],
  term ((4208 : Rat) / 25) [(1, 3), (6, 1), (15, 1), (16, 1)],
  term ((-8744 : Rat) / 25) [(1, 3), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((103864 : Rat) / 75) [(1, 3), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-5752 : Rat) / 5) [(1, 3), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-8 : Rat) / 3) [(1, 3), (7, 1), (14, 1), (16, 1)],
  term ((28448 : Rat) / 75) [(1, 3), (7, 1), (15, 2), (16, 1)],
  term ((-16 : Rat) / 3) [(1, 3), (7, 1), (16, 1)],
  term ((21336 : Rat) / 25) [(1, 3), (7, 2), (15, 1), (16, 1)],
  term ((33196 : Rat) / 25) [(1, 3), (8, 1), (15, 1), (16, 1)],
  term ((54336 : Rat) / 25) [(1, 3), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-7616 : Rat) / 25) [(1, 3), (10, 1), (15, 1), (16, 1)],
  term ((46296 : Rat) / 25) [(1, 3), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-85496 : Rat) / 25) [(1, 3), (13, 1), (15, 2), (16, 1)],
  term ((14944 : Rat) / 25) [(1, 3), (14, 1), (15, 1), (16, 1)],
  term ((-11518 : Rat) / 25) [(1, 3), (15, 1), (16, 1)],
  term ((-5752 : Rat) / 15) [(1, 4), (7, 1), (15, 1), (16, 1)],
  term ((14072 : Rat) / 25) [(2, 1), (3, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(2, 1), (3, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(2, 1), (3, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(2, 1), (3, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-18016 : Rat) / 25) [(2, 1), (3, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-24584 : Rat) / 25) [(2, 1), (3, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((2584 : Rat) / 5) [(2, 1), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4992 : Rat) / 25) [(2, 1), (3, 1), (14, 2), (15, 1), (16, 1)],
  term ((5376 : Rat) / 25) [(2, 1), (4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5376 : Rat) / 25) [(2, 1), (4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5272 : Rat) / 25) [(2, 1), (4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((7168 : Rat) / 25) [(2, 1), (5, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((7168 : Rat) / 25) [(2, 1), (5, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-56128 : Rat) / 25) [(2, 1), (5, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7168 : Rat) / 25) [(2, 1), (5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((112256 : Rat) / 25) [(2, 1), (5, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7168 : Rat) / 25) [(2, 1), (5, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((28144 : Rat) / 25) [(2, 1), (5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((45744 : Rat) / 25) [(2, 1), (5, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-18472 : Rat) / 25) [(2, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-45608 : Rat) / 25) [(2, 1), (6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-432 : Rat) / 25) [(2, 1), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4832 : Rat) / 25) [(2, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((13024 : Rat) / 25) [(2, 1), (6, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((6512 : Rat) / 25) [(2, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-31552 : Rat) / 25) [(2, 1), (7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-14336 : Rat) / 25) [(2, 1), (7, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-26912 : Rat) / 25) [(2, 1), (7, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((164048 : Rat) / 25) [(2, 1), (7, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term (16 : Rat) [(2, 1), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((-7168 : Rat) / 25) [(2, 1), (7, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(2, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-70912 : Rat) / 25) [(2, 1), (7, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((186224 : Rat) / 75) [(2, 1), (7, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((131152 : Rat) / 25) [(2, 1), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term (8 : Rat) [(2, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term (-16 : Rat) [(2, 1), (7, 1), (13, 1), (14, 2), (16, 1)],
  term ((13544 : Rat) / 15) [(2, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-208 : Rat) / 25) [(2, 1), (7, 1), (14, 1), (15, 3), (16, 1)],
  term ((81344 : Rat) / 75) [(2, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-65728 : Rat) / 25) [(2, 1), (7, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-255904 : Rat) / 75) [(2, 1), (7, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((12976 : Rat) / 25) [(2, 1), (7, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-35984 : Rat) / 75) [(2, 1), (7, 2), (14, 1), (15, 2), (16, 1)],
  term ((-8 : Rat) / 3) [(2, 1), (7, 2), (14, 1), (16, 1)],
  term ((32 : Rat) / 3) [(2, 1), (7, 2), (14, 2), (16, 1)],
  term ((-25952 : Rat) / 75) [(2, 1), (7, 3), (14, 1), (15, 1), (16, 1)],
  term ((45568 : Rat) / 25) [(2, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((25768 : Rat) / 25) [(2, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10144 : Rat) / 25) [(2, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((28672 : Rat) / 25) [(2, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-108672 : Rat) / 25) [(2, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-112256 : Rat) / 25) [(2, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((16112 : Rat) / 25) [(2, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((56128 : Rat) / 25) [(2, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((36256 : Rat) / 25) [(2, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-20248 : Rat) / 25) [(2, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((125248 : Rat) / 25) [(2, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((2872 : Rat) / 5) [(2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((2968 : Rat) / 25) [(2, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-92592 : Rat) / 25) [(2, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1872 : Rat) / 5) [(2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((7048 : Rat) / 25) [(2, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-12352 : Rat) / 25) [(2, 1), (13, 1), (14, 3), (15, 1), (16, 1)],
  term ((-156 : Rat) / 25) [(2, 1), (14, 1), (15, 2), (16, 1)],
  term ((-6176 : Rat) / 25) [(2, 1), (14, 2), (15, 2), (16, 1)],
  term ((-7036 : Rat) / 25) [(2, 2), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((896 : Rat) / 25) [(2, 2), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(2, 2), (3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(2, 2), (3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((9008 : Rat) / 25) [(2, 2), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((12292 : Rat) / 25) [(2, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((2496 : Rat) / 25) [(2, 2), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1292 : Rat) / 5) [(2, 2), (3, 1), (15, 1), (16, 1)],
  term ((-2688 : Rat) / 25) [(2, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((2688 : Rat) / 25) [(2, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((2636 : Rat) / 25) [(2, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(2, 2), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(2, 2), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((28064 : Rat) / 25) [(2, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(2, 2), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-56128 : Rat) / 25) [(2, 2), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(2, 2), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-14072 : Rat) / 25) [(2, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-22872 : Rat) / 25) [(2, 2), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((9236 : Rat) / 25) [(2, 2), (5, 1), (15, 1), (16, 1)],
  term ((22804 : Rat) / 25) [(2, 2), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((216 : Rat) / 25) [(2, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((2416 : Rat) / 25) [(2, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-6512 : Rat) / 25) [(2, 2), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3256 : Rat) / 25) [(2, 2), (6, 1), (15, 2), (16, 1)],
  term ((15776 : Rat) / 25) [(2, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((7168 : Rat) / 25) [(2, 2), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((13456 : Rat) / 25) [(2, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-82024 : Rat) / 25) [(2, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term (-8 : Rat) [(2, 2), (7, 1), (9, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(2, 2), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(2, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((35456 : Rat) / 25) [(2, 2), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-93112 : Rat) / 75) [(2, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term (8 : Rat) [(2, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-65576 : Rat) / 25) [(2, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term (-4 : Rat) [(2, 2), (7, 1), (13, 1), (16, 1)],
  term ((-40672 : Rat) / 75) [(2, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6772 : Rat) / 15) [(2, 2), (7, 1), (15, 1), (16, 1)],
  term ((104 : Rat) / 25) [(2, 2), (7, 1), (15, 3), (16, 1)],
  term ((32864 : Rat) / 25) [(2, 2), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((127952 : Rat) / 75) [(2, 2), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-6488 : Rat) / 25) [(2, 2), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 3) [(2, 2), (7, 2), (14, 1), (16, 1)],
  term ((17992 : Rat) / 75) [(2, 2), (7, 2), (15, 2), (16, 1)],
  term ((4 : Rat) / 3) [(2, 2), (7, 2), (16, 1)],
  term ((12976 : Rat) / 75) [(2, 2), (7, 3), (15, 1), (16, 1)],
  term ((-22784 : Rat) / 25) [(2, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-12884 : Rat) / 25) [(2, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((5072 : Rat) / 25) [(2, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-14336 : Rat) / 25) [(2, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((54336 : Rat) / 25) [(2, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((56128 : Rat) / 25) [(2, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-28064 : Rat) / 25) [(2, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8056 : Rat) / 25) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((-18128 : Rat) / 25) [(2, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((10124 : Rat) / 25) [(2, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-62624 : Rat) / 25) [(2, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1484 : Rat) / 25) [(2, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1436 : Rat) / 5) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((46296 : Rat) / 25) [(2, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-3524 : Rat) / 25) [(2, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((6176 : Rat) / 25) [(2, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-936 : Rat) / 5) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((3088 : Rat) / 25) [(2, 2), (14, 1), (15, 2), (16, 1)],
  term ((78 : Rat) / 25) [(2, 2), (15, 2), (16, 1)],
  term ((5376 : Rat) / 25) [(3, 1), (4, 1), (7, 1), (15, 2), (16, 1)],
  term ((-5376 : Rat) / 25) [(3, 1), (4, 1), (9, 1), (15, 2), (16, 1)],
  term ((-5272 : Rat) / 25) [(3, 1), (4, 1), (11, 1), (15, 2), (16, 1)],
  term ((7168 : Rat) / 25) [(3, 1), (5, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((7168 : Rat) / 25) [(3, 1), (5, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-56128 : Rat) / 25) [(3, 1), (5, 1), (8, 1), (15, 2), (16, 1)],
  term ((-7168 : Rat) / 25) [(3, 1), (5, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((112256 : Rat) / 25) [(3, 1), (5, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-7168 : Rat) / 25) [(3, 1), (5, 1), (9, 2), (15, 2), (16, 1)],
  term ((28144 : Rat) / 25) [(3, 1), (5, 1), (10, 1), (15, 2), (16, 1)],
  term ((45744 : Rat) / 25) [(3, 1), (5, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-18472 : Rat) / 25) [(3, 1), (5, 1), (15, 2), (16, 1)],
  term ((-45608 : Rat) / 25) [(3, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((-432 : Rat) / 25) [(3, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((-4832 : Rat) / 25) [(3, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((13024 : Rat) / 25) [(3, 1), (6, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((6512 : Rat) / 25) [(3, 1), (6, 1), (15, 3), (16, 1)],
  term ((-31552 : Rat) / 25) [(3, 1), (7, 1), (8, 1), (15, 2), (16, 1)],
  term ((-14336 : Rat) / 25) [(3, 1), (7, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-26912 : Rat) / 25) [(3, 1), (7, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term (16 : Rat) [(3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((164048 : Rat) / 25) [(3, 1), (7, 1), (9, 1), (15, 3), (16, 1)],
  term ((-7168 : Rat) / 25) [(3, 1), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((3584 : Rat) / 25) [(3, 1), (7, 1), (10, 1), (15, 2), (16, 1)],
  term ((-70912 : Rat) / 25) [(3, 1), (7, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((186224 : Rat) / 75) [(3, 1), (7, 1), (11, 1), (15, 3), (16, 1)],
  term (-16 : Rat) [(3, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((131152 : Rat) / 25) [(3, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((81344 : Rat) / 75) [(3, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((13544 : Rat) / 15) [(3, 1), (7, 1), (15, 2), (16, 1)],
  term ((-208 : Rat) / 25) [(3, 1), (7, 1), (15, 4), (16, 1)],
  term ((-65728 : Rat) / 25) [(3, 1), (7, 2), (9, 1), (15, 2), (16, 1)],
  term ((-255904 : Rat) / 75) [(3, 1), (7, 2), (11, 1), (15, 2), (16, 1)],
  term ((12976 : Rat) / 25) [(3, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((32 : Rat) / 3) [(3, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((-8 : Rat) / 3) [(3, 1), (7, 2), (15, 1), (16, 1)],
  term ((-35984 : Rat) / 75) [(3, 1), (7, 2), (15, 3), (16, 1)],
  term ((-25952 : Rat) / 75) [(3, 1), (7, 3), (15, 2), (16, 1)],
  term ((45568 : Rat) / 25) [(3, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((25768 : Rat) / 25) [(3, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-10144 : Rat) / 25) [(3, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((28672 : Rat) / 25) [(3, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-108672 : Rat) / 25) [(3, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-112256 : Rat) / 25) [(3, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((56128 : Rat) / 25) [(3, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((16112 : Rat) / 25) [(3, 1), (9, 1), (15, 2), (16, 1)],
  term ((36256 : Rat) / 25) [(3, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-20248 : Rat) / 25) [(3, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((125248 : Rat) / 25) [(3, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((2968 : Rat) / 25) [(3, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((2872 : Rat) / 5) [(3, 1), (11, 1), (15, 2), (16, 1)],
  term ((-92592 : Rat) / 25) [(3, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((7048 : Rat) / 25) [(3, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-12352 : Rat) / 25) [(3, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((1872 : Rat) / 5) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-6176 : Rat) / 25) [(3, 1), (14, 1), (15, 3), (16, 1)],
  term ((-156 : Rat) / 25) [(3, 1), (15, 3), (16, 1)],
  term ((-2688 : Rat) / 25) [(3, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((2688 : Rat) / 25) [(3, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((2636 : Rat) / 25) [(3, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((14072 : Rat) / 25) [(3, 2), (4, 1), (15, 2), (16, 1)],
  term ((-3584 : Rat) / 25) [(3, 2), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(3, 2), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((28064 : Rat) / 25) [(3, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(3, 2), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-56128 : Rat) / 25) [(3, 2), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(3, 2), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-14072 : Rat) / 25) [(3, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-22872 : Rat) / 25) [(3, 2), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((9236 : Rat) / 25) [(3, 2), (5, 1), (15, 1), (16, 1)],
  term ((22804 : Rat) / 25) [(3, 2), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((216 : Rat) / 25) [(3, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((2416 : Rat) / 25) [(3, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-6512 : Rat) / 25) [(3, 2), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5048 : Rat) / 25) [(3, 2), (6, 1), (15, 2), (16, 1)],
  term ((15776 : Rat) / 25) [(3, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((7168 : Rat) / 25) [(3, 2), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((13456 : Rat) / 25) [(3, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-85608 : Rat) / 25) [(3, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term (-8 : Rat) [(3, 2), (7, 1), (9, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(3, 2), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(3, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((35456 : Rat) / 25) [(3, 2), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-103864 : Rat) / 75) [(3, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term (8 : Rat) [(3, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-65576 : Rat) / 25) [(3, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term (-4 : Rat) [(3, 2), (7, 1), (13, 1), (16, 1)],
  term ((-40672 : Rat) / 75) [(3, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6772 : Rat) / 15) [(3, 2), (7, 1), (15, 1), (16, 1)],
  term ((104 : Rat) / 25) [(3, 2), (7, 1), (15, 3), (16, 1)],
  term ((32864 : Rat) / 25) [(3, 2), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((127952 : Rat) / 75) [(3, 2), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-6488 : Rat) / 25) [(3, 2), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 3) [(3, 2), (7, 2), (14, 1), (16, 1)],
  term ((17992 : Rat) / 75) [(3, 2), (7, 2), (15, 2), (16, 1)],
  term ((4 : Rat) / 3) [(3, 2), (7, 2), (16, 1)],
  term ((12976 : Rat) / 75) [(3, 2), (7, 3), (15, 1), (16, 1)],
  term ((-22784 : Rat) / 25) [(3, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-12884 : Rat) / 25) [(3, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((5072 : Rat) / 25) [(3, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-18016 : Rat) / 25) [(3, 2), (8, 1), (15, 2), (16, 1)],
  term ((-14336 : Rat) / 25) [(3, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((54336 : Rat) / 25) [(3, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((56128 : Rat) / 25) [(3, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-28064 : Rat) / 25) [(3, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8056 : Rat) / 25) [(3, 2), (9, 1), (15, 1), (16, 1)],
  term ((-18128 : Rat) / 25) [(3, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((10124 : Rat) / 25) [(3, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-24584 : Rat) / 25) [(3, 2), (10, 1), (15, 2), (16, 1)],
  term ((-62624 : Rat) / 25) [(3, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1484 : Rat) / 25) [(3, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1436 : Rat) / 5) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((46296 : Rat) / 25) [(3, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-3524 : Rat) / 25) [(3, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((6176 : Rat) / 25) [(3, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-936 : Rat) / 5) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1904 : Rat) / 25) [(3, 2), (14, 1), (15, 2), (16, 1)],
  term ((12998 : Rat) / 25) [(3, 2), (15, 2), (16, 1)],
  term ((-7036 : Rat) / 25) [(3, 3), (4, 1), (15, 1), (16, 1)],
  term ((896 : Rat) / 25) [(3, 3), (6, 1), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(3, 3), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(3, 3), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((9008 : Rat) / 25) [(3, 3), (8, 1), (15, 1), (16, 1)],
  term ((12292 : Rat) / 25) [(3, 3), (10, 1), (15, 1), (16, 1)],
  term ((2496 : Rat) / 25) [(3, 3), (14, 1), (15, 1), (16, 1)],
  term ((-1292 : Rat) / 5) [(3, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 28, terms 0 through 86. -/
theorem rs_R010_ueqv_R010YY_block_28_0000_0086_valid :
    checkProductSumEq rs_R010_ueqv_R010YY_partials_28_0000_0086
      rs_R010_ueqv_R010YY_block_28_0000_0086 = true := by
  native_decide

end R010UeqvR010YYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
