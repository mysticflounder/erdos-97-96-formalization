/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010YY, term block 11:0-66

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010YYTermShards

/-- Generator polynomial 11 for relaxed split surplus certificate `R010:u=v:R010YY`. -/
def rs_R010_ueqv_R010YY_generator_11_0000_0066 : Poly :=
[
  term (2 : Rat) [(2, 1), (6, 1)],
  term (2 : Rat) [(3, 1), (7, 1)],
  term (-1 : Rat) [(6, 2)],
  term (-1 : Rat) [(7, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 11. -/
def rs_R010_ueqv_R010YY_coefficient_11_0000 : Poly :=
[
  term ((-2876 : Rat) / 5) [(0, 1), (1, 1), (15, 1), (16, 1)]
]

/-- Partial product 0 for generator 11. -/
def rs_R010_ueqv_R010YY_partial_11_0000 : Poly :=
[
  term ((-5752 : Rat) / 5) [(0, 1), (1, 1), (2, 1), (6, 1), (15, 1), (16, 1)],
  term ((-5752 : Rat) / 5) [(0, 1), (1, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((2876 : Rat) / 5) [(0, 1), (1, 1), (6, 2), (15, 1), (16, 1)],
  term ((2876 : Rat) / 5) [(0, 1), (1, 1), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 11. -/
theorem rs_R010_ueqv_R010YY_partial_11_0000_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_11_0000
        rs_R010_ueqv_R010YY_generator_11_0000_0066 =
      rs_R010_ueqv_R010YY_partial_11_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 11. -/
def rs_R010_ueqv_R010YY_coefficient_11_0001 : Poly :=
[
  term ((3244 : Rat) / 25) [(0, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 1 for generator 11. -/
def rs_R010_ueqv_R010YY_partial_11_0001 : Poly :=
[
  term ((6488 : Rat) / 25) [(0, 1), (2, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((6488 : Rat) / 25) [(0, 1), (3, 1), (7, 2), (15, 1), (16, 1)],
  term ((-3244 : Rat) / 25) [(0, 1), (6, 2), (7, 1), (15, 1), (16, 1)],
  term ((-3244 : Rat) / 25) [(0, 1), (7, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 11. -/
theorem rs_R010_ueqv_R010YY_partial_11_0001_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_11_0001
        rs_R010_ueqv_R010YY_generator_11_0000_0066 =
      rs_R010_ueqv_R010YY_partial_11_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 11. -/
def rs_R010_ueqv_R010YY_coefficient_11_0002 : Poly :=
[
  term ((-6728 : Rat) / 25) [(0, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 2 for generator 11. -/
def rs_R010_ueqv_R010YY_partial_11_0002 : Poly :=
[
  term ((-13456 : Rat) / 25) [(0, 1), (2, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-13456 : Rat) / 25) [(0, 1), (3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((6728 : Rat) / 25) [(0, 1), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((6728 : Rat) / 25) [(0, 1), (7, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 11. -/
theorem rs_R010_ueqv_R010YY_partial_11_0002_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_11_0002
        rs_R010_ueqv_R010YY_generator_11_0000_0066 =
      rs_R010_ueqv_R010YY_partial_11_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 11. -/
def rs_R010_ueqv_R010YY_coefficient_11_0003 : Poly :=
[
  term ((-8016 : Rat) / 25) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 3 for generator 11. -/
def rs_R010_ueqv_R010YY_partial_11_0003 : Poly :=
[
  term ((-16032 : Rat) / 25) [(0, 1), (2, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-16032 : Rat) / 25) [(0, 1), (3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((8016 : Rat) / 25) [(0, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((8016 : Rat) / 25) [(0, 1), (7, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 11. -/
theorem rs_R010_ueqv_R010YY_partial_11_0003_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_11_0003
        rs_R010_ueqv_R010YY_generator_11_0000_0066 =
      rs_R010_ueqv_R010YY_partial_11_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 11. -/
def rs_R010_ueqv_R010YY_coefficient_11_0004 : Poly :=
[
  term (-4 : Rat) [(0, 1), (14, 1), (16, 1)]
]

/-- Partial product 4 for generator 11. -/
def rs_R010_ueqv_R010YY_partial_11_0004 : Poly :=
[
  term (-8 : Rat) [(0, 1), (2, 1), (6, 1), (14, 1), (16, 1)],
  term (-8 : Rat) [(0, 1), (3, 1), (7, 1), (14, 1), (16, 1)],
  term (4 : Rat) [(0, 1), (6, 2), (14, 1), (16, 1)],
  term (4 : Rat) [(0, 1), (7, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 11. -/
theorem rs_R010_ueqv_R010YY_partial_11_0004_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_11_0004
        rs_R010_ueqv_R010YY_generator_11_0000_0066 =
      rs_R010_ueqv_R010YY_partial_11_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 11. -/
def rs_R010_ueqv_R010YY_coefficient_11_0005 : Poly :=
[
  term ((23076 : Rat) / 25) [(0, 1), (15, 2), (16, 1)]
]

/-- Partial product 5 for generator 11. -/
def rs_R010_ueqv_R010YY_partial_11_0005 : Poly :=
[
  term ((46152 : Rat) / 25) [(0, 1), (2, 1), (6, 1), (15, 2), (16, 1)],
  term ((46152 : Rat) / 25) [(0, 1), (3, 1), (7, 1), (15, 2), (16, 1)],
  term ((-23076 : Rat) / 25) [(0, 1), (6, 2), (15, 2), (16, 1)],
  term ((-23076 : Rat) / 25) [(0, 1), (7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 11. -/
theorem rs_R010_ueqv_R010YY_partial_11_0005_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_11_0005
        rs_R010_ueqv_R010YY_generator_11_0000_0066 =
      rs_R010_ueqv_R010YY_partial_11_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 11. -/
def rs_R010_ueqv_R010YY_coefficient_11_0006 : Poly :=
[
  term (2 : Rat) [(0, 1), (16, 1)]
]

/-- Partial product 6 for generator 11. -/
def rs_R010_ueqv_R010YY_partial_11_0006 : Poly :=
[
  term (4 : Rat) [(0, 1), (2, 1), (6, 1), (16, 1)],
  term (4 : Rat) [(0, 1), (3, 1), (7, 1), (16, 1)],
  term (-2 : Rat) [(0, 1), (6, 2), (16, 1)],
  term (-2 : Rat) [(0, 1), (7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 11. -/
theorem rs_R010_ueqv_R010YY_partial_11_0006_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_11_0006
        rs_R010_ueqv_R010YY_generator_11_0000_0066 =
      rs_R010_ueqv_R010YY_partial_11_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 11. -/
def rs_R010_ueqv_R010YY_coefficient_11_0007 : Poly :=
[
  term ((-15876 : Rat) / 25) [(1, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 7 for generator 11. -/
def rs_R010_ueqv_R010YY_partial_11_0007 : Poly :=
[
  term ((-31752 : Rat) / 25) [(1, 1), (2, 1), (6, 2), (15, 1), (16, 1)],
  term ((-31752 : Rat) / 25) [(1, 1), (3, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((15876 : Rat) / 25) [(1, 1), (6, 1), (7, 2), (15, 1), (16, 1)],
  term ((15876 : Rat) / 25) [(1, 1), (6, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 11. -/
theorem rs_R010_ueqv_R010YY_partial_11_0007_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_11_0007
        rs_R010_ueqv_R010YY_generator_11_0000_0066 =
      rs_R010_ueqv_R010YY_partial_11_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 11. -/
def rs_R010_ueqv_R010YY_coefficient_11_0008 : Poly :=
[
  term ((-31616 : Rat) / 25) [(1, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 8 for generator 11. -/
def rs_R010_ueqv_R010YY_partial_11_0008 : Poly :=
[
  term ((-63232 : Rat) / 25) [(1, 1), (2, 1), (6, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-63232 : Rat) / 25) [(1, 1), (3, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((31616 : Rat) / 25) [(1, 1), (6, 2), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((31616 : Rat) / 25) [(1, 1), (7, 3), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 11. -/
theorem rs_R010_ueqv_R010YY_partial_11_0008_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_11_0008
        rs_R010_ueqv_R010YY_generator_11_0000_0066 =
      rs_R010_ueqv_R010YY_partial_11_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 11. -/
def rs_R010_ueqv_R010YY_coefficient_11_0009 : Poly :=
[
  term ((-149456 : Rat) / 75) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 9 for generator 11. -/
def rs_R010_ueqv_R010YY_partial_11_0009 : Poly :=
[
  term ((-298912 : Rat) / 75) [(1, 1), (2, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-298912 : Rat) / 75) [(1, 1), (3, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((149456 : Rat) / 75) [(1, 1), (6, 2), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((149456 : Rat) / 75) [(1, 1), (7, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 11. -/
theorem rs_R010_ueqv_R010YY_partial_11_0009_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_11_0009
        rs_R010_ueqv_R010YY_generator_11_0000_0066 =
      rs_R010_ueqv_R010YY_partial_11_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 11. -/
def rs_R010_ueqv_R010YY_coefficient_11_0010 : Poly :=
[
  term ((16 : Rat) / 3) [(1, 1), (7, 1), (14, 1), (16, 1)]
]

/-- Partial product 10 for generator 11. -/
def rs_R010_ueqv_R010YY_partial_11_0010 : Poly :=
[
  term ((32 : Rat) / 3) [(1, 1), (2, 1), (6, 1), (7, 1), (14, 1), (16, 1)],
  term ((32 : Rat) / 3) [(1, 1), (3, 1), (7, 2), (14, 1), (16, 1)],
  term ((-16 : Rat) / 3) [(1, 1), (6, 2), (7, 1), (14, 1), (16, 1)],
  term ((-16 : Rat) / 3) [(1, 1), (7, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 11. -/
theorem rs_R010_ueqv_R010YY_partial_11_0010_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_11_0010
        rs_R010_ueqv_R010YY_generator_11_0000_0066 =
      rs_R010_ueqv_R010YY_partial_11_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 11. -/
def rs_R010_ueqv_R010YY_coefficient_11_0011 : Poly :=
[
  term ((-3280 : Rat) / 3) [(1, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 11 for generator 11. -/
def rs_R010_ueqv_R010YY_partial_11_0011 : Poly :=
[
  term ((-6560 : Rat) / 3) [(1, 1), (2, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((-6560 : Rat) / 3) [(1, 1), (3, 1), (7, 2), (15, 2), (16, 1)],
  term ((3280 : Rat) / 3) [(1, 1), (6, 2), (7, 1), (15, 2), (16, 1)],
  term ((3280 : Rat) / 3) [(1, 1), (7, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 11. -/
theorem rs_R010_ueqv_R010YY_partial_11_0011_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_11_0011
        rs_R010_ueqv_R010YY_generator_11_0000_0066 =
      rs_R010_ueqv_R010YY_partial_11_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 11. -/
def rs_R010_ueqv_R010YY_coefficient_11_0012 : Poly :=
[
  term ((20 : Rat) / 3) [(1, 1), (7, 1), (16, 1)]
]

/-- Partial product 12 for generator 11. -/
def rs_R010_ueqv_R010YY_partial_11_0012 : Poly :=
[
  term ((40 : Rat) / 3) [(1, 1), (2, 1), (6, 1), (7, 1), (16, 1)],
  term ((40 : Rat) / 3) [(1, 1), (3, 1), (7, 2), (16, 1)],
  term ((-20 : Rat) / 3) [(1, 1), (6, 2), (7, 1), (16, 1)],
  term ((-20 : Rat) / 3) [(1, 1), (7, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 11. -/
theorem rs_R010_ueqv_R010YY_partial_11_0012_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_11_0012
        rs_R010_ueqv_R010YY_generator_11_0000_0066 =
      rs_R010_ueqv_R010YY_partial_11_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 11. -/
def rs_R010_ueqv_R010YY_coefficient_11_0013 : Poly :=
[
  term ((-12976 : Rat) / 75) [(1, 1), (7, 2), (15, 1), (16, 1)]
]

/-- Partial product 13 for generator 11. -/
def rs_R010_ueqv_R010YY_partial_11_0013 : Poly :=
[
  term ((-25952 : Rat) / 75) [(1, 1), (2, 1), (6, 1), (7, 2), (15, 1), (16, 1)],
  term ((-25952 : Rat) / 75) [(1, 1), (3, 1), (7, 3), (15, 1), (16, 1)],
  term ((12976 : Rat) / 75) [(1, 1), (6, 2), (7, 2), (15, 1), (16, 1)],
  term ((12976 : Rat) / 75) [(1, 1), (7, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 11. -/
theorem rs_R010_ueqv_R010YY_partial_11_0013_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_11_0013
        rs_R010_ueqv_R010YY_generator_11_0000_0066 =
      rs_R010_ueqv_R010YY_partial_11_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 11. -/
def rs_R010_ueqv_R010YY_coefficient_11_0014 : Poly :=
[
  term ((14032 : Rat) / 25) [(1, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 14 for generator 11. -/
def rs_R010_ueqv_R010YY_partial_11_0014 : Poly :=
[
  term ((28064 : Rat) / 25) [(1, 1), (2, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((28064 : Rat) / 25) [(1, 1), (3, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-14032 : Rat) / 25) [(1, 1), (6, 2), (8, 1), (15, 1), (16, 1)],
  term ((-14032 : Rat) / 25) [(1, 1), (7, 2), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 11. -/
theorem rs_R010_ueqv_R010YY_partial_11_0014_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_11_0014
        rs_R010_ueqv_R010YY_generator_11_0000_0066 =
      rs_R010_ueqv_R010YY_partial_11_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 11. -/
def rs_R010_ueqv_R010YY_coefficient_11_0015 : Poly :=
[
  term ((18564 : Rat) / 25) [(1, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 15 for generator 11. -/
def rs_R010_ueqv_R010YY_partial_11_0015 : Poly :=
[
  term ((37128 : Rat) / 25) [(1, 1), (2, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((37128 : Rat) / 25) [(1, 1), (3, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-18564 : Rat) / 25) [(1, 1), (6, 2), (14, 1), (15, 1), (16, 1)],
  term ((-18564 : Rat) / 25) [(1, 1), (7, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 11. -/
theorem rs_R010_ueqv_R010YY_partial_11_0015_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_11_0015
        rs_R010_ueqv_R010YY_generator_11_0000_0066 =
      rs_R010_ueqv_R010YY_partial_11_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 11. -/
def rs_R010_ueqv_R010YY_coefficient_11_0016 : Poly :=
[
  term ((-3924 : Rat) / 25) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 16 for generator 11. -/
def rs_R010_ueqv_R010YY_partial_11_0016 : Poly :=
[
  term ((-7848 : Rat) / 25) [(1, 1), (2, 1), (6, 1), (15, 1), (16, 1)],
  term ((-7848 : Rat) / 25) [(1, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((3924 : Rat) / 25) [(1, 1), (6, 2), (15, 1), (16, 1)],
  term ((3924 : Rat) / 25) [(1, 1), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 11. -/
theorem rs_R010_ueqv_R010YY_partial_11_0016_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_11_0016
        rs_R010_ueqv_R010YY_generator_11_0000_0066 =
      rs_R010_ueqv_R010YY_partial_11_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 11. -/
def rs_R010_ueqv_R010YY_coefficient_11_0017 : Poly :=
[
  term ((5752 : Rat) / 15) [(1, 1), (15, 3), (16, 1)]
]

/-- Partial product 17 for generator 11. -/
def rs_R010_ueqv_R010YY_partial_11_0017 : Poly :=
[
  term ((11504 : Rat) / 15) [(1, 1), (2, 1), (6, 1), (15, 3), (16, 1)],
  term ((11504 : Rat) / 15) [(1, 1), (3, 1), (7, 1), (15, 3), (16, 1)],
  term ((-5752 : Rat) / 15) [(1, 1), (6, 2), (15, 3), (16, 1)],
  term ((-5752 : Rat) / 15) [(1, 1), (7, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 11. -/
theorem rs_R010_ueqv_R010YY_partial_11_0017_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_11_0017
        rs_R010_ueqv_R010YY_generator_11_0000_0066 =
      rs_R010_ueqv_R010YY_partial_11_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 11. -/
def rs_R010_ueqv_R010YY_coefficient_11_0018 : Poly :=
[
  term ((21336 : Rat) / 25) [(1, 2), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 18 for generator 11. -/
def rs_R010_ueqv_R010YY_partial_11_0018 : Poly :=
[
  term ((42672 : Rat) / 25) [(1, 2), (2, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((42672 : Rat) / 25) [(1, 2), (3, 1), (7, 2), (15, 1), (16, 1)],
  term ((-21336 : Rat) / 25) [(1, 2), (6, 2), (7, 1), (15, 1), (16, 1)],
  term ((-21336 : Rat) / 25) [(1, 2), (7, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 11. -/
theorem rs_R010_ueqv_R010YY_partial_11_0018_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_11_0018
        rs_R010_ueqv_R010YY_generator_11_0000_0066 =
      rs_R010_ueqv_R010YY_partial_11_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 11. -/
def rs_R010_ueqv_R010YY_coefficient_11_0019 : Poly :=
[
  term ((20016 : Rat) / 25) [(1, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 19 for generator 11. -/
def rs_R010_ueqv_R010YY_partial_11_0019 : Poly :=
[
  term ((40032 : Rat) / 25) [(1, 2), (2, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((40032 : Rat) / 25) [(1, 2), (3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-20016 : Rat) / 25) [(1, 2), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((-20016 : Rat) / 25) [(1, 2), (7, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 11. -/
theorem rs_R010_ueqv_R010YY_partial_11_0019_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_11_0019
        rs_R010_ueqv_R010YY_generator_11_0000_0066 =
      rs_R010_ueqv_R010YY_partial_11_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 11. -/
def rs_R010_ueqv_R010YY_coefficient_11_0020 : Poly :=
[
  term ((103864 : Rat) / 75) [(1, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 20 for generator 11. -/
def rs_R010_ueqv_R010YY_partial_11_0020 : Poly :=
[
  term ((207728 : Rat) / 75) [(1, 2), (2, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((207728 : Rat) / 75) [(1, 2), (3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-103864 : Rat) / 75) [(1, 2), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-103864 : Rat) / 75) [(1, 2), (7, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 11. -/
theorem rs_R010_ueqv_R010YY_partial_11_0020_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_11_0020
        rs_R010_ueqv_R010YY_generator_11_0000_0066 =
      rs_R010_ueqv_R010YY_partial_11_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 11. -/
def rs_R010_ueqv_R010YY_coefficient_11_0021 : Poly :=
[
  term ((-8 : Rat) / 3) [(1, 2), (14, 1), (16, 1)]
]

/-- Partial product 21 for generator 11. -/
def rs_R010_ueqv_R010YY_partial_11_0021 : Poly :=
[
  term ((-16 : Rat) / 3) [(1, 2), (2, 1), (6, 1), (14, 1), (16, 1)],
  term ((-16 : Rat) / 3) [(1, 2), (3, 1), (7, 1), (14, 1), (16, 1)],
  term ((8 : Rat) / 3) [(1, 2), (6, 2), (14, 1), (16, 1)],
  term ((8 : Rat) / 3) [(1, 2), (7, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 11. -/
theorem rs_R010_ueqv_R010YY_partial_11_0021_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_11_0021
        rs_R010_ueqv_R010YY_generator_11_0000_0066 =
      rs_R010_ueqv_R010YY_partial_11_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 11. -/
def rs_R010_ueqv_R010YY_coefficient_11_0022 : Poly :=
[
  term ((-104 : Rat) / 25) [(1, 2), (15, 2), (16, 1)]
]

/-- Partial product 22 for generator 11. -/
def rs_R010_ueqv_R010YY_partial_11_0022 : Poly :=
[
  term ((-208 : Rat) / 25) [(1, 2), (2, 1), (6, 1), (15, 2), (16, 1)],
  term ((-208 : Rat) / 25) [(1, 2), (3, 1), (7, 1), (15, 2), (16, 1)],
  term ((104 : Rat) / 25) [(1, 2), (6, 2), (15, 2), (16, 1)],
  term ((104 : Rat) / 25) [(1, 2), (7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 11. -/
theorem rs_R010_ueqv_R010YY_partial_11_0022_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_11_0022
        rs_R010_ueqv_R010YY_generator_11_0000_0066 =
      rs_R010_ueqv_R010YY_partial_11_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 11. -/
def rs_R010_ueqv_R010YY_coefficient_11_0023 : Poly :=
[
  term ((-16 : Rat) / 3) [(1, 2), (16, 1)]
]

/-- Partial product 23 for generator 11. -/
def rs_R010_ueqv_R010YY_partial_11_0023 : Poly :=
[
  term ((-32 : Rat) / 3) [(1, 2), (2, 1), (6, 1), (16, 1)],
  term ((-32 : Rat) / 3) [(1, 2), (3, 1), (7, 1), (16, 1)],
  term ((16 : Rat) / 3) [(1, 2), (6, 2), (16, 1)],
  term ((16 : Rat) / 3) [(1, 2), (7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 11. -/
theorem rs_R010_ueqv_R010YY_partial_11_0023_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_11_0023
        rs_R010_ueqv_R010YY_generator_11_0000_0066 =
      rs_R010_ueqv_R010YY_partial_11_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 11. -/
def rs_R010_ueqv_R010YY_coefficient_11_0024 : Poly :=
[
  term ((-5752 : Rat) / 15) [(1, 3), (15, 1), (16, 1)]
]

/-- Partial product 24 for generator 11. -/
def rs_R010_ueqv_R010YY_partial_11_0024 : Poly :=
[
  term ((-11504 : Rat) / 15) [(1, 3), (2, 1), (6, 1), (15, 1), (16, 1)],
  term ((-11504 : Rat) / 15) [(1, 3), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((5752 : Rat) / 15) [(1, 3), (6, 2), (15, 1), (16, 1)],
  term ((5752 : Rat) / 15) [(1, 3), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 11. -/
theorem rs_R010_ueqv_R010YY_partial_11_0024_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_11_0024
        rs_R010_ueqv_R010YY_generator_11_0000_0066 =
      rs_R010_ueqv_R010YY_partial_11_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 11. -/
def rs_R010_ueqv_R010YY_coefficient_11_0025 : Poly :=
[
  term ((2688 : Rat) / 25) [(3, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 25 for generator 11. -/
def rs_R010_ueqv_R010YY_partial_11_0025 : Poly :=
[
  term ((5376 : Rat) / 25) [(2, 1), (3, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((-2688 : Rat) / 25) [(3, 1), (4, 1), (6, 2), (15, 1), (16, 1)],
  term ((-2688 : Rat) / 25) [(3, 1), (4, 1), (7, 2), (15, 1), (16, 1)],
  term ((5376 : Rat) / 25) [(3, 2), (4, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 11. -/
theorem rs_R010_ueqv_R010YY_partial_11_0025_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_11_0025
        rs_R010_ueqv_R010YY_generator_11_0000_0066 =
      rs_R010_ueqv_R010YY_partial_11_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 11. -/
def rs_R010_ueqv_R010YY_coefficient_11_0026 : Poly :=
[
  term ((-3464 : Rat) / 25) [(3, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 26 for generator 11. -/
def rs_R010_ueqv_R010YY_partial_11_0026 : Poly :=
[
  term ((-6928 : Rat) / 25) [(2, 1), (3, 1), (6, 2), (15, 1), (16, 1)],
  term ((3464 : Rat) / 25) [(3, 1), (6, 1), (7, 2), (15, 1), (16, 1)],
  term ((3464 : Rat) / 25) [(3, 1), (6, 3), (15, 1), (16, 1)],
  term ((-6928 : Rat) / 25) [(3, 2), (6, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 11. -/
theorem rs_R010_ueqv_R010YY_partial_11_0026_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_11_0026
        rs_R010_ueqv_R010YY_generator_11_0000_0066 =
      rs_R010_ueqv_R010YY_partial_11_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 11. -/
def rs_R010_ueqv_R010YY_coefficient_11_0027 : Poly :=
[
  term ((3584 : Rat) / 25) [(3, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 27 for generator 11. -/
def rs_R010_ueqv_R010YY_partial_11_0027 : Poly :=
[
  term ((7168 : Rat) / 25) [(2, 1), (3, 1), (6, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(3, 1), (6, 2), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(3, 1), (7, 3), (9, 1), (15, 1), (16, 1)],
  term ((7168 : Rat) / 25) [(3, 2), (7, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 11. -/
theorem rs_R010_ueqv_R010YY_partial_11_0027_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_11_0027
        rs_R010_ueqv_R010YY_generator_11_0000_0066 =
      rs_R010_ueqv_R010YY_partial_11_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 11. -/
def rs_R010_ueqv_R010YY_coefficient_11_0028 : Poly :=
[
  term ((3584 : Rat) / 25) [(3, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 28 for generator 11. -/
def rs_R010_ueqv_R010YY_partial_11_0028 : Poly :=
[
  term ((7168 : Rat) / 25) [(2, 1), (3, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(3, 1), (6, 2), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(3, 1), (7, 3), (11, 1), (15, 1), (16, 1)],
  term ((7168 : Rat) / 25) [(3, 2), (7, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 11. -/
theorem rs_R010_ueqv_R010YY_partial_11_0028_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_11_0028
        rs_R010_ueqv_R010YY_generator_11_0000_0066 =
      rs_R010_ueqv_R010YY_partial_11_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 11. -/
def rs_R010_ueqv_R010YY_coefficient_11_0029 : Poly :=
[
  term (-4 : Rat) [(3, 1), (7, 1), (16, 1)]
]

/-- Partial product 29 for generator 11. -/
def rs_R010_ueqv_R010YY_partial_11_0029 : Poly :=
[
  term (-8 : Rat) [(2, 1), (3, 1), (6, 1), (7, 1), (16, 1)],
  term (4 : Rat) [(3, 1), (6, 2), (7, 1), (16, 1)],
  term (4 : Rat) [(3, 1), (7, 3), (16, 1)],
  term (-8 : Rat) [(3, 2), (7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 11. -/
theorem rs_R010_ueqv_R010YY_partial_11_0029_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_11_0029
        rs_R010_ueqv_R010YY_generator_11_0000_0066 =
      rs_R010_ueqv_R010YY_partial_11_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 11. -/
def rs_R010_ueqv_R010YY_coefficient_11_0030 : Poly :=
[
  term ((-2368 : Rat) / 5) [(3, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 30 for generator 11. -/
def rs_R010_ueqv_R010YY_partial_11_0030 : Poly :=
[
  term ((-4736 : Rat) / 5) [(2, 1), (3, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((2368 : Rat) / 5) [(3, 1), (6, 2), (8, 1), (15, 1), (16, 1)],
  term ((2368 : Rat) / 5) [(3, 1), (7, 2), (8, 1), (15, 1), (16, 1)],
  term ((-4736 : Rat) / 5) [(3, 2), (7, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 11. -/
theorem rs_R010_ueqv_R010YY_partial_11_0030_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_11_0030
        rs_R010_ueqv_R010YY_generator_11_0000_0066 =
      rs_R010_ueqv_R010YY_partial_11_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 11. -/
def rs_R010_ueqv_R010YY_coefficient_11_0031 : Poly :=
[
  term ((5616 : Rat) / 25) [(3, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 31 for generator 11. -/
def rs_R010_ueqv_R010YY_partial_11_0031 : Poly :=
[
  term ((11232 : Rat) / 25) [(2, 1), (3, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5616 : Rat) / 25) [(3, 1), (6, 2), (14, 1), (15, 1), (16, 1)],
  term ((-5616 : Rat) / 25) [(3, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((11232 : Rat) / 25) [(3, 2), (7, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 11. -/
theorem rs_R010_ueqv_R010YY_partial_11_0031_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_11_0031
        rs_R010_ueqv_R010YY_generator_11_0000_0066 =
      rs_R010_ueqv_R010YY_partial_11_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 11. -/
def rs_R010_ueqv_R010YY_coefficient_11_0032 : Poly :=
[
  term (280 : Rat) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 32 for generator 11. -/
def rs_R010_ueqv_R010YY_partial_11_0032 : Poly :=
[
  term (560 : Rat) [(2, 1), (3, 1), (6, 1), (15, 1), (16, 1)],
  term (-280 : Rat) [(3, 1), (6, 2), (15, 1), (16, 1)],
  term (-280 : Rat) [(3, 1), (7, 2), (15, 1), (16, 1)],
  term (560 : Rat) [(3, 2), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 11. -/
theorem rs_R010_ueqv_R010YY_partial_11_0032_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_11_0032
        rs_R010_ueqv_R010YY_generator_11_0000_0066 =
      rs_R010_ueqv_R010YY_partial_11_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 11. -/
def rs_R010_ueqv_R010YY_coefficient_11_0033 : Poly :=
[
  term ((-896 : Rat) / 25) [(4, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 33 for generator 11. -/
def rs_R010_ueqv_R010YY_partial_11_0033 : Poly :=
[
  term ((-1792 : Rat) / 25) [(2, 1), (4, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(3, 1), (4, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((896 : Rat) / 25) [(4, 1), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((896 : Rat) / 25) [(4, 1), (7, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 11. -/
theorem rs_R010_ueqv_R010YY_partial_11_0033_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_11_0033
        rs_R010_ueqv_R010YY_generator_11_0000_0066 =
      rs_R010_ueqv_R010YY_partial_11_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 11. -/
def rs_R010_ueqv_R010YY_coefficient_11_0034 : Poly :=
[
  term ((-3584 : Rat) / 25) [(4, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 34 for generator 11. -/
def rs_R010_ueqv_R010YY_partial_11_0034 : Poly :=
[
  term ((-7168 : Rat) / 25) [(2, 1), (4, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-7168 : Rat) / 25) [(3, 1), (4, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(4, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(4, 1), (7, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 11. -/
theorem rs_R010_ueqv_R010YY_partial_11_0034_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_11_0034
        rs_R010_ueqv_R010YY_generator_11_0000_0066 =
      rs_R010_ueqv_R010YY_partial_11_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 11. -/
def rs_R010_ueqv_R010YY_coefficient_11_0035 : Poly :=
[
  term ((-2688 : Rat) / 25) [(4, 1), (15, 2), (16, 1)]
]

/-- Partial product 35 for generator 11. -/
def rs_R010_ueqv_R010YY_partial_11_0035 : Poly :=
[
  term ((-5376 : Rat) / 25) [(2, 1), (4, 1), (6, 1), (15, 2), (16, 1)],
  term ((-5376 : Rat) / 25) [(3, 1), (4, 1), (7, 1), (15, 2), (16, 1)],
  term ((2688 : Rat) / 25) [(4, 1), (6, 2), (15, 2), (16, 1)],
  term ((2688 : Rat) / 25) [(4, 1), (7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 11. -/
theorem rs_R010_ueqv_R010YY_partial_11_0035_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_11_0035
        rs_R010_ueqv_R010YY_generator_11_0000_0066 =
      rs_R010_ueqv_R010YY_partial_11_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 11. -/
def rs_R010_ueqv_R010YY_coefficient_11_0036 : Poly :=
[
  term ((-896 : Rat) / 25) [(5, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 36 for generator 11. -/
def rs_R010_ueqv_R010YY_partial_11_0036 : Poly :=
[
  term ((-1792 : Rat) / 25) [(2, 1), (5, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(3, 1), (5, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((896 : Rat) / 25) [(5, 1), (6, 2), (8, 1), (15, 1), (16, 1)],
  term ((896 : Rat) / 25) [(5, 1), (7, 2), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 11. -/
theorem rs_R010_ueqv_R010YY_partial_11_0036_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_11_0036
        rs_R010_ueqv_R010YY_generator_11_0000_0066 =
      rs_R010_ueqv_R010YY_partial_11_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 11. -/
def rs_R010_ueqv_R010YY_coefficient_11_0037 : Poly :=
[
  term ((-3584 : Rat) / 25) [(5, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 37 for generator 11. -/
def rs_R010_ueqv_R010YY_partial_11_0037 : Poly :=
[
  term ((-7168 : Rat) / 25) [(2, 1), (5, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((-7168 : Rat) / 25) [(3, 1), (5, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((3584 : Rat) / 25) [(5, 1), (6, 2), (9, 1), (15, 2), (16, 1)],
  term ((3584 : Rat) / 25) [(5, 1), (7, 2), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 11. -/
theorem rs_R010_ueqv_R010YY_partial_11_0037_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_11_0037
        rs_R010_ueqv_R010YY_generator_11_0000_0066 =
      rs_R010_ueqv_R010YY_partial_11_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 11. -/
def rs_R010_ueqv_R010YY_coefficient_11_0038 : Poly :=
[
  term ((1792 : Rat) / 25) [(5, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 38 for generator 11. -/
def rs_R010_ueqv_R010YY_partial_11_0038 : Poly :=
[
  term ((3584 : Rat) / 25) [(2, 1), (5, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(3, 1), (5, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(5, 1), (6, 2), (10, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(5, 1), (7, 2), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 11. -/
theorem rs_R010_ueqv_R010YY_partial_11_0038_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_11_0038
        rs_R010_ueqv_R010YY_generator_11_0000_0066 =
      rs_R010_ueqv_R010YY_partial_11_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 11. -/
def rs_R010_ueqv_R010YY_coefficient_11_0039 : Poly :=
[
  term ((-3584 : Rat) / 25) [(5, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 39 for generator 11. -/
def rs_R010_ueqv_R010YY_partial_11_0039 : Poly :=
[
  term ((-7168 : Rat) / 25) [(2, 1), (5, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((-7168 : Rat) / 25) [(3, 1), (5, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((3584 : Rat) / 25) [(5, 1), (6, 2), (11, 1), (15, 2), (16, 1)],
  term ((3584 : Rat) / 25) [(5, 1), (7, 2), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 11. -/
theorem rs_R010_ueqv_R010YY_partial_11_0039_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_11_0039
        rs_R010_ueqv_R010YY_generator_11_0000_0066 =
      rs_R010_ueqv_R010YY_partial_11_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 11. -/
def rs_R010_ueqv_R010YY_coefficient_11_0040 : Poly :=
[
  term ((448 : Rat) / 25) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 40 for generator 11. -/
def rs_R010_ueqv_R010YY_partial_11_0040 : Poly :=
[
  term ((896 : Rat) / 25) [(2, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((896 : Rat) / 25) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-448 : Rat) / 25) [(5, 1), (6, 2), (15, 1), (16, 1)],
  term ((-448 : Rat) / 25) [(5, 1), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 11. -/
theorem rs_R010_ueqv_R010YY_partial_11_0040_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_11_0040
        rs_R010_ueqv_R010YY_generator_11_0000_0066 =
      rs_R010_ueqv_R010YY_partial_11_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 11. -/
def rs_R010_ueqv_R010YY_coefficient_11_0041 : Poly :=
[
  term ((1792 : Rat) / 25) [(6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 41 for generator 11. -/
def rs_R010_ueqv_R010YY_partial_11_0041 : Poly :=
[
  term ((3584 : Rat) / 25) [(2, 1), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(3, 1), (6, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(6, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(6, 3), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 11. -/
theorem rs_R010_ueqv_R010YY_partial_11_0041_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_11_0041
        rs_R010_ueqv_R010YY_generator_11_0000_0066 =
      rs_R010_ueqv_R010YY_partial_11_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 11. -/
def rs_R010_ueqv_R010YY_coefficient_11_0042 : Poly :=
[
  term ((1792 : Rat) / 25) [(6, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 42 for generator 11. -/
def rs_R010_ueqv_R010YY_partial_11_0042 : Poly :=
[
  term ((3584 : Rat) / 25) [(2, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(3, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(6, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(6, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 11. -/
theorem rs_R010_ueqv_R010YY_partial_11_0042_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_11_0042
        rs_R010_ueqv_R010YY_generator_11_0000_0066 =
      rs_R010_ueqv_R010YY_partial_11_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 11. -/
def rs_R010_ueqv_R010YY_coefficient_11_0043 : Poly :=
[
  term ((22804 : Rat) / 25) [(6, 1), (15, 2), (16, 1)]
]

/-- Partial product 43 for generator 11. -/
def rs_R010_ueqv_R010YY_partial_11_0043 : Poly :=
[
  term ((45608 : Rat) / 25) [(2, 1), (6, 2), (15, 2), (16, 1)],
  term ((45608 : Rat) / 25) [(3, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((-22804 : Rat) / 25) [(6, 1), (7, 2), (15, 2), (16, 1)],
  term ((-22804 : Rat) / 25) [(6, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 11. -/
theorem rs_R010_ueqv_R010YY_partial_11_0043_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_11_0043
        rs_R010_ueqv_R010YY_generator_11_0000_0066 =
      rs_R010_ueqv_R010YY_partial_11_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 11. -/
def rs_R010_ueqv_R010YY_coefficient_11_0044 : Poly :=
[
  term (-2 : Rat) [(6, 1), (16, 1)]
]

/-- Partial product 44 for generator 11. -/
def rs_R010_ueqv_R010YY_partial_11_0044 : Poly :=
[
  term (-4 : Rat) [(2, 1), (6, 2), (16, 1)],
  term (-4 : Rat) [(3, 1), (6, 1), (7, 1), (16, 1)],
  term (2 : Rat) [(6, 1), (7, 2), (16, 1)],
  term (2 : Rat) [(6, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 11. -/
theorem rs_R010_ueqv_R010YY_partial_11_0044_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_11_0044
        rs_R010_ueqv_R010YY_generator_11_0000_0066 =
      rs_R010_ueqv_R010YY_partial_11_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 11. -/
def rs_R010_ueqv_R010YY_coefficient_11_0045 : Poly :=
[
  term ((24448 : Rat) / 25) [(7, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 45 for generator 11. -/
def rs_R010_ueqv_R010YY_partial_11_0045 : Poly :=
[
  term ((48896 : Rat) / 25) [(2, 1), (6, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((48896 : Rat) / 25) [(3, 1), (7, 2), (9, 1), (15, 2), (16, 1)],
  term ((-24448 : Rat) / 25) [(6, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-24448 : Rat) / 25) [(7, 3), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 11. -/
theorem rs_R010_ueqv_R010YY_partial_11_0045_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_11_0045
        rs_R010_ueqv_R010YY_generator_11_0000_0066 =
      rs_R010_ueqv_R010YY_partial_11_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 11. -/
def rs_R010_ueqv_R010YY_coefficient_11_0046 : Poly :=
[
  term ((127952 : Rat) / 75) [(7, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 46 for generator 11. -/
def rs_R010_ueqv_R010YY_partial_11_0046 : Poly :=
[
  term ((255904 : Rat) / 75) [(2, 1), (6, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((255904 : Rat) / 75) [(3, 1), (7, 2), (11, 1), (15, 2), (16, 1)],
  term ((-127952 : Rat) / 75) [(6, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-127952 : Rat) / 75) [(7, 3), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 11. -/
theorem rs_R010_ueqv_R010YY_partial_11_0046_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_11_0046
        rs_R010_ueqv_R010YY_generator_11_0000_0066 =
      rs_R010_ueqv_R010YY_partial_11_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 11. -/
def rs_R010_ueqv_R010YY_coefficient_11_0047 : Poly :=
[
  term ((-10132 : Rat) / 75) [(7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 47 for generator 11. -/
def rs_R010_ueqv_R010YY_partial_11_0047 : Poly :=
[
  term ((-20264 : Rat) / 75) [(2, 1), (6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-20264 : Rat) / 75) [(3, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((10132 : Rat) / 75) [(6, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((10132 : Rat) / 75) [(7, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 11. -/
theorem rs_R010_ueqv_R010YY_partial_11_0047_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_11_0047
        rs_R010_ueqv_R010YY_generator_11_0000_0066 =
      rs_R010_ueqv_R010YY_partial_11_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 11. -/
def rs_R010_ueqv_R010YY_coefficient_11_0048 : Poly :=
[
  term ((5296 : Rat) / 75) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 48 for generator 11. -/
def rs_R010_ueqv_R010YY_partial_11_0048 : Poly :=
[
  term ((10592 : Rat) / 75) [(2, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((10592 : Rat) / 75) [(3, 1), (7, 2), (15, 1), (16, 1)],
  term ((-5296 : Rat) / 75) [(6, 2), (7, 1), (15, 1), (16, 1)],
  term ((-5296 : Rat) / 75) [(7, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 11. -/
theorem rs_R010_ueqv_R010YY_partial_11_0048_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_11_0048
        rs_R010_ueqv_R010YY_generator_11_0000_0066 =
      rs_R010_ueqv_R010YY_partial_11_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 11. -/
def rs_R010_ueqv_R010YY_coefficient_11_0049 : Poly :=
[
  term ((17992 : Rat) / 75) [(7, 1), (15, 3), (16, 1)]
]

/-- Partial product 49 for generator 11. -/
def rs_R010_ueqv_R010YY_partial_11_0049 : Poly :=
[
  term ((35984 : Rat) / 75) [(2, 1), (6, 1), (7, 1), (15, 3), (16, 1)],
  term ((35984 : Rat) / 75) [(3, 1), (7, 2), (15, 3), (16, 1)],
  term ((-17992 : Rat) / 75) [(6, 2), (7, 1), (15, 3), (16, 1)],
  term ((-17992 : Rat) / 75) [(7, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 11. -/
theorem rs_R010_ueqv_R010YY_partial_11_0049_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_11_0049
        rs_R010_ueqv_R010YY_generator_11_0000_0066 =
      rs_R010_ueqv_R010YY_partial_11_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 11. -/
def rs_R010_ueqv_R010YY_coefficient_11_0050 : Poly :=
[
  term ((12976 : Rat) / 75) [(7, 2), (15, 2), (16, 1)]
]

/-- Partial product 50 for generator 11. -/
def rs_R010_ueqv_R010YY_partial_11_0050 : Poly :=
[
  term ((25952 : Rat) / 75) [(2, 1), (6, 1), (7, 2), (15, 2), (16, 1)],
  term ((25952 : Rat) / 75) [(3, 1), (7, 3), (15, 2), (16, 1)],
  term ((-12976 : Rat) / 75) [(6, 2), (7, 2), (15, 2), (16, 1)],
  term ((-12976 : Rat) / 75) [(7, 4), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 11. -/
theorem rs_R010_ueqv_R010YY_partial_11_0050_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_11_0050
        rs_R010_ueqv_R010YY_generator_11_0000_0066 =
      rs_R010_ueqv_R010YY_partial_11_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 11. -/
def rs_R010_ueqv_R010YY_coefficient_11_0051 : Poly :=
[
  term ((-5232 : Rat) / 25) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 51 for generator 11. -/
def rs_R010_ueqv_R010YY_partial_11_0051 : Poly :=
[
  term ((-10464 : Rat) / 25) [(2, 1), (6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-10464 : Rat) / 25) [(3, 1), (7, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((5232 : Rat) / 25) [(6, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((5232 : Rat) / 25) [(7, 2), (8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 11. -/
theorem rs_R010_ueqv_R010YY_partial_11_0051_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_11_0051
        rs_R010_ueqv_R010YY_generator_11_0000_0066 =
      rs_R010_ueqv_R010YY_partial_11_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 11. -/
def rs_R010_ueqv_R010YY_coefficient_11_0052 : Poly :=
[
  term ((15776 : Rat) / 25) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 52 for generator 11. -/
def rs_R010_ueqv_R010YY_partial_11_0052 : Poly :=
[
  term ((31552 : Rat) / 25) [(2, 1), (6, 1), (8, 1), (15, 2), (16, 1)],
  term ((31552 : Rat) / 25) [(3, 1), (7, 1), (8, 1), (15, 2), (16, 1)],
  term ((-15776 : Rat) / 25) [(6, 2), (8, 1), (15, 2), (16, 1)],
  term ((-15776 : Rat) / 25) [(7, 2), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 11. -/
theorem rs_R010_ueqv_R010YY_partial_11_0052_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_11_0052
        rs_R010_ueqv_R010YY_generator_11_0000_0066 =
      rs_R010_ueqv_R010YY_partial_11_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 11. -/
def rs_R010_ueqv_R010YY_coefficient_11_0053 : Poly :=
[
  term ((5832 : Rat) / 25) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 53 for generator 11. -/
def rs_R010_ueqv_R010YY_partial_11_0053 : Poly :=
[
  term ((11664 : Rat) / 25) [(2, 1), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((11664 : Rat) / 25) [(3, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5832 : Rat) / 25) [(6, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5832 : Rat) / 25) [(7, 2), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 11. -/
theorem rs_R010_ueqv_R010YY_partial_11_0053_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_11_0053
        rs_R010_ueqv_R010YY_generator_11_0000_0066 =
      rs_R010_ueqv_R010YY_partial_11_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 11. -/
def rs_R010_ueqv_R010YY_coefficient_11_0054 : Poly :=
[
  term ((-672 : Rat) / 5) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 54 for generator 11. -/
def rs_R010_ueqv_R010YY_partial_11_0054 : Poly :=
[
  term ((-1344 : Rat) / 5) [(2, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1344 : Rat) / 5) [(3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((672 : Rat) / 5) [(6, 2), (9, 1), (15, 1), (16, 1)],
  term ((672 : Rat) / 5) [(7, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 11. -/
theorem rs_R010_ueqv_R010YY_partial_11_0054_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_11_0054
        rs_R010_ueqv_R010YY_generator_11_0000_0066 =
      rs_R010_ueqv_R010YY_partial_11_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 11. -/
def rs_R010_ueqv_R010YY_coefficient_11_0055 : Poly :=
[
  term ((-16432 : Rat) / 25) [(9, 1), (15, 3), (16, 1)]
]

/-- Partial product 55 for generator 11. -/
def rs_R010_ueqv_R010YY_partial_11_0055 : Poly :=
[
  term ((-32864 : Rat) / 25) [(2, 1), (6, 1), (9, 1), (15, 3), (16, 1)],
  term ((-32864 : Rat) / 25) [(3, 1), (7, 1), (9, 1), (15, 3), (16, 1)],
  term ((16432 : Rat) / 25) [(6, 2), (9, 1), (15, 3), (16, 1)],
  term ((16432 : Rat) / 25) [(7, 2), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 11. -/
theorem rs_R010_ueqv_R010YY_partial_11_0055_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_11_0055
        rs_R010_ueqv_R010YY_generator_11_0000_0066 =
      rs_R010_ueqv_R010YY_partial_11_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 11. -/
def rs_R010_ueqv_R010YY_coefficient_11_0056 : Poly :=
[
  term ((-1792 : Rat) / 25) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 56 for generator 11. -/
def rs_R010_ueqv_R010YY_partial_11_0056 : Poly :=
[
  term ((-3584 : Rat) / 25) [(2, 1), (6, 1), (10, 1), (15, 2), (16, 1)],
  term ((-3584 : Rat) / 25) [(3, 1), (7, 1), (10, 1), (15, 2), (16, 1)],
  term ((1792 : Rat) / 25) [(6, 2), (10, 1), (15, 2), (16, 1)],
  term ((1792 : Rat) / 25) [(7, 2), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 11. -/
theorem rs_R010_ueqv_R010YY_partial_11_0056_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_11_0056
        rs_R010_ueqv_R010YY_generator_11_0000_0066 =
      rs_R010_ueqv_R010YY_partial_11_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 11. -/
def rs_R010_ueqv_R010YY_coefficient_11_0057 : Poly :=
[
  term (1 : Rat) [(10, 1), (16, 1)]
]

/-- Partial product 57 for generator 11. -/
def rs_R010_ueqv_R010YY_partial_11_0057 : Poly :=
[
  term (2 : Rat) [(2, 1), (6, 1), (10, 1), (16, 1)],
  term (2 : Rat) [(3, 1), (7, 1), (10, 1), (16, 1)],
  term (-1 : Rat) [(6, 2), (10, 1), (16, 1)],
  term (-1 : Rat) [(7, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 11. -/
theorem rs_R010_ueqv_R010YY_partial_11_0057_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_11_0057
        rs_R010_ueqv_R010YY_generator_11_0000_0066 =
      rs_R010_ueqv_R010YY_partial_11_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 11. -/
def rs_R010_ueqv_R010YY_coefficient_11_0058 : Poly :=
[
  term (2 : Rat) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 58 for generator 11. -/
def rs_R010_ueqv_R010YY_partial_11_0058 : Poly :=
[
  term (4 : Rat) [(2, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term (4 : Rat) [(3, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term (-2 : Rat) [(6, 2), (11, 1), (13, 1), (16, 1)],
  term (-2 : Rat) [(7, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 11. -/
theorem rs_R010_ueqv_R010YY_partial_11_0058_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_11_0058
        rs_R010_ueqv_R010YY_generator_11_0000_0066 =
      rs_R010_ueqv_R010YY_partial_11_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 11. -/
def rs_R010_ueqv_R010YY_coefficient_11_0059 : Poly :=
[
  term ((3008 : Rat) / 5) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 59 for generator 11. -/
def rs_R010_ueqv_R010YY_partial_11_0059 : Poly :=
[
  term ((6016 : Rat) / 5) [(2, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((6016 : Rat) / 5) [(3, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3008 : Rat) / 5) [(6, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3008 : Rat) / 5) [(7, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 11. -/
theorem rs_R010_ueqv_R010YY_partial_11_0059_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_11_0059
        rs_R010_ueqv_R010YY_generator_11_0000_0066 =
      rs_R010_ueqv_R010YY_partial_11_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 11. -/
def rs_R010_ueqv_R010YY_coefficient_11_0060 : Poly :=
[
  term ((-93112 : Rat) / 75) [(11, 1), (15, 3), (16, 1)]
]

/-- Partial product 60 for generator 11. -/
def rs_R010_ueqv_R010YY_partial_11_0060 : Poly :=
[
  term ((-186224 : Rat) / 75) [(2, 1), (6, 1), (11, 1), (15, 3), (16, 1)],
  term ((-186224 : Rat) / 75) [(3, 1), (7, 1), (11, 1), (15, 3), (16, 1)],
  term ((93112 : Rat) / 75) [(6, 2), (11, 1), (15, 3), (16, 1)],
  term ((93112 : Rat) / 75) [(7, 2), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 11. -/
theorem rs_R010_ueqv_R010YY_partial_11_0060_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_11_0060
        rs_R010_ueqv_R010YY_generator_11_0000_0066 =
      rs_R010_ueqv_R010YY_partial_11_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 11. -/
def rs_R010_ueqv_R010YY_coefficient_11_0061 : Poly :=
[
  term (-2 : Rat) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 61 for generator 11. -/
def rs_R010_ueqv_R010YY_partial_11_0061 : Poly :=
[
  term (-4 : Rat) [(2, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(7, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 11. -/
theorem rs_R010_ueqv_R010YY_partial_11_0061_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_11_0061
        rs_R010_ueqv_R010YY_generator_11_0000_0066 =
      rs_R010_ueqv_R010YY_partial_11_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 11. -/
def rs_R010_ueqv_R010YY_coefficient_11_0062 : Poly :=
[
  term ((-139036 : Rat) / 75) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 62 for generator 11. -/
def rs_R010_ueqv_R010YY_partial_11_0062 : Poly :=
[
  term ((-278072 : Rat) / 75) [(2, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-278072 : Rat) / 75) [(3, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((139036 : Rat) / 75) [(6, 2), (14, 1), (15, 2), (16, 1)],
  term ((139036 : Rat) / 75) [(7, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 11. -/
theorem rs_R010_ueqv_R010YY_partial_11_0062_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_11_0062
        rs_R010_ueqv_R010YY_generator_11_0000_0066 =
      rs_R010_ueqv_R010YY_partial_11_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 11. -/
def rs_R010_ueqv_R010YY_coefficient_11_0063 : Poly :=
[
  term (-1 : Rat) [(14, 1), (16, 1)]
]

/-- Partial product 63 for generator 11. -/
def rs_R010_ueqv_R010YY_partial_11_0063 : Poly :=
[
  term (-2 : Rat) [(2, 1), (6, 1), (14, 1), (16, 1)],
  term (-2 : Rat) [(3, 1), (7, 1), (14, 1), (16, 1)],
  term (1 : Rat) [(6, 2), (14, 1), (16, 1)],
  term (1 : Rat) [(7, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 11. -/
theorem rs_R010_ueqv_R010YY_partial_11_0063_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_11_0063
        rs_R010_ueqv_R010YY_generator_11_0000_0066 =
      rs_R010_ueqv_R010YY_partial_11_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 11. -/
def rs_R010_ueqv_R010YY_coefficient_11_0064 : Poly :=
[
  term (4 : Rat) [(14, 2), (16, 1)]
]

/-- Partial product 64 for generator 11. -/
def rs_R010_ueqv_R010YY_partial_11_0064 : Poly :=
[
  term (8 : Rat) [(2, 1), (6, 1), (14, 2), (16, 1)],
  term (8 : Rat) [(3, 1), (7, 1), (14, 2), (16, 1)],
  term (-4 : Rat) [(6, 2), (14, 2), (16, 1)],
  term (-4 : Rat) [(7, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 11. -/
theorem rs_R010_ueqv_R010YY_partial_11_0064_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_11_0064
        rs_R010_ueqv_R010YY_generator_11_0000_0066 =
      rs_R010_ueqv_R010YY_partial_11_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 11. -/
def rs_R010_ueqv_R010YY_coefficient_11_0065 : Poly :=
[
  term ((-31172 : Rat) / 75) [(15, 2), (16, 1)]
]

/-- Partial product 65 for generator 11. -/
def rs_R010_ueqv_R010YY_partial_11_0065 : Poly :=
[
  term ((-62344 : Rat) / 75) [(2, 1), (6, 1), (15, 2), (16, 1)],
  term ((-62344 : Rat) / 75) [(3, 1), (7, 1), (15, 2), (16, 1)],
  term ((31172 : Rat) / 75) [(6, 2), (15, 2), (16, 1)],
  term ((31172 : Rat) / 75) [(7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 11. -/
theorem rs_R010_ueqv_R010YY_partial_11_0065_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_11_0065
        rs_R010_ueqv_R010YY_generator_11_0000_0066 =
      rs_R010_ueqv_R010YY_partial_11_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 11. -/
def rs_R010_ueqv_R010YY_coefficient_11_0066 : Poly :=
[
  term ((104 : Rat) / 25) [(15, 4), (16, 1)]
]

/-- Partial product 66 for generator 11. -/
def rs_R010_ueqv_R010YY_partial_11_0066 : Poly :=
[
  term ((208 : Rat) / 25) [(2, 1), (6, 1), (15, 4), (16, 1)],
  term ((208 : Rat) / 25) [(3, 1), (7, 1), (15, 4), (16, 1)],
  term ((-104 : Rat) / 25) [(6, 2), (15, 4), (16, 1)],
  term ((-104 : Rat) / 25) [(7, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 11. -/
theorem rs_R010_ueqv_R010YY_partial_11_0066_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_11_0066
        rs_R010_ueqv_R010YY_generator_11_0000_0066 =
      rs_R010_ueqv_R010YY_partial_11_0066 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010YY_partials_11_0000_0066 : List Poly :=
[
  rs_R010_ueqv_R010YY_partial_11_0000,
  rs_R010_ueqv_R010YY_partial_11_0001,
  rs_R010_ueqv_R010YY_partial_11_0002,
  rs_R010_ueqv_R010YY_partial_11_0003,
  rs_R010_ueqv_R010YY_partial_11_0004,
  rs_R010_ueqv_R010YY_partial_11_0005,
  rs_R010_ueqv_R010YY_partial_11_0006,
  rs_R010_ueqv_R010YY_partial_11_0007,
  rs_R010_ueqv_R010YY_partial_11_0008,
  rs_R010_ueqv_R010YY_partial_11_0009,
  rs_R010_ueqv_R010YY_partial_11_0010,
  rs_R010_ueqv_R010YY_partial_11_0011,
  rs_R010_ueqv_R010YY_partial_11_0012,
  rs_R010_ueqv_R010YY_partial_11_0013,
  rs_R010_ueqv_R010YY_partial_11_0014,
  rs_R010_ueqv_R010YY_partial_11_0015,
  rs_R010_ueqv_R010YY_partial_11_0016,
  rs_R010_ueqv_R010YY_partial_11_0017,
  rs_R010_ueqv_R010YY_partial_11_0018,
  rs_R010_ueqv_R010YY_partial_11_0019,
  rs_R010_ueqv_R010YY_partial_11_0020,
  rs_R010_ueqv_R010YY_partial_11_0021,
  rs_R010_ueqv_R010YY_partial_11_0022,
  rs_R010_ueqv_R010YY_partial_11_0023,
  rs_R010_ueqv_R010YY_partial_11_0024,
  rs_R010_ueqv_R010YY_partial_11_0025,
  rs_R010_ueqv_R010YY_partial_11_0026,
  rs_R010_ueqv_R010YY_partial_11_0027,
  rs_R010_ueqv_R010YY_partial_11_0028,
  rs_R010_ueqv_R010YY_partial_11_0029,
  rs_R010_ueqv_R010YY_partial_11_0030,
  rs_R010_ueqv_R010YY_partial_11_0031,
  rs_R010_ueqv_R010YY_partial_11_0032,
  rs_R010_ueqv_R010YY_partial_11_0033,
  rs_R010_ueqv_R010YY_partial_11_0034,
  rs_R010_ueqv_R010YY_partial_11_0035,
  rs_R010_ueqv_R010YY_partial_11_0036,
  rs_R010_ueqv_R010YY_partial_11_0037,
  rs_R010_ueqv_R010YY_partial_11_0038,
  rs_R010_ueqv_R010YY_partial_11_0039,
  rs_R010_ueqv_R010YY_partial_11_0040,
  rs_R010_ueqv_R010YY_partial_11_0041,
  rs_R010_ueqv_R010YY_partial_11_0042,
  rs_R010_ueqv_R010YY_partial_11_0043,
  rs_R010_ueqv_R010YY_partial_11_0044,
  rs_R010_ueqv_R010YY_partial_11_0045,
  rs_R010_ueqv_R010YY_partial_11_0046,
  rs_R010_ueqv_R010YY_partial_11_0047,
  rs_R010_ueqv_R010YY_partial_11_0048,
  rs_R010_ueqv_R010YY_partial_11_0049,
  rs_R010_ueqv_R010YY_partial_11_0050,
  rs_R010_ueqv_R010YY_partial_11_0051,
  rs_R010_ueqv_R010YY_partial_11_0052,
  rs_R010_ueqv_R010YY_partial_11_0053,
  rs_R010_ueqv_R010YY_partial_11_0054,
  rs_R010_ueqv_R010YY_partial_11_0055,
  rs_R010_ueqv_R010YY_partial_11_0056,
  rs_R010_ueqv_R010YY_partial_11_0057,
  rs_R010_ueqv_R010YY_partial_11_0058,
  rs_R010_ueqv_R010YY_partial_11_0059,
  rs_R010_ueqv_R010YY_partial_11_0060,
  rs_R010_ueqv_R010YY_partial_11_0061,
  rs_R010_ueqv_R010YY_partial_11_0062,
  rs_R010_ueqv_R010YY_partial_11_0063,
  rs_R010_ueqv_R010YY_partial_11_0064,
  rs_R010_ueqv_R010YY_partial_11_0065,
  rs_R010_ueqv_R010YY_partial_11_0066
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010YY_block_11_0000_0066 : Poly :=
[
  term ((-5752 : Rat) / 5) [(0, 1), (1, 1), (2, 1), (6, 1), (15, 1), (16, 1)],
  term ((-5752 : Rat) / 5) [(0, 1), (1, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((2876 : Rat) / 5) [(0, 1), (1, 1), (6, 2), (15, 1), (16, 1)],
  term ((2876 : Rat) / 5) [(0, 1), (1, 1), (7, 2), (15, 1), (16, 1)],
  term ((6488 : Rat) / 25) [(0, 1), (2, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-13456 : Rat) / 25) [(0, 1), (2, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-16032 : Rat) / 25) [(0, 1), (2, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(0, 1), (2, 1), (6, 1), (14, 1), (16, 1)],
  term ((46152 : Rat) / 25) [(0, 1), (2, 1), (6, 1), (15, 2), (16, 1)],
  term (4 : Rat) [(0, 1), (2, 1), (6, 1), (16, 1)],
  term ((-13456 : Rat) / 25) [(0, 1), (3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-16032 : Rat) / 25) [(0, 1), (3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(0, 1), (3, 1), (7, 1), (14, 1), (16, 1)],
  term ((46152 : Rat) / 25) [(0, 1), (3, 1), (7, 1), (15, 2), (16, 1)],
  term (4 : Rat) [(0, 1), (3, 1), (7, 1), (16, 1)],
  term ((6488 : Rat) / 25) [(0, 1), (3, 1), (7, 2), (15, 1), (16, 1)],
  term ((-3244 : Rat) / 25) [(0, 1), (6, 2), (7, 1), (15, 1), (16, 1)],
  term ((6728 : Rat) / 25) [(0, 1), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((8016 : Rat) / 25) [(0, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(0, 1), (6, 2), (14, 1), (16, 1)],
  term ((-23076 : Rat) / 25) [(0, 1), (6, 2), (15, 2), (16, 1)],
  term (-2 : Rat) [(0, 1), (6, 2), (16, 1)],
  term ((6728 : Rat) / 25) [(0, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((8016 : Rat) / 25) [(0, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(0, 1), (7, 2), (14, 1), (16, 1)],
  term ((-23076 : Rat) / 25) [(0, 1), (7, 2), (15, 2), (16, 1)],
  term (-2 : Rat) [(0, 1), (7, 2), (16, 1)],
  term ((-3244 : Rat) / 25) [(0, 1), (7, 3), (15, 1), (16, 1)],
  term ((-63232 : Rat) / 25) [(1, 1), (2, 1), (6, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-298912 : Rat) / 75) [(1, 1), (2, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 3) [(1, 1), (2, 1), (6, 1), (7, 1), (14, 1), (16, 1)],
  term ((-6560 : Rat) / 3) [(1, 1), (2, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((40 : Rat) / 3) [(1, 1), (2, 1), (6, 1), (7, 1), (16, 1)],
  term ((-25952 : Rat) / 75) [(1, 1), (2, 1), (6, 1), (7, 2), (15, 1), (16, 1)],
  term ((28064 : Rat) / 25) [(1, 1), (2, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((37128 : Rat) / 25) [(1, 1), (2, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7848 : Rat) / 25) [(1, 1), (2, 1), (6, 1), (15, 1), (16, 1)],
  term ((11504 : Rat) / 15) [(1, 1), (2, 1), (6, 1), (15, 3), (16, 1)],
  term ((-31752 : Rat) / 25) [(1, 1), (2, 1), (6, 2), (15, 1), (16, 1)],
  term ((-31752 : Rat) / 25) [(1, 1), (3, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((28064 : Rat) / 25) [(1, 1), (3, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((37128 : Rat) / 25) [(1, 1), (3, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7848 : Rat) / 25) [(1, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((11504 : Rat) / 15) [(1, 1), (3, 1), (7, 1), (15, 3), (16, 1)],
  term ((-63232 : Rat) / 25) [(1, 1), (3, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-298912 : Rat) / 75) [(1, 1), (3, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 3) [(1, 1), (3, 1), (7, 2), (14, 1), (16, 1)],
  term ((-6560 : Rat) / 3) [(1, 1), (3, 1), (7, 2), (15, 2), (16, 1)],
  term ((40 : Rat) / 3) [(1, 1), (3, 1), (7, 2), (16, 1)],
  term ((-25952 : Rat) / 75) [(1, 1), (3, 1), (7, 3), (15, 1), (16, 1)],
  term ((15876 : Rat) / 25) [(1, 1), (6, 1), (7, 2), (15, 1), (16, 1)],
  term ((31616 : Rat) / 25) [(1, 1), (6, 2), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((149456 : Rat) / 75) [(1, 1), (6, 2), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 3) [(1, 1), (6, 2), (7, 1), (14, 1), (16, 1)],
  term ((3280 : Rat) / 3) [(1, 1), (6, 2), (7, 1), (15, 2), (16, 1)],
  term ((-20 : Rat) / 3) [(1, 1), (6, 2), (7, 1), (16, 1)],
  term ((12976 : Rat) / 75) [(1, 1), (6, 2), (7, 2), (15, 1), (16, 1)],
  term ((-14032 : Rat) / 25) [(1, 1), (6, 2), (8, 1), (15, 1), (16, 1)],
  term ((-18564 : Rat) / 25) [(1, 1), (6, 2), (14, 1), (15, 1), (16, 1)],
  term ((3924 : Rat) / 25) [(1, 1), (6, 2), (15, 1), (16, 1)],
  term ((-5752 : Rat) / 15) [(1, 1), (6, 2), (15, 3), (16, 1)],
  term ((15876 : Rat) / 25) [(1, 1), (6, 3), (15, 1), (16, 1)],
  term ((-14032 : Rat) / 25) [(1, 1), (7, 2), (8, 1), (15, 1), (16, 1)],
  term ((-18564 : Rat) / 25) [(1, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((3924 : Rat) / 25) [(1, 1), (7, 2), (15, 1), (16, 1)],
  term ((-5752 : Rat) / 15) [(1, 1), (7, 2), (15, 3), (16, 1)],
  term ((31616 : Rat) / 25) [(1, 1), (7, 3), (9, 1), (15, 1), (16, 1)],
  term ((149456 : Rat) / 75) [(1, 1), (7, 3), (11, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 3) [(1, 1), (7, 3), (14, 1), (16, 1)],
  term ((3280 : Rat) / 3) [(1, 1), (7, 3), (15, 2), (16, 1)],
  term ((-20 : Rat) / 3) [(1, 1), (7, 3), (16, 1)],
  term ((12976 : Rat) / 75) [(1, 1), (7, 4), (15, 1), (16, 1)],
  term ((42672 : Rat) / 25) [(1, 2), (2, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((40032 : Rat) / 25) [(1, 2), (2, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((207728 : Rat) / 75) [(1, 2), (2, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 3) [(1, 2), (2, 1), (6, 1), (14, 1), (16, 1)],
  term ((-208 : Rat) / 25) [(1, 2), (2, 1), (6, 1), (15, 2), (16, 1)],
  term ((-32 : Rat) / 3) [(1, 2), (2, 1), (6, 1), (16, 1)],
  term ((40032 : Rat) / 25) [(1, 2), (3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((207728 : Rat) / 75) [(1, 2), (3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 3) [(1, 2), (3, 1), (7, 1), (14, 1), (16, 1)],
  term ((-208 : Rat) / 25) [(1, 2), (3, 1), (7, 1), (15, 2), (16, 1)],
  term ((-32 : Rat) / 3) [(1, 2), (3, 1), (7, 1), (16, 1)],
  term ((42672 : Rat) / 25) [(1, 2), (3, 1), (7, 2), (15, 1), (16, 1)],
  term ((-21336 : Rat) / 25) [(1, 2), (6, 2), (7, 1), (15, 1), (16, 1)],
  term ((-20016 : Rat) / 25) [(1, 2), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((-103864 : Rat) / 75) [(1, 2), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 3) [(1, 2), (6, 2), (14, 1), (16, 1)],
  term ((104 : Rat) / 25) [(1, 2), (6, 2), (15, 2), (16, 1)],
  term ((16 : Rat) / 3) [(1, 2), (6, 2), (16, 1)],
  term ((-20016 : Rat) / 25) [(1, 2), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-103864 : Rat) / 75) [(1, 2), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 3) [(1, 2), (7, 2), (14, 1), (16, 1)],
  term ((104 : Rat) / 25) [(1, 2), (7, 2), (15, 2), (16, 1)],
  term ((16 : Rat) / 3) [(1, 2), (7, 2), (16, 1)],
  term ((-21336 : Rat) / 25) [(1, 2), (7, 3), (15, 1), (16, 1)],
  term ((-11504 : Rat) / 15) [(1, 3), (2, 1), (6, 1), (15, 1), (16, 1)],
  term ((-11504 : Rat) / 15) [(1, 3), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((5752 : Rat) / 15) [(1, 3), (6, 2), (15, 1), (16, 1)],
  term ((5752 : Rat) / 15) [(1, 3), (7, 2), (15, 1), (16, 1)],
  term ((5376 : Rat) / 25) [(2, 1), (3, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((7168 : Rat) / 25) [(2, 1), (3, 1), (6, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((7168 : Rat) / 25) [(2, 1), (3, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(2, 1), (3, 1), (6, 1), (7, 1), (16, 1)],
  term ((-4736 : Rat) / 5) [(2, 1), (3, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((11232 : Rat) / 25) [(2, 1), (3, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term (560 : Rat) [(2, 1), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-6928 : Rat) / 25) [(2, 1), (3, 1), (6, 2), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(2, 1), (4, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-7168 : Rat) / 25) [(2, 1), (4, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-5376 : Rat) / 25) [(2, 1), (4, 1), (6, 1), (15, 2), (16, 1)],
  term ((-1792 : Rat) / 25) [(2, 1), (5, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-7168 : Rat) / 25) [(2, 1), (5, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((3584 : Rat) / 25) [(2, 1), (5, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((-7168 : Rat) / 25) [(2, 1), (5, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((896 : Rat) / 25) [(2, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((48896 : Rat) / 25) [(2, 1), (6, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((255904 : Rat) / 75) [(2, 1), (6, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-20264 : Rat) / 75) [(2, 1), (6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((10592 : Rat) / 75) [(2, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((35984 : Rat) / 75) [(2, 1), (6, 1), (7, 1), (15, 3), (16, 1)],
  term ((25952 : Rat) / 75) [(2, 1), (6, 1), (7, 2), (15, 2), (16, 1)],
  term ((-10464 : Rat) / 25) [(2, 1), (6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((31552 : Rat) / 25) [(2, 1), (6, 1), (8, 1), (15, 2), (16, 1)],
  term ((11664 : Rat) / 25) [(2, 1), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1344 : Rat) / 5) [(2, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-32864 : Rat) / 25) [(2, 1), (6, 1), (9, 1), (15, 3), (16, 1)],
  term ((-3584 : Rat) / 25) [(2, 1), (6, 1), (10, 1), (15, 2), (16, 1)],
  term (2 : Rat) [(2, 1), (6, 1), (10, 1), (16, 1)],
  term (4 : Rat) [(2, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((6016 : Rat) / 5) [(2, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-186224 : Rat) / 75) [(2, 1), (6, 1), (11, 1), (15, 3), (16, 1)],
  term (-4 : Rat) [(2, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-278072 : Rat) / 75) [(2, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term (-2 : Rat) [(2, 1), (6, 1), (14, 1), (16, 1)],
  term (8 : Rat) [(2, 1), (6, 1), (14, 2), (16, 1)],
  term ((-62344 : Rat) / 75) [(2, 1), (6, 1), (15, 2), (16, 1)],
  term ((208 : Rat) / 25) [(2, 1), (6, 1), (15, 4), (16, 1)],
  term ((3584 : Rat) / 25) [(2, 1), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(2, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((45608 : Rat) / 25) [(2, 1), (6, 2), (15, 2), (16, 1)],
  term (-4 : Rat) [(2, 1), (6, 2), (16, 1)],
  term ((-2688 : Rat) / 25) [(3, 1), (4, 1), (6, 2), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(3, 1), (4, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-7168 : Rat) / 25) [(3, 1), (4, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-5376 : Rat) / 25) [(3, 1), (4, 1), (7, 1), (15, 2), (16, 1)],
  term ((-2688 : Rat) / 25) [(3, 1), (4, 1), (7, 2), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(3, 1), (5, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-7168 : Rat) / 25) [(3, 1), (5, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((3584 : Rat) / 25) [(3, 1), (5, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-7168 : Rat) / 25) [(3, 1), (5, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((896 : Rat) / 25) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(3, 1), (6, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(3, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((45608 : Rat) / 25) [(3, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term (-4 : Rat) [(3, 1), (6, 1), (7, 1), (16, 1)],
  term ((3464 : Rat) / 25) [(3, 1), (6, 1), (7, 2), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(3, 1), (6, 2), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(3, 1), (6, 2), (7, 1), (11, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(3, 1), (6, 2), (7, 1), (16, 1)],
  term ((2368 : Rat) / 5) [(3, 1), (6, 2), (8, 1), (15, 1), (16, 1)],
  term ((-5616 : Rat) / 25) [(3, 1), (6, 2), (14, 1), (15, 1), (16, 1)],
  term (-280 : Rat) [(3, 1), (6, 2), (15, 1), (16, 1)],
  term ((3464 : Rat) / 25) [(3, 1), (6, 3), (15, 1), (16, 1)],
  term ((-10464 : Rat) / 25) [(3, 1), (7, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((31552 : Rat) / 25) [(3, 1), (7, 1), (8, 1), (15, 2), (16, 1)],
  term ((11664 : Rat) / 25) [(3, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1344 : Rat) / 5) [(3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-32864 : Rat) / 25) [(3, 1), (7, 1), (9, 1), (15, 3), (16, 1)],
  term ((-3584 : Rat) / 25) [(3, 1), (7, 1), (10, 1), (15, 2), (16, 1)],
  term (2 : Rat) [(3, 1), (7, 1), (10, 1), (16, 1)],
  term (4 : Rat) [(3, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((6016 : Rat) / 5) [(3, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-186224 : Rat) / 75) [(3, 1), (7, 1), (11, 1), (15, 3), (16, 1)],
  term (-4 : Rat) [(3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-278072 : Rat) / 75) [(3, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term (-2 : Rat) [(3, 1), (7, 1), (14, 1), (16, 1)],
  term (8 : Rat) [(3, 1), (7, 1), (14, 2), (16, 1)],
  term ((-62344 : Rat) / 75) [(3, 1), (7, 1), (15, 2), (16, 1)],
  term ((208 : Rat) / 25) [(3, 1), (7, 1), (15, 4), (16, 1)],
  term ((2368 : Rat) / 5) [(3, 1), (7, 2), (8, 1), (15, 1), (16, 1)],
  term ((48896 : Rat) / 25) [(3, 1), (7, 2), (9, 1), (15, 2), (16, 1)],
  term ((255904 : Rat) / 75) [(3, 1), (7, 2), (11, 1), (15, 2), (16, 1)],
  term ((-37112 : Rat) / 75) [(3, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((-10408 : Rat) / 75) [(3, 1), (7, 2), (15, 1), (16, 1)],
  term ((35984 : Rat) / 75) [(3, 1), (7, 2), (15, 3), (16, 1)],
  term ((-3584 : Rat) / 25) [(3, 1), (7, 3), (9, 1), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(3, 1), (7, 3), (11, 1), (15, 1), (16, 1)],
  term ((25952 : Rat) / 75) [(3, 1), (7, 3), (15, 2), (16, 1)],
  term (4 : Rat) [(3, 1), (7, 3), (16, 1)],
  term ((5376 : Rat) / 25) [(3, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-6928 : Rat) / 25) [(3, 2), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-4736 : Rat) / 5) [(3, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((11232 : Rat) / 25) [(3, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term (560 : Rat) [(3, 2), (7, 1), (15, 1), (16, 1)],
  term ((7168 : Rat) / 25) [(3, 2), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((7168 : Rat) / 25) [(3, 2), (7, 2), (11, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(3, 2), (7, 2), (16, 1)],
  term ((896 : Rat) / 25) [(4, 1), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(4, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((2688 : Rat) / 25) [(4, 1), (6, 2), (15, 2), (16, 1)],
  term ((896 : Rat) / 25) [(4, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(4, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((2688 : Rat) / 25) [(4, 1), (7, 2), (15, 2), (16, 1)],
  term ((896 : Rat) / 25) [(5, 1), (6, 2), (8, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(5, 1), (6, 2), (9, 1), (15, 2), (16, 1)],
  term ((-1792 : Rat) / 25) [(5, 1), (6, 2), (10, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(5, 1), (6, 2), (11, 1), (15, 2), (16, 1)],
  term ((-448 : Rat) / 25) [(5, 1), (6, 2), (15, 1), (16, 1)],
  term ((896 : Rat) / 25) [(5, 1), (7, 2), (8, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(5, 1), (7, 2), (9, 1), (15, 2), (16, 1)],
  term ((-1792 : Rat) / 25) [(5, 1), (7, 2), (10, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(5, 1), (7, 2), (11, 1), (15, 2), (16, 1)],
  term ((-448 : Rat) / 25) [(5, 1), (7, 2), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(6, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(6, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-22804 : Rat) / 25) [(6, 1), (7, 2), (15, 2), (16, 1)],
  term (2 : Rat) [(6, 1), (7, 2), (16, 1)],
  term ((-24448 : Rat) / 25) [(6, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-127952 : Rat) / 75) [(6, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((10132 : Rat) / 75) [(6, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5296 : Rat) / 75) [(6, 2), (7, 1), (15, 1), (16, 1)],
  term ((-17992 : Rat) / 75) [(6, 2), (7, 1), (15, 3), (16, 1)],
  term ((-12976 : Rat) / 75) [(6, 2), (7, 2), (15, 2), (16, 1)],
  term ((5232 : Rat) / 25) [(6, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-15776 : Rat) / 25) [(6, 2), (8, 1), (15, 2), (16, 1)],
  term ((-5832 : Rat) / 25) [(6, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((672 : Rat) / 5) [(6, 2), (9, 1), (15, 1), (16, 1)],
  term ((16432 : Rat) / 25) [(6, 2), (9, 1), (15, 3), (16, 1)],
  term ((1792 : Rat) / 25) [(6, 2), (10, 1), (15, 2), (16, 1)],
  term (-1 : Rat) [(6, 2), (10, 1), (16, 1)],
  term (-2 : Rat) [(6, 2), (11, 1), (13, 1), (16, 1)],
  term ((-3008 : Rat) / 5) [(6, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((93112 : Rat) / 75) [(6, 2), (11, 1), (15, 3), (16, 1)],
  term (2 : Rat) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((139036 : Rat) / 75) [(6, 2), (14, 1), (15, 2), (16, 1)],
  term (1 : Rat) [(6, 2), (14, 1), (16, 1)],
  term (-4 : Rat) [(6, 2), (14, 2), (16, 1)],
  term ((31172 : Rat) / 75) [(6, 2), (15, 2), (16, 1)],
  term ((-104 : Rat) / 25) [(6, 2), (15, 4), (16, 1)],
  term ((-1792 : Rat) / 25) [(6, 3), (9, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(6, 3), (11, 1), (15, 1), (16, 1)],
  term ((-22804 : Rat) / 25) [(6, 3), (15, 2), (16, 1)],
  term (2 : Rat) [(6, 3), (16, 1)],
  term ((5232 : Rat) / 25) [(7, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-15776 : Rat) / 25) [(7, 2), (8, 1), (15, 2), (16, 1)],
  term ((-5832 : Rat) / 25) [(7, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((672 : Rat) / 5) [(7, 2), (9, 1), (15, 1), (16, 1)],
  term ((16432 : Rat) / 25) [(7, 2), (9, 1), (15, 3), (16, 1)],
  term ((1792 : Rat) / 25) [(7, 2), (10, 1), (15, 2), (16, 1)],
  term (-1 : Rat) [(7, 2), (10, 1), (16, 1)],
  term (-2 : Rat) [(7, 2), (11, 1), (13, 1), (16, 1)],
  term ((-3008 : Rat) / 5) [(7, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((93112 : Rat) / 75) [(7, 2), (11, 1), (15, 3), (16, 1)],
  term (2 : Rat) [(7, 2), (13, 1), (15, 1), (16, 1)],
  term ((139036 : Rat) / 75) [(7, 2), (14, 1), (15, 2), (16, 1)],
  term (1 : Rat) [(7, 2), (14, 1), (16, 1)],
  term (-4 : Rat) [(7, 2), (14, 2), (16, 1)],
  term ((31172 : Rat) / 75) [(7, 2), (15, 2), (16, 1)],
  term ((-104 : Rat) / 25) [(7, 2), (15, 4), (16, 1)],
  term ((-24448 : Rat) / 25) [(7, 3), (9, 1), (15, 2), (16, 1)],
  term ((-127952 : Rat) / 75) [(7, 3), (11, 1), (15, 2), (16, 1)],
  term ((10132 : Rat) / 75) [(7, 3), (14, 1), (15, 1), (16, 1)],
  term ((-5296 : Rat) / 75) [(7, 3), (15, 1), (16, 1)],
  term ((-17992 : Rat) / 75) [(7, 3), (15, 3), (16, 1)],
  term ((-12976 : Rat) / 75) [(7, 4), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 11, terms 0 through 66. -/
theorem rs_R010_ueqv_R010YY_block_11_0000_0066_valid :
    checkProductSumEq rs_R010_ueqv_R010YY_partials_11_0000_0066
      rs_R010_ueqv_R010YY_block_11_0000_0066 = true := by
  native_decide

end R010UeqvR010YYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
