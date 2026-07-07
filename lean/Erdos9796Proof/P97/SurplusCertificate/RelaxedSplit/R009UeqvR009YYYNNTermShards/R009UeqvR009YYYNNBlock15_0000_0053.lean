/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009YYYNN, term block 15:0-53

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009YYYNNTermShards

/-- Generator polynomial 15 for relaxed split surplus certificate `R009:u=v:R009YYYNN`. -/
def rs_R009_ueqv_R009YYYNN_generator_15_0000_0053 : Poly :=
[
  term (2 : Rat) [(4, 1), (8, 1)],
  term (2 : Rat) [(5, 1), (9, 1)],
  term (-1 : Rat) [(8, 2)],
  term (-1 : Rat) [(9, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009YYYNN_coefficient_15_0000 : Poly :=
[
  term ((-1909404 : Rat) / 435469) [(0, 1), (3, 1), (9, 1)]
]

/-- Partial product 0 for generator 15. -/
def rs_R009_ueqv_R009YYYNN_partial_15_0000 : Poly :=
[
  term ((-3818808 : Rat) / 435469) [(0, 1), (3, 1), (4, 1), (8, 1), (9, 1)],
  term ((-3818808 : Rat) / 435469) [(0, 1), (3, 1), (5, 1), (9, 2)],
  term ((1909404 : Rat) / 435469) [(0, 1), (3, 1), (8, 2), (9, 1)],
  term ((1909404 : Rat) / 435469) [(0, 1), (3, 1), (9, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 15. -/
theorem rs_R009_ueqv_R009YYYNN_partial_15_0000_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_15_0000
        rs_R009_ueqv_R009YYYNN_generator_15_0000_0053 =
      rs_R009_ueqv_R009YYYNN_partial_15_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009YYYNN_coefficient_15_0001 : Poly :=
[
  term ((954702 : Rat) / 435469) [(0, 1), (3, 1), (9, 1), (16, 1)]
]

/-- Partial product 1 for generator 15. -/
def rs_R009_ueqv_R009YYYNN_partial_15_0001 : Poly :=
[
  term ((1909404 : Rat) / 435469) [(0, 1), (3, 1), (4, 1), (8, 1), (9, 1), (16, 1)],
  term ((1909404 : Rat) / 435469) [(0, 1), (3, 1), (5, 1), (9, 2), (16, 1)],
  term ((-954702 : Rat) / 435469) [(0, 1), (3, 1), (8, 2), (9, 1), (16, 1)],
  term ((-954702 : Rat) / 435469) [(0, 1), (3, 1), (9, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 15. -/
theorem rs_R009_ueqv_R009YYYNN_partial_15_0001_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_15_0001
        rs_R009_ueqv_R009YYYNN_generator_15_0000_0053 =
      rs_R009_ueqv_R009YYYNN_partial_15_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009YYYNN_coefficient_15_0002 : Poly :=
[
  term ((3818808 : Rat) / 435469) [(0, 1), (3, 1), (13, 1)]
]

/-- Partial product 2 for generator 15. -/
def rs_R009_ueqv_R009YYYNN_partial_15_0002 : Poly :=
[
  term ((7637616 : Rat) / 435469) [(0, 1), (3, 1), (4, 1), (8, 1), (13, 1)],
  term ((7637616 : Rat) / 435469) [(0, 1), (3, 1), (5, 1), (9, 1), (13, 1)],
  term ((-3818808 : Rat) / 435469) [(0, 1), (3, 1), (8, 2), (13, 1)],
  term ((-3818808 : Rat) / 435469) [(0, 1), (3, 1), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 15. -/
theorem rs_R009_ueqv_R009YYYNN_partial_15_0002_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_15_0002
        rs_R009_ueqv_R009YYYNN_generator_15_0000_0053 =
      rs_R009_ueqv_R009YYYNN_partial_15_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009YYYNN_coefficient_15_0003 : Poly :=
[
  term ((-954702 : Rat) / 435469) [(0, 1), (3, 1), (13, 1), (16, 1)]
]

/-- Partial product 3 for generator 15. -/
def rs_R009_ueqv_R009YYYNN_partial_15_0003 : Poly :=
[
  term ((-1909404 : Rat) / 435469) [(0, 1), (3, 1), (4, 1), (8, 1), (13, 1), (16, 1)],
  term ((-1909404 : Rat) / 435469) [(0, 1), (3, 1), (5, 1), (9, 1), (13, 1), (16, 1)],
  term ((954702 : Rat) / 435469) [(0, 1), (3, 1), (8, 2), (13, 1), (16, 1)],
  term ((954702 : Rat) / 435469) [(0, 1), (3, 1), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 15. -/
theorem rs_R009_ueqv_R009YYYNN_partial_15_0003_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_15_0003
        rs_R009_ueqv_R009YYYNN_generator_15_0000_0053 =
      rs_R009_ueqv_R009YYYNN_partial_15_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009YYYNN_coefficient_15_0004 : Poly :=
[
  term ((-41636646 : Rat) / 21337981) [(0, 1), (9, 1), (15, 1)]
]

/-- Partial product 4 for generator 15. -/
def rs_R009_ueqv_R009YYYNN_partial_15_0004 : Poly :=
[
  term ((-83273292 : Rat) / 21337981) [(0, 1), (4, 1), (8, 1), (9, 1), (15, 1)],
  term ((-83273292 : Rat) / 21337981) [(0, 1), (5, 1), (9, 2), (15, 1)],
  term ((41636646 : Rat) / 21337981) [(0, 1), (8, 2), (9, 1), (15, 1)],
  term ((41636646 : Rat) / 21337981) [(0, 1), (9, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 15. -/
theorem rs_R009_ueqv_R009YYYNN_partial_15_0004_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_15_0004
        rs_R009_ueqv_R009YYYNN_generator_15_0000_0053 =
      rs_R009_ueqv_R009YYYNN_partial_15_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009YYYNN_coefficient_15_0005 : Poly :=
[
  term ((20818323 : Rat) / 21337981) [(0, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 5 for generator 15. -/
def rs_R009_ueqv_R009YYYNN_partial_15_0005 : Poly :=
[
  term ((41636646 : Rat) / 21337981) [(0, 1), (4, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((41636646 : Rat) / 21337981) [(0, 1), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-20818323 : Rat) / 21337981) [(0, 1), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((-20818323 : Rat) / 21337981) [(0, 1), (9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 15. -/
theorem rs_R009_ueqv_R009YYYNN_partial_15_0005_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_15_0005
        rs_R009_ueqv_R009YYYNN_generator_15_0000_0053 =
      rs_R009_ueqv_R009YYYNN_partial_15_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009YYYNN_coefficient_15_0006 : Poly :=
[
  term ((83273292 : Rat) / 21337981) [(0, 1), (13, 1), (15, 1)]
]

/-- Partial product 6 for generator 15. -/
def rs_R009_ueqv_R009YYYNN_partial_15_0006 : Poly :=
[
  term ((166546584 : Rat) / 21337981) [(0, 1), (4, 1), (8, 1), (13, 1), (15, 1)],
  term ((166546584 : Rat) / 21337981) [(0, 1), (5, 1), (9, 1), (13, 1), (15, 1)],
  term ((-83273292 : Rat) / 21337981) [(0, 1), (8, 2), (13, 1), (15, 1)],
  term ((-83273292 : Rat) / 21337981) [(0, 1), (9, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 15. -/
theorem rs_R009_ueqv_R009YYYNN_partial_15_0006_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_15_0006
        rs_R009_ueqv_R009YYYNN_generator_15_0000_0053 =
      rs_R009_ueqv_R009YYYNN_partial_15_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009YYYNN_coefficient_15_0007 : Poly :=
[
  term ((-20818323 : Rat) / 21337981) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 7 for generator 15. -/
def rs_R009_ueqv_R009YYYNN_partial_15_0007 : Poly :=
[
  term ((-41636646 : Rat) / 21337981) [(0, 1), (4, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-41636646 : Rat) / 21337981) [(0, 1), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((20818323 : Rat) / 21337981) [(0, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((20818323 : Rat) / 21337981) [(0, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 15. -/
theorem rs_R009_ueqv_R009YYYNN_partial_15_0007_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_15_0007
        rs_R009_ueqv_R009YYYNN_generator_15_0000_0053 =
      rs_R009_ueqv_R009YYYNN_partial_15_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009YYYNN_coefficient_15_0008 : Poly :=
[
  term ((-1675321812 : Rat) / 21337981) [(1, 1), (3, 1), (9, 1), (15, 1)]
]

/-- Partial product 8 for generator 15. -/
def rs_R009_ueqv_R009YYYNN_partial_15_0008 : Poly :=
[
  term ((-3350643624 : Rat) / 21337981) [(1, 1), (3, 1), (4, 1), (8, 1), (9, 1), (15, 1)],
  term ((-3350643624 : Rat) / 21337981) [(1, 1), (3, 1), (5, 1), (9, 2), (15, 1)],
  term ((1675321812 : Rat) / 21337981) [(1, 1), (3, 1), (8, 2), (9, 1), (15, 1)],
  term ((1675321812 : Rat) / 21337981) [(1, 1), (3, 1), (9, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 15. -/
theorem rs_R009_ueqv_R009YYYNN_partial_15_0008_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_15_0008
        rs_R009_ueqv_R009YYYNN_generator_15_0000_0053 =
      rs_R009_ueqv_R009YYYNN_partial_15_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009YYYNN_coefficient_15_0009 : Poly :=
[
  term ((3350643624 : Rat) / 21337981) [(1, 1), (3, 1), (13, 1), (15, 1)]
]

/-- Partial product 9 for generator 15. -/
def rs_R009_ueqv_R009YYYNN_partial_15_0009 : Poly :=
[
  term ((6701287248 : Rat) / 21337981) [(1, 1), (3, 1), (4, 1), (8, 1), (13, 1), (15, 1)],
  term ((6701287248 : Rat) / 21337981) [(1, 1), (3, 1), (5, 1), (9, 1), (13, 1), (15, 1)],
  term ((-3350643624 : Rat) / 21337981) [(1, 1), (3, 1), (8, 2), (13, 1), (15, 1)],
  term ((-3350643624 : Rat) / 21337981) [(1, 1), (3, 1), (9, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 15. -/
theorem rs_R009_ueqv_R009YYYNN_partial_15_0009_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_15_0009
        rs_R009_ueqv_R009YYYNN_generator_15_0000_0053 =
      rs_R009_ueqv_R009YYYNN_partial_15_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009YYYNN_coefficient_15_0010 : Poly :=
[
  term ((2897279928 : Rat) / 21337981) [(1, 1), (3, 2), (9, 1)]
]

/-- Partial product 10 for generator 15. -/
def rs_R009_ueqv_R009YYYNN_partial_15_0010 : Poly :=
[
  term ((5794559856 : Rat) / 21337981) [(1, 1), (3, 2), (4, 1), (8, 1), (9, 1)],
  term ((5794559856 : Rat) / 21337981) [(1, 1), (3, 2), (5, 1), (9, 2)],
  term ((-2897279928 : Rat) / 21337981) [(1, 1), (3, 2), (8, 2), (9, 1)],
  term ((-2897279928 : Rat) / 21337981) [(1, 1), (3, 2), (9, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 15. -/
theorem rs_R009_ueqv_R009YYYNN_partial_15_0010_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_15_0010
        rs_R009_ueqv_R009YYYNN_generator_15_0000_0053 =
      rs_R009_ueqv_R009YYYNN_partial_15_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009YYYNN_coefficient_15_0011 : Poly :=
[
  term ((-5794559856 : Rat) / 21337981) [(1, 1), (3, 2), (13, 1)]
]

/-- Partial product 11 for generator 15. -/
def rs_R009_ueqv_R009YYYNN_partial_15_0011 : Poly :=
[
  term ((-11589119712 : Rat) / 21337981) [(1, 1), (3, 2), (4, 1), (8, 1), (13, 1)],
  term ((-11589119712 : Rat) / 21337981) [(1, 1), (3, 2), (5, 1), (9, 1), (13, 1)],
  term ((5794559856 : Rat) / 21337981) [(1, 1), (3, 2), (8, 2), (13, 1)],
  term ((5794559856 : Rat) / 21337981) [(1, 1), (3, 2), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 15. -/
theorem rs_R009_ueqv_R009YYYNN_partial_15_0011_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_15_0011
        rs_R009_ueqv_R009YYYNN_generator_15_0000_0053 =
      rs_R009_ueqv_R009YYYNN_partial_15_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009YYYNN_coefficient_15_0012 : Poly :=
[
  term ((67598721 : Rat) / 21337981) [(1, 1), (9, 1)]
]

/-- Partial product 12 for generator 15. -/
def rs_R009_ueqv_R009YYYNN_partial_15_0012 : Poly :=
[
  term ((135197442 : Rat) / 21337981) [(1, 1), (4, 1), (8, 1), (9, 1)],
  term ((135197442 : Rat) / 21337981) [(1, 1), (5, 1), (9, 2)],
  term ((-67598721 : Rat) / 21337981) [(1, 1), (8, 2), (9, 1)],
  term ((-67598721 : Rat) / 21337981) [(1, 1), (9, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 15. -/
theorem rs_R009_ueqv_R009YYYNN_partial_15_0012_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_15_0012
        rs_R009_ueqv_R009YYYNN_generator_15_0000_0053 =
      rs_R009_ueqv_R009YYYNN_partial_15_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009YYYNN_coefficient_15_0013 : Poly :=
[
  term ((-67598721 : Rat) / 42675962) [(1, 1), (9, 1), (16, 1)]
]

/-- Partial product 13 for generator 15. -/
def rs_R009_ueqv_R009YYYNN_partial_15_0013 : Poly :=
[
  term ((-67598721 : Rat) / 21337981) [(1, 1), (4, 1), (8, 1), (9, 1), (16, 1)],
  term ((-67598721 : Rat) / 21337981) [(1, 1), (5, 1), (9, 2), (16, 1)],
  term ((67598721 : Rat) / 42675962) [(1, 1), (8, 2), (9, 1), (16, 1)],
  term ((67598721 : Rat) / 42675962) [(1, 1), (9, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 15. -/
theorem rs_R009_ueqv_R009YYYNN_partial_15_0013_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_15_0013
        rs_R009_ueqv_R009YYYNN_generator_15_0000_0053 =
      rs_R009_ueqv_R009YYYNN_partial_15_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009YYYNN_coefficient_15_0014 : Poly :=
[
  term ((-135197442 : Rat) / 21337981) [(1, 1), (13, 1)]
]

/-- Partial product 14 for generator 15. -/
def rs_R009_ueqv_R009YYYNN_partial_15_0014 : Poly :=
[
  term ((-270394884 : Rat) / 21337981) [(1, 1), (4, 1), (8, 1), (13, 1)],
  term ((-270394884 : Rat) / 21337981) [(1, 1), (5, 1), (9, 1), (13, 1)],
  term ((135197442 : Rat) / 21337981) [(1, 1), (8, 2), (13, 1)],
  term ((135197442 : Rat) / 21337981) [(1, 1), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 15. -/
theorem rs_R009_ueqv_R009YYYNN_partial_15_0014_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_15_0014
        rs_R009_ueqv_R009YYYNN_generator_15_0000_0053 =
      rs_R009_ueqv_R009YYYNN_partial_15_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009YYYNN_coefficient_15_0015 : Poly :=
[
  term ((67598721 : Rat) / 42675962) [(1, 1), (13, 1), (16, 1)]
]

/-- Partial product 15 for generator 15. -/
def rs_R009_ueqv_R009YYYNN_partial_15_0015 : Poly :=
[
  term ((67598721 : Rat) / 21337981) [(1, 1), (4, 1), (8, 1), (13, 1), (16, 1)],
  term ((67598721 : Rat) / 21337981) [(1, 1), (5, 1), (9, 1), (13, 1), (16, 1)],
  term ((-67598721 : Rat) / 42675962) [(1, 1), (8, 2), (13, 1), (16, 1)],
  term ((-67598721 : Rat) / 42675962) [(1, 1), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 15. -/
theorem rs_R009_ueqv_R009YYYNN_partial_15_0015_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_15_0015
        rs_R009_ueqv_R009YYYNN_generator_15_0000_0053 =
      rs_R009_ueqv_R009YYYNN_partial_15_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009YYYNN_coefficient_15_0016 : Poly :=
[
  term ((-1891080432 : Rat) / 21337981) [(2, 1), (3, 1), (9, 1)]
]

/-- Partial product 16 for generator 15. -/
def rs_R009_ueqv_R009YYYNN_partial_15_0016 : Poly :=
[
  term ((-3782160864 : Rat) / 21337981) [(2, 1), (3, 1), (4, 1), (8, 1), (9, 1)],
  term ((-3782160864 : Rat) / 21337981) [(2, 1), (3, 1), (5, 1), (9, 2)],
  term ((1891080432 : Rat) / 21337981) [(2, 1), (3, 1), (8, 2), (9, 1)],
  term ((1891080432 : Rat) / 21337981) [(2, 1), (3, 1), (9, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 15. -/
theorem rs_R009_ueqv_R009YYYNN_partial_15_0016_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_15_0016
        rs_R009_ueqv_R009YYYNN_generator_15_0000_0053 =
      rs_R009_ueqv_R009YYYNN_partial_15_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009YYYNN_coefficient_15_0017 : Poly :=
[
  term ((3600183024 : Rat) / 21337981) [(2, 1), (3, 1), (9, 1), (15, 2)]
]

/-- Partial product 17 for generator 15. -/
def rs_R009_ueqv_R009YYYNN_partial_15_0017 : Poly :=
[
  term ((7200366048 : Rat) / 21337981) [(2, 1), (3, 1), (4, 1), (8, 1), (9, 1), (15, 2)],
  term ((7200366048 : Rat) / 21337981) [(2, 1), (3, 1), (5, 1), (9, 2), (15, 2)],
  term ((-3600183024 : Rat) / 21337981) [(2, 1), (3, 1), (8, 2), (9, 1), (15, 2)],
  term ((-3600183024 : Rat) / 21337981) [(2, 1), (3, 1), (9, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 15. -/
theorem rs_R009_ueqv_R009YYYNN_partial_15_0017_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_15_0017
        rs_R009_ueqv_R009YYYNN_generator_15_0000_0053 =
      rs_R009_ueqv_R009YYYNN_partial_15_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009YYYNN_coefficient_15_0018 : Poly :=
[
  term ((1982069352 : Rat) / 21337981) [(2, 1), (3, 1), (13, 1)]
]

/-- Partial product 18 for generator 15. -/
def rs_R009_ueqv_R009YYYNN_partial_15_0018 : Poly :=
[
  term ((3964138704 : Rat) / 21337981) [(2, 1), (3, 1), (4, 1), (8, 1), (13, 1)],
  term ((3964138704 : Rat) / 21337981) [(2, 1), (3, 1), (5, 1), (9, 1), (13, 1)],
  term ((-1982069352 : Rat) / 21337981) [(2, 1), (3, 1), (8, 2), (13, 1)],
  term ((-1982069352 : Rat) / 21337981) [(2, 1), (3, 1), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 15. -/
theorem rs_R009_ueqv_R009YYYNN_partial_15_0018_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_15_0018
        rs_R009_ueqv_R009YYYNN_generator_15_0000_0053 =
      rs_R009_ueqv_R009YYYNN_partial_15_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009YYYNN_coefficient_15_0019 : Poly :=
[
  term ((-7200366048 : Rat) / 21337981) [(2, 1), (3, 1), (13, 1), (15, 2)]
]

/-- Partial product 19 for generator 15. -/
def rs_R009_ueqv_R009YYYNN_partial_15_0019 : Poly :=
[
  term ((-14400732096 : Rat) / 21337981) [(2, 1), (3, 1), (4, 1), (8, 1), (13, 1), (15, 2)],
  term ((-14400732096 : Rat) / 21337981) [(2, 1), (3, 1), (5, 1), (9, 1), (13, 1), (15, 2)],
  term ((7200366048 : Rat) / 21337981) [(2, 1), (3, 1), (8, 2), (13, 1), (15, 2)],
  term ((7200366048 : Rat) / 21337981) [(2, 1), (3, 1), (9, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 15. -/
theorem rs_R009_ueqv_R009YYYNN_partial_15_0019_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_15_0019
        rs_R009_ueqv_R009YYYNN_generator_15_0000_0053 =
      rs_R009_ueqv_R009YYYNN_partial_15_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009YYYNN_coefficient_15_0020 : Poly :=
[
  term ((1403088210 : Rat) / 21337981) [(2, 1), (9, 1), (15, 1)]
]

/-- Partial product 20 for generator 15. -/
def rs_R009_ueqv_R009YYYNN_partial_15_0020 : Poly :=
[
  term ((2806176420 : Rat) / 21337981) [(2, 1), (4, 1), (8, 1), (9, 1), (15, 1)],
  term ((2806176420 : Rat) / 21337981) [(2, 1), (5, 1), (9, 2), (15, 1)],
  term ((-1403088210 : Rat) / 21337981) [(2, 1), (8, 2), (9, 1), (15, 1)],
  term ((-1403088210 : Rat) / 21337981) [(2, 1), (9, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 15. -/
theorem rs_R009_ueqv_R009YYYNN_partial_15_0020_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_15_0020
        rs_R009_ueqv_R009YYYNN_generator_15_0000_0053 =
      rs_R009_ueqv_R009YYYNN_partial_15_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009YYYNN_coefficient_15_0021 : Poly :=
[
  term ((-81891549 : Rat) / 21337981) [(2, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 21 for generator 15. -/
def rs_R009_ueqv_R009YYYNN_partial_15_0021 : Poly :=
[
  term ((-163783098 : Rat) / 21337981) [(2, 1), (4, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-163783098 : Rat) / 21337981) [(2, 1), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((81891549 : Rat) / 21337981) [(2, 1), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((81891549 : Rat) / 21337981) [(2, 1), (9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 15. -/
theorem rs_R009_ueqv_R009YYYNN_partial_15_0021_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_15_0021
        rs_R009_ueqv_R009YYYNN_generator_15_0000_0053 =
      rs_R009_ueqv_R009YYYNN_partial_15_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009YYYNN_coefficient_15_0022 : Poly :=
[
  term ((-2478610224 : Rat) / 21337981) [(2, 1), (9, 1), (15, 3)]
]

/-- Partial product 22 for generator 15. -/
def rs_R009_ueqv_R009YYYNN_partial_15_0022 : Poly :=
[
  term ((-4957220448 : Rat) / 21337981) [(2, 1), (4, 1), (8, 1), (9, 1), (15, 3)],
  term ((-4957220448 : Rat) / 21337981) [(2, 1), (5, 1), (9, 2), (15, 3)],
  term ((2478610224 : Rat) / 21337981) [(2, 1), (8, 2), (9, 1), (15, 3)],
  term ((2478610224 : Rat) / 21337981) [(2, 1), (9, 3), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 15. -/
theorem rs_R009_ueqv_R009YYYNN_partial_15_0022_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_15_0022
        rs_R009_ueqv_R009YYYNN_generator_15_0000_0053 =
      rs_R009_ueqv_R009YYYNN_partial_15_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009YYYNN_coefficient_15_0023 : Poly :=
[
  term ((-1566871308 : Rat) / 21337981) [(2, 1), (13, 1), (15, 1)]
]

/-- Partial product 23 for generator 15. -/
def rs_R009_ueqv_R009YYYNN_partial_15_0023 : Poly :=
[
  term ((-3133742616 : Rat) / 21337981) [(2, 1), (4, 1), (8, 1), (13, 1), (15, 1)],
  term ((-3133742616 : Rat) / 21337981) [(2, 1), (5, 1), (9, 1), (13, 1), (15, 1)],
  term ((1566871308 : Rat) / 21337981) [(2, 1), (8, 2), (13, 1), (15, 1)],
  term ((1566871308 : Rat) / 21337981) [(2, 1), (9, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 15. -/
theorem rs_R009_ueqv_R009YYYNN_partial_15_0023_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_15_0023
        rs_R009_ueqv_R009YYYNN_generator_15_0000_0053 =
      rs_R009_ueqv_R009YYYNN_partial_15_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009YYYNN_coefficient_15_0024 : Poly :=
[
  term ((81891549 : Rat) / 21337981) [(2, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 24 for generator 15. -/
def rs_R009_ueqv_R009YYYNN_partial_15_0024 : Poly :=
[
  term ((163783098 : Rat) / 21337981) [(2, 1), (4, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((163783098 : Rat) / 21337981) [(2, 1), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-81891549 : Rat) / 21337981) [(2, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-81891549 : Rat) / 21337981) [(2, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 15. -/
theorem rs_R009_ueqv_R009YYYNN_partial_15_0024_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_15_0024
        rs_R009_ueqv_R009YYYNN_generator_15_0000_0053 =
      rs_R009_ueqv_R009YYYNN_partial_15_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009YYYNN_coefficient_15_0025 : Poly :=
[
  term ((4957220448 : Rat) / 21337981) [(2, 1), (13, 1), (15, 3)]
]

/-- Partial product 25 for generator 15. -/
def rs_R009_ueqv_R009YYYNN_partial_15_0025 : Poly :=
[
  term ((9914440896 : Rat) / 21337981) [(2, 1), (4, 1), (8, 1), (13, 1), (15, 3)],
  term ((9914440896 : Rat) / 21337981) [(2, 1), (5, 1), (9, 1), (13, 1), (15, 3)],
  term ((-4957220448 : Rat) / 21337981) [(2, 1), (8, 2), (13, 1), (15, 3)],
  term ((-4957220448 : Rat) / 21337981) [(2, 1), (9, 2), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 15. -/
theorem rs_R009_ueqv_R009YYYNN_partial_15_0025_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_15_0025
        rs_R009_ueqv_R009YYYNN_generator_15_0000_0053 =
      rs_R009_ueqv_R009YYYNN_partial_15_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009YYYNN_coefficient_15_0026 : Poly :=
[
  term ((1281545910 : Rat) / 21337981) [(3, 1), (9, 1)]
]

/-- Partial product 26 for generator 15. -/
def rs_R009_ueqv_R009YYYNN_partial_15_0026 : Poly :=
[
  term ((2563091820 : Rat) / 21337981) [(3, 1), (4, 1), (8, 1), (9, 1)],
  term ((2563091820 : Rat) / 21337981) [(3, 1), (5, 1), (9, 2)],
  term ((-1281545910 : Rat) / 21337981) [(3, 1), (8, 2), (9, 1)],
  term ((-1281545910 : Rat) / 21337981) [(3, 1), (9, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 15. -/
theorem rs_R009_ueqv_R009YYYNN_partial_15_0026_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_15_0026
        rs_R009_ueqv_R009YYYNN_generator_15_0000_0053 =
      rs_R009_ueqv_R009YYYNN_partial_15_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009YYYNN_coefficient_15_0027 : Poly :=
[
  term ((60619536 : Rat) / 21337981) [(3, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 27 for generator 15. -/
def rs_R009_ueqv_R009YYYNN_partial_15_0027 : Poly :=
[
  term ((121239072 : Rat) / 21337981) [(3, 1), (4, 1), (8, 1), (9, 1), (13, 1), (15, 1)],
  term ((121239072 : Rat) / 21337981) [(3, 1), (5, 1), (9, 2), (13, 1), (15, 1)],
  term ((-60619536 : Rat) / 21337981) [(3, 1), (8, 2), (9, 1), (13, 1), (15, 1)],
  term ((-60619536 : Rat) / 21337981) [(3, 1), (9, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 15. -/
theorem rs_R009_ueqv_R009YYYNN_partial_15_0027_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_15_0027
        rs_R009_ueqv_R009YYYNN_generator_15_0000_0053 =
      rs_R009_ueqv_R009YYYNN_partial_15_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009YYYNN_coefficient_15_0028 : Poly :=
[
  term ((31649382 : Rat) / 3048283) [(3, 1), (9, 1), (14, 1)]
]

/-- Partial product 28 for generator 15. -/
def rs_R009_ueqv_R009YYYNN_partial_15_0028 : Poly :=
[
  term ((63298764 : Rat) / 3048283) [(3, 1), (4, 1), (8, 1), (9, 1), (14, 1)],
  term ((63298764 : Rat) / 3048283) [(3, 1), (5, 1), (9, 2), (14, 1)],
  term ((-31649382 : Rat) / 3048283) [(3, 1), (8, 2), (9, 1), (14, 1)],
  term ((-31649382 : Rat) / 3048283) [(3, 1), (9, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 15. -/
theorem rs_R009_ueqv_R009YYYNN_partial_15_0028_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_15_0028
        rs_R009_ueqv_R009YYYNN_generator_15_0000_0053 =
      rs_R009_ueqv_R009YYYNN_partial_15_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009YYYNN_coefficient_15_0029 : Poly :=
[
  term ((81891549 : Rat) / 21337981) [(3, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 29 for generator 15. -/
def rs_R009_ueqv_R009YYYNN_partial_15_0029 : Poly :=
[
  term ((163783098 : Rat) / 21337981) [(3, 1), (4, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((163783098 : Rat) / 21337981) [(3, 1), (5, 1), (9, 2), (14, 1), (16, 1)],
  term ((-81891549 : Rat) / 21337981) [(3, 1), (8, 2), (9, 1), (14, 1), (16, 1)],
  term ((-81891549 : Rat) / 21337981) [(3, 1), (9, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 15. -/
theorem rs_R009_ueqv_R009YYYNN_partial_15_0029_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_15_0029
        rs_R009_ueqv_R009YYYNN_generator_15_0000_0053 =
      rs_R009_ueqv_R009YYYNN_partial_15_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009YYYNN_coefficient_15_0030 : Poly :=
[
  term ((-2725286976 : Rat) / 21337981) [(3, 1), (9, 1), (15, 2)]
]

/-- Partial product 30 for generator 15. -/
def rs_R009_ueqv_R009YYYNN_partial_15_0030 : Poly :=
[
  term ((-5450573952 : Rat) / 21337981) [(3, 1), (4, 1), (8, 1), (9, 1), (15, 2)],
  term ((-5450573952 : Rat) / 21337981) [(3, 1), (5, 1), (9, 2), (15, 2)],
  term ((2725286976 : Rat) / 21337981) [(3, 1), (8, 2), (9, 1), (15, 2)],
  term ((2725286976 : Rat) / 21337981) [(3, 1), (9, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 15. -/
theorem rs_R009_ueqv_R009YYYNN_partial_15_0030_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_15_0030
        rs_R009_ueqv_R009YYYNN_generator_15_0000_0053 =
      rs_R009_ueqv_R009YYYNN_partial_15_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009YYYNN_coefficient_15_0031 : Poly :=
[
  term ((-105281748 : Rat) / 21337981) [(3, 1), (9, 1), (16, 1)]
]

/-- Partial product 31 for generator 15. -/
def rs_R009_ueqv_R009YYYNN_partial_15_0031 : Poly :=
[
  term ((-210563496 : Rat) / 21337981) [(3, 1), (4, 1), (8, 1), (9, 1), (16, 1)],
  term ((-210563496 : Rat) / 21337981) [(3, 1), (5, 1), (9, 2), (16, 1)],
  term ((105281748 : Rat) / 21337981) [(3, 1), (8, 2), (9, 1), (16, 1)],
  term ((105281748 : Rat) / 21337981) [(3, 1), (9, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 15. -/
theorem rs_R009_ueqv_R009YYYNN_partial_15_0031_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_15_0031
        rs_R009_ueqv_R009YYYNN_generator_15_0000_0053 =
      rs_R009_ueqv_R009YYYNN_partial_15_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009YYYNN_coefficient_15_0032 : Poly :=
[
  term ((-1663046064 : Rat) / 21337981) [(3, 1), (13, 1)]
]

/-- Partial product 32 for generator 15. -/
def rs_R009_ueqv_R009YYYNN_partial_15_0032 : Poly :=
[
  term ((-3326092128 : Rat) / 21337981) [(3, 1), (4, 1), (8, 1), (13, 1)],
  term ((-3326092128 : Rat) / 21337981) [(3, 1), (5, 1), (9, 1), (13, 1)],
  term ((1663046064 : Rat) / 21337981) [(3, 1), (8, 2), (13, 1)],
  term ((1663046064 : Rat) / 21337981) [(3, 1), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 15. -/
theorem rs_R009_ueqv_R009YYYNN_partial_15_0032_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_15_0032
        rs_R009_ueqv_R009YYYNN_generator_15_0000_0053 =
      rs_R009_ueqv_R009YYYNN_partial_15_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009YYYNN_coefficient_15_0033 : Poly :=
[
  term ((456954408 : Rat) / 21337981) [(3, 1), (13, 1), (14, 1)]
]

/-- Partial product 33 for generator 15. -/
def rs_R009_ueqv_R009YYYNN_partial_15_0033 : Poly :=
[
  term ((913908816 : Rat) / 21337981) [(3, 1), (4, 1), (8, 1), (13, 1), (14, 1)],
  term ((913908816 : Rat) / 21337981) [(3, 1), (5, 1), (9, 1), (13, 1), (14, 1)],
  term ((-456954408 : Rat) / 21337981) [(3, 1), (8, 2), (13, 1), (14, 1)],
  term ((-456954408 : Rat) / 21337981) [(3, 1), (9, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 15. -/
theorem rs_R009_ueqv_R009YYYNN_partial_15_0033_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_15_0033
        rs_R009_ueqv_R009YYYNN_generator_15_0000_0053 =
      rs_R009_ueqv_R009YYYNN_partial_15_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009YYYNN_coefficient_15_0034 : Poly :=
[
  term ((-81891549 : Rat) / 21337981) [(3, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 34 for generator 15. -/
def rs_R009_ueqv_R009YYYNN_partial_15_0034 : Poly :=
[
  term ((-163783098 : Rat) / 21337981) [(3, 1), (4, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-163783098 : Rat) / 21337981) [(3, 1), (5, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((81891549 : Rat) / 21337981) [(3, 1), (8, 2), (13, 1), (14, 1), (16, 1)],
  term ((81891549 : Rat) / 21337981) [(3, 1), (9, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 15. -/
theorem rs_R009_ueqv_R009YYYNN_partial_15_0034_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_15_0034
        rs_R009_ueqv_R009YYYNN_generator_15_0000_0053 =
      rs_R009_ueqv_R009YYYNN_partial_15_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009YYYNN_coefficient_15_0035 : Poly :=
[
  term ((5450573952 : Rat) / 21337981) [(3, 1), (13, 1), (15, 2)]
]

/-- Partial product 35 for generator 15. -/
def rs_R009_ueqv_R009YYYNN_partial_15_0035 : Poly :=
[
  term ((10901147904 : Rat) / 21337981) [(3, 1), (4, 1), (8, 1), (13, 1), (15, 2)],
  term ((10901147904 : Rat) / 21337981) [(3, 1), (5, 1), (9, 1), (13, 1), (15, 2)],
  term ((-5450573952 : Rat) / 21337981) [(3, 1), (8, 2), (13, 1), (15, 2)],
  term ((-5450573952 : Rat) / 21337981) [(3, 1), (9, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 15. -/
theorem rs_R009_ueqv_R009YYYNN_partial_15_0035_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_15_0035
        rs_R009_ueqv_R009YYYNN_generator_15_0000_0053 =
      rs_R009_ueqv_R009YYYNN_partial_15_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009YYYNN_coefficient_15_0036 : Poly :=
[
  term ((105281748 : Rat) / 21337981) [(3, 1), (13, 1), (16, 1)]
]

/-- Partial product 36 for generator 15. -/
def rs_R009_ueqv_R009YYYNN_partial_15_0036 : Poly :=
[
  term ((210563496 : Rat) / 21337981) [(3, 1), (4, 1), (8, 1), (13, 1), (16, 1)],
  term ((210563496 : Rat) / 21337981) [(3, 1), (5, 1), (9, 1), (13, 1), (16, 1)],
  term ((-105281748 : Rat) / 21337981) [(3, 1), (8, 2), (13, 1), (16, 1)],
  term ((-105281748 : Rat) / 21337981) [(3, 1), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 15. -/
theorem rs_R009_ueqv_R009YYYNN_partial_15_0036_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_15_0036
        rs_R009_ueqv_R009YYYNN_generator_15_0000_0053 =
      rs_R009_ueqv_R009YYYNN_partial_15_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009YYYNN_coefficient_15_0037 : Poly :=
[
  term ((-121239072 : Rat) / 21337981) [(3, 1), (13, 2), (15, 1)]
]

/-- Partial product 37 for generator 15. -/
def rs_R009_ueqv_R009YYYNN_partial_15_0037 : Poly :=
[
  term ((-242478144 : Rat) / 21337981) [(3, 1), (4, 1), (8, 1), (13, 2), (15, 1)],
  term ((-242478144 : Rat) / 21337981) [(3, 1), (5, 1), (9, 1), (13, 2), (15, 1)],
  term ((121239072 : Rat) / 21337981) [(3, 1), (8, 2), (13, 2), (15, 1)],
  term ((121239072 : Rat) / 21337981) [(3, 1), (9, 2), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 15. -/
theorem rs_R009_ueqv_R009YYYNN_partial_15_0037_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_15_0037
        rs_R009_ueqv_R009YYYNN_generator_15_0000_0053 =
      rs_R009_ueqv_R009YYYNN_partial_15_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009YYYNN_coefficient_15_0038 : Poly :=
[
  term ((-30329640 : Rat) / 21337981) [(3, 2), (9, 1), (13, 1)]
]

/-- Partial product 38 for generator 15. -/
def rs_R009_ueqv_R009YYYNN_partial_15_0038 : Poly :=
[
  term ((-60659280 : Rat) / 21337981) [(3, 2), (4, 1), (8, 1), (9, 1), (13, 1)],
  term ((-60659280 : Rat) / 21337981) [(3, 2), (5, 1), (9, 2), (13, 1)],
  term ((30329640 : Rat) / 21337981) [(3, 2), (8, 2), (9, 1), (13, 1)],
  term ((30329640 : Rat) / 21337981) [(3, 2), (9, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 15. -/
theorem rs_R009_ueqv_R009YYYNN_partial_15_0038_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_15_0038
        rs_R009_ueqv_R009YYYNN_generator_15_0000_0053 =
      rs_R009_ueqv_R009YYYNN_partial_15_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009YYYNN_coefficient_15_0039 : Poly :=
[
  term ((-1466465472 : Rat) / 21337981) [(3, 2), (9, 1), (15, 1)]
]

/-- Partial product 39 for generator 15. -/
def rs_R009_ueqv_R009YYYNN_partial_15_0039 : Poly :=
[
  term ((-2932930944 : Rat) / 21337981) [(3, 2), (4, 1), (8, 1), (9, 1), (15, 1)],
  term ((-2932930944 : Rat) / 21337981) [(3, 2), (5, 1), (9, 2), (15, 1)],
  term ((1466465472 : Rat) / 21337981) [(3, 2), (8, 2), (9, 1), (15, 1)],
  term ((1466465472 : Rat) / 21337981) [(3, 2), (9, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 15. -/
theorem rs_R009_ueqv_R009YYYNN_partial_15_0039_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_15_0039
        rs_R009_ueqv_R009YYYNN_generator_15_0000_0053 =
      rs_R009_ueqv_R009YYYNN_partial_15_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009YYYNN_coefficient_15_0040 : Poly :=
[
  term ((2932930944 : Rat) / 21337981) [(3, 2), (13, 1), (15, 1)]
]

/-- Partial product 40 for generator 15. -/
def rs_R009_ueqv_R009YYYNN_partial_15_0040 : Poly :=
[
  term ((5865861888 : Rat) / 21337981) [(3, 2), (4, 1), (8, 1), (13, 1), (15, 1)],
  term ((5865861888 : Rat) / 21337981) [(3, 2), (5, 1), (9, 1), (13, 1), (15, 1)],
  term ((-2932930944 : Rat) / 21337981) [(3, 2), (8, 2), (13, 1), (15, 1)],
  term ((-2932930944 : Rat) / 21337981) [(3, 2), (9, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 15. -/
theorem rs_R009_ueqv_R009YYYNN_partial_15_0040_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_15_0040
        rs_R009_ueqv_R009YYYNN_generator_15_0000_0053 =
      rs_R009_ueqv_R009YYYNN_partial_15_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009YYYNN_coefficient_15_0041 : Poly :=
[
  term ((60659280 : Rat) / 21337981) [(3, 2), (13, 2)]
]

/-- Partial product 41 for generator 15. -/
def rs_R009_ueqv_R009YYYNN_partial_15_0041 : Poly :=
[
  term ((121318560 : Rat) / 21337981) [(3, 2), (4, 1), (8, 1), (13, 2)],
  term ((121318560 : Rat) / 21337981) [(3, 2), (5, 1), (9, 1), (13, 2)],
  term ((-60659280 : Rat) / 21337981) [(3, 2), (8, 2), (13, 2)],
  term ((-60659280 : Rat) / 21337981) [(3, 2), (9, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 15. -/
theorem rs_R009_ueqv_R009YYYNN_partial_15_0041_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_15_0041
        rs_R009_ueqv_R009YYYNN_generator_15_0000_0053 =
      rs_R009_ueqv_R009YYYNN_partial_15_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009YYYNN_coefficient_15_0042 : Poly :=
[
  term ((17753203 : Rat) / 21337981) [(9, 1), (13, 1)]
]

/-- Partial product 42 for generator 15. -/
def rs_R009_ueqv_R009YYYNN_partial_15_0042 : Poly :=
[
  term ((35506406 : Rat) / 21337981) [(4, 1), (8, 1), (9, 1), (13, 1)],
  term ((35506406 : Rat) / 21337981) [(5, 1), (9, 2), (13, 1)],
  term ((-17753203 : Rat) / 21337981) [(8, 2), (9, 1), (13, 1)],
  term ((-17753203 : Rat) / 21337981) [(9, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 15. -/
theorem rs_R009_ueqv_R009YYYNN_partial_15_0042_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_15_0042
        rs_R009_ueqv_R009YYYNN_generator_15_0000_0053 =
      rs_R009_ueqv_R009YYYNN_partial_15_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009YYYNN_coefficient_15_0043 : Poly :=
[
  term ((-17753203 : Rat) / 42675962) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 43 for generator 15. -/
def rs_R009_ueqv_R009YYYNN_partial_15_0043 : Poly :=
[
  term ((-17753203 : Rat) / 21337981) [(4, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-17753203 : Rat) / 21337981) [(5, 1), (9, 2), (13, 1), (16, 1)],
  term ((17753203 : Rat) / 42675962) [(8, 2), (9, 1), (13, 1), (16, 1)],
  term ((17753203 : Rat) / 42675962) [(9, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 15. -/
theorem rs_R009_ueqv_R009YYYNN_partial_15_0043_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_15_0043
        rs_R009_ueqv_R009YYYNN_generator_15_0000_0053 =
      rs_R009_ueqv_R009YYYNN_partial_15_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009YYYNN_coefficient_15_0044 : Poly :=
[
  term ((-619652556 : Rat) / 21337981) [(9, 1), (14, 1), (15, 1)]
]

/-- Partial product 44 for generator 15. -/
def rs_R009_ueqv_R009YYYNN_partial_15_0044 : Poly :=
[
  term ((-1239305112 : Rat) / 21337981) [(4, 1), (8, 1), (9, 1), (14, 1), (15, 1)],
  term ((-1239305112 : Rat) / 21337981) [(5, 1), (9, 2), (14, 1), (15, 1)],
  term ((619652556 : Rat) / 21337981) [(8, 2), (9, 1), (14, 1), (15, 1)],
  term ((619652556 : Rat) / 21337981) [(9, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 15. -/
theorem rs_R009_ueqv_R009YYYNN_partial_15_0044_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_15_0044
        rs_R009_ueqv_R009YYYNN_generator_15_0000_0053 =
      rs_R009_ueqv_R009YYYNN_partial_15_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009YYYNN_coefficient_15_0045 : Poly :=
[
  term ((-15563619 : Rat) / 435469) [(9, 1), (15, 1)]
]

/-- Partial product 45 for generator 15. -/
def rs_R009_ueqv_R009YYYNN_partial_15_0045 : Poly :=
[
  term ((-31127238 : Rat) / 435469) [(4, 1), (8, 1), (9, 1), (15, 1)],
  term ((-31127238 : Rat) / 435469) [(5, 1), (9, 2), (15, 1)],
  term ((15563619 : Rat) / 435469) [(8, 2), (9, 1), (15, 1)],
  term ((15563619 : Rat) / 435469) [(9, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 15. -/
theorem rs_R009_ueqv_R009YYYNN_partial_15_0045_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_15_0045
        rs_R009_ueqv_R009YYYNN_generator_15_0000_0053 =
      rs_R009_ueqv_R009YYYNN_partial_15_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009YYYNN_coefficient_15_0046 : Poly :=
[
  term ((142964775 : Rat) / 42675962) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 46 for generator 15. -/
def rs_R009_ueqv_R009YYYNN_partial_15_0046 : Poly :=
[
  term ((142964775 : Rat) / 21337981) [(4, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((142964775 : Rat) / 21337981) [(5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-142964775 : Rat) / 42675962) [(8, 2), (9, 1), (15, 1), (16, 1)],
  term ((-142964775 : Rat) / 42675962) [(9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 15. -/
theorem rs_R009_ueqv_R009YYYNN_partial_15_0046_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_15_0046
        rs_R009_ueqv_R009YYYNN_generator_15_0000_0053 =
      rs_R009_ueqv_R009YYYNN_partial_15_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009YYYNN_coefficient_15_0047 : Poly :=
[
  term ((2478610224 : Rat) / 21337981) [(9, 1), (15, 3)]
]

/-- Partial product 47 for generator 15. -/
def rs_R009_ueqv_R009YYYNN_partial_15_0047 : Poly :=
[
  term ((4957220448 : Rat) / 21337981) [(4, 1), (8, 1), (9, 1), (15, 3)],
  term ((4957220448 : Rat) / 21337981) [(5, 1), (9, 2), (15, 3)],
  term ((-2478610224 : Rat) / 21337981) [(8, 2), (9, 1), (15, 3)],
  term ((-2478610224 : Rat) / 21337981) [(9, 3), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 15. -/
theorem rs_R009_ueqv_R009YYYNN_partial_15_0047_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_15_0047
        rs_R009_ueqv_R009YYYNN_generator_15_0000_0053 =
      rs_R009_ueqv_R009YYYNN_partial_15_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009YYYNN_coefficient_15_0048 : Poly :=
[
  term ((619652556 : Rat) / 21337981) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 48 for generator 15. -/
def rs_R009_ueqv_R009YYYNN_partial_15_0048 : Poly :=
[
  term ((1239305112 : Rat) / 21337981) [(4, 1), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((1239305112 : Rat) / 21337981) [(5, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((-619652556 : Rat) / 21337981) [(8, 2), (13, 1), (14, 1), (15, 1)],
  term ((-619652556 : Rat) / 21337981) [(9, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 15. -/
theorem rs_R009_ueqv_R009YYYNN_partial_15_0048_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_15_0048
        rs_R009_ueqv_R009YYYNN_generator_15_0000_0053 =
      rs_R009_ueqv_R009YYYNN_partial_15_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009YYYNN_coefficient_15_0049 : Poly :=
[
  term ((905582106 : Rat) / 21337981) [(13, 1), (15, 1)]
]

/-- Partial product 49 for generator 15. -/
def rs_R009_ueqv_R009YYYNN_partial_15_0049 : Poly :=
[
  term ((1811164212 : Rat) / 21337981) [(4, 1), (8, 1), (13, 1), (15, 1)],
  term ((1811164212 : Rat) / 21337981) [(5, 1), (9, 1), (13, 1), (15, 1)],
  term ((-905582106 : Rat) / 21337981) [(8, 2), (13, 1), (15, 1)],
  term ((-905582106 : Rat) / 21337981) [(9, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 15. -/
theorem rs_R009_ueqv_R009YYYNN_partial_15_0049_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_15_0049
        rs_R009_ueqv_R009YYYNN_generator_15_0000_0053 =
      rs_R009_ueqv_R009YYYNN_partial_15_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009YYYNN_coefficient_15_0050 : Poly :=
[
  term ((-142964775 : Rat) / 42675962) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 50 for generator 15. -/
def rs_R009_ueqv_R009YYYNN_partial_15_0050 : Poly :=
[
  term ((-142964775 : Rat) / 21337981) [(4, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-142964775 : Rat) / 21337981) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((142964775 : Rat) / 42675962) [(8, 2), (13, 1), (15, 1), (16, 1)],
  term ((142964775 : Rat) / 42675962) [(9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 15. -/
theorem rs_R009_ueqv_R009YYYNN_partial_15_0050_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_15_0050
        rs_R009_ueqv_R009YYYNN_generator_15_0000_0053 =
      rs_R009_ueqv_R009YYYNN_partial_15_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009YYYNN_coefficient_15_0051 : Poly :=
[
  term ((-4957220448 : Rat) / 21337981) [(13, 1), (15, 3)]
]

/-- Partial product 51 for generator 15. -/
def rs_R009_ueqv_R009YYYNN_partial_15_0051 : Poly :=
[
  term ((-9914440896 : Rat) / 21337981) [(4, 1), (8, 1), (13, 1), (15, 3)],
  term ((-9914440896 : Rat) / 21337981) [(5, 1), (9, 1), (13, 1), (15, 3)],
  term ((4957220448 : Rat) / 21337981) [(8, 2), (13, 1), (15, 3)],
  term ((4957220448 : Rat) / 21337981) [(9, 2), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 15. -/
theorem rs_R009_ueqv_R009YYYNN_partial_15_0051_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_15_0051
        rs_R009_ueqv_R009YYYNN_generator_15_0000_0053 =
      rs_R009_ueqv_R009YYYNN_partial_15_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009YYYNN_coefficient_15_0052 : Poly :=
[
  term ((-35506406 : Rat) / 21337981) [(13, 2)]
]

/-- Partial product 52 for generator 15. -/
def rs_R009_ueqv_R009YYYNN_partial_15_0052 : Poly :=
[
  term ((-71012812 : Rat) / 21337981) [(4, 1), (8, 1), (13, 2)],
  term ((-71012812 : Rat) / 21337981) [(5, 1), (9, 1), (13, 2)],
  term ((35506406 : Rat) / 21337981) [(8, 2), (13, 2)],
  term ((35506406 : Rat) / 21337981) [(9, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 15. -/
theorem rs_R009_ueqv_R009YYYNN_partial_15_0052_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_15_0052
        rs_R009_ueqv_R009YYYNN_generator_15_0000_0053 =
      rs_R009_ueqv_R009YYYNN_partial_15_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009YYYNN_coefficient_15_0053 : Poly :=
[
  term ((17753203 : Rat) / 42675962) [(13, 2), (16, 1)]
]

/-- Partial product 53 for generator 15. -/
def rs_R009_ueqv_R009YYYNN_partial_15_0053 : Poly :=
[
  term ((17753203 : Rat) / 21337981) [(4, 1), (8, 1), (13, 2), (16, 1)],
  term ((17753203 : Rat) / 21337981) [(5, 1), (9, 1), (13, 2), (16, 1)],
  term ((-17753203 : Rat) / 42675962) [(8, 2), (13, 2), (16, 1)],
  term ((-17753203 : Rat) / 42675962) [(9, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 15. -/
theorem rs_R009_ueqv_R009YYYNN_partial_15_0053_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_15_0053
        rs_R009_ueqv_R009YYYNN_generator_15_0000_0053 =
      rs_R009_ueqv_R009YYYNN_partial_15_0053 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009YYYNN_partials_15_0000_0053 : List Poly :=
[
  rs_R009_ueqv_R009YYYNN_partial_15_0000,
  rs_R009_ueqv_R009YYYNN_partial_15_0001,
  rs_R009_ueqv_R009YYYNN_partial_15_0002,
  rs_R009_ueqv_R009YYYNN_partial_15_0003,
  rs_R009_ueqv_R009YYYNN_partial_15_0004,
  rs_R009_ueqv_R009YYYNN_partial_15_0005,
  rs_R009_ueqv_R009YYYNN_partial_15_0006,
  rs_R009_ueqv_R009YYYNN_partial_15_0007,
  rs_R009_ueqv_R009YYYNN_partial_15_0008,
  rs_R009_ueqv_R009YYYNN_partial_15_0009,
  rs_R009_ueqv_R009YYYNN_partial_15_0010,
  rs_R009_ueqv_R009YYYNN_partial_15_0011,
  rs_R009_ueqv_R009YYYNN_partial_15_0012,
  rs_R009_ueqv_R009YYYNN_partial_15_0013,
  rs_R009_ueqv_R009YYYNN_partial_15_0014,
  rs_R009_ueqv_R009YYYNN_partial_15_0015,
  rs_R009_ueqv_R009YYYNN_partial_15_0016,
  rs_R009_ueqv_R009YYYNN_partial_15_0017,
  rs_R009_ueqv_R009YYYNN_partial_15_0018,
  rs_R009_ueqv_R009YYYNN_partial_15_0019,
  rs_R009_ueqv_R009YYYNN_partial_15_0020,
  rs_R009_ueqv_R009YYYNN_partial_15_0021,
  rs_R009_ueqv_R009YYYNN_partial_15_0022,
  rs_R009_ueqv_R009YYYNN_partial_15_0023,
  rs_R009_ueqv_R009YYYNN_partial_15_0024,
  rs_R009_ueqv_R009YYYNN_partial_15_0025,
  rs_R009_ueqv_R009YYYNN_partial_15_0026,
  rs_R009_ueqv_R009YYYNN_partial_15_0027,
  rs_R009_ueqv_R009YYYNN_partial_15_0028,
  rs_R009_ueqv_R009YYYNN_partial_15_0029,
  rs_R009_ueqv_R009YYYNN_partial_15_0030,
  rs_R009_ueqv_R009YYYNN_partial_15_0031,
  rs_R009_ueqv_R009YYYNN_partial_15_0032,
  rs_R009_ueqv_R009YYYNN_partial_15_0033,
  rs_R009_ueqv_R009YYYNN_partial_15_0034,
  rs_R009_ueqv_R009YYYNN_partial_15_0035,
  rs_R009_ueqv_R009YYYNN_partial_15_0036,
  rs_R009_ueqv_R009YYYNN_partial_15_0037,
  rs_R009_ueqv_R009YYYNN_partial_15_0038,
  rs_R009_ueqv_R009YYYNN_partial_15_0039,
  rs_R009_ueqv_R009YYYNN_partial_15_0040,
  rs_R009_ueqv_R009YYYNN_partial_15_0041,
  rs_R009_ueqv_R009YYYNN_partial_15_0042,
  rs_R009_ueqv_R009YYYNN_partial_15_0043,
  rs_R009_ueqv_R009YYYNN_partial_15_0044,
  rs_R009_ueqv_R009YYYNN_partial_15_0045,
  rs_R009_ueqv_R009YYYNN_partial_15_0046,
  rs_R009_ueqv_R009YYYNN_partial_15_0047,
  rs_R009_ueqv_R009YYYNN_partial_15_0048,
  rs_R009_ueqv_R009YYYNN_partial_15_0049,
  rs_R009_ueqv_R009YYYNN_partial_15_0050,
  rs_R009_ueqv_R009YYYNN_partial_15_0051,
  rs_R009_ueqv_R009YYYNN_partial_15_0052,
  rs_R009_ueqv_R009YYYNN_partial_15_0053
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009YYYNN_block_15_0000_0053 : Poly :=
[
  term ((-3818808 : Rat) / 435469) [(0, 1), (3, 1), (4, 1), (8, 1), (9, 1)],
  term ((1909404 : Rat) / 435469) [(0, 1), (3, 1), (4, 1), (8, 1), (9, 1), (16, 1)],
  term ((7637616 : Rat) / 435469) [(0, 1), (3, 1), (4, 1), (8, 1), (13, 1)],
  term ((-1909404 : Rat) / 435469) [(0, 1), (3, 1), (4, 1), (8, 1), (13, 1), (16, 1)],
  term ((7637616 : Rat) / 435469) [(0, 1), (3, 1), (5, 1), (9, 1), (13, 1)],
  term ((-1909404 : Rat) / 435469) [(0, 1), (3, 1), (5, 1), (9, 1), (13, 1), (16, 1)],
  term ((-3818808 : Rat) / 435469) [(0, 1), (3, 1), (5, 1), (9, 2)],
  term ((1909404 : Rat) / 435469) [(0, 1), (3, 1), (5, 1), (9, 2), (16, 1)],
  term ((1909404 : Rat) / 435469) [(0, 1), (3, 1), (8, 2), (9, 1)],
  term ((-954702 : Rat) / 435469) [(0, 1), (3, 1), (8, 2), (9, 1), (16, 1)],
  term ((-3818808 : Rat) / 435469) [(0, 1), (3, 1), (8, 2), (13, 1)],
  term ((954702 : Rat) / 435469) [(0, 1), (3, 1), (8, 2), (13, 1), (16, 1)],
  term ((-3818808 : Rat) / 435469) [(0, 1), (3, 1), (9, 2), (13, 1)],
  term ((954702 : Rat) / 435469) [(0, 1), (3, 1), (9, 2), (13, 1), (16, 1)],
  term ((1909404 : Rat) / 435469) [(0, 1), (3, 1), (9, 3)],
  term ((-954702 : Rat) / 435469) [(0, 1), (3, 1), (9, 3), (16, 1)],
  term ((-83273292 : Rat) / 21337981) [(0, 1), (4, 1), (8, 1), (9, 1), (15, 1)],
  term ((41636646 : Rat) / 21337981) [(0, 1), (4, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((166546584 : Rat) / 21337981) [(0, 1), (4, 1), (8, 1), (13, 1), (15, 1)],
  term ((-41636646 : Rat) / 21337981) [(0, 1), (4, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((166546584 : Rat) / 21337981) [(0, 1), (5, 1), (9, 1), (13, 1), (15, 1)],
  term ((-41636646 : Rat) / 21337981) [(0, 1), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-83273292 : Rat) / 21337981) [(0, 1), (5, 1), (9, 2), (15, 1)],
  term ((41636646 : Rat) / 21337981) [(0, 1), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((41636646 : Rat) / 21337981) [(0, 1), (8, 2), (9, 1), (15, 1)],
  term ((-20818323 : Rat) / 21337981) [(0, 1), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((-83273292 : Rat) / 21337981) [(0, 1), (8, 2), (13, 1), (15, 1)],
  term ((20818323 : Rat) / 21337981) [(0, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-83273292 : Rat) / 21337981) [(0, 1), (9, 2), (13, 1), (15, 1)],
  term ((20818323 : Rat) / 21337981) [(0, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((41636646 : Rat) / 21337981) [(0, 1), (9, 3), (15, 1)],
  term ((-20818323 : Rat) / 21337981) [(0, 1), (9, 3), (15, 1), (16, 1)],
  term ((-3350643624 : Rat) / 21337981) [(1, 1), (3, 1), (4, 1), (8, 1), (9, 1), (15, 1)],
  term ((6701287248 : Rat) / 21337981) [(1, 1), (3, 1), (4, 1), (8, 1), (13, 1), (15, 1)],
  term ((6701287248 : Rat) / 21337981) [(1, 1), (3, 1), (5, 1), (9, 1), (13, 1), (15, 1)],
  term ((-3350643624 : Rat) / 21337981) [(1, 1), (3, 1), (5, 1), (9, 2), (15, 1)],
  term ((1675321812 : Rat) / 21337981) [(1, 1), (3, 1), (8, 2), (9, 1), (15, 1)],
  term ((-3350643624 : Rat) / 21337981) [(1, 1), (3, 1), (8, 2), (13, 1), (15, 1)],
  term ((-3350643624 : Rat) / 21337981) [(1, 1), (3, 1), (9, 2), (13, 1), (15, 1)],
  term ((1675321812 : Rat) / 21337981) [(1, 1), (3, 1), (9, 3), (15, 1)],
  term ((5794559856 : Rat) / 21337981) [(1, 1), (3, 2), (4, 1), (8, 1), (9, 1)],
  term ((-11589119712 : Rat) / 21337981) [(1, 1), (3, 2), (4, 1), (8, 1), (13, 1)],
  term ((-11589119712 : Rat) / 21337981) [(1, 1), (3, 2), (5, 1), (9, 1), (13, 1)],
  term ((5794559856 : Rat) / 21337981) [(1, 1), (3, 2), (5, 1), (9, 2)],
  term ((-2897279928 : Rat) / 21337981) [(1, 1), (3, 2), (8, 2), (9, 1)],
  term ((5794559856 : Rat) / 21337981) [(1, 1), (3, 2), (8, 2), (13, 1)],
  term ((5794559856 : Rat) / 21337981) [(1, 1), (3, 2), (9, 2), (13, 1)],
  term ((-2897279928 : Rat) / 21337981) [(1, 1), (3, 2), (9, 3)],
  term ((135197442 : Rat) / 21337981) [(1, 1), (4, 1), (8, 1), (9, 1)],
  term ((-67598721 : Rat) / 21337981) [(1, 1), (4, 1), (8, 1), (9, 1), (16, 1)],
  term ((-270394884 : Rat) / 21337981) [(1, 1), (4, 1), (8, 1), (13, 1)],
  term ((67598721 : Rat) / 21337981) [(1, 1), (4, 1), (8, 1), (13, 1), (16, 1)],
  term ((-270394884 : Rat) / 21337981) [(1, 1), (5, 1), (9, 1), (13, 1)],
  term ((67598721 : Rat) / 21337981) [(1, 1), (5, 1), (9, 1), (13, 1), (16, 1)],
  term ((135197442 : Rat) / 21337981) [(1, 1), (5, 1), (9, 2)],
  term ((-67598721 : Rat) / 21337981) [(1, 1), (5, 1), (9, 2), (16, 1)],
  term ((-67598721 : Rat) / 21337981) [(1, 1), (8, 2), (9, 1)],
  term ((67598721 : Rat) / 42675962) [(1, 1), (8, 2), (9, 1), (16, 1)],
  term ((135197442 : Rat) / 21337981) [(1, 1), (8, 2), (13, 1)],
  term ((-67598721 : Rat) / 42675962) [(1, 1), (8, 2), (13, 1), (16, 1)],
  term ((135197442 : Rat) / 21337981) [(1, 1), (9, 2), (13, 1)],
  term ((-67598721 : Rat) / 42675962) [(1, 1), (9, 2), (13, 1), (16, 1)],
  term ((-67598721 : Rat) / 21337981) [(1, 1), (9, 3)],
  term ((67598721 : Rat) / 42675962) [(1, 1), (9, 3), (16, 1)],
  term ((-3782160864 : Rat) / 21337981) [(2, 1), (3, 1), (4, 1), (8, 1), (9, 1)],
  term ((7200366048 : Rat) / 21337981) [(2, 1), (3, 1), (4, 1), (8, 1), (9, 1), (15, 2)],
  term ((3964138704 : Rat) / 21337981) [(2, 1), (3, 1), (4, 1), (8, 1), (13, 1)],
  term ((-14400732096 : Rat) / 21337981) [(2, 1), (3, 1), (4, 1), (8, 1), (13, 1), (15, 2)],
  term ((3964138704 : Rat) / 21337981) [(2, 1), (3, 1), (5, 1), (9, 1), (13, 1)],
  term ((-14400732096 : Rat) / 21337981) [(2, 1), (3, 1), (5, 1), (9, 1), (13, 1), (15, 2)],
  term ((-3782160864 : Rat) / 21337981) [(2, 1), (3, 1), (5, 1), (9, 2)],
  term ((7200366048 : Rat) / 21337981) [(2, 1), (3, 1), (5, 1), (9, 2), (15, 2)],
  term ((1891080432 : Rat) / 21337981) [(2, 1), (3, 1), (8, 2), (9, 1)],
  term ((-3600183024 : Rat) / 21337981) [(2, 1), (3, 1), (8, 2), (9, 1), (15, 2)],
  term ((-1982069352 : Rat) / 21337981) [(2, 1), (3, 1), (8, 2), (13, 1)],
  term ((7200366048 : Rat) / 21337981) [(2, 1), (3, 1), (8, 2), (13, 1), (15, 2)],
  term ((-1982069352 : Rat) / 21337981) [(2, 1), (3, 1), (9, 2), (13, 1)],
  term ((7200366048 : Rat) / 21337981) [(2, 1), (3, 1), (9, 2), (13, 1), (15, 2)],
  term ((1891080432 : Rat) / 21337981) [(2, 1), (3, 1), (9, 3)],
  term ((-3600183024 : Rat) / 21337981) [(2, 1), (3, 1), (9, 3), (15, 2)],
  term ((2806176420 : Rat) / 21337981) [(2, 1), (4, 1), (8, 1), (9, 1), (15, 1)],
  term ((-163783098 : Rat) / 21337981) [(2, 1), (4, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-4957220448 : Rat) / 21337981) [(2, 1), (4, 1), (8, 1), (9, 1), (15, 3)],
  term ((-3133742616 : Rat) / 21337981) [(2, 1), (4, 1), (8, 1), (13, 1), (15, 1)],
  term ((163783098 : Rat) / 21337981) [(2, 1), (4, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((9914440896 : Rat) / 21337981) [(2, 1), (4, 1), (8, 1), (13, 1), (15, 3)],
  term ((-3133742616 : Rat) / 21337981) [(2, 1), (5, 1), (9, 1), (13, 1), (15, 1)],
  term ((163783098 : Rat) / 21337981) [(2, 1), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((9914440896 : Rat) / 21337981) [(2, 1), (5, 1), (9, 1), (13, 1), (15, 3)],
  term ((2806176420 : Rat) / 21337981) [(2, 1), (5, 1), (9, 2), (15, 1)],
  term ((-163783098 : Rat) / 21337981) [(2, 1), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-4957220448 : Rat) / 21337981) [(2, 1), (5, 1), (9, 2), (15, 3)],
  term ((-1403088210 : Rat) / 21337981) [(2, 1), (8, 2), (9, 1), (15, 1)],
  term ((81891549 : Rat) / 21337981) [(2, 1), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((2478610224 : Rat) / 21337981) [(2, 1), (8, 2), (9, 1), (15, 3)],
  term ((1566871308 : Rat) / 21337981) [(2, 1), (8, 2), (13, 1), (15, 1)],
  term ((-81891549 : Rat) / 21337981) [(2, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-4957220448 : Rat) / 21337981) [(2, 1), (8, 2), (13, 1), (15, 3)],
  term ((1566871308 : Rat) / 21337981) [(2, 1), (9, 2), (13, 1), (15, 1)],
  term ((-81891549 : Rat) / 21337981) [(2, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-4957220448 : Rat) / 21337981) [(2, 1), (9, 2), (13, 1), (15, 3)],
  term ((-1403088210 : Rat) / 21337981) [(2, 1), (9, 3), (15, 1)],
  term ((81891549 : Rat) / 21337981) [(2, 1), (9, 3), (15, 1), (16, 1)],
  term ((2478610224 : Rat) / 21337981) [(2, 1), (9, 3), (15, 3)],
  term ((2563091820 : Rat) / 21337981) [(3, 1), (4, 1), (8, 1), (9, 1)],
  term ((121239072 : Rat) / 21337981) [(3, 1), (4, 1), (8, 1), (9, 1), (13, 1), (15, 1)],
  term ((63298764 : Rat) / 3048283) [(3, 1), (4, 1), (8, 1), (9, 1), (14, 1)],
  term ((163783098 : Rat) / 21337981) [(3, 1), (4, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((-5450573952 : Rat) / 21337981) [(3, 1), (4, 1), (8, 1), (9, 1), (15, 2)],
  term ((-210563496 : Rat) / 21337981) [(3, 1), (4, 1), (8, 1), (9, 1), (16, 1)],
  term ((-3326092128 : Rat) / 21337981) [(3, 1), (4, 1), (8, 1), (13, 1)],
  term ((913908816 : Rat) / 21337981) [(3, 1), (4, 1), (8, 1), (13, 1), (14, 1)],
  term ((-163783098 : Rat) / 21337981) [(3, 1), (4, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((10901147904 : Rat) / 21337981) [(3, 1), (4, 1), (8, 1), (13, 1), (15, 2)],
  term ((210563496 : Rat) / 21337981) [(3, 1), (4, 1), (8, 1), (13, 1), (16, 1)],
  term ((-242478144 : Rat) / 21337981) [(3, 1), (4, 1), (8, 1), (13, 2), (15, 1)],
  term ((-3326092128 : Rat) / 21337981) [(3, 1), (5, 1), (9, 1), (13, 1)],
  term ((913908816 : Rat) / 21337981) [(3, 1), (5, 1), (9, 1), (13, 1), (14, 1)],
  term ((-163783098 : Rat) / 21337981) [(3, 1), (5, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((10901147904 : Rat) / 21337981) [(3, 1), (5, 1), (9, 1), (13, 1), (15, 2)],
  term ((210563496 : Rat) / 21337981) [(3, 1), (5, 1), (9, 1), (13, 1), (16, 1)],
  term ((-242478144 : Rat) / 21337981) [(3, 1), (5, 1), (9, 1), (13, 2), (15, 1)],
  term ((2563091820 : Rat) / 21337981) [(3, 1), (5, 1), (9, 2)],
  term ((121239072 : Rat) / 21337981) [(3, 1), (5, 1), (9, 2), (13, 1), (15, 1)],
  term ((63298764 : Rat) / 3048283) [(3, 1), (5, 1), (9, 2), (14, 1)],
  term ((163783098 : Rat) / 21337981) [(3, 1), (5, 1), (9, 2), (14, 1), (16, 1)],
  term ((-5450573952 : Rat) / 21337981) [(3, 1), (5, 1), (9, 2), (15, 2)],
  term ((-210563496 : Rat) / 21337981) [(3, 1), (5, 1), (9, 2), (16, 1)],
  term ((-1281545910 : Rat) / 21337981) [(3, 1), (8, 2), (9, 1)],
  term ((-60619536 : Rat) / 21337981) [(3, 1), (8, 2), (9, 1), (13, 1), (15, 1)],
  term ((-31649382 : Rat) / 3048283) [(3, 1), (8, 2), (9, 1), (14, 1)],
  term ((-81891549 : Rat) / 21337981) [(3, 1), (8, 2), (9, 1), (14, 1), (16, 1)],
  term ((2725286976 : Rat) / 21337981) [(3, 1), (8, 2), (9, 1), (15, 2)],
  term ((105281748 : Rat) / 21337981) [(3, 1), (8, 2), (9, 1), (16, 1)],
  term ((1663046064 : Rat) / 21337981) [(3, 1), (8, 2), (13, 1)],
  term ((-456954408 : Rat) / 21337981) [(3, 1), (8, 2), (13, 1), (14, 1)],
  term ((81891549 : Rat) / 21337981) [(3, 1), (8, 2), (13, 1), (14, 1), (16, 1)],
  term ((-5450573952 : Rat) / 21337981) [(3, 1), (8, 2), (13, 1), (15, 2)],
  term ((-105281748 : Rat) / 21337981) [(3, 1), (8, 2), (13, 1), (16, 1)],
  term ((121239072 : Rat) / 21337981) [(3, 1), (8, 2), (13, 2), (15, 1)],
  term ((1663046064 : Rat) / 21337981) [(3, 1), (9, 2), (13, 1)],
  term ((-456954408 : Rat) / 21337981) [(3, 1), (9, 2), (13, 1), (14, 1)],
  term ((81891549 : Rat) / 21337981) [(3, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((-5450573952 : Rat) / 21337981) [(3, 1), (9, 2), (13, 1), (15, 2)],
  term ((-105281748 : Rat) / 21337981) [(3, 1), (9, 2), (13, 1), (16, 1)],
  term ((121239072 : Rat) / 21337981) [(3, 1), (9, 2), (13, 2), (15, 1)],
  term ((-1281545910 : Rat) / 21337981) [(3, 1), (9, 3)],
  term ((-60619536 : Rat) / 21337981) [(3, 1), (9, 3), (13, 1), (15, 1)],
  term ((-31649382 : Rat) / 3048283) [(3, 1), (9, 3), (14, 1)],
  term ((-81891549 : Rat) / 21337981) [(3, 1), (9, 3), (14, 1), (16, 1)],
  term ((2725286976 : Rat) / 21337981) [(3, 1), (9, 3), (15, 2)],
  term ((105281748 : Rat) / 21337981) [(3, 1), (9, 3), (16, 1)],
  term ((-60659280 : Rat) / 21337981) [(3, 2), (4, 1), (8, 1), (9, 1), (13, 1)],
  term ((-2932930944 : Rat) / 21337981) [(3, 2), (4, 1), (8, 1), (9, 1), (15, 1)],
  term ((5865861888 : Rat) / 21337981) [(3, 2), (4, 1), (8, 1), (13, 1), (15, 1)],
  term ((121318560 : Rat) / 21337981) [(3, 2), (4, 1), (8, 1), (13, 2)],
  term ((5865861888 : Rat) / 21337981) [(3, 2), (5, 1), (9, 1), (13, 1), (15, 1)],
  term ((121318560 : Rat) / 21337981) [(3, 2), (5, 1), (9, 1), (13, 2)],
  term ((-60659280 : Rat) / 21337981) [(3, 2), (5, 1), (9, 2), (13, 1)],
  term ((-2932930944 : Rat) / 21337981) [(3, 2), (5, 1), (9, 2), (15, 1)],
  term ((30329640 : Rat) / 21337981) [(3, 2), (8, 2), (9, 1), (13, 1)],
  term ((1466465472 : Rat) / 21337981) [(3, 2), (8, 2), (9, 1), (15, 1)],
  term ((-2932930944 : Rat) / 21337981) [(3, 2), (8, 2), (13, 1), (15, 1)],
  term ((-60659280 : Rat) / 21337981) [(3, 2), (8, 2), (13, 2)],
  term ((-2932930944 : Rat) / 21337981) [(3, 2), (9, 2), (13, 1), (15, 1)],
  term ((-60659280 : Rat) / 21337981) [(3, 2), (9, 2), (13, 2)],
  term ((30329640 : Rat) / 21337981) [(3, 2), (9, 3), (13, 1)],
  term ((1466465472 : Rat) / 21337981) [(3, 2), (9, 3), (15, 1)],
  term ((35506406 : Rat) / 21337981) [(4, 1), (8, 1), (9, 1), (13, 1)],
  term ((-17753203 : Rat) / 21337981) [(4, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-1239305112 : Rat) / 21337981) [(4, 1), (8, 1), (9, 1), (14, 1), (15, 1)],
  term ((-31127238 : Rat) / 435469) [(4, 1), (8, 1), (9, 1), (15, 1)],
  term ((142964775 : Rat) / 21337981) [(4, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((4957220448 : Rat) / 21337981) [(4, 1), (8, 1), (9, 1), (15, 3)],
  term ((1239305112 : Rat) / 21337981) [(4, 1), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((1811164212 : Rat) / 21337981) [(4, 1), (8, 1), (13, 1), (15, 1)],
  term ((-142964775 : Rat) / 21337981) [(4, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-9914440896 : Rat) / 21337981) [(4, 1), (8, 1), (13, 1), (15, 3)],
  term ((-71012812 : Rat) / 21337981) [(4, 1), (8, 1), (13, 2)],
  term ((17753203 : Rat) / 21337981) [(4, 1), (8, 1), (13, 2), (16, 1)],
  term ((1239305112 : Rat) / 21337981) [(5, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((1811164212 : Rat) / 21337981) [(5, 1), (9, 1), (13, 1), (15, 1)],
  term ((-142964775 : Rat) / 21337981) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-9914440896 : Rat) / 21337981) [(5, 1), (9, 1), (13, 1), (15, 3)],
  term ((-71012812 : Rat) / 21337981) [(5, 1), (9, 1), (13, 2)],
  term ((17753203 : Rat) / 21337981) [(5, 1), (9, 1), (13, 2), (16, 1)],
  term ((35506406 : Rat) / 21337981) [(5, 1), (9, 2), (13, 1)],
  term ((-17753203 : Rat) / 21337981) [(5, 1), (9, 2), (13, 1), (16, 1)],
  term ((-1239305112 : Rat) / 21337981) [(5, 1), (9, 2), (14, 1), (15, 1)],
  term ((-31127238 : Rat) / 435469) [(5, 1), (9, 2), (15, 1)],
  term ((142964775 : Rat) / 21337981) [(5, 1), (9, 2), (15, 1), (16, 1)],
  term ((4957220448 : Rat) / 21337981) [(5, 1), (9, 2), (15, 3)],
  term ((-17753203 : Rat) / 21337981) [(8, 2), (9, 1), (13, 1)],
  term ((17753203 : Rat) / 42675962) [(8, 2), (9, 1), (13, 1), (16, 1)],
  term ((619652556 : Rat) / 21337981) [(8, 2), (9, 1), (14, 1), (15, 1)],
  term ((15563619 : Rat) / 435469) [(8, 2), (9, 1), (15, 1)],
  term ((-142964775 : Rat) / 42675962) [(8, 2), (9, 1), (15, 1), (16, 1)],
  term ((-2478610224 : Rat) / 21337981) [(8, 2), (9, 1), (15, 3)],
  term ((-619652556 : Rat) / 21337981) [(8, 2), (13, 1), (14, 1), (15, 1)],
  term ((-905582106 : Rat) / 21337981) [(8, 2), (13, 1), (15, 1)],
  term ((142964775 : Rat) / 42675962) [(8, 2), (13, 1), (15, 1), (16, 1)],
  term ((4957220448 : Rat) / 21337981) [(8, 2), (13, 1), (15, 3)],
  term ((35506406 : Rat) / 21337981) [(8, 2), (13, 2)],
  term ((-17753203 : Rat) / 42675962) [(8, 2), (13, 2), (16, 1)],
  term ((-619652556 : Rat) / 21337981) [(9, 2), (13, 1), (14, 1), (15, 1)],
  term ((-905582106 : Rat) / 21337981) [(9, 2), (13, 1), (15, 1)],
  term ((142964775 : Rat) / 42675962) [(9, 2), (13, 1), (15, 1), (16, 1)],
  term ((4957220448 : Rat) / 21337981) [(9, 2), (13, 1), (15, 3)],
  term ((35506406 : Rat) / 21337981) [(9, 2), (13, 2)],
  term ((-17753203 : Rat) / 42675962) [(9, 2), (13, 2), (16, 1)],
  term ((-17753203 : Rat) / 21337981) [(9, 3), (13, 1)],
  term ((17753203 : Rat) / 42675962) [(9, 3), (13, 1), (16, 1)],
  term ((619652556 : Rat) / 21337981) [(9, 3), (14, 1), (15, 1)],
  term ((15563619 : Rat) / 435469) [(9, 3), (15, 1)],
  term ((-142964775 : Rat) / 42675962) [(9, 3), (15, 1), (16, 1)],
  term ((-2478610224 : Rat) / 21337981) [(9, 3), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 15, terms 0 through 53. -/
theorem rs_R009_ueqv_R009YYYNN_block_15_0000_0053_valid :
    checkProductSumEq rs_R009_ueqv_R009YYYNN_partials_15_0000_0053
      rs_R009_ueqv_R009YYYNN_block_15_0000_0053 = true := by
  native_decide

end R009UeqvR009YYYNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
