/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R005:u=v:R005NYN, term block 20:0-57

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R005UeqvR005NYNTermShards

/-- Generator polynomial 20 for relaxed split surplus certificate `R005:u=v:R005NYN`. -/
def rs_R005_ueqv_R005NYN_generator_20_0000_0057 : Poly :=
[
  term (-2 : Rat) [(0, 1), (8, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (9, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(2, 1), (8, 1)],
  term (-1 : Rat) [(2, 2)],
  term (2 : Rat) [(3, 1), (9, 1)],
  term (-1 : Rat) [(3, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 20. -/
def rs_R005_ueqv_R005NYN_coefficient_20_0000 : Poly :=
[
  term ((532480 : Rat) / 158397) [(0, 1), (3, 1), (4, 1), (15, 1)]
]

/-- Partial product 0 for generator 20. -/
def rs_R005_ueqv_R005NYN_partial_20_0000 : Poly :=
[
  term ((-1064960 : Rat) / 158397) [(0, 1), (1, 1), (3, 1), (4, 1), (9, 1), (15, 1)],
  term ((532480 : Rat) / 158397) [(0, 1), (1, 2), (3, 1), (4, 1), (15, 1)],
  term ((1064960 : Rat) / 158397) [(0, 1), (2, 1), (3, 1), (4, 1), (8, 1), (15, 1)],
  term ((-532480 : Rat) / 158397) [(0, 1), (2, 2), (3, 1), (4, 1), (15, 1)],
  term ((1064960 : Rat) / 158397) [(0, 1), (3, 2), (4, 1), (9, 1), (15, 1)],
  term ((-532480 : Rat) / 158397) [(0, 1), (3, 3), (4, 1), (15, 1)],
  term ((-1064960 : Rat) / 158397) [(0, 2), (3, 1), (4, 1), (8, 1), (15, 1)],
  term ((532480 : Rat) / 158397) [(0, 3), (3, 1), (4, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 20. -/
theorem rs_R005_ueqv_R005NYN_partial_20_0000_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_20_0000
        rs_R005_ueqv_R005NYN_generator_20_0000_0057 =
      rs_R005_ueqv_R005NYN_partial_20_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 20. -/
def rs_R005_ueqv_R005NYN_coefficient_20_0001 : Poly :=
[
  term ((1078016 : Rat) / 385571) [(0, 1), (3, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 1 for generator 20. -/
def rs_R005_ueqv_R005NYN_partial_20_0001 : Poly :=
[
  term ((-2156032 : Rat) / 385571) [(0, 1), (1, 1), (3, 1), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((1078016 : Rat) / 385571) [(0, 1), (1, 2), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((2156032 : Rat) / 385571) [(0, 1), (2, 1), (3, 1), (4, 1), (8, 1), (15, 1), (16, 1)],
  term ((-1078016 : Rat) / 385571) [(0, 1), (2, 2), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((2156032 : Rat) / 385571) [(0, 1), (3, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1078016 : Rat) / 385571) [(0, 1), (3, 3), (4, 1), (15, 1), (16, 1)],
  term ((-2156032 : Rat) / 385571) [(0, 2), (3, 1), (4, 1), (8, 1), (15, 1), (16, 1)],
  term ((1078016 : Rat) / 385571) [(0, 3), (3, 1), (4, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 20. -/
theorem rs_R005_ueqv_R005NYN_partial_20_0001_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_20_0001
        rs_R005_ueqv_R005NYN_generator_20_0000_0057 =
      rs_R005_ueqv_R005NYN_partial_20_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 20. -/
def rs_R005_ueqv_R005NYN_coefficient_20_0002 : Poly :=
[
  term ((532480 : Rat) / 158397) [(0, 1), (3, 1), (8, 1), (15, 1)]
]

/-- Partial product 2 for generator 20. -/
def rs_R005_ueqv_R005NYN_partial_20_0002 : Poly :=
[
  term ((-1064960 : Rat) / 158397) [(0, 1), (1, 1), (3, 1), (8, 1), (9, 1), (15, 1)],
  term ((532480 : Rat) / 158397) [(0, 1), (1, 2), (3, 1), (8, 1), (15, 1)],
  term ((1064960 : Rat) / 158397) [(0, 1), (2, 1), (3, 1), (8, 2), (15, 1)],
  term ((-532480 : Rat) / 158397) [(0, 1), (2, 2), (3, 1), (8, 1), (15, 1)],
  term ((1064960 : Rat) / 158397) [(0, 1), (3, 2), (8, 1), (9, 1), (15, 1)],
  term ((-532480 : Rat) / 158397) [(0, 1), (3, 3), (8, 1), (15, 1)],
  term ((-1064960 : Rat) / 158397) [(0, 2), (3, 1), (8, 2), (15, 1)],
  term ((532480 : Rat) / 158397) [(0, 3), (3, 1), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 20. -/
theorem rs_R005_ueqv_R005NYN_partial_20_0002_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_20_0002
        rs_R005_ueqv_R005NYN_generator_20_0000_0057 =
      rs_R005_ueqv_R005NYN_partial_20_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 20. -/
def rs_R005_ueqv_R005NYN_coefficient_20_0003 : Poly :=
[
  term ((1078016 : Rat) / 385571) [(0, 1), (3, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 3 for generator 20. -/
def rs_R005_ueqv_R005NYN_partial_20_0003 : Poly :=
[
  term ((-2156032 : Rat) / 385571) [(0, 1), (1, 1), (3, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((1078016 : Rat) / 385571) [(0, 1), (1, 2), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((2156032 : Rat) / 385571) [(0, 1), (2, 1), (3, 1), (8, 2), (15, 1), (16, 1)],
  term ((-1078016 : Rat) / 385571) [(0, 1), (2, 2), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((2156032 : Rat) / 385571) [(0, 1), (3, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1078016 : Rat) / 385571) [(0, 1), (3, 3), (8, 1), (15, 1), (16, 1)],
  term ((-2156032 : Rat) / 385571) [(0, 2), (3, 1), (8, 2), (15, 1), (16, 1)],
  term ((1078016 : Rat) / 385571) [(0, 3), (3, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 20. -/
theorem rs_R005_ueqv_R005NYN_partial_20_0003_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_20_0003
        rs_R005_ueqv_R005NYN_generator_20_0000_0057 =
      rs_R005_ueqv_R005NYN_partial_20_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 20. -/
def rs_R005_ueqv_R005NYN_coefficient_20_0004 : Poly :=
[
  term ((-1706368 : Rat) / 158397) [(0, 1), (3, 1), (15, 1)]
]

/-- Partial product 4 for generator 20. -/
def rs_R005_ueqv_R005NYN_partial_20_0004 : Poly :=
[
  term ((3412736 : Rat) / 158397) [(0, 1), (1, 1), (3, 1), (9, 1), (15, 1)],
  term ((-1706368 : Rat) / 158397) [(0, 1), (1, 2), (3, 1), (15, 1)],
  term ((-3412736 : Rat) / 158397) [(0, 1), (2, 1), (3, 1), (8, 1), (15, 1)],
  term ((1706368 : Rat) / 158397) [(0, 1), (2, 2), (3, 1), (15, 1)],
  term ((-3412736 : Rat) / 158397) [(0, 1), (3, 2), (9, 1), (15, 1)],
  term ((1706368 : Rat) / 158397) [(0, 1), (3, 3), (15, 1)],
  term ((3412736 : Rat) / 158397) [(0, 2), (3, 1), (8, 1), (15, 1)],
  term ((-1706368 : Rat) / 158397) [(0, 3), (3, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 20. -/
theorem rs_R005_ueqv_R005NYN_partial_20_0004_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_20_0004
        rs_R005_ueqv_R005NYN_generator_20_0000_0057 =
      rs_R005_ueqv_R005NYN_partial_20_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 20. -/
def rs_R005_ueqv_R005NYN_coefficient_20_0005 : Poly :=
[
  term ((-19508720 : Rat) / 385571) [(0, 1), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 5 for generator 20. -/
def rs_R005_ueqv_R005NYN_partial_20_0005 : Poly :=
[
  term ((39017440 : Rat) / 385571) [(0, 1), (1, 1), (3, 1), (9, 1), (15, 1), (16, 1)],
  term ((-19508720 : Rat) / 385571) [(0, 1), (1, 2), (3, 1), (15, 1), (16, 1)],
  term ((-39017440 : Rat) / 385571) [(0, 1), (2, 1), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((19508720 : Rat) / 385571) [(0, 1), (2, 2), (3, 1), (15, 1), (16, 1)],
  term ((-39017440 : Rat) / 385571) [(0, 1), (3, 2), (9, 1), (15, 1), (16, 1)],
  term ((19508720 : Rat) / 385571) [(0, 1), (3, 3), (15, 1), (16, 1)],
  term ((39017440 : Rat) / 385571) [(0, 2), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((-19508720 : Rat) / 385571) [(0, 3), (3, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 20. -/
theorem rs_R005_ueqv_R005NYN_partial_20_0005_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_20_0005
        rs_R005_ueqv_R005NYN_generator_20_0000_0057 =
      rs_R005_ueqv_R005NYN_partial_20_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 20. -/
def rs_R005_ueqv_R005NYN_coefficient_20_0006 : Poly :=
[
  term ((-532480 : Rat) / 52799) [(0, 1), (4, 1), (5, 1), (15, 1)]
]

/-- Partial product 6 for generator 20. -/
def rs_R005_ueqv_R005NYN_partial_20_0006 : Poly :=
[
  term ((1064960 : Rat) / 52799) [(0, 1), (1, 1), (4, 1), (5, 1), (9, 1), (15, 1)],
  term ((-532480 : Rat) / 52799) [(0, 1), (1, 2), (4, 1), (5, 1), (15, 1)],
  term ((-1064960 : Rat) / 52799) [(0, 1), (2, 1), (4, 1), (5, 1), (8, 1), (15, 1)],
  term ((532480 : Rat) / 52799) [(0, 1), (2, 2), (4, 1), (5, 1), (15, 1)],
  term ((-1064960 : Rat) / 52799) [(0, 1), (3, 1), (4, 1), (5, 1), (9, 1), (15, 1)],
  term ((532480 : Rat) / 52799) [(0, 1), (3, 2), (4, 1), (5, 1), (15, 1)],
  term ((1064960 : Rat) / 52799) [(0, 2), (4, 1), (5, 1), (8, 1), (15, 1)],
  term ((-532480 : Rat) / 52799) [(0, 3), (4, 1), (5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 20. -/
theorem rs_R005_ueqv_R005NYN_partial_20_0006_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_20_0006
        rs_R005_ueqv_R005NYN_generator_20_0000_0057 =
      rs_R005_ueqv_R005NYN_partial_20_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 20. -/
def rs_R005_ueqv_R005NYN_coefficient_20_0007 : Poly :=
[
  term ((-3234048 : Rat) / 385571) [(0, 1), (4, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 7 for generator 20. -/
def rs_R005_ueqv_R005NYN_partial_20_0007 : Poly :=
[
  term ((6468096 : Rat) / 385571) [(0, 1), (1, 1), (4, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-3234048 : Rat) / 385571) [(0, 1), (1, 2), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-6468096 : Rat) / 385571) [(0, 1), (2, 1), (4, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((3234048 : Rat) / 385571) [(0, 1), (2, 2), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-6468096 : Rat) / 385571) [(0, 1), (3, 1), (4, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((3234048 : Rat) / 385571) [(0, 1), (3, 2), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((6468096 : Rat) / 385571) [(0, 2), (4, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-3234048 : Rat) / 385571) [(0, 3), (4, 1), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 20. -/
theorem rs_R005_ueqv_R005NYN_partial_20_0007_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_20_0007
        rs_R005_ueqv_R005NYN_generator_20_0000_0057 =
      rs_R005_ueqv_R005NYN_partial_20_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 20. -/
def rs_R005_ueqv_R005NYN_coefficient_20_0008 : Poly :=
[
  term ((-1064960 : Rat) / 158397) [(0, 1), (4, 1), (15, 2)]
]

/-- Partial product 8 for generator 20. -/
def rs_R005_ueqv_R005NYN_partial_20_0008 : Poly :=
[
  term ((2129920 : Rat) / 158397) [(0, 1), (1, 1), (4, 1), (9, 1), (15, 2)],
  term ((-1064960 : Rat) / 158397) [(0, 1), (1, 2), (4, 1), (15, 2)],
  term ((-2129920 : Rat) / 158397) [(0, 1), (2, 1), (4, 1), (8, 1), (15, 2)],
  term ((1064960 : Rat) / 158397) [(0, 1), (2, 2), (4, 1), (15, 2)],
  term ((-2129920 : Rat) / 158397) [(0, 1), (3, 1), (4, 1), (9, 1), (15, 2)],
  term ((1064960 : Rat) / 158397) [(0, 1), (3, 2), (4, 1), (15, 2)],
  term ((2129920 : Rat) / 158397) [(0, 2), (4, 1), (8, 1), (15, 2)],
  term ((-1064960 : Rat) / 158397) [(0, 3), (4, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 20. -/
theorem rs_R005_ueqv_R005NYN_partial_20_0008_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_20_0008
        rs_R005_ueqv_R005NYN_generator_20_0000_0057 =
      rs_R005_ueqv_R005NYN_partial_20_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 20. -/
def rs_R005_ueqv_R005NYN_coefficient_20_0009 : Poly :=
[
  term ((-2156032 : Rat) / 385571) [(0, 1), (4, 1), (15, 2), (16, 1)]
]

/-- Partial product 9 for generator 20. -/
def rs_R005_ueqv_R005NYN_partial_20_0009 : Poly :=
[
  term ((4312064 : Rat) / 385571) [(0, 1), (1, 1), (4, 1), (9, 1), (15, 2), (16, 1)],
  term ((-2156032 : Rat) / 385571) [(0, 1), (1, 2), (4, 1), (15, 2), (16, 1)],
  term ((-4312064 : Rat) / 385571) [(0, 1), (2, 1), (4, 1), (8, 1), (15, 2), (16, 1)],
  term ((2156032 : Rat) / 385571) [(0, 1), (2, 2), (4, 1), (15, 2), (16, 1)],
  term ((-4312064 : Rat) / 385571) [(0, 1), (3, 1), (4, 1), (9, 1), (15, 2), (16, 1)],
  term ((2156032 : Rat) / 385571) [(0, 1), (3, 2), (4, 1), (15, 2), (16, 1)],
  term ((4312064 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (15, 2), (16, 1)],
  term ((-2156032 : Rat) / 385571) [(0, 3), (4, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 20. -/
theorem rs_R005_ueqv_R005NYN_partial_20_0009_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_20_0009
        rs_R005_ueqv_R005NYN_generator_20_0000_0057 =
      rs_R005_ueqv_R005NYN_partial_20_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 20. -/
def rs_R005_ueqv_R005NYN_coefficient_20_0010 : Poly :=
[
  term ((1064960 : Rat) / 52799) [(0, 1), (5, 1), (8, 1), (15, 1)]
]

/-- Partial product 10 for generator 20. -/
def rs_R005_ueqv_R005NYN_partial_20_0010 : Poly :=
[
  term ((-2129920 : Rat) / 52799) [(0, 1), (1, 1), (5, 1), (8, 1), (9, 1), (15, 1)],
  term ((1064960 : Rat) / 52799) [(0, 1), (1, 2), (5, 1), (8, 1), (15, 1)],
  term ((2129920 : Rat) / 52799) [(0, 1), (2, 1), (5, 1), (8, 2), (15, 1)],
  term ((-1064960 : Rat) / 52799) [(0, 1), (2, 2), (5, 1), (8, 1), (15, 1)],
  term ((2129920 : Rat) / 52799) [(0, 1), (3, 1), (5, 1), (8, 1), (9, 1), (15, 1)],
  term ((-1064960 : Rat) / 52799) [(0, 1), (3, 2), (5, 1), (8, 1), (15, 1)],
  term ((-2129920 : Rat) / 52799) [(0, 2), (5, 1), (8, 2), (15, 1)],
  term ((1064960 : Rat) / 52799) [(0, 3), (5, 1), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 20. -/
theorem rs_R005_ueqv_R005NYN_partial_20_0010_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_20_0010
        rs_R005_ueqv_R005NYN_generator_20_0000_0057 =
      rs_R005_ueqv_R005NYN_partial_20_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 20. -/
def rs_R005_ueqv_R005NYN_coefficient_20_0011 : Poly :=
[
  term ((6468096 : Rat) / 385571) [(0, 1), (5, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 11 for generator 20. -/
def rs_R005_ueqv_R005NYN_partial_20_0011 : Poly :=
[
  term ((-12936192 : Rat) / 385571) [(0, 1), (1, 1), (5, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((6468096 : Rat) / 385571) [(0, 1), (1, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((12936192 : Rat) / 385571) [(0, 1), (2, 1), (5, 1), (8, 2), (15, 1), (16, 1)],
  term ((-6468096 : Rat) / 385571) [(0, 1), (2, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((12936192 : Rat) / 385571) [(0, 1), (3, 1), (5, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-6468096 : Rat) / 385571) [(0, 1), (3, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-12936192 : Rat) / 385571) [(0, 2), (5, 1), (8, 2), (15, 1), (16, 1)],
  term ((6468096 : Rat) / 385571) [(0, 3), (5, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 20. -/
theorem rs_R005_ueqv_R005NYN_partial_20_0011_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_20_0011
        rs_R005_ueqv_R005NYN_generator_20_0000_0057 =
      rs_R005_ueqv_R005NYN_partial_20_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 20. -/
def rs_R005_ueqv_R005NYN_coefficient_20_0012 : Poly :=
[
  term ((3673088 : Rat) / 52799) [(0, 1), (5, 1), (15, 1)]
]

/-- Partial product 12 for generator 20. -/
def rs_R005_ueqv_R005NYN_partial_20_0012 : Poly :=
[
  term ((-7346176 : Rat) / 52799) [(0, 1), (1, 1), (5, 1), (9, 1), (15, 1)],
  term ((3673088 : Rat) / 52799) [(0, 1), (1, 2), (5, 1), (15, 1)],
  term ((7346176 : Rat) / 52799) [(0, 1), (2, 1), (5, 1), (8, 1), (15, 1)],
  term ((-3673088 : Rat) / 52799) [(0, 1), (2, 2), (5, 1), (15, 1)],
  term ((7346176 : Rat) / 52799) [(0, 1), (3, 1), (5, 1), (9, 1), (15, 1)],
  term ((-3673088 : Rat) / 52799) [(0, 1), (3, 2), (5, 1), (15, 1)],
  term ((-7346176 : Rat) / 52799) [(0, 2), (5, 1), (8, 1), (15, 1)],
  term ((3673088 : Rat) / 52799) [(0, 3), (5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 20. -/
theorem rs_R005_ueqv_R005NYN_partial_20_0012_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_20_0012
        rs_R005_ueqv_R005NYN_generator_20_0000_0057 =
      rs_R005_ueqv_R005NYN_partial_20_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 20. -/
def rs_R005_ueqv_R005NYN_coefficient_20_0013 : Poly :=
[
  term ((9792912 : Rat) / 385571) [(0, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 13 for generator 20. -/
def rs_R005_ueqv_R005NYN_partial_20_0013 : Poly :=
[
  term ((-19585824 : Rat) / 385571) [(0, 1), (1, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((9792912 : Rat) / 385571) [(0, 1), (1, 2), (5, 1), (15, 1), (16, 1)],
  term ((19585824 : Rat) / 385571) [(0, 1), (2, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-9792912 : Rat) / 385571) [(0, 1), (2, 2), (5, 1), (15, 1), (16, 1)],
  term ((19585824 : Rat) / 385571) [(0, 1), (3, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-9792912 : Rat) / 385571) [(0, 1), (3, 2), (5, 1), (15, 1), (16, 1)],
  term ((-19585824 : Rat) / 385571) [(0, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((9792912 : Rat) / 385571) [(0, 3), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 20. -/
theorem rs_R005_ueqv_R005NYN_partial_20_0013_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_20_0013
        rs_R005_ueqv_R005NYN_generator_20_0000_0057 =
      rs_R005_ueqv_R005NYN_partial_20_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 20. -/
def rs_R005_ueqv_R005NYN_coefficient_20_0014 : Poly :=
[
  term ((-6432640 : Rat) / 158397) [(0, 1), (7, 1), (15, 1)]
]

/-- Partial product 14 for generator 20. -/
def rs_R005_ueqv_R005NYN_partial_20_0014 : Poly :=
[
  term ((12865280 : Rat) / 158397) [(0, 1), (1, 1), (7, 1), (9, 1), (15, 1)],
  term ((-6432640 : Rat) / 158397) [(0, 1), (1, 2), (7, 1), (15, 1)],
  term ((-12865280 : Rat) / 158397) [(0, 1), (2, 1), (7, 1), (8, 1), (15, 1)],
  term ((6432640 : Rat) / 158397) [(0, 1), (2, 2), (7, 1), (15, 1)],
  term ((-12865280 : Rat) / 158397) [(0, 1), (3, 1), (7, 1), (9, 1), (15, 1)],
  term ((6432640 : Rat) / 158397) [(0, 1), (3, 2), (7, 1), (15, 1)],
  term ((12865280 : Rat) / 158397) [(0, 2), (7, 1), (8, 1), (15, 1)],
  term ((-6432640 : Rat) / 158397) [(0, 3), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 20. -/
theorem rs_R005_ueqv_R005NYN_partial_20_0014_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_20_0014
        rs_R005_ueqv_R005NYN_generator_20_0000_0057 =
      rs_R005_ueqv_R005NYN_partial_20_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 20. -/
def rs_R005_ueqv_R005NYN_coefficient_20_0015 : Poly :=
[
  term ((47655232 : Rat) / 385571) [(0, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 15 for generator 20. -/
def rs_R005_ueqv_R005NYN_partial_20_0015 : Poly :=
[
  term ((-95310464 : Rat) / 385571) [(0, 1), (1, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((47655232 : Rat) / 385571) [(0, 1), (1, 2), (7, 1), (15, 1), (16, 1)],
  term ((95310464 : Rat) / 385571) [(0, 1), (2, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-47655232 : Rat) / 385571) [(0, 1), (2, 2), (7, 1), (15, 1), (16, 1)],
  term ((95310464 : Rat) / 385571) [(0, 1), (3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-47655232 : Rat) / 385571) [(0, 1), (3, 2), (7, 1), (15, 1), (16, 1)],
  term ((-95310464 : Rat) / 385571) [(0, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((47655232 : Rat) / 385571) [(0, 3), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 20. -/
theorem rs_R005_ueqv_R005NYN_partial_20_0015_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_20_0015
        rs_R005_ueqv_R005NYN_generator_20_0000_0057 =
      rs_R005_ueqv_R005NYN_partial_20_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 20. -/
def rs_R005_ueqv_R005NYN_coefficient_20_0016 : Poly :=
[
  term ((-1064960 : Rat) / 158397) [(0, 1), (8, 1), (15, 2)]
]

/-- Partial product 16 for generator 20. -/
def rs_R005_ueqv_R005NYN_partial_20_0016 : Poly :=
[
  term ((2129920 : Rat) / 158397) [(0, 1), (1, 1), (8, 1), (9, 1), (15, 2)],
  term ((-1064960 : Rat) / 158397) [(0, 1), (1, 2), (8, 1), (15, 2)],
  term ((-2129920 : Rat) / 158397) [(0, 1), (2, 1), (8, 2), (15, 2)],
  term ((1064960 : Rat) / 158397) [(0, 1), (2, 2), (8, 1), (15, 2)],
  term ((-2129920 : Rat) / 158397) [(0, 1), (3, 1), (8, 1), (9, 1), (15, 2)],
  term ((1064960 : Rat) / 158397) [(0, 1), (3, 2), (8, 1), (15, 2)],
  term ((2129920 : Rat) / 158397) [(0, 2), (8, 2), (15, 2)],
  term ((-1064960 : Rat) / 158397) [(0, 3), (8, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 20. -/
theorem rs_R005_ueqv_R005NYN_partial_20_0016_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_20_0016
        rs_R005_ueqv_R005NYN_generator_20_0000_0057 =
      rs_R005_ueqv_R005NYN_partial_20_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 20. -/
def rs_R005_ueqv_R005NYN_coefficient_20_0017 : Poly :=
[
  term ((-2156032 : Rat) / 385571) [(0, 1), (8, 1), (15, 2), (16, 1)]
]

/-- Partial product 17 for generator 20. -/
def rs_R005_ueqv_R005NYN_partial_20_0017 : Poly :=
[
  term ((4312064 : Rat) / 385571) [(0, 1), (1, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-2156032 : Rat) / 385571) [(0, 1), (1, 2), (8, 1), (15, 2), (16, 1)],
  term ((-4312064 : Rat) / 385571) [(0, 1), (2, 1), (8, 2), (15, 2), (16, 1)],
  term ((2156032 : Rat) / 385571) [(0, 1), (2, 2), (8, 1), (15, 2), (16, 1)],
  term ((-4312064 : Rat) / 385571) [(0, 1), (3, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((2156032 : Rat) / 385571) [(0, 1), (3, 2), (8, 1), (15, 2), (16, 1)],
  term ((4312064 : Rat) / 385571) [(0, 2), (8, 2), (15, 2), (16, 1)],
  term ((-2156032 : Rat) / 385571) [(0, 3), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 20. -/
theorem rs_R005_ueqv_R005NYN_partial_20_0017_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_20_0017
        rs_R005_ueqv_R005NYN_generator_20_0000_0057 =
      rs_R005_ueqv_R005NYN_partial_20_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 20. -/
def rs_R005_ueqv_R005NYN_coefficient_20_0018 : Poly :=
[
  term ((1331200 : Rat) / 158397) [(0, 1), (9, 1), (15, 1)]
]

/-- Partial product 18 for generator 20. -/
def rs_R005_ueqv_R005NYN_partial_20_0018 : Poly :=
[
  term ((-2662400 : Rat) / 158397) [(0, 1), (1, 1), (9, 2), (15, 1)],
  term ((1331200 : Rat) / 158397) [(0, 1), (1, 2), (9, 1), (15, 1)],
  term ((2662400 : Rat) / 158397) [(0, 1), (2, 1), (8, 1), (9, 1), (15, 1)],
  term ((-1331200 : Rat) / 158397) [(0, 1), (2, 2), (9, 1), (15, 1)],
  term ((2662400 : Rat) / 158397) [(0, 1), (3, 1), (9, 2), (15, 1)],
  term ((-1331200 : Rat) / 158397) [(0, 1), (3, 2), (9, 1), (15, 1)],
  term ((-2662400 : Rat) / 158397) [(0, 2), (8, 1), (9, 1), (15, 1)],
  term ((1331200 : Rat) / 158397) [(0, 3), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 20. -/
theorem rs_R005_ueqv_R005NYN_partial_20_0018_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_20_0018
        rs_R005_ueqv_R005NYN_generator_20_0000_0057 =
      rs_R005_ueqv_R005NYN_partial_20_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 20. -/
def rs_R005_ueqv_R005NYN_coefficient_20_0019 : Poly :=
[
  term ((2695040 : Rat) / 385571) [(0, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 19 for generator 20. -/
def rs_R005_ueqv_R005NYN_partial_20_0019 : Poly :=
[
  term ((-5390080 : Rat) / 385571) [(0, 1), (1, 1), (9, 2), (15, 1), (16, 1)],
  term ((2695040 : Rat) / 385571) [(0, 1), (1, 2), (9, 1), (15, 1), (16, 1)],
  term ((5390080 : Rat) / 385571) [(0, 1), (2, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-2695040 : Rat) / 385571) [(0, 1), (2, 2), (9, 1), (15, 1), (16, 1)],
  term ((5390080 : Rat) / 385571) [(0, 1), (3, 1), (9, 2), (15, 1), (16, 1)],
  term ((-2695040 : Rat) / 385571) [(0, 1), (3, 2), (9, 1), (15, 1), (16, 1)],
  term ((-5390080 : Rat) / 385571) [(0, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((2695040 : Rat) / 385571) [(0, 3), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 20. -/
theorem rs_R005_ueqv_R005NYN_partial_20_0019_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_20_0019
        rs_R005_ueqv_R005NYN_generator_20_0000_0057 =
      rs_R005_ueqv_R005NYN_partial_20_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 20. -/
def rs_R005_ueqv_R005NYN_coefficient_20_0020 : Poly :=
[
  term ((3281792 : Rat) / 52799) [(0, 1), (15, 2)]
]

/-- Partial product 20 for generator 20. -/
def rs_R005_ueqv_R005NYN_partial_20_0020 : Poly :=
[
  term ((-6563584 : Rat) / 52799) [(0, 1), (1, 1), (9, 1), (15, 2)],
  term ((3281792 : Rat) / 52799) [(0, 1), (1, 2), (15, 2)],
  term ((6563584 : Rat) / 52799) [(0, 1), (2, 1), (8, 1), (15, 2)],
  term ((-3281792 : Rat) / 52799) [(0, 1), (2, 2), (15, 2)],
  term ((6563584 : Rat) / 52799) [(0, 1), (3, 1), (9, 1), (15, 2)],
  term ((-3281792 : Rat) / 52799) [(0, 1), (3, 2), (15, 2)],
  term ((-6563584 : Rat) / 52799) [(0, 2), (8, 1), (15, 2)],
  term ((3281792 : Rat) / 52799) [(0, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 20. -/
theorem rs_R005_ueqv_R005NYN_partial_20_0020_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_20_0020
        rs_R005_ueqv_R005NYN_generator_20_0000_0057 =
      rs_R005_ueqv_R005NYN_partial_20_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 20. -/
def rs_R005_ueqv_R005NYN_coefficient_20_0021 : Poly :=
[
  term ((-8637792 : Rat) / 385571) [(0, 1), (15, 2), (16, 1)]
]

/-- Partial product 21 for generator 20. -/
def rs_R005_ueqv_R005NYN_partial_20_0021 : Poly :=
[
  term ((17275584 : Rat) / 385571) [(0, 1), (1, 1), (9, 1), (15, 2), (16, 1)],
  term ((-8637792 : Rat) / 385571) [(0, 1), (1, 2), (15, 2), (16, 1)],
  term ((-17275584 : Rat) / 385571) [(0, 1), (2, 1), (8, 1), (15, 2), (16, 1)],
  term ((8637792 : Rat) / 385571) [(0, 1), (2, 2), (15, 2), (16, 1)],
  term ((-17275584 : Rat) / 385571) [(0, 1), (3, 1), (9, 1), (15, 2), (16, 1)],
  term ((8637792 : Rat) / 385571) [(0, 1), (3, 2), (15, 2), (16, 1)],
  term ((17275584 : Rat) / 385571) [(0, 2), (8, 1), (15, 2), (16, 1)],
  term ((-8637792 : Rat) / 385571) [(0, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 20. -/
theorem rs_R005_ueqv_R005NYN_partial_20_0021_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_20_0021
        rs_R005_ueqv_R005NYN_generator_20_0000_0057 =
      rs_R005_ueqv_R005NYN_partial_20_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 20. -/
def rs_R005_ueqv_R005NYN_coefficient_20_0022 : Poly :=
[
  term ((-1064960 : Rat) / 158397) [(1, 1), (8, 1), (15, 1)]
]

/-- Partial product 22 for generator 20. -/
def rs_R005_ueqv_R005NYN_partial_20_0022 : Poly :=
[
  term ((2129920 : Rat) / 158397) [(0, 1), (1, 1), (8, 2), (15, 1)],
  term ((-1064960 : Rat) / 158397) [(0, 2), (1, 1), (8, 1), (15, 1)],
  term ((-2129920 : Rat) / 158397) [(1, 1), (2, 1), (8, 2), (15, 1)],
  term ((1064960 : Rat) / 158397) [(1, 1), (2, 2), (8, 1), (15, 1)],
  term ((-2129920 : Rat) / 158397) [(1, 1), (3, 1), (8, 1), (9, 1), (15, 1)],
  term ((1064960 : Rat) / 158397) [(1, 1), (3, 2), (8, 1), (15, 1)],
  term ((2129920 : Rat) / 158397) [(1, 2), (8, 1), (9, 1), (15, 1)],
  term ((-1064960 : Rat) / 158397) [(1, 3), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 20. -/
theorem rs_R005_ueqv_R005NYN_partial_20_0022_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_20_0022
        rs_R005_ueqv_R005NYN_generator_20_0000_0057 =
      rs_R005_ueqv_R005NYN_partial_20_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 20. -/
def rs_R005_ueqv_R005NYN_coefficient_20_0023 : Poly :=
[
  term ((-2156032 : Rat) / 385571) [(1, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 23 for generator 20. -/
def rs_R005_ueqv_R005NYN_partial_20_0023 : Poly :=
[
  term ((4312064 : Rat) / 385571) [(0, 1), (1, 1), (8, 2), (15, 1), (16, 1)],
  term ((-2156032 : Rat) / 385571) [(0, 2), (1, 1), (8, 1), (15, 1), (16, 1)],
  term ((-4312064 : Rat) / 385571) [(1, 1), (2, 1), (8, 2), (15, 1), (16, 1)],
  term ((2156032 : Rat) / 385571) [(1, 1), (2, 2), (8, 1), (15, 1), (16, 1)],
  term ((-4312064 : Rat) / 385571) [(1, 1), (3, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((2156032 : Rat) / 385571) [(1, 1), (3, 2), (8, 1), (15, 1), (16, 1)],
  term ((4312064 : Rat) / 385571) [(1, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-2156032 : Rat) / 385571) [(1, 3), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 20. -/
theorem rs_R005_ueqv_R005NYN_partial_20_0023_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_20_0023
        rs_R005_ueqv_R005NYN_generator_20_0000_0057 =
      rs_R005_ueqv_R005NYN_partial_20_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 20. -/
def rs_R005_ueqv_R005NYN_coefficient_20_0024 : Poly :=
[
  term ((-328768 : Rat) / 52799) [(1, 1), (15, 1)]
]

/-- Partial product 24 for generator 20. -/
def rs_R005_ueqv_R005NYN_partial_20_0024 : Poly :=
[
  term ((657536 : Rat) / 52799) [(0, 1), (1, 1), (8, 1), (15, 1)],
  term ((-328768 : Rat) / 52799) [(0, 2), (1, 1), (15, 1)],
  term ((-657536 : Rat) / 52799) [(1, 1), (2, 1), (8, 1), (15, 1)],
  term ((328768 : Rat) / 52799) [(1, 1), (2, 2), (15, 1)],
  term ((-657536 : Rat) / 52799) [(1, 1), (3, 1), (9, 1), (15, 1)],
  term ((328768 : Rat) / 52799) [(1, 1), (3, 2), (15, 1)],
  term ((657536 : Rat) / 52799) [(1, 2), (9, 1), (15, 1)],
  term ((-328768 : Rat) / 52799) [(1, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 20. -/
theorem rs_R005_ueqv_R005NYN_partial_20_0024_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_20_0024
        rs_R005_ueqv_R005NYN_generator_20_0000_0057 =
      rs_R005_ueqv_R005NYN_partial_20_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 20. -/
def rs_R005_ueqv_R005NYN_coefficient_20_0025 : Poly :=
[
  term ((-10023864 : Rat) / 385571) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 25 for generator 20. -/
def rs_R005_ueqv_R005NYN_partial_20_0025 : Poly :=
[
  term ((20047728 : Rat) / 385571) [(0, 1), (1, 1), (8, 1), (15, 1), (16, 1)],
  term ((-10023864 : Rat) / 385571) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term ((-20047728 : Rat) / 385571) [(1, 1), (2, 1), (8, 1), (15, 1), (16, 1)],
  term ((10023864 : Rat) / 385571) [(1, 1), (2, 2), (15, 1), (16, 1)],
  term ((-20047728 : Rat) / 385571) [(1, 1), (3, 1), (9, 1), (15, 1), (16, 1)],
  term ((10023864 : Rat) / 385571) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((20047728 : Rat) / 385571) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((-10023864 : Rat) / 385571) [(1, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 20. -/
theorem rs_R005_ueqv_R005NYN_partial_20_0025_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_20_0025
        rs_R005_ueqv_R005NYN_generator_20_0000_0057 =
      rs_R005_ueqv_R005NYN_partial_20_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 20. -/
def rs_R005_ueqv_R005NYN_coefficient_20_0026 : Poly :=
[
  term ((891264 : Rat) / 52799) [(3, 1), (4, 1), (15, 1)]
]

/-- Partial product 26 for generator 20. -/
def rs_R005_ueqv_R005NYN_partial_20_0026 : Poly :=
[
  term ((-1782528 : Rat) / 52799) [(0, 1), (3, 1), (4, 1), (8, 1), (15, 1)],
  term ((891264 : Rat) / 52799) [(0, 2), (3, 1), (4, 1), (15, 1)],
  term ((-1782528 : Rat) / 52799) [(1, 1), (3, 1), (4, 1), (9, 1), (15, 1)],
  term ((891264 : Rat) / 52799) [(1, 2), (3, 1), (4, 1), (15, 1)],
  term ((1782528 : Rat) / 52799) [(2, 1), (3, 1), (4, 1), (8, 1), (15, 1)],
  term ((-891264 : Rat) / 52799) [(2, 2), (3, 1), (4, 1), (15, 1)],
  term ((1782528 : Rat) / 52799) [(3, 2), (4, 1), (9, 1), (15, 1)],
  term ((-891264 : Rat) / 52799) [(3, 3), (4, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 20. -/
theorem rs_R005_ueqv_R005NYN_partial_20_0026_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_20_0026
        rs_R005_ueqv_R005NYN_generator_20_0000_0057 =
      rs_R005_ueqv_R005NYN_partial_20_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 20. -/
def rs_R005_ueqv_R005NYN_coefficient_20_0027 : Poly :=
[
  term ((14507568 : Rat) / 385571) [(3, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 27 for generator 20. -/
def rs_R005_ueqv_R005NYN_partial_20_0027 : Poly :=
[
  term ((-29015136 : Rat) / 385571) [(0, 1), (3, 1), (4, 1), (8, 1), (15, 1), (16, 1)],
  term ((14507568 : Rat) / 385571) [(0, 2), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((-29015136 : Rat) / 385571) [(1, 1), (3, 1), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((14507568 : Rat) / 385571) [(1, 2), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((29015136 : Rat) / 385571) [(2, 1), (3, 1), (4, 1), (8, 1), (15, 1), (16, 1)],
  term ((-14507568 : Rat) / 385571) [(2, 2), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((29015136 : Rat) / 385571) [(3, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-14507568 : Rat) / 385571) [(3, 3), (4, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 20. -/
theorem rs_R005_ueqv_R005NYN_partial_20_0027_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_20_0027
        rs_R005_ueqv_R005NYN_generator_20_0000_0057 =
      rs_R005_ueqv_R005NYN_partial_20_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 20. -/
def rs_R005_ueqv_R005NYN_coefficient_20_0028 : Poly :=
[
  term ((-901120 : Rat) / 158397) [(3, 1), (8, 1), (15, 1)]
]

/-- Partial product 28 for generator 20. -/
def rs_R005_ueqv_R005NYN_partial_20_0028 : Poly :=
[
  term ((1802240 : Rat) / 158397) [(0, 1), (3, 1), (8, 2), (15, 1)],
  term ((-901120 : Rat) / 158397) [(0, 2), (3, 1), (8, 1), (15, 1)],
  term ((1802240 : Rat) / 158397) [(1, 1), (3, 1), (8, 1), (9, 1), (15, 1)],
  term ((-901120 : Rat) / 158397) [(1, 2), (3, 1), (8, 1), (15, 1)],
  term ((-1802240 : Rat) / 158397) [(2, 1), (3, 1), (8, 2), (15, 1)],
  term ((901120 : Rat) / 158397) [(2, 2), (3, 1), (8, 1), (15, 1)],
  term ((-1802240 : Rat) / 158397) [(3, 2), (8, 1), (9, 1), (15, 1)],
  term ((901120 : Rat) / 158397) [(3, 3), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 20. -/
theorem rs_R005_ueqv_R005NYN_partial_20_0028_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_20_0028
        rs_R005_ueqv_R005NYN_generator_20_0000_0057 =
      rs_R005_ueqv_R005NYN_partial_20_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 20. -/
def rs_R005_ueqv_R005NYN_coefficient_20_0029 : Poly :=
[
  term ((1684768 : Rat) / 385571) [(3, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 29 for generator 20. -/
def rs_R005_ueqv_R005NYN_partial_20_0029 : Poly :=
[
  term ((-3369536 : Rat) / 385571) [(0, 1), (3, 1), (8, 2), (15, 1), (16, 1)],
  term ((1684768 : Rat) / 385571) [(0, 2), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((-3369536 : Rat) / 385571) [(1, 1), (3, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((1684768 : Rat) / 385571) [(1, 2), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((3369536 : Rat) / 385571) [(2, 1), (3, 1), (8, 2), (15, 1), (16, 1)],
  term ((-1684768 : Rat) / 385571) [(2, 2), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((3369536 : Rat) / 385571) [(3, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1684768 : Rat) / 385571) [(3, 3), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 20. -/
theorem rs_R005_ueqv_R005NYN_partial_20_0029_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_20_0029
        rs_R005_ueqv_R005NYN_generator_20_0000_0057 =
      rs_R005_ueqv_R005NYN_partial_20_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 20. -/
def rs_R005_ueqv_R005NYN_coefficient_20_0030 : Poly :=
[
  term ((-1556480 : Rat) / 158397) [(3, 1), (10, 1), (15, 1)]
]

/-- Partial product 30 for generator 20. -/
def rs_R005_ueqv_R005NYN_partial_20_0030 : Poly :=
[
  term ((3112960 : Rat) / 158397) [(0, 1), (3, 1), (8, 1), (10, 1), (15, 1)],
  term ((-1556480 : Rat) / 158397) [(0, 2), (3, 1), (10, 1), (15, 1)],
  term ((3112960 : Rat) / 158397) [(1, 1), (3, 1), (9, 1), (10, 1), (15, 1)],
  term ((-1556480 : Rat) / 158397) [(1, 2), (3, 1), (10, 1), (15, 1)],
  term ((-3112960 : Rat) / 158397) [(2, 1), (3, 1), (8, 1), (10, 1), (15, 1)],
  term ((1556480 : Rat) / 158397) [(2, 2), (3, 1), (10, 1), (15, 1)],
  term ((-3112960 : Rat) / 158397) [(3, 2), (9, 1), (10, 1), (15, 1)],
  term ((1556480 : Rat) / 158397) [(3, 3), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 20. -/
theorem rs_R005_ueqv_R005NYN_partial_20_0030_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_20_0030
        rs_R005_ueqv_R005NYN_generator_20_0000_0057 =
      rs_R005_ueqv_R005NYN_partial_20_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 20. -/
def rs_R005_ueqv_R005NYN_coefficient_20_0031 : Poly :=
[
  term ((1527680 : Rat) / 385571) [(3, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 31 for generator 20. -/
def rs_R005_ueqv_R005NYN_partial_20_0031 : Poly :=
[
  term ((-3055360 : Rat) / 385571) [(0, 1), (3, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((1527680 : Rat) / 385571) [(0, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-3055360 : Rat) / 385571) [(1, 1), (3, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((1527680 : Rat) / 385571) [(1, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((3055360 : Rat) / 385571) [(2, 1), (3, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1527680 : Rat) / 385571) [(2, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((3055360 : Rat) / 385571) [(3, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1527680 : Rat) / 385571) [(3, 3), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 20. -/
theorem rs_R005_ueqv_R005NYN_partial_20_0031_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_20_0031
        rs_R005_ueqv_R005NYN_generator_20_0000_0057 =
      rs_R005_ueqv_R005NYN_partial_20_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 20. -/
def rs_R005_ueqv_R005NYN_coefficient_20_0032 : Poly :=
[
  term ((-256000 : Rat) / 52799) [(3, 1), (15, 1)]
]

/-- Partial product 32 for generator 20. -/
def rs_R005_ueqv_R005NYN_partial_20_0032 : Poly :=
[
  term ((512000 : Rat) / 52799) [(0, 1), (3, 1), (8, 1), (15, 1)],
  term ((-256000 : Rat) / 52799) [(0, 2), (3, 1), (15, 1)],
  term ((512000 : Rat) / 52799) [(1, 1), (3, 1), (9, 1), (15, 1)],
  term ((-256000 : Rat) / 52799) [(1, 2), (3, 1), (15, 1)],
  term ((-512000 : Rat) / 52799) [(2, 1), (3, 1), (8, 1), (15, 1)],
  term ((256000 : Rat) / 52799) [(2, 2), (3, 1), (15, 1)],
  term ((-512000 : Rat) / 52799) [(3, 2), (9, 1), (15, 1)],
  term ((256000 : Rat) / 52799) [(3, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 20. -/
theorem rs_R005_ueqv_R005NYN_partial_20_0032_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_20_0032
        rs_R005_ueqv_R005NYN_generator_20_0000_0057 =
      rs_R005_ueqv_R005NYN_partial_20_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 20. -/
def rs_R005_ueqv_R005NYN_coefficient_20_0033 : Poly :=
[
  term ((5755800 : Rat) / 385571) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 33 for generator 20. -/
def rs_R005_ueqv_R005NYN_partial_20_0033 : Poly :=
[
  term ((-11511600 : Rat) / 385571) [(0, 1), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((5755800 : Rat) / 385571) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((-11511600 : Rat) / 385571) [(1, 1), (3, 1), (9, 1), (15, 1), (16, 1)],
  term ((5755800 : Rat) / 385571) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((11511600 : Rat) / 385571) [(2, 1), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((-5755800 : Rat) / 385571) [(2, 2), (3, 1), (15, 1), (16, 1)],
  term ((11511600 : Rat) / 385571) [(3, 2), (9, 1), (15, 1), (16, 1)],
  term ((-5755800 : Rat) / 385571) [(3, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 20. -/
theorem rs_R005_ueqv_R005NYN_partial_20_0033_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_20_0033
        rs_R005_ueqv_R005NYN_generator_20_0000_0057 =
      rs_R005_ueqv_R005NYN_partial_20_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 20. -/
def rs_R005_ueqv_R005NYN_coefficient_20_0034 : Poly :=
[
  term ((-14454016 : Rat) / 158397) [(4, 1), (5, 1), (15, 1)]
]

/-- Partial product 34 for generator 20. -/
def rs_R005_ueqv_R005NYN_partial_20_0034 : Poly :=
[
  term ((28908032 : Rat) / 158397) [(0, 1), (4, 1), (5, 1), (8, 1), (15, 1)],
  term ((-14454016 : Rat) / 158397) [(0, 2), (4, 1), (5, 1), (15, 1)],
  term ((28908032 : Rat) / 158397) [(1, 1), (4, 1), (5, 1), (9, 1), (15, 1)],
  term ((-14454016 : Rat) / 158397) [(1, 2), (4, 1), (5, 1), (15, 1)],
  term ((-28908032 : Rat) / 158397) [(2, 1), (4, 1), (5, 1), (8, 1), (15, 1)],
  term ((14454016 : Rat) / 158397) [(2, 2), (4, 1), (5, 1), (15, 1)],
  term ((-28908032 : Rat) / 158397) [(3, 1), (4, 1), (5, 1), (9, 1), (15, 1)],
  term ((14454016 : Rat) / 158397) [(3, 2), (4, 1), (5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 20. -/
theorem rs_R005_ueqv_R005NYN_partial_20_0034_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_20_0034
        rs_R005_ueqv_R005NYN_generator_20_0000_0057 =
      rs_R005_ueqv_R005NYN_partial_20_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 20. -/
def rs_R005_ueqv_R005NYN_coefficient_20_0035 : Poly :=
[
  term ((4132528 : Rat) / 385571) [(4, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 35 for generator 20. -/
def rs_R005_ueqv_R005NYN_partial_20_0035 : Poly :=
[
  term ((-8265056 : Rat) / 385571) [(0, 1), (4, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((4132528 : Rat) / 385571) [(0, 2), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-8265056 : Rat) / 385571) [(1, 1), (4, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((4132528 : Rat) / 385571) [(1, 2), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((8265056 : Rat) / 385571) [(2, 1), (4, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-4132528 : Rat) / 385571) [(2, 2), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((8265056 : Rat) / 385571) [(3, 1), (4, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-4132528 : Rat) / 385571) [(3, 2), (4, 1), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 20. -/
theorem rs_R005_ueqv_R005NYN_partial_20_0035_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_20_0035
        rs_R005_ueqv_R005NYN_generator_20_0000_0057 =
      rs_R005_ueqv_R005NYN_partial_20_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 20. -/
def rs_R005_ueqv_R005NYN_coefficient_20_0036 : Poly :=
[
  term ((6432640 : Rat) / 158397) [(4, 1), (7, 1), (15, 1)]
]

/-- Partial product 36 for generator 20. -/
def rs_R005_ueqv_R005NYN_partial_20_0036 : Poly :=
[
  term ((-12865280 : Rat) / 158397) [(0, 1), (4, 1), (7, 1), (8, 1), (15, 1)],
  term ((6432640 : Rat) / 158397) [(0, 2), (4, 1), (7, 1), (15, 1)],
  term ((-12865280 : Rat) / 158397) [(1, 1), (4, 1), (7, 1), (9, 1), (15, 1)],
  term ((6432640 : Rat) / 158397) [(1, 2), (4, 1), (7, 1), (15, 1)],
  term ((12865280 : Rat) / 158397) [(2, 1), (4, 1), (7, 1), (8, 1), (15, 1)],
  term ((-6432640 : Rat) / 158397) [(2, 2), (4, 1), (7, 1), (15, 1)],
  term ((12865280 : Rat) / 158397) [(3, 1), (4, 1), (7, 1), (9, 1), (15, 1)],
  term ((-6432640 : Rat) / 158397) [(3, 2), (4, 1), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 20. -/
theorem rs_R005_ueqv_R005NYN_partial_20_0036_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_20_0036
        rs_R005_ueqv_R005NYN_generator_20_0000_0057 =
      rs_R005_ueqv_R005NYN_partial_20_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 20. -/
def rs_R005_ueqv_R005NYN_coefficient_20_0037 : Poly :=
[
  term ((-47655232 : Rat) / 385571) [(4, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 37 for generator 20. -/
def rs_R005_ueqv_R005NYN_partial_20_0037 : Poly :=
[
  term ((95310464 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-47655232 : Rat) / 385571) [(0, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((95310464 : Rat) / 385571) [(1, 1), (4, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-47655232 : Rat) / 385571) [(1, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-95310464 : Rat) / 385571) [(2, 1), (4, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((47655232 : Rat) / 385571) [(2, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-95310464 : Rat) / 385571) [(3, 1), (4, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((47655232 : Rat) / 385571) [(3, 2), (4, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 20. -/
theorem rs_R005_ueqv_R005NYN_partial_20_0037_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_20_0037
        rs_R005_ueqv_R005NYN_generator_20_0000_0057 =
      rs_R005_ueqv_R005NYN_partial_20_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 20. -/
def rs_R005_ueqv_R005NYN_coefficient_20_0038 : Poly :=
[
  term ((-778240 : Rat) / 52799) [(4, 1), (9, 1), (15, 1)]
]

/-- Partial product 38 for generator 20. -/
def rs_R005_ueqv_R005NYN_partial_20_0038 : Poly :=
[
  term ((1556480 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (9, 1), (15, 1)],
  term ((-778240 : Rat) / 52799) [(0, 2), (4, 1), (9, 1), (15, 1)],
  term ((1556480 : Rat) / 52799) [(1, 1), (4, 1), (9, 2), (15, 1)],
  term ((-778240 : Rat) / 52799) [(1, 2), (4, 1), (9, 1), (15, 1)],
  term ((-1556480 : Rat) / 52799) [(2, 1), (4, 1), (8, 1), (9, 1), (15, 1)],
  term ((778240 : Rat) / 52799) [(2, 2), (4, 1), (9, 1), (15, 1)],
  term ((-1556480 : Rat) / 52799) [(3, 1), (4, 1), (9, 2), (15, 1)],
  term ((778240 : Rat) / 52799) [(3, 2), (4, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 20. -/
theorem rs_R005_ueqv_R005NYN_partial_20_0038_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_20_0038
        rs_R005_ueqv_R005NYN_generator_20_0000_0057 =
      rs_R005_ueqv_R005NYN_partial_20_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 20. -/
def rs_R005_ueqv_R005NYN_coefficient_20_0039 : Poly :=
[
  term ((2291520 : Rat) / 385571) [(4, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 39 for generator 20. -/
def rs_R005_ueqv_R005NYN_partial_20_0039 : Poly :=
[
  term ((-4583040 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((2291520 : Rat) / 385571) [(0, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(1, 1), (4, 1), (9, 2), (15, 1), (16, 1)],
  term ((2291520 : Rat) / 385571) [(1, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((4583040 : Rat) / 385571) [(2, 1), (4, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-2291520 : Rat) / 385571) [(2, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((4583040 : Rat) / 385571) [(3, 1), (4, 1), (9, 2), (15, 1), (16, 1)],
  term ((-2291520 : Rat) / 385571) [(3, 2), (4, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 20. -/
theorem rs_R005_ueqv_R005NYN_partial_20_0039_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_20_0039
        rs_R005_ueqv_R005NYN_generator_20_0000_0057 =
      rs_R005_ueqv_R005NYN_partial_20_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 20. -/
def rs_R005_ueqv_R005NYN_coefficient_20_0040 : Poly :=
[
  term ((-11780224 : Rat) / 158397) [(4, 1), (15, 2)]
]

/-- Partial product 40 for generator 20. -/
def rs_R005_ueqv_R005NYN_partial_20_0040 : Poly :=
[
  term ((23560448 : Rat) / 158397) [(0, 1), (4, 1), (8, 1), (15, 2)],
  term ((-11780224 : Rat) / 158397) [(0, 2), (4, 1), (15, 2)],
  term ((23560448 : Rat) / 158397) [(1, 1), (4, 1), (9, 1), (15, 2)],
  term ((-11780224 : Rat) / 158397) [(1, 2), (4, 1), (15, 2)],
  term ((-23560448 : Rat) / 158397) [(2, 1), (4, 1), (8, 1), (15, 2)],
  term ((11780224 : Rat) / 158397) [(2, 2), (4, 1), (15, 2)],
  term ((-23560448 : Rat) / 158397) [(3, 1), (4, 1), (9, 1), (15, 2)],
  term ((11780224 : Rat) / 158397) [(3, 2), (4, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 20. -/
theorem rs_R005_ueqv_R005NYN_partial_20_0040_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_20_0040
        rs_R005_ueqv_R005NYN_generator_20_0000_0057 =
      rs_R005_ueqv_R005NYN_partial_20_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 20. -/
def rs_R005_ueqv_R005NYN_coefficient_20_0041 : Poly :=
[
  term ((18640096 : Rat) / 385571) [(4, 1), (15, 2), (16, 1)]
]

/-- Partial product 41 for generator 20. -/
def rs_R005_ueqv_R005NYN_partial_20_0041 : Poly :=
[
  term ((-37280192 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (15, 2), (16, 1)],
  term ((18640096 : Rat) / 385571) [(0, 2), (4, 1), (15, 2), (16, 1)],
  term ((-37280192 : Rat) / 385571) [(1, 1), (4, 1), (9, 1), (15, 2), (16, 1)],
  term ((18640096 : Rat) / 385571) [(1, 2), (4, 1), (15, 2), (16, 1)],
  term ((37280192 : Rat) / 385571) [(2, 1), (4, 1), (8, 1), (15, 2), (16, 1)],
  term ((-18640096 : Rat) / 385571) [(2, 2), (4, 1), (15, 2), (16, 1)],
  term ((37280192 : Rat) / 385571) [(3, 1), (4, 1), (9, 1), (15, 2), (16, 1)],
  term ((-18640096 : Rat) / 385571) [(3, 2), (4, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 20. -/
theorem rs_R005_ueqv_R005NYN_partial_20_0041_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_20_0041
        rs_R005_ueqv_R005NYN_generator_20_0000_0057 =
      rs_R005_ueqv_R005NYN_partial_20_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 20. -/
def rs_R005_ueqv_R005NYN_coefficient_20_0042 : Poly :=
[
  term ((3977984 : Rat) / 52799) [(5, 1), (8, 1), (15, 1)]
]

/-- Partial product 42 for generator 20. -/
def rs_R005_ueqv_R005NYN_partial_20_0042 : Poly :=
[
  term ((-7955968 : Rat) / 52799) [(0, 1), (5, 1), (8, 2), (15, 1)],
  term ((3977984 : Rat) / 52799) [(0, 2), (5, 1), (8, 1), (15, 1)],
  term ((-7955968 : Rat) / 52799) [(1, 1), (5, 1), (8, 1), (9, 1), (15, 1)],
  term ((3977984 : Rat) / 52799) [(1, 2), (5, 1), (8, 1), (15, 1)],
  term ((7955968 : Rat) / 52799) [(2, 1), (5, 1), (8, 2), (15, 1)],
  term ((-3977984 : Rat) / 52799) [(2, 2), (5, 1), (8, 1), (15, 1)],
  term ((7955968 : Rat) / 52799) [(3, 1), (5, 1), (8, 1), (9, 1), (15, 1)],
  term ((-3977984 : Rat) / 52799) [(3, 2), (5, 1), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 20. -/
theorem rs_R005_ueqv_R005NYN_partial_20_0042_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_20_0042
        rs_R005_ueqv_R005NYN_generator_20_0000_0057 =
      rs_R005_ueqv_R005NYN_partial_20_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 20. -/
def rs_R005_ueqv_R005NYN_coefficient_20_0043 : Poly :=
[
  term ((-14264160 : Rat) / 385571) [(5, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 43 for generator 20. -/
def rs_R005_ueqv_R005NYN_partial_20_0043 : Poly :=
[
  term ((28528320 : Rat) / 385571) [(0, 1), (5, 1), (8, 2), (15, 1), (16, 1)],
  term ((-14264160 : Rat) / 385571) [(0, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((28528320 : Rat) / 385571) [(1, 1), (5, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-14264160 : Rat) / 385571) [(1, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-28528320 : Rat) / 385571) [(2, 1), (5, 1), (8, 2), (15, 1), (16, 1)],
  term ((14264160 : Rat) / 385571) [(2, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-28528320 : Rat) / 385571) [(3, 1), (5, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((14264160 : Rat) / 385571) [(3, 2), (5, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 20. -/
theorem rs_R005_ueqv_R005NYN_partial_20_0043_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_20_0043
        rs_R005_ueqv_R005NYN_generator_20_0000_0057 =
      rs_R005_ueqv_R005NYN_partial_20_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 20. -/
def rs_R005_ueqv_R005NYN_coefficient_20_0044 : Poly :=
[
  term ((-1556480 : Rat) / 52799) [(5, 1), (10, 1), (15, 1)]
]

/-- Partial product 44 for generator 20. -/
def rs_R005_ueqv_R005NYN_partial_20_0044 : Poly :=
[
  term ((3112960 : Rat) / 52799) [(0, 1), (5, 1), (8, 1), (10, 1), (15, 1)],
  term ((-1556480 : Rat) / 52799) [(0, 2), (5, 1), (10, 1), (15, 1)],
  term ((3112960 : Rat) / 52799) [(1, 1), (5, 1), (9, 1), (10, 1), (15, 1)],
  term ((-1556480 : Rat) / 52799) [(1, 2), (5, 1), (10, 1), (15, 1)],
  term ((-3112960 : Rat) / 52799) [(2, 1), (5, 1), (8, 1), (10, 1), (15, 1)],
  term ((1556480 : Rat) / 52799) [(2, 2), (5, 1), (10, 1), (15, 1)],
  term ((-3112960 : Rat) / 52799) [(3, 1), (5, 1), (9, 1), (10, 1), (15, 1)],
  term ((1556480 : Rat) / 52799) [(3, 2), (5, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 20. -/
theorem rs_R005_ueqv_R005NYN_partial_20_0044_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_20_0044
        rs_R005_ueqv_R005NYN_generator_20_0000_0057 =
      rs_R005_ueqv_R005NYN_partial_20_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 20. -/
def rs_R005_ueqv_R005NYN_coefficient_20_0045 : Poly :=
[
  term ((4583040 : Rat) / 385571) [(5, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 45 for generator 20. -/
def rs_R005_ueqv_R005NYN_partial_20_0045 : Poly :=
[
  term ((-9166080 : Rat) / 385571) [(0, 1), (5, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((4583040 : Rat) / 385571) [(0, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-9166080 : Rat) / 385571) [(1, 1), (5, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((4583040 : Rat) / 385571) [(1, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((9166080 : Rat) / 385571) [(2, 1), (5, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(2, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((9166080 : Rat) / 385571) [(3, 1), (5, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(3, 2), (5, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 20. -/
theorem rs_R005_ueqv_R005NYN_partial_20_0045_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_20_0045
        rs_R005_ueqv_R005NYN_generator_20_0000_0057 =
      rs_R005_ueqv_R005NYN_partial_20_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 20. -/
def rs_R005_ueqv_R005NYN_coefficient_20_0046 : Poly :=
[
  term ((-68416 : Rat) / 158397) [(5, 1), (15, 1)]
]

/-- Partial product 46 for generator 20. -/
def rs_R005_ueqv_R005NYN_partial_20_0046 : Poly :=
[
  term ((136832 : Rat) / 158397) [(0, 1), (5, 1), (8, 1), (15, 1)],
  term ((-68416 : Rat) / 158397) [(0, 2), (5, 1), (15, 1)],
  term ((136832 : Rat) / 158397) [(1, 1), (5, 1), (9, 1), (15, 1)],
  term ((-68416 : Rat) / 158397) [(1, 2), (5, 1), (15, 1)],
  term ((-136832 : Rat) / 158397) [(2, 1), (5, 1), (8, 1), (15, 1)],
  term ((68416 : Rat) / 158397) [(2, 2), (5, 1), (15, 1)],
  term ((-136832 : Rat) / 158397) [(3, 1), (5, 1), (9, 1), (15, 1)],
  term ((68416 : Rat) / 158397) [(3, 2), (5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 20. -/
theorem rs_R005_ueqv_R005NYN_partial_20_0046_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_20_0046
        rs_R005_ueqv_R005NYN_generator_20_0000_0057 =
      rs_R005_ueqv_R005NYN_partial_20_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 20. -/
def rs_R005_ueqv_R005NYN_coefficient_20_0047 : Poly :=
[
  term ((5256736 : Rat) / 385571) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 47 for generator 20. -/
def rs_R005_ueqv_R005NYN_partial_20_0047 : Poly :=
[
  term ((-10513472 : Rat) / 385571) [(0, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((5256736 : Rat) / 385571) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((-10513472 : Rat) / 385571) [(1, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((5256736 : Rat) / 385571) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((10513472 : Rat) / 385571) [(2, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-5256736 : Rat) / 385571) [(2, 2), (5, 1), (15, 1), (16, 1)],
  term ((10513472 : Rat) / 385571) [(3, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-5256736 : Rat) / 385571) [(3, 2), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 20. -/
theorem rs_R005_ueqv_R005NYN_partial_20_0047_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_20_0047
        rs_R005_ueqv_R005NYN_generator_20_0000_0057 =
      rs_R005_ueqv_R005NYN_partial_20_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 20. -/
def rs_R005_ueqv_R005NYN_coefficient_20_0048 : Poly :=
[
  term ((-2867200 : Rat) / 158397) [(8, 1), (15, 2)]
]

/-- Partial product 48 for generator 20. -/
def rs_R005_ueqv_R005NYN_partial_20_0048 : Poly :=
[
  term ((5734400 : Rat) / 158397) [(0, 1), (8, 2), (15, 2)],
  term ((-2867200 : Rat) / 158397) [(0, 2), (8, 1), (15, 2)],
  term ((5734400 : Rat) / 158397) [(1, 1), (8, 1), (9, 1), (15, 2)],
  term ((-2867200 : Rat) / 158397) [(1, 2), (8, 1), (15, 2)],
  term ((-5734400 : Rat) / 158397) [(2, 1), (8, 2), (15, 2)],
  term ((2867200 : Rat) / 158397) [(2, 2), (8, 1), (15, 2)],
  term ((-5734400 : Rat) / 158397) [(3, 1), (8, 1), (9, 1), (15, 2)],
  term ((2867200 : Rat) / 158397) [(3, 2), (8, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 20. -/
theorem rs_R005_ueqv_R005NYN_partial_20_0048_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_20_0048
        rs_R005_ueqv_R005NYN_generator_20_0000_0057 =
      rs_R005_ueqv_R005NYN_partial_20_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 20. -/
def rs_R005_ueqv_R005NYN_coefficient_20_0049 : Poly :=
[
  term ((1213504 : Rat) / 385571) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 49 for generator 20. -/
def rs_R005_ueqv_R005NYN_partial_20_0049 : Poly :=
[
  term ((-2427008 : Rat) / 385571) [(0, 1), (8, 2), (15, 2), (16, 1)],
  term ((1213504 : Rat) / 385571) [(0, 2), (8, 1), (15, 2), (16, 1)],
  term ((-2427008 : Rat) / 385571) [(1, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((1213504 : Rat) / 385571) [(1, 2), (8, 1), (15, 2), (16, 1)],
  term ((2427008 : Rat) / 385571) [(2, 1), (8, 2), (15, 2), (16, 1)],
  term ((-1213504 : Rat) / 385571) [(2, 2), (8, 1), (15, 2), (16, 1)],
  term ((2427008 : Rat) / 385571) [(3, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-1213504 : Rat) / 385571) [(3, 2), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 20. -/
theorem rs_R005_ueqv_R005NYN_partial_20_0049_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_20_0049
        rs_R005_ueqv_R005NYN_generator_20_0000_0057 =
      rs_R005_ueqv_R005NYN_partial_20_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 20. -/
def rs_R005_ueqv_R005NYN_coefficient_20_0050 : Poly :=
[
  term ((-450560 : Rat) / 158397) [(9, 1), (15, 1)]
]

/-- Partial product 50 for generator 20. -/
def rs_R005_ueqv_R005NYN_partial_20_0050 : Poly :=
[
  term ((901120 : Rat) / 158397) [(0, 1), (8, 1), (9, 1), (15, 1)],
  term ((-450560 : Rat) / 158397) [(0, 2), (9, 1), (15, 1)],
  term ((901120 : Rat) / 158397) [(1, 1), (9, 2), (15, 1)],
  term ((-450560 : Rat) / 158397) [(1, 2), (9, 1), (15, 1)],
  term ((-901120 : Rat) / 158397) [(2, 1), (8, 1), (9, 1), (15, 1)],
  term ((450560 : Rat) / 158397) [(2, 2), (9, 1), (15, 1)],
  term ((-901120 : Rat) / 158397) [(3, 1), (9, 2), (15, 1)],
  term ((450560 : Rat) / 158397) [(3, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 20. -/
theorem rs_R005_ueqv_R005NYN_partial_20_0050_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_20_0050
        rs_R005_ueqv_R005NYN_generator_20_0000_0057 =
      rs_R005_ueqv_R005NYN_partial_20_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 20. -/
def rs_R005_ueqv_R005NYN_coefficient_20_0051 : Poly :=
[
  term ((842384 : Rat) / 385571) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 51 for generator 20. -/
def rs_R005_ueqv_R005NYN_partial_20_0051 : Poly :=
[
  term ((-1684768 : Rat) / 385571) [(0, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((842384 : Rat) / 385571) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((-1684768 : Rat) / 385571) [(1, 1), (9, 2), (15, 1), (16, 1)],
  term ((842384 : Rat) / 385571) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((1684768 : Rat) / 385571) [(2, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-842384 : Rat) / 385571) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((1684768 : Rat) / 385571) [(3, 1), (9, 2), (15, 1), (16, 1)],
  term ((-842384 : Rat) / 385571) [(3, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 20. -/
theorem rs_R005_ueqv_R005NYN_partial_20_0051_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_20_0051
        rs_R005_ueqv_R005NYN_generator_20_0000_0057 =
      rs_R005_ueqv_R005NYN_partial_20_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 20. -/
def rs_R005_ueqv_R005NYN_coefficient_20_0052 : Poly :=
[
  term ((3112960 : Rat) / 158397) [(10, 1), (15, 2)]
]

/-- Partial product 52 for generator 20. -/
def rs_R005_ueqv_R005NYN_partial_20_0052 : Poly :=
[
  term ((-6225920 : Rat) / 158397) [(0, 1), (8, 1), (10, 1), (15, 2)],
  term ((3112960 : Rat) / 158397) [(0, 2), (10, 1), (15, 2)],
  term ((-6225920 : Rat) / 158397) [(1, 1), (9, 1), (10, 1), (15, 2)],
  term ((3112960 : Rat) / 158397) [(1, 2), (10, 1), (15, 2)],
  term ((6225920 : Rat) / 158397) [(2, 1), (8, 1), (10, 1), (15, 2)],
  term ((-3112960 : Rat) / 158397) [(2, 2), (10, 1), (15, 2)],
  term ((6225920 : Rat) / 158397) [(3, 1), (9, 1), (10, 1), (15, 2)],
  term ((-3112960 : Rat) / 158397) [(3, 2), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 20. -/
theorem rs_R005_ueqv_R005NYN_partial_20_0052_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_20_0052
        rs_R005_ueqv_R005NYN_generator_20_0000_0057 =
      rs_R005_ueqv_R005NYN_partial_20_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 20. -/
def rs_R005_ueqv_R005NYN_coefficient_20_0053 : Poly :=
[
  term ((-3055360 : Rat) / 385571) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 53 for generator 20. -/
def rs_R005_ueqv_R005NYN_partial_20_0053 : Poly :=
[
  term ((6110720 : Rat) / 385571) [(0, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-3055360 : Rat) / 385571) [(0, 2), (10, 1), (15, 2), (16, 1)],
  term ((6110720 : Rat) / 385571) [(1, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-3055360 : Rat) / 385571) [(1, 2), (10, 1), (15, 2), (16, 1)],
  term ((-6110720 : Rat) / 385571) [(2, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((3055360 : Rat) / 385571) [(2, 2), (10, 1), (15, 2), (16, 1)],
  term ((-6110720 : Rat) / 385571) [(3, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((3055360 : Rat) / 385571) [(3, 2), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 20. -/
theorem rs_R005_ueqv_R005NYN_partial_20_0053_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_20_0053
        rs_R005_ueqv_R005NYN_generator_20_0000_0057 =
      rs_R005_ueqv_R005NYN_partial_20_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 20. -/
def rs_R005_ueqv_R005NYN_coefficient_20_0054 : Poly :=
[
  term ((-778240 : Rat) / 158397) [(11, 1), (15, 1)]
]

/-- Partial product 54 for generator 20. -/
def rs_R005_ueqv_R005NYN_partial_20_0054 : Poly :=
[
  term ((1556480 : Rat) / 158397) [(0, 1), (8, 1), (11, 1), (15, 1)],
  term ((-778240 : Rat) / 158397) [(0, 2), (11, 1), (15, 1)],
  term ((1556480 : Rat) / 158397) [(1, 1), (9, 1), (11, 1), (15, 1)],
  term ((-778240 : Rat) / 158397) [(1, 2), (11, 1), (15, 1)],
  term ((-1556480 : Rat) / 158397) [(2, 1), (8, 1), (11, 1), (15, 1)],
  term ((778240 : Rat) / 158397) [(2, 2), (11, 1), (15, 1)],
  term ((-1556480 : Rat) / 158397) [(3, 1), (9, 1), (11, 1), (15, 1)],
  term ((778240 : Rat) / 158397) [(3, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 20. -/
theorem rs_R005_ueqv_R005NYN_partial_20_0054_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_20_0054
        rs_R005_ueqv_R005NYN_generator_20_0000_0057 =
      rs_R005_ueqv_R005NYN_partial_20_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 20. -/
def rs_R005_ueqv_R005NYN_coefficient_20_0055 : Poly :=
[
  term ((763840 : Rat) / 385571) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 55 for generator 20. -/
def rs_R005_ueqv_R005NYN_partial_20_0055 : Poly :=
[
  term ((-1527680 : Rat) / 385571) [(0, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((763840 : Rat) / 385571) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1527680 : Rat) / 385571) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((763840 : Rat) / 385571) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((1527680 : Rat) / 385571) [(2, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-763840 : Rat) / 385571) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((1527680 : Rat) / 385571) [(3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-763840 : Rat) / 385571) [(3, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 20. -/
theorem rs_R005_ueqv_R005NYN_partial_20_0055_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_20_0055
        rs_R005_ueqv_R005NYN_generator_20_0000_0057 =
      rs_R005_ueqv_R005NYN_partial_20_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 20. -/
def rs_R005_ueqv_R005NYN_coefficient_20_0056 : Poly :=
[
  term ((-1788352 : Rat) / 158397) [(15, 2)]
]

/-- Partial product 56 for generator 20. -/
def rs_R005_ueqv_R005NYN_partial_20_0056 : Poly :=
[
  term ((3576704 : Rat) / 158397) [(0, 1), (8, 1), (15, 2)],
  term ((-1788352 : Rat) / 158397) [(0, 2), (15, 2)],
  term ((3576704 : Rat) / 158397) [(1, 1), (9, 1), (15, 2)],
  term ((-1788352 : Rat) / 158397) [(1, 2), (15, 2)],
  term ((-3576704 : Rat) / 158397) [(2, 1), (8, 1), (15, 2)],
  term ((1788352 : Rat) / 158397) [(2, 2), (15, 2)],
  term ((-3576704 : Rat) / 158397) [(3, 1), (9, 1), (15, 2)],
  term ((1788352 : Rat) / 158397) [(3, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 20. -/
theorem rs_R005_ueqv_R005NYN_partial_20_0056_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_20_0056
        rs_R005_ueqv_R005NYN_generator_20_0000_0057 =
      rs_R005_ueqv_R005NYN_partial_20_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 20. -/
def rs_R005_ueqv_R005NYN_coefficient_20_0057 : Poly :=
[
  term ((4318792 : Rat) / 385571) [(15, 2), (16, 1)]
]

/-- Partial product 57 for generator 20. -/
def rs_R005_ueqv_R005NYN_partial_20_0057 : Poly :=
[
  term ((-8637584 : Rat) / 385571) [(0, 1), (8, 1), (15, 2), (16, 1)],
  term ((4318792 : Rat) / 385571) [(0, 2), (15, 2), (16, 1)],
  term ((-8637584 : Rat) / 385571) [(1, 1), (9, 1), (15, 2), (16, 1)],
  term ((4318792 : Rat) / 385571) [(1, 2), (15, 2), (16, 1)],
  term ((8637584 : Rat) / 385571) [(2, 1), (8, 1), (15, 2), (16, 1)],
  term ((-4318792 : Rat) / 385571) [(2, 2), (15, 2), (16, 1)],
  term ((8637584 : Rat) / 385571) [(3, 1), (9, 1), (15, 2), (16, 1)],
  term ((-4318792 : Rat) / 385571) [(3, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 20. -/
theorem rs_R005_ueqv_R005NYN_partial_20_0057_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_20_0057
        rs_R005_ueqv_R005NYN_generator_20_0000_0057 =
      rs_R005_ueqv_R005NYN_partial_20_0057 := by
  native_decide

/-- Partial products in this block. -/
def rs_R005_ueqv_R005NYN_partials_20_0000_0057 : List Poly :=
[
  rs_R005_ueqv_R005NYN_partial_20_0000,
  rs_R005_ueqv_R005NYN_partial_20_0001,
  rs_R005_ueqv_R005NYN_partial_20_0002,
  rs_R005_ueqv_R005NYN_partial_20_0003,
  rs_R005_ueqv_R005NYN_partial_20_0004,
  rs_R005_ueqv_R005NYN_partial_20_0005,
  rs_R005_ueqv_R005NYN_partial_20_0006,
  rs_R005_ueqv_R005NYN_partial_20_0007,
  rs_R005_ueqv_R005NYN_partial_20_0008,
  rs_R005_ueqv_R005NYN_partial_20_0009,
  rs_R005_ueqv_R005NYN_partial_20_0010,
  rs_R005_ueqv_R005NYN_partial_20_0011,
  rs_R005_ueqv_R005NYN_partial_20_0012,
  rs_R005_ueqv_R005NYN_partial_20_0013,
  rs_R005_ueqv_R005NYN_partial_20_0014,
  rs_R005_ueqv_R005NYN_partial_20_0015,
  rs_R005_ueqv_R005NYN_partial_20_0016,
  rs_R005_ueqv_R005NYN_partial_20_0017,
  rs_R005_ueqv_R005NYN_partial_20_0018,
  rs_R005_ueqv_R005NYN_partial_20_0019,
  rs_R005_ueqv_R005NYN_partial_20_0020,
  rs_R005_ueqv_R005NYN_partial_20_0021,
  rs_R005_ueqv_R005NYN_partial_20_0022,
  rs_R005_ueqv_R005NYN_partial_20_0023,
  rs_R005_ueqv_R005NYN_partial_20_0024,
  rs_R005_ueqv_R005NYN_partial_20_0025,
  rs_R005_ueqv_R005NYN_partial_20_0026,
  rs_R005_ueqv_R005NYN_partial_20_0027,
  rs_R005_ueqv_R005NYN_partial_20_0028,
  rs_R005_ueqv_R005NYN_partial_20_0029,
  rs_R005_ueqv_R005NYN_partial_20_0030,
  rs_R005_ueqv_R005NYN_partial_20_0031,
  rs_R005_ueqv_R005NYN_partial_20_0032,
  rs_R005_ueqv_R005NYN_partial_20_0033,
  rs_R005_ueqv_R005NYN_partial_20_0034,
  rs_R005_ueqv_R005NYN_partial_20_0035,
  rs_R005_ueqv_R005NYN_partial_20_0036,
  rs_R005_ueqv_R005NYN_partial_20_0037,
  rs_R005_ueqv_R005NYN_partial_20_0038,
  rs_R005_ueqv_R005NYN_partial_20_0039,
  rs_R005_ueqv_R005NYN_partial_20_0040,
  rs_R005_ueqv_R005NYN_partial_20_0041,
  rs_R005_ueqv_R005NYN_partial_20_0042,
  rs_R005_ueqv_R005NYN_partial_20_0043,
  rs_R005_ueqv_R005NYN_partial_20_0044,
  rs_R005_ueqv_R005NYN_partial_20_0045,
  rs_R005_ueqv_R005NYN_partial_20_0046,
  rs_R005_ueqv_R005NYN_partial_20_0047,
  rs_R005_ueqv_R005NYN_partial_20_0048,
  rs_R005_ueqv_R005NYN_partial_20_0049,
  rs_R005_ueqv_R005NYN_partial_20_0050,
  rs_R005_ueqv_R005NYN_partial_20_0051,
  rs_R005_ueqv_R005NYN_partial_20_0052,
  rs_R005_ueqv_R005NYN_partial_20_0053,
  rs_R005_ueqv_R005NYN_partial_20_0054,
  rs_R005_ueqv_R005NYN_partial_20_0055,
  rs_R005_ueqv_R005NYN_partial_20_0056,
  rs_R005_ueqv_R005NYN_partial_20_0057
]

/-- Sum of partial products in this block. -/
def rs_R005_ueqv_R005NYN_block_20_0000_0057 : Poly :=
[
  term ((-1064960 : Rat) / 158397) [(0, 1), (1, 1), (3, 1), (4, 1), (9, 1), (15, 1)],
  term ((-2156032 : Rat) / 385571) [(0, 1), (1, 1), (3, 1), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1064960 : Rat) / 158397) [(0, 1), (1, 1), (3, 1), (8, 1), (9, 1), (15, 1)],
  term ((-2156032 : Rat) / 385571) [(0, 1), (1, 1), (3, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((3412736 : Rat) / 158397) [(0, 1), (1, 1), (3, 1), (9, 1), (15, 1)],
  term ((39017440 : Rat) / 385571) [(0, 1), (1, 1), (3, 1), (9, 1), (15, 1), (16, 1)],
  term ((1064960 : Rat) / 52799) [(0, 1), (1, 1), (4, 1), (5, 1), (9, 1), (15, 1)],
  term ((6468096 : Rat) / 385571) [(0, 1), (1, 1), (4, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((2129920 : Rat) / 158397) [(0, 1), (1, 1), (4, 1), (9, 1), (15, 2)],
  term ((4312064 : Rat) / 385571) [(0, 1), (1, 1), (4, 1), (9, 1), (15, 2), (16, 1)],
  term ((-2129920 : Rat) / 52799) [(0, 1), (1, 1), (5, 1), (8, 1), (9, 1), (15, 1)],
  term ((-12936192 : Rat) / 385571) [(0, 1), (1, 1), (5, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-7346176 : Rat) / 52799) [(0, 1), (1, 1), (5, 1), (9, 1), (15, 1)],
  term ((-19585824 : Rat) / 385571) [(0, 1), (1, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((12865280 : Rat) / 158397) [(0, 1), (1, 1), (7, 1), (9, 1), (15, 1)],
  term ((-95310464 : Rat) / 385571) [(0, 1), (1, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((2129920 : Rat) / 158397) [(0, 1), (1, 1), (8, 1), (9, 1), (15, 2)],
  term ((4312064 : Rat) / 385571) [(0, 1), (1, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((657536 : Rat) / 52799) [(0, 1), (1, 1), (8, 1), (15, 1)],
  term ((20047728 : Rat) / 385571) [(0, 1), (1, 1), (8, 1), (15, 1), (16, 1)],
  term ((2129920 : Rat) / 158397) [(0, 1), (1, 1), (8, 2), (15, 1)],
  term ((4312064 : Rat) / 385571) [(0, 1), (1, 1), (8, 2), (15, 1), (16, 1)],
  term ((-6563584 : Rat) / 52799) [(0, 1), (1, 1), (9, 1), (15, 2)],
  term ((17275584 : Rat) / 385571) [(0, 1), (1, 1), (9, 1), (15, 2), (16, 1)],
  term ((-2662400 : Rat) / 158397) [(0, 1), (1, 1), (9, 2), (15, 1)],
  term ((-5390080 : Rat) / 385571) [(0, 1), (1, 1), (9, 2), (15, 1), (16, 1)],
  term ((532480 : Rat) / 158397) [(0, 1), (1, 2), (3, 1), (4, 1), (15, 1)],
  term ((1078016 : Rat) / 385571) [(0, 1), (1, 2), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((532480 : Rat) / 158397) [(0, 1), (1, 2), (3, 1), (8, 1), (15, 1)],
  term ((1078016 : Rat) / 385571) [(0, 1), (1, 2), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((-1706368 : Rat) / 158397) [(0, 1), (1, 2), (3, 1), (15, 1)],
  term ((-19508720 : Rat) / 385571) [(0, 1), (1, 2), (3, 1), (15, 1), (16, 1)],
  term ((-532480 : Rat) / 52799) [(0, 1), (1, 2), (4, 1), (5, 1), (15, 1)],
  term ((-3234048 : Rat) / 385571) [(0, 1), (1, 2), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-1064960 : Rat) / 158397) [(0, 1), (1, 2), (4, 1), (15, 2)],
  term ((-2156032 : Rat) / 385571) [(0, 1), (1, 2), (4, 1), (15, 2), (16, 1)],
  term ((1064960 : Rat) / 52799) [(0, 1), (1, 2), (5, 1), (8, 1), (15, 1)],
  term ((6468096 : Rat) / 385571) [(0, 1), (1, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((3673088 : Rat) / 52799) [(0, 1), (1, 2), (5, 1), (15, 1)],
  term ((9792912 : Rat) / 385571) [(0, 1), (1, 2), (5, 1), (15, 1), (16, 1)],
  term ((-6432640 : Rat) / 158397) [(0, 1), (1, 2), (7, 1), (15, 1)],
  term ((47655232 : Rat) / 385571) [(0, 1), (1, 2), (7, 1), (15, 1), (16, 1)],
  term ((-1064960 : Rat) / 158397) [(0, 1), (1, 2), (8, 1), (15, 2)],
  term ((-2156032 : Rat) / 385571) [(0, 1), (1, 2), (8, 1), (15, 2), (16, 1)],
  term ((1331200 : Rat) / 158397) [(0, 1), (1, 2), (9, 1), (15, 1)],
  term ((2695040 : Rat) / 385571) [(0, 1), (1, 2), (9, 1), (15, 1), (16, 1)],
  term ((3281792 : Rat) / 52799) [(0, 1), (1, 2), (15, 2)],
  term ((-8637792 : Rat) / 385571) [(0, 1), (1, 2), (15, 2), (16, 1)],
  term ((1064960 : Rat) / 158397) [(0, 1), (2, 1), (3, 1), (4, 1), (8, 1), (15, 1)],
  term ((2156032 : Rat) / 385571) [(0, 1), (2, 1), (3, 1), (4, 1), (8, 1), (15, 1), (16, 1)],
  term ((-3412736 : Rat) / 158397) [(0, 1), (2, 1), (3, 1), (8, 1), (15, 1)],
  term ((-39017440 : Rat) / 385571) [(0, 1), (2, 1), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((1064960 : Rat) / 158397) [(0, 1), (2, 1), (3, 1), (8, 2), (15, 1)],
  term ((2156032 : Rat) / 385571) [(0, 1), (2, 1), (3, 1), (8, 2), (15, 1), (16, 1)],
  term ((-1064960 : Rat) / 52799) [(0, 1), (2, 1), (4, 1), (5, 1), (8, 1), (15, 1)],
  term ((-6468096 : Rat) / 385571) [(0, 1), (2, 1), (4, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-2129920 : Rat) / 158397) [(0, 1), (2, 1), (4, 1), (8, 1), (15, 2)],
  term ((-4312064 : Rat) / 385571) [(0, 1), (2, 1), (4, 1), (8, 1), (15, 2), (16, 1)],
  term ((7346176 : Rat) / 52799) [(0, 1), (2, 1), (5, 1), (8, 1), (15, 1)],
  term ((19585824 : Rat) / 385571) [(0, 1), (2, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((2129920 : Rat) / 52799) [(0, 1), (2, 1), (5, 1), (8, 2), (15, 1)],
  term ((12936192 : Rat) / 385571) [(0, 1), (2, 1), (5, 1), (8, 2), (15, 1), (16, 1)],
  term ((-12865280 : Rat) / 158397) [(0, 1), (2, 1), (7, 1), (8, 1), (15, 1)],
  term ((95310464 : Rat) / 385571) [(0, 1), (2, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((2662400 : Rat) / 158397) [(0, 1), (2, 1), (8, 1), (9, 1), (15, 1)],
  term ((5390080 : Rat) / 385571) [(0, 1), (2, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((6563584 : Rat) / 52799) [(0, 1), (2, 1), (8, 1), (15, 2)],
  term ((-17275584 : Rat) / 385571) [(0, 1), (2, 1), (8, 1), (15, 2), (16, 1)],
  term ((-2129920 : Rat) / 158397) [(0, 1), (2, 1), (8, 2), (15, 2)],
  term ((-4312064 : Rat) / 385571) [(0, 1), (2, 1), (8, 2), (15, 2), (16, 1)],
  term ((-532480 : Rat) / 158397) [(0, 1), (2, 2), (3, 1), (4, 1), (15, 1)],
  term ((-1078016 : Rat) / 385571) [(0, 1), (2, 2), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((-532480 : Rat) / 158397) [(0, 1), (2, 2), (3, 1), (8, 1), (15, 1)],
  term ((-1078016 : Rat) / 385571) [(0, 1), (2, 2), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((1706368 : Rat) / 158397) [(0, 1), (2, 2), (3, 1), (15, 1)],
  term ((19508720 : Rat) / 385571) [(0, 1), (2, 2), (3, 1), (15, 1), (16, 1)],
  term ((532480 : Rat) / 52799) [(0, 1), (2, 2), (4, 1), (5, 1), (15, 1)],
  term ((3234048 : Rat) / 385571) [(0, 1), (2, 2), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((1064960 : Rat) / 158397) [(0, 1), (2, 2), (4, 1), (15, 2)],
  term ((2156032 : Rat) / 385571) [(0, 1), (2, 2), (4, 1), (15, 2), (16, 1)],
  term ((-1064960 : Rat) / 52799) [(0, 1), (2, 2), (5, 1), (8, 1), (15, 1)],
  term ((-6468096 : Rat) / 385571) [(0, 1), (2, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-3673088 : Rat) / 52799) [(0, 1), (2, 2), (5, 1), (15, 1)],
  term ((-9792912 : Rat) / 385571) [(0, 1), (2, 2), (5, 1), (15, 1), (16, 1)],
  term ((6432640 : Rat) / 158397) [(0, 1), (2, 2), (7, 1), (15, 1)],
  term ((-47655232 : Rat) / 385571) [(0, 1), (2, 2), (7, 1), (15, 1), (16, 1)],
  term ((1064960 : Rat) / 158397) [(0, 1), (2, 2), (8, 1), (15, 2)],
  term ((2156032 : Rat) / 385571) [(0, 1), (2, 2), (8, 1), (15, 2), (16, 1)],
  term ((-1331200 : Rat) / 158397) [(0, 1), (2, 2), (9, 1), (15, 1)],
  term ((-2695040 : Rat) / 385571) [(0, 1), (2, 2), (9, 1), (15, 1), (16, 1)],
  term ((-3281792 : Rat) / 52799) [(0, 1), (2, 2), (15, 2)],
  term ((8637792 : Rat) / 385571) [(0, 1), (2, 2), (15, 2), (16, 1)],
  term ((-1064960 : Rat) / 52799) [(0, 1), (3, 1), (4, 1), (5, 1), (9, 1), (15, 1)],
  term ((-6468096 : Rat) / 385571) [(0, 1), (3, 1), (4, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1782528 : Rat) / 52799) [(0, 1), (3, 1), (4, 1), (8, 1), (15, 1)],
  term ((-29015136 : Rat) / 385571) [(0, 1), (3, 1), (4, 1), (8, 1), (15, 1), (16, 1)],
  term ((-2129920 : Rat) / 158397) [(0, 1), (3, 1), (4, 1), (9, 1), (15, 2)],
  term ((-4312064 : Rat) / 385571) [(0, 1), (3, 1), (4, 1), (9, 1), (15, 2), (16, 1)],
  term ((2129920 : Rat) / 52799) [(0, 1), (3, 1), (5, 1), (8, 1), (9, 1), (15, 1)],
  term ((12936192 : Rat) / 385571) [(0, 1), (3, 1), (5, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((7346176 : Rat) / 52799) [(0, 1), (3, 1), (5, 1), (9, 1), (15, 1)],
  term ((19585824 : Rat) / 385571) [(0, 1), (3, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-12865280 : Rat) / 158397) [(0, 1), (3, 1), (7, 1), (9, 1), (15, 1)],
  term ((95310464 : Rat) / 385571) [(0, 1), (3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-2129920 : Rat) / 158397) [(0, 1), (3, 1), (8, 1), (9, 1), (15, 2)],
  term ((-4312064 : Rat) / 385571) [(0, 1), (3, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((3112960 : Rat) / 158397) [(0, 1), (3, 1), (8, 1), (10, 1), (15, 1)],
  term ((-3055360 : Rat) / 385571) [(0, 1), (3, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((512000 : Rat) / 52799) [(0, 1), (3, 1), (8, 1), (15, 1)],
  term ((-11511600 : Rat) / 385571) [(0, 1), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((1802240 : Rat) / 158397) [(0, 1), (3, 1), (8, 2), (15, 1)],
  term ((-3369536 : Rat) / 385571) [(0, 1), (3, 1), (8, 2), (15, 1), (16, 1)],
  term ((6563584 : Rat) / 52799) [(0, 1), (3, 1), (9, 1), (15, 2)],
  term ((-17275584 : Rat) / 385571) [(0, 1), (3, 1), (9, 1), (15, 2), (16, 1)],
  term ((2662400 : Rat) / 158397) [(0, 1), (3, 1), (9, 2), (15, 1)],
  term ((5390080 : Rat) / 385571) [(0, 1), (3, 1), (9, 2), (15, 1), (16, 1)],
  term ((532480 : Rat) / 52799) [(0, 1), (3, 2), (4, 1), (5, 1), (15, 1)],
  term ((3234048 : Rat) / 385571) [(0, 1), (3, 2), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((1064960 : Rat) / 158397) [(0, 1), (3, 2), (4, 1), (9, 1), (15, 1)],
  term ((2156032 : Rat) / 385571) [(0, 1), (3, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((1064960 : Rat) / 158397) [(0, 1), (3, 2), (4, 1), (15, 2)],
  term ((2156032 : Rat) / 385571) [(0, 1), (3, 2), (4, 1), (15, 2), (16, 1)],
  term ((-1064960 : Rat) / 52799) [(0, 1), (3, 2), (5, 1), (8, 1), (15, 1)],
  term ((-6468096 : Rat) / 385571) [(0, 1), (3, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-3673088 : Rat) / 52799) [(0, 1), (3, 2), (5, 1), (15, 1)],
  term ((-9792912 : Rat) / 385571) [(0, 1), (3, 2), (5, 1), (15, 1), (16, 1)],
  term ((6432640 : Rat) / 158397) [(0, 1), (3, 2), (7, 1), (15, 1)],
  term ((-47655232 : Rat) / 385571) [(0, 1), (3, 2), (7, 1), (15, 1), (16, 1)],
  term ((1064960 : Rat) / 158397) [(0, 1), (3, 2), (8, 1), (9, 1), (15, 1)],
  term ((2156032 : Rat) / 385571) [(0, 1), (3, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((1064960 : Rat) / 158397) [(0, 1), (3, 2), (8, 1), (15, 2)],
  term ((2156032 : Rat) / 385571) [(0, 1), (3, 2), (8, 1), (15, 2), (16, 1)],
  term ((-1581312 : Rat) / 52799) [(0, 1), (3, 2), (9, 1), (15, 1)],
  term ((-41712480 : Rat) / 385571) [(0, 1), (3, 2), (9, 1), (15, 1), (16, 1)],
  term ((-3281792 : Rat) / 52799) [(0, 1), (3, 2), (15, 2)],
  term ((8637792 : Rat) / 385571) [(0, 1), (3, 2), (15, 2), (16, 1)],
  term ((-532480 : Rat) / 158397) [(0, 1), (3, 3), (4, 1), (15, 1)],
  term ((-1078016 : Rat) / 385571) [(0, 1), (3, 3), (4, 1), (15, 1), (16, 1)],
  term ((-532480 : Rat) / 158397) [(0, 1), (3, 3), (8, 1), (15, 1)],
  term ((-1078016 : Rat) / 385571) [(0, 1), (3, 3), (8, 1), (15, 1), (16, 1)],
  term ((1706368 : Rat) / 158397) [(0, 1), (3, 3), (15, 1)],
  term ((19508720 : Rat) / 385571) [(0, 1), (3, 3), (15, 1), (16, 1)],
  term ((28908032 : Rat) / 158397) [(0, 1), (4, 1), (5, 1), (8, 1), (15, 1)],
  term ((-8265056 : Rat) / 385571) [(0, 1), (4, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-12865280 : Rat) / 158397) [(0, 1), (4, 1), (7, 1), (8, 1), (15, 1)],
  term ((95310464 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((1556480 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (9, 1), (15, 1)],
  term ((-4583040 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((23560448 : Rat) / 158397) [(0, 1), (4, 1), (8, 1), (15, 2)],
  term ((-37280192 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (15, 2), (16, 1)],
  term ((3112960 : Rat) / 52799) [(0, 1), (5, 1), (8, 1), (10, 1), (15, 1)],
  term ((-9166080 : Rat) / 385571) [(0, 1), (5, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((136832 : Rat) / 158397) [(0, 1), (5, 1), (8, 1), (15, 1)],
  term ((-10513472 : Rat) / 385571) [(0, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-7955968 : Rat) / 52799) [(0, 1), (5, 1), (8, 2), (15, 1)],
  term ((28528320 : Rat) / 385571) [(0, 1), (5, 1), (8, 2), (15, 1), (16, 1)],
  term ((901120 : Rat) / 158397) [(0, 1), (8, 1), (9, 1), (15, 1)],
  term ((-1684768 : Rat) / 385571) [(0, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-6225920 : Rat) / 158397) [(0, 1), (8, 1), (10, 1), (15, 2)],
  term ((6110720 : Rat) / 385571) [(0, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((1556480 : Rat) / 158397) [(0, 1), (8, 1), (11, 1), (15, 1)],
  term ((-1527680 : Rat) / 385571) [(0, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((3576704 : Rat) / 158397) [(0, 1), (8, 1), (15, 2)],
  term ((-8637584 : Rat) / 385571) [(0, 1), (8, 1), (15, 2), (16, 1)],
  term ((5734400 : Rat) / 158397) [(0, 1), (8, 2), (15, 2)],
  term ((-2427008 : Rat) / 385571) [(0, 1), (8, 2), (15, 2), (16, 1)],
  term ((-1064960 : Rat) / 158397) [(0, 2), (1, 1), (8, 1), (15, 1)],
  term ((-2156032 : Rat) / 385571) [(0, 2), (1, 1), (8, 1), (15, 1), (16, 1)],
  term ((-328768 : Rat) / 52799) [(0, 2), (1, 1), (15, 1)],
  term ((-10023864 : Rat) / 385571) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term ((-1064960 : Rat) / 158397) [(0, 2), (3, 1), (4, 1), (8, 1), (15, 1)],
  term ((-2156032 : Rat) / 385571) [(0, 2), (3, 1), (4, 1), (8, 1), (15, 1), (16, 1)],
  term ((891264 : Rat) / 52799) [(0, 2), (3, 1), (4, 1), (15, 1)],
  term ((14507568 : Rat) / 385571) [(0, 2), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((2511616 : Rat) / 158397) [(0, 2), (3, 1), (8, 1), (15, 1)],
  term ((40702208 : Rat) / 385571) [(0, 2), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((-1064960 : Rat) / 158397) [(0, 2), (3, 1), (8, 2), (15, 1)],
  term ((-2156032 : Rat) / 385571) [(0, 2), (3, 1), (8, 2), (15, 1), (16, 1)],
  term ((-1556480 : Rat) / 158397) [(0, 2), (3, 1), (10, 1), (15, 1)],
  term ((1527680 : Rat) / 385571) [(0, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-256000 : Rat) / 52799) [(0, 2), (3, 1), (15, 1)],
  term ((5755800 : Rat) / 385571) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((1064960 : Rat) / 52799) [(0, 2), (4, 1), (5, 1), (8, 1), (15, 1)],
  term ((6468096 : Rat) / 385571) [(0, 2), (4, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-14454016 : Rat) / 158397) [(0, 2), (4, 1), (5, 1), (15, 1)],
  term ((4132528 : Rat) / 385571) [(0, 2), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((6432640 : Rat) / 158397) [(0, 2), (4, 1), (7, 1), (15, 1)],
  term ((-47655232 : Rat) / 385571) [(0, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((2129920 : Rat) / 158397) [(0, 2), (4, 1), (8, 1), (15, 2)],
  term ((4312064 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (15, 2), (16, 1)],
  term ((-778240 : Rat) / 52799) [(0, 2), (4, 1), (9, 1), (15, 1)],
  term ((2291520 : Rat) / 385571) [(0, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-11780224 : Rat) / 158397) [(0, 2), (4, 1), (15, 2)],
  term ((18640096 : Rat) / 385571) [(0, 2), (4, 1), (15, 2), (16, 1)],
  term ((-3368192 : Rat) / 52799) [(0, 2), (5, 1), (8, 1), (15, 1)],
  term ((-33849984 : Rat) / 385571) [(0, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-2129920 : Rat) / 52799) [(0, 2), (5, 1), (8, 2), (15, 1)],
  term ((-12936192 : Rat) / 385571) [(0, 2), (5, 1), (8, 2), (15, 1), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(0, 2), (5, 1), (10, 1), (15, 1)],
  term ((4583040 : Rat) / 385571) [(0, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-68416 : Rat) / 158397) [(0, 2), (5, 1), (15, 1)],
  term ((5256736 : Rat) / 385571) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((12865280 : Rat) / 158397) [(0, 2), (7, 1), (8, 1), (15, 1)],
  term ((-95310464 : Rat) / 385571) [(0, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-2662400 : Rat) / 158397) [(0, 2), (8, 1), (9, 1), (15, 1)],
  term ((-5390080 : Rat) / 385571) [(0, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-22557952 : Rat) / 158397) [(0, 2), (8, 1), (15, 2)],
  term ((18489088 : Rat) / 385571) [(0, 2), (8, 1), (15, 2), (16, 1)],
  term ((2129920 : Rat) / 158397) [(0, 2), (8, 2), (15, 2)],
  term ((4312064 : Rat) / 385571) [(0, 2), (8, 2), (15, 2), (16, 1)],
  term ((-450560 : Rat) / 158397) [(0, 2), (9, 1), (15, 1)],
  term ((842384 : Rat) / 385571) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((3112960 : Rat) / 158397) [(0, 2), (10, 1), (15, 2)],
  term ((-3055360 : Rat) / 385571) [(0, 2), (10, 1), (15, 2), (16, 1)],
  term ((-778240 : Rat) / 158397) [(0, 2), (11, 1), (15, 1)],
  term ((763840 : Rat) / 385571) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1788352 : Rat) / 158397) [(0, 2), (15, 2)],
  term ((4318792 : Rat) / 385571) [(0, 2), (15, 2), (16, 1)],
  term ((532480 : Rat) / 158397) [(0, 3), (3, 1), (4, 1), (15, 1)],
  term ((1078016 : Rat) / 385571) [(0, 3), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((532480 : Rat) / 158397) [(0, 3), (3, 1), (8, 1), (15, 1)],
  term ((1078016 : Rat) / 385571) [(0, 3), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((-1706368 : Rat) / 158397) [(0, 3), (3, 1), (15, 1)],
  term ((-19508720 : Rat) / 385571) [(0, 3), (3, 1), (15, 1), (16, 1)],
  term ((-532480 : Rat) / 52799) [(0, 3), (4, 1), (5, 1), (15, 1)],
  term ((-3234048 : Rat) / 385571) [(0, 3), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-1064960 : Rat) / 158397) [(0, 3), (4, 1), (15, 2)],
  term ((-2156032 : Rat) / 385571) [(0, 3), (4, 1), (15, 2), (16, 1)],
  term ((1064960 : Rat) / 52799) [(0, 3), (5, 1), (8, 1), (15, 1)],
  term ((6468096 : Rat) / 385571) [(0, 3), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((3673088 : Rat) / 52799) [(0, 3), (5, 1), (15, 1)],
  term ((9792912 : Rat) / 385571) [(0, 3), (5, 1), (15, 1), (16, 1)],
  term ((-6432640 : Rat) / 158397) [(0, 3), (7, 1), (15, 1)],
  term ((47655232 : Rat) / 385571) [(0, 3), (7, 1), (15, 1), (16, 1)],
  term ((-1064960 : Rat) / 158397) [(0, 3), (8, 1), (15, 2)],
  term ((-2156032 : Rat) / 385571) [(0, 3), (8, 1), (15, 2), (16, 1)],
  term ((1331200 : Rat) / 158397) [(0, 3), (9, 1), (15, 1)],
  term ((2695040 : Rat) / 385571) [(0, 3), (9, 1), (15, 1), (16, 1)],
  term ((3281792 : Rat) / 52799) [(0, 3), (15, 2)],
  term ((-8637792 : Rat) / 385571) [(0, 3), (15, 2), (16, 1)],
  term ((-657536 : Rat) / 52799) [(1, 1), (2, 1), (8, 1), (15, 1)],
  term ((-20047728 : Rat) / 385571) [(1, 1), (2, 1), (8, 1), (15, 1), (16, 1)],
  term ((-2129920 : Rat) / 158397) [(1, 1), (2, 1), (8, 2), (15, 1)],
  term ((-4312064 : Rat) / 385571) [(1, 1), (2, 1), (8, 2), (15, 1), (16, 1)],
  term ((1064960 : Rat) / 158397) [(1, 1), (2, 2), (8, 1), (15, 1)],
  term ((2156032 : Rat) / 385571) [(1, 1), (2, 2), (8, 1), (15, 1), (16, 1)],
  term ((328768 : Rat) / 52799) [(1, 1), (2, 2), (15, 1)],
  term ((10023864 : Rat) / 385571) [(1, 1), (2, 2), (15, 1), (16, 1)],
  term ((-1782528 : Rat) / 52799) [(1, 1), (3, 1), (4, 1), (9, 1), (15, 1)],
  term ((-29015136 : Rat) / 385571) [(1, 1), (3, 1), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-327680 : Rat) / 158397) [(1, 1), (3, 1), (8, 1), (9, 1), (15, 1)],
  term ((-7681600 : Rat) / 385571) [(1, 1), (3, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((3112960 : Rat) / 158397) [(1, 1), (3, 1), (9, 1), (10, 1), (15, 1)],
  term ((-3055360 : Rat) / 385571) [(1, 1), (3, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-145536 : Rat) / 52799) [(1, 1), (3, 1), (9, 1), (15, 1)],
  term ((-31559328 : Rat) / 385571) [(1, 1), (3, 1), (9, 1), (15, 1), (16, 1)],
  term ((1064960 : Rat) / 158397) [(1, 1), (3, 2), (8, 1), (15, 1)],
  term ((2156032 : Rat) / 385571) [(1, 1), (3, 2), (8, 1), (15, 1), (16, 1)],
  term ((328768 : Rat) / 52799) [(1, 1), (3, 2), (15, 1)],
  term ((10023864 : Rat) / 385571) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((28908032 : Rat) / 158397) [(1, 1), (4, 1), (5, 1), (9, 1), (15, 1)],
  term ((-8265056 : Rat) / 385571) [(1, 1), (4, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-12865280 : Rat) / 158397) [(1, 1), (4, 1), (7, 1), (9, 1), (15, 1)],
  term ((95310464 : Rat) / 385571) [(1, 1), (4, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((23560448 : Rat) / 158397) [(1, 1), (4, 1), (9, 1), (15, 2)],
  term ((-37280192 : Rat) / 385571) [(1, 1), (4, 1), (9, 1), (15, 2), (16, 1)],
  term ((1556480 : Rat) / 52799) [(1, 1), (4, 1), (9, 2), (15, 1)],
  term ((-4583040 : Rat) / 385571) [(1, 1), (4, 1), (9, 2), (15, 1), (16, 1)],
  term ((-7955968 : Rat) / 52799) [(1, 1), (5, 1), (8, 1), (9, 1), (15, 1)],
  term ((28528320 : Rat) / 385571) [(1, 1), (5, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((3112960 : Rat) / 52799) [(1, 1), (5, 1), (9, 1), (10, 1), (15, 1)],
  term ((-9166080 : Rat) / 385571) [(1, 1), (5, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((136832 : Rat) / 158397) [(1, 1), (5, 1), (9, 1), (15, 1)],
  term ((-10513472 : Rat) / 385571) [(1, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((5734400 : Rat) / 158397) [(1, 1), (8, 1), (9, 1), (15, 2)],
  term ((-2427008 : Rat) / 385571) [(1, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-6225920 : Rat) / 158397) [(1, 1), (9, 1), (10, 1), (15, 2)],
  term ((6110720 : Rat) / 385571) [(1, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((1556480 : Rat) / 158397) [(1, 1), (9, 1), (11, 1), (15, 1)],
  term ((-1527680 : Rat) / 385571) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((3576704 : Rat) / 158397) [(1, 1), (9, 1), (15, 2)],
  term ((-8637584 : Rat) / 385571) [(1, 1), (9, 1), (15, 2), (16, 1)],
  term ((901120 : Rat) / 158397) [(1, 1), (9, 2), (15, 1)],
  term ((-1684768 : Rat) / 385571) [(1, 1), (9, 2), (15, 1), (16, 1)],
  term ((891264 : Rat) / 52799) [(1, 2), (3, 1), (4, 1), (15, 1)],
  term ((14507568 : Rat) / 385571) [(1, 2), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((-901120 : Rat) / 158397) [(1, 2), (3, 1), (8, 1), (15, 1)],
  term ((1684768 : Rat) / 385571) [(1, 2), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((-1556480 : Rat) / 158397) [(1, 2), (3, 1), (10, 1), (15, 1)],
  term ((1527680 : Rat) / 385571) [(1, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-256000 : Rat) / 52799) [(1, 2), (3, 1), (15, 1)],
  term ((5755800 : Rat) / 385571) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((-14454016 : Rat) / 158397) [(1, 2), (4, 1), (5, 1), (15, 1)],
  term ((4132528 : Rat) / 385571) [(1, 2), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((6432640 : Rat) / 158397) [(1, 2), (4, 1), (7, 1), (15, 1)],
  term ((-47655232 : Rat) / 385571) [(1, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-778240 : Rat) / 52799) [(1, 2), (4, 1), (9, 1), (15, 1)],
  term ((2291520 : Rat) / 385571) [(1, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-11780224 : Rat) / 158397) [(1, 2), (4, 1), (15, 2)],
  term ((18640096 : Rat) / 385571) [(1, 2), (4, 1), (15, 2), (16, 1)],
  term ((3977984 : Rat) / 52799) [(1, 2), (5, 1), (8, 1), (15, 1)],
  term ((-14264160 : Rat) / 385571) [(1, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(1, 2), (5, 1), (10, 1), (15, 1)],
  term ((4583040 : Rat) / 385571) [(1, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-68416 : Rat) / 158397) [(1, 2), (5, 1), (15, 1)],
  term ((5256736 : Rat) / 385571) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((2129920 : Rat) / 158397) [(1, 2), (8, 1), (9, 1), (15, 1)],
  term ((4312064 : Rat) / 385571) [(1, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-2867200 : Rat) / 158397) [(1, 2), (8, 1), (15, 2)],
  term ((1213504 : Rat) / 385571) [(1, 2), (8, 1), (15, 2), (16, 1)],
  term ((1522048 : Rat) / 158397) [(1, 2), (9, 1), (15, 1)],
  term ((20890112 : Rat) / 385571) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((3112960 : Rat) / 158397) [(1, 2), (10, 1), (15, 2)],
  term ((-3055360 : Rat) / 385571) [(1, 2), (10, 1), (15, 2), (16, 1)],
  term ((-778240 : Rat) / 158397) [(1, 2), (11, 1), (15, 1)],
  term ((763840 : Rat) / 385571) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1788352 : Rat) / 158397) [(1, 2), (15, 2)],
  term ((4318792 : Rat) / 385571) [(1, 2), (15, 2), (16, 1)],
  term ((-1064960 : Rat) / 158397) [(1, 3), (8, 1), (15, 1)],
  term ((-2156032 : Rat) / 385571) [(1, 3), (8, 1), (15, 1), (16, 1)],
  term ((-328768 : Rat) / 52799) [(1, 3), (15, 1)],
  term ((-10023864 : Rat) / 385571) [(1, 3), (15, 1), (16, 1)],
  term ((1782528 : Rat) / 52799) [(2, 1), (3, 1), (4, 1), (8, 1), (15, 1)],
  term ((29015136 : Rat) / 385571) [(2, 1), (3, 1), (4, 1), (8, 1), (15, 1), (16, 1)],
  term ((-3112960 : Rat) / 158397) [(2, 1), (3, 1), (8, 1), (10, 1), (15, 1)],
  term ((3055360 : Rat) / 385571) [(2, 1), (3, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-512000 : Rat) / 52799) [(2, 1), (3, 1), (8, 1), (15, 1)],
  term ((11511600 : Rat) / 385571) [(2, 1), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((-1802240 : Rat) / 158397) [(2, 1), (3, 1), (8, 2), (15, 1)],
  term ((3369536 : Rat) / 385571) [(2, 1), (3, 1), (8, 2), (15, 1), (16, 1)],
  term ((-28908032 : Rat) / 158397) [(2, 1), (4, 1), (5, 1), (8, 1), (15, 1)],
  term ((8265056 : Rat) / 385571) [(2, 1), (4, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((12865280 : Rat) / 158397) [(2, 1), (4, 1), (7, 1), (8, 1), (15, 1)],
  term ((-95310464 : Rat) / 385571) [(2, 1), (4, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(2, 1), (4, 1), (8, 1), (9, 1), (15, 1)],
  term ((4583040 : Rat) / 385571) [(2, 1), (4, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-23560448 : Rat) / 158397) [(2, 1), (4, 1), (8, 1), (15, 2)],
  term ((37280192 : Rat) / 385571) [(2, 1), (4, 1), (8, 1), (15, 2), (16, 1)],
  term ((-3112960 : Rat) / 52799) [(2, 1), (5, 1), (8, 1), (10, 1), (15, 1)],
  term ((9166080 : Rat) / 385571) [(2, 1), (5, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-136832 : Rat) / 158397) [(2, 1), (5, 1), (8, 1), (15, 1)],
  term ((10513472 : Rat) / 385571) [(2, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((7955968 : Rat) / 52799) [(2, 1), (5, 1), (8, 2), (15, 1)],
  term ((-28528320 : Rat) / 385571) [(2, 1), (5, 1), (8, 2), (15, 1), (16, 1)],
  term ((-901120 : Rat) / 158397) [(2, 1), (8, 1), (9, 1), (15, 1)],
  term ((1684768 : Rat) / 385571) [(2, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((6225920 : Rat) / 158397) [(2, 1), (8, 1), (10, 1), (15, 2)],
  term ((-6110720 : Rat) / 385571) [(2, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-1556480 : Rat) / 158397) [(2, 1), (8, 1), (11, 1), (15, 1)],
  term ((1527680 : Rat) / 385571) [(2, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3576704 : Rat) / 158397) [(2, 1), (8, 1), (15, 2)],
  term ((8637584 : Rat) / 385571) [(2, 1), (8, 1), (15, 2), (16, 1)],
  term ((-5734400 : Rat) / 158397) [(2, 1), (8, 2), (15, 2)],
  term ((2427008 : Rat) / 385571) [(2, 1), (8, 2), (15, 2), (16, 1)],
  term ((-891264 : Rat) / 52799) [(2, 2), (3, 1), (4, 1), (15, 1)],
  term ((-14507568 : Rat) / 385571) [(2, 2), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((901120 : Rat) / 158397) [(2, 2), (3, 1), (8, 1), (15, 1)],
  term ((-1684768 : Rat) / 385571) [(2, 2), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((1556480 : Rat) / 158397) [(2, 2), (3, 1), (10, 1), (15, 1)],
  term ((-1527680 : Rat) / 385571) [(2, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((256000 : Rat) / 52799) [(2, 2), (3, 1), (15, 1)],
  term ((-5755800 : Rat) / 385571) [(2, 2), (3, 1), (15, 1), (16, 1)],
  term ((14454016 : Rat) / 158397) [(2, 2), (4, 1), (5, 1), (15, 1)],
  term ((-4132528 : Rat) / 385571) [(2, 2), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-6432640 : Rat) / 158397) [(2, 2), (4, 1), (7, 1), (15, 1)],
  term ((47655232 : Rat) / 385571) [(2, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((778240 : Rat) / 52799) [(2, 2), (4, 1), (9, 1), (15, 1)],
  term ((-2291520 : Rat) / 385571) [(2, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((11780224 : Rat) / 158397) [(2, 2), (4, 1), (15, 2)],
  term ((-18640096 : Rat) / 385571) [(2, 2), (4, 1), (15, 2), (16, 1)],
  term ((-3977984 : Rat) / 52799) [(2, 2), (5, 1), (8, 1), (15, 1)],
  term ((14264160 : Rat) / 385571) [(2, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((1556480 : Rat) / 52799) [(2, 2), (5, 1), (10, 1), (15, 1)],
  term ((-4583040 : Rat) / 385571) [(2, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((68416 : Rat) / 158397) [(2, 2), (5, 1), (15, 1)],
  term ((-5256736 : Rat) / 385571) [(2, 2), (5, 1), (15, 1), (16, 1)],
  term ((2867200 : Rat) / 158397) [(2, 2), (8, 1), (15, 2)],
  term ((-1213504 : Rat) / 385571) [(2, 2), (8, 1), (15, 2), (16, 1)],
  term ((450560 : Rat) / 158397) [(2, 2), (9, 1), (15, 1)],
  term ((-842384 : Rat) / 385571) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((-3112960 : Rat) / 158397) [(2, 2), (10, 1), (15, 2)],
  term ((3055360 : Rat) / 385571) [(2, 2), (10, 1), (15, 2), (16, 1)],
  term ((778240 : Rat) / 158397) [(2, 2), (11, 1), (15, 1)],
  term ((-763840 : Rat) / 385571) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((1788352 : Rat) / 158397) [(2, 2), (15, 2)],
  term ((-4318792 : Rat) / 385571) [(2, 2), (15, 2), (16, 1)],
  term ((-28908032 : Rat) / 158397) [(3, 1), (4, 1), (5, 1), (9, 1), (15, 1)],
  term ((8265056 : Rat) / 385571) [(3, 1), (4, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((12865280 : Rat) / 158397) [(3, 1), (4, 1), (7, 1), (9, 1), (15, 1)],
  term ((-95310464 : Rat) / 385571) [(3, 1), (4, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-23560448 : Rat) / 158397) [(3, 1), (4, 1), (9, 1), (15, 2)],
  term ((37280192 : Rat) / 385571) [(3, 1), (4, 1), (9, 1), (15, 2), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(3, 1), (4, 1), (9, 2), (15, 1)],
  term ((4583040 : Rat) / 385571) [(3, 1), (4, 1), (9, 2), (15, 1), (16, 1)],
  term ((7955968 : Rat) / 52799) [(3, 1), (5, 1), (8, 1), (9, 1), (15, 1)],
  term ((-28528320 : Rat) / 385571) [(3, 1), (5, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-3112960 : Rat) / 52799) [(3, 1), (5, 1), (9, 1), (10, 1), (15, 1)],
  term ((9166080 : Rat) / 385571) [(3, 1), (5, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-136832 : Rat) / 158397) [(3, 1), (5, 1), (9, 1), (15, 1)],
  term ((10513472 : Rat) / 385571) [(3, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-5734400 : Rat) / 158397) [(3, 1), (8, 1), (9, 1), (15, 2)],
  term ((2427008 : Rat) / 385571) [(3, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((6225920 : Rat) / 158397) [(3, 1), (9, 1), (10, 1), (15, 2)],
  term ((-6110720 : Rat) / 385571) [(3, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-1556480 : Rat) / 158397) [(3, 1), (9, 1), (11, 1), (15, 1)],
  term ((1527680 : Rat) / 385571) [(3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3576704 : Rat) / 158397) [(3, 1), (9, 1), (15, 2)],
  term ((8637584 : Rat) / 385571) [(3, 1), (9, 1), (15, 2), (16, 1)],
  term ((-901120 : Rat) / 158397) [(3, 1), (9, 2), (15, 1)],
  term ((1684768 : Rat) / 385571) [(3, 1), (9, 2), (15, 1), (16, 1)],
  term ((14454016 : Rat) / 158397) [(3, 2), (4, 1), (5, 1), (15, 1)],
  term ((-4132528 : Rat) / 385571) [(3, 2), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-6432640 : Rat) / 158397) [(3, 2), (4, 1), (7, 1), (15, 1)],
  term ((47655232 : Rat) / 385571) [(3, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((2560768 : Rat) / 52799) [(3, 2), (4, 1), (9, 1), (15, 1)],
  term ((26723616 : Rat) / 385571) [(3, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((11780224 : Rat) / 158397) [(3, 2), (4, 1), (15, 2)],
  term ((-18640096 : Rat) / 385571) [(3, 2), (4, 1), (15, 2), (16, 1)],
  term ((-3977984 : Rat) / 52799) [(3, 2), (5, 1), (8, 1), (15, 1)],
  term ((14264160 : Rat) / 385571) [(3, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((1556480 : Rat) / 52799) [(3, 2), (5, 1), (10, 1), (15, 1)],
  term ((-4583040 : Rat) / 385571) [(3, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((68416 : Rat) / 158397) [(3, 2), (5, 1), (15, 1)],
  term ((-5256736 : Rat) / 385571) [(3, 2), (5, 1), (15, 1), (16, 1)],
  term ((-1802240 : Rat) / 158397) [(3, 2), (8, 1), (9, 1), (15, 1)],
  term ((3369536 : Rat) / 385571) [(3, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((2867200 : Rat) / 158397) [(3, 2), (8, 1), (15, 2)],
  term ((-1213504 : Rat) / 385571) [(3, 2), (8, 1), (15, 2), (16, 1)],
  term ((-3112960 : Rat) / 158397) [(3, 2), (9, 1), (10, 1), (15, 1)],
  term ((3055360 : Rat) / 385571) [(3, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1085440 : Rat) / 158397) [(3, 2), (9, 1), (15, 1)],
  term ((10669216 : Rat) / 385571) [(3, 2), (9, 1), (15, 1), (16, 1)],
  term ((-3112960 : Rat) / 158397) [(3, 2), (10, 1), (15, 2)],
  term ((3055360 : Rat) / 385571) [(3, 2), (10, 1), (15, 2), (16, 1)],
  term ((778240 : Rat) / 158397) [(3, 2), (11, 1), (15, 1)],
  term ((-763840 : Rat) / 385571) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((1788352 : Rat) / 158397) [(3, 2), (15, 2)],
  term ((-4318792 : Rat) / 385571) [(3, 2), (15, 2), (16, 1)],
  term ((-891264 : Rat) / 52799) [(3, 3), (4, 1), (15, 1)],
  term ((-14507568 : Rat) / 385571) [(3, 3), (4, 1), (15, 1), (16, 1)],
  term ((901120 : Rat) / 158397) [(3, 3), (8, 1), (15, 1)],
  term ((-1684768 : Rat) / 385571) [(3, 3), (8, 1), (15, 1), (16, 1)],
  term ((1556480 : Rat) / 158397) [(3, 3), (10, 1), (15, 1)],
  term ((-1527680 : Rat) / 385571) [(3, 3), (10, 1), (15, 1), (16, 1)],
  term ((256000 : Rat) / 52799) [(3, 3), (15, 1)],
  term ((-5755800 : Rat) / 385571) [(3, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 20, terms 0 through 57. -/
theorem rs_R005_ueqv_R005NYN_block_20_0000_0057_valid :
    checkProductSumEq rs_R005_ueqv_R005NYN_partials_20_0000_0057
      rs_R005_ueqv_R005NYN_block_20_0000_0057 = true := by
  native_decide

end R005UeqvR005NYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
