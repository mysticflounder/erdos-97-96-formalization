/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010YY, term block 7:0-60

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010YYTermShards

/-- Generator polynomial 7 for relaxed split surplus certificate `R010:u=v:R010YY`. -/
def rs_R010_ueqv_R010YY_generator_07_0000_0060 : Poly :=
[
  term (1 : Rat) [],
  term (-2 : Rat) [(0, 1)],
  term (2 : Rat) [(0, 1), (2, 1)],
  term (2 : Rat) [(1, 1), (3, 1)],
  term (-1 : Rat) [(2, 2)],
  term (-1 : Rat) [(3, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010YY_coefficient_07_0000 : Poly :=
[
  term ((-22016 : Rat) / 25) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 0 for generator 7. -/
def rs_R010_ueqv_R010YY_partial_07_0000 : Poly :=
[
  term ((-44032 : Rat) / 25) [(0, 1), (1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((22016 : Rat) / 25) [(0, 1), (2, 2), (11, 1), (15, 1), (16, 1)],
  term ((22016 : Rat) / 25) [(0, 1), (3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-22016 : Rat) / 25) [(0, 1), (11, 1), (15, 1), (16, 1)],
  term ((-44032 : Rat) / 25) [(0, 2), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((44032 : Rat) / 25) [(0, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 7. -/
theorem rs_R010_ueqv_R010YY_partial_07_0000_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_07_0000
        rs_R010_ueqv_R010YY_generator_07_0000_0060 =
      rs_R010_ueqv_R010YY_partial_07_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010YY_coefficient_07_0001 : Poly :=
[
  term ((22016 : Rat) / 25) [(0, 1), (15, 2), (16, 1)]
]

/-- Partial product 1 for generator 7. -/
def rs_R010_ueqv_R010YY_partial_07_0001 : Poly :=
[
  term ((44032 : Rat) / 25) [(0, 1), (1, 1), (3, 1), (15, 2), (16, 1)],
  term ((-22016 : Rat) / 25) [(0, 1), (2, 2), (15, 2), (16, 1)],
  term ((-22016 : Rat) / 25) [(0, 1), (3, 2), (15, 2), (16, 1)],
  term ((22016 : Rat) / 25) [(0, 1), (15, 2), (16, 1)],
  term ((44032 : Rat) / 25) [(0, 2), (2, 1), (15, 2), (16, 1)],
  term ((-44032 : Rat) / 25) [(0, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 7. -/
theorem rs_R010_ueqv_R010YY_partial_07_0001_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_07_0001
        rs_R010_ueqv_R010YY_generator_07_0000_0060 =
      rs_R010_ueqv_R010YY_partial_07_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010YY_coefficient_07_0002 : Poly :=
[
  term ((8744 : Rat) / 25) [(1, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 2 for generator 7. -/
def rs_R010_ueqv_R010YY_partial_07_0002 : Poly :=
[
  term ((17488 : Rat) / 25) [(0, 1), (1, 1), (2, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-17488 : Rat) / 25) [(0, 1), (1, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-8744 : Rat) / 25) [(1, 1), (2, 2), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-8744 : Rat) / 25) [(1, 1), (3, 2), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((8744 : Rat) / 25) [(1, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((17488 : Rat) / 25) [(1, 2), (3, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 7. -/
theorem rs_R010_ueqv_R010YY_partial_07_0002_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_07_0002
        rs_R010_ueqv_R010YY_generator_07_0000_0060 =
      rs_R010_ueqv_R010YY_partial_07_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010YY_coefficient_07_0003 : Poly :=
[
  term ((-103864 : Rat) / 75) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 3 for generator 7. -/
def rs_R010_ueqv_R010YY_partial_07_0003 : Poly :=
[
  term ((-207728 : Rat) / 75) [(0, 1), (1, 1), (2, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((207728 : Rat) / 75) [(0, 1), (1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((103864 : Rat) / 75) [(1, 1), (2, 2), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((103864 : Rat) / 75) [(1, 1), (3, 2), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-103864 : Rat) / 75) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-207728 : Rat) / 75) [(1, 2), (3, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 7. -/
theorem rs_R010_ueqv_R010YY_partial_07_0003_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_07_0003
        rs_R010_ueqv_R010YY_generator_07_0000_0060 =
      rs_R010_ueqv_R010YY_partial_07_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010YY_coefficient_07_0004 : Poly :=
[
  term ((5752 : Rat) / 5) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 4 for generator 7. -/
def rs_R010_ueqv_R010YY_partial_07_0004 : Poly :=
[
  term ((11504 : Rat) / 5) [(0, 1), (1, 1), (2, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-11504 : Rat) / 5) [(0, 1), (1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5752 : Rat) / 5) [(1, 1), (2, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5752 : Rat) / 5) [(1, 1), (3, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((5752 : Rat) / 5) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((11504 : Rat) / 5) [(1, 2), (3, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 7. -/
theorem rs_R010_ueqv_R010YY_partial_07_0004_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_07_0004
        rs_R010_ueqv_R010YY_generator_07_0000_0060 =
      rs_R010_ueqv_R010YY_partial_07_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010YY_coefficient_07_0005 : Poly :=
[
  term ((8 : Rat) / 3) [(1, 1), (7, 1), (14, 1), (16, 1)]
]

/-- Partial product 5 for generator 7. -/
def rs_R010_ueqv_R010YY_partial_07_0005 : Poly :=
[
  term ((16 : Rat) / 3) [(0, 1), (1, 1), (2, 1), (7, 1), (14, 1), (16, 1)],
  term ((-16 : Rat) / 3) [(0, 1), (1, 1), (7, 1), (14, 1), (16, 1)],
  term ((-8 : Rat) / 3) [(1, 1), (2, 2), (7, 1), (14, 1), (16, 1)],
  term ((-8 : Rat) / 3) [(1, 1), (3, 2), (7, 1), (14, 1), (16, 1)],
  term ((8 : Rat) / 3) [(1, 1), (7, 1), (14, 1), (16, 1)],
  term ((16 : Rat) / 3) [(1, 2), (3, 1), (7, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 7. -/
theorem rs_R010_ueqv_R010YY_partial_07_0005_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_07_0005
        rs_R010_ueqv_R010YY_generator_07_0000_0060 =
      rs_R010_ueqv_R010YY_partial_07_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010YY_coefficient_07_0006 : Poly :=
[
  term ((29072 : Rat) / 75) [(1, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 6 for generator 7. -/
def rs_R010_ueqv_R010YY_partial_07_0006 : Poly :=
[
  term ((58144 : Rat) / 75) [(0, 1), (1, 1), (2, 1), (7, 1), (15, 2), (16, 1)],
  term ((-58144 : Rat) / 75) [(0, 1), (1, 1), (7, 1), (15, 2), (16, 1)],
  term ((-29072 : Rat) / 75) [(1, 1), (2, 2), (7, 1), (15, 2), (16, 1)],
  term ((-29072 : Rat) / 75) [(1, 1), (3, 2), (7, 1), (15, 2), (16, 1)],
  term ((29072 : Rat) / 75) [(1, 1), (7, 1), (15, 2), (16, 1)],
  term ((58144 : Rat) / 75) [(1, 2), (3, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 7. -/
theorem rs_R010_ueqv_R010YY_partial_07_0006_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_07_0006
        rs_R010_ueqv_R010YY_generator_07_0000_0060 =
      rs_R010_ueqv_R010YY_partial_07_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010YY_coefficient_07_0007 : Poly :=
[
  term ((16 : Rat) / 3) [(1, 1), (7, 1), (16, 1)]
]

/-- Partial product 7 for generator 7. -/
def rs_R010_ueqv_R010YY_partial_07_0007 : Poly :=
[
  term ((32 : Rat) / 3) [(0, 1), (1, 1), (2, 1), (7, 1), (16, 1)],
  term ((-32 : Rat) / 3) [(0, 1), (1, 1), (7, 1), (16, 1)],
  term ((-16 : Rat) / 3) [(1, 1), (2, 2), (7, 1), (16, 1)],
  term ((-16 : Rat) / 3) [(1, 1), (3, 2), (7, 1), (16, 1)],
  term ((16 : Rat) / 3) [(1, 1), (7, 1), (16, 1)],
  term ((32 : Rat) / 3) [(1, 2), (3, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 7. -/
theorem rs_R010_ueqv_R010YY_partial_07_0007_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_07_0007
        rs_R010_ueqv_R010YY_generator_07_0000_0060 =
      rs_R010_ueqv_R010YY_partial_07_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010YY_coefficient_07_0008 : Poly :=
[
  term ((-21336 : Rat) / 25) [(1, 1), (7, 2), (15, 1), (16, 1)]
]

/-- Partial product 8 for generator 7. -/
def rs_R010_ueqv_R010YY_partial_07_0008 : Poly :=
[
  term ((-42672 : Rat) / 25) [(0, 1), (1, 1), (2, 1), (7, 2), (15, 1), (16, 1)],
  term ((42672 : Rat) / 25) [(0, 1), (1, 1), (7, 2), (15, 1), (16, 1)],
  term ((21336 : Rat) / 25) [(1, 1), (2, 2), (7, 2), (15, 1), (16, 1)],
  term ((21336 : Rat) / 25) [(1, 1), (3, 2), (7, 2), (15, 1), (16, 1)],
  term ((-21336 : Rat) / 25) [(1, 1), (7, 2), (15, 1), (16, 1)],
  term ((-42672 : Rat) / 25) [(1, 2), (3, 1), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 7. -/
theorem rs_R010_ueqv_R010YY_partial_07_0008_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_07_0008
        rs_R010_ueqv_R010YY_generator_07_0000_0060 =
      rs_R010_ueqv_R010YY_partial_07_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010YY_coefficient_07_0009 : Poly :=
[
  term ((5752 : Rat) / 15) [(1, 2), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 9 for generator 7. -/
def rs_R010_ueqv_R010YY_partial_07_0009 : Poly :=
[
  term ((11504 : Rat) / 15) [(0, 1), (1, 2), (2, 1), (7, 1), (15, 1), (16, 1)],
  term ((-11504 : Rat) / 15) [(0, 1), (1, 2), (7, 1), (15, 1), (16, 1)],
  term ((-5752 : Rat) / 15) [(1, 2), (2, 2), (7, 1), (15, 1), (16, 1)],
  term ((-5752 : Rat) / 15) [(1, 2), (3, 2), (7, 1), (15, 1), (16, 1)],
  term ((5752 : Rat) / 15) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((11504 : Rat) / 15) [(1, 3), (3, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 7. -/
theorem rs_R010_ueqv_R010YY_partial_07_0009_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_07_0009
        rs_R010_ueqv_R010YY_generator_07_0000_0060 =
      rs_R010_ueqv_R010YY_partial_07_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010YY_coefficient_07_0010 : Poly :=
[
  term ((-11436 : Rat) / 25) [(4, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 10 for generator 7. -/
def rs_R010_ueqv_R010YY_partial_07_0010 : Poly :=
[
  term ((-22872 : Rat) / 25) [(0, 1), (2, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((22872 : Rat) / 25) [(0, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-22872 : Rat) / 25) [(1, 1), (3, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((11436 : Rat) / 25) [(2, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((11436 : Rat) / 25) [(3, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-11436 : Rat) / 25) [(4, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 7. -/
theorem rs_R010_ueqv_R010YY_partial_07_0010_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_07_0010
        rs_R010_ueqv_R010YY_generator_07_0000_0060 =
      rs_R010_ueqv_R010YY_partial_07_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010YY_coefficient_07_0011 : Poly :=
[
  term ((11436 : Rat) / 25) [(4, 1), (15, 2), (16, 1)]
]

/-- Partial product 11 for generator 7. -/
def rs_R010_ueqv_R010YY_partial_07_0011 : Poly :=
[
  term ((22872 : Rat) / 25) [(0, 1), (2, 1), (4, 1), (15, 2), (16, 1)],
  term ((-22872 : Rat) / 25) [(0, 1), (4, 1), (15, 2), (16, 1)],
  term ((22872 : Rat) / 25) [(1, 1), (3, 1), (4, 1), (15, 2), (16, 1)],
  term ((-11436 : Rat) / 25) [(2, 2), (4, 1), (15, 2), (16, 1)],
  term ((-11436 : Rat) / 25) [(3, 2), (4, 1), (15, 2), (16, 1)],
  term ((11436 : Rat) / 25) [(4, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 7. -/
theorem rs_R010_ueqv_R010YY_partial_07_0011_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_07_0011
        rs_R010_ueqv_R010YY_generator_07_0000_0060 =
      rs_R010_ueqv_R010YY_partial_07_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010YY_coefficient_07_0012 : Poly :=
[
  term ((28064 : Rat) / 25) [(5, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 12 for generator 7. -/
def rs_R010_ueqv_R010YY_partial_07_0012 : Poly :=
[
  term ((56128 : Rat) / 25) [(0, 1), (2, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-56128 : Rat) / 25) [(0, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((56128 : Rat) / 25) [(1, 1), (3, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-28064 : Rat) / 25) [(2, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-28064 : Rat) / 25) [(3, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((28064 : Rat) / 25) [(5, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 7. -/
theorem rs_R010_ueqv_R010YY_partial_07_0012_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_07_0012
        rs_R010_ueqv_R010YY_generator_07_0000_0060 =
      rs_R010_ueqv_R010YY_partial_07_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010YY_coefficient_07_0013 : Poly :=
[
  term ((-56128 : Rat) / 25) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 13 for generator 7. -/
def rs_R010_ueqv_R010YY_partial_07_0013 : Poly :=
[
  term ((-112256 : Rat) / 25) [(0, 1), (2, 1), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((112256 : Rat) / 25) [(0, 1), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-112256 : Rat) / 25) [(1, 1), (3, 1), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((56128 : Rat) / 25) [(2, 2), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((56128 : Rat) / 25) [(3, 2), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-56128 : Rat) / 25) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 7. -/
theorem rs_R010_ueqv_R010YY_partial_07_0013_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_07_0013
        rs_R010_ueqv_R010YY_generator_07_0000_0060 =
      rs_R010_ueqv_R010YY_partial_07_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010YY_coefficient_07_0014 : Poly :=
[
  term ((-22872 : Rat) / 25) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 14 for generator 7. -/
def rs_R010_ueqv_R010YY_partial_07_0014 : Poly :=
[
  term ((-45744 : Rat) / 25) [(0, 1), (2, 1), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((45744 : Rat) / 25) [(0, 1), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-45744 : Rat) / 25) [(1, 1), (3, 1), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((22872 : Rat) / 25) [(2, 2), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((22872 : Rat) / 25) [(3, 2), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-22872 : Rat) / 25) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 7. -/
theorem rs_R010_ueqv_R010YY_partial_07_0014_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_07_0014
        rs_R010_ueqv_R010YY_generator_07_0000_0060 =
      rs_R010_ueqv_R010YY_partial_07_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010YY_coefficient_07_0015 : Poly :=
[
  term ((5718 : Rat) / 25) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 15 for generator 7. -/
def rs_R010_ueqv_R010YY_partial_07_0015 : Poly :=
[
  term ((11436 : Rat) / 25) [(0, 1), (2, 1), (5, 1), (15, 1), (16, 1)],
  term ((-11436 : Rat) / 25) [(0, 1), (5, 1), (15, 1), (16, 1)],
  term ((11436 : Rat) / 25) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((-5718 : Rat) / 25) [(2, 2), (5, 1), (15, 1), (16, 1)],
  term ((-5718 : Rat) / 25) [(3, 2), (5, 1), (15, 1), (16, 1)],
  term ((5718 : Rat) / 25) [(5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 7. -/
theorem rs_R010_ueqv_R010YY_partial_07_0015_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_07_0015
        rs_R010_ueqv_R010YY_generator_07_0000_0060 =
      rs_R010_ueqv_R010YY_partial_07_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010YY_coefficient_07_0016 : Poly :=
[
  term ((15876 : Rat) / 25) [(6, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 16 for generator 7. -/
def rs_R010_ueqv_R010YY_partial_07_0016 : Poly :=
[
  term ((31752 : Rat) / 25) [(0, 1), (2, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-31752 : Rat) / 25) [(0, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((31752 : Rat) / 25) [(1, 1), (3, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-15876 : Rat) / 25) [(2, 2), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-15876 : Rat) / 25) [(3, 2), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((15876 : Rat) / 25) [(6, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 7. -/
theorem rs_R010_ueqv_R010YY_partial_07_0016_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_07_0016
        rs_R010_ueqv_R010YY_generator_07_0000_0060 =
      rs_R010_ueqv_R010YY_partial_07_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010YY_coefficient_07_0017 : Poly :=
[
  term ((13656 : Rat) / 25) [(6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 17 for generator 7. -/
def rs_R010_ueqv_R010YY_partial_07_0017 : Poly :=
[
  term ((27312 : Rat) / 25) [(0, 1), (2, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-27312 : Rat) / 25) [(0, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((27312 : Rat) / 25) [(1, 1), (3, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-13656 : Rat) / 25) [(2, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-13656 : Rat) / 25) [(3, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((13656 : Rat) / 25) [(6, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 7. -/
theorem rs_R010_ueqv_R010YY_partial_07_0017_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_07_0017
        rs_R010_ueqv_R010YY_generator_07_0000_0060 =
      rs_R010_ueqv_R010YY_partial_07_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010YY_coefficient_07_0018 : Poly :=
[
  term ((4208 : Rat) / 25) [(6, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 18 for generator 7. -/
def rs_R010_ueqv_R010YY_partial_07_0018 : Poly :=
[
  term ((8416 : Rat) / 25) [(0, 1), (2, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-8416 : Rat) / 25) [(0, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((8416 : Rat) / 25) [(1, 1), (3, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-4208 : Rat) / 25) [(2, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-4208 : Rat) / 25) [(3, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((4208 : Rat) / 25) [(6, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 7. -/
theorem rs_R010_ueqv_R010YY_partial_07_0018_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_07_0018
        rs_R010_ueqv_R010YY_generator_07_0000_0060 =
      rs_R010_ueqv_R010YY_partial_07_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010YY_coefficient_07_0019 : Poly :=
[
  term ((-6512 : Rat) / 25) [(6, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 19 for generator 7. -/
def rs_R010_ueqv_R010YY_partial_07_0019 : Poly :=
[
  term ((-13024 : Rat) / 25) [(0, 1), (2, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((13024 : Rat) / 25) [(0, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-13024 : Rat) / 25) [(1, 1), (3, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((6512 : Rat) / 25) [(2, 2), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((6512 : Rat) / 25) [(3, 2), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6512 : Rat) / 25) [(6, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 7. -/
theorem rs_R010_ueqv_R010YY_partial_07_0019_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_07_0019
        rs_R010_ueqv_R010YY_generator_07_0000_0060 =
      rs_R010_ueqv_R010YY_partial_07_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010YY_coefficient_07_0020 : Poly :=
[
  term ((-7464 : Rat) / 25) [(6, 1), (15, 2), (16, 1)]
]

/-- Partial product 20 for generator 7. -/
def rs_R010_ueqv_R010YY_partial_07_0020 : Poly :=
[
  term ((-14928 : Rat) / 25) [(0, 1), (2, 1), (6, 1), (15, 2), (16, 1)],
  term ((14928 : Rat) / 25) [(0, 1), (6, 1), (15, 2), (16, 1)],
  term ((-14928 : Rat) / 25) [(1, 1), (3, 1), (6, 1), (15, 2), (16, 1)],
  term ((7464 : Rat) / 25) [(2, 2), (6, 1), (15, 2), (16, 1)],
  term ((7464 : Rat) / 25) [(3, 2), (6, 1), (15, 2), (16, 1)],
  term ((-7464 : Rat) / 25) [(6, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 7. -/
theorem rs_R010_ueqv_R010YY_partial_07_0020_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_07_0020
        rs_R010_ueqv_R010YY_generator_07_0000_0060 =
      rs_R010_ueqv_R010YY_partial_07_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010YY_coefficient_07_0021 : Poly :=
[
  term ((-14032 : Rat) / 25) [(7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 21 for generator 7. -/
def rs_R010_ueqv_R010YY_partial_07_0021 : Poly :=
[
  term ((-28064 : Rat) / 25) [(0, 1), (2, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((28064 : Rat) / 25) [(0, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-28064 : Rat) / 25) [(1, 1), (3, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((14032 : Rat) / 25) [(2, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((14032 : Rat) / 25) [(3, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-14032 : Rat) / 25) [(7, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 7. -/
theorem rs_R010_ueqv_R010YY_partial_07_0021_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_07_0021
        rs_R010_ueqv_R010YY_generator_07_0000_0060 =
      rs_R010_ueqv_R010YY_partial_07_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010YY_coefficient_07_0022 : Poly :=
[
  term ((13456 : Rat) / 25) [(7, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 22 for generator 7. -/
def rs_R010_ueqv_R010YY_partial_07_0022 : Poly :=
[
  term ((26912 : Rat) / 25) [(0, 1), (2, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-26912 : Rat) / 25) [(0, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((26912 : Rat) / 25) [(1, 1), (3, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-13456 : Rat) / 25) [(2, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-13456 : Rat) / 25) [(3, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((13456 : Rat) / 25) [(7, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 7. -/
theorem rs_R010_ueqv_R010YY_partial_07_0022_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_07_0022
        rs_R010_ueqv_R010YY_generator_07_0000_0060 =
      rs_R010_ueqv_R010YY_partial_07_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010YY_coefficient_07_0023 : Poly :=
[
  term ((-85608 : Rat) / 25) [(7, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 23 for generator 7. -/
def rs_R010_ueqv_R010YY_partial_07_0023 : Poly :=
[
  term ((-171216 : Rat) / 25) [(0, 1), (2, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((171216 : Rat) / 25) [(0, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-171216 : Rat) / 25) [(1, 1), (3, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((85608 : Rat) / 25) [(2, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((85608 : Rat) / 25) [(3, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-85608 : Rat) / 25) [(7, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 7. -/
theorem rs_R010_ueqv_R010YY_partial_07_0023_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_07_0023
        rs_R010_ueqv_R010YY_generator_07_0000_0060 =
      rs_R010_ueqv_R010YY_partial_07_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010YY_coefficient_07_0024 : Poly :=
[
  term ((-3584 : Rat) / 25) [(7, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 24 for generator 7. -/
def rs_R010_ueqv_R010YY_partial_07_0024 : Poly :=
[
  term ((-7168 : Rat) / 25) [(0, 1), (2, 1), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((7168 : Rat) / 25) [(0, 1), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((-7168 : Rat) / 25) [(1, 1), (3, 1), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(2, 2), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(3, 2), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(7, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 7. -/
theorem rs_R010_ueqv_R010YY_partial_07_0024_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_07_0024
        rs_R010_ueqv_R010YY_generator_07_0000_0060 =
      rs_R010_ueqv_R010YY_partial_07_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010YY_coefficient_07_0025 : Poly :=
[
  term ((35456 : Rat) / 25) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 25 for generator 7. -/
def rs_R010_ueqv_R010YY_partial_07_0025 : Poly :=
[
  term ((70912 : Rat) / 25) [(0, 1), (2, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-70912 : Rat) / 25) [(0, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((70912 : Rat) / 25) [(1, 1), (3, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-35456 : Rat) / 25) [(2, 2), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-35456 : Rat) / 25) [(3, 2), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((35456 : Rat) / 25) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 7. -/
theorem rs_R010_ueqv_R010YY_partial_07_0025_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_07_0025
        rs_R010_ueqv_R010YY_generator_07_0000_0060 =
      rs_R010_ueqv_R010YY_partial_07_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010YY_coefficient_07_0026 : Poly :=
[
  term ((-103864 : Rat) / 75) [(7, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 26 for generator 7. -/
def rs_R010_ueqv_R010YY_partial_07_0026 : Poly :=
[
  term ((-207728 : Rat) / 75) [(0, 1), (2, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((207728 : Rat) / 75) [(0, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-207728 : Rat) / 75) [(1, 1), (3, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((103864 : Rat) / 75) [(2, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((103864 : Rat) / 75) [(3, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-103864 : Rat) / 75) [(7, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 7. -/
theorem rs_R010_ueqv_R010YY_partial_07_0026_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_07_0026
        rs_R010_ueqv_R010YY_generator_07_0000_0060 =
      rs_R010_ueqv_R010YY_partial_07_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010YY_coefficient_07_0027 : Poly :=
[
  term (8 : Rat) [(7, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 27 for generator 7. -/
def rs_R010_ueqv_R010YY_partial_07_0027 : Poly :=
[
  term (16 : Rat) [(0, 1), (2, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term (-16 : Rat) [(0, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term (16 : Rat) [(1, 1), (3, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term (-8 : Rat) [(2, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term (-8 : Rat) [(3, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term (8 : Rat) [(7, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 7. -/
theorem rs_R010_ueqv_R010YY_partial_07_0027_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_07_0027
        rs_R010_ueqv_R010YY_generator_07_0000_0060 =
      rs_R010_ueqv_R010YY_partial_07_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010YY_coefficient_07_0028 : Poly :=
[
  term ((-65576 : Rat) / 25) [(7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 28 for generator 7. -/
def rs_R010_ueqv_R010YY_partial_07_0028 : Poly :=
[
  term ((-131152 : Rat) / 25) [(0, 1), (2, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((131152 : Rat) / 25) [(0, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-131152 : Rat) / 25) [(1, 1), (3, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((65576 : Rat) / 25) [(2, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((65576 : Rat) / 25) [(3, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-65576 : Rat) / 25) [(7, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 7. -/
theorem rs_R010_ueqv_R010YY_partial_07_0028_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_07_0028
        rs_R010_ueqv_R010YY_generator_07_0000_0060 =
      rs_R010_ueqv_R010YY_partial_07_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010YY_coefficient_07_0029 : Poly :=
[
  term (-4 : Rat) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 29 for generator 7. -/
def rs_R010_ueqv_R010YY_partial_07_0029 : Poly :=
[
  term (-8 : Rat) [(0, 1), (2, 1), (7, 1), (13, 1), (16, 1)],
  term (8 : Rat) [(0, 1), (7, 1), (13, 1), (16, 1)],
  term (-8 : Rat) [(1, 1), (3, 1), (7, 1), (13, 1), (16, 1)],
  term (4 : Rat) [(2, 2), (7, 1), (13, 1), (16, 1)],
  term (4 : Rat) [(3, 2), (7, 1), (13, 1), (16, 1)],
  term (-4 : Rat) [(7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 7. -/
theorem rs_R010_ueqv_R010YY_partial_07_0029_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_07_0029
        rs_R010_ueqv_R010YY_generator_07_0000_0060 =
      rs_R010_ueqv_R010YY_partial_07_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010YY_coefficient_07_0030 : Poly :=
[
  term ((-12352 : Rat) / 75) [(7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 30 for generator 7. -/
def rs_R010_ueqv_R010YY_partial_07_0030 : Poly :=
[
  term ((-24704 : Rat) / 75) [(0, 1), (2, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((24704 : Rat) / 75) [(0, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-24704 : Rat) / 75) [(1, 1), (3, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((12352 : Rat) / 75) [(2, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((12352 : Rat) / 75) [(3, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12352 : Rat) / 75) [(7, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 7. -/
theorem rs_R010_ueqv_R010YY_partial_07_0030_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_07_0030
        rs_R010_ueqv_R010YY_generator_07_0000_0060 =
      rs_R010_ueqv_R010YY_partial_07_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010YY_coefficient_07_0031 : Poly :=
[
  term ((12172 : Rat) / 75) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 31 for generator 7. -/
def rs_R010_ueqv_R010YY_partial_07_0031 : Poly :=
[
  term ((24344 : Rat) / 75) [(0, 1), (2, 1), (7, 1), (15, 1), (16, 1)],
  term ((-24344 : Rat) / 75) [(0, 1), (7, 1), (15, 1), (16, 1)],
  term ((24344 : Rat) / 75) [(1, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((-12172 : Rat) / 75) [(2, 2), (7, 1), (15, 1), (16, 1)],
  term ((-12172 : Rat) / 75) [(3, 2), (7, 1), (15, 1), (16, 1)],
  term ((12172 : Rat) / 75) [(7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 7. -/
theorem rs_R010_ueqv_R010YY_partial_07_0031_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_07_0031
        rs_R010_ueqv_R010YY_generator_07_0000_0060 =
      rs_R010_ueqv_R010YY_partial_07_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010YY_coefficient_07_0032 : Poly :=
[
  term ((104 : Rat) / 25) [(7, 1), (15, 3), (16, 1)]
]

/-- Partial product 32 for generator 7. -/
def rs_R010_ueqv_R010YY_partial_07_0032 : Poly :=
[
  term ((208 : Rat) / 25) [(0, 1), (2, 1), (7, 1), (15, 3), (16, 1)],
  term ((-208 : Rat) / 25) [(0, 1), (7, 1), (15, 3), (16, 1)],
  term ((208 : Rat) / 25) [(1, 1), (3, 1), (7, 1), (15, 3), (16, 1)],
  term ((-104 : Rat) / 25) [(2, 2), (7, 1), (15, 3), (16, 1)],
  term ((-104 : Rat) / 25) [(3, 2), (7, 1), (15, 3), (16, 1)],
  term ((104 : Rat) / 25) [(7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 7. -/
theorem rs_R010_ueqv_R010YY_partial_07_0032_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_07_0032
        rs_R010_ueqv_R010YY_generator_07_0000_0060 =
      rs_R010_ueqv_R010YY_partial_07_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010YY_coefficient_07_0033 : Poly :=
[
  term ((40032 : Rat) / 25) [(7, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 33 for generator 7. -/
def rs_R010_ueqv_R010YY_partial_07_0033 : Poly :=
[
  term ((80064 : Rat) / 25) [(0, 1), (2, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-80064 : Rat) / 25) [(0, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((80064 : Rat) / 25) [(1, 1), (3, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-40032 : Rat) / 25) [(2, 2), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-40032 : Rat) / 25) [(3, 2), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((40032 : Rat) / 25) [(7, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 7. -/
theorem rs_R010_ueqv_R010YY_partial_07_0033_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_07_0033
        rs_R010_ueqv_R010YY_generator_07_0000_0060 =
      rs_R010_ueqv_R010YY_partial_07_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010YY_coefficient_07_0034 : Poly :=
[
  term ((149456 : Rat) / 75) [(7, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 34 for generator 7. -/
def rs_R010_ueqv_R010YY_partial_07_0034 : Poly :=
[
  term ((298912 : Rat) / 75) [(0, 1), (2, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-298912 : Rat) / 75) [(0, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((298912 : Rat) / 75) [(1, 1), (3, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-149456 : Rat) / 75) [(2, 2), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-149456 : Rat) / 75) [(3, 2), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((149456 : Rat) / 75) [(7, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 7. -/
theorem rs_R010_ueqv_R010YY_partial_07_0034_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_07_0034
        rs_R010_ueqv_R010YY_generator_07_0000_0060 =
      rs_R010_ueqv_R010YY_partial_07_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010YY_coefficient_07_0035 : Poly :=
[
  term ((-6488 : Rat) / 25) [(7, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 35 for generator 7. -/
def rs_R010_ueqv_R010YY_partial_07_0035 : Poly :=
[
  term ((-12976 : Rat) / 25) [(0, 1), (2, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((12976 : Rat) / 25) [(0, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-12976 : Rat) / 25) [(1, 1), (3, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((6488 : Rat) / 25) [(2, 2), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((6488 : Rat) / 25) [(3, 2), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-6488 : Rat) / 25) [(7, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 7. -/
theorem rs_R010_ueqv_R010YY_partial_07_0035_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_07_0035
        rs_R010_ueqv_R010YY_generator_07_0000_0060 =
      rs_R010_ueqv_R010YY_partial_07_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010YY_coefficient_07_0036 : Poly :=
[
  term ((-16 : Rat) / 3) [(7, 2), (14, 1), (16, 1)]
]

/-- Partial product 36 for generator 7. -/
def rs_R010_ueqv_R010YY_partial_07_0036 : Poly :=
[
  term ((-32 : Rat) / 3) [(0, 1), (2, 1), (7, 2), (14, 1), (16, 1)],
  term ((32 : Rat) / 3) [(0, 1), (7, 2), (14, 1), (16, 1)],
  term ((-32 : Rat) / 3) [(1, 1), (3, 1), (7, 2), (14, 1), (16, 1)],
  term ((16 : Rat) / 3) [(2, 2), (7, 2), (14, 1), (16, 1)],
  term ((16 : Rat) / 3) [(3, 2), (7, 2), (14, 1), (16, 1)],
  term ((-16 : Rat) / 3) [(7, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 7. -/
theorem rs_R010_ueqv_R010YY_partial_07_0036_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_07_0036
        rs_R010_ueqv_R010YY_generator_07_0000_0060 =
      rs_R010_ueqv_R010YY_partial_07_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010YY_coefficient_07_0037 : Poly :=
[
  term ((17992 : Rat) / 75) [(7, 2), (15, 2), (16, 1)]
]

/-- Partial product 37 for generator 7. -/
def rs_R010_ueqv_R010YY_partial_07_0037 : Poly :=
[
  term ((35984 : Rat) / 75) [(0, 1), (2, 1), (7, 2), (15, 2), (16, 1)],
  term ((-35984 : Rat) / 75) [(0, 1), (7, 2), (15, 2), (16, 1)],
  term ((35984 : Rat) / 75) [(1, 1), (3, 1), (7, 2), (15, 2), (16, 1)],
  term ((-17992 : Rat) / 75) [(2, 2), (7, 2), (15, 2), (16, 1)],
  term ((-17992 : Rat) / 75) [(3, 2), (7, 2), (15, 2), (16, 1)],
  term ((17992 : Rat) / 75) [(7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 7. -/
theorem rs_R010_ueqv_R010YY_partial_07_0037_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_07_0037
        rs_R010_ueqv_R010YY_generator_07_0000_0060 =
      rs_R010_ueqv_R010YY_partial_07_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010YY_coefficient_07_0038 : Poly :=
[
  term ((-20 : Rat) / 3) [(7, 2), (16, 1)]
]

/-- Partial product 38 for generator 7. -/
def rs_R010_ueqv_R010YY_partial_07_0038 : Poly :=
[
  term ((-40 : Rat) / 3) [(0, 1), (2, 1), (7, 2), (16, 1)],
  term ((40 : Rat) / 3) [(0, 1), (7, 2), (16, 1)],
  term ((-40 : Rat) / 3) [(1, 1), (3, 1), (7, 2), (16, 1)],
  term ((20 : Rat) / 3) [(2, 2), (7, 2), (16, 1)],
  term ((20 : Rat) / 3) [(3, 2), (7, 2), (16, 1)],
  term ((-20 : Rat) / 3) [(7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 7. -/
theorem rs_R010_ueqv_R010YY_partial_07_0038_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_07_0038
        rs_R010_ueqv_R010YY_generator_07_0000_0060 =
      rs_R010_ueqv_R010YY_partial_07_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010YY_coefficient_07_0039 : Poly :=
[
  term ((12976 : Rat) / 75) [(7, 3), (15, 1), (16, 1)]
]

/-- Partial product 39 for generator 7. -/
def rs_R010_ueqv_R010YY_partial_07_0039 : Poly :=
[
  term ((25952 : Rat) / 75) [(0, 1), (2, 1), (7, 3), (15, 1), (16, 1)],
  term ((-25952 : Rat) / 75) [(0, 1), (7, 3), (15, 1), (16, 1)],
  term ((25952 : Rat) / 75) [(1, 1), (3, 1), (7, 3), (15, 1), (16, 1)],
  term ((-12976 : Rat) / 75) [(2, 2), (7, 3), (15, 1), (16, 1)],
  term ((-12976 : Rat) / 75) [(3, 2), (7, 3), (15, 1), (16, 1)],
  term ((12976 : Rat) / 75) [(7, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 7. -/
theorem rs_R010_ueqv_R010YY_partial_07_0039_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_07_0039
        rs_R010_ueqv_R010YY_generator_07_0000_0060 =
      rs_R010_ueqv_R010YY_partial_07_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010YY_coefficient_07_0040 : Poly :=
[
  term ((5132 : Rat) / 25) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 40 for generator 7. -/
def rs_R010_ueqv_R010YY_partial_07_0040 : Poly :=
[
  term ((10264 : Rat) / 25) [(0, 1), (2, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-10264 : Rat) / 25) [(0, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((10264 : Rat) / 25) [(1, 1), (3, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-5132 : Rat) / 25) [(2, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-5132 : Rat) / 25) [(3, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((5132 : Rat) / 25) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 7. -/
theorem rs_R010_ueqv_R010YY_partial_07_0040_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_07_0040
        rs_R010_ueqv_R010YY_generator_07_0000_0060 =
      rs_R010_ueqv_R010YY_partial_07_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010YY_coefficient_07_0041 : Poly :=
[
  term ((-33196 : Rat) / 25) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 41 for generator 7. -/
def rs_R010_ueqv_R010YY_partial_07_0041 : Poly :=
[
  term ((-66392 : Rat) / 25) [(0, 1), (2, 1), (8, 1), (15, 2), (16, 1)],
  term ((66392 : Rat) / 25) [(0, 1), (8, 1), (15, 2), (16, 1)],
  term ((-66392 : Rat) / 25) [(1, 1), (3, 1), (8, 1), (15, 2), (16, 1)],
  term ((33196 : Rat) / 25) [(2, 2), (8, 1), (15, 2), (16, 1)],
  term ((33196 : Rat) / 25) [(3, 2), (8, 1), (15, 2), (16, 1)],
  term ((-33196 : Rat) / 25) [(8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 7. -/
theorem rs_R010_ueqv_R010YY_partial_07_0041_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_07_0041
        rs_R010_ueqv_R010YY_generator_07_0000_0060 =
      rs_R010_ueqv_R010YY_partial_07_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010YY_coefficient_07_0042 : Poly :=
[
  term ((-17024 : Rat) / 25) [(9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 42 for generator 7. -/
def rs_R010_ueqv_R010YY_partial_07_0042 : Poly :=
[
  term ((-34048 : Rat) / 25) [(0, 1), (2, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((34048 : Rat) / 25) [(0, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-34048 : Rat) / 25) [(1, 1), (3, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((17024 : Rat) / 25) [(2, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((17024 : Rat) / 25) [(3, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-17024 : Rat) / 25) [(9, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 7. -/
theorem rs_R010_ueqv_R010YY_partial_07_0042_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_07_0042
        rs_R010_ueqv_R010YY_generator_07_0000_0060 =
      rs_R010_ueqv_R010YY_partial_07_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010YY_coefficient_07_0043 : Poly :=
[
  term ((54336 : Rat) / 25) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 43 for generator 7. -/
def rs_R010_ueqv_R010YY_partial_07_0043 : Poly :=
[
  term ((108672 : Rat) / 25) [(0, 1), (2, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-108672 : Rat) / 25) [(0, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((108672 : Rat) / 25) [(1, 1), (3, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-54336 : Rat) / 25) [(2, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-54336 : Rat) / 25) [(3, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((54336 : Rat) / 25) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 7. -/
theorem rs_R010_ueqv_R010YY_partial_07_0043_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_07_0043
        rs_R010_ueqv_R010YY_generator_07_0000_0060 =
      rs_R010_ueqv_R010YY_partial_07_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010YY_coefficient_07_0044 : Poly :=
[
  term ((3584 : Rat) / 25) [(9, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 44 for generator 7. -/
def rs_R010_ueqv_R010YY_partial_07_0044 : Poly :=
[
  term ((7168 : Rat) / 25) [(0, 1), (2, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-7168 : Rat) / 25) [(0, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((7168 : Rat) / 25) [(1, 1), (3, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(2, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(3, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 7. -/
theorem rs_R010_ueqv_R010YY_partial_07_0044_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_07_0044
        rs_R010_ueqv_R010YY_generator_07_0000_0060 =
      rs_R010_ueqv_R010YY_partial_07_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010YY_coefficient_07_0045 : Poly :=
[
  term ((1792 : Rat) / 25) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 45 for generator 7. -/
def rs_R010_ueqv_R010YY_partial_07_0045 : Poly :=
[
  term ((3584 : Rat) / 25) [(0, 1), (2, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3584 : Rat) / 25) [(0, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((3584 : Rat) / 25) [(1, 1), (3, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1792 : Rat) / 25) [(2, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1792 : Rat) / 25) [(3, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((1792 : Rat) / 25) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 7. -/
theorem rs_R010_ueqv_R010YY_partial_07_0045_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_07_0045
        rs_R010_ueqv_R010YY_generator_07_0000_0060 =
      rs_R010_ueqv_R010YY_partial_07_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010YY_coefficient_07_0046 : Poly :=
[
  term ((-31744 : Rat) / 25) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 46 for generator 7. -/
def rs_R010_ueqv_R010YY_partial_07_0046 : Poly :=
[
  term ((-63488 : Rat) / 25) [(0, 1), (2, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((63488 : Rat) / 25) [(0, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-63488 : Rat) / 25) [(1, 1), (3, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((31744 : Rat) / 25) [(2, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((31744 : Rat) / 25) [(3, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-31744 : Rat) / 25) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 7. -/
theorem rs_R010_ueqv_R010YY_partial_07_0046_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_07_0046
        rs_R010_ueqv_R010YY_generator_07_0000_0060 =
      rs_R010_ueqv_R010YY_partial_07_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010YY_coefficient_07_0047 : Poly :=
[
  term ((-11464 : Rat) / 25) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 47 for generator 7. -/
def rs_R010_ueqv_R010YY_partial_07_0047 : Poly :=
[
  term ((-22928 : Rat) / 25) [(0, 1), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((22928 : Rat) / 25) [(0, 1), (9, 1), (15, 1), (16, 1)],
  term ((-22928 : Rat) / 25) [(1, 1), (3, 1), (9, 1), (15, 1), (16, 1)],
  term ((11464 : Rat) / 25) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((11464 : Rat) / 25) [(3, 2), (9, 1), (15, 1), (16, 1)],
  term ((-11464 : Rat) / 25) [(9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 7. -/
theorem rs_R010_ueqv_R010YY_partial_07_0047_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_07_0047
        rs_R010_ueqv_R010YY_generator_07_0000_0060 =
      rs_R010_ueqv_R010YY_partial_07_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010YY_coefficient_07_0048 : Poly :=
[
  term ((3584 : Rat) / 25) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 48 for generator 7. -/
def rs_R010_ueqv_R010YY_partial_07_0048 : Poly :=
[
  term ((7168 : Rat) / 25) [(0, 1), (2, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-7168 : Rat) / 25) [(0, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((7168 : Rat) / 25) [(1, 1), (3, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(2, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(3, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 7. -/
theorem rs_R010_ueqv_R010YY_partial_07_0048_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_07_0048
        rs_R010_ueqv_R010YY_generator_07_0000_0060 =
      rs_R010_ueqv_R010YY_partial_07_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010YY_coefficient_07_0049 : Poly :=
[
  term ((-7616 : Rat) / 25) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 49 for generator 7. -/
def rs_R010_ueqv_R010YY_partial_07_0049 : Poly :=
[
  term ((-15232 : Rat) / 25) [(0, 1), (2, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((15232 : Rat) / 25) [(0, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-15232 : Rat) / 25) [(1, 1), (3, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((7616 : Rat) / 25) [(2, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((7616 : Rat) / 25) [(3, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-7616 : Rat) / 25) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 7. -/
theorem rs_R010_ueqv_R010YY_partial_07_0049_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_07_0049
        rs_R010_ueqv_R010YY_generator_07_0000_0060 =
      rs_R010_ueqv_R010YY_partial_07_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010YY_coefficient_07_0050 : Poly :=
[
  term ((3088 : Rat) / 25) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 50 for generator 7. -/
def rs_R010_ueqv_R010YY_partial_07_0050 : Poly :=
[
  term ((6176 : Rat) / 25) [(0, 1), (2, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6176 : Rat) / 25) [(0, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((6176 : Rat) / 25) [(1, 1), (3, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3088 : Rat) / 25) [(2, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3088 : Rat) / 25) [(3, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((3088 : Rat) / 25) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 7. -/
theorem rs_R010_ueqv_R010YY_partial_07_0050_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_07_0050
        rs_R010_ueqv_R010YY_generator_07_0000_0060 =
      rs_R010_ueqv_R010YY_partial_07_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010YY_coefficient_07_0051 : Poly :=
[
  term ((7616 : Rat) / 25) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 51 for generator 7. -/
def rs_R010_ueqv_R010YY_partial_07_0051 : Poly :=
[
  term ((15232 : Rat) / 25) [(0, 1), (2, 1), (10, 1), (15, 2), (16, 1)],
  term ((-15232 : Rat) / 25) [(0, 1), (10, 1), (15, 2), (16, 1)],
  term ((15232 : Rat) / 25) [(1, 1), (3, 1), (10, 1), (15, 2), (16, 1)],
  term ((-7616 : Rat) / 25) [(2, 2), (10, 1), (15, 2), (16, 1)],
  term ((-7616 : Rat) / 25) [(3, 2), (10, 1), (15, 2), (16, 1)],
  term ((7616 : Rat) / 25) [(10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 7. -/
theorem rs_R010_ueqv_R010YY_partial_07_0051_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_07_0051
        rs_R010_ueqv_R010YY_generator_07_0000_0060 =
      rs_R010_ueqv_R010YY_partial_07_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010YY_coefficient_07_0052 : Poly :=
[
  term ((-21784 : Rat) / 5) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 52 for generator 7. -/
def rs_R010_ueqv_R010YY_partial_07_0052 : Poly :=
[
  term ((-43568 : Rat) / 5) [(0, 1), (2, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((43568 : Rat) / 5) [(0, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-43568 : Rat) / 5) [(1, 1), (3, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((21784 : Rat) / 5) [(2, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((21784 : Rat) / 5) [(3, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-21784 : Rat) / 5) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 7. -/
theorem rs_R010_ueqv_R010YY_partial_07_0052_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_07_0052
        rs_R010_ueqv_R010YY_generator_07_0000_0060 =
      rs_R010_ueqv_R010YY_partial_07_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010YY_coefficient_07_0053 : Poly :=
[
  term ((14944 : Rat) / 25) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 53 for generator 7. -/
def rs_R010_ueqv_R010YY_partial_07_0053 : Poly :=
[
  term ((29888 : Rat) / 25) [(0, 1), (2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-29888 : Rat) / 25) [(0, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((29888 : Rat) / 25) [(1, 1), (3, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-14944 : Rat) / 25) [(2, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-14944 : Rat) / 25) [(3, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((14944 : Rat) / 25) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 7. -/
theorem rs_R010_ueqv_R010YY_partial_07_0053_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_07_0053
        rs_R010_ueqv_R010YY_generator_07_0000_0060 =
      rs_R010_ueqv_R010YY_partial_07_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010YY_coefficient_07_0054 : Poly :=
[
  term ((-15692 : Rat) / 25) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 54 for generator 7. -/
def rs_R010_ueqv_R010YY_partial_07_0054 : Poly :=
[
  term ((-31384 : Rat) / 25) [(0, 1), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((31384 : Rat) / 25) [(0, 1), (11, 1), (15, 1), (16, 1)],
  term ((-31384 : Rat) / 25) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((15692 : Rat) / 25) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((15692 : Rat) / 25) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-15692 : Rat) / 25) [(11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 7. -/
theorem rs_R010_ueqv_R010YY_partial_07_0054_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_07_0054
        rs_R010_ueqv_R010YY_generator_07_0000_0060 =
      rs_R010_ueqv_R010YY_partial_07_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010YY_coefficient_07_0055 : Poly :=
[
  term ((46296 : Rat) / 25) [(11, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 55 for generator 7. -/
def rs_R010_ueqv_R010YY_partial_07_0055 : Poly :=
[
  term ((92592 : Rat) / 25) [(0, 1), (2, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-92592 : Rat) / 25) [(0, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((92592 : Rat) / 25) [(1, 1), (3, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-46296 : Rat) / 25) [(2, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-46296 : Rat) / 25) [(3, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((46296 : Rat) / 25) [(11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 7. -/
theorem rs_R010_ueqv_R010YY_partial_07_0055_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_07_0055
        rs_R010_ueqv_R010YY_generator_07_0000_0060 =
      rs_R010_ueqv_R010YY_partial_07_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010YY_coefficient_07_0056 : Poly :=
[
  term ((-1152 : Rat) / 25) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 56 for generator 7. -/
def rs_R010_ueqv_R010YY_partial_07_0056 : Poly :=
[
  term ((-2304 : Rat) / 25) [(0, 1), (2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2304 : Rat) / 25) [(0, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2304 : Rat) / 25) [(1, 1), (3, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1152 : Rat) / 25) [(2, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1152 : Rat) / 25) [(3, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1152 : Rat) / 25) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 7. -/
theorem rs_R010_ueqv_R010YY_partial_07_0056_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_07_0056
        rs_R010_ueqv_R010YY_generator_07_0000_0060 =
      rs_R010_ueqv_R010YY_partial_07_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010YY_coefficient_07_0057 : Poly :=
[
  term ((6176 : Rat) / 25) [(13, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 57 for generator 7. -/
def rs_R010_ueqv_R010YY_partial_07_0057 : Poly :=
[
  term ((12352 : Rat) / 25) [(0, 1), (2, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-12352 : Rat) / 25) [(0, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((12352 : Rat) / 25) [(1, 1), (3, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-6176 : Rat) / 25) [(2, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-6176 : Rat) / 25) [(3, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((6176 : Rat) / 25) [(13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 7. -/
theorem rs_R010_ueqv_R010YY_partial_07_0057_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_07_0057
        rs_R010_ueqv_R010YY_generator_07_0000_0060 =
      rs_R010_ueqv_R010YY_partial_07_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010YY_coefficient_07_0058 : Poly :=
[
  term ((85496 : Rat) / 25) [(13, 1), (15, 3), (16, 1)]
]

/-- Partial product 58 for generator 7. -/
def rs_R010_ueqv_R010YY_partial_07_0058 : Poly :=
[
  term ((170992 : Rat) / 25) [(0, 1), (2, 1), (13, 1), (15, 3), (16, 1)],
  term ((-170992 : Rat) / 25) [(0, 1), (13, 1), (15, 3), (16, 1)],
  term ((170992 : Rat) / 25) [(1, 1), (3, 1), (13, 1), (15, 3), (16, 1)],
  term ((-85496 : Rat) / 25) [(2, 2), (13, 1), (15, 3), (16, 1)],
  term ((-85496 : Rat) / 25) [(3, 2), (13, 1), (15, 3), (16, 1)],
  term ((85496 : Rat) / 25) [(13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 7. -/
theorem rs_R010_ueqv_R010YY_partial_07_0058_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_07_0058
        rs_R010_ueqv_R010YY_generator_07_0000_0060 =
      rs_R010_ueqv_R010YY_partial_07_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010YY_coefficient_07_0059 : Poly :=
[
  term ((-11856 : Rat) / 25) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 59 for generator 7. -/
def rs_R010_ueqv_R010YY_partial_07_0059 : Poly :=
[
  term ((-23712 : Rat) / 25) [(0, 1), (2, 1), (14, 1), (15, 2), (16, 1)],
  term ((23712 : Rat) / 25) [(0, 1), (14, 1), (15, 2), (16, 1)],
  term ((-23712 : Rat) / 25) [(1, 1), (3, 1), (14, 1), (15, 2), (16, 1)],
  term ((11856 : Rat) / 25) [(2, 2), (14, 1), (15, 2), (16, 1)],
  term ((11856 : Rat) / 25) [(3, 2), (14, 1), (15, 2), (16, 1)],
  term ((-11856 : Rat) / 25) [(14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 7. -/
theorem rs_R010_ueqv_R010YY_partial_07_0059_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_07_0059
        rs_R010_ueqv_R010YY_generator_07_0000_0060 =
      rs_R010_ueqv_R010YY_partial_07_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010YY_coefficient_07_0060 : Poly :=
[
  term ((10942 : Rat) / 25) [(15, 2), (16, 1)]
]

/-- Partial product 60 for generator 7. -/
def rs_R010_ueqv_R010YY_partial_07_0060 : Poly :=
[
  term ((21884 : Rat) / 25) [(0, 1), (2, 1), (15, 2), (16, 1)],
  term ((-21884 : Rat) / 25) [(0, 1), (15, 2), (16, 1)],
  term ((21884 : Rat) / 25) [(1, 1), (3, 1), (15, 2), (16, 1)],
  term ((-10942 : Rat) / 25) [(2, 2), (15, 2), (16, 1)],
  term ((-10942 : Rat) / 25) [(3, 2), (15, 2), (16, 1)],
  term ((10942 : Rat) / 25) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 7. -/
theorem rs_R010_ueqv_R010YY_partial_07_0060_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_07_0060
        rs_R010_ueqv_R010YY_generator_07_0000_0060 =
      rs_R010_ueqv_R010YY_partial_07_0060 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010YY_partials_07_0000_0060 : List Poly :=
[
  rs_R010_ueqv_R010YY_partial_07_0000,
  rs_R010_ueqv_R010YY_partial_07_0001,
  rs_R010_ueqv_R010YY_partial_07_0002,
  rs_R010_ueqv_R010YY_partial_07_0003,
  rs_R010_ueqv_R010YY_partial_07_0004,
  rs_R010_ueqv_R010YY_partial_07_0005,
  rs_R010_ueqv_R010YY_partial_07_0006,
  rs_R010_ueqv_R010YY_partial_07_0007,
  rs_R010_ueqv_R010YY_partial_07_0008,
  rs_R010_ueqv_R010YY_partial_07_0009,
  rs_R010_ueqv_R010YY_partial_07_0010,
  rs_R010_ueqv_R010YY_partial_07_0011,
  rs_R010_ueqv_R010YY_partial_07_0012,
  rs_R010_ueqv_R010YY_partial_07_0013,
  rs_R010_ueqv_R010YY_partial_07_0014,
  rs_R010_ueqv_R010YY_partial_07_0015,
  rs_R010_ueqv_R010YY_partial_07_0016,
  rs_R010_ueqv_R010YY_partial_07_0017,
  rs_R010_ueqv_R010YY_partial_07_0018,
  rs_R010_ueqv_R010YY_partial_07_0019,
  rs_R010_ueqv_R010YY_partial_07_0020,
  rs_R010_ueqv_R010YY_partial_07_0021,
  rs_R010_ueqv_R010YY_partial_07_0022,
  rs_R010_ueqv_R010YY_partial_07_0023,
  rs_R010_ueqv_R010YY_partial_07_0024,
  rs_R010_ueqv_R010YY_partial_07_0025,
  rs_R010_ueqv_R010YY_partial_07_0026,
  rs_R010_ueqv_R010YY_partial_07_0027,
  rs_R010_ueqv_R010YY_partial_07_0028,
  rs_R010_ueqv_R010YY_partial_07_0029,
  rs_R010_ueqv_R010YY_partial_07_0030,
  rs_R010_ueqv_R010YY_partial_07_0031,
  rs_R010_ueqv_R010YY_partial_07_0032,
  rs_R010_ueqv_R010YY_partial_07_0033,
  rs_R010_ueqv_R010YY_partial_07_0034,
  rs_R010_ueqv_R010YY_partial_07_0035,
  rs_R010_ueqv_R010YY_partial_07_0036,
  rs_R010_ueqv_R010YY_partial_07_0037,
  rs_R010_ueqv_R010YY_partial_07_0038,
  rs_R010_ueqv_R010YY_partial_07_0039,
  rs_R010_ueqv_R010YY_partial_07_0040,
  rs_R010_ueqv_R010YY_partial_07_0041,
  rs_R010_ueqv_R010YY_partial_07_0042,
  rs_R010_ueqv_R010YY_partial_07_0043,
  rs_R010_ueqv_R010YY_partial_07_0044,
  rs_R010_ueqv_R010YY_partial_07_0045,
  rs_R010_ueqv_R010YY_partial_07_0046,
  rs_R010_ueqv_R010YY_partial_07_0047,
  rs_R010_ueqv_R010YY_partial_07_0048,
  rs_R010_ueqv_R010YY_partial_07_0049,
  rs_R010_ueqv_R010YY_partial_07_0050,
  rs_R010_ueqv_R010YY_partial_07_0051,
  rs_R010_ueqv_R010YY_partial_07_0052,
  rs_R010_ueqv_R010YY_partial_07_0053,
  rs_R010_ueqv_R010YY_partial_07_0054,
  rs_R010_ueqv_R010YY_partial_07_0055,
  rs_R010_ueqv_R010YY_partial_07_0056,
  rs_R010_ueqv_R010YY_partial_07_0057,
  rs_R010_ueqv_R010YY_partial_07_0058,
  rs_R010_ueqv_R010YY_partial_07_0059,
  rs_R010_ueqv_R010YY_partial_07_0060
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010YY_block_07_0000_0060 : Poly :=
[
  term ((17488 : Rat) / 25) [(0, 1), (1, 1), (2, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-207728 : Rat) / 75) [(0, 1), (1, 1), (2, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((11504 : Rat) / 5) [(0, 1), (1, 1), (2, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 3) [(0, 1), (1, 1), (2, 1), (7, 1), (14, 1), (16, 1)],
  term ((58144 : Rat) / 75) [(0, 1), (1, 1), (2, 1), (7, 1), (15, 2), (16, 1)],
  term ((32 : Rat) / 3) [(0, 1), (1, 1), (2, 1), (7, 1), (16, 1)],
  term ((-42672 : Rat) / 25) [(0, 1), (1, 1), (2, 1), (7, 2), (15, 1), (16, 1)],
  term ((-44032 : Rat) / 25) [(0, 1), (1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((44032 : Rat) / 25) [(0, 1), (1, 1), (3, 1), (15, 2), (16, 1)],
  term ((-17488 : Rat) / 25) [(0, 1), (1, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((207728 : Rat) / 75) [(0, 1), (1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-11504 : Rat) / 5) [(0, 1), (1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 3) [(0, 1), (1, 1), (7, 1), (14, 1), (16, 1)],
  term ((-58144 : Rat) / 75) [(0, 1), (1, 1), (7, 1), (15, 2), (16, 1)],
  term ((-32 : Rat) / 3) [(0, 1), (1, 1), (7, 1), (16, 1)],
  term ((42672 : Rat) / 25) [(0, 1), (1, 1), (7, 2), (15, 1), (16, 1)],
  term ((11504 : Rat) / 15) [(0, 1), (1, 2), (2, 1), (7, 1), (15, 1), (16, 1)],
  term ((-11504 : Rat) / 15) [(0, 1), (1, 2), (7, 1), (15, 1), (16, 1)],
  term ((-22872 : Rat) / 25) [(0, 1), (2, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((22872 : Rat) / 25) [(0, 1), (2, 1), (4, 1), (15, 2), (16, 1)],
  term ((56128 : Rat) / 25) [(0, 1), (2, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-112256 : Rat) / 25) [(0, 1), (2, 1), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-45744 : Rat) / 25) [(0, 1), (2, 1), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((11436 : Rat) / 25) [(0, 1), (2, 1), (5, 1), (15, 1), (16, 1)],
  term ((31752 : Rat) / 25) [(0, 1), (2, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((27312 : Rat) / 25) [(0, 1), (2, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((8416 : Rat) / 25) [(0, 1), (2, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-13024 : Rat) / 25) [(0, 1), (2, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-14928 : Rat) / 25) [(0, 1), (2, 1), (6, 1), (15, 2), (16, 1)],
  term ((-28064 : Rat) / 25) [(0, 1), (2, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((26912 : Rat) / 25) [(0, 1), (2, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-171216 : Rat) / 25) [(0, 1), (2, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-7168 : Rat) / 25) [(0, 1), (2, 1), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((70912 : Rat) / 25) [(0, 1), (2, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-207728 : Rat) / 75) [(0, 1), (2, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term (16 : Rat) [(0, 1), (2, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-131152 : Rat) / 25) [(0, 1), (2, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term (-8 : Rat) [(0, 1), (2, 1), (7, 1), (13, 1), (16, 1)],
  term ((-24704 : Rat) / 75) [(0, 1), (2, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((24344 : Rat) / 75) [(0, 1), (2, 1), (7, 1), (15, 1), (16, 1)],
  term ((208 : Rat) / 25) [(0, 1), (2, 1), (7, 1), (15, 3), (16, 1)],
  term ((80064 : Rat) / 25) [(0, 1), (2, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((298912 : Rat) / 75) [(0, 1), (2, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-12976 : Rat) / 25) [(0, 1), (2, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 3) [(0, 1), (2, 1), (7, 2), (14, 1), (16, 1)],
  term ((35984 : Rat) / 75) [(0, 1), (2, 1), (7, 2), (15, 2), (16, 1)],
  term ((-40 : Rat) / 3) [(0, 1), (2, 1), (7, 2), (16, 1)],
  term ((25952 : Rat) / 75) [(0, 1), (2, 1), (7, 3), (15, 1), (16, 1)],
  term ((10264 : Rat) / 25) [(0, 1), (2, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-66392 : Rat) / 25) [(0, 1), (2, 1), (8, 1), (15, 2), (16, 1)],
  term ((-34048 : Rat) / 25) [(0, 1), (2, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((108672 : Rat) / 25) [(0, 1), (2, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((7168 : Rat) / 25) [(0, 1), (2, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(0, 1), (2, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-63488 : Rat) / 25) [(0, 1), (2, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-22928 : Rat) / 25) [(0, 1), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((7168 : Rat) / 25) [(0, 1), (2, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-15232 : Rat) / 25) [(0, 1), (2, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((6176 : Rat) / 25) [(0, 1), (2, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((15232 : Rat) / 25) [(0, 1), (2, 1), (10, 1), (15, 2), (16, 1)],
  term ((-43568 : Rat) / 5) [(0, 1), (2, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((29888 : Rat) / 25) [(0, 1), (2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-31384 : Rat) / 25) [(0, 1), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((92592 : Rat) / 25) [(0, 1), (2, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2304 : Rat) / 25) [(0, 1), (2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((12352 : Rat) / 25) [(0, 1), (2, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((170992 : Rat) / 25) [(0, 1), (2, 1), (13, 1), (15, 3), (16, 1)],
  term ((-23712 : Rat) / 25) [(0, 1), (2, 1), (14, 1), (15, 2), (16, 1)],
  term ((21884 : Rat) / 25) [(0, 1), (2, 1), (15, 2), (16, 1)],
  term ((22016 : Rat) / 25) [(0, 1), (2, 2), (11, 1), (15, 1), (16, 1)],
  term ((-22016 : Rat) / 25) [(0, 1), (2, 2), (15, 2), (16, 1)],
  term ((22016 : Rat) / 25) [(0, 1), (3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-22016 : Rat) / 25) [(0, 1), (3, 2), (15, 2), (16, 1)],
  term ((22872 : Rat) / 25) [(0, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-22872 : Rat) / 25) [(0, 1), (4, 1), (15, 2), (16, 1)],
  term ((-56128 : Rat) / 25) [(0, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((112256 : Rat) / 25) [(0, 1), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((45744 : Rat) / 25) [(0, 1), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-11436 : Rat) / 25) [(0, 1), (5, 1), (15, 1), (16, 1)],
  term ((-31752 : Rat) / 25) [(0, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-27312 : Rat) / 25) [(0, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-8416 : Rat) / 25) [(0, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((13024 : Rat) / 25) [(0, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((14928 : Rat) / 25) [(0, 1), (6, 1), (15, 2), (16, 1)],
  term ((28064 : Rat) / 25) [(0, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-26912 : Rat) / 25) [(0, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((171216 : Rat) / 25) [(0, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((7168 : Rat) / 25) [(0, 1), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((-70912 : Rat) / 25) [(0, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((207728 : Rat) / 75) [(0, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term (-16 : Rat) [(0, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((131152 : Rat) / 25) [(0, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term (8 : Rat) [(0, 1), (7, 1), (13, 1), (16, 1)],
  term ((24704 : Rat) / 75) [(0, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-24344 : Rat) / 75) [(0, 1), (7, 1), (15, 1), (16, 1)],
  term ((-208 : Rat) / 25) [(0, 1), (7, 1), (15, 3), (16, 1)],
  term ((-80064 : Rat) / 25) [(0, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-298912 : Rat) / 75) [(0, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((12976 : Rat) / 25) [(0, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 3) [(0, 1), (7, 2), (14, 1), (16, 1)],
  term ((-35984 : Rat) / 75) [(0, 1), (7, 2), (15, 2), (16, 1)],
  term ((40 : Rat) / 3) [(0, 1), (7, 2), (16, 1)],
  term ((-25952 : Rat) / 75) [(0, 1), (7, 3), (15, 1), (16, 1)],
  term ((-10264 : Rat) / 25) [(0, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((66392 : Rat) / 25) [(0, 1), (8, 1), (15, 2), (16, 1)],
  term ((34048 : Rat) / 25) [(0, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-108672 : Rat) / 25) [(0, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-7168 : Rat) / 25) [(0, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(0, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((63488 : Rat) / 25) [(0, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((22928 : Rat) / 25) [(0, 1), (9, 1), (15, 1), (16, 1)],
  term ((-7168 : Rat) / 25) [(0, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((15232 : Rat) / 25) [(0, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-6176 : Rat) / 25) [(0, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-15232 : Rat) / 25) [(0, 1), (10, 1), (15, 2), (16, 1)],
  term ((43568 : Rat) / 5) [(0, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-29888 : Rat) / 25) [(0, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((9368 : Rat) / 25) [(0, 1), (11, 1), (15, 1), (16, 1)],
  term ((-92592 : Rat) / 25) [(0, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((2304 : Rat) / 25) [(0, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12352 : Rat) / 25) [(0, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-170992 : Rat) / 25) [(0, 1), (13, 1), (15, 3), (16, 1)],
  term ((23712 : Rat) / 25) [(0, 1), (14, 1), (15, 2), (16, 1)],
  term ((132 : Rat) / 25) [(0, 1), (15, 2), (16, 1)],
  term ((-44032 : Rat) / 25) [(0, 2), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((44032 : Rat) / 25) [(0, 2), (2, 1), (15, 2), (16, 1)],
  term ((44032 : Rat) / 25) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((-44032 : Rat) / 25) [(0, 2), (15, 2), (16, 1)],
  term ((-8744 : Rat) / 25) [(1, 1), (2, 2), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((103864 : Rat) / 75) [(1, 1), (2, 2), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-5752 : Rat) / 5) [(1, 1), (2, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-8 : Rat) / 3) [(1, 1), (2, 2), (7, 1), (14, 1), (16, 1)],
  term ((-29072 : Rat) / 75) [(1, 1), (2, 2), (7, 1), (15, 2), (16, 1)],
  term ((-16 : Rat) / 3) [(1, 1), (2, 2), (7, 1), (16, 1)],
  term ((21336 : Rat) / 25) [(1, 1), (2, 2), (7, 2), (15, 1), (16, 1)],
  term ((-22872 : Rat) / 25) [(1, 1), (3, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((22872 : Rat) / 25) [(1, 1), (3, 1), (4, 1), (15, 2), (16, 1)],
  term ((56128 : Rat) / 25) [(1, 1), (3, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-112256 : Rat) / 25) [(1, 1), (3, 1), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-45744 : Rat) / 25) [(1, 1), (3, 1), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((11436 : Rat) / 25) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((31752 : Rat) / 25) [(1, 1), (3, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((27312 : Rat) / 25) [(1, 1), (3, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((8416 : Rat) / 25) [(1, 1), (3, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-13024 : Rat) / 25) [(1, 1), (3, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-14928 : Rat) / 25) [(1, 1), (3, 1), (6, 1), (15, 2), (16, 1)],
  term ((-28064 : Rat) / 25) [(1, 1), (3, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((26912 : Rat) / 25) [(1, 1), (3, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-171216 : Rat) / 25) [(1, 1), (3, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-7168 : Rat) / 25) [(1, 1), (3, 1), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((70912 : Rat) / 25) [(1, 1), (3, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-207728 : Rat) / 75) [(1, 1), (3, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term (16 : Rat) [(1, 1), (3, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-131152 : Rat) / 25) [(1, 1), (3, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term (-8 : Rat) [(1, 1), (3, 1), (7, 1), (13, 1), (16, 1)],
  term ((-24704 : Rat) / 75) [(1, 1), (3, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((24344 : Rat) / 75) [(1, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((208 : Rat) / 25) [(1, 1), (3, 1), (7, 1), (15, 3), (16, 1)],
  term ((80064 : Rat) / 25) [(1, 1), (3, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((298912 : Rat) / 75) [(1, 1), (3, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-12976 : Rat) / 25) [(1, 1), (3, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 3) [(1, 1), (3, 1), (7, 2), (14, 1), (16, 1)],
  term ((35984 : Rat) / 75) [(1, 1), (3, 1), (7, 2), (15, 2), (16, 1)],
  term ((-40 : Rat) / 3) [(1, 1), (3, 1), (7, 2), (16, 1)],
  term ((25952 : Rat) / 75) [(1, 1), (3, 1), (7, 3), (15, 1), (16, 1)],
  term ((10264 : Rat) / 25) [(1, 1), (3, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-66392 : Rat) / 25) [(1, 1), (3, 1), (8, 1), (15, 2), (16, 1)],
  term ((-34048 : Rat) / 25) [(1, 1), (3, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((108672 : Rat) / 25) [(1, 1), (3, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((7168 : Rat) / 25) [(1, 1), (3, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(1, 1), (3, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-63488 : Rat) / 25) [(1, 1), (3, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-22928 : Rat) / 25) [(1, 1), (3, 1), (9, 1), (15, 1), (16, 1)],
  term ((7168 : Rat) / 25) [(1, 1), (3, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-15232 : Rat) / 25) [(1, 1), (3, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((6176 : Rat) / 25) [(1, 1), (3, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((15232 : Rat) / 25) [(1, 1), (3, 1), (10, 1), (15, 2), (16, 1)],
  term ((-43568 : Rat) / 5) [(1, 1), (3, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((29888 : Rat) / 25) [(1, 1), (3, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-31384 : Rat) / 25) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((92592 : Rat) / 25) [(1, 1), (3, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2304 : Rat) / 25) [(1, 1), (3, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((12352 : Rat) / 25) [(1, 1), (3, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((170992 : Rat) / 25) [(1, 1), (3, 1), (13, 1), (15, 3), (16, 1)],
  term ((-23712 : Rat) / 25) [(1, 1), (3, 1), (14, 1), (15, 2), (16, 1)],
  term ((21884 : Rat) / 25) [(1, 1), (3, 1), (15, 2), (16, 1)],
  term ((-8744 : Rat) / 25) [(1, 1), (3, 2), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((103864 : Rat) / 75) [(1, 1), (3, 2), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-5752 : Rat) / 5) [(1, 1), (3, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-8 : Rat) / 3) [(1, 1), (3, 2), (7, 1), (14, 1), (16, 1)],
  term ((-29072 : Rat) / 75) [(1, 1), (3, 2), (7, 1), (15, 2), (16, 1)],
  term ((-16 : Rat) / 3) [(1, 1), (3, 2), (7, 1), (16, 1)],
  term ((21336 : Rat) / 25) [(1, 1), (3, 2), (7, 2), (15, 1), (16, 1)],
  term ((8744 : Rat) / 25) [(1, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-103864 : Rat) / 75) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((5752 : Rat) / 5) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 3) [(1, 1), (7, 1), (14, 1), (16, 1)],
  term ((29072 : Rat) / 75) [(1, 1), (7, 1), (15, 2), (16, 1)],
  term ((16 : Rat) / 3) [(1, 1), (7, 1), (16, 1)],
  term ((-21336 : Rat) / 25) [(1, 1), (7, 2), (15, 1), (16, 1)],
  term ((-5752 : Rat) / 15) [(1, 2), (2, 2), (7, 1), (15, 1), (16, 1)],
  term ((17488 : Rat) / 25) [(1, 2), (3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-207728 : Rat) / 75) [(1, 2), (3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((11504 : Rat) / 5) [(1, 2), (3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 3) [(1, 2), (3, 1), (7, 1), (14, 1), (16, 1)],
  term ((58144 : Rat) / 75) [(1, 2), (3, 1), (7, 1), (15, 2), (16, 1)],
  term ((32 : Rat) / 3) [(1, 2), (3, 1), (7, 1), (16, 1)],
  term ((-42672 : Rat) / 25) [(1, 2), (3, 1), (7, 2), (15, 1), (16, 1)],
  term ((-5752 : Rat) / 15) [(1, 2), (3, 2), (7, 1), (15, 1), (16, 1)],
  term ((5752 : Rat) / 15) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((11504 : Rat) / 15) [(1, 3), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((11436 : Rat) / 25) [(2, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-11436 : Rat) / 25) [(2, 2), (4, 1), (15, 2), (16, 1)],
  term ((-28064 : Rat) / 25) [(2, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((56128 : Rat) / 25) [(2, 2), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((22872 : Rat) / 25) [(2, 2), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5718 : Rat) / 25) [(2, 2), (5, 1), (15, 1), (16, 1)],
  term ((-15876 : Rat) / 25) [(2, 2), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-13656 : Rat) / 25) [(2, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-4208 : Rat) / 25) [(2, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((6512 : Rat) / 25) [(2, 2), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((7464 : Rat) / 25) [(2, 2), (6, 1), (15, 2), (16, 1)],
  term ((14032 : Rat) / 25) [(2, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-13456 : Rat) / 25) [(2, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((85608 : Rat) / 25) [(2, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((3584 : Rat) / 25) [(2, 2), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((-35456 : Rat) / 25) [(2, 2), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((103864 : Rat) / 75) [(2, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term (-8 : Rat) [(2, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((65576 : Rat) / 25) [(2, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term (4 : Rat) [(2, 2), (7, 1), (13, 1), (16, 1)],
  term ((12352 : Rat) / 75) [(2, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12172 : Rat) / 75) [(2, 2), (7, 1), (15, 1), (16, 1)],
  term ((-104 : Rat) / 25) [(2, 2), (7, 1), (15, 3), (16, 1)],
  term ((-40032 : Rat) / 25) [(2, 2), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-149456 : Rat) / 75) [(2, 2), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((6488 : Rat) / 25) [(2, 2), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 3) [(2, 2), (7, 2), (14, 1), (16, 1)],
  term ((-17992 : Rat) / 75) [(2, 2), (7, 2), (15, 2), (16, 1)],
  term ((20 : Rat) / 3) [(2, 2), (7, 2), (16, 1)],
  term ((-12976 : Rat) / 75) [(2, 2), (7, 3), (15, 1), (16, 1)],
  term ((-5132 : Rat) / 25) [(2, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((33196 : Rat) / 25) [(2, 2), (8, 1), (15, 2), (16, 1)],
  term ((17024 : Rat) / 25) [(2, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-54336 : Rat) / 25) [(2, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(2, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(2, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((31744 : Rat) / 25) [(2, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((11464 : Rat) / 25) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(2, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((7616 : Rat) / 25) [(2, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3088 : Rat) / 25) [(2, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-7616 : Rat) / 25) [(2, 2), (10, 1), (15, 2), (16, 1)],
  term ((21784 : Rat) / 5) [(2, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-14944 : Rat) / 25) [(2, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((15692 : Rat) / 25) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((-46296 : Rat) / 25) [(2, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((1152 : Rat) / 25) [(2, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6176 : Rat) / 25) [(2, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-85496 : Rat) / 25) [(2, 2), (13, 1), (15, 3), (16, 1)],
  term ((11856 : Rat) / 25) [(2, 2), (14, 1), (15, 2), (16, 1)],
  term ((-10942 : Rat) / 25) [(2, 2), (15, 2), (16, 1)],
  term ((11436 : Rat) / 25) [(3, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-11436 : Rat) / 25) [(3, 2), (4, 1), (15, 2), (16, 1)],
  term ((-28064 : Rat) / 25) [(3, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((56128 : Rat) / 25) [(3, 2), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((22872 : Rat) / 25) [(3, 2), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5718 : Rat) / 25) [(3, 2), (5, 1), (15, 1), (16, 1)],
  term ((-15876 : Rat) / 25) [(3, 2), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-13656 : Rat) / 25) [(3, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-4208 : Rat) / 25) [(3, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((6512 : Rat) / 25) [(3, 2), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((7464 : Rat) / 25) [(3, 2), (6, 1), (15, 2), (16, 1)],
  term ((14032 : Rat) / 25) [(3, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-13456 : Rat) / 25) [(3, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((85608 : Rat) / 25) [(3, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((3584 : Rat) / 25) [(3, 2), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((-35456 : Rat) / 25) [(3, 2), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((103864 : Rat) / 75) [(3, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term (-8 : Rat) [(3, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((65576 : Rat) / 25) [(3, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term (4 : Rat) [(3, 2), (7, 1), (13, 1), (16, 1)],
  term ((12352 : Rat) / 75) [(3, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12172 : Rat) / 75) [(3, 2), (7, 1), (15, 1), (16, 1)],
  term ((-104 : Rat) / 25) [(3, 2), (7, 1), (15, 3), (16, 1)],
  term ((-40032 : Rat) / 25) [(3, 2), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-149456 : Rat) / 75) [(3, 2), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((6488 : Rat) / 25) [(3, 2), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 3) [(3, 2), (7, 2), (14, 1), (16, 1)],
  term ((-17992 : Rat) / 75) [(3, 2), (7, 2), (15, 2), (16, 1)],
  term ((20 : Rat) / 3) [(3, 2), (7, 2), (16, 1)],
  term ((-12976 : Rat) / 75) [(3, 2), (7, 3), (15, 1), (16, 1)],
  term ((-5132 : Rat) / 25) [(3, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((33196 : Rat) / 25) [(3, 2), (8, 1), (15, 2), (16, 1)],
  term ((17024 : Rat) / 25) [(3, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-54336 : Rat) / 25) [(3, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(3, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(3, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((31744 : Rat) / 25) [(3, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((11464 : Rat) / 25) [(3, 2), (9, 1), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(3, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((7616 : Rat) / 25) [(3, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3088 : Rat) / 25) [(3, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-7616 : Rat) / 25) [(3, 2), (10, 1), (15, 2), (16, 1)],
  term ((21784 : Rat) / 5) [(3, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-14944 : Rat) / 25) [(3, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((15692 : Rat) / 25) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-46296 : Rat) / 25) [(3, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((1152 : Rat) / 25) [(3, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6176 : Rat) / 25) [(3, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-85496 : Rat) / 25) [(3, 2), (13, 1), (15, 3), (16, 1)],
  term ((11856 : Rat) / 25) [(3, 2), (14, 1), (15, 2), (16, 1)],
  term ((-10942 : Rat) / 25) [(3, 2), (15, 2), (16, 1)],
  term ((-11436 : Rat) / 25) [(4, 1), (11, 1), (15, 1), (16, 1)],
  term ((11436 : Rat) / 25) [(4, 1), (15, 2), (16, 1)],
  term ((28064 : Rat) / 25) [(5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-56128 : Rat) / 25) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-22872 : Rat) / 25) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((5718 : Rat) / 25) [(5, 1), (15, 1), (16, 1)],
  term ((15876 : Rat) / 25) [(6, 1), (7, 1), (15, 1), (16, 1)],
  term ((13656 : Rat) / 25) [(6, 1), (9, 1), (15, 1), (16, 1)],
  term ((4208 : Rat) / 25) [(6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-6512 : Rat) / 25) [(6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7464 : Rat) / 25) [(6, 1), (15, 2), (16, 1)],
  term ((-14032 : Rat) / 25) [(7, 1), (8, 1), (15, 1), (16, 1)],
  term ((13456 : Rat) / 25) [(7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-85608 : Rat) / 25) [(7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-3584 : Rat) / 25) [(7, 1), (9, 2), (15, 1), (16, 1)],
  term ((35456 : Rat) / 25) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-103864 : Rat) / 75) [(7, 1), (11, 1), (15, 2), (16, 1)],
  term (8 : Rat) [(7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-65576 : Rat) / 25) [(7, 1), (13, 1), (15, 2), (16, 1)],
  term (-4 : Rat) [(7, 1), (13, 1), (16, 1)],
  term ((-12352 : Rat) / 75) [(7, 1), (14, 1), (15, 1), (16, 1)],
  term ((12172 : Rat) / 75) [(7, 1), (15, 1), (16, 1)],
  term ((104 : Rat) / 25) [(7, 1), (15, 3), (16, 1)],
  term ((40032 : Rat) / 25) [(7, 2), (9, 1), (15, 1), (16, 1)],
  term ((149456 : Rat) / 75) [(7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-6488 : Rat) / 25) [(7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 3) [(7, 2), (14, 1), (16, 1)],
  term ((17992 : Rat) / 75) [(7, 2), (15, 2), (16, 1)],
  term ((-20 : Rat) / 3) [(7, 2), (16, 1)],
  term ((12976 : Rat) / 75) [(7, 3), (15, 1), (16, 1)],
  term ((5132 : Rat) / 25) [(8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-33196 : Rat) / 25) [(8, 1), (15, 2), (16, 1)],
  term ((-17024 : Rat) / 25) [(9, 1), (10, 1), (15, 1), (16, 1)],
  term ((54336 : Rat) / 25) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(9, 1), (11, 2), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-31744 : Rat) / 25) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11464 : Rat) / 25) [(9, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-7616 : Rat) / 25) [(10, 1), (11, 1), (15, 1), (16, 1)],
  term ((3088 : Rat) / 25) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term ((7616 : Rat) / 25) [(10, 1), (15, 2), (16, 1)],
  term ((-21784 : Rat) / 5) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((14944 : Rat) / 25) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-15692 : Rat) / 25) [(11, 1), (15, 1), (16, 1)],
  term ((46296 : Rat) / 25) [(11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1152 : Rat) / 25) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((6176 : Rat) / 25) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((85496 : Rat) / 25) [(13, 1), (15, 3), (16, 1)],
  term ((-11856 : Rat) / 25) [(14, 1), (15, 2), (16, 1)],
  term ((10942 : Rat) / 25) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 7, terms 0 through 60. -/
theorem rs_R010_ueqv_R010YY_block_07_0000_0060_valid :
    checkProductSumEq rs_R010_ueqv_R010YY_partials_07_0000_0060
      rs_R010_ueqv_R010YY_block_07_0000_0060 = true := by
  native_decide

end R010UeqvR010YYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
