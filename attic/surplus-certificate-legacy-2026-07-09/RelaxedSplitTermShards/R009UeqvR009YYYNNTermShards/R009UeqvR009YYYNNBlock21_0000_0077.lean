/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009YYYNN, term block 21:0-77

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009YYYNNTermShards

/-- Generator polynomial 21 for relaxed split surplus certificate `R009:u=v:R009YYYNN`. -/
def rs_R009_ueqv_R009YYYNN_generator_21_0000_0077 : Poly :=
[
  term (2 : Rat) [(8, 1), (12, 1)],
  term (2 : Rat) [(9, 1), (13, 1)],
  term (-1 : Rat) [(12, 2)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YYYNN_coefficient_21_0000 : Poly :=
[
  term ((47514599 : Rat) / 170703848) []
]

/-- Partial product 0 for generator 21. -/
def rs_R009_ueqv_R009YYYNN_partial_21_0000 : Poly :=
[
  term ((47514599 : Rat) / 85351924) [(8, 1), (12, 1)],
  term ((47514599 : Rat) / 85351924) [(9, 1), (13, 1)],
  term ((-47514599 : Rat) / 170703848) [(12, 2)],
  term ((-47514599 : Rat) / 170703848) [(13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 21. -/
theorem rs_R009_ueqv_R009YYYNN_partial_21_0000_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_21_0000
        rs_R009_ueqv_R009YYYNN_generator_21_0000_0077 =
      rs_R009_ueqv_R009YYYNN_partial_21_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YYYNN_coefficient_21_0001 : Poly :=
[
  term ((-3818808 : Rat) / 435469) [(0, 1), (3, 1), (5, 1)]
]

/-- Partial product 1 for generator 21. -/
def rs_R009_ueqv_R009YYYNN_partial_21_0001 : Poly :=
[
  term ((-7637616 : Rat) / 435469) [(0, 1), (3, 1), (5, 1), (8, 1), (12, 1)],
  term ((-7637616 : Rat) / 435469) [(0, 1), (3, 1), (5, 1), (9, 1), (13, 1)],
  term ((3818808 : Rat) / 435469) [(0, 1), (3, 1), (5, 1), (12, 2)],
  term ((3818808 : Rat) / 435469) [(0, 1), (3, 1), (5, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 21. -/
theorem rs_R009_ueqv_R009YYYNN_partial_21_0001_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_21_0001
        rs_R009_ueqv_R009YYYNN_generator_21_0000_0077 =
      rs_R009_ueqv_R009YYYNN_partial_21_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YYYNN_coefficient_21_0002 : Poly :=
[
  term ((954702 : Rat) / 435469) [(0, 1), (3, 1), (5, 1), (16, 1)]
]

/-- Partial product 2 for generator 21. -/
def rs_R009_ueqv_R009YYYNN_partial_21_0002 : Poly :=
[
  term ((1909404 : Rat) / 435469) [(0, 1), (3, 1), (5, 1), (8, 1), (12, 1), (16, 1)],
  term ((1909404 : Rat) / 435469) [(0, 1), (3, 1), (5, 1), (9, 1), (13, 1), (16, 1)],
  term ((-954702 : Rat) / 435469) [(0, 1), (3, 1), (5, 1), (12, 2), (16, 1)],
  term ((-954702 : Rat) / 435469) [(0, 1), (3, 1), (5, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 21. -/
theorem rs_R009_ueqv_R009YYYNN_partial_21_0002_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_21_0002
        rs_R009_ueqv_R009YYYNN_generator_21_0000_0077 =
      rs_R009_ueqv_R009YYYNN_partial_21_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YYYNN_coefficient_21_0003 : Poly :=
[
  term ((-247780872 : Rat) / 21337981) [(0, 1), (3, 1), (9, 1)]
]

/-- Partial product 3 for generator 21. -/
def rs_R009_ueqv_R009YYYNN_partial_21_0003 : Poly :=
[
  term ((-495561744 : Rat) / 21337981) [(0, 1), (3, 1), (8, 1), (9, 1), (12, 1)],
  term ((247780872 : Rat) / 21337981) [(0, 1), (3, 1), (9, 1), (12, 2)],
  term ((247780872 : Rat) / 21337981) [(0, 1), (3, 1), (9, 1), (13, 2)],
  term ((-495561744 : Rat) / 21337981) [(0, 1), (3, 1), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 21. -/
theorem rs_R009_ueqv_R009YYYNN_partial_21_0003_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_21_0003
        rs_R009_ueqv_R009YYYNN_generator_21_0000_0077 =
      rs_R009_ueqv_R009YYYNN_partial_21_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YYYNN_coefficient_21_0004 : Poly :=
[
  term ((954702 : Rat) / 435469) [(0, 1), (3, 1), (13, 1), (16, 1)]
]

/-- Partial product 4 for generator 21. -/
def rs_R009_ueqv_R009YYYNN_partial_21_0004 : Poly :=
[
  term ((1909404 : Rat) / 435469) [(0, 1), (3, 1), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((1909404 : Rat) / 435469) [(0, 1), (3, 1), (9, 1), (13, 2), (16, 1)],
  term ((-954702 : Rat) / 435469) [(0, 1), (3, 1), (12, 2), (13, 1), (16, 1)],
  term ((-954702 : Rat) / 435469) [(0, 1), (3, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 21. -/
theorem rs_R009_ueqv_R009YYYNN_partial_21_0004_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_21_0004
        rs_R009_ueqv_R009YYYNN_generator_21_0000_0077 =
      rs_R009_ueqv_R009YYYNN_partial_21_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YYYNN_coefficient_21_0005 : Poly :=
[
  term ((-954702 : Rat) / 435469) [(0, 1), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 5 for generator 21. -/
def rs_R009_ueqv_R009YYYNN_partial_21_0005 : Poly :=
[
  term ((-1909404 : Rat) / 435469) [(0, 1), (3, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1909404 : Rat) / 435469) [(0, 1), (3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((954702 : Rat) / 435469) [(0, 1), (3, 1), (12, 2), (15, 1), (16, 1)],
  term ((954702 : Rat) / 435469) [(0, 1), (3, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 21. -/
theorem rs_R009_ueqv_R009YYYNN_partial_21_0005_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_21_0005
        rs_R009_ueqv_R009YYYNN_generator_21_0000_0077 =
      rs_R009_ueqv_R009YYYNN_partial_21_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YYYNN_coefficient_21_0006 : Poly :=
[
  term ((-83273292 : Rat) / 21337981) [(0, 1), (5, 1), (15, 1)]
]

/-- Partial product 6 for generator 21. -/
def rs_R009_ueqv_R009YYYNN_partial_21_0006 : Poly :=
[
  term ((-166546584 : Rat) / 21337981) [(0, 1), (5, 1), (8, 1), (12, 1), (15, 1)],
  term ((-166546584 : Rat) / 21337981) [(0, 1), (5, 1), (9, 1), (13, 1), (15, 1)],
  term ((83273292 : Rat) / 21337981) [(0, 1), (5, 1), (12, 2), (15, 1)],
  term ((83273292 : Rat) / 21337981) [(0, 1), (5, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 21. -/
theorem rs_R009_ueqv_R009YYYNN_partial_21_0006_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_21_0006
        rs_R009_ueqv_R009YYYNN_generator_21_0000_0077 =
      rs_R009_ueqv_R009YYYNN_partial_21_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YYYNN_coefficient_21_0007 : Poly :=
[
  term ((20818323 : Rat) / 21337981) [(0, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 7 for generator 21. -/
def rs_R009_ueqv_R009YYYNN_partial_21_0007 : Poly :=
[
  term ((41636646 : Rat) / 21337981) [(0, 1), (5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((41636646 : Rat) / 21337981) [(0, 1), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-20818323 : Rat) / 21337981) [(0, 1), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((-20818323 : Rat) / 21337981) [(0, 1), (5, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 21. -/
theorem rs_R009_ueqv_R009YYYNN_partial_21_0007_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_21_0007
        rs_R009_ueqv_R009YYYNN_generator_21_0000_0077 =
      rs_R009_ueqv_R009YYYNN_partial_21_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YYYNN_coefficient_21_0008 : Poly :=
[
  term ((254301237 : Rat) / 21337981) [(0, 1), (9, 1), (15, 1)]
]

/-- Partial product 8 for generator 21. -/
def rs_R009_ueqv_R009YYYNN_partial_21_0008 : Poly :=
[
  term ((508602474 : Rat) / 21337981) [(0, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-254301237 : Rat) / 21337981) [(0, 1), (9, 1), (12, 2), (15, 1)],
  term ((-254301237 : Rat) / 21337981) [(0, 1), (9, 1), (13, 2), (15, 1)],
  term ((508602474 : Rat) / 21337981) [(0, 1), (9, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 21. -/
theorem rs_R009_ueqv_R009YYYNN_partial_21_0008_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_21_0008
        rs_R009_ueqv_R009YYYNN_generator_21_0000_0077 =
      rs_R009_ueqv_R009YYYNN_partial_21_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YYYNN_coefficient_21_0009 : Poly :=
[
  term ((20818323 : Rat) / 21337981) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 9 for generator 21. -/
def rs_R009_ueqv_R009YYYNN_partial_21_0009 : Poly :=
[
  term ((41636646 : Rat) / 21337981) [(0, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((41636646 : Rat) / 21337981) [(0, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-20818323 : Rat) / 21337981) [(0, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-20818323 : Rat) / 21337981) [(0, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 21. -/
theorem rs_R009_ueqv_R009YYYNN_partial_21_0009_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_21_0009
        rs_R009_ueqv_R009YYYNN_generator_21_0000_0077 =
      rs_R009_ueqv_R009YYYNN_partial_21_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YYYNN_coefficient_21_0010 : Poly :=
[
  term ((-20818323 : Rat) / 21337981) [(0, 1), (15, 2), (16, 1)]
]

/-- Partial product 10 for generator 21. -/
def rs_R009_ueqv_R009YYYNN_partial_21_0010 : Poly :=
[
  term ((-41636646 : Rat) / 21337981) [(0, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-41636646 : Rat) / 21337981) [(0, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((20818323 : Rat) / 21337981) [(0, 1), (12, 2), (15, 2), (16, 1)],
  term ((20818323 : Rat) / 21337981) [(0, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 21. -/
theorem rs_R009_ueqv_R009YYYNN_partial_21_0010_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_21_0010
        rs_R009_ueqv_R009YYYNN_generator_21_0000_0077 =
      rs_R009_ueqv_R009YYYNN_partial_21_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YYYNN_coefficient_21_0011 : Poly :=
[
  term ((217451232 : Rat) / 21337981) [(1, 1), (3, 1)]
]

/-- Partial product 11 for generator 21. -/
def rs_R009_ueqv_R009YYYNN_partial_21_0011 : Poly :=
[
  term ((434902464 : Rat) / 21337981) [(1, 1), (3, 1), (8, 1), (12, 1)],
  term ((434902464 : Rat) / 21337981) [(1, 1), (3, 1), (9, 1), (13, 1)],
  term ((-217451232 : Rat) / 21337981) [(1, 1), (3, 1), (12, 2)],
  term ((-217451232 : Rat) / 21337981) [(1, 1), (3, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 21. -/
theorem rs_R009_ueqv_R009YYYNN_partial_21_0011_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_21_0011
        rs_R009_ueqv_R009YYYNN_generator_21_0000_0077 =
      rs_R009_ueqv_R009YYYNN_partial_21_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YYYNN_coefficient_21_0012 : Poly :=
[
  term ((-3350643624 : Rat) / 21337981) [(1, 1), (3, 1), (5, 1), (15, 1)]
]

/-- Partial product 12 for generator 21. -/
def rs_R009_ueqv_R009YYYNN_partial_21_0012 : Poly :=
[
  term ((-6701287248 : Rat) / 21337981) [(1, 1), (3, 1), (5, 1), (8, 1), (12, 1), (15, 1)],
  term ((-6701287248 : Rat) / 21337981) [(1, 1), (3, 1), (5, 1), (9, 1), (13, 1), (15, 1)],
  term ((3350643624 : Rat) / 21337981) [(1, 1), (3, 1), (5, 1), (12, 2), (15, 1)],
  term ((3350643624 : Rat) / 21337981) [(1, 1), (3, 1), (5, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 21. -/
theorem rs_R009_ueqv_R009YYYNN_partial_21_0012_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_21_0012
        rs_R009_ueqv_R009YYYNN_generator_21_0000_0077 =
      rs_R009_ueqv_R009YYYNN_partial_21_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YYYNN_coefficient_21_0013 : Poly :=
[
  term ((1675321812 : Rat) / 21337981) [(1, 1), (3, 1), (9, 1), (15, 1)]
]

/-- Partial product 13 for generator 21. -/
def rs_R009_ueqv_R009YYYNN_partial_21_0013 : Poly :=
[
  term ((3350643624 : Rat) / 21337981) [(1, 1), (3, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-1675321812 : Rat) / 21337981) [(1, 1), (3, 1), (9, 1), (12, 2), (15, 1)],
  term ((-1675321812 : Rat) / 21337981) [(1, 1), (3, 1), (9, 1), (13, 2), (15, 1)],
  term ((3350643624 : Rat) / 21337981) [(1, 1), (3, 1), (9, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 21. -/
theorem rs_R009_ueqv_R009YYYNN_partial_21_0013_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_21_0013
        rs_R009_ueqv_R009YYYNN_generator_21_0000_0077 =
      rs_R009_ueqv_R009YYYNN_partial_21_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YYYNN_coefficient_21_0014 : Poly :=
[
  term ((-341341668 : Rat) / 21337981) [(1, 1), (3, 1), (14, 1)]
]

/-- Partial product 14 for generator 21. -/
def rs_R009_ueqv_R009YYYNN_partial_21_0014 : Poly :=
[
  term ((-682683336 : Rat) / 21337981) [(1, 1), (3, 1), (8, 1), (12, 1), (14, 1)],
  term ((-682683336 : Rat) / 21337981) [(1, 1), (3, 1), (9, 1), (13, 1), (14, 1)],
  term ((341341668 : Rat) / 21337981) [(1, 1), (3, 1), (12, 2), (14, 1)],
  term ((341341668 : Rat) / 21337981) [(1, 1), (3, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 21. -/
theorem rs_R009_ueqv_R009YYYNN_partial_21_0014_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_21_0014
        rs_R009_ueqv_R009YYYNN_generator_21_0000_0077 =
      rs_R009_ueqv_R009YYYNN_partial_21_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YYYNN_coefficient_21_0015 : Poly :=
[
  term ((5794559856 : Rat) / 21337981) [(1, 1), (3, 2), (5, 1)]
]

/-- Partial product 15 for generator 21. -/
def rs_R009_ueqv_R009YYYNN_partial_21_0015 : Poly :=
[
  term ((11589119712 : Rat) / 21337981) [(1, 1), (3, 2), (5, 1), (8, 1), (12, 1)],
  term ((11589119712 : Rat) / 21337981) [(1, 1), (3, 2), (5, 1), (9, 1), (13, 1)],
  term ((-5794559856 : Rat) / 21337981) [(1, 1), (3, 2), (5, 1), (12, 2)],
  term ((-5794559856 : Rat) / 21337981) [(1, 1), (3, 2), (5, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 21. -/
theorem rs_R009_ueqv_R009YYYNN_partial_21_0015_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_21_0015
        rs_R009_ueqv_R009YYYNN_generator_21_0000_0077 =
      rs_R009_ueqv_R009YYYNN_partial_21_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YYYNN_coefficient_21_0016 : Poly :=
[
  term ((-2897279928 : Rat) / 21337981) [(1, 1), (3, 2), (9, 1)]
]

/-- Partial product 16 for generator 21. -/
def rs_R009_ueqv_R009YYYNN_partial_21_0016 : Poly :=
[
  term ((-5794559856 : Rat) / 21337981) [(1, 1), (3, 2), (8, 1), (9, 1), (12, 1)],
  term ((2897279928 : Rat) / 21337981) [(1, 1), (3, 2), (9, 1), (12, 2)],
  term ((2897279928 : Rat) / 21337981) [(1, 1), (3, 2), (9, 1), (13, 2)],
  term ((-5794559856 : Rat) / 21337981) [(1, 1), (3, 2), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 21. -/
theorem rs_R009_ueqv_R009YYYNN_partial_21_0016_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_21_0016
        rs_R009_ueqv_R009YYYNN_generator_21_0000_0077 =
      rs_R009_ueqv_R009YYYNN_partial_21_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YYYNN_coefficient_21_0017 : Poly :=
[
  term ((135197442 : Rat) / 21337981) [(1, 1), (5, 1)]
]

/-- Partial product 17 for generator 21. -/
def rs_R009_ueqv_R009YYYNN_partial_21_0017 : Poly :=
[
  term ((270394884 : Rat) / 21337981) [(1, 1), (5, 1), (8, 1), (12, 1)],
  term ((270394884 : Rat) / 21337981) [(1, 1), (5, 1), (9, 1), (13, 1)],
  term ((-135197442 : Rat) / 21337981) [(1, 1), (5, 1), (12, 2)],
  term ((-135197442 : Rat) / 21337981) [(1, 1), (5, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 21. -/
theorem rs_R009_ueqv_R009YYYNN_partial_21_0017_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_21_0017
        rs_R009_ueqv_R009YYYNN_generator_21_0000_0077 =
      rs_R009_ueqv_R009YYYNN_partial_21_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YYYNN_coefficient_21_0018 : Poly :=
[
  term ((-67598721 : Rat) / 42675962) [(1, 1), (5, 1), (16, 1)]
]

/-- Partial product 18 for generator 21. -/
def rs_R009_ueqv_R009YYYNN_partial_21_0018 : Poly :=
[
  term ((-67598721 : Rat) / 21337981) [(1, 1), (5, 1), (8, 1), (12, 1), (16, 1)],
  term ((-67598721 : Rat) / 21337981) [(1, 1), (5, 1), (9, 1), (13, 1), (16, 1)],
  term ((67598721 : Rat) / 42675962) [(1, 1), (5, 1), (12, 2), (16, 1)],
  term ((67598721 : Rat) / 42675962) [(1, 1), (5, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 21. -/
theorem rs_R009_ueqv_R009YYYNN_partial_21_0018_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_21_0018
        rs_R009_ueqv_R009YYYNN_generator_21_0000_0077 =
      rs_R009_ueqv_R009YYYNN_partial_21_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YYYNN_coefficient_21_0019 : Poly :=
[
  term ((67598721 : Rat) / 21337981) [(1, 1), (9, 1)]
]

/-- Partial product 19 for generator 21. -/
def rs_R009_ueqv_R009YYYNN_partial_21_0019 : Poly :=
[
  term ((135197442 : Rat) / 21337981) [(1, 1), (8, 1), (9, 1), (12, 1)],
  term ((-67598721 : Rat) / 21337981) [(1, 1), (9, 1), (12, 2)],
  term ((-67598721 : Rat) / 21337981) [(1, 1), (9, 1), (13, 2)],
  term ((135197442 : Rat) / 21337981) [(1, 1), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 21. -/
theorem rs_R009_ueqv_R009YYYNN_partial_21_0019_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_21_0019
        rs_R009_ueqv_R009YYYNN_generator_21_0000_0077 =
      rs_R009_ueqv_R009YYYNN_partial_21_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YYYNN_coefficient_21_0020 : Poly :=
[
  term ((67598721 : Rat) / 21337981) [(1, 1), (13, 1)]
]

/-- Partial product 20 for generator 21. -/
def rs_R009_ueqv_R009YYYNN_partial_21_0020 : Poly :=
[
  term ((135197442 : Rat) / 21337981) [(1, 1), (8, 1), (12, 1), (13, 1)],
  term ((135197442 : Rat) / 21337981) [(1, 1), (9, 1), (13, 2)],
  term ((-67598721 : Rat) / 21337981) [(1, 1), (12, 2), (13, 1)],
  term ((-67598721 : Rat) / 21337981) [(1, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 21. -/
theorem rs_R009_ueqv_R009YYYNN_partial_21_0020_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_21_0020
        rs_R009_ueqv_R009YYYNN_generator_21_0000_0077 =
      rs_R009_ueqv_R009YYYNN_partial_21_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YYYNN_coefficient_21_0021 : Poly :=
[
  term ((-67598721 : Rat) / 42675962) [(1, 1), (13, 1), (16, 1)]
]

/-- Partial product 21 for generator 21. -/
def rs_R009_ueqv_R009YYYNN_partial_21_0021 : Poly :=
[
  term ((-67598721 : Rat) / 21337981) [(1, 1), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((-67598721 : Rat) / 21337981) [(1, 1), (9, 1), (13, 2), (16, 1)],
  term ((67598721 : Rat) / 42675962) [(1, 1), (12, 2), (13, 1), (16, 1)],
  term ((67598721 : Rat) / 42675962) [(1, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 21. -/
theorem rs_R009_ueqv_R009YYYNN_partial_21_0021_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_21_0021
        rs_R009_ueqv_R009YYYNN_generator_21_0000_0077 =
      rs_R009_ueqv_R009YYYNN_partial_21_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YYYNN_coefficient_21_0022 : Poly :=
[
  term ((212664591 : Rat) / 21337981) [(1, 1), (14, 1), (15, 1)]
]

/-- Partial product 22 for generator 21. -/
def rs_R009_ueqv_R009YYYNN_partial_21_0022 : Poly :=
[
  term ((425329182 : Rat) / 21337981) [(1, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((425329182 : Rat) / 21337981) [(1, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((-212664591 : Rat) / 21337981) [(1, 1), (12, 2), (14, 1), (15, 1)],
  term ((-212664591 : Rat) / 21337981) [(1, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 21. -/
theorem rs_R009_ueqv_R009YYYNN_partial_21_0022_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_21_0022
        rs_R009_ueqv_R009YYYNN_generator_21_0000_0077 =
      rs_R009_ueqv_R009YYYNN_partial_21_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YYYNN_coefficient_21_0023 : Poly :=
[
  term ((-171027945 : Rat) / 42675962) [(1, 1), (15, 1)]
]

/-- Partial product 23 for generator 21. -/
def rs_R009_ueqv_R009YYYNN_partial_21_0023 : Poly :=
[
  term ((-171027945 : Rat) / 21337981) [(1, 1), (8, 1), (12, 1), (15, 1)],
  term ((-171027945 : Rat) / 21337981) [(1, 1), (9, 1), (13, 1), (15, 1)],
  term ((171027945 : Rat) / 42675962) [(1, 1), (12, 2), (15, 1)],
  term ((171027945 : Rat) / 42675962) [(1, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 21. -/
theorem rs_R009_ueqv_R009YYYNN_partial_21_0023_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_21_0023
        rs_R009_ueqv_R009YYYNN_generator_21_0000_0077 =
      rs_R009_ueqv_R009YYYNN_partial_21_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YYYNN_coefficient_21_0024 : Poly :=
[
  term ((67598721 : Rat) / 42675962) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 24 for generator 21. -/
def rs_R009_ueqv_R009YYYNN_partial_21_0024 : Poly :=
[
  term ((67598721 : Rat) / 21337981) [(1, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((67598721 : Rat) / 21337981) [(1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-67598721 : Rat) / 42675962) [(1, 1), (12, 2), (15, 1), (16, 1)],
  term ((-67598721 : Rat) / 42675962) [(1, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 21. -/
theorem rs_R009_ueqv_R009YYYNN_partial_21_0024_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_21_0024
        rs_R009_ueqv_R009YYYNN_generator_21_0000_0077 =
      rs_R009_ueqv_R009YYYNN_partial_21_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YYYNN_coefficient_21_0025 : Poly :=
[
  term ((-1982069352 : Rat) / 21337981) [(2, 1), (3, 1), (5, 1)]
]

/-- Partial product 25 for generator 21. -/
def rs_R009_ueqv_R009YYYNN_partial_21_0025 : Poly :=
[
  term ((-3964138704 : Rat) / 21337981) [(2, 1), (3, 1), (5, 1), (8, 1), (12, 1)],
  term ((-3964138704 : Rat) / 21337981) [(2, 1), (3, 1), (5, 1), (9, 1), (13, 1)],
  term ((1982069352 : Rat) / 21337981) [(2, 1), (3, 1), (5, 1), (12, 2)],
  term ((1982069352 : Rat) / 21337981) [(2, 1), (3, 1), (5, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 21. -/
theorem rs_R009_ueqv_R009YYYNN_partial_21_0025_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_21_0025
        rs_R009_ueqv_R009YYYNN_generator_21_0000_0077 =
      rs_R009_ueqv_R009YYYNN_partial_21_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YYYNN_coefficient_21_0026 : Poly :=
[
  term ((7200366048 : Rat) / 21337981) [(2, 1), (3, 1), (5, 1), (15, 2)]
]

/-- Partial product 26 for generator 21. -/
def rs_R009_ueqv_R009YYYNN_partial_21_0026 : Poly :=
[
  term ((14400732096 : Rat) / 21337981) [(2, 1), (3, 1), (5, 1), (8, 1), (12, 1), (15, 2)],
  term ((14400732096 : Rat) / 21337981) [(2, 1), (3, 1), (5, 1), (9, 1), (13, 1), (15, 2)],
  term ((-7200366048 : Rat) / 21337981) [(2, 1), (3, 1), (5, 1), (12, 2), (15, 2)],
  term ((-7200366048 : Rat) / 21337981) [(2, 1), (3, 1), (5, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 21. -/
theorem rs_R009_ueqv_R009YYYNN_partial_21_0026_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_21_0026
        rs_R009_ueqv_R009YYYNN_generator_21_0000_0077 =
      rs_R009_ueqv_R009YYYNN_partial_21_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YYYNN_coefficient_21_0027 : Poly :=
[
  term ((1891080432 : Rat) / 21337981) [(2, 1), (3, 1), (9, 1)]
]

/-- Partial product 27 for generator 21. -/
def rs_R009_ueqv_R009YYYNN_partial_21_0027 : Poly :=
[
  term ((3782160864 : Rat) / 21337981) [(2, 1), (3, 1), (8, 1), (9, 1), (12, 1)],
  term ((-1891080432 : Rat) / 21337981) [(2, 1), (3, 1), (9, 1), (12, 2)],
  term ((-1891080432 : Rat) / 21337981) [(2, 1), (3, 1), (9, 1), (13, 2)],
  term ((3782160864 : Rat) / 21337981) [(2, 1), (3, 1), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 21. -/
theorem rs_R009_ueqv_R009YYYNN_partial_21_0027_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_21_0027
        rs_R009_ueqv_R009YYYNN_generator_21_0000_0077 =
      rs_R009_ueqv_R009YYYNN_partial_21_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YYYNN_coefficient_21_0028 : Poly :=
[
  term ((-3600183024 : Rat) / 21337981) [(2, 1), (3, 1), (9, 1), (15, 2)]
]

/-- Partial product 28 for generator 21. -/
def rs_R009_ueqv_R009YYYNN_partial_21_0028 : Poly :=
[
  term ((-7200366048 : Rat) / 21337981) [(2, 1), (3, 1), (8, 1), (9, 1), (12, 1), (15, 2)],
  term ((3600183024 : Rat) / 21337981) [(2, 1), (3, 1), (9, 1), (12, 2), (15, 2)],
  term ((3600183024 : Rat) / 21337981) [(2, 1), (3, 1), (9, 1), (13, 2), (15, 2)],
  term ((-7200366048 : Rat) / 21337981) [(2, 1), (3, 1), (9, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 21. -/
theorem rs_R009_ueqv_R009YYYNN_partial_21_0028_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_21_0028
        rs_R009_ueqv_R009YYYNN_generator_21_0000_0077 =
      rs_R009_ueqv_R009YYYNN_partial_21_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YYYNN_coefficient_21_0029 : Poly :=
[
  term ((1566871308 : Rat) / 21337981) [(2, 1), (5, 1), (15, 1)]
]

/-- Partial product 29 for generator 21. -/
def rs_R009_ueqv_R009YYYNN_partial_21_0029 : Poly :=
[
  term ((3133742616 : Rat) / 21337981) [(2, 1), (5, 1), (8, 1), (12, 1), (15, 1)],
  term ((3133742616 : Rat) / 21337981) [(2, 1), (5, 1), (9, 1), (13, 1), (15, 1)],
  term ((-1566871308 : Rat) / 21337981) [(2, 1), (5, 1), (12, 2), (15, 1)],
  term ((-1566871308 : Rat) / 21337981) [(2, 1), (5, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 21. -/
theorem rs_R009_ueqv_R009YYYNN_partial_21_0029_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_21_0029
        rs_R009_ueqv_R009YYYNN_generator_21_0000_0077 =
      rs_R009_ueqv_R009YYYNN_partial_21_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YYYNN_coefficient_21_0030 : Poly :=
[
  term ((-81891549 : Rat) / 21337981) [(2, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 30 for generator 21. -/
def rs_R009_ueqv_R009YYYNN_partial_21_0030 : Poly :=
[
  term ((-163783098 : Rat) / 21337981) [(2, 1), (5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-163783098 : Rat) / 21337981) [(2, 1), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((81891549 : Rat) / 21337981) [(2, 1), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((81891549 : Rat) / 21337981) [(2, 1), (5, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 21. -/
theorem rs_R009_ueqv_R009YYYNN_partial_21_0030_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_21_0030
        rs_R009_ueqv_R009YYYNN_generator_21_0000_0077 =
      rs_R009_ueqv_R009YYYNN_partial_21_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YYYNN_coefficient_21_0031 : Poly :=
[
  term ((-4957220448 : Rat) / 21337981) [(2, 1), (5, 1), (15, 3)]
]

/-- Partial product 31 for generator 21. -/
def rs_R009_ueqv_R009YYYNN_partial_21_0031 : Poly :=
[
  term ((-9914440896 : Rat) / 21337981) [(2, 1), (5, 1), (8, 1), (12, 1), (15, 3)],
  term ((-9914440896 : Rat) / 21337981) [(2, 1), (5, 1), (9, 1), (13, 1), (15, 3)],
  term ((4957220448 : Rat) / 21337981) [(2, 1), (5, 1), (12, 2), (15, 3)],
  term ((4957220448 : Rat) / 21337981) [(2, 1), (5, 1), (13, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 21. -/
theorem rs_R009_ueqv_R009YYYNN_partial_21_0031_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_21_0031
        rs_R009_ueqv_R009YYYNN_generator_21_0000_0077 =
      rs_R009_ueqv_R009YYYNN_partial_21_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YYYNN_coefficient_21_0032 : Poly :=
[
  term ((-153646002 : Rat) / 3048283) [(2, 1), (9, 1), (15, 1)]
]

/-- Partial product 32 for generator 21. -/
def rs_R009_ueqv_R009YYYNN_partial_21_0032 : Poly :=
[
  term ((-307292004 : Rat) / 3048283) [(2, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((153646002 : Rat) / 3048283) [(2, 1), (9, 1), (12, 2), (15, 1)],
  term ((153646002 : Rat) / 3048283) [(2, 1), (9, 1), (13, 2), (15, 1)],
  term ((-307292004 : Rat) / 3048283) [(2, 1), (9, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 21. -/
theorem rs_R009_ueqv_R009YYYNN_partial_21_0032_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_21_0032
        rs_R009_ueqv_R009YYYNN_generator_21_0000_0077 =
      rs_R009_ueqv_R009YYYNN_partial_21_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YYYNN_coefficient_21_0033 : Poly :=
[
  term ((2478610224 : Rat) / 21337981) [(2, 1), (9, 1), (15, 3)]
]

/-- Partial product 33 for generator 21. -/
def rs_R009_ueqv_R009YYYNN_partial_21_0033 : Poly :=
[
  term ((4957220448 : Rat) / 21337981) [(2, 1), (8, 1), (9, 1), (12, 1), (15, 3)],
  term ((-2478610224 : Rat) / 21337981) [(2, 1), (9, 1), (12, 2), (15, 3)],
  term ((-2478610224 : Rat) / 21337981) [(2, 1), (9, 1), (13, 2), (15, 3)],
  term ((4957220448 : Rat) / 21337981) [(2, 1), (9, 2), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 21. -/
theorem rs_R009_ueqv_R009YYYNN_partial_21_0033_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_21_0033
        rs_R009_ueqv_R009YYYNN_generator_21_0000_0077 =
      rs_R009_ueqv_R009YYYNN_partial_21_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YYYNN_coefficient_21_0034 : Poly :=
[
  term ((163783098 : Rat) / 21337981) [(2, 1), (13, 1), (15, 1)]
]

/-- Partial product 34 for generator 21. -/
def rs_R009_ueqv_R009YYYNN_partial_21_0034 : Poly :=
[
  term ((327566196 : Rat) / 21337981) [(2, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((327566196 : Rat) / 21337981) [(2, 1), (9, 1), (13, 2), (15, 1)],
  term ((-163783098 : Rat) / 21337981) [(2, 1), (12, 2), (13, 1), (15, 1)],
  term ((-163783098 : Rat) / 21337981) [(2, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 21. -/
theorem rs_R009_ueqv_R009YYYNN_partial_21_0034_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_21_0034
        rs_R009_ueqv_R009YYYNN_generator_21_0000_0077 =
      rs_R009_ueqv_R009YYYNN_partial_21_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YYYNN_coefficient_21_0035 : Poly :=
[
  term ((-81891549 : Rat) / 21337981) [(2, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 35 for generator 21. -/
def rs_R009_ueqv_R009YYYNN_partial_21_0035 : Poly :=
[
  term ((-163783098 : Rat) / 21337981) [(2, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-163783098 : Rat) / 21337981) [(2, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((81891549 : Rat) / 21337981) [(2, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((81891549 : Rat) / 21337981) [(2, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 21. -/
theorem rs_R009_ueqv_R009YYYNN_partial_21_0035_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_21_0035
        rs_R009_ueqv_R009YYYNN_generator_21_0000_0077 =
      rs_R009_ueqv_R009YYYNN_partial_21_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YYYNN_coefficient_21_0036 : Poly :=
[
  term ((-327566196 : Rat) / 21337981) [(2, 1), (15, 2)]
]

/-- Partial product 36 for generator 21. -/
def rs_R009_ueqv_R009YYYNN_partial_21_0036 : Poly :=
[
  term ((-655132392 : Rat) / 21337981) [(2, 1), (8, 1), (12, 1), (15, 2)],
  term ((-655132392 : Rat) / 21337981) [(2, 1), (9, 1), (13, 1), (15, 2)],
  term ((327566196 : Rat) / 21337981) [(2, 1), (12, 2), (15, 2)],
  term ((327566196 : Rat) / 21337981) [(2, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 21. -/
theorem rs_R009_ueqv_R009YYYNN_partial_21_0036_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_21_0036
        rs_R009_ueqv_R009YYYNN_generator_21_0000_0077 =
      rs_R009_ueqv_R009YYYNN_partial_21_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YYYNN_coefficient_21_0037 : Poly :=
[
  term ((81891549 : Rat) / 21337981) [(2, 1), (15, 2), (16, 1)]
]

/-- Partial product 37 for generator 21. -/
def rs_R009_ueqv_R009YYYNN_partial_21_0037 : Poly :=
[
  term ((163783098 : Rat) / 21337981) [(2, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((163783098 : Rat) / 21337981) [(2, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-81891549 : Rat) / 21337981) [(2, 1), (12, 2), (15, 2), (16, 1)],
  term ((-81891549 : Rat) / 21337981) [(2, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 21. -/
theorem rs_R009_ueqv_R009YYYNN_partial_21_0037_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_21_0037
        rs_R009_ueqv_R009YYYNN_generator_21_0000_0077 =
      rs_R009_ueqv_R009YYYNN_partial_21_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YYYNN_coefficient_21_0038 : Poly :=
[
  term ((1663046064 : Rat) / 21337981) [(3, 1), (5, 1)]
]

/-- Partial product 38 for generator 21. -/
def rs_R009_ueqv_R009YYYNN_partial_21_0038 : Poly :=
[
  term ((3326092128 : Rat) / 21337981) [(3, 1), (5, 1), (8, 1), (12, 1)],
  term ((3326092128 : Rat) / 21337981) [(3, 1), (5, 1), (9, 1), (13, 1)],
  term ((-1663046064 : Rat) / 21337981) [(3, 1), (5, 1), (12, 2)],
  term ((-1663046064 : Rat) / 21337981) [(3, 1), (5, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 21. -/
theorem rs_R009_ueqv_R009YYYNN_partial_21_0038_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_21_0038
        rs_R009_ueqv_R009YYYNN_generator_21_0000_0077 =
      rs_R009_ueqv_R009YYYNN_partial_21_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YYYNN_coefficient_21_0039 : Poly :=
[
  term ((121239072 : Rat) / 21337981) [(3, 1), (5, 1), (13, 1), (15, 1)]
]

/-- Partial product 39 for generator 21. -/
def rs_R009_ueqv_R009YYYNN_partial_21_0039 : Poly :=
[
  term ((242478144 : Rat) / 21337981) [(3, 1), (5, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((242478144 : Rat) / 21337981) [(3, 1), (5, 1), (9, 1), (13, 2), (15, 1)],
  term ((-121239072 : Rat) / 21337981) [(3, 1), (5, 1), (12, 2), (13, 1), (15, 1)],
  term ((-121239072 : Rat) / 21337981) [(3, 1), (5, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 21. -/
theorem rs_R009_ueqv_R009YYYNN_partial_21_0039_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_21_0039
        rs_R009_ueqv_R009YYYNN_generator_21_0000_0077 =
      rs_R009_ueqv_R009YYYNN_partial_21_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YYYNN_coefficient_21_0040 : Poly :=
[
  term ((-456954408 : Rat) / 21337981) [(3, 1), (5, 1), (14, 1)]
]

/-- Partial product 40 for generator 21. -/
def rs_R009_ueqv_R009YYYNN_partial_21_0040 : Poly :=
[
  term ((-913908816 : Rat) / 21337981) [(3, 1), (5, 1), (8, 1), (12, 1), (14, 1)],
  term ((-913908816 : Rat) / 21337981) [(3, 1), (5, 1), (9, 1), (13, 1), (14, 1)],
  term ((456954408 : Rat) / 21337981) [(3, 1), (5, 1), (12, 2), (14, 1)],
  term ((456954408 : Rat) / 21337981) [(3, 1), (5, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 21. -/
theorem rs_R009_ueqv_R009YYYNN_partial_21_0040_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_21_0040
        rs_R009_ueqv_R009YYYNN_generator_21_0000_0077 =
      rs_R009_ueqv_R009YYYNN_partial_21_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YYYNN_coefficient_21_0041 : Poly :=
[
  term ((81891549 : Rat) / 21337981) [(3, 1), (5, 1), (14, 1), (16, 1)]
]

/-- Partial product 41 for generator 21. -/
def rs_R009_ueqv_R009YYYNN_partial_21_0041 : Poly :=
[
  term ((163783098 : Rat) / 21337981) [(3, 1), (5, 1), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((163783098 : Rat) / 21337981) [(3, 1), (5, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-81891549 : Rat) / 21337981) [(3, 1), (5, 1), (12, 2), (14, 1), (16, 1)],
  term ((-81891549 : Rat) / 21337981) [(3, 1), (5, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 21. -/
theorem rs_R009_ueqv_R009YYYNN_partial_21_0041_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_21_0041
        rs_R009_ueqv_R009YYYNN_generator_21_0000_0077 =
      rs_R009_ueqv_R009YYYNN_partial_21_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YYYNN_coefficient_21_0042 : Poly :=
[
  term ((-5450573952 : Rat) / 21337981) [(3, 1), (5, 1), (15, 2)]
]

/-- Partial product 42 for generator 21. -/
def rs_R009_ueqv_R009YYYNN_partial_21_0042 : Poly :=
[
  term ((-10901147904 : Rat) / 21337981) [(3, 1), (5, 1), (8, 1), (12, 1), (15, 2)],
  term ((-10901147904 : Rat) / 21337981) [(3, 1), (5, 1), (9, 1), (13, 1), (15, 2)],
  term ((5450573952 : Rat) / 21337981) [(3, 1), (5, 1), (12, 2), (15, 2)],
  term ((5450573952 : Rat) / 21337981) [(3, 1), (5, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 21. -/
theorem rs_R009_ueqv_R009YYYNN_partial_21_0042_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_21_0042
        rs_R009_ueqv_R009YYYNN_generator_21_0000_0077 =
      rs_R009_ueqv_R009YYYNN_partial_21_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YYYNN_coefficient_21_0043 : Poly :=
[
  term ((-105281748 : Rat) / 21337981) [(3, 1), (5, 1), (16, 1)]
]

/-- Partial product 43 for generator 21. -/
def rs_R009_ueqv_R009YYYNN_partial_21_0043 : Poly :=
[
  term ((-210563496 : Rat) / 21337981) [(3, 1), (5, 1), (8, 1), (12, 1), (16, 1)],
  term ((-210563496 : Rat) / 21337981) [(3, 1), (5, 1), (9, 1), (13, 1), (16, 1)],
  term ((105281748 : Rat) / 21337981) [(3, 1), (5, 1), (12, 2), (16, 1)],
  term ((105281748 : Rat) / 21337981) [(3, 1), (5, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 21. -/
theorem rs_R009_ueqv_R009YYYNN_partial_21_0043_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_21_0043
        rs_R009_ueqv_R009YYYNN_generator_21_0000_0077 =
      rs_R009_ueqv_R009YYYNN_partial_21_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YYYNN_coefficient_21_0044 : Poly :=
[
  term ((-831818664 : Rat) / 21337981) [(3, 1), (9, 1)]
]

/-- Partial product 44 for generator 21. -/
def rs_R009_ueqv_R009YYYNN_partial_21_0044 : Poly :=
[
  term ((-1663637328 : Rat) / 21337981) [(3, 1), (8, 1), (9, 1), (12, 1)],
  term ((831818664 : Rat) / 21337981) [(3, 1), (9, 1), (12, 2)],
  term ((831818664 : Rat) / 21337981) [(3, 1), (9, 1), (13, 2)],
  term ((-1663637328 : Rat) / 21337981) [(3, 1), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 21. -/
theorem rs_R009_ueqv_R009YYYNN_partial_21_0044_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_21_0044
        rs_R009_ueqv_R009YYYNN_generator_21_0000_0077 =
      rs_R009_ueqv_R009YYYNN_partial_21_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YYYNN_coefficient_21_0045 : Poly :=
[
  term ((-60619536 : Rat) / 21337981) [(3, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 45 for generator 21. -/
def rs_R009_ueqv_R009YYYNN_partial_21_0045 : Poly :=
[
  term ((-121239072 : Rat) / 21337981) [(3, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((60619536 : Rat) / 21337981) [(3, 1), (9, 1), (12, 2), (13, 1), (15, 1)],
  term ((60619536 : Rat) / 21337981) [(3, 1), (9, 1), (13, 3), (15, 1)],
  term ((-121239072 : Rat) / 21337981) [(3, 1), (9, 2), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 21. -/
theorem rs_R009_ueqv_R009YYYNN_partial_21_0045_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_21_0045
        rs_R009_ueqv_R009YYYNN_generator_21_0000_0077 =
      rs_R009_ueqv_R009YYYNN_partial_21_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YYYNN_coefficient_21_0046 : Poly :=
[
  term ((-535838850 : Rat) / 21337981) [(3, 1), (9, 1), (14, 1)]
]

/-- Partial product 46 for generator 21. -/
def rs_R009_ueqv_R009YYYNN_partial_21_0046 : Poly :=
[
  term ((-1071677700 : Rat) / 21337981) [(3, 1), (8, 1), (9, 1), (12, 1), (14, 1)],
  term ((535838850 : Rat) / 21337981) [(3, 1), (9, 1), (12, 2), (14, 1)],
  term ((535838850 : Rat) / 21337981) [(3, 1), (9, 1), (13, 2), (14, 1)],
  term ((-1071677700 : Rat) / 21337981) [(3, 1), (9, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 21. -/
theorem rs_R009_ueqv_R009YYYNN_partial_21_0046_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_21_0046
        rs_R009_ueqv_R009YYYNN_generator_21_0000_0077 =
      rs_R009_ueqv_R009YYYNN_partial_21_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YYYNN_coefficient_21_0047 : Poly :=
[
  term ((2725286976 : Rat) / 21337981) [(3, 1), (9, 1), (15, 2)]
]

/-- Partial product 47 for generator 21. -/
def rs_R009_ueqv_R009YYYNN_partial_21_0047 : Poly :=
[
  term ((5450573952 : Rat) / 21337981) [(3, 1), (8, 1), (9, 1), (12, 1), (15, 2)],
  term ((-2725286976 : Rat) / 21337981) [(3, 1), (9, 1), (12, 2), (15, 2)],
  term ((-2725286976 : Rat) / 21337981) [(3, 1), (9, 1), (13, 2), (15, 2)],
  term ((5450573952 : Rat) / 21337981) [(3, 1), (9, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 21. -/
theorem rs_R009_ueqv_R009YYYNN_partial_21_0047_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_21_0047
        rs_R009_ueqv_R009YYYNN_generator_21_0000_0077 =
      rs_R009_ueqv_R009YYYNN_partial_21_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YYYNN_coefficient_21_0048 : Poly :=
[
  term ((75129426 : Rat) / 21337981) [(3, 1), (13, 1)]
]

/-- Partial product 48 for generator 21. -/
def rs_R009_ueqv_R009YYYNN_partial_21_0048 : Poly :=
[
  term ((150258852 : Rat) / 21337981) [(3, 1), (8, 1), (12, 1), (13, 1)],
  term ((150258852 : Rat) / 21337981) [(3, 1), (9, 1), (13, 2)],
  term ((-75129426 : Rat) / 21337981) [(3, 1), (12, 2), (13, 1)],
  term ((-75129426 : Rat) / 21337981) [(3, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 21. -/
theorem rs_R009_ueqv_R009YYYNN_partial_21_0048_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_21_0048
        rs_R009_ueqv_R009YYYNN_generator_21_0000_0077 =
      rs_R009_ueqv_R009YYYNN_partial_21_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YYYNN_coefficient_21_0049 : Poly :=
[
  term ((13524246 : Rat) / 21337981) [(3, 1), (13, 1), (14, 1)]
]

/-- Partial product 49 for generator 21. -/
def rs_R009_ueqv_R009YYYNN_partial_21_0049 : Poly :=
[
  term ((27048492 : Rat) / 21337981) [(3, 1), (8, 1), (12, 1), (13, 1), (14, 1)],
  term ((27048492 : Rat) / 21337981) [(3, 1), (9, 1), (13, 2), (14, 1)],
  term ((-13524246 : Rat) / 21337981) [(3, 1), (12, 2), (13, 1), (14, 1)],
  term ((-13524246 : Rat) / 21337981) [(3, 1), (13, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 21. -/
theorem rs_R009_ueqv_R009YYYNN_partial_21_0049_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_21_0049
        rs_R009_ueqv_R009YYYNN_generator_21_0000_0077 =
      rs_R009_ueqv_R009YYYNN_partial_21_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YYYNN_coefficient_21_0050 : Poly :=
[
  term ((81891549 : Rat) / 21337981) [(3, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 50 for generator 21. -/
def rs_R009_ueqv_R009YYYNN_partial_21_0050 : Poly :=
[
  term ((163783098 : Rat) / 21337981) [(3, 1), (8, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((163783098 : Rat) / 21337981) [(3, 1), (9, 1), (13, 2), (14, 1), (16, 1)],
  term ((-81891549 : Rat) / 21337981) [(3, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-81891549 : Rat) / 21337981) [(3, 1), (13, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 21. -/
theorem rs_R009_ueqv_R009YYYNN_partial_21_0050_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_21_0050
        rs_R009_ueqv_R009YYYNN_generator_21_0000_0077 =
      rs_R009_ueqv_R009YYYNN_partial_21_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YYYNN_coefficient_21_0051 : Poly :=
[
  term ((-105281748 : Rat) / 21337981) [(3, 1), (13, 1), (16, 1)]
]

/-- Partial product 51 for generator 21. -/
def rs_R009_ueqv_R009YYYNN_partial_21_0051 : Poly :=
[
  term ((-210563496 : Rat) / 21337981) [(3, 1), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((-210563496 : Rat) / 21337981) [(3, 1), (9, 1), (13, 2), (16, 1)],
  term ((105281748 : Rat) / 21337981) [(3, 1), (12, 2), (13, 1), (16, 1)],
  term ((105281748 : Rat) / 21337981) [(3, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 21. -/
theorem rs_R009_ueqv_R009YYYNN_partial_21_0051_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_21_0051
        rs_R009_ueqv_R009YYYNN_generator_21_0000_0077 =
      rs_R009_ueqv_R009YYYNN_partial_21_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YYYNN_coefficient_21_0052 : Poly :=
[
  term ((314293176 : Rat) / 21337981) [(3, 1), (14, 1), (15, 1)]
]

/-- Partial product 52 for generator 21. -/
def rs_R009_ueqv_R009YYYNN_partial_21_0052 : Poly :=
[
  term ((628586352 : Rat) / 21337981) [(3, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((628586352 : Rat) / 21337981) [(3, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((-314293176 : Rat) / 21337981) [(3, 1), (12, 2), (14, 1), (15, 1)],
  term ((-314293176 : Rat) / 21337981) [(3, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 21. -/
theorem rs_R009_ueqv_R009YYYNN_partial_21_0052_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_21_0052
        rs_R009_ueqv_R009YYYNN_generator_21_0000_0077 =
      rs_R009_ueqv_R009YYYNN_partial_21_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YYYNN_coefficient_21_0053 : Poly :=
[
  term ((-81891549 : Rat) / 21337981) [(3, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 53 for generator 21. -/
def rs_R009_ueqv_R009YYYNN_partial_21_0053 : Poly :=
[
  term ((-163783098 : Rat) / 21337981) [(3, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-163783098 : Rat) / 21337981) [(3, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((81891549 : Rat) / 21337981) [(3, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((81891549 : Rat) / 21337981) [(3, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 21. -/
theorem rs_R009_ueqv_R009YYYNN_partial_21_0053_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_21_0053
        rs_R009_ueqv_R009YYYNN_generator_21_0000_0077 =
      rs_R009_ueqv_R009YYYNN_partial_21_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YYYNN_coefficient_21_0054 : Poly :=
[
  term ((-52530012 : Rat) / 3048283) [(3, 1), (15, 1)]
]

/-- Partial product 54 for generator 21. -/
def rs_R009_ueqv_R009YYYNN_partial_21_0054 : Poly :=
[
  term ((-105060024 : Rat) / 3048283) [(3, 1), (8, 1), (12, 1), (15, 1)],
  term ((-105060024 : Rat) / 3048283) [(3, 1), (9, 1), (13, 1), (15, 1)],
  term ((52530012 : Rat) / 3048283) [(3, 1), (12, 2), (15, 1)],
  term ((52530012 : Rat) / 3048283) [(3, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 21. -/
theorem rs_R009_ueqv_R009YYYNN_partial_21_0054_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_21_0054
        rs_R009_ueqv_R009YYYNN_generator_21_0000_0077 =
      rs_R009_ueqv_R009YYYNN_partial_21_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YYYNN_coefficient_21_0055 : Poly :=
[
  term ((105281748 : Rat) / 21337981) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 55 for generator 21. -/
def rs_R009_ueqv_R009YYYNN_partial_21_0055 : Poly :=
[
  term ((210563496 : Rat) / 21337981) [(3, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((210563496 : Rat) / 21337981) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-105281748 : Rat) / 21337981) [(3, 1), (12, 2), (15, 1), (16, 1)],
  term ((-105281748 : Rat) / 21337981) [(3, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 21. -/
theorem rs_R009_ueqv_R009YYYNN_partial_21_0055_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_21_0055
        rs_R009_ueqv_R009YYYNN_generator_21_0000_0077 =
      rs_R009_ueqv_R009YYYNN_partial_21_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YYYNN_coefficient_21_0056 : Poly :=
[
  term ((-60659280 : Rat) / 21337981) [(3, 2), (5, 1), (13, 1)]
]

/-- Partial product 56 for generator 21. -/
def rs_R009_ueqv_R009YYYNN_partial_21_0056 : Poly :=
[
  term ((-121318560 : Rat) / 21337981) [(3, 2), (5, 1), (8, 1), (12, 1), (13, 1)],
  term ((-121318560 : Rat) / 21337981) [(3, 2), (5, 1), (9, 1), (13, 2)],
  term ((60659280 : Rat) / 21337981) [(3, 2), (5, 1), (12, 2), (13, 1)],
  term ((60659280 : Rat) / 21337981) [(3, 2), (5, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 21. -/
theorem rs_R009_ueqv_R009YYYNN_partial_21_0056_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_21_0056
        rs_R009_ueqv_R009YYYNN_generator_21_0000_0077 =
      rs_R009_ueqv_R009YYYNN_partial_21_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YYYNN_coefficient_21_0057 : Poly :=
[
  term ((-2932930944 : Rat) / 21337981) [(3, 2), (5, 1), (15, 1)]
]

/-- Partial product 57 for generator 21. -/
def rs_R009_ueqv_R009YYYNN_partial_21_0057 : Poly :=
[
  term ((-5865861888 : Rat) / 21337981) [(3, 2), (5, 1), (8, 1), (12, 1), (15, 1)],
  term ((-5865861888 : Rat) / 21337981) [(3, 2), (5, 1), (9, 1), (13, 1), (15, 1)],
  term ((2932930944 : Rat) / 21337981) [(3, 2), (5, 1), (12, 2), (15, 1)],
  term ((2932930944 : Rat) / 21337981) [(3, 2), (5, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 21. -/
theorem rs_R009_ueqv_R009YYYNN_partial_21_0057_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_21_0057
        rs_R009_ueqv_R009YYYNN_generator_21_0000_0077 =
      rs_R009_ueqv_R009YYYNN_partial_21_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YYYNN_coefficient_21_0058 : Poly :=
[
  term ((30329640 : Rat) / 21337981) [(3, 2), (9, 1), (13, 1)]
]

/-- Partial product 58 for generator 21. -/
def rs_R009_ueqv_R009YYYNN_partial_21_0058 : Poly :=
[
  term ((60659280 : Rat) / 21337981) [(3, 2), (8, 1), (9, 1), (12, 1), (13, 1)],
  term ((-30329640 : Rat) / 21337981) [(3, 2), (9, 1), (12, 2), (13, 1)],
  term ((-30329640 : Rat) / 21337981) [(3, 2), (9, 1), (13, 3)],
  term ((60659280 : Rat) / 21337981) [(3, 2), (9, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 21. -/
theorem rs_R009_ueqv_R009YYYNN_partial_21_0058_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_21_0058
        rs_R009_ueqv_R009YYYNN_generator_21_0000_0077 =
      rs_R009_ueqv_R009YYYNN_partial_21_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YYYNN_coefficient_21_0059 : Poly :=
[
  term ((1466465472 : Rat) / 21337981) [(3, 2), (9, 1), (15, 1)]
]

/-- Partial product 59 for generator 21. -/
def rs_R009_ueqv_R009YYYNN_partial_21_0059 : Poly :=
[
  term ((2932930944 : Rat) / 21337981) [(3, 2), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-1466465472 : Rat) / 21337981) [(3, 2), (9, 1), (12, 2), (15, 1)],
  term ((-1466465472 : Rat) / 21337981) [(3, 2), (9, 1), (13, 2), (15, 1)],
  term ((2932930944 : Rat) / 21337981) [(3, 2), (9, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 21. -/
theorem rs_R009_ueqv_R009YYYNN_partial_21_0059_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_21_0059
        rs_R009_ueqv_R009YYYNN_generator_21_0000_0077 =
      rs_R009_ueqv_R009YYYNN_partial_21_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YYYNN_coefficient_21_0060 : Poly :=
[
  term ((35506406 : Rat) / 21337981) [(5, 1), (13, 1)]
]

/-- Partial product 60 for generator 21. -/
def rs_R009_ueqv_R009YYYNN_partial_21_0060 : Poly :=
[
  term ((71012812 : Rat) / 21337981) [(5, 1), (8, 1), (12, 1), (13, 1)],
  term ((71012812 : Rat) / 21337981) [(5, 1), (9, 1), (13, 2)],
  term ((-35506406 : Rat) / 21337981) [(5, 1), (12, 2), (13, 1)],
  term ((-35506406 : Rat) / 21337981) [(5, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 21. -/
theorem rs_R009_ueqv_R009YYYNN_partial_21_0060_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_21_0060
        rs_R009_ueqv_R009YYYNN_generator_21_0000_0077 =
      rs_R009_ueqv_R009YYYNN_partial_21_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YYYNN_coefficient_21_0061 : Poly :=
[
  term ((-17753203 : Rat) / 42675962) [(5, 1), (13, 1), (16, 1)]
]

/-- Partial product 61 for generator 21. -/
def rs_R009_ueqv_R009YYYNN_partial_21_0061 : Poly :=
[
  term ((-17753203 : Rat) / 21337981) [(5, 1), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((-17753203 : Rat) / 21337981) [(5, 1), (9, 1), (13, 2), (16, 1)],
  term ((17753203 : Rat) / 42675962) [(5, 1), (12, 2), (13, 1), (16, 1)],
  term ((17753203 : Rat) / 42675962) [(5, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 21. -/
theorem rs_R009_ueqv_R009YYYNN_partial_21_0061_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_21_0061
        rs_R009_ueqv_R009YYYNN_generator_21_0000_0077 =
      rs_R009_ueqv_R009YYYNN_partial_21_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YYYNN_coefficient_21_0062 : Poly :=
[
  term ((-619652556 : Rat) / 21337981) [(5, 1), (14, 1), (15, 1)]
]

/-- Partial product 62 for generator 21. -/
def rs_R009_ueqv_R009YYYNN_partial_21_0062 : Poly :=
[
  term ((-1239305112 : Rat) / 21337981) [(5, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1239305112 : Rat) / 21337981) [(5, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((619652556 : Rat) / 21337981) [(5, 1), (12, 2), (14, 1), (15, 1)],
  term ((619652556 : Rat) / 21337981) [(5, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 21. -/
theorem rs_R009_ueqv_R009YYYNN_partial_21_0062_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_21_0062
        rs_R009_ueqv_R009YYYNN_generator_21_0000_0077 =
      rs_R009_ueqv_R009YYYNN_partial_21_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YYYNN_coefficient_21_0063 : Poly :=
[
  term ((-905582106 : Rat) / 21337981) [(5, 1), (15, 1)]
]

/-- Partial product 63 for generator 21. -/
def rs_R009_ueqv_R009YYYNN_partial_21_0063 : Poly :=
[
  term ((-1811164212 : Rat) / 21337981) [(5, 1), (8, 1), (12, 1), (15, 1)],
  term ((-1811164212 : Rat) / 21337981) [(5, 1), (9, 1), (13, 1), (15, 1)],
  term ((905582106 : Rat) / 21337981) [(5, 1), (12, 2), (15, 1)],
  term ((905582106 : Rat) / 21337981) [(5, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 21. -/
theorem rs_R009_ueqv_R009YYYNN_partial_21_0063_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_21_0063
        rs_R009_ueqv_R009YYYNN_generator_21_0000_0077 =
      rs_R009_ueqv_R009YYYNN_partial_21_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YYYNN_coefficient_21_0064 : Poly :=
[
  term ((142964775 : Rat) / 42675962) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 64 for generator 21. -/
def rs_R009_ueqv_R009YYYNN_partial_21_0064 : Poly :=
[
  term ((142964775 : Rat) / 21337981) [(5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((142964775 : Rat) / 21337981) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-142964775 : Rat) / 42675962) [(5, 1), (12, 2), (15, 1), (16, 1)],
  term ((-142964775 : Rat) / 42675962) [(5, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 21. -/
theorem rs_R009_ueqv_R009YYYNN_partial_21_0064_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_21_0064
        rs_R009_ueqv_R009YYYNN_generator_21_0000_0077 =
      rs_R009_ueqv_R009YYYNN_partial_21_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YYYNN_coefficient_21_0065 : Poly :=
[
  term ((4957220448 : Rat) / 21337981) [(5, 1), (15, 3)]
]

/-- Partial product 65 for generator 21. -/
def rs_R009_ueqv_R009YYYNN_partial_21_0065 : Poly :=
[
  term ((9914440896 : Rat) / 21337981) [(5, 1), (8, 1), (12, 1), (15, 3)],
  term ((9914440896 : Rat) / 21337981) [(5, 1), (9, 1), (13, 1), (15, 3)],
  term ((-4957220448 : Rat) / 21337981) [(5, 1), (12, 2), (15, 3)],
  term ((-4957220448 : Rat) / 21337981) [(5, 1), (13, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 21. -/
theorem rs_R009_ueqv_R009YYYNN_partial_21_0065_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_21_0065
        rs_R009_ueqv_R009YYYNN_generator_21_0000_0077 =
      rs_R009_ueqv_R009YYYNN_partial_21_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YYYNN_coefficient_21_0066 : Poly :=
[
  term ((-23498213 : Rat) / 42675962) [(9, 1), (13, 1)]
]

/-- Partial product 66 for generator 21. -/
def rs_R009_ueqv_R009YYYNN_partial_21_0066 : Poly :=
[
  term ((-23498213 : Rat) / 21337981) [(8, 1), (9, 1), (12, 1), (13, 1)],
  term ((23498213 : Rat) / 42675962) [(9, 1), (12, 2), (13, 1)],
  term ((23498213 : Rat) / 42675962) [(9, 1), (13, 3)],
  term ((-23498213 : Rat) / 21337981) [(9, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 21. -/
theorem rs_R009_ueqv_R009YYYNN_partial_21_0066_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_21_0066
        rs_R009_ueqv_R009YYYNN_generator_21_0000_0077 =
      rs_R009_ueqv_R009YYYNN_partial_21_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YYYNN_coefficient_21_0067 : Poly :=
[
  term ((744038307 : Rat) / 21337981) [(9, 1), (14, 1), (15, 1)]
]

/-- Partial product 67 for generator 21. -/
def rs_R009_ueqv_R009YYYNN_partial_21_0067 : Poly :=
[
  term ((1488076614 : Rat) / 21337981) [(8, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-744038307 : Rat) / 21337981) [(9, 1), (12, 2), (14, 1), (15, 1)],
  term ((-744038307 : Rat) / 21337981) [(9, 1), (13, 2), (14, 1), (15, 1)],
  term ((1488076614 : Rat) / 21337981) [(9, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 21. -/
theorem rs_R009_ueqv_R009YYYNN_partial_21_0067_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_21_0067
        rs_R009_ueqv_R009YYYNN_generator_21_0000_0077 =
      rs_R009_ueqv_R009YYYNN_partial_21_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YYYNN_coefficient_21_0068 : Poly :=
[
  term ((309413997 : Rat) / 21337981) [(9, 1), (15, 1)]
]

/-- Partial product 68 for generator 21. -/
def rs_R009_ueqv_R009YYYNN_partial_21_0068 : Poly :=
[
  term ((618827994 : Rat) / 21337981) [(8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-309413997 : Rat) / 21337981) [(9, 1), (12, 2), (15, 1)],
  term ((-309413997 : Rat) / 21337981) [(9, 1), (13, 2), (15, 1)],
  term ((618827994 : Rat) / 21337981) [(9, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 21. -/
theorem rs_R009_ueqv_R009YYYNN_partial_21_0068_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_21_0068
        rs_R009_ueqv_R009YYYNN_generator_21_0000_0077 =
      rs_R009_ueqv_R009YYYNN_partial_21_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YYYNN_coefficient_21_0069 : Poly :=
[
  term ((-2478610224 : Rat) / 21337981) [(9, 1), (15, 3)]
]

/-- Partial product 69 for generator 21. -/
def rs_R009_ueqv_R009YYYNN_partial_21_0069 : Poly :=
[
  term ((-4957220448 : Rat) / 21337981) [(8, 1), (9, 1), (12, 1), (15, 3)],
  term ((2478610224 : Rat) / 21337981) [(9, 1), (12, 2), (15, 3)],
  term ((2478610224 : Rat) / 21337981) [(9, 1), (13, 2), (15, 3)],
  term ((-4957220448 : Rat) / 21337981) [(9, 2), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 21. -/
theorem rs_R009_ueqv_R009YYYNN_partial_21_0069_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_21_0069
        rs_R009_ueqv_R009YYYNN_generator_21_0000_0077 =
      rs_R009_ueqv_R009YYYNN_partial_21_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YYYNN_coefficient_21_0070 : Poly :=
[
  term ((-44139420 : Rat) / 21337981) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 70 for generator 21. -/
def rs_R009_ueqv_R009YYYNN_partial_21_0070 : Poly :=
[
  term ((-88278840 : Rat) / 21337981) [(8, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-88278840 : Rat) / 21337981) [(9, 1), (13, 2), (14, 1), (15, 1)],
  term ((44139420 : Rat) / 21337981) [(12, 2), (13, 1), (14, 1), (15, 1)],
  term ((44139420 : Rat) / 21337981) [(13, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 21. -/
theorem rs_R009_ueqv_R009YYYNN_partial_21_0070_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_21_0070
        rs_R009_ueqv_R009YYYNN_generator_21_0000_0077 =
      rs_R009_ueqv_R009YYYNN_partial_21_0070 := by
  native_decide

/-- Coefficient term 71 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YYYNN_coefficient_21_0071 : Poly :=
[
  term ((-271418583 : Rat) / 42675962) [(13, 1), (15, 1)]
]

/-- Partial product 71 for generator 21. -/
def rs_R009_ueqv_R009YYYNN_partial_21_0071 : Poly :=
[
  term ((-271418583 : Rat) / 21337981) [(8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-271418583 : Rat) / 21337981) [(9, 1), (13, 2), (15, 1)],
  term ((271418583 : Rat) / 42675962) [(12, 2), (13, 1), (15, 1)],
  term ((271418583 : Rat) / 42675962) [(13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 71 for generator 21. -/
theorem rs_R009_ueqv_R009YYYNN_partial_21_0071_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_21_0071
        rs_R009_ueqv_R009YYYNN_generator_21_0000_0077 =
      rs_R009_ueqv_R009YYYNN_partial_21_0071 := by
  native_decide

/-- Coefficient term 72 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YYYNN_coefficient_21_0072 : Poly :=
[
  term ((80358989 : Rat) / 21337981) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 72 for generator 21. -/
def rs_R009_ueqv_R009YYYNN_partial_21_0072 : Poly :=
[
  term ((160717978 : Rat) / 21337981) [(8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((160717978 : Rat) / 21337981) [(9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-80358989 : Rat) / 21337981) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-80358989 : Rat) / 21337981) [(13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 72 for generator 21. -/
theorem rs_R009_ueqv_R009YYYNN_partial_21_0072_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_21_0072
        rs_R009_ueqv_R009YYYNN_generator_21_0000_0077 =
      rs_R009_ueqv_R009YYYNN_partial_21_0072 := by
  native_decide

/-- Coefficient term 73 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YYYNN_coefficient_21_0073 : Poly :=
[
  term ((-17753203 : Rat) / 42675962) [(13, 2), (16, 1)]
]

/-- Partial product 73 for generator 21. -/
def rs_R009_ueqv_R009YYYNN_partial_21_0073 : Poly :=
[
  term ((-17753203 : Rat) / 21337981) [(8, 1), (12, 1), (13, 2), (16, 1)],
  term ((-17753203 : Rat) / 21337981) [(9, 1), (13, 3), (16, 1)],
  term ((17753203 : Rat) / 42675962) [(12, 2), (13, 2), (16, 1)],
  term ((17753203 : Rat) / 42675962) [(13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 73 for generator 21. -/
theorem rs_R009_ueqv_R009YYYNN_partial_21_0073_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_21_0073
        rs_R009_ueqv_R009YYYNN_generator_21_0000_0077 =
      rs_R009_ueqv_R009YYYNN_partial_21_0073 := by
  native_decide

/-- Coefficient term 74 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YYYNN_coefficient_21_0074 : Poly :=
[
  term ((-12008193 : Rat) / 85351924) [(14, 1)]
]

/-- Partial product 74 for generator 21. -/
def rs_R009_ueqv_R009YYYNN_partial_21_0074 : Poly :=
[
  term ((-12008193 : Rat) / 42675962) [(8, 1), (12, 1), (14, 1)],
  term ((-12008193 : Rat) / 42675962) [(9, 1), (13, 1), (14, 1)],
  term ((12008193 : Rat) / 85351924) [(12, 2), (14, 1)],
  term ((12008193 : Rat) / 85351924) [(13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 74 for generator 21. -/
theorem rs_R009_ueqv_R009YYYNN_partial_21_0074_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_21_0074
        rs_R009_ueqv_R009YYYNN_generator_21_0000_0077 =
      rs_R009_ueqv_R009YYYNN_partial_21_0074 := by
  native_decide

/-- Coefficient term 75 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YYYNN_coefficient_21_0075 : Poly :=
[
  term ((-17769393 : Rat) / 3048283) [(14, 1), (15, 2)]
]

/-- Partial product 75 for generator 21. -/
def rs_R009_ueqv_R009YYYNN_partial_21_0075 : Poly :=
[
  term ((-35538786 : Rat) / 3048283) [(8, 1), (12, 1), (14, 1), (15, 2)],
  term ((-35538786 : Rat) / 3048283) [(9, 1), (13, 1), (14, 1), (15, 2)],
  term ((17769393 : Rat) / 3048283) [(12, 2), (14, 1), (15, 2)],
  term ((17769393 : Rat) / 3048283) [(13, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 75 for generator 21. -/
theorem rs_R009_ueqv_R009YYYNN_partial_21_0075_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_21_0075
        rs_R009_ueqv_R009YYYNN_generator_21_0000_0077 =
      rs_R009_ueqv_R009YYYNN_partial_21_0075 := by
  native_decide

/-- Coefficient term 76 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YYYNN_coefficient_21_0076 : Poly :=
[
  term ((443470227 : Rat) / 42675962) [(15, 2)]
]

/-- Partial product 76 for generator 21. -/
def rs_R009_ueqv_R009YYYNN_partial_21_0076 : Poly :=
[
  term ((443470227 : Rat) / 21337981) [(8, 1), (12, 1), (15, 2)],
  term ((443470227 : Rat) / 21337981) [(9, 1), (13, 1), (15, 2)],
  term ((-443470227 : Rat) / 42675962) [(12, 2), (15, 2)],
  term ((-443470227 : Rat) / 42675962) [(13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 76 for generator 21. -/
theorem rs_R009_ueqv_R009YYYNN_partial_21_0076_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_21_0076
        rs_R009_ueqv_R009YYYNN_generator_21_0000_0077 =
      rs_R009_ueqv_R009YYYNN_partial_21_0076 := by
  native_decide

/-- Coefficient term 77 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YYYNN_coefficient_21_0077 : Poly :=
[
  term ((-142964775 : Rat) / 42675962) [(15, 2), (16, 1)]
]

/-- Partial product 77 for generator 21. -/
def rs_R009_ueqv_R009YYYNN_partial_21_0077 : Poly :=
[
  term ((-142964775 : Rat) / 21337981) [(8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-142964775 : Rat) / 21337981) [(9, 1), (13, 1), (15, 2), (16, 1)],
  term ((142964775 : Rat) / 42675962) [(12, 2), (15, 2), (16, 1)],
  term ((142964775 : Rat) / 42675962) [(13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 77 for generator 21. -/
theorem rs_R009_ueqv_R009YYYNN_partial_21_0077_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_21_0077
        rs_R009_ueqv_R009YYYNN_generator_21_0000_0077 =
      rs_R009_ueqv_R009YYYNN_partial_21_0077 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009YYYNN_partials_21_0000_0077 : List Poly :=
[
  rs_R009_ueqv_R009YYYNN_partial_21_0000,
  rs_R009_ueqv_R009YYYNN_partial_21_0001,
  rs_R009_ueqv_R009YYYNN_partial_21_0002,
  rs_R009_ueqv_R009YYYNN_partial_21_0003,
  rs_R009_ueqv_R009YYYNN_partial_21_0004,
  rs_R009_ueqv_R009YYYNN_partial_21_0005,
  rs_R009_ueqv_R009YYYNN_partial_21_0006,
  rs_R009_ueqv_R009YYYNN_partial_21_0007,
  rs_R009_ueqv_R009YYYNN_partial_21_0008,
  rs_R009_ueqv_R009YYYNN_partial_21_0009,
  rs_R009_ueqv_R009YYYNN_partial_21_0010,
  rs_R009_ueqv_R009YYYNN_partial_21_0011,
  rs_R009_ueqv_R009YYYNN_partial_21_0012,
  rs_R009_ueqv_R009YYYNN_partial_21_0013,
  rs_R009_ueqv_R009YYYNN_partial_21_0014,
  rs_R009_ueqv_R009YYYNN_partial_21_0015,
  rs_R009_ueqv_R009YYYNN_partial_21_0016,
  rs_R009_ueqv_R009YYYNN_partial_21_0017,
  rs_R009_ueqv_R009YYYNN_partial_21_0018,
  rs_R009_ueqv_R009YYYNN_partial_21_0019,
  rs_R009_ueqv_R009YYYNN_partial_21_0020,
  rs_R009_ueqv_R009YYYNN_partial_21_0021,
  rs_R009_ueqv_R009YYYNN_partial_21_0022,
  rs_R009_ueqv_R009YYYNN_partial_21_0023,
  rs_R009_ueqv_R009YYYNN_partial_21_0024,
  rs_R009_ueqv_R009YYYNN_partial_21_0025,
  rs_R009_ueqv_R009YYYNN_partial_21_0026,
  rs_R009_ueqv_R009YYYNN_partial_21_0027,
  rs_R009_ueqv_R009YYYNN_partial_21_0028,
  rs_R009_ueqv_R009YYYNN_partial_21_0029,
  rs_R009_ueqv_R009YYYNN_partial_21_0030,
  rs_R009_ueqv_R009YYYNN_partial_21_0031,
  rs_R009_ueqv_R009YYYNN_partial_21_0032,
  rs_R009_ueqv_R009YYYNN_partial_21_0033,
  rs_R009_ueqv_R009YYYNN_partial_21_0034,
  rs_R009_ueqv_R009YYYNN_partial_21_0035,
  rs_R009_ueqv_R009YYYNN_partial_21_0036,
  rs_R009_ueqv_R009YYYNN_partial_21_0037,
  rs_R009_ueqv_R009YYYNN_partial_21_0038,
  rs_R009_ueqv_R009YYYNN_partial_21_0039,
  rs_R009_ueqv_R009YYYNN_partial_21_0040,
  rs_R009_ueqv_R009YYYNN_partial_21_0041,
  rs_R009_ueqv_R009YYYNN_partial_21_0042,
  rs_R009_ueqv_R009YYYNN_partial_21_0043,
  rs_R009_ueqv_R009YYYNN_partial_21_0044,
  rs_R009_ueqv_R009YYYNN_partial_21_0045,
  rs_R009_ueqv_R009YYYNN_partial_21_0046,
  rs_R009_ueqv_R009YYYNN_partial_21_0047,
  rs_R009_ueqv_R009YYYNN_partial_21_0048,
  rs_R009_ueqv_R009YYYNN_partial_21_0049,
  rs_R009_ueqv_R009YYYNN_partial_21_0050,
  rs_R009_ueqv_R009YYYNN_partial_21_0051,
  rs_R009_ueqv_R009YYYNN_partial_21_0052,
  rs_R009_ueqv_R009YYYNN_partial_21_0053,
  rs_R009_ueqv_R009YYYNN_partial_21_0054,
  rs_R009_ueqv_R009YYYNN_partial_21_0055,
  rs_R009_ueqv_R009YYYNN_partial_21_0056,
  rs_R009_ueqv_R009YYYNN_partial_21_0057,
  rs_R009_ueqv_R009YYYNN_partial_21_0058,
  rs_R009_ueqv_R009YYYNN_partial_21_0059,
  rs_R009_ueqv_R009YYYNN_partial_21_0060,
  rs_R009_ueqv_R009YYYNN_partial_21_0061,
  rs_R009_ueqv_R009YYYNN_partial_21_0062,
  rs_R009_ueqv_R009YYYNN_partial_21_0063,
  rs_R009_ueqv_R009YYYNN_partial_21_0064,
  rs_R009_ueqv_R009YYYNN_partial_21_0065,
  rs_R009_ueqv_R009YYYNN_partial_21_0066,
  rs_R009_ueqv_R009YYYNN_partial_21_0067,
  rs_R009_ueqv_R009YYYNN_partial_21_0068,
  rs_R009_ueqv_R009YYYNN_partial_21_0069,
  rs_R009_ueqv_R009YYYNN_partial_21_0070,
  rs_R009_ueqv_R009YYYNN_partial_21_0071,
  rs_R009_ueqv_R009YYYNN_partial_21_0072,
  rs_R009_ueqv_R009YYYNN_partial_21_0073,
  rs_R009_ueqv_R009YYYNN_partial_21_0074,
  rs_R009_ueqv_R009YYYNN_partial_21_0075,
  rs_R009_ueqv_R009YYYNN_partial_21_0076,
  rs_R009_ueqv_R009YYYNN_partial_21_0077
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009YYYNN_block_21_0000_0077 : Poly :=
[
  term ((-7637616 : Rat) / 435469) [(0, 1), (3, 1), (5, 1), (8, 1), (12, 1)],
  term ((1909404 : Rat) / 435469) [(0, 1), (3, 1), (5, 1), (8, 1), (12, 1), (16, 1)],
  term ((-7637616 : Rat) / 435469) [(0, 1), (3, 1), (5, 1), (9, 1), (13, 1)],
  term ((1909404 : Rat) / 435469) [(0, 1), (3, 1), (5, 1), (9, 1), (13, 1), (16, 1)],
  term ((3818808 : Rat) / 435469) [(0, 1), (3, 1), (5, 1), (12, 2)],
  term ((-954702 : Rat) / 435469) [(0, 1), (3, 1), (5, 1), (12, 2), (16, 1)],
  term ((3818808 : Rat) / 435469) [(0, 1), (3, 1), (5, 1), (13, 2)],
  term ((-954702 : Rat) / 435469) [(0, 1), (3, 1), (5, 1), (13, 2), (16, 1)],
  term ((-495561744 : Rat) / 21337981) [(0, 1), (3, 1), (8, 1), (9, 1), (12, 1)],
  term ((1909404 : Rat) / 435469) [(0, 1), (3, 1), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1909404 : Rat) / 435469) [(0, 1), (3, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((247780872 : Rat) / 21337981) [(0, 1), (3, 1), (9, 1), (12, 2)],
  term ((-1909404 : Rat) / 435469) [(0, 1), (3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((247780872 : Rat) / 21337981) [(0, 1), (3, 1), (9, 1), (13, 2)],
  term ((1909404 : Rat) / 435469) [(0, 1), (3, 1), (9, 1), (13, 2), (16, 1)],
  term ((-495561744 : Rat) / 21337981) [(0, 1), (3, 1), (9, 2), (13, 1)],
  term ((-954702 : Rat) / 435469) [(0, 1), (3, 1), (12, 2), (13, 1), (16, 1)],
  term ((954702 : Rat) / 435469) [(0, 1), (3, 1), (12, 2), (15, 1), (16, 1)],
  term ((954702 : Rat) / 435469) [(0, 1), (3, 1), (13, 2), (15, 1), (16, 1)],
  term ((-954702 : Rat) / 435469) [(0, 1), (3, 1), (13, 3), (16, 1)],
  term ((-166546584 : Rat) / 21337981) [(0, 1), (5, 1), (8, 1), (12, 1), (15, 1)],
  term ((41636646 : Rat) / 21337981) [(0, 1), (5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-166546584 : Rat) / 21337981) [(0, 1), (5, 1), (9, 1), (13, 1), (15, 1)],
  term ((41636646 : Rat) / 21337981) [(0, 1), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((83273292 : Rat) / 21337981) [(0, 1), (5, 1), (12, 2), (15, 1)],
  term ((-20818323 : Rat) / 21337981) [(0, 1), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((83273292 : Rat) / 21337981) [(0, 1), (5, 1), (13, 2), (15, 1)],
  term ((-20818323 : Rat) / 21337981) [(0, 1), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((508602474 : Rat) / 21337981) [(0, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((41636646 : Rat) / 21337981) [(0, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-41636646 : Rat) / 21337981) [(0, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-254301237 : Rat) / 21337981) [(0, 1), (9, 1), (12, 2), (15, 1)],
  term ((-41636646 : Rat) / 21337981) [(0, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-254301237 : Rat) / 21337981) [(0, 1), (9, 1), (13, 2), (15, 1)],
  term ((41636646 : Rat) / 21337981) [(0, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((508602474 : Rat) / 21337981) [(0, 1), (9, 2), (13, 1), (15, 1)],
  term ((-20818323 : Rat) / 21337981) [(0, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((20818323 : Rat) / 21337981) [(0, 1), (12, 2), (15, 2), (16, 1)],
  term ((20818323 : Rat) / 21337981) [(0, 1), (13, 2), (15, 2), (16, 1)],
  term ((-20818323 : Rat) / 21337981) [(0, 1), (13, 3), (15, 1), (16, 1)],
  term ((-6701287248 : Rat) / 21337981) [(1, 1), (3, 1), (5, 1), (8, 1), (12, 1), (15, 1)],
  term ((-6701287248 : Rat) / 21337981) [(1, 1), (3, 1), (5, 1), (9, 1), (13, 1), (15, 1)],
  term ((3350643624 : Rat) / 21337981) [(1, 1), (3, 1), (5, 1), (12, 2), (15, 1)],
  term ((3350643624 : Rat) / 21337981) [(1, 1), (3, 1), (5, 1), (13, 2), (15, 1)],
  term ((3350643624 : Rat) / 21337981) [(1, 1), (3, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((434902464 : Rat) / 21337981) [(1, 1), (3, 1), (8, 1), (12, 1)],
  term ((-682683336 : Rat) / 21337981) [(1, 1), (3, 1), (8, 1), (12, 1), (14, 1)],
  term ((-1675321812 : Rat) / 21337981) [(1, 1), (3, 1), (9, 1), (12, 2), (15, 1)],
  term ((434902464 : Rat) / 21337981) [(1, 1), (3, 1), (9, 1), (13, 1)],
  term ((-682683336 : Rat) / 21337981) [(1, 1), (3, 1), (9, 1), (13, 1), (14, 1)],
  term ((-1675321812 : Rat) / 21337981) [(1, 1), (3, 1), (9, 1), (13, 2), (15, 1)],
  term ((3350643624 : Rat) / 21337981) [(1, 1), (3, 1), (9, 2), (13, 1), (15, 1)],
  term ((-217451232 : Rat) / 21337981) [(1, 1), (3, 1), (12, 2)],
  term ((341341668 : Rat) / 21337981) [(1, 1), (3, 1), (12, 2), (14, 1)],
  term ((-217451232 : Rat) / 21337981) [(1, 1), (3, 1), (13, 2)],
  term ((341341668 : Rat) / 21337981) [(1, 1), (3, 1), (13, 2), (14, 1)],
  term ((11589119712 : Rat) / 21337981) [(1, 1), (3, 2), (5, 1), (8, 1), (12, 1)],
  term ((11589119712 : Rat) / 21337981) [(1, 1), (3, 2), (5, 1), (9, 1), (13, 1)],
  term ((-5794559856 : Rat) / 21337981) [(1, 1), (3, 2), (5, 1), (12, 2)],
  term ((-5794559856 : Rat) / 21337981) [(1, 1), (3, 2), (5, 1), (13, 2)],
  term ((-5794559856 : Rat) / 21337981) [(1, 1), (3, 2), (8, 1), (9, 1), (12, 1)],
  term ((2897279928 : Rat) / 21337981) [(1, 1), (3, 2), (9, 1), (12, 2)],
  term ((2897279928 : Rat) / 21337981) [(1, 1), (3, 2), (9, 1), (13, 2)],
  term ((-5794559856 : Rat) / 21337981) [(1, 1), (3, 2), (9, 2), (13, 1)],
  term ((270394884 : Rat) / 21337981) [(1, 1), (5, 1), (8, 1), (12, 1)],
  term ((-67598721 : Rat) / 21337981) [(1, 1), (5, 1), (8, 1), (12, 1), (16, 1)],
  term ((270394884 : Rat) / 21337981) [(1, 1), (5, 1), (9, 1), (13, 1)],
  term ((-67598721 : Rat) / 21337981) [(1, 1), (5, 1), (9, 1), (13, 1), (16, 1)],
  term ((-135197442 : Rat) / 21337981) [(1, 1), (5, 1), (12, 2)],
  term ((67598721 : Rat) / 42675962) [(1, 1), (5, 1), (12, 2), (16, 1)],
  term ((-135197442 : Rat) / 21337981) [(1, 1), (5, 1), (13, 2)],
  term ((67598721 : Rat) / 42675962) [(1, 1), (5, 1), (13, 2), (16, 1)],
  term ((135197442 : Rat) / 21337981) [(1, 1), (8, 1), (9, 1), (12, 1)],
  term ((135197442 : Rat) / 21337981) [(1, 1), (8, 1), (12, 1), (13, 1)],
  term ((-67598721 : Rat) / 21337981) [(1, 1), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((425329182 : Rat) / 21337981) [(1, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-171027945 : Rat) / 21337981) [(1, 1), (8, 1), (12, 1), (15, 1)],
  term ((67598721 : Rat) / 21337981) [(1, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-67598721 : Rat) / 21337981) [(1, 1), (9, 1), (12, 2)],
  term ((425329182 : Rat) / 21337981) [(1, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((-171027945 : Rat) / 21337981) [(1, 1), (9, 1), (13, 1), (15, 1)],
  term ((67598721 : Rat) / 21337981) [(1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((67598721 : Rat) / 21337981) [(1, 1), (9, 1), (13, 2)],
  term ((-67598721 : Rat) / 21337981) [(1, 1), (9, 1), (13, 2), (16, 1)],
  term ((135197442 : Rat) / 21337981) [(1, 1), (9, 2), (13, 1)],
  term ((-67598721 : Rat) / 21337981) [(1, 1), (12, 2), (13, 1)],
  term ((67598721 : Rat) / 42675962) [(1, 1), (12, 2), (13, 1), (16, 1)],
  term ((-212664591 : Rat) / 21337981) [(1, 1), (12, 2), (14, 1), (15, 1)],
  term ((171027945 : Rat) / 42675962) [(1, 1), (12, 2), (15, 1)],
  term ((-67598721 : Rat) / 42675962) [(1, 1), (12, 2), (15, 1), (16, 1)],
  term ((-212664591 : Rat) / 21337981) [(1, 1), (13, 2), (14, 1), (15, 1)],
  term ((171027945 : Rat) / 42675962) [(1, 1), (13, 2), (15, 1)],
  term ((-67598721 : Rat) / 42675962) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((-67598721 : Rat) / 21337981) [(1, 1), (13, 3)],
  term ((67598721 : Rat) / 42675962) [(1, 1), (13, 3), (16, 1)],
  term ((-3964138704 : Rat) / 21337981) [(2, 1), (3, 1), (5, 1), (8, 1), (12, 1)],
  term ((14400732096 : Rat) / 21337981) [(2, 1), (3, 1), (5, 1), (8, 1), (12, 1), (15, 2)],
  term ((-3964138704 : Rat) / 21337981) [(2, 1), (3, 1), (5, 1), (9, 1), (13, 1)],
  term ((14400732096 : Rat) / 21337981) [(2, 1), (3, 1), (5, 1), (9, 1), (13, 1), (15, 2)],
  term ((1982069352 : Rat) / 21337981) [(2, 1), (3, 1), (5, 1), (12, 2)],
  term ((-7200366048 : Rat) / 21337981) [(2, 1), (3, 1), (5, 1), (12, 2), (15, 2)],
  term ((1982069352 : Rat) / 21337981) [(2, 1), (3, 1), (5, 1), (13, 2)],
  term ((-7200366048 : Rat) / 21337981) [(2, 1), (3, 1), (5, 1), (13, 2), (15, 2)],
  term ((3782160864 : Rat) / 21337981) [(2, 1), (3, 1), (8, 1), (9, 1), (12, 1)],
  term ((-7200366048 : Rat) / 21337981) [(2, 1), (3, 1), (8, 1), (9, 1), (12, 1), (15, 2)],
  term ((-1891080432 : Rat) / 21337981) [(2, 1), (3, 1), (9, 1), (12, 2)],
  term ((3600183024 : Rat) / 21337981) [(2, 1), (3, 1), (9, 1), (12, 2), (15, 2)],
  term ((-1891080432 : Rat) / 21337981) [(2, 1), (3, 1), (9, 1), (13, 2)],
  term ((3600183024 : Rat) / 21337981) [(2, 1), (3, 1), (9, 1), (13, 2), (15, 2)],
  term ((3782160864 : Rat) / 21337981) [(2, 1), (3, 1), (9, 2), (13, 1)],
  term ((-7200366048 : Rat) / 21337981) [(2, 1), (3, 1), (9, 2), (13, 1), (15, 2)],
  term ((3133742616 : Rat) / 21337981) [(2, 1), (5, 1), (8, 1), (12, 1), (15, 1)],
  term ((-163783098 : Rat) / 21337981) [(2, 1), (5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-9914440896 : Rat) / 21337981) [(2, 1), (5, 1), (8, 1), (12, 1), (15, 3)],
  term ((3133742616 : Rat) / 21337981) [(2, 1), (5, 1), (9, 1), (13, 1), (15, 1)],
  term ((-163783098 : Rat) / 21337981) [(2, 1), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-9914440896 : Rat) / 21337981) [(2, 1), (5, 1), (9, 1), (13, 1), (15, 3)],
  term ((-1566871308 : Rat) / 21337981) [(2, 1), (5, 1), (12, 2), (15, 1)],
  term ((81891549 : Rat) / 21337981) [(2, 1), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((4957220448 : Rat) / 21337981) [(2, 1), (5, 1), (12, 2), (15, 3)],
  term ((-1566871308 : Rat) / 21337981) [(2, 1), (5, 1), (13, 2), (15, 1)],
  term ((81891549 : Rat) / 21337981) [(2, 1), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((4957220448 : Rat) / 21337981) [(2, 1), (5, 1), (13, 2), (15, 3)],
  term ((-307292004 : Rat) / 3048283) [(2, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((4957220448 : Rat) / 21337981) [(2, 1), (8, 1), (9, 1), (12, 1), (15, 3)],
  term ((327566196 : Rat) / 21337981) [(2, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-163783098 : Rat) / 21337981) [(2, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-655132392 : Rat) / 21337981) [(2, 1), (8, 1), (12, 1), (15, 2)],
  term ((163783098 : Rat) / 21337981) [(2, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((153646002 : Rat) / 3048283) [(2, 1), (9, 1), (12, 2), (15, 1)],
  term ((-2478610224 : Rat) / 21337981) [(2, 1), (9, 1), (12, 2), (15, 3)],
  term ((-655132392 : Rat) / 21337981) [(2, 1), (9, 1), (13, 1), (15, 2)],
  term ((163783098 : Rat) / 21337981) [(2, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((1403088210 : Rat) / 21337981) [(2, 1), (9, 1), (13, 2), (15, 1)],
  term ((-163783098 : Rat) / 21337981) [(2, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-2478610224 : Rat) / 21337981) [(2, 1), (9, 1), (13, 2), (15, 3)],
  term ((-307292004 : Rat) / 3048283) [(2, 1), (9, 2), (13, 1), (15, 1)],
  term ((4957220448 : Rat) / 21337981) [(2, 1), (9, 2), (13, 1), (15, 3)],
  term ((-163783098 : Rat) / 21337981) [(2, 1), (12, 2), (13, 1), (15, 1)],
  term ((81891549 : Rat) / 21337981) [(2, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((327566196 : Rat) / 21337981) [(2, 1), (12, 2), (15, 2)],
  term ((-81891549 : Rat) / 21337981) [(2, 1), (12, 2), (15, 2), (16, 1)],
  term ((327566196 : Rat) / 21337981) [(2, 1), (13, 2), (15, 2)],
  term ((-81891549 : Rat) / 21337981) [(2, 1), (13, 2), (15, 2), (16, 1)],
  term ((-163783098 : Rat) / 21337981) [(2, 1), (13, 3), (15, 1)],
  term ((81891549 : Rat) / 21337981) [(2, 1), (13, 3), (15, 1), (16, 1)],
  term ((3326092128 : Rat) / 21337981) [(3, 1), (5, 1), (8, 1), (12, 1)],
  term ((242478144 : Rat) / 21337981) [(3, 1), (5, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-913908816 : Rat) / 21337981) [(3, 1), (5, 1), (8, 1), (12, 1), (14, 1)],
  term ((163783098 : Rat) / 21337981) [(3, 1), (5, 1), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((-10901147904 : Rat) / 21337981) [(3, 1), (5, 1), (8, 1), (12, 1), (15, 2)],
  term ((-210563496 : Rat) / 21337981) [(3, 1), (5, 1), (8, 1), (12, 1), (16, 1)],
  term ((3326092128 : Rat) / 21337981) [(3, 1), (5, 1), (9, 1), (13, 1)],
  term ((-913908816 : Rat) / 21337981) [(3, 1), (5, 1), (9, 1), (13, 1), (14, 1)],
  term ((163783098 : Rat) / 21337981) [(3, 1), (5, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-10901147904 : Rat) / 21337981) [(3, 1), (5, 1), (9, 1), (13, 1), (15, 2)],
  term ((-210563496 : Rat) / 21337981) [(3, 1), (5, 1), (9, 1), (13, 1), (16, 1)],
  term ((242478144 : Rat) / 21337981) [(3, 1), (5, 1), (9, 1), (13, 2), (15, 1)],
  term ((-1663046064 : Rat) / 21337981) [(3, 1), (5, 1), (12, 2)],
  term ((-121239072 : Rat) / 21337981) [(3, 1), (5, 1), (12, 2), (13, 1), (15, 1)],
  term ((456954408 : Rat) / 21337981) [(3, 1), (5, 1), (12, 2), (14, 1)],
  term ((-81891549 : Rat) / 21337981) [(3, 1), (5, 1), (12, 2), (14, 1), (16, 1)],
  term ((5450573952 : Rat) / 21337981) [(3, 1), (5, 1), (12, 2), (15, 2)],
  term ((105281748 : Rat) / 21337981) [(3, 1), (5, 1), (12, 2), (16, 1)],
  term ((-1663046064 : Rat) / 21337981) [(3, 1), (5, 1), (13, 2)],
  term ((456954408 : Rat) / 21337981) [(3, 1), (5, 1), (13, 2), (14, 1)],
  term ((-81891549 : Rat) / 21337981) [(3, 1), (5, 1), (13, 2), (14, 1), (16, 1)],
  term ((5450573952 : Rat) / 21337981) [(3, 1), (5, 1), (13, 2), (15, 2)],
  term ((105281748 : Rat) / 21337981) [(3, 1), (5, 1), (13, 2), (16, 1)],
  term ((-121239072 : Rat) / 21337981) [(3, 1), (5, 1), (13, 3), (15, 1)],
  term ((-1663637328 : Rat) / 21337981) [(3, 1), (8, 1), (9, 1), (12, 1)],
  term ((-121239072 : Rat) / 21337981) [(3, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-1071677700 : Rat) / 21337981) [(3, 1), (8, 1), (9, 1), (12, 1), (14, 1)],
  term ((5450573952 : Rat) / 21337981) [(3, 1), (8, 1), (9, 1), (12, 1), (15, 2)],
  term ((150258852 : Rat) / 21337981) [(3, 1), (8, 1), (12, 1), (13, 1)],
  term ((27048492 : Rat) / 21337981) [(3, 1), (8, 1), (12, 1), (13, 1), (14, 1)],
  term ((163783098 : Rat) / 21337981) [(3, 1), (8, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-210563496 : Rat) / 21337981) [(3, 1), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((628586352 : Rat) / 21337981) [(3, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-163783098 : Rat) / 21337981) [(3, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-105060024 : Rat) / 3048283) [(3, 1), (8, 1), (12, 1), (15, 1)],
  term ((210563496 : Rat) / 21337981) [(3, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((831818664 : Rat) / 21337981) [(3, 1), (9, 1), (12, 2)],
  term ((60619536 : Rat) / 21337981) [(3, 1), (9, 1), (12, 2), (13, 1), (15, 1)],
  term ((535838850 : Rat) / 21337981) [(3, 1), (9, 1), (12, 2), (14, 1)],
  term ((-2725286976 : Rat) / 21337981) [(3, 1), (9, 1), (12, 2), (15, 2)],
  term ((628586352 : Rat) / 21337981) [(3, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((-163783098 : Rat) / 21337981) [(3, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-105060024 : Rat) / 3048283) [(3, 1), (9, 1), (13, 1), (15, 1)],
  term ((210563496 : Rat) / 21337981) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((140296788 : Rat) / 3048283) [(3, 1), (9, 1), (13, 2)],
  term ((562887342 : Rat) / 21337981) [(3, 1), (9, 1), (13, 2), (14, 1)],
  term ((163783098 : Rat) / 21337981) [(3, 1), (9, 1), (13, 2), (14, 1), (16, 1)],
  term ((-2725286976 : Rat) / 21337981) [(3, 1), (9, 1), (13, 2), (15, 2)],
  term ((-210563496 : Rat) / 21337981) [(3, 1), (9, 1), (13, 2), (16, 1)],
  term ((60619536 : Rat) / 21337981) [(3, 1), (9, 1), (13, 3), (15, 1)],
  term ((-1663637328 : Rat) / 21337981) [(3, 1), (9, 2), (13, 1)],
  term ((-1071677700 : Rat) / 21337981) [(3, 1), (9, 2), (13, 1), (14, 1)],
  term ((5450573952 : Rat) / 21337981) [(3, 1), (9, 2), (13, 1), (15, 2)],
  term ((-121239072 : Rat) / 21337981) [(3, 1), (9, 2), (13, 2), (15, 1)],
  term ((-75129426 : Rat) / 21337981) [(3, 1), (12, 2), (13, 1)],
  term ((-13524246 : Rat) / 21337981) [(3, 1), (12, 2), (13, 1), (14, 1)],
  term ((-81891549 : Rat) / 21337981) [(3, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((105281748 : Rat) / 21337981) [(3, 1), (12, 2), (13, 1), (16, 1)],
  term ((-314293176 : Rat) / 21337981) [(3, 1), (12, 2), (14, 1), (15, 1)],
  term ((81891549 : Rat) / 21337981) [(3, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((52530012 : Rat) / 3048283) [(3, 1), (12, 2), (15, 1)],
  term ((-105281748 : Rat) / 21337981) [(3, 1), (12, 2), (15, 1), (16, 1)],
  term ((-314293176 : Rat) / 21337981) [(3, 1), (13, 2), (14, 1), (15, 1)],
  term ((81891549 : Rat) / 21337981) [(3, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((52530012 : Rat) / 3048283) [(3, 1), (13, 2), (15, 1)],
  term ((-105281748 : Rat) / 21337981) [(3, 1), (13, 2), (15, 1), (16, 1)],
  term ((-75129426 : Rat) / 21337981) [(3, 1), (13, 3)],
  term ((-13524246 : Rat) / 21337981) [(3, 1), (13, 3), (14, 1)],
  term ((-81891549 : Rat) / 21337981) [(3, 1), (13, 3), (14, 1), (16, 1)],
  term ((105281748 : Rat) / 21337981) [(3, 1), (13, 3), (16, 1)],
  term ((-121318560 : Rat) / 21337981) [(3, 2), (5, 1), (8, 1), (12, 1), (13, 1)],
  term ((-5865861888 : Rat) / 21337981) [(3, 2), (5, 1), (8, 1), (12, 1), (15, 1)],
  term ((-5865861888 : Rat) / 21337981) [(3, 2), (5, 1), (9, 1), (13, 1), (15, 1)],
  term ((-121318560 : Rat) / 21337981) [(3, 2), (5, 1), (9, 1), (13, 2)],
  term ((60659280 : Rat) / 21337981) [(3, 2), (5, 1), (12, 2), (13, 1)],
  term ((2932930944 : Rat) / 21337981) [(3, 2), (5, 1), (12, 2), (15, 1)],
  term ((2932930944 : Rat) / 21337981) [(3, 2), (5, 1), (13, 2), (15, 1)],
  term ((60659280 : Rat) / 21337981) [(3, 2), (5, 1), (13, 3)],
  term ((60659280 : Rat) / 21337981) [(3, 2), (8, 1), (9, 1), (12, 1), (13, 1)],
  term ((2932930944 : Rat) / 21337981) [(3, 2), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-30329640 : Rat) / 21337981) [(3, 2), (9, 1), (12, 2), (13, 1)],
  term ((-1466465472 : Rat) / 21337981) [(3, 2), (9, 1), (12, 2), (15, 1)],
  term ((-1466465472 : Rat) / 21337981) [(3, 2), (9, 1), (13, 2), (15, 1)],
  term ((-30329640 : Rat) / 21337981) [(3, 2), (9, 1), (13, 3)],
  term ((2932930944 : Rat) / 21337981) [(3, 2), (9, 2), (13, 1), (15, 1)],
  term ((60659280 : Rat) / 21337981) [(3, 2), (9, 2), (13, 2)],
  term ((71012812 : Rat) / 21337981) [(5, 1), (8, 1), (12, 1), (13, 1)],
  term ((-17753203 : Rat) / 21337981) [(5, 1), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1239305112 : Rat) / 21337981) [(5, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1811164212 : Rat) / 21337981) [(5, 1), (8, 1), (12, 1), (15, 1)],
  term ((142964775 : Rat) / 21337981) [(5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((9914440896 : Rat) / 21337981) [(5, 1), (8, 1), (12, 1), (15, 3)],
  term ((-1239305112 : Rat) / 21337981) [(5, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1811164212 : Rat) / 21337981) [(5, 1), (9, 1), (13, 1), (15, 1)],
  term ((142964775 : Rat) / 21337981) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((9914440896 : Rat) / 21337981) [(5, 1), (9, 1), (13, 1), (15, 3)],
  term ((71012812 : Rat) / 21337981) [(5, 1), (9, 1), (13, 2)],
  term ((-17753203 : Rat) / 21337981) [(5, 1), (9, 1), (13, 2), (16, 1)],
  term ((-35506406 : Rat) / 21337981) [(5, 1), (12, 2), (13, 1)],
  term ((17753203 : Rat) / 42675962) [(5, 1), (12, 2), (13, 1), (16, 1)],
  term ((619652556 : Rat) / 21337981) [(5, 1), (12, 2), (14, 1), (15, 1)],
  term ((905582106 : Rat) / 21337981) [(5, 1), (12, 2), (15, 1)],
  term ((-142964775 : Rat) / 42675962) [(5, 1), (12, 2), (15, 1), (16, 1)],
  term ((-4957220448 : Rat) / 21337981) [(5, 1), (12, 2), (15, 3)],
  term ((619652556 : Rat) / 21337981) [(5, 1), (13, 2), (14, 1), (15, 1)],
  term ((905582106 : Rat) / 21337981) [(5, 1), (13, 2), (15, 1)],
  term ((-142964775 : Rat) / 42675962) [(5, 1), (13, 2), (15, 1), (16, 1)],
  term ((-4957220448 : Rat) / 21337981) [(5, 1), (13, 2), (15, 3)],
  term ((-35506406 : Rat) / 21337981) [(5, 1), (13, 3)],
  term ((17753203 : Rat) / 42675962) [(5, 1), (13, 3), (16, 1)],
  term ((-23498213 : Rat) / 21337981) [(8, 1), (9, 1), (12, 1), (13, 1)],
  term ((1488076614 : Rat) / 21337981) [(8, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((618827994 : Rat) / 21337981) [(8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-4957220448 : Rat) / 21337981) [(8, 1), (9, 1), (12, 1), (15, 3)],
  term ((47514599 : Rat) / 85351924) [(8, 1), (12, 1)],
  term ((-88278840 : Rat) / 21337981) [(8, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-271418583 : Rat) / 21337981) [(8, 1), (12, 1), (13, 1), (15, 1)],
  term ((160717978 : Rat) / 21337981) [(8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-17753203 : Rat) / 21337981) [(8, 1), (12, 1), (13, 2), (16, 1)],
  term ((-12008193 : Rat) / 42675962) [(8, 1), (12, 1), (14, 1)],
  term ((-35538786 : Rat) / 3048283) [(8, 1), (12, 1), (14, 1), (15, 2)],
  term ((443470227 : Rat) / 21337981) [(8, 1), (12, 1), (15, 2)],
  term ((-142964775 : Rat) / 21337981) [(8, 1), (12, 1), (15, 2), (16, 1)],
  term ((23498213 : Rat) / 42675962) [(9, 1), (12, 2), (13, 1)],
  term ((-744038307 : Rat) / 21337981) [(9, 1), (12, 2), (14, 1), (15, 1)],
  term ((-309413997 : Rat) / 21337981) [(9, 1), (12, 2), (15, 1)],
  term ((2478610224 : Rat) / 21337981) [(9, 1), (12, 2), (15, 3)],
  term ((47514599 : Rat) / 85351924) [(9, 1), (13, 1)],
  term ((-12008193 : Rat) / 42675962) [(9, 1), (13, 1), (14, 1)],
  term ((-35538786 : Rat) / 3048283) [(9, 1), (13, 1), (14, 1), (15, 2)],
  term ((443470227 : Rat) / 21337981) [(9, 1), (13, 1), (15, 2)],
  term ((-142964775 : Rat) / 21337981) [(9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-832317147 : Rat) / 21337981) [(9, 1), (13, 2), (14, 1), (15, 1)],
  term ((-580832580 : Rat) / 21337981) [(9, 1), (13, 2), (15, 1)],
  term ((160717978 : Rat) / 21337981) [(9, 1), (13, 2), (15, 1), (16, 1)],
  term ((2478610224 : Rat) / 21337981) [(9, 1), (13, 2), (15, 3)],
  term ((23498213 : Rat) / 42675962) [(9, 1), (13, 3)],
  term ((-17753203 : Rat) / 21337981) [(9, 1), (13, 3), (16, 1)],
  term ((1488076614 : Rat) / 21337981) [(9, 2), (13, 1), (14, 1), (15, 1)],
  term ((618827994 : Rat) / 21337981) [(9, 2), (13, 1), (15, 1)],
  term ((-4957220448 : Rat) / 21337981) [(9, 2), (13, 1), (15, 3)],
  term ((-23498213 : Rat) / 21337981) [(9, 2), (13, 2)],
  term ((-47514599 : Rat) / 170703848) [(12, 2)],
  term ((44139420 : Rat) / 21337981) [(12, 2), (13, 1), (14, 1), (15, 1)],
  term ((271418583 : Rat) / 42675962) [(12, 2), (13, 1), (15, 1)],
  term ((-80358989 : Rat) / 21337981) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((17753203 : Rat) / 42675962) [(12, 2), (13, 2), (16, 1)],
  term ((12008193 : Rat) / 85351924) [(12, 2), (14, 1)],
  term ((17769393 : Rat) / 3048283) [(12, 2), (14, 1), (15, 2)],
  term ((-443470227 : Rat) / 42675962) [(12, 2), (15, 2)],
  term ((142964775 : Rat) / 42675962) [(12, 2), (15, 2), (16, 1)],
  term ((-47514599 : Rat) / 170703848) [(13, 2)],
  term ((12008193 : Rat) / 85351924) [(13, 2), (14, 1)],
  term ((17769393 : Rat) / 3048283) [(13, 2), (14, 1), (15, 2)],
  term ((-443470227 : Rat) / 42675962) [(13, 2), (15, 2)],
  term ((142964775 : Rat) / 42675962) [(13, 2), (15, 2), (16, 1)],
  term ((44139420 : Rat) / 21337981) [(13, 3), (14, 1), (15, 1)],
  term ((271418583 : Rat) / 42675962) [(13, 3), (15, 1)],
  term ((-80358989 : Rat) / 21337981) [(13, 3), (15, 1), (16, 1)],
  term ((17753203 : Rat) / 42675962) [(13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 21, terms 0 through 77. -/
theorem rs_R009_ueqv_R009YYYNN_block_21_0000_0077_valid :
    checkProductSumEq rs_R009_ueqv_R009YYYNN_partials_21_0000_0077
      rs_R009_ueqv_R009YYYNN_block_21_0000_0077 = true := by
  native_decide

end R009UeqvR009YYYNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
