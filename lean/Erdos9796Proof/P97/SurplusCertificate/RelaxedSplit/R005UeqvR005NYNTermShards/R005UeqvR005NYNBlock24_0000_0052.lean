/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R005:u=v:R005NYN, term block 24:0-52

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R005UeqvR005NYNTermShards

/-- Generator polynomial 24 for relaxed split surplus certificate `R005:u=v:R005NYN`. -/
def rs_R005_ueqv_R005NYN_generator_24_0000_0052 : Poly :=
[
  term (-2 : Rat) [(0, 1), (10, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (11, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(10, 1), (14, 1)],
  term (2 : Rat) [(11, 1), (15, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 24. -/
def rs_R005_ueqv_R005NYN_coefficient_24_0000 : Poly :=
[
  term (4 : Rat) []
]

/-- Partial product 0 for generator 24. -/
def rs_R005_ueqv_R005NYN_partial_24_0000 : Poly :=
[
  term (-8 : Rat) [(0, 1), (10, 1)],
  term (4 : Rat) [(0, 2)],
  term (-8 : Rat) [(1, 1), (11, 1)],
  term (4 : Rat) [(1, 2)],
  term (8 : Rat) [(10, 1), (14, 1)],
  term (8 : Rat) [(11, 1), (15, 1)],
  term (-4 : Rat) [(14, 2)],
  term (-4 : Rat) [(15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 24. -/
theorem rs_R005_ueqv_R005NYN_partial_24_0000_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_24_0000
        rs_R005_ueqv_R005NYN_generator_24_0000_0052 =
      rs_R005_ueqv_R005NYN_partial_24_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 24. -/
def rs_R005_ueqv_R005NYN_coefficient_24_0001 : Poly :=
[
  term ((-2662400 : Rat) / 158397) [(0, 1), (3, 1), (4, 1), (15, 1)]
]

/-- Partial product 1 for generator 24. -/
def rs_R005_ueqv_R005NYN_partial_24_0001 : Poly :=
[
  term ((5324800 : Rat) / 158397) [(0, 1), (1, 1), (3, 1), (4, 1), (11, 1), (15, 1)],
  term ((-2662400 : Rat) / 158397) [(0, 1), (1, 2), (3, 1), (4, 1), (15, 1)],
  term ((-5324800 : Rat) / 158397) [(0, 1), (3, 1), (4, 1), (10, 1), (14, 1), (15, 1)],
  term ((-5324800 : Rat) / 158397) [(0, 1), (3, 1), (4, 1), (11, 1), (15, 2)],
  term ((2662400 : Rat) / 158397) [(0, 1), (3, 1), (4, 1), (14, 2), (15, 1)],
  term ((2662400 : Rat) / 158397) [(0, 1), (3, 1), (4, 1), (15, 3)],
  term ((5324800 : Rat) / 158397) [(0, 2), (3, 1), (4, 1), (10, 1), (15, 1)],
  term ((-2662400 : Rat) / 158397) [(0, 3), (3, 1), (4, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 24. -/
theorem rs_R005_ueqv_R005NYN_partial_24_0001_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_24_0001
        rs_R005_ueqv_R005NYN_generator_24_0000_0052 =
      rs_R005_ueqv_R005NYN_partial_24_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 24. -/
def rs_R005_ueqv_R005NYN_coefficient_24_0002 : Poly :=
[
  term ((-5390080 : Rat) / 385571) [(0, 1), (3, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 2 for generator 24. -/
def rs_R005_ueqv_R005NYN_partial_24_0002 : Poly :=
[
  term ((10780160 : Rat) / 385571) [(0, 1), (1, 1), (3, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-5390080 : Rat) / 385571) [(0, 1), (1, 2), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((-10780160 : Rat) / 385571) [(0, 1), (3, 1), (4, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10780160 : Rat) / 385571) [(0, 1), (3, 1), (4, 1), (11, 1), (15, 2), (16, 1)],
  term ((5390080 : Rat) / 385571) [(0, 1), (3, 1), (4, 1), (14, 2), (15, 1), (16, 1)],
  term ((5390080 : Rat) / 385571) [(0, 1), (3, 1), (4, 1), (15, 3), (16, 1)],
  term ((10780160 : Rat) / 385571) [(0, 2), (3, 1), (4, 1), (10, 1), (15, 1), (16, 1)],
  term ((-5390080 : Rat) / 385571) [(0, 3), (3, 1), (4, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 24. -/
theorem rs_R005_ueqv_R005NYN_partial_24_0002_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_24_0002
        rs_R005_ueqv_R005NYN_generator_24_0000_0052 =
      rs_R005_ueqv_R005NYN_partial_24_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 24. -/
def rs_R005_ueqv_R005NYN_coefficient_24_0003 : Poly :=
[
  term ((-532480 : Rat) / 158397) [(0, 1), (3, 1), (8, 1), (15, 1)]
]

/-- Partial product 3 for generator 24. -/
def rs_R005_ueqv_R005NYN_partial_24_0003 : Poly :=
[
  term ((1064960 : Rat) / 158397) [(0, 1), (1, 1), (3, 1), (8, 1), (11, 1), (15, 1)],
  term ((-532480 : Rat) / 158397) [(0, 1), (1, 2), (3, 1), (8, 1), (15, 1)],
  term ((-1064960 : Rat) / 158397) [(0, 1), (3, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((-1064960 : Rat) / 158397) [(0, 1), (3, 1), (8, 1), (11, 1), (15, 2)],
  term ((532480 : Rat) / 158397) [(0, 1), (3, 1), (8, 1), (14, 2), (15, 1)],
  term ((532480 : Rat) / 158397) [(0, 1), (3, 1), (8, 1), (15, 3)],
  term ((1064960 : Rat) / 158397) [(0, 2), (3, 1), (8, 1), (10, 1), (15, 1)],
  term ((-532480 : Rat) / 158397) [(0, 3), (3, 1), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 24. -/
theorem rs_R005_ueqv_R005NYN_partial_24_0003_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_24_0003
        rs_R005_ueqv_R005NYN_generator_24_0000_0052 =
      rs_R005_ueqv_R005NYN_partial_24_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 24. -/
def rs_R005_ueqv_R005NYN_coefficient_24_0004 : Poly :=
[
  term ((-1078016 : Rat) / 385571) [(0, 1), (3, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 4 for generator 24. -/
def rs_R005_ueqv_R005NYN_partial_24_0004 : Poly :=
[
  term ((2156032 : Rat) / 385571) [(0, 1), (1, 1), (3, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1078016 : Rat) / 385571) [(0, 1), (1, 2), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((-2156032 : Rat) / 385571) [(0, 1), (3, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2156032 : Rat) / 385571) [(0, 1), (3, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((1078016 : Rat) / 385571) [(0, 1), (3, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((1078016 : Rat) / 385571) [(0, 1), (3, 1), (8, 1), (15, 3), (16, 1)],
  term ((2156032 : Rat) / 385571) [(0, 2), (3, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1078016 : Rat) / 385571) [(0, 3), (3, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 24. -/
theorem rs_R005_ueqv_R005NYN_partial_24_0004_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_24_0004
        rs_R005_ueqv_R005NYN_generator_24_0000_0052 =
      rs_R005_ueqv_R005NYN_partial_24_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 24. -/
def rs_R005_ueqv_R005NYN_coefficient_24_0005 : Poly :=
[
  term ((2944 : Rat) / 4281) [(0, 1), (3, 1), (15, 1)]
]

/-- Partial product 5 for generator 24. -/
def rs_R005_ueqv_R005NYN_partial_24_0005 : Poly :=
[
  term ((-5888 : Rat) / 4281) [(0, 1), (1, 1), (3, 1), (11, 1), (15, 1)],
  term ((2944 : Rat) / 4281) [(0, 1), (1, 2), (3, 1), (15, 1)],
  term ((5888 : Rat) / 4281) [(0, 1), (3, 1), (10, 1), (14, 1), (15, 1)],
  term ((5888 : Rat) / 4281) [(0, 1), (3, 1), (11, 1), (15, 2)],
  term ((-2944 : Rat) / 4281) [(0, 1), (3, 1), (14, 2), (15, 1)],
  term ((-2944 : Rat) / 4281) [(0, 1), (3, 1), (15, 3)],
  term ((-5888 : Rat) / 4281) [(0, 2), (3, 1), (10, 1), (15, 1)],
  term ((2944 : Rat) / 4281) [(0, 3), (3, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 24. -/
theorem rs_R005_ueqv_R005NYN_partial_24_0005_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_24_0005
        rs_R005_ueqv_R005NYN_generator_24_0000_0052 =
      rs_R005_ueqv_R005NYN_partial_24_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 24. -/
def rs_R005_ueqv_R005NYN_coefficient_24_0006 : Poly :=
[
  term ((16274672 : Rat) / 385571) [(0, 1), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 6 for generator 24. -/
def rs_R005_ueqv_R005NYN_partial_24_0006 : Poly :=
[
  term ((-32549344 : Rat) / 385571) [(0, 1), (1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((16274672 : Rat) / 385571) [(0, 1), (1, 2), (3, 1), (15, 1), (16, 1)],
  term ((32549344 : Rat) / 385571) [(0, 1), (3, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((32549344 : Rat) / 385571) [(0, 1), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((-16274672 : Rat) / 385571) [(0, 1), (3, 1), (14, 2), (15, 1), (16, 1)],
  term ((-16274672 : Rat) / 385571) [(0, 1), (3, 1), (15, 3), (16, 1)],
  term ((-32549344 : Rat) / 385571) [(0, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((16274672 : Rat) / 385571) [(0, 3), (3, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 24. -/
theorem rs_R005_ueqv_R005NYN_partial_24_0006_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_24_0006
        rs_R005_ueqv_R005NYN_generator_24_0000_0052 =
      rs_R005_ueqv_R005NYN_partial_24_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 24. -/
def rs_R005_ueqv_R005NYN_coefficient_24_0007 : Poly :=
[
  term ((1331200 : Rat) / 158397) [(0, 1), (4, 1), (15, 2)]
]

/-- Partial product 7 for generator 24. -/
def rs_R005_ueqv_R005NYN_partial_24_0007 : Poly :=
[
  term ((-2662400 : Rat) / 158397) [(0, 1), (1, 1), (4, 1), (11, 1), (15, 2)],
  term ((1331200 : Rat) / 158397) [(0, 1), (1, 2), (4, 1), (15, 2)],
  term ((2662400 : Rat) / 158397) [(0, 1), (4, 1), (10, 1), (14, 1), (15, 2)],
  term ((2662400 : Rat) / 158397) [(0, 1), (4, 1), (11, 1), (15, 3)],
  term ((-1331200 : Rat) / 158397) [(0, 1), (4, 1), (14, 2), (15, 2)],
  term ((-1331200 : Rat) / 158397) [(0, 1), (4, 1), (15, 4)],
  term ((-2662400 : Rat) / 158397) [(0, 2), (4, 1), (10, 1), (15, 2)],
  term ((1331200 : Rat) / 158397) [(0, 3), (4, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 24. -/
theorem rs_R005_ueqv_R005NYN_partial_24_0007_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_24_0007
        rs_R005_ueqv_R005NYN_generator_24_0000_0052 =
      rs_R005_ueqv_R005NYN_partial_24_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 24. -/
def rs_R005_ueqv_R005NYN_coefficient_24_0008 : Poly :=
[
  term ((2695040 : Rat) / 385571) [(0, 1), (4, 1), (15, 2), (16, 1)]
]

/-- Partial product 8 for generator 24. -/
def rs_R005_ueqv_R005NYN_partial_24_0008 : Poly :=
[
  term ((-5390080 : Rat) / 385571) [(0, 1), (1, 1), (4, 1), (11, 1), (15, 2), (16, 1)],
  term ((2695040 : Rat) / 385571) [(0, 1), (1, 2), (4, 1), (15, 2), (16, 1)],
  term ((5390080 : Rat) / 385571) [(0, 1), (4, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((5390080 : Rat) / 385571) [(0, 1), (4, 1), (11, 1), (15, 3), (16, 1)],
  term ((-2695040 : Rat) / 385571) [(0, 1), (4, 1), (14, 2), (15, 2), (16, 1)],
  term ((-2695040 : Rat) / 385571) [(0, 1), (4, 1), (15, 4), (16, 1)],
  term ((-5390080 : Rat) / 385571) [(0, 2), (4, 1), (10, 1), (15, 2), (16, 1)],
  term ((2695040 : Rat) / 385571) [(0, 3), (4, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 24. -/
theorem rs_R005_ueqv_R005NYN_partial_24_0008_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_24_0008
        rs_R005_ueqv_R005NYN_generator_24_0000_0052 =
      rs_R005_ueqv_R005NYN_partial_24_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 24. -/
def rs_R005_ueqv_R005NYN_coefficient_24_0009 : Poly :=
[
  term ((-133120 : Rat) / 158397) [(0, 1), (5, 1), (15, 1)]
]

/-- Partial product 9 for generator 24. -/
def rs_R005_ueqv_R005NYN_partial_24_0009 : Poly :=
[
  term ((266240 : Rat) / 158397) [(0, 1), (1, 1), (5, 1), (11, 1), (15, 1)],
  term ((-133120 : Rat) / 158397) [(0, 1), (1, 2), (5, 1), (15, 1)],
  term ((-266240 : Rat) / 158397) [(0, 1), (5, 1), (10, 1), (14, 1), (15, 1)],
  term ((-266240 : Rat) / 158397) [(0, 1), (5, 1), (11, 1), (15, 2)],
  term ((133120 : Rat) / 158397) [(0, 1), (5, 1), (14, 2), (15, 1)],
  term ((133120 : Rat) / 158397) [(0, 1), (5, 1), (15, 3)],
  term ((266240 : Rat) / 158397) [(0, 2), (5, 1), (10, 1), (15, 1)],
  term ((-133120 : Rat) / 158397) [(0, 3), (5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 24. -/
theorem rs_R005_ueqv_R005NYN_partial_24_0009_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_24_0009
        rs_R005_ueqv_R005NYN_generator_24_0000_0052 =
      rs_R005_ueqv_R005NYN_partial_24_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 24. -/
def rs_R005_ueqv_R005NYN_coefficient_24_0010 : Poly :=
[
  term ((-269504 : Rat) / 385571) [(0, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 10 for generator 24. -/
def rs_R005_ueqv_R005NYN_partial_24_0010 : Poly :=
[
  term ((539008 : Rat) / 385571) [(0, 1), (1, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-269504 : Rat) / 385571) [(0, 1), (1, 2), (5, 1), (15, 1), (16, 1)],
  term ((-539008 : Rat) / 385571) [(0, 1), (5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-539008 : Rat) / 385571) [(0, 1), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((269504 : Rat) / 385571) [(0, 1), (5, 1), (14, 2), (15, 1), (16, 1)],
  term ((269504 : Rat) / 385571) [(0, 1), (5, 1), (15, 3), (16, 1)],
  term ((539008 : Rat) / 385571) [(0, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-269504 : Rat) / 385571) [(0, 3), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 24. -/
theorem rs_R005_ueqv_R005NYN_partial_24_0010_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_24_0010
        rs_R005_ueqv_R005NYN_generator_24_0000_0052 =
      rs_R005_ueqv_R005NYN_partial_24_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 24. -/
def rs_R005_ueqv_R005NYN_coefficient_24_0011 : Poly :=
[
  term ((266240 : Rat) / 158397) [(0, 1), (8, 1), (15, 2)]
]

/-- Partial product 11 for generator 24. -/
def rs_R005_ueqv_R005NYN_partial_24_0011 : Poly :=
[
  term ((-532480 : Rat) / 158397) [(0, 1), (1, 1), (8, 1), (11, 1), (15, 2)],
  term ((266240 : Rat) / 158397) [(0, 1), (1, 2), (8, 1), (15, 2)],
  term ((532480 : Rat) / 158397) [(0, 1), (8, 1), (10, 1), (14, 1), (15, 2)],
  term ((532480 : Rat) / 158397) [(0, 1), (8, 1), (11, 1), (15, 3)],
  term ((-266240 : Rat) / 158397) [(0, 1), (8, 1), (14, 2), (15, 2)],
  term ((-266240 : Rat) / 158397) [(0, 1), (8, 1), (15, 4)],
  term ((-532480 : Rat) / 158397) [(0, 2), (8, 1), (10, 1), (15, 2)],
  term ((266240 : Rat) / 158397) [(0, 3), (8, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 24. -/
theorem rs_R005_ueqv_R005NYN_partial_24_0011_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_24_0011
        rs_R005_ueqv_R005NYN_generator_24_0000_0052 =
      rs_R005_ueqv_R005NYN_partial_24_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 24. -/
def rs_R005_ueqv_R005NYN_coefficient_24_0012 : Poly :=
[
  term ((539008 : Rat) / 385571) [(0, 1), (8, 1), (15, 2), (16, 1)]
]

/-- Partial product 12 for generator 24. -/
def rs_R005_ueqv_R005NYN_partial_24_0012 : Poly :=
[
  term ((-1078016 : Rat) / 385571) [(0, 1), (1, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((539008 : Rat) / 385571) [(0, 1), (1, 2), (8, 1), (15, 2), (16, 1)],
  term ((1078016 : Rat) / 385571) [(0, 1), (8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((1078016 : Rat) / 385571) [(0, 1), (8, 1), (11, 1), (15, 3), (16, 1)],
  term ((-539008 : Rat) / 385571) [(0, 1), (8, 1), (14, 2), (15, 2), (16, 1)],
  term ((-539008 : Rat) / 385571) [(0, 1), (8, 1), (15, 4), (16, 1)],
  term ((-1078016 : Rat) / 385571) [(0, 2), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((539008 : Rat) / 385571) [(0, 3), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 24. -/
theorem rs_R005_ueqv_R005NYN_partial_24_0012_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_24_0012
        rs_R005_ueqv_R005NYN_generator_24_0000_0052 =
      rs_R005_ueqv_R005NYN_partial_24_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 24. -/
def rs_R005_ueqv_R005NYN_coefficient_24_0013 : Poly :=
[
  term ((133120 : Rat) / 52799) [(0, 1), (9, 1), (15, 1)]
]

/-- Partial product 13 for generator 24. -/
def rs_R005_ueqv_R005NYN_partial_24_0013 : Poly :=
[
  term ((-266240 : Rat) / 52799) [(0, 1), (1, 1), (9, 1), (11, 1), (15, 1)],
  term ((133120 : Rat) / 52799) [(0, 1), (1, 2), (9, 1), (15, 1)],
  term ((266240 : Rat) / 52799) [(0, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((266240 : Rat) / 52799) [(0, 1), (9, 1), (11, 1), (15, 2)],
  term ((-133120 : Rat) / 52799) [(0, 1), (9, 1), (14, 2), (15, 1)],
  term ((-133120 : Rat) / 52799) [(0, 1), (9, 1), (15, 3)],
  term ((-266240 : Rat) / 52799) [(0, 2), (9, 1), (10, 1), (15, 1)],
  term ((133120 : Rat) / 52799) [(0, 3), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 24. -/
theorem rs_R005_ueqv_R005NYN_partial_24_0013_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_24_0013
        rs_R005_ueqv_R005NYN_generator_24_0000_0052 =
      rs_R005_ueqv_R005NYN_partial_24_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 24. -/
def rs_R005_ueqv_R005NYN_coefficient_24_0014 : Poly :=
[
  term ((808512 : Rat) / 385571) [(0, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 14 for generator 24. -/
def rs_R005_ueqv_R005NYN_partial_24_0014 : Poly :=
[
  term ((-1617024 : Rat) / 385571) [(0, 1), (1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((808512 : Rat) / 385571) [(0, 1), (1, 2), (9, 1), (15, 1), (16, 1)],
  term ((1617024 : Rat) / 385571) [(0, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((1617024 : Rat) / 385571) [(0, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-808512 : Rat) / 385571) [(0, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-808512 : Rat) / 385571) [(0, 1), (9, 1), (15, 3), (16, 1)],
  term ((-1617024 : Rat) / 385571) [(0, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((808512 : Rat) / 385571) [(0, 3), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 24. -/
theorem rs_R005_ueqv_R005NYN_partial_24_0014_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_24_0014
        rs_R005_ueqv_R005NYN_generator_24_0000_0052 =
      rs_R005_ueqv_R005NYN_partial_24_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 24. -/
def rs_R005_ueqv_R005NYN_coefficient_24_0015 : Poly :=
[
  term ((1742656 : Rat) / 158397) [(0, 1), (15, 2)]
]

/-- Partial product 15 for generator 24. -/
def rs_R005_ueqv_R005NYN_partial_24_0015 : Poly :=
[
  term ((-3485312 : Rat) / 158397) [(0, 1), (1, 1), (11, 1), (15, 2)],
  term ((1742656 : Rat) / 158397) [(0, 1), (1, 2), (15, 2)],
  term ((3485312 : Rat) / 158397) [(0, 1), (10, 1), (14, 1), (15, 2)],
  term ((3485312 : Rat) / 158397) [(0, 1), (11, 1), (15, 3)],
  term ((-1742656 : Rat) / 158397) [(0, 1), (14, 2), (15, 2)],
  term ((-1742656 : Rat) / 158397) [(0, 1), (15, 4)],
  term ((-3485312 : Rat) / 158397) [(0, 2), (10, 1), (15, 2)],
  term ((1742656 : Rat) / 158397) [(0, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 24. -/
theorem rs_R005_ueqv_R005NYN_partial_24_0015_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_24_0015
        rs_R005_ueqv_R005NYN_generator_24_0000_0052 =
      rs_R005_ueqv_R005NYN_partial_24_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 24. -/
def rs_R005_ueqv_R005NYN_coefficient_24_0016 : Poly :=
[
  term ((-4499032 : Rat) / 385571) [(0, 1), (15, 2), (16, 1)]
]

/-- Partial product 16 for generator 24. -/
def rs_R005_ueqv_R005NYN_partial_24_0016 : Poly :=
[
  term ((8998064 : Rat) / 385571) [(0, 1), (1, 1), (11, 1), (15, 2), (16, 1)],
  term ((-4499032 : Rat) / 385571) [(0, 1), (1, 2), (15, 2), (16, 1)],
  term ((-8998064 : Rat) / 385571) [(0, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-8998064 : Rat) / 385571) [(0, 1), (11, 1), (15, 3), (16, 1)],
  term ((4499032 : Rat) / 385571) [(0, 1), (14, 2), (15, 2), (16, 1)],
  term ((4499032 : Rat) / 385571) [(0, 1), (15, 4), (16, 1)],
  term ((8998064 : Rat) / 385571) [(0, 2), (10, 1), (15, 2), (16, 1)],
  term ((-4499032 : Rat) / 385571) [(0, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 24. -/
theorem rs_R005_ueqv_R005NYN_partial_24_0016_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_24_0016
        rs_R005_ueqv_R005NYN_generator_24_0000_0052 =
      rs_R005_ueqv_R005NYN_partial_24_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 24. -/
def rs_R005_ueqv_R005NYN_coefficient_24_0017 : Poly :=
[
  term ((5324800 : Rat) / 158397) [(1, 1), (8, 1), (15, 1)]
]

/-- Partial product 17 for generator 24. -/
def rs_R005_ueqv_R005NYN_partial_24_0017 : Poly :=
[
  term ((-10649600 : Rat) / 158397) [(0, 1), (1, 1), (8, 1), (10, 1), (15, 1)],
  term ((5324800 : Rat) / 158397) [(0, 2), (1, 1), (8, 1), (15, 1)],
  term ((10649600 : Rat) / 158397) [(1, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((10649600 : Rat) / 158397) [(1, 1), (8, 1), (11, 1), (15, 2)],
  term ((-5324800 : Rat) / 158397) [(1, 1), (8, 1), (14, 2), (15, 1)],
  term ((-5324800 : Rat) / 158397) [(1, 1), (8, 1), (15, 3)],
  term ((-10649600 : Rat) / 158397) [(1, 2), (8, 1), (11, 1), (15, 1)],
  term ((5324800 : Rat) / 158397) [(1, 3), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 24. -/
theorem rs_R005_ueqv_R005NYN_partial_24_0017_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_24_0017
        rs_R005_ueqv_R005NYN_generator_24_0000_0052 =
      rs_R005_ueqv_R005NYN_partial_24_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 24. -/
def rs_R005_ueqv_R005NYN_coefficient_24_0018 : Poly :=
[
  term ((10780160 : Rat) / 385571) [(1, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 18 for generator 24. -/
def rs_R005_ueqv_R005NYN_partial_24_0018 : Poly :=
[
  term ((-21560320 : Rat) / 385571) [(0, 1), (1, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((10780160 : Rat) / 385571) [(0, 2), (1, 1), (8, 1), (15, 1), (16, 1)],
  term ((21560320 : Rat) / 385571) [(1, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((21560320 : Rat) / 385571) [(1, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-10780160 : Rat) / 385571) [(1, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((-10780160 : Rat) / 385571) [(1, 1), (8, 1), (15, 3), (16, 1)],
  term ((-21560320 : Rat) / 385571) [(1, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((10780160 : Rat) / 385571) [(1, 3), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 24. -/
theorem rs_R005_ueqv_R005NYN_partial_24_0018_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_24_0018
        rs_R005_ueqv_R005NYN_generator_24_0000_0052 =
      rs_R005_ueqv_R005NYN_partial_24_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 24. -/
def rs_R005_ueqv_R005NYN_coefficient_24_0019 : Poly :=
[
  term ((2129920 : Rat) / 158397) [(1, 1), (9, 2), (15, 1)]
]

/-- Partial product 19 for generator 24. -/
def rs_R005_ueqv_R005NYN_partial_24_0019 : Poly :=
[
  term ((-4259840 : Rat) / 158397) [(0, 1), (1, 1), (9, 2), (10, 1), (15, 1)],
  term ((2129920 : Rat) / 158397) [(0, 2), (1, 1), (9, 2), (15, 1)],
  term ((4259840 : Rat) / 158397) [(1, 1), (9, 2), (10, 1), (14, 1), (15, 1)],
  term ((4259840 : Rat) / 158397) [(1, 1), (9, 2), (11, 1), (15, 2)],
  term ((-2129920 : Rat) / 158397) [(1, 1), (9, 2), (14, 2), (15, 1)],
  term ((-2129920 : Rat) / 158397) [(1, 1), (9, 2), (15, 3)],
  term ((-4259840 : Rat) / 158397) [(1, 2), (9, 2), (11, 1), (15, 1)],
  term ((2129920 : Rat) / 158397) [(1, 3), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 24. -/
theorem rs_R005_ueqv_R005NYN_partial_24_0019_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_24_0019
        rs_R005_ueqv_R005NYN_generator_24_0000_0052 =
      rs_R005_ueqv_R005NYN_partial_24_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 24. -/
def rs_R005_ueqv_R005NYN_coefficient_24_0020 : Poly :=
[
  term ((4312064 : Rat) / 385571) [(1, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 20 for generator 24. -/
def rs_R005_ueqv_R005NYN_partial_24_0020 : Poly :=
[
  term ((-8624128 : Rat) / 385571) [(0, 1), (1, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((4312064 : Rat) / 385571) [(0, 2), (1, 1), (9, 2), (15, 1), (16, 1)],
  term ((8624128 : Rat) / 385571) [(1, 1), (9, 2), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((8624128 : Rat) / 385571) [(1, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((-4312064 : Rat) / 385571) [(1, 1), (9, 2), (14, 2), (15, 1), (16, 1)],
  term ((-4312064 : Rat) / 385571) [(1, 1), (9, 2), (15, 3), (16, 1)],
  term ((-8624128 : Rat) / 385571) [(1, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((4312064 : Rat) / 385571) [(1, 3), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 24. -/
theorem rs_R005_ueqv_R005NYN_partial_24_0020_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_24_0020
        rs_R005_ueqv_R005NYN_generator_24_0000_0052 =
      rs_R005_ueqv_R005NYN_partial_24_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 24. -/
def rs_R005_ueqv_R005NYN_coefficient_24_0021 : Poly :=
[
  term ((865920 : Rat) / 52799) [(1, 1), (15, 1)]
]

/-- Partial product 21 for generator 24. -/
def rs_R005_ueqv_R005NYN_partial_24_0021 : Poly :=
[
  term ((-1731840 : Rat) / 52799) [(0, 1), (1, 1), (10, 1), (15, 1)],
  term ((865920 : Rat) / 52799) [(0, 2), (1, 1), (15, 1)],
  term ((1731840 : Rat) / 52799) [(1, 1), (10, 1), (14, 1), (15, 1)],
  term ((1731840 : Rat) / 52799) [(1, 1), (11, 1), (15, 2)],
  term ((-865920 : Rat) / 52799) [(1, 1), (14, 2), (15, 1)],
  term ((-865920 : Rat) / 52799) [(1, 1), (15, 3)],
  term ((-1731840 : Rat) / 52799) [(1, 2), (11, 1), (15, 1)],
  term ((865920 : Rat) / 52799) [(1, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 24. -/
theorem rs_R005_ueqv_R005NYN_partial_24_0021_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_24_0021
        rs_R005_ueqv_R005NYN_generator_24_0000_0052 =
      rs_R005_ueqv_R005NYN_partial_24_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 24. -/
def rs_R005_ueqv_R005NYN_coefficient_24_0022 : Poly :=
[
  term ((-20181780 : Rat) / 385571) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 22 for generator 24. -/
def rs_R005_ueqv_R005NYN_partial_24_0022 : Poly :=
[
  term ((40363560 : Rat) / 385571) [(0, 1), (1, 1), (10, 1), (15, 1), (16, 1)],
  term ((-20181780 : Rat) / 385571) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term ((-40363560 : Rat) / 385571) [(1, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-40363560 : Rat) / 385571) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term ((20181780 : Rat) / 385571) [(1, 1), (14, 2), (15, 1), (16, 1)],
  term ((20181780 : Rat) / 385571) [(1, 1), (15, 3), (16, 1)],
  term ((40363560 : Rat) / 385571) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-20181780 : Rat) / 385571) [(1, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 24. -/
theorem rs_R005_ueqv_R005NYN_partial_24_0022_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_24_0022
        rs_R005_ueqv_R005NYN_generator_24_0000_0052 =
      rs_R005_ueqv_R005NYN_partial_24_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 24. -/
def rs_R005_ueqv_R005NYN_coefficient_24_0023 : Poly :=
[
  term ((5708288 : Rat) / 158397) [(3, 1), (4, 1), (15, 1)]
]

/-- Partial product 23 for generator 24. -/
def rs_R005_ueqv_R005NYN_partial_24_0023 : Poly :=
[
  term ((-11416576 : Rat) / 158397) [(0, 1), (3, 1), (4, 1), (10, 1), (15, 1)],
  term ((5708288 : Rat) / 158397) [(0, 2), (3, 1), (4, 1), (15, 1)],
  term ((-11416576 : Rat) / 158397) [(1, 1), (3, 1), (4, 1), (11, 1), (15, 1)],
  term ((5708288 : Rat) / 158397) [(1, 2), (3, 1), (4, 1), (15, 1)],
  term ((11416576 : Rat) / 158397) [(3, 1), (4, 1), (10, 1), (14, 1), (15, 1)],
  term ((11416576 : Rat) / 158397) [(3, 1), (4, 1), (11, 1), (15, 2)],
  term ((-5708288 : Rat) / 158397) [(3, 1), (4, 1), (14, 2), (15, 1)],
  term ((-5708288 : Rat) / 158397) [(3, 1), (4, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 24. -/
theorem rs_R005_ueqv_R005NYN_partial_24_0023_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_24_0023
        rs_R005_ueqv_R005NYN_generator_24_0000_0052 =
      rs_R005_ueqv_R005NYN_partial_24_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 24. -/
def rs_R005_ueqv_R005NYN_coefficient_24_0024 : Poly :=
[
  term ((-32580176 : Rat) / 385571) [(3, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 24 for generator 24. -/
def rs_R005_ueqv_R005NYN_partial_24_0024 : Poly :=
[
  term ((65160352 : Rat) / 385571) [(0, 1), (3, 1), (4, 1), (10, 1), (15, 1), (16, 1)],
  term ((-32580176 : Rat) / 385571) [(0, 2), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((65160352 : Rat) / 385571) [(1, 1), (3, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-32580176 : Rat) / 385571) [(1, 2), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((-65160352 : Rat) / 385571) [(3, 1), (4, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-65160352 : Rat) / 385571) [(3, 1), (4, 1), (11, 1), (15, 2), (16, 1)],
  term ((32580176 : Rat) / 385571) [(3, 1), (4, 1), (14, 2), (15, 1), (16, 1)],
  term ((32580176 : Rat) / 385571) [(3, 1), (4, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 24. -/
theorem rs_R005_ueqv_R005NYN_partial_24_0024_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_24_0024
        rs_R005_ueqv_R005NYN_generator_24_0000_0052 =
      rs_R005_ueqv_R005NYN_partial_24_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 24. -/
def rs_R005_ueqv_R005NYN_coefficient_24_0025 : Poly :=
[
  term ((901120 : Rat) / 158397) [(3, 1), (8, 1), (15, 1)]
]

/-- Partial product 25 for generator 24. -/
def rs_R005_ueqv_R005NYN_partial_24_0025 : Poly :=
[
  term ((-1802240 : Rat) / 158397) [(0, 1), (3, 1), (8, 1), (10, 1), (15, 1)],
  term ((901120 : Rat) / 158397) [(0, 2), (3, 1), (8, 1), (15, 1)],
  term ((-1802240 : Rat) / 158397) [(1, 1), (3, 1), (8, 1), (11, 1), (15, 1)],
  term ((901120 : Rat) / 158397) [(1, 2), (3, 1), (8, 1), (15, 1)],
  term ((1802240 : Rat) / 158397) [(3, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((1802240 : Rat) / 158397) [(3, 1), (8, 1), (11, 1), (15, 2)],
  term ((-901120 : Rat) / 158397) [(3, 1), (8, 1), (14, 2), (15, 1)],
  term ((-901120 : Rat) / 158397) [(3, 1), (8, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 24. -/
theorem rs_R005_ueqv_R005NYN_partial_24_0025_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_24_0025
        rs_R005_ueqv_R005NYN_generator_24_0000_0052 =
      rs_R005_ueqv_R005NYN_partial_24_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 24. -/
def rs_R005_ueqv_R005NYN_coefficient_24_0026 : Poly :=
[
  term ((-16890880 : Rat) / 385571) [(3, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 26 for generator 24. -/
def rs_R005_ueqv_R005NYN_partial_24_0026 : Poly :=
[
  term ((33781760 : Rat) / 385571) [(0, 1), (3, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-16890880 : Rat) / 385571) [(0, 2), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((33781760 : Rat) / 385571) [(1, 1), (3, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-16890880 : Rat) / 385571) [(1, 2), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((-33781760 : Rat) / 385571) [(3, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-33781760 : Rat) / 385571) [(3, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((16890880 : Rat) / 385571) [(3, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((16890880 : Rat) / 385571) [(3, 1), (8, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 24. -/
theorem rs_R005_ueqv_R005NYN_partial_24_0026_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_24_0026
        rs_R005_ueqv_R005NYN_generator_24_0000_0052 =
      rs_R005_ueqv_R005NYN_partial_24_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 24. -/
def rs_R005_ueqv_R005NYN_coefficient_24_0027 : Poly :=
[
  term ((1556480 : Rat) / 158397) [(3, 1), (10, 1), (15, 1)]
]

/-- Partial product 27 for generator 24. -/
def rs_R005_ueqv_R005NYN_partial_24_0027 : Poly :=
[
  term ((-3112960 : Rat) / 158397) [(0, 1), (3, 1), (10, 2), (15, 1)],
  term ((1556480 : Rat) / 158397) [(0, 2), (3, 1), (10, 1), (15, 1)],
  term ((-3112960 : Rat) / 158397) [(1, 1), (3, 1), (10, 1), (11, 1), (15, 1)],
  term ((1556480 : Rat) / 158397) [(1, 2), (3, 1), (10, 1), (15, 1)],
  term ((3112960 : Rat) / 158397) [(3, 1), (10, 1), (11, 1), (15, 2)],
  term ((-1556480 : Rat) / 158397) [(3, 1), (10, 1), (14, 2), (15, 1)],
  term ((-1556480 : Rat) / 158397) [(3, 1), (10, 1), (15, 3)],
  term ((3112960 : Rat) / 158397) [(3, 1), (10, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 24. -/
theorem rs_R005_ueqv_R005NYN_partial_24_0027_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_24_0027
        rs_R005_ueqv_R005NYN_generator_24_0000_0052 =
      rs_R005_ueqv_R005NYN_partial_24_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 24. -/
def rs_R005_ueqv_R005NYN_coefficient_24_0028 : Poly :=
[
  term ((-1527680 : Rat) / 385571) [(3, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 28 for generator 24. -/
def rs_R005_ueqv_R005NYN_partial_24_0028 : Poly :=
[
  term ((3055360 : Rat) / 385571) [(0, 1), (3, 1), (10, 2), (15, 1), (16, 1)],
  term ((-1527680 : Rat) / 385571) [(0, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((3055360 : Rat) / 385571) [(1, 1), (3, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1527680 : Rat) / 385571) [(1, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-3055360 : Rat) / 385571) [(3, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((1527680 : Rat) / 385571) [(3, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((1527680 : Rat) / 385571) [(3, 1), (10, 1), (15, 3), (16, 1)],
  term ((-3055360 : Rat) / 385571) [(3, 1), (10, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 24. -/
theorem rs_R005_ueqv_R005NYN_partial_24_0028_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_24_0028
        rs_R005_ueqv_R005NYN_generator_24_0000_0052 =
      rs_R005_ueqv_R005NYN_partial_24_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 24. -/
def rs_R005_ueqv_R005NYN_coefficient_24_0029 : Poly :=
[
  term ((-822080 : Rat) / 158397) [(3, 1), (15, 1)]
]

/-- Partial product 29 for generator 24. -/
def rs_R005_ueqv_R005NYN_partial_24_0029 : Poly :=
[
  term ((1644160 : Rat) / 158397) [(0, 1), (3, 1), (10, 1), (15, 1)],
  term ((-822080 : Rat) / 158397) [(0, 2), (3, 1), (15, 1)],
  term ((1644160 : Rat) / 158397) [(1, 1), (3, 1), (11, 1), (15, 1)],
  term ((-822080 : Rat) / 158397) [(1, 2), (3, 1), (15, 1)],
  term ((-1644160 : Rat) / 158397) [(3, 1), (10, 1), (14, 1), (15, 1)],
  term ((-1644160 : Rat) / 158397) [(3, 1), (11, 1), (15, 2)],
  term ((822080 : Rat) / 158397) [(3, 1), (14, 2), (15, 1)],
  term ((822080 : Rat) / 158397) [(3, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 24. -/
theorem rs_R005_ueqv_R005NYN_partial_24_0029_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_24_0029
        rs_R005_ueqv_R005NYN_generator_24_0000_0052 =
      rs_R005_ueqv_R005NYN_partial_24_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 24. -/
def rs_R005_ueqv_R005NYN_coefficient_24_0030 : Poly :=
[
  term ((9131048 : Rat) / 385571) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 30 for generator 24. -/
def rs_R005_ueqv_R005NYN_partial_24_0030 : Poly :=
[
  term ((-18262096 : Rat) / 385571) [(0, 1), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((9131048 : Rat) / 385571) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((-18262096 : Rat) / 385571) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((9131048 : Rat) / 385571) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((18262096 : Rat) / 385571) [(3, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((18262096 : Rat) / 385571) [(3, 1), (11, 1), (15, 2), (16, 1)],
  term ((-9131048 : Rat) / 385571) [(3, 1), (14, 2), (15, 1), (16, 1)],
  term ((-9131048 : Rat) / 385571) [(3, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 24. -/
theorem rs_R005_ueqv_R005NYN_partial_24_0030_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_24_0030
        rs_R005_ueqv_R005NYN_generator_24_0000_0052 =
      rs_R005_ueqv_R005NYN_partial_24_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 24. -/
def rs_R005_ueqv_R005NYN_coefficient_24_0031 : Poly :=
[
  term ((-5188864 : Rat) / 158397) [(4, 1), (15, 2)]
]

/-- Partial product 31 for generator 24. -/
def rs_R005_ueqv_R005NYN_partial_24_0031 : Poly :=
[
  term ((10377728 : Rat) / 158397) [(0, 1), (4, 1), (10, 1), (15, 2)],
  term ((-5188864 : Rat) / 158397) [(0, 2), (4, 1), (15, 2)],
  term ((10377728 : Rat) / 158397) [(1, 1), (4, 1), (11, 1), (15, 2)],
  term ((-5188864 : Rat) / 158397) [(1, 2), (4, 1), (15, 2)],
  term ((-10377728 : Rat) / 158397) [(4, 1), (10, 1), (14, 1), (15, 2)],
  term ((-10377728 : Rat) / 158397) [(4, 1), (11, 1), (15, 3)],
  term ((5188864 : Rat) / 158397) [(4, 1), (14, 2), (15, 2)],
  term ((5188864 : Rat) / 158397) [(4, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 24. -/
theorem rs_R005_ueqv_R005NYN_partial_24_0031_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_24_0031
        rs_R005_ueqv_R005NYN_generator_24_0000_0052 =
      rs_R005_ueqv_R005NYN_partial_24_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 24. -/
def rs_R005_ueqv_R005NYN_coefficient_24_0032 : Poly :=
[
  term ((18581608 : Rat) / 385571) [(4, 1), (15, 2), (16, 1)]
]

/-- Partial product 32 for generator 24. -/
def rs_R005_ueqv_R005NYN_partial_24_0032 : Poly :=
[
  term ((-37163216 : Rat) / 385571) [(0, 1), (4, 1), (10, 1), (15, 2), (16, 1)],
  term ((18581608 : Rat) / 385571) [(0, 2), (4, 1), (15, 2), (16, 1)],
  term ((-37163216 : Rat) / 385571) [(1, 1), (4, 1), (11, 1), (15, 2), (16, 1)],
  term ((18581608 : Rat) / 385571) [(1, 2), (4, 1), (15, 2), (16, 1)],
  term ((37163216 : Rat) / 385571) [(4, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((37163216 : Rat) / 385571) [(4, 1), (11, 1), (15, 3), (16, 1)],
  term ((-18581608 : Rat) / 385571) [(4, 1), (14, 2), (15, 2), (16, 1)],
  term ((-18581608 : Rat) / 385571) [(4, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 24. -/
theorem rs_R005_ueqv_R005NYN_partial_24_0032_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_24_0032
        rs_R005_ueqv_R005NYN_generator_24_0000_0052 =
      rs_R005_ueqv_R005NYN_partial_24_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 24. -/
def rs_R005_ueqv_R005NYN_coefficient_24_0033 : Poly :=
[
  term ((-3258080 : Rat) / 158397) [(5, 1), (15, 1)]
]

/-- Partial product 33 for generator 24. -/
def rs_R005_ueqv_R005NYN_partial_24_0033 : Poly :=
[
  term ((6516160 : Rat) / 158397) [(0, 1), (5, 1), (10, 1), (15, 1)],
  term ((-3258080 : Rat) / 158397) [(0, 2), (5, 1), (15, 1)],
  term ((6516160 : Rat) / 158397) [(1, 1), (5, 1), (11, 1), (15, 1)],
  term ((-3258080 : Rat) / 158397) [(1, 2), (5, 1), (15, 1)],
  term ((-6516160 : Rat) / 158397) [(5, 1), (10, 1), (14, 1), (15, 1)],
  term ((-6516160 : Rat) / 158397) [(5, 1), (11, 1), (15, 2)],
  term ((3258080 : Rat) / 158397) [(5, 1), (14, 2), (15, 1)],
  term ((3258080 : Rat) / 158397) [(5, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 24. -/
theorem rs_R005_ueqv_R005NYN_partial_24_0033_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_24_0033
        rs_R005_ueqv_R005NYN_generator_24_0000_0052 =
      rs_R005_ueqv_R005NYN_partial_24_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 24. -/
def rs_R005_ueqv_R005NYN_coefficient_24_0034 : Poly :=
[
  term ((15250556 : Rat) / 385571) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 34 for generator 24. -/
def rs_R005_ueqv_R005NYN_partial_24_0034 : Poly :=
[
  term ((-30501112 : Rat) / 385571) [(0, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((15250556 : Rat) / 385571) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((-30501112 : Rat) / 385571) [(1, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((15250556 : Rat) / 385571) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((30501112 : Rat) / 385571) [(5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((30501112 : Rat) / 385571) [(5, 1), (11, 1), (15, 2), (16, 1)],
  term ((-15250556 : Rat) / 385571) [(5, 1), (14, 2), (15, 1), (16, 1)],
  term ((-15250556 : Rat) / 385571) [(5, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 24. -/
theorem rs_R005_ueqv_R005NYN_partial_24_0034_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_24_0034
        rs_R005_ueqv_R005NYN_generator_24_0000_0052 =
      rs_R005_ueqv_R005NYN_partial_24_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 24. -/
def rs_R005_ueqv_R005NYN_coefficient_24_0035 : Poly :=
[
  term ((-778240 : Rat) / 52799) [(8, 1), (9, 1), (15, 1)]
]

/-- Partial product 35 for generator 24. -/
def rs_R005_ueqv_R005NYN_partial_24_0035 : Poly :=
[
  term ((1556480 : Rat) / 52799) [(0, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((-778240 : Rat) / 52799) [(0, 2), (8, 1), (9, 1), (15, 1)],
  term ((1556480 : Rat) / 52799) [(1, 1), (8, 1), (9, 1), (11, 1), (15, 1)],
  term ((-778240 : Rat) / 52799) [(1, 2), (8, 1), (9, 1), (15, 1)],
  term ((-1556480 : Rat) / 52799) [(8, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-1556480 : Rat) / 52799) [(8, 1), (9, 1), (11, 1), (15, 2)],
  term ((778240 : Rat) / 52799) [(8, 1), (9, 1), (14, 2), (15, 1)],
  term ((778240 : Rat) / 52799) [(8, 1), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 24. -/
theorem rs_R005_ueqv_R005NYN_partial_24_0035_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_24_0035
        rs_R005_ueqv_R005NYN_generator_24_0000_0052 =
      rs_R005_ueqv_R005NYN_partial_24_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 24. -/
def rs_R005_ueqv_R005NYN_coefficient_24_0036 : Poly :=
[
  term ((2291520 : Rat) / 385571) [(8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 36 for generator 24. -/
def rs_R005_ueqv_R005NYN_partial_24_0036 : Poly :=
[
  term ((-4583040 : Rat) / 385571) [(0, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((2291520 : Rat) / 385571) [(0, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(1, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((2291520 : Rat) / 385571) [(1, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((4583040 : Rat) / 385571) [(8, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((4583040 : Rat) / 385571) [(8, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-2291520 : Rat) / 385571) [(8, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2291520 : Rat) / 385571) [(8, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 24. -/
theorem rs_R005_ueqv_R005NYN_partial_24_0036_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_24_0036
        rs_R005_ueqv_R005NYN_generator_24_0000_0052 =
      rs_R005_ueqv_R005NYN_partial_24_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 24. -/
def rs_R005_ueqv_R005NYN_coefficient_24_0037 : Poly :=
[
  term ((1556480 : Rat) / 52799) [(8, 1), (11, 1), (15, 1)]
]

/-- Partial product 37 for generator 24. -/
def rs_R005_ueqv_R005NYN_partial_24_0037 : Poly :=
[
  term ((-3112960 : Rat) / 52799) [(0, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((1556480 : Rat) / 52799) [(0, 2), (8, 1), (11, 1), (15, 1)],
  term ((-3112960 : Rat) / 52799) [(1, 1), (8, 1), (11, 2), (15, 1)],
  term ((1556480 : Rat) / 52799) [(1, 2), (8, 1), (11, 1), (15, 1)],
  term ((3112960 : Rat) / 52799) [(8, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-1556480 : Rat) / 52799) [(8, 1), (11, 1), (14, 2), (15, 1)],
  term ((-1556480 : Rat) / 52799) [(8, 1), (11, 1), (15, 3)],
  term ((3112960 : Rat) / 52799) [(8, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 24. -/
theorem rs_R005_ueqv_R005NYN_partial_24_0037_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_24_0037
        rs_R005_ueqv_R005NYN_generator_24_0000_0052 =
      rs_R005_ueqv_R005NYN_partial_24_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 24. -/
def rs_R005_ueqv_R005NYN_coefficient_24_0038 : Poly :=
[
  term ((-4583040 : Rat) / 385571) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 38 for generator 24. -/
def rs_R005_ueqv_R005NYN_partial_24_0038 : Poly :=
[
  term ((9166080 : Rat) / 385571) [(0, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(0, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((9166080 : Rat) / 385571) [(1, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(1, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-9166080 : Rat) / 385571) [(8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((4583040 : Rat) / 385571) [(8, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((4583040 : Rat) / 385571) [(8, 1), (11, 1), (15, 3), (16, 1)],
  term ((-9166080 : Rat) / 385571) [(8, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 24. -/
theorem rs_R005_ueqv_R005NYN_partial_24_0038_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_24_0038
        rs_R005_ueqv_R005NYN_generator_24_0000_0052 =
      rs_R005_ueqv_R005NYN_partial_24_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 24. -/
def rs_R005_ueqv_R005NYN_coefficient_24_0039 : Poly :=
[
  term ((-778240 : Rat) / 158397) [(8, 1), (15, 2)]
]

/-- Partial product 39 for generator 24. -/
def rs_R005_ueqv_R005NYN_partial_24_0039 : Poly :=
[
  term ((1556480 : Rat) / 158397) [(0, 1), (8, 1), (10, 1), (15, 2)],
  term ((-778240 : Rat) / 158397) [(0, 2), (8, 1), (15, 2)],
  term ((1556480 : Rat) / 158397) [(1, 1), (8, 1), (11, 1), (15, 2)],
  term ((-778240 : Rat) / 158397) [(1, 2), (8, 1), (15, 2)],
  term ((-1556480 : Rat) / 158397) [(8, 1), (10, 1), (14, 1), (15, 2)],
  term ((-1556480 : Rat) / 158397) [(8, 1), (11, 1), (15, 3)],
  term ((778240 : Rat) / 158397) [(8, 1), (14, 2), (15, 2)],
  term ((778240 : Rat) / 158397) [(8, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 24. -/
theorem rs_R005_ueqv_R005NYN_partial_24_0039_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_24_0039
        rs_R005_ueqv_R005NYN_generator_24_0000_0052 =
      rs_R005_ueqv_R005NYN_partial_24_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 24. -/
def rs_R005_ueqv_R005NYN_coefficient_24_0040 : Poly :=
[
  term ((763840 : Rat) / 385571) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 40 for generator 24. -/
def rs_R005_ueqv_R005NYN_partial_24_0040 : Poly :=
[
  term ((-1527680 : Rat) / 385571) [(0, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((763840 : Rat) / 385571) [(0, 2), (8, 1), (15, 2), (16, 1)],
  term ((-1527680 : Rat) / 385571) [(1, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((763840 : Rat) / 385571) [(1, 2), (8, 1), (15, 2), (16, 1)],
  term ((1527680 : Rat) / 385571) [(8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((1527680 : Rat) / 385571) [(8, 1), (11, 1), (15, 3), (16, 1)],
  term ((-763840 : Rat) / 385571) [(8, 1), (14, 2), (15, 2), (16, 1)],
  term ((-763840 : Rat) / 385571) [(8, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 24. -/
theorem rs_R005_ueqv_R005NYN_partial_24_0040_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_24_0040
        rs_R005_ueqv_R005NYN_generator_24_0000_0052 =
      rs_R005_ueqv_R005NYN_partial_24_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 24. -/
def rs_R005_ueqv_R005NYN_coefficient_24_0041 : Poly :=
[
  term ((-1556480 : Rat) / 52799) [(9, 1), (10, 1), (15, 1)]
]

/-- Partial product 41 for generator 24. -/
def rs_R005_ueqv_R005NYN_partial_24_0041 : Poly :=
[
  term ((3112960 : Rat) / 52799) [(0, 1), (9, 1), (10, 2), (15, 1)],
  term ((-1556480 : Rat) / 52799) [(0, 2), (9, 1), (10, 1), (15, 1)],
  term ((3112960 : Rat) / 52799) [(1, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((-1556480 : Rat) / 52799) [(1, 2), (9, 1), (10, 1), (15, 1)],
  term ((-3112960 : Rat) / 52799) [(9, 1), (10, 1), (11, 1), (15, 2)],
  term ((1556480 : Rat) / 52799) [(9, 1), (10, 1), (14, 2), (15, 1)],
  term ((1556480 : Rat) / 52799) [(9, 1), (10, 1), (15, 3)],
  term ((-3112960 : Rat) / 52799) [(9, 1), (10, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 24. -/
theorem rs_R005_ueqv_R005NYN_partial_24_0041_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_24_0041
        rs_R005_ueqv_R005NYN_generator_24_0000_0052 =
      rs_R005_ueqv_R005NYN_partial_24_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 24. -/
def rs_R005_ueqv_R005NYN_coefficient_24_0042 : Poly :=
[
  term ((4583040 : Rat) / 385571) [(9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 42 for generator 24. -/
def rs_R005_ueqv_R005NYN_partial_24_0042 : Poly :=
[
  term ((-9166080 : Rat) / 385571) [(0, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((4583040 : Rat) / 385571) [(0, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-9166080 : Rat) / 385571) [(1, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((4583040 : Rat) / 385571) [(1, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((9166080 : Rat) / 385571) [(9, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(9, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(9, 1), (10, 1), (15, 3), (16, 1)],
  term ((9166080 : Rat) / 385571) [(9, 1), (10, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 24. -/
theorem rs_R005_ueqv_R005NYN_partial_24_0042_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_24_0042
        rs_R005_ueqv_R005NYN_generator_24_0000_0052 =
      rs_R005_ueqv_R005NYN_partial_24_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 24. -/
def rs_R005_ueqv_R005NYN_coefficient_24_0043 : Poly :=
[
  term ((-938432 : Rat) / 158397) [(9, 1), (15, 1)]
]

/-- Partial product 43 for generator 24. -/
def rs_R005_ueqv_R005NYN_partial_24_0043 : Poly :=
[
  term ((1876864 : Rat) / 158397) [(0, 1), (9, 1), (10, 1), (15, 1)],
  term ((-938432 : Rat) / 158397) [(0, 2), (9, 1), (15, 1)],
  term ((1876864 : Rat) / 158397) [(1, 1), (9, 1), (11, 1), (15, 1)],
  term ((-938432 : Rat) / 158397) [(1, 2), (9, 1), (15, 1)],
  term ((-1876864 : Rat) / 158397) [(9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-1876864 : Rat) / 158397) [(9, 1), (11, 1), (15, 2)],
  term ((938432 : Rat) / 158397) [(9, 1), (14, 2), (15, 1)],
  term ((938432 : Rat) / 158397) [(9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 24. -/
theorem rs_R005_ueqv_R005NYN_partial_24_0043_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_24_0043
        rs_R005_ueqv_R005NYN_generator_24_0000_0052 =
      rs_R005_ueqv_R005NYN_partial_24_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 24. -/
def rs_R005_ueqv_R005NYN_coefficient_24_0044 : Poly :=
[
  term ((483392 : Rat) / 385571) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 44 for generator 24. -/
def rs_R005_ueqv_R005NYN_partial_24_0044 : Poly :=
[
  term ((-966784 : Rat) / 385571) [(0, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((483392 : Rat) / 385571) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((-966784 : Rat) / 385571) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((483392 : Rat) / 385571) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((966784 : Rat) / 385571) [(9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((966784 : Rat) / 385571) [(9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-483392 : Rat) / 385571) [(9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-483392 : Rat) / 385571) [(9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 24. -/
theorem rs_R005_ueqv_R005NYN_partial_24_0044_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_24_0044
        rs_R005_ueqv_R005NYN_generator_24_0000_0052 =
      rs_R005_ueqv_R005NYN_partial_24_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 24. -/
def rs_R005_ueqv_R005NYN_coefficient_24_0045 : Poly :=
[
  term ((-1064960 : Rat) / 158397) [(9, 2), (15, 2)]
]

/-- Partial product 45 for generator 24. -/
def rs_R005_ueqv_R005NYN_partial_24_0045 : Poly :=
[
  term ((2129920 : Rat) / 158397) [(0, 1), (9, 2), (10, 1), (15, 2)],
  term ((-1064960 : Rat) / 158397) [(0, 2), (9, 2), (15, 2)],
  term ((2129920 : Rat) / 158397) [(1, 1), (9, 2), (11, 1), (15, 2)],
  term ((-1064960 : Rat) / 158397) [(1, 2), (9, 2), (15, 2)],
  term ((-2129920 : Rat) / 158397) [(9, 2), (10, 1), (14, 1), (15, 2)],
  term ((-2129920 : Rat) / 158397) [(9, 2), (11, 1), (15, 3)],
  term ((1064960 : Rat) / 158397) [(9, 2), (14, 2), (15, 2)],
  term ((1064960 : Rat) / 158397) [(9, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 24. -/
theorem rs_R005_ueqv_R005NYN_partial_24_0045_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_24_0045
        rs_R005_ueqv_R005NYN_generator_24_0000_0052 =
      rs_R005_ueqv_R005NYN_partial_24_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 24. -/
def rs_R005_ueqv_R005NYN_coefficient_24_0046 : Poly :=
[
  term ((-2156032 : Rat) / 385571) [(9, 2), (15, 2), (16, 1)]
]

/-- Partial product 46 for generator 24. -/
def rs_R005_ueqv_R005NYN_partial_24_0046 : Poly :=
[
  term ((4312064 : Rat) / 385571) [(0, 1), (9, 2), (10, 1), (15, 2), (16, 1)],
  term ((-2156032 : Rat) / 385571) [(0, 2), (9, 2), (15, 2), (16, 1)],
  term ((4312064 : Rat) / 385571) [(1, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((-2156032 : Rat) / 385571) [(1, 2), (9, 2), (15, 2), (16, 1)],
  term ((-4312064 : Rat) / 385571) [(9, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4312064 : Rat) / 385571) [(9, 2), (11, 1), (15, 3), (16, 1)],
  term ((2156032 : Rat) / 385571) [(9, 2), (14, 2), (15, 2), (16, 1)],
  term ((2156032 : Rat) / 385571) [(9, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 24. -/
theorem rs_R005_ueqv_R005NYN_partial_24_0046_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_24_0046
        rs_R005_ueqv_R005NYN_generator_24_0000_0052 =
      rs_R005_ueqv_R005NYN_partial_24_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 24. -/
def rs_R005_ueqv_R005NYN_coefficient_24_0047 : Poly :=
[
  term ((-778240 : Rat) / 158397) [(10, 1), (15, 2)]
]

/-- Partial product 47 for generator 24. -/
def rs_R005_ueqv_R005NYN_partial_24_0047 : Poly :=
[
  term ((1556480 : Rat) / 158397) [(0, 1), (10, 2), (15, 2)],
  term ((-778240 : Rat) / 158397) [(0, 2), (10, 1), (15, 2)],
  term ((1556480 : Rat) / 158397) [(1, 1), (10, 1), (11, 1), (15, 2)],
  term ((-778240 : Rat) / 158397) [(1, 2), (10, 1), (15, 2)],
  term ((-1556480 : Rat) / 158397) [(10, 1), (11, 1), (15, 3)],
  term ((778240 : Rat) / 158397) [(10, 1), (14, 2), (15, 2)],
  term ((778240 : Rat) / 158397) [(10, 1), (15, 4)],
  term ((-1556480 : Rat) / 158397) [(10, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 24. -/
theorem rs_R005_ueqv_R005NYN_partial_24_0047_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_24_0047
        rs_R005_ueqv_R005NYN_generator_24_0000_0052 =
      rs_R005_ueqv_R005NYN_partial_24_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 24. -/
def rs_R005_ueqv_R005NYN_coefficient_24_0048 : Poly :=
[
  term ((763840 : Rat) / 385571) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 48 for generator 24. -/
def rs_R005_ueqv_R005NYN_partial_24_0048 : Poly :=
[
  term ((-1527680 : Rat) / 385571) [(0, 1), (10, 2), (15, 2), (16, 1)],
  term ((763840 : Rat) / 385571) [(0, 2), (10, 1), (15, 2), (16, 1)],
  term ((-1527680 : Rat) / 385571) [(1, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((763840 : Rat) / 385571) [(1, 2), (10, 1), (15, 2), (16, 1)],
  term ((1527680 : Rat) / 385571) [(10, 1), (11, 1), (15, 3), (16, 1)],
  term ((-763840 : Rat) / 385571) [(10, 1), (14, 2), (15, 2), (16, 1)],
  term ((-763840 : Rat) / 385571) [(10, 1), (15, 4), (16, 1)],
  term ((1527680 : Rat) / 385571) [(10, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 24. -/
theorem rs_R005_ueqv_R005NYN_partial_24_0048_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_24_0048
        rs_R005_ueqv_R005NYN_generator_24_0000_0052 =
      rs_R005_ueqv_R005NYN_partial_24_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 24. -/
def rs_R005_ueqv_R005NYN_coefficient_24_0049 : Poly :=
[
  term ((-1556480 : Rat) / 52799) [(11, 1), (15, 1)]
]

/-- Partial product 49 for generator 24. -/
def rs_R005_ueqv_R005NYN_partial_24_0049 : Poly :=
[
  term ((3112960 : Rat) / 52799) [(0, 1), (10, 1), (11, 1), (15, 1)],
  term ((-1556480 : Rat) / 52799) [(0, 2), (11, 1), (15, 1)],
  term ((3112960 : Rat) / 52799) [(1, 1), (11, 2), (15, 1)],
  term ((-1556480 : Rat) / 52799) [(1, 2), (11, 1), (15, 1)],
  term ((-3112960 : Rat) / 52799) [(10, 1), (11, 1), (14, 1), (15, 1)],
  term ((1556480 : Rat) / 52799) [(11, 1), (14, 2), (15, 1)],
  term ((1556480 : Rat) / 52799) [(11, 1), (15, 3)],
  term ((-3112960 : Rat) / 52799) [(11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 24. -/
theorem rs_R005_ueqv_R005NYN_partial_24_0049_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_24_0049
        rs_R005_ueqv_R005NYN_generator_24_0000_0052 =
      rs_R005_ueqv_R005NYN_partial_24_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 24. -/
def rs_R005_ueqv_R005NYN_coefficient_24_0050 : Poly :=
[
  term ((4583040 : Rat) / 385571) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 50 for generator 24. -/
def rs_R005_ueqv_R005NYN_partial_24_0050 : Poly :=
[
  term ((-9166080 : Rat) / 385571) [(0, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((4583040 : Rat) / 385571) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((-9166080 : Rat) / 385571) [(1, 1), (11, 2), (15, 1), (16, 1)],
  term ((4583040 : Rat) / 385571) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((9166080 : Rat) / 385571) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(11, 1), (15, 3), (16, 1)],
  term ((9166080 : Rat) / 385571) [(11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 24. -/
theorem rs_R005_ueqv_R005NYN_partial_24_0050_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_24_0050
        rs_R005_ueqv_R005NYN_generator_24_0000_0052 =
      rs_R005_ueqv_R005NYN_partial_24_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 24. -/
def rs_R005_ueqv_R005NYN_coefficient_24_0051 : Poly :=
[
  term ((-567376 : Rat) / 52799) [(15, 2)]
]

/-- Partial product 51 for generator 24. -/
def rs_R005_ueqv_R005NYN_partial_24_0051 : Poly :=
[
  term ((1134752 : Rat) / 52799) [(0, 1), (10, 1), (15, 2)],
  term ((-567376 : Rat) / 52799) [(0, 2), (15, 2)],
  term ((1134752 : Rat) / 52799) [(1, 1), (11, 1), (15, 2)],
  term ((-567376 : Rat) / 52799) [(1, 2), (15, 2)],
  term ((-1134752 : Rat) / 52799) [(10, 1), (14, 1), (15, 2)],
  term ((-1134752 : Rat) / 52799) [(11, 1), (15, 3)],
  term ((567376 : Rat) / 52799) [(14, 2), (15, 2)],
  term ((567376 : Rat) / 52799) [(15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 24. -/
theorem rs_R005_ueqv_R005NYN_partial_24_0051_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_24_0051
        rs_R005_ueqv_R005NYN_generator_24_0000_0052 =
      rs_R005_ueqv_R005NYN_partial_24_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 24. -/
def rs_R005_ueqv_R005NYN_coefficient_24_0052 : Poly :=
[
  term ((-4166088 : Rat) / 385571) [(15, 2), (16, 1)]
]

/-- Partial product 52 for generator 24. -/
def rs_R005_ueqv_R005NYN_partial_24_0052 : Poly :=
[
  term ((8332176 : Rat) / 385571) [(0, 1), (10, 1), (15, 2), (16, 1)],
  term ((-4166088 : Rat) / 385571) [(0, 2), (15, 2), (16, 1)],
  term ((8332176 : Rat) / 385571) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term ((-4166088 : Rat) / 385571) [(1, 2), (15, 2), (16, 1)],
  term ((-8332176 : Rat) / 385571) [(10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-8332176 : Rat) / 385571) [(11, 1), (15, 3), (16, 1)],
  term ((4166088 : Rat) / 385571) [(14, 2), (15, 2), (16, 1)],
  term ((4166088 : Rat) / 385571) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 24. -/
theorem rs_R005_ueqv_R005NYN_partial_24_0052_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_24_0052
        rs_R005_ueqv_R005NYN_generator_24_0000_0052 =
      rs_R005_ueqv_R005NYN_partial_24_0052 := by
  native_decide

/-- Partial products in this block. -/
def rs_R005_ueqv_R005NYN_partials_24_0000_0052 : List Poly :=
[
  rs_R005_ueqv_R005NYN_partial_24_0000,
  rs_R005_ueqv_R005NYN_partial_24_0001,
  rs_R005_ueqv_R005NYN_partial_24_0002,
  rs_R005_ueqv_R005NYN_partial_24_0003,
  rs_R005_ueqv_R005NYN_partial_24_0004,
  rs_R005_ueqv_R005NYN_partial_24_0005,
  rs_R005_ueqv_R005NYN_partial_24_0006,
  rs_R005_ueqv_R005NYN_partial_24_0007,
  rs_R005_ueqv_R005NYN_partial_24_0008,
  rs_R005_ueqv_R005NYN_partial_24_0009,
  rs_R005_ueqv_R005NYN_partial_24_0010,
  rs_R005_ueqv_R005NYN_partial_24_0011,
  rs_R005_ueqv_R005NYN_partial_24_0012,
  rs_R005_ueqv_R005NYN_partial_24_0013,
  rs_R005_ueqv_R005NYN_partial_24_0014,
  rs_R005_ueqv_R005NYN_partial_24_0015,
  rs_R005_ueqv_R005NYN_partial_24_0016,
  rs_R005_ueqv_R005NYN_partial_24_0017,
  rs_R005_ueqv_R005NYN_partial_24_0018,
  rs_R005_ueqv_R005NYN_partial_24_0019,
  rs_R005_ueqv_R005NYN_partial_24_0020,
  rs_R005_ueqv_R005NYN_partial_24_0021,
  rs_R005_ueqv_R005NYN_partial_24_0022,
  rs_R005_ueqv_R005NYN_partial_24_0023,
  rs_R005_ueqv_R005NYN_partial_24_0024,
  rs_R005_ueqv_R005NYN_partial_24_0025,
  rs_R005_ueqv_R005NYN_partial_24_0026,
  rs_R005_ueqv_R005NYN_partial_24_0027,
  rs_R005_ueqv_R005NYN_partial_24_0028,
  rs_R005_ueqv_R005NYN_partial_24_0029,
  rs_R005_ueqv_R005NYN_partial_24_0030,
  rs_R005_ueqv_R005NYN_partial_24_0031,
  rs_R005_ueqv_R005NYN_partial_24_0032,
  rs_R005_ueqv_R005NYN_partial_24_0033,
  rs_R005_ueqv_R005NYN_partial_24_0034,
  rs_R005_ueqv_R005NYN_partial_24_0035,
  rs_R005_ueqv_R005NYN_partial_24_0036,
  rs_R005_ueqv_R005NYN_partial_24_0037,
  rs_R005_ueqv_R005NYN_partial_24_0038,
  rs_R005_ueqv_R005NYN_partial_24_0039,
  rs_R005_ueqv_R005NYN_partial_24_0040,
  rs_R005_ueqv_R005NYN_partial_24_0041,
  rs_R005_ueqv_R005NYN_partial_24_0042,
  rs_R005_ueqv_R005NYN_partial_24_0043,
  rs_R005_ueqv_R005NYN_partial_24_0044,
  rs_R005_ueqv_R005NYN_partial_24_0045,
  rs_R005_ueqv_R005NYN_partial_24_0046,
  rs_R005_ueqv_R005NYN_partial_24_0047,
  rs_R005_ueqv_R005NYN_partial_24_0048,
  rs_R005_ueqv_R005NYN_partial_24_0049,
  rs_R005_ueqv_R005NYN_partial_24_0050,
  rs_R005_ueqv_R005NYN_partial_24_0051,
  rs_R005_ueqv_R005NYN_partial_24_0052
]

/-- Sum of partial products in this block. -/
def rs_R005_ueqv_R005NYN_block_24_0000_0052 : Poly :=
[
  term ((5324800 : Rat) / 158397) [(0, 1), (1, 1), (3, 1), (4, 1), (11, 1), (15, 1)],
  term ((10780160 : Rat) / 385571) [(0, 1), (1, 1), (3, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((1064960 : Rat) / 158397) [(0, 1), (1, 1), (3, 1), (8, 1), (11, 1), (15, 1)],
  term ((2156032 : Rat) / 385571) [(0, 1), (1, 1), (3, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-5888 : Rat) / 4281) [(0, 1), (1, 1), (3, 1), (11, 1), (15, 1)],
  term ((-32549344 : Rat) / 385571) [(0, 1), (1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2662400 : Rat) / 158397) [(0, 1), (1, 1), (4, 1), (11, 1), (15, 2)],
  term ((-5390080 : Rat) / 385571) [(0, 1), (1, 1), (4, 1), (11, 1), (15, 2), (16, 1)],
  term ((266240 : Rat) / 158397) [(0, 1), (1, 1), (5, 1), (11, 1), (15, 1)],
  term ((539008 : Rat) / 385571) [(0, 1), (1, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-10649600 : Rat) / 158397) [(0, 1), (1, 1), (8, 1), (10, 1), (15, 1)],
  term ((-21560320 : Rat) / 385571) [(0, 1), (1, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-532480 : Rat) / 158397) [(0, 1), (1, 1), (8, 1), (11, 1), (15, 2)],
  term ((-1078016 : Rat) / 385571) [(0, 1), (1, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-266240 : Rat) / 52799) [(0, 1), (1, 1), (9, 1), (11, 1), (15, 1)],
  term ((-1617024 : Rat) / 385571) [(0, 1), (1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-4259840 : Rat) / 158397) [(0, 1), (1, 1), (9, 2), (10, 1), (15, 1)],
  term ((-8624128 : Rat) / 385571) [(0, 1), (1, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-1731840 : Rat) / 52799) [(0, 1), (1, 1), (10, 1), (15, 1)],
  term ((40363560 : Rat) / 385571) [(0, 1), (1, 1), (10, 1), (15, 1), (16, 1)],
  term ((-3485312 : Rat) / 158397) [(0, 1), (1, 1), (11, 1), (15, 2)],
  term ((8998064 : Rat) / 385571) [(0, 1), (1, 1), (11, 1), (15, 2), (16, 1)],
  term ((-2662400 : Rat) / 158397) [(0, 1), (1, 2), (3, 1), (4, 1), (15, 1)],
  term ((-5390080 : Rat) / 385571) [(0, 1), (1, 2), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((-532480 : Rat) / 158397) [(0, 1), (1, 2), (3, 1), (8, 1), (15, 1)],
  term ((-1078016 : Rat) / 385571) [(0, 1), (1, 2), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((2944 : Rat) / 4281) [(0, 1), (1, 2), (3, 1), (15, 1)],
  term ((16274672 : Rat) / 385571) [(0, 1), (1, 2), (3, 1), (15, 1), (16, 1)],
  term ((1331200 : Rat) / 158397) [(0, 1), (1, 2), (4, 1), (15, 2)],
  term ((2695040 : Rat) / 385571) [(0, 1), (1, 2), (4, 1), (15, 2), (16, 1)],
  term ((-133120 : Rat) / 158397) [(0, 1), (1, 2), (5, 1), (15, 1)],
  term ((-269504 : Rat) / 385571) [(0, 1), (1, 2), (5, 1), (15, 1), (16, 1)],
  term ((266240 : Rat) / 158397) [(0, 1), (1, 2), (8, 1), (15, 2)],
  term ((539008 : Rat) / 385571) [(0, 1), (1, 2), (8, 1), (15, 2), (16, 1)],
  term ((133120 : Rat) / 52799) [(0, 1), (1, 2), (9, 1), (15, 1)],
  term ((808512 : Rat) / 385571) [(0, 1), (1, 2), (9, 1), (15, 1), (16, 1)],
  term ((1742656 : Rat) / 158397) [(0, 1), (1, 2), (15, 2)],
  term ((-4499032 : Rat) / 385571) [(0, 1), (1, 2), (15, 2), (16, 1)],
  term ((-5324800 : Rat) / 158397) [(0, 1), (3, 1), (4, 1), (10, 1), (14, 1), (15, 1)],
  term ((-10780160 : Rat) / 385571) [(0, 1), (3, 1), (4, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11416576 : Rat) / 158397) [(0, 1), (3, 1), (4, 1), (10, 1), (15, 1)],
  term ((65160352 : Rat) / 385571) [(0, 1), (3, 1), (4, 1), (10, 1), (15, 1), (16, 1)],
  term ((-5324800 : Rat) / 158397) [(0, 1), (3, 1), (4, 1), (11, 1), (15, 2)],
  term ((-10780160 : Rat) / 385571) [(0, 1), (3, 1), (4, 1), (11, 1), (15, 2), (16, 1)],
  term ((2662400 : Rat) / 158397) [(0, 1), (3, 1), (4, 1), (14, 2), (15, 1)],
  term ((5390080 : Rat) / 385571) [(0, 1), (3, 1), (4, 1), (14, 2), (15, 1), (16, 1)],
  term ((2662400 : Rat) / 158397) [(0, 1), (3, 1), (4, 1), (15, 3)],
  term ((5390080 : Rat) / 385571) [(0, 1), (3, 1), (4, 1), (15, 3), (16, 1)],
  term ((-1064960 : Rat) / 158397) [(0, 1), (3, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((-2156032 : Rat) / 385571) [(0, 1), (3, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1802240 : Rat) / 158397) [(0, 1), (3, 1), (8, 1), (10, 1), (15, 1)],
  term ((33781760 : Rat) / 385571) [(0, 1), (3, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1064960 : Rat) / 158397) [(0, 1), (3, 1), (8, 1), (11, 1), (15, 2)],
  term ((-2156032 : Rat) / 385571) [(0, 1), (3, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((532480 : Rat) / 158397) [(0, 1), (3, 1), (8, 1), (14, 2), (15, 1)],
  term ((1078016 : Rat) / 385571) [(0, 1), (3, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((532480 : Rat) / 158397) [(0, 1), (3, 1), (8, 1), (15, 3)],
  term ((1078016 : Rat) / 385571) [(0, 1), (3, 1), (8, 1), (15, 3), (16, 1)],
  term ((5888 : Rat) / 4281) [(0, 1), (3, 1), (10, 1), (14, 1), (15, 1)],
  term ((32549344 : Rat) / 385571) [(0, 1), (3, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((1644160 : Rat) / 158397) [(0, 1), (3, 1), (10, 1), (15, 1)],
  term ((-18262096 : Rat) / 385571) [(0, 1), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-3112960 : Rat) / 158397) [(0, 1), (3, 1), (10, 2), (15, 1)],
  term ((3055360 : Rat) / 385571) [(0, 1), (3, 1), (10, 2), (15, 1), (16, 1)],
  term ((5888 : Rat) / 4281) [(0, 1), (3, 1), (11, 1), (15, 2)],
  term ((32549344 : Rat) / 385571) [(0, 1), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((-2944 : Rat) / 4281) [(0, 1), (3, 1), (14, 2), (15, 1)],
  term ((-16274672 : Rat) / 385571) [(0, 1), (3, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2944 : Rat) / 4281) [(0, 1), (3, 1), (15, 3)],
  term ((-16274672 : Rat) / 385571) [(0, 1), (3, 1), (15, 3), (16, 1)],
  term ((2662400 : Rat) / 158397) [(0, 1), (4, 1), (10, 1), (14, 1), (15, 2)],
  term ((5390080 : Rat) / 385571) [(0, 1), (4, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((10377728 : Rat) / 158397) [(0, 1), (4, 1), (10, 1), (15, 2)],
  term ((-37163216 : Rat) / 385571) [(0, 1), (4, 1), (10, 1), (15, 2), (16, 1)],
  term ((2662400 : Rat) / 158397) [(0, 1), (4, 1), (11, 1), (15, 3)],
  term ((5390080 : Rat) / 385571) [(0, 1), (4, 1), (11, 1), (15, 3), (16, 1)],
  term ((-1331200 : Rat) / 158397) [(0, 1), (4, 1), (14, 2), (15, 2)],
  term ((-2695040 : Rat) / 385571) [(0, 1), (4, 1), (14, 2), (15, 2), (16, 1)],
  term ((-1331200 : Rat) / 158397) [(0, 1), (4, 1), (15, 4)],
  term ((-2695040 : Rat) / 385571) [(0, 1), (4, 1), (15, 4), (16, 1)],
  term ((-266240 : Rat) / 158397) [(0, 1), (5, 1), (10, 1), (14, 1), (15, 1)],
  term ((-539008 : Rat) / 385571) [(0, 1), (5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((6516160 : Rat) / 158397) [(0, 1), (5, 1), (10, 1), (15, 1)],
  term ((-30501112 : Rat) / 385571) [(0, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-266240 : Rat) / 158397) [(0, 1), (5, 1), (11, 1), (15, 2)],
  term ((-539008 : Rat) / 385571) [(0, 1), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((133120 : Rat) / 158397) [(0, 1), (5, 1), (14, 2), (15, 1)],
  term ((269504 : Rat) / 385571) [(0, 1), (5, 1), (14, 2), (15, 1), (16, 1)],
  term ((133120 : Rat) / 158397) [(0, 1), (5, 1), (15, 3)],
  term ((269504 : Rat) / 385571) [(0, 1), (5, 1), (15, 3), (16, 1)],
  term ((1556480 : Rat) / 52799) [(0, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((-4583040 : Rat) / 385571) [(0, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-3112960 : Rat) / 52799) [(0, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((9166080 : Rat) / 385571) [(0, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((532480 : Rat) / 158397) [(0, 1), (8, 1), (10, 1), (14, 1), (15, 2)],
  term ((1078016 : Rat) / 385571) [(0, 1), (8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((1556480 : Rat) / 158397) [(0, 1), (8, 1), (10, 1), (15, 2)],
  term ((-1527680 : Rat) / 385571) [(0, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((532480 : Rat) / 158397) [(0, 1), (8, 1), (11, 1), (15, 3)],
  term ((1078016 : Rat) / 385571) [(0, 1), (8, 1), (11, 1), (15, 3), (16, 1)],
  term ((-266240 : Rat) / 158397) [(0, 1), (8, 1), (14, 2), (15, 2)],
  term ((-539008 : Rat) / 385571) [(0, 1), (8, 1), (14, 2), (15, 2), (16, 1)],
  term ((-266240 : Rat) / 158397) [(0, 1), (8, 1), (15, 4)],
  term ((-539008 : Rat) / 385571) [(0, 1), (8, 1), (15, 4), (16, 1)],
  term ((266240 : Rat) / 52799) [(0, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((1617024 : Rat) / 385571) [(0, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((1876864 : Rat) / 158397) [(0, 1), (9, 1), (10, 1), (15, 1)],
  term ((-966784 : Rat) / 385571) [(0, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((3112960 : Rat) / 52799) [(0, 1), (9, 1), (10, 2), (15, 1)],
  term ((-9166080 : Rat) / 385571) [(0, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((266240 : Rat) / 52799) [(0, 1), (9, 1), (11, 1), (15, 2)],
  term ((1617024 : Rat) / 385571) [(0, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-133120 : Rat) / 52799) [(0, 1), (9, 1), (14, 2), (15, 1)],
  term ((-808512 : Rat) / 385571) [(0, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-133120 : Rat) / 52799) [(0, 1), (9, 1), (15, 3)],
  term ((-808512 : Rat) / 385571) [(0, 1), (9, 1), (15, 3), (16, 1)],
  term ((2129920 : Rat) / 158397) [(0, 1), (9, 2), (10, 1), (15, 2)],
  term ((4312064 : Rat) / 385571) [(0, 1), (9, 2), (10, 1), (15, 2), (16, 1)],
  term (-8 : Rat) [(0, 1), (10, 1)],
  term ((3112960 : Rat) / 52799) [(0, 1), (10, 1), (11, 1), (15, 1)],
  term ((-9166080 : Rat) / 385571) [(0, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((3485312 : Rat) / 158397) [(0, 1), (10, 1), (14, 1), (15, 2)],
  term ((-8998064 : Rat) / 385571) [(0, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((1134752 : Rat) / 52799) [(0, 1), (10, 1), (15, 2)],
  term ((8332176 : Rat) / 385571) [(0, 1), (10, 1), (15, 2), (16, 1)],
  term ((1556480 : Rat) / 158397) [(0, 1), (10, 2), (15, 2)],
  term ((-1527680 : Rat) / 385571) [(0, 1), (10, 2), (15, 2), (16, 1)],
  term ((3485312 : Rat) / 158397) [(0, 1), (11, 1), (15, 3)],
  term ((-8998064 : Rat) / 385571) [(0, 1), (11, 1), (15, 3), (16, 1)],
  term ((-1742656 : Rat) / 158397) [(0, 1), (14, 2), (15, 2)],
  term ((4499032 : Rat) / 385571) [(0, 1), (14, 2), (15, 2), (16, 1)],
  term ((-1742656 : Rat) / 158397) [(0, 1), (15, 4)],
  term ((4499032 : Rat) / 385571) [(0, 1), (15, 4), (16, 1)],
  term (4 : Rat) [(0, 2)],
  term ((5324800 : Rat) / 158397) [(0, 2), (1, 1), (8, 1), (15, 1)],
  term ((10780160 : Rat) / 385571) [(0, 2), (1, 1), (8, 1), (15, 1), (16, 1)],
  term ((2129920 : Rat) / 158397) [(0, 2), (1, 1), (9, 2), (15, 1)],
  term ((4312064 : Rat) / 385571) [(0, 2), (1, 1), (9, 2), (15, 1), (16, 1)],
  term ((865920 : Rat) / 52799) [(0, 2), (1, 1), (15, 1)],
  term ((-20181780 : Rat) / 385571) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term ((5324800 : Rat) / 158397) [(0, 2), (3, 1), (4, 1), (10, 1), (15, 1)],
  term ((10780160 : Rat) / 385571) [(0, 2), (3, 1), (4, 1), (10, 1), (15, 1), (16, 1)],
  term ((5708288 : Rat) / 158397) [(0, 2), (3, 1), (4, 1), (15, 1)],
  term ((-32580176 : Rat) / 385571) [(0, 2), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((1064960 : Rat) / 158397) [(0, 2), (3, 1), (8, 1), (10, 1), (15, 1)],
  term ((2156032 : Rat) / 385571) [(0, 2), (3, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((901120 : Rat) / 158397) [(0, 2), (3, 1), (8, 1), (15, 1)],
  term ((-16890880 : Rat) / 385571) [(0, 2), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((446208 : Rat) / 52799) [(0, 2), (3, 1), (10, 1), (15, 1)],
  term ((-34077024 : Rat) / 385571) [(0, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-822080 : Rat) / 158397) [(0, 2), (3, 1), (15, 1)],
  term ((9131048 : Rat) / 385571) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((-2662400 : Rat) / 158397) [(0, 2), (4, 1), (10, 1), (15, 2)],
  term ((-5390080 : Rat) / 385571) [(0, 2), (4, 1), (10, 1), (15, 2), (16, 1)],
  term ((-5188864 : Rat) / 158397) [(0, 2), (4, 1), (15, 2)],
  term ((18581608 : Rat) / 385571) [(0, 2), (4, 1), (15, 2), (16, 1)],
  term ((266240 : Rat) / 158397) [(0, 2), (5, 1), (10, 1), (15, 1)],
  term ((539008 : Rat) / 385571) [(0, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-3258080 : Rat) / 158397) [(0, 2), (5, 1), (15, 1)],
  term ((15250556 : Rat) / 385571) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((-778240 : Rat) / 52799) [(0, 2), (8, 1), (9, 1), (15, 1)],
  term ((2291520 : Rat) / 385571) [(0, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-532480 : Rat) / 158397) [(0, 2), (8, 1), (10, 1), (15, 2)],
  term ((-1078016 : Rat) / 385571) [(0, 2), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((1556480 : Rat) / 52799) [(0, 2), (8, 1), (11, 1), (15, 1)],
  term ((-4583040 : Rat) / 385571) [(0, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-778240 : Rat) / 158397) [(0, 2), (8, 1), (15, 2)],
  term ((763840 : Rat) / 385571) [(0, 2), (8, 1), (15, 2), (16, 1)],
  term ((-1822720 : Rat) / 52799) [(0, 2), (9, 1), (10, 1), (15, 1)],
  term ((2966016 : Rat) / 385571) [(0, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-938432 : Rat) / 158397) [(0, 2), (9, 1), (15, 1)],
  term ((483392 : Rat) / 385571) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((-1064960 : Rat) / 158397) [(0, 2), (9, 2), (15, 2)],
  term ((-2156032 : Rat) / 385571) [(0, 2), (9, 2), (15, 2), (16, 1)],
  term ((-1421184 : Rat) / 52799) [(0, 2), (10, 1), (15, 2)],
  term ((9761904 : Rat) / 385571) [(0, 2), (10, 1), (15, 2), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(0, 2), (11, 1), (15, 1)],
  term ((4583040 : Rat) / 385571) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((-567376 : Rat) / 52799) [(0, 2), (15, 2)],
  term ((-4166088 : Rat) / 385571) [(0, 2), (15, 2), (16, 1)],
  term ((-2662400 : Rat) / 158397) [(0, 3), (3, 1), (4, 1), (15, 1)],
  term ((-5390080 : Rat) / 385571) [(0, 3), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((-532480 : Rat) / 158397) [(0, 3), (3, 1), (8, 1), (15, 1)],
  term ((-1078016 : Rat) / 385571) [(0, 3), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((2944 : Rat) / 4281) [(0, 3), (3, 1), (15, 1)],
  term ((16274672 : Rat) / 385571) [(0, 3), (3, 1), (15, 1), (16, 1)],
  term ((1331200 : Rat) / 158397) [(0, 3), (4, 1), (15, 2)],
  term ((2695040 : Rat) / 385571) [(0, 3), (4, 1), (15, 2), (16, 1)],
  term ((-133120 : Rat) / 158397) [(0, 3), (5, 1), (15, 1)],
  term ((-269504 : Rat) / 385571) [(0, 3), (5, 1), (15, 1), (16, 1)],
  term ((266240 : Rat) / 158397) [(0, 3), (8, 1), (15, 2)],
  term ((539008 : Rat) / 385571) [(0, 3), (8, 1), (15, 2), (16, 1)],
  term ((133120 : Rat) / 52799) [(0, 3), (9, 1), (15, 1)],
  term ((808512 : Rat) / 385571) [(0, 3), (9, 1), (15, 1), (16, 1)],
  term ((1742656 : Rat) / 158397) [(0, 3), (15, 2)],
  term ((-4499032 : Rat) / 385571) [(0, 3), (15, 2), (16, 1)],
  term ((-11416576 : Rat) / 158397) [(1, 1), (3, 1), (4, 1), (11, 1), (15, 1)],
  term ((65160352 : Rat) / 385571) [(1, 1), (3, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1802240 : Rat) / 158397) [(1, 1), (3, 1), (8, 1), (11, 1), (15, 1)],
  term ((33781760 : Rat) / 385571) [(1, 1), (3, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3112960 : Rat) / 158397) [(1, 1), (3, 1), (10, 1), (11, 1), (15, 1)],
  term ((3055360 : Rat) / 385571) [(1, 1), (3, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((1644160 : Rat) / 158397) [(1, 1), (3, 1), (11, 1), (15, 1)],
  term ((-18262096 : Rat) / 385571) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((10377728 : Rat) / 158397) [(1, 1), (4, 1), (11, 1), (15, 2)],
  term ((-37163216 : Rat) / 385571) [(1, 1), (4, 1), (11, 1), (15, 2), (16, 1)],
  term ((6516160 : Rat) / 158397) [(1, 1), (5, 1), (11, 1), (15, 1)],
  term ((-30501112 : Rat) / 385571) [(1, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((1556480 : Rat) / 52799) [(1, 1), (8, 1), (9, 1), (11, 1), (15, 1)],
  term ((-4583040 : Rat) / 385571) [(1, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((10649600 : Rat) / 158397) [(1, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((21560320 : Rat) / 385571) [(1, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((12206080 : Rat) / 158397) [(1, 1), (8, 1), (11, 1), (15, 2)],
  term ((20032640 : Rat) / 385571) [(1, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-3112960 : Rat) / 52799) [(1, 1), (8, 1), (11, 2), (15, 1)],
  term ((9166080 : Rat) / 385571) [(1, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((-5324800 : Rat) / 158397) [(1, 1), (8, 1), (14, 2), (15, 1)],
  term ((-10780160 : Rat) / 385571) [(1, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((-5324800 : Rat) / 158397) [(1, 1), (8, 1), (15, 3)],
  term ((-10780160 : Rat) / 385571) [(1, 1), (8, 1), (15, 3), (16, 1)],
  term ((3112960 : Rat) / 52799) [(1, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((-9166080 : Rat) / 385571) [(1, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((1876864 : Rat) / 158397) [(1, 1), (9, 1), (11, 1), (15, 1)],
  term ((-966784 : Rat) / 385571) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((4259840 : Rat) / 158397) [(1, 1), (9, 2), (10, 1), (14, 1), (15, 1)],
  term ((8624128 : Rat) / 385571) [(1, 1), (9, 2), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((2129920 : Rat) / 52799) [(1, 1), (9, 2), (11, 1), (15, 2)],
  term ((12936192 : Rat) / 385571) [(1, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((-2129920 : Rat) / 158397) [(1, 1), (9, 2), (14, 2), (15, 1)],
  term ((-4312064 : Rat) / 385571) [(1, 1), (9, 2), (14, 2), (15, 1), (16, 1)],
  term ((-2129920 : Rat) / 158397) [(1, 1), (9, 2), (15, 3)],
  term ((-4312064 : Rat) / 385571) [(1, 1), (9, 2), (15, 3), (16, 1)],
  term ((1556480 : Rat) / 158397) [(1, 1), (10, 1), (11, 1), (15, 2)],
  term ((-1527680 : Rat) / 385571) [(1, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((1731840 : Rat) / 52799) [(1, 1), (10, 1), (14, 1), (15, 1)],
  term ((-40363560 : Rat) / 385571) [(1, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(1, 1), (11, 1)],
  term ((2866592 : Rat) / 52799) [(1, 1), (11, 1), (15, 2)],
  term ((-32031384 : Rat) / 385571) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term ((3112960 : Rat) / 52799) [(1, 1), (11, 2), (15, 1)],
  term ((-9166080 : Rat) / 385571) [(1, 1), (11, 2), (15, 1), (16, 1)],
  term ((-865920 : Rat) / 52799) [(1, 1), (14, 2), (15, 1)],
  term ((20181780 : Rat) / 385571) [(1, 1), (14, 2), (15, 1), (16, 1)],
  term ((-865920 : Rat) / 52799) [(1, 1), (15, 3)],
  term ((20181780 : Rat) / 385571) [(1, 1), (15, 3), (16, 1)],
  term (4 : Rat) [(1, 2)],
  term ((5708288 : Rat) / 158397) [(1, 2), (3, 1), (4, 1), (15, 1)],
  term ((-32580176 : Rat) / 385571) [(1, 2), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((901120 : Rat) / 158397) [(1, 2), (3, 1), (8, 1), (15, 1)],
  term ((-16890880 : Rat) / 385571) [(1, 2), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((1556480 : Rat) / 158397) [(1, 2), (3, 1), (10, 1), (15, 1)],
  term ((-1527680 : Rat) / 385571) [(1, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-822080 : Rat) / 158397) [(1, 2), (3, 1), (15, 1)],
  term ((9131048 : Rat) / 385571) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((-5188864 : Rat) / 158397) [(1, 2), (4, 1), (15, 2)],
  term ((18581608 : Rat) / 385571) [(1, 2), (4, 1), (15, 2), (16, 1)],
  term ((-3258080 : Rat) / 158397) [(1, 2), (5, 1), (15, 1)],
  term ((15250556 : Rat) / 385571) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((-778240 : Rat) / 52799) [(1, 2), (8, 1), (9, 1), (15, 1)],
  term ((2291520 : Rat) / 385571) [(1, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-5980160 : Rat) / 158397) [(1, 2), (8, 1), (11, 1), (15, 1)],
  term ((-26143360 : Rat) / 385571) [(1, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-778240 : Rat) / 158397) [(1, 2), (8, 1), (15, 2)],
  term ((763840 : Rat) / 385571) [(1, 2), (8, 1), (15, 2), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(1, 2), (9, 1), (10, 1), (15, 1)],
  term ((4583040 : Rat) / 385571) [(1, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-938432 : Rat) / 158397) [(1, 2), (9, 1), (15, 1)],
  term ((483392 : Rat) / 385571) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((-4259840 : Rat) / 158397) [(1, 2), (9, 2), (11, 1), (15, 1)],
  term ((-8624128 : Rat) / 385571) [(1, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1064960 : Rat) / 158397) [(1, 2), (9, 2), (15, 2)],
  term ((-2156032 : Rat) / 385571) [(1, 2), (9, 2), (15, 2), (16, 1)],
  term ((-778240 : Rat) / 158397) [(1, 2), (10, 1), (15, 2)],
  term ((763840 : Rat) / 385571) [(1, 2), (10, 1), (15, 2), (16, 1)],
  term ((-3288320 : Rat) / 52799) [(1, 2), (11, 1), (15, 1)],
  term ((44946600 : Rat) / 385571) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-567376 : Rat) / 52799) [(1, 2), (15, 2)],
  term ((-4166088 : Rat) / 385571) [(1, 2), (15, 2), (16, 1)],
  term ((5324800 : Rat) / 158397) [(1, 3), (8, 1), (15, 1)],
  term ((10780160 : Rat) / 385571) [(1, 3), (8, 1), (15, 1), (16, 1)],
  term ((2129920 : Rat) / 158397) [(1, 3), (9, 2), (15, 1)],
  term ((4312064 : Rat) / 385571) [(1, 3), (9, 2), (15, 1), (16, 1)],
  term ((865920 : Rat) / 52799) [(1, 3), (15, 1)],
  term ((-20181780 : Rat) / 385571) [(1, 3), (15, 1), (16, 1)],
  term ((11416576 : Rat) / 158397) [(3, 1), (4, 1), (10, 1), (14, 1), (15, 1)],
  term ((-65160352 : Rat) / 385571) [(3, 1), (4, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((11416576 : Rat) / 158397) [(3, 1), (4, 1), (11, 1), (15, 2)],
  term ((-65160352 : Rat) / 385571) [(3, 1), (4, 1), (11, 1), (15, 2), (16, 1)],
  term ((-5708288 : Rat) / 158397) [(3, 1), (4, 1), (14, 2), (15, 1)],
  term ((32580176 : Rat) / 385571) [(3, 1), (4, 1), (14, 2), (15, 1), (16, 1)],
  term ((-5708288 : Rat) / 158397) [(3, 1), (4, 1), (15, 3)],
  term ((32580176 : Rat) / 385571) [(3, 1), (4, 1), (15, 3), (16, 1)],
  term ((1802240 : Rat) / 158397) [(3, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((-33781760 : Rat) / 385571) [(3, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((1802240 : Rat) / 158397) [(3, 1), (8, 1), (11, 1), (15, 2)],
  term ((-33781760 : Rat) / 385571) [(3, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-901120 : Rat) / 158397) [(3, 1), (8, 1), (14, 2), (15, 1)],
  term ((16890880 : Rat) / 385571) [(3, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((-901120 : Rat) / 158397) [(3, 1), (8, 1), (15, 3)],
  term ((16890880 : Rat) / 385571) [(3, 1), (8, 1), (15, 3), (16, 1)],
  term ((3112960 : Rat) / 158397) [(3, 1), (10, 1), (11, 1), (15, 2)],
  term ((-3055360 : Rat) / 385571) [(3, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1644160 : Rat) / 158397) [(3, 1), (10, 1), (14, 1), (15, 1)],
  term ((18262096 : Rat) / 385571) [(3, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1556480 : Rat) / 158397) [(3, 1), (10, 1), (14, 2), (15, 1)],
  term ((1527680 : Rat) / 385571) [(3, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1556480 : Rat) / 158397) [(3, 1), (10, 1), (15, 3)],
  term ((1527680 : Rat) / 385571) [(3, 1), (10, 1), (15, 3), (16, 1)],
  term ((3112960 : Rat) / 158397) [(3, 1), (10, 2), (14, 1), (15, 1)],
  term ((-3055360 : Rat) / 385571) [(3, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1644160 : Rat) / 158397) [(3, 1), (11, 1), (15, 2)],
  term ((18262096 : Rat) / 385571) [(3, 1), (11, 1), (15, 2), (16, 1)],
  term ((822080 : Rat) / 158397) [(3, 1), (14, 2), (15, 1)],
  term ((-9131048 : Rat) / 385571) [(3, 1), (14, 2), (15, 1), (16, 1)],
  term ((822080 : Rat) / 158397) [(3, 1), (15, 3)],
  term ((-9131048 : Rat) / 385571) [(3, 1), (15, 3), (16, 1)],
  term ((-10377728 : Rat) / 158397) [(4, 1), (10, 1), (14, 1), (15, 2)],
  term ((37163216 : Rat) / 385571) [(4, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-10377728 : Rat) / 158397) [(4, 1), (11, 1), (15, 3)],
  term ((37163216 : Rat) / 385571) [(4, 1), (11, 1), (15, 3), (16, 1)],
  term ((5188864 : Rat) / 158397) [(4, 1), (14, 2), (15, 2)],
  term ((-18581608 : Rat) / 385571) [(4, 1), (14, 2), (15, 2), (16, 1)],
  term ((5188864 : Rat) / 158397) [(4, 1), (15, 4)],
  term ((-18581608 : Rat) / 385571) [(4, 1), (15, 4), (16, 1)],
  term ((-6516160 : Rat) / 158397) [(5, 1), (10, 1), (14, 1), (15, 1)],
  term ((30501112 : Rat) / 385571) [(5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6516160 : Rat) / 158397) [(5, 1), (11, 1), (15, 2)],
  term ((30501112 : Rat) / 385571) [(5, 1), (11, 1), (15, 2), (16, 1)],
  term ((3258080 : Rat) / 158397) [(5, 1), (14, 2), (15, 1)],
  term ((-15250556 : Rat) / 385571) [(5, 1), (14, 2), (15, 1), (16, 1)],
  term ((3258080 : Rat) / 158397) [(5, 1), (15, 3)],
  term ((-15250556 : Rat) / 385571) [(5, 1), (15, 3), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(8, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((4583040 : Rat) / 385571) [(8, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(8, 1), (9, 1), (11, 1), (15, 2)],
  term ((4583040 : Rat) / 385571) [(8, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((778240 : Rat) / 52799) [(8, 1), (9, 1), (14, 2), (15, 1)],
  term ((-2291520 : Rat) / 385571) [(8, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((778240 : Rat) / 52799) [(8, 1), (9, 1), (15, 3)],
  term ((-2291520 : Rat) / 385571) [(8, 1), (9, 1), (15, 3), (16, 1)],
  term ((3112960 : Rat) / 52799) [(8, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-9166080 : Rat) / 385571) [(8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1556480 : Rat) / 158397) [(8, 1), (10, 1), (14, 1), (15, 2)],
  term ((1527680 : Rat) / 385571) [(8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(8, 1), (11, 1), (14, 2), (15, 1)],
  term ((4583040 : Rat) / 385571) [(8, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-6225920 : Rat) / 158397) [(8, 1), (11, 1), (15, 3)],
  term ((6110720 : Rat) / 385571) [(8, 1), (11, 1), (15, 3), (16, 1)],
  term ((3112960 : Rat) / 52799) [(8, 1), (11, 2), (15, 2)],
  term ((-9166080 : Rat) / 385571) [(8, 1), (11, 2), (15, 2), (16, 1)],
  term ((778240 : Rat) / 158397) [(8, 1), (14, 2), (15, 2)],
  term ((-763840 : Rat) / 385571) [(8, 1), (14, 2), (15, 2), (16, 1)],
  term ((778240 : Rat) / 158397) [(8, 1), (15, 4)],
  term ((-763840 : Rat) / 385571) [(8, 1), (15, 4), (16, 1)],
  term ((-3112960 : Rat) / 52799) [(9, 1), (10, 1), (11, 1), (15, 2)],
  term ((9166080 : Rat) / 385571) [(9, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1876864 : Rat) / 158397) [(9, 1), (10, 1), (14, 1), (15, 1)],
  term ((966784 : Rat) / 385571) [(9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((1556480 : Rat) / 52799) [(9, 1), (10, 1), (14, 2), (15, 1)],
  term ((-4583040 : Rat) / 385571) [(9, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((1556480 : Rat) / 52799) [(9, 1), (10, 1), (15, 3)],
  term ((-4583040 : Rat) / 385571) [(9, 1), (10, 1), (15, 3), (16, 1)],
  term ((-3112960 : Rat) / 52799) [(9, 1), (10, 2), (14, 1), (15, 1)],
  term ((9166080 : Rat) / 385571) [(9, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1876864 : Rat) / 158397) [(9, 1), (11, 1), (15, 2)],
  term ((966784 : Rat) / 385571) [(9, 1), (11, 1), (15, 2), (16, 1)],
  term ((938432 : Rat) / 158397) [(9, 1), (14, 2), (15, 1)],
  term ((-483392 : Rat) / 385571) [(9, 1), (14, 2), (15, 1), (16, 1)],
  term ((938432 : Rat) / 158397) [(9, 1), (15, 3)],
  term ((-483392 : Rat) / 385571) [(9, 1), (15, 3), (16, 1)],
  term ((-2129920 : Rat) / 158397) [(9, 2), (10, 1), (14, 1), (15, 2)],
  term ((-4312064 : Rat) / 385571) [(9, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2129920 : Rat) / 158397) [(9, 2), (11, 1), (15, 3)],
  term ((-4312064 : Rat) / 385571) [(9, 2), (11, 1), (15, 3), (16, 1)],
  term ((1064960 : Rat) / 158397) [(9, 2), (14, 2), (15, 2)],
  term ((2156032 : Rat) / 385571) [(9, 2), (14, 2), (15, 2), (16, 1)],
  term ((1064960 : Rat) / 158397) [(9, 2), (15, 4)],
  term ((2156032 : Rat) / 385571) [(9, 2), (15, 4), (16, 1)],
  term ((-3112960 : Rat) / 52799) [(10, 1), (11, 1), (14, 1), (15, 1)],
  term ((9166080 : Rat) / 385571) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1556480 : Rat) / 158397) [(10, 1), (11, 1), (15, 3)],
  term ((1527680 : Rat) / 385571) [(10, 1), (11, 1), (15, 3), (16, 1)],
  term (8 : Rat) [(10, 1), (14, 1)],
  term ((-1134752 : Rat) / 52799) [(10, 1), (14, 1), (15, 2)],
  term ((-8332176 : Rat) / 385571) [(10, 1), (14, 1), (15, 2), (16, 1)],
  term ((778240 : Rat) / 158397) [(10, 1), (14, 2), (15, 2)],
  term ((-763840 : Rat) / 385571) [(10, 1), (14, 2), (15, 2), (16, 1)],
  term ((778240 : Rat) / 158397) [(10, 1), (15, 4)],
  term ((-763840 : Rat) / 385571) [(10, 1), (15, 4), (16, 1)],
  term ((-1556480 : Rat) / 158397) [(10, 2), (14, 1), (15, 2)],
  term ((1527680 : Rat) / 385571) [(10, 2), (14, 1), (15, 2), (16, 1)],
  term ((1556480 : Rat) / 52799) [(11, 1), (14, 2), (15, 1)],
  term ((-4583040 : Rat) / 385571) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term (8 : Rat) [(11, 1), (15, 1)],
  term ((421728 : Rat) / 52799) [(11, 1), (15, 3)],
  term ((-12915216 : Rat) / 385571) [(11, 1), (15, 3), (16, 1)],
  term ((-3112960 : Rat) / 52799) [(11, 2), (15, 2)],
  term ((9166080 : Rat) / 385571) [(11, 2), (15, 2), (16, 1)],
  term (-4 : Rat) [(14, 2)],
  term ((567376 : Rat) / 52799) [(14, 2), (15, 2)],
  term ((4166088 : Rat) / 385571) [(14, 2), (15, 2), (16, 1)],
  term (-4 : Rat) [(15, 2)],
  term ((567376 : Rat) / 52799) [(15, 4)],
  term ((4166088 : Rat) / 385571) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 24, terms 0 through 52. -/
theorem rs_R005_ueqv_R005NYN_block_24_0000_0052_valid :
    checkProductSumEq rs_R005_ueqv_R005NYN_partials_24_0000_0052
      rs_R005_ueqv_R005NYN_block_24_0000_0052 = true := by
  native_decide

end R005UeqvR005NYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
