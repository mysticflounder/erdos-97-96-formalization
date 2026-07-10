/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R003:u=v:R003YY, term block 19:1000-1099

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R003UeqvR003YYTermShards

/-- Generator polynomial 19 for relaxed split surplus certificate `R003:u=v:R003YY`. -/
def rs_R003_ueqv_R003YY_generator_19_1000_1099 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(8, 1)]
]

/-- Coefficient term 1000 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1000 : Poly :=
[
  term ((-113 : Rat) / 21) [(1, 1), (6, 1), (15, 1)]
]

/-- Partial product 1000 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1000 : Poly :=
[
  term ((-226 : Rat) / 21) [(1, 1), (6, 1), (8, 1), (15, 1)],
  term ((113 : Rat) / 21) [(1, 1), (6, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1000 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1000_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1000
        rs_R003_ueqv_R003YY_generator_19_1000_1099 =
      rs_R003_ueqv_R003YY_partial_19_1000 := by
  native_decide

/-- Coefficient term 1001 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1001 : Poly :=
[
  term ((-33 : Rat) / 7) [(1, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 1001 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1001 : Poly :=
[
  term ((-66 : Rat) / 7) [(1, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((33 : Rat) / 7) [(1, 1), (6, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1001 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1001_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1001
        rs_R003_ueqv_R003YY_generator_19_1000_1099 =
      rs_R003_ueqv_R003YY_partial_19_1001 := by
  native_decide

/-- Coefficient term 1002 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1002 : Poly :=
[
  term ((1732 : Rat) / 5) [(1, 1), (8, 1), (9, 1)]
]

/-- Partial product 1002 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1002 : Poly :=
[
  term ((-1732 : Rat) / 5) [(1, 1), (8, 1), (9, 1)],
  term ((3464 : Rat) / 5) [(1, 1), (8, 2), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1002 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1002_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1002
        rs_R003_ueqv_R003YY_generator_19_1000_1099 =
      rs_R003_ueqv_R003YY_partial_19_1002 := by
  native_decide

/-- Coefficient term 1003 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1003 : Poly :=
[
  term ((45861024 : Rat) / 53375) [(1, 1), (8, 1), (9, 1), (11, 1), (13, 1)]
]

/-- Partial product 1003 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1003 : Poly :=
[
  term ((-45861024 : Rat) / 53375) [(1, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((91722048 : Rat) / 53375) [(1, 1), (8, 2), (9, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1003 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1003_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1003
        rs_R003_ueqv_R003YY_generator_19_1000_1099 =
      rs_R003_ueqv_R003YY_partial_19_1003 := by
  native_decide

/-- Coefficient term 1004 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1004 : Poly :=
[
  term ((-36864 : Rat) / 35) [(1, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 1004 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1004 : Poly :=
[
  term ((36864 : Rat) / 35) [(1, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((-73728 : Rat) / 35) [(1, 1), (8, 2), (9, 1), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1004 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1004_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1004
        rs_R003_ueqv_R003YY_generator_19_1000_1099 =
      rs_R003_ueqv_R003YY_partial_19_1004 := by
  native_decide

/-- Coefficient term 1005 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1005 : Poly :=
[
  term ((12288 : Rat) / 35) [(1, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1005 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1005 : Poly :=
[
  term ((-12288 : Rat) / 35) [(1, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((24576 : Rat) / 35) [(1, 1), (8, 2), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1005 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1005_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1005
        rs_R003_ueqv_R003YY_generator_19_1000_1099 =
      rs_R003_ueqv_R003YY_partial_19_1005 := by
  native_decide

/-- Coefficient term 1006 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1006 : Poly :=
[
  term ((-9984 : Rat) / 35) [(1, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 1006 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1006 : Poly :=
[
  term ((9984 : Rat) / 35) [(1, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-19968 : Rat) / 35) [(1, 1), (8, 2), (9, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1006 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1006_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1006
        rs_R003_ueqv_R003YY_generator_19_1000_1099 =
      rs_R003_ueqv_R003YY_partial_19_1006 := by
  native_decide

/-- Coefficient term 1007 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1007 : Poly :=
[
  term ((2096 : Rat) / 7) [(1, 1), (8, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 1007 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1007 : Poly :=
[
  term ((-2096 : Rat) / 7) [(1, 1), (8, 1), (9, 1), (11, 1), (15, 1)],
  term ((4192 : Rat) / 7) [(1, 1), (8, 2), (9, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1007 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1007_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1007
        rs_R003_ueqv_R003YY_generator_19_1000_1099 =
      rs_R003_ueqv_R003YY_partial_19_1007 := by
  native_decide

/-- Coefficient term 1008 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1008 : Poly :=
[
  term ((-1392 : Rat) / 35) [(1, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1008 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1008 : Poly :=
[
  term ((1392 : Rat) / 35) [(1, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2784 : Rat) / 35) [(1, 1), (8, 2), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1008 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1008_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1008
        rs_R003_ueqv_R003YY_generator_19_1000_1099 =
      rs_R003_ueqv_R003YY_partial_19_1008 := by
  native_decide

/-- Coefficient term 1009 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1009 : Poly :=
[
  term ((-1568 : Rat) / 5) [(1, 1), (8, 1), (9, 1), (14, 1)]
]

/-- Partial product 1009 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1009 : Poly :=
[
  term ((1568 : Rat) / 5) [(1, 1), (8, 1), (9, 1), (14, 1)],
  term ((-3136 : Rat) / 5) [(1, 1), (8, 2), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1009 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1009_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1009
        rs_R003_ueqv_R003YY_generator_19_1000_1099 =
      rs_R003_ueqv_R003YY_partial_19_1009 := by
  native_decide

/-- Coefficient term 1010 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1010 : Poly :=
[
  term ((2 : Rat) / 5) [(1, 1), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 1010 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1010 : Poly :=
[
  term ((-2 : Rat) / 5) [(1, 1), (8, 1), (9, 1), (16, 1)],
  term ((4 : Rat) / 5) [(1, 1), (8, 2), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1010 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1010_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1010
        rs_R003_ueqv_R003YY_generator_19_1000_1099 =
      rs_R003_ueqv_R003YY_partial_19_1010 := by
  native_decide

/-- Coefficient term 1011 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1011 : Poly :=
[
  term ((-5161144 : Rat) / 53375) [(1, 1), (8, 1), (10, 1), (13, 1)]
]

/-- Partial product 1011 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1011 : Poly :=
[
  term ((5161144 : Rat) / 53375) [(1, 1), (8, 1), (10, 1), (13, 1)],
  term ((-10322288 : Rat) / 53375) [(1, 1), (8, 2), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1011 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1011_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1011
        rs_R003_ueqv_R003YY_generator_19_1000_1099 =
      rs_R003_ueqv_R003YY_partial_19_1011 := by
  native_decide

/-- Coefficient term 1012 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1012 : Poly :=
[
  term ((4224 : Rat) / 35) [(1, 1), (8, 1), (10, 1), (13, 1), (14, 1)]
]

/-- Partial product 1012 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1012 : Poly :=
[
  term ((-4224 : Rat) / 35) [(1, 1), (8, 1), (10, 1), (13, 1), (14, 1)],
  term ((8448 : Rat) / 35) [(1, 1), (8, 2), (10, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1012 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1012_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1012
        rs_R003_ueqv_R003YY_generator_19_1000_1099 =
      rs_R003_ueqv_R003YY_partial_19_1012 := by
  native_decide

/-- Coefficient term 1013 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1013 : Poly :=
[
  term ((-1408 : Rat) / 35) [(1, 1), (8, 1), (10, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1013 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1013 : Poly :=
[
  term ((1408 : Rat) / 35) [(1, 1), (8, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2816 : Rat) / 35) [(1, 1), (8, 2), (10, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1013 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1013_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1013
        rs_R003_ueqv_R003YY_generator_19_1000_1099 =
      rs_R003_ueqv_R003YY_partial_19_1013 := by
  native_decide

/-- Coefficient term 1014 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1014 : Poly :=
[
  term ((1144 : Rat) / 35) [(1, 1), (8, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 1014 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1014 : Poly :=
[
  term ((-1144 : Rat) / 35) [(1, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((2288 : Rat) / 35) [(1, 1), (8, 2), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1014 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1014_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1014
        rs_R003_ueqv_R003YY_generator_19_1000_1099 =
      rs_R003_ueqv_R003YY_partial_19_1014 := by
  native_decide

/-- Coefficient term 1015 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1015 : Poly :=
[
  term ((17743 : Rat) / 210) [(1, 1), (8, 1), (10, 1), (15, 1)]
]

/-- Partial product 1015 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1015 : Poly :=
[
  term ((-17743 : Rat) / 210) [(1, 1), (8, 1), (10, 1), (15, 1)],
  term ((17743 : Rat) / 105) [(1, 1), (8, 2), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1015 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1015_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1015
        rs_R003_ueqv_R003YY_generator_19_1000_1099 =
      rs_R003_ueqv_R003YY_partial_19_1015 := by
  native_decide

/-- Coefficient term 1016 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1016 : Poly :=
[
  term ((-121 : Rat) / 14) [(1, 1), (8, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 1016 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1016 : Poly :=
[
  term ((121 : Rat) / 14) [(1, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-121 : Rat) / 7) [(1, 1), (8, 2), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1016 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1016_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1016
        rs_R003_ueqv_R003YY_generator_19_1000_1099 =
      rs_R003_ueqv_R003YY_partial_19_1016 := by
  native_decide

/-- Coefficient term 1017 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1017 : Poly :=
[
  term ((-1222 : Rat) / 35) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 1017 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1017 : Poly :=
[
  term ((1222 : Rat) / 35) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-2444 : Rat) / 35) [(1, 1), (8, 2), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1017 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1017_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1017
        rs_R003_ueqv_R003YY_generator_19_1000_1099 =
      rs_R003_ueqv_R003YY_partial_19_1017 := by
  native_decide

/-- Coefficient term 1018 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1018 : Poly :=
[
  term ((30 : Rat) / 7) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1018 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1018 : Poly :=
[
  term ((-30 : Rat) / 7) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((60 : Rat) / 7) [(1, 1), (8, 2), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1018 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1018_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1018
        rs_R003_ueqv_R003YY_generator_19_1000_1099 =
      rs_R003_ueqv_R003YY_partial_19_1018 := by
  native_decide

/-- Coefficient term 1019 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1019 : Poly :=
[
  term ((-572784 : Rat) / 10675) [(1, 1), (8, 1), (11, 1), (13, 2)]
]

/-- Partial product 1019 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1019 : Poly :=
[
  term ((572784 : Rat) / 10675) [(1, 1), (8, 1), (11, 1), (13, 2)],
  term ((-1145568 : Rat) / 10675) [(1, 1), (8, 2), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1019 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1019_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1019
        rs_R003_ueqv_R003YY_generator_19_1000_1099 =
      rs_R003_ueqv_R003YY_partial_19_1019 := by
  native_decide

/-- Coefficient term 1020 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1020 : Poly :=
[
  term ((2304 : Rat) / 35) [(1, 1), (8, 1), (11, 1), (13, 2), (14, 1)]
]

/-- Partial product 1020 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1020 : Poly :=
[
  term ((-2304 : Rat) / 35) [(1, 1), (8, 1), (11, 1), (13, 2), (14, 1)],
  term ((4608 : Rat) / 35) [(1, 1), (8, 2), (11, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1020 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1020_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1020
        rs_R003_ueqv_R003YY_generator_19_1000_1099 =
      rs_R003_ueqv_R003YY_partial_19_1020 := by
  native_decide

/-- Coefficient term 1021 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1021 : Poly :=
[
  term ((-768 : Rat) / 35) [(1, 1), (8, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 1021 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1021 : Poly :=
[
  term ((768 : Rat) / 35) [(1, 1), (8, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-1536 : Rat) / 35) [(1, 1), (8, 2), (11, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1021 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1021_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1021
        rs_R003_ueqv_R003YY_generator_19_1000_1099 =
      rs_R003_ueqv_R003YY_partial_19_1021 := by
  native_decide

/-- Coefficient term 1022 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1022 : Poly :=
[
  term ((624 : Rat) / 35) [(1, 1), (8, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 1022 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1022 : Poly :=
[
  term ((-624 : Rat) / 35) [(1, 1), (8, 1), (11, 1), (13, 2), (16, 1)],
  term ((1248 : Rat) / 35) [(1, 1), (8, 2), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1022 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1022_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1022
        rs_R003_ueqv_R003YY_generator_19_1000_1099 =
      rs_R003_ueqv_R003YY_partial_19_1022 := by
  native_decide

/-- Coefficient term 1023 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1023 : Poly :=
[
  term ((-16241648 : Rat) / 53375) [(1, 1), (8, 1), (11, 2), (13, 1)]
]

/-- Partial product 1023 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1023 : Poly :=
[
  term ((16241648 : Rat) / 53375) [(1, 1), (8, 1), (11, 2), (13, 1)],
  term ((-32483296 : Rat) / 53375) [(1, 1), (8, 2), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1023 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1023_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1023
        rs_R003_ueqv_R003YY_generator_19_1000_1099 =
      rs_R003_ueqv_R003YY_partial_19_1023 := by
  native_decide

/-- Coefficient term 1024 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1024 : Poly :=
[
  term ((13056 : Rat) / 35) [(1, 1), (8, 1), (11, 2), (13, 1), (14, 1)]
]

/-- Partial product 1024 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1024 : Poly :=
[
  term ((-13056 : Rat) / 35) [(1, 1), (8, 1), (11, 2), (13, 1), (14, 1)],
  term ((26112 : Rat) / 35) [(1, 1), (8, 2), (11, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1024 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1024_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1024
        rs_R003_ueqv_R003YY_generator_19_1000_1099 =
      rs_R003_ueqv_R003YY_partial_19_1024 := by
  native_decide

/-- Coefficient term 1025 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1025 : Poly :=
[
  term ((-4352 : Rat) / 35) [(1, 1), (8, 1), (11, 2), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1025 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1025 : Poly :=
[
  term ((4352 : Rat) / 35) [(1, 1), (8, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-8704 : Rat) / 35) [(1, 1), (8, 2), (11, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1025 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1025_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1025
        rs_R003_ueqv_R003YY_generator_19_1000_1099 =
      rs_R003_ueqv_R003YY_partial_19_1025 := by
  native_decide

/-- Coefficient term 1026 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1026 : Poly :=
[
  term ((3536 : Rat) / 35) [(1, 1), (8, 1), (11, 2), (13, 1), (16, 1)]
]

/-- Partial product 1026 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1026 : Poly :=
[
  term ((-3536 : Rat) / 35) [(1, 1), (8, 1), (11, 2), (13, 1), (16, 1)],
  term ((7072 : Rat) / 35) [(1, 1), (8, 2), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1026 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1026_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1026
        rs_R003_ueqv_R003YY_generator_19_1000_1099 =
      rs_R003_ueqv_R003YY_partial_19_1026 := by
  native_decide

/-- Coefficient term 1027 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1027 : Poly :=
[
  term ((-4898 : Rat) / 105) [(1, 1), (8, 1), (11, 2), (15, 1)]
]

/-- Partial product 1027 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1027 : Poly :=
[
  term ((4898 : Rat) / 105) [(1, 1), (8, 1), (11, 2), (15, 1)],
  term ((-9796 : Rat) / 105) [(1, 1), (8, 2), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1027 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1027_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1027
        rs_R003_ueqv_R003YY_generator_19_1000_1099 =
      rs_R003_ueqv_R003YY_partial_19_1027 := by
  native_decide

/-- Coefficient term 1028 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1028 : Poly :=
[
  term ((262 : Rat) / 35) [(1, 1), (8, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 1028 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1028 : Poly :=
[
  term ((-262 : Rat) / 35) [(1, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((524 : Rat) / 35) [(1, 1), (8, 2), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1028 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1028_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1028
        rs_R003_ueqv_R003YY_generator_19_1000_1099 =
      rs_R003_ueqv_R003YY_partial_19_1028 := by
  native_decide

/-- Coefficient term 1029 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1029 : Poly :=
[
  term ((-124696 : Rat) / 10675) [(1, 1), (8, 1), (12, 1), (13, 1)]
]

/-- Partial product 1029 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1029 : Poly :=
[
  term ((124696 : Rat) / 10675) [(1, 1), (8, 1), (12, 1), (13, 1)],
  term ((-249392 : Rat) / 10675) [(1, 1), (8, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1029 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1029_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1029
        rs_R003_ueqv_R003YY_generator_19_1000_1099 =
      rs_R003_ueqv_R003YY_partial_19_1029 := by
  native_decide

/-- Coefficient term 1030 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1030 : Poly :=
[
  term ((384 : Rat) / 35) [(1, 1), (8, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 1030 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1030 : Poly :=
[
  term ((-384 : Rat) / 35) [(1, 1), (8, 1), (12, 1), (13, 1), (14, 1)],
  term ((768 : Rat) / 35) [(1, 1), (8, 2), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1030 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1030_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1030
        rs_R003_ueqv_R003YY_generator_19_1000_1099 =
      rs_R003_ueqv_R003YY_partial_19_1030 := by
  native_decide

/-- Coefficient term 1031 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1031 : Poly :=
[
  term ((-128 : Rat) / 35) [(1, 1), (8, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1031 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1031 : Poly :=
[
  term ((128 : Rat) / 35) [(1, 1), (8, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-256 : Rat) / 35) [(1, 1), (8, 2), (12, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1031 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1031_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1031
        rs_R003_ueqv_R003YY_generator_19_1000_1099 =
      rs_R003_ueqv_R003YY_partial_19_1031 := by
  native_decide

/-- Coefficient term 1032 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1032 : Poly :=
[
  term ((104 : Rat) / 35) [(1, 1), (8, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 1032 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1032 : Poly :=
[
  term ((-104 : Rat) / 35) [(1, 1), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((208 : Rat) / 35) [(1, 1), (8, 2), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1032 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1032_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1032
        rs_R003_ueqv_R003YY_generator_19_1000_1099 =
      rs_R003_ueqv_R003YY_partial_19_1032 := by
  native_decide

/-- Coefficient term 1033 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1033 : Poly :=
[
  term ((-16516 : Rat) / 525) [(1, 1), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 1033 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1033 : Poly :=
[
  term ((16516 : Rat) / 525) [(1, 1), (8, 1), (12, 1), (15, 1)],
  term ((-33032 : Rat) / 525) [(1, 1), (8, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1033 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1033_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1033
        rs_R003_ueqv_R003YY_generator_19_1000_1099 =
      rs_R003_ueqv_R003YY_partial_19_1033 := by
  native_decide

/-- Coefficient term 1034 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1034 : Poly :=
[
  term ((4 : Rat) / 35) [(1, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1034 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1034 : Poly :=
[
  term ((-4 : Rat) / 35) [(1, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 35) [(1, 1), (8, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1034 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1034_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1034
        rs_R003_ueqv_R003YY_generator_19_1000_1099 =
      rs_R003_ueqv_R003YY_partial_19_1034 := by
  native_decide

/-- Coefficient term 1035 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1035 : Poly :=
[
  term ((713936 : Rat) / 7625) [(1, 1), (8, 1), (13, 1)]
]

/-- Partial product 1035 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1035 : Poly :=
[
  term ((-713936 : Rat) / 7625) [(1, 1), (8, 1), (13, 1)],
  term ((1427872 : Rat) / 7625) [(1, 1), (8, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1035 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1035_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1035
        rs_R003_ueqv_R003YY_generator_19_1000_1099 =
      rs_R003_ueqv_R003YY_partial_19_1035 := by
  native_decide

/-- Coefficient term 1036 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1036 : Poly :=
[
  term ((-576 : Rat) / 5) [(1, 1), (8, 1), (13, 1), (14, 1)]
]

/-- Partial product 1036 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1036 : Poly :=
[
  term ((576 : Rat) / 5) [(1, 1), (8, 1), (13, 1), (14, 1)],
  term ((-1152 : Rat) / 5) [(1, 1), (8, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1036 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1036_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1036
        rs_R003_ueqv_R003YY_generator_19_1000_1099 =
      rs_R003_ueqv_R003YY_partial_19_1036 := by
  native_decide

/-- Coefficient term 1037 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1037 : Poly :=
[
  term ((256 : Rat) / 5) [(1, 1), (8, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1037 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1037 : Poly :=
[
  term ((-256 : Rat) / 5) [(1, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((512 : Rat) / 5) [(1, 1), (8, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1037 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1037_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1037
        rs_R003_ueqv_R003YY_generator_19_1000_1099 =
      rs_R003_ueqv_R003YY_partial_19_1037 := by
  native_decide

/-- Coefficient term 1038 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1038 : Poly :=
[
  term ((-206 : Rat) / 5) [(1, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 1038 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1038 : Poly :=
[
  term ((206 : Rat) / 5) [(1, 1), (8, 1), (13, 1), (16, 1)],
  term ((-412 : Rat) / 5) [(1, 1), (8, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1038 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1038_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1038
        rs_R003_ueqv_R003YY_generator_19_1000_1099 =
      rs_R003_ueqv_R003YY_partial_19_1038 := by
  native_decide

/-- Coefficient term 1039 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1039 : Poly :=
[
  term ((-133 : Rat) / 5) [(1, 1), (8, 1), (15, 1)]
]

/-- Partial product 1039 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1039 : Poly :=
[
  term ((133 : Rat) / 5) [(1, 1), (8, 1), (15, 1)],
  term ((-266 : Rat) / 5) [(1, 1), (8, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1039 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1039_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1039
        rs_R003_ueqv_R003YY_generator_19_1000_1099 =
      rs_R003_ueqv_R003YY_partial_19_1039 := by
  native_decide

/-- Coefficient term 1040 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1040 : Poly :=
[
  term ((41 : Rat) / 5) [(1, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 1040 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1040 : Poly :=
[
  term ((-41 : Rat) / 5) [(1, 1), (8, 1), (15, 1), (16, 1)],
  term ((82 : Rat) / 5) [(1, 1), (8, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1040 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1040_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1040
        rs_R003_ueqv_R003YY_generator_19_1000_1099 =
      rs_R003_ueqv_R003YY_partial_19_1040 := by
  native_decide

/-- Coefficient term 1041 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1041 : Poly :=
[
  term ((-1398 : Rat) / 5) [(1, 1), (9, 1)]
]

/-- Partial product 1041 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1041 : Poly :=
[
  term ((-2796 : Rat) / 5) [(1, 1), (8, 1), (9, 1)],
  term ((1398 : Rat) / 5) [(1, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1041 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1041_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1041
        rs_R003_ueqv_R003YY_generator_19_1000_1099 =
      rs_R003_ueqv_R003YY_partial_19_1041 := by
  native_decide

/-- Coefficient term 1042 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1042 : Poly :=
[
  term ((-50646992 : Rat) / 53375) [(1, 1), (9, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 1042 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1042 : Poly :=
[
  term ((-101293984 : Rat) / 53375) [(1, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((50646992 : Rat) / 53375) [(1, 1), (9, 1), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1042 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1042_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1042
        rs_R003_ueqv_R003YY_generator_19_1000_1099 =
      rs_R003_ueqv_R003YY_partial_19_1042 := by
  native_decide

/-- Coefficient term 1043 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1043 : Poly :=
[
  term ((40704 : Rat) / 35) [(1, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 1043 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1043 : Poly :=
[
  term ((81408 : Rat) / 35) [(1, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-40704 : Rat) / 35) [(1, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1043 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1043_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1043
        rs_R003_ueqv_R003YY_generator_19_1000_1099 =
      rs_R003_ueqv_R003YY_partial_19_1043 := by
  native_decide

/-- Coefficient term 1044 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1044 : Poly :=
[
  term ((-13568 : Rat) / 35) [(1, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1044 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1044 : Poly :=
[
  term ((-27136 : Rat) / 35) [(1, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((13568 : Rat) / 35) [(1, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1044 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1044_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1044
        rs_R003_ueqv_R003YY_generator_19_1000_1099 =
      rs_R003_ueqv_R003YY_partial_19_1044 := by
  native_decide

/-- Coefficient term 1045 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1045 : Poly :=
[
  term ((11024 : Rat) / 35) [(1, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 1045 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1045 : Poly :=
[
  term ((22048 : Rat) / 35) [(1, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-11024 : Rat) / 35) [(1, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1045 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1045_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1045
        rs_R003_ueqv_R003YY_generator_19_1000_1099 =
      rs_R003_ueqv_R003YY_partial_19_1045 := by
  native_decide

/-- Coefficient term 1046 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1046 : Poly :=
[
  term ((-36983 : Rat) / 105) [(1, 1), (9, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 1046 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1046 : Poly :=
[
  term ((-73966 : Rat) / 105) [(1, 1), (8, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((36983 : Rat) / 105) [(1, 1), (9, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1046 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1046_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1046
        rs_R003_ueqv_R003YY_generator_19_1000_1099 =
      rs_R003_ueqv_R003YY_partial_19_1046 := by
  native_decide

/-- Coefficient term 1047 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1047 : Poly :=
[
  term ((1621 : Rat) / 35) [(1, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1047 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1047 : Poly :=
[
  term ((3242 : Rat) / 35) [(1, 1), (8, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1621 : Rat) / 35) [(1, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1047 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1047_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1047
        rs_R003_ueqv_R003YY_generator_19_1000_1099 =
      rs_R003_ueqv_R003YY_partial_19_1047 := by
  native_decide

/-- Coefficient term 1048 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1048 : Poly :=
[
  term ((-5543296 : Rat) / 10675) [(1, 1), (9, 1), (11, 1), (13, 1)]
]

/-- Partial product 1048 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1048 : Poly :=
[
  term ((-11086592 : Rat) / 10675) [(1, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((5543296 : Rat) / 10675) [(1, 1), (9, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1048 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1048_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1048
        rs_R003_ueqv_R003YY_generator_19_1000_1099 =
      rs_R003_ueqv_R003YY_partial_19_1048 := by
  native_decide

/-- Coefficient term 1049 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1049 : Poly :=
[
  term ((22272 : Rat) / 35) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 1049 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1049 : Poly :=
[
  term ((44544 : Rat) / 35) [(1, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((-22272 : Rat) / 35) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1049 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1049_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1049
        rs_R003_ueqv_R003YY_generator_19_1000_1099 =
      rs_R003_ueqv_R003YY_partial_19_1049 := by
  native_decide

/-- Coefficient term 1050 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1050 : Poly :=
[
  term ((-7424 : Rat) / 35) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1050 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1050 : Poly :=
[
  term ((-14848 : Rat) / 35) [(1, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((7424 : Rat) / 35) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1050 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1050_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1050
        rs_R003_ueqv_R003YY_generator_19_1000_1099 =
      rs_R003_ueqv_R003YY_partial_19_1050 := by
  native_decide

/-- Coefficient term 1051 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1051 : Poly :=
[
  term ((6032 : Rat) / 35) [(1, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 1051 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1051 : Poly :=
[
  term ((12064 : Rat) / 35) [(1, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-6032 : Rat) / 35) [(1, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1051 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1051_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1051
        rs_R003_ueqv_R003YY_generator_19_1000_1099 =
      rs_R003_ueqv_R003YY_partial_19_1051 := by
  native_decide

/-- Coefficient term 1052 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1052 : Poly :=
[
  term ((-21263 : Rat) / 105) [(1, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 1052 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1052 : Poly :=
[
  term ((-42526 : Rat) / 105) [(1, 1), (8, 1), (9, 1), (11, 1), (15, 1)],
  term ((21263 : Rat) / 105) [(1, 1), (9, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1052 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1052_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1052
        rs_R003_ueqv_R003YY_generator_19_1000_1099 =
      rs_R003_ueqv_R003YY_partial_19_1052 := by
  native_decide

/-- Coefficient term 1053 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1053 : Poly :=
[
  term ((185 : Rat) / 7) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1053 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1053 : Poly :=
[
  term ((370 : Rat) / 7) [(1, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-185 : Rat) / 7) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1053 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1053_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1053
        rs_R003_ueqv_R003YY_generator_19_1000_1099 =
      rs_R003_ueqv_R003YY_partial_19_1053 := by
  native_decide

/-- Coefficient term 1054 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1054 : Poly :=
[
  term ((-2264 : Rat) / 5) [(1, 1), (9, 1), (12, 1)]
]

/-- Partial product 1054 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1054 : Poly :=
[
  term ((-4528 : Rat) / 5) [(1, 1), (8, 1), (9, 1), (12, 1)],
  term ((2264 : Rat) / 5) [(1, 1), (9, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1054 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1054_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1054
        rs_R003_ueqv_R003YY_generator_19_1000_1099 =
      rs_R003_ueqv_R003YY_partial_19_1054 := by
  native_decide

/-- Coefficient term 1055 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1055 : Poly :=
[
  term ((2064 : Rat) / 5) [(1, 1), (9, 1), (12, 1), (14, 1)]
]

/-- Partial product 1055 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1055 : Poly :=
[
  term ((4128 : Rat) / 5) [(1, 1), (8, 1), (9, 1), (12, 1), (14, 1)],
  term ((-2064 : Rat) / 5) [(1, 1), (9, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1055 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1055_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1055
        rs_R003_ueqv_R003YY_generator_19_1000_1099 =
      rs_R003_ueqv_R003YY_partial_19_1055 := by
  native_decide

/-- Coefficient term 1056 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1056 : Poly :=
[
  term ((-4 : Rat) / 5) [(1, 1), (9, 1), (12, 1), (16, 1)]
]

/-- Partial product 1056 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1056 : Poly :=
[
  term ((-8 : Rat) / 5) [(1, 1), (8, 1), (9, 1), (12, 1), (16, 1)],
  term ((4 : Rat) / 5) [(1, 1), (9, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1056 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1056_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1056
        rs_R003_ueqv_R003YY_generator_19_1000_1099 =
      rs_R003_ueqv_R003YY_partial_19_1056 := by
  native_decide

/-- Coefficient term 1057 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1057 : Poly :=
[
  term (256 : Rat) [(1, 1), (9, 1), (14, 1)]
]

/-- Partial product 1057 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1057 : Poly :=
[
  term (512 : Rat) [(1, 1), (8, 1), (9, 1), (14, 1)],
  term (-256 : Rat) [(1, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1057 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1057_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1057
        rs_R003_ueqv_R003YY_generator_19_1000_1099 =
      rs_R003_ueqv_R003YY_partial_19_1057 := by
  native_decide

/-- Coefficient term 1058 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1058 : Poly :=
[
  term ((-3 : Rat) / 5) [(1, 1), (9, 1), (16, 1)]
]

/-- Partial product 1058 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1058 : Poly :=
[
  term ((-6 : Rat) / 5) [(1, 1), (8, 1), (9, 1), (16, 1)],
  term ((3 : Rat) / 5) [(1, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1058 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1058_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1058
        rs_R003_ueqv_R003YY_generator_19_1000_1099 =
      rs_R003_ueqv_R003YY_partial_19_1058 := by
  native_decide

/-- Coefficient term 1059 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1059 : Poly :=
[
  term ((-9209 : Rat) / 35) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 1059 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1059 : Poly :=
[
  term ((-18418 : Rat) / 35) [(1, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((9209 : Rat) / 35) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1059 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1059_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1059
        rs_R003_ueqv_R003YY_generator_19_1000_1099 =
      rs_R003_ueqv_R003YY_partial_19_1059 := by
  native_decide

/-- Coefficient term 1060 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1060 : Poly :=
[
  term ((1137 : Rat) / 35) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1060 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1060 : Poly :=
[
  term ((2274 : Rat) / 35) [(1, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1137 : Rat) / 35) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1060 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1060_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1060
        rs_R003_ueqv_R003YY_generator_19_1000_1099 =
      rs_R003_ueqv_R003YY_partial_19_1060 := by
  native_decide

/-- Coefficient term 1061 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1061 : Poly :=
[
  term ((-376224 : Rat) / 875) [(1, 1), (10, 1), (11, 1), (13, 2)]
]

/-- Partial product 1061 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1061 : Poly :=
[
  term ((-752448 : Rat) / 875) [(1, 1), (8, 1), (10, 1), (11, 1), (13, 2)],
  term ((376224 : Rat) / 875) [(1, 1), (10, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1061 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1061_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1061
        rs_R003_ueqv_R003YY_generator_19_1000_1099 =
      rs_R003_ueqv_R003YY_partial_19_1061 := by
  native_decide

/-- Coefficient term 1062 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1062 : Poly :=
[
  term ((18432 : Rat) / 35) [(1, 1), (10, 1), (11, 1), (13, 2), (14, 1)]
]

/-- Partial product 1062 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1062 : Poly :=
[
  term ((36864 : Rat) / 35) [(1, 1), (8, 1), (10, 1), (11, 1), (13, 2), (14, 1)],
  term ((-18432 : Rat) / 35) [(1, 1), (10, 1), (11, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1062 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1062_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1062
        rs_R003_ueqv_R003YY_generator_19_1000_1099 =
      rs_R003_ueqv_R003YY_partial_19_1062 := by
  native_decide

/-- Coefficient term 1063 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1063 : Poly :=
[
  term ((-6144 : Rat) / 35) [(1, 1), (10, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 1063 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1063 : Poly :=
[
  term ((-12288 : Rat) / 35) [(1, 1), (8, 1), (10, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((6144 : Rat) / 35) [(1, 1), (10, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1063 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1063_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1063
        rs_R003_ueqv_R003YY_generator_19_1000_1099 =
      rs_R003_ueqv_R003YY_partial_19_1063 := by
  native_decide

/-- Coefficient term 1064 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1064 : Poly :=
[
  term ((4992 : Rat) / 35) [(1, 1), (10, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 1064 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1064 : Poly :=
[
  term ((9984 : Rat) / 35) [(1, 1), (8, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((-4992 : Rat) / 35) [(1, 1), (10, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1064 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1064_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1064
        rs_R003_ueqv_R003YY_generator_19_1000_1099 =
      rs_R003_ueqv_R003YY_partial_19_1064 := by
  native_decide

/-- Coefficient term 1065 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1065 : Poly :=
[
  term ((933664 : Rat) / 7625) [(1, 1), (10, 1), (12, 1), (13, 1)]
]

/-- Partial product 1065 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1065 : Poly :=
[
  term ((1867328 : Rat) / 7625) [(1, 1), (8, 1), (10, 1), (12, 1), (13, 1)],
  term ((-933664 : Rat) / 7625) [(1, 1), (10, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1065 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1065_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1065
        rs_R003_ueqv_R003YY_generator_19_1000_1099 =
      rs_R003_ueqv_R003YY_partial_19_1065 := by
  native_decide

/-- Coefficient term 1066 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1066 : Poly :=
[
  term ((-768 : Rat) / 5) [(1, 1), (10, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 1066 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1066 : Poly :=
[
  term ((-1536 : Rat) / 5) [(1, 1), (8, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((768 : Rat) / 5) [(1, 1), (10, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1066 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1066_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1066
        rs_R003_ueqv_R003YY_generator_19_1000_1099 =
      rs_R003_ueqv_R003YY_partial_19_1066 := by
  native_decide

/-- Coefficient term 1067 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1067 : Poly :=
[
  term ((256 : Rat) / 5) [(1, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1067 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1067 : Poly :=
[
  term ((512 : Rat) / 5) [(1, 1), (8, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-256 : Rat) / 5) [(1, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1067 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1067_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1067
        rs_R003_ueqv_R003YY_generator_19_1000_1099 =
      rs_R003_ueqv_R003YY_partial_19_1067 := by
  native_decide

/-- Coefficient term 1068 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1068 : Poly :=
[
  term ((-208 : Rat) / 5) [(1, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 1068 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1068 : Poly :=
[
  term ((-416 : Rat) / 5) [(1, 1), (8, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((208 : Rat) / 5) [(1, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1068 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1068_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1068
        rs_R003_ueqv_R003YY_generator_19_1000_1099 =
      rs_R003_ueqv_R003YY_partial_19_1068 := by
  native_decide

/-- Coefficient term 1069 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1069 : Poly :=
[
  term ((-3469 : Rat) / 30) [(1, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 1069 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1069 : Poly :=
[
  term ((-3469 : Rat) / 15) [(1, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((3469 : Rat) / 30) [(1, 1), (10, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1069 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1069_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1069
        rs_R003_ueqv_R003YY_generator_19_1000_1099 =
      rs_R003_ueqv_R003YY_partial_19_1069 := by
  native_decide

/-- Coefficient term 1070 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1070 : Poly :=
[
  term ((119 : Rat) / 10) [(1, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1070 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1070 : Poly :=
[
  term ((119 : Rat) / 5) [(1, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-119 : Rat) / 10) [(1, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1070 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1070_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1070
        rs_R003_ueqv_R003YY_generator_19_1000_1099 =
      rs_R003_ueqv_R003YY_partial_19_1070 := by
  native_decide

/-- Coefficient term 1071 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1071 : Poly :=
[
  term ((-2590676 : Rat) / 7625) [(1, 1), (10, 1), (13, 1)]
]

/-- Partial product 1071 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1071 : Poly :=
[
  term ((-5181352 : Rat) / 7625) [(1, 1), (8, 1), (10, 1), (13, 1)],
  term ((2590676 : Rat) / 7625) [(1, 1), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1071 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1071_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1071
        rs_R003_ueqv_R003YY_generator_19_1000_1099 =
      rs_R003_ueqv_R003YY_partial_19_1071 := by
  native_decide

/-- Coefficient term 1072 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1072 : Poly :=
[
  term ((1728 : Rat) / 5) [(1, 1), (10, 1), (13, 1), (14, 1)]
]

/-- Partial product 1072 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1072 : Poly :=
[
  term ((3456 : Rat) / 5) [(1, 1), (8, 1), (10, 1), (13, 1), (14, 1)],
  term ((-1728 : Rat) / 5) [(1, 1), (10, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1072 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1072_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1072
        rs_R003_ueqv_R003YY_generator_19_1000_1099 =
      rs_R003_ueqv_R003YY_partial_19_1072 := by
  native_decide

/-- Coefficient term 1073 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1073 : Poly :=
[
  term ((-192 : Rat) / 5) [(1, 1), (10, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1073 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1073 : Poly :=
[
  term ((-384 : Rat) / 5) [(1, 1), (8, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((192 : Rat) / 5) [(1, 1), (10, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1073 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1073_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1073
        rs_R003_ueqv_R003YY_generator_19_1000_1099 =
      rs_R003_ueqv_R003YY_partial_19_1073 := by
  native_decide

/-- Coefficient term 1074 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1074 : Poly :=
[
  term ((156 : Rat) / 5) [(1, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 1074 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1074 : Poly :=
[
  term ((312 : Rat) / 5) [(1, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((-156 : Rat) / 5) [(1, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1074 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1074_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1074
        rs_R003_ueqv_R003YY_generator_19_1000_1099 =
      rs_R003_ueqv_R003YY_partial_19_1074 := by
  native_decide

/-- Coefficient term 1075 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1075 : Poly :=
[
  term ((361 : Rat) / 10) [(1, 1), (10, 1), (15, 1)]
]

/-- Partial product 1075 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1075 : Poly :=
[
  term ((361 : Rat) / 5) [(1, 1), (8, 1), (10, 1), (15, 1)],
  term ((-361 : Rat) / 10) [(1, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1075 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1075_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1075
        rs_R003_ueqv_R003YY_generator_19_1000_1099 =
      rs_R003_ueqv_R003YY_partial_19_1075 := by
  native_decide

/-- Coefficient term 1076 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1076 : Poly :=
[
  term ((-33 : Rat) / 10) [(1, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 1076 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1076 : Poly :=
[
  term ((-33 : Rat) / 5) [(1, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((33 : Rat) / 10) [(1, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1076 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1076_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1076
        rs_R003_ueqv_R003YY_generator_19_1000_1099 =
      rs_R003_ueqv_R003YY_partial_19_1076 := by
  native_decide

/-- Coefficient term 1077 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1077 : Poly :=
[
  term ((859176 : Rat) / 10675) [(1, 1), (10, 2), (13, 1)]
]

/-- Partial product 1077 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1077 : Poly :=
[
  term ((1718352 : Rat) / 10675) [(1, 1), (8, 1), (10, 2), (13, 1)],
  term ((-859176 : Rat) / 10675) [(1, 1), (10, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1077 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1077_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1077
        rs_R003_ueqv_R003YY_generator_19_1000_1099 =
      rs_R003_ueqv_R003YY_partial_19_1077 := by
  native_decide

/-- Coefficient term 1078 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1078 : Poly :=
[
  term ((-3456 : Rat) / 35) [(1, 1), (10, 2), (13, 1), (14, 1)]
]

/-- Partial product 1078 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1078 : Poly :=
[
  term ((-6912 : Rat) / 35) [(1, 1), (8, 1), (10, 2), (13, 1), (14, 1)],
  term ((3456 : Rat) / 35) [(1, 1), (10, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1078 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1078_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1078
        rs_R003_ueqv_R003YY_generator_19_1000_1099 =
      rs_R003_ueqv_R003YY_partial_19_1078 := by
  native_decide

/-- Coefficient term 1079 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1079 : Poly :=
[
  term ((1152 : Rat) / 35) [(1, 1), (10, 2), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1079 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1079 : Poly :=
[
  term ((2304 : Rat) / 35) [(1, 1), (8, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((-1152 : Rat) / 35) [(1, 1), (10, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1079 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1079_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1079
        rs_R003_ueqv_R003YY_generator_19_1000_1099 =
      rs_R003_ueqv_R003YY_partial_19_1079 := by
  native_decide

/-- Coefficient term 1080 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1080 : Poly :=
[
  term ((-936 : Rat) / 35) [(1, 1), (10, 2), (13, 1), (16, 1)]
]

/-- Partial product 1080 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1080 : Poly :=
[
  term ((-1872 : Rat) / 35) [(1, 1), (8, 1), (10, 2), (13, 1), (16, 1)],
  term ((936 : Rat) / 35) [(1, 1), (10, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1080 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1080_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1080
        rs_R003_ueqv_R003YY_generator_19_1000_1099 =
      rs_R003_ueqv_R003YY_partial_19_1080 := by
  native_decide

/-- Coefficient term 1081 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1081 : Poly :=
[
  term ((-1437 : Rat) / 70) [(1, 1), (10, 2), (15, 1)]
]

/-- Partial product 1081 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1081 : Poly :=
[
  term ((-1437 : Rat) / 35) [(1, 1), (8, 1), (10, 2), (15, 1)],
  term ((1437 : Rat) / 70) [(1, 1), (10, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1081 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1081_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1081
        rs_R003_ueqv_R003YY_generator_19_1000_1099 =
      rs_R003_ueqv_R003YY_partial_19_1081 := by
  native_decide

/-- Coefficient term 1082 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1082 : Poly :=
[
  term ((117 : Rat) / 70) [(1, 1), (10, 2), (15, 1), (16, 1)]
]

/-- Partial product 1082 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1082 : Poly :=
[
  term ((117 : Rat) / 35) [(1, 1), (8, 1), (10, 2), (15, 1), (16, 1)],
  term ((-117 : Rat) / 70) [(1, 1), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1082 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1082_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1082
        rs_R003_ueqv_R003YY_generator_19_1000_1099 =
      rs_R003_ueqv_R003YY_partial_19_1082 := by
  native_decide

/-- Coefficient term 1083 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1083 : Poly :=
[
  term ((611 : Rat) / 35) [(1, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 1083 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1083 : Poly :=
[
  term ((1222 : Rat) / 35) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-611 : Rat) / 35) [(1, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1083 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1083_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1083
        rs_R003_ueqv_R003YY_generator_19_1000_1099 =
      rs_R003_ueqv_R003YY_partial_19_1083 := by
  native_decide

/-- Coefficient term 1084 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1084 : Poly :=
[
  term ((-15 : Rat) / 7) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1084 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1084 : Poly :=
[
  term ((-30 : Rat) / 7) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((15 : Rat) / 7) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1084 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1084_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1084
        rs_R003_ueqv_R003YY_generator_19_1000_1099 =
      rs_R003_ueqv_R003YY_partial_19_1084 := by
  native_decide

/-- Coefficient term 1085 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1085 : Poly :=
[
  term ((286392 : Rat) / 10675) [(1, 1), (11, 1), (13, 2)]
]

/-- Partial product 1085 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1085 : Poly :=
[
  term ((572784 : Rat) / 10675) [(1, 1), (8, 1), (11, 1), (13, 2)],
  term ((-286392 : Rat) / 10675) [(1, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1085 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1085_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1085
        rs_R003_ueqv_R003YY_generator_19_1000_1099 =
      rs_R003_ueqv_R003YY_partial_19_1085 := by
  native_decide

/-- Coefficient term 1086 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1086 : Poly :=
[
  term ((-1152 : Rat) / 35) [(1, 1), (11, 1), (13, 2), (14, 1)]
]

/-- Partial product 1086 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1086 : Poly :=
[
  term ((-2304 : Rat) / 35) [(1, 1), (8, 1), (11, 1), (13, 2), (14, 1)],
  term ((1152 : Rat) / 35) [(1, 1), (11, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1086 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1086_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1086
        rs_R003_ueqv_R003YY_generator_19_1000_1099 =
      rs_R003_ueqv_R003YY_partial_19_1086 := by
  native_decide

/-- Coefficient term 1087 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1087 : Poly :=
[
  term ((384 : Rat) / 35) [(1, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 1087 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1087 : Poly :=
[
  term ((768 : Rat) / 35) [(1, 1), (8, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-384 : Rat) / 35) [(1, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1087 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1087_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1087
        rs_R003_ueqv_R003YY_generator_19_1000_1099 =
      rs_R003_ueqv_R003YY_partial_19_1087 := by
  native_decide

/-- Coefficient term 1088 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1088 : Poly :=
[
  term ((-312 : Rat) / 35) [(1, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 1088 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1088 : Poly :=
[
  term ((-624 : Rat) / 35) [(1, 1), (8, 1), (11, 1), (13, 2), (16, 1)],
  term ((312 : Rat) / 35) [(1, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1088 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1088_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1088
        rs_R003_ueqv_R003YY_generator_19_1000_1099 =
      rs_R003_ueqv_R003YY_partial_19_1088 := by
  native_decide

/-- Coefficient term 1089 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1089 : Poly :=
[
  term ((-8120824 : Rat) / 53375) [(1, 1), (11, 2), (13, 1)]
]

/-- Partial product 1089 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1089 : Poly :=
[
  term ((-16241648 : Rat) / 53375) [(1, 1), (8, 1), (11, 2), (13, 1)],
  term ((8120824 : Rat) / 53375) [(1, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1089 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1089_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1089
        rs_R003_ueqv_R003YY_generator_19_1000_1099 =
      rs_R003_ueqv_R003YY_partial_19_1089 := by
  native_decide

/-- Coefficient term 1090 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1090 : Poly :=
[
  term ((6528 : Rat) / 35) [(1, 1), (11, 2), (13, 1), (14, 1)]
]

/-- Partial product 1090 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1090 : Poly :=
[
  term ((13056 : Rat) / 35) [(1, 1), (8, 1), (11, 2), (13, 1), (14, 1)],
  term ((-6528 : Rat) / 35) [(1, 1), (11, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1090 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1090_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1090
        rs_R003_ueqv_R003YY_generator_19_1000_1099 =
      rs_R003_ueqv_R003YY_partial_19_1090 := by
  native_decide

/-- Coefficient term 1091 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1091 : Poly :=
[
  term ((-2176 : Rat) / 35) [(1, 1), (11, 2), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1091 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1091 : Poly :=
[
  term ((-4352 : Rat) / 35) [(1, 1), (8, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((2176 : Rat) / 35) [(1, 1), (11, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1091 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1091_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1091
        rs_R003_ueqv_R003YY_generator_19_1000_1099 =
      rs_R003_ueqv_R003YY_partial_19_1091 := by
  native_decide

/-- Coefficient term 1092 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1092 : Poly :=
[
  term ((1768 : Rat) / 35) [(1, 1), (11, 2), (13, 1), (16, 1)]
]

/-- Partial product 1092 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1092 : Poly :=
[
  term ((3536 : Rat) / 35) [(1, 1), (8, 1), (11, 2), (13, 1), (16, 1)],
  term ((-1768 : Rat) / 35) [(1, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1092 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1092_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1092
        rs_R003_ueqv_R003YY_generator_19_1000_1099 =
      rs_R003_ueqv_R003YY_partial_19_1092 := by
  native_decide

/-- Coefficient term 1093 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1093 : Poly :=
[
  term ((-2449 : Rat) / 105) [(1, 1), (11, 2), (15, 1)]
]

/-- Partial product 1093 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1093 : Poly :=
[
  term ((-4898 : Rat) / 105) [(1, 1), (8, 1), (11, 2), (15, 1)],
  term ((2449 : Rat) / 105) [(1, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1093 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1093_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1093
        rs_R003_ueqv_R003YY_generator_19_1000_1099 =
      rs_R003_ueqv_R003YY_partial_19_1093 := by
  native_decide

/-- Coefficient term 1094 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1094 : Poly :=
[
  term ((131 : Rat) / 35) [(1, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 1094 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1094 : Poly :=
[
  term ((262 : Rat) / 35) [(1, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((-131 : Rat) / 35) [(1, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1094 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1094_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1094
        rs_R003_ueqv_R003YY_generator_19_1000_1099 =
      rs_R003_ueqv_R003YY_partial_19_1094 := by
  native_decide

/-- Coefficient term 1095 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1095 : Poly :=
[
  term ((4086216 : Rat) / 53375) [(1, 1), (12, 1), (13, 1)]
]

/-- Partial product 1095 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1095 : Poly :=
[
  term ((8172432 : Rat) / 53375) [(1, 1), (8, 1), (12, 1), (13, 1)],
  term ((-4086216 : Rat) / 53375) [(1, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1095 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1095_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1095
        rs_R003_ueqv_R003YY_generator_19_1000_1099 =
      rs_R003_ueqv_R003YY_partial_19_1095 := by
  native_decide

/-- Coefficient term 1096 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1096 : Poly :=
[
  term ((-3456 : Rat) / 35) [(1, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 1096 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1096 : Poly :=
[
  term ((-6912 : Rat) / 35) [(1, 1), (8, 1), (12, 1), (13, 1), (14, 1)],
  term ((3456 : Rat) / 35) [(1, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1096 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1096_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1096
        rs_R003_ueqv_R003YY_generator_19_1000_1099 =
      rs_R003_ueqv_R003YY_partial_19_1096 := by
  native_decide

/-- Coefficient term 1097 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1097 : Poly :=
[
  term ((1152 : Rat) / 35) [(1, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1097 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1097 : Poly :=
[
  term ((2304 : Rat) / 35) [(1, 1), (8, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1152 : Rat) / 35) [(1, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1097 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1097_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1097
        rs_R003_ueqv_R003YY_generator_19_1000_1099 =
      rs_R003_ueqv_R003YY_partial_19_1097 := by
  native_decide

/-- Coefficient term 1098 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1098 : Poly :=
[
  term ((-936 : Rat) / 35) [(1, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 1098 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1098 : Poly :=
[
  term ((-1872 : Rat) / 35) [(1, 1), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((936 : Rat) / 35) [(1, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1098 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1098_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1098
        rs_R003_ueqv_R003YY_generator_19_1000_1099 =
      rs_R003_ueqv_R003YY_partial_19_1098 := by
  native_decide

/-- Coefficient term 1099 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1099 : Poly :=
[
  term ((25197 : Rat) / 350) [(1, 1), (12, 1), (15, 1)]
]

/-- Partial product 1099 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1099 : Poly :=
[
  term ((25197 : Rat) / 175) [(1, 1), (8, 1), (12, 1), (15, 1)],
  term ((-25197 : Rat) / 350) [(1, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1099 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1099_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1099
        rs_R003_ueqv_R003YY_generator_19_1000_1099 =
      rs_R003_ueqv_R003YY_partial_19_1099 := by
  native_decide

/-- Partial products in this block. -/
def rs_R003_ueqv_R003YY_partials_19_1000_1099 : List Poly :=
[
  rs_R003_ueqv_R003YY_partial_19_1000,
  rs_R003_ueqv_R003YY_partial_19_1001,
  rs_R003_ueqv_R003YY_partial_19_1002,
  rs_R003_ueqv_R003YY_partial_19_1003,
  rs_R003_ueqv_R003YY_partial_19_1004,
  rs_R003_ueqv_R003YY_partial_19_1005,
  rs_R003_ueqv_R003YY_partial_19_1006,
  rs_R003_ueqv_R003YY_partial_19_1007,
  rs_R003_ueqv_R003YY_partial_19_1008,
  rs_R003_ueqv_R003YY_partial_19_1009,
  rs_R003_ueqv_R003YY_partial_19_1010,
  rs_R003_ueqv_R003YY_partial_19_1011,
  rs_R003_ueqv_R003YY_partial_19_1012,
  rs_R003_ueqv_R003YY_partial_19_1013,
  rs_R003_ueqv_R003YY_partial_19_1014,
  rs_R003_ueqv_R003YY_partial_19_1015,
  rs_R003_ueqv_R003YY_partial_19_1016,
  rs_R003_ueqv_R003YY_partial_19_1017,
  rs_R003_ueqv_R003YY_partial_19_1018,
  rs_R003_ueqv_R003YY_partial_19_1019,
  rs_R003_ueqv_R003YY_partial_19_1020,
  rs_R003_ueqv_R003YY_partial_19_1021,
  rs_R003_ueqv_R003YY_partial_19_1022,
  rs_R003_ueqv_R003YY_partial_19_1023,
  rs_R003_ueqv_R003YY_partial_19_1024,
  rs_R003_ueqv_R003YY_partial_19_1025,
  rs_R003_ueqv_R003YY_partial_19_1026,
  rs_R003_ueqv_R003YY_partial_19_1027,
  rs_R003_ueqv_R003YY_partial_19_1028,
  rs_R003_ueqv_R003YY_partial_19_1029,
  rs_R003_ueqv_R003YY_partial_19_1030,
  rs_R003_ueqv_R003YY_partial_19_1031,
  rs_R003_ueqv_R003YY_partial_19_1032,
  rs_R003_ueqv_R003YY_partial_19_1033,
  rs_R003_ueqv_R003YY_partial_19_1034,
  rs_R003_ueqv_R003YY_partial_19_1035,
  rs_R003_ueqv_R003YY_partial_19_1036,
  rs_R003_ueqv_R003YY_partial_19_1037,
  rs_R003_ueqv_R003YY_partial_19_1038,
  rs_R003_ueqv_R003YY_partial_19_1039,
  rs_R003_ueqv_R003YY_partial_19_1040,
  rs_R003_ueqv_R003YY_partial_19_1041,
  rs_R003_ueqv_R003YY_partial_19_1042,
  rs_R003_ueqv_R003YY_partial_19_1043,
  rs_R003_ueqv_R003YY_partial_19_1044,
  rs_R003_ueqv_R003YY_partial_19_1045,
  rs_R003_ueqv_R003YY_partial_19_1046,
  rs_R003_ueqv_R003YY_partial_19_1047,
  rs_R003_ueqv_R003YY_partial_19_1048,
  rs_R003_ueqv_R003YY_partial_19_1049,
  rs_R003_ueqv_R003YY_partial_19_1050,
  rs_R003_ueqv_R003YY_partial_19_1051,
  rs_R003_ueqv_R003YY_partial_19_1052,
  rs_R003_ueqv_R003YY_partial_19_1053,
  rs_R003_ueqv_R003YY_partial_19_1054,
  rs_R003_ueqv_R003YY_partial_19_1055,
  rs_R003_ueqv_R003YY_partial_19_1056,
  rs_R003_ueqv_R003YY_partial_19_1057,
  rs_R003_ueqv_R003YY_partial_19_1058,
  rs_R003_ueqv_R003YY_partial_19_1059,
  rs_R003_ueqv_R003YY_partial_19_1060,
  rs_R003_ueqv_R003YY_partial_19_1061,
  rs_R003_ueqv_R003YY_partial_19_1062,
  rs_R003_ueqv_R003YY_partial_19_1063,
  rs_R003_ueqv_R003YY_partial_19_1064,
  rs_R003_ueqv_R003YY_partial_19_1065,
  rs_R003_ueqv_R003YY_partial_19_1066,
  rs_R003_ueqv_R003YY_partial_19_1067,
  rs_R003_ueqv_R003YY_partial_19_1068,
  rs_R003_ueqv_R003YY_partial_19_1069,
  rs_R003_ueqv_R003YY_partial_19_1070,
  rs_R003_ueqv_R003YY_partial_19_1071,
  rs_R003_ueqv_R003YY_partial_19_1072,
  rs_R003_ueqv_R003YY_partial_19_1073,
  rs_R003_ueqv_R003YY_partial_19_1074,
  rs_R003_ueqv_R003YY_partial_19_1075,
  rs_R003_ueqv_R003YY_partial_19_1076,
  rs_R003_ueqv_R003YY_partial_19_1077,
  rs_R003_ueqv_R003YY_partial_19_1078,
  rs_R003_ueqv_R003YY_partial_19_1079,
  rs_R003_ueqv_R003YY_partial_19_1080,
  rs_R003_ueqv_R003YY_partial_19_1081,
  rs_R003_ueqv_R003YY_partial_19_1082,
  rs_R003_ueqv_R003YY_partial_19_1083,
  rs_R003_ueqv_R003YY_partial_19_1084,
  rs_R003_ueqv_R003YY_partial_19_1085,
  rs_R003_ueqv_R003YY_partial_19_1086,
  rs_R003_ueqv_R003YY_partial_19_1087,
  rs_R003_ueqv_R003YY_partial_19_1088,
  rs_R003_ueqv_R003YY_partial_19_1089,
  rs_R003_ueqv_R003YY_partial_19_1090,
  rs_R003_ueqv_R003YY_partial_19_1091,
  rs_R003_ueqv_R003YY_partial_19_1092,
  rs_R003_ueqv_R003YY_partial_19_1093,
  rs_R003_ueqv_R003YY_partial_19_1094,
  rs_R003_ueqv_R003YY_partial_19_1095,
  rs_R003_ueqv_R003YY_partial_19_1096,
  rs_R003_ueqv_R003YY_partial_19_1097,
  rs_R003_ueqv_R003YY_partial_19_1098,
  rs_R003_ueqv_R003YY_partial_19_1099
]

/-- Sum of partial products in this block. -/
def rs_R003_ueqv_R003YY_block_19_1000_1099 : Poly :=
[
  term ((-226 : Rat) / 21) [(1, 1), (6, 1), (8, 1), (15, 1)],
  term ((-66 : Rat) / 7) [(1, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((113 : Rat) / 21) [(1, 1), (6, 1), (15, 1)],
  term ((33 : Rat) / 7) [(1, 1), (6, 1), (15, 1), (16, 1)],
  term ((-4528 : Rat) / 5) [(1, 1), (8, 1), (9, 1)],
  term ((-101293984 : Rat) / 53375) [(1, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((81408 : Rat) / 35) [(1, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-27136 : Rat) / 35) [(1, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((22048 : Rat) / 35) [(1, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-73966 : Rat) / 105) [(1, 1), (8, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((3242 : Rat) / 35) [(1, 1), (8, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-101293984 : Rat) / 53375) [(1, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((81408 : Rat) / 35) [(1, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((-27136 : Rat) / 35) [(1, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((22048 : Rat) / 35) [(1, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-73966 : Rat) / 105) [(1, 1), (8, 1), (9, 1), (11, 1), (15, 1)],
  term ((3242 : Rat) / 35) [(1, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-4528 : Rat) / 5) [(1, 1), (8, 1), (9, 1), (12, 1)],
  term ((4128 : Rat) / 5) [(1, 1), (8, 1), (9, 1), (12, 1), (14, 1)],
  term ((-8 : Rat) / 5) [(1, 1), (8, 1), (9, 1), (12, 1), (16, 1)],
  term ((4128 : Rat) / 5) [(1, 1), (8, 1), (9, 1), (14, 1)],
  term ((-8 : Rat) / 5) [(1, 1), (8, 1), (9, 1), (16, 1)],
  term ((-18418 : Rat) / 35) [(1, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((2274 : Rat) / 35) [(1, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-752448 : Rat) / 875) [(1, 1), (8, 1), (10, 1), (11, 1), (13, 2)],
  term ((36864 : Rat) / 35) [(1, 1), (8, 1), (10, 1), (11, 1), (13, 2), (14, 1)],
  term ((-12288 : Rat) / 35) [(1, 1), (8, 1), (10, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((9984 : Rat) / 35) [(1, 1), (8, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((1867328 : Rat) / 7625) [(1, 1), (8, 1), (10, 1), (12, 1), (13, 1)],
  term ((-1536 : Rat) / 5) [(1, 1), (8, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((512 : Rat) / 5) [(1, 1), (8, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-416 : Rat) / 5) [(1, 1), (8, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-3469 : Rat) / 15) [(1, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((119 : Rat) / 5) [(1, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-6221664 : Rat) / 10675) [(1, 1), (8, 1), (10, 1), (13, 1)],
  term ((19968 : Rat) / 35) [(1, 1), (8, 1), (10, 1), (13, 1), (14, 1)],
  term ((-256 : Rat) / 7) [(1, 1), (8, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((208 : Rat) / 7) [(1, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((-2581 : Rat) / 210) [(1, 1), (8, 1), (10, 1), (15, 1)],
  term ((143 : Rat) / 70) [(1, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((1718352 : Rat) / 10675) [(1, 1), (8, 1), (10, 2), (13, 1)],
  term ((-6912 : Rat) / 35) [(1, 1), (8, 1), (10, 2), (13, 1), (14, 1)],
  term ((2304 : Rat) / 35) [(1, 1), (8, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((-1872 : Rat) / 35) [(1, 1), (8, 1), (10, 2), (13, 1), (16, 1)],
  term ((-1437 : Rat) / 35) [(1, 1), (8, 1), (10, 2), (15, 1)],
  term ((117 : Rat) / 35) [(1, 1), (8, 1), (10, 2), (15, 1), (16, 1)],
  term ((2444 : Rat) / 35) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-60 : Rat) / 7) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1145568 : Rat) / 10675) [(1, 1), (8, 1), (11, 1), (13, 2)],
  term ((-4608 : Rat) / 35) [(1, 1), (8, 1), (11, 1), (13, 2), (14, 1)],
  term ((1536 : Rat) / 35) [(1, 1), (8, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-1248 : Rat) / 35) [(1, 1), (8, 1), (11, 1), (13, 2), (16, 1)],
  term ((8795912 : Rat) / 53375) [(1, 1), (8, 1), (12, 1), (13, 1)],
  term ((-7296 : Rat) / 35) [(1, 1), (8, 1), (12, 1), (13, 1), (14, 1)],
  term ((2432 : Rat) / 35) [(1, 1), (8, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1976 : Rat) / 35) [(1, 1), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((92107 : Rat) / 525) [(1, 1), (8, 1), (12, 1), (15, 1)],
  term ((-4 : Rat) / 35) [(1, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-713936 : Rat) / 7625) [(1, 1), (8, 1), (13, 1)],
  term ((576 : Rat) / 5) [(1, 1), (8, 1), (13, 1), (14, 1)],
  term ((-256 : Rat) / 5) [(1, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((206 : Rat) / 5) [(1, 1), (8, 1), (13, 1), (16, 1)],
  term ((133 : Rat) / 5) [(1, 1), (8, 1), (15, 1)],
  term ((-41 : Rat) / 5) [(1, 1), (8, 1), (15, 1), (16, 1)],
  term ((3464 : Rat) / 5) [(1, 1), (8, 2), (9, 1)],
  term ((91722048 : Rat) / 53375) [(1, 1), (8, 2), (9, 1), (11, 1), (13, 1)],
  term ((-73728 : Rat) / 35) [(1, 1), (8, 2), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((24576 : Rat) / 35) [(1, 1), (8, 2), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-19968 : Rat) / 35) [(1, 1), (8, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((4192 : Rat) / 7) [(1, 1), (8, 2), (9, 1), (11, 1), (15, 1)],
  term ((-2784 : Rat) / 35) [(1, 1), (8, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3136 : Rat) / 5) [(1, 1), (8, 2), (9, 1), (14, 1)],
  term ((4 : Rat) / 5) [(1, 1), (8, 2), (9, 1), (16, 1)],
  term ((-10322288 : Rat) / 53375) [(1, 1), (8, 2), (10, 1), (13, 1)],
  term ((8448 : Rat) / 35) [(1, 1), (8, 2), (10, 1), (13, 1), (14, 1)],
  term ((-2816 : Rat) / 35) [(1, 1), (8, 2), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((2288 : Rat) / 35) [(1, 1), (8, 2), (10, 1), (13, 1), (16, 1)],
  term ((17743 : Rat) / 105) [(1, 1), (8, 2), (10, 1), (15, 1)],
  term ((-121 : Rat) / 7) [(1, 1), (8, 2), (10, 1), (15, 1), (16, 1)],
  term ((-2444 : Rat) / 35) [(1, 1), (8, 2), (11, 1), (13, 1), (15, 1)],
  term ((60 : Rat) / 7) [(1, 1), (8, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1145568 : Rat) / 10675) [(1, 1), (8, 2), (11, 1), (13, 2)],
  term ((4608 : Rat) / 35) [(1, 1), (8, 2), (11, 1), (13, 2), (14, 1)],
  term ((-1536 : Rat) / 35) [(1, 1), (8, 2), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((1248 : Rat) / 35) [(1, 1), (8, 2), (11, 1), (13, 2), (16, 1)],
  term ((-32483296 : Rat) / 53375) [(1, 1), (8, 2), (11, 2), (13, 1)],
  term ((26112 : Rat) / 35) [(1, 1), (8, 2), (11, 2), (13, 1), (14, 1)],
  term ((-8704 : Rat) / 35) [(1, 1), (8, 2), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((7072 : Rat) / 35) [(1, 1), (8, 2), (11, 2), (13, 1), (16, 1)],
  term ((-9796 : Rat) / 105) [(1, 1), (8, 2), (11, 2), (15, 1)],
  term ((524 : Rat) / 35) [(1, 1), (8, 2), (11, 2), (15, 1), (16, 1)],
  term ((-249392 : Rat) / 10675) [(1, 1), (8, 2), (12, 1), (13, 1)],
  term ((768 : Rat) / 35) [(1, 1), (8, 2), (12, 1), (13, 1), (14, 1)],
  term ((-256 : Rat) / 35) [(1, 1), (8, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((208 : Rat) / 35) [(1, 1), (8, 2), (12, 1), (13, 1), (16, 1)],
  term ((-33032 : Rat) / 525) [(1, 1), (8, 2), (12, 1), (15, 1)],
  term ((8 : Rat) / 35) [(1, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((1427872 : Rat) / 7625) [(1, 1), (8, 2), (13, 1)],
  term ((-1152 : Rat) / 5) [(1, 1), (8, 2), (13, 1), (14, 1)],
  term ((512 : Rat) / 5) [(1, 1), (8, 2), (13, 1), (14, 1), (16, 1)],
  term ((-412 : Rat) / 5) [(1, 1), (8, 2), (13, 1), (16, 1)],
  term ((-266 : Rat) / 5) [(1, 1), (8, 2), (15, 1)],
  term ((82 : Rat) / 5) [(1, 1), (8, 2), (15, 1), (16, 1)],
  term ((1398 : Rat) / 5) [(1, 1), (9, 1)],
  term ((50646992 : Rat) / 53375) [(1, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((-40704 : Rat) / 35) [(1, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((13568 : Rat) / 35) [(1, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-11024 : Rat) / 35) [(1, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((36983 : Rat) / 105) [(1, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((-1621 : Rat) / 35) [(1, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((5543296 : Rat) / 10675) [(1, 1), (9, 1), (11, 1), (13, 1)],
  term ((-22272 : Rat) / 35) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((7424 : Rat) / 35) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-6032 : Rat) / 35) [(1, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((21263 : Rat) / 105) [(1, 1), (9, 1), (11, 1), (15, 1)],
  term ((-185 : Rat) / 7) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((2264 : Rat) / 5) [(1, 1), (9, 1), (12, 1)],
  term ((-2064 : Rat) / 5) [(1, 1), (9, 1), (12, 1), (14, 1)],
  term ((4 : Rat) / 5) [(1, 1), (9, 1), (12, 1), (16, 1)],
  term (-256 : Rat) [(1, 1), (9, 1), (14, 1)],
  term ((3 : Rat) / 5) [(1, 1), (9, 1), (16, 1)],
  term ((9209 : Rat) / 35) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1137 : Rat) / 35) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((376224 : Rat) / 875) [(1, 1), (10, 1), (11, 1), (13, 2)],
  term ((-18432 : Rat) / 35) [(1, 1), (10, 1), (11, 1), (13, 2), (14, 1)],
  term ((6144 : Rat) / 35) [(1, 1), (10, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-4992 : Rat) / 35) [(1, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((-933664 : Rat) / 7625) [(1, 1), (10, 1), (12, 1), (13, 1)],
  term ((768 : Rat) / 5) [(1, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((-256 : Rat) / 5) [(1, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((208 : Rat) / 5) [(1, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((3469 : Rat) / 30) [(1, 1), (10, 1), (12, 1), (15, 1)],
  term ((-119 : Rat) / 10) [(1, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((2590676 : Rat) / 7625) [(1, 1), (10, 1), (13, 1)],
  term ((-1728 : Rat) / 5) [(1, 1), (10, 1), (13, 1), (14, 1)],
  term ((192 : Rat) / 5) [(1, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-156 : Rat) / 5) [(1, 1), (10, 1), (13, 1), (16, 1)],
  term ((-361 : Rat) / 10) [(1, 1), (10, 1), (15, 1)],
  term ((33 : Rat) / 10) [(1, 1), (10, 1), (15, 1), (16, 1)],
  term ((-859176 : Rat) / 10675) [(1, 1), (10, 2), (13, 1)],
  term ((3456 : Rat) / 35) [(1, 1), (10, 2), (13, 1), (14, 1)],
  term ((-1152 : Rat) / 35) [(1, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((936 : Rat) / 35) [(1, 1), (10, 2), (13, 1), (16, 1)],
  term ((1437 : Rat) / 70) [(1, 1), (10, 2), (15, 1)],
  term ((-117 : Rat) / 70) [(1, 1), (10, 2), (15, 1), (16, 1)],
  term ((-611 : Rat) / 35) [(1, 1), (11, 1), (13, 1), (15, 1)],
  term ((15 : Rat) / 7) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-286392 : Rat) / 10675) [(1, 1), (11, 1), (13, 2)],
  term ((1152 : Rat) / 35) [(1, 1), (11, 1), (13, 2), (14, 1)],
  term ((-384 : Rat) / 35) [(1, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((312 : Rat) / 35) [(1, 1), (11, 1), (13, 2), (16, 1)],
  term ((8120824 : Rat) / 53375) [(1, 1), (11, 2), (13, 1)],
  term ((-6528 : Rat) / 35) [(1, 1), (11, 2), (13, 1), (14, 1)],
  term ((2176 : Rat) / 35) [(1, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-1768 : Rat) / 35) [(1, 1), (11, 2), (13, 1), (16, 1)],
  term ((2449 : Rat) / 105) [(1, 1), (11, 2), (15, 1)],
  term ((-131 : Rat) / 35) [(1, 1), (11, 2), (15, 1), (16, 1)],
  term ((-4086216 : Rat) / 53375) [(1, 1), (12, 1), (13, 1)],
  term ((3456 : Rat) / 35) [(1, 1), (12, 1), (13, 1), (14, 1)],
  term ((-1152 : Rat) / 35) [(1, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((936 : Rat) / 35) [(1, 1), (12, 1), (13, 1), (16, 1)],
  term ((-25197 : Rat) / 350) [(1, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 19, terms 1000 through 1099. -/
theorem rs_R003_ueqv_R003YY_block_19_1000_1099_valid :
    checkProductSumEq rs_R003_ueqv_R003YY_partials_19_1000_1099
      rs_R003_ueqv_R003YY_block_19_1000_1099 = true := by
  native_decide

end R003UeqvR003YYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
