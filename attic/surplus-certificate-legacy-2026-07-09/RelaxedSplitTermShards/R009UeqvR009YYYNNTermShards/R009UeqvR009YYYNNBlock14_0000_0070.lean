/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009YYYNN, term block 14:0-70

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009YYYNNTermShards

/-- Generator polynomial 14 for relaxed split surplus certificate `R009:u=v:R009YYYNN`. -/
def rs_R009_ueqv_R009YYYNN_generator_14_0000_0070 : Poly :=
[
  term (2 : Rat) [(4, 1), (6, 1)],
  term (2 : Rat) [(5, 1), (7, 1)],
  term (-1 : Rat) [(6, 2)],
  term (-1 : Rat) [(7, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009YYYNN_coefficient_14_0000 : Poly :=
[
  term ((-85468329 : Rat) / 42675962) []
]

/-- Partial product 0 for generator 14. -/
def rs_R009_ueqv_R009YYYNN_partial_14_0000 : Poly :=
[
  term ((-85468329 : Rat) / 21337981) [(4, 1), (6, 1)],
  term ((-85468329 : Rat) / 21337981) [(5, 1), (7, 1)],
  term ((85468329 : Rat) / 42675962) [(6, 2)],
  term ((85468329 : Rat) / 42675962) [(7, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 14. -/
theorem rs_R009_ueqv_R009YYYNN_partial_14_0000_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_14_0000
        rs_R009_ueqv_R009YYYNN_generator_14_0000_0070 =
      rs_R009_ueqv_R009YYYNN_partial_14_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009YYYNN_coefficient_14_0001 : Poly :=
[
  term ((954702 : Rat) / 435469) [(0, 1), (3, 1), (9, 1)]
]

/-- Partial product 1 for generator 14. -/
def rs_R009_ueqv_R009YYYNN_partial_14_0001 : Poly :=
[
  term ((1909404 : Rat) / 435469) [(0, 1), (3, 1), (4, 1), (6, 1), (9, 1)],
  term ((1909404 : Rat) / 435469) [(0, 1), (3, 1), (5, 1), (7, 1), (9, 1)],
  term ((-954702 : Rat) / 435469) [(0, 1), (3, 1), (6, 2), (9, 1)],
  term ((-954702 : Rat) / 435469) [(0, 1), (3, 1), (7, 2), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 14. -/
theorem rs_R009_ueqv_R009YYYNN_partial_14_0001_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_14_0001
        rs_R009_ueqv_R009YYYNN_generator_14_0000_0070 =
      rs_R009_ueqv_R009YYYNN_partial_14_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009YYYNN_coefficient_14_0002 : Poly :=
[
  term ((-477351 : Rat) / 435469) [(0, 1), (3, 1), (9, 1), (16, 1)]
]

/-- Partial product 2 for generator 14. -/
def rs_R009_ueqv_R009YYYNN_partial_14_0002 : Poly :=
[
  term ((-954702 : Rat) / 435469) [(0, 1), (3, 1), (4, 1), (6, 1), (9, 1), (16, 1)],
  term ((-954702 : Rat) / 435469) [(0, 1), (3, 1), (5, 1), (7, 1), (9, 1), (16, 1)],
  term ((477351 : Rat) / 435469) [(0, 1), (3, 1), (6, 2), (9, 1), (16, 1)],
  term ((477351 : Rat) / 435469) [(0, 1), (3, 1), (7, 2), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 14. -/
theorem rs_R009_ueqv_R009YYYNN_partial_14_0002_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_14_0002
        rs_R009_ueqv_R009YYYNN_generator_14_0000_0070 =
      rs_R009_ueqv_R009YYYNN_partial_14_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009YYYNN_coefficient_14_0003 : Poly :=
[
  term ((-1909404 : Rat) / 435469) [(0, 1), (3, 1), (13, 1)]
]

/-- Partial product 3 for generator 14. -/
def rs_R009_ueqv_R009YYYNN_partial_14_0003 : Poly :=
[
  term ((-3818808 : Rat) / 435469) [(0, 1), (3, 1), (4, 1), (6, 1), (13, 1)],
  term ((-3818808 : Rat) / 435469) [(0, 1), (3, 1), (5, 1), (7, 1), (13, 1)],
  term ((1909404 : Rat) / 435469) [(0, 1), (3, 1), (6, 2), (13, 1)],
  term ((1909404 : Rat) / 435469) [(0, 1), (3, 1), (7, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 14. -/
theorem rs_R009_ueqv_R009YYYNN_partial_14_0003_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_14_0003
        rs_R009_ueqv_R009YYYNN_generator_14_0000_0070 =
      rs_R009_ueqv_R009YYYNN_partial_14_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009YYYNN_coefficient_14_0004 : Poly :=
[
  term ((477351 : Rat) / 435469) [(0, 1), (3, 1), (13, 1), (16, 1)]
]

/-- Partial product 4 for generator 14. -/
def rs_R009_ueqv_R009YYYNN_partial_14_0004 : Poly :=
[
  term ((954702 : Rat) / 435469) [(0, 1), (3, 1), (4, 1), (6, 1), (13, 1), (16, 1)],
  term ((954702 : Rat) / 435469) [(0, 1), (3, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((-477351 : Rat) / 435469) [(0, 1), (3, 1), (6, 2), (13, 1), (16, 1)],
  term ((-477351 : Rat) / 435469) [(0, 1), (3, 1), (7, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 14. -/
theorem rs_R009_ueqv_R009YYYNN_partial_14_0004_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_14_0004
        rs_R009_ueqv_R009YYYNN_generator_14_0000_0070 =
      rs_R009_ueqv_R009YYYNN_partial_14_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009YYYNN_coefficient_14_0005 : Poly :=
[
  term ((20818323 : Rat) / 21337981) [(0, 1), (9, 1), (15, 1)]
]

/-- Partial product 5 for generator 14. -/
def rs_R009_ueqv_R009YYYNN_partial_14_0005 : Poly :=
[
  term ((41636646 : Rat) / 21337981) [(0, 1), (4, 1), (6, 1), (9, 1), (15, 1)],
  term ((41636646 : Rat) / 21337981) [(0, 1), (5, 1), (7, 1), (9, 1), (15, 1)],
  term ((-20818323 : Rat) / 21337981) [(0, 1), (6, 2), (9, 1), (15, 1)],
  term ((-20818323 : Rat) / 21337981) [(0, 1), (7, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 14. -/
theorem rs_R009_ueqv_R009YYYNN_partial_14_0005_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_14_0005
        rs_R009_ueqv_R009YYYNN_generator_14_0000_0070 =
      rs_R009_ueqv_R009YYYNN_partial_14_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009YYYNN_coefficient_14_0006 : Poly :=
[
  term ((-20818323 : Rat) / 42675962) [(0, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 6 for generator 14. -/
def rs_R009_ueqv_R009YYYNN_partial_14_0006 : Poly :=
[
  term ((-20818323 : Rat) / 21337981) [(0, 1), (4, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-20818323 : Rat) / 21337981) [(0, 1), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((20818323 : Rat) / 42675962) [(0, 1), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((20818323 : Rat) / 42675962) [(0, 1), (7, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 14. -/
theorem rs_R009_ueqv_R009YYYNN_partial_14_0006_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_14_0006
        rs_R009_ueqv_R009YYYNN_generator_14_0000_0070 =
      rs_R009_ueqv_R009YYYNN_partial_14_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009YYYNN_coefficient_14_0007 : Poly :=
[
  term ((-41636646 : Rat) / 21337981) [(0, 1), (13, 1), (15, 1)]
]

/-- Partial product 7 for generator 14. -/
def rs_R009_ueqv_R009YYYNN_partial_14_0007 : Poly :=
[
  term ((-83273292 : Rat) / 21337981) [(0, 1), (4, 1), (6, 1), (13, 1), (15, 1)],
  term ((-83273292 : Rat) / 21337981) [(0, 1), (5, 1), (7, 1), (13, 1), (15, 1)],
  term ((41636646 : Rat) / 21337981) [(0, 1), (6, 2), (13, 1), (15, 1)],
  term ((41636646 : Rat) / 21337981) [(0, 1), (7, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 14. -/
theorem rs_R009_ueqv_R009YYYNN_partial_14_0007_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_14_0007
        rs_R009_ueqv_R009YYYNN_generator_14_0000_0070 =
      rs_R009_ueqv_R009YYYNN_partial_14_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009YYYNN_coefficient_14_0008 : Poly :=
[
  term ((20818323 : Rat) / 42675962) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 8 for generator 14. -/
def rs_R009_ueqv_R009YYYNN_partial_14_0008 : Poly :=
[
  term ((20818323 : Rat) / 21337981) [(0, 1), (4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((20818323 : Rat) / 21337981) [(0, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-20818323 : Rat) / 42675962) [(0, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-20818323 : Rat) / 42675962) [(0, 1), (7, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 14. -/
theorem rs_R009_ueqv_R009YYYNN_partial_14_0008_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_14_0008
        rs_R009_ueqv_R009YYYNN_generator_14_0000_0070 =
      rs_R009_ueqv_R009YYYNN_partial_14_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009YYYNN_coefficient_14_0009 : Poly :=
[
  term ((724319982 : Rat) / 21337981) [(1, 1), (2, 1), (3, 1)]
]

/-- Partial product 9 for generator 14. -/
def rs_R009_ueqv_R009YYYNN_partial_14_0009 : Poly :=
[
  term ((1448639964 : Rat) / 21337981) [(1, 1), (2, 1), (3, 1), (4, 1), (6, 1)],
  term ((1448639964 : Rat) / 21337981) [(1, 1), (2, 1), (3, 1), (5, 1), (7, 1)],
  term ((-724319982 : Rat) / 21337981) [(1, 1), (2, 1), (3, 1), (6, 2)],
  term ((-724319982 : Rat) / 21337981) [(1, 1), (2, 1), (3, 1), (7, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 14. -/
theorem rs_R009_ueqv_R009YYYNN_partial_14_0009_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_14_0009
        rs_R009_ueqv_R009YYYNN_generator_14_0000_0070 =
      rs_R009_ueqv_R009YYYNN_partial_14_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009YYYNN_coefficient_14_0010 : Poly :=
[
  term ((-418830453 : Rat) / 21337981) [(1, 1), (2, 1), (15, 1)]
]

/-- Partial product 10 for generator 14. -/
def rs_R009_ueqv_R009YYYNN_partial_14_0010 : Poly :=
[
  term ((-837660906 : Rat) / 21337981) [(1, 1), (2, 1), (4, 1), (6, 1), (15, 1)],
  term ((-837660906 : Rat) / 21337981) [(1, 1), (2, 1), (5, 1), (7, 1), (15, 1)],
  term ((418830453 : Rat) / 21337981) [(1, 1), (2, 1), (6, 2), (15, 1)],
  term ((418830453 : Rat) / 21337981) [(1, 1), (2, 1), (7, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 14. -/
theorem rs_R009_ueqv_R009YYYNN_partial_14_0010_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_14_0010
        rs_R009_ueqv_R009YYYNN_generator_14_0000_0070 =
      rs_R009_ueqv_R009YYYNN_partial_14_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009YYYNN_coefficient_14_0011 : Poly :=
[
  term ((-724319982 : Rat) / 21337981) [(1, 1), (3, 1)]
]

/-- Partial product 11 for generator 14. -/
def rs_R009_ueqv_R009YYYNN_partial_14_0011 : Poly :=
[
  term ((-1448639964 : Rat) / 21337981) [(1, 1), (3, 1), (4, 1), (6, 1)],
  term ((-1448639964 : Rat) / 21337981) [(1, 1), (3, 1), (5, 1), (7, 1)],
  term ((724319982 : Rat) / 21337981) [(1, 1), (3, 1), (6, 2)],
  term ((724319982 : Rat) / 21337981) [(1, 1), (3, 1), (7, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 14. -/
theorem rs_R009_ueqv_R009YYYNN_partial_14_0011_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_14_0011
        rs_R009_ueqv_R009YYYNN_generator_14_0000_0070 =
      rs_R009_ueqv_R009YYYNN_partial_14_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009YYYNN_coefficient_14_0012 : Poly :=
[
  term ((837660906 : Rat) / 21337981) [(1, 1), (3, 1), (9, 1), (15, 1)]
]

/-- Partial product 12 for generator 14. -/
def rs_R009_ueqv_R009YYYNN_partial_14_0012 : Poly :=
[
  term ((1675321812 : Rat) / 21337981) [(1, 1), (3, 1), (4, 1), (6, 1), (9, 1), (15, 1)],
  term ((1675321812 : Rat) / 21337981) [(1, 1), (3, 1), (5, 1), (7, 1), (9, 1), (15, 1)],
  term ((-837660906 : Rat) / 21337981) [(1, 1), (3, 1), (6, 2), (9, 1), (15, 1)],
  term ((-837660906 : Rat) / 21337981) [(1, 1), (3, 1), (7, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 14. -/
theorem rs_R009_ueqv_R009YYYNN_partial_14_0012_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_14_0012
        rs_R009_ueqv_R009YYYNN_generator_14_0000_0070 =
      rs_R009_ueqv_R009YYYNN_partial_14_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009YYYNN_coefficient_14_0013 : Poly :=
[
  term ((-1675321812 : Rat) / 21337981) [(1, 1), (3, 1), (13, 1), (15, 1)]
]

/-- Partial product 13 for generator 14. -/
def rs_R009_ueqv_R009YYYNN_partial_14_0013 : Poly :=
[
  term ((-3350643624 : Rat) / 21337981) [(1, 1), (3, 1), (4, 1), (6, 1), (13, 1), (15, 1)],
  term ((-3350643624 : Rat) / 21337981) [(1, 1), (3, 1), (5, 1), (7, 1), (13, 1), (15, 1)],
  term ((1675321812 : Rat) / 21337981) [(1, 1), (3, 1), (6, 2), (13, 1), (15, 1)],
  term ((1675321812 : Rat) / 21337981) [(1, 1), (3, 1), (7, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 14. -/
theorem rs_R009_ueqv_R009YYYNN_partial_14_0013_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_14_0013
        rs_R009_ueqv_R009YYYNN_generator_14_0000_0070 =
      rs_R009_ueqv_R009YYYNN_partial_14_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009YYYNN_coefficient_14_0014 : Poly :=
[
  term ((-1448639964 : Rat) / 21337981) [(1, 1), (3, 2), (9, 1)]
]

/-- Partial product 14 for generator 14. -/
def rs_R009_ueqv_R009YYYNN_partial_14_0014 : Poly :=
[
  term ((-2897279928 : Rat) / 21337981) [(1, 1), (3, 2), (4, 1), (6, 1), (9, 1)],
  term ((-2897279928 : Rat) / 21337981) [(1, 1), (3, 2), (5, 1), (7, 1), (9, 1)],
  term ((1448639964 : Rat) / 21337981) [(1, 1), (3, 2), (6, 2), (9, 1)],
  term ((1448639964 : Rat) / 21337981) [(1, 1), (3, 2), (7, 2), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 14. -/
theorem rs_R009_ueqv_R009YYYNN_partial_14_0014_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_14_0014
        rs_R009_ueqv_R009YYYNN_generator_14_0000_0070 =
      rs_R009_ueqv_R009YYYNN_partial_14_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009YYYNN_coefficient_14_0015 : Poly :=
[
  term ((2897279928 : Rat) / 21337981) [(1, 1), (3, 2), (13, 1)]
]

/-- Partial product 15 for generator 14. -/
def rs_R009_ueqv_R009YYYNN_partial_14_0015 : Poly :=
[
  term ((5794559856 : Rat) / 21337981) [(1, 1), (3, 2), (4, 1), (6, 1), (13, 1)],
  term ((5794559856 : Rat) / 21337981) [(1, 1), (3, 2), (5, 1), (7, 1), (13, 1)],
  term ((-2897279928 : Rat) / 21337981) [(1, 1), (3, 2), (6, 2), (13, 1)],
  term ((-2897279928 : Rat) / 21337981) [(1, 1), (3, 2), (7, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 14. -/
theorem rs_R009_ueqv_R009YYYNN_partial_14_0015_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_14_0015
        rs_R009_ueqv_R009YYYNN_generator_14_0000_0070 =
      rs_R009_ueqv_R009YYYNN_partial_14_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009YYYNN_coefficient_14_0016 : Poly :=
[
  term ((-67598721 : Rat) / 42675962) [(1, 1), (9, 1)]
]

/-- Partial product 16 for generator 14. -/
def rs_R009_ueqv_R009YYYNN_partial_14_0016 : Poly :=
[
  term ((-67598721 : Rat) / 21337981) [(1, 1), (4, 1), (6, 1), (9, 1)],
  term ((-67598721 : Rat) / 21337981) [(1, 1), (5, 1), (7, 1), (9, 1)],
  term ((67598721 : Rat) / 42675962) [(1, 1), (6, 2), (9, 1)],
  term ((67598721 : Rat) / 42675962) [(1, 1), (7, 2), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 14. -/
theorem rs_R009_ueqv_R009YYYNN_partial_14_0016_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_14_0016
        rs_R009_ueqv_R009YYYNN_generator_14_0000_0070 =
      rs_R009_ueqv_R009YYYNN_partial_14_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009YYYNN_coefficient_14_0017 : Poly :=
[
  term ((67598721 : Rat) / 85351924) [(1, 1), (9, 1), (16, 1)]
]

/-- Partial product 17 for generator 14. -/
def rs_R009_ueqv_R009YYYNN_partial_14_0017 : Poly :=
[
  term ((67598721 : Rat) / 42675962) [(1, 1), (4, 1), (6, 1), (9, 1), (16, 1)],
  term ((67598721 : Rat) / 42675962) [(1, 1), (5, 1), (7, 1), (9, 1), (16, 1)],
  term ((-67598721 : Rat) / 85351924) [(1, 1), (6, 2), (9, 1), (16, 1)],
  term ((-67598721 : Rat) / 85351924) [(1, 1), (7, 2), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 14. -/
theorem rs_R009_ueqv_R009YYYNN_partial_14_0017_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_14_0017
        rs_R009_ueqv_R009YYYNN_generator_14_0000_0070 =
      rs_R009_ueqv_R009YYYNN_partial_14_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009YYYNN_coefficient_14_0018 : Poly :=
[
  term ((67598721 : Rat) / 21337981) [(1, 1), (13, 1)]
]

/-- Partial product 18 for generator 14. -/
def rs_R009_ueqv_R009YYYNN_partial_14_0018 : Poly :=
[
  term ((135197442 : Rat) / 21337981) [(1, 1), (4, 1), (6, 1), (13, 1)],
  term ((135197442 : Rat) / 21337981) [(1, 1), (5, 1), (7, 1), (13, 1)],
  term ((-67598721 : Rat) / 21337981) [(1, 1), (6, 2), (13, 1)],
  term ((-67598721 : Rat) / 21337981) [(1, 1), (7, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 14. -/
theorem rs_R009_ueqv_R009YYYNN_partial_14_0018_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_14_0018
        rs_R009_ueqv_R009YYYNN_generator_14_0000_0070 =
      rs_R009_ueqv_R009YYYNN_partial_14_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009YYYNN_coefficient_14_0019 : Poly :=
[
  term ((-67598721 : Rat) / 85351924) [(1, 1), (13, 1), (16, 1)]
]

/-- Partial product 19 for generator 14. -/
def rs_R009_ueqv_R009YYYNN_partial_14_0019 : Poly :=
[
  term ((-67598721 : Rat) / 42675962) [(1, 1), (4, 1), (6, 1), (13, 1), (16, 1)],
  term ((-67598721 : Rat) / 42675962) [(1, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((67598721 : Rat) / 85351924) [(1, 1), (6, 2), (13, 1), (16, 1)],
  term ((67598721 : Rat) / 85351924) [(1, 1), (7, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 14. -/
theorem rs_R009_ueqv_R009YYYNN_partial_14_0019_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_14_0019
        rs_R009_ueqv_R009YYYNN_generator_14_0000_0070 =
      rs_R009_ueqv_R009YYYNN_partial_14_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009YYYNN_coefficient_14_0020 : Poly :=
[
  term ((418830453 : Rat) / 21337981) [(1, 1), (15, 1)]
]

/-- Partial product 20 for generator 14. -/
def rs_R009_ueqv_R009YYYNN_partial_14_0020 : Poly :=
[
  term ((837660906 : Rat) / 21337981) [(1, 1), (4, 1), (6, 1), (15, 1)],
  term ((837660906 : Rat) / 21337981) [(1, 1), (5, 1), (7, 1), (15, 1)],
  term ((-418830453 : Rat) / 21337981) [(1, 1), (6, 2), (15, 1)],
  term ((-418830453 : Rat) / 21337981) [(1, 1), (7, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 14. -/
theorem rs_R009_ueqv_R009YYYNN_partial_14_0020_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_14_0020
        rs_R009_ueqv_R009YYYNN_generator_14_0000_0070 =
      rs_R009_ueqv_R009YYYNN_partial_14_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009YYYNN_coefficient_14_0021 : Poly :=
[
  term ((130962789 : Rat) / 42675962) [(2, 1)]
]

/-- Partial product 21 for generator 14. -/
def rs_R009_ueqv_R009YYYNN_partial_14_0021 : Poly :=
[
  term ((130962789 : Rat) / 21337981) [(2, 1), (4, 1), (6, 1)],
  term ((130962789 : Rat) / 21337981) [(2, 1), (5, 1), (7, 1)],
  term ((-130962789 : Rat) / 42675962) [(2, 1), (6, 2)],
  term ((-130962789 : Rat) / 42675962) [(2, 1), (7, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 14. -/
theorem rs_R009_ueqv_R009YYYNN_partial_14_0021_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_14_0021
        rs_R009_ueqv_R009YYYNN_generator_14_0000_0070 =
      rs_R009_ueqv_R009YYYNN_partial_14_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009YYYNN_coefficient_14_0022 : Poly :=
[
  term ((945540216 : Rat) / 21337981) [(2, 1), (3, 1), (9, 1)]
]

/-- Partial product 22 for generator 14. -/
def rs_R009_ueqv_R009YYYNN_partial_14_0022 : Poly :=
[
  term ((1891080432 : Rat) / 21337981) [(2, 1), (3, 1), (4, 1), (6, 1), (9, 1)],
  term ((1891080432 : Rat) / 21337981) [(2, 1), (3, 1), (5, 1), (7, 1), (9, 1)],
  term ((-945540216 : Rat) / 21337981) [(2, 1), (3, 1), (6, 2), (9, 1)],
  term ((-945540216 : Rat) / 21337981) [(2, 1), (3, 1), (7, 2), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 14. -/
theorem rs_R009_ueqv_R009YYYNN_partial_14_0022_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_14_0022
        rs_R009_ueqv_R009YYYNN_generator_14_0000_0070 =
      rs_R009_ueqv_R009YYYNN_partial_14_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009YYYNN_coefficient_14_0023 : Poly :=
[
  term ((-1800091512 : Rat) / 21337981) [(2, 1), (3, 1), (9, 1), (15, 2)]
]

/-- Partial product 23 for generator 14. -/
def rs_R009_ueqv_R009YYYNN_partial_14_0023 : Poly :=
[
  term ((-3600183024 : Rat) / 21337981) [(2, 1), (3, 1), (4, 1), (6, 1), (9, 1), (15, 2)],
  term ((-3600183024 : Rat) / 21337981) [(2, 1), (3, 1), (5, 1), (7, 1), (9, 1), (15, 2)],
  term ((1800091512 : Rat) / 21337981) [(2, 1), (3, 1), (6, 2), (9, 1), (15, 2)],
  term ((1800091512 : Rat) / 21337981) [(2, 1), (3, 1), (7, 2), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 14. -/
theorem rs_R009_ueqv_R009YYYNN_partial_14_0023_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_14_0023
        rs_R009_ueqv_R009YYYNN_generator_14_0000_0070 =
      rs_R009_ueqv_R009YYYNN_partial_14_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009YYYNN_coefficient_14_0024 : Poly :=
[
  term ((-998617086 : Rat) / 21337981) [(2, 1), (3, 1), (13, 1)]
]

/-- Partial product 24 for generator 14. -/
def rs_R009_ueqv_R009YYYNN_partial_14_0024 : Poly :=
[
  term ((-1997234172 : Rat) / 21337981) [(2, 1), (3, 1), (4, 1), (6, 1), (13, 1)],
  term ((-1997234172 : Rat) / 21337981) [(2, 1), (3, 1), (5, 1), (7, 1), (13, 1)],
  term ((998617086 : Rat) / 21337981) [(2, 1), (3, 1), (6, 2), (13, 1)],
  term ((998617086 : Rat) / 21337981) [(2, 1), (3, 1), (7, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 14. -/
theorem rs_R009_ueqv_R009YYYNN_partial_14_0024_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_14_0024
        rs_R009_ueqv_R009YYYNN_generator_14_0000_0070 =
      rs_R009_ueqv_R009YYYNN_partial_14_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009YYYNN_coefficient_14_0025 : Poly :=
[
  term ((3600183024 : Rat) / 21337981) [(2, 1), (3, 1), (13, 1), (15, 2)]
]

/-- Partial product 25 for generator 14. -/
def rs_R009_ueqv_R009YYYNN_partial_14_0025 : Poly :=
[
  term ((7200366048 : Rat) / 21337981) [(2, 1), (3, 1), (4, 1), (6, 1), (13, 1), (15, 2)],
  term ((7200366048 : Rat) / 21337981) [(2, 1), (3, 1), (5, 1), (7, 1), (13, 1), (15, 2)],
  term ((-3600183024 : Rat) / 21337981) [(2, 1), (3, 1), (6, 2), (13, 1), (15, 2)],
  term ((-3600183024 : Rat) / 21337981) [(2, 1), (3, 1), (7, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 14. -/
theorem rs_R009_ueqv_R009YYYNN_partial_14_0025_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_14_0025
        rs_R009_ueqv_R009YYYNN_generator_14_0000_0070 =
      rs_R009_ueqv_R009YYYNN_partial_14_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009YYYNN_coefficient_14_0026 : Poly :=
[
  term ((900045756 : Rat) / 21337981) [(2, 1), (3, 1), (14, 1), (15, 1)]
]

/-- Partial product 26 for generator 14. -/
def rs_R009_ueqv_R009YYYNN_partial_14_0026 : Poly :=
[
  term ((1800091512 : Rat) / 21337981) [(2, 1), (3, 1), (4, 1), (6, 1), (14, 1), (15, 1)],
  term ((1800091512 : Rat) / 21337981) [(2, 1), (3, 1), (5, 1), (7, 1), (14, 1), (15, 1)],
  term ((-900045756 : Rat) / 21337981) [(2, 1), (3, 1), (6, 2), (14, 1), (15, 1)],
  term ((-900045756 : Rat) / 21337981) [(2, 1), (3, 1), (7, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 14. -/
theorem rs_R009_ueqv_R009YYYNN_partial_14_0026_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_14_0026
        rs_R009_ueqv_R009YYYNN_generator_14_0000_0070 =
      rs_R009_ueqv_R009YYYNN_partial_14_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009YYYNN_coefficient_14_0027 : Poly :=
[
  term ((-180951732 : Rat) / 3048283) [(2, 1), (3, 1), (15, 1)]
]

/-- Partial product 27 for generator 14. -/
def rs_R009_ueqv_R009YYYNN_partial_14_0027 : Poly :=
[
  term ((-361903464 : Rat) / 3048283) [(2, 1), (3, 1), (4, 1), (6, 1), (15, 1)],
  term ((-361903464 : Rat) / 3048283) [(2, 1), (3, 1), (5, 1), (7, 1), (15, 1)],
  term ((180951732 : Rat) / 3048283) [(2, 1), (3, 1), (6, 2), (15, 1)],
  term ((180951732 : Rat) / 3048283) [(2, 1), (3, 1), (7, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 14. -/
theorem rs_R009_ueqv_R009YYYNN_partial_14_0027_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_14_0027
        rs_R009_ueqv_R009YYYNN_generator_14_0000_0070 =
      rs_R009_ueqv_R009YYYNN_partial_14_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009YYYNN_coefficient_14_0028 : Poly :=
[
  term ((-701544105 : Rat) / 21337981) [(2, 1), (9, 1), (15, 1)]
]

/-- Partial product 28 for generator 14. -/
def rs_R009_ueqv_R009YYYNN_partial_14_0028 : Poly :=
[
  term ((-1403088210 : Rat) / 21337981) [(2, 1), (4, 1), (6, 1), (9, 1), (15, 1)],
  term ((-1403088210 : Rat) / 21337981) [(2, 1), (5, 1), (7, 1), (9, 1), (15, 1)],
  term ((701544105 : Rat) / 21337981) [(2, 1), (6, 2), (9, 1), (15, 1)],
  term ((701544105 : Rat) / 21337981) [(2, 1), (7, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 14. -/
theorem rs_R009_ueqv_R009YYYNN_partial_14_0028_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_14_0028
        rs_R009_ueqv_R009YYYNN_generator_14_0000_0070 =
      rs_R009_ueqv_R009YYYNN_partial_14_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009YYYNN_coefficient_14_0029 : Poly :=
[
  term ((81891549 : Rat) / 42675962) [(2, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 29 for generator 14. -/
def rs_R009_ueqv_R009YYYNN_partial_14_0029 : Poly :=
[
  term ((81891549 : Rat) / 21337981) [(2, 1), (4, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((81891549 : Rat) / 21337981) [(2, 1), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-81891549 : Rat) / 42675962) [(2, 1), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((-81891549 : Rat) / 42675962) [(2, 1), (7, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 14. -/
theorem rs_R009_ueqv_R009YYYNN_partial_14_0029_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_14_0029
        rs_R009_ueqv_R009YYYNN_generator_14_0000_0070 =
      rs_R009_ueqv_R009YYYNN_partial_14_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009YYYNN_coefficient_14_0030 : Poly :=
[
  term ((1239305112 : Rat) / 21337981) [(2, 1), (9, 1), (15, 3)]
]

/-- Partial product 30 for generator 14. -/
def rs_R009_ueqv_R009YYYNN_partial_14_0030 : Poly :=
[
  term ((2478610224 : Rat) / 21337981) [(2, 1), (4, 1), (6, 1), (9, 1), (15, 3)],
  term ((2478610224 : Rat) / 21337981) [(2, 1), (5, 1), (7, 1), (9, 1), (15, 3)],
  term ((-1239305112 : Rat) / 21337981) [(2, 1), (6, 2), (9, 1), (15, 3)],
  term ((-1239305112 : Rat) / 21337981) [(2, 1), (7, 2), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 14. -/
theorem rs_R009_ueqv_R009YYYNN_partial_14_0030_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_14_0030
        rs_R009_ueqv_R009YYYNN_generator_14_0000_0070 =
      rs_R009_ueqv_R009YYYNN_partial_14_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009YYYNN_coefficient_14_0031 : Poly :=
[
  term ((798590538 : Rat) / 21337981) [(2, 1), (13, 1), (15, 1)]
]

/-- Partial product 31 for generator 14. -/
def rs_R009_ueqv_R009YYYNN_partial_14_0031 : Poly :=
[
  term ((1597181076 : Rat) / 21337981) [(2, 1), (4, 1), (6, 1), (13, 1), (15, 1)],
  term ((1597181076 : Rat) / 21337981) [(2, 1), (5, 1), (7, 1), (13, 1), (15, 1)],
  term ((-798590538 : Rat) / 21337981) [(2, 1), (6, 2), (13, 1), (15, 1)],
  term ((-798590538 : Rat) / 21337981) [(2, 1), (7, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 14. -/
theorem rs_R009_ueqv_R009YYYNN_partial_14_0031_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_14_0031
        rs_R009_ueqv_R009YYYNN_generator_14_0000_0070 =
      rs_R009_ueqv_R009YYYNN_partial_14_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009YYYNN_coefficient_14_0032 : Poly :=
[
  term ((-81891549 : Rat) / 42675962) [(2, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 32 for generator 14. -/
def rs_R009_ueqv_R009YYYNN_partial_14_0032 : Poly :=
[
  term ((-81891549 : Rat) / 21337981) [(2, 1), (4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-81891549 : Rat) / 21337981) [(2, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((81891549 : Rat) / 42675962) [(2, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((81891549 : Rat) / 42675962) [(2, 1), (7, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 14. -/
theorem rs_R009_ueqv_R009YYYNN_partial_14_0032_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_14_0032
        rs_R009_ueqv_R009YYYNN_generator_14_0000_0070 =
      rs_R009_ueqv_R009YYYNN_partial_14_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009YYYNN_coefficient_14_0033 : Poly :=
[
  term ((-2478610224 : Rat) / 21337981) [(2, 1), (13, 1), (15, 3)]
]

/-- Partial product 33 for generator 14. -/
def rs_R009_ueqv_R009YYYNN_partial_14_0033 : Poly :=
[
  term ((-4957220448 : Rat) / 21337981) [(2, 1), (4, 1), (6, 1), (13, 1), (15, 3)],
  term ((-4957220448 : Rat) / 21337981) [(2, 1), (5, 1), (7, 1), (13, 1), (15, 3)],
  term ((2478610224 : Rat) / 21337981) [(2, 1), (6, 2), (13, 1), (15, 3)],
  term ((2478610224 : Rat) / 21337981) [(2, 1), (7, 2), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 14. -/
theorem rs_R009_ueqv_R009YYYNN_partial_14_0033_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_14_0033
        rs_R009_ueqv_R009YYYNN_generator_14_0000_0070 =
      rs_R009_ueqv_R009YYYNN_partial_14_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009YYYNN_coefficient_14_0034 : Poly :=
[
  term ((-128679246 : Rat) / 21337981) [(2, 1), (14, 1)]
]

/-- Partial product 34 for generator 14. -/
def rs_R009_ueqv_R009YYYNN_partial_14_0034 : Poly :=
[
  term ((-257358492 : Rat) / 21337981) [(2, 1), (4, 1), (6, 1), (14, 1)],
  term ((-257358492 : Rat) / 21337981) [(2, 1), (5, 1), (7, 1), (14, 1)],
  term ((128679246 : Rat) / 21337981) [(2, 1), (6, 2), (14, 1)],
  term ((128679246 : Rat) / 21337981) [(2, 1), (7, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 14. -/
theorem rs_R009_ueqv_R009YYYNN_partial_14_0034_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_14_0034
        rs_R009_ueqv_R009YYYNN_generator_14_0000_0070 =
      rs_R009_ueqv_R009YYYNN_partial_14_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009YYYNN_coefficient_14_0035 : Poly :=
[
  term ((-619652556 : Rat) / 21337981) [(2, 1), (14, 1), (15, 2)]
]

/-- Partial product 35 for generator 14. -/
def rs_R009_ueqv_R009YYYNN_partial_14_0035 : Poly :=
[
  term ((-1239305112 : Rat) / 21337981) [(2, 1), (4, 1), (6, 1), (14, 1), (15, 2)],
  term ((-1239305112 : Rat) / 21337981) [(2, 1), (5, 1), (7, 1), (14, 1), (15, 2)],
  term ((619652556 : Rat) / 21337981) [(2, 1), (6, 2), (14, 1), (15, 2)],
  term ((619652556 : Rat) / 21337981) [(2, 1), (7, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 14. -/
theorem rs_R009_ueqv_R009YYYNN_partial_14_0035_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_14_0035
        rs_R009_ueqv_R009YYYNN_generator_14_0000_0070 =
      rs_R009_ueqv_R009YYYNN_partial_14_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009YYYNN_coefficient_14_0036 : Poly :=
[
  term ((838376568 : Rat) / 21337981) [(2, 1), (15, 2)]
]

/-- Partial product 36 for generator 14. -/
def rs_R009_ueqv_R009YYYNN_partial_14_0036 : Poly :=
[
  term ((1676753136 : Rat) / 21337981) [(2, 1), (4, 1), (6, 1), (15, 2)],
  term ((1676753136 : Rat) / 21337981) [(2, 1), (5, 1), (7, 1), (15, 2)],
  term ((-838376568 : Rat) / 21337981) [(2, 1), (6, 2), (15, 2)],
  term ((-838376568 : Rat) / 21337981) [(2, 1), (7, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 14. -/
theorem rs_R009_ueqv_R009YYYNN_partial_14_0036_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_14_0036
        rs_R009_ueqv_R009YYYNN_generator_14_0000_0070 =
      rs_R009_ueqv_R009YYYNN_partial_14_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009YYYNN_coefficient_14_0037 : Poly :=
[
  term ((-22747230 : Rat) / 21337981) [(2, 2)]
]

/-- Partial product 37 for generator 14. -/
def rs_R009_ueqv_R009YYYNN_partial_14_0037 : Poly :=
[
  term ((-45494460 : Rat) / 21337981) [(2, 2), (4, 1), (6, 1)],
  term ((-45494460 : Rat) / 21337981) [(2, 2), (5, 1), (7, 1)],
  term ((22747230 : Rat) / 21337981) [(2, 2), (6, 2)],
  term ((22747230 : Rat) / 21337981) [(2, 2), (7, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 14. -/
theorem rs_R009_ueqv_R009YYYNN_partial_14_0037_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_14_0037
        rs_R009_ueqv_R009YYYNN_generator_14_0000_0070 =
      rs_R009_ueqv_R009YYYNN_partial_14_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009YYYNN_coefficient_14_0038 : Poly :=
[
  term ((-640772955 : Rat) / 21337981) [(3, 1), (9, 1)]
]

/-- Partial product 38 for generator 14. -/
def rs_R009_ueqv_R009YYYNN_partial_14_0038 : Poly :=
[
  term ((-1281545910 : Rat) / 21337981) [(3, 1), (4, 1), (6, 1), (9, 1)],
  term ((-1281545910 : Rat) / 21337981) [(3, 1), (5, 1), (7, 1), (9, 1)],
  term ((640772955 : Rat) / 21337981) [(3, 1), (6, 2), (9, 1)],
  term ((640772955 : Rat) / 21337981) [(3, 1), (7, 2), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 14. -/
theorem rs_R009_ueqv_R009YYYNN_partial_14_0038_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_14_0038
        rs_R009_ueqv_R009YYYNN_generator_14_0000_0070 =
      rs_R009_ueqv_R009YYYNN_partial_14_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009YYYNN_coefficient_14_0039 : Poly :=
[
  term ((-30309768 : Rat) / 21337981) [(3, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 39 for generator 14. -/
def rs_R009_ueqv_R009YYYNN_partial_14_0039 : Poly :=
[
  term ((-60619536 : Rat) / 21337981) [(3, 1), (4, 1), (6, 1), (9, 1), (13, 1), (15, 1)],
  term ((-60619536 : Rat) / 21337981) [(3, 1), (5, 1), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((30309768 : Rat) / 21337981) [(3, 1), (6, 2), (9, 1), (13, 1), (15, 1)],
  term ((30309768 : Rat) / 21337981) [(3, 1), (7, 2), (9, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 14. -/
theorem rs_R009_ueqv_R009YYYNN_partial_14_0039_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_14_0039
        rs_R009_ueqv_R009YYYNN_generator_14_0000_0070 =
      rs_R009_ueqv_R009YYYNN_partial_14_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009YYYNN_coefficient_14_0040 : Poly :=
[
  term ((-15824691 : Rat) / 3048283) [(3, 1), (9, 1), (14, 1)]
]

/-- Partial product 40 for generator 14. -/
def rs_R009_ueqv_R009YYYNN_partial_14_0040 : Poly :=
[
  term ((-31649382 : Rat) / 3048283) [(3, 1), (4, 1), (6, 1), (9, 1), (14, 1)],
  term ((-31649382 : Rat) / 3048283) [(3, 1), (5, 1), (7, 1), (9, 1), (14, 1)],
  term ((15824691 : Rat) / 3048283) [(3, 1), (6, 2), (9, 1), (14, 1)],
  term ((15824691 : Rat) / 3048283) [(3, 1), (7, 2), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 14. -/
theorem rs_R009_ueqv_R009YYYNN_partial_14_0040_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_14_0040
        rs_R009_ueqv_R009YYYNN_generator_14_0000_0070 =
      rs_R009_ueqv_R009YYYNN_partial_14_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009YYYNN_coefficient_14_0041 : Poly :=
[
  term ((-81891549 : Rat) / 42675962) [(3, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 41 for generator 14. -/
def rs_R009_ueqv_R009YYYNN_partial_14_0041 : Poly :=
[
  term ((-81891549 : Rat) / 21337981) [(3, 1), (4, 1), (6, 1), (9, 1), (14, 1), (16, 1)],
  term ((-81891549 : Rat) / 21337981) [(3, 1), (5, 1), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((81891549 : Rat) / 42675962) [(3, 1), (6, 2), (9, 1), (14, 1), (16, 1)],
  term ((81891549 : Rat) / 42675962) [(3, 1), (7, 2), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 14. -/
theorem rs_R009_ueqv_R009YYYNN_partial_14_0041_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_14_0041
        rs_R009_ueqv_R009YYYNN_generator_14_0000_0070 =
      rs_R009_ueqv_R009YYYNN_partial_14_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009YYYNN_coefficient_14_0042 : Poly :=
[
  term ((1362643488 : Rat) / 21337981) [(3, 1), (9, 1), (15, 2)]
]

/-- Partial product 42 for generator 14. -/
def rs_R009_ueqv_R009YYYNN_partial_14_0042 : Poly :=
[
  term ((2725286976 : Rat) / 21337981) [(3, 1), (4, 1), (6, 1), (9, 1), (15, 2)],
  term ((2725286976 : Rat) / 21337981) [(3, 1), (5, 1), (7, 1), (9, 1), (15, 2)],
  term ((-1362643488 : Rat) / 21337981) [(3, 1), (6, 2), (9, 1), (15, 2)],
  term ((-1362643488 : Rat) / 21337981) [(3, 1), (7, 2), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 14. -/
theorem rs_R009_ueqv_R009YYYNN_partial_14_0042_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_14_0042
        rs_R009_ueqv_R009YYYNN_generator_14_0000_0070 =
      rs_R009_ueqv_R009YYYNN_partial_14_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009YYYNN_coefficient_14_0043 : Poly :=
[
  term ((52640874 : Rat) / 21337981) [(3, 1), (9, 1), (16, 1)]
]

/-- Partial product 43 for generator 14. -/
def rs_R009_ueqv_R009YYYNN_partial_14_0043 : Poly :=
[
  term ((105281748 : Rat) / 21337981) [(3, 1), (4, 1), (6, 1), (9, 1), (16, 1)],
  term ((105281748 : Rat) / 21337981) [(3, 1), (5, 1), (7, 1), (9, 1), (16, 1)],
  term ((-52640874 : Rat) / 21337981) [(3, 1), (6, 2), (9, 1), (16, 1)],
  term ((-52640874 : Rat) / 21337981) [(3, 1), (7, 2), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 14. -/
theorem rs_R009_ueqv_R009YYYNN_partial_14_0043_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_14_0043
        rs_R009_ueqv_R009YYYNN_generator_14_0000_0070 =
      rs_R009_ueqv_R009YYYNN_partial_14_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009YYYNN_coefficient_14_0044 : Poly :=
[
  term ((119872206 : Rat) / 3048283) [(3, 1), (13, 1)]
]

/-- Partial product 44 for generator 14. -/
def rs_R009_ueqv_R009YYYNN_partial_14_0044 : Poly :=
[
  term ((239744412 : Rat) / 3048283) [(3, 1), (4, 1), (6, 1), (13, 1)],
  term ((239744412 : Rat) / 3048283) [(3, 1), (5, 1), (7, 1), (13, 1)],
  term ((-119872206 : Rat) / 3048283) [(3, 1), (6, 2), (13, 1)],
  term ((-119872206 : Rat) / 3048283) [(3, 1), (7, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 14. -/
theorem rs_R009_ueqv_R009YYYNN_partial_14_0044_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_14_0044
        rs_R009_ueqv_R009YYYNN_generator_14_0000_0070 =
      rs_R009_ueqv_R009YYYNN_partial_14_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009YYYNN_coefficient_14_0045 : Poly :=
[
  term ((-228477204 : Rat) / 21337981) [(3, 1), (13, 1), (14, 1)]
]

/-- Partial product 45 for generator 14. -/
def rs_R009_ueqv_R009YYYNN_partial_14_0045 : Poly :=
[
  term ((-456954408 : Rat) / 21337981) [(3, 1), (4, 1), (6, 1), (13, 1), (14, 1)],
  term ((-456954408 : Rat) / 21337981) [(3, 1), (5, 1), (7, 1), (13, 1), (14, 1)],
  term ((228477204 : Rat) / 21337981) [(3, 1), (6, 2), (13, 1), (14, 1)],
  term ((228477204 : Rat) / 21337981) [(3, 1), (7, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 14. -/
theorem rs_R009_ueqv_R009YYYNN_partial_14_0045_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_14_0045
        rs_R009_ueqv_R009YYYNN_generator_14_0000_0070 =
      rs_R009_ueqv_R009YYYNN_partial_14_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009YYYNN_coefficient_14_0046 : Poly :=
[
  term ((81891549 : Rat) / 42675962) [(3, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 46 for generator 14. -/
def rs_R009_ueqv_R009YYYNN_partial_14_0046 : Poly :=
[
  term ((81891549 : Rat) / 21337981) [(3, 1), (4, 1), (6, 1), (13, 1), (14, 1), (16, 1)],
  term ((81891549 : Rat) / 21337981) [(3, 1), (5, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-81891549 : Rat) / 42675962) [(3, 1), (6, 2), (13, 1), (14, 1), (16, 1)],
  term ((-81891549 : Rat) / 42675962) [(3, 1), (7, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 14. -/
theorem rs_R009_ueqv_R009YYYNN_partial_14_0046_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_14_0046
        rs_R009_ueqv_R009YYYNN_generator_14_0000_0070 =
      rs_R009_ueqv_R009YYYNN_partial_14_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009YYYNN_coefficient_14_0047 : Poly :=
[
  term ((-2725286976 : Rat) / 21337981) [(3, 1), (13, 1), (15, 2)]
]

/-- Partial product 47 for generator 14. -/
def rs_R009_ueqv_R009YYYNN_partial_14_0047 : Poly :=
[
  term ((-5450573952 : Rat) / 21337981) [(3, 1), (4, 1), (6, 1), (13, 1), (15, 2)],
  term ((-5450573952 : Rat) / 21337981) [(3, 1), (5, 1), (7, 1), (13, 1), (15, 2)],
  term ((2725286976 : Rat) / 21337981) [(3, 1), (6, 2), (13, 1), (15, 2)],
  term ((2725286976 : Rat) / 21337981) [(3, 1), (7, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 14. -/
theorem rs_R009_ueqv_R009YYYNN_partial_14_0047_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_14_0047
        rs_R009_ueqv_R009YYYNN_generator_14_0000_0070 =
      rs_R009_ueqv_R009YYYNN_partial_14_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009YYYNN_coefficient_14_0048 : Poly :=
[
  term ((-52640874 : Rat) / 21337981) [(3, 1), (13, 1), (16, 1)]
]

/-- Partial product 48 for generator 14. -/
def rs_R009_ueqv_R009YYYNN_partial_14_0048 : Poly :=
[
  term ((-105281748 : Rat) / 21337981) [(3, 1), (4, 1), (6, 1), (13, 1), (16, 1)],
  term ((-105281748 : Rat) / 21337981) [(3, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((52640874 : Rat) / 21337981) [(3, 1), (6, 2), (13, 1), (16, 1)],
  term ((52640874 : Rat) / 21337981) [(3, 1), (7, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 14. -/
theorem rs_R009_ueqv_R009YYYNN_partial_14_0048_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_14_0048
        rs_R009_ueqv_R009YYYNN_generator_14_0000_0070 =
      rs_R009_ueqv_R009YYYNN_partial_14_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009YYYNN_coefficient_14_0049 : Poly :=
[
  term ((60619536 : Rat) / 21337981) [(3, 1), (13, 2), (15, 1)]
]

/-- Partial product 49 for generator 14. -/
def rs_R009_ueqv_R009YYYNN_partial_14_0049 : Poly :=
[
  term ((121239072 : Rat) / 21337981) [(3, 1), (4, 1), (6, 1), (13, 2), (15, 1)],
  term ((121239072 : Rat) / 21337981) [(3, 1), (5, 1), (7, 1), (13, 2), (15, 1)],
  term ((-60619536 : Rat) / 21337981) [(3, 1), (6, 2), (13, 2), (15, 1)],
  term ((-60619536 : Rat) / 21337981) [(3, 1), (7, 2), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 14. -/
theorem rs_R009_ueqv_R009YYYNN_partial_14_0049_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_14_0049
        rs_R009_ueqv_R009YYYNN_generator_14_0000_0070 =
      rs_R009_ueqv_R009YYYNN_partial_14_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009YYYNN_coefficient_14_0050 : Poly :=
[
  term ((-900045756 : Rat) / 21337981) [(3, 1), (14, 1), (15, 1)]
]

/-- Partial product 50 for generator 14. -/
def rs_R009_ueqv_R009YYYNN_partial_14_0050 : Poly :=
[
  term ((-1800091512 : Rat) / 21337981) [(3, 1), (4, 1), (6, 1), (14, 1), (15, 1)],
  term ((-1800091512 : Rat) / 21337981) [(3, 1), (5, 1), (7, 1), (14, 1), (15, 1)],
  term ((900045756 : Rat) / 21337981) [(3, 1), (6, 2), (14, 1), (15, 1)],
  term ((900045756 : Rat) / 21337981) [(3, 1), (7, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 14. -/
theorem rs_R009_ueqv_R009YYYNN_partial_14_0050_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_14_0050
        rs_R009_ueqv_R009YYYNN_generator_14_0000_0070 =
      rs_R009_ueqv_R009YYYNN_partial_14_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009YYYNN_coefficient_14_0051 : Poly :=
[
  term ((180951732 : Rat) / 3048283) [(3, 1), (15, 1)]
]

/-- Partial product 51 for generator 14. -/
def rs_R009_ueqv_R009YYYNN_partial_14_0051 : Poly :=
[
  term ((361903464 : Rat) / 3048283) [(3, 1), (4, 1), (6, 1), (15, 1)],
  term ((361903464 : Rat) / 3048283) [(3, 1), (5, 1), (7, 1), (15, 1)],
  term ((-180951732 : Rat) / 3048283) [(3, 1), (6, 2), (15, 1)],
  term ((-180951732 : Rat) / 3048283) [(3, 1), (7, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 14. -/
theorem rs_R009_ueqv_R009YYYNN_partial_14_0051_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_14_0051
        rs_R009_ueqv_R009YYYNN_generator_14_0000_0070 =
      rs_R009_ueqv_R009YYYNN_partial_14_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009YYYNN_coefficient_14_0052 : Poly :=
[
  term ((15164820 : Rat) / 21337981) [(3, 2), (9, 1), (13, 1)]
]

/-- Partial product 52 for generator 14. -/
def rs_R009_ueqv_R009YYYNN_partial_14_0052 : Poly :=
[
  term ((30329640 : Rat) / 21337981) [(3, 2), (4, 1), (6, 1), (9, 1), (13, 1)],
  term ((30329640 : Rat) / 21337981) [(3, 2), (5, 1), (7, 1), (9, 1), (13, 1)],
  term ((-15164820 : Rat) / 21337981) [(3, 2), (6, 2), (9, 1), (13, 1)],
  term ((-15164820 : Rat) / 21337981) [(3, 2), (7, 2), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 14. -/
theorem rs_R009_ueqv_R009YYYNN_partial_14_0052_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_14_0052
        rs_R009_ueqv_R009YYYNN_generator_14_0000_0070 =
      rs_R009_ueqv_R009YYYNN_partial_14_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009YYYNN_coefficient_14_0053 : Poly :=
[
  term ((733232736 : Rat) / 21337981) [(3, 2), (9, 1), (15, 1)]
]

/-- Partial product 53 for generator 14. -/
def rs_R009_ueqv_R009YYYNN_partial_14_0053 : Poly :=
[
  term ((1466465472 : Rat) / 21337981) [(3, 2), (4, 1), (6, 1), (9, 1), (15, 1)],
  term ((1466465472 : Rat) / 21337981) [(3, 2), (5, 1), (7, 1), (9, 1), (15, 1)],
  term ((-733232736 : Rat) / 21337981) [(3, 2), (6, 2), (9, 1), (15, 1)],
  term ((-733232736 : Rat) / 21337981) [(3, 2), (7, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 14. -/
theorem rs_R009_ueqv_R009YYYNN_partial_14_0053_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_14_0053
        rs_R009_ueqv_R009YYYNN_generator_14_0000_0070 =
      rs_R009_ueqv_R009YYYNN_partial_14_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009YYYNN_coefficient_14_0054 : Poly :=
[
  term ((-1466465472 : Rat) / 21337981) [(3, 2), (13, 1), (15, 1)]
]

/-- Partial product 54 for generator 14. -/
def rs_R009_ueqv_R009YYYNN_partial_14_0054 : Poly :=
[
  term ((-2932930944 : Rat) / 21337981) [(3, 2), (4, 1), (6, 1), (13, 1), (15, 1)],
  term ((-2932930944 : Rat) / 21337981) [(3, 2), (5, 1), (7, 1), (13, 1), (15, 1)],
  term ((1466465472 : Rat) / 21337981) [(3, 2), (6, 2), (13, 1), (15, 1)],
  term ((1466465472 : Rat) / 21337981) [(3, 2), (7, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 14. -/
theorem rs_R009_ueqv_R009YYYNN_partial_14_0054_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_14_0054
        rs_R009_ueqv_R009YYYNN_generator_14_0000_0070 =
      rs_R009_ueqv_R009YYYNN_partial_14_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009YYYNN_coefficient_14_0055 : Poly :=
[
  term ((-30329640 : Rat) / 21337981) [(3, 2), (13, 2)]
]

/-- Partial product 55 for generator 14. -/
def rs_R009_ueqv_R009YYYNN_partial_14_0055 : Poly :=
[
  term ((-60659280 : Rat) / 21337981) [(3, 2), (4, 1), (6, 1), (13, 2)],
  term ((-60659280 : Rat) / 21337981) [(3, 2), (5, 1), (7, 1), (13, 2)],
  term ((30329640 : Rat) / 21337981) [(3, 2), (6, 2), (13, 2)],
  term ((30329640 : Rat) / 21337981) [(3, 2), (7, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 14. -/
theorem rs_R009_ueqv_R009YYYNN_partial_14_0055_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_14_0055
        rs_R009_ueqv_R009YYYNN_generator_14_0000_0070 =
      rs_R009_ueqv_R009YYYNN_partial_14_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009YYYNN_coefficient_14_0056 : Poly :=
[
  term ((-17753203 : Rat) / 42675962) [(9, 1), (13, 1)]
]

/-- Partial product 56 for generator 14. -/
def rs_R009_ueqv_R009YYYNN_partial_14_0056 : Poly :=
[
  term ((-17753203 : Rat) / 21337981) [(4, 1), (6, 1), (9, 1), (13, 1)],
  term ((-17753203 : Rat) / 21337981) [(5, 1), (7, 1), (9, 1), (13, 1)],
  term ((17753203 : Rat) / 42675962) [(6, 2), (9, 1), (13, 1)],
  term ((17753203 : Rat) / 42675962) [(7, 2), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 14. -/
theorem rs_R009_ueqv_R009YYYNN_partial_14_0056_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_14_0056
        rs_R009_ueqv_R009YYYNN_generator_14_0000_0070 =
      rs_R009_ueqv_R009YYYNN_partial_14_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009YYYNN_coefficient_14_0057 : Poly :=
[
  term ((17753203 : Rat) / 85351924) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 57 for generator 14. -/
def rs_R009_ueqv_R009YYYNN_partial_14_0057 : Poly :=
[
  term ((17753203 : Rat) / 42675962) [(4, 1), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((17753203 : Rat) / 42675962) [(5, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((-17753203 : Rat) / 85351924) [(6, 2), (9, 1), (13, 1), (16, 1)],
  term ((-17753203 : Rat) / 85351924) [(7, 2), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 14. -/
theorem rs_R009_ueqv_R009YYYNN_partial_14_0057_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_14_0057
        rs_R009_ueqv_R009YYYNN_generator_14_0000_0070 =
      rs_R009_ueqv_R009YYYNN_partial_14_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009YYYNN_coefficient_14_0058 : Poly :=
[
  term ((309826278 : Rat) / 21337981) [(9, 1), (14, 1), (15, 1)]
]

/-- Partial product 58 for generator 14. -/
def rs_R009_ueqv_R009YYYNN_partial_14_0058 : Poly :=
[
  term ((619652556 : Rat) / 21337981) [(4, 1), (6, 1), (9, 1), (14, 1), (15, 1)],
  term ((619652556 : Rat) / 21337981) [(5, 1), (7, 1), (9, 1), (14, 1), (15, 1)],
  term ((-309826278 : Rat) / 21337981) [(6, 2), (9, 1), (14, 1), (15, 1)],
  term ((-309826278 : Rat) / 21337981) [(7, 2), (9, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 14. -/
theorem rs_R009_ueqv_R009YYYNN_partial_14_0058_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_14_0058
        rs_R009_ueqv_R009YYYNN_generator_14_0000_0070 =
      rs_R009_ueqv_R009YYYNN_partial_14_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009YYYNN_coefficient_14_0059 : Poly :=
[
  term ((15563619 : Rat) / 870938) [(9, 1), (15, 1)]
]

/-- Partial product 59 for generator 14. -/
def rs_R009_ueqv_R009YYYNN_partial_14_0059 : Poly :=
[
  term ((15563619 : Rat) / 435469) [(4, 1), (6, 1), (9, 1), (15, 1)],
  term ((15563619 : Rat) / 435469) [(5, 1), (7, 1), (9, 1), (15, 1)],
  term ((-15563619 : Rat) / 870938) [(6, 2), (9, 1), (15, 1)],
  term ((-15563619 : Rat) / 870938) [(7, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 14. -/
theorem rs_R009_ueqv_R009YYYNN_partial_14_0059_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_14_0059
        rs_R009_ueqv_R009YYYNN_generator_14_0000_0070 =
      rs_R009_ueqv_R009YYYNN_partial_14_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009YYYNN_coefficient_14_0060 : Poly :=
[
  term ((-142964775 : Rat) / 85351924) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 60 for generator 14. -/
def rs_R009_ueqv_R009YYYNN_partial_14_0060 : Poly :=
[
  term ((-142964775 : Rat) / 42675962) [(4, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-142964775 : Rat) / 42675962) [(5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((142964775 : Rat) / 85351924) [(6, 2), (9, 1), (15, 1), (16, 1)],
  term ((142964775 : Rat) / 85351924) [(7, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 14. -/
theorem rs_R009_ueqv_R009YYYNN_partial_14_0060_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_14_0060
        rs_R009_ueqv_R009YYYNN_generator_14_0000_0070 =
      rs_R009_ueqv_R009YYYNN_partial_14_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009YYYNN_coefficient_14_0061 : Poly :=
[
  term ((-1239305112 : Rat) / 21337981) [(9, 1), (15, 3)]
]

/-- Partial product 61 for generator 14. -/
def rs_R009_ueqv_R009YYYNN_partial_14_0061 : Poly :=
[
  term ((-2478610224 : Rat) / 21337981) [(4, 1), (6, 1), (9, 1), (15, 3)],
  term ((-2478610224 : Rat) / 21337981) [(5, 1), (7, 1), (9, 1), (15, 3)],
  term ((1239305112 : Rat) / 21337981) [(6, 2), (9, 1), (15, 3)],
  term ((1239305112 : Rat) / 21337981) [(7, 2), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 14. -/
theorem rs_R009_ueqv_R009YYYNN_partial_14_0061_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_14_0061
        rs_R009_ueqv_R009YYYNN_generator_14_0000_0070 =
      rs_R009_ueqv_R009YYYNN_partial_14_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009YYYNN_coefficient_14_0062 : Poly :=
[
  term ((-309826278 : Rat) / 21337981) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 62 for generator 14. -/
def rs_R009_ueqv_R009YYYNN_partial_14_0062 : Poly :=
[
  term ((-619652556 : Rat) / 21337981) [(4, 1), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((-619652556 : Rat) / 21337981) [(5, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((309826278 : Rat) / 21337981) [(6, 2), (13, 1), (14, 1), (15, 1)],
  term ((309826278 : Rat) / 21337981) [(7, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 14. -/
theorem rs_R009_ueqv_R009YYYNN_partial_14_0062_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_14_0062
        rs_R009_ueqv_R009YYYNN_generator_14_0000_0070 =
      rs_R009_ueqv_R009YYYNN_partial_14_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009YYYNN_coefficient_14_0063 : Poly :=
[
  term ((-467945937 : Rat) / 21337981) [(13, 1), (15, 1)]
]

/-- Partial product 63 for generator 14. -/
def rs_R009_ueqv_R009YYYNN_partial_14_0063 : Poly :=
[
  term ((-935891874 : Rat) / 21337981) [(4, 1), (6, 1), (13, 1), (15, 1)],
  term ((-935891874 : Rat) / 21337981) [(5, 1), (7, 1), (13, 1), (15, 1)],
  term ((467945937 : Rat) / 21337981) [(6, 2), (13, 1), (15, 1)],
  term ((467945937 : Rat) / 21337981) [(7, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 14. -/
theorem rs_R009_ueqv_R009YYYNN_partial_14_0063_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_14_0063
        rs_R009_ueqv_R009YYYNN_generator_14_0000_0070 =
      rs_R009_ueqv_R009YYYNN_partial_14_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009YYYNN_coefficient_14_0064 : Poly :=
[
  term ((142964775 : Rat) / 85351924) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 64 for generator 14. -/
def rs_R009_ueqv_R009YYYNN_partial_14_0064 : Poly :=
[
  term ((142964775 : Rat) / 42675962) [(4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((142964775 : Rat) / 42675962) [(5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-142964775 : Rat) / 85351924) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-142964775 : Rat) / 85351924) [(7, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 14. -/
theorem rs_R009_ueqv_R009YYYNN_partial_14_0064_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_14_0064
        rs_R009_ueqv_R009YYYNN_generator_14_0000_0070 =
      rs_R009_ueqv_R009YYYNN_partial_14_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009YYYNN_coefficient_14_0065 : Poly :=
[
  term ((2478610224 : Rat) / 21337981) [(13, 1), (15, 3)]
]

/-- Partial product 65 for generator 14. -/
def rs_R009_ueqv_R009YYYNN_partial_14_0065 : Poly :=
[
  term ((4957220448 : Rat) / 21337981) [(4, 1), (6, 1), (13, 1), (15, 3)],
  term ((4957220448 : Rat) / 21337981) [(5, 1), (7, 1), (13, 1), (15, 3)],
  term ((-2478610224 : Rat) / 21337981) [(6, 2), (13, 1), (15, 3)],
  term ((-2478610224 : Rat) / 21337981) [(7, 2), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 14. -/
theorem rs_R009_ueqv_R009YYYNN_partial_14_0065_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_14_0065
        rs_R009_ueqv_R009YYYNN_generator_14_0000_0070 =
      rs_R009_ueqv_R009YYYNN_partial_14_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009YYYNN_coefficient_14_0066 : Poly :=
[
  term ((17753203 : Rat) / 21337981) [(13, 2)]
]

/-- Partial product 66 for generator 14. -/
def rs_R009_ueqv_R009YYYNN_partial_14_0066 : Poly :=
[
  term ((35506406 : Rat) / 21337981) [(4, 1), (6, 1), (13, 2)],
  term ((35506406 : Rat) / 21337981) [(5, 1), (7, 1), (13, 2)],
  term ((-17753203 : Rat) / 21337981) [(6, 2), (13, 2)],
  term ((-17753203 : Rat) / 21337981) [(7, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 14. -/
theorem rs_R009_ueqv_R009YYYNN_partial_14_0066_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_14_0066
        rs_R009_ueqv_R009YYYNN_generator_14_0000_0070 =
      rs_R009_ueqv_R009YYYNN_partial_14_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009YYYNN_coefficient_14_0067 : Poly :=
[
  term ((-17753203 : Rat) / 85351924) [(13, 2), (16, 1)]
]

/-- Partial product 67 for generator 14. -/
def rs_R009_ueqv_R009YYYNN_partial_14_0067 : Poly :=
[
  term ((-17753203 : Rat) / 42675962) [(4, 1), (6, 1), (13, 2), (16, 1)],
  term ((-17753203 : Rat) / 42675962) [(5, 1), (7, 1), (13, 2), (16, 1)],
  term ((17753203 : Rat) / 85351924) [(6, 2), (13, 2), (16, 1)],
  term ((17753203 : Rat) / 85351924) [(7, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 14. -/
theorem rs_R009_ueqv_R009YYYNN_partial_14_0067_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_14_0067
        rs_R009_ueqv_R009YYYNN_generator_14_0000_0070 =
      rs_R009_ueqv_R009YYYNN_partial_14_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009YYYNN_coefficient_14_0068 : Poly :=
[
  term ((128679246 : Rat) / 21337981) [(14, 1)]
]

/-- Partial product 68 for generator 14. -/
def rs_R009_ueqv_R009YYYNN_partial_14_0068 : Poly :=
[
  term ((257358492 : Rat) / 21337981) [(4, 1), (6, 1), (14, 1)],
  term ((257358492 : Rat) / 21337981) [(5, 1), (7, 1), (14, 1)],
  term ((-128679246 : Rat) / 21337981) [(6, 2), (14, 1)],
  term ((-128679246 : Rat) / 21337981) [(7, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 14. -/
theorem rs_R009_ueqv_R009YYYNN_partial_14_0068_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_14_0068
        rs_R009_ueqv_R009YYYNN_generator_14_0000_0070 =
      rs_R009_ueqv_R009YYYNN_partial_14_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009YYYNN_coefficient_14_0069 : Poly :=
[
  term ((619652556 : Rat) / 21337981) [(14, 1), (15, 2)]
]

/-- Partial product 69 for generator 14. -/
def rs_R009_ueqv_R009YYYNN_partial_14_0069 : Poly :=
[
  term ((1239305112 : Rat) / 21337981) [(4, 1), (6, 1), (14, 1), (15, 2)],
  term ((1239305112 : Rat) / 21337981) [(5, 1), (7, 1), (14, 1), (15, 2)],
  term ((-619652556 : Rat) / 21337981) [(6, 2), (14, 1), (15, 2)],
  term ((-619652556 : Rat) / 21337981) [(7, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 14. -/
theorem rs_R009_ueqv_R009YYYNN_partial_14_0069_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_14_0069
        rs_R009_ueqv_R009YYYNN_generator_14_0000_0070 =
      rs_R009_ueqv_R009YYYNN_partial_14_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009YYYNN_coefficient_14_0070 : Poly :=
[
  term ((-838376568 : Rat) / 21337981) [(15, 2)]
]

/-- Partial product 70 for generator 14. -/
def rs_R009_ueqv_R009YYYNN_partial_14_0070 : Poly :=
[
  term ((-1676753136 : Rat) / 21337981) [(4, 1), (6, 1), (15, 2)],
  term ((-1676753136 : Rat) / 21337981) [(5, 1), (7, 1), (15, 2)],
  term ((838376568 : Rat) / 21337981) [(6, 2), (15, 2)],
  term ((838376568 : Rat) / 21337981) [(7, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 14. -/
theorem rs_R009_ueqv_R009YYYNN_partial_14_0070_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_14_0070
        rs_R009_ueqv_R009YYYNN_generator_14_0000_0070 =
      rs_R009_ueqv_R009YYYNN_partial_14_0070 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009YYYNN_partials_14_0000_0070 : List Poly :=
[
  rs_R009_ueqv_R009YYYNN_partial_14_0000,
  rs_R009_ueqv_R009YYYNN_partial_14_0001,
  rs_R009_ueqv_R009YYYNN_partial_14_0002,
  rs_R009_ueqv_R009YYYNN_partial_14_0003,
  rs_R009_ueqv_R009YYYNN_partial_14_0004,
  rs_R009_ueqv_R009YYYNN_partial_14_0005,
  rs_R009_ueqv_R009YYYNN_partial_14_0006,
  rs_R009_ueqv_R009YYYNN_partial_14_0007,
  rs_R009_ueqv_R009YYYNN_partial_14_0008,
  rs_R009_ueqv_R009YYYNN_partial_14_0009,
  rs_R009_ueqv_R009YYYNN_partial_14_0010,
  rs_R009_ueqv_R009YYYNN_partial_14_0011,
  rs_R009_ueqv_R009YYYNN_partial_14_0012,
  rs_R009_ueqv_R009YYYNN_partial_14_0013,
  rs_R009_ueqv_R009YYYNN_partial_14_0014,
  rs_R009_ueqv_R009YYYNN_partial_14_0015,
  rs_R009_ueqv_R009YYYNN_partial_14_0016,
  rs_R009_ueqv_R009YYYNN_partial_14_0017,
  rs_R009_ueqv_R009YYYNN_partial_14_0018,
  rs_R009_ueqv_R009YYYNN_partial_14_0019,
  rs_R009_ueqv_R009YYYNN_partial_14_0020,
  rs_R009_ueqv_R009YYYNN_partial_14_0021,
  rs_R009_ueqv_R009YYYNN_partial_14_0022,
  rs_R009_ueqv_R009YYYNN_partial_14_0023,
  rs_R009_ueqv_R009YYYNN_partial_14_0024,
  rs_R009_ueqv_R009YYYNN_partial_14_0025,
  rs_R009_ueqv_R009YYYNN_partial_14_0026,
  rs_R009_ueqv_R009YYYNN_partial_14_0027,
  rs_R009_ueqv_R009YYYNN_partial_14_0028,
  rs_R009_ueqv_R009YYYNN_partial_14_0029,
  rs_R009_ueqv_R009YYYNN_partial_14_0030,
  rs_R009_ueqv_R009YYYNN_partial_14_0031,
  rs_R009_ueqv_R009YYYNN_partial_14_0032,
  rs_R009_ueqv_R009YYYNN_partial_14_0033,
  rs_R009_ueqv_R009YYYNN_partial_14_0034,
  rs_R009_ueqv_R009YYYNN_partial_14_0035,
  rs_R009_ueqv_R009YYYNN_partial_14_0036,
  rs_R009_ueqv_R009YYYNN_partial_14_0037,
  rs_R009_ueqv_R009YYYNN_partial_14_0038,
  rs_R009_ueqv_R009YYYNN_partial_14_0039,
  rs_R009_ueqv_R009YYYNN_partial_14_0040,
  rs_R009_ueqv_R009YYYNN_partial_14_0041,
  rs_R009_ueqv_R009YYYNN_partial_14_0042,
  rs_R009_ueqv_R009YYYNN_partial_14_0043,
  rs_R009_ueqv_R009YYYNN_partial_14_0044,
  rs_R009_ueqv_R009YYYNN_partial_14_0045,
  rs_R009_ueqv_R009YYYNN_partial_14_0046,
  rs_R009_ueqv_R009YYYNN_partial_14_0047,
  rs_R009_ueqv_R009YYYNN_partial_14_0048,
  rs_R009_ueqv_R009YYYNN_partial_14_0049,
  rs_R009_ueqv_R009YYYNN_partial_14_0050,
  rs_R009_ueqv_R009YYYNN_partial_14_0051,
  rs_R009_ueqv_R009YYYNN_partial_14_0052,
  rs_R009_ueqv_R009YYYNN_partial_14_0053,
  rs_R009_ueqv_R009YYYNN_partial_14_0054,
  rs_R009_ueqv_R009YYYNN_partial_14_0055,
  rs_R009_ueqv_R009YYYNN_partial_14_0056,
  rs_R009_ueqv_R009YYYNN_partial_14_0057,
  rs_R009_ueqv_R009YYYNN_partial_14_0058,
  rs_R009_ueqv_R009YYYNN_partial_14_0059,
  rs_R009_ueqv_R009YYYNN_partial_14_0060,
  rs_R009_ueqv_R009YYYNN_partial_14_0061,
  rs_R009_ueqv_R009YYYNN_partial_14_0062,
  rs_R009_ueqv_R009YYYNN_partial_14_0063,
  rs_R009_ueqv_R009YYYNN_partial_14_0064,
  rs_R009_ueqv_R009YYYNN_partial_14_0065,
  rs_R009_ueqv_R009YYYNN_partial_14_0066,
  rs_R009_ueqv_R009YYYNN_partial_14_0067,
  rs_R009_ueqv_R009YYYNN_partial_14_0068,
  rs_R009_ueqv_R009YYYNN_partial_14_0069,
  rs_R009_ueqv_R009YYYNN_partial_14_0070
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009YYYNN_block_14_0000_0070 : Poly :=
[
  term ((1909404 : Rat) / 435469) [(0, 1), (3, 1), (4, 1), (6, 1), (9, 1)],
  term ((-954702 : Rat) / 435469) [(0, 1), (3, 1), (4, 1), (6, 1), (9, 1), (16, 1)],
  term ((-3818808 : Rat) / 435469) [(0, 1), (3, 1), (4, 1), (6, 1), (13, 1)],
  term ((954702 : Rat) / 435469) [(0, 1), (3, 1), (4, 1), (6, 1), (13, 1), (16, 1)],
  term ((1909404 : Rat) / 435469) [(0, 1), (3, 1), (5, 1), (7, 1), (9, 1)],
  term ((-954702 : Rat) / 435469) [(0, 1), (3, 1), (5, 1), (7, 1), (9, 1), (16, 1)],
  term ((-3818808 : Rat) / 435469) [(0, 1), (3, 1), (5, 1), (7, 1), (13, 1)],
  term ((954702 : Rat) / 435469) [(0, 1), (3, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((-954702 : Rat) / 435469) [(0, 1), (3, 1), (6, 2), (9, 1)],
  term ((477351 : Rat) / 435469) [(0, 1), (3, 1), (6, 2), (9, 1), (16, 1)],
  term ((1909404 : Rat) / 435469) [(0, 1), (3, 1), (6, 2), (13, 1)],
  term ((-477351 : Rat) / 435469) [(0, 1), (3, 1), (6, 2), (13, 1), (16, 1)],
  term ((-954702 : Rat) / 435469) [(0, 1), (3, 1), (7, 2), (9, 1)],
  term ((477351 : Rat) / 435469) [(0, 1), (3, 1), (7, 2), (9, 1), (16, 1)],
  term ((1909404 : Rat) / 435469) [(0, 1), (3, 1), (7, 2), (13, 1)],
  term ((-477351 : Rat) / 435469) [(0, 1), (3, 1), (7, 2), (13, 1), (16, 1)],
  term ((41636646 : Rat) / 21337981) [(0, 1), (4, 1), (6, 1), (9, 1), (15, 1)],
  term ((-20818323 : Rat) / 21337981) [(0, 1), (4, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-83273292 : Rat) / 21337981) [(0, 1), (4, 1), (6, 1), (13, 1), (15, 1)],
  term ((20818323 : Rat) / 21337981) [(0, 1), (4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((41636646 : Rat) / 21337981) [(0, 1), (5, 1), (7, 1), (9, 1), (15, 1)],
  term ((-20818323 : Rat) / 21337981) [(0, 1), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-83273292 : Rat) / 21337981) [(0, 1), (5, 1), (7, 1), (13, 1), (15, 1)],
  term ((20818323 : Rat) / 21337981) [(0, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-20818323 : Rat) / 21337981) [(0, 1), (6, 2), (9, 1), (15, 1)],
  term ((20818323 : Rat) / 42675962) [(0, 1), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((41636646 : Rat) / 21337981) [(0, 1), (6, 2), (13, 1), (15, 1)],
  term ((-20818323 : Rat) / 42675962) [(0, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-20818323 : Rat) / 21337981) [(0, 1), (7, 2), (9, 1), (15, 1)],
  term ((20818323 : Rat) / 42675962) [(0, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((41636646 : Rat) / 21337981) [(0, 1), (7, 2), (13, 1), (15, 1)],
  term ((-20818323 : Rat) / 42675962) [(0, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((1448639964 : Rat) / 21337981) [(1, 1), (2, 1), (3, 1), (4, 1), (6, 1)],
  term ((1448639964 : Rat) / 21337981) [(1, 1), (2, 1), (3, 1), (5, 1), (7, 1)],
  term ((-724319982 : Rat) / 21337981) [(1, 1), (2, 1), (3, 1), (6, 2)],
  term ((-724319982 : Rat) / 21337981) [(1, 1), (2, 1), (3, 1), (7, 2)],
  term ((-837660906 : Rat) / 21337981) [(1, 1), (2, 1), (4, 1), (6, 1), (15, 1)],
  term ((-837660906 : Rat) / 21337981) [(1, 1), (2, 1), (5, 1), (7, 1), (15, 1)],
  term ((418830453 : Rat) / 21337981) [(1, 1), (2, 1), (6, 2), (15, 1)],
  term ((418830453 : Rat) / 21337981) [(1, 1), (2, 1), (7, 2), (15, 1)],
  term ((-1448639964 : Rat) / 21337981) [(1, 1), (3, 1), (4, 1), (6, 1)],
  term ((1675321812 : Rat) / 21337981) [(1, 1), (3, 1), (4, 1), (6, 1), (9, 1), (15, 1)],
  term ((-3350643624 : Rat) / 21337981) [(1, 1), (3, 1), (4, 1), (6, 1), (13, 1), (15, 1)],
  term ((-1448639964 : Rat) / 21337981) [(1, 1), (3, 1), (5, 1), (7, 1)],
  term ((1675321812 : Rat) / 21337981) [(1, 1), (3, 1), (5, 1), (7, 1), (9, 1), (15, 1)],
  term ((-3350643624 : Rat) / 21337981) [(1, 1), (3, 1), (5, 1), (7, 1), (13, 1), (15, 1)],
  term ((724319982 : Rat) / 21337981) [(1, 1), (3, 1), (6, 2)],
  term ((-837660906 : Rat) / 21337981) [(1, 1), (3, 1), (6, 2), (9, 1), (15, 1)],
  term ((1675321812 : Rat) / 21337981) [(1, 1), (3, 1), (6, 2), (13, 1), (15, 1)],
  term ((724319982 : Rat) / 21337981) [(1, 1), (3, 1), (7, 2)],
  term ((-837660906 : Rat) / 21337981) [(1, 1), (3, 1), (7, 2), (9, 1), (15, 1)],
  term ((1675321812 : Rat) / 21337981) [(1, 1), (3, 1), (7, 2), (13, 1), (15, 1)],
  term ((-2897279928 : Rat) / 21337981) [(1, 1), (3, 2), (4, 1), (6, 1), (9, 1)],
  term ((5794559856 : Rat) / 21337981) [(1, 1), (3, 2), (4, 1), (6, 1), (13, 1)],
  term ((-2897279928 : Rat) / 21337981) [(1, 1), (3, 2), (5, 1), (7, 1), (9, 1)],
  term ((5794559856 : Rat) / 21337981) [(1, 1), (3, 2), (5, 1), (7, 1), (13, 1)],
  term ((1448639964 : Rat) / 21337981) [(1, 1), (3, 2), (6, 2), (9, 1)],
  term ((-2897279928 : Rat) / 21337981) [(1, 1), (3, 2), (6, 2), (13, 1)],
  term ((1448639964 : Rat) / 21337981) [(1, 1), (3, 2), (7, 2), (9, 1)],
  term ((-2897279928 : Rat) / 21337981) [(1, 1), (3, 2), (7, 2), (13, 1)],
  term ((-67598721 : Rat) / 21337981) [(1, 1), (4, 1), (6, 1), (9, 1)],
  term ((67598721 : Rat) / 42675962) [(1, 1), (4, 1), (6, 1), (9, 1), (16, 1)],
  term ((135197442 : Rat) / 21337981) [(1, 1), (4, 1), (6, 1), (13, 1)],
  term ((-67598721 : Rat) / 42675962) [(1, 1), (4, 1), (6, 1), (13, 1), (16, 1)],
  term ((837660906 : Rat) / 21337981) [(1, 1), (4, 1), (6, 1), (15, 1)],
  term ((-67598721 : Rat) / 21337981) [(1, 1), (5, 1), (7, 1), (9, 1)],
  term ((67598721 : Rat) / 42675962) [(1, 1), (5, 1), (7, 1), (9, 1), (16, 1)],
  term ((135197442 : Rat) / 21337981) [(1, 1), (5, 1), (7, 1), (13, 1)],
  term ((-67598721 : Rat) / 42675962) [(1, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((837660906 : Rat) / 21337981) [(1, 1), (5, 1), (7, 1), (15, 1)],
  term ((67598721 : Rat) / 42675962) [(1, 1), (6, 2), (9, 1)],
  term ((-67598721 : Rat) / 85351924) [(1, 1), (6, 2), (9, 1), (16, 1)],
  term ((-67598721 : Rat) / 21337981) [(1, 1), (6, 2), (13, 1)],
  term ((67598721 : Rat) / 85351924) [(1, 1), (6, 2), (13, 1), (16, 1)],
  term ((-418830453 : Rat) / 21337981) [(1, 1), (6, 2), (15, 1)],
  term ((67598721 : Rat) / 42675962) [(1, 1), (7, 2), (9, 1)],
  term ((-67598721 : Rat) / 85351924) [(1, 1), (7, 2), (9, 1), (16, 1)],
  term ((-67598721 : Rat) / 21337981) [(1, 1), (7, 2), (13, 1)],
  term ((67598721 : Rat) / 85351924) [(1, 1), (7, 2), (13, 1), (16, 1)],
  term ((-418830453 : Rat) / 21337981) [(1, 1), (7, 2), (15, 1)],
  term ((1891080432 : Rat) / 21337981) [(2, 1), (3, 1), (4, 1), (6, 1), (9, 1)],
  term ((-3600183024 : Rat) / 21337981) [(2, 1), (3, 1), (4, 1), (6, 1), (9, 1), (15, 2)],
  term ((-1997234172 : Rat) / 21337981) [(2, 1), (3, 1), (4, 1), (6, 1), (13, 1)],
  term ((7200366048 : Rat) / 21337981) [(2, 1), (3, 1), (4, 1), (6, 1), (13, 1), (15, 2)],
  term ((1800091512 : Rat) / 21337981) [(2, 1), (3, 1), (4, 1), (6, 1), (14, 1), (15, 1)],
  term ((-361903464 : Rat) / 3048283) [(2, 1), (3, 1), (4, 1), (6, 1), (15, 1)],
  term ((1891080432 : Rat) / 21337981) [(2, 1), (3, 1), (5, 1), (7, 1), (9, 1)],
  term ((-3600183024 : Rat) / 21337981) [(2, 1), (3, 1), (5, 1), (7, 1), (9, 1), (15, 2)],
  term ((-1997234172 : Rat) / 21337981) [(2, 1), (3, 1), (5, 1), (7, 1), (13, 1)],
  term ((7200366048 : Rat) / 21337981) [(2, 1), (3, 1), (5, 1), (7, 1), (13, 1), (15, 2)],
  term ((1800091512 : Rat) / 21337981) [(2, 1), (3, 1), (5, 1), (7, 1), (14, 1), (15, 1)],
  term ((-361903464 : Rat) / 3048283) [(2, 1), (3, 1), (5, 1), (7, 1), (15, 1)],
  term ((-945540216 : Rat) / 21337981) [(2, 1), (3, 1), (6, 2), (9, 1)],
  term ((1800091512 : Rat) / 21337981) [(2, 1), (3, 1), (6, 2), (9, 1), (15, 2)],
  term ((998617086 : Rat) / 21337981) [(2, 1), (3, 1), (6, 2), (13, 1)],
  term ((-3600183024 : Rat) / 21337981) [(2, 1), (3, 1), (6, 2), (13, 1), (15, 2)],
  term ((-900045756 : Rat) / 21337981) [(2, 1), (3, 1), (6, 2), (14, 1), (15, 1)],
  term ((180951732 : Rat) / 3048283) [(2, 1), (3, 1), (6, 2), (15, 1)],
  term ((-945540216 : Rat) / 21337981) [(2, 1), (3, 1), (7, 2), (9, 1)],
  term ((1800091512 : Rat) / 21337981) [(2, 1), (3, 1), (7, 2), (9, 1), (15, 2)],
  term ((998617086 : Rat) / 21337981) [(2, 1), (3, 1), (7, 2), (13, 1)],
  term ((-3600183024 : Rat) / 21337981) [(2, 1), (3, 1), (7, 2), (13, 1), (15, 2)],
  term ((-900045756 : Rat) / 21337981) [(2, 1), (3, 1), (7, 2), (14, 1), (15, 1)],
  term ((180951732 : Rat) / 3048283) [(2, 1), (3, 1), (7, 2), (15, 1)],
  term ((130962789 : Rat) / 21337981) [(2, 1), (4, 1), (6, 1)],
  term ((-1403088210 : Rat) / 21337981) [(2, 1), (4, 1), (6, 1), (9, 1), (15, 1)],
  term ((81891549 : Rat) / 21337981) [(2, 1), (4, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((2478610224 : Rat) / 21337981) [(2, 1), (4, 1), (6, 1), (9, 1), (15, 3)],
  term ((1597181076 : Rat) / 21337981) [(2, 1), (4, 1), (6, 1), (13, 1), (15, 1)],
  term ((-81891549 : Rat) / 21337981) [(2, 1), (4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4957220448 : Rat) / 21337981) [(2, 1), (4, 1), (6, 1), (13, 1), (15, 3)],
  term ((-257358492 : Rat) / 21337981) [(2, 1), (4, 1), (6, 1), (14, 1)],
  term ((-1239305112 : Rat) / 21337981) [(2, 1), (4, 1), (6, 1), (14, 1), (15, 2)],
  term ((1676753136 : Rat) / 21337981) [(2, 1), (4, 1), (6, 1), (15, 2)],
  term ((130962789 : Rat) / 21337981) [(2, 1), (5, 1), (7, 1)],
  term ((-1403088210 : Rat) / 21337981) [(2, 1), (5, 1), (7, 1), (9, 1), (15, 1)],
  term ((81891549 : Rat) / 21337981) [(2, 1), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((2478610224 : Rat) / 21337981) [(2, 1), (5, 1), (7, 1), (9, 1), (15, 3)],
  term ((1597181076 : Rat) / 21337981) [(2, 1), (5, 1), (7, 1), (13, 1), (15, 1)],
  term ((-81891549 : Rat) / 21337981) [(2, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4957220448 : Rat) / 21337981) [(2, 1), (5, 1), (7, 1), (13, 1), (15, 3)],
  term ((-257358492 : Rat) / 21337981) [(2, 1), (5, 1), (7, 1), (14, 1)],
  term ((-1239305112 : Rat) / 21337981) [(2, 1), (5, 1), (7, 1), (14, 1), (15, 2)],
  term ((1676753136 : Rat) / 21337981) [(2, 1), (5, 1), (7, 1), (15, 2)],
  term ((-130962789 : Rat) / 42675962) [(2, 1), (6, 2)],
  term ((701544105 : Rat) / 21337981) [(2, 1), (6, 2), (9, 1), (15, 1)],
  term ((-81891549 : Rat) / 42675962) [(2, 1), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((-1239305112 : Rat) / 21337981) [(2, 1), (6, 2), (9, 1), (15, 3)],
  term ((-798590538 : Rat) / 21337981) [(2, 1), (6, 2), (13, 1), (15, 1)],
  term ((81891549 : Rat) / 42675962) [(2, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((2478610224 : Rat) / 21337981) [(2, 1), (6, 2), (13, 1), (15, 3)],
  term ((128679246 : Rat) / 21337981) [(2, 1), (6, 2), (14, 1)],
  term ((619652556 : Rat) / 21337981) [(2, 1), (6, 2), (14, 1), (15, 2)],
  term ((-838376568 : Rat) / 21337981) [(2, 1), (6, 2), (15, 2)],
  term ((-130962789 : Rat) / 42675962) [(2, 1), (7, 2)],
  term ((701544105 : Rat) / 21337981) [(2, 1), (7, 2), (9, 1), (15, 1)],
  term ((-81891549 : Rat) / 42675962) [(2, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-1239305112 : Rat) / 21337981) [(2, 1), (7, 2), (9, 1), (15, 3)],
  term ((-798590538 : Rat) / 21337981) [(2, 1), (7, 2), (13, 1), (15, 1)],
  term ((81891549 : Rat) / 42675962) [(2, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((2478610224 : Rat) / 21337981) [(2, 1), (7, 2), (13, 1), (15, 3)],
  term ((128679246 : Rat) / 21337981) [(2, 1), (7, 2), (14, 1)],
  term ((619652556 : Rat) / 21337981) [(2, 1), (7, 2), (14, 1), (15, 2)],
  term ((-838376568 : Rat) / 21337981) [(2, 1), (7, 2), (15, 2)],
  term ((-45494460 : Rat) / 21337981) [(2, 2), (4, 1), (6, 1)],
  term ((-45494460 : Rat) / 21337981) [(2, 2), (5, 1), (7, 1)],
  term ((22747230 : Rat) / 21337981) [(2, 2), (6, 2)],
  term ((22747230 : Rat) / 21337981) [(2, 2), (7, 2)],
  term ((-1281545910 : Rat) / 21337981) [(3, 1), (4, 1), (6, 1), (9, 1)],
  term ((-60619536 : Rat) / 21337981) [(3, 1), (4, 1), (6, 1), (9, 1), (13, 1), (15, 1)],
  term ((-31649382 : Rat) / 3048283) [(3, 1), (4, 1), (6, 1), (9, 1), (14, 1)],
  term ((-81891549 : Rat) / 21337981) [(3, 1), (4, 1), (6, 1), (9, 1), (14, 1), (16, 1)],
  term ((2725286976 : Rat) / 21337981) [(3, 1), (4, 1), (6, 1), (9, 1), (15, 2)],
  term ((105281748 : Rat) / 21337981) [(3, 1), (4, 1), (6, 1), (9, 1), (16, 1)],
  term ((239744412 : Rat) / 3048283) [(3, 1), (4, 1), (6, 1), (13, 1)],
  term ((-456954408 : Rat) / 21337981) [(3, 1), (4, 1), (6, 1), (13, 1), (14, 1)],
  term ((81891549 : Rat) / 21337981) [(3, 1), (4, 1), (6, 1), (13, 1), (14, 1), (16, 1)],
  term ((-5450573952 : Rat) / 21337981) [(3, 1), (4, 1), (6, 1), (13, 1), (15, 2)],
  term ((-105281748 : Rat) / 21337981) [(3, 1), (4, 1), (6, 1), (13, 1), (16, 1)],
  term ((121239072 : Rat) / 21337981) [(3, 1), (4, 1), (6, 1), (13, 2), (15, 1)],
  term ((-1800091512 : Rat) / 21337981) [(3, 1), (4, 1), (6, 1), (14, 1), (15, 1)],
  term ((361903464 : Rat) / 3048283) [(3, 1), (4, 1), (6, 1), (15, 1)],
  term ((-1281545910 : Rat) / 21337981) [(3, 1), (5, 1), (7, 1), (9, 1)],
  term ((-60619536 : Rat) / 21337981) [(3, 1), (5, 1), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-31649382 : Rat) / 3048283) [(3, 1), (5, 1), (7, 1), (9, 1), (14, 1)],
  term ((-81891549 : Rat) / 21337981) [(3, 1), (5, 1), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((2725286976 : Rat) / 21337981) [(3, 1), (5, 1), (7, 1), (9, 1), (15, 2)],
  term ((105281748 : Rat) / 21337981) [(3, 1), (5, 1), (7, 1), (9, 1), (16, 1)],
  term ((239744412 : Rat) / 3048283) [(3, 1), (5, 1), (7, 1), (13, 1)],
  term ((-456954408 : Rat) / 21337981) [(3, 1), (5, 1), (7, 1), (13, 1), (14, 1)],
  term ((81891549 : Rat) / 21337981) [(3, 1), (5, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-5450573952 : Rat) / 21337981) [(3, 1), (5, 1), (7, 1), (13, 1), (15, 2)],
  term ((-105281748 : Rat) / 21337981) [(3, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((121239072 : Rat) / 21337981) [(3, 1), (5, 1), (7, 1), (13, 2), (15, 1)],
  term ((-1800091512 : Rat) / 21337981) [(3, 1), (5, 1), (7, 1), (14, 1), (15, 1)],
  term ((361903464 : Rat) / 3048283) [(3, 1), (5, 1), (7, 1), (15, 1)],
  term ((640772955 : Rat) / 21337981) [(3, 1), (6, 2), (9, 1)],
  term ((30309768 : Rat) / 21337981) [(3, 1), (6, 2), (9, 1), (13, 1), (15, 1)],
  term ((15824691 : Rat) / 3048283) [(3, 1), (6, 2), (9, 1), (14, 1)],
  term ((81891549 : Rat) / 42675962) [(3, 1), (6, 2), (9, 1), (14, 1), (16, 1)],
  term ((-1362643488 : Rat) / 21337981) [(3, 1), (6, 2), (9, 1), (15, 2)],
  term ((-52640874 : Rat) / 21337981) [(3, 1), (6, 2), (9, 1), (16, 1)],
  term ((-119872206 : Rat) / 3048283) [(3, 1), (6, 2), (13, 1)],
  term ((228477204 : Rat) / 21337981) [(3, 1), (6, 2), (13, 1), (14, 1)],
  term ((-81891549 : Rat) / 42675962) [(3, 1), (6, 2), (13, 1), (14, 1), (16, 1)],
  term ((2725286976 : Rat) / 21337981) [(3, 1), (6, 2), (13, 1), (15, 2)],
  term ((52640874 : Rat) / 21337981) [(3, 1), (6, 2), (13, 1), (16, 1)],
  term ((-60619536 : Rat) / 21337981) [(3, 1), (6, 2), (13, 2), (15, 1)],
  term ((900045756 : Rat) / 21337981) [(3, 1), (6, 2), (14, 1), (15, 1)],
  term ((-180951732 : Rat) / 3048283) [(3, 1), (6, 2), (15, 1)],
  term ((640772955 : Rat) / 21337981) [(3, 1), (7, 2), (9, 1)],
  term ((30309768 : Rat) / 21337981) [(3, 1), (7, 2), (9, 1), (13, 1), (15, 1)],
  term ((15824691 : Rat) / 3048283) [(3, 1), (7, 2), (9, 1), (14, 1)],
  term ((81891549 : Rat) / 42675962) [(3, 1), (7, 2), (9, 1), (14, 1), (16, 1)],
  term ((-1362643488 : Rat) / 21337981) [(3, 1), (7, 2), (9, 1), (15, 2)],
  term ((-52640874 : Rat) / 21337981) [(3, 1), (7, 2), (9, 1), (16, 1)],
  term ((-119872206 : Rat) / 3048283) [(3, 1), (7, 2), (13, 1)],
  term ((228477204 : Rat) / 21337981) [(3, 1), (7, 2), (13, 1), (14, 1)],
  term ((-81891549 : Rat) / 42675962) [(3, 1), (7, 2), (13, 1), (14, 1), (16, 1)],
  term ((2725286976 : Rat) / 21337981) [(3, 1), (7, 2), (13, 1), (15, 2)],
  term ((52640874 : Rat) / 21337981) [(3, 1), (7, 2), (13, 1), (16, 1)],
  term ((-60619536 : Rat) / 21337981) [(3, 1), (7, 2), (13, 2), (15, 1)],
  term ((900045756 : Rat) / 21337981) [(3, 1), (7, 2), (14, 1), (15, 1)],
  term ((-180951732 : Rat) / 3048283) [(3, 1), (7, 2), (15, 1)],
  term ((30329640 : Rat) / 21337981) [(3, 2), (4, 1), (6, 1), (9, 1), (13, 1)],
  term ((1466465472 : Rat) / 21337981) [(3, 2), (4, 1), (6, 1), (9, 1), (15, 1)],
  term ((-2932930944 : Rat) / 21337981) [(3, 2), (4, 1), (6, 1), (13, 1), (15, 1)],
  term ((-60659280 : Rat) / 21337981) [(3, 2), (4, 1), (6, 1), (13, 2)],
  term ((30329640 : Rat) / 21337981) [(3, 2), (5, 1), (7, 1), (9, 1), (13, 1)],
  term ((1466465472 : Rat) / 21337981) [(3, 2), (5, 1), (7, 1), (9, 1), (15, 1)],
  term ((-2932930944 : Rat) / 21337981) [(3, 2), (5, 1), (7, 1), (13, 1), (15, 1)],
  term ((-60659280 : Rat) / 21337981) [(3, 2), (5, 1), (7, 1), (13, 2)],
  term ((-15164820 : Rat) / 21337981) [(3, 2), (6, 2), (9, 1), (13, 1)],
  term ((-733232736 : Rat) / 21337981) [(3, 2), (6, 2), (9, 1), (15, 1)],
  term ((1466465472 : Rat) / 21337981) [(3, 2), (6, 2), (13, 1), (15, 1)],
  term ((30329640 : Rat) / 21337981) [(3, 2), (6, 2), (13, 2)],
  term ((-15164820 : Rat) / 21337981) [(3, 2), (7, 2), (9, 1), (13, 1)],
  term ((-733232736 : Rat) / 21337981) [(3, 2), (7, 2), (9, 1), (15, 1)],
  term ((1466465472 : Rat) / 21337981) [(3, 2), (7, 2), (13, 1), (15, 1)],
  term ((30329640 : Rat) / 21337981) [(3, 2), (7, 2), (13, 2)],
  term ((-85468329 : Rat) / 21337981) [(4, 1), (6, 1)],
  term ((-17753203 : Rat) / 21337981) [(4, 1), (6, 1), (9, 1), (13, 1)],
  term ((17753203 : Rat) / 42675962) [(4, 1), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((619652556 : Rat) / 21337981) [(4, 1), (6, 1), (9, 1), (14, 1), (15, 1)],
  term ((15563619 : Rat) / 435469) [(4, 1), (6, 1), (9, 1), (15, 1)],
  term ((-142964775 : Rat) / 42675962) [(4, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-2478610224 : Rat) / 21337981) [(4, 1), (6, 1), (9, 1), (15, 3)],
  term ((-619652556 : Rat) / 21337981) [(4, 1), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((-935891874 : Rat) / 21337981) [(4, 1), (6, 1), (13, 1), (15, 1)],
  term ((142964775 : Rat) / 42675962) [(4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((4957220448 : Rat) / 21337981) [(4, 1), (6, 1), (13, 1), (15, 3)],
  term ((35506406 : Rat) / 21337981) [(4, 1), (6, 1), (13, 2)],
  term ((-17753203 : Rat) / 42675962) [(4, 1), (6, 1), (13, 2), (16, 1)],
  term ((257358492 : Rat) / 21337981) [(4, 1), (6, 1), (14, 1)],
  term ((1239305112 : Rat) / 21337981) [(4, 1), (6, 1), (14, 1), (15, 2)],
  term ((-1676753136 : Rat) / 21337981) [(4, 1), (6, 1), (15, 2)],
  term ((-85468329 : Rat) / 21337981) [(5, 1), (7, 1)],
  term ((-17753203 : Rat) / 21337981) [(5, 1), (7, 1), (9, 1), (13, 1)],
  term ((17753203 : Rat) / 42675962) [(5, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((619652556 : Rat) / 21337981) [(5, 1), (7, 1), (9, 1), (14, 1), (15, 1)],
  term ((15563619 : Rat) / 435469) [(5, 1), (7, 1), (9, 1), (15, 1)],
  term ((-142964775 : Rat) / 42675962) [(5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-2478610224 : Rat) / 21337981) [(5, 1), (7, 1), (9, 1), (15, 3)],
  term ((-619652556 : Rat) / 21337981) [(5, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((-935891874 : Rat) / 21337981) [(5, 1), (7, 1), (13, 1), (15, 1)],
  term ((142964775 : Rat) / 42675962) [(5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((4957220448 : Rat) / 21337981) [(5, 1), (7, 1), (13, 1), (15, 3)],
  term ((35506406 : Rat) / 21337981) [(5, 1), (7, 1), (13, 2)],
  term ((-17753203 : Rat) / 42675962) [(5, 1), (7, 1), (13, 2), (16, 1)],
  term ((257358492 : Rat) / 21337981) [(5, 1), (7, 1), (14, 1)],
  term ((1239305112 : Rat) / 21337981) [(5, 1), (7, 1), (14, 1), (15, 2)],
  term ((-1676753136 : Rat) / 21337981) [(5, 1), (7, 1), (15, 2)],
  term ((85468329 : Rat) / 42675962) [(6, 2)],
  term ((17753203 : Rat) / 42675962) [(6, 2), (9, 1), (13, 1)],
  term ((-17753203 : Rat) / 85351924) [(6, 2), (9, 1), (13, 1), (16, 1)],
  term ((-309826278 : Rat) / 21337981) [(6, 2), (9, 1), (14, 1), (15, 1)],
  term ((-15563619 : Rat) / 870938) [(6, 2), (9, 1), (15, 1)],
  term ((142964775 : Rat) / 85351924) [(6, 2), (9, 1), (15, 1), (16, 1)],
  term ((1239305112 : Rat) / 21337981) [(6, 2), (9, 1), (15, 3)],
  term ((309826278 : Rat) / 21337981) [(6, 2), (13, 1), (14, 1), (15, 1)],
  term ((467945937 : Rat) / 21337981) [(6, 2), (13, 1), (15, 1)],
  term ((-142964775 : Rat) / 85351924) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2478610224 : Rat) / 21337981) [(6, 2), (13, 1), (15, 3)],
  term ((-17753203 : Rat) / 21337981) [(6, 2), (13, 2)],
  term ((17753203 : Rat) / 85351924) [(6, 2), (13, 2), (16, 1)],
  term ((-128679246 : Rat) / 21337981) [(6, 2), (14, 1)],
  term ((-619652556 : Rat) / 21337981) [(6, 2), (14, 1), (15, 2)],
  term ((838376568 : Rat) / 21337981) [(6, 2), (15, 2)],
  term ((85468329 : Rat) / 42675962) [(7, 2)],
  term ((17753203 : Rat) / 42675962) [(7, 2), (9, 1), (13, 1)],
  term ((-17753203 : Rat) / 85351924) [(7, 2), (9, 1), (13, 1), (16, 1)],
  term ((-309826278 : Rat) / 21337981) [(7, 2), (9, 1), (14, 1), (15, 1)],
  term ((-15563619 : Rat) / 870938) [(7, 2), (9, 1), (15, 1)],
  term ((142964775 : Rat) / 85351924) [(7, 2), (9, 1), (15, 1), (16, 1)],
  term ((1239305112 : Rat) / 21337981) [(7, 2), (9, 1), (15, 3)],
  term ((309826278 : Rat) / 21337981) [(7, 2), (13, 1), (14, 1), (15, 1)],
  term ((467945937 : Rat) / 21337981) [(7, 2), (13, 1), (15, 1)],
  term ((-142964775 : Rat) / 85351924) [(7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2478610224 : Rat) / 21337981) [(7, 2), (13, 1), (15, 3)],
  term ((-17753203 : Rat) / 21337981) [(7, 2), (13, 2)],
  term ((17753203 : Rat) / 85351924) [(7, 2), (13, 2), (16, 1)],
  term ((-128679246 : Rat) / 21337981) [(7, 2), (14, 1)],
  term ((-619652556 : Rat) / 21337981) [(7, 2), (14, 1), (15, 2)],
  term ((838376568 : Rat) / 21337981) [(7, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 14, terms 0 through 70. -/
theorem rs_R009_ueqv_R009YYYNN_block_14_0000_0070_valid :
    checkProductSumEq rs_R009_ueqv_R009YYYNN_partials_14_0000_0070
      rs_R009_ueqv_R009YYYNN_block_14_0000_0070 = true := by
  native_decide

end R009UeqvR009YYYNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
