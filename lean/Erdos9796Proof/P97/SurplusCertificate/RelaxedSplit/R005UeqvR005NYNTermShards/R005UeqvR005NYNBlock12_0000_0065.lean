/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R005:u=v:R005NYN, term block 12:0-65

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R005UeqvR005NYNTermShards

/-- Generator polynomial 12 for relaxed split surplus certificate `R005:u=v:R005NYN`. -/
def rs_R005_ueqv_R005NYN_generator_12_0000_0065 : Poly :=
[
  term (2 : Rat) [(2, 1), (14, 1)],
  term (2 : Rat) [(3, 1), (15, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 12. -/
def rs_R005_ueqv_R005NYN_coefficient_12_0000 : Poly :=
[
  term ((5495126 : Rat) / 158397) []
]

/-- Partial product 0 for generator 12. -/
def rs_R005_ueqv_R005NYN_partial_12_0000 : Poly :=
[
  term ((10990252 : Rat) / 158397) [(2, 1), (14, 1)],
  term ((10990252 : Rat) / 158397) [(3, 1), (15, 1)],
  term ((-5495126 : Rat) / 158397) [(14, 2)],
  term ((-5495126 : Rat) / 158397) [(15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 12. -/
theorem rs_R005_ueqv_R005NYN_partial_12_0000_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_12_0000
        rs_R005_ueqv_R005NYN_generator_12_0000_0065 =
      rs_R005_ueqv_R005NYN_partial_12_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 12. -/
def rs_R005_ueqv_R005NYN_coefficient_12_0001 : Poly :=
[
  term ((500800 : Rat) / 52799) [(0, 1), (3, 1), (15, 1)]
]

/-- Partial product 1 for generator 12. -/
def rs_R005_ueqv_R005NYN_partial_12_0001 : Poly :=
[
  term ((1001600 : Rat) / 52799) [(0, 1), (2, 1), (3, 1), (14, 1), (15, 1)],
  term ((-500800 : Rat) / 52799) [(0, 1), (3, 1), (14, 2), (15, 1)],
  term ((-500800 : Rat) / 52799) [(0, 1), (3, 1), (15, 3)],
  term ((1001600 : Rat) / 52799) [(0, 1), (3, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 12. -/
theorem rs_R005_ueqv_R005NYN_partial_12_0001_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_12_0001
        rs_R005_ueqv_R005NYN_generator_12_0000_0065 =
      rs_R005_ueqv_R005NYN_partial_12_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 12. -/
def rs_R005_ueqv_R005NYN_coefficient_12_0002 : Poly :=
[
  term ((1847568 : Rat) / 385571) [(0, 1), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 2 for generator 12. -/
def rs_R005_ueqv_R005NYN_partial_12_0002 : Poly :=
[
  term ((3695136 : Rat) / 385571) [(0, 1), (2, 1), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1847568 : Rat) / 385571) [(0, 1), (3, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1847568 : Rat) / 385571) [(0, 1), (3, 1), (15, 3), (16, 1)],
  term ((3695136 : Rat) / 385571) [(0, 1), (3, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 12. -/
theorem rs_R005_ueqv_R005NYN_partial_12_0002_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_12_0002
        rs_R005_ueqv_R005NYN_generator_12_0000_0065 =
      rs_R005_ueqv_R005NYN_partial_12_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 12. -/
def rs_R005_ueqv_R005NYN_coefficient_12_0003 : Poly :=
[
  term ((1064960 : Rat) / 158397) [(0, 1), (4, 1), (9, 1), (15, 1)]
]

/-- Partial product 3 for generator 12. -/
def rs_R005_ueqv_R005NYN_partial_12_0003 : Poly :=
[
  term ((2129920 : Rat) / 158397) [(0, 1), (2, 1), (4, 1), (9, 1), (14, 1), (15, 1)],
  term ((2129920 : Rat) / 158397) [(0, 1), (3, 1), (4, 1), (9, 1), (15, 2)],
  term ((-1064960 : Rat) / 158397) [(0, 1), (4, 1), (9, 1), (14, 2), (15, 1)],
  term ((-1064960 : Rat) / 158397) [(0, 1), (4, 1), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 12. -/
theorem rs_R005_ueqv_R005NYN_partial_12_0003_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_12_0003
        rs_R005_ueqv_R005NYN_generator_12_0000_0065 =
      rs_R005_ueqv_R005NYN_partial_12_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 12. -/
def rs_R005_ueqv_R005NYN_coefficient_12_0004 : Poly :=
[
  term ((2156032 : Rat) / 385571) [(0, 1), (4, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 4 for generator 12. -/
def rs_R005_ueqv_R005NYN_partial_12_0004 : Poly :=
[
  term ((4312064 : Rat) / 385571) [(0, 1), (2, 1), (4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((4312064 : Rat) / 385571) [(0, 1), (3, 1), (4, 1), (9, 1), (15, 2), (16, 1)],
  term ((-2156032 : Rat) / 385571) [(0, 1), (4, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2156032 : Rat) / 385571) [(0, 1), (4, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 12. -/
theorem rs_R005_ueqv_R005NYN_partial_12_0004_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_12_0004
        rs_R005_ueqv_R005NYN_generator_12_0000_0065 =
      rs_R005_ueqv_R005NYN_partial_12_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 12. -/
def rs_R005_ueqv_R005NYN_coefficient_12_0005 : Poly :=
[
  term ((2662400 : Rat) / 158397) [(0, 1), (4, 1), (11, 1), (15, 1)]
]

/-- Partial product 5 for generator 12. -/
def rs_R005_ueqv_R005NYN_partial_12_0005 : Poly :=
[
  term ((5324800 : Rat) / 158397) [(0, 1), (2, 1), (4, 1), (11, 1), (14, 1), (15, 1)],
  term ((5324800 : Rat) / 158397) [(0, 1), (3, 1), (4, 1), (11, 1), (15, 2)],
  term ((-2662400 : Rat) / 158397) [(0, 1), (4, 1), (11, 1), (14, 2), (15, 1)],
  term ((-2662400 : Rat) / 158397) [(0, 1), (4, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 12. -/
theorem rs_R005_ueqv_R005NYN_partial_12_0005_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_12_0005
        rs_R005_ueqv_R005NYN_generator_12_0000_0065 =
      rs_R005_ueqv_R005NYN_partial_12_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 12. -/
def rs_R005_ueqv_R005NYN_coefficient_12_0006 : Poly :=
[
  term ((5390080 : Rat) / 385571) [(0, 1), (4, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 6 for generator 12. -/
def rs_R005_ueqv_R005NYN_partial_12_0006 : Poly :=
[
  term ((10780160 : Rat) / 385571) [(0, 1), (2, 1), (4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((10780160 : Rat) / 385571) [(0, 1), (3, 1), (4, 1), (11, 1), (15, 2), (16, 1)],
  term ((-5390080 : Rat) / 385571) [(0, 1), (4, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-5390080 : Rat) / 385571) [(0, 1), (4, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 12. -/
theorem rs_R005_ueqv_R005NYN_partial_12_0006_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_12_0006
        rs_R005_ueqv_R005NYN_generator_12_0000_0065 =
      rs_R005_ueqv_R005NYN_partial_12_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 12. -/
def rs_R005_ueqv_R005NYN_coefficient_12_0007 : Poly :=
[
  term ((-1064960 : Rat) / 158397) [(0, 1), (4, 1), (15, 2)]
]

/-- Partial product 7 for generator 12. -/
def rs_R005_ueqv_R005NYN_partial_12_0007 : Poly :=
[
  term ((-2129920 : Rat) / 158397) [(0, 1), (2, 1), (4, 1), (14, 1), (15, 2)],
  term ((-2129920 : Rat) / 158397) [(0, 1), (3, 1), (4, 1), (15, 3)],
  term ((1064960 : Rat) / 158397) [(0, 1), (4, 1), (14, 2), (15, 2)],
  term ((1064960 : Rat) / 158397) [(0, 1), (4, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 12. -/
theorem rs_R005_ueqv_R005NYN_partial_12_0007_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_12_0007
        rs_R005_ueqv_R005NYN_generator_12_0000_0065 =
      rs_R005_ueqv_R005NYN_partial_12_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 12. -/
def rs_R005_ueqv_R005NYN_coefficient_12_0008 : Poly :=
[
  term ((-2156032 : Rat) / 385571) [(0, 1), (4, 1), (15, 2), (16, 1)]
]

/-- Partial product 8 for generator 12. -/
def rs_R005_ueqv_R005NYN_partial_12_0008 : Poly :=
[
  term ((-4312064 : Rat) / 385571) [(0, 1), (2, 1), (4, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4312064 : Rat) / 385571) [(0, 1), (3, 1), (4, 1), (15, 3), (16, 1)],
  term ((2156032 : Rat) / 385571) [(0, 1), (4, 1), (14, 2), (15, 2), (16, 1)],
  term ((2156032 : Rat) / 385571) [(0, 1), (4, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 12. -/
theorem rs_R005_ueqv_R005NYN_partial_12_0008_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_12_0008
        rs_R005_ueqv_R005NYN_generator_12_0000_0065 =
      rs_R005_ueqv_R005NYN_partial_12_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 12. -/
def rs_R005_ueqv_R005NYN_coefficient_12_0009 : Poly :=
[
  term ((-931840 : Rat) / 52799) [(0, 1), (5, 1), (15, 1)]
]

/-- Partial product 9 for generator 12. -/
def rs_R005_ueqv_R005NYN_partial_12_0009 : Poly :=
[
  term ((-1863680 : Rat) / 52799) [(0, 1), (2, 1), (5, 1), (14, 1), (15, 1)],
  term ((-1863680 : Rat) / 52799) [(0, 1), (3, 1), (5, 1), (15, 2)],
  term ((931840 : Rat) / 52799) [(0, 1), (5, 1), (14, 2), (15, 1)],
  term ((931840 : Rat) / 52799) [(0, 1), (5, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 12. -/
theorem rs_R005_ueqv_R005NYN_partial_12_0009_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_12_0009
        rs_R005_ueqv_R005NYN_generator_12_0000_0065 =
      rs_R005_ueqv_R005NYN_partial_12_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 12. -/
def rs_R005_ueqv_R005NYN_coefficient_12_0010 : Poly :=
[
  term ((-5659584 : Rat) / 385571) [(0, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 10 for generator 12. -/
def rs_R005_ueqv_R005NYN_partial_12_0010 : Poly :=
[
  term ((-11319168 : Rat) / 385571) [(0, 1), (2, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11319168 : Rat) / 385571) [(0, 1), (3, 1), (5, 1), (15, 2), (16, 1)],
  term ((5659584 : Rat) / 385571) [(0, 1), (5, 1), (14, 2), (15, 1), (16, 1)],
  term ((5659584 : Rat) / 385571) [(0, 1), (5, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 12. -/
theorem rs_R005_ueqv_R005NYN_partial_12_0010_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_12_0010
        rs_R005_ueqv_R005NYN_generator_12_0000_0065 =
      rs_R005_ueqv_R005NYN_partial_12_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 12. -/
def rs_R005_ueqv_R005NYN_coefficient_12_0011 : Poly :=
[
  term ((-1001600 : Rat) / 52799) [(0, 1), (7, 1), (15, 1)]
]

/-- Partial product 11 for generator 12. -/
def rs_R005_ueqv_R005NYN_partial_12_0011 : Poly :=
[
  term ((-2003200 : Rat) / 52799) [(0, 1), (2, 1), (7, 1), (14, 1), (15, 1)],
  term ((-2003200 : Rat) / 52799) [(0, 1), (3, 1), (7, 1), (15, 2)],
  term ((1001600 : Rat) / 52799) [(0, 1), (7, 1), (14, 2), (15, 1)],
  term ((1001600 : Rat) / 52799) [(0, 1), (7, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 12. -/
theorem rs_R005_ueqv_R005NYN_partial_12_0011_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_12_0011
        rs_R005_ueqv_R005NYN_generator_12_0000_0065 =
      rs_R005_ueqv_R005NYN_partial_12_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 12. -/
def rs_R005_ueqv_R005NYN_coefficient_12_0012 : Poly :=
[
  term ((-3695136 : Rat) / 385571) [(0, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 12 for generator 12. -/
def rs_R005_ueqv_R005NYN_partial_12_0012 : Poly :=
[
  term ((-7390272 : Rat) / 385571) [(0, 1), (2, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7390272 : Rat) / 385571) [(0, 1), (3, 1), (7, 1), (15, 2), (16, 1)],
  term ((3695136 : Rat) / 385571) [(0, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((3695136 : Rat) / 385571) [(0, 1), (7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 12. -/
theorem rs_R005_ueqv_R005NYN_partial_12_0012_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_12_0012
        rs_R005_ueqv_R005NYN_generator_12_0000_0065 =
      rs_R005_ueqv_R005NYN_partial_12_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 12. -/
def rs_R005_ueqv_R005NYN_coefficient_12_0013 : Poly :=
[
  term ((1064960 : Rat) / 158397) [(0, 1), (8, 1), (9, 1), (15, 1)]
]

/-- Partial product 13 for generator 12. -/
def rs_R005_ueqv_R005NYN_partial_12_0013 : Poly :=
[
  term ((2129920 : Rat) / 158397) [(0, 1), (2, 1), (8, 1), (9, 1), (14, 1), (15, 1)],
  term ((2129920 : Rat) / 158397) [(0, 1), (3, 1), (8, 1), (9, 1), (15, 2)],
  term ((-1064960 : Rat) / 158397) [(0, 1), (8, 1), (9, 1), (14, 2), (15, 1)],
  term ((-1064960 : Rat) / 158397) [(0, 1), (8, 1), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 12. -/
theorem rs_R005_ueqv_R005NYN_partial_12_0013_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_12_0013
        rs_R005_ueqv_R005NYN_generator_12_0000_0065 =
      rs_R005_ueqv_R005NYN_partial_12_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 12. -/
def rs_R005_ueqv_R005NYN_coefficient_12_0014 : Poly :=
[
  term ((2156032 : Rat) / 385571) [(0, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 14 for generator 12. -/
def rs_R005_ueqv_R005NYN_partial_12_0014 : Poly :=
[
  term ((4312064 : Rat) / 385571) [(0, 1), (2, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((4312064 : Rat) / 385571) [(0, 1), (3, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-2156032 : Rat) / 385571) [(0, 1), (8, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2156032 : Rat) / 385571) [(0, 1), (8, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 12. -/
theorem rs_R005_ueqv_R005NYN_partial_12_0014_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_12_0014
        rs_R005_ueqv_R005NYN_generator_12_0000_0065 =
      rs_R005_ueqv_R005NYN_partial_12_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 12. -/
def rs_R005_ueqv_R005NYN_coefficient_12_0015 : Poly :=
[
  term ((532480 : Rat) / 158397) [(0, 1), (8, 1), (11, 1), (15, 1)]
]

/-- Partial product 15 for generator 12. -/
def rs_R005_ueqv_R005NYN_partial_12_0015 : Poly :=
[
  term ((1064960 : Rat) / 158397) [(0, 1), (2, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((1064960 : Rat) / 158397) [(0, 1), (3, 1), (8, 1), (11, 1), (15, 2)],
  term ((-532480 : Rat) / 158397) [(0, 1), (8, 1), (11, 1), (14, 2), (15, 1)],
  term ((-532480 : Rat) / 158397) [(0, 1), (8, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 12. -/
theorem rs_R005_ueqv_R005NYN_partial_12_0015_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_12_0015
        rs_R005_ueqv_R005NYN_generator_12_0000_0065 =
      rs_R005_ueqv_R005NYN_partial_12_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 12. -/
def rs_R005_ueqv_R005NYN_coefficient_12_0016 : Poly :=
[
  term ((1078016 : Rat) / 385571) [(0, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 16 for generator 12. -/
def rs_R005_ueqv_R005NYN_partial_12_0016 : Poly :=
[
  term ((2156032 : Rat) / 385571) [(0, 1), (2, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((2156032 : Rat) / 385571) [(0, 1), (3, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1078016 : Rat) / 385571) [(0, 1), (8, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1078016 : Rat) / 385571) [(0, 1), (8, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 12. -/
theorem rs_R005_ueqv_R005NYN_partial_12_0016_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_12_0016
        rs_R005_ueqv_R005NYN_generator_12_0000_0065 =
      rs_R005_ueqv_R005NYN_partial_12_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 12. -/
def rs_R005_ueqv_R005NYN_coefficient_12_0017 : Poly :=
[
  term ((-3281792 : Rat) / 52799) [(0, 1), (9, 1), (15, 1)]
]

/-- Partial product 17 for generator 12. -/
def rs_R005_ueqv_R005NYN_partial_12_0017 : Poly :=
[
  term ((-6563584 : Rat) / 52799) [(0, 1), (2, 1), (9, 1), (14, 1), (15, 1)],
  term ((-6563584 : Rat) / 52799) [(0, 1), (3, 1), (9, 1), (15, 2)],
  term ((3281792 : Rat) / 52799) [(0, 1), (9, 1), (14, 2), (15, 1)],
  term ((3281792 : Rat) / 52799) [(0, 1), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 12. -/
theorem rs_R005_ueqv_R005NYN_partial_12_0017_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_12_0017
        rs_R005_ueqv_R005NYN_generator_12_0000_0065 =
      rs_R005_ueqv_R005NYN_partial_12_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 12. -/
def rs_R005_ueqv_R005NYN_coefficient_12_0018 : Poly :=
[
  term ((8637792 : Rat) / 385571) [(0, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 18 for generator 12. -/
def rs_R005_ueqv_R005NYN_partial_12_0018 : Poly :=
[
  term ((17275584 : Rat) / 385571) [(0, 1), (2, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((17275584 : Rat) / 385571) [(0, 1), (3, 1), (9, 1), (15, 2), (16, 1)],
  term ((-8637792 : Rat) / 385571) [(0, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-8637792 : Rat) / 385571) [(0, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 12. -/
theorem rs_R005_ueqv_R005NYN_partial_12_0018_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_12_0018
        rs_R005_ueqv_R005NYN_generator_12_0000_0065 =
      rs_R005_ueqv_R005NYN_partial_12_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 12. -/
def rs_R005_ueqv_R005NYN_coefficient_12_0019 : Poly :=
[
  term ((-2944 : Rat) / 4281) [(0, 1), (11, 1), (15, 1)]
]

/-- Partial product 19 for generator 12. -/
def rs_R005_ueqv_R005NYN_partial_12_0019 : Poly :=
[
  term ((-5888 : Rat) / 4281) [(0, 1), (2, 1), (11, 1), (14, 1), (15, 1)],
  term ((-5888 : Rat) / 4281) [(0, 1), (3, 1), (11, 1), (15, 2)],
  term ((2944 : Rat) / 4281) [(0, 1), (11, 1), (14, 2), (15, 1)],
  term ((2944 : Rat) / 4281) [(0, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 12. -/
theorem rs_R005_ueqv_R005NYN_partial_12_0019_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_12_0019
        rs_R005_ueqv_R005NYN_generator_12_0000_0065 =
      rs_R005_ueqv_R005NYN_partial_12_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 12. -/
def rs_R005_ueqv_R005NYN_coefficient_12_0020 : Poly :=
[
  term ((-16274672 : Rat) / 385571) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 20 for generator 12. -/
def rs_R005_ueqv_R005NYN_partial_12_0020 : Poly :=
[
  term ((-32549344 : Rat) / 385571) [(0, 1), (2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-32549344 : Rat) / 385571) [(0, 1), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((16274672 : Rat) / 385571) [(0, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((16274672 : Rat) / 385571) [(0, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 12. -/
theorem rs_R005_ueqv_R005NYN_partial_12_0020_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_12_0020
        rs_R005_ueqv_R005NYN_generator_12_0000_0065 =
      rs_R005_ueqv_R005NYN_partial_12_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 12. -/
def rs_R005_ueqv_R005NYN_coefficient_12_0021 : Poly :=
[
  term ((-1863680 : Rat) / 158397) [(0, 1), (15, 2)]
]

/-- Partial product 21 for generator 12. -/
def rs_R005_ueqv_R005NYN_partial_12_0021 : Poly :=
[
  term ((-3727360 : Rat) / 158397) [(0, 1), (2, 1), (14, 1), (15, 2)],
  term ((-3727360 : Rat) / 158397) [(0, 1), (3, 1), (15, 3)],
  term ((1863680 : Rat) / 158397) [(0, 1), (14, 2), (15, 2)],
  term ((1863680 : Rat) / 158397) [(0, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 12. -/
theorem rs_R005_ueqv_R005NYN_partial_12_0021_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_12_0021
        rs_R005_ueqv_R005NYN_generator_12_0000_0065 =
      rs_R005_ueqv_R005NYN_partial_12_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 12. -/
def rs_R005_ueqv_R005NYN_coefficient_12_0022 : Poly :=
[
  term ((-3773056 : Rat) / 385571) [(0, 1), (15, 2), (16, 1)]
]

/-- Partial product 22 for generator 12. -/
def rs_R005_ueqv_R005NYN_partial_12_0022 : Poly :=
[
  term ((-7546112 : Rat) / 385571) [(0, 1), (2, 1), (14, 1), (15, 2), (16, 1)],
  term ((-7546112 : Rat) / 385571) [(0, 1), (3, 1), (15, 3), (16, 1)],
  term ((3773056 : Rat) / 385571) [(0, 1), (14, 2), (15, 2), (16, 1)],
  term ((3773056 : Rat) / 385571) [(0, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 12. -/
theorem rs_R005_ueqv_R005NYN_partial_12_0022_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_12_0022
        rs_R005_ueqv_R005NYN_generator_12_0000_0065 =
      rs_R005_ueqv_R005NYN_partial_12_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 12. -/
def rs_R005_ueqv_R005NYN_coefficient_12_0023 : Poly :=
[
  term ((-7400800 : Rat) / 158397) [(1, 1), (14, 1), (15, 1)]
]

/-- Partial product 23 for generator 12. -/
def rs_R005_ueqv_R005NYN_partial_12_0023 : Poly :=
[
  term ((-14801600 : Rat) / 158397) [(1, 1), (2, 1), (14, 2), (15, 1)],
  term ((-14801600 : Rat) / 158397) [(1, 1), (3, 1), (14, 1), (15, 2)],
  term ((7400800 : Rat) / 158397) [(1, 1), (14, 1), (15, 3)],
  term ((7400800 : Rat) / 158397) [(1, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 12. -/
theorem rs_R005_ueqv_R005NYN_partial_12_0023_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_12_0023
        rs_R005_ueqv_R005NYN_generator_12_0000_0065 =
      rs_R005_ueqv_R005NYN_partial_12_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 12. -/
def rs_R005_ueqv_R005NYN_coefficient_12_0024 : Poly :=
[
  term ((25627492 : Rat) / 385571) [(1, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 24 for generator 12. -/
def rs_R005_ueqv_R005NYN_partial_12_0024 : Poly :=
[
  term ((51254984 : Rat) / 385571) [(1, 1), (2, 1), (14, 2), (15, 1), (16, 1)],
  term ((51254984 : Rat) / 385571) [(1, 1), (3, 1), (14, 1), (15, 2), (16, 1)],
  term ((-25627492 : Rat) / 385571) [(1, 1), (14, 1), (15, 3), (16, 1)],
  term ((-25627492 : Rat) / 385571) [(1, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 12. -/
theorem rs_R005_ueqv_R005NYN_partial_12_0024_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_12_0024
        rs_R005_ueqv_R005NYN_generator_12_0000_0065 =
      rs_R005_ueqv_R005NYN_partial_12_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 12. -/
def rs_R005_ueqv_R005NYN_coefficient_12_0025 : Poly :=
[
  term ((3935504 : Rat) / 158397) [(1, 1), (15, 1)]
]

/-- Partial product 25 for generator 12. -/
def rs_R005_ueqv_R005NYN_partial_12_0025 : Poly :=
[
  term ((7871008 : Rat) / 158397) [(1, 1), (2, 1), (14, 1), (15, 1)],
  term ((7871008 : Rat) / 158397) [(1, 1), (3, 1), (15, 2)],
  term ((-3935504 : Rat) / 158397) [(1, 1), (14, 2), (15, 1)],
  term ((-3935504 : Rat) / 158397) [(1, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 12. -/
theorem rs_R005_ueqv_R005NYN_partial_12_0025_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_12_0025
        rs_R005_ueqv_R005NYN_generator_12_0000_0065 =
      rs_R005_ueqv_R005NYN_partial_12_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 12. -/
def rs_R005_ueqv_R005NYN_coefficient_12_0026 : Poly :=
[
  term ((-3713666 : Rat) / 385571) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 26 for generator 12. -/
def rs_R005_ueqv_R005NYN_partial_12_0026 : Poly :=
[
  term ((-7427332 : Rat) / 385571) [(1, 1), (2, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7427332 : Rat) / 385571) [(1, 1), (3, 1), (15, 2), (16, 1)],
  term ((3713666 : Rat) / 385571) [(1, 1), (14, 2), (15, 1), (16, 1)],
  term ((3713666 : Rat) / 385571) [(1, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 12. -/
theorem rs_R005_ueqv_R005NYN_partial_12_0026_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_12_0026
        rs_R005_ueqv_R005NYN_generator_12_0000_0065 =
      rs_R005_ueqv_R005NYN_partial_12_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 12. -/
def rs_R005_ueqv_R005NYN_coefficient_12_0027 : Poly :=
[
  term ((-500800 : Rat) / 52799) [(3, 1), (4, 1), (15, 1)]
]

/-- Partial product 27 for generator 12. -/
def rs_R005_ueqv_R005NYN_partial_12_0027 : Poly :=
[
  term ((-1001600 : Rat) / 52799) [(2, 1), (3, 1), (4, 1), (14, 1), (15, 1)],
  term ((500800 : Rat) / 52799) [(3, 1), (4, 1), (14, 2), (15, 1)],
  term ((500800 : Rat) / 52799) [(3, 1), (4, 1), (15, 3)],
  term ((-1001600 : Rat) / 52799) [(3, 2), (4, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 12. -/
theorem rs_R005_ueqv_R005NYN_partial_12_0027_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_12_0027
        rs_R005_ueqv_R005NYN_generator_12_0000_0065 =
      rs_R005_ueqv_R005NYN_partial_12_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 12. -/
def rs_R005_ueqv_R005NYN_coefficient_12_0028 : Poly :=
[
  term ((-1847568 : Rat) / 385571) [(3, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 28 for generator 12. -/
def rs_R005_ueqv_R005NYN_partial_12_0028 : Poly :=
[
  term ((-3695136 : Rat) / 385571) [(2, 1), (3, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((1847568 : Rat) / 385571) [(3, 1), (4, 1), (14, 2), (15, 1), (16, 1)],
  term ((1847568 : Rat) / 385571) [(3, 1), (4, 1), (15, 3), (16, 1)],
  term ((-3695136 : Rat) / 385571) [(3, 2), (4, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 12. -/
theorem rs_R005_ueqv_R005NYN_partial_12_0028_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_12_0028
        rs_R005_ueqv_R005NYN_generator_12_0000_0065 =
      rs_R005_ueqv_R005NYN_partial_12_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 12. -/
def rs_R005_ueqv_R005NYN_coefficient_12_0029 : Poly :=
[
  term ((-250400 : Rat) / 52799) [(3, 1), (15, 1)]
]

/-- Partial product 29 for generator 12. -/
def rs_R005_ueqv_R005NYN_partial_12_0029 : Poly :=
[
  term ((-500800 : Rat) / 52799) [(2, 1), (3, 1), (14, 1), (15, 1)],
  term ((250400 : Rat) / 52799) [(3, 1), (14, 2), (15, 1)],
  term ((250400 : Rat) / 52799) [(3, 1), (15, 3)],
  term ((-500800 : Rat) / 52799) [(3, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 12. -/
theorem rs_R005_ueqv_R005NYN_partial_12_0029_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_12_0029
        rs_R005_ueqv_R005NYN_generator_12_0000_0065 =
      rs_R005_ueqv_R005NYN_partial_12_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 12. -/
def rs_R005_ueqv_R005NYN_coefficient_12_0030 : Poly :=
[
  term ((-923784 : Rat) / 385571) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 30 for generator 12. -/
def rs_R005_ueqv_R005NYN_partial_12_0030 : Poly :=
[
  term ((-1847568 : Rat) / 385571) [(2, 1), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((923784 : Rat) / 385571) [(3, 1), (14, 2), (15, 1), (16, 1)],
  term ((923784 : Rat) / 385571) [(3, 1), (15, 3), (16, 1)],
  term ((-1847568 : Rat) / 385571) [(3, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 12. -/
theorem rs_R005_ueqv_R005NYN_partial_12_0030_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_12_0030
        rs_R005_ueqv_R005NYN_generator_12_0000_0065 =
      rs_R005_ueqv_R005NYN_partial_12_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 12. -/
def rs_R005_ueqv_R005NYN_coefficient_12_0031 : Poly :=
[
  term ((1001600 : Rat) / 52799) [(4, 1), (7, 1), (15, 1)]
]

/-- Partial product 31 for generator 12. -/
def rs_R005_ueqv_R005NYN_partial_12_0031 : Poly :=
[
  term ((2003200 : Rat) / 52799) [(2, 1), (4, 1), (7, 1), (14, 1), (15, 1)],
  term ((2003200 : Rat) / 52799) [(3, 1), (4, 1), (7, 1), (15, 2)],
  term ((-1001600 : Rat) / 52799) [(4, 1), (7, 1), (14, 2), (15, 1)],
  term ((-1001600 : Rat) / 52799) [(4, 1), (7, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 12. -/
theorem rs_R005_ueqv_R005NYN_partial_12_0031_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_12_0031
        rs_R005_ueqv_R005NYN_generator_12_0000_0065 =
      rs_R005_ueqv_R005NYN_partial_12_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 12. -/
def rs_R005_ueqv_R005NYN_coefficient_12_0032 : Poly :=
[
  term ((3695136 : Rat) / 385571) [(4, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 32 for generator 12. -/
def rs_R005_ueqv_R005NYN_partial_12_0032 : Poly :=
[
  term ((7390272 : Rat) / 385571) [(2, 1), (4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((7390272 : Rat) / 385571) [(3, 1), (4, 1), (7, 1), (15, 2), (16, 1)],
  term ((-3695136 : Rat) / 385571) [(4, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3695136 : Rat) / 385571) [(4, 1), (7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 12. -/
theorem rs_R005_ueqv_R005NYN_partial_12_0032_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_12_0032
        rs_R005_ueqv_R005NYN_generator_12_0000_0065 =
      rs_R005_ueqv_R005NYN_partial_12_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 12. -/
def rs_R005_ueqv_R005NYN_coefficient_12_0033 : Poly :=
[
  term ((11780224 : Rat) / 158397) [(4, 1), (9, 1), (15, 1)]
]

/-- Partial product 33 for generator 12. -/
def rs_R005_ueqv_R005NYN_partial_12_0033 : Poly :=
[
  term ((23560448 : Rat) / 158397) [(2, 1), (4, 1), (9, 1), (14, 1), (15, 1)],
  term ((23560448 : Rat) / 158397) [(3, 1), (4, 1), (9, 1), (15, 2)],
  term ((-11780224 : Rat) / 158397) [(4, 1), (9, 1), (14, 2), (15, 1)],
  term ((-11780224 : Rat) / 158397) [(4, 1), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 12. -/
theorem rs_R005_ueqv_R005NYN_partial_12_0033_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_12_0033
        rs_R005_ueqv_R005NYN_generator_12_0000_0065 =
      rs_R005_ueqv_R005NYN_partial_12_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 12. -/
def rs_R005_ueqv_R005NYN_coefficient_12_0034 : Poly :=
[
  term ((-18640096 : Rat) / 385571) [(4, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 34 for generator 12. -/
def rs_R005_ueqv_R005NYN_partial_12_0034 : Poly :=
[
  term ((-37280192 : Rat) / 385571) [(2, 1), (4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-37280192 : Rat) / 385571) [(3, 1), (4, 1), (9, 1), (15, 2), (16, 1)],
  term ((18640096 : Rat) / 385571) [(4, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((18640096 : Rat) / 385571) [(4, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 12. -/
theorem rs_R005_ueqv_R005NYN_partial_12_0034_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_12_0034
        rs_R005_ueqv_R005NYN_generator_12_0000_0065 =
      rs_R005_ueqv_R005NYN_partial_12_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 12. -/
def rs_R005_ueqv_R005NYN_coefficient_12_0035 : Poly :=
[
  term ((-5708288 : Rat) / 158397) [(4, 1), (11, 1), (15, 1)]
]

/-- Partial product 35 for generator 12. -/
def rs_R005_ueqv_R005NYN_partial_12_0035 : Poly :=
[
  term ((-11416576 : Rat) / 158397) [(2, 1), (4, 1), (11, 1), (14, 1), (15, 1)],
  term ((-11416576 : Rat) / 158397) [(3, 1), (4, 1), (11, 1), (15, 2)],
  term ((5708288 : Rat) / 158397) [(4, 1), (11, 1), (14, 2), (15, 1)],
  term ((5708288 : Rat) / 158397) [(4, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 12. -/
theorem rs_R005_ueqv_R005NYN_partial_12_0035_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_12_0035
        rs_R005_ueqv_R005NYN_generator_12_0000_0065 =
      rs_R005_ueqv_R005NYN_partial_12_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 12. -/
def rs_R005_ueqv_R005NYN_coefficient_12_0036 : Poly :=
[
  term ((32580176 : Rat) / 385571) [(4, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 36 for generator 12. -/
def rs_R005_ueqv_R005NYN_partial_12_0036 : Poly :=
[
  term ((65160352 : Rat) / 385571) [(2, 1), (4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((65160352 : Rat) / 385571) [(3, 1), (4, 1), (11, 1), (15, 2), (16, 1)],
  term ((-32580176 : Rat) / 385571) [(4, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-32580176 : Rat) / 385571) [(4, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 12. -/
theorem rs_R005_ueqv_R005NYN_partial_12_0036_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_12_0036
        rs_R005_ueqv_R005NYN_generator_12_0000_0065 =
      rs_R005_ueqv_R005NYN_partial_12_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 12. -/
def rs_R005_ueqv_R005NYN_coefficient_12_0037 : Poly :=
[
  term ((6525760 : Rat) / 158397) [(4, 1), (15, 2)]
]

/-- Partial product 37 for generator 12. -/
def rs_R005_ueqv_R005NYN_partial_12_0037 : Poly :=
[
  term ((13051520 : Rat) / 158397) [(2, 1), (4, 1), (14, 1), (15, 2)],
  term ((13051520 : Rat) / 158397) [(3, 1), (4, 1), (15, 3)],
  term ((-6525760 : Rat) / 158397) [(4, 1), (14, 2), (15, 2)],
  term ((-6525760 : Rat) / 158397) [(4, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 12. -/
theorem rs_R005_ueqv_R005NYN_partial_12_0037_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_12_0037
        rs_R005_ueqv_R005NYN_generator_12_0000_0065 =
      rs_R005_ueqv_R005NYN_partial_12_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 12. -/
def rs_R005_ueqv_R005NYN_coefficient_12_0038 : Poly :=
[
  term ((-11327824 : Rat) / 385571) [(4, 1), (15, 2), (16, 1)]
]

/-- Partial product 38 for generator 12. -/
def rs_R005_ueqv_R005NYN_partial_12_0038 : Poly :=
[
  term ((-22655648 : Rat) / 385571) [(2, 1), (4, 1), (14, 1), (15, 2), (16, 1)],
  term ((-22655648 : Rat) / 385571) [(3, 1), (4, 1), (15, 3), (16, 1)],
  term ((11327824 : Rat) / 385571) [(4, 1), (14, 2), (15, 2), (16, 1)],
  term ((11327824 : Rat) / 385571) [(4, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 12. -/
theorem rs_R005_ueqv_R005NYN_partial_12_0038_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_12_0038
        rs_R005_ueqv_R005NYN_generator_12_0000_0065 =
      rs_R005_ueqv_R005NYN_partial_12_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 12. -/
def rs_R005_ueqv_R005NYN_coefficient_12_0039 : Poly :=
[
  term ((-3112960 : Rat) / 52799) [(5, 1), (8, 1), (15, 1)]
]

/-- Partial product 39 for generator 12. -/
def rs_R005_ueqv_R005NYN_partial_12_0039 : Poly :=
[
  term ((-6225920 : Rat) / 52799) [(2, 1), (5, 1), (8, 1), (14, 1), (15, 1)],
  term ((-6225920 : Rat) / 52799) [(3, 1), (5, 1), (8, 1), (15, 2)],
  term ((3112960 : Rat) / 52799) [(5, 1), (8, 1), (14, 2), (15, 1)],
  term ((3112960 : Rat) / 52799) [(5, 1), (8, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 12. -/
theorem rs_R005_ueqv_R005NYN_partial_12_0039_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_12_0039
        rs_R005_ueqv_R005NYN_generator_12_0000_0065 =
      rs_R005_ueqv_R005NYN_partial_12_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 12. -/
def rs_R005_ueqv_R005NYN_coefficient_12_0040 : Poly :=
[
  term ((9166080 : Rat) / 385571) [(5, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 40 for generator 12. -/
def rs_R005_ueqv_R005NYN_partial_12_0040 : Poly :=
[
  term ((18332160 : Rat) / 385571) [(2, 1), (5, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((18332160 : Rat) / 385571) [(3, 1), (5, 1), (8, 1), (15, 2), (16, 1)],
  term ((-9166080 : Rat) / 385571) [(5, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((-9166080 : Rat) / 385571) [(5, 1), (8, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 12. -/
theorem rs_R005_ueqv_R005NYN_partial_12_0040_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_12_0040
        rs_R005_ueqv_R005NYN_generator_12_0000_0065 =
      rs_R005_ueqv_R005NYN_partial_12_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 12. -/
def rs_R005_ueqv_R005NYN_coefficient_12_0041 : Poly :=
[
  term ((-678880 : Rat) / 52799) [(5, 1), (14, 1), (15, 1)]
]

/-- Partial product 41 for generator 12. -/
def rs_R005_ueqv_R005NYN_partial_12_0041 : Poly :=
[
  term ((-1357760 : Rat) / 52799) [(2, 1), (5, 1), (14, 2), (15, 1)],
  term ((-1357760 : Rat) / 52799) [(3, 1), (5, 1), (14, 1), (15, 2)],
  term ((678880 : Rat) / 52799) [(5, 1), (14, 1), (15, 3)],
  term ((678880 : Rat) / 52799) [(5, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 12. -/
theorem rs_R005_ueqv_R005NYN_partial_12_0041_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_12_0041
        rs_R005_ueqv_R005NYN_generator_12_0000_0065 =
      rs_R005_ueqv_R005NYN_partial_12_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 12. -/
def rs_R005_ueqv_R005NYN_coefficient_12_0042 : Poly :=
[
  term ((18332604 : Rat) / 385571) [(5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 42 for generator 12. -/
def rs_R005_ueqv_R005NYN_partial_12_0042 : Poly :=
[
  term ((36665208 : Rat) / 385571) [(2, 1), (5, 1), (14, 2), (15, 1), (16, 1)],
  term ((36665208 : Rat) / 385571) [(3, 1), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((-18332604 : Rat) / 385571) [(5, 1), (14, 1), (15, 3), (16, 1)],
  term ((-18332604 : Rat) / 385571) [(5, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 12. -/
theorem rs_R005_ueqv_R005NYN_partial_12_0042_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_12_0042
        rs_R005_ueqv_R005NYN_generator_12_0000_0065 =
      rs_R005_ueqv_R005NYN_partial_12_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 12. -/
def rs_R005_ueqv_R005NYN_coefficient_12_0043 : Poly :=
[
  term ((3725680 : Rat) / 158397) [(5, 1), (15, 1)]
]

/-- Partial product 43 for generator 12. -/
def rs_R005_ueqv_R005NYN_partial_12_0043 : Poly :=
[
  term ((7451360 : Rat) / 158397) [(2, 1), (5, 1), (14, 1), (15, 1)],
  term ((7451360 : Rat) / 158397) [(3, 1), (5, 1), (15, 2)],
  term ((-3725680 : Rat) / 158397) [(5, 1), (14, 2), (15, 1)],
  term ((-3725680 : Rat) / 158397) [(5, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 12. -/
theorem rs_R005_ueqv_R005NYN_partial_12_0043_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_12_0043
        rs_R005_ueqv_R005NYN_generator_12_0000_0065 =
      rs_R005_ueqv_R005NYN_partial_12_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 12. -/
def rs_R005_ueqv_R005NYN_coefficient_12_0044 : Poly :=
[
  term ((-12801038 : Rat) / 385571) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 44 for generator 12. -/
def rs_R005_ueqv_R005NYN_partial_12_0044 : Poly :=
[
  term ((-25602076 : Rat) / 385571) [(2, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-25602076 : Rat) / 385571) [(3, 1), (5, 1), (15, 2), (16, 1)],
  term ((12801038 : Rat) / 385571) [(5, 1), (14, 2), (15, 1), (16, 1)],
  term ((12801038 : Rat) / 385571) [(5, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 12. -/
theorem rs_R005_ueqv_R005NYN_partial_12_0044_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_12_0044
        rs_R005_ueqv_R005NYN_generator_12_0000_0065 =
      rs_R005_ueqv_R005NYN_partial_12_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 12. -/
def rs_R005_ueqv_R005NYN_coefficient_12_0045 : Poly :=
[
  term ((2867200 : Rat) / 158397) [(8, 1), (9, 1), (15, 1)]
]

/-- Partial product 45 for generator 12. -/
def rs_R005_ueqv_R005NYN_partial_12_0045 : Poly :=
[
  term ((5734400 : Rat) / 158397) [(2, 1), (8, 1), (9, 1), (14, 1), (15, 1)],
  term ((5734400 : Rat) / 158397) [(3, 1), (8, 1), (9, 1), (15, 2)],
  term ((-2867200 : Rat) / 158397) [(8, 1), (9, 1), (14, 2), (15, 1)],
  term ((-2867200 : Rat) / 158397) [(8, 1), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 12. -/
theorem rs_R005_ueqv_R005NYN_partial_12_0045_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_12_0045
        rs_R005_ueqv_R005NYN_generator_12_0000_0065 =
      rs_R005_ueqv_R005NYN_partial_12_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 12. -/
def rs_R005_ueqv_R005NYN_coefficient_12_0046 : Poly :=
[
  term ((-1213504 : Rat) / 385571) [(8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 46 for generator 12. -/
def rs_R005_ueqv_R005NYN_partial_12_0046 : Poly :=
[
  term ((-2427008 : Rat) / 385571) [(2, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2427008 : Rat) / 385571) [(3, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((1213504 : Rat) / 385571) [(8, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((1213504 : Rat) / 385571) [(8, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 12. -/
theorem rs_R005_ueqv_R005NYN_partial_12_0046_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_12_0046
        rs_R005_ueqv_R005NYN_generator_12_0000_0065 =
      rs_R005_ueqv_R005NYN_partial_12_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 12. -/
def rs_R005_ueqv_R005NYN_coefficient_12_0047 : Poly :=
[
  term ((-901120 : Rat) / 158397) [(8, 1), (11, 1), (15, 1)]
]

/-- Partial product 47 for generator 12. -/
def rs_R005_ueqv_R005NYN_partial_12_0047 : Poly :=
[
  term ((-1802240 : Rat) / 158397) [(2, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((-1802240 : Rat) / 158397) [(3, 1), (8, 1), (11, 1), (15, 2)],
  term ((901120 : Rat) / 158397) [(8, 1), (11, 1), (14, 2), (15, 1)],
  term ((901120 : Rat) / 158397) [(8, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 12. -/
theorem rs_R005_ueqv_R005NYN_partial_12_0047_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_12_0047
        rs_R005_ueqv_R005NYN_generator_12_0000_0065 =
      rs_R005_ueqv_R005NYN_partial_12_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 12. -/
def rs_R005_ueqv_R005NYN_coefficient_12_0048 : Poly :=
[
  term ((16890880 : Rat) / 385571) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 48 for generator 12. -/
def rs_R005_ueqv_R005NYN_partial_12_0048 : Poly :=
[
  term ((33781760 : Rat) / 385571) [(2, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((33781760 : Rat) / 385571) [(3, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-16890880 : Rat) / 385571) [(8, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-16890880 : Rat) / 385571) [(8, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 12. -/
theorem rs_R005_ueqv_R005NYN_partial_12_0048_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_12_0048
        rs_R005_ueqv_R005NYN_generator_12_0000_0065 =
      rs_R005_ueqv_R005NYN_partial_12_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 12. -/
def rs_R005_ueqv_R005NYN_coefficient_12_0049 : Poly :=
[
  term ((-634880 : Rat) / 158397) [(8, 1), (15, 2)]
]

/-- Partial product 49 for generator 12. -/
def rs_R005_ueqv_R005NYN_partial_12_0049 : Poly :=
[
  term ((-1269760 : Rat) / 158397) [(2, 1), (8, 1), (14, 1), (15, 2)],
  term ((-1269760 : Rat) / 158397) [(3, 1), (8, 1), (15, 3)],
  term ((634880 : Rat) / 158397) [(8, 1), (14, 2), (15, 2)],
  term ((634880 : Rat) / 158397) [(8, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 12. -/
theorem rs_R005_ueqv_R005NYN_partial_12_0049_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_12_0049
        rs_R005_ueqv_R005NYN_generator_12_0000_0065 =
      rs_R005_ueqv_R005NYN_partial_12_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 12. -/
def rs_R005_ueqv_R005NYN_coefficient_12_0050 : Poly :=
[
  term ((-5379280 : Rat) / 385571) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 50 for generator 12. -/
def rs_R005_ueqv_R005NYN_partial_12_0050 : Poly :=
[
  term ((-10758560 : Rat) / 385571) [(2, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-10758560 : Rat) / 385571) [(3, 1), (8, 1), (15, 3), (16, 1)],
  term ((5379280 : Rat) / 385571) [(8, 1), (14, 2), (15, 2), (16, 1)],
  term ((5379280 : Rat) / 385571) [(8, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 12. -/
theorem rs_R005_ueqv_R005NYN_partial_12_0050_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_12_0050
        rs_R005_ueqv_R005NYN_generator_12_0000_0065 =
      rs_R005_ueqv_R005NYN_partial_12_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 12. -/
def rs_R005_ueqv_R005NYN_coefficient_12_0051 : Poly :=
[
  term ((-3112960 : Rat) / 158397) [(9, 1), (10, 1), (15, 1)]
]

/-- Partial product 51 for generator 12. -/
def rs_R005_ueqv_R005NYN_partial_12_0051 : Poly :=
[
  term ((-6225920 : Rat) / 158397) [(2, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-6225920 : Rat) / 158397) [(3, 1), (9, 1), (10, 1), (15, 2)],
  term ((3112960 : Rat) / 158397) [(9, 1), (10, 1), (14, 2), (15, 1)],
  term ((3112960 : Rat) / 158397) [(9, 1), (10, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 12. -/
theorem rs_R005_ueqv_R005NYN_partial_12_0051_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_12_0051
        rs_R005_ueqv_R005NYN_generator_12_0000_0065 =
      rs_R005_ueqv_R005NYN_partial_12_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 12. -/
def rs_R005_ueqv_R005NYN_coefficient_12_0052 : Poly :=
[
  term ((3055360 : Rat) / 385571) [(9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 52 for generator 12. -/
def rs_R005_ueqv_R005NYN_partial_12_0052 : Poly :=
[
  term ((6110720 : Rat) / 385571) [(2, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((6110720 : Rat) / 385571) [(3, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-3055360 : Rat) / 385571) [(9, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3055360 : Rat) / 385571) [(9, 1), (10, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 12. -/
theorem rs_R005_ueqv_R005NYN_partial_12_0052_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_12_0052
        rs_R005_ueqv_R005NYN_generator_12_0000_0065 =
      rs_R005_ueqv_R005NYN_partial_12_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 12. -/
def rs_R005_ueqv_R005NYN_coefficient_12_0053 : Poly :=
[
  term ((1788352 : Rat) / 158397) [(9, 1), (15, 1)]
]

/-- Partial product 53 for generator 12. -/
def rs_R005_ueqv_R005NYN_partial_12_0053 : Poly :=
[
  term ((3576704 : Rat) / 158397) [(2, 1), (9, 1), (14, 1), (15, 1)],
  term ((3576704 : Rat) / 158397) [(3, 1), (9, 1), (15, 2)],
  term ((-1788352 : Rat) / 158397) [(9, 1), (14, 2), (15, 1)],
  term ((-1788352 : Rat) / 158397) [(9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 12. -/
theorem rs_R005_ueqv_R005NYN_partial_12_0053_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_12_0053
        rs_R005_ueqv_R005NYN_generator_12_0000_0065 =
      rs_R005_ueqv_R005NYN_partial_12_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 12. -/
def rs_R005_ueqv_R005NYN_coefficient_12_0054 : Poly :=
[
  term ((-4318792 : Rat) / 385571) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 54 for generator 12. -/
def rs_R005_ueqv_R005NYN_partial_12_0054 : Poly :=
[
  term ((-8637584 : Rat) / 385571) [(2, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8637584 : Rat) / 385571) [(3, 1), (9, 1), (15, 2), (16, 1)],
  term ((4318792 : Rat) / 385571) [(9, 1), (14, 2), (15, 1), (16, 1)],
  term ((4318792 : Rat) / 385571) [(9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 12. -/
theorem rs_R005_ueqv_R005NYN_partial_12_0054_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_12_0054
        rs_R005_ueqv_R005NYN_generator_12_0000_0065 =
      rs_R005_ueqv_R005NYN_partial_12_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 12. -/
def rs_R005_ueqv_R005NYN_coefficient_12_0055 : Poly :=
[
  term ((-1556480 : Rat) / 158397) [(10, 1), (11, 1), (15, 1)]
]

/-- Partial product 55 for generator 12. -/
def rs_R005_ueqv_R005NYN_partial_12_0055 : Poly :=
[
  term ((-3112960 : Rat) / 158397) [(2, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-3112960 : Rat) / 158397) [(3, 1), (10, 1), (11, 1), (15, 2)],
  term ((1556480 : Rat) / 158397) [(10, 1), (11, 1), (14, 2), (15, 1)],
  term ((1556480 : Rat) / 158397) [(10, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 12. -/
theorem rs_R005_ueqv_R005NYN_partial_12_0055_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_12_0055
        rs_R005_ueqv_R005NYN_generator_12_0000_0065 =
      rs_R005_ueqv_R005NYN_partial_12_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 12. -/
def rs_R005_ueqv_R005NYN_coefficient_12_0056 : Poly :=
[
  term ((1527680 : Rat) / 385571) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 56 for generator 12. -/
def rs_R005_ueqv_R005NYN_partial_12_0056 : Poly :=
[
  term ((3055360 : Rat) / 385571) [(2, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((3055360 : Rat) / 385571) [(3, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1527680 : Rat) / 385571) [(10, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1527680 : Rat) / 385571) [(10, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 12. -/
theorem rs_R005_ueqv_R005NYN_partial_12_0056_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_12_0056
        rs_R005_ueqv_R005NYN_generator_12_0000_0065 =
      rs_R005_ueqv_R005NYN_partial_12_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 12. -/
def rs_R005_ueqv_R005NYN_coefficient_12_0057 : Poly :=
[
  term ((822080 : Rat) / 158397) [(11, 1), (15, 1)]
]

/-- Partial product 57 for generator 12. -/
def rs_R005_ueqv_R005NYN_partial_12_0057 : Poly :=
[
  term ((1644160 : Rat) / 158397) [(2, 1), (11, 1), (14, 1), (15, 1)],
  term ((1644160 : Rat) / 158397) [(3, 1), (11, 1), (15, 2)],
  term ((-822080 : Rat) / 158397) [(11, 1), (14, 2), (15, 1)],
  term ((-822080 : Rat) / 158397) [(11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 12. -/
theorem rs_R005_ueqv_R005NYN_partial_12_0057_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_12_0057
        rs_R005_ueqv_R005NYN_generator_12_0000_0065 =
      rs_R005_ueqv_R005NYN_partial_12_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 12. -/
def rs_R005_ueqv_R005NYN_coefficient_12_0058 : Poly :=
[
  term ((-9131048 : Rat) / 385571) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 58 for generator 12. -/
def rs_R005_ueqv_R005NYN_partial_12_0058 : Poly :=
[
  term ((-18262096 : Rat) / 385571) [(2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-18262096 : Rat) / 385571) [(3, 1), (11, 1), (15, 2), (16, 1)],
  term ((9131048 : Rat) / 385571) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((9131048 : Rat) / 385571) [(11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 12. -/
theorem rs_R005_ueqv_R005NYN_partial_12_0058_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_12_0058
        rs_R005_ueqv_R005NYN_generator_12_0000_0065 =
      rs_R005_ueqv_R005NYN_partial_12_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 12. -/
def rs_R005_ueqv_R005NYN_coefficient_12_0059 : Poly :=
[
  term ((1357760 : Rat) / 52799) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 59 for generator 12. -/
def rs_R005_ueqv_R005NYN_partial_12_0059 : Poly :=
[
  term ((2715520 : Rat) / 52799) [(2, 1), (13, 1), (14, 2), (15, 1)],
  term ((2715520 : Rat) / 52799) [(3, 1), (13, 1), (14, 1), (15, 2)],
  term ((-1357760 : Rat) / 52799) [(13, 1), (14, 1), (15, 3)],
  term ((-1357760 : Rat) / 52799) [(13, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 12. -/
theorem rs_R005_ueqv_R005NYN_partial_12_0059_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_12_0059
        rs_R005_ueqv_R005NYN_generator_12_0000_0065 =
      rs_R005_ueqv_R005NYN_partial_12_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 12. -/
def rs_R005_ueqv_R005NYN_coefficient_12_0060 : Poly :=
[
  term ((-36665208 : Rat) / 385571) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 60 for generator 12. -/
def rs_R005_ueqv_R005NYN_partial_12_0060 : Poly :=
[
  term ((-73330416 : Rat) / 385571) [(2, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-73330416 : Rat) / 385571) [(3, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((36665208 : Rat) / 385571) [(13, 1), (14, 1), (15, 3), (16, 1)],
  term ((36665208 : Rat) / 385571) [(13, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 12. -/
theorem rs_R005_ueqv_R005NYN_partial_12_0060_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_12_0060
        rs_R005_ueqv_R005NYN_generator_12_0000_0065 =
      rs_R005_ueqv_R005NYN_partial_12_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 12. -/
def rs_R005_ueqv_R005NYN_coefficient_12_0061 : Poly :=
[
  term ((-678880 : Rat) / 52799) [(13, 1), (15, 1)]
]

/-- Partial product 61 for generator 12. -/
def rs_R005_ueqv_R005NYN_partial_12_0061 : Poly :=
[
  term ((-1357760 : Rat) / 52799) [(2, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1357760 : Rat) / 52799) [(3, 1), (13, 1), (15, 2)],
  term ((678880 : Rat) / 52799) [(13, 1), (14, 2), (15, 1)],
  term ((678880 : Rat) / 52799) [(13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 12. -/
theorem rs_R005_ueqv_R005NYN_partial_12_0061_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_12_0061
        rs_R005_ueqv_R005NYN_generator_12_0000_0065 =
      rs_R005_ueqv_R005NYN_partial_12_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 12. -/
def rs_R005_ueqv_R005NYN_coefficient_12_0062 : Poly :=
[
  term ((18332604 : Rat) / 385571) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 62 for generator 12. -/
def rs_R005_ueqv_R005NYN_partial_12_0062 : Poly :=
[
  term ((36665208 : Rat) / 385571) [(2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((36665208 : Rat) / 385571) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-18332604 : Rat) / 385571) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-18332604 : Rat) / 385571) [(13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 12. -/
theorem rs_R005_ueqv_R005NYN_partial_12_0062_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_12_0062
        rs_R005_ueqv_R005NYN_generator_12_0000_0065 =
      rs_R005_ueqv_R005NYN_partial_12_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 12. -/
def rs_R005_ueqv_R005NYN_coefficient_12_0063 : Poly :=
[
  term ((-10990252 : Rat) / 158397) [(14, 1)]
]

/-- Partial product 63 for generator 12. -/
def rs_R005_ueqv_R005NYN_partial_12_0063 : Poly :=
[
  term ((-21980504 : Rat) / 158397) [(2, 1), (14, 2)],
  term ((-21980504 : Rat) / 158397) [(3, 1), (14, 1), (15, 1)],
  term ((10990252 : Rat) / 158397) [(14, 1), (15, 2)],
  term ((10990252 : Rat) / 158397) [(14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 12. -/
theorem rs_R005_ueqv_R005NYN_partial_12_0063_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_12_0063
        rs_R005_ueqv_R005NYN_generator_12_0000_0065 =
      rs_R005_ueqv_R005NYN_partial_12_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 12. -/
def rs_R005_ueqv_R005NYN_coefficient_12_0064 : Poly :=
[
  term ((-795040 : Rat) / 158397) [(15, 2)]
]

/-- Partial product 64 for generator 12. -/
def rs_R005_ueqv_R005NYN_partial_12_0064 : Poly :=
[
  term ((-1590080 : Rat) / 158397) [(2, 1), (14, 1), (15, 2)],
  term ((-1590080 : Rat) / 158397) [(3, 1), (15, 3)],
  term ((795040 : Rat) / 158397) [(14, 2), (15, 2)],
  term ((795040 : Rat) / 158397) [(15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 12. -/
theorem rs_R005_ueqv_R005NYN_partial_12_0064_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_12_0064
        rs_R005_ueqv_R005NYN_generator_12_0000_0065 =
      rs_R005_ueqv_R005NYN_partial_12_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 12. -/
def rs_R005_ueqv_R005NYN_coefficient_12_0065 : Poly :=
[
  term ((7443424 : Rat) / 385571) [(15, 2), (16, 1)]
]

/-- Partial product 65 for generator 12. -/
def rs_R005_ueqv_R005NYN_partial_12_0065 : Poly :=
[
  term ((14886848 : Rat) / 385571) [(2, 1), (14, 1), (15, 2), (16, 1)],
  term ((14886848 : Rat) / 385571) [(3, 1), (15, 3), (16, 1)],
  term ((-7443424 : Rat) / 385571) [(14, 2), (15, 2), (16, 1)],
  term ((-7443424 : Rat) / 385571) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 12. -/
theorem rs_R005_ueqv_R005NYN_partial_12_0065_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_12_0065
        rs_R005_ueqv_R005NYN_generator_12_0000_0065 =
      rs_R005_ueqv_R005NYN_partial_12_0065 := by
  native_decide

/-- Partial products in this block. -/
def rs_R005_ueqv_R005NYN_partials_12_0000_0065 : List Poly :=
[
  rs_R005_ueqv_R005NYN_partial_12_0000,
  rs_R005_ueqv_R005NYN_partial_12_0001,
  rs_R005_ueqv_R005NYN_partial_12_0002,
  rs_R005_ueqv_R005NYN_partial_12_0003,
  rs_R005_ueqv_R005NYN_partial_12_0004,
  rs_R005_ueqv_R005NYN_partial_12_0005,
  rs_R005_ueqv_R005NYN_partial_12_0006,
  rs_R005_ueqv_R005NYN_partial_12_0007,
  rs_R005_ueqv_R005NYN_partial_12_0008,
  rs_R005_ueqv_R005NYN_partial_12_0009,
  rs_R005_ueqv_R005NYN_partial_12_0010,
  rs_R005_ueqv_R005NYN_partial_12_0011,
  rs_R005_ueqv_R005NYN_partial_12_0012,
  rs_R005_ueqv_R005NYN_partial_12_0013,
  rs_R005_ueqv_R005NYN_partial_12_0014,
  rs_R005_ueqv_R005NYN_partial_12_0015,
  rs_R005_ueqv_R005NYN_partial_12_0016,
  rs_R005_ueqv_R005NYN_partial_12_0017,
  rs_R005_ueqv_R005NYN_partial_12_0018,
  rs_R005_ueqv_R005NYN_partial_12_0019,
  rs_R005_ueqv_R005NYN_partial_12_0020,
  rs_R005_ueqv_R005NYN_partial_12_0021,
  rs_R005_ueqv_R005NYN_partial_12_0022,
  rs_R005_ueqv_R005NYN_partial_12_0023,
  rs_R005_ueqv_R005NYN_partial_12_0024,
  rs_R005_ueqv_R005NYN_partial_12_0025,
  rs_R005_ueqv_R005NYN_partial_12_0026,
  rs_R005_ueqv_R005NYN_partial_12_0027,
  rs_R005_ueqv_R005NYN_partial_12_0028,
  rs_R005_ueqv_R005NYN_partial_12_0029,
  rs_R005_ueqv_R005NYN_partial_12_0030,
  rs_R005_ueqv_R005NYN_partial_12_0031,
  rs_R005_ueqv_R005NYN_partial_12_0032,
  rs_R005_ueqv_R005NYN_partial_12_0033,
  rs_R005_ueqv_R005NYN_partial_12_0034,
  rs_R005_ueqv_R005NYN_partial_12_0035,
  rs_R005_ueqv_R005NYN_partial_12_0036,
  rs_R005_ueqv_R005NYN_partial_12_0037,
  rs_R005_ueqv_R005NYN_partial_12_0038,
  rs_R005_ueqv_R005NYN_partial_12_0039,
  rs_R005_ueqv_R005NYN_partial_12_0040,
  rs_R005_ueqv_R005NYN_partial_12_0041,
  rs_R005_ueqv_R005NYN_partial_12_0042,
  rs_R005_ueqv_R005NYN_partial_12_0043,
  rs_R005_ueqv_R005NYN_partial_12_0044,
  rs_R005_ueqv_R005NYN_partial_12_0045,
  rs_R005_ueqv_R005NYN_partial_12_0046,
  rs_R005_ueqv_R005NYN_partial_12_0047,
  rs_R005_ueqv_R005NYN_partial_12_0048,
  rs_R005_ueqv_R005NYN_partial_12_0049,
  rs_R005_ueqv_R005NYN_partial_12_0050,
  rs_R005_ueqv_R005NYN_partial_12_0051,
  rs_R005_ueqv_R005NYN_partial_12_0052,
  rs_R005_ueqv_R005NYN_partial_12_0053,
  rs_R005_ueqv_R005NYN_partial_12_0054,
  rs_R005_ueqv_R005NYN_partial_12_0055,
  rs_R005_ueqv_R005NYN_partial_12_0056,
  rs_R005_ueqv_R005NYN_partial_12_0057,
  rs_R005_ueqv_R005NYN_partial_12_0058,
  rs_R005_ueqv_R005NYN_partial_12_0059,
  rs_R005_ueqv_R005NYN_partial_12_0060,
  rs_R005_ueqv_R005NYN_partial_12_0061,
  rs_R005_ueqv_R005NYN_partial_12_0062,
  rs_R005_ueqv_R005NYN_partial_12_0063,
  rs_R005_ueqv_R005NYN_partial_12_0064,
  rs_R005_ueqv_R005NYN_partial_12_0065
]

/-- Sum of partial products in this block. -/
def rs_R005_ueqv_R005NYN_block_12_0000_0065 : Poly :=
[
  term ((1001600 : Rat) / 52799) [(0, 1), (2, 1), (3, 1), (14, 1), (15, 1)],
  term ((3695136 : Rat) / 385571) [(0, 1), (2, 1), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((2129920 : Rat) / 158397) [(0, 1), (2, 1), (4, 1), (9, 1), (14, 1), (15, 1)],
  term ((4312064 : Rat) / 385571) [(0, 1), (2, 1), (4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((5324800 : Rat) / 158397) [(0, 1), (2, 1), (4, 1), (11, 1), (14, 1), (15, 1)],
  term ((10780160 : Rat) / 385571) [(0, 1), (2, 1), (4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2129920 : Rat) / 158397) [(0, 1), (2, 1), (4, 1), (14, 1), (15, 2)],
  term ((-4312064 : Rat) / 385571) [(0, 1), (2, 1), (4, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1863680 : Rat) / 52799) [(0, 1), (2, 1), (5, 1), (14, 1), (15, 1)],
  term ((-11319168 : Rat) / 385571) [(0, 1), (2, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2003200 : Rat) / 52799) [(0, 1), (2, 1), (7, 1), (14, 1), (15, 1)],
  term ((-7390272 : Rat) / 385571) [(0, 1), (2, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((2129920 : Rat) / 158397) [(0, 1), (2, 1), (8, 1), (9, 1), (14, 1), (15, 1)],
  term ((4312064 : Rat) / 385571) [(0, 1), (2, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((1064960 : Rat) / 158397) [(0, 1), (2, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((2156032 : Rat) / 385571) [(0, 1), (2, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6563584 : Rat) / 52799) [(0, 1), (2, 1), (9, 1), (14, 1), (15, 1)],
  term ((17275584 : Rat) / 385571) [(0, 1), (2, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5888 : Rat) / 4281) [(0, 1), (2, 1), (11, 1), (14, 1), (15, 1)],
  term ((-32549344 : Rat) / 385571) [(0, 1), (2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3727360 : Rat) / 158397) [(0, 1), (2, 1), (14, 1), (15, 2)],
  term ((-7546112 : Rat) / 385571) [(0, 1), (2, 1), (14, 1), (15, 2), (16, 1)],
  term ((2129920 : Rat) / 158397) [(0, 1), (3, 1), (4, 1), (9, 1), (15, 2)],
  term ((4312064 : Rat) / 385571) [(0, 1), (3, 1), (4, 1), (9, 1), (15, 2), (16, 1)],
  term ((5324800 : Rat) / 158397) [(0, 1), (3, 1), (4, 1), (11, 1), (15, 2)],
  term ((10780160 : Rat) / 385571) [(0, 1), (3, 1), (4, 1), (11, 1), (15, 2), (16, 1)],
  term ((-2129920 : Rat) / 158397) [(0, 1), (3, 1), (4, 1), (15, 3)],
  term ((-4312064 : Rat) / 385571) [(0, 1), (3, 1), (4, 1), (15, 3), (16, 1)],
  term ((-1863680 : Rat) / 52799) [(0, 1), (3, 1), (5, 1), (15, 2)],
  term ((-11319168 : Rat) / 385571) [(0, 1), (3, 1), (5, 1), (15, 2), (16, 1)],
  term ((-2003200 : Rat) / 52799) [(0, 1), (3, 1), (7, 1), (15, 2)],
  term ((-7390272 : Rat) / 385571) [(0, 1), (3, 1), (7, 1), (15, 2), (16, 1)],
  term ((2129920 : Rat) / 158397) [(0, 1), (3, 1), (8, 1), (9, 1), (15, 2)],
  term ((4312064 : Rat) / 385571) [(0, 1), (3, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((1064960 : Rat) / 158397) [(0, 1), (3, 1), (8, 1), (11, 1), (15, 2)],
  term ((2156032 : Rat) / 385571) [(0, 1), (3, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-6563584 : Rat) / 52799) [(0, 1), (3, 1), (9, 1), (15, 2)],
  term ((17275584 : Rat) / 385571) [(0, 1), (3, 1), (9, 1), (15, 2), (16, 1)],
  term ((-5888 : Rat) / 4281) [(0, 1), (3, 1), (11, 1), (15, 2)],
  term ((-32549344 : Rat) / 385571) [(0, 1), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((-500800 : Rat) / 52799) [(0, 1), (3, 1), (14, 2), (15, 1)],
  term ((-1847568 : Rat) / 385571) [(0, 1), (3, 1), (14, 2), (15, 1), (16, 1)],
  term ((-5229760 : Rat) / 158397) [(0, 1), (3, 1), (15, 3)],
  term ((-9393680 : Rat) / 385571) [(0, 1), (3, 1), (15, 3), (16, 1)],
  term ((1001600 : Rat) / 52799) [(0, 1), (3, 2), (15, 2)],
  term ((3695136 : Rat) / 385571) [(0, 1), (3, 2), (15, 2), (16, 1)],
  term ((-1064960 : Rat) / 158397) [(0, 1), (4, 1), (9, 1), (14, 2), (15, 1)],
  term ((-2156032 : Rat) / 385571) [(0, 1), (4, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1064960 : Rat) / 158397) [(0, 1), (4, 1), (9, 1), (15, 3)],
  term ((-2156032 : Rat) / 385571) [(0, 1), (4, 1), (9, 1), (15, 3), (16, 1)],
  term ((-2662400 : Rat) / 158397) [(0, 1), (4, 1), (11, 1), (14, 2), (15, 1)],
  term ((-5390080 : Rat) / 385571) [(0, 1), (4, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2662400 : Rat) / 158397) [(0, 1), (4, 1), (11, 1), (15, 3)],
  term ((-5390080 : Rat) / 385571) [(0, 1), (4, 1), (11, 1), (15, 3), (16, 1)],
  term ((1064960 : Rat) / 158397) [(0, 1), (4, 1), (14, 2), (15, 2)],
  term ((2156032 : Rat) / 385571) [(0, 1), (4, 1), (14, 2), (15, 2), (16, 1)],
  term ((1064960 : Rat) / 158397) [(0, 1), (4, 1), (15, 4)],
  term ((2156032 : Rat) / 385571) [(0, 1), (4, 1), (15, 4), (16, 1)],
  term ((931840 : Rat) / 52799) [(0, 1), (5, 1), (14, 2), (15, 1)],
  term ((5659584 : Rat) / 385571) [(0, 1), (5, 1), (14, 2), (15, 1), (16, 1)],
  term ((931840 : Rat) / 52799) [(0, 1), (5, 1), (15, 3)],
  term ((5659584 : Rat) / 385571) [(0, 1), (5, 1), (15, 3), (16, 1)],
  term ((1001600 : Rat) / 52799) [(0, 1), (7, 1), (14, 2), (15, 1)],
  term ((3695136 : Rat) / 385571) [(0, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((1001600 : Rat) / 52799) [(0, 1), (7, 1), (15, 3)],
  term ((3695136 : Rat) / 385571) [(0, 1), (7, 1), (15, 3), (16, 1)],
  term ((-1064960 : Rat) / 158397) [(0, 1), (8, 1), (9, 1), (14, 2), (15, 1)],
  term ((-2156032 : Rat) / 385571) [(0, 1), (8, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1064960 : Rat) / 158397) [(0, 1), (8, 1), (9, 1), (15, 3)],
  term ((-2156032 : Rat) / 385571) [(0, 1), (8, 1), (9, 1), (15, 3), (16, 1)],
  term ((-532480 : Rat) / 158397) [(0, 1), (8, 1), (11, 1), (14, 2), (15, 1)],
  term ((-1078016 : Rat) / 385571) [(0, 1), (8, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-532480 : Rat) / 158397) [(0, 1), (8, 1), (11, 1), (15, 3)],
  term ((-1078016 : Rat) / 385571) [(0, 1), (8, 1), (11, 1), (15, 3), (16, 1)],
  term ((3281792 : Rat) / 52799) [(0, 1), (9, 1), (14, 2), (15, 1)],
  term ((-8637792 : Rat) / 385571) [(0, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((3281792 : Rat) / 52799) [(0, 1), (9, 1), (15, 3)],
  term ((-8637792 : Rat) / 385571) [(0, 1), (9, 1), (15, 3), (16, 1)],
  term ((2944 : Rat) / 4281) [(0, 1), (11, 1), (14, 2), (15, 1)],
  term ((16274672 : Rat) / 385571) [(0, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((2944 : Rat) / 4281) [(0, 1), (11, 1), (15, 3)],
  term ((16274672 : Rat) / 385571) [(0, 1), (11, 1), (15, 3), (16, 1)],
  term ((1863680 : Rat) / 158397) [(0, 1), (14, 2), (15, 2)],
  term ((3773056 : Rat) / 385571) [(0, 1), (14, 2), (15, 2), (16, 1)],
  term ((1863680 : Rat) / 158397) [(0, 1), (15, 4)],
  term ((3773056 : Rat) / 385571) [(0, 1), (15, 4), (16, 1)],
  term ((7871008 : Rat) / 158397) [(1, 1), (2, 1), (14, 1), (15, 1)],
  term ((-7427332 : Rat) / 385571) [(1, 1), (2, 1), (14, 1), (15, 1), (16, 1)],
  term ((-14801600 : Rat) / 158397) [(1, 1), (2, 1), (14, 2), (15, 1)],
  term ((51254984 : Rat) / 385571) [(1, 1), (2, 1), (14, 2), (15, 1), (16, 1)],
  term ((-14801600 : Rat) / 158397) [(1, 1), (3, 1), (14, 1), (15, 2)],
  term ((51254984 : Rat) / 385571) [(1, 1), (3, 1), (14, 1), (15, 2), (16, 1)],
  term ((7871008 : Rat) / 158397) [(1, 1), (3, 1), (15, 2)],
  term ((-7427332 : Rat) / 385571) [(1, 1), (3, 1), (15, 2), (16, 1)],
  term ((7400800 : Rat) / 158397) [(1, 1), (14, 1), (15, 3)],
  term ((-25627492 : Rat) / 385571) [(1, 1), (14, 1), (15, 3), (16, 1)],
  term ((-3935504 : Rat) / 158397) [(1, 1), (14, 2), (15, 1)],
  term ((3713666 : Rat) / 385571) [(1, 1), (14, 2), (15, 1), (16, 1)],
  term ((7400800 : Rat) / 158397) [(1, 1), (14, 3), (15, 1)],
  term ((-25627492 : Rat) / 385571) [(1, 1), (14, 3), (15, 1), (16, 1)],
  term ((-3935504 : Rat) / 158397) [(1, 1), (15, 3)],
  term ((3713666 : Rat) / 385571) [(1, 1), (15, 3), (16, 1)],
  term ((-1001600 : Rat) / 52799) [(2, 1), (3, 1), (4, 1), (14, 1), (15, 1)],
  term ((-3695136 : Rat) / 385571) [(2, 1), (3, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((-500800 : Rat) / 52799) [(2, 1), (3, 1), (14, 1), (15, 1)],
  term ((-1847568 : Rat) / 385571) [(2, 1), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((2003200 : Rat) / 52799) [(2, 1), (4, 1), (7, 1), (14, 1), (15, 1)],
  term ((7390272 : Rat) / 385571) [(2, 1), (4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((23560448 : Rat) / 158397) [(2, 1), (4, 1), (9, 1), (14, 1), (15, 1)],
  term ((-37280192 : Rat) / 385571) [(2, 1), (4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11416576 : Rat) / 158397) [(2, 1), (4, 1), (11, 1), (14, 1), (15, 1)],
  term ((65160352 : Rat) / 385571) [(2, 1), (4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((13051520 : Rat) / 158397) [(2, 1), (4, 1), (14, 1), (15, 2)],
  term ((-22655648 : Rat) / 385571) [(2, 1), (4, 1), (14, 1), (15, 2), (16, 1)],
  term ((-6225920 : Rat) / 52799) [(2, 1), (5, 1), (8, 1), (14, 1), (15, 1)],
  term ((18332160 : Rat) / 385571) [(2, 1), (5, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((7451360 : Rat) / 158397) [(2, 1), (5, 1), (14, 1), (15, 1)],
  term ((-25602076 : Rat) / 385571) [(2, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1357760 : Rat) / 52799) [(2, 1), (5, 1), (14, 2), (15, 1)],
  term ((36665208 : Rat) / 385571) [(2, 1), (5, 1), (14, 2), (15, 1), (16, 1)],
  term ((5734400 : Rat) / 158397) [(2, 1), (8, 1), (9, 1), (14, 1), (15, 1)],
  term ((-2427008 : Rat) / 385571) [(2, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1802240 : Rat) / 158397) [(2, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((33781760 : Rat) / 385571) [(2, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1269760 : Rat) / 158397) [(2, 1), (8, 1), (14, 1), (15, 2)],
  term ((-10758560 : Rat) / 385571) [(2, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-6225920 : Rat) / 158397) [(2, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((6110720 : Rat) / 385571) [(2, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((3576704 : Rat) / 158397) [(2, 1), (9, 1), (14, 1), (15, 1)],
  term ((-8637584 : Rat) / 385571) [(2, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3112960 : Rat) / 158397) [(2, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((3055360 : Rat) / 385571) [(2, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1644160 : Rat) / 158397) [(2, 1), (11, 1), (14, 1), (15, 1)],
  term ((-18262096 : Rat) / 385571) [(2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1357760 : Rat) / 52799) [(2, 1), (13, 1), (14, 1), (15, 1)],
  term ((36665208 : Rat) / 385571) [(2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2715520 : Rat) / 52799) [(2, 1), (13, 1), (14, 2), (15, 1)],
  term ((-73330416 : Rat) / 385571) [(2, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((10990252 : Rat) / 158397) [(2, 1), (14, 1)],
  term ((-1590080 : Rat) / 158397) [(2, 1), (14, 1), (15, 2)],
  term ((14886848 : Rat) / 385571) [(2, 1), (14, 1), (15, 2), (16, 1)],
  term ((-21980504 : Rat) / 158397) [(2, 1), (14, 2)],
  term ((2003200 : Rat) / 52799) [(3, 1), (4, 1), (7, 1), (15, 2)],
  term ((7390272 : Rat) / 385571) [(3, 1), (4, 1), (7, 1), (15, 2), (16, 1)],
  term ((23560448 : Rat) / 158397) [(3, 1), (4, 1), (9, 1), (15, 2)],
  term ((-37280192 : Rat) / 385571) [(3, 1), (4, 1), (9, 1), (15, 2), (16, 1)],
  term ((-11416576 : Rat) / 158397) [(3, 1), (4, 1), (11, 1), (15, 2)],
  term ((65160352 : Rat) / 385571) [(3, 1), (4, 1), (11, 1), (15, 2), (16, 1)],
  term ((500800 : Rat) / 52799) [(3, 1), (4, 1), (14, 2), (15, 1)],
  term ((1847568 : Rat) / 385571) [(3, 1), (4, 1), (14, 2), (15, 1), (16, 1)],
  term ((14553920 : Rat) / 158397) [(3, 1), (4, 1), (15, 3)],
  term ((-20808080 : Rat) / 385571) [(3, 1), (4, 1), (15, 3), (16, 1)],
  term ((-6225920 : Rat) / 52799) [(3, 1), (5, 1), (8, 1), (15, 2)],
  term ((18332160 : Rat) / 385571) [(3, 1), (5, 1), (8, 1), (15, 2), (16, 1)],
  term ((-1357760 : Rat) / 52799) [(3, 1), (5, 1), (14, 1), (15, 2)],
  term ((36665208 : Rat) / 385571) [(3, 1), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((7451360 : Rat) / 158397) [(3, 1), (5, 1), (15, 2)],
  term ((-25602076 : Rat) / 385571) [(3, 1), (5, 1), (15, 2), (16, 1)],
  term ((5734400 : Rat) / 158397) [(3, 1), (8, 1), (9, 1), (15, 2)],
  term ((-2427008 : Rat) / 385571) [(3, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-1802240 : Rat) / 158397) [(3, 1), (8, 1), (11, 1), (15, 2)],
  term ((33781760 : Rat) / 385571) [(3, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1269760 : Rat) / 158397) [(3, 1), (8, 1), (15, 3)],
  term ((-10758560 : Rat) / 385571) [(3, 1), (8, 1), (15, 3), (16, 1)],
  term ((-6225920 : Rat) / 158397) [(3, 1), (9, 1), (10, 1), (15, 2)],
  term ((6110720 : Rat) / 385571) [(3, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((3576704 : Rat) / 158397) [(3, 1), (9, 1), (15, 2)],
  term ((-8637584 : Rat) / 385571) [(3, 1), (9, 1), (15, 2), (16, 1)],
  term ((-3112960 : Rat) / 158397) [(3, 1), (10, 1), (11, 1), (15, 2)],
  term ((3055360 : Rat) / 385571) [(3, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((1644160 : Rat) / 158397) [(3, 1), (11, 1), (15, 2)],
  term ((-18262096 : Rat) / 385571) [(3, 1), (11, 1), (15, 2), (16, 1)],
  term ((2715520 : Rat) / 52799) [(3, 1), (13, 1), (14, 1), (15, 2)],
  term ((-73330416 : Rat) / 385571) [(3, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1357760 : Rat) / 52799) [(3, 1), (13, 1), (15, 2)],
  term ((36665208 : Rat) / 385571) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-21980504 : Rat) / 158397) [(3, 1), (14, 1), (15, 1)],
  term ((250400 : Rat) / 52799) [(3, 1), (14, 2), (15, 1)],
  term ((923784 : Rat) / 385571) [(3, 1), (14, 2), (15, 1), (16, 1)],
  term ((10990252 : Rat) / 158397) [(3, 1), (15, 1)],
  term ((-838880 : Rat) / 158397) [(3, 1), (15, 3)],
  term ((15810632 : Rat) / 385571) [(3, 1), (15, 3), (16, 1)],
  term ((-1001600 : Rat) / 52799) [(3, 2), (4, 1), (15, 2)],
  term ((-3695136 : Rat) / 385571) [(3, 2), (4, 1), (15, 2), (16, 1)],
  term ((-500800 : Rat) / 52799) [(3, 2), (15, 2)],
  term ((-1847568 : Rat) / 385571) [(3, 2), (15, 2), (16, 1)],
  term ((-1001600 : Rat) / 52799) [(4, 1), (7, 1), (14, 2), (15, 1)],
  term ((-3695136 : Rat) / 385571) [(4, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1001600 : Rat) / 52799) [(4, 1), (7, 1), (15, 3)],
  term ((-3695136 : Rat) / 385571) [(4, 1), (7, 1), (15, 3), (16, 1)],
  term ((-11780224 : Rat) / 158397) [(4, 1), (9, 1), (14, 2), (15, 1)],
  term ((18640096 : Rat) / 385571) [(4, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-11780224 : Rat) / 158397) [(4, 1), (9, 1), (15, 3)],
  term ((18640096 : Rat) / 385571) [(4, 1), (9, 1), (15, 3), (16, 1)],
  term ((5708288 : Rat) / 158397) [(4, 1), (11, 1), (14, 2), (15, 1)],
  term ((-32580176 : Rat) / 385571) [(4, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((5708288 : Rat) / 158397) [(4, 1), (11, 1), (15, 3)],
  term ((-32580176 : Rat) / 385571) [(4, 1), (11, 1), (15, 3), (16, 1)],
  term ((-6525760 : Rat) / 158397) [(4, 1), (14, 2), (15, 2)],
  term ((11327824 : Rat) / 385571) [(4, 1), (14, 2), (15, 2), (16, 1)],
  term ((-6525760 : Rat) / 158397) [(4, 1), (15, 4)],
  term ((11327824 : Rat) / 385571) [(4, 1), (15, 4), (16, 1)],
  term ((3112960 : Rat) / 52799) [(5, 1), (8, 1), (14, 2), (15, 1)],
  term ((-9166080 : Rat) / 385571) [(5, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((3112960 : Rat) / 52799) [(5, 1), (8, 1), (15, 3)],
  term ((-9166080 : Rat) / 385571) [(5, 1), (8, 1), (15, 3), (16, 1)],
  term ((678880 : Rat) / 52799) [(5, 1), (14, 1), (15, 3)],
  term ((-18332604 : Rat) / 385571) [(5, 1), (14, 1), (15, 3), (16, 1)],
  term ((-3725680 : Rat) / 158397) [(5, 1), (14, 2), (15, 1)],
  term ((12801038 : Rat) / 385571) [(5, 1), (14, 2), (15, 1), (16, 1)],
  term ((678880 : Rat) / 52799) [(5, 1), (14, 3), (15, 1)],
  term ((-18332604 : Rat) / 385571) [(5, 1), (14, 3), (15, 1), (16, 1)],
  term ((-3725680 : Rat) / 158397) [(5, 1), (15, 3)],
  term ((12801038 : Rat) / 385571) [(5, 1), (15, 3), (16, 1)],
  term ((-2867200 : Rat) / 158397) [(8, 1), (9, 1), (14, 2), (15, 1)],
  term ((1213504 : Rat) / 385571) [(8, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2867200 : Rat) / 158397) [(8, 1), (9, 1), (15, 3)],
  term ((1213504 : Rat) / 385571) [(8, 1), (9, 1), (15, 3), (16, 1)],
  term ((901120 : Rat) / 158397) [(8, 1), (11, 1), (14, 2), (15, 1)],
  term ((-16890880 : Rat) / 385571) [(8, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((901120 : Rat) / 158397) [(8, 1), (11, 1), (15, 3)],
  term ((-16890880 : Rat) / 385571) [(8, 1), (11, 1), (15, 3), (16, 1)],
  term ((634880 : Rat) / 158397) [(8, 1), (14, 2), (15, 2)],
  term ((5379280 : Rat) / 385571) [(8, 1), (14, 2), (15, 2), (16, 1)],
  term ((634880 : Rat) / 158397) [(8, 1), (15, 4)],
  term ((5379280 : Rat) / 385571) [(8, 1), (15, 4), (16, 1)],
  term ((3112960 : Rat) / 158397) [(9, 1), (10, 1), (14, 2), (15, 1)],
  term ((-3055360 : Rat) / 385571) [(9, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((3112960 : Rat) / 158397) [(9, 1), (10, 1), (15, 3)],
  term ((-3055360 : Rat) / 385571) [(9, 1), (10, 1), (15, 3), (16, 1)],
  term ((-1788352 : Rat) / 158397) [(9, 1), (14, 2), (15, 1)],
  term ((4318792 : Rat) / 385571) [(9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1788352 : Rat) / 158397) [(9, 1), (15, 3)],
  term ((4318792 : Rat) / 385571) [(9, 1), (15, 3), (16, 1)],
  term ((1556480 : Rat) / 158397) [(10, 1), (11, 1), (14, 2), (15, 1)],
  term ((-1527680 : Rat) / 385571) [(10, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((1556480 : Rat) / 158397) [(10, 1), (11, 1), (15, 3)],
  term ((-1527680 : Rat) / 385571) [(10, 1), (11, 1), (15, 3), (16, 1)],
  term ((-822080 : Rat) / 158397) [(11, 1), (14, 2), (15, 1)],
  term ((9131048 : Rat) / 385571) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-822080 : Rat) / 158397) [(11, 1), (15, 3)],
  term ((9131048 : Rat) / 385571) [(11, 1), (15, 3), (16, 1)],
  term ((-1357760 : Rat) / 52799) [(13, 1), (14, 1), (15, 3)],
  term ((36665208 : Rat) / 385571) [(13, 1), (14, 1), (15, 3), (16, 1)],
  term ((678880 : Rat) / 52799) [(13, 1), (14, 2), (15, 1)],
  term ((-18332604 : Rat) / 385571) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1357760 : Rat) / 52799) [(13, 1), (14, 3), (15, 1)],
  term ((36665208 : Rat) / 385571) [(13, 1), (14, 3), (15, 1), (16, 1)],
  term ((678880 : Rat) / 52799) [(13, 1), (15, 3)],
  term ((-18332604 : Rat) / 385571) [(13, 1), (15, 3), (16, 1)],
  term ((10990252 : Rat) / 158397) [(14, 1), (15, 2)],
  term ((-5495126 : Rat) / 158397) [(14, 2)],
  term ((795040 : Rat) / 158397) [(14, 2), (15, 2)],
  term ((-7443424 : Rat) / 385571) [(14, 2), (15, 2), (16, 1)],
  term ((10990252 : Rat) / 158397) [(14, 3)],
  term ((-5495126 : Rat) / 158397) [(15, 2)],
  term ((795040 : Rat) / 158397) [(15, 4)],
  term ((-7443424 : Rat) / 385571) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 12, terms 0 through 65. -/
theorem rs_R005_ueqv_R005NYN_block_12_0000_0065_valid :
    checkProductSumEq rs_R005_ueqv_R005NYN_partials_12_0000_0065
      rs_R005_ueqv_R005NYN_block_12_0000_0065 = true := by
  native_decide

end R005UeqvR005NYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
